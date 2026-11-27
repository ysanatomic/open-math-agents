import Mathlib.RingTheory.Henselian
import Mathlib.Data.Nat.Choose.Dvd
import Mathlib.FieldTheory.Finite.Basic
import Mathlib.Tactic

/-! The first p-power step in the local-unit filtration at tame ramification degree p−1. -/
namespace TunnellPrincipalPowers

open Polynomial
variable {R : Type} [CommRing R] {p : ℕ} [Fact p.Prime]

private def coef (p:ℕ) (t u:R) (k:ℕ) : R := u*(p.choose k / p : ℕ)*t^(k-1)

private noncomputable def liftPoly (p:ℕ) (t u c:R) : R[X] :=
  X^p + ((∑ k ∈ Finset.range p, C (coef p t u k)*X^k)-C c)

private lemma monic_lift [Nontrivial R] (t u c:R) : (liftPoly p t u c).Monic := by
  apply monic_X_pow_add
  apply (degree_sub_le _ _).trans_lt
  apply max_lt
  · apply (degree_sum_le _ _).trans_lt
    apply (Finset.sup_lt_iff (WithBot.bot_lt_coe p)).mpr
    intro k hk
    exact (degree_C_mul_X_pow_le _ _).trans_lt (WithBot.coe_lt_coe.mpr (Finset.mem_range.mp hk))
  · exact degree_C_le.trans_lt (WithBot.coe_lt_coe.mpr (Fact.out:p.Prime).pos)

private lemma lift_evaluation (t u c y:R) (hu : u*t^(p-1)=(p:R)) :
    t^p*(liftPoly p t u c).eval y=(1+t*y)^p-(1+t^p*c) := by
  classical
  have hp : p.Prime := Fact.out
  have term (k:ℕ) (hk:k∈Finset.range p) :
      (t*y)^k * (p.choose k:R) = t^p*(coef p t u k*y^k) + if k=0 then 1 else 0 := by
    by_cases h0 : k=0
    · subst k; simp [coef,Nat.div_eq_of_lt hp.one_lt]
    · have hpk := Nat.mul_div_cancel' (hp.dvd_choose_self h0 (Finset.mem_range.mp hk))
      have hc : (p:R)*(p.choose k/p:ℕ)=(p.choose k:R) := by simpa only [Nat.cast_mul] using congrArg ((↑):ℕ→R) hpk
      have he : t^p*t^(k-1)=t^(p-1)*t^k := by
        rw [←pow_add,←pow_add,show p+(k-1)=p-1+k by have := hp.pos; omega]
      simp only [if_neg h0,add_zero,coef,mul_pow]
      linear_combination -t^k*y^k*hc - (p.choose k/p:ℕ)*t^k*y^k*hu - u*(p.choose k/p:ℕ)*y^k*he
  have hh := Finset.sum_congr rfl term
  simp only [Finset.sum_add_distrib,← Finset.mul_sum] at hh
  simp only [Finset.sum_ite_eq',Finset.mem_range.mpr hp.pos,if_true] at hh
  rw [add_comm 1,add_pow,Finset.sum_range_succ]
  simp only [one_pow,mul_one,zero_le,pow_zero,Nat.choose_self,Nat.cast_one,one_mul] 
  simp only [liftPoly,eval_add,eval_sub,eval_finsetSum,eval_mul,eval_C,eval_pow,eval_X]
  rw [hh,mul_pow]; ring

private lemma lift_reduction (ρ:R→+* ZMod p) (t u c:R) (ht : ρ t=0) :
    (liftPoly p t u c).map ρ = X^p + (C (ρ u)*X-C (ρ c)) := by
  classical
  have hp:p.Prime := Fact.out
  simp only [liftPoly,Polynomial.map_add,Polynomial.map_sub,Polynomial.map_pow,Polynomial.map_X,
    Polynomial.map_sum,Polynomial.map_mul,Polynomial.map_C]
  congr 2
  rw [Finset.sum_eq_single 1]
  · simp [coef,Nat.div_self hp.pos]
  · intro k hk h1
    by_cases h0:k=0
    · subst k; simp [coef,Nat.div_eq_of_lt hp.one_lt]
    · have : k-1≠0 := by omega
      simp [coef,ht,zero_pow this]
  · simp [Finset.mem_range.mpr hp.one_lt]

open IsLocalRing in
private lemma lift_root [HenselianLocalRing R] (ρ:R→+*ZMod p) (hsur:Function.Surjective ρ)
    (t u c:R) (ht:ρ t=0) (hu : u*t^(p-1)=(p:R)) (hunit:ρ u≠0)
    (y₀:ZMod p) (hy : y₀+ρ u*y₀=ρ c) :
    ∃ y:R, (1+t*y)^p = 1+t^p*c ∧ ρ y=y₀ := by
  have : Nontrivial R := ρ.domain_nontrivial
  let f := liftPoly p t u c
  have hr := lift_reduction ρ t u c ht
  have hiff : HenselianLocalRing R ↔ ∀ {J : Type} [Field J], ∀ (π : R →+* J), Function.Surjective π →
      ∀ q : R[X], q.Monic → ∀ y₀ : J, q.eval₂ π y₀=0 → q.derivative.eval₂ π y₀≠0 →
        ∃ y:R, q.IsRoot y ∧ π y=y₀ :=
    (HenselianLocalRing.TFAE R).out 0 2 rfl rfl
  obtain ⟨y,hyf,hyr⟩ := hiff.mp (show HenselianLocalRing R from inferInstance) (J:=ZMod p) ρ hsur f (monic_lift t u c) y₀ (by
      rw [eval₂_eq_eval_map,show f.map ρ=_ from hr]; simp [ZMod.pow_card]; linear_combination hy) (by
      rw [eval₂_eq_eval_map,←derivative_map,show f.map ρ=_ from hr]
      simpa [derivative_X_pow] using hunit)
  have h := lift_evaluation t u c y hu
  have hef : (liftPoly p t u c).eval y=0 := hyf
  rw [hef,mul_zero] at h
  exact ⟨y,sub_eq_zero.mp h.symm,hyr⟩

/-- The normalized p-th power map is surjective at depth p whenever the
first ramification unit has residue distinct from zero and minus one. -/
theorem pth_root_principal_of_residue [HenselianLocalRing R] (ρ:R→+*ZMod p)
    (hsur:Function.Surjective ρ) (t u:R) (ht:ρ t=0) (hu:u*t^(p-1)=(p:R))
    (hunit:ρ u≠0) (h1:1+ρ u≠0) (c:R) : ∃ y:R, (1+t*y)^p=1+t^p*c := by
  obtain ⟨y,hy,_⟩ := lift_root ρ hsur t u c ht hu hunit (ρ c/(1+ρ u)) (by field_simp)
  exact ⟨y,hy⟩

/-- At a tame p−1 extension with residue F_p and without p-th roots of unity,
    every sufficiently deep principal unit, already of level p, is a p-th power. -/
theorem pth_root_principal [HenselianLocalRing R] [IsDomain R] (ρ:R→+*ZMod p)
    (hsur:Function.Surjective ρ) (t u:R) (ht0:t≠0) (ht:ρ t=0) (hu:u*t^(p-1)=(p:R))
    (hunit:ρ u≠0) (hmu:∀ x:R,x^p=1 → x=1) (c:R) : ∃ y:R, (1+t*y)^p=1+t^p*c := by
  have h1 : 1+ρ u≠0 := by
    intro hz
    obtain ⟨y,hy,hy'⟩ := lift_root ρ hsur t u 0 ht hu hunit 1 (by simpa using hz)
    have he := hmu _ (by simpa using hy)
    have hty : t*y=0 := by simpa using he
    have hy0 := (mul_eq_zero.mp hty).resolve_left ht0
    simpa [hy0] using hy'
  exact pth_root_principal_of_residue ρ hsur t u ht hu hunit h1 c

#print axioms pth_root_principal
end TunnellPrincipalPowers
