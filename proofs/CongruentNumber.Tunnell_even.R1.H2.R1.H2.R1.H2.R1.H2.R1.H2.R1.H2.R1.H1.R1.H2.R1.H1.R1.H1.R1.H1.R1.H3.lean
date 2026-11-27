import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1_H1_R1_H1_R1_H1_R1
import Mathlib

/-! Membership in a compact set of cyclotomic characters is detected by simultaneous finite coordinates. -/

namespace TunnellCyclotomicClosure
open Set

theorem mem_compact {G I : Type*} [TopologicalSpace G] {B : I → Type*}
    [∀ i, TopologicalSpace (B i)] [∀ i, T2Space (B i)]
    (v : ∀ i, G → B i) (cont : ∀ i, Continuous (v i))
    (inj : Function.Injective (fun x => fun i => v i x))
    {S : Set G} (compact : IsCompact S) (t : G)
    (approx : ∀ J : Finset I, ∃ x ∈ S, ∀ i ∈ J, v i x = v i t) : t ∈ S := by
  let C (i:I) : Set G := {x | v i x = v i t}
  have closed (i:I) : IsClosed (C i) := isClosed_eq (cont i) continuous_const
  have finite (J:Finset I) : (S ∩ ⋂ i ∈ J, C i).Nonempty := by
    obtain ⟨x,hx,eq⟩ := approx J
    exact ⟨x,hx,Set.mem_iInter₂.mpr eq⟩
  obtain ⟨x,hx,all⟩ := compact.inter_iInter_nonempty C closed finite
  have he : x=t := inj (funext (fun i => Set.mem_iInter.mp all i))
  exact he ▸ hx

theorem closure_eq {G I : Type*} [TopologicalSpace G] [CompactSpace G] {B : I → Type*}
    [∀ i, TopologicalSpace (B i)] [∀ i, T2Space (B i)]
    (v : ∀ i, G → B i) (cont : ∀ i, Continuous (v i))
    (inj : Function.Injective (fun x => fun i => v i x)) {S T : Set G}
    (same : ∀ J : Finset I, (fun x => fun i : J => v i.val x) '' S =
      (fun x => fun i : J => v i.val x) '' T) : closure S=closure T := by
  have one (A B : Set G) (h : ∀ J : Finset I, (fun x => fun i : J => v i.val x) '' A ⊆
      (fun x => fun i : J => v i.val x) '' B) : A ⊆ closure B := by
    intro x hx
    apply mem_compact v cont inj isClosed_closure.isCompact x
    intro J
    obtain ⟨y,hy,eq⟩ := h J ⟨x,hx,rfl⟩
    exact ⟨y,subset_closure hy,fun i hi => congrFun eq ⟨i,hi⟩⟩
  exact le_antisymm (closure_minimal (one S T fun j => (same j).le) isClosed_closure)
    (closure_minimal (one T S fun j => (same j).ge) isClosed_closure)

end TunnellCyclotomicClosure

/-! In the integral-coordinate model, all finite conductor images detect subgroup closures. -/
namespace TunnellConductorClosure
open Set
noncomputable section
abbrev R := ∀ n : ℕ+, ZMod n.val
abbrev Z := (Int.castRingHom R).range.topologicalClosure
def ev (n : ℕ+) : Zˣ →* (ZMod n.val)ˣ := Units.map (((Pi.evalRingHom (fun i : ℕ+ => ZMod i.val) n).comp Z.subtype).toMonoidHom)
theorem compatible (m n : ℕ+) (d : m.val ∣ n.val) (x : Zˣ) : ZMod.unitsMap d (ev n x)=ev m x := by
  apply Units.ext
  let C : Set R := {a | ZMod.castHom d (ZMod m.val) (a n)=a m}
  have h : IsClosed C := isClosed_eq ((continuous_of_discreteTopology (f:=ZMod.castHom d (ZMod m.val))).comp (continuous_apply n)) (continuous_apply m)
  apply (show closure (((Int.castRingHom R).range : Subring R) : Set R) ⊆ C from closure_minimal _ h) x.val.property
  rintro _ ⟨z,rfl⟩
  exact map_intCast (ZMod.castHom d (ZMod m.val)) z

theorem criterion (S T : Subgroup Zˣ) (agree : ∀ n : ℕ+, S.map (ev n)=T.map (ev n)) :
    closure (S:Set Zˣ)=closure (T:Set Zˣ) := by
  haveI : CompactSpace Z := isCompact_iff_compactSpace.mp (isClosed_closure (s:=((Int.castRingHom R).range : Set R))).isCompact
  have cont (m : ℕ+) : Continuous (ev m) :=
    ((continuous_apply m).comp continuous_subtype_val).units_map _
  have joint : Function.Injective (fun a : Zˣ => fun n : ℕ+ => ev n a) := by
    intro x y eq
    exact Units.ext (Subtype.ext (funext fun n => congrArg Units.val (congrFun eq n)))
  apply TunnellCyclotomicClosure.closure_eq (I:=ℕ+) (B:=fun n : ℕ+ => (ZMod n.val)ˣ) (fun n a => ev n a) cont joint
  intro J
  let n : ℕ+ := J.prod id
  have divides (i : J) : i.val.val ∣ n.val := by
    obtain ⟨k,hk⟩ := Finset.dvd_prod_of_mem (fun j : ℕ+ => j) i.property
    exact ⟨k.val,congrArg PNat.val hk⟩
  have incl (A B : Subgroup Zˣ) (le : A.map (ev n) ≤ B.map (ev n)) :
      (fun x => fun i : J => ev i.val x) '' (A:Set Zˣ) ⊆ (fun x => fun i : J => ev i.val x) '' (B:Set Zˣ) := by
    rintro _ ⟨x,hx,rfl⟩
    obtain ⟨y,hy,eq⟩ := le (show ev n x ∈ A.map (ev n) from ⟨x,hx,rfl⟩)
    exact ⟨y,hy,funext fun i => (compatible i.val n (divides i) y).symm.trans
      ((congrArg (ZMod.unitsMap (divides i)) eq).trans (compatible i.val n (divides i) x))⟩
  exact Set.Subset.antisymm (incl _ _ (agree n).le) (incl _ _ (agree n).ge)
end
end TunnellConductorClosure

theorem OMA.solution : OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1_H1_R1_H1_R1_H1_R1.H3 := TunnellConductorClosure.criterion
