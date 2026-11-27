import TunnellCMGaussianGround

/-! The Gaussian number field as a subfield of the complex numbers, with
compatible embeddings into the absolute algebraic closure and the complex plane. -/
namespace TunnellCMConcreteGaussian
open Complex Polynomial IntermediateField NumberField TunnellCMGaussianGround
open scoped Classical Polynomial NumberField
noncomputable section
abbrev K := ℚ⟮I⟯
local notation "B" => algebraicClosure ℚ ℂ
def i : K := ⟨I,subset_adjoin ℚ _ (Set.mem_singleton _)⟩
lemma square : i^2= -1 := K.val.injective I_sq
instance : NumberField K := by
  letI : FiniteDimensional ℚ K := IntermediateField.adjoin.finiteDimensional (show IsIntegral ℚ I from ⟨f,monic_f,root_f⟩)
  exact ⟨⟩
lemma degree : Module.finrank ℚ K=2 := by
  have h:=minpoly.eq_of_irreducible_of_monic irred_f root_f monic_f
  rw [adjoin.finrank ⟨f,monic_f,root_f⟩,←h]
  exact natDegree_X_pow_sub_C
def inclusion : K →ₐ[ℚ] B :=
  K.val.codRestrict (B).toSubalgebra (fun x => mem_algebraicClosure_iff'.mpr <|
    (Algebra.IsIntegral.isIntegral (R:=ℚ) x).map K.val)
instance : Algebra K B := inclusion.toAlgebra
instance : IsScalarTower K B ℂ := .of_algebraMap_eq' rfl
lemma orientation : ((algebraMap K B i:B):ℂ)=I := rfl
end
end TunnellCMConcreteGaussian
#print axioms TunnellCMConcreteGaussian.degree
