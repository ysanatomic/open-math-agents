import TunnellRankinRows

/-! The cotangent value of the odd Hurwitz zeta function at s = 1. -/
namespace TunnellRankinEisenstein
open Complex TunnellCMRegularized Filter Set HurwitzZeta
open scoped Topology ComplexConjugate
noncomputable section

lemma horizontal_locally (a : ℕ) (z : ℂ) :
    SummableLocallyUniformlyOn (fun (w : ℤ) => difference a z w) domain := by
  apply SummableLocallyUniformlyOn.of_locally_bounded_eventually domain_open
  intro K hK hc
  obtain ⟨R₀,hR₀⟩ := hc.exists_bound_of_continuousOn (continuous_id (X := ℂ)).continuousOn
  let R := max R₀ 1
  have hR : 0 ≤ R := le_trans (by norm_num : (0:ℝ)≤1) (le_max_right _ _)
  let C := ((a:ℝ)^2+(a:ℝ)^3)*(9*R^2+8*R)*‖z‖^2
  have hC : 0 ≤ C := by dsimp [C]; positivity
  refine ⟨fun w => C*|(w:ℝ)|^(-5/2:ℝ),
    (by simpa only [neg_div] using (Real.summable_abs_int_rpow (b:=5/2) (by norm_num)).mul_left C), ?_⟩
  have htop : Tendsto (fun w : ℤ => ‖(w:ℂ)‖) cofinite atTop := by
    exact tendsto_norm_comp_cofinite_atTop_of_isClosedEmbedding Complex.isClosedEmbedding_intCast
  have ht : Tendsto (fun w : ℤ => ‖z/(w:ℂ)‖) cofinite (𝓝 0) := by
    simp only [norm_div]
    exact tendsto_const_nhds.div_atTop htop
  have ht' : Tendsto (fun w : ℤ => ‖(a:ℂ)*(z/(w:ℂ))‖) cofinite (𝓝 0) := by
    simpa only [norm_mul,mul_zero] using ht.const_mul ‖(a:ℂ)‖
  have hu := ht.eventually_le_const (by norm_num : (0:ℝ)<1/2)
  have hv := ht'.eventually_le_const (by norm_num : (0:ℝ)<1/2)
  have hsu : ∀ᶠ w : ℤ in cofinite, 3*R*‖z/(w:ℂ)‖ ≤ 1 :=
    ((ht.const_mul (3*R)).eventually_le_const (by simp))
  have hsv : ∀ᶠ w : ℤ in cofinite, 3*R*‖(a:ℂ)*(z/(w:ℂ))‖ ≤ 1 :=
    ((ht'.const_mul (3*R)).eventually_le_const (by simp))
  filter_upwards [hu,hv,hsu,hsv,htop.eventually_ge_atTop 1] with w h1 h2 h3 h4 hw
  intro s hs
  have hsR : ‖s‖ ≤ R := (hR₀ s hs).trans (le_max_left _ _)
  rw [← Complex.norm_intCast]
  apply (difference_bound (norm_pos_iff.mp (lt_of_lt_of_le zero_lt_one hw)) hsR a h1 h2 h3 h4).trans
  apply mul_le_mul_of_nonneg_left _ hC
  exact Real.rpow_le_rpow_of_exponent_le hw (by have := hK hs; change 3/4 < s.re at this; linarith)

def horizontal (a : ℕ) (z s : ℂ) := ∑' j : ℤ, difference a z j s

lemma horizontal_analytic (a : ℕ) (z : ℂ) : AnalyticOnNhd ℂ (horizontal a z) domain := by
  apply DifferentiableOn.analyticOnNhd _ domain_open
  apply (horizontal_locally a z).differentiableOn domain_open
  intro w s _
  unfold difference kernel
  fun_prop

lemma kernel_real (s : ℂ) (w : ℝ) :
    kernel s (w:ℂ)=(SignType.sign w:ℂ)/((|w|:ℝ):ℂ)^(2*s-1) := by
  rcases lt_trichotomy w 0 with hw | rfl | hw
  · have hp : 0 < -w := neg_pos.mpr hw
    rw [kernel,abs_of_neg hw,sign_neg hw,Complex.norm_real,Real.norm_eq_abs,abs_of_neg hw,
      Complex.cpow_def_of_ne_zero (by exact_mod_cast hp.ne'),←Complex.ofReal_log hp.le,
      div_eq_mul_inv,←Complex.exp_neg]
    simp only [SignType.coe_neg,SignType.coe_one]
    rw [show -((Real.log (-w):ℂ)*(2*s-1)) = -2*s*(Real.log (-w):ℂ)+(Real.log (-w):ℂ) by ring,
      Complex.exp_add,←Complex.ofReal_exp,Real.exp_log hp]
    push_cast
    ring
  · simp [kernel]
  · rw [kernel,abs_of_pos hw,sign_pos hw,Complex.norm_real,Real.norm_eq_abs,abs_of_pos hw,
      Complex.cpow_def_of_ne_zero (by exact_mod_cast hw.ne'),←Complex.ofReal_log hw.le,
      div_eq_mul_inv,←Complex.exp_neg]
    simp only [SignType.coe_one]
    rw [show -((Real.log w:ℂ)*(2*s-1)) = -2*s*(Real.log w:ℂ)+(Real.log w:ℂ) by ring,
      Complex.exp_add,←Complex.ofReal_exp,Real.exp_log hw]
    ring

lemma shifted_hurwitz (x : ℝ) {s : ℂ} (hs : 1<s.re) :
    HasSum (fun j : ℤ => kernel s ((j:ℂ)+(x:ℂ))) (2*hurwitzZetaOdd x (2*s-1)) := by
  have h := (hasSum_int_hurwitzZetaOdd x (s:=2*s-1) (by simp [Complex.mul_re]; linarith)).mul_left (2:ℂ)
  apply h.congr_fun
  intro j
  rw [show (j:ℂ)+(x:ℂ)=((j+x:ℝ):ℂ) by push_cast; rfl,kernel_real]
  ring

end
end TunnellRankinEisenstein
#print axioms TunnellRankinEisenstein.shifted_hurwitz
