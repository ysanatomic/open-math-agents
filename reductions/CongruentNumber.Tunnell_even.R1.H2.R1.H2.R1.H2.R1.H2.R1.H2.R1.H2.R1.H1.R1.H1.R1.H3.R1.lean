import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1
import Mathlib

/-! Auxiliary completely split primes convert the prime Kummer index to a count of prescribed local powers and integral units. Those local conditions lie in the adelic norm subgroup. -/
namespace OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H3_R1
open NumberField IsDedekindDomain
open scoped NumberField TensorProduct Classical
noncomputable section

def H1 : Prop :=
  ∀(D:Type)[Field D][NumberField D](E:IntermediateField D (SeparableClosure D))
   [FiniteDimensional D E][IsGalois D E],
   let p:=Module.finrank D E
   p.Prime → (primitiveRoots p D).Nonempty →
   letI:NumberField E:=NumberField.of_module_finite D E
   let V:=HeightOneSpectrum (𝓞 D)
   let A:=AdeleRing (𝓞 D) D
   let U(S T:Finset V):=Subgroup.closure {a:Aˣ |
     (∀ w:InfinitePlace D,∃ y:w.Completion,y^p=a.val.1 w) ∧
     (∀ v∈S,∃ y:v.adicCompletion D,y^p=a.val.2 v) ∧
     ∀ v:V,v∉S∪T → a.val.2 v∈v.adicCompletionIntegers D ∧ (a⁻¹).val.2 v∈v.adicCompletionIntegers D}
   let split(v:V):=∀ t:HeightOneSpectrum (𝓞 E),t.asIdeal.LiesOver v.asIdeal → ∀ g:Gal(E/D),
     HeightOneSpectrum.equivOfRingEquiv (RingOfIntegers.mapAlgEquiv g).toRingEquiv t=t → g=1
   let unram(v:V):=∀ t:HeightOneSpectrum (𝓞 E),t.asIdeal.LiesOver v.asIdeal → Algebra.IsUnramifiedAt (𝓞 D) t.asIdeal
   ∃ S T:Finset V, (∀ v∈T,split v) ∧ (∀ v:V,v∉S∪T → unram v) ∧
     ((Units.map (algebraMap D A).toMonoidHom).range ⊔ U S T).index=p

def H2 : Prop :=
  ∀(D:Type)[Field D][NumberField D](E:IntermediateField D (SeparableClosure D))
   [FiniteDimensional D E][IsGalois D E],
   let p:=Module.finrank D E
   p.Prime → (primitiveRoots p D).Nonempty →
   letI:NumberField E:=NumberField.of_module_finite D E
   let V:=HeightOneSpectrum (𝓞 D)
   let A:=AdeleRing (𝓞 D) D
   let U(S T:Finset V):=Subgroup.closure {a:Aˣ |
     (∀ w:InfinitePlace D,∃ y:w.Completion,y^p=a.val.1 w) ∧
     (∀ v∈S,∃ y:v.adicCompletion D,y^p=a.val.2 v) ∧
     ∀ v:V,v∉S∪T → a.val.2 v∈v.adicCompletionIntegers D ∧ (a⁻¹).val.2 v∈v.adicCompletionIntegers D}
   let split(v:V):=∀ t:HeightOneSpectrum (𝓞 E),t.asIdeal.LiesOver v.asIdeal → ∀ g:Gal(E/D),
     HeightOneSpectrum.equivOfRingEquiv (RingOfIntegers.mapAlgEquiv g).toRingEquiv t=t → g=1
   let unram(v:V):=∀ t:HeightOneSpectrum (𝓞 E),t.asIdeal.LiesOver v.asIdeal → Algebra.IsUnramifiedAt (𝓞 D) t.asIdeal
   ∀ S T:Finset V, (∀ v∈T,split v) → (∀ v:V,v∉S∪T → unram v) →
     U S T ≤ (Units.map (Algebra.norm A (S:=A⊗[D]E))).range

theorem main : H1 → H2 → OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1.H3 := by
  intro aux norms D N _ _ _ _ _ _ _ hp hmu
  let i : N →ₐ[D] SeparableClosure D := IsSepClosed.lift
  let E := i.fieldRange
  let e : N ≃ₐ[D] E := AlgHom.equivFieldRange i
  letI : FiniteDimensional D E := e.toLinearEquiv.finiteDimensional
  letI : IsGalois D E := IsGalois.of_algEquiv e
  letI : NumberField E := NumberField.of_module_finite D E
  have hd : Module.finrank D N=Module.finrank D E := e.toLinearEquiv.finrank_eq
  have hpE : (Module.finrank D E).Prime := hd ▸ hp
  have hmuE : (primitiveRoots (Module.finrank D E) D).Nonempty := hd ▸ hmu
  obtain ⟨S,T,hs,hu,hi⟩ := aux D E hpE hmuE
  have hn := norms D E hpE hmuE S T hs hu
  let A:=AdeleRing (𝓞 D) D
  let normN:=Units.map (Algebra.norm A (S:=A⊗[D]N))
  let normE:=Units.map (Algebra.norm A (S:=A⊗[D]E))
  let j := Algebra.TensorProduct.congr (AlgEquiv.refl (R:=A) (A₁:=A)) e
  let u := Units.mapEquiv j.toMulEquiv
  have hr : normE.range ≤ normN.range := by
    rintro _ ⟨y,rfl⟩
    obtain ⟨z,rfl⟩ := u.surjective y
    refine ⟨z,Units.ext ?_⟩
    exact (Algebra.norm_eq_of_algEquiv j z.val).symm
  rw [hd,←hi]
  exact Subgroup.index_dvd_of_le (sup_le_sup_left (hn.trans hr) _)
end
end OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H3_R1
