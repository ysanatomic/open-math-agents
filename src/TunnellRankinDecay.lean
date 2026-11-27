import TunnellRankinStrip
import Mathlib.Analysis.SpecialFunctions.Gaussian.GaussianIntegral

/-! Uniform-in-horizontal-coordinate decay for polynomially bounded Fourier coefficients. -/
namespace TunnellRankinIntegral
open Complex MeasureTheory TunnellRankin AddCircle
open scoped Nat
noncomputable section

lemma exp_neg_le_ratio {x : ℝ} (hx : 0<x) (m : ℕ) :
    Real.exp (-x) ≤ (m.factorial:ℝ)/x^m := by
  have h := Real.pow_div_factorial_le_exp x hx.le m
  have h0 : 0<(m.factorial:ℝ) := by positivity
  rw [Real.exp_neg,←one_div,div_le_div_iff₀ (Real.exp_pos x) (pow_pos hx m),one_mul]
  simpa only [mul_comm] using (div_le_iff₀ h0).mp h

lemma coefficient_bound {k : ℕ} {a : ℕ→ℂ} {C : ℝ} (hC : 0≤C) (hz : a 0=0)
    (hg : ∀ m : ℕ, ‖a m‖≤C*(m:ℝ)^k) (n : ℕ) {y : ℝ} (hy : 0<y) :
    ‖mode a (4*y) n‖ ≤ (C*((k+2).factorial:ℝ)/y^(k+2)*Real.exp (-y))*((n:ℝ)^2)⁻¹ := by
  by_cases hn : n=0
  · subst n; simp [mode,hz]
  have hp : 0<(n:ℝ) := Nat.cast_pos.mpr (Nat.pos_of_ne_zero hn)
  have hp1 : 1≤(n:ℝ) := by exact_mod_cast (Nat.one_le_iff_ne_zero.mpr hn)
  have he : Real.exp (-(4*y/2)*n) ≤ Real.exp (-(y*n))*Real.exp (-y) := by
    rw [←Real.exp_add,Real.exp_le_exp]
    nlinarith [mul_nonneg hy.le (sub_nonneg.mpr hp1)]
  rw [mode,norm_mul,Complex.norm_real,Real.norm_eq_abs,abs_of_pos (Real.exp_pos _)]
  calc
    _ ≤ (C*(n:ℝ)^k)*(((k+2).factorial:ℝ)/(y*n)^(k+2)*Real.exp (-y)) := by
      exact mul_le_mul (hg n) (he.trans (mul_le_mul_of_nonneg_right (exp_neg_le_ratio (mul_pos hy hp) _) (Real.exp_pos _).le))
        (Real.exp_pos _).le (mul_nonneg hC (pow_nonneg hp.le _))
    _ = _ := by rw [mul_pow,pow_add (n:ℝ)]; field_simp [hp.ne',hy.ne'] <;> ring

theorem circle_bound {k : ℕ} {a : ℕ→ℂ} {C : ℝ} (hC : 0≤C) (hz : a 0=0)
    (hg : ∀ m : ℕ, ‖a m‖≤C*(m:ℝ)^k) :
    ∃ D : ℝ, 0≤D ∧ ∀ y : ℝ, 0<y → ∀ x : AddCircle (1:ℝ),
      ‖circleSeries (mode a (4*y)) x‖≤D/y^(k+2)*Real.exp (-y) := by
  let S := ∑' n : ℕ, ((n:ℝ)^2)⁻¹
  have hsum := Real.summable_nat_pow_inv.mpr (by decide : 1<2)
  have hS : 0≤S := tsum_nonneg (fun _ => by positivity)
  refine ⟨C*((k+2).factorial:ℝ)*S,by positivity,?_⟩
  intro y hy x
  let V := C*((k+2).factorial:ℝ)/y^(k+2)*Real.exp (-y)
  have ha := summable_mode hg (by positivity : 0<4*y)
  have hh (n : ℕ) : ‖mode a (4*y) n • fourier (T:=1) (n:ℤ)‖=‖mode a (4*y) n‖ := by
    rw [norm_smul,fourier_norm,mul_one]
  calc
    _ ≤ ‖circleSeries (mode a (4*y))‖ := ContinuousMap.norm_coe_le_norm _ _
    _ ≤ ∑' n : ℕ,‖mode a (4*y) n • fourier (T:=1) (n:ℤ)‖ :=
      norm_tsum_le_tsum_norm (by simpa only [hh] using ha.norm)
    _ = ∑' n : ℕ,‖mode a (4*y) n‖ := tsum_congr hh
    _ ≤ ∑' n : ℕ,V*((n:ℝ)^2)⁻¹ := ha.norm.tsum_le_tsum (fun n => coefficient_bound hC hz hg n hy) (hsum.mul_left V)
    _ = _ := by rw [tsum_mul_left]; dsimp [V,S]; ring

end
end TunnellRankinIntegral
#print axioms TunnellRankinIntegral.circle_bound
