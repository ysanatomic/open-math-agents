import OMAReductions.R_CongruentNumber_Tunnell_even_R1
import Mathlib.Analysis.Complex.HasPrimitives

/-! Disk primitive and level-two Fricke transformation for the conductor-32 eta product. -/

namespace TunnellFricke

open Complex hiding eta
open Function ModularForm Set Filter Metric
open UpperHalfPlane hiding I
open scoped Real Topology

noncomputable def h (z : ℂ) := eta z ^2 * eta (2*z)^2
noncomputable def W (z : ℂ) := -1/(2*z)
noncomputable def disk (q : ℂ) := (∏' n : ℕ, (1-(q^4)^(n+1)))^2 *
  (∏' n : ℕ, (1-(q^8)^(n+1)))^2

lemma disk_hol : DifferentiableOn ℂ disk (ball 0 1) := by
  have hc (a : ℕ) (ha : 0<a) : MapsTo (fun q : ℂ => q^a) (ball 0 1) (ball 0 1) := by
    intro q hq
    simpa [mem_ball,norm_pow] using pow_lt_one₀ (norm_nonneg q) (by simpa using hq) ha.ne'
  have hf (a : ℕ) (ha : 0<a) := differentiableOn_tprod_one_sub_pow.comp
    (show DifferentiableOn ℂ (fun q : ℂ => q^a) (ball 0 1) by fun_prop) (hc a ha)
  exact ((hf 4 (by decide)).pow 2).mul ((hf 8 (by decide)).pow 2)

lemma disk_rot (q : ℂ) : disk (I*q) = disk q := by
  simp [disk,mul_pow,I_pow_four,show Complex.I^8=1 by rw [show 8=4*2 by decide,pow_mul,I_pow_four,one_pow]]

lemma present (z : ℂ) : h z = Periodic.qParam 4 z * disk (Periodic.qParam 4 z) := by
  have h1 : Periodic.qParam 1 z = Periodic.qParam 4 z ^4 := by
    simp only [Periodic.qParam,← Complex.exp_nat_mul]; push_cast; congr 1; ring
  have h2 : Periodic.qParam 1 (2*z) = Periodic.qParam 4 z ^8 := by
    simp only [Periodic.qParam,← Complex.exp_nat_mul]; push_cast; congr 1; ring
  have h0 : Periodic.qParam 24 z ^2 * Periodic.qParam 24 (2*z)^2 = Periodic.qParam 4 z := by
    simp only [Periodic.qParam,← Complex.exp_nat_mul,← Complex.exp_add]; push_cast; congr 1; ring
  simp only [h,eta,eta_q,h1,h2,mul_pow,disk]
  linear_combination (∏' k : ℕ, (1-(Periodic.qParam 4 z ^ 4)^(k+1)))^2 *
    (∏' k : ℕ, (1-(Periodic.qParam 4 z ^ 8)^(k+1)))^2 * h0

lemma sq_csqrt (z : ℂ) (hz : z ≠ 0) : sqrt z ^ 2 = z := by
  rw [sqrt_eq_exp hz,← exp_nat_mul]
  convert Complex.exp_log hz using 2 <;> ring

lemma eta_S_sq (z : ℂ) (hz : 0<z.im) : eta (-1/z)^2 = (-I)*z*eta z^2 := by
  have e : eta (-1/z) = (sqrt I)⁻¹*(sqrt z * eta z) := eta_comp_eq_csqrt_I_inv hz
  rw [e,mul_pow,mul_pow,inv_pow,sq_csqrt I I_ne_zero,sq_csqrt z (ne_zero (⟨z,hz⟩:ℍ)),inv_I]
  ring

lemma h_fricke (z : ℂ) (hz : 0<z.im) : h (W z) = -2*z^2*h z := by
  have hz' : 0<(2*z).im := by simpa [mul_im] using hz
  have hz0 := ne_zero (⟨z,hz⟩:ℍ)
  simp only [h,W,eta_S_sq _ hz',show 2*(-1/(2*z)) = -1/z by field_simp,eta_S_sq _ hz]
  linear_combination 2*z^2*eta z^2*eta (2*z)^2*I_sq

lemma W_mem {z : ℂ} (hz : 0<z.im) : 0<(W z).im := by
  have h2 : 0<(2*z).im := by simpa [mul_im] using hz
  simpa [W,neg_div] using (⟨2*z,h2⟩:ℍ).im_inv_neg_coe_pos

noncomputable def c : ℂ := 2*(Real.pi:ℂ)*I/4

lemma hasDeriv_q (z : ℂ) : HasDerivAt (Periodic.qParam 4) (c*Periodic.qParam 4 z) z := by
  have e : Periodic.qParam 4 = fun z => exp (c*z) := by
    ext z
    simp only [Periodic.qParam,c]
    push_cast
    congr 1
    ring
  rw [e]
  simpa [mul_comm] using ((hasDerivAt_id z).const_mul c).cexp

lemma q_T (z : ℂ) : Periodic.qParam 4 (z+1) = I*Periodic.qParam 4 z := by
  simp only [Periodic.qParam]
  push_cast
  rw [show 2*(Real.pi:ℂ)*I*(z+1)/4 = Real.pi/2*I + 2*Real.pi*I*z/4 by ring,
    exp_add,exp_pi_div_two_mul_I]

theorem primitive :
    ∃ J : ℂ → ℂ, (∀ z, 0<z.im → HasDerivAt J (c*h z) z) ∧
      Tendsto J (comap Complex.im atTop) (𝓝 0) ∧
      (∀ z, 0<z.im → J (z+1) = I*J z) ∧
      ∃ C : ℂ, ∀ z, 0<z.im → J (W z) = C-J z := by
  obtain ⟨G,hG0,hG⟩ := disk_hol.isExactOn_ball.with_val_at 0 0
  let J (z : ℂ) := G (Periodic.qParam 4 z)
  have qmem {z : ℂ} (hz : 0<z.im) : Periodic.qParam 4 z ∈ ball 0 1 := by
    simpa using Periodic.norm_qParam_lt_one (by norm_num : (0:ℝ)<4) hz
  have hJ (z : ℂ) (hz : 0<z.im) : HasDerivAt J (c*h z) z := by
    rw [show c*h z = disk (Periodic.qParam 4 z)*(c*Periodic.qParam 4 z) by rw [present]; ring]
    exact (hG _ (qmem hz)).comp z (hasDeriv_q z)
  have h0 : Tendsto J (comap Complex.im atTop) (𝓝 0) := by
    have hh := (hG 0 (mem_ball_self (by norm_num))).continuousAt.tendsto
    rw [hG0] at hh
    exact hh.comp ((Periodic.qParam_tendsto (by norm_num : (0:ℝ)<4)).mono_right nhdsWithin_le_nhds)
  have hA {q : ℂ} (hq : q ∈ ball 0 1) : I*q ∈ ball 0 1 := by simpa [mem_ball] using hq
  have da {q : ℂ} (hq : q ∈ ball 0 1) : HasDerivAt (fun w => G (I*w)) (I*disk q) q := by
    simpa only [Function.comp_def,id_eq, mul_one,disk_rot, mul_comm (disk q) I] using (hG _ (hA hq)).comp q ((hasDerivAt_id q).const_mul I)
  have db {q : ℂ} (hq : q ∈ ball 0 1) : HasDerivAt (fun w => I*G w) (I*disk q) q := (hG _ hq).const_mul I
  have rot : (ball 0 1).EqOn (fun w => G (I*w)) (fun w => I*G w) := by
    refine isOpen_ball.eqOn_of_deriv_eq (convex_ball (0:ℂ) 1).isPreconnected
      (fun q hq => (da hq).differentiableAt.differentiableWithinAt)
      (fun q hq => (db hq).differentiableAt.differentiableWithinAt)
      (fun q hq => (da hq).deriv.trans (db hq).deriv.symm) (x:=0) (by simp) ?_
    simp [hG0]
  refine ⟨J,hJ,h0,fun z hz => ?_,?_⟩
  · simpa [J,q_T] using rot (qmem hz)
  · have dW (z : ℂ) (hz : 0<z.im) : HasDerivAt W (1/(2*z^2)) z := by
      have hz0 := ne_zero (⟨z,hz⟩:ℍ)
      have hh := (hasDerivAt_const z (-1:ℂ)).div ((hasDerivAt_id z).const_mul 2) (mul_ne_zero two_ne_zero hz0)
      change HasDerivAt W ((0*(2*z)-(-1)*(2*1))/(2*z)^2) z at hh
      rwa [show (0*(2*z)-(-1)*(2*1))/(2*z)^2 = 1/(2*z^2) by field_simp; ring] at hh
    have da (z : ℂ) (hz : 0<z.im) : HasDerivAt (fun w => J (W w)) (-(c*h z)) z := by
      have hz0 := ne_zero (⟨z,hz⟩:ℍ)
      rw [show -(c*h z) = c*h (W z)*(1/(2*z^2)) by rw [h_fricke z hz]; field_simp]
      exact (hJ (W z) (W_mem hz)).comp z (dW z hz)
    have db (z : ℂ) (hz : 0<z.im) := (hJ z hz).neg
    obtain ⟨C,hC⟩ := isOpen_upperHalfPlaneSet.exists_eq_add_of_deriv_eq
      (convex_halfSpace_im_gt 0).isPreconnected
      (fun z hz => (da z hz).differentiableAt.differentiableWithinAt)
      (fun z hz => (db z hz).differentiableAt.differentiableWithinAt)
      (fun z hz => (da z hz).deriv.trans (db z hz).deriv.symm)
    exact ⟨C,fun z hz => by simpa [sub_eq_add_neg,add_comm] using hC hz⟩

end TunnellFricke
#print axioms TunnellFricke.primitive
