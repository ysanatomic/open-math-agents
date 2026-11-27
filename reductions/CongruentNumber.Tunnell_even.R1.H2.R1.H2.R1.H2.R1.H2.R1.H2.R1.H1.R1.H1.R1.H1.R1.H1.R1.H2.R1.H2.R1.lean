import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H1_R1_H2_R1
import Mathlib

/-! Local reciprocity follows from abstract norm reciprocity, the residue degree and valuation, cyclic Tate cohomology, and equivariant realization on intermediate fields. -/
namespace OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H1_R1_H2_R1_H2_R1
open NumberField IsDedekindDomain
open scoped NumberField Classical

def H1 : Prop :=
  ∀ (G : Type) [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    [T2Space G] [TotallyDisconnectedSpace G] (A : Rep ℤ G),
  let S := ClosedSubgroup G
  let T : S := ⟨⊤, isClosed_univ⟩
  let U := fun H : S => H.toSubgroup
  letI : Module ℤ A.V := A.hV2
  let B := fun H : S => (Representation.invariants (A.ρ.comp (U H).subtype)).toAddSubgroup
  let M := fun H J : S => (U J).subgroupOf (U H)
  let N := fun (H J : S) (a : A.V) =>
    ∃ b : B J, ∑ᶠ q : U H ⧸ M H J, A.ρ q.out.val b.val = a
  let R := ∀ n : ℕ+, ZMod (n : ℕ)
  let Z := (Int.castRingHom R).range.topologicalClosure
  ∀ (d : G →* Multiplicative Z) (v : B T →+ Z),
  Continuous d → Function.Surjective d →
  (∀ m : ℤ, (m : Z) ∈ v.range) →
  (∀ (n : ℕ+) (x : B T), (v x).val n = 0 → ∃ y : B T, (n : ℕ) • v y = v x) →
  (∀ (H : S) [(U H).FiniteIndex] (z : Z),
    (∃ a : B T, N T H a ∧ v a = z) ↔ ∃ a, ((U H).map d).index • v a = z) →
  (∀ (H J : S) [(U H).FiniteIndex], J ≤ H → ∀ [(M H J).Normal] [Fintype (U H ⧸ M H J)]
    [IsCyclic (U H ⧸ M H J)],
    let P := (Rep.res (U H).subtype A).quotientToInvariants (M H J)
    Nat.card (tateCohomology P 0) = Nat.card (U H ⧸ M H J) ∧
      Subsingleton (tateCohomology P (-1))) →
  ∀ (H J : S) [(U H).FiniteIndex], J ≤ H → ∀ [(M H J).Normal] [Fintype (U H ⧸ M H J)]
    [IsMulCommutative (U H ⧸ M H J)],
    let Q := U H ⧸ M H J
    ∃ f : B H →+ Additive Q, Function.Surjective f ∧
      (∀ a, f a = 0 ↔ N H J a) ∧
      ∀ s : G, (U H).map (MulAut.conj s) = U H → (U J).map (MulAut.conj s) = U J →
        ∀ (x y : B H) (a b : U H), y.val = A.ρ s x.val → b.val = s * a.val * s⁻¹ →
        f x = Additive.ofMul (a : Q) → f y = Additive.ofMul (b : Q)

def H2 : Prop :=
  ∀ (p : HeightOneSpectrum (𝓞 ℚ)), let k := p.adicCompletion ℚ
  let Ω := SeparableClosure k
  let A := Rep.ofAlgebraAutOnUnits k Ω
  let G := Gal(Ω/k)
  let S := ClosedSubgroup G
  let T : S := ⟨⊤, isClosed_univ⟩
  let U := fun H : S => H.toSubgroup
  letI : Module ℤ A.V := A.hV2
  let B := fun H : S => (Representation.invariants (A.ρ.comp (U H).subtype)).toAddSubgroup
  let R := ∀ n : ℕ+, ZMod (n : ℕ)
  let Z := (Int.castRingHom R).range.topologicalClosure
  ∃ (d : G →* Multiplicative Z) (v : B T →+ Z), Continuous d ∧ Function.Surjective d ∧
    (∀ m : ℤ, (m : Z) ∈ v.range) ∧
    (∀ (n : ℕ+) (x : B T), (v x).val n = 0 → ∃ y : B T, (n : ℕ) • v y = v x) ∧
    ∀ (H : S) [(U H).FiniteIndex] (z : Z),
      (∃ a : B T, (∃ b : B H, ∑ᶠ q : U T ⧸ (U H).subgroupOf (U T), A.ρ q.out.val b.val = a.val) ∧ v a = z) ↔
      ∃ a, ((U H).map d).index • v a = z

def H3 : Prop :=
  (∀ (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (L : Type) [Field L] [Algebra K L] [FiniteDimensional K L]
    (Y : Type) [Field Y] [Algebra L Y] [FiniteDimensional L Y] [IsGalois L Y] [IsCyclic Gal(Y/L)],
    Nat.card (Lˣ ⧸ (Units.map (Algebra.norm L (S := Y))).range) = Module.finrank L Y) →
  ∀ (p : HeightOneSpectrum (𝓞 ℚ)), let k := p.adicCompletion ℚ
  let Ω := SeparableClosure k
  let A := Rep.ofAlgebraAutOnUnits k Ω
  let S := ClosedSubgroup Gal(Ω/k)
  let U := fun H : S => H.toSubgroup
  ∀ (H J : S) [(U H).FiniteIndex], J ≤ H → ∀ [((U J).subgroupOf (U H)).Normal]
    [Fintype (U H ⧸ (U J).subgroupOf (U H))] [IsCyclic (U H ⧸ (U J).subgroupOf (U H))],
    let P := (Rep.res (U H).subtype A).quotientToInvariants ((U J).subgroupOf (U H))
    Nat.card (tateCohomology P 0) = Nat.card (U H ⧸ (U J).subgroupOf (U H)) ∧
      Subsingleton (tateCohomology P (-1))

def H4 : Prop :=
  ∀ (p : HeightOneSpectrum (𝓞 ℚ)), let k := p.adicCompletion ℚ
  let Ω := SeparableClosure k
  let A := Rep.ofAlgebraAutOnUnits k Ω
  let G := Gal(Ω/k)
  let S := ClosedSubgroup G
  let U := fun H : S => H.toSubgroup
  letI : Module ℤ A.V := A.hV2
  let B := fun H : S => (Representation.invariants (A.ρ.comp (U H).subtype)).toAddSubgroup
  let M := fun H J : S => (U J).subgroupOf (U H)
  (∀ (H J : S) [(U H).FiniteIndex], J ≤ H → ∀ [(M H J).Normal] [Fintype (U H ⧸ M H J)]
    [IsMulCommutative (U H ⧸ M H J)], let Q := U H ⧸ M H J
    ∃ f : B H →+ Additive Q, Function.Surjective f ∧
      (∀ a, f a = 0 ↔ ∃ b : B J, ∑ᶠ q : Q, A.ρ q.out.val b.val = a.val) ∧
      ∀ s : G, (U H).map (MulAut.conj s) = U H → (U J).map (MulAut.conj s) = U J →
        ∀ (x y : B H) (a b : U H), y.val = A.ρ s x.val → b.val = s * a.val * s⁻¹ →
        f x = Additive.ofMul (a : Q) → f y = Additive.ofMul (b : Q)) →
  ∀ (L Y : Type) [Field L] [Algebra k L] [FiniteDimensional k L]
    [Field Y] [Algebra L Y] [FiniteDimensional L Y] [IsAbelianGalois L Y]
    [Algebra k Y] [IsScalarTower k L Y],
    ∃ f : Lˣ →* Gal(Y/L), Function.Surjective f ∧
      f.ker = (Units.map (Algebra.norm L (S := Y))).range ∧
      ∀ (d : Gal(L/k)) (s : Gal(Y/k)), (∀ z : L, s (algebraMap L Y z) = algebraMap L Y (d z)) →
        ∀ (u : Lˣ) (z : Y), s (f u z) = f (Units.map d.toMonoidHom u) (s z)

theorem main : H1 → H2 → H3 → H4 → OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H1_R1_H2_R1.H2 := by
  intro core values tate field index p
  obtain ⟨d,v,hd,sd,vi,divides,norms⟩ := values p
  exact field p (core _ _ d v hd sd vi divides norms (tate index p))

end OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H1_R1_H2_R1_H2_R1
