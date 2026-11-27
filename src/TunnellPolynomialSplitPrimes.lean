import Mathlib.Algebra.Polynomial.Roots
import Mathlib.Data.Nat.Factorial.Basic
import Mathlib.Data.Nat.Prime.Basic
import Mathlib.Tactic

/-! Arbitrarily large primes at which an integral polynomial has a root.
The proof uses its values on a single arithmetic progression. -/
namespace TunnellPolynomialSplitPrimes
open Polynomial
open scoped Polynomial

theorem prime_dividing_value (f : ℤ[X]) (hd : 0 < f.natDegree) (B : ℕ) :
    ∃ p : ℕ, p.Prime ∧ B<p ∧ ∃ x : ℤ, (p:ℤ)∣f.eval x := by
  have nconst (a : ℤ) : f≠C a := fun h => by simpa [h] using hd
  have fn : f≠0 := by simpa using nconst 0
  obtain ⟨b,hb⟩ : ∃ b : ℤ, f.eval b≠0 := by
    by_contra! h; exact fn (Polynomial.funext (fun b => (h b).trans eval_zero.symm))
  let a := f.eval b
  let M : ℤ := B.factorial
  have hM : M≠0 := by dsimp [M]; exact_mod_cast Nat.factorial_ne_zero B
  let x (k : ℤ) := b+a*M*k
  have hinj : Function.Injective x := by
    intro r s h
    exact mul_left_cancel₀ (mul_ne_zero hb hM) (add_left_cancel h)
  let F := f*(f-C a)*(f-C (-a))
  have hF : F≠0 := mul_ne_zero (mul_ne_zero fn (sub_ne_zero.mpr (nconst _))) (sub_ne_zero.mpr (nconst _))
  obtain ⟨k,hk⟩ : ∃ k : ℤ, ¬F.IsRoot (x k) := by
    by_contra! h
    exact (Set.infinite_range_of_injective hinj) ((Polynomial.finite_setOfPred_isRoot hF).subset (by
      rintro _ ⟨v,rfl⟩; exact h v))
  have hnot : f.eval (x k)≠a ∧ f.eval (x k)≠ -a := by
    simp only [IsRoot,F,eval_mul,eval_sub,eval_C,mul_eq_zero,sub_eq_zero,not_or] at hk
    exact ⟨hk.1.2,hk.2⟩
  obtain ⟨t,ht⟩ := Polynomial.sub_dvd_eval_sub (x k) b f
  let v := 1+M*k*t
  have eqv : f.eval (x k)=a*v := by
    dsimp only [x] at ht
    dsimp only [v]
    change f.eval (b+a*M*k)-a=(b+a*M*k-b)*t at ht
    change f.eval (b+a*M*k)=_
    linear_combination ht
  have hv : v.natAbs≠1 := by
    intro hh
    obtain hv | hv := Int.natAbs_eq v
    · have h : v=1 := by omega
      exact hnot.1 (by rw [eqv,h,mul_one])
    · have h : v= -1 := by omega
      exact hnot.2 (by rw [eqv,h,mul_neg_one])
  obtain ⟨p,hp,hpv⟩ := Nat.exists_prime_and_dvd hv
  have hdiv : (p:ℤ)∣v := by exact_mod_cast (Int.natAbs_dvd_natAbs.mp (by simpa using hpv) : (p:ℤ)∣v)
  refine ⟨p,hp,?_,x k,eqv ▸ dvd_mul_of_dvd_right hdiv a⟩
  by_contra! hle
  have hpm : (p:ℤ)∣M := by dsimp [M]; exact_mod_cast Nat.dvd_factorial hp.pos hle
  have hone : (p:ℤ)∣1 := by
    have d := dvd_sub hdiv (dvd_mul_of_dvd_left (dvd_mul_of_dvd_left hpm k) t)
    simpa [v] using d
  have : p∣1 := by exact_mod_cast hone
  exact hp.ne_one (Nat.dvd_one.mp this)

end TunnellPolynomialSplitPrimes
#print axioms TunnellPolynomialSplitPrimes.prime_dividing_value
