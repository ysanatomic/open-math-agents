import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1_H2_R1
import Mathlib

/-! Local norm reciprocity gives a common automorphism. Scalar extension embeds its field of definition into the global abelian extension, where cyclic intermediate fields detect the identity. -/
namespace OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1_H2_R1_H2_R1
open NumberField IsDedekindDomain
open scoped NumberField TensorProduct

def H1 : Prop :=
  (∀ (D : Type) [Field D] [NumberField D] (v : HeightOneSpectrum (𝓞 D)),
  let K := v.adicCompletion D
  let C := SeparableClosure K
  ∀ (x : Kˣ) (L : IntermediateField K C) [FiniteDimensional K L] [IsAbelianGalois K L],
    ∃ σ : Gal(L/K), ∀ (E : IntermediateField K C) (h : E ≤ L)
      [FiniteDimensional K E] [IsAbelianGalois K E],
      (∀ y : E, (σ (IntermediateField.inclusion h y) : C) = y) ↔
        x ∈ (Units.map (Algebra.norm K (S := E))).range) ∧ (∀ (F : Type) [Field F] [NumberField F] (w : HeightOneSpectrum (𝓞 F)), let k := w.adicCompletion F
  ∀ (Y : Type) [Field Y] [Algebra k Y] [FiniteDimensional k Y] [IsGalois k Y] [IsCyclic Gal(Y/k)],
    (Units.map (Algebra.norm k (S := Y))).range.index = Module.finrank k Y)


def H2 : Prop :=
  ∀ (D N K : Type) [Field D] [Field N] [Field K] [Algebra D N] [Algebra D K]
    [FiniteDimensional D N] [IsAbelianGalois D N],
  let C := SeparableClosure K
  ∀ x : Kˣ,
  (∀ (L : IntermediateField K C) [FiniteDimensional K L] [IsAbelianGalois K L],
    ∃ σ : Gal(L/K), ∀ (E : IntermediateField K C) (h : E ≤ L)
      [FiniteDimensional K E] [IsAbelianGalois K E],
      (∀ y : E, (σ (IntermediateField.inclusion h y) : C) = y) ↔
        x ∈ (Units.map (Algebra.norm K (S := E))).range) →
  (x ∈ (Units.map (Algebra.norm K (S := K ⊗[D] N))).range ↔
    ∀ E : IntermediateField D N, IsCyclic Gal(E/D) →
      x ∈ (Units.map (Algebra.norm K (S := K ⊗[D] E))).range)

theorem main : H1 → H2 → OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1_H2_R1.H2 := by
  intro witness scalar
  refine ⟨?_,witness.2⟩
  intro D N _ _ _ _ _ _ _ v K x
  exact (scalar D N K x (witness.1 D v x)).mpr

end OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1_H2_R1_H2_R1
