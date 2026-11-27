import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1_H1_R1_H2_R1
import Mathlib

/-! Restriction of automorphisms identifies the relative quotient with the Galois group. Fixing subgroups take field composita to intersections. -/
namespace TunnellRelativeUnitAction
open scoped Classical IsMulCommutative
noncomputable section
variable (k L Y Ω : Type) [Field k] [Field L] [Field Y] [Field Ω]
  [Algebra k L] [Algebra L Y] [Algebra k Y] [IsScalarTower k L Y]
  [Algebra k Ω] [Algebra L Ω] [Algebra Y Ω] [IsScalarTower k L Ω]
  [IsScalarTower k Y Ω] [IsScalarTower L Y Ω] [IsGalois k Ω]

abbrev fix (k L Ω : Type) [Field k] [Field L] [Field Ω] [Algebra k L] [Algebra k Ω]
    [Algebra L Ω] [IsScalarTower k L Ω] [IsGalois k Ω] :=
  (⟨(IsScalarTower.toAlgHom k L Ω).fieldRange.fixingSubgroup,InfiniteGalois.fixingSubgroup_isClosed _⟩ : ClosedSubgroup Gal(Ω/k))

theorem fix_iff (g : Gal(Ω/k)) : g ∈ fix k L Ω ↔ ∀ t : L, g (algebraMap L Ω t) = algebraMap L Ω t := by
  change g ∈ (IsScalarTower.toAlgHom k L Ω).fieldRange.fixingSubgroup ↔ _
  rw [IntermediateField.mem_fixingSubgroup_iff]
  exact ⟨fun h t => h _ ⟨t,rfl⟩, fun h y ⟨t,ht⟩ => ht ▸ h t⟩

theorem le : fix k Y Ω ≤ fix k L Ω := by
  intro g hg
  apply (fix_iff k L Ω g).mpr
  intro a
  rw [IsScalarTower.algebraMap_apply L Y Ω]
  exact (fix_iff k Y Ω g).mp hg _

theorem finite_index [FiniteDimensional k L] : (fix k L Ω).toSubgroup.FiniteIndex := by
  let P := (IsScalarTower.toAlgHom k L Ω).fieldRange
  have : FiniteDimensional k P :=
    Module.Finite.of_surjective (IsScalarTower.toAlgHom k L Ω).equivFieldRange.toLinearMap
      (IsScalarTower.toAlgHom k L Ω).equivFieldRange.surjective
  constructor
  change P.fixingSubgroup.index ≠ 0
  rw [← IntermediateField.finrank_eq_fixingSubgroup_index]
  exact Module.finrank_pos.ne'

def fixEquiv : (fix k L Ω).toSubgroup ≃* Gal(Ω/L) where
  toFun g := { g.val.toRingEquiv with commutes' := (fix_iff k L Ω g.val).mp g.property }
  invFun g := ⟨g.restrictScalars k,(fix_iff k L Ω _).mpr g.commutes⟩
  left_inv _ := rfl
  right_inv _ := rfl
  map_mul' _ _ := rfl

variable [IsGalois L Y]

def restrict : (fix k L Ω).toSubgroup →* Gal(Y/L) :=
  (AlgEquiv.restrictNormalHom Y).comp (fixEquiv k L Ω).toMonoidHom

theorem restrict_apply (g : (fix k L Ω).toSubgroup) (a : Y) :
    algebraMap Y Ω (restrict k L Y Ω g a) = g.val (algebraMap Y Ω a) :=
  (fixEquiv k L Ω g).restrictNormal_commutes Y a

theorem restrict_surj [Normal L Ω] : Function.Surjective (restrict k L Y Ω) :=
  (AlgEquiv.restrictNormalHom_surjective Ω).comp (fixEquiv k L Ω).surjective

theorem ker :
    (restrict k L Y Ω).ker = (fix k Y Ω).toSubgroup.subgroupOf (fix k L Ω).toSubgroup := by
  ext g
  change restrict k L Y Ω g = 1 ↔ g.val ∈ fix k Y Ω
  rw [fix_iff]
  constructor
  · intro hg a
    rw [← restrict_apply, hg]
    rfl
  · intro hg
    exact AlgEquiv.ext fun a => (algebraMap Y Ω).injective ((restrict_apply k L Y Ω g a).trans (hg a))

end
end TunnellRelativeUnitAction

namespace TunnellGlobalEmbeddedGeometry
open NumberField
open scoped NumberField Classical
noncomputable section
abbrev Ω:=SeparableClosure ℚ

def Geometry : Prop :=
  ∀ [IsGalois ℚ Ω],
  (∀ (D F:Type)[Field D][NumberField D][Field F][NumberField F][Algebra D F]
    [FiniteDimensional D F][IsGalois D F](e:F →ₐ[ℚ] Ω),
    let H:=(e.comp (IsScalarTower.toAlgHom ℚ D F)).fieldRange.fixingSubgroup
    let J:=e.fieldRange.fixingSubgroup
    H.FiniteIndex ∧ J≤H ∧ ∃ h:(J.subgroupOf H).Normal, Nonempty ((H ⧸ J.subgroupOf H) ≃* Gal(F/D))) ∧
  ∀ (D M:Type)[Field D][NumberField D][Field M][NumberField M][Algebra D M] (e:M →ₐ[ℚ] Ω)
    (E F:IntermediateField D M), E⊔F=⊤ →
    e.fieldRange.fixingSubgroup =
      (e.comp (E.val.restrictScalars ℚ)).fieldRange.fixingSubgroup ⊓
      (e.comp (F.val.restrictScalars ℚ)).fieldRange.fixingSubgroup

theorem actual : Geometry := by
  intro _
  constructor
  · intro D F _ _ _ _ _ _ _ e H J
    let j:=e.comp (IsScalarTower.toAlgHom ℚ D F)
    letI : FiniteDimensional ℚ j.fieldRange := Module.Finite.of_surjective j.equivFieldRange.toLinearMap j.equivFieldRange.surjective
    have hi : H.FiniteIndex := by
      constructor
      change j.fieldRange.fixingSubgroup.index≠0
      rw [←IntermediateField.finrank_eq_fixingSubgroup_index]
      exact Module.finrank_pos.ne'
    letI : Algebra F Ω := e.toRingHom.toAlgebra
    letI : Algebra D Ω := j.toRingHom.toAlgebra
    letI : IsScalarTower ℚ F Ω := IsScalarTower.of_algebraMap_eq' e.comp_algebraMap.symm
    letI : IsScalarTower ℚ D Ω := IsScalarTower.of_algebraMap_eq' j.comp_algebraMap.symm
    letI : IsScalarTower D F Ω := IsScalarTower.of_algebraMap_eq' rfl
    letI : IsGalois D Ω := IsGalois.tower_top_of_isGalois ℚ D Ω
    let f : H →* Gal(F/D):=TunnellRelativeUnitAction.restrict ℚ D F Ω
    have eq : f.ker=J.subgroupOf H := TunnellRelativeUnitAction.ker ℚ D F Ω
    have normal : (J.subgroupOf H).Normal := eq ▸ f.normal_ker
    refine ⟨hi,TunnellRelativeUnitAction.le ℚ D F Ω,normal,?_⟩
    letI := normal
    letI : f.ker.Normal := f.normal_ker
    have iso : (H ⧸ J.subgroupOf H) ≃* (H ⧸ f.ker) :=
      @QuotientGroup.quotientMulEquivOfEq H _ (J.subgroupOf H) f.ker normal f.normal_ker eq.symm
    exact ⟨iso.trans (QuotientGroup.quotientKerEquivOfSurjective f (TunnellRelativeUnitAction.restrict_surj ℚ D F Ω))⟩
  · intro D M _ _ _ _ _ e E F h
    rw [←IntermediateField.fixingSubgroup_sup]
    apply congrArg IntermediateField.fixingSubgroup
    change e.fieldRange = (e.comp (E.restrictScalars ℚ).val).fieldRange ⊔ (e.comp (F.restrictScalars ℚ).val).fieldRange
    rw [IntermediateField.fieldRange_comp_val,IntermediateField.fieldRange_comp_val,←IntermediateField.map_sup,
      IntermediateField.restrictScalars_sup,h,IntermediateField.restrictScalars_top,←AlgHom.fieldRange_eq_map]

end
end TunnellGlobalEmbeddedGeometry

theorem OMA.solution : OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1_H1_R1_H2_R1.H4 := TunnellGlobalEmbeddedGeometry.actual
