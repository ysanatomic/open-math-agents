import TunnellCentralSeries

/-! The Fourier coefficients of the level-128 eta-theta product. -/

namespace TunnellCentralSeries

open UpperHalfPlane Function ModularForm Filter
open scoped Topology PowerSeries.WithPiTopology

lemma cuspFunction_of_disk {f : ℍ → ℂ} {g : ℂ → ℂ}
    (hg : ContinuousAt g 0) (hfg : ∀ z : ℍ, f z = g (Periodic.qParam 1 (z:ℂ))) :
    cuspFunction 1 f =ᶠ[𝓝 0] g := by
  have hn (q : ℂ) (hq : ‖q‖ < 1) (h0 : q ≠ 0) : cuspFunction 1 f q = g q := by
    have hi := Periodic.im_invQParam_pos_of_norm_lt_one one_pos hq h0
    rw [cuspFunction, Periodic.cuspFunction_eq_of_nonzero _ _ h0, comp_apply,
      ofComplex_apply_of_im_pos hi, hfg]
    exact congrArg g (Periodic.qParam_right_inv one_ne_zero h0)
  have hp : cuspFunction 1 f =ᶠ[𝓝[≠] 0] g := by
    filter_upwards [self_mem_nhdsWithin, mem_nhdsWithin_of_mem_nhds
      (Metric.ball_mem_nhds (0:ℂ) (by norm_num : 0 < (1:ℝ)))] with q h0 hq
    exact hn q (by simpa using hq) h0
  have ht : Tendsto (cuspFunction 1 f) (𝓝[≠] 0) (𝓝 (g 0)) :=
    (hg.tendsto.mono_left nhdsWithin_le_nhds).congr' hp.symm
  have hz : cuspFunction 1 f 0 = g 0 :=
    (Periodic.cuspFunction_zero_eq_limUnder_nhds_ne 1 (f ∘ ofComplex)).trans ht.limUnder_eq
  filter_upwards [Metric.ball_mem_nhds (0:ℂ) (by norm_num : 0 < (1:ℝ))] with q hq
  rcases eq_or_ne q 0 with rfl | h0
  · exact hz
  · exact hn _ (by simpa using hq) h0

theorem qExpansion_theta_coefficient (m : ℕ) :
    (qExpansion 1 (fun z : ℍ => eta (8*(z:ℂ)) * eta (16*(z:ℂ)) * jacobiTheta (8*(z:ℂ)))).coeff m =
      (PowerSeries.coeff m ((PowerSeries.X : PowerSeries ℤ) *
        (∏' k : ℕ, (1 - PowerSeries.X ^ (8 * (k + 1)))) *
        (∏' k : ℕ, (1 - PowerSeries.X ^ (16 * (k + 1)))) *
        (1 + 2 * ∑' k : ℕ, PowerSeries.X ^ (4 * (k + 1) ^ 2))) : ℤ) := by
  have hc := product_locally_uniform.continuousOn (.of_forall fun D => by fun_prop)
  have hd := cuspFunction_of_disk (hc.continuousAt (Metric.ball_mem_nhds (0:ℂ) one_pos)) upper_value
  rw [qExpansion_coeff, hd.iteratedDeriv_eq]
  exact analytic_theta_coefficient m

#print axioms qExpansion_theta_coefficient

end TunnellCentralSeries
