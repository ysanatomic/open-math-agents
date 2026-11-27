import TunnellRankinCoordinates
import Mathlib.Analysis.SpecialFunctions.ImproperIntegrals

/-! Finiteness of the hyperbolic measure of the open modular polygon. -/
namespace TunnellRankinIntegral
open Complex Matrix MatrixGroups ModularGroup UpperHalfPlane MeasureTheory Set
open scoped ENNReal NNReal
noncomputable section

lemma coords_preserving_set (S : Set ℍ) : MeasurePreserving coords
    ((volume.comap UpperHalfPlane.coe).restrict S) (volume.restrict (coords '' S)) := by
  have hc : MeasurePreserving UpperHalfPlane.coe (volume.comap UpperHalfPlane.coe)
      (volume.restrict (range UpperHalfPlane.coe)) :=
    ⟨UpperHalfPlane.measurable_coe,UpperHalfPlane.measurableEmbedding_coe.map_comap _⟩
  have h := hc.restrict_image_emb UpperHalfPlane.measurableEmbedding_coe S
  rw [Measure.restrict_restrict_of_subset (image_subset_range _ _)] at h
  have hh := plane_preserving.restrict_image_emb planeCoords.measurableEmbedding (UpperHalfPlane.coe '' S)
  rw [Set.image_image] at hh
  exact hh.comp h

lemma fdo_finite : volume fdo < ∞ := by
  let S : Set (ℝ×ℝ) := Ioi (1/4) ×ˢ Icc (-1) 1
  have sub : coords '' fdo⊆S := by
    rintro _ ⟨z,hz,rfl⟩
    change z.im∈Ioi (1/4) ∧ z.re∈Icc (-1) 1
    have hh := three_lt_four_mul_im_sq_of_mem_fdo hz
    have he := abs_lt.mp hz.2
    exact ⟨by change (1:ℝ)/4<z.im; nlinarith [z.im_pos],by constructor <;> linarith⟩
  have hr : IntegrableOn (fun y : ℝ => y^(-2:ℝ)) (Ioi (1/4)) := integrableOn_Ioi_rpow_of_lt (by norm_num) (by norm_num)
  have hi : IntegrableOn (fun p : ℝ×ℝ => p.1^(-2:ℝ)) S := by
    unfold IntegrableOn S
    rw [Measure.volume_eq_prod,←Measure.prod_restrict]
    exact hr.comp_fst _
  have hc := (coords_preserving_set fdo).integrable_comp_emb (g:=fun p : ℝ×ℝ => p.1^(-2:ℝ)) coords_embedding
  have hf := (hc.mpr (hi.mono_set sub)).2
  rw [UpperHalfPlane.volume_def,withDensity_apply _ isOpen_fdo.measurableSet]
  change (∫⁻ z in fdo, (density z:ℝ≥0∞) ∂volume.comap UpperHalfPlane.coe)<⊤
  have he (z : ℍ) : (density z:ℝ≥0∞)=‖z.im^(-2:ℝ)‖ₑ := by
    rw [show (-2:ℝ)=-(2:ℕ) by norm_num,Real.rpow_neg z.im_pos.le,Real.rpow_natCast,
      Real.enorm_of_nonneg (by positivity)]
    rw [show (z.im^2)⁻¹=(density z:ℝ) by change (z.im^2)⁻¹=(1/z.im)^2; rw [one_div,inv_pow]]
    simp
  simp_rw [he]
  exact hf

end
end TunnellRankinIntegral
#print axioms TunnellRankinIntegral.fdo_finite
