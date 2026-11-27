import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H1_R1
import Mathlib.NumberTheory.JacobiSum.Basic
import Mathlib.NumberTheory.MulChar.Lemmas
import Mathlib.RingTheory.RootsOfUnity.Complex
import Mathlib.NumberTheory.Zsqrtd.GaussianInt
import Mathlib.RingTheory.AdjoinRoot
import Mathlib.NumberTheory.ModularForms.EisensteinSeries.Summable
import TunnellGaussianHecke
import TunnellCoates

/- The quartic Jacobi sum for the split primes of the congruent-number base curve. -/

namespace TunnellSplit

open Finset
open scoped ComplexConjugate

variable {F : Type*} [Field F] [Fintype F] [DecidableEq F]

noncomputable def phi (F : Type*) [Field F] [Fintype F] [DecidableEq F] : MulChar F ℂ :=
  (quadraticChar F).ringHomComp (Int.castRingHom ℂ)

@[simp] lemma phi_apply (a : F) : phi F a = (quadraticChar F a : ℂ) := rfl

lemma phi_square : phi F ^ 2 = 1 := by
  ext x
  rw [MulChar.pow_apply_coe, phi_apply, MulChar.one_apply x.isUnit]
  exact_mod_cast quadraticChar_sq_one x.ne_zero

lemma quadratic_unique {χ ψ : MulChar F ℂ}
    (hχ : χ ^ 2 = 1) (hψ : ψ ^ 2 = 1) (hc : χ ≠ 1) (hd : ψ ≠ 1) : χ = ψ := by
  let e := MulChar.equiv_rootsOfUnity F ℂ
  let h : MulChar F ℂ →* ℂ := (Units.coeHom ℂ).comp
    ((rootsOfUnity (Fintype.card Fˣ) ℂ).subtype.comp e.toMonoidHom)
  have hi : Function.Injective h := Units.val_injective.comp (Subtype.val_injective.comp e.injective)
  have hn (a : MulChar F ℂ) (ha : a^2 = 1) (hb : a ≠ 1) : h a = -1 := by
    apply (sq_eq_one_iff.mp (show (h a)^2 = 1 by rw [← map_pow, ha, map_one])).resolve_left
    exact fun he => hb (hi (he.trans h.map_one.symm))
  exact hi ((hn χ hχ hc).trans (hn ψ hψ hd).symm)

theorem quartic_exists (p : ℕ) [Fact p.Prime] (hp : p % 4 = 1) :
    ∃ χ : MulChar (ZMod p) ℂ, orderOf χ = 4 ∧ χ ^ 2 = phi (ZMod p) := by
  have hd : 4 ∣ Fintype.card (ZMod p) - 1 := by rw [ZMod.card]; omega
  obtain ⟨χ, hχ⟩ := MulChar.exists_mulChar_orderOf (ZMod p) hd Complex.isPrimitiveRoot_I
  refine ⟨χ, hχ, quadratic_unique ?_ phi_square ?_ ?_⟩
  · rw [← pow_mul, show 2 * 2 = 4 by decide, ← hχ, pow_orderOf_eq_one]
  · intro h
    have := orderOf_dvd_of_pow_eq_one h
    rw [hχ] at this
    omega
  · apply (MulChar.ringHomComp_ne_one_iff (Int.cast_injective (α := ℂ))).mpr
    apply quadraticChar_ne_one
    rw [ZMod.ringChar_zmod_n]; omega

lemma square_grouping (hc : ringChar F ≠ 2) (f : F → ℂ) :
    ∑ x : F, f (x^2) = ∑ y : F, (1 + phi F y) * f y := by
  classical
  calc
    _ = ∑ y : F, ∑ x ∈ univ.filter (fun x : F => x^2 = y), f (x^2) := by
      rw [sum_fiberwise_of_maps_to (fun x _ => mem_univ (x^2))]
    _ = _ := by
      apply sum_congr rfl
      intro y _
      have he : ∑ x ∈ univ.filter (fun x : F => x^2 = y), f (x^2) =
          ∑ _x ∈ univ.filter (fun x : F => x^2 = y), f y :=
        sum_congr rfl (fun x hx => congrArg f (mem_filter.mp hx).2)
      rw [he, sum_const, nsmul_eq_mul]
      have h := quadraticChar_card_sqrts hc y
      rw [Set.toFinset_ofPred] at h
      have hc' : ((univ.filter (fun x : F => x^2 = y)).card : ℂ) = phi F y + 1 := by
        rw [phi_apply]; exact_mod_cast h
      rw [hc', add_comm]

theorem trace_jacobi (p : Nat.Primes) [Fact p.val.Prime] (hp : p.val % 4 = 1)
    (χ : MulChar (ZMod p.val) ℂ) (hχ : χ ^ 2 = phi (ZMod p.val)) :
    let a : ℤ := (p.val : ℤ) - (univ.filter (fun xy : ZMod p.val × ZMod p.val =>
      xy.2^2 = xy.1^3 - xy.1)).card
    (a : ℂ) = -(jacobiSum χ (phi (ZMod p.val)) + jacobiSum (χ^3) (phi (ZMod p.val))) := by
  let F := ZMod p.val
  have hp2 : p.val ≠ 2 := by omega
  have hc : ringChar (ZMod p.val) ≠ 2 := by simpa only [ZMod.ringChar_zmod_n] using hp2
  have hn : quadraticChar (ZMod p.val) (-1) = 1 := by
    simpa only [legendreSym, Int.cast_neg, Int.cast_one] using
      (legendreSym.at_neg_one hp2).trans (ZMod.χ₄_nat_one_mod_four hp)
  have hφ (x : ZMod p.val) : phi (ZMod p.val) x = χ x ^ 2 := by
    rw [← hχ, MulChar.pow_apply' _ (by decide : 2 ≠ 0)]
  have hf (x : ZMod p.val) : (quadraticChar (ZMod p.val) (x^3 - x) : ℂ) =
      χ (x^2) * phi (ZMod p.val) (1-x^2) := by
    rw [show x^3 - x = (-1) * x * (1-x^2) by ring, map_mul, map_mul, hn, one_mul, Int.cast_mul,
      ← phi_apply, ← phi_apply, hφ x, map_pow]
  have ht := OMA.R_CongruentNumber_Tunnell_even_R1.trace_eq_neg_sum 1 p hp2
  simp only [Nat.cast_one, one_pow, one_mul] at ht
  dsimp only
  rw [ht, Int.cast_neg, Int.cast_sum]
  simp_rw [hf]
  rw [square_grouping hc (fun x => χ x * phi (ZMod p.val) (1-x))]
  congr 1
  rw [jacobiSum, jacobiSum, ← sum_add_distrib]
  apply sum_congr rfl
  intro y _
  rw [hφ y, MulChar.pow_apply' _ (by decide : 3 ≠ 0)]
  ring

open GaussianInt in
lemma jacobi_is_gaussian {χ : MulChar F ℂ} (hχ : χ ^ 4 = 1) :
    ∃ g : GaussianInt, (g : ℂ) = jacobiSum χ (phi F) := by
  have hφ : (phi F) ^ 4 = 1 := by
    rw [show 4 = 2 * 2 by decide, pow_mul, phi_square, one_pow]
  have hm := jacobiSum_mem_algebraAdjoin_of_pow_eq_one hχ hφ Complex.isPrimitiveRoot_I
  let e := GaussianInt.toComplex.toIntAlgHom
  have H : Algebra.adjoin ℤ ({Complex.I} : Set ℂ) ≤ e.range := by
    apply Algebra.adjoin_le
    intro x hx
    obtain rfl := Set.mem_singleton_iff.mp hx
    refine ⟨⟨0, 1⟩, ?_⟩
    change ((⟨0, 1⟩ : GaussianInt) : ℂ) = Complex.I
    simp [GaussianInt.toComplex_def']
  exact H hm

omit [DecidableEq F] in
lemma conj_jacobi (χ ψ : MulChar F ℂ) :
    conj (jacobiSum χ ψ) = jacobiSum χ⁻¹ ψ⁻¹ := by
  unfold jacobiSum
  rw [map_sum]
  apply sum_congr rfl
  intro x _
  rw [map_mul]
  exact congrArg₂ (· * ·) (χ.star_apply' _) (ψ.star_apply' _)

theorem split_trace_norm (p : Nat.Primes) [Fact p.val.Prime] (hp : p.val % 4 = 1) :
    let t : ℤ := (p.val : ℤ) - (univ.filter (fun xy : ZMod p.val × ZMod p.val =>
      xy.2^2 = xy.1^3 - xy.1)).card
    ∃ a b : ℤ, t = 2 * a ∧ a^2 + b^2 = p.val := by
  dsimp only
  obtain ⟨χ, ho, hχ⟩ := quartic_exists p.val hp
  let ψ := phi (ZMod p.val)
  have h4 : χ ^ 4 = 1 := ho ▸ pow_orderOf_eq_one χ
  have h3 : χ ^ 3 = χ⁻¹ := by
    apply eq_inv_of_mul_eq_one_left
    exact h4
  have hψ : ψ⁻¹ = ψ := by
    symm; apply eq_inv_of_mul_eq_one_left
    rw [← pow_two]; exact phi_square
  have hne {k : ℕ} (hk : ¬ 4 ∣ k) : χ ^ k ≠ 1 := by
    intro h
    exact hk (ho ▸ orderOf_dvd_of_pow_eq_one h)
  have hc : ringChar ℂ ≠ ringChar (ZMod p.val) := by
    rw [ringChar.eq_zero, ZMod.ringChar_zmod_n]
    exact p.property.ne_zero.symm
  have hn := jacobiSum_mul_jacobiSum_inv (F' := ℂ) hc
    (χ := χ) (φ := ψ) (by simpa using hne (k := 1) (by decide))
    (by simpa only [ψ, ← hχ] using hne (k := 2) (by decide))
    (by change χ * phi (ZMod p.val) ≠ 1; rw [← hχ, ← pow_succ']; exact hne (by decide))
  rw [← conj_jacobi, ZMod.card] at hn
  have ht := trace_jacobi p hp χ hχ
  change _ = -(jacobiSum χ ψ + jacobiSum (χ^3) ψ) at ht
  have hh : jacobiSum χ⁻¹ ψ = conj (jacobiSum χ ψ) := by rw [conj_jacobi, hψ]
  rw [h3, hh] at ht
  obtain ⟨g, hg⟩ := jacobi_is_gaussian h4
  change (g : ℂ) = jacobiSum χ ψ at hg
  rw [← hg, GaussianInt.toComplex_def₂] at hn ht
  refine ⟨-g.re, g.im, ?_, ?_⟩
  · have ht' := congrArg Complex.re ht
    simp only [Complex.intCast_re, Complex.neg_re, Complex.add_re, Complex.conj_re] at ht'
    norm_cast at ht'
    rw [Int.subNatNat_eq_coe] at ht'
    linarith
  · have hn' := congrArg Complex.re hn
    simp only [Complex.mul_re, Complex.conj_re, Complex.conj_im, Complex.natCast_re] at hn'
    norm_cast at hn'
    nlinarith

end TunnellSplit

/- The Frobenius trace of every congruent-number twist vanishes at primes 3 modulo 4. -/

namespace TunnellInert

open Finset Polynomial

theorem eta_zero_of_mod_four {m : ℕ} (hm : m % 4 ≠ 1) :
    (X * ∏ k ∈ Icc 1 m, ((1 - (X : ℤ[X])^(4*k))^2 * (1-X^(8*k))^2)).coeff m = 0 := by
  cases m with
  | zero => simp
  | succ d =>
    let P : ℤ[X] := ∏ k ∈ Icc 1 (d+1), ((1-X^k)^2 * (1-X^(2*k))^2)
    have hP : (expand ℤ 4) P =
        ∏ k ∈ Icc 1 (d+1), ((1-(X : ℤ[X])^(4*k))^2 * (1-X^(8*k))^2) := by
      dsimp only [P]
      simp only [map_prod, map_mul, map_pow, map_sub, map_one, expand_X, ← pow_mul,
        ← Nat.mul_assoc]
    rw [← hP, Polynomial.coeff_X_mul, Polynomial.coeff_expand (by decide : 0 < 4)]
    exact if_neg (by omega)

theorem inert_trace_zero (n : ℕ) (p : Nat.Primes) (hp : p.val % 4 = 3) :
    letI : NeZero p.val := ⟨p.property.ne_zero⟩
    (p.val : ℤ) - (Finset.univ.filter (fun xy : ZMod p.val × ZMod p.val =>
      xy.2^2 = xy.1^3 - (n : ZMod p.val)^2 * xy.1)).card = 0 := by
  letI : Fact p.val.Prime := ⟨p.property⟩
  have hp' : p.val ≠ 2 := by omega
  let f (x : ZMod p.val) := quadraticChar (ZMod p.val) (x^3 - (n : ZMod p.val)^2*x)
  have hchi : quadraticChar (ZMod p.val) (-1) = -1 := by
    simpa only [legendreSym, Int.cast_neg, Int.cast_one] using
      ((legendreSym.at_neg_one hp').trans (ZMod.χ₄_nat_three_mod_four hp))
  have hf (x : ZMod p.val) : f (-x) = - f x := by
    dsimp only [f]
    rw [show (-x)^3-(n : ZMod p.val)^2 * (-x) = (-1)*(x^3-(n : ZMod p.val)^2*x) by ring,
      map_mul, hchi, neg_one_mul]
  have hsum := Equiv.sum_comp (Equiv.neg (ZMod p.val)) f
  change (∑ x : ZMod p.val, f (-x)) = ∑ x : ZMod p.val, f x at hsum
  simp_rw [hf, Finset.sum_neg_distrib] at hsum
  have ht := OMA.R_CongruentNumber_Tunnell_even_R1.trace_eq_neg_sum n p hp'
  change _ = - ∑ x : ZMod p.val, f x at ht
  omega

theorem inert_coefficient_eq_trace (p : Nat.Primes) (hp : p.val % 4 = 3) :
    letI : NeZero p.val := ⟨p.property.ne_zero⟩
    (X * ∏ k ∈ Icc 1 p.val, ((1 - (X : ℤ[X])^(4*k))^2 * (1-X^(8*k))^2)).coeff p.val =
    (p.val : ℤ) - (Finset.univ.filter (fun xy : ZMod p.val × ZMod p.val =>
      xy.2^2 = xy.1^3 - xy.1)).card := by
  rw [eta_zero_of_mod_four (by omega)]
  simpa only [Nat.cast_one, one_pow, one_mul] using (inert_trace_zero 1 p hp).symm

end TunnellInert

/- Identification of the coefficient of the Gaussian Hecke theta series at every odd prime. -/

namespace TunnellSplitMass

open Finset TunnellGaussian

lemma trace_primary {a b : ℤ} (h : (8 : ℤ) ∣ a^2 + b^2 + 1 - 2*a) :
    Primary (⟨a,b⟩ : GaussianInt) := by
  rw [primary_iff]
  have hh := (ZMod.intCast_zmod_eq_zero_iff_dvd _ 8).mpr h
  push_cast at hh
  have finite_check : ∀ x y : ZMod 8, x^2 + y^2 + 1 - 2*x = 0 →
      y.val % 2 = 0 ∧ (x.val + y.val) % 4 = 1 := by decide
  obtain ⟨he,hr⟩ := finite_check _ _ hh
  have ha := ZMod.val_intCast (n := 8) a
  have hb := ZMod.val_intCast (n := 8) b
  change b%2 = 0 ∧ (a+b)%4 = 1
  omega

lemma primary_trace_exists (p : Nat.Primes) [Fact p.val.Prime] (hp : p.val % 4 = 1) :
    ∃ z ∈ shell p.val,
      (p.val : ℤ) - (univ.filter (fun xy : ZMod p.val × ZMod p.val =>
        xy.2^2 = xy.1^3 - xy.1)).card = 2 * z.re := by
  obtain ⟨a,b,ht,hn⟩ := TunnellSplit.split_trace_norm p hp
  have hd := TunnellCoates.eight_dvd_points_base p.val hp
  have h : (8 : ℤ) ∣ a^2 + b^2 + 1 - 2*a := by
    obtain ⟨k,hk⟩ := hd
    refine ⟨k, ?_⟩
    rw [hn, ← ht]
    omega
  have hz : (⟨a,b⟩ : GaussianInt).norm = p.val := by rw [norm_sq]; exact hn
  exact ⟨⟨a,b⟩, mem_shell.mpr ⟨trace_primary h, by simp [hz]⟩, ht⟩

theorem trace_mass_split (p : Nat.Primes) [Fact p.val.Prime] (hp : p.val % 4 = 1) :
    (mass p.val).re = (p.val : ℤ) - (univ.filter (fun xy : ZMod p.val × ZMod p.val =>
      xy.2^2 = xy.1^3 - xy.1)).card := by
  classical
  obtain ⟨z,hz,ht⟩ := primary_trace_exists p hp
  unfold mass
  rw [shell_split_prime p.property hz, sum_pair (distinct_star_of_prime p.property (mem_shell.mp hz).2), ht]
  change z.re + z.re = 2 * z.re
  ring

lemma shell_mod_four {n : ℕ} (hn : n % 4 = 3) : shell n = ∅ := by
  apply eq_empty_iff_forall_notMem.mpr
  intro z hz
  have hh := GaussianInt.abs_natCast_norm z
  rw [(mem_shell.mp hz).2, norm_sq] at hh
  have h : ((n : ℕ) : ZMod 4) = 3 := by
    apply ZMod.val_injective 4
    rw [ZMod.val_natCast, hn]
    decide
  have hx := congrArg (fun k : ℤ => (k : ZMod 4)) hh
  push_cast at hx
  rw [h] at hx
  have no_three : ∀ a b : ZMod 4, (3 : ZMod 4) ≠ a^2 + b^2 := by decide
  exact no_three _ _ hx

theorem trace_mass_odd (p : Nat.Primes) (hp : p.val ≠ 2) :
    letI : NeZero p.val := ⟨p.property.ne_zero⟩
    (mass p.val).re = (p.val : ℤ) - (univ.filter (fun xy : ZMod p.val × ZMod p.val =>
      xy.2^2 = xy.1^3 - xy.1)).card := by
  letI : Fact p.val.Prime := ⟨p.property⟩
  have ho := p.property.odd_of_ne_two hp
  rcases (show p.val % 4 = 1 ∨ p.val % 4 = 3 by obtain ⟨k,hk⟩ := ho; omega) with h|h
  · exact trace_mass_split p h
  · have ht := TunnellInert.inert_trace_zero 1 p h
    simp only [Nat.cast_one, one_pow, one_mul] at ht
    simp [mass, shell_mod_four h, ht]

end TunnellSplitMass

/- Truncated unary theta identities imply the signed two-dimensional lattice expansion. -/

namespace TunnellJacobiFiniteBridge

open Polynomial Finset

def H1 : Prop := ∀ d : ℕ,
  (X : ℤ[X])^(d+1) ∣
    (∏ t ∈ Icc 1 d, (1-X^(8*t)))^3 -
    ∑ k ∈ range (d+1), C ((-1:ℤ)^k * (2*k+1)) * X^(8*(k+1).choose 2)

def H2 : Prop := ∀ d : ℕ,
  (X : ℤ[X])^(d+1) ∣
    (∏ t ∈ Icc 1 d, (1-X^(4*t)))^2 -
    (∑ j ∈ Icc (-(d:ℤ)) (d:ℤ), C (j.negOnePow:ℤ) * X^(4*j.natAbs^2)) *
    ∏ t ∈ Icc 1 d, (1-X^(8*t))

lemma exponent_eq (k : ℕ) : 1+8*(k+1).choose 2 = (2*k+1)^2 := by
  induction k with
  | zero => decide
  | succ k ih =>
    rw [Nat.choose_succ_succ, Nat.choose_one_right]
    nlinarith

lemma unary_to_lattice (h₁ : H1) (h₂ : H2) (d : ℕ) :
    (X * ∏ t ∈ Icc 1 d, ((1-(X:ℤ[X])^(4*t))^2 * (1-X^(8*t))^2)).coeff d =
      ∑ k ∈ range (d+1), ∑ j ∈ Icc (-(d:ℤ)) (d:ℤ),
        if (2*k+1)^2 + 4*j.natAbs^2 = d then
            (((k:ℤ)+j).negOnePow : ℤ) * (2*k+1) else 0 := by
  let f (a : ℕ) : ℤ[X] := ∏ t ∈ Icc 1 d, (1-X^(a*t))
  let c (k : ℕ) : ℤ[X] := C ((-1:ℤ)^k*(2*k+1))*X^(8*(k+1).choose 2)
  let g (j : ℤ) : ℤ[X] := C (j.negOnePow:ℤ)*X^(4*j.natAbs^2)
  let S := ∑ k ∈ range (d+1), c k
  let T := ∑ j ∈ Icc (-(d:ℤ)) (d:ℤ), g j
  have hc : X^(d+1) ∣ f 8 ^ 3 - S := h₁ d
  have ht : X^(d+1) ∣ f 4 ^ 2 - T * f 8 := h₂ d
  have hd : X^(d+1) ∣ X*f 4^2*f 8^2 - X*S*T := by
    have h := dvd_add (ht.mul_left (X * f 8 ^2)) (hc.mul_left (X*T))
    convert h using 1
    ring
  have he := X_pow_dvd_iff.1 hd d (by omega)
  rw [coeff_sub,sub_eq_zero] at he
  have hf : (∏ t ∈ Icc 1 d, ((1-(X:ℤ[X])^(4*t))^2 * (1-X^(8*t))^2)) =
      f 4^2 * f 8^2 := by simp only [f, prod_mul_distrib, prod_pow]
  rw [hf, ←mul_assoc, he]
  have hm (k : ℕ) (j : ℤ) : (X*c k*g j).coeff d =
    if (2*k+1)^2+4*j.natAbs^2=d then (((k:ℤ)+j).negOnePow:ℤ)*(2*k+1) else 0 := by
    have hp : X*c k*g j = C (((-1:ℤ)^k*(2*k+1))*(j.negOnePow:ℤ)) *
      X^(1+8*(k+1).choose 2+4*j.natAbs^2) := by
      simp only [c,g,map_mul,pow_add,pow_one]
      ring
    rw [hp,exponent_eq,coeff_C_mul_X_pow]
    simp only [Int.negOnePow_add, Units.val_mul, Int.coe_negOnePow_natCast]
    split_ifs <;> first | contradiction | (exfalso; solve_by_elim [Eq.symm]) | ring
  simp only [S,T,mul_sum,sum_mul,finsetSum_coeff,hm]
  exact Finset.sum_comm

end TunnellJacobiFiniteBridge

/- The signed lattice parametrization of the primary Gaussian integers of a fixed norm. -/

namespace TunnellEtaLattice

open Finset TunnellGaussian

def weight (k : ℕ) (j : ℤ) : ℤ := (Int.negOnePow ((k:ℤ)+j) : ℤ) * (2*(k:ℤ)+1)

def encode (k : ℕ) (j : ℤ) : GaussianInt := ⟨weight k j, 2*j⟩

lemma weight_cases (k : ℕ) (j : ℤ) :
    (weight k j = 2*(k:ℤ)+1 ∧ ((k:ℤ)+j)%2=0) ∨
    (weight k j = -(2*(k:ℤ)+1) ∧ ((k:ℤ)+j)%2=1) := by
  rcases Int.even_or_odd ((k:ℤ)+j) with h|h
  · left; rw [weight, Int.negOnePow_even _ h]; simp only [Units.val_one,one_mul,true_and]
    obtain ⟨v,hv⟩ := h; omega
  · right; rw [weight, Int.negOnePow_odd _ h]; simp only [Units.val_one,one_mul,Units.val_neg,neg_mul,true_and]
    obtain ⟨v,hv⟩ := h; omega

lemma primary_encode (k : ℕ) (j : ℤ) : Primary (encode k j) := by
  rw [primary_iff]
  change (2*j)%2=0 ∧ (weight k j+2*j)%4=1
  rcases weight_cases k j with ⟨h,he⟩|⟨h,he⟩ <;> omega

lemma norm_encode (k : ℕ) (j : ℤ) :
    (encode k j).norm = (2*(k:ℤ)+1)^2 + 4*j^2 := by
  rw [norm_sq]
  change (weight k j)^2+(2*j)^2 = _
  rcases weight_cases k j with ⟨h,-⟩|⟨h,-⟩ <;> rw [h] <;> ring

lemma abs_encode (k : ℕ) (j : ℤ) : (encode k j).re.natAbs = 2*k+1 := by
  change (weight k j).natAbs = _
  have hc : 2*(k:ℤ)+1 = ((2*k+1:ℕ):ℤ) := by push_cast; ring
  rcases weight_cases k j with ⟨h,-⟩|⟨h,-⟩ <;> rw [h,hc] <;> simp only [Int.natAbs_neg, Int.natAbs_natCast]

lemma encode_injective {k l : ℕ} {j h : ℤ} (e : encode k j = encode l h) : k=l ∧ j=h := by
  have a := congrArg (fun z : GaussianInt => z.re.natAbs) e
  simp only [abs_encode] at a
  have b := congrArg Zsqrtd.im e
  change 2*j=2*h at b
  omega

lemma encode_surjective {z : GaussianInt} (hz : Primary z) :
    ∃ k : ℕ, ∃ j : ℤ, encode k j = z := by
  obtain ⟨hi,hr⟩ := (primary_iff _).mp hz
  let k := z.re.natAbs/2
  let j := z.im/2
  have hj : 2*j = z.im := by dsimp [j]; omega
  have habs : z.re = (z.re.natAbs : ℤ) ∨ z.re = -(z.re.natAbs : ℤ) := Int.natAbs_eq z.re
  have hk : z.re.natAbs = 2*k+1 := by dsimp [k]; omega
  refine ⟨k,j, ?_⟩
  have hp := (primary_iff _).mp (primary_encode k j)
  change _ ∧ (weight k j + 2*j)%4=1 at hp
  ext
  · change weight k j = z.re
    rcases weight_cases k j with ⟨he,-⟩|⟨he,-⟩ <;> omega
  · exact hj

def indices (n : ℕ) : Finset (ℕ × ℤ) :=
  ((range (n+1)) ×ˢ (Icc (-(n:ℤ)) (n:ℤ))).filter (fun kj =>
    (2*(kj.1:ℤ)+1)^2+4*kj.2^2 = n)

lemma indices_iff (n k : ℕ) (j : ℤ) :
    (k,j) ∈ indices n ↔ (2*(k:ℤ)+1)^2+4*j^2 = n := by
  simp only [indices,mem_filter,mem_product,mem_range,mem_Icc]
  refine ⟨And.right, fun h => ⟨⟨?_,?_,?_⟩,h⟩⟩
  · have hk : (k:ℤ) ≤ n := by nlinarith [sq_nonneg (k:ℤ),sq_nonneg j]
    omega
  · nlinarith [sq_nonneg (2*(k:ℤ)+1),sq_nonneg (2*j+1)]
  · nlinarith [sq_nonneg (2*(k:ℤ)+1),sq_nonneg (2*j-1)]

theorem mass_eq_lattice (n : ℕ) :
    (mass n).re = ∑ kj ∈ indices n, weight kj.1 kj.2 := by
  let re : GaussianInt →+ ℤ := { toFun := Zsqrtd.re, map_zero' := rfl, map_add' := fun _ _ => rfl }
  change re (∑ z ∈ shell n, z) = _
  rw [map_sum]
  symm
  apply sum_bij (fun kj _ => encode kj.1 kj.2)
  · rintro ⟨k,j⟩ h
    have hn := (indices_iff _ _ _).mp h
    exact mem_shell.mpr ⟨primary_encode k j, by simp [norm_encode,hn]⟩
  · rintro ⟨k,j⟩ _ ⟨l,h⟩ _ e
    exact Prod.ext (encode_injective e).1 (encode_injective e).2
  · intro z h
    obtain ⟨hz,hn⟩ := mem_shell.mp h
    obtain ⟨k,j,e⟩ := encode_surjective hz
    have h := GaussianInt.abs_natCast_norm z
    rw [hn, ← e, norm_encode] at h
    exact ⟨(k,j),(indices_iff _ _ _).mpr h.symm,e⟩
  · intro _ _; rfl

end TunnellEtaLattice

/- Finite Gaussian binomials and their stabilized coefficients. -/

namespace TunnellQBin

open Polynomial Finset

variable {R : Type*} [CommRing R]

def choose (q : R) : ℕ → ℕ → R
  | 0, 0 => 1
  | 0, _+1 => 0
  | _+1, 0 => 1
  | n+1, k+1 => choose q n (k+1) + q^(n-k)*choose q n k

def fac (q : R) (n : ℕ) : R := ∏ i ∈ range n, (1-q^(i+1))

lemma choose_zero (q : R) (n : ℕ) : choose q n 0 = 1 := by cases n <;> rfl

lemma choose_above (q : R) {n k : ℕ} (h : n < k) : choose q n k = 0 := by
  induction n generalizing k with
  | zero => cases k <;> first | rfl | omega
  | succ n ih =>
    obtain ⟨l,rfl⟩ := Nat.exists_eq_succ_of_ne_zero (by omega : k ≠ 0)
    rw [choose, ih (by omega), ih (by omega), mul_zero, add_zero]

lemma choose_self (q : R) (n : ℕ) : choose q n n = 1 := by
  induction n with
  | zero => rfl
  | succ n ih => rw [choose, choose_above _ (by omega), Nat.sub_self, pow_zero, one_mul, ih, zero_add]

lemma fac_succ (q : R) (n : ℕ) : fac q (n+1) = fac q n * (1-q^(n+1)) := prod_range_succ ..

theorem factorial_formula (q : R) (n k : ℕ) (hk : k ≤ n) :
    choose q n k * fac q k * fac q (n-k) = fac q n := by
  induction n generalizing k with
  | zero =>
    obtain rfl : k=0 := Nat.eq_zero_of_le_zero hk
    simp [choose,fac]
  | succ n ih =>
    rcases Nat.eq_zero_or_pos k with rfl | hk0
    · simp [choose_zero,fac]
    obtain ⟨l,rfl⟩ := Nat.exists_eq_succ_of_ne_zero hk0.ne'
    by_cases h : l=n
    · subst l; simp [choose_self,fac]
    have hl : l+1 ≤ n := by omega
    have ha := ih (l+1) hl
    have hb := ih l (by omega)
    have step : n - l = n - (l+1) + 1 := by omega
    have ep : n-l + (l+1) = n+1 := by omega
    rw [choose, Nat.succ_sub_succ_eq_sub]
    calc
      _ = (choose q n (l+1)*fac q (l+1)*fac q (n-(l+1))) * (1-q^(n-l)) +
          q^(n-l) * (choose q n l*fac q l*fac q (n-l)) * (1-q^(l+1)) := by
          have hfac : fac q (n-l) = fac q (n-(l+1))*(1-q^(n-l)) := by
            simpa only [← step] using fac_succ q (n-(l+1))
          rw [hfac,fac_succ q l]
          ring
      _ = _ := by rw [ha,hb,fac_succ,← ep,pow_add]; ring

noncomputable def product (q : R) (n : ℕ) : R[X] :=
  ∏ i ∈ range n, (1 + C (q^i) * X)

lemma product_coeff (q : R) (n k : ℕ) :
    (product q n).coeff k = q^(k.choose 2)*choose q n k := by
  induction n generalizing k with
  | zero =>
    cases k <;> simp [product,choose,Polynomial.coeff_one]
  | succ n ih =>
    have e : product q (n+1) = product q n + C (q^n)*(product q n*X) := by
      rw [product,prod_range_succ]
      change product q n*(1+C (q^n)*X) = _
      ring
    rw [e,coeff_add,coeff_C_mul]
    cases k with
    | zero => simp [choose_zero,ih]
    | succ k =>
      rw [Polynomial.coeff_mul_X,ih,ih,choose]
      by_cases h : k ≤ n
      · have htri : (k+1).choose 2 = k.choose 2 + k := by rw [Nat.choose_succ_succ]; simp [add_comm]
        have hexp : n + k.choose 2 = (k+1).choose 2 + (n-k) := by omega
        rw [mul_add]
        congr 1
        rw [← mul_assoc,← pow_add,hexp,pow_add,mul_assoc]
      · rw [choose_above _ (by omega : n < k)]
        simp

theorem expansion (q : R) (n : ℕ) :
    (∏ j ∈ range n, (1 + C (q^j)*X)) =
      ∑ k ∈ range (n+1), C (q^(k.choose 2)*choose q n k) * X^k := by
  ext k
  change (product q n).coeff k = _
  rw [product_coeff, finsetSum_coeff]
  simp only [coeff_C_mul,coeff_X_pow,mul_ite,mul_one,mul_zero]
  by_cases hk : k < n+1
  · simp [hk]
  · simp [hk, choose_above q (show n < k by omega)]

lemma fac_unit (q : R) (hq : IsNilpotent q) (n : ℕ) : IsUnit (fac q n) := by
  induction n with
  | zero => simp [fac]
  | succ n ih =>
    rw [fac_succ]
    exact ih.mul ((hq.pow_of_pos (by omega : n+1 ≠ 0)).isUnit_one_sub)

lemma fac_stable (q : R) {d : ℕ} (hq : q^(d+1) = 0) {n : ℕ} (hn : d ≤ n) :
    fac q n = fac q d := by
  obtain ⟨k,rfl⟩ := Nat.exists_eq_add_of_le hn
  induction k with
  | zero => simp
  | succ k ih =>
    rw [← Nat.add_assoc,fac_succ,show d+k+1 = d+1+k by omega,pow_add,hq,zero_mul,
      sub_zero,mul_one,ih (by omega)]

theorem choose_stable (q : R) {d : ℕ} (hq : q^(d+1) = 0) (n k : ℕ)
    (hk : k ≤ n) (hd : d ≤ k) (ht : d ≤ n-k) : choose q n k * fac q d = 1 := by
  apply (fac_unit q ⟨_,hq⟩ d).mul_left_injective
  have h := factorial_formula q n k hk
  rw [fac_stable q hq hd,fac_stable q hq ht,fac_stable q hq (hd.trans hk)] at h
  simpa only [one_mul] using h

theorem map_choose {S : Type*} [CommRing S] (f : R →+* S) (q : R) (n k : ℕ) :
    f (choose q n k) = choose (f q) n k := by
  induction n generalizing k with
  | zero => cases k <;> simp [choose]
  | succ n ih => cases k <;> simp [choose,ih]

theorem expansion_eval (q t : R) (n : ℕ) :
    (∏ j ∈ range n, (1 + q^j*t)) =
      ∑ k ∈ range (n+1), (q^(k.choose 2)*choose q n k)*t^k := by
  have h := congrArg (Polynomial.evalRingHom t) (expansion q n)
  simpa only [map_prod,map_sum,map_add,map_one,map_mul,map_pow,coe_evalRingHom,eval_C,eval_X] using h

end TunnellQBin

/- A finite balanced specialization of the Gaussian binomial theorem. -/

namespace TunnellBalanced

open Finset
variable {K : Type*} [Field K]

private lemma normalizer (t : K) (N : ℕ) :
    ∏ i ∈ range N, (-t^(2*i+1)) = (-1 : K)^N * t^(N^2) := by
  induction N with
  | zero => simp
  | succ n ih =>
    rw [prod_range_succ, ih, show (n+1)^2 = n^2 + (2*n+1) by ring, pow_add, pow_succ (-1 : K)]
    ring

private lemma product_side (t : K) (ht : t ≠ 0) (N : ℕ) :
    ((-1 : K)^N * t^(N^2)) *
        (∏ j ∈ range (2*N), (1+(t^2)^j * (-t^(1-2*(N:ℤ))))) =
      ∏ i ∈ range N, (1-t^(2*i+1))^2 := by
  let F (j : ℕ) := 1 - t^(2*(j:ℤ)+1-2*(N:ℤ))
  have he (j : ℕ) : 1+(t^2)^j*(-t^(1-2*(N:ℤ))) = F j := by
    dsimp [F]
    rw [← pow_mul, ← zpow_natCast t (2*j), mul_neg, ← zpow_add₀ ht, ← sub_eq_add_neg]
    congr 2
    push_cast
    ring
  have hs : (∏ j ∈ range (2*N), F j) =
      (∏ j ∈ range N, F (N-1-j)) * ∏ j ∈ range N, F (N+j) := by
    rw [Finset.prod_range_reflect, ←prod_range_add, two_mul]
  simp only [he]
  rw [hs, ←normalizer, ←mul_assoc, ←prod_mul_distrib, ←prod_mul_distrib]
  apply prod_congr rfl
  intro i hi
  have hi' := mem_range.mp hi
  have hneg : (2*((N-1-i:ℕ):ℤ)+1-2*(N:ℤ)) = -((2*i+1:ℕ):ℤ) := by omega
  have hpos : (2*((N+i:ℕ):ℤ)+1-2*(N:ℤ)) = ((2*i+1:ℕ):ℤ) := by omega
  dsimp only [F]
  rw [hneg, hpos, zpow_neg, zpow_natCast]
  field_simp
  ring

private lemma triangular (k : ℕ) : 2*k.choose 2 + k = k^2 := by
  induction k with
  | zero => decide
  | succ k ih =>
    rw [Nat.choose_succ_succ, Nat.choose_one_right]
    nlinarith

private lemma power_side (t : K) (ht : t ≠ 0) (N k : ℕ) :
    t^(N^2) * (t^2)^k.choose 2 * (t^(1-2*(N:ℤ)))^k
      = t^(((k:ℤ)-(N:ℤ)).natAbs^2) := by
  rw [← pow_mul, ← zpow_natCast t (N^2), ← zpow_natCast t (2*k.choose 2),
      ← zpow_natCast (t^(1-2*(N:ℤ))) k, ← zpow_mul, ← zpow_add₀ ht, ← zpow_add₀ ht,
      ← zpow_natCast t (((k:ℤ)-(N:ℤ)).natAbs^2)]
  congr 1
  push_cast
  rw [sq_abs]
  have h : (2:ℤ)*(k.choose 2:ℕ) + (k:ℤ) = (k:ℤ)^2 := by exact_mod_cast triangular k
  linarith only [h]

private theorem balanced_field (t : K) (ht : t ≠ 0) (N : ℕ) :
    (∏ i ∈ range N, (1-t^(2*i+1))^2) =
    ∑ k ∈ range (2*N+1), ((Int.negOnePow ((k:ℤ)-(N:ℤ)) : ℤ) : K) *
        t ^ (((k:ℤ)-(N:ℤ)).natAbs ^ 2) * TunnellQBin.choose (t^2) (2*N) k := by
  rw [←product_side t ht N, TunnellQBin.expansion_eval, Finset.mul_sum]
  apply sum_congr rfl
  intro k hk
  have hs : ((Int.negOnePow ((k:ℤ)-(N:ℤ)) : ℤ) : K) =
      (-1:K)^k * (-1:K)^N := by
    rw [Int.negOnePow_sub, Units.val_mul, Int.cast_mul, Int.cast_negOnePow_natCast,
      Int.cast_negOnePow_natCast]
  rw [hs, ← power_side t ht, neg_eq_neg_one_mul (t^(1-2*(N:ℤ))), mul_pow]
  ring

open Polynomial in
theorem balanced {R : Type*} [CommRing R] (t : R) (N : ℕ) :
    (∏ i ∈ range N, (1-t^(2*i+1))^2) =
    ∑ k ∈ range (2*N+1), ((Int.negOnePow ((k:ℤ)-(N:ℤ)) : ℤ) : R) *
        t ^ (((k:ℤ)-(N:ℤ)).natAbs^2) * TunnellQBin.choose (t^2) (2*N) k := by
  let x : ℤ[X] := X
  let f := algebraMap ℤ[X] (FractionRing ℤ[X])
  have hf : Function.Injective f := IsFractionRing.injective _ _
  have hx : f x ≠ 0 := by
    rw [← map_zero f]
    exact fun h ↦ Polynomial.X_ne_zero (hf h)
  have hpoly : (∏ i ∈ range N, (1-x^(2*i+1))^2) =
      ∑ k ∈ range (2*N+1), ((Int.negOnePow ((k:ℤ)-(N:ℤ)) : ℤ) : ℤ[X]) *
        x ^ (((k:ℤ)-(N:ℤ)).natAbs^2) * TunnellQBin.choose (x^2) (2*N) k := by
    apply hf
    simpa only [map_prod, map_sum, map_pow, map_sub, map_one, map_mul, map_intCast,
      TunnellQBin.map_choose] using balanced_field (f x) hx N
  let g := Polynomial.eval₂RingHom (Int.castRingHom R) t
  have hxt : g x = t := by simp [g,x]
  simpa only [map_prod, map_sum, map_pow, map_sub, map_one, map_mul, map_intCast,
    TunnellQBin.map_choose,hxt] using congrArg g hpoly

end TunnellBalanced

/- Finite Jacobi cubic identity by differentiating the Gaussian binomial theorem. -/

namespace TunnellCubicFinite

open Finset Polynomial TunnellQBin
open LaurentPolynomial hiding C

abbrev L := LaurentPolynomial ℤ
noncomputable abbrev q : L := T 1

lemma fac_ne (n : ℕ) : fac q n ≠ 0 := by
  apply Finset.prod_ne_zero_iff.mpr
  intro j hj he
  have e : (1 : ℤ[X]) = X^(j+1) := by
    apply Polynomial.toLaurent_injective
    simpa only [map_one,map_pow,toLaurent_X,q] using sub_eq_zero.mp he
  have c := congrArg (fun p : ℤ[X] => p.coeff 0) e
  simp at c

lemma choose_symm (m k : ℕ) (hk : k ≤ m) :
    choose q m k = choose q m (m-k) := by
  have a := factorial_formula q m k hk
  have b := factorial_formula q m (m-k) (by omega)
  rw [Nat.sub_sub_self hk, mul_right_comm] at b
  exact mul_right_cancel₀ (fac_ne k) (mul_right_cancel₀ (fac_ne (m-k)) (a.trans b.symm))

lemma derivative_monom {S : Type*} [CommRing S] (t a : S) (k : ℕ) :
    t * (derivative (C a * X^k)).eval t = (k:S)*a*t^k := by
  cases k with
  | zero => simp
  | succ k =>
    rw [derivative_C_mul, derivative_X_pow_succ]
    simp only [eval_mul,eval_C,eval_pow,eval_X,pow_succ,Nat.cast_succ]
    ring

lemma weighted_expansion (n : ℕ) (t : L) :
    t * ((∏ j ∈ range n, (1 + C (q^j)*X)).derivative.eval t) =
      ∑ k ∈ range (n+1), (k:L)*(q^(k.choose 2)*choose q n k)*t^k := by
  rw [expansion, map_sum, eval_finsetSum, mul_sum]
  exact sum_congr rfl fun k _ => derivative_monom _ _ _

lemma reflected_fac (n : ℕ) :
    ∏ i ∈ range n, (1 - (T (-((i:ℤ)+1)) : L)) =
      (-1)^n * T (-((n+1).choose 2 : ℤ)) * fac q n := by
  induction n with
  | zero => simp [fac]
  | succ n ih =>
    rw [prod_range_succ, ih, fac_succ, pow_succ]
    have hp : (1 - (T (-((n:ℤ)+1)) : L)) =
      -T (-((n:ℤ)+1))*(1-q^(n+1)) := by
      simp only [q,T_pow,mul_one,Nat.cast_add,Nat.cast_one,mul_sub,neg_mul,← T_add,neg_add_cancel,T_zero]
      ring
    rw [hp]
    have he : ((n+1+1).choose 2 : ℤ) = ((n+1).choose 2 : ℤ) + (n+1:ℕ) := by
      rw [Nat.choose_succ_succ, Nat.choose_one_right, Nat.cast_add]
      ring
    have ht : (T (-((n+1+1).choose 2:ℤ)) : L) =
        T (-((n+1).choose 2:ℤ)) * T (-((n:ℤ)+1)) := by
      rw [← T_add,he,Nat.cast_add,Nat.cast_one]
      congr 1
      ring
    rw [ht]
    ring

lemma weighted_root (n : ℕ) :
    let t : L := -T (-(n:ℤ))
    t * ((∏ j ∈ range (2*n+1), (1 + C (q^j)*X)).derivative.eval t) =
      (-1)^(n+1) * T (-((n+1).choose 2 : ℤ)) * fac q n ^ 2 := by
  dsimp only
  let t : L := -T (-(n:ℤ))
  let f (j : ℕ) : L[X] := 1+C (q^j)*X
  change t*((∏ j ∈ range (2*n+1), f j).derivative.eval t) = _
  have ev (j : ℕ) : (f j).eval t = 1-T ((j:ℤ)-n) := by
    simp only [f,t,q,eval_add,eval_one,eval_mul,eval_C,eval_X,T_pow,mul_one,mul_neg,← T_add,sub_eq_add_neg]
  have ht : t*q^n = -1 := by
    simp only [t,q,T_pow,mul_one,neg_mul,← T_add,neg_add_cancel,T_zero]
  have center : (f n).eval t = 0 := by simp [ev]
  have dc : (f n).derivative.eval t = q^n := by simp [f]
  have left : ∏ j ∈ range n, (f j).eval t =
      (-1)^n*T (-((n+1).choose 2 : ℤ))*fac q n := by
    have hr := prod_range_reflect (fun j => (f j).eval t) n
    rw [← hr]
    convert reflected_fac n using 1
    apply prod_congr rfl
    intro i hi
    rw [ev]
    congr 2
    have := mem_range.mp hi
    omega
  have right : ∏ j ∈ range n, (f (n+1+j)).eval t = fac q n := by
    apply prod_congr rfl
    intro j _
    rw [ev]
    simp [q,T_pow]
    congr 1
    omega
  rw [show 2*n+1=n+1+n by omega, prod_range_add,prod_range_succ,derivative_mul,derivative_mul]
  simp only [eval_add,eval_mul,eval_prod,center,mul_zero,zero_mul,zero_add,add_zero,dc,left,right]
  calc _ = (t*q^n)*((-1)^n*T (-((n+1).choose 2 : ℤ)) * fac q n ^ 2) := by ring
       _ = _ := by rw [ht,pow_succ]; ring

lemma double_choose (m : ℕ) : 2*(m.choose 2 : ℤ) = (m:ℤ)*(m-1:ℤ) := by
  induction m with
  | zero => norm_num
  | succ m ih =>
    rw [Nat.choose_succ_succ, Nat.choose_one_right]
    push_cast
    nlinarith

noncomputable def weight (n r : ℕ) : L :=
  (-1)^(n+1)*T ((n+1).choose 2 : ℤ) *
    ((r:L)*(q^(r.choose 2)*choose q (2*n+1) r)*(-T (-(n:ℤ)))^r)

lemma weight_clean (n r : ℕ) : weight n r =
    (-1)^(n+1+r)*T (((n+1).choose 2 : ℤ) + (r.choose 2:ℤ) - (n:ℤ)*r) *
      (r:L) * choose q (2*n+1) r := by
  simp only [weight,q,neg_pow (T (-(n:ℤ)) : L),T_pow,mul_one,pow_add,sub_eq_add_neg,T_add,
    mul_neg, mul_comm (r:ℤ) (n:ℤ)]
  ring

lemma weight_pair (n k : ℕ) (hk : k ≤ n) :
    weight n (n-k) + weight n (n+1+k) =
      (-1)^k*(2*k+1:L)*q^((k+1).choose 2)*choose q (2*n+1) (n+1+k) := by
  have hc := choose_symm (2*n+1) (n-k) (by omega)
  rw [show 2*n+1-(n-k)=n+1+k by omega] at hc
  have hsub : ((n-k:ℕ):ℤ) = (n:ℤ)-k := Nat.cast_sub hk
  have eL : ((n+1).choose 2:ℤ) + ((n-k).choose 2:ℤ) - n*(n-k:ℕ) = ((k+1).choose 2:ℤ) := by
    have a := double_choose (n+1)
    have b := double_choose (n-k)
    have c := double_choose (k+1)
    rw [hsub] at b ⊢
    push_cast at a c
    nlinarith
  have eR : ((n+1).choose 2:ℤ) + ((n+1+k).choose 2:ℤ) - n*(n+1+k:ℕ) = ((k+1).choose 2:ℤ) := by
    have a := double_choose (n+1)
    have b := double_choose (n+1+k)
    have c := double_choose (k+1)
    push_cast at a b c ⊢
    nlinarith
  have sign (a b : ℕ) : (-1:L)^(a+a+b) = (-1)^b := by
    rw [← two_mul, pow_add,pow_mul]
    norm_num
  rw [weight_clean,weight_clean,eL,eR, hc,
    show n+1+(n-k)=(n-k)+(n-k)+(k+1) by omega, sign,
    show n+1+(n+1+k)=(n+1)+(n+1)+k by omega,sign,pow_succ]
  rw [show (q^((k+1).choose 2):L)=T ((k+1).choose 2:ℤ) by simp only [q,T_pow,mul_one]]
  rw [Nat.cast_sub hk]
  push_cast
  ring

theorem cubic_laurent (n : ℕ) : fac q n ^ 2 =
    ∑ k ∈ range (n+1), (-1)^k * (2*k+1:L) * q^((k+1).choose 2) *
      choose q (2*n+1) (n+1+k) := by
  have h := (weighted_root n).symm.trans (weighted_expansion (2*n+1) (-T (-(n:ℤ))))
  have h' := congrArg (fun u:L => (-1)^(n+1)*T ((n+1).choose 2:ℤ) * u) h
  rw [mul_sum] at h'
  change _ = ∑ r ∈ range (2*n+1+1), weight n r at h'
  have hunit (a:ℕ) (b:ℤ) : ((-1)^a * T b:L) * ((-1)^a * T (-b)*fac q n^2) = fac q n^2 := by
    calc _ = (-1)^(a+a) * (T b*T (-b)) * fac q n^2 := by rw [pow_add]; ring
         _ = _ := by rw [← two_mul,pow_mul,← T_add,add_neg_cancel,T_zero]; norm_num
  rw [hunit,show 2*n+1+1=(n+1)+(n+1) by omega,sum_range_add] at h'
  rw [h',← sum_range_reflect (weight n) (n+1), ←sum_add_distrib]
  apply sum_congr rfl
  intro k hk
  have hk' := mem_range.mp hk
  simpa only [Nat.add_sub_cancel] using weight_pair n k (by omega)

end TunnellCubicFinite

/- Specialize the finite Jacobi identity from the universal Laurent polynomial. -/

namespace TunnellCubicFinite

open Polynomial Finset TunnellQBin

theorem cubic {R : Type*} [CommRing R] (q : R) (N : ℕ) :
    fac q N ^ 2 = ∑ k ∈ range (N+1), (-1)^k * (2*k+1:R) *
      q^((k+1).choose 2) * TunnellQBin.choose q (2*N+1) (N+1+k) := by
  have hp : fac (X : ℤ[X]) N ^ 2 = ∑ k ∈ range (N+1), (-1)^k * (2*k+1:ℤ[X]) *
      X^((k+1).choose 2) * TunnellQBin.choose (X : ℤ[X]) (2*N+1) (N+1+k) := by
    apply Polynomial.toLaurent_injective
    simpa only [fac, map_pow, map_prod, map_sub, map_one, map_sum, map_mul, map_add,
      map_neg, map_ofNat, map_natCast, map_choose, toLaurent_X] using cubic_laurent N
  let g := Polynomial.eval₂RingHom (Int.castRingHom R) q
  have hx : g X = q := by simp [g]
  simpa only [fac, map_pow, map_prod, map_sub, map_one, map_sum, map_mul, map_add,
    map_neg, map_ofNat, map_natCast, map_choose, hx] using congrArg g hp


end TunnellCubicFinite

/- Truncate the centered finite Jacobi identities at arbitrary degree. -/

namespace TunnellTruncated

open TunnellQBin Polynomial Finset

variable {R : Type*} [CommRing R]

lemma triangle_ge (k : ℕ) : k ≤ (k+1).choose 2 := by
  induction k with
  | zero => simp
  | succ k ih => rw [Nat.choose_succ_succ,Nat.choose_one_right]; omega

theorem cubic_stabilized (q : R) (d N : ℕ) (hN : 2*d ≤ N) (hq : q^(d+1)=0)
    (h : fac q N ^ 2 = ∑ k ∈ range (N+1),
      ((-1:R)^k * (2*(k:R)+1)) * q^((k+1).choose 2) * choose q (2*N+1) (N+1+k)) :
    fac q d ^ 3 = ∑ k ∈ range (d+1), ((-1:R)^k * (2*(k:R)+1)) * q^((k+1).choose 2) := by
  let f (k : ℕ) := ((-1:R)^k*(2*(k:R)+1))*q^((k+1).choose 2)
  change _ = ∑ k ∈ range (d+1), f k
  change fac q N ^ 2 = ∑ k ∈ range (N+1), f k * choose q (2*N+1) (N+1+k) at h
  have htail (k : ℕ) (hk : d < k) : f k = 0 := by
    have hpow := pow_eq_zero_of_le (show d+1 ≤ (k+1).choose 2 by have := triangle_ge k; omega) hq
    simp [f,hpow]
  have hs : ∑ k ∈ range (N+1), (f k * choose q (2*N+1) (N+1+k))*fac q d =
      ∑ k ∈ range (d+1), (f k * choose q (2*N+1) (N+1+k))*fac q d := by
    symm
    apply sum_subset (range_mono (by omega))
    intro k _ hk
    simp only [mem_range,not_lt] at hk
    rw [htail k (by omega),zero_mul,zero_mul]
  rw [fac_stable q hq (n:=N) (by omega)] at h
  calc
    _ = (fac q d)^2 * fac q d := by ring
    _ = _ := by
      rw [h,sum_mul,hs]
      apply sum_congr rfl
      intro k hk
      rw [mem_range] at hk
      rw [mul_assoc,choose_stable q hq _ _ (by omega) (by omega) (by omega),mul_one]

lemma map_fac {S : Type*} [CommRing S] (f : R →+* S) (q : R) (n : ℕ) :
    f (fac q n) = fac (f q) n := by simp [fac]

lemma poly_fac (s n : ℕ) :
    fac ((X : ℤ[X])^s) n = ∏ t ∈ Icc 1 n, (1-X^(s*t)) := by
  induction n with
  | zero => simp [fac]
  | succ n ih =>
    rw [fac_succ,ih,prod_Icc_succ_top (by omega : 1 ≤ n+1),← pow_mul]

noncomputable def trunc (d : ℕ) := AdjoinRoot.mk ((X : ℤ[X])^(d+1))

lemma nilpotent_trunc (d : ℕ) : (trunc d X)^(d+1)=0 := by
  rw [← map_pow]
  exact AdjoinRoot.mk_self

lemma trunc_pow (d s : ℕ) (hs : s ≠ 0) : (trunc d (X^s))^(d+1)=0 := by
  rw [map_pow,← pow_mul,mul_comm,pow_mul,nilpotent_trunc,zero_pow hs]

theorem cubic_congruence
    (hc : ∀ N : ℕ, let q := (X:ℤ[X])^8
      fac q N ^ 2 = ∑ k ∈ range (N+1),
        ((-1:ℤ[X])^k * (2*(k:ℤ[X])+1)) * q^((k+1).choose 2) * choose q (2*N+1) (N+1+k)) :
    TunnellJacobiFiniteBridge.H1 := by
  intro d
  let t := trunc d
  let q := (X:ℤ[X])^8
  apply (AdjoinRoot.mk_eq_mk).mp
  change t _ = t _
  have he := congrArg t (hc (2*d))
  change t (fac q (2*d)^2) = t (∑ k ∈ range (2*d+1),
    ((-1:ℤ[X])^k * (2*(k:ℤ[X])+1)) * q^((k+1).choose 2)*choose q (2*(2*d)+1) (2*d+1+k)) at he
  simp only [map_pow,map_fac,map_sum,map_mul,map_add,map_neg,map_one,map_ofNat,map_natCast,map_choose] at he
  have hh := cubic_stabilized (t q) d (2*d) (by omega) (trunc_pow d 8 (by decide)) he
  rw [← poly_fac]
  simp only [map_pow,map_fac,map_sum,map_mul]
  apply hh.trans
  apply sum_congr rfl
  intro k _
  have hcst (a : ℤ) : t (C a) = (a : _) := by
    rw [show C a = (a : ℤ[X]) by simp, map_intCast]
  simp only [hcst]
  push_cast
  dsimp only [q]
  rw [map_pow,← pow_mul]

lemma fac_even_odd (t : R) (N : ℕ) :
    fac t (2*N) = fac (t^2) N * (∏ i ∈ range N, (1-t^(2*i+1))) := by
  induction N with
  | zero => simp [fac]
  | succ n ih =>
    rw [show 2*(n+1) = 2*n+1+1 by omega,fac_succ,fac_succ,ih,fac_succ,prod_range_succ,
      ← pow_mul,show 2*(n+1) = 2*n+1+1 by omega]
    ring

lemma centered_sum (N : ℕ) (f : ℤ → R) :
    ∑ k ∈ range (2*N+1), f ((k:ℤ)-(N:ℤ)) = ∑ j ∈ Icc (-(N:ℤ)) (N:ℤ), f j := by
  apply sum_bij (fun (k : ℕ) _ => (k:ℤ)-(N:ℤ))
  · intro k hk
    simp only [mem_range] at hk
    rw [mem_Icc]; omega
  · intro k _ l _ he; omega
  · intro j hj
    rw [mem_Icc] at hj
    refine ⟨(j+N).toNat,mem_range.mpr (by omega),by omega⟩
  · intro _ _; rfl

theorem theta_stabilized (t : R) (d N : ℕ) (hN : 2*d ≤ N) (ht : t^(d+1)=0)
    (h : (∏ i ∈ range N, (1-t^(2*i+1))^2) = ∑ k ∈ range (2*N+1),
      (((((k:ℤ)-(N:ℤ)).negOnePow : ℤ) : R) * t^(((k:ℤ)-(N:ℤ)).natAbs^2)) *
        choose (t^2) (2*N) k) :
    fac t d ^ 2 = (∑ j ∈ Icc (-(d:ℤ)) (d:ℤ),
      ((j.negOnePow : ℤ) : R) * t^(j.natAbs^2)) * fac (t^2) d := by
  let f (j : ℤ) := ((j.negOnePow : ℤ) : R) * t^(j.natAbs^2)
  change fac t d ^ 2 = (∑ j ∈ Icc (-(d:ℤ)) (d:ℤ), f j) * fac (t^2) d
  have hq : (t^2)^(d+1)=0 := by rw [← pow_mul,mul_comm,pow_mul,ht,zero_pow (by decide : 2≠0)]
  have htail (j : ℤ) (hj : ¬ j ∈ Icc (-(d:ℤ)) (d:ℤ)) : f j = 0 := by
    have habs := Int.natAbs_eq j
    simp only [mem_Icc,not_and_or,not_le] at hj
    have hjd : d+1 ≤ j.natAbs := by omega
    have hd : d+1 ≤ j.natAbs^2 := by nlinarith [Nat.le_mul_self j.natAbs]
    simp [f,pow_eq_zero_of_le hd ht]
  have hside : fac t d ^ 2 = (∏ i ∈ range N, (1-t^(2*i+1))^2) * fac (t^2) d ^ 2 := by
    have hfac := fac_even_odd t N
    rw [fac_stable t ht (n:=2*N) (by omega),fac_stable (t^2) hq (n:=N) (by omega)] at hfac
    rw [hfac,prod_pow]; ring
  rw [hside,h,pow_two (fac (t^2) d),← mul_assoc]
  congr 1
  rw [sum_mul]
  calc
    _ = ∑ k ∈ range (2*N+1), f ((k:ℤ)-(N:ℤ)) := by
      apply sum_congr rfl
      intro k hk
      change f ((k:ℤ)-N) * _ * _ = _
      by_cases hj : ((k:ℤ)-N) ∈ Icc (-(d:ℤ)) (d:ℤ)
      · rw [mem_Icc] at hj
        rw [mul_assoc,choose_stable (t^2) hq _ _ (by omega) (by omega) (by omega),mul_one]
      · rw [htail _ hj,zero_mul,zero_mul]
    _ = _ := by
      rw [centered_sum]
      symm
      apply sum_subset (fun j hj => ?_) (fun j _ hj => htail j hj)
      simp only [mem_Icc] at hj ⊢
      omega

theorem theta_congruence
    (hc : ∀ (d N : ℕ), let t := trunc d (X^4)
      (∏ i ∈ range N, (1-t^(2*i+1))^2) = ∑ k ∈ range (2*N+1),
        (((((k:ℤ)-(N:ℤ)).negOnePow : ℤ) : _) * t^(((k:ℤ)-(N:ℤ)).natAbs^2)) *
          choose (t^2) (2*N) k) : TunnellJacobiFiniteBridge.H2 := by
  intro d
  apply (AdjoinRoot.mk_eq_mk).mp
  change trunc d _ = trunc d _
  have he := theta_stabilized (trunc d (X^4)) d (2*d) (by omega) (trunc_pow d 4 (by decide)) (hc d (2*d))
  rw [← poly_fac,← poly_fac]
  have hh : trunc d (X^8) = (trunc d (X^4))^2 := by rw [← map_pow,← pow_mul]
  simp only [map_pow,map_mul,map_sum,map_fac] at he ⊢
  rw [he]
  congr 1
  · apply sum_congr rfl
    intro j _
    have hC : trunc d (C (j.negOnePow : ℤ)) = ((j.negOnePow:ℤ) : _) := by
      rw [show C (j.negOnePow:ℤ) = ((j.negOnePow:ℤ):ℤ[X]) by simp, map_intCast]
    rw [hC,← pow_mul]
  · rw [← pow_mul]

end TunnellTruncated

/- The arithmetic of the base congruent-number cusp form. -/

namespace TunnellArithmetic

open Polynomial Finset TunnellGaussian TunnellEtaLattice

theorem eta_eq_mass (h₁ : TunnellJacobiFiniteBridge.H1) (h₂ : TunnellJacobiFiniteBridge.H2) (n : ℕ) :
    (X * ∏ i ∈ Icc 1 n, ((1-(X:ℤ[X])^(4*i))^2*(1-X^(8*i))^2)).coeff n = (mass n).re := by
  rw [TunnellJacobiFiniteBridge.unary_to_lattice h₁ h₂, mass_eq_lattice]
  unfold indices
  rw [sum_filter,sum_product]
  apply sum_congr rfl
  intro k _
  apply sum_congr rfl
  intro j _
  have hsq : ((j.natAbs : ℤ)^2) = j^2 := by
    rcases Int.natAbs_eq j with h|h <;> nlinarith [congrArg (fun x : ℤ => x^2) h]
  have hiff : (2*k+1)^2+4*j.natAbs^2 = n ↔ (2*(k:ℤ)+1)^2+4*j^2 = n := by
    rw [← hsq]
    exact_mod_cast Iff.rfl
  simp only [hiff,weight]

theorem arithmetic_of_jacobi (h₁ : TunnellJacobiFiniteBridge.H1) (h₂ : TunnellJacobiFiniteBridge.H2) :
    OMA.R_CongruentNumber_Tunnell_even_R1_H1_R1.H2 := by
  dsimp only [OMA.R_CongruentNumber_Tunnell_even_R1_H1_R1.H2]
  simp only [eta_eq_mass h₁ h₂]
  exact ⟨fun _ _ => coefficient_mul, TunnellSplitMass.trace_mass_odd,
    fun p hp k => coefficient_prime_power p.val p.property hp k⟩

end TunnellArithmetic



/-! The absolutely convergent Gaussian lattice expansion of the twisted L-series. -/

namespace TunnellCMLSeries

open Finset TunnellGaussian

noncomputable def gaussianTerm (s : ℝ) (z : GaussianInt) : ℂ :=
  (z:ℂ) / (((z.norm.natAbs:ℝ)^s : ℝ):ℂ)

lemma norm_sq_real (z : GaussianInt) : (z.norm.natAbs:ℝ) = ‖(z:ℂ)‖^2 := by
  have h := congrArg Complex.re (GaussianInt.intCast_complex_norm z)
  simp only [Complex.intCast_re,Complex.ofReal_re,Complex.normSq_eq_norm_sq] at h
  rw [GaussianInt.natCast_natAbs_norm]
  exact h

lemma norm_term (s : ℝ) (hs : 3/2 < s) (z : GaussianInt) :
    ‖gaussianTerm s z‖ = ‖(z:ℂ)‖^(-(2*s-1)) := by
  rw [gaussianTerm,norm_div,Complex.norm_real,Real.norm_eq_abs,
    abs_of_nonneg (Real.rpow_nonneg (by positivity) _),norm_sq_real]
  by_cases h : z=0
  · subst z; simp [Real.zero_rpow (by linarith : 1-2*s≠0)]
  have hz := norm_pos_iff.mpr (GaussianInt.toComplex_eq_zero.not.mpr h)
  rw [← Real.rpow_natCast,← Real.rpow_mul hz.le,
    show -(2*s-1) = 1-(2:ℝ)*s by ring,Real.rpow_sub hz,Real.rpow_one]
  rfl

lemma summable_gaussianTerm (s : ℝ) (hs : 3/2 < s) : Summable (gaussianTerm s) := by
  let coords (z : GaussianInt) : Fin 2 → ℤ := ![z.re,z.im]
  have hi : Function.Injective coords := by
    intro z w h
    exact Zsqrtd.ext (congrFun h 0) (congrFun h 1)
  have h := (EisensteinSeries.summable_one_div_norm_rpow (show 2 < 2*s-1 by linarith)).comp_injective hi
  apply Summable.of_norm
  apply h.of_nonneg_of_le (fun z => norm_nonneg _)
  intro z
  rw [norm_term s hs]
  change _ ≤ ‖coords z‖^(-(2*s-1))
  have hc0 : coords 0 = 0 := by funext i; fin_cases i <;> rfl
  by_cases hz : z=0
  · subst z; rw [hc0]; simp
  have hpos : 0 < ‖coords z‖ := by
    apply norm_pos_iff.mpr
    exact fun he => hz (hi (he.trans hc0.symm))
  apply Real.rpow_le_rpow_of_nonpos hpos _ (by linarith)
  rw [EisensteinSeries.norm_eq_max_natAbs, Nat.cast_max,max_le_iff]
  constructor
  · have h := Complex.abs_re_le_norm (z:ℂ)
    simpa only [coords,Matrix.cons_val_zero,Nat.cast_max,← GaussianInt.intCast_re,
      Nat.cast_natAbs,Int.cast_abs] using h
  · have h := Complex.abs_im_le_norm (z:ℂ)
    simpa only [coords,Matrix.cons_val_one,Matrix.cons_val_zero,Nat.cast_max,← GaussianInt.intCast_im,
      Nat.cast_natAbs,Int.cast_abs] using h

noncomputable def twistSign (n m : ℕ) : ℤ := if Odd m then jacobiSym n m else 0

lemma norm_twist_le (n m : ℕ) : ‖((twistSign n m : ℤ):ℂ)‖ ≤ 1 := by
  unfold twistSign
  split
  · rcases jacobiSym.trichotomy (n:ℤ) m with h|h|h <;> simp [h]
  · simp

noncomputable def term (n : ℕ) (s : ℝ) (z : GaussianInt) : ℂ :=
  by classical exact if Primary z then (twistSign n z.norm.natAbs : ℂ) * gaussianTerm s z else 0

theorem summable_lattice (n : ℕ) (s : ℝ) (hs : 3/2<s) : Summable (term n s) := by
  classical
  apply Summable.of_norm
  apply (summable_gaussianTerm s hs).norm.of_nonneg_of_le (fun _ => norm_nonneg _)
  intro z
  unfold term
  split
  · rw [norm_mul]
    exact mul_le_of_le_one_left (norm_nonneg _) (norm_twist_le _ _)
  · simp

noncomputable def shellEquiv : (Σ n : ℕ, ↥(shell n)) ≃ {z : GaussianInt // Primary z} where
  toFun x := ⟨x.2.val,(mem_shell.mp x.2.property).1⟩
  invFun z := ⟨z.val.norm.natAbs, z.val, mem_shell.mpr ⟨z.property,rfl⟩⟩
  left_inv := by rintro ⟨n,z,hz⟩; obtain rfl := (mem_shell.mp hz).2; rfl
  right_inv := by intro z; rfl

noncomputable def latticeValue (n : ℕ) (s : ℝ) : ℂ :=
  ∑' z : {z : GaussianInt // Primary z},
    (twistSign n z.val.norm.natAbs : ℂ) * gaussianTerm s z.val

theorem shell_expansion (n : ℕ) (s : ℝ) (hs : 3/2<s) :
    HasSum (fun m : ℕ => (twistSign n m : ℂ) * ((mass m).re : ℂ) / ((m:ℂ)^(s:ℂ)))
      (latticeValue n s) := by
  classical
  let f (z : {z : GaussianInt // Primary z}) : ℂ :=
    (twistSign n z.val.norm.natAbs : ℂ) * gaussianTerm s z.val
  have hf : Summable f := by
    simpa only [Function.comp_def,f,term,Subtype.property,if_true] using (summable_lattice n s hs).subtype Primary
  have hsum : HasSum (fun c => f (shellEquiv c)) (latticeValue n s) :=
    shellEquiv.hasSum_iff.mpr hf.hasSum
  apply hsum.sigma
  intro m
  convert hasSum_fintype (fun v : ↥(shell m) => f (shellEquiv ⟨m,v⟩)) using 1
  have cst (v : ↥(shell m)) : f (shellEquiv ⟨m,v⟩) =
      (twistSign n m : ℂ) * ((v.val : GaussianInt) : ℂ) / (m:ℂ)^(s:ℂ) := by
    change _ * (_ / _) = _
    dsimp [f,shellEquiv,gaussianTerm]
    rw [(mem_shell.mp v.property).2,Complex.ofReal_cpow (Nat.cast_nonneg m)]
    push_cast
    ring
  simp only [cst,← Finset.sum_div,← Finset.mul_sum]
  have hc := (map_sum GaussianInt.toComplex (fun z => z) (shell m))
  change (↑(mass m) : ℂ) = ∑ z ∈ shell m, (z : ℂ) at hc
  have hre : (↑(mass m) : ℂ) = ((mass m).re : ℂ) := by simp [GaussianInt.toComplex_def,mass_real]
  rw [← hre,hc,← Finset.sum_attach (shell m) (fun z => (z : ℂ))]
  rfl

end TunnellCMLSeries


/-! Euler product of the Gaussian Hecke L-series for the congruent-number twists. -/

namespace TunnellCMLSeries

open TunnellGaussian OMA.R_CongruentNumber_Tunnell_even_R1 Finset

lemma mass_one : mass 1 = 1 := by
  have e : shell 1 = {1} := by
    ext z
    rw [mem_shell,mem_singleton]
    constructor
    · rintro ⟨hz,hn⟩
      exact primary_unit_eq_one hz (Zsqrtd.norm_eq_one_iff.mp hn)
    · rintro rfl
      exact ⟨(primary_iff _).mpr (by decide),by simp⟩
  simp [mass,e]

lemma twistSign_one (n : ℕ) : twistSign n 1 = 1 := by simp [twistSign]

lemma twistSign_mul (n a b : ℕ) : twistSign n (a*b) = twistSign n a * twistSign n b := by
  by_cases ha : Odd a <;> by_cases hb : Odd b <;> simp [twistSign, Nat.odd_mul, ha, hb]
  exact jacobiSym.mul_right' _ (fun e => by simp [e] at ha) (fun e => by simp [e] at hb)

lemma twistSign_pow (n a k : ℕ) : twistSign n (a^k) = twistSign n a ^ k := by
  induction k with
  | zero => simp [twistSign_one]
  | succ k ih => rw [pow_succ,twistSign_mul,ih,pow_succ]

lemma twistSign_prime (n : ℕ) (p : Nat.Primes) [Fact p.val.Prime] (hp : p.val ≠ 2) :
    twistSign n p.val = quadraticChar (ZMod p.val) (n : ZMod p.val) := by
  have ho : Odd p.val := Nat.odd_iff.mpr (p.property.eq_two_or_odd.resolve_left hp)
  dsimp only [twistSign]
  rw [if_pos ho, ← jacobiSym.legendreSym.to_jacobiSym, legendreSym]
  simp

lemma twistSign_bad (n : ℕ) (p : Nat.Primes) (hp : p.val ∣ 2*n) : twistSign n p.val = 0 := by
  letI : Fact p.val.Prime := ⟨p.property⟩
  by_cases h : p.val = 2
  · simp [twistSign,h]
  · have hd : p.val ∣ n := (p.property.dvd_mul.mp hp).resolve_left
      (fun e => h ((Nat.prime_dvd_prime_iff_eq p.property Nat.prime_two).mp e))
    rw [twistSign_prime n p h, (ZMod.natCast_eq_zero_iff n _).mpr hd, quadraticChar_zero]

noncomputable def gaussCoeff (n m : ℕ) : ℂ := (twistSign n m:ℂ) * ((mass m).re : ℂ)

noncomputable def curveTrace (n : ℕ) (p : Nat.Primes) : ℤ :=
  letI : NeZero p.val := ⟨p.property.ne_zero⟩
  (p.val:ℤ) - (univ.filter (fun xy : ZMod p.val × ZMod p.val =>
    xy.2^2 = xy.1^3 - (n : ZMod p.val)^2 * xy.1)).card

lemma gaussCoeff_prime (n : ℕ) (p : Nat.Primes) (hp : ¬ p.val ∣ 2*n) :
    gaussCoeff n p.val = (curveTrace n p : ℂ) := by
  letI : Fact p.val.Prime := ⟨p.property⟩
  have hp2 : p.val ≠ 2 := fun h => hp (h ▸ dvd_mul_right _ _)
  have hpn : ¬ p.val ∣ n := fun h => hp (dvd_mul_of_dvd_right h 2)
  rw [gaussCoeff,twistSign_prime n p hp2,TunnellSplitMass.trace_mass_odd p hp2]
  simpa only [curveTrace,Int.cast_mul,Nat.cast_one,one_pow,one_mul] using congrArg (fun z : ℤ => (z:ℂ)) (traceOfFrobenius_twist n p hp2 hpn).symm

lemma gaussCoeff_rec (n : ℕ) (p : Nat.Primes) (hp : ¬ p.val ∣ 2*n) (k : ℕ) :
    gaussCoeff n (p.val^(k+2)) = gaussCoeff n p.val * gaussCoeff n (p.val^(k+1)) -
      (p.val : ℂ)*gaussCoeff n (p.val^k) := by
  letI : Fact p.val.Prime := ⟨p.property⟩
  have hp2 : p.val ≠ 2 := fun h => hp (h ▸ dvd_mul_right _ _)
  have hpn : ¬ p.val ∣ n := fun h => hp (dvd_mul_of_dvd_right h 2)
  have hs : ((twistSign n p.val : ℤ):ℂ)^2 = 1 := by
    rw [twistSign_prime n p hp2]; exact_mod_cast quadraticChar_sq_one ((ZMod.natCast_eq_zero_iff n p.val).not.mpr hpn)
  simp only [gaussCoeff,twistSign_pow,Int.cast_pow,coefficient_prime_power p.val p.property hp2 k,
    Int.cast_sub,Int.cast_mul,Int.cast_natCast]
  linear_combination -((twistSign n p.val:ℂ)^k*p.val*((mass (p.val^k)).re:ℂ))*hs

theorem lattice_euler (n : ℕ) (s : ℝ) (hs : 3/2 < s) :
    HasProd (fun p : Nat.Primes => if p.val ∣ 2*n then (1:ℂ) else
      let T : ℂ := (p.val : ℂ)^(-(s:ℂ))
      (1-(curveTrace n p:ℂ)*T+(p.val:ℂ)*T^2)⁻¹) (latticeValue n s) := by
  classical
  let g (m : ℕ) := gaussCoeff n m / (m:ℂ)^(s:ℂ)
  have hsum : HasSum g (latticeValue n s) := shell_expansion n s hs
  have hfirst : gaussCoeff n 1 = 1 := by simp [gaussCoeff,mass_one,twistSign_one]
  have hf : g 1 = 1 := by simp [g,hfirst]
  have hz : g 0 = 0 := by simp [g, Complex.zero_cpow (by exact_mod_cast (by linarith : s≠0) : (s:ℂ)≠0)]
  have hm {a b : ℕ} (hc : a.Coprime b) : g (a*b) = g a * g b := by
    dsimp only [g,gaussCoeff]
    rw [twistSign_mul,coefficient_mul hc,Nat.cast_mul,Complex.natCast_mul_natCast_cpow]
    push_cast
    ring
  have h := EulerProduct.eulerProduct_hasProd hf (fun {_ _} h => hm h) hsum.summable.norm hz
  rw [hsum.tsum_eq] at h
  convert h using 2 with p
  let T := (p.val:ℂ)^(-(s:ℂ))
  let c (e : ℕ) := gaussCoeff n (p.val^e)*T^e
  have he (e : ℕ) : g (p.val^e) = c e := weight_prime_power p s e (gaussCoeff n (p.val^e))
  simp_rw [he]
  have hc0 : c 0 = 1 := by simp [c,hfirst]
  by_cases hp : p.val ∣ 2*n
  · rw [if_pos hp]
    symm
    apply (hasSum_single (0 : ℕ) ?_).tsum_eq.trans hc0
    rintro (_|e) he0
    · exact False.elim (he0 rfl)
    · simp [c,gaussCoeff,twistSign_pow,twistSign_bad n p hp]
  · rw [if_neg hp]
    symm
    have hc : Summable c := by
      simpa only [Function.comp_def,he] using hsum.summable.comp_injective (Nat.pow_right_injective p.property.one_lt)
    refine (tsum_of_euler_recurrence c ((curveTrace n p:ℂ)*T) ((p.val:ℂ)*T^2) hc hc0 ?_ ?_).tsum_eq
    · simp [c,gaussCoeff_prime n p hp]
    · intro r
      simp only [c,gaussCoeff_rec n p hp r,gaussCoeff_prime n p hp]
      ring

end TunnellCMLSeries
#print axioms TunnellCMLSeries.lattice_euler
