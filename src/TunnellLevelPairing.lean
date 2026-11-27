import TunnellRankinIntegrandGrowth
import TunnellTraceRegular

/-! Modular invariance and integrability of the actual theta-product Petersson
integrand, including every translated modular polygon. -/
namespace TunnellLevelPairing
open Complex Matrix MatrixGroups ModularGroup ModularForm CongruenceSubgroup MeasureTheory
open TunnellRankinIntegral TunnellHalfPairing TunnellRankinEisenstein TunnellRankin TunnellShell
open TunnellFullClassTheta TunnellRankinCotangent TunnellClassThetaMellin TunnellEtaValue
open UpperHalfPlane hiding I
open scoped ModularForm ComplexConjugate
noncomputable section

lemma pair_eta (F : ℍ→ℂ) (z : ℍ) : pair F z=(z.im:ℂ)^2*etaValue z*conj (F z) := rfl

lemma pair_pull {g : SL(2,ℤ)} (h : g∈Gamma0 32) (F : ℍ→ℂ) (z : ℍ) :
    pair F (g • z)=pair (F ∣[(2:ℤ)] g) z := by
  let J := denom g z
  have hn : J≠0 := denom_ne_zero _ _
  have hc : conj J≠0 := (map_ne_zero conj).mpr hn
  rw [pair_eta,pair_eta,SL_slash_apply,TunnellEtaLevel.eta_level _ h,ModularGroup.im_smul_eq_div_normSq,normSq_eq_norm_sq]
  change ((z.im/‖J‖^2:ℝ):ℂ)^2*(J^2*etaValue z)*conj (F (g • z)) =
      (z.im:ℂ)^2*etaValue z*conj (F (g • z)*J^(-2:ℤ))
  rw [map_mul,map_zpow₀]
  rw [_root_.zpow_neg,zpow_ofNat]
  field_simp [hc]
  linear_combination etaValue z*conj (F (g • z))*height_cancel z.im hn

variable {d : ℕ} {b : Triple} (hn : Squarefree (2*d)) (hd : d%4=1) (hb : b∈shell (2*d))
def source (z : ℍ) := full hn (by omega) hb z*full hn (by omega) hb (multiple 4 z)

lemma source_invariant (g : SL(2,ℤ)) (h : g∈Gamma0 (32*d)) :
    (source hn hd hb) ∣[(2:ℤ)] g=source hn hd hb := by
  let θ := full hn (by omega) hb
  let χ := negCharacter d (by omega)
  let J := denom g
  have hN : g∈Gamma0 (4*(2*d)) := gamma_dvd (by exact ⟨4,by ring⟩) h
  have hL : g∈Gamma0 (4*(2*d)*4) := by convert h using 2; ring
  funext z
  rw [SL_slash_apply,source,full_action_one hn hd hb z g hN]
  have e := full_action hn hd hb (k:=4) z g hL
  change χ _*θ (multiple 4 (g • z))=J z*θ (multiple 4 z) at e
  change χ _*J z*θ z*θ (multiple 4 (g • z))*(J z)^(-2:ℤ)=θ z*θ (multiple 4 z)
  have hz : J z≠0 := denom_ne_zero _ _
  rw [_root_.zpow_neg,zpow_ofNat]
  field_simp
  linear_combination (θ z)*e

lemma high_invariant (g : SL(2,ℤ)) (h : g∈Gamma0 (32*d)) (z : ℍ) :
    pair (source hn hd hb) (g • z)=pair (source hn hd hb) z := by
  rw [pair_pull (gamma_dvd (dvd_mul_right 32 _) h),source_invariant hn hd hb g h]

lemma high_relation (z : ℍ) :
    haveI : NeZero (4*(2*d)) := ⟨by omega⟩
    integrand (k:=4) (negCharacter d (by omega)) (full hn (by omega) hb) 1 z =
      (2*Real.pi/(v d:ℂ))*pair (source hn hd hb) z := by
  letI : NeZero (4*(2*d)) := ⟨by omega⟩
  rw [integrand,map_one,eisenstein_one hn hd hb]
  rw [pair_eta]
  unfold source
  simp only [map_mul,map_div₀,Complex.conj_ofReal,map_ofNat]
  have eq4 : multiple ⟨4,by decide⟩ z = multiple 4 z := rfl
  rw [eq4]
  ring

lemma high_meas : Measurable (pair (source hn hd hb)) := by
  have hm := full_meas hn hd hb
  change Measurable (fun z : ℍ => (z.im:ℂ)^2*etaValue z*conj (full hn (by omega) hb z*full hn (by omega) hb (multiple 4 z)))
  apply Measurable.mul
  · exact ((Complex.continuous_ofReal.comp UpperHalfPlane.continuous_im).measurable.pow_const 2).mul etaValue_hol.continuous.measurable
  · apply Complex.continuous_conj.measurable.comp
    apply hm.mul (hm.comp _)
    exact (UpperHalfPlane.isEmbedding_coe.continuous_iff.mpr (continuous_const.mul UpperHalfPlane.continuous_coe)).measurable

lemma high_integrable (g : SL(2,ℤ)) :
    IntegrableOn (fun z => pair (source hn hd hb) (g • z)) fdo := by
  letI : NeZero (4*(2*d)) := ⟨by omega⟩
  let a : ℂ := 2*Real.pi/(v d:ℂ)
  have ha : a≠0 := div_ne_zero (mul_ne_zero two_ne_zero (by exact_mod_cast Real.pi_ne_zero)) (by exact_mod_cast (v_pos (by omega : 0<d)).ne')
  obtain ⟨C,hC,h⟩ := integrand_growth hn hd hb g
  have h1 : (1:ℂ)∈window := by norm_num [window,mem_ball_zero_iff]
  letI : IsFiniteMeasure (volume.restrict fdo) := isFiniteMeasure_restrict.mpr fdo_finite.ne
  apply (integrable_const (μ:=volume.restrict fdo) (C/‖a‖)).mono'
    (((high_meas hn hd hb).comp (measurePreserving_smul (g:GL (Fin 2) ℝ) volume).measurable).aestronglyMeasurable)
  filter_upwards [ae_restrict_mem isOpen_fdo.measurableSet] with z hz
  have H := h z hz 1 h1
  rw [high_relation hn hd hb,norm_mul] at H
  exact (le_div_iff₀ (norm_pos_iff.mpr ha)).mpr (by simpa [a,mul_comm] using H)

end
end TunnellLevelPairing
#print axioms TunnellLevelPairing.high_integrable
