import TunnellRankinBochner
import Mathlib.MeasureTheory.Integral.Prod

/-! Remove the hyperbolic density on the horizontal strip and integrate in height. -/
namespace TunnellRankinIntegral
open Complex UpperHalfPlane MeasureTheory Set
open scoped ENNReal NNReal
noncomputable section

def rect : Set (ℝ×ℝ) := Ioi 0 ×ˢ Ico 0 1

def planeCoords : ℂ ≃ᵐ ℝ×ℝ := measurableEquivRealProd.trans MeasurableEquiv.prodComm

def coords (z : ℍ) : ℝ×ℝ := (z.im,z.re)

lemma plane_preserving : MeasurePreserving planeCoords := by
  have h : MeasurePreserving (Prod.swap : ℝ×ℝ→ℝ×ℝ) := by
    simpa only [Measure.volume_eq_prod] using (Measure.measurePreserving_swap (μ:=volume) (ν:=volume) :
      MeasurePreserving (Prod.swap : ℝ×ℝ→ℝ×ℝ) (volume.prod volume) (volume.prod volume))
  exact h.comp volume_preserving_equiv_real_prod

lemma coords_image : planeCoords '' (UpperHalfPlane.coe '' stripSet)=rect := by
  ext p
  constructor
  · rintro ⟨_,⟨z,hz,rfl⟩,rfl⟩
    exact ⟨z.im_pos,hz⟩
  · rintro ⟨hy,hx⟩
    let z : ℍ := ⟨⟨p.2,p.1⟩,hy⟩
    exact ⟨z,⟨z,hx,rfl⟩,Prod.ext rfl rfl⟩

lemma coords_embedding : MeasurableEmbedding coords :=
  planeCoords.measurableEmbedding.comp UpperHalfPlane.measurableEmbedding_coe

lemma coords_preserving : MeasurePreserving coords
    ((volume.comap UpperHalfPlane.coe).restrict stripSet) (volume.restrict rect) := by
  have hc : MeasurePreserving UpperHalfPlane.coe (volume.comap UpperHalfPlane.coe)
      (volume.restrict (range UpperHalfPlane.coe)) :=
    ⟨UpperHalfPlane.measurable_coe,UpperHalfPlane.measurableEmbedding_coe.map_comap _⟩
  have h := hc.restrict_image_emb UpperHalfPlane.measurableEmbedding_coe stripSet
  rw [Measure.restrict_restrict_of_subset (image_subset_range _ _)] at h
  have hh := plane_preserving.restrict_image_emb planeCoords.measurableEmbedding (UpperHalfPlane.coe '' stripSet)
  rw [coords_image] at hh
  exact hh.comp h

def density (z : ℍ) : ℝ≥0 := (1/⟨z.im,z.im_pos.le⟩)^2

lemma density_meas : Measurable density := by
  apply Measurable.pow_const
  apply Measurable.div measurable_const
  exact UpperHalfPlane.continuous_im.measurable.subtype_mk

lemma density_cancel (z : ℍ) (a : ℂ) : density z • ((z.im:ℂ)^2*a)=a := by
  change (((1/z.im)^2:ℝ):ℂ)*((z.im:ℂ)^2*a)=a
  have nz : (z.im:ℂ)≠0 := by exact_mod_cast z.im_ne_zero
  push_cast
  field_simp

lemma coords_integral (f : ℝ×ℝ→ℂ) :
    (∫ z in stripSet, (z.im:ℂ)^2*f (coords z))=∫ p in rect,f p := by
  rw [UpperHalfPlane.volume_def,restrict_withDensity meas_strip]
  change (∫ z,(z.im:ℂ)^2*f (coords z) ∂((volume.comap UpperHalfPlane.coe).restrict stripSet).withDensity (fun z => (density z:ℝ≥0∞)))=_
  rw [integral_withDensity_eq_integral_smul density_meas]
  simp_rw [density_cancel]
  exact coords_preserving.integral_comp coords_embedding f

lemma coords_integrable (f : ℝ×ℝ→ℂ) :
    IntegrableOn (fun z : ℍ => (z.im:ℂ)^2*f (coords z)) stripSet ↔ IntegrableOn f rect := by
  unfold IntegrableOn
  rw [UpperHalfPlane.volume_def,restrict_withDensity meas_strip]
  change Integrable _ (((volume.comap UpperHalfPlane.coe).restrict stripSet).withDensity (fun z => (density z:ℝ≥0∞))) ↔ _
  rw [integrable_withDensity_iff_integrable_smul density_meas]
  simp_rw [density_cancel]
  exact coords_preserving.integrable_comp_emb coords_embedding

lemma strip_fubini (f : ℝ×ℝ→ℂ) (hi : IntegrableOn f rect) :
    (∫ z in stripSet, (z.im:ℂ)^2*f (coords z))=∫ y in Ioi (0:ℝ), ∫ x in Ico (0:ℝ) 1,f (y,x) := by
  rw [coords_integral,Measure.volume_eq_prod]
  apply setIntegral_prod
  change IntegrableOn f rect (volume.prod volume)
  exact hi
end
end TunnellRankinIntegral
#print axioms TunnellRankinIntegral.strip_fubini
