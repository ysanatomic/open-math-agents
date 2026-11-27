import TunnellGaussian

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
