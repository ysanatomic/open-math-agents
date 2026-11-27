import FormalConjectures.Wikipedia.CongruentNumber

namespace TunnellTwistCharacter

def weight (n m : ℕ) : ℤ := if Odd m then jacobiSym n m else 0

lemma weight_one (n : ℕ) : weight n 1 = 1 := by simp [weight]

lemma weight_mul (n a b : ℕ) : weight n (a*b) = weight n a * weight n b := by
  by_cases ha : Odd a <;> by_cases hb : Odd b <;> simp [weight, Nat.odd_mul, ha, hb]
  exact jacobiSym.mul_right' _ (fun e => by simp [e] at ha) (fun e => by simp [e] at hb)

lemma weight_mod (n m : ℕ) : weight n (m % (4*n)) = weight n m := by
  have he : Even (4*n) := Even.mul_right (by decide) _
  have h : Odd (m % (4*n)) ↔ Odd m := by
    simp only [Nat.odd_iff, Nat.mod_mod_of_dvd _ he.two_dvd]
  by_cases hm : Odd m
  · simpa [weight, h, hm] using (jacobiSym.mod_right' n hm).symm
  · simp [weight, h, hm]

lemma weight_periodic (n : ℕ) : Function.Periodic (weight n) (4*n) := by
  intro m
  rw [← weight_mod n (m+4*n), Nat.add_mod_right, weight_mod]

lemma weight_prime (n : ℕ) (p : Nat.Primes) [Fact p.val.Prime] (hp : p.val ≠ 2) :
    weight n p.val = quadraticChar (ZMod p.val) (n : ZMod p.val) := by
  have ho : Odd p.val := Nat.odd_iff.mpr (p.property.eq_two_or_odd.resolve_left hp)
  rw [weight, if_pos ho, ← jacobiSym.legendreSym.to_jacobiSym, legendreSym]
  simp

lemma weight_bad_prime (n : ℕ) (p : Nat.Primes) (hp : p.val ∣ 2*n) :
    weight n p.val = 0 := by
  letI : Fact p.val.Prime := ⟨p.property⟩
  by_cases h : p.val = 2
  · simp [weight, h]
  · have hd : p.val ∣ n := (p.property.dvd_mul.mp hp).resolve_left
      (fun e => h ((Nat.prime_dvd_prime_iff_eq p.property Nat.prime_two).mp e))
    rw [weight_prime n p h, (ZMod.natCast_eq_zero_iff n _).mpr hd, quadraticChar_zero]

lemma weight_zero_of_not_coprime (n m : ℕ) (h : ¬m.Coprime (4*n)) :
    weight n m = 0 := by
  by_cases hm : Odd m
  · letI : NeZero m := ⟨fun e => by simp [e] at hm⟩
    rw [weight, if_pos hm, jacobiSym.eq_zero_iff_not_coprime]
    intro h'
    apply h
    apply Nat.coprime_mul_iff_right.mpr
    constructor
    · exact hm.coprime_two_right.pow_right 2
    · apply Nat.Coprime.symm
      simpa [Nat.coprime_iff_gcd_eq_one, Int.gcd_eq_natAbs] using h'
  · simp [weight, hm]

noncomputable def character (n : ℕ) (hn : n ≠ 0) : DirichletCharacter ℂ (4*n) where
  toFun z := (weight n z.val : ℂ)
  map_one' := by rw [ZMod.val_one_eq_one_mod, weight_mod, weight_one]; norm_num
  map_mul' a b := by rw [ZMod.val_mul, weight_mod, weight_mul]; push_cast; rfl
  map_nonunit' a ha := by
    letI : NeZero (4*n) := ⟨Nat.mul_ne_zero (by decide) hn⟩
    have h : ¬a.val.Coprime (4*n) := fun hc => ha (by
      simpa [ZMod.natCast_zmod_val] using (ZMod.isUnit_iff_coprime _ _).mpr hc)
    rw [weight_zero_of_not_coprime n a.val h]
    norm_num

lemma character_apply_nat (n : ℕ) (hn : n ≠ 0) (m : ℕ) :
    character n hn (m : ZMod (4*n)) = (weight n m : ℂ) := by
  change (weight n (m : ZMod (4*n)).val : ℂ) = _
  rw [ZMod.val_natCast, weight_mod]

end TunnellTwistCharacter
