import FormalConjectures.Wikipedia.CongruentNumber

/-! Primary generators in the Gaussian coefficient formula for η(4τ)²η(8τ)². -/

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
