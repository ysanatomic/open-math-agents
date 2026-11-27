import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1
import Mathlib

/-! For a cyclic extension the adelic norm index and the norm-one classes give the class formation. Its finite-place reciprocity maps satisfy the product formula on principal elements. Restrict these maps to global integral units. -/
namespace OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1
open NumberField IsDedekindDomain
open scoped NumberField Classical TensorProduct IsMulCommutative

def H1 : Prop :=
  ∀(D N:Type)[Field D][NumberField D][Field N][NumberField N][Algebra D N]
   [FiniteDimensional D N][IsGalois D N](g:Gal(N/D)),(∀ s,s∈Subgroup.zpowers g) →
   let A:=AdeleRing (𝓞 D) D
   let T:=A⊗[D]N
   let P:=(Units.map (algebraMap D A).toMonoidHom).range ⊔ (Units.map (Algebra.norm A (S:=T))).range
   let q:=QuotientGroup.mk' (Units.map (Algebra.TensorProduct.includeRight (R:=D) (A:=A) (B:=N)).toMonoidHom).range
   let a(s:Gal(N/D)):=Units.mapEquiv (Algebra.TensorProduct.congr (AlgEquiv.refl (R:=A) (A₁:=A)) s).toMulEquiv
   P.index=Module.finrank D N ∧ ∀ z:Tˣ,(∏ s:Gal(N/D),q (a s z))=1 → ∃ y:Tˣ,q (a g y / y)=q z

def H2 : Prop :=
  (∀(D N:Type)[Field D][NumberField D][Field N][NumberField N][Algebra D N]
   [FiniteDimensional D N][IsGalois D N](g:Gal(N/D)),(∀ s,s∈Subgroup.zpowers g) →
   let A:=AdeleRing (𝓞 D) D
   let T:=A⊗[D]N
   let P:=(Units.map (algebraMap D A).toMonoidHom).range ⊔ (Units.map (Algebra.norm A (S:=T))).range
   let q:=QuotientGroup.mk' (Units.map (Algebra.TensorProduct.includeRight (R:=D) (A:=A) (B:=N)).toMonoidHom).range
   let a(s:Gal(N/D)):=Units.mapEquiv (Algebra.TensorProduct.congr (AlgEquiv.refl (R:=A) (A₁:=A)) s).toMulEquiv
   P.index=Module.finrank D N ∧ ∀ z:Tˣ,(∏ s:Gal(N/D),q (a s z))=1 → ∃ y:Tˣ,q (a g y / y)=q z) →
  ∀(D N:Type)[Field D][NumberField D][Field N][NumberField N][Algebra D N]
   [FiniteDimensional D N][IsAbelianGalois D N],(∀ i:InfinitePlace D,i.IsComplex) →
   ∃ σ : ∀ v:HeightOneSpectrum (𝓞 D),(v.adicCompletion D)ˣ →* Gal(N/D),
    (∀ x:Dˣ, ∏ᶠ v,σ v (Units.map (algebraMap D (v.adicCompletion D)).toMonoidHom x)=1) ∧
    ∀ v:HeightOneSpectrum (𝓞 D),let V:=v.adicCompletion D
     ∃ t:HeightOneSpectrum (𝓞 N),t.asIdeal.LiesOver v.asIdeal ∧ ∃ f:V→+*t.adicCompletion N,
      Continuous f ∧ (∀ c:D,f (c:V)=((algebraMap D N c:N):t.adicCompletion N)) ∧
      letI : Algebra V (t.adicCompletion N):=f.toAlgebra
      ∀ x:Vˣ, σ v x=1 ↔ ∃ y:(t.adicCompletion N)ˣ,Algebra.norm V (y:t.adicCompletion N)=x.val

theorem main : H1 → H2 → OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1.H1 := by
  intro classes build
  obtain product := build classes
  intro D N _ _ _ _ _ _ _ complex
  obtain ⟨σ,hprod,hnorm⟩ := product D N complex
  let x (u:(𝓞 D)ˣ) := Units.map (algebraMap (𝓞 D) D).toMonoidHom u
  let loc (v:HeightOneSpectrum (𝓞 D)) (u:(𝓞 D)ˣ) :=
    Units.map (algebraMap D (v.adicCompletion D)).toMonoidHom (x u)
  refine ⟨fun v u => σ v (loc v u),fun u => hprod (x u),?_⟩
  intro v
  obtain ⟨t,ht,f,hf,hc,hk⟩ := hnorm v
  exact ⟨t,ht,f,hf,hc,fun u=>hk (loc v u)⟩

end OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1
