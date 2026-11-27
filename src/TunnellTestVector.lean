import TunnellShell

/-! The two trace-zero quaternion lattices of the local test vector at 2.
The bases are those of Burungale and Tian, section 3.3.1. -/

namespace TunnellTestVector

open TunnellShell Finset
open scoped Classical

def first (v : Triple) : Triple := (v.1+2*v.2.1,v.1-2*v.2.1,8*v.2.2)
def second (v : Triple) : Triple := (2*v.1+2*v.2.1+v.2.2,-2*v.1+2*v.2.1+v.2.2,-4*v.2.2)

lemma first_iff (v : Triple) : v∈Set.range first ↔ v.1%4=v.2.1%4 ∧ v.2.2%8=0 := by
  obtain ⟨x,y,z⟩ := v
  constructor
  · rintro ⟨⟨a,b,c⟩,h⟩
    simp [first,Prod.ext_iff] at h
    dsimp only
    omega
  · rintro ⟨h,hz⟩
    dsimp only at h hz
    exact ⟨((x+y)/2,(x-y)/4,z/8),by apply Prod.ext <;> simp [first,Prod.ext_iff] <;> omega⟩

lemma second_iff (v : Triple) : v∈Set.range second ↔ v.1%4=v.2.1%4 ∧
    v.2.2%4=0 ∧ (v.1+v.2.1+2*(v.2.2/4))%4=0 := by
  obtain ⟨x,y,z⟩ := v
  constructor
  · rintro ⟨⟨a,b,c⟩,h⟩
    simp [second,Prod.ext_iff] at h
    dsimp only
    omega
  · rintro ⟨h,hz,hs⟩
    dsimp only at h hz hs
    exact ⟨((x-y)/4,(x+y+2*(z/4))/4,-(z/4)),by
      apply Prod.ext <;> simp [second,Prod.ext_iff] <;> omega⟩

def same (v : Triple) : Prop := v.1%4=v.2.1%4
def positive (v : Triple) : Prop := Odd v.1 ∧ Odd v.2.1 ∧ v.2.2%8=0
def negative (v : Triple) : Prop := Odd v.1 ∧ Odd v.2.1 ∧ v.2.2%8=4

lemma odd_coordinates {d : ℕ} (hd : Odd d) {v : Triple} (hv : v∈shell (2*d)) (hz : Even v.2.2) :
    Odd v.1 ∧ Odd v.2.1 := by
  have hn := mem_shell.mp hv
  change v.1^2+v.2.1^2+v.2.2^2=((2*d:ℕ):ℤ) at hn
  obtain ⟨k,hk⟩ := hd
  obtain ⟨c,hz⟩ := hz
  have hq := congrArg (fun a:ℤ => (a:ZMod 4)) hn
  push_cast at hq
  rw [hk,hz] at hq
  push_cast at hq
  have hc : ∀ x y z k : ZMod 4, x^2+y^2+(z+z)^2=2*(2*k+1) → x.val%2=1 ∧ y.val%2=1 := by decide
  obtain ⟨hx,hy⟩ := hc _ _ _ _ hq
  have hxv := ZMod.val_intCast (n:=4) v.1
  have hyv := ZMod.val_intCast (n:=4) v.2.1
  rw [Int.odd_iff,Int.odd_iff]
  omega

lemma on_shell {d : ℕ} (hd : Odd d) {v : Triple} (hv : v∈shell (2*d)) :
    (v∈Set.range first ↔ same v ∧ positive v) ∧ (v∈Set.range second ↔ same v ∧ negative v) := by
  rw [first_iff,second_iff]
  change (_ ↔ _ ∧ (Odd v.1 ∧ Odd v.2.1 ∧ _)) ∧ (_ ↔ _ ∧ (Odd v.1 ∧ Odd v.2.1 ∧ _))
  have ho (h : v.2.2%4=0) := odd_coordinates hd hv (Int.even_iff.mpr (by omega : v.2.2%2=0))
  constructor
  · exact ⟨fun ⟨h,hz⟩ => ⟨h,(ho (by omega)).1,(ho (by omega)).2,hz⟩,fun h => ⟨h.1,h.2.2.2⟩⟩
  · change (_ ↔ v.1%4=v.2.1%4 ∧ _)
    constructor
    · rintro ⟨h,hz,hs⟩
      obtain ⟨hx,hy⟩ := ho hz
      refine ⟨h,hx,hy,?_⟩
      have := Int.odd_iff.mp hx
      omega
    · rintro ⟨h,hx,hy,hz⟩
      have := Int.odd_iff.mp hx
      exact ⟨h,by omega,by omega⟩

def flip (v : Triple) : Triple := (v.1,-v.2.1,v.2.2)

lemma flip_shell {v : Triple} {n : ℕ} (hv : v∈shell n) : flip v∈shell n := by
  simpa [mem_shell,normSq,flip] using hv

lemma half_card (n : ℕ) (P : Triple → Prop) (hP : ∀ v, P (flip v) ↔ P v)
    (hod : ∀ v, P v → Odd v.1 ∧ Odd v.2.1) :
    ((shell n).filter P).card = 2*((shell n).filter (fun v => same v ∧ P v)).card := by
  let S := (shell n).filter P
  have hh : (S.filter (fun v => ¬same v)).card = (S.filter same).card := by
    apply card_nbij' flip flip
    · intro v h
      obtain ⟨hS,hs⟩ := mem_filter.mp h
      obtain ⟨hv,hp⟩ := mem_filter.mp hS
      obtain ⟨hx,hy⟩ := hod v hp
      simp only [Int.odd_iff] at hx hy
      change ¬v.1%4=v.2.1%4 at hs
      exact mem_filter.mpr ⟨mem_filter.mpr ⟨flip_shell hv,(hP v).mpr hp⟩,
        by change v.1%4=(-v.2.1)%4; omega⟩
    · intro v h
      obtain ⟨hS,hs⟩ := mem_filter.mp h
      obtain ⟨hv,hp⟩ := mem_filter.mp hS
      obtain ⟨hx,hy⟩ := hod v hp
      simp only [Int.odd_iff] at hx hy
      change v.1%4=v.2.1%4 at hs
      exact mem_filter.mpr ⟨mem_filter.mpr ⟨flip_shell hv,(hP v).mpr hp⟩,
        by change ¬v.1%4=(-v.2.1)%4; omega⟩
    all_goals intro v _; simp [flip]
  have he := card_filter_add_card_filter_not (s:=S) same
  rw [hh] at he
  simpa [S,filter_filter,and_comm,two_mul] using he.symm

lemma coordinate (v : Triple) : coordWeight v = (if positive v then 1 else 0) - (if negative v then 1 else 0) := by
  obtain ⟨x,y,z⟩ := v
  dsimp only [coordWeight,admissible,positive,negative]
  by_cases hx : Odd x <;> by_cases hy : Odd y <;> simp only [hx,hy,true_and,false_and,ite_false,sub_zero]
  split_ifs <;> first
    | rw [Int.negOnePow_even _ (Int.even_iff.mpr (by omega))]; rfl
    | rw [Int.negOnePow_odd _ (Int.odd_iff.mpr (by omega))]; rfl
    | omega

theorem signed_shell (d : ℕ) (hd : Odd d) :
    (((shell (2*d)).filter (fun v => v∈Set.range first)).card:ℤ) -
      ((shell (2*d)).filter (fun v => v∈Set.range second)).card = 2*b d := by
  let S := shell (2*d)
  have h1 : S.filter (fun v => v∈Set.range first) = S.filter (fun v => same v ∧ positive v) :=
    filter_congr (fun _ hv => (on_shell hd hv).1)
  have h2 : S.filter (fun v => v∈Set.range second) = S.filter (fun v => same v ∧ negative v) :=
    filter_congr (fun _ hv => (on_shell hd hv).2)
  have hf := half_card (2*d) positive (fun _ => by simp [positive,flip]) (fun _ h => ⟨h.1,h.2.1⟩)
  have hg := half_card (2*d) negative (fun _ => by simp [negative,flip]) (fun _ h => ⟨h.1,h.2.1⟩)
  have hc := sum_weight_eq_twelve d
  rw [sum_weight] at hc
  simp_rw [coordinate] at hc
  simp only [sum_sub_distrib,sum_boole] at hc
  change ((S.filter (fun v => v∈Set.range first)).card:ℤ)-_=_
  rw [h1,h2]
  dsimp only [S] at *
  rw [show ((shell (2*d)).filter (fun x => positive x)).card = _ from hf,
    show ((shell (2*d)).filter (fun x => negative x)).card = _ from hg] at hc
  push_cast at hc
  omega

/-- Conjugation by 1+2j acts on the pure lattice over ℤ₂. Its norm 5
is invertible there, so the integral adjoint computes the same lattice test. -/
lemma conjugate_second (v : Triple) :
    v∈Set.range second ↔ (-3*v.1-4*v.2.2,5*v.2.1,4*v.1-3*v.2.2)∈Set.range first := by
  rw [first_iff,second_iff]
  dsimp only
  omega

#print axioms signed_shell

end TunnellTestVector
