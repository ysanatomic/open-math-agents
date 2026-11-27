import TunnellCoates

/-! # Good reduction and auxiliary primes for the congruent-number curve -/

namespace TunnellCoates

open WeierstrassCurve WeierstrassCurve.Affine

lemma card_sq_fiber_le_two {K : Type*} [Field K] [Fintype K] [DecidableEq K] (c : K) :
    (Finset.univ.filter (fun y : K => y^2 = c)).card ≤ 2 := by
  by_cases h : ∃ a : K, a^2 = c
  · obtain ⟨a, rfl⟩ := h
    apply (Finset.card_le_card (t := {a, -a}) ?_).trans Finset.card_le_two
    intro y hy
    simpa [sq_eq_sq_iff_eq_or_eq_neg] using hy
  · simp [Finset.filter_eq_empty_iff.mpr (fun y _ hy => h ⟨y,hy⟩)]

lemma card_points_lt_twice {p : ℕ} [Fact p.Prime] (n : ZMod p) (hn : n ≠ 0) :
    (Finset.univ.filter (fun xy : ZMod p × ZMod p => xy.2^2 = xy.1^3-n^2*xy.1)).card + 1
      < 2*p := by
  classical
  let C := fun x : ZMod p => (Finset.univ.filter (fun y : ZMod p => y^2=x^3-n^2*x)).card
  have hc : (Finset.univ.filter (fun xy : ZMod p × ZMod p => xy.2^2=xy.1^3-n^2*xy.1)).card =
      ∑ x : ZMod p, C x := by
    simp only [C, Finset.card_filter, ← Finset.univ_product_univ, Finset.sum_product]
  have hcard : (Finset.univ.filter (fun y : ZMod p => y=0)).card=1 := by
    rw [show Finset.univ.filter (fun y : ZMod p => y=0) = {0} by ext; simp]; simp
  have hzero : C 0 = 1 := by simpa [C] using hcard
  have hroot : C n = 1 := by simpa [C, pow_succ n 2] using hcard
  have hsum := Finset.sum_le_sum (s := (Finset.univ : Finset (ZMod p))) (f := fun x =>
      C x + (if x = 0 then 1 else 0) + (if x = n then 1 else 0)) (g := fun _ => 2)
    (fun x _ => by
      by_cases hx : x = 0
      · subst x; simp [hzero, hn.symm]
      by_cases hx' : x = n
      · subst x; simp [hroot, hn]
      simpa [hx, hx'] using card_sq_fiber_le_two (x^3-n^2*x))
  simp [Finset.sum_add_distrib] at hsum
  rw [hc]
  omega

lemma non_anomalous_good_prime {p : ℕ} [Fact p.Prime] (hp2 : p ≠ 2) (n : ZMod p) (hn : n ≠ 0) :
    ¬ p ∣ (Finset.univ.filter (fun xy : ZMod p × ZMod p => xy.2^2=xy.1^3-n^2*xy.1)).card + 1 := by
  have h2 : (2:ZMod p) ≠ 0 := by
    change ((2:ℕ) : ZMod p) ≠ 0
    rw [Ne, ZMod.natCast_eq_zero_iff]
    exact fun h => hp2 ((Nat.prime_dvd_prime_iff_eq Fact.out Nat.prime_two).mp h)
  let W := E n
  have : W.IsElliptic := E_elliptic h2 hn
  have H0 : W.toAffine.Equation 0 0 := by simp [W,E]
  let R := Affine.Point.mk H0
  have hR : R ≠ 0 := Affine.Point.some_ne_zero _
  have r2 : (2:ℕ) • R=0 := by
    rw [two_nsmul]; apply Affine.Point.add_self_of_Y_eq; simp [W,E,Affine.negY]
  have hd := addOrderOf_dvd_natCard R
  rw [addOrderOf_eq_prime r2 hR, card_points] at hd
  let k := (Finset.univ.filter (fun xy : ZMod p × ZMod p => xy.2^2=xy.1^3-n^2*xy.1)).card + 1
  have hpos : 0 < k := Nat.zero_lt_succ _
  have hbound : k < 2*p := card_points_lt_twice _ hn
  change 2 ∣ k at hd
  rintro ⟨m,hm⟩
  change k = p*m at hm
  have hmpos : 0 < m := by by_contra! hh; simp [show m=0 by omega] at hm
  have hmlt : m < 2 := by
    by_contra! ht
    have hh := Nat.mul_le_mul_left p ht
    omega
  have hm1 : m = 1 := by omega
  have hk : k = p := by simpa [hm1] using hm
  rw [hk] at hd
  exact hp2 ((Nat.prime_dvd_prime_iff_eq Nat.prime_two Fact.out).mp hd).symm

lemma four_dvd_points {p : ℕ} [Fact p.Prime] (hp2 : p ≠ 2) (n : ZMod p) (hn : n ≠ 0) :
    4 ∣ (Finset.univ.filter (fun xy : ZMod p × ZMod p => xy.2^2=xy.1^3-n^2*xy.1)).card + 1 := by
  have h2 : (2:ZMod p) ≠ 0 := by
    change ((2:ℕ) : ZMod p) ≠ 0
    rw [Ne, ZMod.natCast_eq_zero_iff]
    exact fun h => hp2 ((Nat.prime_dvd_prime_iff_eq Fact.out Nat.prime_two).mp h)
  let W := E n
  have : W.IsElliptic := E_elliptic h2 hn
  have H0 : W.toAffine.Equation 0 0 := by simp [W,E]
  have Hn : W.toAffine.Equation n 0 := by simp [W,E_equation, pow_succ n 2]
  let R := Affine.Point.mk H0
  let S := Affine.Point.mk Hn
  have hR : R ≠ 0 := Affine.Point.some_ne_zero _
  have hS : S ≠ 0 := Affine.Point.some_ne_zero _
  have hSR : S ≠ R := by
    change Affine.Point.some _ _ _ ≠ Affine.Point.some _ _ _
    simp [hn]
  have r2 : (2:ℕ) • R=0 := by
    rw [two_nsmul]; apply Affine.Point.add_self_of_Y_eq; simp [W,E,Affine.negY]
  have s2 : (2:ℕ) • S=0 := by
    rw [two_nsmul]; apply Affine.Point.add_self_of_Y_eq; simp [W,E,Affine.negY]
  have hord := addOrderOf_eq_prime r2 hR
  let H := AddSubgroup.zmultiples R
  have hnon : S ∉ H := by
    rintro ⟨m,hm⟩
    have hred : (m % 2) • R = S := by
      simpa [hord, hm] using (mod_addOrderOf_zsmul R m)
    have hlo := Int.emod_nonneg m (by decide : (2:ℤ) ≠ 0)
    have hhi := Int.emod_lt_of_pos m (by decide : 0 < (2:ℤ))
    generalize hr : m % 2 = a at hred hlo hhi
    interval_cases a
    · exact hS (by simpa using hred.symm)
    · exact hSR (by simpa using hred.symm)
  have hco : addOrderOf (S : W.toAffine.Point ⧸ H) = 2 :=
    addOrderOf_eq_prime (by simp only [← QuotientAddGroup.mk_nsmul, s2, QuotientAddGroup.mk_zero])
      (fun h => hnon ((QuotientAddGroup.eq_zero_iff _).mp h))
  have hdiv := addOrderOf_dvd_natCard (S : W.toAffine.Point ⧸ H)
  rw [hco] at hdiv
  rw [← card_points n, AddSubgroup.card_eq_card_quotient_mul_card_addSubgroup H,
    Nat.card_zmultiples, hord]
  omega

lemma ordinary_split_good_prime {p : ℕ} [Fact p.Prime] (hp : p % 4 = 1)
    (n : ZMod p) (hn : n ≠ 0) :
    ¬ (p : ℤ) ∣ ((p : ℤ) - (Finset.univ.filter
      (fun xy : ZMod p × ZMod p => xy.2^2=xy.1^3-n^2*xy.1)).card) := by
  let N := (Finset.univ.filter (fun xy : ZMod p × ZMod p => xy.2^2=xy.1^3-n^2*xy.1)).card
  have h4 : 4 ∣ N+1 := four_dvd_points (by omega) n hn
  have hb : N+1 < 2*p := card_points_lt_twice n hn
  have hpos : 0 < N := by omega
  have hneq : N ≠ p := by omega
  change ¬ (p : ℤ) ∣ (p : ℤ) - (N : ℤ)
  intro h
  have h' : (p : ℤ) ∣ (N : ℤ) := by exact dvd_sub_self_left.mp h
  have hd : p ∣ N := by exact_mod_cast h'
  obtain ⟨m,hm⟩ := hd
  by_cases hm2 : 2 ≤ m
  · have hh := Nat.mul_le_mul_left p hm2
    omega
  have h1 : m=1 := by by_contra! hh; simp [show m=0 by omega] at hm; omega
  exact hneq (by simpa [h1] using hm)

/-- Arbitrarily large split, ordinary, non-anomalous good primes for the CM curve. -/
theorem exists_aux_prime {n : ℕ} (hn : 0<n) (B : ℕ) :
    ∃ p : ℕ, ∃ hp : p.Prime, B < p ∧ p % 4 = 1 ∧ ¬ p ∣ 2*n ∧
      (letI : Fact p.Prime := ⟨hp⟩
       let N := (Finset.univ.filter (fun xy : ZMod p × ZMod p =>
         xy.2^2=xy.1^3-(n : ZMod p)^2*xy.1)).card
       (¬ p ∣ N+1) ∧ ¬ (p : ℤ) ∣ (p : ℤ)-(N : ℤ)) := by
  obtain ⟨p,hp,hgt,hcong⟩ := Nat.exists_prime_gt_modEq_one (max (2*n) B) (by decide : 4 ≠ 0)
  haveI : Fact p.Prime := ⟨hp⟩
  have hk : p % 4 = 1 := hcong
  have hp2 : p ≠ 2 := by omega
  have hnd : ¬ p ∣ 2*n := Nat.not_dvd_of_pos_of_lt (by omega) (by omega)
  have hnz : (n : ZMod p) ≠ 0 := by
    rw [Ne, ZMod.natCast_eq_zero_iff]
    exact fun h => hnd (dvd_mul_of_dvd_right h 2)
  exact ⟨p,hp, by omega,hk,hnd,non_anomalous_good_prime hp2 _ hnz,
    ordinary_split_good_prime hk _ hnz⟩

#print axioms exists_aux_prime

end TunnellCoates
