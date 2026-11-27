import TunnellGaussianHecke

/-! Real generators and annihilators in the quotient of the Gaussian integers at a split prime. -/
namespace TunnellCMGaussianCRT

open TunnellGaussian

lemma coprime_conj {p : ℕ} (hp : p.Prime) (h2 : p≠2) {z : GaussianInt} (hn : z.norm.natAbs=p) :
    IsCoprime z (star z) := by
  apply (norm_prime hp hn).coprime_iff_not_dvd.mpr
  intro h
  have he : z+star z=((2*z.re:ℤ):GaussianInt) := by ext <;> simp [two_mul]
  have hd : z ∣ ((2*z.re:ℤ):GaussianInt) := he ▸ dvd_add (dvd_refl z) h
  obtain ⟨w,hw⟩ := hd
  have h := congrArg (fun a : GaussianInt => a.norm.natAbs) hw
  have e : (2*z.re.natAbs)^2=p*w.norm.natAbs := by
    have he : Zsqrtd.norm (2:GaussianInt)=4 := by decide
    simp [Zsqrtd.norm_intCast,Int.natAbs_mul,hn,he,sq] at h ⊢
    nlinarith
  have hpow := hp.dvd_of_dvd_pow (show p∣(2*z.re.natAbs)^2 from ⟨_,e⟩)
  have hdv : p∣z.re.natAbs := (hp.dvd_mul.mp hpow).resolve_left
    (fun h => h2 ((Nat.prime_dvd_prime_iff_eq hp Nat.prime_two).mp h))
  have hn' : z.re.natAbs^2+z.im.natAbs^2=p := by simpa [GaussianInt.natAbs_norm_eq,sq] using hn
  have hz : z.re.natAbs=0 := by
    by_contra hh
    have he := Nat.le_of_dvd (Nat.pos_of_ne_zero hh) hdv
    have hp2 := hp.two_le
    nlinarith [sq_nonneg (z.im.natAbs:ℤ),Nat.pow_le_pow_left he 2]
  rw [hz] at hn'
  simp at hn'
  exact Nat.Prime.not_prime_pow (by decide : 2≤2) (hn' ▸ hp)

lemma real_representative {a : GaussianInt} (hc : IsCoprime a (star a)) (b : GaussianInt) :
    ∃ k : ℤ, a∣(b-(k:GaussianInt)) := by
  obtain ⟨u,v,huv⟩ := hc
  let c := b*(v*star a)
  have hreal : ((2*c.re:ℤ):GaussianInt)=c+star c := by ext <;> simp [two_mul]
  refine ⟨2*c.re,?_⟩
  rw [hreal]
  have h1 : a∣(b-c) := by
    refine ⟨b*u,?_⟩
    dsimp [c]
    linear_combination -b*huv
  have h2 : a∣star c := by
    refine ⟨star v*star b,?_⟩
    simp [c,mul_comm,mul_left_comm,mul_assoc]
  simpa [sub_sub] using dvd_sub h1 h2

lemma int_annihilator {a : GaussianInt} (hc : IsCoprime a (star a)) (k : ℤ) :
    a∣(k:GaussianInt) ↔ a.norm∣k := by
  constructor
  · rintro ⟨v,hv⟩
    have hs : star a∣(k:GaussianInt) := ⟨star v,by simpa [mul_comm] using congrArg star hv⟩
    obtain ⟨w,hw⟩ := hc.mul_dvd ⟨v,hv⟩ hs
    rw [← Zsqrtd.norm_eq_mul_conj] at hw
    exact ⟨w.re,by simpa using congrArg Zsqrtd.re hw⟩
  · rintro ⟨l,rfl⟩
    rw [Int.cast_mul,Zsqrtd.norm_eq_mul_conj,mul_assoc]
    exact dvd_mul_right _ _

theorem prime_power_real {p : ℕ} (hp : p.Prime) (h2 : p≠2) {z : GaussianInt} (hn : z.norm.natAbs=p)
    (r : ℕ) : (∀ b : GaussianInt, ∃ k : ℤ, z^r ∣ b-k) ∧
      ∀ k : ℤ, z^r∣(k:GaussianInt) ↔ (p:ℤ)^r∣k := by
  have hc : IsCoprime (z^r) (star (z^r)) := by simpa using (coprime_conj hp h2 hn).pow (m := r) (n := r)
  refine ⟨real_representative hc,fun k => ?_⟩
  have en : (z^r).norm=z.norm^r := map_pow Zsqrtd.normMonoidHom z r
  rw [int_annihilator hc,en,← GaussianInt.abs_natCast_norm z,hn]

end TunnellCMGaussianCRT

#print axioms TunnellCMGaussianCRT.prime_power_real
