import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H1_R1_H2_R1_H2_R1_H1_R1_H1_R1
import Mathlib

/-! Positive-degree lifts factor through a finite quotient when three prime norms add there. The Frobenius power-sum formula computes their difference, and inertia descent puts its trace in the relative norm subgroup. -/
namespace OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H1_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1
open scoped Classical

def H1 : Prop :=
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
  ∀ (H J : S) [(U H).FiniteIndex], J ≤ H → ∀ [(M H J).Normal] [Fintype (U H ⧸ M H J)],
  let Q := U H ⧸ M H J
  let l := QuotientGroup.mk' (M H J ⊓ (d.comp (U H).subtype).ker)
  let R (t : U H) (x : A.V) := ∃ (n : ℕ+) (F : S) (b : B F) (a : B T),
    (d t.val).toAdd = e H • ((n : ℕ) : Z) ∧
    U F = (((Subgroup.zpowers (l t)).topologicalClosure.comap l).map (U H).subtype) ∧
    tr T F b.val = a.val ∧ v a = (e F : Z) ∧ tr H F b.val = x
  ∀ W : AddSubgroup (B H), (∀ x, x ∈ W ↔ ∃ b : B J, tr H J b.val = x.val) →
  (∀ (s t : U H) (x y z : B H), R s x.val → R t y.val → R (s*t) z.val →
    z - x - y ∈ W) →
  ∃ r : Additive Q →+ B H ⧸ W, ∀ (s : U H) (x : B H), R s x.val → r (Additive.ofMul (s : Q)) = x

def H2 : Prop :=
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
  ∀ (H J : S) [(U H).FiniteIndex], J ≤ H → ∀ [(M H J).Normal] [Fintype (U H ⧸ M H J)],
  let Q := U H ⧸ M H J
  let l := QuotientGroup.mk' (M H J ⊓ (d.comp (U H).subtype).ker)
  let R (t : U H) (x : A.V) := ∃ (n : ℕ+) (F : S) (b : B F) (a : B T),
    (d t.val).toAdd = e H • ((n : ℕ) : Z) ∧
    U F = (((Subgroup.zpowers (l t)).topologicalClosure.comap l).map (U H).subtype) ∧
    tr T F b.val = a.val ∧ v a = (e F : Z) ∧ tr H F b.val = x
  ∀ I L : S, U I = U H ⊓ d.ker → U L = U J ⊓ d.ker →
  let unit (x : A.V) := ∃ F : S, L ≤ F ∧ F ≤ H ∧ (U F).FiniteIndex ∧
    ∃ (w : B F) (a : B T), w.val = x ∧ tr T F x = a.val ∧ v a = 0
  ∀ (s t : U H) (a b c : A.V), R s a → R t b → R (s*t) c →
  ∃ (f : U H) (g : Fin 3 → U H) (x : A.V) (y : Fin 3 → A.V), (d f.val).toAdd = (e H : Z) ∧
    (∀ i, d (g i).val = 1) ∧ unit x ∧ (∀ i, unit (y i)) ∧
    A.ρ f.val x - x = ∑ i, (A.ρ (g i).val (y i) - y i) ∧ tr I L x = a+b-c

def H3 : Prop :=
  ∀ (G : ProfiniteGrp) (A : Rep ℤ G),
  let S := ClosedSubgroup G
  let U := fun H : S => H.toSubgroup
  let T : S := ⟨⊤, isClosed_univ⟩
  let M := fun H J : S => (U J).subgroupOf (U H)
  letI : Module ℤ A.V := A.hV2
  let B := fun H : S => (Representation.invariants (A.ρ.comp (U H).subtype)).toAddSubgroup
  let tr := fun (H J : S) (b : A.V) => ∑ᶠ q : U H ⧸ M H J, A.ρ q.out.val b
  let Z := (Int.castRingHom (∀ n : ℕ+, ZMod (n : ℕ))).range.topologicalClosure
  ∀ (d : G →* Multiplicative Z) (v : B T →+ Z), let e := fun H : S => ((U H).map d).index
  Continuous d → Function.Surjective d → (∀ m : ℤ, (m : Z) ∈ v.range) →
  (∀ (n : ℕ+) (x : B T), (v x).val n = 0 → ∃ y : B T, (n : ℕ) • v y = v x) →
  (∀ (H : S) [(U H).FiniteIndex] (z : Z), (∃ (a : B T) (b : B H), tr T H b.val = a.val ∧ v a = z) ↔ ∃ a, e H • v a = z) →
  (∀ (H J : S) [(U H).FiniteIndex], J ≤ H → ∀ [(M H J).Normal] [Fintype (U H ⧸ M H J)]
    [IsCyclic (U H ⧸ M H J)], let P := (Rep.res (U H).subtype A).quotientToInvariants (M H J)
    Nat.card (tateCohomology P 0) = Nat.card (U H ⧸ M H J) ∧ Subsingleton (tateCohomology P (-1))) →
  ∀ (H J I L : S) [(U H).FiniteIndex], J ≤ H → ∀ [(M H J).Normal] [Finite (U H ⧸ M H J)],
  U I = U H ⊓ d.ker → U L = U J ⊓ d.ker →
  let unit := fun x : A.V => ∃ F : S, L ≤ F ∧ F ≤ H ∧ (U F).FiniteIndex ∧
    ∃ (w : B F) (a : B T), w.val = x ∧ tr T F x = a.val ∧ v a = 0
  ∀ (f : U H) (g : Fin 3 → U H) (x : A.V) (y : Fin 3 → A.V),
  (d f.val).toAdd = (e H : Z) → (∀ i, d (g i).val = 1) → unit x → (∀ i, unit (y i)) →
  A.ρ f.val x - x = ∑ i, (A.ρ (g i).val (y i) - y i) →
  ∃ b : B J, tr H J b.val = tr I L x

theorem main : H1 → H2 → H3 → OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H1_R1_H2_R1_H2_R1_H1_R1_H1_R1.H1 := by
  intro lift correction descent
  intro G A
  dsimp only
  intro d v hd ds vi vd vr cf H J fi hj normal fin W hW
  let K : ClosedSubgroup G := ⟨d.ker,isClosed_singleton.preimage hd⟩
  let I := H ⊓ K
  let L := J ⊓ K
  obtain ⟨r,hr⟩ := lift G A d v hd ds vi vd vr H J hj W hW (by
    intro s t x y z hx hy hz
    obtain ⟨f,g,u,w,df,dg,uu,uw,star,eq⟩ :=
      correction G A d v hd ds vi vd vr H J hj I L rfl rfl s t x.val y.val z.val hx hy hz
    obtain ⟨b,hb⟩ := descent G A d v hd ds vi vd vr cf H J I L hj rfl rfl f g u w df dg uu uw star
    have hxyz : x+y-z ∈ W := (hW _).mpr ⟨b,hb.trans eq⟩
    simpa only [neg_sub,sub_add_eq_sub_sub] using W.neg_mem hxyz)
  refine ⟨r,?_⟩
  intro s n F b a x de sh tb va th
  exact hr s x ⟨n,F,b,a,de,sh,tb,va,th⟩

end OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H1_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1
