import OMAReductions.R_CongruentNumber_Tunnell_even_R1

/-!
# Modularity of the congruent-number twists

The cusp form attached to the base curve y² = x³ − x is the eta product
η(4τ)²η(8τ)². The first hypothesis asks for modularity of this explicit
product and the second for its arithmetic coefficient identities.
The proof constructs every required quadratic twist from rational
translations of the base form using finite Fourier inversion.
See Ken Ono, Tate–Shafarevich groups of the congruent number elliptic curves,
Acta Arithmetica 81 (1997), p. 247.
-/

namespace OMA.R_CongruentNumber_Tunnell_even_R1_H1_R1

open MatrixGroups UpperHalfPlane Finset

def H1 : Prop :=
  let b : ℕ → ℤ := fun m =>
    (Polynomial.X * ∏ k ∈ Finset.Icc 1 m,
      ((1 - (Polynomial.X : Polynomial ℤ)^(4*k))^2 * (1 - (Polynomial.X : Polynomial ℤ)^(8*k))^2)).coeff m
  ∃ Γ : Subgroup (GL (Fin 2) ℝ), Γ.IsArithmetic ∧ Γ.strictWidthInfty = 1 ∧
    ∃ F : CuspForm Γ 2, ∀ m : ℕ, (qExpansion 1 F).coeff m = (b m : ℂ)

def H2 : Prop :=
  let b : ℕ → ℤ := fun m =>
    (Polynomial.X * ∏ k ∈ Finset.Icc 1 m,
      ((1 - (Polynomial.X : Polynomial ℤ)^(4*k))^2 * (1 - (Polynomial.X : Polynomial ℤ)^(8*k))^2)).coeff m
  (∀ i j : ℕ, i.Coprime j → b (i*j) = b i * b j) ∧
  (∀ p : Nat.Primes, p.val ≠ 2 →
    letI : NeZero p.val := ⟨p.property.ne_zero⟩
    b p.val = (p.val : ℤ) - (Finset.univ.filter (fun xy : ZMod p.val × ZMod p.val =>
      xy.2^2 = xy.1^3 - xy.1)).card) ∧
  (∀ p : Nat.Primes, p.val ≠ 2 → ∀ r : ℕ,
    b (p.val^(r+2)) = b p.val * b (p.val^(r+1)) - (p.val : ℤ)*b (p.val^r))

namespace TunnellTranslate

open Matrix MatrixGroups ConjAct Pointwise UpperHalfPlane ModularForm
open Matrix.GeneralLinearGroup

lemma rational_translation_map (r : ℚ) :
    (upperRightHom r).map (Rat.castHom ℝ) = upperRightHom (r : ℝ) := by
  ext i j
  fin_cases i <;> fin_cases j <;> simp

lemma translate_apply {Γ : Subgroup (GL (Fin 2) ℝ)} {k : ℤ} (F : CuspForm Γ k)
    (r : ℝ) (τ : ℍ) : (CuspForm.translate F (upperRightHom r)) τ = F (r +ᵥ τ) := by
  change (⇑F ∣[k] (upperRightHom r)) τ = _
  have hact : upperRightHom r • τ = r +ᵥ τ := by
    ext
    simp [σ, num, denom, coe_vadd, UpperHalfPlane.coe_smul, add_comm]
  simp_rw [slash_def, hact]
  simp [σ, denom, val_det_apply]

theorem exists_sum_rational_translates {ι : Type*} [Fintype ι]
    {Γ : Subgroup (GL (Fin 2) ℝ)} [Γ.IsArithmetic] (hwidth : Γ.strictWidthInfty = 1)
    {k : ℤ} (F : CuspForm Γ k) (r : ι → ℚ) (c : ι → ℂ) :
    ∃ H : Subgroup (GL (Fin 2) ℝ), H.IsArithmetic ∧ H.strictWidthInfty = 1 ∧
      ∃ G : CuspForm H k, ∀ τ : ℍ, G τ = ∑ i, c i * F ((r i : ℝ) +ᵥ τ) := by
  classical
  let T (i : ι) := upperRightHom (r i : ℝ)
  let C (i : ι) := (toConjAct (T i)⁻¹) • Γ
  have hC (i : ι) : (C i).IsArithmetic := by
    have h := Subgroup.IsArithmetic.conj Γ (upperRightHom (r i))⁻¹
    simpa only [map_inv, rational_translation_map, C, T] using h
  let H := 𝒮ℒ ⊓ Finset.univ.inf C
  have hH (s : Finset ι) : (𝒮ℒ ⊓ s.inf C).IsArithmetic := by
    induction s using Finset.induction_on with
    | empty => simpa using (inferInstance : Subgroup.IsArithmetic 𝒮ℒ)
    | insert i s hi ih =>
      rw [Finset.inf_insert, inf_left_comm]
      exact @Subgroup.IsArithmetic.inter _ _ (hC i) ih
  have harith : H.IsArithmetic := hH Finset.univ
  have hHC (i : ι) : H ≤ C i := inf_le_right.trans (Finset.inf_le (Finset.mem_univ i))
  have hunit : upperRightHom (1 : ℝ) ∈ Γ := by
    have h := Γ.strictWidthInfty_mem_strictPeriods
    rwa [hwidth, Subgroup.mem_strictPeriods_iff] at h
  have hcunit (i : ι) : upperRightHom (1 : ℝ) ∈ C i := by
    change upperRightHom 1 ∈ toConjAct (T i)⁻¹ • Γ
    rw [map_inv, Subgroup.mem_inv_pointwise_smul_iff, toConjAct_smul]
    have hcomm : T i * upperRightHom 1 = upperRightHom 1 * T i := by
      simp only [T, ← AddChar.map_add_eq_mul, add_comm]
    rwa [hcomm, mul_assoc, mul_inv_cancel, mul_one]
  have hperiods : H.strictPeriods = AddSubgroup.zmultiples 1 := by
    apply le_antisymm
    · rw [← Subgroup.strictPeriods_SL2Z]
      exact fun x hx => Subgroup.mem_strictPeriods_iff.mpr
        ((Subgroup.mem_strictPeriods_iff.mp hx).1)
    · apply AddSubgroup.zmultiples_le.mpr
      apply Subgroup.mem_strictPeriods_iff.mpr
      constructor
      · have h := (AddSubgroup.mem_zmultiples (1 : ℝ))
        rwa [← Subgroup.strictPeriods_SL2Z, Subgroup.mem_strictPeriods_iff] at h
      · simpa [Finset.inf_eq_iInf] using hcunit
  have hHW : H.strictWidthInfty = 1 := by
    rw [Subgroup.strictPeriods_eq_zmultiples_strictWidthInfty, Eq.comm,
      AddSubgroup.zmultiples_eq_zmultiples_iff
        (not_isOfFinAddOrder_of_isAddTorsionFree one_ne_zero)] at hperiods
    grind [Subgroup.strictWidthInfty_nonneg]
  let restrictCusp {H Γ : Subgroup (GL (Fin 2) ℝ)} (h : H ≤ Γ) {k : ℤ} (F : CuspForm Γ k) :
      CuspForm H k := {
    toFun := F
    slash_action_eq' g hg := F.slash_action_eq' g (h hg)
    holo' := F.holo'
    zero_at_cusps' hc := F.zero_at_cusps' (hc.mono h) }
  let forms (i : ι) : CuspForm H k := restrictCusp (hHC i) (CuspForm.translate F (T i))
  refine ⟨H, harith, hHW, ∑ i, c i • forms i, ?_⟩
  intro τ
  simp only [FunLike.coe_sum, Finset.sum_apply, FunLike.coe_smul, Pi.smul_apply, smul_eq_mul]
  exact Finset.sum_congr rfl (fun i _ => congrArg (c i * ·) (translate_apply F _ τ))

end TunnellTranslate

namespace TunnellTwistFourier
open UpperHalfPlane MatrixGroups
open scoped Real

lemma translated_qpow {N : ℕ} [NeZero N] (j : ZMod N) (z : ℍ) (m : ℕ) :
    Function.Periodic.qParam 1 (((-(j.val : ℝ) / (N : ℝ)) +ᵥ z : ℍ) : ℂ) ^ m =
      ZMod.stdAddChar (-(j * (m : ZMod N))) * Function.Periodic.qParam 1 (z : ℂ) ^ m := by
  have h := ZMod.stdAddChar_coe (N := N) (-((j.val : ℤ) * m))
  push_cast at h
  rw [ZMod.natCast_zmod_val] at h
  rw [h]
  simp only [Function.Periodic.qParam, UpperHalfPlane.coe_vadd, Complex.ofReal_div,
    Complex.ofReal_neg, Complex.ofReal_natCast, Complex.ofReal_one, div_one,
    ← Complex.exp_nat_mul, ← Complex.exp_add]
  congr 1
  ring

theorem twist_coefficients {N : ℕ} [NeZero N] (w : ZMod N → ℂ)
    {Γ Γ' : Subgroup (GL (Fin 2) ℝ)} [Γ.IsArithmetic] [Γ'.IsArithmetic]
    (hΓ : Γ.strictWidthInfty = 1) (hΓ' : Γ'.strictWidthInfty = 1)
    (F : CuspForm Γ 2) (G : CuspForm Γ' 2)
    (heq : ∀ z : ℍ, G z = ∑ j : ZMod N,
      (ZMod.dft.symm w) j * F ((-(j.val : ℝ) / (N : ℝ)) +ᵥ z)) (m : ℕ) :
    (qExpansion 1 G).coeff m = w (m : ZMod N) * (qExpansion 1 F).coeff m := by
  let c := ZMod.dft.symm w
  have hper : (1 : ℝ) ∈ Γ.strictPeriods := hΓ ▸ Γ.strictWidthInfty_mem_strictPeriods
  have hper' : (1 : ℝ) ∈ Γ'.strictPeriods := hΓ' ▸ Γ'.strictWidthInfty_mem_strictPeriods
  symm
  apply ModularFormClass.qExpansion_coeff_unique one_pos hper' _ m
  intro z
  rw [heq z]
  have hterm (j : ZMod N) := (ModularForm.hasSum_qExpansion F one_pos hper
    ((-(j.val : ℝ) / (N : ℝ)) +ᵥ z)).mul_left (c j)
  have hsum := hasSum_sum (s := Finset.univ) (fun j _ => hterm j)
  apply hsum.congr_fun
  intro k
  simp only [translated_qpow, smul_eq_mul]
  have heval : ∑ j : ZMod N, ZMod.stdAddChar (-(j * (k : ZMod N))) * c j = w k := by
    simpa only [ZMod.dft_apply, smul_eq_mul] using congrFun (ZMod.dft.apply_symm_apply w) (k : ZMod N)
  rw [← heval, Finset.sum_mul, Finset.sum_mul]
  apply Finset.sum_congr rfl
  intro j _
  ring

end TunnellTwistFourier


namespace TunnellTwistFourier
open MatrixGroups UpperHalfPlane

theorem periodic_twist {N : ℕ} [NeZero N] (w : ZMod N → ℂ)
    {Γ : Subgroup (GL (Fin 2) ℝ)} [Γ.IsArithmetic]
    (hΓ : Γ.strictWidthInfty = 1) (F : CuspForm Γ 2) :
    ∃ H : Subgroup (GL (Fin 2) ℝ), H.IsArithmetic ∧ H.strictWidthInfty = 1 ∧
      ∃ G : CuspForm H 2, ∀ m : ℕ,
        (qExpansion 1 G).coeff m = w (m : ZMod N) * (qExpansion 1 F).coeff m := by
  obtain ⟨H, hH, hwidth, G, heq⟩ := TunnellTranslate.exists_sum_rational_translates hΓ F
    (fun j : ZMod N => -(j.val : ℚ) / (N : ℚ)) (ZMod.dft.symm w)
  letI := hH
  refine ⟨H, hH, hwidth, G, fun m => twist_coefficients w hΓ hwidth F G ?_ m⟩
  intro z
  simpa only [Rat.cast_div, Rat.cast_neg, Rat.cast_natCast] using heq z

end TunnellTwistFourier

theorem twist_modularity (hbase :
  ∃ Γ : Subgroup (GL (Fin 2) ℝ), Γ.IsArithmetic ∧ Γ.strictWidthInfty = 1 ∧
    ∃ F : CuspForm Γ 2,
    let a := fun m : ℕ => (qExpansion 1 F).coeff m
    a 1 = 1 ∧
    (∀ i j : ℕ, i.Coprime j → a (i*j) = a i * a j) ∧
    (∀ p : Nat.Primes, p.val ≠ 2 →
      letI : NeZero p.val := ⟨p.property.ne_zero⟩
      a p.val = (((p.val : ℤ) - (Finset.univ.filter (fun xy : ZMod p.val × ZMod p.val =>
            xy.2^2 = xy.1^3 - xy.1)).card : ℤ) : ℂ)) ∧
    (∀ p : Nat.Primes, p.val ≠ 2 → ∀ r : ℕ,
      a (p.val^(r+2)) = a p.val * a (p.val^(r+1)) - (p.val : ℂ)*a (p.val^r))) : OMA.R_CongruentNumber_Tunnell_even_R1.H1 := by
  obtain ⟨Γ, hΓ, hwidth, F, h1, hmul, htrace, hrec⟩ := hbase
  dsimp only at hmul htrace hrec
  letI : Γ.IsArithmetic := hΓ
  let weight (n m : ℕ) : ℤ := if Odd m then jacobiSym n m else 0

  have weight_one (n : ℕ) : weight n 1 = 1 := by simp [weight]

  have weight_mul (n a b : ℕ) : weight n (a*b) = weight n a * weight n b := by
    by_cases ha : Odd a <;> by_cases hb : Odd b <;> simp [weight, Nat.odd_mul, ha, hb]
    exact jacobiSym.mul_right' _ (fun e => by simp [e] at ha) (fun e => by simp [e] at hb)

  have weight_mod (n m : ℕ) : weight n (m % (4*n)) = weight n m := by
    have he : Even (4*n) := Even.mul_right (by decide) _
    have h : Odd (m % (4*n)) ↔ Odd m := by
      simp only [Nat.odd_iff, Nat.mod_mod_of_dvd _ he.two_dvd]
    by_cases hm : Odd m
    · simpa [weight, h, hm] using (jacobiSym.mod_right' n hm).symm
    · simp [weight, h, hm]

  have weight_prime (n : ℕ) (p : Nat.Primes) [Fact p.val.Prime] (hp : p.val ≠ 2) :
      weight n p.val = quadraticChar (ZMod p.val) (n : ZMod p.val) := by
    have ho : Odd p.val := Nat.odd_iff.mpr (p.property.eq_two_or_odd.resolve_left hp)
    dsimp only [weight]
    rw [if_pos ho, ← jacobiSym.legendreSym.to_jacobiSym, legendreSym]
    simp

  have weight_bad_prime (n : ℕ) (p : Nat.Primes) (hp : p.val ∣ 2*n) :
      weight n p.val = 0 := by
    letI : Fact p.val.Prime := ⟨p.property⟩
    by_cases h : p.val = 2
    · simp [weight, h]
    · have hd : p.val ∣ n := (p.property.dvd_mul.mp hp).resolve_left
        (fun e => h ((Nat.prime_dvd_prime_iff_eq p.property Nat.prime_two).mp e))
      rw [weight_prime n p h, (ZMod.natCast_eq_zero_iff n _).mpr hd, quadraticChar_zero]
  intro n _ hmod
  letI : NeZero (4*n) := ⟨by omega⟩
  let w (m : ℕ) : ℂ := (weight n m : ℤ)
  let wmod (m : ZMod (4*n)) : ℂ := w m.val
  obtain ⟨Γ', hΓ', hwidth', G, hG⟩ := TunnellTwistFourier.periodic_twist wmod hwidth F
  have hG' (m : ℕ) : (qExpansion 1 G).coeff m = w m * (qExpansion 1 F).coeff m := by
    simpa only [wmod, w, ZMod.val_natCast, weight_mod] using hG m
  have wm (a b : ℕ) : w (a*b) = w a*w b := by simp only [w, weight_mul, Int.cast_mul]
  have w1 : w 1 = 1 := by simp [w, weight_one]
  have wpow (a k : ℕ) : w (a^k) = w a^k := by
    induction k with
    | zero => simp [w1]
    | succ k hk => simp only [pow_succ, wm, hk]
  refine ⟨Γ', hΓ', hwidth', G, ?_, ?_, ?_, ?_, ?_⟩
  · change (qExpansion 1 G).coeff 1 = 1
    rw [hG', w1, one_mul]
    exact h1
  · intro i j hij
    change (qExpansion 1 G).coeff _ = (qExpansion 1 G).coeff _ * (qExpansion 1 G).coeff _
    rw [hG', hG', hG', wm, hmul i j hij]
    ring
  · intro p hp r
    change (qExpansion 1 G).coeff _ = 0
    have hw0 : w p.val = 0 := by simp [w, weight_bad_prime n p hp]
    rw [hG', wpow, hw0, zero_pow (by omega : r+1 ≠ 0), zero_mul]
  · intro p hp
    letI : Fact p.val.Prime := ⟨p.property⟩
    have hp2 : p.val ≠ 2 := fun e => hp (e ▸ dvd_mul_right 2 n)
    change (qExpansion 1 G).coeff _ = _
    rw [hG']
    change ((weight n p.val : ℤ) : ℂ) * _ = _
    rw [weight_prime n p hp2]
    have ht := htrace p hp2
    change (qExpansion 1 F).coeff _ = _ at ht
    rw [ht, Int.cast_mul]
  · intro p hp r
    letI : Fact p.val.Prime := ⟨p.property⟩
    have hp2 : p.val ≠ 2 := fun e => hp (e ▸ dvd_mul_right 2 n)
    have hpn : ¬ p.val ∣ n := fun hd => hp (dvd_mul_of_dvd_right hd 2)
    have hw2 : w p.val ^ 2 = 1 := by
      dsimp [w]
      rw [weight_prime n p hp2, ← Int.cast_pow,
        quadraticChar_sq_one ((ZMod.natCast_eq_zero_iff n p.val).not.mpr hpn), Int.cast_one]
    dsimp only
    simp only [hG', wpow]
    have hr := hrec p hp2 r
    change (qExpansion 1 F).coeff _ = _ at hr
    rw [hr, pow_add (w p.val) r 2, pow_add (w p.val) r 1, pow_one]
    linear_combination -(w p.val ^r * p.val * (qExpansion 1 F).coeff (p.val^r)) * hw2


open Polynomial in
theorem eta_one :
    (X * ∏ k ∈ Icc 1 1, ((1 - (X : ℤ[X])^(4*k))^2 * (1-X^(8*k))^2)).coeff 1 = 1 := by
  simp [Polynomial.coeff_X_mul, Polynomial.coeff_zero_eq_eval_zero]

theorem main : H1 → H2 → OMA.R_CongruentNumber_Tunnell_even_R1.H1 := by
  intro hform harith
  obtain ⟨Γ, hΓ, hwidth, F, hF⟩ := hform
  obtain ⟨hmul, htrace, hrec⟩ := harith
  apply twist_modularity
  refine ⟨Γ, hΓ, hwidth, F, ?_, ?_, ?_, ?_⟩
  · exact (hF 1).trans (by exact_mod_cast eta_one)
  · intro i j hij
    dsimp only
    rw [hF, hF, hF]
    exact_mod_cast hmul i j hij
  · intro p hp
    dsimp only
    exact (hF _).trans (congrArg (fun z : ℤ => (z : ℂ)) (htrace p hp))
  · intro p hp r
    dsimp only
    simp only [hF]
    exact_mod_cast hrec p hp r

end OMA.R_CongruentNumber_Tunnell_even_R1_H1_R1
