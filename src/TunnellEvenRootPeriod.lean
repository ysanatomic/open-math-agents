import TunnellEvenRankReduction
import Mathlib

namespace TunnellEvenRootPeriod

/-!
# Rationality of the period-normalized critical values of even congruent-number twists

Primary Gaussian integers give the Fourier coefficients and Euler factors of the conductor-32
eta product. Fourier inversion for the primitive twist character expresses each central value
as a sum of integrals to rational cusps. Translation and Fricke inversion identify the paired
integrals with integral multiples of the value at zero. Jacobi's four-square theorem and theta
product identities identify this last integral with one quarter of the real elliptic period.
-/

section

/-
# The base curve and its eta product

The coefficients of η(4z)²η(8z)² are sums of primary Gaussian integers of
fixed norm. Finite Gaussian binomial identities prove the theta expansion,
including Jacobi's cubic identity by differentiation. Coprime factorization
and prime-power recurrences on the Gaussian integers give the Hecke relations.
For split primes the quartic Jacobi sum has norm p, and the rational subgroup
of order eight determines the primary generator giving the Frobenius trace.
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

lemma square_mod_two (a : ℤ) : a^2 % 2 = a % 2 := by
  rw [sq, Int.mul_emod]
  rcases (show a%2 = 0 ∨ a%2 = 1 by omega) with h | h <;> rw [h] <;> decide

lemma exists_primary_associate (z : GaussianInt) (ho : z.norm % 2 = 1) :
    ∃ w : GaussianInt, Primary w ∧ Associated w z := by
  rw [norm_sq, Int.add_emod, square_mod_two, square_mod_two] at ho
  have orient (v : GaussianInt) (hi : v.im % 2 = 0) (hr : v.re % 2 = 1) :
      ∃ w : GaussianInt, Primary w ∧ Associated w v := by
    by_cases hs : (v.re + v.im) % 4 = 1
    · exact ⟨v, (primary_iff _).mpr ⟨hi,hs⟩, Associated.refl _⟩
    · refine ⟨-v, (primary_iff _).mpr ?_, ?_⟩
      · change (-v.im)%2 = 0 ∧ (-v.re + -v.im)%4 = 1
        omega
      · simpa using associated_mul_unit_left v (-1) (isUnit_neg.mpr isUnit_one)
  by_cases he : z.im % 2 = 0
  · exact orient _ he (by omega)
  · let i : GaussianInt := ⟨0,1⟩
    have hu : IsUnit i := (Zsqrtd.norm_eq_one_iff' (by decide : (-1:ℤ) ≤ 0) i).mp (by decide)
    obtain ⟨w,hw,hwz⟩ := orient (z*i)
      (by change (z.re * 1 + z.im * 0)%2 = 0; omega)
      (by change (z.re * 0 + -1*z.im*1)%2 = 1; omega)
    exact ⟨w,hw,hwz.trans (associated_mul_unit_left z i hu)⟩

lemma primary_odd_norm {z : GaussianInt} (h : Primary z) : z.norm % 2 = 1 := by
  rw [norm_sq, Int.add_emod, square_mod_two, square_mod_two]
  have := (primary_iff _).mp h
  omega

lemma coprime_of_norms {z w : GaussianInt} (hc : Nat.Coprime z.norm.natAbs w.norm.natAbs) :
    IsCoprime z w := by
  have h := hc.isCoprime.map (Int.castRingHom GaussianInt)
  have hz : z ∣ (z.norm.natAbs : GaussianInt) := by
    rw [GaussianInt.natCast_natAbs_norm, Zsqrtd.norm_eq_mul_conj]
    exact dvd_mul_right _ _
  have hw : w ∣ (w.norm.natAbs : GaussianInt) := by
    rw [GaussianInt.natCast_natAbs_norm, Zsqrtd.norm_eq_mul_conj]
    exact dvd_mul_right _ _
  apply IsCoprime.of_isCoprime_of_dvd_right _ hw
  apply IsCoprime.of_isCoprime_of_dvd_left _ hz
  simpa using h

lemma norm_dvd_sq {z : GaussianInt} {m : ℕ} (h : z ∣ (m : GaussianInt)) :
    z.norm.natAbs ∣ m^2 := by
  obtain ⟨w,hw⟩ := h
  refine ⟨w.norm.natAbs, ?_⟩
  have he := congrArg (fun t : GaussianInt => t.norm.natAbs) hw
  simpa [sq, Int.natAbs_mul] using he

lemma scalar_split {a b m n : ℕ} (h : m.Coprime n) (ha : a ∣ m^2) (hb : b ∣ n^2)
    (he : a*b = m*n) : a = m := by
  apply Nat.dvd_antisymm
  · apply ((h.pow_left 2).coprime_dvd_left ha).dvd_of_dvd_mul_right
    rw [← he]
    exact dvd_mul_right _ _
  · apply ((h.pow_right 2).coprime_dvd_right hb).dvd_of_dvd_mul_right
    rw [he]
    exact dvd_mul_right _ _

lemma primary_factor {z : GaussianInt} {m n : ℕ} (hz : Primary z) (hc : m.Coprime n)
    (hn : z.norm.natAbs = m*n) :
    ∃ v w : GaussianInt, Primary v ∧ Primary w ∧ v.norm.natAbs = m ∧ w.norm.natAbs = n ∧ z = v*w := by
  have hd : z ∣ (m : GaussianInt)*(n : GaussianInt) := by
    rw [← Nat.cast_mul, ← hn, GaussianInt.natCast_natAbs_norm, Zsqrtd.norm_eq_mul_conj]
    exact dvd_mul_right _ _
  obtain ⟨v,w,hv,hw,rfl⟩ := exists_dvd_and_dvd_of_dvd_mul hd
  simp only [Zsqrtd.norm_mul, Int.natAbs_mul] at hn
  have hvm := scalar_split hc (norm_dvd_sq hv) (norm_dvd_sq hw) hn
  have hwn := scalar_split hc.symm (norm_dvd_sq hw) (norm_dvd_sq hv)
    (by simpa only [mul_comm] using hn)
  have ho := primary_odd_norm hz
  rw [Zsqrtd.norm_mul, Int.mul_emod] at ho
  have hvodd : v.norm % 2 = 1 := by
    by_contra he
    have e : v.norm % 2 = 0 := by omega
    simp [e] at ho
  obtain ⟨t,ht,htv⟩ := exists_primary_associate v hvodd
  have htvn := Zsqrtd.norm_eq_of_associated (by decide : (-1:ℤ) ≤ 0) htv
  obtain ⟨u,hu⟩ := htv
  have he : v*w = t*(u*w) := by rw [← hu, mul_assoc]
  have hwu := (primary_mul_iff ht).mp (he ▸ hz)
  have hun := (Zsqrtd.norm_eq_one_iff' (by decide : (-1:ℤ) ≤ 0) (u:GaussianInt)).mpr u.isUnit
  refine ⟨t, u*w, ht, hwu, by simpa only [htvn] using hvm, ?_, he⟩
  simpa only [Zsqrtd.norm_mul, hun, one_mul] using hwn

lemma primary_factor_unique {v w v' w' : GaussianInt} (hv : Primary v) (hv' : Primary v')
    (hc : Nat.Coprime v.norm.natAbs w.norm.natAbs) (hvm : v.norm.natAbs = v'.norm.natAbs)
    (hwn : w.norm.natAbs = w'.norm.natAbs) (he : v*w = v'*w') : v = v' ∧ w = w' := by
  have h₁ : v ∣ v' := (coprime_of_norms (hwn ▸ hc)).dvd_of_dvd_mul_right
    (he ▸ dvd_mul_right v w)
  have h₂ : v' ∣ v := (coprime_of_norms (hvm ▸ hc)).dvd_of_dvd_mul_right
    (he.symm ▸ dvd_mul_right v' w')
  have h := primary_associated_eq hv hv' (associated_of_dvd_dvd h₁ h₂)
  subst v'
  have h0 : v ≠ 0 := by intro e; simp [e] at hv; have := primary_odd_norm hv; simp at this
  exact ⟨rfl,mul_left_cancel₀ h0 he⟩

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

theorem mass_mul {m n : ℕ} (hc : m.Coprime n) : mass (m*n) = mass m * mass n := by
  classical
  unfold mass
  simp only [Finset.sum_mul, Finset.mul_sum]
  symm
  rw [← Finset.sum_product']
  apply Finset.sum_bij (fun p _ => p.1*p.2)
  · rintro ⟨v,w⟩ hvw
    obtain ⟨hv,hw⟩ := Finset.mem_product.mp hvw
    obtain ⟨hvp,hvn⟩ := mem_shell.mp hv
    obtain ⟨hwp,hwn⟩ := mem_shell.mp hw
    exact mem_shell.mpr ⟨(primary_mul_iff hvp).mpr hwp, by simp [hvn,hwn,Int.natAbs_mul,mul_comm]⟩
  · rintro ⟨v,w⟩ hvw ⟨v',w'⟩ hvw' he
    simp only [Finset.mem_product,mem_shell] at hvw hvw'
    have h := primary_factor_unique hvw.1.1 hvw'.1.1 (by simpa only [hvw.1.2,hvw.2.2] using hc.symm)
      (hvw.1.2.trans hvw'.1.2.symm) (hvw.2.2.trans hvw'.2.2.symm) he
    exact Prod.ext h.1 h.2
  · intro z hz
    obtain ⟨hP, hn⟩ := mem_shell.mp hz
    obtain ⟨v,w,hv,hw,hvm,hwn,he⟩ := primary_factor hP hc.symm (by simpa only [mul_comm] using hn)
    exact ⟨(v,w),Finset.mem_product.mpr ⟨mem_shell.mpr ⟨hv,hvm⟩,mem_shell.mpr ⟨hw,hwn⟩⟩,he.symm⟩
  · intro p _
    exact mul_comm _ _

theorem mass_real (n : ℕ) : (mass n).im = 0 := by
  have hs : star (mass n) = mass n := by
    unfold mass
    rw [star_sum]
    apply Finset.sum_bij (fun z _ => star z)
    · intro z hz
      obtain ⟨hP,hn⟩ := mem_shell.mp hz
      exact mem_shell.mpr ⟨primary_star hP, by simpa using hn⟩
    · intro _ _ _ _ h
      exact star_injective h
    · intro z hz
      obtain ⟨hP,hn⟩ := mem_shell.mp hz
      exact ⟨star z,mem_shell.mpr ⟨primary_star hP,by simpa using hn⟩,star_star _⟩
    · intro _ _; rfl
  have := congrArg Zsqrtd.im hs
  change -(mass n).im = (mass n).im at this
  omega

theorem coefficient_mul {m n : ℕ} (hc : m.Coprime n) :
    (mass (m*n)).re = (mass m).re * (mass n).re := by simp [mass_mul hc,mass_real]

end TunnellGaussian

namespace TunnellGaussian

open GaussianInt Finset

lemma norm_product (z : GaussianInt) : z * star z = (z.norm.natAbs : GaussianInt) := by
  rw [GaussianInt.natCast_natAbs_norm, Zsqrtd.norm_eq_mul_conj]

lemma unit_of_norm_one {z : GaussianInt} (h : z.norm.natAbs = 1) : IsUnit z := by
  apply (Zsqrtd.norm_eq_one_iff' (by decide : (-1 : ℤ) ≤ 0) z).mp
  have h' := GaussianInt.abs_natCast_norm z
  simpa [h] using h'.symm

lemma norm_prime {z : GaussianInt} {p : ℕ} (hp : p.Prime) (h : z.norm.natAbs = p) : Prime z := by
  apply Irreducible.prime
  constructor
  · intro hu
    have hn := (Zsqrtd.norm_eq_one_iff' (by decide : (-1 : ℤ) ≤ 0) z).mpr hu
    simp [hn] at h
    exact hp.ne_one h.symm
  · intro a b hab
    rw [hab, Zsqrtd.norm_mul, Int.natAbs_mul] at h
    rcases hp.eq_one_or_self_of_dvd _ (h ▸ dvd_mul_right _ _) with hh | hh
    · exact Or.inl (unit_of_norm_one hh)
    · exact Or.inr (unit_of_norm_one (Nat.eq_of_mul_eq_mul_left hp.pos (by simpa [hh] using h)))

lemma mem_shell_image {r : GaussianInt} {p n : ℕ} (hr : Primary r) (hrn : r.norm.natAbs = p)
    (hp : 0 < p) (z : GaussianInt) :
    z ∈ (shell n).image (r * ·) ↔ z ∈ shell (p*n) ∧ r ∣ z := by
  constructor
  · intro hz
    obtain ⟨w, hw, rfl⟩ := Finset.mem_image.mp hz
    obtain ⟨hw, hwn⟩ := mem_shell.mp hw
    exact ⟨mem_shell.mpr ⟨(primary_mul_iff hr).mpr hw, by simp [Int.natAbs_mul, hrn, hwn]⟩,
      dvd_mul_right _ _⟩
  · rintro ⟨hz, w, rfl⟩
    obtain ⟨hz, hn⟩ := mem_shell.mp hz
    simp only [Zsqrtd.norm_mul, Int.natAbs_mul, hrn] at hn
    exact Finset.mem_image.mpr ⟨w, mem_shell.mpr ⟨(primary_mul_iff hr).mp hz,
      Nat.eq_of_mul_eq_mul_left hp hn⟩, rfl⟩

lemma shell_sum_image (r : GaussianInt) (hr : r ≠ 0) (n : ℕ) :
    ∑ z ∈ (shell n).image (r * ·), z = r * mass n := by
  rw [Finset.sum_image (by intro a _ b _ h; exact mul_left_cancel₀ hr h)]
  exact (Finset.mul_sum ..).symm

lemma norm_dvd_by_prime {p : ℕ} {r z : GaussianInt} (hr : Prime r) (hrp : r ∣ (p : GaussianInt))
    (hz : p ∣ z.norm.natAbs) : r ∣ z ∨ star r ∣ z := by
  have h : r ∣ z * star z := (norm_product z).symm ▸ hrp.trans (Nat.cast_dvd_cast hz)
  rcases hr.dvd_mul.mp h with h | h
  · exact Or.inl h
  · obtain ⟨a, ha⟩ := h
    right
    exact ⟨star a, by simpa [mul_comm] using congrArg star ha⟩

lemma split_recurrence {r : GaussianInt} {p : ℕ} (hp : p.Prime) (hr : r ∈ shell p)
    (hne : r ≠ star r) (hsm : mass p = r + star r) (k : ℕ) :
    mass (p^(k+2)) = mass p * mass (p^(k+1)) - (p : GaussianInt)*mass (p^k) := by
  classical
  obtain ⟨hP,hn⟩ := mem_shell.mp hr
  have hPs := primary_star hP
  have hns : (star r).norm.natAbs = p := by simpa using hn
  have hprime := norm_prime hp hn
  have hsprime := norm_prime hp hns
  have fact : r * star r = (p : GaussianInt) := by rw [norm_product,hn]
  have hno : ¬star r ∣ r := fun h => hne (primary_associated_eq hPs hP
    (hsprime.associated_of_dvd hprime h)).symm
  let B := (shell (p^(k+1))).image (r * ·)
  let C := (shell (p^(k+1))).image (star r * ·)
  have hmB (z : GaussianInt) : z ∈ B ↔ z ∈ shell (p^(k+2)) ∧ r ∣ z := by
    simpa only [B, pow_succ' p (k+1)] using mem_shell_image hP hn hp.pos z (n := p^(k+1))
  have hmC (z : GaussianInt) : z ∈ C ↔ z ∈ shell (p^(k+2)) ∧ star r ∣ z := by
    simpa only [C, pow_succ' p (k+1)] using mem_shell_image hPs hns hp.pos z (n := p^(k+1))
  have hUnion : B ∪ C = shell (p^(k+2)) := by
    ext z
    rw [mem_union,hmB,hmC]
    constructor
    · rintro (h|h) <;> exact h.1
    · intro hz
      have hnz := (mem_shell.mp hz).2
      rcases norm_dvd_by_prime hprime (fact ▸ dvd_mul_right r (star r)) (z := z)
          (by rw [hnz]; exact dvd_pow_self p (by omega)) with hv | hv
      · exact Or.inl ⟨hz,hv⟩
      · exact Or.inr ⟨hz,hv⟩
  have hInt : B ∩ C = (shell (p^k)).image ((p : GaussianInt) * ·) := by
    have hpP : Primary (p : GaussianInt) := fact ▸ (primary_mul_iff hP).mpr hPs
    have hpn : (p : GaussianInt).norm.natAbs = p^2 := by simp [sq, Int.natAbs_mul]
    ext z
    rw [mem_inter,hmB,hmC,mem_shell_image hpP hpn (pow_pos hp.pos 2), ← pow_add,
        add_comm 2 k]
    constructor
    · rintro ⟨⟨hz, a, rfl⟩, _, h⟩
      obtain ⟨w, rfl⟩ := (hsprime.dvd_mul.mp h).resolve_left hno
      exact ⟨hz, w, by rw [← fact, mul_assoc]⟩
    · rintro ⟨hz, h⟩
      rw [← fact] at h
      exact ⟨⟨hz,(dvd_mul_right _ _).trans h⟩,hz,(dvd_mul_left _ _).trans h⟩
  have eqn := Finset.sum_union_inter (s₁ := B) (s₂ := C) (f := fun z => z)
  rw [hUnion, hInt, shell_sum_image _ (Nat.cast_ne_zero.mpr hp.ne_zero)] at eqn
  change mass _ + _ = _ + _ at eqn
  dsimp only [B,C] at eqn
  rw [shell_sum_image _ hprime.ne_zero, shell_sum_image _ hsprime.ne_zero] at eqn
  rw [hsm, add_mul]
  exact eq_sub_of_add_eq eqn

lemma inert_recurrence (p : ℕ) (hp : p.Prime) (h3 : p % 4 = 3) (k : ℕ) :
    mass (p^(k+2)) = mass p * mass (p^(k+1)) - (p : GaussianInt)*mass (p^k) := by
  letI : Fact p.Prime := ⟨hp⟩
  have hprime := (GaussianInt.prime_iff_mod_four_eq_three_of_nat_prime p).mpr h3
  have hall (z : GaussianInt) (h : p ∣ z.norm.natAbs) : (p : GaussianInt) ∣ z := by
    rcases norm_dvd_by_prime hprime dvd_rfl h with h' | h'
    · exact h'
    · simpa using h'
  have hP : Primary (-(p : GaussianInt)) := by
    rw [primary_iff]
    change (-(0 : ℤ)) % 2 = 0 ∧ (-(p:ℤ) + -0) % 4 = 1
    omega
  have hN : (-(p : GaussianInt)).norm.natAbs = p^2 := by simp [sq, Int.natAbs_mul]
  have h0 : shell p = ∅ := by
    apply Finset.eq_empty_iff_forall_notMem.mpr
    intro z hz
    obtain ⟨_,hn⟩ := mem_shell.mp hz
    obtain ⟨a,ha⟩ := hall z (hn ▸ dvd_rfl)
    have h : p^2 ∣ p := by
      refine ⟨a.norm.natAbs, ?_⟩
      rw [ha] at hn
      simpa [sq, Int.natAbs_mul] using hn.symm
    have := Nat.le_of_dvd hp.pos h
    nlinarith [hp.two_le]
  have hi : shell (p^(k+2)) = (shell (p^k)).image ((-(p : GaussianInt)) * ·) := by
    ext z
    rw [mem_shell_image hP hN (pow_pos hp.pos 2), ← pow_add, add_comm 2 k]
    refine ⟨fun hz => ⟨hz,?_⟩, And.left⟩
    apply neg_dvd.mpr
    apply hall
    rw [(mem_shell.mp hz).2]
    exact dvd_pow_self p (by omega)
  have hem : mass p = 0 := by simp [mass,h0]
  have hmass : mass (p^(k+2)) = -(p : GaussianInt) * mass (p^k) := by
    unfold mass at *
    rw [hi, shell_sum_image _ (by exact neg_ne_zero.mpr (Nat.cast_ne_zero.mpr hp.ne_zero))]
    rfl
  simp [hmass,hem]


lemma shell_split_prime {p : ℕ} (hp : p.Prime) {z : GaussianInt} (hz : z ∈ shell p) :
    shell p = {z, star z} := by
  have ⟨hzP,hn⟩ := mem_shell.mp hz
  have hstar : star z ∈ shell p := mem_shell.mpr ⟨primary_star hzP, by simpa using hn⟩
  ext w
  constructor
  · intro hw
    obtain ⟨hwP,hwn⟩ := mem_shell.mp hw
    have hwprim := norm_prime hp hwn
    have hzprim := norm_prime hp hn
    have hstprim := norm_prime hp (mem_shell.mp hstar).2
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

theorem mass_prime_power (p : ℕ) (hp : p.Prime) (hodd : p ≠ 2) (k : ℕ) :
    mass (p^(k+2)) = mass p * mass (p^(k+1)) - (p : GaussianInt)*mass (p^k) := by
  by_cases h3 : p % 4 = 3
  · exact inert_recurrence p hp h3 k
  letI : Fact p.Prime := ⟨hp⟩
  obtain ⟨a,b,hab⟩ := Nat.Prime.sq_add_sq h3
  let w : GaussianInt := ⟨a,b⟩
  have hw : w.norm = p := by
    rw [norm_sq]
    change (a : ℤ)^2 + (b : ℤ)^2 = p
    exact_mod_cast hab
  obtain ⟨r, hr, he⟩ := exists_primary_associate w (by
    rw [hw]; exact_mod_cast hp.eq_two_or_odd.resolve_left hodd)
  have hn : r.norm.natAbs = p := by
    rw [Zsqrtd.norm_eq_of_associated (by decide : (-1 : ℤ) ≤ 0) he,hw,Int.natAbs_natCast]
  have hr' := mem_shell.mpr (And.intro hr hn)
  have hne := distinct_star_of_prime hp hn
  apply split_recurrence hp hr' hne _ k
  simp [mass, shell_split_prime hp hr', hne]

theorem coefficient_prime_power (p : ℕ) (hp : p.Prime) (hodd : p ≠ 2) (k : ℕ) :
    (mass (p^(k+2))).re =
      (mass p).re * (mass (p^(k+1))).re - (p : ℤ) * (mass (p^k)).re := by
  rw [mass_prime_power p hp hodd k]
  simp [mass_real]

end TunnellGaussian

/-
# Local properties of the congruent-number curves
-/

namespace TunnellPeriodCoates

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

end TunnellPeriodCoates

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
  have hd := TunnellPeriodCoates.eight_dvd_points_base p.val hp
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

end TunnellArithmetic



/- The absolutely convergent Gaussian lattice expansion of the twisted L-series. -/

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


/- Euler product of the Gaussian Hecke L-series for the congruent-number twists. -/

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

end

section

namespace TunnellBaseTranslations
open MatrixGroups UpperHalfPlane Finset

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
end TunnellBaseTranslations

end

section

/- Disk primitive and level-two Fricke transformation for the conductor-32 eta product. -/

namespace TunnellFricke

open Complex hiding eta
open Function ModularForm Set Filter Metric
open UpperHalfPlane hiding I
open scoped Real Topology

noncomputable def h (z : ℂ) := eta z ^2 * eta (2*z)^2
noncomputable def W (z : ℂ) := -1/(2*z)
noncomputable def disk (q : ℂ) := (∏' n : ℕ, (1-(q^4)^(n+1)))^2 *
  (∏' n : ℕ, (1-(q^8)^(n+1)))^2

lemma disk_hol : DifferentiableOn ℂ disk (ball 0 1) := by
  have hc (a : ℕ) (ha : 0<a) : MapsTo (fun q : ℂ => q^a) (ball 0 1) (ball 0 1) := by
    intro q hq
    simpa [mem_ball,norm_pow] using pow_lt_one₀ (norm_nonneg q) (by simpa using hq) ha.ne'
  have hf (a : ℕ) (ha : 0<a) := differentiableOn_tprod_one_sub_pow.comp
    (show DifferentiableOn ℂ (fun q : ℂ => q^a) (ball 0 1) by fun_prop) (hc a ha)
  exact ((hf 4 (by decide)).pow 2).mul ((hf 8 (by decide)).pow 2)

lemma disk_rot (q : ℂ) : disk (I*q) = disk q := by
  simp [disk,mul_pow,I_pow_four,show Complex.I^8=1 by rw [show 8=4*2 by decide,pow_mul,I_pow_four,one_pow]]

lemma present (z : ℂ) : h z = Periodic.qParam 4 z * disk (Periodic.qParam 4 z) := by
  have h1 : Periodic.qParam 1 z = Periodic.qParam 4 z ^4 := by
    simp only [Periodic.qParam,← Complex.exp_nat_mul]; push_cast; congr 1; ring
  have h2 : Periodic.qParam 1 (2*z) = Periodic.qParam 4 z ^8 := by
    simp only [Periodic.qParam,← Complex.exp_nat_mul]; push_cast; congr 1; ring
  have h0 : Periodic.qParam 24 z ^2 * Periodic.qParam 24 (2*z)^2 = Periodic.qParam 4 z := by
    simp only [Periodic.qParam,← Complex.exp_nat_mul,← Complex.exp_add]; push_cast; congr 1; ring
  simp only [h,eta,eta_q,h1,h2,mul_pow,disk]
  linear_combination (∏' k : ℕ, (1-(Periodic.qParam 4 z ^ 4)^(k+1)))^2 *
    (∏' k : ℕ, (1-(Periodic.qParam 4 z ^ 8)^(k+1)))^2 * h0

lemma sq_csqrt (z : ℂ) (hz : z ≠ 0) : sqrt z ^ 2 = z := by
  rw [sqrt_eq_exp hz,← exp_nat_mul]
  convert Complex.exp_log hz using 2 <;> ring

lemma eta_S_sq (z : ℂ) (hz : 0<z.im) : eta (-1/z)^2 = (-I)*z*eta z^2 := by
  have e : eta (-1/z) = (sqrt I)⁻¹*(sqrt z * eta z) := eta_comp_eq_csqrt_I_inv hz
  rw [e,mul_pow,mul_pow,inv_pow,sq_csqrt I I_ne_zero,sq_csqrt z (ne_zero (⟨z,hz⟩:ℍ)),inv_I]
  ring

lemma h_fricke (z : ℂ) (hz : 0<z.im) : h (W z) = -2*z^2*h z := by
  have hz' : 0<(2*z).im := by simpa [mul_im] using hz
  have hz0 := ne_zero (⟨z,hz⟩:ℍ)
  simp only [h,W,eta_S_sq _ hz',show 2*(-1/(2*z)) = -1/z by field_simp,eta_S_sq _ hz]
  linear_combination 2*z^2*eta z^2*eta (2*z)^2*I_sq

lemma W_mem {z : ℂ} (hz : 0<z.im) : 0<(W z).im := by
  have h2 : 0<(2*z).im := by simpa [mul_im] using hz
  simpa [W,neg_div] using (⟨2*z,h2⟩:ℍ).im_inv_neg_coe_pos

noncomputable def c : ℂ := 2*(Real.pi:ℂ)*I/4

lemma hasDeriv_q (z : ℂ) : HasDerivAt (Periodic.qParam 4) (c*Periodic.qParam 4 z) z := by
  have e : Periodic.qParam 4 = fun z => exp (c*z) := by
    ext z
    simp only [Periodic.qParam,c]
    push_cast
    congr 1
    ring
  rw [e]
  simpa [mul_comm] using ((hasDerivAt_id z).const_mul c).cexp

lemma q_T (z : ℂ) : Periodic.qParam 4 (z+1) = I*Periodic.qParam 4 z := by
  simp only [Periodic.qParam]
  push_cast
  rw [show 2*(Real.pi:ℂ)*I*(z+1)/4 = Real.pi/2*I + 2*Real.pi*I*z/4 by ring,
    exp_add,exp_pi_div_two_mul_I]

theorem primitive :
    ∃ J : ℂ → ℂ, (∀ z, 0<z.im → HasDerivAt J (c*h z) z) ∧
      Tendsto J (comap Complex.im atTop) (𝓝 0) ∧
      (∀ z, 0<z.im → J (z+1) = I*J z) ∧
      ∃ C : ℂ, ∀ z, 0<z.im → J (W z) = C-J z := by
  obtain ⟨G,hG0,hG⟩ := disk_hol.isExactOn_ball.with_val_at 0 0
  let J (z : ℂ) := G (Periodic.qParam 4 z)
  have qmem {z : ℂ} (hz : 0<z.im) : Periodic.qParam 4 z ∈ ball 0 1 := by
    simpa using Periodic.norm_qParam_lt_one (by norm_num : (0:ℝ)<4) hz
  have hJ (z : ℂ) (hz : 0<z.im) : HasDerivAt J (c*h z) z := by
    rw [show c*h z = disk (Periodic.qParam 4 z)*(c*Periodic.qParam 4 z) by rw [present]; ring]
    exact (hG _ (qmem hz)).comp z (hasDeriv_q z)
  have h0 : Tendsto J (comap Complex.im atTop) (𝓝 0) := by
    have hh := (hG 0 (mem_ball_self (by norm_num))).continuousAt.tendsto
    rw [hG0] at hh
    exact hh.comp ((Periodic.qParam_tendsto (by norm_num : (0:ℝ)<4)).mono_right nhdsWithin_le_nhds)
  have hA {q : ℂ} (hq : q ∈ ball 0 1) : I*q ∈ ball 0 1 := by simpa [mem_ball] using hq
  have da {q : ℂ} (hq : q ∈ ball 0 1) : HasDerivAt (fun w => G (I*w)) (I*disk q) q := by
    simpa only [Function.comp_def,id_eq, mul_one,disk_rot, mul_comm (disk q) I] using (hG _ (hA hq)).comp q ((hasDerivAt_id q).const_mul I)
  have db {q : ℂ} (hq : q ∈ ball 0 1) : HasDerivAt (fun w => I*G w) (I*disk q) q := (hG _ hq).const_mul I
  have rot : (ball 0 1).EqOn (fun w => G (I*w)) (fun w => I*G w) := by
    refine isOpen_ball.eqOn_of_deriv_eq (convex_ball (0:ℂ) 1).isPreconnected
      (fun q hq => (da hq).differentiableAt.differentiableWithinAt)
      (fun q hq => (db hq).differentiableAt.differentiableWithinAt)
      (fun q hq => (da hq).deriv.trans (db hq).deriv.symm) (x:=0) (by simp) ?_
    simp [hG0]
  refine ⟨J,hJ,h0,fun z hz => ?_,?_⟩
  · simpa [J,q_T] using rot (qmem hz)
  · have dW (z : ℂ) (hz : 0<z.im) : HasDerivAt W (1/(2*z^2)) z := by
      have hz0 := ne_zero (⟨z,hz⟩:ℍ)
      have hh := (hasDerivAt_const z (-1:ℂ)).div ((hasDerivAt_id z).const_mul 2) (mul_ne_zero two_ne_zero hz0)
      change HasDerivAt W ((0*(2*z)-(-1)*(2*1))/(2*z)^2) z at hh
      rwa [show (0*(2*z)-(-1)*(2*1))/(2*z)^2 = 1/(2*z^2) by field_simp; ring] at hh
    have da (z : ℂ) (hz : 0<z.im) : HasDerivAt (fun w => J (W w)) (-(c*h z)) z := by
      have hz0 := ne_zero (⟨z,hz⟩:ℍ)
      rw [show -(c*h z) = c*h (W z)*(1/(2*z^2)) by rw [h_fricke z hz]; field_simp]
      exact (hJ (W z) (W_mem hz)).comp z (dW z hz)
    have db (z : ℂ) (hz : 0<z.im) := (hJ z hz).neg
    obtain ⟨C,hC⟩ := isOpen_upperHalfPlaneSet.exists_eq_add_of_deriv_eq
      (convex_halfSpace_im_gt 0).isPreconnected
      (fun z hz => (da z hz).differentiableAt.differentiableWithinAt)
      (fun z hz => (db z hz).differentiableAt.differentiableWithinAt)
      (fun z hz => (da z hz).deriv.trans (db z hz).deriv.symm)
    exact ⟨C,fun z hz => by simpa [sub_eq_add_neg,add_comm] using hC hz⟩

end TunnellFricke

end

section

/-
# The base cusp form for the congruent-number curves

The twelfth power of the eta product is a product of two rational dilates of
the modular discriminant. Its multiplier therefore has finite image, and on
the kernel the eta product is a weight-two cusp form. Its period is one.
Uniform convergence of the truncated products on compact subsets of the disk
identifies the Fourier coefficients with the prescribed integer coefficients.
-/

namespace TunnellRoot

open Complex UpperHalfPlane Matrix MatrixGroups ModularForm
open scoped Manifold Topology

lemma pow_slash (f : ℍ → ℂ) (g : SL(2, ℤ)) (k n : ℕ) :
    (f ^ n) ∣[((n*k : ℕ) : ℤ)] g = (f ∣[(k:ℤ)] g) ^ n := by
  induction n with
  | zero =>
    ext z
    simp [SL_slash_apply]
  | succ n ih =>
    rw [pow_succ, Nat.succ_mul, Nat.cast_add, mul_slash_SL2, ih, pow_succ]

lemma zero_of_twelfth_power {f : ℍ → ℂ} (h : IsZeroAtImInfty (f ^ 12)) : IsZeroAtImInfty f := by
  rw [isZeroAtImInfty_iff] at h ⊢
  intro ε hε
  obtain ⟨b,hb⟩ := h (ε^12) (by positivity)
  refine ⟨b, fun z hz => ?_⟩
  have ht := hb z hz
  simp only [Pi.pow_apply, norm_pow] at ht
  exact le_of_pow_le_pow_left₀ (by decide : 12 ≠ 0) hε.le ht

lemma constant_of_twelfth_power (q : ℍ → ℂ) (hq : Continuous q) (hp : ∀ z, q z ^ 12 = 1)
    (x y : ℍ) : q x = q y := by
  let Z := Polynomial.nthRootsFinset 12 (1:ℂ)
  apply isPreconnected_univ.constant_of_mapsTo (T := (Z : Set ℂ)) Z.finite_toSet.isDiscrete
    hq.continuousOn _ (Set.mem_univ x) (Set.mem_univ y)
  exact fun z _ => (Polynomial.mem_nthRootsFinset (by decide : 0 < 12) 1).mpr (hp z)

theorem exists_cusp_root {Γ : Subgroup SL(2, ℤ)} [Γ.FiniteIndex] (hT : ModularGroup.T ∈ Γ)
    (f : ℍ → ℂ) (hhol : MDiff f) (hf : ∀ z, f z ≠ 0)
    (hperiod : f ∣[(2 : ℤ)] ModularGroup.T = f)
    (F : CuspForm (Γ : Subgroup (GL (Fin 2) ℝ)) 24) (hpow : ⇑F = f ^ 12) :
    ∃ H : Subgroup SL(2, ℤ), H.FiniteIndex ∧ ModularGroup.T ∈ H ∧
      ∃ G : CuspForm (H : Subgroup (GL (Fin 2) ℝ)) 2, ⇑G = f := by
  classical
  let base : ℍ := UpperHalfPlane.I
  let ratio (g : Γ) (z : ℍ) := (f ∣[(2 : ℤ)] (g.val)) z / f z
  have hpowg (g : Γ) : (f ∣[(2 : ℤ)] (g.val)) ^ 12 = f^12 := by
    have hh : (f^12) ∣[(24:ℤ)] g.val = (f∣[(2:ℤ)]g.val)^12 := pow_slash f g.val 2 12
    rw [← hh, ← hpow]
    exact F.slash_action_eq' _ ⟨g.val,g.property,rfl⟩
  have hrpow (g : Γ) (z : ℍ) : ratio g z ^ 12 = 1 := by
    have ht := congrFun (hpowg g) z
    change ((f ∣[(2 : ℤ)] (g.val)) z)^12 = f z ^12 at ht
    dsimp only [ratio]
    rw [div_pow, ht, div_self (pow_ne_zero _ (hf z))]
  have hrc (g : Γ) (z : ℍ) : ratio g z = ratio g base := by
    apply constant_of_twelfth_power _ _ (hrpow g)
    exact (hhol.slash 2 (g.val : GL (Fin 2) ℝ)).continuous.div hhol.continuous hf
  have hslash (g : Γ) : f ∣[(2 : ℤ)] g.val = ratio g base • f := by
    funext z
    exact (div_eq_iff (hf z)).mp (hrc g z)
  let χ : Γ →* ℂ := {
    toFun := fun g => ratio g base
    map_one' := by simp [ratio, hf]
    map_mul' := by
      intro g h
      have heq : (f ∣[(2 : ℤ)] ((g*h).val)) = (ratio g base * ratio h base) • f := by
        rw [Subgroup.coe_mul, SlashAction.slash_mul, hslash g, SL_slash,
          smul_slash, ← SL_slash, hslash h]
        simp [σ, smul_smul]
      exact (div_eq_iff (hf base)).mpr (congrFun heq base) }
  let χ' : Γ →* rootsOfUnity 12 ℂ := χ.toHomUnits.codRestrict _ (fun g => by
    change χ.toHomUnits g ^ 12 = 1
    ext
    exact hrpow g base)
  let H := χ'.ker.map Γ.subtype
  have hH : H.FiniteIndex := by
    constructor
    rw [Subgroup.index_map_subtype]
    exact Nat.mul_ne_zero (Subgroup.FiniteIndex.index_ne_zero (H := χ'.ker)) (Subgroup.FiniteIndex.index_ne_zero (H := Γ))
  have hker (g : Γ) : g ∈ χ'.ker ↔ ratio g base = 1 := by
    change χ' g = 1 ↔ _
    simp only [Subtype.ext_iff, Units.ext_iff]
    rfl
  have hsH (γ : SL(2, ℤ)) (hγ : γ ∈ H) : f ∣[(2 : ℤ)] γ = f := by
    obtain ⟨g,hg,rfl⟩ := hγ
    change f ∣[(2:ℤ)] g.val = f
    rw [hslash g, hker g |>.mp hg, one_smul]
  have hT' : ModularGroup.T ∈ H := by
    refine ⟨⟨_,hT⟩, (hker _).mpr ?_, rfl⟩
    simp [ratio, hperiod, hf]
  refine ⟨H,hH,hT', { toFun := f, slash_action_eq' := ?_, holo' := hhol, zero_at_cusps' := ?_ }, rfl⟩
  · rintro _ ⟨γ,hγ,rfl⟩
    exact hsH γ hγ
  · intro c hc
    have hsub : (H : Subgroup (GL (Fin 2) ℝ)) ≤ (Γ : Subgroup (GL (Fin 2) ℝ)) := by
      apply Subgroup.map_mono
      rintro γ ⟨g,-,rfl⟩
      exact g.property
    have hcSL : IsCusp c 𝒮ℒ := hc.mono (Subgroup.map_le_range _ _)
    apply (OnePoint.isZeroAt_iff_forall_SL2Z hcSL).mpr
    intro γ hγ
    apply zero_of_twelfth_power
    have hh : (f^12) ∣[(24:ℤ)] γ = (f∣[(2:ℤ)]γ)^12 := pow_slash f γ 2 12
    rw [← hh, ← hpow]
    exact ((OnePoint.isZeroAt_iff_forall_SL2Z hcSL).mp (F.zero_at_cusps' (hc.mono hsub))) γ hγ

end TunnellRoot

namespace TunnellRoot

open Complex UpperHalfPlane Matrix MatrixGroups ModularForm
open Matrix.GeneralLinearGroup Matrix.SpecialLinearGroup ConjAct Pointwise
open scoped Manifold

noncomputable def dilation (d : ℕ) (hd : 0 < d) : GL (Fin 2) ℚ :=
  mkOfDetNeZero !![(d:ℚ), 0; 0, 1] (by simp [Matrix.det_fin_two, hd.ne'])

noncomputable def dilR (d : ℕ) (hd : 0 < d) : GL (Fin 2) ℝ :=
  (dilation d hd).map (Rat.castHom ℝ)

lemma val_dilR (d : ℕ) (hd : 0 < d) : ((dilR d hd : GL (Fin 2) ℝ) : Matrix _ _ _) =
    !![(d:ℝ), 0; 0, 1] := by
  ext i j
  fin_cases i <;> fin_cases j <;> simp [dilR, dilation, mkOfDetNeZero]

lemma det_dilR (d : ℕ) (hd : 0 < d) : (dilR d hd).det.val = d := by
  rw [val_det_apply, val_dilR, Matrix.det_fin_two]
  simp

lemma delta_dilate_slash (d : ℕ) (hd : 0 < d) (τ : ℍ) :
    CuspForm.translate CuspForm.discriminant (dilR d hd) τ =
    ModularForm.eta ((d:ℂ) * (τ : ℂ)) ^ 24 * (d : ℂ)^11 := by
  let g := dilR d hd
  have hdet : g.det.val = (d : ℝ) := det_dilR d hd
  have hpos : 0 < g.det.val := hdet ▸ (by exact_mod_cast hd)
  have hz : ↑(g • τ) = (d : ℂ) * (τ : ℂ) := by
    simp [UpperHalfPlane.coe_smul_of_det_pos hpos, num, denom, g,
      val_dilR]
  change (⇑CuspForm.discriminant ∣[(12:ℤ)] g) τ = _
  simp only [slash_apply, σ, hdet,
    CuspForm.coe_discriminant, ModularForm.discriminant, hz]
  simp [denom, g, val_dilR]
  norm_num [hd]

noncomputable def dilConj (d : ℕ) (hd : 0 < d) : Subgroup (GL (Fin 2) ℝ) :=
  toConjAct (dilR d hd)⁻¹ • 𝒮ℒ

lemma arith_dilConj (d : ℕ) (hd : 0 < d) : (dilConj d hd).IsArithmetic := by
  simpa only [map_inv, dilConj, dilR] using Subgroup.IsArithmetic.conj 𝒮ℒ (dilation d hd)⁻¹

lemma T_mem_dilConj (d : ℕ) (hd : 0 < d) : mapGL ℝ ModularGroup.T ∈ dilConj d hd := by
  change _ ∈ toConjAct (dilR d hd)⁻¹ • 𝒮ℒ
  rw [map_inv, Subgroup.mem_inv_pointwise_smul_iff, toConjAct_smul]
  refine ⟨ModularGroup.T ^ (d:ℤ), ?_⟩
  apply (eq_mul_inv_iff_mul_eq).mpr
  apply Units.ext
  change (mapGL ℝ (ModularGroup.T ^ (d:ℤ))).val * (dilR d hd).val = (dilR d hd).val * (mapGL ℝ ModularGroup.T).val
  simp only [val_dilR, mapGL_coe_matrix, map_apply_coe, ModularGroup.coe_T_zpow, ModularGroup.coe_T]
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [Matrix.mul_apply, Fin.sum_univ_two]

private def restrictCusp {H Γ : Subgroup (GL (Fin 2) ℝ)} (h : H ≤ Γ) {k : ℤ}
    (F : CuspForm Γ k) : CuspForm H k where
  toFun := F
  slash_action_eq' g hg := F.slash_action_eq' g (h hg)
  holo' := F.holo'
  zero_at_cusps' hc := F.zero_at_cusps' (hc.mono h)

theorem exists_eta_base_cusp (f : ℍ → ℂ) (hhol : MDiff f) (hf : ∀ z, f z ≠ 0)
    (hperiod : f ∣[(2:ℤ)] ModularGroup.T = f)
    (hpow : ∀ z : ℍ, f z ^ 12 =
      ModularForm.eta (4 * (z : ℂ))^24 * ModularForm.eta (8 * (z : ℂ))^24) :
    ∃ H : Subgroup (GL (Fin 2) ℝ), H.IsArithmetic ∧ H.strictWidthInfty = 1 ∧
      ∃ G : CuspForm H 2, ⇑G = f := by
  let A := dilConj 4 (by decide)
  let B := dilConj 8 (by decide)
  have : A.IsArithmetic := arith_dilConj _ _
  have : B.IsArithmetic := arith_dilConj _ _
  let Γ := (A ⊓ B).comap (mapGL ℝ : SL(2, ℤ) →* GL (Fin 2) ℝ)
  have : Γ.FiniteIndex := Subgroup.IsArithmetic.finiteIndex_comap _
  have hT : ModularGroup.T ∈ Γ := ⟨T_mem_dilConj _ _, T_mem_dilConj _ _⟩
  have hsub : (Γ : Subgroup (GL (Fin 2) ℝ)) ≤ A ⊓ B := Subgroup.map_comap_le _ _
  let Fa := restrictCusp (hsub.trans inf_le_left)
    (CuspForm.translate CuspForm.discriminant (dilR 4 (by decide)))
  let Fb := restrictCusp (hsub.trans inf_le_right)
    (CuspForm.translate CuspForm.discriminant (dilR 8 (by decide)))
  let F : CuspForm (Γ : Subgroup (GL (Fin 2) ℝ)) 24 :=
    (((4:ℝ)^11 * 8^11)⁻¹) • Fa.mulModularForm (CuspForm.toModularFormₗ Fb)
  have hF : ⇑F = f^12 := by
    funext τ
    change (((4:ℝ)^11 * 8^11)⁻¹) •
      (CuspForm.translate CuspForm.discriminant (dilR 4 (by decide)) τ *
       CuspForm.translate CuspForm.discriminant (dilR 8 (by decide)) τ) = f τ ^ 12
    rw [delta_dilate_slash, delta_dilate_slash, hpow]
    norm_num [Complex.real_smul]
    ring
  obtain ⟨H,hH,hHT,G,hG⟩ := exists_cusp_root hT f hhol hf hperiod F hF
  let : H.FiniteIndex := hH
  exact ⟨H, inferInstance, Subgroup.strictWidthInfty_eq_one_of_T_mem hHT, G, hG⟩

end TunnellRoot

namespace TunnellEtaUniform

open Filter Finset Polynomial
open scoped Topology

lemma eval_base_partial (D : ℕ) (q : ℂ) :
    (X * ∏ k ∈ Icc 1 D, ((1 - (X : ℂ[X])^(4*k))^2 * (1-X^(8*k))^2)).eval q =
      q * (∏ k ∈ range D, (1-(q^4)^(k+1)))^2 * (∏ k ∈ range D, (1-(q^8)^(k+1)))^2 := by
  simp only [eval_mul, eval_X, eval_prod, eval_pow, eval_sub, eval_one]
  induction D with
  | zero => simp
  | succ d ih =>
    rw [prod_Icc_succ_top (by omega : 1 ≤ d+1), prod_range_succ, prod_range_succ,
      ← mul_assoc, ih]
    simp only [← pow_mul]
    ring

theorem base_locallyUniform :
    TendstoLocallyUniformlyOn
      (fun (D : ℕ) (q : ℂ) =>
        (X * ∏ k ∈ Icc 1 D, ((1 - (X : ℂ[X])^(4*k))^2 * (1-X^(8*k))^2)).eval q)
      (fun q => q * (∏' k : ℕ, (1 - (q^4)^(k+1)))^2 * (∏' k : ℕ, (1 - (q^8)^(k+1)))^2)
      atTop (Metric.ball 0 1) := by
  let U := Metric.ball (0 : ℂ) 1
  let E (a : ℕ) (q : ℂ) : ℂ := ∏' k : ℕ, (1 - (q^a)^(k+1))
  let P (a D : ℕ) (q : ℂ) : ℂ := ∏ k ∈ range D, (1 - (q^a)^(k+1))
  have maps (a : ℕ) (ha : 0 < a) : Set.MapsTo (fun q : ℂ => q^a) U U := by
    intro q hq
    simp only [U, Metric.mem_ball, dist_zero_right, norm_pow] at hq ⊢
    exact pow_lt_one₀ (norm_nonneg _) hq ha.ne'
  have h (a : ℕ) (ha : 0 < a) : TendstoLocallyUniformlyOn (P a) (E a) atTop U := by
    dsimp only [P, E]
    exact (ModularForm.multipliableLocallyUniformlyOn_one_sub_pow.comp _ (maps a ha)
      (by fun_prop)).hasProdLocallyUniformlyOn.tendstoLocallyUniformlyOn_finsetRange
  have hc (a : ℕ) (ha : 0 < a) : ContinuousOn (E a) U := by
    dsimp only [E]
    exact ModularForm.differentiableOn_tprod_one_sub_pow.continuousOn.comp (by fun_prop) (maps a ha)
  have hi : TendstoLocallyUniformlyOn (fun (_ : ℕ) (q : ℂ) => q) id atTop U := by
    intro u hu x _
    exact ⟨Set.univ, univ_mem, .of_forall fun _ y _ => refl_mem_uniformity hu⟩
  have hs (a : ℕ) (ha : 0 < a) := (h a ha).mul₀ (h a ha) (hc a ha) (hc a ha)
  have hu := (hi.mul₀ (hs 4 (by decide)) continuousOn_id ((hc 4 (by decide)).mul (hc 4 (by decide)))).mul₀
    (hs 8 (by decide)) (continuousOn_id.mul ((hc 4 (by decide)).mul (hc 4 (by decide))))
    ((hc 8 (by decide)).mul (hc 8 (by decide)))
  simp_rw [eval_base_partial]
  simp only [pow_two]
  exact hu

end TunnellEtaUniform

namespace TunnellTaylor

open Filter Polynomial Finset
open scoped Topology

lemma deriv_eval (p : ℂ[X]) :
    deriv (fun z => p.eval z) = fun z => p.derivative.eval z :=
  funext fun z => (p.hasDerivAt z).deriv

lemma taylor_of_convergent_polynomials (P : ℕ → ℂ[X]) (f : ℂ → ℂ)
    (h : TendstoLocallyUniformlyOn (fun D z => (P D).eval z) f atTop (Metric.ball 0 1))
    (m : ℕ) (b : ℂ) (hst : ∀ D ≥ m, (P D).coeff m = b) :
    (m.factorial : ℂ)⁻¹ * iteratedDeriv m f 0 = b := by
  have iter (j : ℕ) : TendstoLocallyUniformlyOn
      (fun D z => (derivative^[j] (P D)).eval z) (iteratedDeriv j f)
      atTop (Metric.ball 0 1) := by
    induction j with
    | zero => simpa using h
    | succ j ih =>
      have h' := ih.deriv (Eventually.of_forall fun D => (derivative^[j] (P D)).differentiableOn)
        Metric.isOpen_ball
      simpa only [iteratedDeriv_succ, Function.comp_def, deriv_eval, Function.iterate_succ_apply'] using h'
  have ht := (iter m).tendsto_at (show (0 : ℂ) ∈ Metric.ball 0 1 by simp)
  have hconst : ∀ᶠ D in atTop, (derivative^[m] (P D)).eval 0 = (m.factorial : ℂ) * b := by
    filter_upwards [eventually_ge_atTop m] with D hD
    rw [← coeff_zero_eq_eval_zero, coeff_iterate_derivative]
    simp [hst D hD, mul_comm, Nat.descFactorial_self]
  have hev : iteratedDeriv m f 0 = (m.factorial : ℂ) * b :=
    tendsto_nhds_unique ht (tendsto_nhds_of_eventually_eq hconst)
  rw [hev]
  rw [← mul_assoc, inv_mul_cancel₀ (by exact_mod_cast Nat.factorial_ne_zero m), one_mul]

lemma coeff_mul_one_sub_pow {R : Type*} [CommRing R] (p : R[X]) {m k : ℕ} (hk : m < k) :
    (p * (1 - X ^ k)).coeff m = p.coeff m := by
  simp only [mul_sub, mul_one, coeff_sub, coeff_mul_X_pow', if_neg (by omega : ¬k ≤ m), sub_zero]

lemma base_stable {R : Type*} [CommRing R] (m D : ℕ) (hD : m ≤ D) :
    (X * ∏ k ∈ Icc 1 D, ((1 - (X : R[X])^(4*k))^2 * (1-X^(8*k))^2)).coeff m =
    (X * ∏ k ∈ Icc 1 m, ((1 - (X : R[X])^(4*k))^2 * (1-X^(8*k))^2)).coeff m := by
  induction D, hD using Nat.le_induction with
  | base => rfl
  | succ D hD ih =>
    rw [Finset.prod_Icc_succ_top (by omega : 1 ≤ D+1)]
    simp only [pow_two, ← mul_assoc]
    rw [coeff_mul_one_sub_pow _ (by omega : m < 8*(D+1)),
      coeff_mul_one_sub_pow _ (by omega : m < 8*(D+1)),
      coeff_mul_one_sub_pow _ (by omega : m < 4*(D+1)),
      coeff_mul_one_sub_pow _ (by omega : m < 4*(D+1))]
    simpa only [pow_two, ← mul_assoc] using ih

lemma base_taylor (f : ℂ → ℂ)
    (h : TendstoLocallyUniformlyOn
      (fun (D : ℕ) (z : ℂ) => z * ∏ k ∈ Icc 1 D, ((1-z^(4*k))^2 * (1-z^(8*k))^2))
      f atTop (Metric.ball 0 1)) (m : ℕ) :
    (m.factorial : ℂ)⁻¹ * iteratedDeriv m f 0 =
      (((X * ∏ k ∈ Icc 1 m, ((1-(X : ℤ[X])^(4*k))^2 * (1-X^(8*k))^2)).coeff m : ℤ) : ℂ) := by
  let P (D : ℕ) : ℤ[X] := X * ∏ k ∈ Icc 1 D, ((1-X^(4*k))^2 * (1-X^(8*k))^2)
  apply taylor_of_convergent_polynomials (fun D => (P D).map (Int.castRingHom ℂ))
  · simpa only [P, Polynomial.map_mul, Polynomial.map_prod, Polynomial.map_sub,
      Polynomial.map_one, Polynomial.map_pow, Polynomial.map_X, Polynomial.eval_mul,
      Polynomial.eval_prod, Polynomial.eval_sub, Polynomial.eval_pow, Polynomial.eval_one,
      Polynomial.eval_X] using h
  · intro D hD
    rw [Polynomial.coeff_map]
    exact congrArg (fun z : ℤ => (z : ℂ)) (base_stable (R := ℤ) m D hD)

end TunnellTaylor

namespace TunnellEtaValue
open UpperHalfPlane Function MatrixGroups ModularForm
open scoped Manifold Real Topology

noncomputable def etaValue (z : ℍ) : ℂ :=
  eta (4*(z:ℂ))^2 * eta (8*(z:ℂ))^2

noncomputable def diskValue (q : ℂ) : ℂ :=
  q * (∏' k : ℕ, (1-(q^4)^(k+1)))^2 * (∏' k : ℕ, (1-(q^8)^(k+1)))^2

lemma etaValue_hol : MDiff etaValue := by
  have h (a : ℕ) (ha : 0 < a) : MDiff (fun z : ℍ => eta ((a:ℂ)*z)) := by
    intro z
    have hz : (a:ℂ)*(z:ℂ) ∈ upperHalfPlaneSet := by
      change 0 < ((a:ℂ)*(z:ℂ)).im
      simpa [Complex.mul_im] using mul_pos (Nat.cast_pos.mpr ha : 0 < (a : ℝ)) z.im_pos
    exact (differentiableAt_eta_of_mem_upperHalfPlaneSet hz).mdifferentiableAt.comp z
      (mdifferentiableAt_const.mul (UpperHalfPlane.mdifferentiable_coe z))
  exact ((h 4 (by decide)).pow 2).mul ((h 8 (by decide)).pow 2)

lemma etaValue_ne (z : ℍ) : etaValue z ≠ 0 := by
  have h (a : ℕ) (ha : 0 < a) : eta ((a:ℂ)*z) ≠ 0 := by
    apply eta_ne_zero
    change 0 < ((a:ℂ)*(z:ℂ)).im
    simpa [Complex.mul_im] using mul_pos (Nat.cast_pos.mpr ha : 0 < (a:ℝ)) z.im_pos
  exact mul_ne_zero (pow_ne_zero 2 (h 4 (by decide))) (pow_ne_zero 2 (h 8 (by decide)))

lemma etaValue_pow (z : ℍ) :
    etaValue z ^ 12 = eta (4*(z:ℂ)) ^ 24 * eta (8*(z:ℂ)) ^ 24 := by
  simp only [etaValue, mul_pow, ← pow_mul]

lemma qparam_dilate (a : ℕ) (z : ℂ) :
    Periodic.qParam 1 ((a:ℂ)*z) = (Periodic.qParam 1 z)^a := by
  simp only [Periodic.qParam, Complex.ofReal_one, div_one, ← Complex.exp_nat_mul]
  congr 1
  ring

lemma etaValue_eq (z : ℍ) : etaValue z = diskValue (Periodic.qParam 1 z) := by
  have hlead : Periodic.qParam 24 (4*(z:ℂ))^2 * Periodic.qParam 24 (8*(z:ℂ))^2 =
      Periodic.qParam 1 z := by
    simp only [Periodic.qParam, ← Complex.exp_nat_mul, ← Complex.exp_add]
    push_cast
    congr 1
    ring
  unfold etaValue diskValue eta eta_q
  rw [show (4:ℂ) = (4:ℕ) by norm_num, qparam_dilate,
    show (8:ℂ) = (8:ℕ) by norm_num, qparam_dilate]
  rw [mul_pow, mul_pow]
  linear_combination (∏' k : ℕ, (1-(Periodic.qParam 1 z ^ 4)^(k+1)))^2 *
    (∏' k : ℕ, (1-(Periodic.qParam 1 z ^ 8)^(k+1)))^2 * hlead

lemma etaValue_period : etaValue ∣[(2:ℤ)] ModularGroup.T = etaValue := by
  funext z
  have hd : denom (ModularGroup.T : GL (Fin 2) ℝ) z = 1 := by
    simp [denom, Matrix.SpecialLinearGroup.map_apply_coe, ModularGroup.coe_T]
  rw [SL_slash_apply, hd, one_zpow, mul_one, modular_T_smul]
  simp only [etaValue_eq]
  have h : Periodic.qParam 1 (1+(z:ℂ)) = Periodic.qParam 1 z := by
    simp only [Periodic.qParam, Complex.ofReal_one, div_one, mul_add, mul_one, Complex.exp_add]
    rw [show 2*(Real.pi:ℂ)*Complex.I = (2*Real.pi:ℝ)*Complex.I by push_cast; rfl]
    simp
  change diskValue (Periodic.qParam 1 (1+(z:ℂ))) = _
  rw [h]

lemma cusp_disk_near_zero {Γ : Subgroup (GL (Fin 2) ℝ)} [Γ.IsArithmetic]
    (hwidth : Γ.strictWidthInfty = 1) (G : CuspForm Γ 2) (hg : ⇑G = etaValue) :
    UpperHalfPlane.cuspFunction 1 G =ᶠ[𝓝 0] diskValue := by
  filter_upwards [Metric.ball_mem_nhds (0:ℂ) (by norm_num : 0 < (1:ℝ))] with q hq
  by_cases h0 : q=0
  · subst q
    rw [CuspFormClass.cuspFunction_apply_zero G one_pos (hwidth ▸ Γ.strictWidthInfty_mem_strictPeriods)]
    simp [diskValue]
  have him := Periodic.im_invQParam_pos_of_norm_lt_one one_pos (by simpa using hq : ‖q‖ < 1) h0
  let z : ℍ := ⟨Periodic.invQParam 1 q, him⟩
  have hqz : Periodic.qParam 1 (z:ℂ) = q := Periodic.qParam_right_inv one_ne_zero h0
  rw [← hqz, SlashInvariantFormClass.eq_cuspFunction G z
    (hwidth ▸ Γ.strictWidthInfty_mem_strictPeriods) one_ne_zero, hg, etaValue_eq]

end TunnellEtaValue

open UpperHalfPlane MatrixGroups
open TunnellEtaValue

theorem TunnellEtaValue.actual_form :
    ∃ (H : Subgroup (GL (Fin 2) ℝ)) (hH : H.IsArithmetic) (_ : H.strictWidthInfty = 1)
      (F : CuspForm H 2), (∀ z : ℍ, F z = TunnellFricke.h (4*(z:ℂ))) ∧
      ∀ m : ℕ, (qExpansion 1 F).coeff m = (((Polynomial.X *
        ∏ i ∈ Finset.Icc 1 m, ((1-(Polynomial.X:Polynomial ℤ)^(4*i))^2*(1-Polynomial.X^(8*i))^2)).coeff m:ℤ):ℂ) := by
  obtain ⟨H, hH, hw, G, hg⟩ := TunnellRoot.exists_eta_base_cusp etaValue
    etaValue_hol etaValue_ne etaValue_period etaValue_pow
  let _ := hH
  refine ⟨H, hH, hw, G, ?_, ?_⟩
  · intro z
    rw [hg]
    simp only [etaValue,TunnellFricke.h,show 2*(4*(z:ℂ)) = 8*z by ring]
  intro m
  rw [qExpansion_coeff, (cusp_disk_near_zero hw G hg).iteratedDeriv_eq]
  apply TunnellTaylor.base_taylor
  unfold diskValue
  convert TunnellEtaUniform.base_locallyUniform using 1
  funext D z
  simp only [Polynomial.eval_mul, Polynomial.eval_prod, Polynomial.eval_sub,
    Polynomial.eval_pow, Polynomial.eval_one, Polynomial.eval_X]

end

section

/- Uniqueness of analytic continuation and the normalized central Mellin integral. -/

namespace TunnellMellin

open Filter Set Complex UpperHalfPlane MatrixGroups MeasureTheory
open scoped Topology ModularForm

theorem entire_unique {f g : ℂ → ℂ} (hf : AnalyticOnNhd ℂ f univ) (hg : AnalyticOnNhd ℂ g univ)
    (B : ℝ) (h : ∀ x : ℝ, B<x → f x = g x) : f = g := by
  let a : ℝ := B+1
  have hm : Tendsto ((↑) : ℝ → ℂ) (𝓝[≠] a) (𝓝[≠] (a:ℂ)) := by
    exact continuous_ofReal.continuousWithinAt.tendsto_nhdsWithin (fun _ _ => by simp_all)
  apply hf.eq_of_frequently_eq hg (hm.frequently ?_)
  apply Filter.Eventually.frequently
  filter_upwards [(eventually_gt_nhds (show B<a by dsimp [a]; linarith)).filter_mono nhdsWithin_le_nhds] with x hx
  exact h x hx

theorem unique_euler_product {f g : ℂ → ℂ} (hf : AnalyticOnNhd ℂ f univ)
    (hg : AnalyticOnNhd ℂ g univ) {I : Type*} (u : ℝ → I → ℂ) (B : ℝ)
    (h₁ : ∀ x : ℝ, B<x → HasProd (u x) (f x))
    (h₂ : ∀ x : ℝ, B<x → HasProd (u x) (g x)) : f = g :=
  entire_unique hf hg B (fun x hx => (h₁ x hx).unique (h₂ x hx))

theorem central_integral {Γ : Subgroup (GL (Fin 2) ℝ)} [Γ.IsArithmetic] (F : CuspForm Γ 2) :
    ModularForm.L (by decide : (0:ℤ)<2) F 1 =
      (2*Real.pi:ℂ) * ∫ t in Ioi (0:ℝ), F (ofComplex (Complex.I*t)) := by
  rw [ModularForm.L,CuspForm.Λ_eq_mellin,Complex.Gammaℂ_one]
  simp [mellin, smul_eq_mul, mul_comm, div_eq_mul_inv]

end TunnellMellin

end

section

/- The central value of a twist as vertical integrals at rational cusps. -/

namespace TunnellModularSymbol

open TunnellBaseTranslations TunnellMellin
open MatrixGroups UpperHalfPlane MeasureTheory Set
open scoped ModularForm

lemma integrable_vertical {Γ : Subgroup (GL (Fin 2) ℝ)} [Γ.IsArithmetic] (F : CuspForm Γ 2) :
    IntegrableOn (fun t : ℝ => F (ofComplex (Complex.I*t))) (Ioi 0) := by
  have h := ((CuspForm.isStrongFEPair (by decide : (0:ℤ)<2) F).hasMellin 1).1
  simpa [MellinConvergent, ModularForm.weakFEPair] using h

lemma integrable_translate {Γ : Subgroup (GL (Fin 2) ℝ)} [Γ.IsArithmetic]
    (hw : Γ.strictWidthInfty = 1) (F : CuspForm Γ 2) (r : ℚ) :
    IntegrableOn (fun t : ℝ => F ((r:ℝ)+ᵥ ofComplex (Complex.I*t))) (Ioi 0) := by
  obtain ⟨H, hH, _, G, heq⟩ := TunnellTranslate.exists_sum_rational_translates hw F
    (fun _ : Unit => r) (fun _ => 1)
  letI := hH
  simpa [heq] using integrable_vertical G

theorem twist_central_integral {N : ℕ} [NeZero N] (w : ZMod N → ℂ)
    {Γ : Subgroup (GL (Fin 2) ℝ)} [Γ.IsArithmetic] (hw : Γ.strictWidthInfty = 1)
    (F : CuspForm Γ 2) :
    ∃ (H : Subgroup (GL (Fin 2) ℝ)) (hH : H.IsArithmetic) (_ : H.strictWidthInfty = 1)
      (G : CuspForm H 2),
      (∀ m : ℕ, (qExpansion 1 G).coeff m = w m * (qExpansion 1 F).coeff m) ∧
      ModularForm.L (by decide : (0:ℤ)<2) G 1 =
        ∑ j : ZMod N, ZMod.dft.symm w j *
          ((2*Real.pi:ℂ) * ∫ t in Ioi (0:ℝ), F ((-(j.val:ℝ)/N)+ᵥ ofComplex (Complex.I*t))) := by
  obtain ⟨H,hH,hW,G,he⟩ := TunnellTranslate.exists_sum_rational_translates hw F
    (fun j : ZMod N => -(j.val:ℚ)/N) (ZMod.dft.symm w)
  letI := hH
  have he' (z : ℍ) : G z = ∑ j : ZMod N, ZMod.dft.symm w j * F ((-(j.val:ℝ)/N)+ᵥ z) := by
    simpa only [Rat.cast_div,Rat.cast_natCast,Rat.cast_neg] using he z
  refine ⟨H,hH,hW,G,TunnellTwistFourier.twist_coefficients w hw hW F G he',?_⟩
  have hi (j : ZMod N) := (integrable_translate hw F (-(j.val:ℚ)/N)).const_mul (ZMod.dft.symm w j)
  rw [central_integral]
  simp_rw [he']
  rw [integral_finsetSum]
  · simp_rw [integral_const_mul]
    rw [Finset.mul_sum]
    exact Finset.sum_congr rfl (fun _ _ => by ring)
  · intro j _
    simpa only [Rat.cast_div,Rat.cast_natCast,Rat.cast_neg] using hi j

theorem gauss_sq {N : ℕ} [NeZero N] {χ : DirichletCharacter ℂ N}
    (hχ : χ.IsPrimitive) (hq : χ.IsQuadratic) (he : χ.Even) :
    gaussSum χ ZMod.stdAddChar ^ 2 = (N:ℂ) := by
  have h (k : ZMod N) := hχ.fourierTransform_eq_inv_mul_gaussSum k
  simp only [hq.inv,he.eval_neg] at h
  have h2 := congrFun (ZMod.dft_dft (χ : ZMod N → ℂ)) 1
  rw [funext h, ZMod.dft_mul_const] at h2
  dsimp only at h2
  rw [h] at h2
  simpa [pow_two,he.eval_neg] using h2

theorem primitive_weights {N : ℕ} [NeZero N] {χ : DirichletCharacter ℂ N}
    (hχ : χ.IsPrimitive) (hq : χ.IsQuadratic) (he : χ.Even) (j : ZMod N) :
    (gaussSum χ ZMod.stdAddChar) * ZMod.dft.symm (χ : ZMod N → ℂ) j = χ j := by
  rw [ZMod.invDFT_apply',hχ.fourierTransform_eq_inv_mul_gaussSum,neg_neg,hq.inv, smul_eq_mul]
  have h := gauss_sq hχ hq he
  field_simp [NeZero.ne (N:ℂ)]
  linear_combination χ j * h

end TunnellModularSymbol

end

section

namespace TunnellTwistCharacter

def weight (n m : ℕ) : ℤ := if Odd m then jacobiSym n m else 0

lemma weight_one (n : ℕ) : weight n 1 = 1 := by simp [weight]

lemma weight_mul (n a b : ℕ) : weight n (a*b) = weight n a * weight n b := by
  by_cases ha : Odd a <;> by_cases hb : Odd b <;> simp [weight, Nat.odd_mul, ha, hb]
  exact jacobiSym.mul_right' _ (fun e => by simp [e] at ha) (fun e => by simp [e] at hb)

lemma weight_mod (n m : ℕ) : weight n (m % (4*n)) = weight n m := by
  have he : Even (4*n) := Even.mul_right (by decide) _
  have h : Odd (m % (4*n)) ↔ Odd m := by
    simp only [Nat.odd_iff, Nat.mod_mod_of_dvd _ he.two_dvd]
  by_cases hm : Odd m
  · simpa [weight, h, hm] using (jacobiSym.mod_right' n hm).symm
  · simp [weight, h, hm]

lemma weight_periodic (n : ℕ) : Function.Periodic (weight n) (4*n) := by
  intro m
  rw [← weight_mod n (m+4*n), Nat.add_mod_right, weight_mod]

lemma weight_prime (n : ℕ) (p : Nat.Primes) [Fact p.val.Prime] (hp : p.val ≠ 2) :
    weight n p.val = quadraticChar (ZMod p.val) (n : ZMod p.val) := by
  have ho : Odd p.val := Nat.odd_iff.mpr (p.property.eq_two_or_odd.resolve_left hp)
  rw [weight, if_pos ho, ← jacobiSym.legendreSym.to_jacobiSym, legendreSym]
  simp

lemma weight_bad_prime (n : ℕ) (p : Nat.Primes) (hp : p.val ∣ 2*n) :
    weight n p.val = 0 := by
  letI : Fact p.val.Prime := ⟨p.property⟩
  by_cases h : p.val = 2
  · simp [weight, h]
  · have hd : p.val ∣ n := (p.property.dvd_mul.mp hp).resolve_left
      (fun e => h ((Nat.prime_dvd_prime_iff_eq p.property Nat.prime_two).mp e))
    rw [weight_prime n p h, (ZMod.natCast_eq_zero_iff n _).mpr hd, quadraticChar_zero]

lemma weight_zero_of_not_coprime (n m : ℕ) (h : ¬m.Coprime (4*n)) :
    weight n m = 0 := by
  by_cases hm : Odd m
  · letI : NeZero m := ⟨fun e => by simp [e] at hm⟩
    rw [weight, if_pos hm, jacobiSym.eq_zero_iff_not_coprime]
    intro h'
    apply h
    apply Nat.coprime_mul_iff_right.mpr
    constructor
    · exact hm.coprime_two_right.pow_right 2
    · apply Nat.Coprime.symm
      simpa [Nat.coprime_iff_gcd_eq_one, Int.gcd_eq_natAbs] using h'
  · simp [weight, hm]

noncomputable def character (n : ℕ) (hn : n ≠ 0) : DirichletCharacter ℂ (4*n) where
  toFun z := (weight n z.val : ℂ)
  map_one' := by rw [ZMod.val_one_eq_one_mod, weight_mod, weight_one]; norm_num
  map_mul' a b := by rw [ZMod.val_mul, weight_mod, weight_mul]; push_cast; rfl
  map_nonunit' a ha := by
    letI : NeZero (4*n) := ⟨Nat.mul_ne_zero (by decide) hn⟩
    have h : ¬a.val.Coprime (4*n) := fun hc => ha (by
      simpa [ZMod.natCast_zmod_val] using (ZMod.isUnit_iff_coprime _ _).mpr hc)
    rw [weight_zero_of_not_coprime n a.val h]
    norm_num

lemma character_apply_nat (n : ℕ) (hn : n ≠ 0) (m : ℕ) :
    character n hn (m : ZMod (4*n)) = (weight n m : ℂ) := by
  change (weight n (m : ZMod (4*n)).val : ℂ) = _
  rw [ZMod.val_natCast, weight_mod]

end TunnellTwistCharacter

end

section

/- The Jacobi character of conductor 8d, for squarefree d congruent to one modulo four. -/

namespace TunnellTwistCharacter

lemma character_quadratic (n : ℕ) (hn : n ≠ 0) : (character n hn).IsQuadratic := by
  intro a
  change (weight n a.val : ℂ) = 0 ∨ (weight n a.val : ℂ) = 1 ∨ (weight n a.val : ℂ) = -1
  by_cases ha : Odd a.val
  · rw [weight, if_pos ha]
    exact_mod_cast jacobiSym.trichotomy n a.val
  · simp [weight,ha]

lemma weight_two_mul {d a : ℕ} (hd : d%4=1) (ha : Odd a) :
    weight (2*d) a = ZMod.χ₈ a * jacobiSym a d := by
  rw [weight,if_pos ha,Nat.cast_mul,Nat.cast_ofNat,jacobiSym.mul_left,jacobiSym.at_two ha,
    jacobiSym.quadratic_reciprocity_one_mod_four hd ha]

lemma character_even {d : ℕ} (hd : d%4=1) :
    (character (2*d) (by omega)).Even := by
  let a := 8*d - 1
  have hz : (-1 : ZMod (4*(2*d))) = (a : ℕ) := by
    dsimp [a]
    rw [Nat.cast_sub (by omega), show 8*d = 4*(2*d) by ring]
    simp
  change character (2*d) _ (-1) = 1
  rw [hz, character_apply_nat, weight_two_mul hd (Nat.odd_iff.mpr (by dsimp [a]; omega))]
  have hj : jacobiSym (a:ℤ) d = jacobiSym (-1) d := by
    apply jacobiSym.mod_left'
    dsimp [a]
    rw [Nat.cast_sub (by omega)]
    push_cast
    apply Int.modEq_iff_dvd.mpr
    exact ⟨-8,by ring⟩
  rw [hj,jacobiSym.at_neg_one (Nat.odd_iff.mpr (by omega)),ZMod.χ₄_nat_mod_four,hd,
    ZMod.χ₈_nat_mod_eight, show a%8 = 7 by dsimp [a]; omega]
  exact_mod_cast (by decide : ZMod.χ₈ (7:ℕ) * ZMod.χ₄ (1:ℕ) = 1)

lemma primitive_of_witness {N : ℕ} [NeZero N] (χ : DirichletCharacter ℂ N)
    (hw : ∀ p : ℕ, p.Prime → p ∣ N → ∃ a : ℕ, a ≡ 1 [MOD N/p] ∧ χ a = -1) :
    χ.IsPrimitive := by
  change χ.conductor = N
  by_contra h
  obtain ⟨q,heq⟩ := χ.conductor_dvd_level
  have hq : q ≠ 1 := by rintro rfl; simp_all
  obtain ⟨p,hp,r,hr⟩ := Nat.exists_prime_and_dvd hq
  have hn : N = (χ.conductor*r)*p := heq.trans (by rw [hr]; ring)
  have hdiv : N/p = χ.conductor*r := (congrArg (· / p) hn).trans (Nat.mul_div_cancel _ hp.pos)
  obtain ⟨a,ha,hval⟩ := hw p hp (hn ▸ dvd_mul_left _ _)
  have hunit : IsUnit (a : ZMod N) := by
    by_contra hu
    rw [χ.map_nonunit hu] at hval
    norm_num at hval
  have hsmall : (a : ZMod χ.conductor) = 1 := by
    have h := ha.of_dvd (show χ.conductor ∣ N/p by rw [hdiv]; exact dvd_mul_right _ _)
    simpa only [Nat.cast_one] using (ZMod.natCast_eq_natCast_iff _ _ _).mpr h
  have hc := ((ZMod.isUnit_iff_coprime a N).mp hunit).isCoprime
  have hv := DirichletCharacter.changeLevel_eq_cast_of_dvd' χ.primitiveCharacter χ.conductor_dvd_level hc
  rw [χ.changeLevel_primitiveCharacter] at hv
  simp only [Int.cast_natCast] at hv
  rw [hsmall,map_one,hval] at hv
  norm_num at hv

lemma jacobi_congr {a b d : ℕ} (h : a ≡ b [MOD d]) : jacobiSym a d = jacobiSym b d := by
  apply jacobiSym.mod_left'
  exact_mod_cast h

lemma primitive_witness {d : ℕ} (hd : d%4=1) (hs : Squarefree d)
    {p : ℕ} (hp : p.Prime) (hpN : p ∣ 4*(2*d)) :
    ∃ a : ℕ, a ≡ 1 [MOD 4*(2*d)/p] ∧ weight (2*d) a = -1 := by
  have hd0 : 0 < d := by omega
  by_cases ht : p = 2
  · subst p
    refine ⟨4*d+1, ?_, ?_⟩
    · rw [show 4*(2*d)/2 = 4*d by omega]
      simp [Nat.ModEq]
    · rw [weight_two_mul hd (Nat.odd_iff.mpr (by omega)),ZMod.χ₈_nat_mod_eight,
        show (4*d+1)%8=5 by omega, jacobi_congr (b:=1) (by simp [Nat.ModEq]),
        Nat.cast_one,jacobiSym.one_left,mul_one]
      decide
  have h8 : p.Coprime 8 := by
    have hc := hp.coprime_iff_not_dvd.mpr (fun h => ht ((Nat.prime_dvd_prime_iff_eq hp Nat.prime_two).mp h))
    exact hc.pow_right 3
  have hpd : p ∣ d := (hp.dvd_mul.mp (show p ∣ 8*d by rwa [show 8*d = 4*(2*d) by ring])).resolve_left
    (hp.coprime_iff_not_dvd.mp h8)
  obtain ⟨v,hv⟩ := hpd
  have hpv : p.Coprime v := Nat.coprime_of_squarefree_mul (hv ▸ hs)
  have hv0 : v ≠ 0 := by rintro rfl; simp_all
  letI : Fact p.Prime := ⟨hp⟩
  obtain ⟨b,hb⟩ := quadraticChar_exists_neg_one (F := ZMod p) (by simpa only [ZMod.ringChar_zmod_n] using ht)
  obtain ⟨a,hab,ha1⟩ := Nat.chineseRemainder (Nat.coprime_mul_iff_right.mpr ⟨h8,hpv⟩) b.val 1
  have ht8 : a ≡ 1 [MOD 8] := ha1.of_dvd (dvd_mul_right ..)
  have hv1 : a ≡ 1 [MOD v] := ha1.of_dvd (dvd_mul_left ..)
  have ha : Odd a := Nat.odd_iff.mpr (ht8.of_dvd (by decide : 2 ∣ 8))
  have hj : jacobiSym a p = -1 := by
    rw [←jacobiSym.legendreSym.to_jacobiSym,legendreSym]
    simpa only [ZMod.natCast_eq_natCast_iff, Int.cast_natCast,
      (ZMod.natCast_eq_natCast_iff _ _ _).mpr hab,ZMod.natCast_zmod_val] using hb
  refine ⟨a, ?_, ?_⟩
  · convert ha1 using 1
    rw [hv,show 4*(2*(p*v)) = (8*v)*p by ring, Nat.mul_div_cancel _ hp.pos]
  · rw [weight_two_mul hd ha,ZMod.χ₈_nat_mod_eight,show a%8=1 from ht8,hv,
      jacobiSym.mul_right' _ hp.ne_zero hv0,hj,jacobi_congr hv1]
    simp

theorem character_primitive {d : ℕ} (hd : d%4=1) (hs : Squarefree d) :
    (character (2*d) (by omega)).IsPrimitive := by
  letI : NeZero (4*(2*d)) := ⟨by omega⟩
  apply primitive_of_witness
  intro p hp hpn
  obtain ⟨a,ha,hw⟩ := primitive_witness hd hs hp hpn
  refine ⟨a,ha,?_⟩
  rw [character_apply_nat,hw]
  norm_num


end TunnellTwistCharacter

end

section

/- Normalize the modular-symbol formula for the primitive positive even quadratic twists. -/

namespace TunnellModularSymbol

open MatrixGroups UpperHalfPlane MeasureTheory Set TunnellTwistCharacter
open scoped ModularForm

noncomputable def periodSymbol {Γ : Subgroup (GL (Fin 2) ℝ)} (F : CuspForm Γ 2) (r : ℝ) : ℂ :=
  (2*Real.pi:ℂ) * ∫ t in Ioi (0:ℝ), F (r +ᵥ ofComplex (Complex.I*t))

lemma reflected_symbol {Γ : Subgroup (GL (Fin 2) ℝ)} (F : CuspForm Γ 2)
    (hw : Γ.strictWidthInfty = 1) {N : ℕ} [NeZero N] (a : ZMod N) :
    periodSymbol F (-((-a).val:ℝ)/N) = periodSymbol F ((a.val:ℝ)/N) := by
  by_cases ha : a=0
  · simp [ha]
  have hN : (N:ℝ) ≠ 0 := NeZero.ne _
  have he : -((-a).val:ℝ)/N = -1 + (a.val:ℝ)/N := by
    rw [ZMod.neg_val,if_neg ha,Nat.cast_sub (ZMod.val_lt _).le]
    field_simp
    ring
  have hper : (-1:ℝ) ∈ Γ.strictPeriods :=
    Γ.strictPeriods.neg_mem (hw ▸ Γ.strictWidthInfty_mem_strictPeriods)
  simp only [he,periodSymbol, add_vadd, SlashInvariantForm.vAdd_apply_of_mem_strictPeriods F _ hper]

theorem scaled_twist_integral {N : ℕ} [NeZero N] {χ : DirichletCharacter ℂ N}
    (hχ : χ.IsPrimitive) (hq : χ.IsQuadratic) (he : χ.Even)
    {Γ : Subgroup (GL (Fin 2) ℝ)} [Γ.IsArithmetic] (hw : Γ.strictWidthInfty = 1)
    (F : CuspForm Γ 2) :
    ∃ (H : Subgroup (GL (Fin 2) ℝ)) (hH : H.IsArithmetic) (_ : H.strictWidthInfty = 1)
      (G : CuspForm H 2),
      (∀ m : ℕ, (qExpansion 1 G).coeff m = χ m * (qExpansion 1 F).coeff m) ∧
      gaussSum χ ZMod.stdAddChar * ModularForm.L (by decide : (0:ℤ)<2) G 1 =
        ∑ j : ZMod N, χ j * periodSymbol F ((j.val:ℝ)/N) := by
  obtain ⟨H,hH,hW,G,hcf,hV⟩ := twist_central_integral (χ : ZMod N → ℂ) hw F
  refine ⟨H,hH,hW,G,hcf,?_⟩
  rw [hV,Finset.mul_sum]
  simp_rw [←mul_assoc,primitive_weights hχ hq he]
  exact Fintype.sum_equiv (Equiv.neg _) _ _ (fun j => by
    simp only [Equiv.neg_apply,he.eval_neg]
    simpa only [neg_neg,periodSymbol,mul_assoc] using congrArg (χ j * ·) (reflected_symbol F hw (-j)))

theorem gauss_sign {N : ℕ} [NeZero N] {χ : DirichletCharacter ℂ N}
    (hχ : χ.IsPrimitive) (hq : χ.IsQuadratic) (he : χ.Even) :
    ∃ ε : ℤ, (ε=1 ∨ ε = -1) ∧ (Real.sqrt N:ℂ) = ε * gaussSum χ ZMod.stdAddChar := by
  have h := gauss_sq hχ hq he
  have hsq : (Real.sqrt N:ℂ)^2 = (N:ℂ) := by exact_mod_cast Real.sq_sqrt (Nat.cast_nonneg N : (0:ℝ) ≤ N)
  rcases sq_eq_sq_iff_eq_or_eq_neg.mp (hsq.trans h.symm) with e|e
  · exact ⟨1,Or.inl rfl,by simpa using e⟩
  · exact ⟨-1,Or.inr rfl,by simpa using e⟩

theorem jacobi_twist_integral {n : ℕ} (hn : n%8=2) (hs : Squarefree n)
    {Γ : Subgroup (GL (Fin 2) ℝ)} [Γ.IsArithmetic] (hw : Γ.strictWidthInfty = 1)
    (F : CuspForm Γ 2) :
    haveI : NeZero (4*n) := ⟨by omega⟩
    let χ := character n (by omega)
    ∃ (H : Subgroup (GL (Fin 2) ℝ)) (hH : H.IsArithmetic) (_ : H.strictWidthInfty = 1)
      (G : CuspForm H 2),
      (∀ m : ℕ, (qExpansion 1 G).coeff m = (weight n m:ℂ) * (qExpansion 1 F).coeff m) ∧
      gaussSum χ ZMod.stdAddChar * ModularForm.L (by decide : (0:ℤ)<2) G 1 =
        ∑ j : ZMod (4*n), (weight n j.val:ℂ) * periodSymbol F ((j.val:ℝ)/(4*n)) ∧
      gaussSum χ ZMod.stdAddChar ^ 2 = (4*n:ℂ) := by
  obtain ⟨d,hd⟩ : 2 ∣ n := by exact Nat.dvd_of_mod_eq_zero (by omega)
  subst n
  have hd4 : d%4=1 := by omega
  have hsd := hs.squarefree_of_dvd (dvd_mul_left d 2)
  letI : NeZero (4*(2*d)) := ⟨by omega⟩
  let χ := character (2*d) (by omega)
  let hh := character_primitive hd4 hsd
  let hq := character_quadratic (2*d) (by omega)
  let he := character_even hd4
  obtain ⟨H,hH,hW,G,hcf,hV⟩ := scaled_twist_integral hh hq he hw F
  refine ⟨H,hH,hW,G,fun m => ?_,?_,?_⟩
  · simpa only [character_apply_nat] using hcf m
  · have hc (j : ZMod (4*(2*d))) : character (2*d) (by omega) j = (weight (2*d) j.val:ℂ) := rfl
    simpa only [Nat.cast_mul,Nat.cast_ofNat,hc] using hV
  · simpa only [Nat.cast_mul,Nat.cast_ofNat] using gauss_sq hh hq he

theorem rational_period_of_paired_symbols {n : ℕ} (hn : n%8=2) (hs : Squarefree n)
    {Γ : Subgroup (GL (Fin 2) ℝ)} [Γ.IsArithmetic] (hw : Γ.strictWidthInfty=1)
    (F : CuspForm Γ 2) (Ω : ℂ)
    (hper : ∀ r : ℚ, ∃ c : ℚ, periodSymbol F (r:ℝ) + periodSymbol F (-(r:ℝ)) = c*Ω) :
    ∃ (H : Subgroup (GL (Fin 2) ℝ)) (hH : H.IsArithmetic) (_ : H.strictWidthInfty=1)
      (G : CuspForm H 2) (c : ℚ),
      (∀ m : ℕ, (qExpansion 1 G).coeff m = (weight n m:ℂ) * (qExpansion 1 F).coeff m) ∧
      (Real.sqrt n:ℂ)*ModularForm.L (by decide : (0:ℤ)<2) G 1 = c*Ω := by
  classical
  obtain ⟨d,hd⟩ : 2 ∣ n := by exact Nat.dvd_of_mod_eq_zero (by omega)
  subst n
  have hd4 : d%4=1 := by omega
  have hsd := hs.squarefree_of_dvd (dvd_mul_left d 2)
  let n := 2*d
  let χ := character n (by dsimp [n]; omega)
  letI : NeZero (4*n) := ⟨by dsimp [n]; omega⟩
  have he : χ.Even := character_even hd4
  obtain ⟨ε,hε,hg⟩ := gauss_sign (character_primitive hd4 hsd) (character_quadratic n _) he
  obtain ⟨H,hH,hW,G,hcf,hV,_⟩ := jacobi_twist_integral hn hs hw F
  let P (j : ZMod (4*n)) := periodSymbol F ((j.val:ℝ)/(4*n))
  let M (j : ZMod (4*n)) := periodSymbol F (-(j.val:ℝ)/(4*n))
  have hsym : ∑ j, χ j * P j = ∑ j, χ j * M j := by
    apply Fintype.sum_equiv (Equiv.neg _)
    intro j
    rw [Equiv.neg_apply,he.eval_neg]
    congr 1
    simpa only [P,M,Nat.cast_mul,Nat.cast_ofNat] using (reflected_symbol F hw j).symm
  choose c hc using hper
  let r (j : ZMod (4*n)) : ℚ := (j.val:ℚ)/(4*n)
  let C : ℚ := ∑ j : ZMod (4*n), (weight n j.val:ℚ)*c (r j)
  have hc' (j : ZMod (4*n)) : P j + M j = (c (r j):ℂ)*Ω := by
    simpa only [P,M,r,Rat.cast_div,Rat.cast_natCast,Rat.cast_mul,Rat.cast_ofNat,neg_div]
      using hc (r j)
  have hC : (2:ℂ) * (∑ j, χ j*P j) = C*Ω := by
    calc _ = (∑ j, χ j*P j) + ∑ j, χ j*M j := by rw [←hsym,two_mul]
         _ = ∑ j, χ j*(P j+M j) := by simp [mul_add,Finset.sum_add_distrib]
         _ = _ := by
           simp only [hc',C,Rat.cast_sum,Rat.cast_mul,Rat.cast_intCast,Finset.sum_mul,mul_assoc]
           rfl
  have hv : gaussSum χ ZMod.stdAddChar * ModularForm.L (by decide : (0:ℤ)<2) G 1 = ∑ j, χ j*P j := hV
  have hgs : (2:ℂ)*(Real.sqrt n:ℂ) = ε * gaussSum χ ZMod.stdAddChar := by
    have heq : (Real.sqrt (((4*n:ℕ):ℝ)):ℂ) = 2*(Real.sqrt n:ℂ) := by
      rw [Nat.cast_mul,Nat.cast_ofNat,Real.sqrt_mul (by norm_num : (0:ℝ) ≤ 4), Complex.ofReal_mul]
      norm_num
    rw [←heq]
    exact hg
  refine ⟨H,hH,hW,G,((ε:ℚ)*C/4),hcf,?_⟩
  change (Real.sqrt n:ℂ) * _ = _
  push_cast
  linear_combination (ModularForm.L (by decide : (0:ℤ)<2) G 1 / 2)*hgs +
    (ε:ℂ)/2*hv + (ε:ℂ)/4*hC


end TunnellModularSymbol

end

section

/- Generation of all rational cusps by translation and the level-two Fricke involution. -/

namespace TunnellFrickeOrbit

theorem rational_cusps (P : ℚ → Prop) (hzero : P 0)
    (hT : ∀ x k, P x → P (x + (k:ℤ)))
    (hW : ∀ x, x ≠ 0 → P x → P (-1/(2*x))) (x : ℚ) : P x := by
  have hnegHalf : P (-1/2) := by
    simpa using hW 1 one_ne_zero (by simpa using hT 0 1 hzero)
  have hfrac (d : ℕ) : ∀ a : ℤ, 0<d → P ((a:ℚ)/d) := by
    induction d using Nat.strong_induction_on with
    | h d ih =>
      intro a hd
      let r := a.bmod d
      have hdq : (d:ℚ) ≠ 0 := by positivity
      have bound := (Int.bmod_eq_iff (a:=a) hd).mp (rfl : a.bmod d = r)
      have eqr : (a:ℚ)/d = (r:ℚ)/d + (a.bdiv d:ℚ) := by
        field_simp
        exact_mod_cast (Int.bmod_add_bdiv a d).symm
      rw [eqr]
      apply hT
      by_cases hr0 : r = 0
      · simpa [hr0] using hzero
      have hrq : (r:ℚ) ≠ 0 := by exact_mod_cast hr0
      by_cases hedge : 2*r = -(d:ℤ)
      · have e : (r:ℚ)/d = -1/2 := by
          have hh : 2*(r:ℚ) = -(d:ℚ) := by exact_mod_cast hedge
          field_simp
          linarith
        rwa [e]
      have hsmall : 2*r.natAbs < d := by omega
      have hpos : 0<2*r.natAbs := by omega
      by_cases hrpos : 0 ≤ r
      · have ee : (r.natAbs : ℚ) = r := by
          have e : (r.natAbs : ℤ) = r := by omega
          simpa only [Int.cast_natCast] using congrArg (fun a : ℤ => (a:ℚ)) e
        have hh := ih (2*r.natAbs) hsmall (-(d:ℤ)) hpos
        rw [Nat.cast_mul,Nat.cast_two,ee,Int.cast_neg,Int.cast_natCast] at hh
        convert hW _ (div_ne_zero (neg_ne_zero.mpr hdq) (mul_ne_zero (by norm_num) hrq)) hh using 1 <;> field_simp <;> ring
      · have ee : (r.natAbs : ℚ) = -r := by
          have e : (r.natAbs : ℤ) = -r := by omega
          simpa only [Int.cast_natCast,Int.cast_neg] using congrArg (fun a : ℤ => (a:ℚ)) e
        have hh := ih (2*r.natAbs) hsmall (d:ℤ) hpos
        rw [Nat.cast_mul,Nat.cast_two,ee,Int.cast_natCast] at hh
        convert hW _ (div_ne_zero hdq (mul_ne_zero (by norm_num) (neg_ne_zero.mpr hrq))) hh using 1 <;> field_simp <;> ring
  simpa only [Rat.num_div_den] using hfrac x.den x.num x.den_pos

noncomputable def integralMultiple (a b : ℂ) : Prop := ∃ c : GaussianInt, a = (c:ℂ)*b

theorem symbols_are_gaussian_multiples (J : ℚ → ℂ)
    (hT : ∀ x (k : ℤ), ∃ u : GaussianInt, J (x+k) = (u:ℂ)*J x)
    (hW : ∀ x, x≠0 → J (-1/(2*x)) = J 0-J x) (x : ℚ) :
    integralMultiple (J x) (J 0) := by
  apply rational_cusps (fun q => integralMultiple (J q) (J 0)) _ _ _ x
  · exact ⟨1,by simp⟩
  · rintro q k ⟨b,hb⟩
    obtain ⟨a,ha⟩ := hT q k
    exact ⟨a*b,by rw [ha,hb]; simp [mul_assoc]⟩
  · rintro q hq ⟨a,ha⟩
    exact ⟨1-a,by rw [hW q hq,ha]; rw [map_sub,map_one]; ring⟩

end TunnellFrickeOrbit

end

section

/- Boundary values of the conductor-32 primitive at all rational cusps. -/

namespace TunnellFricke

open Complex Function Filter Set
open UpperHalfPlane hiding I
open scoped Topology

noncomputable def height (r : ℝ) (z : ℂ) : ℝ := z.im / normSq (z-r)

noncomputable def cusp (r : ℝ) : Filter ℂ := comap (height r) atTop

lemma eventually_upper (r : ℝ) : ∀ᶠ z in cusp r, 0<z.im := by
  filter_upwards [(tendsto_comap (f:=height r) (x:=atTop)).eventually (eventually_gt_atTop 0)] with z hz
  exact (div_pos_iff.mp hz).elim (fun h => h.1) (fun h => False.elim ((normSq_nonneg _).not_gt h.2))

lemma W_involution {z : ℂ} (hz : z ≠ 0) : W (W z) = z := by
  unfold W
  field_simp

lemma W_im (z : ℂ) : (W z).im = height 0 z / 2 := by
  simp [W,height,Complex.div_im,Complex.mul_im,Complex.normSq_mul,pow_two]
  ring

lemma height_add (r t : ℝ) (z : ℂ) : height (r+t) (z+t) = height r z := by
  simp [height,add_sub_add_right_eq_sub]

lemma height_W (r : ℝ) (hr : r≠0) (z : ℂ) (hz : 0<z.im) :
    height (-1/(2*r)) (W z) = 2*r^2*height r z := by
  have hz0 := ne_zero (⟨z,hz⟩:ℍ)
  have hrC : (r:ℂ) ≠ 0 := ofReal_ne_zero.mpr hr
  have hz' : z-(r:ℂ)≠0 := by
    intro he
    have e := congrArg Complex.im (sub_eq_zero.mp he)
    simp at e
    linarith
  have dif : W z - ((-1/(2*r):ℝ):ℂ) = (z-r)/(2*z*r) := by
    unfold W
    push_cast
    field_simp
    ring
  rw [height,W_im,dif,normSq_div,height,height]
  simp only [ofReal_zero,sub_zero,map_mul,normSq_ofReal]
  field_simp [Complex.normSq_eq_zero.not.mpr hz0,Complex.normSq_eq_zero.not.mpr hz',hr]
  norm_num [normSq_apply]
  <;> ring

lemma move_W (r : ℝ) (hr : r≠0) : Tendsto W (cusp r) (cusp (-1/(2*r))) := by
  apply tendsto_comap_iff.mpr
  apply Tendsto.congr' _ (tendsto_comap (f:=height r) (x:=atTop) |>.const_mul_atTop (show 0<2*r^2 by positivity))
  filter_upwards [eventually_upper r] with z hz
  exact (height_W r hr z hz).symm

lemma move_add (r t : ℝ) : Tendsto (fun z : ℂ => z+t) (cusp r) (cusp (r+t)) := by
  apply tendsto_comap_iff.mpr
  exact tendsto_comap.congr (fun z => (height_add r t z).symm)

lemma move_zero : Tendsto W (cusp 0) (comap Complex.im atTop) := by
  apply tendsto_comap_iff.mpr
  exact ((tendsto_comap (f:=height 0) (x:=atTop)).atTop_mul_const (by norm_num : (0:ℝ)<2⁻¹)).congr (fun z => by simp [Function.comp_def,W_im,div_eq_mul_inv])

lemma integer_steps (P : ℚ → Prop)
    (hp : ∀ x, P x → P (x+1)) (hm : ∀ x, P x → P (x-1))
    (x : ℚ) (k : ℤ) (hx : P x) : P (x+k) := by
  induction k using Int.induction_on with
  | zero => simpa using hx
  | succ i ih => simpa [Int.cast_add,add_assoc] using hp (x+i) ih
  | pred i ih => simpa [Int.cast_sub,sub_eq_add_neg,add_assoc] using hm (x+(-(i:ℤ):ℚ)) ih

noncomputable def gi : GaussianInt := ⟨0,1⟩
lemma coe_gi : (gi:ℂ) = I := by simp [gi,GaussianInt.toComplex_def]

def Bound (J : ℂ → ℂ) (C : ℂ) (x : ℚ) (a : GaussianInt) : Prop :=
  Tendsto J (cusp x) (𝓝 ((a:ℂ)*C))

theorem cusp_rules {J : ℂ → ℂ} {C : ℂ}
    (h0 : Tendsto J (comap Complex.im atTop) (𝓝 0))
    (hT : ∀ z, 0<z.im → J (z+1) = I*J z)
    (hW : ∀ z, 0<z.im → J (W z) = C-J z) :
    Bound J C 0 1 ∧
    (∀ x a, Bound J C x a → Bound J C (x+1) (gi*a)) ∧
    (∀ x a, Bound J C x a → Bound J C (x-1) (-gi*a)) ∧
    (∀ x, x≠0 → ∀ a, Bound J C x a → Bound J C (-1/(2*x)) (1-a)) := by
  unfold Bound
  refine ⟨?_,?_,?_,?_⟩
  · simp only [map_one,one_mul,Rat.cast_zero]
    have ht := tendsto_const_nhds (x:=C) |>.sub (h0.comp move_zero)
    rw [sub_zero] at ht
    apply ht.congr'
    filter_upwards [eventually_upper 0] with z hz
    simp [Function.comp_def,hW z hz]
  · intro x a ha
    simp only [Rat.cast_add,Rat.cast_one,map_mul,coe_gi,mul_assoc]
    have ht := move_add ((x:ℝ)+1) (-1)
    simp only [add_neg_cancel_right] at ht
    apply (ha.comp ht |>.const_mul I).congr'
    filter_upwards [eventually_upper ((x:ℝ)+1)] with z hz
    have he := hT (z-1) (by simpa using hz)
    simpa [Function.comp_def,sub_eq_add_neg] using he.symm
  · intro x a ha
    simp only [Rat.cast_sub,Rat.cast_one,map_mul,map_neg,coe_gi,mul_assoc]
    have ht := move_add ((x:ℝ)-1) 1
    simp only [sub_add_cancel] at ht
    apply (ha.comp ht |>.const_mul (-I)).congr'
    filter_upwards [eventually_upper ((x:ℝ)-1)] with z hz
    change (-I)*J (z+(1:ℝ)) = J z
    simp [hT z hz,← mul_assoc]
  · intro x hx a ha
    have hr : (x:ℝ) ≠ 0 := by exact_mod_cast hx
    have ht := move_W (-1/(2*(x:ℝ))) (by positivity)
    rw [show -1 / (2 * (-1/(2*(x:ℝ)))) = x by field_simp] at ht
    simp only [Rat.cast_div,Rat.cast_neg,Rat.cast_one,Rat.cast_mul,Rat.cast_ofNat,map_sub,map_one,sub_mul,one_mul]
    apply (tendsto_const_nhds (x:=C) |>.sub (ha.comp ht)).congr'
    filter_upwards [eventually_upper (-1/(2*(x:ℝ)))] with z hz
    simp [Function.comp_def,hW z hz]


theorem paired_cusp_values {J : ℂ → ℂ} {C : ℂ}
    (h0 : Tendsto J (comap Complex.im atTop) (𝓝 0))
    (hT : ∀ z, 0<z.im → J (z+1) = I*J z)
    (hW : ∀ z, 0<z.im → J (W z) = C-J z) (r : ℚ) :
    ∃ a : GaussianInt, Bound J C r a ∧ Bound J C (-r) (star a) := by
  obtain ⟨hz,hp,hm,hw⟩ := cusp_rules h0 hT hW
  have hi : star gi = -gi := by rfl
  apply TunnellFrickeOrbit.rational_cusps (fun x => ∃ a : GaussianInt, Bound J C x a ∧ Bound J C (-x) (star a)) _ _ _ r
  · exact ⟨1,hz,by simpa using hz⟩
  · apply integer_steps
    · rintro x ⟨a,h,k⟩
      refine ⟨gi*a,hp x a h,?_⟩
      simpa [star_mul,hi,mul_comm,add_comm,sub_eq_add_neg] using hm (-x) (star a) k
    · rintro x ⟨a,h,k⟩
      refine ⟨-gi*a,hm x a h,?_⟩
      simpa [star_mul,hi,mul_comm,add_comm,sub_eq_add_neg] using hp (-x) (star a) k
  · rintro x hx ⟨a,h,k⟩
    refine ⟨1-a,hw x hx a h,?_⟩
    simpa [div_eq_mul_inv] using hw (-x) (neg_ne_zero.mpr hx) (star a) k

end TunnellFricke

end

section

/- The actual paired vertical integrals are integral multiples of the base central value. -/


namespace TunnellFricke

open Complex Filter Set MeasureTheory TunnellModularSymbol
open UpperHalfPlane hiding I
open scoped Topology

noncomputable def path (r : ℝ) (t : ℂ) := 4*((r:ℂ)+I*t)

lemma path_im (r t : ℝ) : (path r t).im = 4*t := by simp [path,mul_im]

lemma tendsto_path_bottom (r : ℝ) :
    Tendsto (fun t : ℝ => path r t) (𝓝[>] 0) (cusp (4*r)) := by
  apply tendsto_comap_iff.mpr
  apply Tendsto.congr' _ (tendsto_inv_nhdsGT_zero |>.const_mul_atTop (by norm_num : (0:ℝ)<1/4))
  filter_upwards [self_mem_nhdsWithin] with t ht
  change (1/4)*t⁻¹ = height (4*r) (path r t)
  rw [height,path_im,show path r t-(↑(4*r):ℂ) = 4*I*t by simp [path,mul_add,mul_assoc]]
  simp only [map_mul,normSq_I,normSq_ofReal]
  norm_num [normSq_apply]
  have ht' : 0<t := ht
  field_simp <;> norm_num

lemma tendsto_path_top (r : ℝ) :
    Tendsto (fun t : ℝ => path r t) atTop (comap Complex.im atTop) := by
  apply tendsto_comap_iff.mpr
  simpa only [Function.comp_def,path_im,id_eq] using
    (tendsto_id (α:=ℝ) (x:=atTop)).const_mul_atTop (by norm_num : (0:ℝ)<4)

lemma path_deriv (r : ℝ) (z : ℂ) : HasDerivAt (path r) (4*I) z := by
  unfold path
  simpa using (((hasDerivAt_id z).const_mul I).const_add (r:ℂ)).const_mul 4

theorem symbol_eq_boundary {Γ : Subgroup (GL (Fin 2) ℝ)} [Γ.IsArithmetic]
    (hw : Γ.strictWidthInfty=1) (F : CuspForm Γ 2)
    (hF : ∀ z : ℍ, F z = h (4*(z:ℂ))) (r : ℚ) {J : ℂ → ℂ} {A : ℂ}
    (hJ : ∀ z, 0<z.im → HasDerivAt J (c*h z) z)
    (h0 : Tendsto J (comap Complex.im atTop) (𝓝 0))
    (hb : Tendsto J (cusp (4*(r:ℝ))) (𝓝 A)) : periodSymbol F r = A := by
  let f (t : ℝ) := F ((r:ℝ) +ᵥ ofComplex (I*t))
  let g (t : ℝ) := if t=0 then A else J (path r t)
  have hfall (t : ℝ) (ht : 0<t) : f t = h (path r t) := by
    unfold f
    rw [hF,coe_vadd,ofComplex_apply_of_im_pos (by simpa using ht)]
    rfl
  have hder (t : ℝ) (ht : 0<t) : HasDerivAt g (-(2*(Real.pi:ℂ))*f t) t := by
    have hd := (hJ (path r t) (by rw [path_im]; positivity)).comp (t:ℂ) (path_deriv r t) |>.comp_ofReal
    have hh : c*h (path r t)*(4*I) = -(2*(Real.pi:ℂ))*f t := by
      rw [hfall t ht,c]
      linear_combination (2*(Real.pi:ℂ)*h (path r t))*I_sq
    rw [hh] at hd
    apply hd.congr_of_eventuallyEq
    filter_upwards [eventually_ne_nhds ht.ne'] with u hu
    simp [g,hu,Function.comp_def]
  have hg : ContinuousWithinAt g (Ici 0) 0 := by
    rw [← continuousWithinAt_Ioi_iff_Ici]
    change Tendsto g _ (𝓝 (g 0))
    simp only [g,if_pos rfl]
    apply (hb.comp (tendsto_path_bottom r)).congr'
    filter_upwards [self_mem_nhdsWithin] with t ht
    simp [ne_of_gt (show 0<t from ht)]
  have hg' : Tendsto g atTop (𝓝 0) := by
    apply (h0.comp (tendsto_path_top r)).congr'
    filter_upwards [eventually_gt_atTop 0] with t ht
    simp [g,ht.ne',Function.comp_def]
  have hi : IntegrableOn f (Ioi 0) := integrable_translate hw F r
  have e := integral_Ioi_of_hasDerivAt_of_tendsto hg hder (hi.const_mul (-(2*(Real.pi:ℂ)))) hg'
  rw [integral_const_mul,show g 0 = A by simp [g],zero_sub] at e
  change 2*(Real.pi:ℂ)*(∫ t in Ioi (0:ℝ), f t) = A
  linear_combination -e

theorem paired_symbols {Γ : Subgroup (GL (Fin 2) ℝ)} [Γ.IsArithmetic]
    (hw : Γ.strictWidthInfty=1) (F : CuspForm Γ 2)
    (hF : ∀ z : ℍ, F z = h (4*(z:ℂ))) (r : ℚ) :
    ∃ m : ℤ, periodSymbol F r + periodSymbol F (-(r:ℝ)) = m*periodSymbol F 0 := by
  obtain ⟨J,hJ,h0,hT,C,hW⟩ := primitive
  obtain ⟨a,ha,hb⟩ := paired_cusp_values h0 hT hW (4*r)
  obtain ⟨hz,_,_,_⟩ := cusp_rules h0 hT hW
  have e₀ := symbol_eq_boundary hw F hF 0 hJ h0 (A:=C) (by simpa [Bound] using hz)
  have e₁ := symbol_eq_boundary hw F hF r hJ h0 (A:=(a:ℂ)*C) (by simpa [Bound] using ha)
  have e₂ := symbol_eq_boundary hw F hF (-r) hJ h0 (A:=(star a:ℂ)*C) (by simpa [Bound] using hb)
  simp only [Rat.cast_neg,Rat.cast_zero] at e₂ e₀
  refine ⟨2*a.re,?_⟩
  rw [e₀,e₁,e₂,← add_mul]
  congr 1
  simp [GaussianInt.toComplex_def]
  ring

end TunnellFricke

end

section

/- Algebraicity of every normalized positive even twist relative to one explicit eta integral. -/

namespace TunnellFricke

open MeasureTheory Set TunnellCMLSeries TunnellGaussian TunnellModularSymbol Finset
open UpperHalfPlane hiding I

noncomputable def baseConstant : ℂ :=
  (2*Real.pi:ℂ) * ∫ t in Ioi (0:ℝ), h (4*(Complex.I*t))

lemma zero_symbol {Γ : Subgroup (GL (Fin 2) ℝ)} (F : CuspForm Γ 2)
    (hF : ∀ z : ℍ, F z = h (4*(z:ℂ))) : periodSymbol F 0 = baseConstant := by
  unfold periodSymbol baseConstant
  congr 1
  apply setIntegral_congr_fun measurableSet_Ioi
  intro t ht
  simp only [zero_vadd,hF,ofComplex_apply_of_im_pos (by simpa using ht : 0<(Complex.I*(t:ℂ)).im)]

theorem normalized_twists (n : ℕ) (hn : n%8=2) (hs : Squarefree n) (L : ℂ → ℂ)
    (he : AnalyticOnNhd ℂ L univ) (hprod : ∀ s : ℝ, 2<s →
      HasProd (fun p : Nat.Primes => if p.val ∣ 2*n then (1:ℂ) else
        let T := (p.val:ℂ)^(-(s:ℂ))
        (1-(curveTrace n p:ℂ)*T+(p.val:ℂ)*T^2)⁻¹) (L s)) :
    ∃ c : ℚ, (Real.sqrt n:ℂ)*L 1 = c*baseConstant := by
  obtain ⟨H,hH,hw,F,hF,hfc⟩ := TunnellEtaValue.actual_form
  letI : H.IsArithmetic := hH
  have hper (r : ℚ) : ∃ c : ℚ, periodSymbol F (r:ℝ)+periodSymbol F (-(r:ℝ)) = c*baseConstant := by
    obtain ⟨m,hm⟩ := paired_symbols hw F hF r
    exact ⟨m,by simpa only [Rat.cast_intCast,zero_symbol F hF] using hm⟩
  obtain ⟨K,hK,kw,G,r,ht,hr⟩ := rational_period_of_paired_symbols hn hs hw F baseConstant hper
  letI : K.IsArithmetic := hK
  let M := ModularForm.L (by decide : (0:ℤ)<2) G
  have a (m : ℕ) : (qExpansion 1 G).coeff m = gaussCoeff n m := by
    rw [ht,hfc,TunnellArithmetic.eta_eq_mass
      (TunnellTruncated.cubic_congruence (fun N => TunnellCubicFinite.cubic (Polynomial.X^8) N))
      (TunnellTruncated.theta_congruence (fun d N =>
        TunnellBalanced.balanced (TunnellTruncated.trunc d (Polynomial.X^4)) N))]
    rfl
  have hM : AnalyticOnNhd ℂ M univ := fun z _ =>
    (CuspForm.differentiable_L (by decide : (0:ℤ)<2) G).analyticAt z
  have eqM := TunnellMellin.entire_unique he hM 2 (fun s hgt => by
    have hl := (hprod s hgt).unique (lattice_euler n s (by linarith))
    have hsum : HasSum (fun m : ℕ => gaussCoeff n m / (m:ℂ)^(s:ℂ)) (M s) := by
      have h := CuspForm.hasSum_L (by decide : (0:ℤ)<2) G (s:=(s:ℂ)) (by norm_num; linarith)
      simpa only [kw,Complex.ofReal_one,Complex.one_cpow,one_mul,a,M] using h
    exact hl.trans ((shell_expansion n s (by linarith)).unique hsum))
  exact ⟨r,eqM ▸ hr⟩

end TunnellFricke

end

section

/- # The real-period integral for the congruent-number family -/

namespace TunnellPeriodCoates

open MeasureTheory Set Filter
open scoped Topology

noncomputable def realPeriod (n : ℝ) : ℝ :=
  ∫ x in Ioi n, (Real.sqrt (x^3-n^2*x))⁻¹

end TunnellPeriodCoates

end

section

/- Identification of the Fermat-quartic differential with the real period of y²=x³−x. -/

namespace TunnellPeriodCoates

open MeasureTheory Set

theorem realPeriod_fermat :
    realPeriod 1 = ∫ u in Ioo (0:ℝ) 1, (1-u^2)^(-(3/4):ℝ) := by
  let f (u : ℝ) := (1-u^2)^(-(1/2):ℝ)
  let D (u : ℝ) := u*(1-u^2)^(-(3/2):ℝ)
  have pos {u : ℝ} (hu : u∈Ioo 0 1) : 0<1-u^2 := by nlinarith [mul_pos (sub_pos.mpr hu.2) (by linarith [hu.1] : 0<1+u)]
  have hd {u : ℝ} (hu : u∈Ioo 0 1) : HasDerivAt f (D u) u := by
    have h := (((hasDerivAt_id u).pow 2).const_sub 1).rpow_const (p:=-(1/2:ℝ)) (Or.inl (pos hu).ne')
    change HasDerivAt f (-(2*u^1*1)* -(1/2)*(1-u^2)^(-(1/2:ℝ)-1)) u at h
    rw [show -(1/2:ℝ)-1= -(3/2) by norm_num,show -(2*u^1*1)* -(1/2)=u by ring] at h
    exact h
  have hi : StrictMonoOn f (Ioo 0 1) := by
    intro u hu v hv huv
    exact (Real.rpow_lt_rpow_iff_of_neg (pos hu) (pos hv) (by norm_num : -(1/2:ℝ)<0)).mpr (by nlinarith [mul_pos (sub_pos.mpr huv) (add_pos hu.1 hv.1)])
  have him : f '' (Ioo 0 1) = Ioi 1 := by
    ext x
    constructor
    · rintro ⟨u,hu,rfl⟩
      exact Real.one_lt_rpow_of_pos_of_lt_one_of_neg (pos hu) (by nlinarith [sq_pos_of_pos hu.1]) (by norm_num)
    · intro hx
      change 1<x at hx
      let v := x ^ (-2:ℝ)
      have hv : 0<v := Real.rpow_pos_of_pos (by linarith) _
      have hv1 : v<1 := Real.rpow_lt_one_of_one_lt_of_neg hx (by norm_num)
      have he := Real.sq_sqrt (sub_pos.mpr hv1).le
      refine ⟨Real.sqrt (1-v),⟨Real.sqrt_pos.mpr (sub_pos.mpr hv1),by nlinarith [Real.sqrt_nonneg (1-v)]⟩,?_⟩
      dsimp only [f]
      rw [he,sub_sub_cancel]
      dsimp only [v]
      rw [← Real.rpow_mul (by linarith : 0≤x)]
      norm_num
  let g (x : ℝ) := (Real.sqrt (x^3-x))⁻¹
  have e := integral_image_eq_integral_abs_deriv_smul measurableSet_Ioo (fun x hx => (hd hx).hasDerivWithinAt) hi.injOn g
  change (∫ x in Ioi 1, (Real.sqrt (x^3-(1:ℝ)^2*x))⁻¹) = _
  simp only [one_pow,one_mul]
  change (∫ x in Ioi 1, g x) = _
  rw [← him,e]
  apply setIntegral_congr_fun measurableSet_Ioo
  intro u hu
  let v := 1-u^2
  have hv : 0<v := pos hu
  have hpow (k : ℕ) : (f u)^k = v^(-(1/2:ℝ)*k) := by
    rw [← Real.rpow_natCast,← Real.rpow_mul hv.le]
  have hmul : f u ^2*v=1 := by
    rw [hpow,show -(1/2:ℝ)*(2:ℕ) = -1 by norm_num,Real.rpow_neg_one,inv_mul_cancel₀ hv.ne']
  have hcube : f u ^3 - f u = (f u)^3*u^2 := by
    dsimp [v] at hmul
    linear_combination (f u)*hmul
  have hc : Real.sqrt ((f u)^3) = v^(-(3/4):ℝ) := by
    rw [hpow,Real.sqrt_eq_rpow,← Real.rpow_mul hv.le]
    norm_num
  have hD : 0≤D u := mul_nonneg hu.1.le (Real.rpow_nonneg hv.le _)
  change |D u| * (Real.sqrt ((f u)^3-f u))⁻¹ = _
  rw [abs_of_nonneg hD,hcube,Real.sqrt_mul (by have : 0<f u := Real.rpow_pos_of_pos hv _; positivity),hc,Real.sqrt_sq hu.1.le]
  change u * v^(-(3/2):ℝ) * (v^(-(3/4):ℝ)*u)⁻¹ = v^(-(3/4):ℝ)
  have hp : 0 < v^(-(3/4):ℝ) := Real.rpow_pos_of_pos hv _
  have he : v^(-(3/2):ℝ) = v^(-(3/4):ℝ)*v^(-(3/4):ℝ) := by
    rw [← Real.rpow_add hv]
    norm_num
  rw [he]
  field_simp [hu.1.ne',hp.ne']

open Filter
open scoped Topology

theorem realPeriod_of_fermat_parameter {f X : ℝ → ℝ}
    (hf : ∀ t, 0<t → 0<f t) (hX : ∀ t, 0<t → X t∈Ioo 0 1)
    (hd : ∀ t, 0<t → HasDerivAt X (-8*Real.pi*f t*(1-X t^2)^(3/4:ℝ)) t)
    (hzero : Tendsto X (𝓝[>] 0) (𝓝 1)) (htop : Tendsto X atTop (𝓝 0)) :
    (2*Real.pi)*(∫ t in Ioi (0:ℝ), f t) = realPeriod 1/4 := by
  let d t := -8*Real.pi*f t*(1-X t^2)^(3/4:ℝ)
  have hpos {t : ℝ} (ht : 0<t) : 0<1-X t^2 := by
    have h := hX t ht
    nlinarith [mul_pos (sub_pos.mpr h.2) (by linarith [h.1] : 0<1+X t)]
  have hneg {t : ℝ} (ht : 0<t) : d t < 0 := by
    dsimp [d]
    have := hf t ht
    have := hpos ht
    have HH : 0<8*Real.pi*f t*(1-X t^2)^(3/4:ℝ) := by positivity
    linarith
  have hc : ContinuousOn X (Ioi 0) := fun t ht => (hd t ht).continuousAt.continuousWithinAt
  have ha := strictAntiOn_of_deriv_neg (convex_Ioi (0:ℝ)) hc (fun t ht =>
    (hd t (interior_subset ht)).deriv ▸ hneg (interior_subset ht))
  have him : X '' Ioi 0 = Ioo 0 1 := by
    refine Subset.antisymm ?_ ?_
    · rintro x ⟨t,ht,rfl⟩
      exact hX t ht
    apply isPreconnected_Ioi.intermediate_value_Ioo _ _ hc htop hzero
    · exact Filter.le_principal_iff.mpr (Ioi_mem_atTop 0)
    · exact inf_le_right
  have he := integral_image_eq_integral_abs_deriv_smul measurableSet_Ioi
    (fun t ht => (hd t ht).hasDerivWithinAt) ha.injOn (fun u : ℝ => (1-u^2)^(-(3/4):ℝ))
  rw [him,← realPeriod_fermat] at he
  have ei : realPeriod 1 = (8*Real.pi)*(∫ t in Ioi (0:ℝ), f t) := by
    rw [he,← integral_const_mul]
    apply setIntegral_congr_fun measurableSet_Ioi
    intro t ht
    change |d t| * (1-X t^2)^(-(3/4):ℝ) = _
    rw [abs_of_neg (hneg ht),Real.rpow_neg (hpos ht).le]
    have H : (1-X t^2)^(3/4:ℝ) ≠ 0 := (Real.rpow_pos_of_pos (hpos ht) _).ne'
    dsimp [d]
    field_simp
    <;> ring
  rw [ei]
  ring

end TunnellPeriodCoates

end

section

/- Eta quotients for the Fermat-quartic modular parameter. -/

namespace TunnellLambda
open Complex hiding eta
open ModularForm EisensteinSeries Set Function Filter
open UpperHalfPlane hiding I
open scoped Topology Real ComplexOrder

noncomputable def U (z : ℂ) : ℂ := 16*(eta (8*z)/eta (2*z))^8
noncomputable def X (z : ℂ) : ℂ := 4*eta (2*z)^4*eta (8*z)^8/eta (4*z)^12
noncomputable def Y (z : ℂ) : ℂ := eta (2*z)^4*eta (8*z)^2/eta (4*z)^6

lemma scale_mem {z : ℂ} (hz : 0<z.im) (a : ℕ) (ha : 0<a) : (a:ℂ)*z∈upperHalfPlaneSet := by
  change 0 < ((a:ℂ)*z).im
  simpa [mul_im] using mul_pos (Nat.cast_pos.mpr ha : 0<(a:ℝ)) hz

lemma eta_deriv {z : ℂ} (hz : 0<z.im) (a : ℕ) (ha : 0<a) :
    HasDerivAt (fun w : ℂ => eta ((a:ℂ)*w))
      (eta ((a:ℂ)*z) * ((a:ℂ)*Real.pi*I/12*E2 ⟨(a:ℂ)*z,scale_mem hz a ha⟩)) z := by
  have hm := scale_mem hz a ha
  have h := logDeriv_eta_eq_E2 ⟨(a:ℂ)*z,hm⟩
  change deriv eta ((a:ℂ)*z) / eta ((a:ℂ)*z) = _ at h
  have he := (div_eq_iff (eta_ne_zero hm)).mp h
  apply (((differentiableAt_eta_of_mem_upperHalfPlaneSet hm).hasDerivAt).comp z
    ((hasDerivAt_id z).const_mul (a:ℂ))).congr_deriv
  change deriv eta ((a:ℂ)*z) * ((a:ℂ)*1) = _
  rw [he]
  ring

lemma hasDerivAt_U {z : ℂ} (hz : 0<z.im) : HasDerivAt U
    (U z * (4*Real.pi*I/3*(4*E2 ⟨8*z,scale_mem hz 8 (by decide)⟩ -
      E2 ⟨2*z,scale_mem hz 2 (by decide)⟩))) z := by
  have h₂ := eta_deriv hz 2 (by decide)
  have h₈ := eta_deriv hz 8 (by decide)
  norm_num only [Nat.cast_ofNat] at h₂ h₈
  have ha : eta (2*z) ≠ 0 := eta_ne_zero (scale_mem hz 2 (by decide))
  apply (((h₈.div h₂ ha).pow 8).const_mul 16).congr_deriv
  simp only [U,Pi.div_apply]
  field_simp
  ring

lemma square_ratio (z : ℂ) (hz : 0<z.im) : X z^2 = U z*Y z^4 := by
  have ha : eta (2*z) ≠ 0 := eta_ne_zero (scale_mem hz 2 (by decide))
  have hb : eta (4*z) ≠ 0 := eta_ne_zero (scale_mem hz 4 (by decide))
  unfold X U Y
  field_simp
  ring

lemma qParam_imag (h t : ℝ) : Periodic.qParam h (I*t) = (Real.exp (-2*Real.pi*t/h):ℝ) := by
  rw [Periodic.qParam,ofReal_exp]
  congr 1
  push_cast
  linear_combination (2*(Real.pi:ℂ)*t/h)*I_sq

noncomputable def etaR (t : ℝ) : ℝ := Real.exp (-2*Real.pi*t/24)*∏' n : ℕ, (1-Real.exp (-2*Real.pi*t)^(n+1))

lemma eta_imag (t : ℝ) : eta (I*t) = (etaR t:ℂ) := by
  have hh := (RCLike.isUniformEmbedding_ofReal (𝕜:=ℂ)).isClosedEmbedding.map_tprod
    (L:=SummationFilter.unconditional ℕ) (g:=Complex.ofRealHom.toMonoidHom) (fun n : ℕ => 1-Real.exp (-2*Real.pi*t)^(n+1))
  unfold eta etaR eta_q
  rw [qParam_imag,qParam_imag,ofReal_mul]
  simp only [RingHom.toMonoidHom_eq_coe,MonoidHom.coe_coe,ofRealHom_eq_coe] at hh
  simp only [ofReal_sub,ofReal_one,ofReal_pow] at hh
  simpa only [div_one] using congrArg (fun w : ℂ => (Real.exp (-2*Real.pi*t/24):ℂ)*w) hh.symm

lemma etaR_pos {t : ℝ} (ht : 0<t) : 0<etaR t := by
  have hq : Real.exp (-2*Real.pi*t)<1 := Real.exp_lt_one_iff.mpr (by nlinarith [mul_pos Real.pi_pos ht])
  have h0 : 0 ≤ etaR t := mul_nonneg (Real.exp_pos _).le (tprod_nonneg (fun n =>
    sub_nonneg.mpr (pow_le_one₀ (Real.exp_pos _).le hq.le)))
  apply lt_of_le_of_ne h0
  intro h
  have hn : eta (I*t) ≠ 0 := eta_ne_zero (show I*t∈upperHalfPlaneSet by change 0<(I*t).im; simpa [mul_im])
  exact hn (by rw [eta_imag,←h,ofReal_zero])

end TunnellLambda

end

section

/- Both cusp limits for the Fermat-quartic eta parametrization. -/

namespace TunnellLambda

open Complex hiding eta
open ModularForm Function Filter Set Metric
open scoped Topology

noncomputable def eprod (q : ℂ) := ∏' n : ℕ, (1-q^(n+1))

noncomputable def tailEta (a : ℕ) (t : ℝ) := eprod (Periodic.qParam 1 ((a:ℂ)*(I*t)))

lemma tail_limit {a : ℕ} (ha : 0<a) : Tendsto (tailEta a) atTop (𝓝 1) := by
  have tm : Tendsto (fun t : ℝ => (a:ℂ)*(I*t)) atTop (comap Complex.im atTop) := by
    apply tendsto_comap_iff.mpr
    simpa only [Function.comp_def,mul_im,natCast_re,natCast_im,I_re,I_im,ofReal_im,ofReal_re,
      zero_mul,one_mul,zero_add,add_zero,id_eq] using
      (tendsto_id (α:=ℝ) (x:=atTop)).const_mul_atTop (Nat.cast_pos.mpr ha : 0<(a:ℝ))
  have tc : ContinuousAt eprod 0 := (differentiableOn_tprod_one_sub_pow.differentiableAt
    (isOpen_ball.mem_nhds (mem_ball_self (by norm_num)))).continuousAt
  have e0 : eprod 0=1 := by simp [eprod]
  exact e0 ▸ tc.tendsto.comp (((Periodic.qParam_tendsto (by norm_num : (0:ℝ)<1)).mono_right nhdsWithin_le_nhds).comp tm)

noncomputable def front (t : ℝ) := Periodic.qParam 24 (I*t)

lemma front_ne (t : ℝ) : front t ≠ 0 := exp_ne_zero _

lemma front_limit : Tendsto front atTop (𝓝 0) := by
  apply ((Periodic.qParam_tendsto (by norm_num : (0:ℝ)<24)).mono_right nhdsWithin_le_nhds).comp
  apply tendsto_comap_iff.mpr
  simpa [Function.comp_def,Complex.mul_im] using (show Tendsto (fun t : ℝ => t) atTop atTop from tendsto_id)

lemma expand_eta (a : ℕ) (t : ℝ) : eta ((a:ℂ)*(I*t)) = front t^a*tailEta a t := by
  simp only [eta,eta_q,front,tailEta,eprod]
  congr 1
  simp only [Periodic.qParam,← exp_nat_mul]
  congr 1
  ring

noncomputable def Xdual (z : ℂ) := eta (4*z)^4*eta z^8/eta (2*z)^12

lemma X_atTop : Tendsto (fun t : ℝ => X (I*t)) atTop (𝓝 0) := by
  have hh := ((tendsto_const_nhds (x:=(4:ℂ))).mul (front_limit.pow 24) |>.mul ((tail_limit (a:=2) (by decide)).pow 4) |>.mul ((tail_limit (a:=8) (by decide)).pow 8)).div ((tail_limit (a:=4) (by decide)).pow 12) (by norm_num)
  simp only [zero_pow (by decide : 24≠0),one_pow,mul_zero,zero_mul,zero_div] at hh
  apply hh.congr
  intro t
  simp only [X,← Nat.cast_ofNat (R:=ℂ) (n:=2),← Nat.cast_ofNat (R:=ℂ) (n:=4),← Nat.cast_ofNat (R:=ℂ) (n:=8),expand_eta]
  dsimp
  field_simp [front_ne]
  <;> ring

lemma Xdual_atTop : Tendsto (fun t : ℝ => Xdual (I*t)) atTop (𝓝 1) := by
  have hh := (((tail_limit (a:=4) (by decide)).pow 4).mul ((tail_limit (a:=1) (by decide)).pow 8)).div ((tail_limit (a:=2) (by decide)).pow 12) (by norm_num)
  simp only [one_pow,one_mul,div_one] at hh
  apply hh.congr
  intro t
  unfold Xdual
  rw [← Nat.cast_ofNat (R:=ℂ) (n:=4),← Nat.cast_ofNat (R:=ℂ) (n:=2),expand_eta,expand_eta,
    show eta (I*t) = front t^1*tailEta 1 t by simpa using expand_eta 1 t]
  dsimp
  field_simp [front_ne]
  <;> ring

lemma eta_opposite_sq {t : ℝ} (ht : 0<t) :
    eta (I*(t⁻¹:ℝ))^2 = (t:ℂ)*eta (I*t)^2 := by
  have hr : (t:ℂ) ≠ 0 := ofReal_ne_zero.mpr ht.ne'
  have he : -1/(I*t) = I*(t⁻¹:ℝ) := by
    push_cast
    field_simp
    <;> simp [← mul_assoc]
  have h := TunnellFricke.eta_S_sq (I*t) (by simpa using ht)
  simpa [he,← mul_assoc] using h

lemma X_inversion (t : ℝ) (ht : 0<t) : X (I*t) = Xdual (I*((8*t)⁻¹:ℝ)) := by
  have h1 := eta_opposite_sq (show 0<2*t by positivity)
  have h2 := eta_opposite_sq (show 0<8*t by positivity)
  have h3 := eta_opposite_sq (show 0<4*t by positivity)
  have ha : 4*(I*(((8*t)⁻¹:ℝ):ℂ)) = I*(((2*t)⁻¹:ℝ):ℂ) := by push_cast; field_simp; ring
  have hb : 2*(I*(((8*t)⁻¹:ℝ):ℂ)) = I*(((4*t)⁻¹:ℝ):ℂ) := by push_cast; field_simp; ring
  unfold X Xdual
  rw [ha,hb,show (4:ℕ)=2*2 by decide,show (8:ℕ)=2*4 by decide,show (12:ℕ)=2*6 by decide]
  simp only [pow_mul,h1,h2,h3]
  push_cast
  rw [show I*(2*(t:ℂ)) = 2*(I*t) by ring,show I*(8*(t:ℂ)) = 8*(I*t) by ring,
    show I*(4*(t:ℂ)) = 4*(I*t) by ring]
  field_simp [ht.ne']
  <;> ring

theorem X_atZero : Tendsto (fun t : ℝ => X (I*t)) (𝓝[>] 0) (𝓝 1) := by
  have h := tendsto_inv_nhdsGT_zero.const_mul_atTop (by norm_num : (0:ℝ)<8⁻¹)
  have h' : Tendsto (fun t : ℝ => (8*t)⁻¹) (𝓝[>] 0) atTop := by simpa [mul_comm] using h
  apply (Xdual_atTop.comp h').congr'
  filter_upwards [self_mem_nhdsWithin] with t ht
  exact (X_inversion t ht).symm

lemma U_atTop : Tendsto (fun t : ℝ => U (I*t)) atTop (𝓝 0) := by
  have hh := (((tendsto_const_nhds (x:=(16:ℂ))).mul (front_limit.pow 48)).mul
    (((tail_limit (a:=8) (by decide)).div (tail_limit (a:=2) (by decide)) (by norm_num)).pow 8))
  simp only [zero_pow (by decide : 48≠0),one_div,inv_one,one_pow,mul_zero,zero_mul] at hh
  apply hh.congr
  intro t
  simp only [U,← Nat.cast_ofNat (R:=ℂ) (n:=2),← Nat.cast_ofNat (R:=ℂ) (n:=8),expand_eta]
  dsimp
  field_simp [front_ne]
  <;> ring

lemma U_inversion (t : ℝ) (ht : 0<t) : (U (I*t))⁻¹ = U (I*((16*t)⁻¹:ℝ)) := by
  have h1 := eta_opposite_sq (show 0<2*t by positivity)
  have h2 := eta_opposite_sq (show 0<8*t by positivity)
  have ha : 8*(I*(((16*t)⁻¹:ℝ):ℂ)) = I*(((2*t)⁻¹:ℝ):ℂ) := by push_cast; field_simp; ring
  have hb : 2*(I*(((16*t)⁻¹:ℝ):ℂ)) = I*(((8*t)⁻¹:ℝ):ℂ) := by push_cast; field_simp; ring
  unfold U
  rw [ha,hb]
  simp only [div_pow,show (8:ℕ)=2*4 by decide,pow_mul,h1,h2]
  push_cast
  rw [show I*(2*(t:ℂ)) = 2*(I*t) by ring,show I*(8*(t:ℂ)) = 8*(I*t) by ring]
  have he1 : eta (2*(I*(t:ℂ))) ≠ 0 := eta_ne_zero (scale_mem (by simpa using ht : 0<(I*(t:ℂ)).im) 2 (by decide))
  have he2 : eta (8*(I*(t:ℂ))) ≠ 0 := eta_ne_zero (scale_mem (by simpa using ht : 0<(I*(t:ℂ)).im) 8 (by decide))
  field_simp [ht.ne',he1,he2]
  <;> ring

theorem inv_U_atZero : Tendsto (fun t : ℝ => (U (I*t))⁻¹) (𝓝[>] 0) (𝓝 0) := by
  have h := tendsto_inv_nhdsGT_zero.const_mul_atTop (by norm_num : (0:ℝ)<16⁻¹)
  have h' : Tendsto (fun t : ℝ => (16*t)⁻¹) (𝓝[>] 0) atTop := by simpa [mul_comm] using h
  apply (U_atTop.comp h').congr'
  filter_upwards [self_mem_nhdsWithin] with t ht
  exact (U_inversion t ht).symm

end TunnellLambda

end

section

/- Reality and positivity of the eta differential on the imaginary axis. -/

namespace TunnellFricke

open Complex hiding eta
open ModularForm Function MeasureTheory Set Filter
open scoped Topology

lemma eta_imag {t : ℝ} (ht : 0<t) : ∃ x : ℝ, 0<x ∧ eta (I*t) = x :=
  ⟨TunnellLambda.etaR t,TunnellLambda.etaR_pos ht,TunnellLambda.eta_imag t⟩

noncomputable def imaginaryValue (t : ℝ) := (h (4*(I*t))).re

lemma imaginary_cast {t : ℝ} (ht : 0<t) :
    0 < imaginaryValue t ∧ h (4*(I*t)) = (imaginaryValue t:ℂ) := by
  obtain ⟨a,ha,he⟩ := eta_imag (show 0<4*t by positivity)
  obtain ⟨b,hb,hf⟩ := eta_imag (show 0<8*t by positivity)
  have v : h (4*(I*t)) = ((a^2*b^2:ℝ):ℂ) := by
    rw [h,show 4*(I*(t:ℂ)) = I*((4*t:ℝ):ℂ) by push_cast; ring,
      show 2*(I*(((4*t:ℝ):ℂ))) = I*((8*t:ℝ):ℂ) by push_cast; ring,he,hf]
    push_cast
    rfl
  simp only [imaginaryValue,v,ofReal_re]
  exact ⟨by positivity,trivial⟩

lemma baseConstant_real : baseConstant = ((2*Real.pi*(∫ t in Ioi (0:ℝ), imaginaryValue t):ℝ):ℂ) := by
  unfold baseConstant
  push_cast
  rw [← integral_complex_ofReal]
  congr 1
  apply setIntegral_congr_fun measurableSet_Ioi
  exact fun t ht => (imaginary_cast ht).2

theorem baseConstant_from_fermat {X : ℝ → ℝ}
    (hX : ∀ t, 0<t → X t∈Ioo 0 1)
    (hd : ∀ t, 0<t → HasDerivAt X (-8*Real.pi*imaginaryValue t*(1-X t^2)^(3/4:ℝ)) t)
    (hzero : Tendsto X (𝓝[>] 0) (𝓝 1)) (htop : Tendsto X atTop (𝓝 0)) :
    baseConstant = (TunnellPeriodCoates.realPeriod 1:ℂ)/4 := by
  rw [baseConstant_real,TunnellPeriodCoates.realPeriod_of_fermat_parameter (fun t ht => (imaginary_cast ht).1) hX hd hzero htop]
  push_cast
  rfl

end TunnellFricke

end

section

/- The Fermat differential gives the precise central-value-to-real-period comparison. -/

namespace TunnellLambda

open Complex hiding eta
open ModularForm Set Filter TunnellFricke
open scoped Topology

noncomputable def xReal (t : ℝ) := (X (I*t)).re
noncomputable def yReal (t : ℝ) := (Y (I*t)).re

lemma XY_real {t : ℝ} (ht : 0<t) : 0<xReal t ∧ X (I*t)=(xReal t:ℂ) ∧
    0<yReal t ∧ Y (I*t)=(yReal t:ℂ) := by
  let A := etaR (2*t)
  let B := etaR (4*t)
  let C := etaR (8*t)
  have hA : 0<A := etaR_pos (by positivity)
  have hB : 0<B := etaR_pos (by positivity)
  have hC : 0<C := etaR_pos (by positivity)
  have ev (a : ℝ) : eta ((a:ℂ)*(I*t)) = (etaR (a*t):ℂ) := by
    rw [show (a:ℂ)*(I*t) = I*((a*t:ℝ):ℂ) by push_cast; ring,eta_imag]
  have ex : X (I*t) = ((4*A^4*C^8/B^12:ℝ):ℂ) := by
    unfold X
    push_cast
    norm_num only [ofReal_ofNat] at ev
    rw [show (2:ℂ)=((2:ℝ):ℂ) by norm_num,show (4:ℂ)=((4:ℝ):ℂ) by norm_num,
      show (8:ℂ)=((8:ℝ):ℂ) by norm_num,ev,ev,ev]
  have ey : Y (I*t) = ((A^4*C^2/B^6:ℝ):ℂ) := by
    unfold Y
    push_cast
    rw [show (2:ℂ)=((2:ℝ):ℂ) by norm_num,show (4:ℂ)=((4:ℝ):ℂ) by norm_num,
      show (8:ℂ)=((8:ℝ):ℂ) by norm_num,ev,ev,ev]
  simp only [xReal,yReal,ex,ey,ofReal_re]
  exact ⟨by positivity,trivial,by positivity,trivial⟩

theorem critical_from_differential
    (hquart : ∀ t : ℝ, 0<t → X (I*t)^2+Y (I*t)^4=1)
    (hder : ∀ t : ℝ, 0<t → HasDerivAt X
      (8*(Real.pi:ℂ)*I*TunnellFricke.h (4*(I*t))*Y (I*t)^3) (I*t)) :
    TunnellFricke.baseConstant = (TunnellPeriodCoates.realPeriod 1:ℂ)/4 := by
  have quart {t : ℝ} (ht : 0<t) : xReal t^2+yReal t^4=1 := by
    obtain ⟨_,hx,_,hy⟩ := XY_real ht
    have eq := hquart t ht
    rw [hx,hy] at eq
    exact_mod_cast eq
  apply baseConstant_from_fermat (X:=xReal)
  · intro t ht
    obtain ⟨hx,_,hy,_⟩ := XY_real ht
    exact ⟨hx,by nlinarith [quart ht,pow_pos hy 4]⟩
  · intro t ht
    obtain ⟨_,hx,hy,hey⟩ := XY_real ht
    have e := ((hder t ht).comp (t:ℂ) ((hasDerivAt_id (t:ℂ)).const_mul I)).real_of_complex
    have hw : ((8*(Real.pi:ℂ)*I*h (4*(I*t))*Y (I*t)^3*(I*1)).re) =
        -8*Real.pi*imaginaryValue t*yReal t^3 := by
      have ec : 8*(Real.pi:ℂ)*I*h (4*(I*t))*Y (I*t)^3*(I*1) =
          ((-8*Real.pi*imaginaryValue t*yReal t^3:ℝ):ℂ) := by
        rw [hey,(imaginary_cast ht).2]
        push_cast
        linear_combination (8*(Real.pi:ℂ)*imaginaryValue t*(yReal t:ℂ)^3)*I_sq
      exact congrArg re ec
    have hp : (1-xReal t^2)^(3/4:ℝ) = yReal t^3 := by
      rw [show 1-xReal t^2 = yReal t^4 by linarith [quart ht],← Real.rpow_natCast_mul hy.le]
      norm_num
    rw [hp]
    exact e.congr_deriv hw
  · unfold xReal
    simpa only [Function.comp_def,one_re] using continuous_re.continuousAt.tendsto.comp X_atZero
  · unfold xReal
    simpa only [Function.comp_def,zero_re] using continuous_re.continuousAt.tendsto.comp X_atTop

end TunnellLambda

end

section

/- The signed four-square theta series in a nilpotent quotient. -/

namespace TunnellQuaternionTheta

open Finset TunnellQBin TunnellTruncated

variable {R : Type*} [CommRing R]

lemma nil_pow {u : R} {d : ℕ} (hu : u^(d+1) = 0) {k : ℕ} (hk : k ≠ 0) :
    (u^k)^(d+1)=0 := by rw [←pow_mul,mul_comm,pow_mul,hu,zero_pow hk]

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

end TunnellQuaternionTheta

end

section

/- Analytic Jacobi products from their finite polynomial congruences. -/

namespace TunnellDiskJacobi
open Finset Filter Polynomial TunnellQBin TunnellTruncated
open scoped Topology

abbrev disk := Metric.ball (0:ℂ) 1
noncomputable def E (q : ℂ) := ∏' n : ℕ, (1-q^(n+1))
noncomputable def S (q : ℂ) := ∑' j : ℤ, ((j.negOnePow:ℤ):ℂ)*q^(j.natAbs^2)
noncomputable def SP (n : ℕ) : ℂ[X] := ∑ j ∈ Icc (-(n:ℤ)) (n:ℤ), (((j.negOnePow:ℤ):ℂ[X]))*X^(j.natAbs^2)

def Approx (P : ℕ → ℂ[X]) (f : ℂ → ℂ) :=
  TendstoLocallyUniformlyOn (fun n z => (P n).eval z) f atTop disk

lemma Approx.cont {P : ℕ → ℂ[X]} {f} (h : Approx P f) : ContinuousOn f disk :=
  h.continuousOn (.of_forall fun k => (P k).continuous.continuousOn)

lemma Approx.mul {P Q : ℕ → ℂ[X]} {f g} (hP : Approx P f) (hQ : Approx Q g) :
    Approx (fun n => P n * Q n) (fun z => f z * g z) := by
  simpa only [Approx,eval_mul,Pi.mul_def] using hP.mul₀ hQ hP.cont hQ.cont

lemma Approx.sub {P Q : ℕ → ℂ[X]} {f g} (hP : Approx P f) (hQ : Approx Q g) :
    Approx (fun n => P n - Q n) (fun z => f z - g z) := by
  simpa only [Approx,eval_sub,Pi.sub_def] using (show TendstoLocallyUniformlyOn _ _ _ _ from hP).sub hQ

lemma Approx.eqOn {P Q : ℕ → ℂ[X]} {f g} (hP : Approx P f) (hQ : Approx Q g)
    (hD : ∀ n : ℕ, (X:ℂ[X])^(n+1) ∣ P n - Q n) : Set.EqOn f g disk := by
  let F (z : ℂ) := f z - g z
  have hc := hP.sub hQ
  have hd : DifferentiableOn ℂ F disk := hc.differentiableOn
    (.of_forall fun n => (P n-Q n).differentiableOn) Metric.isOpen_ball
  have hco (m : ℕ) : (m.factorial:ℂ)⁻¹*iteratedDeriv m F 0=0 :=
    TunnellTaylor.taylor_of_convergent_polynomials _ _ hc m 0 fun n hn =>
      X_pow_dvd_iff.mp (hD n) m (by omega)
  intro z hz
  apply sub_eq_zero.mp
  change F z=0
  rw [←Complex.taylorSeries_eq_on_ball' hz hd]
  simp only [hco,zero_mul,tsum_zero]

lemma approx_fac (p : ℂ[X]) (hp : Set.MapsTo p.eval disk disk) :
    Approx (fun n => fac p n) (fun z => E (p.eval z)) := by
  have h := (ModularForm.multipliableLocallyUniformlyOn_one_sub_pow.comp _ hp p.continuous.continuousOn).hasProdLocallyUniformlyOn.tendstoLocallyUniformlyOn_finsetRange
  simpa only [Approx,E,fac,eval_prod,eval_sub,eval_one,eval_pow,Function.comp_def] using h

lemma approx_S : Approx SP S := by
  unfold Approx SP S
  simp only [eval_finsetSum,eval_mul,eval_intCast,eval_pow,eval_X]
  rw [tendstoLocallyUniformlyOn_iff_forall_isCompact Metric.isOpen_ball]
  intro K hK hcK
  rcases K.eq_empty_or_nonempty with rfl | hN
  · exact tendstoUniformlyOn_empty
  obtain ⟨q₀,hq₀,_,hb⟩ := hcK.exists_sSup_image_eq_and_ge hN (show ContinuousOn (fun q : ℂ => ‖q‖) K by fun_prop)
  have hlt : ‖q₀‖<1 := by simpa [disk] using hK hq₀
  have hs : Summable (fun j : ℤ => ‖q₀‖^j.natAbs) := by
    apply Summable.of_nat_of_neg <;> simpa using summable_geometric_of_lt_one (norm_nonneg _) hlt
  have ht := tendstoUniformlyOn_tsum (f:=fun (j : ℤ) (q : ℂ) => ((j.negOnePow:ℤ):ℂ)*q^(j.natAbs^2)) (s:=K) hs (by
    intro j q hq
    simp only [Int.coe_negOnePow,norm_mul,norm_pow,norm_neg,norm_one,one_pow,one_mul]
    exact (pow_le_pow_left₀ (norm_nonneg _) (hb q hq) _).trans
      (pow_le_pow_of_le_one (norm_nonneg _) hlt.le (by nlinarith [Nat.le_mul_self j.natAbs])))
  intro u hu
  exact (Finset.tendsto_Icc_neg (R:=ℤ)).eventually (ht u hu)

lemma maps_pow (k : ℕ) (hk : k≠0) : Set.MapsTo (X^k:ℂ[X]).eval disk disk := by
  intro q hq
  simpa [disk,norm_pow] using pow_lt_one₀ (norm_nonneg q) (by simpa [disk] using hq) hk

theorem theta_four {q : ℂ} (hq : q∈disk) : E q^2 = S q*E (q^2) := by
  let PF (k n : ℕ) := fac ((X:ℂ[X])^k) n
  have hF (k : ℕ) (hk : k≠0) : Approx (PF k) (fun z => E (z^k)) := by
    simpa [PF] using approx_fac _ (maps_pow k hk)
  have H := ((hF 1 (by decide)).mul (hF 1 (by decide))).eqOn (approx_S.mul (hF 2 (by decide))) (fun n => ?_) hq
  · simpa only [pow_one,←sq] using H
  · let f := AdjoinRoot.mk ((X:ℂ[X])^(n+1))
    have hn : (f X)^(n+1)=0 := by rw [←map_pow]; exact AdjoinRoot.mk_self
    have he := theta_stabilized (f X) n (2*n) (by omega) hn (TunnellBalanced.balanced _ _)
    apply AdjoinRoot.mk_eq_mk.mp
    change f _ = f _
    simpa only [PF,SP,map_mul,map_fac,map_sum,map_pow,map_intCast,pow_one,sq] using he

theorem euler_neg {q : ℂ} (hq : q∈disk) : E q * E (-q) * E (q^4) = E (q^2)^3 := by
  have hF (k : ℕ) (hk : k≠0) := approx_fac _ (maps_pow k hk)
  have hm : Set.MapsTo (-X:ℂ[X]).eval disk disk := by intro z hz; simpa [disk] using hz
  have hN := approx_fac _ hm
  have hP := ((hF 1 (by decide)).mul hN).mul (hF 4 (by decide))
  have hQ := ((hF 2 (by decide)).mul (hF 2 (by decide))).mul (hF 2 (by decide))
  have H := hP.eqOn hQ (fun n => ?_) hq
  · simpa [pow_succ] using H
  · let f := AdjoinRoot.mk ((X:ℂ[X])^(n+1))
    have hn : (f X)^(n+1)=0 := by rw [←map_pow]; exact AdjoinRoot.mk_self
    have he := TunnellQuaternionTheta.fac_neg_product hn
    apply AdjoinRoot.mk_eq_mk.mp
    change f _ = f _
    simpa only [map_mul,map_fac,map_pow,map_neg,pow_one,pow_succ,pow_zero,one_mul] using he

noncomputable def theta (q : ℂ) := ∑' j : ℤ, q^(j.natAbs^2)

lemma S_neg (q : ℂ) : S (-q) = theta q :=
  tsum_congr (TunnellQuaternionTheta.unsign q)

theorem theta_three {q : ℂ} (hq : q∈disk) : theta q * E (q^2) * E q^2 * E (q^4)^2 = E (q^2)^6 := by
  have h := theta_four (q:=-q) (by simpa [disk] using hq)
  rw [S_neg,neg_sq] at h
  rw [←h,show (6:ℕ)=3*2 by decide,pow_mul,←euler_neg hq]
  ring

end TunnellDiskJacobi

end

section

/- The two theta constants in the eta parametrization. -/

namespace TunnellLambda
open Complex hiding eta
open ModularForm hiding E
open Function TunnellDiskJacobi
open scoped Real

lemma theta_disk (z : ℂ) : jacobiTheta z = theta (Periodic.qParam 2 z) := by
  unfold jacobiTheta theta
  apply tsum_congr
  intro j
  rw [Periodic.qParam,←Complex.exp_nat_mul]
  have hj : (j.natAbs:ℂ)^2=(j:ℂ)^2 := by
    have h : ((j.natAbs:ℤ)^2)=j^2 := by simpa only [Int.natAbs_sq]
    simpa only [Int.cast_pow,Int.cast_natCast] using congrArg (fun x : ℤ => (x:ℂ)) h
  push_cast
  rw [hj]
  congr 1
  ring

lemma qparam_shift (z : ℂ) : Periodic.qParam 2 (2*z+1) = -Periodic.qParam 1 z := by
  simp only [Periodic.qParam,ofReal_ofNat,ofReal_one,div_one]
  rw [show 2*(Real.pi:ℂ)*I*(2*z+1)/2=2*(Real.pi:ℂ)*I*z+Real.pi*I by ring,exp_add,exp_pi_mul_I]
  ring

lemma theta_eta (z : ℂ) (hz : 0<z.im) :
    jacobiTheta (2*z) * eta z^2 * eta (4*z)^2 = eta (2*z)^5 ∧
    jacobiTheta (2*z+1) * eta (2*z) = eta z ^2 := by
  let q := Periodic.qParam 1 z
  let w := Periodic.qParam 24 z
  have hq : q∈disk := by simpa [disk,q] using UpperHalfPlane.norm_qParam_lt_one 1 (⟨z,hz⟩ : UpperHalfPlane)
  have hq2 : Periodic.qParam 2 (2*z) = q := by dsimp [Periodic.qParam,q]; congr 1; push_cast; ring
  have hp (h : ℝ) (n : ℕ) : Periodic.qParam h ((n:ℂ)*z) = Periodic.qParam h z ^ n := by
    simp only [Periodic.qParam,←Complex.exp_nat_mul]; congr 1; ring
  have he (n : ℕ) : eta ((n:ℂ)*z) = w^n * E (q^n) := by simp only [eta,eta_q,E,q,w,hp]
  have he₁ : eta z = w*E q := by simpa using he 1
  have he₂ : eta (2*z) = w^2*E (q^2) := he 2
  have he₄ : eta (4*z) = w^4*E (q^4) := he 4
  have hn : E (q^2)≠0 := by
    apply right_ne_zero_of_mul
    rw [←he₂]
    exact eta_ne_zero (scale_mem hz 2 (by decide))
  have h3 := mul_right_cancel₀ hn (show theta q*E q^2*E (q^4)^2*E (q^2)=E (q^2)^5*E (q^2) by
    linear_combination theta_three hq)
  have h4 := theta_four hq
  have hs : theta (-q) = S q := by simpa only [neg_neg] using (S_neg (-q)).symm
  rw [theta_disk,theta_disk,hq2,qparam_shift,←show q = Periodic.qParam 1 z from rfl,hs,he₁,he₂,he₄]
  constructor
  · linear_combination w^10*h3
  · linear_combination -w^2*h4

end TunnellLambda

end

section

/- Integral quaternion norm shells, rotations, and the weight on a coordinate. -/

namespace TunnellQuaternion

open Finset Quaternion


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

end TunnellQuaternion

end

section

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

end

section

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

end

section

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

end

section

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

end

section

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

end

section

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

end

section

/- The odd-prime recurrence for the number of representations by four squares. -/

namespace TunnellQuaternion

open Finset Quaternion
open scoped Classical

noncomputable section

lemma quat_left_cancel {q u v : QInt} (hq : normSq q≠0) (h : q*u=q*v) : u=v := by
  apply scalar_cancel (normSq q) hq
  have he := congrArg (star q * ·) h
  simpa only [←mul_assoc, star_mul_self,coe_mul_eq_smul] using he

lemma count_left_factors {α : Type*} [DecidableEq α] (D : Finset α) (q : α→QInt) {d : ℕ}
    (hd : d≠0) (hq : ∀ a ∈ D, normSq (q a)=d) (n : ℕ) :
    D.card*(quatShell n).card = ∑ w ∈ quatShell (d*n),
      (D.filter (fun a => ∃ u : QInt, w=q a*u)).card := by
  classical
  let S := D ×ˢ quatShell n
  let f (a : α × QInt) := q a.1 * a.2
  have h : (S:Set _).MapsTo f (quatShell (d*n)) := by
    rintro ⟨a,u⟩ h
    obtain ⟨ha,hu⟩ := mem_product.mp h
    exact mem_quatShell.mpr (by simp [f,hq a ha,mem_quatShell.mp hu])
  rw [←card_product,card_eq_sum_card_fiberwise h]
  apply sum_congr rfl
  intro w hw
  apply card_nbij Prod.fst
  · rintro ⟨a,u⟩ h
    obtain ⟨hu,hf⟩ := mem_filter.mp h
    exact mem_filter.mpr ⟨(mem_product.mp hu).1,u,hf.symm⟩
  · rintro ⟨a,u⟩ hu ⟨b,v⟩ hv he
    change a=b at he
    subst b
    obtain ⟨hau,hw'⟩ := mem_filter.mp hu
    have ha := (mem_product.mp hau).1
    exact Prod.ext rfl (quat_left_cancel (by rw [hq a ha]; exact_mod_cast hd) (hw'.trans (mem_filter.mp hv).2.symm))
  · intro a ha
    obtain ⟨ha',u,rfl⟩ := mem_filter.mp ha
    have hw' := mem_quatShell.mp hw
    rw [map_mul,hq a ha',Nat.cast_mul] at hw'
    have hu := mul_left_cancel₀ (by exact_mod_cast hd : (d:ℤ)≠0) hw'
    exact ⟨(a,u),mem_filter.mpr ⟨mem_product.mpr ⟨ha',mem_quatShell.mpr hu⟩,rfl⟩,rfl⟩

lemma quatShell_prime_card {p : ℕ} [Fact p.Prime] (hp : p≠2) : (quatShell p).card=8*(p+1) := by
  simpa using card_class_mem (localModel hp) hp univ

lemma odd_factors_card {p : ℕ} [Fact p.Prime] (hp : p≠2) (n : ℕ) (w : QInt)
    (hw : w∈quatShell (p*n)) :
    ((quatShell p).filter (fun q => ∃ u : QInt, w=q*u)).card =
      if red p w=0 then 8*(p+1) else 8 := by
  classical
  let M := localModel hp
  have hdet : (residue M w).det=0 := by
    rw [residue_det,mem_quatShell.mp hw]
    simp
  split_ifs with h
  · have hw0 := (residue_zero M w).mpr h
    have hall : ∀ q ∈ quatShell p, ∃ u : QInt, w=q*u := by
      intro q hq
      have hqn := mem_quatShell.mp hq
      apply divide_left M hqn ((class_eq_iff M hqn _).mp rfl)
      rw [hw0]
      cases classOf M q <;> simp [inLine]
    simpa [filter_eq_self.mpr hall] using quatShell_prime_card hp
  · obtain ⟨l,hl,hu⟩ := line_unique _ (fun he => h ((residue_zero M w).mp he)) hdet
    rw [←fiber_class_card M hp l]
    congr 1
    apply filter_congr
    intro q hq
    have hqn := mem_quatShell.mp hq
    constructor
    · rintro ⟨u,rfl⟩
      apply hu
      rw [map_mul]
      exact line_mul ((class_eq_iff M hqn _).mp rfl) _
    · intro hq'
      exact divide_left M hqn ((class_eq_iff M hqn l).mp hq') hl

lemma imprimitive_quat_card {p : ℕ} (hp : p≠0) (n : ℕ) :
    ((quatShell (p*n)).filter (fun w => red p w=0)).card =
      if p∣n then (quatShell (n/p)).card else 0 := by
  classical
  split_ifs with h
  · symm
    apply card_nbij (fun u => (p:ℤ) • u)
    · intro u hu
      apply mem_filter.mpr ⟨mem_quatShell.mpr ?_,by rw [red_smul]; simp⟩
      rw [norm_smul,mem_quatShell.mp hu,pow_two,mul_assoc,←Nat.cast_mul, Nat.mul_div_cancel' h]
      simp
    · intro u _ v _ huv
      exact scalar_cancel p (by exact_mod_cast hp) huv
    · intro w hw
      obtain ⟨hn,hred⟩ := mem_filter.mp hw
      obtain ⟨u,rfl⟩ := (div_iff p w).mp hred
      refine ⟨u, mem_quatShell.mpr ?_,rfl⟩
      have hh := mem_quatShell.mp hn
      rw [norm_smul,Nat.cast_mul,←Nat.mul_div_cancel' h] at hh
      simp only [Nat.cast_mul] at hh
      apply mul_left_cancel₀ (pow_ne_zero 2 (by exact_mod_cast hp : (p:ℤ)≠0))
      simpa [pow_two,mul_assoc] using hh
  · apply card_eq_zero.mpr
    apply eq_empty_iff_forall_notMem.mpr
    intro w hw
    obtain ⟨hn,hred⟩ := mem_filter.mp hw
    obtain ⟨u,rfl⟩ := (div_iff p w).mp hred
    have hh := mem_quatShell.mp hn
    rw [norm_smul,pow_two,mul_assoc,Nat.cast_mul] at hh
    have e := mul_left_cancel₀ (by exact_mod_cast hp : (p:ℤ)≠0) hh
    exact h (by exact_mod_cast (show (p:ℤ)∣(n:ℤ) from ⟨_, e.symm⟩))

theorem quatShell_odd_recurrence {p : ℕ} [Fact p.Prime] (hp : p≠2) (n : ℕ) :
    (p+1)*(quatShell n).card = (quatShell (p*n)).card +
      (if p∣n then p*(quatShell (n/p)).card else 0) := by
  classical
  have h := count_left_factors (quatShell p) id (Fact.out:p.Prime).ne_zero (fun q hq => mem_quatShell.mp hq) n
  change _ = ∑ w ∈ quatShell (p*n), ((quatShell p).filter (fun q => ∃ u : QInt, w=q*u)).card at h
  rw [sum_congr rfl (odd_factors_card hp n),quatShell_prime_card hp] at h
  have split (w : QInt) : (if red p w=0 then 8*(p+1) else 8) = 8 + (if red p w=0 then 8*p else 0) := by
    split_ifs <;> omega
  simp_rw [split] at h
  rw [sum_add_distrib,←sum_filter,sum_const,sum_const,imprimitive_quat_card (Fact.out:p.Prime).ne_zero] at h
  simp only [nsmul_eq_mul] at h
  split_ifs at h ⊢ <;> nlinarith

end
end TunnellQuaternion

end

section

/- The dyadic recurrence for four squares, by counting the three norm-two left factors. -/

namespace TunnellQuaternion

open Finset Quaternion

def dyadic (i : Fin 3) : QInt := ![⟨1,1,0,0⟩,⟨1,0,1,0⟩,⟨1,0,0,1⟩] i

lemma norm_dyadic (i : Fin 3) : normSq (dyadic i)=2 := by fin_cases i <;> decide

lemma dyadic_dvd_iff (i : Fin 3) (w : QInt) :
    (∃ u : QInt, w=dyadic i*u) ↔ red 2 (star (dyadic i)*w)=0 := by
  rw [div_iff]
  constructor
  · rintro ⟨u,rfl⟩
    exact ⟨u,by rw [←mul_assoc,star_mul_self,norm_dyadic,coe_mul_eq_smul]; rfl⟩
  · rintro ⟨u,hu⟩
    refine ⟨u,scalar_cancel 2 (by decide) ?_⟩
    have hh := congrArg (dyadic i * ·) hu
    simpa only [←mul_assoc,self_mul_star,norm_dyadic,coe_mul_eq_smul,Algebra.mul_smul_comm, Nat.cast_ofNat] using hh

def reduceFour (w : Quaternion (ZMod 4)) : Quaternion (ZMod 2) :=
  let f := ZMod.castHom (by decide : 2∣4) (ZMod 2)
  ⟨f w.re,f w.imI,f w.imJ,f w.imK⟩

lemma reduceFour_red (w : QInt) : reduceFour (red 4 w)=red 2 w := by
  change reduceFour (redFun 4 w)=redFun 2 w
  apply QuaternionAlgebra.ext <;> simp [reduceFour,redFun]

instance finiteQuatDecEq {n : ℕ} : DecidableEq (Quaternion (ZMod n)) :=
  (Quaternion.equivProd _).decidableEq

def dyadicCount (w : Quaternion (ZMod 4)) : ℕ :=
  (univ.filter (fun i : Fin 3 => red 2 (star (dyadic i))*reduceFour w=0)).card

lemma dyadic_table (w : Quaternion (ZMod 4)) :
    (normSq w=0 → dyadicCount w=3) ∧ (normSq w=2 → dyadicCount w=1) := by
  obtain ⟨a,b,c,d⟩ := w
  revert a b c d
  decide

open scoped Classical in
theorem quatShell_two_recurrence (n : ℕ) :
    (quatShell (2*n)).card = if Even n then (quatShell n).card else 3*(quatShell n).card := by
  classical
  have h := count_left_factors (univ : Finset (Fin 3)) dyadic (d:=2) (by decide)
    (fun i _ => norm_dyadic i) n
  simp only [card_univ,Fintype.card_fin] at h
  have hf (w : QInt) (hw : w∈quatShell (2*n)) :
      (univ.filter (fun i : Fin 3 => ∃ u : QInt, w=dyadic i*u)).card = if Even n then 3 else 1 := by
    have hq := dyadic_table (red 4 w)
    rw [←red_norm,mem_quatShell.mp hw] at hq
    have heq : (univ.filter (fun i : Fin 3 => ∃ u : QInt, w=dyadic i*u)).card = dyadicCount (red 4 w) := by
      unfold dyadicCount
      congr 1
      apply filter_congr
      intro i _
      rw [dyadic_dvd_iff,map_mul,reduceFour_red]
    rw [heq]
    split_ifs with he
    · apply hq.1
      rcases he with ⟨t,ht⟩
      rw [ht]
      push_cast
      have hz : (4:ZMod 4)=0 := by decide
      linear_combination (t:ZMod 4)*hz
    · apply hq.2
      obtain ⟨t,ht⟩ := Nat.not_even_iff_odd.mp he
      rw [ht]
      push_cast
      have hz : (4:ZMod 4)=0 := by decide
      linear_combination (t:ZMod 4)*hz
  rw [sum_congr rfl hf,sum_const] at h
  split_ifs at h ⊢ <;> simp_all <;> omega

end TunnellQuaternion

end

section

/- Jacobi's four-square theorem, obtained from the quaternion counts at every prime. -/

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

end

section

/- The fourth power of the Jacobi theta series as a difference of two weight-two Eisenstein series. -/

namespace TunnellQuaternion

open Finset Quaternion Complex Real
open scoped ArithmeticFunction.sigma

noncomputable section

def qHalf (τ : ℂ) : ℂ := Complex.exp (π*I*τ)

def quatShellEquiv : (Σ n : ℕ, ↥(quatShell n)) ≃ QInt where
  toFun v := v.2.val
  invFun w := ⟨(normSq w).toNat,w,mem_quatShell.mpr (Int.toNat_of_nonneg (normSq_nonneg (a:=w))).symm⟩
  left_inv := by
    rintro ⟨n,w,hw⟩
    obtain rfl : n=(normSq w).toNat := by rw [mem_quatShell.mp hw]; simp
    rfl
  right_inv _ := rfl

private lemma hasSum_mul_prod {α β : Type*} {f : α→ℂ} {g : β→ℂ} {x y : ℂ}
    (hf : HasSum f x) (hg : HasSum g y) : HasSum (fun v : α×β => f v.1*g v.2) (x*y) :=
  hf.mul hg (summable_mul_of_summable_norm hf.summable.norm hg.summable.norm)

lemma theta_four_shell (τ : UpperHalfPlane) : HasSum (fun n : ℕ => ((quatShell n).card:ℂ)*(qHalf τ)^n)
    (jacobiTheta (τ:ℂ)^4) := by
  classical
  let g (k : ℤ) := Complex.exp (π*I*(k:ℂ)^2*(τ:ℂ))
  have hθ : HasSum g (jacobiTheta (τ:ℂ)) := by
    have h := hasSum_jacobiTheta₂_term 0 τ.im_pos
    simpa [g,jacobiTheta₂_term,←jacobiTheta_eq_jacobiTheta₂] using h
  have h2 := hasSum_mul_prod hθ hθ
  have h3 := hasSum_mul_prod hθ h2
  have h4 := hasSum_mul_prod hθ h3
  let F (q : QInt) := g q.re*(g q.imI*(g q.imJ*g q.imK))
  have hq : HasSum F (jacobiTheta τ*(jacobiTheta τ*(jacobiTheta τ*jacobiTheta τ))) :=
    coordsEquiv.hasSum_iff.mpr h4
  have hs : HasSum (F ∘ quatShellEquiv) (jacobiTheta τ*(jacobiTheta τ*(jacobiTheta τ*jacobiTheta τ))) := quatShellEquiv.hasSum_iff.mpr hq
  rw [show jacobiTheta (τ:ℂ)^4=jacobiTheta τ*(jacobiTheta τ*(jacobiTheta τ*jacobiTheta τ)) by ring]
  apply hs.sigma
  intro n
  have hc (v : ↥(quatShell n)) :
      (g v.val.re * (g v.val.imI * (g v.val.imJ*g v.val.imK))) = qHalf τ^n := by
    have hv := mem_quatShell.mp v.property
    rw [normSq_def'] at hv
    have hv' : (v.val.re:ℂ)^2+(v.val.imI:ℂ)^2+(v.val.imJ:ℂ)^2+(v.val.imK:ℂ)^2=(n:ℂ) := by exact_mod_cast hv
    simp only [g,qHalf,←Complex.exp_add,←Complex.exp_nat_mul]
    congr 1
    linear_combination (π:ℂ)*I*(τ:ℂ)*hv'
  change HasSum (fun v : ↥(quatShell n) => g v.val.re*(g v.val.imI*(g v.val.imJ*g v.val.imK))) _
  simp_rw [hc]
  simpa using hasSum_fintype (fun _ : ↥(quatShell n) => qHalf τ^n)

lemma fourDivSum_split {n : ℕ} (hn : n≠0) :
    fourDivSum n + (if 4∣n then 4*σ 1 (n/4) else 0) = σ 1 n := by
  classical
  simp only [ArithmeticFunction.sigma_one_apply]
  have first : fourDivSum n = ∑ d ∈ n.divisors with ¬4∣d, d := by
    simp [fourDivSum,sum_filter,divisorWeight]
  have second : (∑ d ∈ n.divisors with 4∣d, d) = if 4∣n then 4*∑ d ∈ (n/4).divisors, d else 0 := by
    split_ifs with h
    · rw [mul_sum]
      symm
      apply sum_nbij' (fun d => 4*d) (fun t => t/4)
      · intro d hd
        apply mem_filter.mpr ⟨Nat.mem_divisors.mpr ⟨?_,hn⟩,dvd_mul_right _ _⟩
        rw [←Nat.mul_div_cancel' h]
        exact Nat.mul_dvd_mul_left 4 (Nat.mem_divisors.mp hd).1
      · intro t ht
        obtain ⟨htn,hd⟩ := mem_filter.mp ht
        obtain ⟨s,rfl⟩ := hd
        obtain ⟨u,rfl⟩ := (Nat.mem_divisors.mp htn).1
        simp only [mul_assoc,Nat.mul_div_cancel_left _ (by decide : 0<4), Nat.mem_divisors]
        exact ⟨dvd_mul_right _ _,by intro hz; simp_all⟩
      · intro _ _; simp
      · intro t ht; exact Nat.mul_div_cancel' (mem_filter.mp ht).2
      · intro _ _; rfl
    · apply sum_eq_zero
      intro d hd
      exact (h (dvd_trans (mem_filter.mp hd).2 (Nat.mem_divisors.mp (mem_filter.mp hd).1).1)).elim
  rw [first,←second,add_comm,sum_filter_add_sum_filter_not]

def eCoeff (n : ℕ) : ℂ := if n=0 then 1 else -24*(σ 1 n:ℂ)

def sieve (d : ℕ) (f : ℕ→ℂ) (n : ℕ) : ℂ := if d∣n then f (n/d) else 0

lemma dilated_hasSum {q z : ℂ} {c : ℕ → ℂ} {d : ℕ} (hd : 0<d)
    (h : HasSum (fun n => c n*(q^d)^n) z) :
    HasSum (fun n => sieve d c n*q^n) z := by
  let g (n : ℕ) := d*n
  have hi : Function.Injective g := fun _ _ h => Nat.eq_of_mul_eq_mul_left hd h
  apply (hi.hasSum_iff (fun n hn => ?_)).mp
  · simpa [Function.comp_def,g,sieve,Nat.mul_div_cancel_left _ hd,pow_mul] using h
  · have hne : ¬d∣n := fun ⟨a,ha⟩ => hn ⟨a,ha.symm⟩
    simp [sieve,hne]

lemma theta_four_coeff (n : ℕ) : 3*((quatShell n).card:ℂ) = 4*sieve 4 eCoeff n - eCoeff n := by
  by_cases hn : n=0
  · subst n
    have h : (quatShell 0).card=1 := by decide
    norm_num [h,sieve,eCoeff]
  have hs := fourDivSum_split hn
  have hc : (quatShell n).card=8*fourDivSum n := by
    rw [quatShell_card_divisors hn,fourDivSum,sum_filter]
    simp [divisorWeight]
  rw [hc]
  by_cases hd : 4∣n
  · have hn' : n/4≠0 := by obtain ⟨k,rfl⟩:=hd; simp_all
    rw [if_pos hd] at hs
    simp only [sieve,hd,if_true,eCoeff,if_neg hn',if_neg hn,Nat.cast_mul,Nat.cast_ofNat]
    have h : (fourDivSum n:ℂ)+4*(σ 1 (n/4):ℂ)=(σ 1 n:ℂ) := by exact_mod_cast hs
    linear_combination 24*h
  · rw [if_neg hd,add_zero] at hs
    simp [sieve,hd,eCoeff,hn,hs]
    ring

/-- 3θ₃(τ)^4=4E₂(2τ)−E₂(τ/2).  The explicit points allow direct use with any dilation convention. -/
theorem theta_four_E2 (τ z t : UpperHalfPlane) (hz : (z:ℂ)=(τ:ℂ)/2) (ht : (t:ℂ)=2*(τ:ℂ)) :
    3*jacobiTheta (τ:ℂ)^4 = 4*EisensteinSeries.E2 t - EisensteinSeries.E2 z := by
  have eqz : Complex.exp (2*π*I*(z:ℂ)) = qHalf τ := by rw [hz,qHalf]; congr 1; ring
  have eqt : Complex.exp (2*π*I*(t:ℂ)) = (qHalf τ)^4 := by
    rw [ht,qHalf,←Complex.exp_nat_mul]; congr 1; push_cast; ring
  have hz' : HasSum (fun n => eCoeff n * (qHalf τ)^n) (EisensteinSeries.E2 z) := by
    simpa only [eqz,smul_eq_mul,eCoeff] using EisensteinSeries.hasSum_qExpansion_E2 z
  have ht' : HasSum (fun n => eCoeff n * ((qHalf τ)^4)^n) (EisensteinSeries.E2 t) := by
    simpa only [eqt,smul_eq_mul,eCoeff] using EisensteinSeries.hasSum_qExpansion_E2 t
  have hE := ((dilated_hasSum (by decide : 0<4) ht').mul_left 4).sub hz'
  apply ((theta_four_shell τ).mul_left 3).unique
  apply hE.congr_fun
  intro n
  linear_combination (qHalf τ)^n * theta_four_coeff n

end
end TunnellQuaternion

end

section

/- The companion weight-two Eisenstein identity for the theta series at τ+1. -/

namespace TunnellQuaternion

open Finset Quaternion Complex Real
open scoped ArithmeticFunction.sigma

lemma even_divisor_sum {n : ℕ} (hn : n≠0) : (∑ d ∈ n.divisors with 2∣d, d) =
    if 2∣n then 2*σ 1 (n/2) else 0 := by
  rw [ArithmeticFunction.sigma_one_apply]
  split_ifs with h
  · rw [mul_sum]
    symm
    apply sum_nbij' (fun d => 2*d) (fun t => t/2)
    · intro d hd
      apply mem_filter.mpr ⟨Nat.mem_divisors.mpr ⟨?_,hn⟩,dvd_mul_right _ _⟩
      rw [←Nat.mul_div_cancel' h]
      exact Nat.mul_dvd_mul_left 2 (Nat.mem_divisors.mp hd).1
    · intro t ht
      obtain ⟨htn,hd⟩ := mem_filter.mp ht
      obtain ⟨s,rfl⟩ := hd
      obtain ⟨u,rfl⟩ := (Nat.mem_divisors.mp htn).1
      simp only [mul_assoc,Nat.mul_div_cancel_left _ (by decide : 0<2),Nat.mem_divisors]
      exact ⟨dvd_mul_right _ _,by intro hz; simp_all⟩
    · intro _ _; simp
    · intro t ht; exact Nat.mul_div_cancel' (mem_filter.mp ht).2
    · intro _ _; rfl
  · apply sum_eq_zero
    intro d hd
    exact (h (dvd_trans (mem_filter.mp hd).2 (Nat.mem_divisors.mp (mem_filter.mp hd).1).1)).elim

lemma sigma_two_recurrence {n : ℕ} (hn : n≠0) : σ 1 (2*n) + (if 2∣n then 2*σ 1 (n/2) else 0) = 3*σ 1 n := by
  have hodd : (2*n).divisors.filter (fun d => ¬2∣d) = n.divisors.filter (fun d => ¬2∣d) := by
    ext d
    simp only [mem_filter,Nat.mem_divisors,mul_ne_zero (by decide : 2≠0) hn,hn,ne_eq,not_false_eq_true,and_true]
    constructor
    · rintro ⟨hd,he⟩
      exact ⟨(Nat.coprime_two_right.mpr (Nat.not_even_iff_odd.mp (fun h => he (even_iff_two_dvd.mp h)))).dvd_of_dvd_mul_left hd,he⟩
    · rintro ⟨hd,he⟩
      exact ⟨hd.mul_left _,he⟩
  have hsum (a : ℕ) : (∑ d ∈ a.divisors with 2∣d, d) + (∑ d ∈ a.divisors with ¬2∣d, d) = σ 1 a := by
    rw [sum_filter_add_sum_filter_not,ArithmeticFunction.sigma_one_apply]
  have hn' := mul_ne_zero (by decide : 2≠0) hn
  have ha := hsum (2*n)
  rw [even_divisor_sum hn',if_pos (dvd_mul_right ..),Nat.mul_div_cancel_left _ (by decide : 0<2),hodd] at ha
  have hb := hsum n
  rw [even_divisor_sum hn] at hb
  omega

lemma eCoeff_even (n : ℕ) : eCoeff (2*n) + 2*sieve 2 eCoeff n = 3*eCoeff n := by
  by_cases hn : n=0
  · subst n; norm_num [sieve,eCoeff]
  have hs := sigma_two_recurrence hn
  have h2n := mul_ne_zero (by decide : 2≠0) hn
  by_cases hd : 2∣n
  · have hn' : n/2≠0 := by obtain ⟨k,rfl⟩:=hd; simp_all
    rw [if_pos hd] at hs
    simp only [sieve,hd,if_true,eCoeff,if_neg hn',if_neg hn,if_neg h2n]
    have hh : (σ 1 (2*n):ℂ)+2*(σ 1 (n/2):ℂ) =3*(σ 1 n:ℂ) := by exact_mod_cast hs
    linear_combination -24*hh
  · rw [if_neg hd,add_zero] at hs
    simp [sieve,hd,eCoeff,h2n,hn,hs]
    ring

lemma companion_coeff (n : ℕ) : 3*((quatShell n).card:ℂ)*(-1)^n =
    8*sieve 4 eCoeff n + eCoeff n - 6*sieve 2 eCoeff n := by
  rw [theta_four_coeff]
  by_cases hd : 2∣n
  · obtain ⟨r,rfl⟩ := hd
    have he : Even (2*r) := ⟨r,by omega⟩
    rw [he.neg_one_pow,mul_one]
    have h4 : sieve 4 eCoeff (2*r) = sieve 2 eCoeff r := by
      have hdiv : 4∣2*r ↔ 2∣r := by omega
      simp only [sieve, hdiv, show 2*r/4=r/2 by omega]
    have h2 : sieve 2 eCoeff (2*r)=eCoeff r := by simp [sieve]
    rw [h4,h2]
    linear_combination -2*eCoeff_even r
  · have ho := Nat.not_even_iff_odd.mp (fun h => hd (even_iff_two_dvd.mp h))
    have h4 : ¬4∣n := fun h => hd (dvd_trans (by decide : 2∣4) h)
    simp [ho.neg_one_pow,sieve,h4,hd]

/-- 3θ₄(τ)^4=8E₂(2τ)+E₂(τ/2)−6E₂(τ), where θ₄(τ)=θ₃(τ+1). -/
theorem theta_four_E2_companion (τ z t : UpperHalfPlane) (hz : (z:ℂ)=(τ:ℂ)/2) (ht : (t:ℂ)=2*(τ:ℂ)) :
    3*jacobiTheta ((τ:ℂ)+1)^4 = 8*EisensteinSeries.E2 t + EisensteinSeries.E2 z - 6*EisensteinSeries.E2 τ := by
  let τ' : UpperHalfPlane := ⟨(τ:ℂ)+1,by simpa using τ.im_pos⟩
  have hq : qHalf (τ':ℂ) = -qHalf τ := by
    change Complex.exp (π*I*((τ:ℂ)+1)) = -Complex.exp (π*I*(τ:ℂ))
    rw [mul_add,mul_one,Complex.exp_add,Complex.exp_pi_mul_I,mul_neg_one]
  have eqz : Complex.exp (2*π*I*(z:ℂ)) = qHalf τ := by rw [hz,qHalf]; congr 1; ring
  have eqt : Complex.exp (2*π*I*(t:ℂ)) = (qHalf τ)^4 := by
    rw [ht,qHalf,←Complex.exp_nat_mul]; congr 1; push_cast; ring
  have eqτ : Complex.exp (2*π*I*(τ:ℂ)) = (qHalf τ)^2 := by
    rw [qHalf,←Complex.exp_nat_mul]; congr 1; push_cast; ring
  have hz' : HasSum (fun n => eCoeff n * (qHalf τ)^n) (EisensteinSeries.E2 z) := by
    simpa only [eqz,smul_eq_mul,eCoeff] using EisensteinSeries.hasSum_qExpansion_E2 z
  have ht' : HasSum (fun n => eCoeff n * ((qHalf τ)^4)^n) (EisensteinSeries.E2 t) := by
    simpa only [eqt,smul_eq_mul,eCoeff] using EisensteinSeries.hasSum_qExpansion_E2 t
  have hτ' : HasSum (fun n => eCoeff n * ((qHalf τ)^2)^n) (EisensteinSeries.E2 τ) := by
    simpa only [eqτ,smul_eq_mul,eCoeff] using EisensteinSeries.hasSum_qExpansion_E2 τ
  have hE := (((dilated_hasSum (by decide : 0<4) ht').mul_left 8).add hz').sub ((dilated_hasSum (by decide : 0<2) hτ').mul_left 6)
  have hθ := (theta_four_shell τ').mul_left 3
  rw [hq] at hθ
  apply hθ.unique
  apply hE.congr_fun
  intro n
  rw [neg_pow]
  linear_combination (qHalf τ)^n * companion_coeff n

end TunnellQuaternion

end

section

/- The Fermat-quartic equation and holomorphic differential for the conductor-32 eta product. -/

namespace TunnellLambda
open Complex hiding eta
open ModularForm EisensteinSeries Filter Set
open UpperHalfPlane hiding I
open scoped Real Topology

private lemma theta_constants {z : ℂ} (hz : 0<z.im) :
    jacobiTheta (4*z) = eta (4*z)^5/(eta (2*z)^2*eta (8*z)^2) ∧
    jacobiTheta (4*z+1) = eta (2*z)^2/eta (4*z) := by
  obtain ⟨h₃,h₄⟩ := theta_eta (2*z) (scale_mem hz 2 (by decide))
  rw [show 2*(2*z)=4*z by ring,show 4*(2*z)=8*z by ring] at h₃
  rw [show 2*(2*z)=4*z by ring] at h₄
  have ha : eta (2*z)≠0 := eta_ne_zero (scale_mem hz 2 (by decide))
  have hb : eta (4*z)≠0 := eta_ne_zero (scale_mem hz 4 (by decide))
  have hc : eta (8*z)≠0 := eta_ne_zero (scale_mem hz 8 (by decide))
  exact ⟨(eq_div_iff (mul_ne_zero (pow_ne_zero 2 ha) (pow_ne_zero 2 hc))).mpr (by simpa only [mul_assoc] using h₃),
    (eq_div_iff hb).mpr h₄⟩

private lemma derivs {z : ℂ} (hz : 0<z.im) :
    HasDerivAt U (U z*(4*Real.pi*I*jacobiTheta (4*z)^4)) z ∧
    HasDerivAt X (X z*(2*Real.pi*I*jacobiTheta (4*z+1)^4)) z := by
  let a (k : ℕ) (hk : 0<k) : ℍ := ⟨(k:ℂ)*z,scale_mem hz k hk⟩
  have hτ := TunnellQuaternion.theta_four_E2 (a 4 (by decide)) (a 2 (by decide)) (a 8 (by decide))
    (by dsimp [a]; ring) (by dsimp [a]; ring)
  have hτ' := TunnellQuaternion.theta_four_E2_companion (a 4 (by decide)) (a 2 (by decide)) (a 8 (by decide))
    (by dsimp [a]; ring) (by dsimp [a]; ring)
  change 3*jacobiTheta (4*z)^4 = 4*E2 (a 8 (by decide))-E2 (a 2 (by decide)) at hτ
  change 3*jacobiTheta (4*z+1)^4 = 8*E2 (a 8 (by decide))+E2 (a 2 (by decide))-6*E2 (a 4 (by decide)) at hτ'
  constructor
  · apply (hasDerivAt_U hz).congr_deriv
    change U z*(4*Real.pi*I/3*(4*E2 (a 8 (by decide))-E2 (a 2 (by decide)))) = _
    rw [←hτ]
    ring
  · have ha := eta_deriv hz 2 (by decide)
    have hb := eta_deriv hz 4 (by decide)
    have hc := eta_deriv hz 8 (by decide)
    norm_num only [Nat.cast_ofNat] at ha hb hc
    have hb0 : eta (4*z) ≠ 0 := eta_ne_zero (scale_mem hz 4 (by decide))
    apply (((((ha.pow 4).const_mul 4).mul (hc.pow 8)).div (hb.pow 12) (pow_ne_zero 12 hb0))).congr_deriv
    simp only [Pi.pow_apply,Pi.mul_apply,X]
    change _ = _*(2*Real.pi*I*jacobiTheta (4*z+1)^4)
    have h4 : jacobiTheta (4*z+1)^4 = (8*E2 (a 8 (by decide))+E2 (a 2 (by decide))-6*E2 (a 4 (by decide)))/3 := by linear_combination hτ'/3
    rw [h4]
    dsimp only [a]
    norm_num only [Nat.cast_ofNat]
    field_simp
    ring

theorem X_deriv {z : ℂ} (hz : 0<z.im) :
    HasDerivAt X (8*Real.pi*I*(eta (4*z)^2*eta (8*z)^2)*Y z^3) z := by
  apply (derivs hz).2.congr_deriv
  rw [(theta_constants hz).2]
  unfold X Y
  have hb : eta (4*z)≠0 := eta_ne_zero (scale_mem hz 4 (by decide))
  field_simp
  ring

noncomputable def K (z : ℂ) := (X z^2)⁻¹-(U z)⁻¹

lemma K_deriv {z : ℂ} (hz : 0<z.im) : HasDerivAt K 0 z := by
  have ha : eta (2*z)≠0 := eta_ne_zero (scale_mem hz 2 (by decide))
  have hb : eta (4*z)≠0 := eta_ne_zero (scale_mem hz 4 (by decide))
  have hc : eta (8*z)≠0 := eta_ne_zero (scale_mem hz 8 (by decide))
  have hx : X z≠0 := by simp [X,ha,hb,hc]
  have hu : U z≠0 := by simp [U,ha,hc]
  obtain ⟨hU,hX⟩ := derivs hz
  have hrel : X z^2 * jacobiTheta (4*z)^4 = U z * jacobiTheta (4*z+1)^4 := by
    rw [(theta_constants hz).1,(theta_constants hz).2]
    unfold X U
    field_simp [ha,hb,hc]
    <;> ring
  apply (((hX.pow 2).inv (pow_ne_zero 2 hx)).sub (hU.inv hu)).congr_deriv
  simp only [Pi.pow_apply]
  calc _ = 4*Real.pi*I*(X z^2 *jacobiTheta (4*z)^4 - U z*jacobiTheta (4*z+1)^4)/(X z^2*U z) := by
          field_simp [hx,hu]
          <;> ring
       _ = 0 := by rw [hrel,sub_self,mul_zero,zero_div]

theorem quartic {z : ℂ} (hz : 0<z.im) : X z^2 + Y z^4 = 1 := by
  obtain ⟨c,hc⟩ := isOpen_upperHalfPlaneSet.exists_is_const_of_deriv_eq_zero
    (Convex.isPreconnected (convex_halfSpace_im_gt 0))
    (fun w hw => (K_deriv hw).differentiableAt.differentiableWithinAt)
    (fun w hw => (K_deriv hw).deriv)
  have hconst : Tendsto (fun t : ℝ => K (I*t)) (𝓝[>] 0) (𝓝 c) := by
    apply tendsto_nhds_of_eventually_eq
    filter_upwards [self_mem_nhdsWithin] with t ht
    exact hc _ (by change 0<(I*(t:ℂ)).im; simpa [mul_im] using (show 0<t from ht))
  have hlim : Tendsto (fun t : ℝ => K (I*t)) (𝓝[>] 0) (𝓝 1) := by
    simpa [K] using ((X_atZero.pow 2).inv₀ (by norm_num)).sub inv_U_atZero
  have he := hc z hz
  rw [tendsto_nhds_unique hconst hlim] at he
  change (X z^2)⁻¹-(U z)⁻¹=1 at he
  have ha : eta (2*z)≠0 := eta_ne_zero (scale_mem hz 2 (by decide))
  have hb : eta (4*z)≠0 := eta_ne_zero (scale_mem hz 4 (by decide))
  have hc' : eta (8*z)≠0 := eta_ne_zero (scale_mem hz 8 (by decide))
  have hx : X z≠0 := by simp [X,ha,hb,hc']
  have hu : U z≠0 := by simp [U,ha,hc']
  have hs := square_ratio z hz
  field_simp [hx,hu] at he
  apply mul_left_cancel₀ hu
  linear_combination -he - hs

end TunnellLambda

end

section

namespace TunnellPeriodEnd

open TunnellCMLSeries TunnellLambda TunnellFricke

theorem exact_base : baseConstant = (TunnellPeriodCoates.realPeriod 1:ℂ)/4 := by
  apply critical_from_differential
  · intro t ht
    exact quartic (by simpa using ht : 0<(Complex.I*(t:ℂ)).im)
  · intro t ht
    simpa only [TunnellFricke.h,show 2*(4*(Complex.I*(t:ℂ))) = 8*(Complex.I*t) by ring] using
      X_deriv (by simpa using ht : 0<(Complex.I*(t:ℂ)).im)

theorem twist_period (n : ℕ) (hs : Squarefree n) (hn : n%8=2) (L : ℂ → ℂ)
    (he : AnalyticOnNhd ℂ L Set.univ) (hp : ∀ s : ℝ, 2<s →
      HasProd (fun p : Nat.Primes => if p.val ∣ 2*n then (1:ℂ) else
        let T := (p.val:ℂ)^(-(s:ℂ))
        (1-(curveTrace n p:ℂ)*T+(p.val:ℂ)*T^2)⁻¹) (L s)) :
    ∃ r : ℚ, L 1 = (r:ℂ)*(TunnellPeriodCoates.realPeriod 1:ℂ)/(Real.sqrt n:ℂ) := by
  obtain ⟨r,hr⟩ := normalized_twists n hn hs L he hp
  rw [exact_base] at hr
  have hn0 : 0<n := by omega
  have hne : (Real.sqrt n:ℂ)≠0 := Complex.ofReal_ne_zero.mpr (Real.sqrt_pos.mpr (Nat.cast_pos.mpr hn0)).ne'
  refine ⟨r/4,(eq_div_iff hne).mpr ?_⟩
  push_cast
  linear_combination hr

end TunnellPeriodEnd

end

theorem OMA.solution : TunnellEvenRankReduction.H1 := by
  intro n hs hn _ L hL
  exact TunnellPeriodEnd.twist_period n hs hn L hL.1 hL.2
end TunnellEvenRootPeriod
#print axioms TunnellEvenRootPeriod.OMA.solution
