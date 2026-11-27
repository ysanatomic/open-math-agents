import TunnellCMGoodGlobalModels
import Mathlib.FieldTheory.IntermediateField.Adjoin.Basic

/-! Uniform degree bound for acquiring everywhere good models after adjoining
their coefficients to any division field. -/
namespace TunnellCMUniformGoodBase
open NumberField WeierstrassCurve IntermediateField TunnellCoates
open scoped NumberField Classical
noncomputable section

theorem good_extension_in (B : Type) [Field B] [CharZero B] [IsAlgClosed B] [Algebra.IsAlgebraic ℚ B] (n : ℕ) (hn : 0<n) :
    ∃ bound : ℕ, ∀ D : IntermediateField ℚ B, ∀ [NumberField D],
      ∃ F : IntermediateField D B, ∃ hF : FiniteDimensional D F,
        letI : NumberField F := NumberField.of_module_finite D F
        Module.finrank D F≤bound ∧ ∃ V W : WeierstrassCurve (𝓞 F), ∃ C A : VariableChange F,
        C • E (n:F)=V.map (algebraMap (𝓞 F) F) ∧
        A • E (n:F)=W.map (algebraMap (𝓞 F) F) ∧ IsCoprime V.Δ W.Δ := by
  obtain ⟨S,hS⟩ := TunnellCMGoodGlobalModels.global_models B n hn
  let C:=adjoin ℚ (S:Set B)
  letI : FiniteDimensional ℚ C := finiteDimensional_adjoin (S:=(S:Set B)) (fun x _ =>
    (Algebra.IsAlgebraic.isAlgebraic (R:=ℚ) x).isIntegral)
  refine ⟨Module.finrank ℚ C,?_⟩
  intro D hD
  let F:=adjoin D (S:Set B)
  letI : FiniteDimensional D F := finiteDimensional_adjoin (S:=(S:Set B)) (fun x _ =>
    (IsAlgebraic.tower_top D (Algebra.IsAlgebraic.isAlgebraic (R:=ℚ) x)).isIntegral)
  letI : NumberField F := NumberField.of_module_finite D F
  refine ⟨F,inferInstance,?_,?_⟩
  · have hi := IntermediateField.finrank_sup_le D C
    rw [←IntermediateField.restrictScalars_adjoin_eq_sup] at hi
    change Module.finrank ℚ F≤Module.finrank ℚ D * Module.finrank ℚ C at hi
    haveI : IsScalarTower ℚ D F := .of_algebraMap_eq (fun x => by simp)
    letI : Module.Free (↥D) (↥F) := Module.Free.of_divisionRing (↥D) (↥F)
    have hd : Module.finrank ℚ D*Module.finrank D F=Module.finrank ℚ F := Module.finrank_mul_finrank ℚ (↥D) (↥F)
    exact Nat.le_of_mul_le_mul_left (hd.le.trans hi) Module.finrank_pos
  · letI : NumberField (F.restrictScalars ℚ) := (inferInstance : NumberField F)
    exact hS (F.restrictScalars ℚ) (fun x hx => subset_adjoin D _ hx)

local notation "B" => algebraicClosure ℚ ℂ

theorem good_extension (n : ℕ) (hn : 0<n) :
    ∃ bound : ℕ, ∀ D : IntermediateField ℚ B, ∀ [NumberField D],
      ∃ F : IntermediateField D B, ∃ hF : FiniteDimensional D F,
        letI : NumberField F := NumberField.of_module_finite D F
        Module.finrank D F≤bound ∧ ∃ V W : WeierstrassCurve (𝓞 F), ∃ C A : VariableChange F,
        C • E (n:F)=V.map (algebraMap (𝓞 F) F) ∧
        A • E (n:F)=W.map (algebraMap (𝓞 F) F) ∧ IsCoprime V.Δ W.Δ := by
  letI : IsAlgClosure ℚ B := algebraicClosure.isAlgClosure ℚ ℂ
  letI : IsAlgClosed B := IsAlgClosure.isAlgClosed ℚ
  exact good_extension_in B n hn

end
end TunnellCMUniformGoodBase
#print axioms TunnellCMUniformGoodBase.good_extension
