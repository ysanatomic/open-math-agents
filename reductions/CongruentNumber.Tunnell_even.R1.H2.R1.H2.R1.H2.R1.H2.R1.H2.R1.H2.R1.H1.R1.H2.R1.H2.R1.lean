import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1
import Mathlib

/-! At a finite place, restrict a global norm class to each cyclic subextension. Cyclic detection then recovers the full local norm. A local tensor norm extends to a supported adelic norm. -/
namespace OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1_H2_R1
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
  ∀(D N:Type)[Field D][NumberField D][Field N][NumberField N][Algebra D N]
    [FiniteDimensional D N][IsGalois D N][IsCyclic Gal(N/D)](v:HeightOneSpectrum (𝓞 D)),
  let A:=AdeleRing (𝓞 D) D
  let P:=(Units.map (algebraMap D A).toMonoidHom).range ⊔ (Units.map (Algebra.norm A (S:=A⊗[D]N))).range
  let V:=v.adicCompletion D
  ∀(x:Vˣ)(z:Aˣ),z.val.1=1 → z.val.2 v=x.val → (∀ w:HeightOneSpectrum (𝓞 D),w≠v → z.val.2 w=1) →
    z∈P → x∈(Units.map (Algebra.norm V (S:=V⊗[D]N))).range

def H2 : Prop :=
  ∀(D N:Type)[Field D][NumberField D][Field N][NumberField N][Algebra D N]
    [FiniteDimensional D N][IsAbelianGalois D N](v:HeightOneSpectrum (𝓞 D)),
  let V:=v.adicCompletion D
  ∀ x:Vˣ,(∀ (E:IntermediateField D N),IsCyclic Gal(E/D) →
    x∈(Units.map (Algebra.norm V (S:=V⊗[D]E))).range) →
    x∈(Units.map (Algebra.norm V (S:=V⊗[D]N))).range

def H3 : Prop :=
  (∀(D N:Type)[Field D][NumberField D][Field N][NumberField N][Algebra D N]
    [FiniteDimensional D N][IsGalois D N][IsCyclic Gal(N/D)](v:HeightOneSpectrum (𝓞 D)),
  let A:=AdeleRing (𝓞 D) D
  let P:=(Units.map (algebraMap D A).toMonoidHom).range ⊔ (Units.map (Algebra.norm A (S:=A⊗[D]N))).range
  let V:=v.adicCompletion D
  ∀(x:Vˣ)(z:Aˣ),z.val.1=1 → z.val.2 v=x.val → (∀ w:HeightOneSpectrum (𝓞 D),w≠v → z.val.2 w=1) →
    z∈P → x∈(Units.map (Algebra.norm V (S:=V⊗[D]N))).range) →
  (∀(D N:Type)[Field D][NumberField D][Field N][NumberField N][Algebra D N]
    [FiniteDimensional D N][IsAbelianGalois D N](v:HeightOneSpectrum (𝓞 D)),
  let V:=v.adicCompletion D
  ∀ x:Vˣ,(∀ (E:IntermediateField D N),IsCyclic Gal(E/D) →
    x∈(Units.map (Algebra.norm V (S:=V⊗[D]E))).range) →
    x∈(Units.map (Algebra.norm V (S:=V⊗[D]N))).range) →
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

theorem main : H1 → H2 → H3 → OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1.H2 := fun makeCyclic detect assemble classes => assemble (makeCyclic classes) detect

end OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1_H2_R1
