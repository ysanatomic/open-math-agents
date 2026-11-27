import TunnellRankinRoots

/-! The quadratic ideal Dirichlet coefficient as a finite sum of quadratic congruence counts. -/

namespace TunnellRankin
open Finset

private def squareIndicator : ArithmeticFunction ℤ :=
  ⟨fun m => if m ≠ 0 ∧ IsSquare m then 1 else 0,by simp⟩

private lemma coprime_square_iff {a b : ℕ} (hc : a.Coprime b) :
    IsSquare (a*b) ↔ IsSquare a ∧ IsSquare b := by
  have left {x y : ℕ} (hh : x.Coprime y) (hs : IsSquare (x*y)) : IsSquare x := by
    obtain ⟨r,hr⟩ := hs
    obtain ⟨t,ht⟩ := exists_eq_pow_of_mul_eq_pow
      (by change IsUnit (x.gcd y); rw [hh.gcd_eq_one]; simp : IsUnit (gcd x y))
      (by simpa [sq] using hr : x*y=r^2)
    exact ⟨t,by simpa [sq] using ht⟩
  exact ⟨fun h => ⟨left hc h,left hc.symm (mul_comm a b ▸ h)⟩,fun h => h.1.mul h.2⟩

private lemma squareIndicator_mult : squareIndicator.IsMultiplicative := by
  refine ⟨by simp [squareIndicator],?_⟩
  intro a b h
  simp only [squareIndicator,ArithmeticFunction.coe_mk,mul_ne_zero_iff,coprime_square_iff h]
  split_ifs <;> simp_all

private noncomputable def rootFun (d : ℕ) : ArithmeticFunction ℤ :=
  ⟨fun m => (rho d m:ℤ),by simp [rho_zero]⟩

private lemma rootFun_mult (d : ℕ) : (rootFun d).IsMultiplicative :=
  ⟨by simp [rootFun,rho_one],fun h => by simp [rootFun,rho_mul _ h]⟩

private lemma square_prime_pow {p : ℕ} (hp : p.Prime) (j : ℕ) :
    IsSquare (p^j) ↔ Even j := by
  constructor
  · rintro ⟨b,hb⟩
    rw [←sq] at hb
    have hv := congrArg (fun n : ℕ => n.factorization p) hb
    change (p^j).factorization p = (b^2).factorization p at hv
    rw [Nat.factorization_pow_self hp,Nat.factorization_pow] at hv
    simp only [Finsupp.smul_apply,smul_eq_mul] at hv
    exact ⟨b.factorization p,by omega⟩
  · rintro ⟨k,rfl⟩
    exact ⟨p^k,pow_add p k k⟩

private noncomputable def localRoots (d p k : ℕ) : ℤ :=
  ∑ j ∈ range (k+1),if Even j then (rho d (p^(k-j)):ℤ) else 0

private lemma convolution_pow (d p k : ℕ) (hp : p.Prime) :
    (rootFun d*squareIndicator) (p^k)=localRoots d p k := by
  rw [ArithmeticFunction.mul_apply,Nat.sum_divisorsAntidiagonal' (fun x y => rootFun d x*squareIndicator y),
    Nat.sum_divisors_prime_pow hp]
  apply sum_congr rfl
  intro j hj
  have hjk : j≤k := by simpa using hj
  simp [squareIndicator,rootFun, Nat.pow_div hjk hp.pos,hp.ne_zero,square_prime_pow hp,
    mul_ite]

private lemma localRoots_step (d p k : ℕ) :
    localRoots d p (k+2) = (rho d (p^(k+2)):ℤ) + localRoots d p k := by
  unfold localRoots
  rw [sum_range_succ',sum_range_succ']
  simp only [Even.zero,if_true,Nat.sub_zero,zero_add,Nat.not_even_one,if_false,add_zero]
  rw [add_comm]
  congr 1
  apply sum_congr rfl
  intro j hj
  simp [Nat.even_add]

private lemma negWeight_zero_iff (d p : ℕ) (hp : p.Prime) :
    negWeight d p=0 ↔ p ∣ 2*d := by
  rcases eq_or_ne p 2 with rfl|h₂
  · simp [negWeight]
  let : Fact p.Prime := ⟨hp⟩
  rw [negWeight,if_pos (hp.odd_of_ne_two h₂),←jacobiSym.legendreSym.to_jacobiSym,legendreSym.eq_zero_iff]
  simp only [Int.cast_neg,Int.cast_natCast,neg_eq_zero,ZMod.natCast_eq_zero_iff]

private lemma localRoots_eq (d p k : ℕ) (hp : p.Prime) (hs : Squarefree (2*d)) :
    localRoots d p k = ∑ j ∈ range (k+1),(negWeight d p)^j := by
  induction k using Nat.twoStepInduction with
  | zero =>
    change (∑ j ∈ range 1, if Even j then (rho d (p^(0-j)):ℤ) else 0)=_
    rw [sum_range_one,sum_range_one]
    simp [rho_one]
  | one => simp [localRoots,sum_range_succ,rho_prime d p hp,add_comm]
  | more k ih _ =>
    rw [localRoots_step,ih,sum_range_succ (n:=k+2),sum_range_succ (n:=k+1)]
    suffices h : (rho d (p^(k+2)):ℤ) = (negWeight d p)^(k+1) * (1+negWeight d p) by
      rw [h,pow_succ (negWeight d p) (k+1)]
      ring
    by_cases hz : p∣2*d
    · simp [rho_ramified_pow hp hz hs,(negWeight_zero_iff d p hp).mpr hz]
    have hne := mt (negWeight_zero_iff d p hp).mp hz
    have ht : negWeight d p=0 ∨ negWeight d p=1 ∨ negWeight d p= -1 := by
      unfold negWeight
      split
      · exact jacobiSym.trichotomy _ _
      · simp
    rw [rho_good_pow hp hz (k+1),rho_prime d p hp]
    rcases ht with h|h|h <;> simp_all

theorem idealCoeff_eq_roots (d m : ℕ) (hs : Squarefree (2*d)) :
    idealCoeff d m = ∑ a ∈ m.divisors, if IsSquare (m/a) then (rho d a:ℤ) else 0 := by
  let F : ArithmeticFunction ℤ := ⟨idealCoeff d,by simp [idealCoeff]⟩
  have hF : F.IsMultiplicative := ⟨idealCoeff_one d,idealCoeff_mul d⟩
  have he : F=rootFun d*squareIndicator := (ArithmeticFunction.IsMultiplicative.eq_iff_eq_on_prime_powers
    F hF _ ((rootFun_mult d).mul squareIndicator_mult)).mpr (fun p k hp => by
      change idealCoeff d (p^k)=_
      rw [idealCoeff_prime_pow d p k hp,convolution_pow d p k hp,localRoots_eq d p k hp hs])
  change F m=_
  rw [he,ArithmeticFunction.mul_apply,Nat.sum_divisorsAntidiagonal (fun x y => rootFun d x*squareIndicator y)]
  apply sum_congr rfl
  intro a ha
  obtain ⟨hdiv,hm⟩ := Nat.mem_divisors.mp ha
  have hq : 0 < m / a := Nat.div_pos (Nat.le_of_dvd (Nat.pos_of_ne_zero hm) hdiv)
    (Nat.pos_of_dvd_of_pos hdiv (Nat.pos_of_ne_zero hm))
  simp [rootFun,squareIndicator,hq.ne',mul_ite]

#print axioms idealCoeff_eq_roots

end TunnellRankin
