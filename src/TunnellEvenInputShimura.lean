import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H3_R1
import Mathlib

namespace TunnellEvenInputShimura

/-!
# Hecke action on Tunnell's ternary theta series

The signed sum on the ternary shell of norm 2m is twelve times the Fourier
coefficient at m. Conjugation by integral Hamilton quaternions of norm p
computes the odd-prime Hecke action. Each projective line modulo p has eight
representatives. At primitive targets one line occurs, and at targets divisible
by p the invariant lines of the reduced pure quaternion give the quadratic
character term and the correction at indices divisible by p².

A finite Jacobi product identity identifies the rotation average with the
coefficient of η(4z)²η(8z)². Its primary Gaussian integer expansion and the
quartic Jacobi sum identify that coefficient with the Frobenius trace of
y² = x³ − x.
-/

/- Primary generators in the Gaussian coefficient formula for η(4τ)²η(8τ)². -/

namespace TunnellGaussian

open GaussianInt

def Primary (z : GaussianInt) : Prop := (⟨2,2⟩ : GaussianInt) ∣ z-1

lemma primary_iff (z : GaussianInt) :
    Primary z ↔ z.im % 2 = 0 ∧ (z.re + z.im) % 4 = 1 := by
  constructor
  · rintro ⟨⟨u,v⟩,h⟩
    have ha := congrArg Zsqrtd.re h
    have hb := congrArg Zsqrtd.im h
    change z.re - 1 = 2*u + -1*2*v at ha
    change z.im - 0 = 2*v + 2*u at hb
    omega
  · rintro ⟨h₁,h₂⟩
    refine ⟨⟨(z.re + z.im - 1)/4, (z.im - z.re + 1)/4⟩, ?_⟩
    ext
    · change z.re - 1 = 2*((z.re + z.im - 1)/4) + -1*2*((z.im - z.re + 1)/4)
      omega
    · change z.im - 0 = 2*((z.im - z.re + 1)/4) + 2*((z.re + z.im - 1)/4)
      omega

lemma primary_mul_iff {z w : GaussianInt} (hz : Primary z) : Primary (z*w) ↔ Primary w := by
  have h : (⟨2,2⟩ : GaussianInt) ∣ (z-1)*w := dvd_mul_of_dvd_left hz _
  unfold Primary
  rw [show z*w - 1 = (z-1)*w + (w-1) by ring, dvd_add_right h]

lemma primary_star {z : GaussianInt} (hz : Primary z) : Primary (star z) := by
  rw [primary_iff] at hz ⊢
  change (-z.im) % 2 = 0 ∧ (z.re - z.im) % 4 = 1
  omega

lemma norm_sq (z : GaussianInt) : z.norm = z.re^2 + z.im^2 := by rw [Zsqrtd.norm_def]; ring

lemma units_cases {u : GaussianInt} (hu : IsUnit u) :
    (u.re = 1 ∧ u.im = 0) ∨ (u.re = -1 ∧ u.im = 0) ∨
    (u.re = 0 ∧ u.im = 1) ∨ (u.re = 0 ∧ u.im = -1) := by
  have h := (Zsqrtd.norm_eq_one_iff' (by decide : (-1 : ℤ) ≤ 0) u).mpr hu
  rw [norm_sq] at h
  have hr : -1 ≤ u.re ∧ u.re ≤ 1 := by constructor <;> nlinarith [sq_nonneg (u.re+1), sq_nonneg (u.re-1), sq_nonneg u.im]
  have hi : -1 ≤ u.im ∧ u.im ≤ 1 := by constructor <;> nlinarith [sq_nonneg (u.im+1), sq_nonneg (u.im-1), sq_nonneg u.re]
  obtain ⟨hr₁, hr₂⟩ := hr
  obtain ⟨hi₁, hi₂⟩ := hi
  interval_cases h₁ : u.re <;> interval_cases h₂ : u.im <;> simp_all

lemma primary_unit_eq_one {u : GaussianInt} (h : Primary u) (hu : IsUnit u) : u = 1 := by
  have h' := (primary_iff _).mp h
  rcases units_cases hu with h | h | h | h <;> rcases h with ⟨hr, hi⟩ <;> simp [hr,hi] at h'
  ext <;> assumption

lemma primary_associated_eq {z w : GaussianInt} (hz : Primary z) (hw : Primary w) (h : Associated z w) :
    z = w := by
  obtain ⟨u,rfl⟩ := h
  rw [primary_unit_eq_one ((primary_mul_iff hz).mp hw) u.isUnit, mul_one]

lemma shell_finite (n : ℕ) :
    {z : GaussianInt | Primary z ∧ z.norm.natAbs = n}.Finite := by
  let box := Set.Icc (-((n:ℤ)+1)) ((n:ℤ)+1)
  have hf : box.Finite := Set.finite_Icc _ _
  apply ((hf.prod hf).image (fun ab : ℤ × ℤ => (⟨ab.1, ab.2⟩ : GaussianInt))).subset
  rintro ⟨a,b⟩ ⟨-, hn⟩
  have h := GaussianInt.abs_natCast_norm (⟨a,b⟩ : GaussianInt)
  rw [hn, norm_sq] at h
  change (n:ℤ) = a^2 + b^2 at h
  refine ⟨(a,b), ⟨?_,?_⟩,rfl⟩
  · constructor <;> nlinarith [sq_nonneg (a-1),sq_nonneg (a+1),sq_nonneg b,sq_nonneg a]
  · constructor <;> nlinarith [sq_nonneg (b-1),sq_nonneg (b+1),sq_nonneg b,sq_nonneg a]

noncomputable def shell (n : ℕ) : Finset GaussianInt := (shell_finite n).toFinset

lemma mem_shell {z : GaussianInt} {n : ℕ} : z ∈ shell n ↔ Primary z ∧ z.norm.natAbs = n :=
  (shell_finite n).mem_toFinset

noncomputable def mass (n : ℕ) : GaussianInt := ∑ z ∈ shell n, z

end TunnellGaussian

/-
# Local properties of the congruent-number curves
-/

namespace TunnellCoates

open WeierstrassCurve WeierstrassCurve.Affine

def E {K : Type*} [CommRing K] (n : K) : WeierstrassCurve K := ⟨0,0,0,-n^2,0⟩

lemma E_discriminant {K : Type*} [CommRing K] (n : K) : (E n).Δ = 64*n^6 := by
  simp [E, Δ, b₂,b₄,b₆,b₈]
  ring

lemma E_equation {K : Type*} [CommRing K] (n x y : K) :
    (E n).toAffine.Equation x y ↔ y^2 = x^3-n^2*x := by
  simp [Affine.equation_iff, E, sub_eq_add_neg]

lemma E_elliptic {K : Type*} [Field K] {n : K} (h2 : (2:K) ≠ 0) (hn : n ≠ 0) :
    (E n).IsElliptic := by
  constructor
  rw [E_discriminant, show (64:K)=(2:K)^6 by norm_num, isUnit_iff_ne_zero]
  exact mul_ne_zero (pow_ne_zero _ h2) (pow_ne_zero _ hn)

lemma card_points {K : Type*} [Field K] [Fintype K] [DecidableEq K] (n : K)
    [(E n).IsElliptic] : Nat.card (E n).toAffine.Point =
    (Finset.univ.filter (fun xy : K × K => xy.2^2 = xy.1^3-n^2*xy.1)).card + 1 := by
  classical
  have eqv := (E n).toAffine.pointEquiv.trans
    ((Equiv.subtypeEquivRight (fun xy : K×K => E_equation n xy.1 xy.2)).optionCongr)
  calc
    _ = Nat.card (Option {xy : K×K // xy.2^2 = xy.1^3-n^2*xy.1}) := Nat.card_congr eqv
    _ = _ := by simp [Nat.card_eq_fintype_card, Fintype.card_subtype]

lemma eight_dvd_of_four_two {G : Type*} [AddCommGroup G] (P Q : G)
    (h4 : (4:ℕ) • P = 0) (hp : (2:ℕ) • P ≠ 0) (hq : (2:ℕ) • Q = 0)
    (hq0 : Q ≠ 0) (hdiff : Q ≠ (2:ℕ) • P) : 8 ∣ Nat.card G := by
  have hord : addOrderOf P = 4 := by
    apply addOrderOf_eq_of_nsmul_and_div_prime_nsmul (by decide) h4
    intro p hp' hdiv
    have hp2 : p = 2 := (Nat.prime_dvd_prime_iff_eq hp' Nat.prime_two).mp
      (hp'.dvd_of_dvd_pow (by simpa using hdiv : p ∣ 2^2))
    subst p
    exact hp
  let H := AddSubgroup.zmultiples P
  have hnon : Q ∉ H := by
    rintro ⟨m,hm⟩
    have hred : (m % 4) • P = Q := by
      simpa [hord, hm] using (mod_addOrderOf_zsmul P m)
    have hlo := Int.emod_nonneg m (by decide : (4:ℤ) ≠ 0)
    have hhi := Int.emod_lt_of_pos m (by decide : 0 < (4:ℤ))
    generalize hr : m % 4 = a at hred hlo hhi
    interval_cases a
    · exact hq0 (by simpa using hred.symm)
    · have hPQ : P = Q := by simpa using hred
      exact hp (hPQ ▸ hq)
    · exact hdiff (by exact_mod_cast hred.symm)
    · have h6 : (6:ℕ) • P = 0 := by
        calc _ = (2:ℕ) • ((3:ℕ) • P) := by rw [← mul_smul]; rfl
             _ = (2:ℕ) • Q := by rw [show (3:ℕ) • P = Q by exact_mod_cast hred]
             _ = 0 := hq
      change (4+2:ℕ) • P = 0 at h6
      rw [add_smul, h4, zero_add] at h6
      exact hp h6
  have hco : addOrderOf (Q : G ⧸ H) = 2 :=
    addOrderOf_eq_prime (by simpa only [← QuotientAddGroup.mk_nsmul, hq, QuotientAddGroup.mk_zero])
      (fun h => hnon ((QuotientAddGroup.eq_zero_iff _).mp h))
  have hdiv := addOrderOf_dvd_natCard (Q : G ⧸ H)
  rw [hco] at hdiv
  rw [AddSubgroup.card_eq_card_quotient_mul_card_addSubgroup H, Nat.card_zmultiples, hord]
  omega


lemma eight_dvd_points_base (p : ℕ) [Fact p.Prime] (hp : p%4=1) :
    8 ∣ ((Finset.univ.filter (fun xy : ZMod p × ZMod p =>
      xy.2^2 = xy.1^3-xy.1)).card + 1) := by
  have hp2 : p ≠ 2 := by omega
  have h2 : (2:ZMod p) ≠ 0 := by
    change ((2:ℕ) : ZMod p) ≠ 0
    rw [Ne, ZMod.natCast_eq_zero_iff]
    exact fun h => hp2 ((Nat.prime_dvd_prime_iff_eq Fact.out Nat.prime_two).mp h)
  let W := E (1 : ZMod p)
  have : W.IsElliptic := E_elliptic h2 one_ne_zero
  obtain ⟨i,hi⟩ := (ZMod.exists_sq_eq_neg_one_iff (p := p)).mpr (by omega)
  have hi2 : i^2 = -1 := by simpa [pow_two] using hi.symm
  have hy : (1-i : ZMod p) ≠ 0 := by
    intro h
    have hii : i=1 := (sub_eq_zero.mp h).symm
    rw [hii, one_pow] at hi2
    apply h2
    linear_combination hi2
  have H0 : W.toAffine.Equation 0 0 := by simp [W, E]
  have HQ : W.toAffine.Equation 1 0 := by simp [W, E_equation]
  have HP : W.toAffine.Equation i (1-i) := by
    rw [E_equation]; linear_combination -(i-1)*hi2
  let R := Affine.Point.mk H0
  let Q := Affine.Point.mk HQ
  let P := Affine.Point.mk HP
  have hR : R ≠ 0 := Affine.Point.some_ne_zero _
  have hQ : Q ≠ 0 := Affine.Point.some_ne_zero _
  have hQR : Q ≠ R := by
    change Affine.Point.some _ _ _ ≠ Affine.Point.some _ _ _
    simp
  have r2 : (2:ℕ) • R=0 := by
    rw [two_nsmul]; apply Affine.Point.add_self_of_Y_eq; simp [W, E, Affine.negY]
  have q2 : (2:ℕ) • Q=0 := by
    rw [two_nsmul]; apply Affine.Point.add_self_of_Y_eq; simp [W, E, Affine.negY]
  have hneg : 1-i ≠ W.toAffine.negY i (1-i) := by
    simp only [W,E,Affine.negY,zero_mul,sub_zero]
    intro h
    apply (mul_ne_zero h2 hy)
    linear_combination h
  have hs : W.toAffine.slope i i (1-i) (1-i) = -(1+i) := by
    rw [Affine.slope_of_Y_ne rfl hneg]
    apply (div_eq_iff (sub_ne_zero.mpr hneg)).mpr
    simp only [W,E,Affine.negY,zero_mul,mul_zero,add_zero,sub_zero,one_pow]
    linear_combination hi2
  have hx : W.toAffine.addX i i (-(1+i)) = 0 := by
    simp only [W,E,Affine.addX,zero_mul,add_zero,sub_zero]
    linear_combination hi2
  have hh : (2:ℕ) • P = R := by
    rw [two_nsmul]
    change Affine.Point.some _ _ _ + Affine.Point.some _ _ _ = Affine.Point.some _ _ _
    rw [Affine.Point.add_self_of_Y_ne hneg]
    simp only [Affine.Point.some.injEq, hs, hx, true_and]
    simp only [Affine.addY, Affine.negAddY, hx]
    simp only [W,E,Affine.negY,zero_mul,sub_zero]
    linear_combination -hi2
  have h4 : (4:ℕ) • P = 0 := by simpa only [show (4:ℕ)=2*2 by decide, mul_smul, hh] using r2
  have he := eight_dvd_of_four_two P Q h4 (hh ▸ hR) q2 hQ (hh ▸ hQR)
  rw [card_points] at he
  simpa using he

end TunnellCoates

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

lemma gaussian_prime_of_norm {z : GaussianInt} {p : ℕ} (hp : p.Prime) (hz : z.norm.natAbs = p) :
    Prime z := by
  apply Irreducible.prime
  constructor
  · intro h
    exact hp.ne_one (hz ▸ Zsqrtd.norm_eq_one_iff.mpr h)
  · intro v w he
    have h := congrArg (fun z : GaussianInt => z.norm.natAbs) he
    simp only [Zsqrtd.norm_mul, Int.natAbs_mul, hz] at h
    have hp' := (Nat.irreducible_iff_nat_prime p).mpr hp
    obtain h | h := hp'.isUnit_or_isUnit h
    · exact Or.inl (Zsqrtd.norm_eq_one_iff.mp (Nat.isUnit_iff.mp h))
    · exact Or.inr (Zsqrtd.norm_eq_one_iff.mp (Nat.isUnit_iff.mp h))

lemma shell_split_prime {p : ℕ} (hp : p.Prime) {z : GaussianInt} (hz : z ∈ shell p) :
    shell p = {z, star z} := by
  have ⟨hzP,hn⟩ := mem_shell.mp hz
  have hstar : star z ∈ shell p := mem_shell.mpr ⟨primary_star hzP, by simpa using hn⟩
  ext w
  constructor
  · intro hw
    obtain ⟨hwP,hwn⟩ := mem_shell.mp hw
    have hwprim := gaussian_prime_of_norm hp hwn
    have hzprim := gaussian_prime_of_norm hp hn
    have hstprim := gaussian_prime_of_norm hp (mem_shell.mp hstar).2
    have H : w ∣ z * star z := by
      rw [← Zsqrtd.norm_eq_mul_conj, ← GaussianInt.natCast_natAbs_norm, hn, ← hwn,
        GaussianInt.natCast_natAbs_norm, Zsqrtd.norm_eq_mul_conj]
      exact dvd_mul_right _ _
    rcases hwprim.dvd_or_dvd H with h | h
    · have := primary_associated_eq hwP hzP (hwprim.associated_of_dvd hzprim h)
      simp [this]
    · have := primary_associated_eq hwP (primary_star hzP)
        (hwprim.associated_of_dvd hstprim h)
      simp [this]
  · simp only [mem_insert,mem_singleton]
    rintro (rfl|rfl) <;> assumption

lemma distinct_star_of_prime {p : ℕ} (hp : p.Prime) {z : GaussianInt} (hn : z.norm.natAbs = p) :
    z ≠ star z := by
  intro e
  have h := congrArg Zsqrtd.im e
  change z.im = -z.im at h
  have hi : z.im = 0 := by omega
  rw [norm_sq, hi, zero_pow (by decide : 2 ≠ 0), add_zero, Int.natAbs_pow] at hn
  exact Nat.Prime.not_prime_pow (by decide : 2 ≤ 2) (show (z.re.natAbs ^ 2).Prime by rwa [hn])

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

/- The finite Gauss triangular product and its nilpotent stabilization. -/

namespace TunnellTriangular

open Polynomial Finset TunnellQBin
open LaurentPolynomial hiding C
open TunnellCubicFinite

variable {R : Type*} [CommRing R]

def plusFac (u : R) (n : ℕ) := ∏ j ∈ range n, (1+u^(j+1))

lemma odd_product (n : ℕ) :
    T ((n+1).choose 2:ℤ) * ∏ j ∈ range (2*n+1), (1+q^j*T (-(n:ℤ))) =
    2*(plusFac q n)^2 := by
  have he (j : ℕ) : 1+q^j*T (-(n:ℤ)) = 1+T ((j:ℤ)-n) := by
    simp only [q,T_pow,mul_one,←T_add,sub_eq_add_neg]
  have hs : (∏ j ∈ range (2*n+1), (1+(T ((j:ℤ)-n):L))) =
       (∏ j ∈ range n, (1+T (-(j+1:ℕ):ℤ))) * 2 * plusFac q n := by
    let f (j : ℕ) : L := 1+T ((j:ℤ)-n)
    change (∏ j ∈ range (2*n+1), f j) = _
    rw [show 2*n+1 = n+1+n by omega,prod_range_add,prod_range_succ,←prod_range_reflect f n]
    have hleft : (∏ x ∈ range n, f (n-1-x)) = ∏ j ∈ range n, (1+T (-(j+1:ℕ):ℤ)) := by
      apply prod_congr rfl
      intro i hi
      have := mem_range.mp hi
      dsimp [f]
      congr 2
      omega
    have hright : (∏ j ∈ range n, f (n+1+j)) = plusFac q n := by
      apply prod_congr rfl
      intro i hi
      simp only [f,q,T_pow,mul_one]
      congr 2
      omega
    rw [hleft,hright,show f n = 2 by simp [f]; ring]
  have hmul (N : ℕ) : T ((N+1).choose 2 : ℤ) *
        (∏ j ∈ range N, (1+(T (-(j+1:ℕ):ℤ):L))) = plusFac q N := by
    induction N with
    | zero => simp [plusFac]
    | succ N ih =>
      have hc : ((N+1+1).choose 2:ℤ) = ((N+1).choose 2:ℤ)+(N+1:ℕ) := by
        rw [Nat.choose_succ_succ,Nat.choose_one_right]
        push_cast; ring
      rw [hc,T_add,prod_range_succ,mul_mul_mul_comm,ih,show plusFac q (N+1) = plusFac q N * (1+q^(N+1)) by exact prod_range_succ ..]
      congr 1
      simp only [mul_add,mul_one,←T_add,add_neg_cancel,T_zero,q,T_pow]
      ring
  simp_rw [he]
  rw [hs]
  linear_combination 2*plusFac q n*hmul n

lemma triangular_laurent (n : ℕ) : plusFac q n ^ 2 =
    ∑ k ∈ range (n+1), q^((k+1).choose 2)*TunnellQBin.choose q (2*n+1) (n+1+k) := by
  let f (r : ℕ) : L := T ((n+1).choose 2:ℤ) *
      ((q^(r.choose 2)*TunnellQBin.choose q (2*n+1) r)*(T (-(n:ℤ)))^r)
  have hclean (r : ℕ) : f r = T (((n+1).choose 2:ℤ)+(r.choose 2:ℤ)-(n:ℤ)*r) *
      TunnellQBin.choose q (2*n+1) r := by
    simp only [f,q,T_pow,mul_one,sub_eq_add_neg,T_add]
    ring_nf
  have hpair (k : ℕ) (hk : k≤n) : f (n-k)+f (n+1+k) =
      2*(q^((k+1).choose 2)*TunnellQBin.choose q (2*n+1) (n+1+k)) := by
    have hc := choose_symm (2*n+1) (n-k) (by omega)
    rw [show 2*n+1-(n-k)=n+1+k by omega] at hc
    have hsub : ((n-k:ℕ):ℤ) = (n:ℤ)-k := Nat.cast_sub hk
    have hL : ((n+1).choose 2:ℤ) + ((n-k).choose 2:ℤ) - n*(n-k:ℕ) = ((k+1).choose 2:ℤ) := by
      have a := double_choose (n+1)
      have b := double_choose (n-k)
      have c := double_choose (k+1)
      rw [hsub] at b ⊢
      push_cast at a c
      nlinarith
    have hR : ((n+1).choose 2:ℤ) + ((n+1+k).choose 2:ℤ) - n*(n+1+k:ℕ) = ((k+1).choose 2:ℤ) := by
      have a := double_choose (n+1)
      have b := double_choose (n+1+k)
      have c := double_choose (k+1)
      push_cast at a b c ⊢
      nlinarith
    rw [hclean,hclean,hL,hR,hc]
    simp only [q,T_pow,mul_one]
    ring
  have ht : (2:L) ≠ 0 := fun e => (show (2:ℤ[X]) ≠ 0 by norm_num) (Polynomial.toLaurent_injective (by simpa only [map_ofNat,map_zero] using e))
  apply mul_left_cancel₀ ht
  rw [←odd_product n,expansion_eval,mul_sum,mul_sum]
  change (∑ r ∈ range (2*n+1+1), f r) = _
  rw [show 2*n+1+1=(n+1)+(n+1) by omega,sum_range_add,←sum_range_reflect f (n+1),←sum_add_distrib]
  apply sum_congr rfl
  intro k hk
  simpa only [Nat.add_sub_cancel] using hpair k (by have := mem_range.mp hk; omega)

theorem triangular (u : R) (n : ℕ) : plusFac u n ^ 2 =
    ∑ k ∈ range (n+1), u^((k+1).choose 2)*TunnellQBin.choose u (2*n+1) (n+1+k) := by
  have hp : plusFac (X:ℤ[X]) n ^ 2 =
      ∑ k ∈ range (n+1), X^((k+1).choose 2)*TunnellQBin.choose (X:ℤ[X]) (2*n+1) (n+1+k) := by
    apply Polynomial.toLaurent_injective
    simpa only [plusFac,map_pow,map_prod,map_add,map_one,map_sum,map_mul,map_choose,toLaurent_X]
      using triangular_laurent n
  let g := Polynomial.eval₂RingHom (Int.castRingHom R) u
  have hx : g X = u := by simp [g]
  simpa only [plusFac,map_pow,map_prod,map_add,map_one,map_sum,map_mul,map_choose,hx] using congrArg g hp


end TunnellTriangular

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

end TunnellArithmetic

/- The signed four-square theta series in a nilpotent quotient. -/

namespace TunnellQuaternionTheta

open Finset TunnellQBin TunnellTruncated TunnellTriangular

variable {R : Type*} [CommRing R]

lemma nil_pow {u : R} {d : ℕ} (hu : u^(d+1) = 0) {k : ℕ} (hk : k ≠ 0) :
    (u^k)^(d+1)=0 := by rw [←pow_mul,mul_comm,pow_mul,hu,zero_pow hk]

lemma plus_times_fac (u : R) (d : ℕ) : plusFac u d * fac u d = fac (u^2) d := by
  rw [plusFac,fac,fac,←prod_mul_distrib]
  apply prod_congr rfl
  intro i _
  rw [←pow_mul, mul_comm, pow_mul]
  ring

lemma triangular_sum {u : R} {d : ℕ} (hu : u^(d+1)=0) :
    (∑ k ∈ range (d+1), u^((k+1).choose 2)) * fac u d = fac (u^2) d ^ 2 := by
  let N := 2*d
  have hN : d ≤ N := by dsimp [N]; omega
  have hp : plusFac u N = plusFac u d := by
    apply (fac_unit u ⟨_,hu⟩ d).mul_left_injective
    change plusFac u N * fac u d = plusFac u d * fac u d
    calc plusFac u N * fac u d = plusFac u N * fac u N := by rw [fac_stable u hu hN]
         _ = _ := by rw [plus_times_fac,plus_times_fac,fac_stable (u^2) (nil_pow hu (by decide)) hN]
  have h := triangular u N
  rw [hp] at h
  have hs := congrArg (· * fac u d) h
  rw [sum_mul] at hs
  have hr (k : ℕ) (hk : k ≤ d) :
      u^((k+1).choose 2)*choose u (2*N+1) (N+1+k)*fac u d = u^((k+1).choose 2) := by
    rw [mul_assoc,choose_stable u hu _ _ (by dsimp [N]; omega) (by dsimp [N]; omega)
      (by dsimp [N]; omega),mul_one]
  have htail (k : ℕ) (hk : k ∉ range (d+1)) : u^((k+1).choose 2) = 0 := by
    have := triangle_ge k
    rw [mem_range] at hk
    exact pow_eq_zero_of_le (by omega) hu
  have ht : (∑ k ∈ range (N+1), u^((k+1).choose 2)*choose u (2*N+1) (N+1+k)*fac u d)
      = ∑ k ∈ range (d+1), u^((k+1).choose 2) := by
    rw [sum_subset (s₁:=range (d+1)) (s₂:=range (N+1)) (range_mono (by omega))
      (fun k _ hk => htail k hk)]
    apply sum_congr rfl
    intro k hk
    by_cases hk' : k ≤ d
    · exact hr k hk'
    · rw [htail k (by simpa using hk')]; ring
  rw [←ht,←hs,←plus_times_fac]
  ring

lemma fac_neg_product {t : R} {d : ℕ} (ht : t^(d+1)=0) :
    fac t d * fac (-t) d * fac (t^4) d = fac (t^2) d ^ 3 := by
  have he (s : R) (hs : s^(d+1)=0) : fac s d =
       fac (s^2) d * ∏ i ∈ range d, (1-s^(2*i+1)) := by
    simpa only [fac_stable s hs (show d ≤ 2*d by omega)] using fac_even_odd s d
  let u := t^2
  let A := ∏ i ∈ range d, (1-t^(2*i+1))
  let B := ∏ i ∈ range d, (1-(-t)^(2*i+1))
  have hAB : A*B = ∏ i ∈ range d, (1-u^(2*i+1)) := by
    rw [show A*B = ∏ i ∈ range d, (1-t^(2*i+1))*(1-(-t)^(2*i+1)) by exact prod_mul_distrib.symm]
    apply prod_congr rfl
    intro i _
    rw [Odd.neg_pow (show Odd (2*i+1) from ⟨i,rfl⟩)]
    rw [show u^(2*i+1) = (t^(2*i+1))^2 by dsimp [u]; rw [←pow_mul,mul_comm,pow_mul]]
    ring
  have hplus : fac t d = fac u d * A := he _ ht
  have hminus : fac (-t) d = fac u d * B := by
    simpa only [neg_sq] using he (-t) (by rw [neg_eq_neg_one_mul t,mul_pow,ht,mul_zero])
  have hdouble : fac u d = fac (t^4) d * (A*B) := by
    rw [hAB,←show u^2 = t^4 by dsimp [u]; rw [←pow_mul]]
    exact he _ (nil_pow ht (by decide))
  rw [hplus,hminus,hdouble]
  ring

lemma unsign (t : R) (j : ℤ) : ((j.negOnePow:ℤ):R)*(-t)^j.natAbs^2 = t^j.natAbs^2 := by
  rw [Int.coe_negOnePow,neg_eq_neg_one_mul t,mul_pow,←mul_assoc,←pow_add]
  have he (k : ℕ) : Even (k+k^2) := by
    obtain ⟨l,rfl|rfl⟩ := Nat.even_or_odd' k
    · exact ⟨l+2*l^2,by ring⟩
    · exact ⟨2*l^2+3*l+1,by ring⟩
  rw [(he _).neg_one_pow,one_mul]

theorem eta_four_factors (t : R) (d : ℕ) (ht : t^(d+1)=0) :
    (∑ k ∈ range (d+1), (t^2)^((k+1).choose 2)) *
      (∑ j ∈ Icc (-(d:ℤ)) (d:ℤ), ((j.negOnePow:ℤ):R)*t^(j.natAbs^2))^2 *
      (∑ j ∈ Icc (-(d:ℤ)) (d:ℤ), t^(j.natAbs^2)) = fac t d ^ 2 * fac (t^2) d ^ 2 := by
  let A := ∑ k ∈ range (d+1), (t^2)^((k+1).choose 2)
  let B := ∑ j ∈ Icc (-(d:ℤ)) (d:ℤ), ((j.negOnePow:ℤ):R)*t^(j.natAbs^2)
  let C := ∑ j ∈ Icc (-(d:ℤ)) (d:ℤ), t^(j.natAbs^2)
  let E := fac (t^2) d
  have ha : A*E = fac (t^4) d ^ 2 := by
    simpa only [A,E,← pow_mul] using triangular_sum (nil_pow ht (k:=2) (by decide))
  have he (u : R) (hu : u^(d+1)=0) := theta_stabilized u d (2*d) (by omega) hu (TunnellBalanced.balanced u (2*d))
  have hb : B*E = fac t d ^ 2 := (he t ht).symm
  have hc : C*E = fac (-t) d ^ 2 := by
    simpa only [unsign,neg_sq] using (he (-t) (by rw [neg_eq_neg_one_mul t,mul_pow,ht,mul_zero])).symm
  have hu : IsUnit E := fac_unit _ ⟨d+1,nil_pow ht (by decide)⟩ d
  have htr : A*B*C = E^3 := by
    apply (hu.pow 3).mul_left_injective
    calc A*B*C*E^3 = (A*E)*(B*E)*(C*E) := by ring
         _ = (fac t d * fac (-t) d * fac (t^4) d)^2 := by rw [ha,hb,hc]; ring
         _ = E^3*E^3 := by rw [fac_neg_product ht]; ring
  calc A*B^2*C = (A*B*C)*B := by ring
       _ = (B*E)*E^2 := by rw [htr]; ring
       _ = _ := by rw [hb]


end TunnellQuaternionTheta

/- Coefficient of the norm shell for the four-square quaternion weight. -/

namespace TunnellQuaternionTheta

open Polynomial Finset TunnellQBin TunnellTruncated

theorem shell_coefficient (d : ℕ) :
    (X * ∏ i ∈ Icc 1 d, ((1-(X:ℤ[X])^(4*i))^2*(1-X^(8*i))^2)).coeff d =
      ∑ k ∈ range (d+1), ∑ r ∈ Icc (-(d:ℤ)) (d:ℤ), ∑ s ∈ Icc (-(d:ℤ)) (d:ℤ),
        ∑ t ∈ Icc (-(d:ℤ)) (d:ℤ),
          if (2*k+1)^2 + 4*(r.natAbs^2+s.natAbs^2+t.natAbs^2) = d
          then ((r+s).negOnePow:ℤ) else 0 := by
  let I := Icc (-(d:ℤ)) (d:ℤ)
  let u : ℤ[X] := X^4
  let a (k : ℕ) : ℤ[X] := (u^2)^((k+1).choose 2)
  let b (j : ℤ) : ℤ[X] := ((j.negOnePow:ℤ):ℤ[X]) * u^(j.natAbs^2)
  let c (j : ℤ) : ℤ[X] := u^(j.natAbs^2)
  let A := ∑ k ∈ range (d+1), a k
  let B := ∑ j ∈ I, b j
  let C₀ := ∑ j ∈ I, c j
  have hdiv : X^(d+1) ∣
      (X * ∏ i ∈ Icc 1 d, ((1-(X:ℤ[X])^(4*i))^2*(1-X^(8*i))^2)) - X*A*B^2*C₀ := by
    have hbase : (∏ i ∈ Icc 1 d, ((1-(X:ℤ[X])^(4*i))^2*(1-X^(8*i))^2)) =
        fac u d ^ 2 * fac (u^2) d ^ 2 := by
      simp only [prod_mul_distrib,prod_pow,u,←pow_mul,poly_fac]
    rw [hbase]
    apply (AdjoinRoot.mk_eq_mk).mp
    change trunc d _ = trunc d _
    have he := eta_four_factors (trunc d u) d (trunc_pow d 4 (by decide))
    simp only [A,B,C₀,a,b,c,I,map_mul,map_pow,map_fac,map_sum,map_intCast]
    rw [←he]
    ring
  have he := (X_pow_dvd_iff.mp hdiv) d (by omega)
  rw [coeff_sub,sub_eq_zero] at he
  rw [he]
  have hmono (k : ℕ) (r s t : ℤ) :
      (X*a k*b r*b s*c t).coeff d =
        if (2*k+1)^2+4*(r.natAbs^2+s.natAbs^2+t.natAbs^2)=d
        then ((r+s).negOnePow:ℤ) else 0 := by
    have hh : X*a k*b r*b s*c t =
        C ((r+s).negOnePow:ℤ) * X^((2*k+1)^2+4*(r.natAbs^2+s.natAbs^2+t.natAbs^2)) := by
      have hcast (z : ℤ) : Polynomial.C z = (z:ℤ[X]) := by
        simpa only [Int.cast_id] using (map_intCast (Polynomial.C : ℤ →+* ℤ[X]) z)
      rw [←TunnellJacobiFiniteBridge.exponent_eq k]
      simp only [a,b,c,u,Int.negOnePow_add,Units.val_mul, Int.cast_mul,pow_add,pow_mul,pow_one,hcast]
      ring
    rw [hh,coeff_C_mul_X_pow]
    split_ifs <;> first | rfl | contradiction | (exfalso; solve_by_elim [Eq.symm])
  have hsum : X*A*B^2*C₀ =
      ∑ k ∈ range (d+1), ∑ r ∈ I, ∑ s ∈ I, ∑ t ∈ I, X*a k*b r*b s*c t := by
    simp only [←Finset.sum_mul,←Finset.mul_sum, A,B,C₀,sq]
    ring
  rw [hsum]
  simp only [I,finsetSum_coeff,hmono]


end TunnellQuaternionTheta

/- # The ternary square shell for the weight-three-halves coefficients -/

namespace TunnellShell

open OMA.R_CongruentNumber_Tunnell_even_R1 CongruentNumber Finset
open scoped PowerSeries.WithPiTopology

abbrev Triple := ℤ × ℤ × ℤ

def normSq (v : Triple) : ℤ := v.1^2+v.2.1^2+v.2.2^2

def shell (N : ℕ) : Finset Triple :=
  let I := Finset.Icc (-(N:ℤ)-1) (N+1:ℤ)
  (I ×ˢ (I ×ˢ I)).filter (fun v => normSq v=N)

@[simp] lemma mem_shell {N : ℕ} {v : Triple} : v ∈ shell N ↔ normSq v=N := by
  obtain ⟨x,y,z⟩ := v
  simp only [shell,Finset.mem_filter,Finset.mem_product,Finset.mem_Icc]
  refine ⟨And.right,fun h => ⟨?_,h⟩⟩
  change x^2+y^2+z^2=(N:ℤ) at h
  have hbound (a:ℤ) (ha:a^2≤N) : -(N:ℤ)-1 ≤ a ∧ a ≤ N+1 :=
    ⟨by nlinarith [sq_nonneg (a+1)],by nlinarith [sq_nonneg (a-1)]⟩
  exact ⟨hbound x (by nlinarith [sq_nonneg y,sq_nonneg z]), hbound y (by nlinarith [sq_nonneg x,sq_nonneg z]),
    hbound z (by nlinarith [sq_nonneg x,sq_nonneg y])⟩

def admissible (v : Triple) : Prop := Odd v.1 ∧ Odd v.2.1 ∧ v.2.2%4=0
instance (v : Triple) : Decidable (admissible v) := by unfold admissible; infer_instance

def coordWeight (v : Triple) : ℤ := if admissible v then ((v.2.2/4).negOnePow : ℤ) else 0

def rot (v : Triple) : Triple := (v.2.1,v.2.2,v.1)

def weight (v : Triple) : ℤ := coordWeight v + coordWeight (rot v) + coordWeight (rot (rot v))

lemma rotation_sum (N : ℕ) (f : Triple → ℤ) :
    ∑ v ∈ shell N, f (rot v) = ∑ v ∈ shell N, f v := by
  apply sum_nbij' rot (fun v => rot (rot v))
  · rintro ⟨x,y,z⟩ h
    simp only [mem_shell,normSq,rot] at h ⊢
    linarith
  · rintro ⟨x,y,z⟩ h
    simp only [mem_shell,normSq,rot] at h ⊢
    linarith
  all_goals intro v _; rfl

lemma sum_weight (N : ℕ) : ∑ v ∈ shell N, weight v = 3*∑ v ∈ shell N, coordWeight v := by
  change ∑ v ∈ _, (coordWeight v+coordWeight (rot v)+coordWeight (rot (rot v))) = _
  simp only [sum_add_distrib]
  rw [rotation_sum N (fun v => coordWeight (rot v)),rotation_sum N coordWeight]
  ring

def slice (N : ℕ) (P : ℤ → Prop) : Set Triple :=
  {v | (v ∈ shell N ∧ admissible v) ∧ P (v.2.2/4)}

lemma sum_coordWeight (N : ℕ) : ∑ v ∈ shell N, coordWeight v =
    (slice N Even).ncard - ((slice N Odd).ncard : ℤ) := by
  calc
    _ = ∑ v ∈ shell N, if v∈shell N ∧ admissible v then ((v.2.2 / 4).negOnePow : ℤ) else 0 := by
      apply sum_congr rfl; intro v hv; simp [coordWeight,hv]
    _ = _ := sum_sign_eq_ncard (shell N) _ _ (fun _ h => h.1)

lemma slice_card {m : ℕ} (hm : m%4=1) (P : ℤ → Prop) :
    (slice (2*m) P).ncard = 2* {v ∈ D (2*m) | P v.2.2}.ncard := by
  let S := slice (2*m) P
  let good := {v ∈ S | v.1%4 = v.2.1%4}
  let bad := {v ∈ S | v.1%4 ≠ v.2.1%4}
  have hf : S.Finite := (shell (2*m)).finite_toSet.subset (fun _ h => h.1.1)
  have hsplit : S = good ∪ bad := by ext v; simp [good,bad]; tauto
  have hdis : Disjoint good bad := Set.disjoint_left.mpr (fun _ hu hv => hv.2 hu.2)
  have hpair : bad.ncard = good.ncard := by
    apply Set.ncard_congr (fun v _ => (-v.1,v.2.1,v.2.2))
    · rintro ⟨x,y,z⟩ ⟨⟨⟨hs,hx,hy,hz⟩,hp⟩,hne⟩
      have hx' := Int.odd_iff.mp hx
      have hy' := Int.odd_iff.mp hy
      exact ⟨⟨⟨by simpa [normSq] using hs,by simpa using hx,hy,hz⟩,hp⟩,by dsimp at hne hx' hy' ⊢; omega⟩
    · rintro ⟨x,y,z⟩ ⟨x',y',z'⟩ _ _ h; simpa using h
    · rintro ⟨x,y,z⟩ ⟨⟨⟨hs,hx,hy,hz⟩,hp⟩,he⟩
      have hx' := Int.odd_iff.mp hx
      exact ⟨(-x,y,z),⟨⟨⟨by simpa [normSq] using hs,by simpa using hx,hy,hz⟩,hp⟩,by dsimp at he hx' ⊢; omega⟩,by simp⟩
  have count : {v ∈ D (2*m) | P v.2.2}.ncard = good.ncard := by
    apply Set.ncard_congr (fun v _ => (v.2.1+2*v.1,v.2.1-2*v.1,4*v.2.2))
    · rintro ⟨r,a,t⟩ ⟨hd,hp⟩
      have ha := y_residues (n:=2*m) (by omega) hd
      have ha' : Odd a := Int.odd_iff.mpr (by omega)
      change ((2*m:ℕ):ℤ)=8*r^2+2*a^2+16*t^2 at hd
      refine ⟨⟨⟨mem_shell.mpr ?_,Int.odd_iff.mpr (by change (a+2*r)%2=1; omega),Int.odd_iff.mpr (by change (a-2*r)%2=1; omega),by dsimp; omega⟩,?_⟩,by dsimp; omega⟩
      · dsimp [normSq]; push_cast at hd; linear_combination -hd
      · simpa using hp
    · rintro ⟨r,a,t⟩ ⟨r',a',t'⟩ h h' he
      simp only [Prod.mk.injEq] at he ⊢
      exact ⟨by omega,by omega,by omega⟩
    · rintro ⟨x,y,z⟩ ⟨⟨⟨hs,hx,hy,hz⟩,hp⟩,he⟩
      have hx' := Int.odd_iff.mp hx
      have hy' := Int.odd_iff.mp hy
      change x%4=y%4 at he
      change z%4=0 at hz
      let r := (x-y)/4
      let a := (x+y)/2
      let t := z/4
      have h1 : a+2*r=x := by dsimp [a,r]; omega
      have h2 : a-2*r=y := by dsimp [a,r]; omega
      have h3 : 4*t=z := by dsimp [t]; omega
      refine ⟨(r,a,t),⟨?_,hp⟩,by simp [h1,h2,h3]⟩
      have hs' := mem_shell.mp hs
      change x^2+y^2+z^2=((2*m:ℕ):ℤ) at hs'
      rw [← h1,← h2,← h3] at hs'
      change ((2*m:ℕ):ℤ)=8*r^2+2*a^2+16*t^2
      linear_combination -hs'
  change S.ncard = _
  rw [hsplit,Set.ncard_union_eq hdis (hf.subset (Set.sep_subset _ _)) (hf.subset (Set.sep_subset _ _)), hpair, ←count]
  omega

noncomputable def b (m : ℕ) : ℤ :=
  let X : PowerSeries ℤ := PowerSeries.X
  PowerSeries.coeff m (X * (∏' k : ℕ, (1-X^(8*(k+1)))) * (∏' k : ℕ, (1-X^(16*(k+1)))) *
    (1+2*∑' k : ℕ, X^(4*(k+1)^2)))

lemma b_zero {m : ℕ} (hm : m%4≠1) : b m=0 := by
  have empty (P : ℤ→Prop) :
      {t : Triple | 1 + 8*pentagonal t.1 + 16*pentagonal t.2.1 + 4*t.2.2.natAbs^2=m ∧
        P (t.1+t.2.1)} = ∅ := by
    apply Set.eq_empty_iff_forall_notMem.mpr
    intro t ht
    have h := ht.1
    omega
  rw [b,← FourierSeries.finite_eq_infinite, coefficient_count,empty Even,empty Odd]
  simp

lemma odd_square_mod8 (x : ℤ) (hx : Odd x) : x^2%8=1 := by
  have h := Int.odd_iff.mp hx
  have h0 := Int.emod_nonneg x (by decide : (8:ℤ) ≠ 0)
  have h8 := Int.emod_lt_of_pos x (by decide : (0:ℤ) < 8)
  rw [sq,Int.mul_emod]
  interval_cases he : x%8 <;> omega

lemma admissible_residue {m : ℕ} {v : Triple} (hv : v∈shell (2*m)) (ha : admissible v) : m%4=1 := by
  rcases v with ⟨x,y,z⟩
  obtain ⟨hx,hy,hz⟩ := ha
  change z%4=0 at hz
  have h1 := odd_square_mod8 x hx
  have h2 := odd_square_mod8 y hy
  have hz' : z=4*(z/4) := by omega
  have h3 : z^2%8=0 := by
    rw [show z^2 = 8*(2*(z/4)^2) by nth_rw 1 [hz']; ring]
    simp
  have he := mem_shell.mp hv
  change x^2+y^2+z^2=((2*m:ℕ):ℤ) at he
  push_cast at he
  omega

theorem sum_weight_eq_twelve (m : ℕ) : (∑ v ∈ shell (2*m),weight v) = 12*b m := by
  rw [sum_weight]
  by_cases hm : m%4=1
  · rw [sum_coordWeight, slice_card hm Even, slice_card hm Odd]
    have hn : (2*m)%8=2 := by omega
    have hb := signed_theta_expansion (2*m) hn
    dsimp only at hb
    simp only [Nat.mul_div_cancel_left _ (by decide : 0<2)] at hb
    rw [FourierSeries.finite_eq_infinite] at hb
    change b m = _ at hb
    have hE := sign_pairing hn (finite_D (2*m)) Even
    have hO := sign_pairing hn (finite_D (2*m)) Odd
    omega
  · have hz : (∑ v ∈ shell (2*m), coordWeight v) = 0 := by
      apply sum_eq_zero
      intro v hv
      exact if_neg (fun ha => hm (admissible_residue hv ha))
    rw [hz,b_zero hm]
    ring

theorem sum_weight_eq_fourier (m : ℕ) :
    ((∑ v ∈ shell (2*m),weight v):ℂ) = 12*
      (UpperHalfPlane.qExpansion 1 (fun z : UpperHalfPlane =>
        ModularForm.eta (8*(z:ℂ))*ModularForm.eta (16*(z:ℂ))*jacobiTheta (8*(z:ℂ)))).coeff m := by
  rw [OMA.R_CongruentNumber_Tunnell_even_R1_H3_R1.TunnellCentralSeries.qExpansion_theta_coefficient]
  exact_mod_cast sum_weight_eq_twelve m


end TunnellShell

/- Integral quaternion norm shells, rotations, and the weight on a coordinate. -/

namespace TunnellQuaternion

open Finset Quaternion TunnellShell


abbrev QInt := Quaternion ℤ

lemma normSq_mk (a b c d : ℤ) : Quaternion.normSq (⟨a,b,c,d⟩:QInt) = a^2+b^2+c^2+d^2 := Quaternion.normSq_def' _

lemma neg_mk (a b c d : ℤ) : -(⟨a,b,c,d⟩:QInt) = ⟨-a,-b,-c,-d⟩ := rfl

abbrev coordsEquiv := Quaternion.equivProd ℤ

def quatShell (N : ℕ) : Finset QInt :=
  let I := Icc (-(N:ℤ)) (N:ℤ)
  ((I ×ˢ (I ×ˢ (I ×ˢ I))).map coordsEquiv.symm.toEmbedding).filter (fun q => Quaternion.normSq q=N)

@[simp] lemma mem_quatShell {q : QInt} {N : ℕ} : q ∈ quatShell N ↔ Quaternion.normSq q=N := by
  simp only [quatShell,mem_filter,mem_map_equiv]
  refine ⟨And.right,fun hn => ⟨?_,hn⟩⟩
  rw [Quaternion.normSq_def'] at hn
  obtain ⟨a,b,c,d⟩ := q
  change a^2+b^2+c^2+d^2 = (N:ℤ) at hn
  simp only [mem_product,mem_Icc]
  change (- (N:ℤ) ≤ a ∧ a ≤ N) ∧ (- (N:ℤ) ≤ b ∧ b ≤ N) ∧
    (- (N:ℤ) ≤ c ∧ c ≤ N) ∧ - (N:ℤ) ≤ d ∧ d ≤ N
  have hb (x : ℤ) (h : x^2 ≤ N) : -(N:ℤ) ≤ x ∧ x ≤ N := by
    constructor <;> by_contra! he
    · have := mul_nonneg_of_nonpos_of_nonpos (by omega : x ≤ 0) (by omega : x+1 ≤ 0)
      nlinarith
    · have := mul_nonneg (by omega : 0 ≤ x) (by omega : 0 ≤ x-1)
      nlinarith
  exact ⟨hb _ (by nlinarith [sq_nonneg b,sq_nonneg c,sq_nonneg d]),
    hb _ (by nlinarith [sq_nonneg a,sq_nonneg c,sq_nonneg d]),
    hb _ (by nlinarith [sq_nonneg a,sq_nonneg b,sq_nonneg d]),
    hb _ (by nlinarith [sq_nonneg a,sq_nonneg b,sq_nonneg c])⟩

def pure (v : Triple) : QInt := ⟨0,v.1,v.2.1,v.2.2⟩
def vec (q : QInt) : Triple := (q.imI,q.imJ,q.imK)
def rotate (q : QInt) (v : Triple) : Triple := vec (q*pure v*star q)

lemma rotate_apply (a b c d x y z : ℤ) :
    rotate ⟨a,b,c,d⟩ (x,y,z) =
      ((a^2+b^2-c^2-d^2)*x+2*(b*c-a*d)*y+2*(b*d+a*c)*z,
       2*(b*c+a*d)*x+(a^2-b^2+c^2-d^2)*y+2*(c*d-a*b)*z,
       2*(b*d-a*c)*x+2*(c*d+a*b)*y+(a^2-b^2-c^2+d^2)*z) := by
  suffices h : ∀ (q : QInt) (v : Triple), rotate q v =
      ((q.re^2+q.imI^2-q.imJ^2-q.imK^2)*v.1+2*(q.imI*q.imJ-q.re*q.imK)*v.2.1+2*(q.imI*q.imK+q.re*q.imJ)*v.2.2,
       2*(q.imI*q.imJ+q.re*q.imK)*v.1+(q.re^2-q.imI^2+q.imJ^2-q.imK^2)*v.2.1+2*(q.imJ*q.imK-q.re*q.imI)*v.2.2,
       2*(q.imI*q.imK-q.re*q.imJ)*v.1+2*(q.imJ*q.imK+q.re*q.imI)*v.2.1+(q.re^2-q.imI^2-q.imJ^2+q.imK^2)*v.2.2) from h _ _
  intro q v
  ext <;> simp only [rotate,vec,Quaternion.re_mul, Quaternion.imI_mul, Quaternion.imJ_mul, Quaternion.imK_mul, Quaternion.re_star, Quaternion.imI_star, Quaternion.imJ_star, Quaternion.imK_star] <;> simp [pure] <;> ring

def lastWeight (z : ℤ) : ℤ := if z%8=0 then 1 else if z%8=4 then -1 else 0

lemma coordWeight_eq (x y z : ℤ) : coordWeight (x,y,z) =
    if Odd x ∧ Odd y then lastWeight z else 0 := by
  by_cases hx : Odd x <;> by_cases hy : Odd y <;> simp [coordWeight,admissible,hx,hy,lastWeight]
  split_ifs with h h' h''
  all_goals first
    | (rw [Int.negOnePow_even _ (Int.even_iff.mpr (by omega))]; rfl)
    | (rw [Int.negOnePow_odd _ (Int.odd_iff.mpr (by omega))]; rfl)
    | omega

lemma lastWeight_neg (z : ℤ) : lastWeight (-z) = lastWeight z := by
  unfold lastWeight
  split_ifs <;> omega

lemma lastWeight_congr {a b : ℤ} (h : a ≡ b [ZMOD 8]) : lastWeight a = lastWeight b := by
  simp only [lastWeight,show a%8=b%8 from h]

lemma lastWeight_add_four (z k : ℤ) : lastWeight (z+4*k) = (k.negOnePow:ℤ)*lastWeight z := by
  obtain ⟨r,hr|hr⟩ := Int.even_or_odd' k <;> subst k
  · rw [Int.negOnePow_two_mul]
    simp only [Units.val_one,one_mul]
    apply lastWeight_congr
    exact Int.modEq_iff_dvd.mpr ⟨-r,by ring⟩
  · rw [Int.negOnePow_two_mul_add_one]
    simp only [Units.val_neg,Units.val_one,neg_one_mul,lastWeight]
    split_ifs <;> omega

end TunnellQuaternion

/- The four coordinate sections of an odd quaternion norm shell. -/

namespace TunnellQuaternion

open TunnellShell Finset Quaternion


def leftUnit (j : Fin 4) (q : QInt) : QInt := ![q,
  ⟨-q.imI,q.re,-q.imK,q.imJ⟩,⟨-q.imJ,q.imK,q.re,-q.imI⟩,⟨-q.imK,-q.imJ,q.imI,q.re⟩] j

def unitEquiv (j : Fin 4) : QInt ≃ QInt where
  toFun := leftUnit j
  invFun q := if j=0 then q else -(leftUnit j q)
  left_inv q := by
    fin_cases j
    · rfl
    all_goals
      apply QuaternionAlgebra.ext
      all_goals exact neg_neg _
  right_inv q := by
    fin_cases j
    · rfl
    all_goals
      apply QuaternionAlgebra.ext
      all_goals exact neg_neg _

lemma norm_unit (j : Fin 4) (q : QInt) : Quaternion.normSq (leftUnit j q) = Quaternion.normSq q := by
  simp only [Quaternion.normSq_def']
  fin_cases j <;> simp [leftUnit] <;> ring

lemma sum_unit (p : ℕ) (j : Fin 4) (f : QInt → ℤ) :
    ∑ q ∈ quatShell p, f (leftUnit j q) = ∑ q ∈ quatShell p, f q := by
  apply sum_nbij' (unitEquiv j) (unitEquiv j).symm
  · intro x hx; simpa only [mem_quatShell,norm_unit,unitEquiv,Equiv.coe_fn_mk] using hx
  · intro x hx
    rw [mem_quatShell] at hx ⊢
    rw [←norm_unit j]
    exact (congrArg Quaternion.normSq ((unitEquiv j).apply_symm_apply x)).trans hx
  · exact fun x _ => (unitEquiv j).symm_apply_apply x
  · exact fun x _ => (unitEquiv j).apply_symm_apply x
  · exact fun _ _ => rfl

lemma coordWeight_unit (j : Fin 4) (q : QInt) (v : Triple) :
    coordWeight (rotate (leftUnit j q) v) = coordWeight (rotate q v) := by
  obtain ⟨a,b,c,d⟩ := q
  obtain ⟨x,y,z⟩ := v
  let R := rotate (⟨a,b,c,d⟩:QInt) (x,y,z)
  have co (u v w : ℤ) (e₁ e₂ e₃ : ℤ) (h₁ : e₁=1 ∨ e₁ = -1) (h₂ : e₂=1 ∨ e₂ = -1)
      (h₃ : e₃=1 ∨ e₃ = -1) :
      coordWeight (e₁*u,e₂*v,e₃*w) = coordWeight (u,v,w) := by
    rcases h₁ with rfl|rfl <;> rcases h₂ with rfl|rfl <;> rcases h₃ with rfl|rfl <;>
      simp [coordWeight_eq,lastWeight_neg]
  have hi : rotate (leftUnit j ⟨a,b,c,d⟩) (x,y,z) =
      (![1,1,-1,-1] j*R.1, ![1,-1,1,-1] j*R.2.1, ![1,-1,-1,1] j*R.2.2) := by
    fin_cases j <;> simp [leftUnit,R,rotate_apply] <;> ring_nf <;> simp
  rw [hi]
  apply co <;> fin_cases j <;> decide

lemma sq_mod_four (z : ℤ) : z^2 ≡ z%2 [ZMOD 4] := by
  obtain ⟨r,hr|hr⟩ := Int.even_or_odd' z <;> subst z
  · change _%4 = _%4
    ring_nf
    omega
  · change _%4 = _%4
    ring_nf
    omega

lemma parity_count (p : ℕ) (hp : Odd p) {q : QInt} (hq : q ∈ quatShell p) :
    q.re%2+q.imI%2+q.imJ%2+q.imK%2 = (p%4:ℕ) := by
  have h := (((sq_mod_four q.re).add (sq_mod_four q.imI)).add (sq_mod_four q.imJ)).add (sq_mod_four q.imK)
  rw [←Quaternion.normSq_def', mem_quatShell.mp hq] at h
  have hn := Nat.odd_iff.mp hp
  change (p:ℤ)%4 = _ %4 at h
  omega

theorem four_sections (p : ℕ) (hp : Odd p) (v : Triple) :
    ∑ q ∈ quatShell p, coordWeight (rotate q v) =
       4 * ∑ q ∈ quatShell p,
         if q.re%2 = (if p%4=1 then 1 else 0) then coordWeight (rotate q v) else 0 := by
  let e : ℤ := if p%4=1 then 1 else 0
  let F (q : QInt) := coordWeight (rotate q v)
  let w (q : QInt) := if q.re%2=e then F q else 0
  have hc (q : QInt) (hq : q ∈ quatShell p) : F q = ∑ i : Fin 4, w (leftUnit i q) := by
    simp only [w,F,coordWeight_unit]
    rw [Fin.sum_univ_four]
    simp [leftUnit,Int.neg_emod_two]
    have h := parity_count p hp hq
    have ho := Nat.odd_iff.mp hp
    simp only [e] at *
    split_ifs at * <;> omega
  change ∑ q ∈ quatShell p, F q = 4 * ∑ q ∈ quatShell p, w q
  rw [sum_congr rfl hc,sum_comm]
  simp only [sum_unit,Finset.sum_const,card_univ,Fintype.card_fin,nsmul_eq_mul, Nat.cast_ofNat]

end TunnellQuaternion

/- The mod-eight character on the two quaternion parity patterns. -/

namespace TunnellQuaternion

open TunnellShell Quaternion


lemma split_coord (k r s t : ℤ) (v : Triple) :
    coordWeight (rotate ⟨2*k+1,2*r,2*s,2*t⟩ v) = ((r+s).negOnePow:ℤ)*coordWeight v := by
  obtain ⟨x,y,z⟩ := v
  rw [rotate_apply,coordWeight_eq,coordWeight_eq]
  have hxy :
      (Odd (((2*k+1)^2+(2*r)^2-(2*s)^2-(2*t)^2)*x+2*((2*r)*(2*s)-(2*k+1)*(2*t))*y+
        2*((2*r)*(2*t)+(2*k+1)*(2*s))*z) ∧
       Odd (2*((2*r)*(2*s)+(2*k+1)*(2*t))*x+((2*k+1)^2-(2*r)^2+(2*s)^2-(2*t)^2)*y+
        2*((2*s)*(2*t)-(2*k+1)*(2*r))*z)) ↔ Odd x ∧ Odd y := by
    simp only [Int.odd_iff]
    ring_nf
    omega
  simp only [hxy]
  split_ifs with h
  · obtain ⟨⟨i,rfl⟩,⟨j,rfl⟩⟩ := h
    obtain ⟨l,hl|hl⟩ := Int.even_or_odd' z <;> subst z
    · rw [←lastWeight_add_four]
      apply lastWeight_congr
      change _ % 8 = _ % 8
      ring_nf
      omega
    · simp only [lastWeight]
      split_ifs <;> ring_nf at * <;> omega
  · ring

lemma inert_coord (k r s t : ℤ) (v : Triple) :
    coordWeight (rotate ⟨2*k,-(2*r+1),2*s+1,2*t+1⟩ v) =
      -coordWeight (rotate ⟨2*k,2*r+1,2*s+1,2*t+1⟩ v) := by
  obtain ⟨x,y,z⟩ := v
  simp only [rotate_apply,coordWeight_eq,Int.odd_iff]
  split_ifs with h h' h'
  · obtain ⟨i,hi|hi⟩ := Int.even_or_odd' x
    · subst x
      ring_nf at h
      omega
    · subst x
      have hc (w : ℤ) : lastWeight (w+4) = -lastWeight w := by
        simpa using lastWeight_add_four w 1
      rw [←hc]
      apply lastWeight_congr
      change _ % 8 = _ % 8
      ring_nf
      omega
  · ring_nf at h h'
    omega
  · ring_nf at h h'
    omega
  · simp

end TunnellQuaternion

/- The signed conjugation average over the full integral quaternion norm shell. -/

namespace TunnellQuaternion

open Finset Quaternion TunnellShell Polynomial


abbrev Parameter := ℕ × ℤ × ℤ × ℤ

def paramNorm (u : Parameter) : ℕ := (2*u.1+1)^2+
  4*(u.2.1.natAbs^2+u.2.2.1.natAbs^2+u.2.2.2.natAbs^2)

def encode (u : Parameter) : QInt := ⟨2*(u.1:ℤ)+1,2*u.2.1,2*u.2.2.1,2*u.2.2.2⟩
def decode (q : QInt) : Parameter := (q.re.toNat/2,q.imI/2,q.imJ/2,q.imK/2)

def oddParams (p : ℕ) : Finset Parameter :=
  let I := Icc (-(p:ℤ)) (p:ℤ)
  ((range (p+1)) ×ˢ I ×ˢ I ×ˢ I).filter (fun u => paramNorm u=p)

lemma mem_oddParams {p : ℕ} {u : Parameter} : u ∈ oddParams p ↔ paramNorm u=p := by
  simp only [oddParams,mem_filter,mem_product,mem_range,mem_Icc]
  refine ⟨And.right,fun h => ⟨?_,h⟩⟩
  obtain ⟨k,r,s,t⟩ := u
  change (2*k+1)^2+4*(r.natAbs^2+s.natAbs^2+t.natAbs^2)=p at h
  have hh (z : ℤ) (hz : z.natAbs^2 ≤ p) : -(p:ℤ) ≤ z ∧ z ≤ p := by
    have := Nat.le_mul_self z.natAbs
    have := Int.natAbs_eq z
    rw [sq] at hz
    omega
  exact ⟨by nlinarith,hh r (by omega),hh s (by omega),hh t (by omega)⟩

lemma encode_norm (u : Parameter) : Quaternion.normSq (encode u) = (paramNorm u:ℤ) := by
  rw [Quaternion.normSq_def' (encode u)]
  rcases u with ⟨k,r,s,t⟩
  simp only [encode,paramNorm,Nat.cast_add,Nat.cast_mul,Nat.cast_one,
    Nat.cast_pow,Nat.cast_ofNat,Int.natAbs_sq]
  ring

lemma encode_decode {p : ℕ} {q : QInt} (hp : p%4=1) (hq : q ∈ quatShell p)
    (h₁ : q.re%2=1) (h₂ : 0 < q.re) : encode (decode q) = q := by
  have h := parity_count p (Nat.odd_iff.mpr (by omega)) hq
  rw [hp] at h
  ext <;> simp only [encode,decode] <;> omega

lemma decode_encode (u : Parameter) : decode (encode u) = u := by
  rcases u with ⟨k,r,s,t⟩
  ext <;> simp [decode,encode] <;> omega

def sign (u : Parameter) : ℤ := ((u.2.1+u.2.2.1).negOnePow:ℤ)

lemma eta_as_params (p : ℕ) :
    (X * ∏ i ∈ Icc 1 p, ((1-(X:ℤ[X])^(4*i))^2*(1-X^(8*i))^2)).coeff p =
      ∑ u ∈ oddParams p, sign u := by
  rw [TunnellQuaternionTheta.shell_coefficient,oddParams,sum_filter]
  simp only [sum_product,paramNorm,sign]
  rfl

lemma positive_section (p : ℕ) (hp : p%4=1) (v : Triple) :
    ∑ q ∈ quatShell p, (if q.re%2=1 ∧ 0<q.re then coordWeight (rotate q v) else 0) =
      (∑ u ∈ oddParams p, sign u)*coordWeight v := by
  rw [←sum_filter,sum_mul]
  symm
  apply sum_nbij' encode decode
  · intro u hu
    simp only [mem_filter,mem_quatShell,encode_norm,mem_oddParams.mp hu,true_and]
    change (2*(u.1:ℤ)+1)%2 = 1 ∧ 0<2*(u.1:ℤ)+1
    omega
  · intro q hq
    obtain ⟨h₁,h₂,h₃⟩ := mem_filter.mp hq
    rw [mem_oddParams, ←Nat.cast_inj (R:=ℤ),←encode_norm,encode_decode hp h₁ h₂ h₃,mem_quatShell.mp h₁]
  · exact fun u _ => decode_encode u
  · intro q hq
    obtain ⟨h₁,h₂,h₃⟩ := mem_filter.mp hq
    exact encode_decode hp h₁ h₂ h₃
  · intro u _
    exact (split_coord (u.1:ℤ) u.2.1 u.2.2.1 u.2.2.2 v).symm

lemma sum_neg (p : ℕ) (f : QInt → ℤ) : ∑ q ∈ quatShell p, f (-q) = ∑ q ∈ quatShell p, f q := by
  apply sum_nbij' Neg.neg Neg.neg
  · intro q h; simpa only [mem_quatShell,Quaternion.normSq_neg] using h
  · intro q h; simpa only [mem_quatShell,Quaternion.normSq_neg] using h
  · exact fun _ _ => neg_neg _
  · exact fun _ _ => neg_neg _
  · exact fun _ _ => rfl

lemma odd_section (p : ℕ) (v : Triple) :
    ∑ q ∈ quatShell p, (if q.re%2=1 then coordWeight (rotate q v) else 0) =
      2 * ∑ q ∈ quatShell p, (if q.re%2=1 ∧ 0<q.re then coordWeight (rotate q v) else 0) := by
  let f (q : QInt) := if q.re%2=1 ∧ 0<q.re then coordWeight (rotate q v) else 0
  have h (q : QInt) : (if q.re%2=1 then coordWeight (rotate q v) else 0) = f q + f (-q) := by
    have hr : rotate (-q) v = rotate q v := by simp [rotate]
    simp only [f,Quaternion.re_neg,hr,Int.neg_emod_two]
    split_ifs <;> omega
  simp_rw [h,sum_add_distrib,sum_neg]
  ring

def flipI (q : QInt) : QInt := ⟨q.re,-q.imI,q.imJ,q.imK⟩

lemma even_section (p : ℕ) (hp : p%4=3) (v : Triple) :
    ∑ q ∈ quatShell p, (if q.re%2=0 then coordWeight (rotate q v) else 0) = 0 := by
  let f (q : QInt) := if q.re%2=0 then coordWeight (rotate q v) else 0
  have hf (q : QInt) : Quaternion.normSq (flipI q) = Quaternion.normSq q := by
    rw [Quaternion.normSq_def' (flipI q),Quaternion.normSq_def' q]
    simp [flipI]
  have he : ∑ q ∈ quatShell p, f (flipI q) = ∑ q ∈ quatShell p, f q := by
    apply sum_nbij' flipI flipI
    · intro q h; simpa only [mem_quatShell,hf] using h
    · intro q h; simpa only [mem_quatShell,hf] using h
    · intro q _; ext <;> simp [flipI]
    · intro q _; ext <;> simp [flipI]
    · exact fun _ _ => rfl
  have hs (q : QInt) (hq : q ∈ quatShell p) : f (flipI q) = - f q := by
    have h := parity_count p (Nat.odd_iff.mpr (by omega)) hq
    rw [hp] at h
    by_cases ha : q.re%2=0
    · obtain ⟨a,b,c,d⟩ := q
      change a%2=0 at ha
      change a%2+b%2+c%2+d%2=(3:ℤ) at h
      simp only [f,flipI,if_pos ha]
      obtain ⟨k,rfl⟩ : ∃ k, a=2*k := ⟨a/2,by omega⟩
      obtain ⟨r,rfl⟩ : ∃ r, b=2*r+1 := ⟨b/2,by omega⟩
      obtain ⟨s,rfl⟩ : ∃ s, c=2*s+1 := ⟨c/2,by omega⟩
      obtain ⟨t,rfl⟩ : ∃ t, d=2*t+1 := ⟨d/2,by omega⟩
      exact inert_coord k r s t v
    · simp only [f,flipI,if_neg ha,neg_zero]
  rw [sum_congr rfl hs,sum_neg_distrib] at he
  change ∑ q ∈ quatShell p, f q = 0
  omega

noncomputable abbrev etaCoeff (p : ℕ) : ℤ :=
  (X * ∏ i ∈ Icc 1 p, ((1-(X:ℤ[X])^(4*i))^2*(1-X^(8*i))^2)).coeff p

lemma coord_average (p : ℕ) (hp : Odd p) (v : Triple) :
    ∑ q ∈ quatShell p, coordWeight (rotate q v) = 8*etaCoeff p*coordWeight v := by
  rw [four_sections p hp]
  by_cases h : p%4=1
  · simp only [h,if_true]
    rw [odd_section,positive_section p h,←eta_as_params]
    ring
  · have h3 : p%4=3 := by have ho := Nat.odd_iff.mp hp; omega
    simp only [h,if_false,even_section p h3,mul_zero]
    have hn : oddParams p = ∅ := by
      apply eq_empty_iff_forall_notMem.mpr
      intro u hu
      have hq : encode u ∈ quatShell p := by rw [mem_quatShell,encode_norm,mem_oddParams.mp hu]
      have hh := parity_count p hp hq
      rw [h3] at hh
      simp only [encode] at hh
      omega
    rw [etaCoeff,eta_as_params,hn,sum_empty]
    ring

def cycleQ (q : QInt) : QInt := ⟨q.re,q.imJ,q.imK,q.imI⟩

lemma cycle_rotate (q : QInt) (v : Triple) : rot (rotate q v) = rotate (cycleQ q) (rot v) := by
  obtain ⟨a,b,c,d⟩ := q
  obtain ⟨x,y,z⟩ := v
  simp only [cycleQ,rot,rotate_apply]
  ext <;> ring

lemma sum_cycle (p : ℕ) (f : QInt → ℤ) : ∑ q ∈ quatShell p, f (cycleQ q) = ∑ q ∈ quatShell p, f q := by
  have h (q : QInt) : Quaternion.normSq (cycleQ q) = Quaternion.normSq q := by
    rw [Quaternion.normSq_def' (cycleQ q),Quaternion.normSq_def' q]
    simp only [cycleQ]
    ring
  apply sum_nbij' cycleQ (fun q => cycleQ (cycleQ q))
  · intro q hq; simpa only [mem_quatShell,h] using hq
  · intro q hq; simpa only [mem_quatShell,h] using hq
  · exact fun q _ => rfl
  · exact fun q _ => rfl
  · exact fun q _ => rfl

theorem raw_eigenvalue (p : ℕ) (hp : Odd p) (v : Triple) :
    ∑ q ∈ quatShell p, weight (rotate q v) = 8 * etaCoeff p * weight v := by
  simp only [weight,Finset.sum_add_distrib,cycle_rotate]
  rw [sum_cycle p (fun q => coordWeight (rotate q (rot v))),
    sum_cycle p (fun q => coordWeight (rotate (cycleQ q) (rot (rot v)))),
    sum_cycle p (fun q => coordWeight (rotate q (rot (rot v))))]
  simp only [coord_average p hp,mul_add]


end TunnellQuaternion

/- Weighted finite fibers on ternary quadratic shells and the resulting Hecke relation. -/

namespace TunnellShellFibers

open Finset TunnellShell

def divisible (p : ℕ) (v : Triple) : Prop := (p:ℤ) ∣ v.1 ∧ (p:ℤ) ∣ v.2.1 ∧ (p:ℤ) ∣ v.2.2
instance (p : ℕ) (v : Triple) : Decidable (divisible p v) := by unfold divisible; infer_instance

def divide (p : ℕ) (v : Triple) : Triple := (v.1/p, v.2.1/p, v.2.2/p)

lemma smul_divide (p : ℕ) (v : Triple) (h : divisible p v) : (p:ℤ) • divide p v = v := by
  obtain ⟨x,y,z⟩ := v
  obtain ⟨hx,hy,hz⟩ := h
  apply Prod.ext (Int.mul_ediv_cancel' hx)
  exact Prod.ext (Int.mul_ediv_cancel' hy) (Int.mul_ediv_cancel' hz)

lemma divide_smul {p : ℕ} (hp : p≠0) (v : Triple) : divide p ((p:ℤ) • v) = v := by
  rcases v with ⟨x,y,z⟩
  simp [divide, hp]

lemma divisible_smul (p : ℕ) (v : Triple) : divisible p ((p:ℤ) • v) := by
  obtain ⟨x,y,z⟩ := v
  simp [divisible]

lemma norm_smul (p : ℕ) (v : Triple) : normSq ((p:ℤ) • v) = (p:ℤ)^2*normSq v := by
  rcases v with ⟨x,y,z⟩
  simp [normSq]
  ring

lemma sum_scaled {p : ℕ} (hp : p ≠ 0) (N : ℕ) (f : Triple → ℤ) :
    (∑ w ∈ (shell (p^2*N)).filter (divisible p), f w) = ∑ v ∈ shell N, f ((p:ℤ) • v) := by
  apply sum_nbij' (divide p) (fun v => (p:ℤ) • v)
  · intro w hw
    obtain ⟨hwn,hdiv⟩ := mem_filter.mp hw
    have he := mem_shell.mp hwn
    rw [←smul_divide p w hdiv,norm_smul] at he
    push_cast at he
    exact mem_shell.mpr (mul_left_cancel₀ (pow_ne_zero 2 (by exact_mod_cast hp)) he)
  · intro v hv
    exact mem_filter.mpr ⟨mem_shell.mpr (by rw [norm_smul,mem_shell.mp hv]; push_cast; rfl),divisible_smul p v⟩
  · intro w hw
    exact smul_divide p w (mem_filter.mp hw).2
  · intro v _
    exact divide_smul hp v
  · intro w hw
    rw [smul_divide p w (mem_filter.mp hw).2]

lemma square_dvd_norm {N p : ℕ} {v : Triple} (hv : v∈shell N) (hd : divisible p v) : p^2 ∣ N := by
  have hi := mem_shell.mp hv
  rw [←smul_divide p v hd,norm_smul] at hi
  exact_mod_cast (show (p:ℤ)^2 ∣ (N:ℤ) from ⟨_,hi.symm⟩)

lemma sum_divisible {p : ℕ} (hp : p ≠ 0) (N : ℕ) (f : Triple → ℤ)
    (hf : ∀ v, f ((p:ℤ) • v) = f v) :
    (∑ v ∈ (shell N).filter (divisible p), f v) =
      if p^2∣N then ∑ w ∈ shell (N/p^2), f w else 0 := by
  split_ifs with h
  · conv_lhs => rw [← Nat.mul_div_cancel' h]
    simpa only [hf] using sum_scaled hp (N/p^2) f
  · apply sum_eq_zero
    intro w hw
    exact (h (square_dvd_norm (mem_filter.mp hw).1 (mem_filter.mp hw).2)).elim

lemma coordWeight_smul {p : ℤ} (hp : Odd p) (v : Triple) : coordWeight (p • v) = coordWeight v := by
  obtain ⟨x,y,z⟩ := v
  have hp' := Int.odd_iff.mp hp
  have h4 : (p*z)%4=0 ↔ z%4=0 := by
    rw [Int.mul_emod]
    have hp4 : p%4=1 ∨ p%4=3 := by omega
    rcases hp4 with h|h <;> rw [h] <;> omega
  have hcond : admissible (p • (x,y,z)) ↔ admissible (x,y,z) := by
    change (Odd (p*x) ∧ Odd (p*y) ∧ (p*z)%4=0) ↔ Odd x ∧ Odd y ∧ z%4=0
    simp [Int.odd_mul,hp,h4]
  unfold coordWeight
  rw [if_congr hcond rfl rfl]
  split_ifs with had
  · have hdiv : 4∣z := Int.dvd_of_emod_eq_zero had.2.2
    change ((p*z/4).negOnePow:ℤ)=((z/4).negOnePow:ℤ)
    rw [Int.mul_ediv_assoc p hdiv]
    apply congrArg Units.val
    apply (Int.negOnePow_eq_iff _ _).mpr
    rcases hp with ⟨k,hk⟩
    exact ⟨k*(z/4),by rw [hk]; ring⟩
  · rfl

lemma weight_smul {p : ℤ} (hp : Odd p) (v : Triple) : weight (p • v) = weight v := by
  change coordWeight (p • v) + coordWeight (p • rot v) + coordWeight (p • rot (rot v)) = _
  rw [coordWeight_smul hp,coordWeight_smul hp,coordWeight_smul hp]
  rfl

def count {α : Type*} (D : Finset α) (g : α → Triple) (w : Triple) : ℕ :=
  (D.filter (fun x => g x = w)).card

/-- Summing the two incidence multiplicities yields the ternary Hecke relation. -/
theorem raw_fiber_sum {α : Type*} {p N : ℕ} [Fact p.Prime]
    (D : Finset α) (g : α → Triple) (f : Triple → ℤ)
    (hg : ∀ x ∈ D, g x ∈ shell (p^2*N)) (hf : ∀ v, f ((p:ℤ) • v) = f v)
    (hprim : ∀ w ∈ shell (p^2*N), ¬divisible p w → count D g w = 8)
    (hscaled : ∀ v ∈ shell N, (count D g ((p:ℤ) • v) : ℤ) =
      8 * (if divisible p v then (p:ℤ)+1 else 1+quadraticChar (ZMod p) (-(N:ZMod p)))) :
    ∑ x ∈ D, f (g x) = 8 * ((∑ w ∈ shell (p^2*N), f w) +
      quadraticChar (ZMod p) (-(N:ZMod p)) * (∑ v ∈ shell N, f v) +
      (if p^2∣N then (p:ℤ) * ∑ u ∈ shell (N/p^2), f u else 0)) := by
  classical
  let χ : ℤ := quadraticChar (ZMod p) (-(N:ZMod p))
  let S := shell (p^2*N)
  let corr (w : Triple) : ℤ := ((count D g w:ℤ)-8)*f w
  have hp : p≠0 := (Fact.out : p.Prime).ne_zero
  have hc (v : Triple) (hv : v ∈ shell N) (hdiv : divisible p v) : χ = 0 := by
    have hd : p∣N := dvd_trans (by simp) (square_dvd_norm hv hdiv)
    simp [χ,(ZMod.natCast_eq_zero_iff N p).2 hd]
  have hcorr : (∑ w ∈ S, corr w) = ∑ v ∈ shell N, corr ((p:ℤ) • v) := by
    rw [←sum_scaled hp N corr]
    symm
    apply sum_subset (filter_subset _ _)
    intro w hw hn
    have hdiv : ¬divisible p w := fun h => hn (mem_filter.mpr ⟨hw,h⟩)
    simp [corr,hprim w hw hdiv]
  have hcor (v : Triple) (hv : v ∈ shell N) : corr ((p:ℤ) • v) =
      8*(χ*f v + (if divisible p v then (p:ℤ)*f v else 0)) := by
    dsimp only [corr]
    rw [hscaled v hv,hf]
    change (8*(if divisible p v then (p:ℤ)+1 else 1+χ)-8)*f v = _
    by_cases h : divisible p v
    · rw [if_pos h,if_pos h,hc v hv h]
      ring
    · rw [if_neg h,if_neg h]
      ring
  rw [←sum_fiberwise_of_maps_to' hg f]
  simp only [sum_const, nsmul_eq_mul]
  change ∑ w ∈ S, (count D g w:ℤ)*f w = _
  calc
    _ = ∑ w ∈ S, (8*f w+corr w) := sum_congr rfl (fun w _ => by dsimp [corr]; ring)
    _ = _ := by
      rw [sum_add_distrib,hcorr,sum_congr rfl hcor,←mul_sum,←mul_sum,sum_add_distrib,←mul_sum,
        ←sum_filter,←mul_sum,sum_divisible hp N f hf]
      dsimp [χ,S]
      split_ifs <;> ring

end TunnellShellFibers

namespace TunnellEigenlines

open Matrix

abbrev Mat (p : ℕ) := Matrix (Fin 2) (Fin 2) (ZMod p)

def vec {p : ℕ} : Option (ZMod p) → Fin 2 → ZMod p
  | none => ![0, 1]
  | some r => ![1, r]

def invariant {p : ℕ} (W : Mat p) : Option (ZMod p) → Prop
  | none => W 0 1 = 0
  | some r => W 1 0 + W 1 1 * r = r * (W 0 0 + W 0 1 * r)

instance {p : ℕ} [NeZero p] (W : Mat p) (l : Option (ZMod p)) : Decidable (invariant W l) := by
  cases l <;> unfold invariant <;> infer_instance

theorem invariant_iff {p : ℕ} (W : Mat p) (l : Option (ZMod p)) : invariant W l ↔
    ∃ k : ZMod p, W.mulVec (vec l) = k • vec l := by
  cases l with
  | none =>
    constructor
    · intro h
      refine ⟨W 1 1, ?_⟩
      ext i
      fin_cases i <;> simp_all [vec, invariant, Matrix.mulVec, Matrix.vecHead, Matrix.vecTail]
    · rintro ⟨k, h⟩
      simpa [vec, invariant, Matrix.mulVec, Matrix.vecHead, Matrix.vecTail] using congrFun h 0
  | some r =>
    constructor
    · intro h
      refine ⟨W 0 0 + W 0 1 * r, ?_⟩
      ext i
      fin_cases i <;> simp_all [vec, invariant, Matrix.mulVec, Matrix.vecHead, Matrix.vecTail, mul_comm]
    · rintro ⟨k, h⟩
      have h0 := congrFun h 0
      have h1 := congrFun h 1
      simp [vec, Matrix.mulVec, Matrix.vecHead, Matrix.vecTail] at h0 h1
      rw [← h0] at h1
      simpa [invariant, mul_comm] using h1

theorem card_invariant {p : ℕ} [Fact p.Prime] (hp : p ≠ 2) (W : Mat p)
    (ht : W.trace = 0) :
    ((Finset.univ.filter (invariant W)).card : ℤ) =
      if W = 0 then (p : ℤ) + 1 else 1 + quadraticChar (ZMod p) (-W.det) := by
  classical
  have hc : ringChar (ZMod p) ≠ 2 := by simpa only [ZMod.ringChar_zmod_n] using hp
  have h2 : (2 : ZMod p) ≠ 0 := by
    change ((2 : ℕ) : ZMod p) ≠ 0
    rw [Ne, ZMod.natCast_eq_zero_iff]
    exact fun h => hp ((Nat.prime_dvd_prime_iff_eq Fact.out Nat.prime_two).mp h)
  by_cases hW : W = 0
  · subst W
    have hall : (Finset.univ.filter (invariant (0 : Mat p))) = Finset.univ := by
      ext l
      cases l <;> simp [invariant]
    simp [hall, ZMod.card]
  rw [if_neg hW]
  have hd : W 1 1 = -W 0 0 := by
    rw [Matrix.trace_fin_two] at ht
    linear_combination ht
  have hdet : -W.det = (W 0 0)^2 + W 0 1 * W 1 0 := by
    rw [Matrix.det_fin_two, hd]
    ring
  by_cases hb : W 0 1 = 0
  · rw [hdet, hb, zero_mul, add_zero]
    by_cases ha : W 0 0 = 0
    · have hc' : W 1 0 ≠ 0 := by
        intro h
        apply hW
        ext i j
        fin_cases i <;> fin_cases j <;> simp_all
      have heq : Finset.univ.filter (invariant W) = {none} := by
        ext l
        cases l <;> simp [invariant, hb, hd, ha, hc']
      simp [heq, ha]
    · have hden := mul_ne_zero h2 ha
      set r : ZMod p := W 1 0 / (2 * W 0 0) with hr
      have hi (s : ZMod p) : invariant W (some s) ↔ s = r := by
        change W 1 0 + W 1 1*s = s*(W 0 0 + W 0 1*s) ↔ _
        rw [hd, hb, zero_mul, add_zero, hr, eq_div_iff hden]
        constructor <;> intro h <;> linear_combination -h
      have heq : Finset.univ.filter (invariant W) = {none, some r} := by
        ext l
        cases l with
        | none => simp [invariant,hb]
        | some s => simpa using hi s
      simp [heq, quadraticChar_sq_one' ha]
  · have hi (r : ZMod p) : invariant W (some r) ↔ (W 0 1*r+W 0 0)^2 = -W.det := by
      change W 1 0 + W 1 1*r = r*(W 0 0 + W 0 1*r) ↔ _
      rw [hd,hdet]
      constructor
      · intro h
        linear_combination -W 0 1*h
      · intro h
        have e : W 0 1*(W 1 0 + -W 0 0*r-r*(W 0 0 + W 0 1*r))=0 := by
          linear_combination -h
        exact sub_eq_zero.mp ((mul_eq_zero.mp e).resolve_left hb)
    have hcard : (Finset.univ.filter (invariant W)).card =
        {x : ZMod p | x^2 = -W.det}.toFinset.card := by
      apply Finset.card_nbij' (fun l => W 0 1*l.getD 0 + W 0 0)
        (fun s => some ((s-W 0 0)/W 0 1))
      · intro l hl
        cases l with
        | none => simp [invariant,hb] at hl
        | some r => simpa using (hi r).mp (Finset.mem_filter.mp hl).2
      · intro s hs
        have hs' : s^2 = -W.det := by simpa using hs
        apply Finset.mem_filter.mpr ⟨Finset.mem_univ _,(hi _).mpr ?_⟩
        have h : W 0 1*((s-W 0 0)/W 0 1)+W 0 0=s := by field_simp; ring
        rw [h, hs']
      · intro l hl
        cases l with
        | none => simp [invariant,hb] at hl
        | some r => simp [hb]
      · intro s _
        change W 0 1*((s-W 0 0)/W 0 1)+W 0 0=s
        field_simp
        ring
    rw [hcard, quadraticChar_card_sqrts hc, add_comm]

end TunnellEigenlines

/- Explicit splitting of the Hamilton quaternion algebra at odd primes. -/

namespace TunnellQuaternion

open Matrix Quaternion

variable {K : Type*} [Field K]

def matrixOf (a b : K) (x : Quaternion K) : Matrix (Fin 2) (Fin 2) K :=
  !![x.re + a*x.imJ + b*x.imK, x.imI+b*x.imJ-a*x.imK;
     -x.imI+b*x.imJ-a*x.imK, x.re-a*x.imJ-b*x.imK]

def splitHom (a b : K) (hab : a^2+b^2 = -1) : Quaternion K →+* Matrix (Fin 2) (Fin 2) K where
  toFun := matrixOf a b
  map_zero' := by ext i j; fin_cases i <;> fin_cases j <;> simp [matrixOf]
  map_one' := by ext i j; fin_cases i <;> fin_cases j <;> simp [matrixOf]
  map_add' x y := by ext i j; fin_cases i <;> fin_cases j <;> simp [matrixOf] <;> ring
  map_mul' x y := by
    have hb : b^2= -1-a^2 := by linear_combination hab
    ext i j
    fin_cases i <;> fin_cases j <;>
      simp [matrixOf,Matrix.mul_apply,Fin.sum_univ_two] <;> ring_nf <;> rw [hb] <;> ring

lemma split_det (a b : K) (hab : a^2+b^2 = -1) (x : Quaternion K) :
    (splitHom a b hab x).det = normSq x := by
  change (matrixOf a b x).det = _
  simp [Matrix.det_fin_two,matrixOf,normSq_def']
  linear_combination -(x.imJ^2+x.imK^2)*hab

lemma split_trace (a b : K) (hab : a^2+b^2 = -1) (x : Quaternion K) :
    (splitHom a b hab x).trace = 2*x.re := by
  change (matrixOf a b x).trace = _
  simp [Matrix.trace_fin_two,matrixOf]
  ring

lemma split_star (a b : K) (hab : a^2+b^2 = -1) (x : Quaternion K) :
    splitHom a b hab (star x) = (splitHom a b hab x).adjugate := by
  change matrixOf a b (star x) = (matrixOf a b x).adjugate
  rw [Matrix.adjugate_fin_two]
  ext i j
  fin_cases i <;> fin_cases j <;> simp [matrixOf] <;> ring

def quaternionOf (a b : K) (m : Matrix (Fin 2) (Fin 2) K) : Quaternion K :=
  ⟨(m 0 0+m 1 1)/2,(m 0 1-m 1 0)/2,
    -(a*(m 0 0-m 1 1) + b*(m 0 1+m 1 0))/2,
    -(b*(m 0 0-m 1 1) - a*(m 0 1+m 1 0))/2⟩

lemma split_iso (a b : K) (hab : a^2+b^2 = -1) (htwo : (2:K) ≠ 0) :
    Function.Bijective (splitHom a b hab) := by
  have hb : b^2 = -1-a^2 := by linear_combination hab
  have left : Function.LeftInverse (quaternionOf a b) (splitHom a b hab) := by
    intro x
    change quaternionOf a b (matrixOf a b x) = x
    ext <;> dsimp [matrixOf,quaternionOf] <;> field_simp <;> ring_nf <;> rw [hb] <;> ring
  have right : Function.RightInverse (quaternionOf a b) (splitHom a b hab) := by
    intro M
    change matrixOf a b (quaternionOf a b M) = M
    ext i j
    fin_cases i <;> fin_cases j <;> dsimp [matrixOf,quaternionOf] <;> field_simp <;> ring_nf <;> rw [hb] <;> ring
  exact ⟨left.injective,right.surjective⟩

lemma exists_splitting (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) :
    ∃ a b : ZMod p, a^2+b^2 = -1 ∧ (2:ZMod p) ≠ 0 := by
  obtain ⟨a,b,ha,hb,h⟩ := Nat.sq_add_sq_zmodEq p (-1)
  refine ⟨a,b,?_,?_⟩
  · exact_mod_cast ((ZMod.intCast_eq_intCast_iff _ _ _).mpr h)
  · intro he
    have hh := (ZMod.natCast_eq_zero_iff 2 p).mp (by simpa using he)
    have := (Nat.dvd_prime Nat.prime_two).mp hh
    have := (Fact.out : p.Prime).ne_one
    tauto

end TunnellQuaternion

/- Projective lines and rank-one quaternion reductions modulo an odd prime. -/

namespace TunnellQuaternion

open Matrix

variable {K : Type*} [Field K]
abbrev M2 (K : Type*) := Matrix (Fin 2) (Fin 2) K
abbrev V2 (K : Type*) := Fin 2 → K

def inLine (l : Option K) (M : M2 K) : Prop :=
  match l with
  | none => ∀ j, M 0 j = 0
  | some r => ∀ j, M 1 j = r*M 0 j

def direction (l : Option K) : V2 K := match l with
  | none => ![0,1]
  | some r => ![1,r]

def rowOf (l : Option K) (M : M2 K) : V2 K := match l with
  | none => M 1
  | some _ => M 0

lemma line_factored {l : Option K} {M : M2 K} (h : inLine l M) :
    vecMulVec (direction l) (rowOf l M) = M := by
  ext i j
  cases l <;> fin_cases i <;> fin_cases j <;> simp_all [inLine,rowOf,direction,vecMulVec]

lemma line_mul {l : Option K} {M : M2 K} (h : inLine l M) (B : M2 K) :
    inLine l (M*B) := by
  cases l with
  | none => change ∀ j, M 0 j = 0 at h; intro j; simp [Matrix.mul_apply,h]
  | some r =>
    intro j
    change ∀ j, M 1 j=r*M 0 j at h
    simp [Matrix.mul_apply,h,mul_assoc,mul_add]

lemma line_smul {l : Option K} {M : M2 K} (h : inLine l M) (t : K) :
    inLine l (t • M) := by
  cases l with
  | none => change ∀ j, M 0 j = 0 at h; intro j; simp [h]
  | some r => intro j; change ∀ j, M 1 j = r*M 0 j at h; simp [h,mul_left_comm]

lemma det_line {l : Option K} {M : M2 K} (h : inLine l M) : M.det=0 := by
  cases l <;> simp_all [inLine, Matrix.det_fin_two] <;> ring

lemma line_unique (M : M2 K) (h : M≠0) (hd : M.det=0) : ∃! l, inLine l M := by
  by_cases h0 : ∀ j, M 0 j=0
  · refine ⟨none,h0,?_⟩
    rintro (_|r) he
    · rfl
    · change ∀ j, M 1 j=r*M 0 j at he; exfalso; apply h; ext i j; fin_cases i <;> simp [h0,he]
  · obtain ⟨j,hj⟩ := not_forall.mp h0
    refine ⟨some (M 1 j/M 0 j),?_,?_⟩
    · intro k
      rw [div_mul_eq_mul_div,eq_div_iff hj]
      rw [Matrix.det_fin_two] at hd
      fin_cases j <;> fin_cases k
      · rfl
      · change M 1 1 * M 0 0 = M 1 0 * M 0 1; linear_combination hd
      · change M 1 0 * M 0 1 = M 1 1 * M 0 0; linear_combination -hd
      · rfl
    · rintro (_|r) he
      · exact False.elim (hj (he j))
      · congr 1
        exact (eq_div_iff hj).mpr (he j).symm

lemma adj_mul_zero_iff {l : Option K} {A : M2 K} (hA : A≠0)
    (hdl : inLine l A) (B : M2 K) : A.adjugate * B = 0 ↔ inLine l B := by
  by_cases hr : rowOf l A = 0
  · have := line_factored hdl
    rw [hr, Matrix.vecMulVec_zero] at this
    exact False.elim (hA this.symm)
  obtain ⟨i,hi⟩ := Function.ne_iff.mp hr
  rw [Matrix.adjugate_fin_two]
  cases l with
  | none =>
    change ∀ j, A 0 j=0 at hdl
    change A 1 i ≠ 0 at hi
    constructor
    · intro h j
      have h₀ := congrArg (fun M:M2 K => M 0 j) h
      have h₁ := congrArg (fun M:M2 K => M 1 j) h
      simp [Matrix.mul_apply,Fin.sum_univ_two,hdl] at h₀ h₁
      fin_cases i <;> grind
    · intro h; change ∀ j, B 0 j=0 at h; ext i j; fin_cases i <;> simp [Matrix.mul_apply,Fin.sum_univ_two,hdl,h]
  | some r =>
    change ∀ j, A 1 j=r*A 0 j at hdl
    change A 0 i ≠ 0 at hi
    constructor
    · intro h j
      have h₀ := congrArg (fun M:M2 K => M 0 j) h
      have h₁ := congrArg (fun M:M2 K => M 1 j) h
      simp [Matrix.mul_apply,Fin.sum_univ_two,hdl] at h₀ h₁
      fin_cases i
      · apply mul_left_cancel₀ hi
        change A 0 0 * B 1 j = A 0 0 * (r*B 0 j)
        linear_combination h₁
      · apply mul_left_cancel₀ hi
        change A 0 1 * B 1 j = A 0 1 * (r*B 0 j)
        linear_combination -h₀
    · intro h; change ∀ j, B 1 j=r*B 0 j at h
      ext i j; fin_cases i <;> simp [Matrix.mul_apply,Fin.sum_univ_two,hdl,h] <;> ring

lemma reversed_product_zero {A B : M2 K} (ha : A.det=0) (hb : B.det=0)
    (hab : A*B≠0) (htr : (A*B).trace=0) : B*A=0 := by
  obtain ⟨l,hl,_⟩ := line_unique A (by rintro rfl; simp at hab) ha
  obtain ⟨m,hm,_⟩ := line_unique B (by rintro rfl; simp at hab) hb
  rw [←line_factored hl,←line_factored hm] at hab htr ⊢
  let u := direction l
  let v := rowOf l A
  let x := direction m
  let y := rowOf m B
  have mul (a b c d : V2 K) : vecMulVec a b * vecMulVec c d = (b ⬝ᵥ c) • vecMulVec a d := by
    rw [Matrix.vecMulVec_mul_vecMulVec]
    ext i j
    simp [mul_left_comm]
  rw [mul] at hab htr ⊢
  have hd : (v ⬝ᵥ x) ≠ 0 := by intro h; exact hab (by rw [show rowOf l A ⬝ᵥ direction m = 0 from h,zero_smul])
  rw [Matrix.trace_smul,Matrix.trace_vecMulVec] at htr
  have e := (mul_eq_zero.mp htr).resolve_left hd
  rw [dotProduct_comm, e,zero_smul]

end TunnellQuaternion

/- Descent of integral Hamilton quaternions inside specified right ideals modulo an odd prime. -/

namespace TunnellQuaternion

open Quaternion


def redFun (p : ℕ) (q : Quaternion ℤ) : Quaternion (ZMod p) := ⟨q.re,q.imI,q.imJ,q.imK⟩

def red (p : ℕ) : Quaternion ℤ →+* Quaternion (ZMod p) where
  toFun := redFun p
  map_add' x y := by apply QuaternionAlgebra.ext <;> simp only [Quaternion.re_add,Quaternion.imI_add,Quaternion.imJ_add,Quaternion.imK_add] <;> simp [redFun]
  map_mul' x y := by
    apply QuaternionAlgebra.ext <;> simp only [Quaternion.re_mul,Quaternion.imI_mul,Quaternion.imJ_mul,Quaternion.imK_mul] <;> simp [redFun]
  map_zero' := by ext <;> simp [redFun]
  map_one' := by ext <;> simp [redFun]

lemma red_apply (p : ℕ) (x : Quaternion ℤ) : red p x = redFun p x := rfl

lemma red_star (p : ℕ) (x : Quaternion ℤ) : red p (star x) = star (red p x) := by
  change redFun p (star x) = star (redFun p x)
  apply QuaternionAlgebra.ext <;> simp only [Quaternion.re_star,Quaternion.imI_star,Quaternion.imJ_star,Quaternion.imK_star] <;> simp [redFun]

lemma red_norm (p : ℕ) (x : Quaternion ℤ) : ((normSq x:ℤ) : ZMod p) = normSq (red p x) := by
  rw [normSq_def',normSq_def']
  simp [red_apply,redFun]

lemma red_smul (p : ℕ) (t : ℤ) (x : Quaternion ℤ) :
    red p (t • x) = (t:ZMod p) • red p x := by
  change redFun p (t • x) = (t:ZMod p) • redFun p x
  apply QuaternionAlgebra.ext <;> simp only [Quaternion.re_smul,Quaternion.imI_smul,Quaternion.imJ_smul,Quaternion.imK_smul] <;> simp [redFun,smul_eq_mul]

lemma norm_smul (t : ℤ) (x : Quaternion ℤ) : normSq (t • x) = t^2*normSq x := by
  rw [← coe_mul_eq_smul, map_mul, normSq_coe]

lemma div_iff (m : ℕ) (q : Quaternion ℤ) : red m q = 0 ↔ ∃ v : Quaternion ℤ, q = (m:ℤ) • v := by
  constructor
  · intro h
    have hd (a : ℤ) (ha : (a:ZMod m)=0) : a=(m:ℤ)*(a/m) :=
      (Int.mul_ediv_cancel' (ZMod.intCast_zmod_eq_zero_iff_dvd a m |>.mp ha)).symm
    refine ⟨⟨q.re/m,q.imI/m,q.imJ/m,q.imK/m⟩,?_⟩
    cases q with | mk a b c d =>
      exact QuaternionAlgebra.ext (hd a (congrArg (fun q : Quaternion (ZMod m) => q.re) h)) (hd b (congrArg (fun q : Quaternion (ZMod m) => q.imI) h))
        (hd c (congrArg (fun q : Quaternion (ZMod m) => q.imJ) h)) (hd d (congrArg (fun q : Quaternion (ZMod m) => q.imK) h))
  · rintro ⟨v,rfl⟩
    rw [red_smul]; simp

def lift (m : ℕ) (x : Quaternion (ZMod m)) : Quaternion ℤ :=
  ⟨x.re.valMinAbs,x.imI.valMinAbs,x.imJ.valMinAbs,x.imK.valMinAbs⟩

@[simp] lemma red_lift (m : ℕ) (x : Quaternion (ZMod m)) : red m (lift m x)=x := by
  change redFun m (lift m x)=x
  apply QuaternionAlgebra.ext <;> dsimp only [redFun,lift] <;> simp

lemma norm_lift_lt {m : ℕ} [NeZero m] (hm : Odd m) (x : Quaternion (ZMod m)) :
    normSq (lift m x) < (m:ℤ)^2 := by
  have hn : 0<(m:ℤ) := Nat.cast_pos.mpr (Nat.pos_of_ne_zero (NeZero.ne m))
  have h (a : ZMod m) : 4*a.valMinAbs^2 < (m:ℤ)^2 := by
    obtain ⟨hl,hu⟩ := a.valMinAbs_mem_Ioc
    have hm' := hm
    rcases hm' with ⟨k,hk⟩
    have hu2 : a.valMinAbs*2 < (m:ℤ) := by omega
    nlinarith [mul_pos (sub_pos.mpr hu2) (by linarith [hl] : 0<(m:ℤ)+a.valMinAbs*2)]
  rw [normSq_def']
  dsimp only [lift]
  linarith [h x.re,h x.imI,h x.imJ,h x.imK]

lemma even_descent (x : Quaternion ℤ) (h : Even (normSq x)) :
    ∃ r : Quaternion ℤ, normSq r=2 ∧ red 2 (x*r)=0 := by
  let i : Quaternion ℤ := ⟨1,1,0,0⟩
  let j : Quaternion ℤ := ⟨1,0,1,0⟩
  let k : Quaternion ℤ := ⟨1,0,0,1⟩
  have ee : normSq (red 2 x)=0 := by rw [←red_norm]; exact h.intCast_zmod_two
  letI : DecidableEq (Quaternion (ZMod 2)) := (Quaternion.equivProd _).decidableEq
  have claim : ∀ w : Quaternion (ZMod 2), normSq w=0 →
      w*red 2 i=0 ∨ w*red 2 j=0 ∨ w*red 2 k=0 := by
    intro ⟨a,b,c,d⟩
    revert a b c d
    decide
  rcases claim _ ee with h|h|h
  · exact ⟨i,by decide, by simpa using h⟩
  · exact ⟨j,by decide, by simpa using h⟩
  · exact ⟨k,by decide, by simpa using h⟩

theorem find_generator {p : ℕ} (hp : p.Prime) (ho : p ≠ 2) (S : Set (Quaternion (ZMod p)))
    (hS : ∀ a ∈ S, ∀ b, a*b ∈ S)
    (hSc : ∀ (r : ZMod p) a, a ∈ S → r • a ∈ S)
    (hzero : ∀ a ∈ S, normSq a=0) (hne : ∃ a ∈ S, a≠0) :
    ∃ q : Quaternion ℤ, normSq q = p ∧ red p q ∈ S := by
  classical
  letI : Fact p.Prime := ⟨hp⟩
  have hodd := hp.odd_of_ne_two ho
  have initial : ∃ m : ℕ, 0 < m ∧ m < p ∧ ∃ x : Quaternion ℤ, normSq x = (m:ℤ)*p ∧ red p x ∈ S := by
    obtain ⟨a,ha,ha0⟩ := hne
    let x := lift p a
    have hr : red p x = a := red_lift p a
    have hd : (p:ℤ) ∣ normSq x := (ZMod.intCast_zmod_eq_zero_iff_dvd _ _).mp
      (by rw [red_norm,hr,hzero _ ha])
    obtain ⟨v,hv⟩ := hd
    have hx : 0 < normSq x := (normSq_nonneg (a:=x)).lt_of_ne' (normSq_ne_zero.mpr
      (fun he => ha0 (by rw [←hr,he,map_zero])))
    have hpos : 0 < v := pos_of_mul_pos_right (hv ▸ hx) (by positivity : (0:ℤ) ≤ p)
    have hlt := norm_lift_lt hodd a
    change normSq x < (p:ℤ)^2 at hlt
    refine ⟨v.toNat,by omega,?_,x,?_,hr ▸ ha⟩
    · rw [hv,sq] at hlt
      have := lt_of_mul_lt_mul_left hlt (by positivity : (0:ℤ) ≤ p)
      omega
    · rw [Int.toNat_of_nonneg hpos.le,hv,mul_comm]
  obtain ⟨m,⟨hm0,hmp,x,hx,hxs⟩,minimal⟩ := Nat.findX initial
  by_cases hm1 : m=1
  · subst m; exact ⟨x,by simpa using hx,hxs⟩
  have hm : 1 < m := by omega
  have hp0 : (0:ℤ) < p := by exact_mod_cast hp.pos
  have hm0' : (0:ℤ) < m := by exact_mod_cast hm0
  have preserve {d : ℕ} (hd : 0 < d) (hdp : d < p) {r y : Quaternion ℤ}
      (hy : x*r = (d:ℤ) • y) : red p y ∈ S := by
    have hd0 : (d:ZMod p)≠0 := fun hh =>
      have hh' := (ZMod.natCast_eq_zero_iff _ _).mp hh
      (Nat.not_dvd_of_pos_of_lt hd hdp) hh'
    have hs := hS _ hxs (red p r)
    rw [←map_mul,hy,red_smul] at hs
    have := hSc ((d:ZMod p)⁻¹) _ hs
    simpa [smul_smul,hd0] using this
  exfalso
  by_cases he : Even m
  · obtain ⟨u,hu⟩ := he
    have hx2 : Even (normSq x) := by rw [hx]; exact (by exact_mod_cast (show Even m from ⟨u,hu⟩) : Even (m:ℤ)).mul_right _
    obtain ⟨r,hr,hr0⟩ := even_descent x hx2
    obtain ⟨y,hy⟩ := (div_iff 2 _).mp hr0
    have hnorm := congrArg normSq hy
    rw [map_mul,hx,hr,norm_smul] at hnorm
    have hu' : (m:ℤ)=u+u := by exact_mod_cast hu
    refine minimal u (by omega) ⟨by omega,by omega,y,?_,preserve (d:=2) (by decide) (by omega) hy⟩
    norm_num at hnorm
    nlinarith [congrArg (fun k:ℤ => k*p) hu']
  · have hmOdd := Nat.not_even_iff_odd.mp he
    letI : NeZero m := ⟨hm0.ne'⟩
    let r := lift m (red m x)
    have hr : red m r = red m x := red_lift m _
    have hm_norm : ((normSq x:ℤ):ZMod m)=0 := by simp [hx]
    have hd : (m:ℤ) ∣ normSq r := (ZMod.intCast_zmod_eq_zero_iff_dvd _ _).mp (by
      rw [red_norm,hr,←red_norm]; exact hm_norm)
    obtain ⟨u,hu⟩ := hd
    have hr0 : r≠0 := by
      intro hz
      have hz' : red m x=0 := by rw [←hr,hz,map_zero]
      obtain ⟨w,hw⟩ := (div_iff m x).mp hz'
      rw [hw,norm_smul] at hx
      have hdiv : (m:ℤ) ∣ p := ⟨normSq w,by
        apply mul_left_cancel₀ hm0'.ne' (b := (p:ℤ))
        nlinarith [hx]⟩
      have hdvd : m ∣ p := by exact_mod_cast hdiv
      rcases (Nat.dvd_prime hp).mp hdvd with ee|ee <;> omega
    have hupos : 0 < u := pos_of_mul_pos_right (hu ▸ (normSq_nonneg (a:=r)).lt_of_ne' (normSq_ne_zero.mpr hr0)) hm0'.le
    have hless := norm_lift_lt hmOdd (red m x)
    change normSq r < (m:ℤ)^2 at hless
    rw [hu,sq] at hless
    have huLt := lt_of_mul_lt_mul_left hless hm0'.le
    have hz : red m (x*star r)=0 := by
      rw [map_mul,red_star,hr,self_mul_star,←red_norm,hm_norm,coe_zero]
    obtain ⟨y,hy⟩ := (div_iff m _).mp hz
    have hnorm := congrArg normSq hy
    rw [map_mul,normSq_star,norm_smul,hx,hu] at hnorm
    refine minimal u.toNat (by omega) ⟨by omega,by omega,y,?_,preserve hm0 hmp hy⟩
    rw [Int.toNat_of_nonneg hupos.le]
    apply mul_left_cancel₀ (pow_ne_zero 2 hm0'.ne') (b := normSq y)
    linear_combination -hnorm


end TunnellQuaternion

/- Norm-prime right divisors parameterized by the projective line at an odd prime. -/

namespace TunnellQuaternion

open Matrix Quaternion

variable {p : ℕ} [Fact p.Prime]

structure Model (p : ℕ) where
  f : Quaternion (ZMod p) ≃+* M2 (ZMod p)
  det (x) : (f x).det=normSq x
  trace (x) : (f x).trace=2*x.re
  bar (x) : f (star x) = (f x).adjugate
  smul (t : ZMod p) (x) : f (t • x)=t • f x

noncomputable def localModel (hp : p≠2) : Model p := Classical.choice <| by
  classical
  obtain ⟨a,b,hab,h2⟩ := exists_splitting p hp
  refine ⟨?_⟩
  exact ⟨RingEquiv.ofBijective (splitHom a b hab) (split_iso a b hab h2),split_det a b hab,
    split_trace a b hab,split_star a b hab,fun t x => by
      change matrixOf a b (t • x) = t • matrixOf a b x
      ext i j; fin_cases i <;> fin_cases j <;> simp [matrixOf] <;> ring⟩

variable (M : Model p)

def residue : Quaternion ℤ →+* M2 (ZMod p) := M.f.toRingHom.comp (red p)

lemma residue_zero (x : Quaternion ℤ) : residue M x = 0 ↔ red p x = 0 :=
  M.f.map_eq_zero_iff

lemma residue_star (x : Quaternion ℤ) : residue M (star x) = (residue M x).adjugate := by
  change M.f (red p (star x)) = _
  rw [red_star,M.bar]
  rfl

lemma residue_det (x : Quaternion ℤ) : (residue M x).det = (normSq x : ℤ) :=
  (M.det _).trans (red_norm p x).symm

lemma norm_prime_nonzero {x : Quaternion ℤ} (hx : normSq x = p) : residue M x ≠ 0 := by
  intro h
  obtain ⟨v,hv⟩ := (div_iff p x).mp ((residue_zero M x).mp h)
  have pp := Fact.out (p:=p.Prime)
  have hh := congrArg normSq hv
  rw [hx,norm_smul,pow_two,mul_assoc] at hh
  have eq := mul_left_cancel₀ (by exact_mod_cast pp.ne_zero : (p:ℤ)≠0)
    (show (p:ℤ)*1=p*((p:ℤ)*normSq v) by simpa using hh)
  have hd : (p:ℤ) ∣ 1 := ⟨_,eq⟩
  have hdn : p ∣ 1 := by exact_mod_cast hd
  exact pp.not_dvd_one hdn

lemma exists_at_line (hp : p≠2) (l : Option (ZMod p)) :
    ∃ x : Quaternion ℤ, normSq x = p ∧ inLine l (residue M x) := by
  let S := {a : Quaternion (ZMod p) | inLine l (M.f a)}
  apply find_generator Fact.out hp S
  · intro a ha b; change inLine l (M.f (a*b)); rw [map_mul]; exact line_mul ha _
  · intro r a ha; change inLine l (M.f (r • a)); rw [M.smul]; exact line_smul ha _
  · intro a ha; rw [←M.det]; exact det_line ha
  · let B : M2 (ZMod p) := vecMulVec (direction l) ![1,0]
    refine ⟨M.f.symm B,?_,?_⟩
    · change inLine l (M.f (M.f.symm B))
      rw [M.f.apply_symm_apply]
      cases l <;> intro j <;> fin_cases j <;> simp [B,vecMulVec,direction]
    · intro h
      have := congrArg M.f h
      rw [M.f.apply_symm_apply,map_zero] at this
      cases l with
      | none => simpa [B,vecMulVec,direction] using congrArg (fun m:M2 (ZMod p) => m 1 0) this
      | some r => simpa [B,vecMulVec,direction] using congrArg (fun m:M2 (ZMod p) => m 0 0) this

lemma scalar_cancel (d : ℤ) (hd : d≠0) {x y : Quaternion ℤ} (h : d • x = d • y) : x=y := by
  apply QuaternionAlgebra.ext
  all_goals
    first
    | exact mul_left_cancel₀ hd (congrArg (fun x:Quaternion ℤ => x.re) h)
    | exact mul_left_cancel₀ hd (congrArg (fun x:Quaternion ℤ => x.imI) h)
    | exact mul_left_cancel₀ hd (congrArg (fun x:Quaternion ℤ => x.imJ) h)
    | exact mul_left_cancel₀ hd (congrArg (fun x:Quaternion ℤ => x.imK) h)

lemma divide_left {q w : Quaternion ℤ} (hq : normSq q=p) {l : Option (ZMod p)}
    (hl : inLine l (residue M q)) (hw : inLine l (residue M w)) :
    ∃ x, w=q*x := by
  have hz := (adj_mul_zero_iff (norm_prime_nonzero M hq) hl (residue M w)).mpr hw
  rw [←residue_star,←map_mul,residue_zero] at hz
  obtain ⟨x,hx⟩ := (div_iff p _).mp hz
  refine ⟨x,?_⟩
  apply scalar_cancel (p:ℤ) (by exact_mod_cast (Fact.out : p.Prime).ne_zero)
  have he := congrArg (q*·) hx
  simpa only [←mul_assoc,self_mul_star,hq,coe_mul_eq_smul,Algebra.mul_smul_comm] using he

lemma same_line_iff {q w : Quaternion ℤ} (hq : normSq q=p) (hw : normSq w=p)
    {l : Option (ZMod p)} (hl : inLine l (residue M q)) :
    inLine l (residue M w) ↔ ∃ u : Quaternion ℤ, normSq u=1 ∧ w=q*u := by
  constructor
  · intro hh
    obtain ⟨u,hu⟩ := divide_left M hq hl hh
    have h := hw
    rw [hu,map_mul,hq] at h
    refine ⟨u,?_,hu⟩
    apply mul_left_cancel₀ (by exact_mod_cast (Fact.out:p.Prime).ne_zero : (p:ℤ)≠0)
    simpa using h
  · rintro ⟨u,_,rfl⟩; rw [map_mul]; exact line_mul hl _

lemma invariant_criterion {l : Option (ZMod p)} {A : M2 (ZMod p)} (hn : A ≠ 0) (hl : inLine l A)
    (W : M2 (ZMod p)) : A.adjugate*W*A=0 ↔ TunnellEigenlines.invariant W l := by
  rw [mul_assoc,adj_mul_zero_iff hn hl]
  obtain ⟨i,hi⟩ : ∃ i, rowOf l A i ≠ 0 := by
    by_contra! hh
    have hr : rowOf l A=0 := funext hh
    have h := line_factored hl
    rw [hr,vecMulVec_zero] at h
    exact hn h.symm
  cases l with
  | none =>
    change ∀ j, A 0 j=0 at hl
    change A 1 i≠0 at hi
    change (∀ j, (W*A) 0 j=0) ↔ W 0 1=0
    simp only [Matrix.mul_apply,Fin.sum_univ_two,hl,mul_zero,zero_add]
    exact ⟨fun h => (mul_eq_zero.mp (h i)).resolve_right hi,by rintro h j; simp [h]⟩
  | some a =>
    change ∀ j, A 1 j=a*A 0 j at hl
    change A 0 i≠0 at hi
    change (∀ j, (W*A) 1 j = a*(W*A) 0 j) ↔ W 1 0+W 1 1*a=a*(W 0 0+W 0 1*a)
    simp only [Matrix.mul_apply,Fin.sum_univ_two,hl,←mul_assoc,←add_mul]
    exact ⟨fun h => mul_right_cancel₀ hi (by simpa [mul_assoc] using h i),
      fun h j => by rw [h,mul_assoc]⟩

end TunnellQuaternion

/- Eight integral quaternions represent each projective line at an odd prime. -/

namespace TunnellQuaternion

open Finset Quaternion

variable {p : ℕ} [Fact p.Prime] (M : Model p)

lemma unique_class {q : QInt} (hq : normSq q=p) : ∃! l, inLine l (residue M q) := by
  apply line_unique _ (norm_prime_nonzero M hq)
  rw [residue_det,hq]
  simp

noncomputable def classOf (q : QInt) : Option (ZMod p) :=
  if h : normSq q = p then (unique_class M h).exists.choose else none

lemma class_eq_iff {q : QInt} (hq : normSq q=p) (l : Option (ZMod p)) :
    classOf M q=l ↔ inLine l (residue M q) := by
  rw [classOf,dif_pos hq]
  have h := (unique_class M hq).exists.choose_spec
  constructor
  · rintro rfl
    exact h
  · exact fun h' => (unique_class M hq).unique h h'

lemma quatShell_one_card : (quatShell 1).card = 8 := by decide

lemma fiber_class_card (hp : p≠2) (l : Option (ZMod p)) :
    ((quatShell p).filter (fun q => classOf M q = l)).card = 8 := by
  classical
  obtain ⟨q,hq,hl⟩ := exists_at_line M hp l
  rw [←quatShell_one_card]
  symm
  apply card_nbij (fun u => q*u)
  · intro u hu
    have hu' := mem_quatShell.mp hu
    have hqu : normSq (q*u)=p := by rw [map_mul,hq,hu']; simp
    refine mem_filter.mpr ⟨mem_quatShell.mpr hqu,(class_eq_iff M hqu l).mpr ?_⟩
    rw [map_mul]
    exact line_mul hl _
  · intro u hu v hv h
    apply scalar_cancel (p:ℤ) (by exact_mod_cast (Fact.out:p.Prime).ne_zero)
    have he := congrArg (star q * ·) h
    simpa only [←mul_assoc,star_mul_self,hq,coe_mul_eq_smul] using he
  · intro w hw
    obtain ⟨hn,he⟩ := mem_filter.mp hw
    have hn' := mem_quatShell.mp hn
    obtain ⟨u,hu,hw⟩ := (same_line_iff M hq hn' hl).mp ((class_eq_iff M hn' l).mp he)
    exact ⟨u,mem_quatShell.mpr hu,hw.symm⟩

lemma card_class_mem (hp : p≠2) (L : Finset (Option (ZMod p))) :
    ((quatShell p).filter (fun q => classOf M q ∈ L)).card = 8*L.card := by
  classical
  have h := Finset.sum_fiberwise_eq_sum_filter (quatShell p) L (classOf M) (fun _ => (1:ℕ))
  simp only [sum_const,nsmul_eq_mul,mul_one] at h
  simpa [fiber_class_card M hp,mul_comm] using h.symm

end TunnellQuaternion

/- Integral inverse images of a rotation by a prime-norm quaternion. -/

namespace TunnellQuaternion
open Quaternion Finset TunnellShell


def act (q x : QInt) : QInt := q*x*star q

lemma norm_act (q x : QInt) : Quaternion.normSq (act q x)=Quaternion.normSq q^2*Quaternion.normSq x := by
  simp only [act,map_mul,Quaternion.normSq_star]
  ring

lemma re_act (q x : QInt) : (act q x).re=Quaternion.normSq q*x.re := by
  simp only [act,Quaternion.normSq_def',Quaternion.re_mul,Quaternion.imI_mul,Quaternion.imJ_mul,
    Quaternion.imK_mul,Quaternion.re_star,Quaternion.imI_star,Quaternion.imJ_star,Quaternion.imK_star]
  ring

lemma act_smul (q : QInt) (t : ℤ) (x : QInt) : act q (t • x)=t • act q x := by
  simp only [act,Algebra.mul_smul_comm,smul_mul_assoc]

lemma act_dual (q x : QInt) : act (star q) (act q x) = (Quaternion.normSq q)^2 • x := by
  unfold act
  rw [star_star,show star q*(q*x*star q)*q=(star q*q)*x*(star q*q) by simp [mul_assoc],
    star_mul_self,coe_mul_eq_smul,mul_coe_eq_smul,smul_smul,pow_two]

lemma act_injective {q : QInt} (hq : Quaternion.normSq q ≠ 0) : Function.Injective (act q) := by
  intro x y h
  have := congrArg (act (star q)) h
  simp only [act_dual] at this
  exact scalar_cancel _ (pow_ne_zero 2 hq) this

lemma pure_injective : Function.Injective pure := fun _ _ h => congrArg vec h

lemma pure_vec_of_re {x : QInt} (hx : x.re=0) : pure (vec x)=x := by
  cases x
  simp_all [pure,vec]
  rfl

lemma pure_rotate (q : QInt) (v : Triple) : pure (rotate q v) = act q (pure v) :=
  pure_vec_of_re (x:=act q (pure v)) (by rw [re_act]; simp [pure])

lemma pure_smul (t : ℤ) (v : Triple) : pure (t • v)=t • pure v := by
  apply QuaternionAlgebra.ext
  · exact (Int.mul_zero t).symm
  all_goals rfl

lemma norm_pure (v : Triple) : Quaternion.normSq (pure v)=TunnellShell.normSq v := by
  rw [Quaternion.normSq_def']
  change (0:ℤ)^2+v.1^2+v.2.1^2+v.2.2^2=_
  simp [TunnellShell.normSq]

variable {p : ℕ} [Fact p.Prime] (M : Model p)

lemma prime_ne_zero : (p:ℤ)≠0 := by exact_mod_cast (Fact.out : p.Prime).ne_zero

lemma residue_trace (w : QInt) : (residue M w).trace=2*(w.re:ZMod p) :=
  M.trace _

lemma residue_pure_zero (v : Triple) :
    residue M (pure v)=0 ↔ TunnellShellFibers.divisible p v := by
  rw [residue_zero]
  constructor
  · intro h
    refine ⟨(ZMod.intCast_zmod_eq_zero_iff_dvd _ _).mp (congrArg QuaternionAlgebra.imI h),
      (ZMod.intCast_zmod_eq_zero_iff_dvd _ _).mp (congrArg QuaternionAlgebra.imJ h),
      (ZMod.intCast_zmod_eq_zero_iff_dvd _ _).mp (congrArg QuaternionAlgebra.imK h)⟩
  · rintro ⟨a,b,c⟩
    apply QuaternionAlgebra.ext
    · exact Int.cast_zero
    · exact (ZMod.intCast_zmod_eq_zero_iff_dvd _ _).mpr a
    · exact (ZMod.intCast_zmod_eq_zero_iff_dvd _ _).mpr b
    · exact (ZMod.intCast_zmod_eq_zero_iff_dvd _ _).mpr c

lemma solve_primitive {q w : QInt} {N : ℤ} (hq : Quaternion.normSq q=p)
    (hw : Quaternion.normSq w=(p:ℤ)^2*N) (hre : w.re=0) (hpw : residue M w≠0)
    {l : Option (ZMod p)} (hl : inLine l (residue M q)) :
    (∃ v, act q v=w) ↔ inLine l (residue M w) := by
  constructor
  · rintro ⟨v,rfl⟩
    simp only [act,map_mul]
    exact line_mul (line_mul hl _) _
  · intro h
    obtain ⟨x,hx⟩ := divide_left M hq hl h
    have hn := hw
    rw [hx,map_mul,hq,pow_two,mul_assoc] at hn
    have hnx := mul_left_cancel₀ (prime_ne_zero (p:=p)) hn
    have had : (residue M q).det=0 := by rw [residue_det,hq]; simp
    have hbd : (residue M x).det=0 := by rw [residue_det,hnx]; simp
    have hpq : residue M q*residue M x=residue M w := by rw [hx,map_mul]
    have htr : (residue M w).trace=0 := by rw [residue_trace,hre]; simp
    have hb := reversed_product_zero had hbd (hpq ▸ hpw) (hpq ▸ htr)
    rw [←map_mul,residue_zero] at hb
    obtain ⟨v,hv⟩ := (div_iff p _).mp hb
    have he := congrArg (· * star q) hv
    simp only [mul_assoc,self_mul_star,hq,mul_coe_eq_smul,smul_mul_assoc] at he
    have hxx := scalar_cancel _ (prime_ne_zero (p:=p)) he
    exact ⟨v,by rw [hx,hxx]; simp [act,mul_assoc]⟩

lemma solve_scaled {q : QInt} (hq : Quaternion.normSq q=p) {l : Option (ZMod p)}
    (hl : inLine l (residue M q)) (w : QInt) :
    (∃ v, act q v=(p:ℤ) • w) ↔ TunnellEigenlines.invariant (residue M w) l := by
  have ha : (∃ v, act q v=(p:ℤ) • w) ↔ red p (act (star q) w)=0 := by
    rw [div_iff]
    constructor
    · rintro ⟨v,hv⟩
      have he := congrArg (act (star q)) hv
      rw [act_dual,act_smul,hq,pow_two,←smul_smul] at he
      exact ⟨v,(scalar_cancel _ (prime_ne_zero (p:=p)) he).symm⟩
    · rintro ⟨v,hv⟩
      have he := congrArg (act q) hv
      rw [show act q (act (star q) w)=act (star (star q)) (act (star q) w) by rw [star_star],
        act_dual,Quaternion.normSq_star,hq,pow_two,←smul_smul,act_smul] at he
      exact ⟨v,(scalar_cancel _ (prime_ne_zero (p:=p)) he).symm⟩
  rw [ha,←residue_zero M]
  simp only [act,map_mul,star_star,residue_star]
  exact invariant_criterion (norm_prime_nonzero M hq) hl _

omit [Fact p.Prime] in
lemma rotate_mem {N : ℕ} {q : QInt} (hq : Quaternion.normSq q=p) {v : Triple} (hv : v∈shell N) :
    rotate q v ∈ shell (p^2*N) := by
  rw [mem_shell,←norm_pure,pure_rotate,norm_act,hq,norm_pure,mem_shell.mp hv]; push_cast; rfl

lemma rotate_injective {q : QInt} (hq : Quaternion.normSq q=p) : Function.Injective (rotate q) := by
  intro x y h
  have he := congrArg pure h
  simp only [pure_rotate] at he
  exact pure_injective (act_injective (hq ▸ prime_ne_zero) he)

lemma rotate_lift {N : ℕ} {q : QInt} (hq : Quaternion.normSq q=p) {w : Triple}
    (hw : w ∈ shell (p^2*N)) (h : ∃ u, act q u=pure w) : ∃ v∈shell N, rotate q v=w := by
  obtain ⟨u,hu⟩ := h
  have hr := congrArg QuaternionAlgebra.re hu
  rw [re_act,hq] at hr
  have hur := (mul_eq_zero.mp (show (p:ℤ)*u.re=0 from hr)).resolve_left prime_ne_zero
  have hn := congrArg Quaternion.normSq hu
  rw [norm_act,hq,norm_pure,mem_shell.mp hw] at hn
  push_cast at hn
  refine ⟨vec u,mem_shell.mpr ?_,pure_injective ?_⟩
  · rw [←norm_pure,pure_vec_of_re hur]
    exact mul_left_cancel₀ (pow_ne_zero 2 prime_ne_zero) hn
  · rw [pure_rotate,pure_vec_of_re hur,hu]

open scoped Classical in
lemma count_rotation {N : ℕ} {w : Triple} (hw : w ∈ shell (p^2*N)) :
    TunnellShellFibers.count (quatShell p ×ˢ shell N) (fun x => rotate x.1 x.2) w =
      ((quatShell p).filter (fun q => ∃ u, act q u=pure w)).card := by
  classical
  apply Finset.card_bij (fun x _ => x.1)
  · intro ⟨q,v⟩ hx
    obtain ⟨h,hv⟩ := mem_filter.mp hx
    exact mem_filter.mpr ⟨(mem_product.mp h).1,⟨pure v,by simp only [←pure_rotate,hv]⟩⟩
  · intro ⟨q,v⟩ h ⟨q',v'⟩ h' he; dsimp at he; subst q'
    have hv := (mem_filter.mp h).2
    have hv' := (mem_filter.mp h').2
    congr 1
    exact rotate_injective (mem_quatShell.mp (mem_product.mp (mem_filter.mp h).1).1) (hv.trans hv'.symm)
  · intro q hq
    obtain ⟨hqn,hu⟩ := mem_filter.mp hq
    obtain ⟨v,hv,hvw⟩ := rotate_lift (mem_quatShell.mp hqn) hw hu
    exact ⟨(q,v),mem_filter.mpr ⟨mem_product.mpr ⟨hqn,hv⟩,hvw⟩,rfl⟩

end TunnellQuaternion

/- Counting quaternion rotations on ternary shells. -/

namespace TunnellQuaternion

open Finset TunnellShell TunnellShellFibers
open scoped Classical

variable {p : ℕ} [Fact p.Prime] (M : Model p)
include M

lemma primitive_count (hp : p≠2) {N : ℕ} {w : Triple} (hw : w∈shell (p^2*N)) (hd : ¬divisible p w) :
    count (quatShell p ×ˢ shell N) (fun x => rotate x.1 x.2) w = 8 := by
  rw [count_rotation hw]
  have hnorm : Quaternion.normSq (pure w)=(p:ℤ)^2*N := by rw [norm_pure,mem_shell.mp hw]; push_cast; rfl
  have hn : residue M (pure w)≠0 := fun h => hd ((residue_pure_zero M w).mp h)
  have hdet : (residue M (pure w)).det=0 := by rw [residue_det,hnorm]; simp
  obtain ⟨l,hl,hu⟩ := line_unique (residue M (pure w)) hn hdet
  rw [← fiber_class_card M hp l]
  congr 1
  apply filter_congr
  intro q hq
  have hqn := mem_quatShell.mp hq
  have hlq := (class_eq_iff M hqn _).mp (rfl : classOf M q=classOf M q)
  rw [solve_primitive M hqn hnorm rfl hn hlq]
  exact ⟨fun hh => hu _ hh, fun hh => hh ▸ hl⟩

lemma scaled_count (hp : p≠2) {N : ℕ} {v : Triple} (hv : v∈shell N) :
    (count (quatShell p ×ˢ shell N) (fun x => rotate x.1 x.2) ((p:ℤ) • v):ℤ) =
      8*(if divisible p v then (p:ℤ)+1 else 1+quadraticChar (ZMod p) (-(N:ZMod p))) := by
  have hw : (p:ℤ) • v ∈ shell (p^2*N) := by
    rw [mem_shell,TunnellShellFibers.norm_smul,mem_shell.mp hv]; push_cast; rfl
  rw [count_rotation hw]
  let W := residue M (pure v)
  let S := univ.filter (TunnellEigenlines.invariant W)
  have he : (quatShell p).filter (fun q => ∃ u, act q u=pure ((p:ℤ) • v)) =
      (quatShell p).filter (fun q => classOf M q∈S) := by
    apply filter_congr
    intro q hq
    have hqn := mem_quatShell.mp hq
    have hlq := (class_eq_iff M hqn _).mp (rfl : classOf M q=classOf M q)
    simp only [pure_smul,solve_scaled M hqn hlq,S,mem_filter,mem_univ,true_and,W]
  rw [he,card_class_mem M hp]
  have htr : W.trace=0 := by
    change (residue M (pure v)).trace=0
    rw [residue_trace]; simp [pure]
  have hdet : W.det=(N:ZMod p) := by
    change (residue M (pure v)).det=_
    rw [residue_det,norm_pure,mem_shell.mp hv]; simp
  have hc := TunnellEigenlines.card_invariant hp W htr
  have hz : W=0 ↔ divisible p v := residue_pure_zero M v
  simp only [hdet,hz] at hc
  push_cast
  exact congrArg (8*·) hc

omit M in
theorem shell_hecke (hp : p≠2) (N : ℕ) :
    (∑ w ∈ shell (p^2*N), weight w) + quadraticChar (ZMod p) (-(N:ZMod p)) * (∑ v ∈ shell N,weight v) +
      (if p^2∣N then (p:ℤ) * ∑ u ∈ shell (N/p^2),weight u else 0) =
    etaCoeff p * (∑ v ∈ shell N,weight v) := by
  let M := localModel hp
  have hod : Odd p := (Fact.out : p.Prime).odd_of_ne_two hp
  have he := raw_fiber_sum (quatShell p ×ˢ shell N) (fun x => rotate x.1 x.2) weight
    (fun x hx => rotate_mem (mem_quatShell.mp (mem_product.mp hx).1) (mem_product.mp hx).2)
    (weight_smul (by exact_mod_cast hod))
    (fun _ h h' => primitive_count M hp h h')
    (fun _ h => scaled_count M hp h)
  rw [sum_product,sum_comm] at he
  simp_rw [raw_eigenvalue p hod] at he
  rw [←mul_sum,mul_assoc] at he
  exact mul_left_cancel₀ (by norm_num : (8:ℤ)≠0) he.symm


end TunnellQuaternion

namespace TunnellQuaternion

open Finset TunnellShell UpperHalfPlane

theorem shimura : OMA.R_CongruentNumber_Tunnell_even_R1_H3_R1.H1 := by
  intro p hp m
  letI : Fact p.val.Prime := ⟨p.property⟩
  letI : NeZero p.val := ⟨p.property.ne_zero⟩
  have hj := TunnellArithmetic.eta_eq_mass
    (TunnellTruncated.cubic_congruence (fun N => TunnellCubicFinite.cubic _ N))
    (TunnellTruncated.theta_congruence (fun _ N => TunnellBalanced.balanced _ N)) p.val
  have ha := hj.trans (TunnellSplitMass.trace_mass_odd p hp)
  change etaCoeff p.val = _ at ha
  have hc : (p.val^2).Coprime 2 := (p.property.odd_of_ne_two hp).coprime_two_right.pow_left 2
  have hχ : quadraticChar (ZMod p.val) (-(↑(2*m:ℕ) : ZMod p.val)) = jacobiSym (-2*(m:ℤ)) p.val := by
    rw [← jacobiSym.legendreSym.to_jacobiSym,legendreSym]
    push_cast
    rw [neg_mul]
  let B (k : ℕ) := (qExpansion 1 (fun z : UpperHalfPlane => ModularForm.eta (8*(z:ℂ))*
    ModularForm.eta (16*(z:ℂ))*jacobiTheta (8*(z:ℂ)))).coeff k
  change B _ + _ * B _ + (if _ then _ * B _ else _) = _ * B _
  have hs := shell_hecke hp (2*m)
  rw [show p.val^2*(2*m) = 2*(p.val^2*m) by ring,hχ,ha] at hs
  have cast_to (z : ℤ) : Int.castRingHom ℂ z = (z:ℂ) := rfl
  have hb (k : ℕ) : (((∑ v ∈ shell (2*k),weight v):ℤ):ℂ) = 12*B k := by
    simpa only [Int.cast_sum,B] using sum_weight_eq_fourier k
  by_cases h : p.val^2 ∣ m
  · rw [if_pos (hc.dvd_mul_left.mpr h),Nat.mul_div_assoc 2 h] at hs
    rw [if_pos h]
    have H := congrArg (Int.castRingHom ℂ) hs
    simp only [Int.cast_add,Int.cast_mul,cast_to,Int.cast_natCast,hb] at H
    linear_combination (norm := ring_nf) H/12
  · rw [if_neg (fun he => h (hc.dvd_mul_left.mp he))] at hs
    rw [if_neg h]
    have H := congrArg (Int.castRingHom ℂ) hs
    simp only [Int.cast_add,Int.cast_mul,Int.cast_zero,cast_to,hb] at H
    linear_combination (norm := ring_nf) H/12

end TunnellQuaternion

theorem OMA.solution : OMA.R_CongruentNumber_Tunnell_even_R1_H3_R1.H1 := TunnellQuaternion.shimura
end TunnellEvenInputShimura
#print axioms TunnellEvenInputShimura.OMA.solution
