import TunnellCMChangeBaseField
import TunnellCMGlobalModelUnit
import TunnellRamifiedDivision

/-! Compatibility of Gaussian division, rational points and formal parameters with completion of the coefficient field. -/
namespace TunnellCompletionPoints
open WeierstrassCurve WeierstrassCurve.Affine TunnellKummer TunnellCoates TunnellCMTorsionField TunnellGaussianEnd
open scoped Classical
noncomputable section
variable {F D K M:Type} [Field F] [Field D] [Field K] [Field M]
  [Algebra F D] [Algebra F K] [Algebra F M] [Algebra K M] [Algebra D M]
  [IsScalarTower F D M] [IsScalarTower F K M] (n:ℕ)
local notation "WF" => E (n:F)
local notation "WK" => E (n:K)

def point : CurvePoints WF D→+CurvePoints WK M := (TunnellCMChangeBaseField.rebase (K:=K) n).toAddMonoidHom.comp
    (Point.map (W':=(WF).toAffine) (IsScalarTower.toAlgHom F D M))

theorem injective : Function.Injective (point (F:=F) (D:=D) (K:=K) (M:=M) n) :=
  (TunnellCMChangeBaseField.rebase (F:=F) (K:=K) (M:=M) n).injective.comp (Point.map_injective (W':=(WF).toAffine) (IsScalarTower.toAlgHom F D M))

theorem some {x y:D} (h:((WF).baseChange D).toAffine.Nonsingular x y) :
    ∃ h',point (K:=K) (M:=M) n (.some x y h)=.some (algebraMap D M x) (algebraMap D M y) h' := by
  change ∃ _,TunnellCMChangeBaseField.rebase (F:=F) (K:=K) (M:=M) n (Point.map (W':=(WF).toAffine) (IsScalarTower.toAlgHom F D M) (.some x y h))=_
  simpa only [Point.map_some,IsScalarTower.toAlgHom_apply] using TunnellCMChangeBaseField.rebase_some (F:=F) (K:=K) (M:=M) n
    (((WF).toAffine.baseChange_nonsingular (IsScalarTower.toAlgHom F D M).injective x y).mpr h)

theorem cm_point [(E (n:F)).IsElliptic] [(E (n:K)).IsElliptic] (i:F) (j:K) (hi:i^2= -1) (hj:j^2= -1)
    (hij:algebraMap F K i=j) (a:GaussianInt) (P:CurvePoints WF D) :
    point (K:=K) (M:=M) n (cm (n:F) i hi a P)=cm (n:K) j hj a (point n P) := by
  change TunnellCMChangeBaseField.rebase (K:=K) (M:=M) n (Point.map (W':=(WF).toAffine) (IsScalarTower.toAlgHom F D M) (cm (n:F) i hi a P))=_
  rw [cm_map,TunnellCMChangeBaseField.cm_rebase _ _ _ _ _ hij]
  rfl

theorem base_point (P:CurvePoints WF F) :
    point (K:=K) (M:=M) n (changeBase (L:=D) WF P)=
      changeBase WK (point (K:=K) (M:=K) n P) := by
  cases P with
  | zero => change point n (changeBase WF 0)=changeBase WK (point n 0); simp only [map_zero]
  | some x y h =>
    simp only [changeBase,point,Point.baseChange,Point.map_some,TunnellCMChangeBaseField.rebase,
      AddMonoidHom.comp_apply,AddEquiv.coe_toAddMonoidHom,Point.equivOfEq_some]
    exact (Point.some.injEq ..).mpr ⟨by change algebraMap D M (algebraMap F D x)=algebraMap K M (algebraMap F K x)
                                        rw [←IsScalarTower.algebraMap_apply,←IsScalarTower.algebraMap_apply],
      by change algebraMap D M (algebraMap F D y)=algebraMap K M (algebraMap F K y)
         rw [←IsScalarTower.algebraMap_apply,←IsScalarTower.algebraMap_apply]⟩

theorem map_model (S:CurvePoints WF D) (H:(WK).baseChange M=((WF).baseChange D).baseChange M) :
    Point.equivOfEq H (point (K:=K) (M:=M) n S)=TunnellCMGlobalModelUnit.pointMap ((WF).baseChange D) M S := by
  cases S with
  | zero=>change Point.equivOfEq H (point n 0)=TunnellCMGlobalModelUnit.pointMap _ _ 0; simp only [map_zero]
  | some x y h=>
    obtain ⟨h',he⟩:=some (K:=K) (M:=M) n h
    simp only [he,Point.equivOfEq_some,TunnellCMGlobalModelUnit.pointMap,AddMonoidHom.comp_apply,
      AddEquiv.coe_toAddMonoidHom,Point.map_some,Algebra.ofId_apply]

#print axioms cm_point
#print axioms base_point
#print axioms map_model
end
end TunnellCompletionPoints
