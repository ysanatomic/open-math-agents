import OMAReductions.R_CongruentNumber_Tunnell_even_R1
import Mathlib.NumberTheory.Zsqrtd.GaussianInt

/-! Generation of all rational cusps by translation and the level-two Fricke involution. -/

namespace TunnellFrickeOrbit

theorem rational_cusps (P : ℚ → Prop) (hzero : P 0)
    (hT : ∀ x k, P x → P (x + (k:ℤ)))
    (hW : ∀ x, x ≠ 0 → P x → P (-1/(2*x))) (x : ℚ) : P x := by
  have hnegHalf : P (-1/2) := by
    simpa using hW 1 one_ne_zero (by simpa using hT 0 1 hzero)
  have hfrac (d : ℕ) : ∀ a : ℤ, 0<d → P ((a:ℚ)/d) := by
    induction d using Nat.strong_induction_on with
    | h d ih =>
      intro a hd
      let r := a.bmod d
      have hdq : (d:ℚ) ≠ 0 := by positivity
      have bound := (Int.bmod_eq_iff (a:=a) hd).mp (rfl : a.bmod d = r)
      have eqr : (a:ℚ)/d = (r:ℚ)/d + (a.bdiv d:ℚ) := by
        field_simp
        exact_mod_cast (Int.bmod_add_bdiv a d).symm
      rw [eqr]
      apply hT
      by_cases hr0 : r = 0
      · simpa [hr0] using hzero
      have hrq : (r:ℚ) ≠ 0 := by exact_mod_cast hr0
      by_cases hedge : 2*r = -(d:ℤ)
      · have e : (r:ℚ)/d = -1/2 := by
          have hh : 2*(r:ℚ) = -(d:ℚ) := by exact_mod_cast hedge
          field_simp
          linarith
        rwa [e]
      have hsmall : 2*r.natAbs < d := by omega
      have hpos : 0<2*r.natAbs := by omega
      by_cases hrpos : 0 ≤ r
      · have ee : (r.natAbs : ℚ) = r := by
          have e : (r.natAbs : ℤ) = r := by omega
          simpa only [Int.cast_natCast] using congrArg (fun a : ℤ => (a:ℚ)) e
        have hh := ih (2*r.natAbs) hsmall (-(d:ℤ)) hpos
        rw [Nat.cast_mul,Nat.cast_two,ee,Int.cast_neg,Int.cast_natCast] at hh
        convert hW _ (div_ne_zero (neg_ne_zero.mpr hdq) (mul_ne_zero (by norm_num) hrq)) hh using 1 <;> field_simp <;> ring
      · have ee : (r.natAbs : ℚ) = -r := by
          have e : (r.natAbs : ℤ) = -r := by omega
          simpa only [Int.cast_natCast,Int.cast_neg] using congrArg (fun a : ℤ => (a:ℚ)) e
        have hh := ih (2*r.natAbs) hsmall (d:ℤ) hpos
        rw [Nat.cast_mul,Nat.cast_two,ee,Int.cast_natCast] at hh
        convert hW _ (div_ne_zero hdq (mul_ne_zero (by norm_num) (neg_ne_zero.mpr hrq))) hh using 1 <;> field_simp <;> ring
  simpa only [Rat.num_div_den] using hfrac x.den x.num x.den_pos

noncomputable def integralMultiple (a b : ℂ) : Prop := ∃ c : GaussianInt, a = (c:ℂ)*b

theorem symbols_are_gaussian_multiples (J : ℚ → ℂ)
    (hT : ∀ x (k : ℤ), ∃ u : GaussianInt, J (x+k) = (u:ℂ)*J x)
    (hW : ∀ x, x≠0 → J (-1/(2*x)) = J 0-J x) (x : ℚ) :
    integralMultiple (J x) (J 0) := by
  apply rational_cusps (fun q => integralMultiple (J q) (J 0)) _ _ _ x
  · exact ⟨1,by simp⟩
  · rintro q k ⟨b,hb⟩
    obtain ⟨a,ha⟩ := hT q k
    exact ⟨a*b,by rw [ha,hb]; simp [mul_assoc]⟩
  · rintro q hq ⟨a,ha⟩
    exact ⟨1-a,by rw [hW q hq,ha]; rw [map_sub,map_one]; ring⟩

end TunnellFrickeOrbit
#print axioms TunnellFrickeOrbit.symbols_are_gaussian_multiples
