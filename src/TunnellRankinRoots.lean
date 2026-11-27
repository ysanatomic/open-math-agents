import TunnellRankinCoeff

/-! Counts of primitive quadratic congruence roots and their behavior at prime powers. -/

namespace TunnellRankin
open Finset

private abbrev rootSet (d a : ℕ) := {x : ZMod a // x^2 = -((2*d:ℕ) : ZMod a)}

noncomputable def rho (d a : ℕ) : ℕ := if a = 0 then 0 else Nat.card (rootSet d a)

lemma rho_eq_card (d a : ℕ) [NeZero a] : rho d a =
    Fintype.card {x : ZMod a // x^2 = -((2*d:ℕ) : ZMod a)} := by
  simp only [rho,if_neg (NeZero.ne a),Nat.card_eq_fintype_card]

lemma rho_zero (d : ℕ) : rho d 0 = 0 := by simp [rho]

lemma rho_one (d : ℕ) : rho d 1 = 1 := by
  rw [rho_eq_card]
  have : Unique (rootSet d 1) := ⟨⟨⟨0,Subsingleton.elim _ _⟩⟩,fun _ => Subsingleton.elim _ _⟩
  exact Fintype.card_unique

lemma rho_mul (d : ℕ) {a b : ℕ} (h : a.Coprime b) :
    rho d (a*b) = rho d a * rho d b := by
  classical
  rcases eq_or_ne a 0 with rfl|ha
  · simp [rho_zero]
  rcases eq_or_ne b 0 with rfl|hb
  · simp [rho_zero]
  let : NeZero a := ⟨ha⟩
  let : NeZero b := ⟨hb⟩
  let e := ZMod.chineseRemainder h
  have he (x : ZMod (a*b)) : x^2 = -((2*d:ℕ):ZMod (a*b)) ↔
      (e x).1^2 = -((2*d:ℕ):ZMod a) ∧ (e x).2^2 = -((2*d:ℕ):ZMod b) := by
    rw [← e.injective.eq_iff, map_pow,map_neg,map_natCast,Prod.ext_iff]
    rfl
  let E : rootSet d (a*b) ≃ rootSet d a × rootSet d b := {
    toFun := fun x => (⟨(e x.val).1,((he _).mp x.property).1⟩,⟨(e x.val).2,((he _).mp x.property).2⟩)
    invFun := fun x => ⟨e.symm (x.1.val,x.2.val),(he _).mpr (by simp [x.1.property,x.2.property])⟩
    left_inv := fun _ => Subtype.ext (by simp)
    right_inv := fun _ => Prod.ext (Subtype.ext (by simp)) (Subtype.ext (by simp)) }
  simp only [rho_eq_card,← Fintype.card_prod]
  exact Fintype.card_congr E

private theorem roots_lift {R S : Type*} [CommRing R] [CommRing S] (f : R →+* S)
    (hf : Function.Surjective f) (hk : ∀ x, f x = 0 → x^2 = 0)
    (n : R) (hn : IsUnit n) (h₂ : IsUnit (2:R)) :
    Function.Bijective (fun x : {x:R // x^2=n} => (⟨f x,by rw [← map_pow,x.property]⟩ : {x:S // x^2=f n})) := by
  have liftUnit (x : R) (h : IsUnit (f x)) : IsUnit x := by
    obtain ⟨s,hs⟩ := isUnit_iff_exists_inv.mp h
    obtain ⟨t,rfl⟩ := hf s
    have he := hk (1-x*t) (by simp [hs])
    exact isUnit_iff_exists_inv.mpr ⟨t*(2-x*t),by linear_combination -he⟩
  have rootUnit (x : {x:S // x^2=f n}) : IsUnit x.val :=
    (isUnit_pow_iff (by decide : 2 ≠ 0)).mp (x.property ▸ hn.map f)
  constructor
  · intro x y hxy
    have h : f x.val = f y.val := congrArg Subtype.val hxy
    have hu : IsUnit (x.val+y.val) := liftUnit _ (by
      rw [map_add,←h,←two_mul]
      exact (by simpa only [map_ofNat] using h₂.map f : IsUnit (2:S)).mul
        (rootUnit ⟨f x.val,by rw [←map_pow,x.property]⟩))
    obtain ⟨t,ht⟩ := isUnit_iff_exists_inv.mp hu
    apply Subtype.ext
    linear_combination t*(x.property - y.property) - (x.val-y.val)*ht
  · intro x
    obtain ⟨y,hy⟩ := hf x.val
    have hu : IsUnit (2*y) := h₂.mul (liftUnit _ (hy ▸ rootUnit x))
    obtain ⟨t,ht⟩ := isUnit_iff_exists_inv.mp hu
    have hε : f (y^2-n) = 0 := by simp [hy,x.property]
    have hε₂ := hk _ hε
    refine ⟨⟨y-(y^2-n)*t,?_⟩,Subtype.ext ?_⟩
    · linear_combination t^2*hε₂ - (y^2-n)*ht
    · simpa [hε] using (show f (y-(y^2-n)*t) = x.val by rw [map_sub,map_mul,hε,zero_mul,sub_zero,hy])

lemma rho_good_lift {d p k : ℕ} (hp : p.Prime) (hn : ¬ p ∣ 2*d) (hk : 0 < k) :
    rho d (p^(k+1)) = rho d (p^k) := by
  let : Fact p.Prime := ⟨hp⟩
  let f := ZMod.castHom (pow_dvd_pow p (show k ≤ k+1 by omega)) (ZMod (p^k))
  have ker (x : ZMod (p^(k+1))) (hx : f x = 0) : x^2=0 := by
    rw [←ZMod.natCast_zmod_val x,map_natCast,ZMod.natCast_eq_zero_iff] at hx
    rw [←ZMod.natCast_zmod_val x,←Nat.cast_pow,ZMod.natCast_eq_zero_iff]
    exact dvd_trans (pow_dvd_pow p (show k+1 ≤ k*2 by omega))
      (by simpa [pow_mul] using pow_dvd_pow_of_dvd hx 2)
  have hu := (ZMod.isUnit_natCast_iff_not_dvd_pow (a:=2*d) hp (by omega : 0<k+1)).mpr hn
  have h₂ := (ZMod.isUnit_natCast_iff_not_dvd_pow (a:=2) hp (by omega : 0<k+1)).mpr
    (fun h => hn (dvd_mul_of_dvd_left h d))
  have h := roots_lift f (ZMod.ringHom_surjective f) ker _ hu.neg (by simpa using h₂)
  have e := Equiv.ofBijective _ h
  simpa only [rho_eq_card,map_neg,map_natCast] using Fintype.card_congr e

lemma rho_good_pow {d p : ℕ} (hp : p.Prime) (hn : ¬p ∣ 2*d) (k : ℕ) :
    rho d (p^(k+1)) = rho d p := by
  induction k with
  | zero => simp
  | succ k ih => exact (rho_good_lift hp hn (Nat.succ_pos _)).trans ih

lemma rho_ramified_prime {d p : ℕ} (hp : p.Prime) (h : p ∣ 2*d) : rho d p = 1 := by
  let : Fact p.Prime := ⟨hp⟩
  rw [rho_eq_card]
  have hn := (ZMod.natCast_eq_zero_iff _ _).mpr h
  have : Unique (rootSet d p) := {
    default := ⟨0,by simp [hn]⟩
    uniq := fun x => Subtype.ext (by
      have hzero : x.val^2 = 0 := by simpa [hn] using x.property
      exact (pow_eq_zero_iff (by decide : 2≠0)).mp hzero) }
  exact Fintype.card_unique

lemma rho_ramified_pow {d p : ℕ} (hp : p.Prime) (hn : p ∣ 2*d)
    (hs : Squarefree (2*d)) (k : ℕ) : rho d (p^(k+2)) = 0 := by
  let : Fact p.Prime := ⟨hp⟩
  rw [rho_eq_card,Fintype.card_eq_zero_iff]
  refine ⟨fun x => ?_⟩
  have hx : p^(k+2) ∣ x.val.val^2+2*d := (ZMod.natCast_eq_zero_iff _ _).mp (by
    push_cast
    simpa only [ZMod.natCast_zmod_val,Nat.cast_mul,Nat.cast_ofNat] using (add_eq_zero_iff_eq_neg.mpr x.property))
  have h2 : p^2 ∣ x.val.val^2+2*d := dvd_trans (pow_dvd_pow p (by omega : 2≤k+2)) hx
  have h1 : p ∣ x.val.val^2 := (Nat.dvd_add_iff_left hn).mpr
    ((dvd_pow_self p (by decide : 2≠0)).trans h2)
  have hx2 := pow_dvd_pow_of_dvd (hp.dvd_of_dvd_pow h1) 2
  exact (Nat.squarefree_iff_prime_squarefree.mp hs p hp) (by
    simpa [sq] using (Nat.dvd_add_iff_right hx2).mpr h2)

lemma rho_prime (d p : ℕ) (hp : p.Prime) :
    (rho d p : ℤ) = 1+negWeight d p := by
  let : Fact p.Prime := ⟨hp⟩
  rcases eq_or_ne p 2 with rfl|h₂
  · simp [rho_ramified_prime Nat.prime_two (dvd_mul_right 2 d),negWeight]
  have ho := hp.odd_of_ne_two h₂
  rw [negWeight,if_pos ho,←jacobiSym.legendreSym.to_jacobiSym,add_comm,rho_eq_card]
  simpa [Fintype.card_subtype] using legendreSym.card_sqrts p h₂ (-((2*d:ℕ):ℤ))

#print axioms rho_prime
#print axioms rho_good_pow
#print axioms rho_ramified_pow

end TunnellRankin
