import TunnellRankinIntegrandGrowth

namespace TunnellRankinIntegral
open Complex Matrix MatrixGroups ModularGroup Set MeasureTheory TunnellRankin TunnellRankinEisenstein
open TunnellShell TunnellFullClassTheta TunnellEtaValue TunnellRankinMajorant TunnellRankinCotangent
open TunnellClassThetaMellin TunnellCMRegularized Metric
open UpperHalfPlane hiding I
open scoped ComplexConjugate
noncomputable section

variable {d : ℕ} {b : Triple} (hsq : Squarefree (2*d)) (hd : d%4=1) (hb : b∈shell (2*d))

theorem petersson_analytic :
    haveI : NeZero (4*(2*d)) := ⟨by omega⟩
    AnalyticOnNhd ℂ (fun s => petersson (4*(2*d)*4) (integrand (k:=4) (negCharacter d (by omega))
      (full hsq (by omega) hb) s)) window := by
  letI : NeZero (4*(2*d)) := ⟨by omega⟩
  letI : NeZero (4*(2*d)*4) := ⟨by omega⟩
  letI := Fintype.ofFinite (Cosets (4*(2*d)*4))
  let θ := full hsq (by omega) hb
  let χ := negCharacter d (by omega)
  let F (s : ℂ) (z : ℍ) := integrand (k:=4) χ θ s z
  have hm (s : ℂ) : Measurable (F s) := by
    apply Measurable.mul
    · apply Measurable.mul
      · exact ((Complex.continuous_ofReal.comp UpperHalfPlane.continuous_im).measurable.pow_const 2).mul etaValue_hol.continuous.measurable
      · exact Complex.continuous_conj.measurable.comp (full_meas hsq hd hb)
    · exact Complex.continuous_conj.measurable.comp (eisenstein_meas χ (conj s))
  have hdif (z : ℍ) : AnalyticOnNhd ℂ (fun s => F s z) window := by
    apply DifferentiableOn.analyticOnNhd _ window_open
    intro s hs
    apply DifferentiableAt.differentiableWithinAt
    apply DifferentiableAt.const_mul
    have he := ((eisenstein_analytic (k:=4) χ z) (conj s) (by simpa [domain] using hs.1)).differentiableAt.conj_conj
    simpa only [Function.comp_def,Complex.conj_conj] using he
  simp only [petersson,tsum_fintype]
  apply Finset.analyticOnNhd_fun_sum
  intro q _
  let g := rep q
  obtain ⟨M,hM,hB⟩ := integrand_growth hsq hd hb g
  haveI : IsFiniteMeasure (volume.restrict fdo) := isFiniteMeasure_restrict.mpr fdo_finite.ne
  apply TunnellRankinParameter.analytic_integral (μ:=volume.restrict fdo) window_open
    (F:=fun s z => F s (g • z))
    (fun s => (hm s).comp (measurePreserving_smul (g:GL (Fin 2) ℝ) volume).measurable)
    (fun z => hdif (g • z)) (B:=fun _ => M) (integrable_const _)
  exact (ae_restrict_mem isOpen_fdo.measurableSet).mono fun z hz => hB z hz
end
end TunnellRankinIntegral
#print axioms TunnellRankinIntegral.petersson_analytic
