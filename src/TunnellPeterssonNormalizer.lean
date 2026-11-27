import TunnellPeterssonMask
import Mathlib.MeasureTheory.Integral.Bochner.SumMeasure

/-! Any hyperbolic-volume-preserving normalizer leaves the Petersson functional
on an invariant scalar integrand unchanged. -/
namespace TunnellPeterssonMask
open Matrix MatrixGroups ModularGroup CongruenceSubgroup MeasureTheory TunnellRankinIntegral
open UpperHalfPlane Set
open scoped ENNReal
noncomputable section
variable (L : ℕ) [NeZero L]

def tileMeasure (q : Cosets L) := Measure.map (fun z : ℍ => rep q • z) (volume.restrict fdo)

lemma quotient_tiles : quotientMeasure L = Measure.sum (tileMeasure L) := by
  letI := Fintype.ofFinite (Cosets L)
  apply Measure.ext_of_lintegral
  intro f hf
  rw [quotient_lintegral L hf,lintegral_sum_measure]
  apply tsum_congr; intro q
  symm; exact lintegral_map hf (measurePreserving_smul ((rep q):GL (Fin 2) ℝ) volume).measurable

lemma integrable_quotient {f : ℍ→ℂ} (hf : Measurable f)
    (hi : ∀ q : Cosets L, IntegrableOn (fun z => f (rep q • z)) fdo) :
    Integrable f (quotientMeasure L) := by
  letI := Fintype.ofFinite (Cosets L)
  rw [quotient_tiles]
  apply integrable_sum_measure _ ((hasSum_fintype _).summable)
  intro q
  exact (integrable_map_measure hf.aestronglyMeasurable (measurePreserving_smul ((rep q):GL (Fin 2) ℝ) volume).measurable.aemeasurable).mpr (hi q)

lemma quotient_integral {f : ℍ→ℂ} (hf : Measurable f) (hi : Integrable f (quotientMeasure L)) :
    TunnellRankinIntegral.petersson L f = ∫ z,f z ∂quotientMeasure L := by
  letI := Fintype.ofFinite (Cosets L)
  rw [quotient_tiles] at hi ⊢
  rw [integral_sum_measure hi,TunnellRankinIntegral.petersson]
  apply tsum_congr; intro q
  symm; exact integral_map (measurePreserving_smul ((rep q):GL (Fin 2) ℝ) volume).measurable.aemeasurable hf.aestronglyMeasurable

variable (U : ℍ ≃ᵐ ℍ) (hU : MeasurePreserving U) (e : Gamma0 L ≃ Gamma0 L)
    (he : ∀ (g : Gamma0 L) z,U (g.val • z)=(e g).val • U z)

include hU he in
lemma normalizer_lintegral {f : ℍ→ℝ≥0∞} (hf : Measurable f)
    (H : ∀ (g : Gamma0 L) z,f (g.val • z)=f z) :
    ∫⁻ z, f (U z) ∂quotientMeasure L=∫⁻ z,f z ∂quotientMeasure L := by
  let b (z : ℍ) := mask L (U.symm z)
  have hb : Measurable b := (mask_meas L).comp U.symm.measurable
  have inv_sum (a : ℍ→ℝ≥0∞) (z : ℍ) : (∑' g : Gamma0 L, a (g.val⁻¹ • z))=∑' g : Gamma0 L,a (g.val • z) :=
    (Equiv.inv (Gamma0 L)).tsum_eq (fun g : Gamma0 L => a (g.val • z))
  have h2 : ∀ᵐ z : ℍ, ∑' g : Gamma0 L,b (g.val⁻¹ • z)=2 := by
    have ae := (hU.symm U).quasiMeasurePreserving.ae (twice L)
    filter_upwards [ae] with z hz
    rw [inv_sum,←e.tsum_eq (fun g => b (g.val • z)),←hz,inv_sum]
    apply tsum_congr; intro g
    have h := he g (U.symm z)
    simp only [U.apply_symm_apply] at h
    simp [b,←h]
  rw [quotientMeasure,lintegral_withDensity_eq_lintegral_mul _ (mask_meas L) (show Measurable (fun z => f (U z)) from hf.comp U.measurable),
    lintegral_withDensity_eq_lintegral_mul _ (mask_meas L) hf]
  calc
    _ = ∫⁻ z,b z*f z := by
      rw [←hU.lintegral_comp (show Measurable (fun z => b z*f z) from hb.mul hf)]
      simp [b]
    _ = _ := replace_mask L hb (mask_meas L) hf h2 (twice L) H

include hU he in
lemma normalizer_map {f : ℍ→ℂ} (hf : Measurable f)
    (H : ∀ (g : Gamma0 L) z,f (g.val • z)=f z) :
    Measure.map (f ∘ U) (quotientMeasure L)=Measure.map f (quotientMeasure L) := by
  apply Measure.ext_of_lintegral
  intro g hg
  rw [lintegral_map hg (hf.comp U.measurable),lintegral_map hg hf]
  exact normalizer_lintegral L U hU e he (hg.comp hf) (fun g₀ z => congrArg g (H g₀ z))

include hU he in
theorem normalizer {f : ℍ→ℂ} (hf : Measurable f) (hi : Integrable f (quotientMeasure L))
    (H : ∀ (g : Gamma0 L) z,f (g.val • z)=f z) :
    TunnellRankinIntegral.petersson L (f ∘ U) = TunnellRankinIntegral.petersson L f := by
  let μ := quotientMeasure L
  have eq := normalizer_map L U hU e he hf H
  have hfi : Integrable id (Measure.map f μ) :=
    (integrable_map_measure measurable_id.aestronglyMeasurable hf.aemeasurable).mpr hi
  rw [←eq] at hfi
  have hFU := hf.comp U.measurable
  have hfi' : Integrable (f ∘ U) μ :=
    (integrable_map_measure measurable_id.aestronglyMeasurable hFU.aemeasurable).mp hfi
  rw [quotient_integral L hFU hfi',quotient_integral L hf hi]
  calc
    _ = ∫ x : ℂ,x ∂Measure.map (f ∘ U) μ := (integral_map hFU.aemeasurable measurable_id.aestronglyMeasurable).symm
    _ = ∫ x : ℂ,x ∂Measure.map f μ := by rw [eq]
    _ = _ := integral_map hf.aemeasurable measurable_id.aestronglyMeasurable

end
end TunnellPeterssonMask
#print axioms TunnellPeterssonMask.normalizer
