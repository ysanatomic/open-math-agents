import TunnellCoates

/-! # Explicit complex multiplication by Gaussian integers on congruent-number curves -/

namespace TunnellLocalCM

open TunnellCoates

open WeierstrassCurve WeierstrassCurve.Affine

variable {K : Type*} [Field K] [DecidableEq K] (n i : K) (hi : i^2 = -1) [(E n).IsElliptic]

include hi in
private lemma inn : i≠0 := by
  intro h
  rw [h,zero_pow (by decide)] at hi
  simpa using hi

include hi in
private lemma ini : i⁻¹ = -i := by
  apply inv_eq_of_mul_eq_one_right
  linear_combination -hi

noncomputable def cmI : (E n).toAffine.Point → (E n).toAffine.Point
  | .zero => .zero
  | .some x y H => Affine.Point.mk ((E_equation n (-x) (i*y)).mpr (by
      rw [mul_pow, hi, (E_equation n x y).mp H.1]
      ring))

lemma cm_negY (x y : K) : (E n).toAffine.negY x y = -y := by simp [E,Affine.negY]

include hi in
lemma cm_slope (x z y t : K) :
    (E n).toAffine.slope (-x) (-z) (i*y) (i*t) = -i*(E n).toAffine.slope x z y t := by
  by_cases h : x=z
  · subst z
    by_cases ht : y = -t
    · rw [Affine.slope_of_Y_eq rfl (by simp only [cm_negY,ht,mul_neg]), Affine.slope_of_Y_eq rfl (by simpa only [cm_negY] using ht)]
      simp
    · have ht' : i*y ≠ (E n).toAffine.negY (-x) (i*t) := by
        rw [cm_negY, ← mul_neg, ne_eq, mul_right_inj' (inn i hi)]
        exact ht
      rw [Affine.slope_of_Y_ne rfl ht', Affine.slope_of_Y_ne rfl (by simpa only [cm_negY] using ht)]
      simp only [cm_negY]
      simp only [E,mul_zero,zero_mul,sub_zero,add_zero,sub_neg_eq_add,neg_sq,
        ← mul_add,div_eq_mul_inv, mul_inv_rev, ini i hi]
      ring
  · rw [Affine.slope_of_X_ne (fun e => h (neg_inj.mp e)), Affine.slope_of_X_ne h]
    rw [← mul_sub, show -x - -z = -(x-z) by ring, div_neg]
    ring

include hi in
lemma cm_addX (x z s : K) :
    (E n).toAffine.addX (-x) (-z) (-i*s) = -(E n).toAffine.addX x z s := by
  simp [Affine.addX,E,mul_pow,hi]
  ring

include hi in
lemma cm_addY (x z y s : K) :
    (E n).toAffine.addY (-x) (-z) (i*y) (-i*s) = i*(E n).toAffine.addY x z y s := by
  simp only [Affine.addY,Affine.negAddY,cm_addX n i hi,cm_negY]
  ring

noncomputable def gaussianI : AddMonoid.End (E n).toAffine.Point where
  toFun := cmI n i hi
  map_zero' := rfl
  map_add' P Q := by
    cases P with
    | zero => simp [show Affine.Point.zero = (0:(E n).toAffine.Point) from rfl, cmI]
    | some x y H =>
      cases Q with
      | zero => simp [show Affine.Point.zero = (0:(E n).toAffine.Point) from rfl, cmI]
      | some z t H' =>
        by_cases h : x=z ∧ y=(E n).toAffine.negY z t
        · rw [Affine.Point.add_of_Y_eq h.1 h.2]
          change 0 = Affine.Point.some _ _ _ + Affine.Point.some _ _ _
          rw [Affine.Point.add_of_Y_eq (congrArg Neg.neg h.1) (by simp only [h.2,cm_negY,mul_neg])]
        · have ht : ¬ (-x = -z ∧ i*y = (E n).toAffine.negY (-z) (i*t)) := by
            simpa only [neg_inj, cm_negY, ← mul_neg, mul_right_inj' (inn i hi)] using h
          rw [Affine.Point.add_some h]
          change Affine.Point.some _ _ _ = Affine.Point.some _ _ _ + Affine.Point.some _ _ _
          rw [Affine.Point.add_some ht]
          simp only [Affine.Point.some.injEq,cm_slope n i hi,cm_addX n i hi,cm_addY n i hi,and_self]

lemma gaussianI_square (P : (E n).toAffine.Point) : gaussianI n i hi (gaussianI n i hi P) = -P := by
  cases P with
  | zero => rfl
  | some x y h =>
    change Affine.Point.some _ _ _ = -Affine.Point.some x y h
    rw [Affine.Point.neg_some]
    simp only [Affine.Point.some.injEq, neg_neg, ← mul_assoc,← sq,hi,neg_one_mul,cm_negY, and_self]


end TunnellLocalCM
