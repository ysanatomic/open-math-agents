import FormalConjectures.Wikipedia.CongruentNumber

/-! # The real-period integral for the congruent-number family -/

namespace TunnellCoates

open MeasureTheory Set Filter
open scoped Topology

noncomputable def realPeriod (n : ℝ) : ℝ :=
  ∫ x in Ioi n, (Real.sqrt (x^3-n^2*x))⁻¹

theorem realPeriod_eq {n : ℝ} (hn : 0 < n) :
    realPeriod n = realPeriod 1 / Real.sqrt n := by
  let f := fun a x : ℝ => (Real.sqrt (x^3-a^2*x))⁻¹
  have hs : ∀ x : ℝ, f n (n*x) = (n * Real.sqrt n)⁻¹ * f 1 x := by
    intro x
    dsimp [f]
    rw [show (n*x)^3-n^2*(n*x) = (n^2 * n)*(x^3-1^2*x) by ring,
      Real.sqrt_mul (by positivity), Real.sqrt_mul (sq_nonneg n), Real.sqrt_sq hn.le]
    ring
  have ht := integral_comp_mul_left_Ioi' (f n) 1 hn
  simp only [mul_one, smul_eq_mul, hs, integral_const_mul] at ht
  change ∫ x in Ioi n, f n x = (∫ x in Ioi 1, f 1 x) / Real.sqrt n
  rw [← ht]
  field_simp

lemma realPeriod_one_pos : 0 < realPeriod 1 := by
  let f := fun x : ℝ => (Real.sqrt (x^3-x))⁻¹
  have hf : Measurable f := by dsimp [f]; fun_prop
  have hnear : IntegrableOn f (Ioc 1 2) := by
    have H := (intervalIntegral.intervalIntegrable_rpow' (a:=0) (b:=1)
      (by norm_num : (-1:ℝ) < -(1/2:ℝ))).comp_sub_right 1
    have HH : IntegrableOn (fun x : ℝ => (x-1)^(-(1/2):ℝ)) (Ioc 1 2) := by
      norm_num only [zero_add, one_add_one_eq_two] at H
      exact H.1
    apply Integrable.mono HH hf.aestronglyMeasurable
    filter_upwards [ae_restrict_mem measurableSet_Ioc] with x hx
    have hx1 : 0 < x-1 := sub_pos.mpr hx.1
    have hs : x-1 ≤ x^3-x := by
      nlinarith [mul_nonneg hx1.le (sq_nonneg x), sq_nonneg (x-1)]
    dsimp [f]
    rw [abs_of_nonneg (by positivity),
      abs_of_nonneg (Real.rpow_nonneg hx1.le _), Real.rpow_neg hx1.le, ← Real.sqrt_eq_rpow]
    exact inv_anti₀ (Real.sqrt_pos.mpr hx1) (Real.sqrt_le_sqrt hs)
  have hfar : IntegrableOn f (Ioi 2) := by
    have H := (integrableOn_Ioi_rpow_of_lt (c:=2) (by norm_num : -(3/2:ℝ) < -1)
      (by norm_num)).const_mul 2
    apply Integrable.mono H hf.aestronglyMeasurable
    filter_upwards [ae_restrict_mem measurableSet_Ioi] with x hx
    have hx2 : 2 < x := hx
    have hx0 : 0 < x := by linarith
    have hsq : x^3 ≤ 4*(x^3-x) := by nlinarith [mul_nonneg hx0.le (sq_nonneg (x-2))]
    have hroot := Real.sqrt_le_sqrt hsq
    rw [Real.sqrt_mul (by norm_num : (0:ℝ) ≤ 4)] at hroot
    norm_num at hroot
    have hpos : 0 < x^3-x := by nlinarith [pow_pos hx0 3]
    have he : x^(3/2:ℝ) = Real.sqrt (x^3) := by
      rw [Real.sqrt_eq_rpow, ← Real.rpow_natCast_mul hx0.le]
      norm_num
    dsimp [f]
    rw [abs_of_nonneg (by positivity),
      abs_of_nonneg (by positivity), Real.rpow_neg hx0.le, he]
    rw [← div_eq_mul_inv, ← one_div]
    apply (div_le_div_iff₀ (Real.sqrt_pos.mpr hpos) (Real.sqrt_pos.mpr (pow_pos hx0 3))).mpr
    simpa using hroot
  have hint : IntegrableOn f (Ioi 1) := by
    rw [← Ioc_union_Ioi_eq_Ioi (by norm_num : (1:ℝ) ≤ 2)]
    exact hnear.union hfar
  change 0 < ∫ x in Ioi 1, (Real.sqrt (x^3-1^2*x))⁻¹
  simp only [one_pow, one_mul]
  change 0 < ∫ x in Ioi 1, f x
  rw [setIntegral_pos_iff_support_of_nonneg_ae (.of_forall fun x => by dsimp [f]; positivity) hint]
  apply lt_of_lt_of_le (a := 0) (b := volume (Ioo (2:ℝ) 3)) (by simp <;> norm_num) (measure_mono ?_)
  intro x hx
  have hpos : 0 < x^3-x := by
    obtain ⟨ha,hb⟩ := hx
    nlinarith [mul_pos (by linarith : 0<x) (by nlinarith : 0 < x^2-1)]
  exact ⟨(inv_pos.mpr (Real.sqrt_pos.mpr hpos)).ne', by change 1 < x; have := hx.1; linarith⟩

theorem realPeriod_pos {n : ℝ} (hn : 0<n) : 0 < realPeriod n := by
  rw [realPeriod_eq hn]
  exact div_pos realPeriod_one_pos (Real.sqrt_pos.mpr hn)

#print axioms realPeriod_pos

end TunnellCoates
