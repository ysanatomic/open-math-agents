import TunnellRankinCuspHeight
import TunnellRankinEisensteinMeasurable
import TunnellRankinParameterIntegral
import TunnellRankinPolygonVolume
import TunnellRankinPetersson
import Mathlib.Analysis.Calculus.Deriv.Star

/-! Holomorphy of the actual, absolutely convergent Petersson integral across the central point. -/
namespace TunnellRankinIntegral
open Complex Matrix MatrixGroups ModularGroup Set MeasureTheory TunnellRankin TunnellRankinEisenstein
open TunnellShell TunnellFullClassTheta TunnellEtaValue TunnellRankinMajorant TunnellRankinCotangent
open TunnellClassThetaMellin TunnellCMRegularized Metric
open UpperHalfPlane hiding I
open scoped ComplexConjugate
noncomputable section

def window : Set ℂ := {s | 3/4<s.re} ∩ ball 0 12
lemma window_open : IsOpen window := (isOpen_lt continuous_const Complex.continuous_re).inter isOpen_ball

variable {d : ℕ} {b : Triple} (hsq : Squarefree (2*d)) (hd : d%4=1) (hb : b∈shell (2*d))

lemma full_growth : ∃ C : ℝ, 0≤C ∧ ∀ w : ℍ, ‖full hsq (by omega) hb w‖≤C*(size w)^66 := by
  letI : NeZero (4*(2*d)) := ⟨by omega⟩
  obtain ⟨C,hC,hh⟩ := eisenstein_bound (k:=1) (negCharacter d (by omega))
  let a : ℂ := 2*Real.pi/(v d:ℂ)
  have hv : (v d:ℂ)≠0 := by exact_mod_cast (v_pos (show 0<d by omega)).ne'
  have ha : a≠0 := div_ne_zero (by exact_mod_cast (mul_ne_zero (by norm_num : (2:ℝ)≠0) Real.pi_ne_zero)) hv
  refine ⟨C/‖a‖,by positivity,?_⟩
  intro w
  have e := hh w (s:=1) (by norm_num) (by norm_num)
  rw [eisenstein_one hsq hd hb,norm_mul] at e
  have eg : multiple ⟨1,by decide⟩ w=w := by ext; simp [multiple]
  rw [eg] at e
  change ‖a‖*‖full hsq _ hb w‖≤_ at e
  rw [div_mul_eq_mul_div,le_div_iff₀ (norm_pos_iff.mpr ha)]
  simpa only [mul_comm] using e

end
end TunnellRankinIntegral
#print axioms TunnellRankinIntegral.full_growth
