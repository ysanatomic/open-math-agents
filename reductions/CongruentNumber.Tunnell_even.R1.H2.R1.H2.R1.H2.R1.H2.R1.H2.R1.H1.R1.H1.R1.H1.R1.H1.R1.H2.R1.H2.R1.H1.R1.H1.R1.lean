import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H1_R1_H2_R1_H2_R1_H1_R1
import Mathlib

/-! Frobenius evaluations on prime elements determine a reciprocity map. Cyclic nondegeneracy and descent to abelian quotients give injectivity and covariance under the normalizer. -/
namespace OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H1_R1_H2_R1_H2_R1_H1_R1_H1_R1
open scoped Classical

def H1 : Prop :=
  ∀ (G : ProfiniteGrp) (A : Rep ℤ G),
  let S := ClosedSubgroup G
  let U := fun H : S => H.toSubgroup
  let T : S := ⟨⊤,isClosed_univ⟩
  let M := fun H J : S => (U J).subgroupOf (U H)
  letI : Module ℤ A.V := A.hV2
  let B := fun H : S => (Representation.invariants (A.ρ.comp (U H).subtype)).toAddSubgroup
  let tr := fun (H J : S) (b : A.V) => ∑ᶠ q : U H ⧸ M H J, A.ρ q.out.val b
  let Z := (Int.castRingHom (∀ n : ℕ+, ZMod (n : ℕ))).range.topologicalClosure
  ∀ (d : G →* Multiplicative Z) (v : B T →+ Z), let e := fun H : S => ((U H).map d).index
  Continuous d → Function.Surjective d → (∀ m : ℤ, (m : Z) ∈ v.range) →
  (∀ (n : ℕ+) (x : B T), (v x).val n = 0 → ∃ y : B T, (n : ℕ) • v y = v x) →
  (∀ (H : S) [(U H).FiniteIndex] (z : Z),
    (∃ (a : B T) (b : B H), tr T H b.val = a.val ∧ v a = z) ↔ ∃ a, e H • v a = z) →
  (∀ (H J : S) [(U H).FiniteIndex], J ≤ H → ∀ [(M H J).Normal] [Fintype (U H ⧸ M H J)]
    [IsCyclic (U H ⧸ M H J)], let P := (Rep.res (U H).subtype A).quotientToInvariants (M H J)
    Nat.card (tateCohomology P 0) = Nat.card (U H ⧸ M H J) ∧ Subsingleton (tateCohomology P (-1))) →
  ∀ (H J : S) [(U H).FiniteIndex], J ≤ H → ∀ [(M H J).Normal] [Fintype (U H ⧸ M H J)],
    let Q := U H ⧸ M H J
    let l := QuotientGroup.mk' (M H J ⊓ (d.comp (U H).subtype).ker)
    ∀ W : AddSubgroup (B H), (∀ x, x ∈ W ↔ ∃ b : B J, tr H J b.val = x.val) →
    ∃ r : Additive Q →+ B H ⧸ W, ∀ (t : U H) (n : ℕ+) (F : S) (b : B F) (a : B T) (x : B H),
      (d t.val).toAdd = e H • ((n : ℕ) : Z) →
      U F = (((Subgroup.zpowers (l t)).topologicalClosure.comap l).map (U H).subtype) →
      tr T F b.val = a.val → v a = (e F : Z) → tr H F b.val = x.val →
      r (Additive.ofMul (t : Q)) = x

def H2 : Prop :=
  ∀ (G : ProfiniteGrp) (A : Rep ℤ G),
  let S := ClosedSubgroup G
  let U := fun H : S => H.toSubgroup
  let T : S := ⟨⊤,isClosed_univ⟩
  let M := fun H J : S => (U J).subgroupOf (U H)
  letI : Module ℤ A.V := A.hV2
  let B := fun H : S => (Representation.invariants (A.ρ.comp (U H).subtype)).toAddSubgroup
  let tr := fun (H J : S) (b : A.V) => ∑ᶠ q : U H ⧸ M H J, A.ρ q.out.val b
  let Z := (Int.castRingHom (∀ n : ℕ+, ZMod (n : ℕ))).range.topologicalClosure
  ∀ (d : G →* Multiplicative Z) (v : B T →+ Z), let e := fun H : S => ((U H).map d).index
  Continuous d → Function.Surjective d → (∀ m : ℤ, (m : Z) ∈ v.range) →
  (∀ (n : ℕ+) (x : B T), (v x).val n = 0 → ∃ y : B T, (n : ℕ) • v y = v x) →
  (∀ (H : S) [(U H).FiniteIndex] (z : Z),
    (∃ (a : B T) (b : B H), tr T H b.val = a.val ∧ v a = z) ↔ ∃ a, e H • v a = z) →
  let P := {p : S × S // (U p.1).FiniteIndex ∧ p.2 ≤ p.1 ∧ (M p.1 p.2).Normal ∧ Finite (U p.1 ⧸ M p.1 p.2)}
  let H (p : P) := p.val.1
  let J (p : P) := p.val.2
  letI (p : P) : (M (H p) (J p)).Normal := p.property.2.2.1
  let Q := fun p : P => U (H p) ⧸ M (H p) (J p)
  let W := fun p : P => AddSubgroup.closure {x : B (H p) | ∃ b : B (J p), tr (H p) (J p) b.val = x.val}
  (∀ p : P, ∀ [Fintype (Q p)] [IsCyclic (Q p)],
    let C := (Rep.res (U (H p)).subtype A).quotientToInvariants (M (H p) (J p))
    Nat.card (tateCohomology C 0) = Nat.card (Q p) ∧ Subsingleton (tateCohomology C (-1))) →
  ∀ r : ∀ p : P, Additive (Q p) →+ B (H p) ⧸ W p,
  (∀ (p : P) (t : U (H p)) (n : ℕ+) (F : S) (b : B F) (a : B T) (x : B (H p)),
    let l := QuotientGroup.mk' (M (H p) (J p) ⊓ (d.comp (U (H p)).subtype).ker)
    (d t.val).toAdd = e (H p) • ((n : ℕ) : Z) →
    U F = (((Subgroup.zpowers (l t)).topologicalClosure.comap l).map (U (H p)).subtype) →
    tr T F b.val = a.val → v a = (e F : Z) → tr (H p) F b.val = x.val →
    r p (Additive.ofMul (t : Q p)) = x) →
  ∀ p : P, IsCyclic (Q p) → Function.Injective (r p)

def H3 : Prop :=
  ∀ (G : ProfiniteGrp.{0}) (A : Rep.{0} ℤ G),
  let S := ClosedSubgroup G
  let U := fun H : S => H.toSubgroup
  let T : S := ⟨⊤,isClosed_univ⟩
  let M := fun H J : S => (U J).subgroupOf (U H)
  letI : Module ℤ A.V := A.hV2
  let B := fun H : S => (Representation.invariants (A.ρ.comp (U H).subtype)).toAddSubgroup
  let tr := fun (H J : S) (b : A.V) => ∑ᶠ q : U H ⧸ M H J, A.ρ q.out.val b
  let Z := (Int.castRingHom (∀ n : ℕ+, ZMod (n : ℕ))).range.topologicalClosure
  ∀ (d : G →* Multiplicative Z) (v : B T →+ Z), let e := fun H : S => ((U H).map d).index
  Continuous d → Function.Surjective d → (∀ m : ℤ, (m : Z) ∈ v.range) →
  (∀ (n : ℕ+) (x : B T), (v x).val n = 0 → ∃ y : B T, (n : ℕ) • v y = v x) →
  (∀ (H : S) [(U H).FiniteIndex] (z : Z),
    (∃ (a : B T) (b : B H), tr T H b.val = a.val ∧ v a = z) ↔ ∃ a, e H • v a = z) →
  let P := {p : S × S // (U p.1).FiniteIndex ∧ p.2 ≤ p.1 ∧ (M p.1 p.2).Normal ∧ Finite (U p.1 ⧸ M p.1 p.2)}
  let H (p : P) := p.val.1
  let J (p : P) := p.val.2
  letI (p : P) : (M (H p) (J p)).Normal := p.property.2.2.1
  let Q (p : P) := U (H p) ⧸ M (H p) (J p)
  let W (p : P) := AddSubgroup.closure {x : B (H p) | ∃ b : B (J p), tr (H p) (J p) b.val = x.val}
  ∀ r : ∀ p, Additive (Q p) →+ B (H p) ⧸ W p,
  (∀ p (t : U (H p)) (n : ℕ+) (F : S) (b : B F) (a : B T) (x : B (H p)),
    let l := QuotientGroup.mk' (M (H p) (J p) ⊓ (d.comp (U (H p)).subtype).ker)
    (d t.val).toAdd = e (H p) • ((n : ℕ) : Z) →
    U F = (((Subgroup.zpowers (l t)).topologicalClosure.comap l).map (U (H p)).subtype) →
    tr T F b.val = a.val → v a = (e F : Z) → tr (H p) F b.val = x.val →
    r p (Additive.ofMul (t : Q p)) = x) →
  (∀ p, IsCyclic (Q p) → Function.Injective (r p)) →
  ∀ p, IsMulCommutative (Q p) → Function.Injective (r p) ∧
    ∀ s ∈ Subgroup.normalizer (H p : Set G) ⊓ Subgroup.normalizer (J p : Set G),
    ∀ (a b : U (H p)) (x y : B (H p)), b.val = s*a.val*s⁻¹ → y.val = A.ρ s x.val →
    r p (Additive.ofMul (a : Q p)) = x → r p (Additive.ofMul (b : Q p)) = y

theorem main : H1 → H2 → H3 → OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H1_R1_H2_R1_H2_R1_H1_R1.H1 := by
  intro evaluation cyclic descent
  intro G _ _ _ _ _ _ A
  dsimp only
  intro d v cd ds vi vd vr cf
  let U := fun h : ClosedSubgroup G => h.toSubgroup
  let M := fun h j : ClosedSubgroup G => (U j).subgroupOf (U h)
  letI : Module ℤ A.V := A.hV2
  let B := fun h : ClosedSubgroup G => (Representation.invariants (A.ρ.comp (U h).subtype)).toAddSubgroup
  let tr := fun (h j : ClosedSubgroup G) (b : A.V) => ∑ᶠ q : U h ⧸ M h j, A.ρ q.out.val b
  let P := {p : ClosedSubgroup G × ClosedSubgroup G //
      (U p.1).FiniteIndex ∧ p.2 ≤ p.1 ∧ (M p.1 p.2).Normal ∧ Finite (U p.1 ⧸ M p.1 p.2)}
  let H (p : P) := p.val.1
  let J (p : P) := p.val.2
  letI (p : P) : (M (H p) (J p)).Normal := p.property.2.2.1
  letI (p : P) : Fintype (U (H p) ⧸ M (H p) (J p)) := @Fintype.ofFinite _ p.property.2.2.2
  letI (p : P) : (U (H p)).FiniteIndex := p.property.1
  let Q (p : P) := U (H p) ⧸ M (H p) (J p)
  let W (p : P) := AddSubgroup.closure {x : B (H p) | ∃ b : B (J p), tr (H p) (J p) b.val = x.val}
  have mem (p : P) (x : B (H p)) :
      x ∈ W p ↔ ∃ b : B (J p), tr (H p) (J p) b.val = x.val := by
    let f : A.V →ₗ[ℤ] A.V := ∑ q : Q p, A.ρ q.out.val
    have eq (b : A.V) : f b = tr (H p) (J p) b := by
      simp only [f,tr,finsum_eq_sum_of_fintype,LinearMap.sum_apply]
      apply Finset.sum_congr _ (fun _ _ => rfl)
      ext q
      simp
    let D := ((f.toAddMonoidHom.comp (B (J p)).subtype).range.comap (B (H p)).subtype)
    have hD (a : B (H p)) : a ∈ D ↔ ∃ b : B (J p), tr (H p) (J p) b.val = a.val := by
      change (∃ b : B (J p), f b.val = a.val) ↔ _
      simp only [eq]
    have he : W p = D := by
      change AddSubgroup.closure _ = D
      rw [show {a : B (H p) | ∃ b : B (J p), tr (H p) (J p) b.val = a.val} = (D : Set _) from
        Set.ext fun a => (hD a).symm, AddSubgroup.closure_eq]
    exact he ▸ hD x
  let T : ClosedSubgroup G := ⟨⊤,isClosed_univ⟩
  let Z := (Int.castRingHom (∀ n : ℕ+, ZMod (n : ℕ))).range.topologicalClosure
  have hn (H : ClosedSubgroup G) [(U H).FiniteIndex] (z : Z) :
      (∃ (a : B T) (b : B H), tr T H b.val = a.val ∧ v a = z) ↔ ∃ a, ((U H).map d).index • v a = z := by
    constructor
    · rintro ⟨a,b,ha,he⟩
      exact (vr H z).mp ⟨a,⟨b,ha⟩,he⟩
    · intro hz
      obtain ⟨a,⟨b,ha⟩,he⟩ := (vr H z).mpr hz
      exact ⟨a,b,ha,he⟩
  let ev := evaluation (ProfiniteGrp.of G) A d v cd ds vi vd hn cf
  let normed (p : P) := ev (H p) (J p) p.property.2.1 (W p) (mem p)
  let r (p : P) : Additive (Q p) →+ B (H p) ⧸ W p := Classical.choose (normed p)
  have normalized := fun p => Classical.choose_spec (normed p)
  have hc := cyclic (ProfiniteGrp.of G) A d v cd ds vi vd hn
    (fun p _ _ => cf (H p) (J p) p.property.2.1) r normalized
  have good := descent (ProfiniteGrp.of G) A d v cd ds vi vd hn r normalized hc
  intro h j finite le normal card comm w hw
  let p : P := ⟨⟨h,j⟩,finite,le,normal,@Finite.of_fintype _ card⟩
  have hW : W p = w := AddSubgroup.ext fun x => (mem p x).trans (hw x).symm
  subst w
  refine ⟨r p,(good p comm).1,?_⟩
  intro s sh sj x y a b hxy hab hx
  exact (good p comm).2 s ⟨Subgroup.mem_normalizer_iff_map_conj_eq.mpr sh,
    Subgroup.mem_normalizer_iff_map_conj_eq.mpr sj⟩ a b x y hab hxy hx

end OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H1_R1_H2_R1_H2_R1_H1_R1_H1_R1
