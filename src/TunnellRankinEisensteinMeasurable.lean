import TunnellRankinEisensteinGrowth
import TunnellRankinNormalization
import Mathlib.NumberTheory.Modular

/-! Polynomial growth of the continued Eisenstein series, valid throughout the upper half-plane. -/
namespace TunnellRankinMajorant
open Complex Matrix MatrixGroups ModularGroup TunnellRankinEisenstein TunnellCMRegularized
open UpperHalfPlane hiding I
open scoped ComplexConjugate
noncomputable section

lemma vector_meas (k : ℕ) (p : ℤ×ℤ) : Measurable (fun z : ℍ => vector k z p) := by
  unfold vector
  fun_prop

lemma eisenstein_meas {N k : ℕ} [NeZero N] [NeZero k] (χ : DirichletCharacter ℂ N) (s : ℂ) :
    Measurable (fun z : ℍ => eisenstein (k:=k) χ z s) := by
  have hk (f : ℍ→ℂ) (hf : Measurable f) : Measurable (fun z => kernel s (f z)) := by
    apply hf.mul
    apply Complex.continuous_exp.measurable.comp
    exact (Complex.continuous_ofReal.measurable.comp (Real.measurable_log.comp hf.norm)).const_mul _
  have hd (a : ℕ) (p : ℤ×ℤ) (u : ℂ) : Measurable (fun z : ℍ => difference a u (vector k z p) s) := by
    unfold difference
    apply Measurable.sub <;> apply Measurable.const_mul <;> apply Measurable.sub <;> apply hk
    · exact (vector_meas k p).add_const _
    · exact vector_meas k p
    · exact (vector_meas k p).add_const _
    · exact vector_meas k p
  simp only [eisenstein,regular,periodized]
  apply Measurable.mul
  · apply Measurable.mul_const
    apply Measurable.pow_const
    exact Complex.continuous_ofReal.measurable.comp UpperHalfPlane.continuous_im.measurable
  · apply Measurable.div_const
    apply Finset.measurable_sum
    intro r _
    exact (Measurable.tsum (fun p => hd _ p _)).const_mul _
end
end TunnellRankinMajorant
#print axioms TunnellRankinMajorant.eisenstein_meas
