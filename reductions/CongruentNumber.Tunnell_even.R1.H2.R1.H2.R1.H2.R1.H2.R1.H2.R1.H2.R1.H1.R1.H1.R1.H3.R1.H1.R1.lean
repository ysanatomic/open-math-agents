import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H3_R1
import Mathlib

/-! The index of the idèles satisfying local power conditions factors into the index of principal S-units and the index on idèle classes. Auxiliary split primes detect global powers. -/
namespace OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H3_R1_H1_R1
open NumberField IsDedekindDomain
open scoped NumberField TensorProduct Classical
noncomputable section

def H1 : Prop :=
  ∀(D:Type)[Field D][NumberField D](p:ℕ),p.Prime → (primitiveRoots p D).Nonempty →
   let V:=HeightOneSpectrum (𝓞 D)
   let A:=AdeleRing (𝓞 D) D
   let U(S T:Finset V):=Subgroup.closure {a:Aˣ |
     (∀ w:InfinitePlace D,∃ y:w.Completion,y^p=a.val.1 w) ∧
     (∀ v∈S,∃ y:v.adicCompletion D,y^p=a.val.2 v) ∧
     ∀ v:V,v∉S∪T → a.val.2 v∈v.adicCompletionIntegers D ∧ (a⁻¹).val.2 v∈v.adicCompletionIntegers D}
   let J(F:Finset V):=Subgroup.closure {a:Aˣ | ∀ v:V,v∉F → a.val.2 v∈v.adicCompletionIntegers D ∧ (a⁻¹).val.2 v∈v.adicCompletionIntegers D}
   ∀ S T:Finset V,(∀ v:V,v.asIdeal ∣ Ideal.span {(p:𝓞 D)} → v∈S) →
      (U S T).relIndex (J (S∪T))=p^(2*(Nat.card (InfinitePlace D)+S.card))

def H2 : Prop :=
  ∀(D:Type)[Field D][NumberField D](p:ℕ),p.Prime → (primitiveRoots p D).Nonempty →
   ∀ F:Finset (HeightOneSpectrum (𝓞 D)),
     let E:=(F:Set (HeightOneSpectrum (𝓞 D))).unit D
     (powMonoidHom p:E→*E).range.index=p^(Nat.card (InfinitePlace D)+F.card)

def H3 : Prop :=
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
   let J(F:Finset V):=Subgroup.closure {a:Aˣ | ∀ v:V,v∉F → a.val.2 v∈v.adicCompletionIntegers D ∧ (a⁻¹).val.2 v∈v.adicCompletionIntegers D}
   let j:=Units.map (algebraMap D A).toMonoidHom
   ∃ S T:Finset V, (∀ v∈T,split v) ∧ (∀ v:V,v∉S∪T → unram v) ∧ Disjoint S T ∧
     T.card+1=Nat.card (InfinitePlace D)+S.card ∧ (∀ v:V,v.asIdeal ∣ Ideal.span {(p:𝓞 D)} → v∈S) ∧
     j.range⊔J (S∪T)=⊤ ∧ let E:=(↑(S∪T):Set V).unit D
     (J (S∪T)).comap j=E ∧ (U S T).comap j=(powMonoidHom p:E→*E).range.map E.subtype

theorem factor {X A:Type} [CommGroup X] [CommGroup A] (j:X→*A) (U J:Subgroup A)
    (hUJ:U≤J) (hj:j.range⊔J=⊤) :
    (U.comap j).relIndex (J.comap j) * (j.range⊔U).index=U.relIndex J := by
  let P:=j.range⊔U
  have h1:U≤P:=le_sup_right
  have h2:P⊔J=⊤:=by
    change j.range⊔U⊔J=⊤
    rwa [sup_assoc,sup_of_le_right hUJ]
  have h3:(j.range ⊓ J)⊔U=P⊓J:=by
    change (j.range ⊓ J)⊔U=(j.range⊔U)⊓J
    rw [sup_comm (j.range⊓J) U,sup_comm j.range U,sup_inf_assoc_of_le _ hUJ]
  rw [Subgroup.relIndex_comap,Subgroup.map_comap_eq,← Subgroup.relIndex_sup_right _ U,h3]
  change U.relIndex (P⊓J)*P.index=U.relIndex J
  rw [←Subgroup.relIndex_top_right P,←h2,Subgroup.relIndex_sup_left,Subgroup.relIndex_inf_mul_relIndex,inf_of_le_left h1]

theorem main : H1 → H2 → H3 → OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H3_R1.H1 := by
  intro places units aux D _ _ N _ _
  dsimp only
  intro hp hmu
  letI : NumberField N:=NumberField.of_module_finite D N
  let p:=Module.finrank D N
  let A:=AdeleRing (𝓞 D) D
  let V:=HeightOneSpectrum (𝓞 D)
  let j:=Units.map (algebraMap D A).toMonoidHom
  obtain ⟨S,T,hS,hU,hd,hc,hpS,hlarge,him,hpow⟩:=aux D N hp hmu
  refine ⟨S,T,hS,hU,?_⟩
  let J:=Subgroup.closure {a:Aˣ | ∀ v:V,v∉S∪T → a.val.2 v∈v.adicCompletionIntegers D ∧ (a⁻¹).val.2 v∈v.adicCompletionIntegers D}
  let U:=Subgroup.closure {a:Aˣ | (∀ w:InfinitePlace D,∃ y:w.Completion,y^p=a.val.1 w) ∧ (∀ v∈S,∃ y:v.adicCompletion D,y^p=a.val.2 v) ∧ ∀ v:V,v∉S∪T → a.val.2 v∈v.adicCompletionIntegers D ∧ (a⁻¹).val.2 v∈v.adicCompletionIntegers D}
  let E:=(↑(S∪T):Set V).unit D
  have hu:U≤J:=Subgroup.closure_mono fun _ hx=>hx.2.2
  have he:=(factor j U J hu hlarge)
  change J.comap j=E at him
  change U.comap j=(powMonoidHom p:E→*E).range.map E.subtype at hpow
  rw [hpow,him] at he
  have hleft(H:Subgroup E):(H.map E.subtype).relIndex E=H.index:=by
    change (H.map E.subtype).relIndex E=H.index
    have hmap := Subgroup.relIndex_map_map_of_injective H ⊤ E.subtype_injective
    rw [← E.subtype.range_eq_map, E.range_subtype,Subgroup.relIndex_top_right] at hmap
    exact hmap
  rw [hleft,units D p hp hmu (S∪T),places D p hp hmu S T hpS] at he
  rw [Finset.card_union_of_disjoint hd] at he
  have hexp:2*(Nat.card (InfinitePlace D)+S.card)=Nat.card (InfinitePlace D)+(S.card+T.card)+1:=by omega
  rw [hexp,pow_succ] at he
  exact Nat.eq_of_mul_eq_mul_left (pow_pos hp.pos _) he
end
end OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H3_R1_H1_R1
