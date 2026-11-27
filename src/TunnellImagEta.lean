import TunnellLambda
import TunnellBetaPeriod
import TunnellTwistPeriodBridge

/-! Reality and positivity of the eta differential on the imaginary axis. -/

namespace TunnellFricke

open Complex hiding eta
open ModularForm Function MeasureTheory Set Filter
open scoped Topology

lemma eta_imag {t : ℝ} (ht : 0<t) : ∃ x : ℝ, 0<x ∧ eta (I*t) = x :=
  ⟨TunnellLambda.etaR t,TunnellLambda.etaR_pos ht,TunnellLambda.eta_imag t⟩

noncomputable def imaginaryValue (t : ℝ) := (h (4*(I*t))).re

lemma imaginary_cast {t : ℝ} (ht : 0<t) :
    0 < imaginaryValue t ∧ h (4*(I*t)) = (imaginaryValue t:ℂ) := by
  obtain ⟨a,ha,he⟩ := eta_imag (show 0<4*t by positivity)
  obtain ⟨b,hb,hf⟩ := eta_imag (show 0<8*t by positivity)
  have v : h (4*(I*t)) = ((a^2*b^2:ℝ):ℂ) := by
    rw [h,show 4*(I*(t:ℂ)) = I*((4*t:ℝ):ℂ) by push_cast; ring,
      show 2*(I*(((4*t:ℝ):ℂ))) = I*((8*t:ℝ):ℂ) by push_cast; ring,he,hf]
    push_cast
    rfl
  simp only [imaginaryValue,v,ofReal_re]
  exact ⟨by positivity,trivial⟩

lemma baseConstant_real : baseConstant = ((2*Real.pi*(∫ t in Ioi (0:ℝ), imaginaryValue t):ℝ):ℂ) := by
  unfold baseConstant
  push_cast
  rw [← integral_complex_ofReal]
  congr 1
  apply setIntegral_congr_fun measurableSet_Ioi
  exact fun t ht => (imaginary_cast ht).2

theorem baseConstant_from_fermat {X : ℝ → ℝ}
    (hX : ∀ t, 0<t → X t∈Ioo 0 1)
    (hd : ∀ t, 0<t → HasDerivAt X (-8*Real.pi*imaginaryValue t*(1-X t^2)^(3/4:ℝ)) t)
    (hzero : Tendsto X (𝓝[>] 0) (𝓝 1)) (htop : Tendsto X atTop (𝓝 0)) :
    baseConstant = (TunnellCoates.realPeriod 1:ℂ)/4 := by
  rw [baseConstant_real,TunnellCoates.realPeriod_of_fermat_parameter (fun t ht => (imaginary_cast ht).1) hX hd hzero htop]
  push_cast
  rfl

end TunnellFricke
#print axioms TunnellFricke.baseConstant_from_fermat
