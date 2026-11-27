import TunnellRankinPeterssonAnalytic
import TunnellRankinPeriod

/-! The central Petersson integral and its exact finite winding normalization. -/
namespace TunnellRankinIntegral
open Complex Set Filter Metric TunnellRankin TunnellRankinEisenstein TunnellShell
open TunnellFullClassTheta TunnellRankinCotangent TunnellClassThetaMellin TunnellEtaValue
open TunnellFiniteSymbols TunnellFricke
open UpperHalfPlane hiding I
open scoped ComplexConjugate Topology
noncomputable section

lemma central_unique {F G : ℂ→ℂ} (hf : AnalyticOnNhd ℂ F window)
    (hg : AnalyticOnNhd ℂ G {s : ℂ | 1≤ s.re}) (he : ∀ s : ℝ, 8<s → F s=G s) : F 1=G 1 := by
  let U : Set ℂ := {s : ℂ | 1≤ s.re} ∩ ball 0 12
  have hc : Convex ℝ U := (convex_halfSpace_re_ge 1).inter (convex_ball (0:ℂ) _)
  have hsub : U⊆window := fun s hs => ⟨by have := hs.1; change 1≤ s.re at this; change 3/4 < s.re; linarith,hs.2⟩
  have hm : Tendsto ((↑):ℝ → ℂ) (𝓝[≠] (9:ℝ)) (𝓝[≠] (9:ℂ)) := by
    apply continuous_ofReal.continuousWithinAt.tendsto_nhdsWithin
    intro x hx hy
    apply hx
    change (x:ℂ)=(9:ℂ) at hy
    exact_mod_cast hy
  apply (hf.mono hsub).eqOn_of_preconnected_of_frequently_eq (hg.mono inter_subset_left) hc.isPreconnected
    (z₀:=(9:ℂ)) (by norm_num [U,mem_ball_zero_iff])
  · apply hm.frequently
    apply Filter.Eventually.frequently
    filter_upwards [(eventually_gt_nhds (show (8:ℝ)<9 by norm_num)).filter_mono nhdsWithin_le_nhds] with s hs
    exact he s hs
  · norm_num [U,mem_ball_zero_iff]

lemma Lstar_analytic {N : ℕ} [NeZero N] (χ : DirichletCharacter ℂ N) (hn : χ≠1) :
    AnalyticOnNhd ℂ (fun s : ℂ => conj (χ.LFunction (2*conj s-1))) univ := by
  suffices H : Differentiable ℂ (fun s : ℂ => conj (χ.LFunction (2*conj s-1))) from fun s _ => H.analyticAt s
  intro s
  have h : DifferentiableAt ℂ (fun z : ℂ => χ.LFunction (2*z-1)) (conj s) :=
    (DirichletCharacter.differentiable_LFunction hn _).comp _ (by fun_prop)
  simpa only [Function.comp_def,Complex.conj_conj] using h.conj_conj

variable {d : ℕ} {b : Triple} (hsq : Squarefree (2*d)) (hd : d%4=1) (hb : b∈shell (2*d))

include hsq hb in
lemma negative_real :
    haveI : NeZero (4*(2*d)) := ⟨by omega⟩
    conj ((negCharacter d (by omega)).LFunction 1)=(negCharacter d (by omega)).LFunction 1 := by
  letI : NeZero (4*(2*d)) := ⟨by omega⟩
  have hc := class_number hsq (by omega) hb hd
  change (v d:ℂ)*(negCharacter d (by omega)).LFunction 1=Real.pi*hclass (b:=b) at hc
  have h := congrArg conj hc
  simp only [map_mul,Complex.conj_ofReal,hclass,map_natCast] at h
  exact mul_left_cancel₀ (by exact_mod_cast (v_pos (show 0<d by omega)).ne' : (v d:ℂ)≠0) (h.trans hc.symm)

def thetaProduct (θ ψ : ℍ→ℂ) (z : ℍ) := (z.im:ℂ)^2*etaValue z*conj (θ z*ψ z)

lemma central_product :
    haveI : NeZero (4*(2*d)) := ⟨by omega⟩
    let θ := full hsq (by omega) hb
    petersson (4*(2*d)*4) (integrand (k:=4) (negCharacter d (by omega)) θ 1) =
      (2*Real.pi/(v d:ℂ))*petersson (4*(2*d)*4) (thetaProduct θ (fun z => θ (multiple 4 z))) := by
  letI : NeZero (4*(2*d)) := ⟨by omega⟩
  let θ := full hsq (by omega) hb
  let a : ℂ := 2*Real.pi/(v d:ℂ)
  have ha : conj a=a := by norm_num [a,map_ofNat]
  have ee (z : ℍ) : integrand (k:=4) (negCharacter d (by omega)) θ 1 z=
      a*thetaProduct θ (fun w => θ (multiple 4 w)) z := by
    rw [integrand,map_one,eisenstein_one hsq hd hb]
    change _*conj (a*θ (multiple 4 z))=_
    simp only [map_mul,ha,thetaProduct]
    ring
  change petersson _ (integrand (k:=4) (negCharacter d (by omega)) θ 1)=a*petersson _ (thetaProduct θ (fun z => θ (multiple 4 z)))
  rw [show integrand (k:=4) (negCharacter d (by omega)) θ 1 = _ from funext ee]
  simp only [petersson,MeasureTheory.integral_const_mul,tsum_mul_left]

/-- The weight-two Petersson pairing is the signed finite winding number times the
square of the base period, with denominator exactly 2π². -/
theorem central_winding :
    let θ := full hsq (by omega) hb
    (2*(Real.pi:ℂ)^2)*petersson (4*(2*d)*4) (thetaProduct θ (fun z => θ (multiple 4 z))) =
      (epsilon d (by omega)*winding (2*d) (by omega):ℤ)*baseConstant^2 := by
  letI : NeZero (4*(2*d)) := ⟨by omega⟩
  let θ := full hsq (by omega) hb
  let χ := negCharacter d (by omega)
  let a : ℂ := 4*Real.pi
  let P (s : ℂ) := petersson (4*(2*d)*4) (integrand (k:=4) χ θ s)
  obtain ⟨M,hM,hm,hv⟩ := normalized_mellin d hsq.of_mul_right hd
  let G (s : ℂ) := 4*conj (χ.LFunction (2*conj s-1))*a^(-s)*M s
  have hχ : χ≠1 := by
    intro e
    have hh := negCharacter_odd hd
    change χ _= -1 at hh
    rw [e,MulChar.one_apply (by simp)] at hh
    norm_num at hh
  have ha : a≠0 := by dsimp [a]; exact mul_ne_zero (by norm_num) (by exact_mod_cast Real.pi_ne_zero)
  have hg : AnalyticOnNhd ℂ G {s : ℂ | 1≤ s.re} := by
    apply AnalyticOnNhd.mul _ hM
    apply AnalyticOnNhd.mul (analyticOnNhd_const.mul ((Lstar_analytic χ hχ).mono (subset_univ _)))
    exact fun s _ => (differentiable_id.neg.const_cpow (.inl ha)).analyticAt s
  have e := central_unique (petersson_analytic hsq hd hb) hg (by
    intro s hs
    dsimp only [G]
    rw [petersson_large hsq hd hb s hs,hm s (by linarith),Complex.conj_ofReal])
  change P 1=G 1 at e
  have eL := negative_real hsq hd hb
  change conj (χ.LFunction 1)=χ.LFunction 1 at eL
  simp only [G,map_one,mul_one,show (2:ℂ)-1=1 by norm_num,eL,Complex.cpow_neg_one] at e
  have hV : v d=Real.sqrt (8*d) := by
    have hh := v_sq d
    push_cast at hh
    nlinarith [v_pos (show 0<d by omega),Real.sq_sqrt (by positivity : 0≤8*(d:ℝ)),Real.sqrt_nonneg (8*(d:ℝ))]
  rw [←hV] at hv
  change (v d:ℂ)*χ.LFunction 1*M 1=_ at hv
  have hh := central_product hsq hd hb
  change P 1=(2*Real.pi/(v d:ℂ))*_ at hh
  have v0 : (v d:ℂ)≠0 := by exact_mod_cast (v_pos (show 0<d by omega)).ne'
  have pi0 : (Real.pi:ℂ)≠0 := by exact_mod_cast Real.pi_ne_zero
  rw [hh] at e
  dsimp [a] at e
  field_simp [v0,pi0] at e
  rw [←hv]
  exact e
end
end TunnellRankinIntegral
#print axioms TunnellRankinIntegral.central_winding
