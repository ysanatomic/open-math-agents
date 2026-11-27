import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H2_R1
import Mathlib

/-! A normalized pth-power polynomial converts the principal-unit equation into a simple-root application of Hensel's lemma. -/
namespace OMA.NormalizedPrincipalPowers
open IsLocalRing
open scoped Classical
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

private theorem powers_of_uniformizer {R:Type} [CommRing R] [IsDomain R] [IsLocalRing R] (p:ℕ) (s t:R)
    (hs:maximalIdeal R=Ideal.span {s}) (ht:maximalIdeal R=Ideal.span {t})
    (h:∀c:R,∃y:R,(1+s*y)^p=1+s^p*c) (c:R) : ∃y:R,(1+t*y)^p=1+t^p*c := by
  obtain ⟨u,hu⟩:=Ideal.span_singleton_eq_span_singleton.mp (hs.symm.trans ht)
  obtain ⟨y,hy⟩:=h ((u:R)^p*c)
  refine ⟨(↑u⁻¹:R)*y,?_⟩
  rw [←hu]
  have he:(s*(u:R))*((↑u⁻¹:R)*y)=s*y:=by
    calc _=s*((u:R)*↑u⁻¹)*y:=by ring
         _=s*y:=by rw [Units.mul_inv,mul_one]
  rw [he,mul_pow,mul_assoc]
  exact hy


theorem surjective (O:Type) [CommRing O] [IsDomain O] [HenselianLocalRing O] (p:ℕ) (hp:p.Prime)
    (fields:Nonempty (ResidueField O≃+*ZMod p)) (s:O) (u:Oˣ) (hs:maximalIdeal O=Ideal.span {s})
    (hu:(u:O)*s^(p-1)=(p:O)) (hr:residue O (u:O)≠ -1) (t:O) (ht:maximalIdeal O=Ideal.span {t}) :
    ∀c:O,∃y:O,(1+t*y)^p=1+t^p*c := by
  letI:Fact p.Prime:=⟨hp⟩
  obtain ⟨ρ⟩:=fields
  let r:=ρ.toRingHom.comp (residue O)
  have hm:s∈maximalIdeal O:=hs ▸ Ideal.mem_span_singleton_self _
  have hz:r s=0:=by change ρ (residue O s)=0; rw [(residue_eq_zero_iff _).mpr hm,map_zero]
  have h₁:1+r (u:O)≠0:=by
    intro eq
    apply hr
    apply ρ.injective
    change 1+ρ (residue O (u:O))=0 at eq
    rw [map_neg,map_one]
    linear_combination eq
  exact powers_of_uniformizer p s t hs ht
    (pth_root_principal_of_residue r (ρ.surjective.comp residue_surjective) s (u:O) hz hu (u.isUnit.map r).ne_zero h₁)

end OMA.NormalizedPrincipalPowers

theorem OMA.solution : OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H2_R1.H2 :=
  OMA.NormalizedPrincipalPowers.surjective
