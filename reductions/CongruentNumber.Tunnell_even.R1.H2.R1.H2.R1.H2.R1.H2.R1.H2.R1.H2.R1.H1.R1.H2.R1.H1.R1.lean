import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1
import Mathlib

/-! Over the rationals, the procyclic degree and the idele valuation have the same norm images. The abstract class field theorem applied to these data gives the Galois presentation of the norm quotient. -/
namespace OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1_H1_R1
open NumberField IsDedekindDomain
open scoped NumberField Classical TensorProduct IsMulCommutative

def H1 : Prop :=
  (let R := ∀ n:ℕ+,ZMod (n:ℕ)
  let Z := (Int.castRingHom R).range.topologicalClosure
  let Ω := SeparableClosure ℚ
  let A := AdeleRing (𝓞 ℚ) ℚ
  ∃ d : Gal(Ω/ℚ) →* Multiplicative Z, Continuous d ∧ Function.Surjective d ∧
  ∃ v : Aˣ →* Multiplicative Z, Function.Surjective v ∧
    (∀ x:ℚˣ,v (Units.map (algebraMap ℚ A).toMonoidHom x)=1) ∧
    ∀ H:ClosedSubgroup Gal(Ω/ℚ), H.toSubgroup.FiniteIndex →
      let F := IntermediateField.fixedField H.toSubgroup
      (v.comp (Units.map (Algebra.norm A (S:=A ⊗[ℚ] F)))).range=H.toSubgroup.map d) ∧ (∀ (m : ℕ), (2 < m) → ∀ (v:HeightOneSpectrum (𝓞 ℚ)) (n:ℕ),
  let A:=AdeleRing (𝓞 ℚ) ℚ
  ∀ z:Aˣ, z.val.1=1 → (∀ w:HeightOneSpectrum (𝓞 ℚ), w≠v → z.val.2 w=1) →
  v.asIdeal.absNorm.Coprime m → -WithZero.log (Valued.v (z.val.2 v))=(n:ℤ) →
  z∈(Units.map (algebraMap ℚ A).toMonoidHom).range ⊔
    (Units.map (Algebra.norm A (S:=A⊗[ℚ]CyclotomicField m ℚ))).range →
  m ∣ v.asIdeal.absNorm ^ n - 1)


def H2 : Prop :=
  (let R := ∀ n:ℕ+,ZMod (n:ℕ)
  let Z := (Int.castRingHom R).range.topologicalClosure
  let Ω := SeparableClosure ℚ
  let A := AdeleRing (𝓞 ℚ) ℚ
  ∃ d : Gal(Ω/ℚ) →* Multiplicative Z, Continuous d ∧ Function.Surjective d ∧
  ∃ v : Aˣ →* Multiplicative Z, Function.Surjective v ∧
    (∀ x:ℚˣ,v (Units.map (algebraMap ℚ A).toMonoidHom x)=1) ∧
    ∀ H:ClosedSubgroup Gal(Ω/ℚ), H.toSubgroup.FiniteIndex →
      let F := IntermediateField.fixedField H.toSubgroup
      (v.comp (Units.map (Algebra.norm A (S:=A ⊗[ℚ] F)))).range=H.toSubgroup.map d) →
  (∀(D N:Type)[Field D][NumberField D][Field N][NumberField N][Algebra D N]
   [FiniteDimensional D N][IsGalois D N](g:Gal(N/D)),(∀ s,s∈Subgroup.zpowers g) →
   let A:=AdeleRing (𝓞 D) D
   let T:=A⊗[D]N
   let P:=(Units.map (algebraMap D A).toMonoidHom).range ⊔ (Units.map (Algebra.norm A (S:=T))).range
   let q:=QuotientGroup.mk' (Units.map (Algebra.TensorProduct.includeRight (R:=D) (A:=A) (B:=N)).toMonoidHom).range
   let a(s:Gal(N/D)):=Units.mapEquiv (Algebra.TensorProduct.congr (AlgEquiv.refl (R:=A) (A₁:=A)) s).toMulEquiv
   P.index=Module.finrank D N ∧ ∀ z:Tˣ,(∏ s:Gal(N/D),q (a s z))=1 → ∃ y:Tˣ,q (a g y / y)=q z) →
  ∀ (D M:Type) [Field D] [NumberField D] [Field M] [NumberField M] [Algebra D M]
  [FiniteDimensional D M] [IsAbelianGalois D M], let A:=AdeleRing (𝓞 D) D
  let P (B:Type) [Field B] [Algebra D B] := (Units.map (algebraMap D A).toMonoidHom).range ⊔
    (Units.map (Algebra.norm A (S:=A⊗[D]B))).range
  Nonempty ((Aˣ ⧸ P M) ≃* Gal(M/D)) ∧ (P M).index=Module.finrank D M ∧ ∀ E F:IntermediateField D M, E⊔F=⊤ → P M=P E ⊓ P F


theorem main : H1 → H2 → OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1.H1 := fun values reciprocity classes => ⟨reciprocity values.1 classes,values.2⟩

end OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1_H1_R1
