import TunnellNormScalar

/-! Extraction of the nonzero tame character on the first division field directly from a nonabelian Kummer lift. -/
namespace TunnellOnePrimeCharacter
open WeierstrassCurve WeierstrassCurve.Affine TunnellKummer TunnellCyclicKummerCharacter TunnellNormScalar
open LocalClassFieldTheory LocalFieldTheory LocalFieldTheory.IsNonarchimedeanLocalField
open scoped ValuativeRel Classical
noncomputable section
variable {F T D N:Type} [Field F] [Field T] [Field D] [Field N] [Algebra F T] [Algebra F D] [Algebra F N]
  [Algebra T D] [Algebra D N] [IsScalarTower F T D] [IsScalarTower F D N]

theorem restrict_point (W:WeierstrassCurve F) (g:Gal(D/F)) (d:Gal(T/F))
    (h:∀x:T,g (algebraMap T D x)=algebraMap T D (d x)) (Z:CurvePoints W T) :
    act W g (Point.map (W':=W.toAffine) (IsScalarTower.toAlgHom F T D) Z)=
      Point.map (W':=W.toAffine) (IsScalarTower.toAlgHom F T D) (act W d Z) := by
  cases Z with
  | zero=>rfl
  | some x y hh=>exact (Point.some.injEq ..).mpr ⟨h x,h y⟩

theorem fixed_point (W:WeierstrassCurve F) (g:Gal(D/T)) (Z:CurvePoints W T) :
    act W (g.restrictScalars F) (Point.map (W':=W.toAffine) (IsScalarTower.toAlgHom F T D) Z)=
      Point.map (W':=W.toAffine) (IsScalarTower.toAlgHom F T D) Z := by
  cases Z with
  | zero=>rfl
  | some x y hh=>exact (Point.some.injEq ..).mpr ⟨g.commutes x,g.commutes y⟩

variable [ValuativeRel F] [ValuativeRel T] [ValuativeRel D] [TopologicalSpace T] [TopologicalSpace D]
  [IsNonarchimedeanLocalField T] [IsNonarchimedeanLocalField D]
  [Valuation.HasExtension (ValuativeRel.valuation F) (ValuativeRel.valuation T)] [IsIntegralClosure 𝒪[T] 𝒪[F] T]
  [Valuation.HasExtension (ValuativeRel.valuation F) (ValuativeRel.valuation D)] [IsIntegralClosure 𝒪[D] 𝒪[F] D]
  [FiniteDimensional F T] [FiniteDimensional T D] [FiniteDimensional F D] [FiniteDimensional D N]
  [Normal F T] [IsAbelianGalois F D] [IsGalois F N]

theorem character (W:WeierstrassCurve F) {p r:ℕ} [Fact p.Prime] (hp:p≠2) (hr:r≠0)
    (Z:CurvePoints W T) (S:CurvePoints W D) (ho:addOrderOf S=p^r) (hz:addOrderOf Z=p)
    (hm:Point.map (W':=W.toAffine) (IsScalarTower.toAlgHom F T D) Z∈AddSubgroup.zmultiples S)
    (e:Gal(D/F)≃*(ZMod (p^r))ˣ) (he:∀ (d:Gal(D/F)) (k:ℤ),act W d S=k • S ↔ (e d:ZMod (p^r))=k)
    (φ:CurvePoints W N→+CurvePoints W N) (Q:CurvePoints W N)
    (hφ:∀ (σ:Gal(N/F)) x,φ (act W σ x)=act W σ (φ x)) (hP:∀σ:Gal(N/F),act W σ (φ Q)=φ Q)
    (hgen:∀x,φ x=0 → x∈AddSubgroup.zmultiples (Point.map (W':=W.toAffine) (IsScalarTower.toAlgHom F D N) S))
    {x y:N} (hh:(W.baseChange N).toAffine.Nonsingular x y) (hQ:Q=.some x y hh)
    (hxy:IntermediateField.adjoin D {x,y}=⊤) (hn:¬IsAbelianGalois F N) :
    ∃ (d:Gal(T/F)) (k:ℕ) (c:(ZMod p)ˣ) (b:Additive Tˣ→+ZMod p),
      orderOf c=p-1 ∧ (k:ZMod p)=c ∧ act W d Z=k • Z ∧
      (∃ u:𝒪[T]ˣ,b (Additive.ofMul (integerUnitsToFieldUnits T u))≠0) ∧
      (∀ a:Nˣ,b (Additive.ofMul (normUnits T D (normUnits D N a)))=0) ∧
      (∀ u:Tˣ,b (Additive.ofMul (Units.map d.toMonoidHom u))=(c:ZMod p)*b (Additive.ofMul u)) := by
  let fs:=Point.map (W':=W.toAffine) (IsScalarTower.toAlgHom F D N)
  let fz:=Point.map (W':=W.toAffine) (IsScalarTower.toAlgHom F T D)
  obtain ⟨α,hs,ha,hα⟩:=kummer_character hn W φ Q (fs S) hφ hP hgen (fun g=>fixed_point W g S)
    hh hQ hxy ((addOrderOf_injective fs (Point.map_injective _) S).trans ho)
  have hsα (g:Gal(D/F)) (k:ℤ) (hk:act W g S=k • S) (x:Dˣ) :
      α (Additive.ofMul (Units.map g.toMonoidHom x))=(k:ZMod p)*α (Additive.ofMul x) := by
    obtain ⟨σ,hσ,hk'⟩:=action_on_lift (M:=N) W S g k hk
    exact hα g σ hσ (TunnellNormDescent.galois_valuation_compatible F D g) k hk' x
  obtain ⟨d,g,k,c,b,hc,hk,hz',hgd,hu,hb,hd⟩:=tame_descent W S (fz Z) hm hp hr
    ((addOrderOf_injective fz (Point.map_injective _) Z).trans hz) (fun g=>fixed_point W g Z) e he α hs hsα
  refine ⟨d,k,c,b,hc,hk,(Point.map_injective (W':=W.toAffine) (IsScalarTower.toAlgHom F T D)) ?_,hu,fun a=>?_,hd⟩
  · rw [←restrict_point W g d hgd,map_nsmul]
    exact hz'
  · rw [hb,ha]

#print axioms character
end
end TunnellOnePrimeCharacter
