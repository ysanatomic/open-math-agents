import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1
import Mathlib

/-!
Global Artin reciprocity says that the product of the local symbols of a principal
idele is one. Unramified extensions of local fields have surjective norm on units.
For a global unit over a totally imaginary base, these facts leave only the
specified finite place in the product.
-/
namespace OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1
open NumberField IsDedekindDomain
open scoped Classical NumberField IsMulCommutative

def H1 : Prop :=
  ∀ (D N : Type) [Field D] [NumberField D] [Field N] [NumberField N] [Algebra D N]
    [FiniteDimensional D N] [IsAbelianGalois D N],
  (∀ i : InfinitePlace D, i.IsComplex) →
  ∃ σ : HeightOneSpectrum (𝓞 D) → (𝓞 D)ˣ → Gal(N/D),
    (∀ u, ∏ᶠ v, σ v u = 1) ∧
    ∀ v : HeightOneSpectrum (𝓞 D), let V := v.adicCompletion D
      ∃ t : HeightOneSpectrum (𝓞 N), t.asIdeal.LiesOver v.asIdeal ∧
        ∃ f : V →+* t.adicCompletion N, Continuous f ∧
          (∀ c : D, f (algebraMap D V c) = algebraMap N (t.adicCompletion N) (algebraMap D N c)) ∧
          letI : Algebra V (t.adicCompletion N) := f.toAlgebra
          ∀ u : (𝓞 D)ˣ, σ v u = 1 ↔ ∃ y : (t.adicCompletion N)ˣ,
            Algebra.norm V (y : t.adicCompletion N) = algebraMap D V u.val.val

def H2 : Prop :=
  ∀ (D N : Type) [Field D] [NumberField D] [Field N] [NumberField N] [Algebra D N]
    [FiniteDimensional D N] [IsAbelianGalois D N],
  ∀ (v : HeightOneSpectrum (𝓞 D)) (t : HeightOneSpectrum (𝓞 N)),
    t.asIdeal.LiesOver v.asIdeal → t.asIdeal.ramificationIdx (𝓞 D) = 1 →
    let V := v.adicCompletion D
    ∀ f : V →+* t.adicCompletion N, Continuous f →
      (∀ c : D, f (algebraMap D V c) = algebraMap N (t.adicCompletion N) (algebraMap D N c)) →
      letI : Algebra V (t.adicCompletion N) := f.toAlgebra
      ∀ u : (𝓞 D)ˣ, ∃ y : (t.adicCompletion N)ˣ,
        Algebra.norm V (y : t.adicCompletion N) = algebraMap D V u.val.val

theorem main : H1 → H2 → OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1.H2 := by
  intro symbols units D N _ _ _ _ _ _ _ v complex unramified x
  obtain ⟨σ, product, kernel⟩ := symbols D N complex
  have outside (s : HeightOneSpectrum (𝓞 D)) (hs : s ≠ v) : σ s x = 1 := by
    obtain ⟨t, ht, f, hf, hc, norm⟩ := kernel s
    exact (norm x).2 (units D N s t ht (unramified s hs t ht) f hf hc x)
  obtain ⟨t, ht, f, hf, hc, norm⟩ := kernel v
  refine ⟨t, ht, f, hf, hc, (norm x).1 ?_⟩
  exact (finprod_eq_single (fun s => σ s x) v outside).symm.trans (product x)

end OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1

