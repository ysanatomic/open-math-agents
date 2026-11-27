import TunnellFrickePrimitive
import Mathlib.Analysis.Complex.Order

/-! Eta quotients for the Fermat-quartic modular parameter. -/

namespace TunnellLambda
open Complex hiding eta
open ModularForm EisensteinSeries Set Function Filter
open UpperHalfPlane hiding I
open scoped Topology Real ComplexOrder

noncomputable def U (z : ℂ) : ℂ := 16*(eta (8*z)/eta (2*z))^8
noncomputable def X (z : ℂ) : ℂ := 4*eta (2*z)^4*eta (8*z)^8/eta (4*z)^12
noncomputable def Y (z : ℂ) : ℂ := eta (2*z)^4*eta (8*z)^2/eta (4*z)^6

lemma scale_mem {z : ℂ} (hz : 0<z.im) (a : ℕ) (ha : 0<a) : (a:ℂ)*z∈upperHalfPlaneSet := by
  change 0 < ((a:ℂ)*z).im
  simpa [mul_im] using mul_pos (Nat.cast_pos.mpr ha : 0<(a:ℝ)) hz

lemma eta_deriv {z : ℂ} (hz : 0<z.im) (a : ℕ) (ha : 0<a) :
    HasDerivAt (fun w : ℂ => eta ((a:ℂ)*w))
      (eta ((a:ℂ)*z) * ((a:ℂ)*Real.pi*I/12*E2 ⟨(a:ℂ)*z,scale_mem hz a ha⟩)) z := by
  have hm := scale_mem hz a ha
  have h := logDeriv_eta_eq_E2 ⟨(a:ℂ)*z,hm⟩
  change deriv eta ((a:ℂ)*z) / eta ((a:ℂ)*z) = _ at h
  have he := (div_eq_iff (eta_ne_zero hm)).mp h
  apply (((differentiableAt_eta_of_mem_upperHalfPlaneSet hm).hasDerivAt).comp z
    ((hasDerivAt_id z).const_mul (a:ℂ))).congr_deriv
  change deriv eta ((a:ℂ)*z) * ((a:ℂ)*1) = _
  rw [he]
  ring

lemma hasDerivAt_U {z : ℂ} (hz : 0<z.im) : HasDerivAt U
    (U z * (4*Real.pi*I/3*(4*E2 ⟨8*z,scale_mem hz 8 (by decide)⟩ -
      E2 ⟨2*z,scale_mem hz 2 (by decide)⟩))) z := by
  have h₂ := eta_deriv hz 2 (by decide)
  have h₈ := eta_deriv hz 8 (by decide)
  norm_num only [Nat.cast_ofNat] at h₂ h₈
  have ha : eta (2*z) ≠ 0 := eta_ne_zero (scale_mem hz 2 (by decide))
  apply (((h₈.div h₂ ha).pow 8).const_mul 16).congr_deriv
  simp only [U,Pi.div_apply]
  field_simp
  ring

lemma square_ratio (z : ℂ) (hz : 0<z.im) : X z^2 = U z*Y z^4 := by
  have ha : eta (2*z) ≠ 0 := eta_ne_zero (scale_mem hz 2 (by decide))
  have hb : eta (4*z) ≠ 0 := eta_ne_zero (scale_mem hz 4 (by decide))
  unfold X U Y
  field_simp
  ring

lemma qParam_imag (h t : ℝ) : Periodic.qParam h (I*t) = (Real.exp (-2*Real.pi*t/h):ℝ) := by
  rw [Periodic.qParam,ofReal_exp]
  congr 1
  push_cast
  linear_combination (2*(Real.pi:ℂ)*t/h)*I_sq

noncomputable def etaR (t : ℝ) : ℝ := Real.exp (-2*Real.pi*t/24)*∏' n : ℕ, (1-Real.exp (-2*Real.pi*t)^(n+1))

lemma eta_imag (t : ℝ) : eta (I*t) = (etaR t:ℂ) := by
  have hh := (RCLike.isUniformEmbedding_ofReal (𝕜:=ℂ)).isClosedEmbedding.map_tprod
    (L:=SummationFilter.unconditional ℕ) (g:=Complex.ofRealHom.toMonoidHom) (fun n : ℕ => 1-Real.exp (-2*Real.pi*t)^(n+1))
  unfold eta etaR eta_q
  rw [qParam_imag,qParam_imag,ofReal_mul]
  simp only [RingHom.toMonoidHom_eq_coe,MonoidHom.coe_coe,ofRealHom_eq_coe] at hh
  simp only [ofReal_sub,ofReal_one,ofReal_pow] at hh
  simpa only [div_one] using congrArg (fun w : ℂ => (Real.exp (-2*Real.pi*t/24):ℂ)*w) hh.symm

lemma etaR_pos {t : ℝ} (ht : 0<t) : 0<etaR t := by
  have hq : Real.exp (-2*Real.pi*t)<1 := Real.exp_lt_one_iff.mpr (by nlinarith [mul_pos Real.pi_pos ht])
  have h0 : 0 ≤ etaR t := mul_nonneg (Real.exp_pos _).le (tprod_nonneg (fun n =>
    sub_nonneg.mpr (pow_le_one₀ (Real.exp_pos _).le hq.le)))
  apply lt_of_le_of_ne h0
  intro h
  have hn : eta (I*t) ≠ 0 := eta_ne_zero (show I*t∈upperHalfPlaneSet by change 0<(I*t).im; simpa [mul_im])
  exact hn (by rw [eta_imag,←h,ofReal_zero])

end TunnellLambda
#print axioms TunnellLambda.hasDerivAt_U
