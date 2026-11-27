import Mathlib.FieldTheory.AlgebraicClosure
import Mathlib.FieldTheory.KummerPolynomial
import Mathlib.NumberTheory.NumberField.InfinitePlace.Basic
import Mathlib.Analysis.Complex.Polynomial.Basic

/-! The fixed quadratic Gaussian ground field, with its chosen complex orientation. -/
namespace TunnellCMGaussianGround
open NumberField IntermediateField Polynomial Complex
open scoped Classical Polynomial NumberField
noncomputable section
local notation "B" => algebraicClosure ℚ ℂ

def f : ℚ[X] := X^2-C (-1)
lemma monic_f : f.Monic := monic_X_pow_sub_C _ (by decide)
lemma irred_f : Irreducible f := X_pow_sub_C_irreducible_of_prime Nat.prime_two (fun y h => by nlinarith [sq_nonneg y])
lemma root_f : aeval I f=0 := by simp [f]

def j : B := ⟨I,mem_algebraicClosure_iff'.mpr ⟨f,monic_f,root_f⟩⟩
def ground := adjoin ℚ ({j}:Set B)
def i : ground := ⟨j,subset_adjoin ℚ _ (Set.mem_singleton _)⟩
lemma square : i^2= -1 := by
  apply ground.val.injective
  apply (algebraMap B ℂ).injective
  exact I_sq

lemma orientation : ((algebraMap ground B i:B):ℂ)=I := rfl

lemma j_root : aeval j f=0 := by
  apply (algebraMap B ℂ).injective
  simp [f,j]
instance : NumberField ground := by
  letI : FiniteDimensional ℚ ground := IntermediateField.adjoin.finiteDimensional (show IsIntegral ℚ j from ⟨f,monic_f,j_root⟩)
  exact ⟨⟩

theorem degree : Module.finrank ℚ ground=2 := by
  have he := j_root
  have hm := minpoly.eq_of_irreducible_of_monic irred_f he monic_f
  change Module.finrank ℚ (ℚ⟮j⟯)=2
  rw [adjoin.finrank ⟨f,monic_f,he⟩,←hm]
  exact natDegree_X_pow_sub_C

theorem complex_places {T : Type} [Field T] [NumberField T] [Algebra ground T] (v : InfinitePlace T) : v.IsComplex := by
  apply InfinitePlace.not_isReal_iff_isComplex.mp
  intro hR
  let u := (InfinitePlace.embedding_of_isReal hR).comp (algebraMap ground T)
  have he := congrArg u square
  simp only [map_pow,map_neg,map_one] at he
  nlinarith [sq_nonneg (u i)]

end
end TunnellCMGaussianGround
#print axioms TunnellCMGaussianGround.degree
#print axioms TunnellCMGaussianGround.complex_places
