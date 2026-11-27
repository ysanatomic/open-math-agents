import TunnellJacobiTwo

/-! Jacobi's four-square theorem, obtained from the quaternion counts at every prime. -/

namespace TunnellQuaternion

open Finset Quaternion
open scoped Pointwise

def divisorWeight (d : ℕ) : ℕ := if 4∣d then 0 else d

def fourDivSum (n : ℕ) : ℕ := ∑ d ∈ n.divisors, divisorWeight d

lemma divisorWeight_mul {a b : ℕ} (h : a.Coprime b) :
    divisorWeight (a*b) = divisorWeight a*divisorWeight b := by
  have hodd : ¬(2∣a ∧ 2∣b) := by
    rintro ⟨ha,hb⟩
    have hc := Nat.dvd_gcd ha hb
    rw [h.gcd_eq_one] at hc
    omega
  have hd : 4∣a*b ↔ 4∣a ∨ 4∣b := by
    simp only [Nat.dvd_iff_mod_eq_zero] at hodd ⊢
    rw [Nat.mul_mod]
    have ha := Nat.mod_lt a (by decide : 0<4)
    have hb := Nat.mod_lt b (by decide : 0<4)
    interval_cases ha' : a%4 <;> interval_cases hb' : b%4 <;> omega
  unfold divisorWeight
  simp only [hd]
  split_ifs <;> simp_all

lemma fourDivSum_mul {a b : ℕ} (h : a.Coprime b) :
    fourDivSum (a*b) = fourDivSum a * fourDivSum b := by
  unfold fourDivSum
  rw [Nat.divisors_mul,Finset.mul_def,Finset.sum_image h.mul_injOn_divisors]
  calc
    _ = ∑ v ∈ a.divisors ×ˢ b.divisors, divisorWeight v.1 * divisorWeight v.2 := by
      apply sum_congr rfl
      intro v hv
      obtain ⟨hm,hn⟩ := mem_product.mp hv
      exact divisorWeight_mul ((h.coprime_dvd_left (Nat.mem_divisors.mp hm).1).coprime_dvd_right (Nat.mem_divisors.mp hn).1)
    _ = _ := by rw [sum_product]; simp only [←mul_sum,←sum_mul]

lemma oddDivSum_pow {p : ℕ} (h : p.Prime) (hp : p≠2) (r : ℕ) :
    fourDivSum (p^r) = ∑ i ∈ range (r+1), p^i := by
  rw [fourDivSum,Nat.sum_divisors_prime_pow h]
  apply sum_congr rfl
  intro i _
  apply if_neg
  intro hd
  have he := dvd_trans (by decide : 2∣4) hd
  exact (Nat.not_even_iff_odd.mpr ((h.odd_of_ne_two hp).pow (n:=i))) (even_iff_two_dvd.mpr he)

lemma evenDivSum_pow {r : ℕ} (hr : 0<r) : fourDivSum (2^r)=3 := by
  obtain ⟨r,rfl⟩ := Nat.exists_eq_succ_of_ne_zero hr.ne'
  rw [fourDivSum,Nat.sum_divisors_prime_pow Nat.prime_two]
  clear hr
  induction r with
  | zero => decide
  | succ r ih =>
    rw [sum_range_succ,ih]
    have hd : 4∣2^(r+2) := by rw [pow_add]; exact dvd_mul_left _ _
    simp [divisorWeight,hd]

lemma quatShell_odd_pow_mul {p : ℕ} (h : p.Prime) (hp : p≠2) (m : ℕ) (hm : ¬p∣m) (r : ℕ) :
    (quatShell (p^r*m)).card = (∑ i ∈ range (r+1),p^i) * (quatShell m).card := by
  let : Fact p.Prime := ⟨h⟩
  induction r using Nat.twoStepInduction with
  | zero => simp
  | one =>
    have hh := quatShell_odd_recurrence hp m
    simpa [sum_range_succ,hm,Nat.add_comm] using hh.symm
  | more r hr hr' =>
    have hd : p∣p^(r+1)*m := by rw [pow_succ]; exact dvd_mul_of_dvd_left (dvd_mul_left _ _) _
    have hdiv : p^(r+1)*m/p=p^r*m := by
      rw [pow_succ',mul_assoc,Nat.mul_div_cancel_left _ h.pos]
    have hh := quatShell_odd_recurrence hp (p^(r+1)*m)
    rw [if_pos hd,hdiv,hr,hr'] at hh
    have he : p*(p^(r+1)*m)=p^(r+2)*m := by rw [pow_succ' p (r+1),mul_assoc]
    rw [he] at hh
    simp only [sum_range_succ, pow_succ] at hh ⊢
    nlinarith

lemma quatShell_two_pow_mul (m : ℕ) (hm : ¬2∣m) {r : ℕ} (hr : 0<r) :
    (quatShell (2^r*m)).card = 3*(quatShell m).card := by
  obtain ⟨r,rfl⟩ := Nat.exists_eq_succ_of_ne_zero hr.ne'
  clear hr
  induction r with
  | zero => simpa [even_iff_two_dvd,hm] using quatShell_two_recurrence m
  | succ r ih =>
    have he : Even (2^(r+1)*m) := even_two.pow_of_ne_zero (by omega) |>.mul_right _
    rw [pow_succ' 2 (r+1),mul_assoc,quatShell_two_recurrence,if_pos he,ih]

theorem quatShell_card_divisors {n : ℕ} (hn : n≠0) :
    (quatShell n).card = 8 * ∑ d ∈ n.divisors with ¬4∣d, d := by
  suffices h : ∀ m : ℕ, m≠0 → (quatShell m).card = 8*fourDivSum m by
    rw [h n hn,fourDivSum,sum_filter]
    simp [divisorWeight]
  apply Nat.recOnPrimePow
  · simp
  · intro _
    simpa [fourDivSum,divisorWeight] using quatShell_one_card
  · intro m p r h hm hr ih hne
    have hm0 : m≠0 := by rintro rfl; simp at hm
    rw [fourDivSum_mul ((h.coprime_iff_not_dvd.mpr hm).pow_left r)]
    by_cases hp : p=2
    · subst p
      rw [quatShell_two_pow_mul m hm hr,evenDivSum_pow hr,ih hm0]
      ring
    · rw [quatShell_odd_pow_mul h hp m hm r,oddDivSum_pow h hp r,ih hm0]
      ring

end TunnellQuaternion
