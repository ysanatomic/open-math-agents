import TunnellCMToricDivision
import TunnellCMGaussianCRT

/-! The Gaussian division group at a split prime of norm p is cyclic of order p^r. -/
namespace TunnellCMTorsionOrder

open Complex LSG.Weierstrass LSG.LemniscateIndep TunnellCMToricDivision TunnellCMLemniscate TunnellCoates

variable (n : ℕ) (hn : 0<n)
local notation "M" => twistPeriods n hn

lemma zero_iff (z : ℂ) : expE M z=0 ↔ z∈(M).lattice := by
  by_cases h : z∈(M).lattice
  · simp [expE_of_mem M h,h]
  · simp [expE_of_notMem M h,h]

noncomputable def generator (a : GaussianInt) : (curveA M).Point := expE M ((realPeriod n:ℂ)/(a:ℂ))

lemma annihilator {a : GaussianInt} (ha : a≠0) (b : GaussianInt) :
    action n hn b (generator n hn a)=0 ↔ a∣b := by
  have ah : (a:ℂ)≠0 := fun e => ha (GaussianInt.toComplex_eq_zero.mp e)
  have oh : (realPeriod n:ℂ)≠0 := ofReal_ne_zero.mpr (realPeriod_pos (by exact_mod_cast hn)).ne'
  rw [generator,action_exp,zero_iff,mem_lattice_sq (a := realPeriod n) rfl rfl]
  constructor
  · rintro ⟨k,l,he⟩
    refine ⟨⟨k,l⟩,GaussianInt.toComplex_inj.mp ?_⟩
    rw [GaussianInt.toComplex_mul,GaussianInt.toComplex_def' k l]
    field_simp [ah] at he
    simpa only [mul_comm] using he.symm
  · rintro ⟨q,rfl⟩
    refine ⟨q.re,q.im,?_⟩
    rw [GaussianInt.toComplex_mul,GaussianInt.toComplex_def q]
    field_simp [ah]
    <;> ring

lemma add_action (b c : GaussianInt) (P : (curveA M).Point) :
    action n hn (b-c) P=action n hn b P-action n hn c P := by
  obtain ⟨z,rfl⟩ := TunnellCMTorus.exp_surjective M P
  rw [action_exp,action_exp,action_exp,GaussianInt.toComplex_sub,sub_mul,sub_eq_add_neg,expE_add,expE_neg]
  rfl

lemma int_action (k : ℤ) (P : (curveA M).Point) : action n hn (k:GaussianInt) P=k • P := by
  change ((k:GaussianInt).re) • P+((k:GaussianInt).im) • rot n hn P=k • P
  simp

lemma generator_orbit {a : GaussianInt} (ha : a≠0) (P : (curveA M).Point)
    (hp : action n hn a P=0) : ∃ b, action n hn b (generator n hn a)=P := by
  obtain ⟨z,rfl⟩ := TunnellCMTorus.exp_surjective M P
  rw [action_exp,zero_iff,mem_lattice_sq (a := realPeriod n) rfl rfl] at hp
  obtain ⟨k,l,h⟩ := hp
  refine ⟨⟨k,l⟩,?_⟩
  rw [generator,action_exp,GaussianInt.toComplex_def']
  congr 1
  have ah : (a:ℂ)≠0 := fun e => ha (GaussianInt.toComplex_eq_zero.mp e)
  field_simp [ah]
  linear_combination h

theorem split_generator {p : ℕ} (hp : p.Prime) (h2 : p≠2) {a : GaussianInt} (h : a.norm.natAbs=p)
    (r : ℕ) : ∃ T : (curveA M).Point, action n hn (a^r) T=0 ∧
      addOrderOf T=p^r ∧ ∀ P, action n hn (a^r) P=0 → ∃ k : ℤ, k • T=P := by
  have ha0 : a≠0 := by intro he; subst a; exact hp.ne_zero (by simpa using h.symm)
  have ha := pow_ne_zero r ha0
  let T := generator n hn (a^r)
  obtain ⟨hc,hd⟩ := TunnellCMGaussianCRT.prime_power_real hp h2 h r
  have hz (k : ℤ) : k • T=0 ↔ (p:ℤ)^r∣k := by rw [← int_action,annihilator n hn ha,hd]
  refine ⟨T,(annihilator n hn ha _).mpr dvd_rfl,?_,?_⟩
  · apply Nat.dvd_antisymm
    · rw [addOrderOf_dvd_iff_nsmul_eq_zero,← natCast_zsmul,hz,Nat.cast_pow]
    · have e := (hz (addOrderOf T)).mp (by simp)
      exact_mod_cast e
  · intro P hP
    obtain ⟨b,hb⟩ := generator_orbit n hn ha P hP
    obtain ⟨k,hk⟩ := hc b
    have he := (annihilator n hn ha _).mpr hk
    rw [add_action,sub_eq_zero,int_action] at he
    exact ⟨k,he.symm.trans hb⟩

end TunnellCMTorsionOrder

#print axioms TunnellCMTorsionOrder.split_generator
