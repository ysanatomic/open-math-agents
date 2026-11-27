import TunnellPeriod
import LSG.LemniscateIndep.Main
import LSG.Weierstrass.Dictionary
import Mathlib.MeasureTheory.Function.JacobianOneDim

/-! Normalization of the square period lattice of the congruent-number elliptic curve. -/

namespace TunnellCMLemniscate

open MeasureTheory Set Complex LSG.LemniscateIndep
open TunnellCoates

theorem period_one : realPeriod 1 = varpi := by
  let f (t : ℝ) := t⁻¹^2
  let D (t : ℝ) := -2/t^3
  have hd {t : ℝ} (ht : t∈Ioo (0:ℝ) 1) : HasDerivAt f (D t) t := by
    apply (((hasDerivAt_id' t).inv ht.1.ne').pow 2).congr_deriv
    dsimp [D]
    field_simp
    <;> ring
  have hi : StrictAntiOn f (Ioo 0 1) := by
    intro t ht v hv he
    exact pow_lt_pow_left₀ (inv_lt_inv₀ hv.1 ht.1 |>.mpr he) (inv_nonneg.mpr hv.1.le) (by decide)
  have him : f '' Ioo (0:ℝ) 1=Ioi 1 := by
    ext x
    constructor
    · rintro ⟨t,ht,rfl⟩
      have hp : 1<t⁻¹ := (one_lt_inv₀ ht.1).mpr ht.2
      change 1<t⁻¹^2
      nlinarith
    · intro hx
      change 1<x at hx
      have hp : 1<Real.sqrt x := by simpa using Real.sqrt_lt_sqrt (by norm_num : (0:ℝ)≤1) hx
      refine ⟨(Real.sqrt x)⁻¹,⟨inv_pos.mpr (by linarith),(inv_lt_one₀ (by linarith)).mpr hp⟩,?_⟩
      simp [f,Real.sq_sqrt (by linarith : 0≤x)]
  let g (x : ℝ) := (Real.sqrt (x^3-x))⁻¹
  have e := integral_image_eq_integral_abs_deriv_smul measurableSet_Ioo
    (fun t ht => (hd ht).hasDerivWithinAt) hi.injOn g
  rw [varpi_eq_integral,intervalIntegral.integral_of_le zero_le_one,integral_Ioc_eq_integral_Ioo,
    ← integral_const_mul]
  change (∫ x in Ioi 1, (Real.sqrt (x^3-(1:ℝ)^2*x))⁻¹)=_
  simp only [one_pow,one_mul]
  change (∫ x in Ioi 1, g x)=_
  rw [← him,e]
  apply setIntegral_congr_fun measurableSet_Ioo
  intro t ht
  have ht0 := ht.1
  have he : (t⁻¹^2)^3-t⁻¹^2=(1-t^4)/(t^3)^2 := by field_simp <;> ring
  have hv : 0≤1-t^4 := by nlinarith [pow_le_pow_left₀ ht.1.le ht.2.le 4]
  change |(-2/t^3)| * (Real.sqrt ((t⁻¹^2)^3-t⁻¹^2))⁻¹=2*(1 / Real.sqrt (1-t^4))
  rw [he,Real.sqrt_div hv,Real.sqrt_sq (by positivity),abs_of_neg (div_neg_of_neg_of_pos (by norm_num : (-2:ℝ)<0) (pow_pos ht0 3))]
  field_simp

noncomputable def twistPeriods (n : ℕ) (hn : 0<n) : PeriodPair where
  ω₁ := (realPeriod n:ℂ)
  ω₂ := I * (realPeriod n:ℂ)
  indep := by
    have h := (realPeriod_pos (show (0:ℝ)<n by exact_mod_cast hn)).ne'
    apply LinearIndependent.pair_iff.mpr
    intro x y he
    have hr := congrArg re he
    have hi := congrArg im he
    simp [Complex.mul_re,Complex.mul_im,h] at hr hi
    exact ⟨hr,hi⟩

theorem g₂_twist (n : ℕ) (hn : 0<n) : (twistPeriods n hn).g₂ = 4*(n:ℂ)^2 := by
  have hpos : (0:ℝ)<n := by exact_mod_cast hn
  rw [Sq.g₂_eq_of_square (L := twistPeriods n hn) (a := realPeriod n)
      ⟨realPeriod_pos hpos,rfl,rfl⟩,realPeriod_eq hpos,period_one]
  have he : varpi/(varpi/Real.sqrt n)=Real.sqrt n := by field_simp [varpi_pos.ne']
  rw [he]
  have e := congrArg ((↑):ℝ→ℂ) (Real.sq_sqrt hpos.le)
  push_cast at e
  linear_combination 4*((Real.sqrt n:ℂ)^2+(n:ℂ))*e

theorem curve_eq (n : ℕ) (hn : 0<n) :
    LSG.Weierstrass.curve (twistPeriods n hn) = (⟨0,0,0,-(n:ℂ)^2,0⟩ : WeierstrassCurve ℂ) := by
  have hg := g₃_eq_zero_of_square (L := twistPeriods n hn) (a := realPeriod n) rfl rfl
  unfold LSG.Weierstrass.curve
  rw [g₂_twist,hg]
  congr 1 <;> ring

end TunnellCMLemniscate

#print axioms TunnellCMLemniscate.curve_eq
