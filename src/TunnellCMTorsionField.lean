import TunnellCMToricDivision
import TunnellCMTranscendental
import Mathlib.FieldTheory.Galois.Abelian

/-! Galois action on a cyclic CM division kernel and its field of coordinates. -/
namespace TunnellCMTorsionField

open TunnellCoates TunnellGaussianEnd TunnellKummer WeierstrassCurve
open LSG.Weierstrass TunnellCMToricDivision TunnellCMLemniscate Complex

noncomputable section

variable {F L : Type*} [Field F] [Field L] [Algebra F L] [DecidableEq F] [DecidableEq L]

def cm (n i:F) [(E n).IsElliptic] (hi:i^2= -1) (a : GaussianInt) :
    AddMonoid.End (CurvePoints (E n) L) := endo (baseI n i hi) a.re a.im

lemma cm_apply (n i:F) [(E n).IsElliptic] (hi:i^2= -1) (a : GaussianInt) (P : CurvePoints (E n) L) :
    cm n i hi a P=a.re • P+a.im • baseI n i hi P := rfl

lemma cm_comm (n i:F) [(E n).IsElliptic] (hi:i^2= -1) (a b : GaussianInt)
    (P : CurvePoints (E n) L) : cm n i hi a (cm n i hi b P) = cm n i hi b (cm n i hi a P) := by
  simp only [cm_apply,map_add,map_zsmul]
  module

lemma cm_act (n i:F) [(E n).IsElliptic] (hi:i^2= -1) (a : GaussianInt)
    (σ : L ≃ₐ[F] L) (P : CurvePoints (E n) L) :
    cm n i hi a (act (E n) σ P)=act (E n) σ (cm n i hi a P) := by
  simp [cm_apply,map_add,map_zsmul,act_baseI]

lemma cm_map {L' : Type*} [Field L'] [DecidableEq L'] [Algebra F L'] (f : L →ₐ[F] L')
    (n i : F) [(E n).IsElliptic] (hi:i^2= -1) (a : GaussianInt) (P : CurvePoints (E n) L) :
    (Affine.Point.map (W' := (E n).toAffine) f) (cm n i hi a P) =
    cm n i hi a (Affine.Point.map (W' := (E n).toAffine) f P) := by
  have ei : (Affine.Point.map (W' := (E n).toAffine) f) (baseI n i hi P) =
      baseI n i hi (Affine.Point.map (W' := (E n).toAffine) f P) := by
    cases P with
    | zero => rfl
    | some x y h =>
      change Affine.Point.some _ _ _ = Affine.Point.some _ _ _
      rw [Affine.Point.some.injEq]
      exact ⟨map_neg f _,by simp only [map_mul,f.commutes]⟩
  simp only [cm_apply,map_add,map_zsmul,ei]

def coordField (W : WeierstrassCurve F) : CurvePoints W L → IntermediateField F L
  | .zero => ⊥
  | .some x y _ => IntermediateField.adjoin F {x,y}

lemma point_rational (W : WeierstrassCurve F) (P : CurvePoints W L) :
    P ∈ rationalPoints W (coordField W P) := by
  cases P with
  | zero => exact (rationalPoints W _).zero_mem
  | some x y h =>
    exact (rationalPoints_some W h).mpr
      ⟨IntermediateField.subset_adjoin F _ (by simp),IntermediateField.subset_adjoin F _ (by simp)⟩

theorem abelian_of_cyclic [Normal F L] [CharZero F] (n i:F) [(E n).IsElliptic]
    (hi:i^2= -1) (a : GaussianInt) (T : CurvePoints (E n) L) (hT : cm n i hi a T=0)
    (hgen : ∀ P, cm n i hi a P=0 → ∃ b, cm n i hi b T=P) :
    IsAbelianGalois F (coordField (E n) T) := by
  let W := E n
  let K := coordField W T
  have ht : (cm n i hi a).ker ≤ rationalPoints W K := by
    intro P hp
    obtain ⟨b,rfl⟩ := hgen P hp
    obtain ⟨R,hR⟩ := point_rational W T
    exact ⟨cm n i hi b R,by rw [cm_map,hR]⟩
  have hn : Normal F K := by
    cases T with
    | zero => exact inferInstanceAs (Normal F (⊥ : IntermediateField F L))
    | some x y h =>
      apply divisionField_normal W (cm n i hi a) (cm_act n i hi a) h _ ht
      intro σ
      change act (E n) σ (cm n i hi a _) = cm n i hi a _
      rw [hT,map_zero]
  have hg : IsGalois F K := ⟨⟩
  have hfix (σ τ : Gal(L/F)) : act W (σ*τ) T=act W (τ*σ) T := by
    obtain ⟨b,hb⟩ := hgen (act W σ T) (by rw [cm_act,hT,map_zero])
    obtain ⟨c,hc⟩ := hgen (act W τ T) (by rw [cm_act,hT,map_zero])
    rw [act_mul,act_mul,← hc,← hb,← cm_act,← cm_act,← hc,← hb,cm_comm]
  refine { is_comm.comm := ?_ }
  intro σ τ
  obtain ⟨s,rfl⟩ := AlgEquiv.restrictNormalHom_surjective L σ
  obtain ⟨t,rfl⟩ := AlgEquiv.restrictNormalHom_surjective L τ
  rw [← map_mul,← map_mul]
  ext z
  rw [AlgEquiv.restrictNormalHom_apply,AlgEquiv.restrictNormalHom_apply]
  have hz := z.property
  change z.val∈coordField W T at hz
  have he := hfix s t
  cases T with
  | zero =>
    obtain ⟨k,hk⟩ := IntermediateField.mem_bot.mp hz
    rw [← hk]; simp
  | some x y h =>
    have hxy := Affine.Point.some.inj he
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

end
end TunnellCMTorsionField

#print axioms TunnellCMTorsionField.abelian_of_cyclic
