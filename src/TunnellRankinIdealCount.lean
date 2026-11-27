import TunnellIdealDivisorCount
import TunnellRankinHNF

/-! The actual integral ideals enumerated by the quadratic Rankin coefficient. -/
namespace TunnellIdealHNF
open Finset TunnellRankin

theorem rankin_ideal_count (d m : ℕ) (hs : Squarefree (2*d)) (hm : 0 < m) :
    idealCoeff d m=(Nat.card (NormIdeals (2*d) m):ℤ) := by
  have hn : 0<2*d := Nat.pos_of_ne_zero hs.ne_zero
  rw [idealCoeff_eq_roots _ _ hs,ideal_count hn hm,divisors,sum_filter]
  push_cast
  apply sum_congr rfl
  intro a ha
  have hap := Nat.pos_of_mem_divisors ha
  letI : NeZero a := ⟨hap.ne'⟩
  have h : (roots (2*d) a).card=rho d a := by
    rw [roots_zmod _ _ hap,rho_eq_card,Fintype.card_subtype]
  split <;> simp_all

#print axioms rankin_ideal_count
end TunnellIdealHNF
