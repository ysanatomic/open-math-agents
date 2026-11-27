import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1_H2_R1
import Mathlib

/-! The local order of a norm gives a cyclotomic obstruction for an unsplit prime-degree extension. Prime-degree layers then detect a general cyclic norm. -/
namespace OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1_H2_R1_H1_R1
open NumberField IsDedekindDomain
open scoped NumberField TensorProduct IsMulCommutative

def H1 : Prop :=
  ∀ (E : Type) [Field E] [NumberField E] (t : HeightOneSpectrum (𝓞 E)) (v : HeightOneSpectrum (𝓞 ℚ)),
    t.asIdeal.LiesOver v.asIdeal → ∀ (f : v.adicCompletion ℚ →+* t.adicCompletion E), Continuous f →
    letI : Algebra (v.adicCompletion ℚ) (t.adicCompletion E) := f.toAlgebra
    ∀ y : (t.adicCompletion E)ˣ, WithZero.log (Valued.v (Algebra.norm (v.adicCompletion ℚ) y.val)) =
      (t.asIdeal.inertiaDeg (𝓞 ℚ) : ℤ) * WithZero.log (Valued.v y.val)

def H2 : Prop :=
  (∀ (D M:Type) [Field D] [NumberField D] [Field M] [NumberField M] [Algebra D M]
  [FiniteDimensional D M] [IsAbelianGalois D M], let A:=AdeleRing (𝓞 D) D
  let P (B:Type) [Field B] [Algebra D B] := (Units.map (algebraMap D A).toMonoidHom).range ⊔
    (Units.map (Algebra.norm A (S:=A⊗[D]B))).range
  (P M).index=Module.finrank D M ∧ ∀ E F:IntermediateField D M, E⊔F=⊤ → P M=P E ⊓ P F) → (∀ (m : ℕ), (2 < m) → ∀ (v:HeightOneSpectrum (𝓞 ℚ)) (n:ℕ),
  let A:=AdeleRing (𝓞 ℚ) ℚ
  ∀ z:Aˣ, z.val.1=1 → (∀ w:HeightOneSpectrum (𝓞 ℚ), w≠v → z.val.2 w=1) →
  v.asIdeal.absNorm.Coprime m → -WithZero.log (Valued.v (z.val.2 v))=(n:ℤ) →
  z∈(Units.map (algebraMap ℚ A).toMonoidHom).range ⊔
    (Units.map (Algebra.norm A (S:=A⊗[ℚ]CyclotomicField m ℚ))).range →
  m ∣ v.asIdeal.absNorm ^ n - 1) → (∀ (E : Type) [Field E] [NumberField E] (t : HeightOneSpectrum (𝓞 E)) (v : HeightOneSpectrum (𝓞 ℚ)),
    t.asIdeal.LiesOver v.asIdeal → ∀ (f : v.adicCompletion ℚ →+* t.adicCompletion E), Continuous f →
    letI : Algebra (v.adicCompletion ℚ) (t.adicCompletion E) := f.toAlgebra
    ∀ y : (t.adicCompletion E)ˣ, WithZero.log (Valued.v (Algebra.norm (v.adicCompletion ℚ) y.val)) =
      (t.asIdeal.inertiaDeg (𝓞 ℚ) : ℤ) * WithZero.log (Valued.v y.val)) →
  ∀ (D N:Type) [Field D] [NumberField D] [Field N] [NumberField N] [Algebra D N]
  [FiniteDimensional D N] [IsAbelianGalois D N] (v:HeightOneSpectrum (𝓞 D)),
  (Module.finrank D N).Prime → (v.asIdeal.primesOver (𝓞 N)).Subsingleton →
  let A:=AdeleRing (𝓞 D) D
  ∃ z:Aˣ, z.val.1=1 ∧ (∀ w:HeightOneSpectrum (𝓞 D), w≠v → z.val.2 w=1) ∧
    z∉(Units.map (algebraMap D A).toMonoidHom).range ⊔ (Units.map (Algebra.norm A (S:=A⊗[D]N))).range

def H3 : Prop :=
  (∀ (D M:Type) [Field D] [NumberField D] [Field M] [NumberField M] [Algebra D M]
  [FiniteDimensional D M] [IsAbelianGalois D M], let A:=AdeleRing (𝓞 D) D
  let P (B:Type) [Field B] [Algebra D B] := (Units.map (algebraMap D A).toMonoidHom).range ⊔
    (Units.map (Algebra.norm A (S:=A⊗[D]B))).range
  (P M).index=Module.finrank D M) → (∀ (F : Type) [Field F] [NumberField F] (w : HeightOneSpectrum (𝓞 F)), let k := w.adicCompletion F
  ∀ (Y : Type) [Field Y] [Algebra k Y] [FiniteDimensional k Y] [IsGalois k Y] [IsCyclic Gal(Y/k)],
    (Units.map (Algebra.norm k (S := Y))).range.index = Module.finrank k Y) → (∀ (D N:Type) [Field D] [NumberField D] [Field N] [NumberField N] [Algebra D N]
  [FiniteDimensional D N] [IsAbelianGalois D N] (v:HeightOneSpectrum (𝓞 D)),
  (Module.finrank D N).Prime → (v.asIdeal.primesOver (𝓞 N)).Subsingleton →
  let A:=AdeleRing (𝓞 D) D
  ∃ z:Aˣ, z.val.1=1 ∧ (∀ w:HeightOneSpectrum (𝓞 D), w≠v → z.val.2 w=1) ∧
    z∉(Units.map (algebraMap D A).toMonoidHom).range ⊔ (Units.map (Algebra.norm A (S:=A⊗[D]N))).range) →
  ∀(D N:Type)[Field D][NumberField D][Field N][NumberField N][Algebra D N]
    [FiniteDimensional D N][IsGalois D N][IsCyclic Gal(N/D)](v:HeightOneSpectrum (𝓞 D)),
  let A:=AdeleRing (𝓞 D) D
  let P:=(Units.map (algebraMap D A).toMonoidHom).range ⊔ (Units.map (Algebra.norm A (S:=A⊗[D]N))).range
  let V:=v.adicCompletion D
  ∀(x:Vˣ)(z:Aˣ),z.val.1=1 → z.val.2 v=x.val → (∀ w:HeightOneSpectrum (𝓞 D),w≠v → z.val.2 w=1) →
    z∈P → x∈(Units.map (Algebra.norm V (S:=V⊗[D]N))).range

theorem main : H1 → H2 → H3 → OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1_H2_R1.H1 := by
  intro valuation prime induction lattice rational localIndex
  apply induction _ localIndex (prime lattice rational valuation)
  intro D N _ _ _ _ _ _ _
  exact (lattice D N).1

end OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1_H2_R1_H1_R1
