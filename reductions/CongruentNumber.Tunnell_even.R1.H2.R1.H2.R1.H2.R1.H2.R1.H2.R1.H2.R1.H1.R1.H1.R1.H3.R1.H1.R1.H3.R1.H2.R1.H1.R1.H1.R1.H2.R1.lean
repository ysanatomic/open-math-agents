import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H3_R1_H1_R1_H3_R1_H2_R1_H1_R1_H1_R1
import Mathlib

/-! An unramified prime with prescribed cyclic decomposition group splits in its fixed subfield. A local power has a root in the decomposition field, so its global Kummer roots are fixed by the generator. -/
namespace OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H3_R1_H1_R1_H3_R1_H2_R1_H1_R1_H1_R1_H2_R1
open NumberField IsDedekindDomain
open scoped NumberField Classical TensorProduct IsMulCommutative

def H1 : Prop :=
  ∀(D N:Type)[Field D][NumberField D][Field N][NumberField N][Algebra D N]
    [FiniteDimensional D N][IsGalois D N](p:ℕ),p.Prime → IsMulCommutative Gal(N/D) →
    (∀a:Gal(N/D),a^p=1) → ∀g:Gal(N/D),orderOf g=p →
    {v:HeightOneSpectrum (𝓞 D) | ∀t:HeightOneSpectrum (𝓞 N),t.asIdeal.LiesOver v.asIdeal → ∀a:Gal(N/D),
      HeightOneSpectrum.equivOfRingEquiv (RingOfIntegers.mapAlgEquiv a).toRingEquiv t=t ↔ a∈Subgroup.zpowers g}.Infinite

def H2 : Prop :=
  ∀(D:Type)[Field D][NumberField D](E N:IntermediateField D (SeparableClosure D))
    [FiniteDimensional D E][IsGalois D E][FiniteDimensional D N][IsGalois D N],
    let p:=Module.finrank D E
    p.Prime → (primitiveRoots p D).Nonempty → E≤N → IsMulCommutative Gal(N/D) →
    (∀a:Gal(N/D),a^p=1) → ∀g:Gal(N/D),orderOf g=p → (∀x:N,x.val∈E → g x=x) →
    letI:NumberField N:=NumberField.of_module_finite D N
    letI:NumberField E:=NumberField.of_module_finite D E
    let V:=HeightOneSpectrum (𝓞 D)
    let split(v:V):=∀ t:HeightOneSpectrum (𝓞 E),t.asIdeal.LiesOver v.asIdeal → ∀ a:Gal(E/D),
      HeightOneSpectrum.equivOfRingEquiv (RingOfIntegers.mapAlgEquiv a).toRingEquiv t=t → a=1
    ∀v:V, (∀t:HeightOneSpectrum (𝓞 N),t.asIdeal.LiesOver v.asIdeal → ∀a:Gal(N/D),
      HeightOneSpectrum.equivOfRingEquiv (RingOfIntegers.mapAlgEquiv a).toRingEquiv t=t ↔ a∈Subgroup.zpowers g) → split v ∧ ∀(x:Dˣ)(z:N),z^p=algebraMap D N x.val →
      (∃y:v.adicCompletion D,y^p=(x.val:v.adicCompletion D)) → g z=z

theorem main : H1 → H2 → OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H3_R1_H1_R1_H3_R1_H2_R1_H1_R1_H1_R1.H2 := by
  intro primes descend D _ _ E N _ _ _ _
  dsimp only
  intro hp hmu hEN comm exp g ho hfix
  letI : NumberField N:=NumberField.of_module_finite D N
  exact (primes D N (Module.finrank D E) hp comm exp g ho).mono
    (fun v h=>descend D E N hp hmu hEN comm exp g ho hfix v h)

end OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H3_R1_H1_R1_H3_R1_H2_R1_H1_R1_H1_R1_H2_R1
