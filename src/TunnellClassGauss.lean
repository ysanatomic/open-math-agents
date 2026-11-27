import TunnellClassNumberPeriod

/-! Computing the phase of the primitive odd Gauss sum from quadratic theta duality. -/
namespace TunnellClassThetaMellin
open Complex TunnellRankin DirichletCharacter TunnellShell Set Filter
open scoped Topology

noncomputable section

def product (d : ℕ) (h : 0<d) (s : ℂ) : ℂ :=
  haveI : NeZero (4*(2*d)) := ⟨by omega⟩
  (v d:ℂ)^s * completedRiemannZeta s * (negCharacter d h).completedLFunction s

lemma gamma_normalization {v : ℝ} (hv : 0<v) {s : ℂ} :
    2*Gamma s/((2*Real.pi/v:ℝ):ℂ)^s=(v:ℂ)^s * Gammaℂ s := by
  rw [Complex.ofReal_div,Complex.div_cpow_ofReal_nonneg (by positivity) hv.le,Gammaℂ_def]
  push_cast
  rw [Complex.cpow_neg]
  simp only [div_eq_mul_inv,mul_inv_rev,inv_inv]
  ring

variable {d : ℕ} {b : Triple} (hsq : Squarefree (2*d)) (h2 : (2*d)%4=2) (hb : b∈shell (2*d))

lemma product_large (hd : d%4=1) {s : ℂ} (hs : 1<s.re) :
    (pair hsq h2 hb).Λ s=product d (by omega) s := by
  haveI : NeZero (4*(2*d)) := ⟨by omega⟩
  let χ := negCharacter d (by omega)
  have hs0 : s≠0 := by intro h; norm_num [h] at hs
  have hg1 := Gammaℝ_ne_zero_of_re_pos (by linarith : 0<s.re)
  have hg2 := Gammaℝ_ne_zero_of_re_pos (show 0<(s+1).re by simp; linarith)
  rw [pair_large hsq h2 hb hs,gamma_normalization (v_pos (by omega)),←Gammaℝ_mul_Gammaℝ_add_one,
    riemannZeta_def_of_ne_zero hs0,negativeL,LFunction_eq_completed_div_gammaFactor _ _ (.inl hs0),
    (negCharacter_odd hd).gammaFactor_def,product]
  field_simp

lemma product_upper (hd : d%4=1) :
    EqOn (pair hsq h2 hb).Λ (product d (by omega)) {s : ℂ | 0<s.im} := by
  letI : NeZero (4*(2*d)) := ⟨by omega⟩
  let P := pair hsq h2 hb
  have h0 {z : ℂ} (hz : 0<z.im) : z≠0 ∧ z≠1 := by
    constructor <;> intro h <;> simp [h] at hz
  have ho : IsOpen {s : ℂ | 0<s.im} := isOpen_lt continuous_const continuous_im
  have hf : AnalyticOnNhd ℂ P.Λ {s : ℂ | 0<s.im} := by
    apply DifferentiableOn.analyticOnNhd _ ho
    intro s hs
    exact (P.differentiableAt_Λ (.inl (h0 hs).1) (.inl (by simpa [P,pair] using (h0 hs).2))).differentiableWithinAt
  have hg : AnalyticOnNhd ℂ (product d (by omega)) {s : ℂ | 0<s.im} := by
    apply DifferentiableOn.analyticOnNhd _ ho
    intro s hs
    have hv : (v d:ℂ)≠0 := by exact_mod_cast (v_pos (show 0<d by omega)).ne'
    have H := (negCharacter d (by omega)).differentiableAt_completedLFunction s (.inl (h0 hs).1) (.inl (h0 hs).2)
    exact (((differentiableAt_id.const_cpow (.inl hv)).mul (differentiableAt_completedZeta (h0 hs).1 (h0 hs).2)).mul H).differentiableWithinAt
  apply hf.eqOn_of_preconnected_of_eventuallyEq hg (convex_halfSpace_im_gt 0).isPreconnected
    (z₀:=2+I) (by simp)
  filter_upwards [(isOpen_lt continuous_const continuous_re).mem_nhds (show 1<(2+I).re by norm_num)] with s hs
  exact product_large hsq h2 hb hd hs

include hsq h2 hb in
lemma completed_zero (hd : d%4=1) :
    haveI : NeZero (4*(2*d)) := ⟨by omega⟩
    (negCharacter d (by omega)).completedLFunction 0=hclass (b:=b) := by
  letI : NeZero (4*(2*d)) := ⟨by omega⟩
  let P := pair hsq h2 hb
  let χ := negCharacter d (by omega)
  let t (r : ℝ) := (r:ℂ)*I
  have tn : Tendsto t (𝓝[>] (0:ℝ)) (𝓝[≠] (0:ℂ)) := by
    have he : t 0=0 := by simp [t]
    conv in 𝓝[≠] (0:ℂ) => rw [←he]
    apply (show ContinuousAt t 0 by dsimp [t]; fun_prop).continuousWithinAt.tendsto_nhdsWithin
    intro r hr hr0
    exact (ne_of_gt hr) (by simpa [t] using hr0)
  have ht (r : ℝ) (hr : 0<r) : 0<(t r).im := by simpa [t] using hr
  have hZ : Tendsto (fun s : ℂ => s*completedRiemannZeta s) (𝓝[≠] 0) (𝓝 (-1)) := by
    simpa only [HurwitzZeta.completedHurwitzZetaEven_zero,if_true] using HurwitzZeta.completedHurwitzZetaEven_residue_zero 0
  have hχ : χ≠1 := by
    intro h
    have e : χ.Odd := negCharacter_odd hd
    rw [DirichletCharacter.Odd,h,MulChar.one_apply (by simp)] at e
    norm_num at e
  have hv : (v d:ℂ)≠0 := by exact_mod_cast (v_pos (show 0<d by omega)).ne'
  have hvC : ContinuousAt (fun s : ℂ => (v d:ℂ)^s) 0 := continuousAt_id.const_cpow (.inl hv)
  have H₀ := P.Λ_residue_zero.comp tn
  have HH := ((hvC.tendsto.mono_left nhdsWithin_le_nhds).mul hZ).mul
    ((differentiable_completedLFunction hχ).continuous.continuousAt.tendsto.mono_left nhdsWithin_le_nhds)
  have he := tendsto_nhds_unique H₀ ((HH.comp tn).congr' (by
    filter_upwards [self_mem_nhdsWithin] with r hr
    change _ = t r*P.Λ (t r)
    rw [show P.Λ (t r)=_ from product_upper hsq h2 hb hd (ht r hr), product]
    dsimp only [Function.comp_apply,χ]
    ring))
  simpa [P,pair,χ] using congrArg Neg.neg he.symm

include hsq h2 hb in
theorem gauss_value (hd : d%4=1) :
    haveI : NeZero (4*(2*d)) := ⟨by omega⟩
    gaussSum (negCharacter d (by omega)) ZMod.stdAddChar=I*(v d:ℂ) := by
  letI : NeZero (4*(2*d)) := ⟨by omega⟩
  let χ := negCharacter d (by omega)
  have ho : χ.Odd := negCharacter_odd hd
  have hq : χ.IsQuadratic := TunnellRankinEisenstein.negative_quadratic _
  have hp : χ.IsPrimitive := TunnellRankinEisenstein.negative_primitive hd hsq.of_mul_right
  have e := hp.completedLFunction_one_sub 1
  rw [sub_self,hq.inv,rootNumber,if_neg ho.not_even,pow_one,show (1:ℂ)-1/2=1/2 by ring] at e
  have nn : (((4*(2*d):ℕ):ℂ)^(1/2:ℂ))≠0 := Complex.cpow_ne_zero_iff.mpr (.inl (by exact_mod_cast NeZero.ne (4*(2*d))))
  have h' : χ.completedLFunction 0 = (gaussSum χ ZMod.stdAddChar/I)*χ.completedLFunction 1 := by
    rw [e]; field_simp
  have hg : Gammaℝ (1+1)=1/(Real.pi:ℂ) := by simpa using (Gammaℝ_mul_Gammaℝ_add_one 1).trans Gammaℂ_one
  have hχ : χ≠1 := by
    intro h; rw [DirichletCharacter.Odd,h,MulChar.one_apply (by simp)] at ho; norm_num at ho
  have hL := χ.LFunction_eq_completed_div_gammaFactor 1 (.inl one_ne_zero)
  rw [ho.gammaFactor_def,hg] at hL
  have hnL : χ.completedLFunction 1 ≠ 0 := by
    intro h; rw [h,zero_div] at hL; exact χ.LFunction_apply_one_ne_zero hχ hL
  have hn := class_number hsq h2 hb hd
  change (v d:ℂ)*χ.LFunction 1=Real.pi*hclass (b:=b) at hn
  rw [hL,←completed_zero hsq h2 hb hd] at hn
  change _=Real.pi*χ.completedLFunction 0 at hn
  rw [h'] at hn
  change gaussSum χ ZMod.stdAddChar=I*(v d:ℂ)
  field_simp [Real.pi_ne_zero] at hn
  simpa only [mul_comm] using hn.symm

end
end TunnellClassThetaMellin
#print axioms TunnellClassThetaMellin.gauss_value
