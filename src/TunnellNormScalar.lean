import TunnellFullScalarAction
import TunnellCyclicNormDescent
import TunnellCyclicKummerCharacter

/-! Choosing the tame generator and removing the wild part of the division character. -/
namespace TunnellNormScalar
open TunnellKummer TunnellFullScalarAction LocalClassFieldTheory LocalFieldTheory LocalFieldTheory.IsNonarchimedeanLocalField
open scoped ValuativeRel
noncomputable section

theorem action_on_lift {F L M:Type} [Field F] [Field L] [Field M] [Algebra F L] [Algebra F M]
    [Algebra L M] [IsScalarTower F L M] [Normal F L] [Normal F M] [DecidableEq L] [DecidableEq M]
    (W:WeierstrassCurve F) (S:CurvePoints W L) (d:Gal(L/F)) (k:ℤ) (hk:act W d S=k • S) :
    ∃ σ:Gal(M/F), (∀ x:L,σ (algebraMap L M x)=algebraMap L M (d x)) ∧
      act W σ (WeierstrassCurve.Affine.Point.map (W':=W.toAffine) (IsScalarTower.toAlgHom F L M) S)=
        k • WeierstrassCurve.Affine.Point.map (W':=W.toAffine) (IsScalarTower.toAlgHom F L M) S := by
  obtain ⟨σ,hσ⟩:=AlgEquiv.restrictNormalHom_surjective M d
  have hh (x:L):σ (algebraMap L M x)=algebraMap L M (d x) := by
    rw [←AlgEquiv.restrictNormal_commutes σ L]
    exact congrArg (fun z:Gal(L/F) => algebraMap L M (z x)) hσ
  refine ⟨σ,hh,?_⟩
  rw [←map_zsmul,←hk]
  cases S with
  | zero => rfl
  | some x y h =>
    change WeierstrassCurve.Affine.Point.some _ _ _=WeierstrassCurve.Affine.Point.some _ _ _
    exact WeierstrassCurve.Affine.Point.some.injEq _ _ _ _ _ _ |>.mpr ⟨hh x,hh y⟩

theorem lower_scalar {A:Type*} [AddCommGroup A] (f:A→+A) {S Z:A} (hz:Z∈AddSubgroup.zmultiples S)
    {k:ℤ} (h:f S=k • S) : f Z=k • Z := by
  obtain ⟨m,rfl⟩ := AddSubgroup.mem_zmultiples_iff.mp hz
  rw [map_zsmul,h,smul_comm]

variable {F T L:Type} [Field F] [ValuativeRel F] [Field T] [ValuativeRel T] [TopologicalSpace T]
    [IsNonarchimedeanLocalField T] [Field L] [Algebra F T] [Algebra F L] [Algebra T L] [IsScalarTower F T L]
    [Valuation.HasExtension (ValuativeRel.valuation F) (ValuativeRel.valuation T)] [IsIntegralClosure 𝒪[T] 𝒪[F] T]
    [FiniteDimensional F T] [FiniteDimensional T L] [IsAbelianGalois F L] [Normal F T] [DecidableEq L]

theorem tame_descent (W:WeierstrassCurve F) (S Z:CurvePoints W L) (hz:Z∈AddSubgroup.zmultiples S)
    {p r:ℕ} [Fact p.Prime] (hp₂:p≠2) (hr:r≠0) (ho:addOrderOf Z=p)
    (hfix:∀ g:Gal(L/T), act W (g.restrictScalars F) Z=Z)
    (e:Gal(L/F)≃*(ZMod (p^r))ˣ)
    (he:∀ (g:Gal(L/F)) (k:ℤ),act W g S=k • S ↔ (e g:ZMod (p^r))=k)
    (α:Additive Lˣ→+ZMod p) (ha:Function.Surjective α)
    (hα:∀ (g:Gal(L/F)) (k:ℤ), act W g S=k • S → ∀ x:Lˣ,
      α (Additive.ofMul (Units.map g.toMonoidHom x))=(k:ZMod p)*α (Additive.ofMul x)) :
    ∃ (D:Gal(T/F)) (d:Gal(L/F)) (k:ℕ) (c:(ZMod p)ˣ) (β:Additive Tˣ→+ZMod p),
      orderOf c=p-1 ∧ (k:ZMod p)=c ∧ act W d Z=k • Z ∧
      (∀x:T,d (algebraMap T L x)=algebraMap T L (D x)) ∧
      (∃ u:𝒪[T]ˣ,β (Additive.ofMul (integerUnitsToFieldUnits T u))≠0) ∧
      (∀ x:Lˣ,β (Additive.ofMul (normUnits T L x))=α (Additive.ofMul x)) ∧
      ∀ x:Tˣ,β (Additive.ofMul (Units.map D.toMonoidHom x))=(c:ZMod p)*β (Additive.ofMul x) := by
  have hp:= (Fact.out:p.Prime)
  haveI : NeZero (p^r) := ⟨pow_ne_zero _ hp.ne_zero⟩
  haveI : IsCyclic (ZMod (p^r))ˣ := ZMod.isCyclic_units_of_prime_pow p hp hp₂ r
  haveI : IsCyclic Gal(L/F) := isCyclic_of_injective e.toMonoidHom e.injective
  haveI : IsCyclic Gal(L/T) := isCyclic_of_injective (AlgEquiv.restrictScalarsHom F) (AlgEquiv.restrictScalars_injective F)
  obtain ⟨s,hs⟩ := IsCyclic.exists_generator (α:=Gal(L/T))
  obtain ⟨c,hc⟩ := isCyclic_iff_exists_orderOf_eq_natCard.mp (ZMod.isCyclic_units_prime hp)
  rw [Nat.card_eq_fintype_card,ZMod.card_units] at hc
  have hpn:p∣p^r := dvd_pow_self p hr
  obtain ⟨b,hb⟩:=ZMod.unitsMap_surjective hpn c
  let d:=e.symm b
  let k:ℕ:=(b:ZMod (p^r)).val
  have hek:(e d:ZMod (p^r))=(k:ℤ) := by simp [d,k]
  have hact := (he d k).mpr hek
  have hk:(k:ZMod p)=c := by
    have heq := congrArg (fun z:(ZMod (p^r)) => ZMod.castHom hpn (ZMod p) z) hek
    rw [map_intCast,Int.cast_natCast] at heq
    exact heq.symm.trans (by change ((ZMod.unitsMap hpn (e d)) : ZMod p)=_; rw [show e d=b from e.apply_symm_apply b,hb])
  let D:=d.restrictNormal T
  have hh (x:T):d (algebraMap T L x)=algebraMap T L (D x) := (AlgEquiv.restrictNormal_commutes d T x).symm
  have hc₁ : (c:ZMod p)≠1 := by
    intro h
    have h' : c=1 := Units.ext h
    rw [h',orderOf_one] at hc
    have := hp.two_le; omega
  have hsα (x:Lˣ) : α (Additive.ofMul (Units.map s.toMonoidHom x))=α (Additive.ofMul x) := by
    let g:=s.restrictScalars F
    let j:ℕ:=(e g:ZMod (p^r)).val
    have hj:= (he g j).mpr (show (e g:ZMod (p^r))=(j:ℤ) by simp [j])
    have hzj:=lower_scalar (act W g) hz hj
    have hj₁:((j:ℤ):ZMod p)=1 := by
      have eq : (j:ℤ) • Z=(1:ℤ) • Z := by rw [←hzj,hfix,one_zsmul]
      simpa using (scalar_iff Z ho _ _).mp eq
    exact (hα g j hj x).trans (by rw [hj₁,one_mul])
  obtain ⟨β,hunit,hnorm,hD⟩ := TunnellCyclicNormDescent.first_level s hs D d hh (c:ZMod p) hc₁ α ha hsα
    (fun x => (hα d k hact x).trans (by rw [Int.cast_natCast,hk]))
  exact ⟨D,d,k,c,β,hc,hk,by simpa using lower_scalar (act W d) hz hact,hh,hunit,hnorm,hD⟩

#print axioms action_on_lift
#print axioms tame_descent
end
end TunnellNormScalar
