import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H3_R1_H1_R1
import Mathlib

/-! Start with a finite support for ramification and ideal classes. Auxiliary split primes separate the local powers of supported units. The principal ideles convert this separation to a subgroup equality. -/
namespace OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H3_R1_H1_R1_H3_R1
open NumberField IsDedekindDomain
open scoped NumberField Classical TensorProduct IsMulCommutative

def H1 : Prop :=
  ∀(D:Type)[Field D][NumberField D](E:IntermediateField D (SeparableClosure D))
   [FiniteDimensional D E][IsGalois D E],
   let p:=Module.finrank D E
   p.Prime → (primitiveRoots p D).Nonempty →
   letI:NumberField E:=NumberField.of_module_finite D E
   let V:=HeightOneSpectrum (𝓞 D)
   let A:=AdeleRing (𝓞 D) D
   let unram(v:V):=∀ t:HeightOneSpectrum (𝓞 E),t.asIdeal.LiesOver v.asIdeal → Algebra.IsUnramifiedAt (𝓞 D) t.asIdeal
   let J(F:Finset V):=Subgroup.closure {a:Aˣ | ∀ v:V,v∉F → a.val.2 v∈v.adicCompletionIntegers D ∧ (a⁻¹).val.2 v∈v.adicCompletionIntegers D}
   let j:=Units.map (algebraMap D A).toMonoidHom
   ∃ B:Finset V,(∀ v:V,v∉B → unram v) ∧
     (∀ v:V,v.asIdeal ∣ Ideal.span {(p:𝓞 D)} → v∈B) ∧ j.range⊔J B=⊤

def H2 : Prop :=
  ∀(D:Type)[Field D][NumberField D](E:IntermediateField D (SeparableClosure D))
   [FiniteDimensional D E][IsGalois D E],
   let p:=Module.finrank D E
   p.Prime → (primitiveRoots p D).Nonempty →
   letI:NumberField E:=NumberField.of_module_finite D E
   let V:=HeightOneSpectrum (𝓞 D)
   let split(v:V):=∀ t:HeightOneSpectrum (𝓞 E),t.asIdeal.LiesOver v.asIdeal → ∀ g:Gal(E/D),
     HeightOneSpectrum.equivOfRingEquiv (RingOfIntegers.mapAlgEquiv g).toRingEquiv t=t → g=1
   ∀ B:Finset V,∃ S T:Finset V,B⊆S ∧ (∀ v∈T,split v) ∧ Disjoint S T ∧
     T.card+1=Nat.card (InfinitePlace D)+S.card ∧ let W:=(↑(S∪T):Set V).unit D
     (∀ x:W,(∀ w:InfinitePlace D,∃ y:w.Completion,y^p=(x.val.val:w.Completion)) →
       (∀ v∈S,∃ y:v.adicCompletion D,y^p=(x.val.val:v.adicCompletion D)) → ∃ y:W,y^p=x)

def H3 : Prop :=
  ∀(D:Type)[Field D][NumberField D](p:ℕ),0<p →
   let V:=HeightOneSpectrum (𝓞 D)
   let A:=AdeleRing (𝓞 D) D
   let U(S T:Finset V):=Subgroup.closure {a:Aˣ |
     (∀ w:InfinitePlace D,∃ y:w.Completion,y^p=a.val.1 w) ∧
     (∀ v∈S,∃ y:v.adicCompletion D,y^p=a.val.2 v) ∧
     ∀ v:V,v∉S∪T → a.val.2 v∈v.adicCompletionIntegers D ∧ (a⁻¹).val.2 v∈v.adicCompletionIntegers D}
   let J(F:Finset V):=Subgroup.closure {a:Aˣ | ∀ v:V,v∉F → a.val.2 v∈v.adicCompletionIntegers D ∧ (a⁻¹).val.2 v∈v.adicCompletionIntegers D}
   let j:=Units.map (algebraMap D A).toMonoidHom
   ∀ S T:Finset V,let W:=(↑(S∪T):Set V).unit D
     (J (S∪T)).comap j=W ∧ ((∀ x:W,(∀ w:InfinitePlace D,∃ y:w.Completion,y^p=(x.val.val:w.Completion)) →
       (∀ v∈S,∃ y:v.adicCompletion D,y^p=(x.val.val:v.adicCompletion D)) → ∃ y:W,y^p=x) → (U S T).comap j=(powMonoidHom p:W→*W).range.map W.subtype)

theorem main : H1 → H2 → H3 → OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H3_R1_H1_R1.H3 := by
  intro seed separate principal D _ _ E _ _
  dsimp only
  intro hp hmu
  letI : NumberField E := NumberField.of_module_finite D E
  let p:=Module.finrank D E
  let V:=HeightOneSpectrum (𝓞 D)
  let A:=AdeleRing (𝓞 D) D
  let J(F:Finset V):=Subgroup.closure {a:Aˣ | ∀ v:V,v∉F → a.val.2 v∈v.adicCompletionIntegers D ∧ (a⁻¹).val.2 v∈v.adicCompletionIntegers D}
  let j:=Units.map (algebraMap D A).toMonoidHom
  obtain ⟨B,hun,hpB,hB⟩:=seed D E hp hmu
  obtain ⟨S,T,hBS,hspl,hd,hcard,hpow⟩:=separate D E hp hmu B
  obtain ⟨hs,hu⟩:=principal D p hp.pos S T
  have inclusion:B⊆S∪T:=hBS.trans Finset.subset_union_left
  have mono:J B≤J (S∪T):=Subgroup.closure_mono fun a ha w hw=>ha w (fun h=>hw (inclusion h))
  refine ⟨S,T,hspl,fun v hv=>hun v (fun h=>hv (inclusion h)),hd,hcard,fun v hv=>hBS (hpB v hv),?_,hs,hu hpow⟩
  exact top_unique (hB ▸ (show j.range⊔J B≤j.range⊔J (S∪T) from sup_le_sup_left mono _))

end OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H3_R1_H1_R1_H3_R1
