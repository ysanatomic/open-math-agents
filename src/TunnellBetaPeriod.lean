import TunnellPeriod
import Mathlib.MeasureTheory.Function.JacobianOneDim

/-! Identification of the Fermat-quartic differential with the real period of y²=x³−x. -/

namespace TunnellCoates

open MeasureTheory Set

theorem realPeriod_fermat :
    realPeriod 1 = ∫ u in Ioo (0:ℝ) 1, (1-u^2)^(-(3/4):ℝ) := by
  let f (u : ℝ) := (1-u^2)^(-(1/2):ℝ)
  let D (u : ℝ) := u*(1-u^2)^(-(3/2):ℝ)
  have pos {u : ℝ} (hu : u∈Ioo 0 1) : 0<1-u^2 := by nlinarith [mul_pos (sub_pos.mpr hu.2) (by linarith [hu.1] : 0<1+u)]
  have hd {u : ℝ} (hu : u∈Ioo 0 1) : HasDerivAt f (D u) u := by
    have h := (((hasDerivAt_id u).pow 2).const_sub 1).rpow_const (p:=-(1/2:ℝ)) (Or.inl (pos hu).ne')
    change HasDerivAt f (-(2*u^1*1)* -(1/2)*(1-u^2)^(-(1/2:ℝ)-1)) u at h
    rw [show -(1/2:ℝ)-1= -(3/2) by norm_num,show -(2*u^1*1)* -(1/2)=u by ring] at h
    exact h
  have hi : StrictMonoOn f (Ioo 0 1) := by
    intro u hu v hv huv
    exact (Real.rpow_lt_rpow_iff_of_neg (pos hu) (pos hv) (by norm_num : -(1/2:ℝ)<0)).mpr (by nlinarith [mul_pos (sub_pos.mpr huv) (add_pos hu.1 hv.1)])
  have him : f '' (Ioo 0 1) = Ioi 1 := by
    ext x
    constructor
    · rintro ⟨u,hu,rfl⟩
      exact Real.one_lt_rpow_of_pos_of_lt_one_of_neg (pos hu) (by nlinarith [sq_pos_of_pos hu.1]) (by norm_num)
    · intro hx
      change 1<x at hx
      let v := x ^ (-2:ℝ)
      have hv : 0<v := Real.rpow_pos_of_pos (by linarith) _
      have hv1 : v<1 := Real.rpow_lt_one_of_one_lt_of_neg hx (by norm_num)
      have he := Real.sq_sqrt (sub_pos.mpr hv1).le
      refine ⟨Real.sqrt (1-v),⟨Real.sqrt_pos.mpr (sub_pos.mpr hv1),by nlinarith [Real.sqrt_nonneg (1-v)]⟩,?_⟩
      dsimp only [f]
      rw [he,sub_sub_cancel]
      dsimp only [v]
      rw [← Real.rpow_mul (by linarith : 0≤x)]
      norm_num
  let g (x : ℝ) := (Real.sqrt (x^3-x))⁻¹
  have e := integral_image_eq_integral_abs_deriv_smul measurableSet_Ioo (fun x hx => (hd hx).hasDerivWithinAt) hi.injOn g
  change (∫ x in Ioi 1, (Real.sqrt (x^3-(1:ℝ)^2*x))⁻¹) = _
  simp only [one_pow,one_mul]
  change (∫ x in Ioi 1, g x) = _
  rw [← him,e]
  apply setIntegral_congr_fun measurableSet_Ioo
  intro u hu
  let v := 1-u^2
  have hv : 0<v := pos hu
  have hpow (k : ℕ) : (f u)^k = v^(-(1/2:ℝ)*k) := by
    rw [← Real.rpow_natCast,← Real.rpow_mul hv.le]
  have hmul : f u ^2*v=1 := by
    rw [hpow,show -(1/2:ℝ)*(2:ℕ) = -1 by norm_num,Real.rpow_neg_one,inv_mul_cancel₀ hv.ne']
  have hcube : f u ^3 - f u = (f u)^3*u^2 := by
    dsimp [v] at hmul
    linear_combination (f u)*hmul
  have hc : Real.sqrt ((f u)^3) = v^(-(3/4):ℝ) := by
    rw [hpow,Real.sqrt_eq_rpow,← Real.rpow_mul hv.le]
    norm_num
  have hD : 0≤D u := mul_nonneg hu.1.le (Real.rpow_nonneg hv.le _)
  change |D u| * (Real.sqrt ((f u)^3-f u))⁻¹ = _
  rw [abs_of_nonneg hD,hcube,Real.sqrt_mul (by have : 0<f u := Real.rpow_pos_of_pos hv _; positivity),hc,Real.sqrt_sq hu.1.le]
  change u * v^(-(3/2):ℝ) * (v^(-(3/4):ℝ)*u)⁻¹ = v^(-(3/4):ℝ)
  have hp : 0 < v^(-(3/4):ℝ) := Real.rpow_pos_of_pos hv _
  have he : v^(-(3/2):ℝ) = v^(-(3/4):ℝ)*v^(-(3/4):ℝ) := by
    rw [← Real.rpow_add hv]
    norm_num
  rw [he]
  field_simp [hu.1.ne',hp.ne']

open Filter
open scoped Topology

theorem realPeriod_of_fermat_parameter {f X : ℝ → ℝ}
    (hf : ∀ t, 0<t → 0<f t) (hX : ∀ t, 0<t → X t∈Ioo 0 1)
    (hd : ∀ t, 0<t → HasDerivAt X (-8*Real.pi*f t*(1-X t^2)^(3/4:ℝ)) t)
    (hzero : Tendsto X (𝓝[>] 0) (𝓝 1)) (htop : Tendsto X atTop (𝓝 0)) :
    (2*Real.pi)*(∫ t in Ioi (0:ℝ), f t) = realPeriod 1/4 := by
  let d t := -8*Real.pi*f t*(1-X t^2)^(3/4:ℝ)
  have hpos {t : ℝ} (ht : 0<t) : 0<1-X t^2 := by
    have h := hX t ht
    nlinarith [mul_pos (sub_pos.mpr h.2) (by linarith [h.1] : 0<1+X t)]
  have hneg {t : ℝ} (ht : 0<t) : d t < 0 := by
    dsimp [d]
    have := hf t ht
    have := hpos ht
    have HH : 0<8*Real.pi*f t*(1-X t^2)^(3/4:ℝ) := by positivity
    linarith
  have hc : ContinuousOn X (Ioi 0) := fun t ht => (hd t ht).continuousAt.continuousWithinAt
  have ha := strictAntiOn_of_deriv_neg (convex_Ioi (0:ℝ)) hc (fun t ht =>
    (hd t (interior_subset ht)).deriv ▸ hneg (interior_subset ht))
  have him : X '' Ioi 0 = Ioo 0 1 := by
    refine Subset.antisymm ?_ ?_
    · rintro x ⟨t,ht,rfl⟩
      exact hX t ht
    apply isPreconnected_Ioi.intermediate_value_Ioo _ _ hc htop hzero
    · exact Filter.le_principal_iff.mpr (Ioi_mem_atTop 0)
    · exact inf_le_right
  have he := integral_image_eq_integral_abs_deriv_smul measurableSet_Ioi
    (fun t ht => (hd t ht).hasDerivWithinAt) ha.injOn (fun u : ℝ => (1-u^2)^(-(3/4):ℝ))
  rw [him,← realPeriod_fermat] at he
  have ei : realPeriod 1 = (8*Real.pi)*(∫ t in Ioi (0:ℝ), f t) := by
    rw [he,← integral_const_mul]
    apply setIntegral_congr_fun measurableSet_Ioi
    intro t ht
    change |d t| * (1-X t^2)^(-(3/4):ℝ) = _
    rw [abs_of_neg (hneg ht),Real.rpow_neg (hpos ht).le]
    have H : (1-X t^2)^(3/4:ℝ) ≠ 0 := (Real.rpow_pos_of_pos (hpos ht) _).ne'
    dsimp [d]
    field_simp
    <;> ring
  rw [ei]
  ring

end TunnellCoates
#print axioms TunnellCoates.realPeriod_fermat
