import Mathlib

namespace TunnellEigenlines

open Matrix

abbrev Mat (p : ℕ) := Matrix (Fin 2) (Fin 2) (ZMod p)

def vec {p : ℕ} : Option (ZMod p) → Fin 2 → ZMod p
  | none => ![0, 1]
  | some r => ![1, r]

def invariant {p : ℕ} (W : Mat p) : Option (ZMod p) → Prop
  | none => W 0 1 = 0
  | some r => W 1 0 + W 1 1 * r = r * (W 0 0 + W 0 1 * r)

instance {p : ℕ} [NeZero p] (W : Mat p) (l : Option (ZMod p)) : Decidable (invariant W l) := by
  cases l <;> unfold invariant <;> infer_instance

theorem invariant_iff {p : ℕ} (W : Mat p) (l : Option (ZMod p)) : invariant W l ↔
    ∃ k : ZMod p, W.mulVec (vec l) = k • vec l := by
  cases l with
  | none =>
    constructor
    · intro h
      refine ⟨W 1 1, ?_⟩
      ext i
      fin_cases i <;> simp_all [vec, invariant, Matrix.mulVec, Matrix.vecHead, Matrix.vecTail]
    · rintro ⟨k, h⟩
      simpa [vec, invariant, Matrix.mulVec, Matrix.vecHead, Matrix.vecTail] using congrFun h 0
  | some r =>
    constructor
    · intro h
      refine ⟨W 0 0 + W 0 1 * r, ?_⟩
      ext i
      fin_cases i <;> simp_all [vec, invariant, Matrix.mulVec, Matrix.vecHead, Matrix.vecTail, mul_comm]
    · rintro ⟨k, h⟩
      have h0 := congrFun h 0
      have h1 := congrFun h 1
      simp [vec, Matrix.mulVec, Matrix.vecHead, Matrix.vecTail] at h0 h1
      rw [← h0] at h1
      simpa [invariant, mul_comm] using h1

theorem card_invariant {p : ℕ} [Fact p.Prime] (hp : p ≠ 2) (W : Mat p)
    (ht : W.trace = 0) :
    ((Finset.univ.filter (invariant W)).card : ℤ) =
      if W = 0 then (p : ℤ) + 1 else 1 + quadraticChar (ZMod p) (-W.det) := by
  classical
  have hc : ringChar (ZMod p) ≠ 2 := by simpa only [ZMod.ringChar_zmod_n] using hp
  have h2 : (2 : ZMod p) ≠ 0 := by
    change ((2 : ℕ) : ZMod p) ≠ 0
    rw [Ne, ZMod.natCast_eq_zero_iff]
    exact fun h => hp ((Nat.prime_dvd_prime_iff_eq Fact.out Nat.prime_two).mp h)
  by_cases hW : W = 0
  · subst W
    have hall : (Finset.univ.filter (invariant (0 : Mat p))) = Finset.univ := by
      ext l
      cases l <;> simp [invariant]
    simp [hall, ZMod.card]
  rw [if_neg hW]
  have hd : W 1 1 = -W 0 0 := by
    rw [Matrix.trace_fin_two] at ht
    linear_combination ht
  have hdet : -W.det = (W 0 0)^2 + W 0 1 * W 1 0 := by
    rw [Matrix.det_fin_two, hd]
    ring
  by_cases hb : W 0 1 = 0
  · rw [hdet, hb, zero_mul, add_zero]
    by_cases ha : W 0 0 = 0
    · have hc' : W 1 0 ≠ 0 := by
        intro h
        apply hW
        ext i j
        fin_cases i <;> fin_cases j <;> simp_all
      have heq : Finset.univ.filter (invariant W) = {none} := by
        ext l
        cases l <;> simp [invariant, hb, hd, ha, hc']
      simp [heq, ha]
    · have hden := mul_ne_zero h2 ha
      set r : ZMod p := W 1 0 / (2 * W 0 0) with hr
      have hi (s : ZMod p) : invariant W (some s) ↔ s = r := by
        change W 1 0 + W 1 1*s = s*(W 0 0 + W 0 1*s) ↔ _
        rw [hd, hb, zero_mul, add_zero, hr, eq_div_iff hden]
        constructor <;> intro h <;> linear_combination -h
      have heq : Finset.univ.filter (invariant W) = {none, some r} := by
        ext l
        cases l with
        | none => simp [invariant,hb]
        | some s => simpa using hi s
      simp [heq, quadraticChar_sq_one' ha]
  · have hi (r : ZMod p) : invariant W (some r) ↔ (W 0 1*r+W 0 0)^2 = -W.det := by
      change W 1 0 + W 1 1*r = r*(W 0 0 + W 0 1*r) ↔ _
      rw [hd,hdet]
      constructor
      · intro h
        linear_combination -W 0 1*h
      · intro h
        have e : W 0 1*(W 1 0 + -W 0 0*r-r*(W 0 0 + W 0 1*r))=0 := by
          linear_combination -h
        exact sub_eq_zero.mp ((mul_eq_zero.mp e).resolve_left hb)
    have hcard : (Finset.univ.filter (invariant W)).card =
        {x : ZMod p | x^2 = -W.det}.toFinset.card := by
      apply Finset.card_nbij' (fun l => W 0 1*l.getD 0 + W 0 0)
        (fun s => some ((s-W 0 0)/W 0 1))
      · intro l hl
        cases l with
        | none => simp [invariant,hb] at hl
        | some r => simpa using (hi r).mp (Finset.mem_filter.mp hl).2
      · intro s hs
        have hs' : s^2 = -W.det := by simpa using hs
        apply Finset.mem_filter.mpr ⟨Finset.mem_univ _,(hi _).mpr ?_⟩
        have h : W 0 1*((s-W 0 0)/W 0 1)+W 0 0=s := by field_simp; ring
        rw [h, hs']
      · intro l hl
        cases l with
        | none => simp [invariant,hb] at hl
        | some r => simp [hb]
      · intro s _
        change W 0 1*((s-W 0 0)/W 0 1)+W 0 0=s
        field_simp
        ring
    rw [hcard, quadraticChar_card_sqrts hc, add_comm]

end TunnellEigenlines
