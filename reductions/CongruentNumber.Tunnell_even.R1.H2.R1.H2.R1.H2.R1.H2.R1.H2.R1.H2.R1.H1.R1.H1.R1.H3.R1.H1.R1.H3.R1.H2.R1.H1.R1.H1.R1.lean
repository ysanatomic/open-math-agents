import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H3_R1_H1_R1_H3_R1_H2_R1_H1_R1
import Mathlib

/-! Choose independent generators of the Kummer restriction kernel. Distinct split primes detect their fixed vectors, forcing each locally trivial radical to descend to the specified field. -/
namespace OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H3_R1_H1_R1_H3_R1_H2_R1_H1_R1_H1_R1
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
   let J(F:Finset V):=Subgroup.closure {a:Aˣ | ∀ v:V,v∉F → a.val.2 v∈v.adicCompletionIntegers D ∧ (a⁻¹).val.2 v∈v.adicCompletionIntegers D}
   let j:=Units.map (algebraMap D A).toMonoidHom
   ∀ B:Finset V,∃ S:Finset V, B⊆S ∧ (∀ v:V,v.asIdeal ∣ Ideal.span {(p:𝓞 D)} → v∈S) ∧ j.range⊔J S=⊤ ∧
    ∃ k:ℕ,k+1=Nat.card (InfinitePlace D)+S.card ∧
    ∃ N:IntermediateField D (SeparableClosure D), E≤N ∧ ∃ (dim:FiniteDimensional D N) (gal:IsGalois D N) (comm:IsMulCommutative Gal(N/D)),
      letI:=dim
      letI:=gal
      letI:=comm
      (∀a:Gal(N/D),a^p=1) ∧
      (∀x:(S:Set V).unit D,∃z:N,z^p=algebraMap D N x.val.val) ∧
      ∃g:Fin k→Gal(N/D),(∀i,orderOf (g i)=p) ∧
       (∀i (x:N),x.val∈E → g i x=x) ∧ (∀x:N,(∀i,g i x=x) → x.val∈E)

def H2 : Prop :=
  ∀(D:Type)[Field D][NumberField D](E N:IntermediateField D (SeparableClosure D))
    [FiniteDimensional D E][IsGalois D E][FiniteDimensional D N][IsGalois D N],
    let p:=Module.finrank D E
    p.Prime → (primitiveRoots p D).Nonempty → E≤N → IsMulCommutative Gal(N/D) →
    (∀a:Gal(N/D),a^p=1) → ∀g:Gal(N/D),orderOf g=p → (∀x:N,x.val∈E → g x=x) →
    letI:NumberField E:=NumberField.of_module_finite D E
    let V:=HeightOneSpectrum (𝓞 D)
    let split(v:V):=∀ t:HeightOneSpectrum (𝓞 E),t.asIdeal.LiesOver v.asIdeal → ∀ a:Gal(E/D),
      HeightOneSpectrum.equivOfRingEquiv (RingOfIntegers.mapAlgEquiv a).toRingEquiv t=t → a=1
    {v:V | split v ∧ ∀(x:Dˣ)(z:N),z^p=algebraMap D N x.val →
      (∃y:v.adicCompletion D,y^p=(x.val:v.adicCompletion D)) → g z=z}.Infinite

private theorem choosePlaces {V:Type} {k:ℕ} (S:Finset V) (A:Fin k→Set V)
    (h:∀i,(A i).Infinite) : ∃ f:Fin k→V,Function.Injective f ∧ ∀i,f i∈A i ∧ f i∉S := by
  classical
  choose B sub card using fun i=>((h i).sdiff S.finite_toSet).exists_subset_card_eq k
  have hall (t:Finset (Fin k)) : t.card ≤ (t.biUnion B).card := by
    by_cases ht:t.Nonempty
    · obtain ⟨i,hi⟩:=ht
      calc
        t.card ≤ k := by simpa using t.card_le_univ
        _ = (B i).card := (card i).symm
        _ ≤ _ := Finset.card_le_card (Finset.subset_biUnion_of_mem B hi)
    · simp [Finset.not_nonempty_iff_eq_empty.mp ht]
  obtain ⟨f,hf,mem⟩ := (Finset.all_card_le_biUnion_card_iff_existsInjective' B).mp hall
  exact ⟨f,hf,fun i=>sub i (mem i)⟩

theorem main : H1 → H2 → OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H3_R1_H1_R1_H3_R1_H2_R1_H1_R1.H1 := by
  intro basis places D _ _ E _ _
  dsimp only
  intro hp hmu B
  letI : NumberField E:=NumberField.of_module_finite D E
  let p:=Module.finrank D E
  let V:=HeightOneSpectrum (𝓞 D)
  obtain ⟨S,bs,hpS,hJ,k,hk,N,hEN,hdim,hGal,comm,exp,roots,g,order,rest,fixed⟩:=basis D E hp hmu B
  letI : FiniteDimensional D N:=hdim
  letI : IsGalois D N:=hGal
  let split(v:V):=∀t:HeightOneSpectrum (𝓞 E),t.asIdeal.LiesOver v.asIdeal → ∀a:Gal(E/D),
    HeightOneSpectrum.equivOfRingEquiv (RingOfIntegers.mapAlgEquiv a).toRingEquiv t=t → a=1
  let A (i:Fin k):Set V:={v:V|split v ∧ ∀(x:Dˣ)(z:N),z^p=algebraMap D N x.val →
    (∃y:v.adicCompletion D,y^p=(x.val:v.adicCompletion D)) → g i z=z}
  obtain ⟨f,hf,hm⟩:=choosePlaces S A (fun i=>places D E N hp hmu hEN comm exp (g i) (order i) (rest i))
  let T:=Finset.univ.image f
  have hi (i:Fin k) : f i∈T := Finset.mem_image.mpr ⟨i,Finset.mem_univ _,rfl⟩
  refine ⟨S,T,bs,?_,?_,?_,hpS,hJ,?_⟩
  · intro v hv
    obtain ⟨i,_,rfl⟩:=Finset.mem_image.mp hv
    exact (hm i).1.1
  · apply Finset.disjoint_left.mpr
    intro v hv ht
    obtain ⟨i,_,rfl⟩:=Finset.mem_image.mp ht
    exact (hm i).2 hv
  · simpa [T,Finset.card_image_of_injective _ hf] using hk
  · intro x hl
    obtain ⟨z,hz⟩:=roots x
    have hem:z.val∈E:=fixed z fun i=>(hm i).1.2 x.val z hz (hl ⟨f i,hi i⟩)
    exact ⟨⟨z.val,hem⟩,Subtype.ext (congrArg (fun a:N=>a.val) hz)⟩

end OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H3_R1_H1_R1_H3_R1_H2_R1_H1_R1_H1_R1
