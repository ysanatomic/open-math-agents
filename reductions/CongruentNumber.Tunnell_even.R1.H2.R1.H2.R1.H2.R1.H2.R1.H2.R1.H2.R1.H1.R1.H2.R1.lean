import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1
import Mathlib

/-! A local unit embeds in the ideles at its place. Project to the global norm quotient and use its Galois presentation. The one-place kernel identifies local norms, and the principal product descends through the isomorphism. -/
namespace OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1
open NumberField IsDedekindDomain
open scoped NumberField Classical TensorProduct IsMulCommutative

def H1 : Prop :=
  (∀(D N:Type)[Field D][NumberField D][Field N][NumberField N][Algebra D N]
   [FiniteDimensional D N][IsGalois D N](g:Gal(N/D)),(∀ s,s∈Subgroup.zpowers g) →
   let A:=AdeleRing (𝓞 D) D
   let T:=A⊗[D]N
   let P:=(Units.map (algebraMap D A).toMonoidHom).range ⊔ (Units.map (Algebra.norm A (S:=T))).range
   let q:=QuotientGroup.mk' (Units.map (Algebra.TensorProduct.includeRight (R:=D) (A:=A) (B:=N)).toMonoidHom).range
   let a(s:Gal(N/D)):=Units.mapEquiv (Algebra.TensorProduct.congr (AlgEquiv.refl (R:=A) (A₁:=A)) s).toMulEquiv
   P.index=Module.finrank D N ∧ ∀ z:Tˣ,(∏ s:Gal(N/D),q (a s z))=1 → ∃ y:Tˣ,q (a g y / y)=q z) →
  ∀ (D N:Type) [Field D] [NumberField D] [Field N] [NumberField N] [Algebra D N]
    [FiniteDimensional D N] [IsAbelianGalois D N],
  let A := AdeleRing (𝓞 D) D
  let P := (Units.map (algebraMap D A).toMonoidHom).range ⊔ (Units.map (Algebra.norm A (S:=A ⊗[D] N))).range
  Nonempty ((Aˣ ⧸ P) ≃* Gal(N/D))

def H2 : Prop :=
  (∀(D N:Type)[Field D][NumberField D][Field N][NumberField N][Algebra D N]
   [FiniteDimensional D N][IsGalois D N](g:Gal(N/D)),(∀ s,s∈Subgroup.zpowers g) →
   let A:=AdeleRing (𝓞 D) D
   let T:=A⊗[D]N
   let P:=(Units.map (algebraMap D A).toMonoidHom).range ⊔ (Units.map (Algebra.norm A (S:=T))).range
   let q:=QuotientGroup.mk' (Units.map (Algebra.TensorProduct.includeRight (R:=D) (A:=A) (B:=N)).toMonoidHom).range
   let a(s:Gal(N/D)):=Units.mapEquiv (Algebra.TensorProduct.congr (AlgEquiv.refl (R:=A) (A₁:=A)) s).toMulEquiv
   P.index=Module.finrank D N ∧ ∀ z:Tˣ,(∏ s:Gal(N/D),q (a s z))=1 → ∃ y:Tˣ,q (a g y / y)=q z) →
  ∀ (D N:Type) [Field D] [NumberField D] [Field N] [NumberField N] [Algebra D N]
    [FiniteDimensional D N] [IsAbelianGalois D N] (v : HeightOneSpectrum (𝓞 D)),
  let A := AdeleRing (𝓞 D) D
  let P := (Units.map (algebraMap D A).toMonoidHom).range ⊔ (Units.map (Algebra.norm A (S:=A ⊗[D] N))).range
  let V := v.adicCompletion D
  ∃ t:HeightOneSpectrum (𝓞 N), t.asIdeal.LiesOver v.asIdeal ∧ ∃ f:V→+*t.adicCompletion N,
    Continuous f ∧ (∀ c:D,f (c:V)=((algebraMap D N c:N):t.adicCompletion N)) ∧
    letI : Algebra V (t.adicCompletion N):=f.toAlgebra
    ∀ (x:Vˣ) (z:Aˣ),z.val.1=1 → z.val.2 v=x.val →
      (∀ w:HeightOneSpectrum (𝓞 D),w≠v → z.val.2 w=1) →
      (z∈P ↔ ∃ y:(t.adicCompletion N)ˣ,Algebra.norm V (y:t.adicCompletion N)=x.val)

def H3 : Prop :=
  ∀ (D N:Type) [Field D] [NumberField D] [Field N] [NumberField N] [Algebra D N]
    [FiniteDimensional D N] [IsAbelianGalois D N],(∀ i:InfinitePlace D,i.IsComplex) →
  let A := AdeleRing (𝓞 D) D
  let P := (Units.map (algebraMap D A).toMonoidHom).range ⊔ (Units.map (Algebra.norm A (S:=A ⊗[D] N))).range
  ∀ j : ∀ v:HeightOneSpectrum (𝓞 D),(v.adicCompletion D)ˣ →* Aˣ,
    (∀ v x,(j v x).val.1=1 ∧ (j v x).val.2 v=x.val ∧
      ∀ w:HeightOneSpectrum (𝓞 D), w≠v → (j v x).val.2 w=1) →
    ∀ x:Dˣ, ∏ᶠ v, QuotientGroup.mk' P (j v (Units.map (algebraMap D (v.adicCompletion D)).toMonoidHom x))=1

theorem main : H1 → H2 → H3 → OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1.H2 := by
  intro makeGroup makeKernel product classes
  have group:=makeGroup classes
  have localKer:=makeKernel classes
  classical
  intro D N _ _ _ _ _ _ _ hc
  obtain ⟨e⟩ := group D N
  let A := AdeleRing (𝓞 D) D
  let P := (Units.map (algebraMap D A).toMonoidHom).range ⊔ (Units.map (Algebra.norm A (S:=A ⊗[D] N))).range
  let q := QuotientGroup.mk' P
  let place (v:HeightOneSpectrum (𝓞 D)) : v.adicCompletion D →* A :=
    { toFun := fun x => (1,RestrictedProduct.mulSingle (fun w:HeightOneSpectrum (𝓞 D)=>w.adicCompletionIntegers D) v x)
      map_one' := Prod.ext rfl (RestrictedProduct.mulSingle_one _ _)
      map_mul' := fun x y=>Prod.ext (one_mul _).symm (RestrictedProduct.mulSingle_mul _ _ _ _) }
  let j (v:HeightOneSpectrum (𝓞 D)) := Units.map (place v)
  have supp (v:HeightOneSpectrum (𝓞 D)) (x:(v.adicCompletion D)ˣ) :
      (j v x).val.1=1 ∧ (j v x).val.2 v=x.val ∧ ∀ w:HeightOneSpectrum (𝓞 D),w≠v → (j v x).val.2 w=1 :=
    ⟨rfl,RestrictedProduct.mulSingle_eq_same _ v x.val,fun _ h=>RestrictedProduct.mulSingle_eq_of_ne _ x.val h⟩
  let σ (v:HeightOneSpectrum (𝓞 D)) := e.toMonoidHom.comp (q.comp (j v))
  refine ⟨σ,?_,?_⟩
  · intro x
    have h:=product D N hc j supp x
    let a (v:HeightOneSpectrum (𝓞 D)) : Aˣ ⧸ P := q (j v (Units.map (algebraMap D (v.adicCompletion D)).toMonoidHom x))
    let E : (Aˣ ⧸ P) ≃* Gal(N/D) := e
    change (∏ᶠ v,E (a v))=1
    rw [← MulEquiv.map_finprod E a,show (∏ᶠ v,a v)=1 from h,map_one]
  · intro v
    obtain ⟨t,ht,f,hf,hc',hk⟩:=localKer D N v
    refine ⟨t,ht,f,hf,hc',?_⟩
    intro x
    obtain ⟨h1,h2,h3⟩:=supp v x
    change e (q (j v x))=1 ↔ _
    exact (map_eq_one_iff e e.injective).trans ((QuotientGroup.eq_one_iff _).trans (hk x (j v x) h1 h2 h3))

end OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1
