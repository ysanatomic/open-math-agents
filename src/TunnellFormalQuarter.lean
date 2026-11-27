import TunnellLocalCM
import TunnellFormalPrimitivePoint
import TunnellPreparedHasse

/-! # The Gaussian action on the integral parameter of a congruent-number curve -/
namespace TunnellFormalQuarter

open IsLocalRing IsDedekindDomain IsDedekindDomain.HeightOneSpectrum WeierstrassCurve WeierstrassCurve.Affine
open TunnellCoates ChabautyColeman

section General
variable {O : Type*} [CommRing O] [IsLocalRing O] [UniformSpace O] [Fact (IsAdic (maximalIdeal O))]
    [IsUniformAddGroup O] [CompleteSpace O] [T2Space O] [IsTopologicalRing O]

lemma w_quarter (n i : O) (hi : i^2 = -1) (t : O) (ht : t∈maximalIdeal O) :
    (E n).wEval (i*t) = -i*(E n).wEval t := by
  let w := (E n).wEval t
  have h := (E n).wEval_eq ht
  change w=(E n).wPoly t w at h
  have hm := (maximalIdeal O).mul_mem_left i ht
  apply (E n).eq_of_wPoly_fixed hm ((E n).wEval_mem hm) ((maximalIdeal O).mul_mem_left (-i) ((E n).wEval_mem ht)) ((E n).wEval_eq hm)
  change -i*w=(E n).wPoly (i*t) (-i*w)
  simp only [WeierstrassCurve.wPoly,E,zero_mul,add_zero] at h ⊢
  linear_combination -i * h + (-i * t^3 + n^2*i*t*w^2) * hi

noncomputable def quarterParam (n i : O) (Z : (E n).formalGroupLaw.Points) : (E n).formalGroupLaw.Points :=
  fun _ => ⟨i*(Z ():O), (maximalIdeal O).mul_mem_left _ (Z ()).2⟩

end General

variable {R K:Type*} [CommRing R] [IsDedekindDomain R] [Field K] [CharZero K] [Algebra R K] [IsFractionRing R K]
    {v : HeightOneSpectrum R} [DecidableEq (v.adicCompletion K)]
local notation "O" => v.adicCompletionIntegers K
local notation "L" => v.adicCompletion K

lemma base_curve (n : O) : (E n).map (algebraMap O L) = E (n:L) := by
  ext <;> simp [E,WeierstrassCurve.map]

noncomputable def toPoint (n : O) [(E (n:L)).IsElliptic] : (E n).formalGroupLaw.Points →+ (E (n:L)).toAffine.Point where
  toFun := formalPoint (base_curve n)
  map_zero' := formalPoint_of_param_eq_zero (base_curve n) (z:=0) rfl
  map_add' := formalPoint_add (base_curve n)

lemma quarter_toPoint (n i : O) (hi : i^2= -1) [(E (n:L)).IsElliptic] (Z : (E n).formalGroupLaw.Points) :
    toPoint n (quarterParam n i Z) = TunnellLocalCM.gaussianI (n:L) (i:L) (by exact_mod_cast hi) (toPoint n Z) := by
  let f := algebraMap O L
  have hiL : (i:L)^2= -1 := by exact_mod_cast hi
  have hi₀ : i≠0 := by rintro rfl; simpa using hi
  have hi₁ : (i:L)≠0 := by exact_mod_cast hi₀
  change formalPoint (base_curve n) _ = TunnellLocalCM.gaussianI _ _ _ (formalPoint (base_curve n) _)
  by_cases hz : (Z ():O)=0
  · rw [formalPoint_of_param_eq_zero (base_curve n) hz, map_zero,
        formalPoint_of_param_eq_zero (base_curve n) (z:=quarterParam n i Z) (by change i*(Z ():O)=0; rw [hz,mul_zero])]
  have hq : (quarterParam n i Z ():O)≠0 := mul_ne_zero hi₀ hz
  rw [formalPoint_of_param_ne_zero (base_curve n) hz, formalPoint_of_param_ne_zero (base_curve n) hq]
  change Affine.Point.some _ _ _ = Affine.Point.some _ _ _
  rw [Affine.Point.some.injEq]
  change (↑(i*(Z ():O)):L)/((E n).wEval (i*(Z ():O)):L) = -(((Z ():O):L)/((E n).wEval (Z ():O):L)) ∧
    -1/((E n).wEval (i*(Z ():O)):L)=(i:L)*(-1/((E n).wEval (Z ():O):L))
  rw [w_quarter n i hi _ (Z ()).2]
  push_cast
  have hw : ((E n).wEval (Z ():O):L)≠0 := by exact_mod_cast (E n).wEval_ne_zero (Z ()).2 hz
  constructor <;> field_simp <;> ring_nf <;> rw [hiL] <;> ring

#print axioms quarter_toPoint
end TunnellFormalQuarter
