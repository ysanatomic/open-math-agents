import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H3_R1_H1_R1_H3_R1
import Mathlib

/-! Choose split auxiliary primes such that the S-units realize every tuple of local unit power classes. This approximation detects powers in the enlarged group of supported units. -/
namespace OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H3_R1_H1_R1_H3_R1_H2_R1
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
     T.card+1=Nat.card (InfinitePlace D)+S.card ∧ (∀ v:V,v.asIdeal ∣ Ideal.span {(p:𝓞 D)} → v∈S) ∧ j.range⊔J S=⊤ ∧ (∀ u:(∀ v:T,(v.val.adicCompletionIntegers D)ˣ),∃ x:(S:Set V).unit D,∀ v:T,
      ∃ y:(v.val.adicCompletionIntegers D)ˣ, ((y.val.val:v.val.adicCompletion D)^p)*(x.val.val:v.val.adicCompletion D)=(u v).val.val)

def H2 : Prop :=
  (∀(D N:Type)[Field D][NumberField D][Field N][NumberField N][Algebra D N]
    [FiniteDimensional D N][IsGalois D N][IsCyclic Gal(N/D)],
    let A:=AdeleRing (𝓞 D) D
    (Units.map (algebraMap D A).toMonoidHom).range ⊔ (Units.map (Algebra.norm A (S:=A⊗[D]N))).range=⊤ →
    Module.finrank D N=1) →
  ∀(D:Type)[Field D][NumberField D](p:ℕ),p.Prime → (primitiveRoots p D).Nonempty →
   let V:=HeightOneSpectrum (𝓞 D)
   let A:=AdeleRing (𝓞 D) D
   let J(F:Finset V):=Subgroup.closure {a:Aˣ | ∀ v:V,v∉F → a.val.2 v∈v.adicCompletionIntegers D ∧ (a⁻¹).val.2 v∈v.adicCompletionIntegers D}
   let j:=Units.map (algebraMap D A).toMonoidHom
   ∀ S T:Finset V,Disjoint S T → ((∀ v:V,v.asIdeal ∣ Ideal.span {(p:𝓞 D)} → v∈S) ∧ j.range⊔J S=⊤) → (∀ u:(∀ v:T,(v.val.adicCompletionIntegers D)ˣ),∃ x:(S:Set V).unit D,∀ v:T,
      ∃ y:(v.val.adicCompletionIntegers D)ˣ, ((y.val.val:v.val.adicCompletion D)^p)*(x.val.val:v.val.adicCompletion D)=(u v).val.val) →
     let W:=(↑(S∪T):Set V).unit D
     (∀ x:W,(∀ w:InfinitePlace D,∃ y:w.Completion,y^p=(x.val.val:w.Completion)) →
       (∀ v∈S,∃ y:v.adicCompletion D,y^p=(x.val.val:v.adicCompletion D)) → ∃ y:W,y^p=x)

theorem main : H1 → H2 → OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H3_R1_H1_R1_H3_R1.H2 := by
  intro choose detect lower
  have detect := detect lower
  intro D _ _ E _ _
  dsimp only
  intro hp hmu B
  obtain ⟨S,T,hBS,split,hd,hc,hs,hJ,sur⟩:=choose D E hp hmu B
  exact ⟨S,T,hBS,split,hd,hc,detect D (Module.finrank D E) hp hmu S T hd ⟨hs,hJ⟩ sur⟩

end OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H3_R1_H1_R1_H3_R1_H2_R1
