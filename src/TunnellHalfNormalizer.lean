import TunnellHalfConjugate
import Mathlib.Analysis.Complex.UpperHalfPlane.Measure

/-! Translation by one half normalizes the conductor-32 subgroup and negates its eta form. -/
namespace TunnellHalfNormalizer
open Matrix MatrixGroups ModularGroup CongruenceSubgroup MeasureTheory
open UpperHalfPlane hiding I
noncomputable section

def U : ℍ ≃ᵐ ℍ := MeasurableEquiv.smul (SpecialLinearGroup.mapGL ℝ (tau 1))

lemma preserving : MeasurePreserving U := measurePreserving_smul (SpecialLinearGroup.mapGL ℝ (tau 1)) volume

lemma cast_action (g : SL(2,ℤ)) (z : ℍ) : (g:SL(2,ℝ)) • z=g • z := by
  apply UpperHalfPlane.ext
  rw [coe_specialLinearGroup_apply (g:SL(2,ℝ)),coe_specialLinearGroup_apply g] <;> rfl

theorem intertwine (g : Gamma0 32) (z : ℍ) : U (g.val • z) = (conjugate g).val • U z := by
  change tau 1 • (g.val • z)=(shift 1 g).val • (tau 1 • z)
  rw [←cast_action g.val,←cast_action (shift 1 g).val,←mul_smul,shift_spec,mul_smul]

lemma U_coe (z : ℍ) : (U z:ℂ)=(z:ℂ)+1/2 := by
  change ((tau 1 • z:ℍ):ℂ)=(z:ℂ)+1/2
  rw [coe_specialLinearGroup_apply]
  norm_num [tau]

lemma U_im (z : ℍ) : (U z).im=z.im := by
  change (↑(U z):ℂ).im=(z:ℂ).im; rw [U_coe]; norm_num


end
end TunnellHalfNormalizer
#print axioms TunnellHalfNormalizer.intertwine

