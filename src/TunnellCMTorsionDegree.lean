import TunnellCMDivisionExtension
import TunnellCMTorsionOrder
import Mathlib.GroupTheory.SpecificGroups.Cyclic

/-! Global upper degree of the field of division by a power of a Gaussian prime. -/
namespace TunnellCMTorsionDegree

open TunnellCoates TunnellKummer TunnellGaussianEnd TunnellCMTorsionField TunnellCMDivisionExtension
open WeierstrassCurve Complex LSG.Weierstrass TunnellCMLemniscate TunnellCMToricDivision

noncomputable section
variable {F L : Type*} [Field F] [Field L] [Algebra F L] [DecidableEq F] [DecidableEq L]

lemma restrict_eq (W : WeierstrassCurve F) (T : CurvePoints W L) [Normal F (coordField W T)]
    (s t : Gal(L/F)) (h : act W s T=act W t T) :
    AlgEquiv.restrictNormalHom (coordField W T) s=AlgEquiv.restrictNormalHom (coordField W T) t := by
  ext z
  rw [AlgEquiv.restrictNormalHom_apply,AlgEquiv.restrictNormalHom_apply]
  have hz := z.property
  cases T with
  | zero =>
    obtain ⟨k,hk⟩ := IntermediateField.mem_bot.mp hz
    rw [← hk]; simp
  | some x y he =>
    have hxy := Affine.Point.some.inj h
    change z.val∈IntermediateField.adjoin F {x,y} at hz
    generalize z.val = v at *
    induction hz using IntermediateField.adjoin_induction with
    | mem u hu =>
      rcases hu with (rfl|hu)
      · exact hxy.1
      · obtain rfl := Set.mem_singleton_iff.mp hu; exact hxy.2
    | algebraMap k => simp
    | add _ _ _ _ h1 h2 => simp only [map_add,h1,h2]
    | mul _ _ _ _ h1 h2 => simp only [map_mul,h1,h2]
    | inv _ _ hh => simp only [map_inv₀,hh]

theorem degree_bound [Normal F L] (W : WeierstrassCurve F) (T : CurvePoints W L)
    [FiniteDimensional F (coordField W T)] [IsGalois F (coordField W T)]
    {m : ℕ} (hm : 0 < m) (hord : addOrderOf T=m)
    (h : ∀ σ : Gal(L/F), ∃ k : ℤ, k • T=act W σ T) :
    Module.finrank F (coordField W T) ≤ m.totient := by
  classical
  let K := coordField W T
  let H := AddSubgroup.zmultiples T
  have hcard : Nat.card H=m := (Nat.card_zmultiples T).trans hord
  letI : Finite H := Nat.finite_of_card_ne_zero (hcard.trans_ne hm.ne')
  letI : Fintype H := Fintype.ofFinite _
  let lift (σ : Gal(K/F)) := (AlgEquiv.restrictNormalHom_surjective L σ).choose
  have spec (σ : Gal(K/F)) : AlgEquiv.restrictNormalHom K (lift σ)=σ :=
    (AlgEquiv.restrictNormalHom_surjective L σ).choose_spec
  let eval (σ : Gal(K/F)) : H := ⟨act W (lift σ) T,AddSubgroup.mem_zmultiples_iff.mpr (h _)⟩
  have he (σ : Gal(K/F)) : addOrderOf (eval σ)=m := by
    have hie := Affine.Point.map_injective (W' := W.toAffine) (lift σ).toAlgHom
    rw [← addOrderOf_injective H.subtype Subtype.val_injective]
    change addOrderOf (act W (lift σ) T)=m
    exact (addOrderOf_injective (act W (lift σ)) hie T).trans hord
  let S := Finset.univ.filter (fun x : H => addOrderOf x=m)
  let f (σ : Gal(K/F)) : S := ⟨eval σ,Finset.mem_filter.mpr ⟨Finset.mem_univ _, he σ⟩⟩
  have hf : Function.Injective f := by
    intro s t hst
    have e := congrArg (fun x : S => x.val.val) hst
    exact (spec s).symm.trans ((restrict_eq W T _ _ e).trans (spec t))
  have hle := Nat.card_le_card_of_injective _ hf
  have hc : S.card=m.totient := IsAddCyclic.card_addOrderOf_eq_totient
    (show m∣Fintype.card H by rw [← Nat.card_eq_fintype_card,hcard])
  rw [← IsGalois.card_aut_eq_finrank F K]
  simpa only [Nat.card_eq_fintype_card (α := S),Fintype.card_coe,hc] using hle

lemma split_on_model {W : WeierstrassCurve ℂ} [W.IsElliptic] (n : ℕ) (hn : 0<n)
    (e : W=E (n:ℂ)) {p : ℕ} (hp : p.Prime) (h2 : p≠2) {a : GaussianInt}
    (ha : a.norm.natAbs=p) (r : ℕ) : ∃ T : W.toAffine.Point,
      endo (quarter e I I_sq) (a^r).re (a^r).im T=0 ∧ addOrderOf T=p^r ∧
      ∀ P, endo (quarter e I I_sq) (a^r).re (a^r).im P=0 → ∃ k : ℤ, k • T=P := by
  have e' : W=curve (twistPeriods n hn) := e.trans (curve_eq n hn).symm
  cases e'
  exact TunnellCMTorsionOrder.split_generator n hn hp h2 ha r

theorem split_field [CharZero F] [Algebra F ℂ] (n : ℕ) (hn : 0<n) [(E (n:F)).IsElliptic]
    (i : F) (hi : i^2= -1) (hI : algebraMap F ℂ i=I) {p : ℕ} (hp : p.Prime)
    (h2 : p≠2) {a : GaussianInt} (ha : a.norm.natAbs=p) (r : ℕ) :
    ∃ T : CurvePoints (E (n:F)) (algebraicClosure F ℂ),
      cm (n:F) i hi (a^r) T=0 ∧ addOrderOf T=p^r ∧
      (∀ P, cm (n:F) i hi (a^r) P=0 → ∃ k : ℤ, k • T=P) ∧
      IsAbelianGalois F (coordField (E (n:F)) T) ∧
      FiniteDimensional F (coordField (E (n:F)) T) ∧
      Module.finrank F (coordField (E (n:F)) T)≤(p^r).totient := by
  classical
  let A := algebraicClosure F ℂ
  let W := E (n:F)
  let f := Affine.Point.map (W' := W.toAffine) A.val
  have hf := Affine.Point.map_injective (W' := W.toAffine) A.val
  have hW : W.baseChange ℂ=E (n:ℂ) := by dsimp [W]; rw [base_E,map_natCast]
  letI : (W.baseChange ℂ).IsElliptic := inferInstanceAs ((W.map (algebraMap F ℂ)).IsElliptic)
  have he : baseI (L := ℂ) (n:F) i hi=quarter hW I I_sq := by
    ext P
    cases P with
    | zero => rfl
    | some x y hh =>
      change Affine.Point.some _ _ _=Affine.Point.some _ _ _
      rw [Affine.Point.some.injEq]
      exact ⟨rfl,congrArg (·*y) hI⟩
  obtain ⟨T,hT,ho,ht⟩ := split_on_model n hn hW hp h2 ha r
  rw [← he] at hT ht
  have ha0 : a≠0 := by intro h; subst a; exact hp.ne_zero (by simpa using ha.symm)
  obtain ⟨U,hU⟩ := rational_kernel n hn i hi (a^r) (pow_ne_zero r ha0) T hT
  have u0 : cm (n:F) i hi (a^r) U=0 := hf (by rw [cm_map,hU]; exact hT.trans (map_zero _).symm)
  have uo : addOrderOf U=p^r := by rw [← addOrderOf_injective _ hf U,hU,ho]
  have ug (P : CurvePoints W A) (hP : cm (n:F) i hi (a^r) P=0) : ∃ k : ℤ, k • U=P := by
    have hh : cm (n:F) i hi (a^r) (f P)=0 := by
      change cm (n:F) i hi (a^r) (Affine.Point.map A.val P)=0
      rw [← cm_map,hP,map_zero]
    obtain ⟨k,hk⟩ := ht (f P) hh
    refine ⟨k,hf ?_⟩
    rw [map_zsmul,hU]
    exact hk
  let K := coordField W U
  have hg : IsAbelianGalois F K := abelian_of_cyclic (n:F) i hi (a^r) U u0 (by
    intro P hP
    obtain ⟨k,rfl⟩ := ug P hP
    exact ⟨(k:GaussianInt),by simp only [cm_apply,Zsqrtd.re_intCast,Zsqrtd.im_intCast,zero_zsmul,add_zero]⟩)
  have hfin : FiniteDimensional F K := by
    cases U with
    | zero => exact inferInstanceAs (FiniteDimensional F (⊥ : IntermediateField F A))
    | some x y hh =>
      change FiniteDimensional F (IntermediateField.adjoin F ({x,y}:Set A))
      exact IntermediateField.finiteDimensional_adjoin (fun z _ => (Algebra.IsAlgebraic.isAlgebraic (R := F) z).isIntegral)
  refine ⟨U,u0,uo,ug,hg,hfin,degree_bound W U (pow_pos hp.pos r) uo ?_⟩
  intro σ
  apply ug
  rw [cm_act,u0,map_zero]

end
end TunnellCMTorsionDegree

#print axioms TunnellCMTorsionDegree.split_field
