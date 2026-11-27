import TunnellRankinUniformBound
import TunnellRankinNormalization
import Mathlib.NumberTheory.Modular

/-! Polynomial growth of the continued Eisenstein series, valid throughout the upper half-plane. -/
namespace TunnellRankinMajorant
open Complex Matrix MatrixGroups ModularGroup TunnellRankinEisenstein TunnellCMRegularized
open UpperHalfPlane hiding I
open scoped ComplexConjugate
noncomputable section

def size (z : ℍ) := 1+‖(z:ℂ)‖+1/z.im

lemma size_one (z : ℍ) : 1≤ size z := by
  dsimp [size]; linarith [norm_nonneg (z:ℂ),one_div_pos.mpr z.im_pos]

lemma size_im (z : ℍ) : z.im≤ size z := by
  have e : z.im≤‖(z:ℂ)‖ := Complex.im_le_norm _
  dsimp [size]; linarith [one_div_pos.mpr z.im_pos]

lemma size_inv (z : ℍ) : 1/z.im≤ size z := by
  dsimp [size]; linarith [norm_nonneg (z:ℂ)]

lemma scale_le (N k : ℕ) (z : ℍ) : scale N k z≤((N:ℝ)+2+k)*size z^2 := by
  have h := size_one z
  have hr : |z.re|≤ size z := by
    have e : |z.re|≤‖(z:ℂ)‖ := abs_re_le_norm _
    dsimp [size]; linarith [one_div_pos.mpr z.im_pos]
  have h₁ : (N:ℝ)+2+k*|z.re|≤((N:ℝ)+2+k)*size z := by
    nlinarith [mul_le_mul_of_nonneg_left hr (Nat.cast_nonneg (α:=ℝ) k),
      mul_nonneg (Nat.cast_nonneg (α:=ℝ) N) (sub_nonneg.mpr h)]
  have h₂ : 1+1/z.im≤ size z := by dsimp [size]; linarith [norm_nonneg (z:ℂ)]
  change _ * _ ≤ _
  calc
    _ ≤ (((N:ℝ)+2+k)*size z)*size z := mul_le_mul h₁ h₂ (by linarith [one_div_pos.mpr z.im_pos]) (by positivity)
    _ = _ := by ring

lemma height_power {s : ℂ} (hs : ‖s‖≤12) (hs' : 3/4<s.re) (z : ℍ) :
    ‖(z.im:ℂ)^(s-1)‖≤ size z^12 := by
  rw [Complex.norm_cpow_eq_rpow_re_of_pos z.im_pos,Complex.sub_re,Complex.one_re]
  have h := size_one z
  by_cases hy : 1≤ z.im
  · have he : s.re-1≤(12:ℕ) := by norm_num; linarith [Complex.re_le_norm s]
    rw [←Real.rpow_natCast (size z)]
    exact (Real.rpow_le_rpow_of_exponent_le hy he).trans (Real.rpow_le_rpow z.im_pos.le (size_im z) (by positivity))
  · apply (Real.rpow_le_rpow_of_exponent_ge z.im_pos (le_of_not_ge hy) (show (-1:ℝ)≤ s.re-1 by linarith)).trans
    rw [Real.rpow_neg_one,←one_div]
    exact (size_inv z).trans (le_self_pow₀ h (by decide))

end
end TunnellRankinMajorant
#print axioms TunnellRankinMajorant.height_power
