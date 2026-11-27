import Mathlib.Analysis.Complex.Liouville
import Mathlib.Analysis.Calculus.ParametricIntegral
import Mathlib.Analysis.Calculus.Deriv.Slope
import Mathlib.Analysis.SpecificLimits.Basic

/-! A locally holomorphic parameter under a dominated integral, via the Cauchy derivative bound. -/
namespace TunnellRankinParameter
open Complex Set Filter MeasureTheory Metric
open scoped Topology
noncomputable section

variable {α : Type*} [MeasurableSpace α] {μ : Measure α}

lemma derivative_meas {F : ℂ→α→ℂ} (hF : ∀ s, Measurable (F s)) {s₀ : ℂ}
    (h : ∀ x, DifferentiableAt ℂ (F · x) s₀) :
    AEStronglyMeasurable (fun x => deriv (F · x) s₀) μ := by
  let hstep (n : ℕ) : ℂ := 1/((n:ℂ)+1)
  have hlim : Tendsto hstep atTop (𝓝[≠] (0:ℂ)) := by
    apply tendsto_nhdsWithin_iff.mpr
    refine ⟨tendsto_one_div_add_atTop_nhds_zero_nat,Eventually.of_forall fun n => ?_⟩
    change 1/((n:ℂ)+1)≠0
    exact div_ne_zero one_ne_zero (by exact_mod_cast Nat.succ_ne_zero n)
  let V (n : ℕ) (x : α) := (hstep n)⁻¹*(F (s₀+hstep n) x-F s₀ x)
  apply aestronglyMeasurable_of_tendsto_ae atTop
    (f:=V) (fun n => (((hF _).sub (hF _)).const_mul _).aestronglyMeasurable)
  exact Eventually.of_forall fun x => ((h x).hasDerivAt.tendsto_slope_zero.comp hlim)

theorem analytic_integral {U : Set ℂ} (hU : IsOpen U) {F : ℂ→α→ℂ}
    (hF : ∀ s, Measurable (F s)) (hd : ∀ x, AnalyticOnNhd ℂ (F · x) U)
    {B : α→ℝ} (hi : Integrable B μ) (hb : ∀ᵐ x ∂μ, ∀ s∈U,‖F s x‖≤B x) :
    AnalyticOnNhd ℂ (fun s => ∫ x,F s x ∂μ) U := by
  apply DifferentiableOn.analyticOnNhd _ hU
  intro s₀ hs
  obtain ⟨ε,hε,hball⟩ := Metric.isOpen_iff.mp hU s₀ hs
  let r := ε/3
  have hr : 0<r := by dsimp [r]; linarith
  have hadd : r+r<ε := by dsimp [r]; linarith
  have sub {s : ℂ} (hs' : s∈ball s₀ r) : closedBall s r⊆U := by
    apply Set.Subset.trans _ hball
    apply Metric.closedBall_subset_ball'
    linarith [show dist s s₀<r from hs']
  have hca {s : ℂ} (hs' : s∈ball s₀ r) (x : α) :
      DiffContOnCl ℂ (F · x) (ball s r) := by
    apply DifferentiableOn.diffContOnCl
    intro w hw
    exact ((hd x _ (sub hs' (closure_ball_subset_closedBall hw))).differentiableAt).differentiableWithinAt
  have hbound : ∀ᵐ x ∂μ, ∀ s∈ball s₀ r, ‖deriv (F · x) s‖≤B x/r := by
    filter_upwards [hb] with x hx
    intro s hs'
    exact norm_deriv_le_of_forall_mem_sphere_norm_le hr (hca hs' x)
      (fun w hw => hx _ (sub hs' (sphere_subset_closedBall hw)))
  refine (hasDerivAt_integral_of_dominated_loc_of_deriv_le (μ:=μ) (ball_mem_nhds s₀ hr)
    (Eventually.of_forall fun s => (hF s).aestronglyMeasurable)
    (hi.mono' (hF s₀).aestronglyMeasurable (hb.mono fun x hx => hx _ hs))
    (derivative_meas hF (fun x => (hd x s₀ hs).differentiableAt)) hbound (hi.div_const _)
    (Eventually.of_forall fun x s hs' => (hd x s (sub hs' (mem_closedBall_self hr.le))).differentiableAt.hasDerivAt)).2.differentiableAt.differentiableWithinAt

end
end TunnellRankinParameter
#print axioms TunnellRankinParameter.analytic_integral
