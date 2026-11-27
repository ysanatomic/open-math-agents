import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H1_R1_H2_R1_H2_R1
import Mathlib

/-! The abelian reciprocity map from automorphisms to norm classes is an isomorphism once it is injective and the norm index divides the relative degree. -/
namespace OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H1_R1_H2_R1_H2_R1_H1_R1
open scoped Classical IsMulCommutative

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
    ∀ W : AddSubgroup (B H), (∀ x, x ∈ W ↔ N H J x.val) →
    ∃ j : Additive Q →+ B H ⧸ W, Function.Injective j ∧
      ∀ s : G, (U H).map (MulAut.conj s) = U H → (U J).map (MulAut.conj s) = U J →
        ∀ (x y : B H) (a b : U H), y.val = A.ρ s x.val → b.val = s * a.val * s⁻¹ →
        j (Additive.ofMul (a : Q)) = x → j (Additive.ofMul (b : Q)) = y

def H2 : Prop :=
  ∀ (G : Type) [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    [T2Space G] [TotallyDisconnectedSpace G] (A : Rep ℤ G),
  let S := ClosedSubgroup G
  let U := fun H : S => H.toSubgroup
  letI : Module ℤ A.V := A.hV2
  let B := fun H : S => (Representation.invariants (A.ρ.comp (U H).subtype)).toAddSubgroup
  let M := fun H J : S => (U J).subgroupOf (U H)
  (∀ (H J : S) [(U H).FiniteIndex], J ≤ H → ∀ [(M H J).Normal] [Fintype (U H ⧸ M H J)]
    [IsCyclic (U H ⧸ M H J)], let P := (Rep.res (U H).subtype A).quotientToInvariants (M H J)
    Nat.card (tateCohomology P 0) = Nat.card (U H ⧸ M H J) ∧ Subsingleton (tateCohomology P (-1))) →
  ∀ (H J : S) [(U H).FiniteIndex], J ≤ H → ∀ [(M H J).Normal] [Fintype (U H ⧸ M H J)]
    [IsMulCommutative (U H ⧸ M H J)], let Q := U H ⧸ M H J
    ∃ W : AddSubgroup (B H), (∀ x, x ∈ W ↔ ∃ b : B J, ∑ᶠ q : Q, A.ρ q.out.val b.val = x.val) ∧
      W.index ∣ Nat.card Q

theorem main : H1 → H2 → OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H1_R1_H2_R1_H2_R1.H1 := by
  intro injective bound
  intro G _ _ _ _ _ _ A
  dsimp only
  intro d v hd hs vi vd vr cf H J hH hJ hnorm hfin hcomm
  let U := fun K : ClosedSubgroup G => K.toSubgroup
  letI : Module ℤ A.V := A.hV2
  let B := fun K : ClosedSubgroup G => (Representation.invariants (A.ρ.comp (U K).subtype)).toAddSubgroup
  let Q := U H ⧸ (U J).subgroupOf (U H)
  obtain ⟨W,hW,dvd⟩ := bound G A cf H J hJ
  obtain ⟨j,hj,conj⟩ := injective G A d v hd hs vi vd vr cf H J hJ W hW
  have hp : 0 < Nat.card Q := Nat.card_pos
  haveI : Finite (B H ⧸ W) := Nat.finite_of_card_ne_zero (ne_zero_of_dvd_ne_zero hp.ne' dvd)
  have hle : Nat.card (B H ⧸ W) ≤ Nat.card (Additive Q) := Nat.le_of_dvd hp dvd
  let e := AddEquiv.ofBijective j (hj.bijective_of_nat_card_le hle)
  let f := e.symm.toAddMonoidHom.comp (QuotientAddGroup.mk' W)
  refine ⟨f,e.symm.surjective.comp (QuotientAddGroup.mk'_surjective W),?_,?_⟩
  · intro x
    change e.symm (QuotientAddGroup.mk x) = 0 ↔ _
    rw [e.symm.map_eq_zero_iff,QuotientAddGroup.eq_zero_iff]
    exact hW x
  · intro s hH hJ x y a b hy hb hx
    have hax : j (Additive.ofMul (a : Q)) = QuotientAddGroup.mk x := by
      exact ((congrArg e hx).symm.trans (e.apply_symm_apply _))
    exact (congrArg e.symm (conj s hH hJ x y a b hy hb hax)).symm.trans (e.symm_apply_apply _)

end OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H1_R1_H2_R1_H2_R1_H1_R1
