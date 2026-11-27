import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1_H2_R1_H2_R1
import Mathlib

/-! The Frobenius degree, cyclic Tate calculation and normalized relative norm symbols provide one automorphism detecting the norm subfields of a given unit. -/
namespace OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1_H2_R1_H2_R1_H1_R1
open NumberField IsDedekindDomain
open scoped NumberField Classical IsMulCommutative

def H1 : Prop :=
  ∀ (D : Type) [Field D] [NumberField D] (p : HeightOneSpectrum (𝓞 D)), let k := p.adicCompletion D
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

def H2 : Prop :=
  (∀ (D : Type) [Field D] [NumberField D] (p : HeightOneSpectrum (𝓞 D)), let k := p.adicCompletion D
  let Ω := SeparableClosure k
  let A := Rep.ofAlgebraAutOnUnits k Ω
  let S := ClosedSubgroup Gal(Ω/k)
  let U := fun H : S => H.toSubgroup
  ∀ (H J : S) [(U H).FiniteIndex], J ≤ H → ∀ [((U J).subgroupOf (U H)).Normal]
    [Fintype (U H ⧸ (U J).subgroupOf (U H))] [IsCyclic (U H ⧸ (U J).subgroupOf (U H))],
    let P := (Rep.res (U H).subtype A).quotientToInvariants ((U J).subgroupOf (U H))
    Nat.card (tateCohomology P 0) = Nat.card (U H ⧸ (U J).subgroupOf (U H)) ∧
      Subsingleton (tateCohomology P (-1))) ∧
  (∀ (F : Type) [Field F] [NumberField F] (w : HeightOneSpectrum (𝓞 F)), let k := w.adicCompletion F
  ∀ (Y : Type) [Field Y] [Algebra k Y] [FiniteDimensional k Y] [IsGalois k Y] [IsCyclic Gal(Y/k)],
    (Units.map (Algebra.norm k (S := Y))).range.index = Module.finrank k Y)

def H3 : Prop :=
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
  ∃ r : ∀ p : P, Additive (Q p) →+ B (H p) ⧸ W p,
  (∀ (p : P) (t : U (H p)) (n : ℕ+) (F : S) (b : B F) (a : B T) (x : B (H p)),
    let l := QuotientGroup.mk' (M (H p) (J p) ⊓ (d.comp (U (H p)).subtype).ker)
    (d t.val).toAdd = e (H p) • ((n : ℕ) : Z) →
    U F = (((Subgroup.zpowers (l t)).topologicalClosure.comap l).map (U (H p)).subtype) →
    tr T F b.val = a.val → v a = (e F : Z) → tr (H p) F b.val = x.val →
    r p (Additive.ofMul (t : Q p)) = x) ∧
  ∀ p : P, IsCyclic (Q p) → Function.Injective (r p)

def H4 : Prop :=
  ∀(k:Type) [Field k], let Ω:=SeparableClosure k
  let I:=IntermediateField k Ω
  let G:=Gal(Ω/k)
  let A:=Rep.ofAlgebraAutOnUnits k Ω
  let S:=ClosedSubgroup G
  let U(H:S):=H.toSubgroup
  let T:S:=⟨⊤,isClosed_univ⟩
  let M(H J:S):=(U J).subgroupOf (U H)
  letI:Module ℤ A.V:=A.hV2
  let B(H:S):=(Representation.invariants (A.ρ.comp (U H).subtype)).toAddSubgroup
  let tr(H J:S)(b:A.V):=∑ᶠ q:U H⧸M H J, A.ρ q.out.val b
  let Z:=(Int.castRingHom (∀ n:ℕ+, ZMod (n:ℕ))).range.topologicalClosure
  ∀(d:G →* Multiplicative Z)(v:B T →+ Z), let e(H:S):=((U H).map d).index
  Continuous d→Function.Surjective d→(∀ m:ℤ, (m:Z) ∈ v.range)→
  (∀(n:ℕ+)(x:B T), (v x).1 n=0→∃ y:B T, (n:ℕ)•v y=v x)→
  (∀(H:S) [(U H).FiniteIndex] (z:Z),
    (∃(a:B T)(b:B H), tr T H b.1=a.1∧v a=z)↔∃ a, e H•v a=z)→
  let P:={p:S × S // (U p.1).FiniteIndex∧p.2 ≤ p.1∧(M p.1 p.2).Normal∧Finite (U p.1⧸M p.1 p.2)}
  let H (p:P):=p.1.1
  let J (p:P):=p.1.2
  let m(p:P):=M (H p) (J p)
  let u(p:P):=U (H p)
  letI (p:P):(m p).Normal:=p.2.2.2.1
  let Q(p:P):=u p⧸m p
  let W(p:P):=AddSubgroup.closure {x:B (H p) | ∃ b:B (J p), tr (H p) (J p) b.1=x.1}
  (∀ p:P, ∀ [Fintype (Q p)][IsCyclic (Q p)],
    let C:=(Rep.res (u p).subtype A).quotientToInvariants (m p)
    Nat.card (tateCohomology C 0)=Nat.card (Q p)∧Subsingleton (tateCohomology C (-1)))→
  ∀ r:∀ p:P, Additive (Q p) →+ B (H p)⧸W p,
  (∀(p:P)(t:u p)(n:ℕ+)(F:S)(b:B F)(a:B T)(x:B (H p)),
    let l:=QuotientGroup.mk' (m p ⊓ (d.comp (u p).subtype).ker)
    (d t.1).toAdd=e (H p)•((n:ℕ):Z)→
    U F=(((Subgroup.zpowers (l t)).topologicalClosure.comap l).map (u p).subtype)→
    tr T F b.1=a.1→v a=(e F:Z)→tr (H p) F b.1=x.1→
    r p (Additive.ofMul (t:Q p))=x)→
  (∀ p:P, IsCyclic (Q p)→Function.Injective (r p))→
  ∀(x:kˣ)(L:I) [FiniteDimensional k L][IsAbelianGalois k L],
    ∃ σ:Gal(L/k), ∀(E:I)(h:E ≤ L) [FiniteDimensional k E][IsAbelianGalois k E],
      (∀ y:E, (σ (IntermediateField.inclusion h y):Ω)=y)↔x ∈ (Units.map (Algebra.norm k (S:=E))).range

open scoped Classical

set_option maxHeartbeats 2200000 in
theorem main : H1 → H2 → H3 → H4 → OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1_H2_R1_H2_R1.H1 := by
  intro values joint formation test
  refine ⟨?_,joint.2⟩
  have tate := joint.1
  intro F _ _ p k Ω x L _ _
  let G := Gal(Ω/k)
  let A := Rep.ofAlgebraAutOnUnits k Ω
  let S := ClosedSubgroup G
  let U (H : S) := H.toSubgroup
  let M (H J : S) := (U J).subgroupOf (U H)
  let P := {z : S × S // (U z.1).FiniteIndex ∧ z.2 ≤ z.1 ∧ (M z.1 z.2).Normal ∧ Finite (U z.1 ⧸ M z.1 z.2)}
  letI (z : P) : (M z.val.1 z.val.2).Normal := z.property.2.2.1
  obtain ⟨d,v,hd,ds,vi,vd,vr⟩ := values F p
  let cf (z : P) [ft : Fintype (U z.val.1 ⧸ M z.val.1 z.val.2)] [cc : IsCyclic (U z.val.1 ⧸ M z.val.1 z.val.2)] :=
    letI : (U z.val.1).FiniteIndex := z.property.1
    tate F p z.val.1 z.val.2 z.property.2.1
  have normed := formation (ProfiniteGrp.of G) A d v hd ds vi vd (fun H _ z => by
    constructor
    · rintro ⟨a,b,hb,ha⟩
      exact (vr H z).mp ⟨a,⟨b,hb⟩,ha⟩
    · intro hz
      obtain ⟨a,⟨b,hb⟩,ha⟩ := (vr H z).mpr hz
      exact ⟨a,b,hb,ha⟩) cf
  obtain ⟨r,hr,hi⟩ := normed
  exact test k d v hd ds vi vd (fun H _ z => by
    constructor
    · rintro ⟨a,b,hb,ha⟩
      exact (vr H z).mp ⟨a,⟨b,hb⟩,ha⟩
    · intro hz
      obtain ⟨a,⟨b,hb⟩,ha⟩ := (vr H z).mpr hz
      exact ⟨a,b,hb,ha⟩) cf r hr hi x L

end OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1_H2_R1_H2_R1_H1_R1
