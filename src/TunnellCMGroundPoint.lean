import TunnellCMChangeBaseField
import TunnellCMGlobalModelUnit

/-! Transport of a rational point of infinite order to the congruent-number
model over a number field, with the ground change of models made explicit. -/
namespace TunnellCMGroundPoint
open WeierstrassCurve WeierstrassCurve.Affine TunnellCoates TunnellKummer
open TunnellCMGlobalModelUnit TunnellCMChangeBaseField
noncomputable section
theorem non_torsion (K : Type) [Field K] [CharZero K] [DecidableEq K]
    (n : ℕ) (P : (E (n:ℚ)).toAffine.Point) (hP : ¬IsOfFinAddOrder P) :
    ∃ Q : CurvePoints (E (n:K)) K, ¬IsOfFinAddOrder Q := by
  let he : (E (n:ℚ)).baseChange K=(E (n:K)).baseChange K := by ext <;> simp [E,WeierstrassCurve.baseChange,WeierstrassCurve.map]
  let e : ((E (n:ℚ)).baseChange K).toAffine.Point ≃+ CurvePoints (E (n:K)) K := Point.equivOfEq he
  let f:=e.toAddMonoidHom.comp (pointMap (E (n:ℚ)) K)
  have hf : Function.Injective f:=e.injective.comp (pointMap_inj _ _)
  refine ⟨f P,fun h => hP ?_⟩
  rw [isOfFinAddOrder_iff_nsmul_eq_zero] at h ⊢
  obtain ⟨k,hk,hk'⟩:=h
  exact ⟨k,hk,hf (by rw [map_nsmul,hk',map_zero])⟩

end
end TunnellCMGroundPoint
#print axioms TunnellCMGroundPoint.non_torsion
