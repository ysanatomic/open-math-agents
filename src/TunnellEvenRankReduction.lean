import OMAReductions.R_CongruentNumber_Tunnell_even_R1
import Mathlib.NumberTheory.FLT.Four
import Mathlib.NumberTheory.PythagoreanTriples
import Mathlib.NumberTheory.LegendreSymbol.QuadraticReciprocity

/-!
# The Coates–Wiles auxiliary-prime argument for congruent-number curves

A rational point of negative 2-adic x-valuation has infinite order. At split
good primes, elementary finite-field estimates and rational 2-torsion give
ordinary, non-anomalous reduction. Dirichlet's theorem supplies arbitrarily
large primes of this type. The real period is the positive elliptic integral
for the curve and scales by the inverse square root of the twist. Fermat descent excludes n=2 and all n=2p with p prime and p=5 modulo 8 before the analytic inputs are applied.

The remaining inputs concern the rationality of the period-normalized
central value and the elliptic-unit divisibility theorem used in section 6
of Coates and Wiles, On the conjecture of Birch and Swinnerton-Dyer,
Inventiones Mathematicae 39 (1977), 223–251.
-/

/-
# Local properties of the congruent-number curves
-/

namespace TunnellEvenInputTunnellCoates

open WeierstrassCurve WeierstrassCurve.Affine


lemma E_discriminant {K : Type*} [CommRing K] (n : K) : (⟨0,0,0,-n^2,0⟩ : WeierstrassCurve _).Δ = 64*n^6 := by
  simp [Δ, b₂,b₄,b₆,b₈]
  ring

lemma E_equation {K : Type*} [CommRing K] (n x y : K) :
    (⟨0,0,0,-n^2,0⟩ : WeierstrassCurve _).toAffine.Equation x y ↔ y^2 = x^3-n^2*x := by
  simp [Affine.equation_iff,sub_eq_add_neg]

lemma E_elliptic {K : Type*} [Field K] {n : K} (h2 : (2:K) ≠ 0) (hn : n ≠ 0) :
    (⟨0,0,0,-n^2,0⟩ : WeierstrassCurve _).IsElliptic := by
  constructor
  rw [E_discriminant, show (64:K)=(2:K)^6 by norm_num, isUnit_iff_ne_zero]
  exact mul_ne_zero (pow_ne_zero _ h2) (pow_ne_zero _ hn)

lemma card_points {K : Type*} [Field K] [Fintype K] [DecidableEq K] (n : K)
    [(⟨0,0,0,-n^2,0⟩ : WeierstrassCurve _).IsElliptic] : Nat.card (⟨0,0,0,-n^2,0⟩ : WeierstrassCurve _).toAffine.Point =
    (Finset.univ.filter (fun xy : K × K => xy.2^2 = xy.1^3-n^2*xy.1)).card + 1 := by
  classical
  have eqv := (⟨0,0,0,-n^2,0⟩ : WeierstrassCurve _).toAffine.pointEquiv.trans
    ((Equiv.subtypeEquivRight (fun xy : K×K => E_equation n xy.1 xy.2)).optionCongr)
  calc
    _ = Nat.card (Option {xy : K×K // xy.2^2 = xy.1^3-n^2*xy.1}) := Nat.card_congr eqv
    _ = _ := by simp [Nat.card_eq_fintype_card, Fintype.card_subtype]


end TunnellEvenInputTunnellCoates

/- # Good reduction and auxiliary primes for the congruent-number curve -/

namespace TunnellEvenInputTunnellCoates

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
  let W : WeierstrassCurve (ZMod p) := ⟨0,0,0,-n^2,0⟩
  have : W.IsElliptic := E_elliptic h2 hn
  have H0 : W.toAffine.Equation 0 0 := by simp [W]
  let R := Affine.Point.mk H0
  have hR : R ≠ 0 := Affine.Point.some_ne_zero _
  have r2 : (2:ℕ) • R=0 := by
    rw [two_nsmul]; apply Affine.Point.add_self_of_Y_eq; simp [W,Affine.negY]
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
  let W : WeierstrassCurve (ZMod p) := ⟨0,0,0,-n^2,0⟩
  have : W.IsElliptic := E_elliptic h2 hn
  have H0 : W.toAffine.Equation 0 0 := by simp [W]
  have Hn : W.toAffine.Equation n 0 := by simp [W,E_equation, pow_succ n 2]
  let R := Affine.Point.mk H0
  let S := Affine.Point.mk Hn
  have hR : R ≠ 0 := Affine.Point.some_ne_zero _
  have hS : S ≠ 0 := Affine.Point.some_ne_zero _
  have hSR : S ≠ R := by
    change Affine.Point.some _ _ _ ≠ Affine.Point.some _ _ _
    simp [hn]
  have r2 : (2:ℕ) • R=0 := by
    rw [two_nsmul]; apply Affine.Point.add_self_of_Y_eq; simp [W,Affine.negY]
  have s2 : (2:ℕ) • S=0 := by
    rw [two_nsmul]; apply Affine.Point.add_self_of_Y_eq; simp [W,Affine.negY]
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


end TunnellEvenInputTunnellCoates

/- # Rational points of infinite order on the congruent-number elliptic curve. -/

namespace TunnellEvenInputTunnellCoates

open WeierstrassCurve WeierstrassCurve.Affine
open OMA.R_CongruentNumber_Tunnell_even_R1


lemma xCoord_double {n x y : ℚ} (H : (⟨0,0,0,-n^2,0⟩ : WeierstrassCurve _).toAffine.Nonsingular x y) (hy : y ≠ 0) :
    (((2:ℕ) • (Affine.Point.some x y H)).xRep 0) = ((x^2+n^2)/(2*y))^2 := by
  have h := (E_equation n x y).mp H.1
  have hn : y ≠ (⟨0,0,0,-n^2,0⟩ : WeierstrassCurve _).toAffine.negY x y := by
    simp only [Affine.negY,zero_mul,sub_zero]
    exact fun e => hy (by linarith)
  rw [two_nsmul, Affine.Point.add_self_of_Y_ne hn]
  change (⟨0,0,0,-n^2,0⟩ : WeierstrassCurve _).toAffine.addX _ _ _ = _
  rw [Affine.slope_of_Y_ne rfl hn]
  simp only [Affine.addX, Affine.negY,zero_mul,mul_zero,add_zero,sub_zero]
  field_simp
  linear_combination -(32 * x) * h

lemma negative_coord_non_torsion {n : ℚ} (hn : padicValRat 2 n = 1)
    (P : (⟨0,0,0,-n^2,0⟩ : WeierstrassCurve _).toAffine.Point) (hp : padicValRat 2 (P.xRep 0) < 0) : ¬ IsOfFinAddOrder P := by
  intro hfin
  let M := AddSubmonoid.multiples P
  obtain ⟨Q,hQ,hmin⟩ := Set.exists_min_image (M : Set (⟨0,0,0,-n^2,0⟩ : WeierstrassCurve _).toAffine.Point)
    (fun R => padicValRat 2 (R.xRep 0)) hfin.finite_multiples ⟨P,AddSubmonoid.mem_multiples P⟩
  have hneg := (hmin P (AddSubmonoid.mem_multiples P)).trans_lt hp
  have hmin' := hmin (2 • Q) (M.nsmul_mem hQ 2)
  cases Q with
  | zero => change padicValRat 2 1 < 0 at hneg; norm_num at hneg
  | some x y H =>
    change padicValRat 2 x < 0 at hneg
    have hx0 : x ≠ 0 := by intro e; simp [e] at hneg
    have heq := (E_equation n x y).mp H.1
    have hy := y_ne_zero hn hx0 (by omega) heq
    rw [xCoord_double H hy, double_val hn (by omega) hy heq] at hmin'
    change padicValRat 2 x ≤ _ at hmin'
    omega

lemma infinite_order_of_infinite_coordinates (n : ℕ) (hn : n%8=2)
    (h : {p : ℚ × ℚ | p.2^2=p.1^3-(n : ℚ)^2*p.1}.Infinite) :
    ∃ P : (⟨0,0,0,-(n:ℚ)^2,0⟩ : WeierstrassCurve ℚ).toAffine.Point, ¬ IsOfFinAddOrder P := by
  have hn' := parameter_val hn
  have hn0 : (n : ℚ) ≠ 0 := by intro e; simp [e] at hn'
  have : (⟨0,0,0,-(n:ℚ)^2,0⟩ : WeierstrassCurve ℚ).IsElliptic := E_elliptic (by norm_num) hn0
  have hex : ∃ x y : ℚ, y ≠ 0 ∧ y^2=x^3-(n:ℚ)^2*x := by
    by_contra! hall
    have hsmall : {p : ℚ × ℚ | p.2^2=p.1^3-(n : ℚ)^2*p.1} ⊆
        {(0,0),((n:ℚ),0),(-(n:ℚ),0)} := by
      rintro ⟨x,y⟩ heq
      change y^2=x^3-(n : ℚ)^2*x at heq
      have hy : y=0 := by by_contra hy; exact hall x y hy heq
      subst y
      have hprod : x * (x-n)*(x+n) = 0 := by linear_combination -heq
      rcases (mul_eq_zero.mp hprod) with hnz|hnz
      · rcases (mul_eq_zero.mp hnz) with u|u
        · simp [u]
        · simp [sub_eq_zero.mp u]
      · simp [eq_neg_of_add_eq_zero_left hnz]
    exact h ((Set.toFinite _).subset hsmall)
  obtain ⟨x,y,hy,heq⟩ := hex
  let t := (x^2 + (n : ℚ)^2) / (2*y)
  have ht : t ≠ 0 := div_ne_zero (by positivity) (mul_ne_zero (by norm_num) hy)
  obtain ⟨v, hv⟩ := double_point hn0 hy heq
  change v^2 = (t^2)^3 - (n : ℚ)^2 * (t^2) at hv
  have hvt : padicValRat 2 (t^2) ≠ 1 := by rw [padicValRat.pow]; omega
  have hv0 := y_ne_zero hn' (pow_ne_zero 2 ht) hvt hv
  obtain ⟨w, hw⟩ := double_point hn0 hv0 hv
  let P := Affine.Point.mk ((E_equation _ _ _).mpr hw)
  refine ⟨P, negative_coord_non_torsion hn' P ?_⟩
  change padicValRat 2 ((( (t^2)^2+(n:ℚ)^2) / (2*v))^2) < 0
  rw [double_val hn' hvt hv0 hv]
  omega


end TunnellEvenInputTunnellCoates

/- # The real-period integral for the congruent-number family -/

namespace TunnellEvenInputTunnellCoates

open MeasureTheory Set Filter
open scoped Topology


theorem realPeriod_eq {n : ℝ} (hn : 0 < n) :
    (∫ x in Ioi (n:ℝ), (Real.sqrt (x^3-(n:ℝ)^2*x))⁻¹) = (∫ x in Ioi (1:ℝ), (Real.sqrt (x^3-(1:ℝ)^2*x))⁻¹) / Real.sqrt n := by
  let f := fun a x : ℝ => (Real.sqrt (x^3-a^2*x))⁻¹
  have hs : ∀ x : ℝ, f n (n*x) = (n * Real.sqrt n)⁻¹ * f 1 x := by
    intro x
    dsimp [f]
    rw [show (n*x)^3-n^2*(n*x) = (n^2 * n)*(x^3-1^2*x) by ring,
      Real.sqrt_mul (by positivity), Real.sqrt_mul (sq_nonneg n), Real.sqrt_sq hn.le]
    ring
  have ht := integral_comp_mul_left_Ioi' (f n) 1 hn
  simp only [mul_one, smul_eq_mul, hs, integral_const_mul] at ht
  change ∫ x in Ioi n, f n x = (∫ x in Ioi 1, f 1 x) / Real.sqrt n
  rw [← ht]
  field_simp

lemma realPeriod_one_pos : 0 < (∫ x in Ioi (1:ℝ), (Real.sqrt (x^3-(1:ℝ)^2*x))⁻¹) := by
  let f := fun x : ℝ => (Real.sqrt (x^3-x))⁻¹
  have hf : Measurable f := by dsimp [f]; fun_prop
  have hnear : IntegrableOn f (Ioc 1 2) := by
    have H := (intervalIntegral.intervalIntegrable_rpow' (a:=0) (b:=1)
      (by norm_num : (-1:ℝ) < -(1/2:ℝ))).comp_sub_right 1
    have HH : IntegrableOn (fun x : ℝ => (x-1)^(-(1/2):ℝ)) (Ioc 1 2) := by
      norm_num only [zero_add, one_add_one_eq_two] at H
      exact H.1
    apply Integrable.mono HH hf.aestronglyMeasurable
    filter_upwards [ae_restrict_mem measurableSet_Ioc] with x hx
    have hx1 : 0 < x-1 := sub_pos.mpr hx.1
    have hs : x-1 ≤ x^3-x := by
      nlinarith [mul_nonneg hx1.le (sq_nonneg x), sq_nonneg (x-1)]
    dsimp [f]
    rw [abs_of_nonneg (by positivity),
      abs_of_nonneg (Real.rpow_nonneg hx1.le _), Real.rpow_neg hx1.le, ← Real.sqrt_eq_rpow]
    exact inv_anti₀ (Real.sqrt_pos.mpr hx1) (Real.sqrt_le_sqrt hs)
  have hfar : IntegrableOn f (Ioi 2) := by
    have H := (integrableOn_Ioi_rpow_of_lt (c:=2) (by norm_num : -(3/2:ℝ) < -1)
      (by norm_num)).const_mul 2
    apply Integrable.mono H hf.aestronglyMeasurable
    filter_upwards [ae_restrict_mem measurableSet_Ioi] with x hx
    have hx2 : 2 < x := hx
    have hx0 : 0 < x := by linarith
    have hsq : x^3 ≤ 4*(x^3-x) := by nlinarith [mul_nonneg hx0.le (sq_nonneg (x-2))]
    have hroot := Real.sqrt_le_sqrt hsq
    rw [Real.sqrt_mul (by norm_num : (0:ℝ) ≤ 4)] at hroot
    norm_num at hroot
    have hpos : 0 < x^3-x := by nlinarith [pow_pos hx0 3]
    have he : x^(3/2:ℝ) = Real.sqrt (x^3) := by
      rw [Real.sqrt_eq_rpow, ← Real.rpow_natCast_mul hx0.le]
      norm_num
    dsimp [f]
    rw [abs_of_nonneg (by positivity),
      abs_of_nonneg (by positivity), Real.rpow_neg hx0.le, he]
    rw [← div_eq_mul_inv, ← one_div]
    apply (div_le_div_iff₀ (Real.sqrt_pos.mpr hpos) (Real.sqrt_pos.mpr (pow_pos hx0 3))).mpr
    simpa using hroot
  have hint : IntegrableOn f (Ioi 1) := by
    rw [← Ioc_union_Ioi_eq_Ioi (by norm_num : (1:ℝ) ≤ 2)]
    exact hnear.union hfar
  change 0 < ∫ x in Ioi 1, (Real.sqrt (x^3-1^2*x))⁻¹
  simp only [one_pow, one_mul]
  change 0 < ∫ x in Ioi 1, f x
  rw [setIntegral_pos_iff_support_of_nonneg_ae (.of_forall fun x => by dsimp [f]; positivity) hint]
  apply lt_of_lt_of_le (a := 0) (b := volume (Ioo (2:ℝ) 3)) (by simp <;> norm_num) (measure_mono ?_)
  intro x hx
  have hpos : 0 < x^3-x := by
    obtain ⟨ha,hb⟩ := hx
    nlinarith [mul_pos (by linarith : 0<x) (by nlinarith : 0 < x^2-1)]
  exact ⟨(inv_pos.mpr (Real.sqrt_pos.mpr hpos)).ne', by change 1 < x; have := hx.1; linarith⟩

theorem realPeriod_pos {n : ℝ} (hn : 0<n) : 0 < (∫ x in Ioi (n:ℝ), (Real.sqrt (x^3-(n:ℝ)^2*x))⁻¹) := by
  rw [realPeriod_eq hn]
  exact div_pos realPeriod_one_pos (Real.sqrt_pos.mpr hn)


end TunnellEvenInputTunnellCoates


/- # The congruent-number obstruction for twice a rational square -/

namespace TunnellEvenInputTunnellTwo

lemma rat_not_fermat42 {a b c : ℚ} (ha : a≠0) (hb : b≠0) : a^4+b^4 ≠ c^2 := by
  intro h
  let D : ℕ := a.den*b.den*c.den
  let A : ℤ := a.num*b.den*c.den
  let B : ℤ := a.den*b.num*c.den
  let C : ℤ := a.den*b.den*c.num*(D:ℤ)
  have ha' : (A:ℚ) = a*D := by
    dsimp [A,D]; push_cast
    rw [← Rat.mul_den_eq_num a]; ring
  have hb' : (B:ℚ) = b*D := by
    dsimp [B,D]; push_cast
    rw [← Rat.mul_den_eq_num b]; ring
  have hc' : (C:ℚ) = c*D^2 := by
    dsimp [C,D]; push_cast
    rw [← Rat.mul_den_eq_num c]; ring
  have hd : (D:ℚ) ≠ 0 := by dsimp [D]; positivity
  apply not_fermat_42 (a:=A) (b:=B) (c:=C)
    (fun hz => (mul_ne_zero ha hd) (by simpa [hz] using ha'.symm))
    (fun hz => (mul_ne_zero hb hd) (by simpa [hz] using hb'.symm))
  apply Int.cast_injective (α := ℚ)
  push_cast
  rw [ha',hb',hc']
  linear_combination (D:ℚ)^4*h

theorem no_area_twice_square {a b c t : ℚ} (ht : t≠0) (htri : a^2+b^2=c^2) :
    a*b ≠ 4*t^2 := by
  intro hab
  have ha : a≠0 := by intro hz; rw [hz,zero_mul] at hab; exact (by positivity : (4:ℚ)*t^2≠0) hab.symm
  apply rat_not_fermat42 (a:=a) (b:=2*t) (c:=a*c) ha (by positivity)
  linear_combination a^2*htri - (a*b+4*t^2)*hab

theorem not_congruentNumber_twice_square (t : ℕ) (ht : t≠0) :
    ¬ CongruentNumber.congruentNumber (2*t^2) := by
  rintro ⟨a,b,c,htri,harea⟩
  apply no_area_twice_square (t := (t:ℚ)) (by exact_mod_cast ht) htri
  push_cast at harea
  linear_combination -2*harea

theorem not_congruentNumber_two : ¬ CongruentNumber.congruentNumber 2 := by
  simpa using not_congruentNumber_twice_square 1 one_ne_zero


end TunnellEvenInputTunnellTwo

/- # Fermat descent for congruent numbers of the form 2p, where p = 5 mod 8 -/

namespace TunnellEvenInputTunnellPrimeFive

lemma sq_coprime_left {a b : ℕ} (hc : a.Coprime b) (hs : IsSquare (a*b)) : IsSquare a := by
  obtain ⟨r,hr⟩ := hs
  obtain ⟨t,ht⟩ := exists_eq_pow_of_mul_eq_pow
    (by change IsUnit (a.gcd b); rw [hc.gcd_eq_one]; simp : IsUnit (gcd a b))
    (by simpa [sq] using hr : a*b = r^2)
  exact ⟨t,by simpa [sq] using ht⟩

lemma extract {a b q u : ℕ} (hc : a.Coprime b) (hq : q.Coprime b) (hu : a.Coprime u)
    (hqu : q.Coprime u) (h : IsSquare (q*u*(a*b))) : IsSquare (q*a) := by
  apply sq_coprime_left (b:=u*b)
  · exact (hqu.mul_right hq).mul_left (hu.mul_right hc)
  · convert h using 1 <;> ring

lemma prime_cofactor {q x : ℕ} (hq : q.Prime) (h : IsSquare (q*x)) : ∃ t, x=q*t^2 := by
  obtain ⟨r,hr⟩ := h
  have hqr : q ∣ r := hq.dvd_of_dvd_pow (n:=2) (by rw [sq,←hr]; simp)
  obtain ⟨t,rfl⟩ := hqr
  exact ⟨t, Nat.eq_of_mul_eq_mul_left hq.pos (by linear_combination hr)⟩

lemma odd_factor {p a b : ℕ} (hp : p.Prime) (hp2 : p≠2) (ha : a%2=1)
    (hc : a.Coprime b) (h : IsSquare (2*p*(a*b))) :
    (¬ p ∣ a → IsSquare a) ∧ (p ∣ a → ∃ t, a=p*t^2) := by
  have h2a := (Nat.prime_two.coprime_iff_not_dvd.mpr (by omega : ¬ 2 ∣ a)).symm
  have hp2' := hp.coprime_iff_not_dvd.mpr (fun h => hp2 ((Nat.prime_dvd_prime_iff_eq hp Nat.prime_two).mp h))
  constructor
  · intro hpa
    apply sq_coprime_left (b:=2*p*b)
    · exact ((h2a.mul_right (hp.coprime_iff_not_dvd.mpr hpa).symm).mul_right hc)
    · convert h using 1 <;> ring
  · intro hpa
    apply prime_cofactor hp
    apply extract hc (hc.of_dvd_left hpa) h2a hp2'
    convert h using 1 <;> ring

lemma odd_factor_mod4 {p a b : ℕ} (hp : p.Prime) (hmod : p%8=5)
    (ha : a%2=1) (hc : a.Coprime b) (h : IsSquare (2*p*(a*b))) :
    a%4=1 := by
  have H := odd_factor hp (by omega) ha hc h
  suffices HH : a%4=0 ∨ a%4=1 by omega
  rcases em (p ∣ a) with hd|hd
  · obtain ⟨t,rfl⟩ := H.2 hd
    have hg : p%4=1 := by omega
    rw [Nat.mul_mod, Nat.pow_mod, hg]
    have ht : t%4<4 := Nat.mod_lt _ (by decide)
    interval_cases t%4 <;> decide
  · obtain ⟨t,rfl⟩ := H.1 hd
    rw [Nat.mul_mod]
    have ht : t%4<4 := Nat.mod_lt _ (by decide)
    interval_cases t%4 <;> decide

lemma eq_mul_square_two {p a b : ℕ} (hp : p.Prime) (ha : 2∣a) (hp2 : p ≠ 2)
    (hc : a.Coprime b) (hpa : ¬p∣a) (h : IsSquare (2*p*(a*b))) : ∃ t, a=2*t^2 :=
  prime_cofactor Nat.prime_two (extract hc (hc.of_dvd_left ha)
    (hp.coprime_iff_not_dvd.mpr hpa).symm ((Nat.prime_dvd_prime_iff_eq Nat.prime_two hp).not.mpr hp2.symm
      |> Nat.prime_two.coprime_iff_not_dvd.mpr) h)

lemma nonsquare_even {p s v : ℕ} (hp : p.Prime) (hmod : p%8=5)
    (h : s=2*v^2) (hs : ¬p∣s) : letI : Fact p.Prime := ⟨hp⟩; ¬IsSquare (s:ZMod p) := by
  have : Fact p.Prime := ⟨hp⟩
  intro hw
  have h2 : ¬ IsSquare (2:ZMod p) := by rw [ZMod.exists_sq_eq_two_iff (by omega)]; omega
  have hv : (v : ZMod p) ≠ 0 := by
    rw [Ne, ZMod.natCast_eq_zero_iff]
    exact fun hv => hs (h ▸ dvd_mul_of_dvd_right (dvd_pow hv  (by decide : 2 ≠ 0)) 2)
  apply h2
  obtain ⟨w, hw⟩ := hw
  have he : (s:ZMod p) = 2*(v:ZMod p)^2 := by simp [h]
  refine ⟨w/(v:ZMod p), ?_⟩
  field_simp
  linear_combination -(hw.symm.trans he)

lemma factor_discrimination {p r s : ℕ} (hp : p.Prime) (hmod : p%8=5) (hrs : s < r)
    (hcop : r.Coprime s) (hpar : r%2 ≠ s%2)
    (h : IsSquare (2*p*(r*s*(r-s)*(r+s)))) :
    IsSquare r ∧ IsSquare (r-s) ∧ IsSquare (r+s) ∧ IsSquare (2*p*s) := by
  let l := r-s
  let u := r+s
  have hl : l+s=r := by dsimp [l]; omega
  have hu : u=r+s := rfl
  have h2l : l%2=1 := by omega
  have h2u : u%2=1 := by omega
  have crl : r.Coprime l := (Nat.coprime_self_sub_right hrs.le).2 hcop
  have csl : s.Coprime l := (Nat.coprime_sub_self_right hrs.le).2 hcop.symm
  have cru : r.Coprime u := by simpa [u] using hcop
  have csu : s.Coprime u := by simpa [u] using hcop.symm
  have clu : l.Coprime u := by
    have he : u=l+2*s := by omega
    have h2 := (Nat.prime_two.coprime_iff_not_dvd.mpr (by omega : ¬2∣l)).symm
    simpa [he] using h2.mul_right csl.symm
  have Hr := hcop.mul_right (crl.mul_right cru)
  have Hs := hcop.symm.mul_right (csl.mul_right csu)
  have Hl := crl.symm.mul_right (csl.symm.mul_right clu)
  have Hu := cru.symm.mul_right (csu.symm.mul_right clu.symm)
  change IsSquare (2*p*(r*s*l*u)) at h
  have sr : IsSquare (2*p*(r*(s*(l*u)))) := by convert h using 1; ring
  have ss : IsSquare (2*p*(s*(r*(l*u)))) := by convert h using 1; ring
  have sl : IsSquare (2*p*(l*(r*(s*u)))) := by convert h using 1; ring
  have su : IsSquare (2*p*(u*(r*(s*l)))) := by convert h using 1; ring
  have ml := odd_factor_mod4 hp hmod h2l Hl sl
  have mu := odd_factor_mod4 hp hmod h2u Hu su
  have hr : r%2=1 := by omega
  have hs : 2∣s := by omega
  have ep : p≠2 := by omega
  have orr := (odd_factor hp ep hr Hr sr).1
  have ol := (odd_factor hp ep h2l Hl sl).1
  have ou := (odd_factor hp ep h2u Hu su).1
  have hsP : p∣s := by
    by_contra hsp
    obtain ⟨v,hv⟩ := eq_mul_square_two hp hs ep Hs hsp ss
    have : Fact p.Prime := ⟨hp⟩
    have bad := nonsquare_even hp hmod hv hsp
    have hd : p ∣ 2*(r*s*l*u) := by
      have h' : IsSquare (p*(2*(r*s*l*u))) := by convert h using 1; ring
      obtain ⟨w,hw⟩ := prime_cofactor hp h'
      exact hw ▸ dvd_mul_right p _
    have hpr := (hp.dvd_mul.mp hd).resolve_left (fun e => ep ((Nat.prime_dvd_prime_iff_eq hp Nat.prime_two).mp e))
    have hcontra (a b : ℕ) (hab : a.Coprime b) (hpa : p∣a) : ¬p∣b :=
      fun hpb => hp.not_dvd_one (hab.gcd_eq_one ▸ Nat.dvd_gcd hpa hpb)
    have cast_square {a : ℕ} (ha : IsSquare a) : IsSquare (a:ZMod p) := by
      obtain ⟨w,rfl⟩ := ha
      exact ⟨w, by simp⟩
    have cast_l : (l:ZMod p)+(s:ZMod p)=(r:ZMod p) := by rw [← Nat.cast_add,hl]
    have cast_u : (u:ZMod p)=(r:ZMod p)+(s:ZMod p) := by rw [hu,Nat.cast_add]
    apply bad
    rcases hp.dvd_mul.mp hpr with hrl|hpu
    · rcases hp.dvd_mul.mp hrl with hrs'|hpl
      · have hpr := (hp.dvd_mul.mp hrs').resolve_right hsp
        have hz := (ZMod.natCast_eq_zero_iff _ _).2 hpr
        rw [hz,zero_add] at cast_u
        rw [← cast_u]
        exact cast_square (ou (hcontra _ _ cru hpr))
      · have hz := (ZMod.natCast_eq_zero_iff _ _).2 hpl
        rw [hz,zero_add] at cast_l
        rw [cast_l]
        exact cast_square (orr (hcontra _ _ crl.symm hpl))
    · have hz := (ZMod.natCast_eq_zero_iff _ _).2 hpu
      have hneg : (s:ZMod p) = -1*(r:ZMod p) := by linear_combination hz-cast_u
      rw [hneg]
      exact ((ZMod.exists_sq_eq_neg_one_iff (p:=p)).2 (by omega)).mul (cast_square (orr (hcontra _ _ cru.symm hpu)))
  have hother {a : ℕ} (hc : s.Coprime a) : ¬p∣a := fun hpa =>
    hp.not_dvd_one (hc.gcd_eq_one ▸ Nat.dvd_gcd hsP hpa)
  refine ⟨orr (hother hcop.symm),ol (hother csl),ou (hother csu),?_⟩
  have hcp := (Hs.of_dvd_left hs).mul_left (Hs.of_dvd_left hsP)
  apply sq_coprime_left (b:=r*(l*u))
  · exact hcp.mul_left Hs
  · convert ss using 1; ring

lemma from_natural {p a b z : ℕ} (ha : 0 < a) (hb : 0 < b)
    (htri : a^2+b^2=z^2) (hsq : IsSquare (p*a*b)) :
    ∃ a' b' z' : ℕ, 0<a' ∧ 0<b' ∧ a'.Coprime b' ∧
      a'^2+b'^2=z'^2 ∧ IsSquare (p*a'*b') ∧ z'≤z := by
  let g := a.gcd b
  have hg : 0<g := Nat.gcd_pos_of_pos_left _ ha
  have hgA : g∣a := Nat.gcd_dvd_left _ _
  have hgB : g∣b := Nat.gcd_dvd_right _ _
  have hgZ : g∣z := by
    have hp : PythagoreanTriple (a:ℤ) b z := by unfold PythagoreanTriple; exact_mod_cast (by simpa [sq] using htri : a*a+b*b=z*z)
    exact_mod_cast hp.gcd_dvd
  let A := a/g
  let B := b/g
  let Z := z/g
  have ha' : A*g=a := Nat.div_mul_cancel hgA
  have hb' : B*g=b := Nat.div_mul_cancel hgB
  have hz' : Z*g=z := Nat.div_mul_cancel hgZ
  refine ⟨A,B,Z, Nat.div_pos (Nat.le_of_dvd ha hgA) hg,
    Nat.div_pos (Nat.le_of_dvd hb hgB) hg, Nat.coprime_div_gcd_div_gcd hg, ?_, ?_, Nat.div_le_self _ _⟩
  · apply Nat.eq_of_mul_eq_mul_right (show 0<g^2 by positivity)
    rw [←ha',←hb',←hz'] at htri
    linear_combination htri
  · rw [← Rat.isSquare_natCast_iff]
    obtain ⟨q,hq⟩ := hsq
    have hqr : ((p:ℚ)*A*B) * (g:ℚ)^2 = (q:ℚ)^2 := by
      rw [←ha',←hb'] at hq
      exact_mod_cast (by linear_combination hq : p*A*B*g^2 = q^2)
    refine ⟨(q:ℚ)/g, ?_⟩
    push_cast
    field_simp
    linear_combination hqr

lemma descend_params {p r s : ℕ} (hp : p.Prime) (hmod : p%8=5) (hs : 0<s)
    (hrs : s < r) (hcop : r.Coprime s) (hpar : r%2 ≠ s%2)
    (h : IsSquare (2*p*(r*s*(r-s)*(r+s)))) :
    ∃ z' < r^2+s^2, (∃ a b : ℕ, 0 < a ∧ 0 < b ∧ a^2+b^2=z'^2 ∧ IsSquare (p*a*b)) := by
  obtain ⟨⟨R,hR⟩,⟨L,hL⟩,⟨U,hU⟩,hsq⟩ := factor_discrimination hp hmod hrs hcop hpar h
  have hl : L^2+s=r := by rw [sq,← hL]; omega
  have hu : U^2=r+s := by simpa [sq] using hU.symm
  have hUL : L<U := by
    by_contra! hh
    have hh' := Nat.pow_le_pow_left hh 2
    omega
  have hrr : R≤r := by nlinarith [Nat.le_mul_self R]
  have hlt : 2*R < r^2+s^2 := by
    have h := Nat.mul_le_mul_right r (show 2 ≤ r by omega)
    nlinarith [sq_pos_of_pos hs]
  refine ⟨2*R,hlt,U-L,U+L,by omega,by omega,?_,?_⟩
  · zify [hUL.le] at *
    nlinarith
  · convert hsq using 1
    zify [hUL.le] at *
    linear_combination (p:ℤ)*(hu-hl)

lemma descend_odd_leg {p a b z : ℕ} (hp : p.Prime) (hmod : p%8=5)
    (ha : 0<a) (hb : 0<b) (hcop : a.Coprime b) (htri : a^2+b^2=z^2)
    (hsq : IsSquare (p*a*b)) (haodd : (a:ℤ)%2=1) :
    ∃ z' < z, (∃ a b : ℕ, 0 < a ∧ 0 < b ∧ a^2+b^2=z'^2 ∧ IsSquare (p*a*b)) := by
  have ht : PythagoreanTriple (a:ℤ) b z := by
    unfold PythagoreanTriple
    exact_mod_cast (by simpa [sq] using htri : a*a+b*b=z*z)
  have hc : Int.gcd (a:ℤ) (b:ℤ) = 1 := hcop
  have hz : 0< (z:ℤ) := by exact_mod_cast (by nlinarith [sq_pos_of_pos ha] : 0<z)
  obtain ⟨m,k,h1,h2,h3,hc',hpar,hm⟩ := ht.coprime_classification' hc haodd hz
  have hkp : 0 < k := by
    by_contra! hh
    have hy : 0 < (b:ℤ) := by exact_mod_cast hb
    nlinarith [mul_nonpos_of_nonneg_of_nonpos hm hh]
  lift m to ℕ using hm
  lift k to ℕ using hkp.le
  have hm' : k < m := by
    by_contra! hh
    have hi := Nat.pow_le_pow_left hh 2
    have hi' : (m:ℤ)^2 ≤ (k:ℤ)^2 := by exact_mod_cast hi
    omega
  have h1' : (a:ℤ) = (m:ℤ)^2-k^2 := h1
  have ha' : a=(m-k)*(m+k) := by zify [hm'.le]; nlinarith
  have hb' : b=2*m*k := by exact_mod_cast h2
  have hz' : z=m^2+k^2 := by exact_mod_cast h3
  have hc'' : m.Coprime k := hc'
  have hn : m%2 ≠ k%2 := by omega
  have hs : IsSquare (2*p*(m*k*(m-k)*(m+k))) := by
    convert hsq using 1
    rw [ha',hb']
    ring
  rw [hz']
  exact descend_params hp hmod (by exact_mod_cast hkp) hm' hc'' hn hs

lemma no_triangle {p : ℕ} (hp : p.Prime) (hmod : p%8=5) (z : ℕ) : ¬(∃ a b : ℕ, 0 < a ∧ 0 < b ∧ a^2+b^2=z^2 ∧ IsSquare (p*a*b)) := by
  induction z using Nat.strong_induction_on with
  | h z ih =>
    rintro ⟨a,b,ha,hb,htri,hsq⟩
    obtain ⟨A,B,Z,ha',hb',hc',ht',hs',hz'⟩ := from_natural ha hb htri hsq
    have ht : PythagoreanTriple (A:ℤ) B Z := by
      unfold PythagoreanTriple
      exact_mod_cast (by simpa [sq] using ht' : A*A+B*B=Z*Z)
    have hc : Int.gcd (A:ℤ) (B:ℤ) = 1 := hc'
    obtain ⟨z',hlt,hT⟩ : ∃ z' < Z, (∃ a b : ℕ, 0 < a ∧ 0 < b ∧ a^2+b^2=z'^2 ∧ IsSquare (p*a*b)) := by
      rcases ht.even_odd_of_coprime hc with h|h
      · exact descend_odd_leg hp hmod hb' ha' hc'.symm (by simpa [add_comm] using ht')
          (by simpa [mul_comm, mul_left_comm, mul_assoc] using hs') h.2
      · exact descend_odd_leg hp hmod ha' hb' hc' ht' hs' h.1
    exact ih z' (lt_of_lt_of_le hlt hz') hT

lemma triangle_of_congruent_double_prime {p : ℕ} (hp : p.Prime)
    (hc : CongruentNumber.congruentNumber (2*p)) : ∃ z, (∃ a b : ℕ, 0 < a ∧ 0 < b ∧ a^2+b^2=z^2 ∧ IsSquare (p*a*b)) := by
  obtain ⟨a,b,c,ht,harea⟩ := hc
  have harea' : a*b=4*(p:ℚ) := by push_cast at harea; linear_combination -2*harea
  have hp' : (p:ℚ) ≠ 0 := by exact_mod_cast hp.ne_zero
  have ha : a ≠ 0 := by intro e; simp [e,hp'] at harea'
  have hb : b ≠ 0 := by intro e; simp [e,hp'] at harea'
  let D : ℕ := a.den*b.den*c.den
  let A : ℤ := a.num*b.den*c.den
  let B : ℤ := a.den*b.num*c.den
  let C : ℤ := a.den*b.den*c.num
  have ha' : (A:ℚ) = a*D := by dsimp [A,D]; push_cast; rw [← Rat.mul_den_eq_num]; ring
  have hb' : (B:ℚ) = b*D := by dsimp [B,D]; push_cast; rw [← Rat.mul_den_eq_num]; ring
  have hc' : (C:ℚ) = c*D := by dsimp [C,D]; push_cast; rw [← Rat.mul_den_eq_num]; ring
  have hd : (D:ℚ) ≠ 0 := by dsimp [D]; positivity
  have hA : A≠0 := fun e => mul_ne_zero ha hd (by simpa [e] using ha'.symm)
  have hB : B≠0 := fun e => mul_ne_zero hb hd (by simpa [e] using hb'.symm)
  have htri : A^2+B^2=C^2 := by
    apply Int.cast_injective (α:=ℚ)
    push_cast
    rw [ha',hb',hc']
    linear_combination (D:ℚ)^2*ht
  have hsq : (p:ℤ)*A*B=(2*p*D:ℤ)^2 := by
    apply Int.cast_injective (α:=ℚ)
    push_cast
    rw [ha',hb']
    linear_combination (p:ℚ)*(D:ℚ)^2*harea'
  refine ⟨C.natAbs,A.natAbs,B.natAbs,Int.natAbs_pos.mpr hA,Int.natAbs_pos.mpr hB,?_,?_⟩
  · zify
    simpa using htri
  · refine ⟨(2*p*D:ℤ).natAbs, ?_⟩
    simpa [sq, Int.natAbs_mul] using congrArg Int.natAbs hsq

theorem not_congruentNumber_two_mul_prime {p : ℕ} (hp : p.Prime) (hmod : p%8=5) :
    ¬ CongruentNumber.congruentNumber (2*p) := by
  intro hc
  obtain ⟨z,hz⟩ := triangle_of_congruent_double_prime hp hc
  exact no_triangle hp hmod z hz


end TunnellEvenInputTunnellPrimeFive

/- # Excluding the elementary non-congruent families from the global rank implication -/

namespace TunnellEvenInputTunnellCoates

open WeierstrassCurve WeierstrassCurve.Affine CongruentNumber

lemma exists_positive_triangle_of_nontorsion {n : ℕ} (hn : 0<n)
    (P : (⟨0,0,0,-(n:ℚ)^2,0⟩ : WeierstrassCurve ℚ).toAffine.Point) (hP : ¬IsOfFinAddOrder P) :
    ∃ a b c : ℚ, 0<a ∧ 0<b ∧ 0<c ∧ a^2+b^2=c^2 ∧ (n:ℚ)=(2:ℚ)⁻¹*a*b := by
  cases P with
  | zero => exact False.elim (hP (isOfFinAddOrder_iff_nsmul_eq_zero.mpr ⟨1,by decide,rfl⟩))
  | some x y H =>
    have heq := (E_equation (n:ℚ) x y).mp H.1
    have hy : y ≠ 0 := by
      rintro rfl
      apply hP
      apply isOfFinAddOrder_iff_nsmul_eq_zero.mpr ⟨2,by decide,?_⟩
      rw [two_nsmul]
      apply Affine.Point.add_self_of_Y_eq
      simp [Affine.negY]
    let a := (x^2-(n:ℚ)^2)/y
    let b := 2*n*x/y
    let c := (x^2+(n:ℚ)^2)/y
    have ht : a^2+b^2=c^2 := by dsimp [a,b,c]; field_simp; ring
    have harea : a*b=2*n := by
      dsimp [a,b]
      field_simp
      linear_combination -heq
    have hab : 0 < a*b := by rw [harea]; positivity
    have ha : a≠0 := (mul_ne_zero_iff.mp hab.ne').1
    have hb : b≠0 := (mul_ne_zero_iff.mp hab.ne').2
    have hc : c≠0 := by intro h; rw [h,zero_pow (by decide),add_eq_zero_iff_of_nonneg (sq_nonneg a) (sq_nonneg b)] at ht; exact (pow_ne_zero 2 ha) ht.1
    refine ⟨|a|,|b|,|c|,abs_pos.mpr ha,abs_pos.mpr hb,abs_pos.mpr hc,by simpa,?_⟩
    rw [mul_assoc,← abs_mul,abs_of_pos hab,harea]
    ring

lemma congruent_of_nontorsion {n : ℕ} (hn : 0<n)
    (P : (⟨0,0,0,-(n:ℚ)^2,0⟩ : WeierstrassCurve ℚ).toAffine.Point) (hP : ¬IsOfFinAddOrder P) :
    congruentNumber n := by
  obtain ⟨a,b,c,_,_,_,ht,ha⟩ := exists_positive_triangle_of_nontorsion hn P hP
  exact ⟨a,b,c,ht,ha⟩


theorem finite_coordinates_elementary (n : ℕ) (hn : n%8=2) (he : n=2 ∨ ∃ p : ℕ, p.Prime ∧ p%8=5 ∧ n=2*p) :
    {p : ℚ × ℚ | p.2^2=p.1^3-(n:ℚ)^2*p.1}.Finite := by
  by_contra h
  obtain ⟨P,hP⟩ := infinite_order_of_infinite_coordinates n hn h
  have hc := congruent_of_nontorsion (by omega : 0<n) P hP
  rcases he with rfl|⟨p,hp,hm,rfl⟩
  · exact TunnellEvenInputTunnellTwo.not_congruentNumber_two hc
  · exact TunnellEvenInputTunnellPrimeFive.not_congruentNumber_two_mul_prime hp hm hc

end TunnellEvenInputTunnellCoates

namespace TunnellEvenRankReduction

open TunnellEvenInputTunnellCoates MeasureTheory Set WeierstrassCurve

def H1 : Prop :=
  ∀ n : ℕ, Squarefree n → n%8=2 →
    ¬ (n=2 ∨ ∃ p : ℕ, p.Prime ∧ p%8=5 ∧ n=2*p) → ∀ L : ℂ → ℂ, (AnalyticOnNhd ℂ L Set.univ ∧ ∀ s : ℝ, 2 < s →
    HasProd (fun p : Nat.Primes =>
      if p.val ∣ 2*n then (1 : ℂ) else
        letI : NeZero p.val := ⟨p.property.ne_zero⟩
        let a : ℤ := (p.val : ℤ) - (Finset.univ.filter (fun xy : ZMod p.val × ZMod p.val =>
          xy.2^2=xy.1^3-(n : ZMod p.val)^2*xy.1)).card
        let T : ℂ := (p.val : ℂ)^(-(s : ℂ))
        (1-(a:ℂ)*T+(p.val:ℂ)*T^2)⁻¹) (L s)) →
    ∃ r : ℚ, L 1 = (r:ℂ) * (((∫ x in Ioi (1:ℝ), (Real.sqrt (x^3-(1:ℝ)^2*x))⁻¹) : ℝ) : ℂ) / (Real.sqrt n : ℂ)

/-- The special-value divisibility supplied by the arithmetic of elliptic units and division
fields: at every sufficiently large split non-anomalous ordinary prime, the algebraic critical
value vanishes in the residue field. -/
def H2 : Prop :=
  ∀ n : ℕ, Squarefree n → n%8=2 →
    ¬ (n=2 ∨ ∃ p : ℕ, p.Prime ∧ p%8=5 ∧ n=2*p) → ∀ P : (⟨0,0,0,-(n:ℚ)^2,0⟩ : WeierstrassCurve ℚ).toAffine.Point, ¬ IsOfFinAddOrder P →
    ∀ L : ℂ → ℂ, (AnalyticOnNhd ℂ L Set.univ ∧ ∀ s : ℝ, 2 < s →
    HasProd (fun p : Nat.Primes =>
      if p.val ∣ 2*n then (1 : ℂ) else
        letI : NeZero p.val := ⟨p.property.ne_zero⟩
        let a : ℤ := (p.val : ℤ) - (Finset.univ.filter (fun xy : ZMod p.val × ZMod p.val =>
          xy.2^2=xy.1^3-(n : ZMod p.val)^2*xy.1)).card
        let T : ℂ := (p.val : ℂ)^(-(s : ℂ))
        (1-(a:ℂ)*T+(p.val:ℂ)*T^2)⁻¹) (L s)) → ∀ r : ℚ, L 1 = (r:ℂ)*(((∫ x in Ioi (n:ℝ), (Real.sqrt (x^3-(n:ℝ)^2*x))⁻¹) : ℝ) : ℂ) →
      ∃ B : ℕ, ∀ p : ℕ, ∀ hp : p.Prime, B<p → p%4=1 → ¬ p ∣ 2*n →
        (letI : Fact p.Prime := ⟨hp⟩
         let N := (Finset.univ.filter (fun xy : ZMod p × ZMod p =>
           xy.2^2=xy.1^3-(n : ZMod p)^2*xy.1)).card
         (¬ p ∣ N+1) ∧ ¬ (p : ℤ) ∣ (p : ℤ)-(N : ℤ)) → p ∣ r.num.natAbs

theorem main : H1 → H2 → OMA.R_CongruentNumber_Tunnell_even_R1.H2 := by
  intro hr hd n hsq hn hcoords L hL
  have hremaining : ¬ (n=2 ∨ ∃ p : ℕ, p.Prime ∧ p%8=5 ∧ n=2*p) :=
    fun he => hcoords (finite_coordinates_elementary n hn he)
  obtain ⟨P,hP⟩ := infinite_order_of_infinite_coordinates n hn hcoords
  obtain ⟨r,hrat⟩ := hr n hsq hn hremaining L hL
  have hrn : L 1 = (r:ℂ)*(((∫ x in Ioi (n:ℝ), (Real.sqrt (x^3-(n:ℝ)^2*x))⁻¹) : ℝ):ℂ) := by
    have hpos : 0 < (n:ℝ) := by exact_mod_cast (show 0<n by omega)
    rw [realPeriod_eq hpos, hrat]
    push_cast
    ring
  obtain ⟨B,hB⟩ := hd n hsq hn hremaining P hP L hL r hrn
  obtain ⟨p,hp,hgt,hmod,hgood,haux⟩ := exists_aux_prime (n := n) (by omega) (max B r.num.natAbs)
  have hdiv := hB p hp (by omega) hmod hgood haux
  have hz : r.num.natAbs = 0 := by
    by_contra! h
    exact (Nat.not_dvd_of_pos_of_lt (Nat.pos_of_ne_zero h) (by omega)) hdiv
  have hrz : r=0 := by simpa using hz
  simp [hrz] at hrat
  exact hrat

end TunnellEvenRankReduction

#print axioms TunnellEvenRankReduction.main
