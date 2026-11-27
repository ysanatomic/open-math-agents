import TunnellCMEllipticZeta
import Mathlib.Analysis.SpecialFunctions.Complex.LogBounds
import Mathlib.Analysis.Complex.SummableUniformlyOn
import Mathlib.Topology.Algebra.InfiniteSum.TsumUniformlyOn

/-! The weight-one Eisenstein kernel with the integer Euler factor applied before summation. -/

namespace TunnellCMRegularized

open Complex Filter Set
open scoped Topology

noncomputable def kernel (s w : ℂ) := w * exp (-2*s*(Real.log ‖w‖ : ℂ))

lemma kernel_mul (s w u : ℂ) : kernel s (w*u) = kernel s w * kernel s u := by
  by_cases hw : w=0
  · simp [hw,kernel]
  by_cases hu : u=0
  · simp [hu,kernel]
  rw [kernel,kernel,kernel,norm_mul,Real.log_mul (norm_ne_zero_iff.mpr hw) (norm_ne_zero_iff.mpr hu),
    ofReal_add,mul_add,exp_add]
  ring

lemma norm_kernel (s w : ℂ) (hw : w≠0) : ‖kernel s w‖ = ‖w‖^(1-2*s.re) := by
  have hp := norm_pos_iff.mpr hw
  rw [kernel,norm_mul,norm_exp,Real.rpow_def_of_pos hp]
  nth_rw 1 [← Real.exp_log hp]
  rw [← Real.exp_add]
  congr 1
  simp [Complex.mul_re]
  ring

lemma kernel_differentiable (w : ℂ) : Differentiable ℂ (kernel · w) := by
  unfold kernel
  fun_prop

lemma norm_log_error {u : ℂ} (hu : ‖u‖ ≤ 1/2) :
    |Real.log ‖1+u‖-u.re| ≤ ‖u‖^2 := by
  have hi : (1-‖u‖)⁻¹ ≤ 2 := by
    rw [inv_eq_one_div,div_le_iff₀ (by linarith)]
    linarith
  calc
    _ ≤ ‖log (1+u)-u‖ := by simpa only [sub_re, log_re] using abs_re_le_norm (log (1+u)-u)
    _ ≤ ‖u‖^2 * (1-‖u‖)⁻¹ / 2 := norm_log_one_add_sub_self_le (by linarith)
    _ ≤ ‖u‖^2 * 2 / 2 := by gcongr
    _ = _ := by ring

noncomputable def linearPart (s u : ℂ) := u - 2*s*(u.re : ℂ)

lemma local_error {s u : ℂ} {R : ℝ} (hs : ‖s‖ ≤ R) (hu : ‖u‖ ≤ 1/2)
    (hsmall : 3*R*‖u‖ ≤ 1) :
    ‖kernel s (1+u) - 1 - linearPart s u‖ ≤ (9*R^2+8*R)*‖u‖^2 := by
  have hR := (norm_nonneg s).trans hs
  have hu0 := norm_nonneg u
  let A : ℂ := -2*s*(Real.log ‖1+u‖ : ℂ)
  let B : ℂ := -2*s*(u.re : ℂ)
  have ha : ‖A‖ ≤ 3*R*‖u‖ := by
    have hl : |Real.log ‖1+u‖| ≤ 3/2*‖u‖ :=
      by simpa only [log_re] using (abs_re_le_norm (log (1+u))).trans (norm_log_one_add_half_le_self hu)
    dsimp [A]
    simp only [norm_mul,norm_neg,Complex.norm_ofNat,Complex.norm_real,Real.norm_eq_abs]
    calc
      _ ≤ 2*R*(3/2*‖u‖) := by gcongr
      _ = _ := by ring
  have hAB : ‖A-B‖ ≤ 2*R*‖u‖^2 := by
    dsimp [A,B]
    rw [← mul_sub, ← ofReal_sub]
    simp only [norm_mul,norm_neg,Complex.norm_ofNat,Complex.norm_real,Real.norm_eq_abs]
    gcongr
    exact norm_log_error hu
  have e : kernel s (1+u) - 1 - linearPart s u =
      (exp A-1-A) + (A-B) + u*(exp A-1) := by
    unfold kernel linearPart
    dsimp [A,B]
    ring
  rw [e]
  calc
    _ ≤ (‖exp A-1-A‖+‖A-B‖) + ‖u‖*‖exp A-1‖ := by
      rw [← norm_mul]
      exact (norm_add_le _ _).trans (add_le_add (norm_add_le _ _) le_rfl)
    _ ≤ ((3*R*‖u‖)^2+2*R*‖u‖^2) + ‖u‖*(2*(3*R*‖u‖)) := by
      gcongr
      · exact (norm_exp_sub_one_sub_id_le (ha.trans hsmall)).trans (pow_le_pow_left₀ (norm_nonneg _) ha 2)
      · exact (norm_exp_sub_one_le (ha.trans hsmall)).trans (by gcongr)
    _ = _ := by ring

noncomputable def difference (a : ℕ) (z w s : ℂ) :=
  (a:ℂ)^2 * (kernel s (w+z)-kernel s w) -
    (a:ℂ) * (kernel s (w+(a:ℂ)*z)-kernel s w)

lemma linear_nat (a : ℕ) (s u : ℂ) :
    linearPart s ((a:ℂ)*u) = (a:ℂ)*linearPart s u := by
  simp [linearPart, Complex.mul_re]
  ring

lemma difference_bound {s z w : ℂ} (hw : w≠0) {R : ℝ} (hs : ‖s‖ ≤ R) (a : ℕ)
    (hu : ‖z/w‖ ≤ 1/2) (hv : ‖(a:ℂ)*(z/w)‖ ≤ 1/2)
    (hsu : 3*R*‖z/w‖ ≤ 1) (hsv : 3*R*‖(a:ℂ)*(z/w)‖ ≤ 1) :
    ‖difference a z w s‖ ≤ (((a:ℝ)^2+(a:ℝ)^3)*(9*R^2+8*R)*‖z‖^2) *
      ‖w‖^(-1-2*s.re) := by
  let u := z/w
  let err (v : ℂ) := kernel s (1+v) - 1 - linearPart s v
  have e : difference a z w s = kernel s w * ((a:ℂ)^2*err u-(a:ℂ)*err ((a:ℂ)*u)) := by
    have e₁ : w+z = w*(1+u) := by dsimp [u]; field_simp
    have e₂ : w+(a:ℂ)*z = w*(1+(a:ℂ)*u) := by dsimp [u]; field_simp
    unfold difference
    rw [e₁,e₂,kernel_mul,kernel_mul]
    dsimp [err]
    rw [linear_nat]
    ring
  have h₁ := local_error hs hu hsu
  have h₂ := local_error hs hv hsv
  rw [e,norm_mul,norm_kernel _ _ hw]
  calc
    _ ≤ ‖w‖^(1-2*s.re) * ((a:ℝ)^2 * ((9*R^2+8*R)*‖u‖^2) +
        (a:ℝ) * ((9*R^2+8*R)*‖(a:ℂ)*u‖^2)) := by
      gcongr
      apply (norm_sub_le _ _).trans
      simp only [norm_mul,norm_pow,Complex.norm_natCast]
      gcongr
      simpa only [norm_mul,Complex.norm_natCast] using h₂
    _ = _ := by
      have hp := norm_pos_iff.mpr hw
      have he : (-1-2*s.re)=(1-2*s.re)-2 := by ring
      simp only [u,norm_div,norm_mul,Complex.norm_natCast]
      rw [he,Real.rpow_sub hp (1-2*s.re) 2,Real.rpow_ofNat]
      ring

def domain : Set ℂ := {s | 3/4 < s.re}

lemma domain_open : IsOpen domain := isOpen_lt continuous_const continuous_re

theorem regularized_summable (L : PeriodPair) (a : ℕ) (z : ℂ) :
    SummableLocallyUniformlyOn (fun (w : L.lattice) => difference a z w) domain := by
  apply SummableLocallyUniformlyOn.of_locally_bounded_eventually domain_open
  intro K hK hc
  obtain ⟨R₀,hR₀⟩ := hc.exists_bound_of_continuousOn (continuous_id (X := ℂ)).continuousOn
  let R := max R₀ 1
  have hR : 0 ≤ R := le_trans (by norm_num : (0:ℝ)≤1) (le_max_right _ _)
  let C := ((a:ℝ)^2+(a:ℝ)^3)*(9*R^2+8*R)*‖z‖^2
  have hC : 0 ≤ C := by dsimp [C]; positivity
  refine ⟨fun w => C*‖(w:ℂ)‖^(-5/2:ℝ),
    (ZLattice.summable_norm_rpow L.lattice _ (by simp; norm_num)).mul_left _, ?_⟩
  have htop : Tendsto (fun w : L.lattice => ‖(w:ℂ)‖) cofinite atTop :=
    tendsto_norm_comp_cofinite_atTop_of_isClosedEmbedding L.isClosed_lattice.isClosedEmbedding_subtypeVal
  have ht : Tendsto (fun w : L.lattice => ‖z/(w:ℂ)‖) cofinite (𝓝 0) := by
    simp only [norm_div]
    exact tendsto_const_nhds.div_atTop htop
  have ht' : Tendsto (fun w : L.lattice => ‖(a:ℂ)*(z/(w:ℂ))‖) cofinite (𝓝 0) := by
    simpa only [norm_mul,mul_zero] using ht.const_mul ‖(a:ℂ)‖
  have hu := ht.eventually_le_const (by norm_num : (0:ℝ)<1/2)
  have hv := ht'.eventually_le_const (by norm_num : (0:ℝ)<1/2)
  have hsu : ∀ᶠ w : L.lattice in cofinite, 3*R*‖z/(w:ℂ)‖ ≤ 1 :=
    ((ht.const_mul (3*R)).eventually_le_const (by simp))
  have hsv : ∀ᶠ w : L.lattice in cofinite, 3*R*‖(a:ℂ)*(z/(w:ℂ))‖ ≤ 1 :=
    ((ht'.const_mul (3*R)).eventually_le_const (by simp))
  filter_upwards [hu,hv,hsu,hsv,htop.eventually_ge_atTop 1] with w h1 h2 h3 h4 hw
  intro s hs
  have hsR : ‖s‖ ≤ R := (hR₀ s hs).trans (le_max_left _ _)
  apply (difference_bound (norm_pos_iff.mp (lt_of_lt_of_le zero_lt_one hw)) hsR a h1 h2 h3 h4).trans
  apply mul_le_mul_of_nonneg_left _ hC
  exact Real.rpow_le_rpow_of_exponent_le hw (by have := hK hs; change 3/4 < s.re at this; linarith)

noncomputable def regularized (L : PeriodPair) (a : ℕ) (z s : ℂ) :=
  ∑' w : L.lattice, difference a z w s

theorem regularized_holomorphic (L : PeriodPair) (a : ℕ) (z : ℂ) :
    DifferentiableOn ℂ (regularized L a z) domain := by
  apply (regularized_summable L a z).differentiableOn domain_open
  intro w s _
  unfold difference kernel
  fun_prop

open scoped ComplexConjugate

lemma kernel_one (w : ℂ) : kernel 1 w = conj (w⁻¹) := by
  by_cases hw : w = 0
  · simp [hw,kernel]
  have hp := norm_pos_iff.mpr hw
  have e : (-2:ℂ)*1*(Real.log ‖w‖ : ℂ) = (↑(-2*Real.log ‖w‖ : ℝ):ℂ) := by push_cast; ring
  rw [kernel,e,← Complex.ofReal_exp,show (-2:ℝ)*Real.log ‖w‖ = -(Real.log ‖w‖ * 2) by ring,
    Real.exp_neg,Real.exp_mul,Real.exp_log hp,Real.rpow_ofNat,← normSq_eq_norm_sq,Complex.inv_def]
  simp

theorem regularized_critical (L : PeriodPair) (a : ℕ) (z : ℂ) :
    regularized L a z 1 = -conj (TunnellEllipticZeta.multiplicationZeta L a z) := by
  let f (z : ℂ) (w : L.lattice) := TunnellEllipticZeta.summand (-w) z
  have hf (z : ℂ) : HasSum (f z) (TunnellEllipticZeta.zeta L z) := by
    exact (Equiv.neg L.lattice).hasSum_iff.mpr (TunnellEllipticZeta.locally_uniform L).hasSum
  have ht := ((hf z).mul_left ((a:ℂ)^2)).sub ((hf ((a:ℂ)*z)).mul_left (a:ℂ))
  unfold regularized
  rw [show -conj (TunnellEllipticZeta.multiplicationZeta L a z) =
      conj ((a:ℂ)^2*TunnellEllipticZeta.zeta L z-(a:ℂ)*TunnellEllipticZeta.zeta L ((a:ℂ)*z)) by
        rw [← map_neg]; congr 1; unfold TunnellEllipticZeta.multiplicationZeta; ring,
    ← ht.tsum_eq,Complex.conj_tsum]
  apply tsum_congr
  intro w
  simp only [difference,kernel_one, f, TunnellEllipticZeta.summand, sub_neg_eq_add, inv_neg,
    neg_sq, map_sub,map_add,map_mul,map_pow,map_neg,map_natCast, map_div₀, map_inv₀]
  rw [add_comm (conj z) (conj (w:ℂ)),add_comm ((a:ℂ)*conj z) (conj (w:ℂ))]
  ring

lemma shifted_summable (L : PeriodPair) (z s : ℂ) (hs : 3/2<s.re) :
    Summable (fun w : L.lattice => kernel s (w+z)) := by
  have he : 1-2*s.re < -2 := by linarith
  apply Summable.of_norm
  apply (ZLattice.summable_norm_sub_rpow L.lattice (1-2*s.re) (by simpa using he) (-z)).congr
  intro w
  simp only [sub_neg_eq_add]
  by_cases h : (w:ℂ)+z=0
  · rw [h]
    simp [kernel,Real.zero_rpow (show 1-2*s.re≠0 by linarith)]
  · exact (norm_kernel _ _ h).symm

lemma unshifted_zero (L : PeriodPair) (s : ℂ) : ∑' w : L.lattice, kernel s w = 0 := by
  have h := (Equiv.neg L.lattice).tsum_eq (fun w : L.lattice => kernel s w)
  simp only [Equiv.neg_apply,Submodule.coe_neg] at h
  have hneg (w : ℂ) : kernel s (-w) = -(kernel s w) := by simp [kernel]
  simp only [hneg,tsum_neg] at h
  linear_combination -h/2

lemma shifted_period (L : PeriodPair) (z s : ℂ) (l : L.lattice) :
    (∑' w : L.lattice, kernel s (w+(z+l))) = ∑' w : L.lattice, kernel s (w+z) := by
  convert (Equiv.addRight l).tsum_eq (fun w : L.lattice => kernel s (w+z)) using 2 with w
  congr 1
  simp [add_left_comm,add_comm,add_assoc]

theorem regularized_large (L : PeriodPair) (a : ℕ) (z s : ℂ) (hs : 3/2<s.re)
    (hz : ((a:ℂ)-1)*z ∈ L.lattice) :
    regularized L a z s = ((a:ℂ)^2-(a:ℂ)) * ∑' w : L.lattice, kernel s (w+z) := by
  let l : L.lattice := ⟨((a:ℂ)-1)*z,hz⟩
  have he : (a:ℂ)*z=z+l := by dsimp [l]; ring
  have h₀ : Summable fun w : L.lattice => kernel s w := by
    simpa using shifted_summable L 0 s hs
  have h := (((shifted_summable L z s hs).hasSum.sub h₀.hasSum).mul_left ((a:ℂ)^2)).sub
    (((shifted_summable L ((a:ℂ)*z) s hs).hasSum.sub h₀.hasSum).mul_left (a:ℂ))
  rw [show regularized L a z s = _ from h.tsum_eq,unshifted_zero,he,shifted_period]
  ring

end TunnellCMRegularized
