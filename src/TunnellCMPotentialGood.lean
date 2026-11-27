import TunnellCoates
import Mathlib.AlgebraicGeometry.EllipticCurve.IsomOfJ
import Mathlib.RingTheory.IntegralClosure.IsIntegral.Basic

/-! Two global integral models with coprime discriminants for the curve of j-invariant 1728. -/
namespace TunnellCMPotentialGood

open WeierstrassCurve TunnellCoates

def model {R : Type*} [CommRing R] (a:R) : WeierstrassCurve R := ⟨a,0,1,0,0⟩

lemma discr {R : Type*} [CommRing R] (a:R) : (model a).Δ=a^3-27 := by
  simp [model,Δ,b₂,b₄,b₆,b₈]
  ring

lemma vanishes_c6 {R : Type*} [CommRing R] (a:R) (ha : a^6-36*a^3+216=0) : (model a).c₆=0 := by
  simp [model,c₆,b₂,b₄,b₆]
  linear_combination -ha

lemma j_value {K : Type*} [Field K] (W : WeierstrassCurve K) [W.IsElliptic] (hW : W.c₆=0) :
    W.j=1728 := by
  have h := W.c_relation
  rw [hW,zero_pow (by decide : 2≠0),sub_zero] at h
  rw [j,Units.val_inv_eq_inv_val,coe_Δ',← h]
  field_simp [W.isUnit_Δ.ne_zero]

lemma short_c6 {R : Type*} [CommRing R] (n:R) : (E n).c₆=0 := by simp [E,c₆,b₂,b₄,b₆]

lemma parameter (K : Type*) [Field K] [CharZero K] [IsAlgClosed K] :
    ∃ a : integralClosure ℤ K, a^6-36*a^3+216=0 := by
  obtain ⟨d,hd⟩ := IsAlgClosed.exists_pow_nat_eq (3:K) (by decide : 0<2)
  obtain ⟨a,ha⟩ := IsAlgClosed.exists_pow_nat_eq (18+6*d) (by decide : 0<3)
  have hd' : IsIntegral ℤ d := IsIntegral.of_pow (n := 2) (by decide) (by rw [hd]; exact isIntegral_natCast (3:ℕ))
  have ha' : IsIntegral ℤ a := IsIntegral.of_pow (n := 3) (by decide) (by rw [ha]; exact (isIntegral_natCast (18:ℕ)).add ((isIntegral_natCast (6:ℕ)).mul hd'))
  refine ⟨⟨a,ha'⟩,Subtype.ext ?_⟩
  change a^6-36*a^3+216=0
  rw [show a^6=(a^3)^2 by ring,ha]
  linear_combination 36*hd

theorem two_models (K : Type*) [Field K] [CharZero K] [IsAlgClosed K] (n:K) (hn : n≠0) :
    ∃ W₁ W₂ : WeierstrassCurve (integralClosure ℤ K), IsCoprime W₁.Δ W₂.Δ ∧
      (∃ C : VariableChange K, C • E n=W₁.map (integralClosure ℤ K).val) ∧
      (∃ C : VariableChange K, C • E n=W₂.map (integralClosure ℤ K).val) := by
  obtain ⟨a,ha⟩ := parameter K
  have hΔ : (model a).Δ*((model a).Δ+18)=27 := by
    rw [discr]
    linear_combination ha
  refine ⟨E 1,model a,?_,?_,?_⟩
  · refine ⟨19,-45*((model a).Δ+18),?_⟩
    rw [E_discriminant,one_pow,mul_one]
    linear_combination -45*hΔ
  · have he : (E (1:integralClosure ℤ K)).map (integralClosure ℤ K).val=E (1:K) := by ext <;> simp [E]
    rw [he]
    letI : (E (1:K)).IsElliptic := E_elliptic (by norm_num) one_ne_zero
    letI : (E n).IsElliptic := E_elliptic (by norm_num) hn
    exact (E n).exists_variableChange_of_j_eq _ ((j_value _ (short_c6 n)).trans (j_value _ (short_c6 (1:K))).symm)
  · have he : (model a).map (integralClosure ℤ K).val=model (a:K) := by ext <;> simp [model]
    rw [he]
    have haK : (a:K)^6-36*(a:K)^3+216=0 := congrArg Subtype.val ha
    have hnK : (model (a:K)).Δ≠0 := by
      intro h
      have e := congrArg ((↑) : integralClosure ℤ K → K) hΔ
      change _= (27:K) at e
      have hdK : ((model (a:K)).Δ)*((model (a:K)).Δ+18)=(27:K) := by
        exact e
      rw [h,zero_mul] at hdK
      norm_num at hdK
    letI : (model (a:K)).IsElliptic := ⟨isUnit_iff_ne_zero.mpr hnK⟩
    letI : (E n).IsElliptic := E_elliptic (by norm_num) hn
    exact (E n).exists_variableChange_of_j_eq _ ((j_value _ (short_c6 n)).trans (j_value _ (vanishes_c6 _ haK)).symm)

end TunnellCMPotentialGood

#print axioms TunnellCMPotentialGood.two_models
