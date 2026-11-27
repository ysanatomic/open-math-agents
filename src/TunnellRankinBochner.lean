import TunnellRankinTonelli
import Mathlib.MeasureTheory.Integral.Bochner.SumMeasure
import Mathlib.MeasureTheory.Function.Floor

/-! Pushforward to the width-one strip and the complex-valued unfolding identity. -/
namespace TunnellRankinIntegral
open Complex Matrix MatrixGroups ModularGroup TunnellRankinEisenstein
open UpperHalfPlane MeasureTheory Set
open scoped ENNReal
noncomputable section

def wrap (z : ℍ) := T^(-⌊z.re⌋) • z

lemma wrap_meas : Measurable wrap := by
  apply UpperHalfPlane.measurableEmbedding_coe.measurable_comp_iff.mp
  have hI : Measurable (fun z : ℍ => -⌊z.re⌋) :=
    (Int.measurable_floor.comp UpperHalfPlane.continuous_re.measurable).neg
  have eq : UpperHalfPlane.coe ∘ wrap = fun z : ℍ => (z:ℂ)+((-⌊z.re⌋:ℤ):ℂ) := by
    funext z
    exact coe_T_zpow_smul_eq z
  rw [eq]
  exact UpperHalfPlane.measurable_coe.add ((measurable_of_countable (fun n : ℤ => (n:ℂ))).comp hI)

lemma wrap_shift (n : ℤ) (z : ℍ) : wrap (T^n • z)=wrap z := by
  simp only [wrap,re_T_zpow_smul,Int.floor_add_intCast,←mul_smul,←_root_.zpow_add]
  rw [show -(⌊z.re⌋+n)+n= -⌊z.re⌋ by omega]

lemma wrap_on {z : ℍ} (hz : z∈stripSet) : wrap z=z := by
  rw [wrap,Int.floor_eq_zero_iff.mpr hz,neg_zero,zpow_zero,one_smul]

def tileMatrix {L : ℕ} (p : Cosets L × Rows L) := (liftRow p.2).val*rep p.1

def tileMap {L : ℕ} (p : Cosets L × Rows L) (z : ℍ) := wrap (tileMatrix p • z)

lemma tileMap_meas {L : ℕ} (p : Cosets L × Rows L) : Measurable (tileMap p) :=
  wrap_meas.comp (measurePreserving_smul (tileMatrix p:GL (Fin 2) ℝ) volume).measurable

def tileMeasure {L : ℕ} (p : Cosets L × Rows L) : Measure ℍ :=
  (volume.restrict fdo).map (tileMap p)

lemma tileMeasure_sum (L : ℕ) : Measure.sum (tileMeasure (L:=L))=(2:ℝ≥0∞) • volume.restrict stripSet := by
  apply Measure.ext_of_lintegral
  intro f hf
  rw [lintegral_sum_measure,ENNReal.tsum_prod',lintegral_smul_measure]
  have e (p : Cosets L × Rows L) : ∫⁻ z,f z ∂tileMeasure p=∫⁻ z in fdo, f (tileMap p z) :=
    lintegral_map hf (tileMap_meas p)
  simp_rw [e]
  change (∑' (q : Cosets L) (r : Rows L),∫⁻ z in fdo,(f ∘ wrap) (((liftRow r).val*rep q) • z))=2*∫⁻ z in stripSet,f z
  rw [unfold_nonneg L (hf.comp wrap_meas) (fun n z => congrArg f (wrap_shift n z))]
  congr 1
  exact setLIntegral_congr_fun meas_strip fun z hz => congrArg f (wrap_on hz)

theorem unfold_complex (L : ℕ) {f : ℍ→ℂ} (hf : Measurable f)
    (hi : IntegrableOn f stripSet) (hp : ∀ (n : ℤ) z, f (T^n • z)=f z) :
    HasSum (fun p : Cosets L × Rows L => ∫ z in fdo, f (tileMatrix p • z))
      (2*∫ z in stripSet,f z) := by
  have hsum : Integrable f (Measure.sum (tileMeasure (L:=L))) := by
    rw [tileMeasure_sum]
    exact hi.smul_measure (by norm_num)
  have e := hasSum_integral_measure hsum
  rw [tileMeasure_sum,integral_smul_measure] at e
  have ee : (2:ℝ≥0∞).toReal • (∫ z in stripSet,f z)=2*∫ z in stripSet,f z := by
    simp [Complex.real_smul]
  rw [ee] at e
  apply e.congr_fun
  intro p
  rw [tileMeasure,integral_map (tileMap_meas p).aemeasurable hf.stronglyMeasurable.aestronglyMeasurable]
  simp only [tileMap,wrap,hp]

end
end TunnellRankinIntegral
#print axioms TunnellRankinIntegral.unfold_complex
