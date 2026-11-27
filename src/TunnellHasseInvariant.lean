import TunnellAuxPrime
import Mathlib.NumberTheory.LegendreSymbol.QuadraticChar.Basic

/-! # The Hasse invariant of split congruent-number curves -/

namespace TunnellHasseInvariant

open Finset

private lemma sum_power {p : ℕ} [Fact p.Prime] (k : ℕ) (hk : 0 < k) :
    ∑ x : ZMod p, x^k = if p-1 ∣ k then -1 else 0 := by
  classical
  let e : (ZMod p)ˣ ↪ ZMod p := ⟨(↑), Units.val_injective⟩
  have he : univ.map e = univ \ {(0 : ZMod p)} := by
    ext x
    simpa only [mem_map, mem_univ, Function.Embedding.coeFn_mk, true_and,
      mem_sdiff, mem_singleton, e] using! isUnit_iff_ne_zero
  calc
    _ = ∑ x ∈ univ \ {(0 : ZMod p)}, x^k := by
      rw [← sum_sdiff ({0} : Finset (ZMod p)).subset_univ, sum_singleton,
        zero_pow hk.ne', add_zero]
    _ = ∑ x : (ZMod p)ˣ, (x : ZMod p)^k := by simp [← he,e]
    _ = _ := by rw [FiniteField.sum_pow_units, ZMod.card]

private lemma character_sum {p m : ℕ} [Fact p.Prime] (hp : p = 4*m+1) (n : ZMod p) :
    ∑ x : ZMod p, (quadraticChar (ZMod p) (x^3-n^2*x) : ZMod p) =
      - ((2*m).choose m : ZMod p) * (-n^2)^m := by
  have hprime : p.Prime := Fact.out
  have hm : 0 < m := by have := hprime.two_le; omega
  have hchar : ringChar (ZMod p) ≠ 2 := by rw [ZMod.ringChar_zmod_n]; omega
  let c (j : ℕ) : ZMod p := (-n^2)^(2*m-j) * ((2*m).choose j : ZMod p)
  have hex (x : ZMod p) :
      (quadraticChar (ZMod p) (x^3-n^2*x) : ZMod p) =
        ∑ j ∈ range (2*m+1), x^(2*m+2*j) * c j := by
    rw [quadraticChar_eq_pow_of_char_ne_two' hchar, ZMod.card,
      show p / 2 = 2*m by omega,
      show x^3-n^2*x = x*(x^2 + (-n^2)) by ring, mul_pow, add_pow,
      Finset.mul_sum]
    apply sum_congr rfl
    intro j _
    simp only [c, pow_add, pow_mul]
    ring
  simp_rw [hex]
  rw [sum_comm]
  have hs (j : ℕ) (hj : j ∈ range (2*m+1)) :
      ∑ x : ZMod p, x^(2*m+2*j) * c j = if j=m then - c m else 0 := by
    rw [← sum_mul, sum_power _ (by omega)]
    have hd : p-1 ∣ 2*m+2*j ↔ j=m := by
      constructor
      · rintro ⟨k,hk⟩
        have hj' := mem_range.mp hj
        have hpk : p-1 = 4*m := by omega
        rw [hpk] at hk
        have hkpos : k > 0 := by by_contra! h; simp [show k=0 by omega] at hk; omega
        have hklt : k < 2 := by
          by_contra! hg
          have hmul := Nat.mul_le_mul_left (4*m) hg
          omega
        have := show k=1 by omega
        simp [this] at hk
        omega
      · rintro rfl
        exact ⟨1,by omega⟩
    simp only [hd]
    split_ifs with h
    · subst j; ring
    · simp
  rw [sum_congr rfl hs]
  simp [c, show m < 2*m+1 by omega, show 2*m-m=m by omega]
  ring

/-- The coefficient of the elliptic invariant differential at degree p−1 agrees
with the Frobenius trace modulo p for split good primes. -/
theorem point_count {p m : ℕ} [Fact p.Prime] (hp : p = 4*m+1) (n : ZMod p) :
    let N := (univ.filter fun xy : ZMod p × ZMod p => xy.2^2 = xy.1^3-n^2*xy.1).card
    (N : ZMod p) = - ((2*m).choose m : ZMod p) * (-n^2)^m := by
  classical
  let f := fun x : ZMod p => x^3-n^2*x
  have hc : ringChar (ZMod p) ≠ 2 := by rw [ZMod.ringChar_zmod_n]; omega
  have hf (x : ZMod p) : ((univ.filter fun y : ZMod p => y^2=f x).card : ℤ) =
      quadraticChar (ZMod p) (f x) + 1 := by
    simpa using quadraticChar_card_sqrts hc (f x)
  have hcount : ((univ.filter fun xy : ZMod p × ZMod p => xy.2^2=f xy.1).card : ℤ)
      = (∑ x : ZMod p, quadraticChar (ZMod p) (f x)) + p := by
    rw [Finset.card_filter, Fintype.sum_prod_type]
    simp only [← Finset.card_filter, Nat.cast_sum, hf, Finset.sum_add_distrib]
    simp
  have hc' := congrArg (Int.castRingHom (ZMod p)) hcount
  push_cast at hc'
  exact (show _ = ∑ x : ZMod p, (quadraticChar (ZMod p) (f x) : ZMod p) by
    simpa [f] using hc').trans (character_sum hp n)

theorem hasse_ne_zero_one {p m : ℕ} [Fact p.Prime] (hp : p = 4*m+1)
    (n : ZMod p) (hn : n ≠ 0) :
    let H := ((2*m).choose m : ZMod p) * (-n^2)^m
    H ≠ 0 ∧ H ≠ 1 := by
  let N := (univ.filter fun xy : ZMod p × ZMod p => xy.2^2=xy.1^3-n^2*xy.1).card
  have hc : (N : ZMod p) = -(((2*m).choose m : ZMod p) * (-n^2)^m) := by
    simpa [N,neg_mul] using point_count hp n
  constructor
  · intro h
    change ((2*m).choose m : ZMod p) * (-n^2)^m = 0 at h
    have hd : p ∣ N := (ZMod.natCast_eq_zero_iff ..).mp (by simpa [h] using hc)
    have ho := TunnellCoates.ordinary_split_good_prime (show p%4=1 by omega) n hn
    apply ho
    exact dvd_sub (dvd_refl _) (by exact_mod_cast hd)
  · intro h
    change ((2*m).choose m : ZMod p) * (-n^2)^m = 1 at h
    apply TunnellCoates.non_anomalous_good_prime (by omega) n hn
    apply (ZMod.natCast_eq_zero_iff ..).mp
    change ((N+1:ℕ) : ZMod p)=0
    push_cast
    rw [hc,h]
    ring

#print axioms hasse_ne_zero_one
end TunnellHasseInvariant
