import TunnellFrickeCusps
import TunnellSymbolTwist
import Mathlib.MeasureTheory.Integral.IntegralEqImproper

/-! The actual paired vertical integrals are integral multiples of the base central value. -/

set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false

namespace TunnellFricke

open Complex Filter Set MeasureTheory TunnellModularSymbol
open UpperHalfPlane hiding I
open scoped Topology

noncomputable def path (r : ℝ) (t : ℂ) := 4*((r:ℂ)+I*t)

lemma path_im (r t : ℝ) : (path r t).im = 4*t := by simp [path,mul_im]

lemma tendsto_path_bottom (r : ℝ) :
    Tendsto (fun t : ℝ => path r t) (𝓝[>] 0) (cusp (4*r)) := by
  apply tendsto_comap_iff.mpr
  apply Tendsto.congr' _ (tendsto_inv_nhdsGT_zero |>.const_mul_atTop (by norm_num : (0:ℝ)<1/4))
  filter_upwards [self_mem_nhdsWithin] with t ht
  change (1/4)*t⁻¹ = height (4*r) (path r t)
  rw [height,path_im,show path r t-(↑(4*r):ℂ) = 4*I*t by simp [path,mul_add,mul_assoc]]
  simp only [map_mul,normSq_I,normSq_ofReal]
  norm_num [normSq_apply]
  have ht' : 0<t := ht
  field_simp <;> norm_num

lemma tendsto_path_top (r : ℝ) :
    Tendsto (fun t : ℝ => path r t) atTop (comap Complex.im atTop) := by
  apply tendsto_comap_iff.mpr
  simpa only [Function.comp_def,path_im,id_eq] using
    (tendsto_id (α:=ℝ) (x:=atTop)).const_mul_atTop (by norm_num : (0:ℝ)<4)

lemma path_deriv (r : ℝ) (z : ℂ) : HasDerivAt (path r) (4*I) z := by
  unfold path
  simpa using (((hasDerivAt_id z).const_mul I).const_add (r:ℂ)).const_mul 4

theorem symbol_eq_boundary {Γ : Subgroup (GL (Fin 2) ℝ)} [Γ.IsArithmetic]
    (hw : Γ.strictWidthInfty=1) (F : CuspForm Γ 2)
    (hF : ∀ z : ℍ, F z = h (4*(z:ℂ))) (r : ℚ) {J : ℂ → ℂ} {A : ℂ}
    (hJ : ∀ z, 0<z.im → HasDerivAt J (c*h z) z)
    (h0 : Tendsto J (comap Complex.im atTop) (𝓝 0))
    (hb : Tendsto J (cusp (4*(r:ℝ))) (𝓝 A)) : periodSymbol F r = A := by
  let f (t : ℝ) := F ((r:ℝ) +ᵥ ofComplex (I*t))
  let g (t : ℝ) := if t=0 then A else J (path r t)
  have hfall (t : ℝ) (ht : 0<t) : f t = h (path r t) := by
    unfold f
    rw [hF,coe_vadd,ofComplex_apply_of_im_pos (by simpa using ht)]
    rfl
  have hder (t : ℝ) (ht : 0<t) : HasDerivAt g (-(2*(Real.pi:ℂ))*f t) t := by
    have hd := (hJ (path r t) (by rw [path_im]; positivity)).comp (t:ℂ) (path_deriv r t) |>.comp_ofReal
    have hh : c*h (path r t)*(4*I) = -(2*(Real.pi:ℂ))*f t := by
      rw [hfall t ht,c]
      linear_combination (2*(Real.pi:ℂ)*h (path r t))*I_sq
    rw [hh] at hd
    apply hd.congr_of_eventuallyEq
    filter_upwards [eventually_ne_nhds ht.ne'] with u hu
    simp [g,hu,Function.comp_def]
  have hg : ContinuousWithinAt g (Ici 0) 0 := by
    rw [← continuousWithinAt_Ioi_iff_Ici]
    change Tendsto g _ (𝓝 (g 0))
    simp only [g,if_pos rfl]
    apply (hb.comp (tendsto_path_bottom r)).congr'
    filter_upwards [self_mem_nhdsWithin] with t ht
    simp [ne_of_gt (show 0<t from ht)]
  have hg' : Tendsto g atTop (𝓝 0) := by
    apply (h0.comp (tendsto_path_top r)).congr'
    filter_upwards [eventually_gt_atTop 0] with t ht
    simp [g,ht.ne',Function.comp_def]
  have hi : IntegrableOn f (Ioi 0) := integrable_translate hw F r
  have e := integral_Ioi_of_hasDerivAt_of_tendsto hg hder (hi.const_mul (-(2*(Real.pi:ℂ)))) hg'
  rw [integral_const_mul,show g 0 = A by simp [g],zero_sub] at e
  change 2*(Real.pi:ℂ)*(∫ t in Ioi (0:ℝ), f t) = A
  linear_combination -e

theorem paired_symbols {Γ : Subgroup (GL (Fin 2) ℝ)} [Γ.IsArithmetic]
    (hw : Γ.strictWidthInfty=1) (F : CuspForm Γ 2)
    (hF : ∀ z : ℍ, F z = h (4*(z:ℂ))) (r : ℚ) :
    ∃ m : ℤ, periodSymbol F r + periodSymbol F (-(r:ℝ)) = m*periodSymbol F 0 := by
  obtain ⟨J,hJ,h0,hT,C,hW⟩ := primitive
  obtain ⟨a,ha,hb⟩ := paired_cusp_values h0 hT hW (4*r)
  obtain ⟨hz,_,_,_⟩ := cusp_rules h0 hT hW
  have e₀ := symbol_eq_boundary hw F hF 0 hJ h0 (A:=C) (by simpa [Bound] using hz)
  have e₁ := symbol_eq_boundary hw F hF r hJ h0 (A:=(a:ℂ)*C) (by simpa [Bound] using ha)
  have e₂ := symbol_eq_boundary hw F hF (-r) hJ h0 (A:=(star a:ℂ)*C) (by simpa [Bound] using hb)
  simp only [Rat.cast_neg,Rat.cast_zero] at e₂ e₀
  refine ⟨2*a.re,?_⟩
  rw [e₀,e₁,e₂,← add_mul]
  congr 1
  simp [GaussianInt.toComplex_def]
  ring

end TunnellFricke
#print axioms TunnellFricke.paired_symbols
