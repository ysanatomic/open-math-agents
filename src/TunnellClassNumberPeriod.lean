import TunnellClassThetaMellin
import TunnellClassDirichlet

/-! The class-number normalization of the central weight-one Eisenstein series. -/
namespace TunnellClassThetaMellin
open Complex TunnellRankin TunnellShell Set Filter
open scoped Topology
noncomputable section

variable {d : ℕ} {b : Triple} (hsq : Squarefree (2*d)) (h2 : (2*d)%4=2) (hb : b∈shell (2*d))

lemma pair_large {s : ℂ} (hs : 1<s.re) :
    (pair hsq h2 hb).Λ s =
      2*Gamma s/((2*Real.pi/v d:ℝ):ℂ)^s * (riemannZeta s * negativeL d (by omega) s) := by
  let u := 2*Real.pi/v d
  have hu : 0<u := div_pos (by positivity) (v_pos (by omega))
  have hs0 : s≠0 := by intro h; rw [h] at hs; norm_num at hs
  have HD := class_hasSum (d:=d) (by omega) hs
  have hsum : Summable (fun m : ℕ => ‖(idealCoeff d m:ℂ)‖/(m:ℝ)^s.re) := by
    apply HD.summable.norm.congr
    intro m
    by_cases hm : m=0
    · subst m; simp [idealCoeff]
    · rw [norm_div,Complex.norm_natCast_cpow_of_pos (Nat.pos_of_ne_zero hm)]
  have hnorm : Summable (fun m : ℕ => ‖(2:ℂ)*(idealCoeff d m:ℂ)‖/(u*(m:ℝ))^s.re) := by
    apply (hsum.mul_left (2/u^s.re)).congr
    intro m
    rw [norm_mul,Complex.norm_ofNat,Real.mul_rpow hu.le (Nat.cast_nonneg _)]
    ring
  have hq (m : ℕ) : 2*(idealCoeff d m:ℂ)=0 ∨ 0<u*m := by
    by_cases hm : m=0
    · simp [hm,idealCoeff]
    · exact Or.inr (mul_pos hu (Nat.cast_pos.mpr (Nat.pos_of_ne_zero hm)))
  let P := pair hsq h2 hb
  have hF (t : ℝ) (ht : t∈Ioi 0) :
      HasSum (fun m : ℕ => (2*(idealCoeff d m:ℂ)) * (Real.exp (-(u*m)*t):ℝ)) (P.f t-P.f₀) := by
    change HasSum _ (classRadial _ _ t-hclass (b:=b))
    simp only [classRadial,add_sub_cancel_left]
    apply ((summable_term d hu ht).hasSum.mul_left 2).congr_fun
    intro m; simp [term,mul_assoc]
  have H := hasSum_mellin (s:=s) hq (by linarith) hF hnorm
  rw [(P.hasMellin (show P.k<s.re from hs)).2] at H
  apply H.unique
  apply (HD.mul_left (2*Gamma s/(u:ℂ)^s)).congr_fun
  intro m
  rw [Complex.ofReal_mul,Complex.mul_cpow_ofReal_nonneg hu.le (Nat.cast_nonneg m),Complex.ofReal_natCast]
  ring

include hsq h2 hb in
theorem class_number (hd : d%4=1) :
    (v d:ℂ)*negativeL d (by omega) 1=Real.pi * hclass (b:=b) := by
  let P := pair hsq h2 hb
  let u := 2*Real.pi/v d
  have hv := v_pos (show 0<d by omega)
  have hu : 0<u := div_pos (by positivity) hv
  haveI : NeZero (4*(2*d)) := ⟨by omega⟩
  have hχ : negCharacter d (by omega)≠1 := by
    intro h
    have e := negCharacter_odd hd
    rw [DirichletCharacter.Odd,h,MulChar.one_apply (by simp)] at e
    norm_num at e
  have incl : Tendsto ((↑):ℝ→ℂ) (𝓝[>] (1:ℝ)) (𝓝[≠] (1:ℂ)) := by
    apply continuous_ofReal.continuousWithinAt.tendsto_nhdsWithin
    intro x hx hx'
    change (x:ℂ)=1 at hx'
    have : x=1 := by exact_mod_cast hx'
    exact (ne_of_gt hx) this
  have hc : ContinuousAt (fun s : ℂ => 2*Gamma s/(u:ℂ)^s * negativeL d (by omega) s) 1 := by
    have hL := ((negCharacter d (by omega)).differentiable_LFunction hχ).continuous.continuousAt (x:=(1:ℂ))
    have hGa : ContinuousAt Gamma (1:ℂ) := (differentiableAt_Gamma 1 (by intro n h; have := congrArg Complex.re h; simp at this; linarith)).continuousAt
    apply ContinuousAt.mul _ hL
    apply (continuousAt_const.mul hGa).div
    · exact continuousAt_id.const_cpow (Or.inl (show (u:ℂ)≠0 by exact_mod_cast hu.ne'))
    · simp [hu.ne']
  have H := (hc.tendsto.comp (incl.mono_right nhdsWithin_le_nhds)).mul (riemannZeta_residue_one.comp incl)
  have H' : Tendsto (fun s : ℝ => ((s:ℂ)-1)*P.Λ s) (𝓝[>] (1:ℝ)) (𝓝 (hclass (b:=b))) := by
    simpa only [P,pair,Complex.ofReal_one,one_smul,smul_eq_mul,one_mul,Function.comp_def] using P.Λ_residue_k.comp incl
  have he := tendsto_nhds_unique H' (H.congr' (by
    filter_upwards [self_mem_nhdsWithin] with s hs
    change 1<s at hs
    change _ = ((s:ℂ)-1)*P.Λ s
    rw [show P.Λ s = _ from pair_large hsq h2 hb (by simpa using hs)]
    dsimp only [Function.comp_apply,u]
    ring))
  simp only [Gamma_one,mul_one,Complex.cpow_one] at he
  dsimp [u] at he
  push_cast at he
  field_simp [hv.ne',Real.pi_ne_zero] at he
  linear_combination -he

end
end TunnellClassThetaMellin
#print axioms TunnellClassThetaMellin.class_number
