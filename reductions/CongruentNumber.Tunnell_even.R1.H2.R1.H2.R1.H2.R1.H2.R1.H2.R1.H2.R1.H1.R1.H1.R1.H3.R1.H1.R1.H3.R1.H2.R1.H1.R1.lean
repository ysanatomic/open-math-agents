import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H3_R1_H1_R1_H3_R1_H2_R1
import Mathlib

/-! Local powers at the selected split primes have their roots in the prescribed cyclic extension. The order of its Kummer radical bounds the kernel of localization, and the unit indices then give surjectivity. -/
namespace OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H3_R1_H1_R1_H3_R1_H2_R1_H1_R1
open NumberField IsDedekindDomain
open scoped NumberField Classical TensorProduct IsMulCommutative

def H1 : Prop :=
  ∀(D:Type)[Field D][NumberField D](E:IntermediateField D (SeparableClosure D))
   [FiniteDimensional D E][IsGalois D E],
   let p:=Module.finrank D E
   p.Prime → (primitiveRoots p D).Nonempty →
   letI:NumberField E:=NumberField.of_module_finite D E
   let V:=HeightOneSpectrum (𝓞 D)
   let split(v:V):=∀ t:HeightOneSpectrum (𝓞 E),t.asIdeal.LiesOver v.asIdeal → ∀ g:Gal(E/D),
     HeightOneSpectrum.equivOfRingEquiv (RingOfIntegers.mapAlgEquiv g).toRingEquiv t=t → g=1
   let A:=AdeleRing (𝓞 D) D
   let J(F:Finset V):=Subgroup.closure {a:Aˣ | ∀ v:V,v∉F → a.val.2 v∈v.adicCompletionIntegers D ∧ (a⁻¹).val.2 v∈v.adicCompletionIntegers D}
   let j:=Units.map (algebraMap D A).toMonoidHom
   ∀ B:Finset V,∃ S T:Finset V,B⊆S ∧ (∀ v∈T,split v) ∧ Disjoint S T ∧
     T.card+1=Nat.card (InfinitePlace D)+S.card ∧ (∀ v:V,v.asIdeal ∣ Ideal.span {(p:𝓞 D)} → v∈S) ∧ j.range⊔J S=⊤ ∧ (∀ x:(S:Set V).unit D, (∀ v:T, ∃ y:v.val.adicCompletion D,y^p=(x.val.val:v.val.adicCompletion D)) →
        ∃ z:E,z^p=algebraMap D E x.val.val)

def H2 : Prop :=
  ∀(D:Type)[Field D][NumberField D](E:IntermediateField D (SeparableClosure D))
   [FiniteDimensional D E][IsGalois D E],
   let p:=Module.finrank D E
   p.Prime → (primitiveRoots p D).Nonempty →
   letI:NumberField E:=NumberField.of_module_finite D E
   let V:=HeightOneSpectrum (𝓞 D)
   ∀ S T:Finset V,Disjoint S T → T.card+1=Nat.card (InfinitePlace D)+S.card →
     (∀ v:V,v.asIdeal ∣ Ideal.span {(p:𝓞 D)} → v∈S) → (∀ x:(S:Set V).unit D, (∀ v:T, ∃ y:v.val.adicCompletion D,y^p=(x.val.val:v.val.adicCompletion D)) →
        ∃ z:E,z^p=algebraMap D E x.val.val) → (∀ u:(∀ v:T,(v.val.adicCompletionIntegers D)ˣ),∃ x:(S:Set V).unit D,∀ v:T,
      ∃ y:(v.val.adicCompletionIntegers D)ˣ, ((y.val.val:v.val.adicCompletion D)^p)*(x.val.val:v.val.adicCompletion D)=(u v).val.val)

theorem main : H1 → H2 → OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H3_R1_H1_R1_H3_R1_H2_R1.H1 := by
  intro select count D _ _ E _ _
  dsimp only
  intro hp hmu B
  obtain ⟨S,T,bs,split,disj,card,prime,classes,roots⟩:=select D E hp hmu B
  exact ⟨S,T,bs,split,disj,card,prime,classes,count D E hp hmu S T disj card prime roots⟩

end OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H3_R1_H1_R1_H3_R1_H2_R1_H1_R1
