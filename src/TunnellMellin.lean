import OMAReductions.R_CongruentNumber_Tunnell_even_R1

/-! Uniqueness of analytic continuation and the normalized central Mellin integral. -/

namespace TunnellMellin

open Filter Set Complex UpperHalfPlane MatrixGroups MeasureTheory
open scoped Topology ModularForm

theorem entire_unique {f g : ℂ → ℂ} (hf : AnalyticOnNhd ℂ f univ) (hg : AnalyticOnNhd ℂ g univ)
    (B : ℝ) (h : ∀ x : ℝ, B<x → f x = g x) : f = g := by
  let a : ℝ := B+1
  have hm : Tendsto ((↑) : ℝ → ℂ) (𝓝[≠] a) (𝓝[≠] (a:ℂ)) := by
    exact continuous_ofReal.continuousWithinAt.tendsto_nhdsWithin (fun _ _ => by simp_all)
  apply hf.eq_of_frequently_eq hg (hm.frequently ?_)
  apply Filter.Eventually.frequently
  filter_upwards [(eventually_gt_nhds (show B<a by dsimp [a]; linarith)).filter_mono nhdsWithin_le_nhds] with x hx
  exact h x hx

theorem unique_euler_product {f g : ℂ → ℂ} (hf : AnalyticOnNhd ℂ f univ)
    (hg : AnalyticOnNhd ℂ g univ) {I : Type*} (u : ℝ → I → ℂ) (B : ℝ)
    (h₁ : ∀ x : ℝ, B<x → HasProd (u x) (f x))
    (h₂ : ∀ x : ℝ, B<x → HasProd (u x) (g x)) : f = g :=
  entire_unique hf hg B (fun x hx => (h₁ x hx).unique (h₂ x hx))

theorem central_integral {Γ : Subgroup (GL (Fin 2) ℝ)} [Γ.IsArithmetic] (F : CuspForm Γ 2) :
    ModularForm.L (by decide : (0:ℤ)<2) F 1 =
      (2*Real.pi:ℂ) * ∫ t in Ioi (0:ℝ), F (ofComplex (Complex.I*t)) := by
  rw [ModularForm.L,CuspForm.Λ_eq_mellin,Complex.Gammaℂ_one]
  simp [mellin, smul_eq_mul, mul_comm, div_eq_mul_inv]

end TunnellMellin
