import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H3_R1_H1_R1_H3_R1_H2_R1_H1_R1_H1_R1_H2_R1
import Mathlib

/-! Pass to the fixed field of a generator. Infinitely many primes of that field have a unique extension in the prime-degree cyclic extension. Outside the finite ramification set the decomposition group is cyclic of exponent p. -/
namespace OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H3_R1_H1_R1_H3_R1_H2_R1_H1_R1_H1_R1_H2_R1_H1_R1
open NumberField IsDedekindDomain
open scoped NumberField Classical TensorProduct IsMulCommutative

def H1 : Prop :=
  ∀ (D N:Type) [Field D] [NumberField D] [Field N] [NumberField N]
    [Algebra D N] [FiniteDimensional D N] [IsGalois D N],
    (Module.finrank D N).Prime →
    {v:HeightOneSpectrum (𝓞 D) | Nat.card (v.asIdeal.primesOver (𝓞 N))=1}.Infinite

def H2 : Prop :=
  (∀ (D N:Type) [Field D] [NumberField D] [Field N] [NumberField N]
    [Algebra D N] [FiniteDimensional D N] [IsGalois D N],
    (Module.finrank D N).Prime →
    {v:HeightOneSpectrum (𝓞 D) | Nat.card (v.asIdeal.primesOver (𝓞 N))=1}.Infinite) →
    ∀(D N:Type)[Field D][NumberField D][Field N][NumberField N][Algebra D N]
    [FiniteDimensional D N][IsGalois D N](p:ℕ),p.Prime → IsMulCommutative Gal(N/D) →
    (∀a:Gal(N/D),a^p=1) → ∀g:Gal(N/D),orderOf g=p →
    {v:HeightOneSpectrum (𝓞 D) | ∀t:HeightOneSpectrum (𝓞 N),t.asIdeal.LiesOver v.asIdeal → ∀a:Gal(N/D),
      HeightOneSpectrum.equivOfRingEquiv (RingOfIntegers.mapAlgEquiv a).toRingEquiv t=t ↔ a∈Subgroup.zpowers g}.Infinite

theorem main : H1 → H2 → OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H3_R1_H1_R1_H3_R1_H2_R1_H1_R1_H1_R1_H2_R1.H1 := by
  intro primes lift
  exact lift primes

end OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H3_R1_H1_R1_H3_R1_H2_R1_H1_R1_H1_R1_H2_R1_H1_R1
