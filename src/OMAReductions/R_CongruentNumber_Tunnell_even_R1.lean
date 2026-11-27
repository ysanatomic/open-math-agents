import FormalConjectures.Wikipedia.CongruentNumber
import Mathlib.Combinatorics.Enumerative.Pentagonal.PowerSeries

/-!
# The even case of Tunnell's theorem

For d = n / 2, the coefficient b(d) of Tunnell's eta product times theta_4
satisfies 2 b(d) = 2 |C(n)| - |D(n)| for every n congruent to 2 modulo 4.
We prove the counting formula from Euler's pentagonal theorem below.
When n is 6 modulo 8, both representation sets are empty.

The remaining statements supply a weight-two modular form for the congruent-number
curve, apply Coates–Wiles to infinitely many rational points, and relate the central
value to b(d). We prove the infinitude of rational points by 2-adic descent and
construct the entire L-function from the modular form's Fourier coefficients. The good Euler factors
use the number of affine points. The bad primes dividing 2n have factor one.
See J. B. Tunnell, A classical Diophantine problem and modular forms of
weight 3/2, Invent. Math. 72 (1983), 323–334, Theorems 1, 3 and 4.
-/

namespace OMA.R_CongruentNumber_Tunnell_even_R1

open CongruentNumber

open MatrixGroups UpperHalfPlane Finset

-- Modularity and the Hecke relations for quadratic twists of the curve y² = x³ − x.
def H1 : Prop :=
  ∀ n : ℕ, Squarefree n → n % 8 = 2 →
  ∃ Γ : Subgroup (GL (Fin 2) ℝ), Γ.IsArithmetic ∧ Γ.strictWidthInfty = 1 ∧
    ∃ F : CuspForm Γ 2,
    let a := fun m : ℕ => (qExpansion 1 F).coeff m
    a 1 = 1 ∧
    (∀ i j : ℕ, i.Coprime j → a (i*j) = a i * a j) ∧
    (∀ p : Nat.Primes, p.val ∣ 2*n → ∀ r : ℕ, a (p.val^(r+1)) = 0) ∧
    (∀ p : Nat.Primes, ¬ p.val ∣ 2*n →
      letI : Fact p.val.Prime := ⟨p.property⟩
      let baseTrace : ℤ := (p.val : ℤ) - (Finset.univ.filter
        (fun xy : ZMod p.val × ZMod p.val => xy.2 ^ 2 = xy.1 ^ 3 - xy.1)).card
      a p.val = ((quadraticChar (ZMod p.val) (n : ZMod p.val) * baseTrace : ℤ) : ℂ)) ∧
    (∀ p : Nat.Primes, ¬ p.val ∣ 2*n → ∀ r : ℕ,
      a (p.val^(r+2)) = a p.val * a (p.val^(r+1)) - (p.val : ℂ)*a (p.val^r))

open scoped PowerSeries.WithPiTopology

-- Coates–Wiles for the congruent-number curve with infinitely many rational points.
def H2 : Prop :=
  ∀ n : ℕ, Squarefree n → n % 8 = 2 →
    {p : ℚ × ℚ | p.2 ^ 2 = p.1 ^ 3 - (n : ℚ) ^ 2 * p.1}.Infinite →
    ∀ L : ℂ → ℂ,
    (AnalyticOnNhd ℂ L Set.univ ∧ ∀ s : ℝ, 2 < s →
      HasProd (fun p : Nat.Primes =>
        if p.val ∣ 2 * n then (1 : ℂ) else
          letI : NeZero p.val := ⟨p.property.ne_zero⟩
          let a : ℤ := (p.val : ℤ) - (Finset.univ.filter (fun xy : ZMod p.val × ZMod p.val =>
            xy.2 ^ 2 = xy.1 ^ 3 - (n : ZMod p.val) ^ 2 * xy.1)).card
          let T : ℂ := (p.val : ℂ) ^ (-(s : ℂ))
          (1 - (a : ℂ) * T + (p.val : ℂ) * T ^ 2)⁻¹) (L s)) → L 1 = 0

-- The vanishing implication in Tunnell's central-value formula (Theorem 3).
-- The coefficient is taken in the formal series of the eta product times theta_4.
def H3 : Prop :=
  ∀ n : ℕ, Squarefree n → n % 8 = 2 → ∀ L : ℂ → ℂ,
    (AnalyticOnNhd ℂ L Set.univ ∧ ∀ s : ℝ, 2 < s →
      HasProd (fun p : Nat.Primes =>
        if p.val ∣ 2 * n then (1 : ℂ) else
          letI : NeZero p.val := ⟨p.property.ne_zero⟩
          let a : ℤ := (p.val : ℤ) - (Finset.univ.filter (fun xy : ZMod p.val × ZMod p.val =>
            xy.2 ^ 2 = xy.1 ^ 3 - (n : ZMod p.val) ^ 2 * xy.1)).card
          let T : ℂ := (p.val : ℂ) ^ (-(s : ℂ))
          (1 - (a : ℂ) * T + (p.val : ℂ) * T ^ 2)⁻¹) (L s)) → L 1 = 0 →
    let X : PowerSeries ℤ := PowerSeries.X
    PowerSeries.coeff (n / 2) (X *
      (∏' k : ℕ, (1 - X ^ (8 * (k + 1)))) *
      (∏' k : ℕ, (1 - X ^ (16 * (k + 1)))) *
      (1 + 2 * ∑' k : ℕ, X ^ (4 * (k + 1) ^ 2))) = 0

lemma trace_eq_neg_sum (n : ℕ) (p : Nat.Primes) [Fact p.val.Prime] (hp : p.val ≠ 2) :
    ((p.val : ℤ) - (Finset.univ.filter (fun xy : ZMod p.val × ZMod p.val =>
        xy.2^2 = xy.1^3 - (n : ZMod p.val)^2 * xy.1)).card) =
      - ∑ x : ZMod p.val, quadraticChar (ZMod p.val) (x^3 - (n : ZMod p.val)^2*x) := by
  let f (x : ZMod p.val) := x^3 - (n : ZMod p.val)^2*x
  have hc : ringChar (ZMod p.val) ≠ 2 := by simpa only [ZMod.ringChar_zmod_n] using hp
  have hf (x : ZMod p.val) : ((univ.filter fun y : ZMod p.val => y^2=f x).card : ℤ) =
      quadraticChar (ZMod p.val) (f x) + 1 := by
    simpa using quadraticChar_card_sqrts hc (f x)
  change (p.val : ℤ) - ((univ.filter fun xy : ZMod p.val × ZMod p.val =>
    xy.2^2 = f xy.1).card : ℤ) = - ∑ x : ZMod p.val, quadraticChar (ZMod p.val) (f x)
  rw [Finset.card_filter, Fintype.sum_prod_type]
  simp only [← Finset.card_filter, Nat.cast_sum, hf, Finset.sum_add_distrib]
  simp [ZMod.card]

theorem traceOfFrobenius_twist (n : ℕ) (p : Nat.Primes) [Fact p.val.Prime]
    (hp : p.val ≠ 2) (hn : ¬ p.val ∣ n) :
    ((p.val : ℤ) - (Finset.univ.filter (fun xy : ZMod p.val × ZMod p.val =>
        xy.2^2 = xy.1^3 - (n : ZMod p.val)^2 * xy.1)).card) = quadraticChar (ZMod p.val) (n : ZMod p.val) * ((p.val : ℤ) - (Finset.univ.filter (fun xy : ZMod p.val × ZMod p.val =>
        xy.2^2 = xy.1^3 - ((1 : ℕ) : ZMod p.val)^2 * xy.1)).card) := by
  have hn0 : (n : ZMod p.val) ≠ 0 := by simpa [ZMod.natCast_eq_zero_iff] using hn
  rw [trace_eq_neg_sum n p hp, trace_eq_neg_sum 1 p hp, mul_neg, neg_inj, Finset.mul_sum]
  rw [← Equiv.sum_comp (Equiv.mulLeft₀ (n : ZMod p.val) hn0)
    (fun x : ZMod p.val => quadraticChar (ZMod p.val) (x^3 - (n : ZMod p.val)^2*x))]
  apply Finset.sum_congr rfl
  intro x _
  change quadraticChar (ZMod p.val) (((n : ZMod p.val)*x)^3 - (n : ZMod p.val)^2*((n : ZMod p.val)*x)) = _
  rw [show ((n : ZMod p.val)*x)^3 - (n : ZMod p.val)^2*((n : ZMod p.val)*x) =
    (n : ZMod p.val)^2 * ((n : ZMod p.val)*(x^3-x)) by ring, map_mul, quadraticChar_sq_one' hn0]
  simp [map_mul]

theorem entire_of_cuspform (localFactor : ℝ → Nat.Primes → ℂ) {Γ : Subgroup (GL (Fin 2) ℝ)}
    [Γ.IsArithmetic] (hwidth : Γ.strictWidthInfty = 1) (F : CuspForm Γ 2)
    (hfirst : (qExpansion 1 F).coeff 1 = 1)
    (hmul : ∀ {i j : ℕ}, i.Coprime j → (qExpansion 1 F).coeff (i*j) =
      (qExpansion 1 F).coeff i * (qExpansion 1 F).coeff j)
    (hlocal : ∀ (p : Nat.Primes) (s : ℝ), 2 < s →
      HasSum (fun e : ℕ => (qExpansion 1 F).coeff (p.val ^ e) /
        ((p.val ^ e : ℕ) : ℂ) ^ (s : ℂ)) (localFactor s p)) :
    ∃ L : ℂ → ℂ, AnalyticOnNhd ℂ L Set.univ ∧ ∀ s : ℝ, 2 < s → HasProd (localFactor s) (L s) := by
  let L := ModularForm.L (by decide : (0:ℤ) < 2) F
  have hL : AnalyticOnNhd ℂ L Set.univ ∧ ∀ s : ℝ, 2 < s → HasProd (localFactor s) (L s) := by
    refine ⟨fun z _ => (CuspForm.differentiable_L (by decide : (0:ℤ) < 2) F).analyticAt z, ?_⟩
    intro s hs
    let term (m : ℕ) := (qExpansion 1 F).coeff m / (m : ℂ) ^ (s : ℂ)
    have hsum : HasSum term (L s) := by
      have h := CuspForm.hasSum_L (by decide : (0:ℤ) < 2) F (s := (s:ℂ))
        (by norm_num; linarith)
      simpa only [hwidth, Complex.ofReal_one, Complex.one_cpow, one_mul, term, L] using h
    have h1 : term 1 = 1 := by simp [term, hfirst]
    have h0 : term 0 = 0 := by
      have hne : (s : ℂ) ≠ 0 := by exact_mod_cast (by linarith : s ≠ 0)
      simp [term, Complex.zero_cpow hne]
    have hcop {i j : ℕ} (h : i.Coprime j) : term (i * j) = term i * term j := by
      simp only [term, hmul h, Nat.cast_mul, Complex.natCast_mul_natCast_cpow, div_mul_div_comm]
    have hprod := EulerProduct.eulerProduct_hasProd h1 (fun {_ _} h => hcop h)
      hsum.summable.norm h0
    have hloc (p : Nat.Primes) : (∑' e : ℕ, term (p.val ^ e)) = localFactor s p :=
      (hlocal p s hs).tsum_eq
    simpa only [hloc, hsum.tsum_eq] using hprod
  exact ⟨L, hL⟩

lemma weight_prime_power (p : Nat.Primes) (s : ℝ) (k : ℕ) (a : ℂ) :
    a / ((p.val ^ k : ℕ) : ℂ) ^ (s : ℂ) = a * ((p.val : ℂ) ^ (-(s : ℂ))) ^ k := by
  rw [Nat.cast_pow, ← Complex.natCast_cpow_natCast_mul, Complex.cpow_nat_mul,
      Complex.cpow_neg, inv_pow, div_eq_mul_inv]

theorem tsum_of_euler_recurrence (c : ℕ → ℂ) (A B : ℂ) (hs : Summable c)
    (h0 : c 0 = 1) (h1 : c 1 = A)
    (hr : ∀ r, c (r + 2) = A * c (r + 1) - B * c r) :
    HasSum c ((1 - A + B)⁻¹) := by
  let S := ∑' k, c k
  let S1 := ∑' k : ℕ, c (k + 1)
  let S2 := ∑' k : ℕ, c (k + 2)
  have hs1 : Summable (fun k : ℕ => c (k + 1)) := (summable_nat_add_iff 1).mpr hs
  have hS0 : S = 1 + S1 := by simpa only [S, S1, h0] using hs.tsum_eq_zero_add
  have hS1 : S1 = A + S2 := by simpa only [S1, S2, h1] using hs1.tsum_eq_zero_add
  have hS2 : S2 = A * S1 - B * S := by
    dsimp only [S2, S1, S]
    simp_rw [hr]
    rw [Summable.tsum_sub (hs1.mul_left A) (hs.mul_left B), tsum_mul_left, tsum_mul_left]
  have heq : (1 - A + B) * S = 1 := by
    linear_combination (1 - A) * hS0 + hS1 + hS2
  have hne : 1 - A + B ≠ 0 := by
    intro hz
    simp [hz] at heq
  have hS : S = (1 - A + B)⁻¹ := by
    field_simp [hne]
    simpa [mul_comm] using heq
  exact hS ▸ hs.hasSum

theorem entire_of_hecke_recurrences
    (n : ℕ) (trace : Nat.Primes → ℤ) {Γ : Subgroup (GL (Fin 2) ℝ)}
    [Γ.IsArithmetic] (hwidth : Γ.strictWidthInfty = 1) (F : CuspForm Γ 2)
    (hfirst : (qExpansion 1 F).coeff 1 = 1)
    (hmul : ∀ {i j : ℕ}, i.Coprime j → (qExpansion 1 F).coeff (i*j) =
      (qExpansion 1 F).coeff i * (qExpansion 1 F).coeff j)
    (hbad : ∀ p : Nat.Primes, p.val ∣ 2*n → ∀ r : ℕ,
       (qExpansion 1 F).coeff (p.val ^ (r+1)) = 0)
    (htrace : ∀ p : Nat.Primes, ¬ p.val ∣ 2*n →
       (qExpansion 1 F).coeff p.val = (trace p : ℂ))
    (hgood : ∀ p : Nat.Primes, ¬ p.val ∣ 2*n → ∀ r : ℕ,
       (qExpansion 1 F).coeff (p.val ^ (r+2)) =
         (trace p : ℂ) * (qExpansion 1 F).coeff (p.val ^ (r+1)) -
         (p.val : ℂ) * (qExpansion 1 F).coeff (p.val ^ r)) :
    ∃ L : ℂ → ℂ, AnalyticOnNhd ℂ L Set.univ ∧ ∀ s : ℝ, 2 < s → HasProd (fun p : Nat.Primes =>
        if p.val ∣ 2 * n then (1 : ℂ) else
          let T : ℂ := (p.val : ℂ) ^ (-(s : ℂ))
          (1 - ((trace p : ℤ) : ℂ) * T + (p.val : ℂ) * T ^ 2)⁻¹) (L s) := by
  apply entire_of_cuspform _ hwidth F hfirst (fun h => hmul h)
  intro p s hs
  let a (m : ℕ) := (qExpansion 1 F).coeff m
  let T : ℂ := (p.val : ℂ) ^ (-(s : ℂ))
  let c (k : ℕ) := a (p.val^k) * T^k
  have h0 : c 0 = 1 := by simp [c, a, hfirst]
  have hw (e : ℕ) := weight_prime_power p s e (a (p.val^e))
  change HasSum (fun e : ℕ => a (p.val^e) / ((p.val ^ e : ℕ) : ℂ) ^ (s : ℂ)) _
  simp_rw [hw]
  change HasSum c _
  by_cases hp : p.val ∣ 2*n
  · simp only [if_pos hp]
    have hcz : ∀ i ≠ 0, c i = 0 := by
      rintro (_ | k) hk
      · exact (hk rfl).elim
      · simp [c, a, hbad p hp k]
    simpa only [h0] using hasSum_single (0 : ℕ) hcz
  · simp only [if_neg hp]
    change HasSum c ((1 - (trace p : ℂ) * T + (p.val : ℂ)*T^2)⁻¹)
    have hsall := CuspForm.hasSum_L (by decide : (0:ℤ) < 2) F (s := (s:ℂ))
      (by norm_num; linarith)
    rw [hwidth] at hsall
    have hsub := hsall.summable.norm.comp_injective (Nat.pow_right_injective p.property.one_lt)
    have hsum : Summable c := by
      apply Summable.of_norm
      change Summable (fun k : ℕ => ‖a (p.val^k) / ((p.val^k : ℕ) : ℂ) ^ (s : ℂ)‖) at hsub
      simpa only [hw] using hsub
    apply tsum_of_euler_recurrence c ((trace p : ℂ)*T) ((p.val : ℂ)*T^2) hsum h0
    · simp [c,a,htrace p hp]
    · intro r
      dsimp only [c, a]
      rw [hgood p hp r, pow_add T r 2, pow_add T r 1, pow_one]
      ring

theorem entire_of_modularity (h : H1) (n : ℕ) (hsq : Squarefree n) (hmod : n % 8 = 2) :
    ∃ L : ℂ → ℂ, (AnalyticOnNhd ℂ L Set.univ ∧ ∀ s : ℝ, 2 < s →
      HasProd (fun p : Nat.Primes =>
        if p.val ∣ 2 * n then (1 : ℂ) else
          letI : NeZero p.val := ⟨p.property.ne_zero⟩
          let a : ℤ := (p.val : ℤ) - (Finset.univ.filter (fun xy : ZMod p.val × ZMod p.val =>
            xy.2 ^ 2 = xy.1 ^ 3 - (n : ZMod p.val) ^ 2 * xy.1)).card
          let T : ℂ := (p.val : ℂ) ^ (-(s : ℂ))
          (1 - (a : ℂ) * T + (p.val : ℂ) * T ^ 2)⁻¹) (L s)) := by
  obtain ⟨Γ, hΓ, hwidth, F, hfirst, hmul, hbad, htrace, hgood⟩ := h n hsq hmod
  letI : Γ.IsArithmetic := hΓ
  let trace (p : Nat.Primes) : ℤ := (letI : NeZero p.val := ⟨p.property.ne_zero⟩
      (p.val : ℤ) - (Finset.univ.filter (fun xy : ZMod p.val × ZMod p.val =>
        xy.2^2 = xy.1^3 - (n : ZMod p.val)^2 * xy.1)).card)
  have ha (p : Nat.Primes) (hp : ¬ p.val ∣ 2*n) :
      (qExpansion 1 F).coeff p.val = (trace p : ℂ) := by
    letI : Fact p.val.Prime := ⟨p.property⟩
    have hp2 : p.val ≠ 2 := by
      intro e
      exact hp (e ▸ dvd_mul_right 2 n)
    have hpn : ¬ p.val ∣ n := fun hd => hp (dvd_mul_of_dvd_right hd 2)
    have ht := traceOfFrobenius_twist n p hp2 hpn
    apply (htrace p hp).trans
    exact congrArg (fun z : ℤ => (z : ℂ)) (by simpa [trace] using ht.symm)
  apply entire_of_hecke_recurrences n trace hwidth F hfirst (fun {i j} hij => hmul i j hij) hbad ha
  intro p hp r
  simpa only [← ha p hp] using hgood p hp r

theorem exists_point_of_congruent (n : ℕ) (hn : n ≠ 0) (h : congruentNumber n) :
    ∃ x y : ℚ, y ≠ 0 ∧ y ^ 2 = x ^ 3 - (n : ℚ) ^ 2 * x := by
  obtain ⟨a, b, c, htri, harea⟩ := h
  have hnq : (n : ℚ) ≠ 0 := by exact_mod_cast hn
  have ha : a ≠ 0 := by
    intro hz
    apply hnq
    simpa [hz] using harea
  let x := a * (a + c) / 2
  have hx : x ^ 2 - a ^ 2 * x = (n : ℚ) ^ 2 := by
    dsimp [x]
    rw [harea]
    linear_combination -(a ^ 2 / 4) * htri
  have hx0 : x ≠ 0 := by
    intro hz
    have : (n : ℚ) ^ 2 = 0 := by simpa [hz] using hx.symm
    exact (pow_ne_zero 2 hnq) this
  refine ⟨x, a * x, mul_ne_zero ha hx0, ?_⟩
  linear_combination -x * hx

-- Doubling produces a second rational point with a square x-coordinate.
theorem double_point {n x y : ℚ} (hn : n ≠ 0) (hy : y ≠ 0)
    (h : y ^ 2 = x ^ 3 - n ^ 2 * x) :
    ∃ y' : ℚ, y' ^ 2 = (((x ^ 2 + n ^ 2) / (2 * y)) ^ 2) ^ 3 -
      n ^ 2 * ((x ^ 2 + n ^ 2) / (2 * y)) ^ 2 := by
  let s := (3 * x ^ 2 - n ^ 2) / (2 * y)
  let z := ((x ^ 2 + n ^ 2) / (2 * y)) ^ 2
  have hs : 2 * s * y = 3 * x ^ 2 - n ^ 2 := by
    dsimp [s]
    field_simp
  have hz : s ^ 2 - 2 * x = z := by
    dsimp [s, z]
    field_simp
    linear_combination -(8 * x) * h
  refine ⟨s * (x - z) - y, ?_⟩
  change (s * (x - z) - y) ^ 2 = z ^ 3 - n ^ 2 * z
  linear_combination (z - x) ^ 2 * hz + (z - x) * hs + h

theorem infinite_of_descent (n : ℚ)
    (hstart : ∃ x y : ℚ, y^2 = x^3 - n^2*x ∧ padicValRat 2 x < 0)
    (hstep : ∀ x y : ℚ, y^2 = x^3 - n^2*x → padicValRat 2 x < 0 →
      ∃ x' y' : ℚ, y'^2 = x'^3 - n^2*x' ∧ padicValRat 2 x' < padicValRat 2 x) :
    {p : ℚ × ℚ | p.2^2 = p.1^3 - n^2*p.1}.Infinite := by
  intro hfin
  obtain ⟨x, y, hxy, hneg⟩ := hstart
  obtain ⟨⟨u, v⟩, huv, hmin⟩ := Set.exists_min_image _ (fun p : ℚ × ℚ => padicValRat 2 p.1)
    hfin ⟨(x, y), hxy⟩
  have hu : padicValRat 2 u < 0 := lt_of_le_of_lt (hmin (x, y) hxy) hneg
  obtain ⟨u', v', heq, hlt⟩ := hstep u v huv hu
  exact (not_lt_of_ge (hmin (u', v') heq)) hlt

lemma parameter_val {n : ℕ} (hn : n % 8 = 2) : padicValRat 2 (n : ℚ) = 1 := by
  have hm : n = 2 * (n/2) := by omega
  have hu : ¬ 2 ∣ n/2 := by omega
  have he : padicValNat 2 (n/2) = 0 := padicValNat.eq_zero_of_not_dvd hu
  rw [padicValRat.of_nat]
  nth_rw 1 [hm]
  rw [padicValNat.mul (by decide) (by omega), he]
  norm_num [padicValNat_self]

lemma y_ne_zero {n x y : ℚ} (hn : padicValRat 2 n = 1)
    (hx : x ≠ 0) (hv : padicValRat 2 x ≠ 1) (h : y^2 = x^3 - n^2*x) : y ≠ 0 := by
  intro he
  have hprod : (x^2 - n^2)*x = 0 := by rw [he] at h; nlinarith only [h]
  have heq := sub_eq_zero.mp ((mul_eq_zero.mp hprod).resolve_right hx)
  have hval := congrArg (padicValRat 2) heq
  simp only [padicValRat.pow, Nat.cast_ofNat, hn] at hval
  omega

lemma double_val {n x y : ℚ} (hn : padicValRat 2 n = 1) (hx : padicValRat 2 x ≠ 1)
    (hy : y ≠ 0) (h : y^2 = x^3 - n^2*x) :
    padicValRat 2 (((x^2+n^2)/(2*y))^2) =
      min (2*padicValRat 2 x) 2 - 2 - padicValRat 2 x := by
  have hn0 : n ≠ 0 := by intro e; simp [e] at hn
  have hx0 : x ≠ 0 := by
    rintro rfl
    simp at h
    contradiction
  have hsum : x^2+n^2 ≠ 0 := by positivity
  have hy2 : y^2 = x*(x^2-n^2) := by linear_combination h
  have hsub : x^2-n^2 ≠ 0 := by
    intro he
    rw [he, mul_zero] at hy2
    exact pow_ne_zero 2 hy hy2
  have hva : padicValRat 2 (x^2+n^2) = min (2*padicValRat 2 x) 2 := by
    rw [padicValRat.add_eq_min hsum (pow_ne_zero 2 hx0) (pow_ne_zero 2 hn0)]
    · simp [hn]
    · simp [hn]; omega
  have hvb : padicValRat 2 (x^2-n^2) = min (2*padicValRat 2 x) 2 := by
    rw [sub_eq_add_neg] at hsub ⊢
    rw [padicValRat.add_eq_min hsub (pow_ne_zero 2 hx0) (neg_ne_zero.mpr (pow_ne_zero 2 hn0))]
    · simp [hn]
    · simp [hn]; omega
  have htwo : padicValRat 2 (2 : ℚ) = 1 := padicValRat.self (by decide : 1 < 2)
  have hyval := congrArg (padicValRat 2) hy2
  rw [padicValRat.pow, padicValRat.mul hx0 hsub, hvb] at hyval
  rw [padicValRat.pow, padicValRat.div hsum (mul_ne_zero (by norm_num) hy), hva,
    padicValRat.mul (by norm_num) hy, htwo]
  norm_num at hyval ⊢
  omega

-- Once the x-coordinate has negative valuation, doubling decreases it strictly.
theorem infinite_of_point {n : ℕ} (hn : n % 8 = 2)
    (hpoint : ∃ x y : ℚ, y ≠ 0 ∧ y^2 = x^3 - (n : ℚ)^2*x) :
    {p : ℚ × ℚ | p.2^2 = p.1^3 - (n : ℚ)^2*p.1}.Infinite := by
  have hvn := parameter_val hn
  have hn0 : (n : ℚ) ≠ 0 := by intro h; simp [h] at hvn
  apply infinite_of_descent
  · obtain ⟨x, y, hy, h⟩ := hpoint
    let t := (x^2 + (n : ℚ)^2) / (2*y)
    have ht : t ≠ 0 := div_ne_zero (by positivity) (mul_ne_zero (by norm_num) hy)
    obtain ⟨v, hv⟩ := double_point hn0 hy h
    change v^2 = (t^2)^3 - (n : ℚ)^2 * (t^2) at hv
    have hvt : padicValRat 2 (t^2) ≠ 1 := by rw [padicValRat.pow]; omega
    have hv0 := y_ne_zero hvn (pow_ne_zero 2 ht) hvt hv
    obtain ⟨w, hw⟩ := double_point hn0 hv0 hv
    refine ⟨_, w, hw, ?_⟩
    rw [double_val hvn hvt hv0 hv]
    omega
  · intro x y h hv
    have hx : x ≠ 0 := by intro hz; simp [hz] at hv
    have hy := y_ne_zero hvn hx (by omega) h
    obtain ⟨v, hv'⟩ := double_point hn0 hy h
    refine ⟨_, v, hv', ?_⟩
    rw [double_val hvn (by omega) hy h]
    omega

lemma residues_of_even_squarefree {n : ℕ} (hsq : Squarefree n) (hev : Even n) :
    n % 8 = 2 ∨ n % 8 = 6 := by
  have h4 : ¬ 4 ∣ n := Nat.squarefree_iff_prime_squarefree.mp hsq 2 Nat.prime_two
  obtain ⟨k, hk⟩ := hev
  omega

lemma no_representation {n : ℕ} (hn : n % 8 = 6) (t y : ℤ) :
    (n : ℤ) ≠ 8 * t + 2 * y ^ 2 := by
  intro h
  have hn' : (n : ℤ) % 8 = 6 := by exact_mod_cast hn
  obtain ⟨k, rfl⟩ | ⟨k, rfl⟩ := Int.even_or_odd y <;> ring_nf at h <;> omega

lemma counts_vanish {n : ℕ} (hn : n % 8 = 6) : C n = ∅ ∧ D n = ∅ := by
  constructor
  · apply Set.eq_empty_iff_forall_notMem.mpr
    rintro ⟨x, y, z⟩ h
    change (n : ℤ) = 8 * x ^ 2 + 2 * y ^ 2 + 64 * z ^ 2 at h
    apply no_representation hn (x ^ 2 + 8 * z ^ 2) y
    linarith
  · apply Set.eq_empty_iff_forall_notMem.mpr
    rintro ⟨x, y, z⟩ h
    change (n : ℤ) = 8 * x ^ 2 + 2 * y ^ 2 + 16 * z ^ 2 at h
    apply no_representation hn (x ^ 2 + 2 * z ^ 2) y
    linarith

theorem balance_of_six_mod_eight {n : ℕ} (hn : n % 8 = 6) :
    2 * (C n).ncard = (D n).ncard := by
  obtain ⟨hC, hD⟩ := counts_vanish hn
  simp [hC, hD]

lemma finite_D (n : ℕ) : (D n).Finite := by
  let box := Set.Icc (-((n : ℤ) + 1)) ((n : ℤ) + 1)
  have hbox : box.Finite := Set.finite_Icc _ _
  apply (hbox.prod (hbox.prod hbox)).subset
  rintro ⟨x, y, z⟩ h
  change (n : ℤ) = 8 * x ^ 2 + 2 * y ^ 2 + 16 * z ^ 2 at h
  have hbound (v : ℤ) (hv : v ^ 2 ≤ (n : ℤ)) : v ∈ box := by
    constructor <;> nlinarith [sq_nonneg (v - 1), sq_nonneg (v + 1), sq_nonneg v]
  apply And.intro (hbound x ?_) (And.intro (hbound y ?_) (hbound z ?_)) <;>
    nlinarith [sq_nonneg x, sq_nonneg y, sq_nonneg z]

theorem ncard_C_eq_even (n : ℕ) :
    (C n).ncard = {p ∈ D n | Even p.2.2}.ncard := by
  apply Set.ncard_congr (fun p _ => (p.1, p.2.1, p.2.2 + p.2.2))
  · rintro ⟨x, y, z⟩ hp
    change (n : ℤ) = 8 * x ^ 2 + 2 * y ^ 2 + 64 * z ^ 2 at hp
    constructor
    · change (n : ℤ) = 8 * x ^ 2 + 2 * y ^ 2 + 16 * (z + z) ^ 2
      linear_combination hp
    · exact ⟨z, rfl⟩
  · rintro ⟨x, y, z⟩ ⟨x', y', z'⟩ _ _ h
    simp only [Prod.mk.injEq] at h ⊢
    exact ⟨h.1, h.2.1, by omega⟩
  · rintro ⟨x, y, z⟩ ⟨hp, w, hw⟩
    change z = w + w at hw
    subst z
    refine ⟨(x, y, w), ?_, rfl⟩
    change (n : ℤ) = 8 * x ^ 2 + 2 * y ^ 2 + 16 * (w + w) ^ 2 at hp
    change (n : ℤ) = 8 * x ^ 2 + 2 * y ^ 2 + 64 * w ^ 2
    linear_combination hp

theorem parity_difference (n : ℕ) (hf : (D n).Finite) :
    2 * ((C n).ncard : ℤ) - (D n).ncard =
      ({p ∈ D n | Even p.2.2}.ncard : ℤ) - {p ∈ D n | Odd p.2.2}.ncard := by
  let e := {p ∈ D n | Even p.2.2}
  let o := {p ∈ D n | Odd p.2.2}
  have he : e ⊆ D n := fun _ h => h.1
  have ho : o ⊆ D n := fun _ h => h.1
  have hdis : Disjoint e o := Set.disjoint_left.mpr fun _ h g =>
    (Int.not_even_iff_odd.mpr g.2) h.2
  have hun : e ∪ o = D n := by
    apply Set.Subset.antisymm (Set.union_subset he ho)
    intro p hp
    rcases Int.even_or_odd p.2.2 with h | h
    · exact Or.inl ⟨hp, h⟩
    · exact Or.inr ⟨hp, h⟩
  have h := Set.ncard_union_eq hdis (hf.subset he) (hf.subset ho)
  rw [hun] at h
  change 2 * ((C n).ncard : ℤ) - (D n).ncard = (e.ncard : ℤ) - o.ncard
  have hc : (C n).ncard = e.ncard := ncard_C_eq_even n
  omega

lemma y_residues {n : ℕ} (hn : n % 8 = 2) {x y z : ℤ} (h : (x, y, z) ∈ D n) :
    y % 4 = 1 ∨ y % 4 = 3 := by
  change (n : ℤ) = 8 * x ^ 2 + 2 * y ^ 2 + 16 * z ^ 2 at h
  have hn' : (n : ℤ) % 8 = 2 := by exact_mod_cast hn
  obtain ⟨k, rfl⟩ | ⟨k, rfl⟩ := Int.even_or_odd y
  · ring_nf at h
    omega
  · omega

lemma sign_pairing {n : ℕ} (hn : n % 8 = 2) (hfin : (D n).Finite) (P : ℤ → Prop) :
    {u ∈ D n | P u.2.2}.ncard =
      2 * {u ∈ D n | P u.2.2 ∧ u.2.1 % 4 = 1}.ncard := by
  let S (r : ℤ) := {u ∈ D n | P u.2.2 ∧ u.2.1 % 4 = r}
  have hunion : {u ∈ D n | P u.2.2} = S 1 ∪ S 3 := by
    ext ⟨x, y, z⟩
    constructor
    · rintro ⟨hd, hp⟩
      rcases y_residues hn hd with h | h
      · exact Or.inl ⟨hd, hp, h⟩
      · exact Or.inr ⟨hd, hp, h⟩
    · rintro (⟨hd, hp, -⟩ | ⟨hd, hp, -⟩) <;> exact ⟨hd, hp⟩
  have hdisj : Disjoint (S 1) (S 3) := by
    apply Set.disjoint_left.mpr
    rintro u ⟨-, -, h⟩ ⟨-, -, h'⟩
    omega
  have hcard : (S 3).ncard = (S 1).ncard := by
    refine Set.ncard_congr (fun u _ ↦ (u.1, -u.2.1, u.2.2)) ?_ ?_ ?_
    · rintro ⟨x, y, z⟩ ⟨hd, hp, hr⟩
      exact ⟨by simpa [D] using hd, hp, by dsimp at hr ⊢; omega⟩
    · rintro ⟨x, y, z⟩ ⟨x', y', z'⟩ _ _ heq
      simpa using heq
    · rintro ⟨x, y, z⟩ ⟨hd, hp, hr⟩
      refine ⟨(x, -y, z), ⟨by simpa [D] using hd, hp, ?_⟩, by simp⟩
      dsimp at hr ⊢
      omega
  change _ = 2 * (S 1).ncard
  rw [hunion, Set.ncard_union_eq hdisj (hfin.subset (Set.sep_subset _ _))
    (hfin.subset (Set.sep_subset _ _)), hcard, two_mul]

-- Pair the residue-zero terms via the norm-preserving rational reflection.
lemma reflect_zero {a z : ℤ} (ha : a % 2 = 1) (hr : (a + 2*z) % 3 = 0) :
    let b := (-a - 8*z) / 3
    let w := (z - a) / 3
    b^2 + 8*w^2 = a^2 + 8*z^2 ∧
    (b + 2*w) % 3 = 0 ∧ w % 2 = 1 - z % 2 ∧
    (-b - 8*w) / 3 = a ∧ (w - b) / 3 = z := by
  dsimp only
  have h₁ : 3 * ((-a-8*z)/3) = -a-8*z := by omega
  have h₂ : 3 * ((z-a)/3) = z-a := by omega
  refine ⟨?_, by omega, by omega, by omega, by omega⟩
  generalize (-a-8*z)/3 = b at h₁ ⊢
  generalize (z-a)/3 = w at h₂ ⊢
  nlinarith only [congrArg (fun a : ℤ => a^2) h₁, congrArg (fun a : ℤ => a^2) h₂]

lemma reflection_card {n : ℕ} (hn : n % 8 = 2) :
    {u ∈ D n | Even u.2.2 ∧ (u.2.1 + 2 * u.2.2) % 3 = 0}.ncard = {u ∈ D n | Odd u.2.2 ∧ (u.2.1 + 2 * u.2.2) % 3 = 0}.ncard := by
  let f (u : ℤ × ℤ × ℤ) := (u.1, (-u.2.1 - 8*u.2.2) / 3, (u.2.2 - u.2.1) / 3)
  have works {x y z : ℤ} (hD : (x,y,z) ∈ D n) (hr : (y+2*z)%3=0) :
      f (x,y,z) ∈ D n ∧ ((f (x,y,z)).2.1 + 2*(f (x,y,z)).2.2) % 3 = 0 ∧
      (f (x,y,z)).2.2 % 2 = 1 - z%2 ∧ f (f (x,y,z)) = (x,y,z) := by
    have hyo := y_residues hn hD
    obtain ⟨hq,hres,hpar,hi,hj⟩ := reflect_zero (a := y) (z := z) (by omega) hr
    refine ⟨?_,hres,hpar,?_⟩
    · change (n:ℤ) = 8*x^2 + 2*y^2 + 16*z^2 at hD
      change (n:ℤ) = 8*x^2 + 2*((-y-8*z)/3)^2 + 16*((z-y)/3)^2
      linarith
    · simp [f, hi, hj]
  refine Set.ncard_congr (fun u _ => f u) ?_ ?_ ?_
  · rintro ⟨x,y,z⟩ ⟨hd, hp, hr⟩
    obtain ⟨hd', hr', hp', -⟩ := works hd hr
    refine ⟨hd', ?_, hr'⟩
    rw [Int.odd_iff]
    change Even z at hp
    rw [Int.even_iff] at hp
    omega
  · rintro ⟨x,y,z⟩ ⟨x',y',z'⟩ ⟨hd,-,hr⟩ ⟨hd',-,hr'⟩ h
    simpa only [(works hd hr).2.2.2,(works hd' hr').2.2.2] using congrArg f h
  · rintro ⟨x,y,z⟩ ⟨hd,hp,hr⟩
    obtain ⟨hd',hr',hp',hi⟩ := works hd hr
    refine ⟨f (x,y,z), ⟨hd',?_,hr'⟩,hi⟩
    rw [Int.even_iff]
    change Odd z at hp
    rw [Int.odd_iff] at hp
    omega

lemma residue_partition (n : ℕ) (P : ℤ → Prop) (hP : ∀ z, P (-z) ↔ P z) :
    {u ∈ D n | P u.2.2}.ncard =
      {u ∈ D n | P u.2.2 ∧ (u.2.1 + 2 * u.2.2) % 3 = 0}.ncard + 2 * {u ∈ D n | P u.2.2 ∧ (u.2.1 + 2 * u.2.2) % 3 = 2}.ncard := by
  let S (r : ℤ) := {u ∈ D n | P u.2.2 ∧ (u.2.1 + 2 * u.2.2) % 3 = r}
  have hun : {u ∈ D n | P u.2.2} = S 0 ∪ S 1 ∪ S 2 := by
    ext u
    constructor
    · rintro ⟨hD,hp⟩
      have hr : (u.2.1+2*u.2.2)%3 = 0 ∨ (u.2.1+2*u.2.2)%3 = 1 ∨
          (u.2.1+2*u.2.2)%3 = 2 := by omega
      rcases hr with h | h | h
      · exact Or.inl (Or.inl ⟨hD,hp,h⟩)
      · exact Or.inl (Or.inr ⟨hD,hp,h⟩)
      · exact Or.inr ⟨hD,hp,h⟩
    · rintro ((⟨hD,hp,-⟩ | ⟨hD,hp,-⟩) | ⟨hD,hp,-⟩) <;> exact ⟨hD,hp⟩
  have hdis {i j : ℤ} (h : i ≠ j) : Disjoint (S i) (S j) := by
    apply Set.disjoint_left.mpr
    rintro u ⟨-,-,hi⟩ ⟨-,-,hj⟩
    exact h (hi.symm.trans hj)
  have hcard : (S 1).ncard = (S 2).ncard := by
    refine Set.ncard_congr (fun u _ => (u.1,-u.2.1,-u.2.2)) ?_ ?_ ?_
    · rintro ⟨x,y,z⟩ ⟨hd,hp,hr⟩
      exact ⟨by simpa [D] using hd, (hP _).mpr hp, by dsimp at hr ⊢; omega⟩
    · rintro ⟨x,y,z⟩ ⟨x',y',z'⟩ _ _ h
      simpa using h
    · rintro ⟨x,y,z⟩ ⟨hd,hp,hr⟩
      exact ⟨(x,-y,-z), ⟨by simpa [D] using hd, (hP _).mpr hp, by dsimp at hr ⊢; omega⟩, by simp⟩
  have hf (r : ℤ) : (S r).Finite := (finite_D n).subset (Set.sep_subset _ _)
  change _ = (S 0).ncard + 2*(S 2).ncard
  have hu2 : Disjoint (S 0 ∪ S 1) (S 2) :=
    (hdis (by decide : (0:ℤ) ≠ 2)).sup_left (hdis (by decide : (1:ℤ) ≠ 2))
  rw [hun, Set.ncard_union_eq hu2 ((hf 0).union (hf 1)) (hf 2),
      Set.ncard_union_eq (hdis (by decide : (0:ℤ) ≠ 1)) (hf 0) (hf 1), hcard]
  omega

theorem signed_mod_four_eq_mod_three {n : ℕ} (hn : n % 8 = 2) :
    ({u ∈ D n | Even u.2.2 ∧ u.2.1 % 4 = 1}.ncard : ℤ) -
      {u ∈ D n | Odd u.2.2 ∧ u.2.1 % 4 = 1}.ncard =
    ({u ∈ D n | Even u.2.2 ∧ (u.2.1 + 2 * u.2.2) % 3 = 2}.ncard : ℤ) - {u ∈ D n | Odd u.2.2 ∧ (u.2.1 + 2 * u.2.2) % 3 = 2}.ncard := by
  have h4e := sign_pairing hn (finite_D n) Even
  have h4o := sign_pairing hn (finite_D n) Odd
  have h3e := residue_partition n Even (by simp)
  have h3o := residue_partition n Odd (by simp)
  have h0 := reflection_card hn
  omega

-- Identify the formal q-series coefficient with its finite truncation.
namespace FourierSeries


open PowerSeries PowerSeries.WithPiTopology Filter Finset
open scoped Topology

lemma order_tendsto (f : ℕ → ℕ) (hf : ∀ k, k < f k) :
    Tendsto (fun k => ((X : ℤ⟦X⟧) ^ f k).order) atTop (𝓝 ⊤) := by
  apply ENat.tendsto_nhds_top_iff_natCast_lt.mpr
  intro n
  filter_upwards [eventually_ge_atTop n] with k hk
  rw [order_X_pow]
  exact_mod_cast lt_of_le_of_lt hk (hf k)

lemma coeff_tprod_high (f : ℕ → ℕ) (hf : ∀ k, k < f k) {m d : ℕ} (hm : m ≤ d) :
    coeff m (∏ k ∈ range d, (1 - (X : ℤ⟦X⟧) ^ f k)) =
      coeff m (∏' k, (1 - (X : ℤ⟦X⟧) ^ f k)) := by
  have hmul : Multipliable (fun k => 1 - (X : ℤ⟦X⟧) ^ f k) := by
    simp only [sub_eq_add_neg]
    apply multipliable_one_add_of_tendsto_order_atTop_nhds_top
    simpa only [order_neg] using order_tendsto f hf
  have ht := (continuous_coeff ℤ m).continuousAt.tendsto.comp hmul.hasProd
  rw [nhds_discrete] at ht
  obtain ⟨s, hs⟩ := eventually_atTop.mp (tendsto_pure.mp ht)
  specialize hs (range d ∪ s) subset_union_right
  refine Eq.trans ?_ hs
  clear hs
  change _ = coeff m (∏ k ∈ range d ∪ s, (1 - (X : ℤ⟦X⟧) ^ f k))
  induction s using Finset.induction_on with
  | empty => simp
  | insert k s hk ih =>
    rw [union_insert]
    by_cases h : k ∈ range d ∪ s
    · rw [insert_eq_of_mem h]
      apply ih
    · have hkd : d ≤ k := Nat.le_of_not_gt (fun h' => h (mem_union_left _ (mem_range.mpr h')))
      have hkm : ¬ f k ≤ m := by have := hf k; omega
      rw [prod_insert h, mul_comm, mul_sub, mul_one, map_sub, coeff_mul_X_pow', if_neg hkm,
        sub_zero]
      apply ih

lemma coeff_tsum_high (f : ℕ → ℕ) (hf : ∀ k, k < f k) {m d : ℕ} (hm : m ≤ d) :
    coeff m (∑ k ∈ range d, (X : ℤ⟦X⟧) ^ f k) =
      coeff m (∑' k, (X : ℤ⟦X⟧) ^ f k) := by
  have hsum := summable_of_tendsto_order_atTop_nhds_top ℤ (order_tendsto f hf)
  have ht := (continuous_coeff ℤ m).continuousAt.tendsto.comp hsum.hasSum
  rw [nhds_discrete] at ht
  obtain ⟨s, hs⟩ := eventually_atTop.mp (tendsto_pure.mp ht)
  specialize hs (range d ∪ s) subset_union_right
  refine Eq.trans ?_ hs
  clear hs
  change _ = coeff m (∑ k ∈ range d ∪ s, (X : ℤ⟦X⟧) ^ f k)
  induction s using Finset.induction_on with
  | empty => simp
  | insert k s hk ih =>
    rw [union_insert]
    by_cases h : k ∈ range d ∪ s
    · rw [insert_eq_of_mem h]
      apply ih
    · have hkd : d ≤ k := Nat.le_of_not_gt (fun h' => h (mem_union_left _ (mem_range.mpr h')))
      have hkm : m ≠ f k := by have := hf k; omega
      rw [sum_insert h, map_add, coeff_X_pow, if_neg hkm, zero_add]
      apply ih

lemma mul_coeff_congr {p q p' q' : ℤ⟦X⟧} {d : ℕ}
    (hp : ∀ m ≤ d, coeff m p = coeff m p') (hq : ∀ m ≤ d, coeff m q = coeff m q') :
    ∀ m ≤ d, coeff m (p * q) = coeff m (p' * q') := by
  intro m hm
  rw [coeff_mul, coeff_mul]
  apply Finset.sum_congr rfl
  intro t ht
  have ht' : t.1 + t.2 = m := mem_antidiagonal.mp ht
  rw [hp t.1 (by omega), hq t.2 (by omega)]

theorem finite_eq_infinite (d : ℕ) :
    let X : Polynomial ℤ := Polynomial.X
    let eta := X * ∏ k ∈ Icc 1 d, ((1 - X ^ (8 * k)) * (1 - X ^ (16 * k)))
    let theta := 1 + 2 * ∑ k ∈ Icc 1 d, X ^ (4 * k ^ 2)
    (eta * theta).coeff d =
      coeff d ((PowerSeries.X : ℤ⟦X⟧) *
        (∏' k : ℕ, (1 - PowerSeries.X ^ (8 * (k + 1)))) *
        (∏' k : ℕ, (1 - PowerSeries.X ^ (16 * (k + 1)))) *
        (1 + 2 * ∑' k : ℕ, PowerSeries.X ^ (4 * (k + 1) ^ 2))) := by
  dsimp only
  have hI : Icc 1 d = Ico 1 (d + 1) := by ext k; simp
  rw [hI, Finset.prod_mul_distrib, Finset.prod_Ico_eq_prod_range, Finset.prod_Ico_eq_prod_range,
    Finset.sum_Ico_eq_sum_range, ← mul_assoc, ← Polynomial.coeff_coe]
  rw [← Polynomial.coeToPowerSeries.ringHom_apply]
  simp only [map_mul, map_prod, map_sub, map_one, map_pow, map_add, map_sum, map_ofNat,
    Polynomial.coeToPowerSeries.ringHom_apply, Polynomial.coe_X, Nat.add_one_sub_one, add_comm 1]
  apply mul_coeff_congr _ _ d le_rfl
  · apply mul_coeff_congr
    · apply mul_coeff_congr
      · exact fun _ _ => rfl
      · exact fun m hm => coeff_tprod_high (fun k => 8 * (k+1)) (by intro k; omega) hm
    · exact fun m hm => coeff_tprod_high (fun k => 16 * (k+1)) (by intro k; omega) hm
  · intro m hm
    rw [map_add, map_add]
    congr 1
    apply mul_coeff_congr (fun _ _ => rfl) _ m hm
    exact fun k hk => coeff_tsum_high (fun j => 4 * (j+1)^2)
      (by intro j; nlinarith [Nat.zero_le (j*j)]) hk

end FourierSeries

-- Expand each finite Euler product through the coefficient under consideration.
open Finset Polynomial

lemma coeff_union_range {m d : ℕ} (hmd : m ≤ d) (s : Finset ℕ) :
    (∏ k ∈ range d ∪ s, (1 - (X : ℤ[X]) ^ (k + 1))).coeff m =
      (∏ k ∈ range d, (1 - (X : ℤ[X]) ^ (k + 1))).coeff m := by
  induction s using Finset.induction_on with
  | empty => simp
  | insert k s hk ih =>
    rw [Finset.union_insert]
    by_cases h : k ∈ range d ∪ s
    · simpa [Finset.insert_eq_of_mem h] using ih
    · have hkm : ¬ k + 1 ≤ m := by
        have hkd : k ∉ range d := fun h' => h (Finset.mem_union_left _ h')
        simp only [mem_range, not_lt] at hkd
        omega
      rw [Finset.prod_insert h, mul_comm, mul_sub, mul_one, Polynomial.coeff_sub,
        Polynomial.coeff_mul_X_pow', if_neg hkm, sub_zero, ih]

lemma euler_coeff {m d : ℕ} (hmd : m ≤ d) :
    (∏ k ∈ range d, (1 - (X : ℤ[X]) ^ (k + 1))).coeff m =
      (PowerSeries.pentagonalSeries ℤ).coeff m := by
  obtain ⟨t, ht⟩ := Filter.eventually_atTop.1
    (PowerSeries.coeff_prod_one_sub_X_pow_eventually_eq ℤ m)
  specialize ht (range d ∪ t) (Finset.subset_union_right)
  rw [← coeff_union_range hmd t, ← Polynomial.coeff_coe]
  convert ht using 2
  change Polynomial.coeToPowerSeries.ringHom (∏ k ∈ range d ∪ t, (1 - (X : ℤ[X]) ^ (k + 1))) = _
  rw [map_prod]
  simp

lemma mem_box_of_pentagonal_le {i : ℤ} {d : ℕ} (hi : pentagonal i ≤ d) :
    i ∈ Icc (-(d : ℤ)) (d : ℤ) := by
  have hp := two_mul_natCast_pentagonal i
  have h : (pentagonal i : ℤ) ≤ d := by exact_mod_cast hi
  rw [mem_Icc]
  rcases le_or_gt 1 i with hpos | hneg
  · have hmul : 0 ≤ i * (i - 1) := mul_nonneg (by omega) (by omega)
    constructor <;> nlinarith
  · have hmul : 0 ≤ i * (i + 1) := by
      by_cases hi : i = 0
      · simp [hi]
      · exact mul_nonneg_of_nonpos_of_nonpos (by omega) (by omega)
    constructor <;> nlinarith [sq_nonneg i]

lemma base_coeff {d m : ℕ} (hm : m ≤ d) :
    (∏ k ∈ Icc 1 d, (1 - (X : ℤ[X]) ^ k)).coeff m =
    (∑ i ∈ Icc (-(d : ℤ)) (d : ℤ), monomial (pentagonal i) (Int.negOnePow i : ℤ)).coeff m := by
  have hI : Icc 1 d = Ico 1 (d + 1) := by ext k; simp
  rw [hI, Finset.prod_Ico_eq_prod_range]
  simp only [Nat.add_one_sub_one, add_comm 1]
  rw [euler_coeff hm, Polynomial.finsetSum_coeff]
  by_cases h : ∃ i, pentagonal i = m
  · obtain ⟨i, rfl⟩ := h
    rw [PowerSeries.coeff_pentagonalSeries_pentagonal, Finset.sum_eq_single i]
    · simp only [coeff_monomial, if_true, Int.cast_id]
    · intro j hj hji
      simp [coeff_monomial, hji]
    · exact fun hi => False.elim (hi (mem_box_of_pentagonal_le hm))
  · rw [PowerSeries.coeff_pentagonalSeries_eq_zero ℤ h]
    symm
    apply Finset.sum_eq_zero
    intro i hi
    have he : pentagonal i ≠ m := fun he => h ⟨i, he⟩
    simp [coeff_monomial, he]

theorem dilated_coeff {a d m : ℕ} (ha : 0 < a) (hm : m ≤ d) :
    (∏ k ∈ Icc 1 d, (1 - (X : ℤ[X]) ^ (a * k))).coeff m =
    (∑ i ∈ Icc (-(d : ℤ)) (d : ℤ), monomial (a * pentagonal i) (Int.negOnePow i : ℤ)).coeff m := by
  have h := base_coeff (le_trans (Nat.div_le_self m a) hm)
  have eqn : (expand ℤ a (∏ k ∈ Icc 1 d, (1 - (X : ℤ[X]) ^ k))).coeff m =
      (expand ℤ a (∑ i ∈ Icc (-(d : ℤ)) (d : ℤ),
        monomial (pentagonal i) (Int.negOnePow i : ℤ))).coeff m := by
    simp only [coeff_expand ha, h]
  simpa only [map_prod, map_sub, map_one, map_pow, expand_X, ← pow_mul, map_sum,
    expand_monomial, Nat.mul_comm] using eqn

lemma theta_as_sum (d : ℕ) :
    (1 + 2 * ∑ k ∈ Icc 1 d, (X : ℤ[X]) ^ (4 * k ^ 2)) =
      ∑ x ∈ Icc (-(d : ℤ)) d, monomial (4 * x.natAbs ^ 2) (1 : ℤ) := by
  induction d with
  | zero => simp
  | succ d ih =>
    rw [sum_Icc_succ_top (by omega : 1 ≤ d + 1), Nat.cast_succ,
      sum_Icc_succ_eq_add_endpoints, mul_add, ← add_assoc, ih]
    have hpos : ((d : ℤ) + 1).natAbs = d + 1 := rfl
    have hneg : (-((d : ℤ) + 1)).natAbs = d + 1 := by rw [Int.natAbs_neg, hpos]
    rw [hpos, hneg]
    simp only [X_pow_eq_monomial, two_mul]
    abel

lemma coeff_mul_agree {d : ℕ} {p q r s : ℤ[X]}
    (hp : ∀ m ≤ d, p.coeff m = r.coeff m)
    (hq : ∀ m ≤ d, q.coeff m = s.coeff m) (m : ℕ) (hm : m ≤ d) :
    (p*q).coeff m = (r*s).coeff m := by
  simp only [coeff_mul]
  apply sum_congr rfl
  rintro ⟨i,j⟩ hij
  have h : i + j = m := mem_antidiagonal.mp hij
  rw [hp i (by omega), hq j (by omega)]

lemma sum_sign_eq_ncard {α : Type*} (B : Finset α) (P : α → Prop) [DecidablePred P]
    (e : α → ℤ) (hB : ∀ a, P a → a ∈ B) :
    (∑ a ∈ B, if P a then ((e a).negOnePow : ℤ) else 0) =
      ({a | P a ∧ Even (e a)}.ncard : ℤ) - {a | P a ∧ Odd (e a)}.ncard := by
  classical
  have heq (a : α) :
      (if P a then ((e a).negOnePow : ℤ) else 0) =
      (if P a ∧ Even (e a) then 1 else 0) - (if P a ∧ Odd (e a) then 1 else 0) := by
    by_cases h : P a
    · rcases Int.even_or_odd (e a) with hp | hp
      · simp [h, hp, Int.not_odd_iff_even.mpr hp, Int.negOnePow_even _ hp]
      · simp [h, hp, Int.not_even_iff_odd.mpr hp, Int.negOnePow_odd _ hp]
    · simp [h]
  have hc (Q : ℤ → Prop) [DecidablePred Q] :
      {a | P a ∧ Q (e a)} = (↑(B.filter (fun a => P a ∧ Q (e a))) : Set α) := by
    ext a
    simp only [Set.mem_ofPred_eq, Finset.mem_coe, Finset.mem_filter]
    exact ⟨fun h => ⟨hB a h.1, h⟩, And.right⟩
  simp_rw [heq]
  rw [sum_sub_distrib, hc Even, hc Odd]
  simp only [sum_boole, Set.ncard_coe_finset]

theorem coefficient_count (d : ℕ) :
    (((X : ℤ[X]) * ∏ k ∈ Icc 1 d, ((1 - X ^ (8*k)) * (1 - X ^ (16*k)))) *
      (1 + 2 * ∑ k ∈ Icc 1 d, X ^ (4*k^2))).coeff d =
      ({t : ℤ × ℤ × ℤ | 1 + 8 * pentagonal t.1 + 16 * pentagonal t.2.1 +
        4 * t.2.2.natAbs ^ 2 = d ∧ Even (t.1 + t.2.1)}.ncard : ℤ) -
      {t : ℤ × ℤ × ℤ | 1 + 8 * pentagonal t.1 + 16 * pentagonal t.2.1 +
        4 * t.2.2.natAbs ^ 2 = d ∧ Odd (t.1 + t.2.1)}.ncard := by
  classical
  let I := Icc (-(d : ℤ)) (d : ℤ)
  let S (a : ℕ) := ∑ i ∈ I, monomial (a * pentagonal i) (i.negOnePow : ℤ)
  let B := I ×ˢ (I ×ˢ I)
  let P (t : ℤ × ℤ × ℤ) := 1 + 8 * pentagonal t.1 + 16 * pentagonal t.2.1 +
      4 * t.2.2.natAbs ^ 2 = d
  have hB (t : ℤ × ℤ × ℤ) (ht : P t) : t ∈ B := by
    obtain ⟨i,j,x⟩ := t
    change 1 + 8 * pentagonal i + 16 * pentagonal j + 4 * x.natAbs ^ 2 = d at ht
    have hx : x.natAbs ≤ d := by nlinarith [Nat.le_self_pow (by decide : 2 ≠ 0) x.natAbs]
    have hx' : x ∈ I := by
      change x ∈ Icc (-(d : ℤ)) (d : ℤ)
      exact mem_Icc.mpr (by rw [← abs_le, ← Int.natCast_natAbs]; exact_mod_cast hx)
    exact mem_product.mpr ⟨mem_box_of_pentagonal_le (by dsimp; omega),
      mem_product.mpr ⟨mem_box_of_pentagonal_le (by dsimp; omega), hx'⟩⟩
  rw [prod_mul_distrib, ← mul_assoc, theta_as_sum]
  have hreplace := coeff_mul_agree
    (coeff_mul_agree (coeff_mul_agree (fun m _ => Eq.refl ((X : ℤ[X]).coeff m))
      (fun m hm => dilated_coeff (a := 8) (by decide) hm))
      (fun m hm => dilated_coeff (a := 16) (by decide) hm))
    (r := ((X : ℤ[X]) * S 8 * S 16))
    (fun m _ => Eq.refl ((∑ x ∈ I, monomial (4 * x.natAbs ^ 2) (1 : ℤ)).coeff m))
    d (le_refl d)
  rw [hreplace, ← sum_sign_eq_ncard B P (fun t => t.1+t.2.1) hB]
  simp only [S, B, P, sum_product, mul_sum, sum_mul, ← monomial_one_one_eq_X,
    monomial_mul_monomial, finsetSum_coeff, coeff_monomial, Int.negOnePow_add, Units.val_mul,
    one_mul, mul_one]
  conv_lhs =>
    arg 2; ext x
    rw [sum_comm]
  rw [sum_comm]
  apply sum_congr rfl
  intro i hi
  exact sum_comm

-- Convert pentagonal indices to ternary representations in one residue class.
lemma quadratic_exponent (i j x : ℤ) :
    ((1 + 8 * pentagonal i + 16 * pentagonal j + 4 * x.natAbs ^ 2 : ℕ) : ℤ) =
      4 * x ^ 2 + (2 * i + 4 * j - 1) ^ 2 + 8 * (j - i) ^ 2 := by
  push_cast
  rw [sq_abs]
  linear_combination 4 * two_mul_natCast_pentagonal i + 8 * two_mul_natCast_pentagonal j

lemma reindex (d : ℕ) (P : ℤ → Prop)
    (hP : ∀ a b : ℤ, a % 2 = b % 2 → (P a ↔ P b)) :
    {u : ℤ × ℤ × ℤ |
      1 + 8 * pentagonal u.1 + 16 * pentagonal u.2.1 + 4 * u.2.2.natAbs ^ 2 = d ∧
      P (u.1 + u.2.1)}.ncard =
    {v : ℤ × ℤ × ℤ |
      4 * v.1 ^ 2 + v.2.1 ^ 2 + 8 * v.2.2 ^ 2 = (d : ℤ) ∧
      v.2.1 % 2 = 1 ∧ (v.2.1 + 2 * v.2.2) % 3 = 2 ∧ P v.2.2}.ncard := by
  refine Set.ncard_congr (fun ⟨i, j, x⟩ _ ↦ (x, 2*i + 4*j - 1, j-i)) ?_ ?_ ?_
  · rintro ⟨i, j, x⟩ ⟨heq, hp⟩
    refine ⟨?_, by dsimp; omega, by dsimp; omega, ?_⟩
    · rw [← quadratic_exponent]
      exact_mod_cast heq
    · exact (hP (i+j) (j-i) (by omega)).mp hp
  · rintro ⟨i, j, x⟩ ⟨i', j', x'⟩ _ _ heq
    simp only [Prod.mk.injEq] at heq ⊢
    exact ⟨by omega, by omega, heq.1⟩
  · rintro ⟨x, a, z⟩ ⟨heq, hodd, h3, hp⟩
    dsimp at heq hodd h3 hp
    let j := (a + 2*z + 1) / 6
    let i := j - z
    have hA : 2*i + 4*j - 1 = a := by dsimp [i,j]; omega
    have hZ : j-i = z := by dsimp [i]; omega
    refine ⟨(i, j, x), ⟨?_, (hP (i+j) z (by dsimp [i]; omega)).mpr hp⟩, ?_⟩
    · change 1 + 8 * pentagonal i + 16 * pentagonal j + 4 * x.natAbs ^ 2 = d
      apply Int.ofNat_inj.mp
      rw [quadratic_exponent, hA, hZ]
      exact heq
    · exact congrArg (Prod.mk x) (Prod.ext hA hZ)

lemma signed_reindex (d : ℕ) :
    ({u : ℤ × ℤ × ℤ |
      1 + 8 * pentagonal u.1 + 16 * pentagonal u.2.1 + 4 * u.2.2.natAbs ^ 2 = d ∧
      Even (u.1 + u.2.1)}.ncard : ℤ) -
    {u : ℤ × ℤ × ℤ |
      1 + 8 * pentagonal u.1 + 16 * pentagonal u.2.1 + 4 * u.2.2.natAbs ^ 2 = d ∧
      Odd (u.1 + u.2.1)}.ncard =
    ({v : ℤ × ℤ × ℤ |
      4 * v.1 ^ 2 + v.2.1 ^ 2 + 8 * v.2.2 ^ 2 = (d : ℤ) ∧
      v.2.1 % 2 = 1 ∧ (v.2.1 + 2*v.2.2) % 3 = 2 ∧ Even v.2.2}.ncard : ℤ) -
    {v : ℤ × ℤ × ℤ |
      4 * v.1 ^ 2 + v.2.1 ^ 2 + 8 * v.2.2 ^ 2 = (d : ℤ) ∧
      v.2.1 % 2 = 1 ∧ (v.2.1 + 2*v.2.2) % 3 = 2 ∧ Odd v.2.2}.ncard := by
  rw [reindex d Even (by simp only [Int.even_iff]; omega),
    reindex d Odd (by simp only [Int.odd_iff]; omega)]

lemma lattice_set_eq {n : ℕ} (hn : n % 8 = 2) (P : ℤ → Prop) :
    {v : ℤ × ℤ × ℤ |
      4 * v.1 ^ 2 + v.2.1 ^ 2 + 8 * v.2.2 ^ 2 = ((n / 2 : ℕ) : ℤ) ∧
      v.2.1 % 2 = 1 ∧ (v.2.1 + 2*v.2.2) % 3 = 2 ∧ P v.2.2} =
    {v ∈ CongruentNumber.D n | P v.2.2 ∧ (v.2.1 + 2*v.2.2) % 3 = 2} := by
  have htwo : 2 * ((n / 2 : ℕ) : ℤ) = (n : ℤ) := by omega
  ext ⟨x, a, z⟩
  constructor
  · rintro ⟨heq, -, hr, hp⟩
    refine ⟨?_, hp, hr⟩
    change (n : ℤ) = 8*x^2 + 2*a^2 + 16*z^2
    change 4*x^2 + a^2 + 8*z^2 = ((n / 2 : ℕ) : ℤ) at heq
    linarith
  · rintro ⟨hd, hp, hr⟩
    change (n : ℤ) = 8*x^2 + 2*a^2 + 16*z^2 at hd
    refine ⟨?_, ?_, hr, hp⟩
    · change 4*x^2 + a^2 + 8*z^2 = ((n / 2 : ℕ) : ℤ)
      linarith
    · change a % 2 = 1
      obtain ⟨k, rfl⟩ | ⟨k, rfl⟩ := Int.even_or_odd a
      · ring_nf at hd
        omega
      · omega

-- Reindex Euler's two pentagonal sums and cancel the residue-zero terms in pairs.
theorem signed_theta_expansion (n : ℕ) (hn : n % 8 = 2) :
    let d := n / 2
    let X : Polynomial ℤ := Polynomial.X
    let eta := X * ∏ k ∈ Finset.Icc 1 d, ((1 - X ^ (8 * k)) * (1 - X ^ (16 * k)))
    let theta := 1 + 2 * ∑ k ∈ Finset.Icc 1 d, X ^ (4 * k ^ 2)
    (eta * theta).coeff d =
      ({u ∈ D n | Even u.2.2 ∧ u.2.1 % 4 = 1}.ncard : ℤ) -
       {u ∈ D n | Odd u.2.2 ∧ u.2.1 % 4 = 1}.ncard := by
  dsimp only
  rw [coefficient_count, signed_reindex, lattice_set_eq hn Even, lattice_set_eq hn Odd]
  exact (signed_mod_four_eq_mod_three hn).symm

-- Direct formula for the two representation counts in the original statement.
lemma counts_from_coefficient_of_two_mod_eight (n : ℕ) (hn : n % 8 = 2) :
    let d := n / 2
    let X : Polynomial ℤ := Polynomial.X
    let eta := X * ∏ k ∈ Finset.Icc 1 d, ((1 - X ^ (8 * k)) * (1 - X ^ (16 * k)))
    let theta := 1 + 2 * ∑ k ∈ Finset.Icc 1 d, X ^ (4 * k ^ 2)
    2 * (eta * theta).coeff d = 2 * ((CongruentNumber.C n).ncard : ℤ) - (D n).ncard := by
  dsimp only
  rw [signed_theta_expansion n hn]
  have hfin := finite_D n
  have hcount := parity_difference n hfin
  have heven := sign_pairing hn hfin Even
  have hodd := sign_pairing hn hfin Odd
  omega

theorem counts_from_coefficient (n : ℕ) (hn : n % 4 = 2) :
    let d := n / 2
    let X : Polynomial ℤ := Polynomial.X
    let eta := X * ∏ k ∈ Finset.Icc 1 d, ((1 - X ^ (8 * k)) * (1 - X ^ (16 * k)))
    let theta := 1 + 2 * ∑ k ∈ Finset.Icc 1 d, X ^ (4 * k ^ 2)
    2 * (eta * theta).coeff d = 2 * ((CongruentNumber.C n).ncard : ℤ) - (D n).ncard := by
  rcases (show n % 8 = 2 ∨ n % 8 = 6 by omega) with h | h
  · exact counts_from_coefficient_of_two_mod_eight n h
  · dsimp only
    rw [coefficient_count]
    have empty (P : ℤ → Prop) :
        {t : ℤ × ℤ × ℤ | 1 + 8 * pentagonal t.1 + 16 * pentagonal t.2.1 +
          4 * t.2.2.natAbs ^ 2 = n / 2 ∧ P (t.1 + t.2.1)} = ∅ := by
      apply Set.eq_empty_iff_forall_notMem.mpr
      rintro t ⟨ht, -⟩
      omega
    obtain ⟨hC, hD⟩ := counts_vanish h
    rw [empty Even, empty Odd, hC, hD]
    simp

theorem main : H1 → H2 → H3 → type_of% @CongruentNumber.Tunnell_even := by
  intro modularity point_vanishing central_value n hsq hev htriangle
  rcases residues_of_even_squarefree hsq hev with htwo | hsix
  · have hpoint := exists_point_of_congruent n hsq.ne_zero htriangle
    have hinfinite := infinite_of_point htwo hpoint
    obtain ⟨L, hL⟩ := entire_of_modularity modularity n hsq htwo
    have hcentral := point_vanishing n hsq htwo hinfinite L hL
    have hzero := central_value n hsq htwo L hL hcentral
    have hcoeff := counts_from_coefficient n (by omega : n % 4 = 2)
    dsimp only at hzero hcoeff
    rw [FourierSeries.finite_eq_infinite, hzero] at hcoeff
    omega
  · exact balance_of_six_mod_eight hsix

end OMA.R_CongruentNumber_Tunnell_even_R1
