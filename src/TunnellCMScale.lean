import TunnellCMEllipticZeta

/-! Homogeneity of the Weierstrass zeta function under scaling a period lattice. -/

namespace TunnellCMScale

open TunnellEllipticZeta

noncomputable def equiv (L M : PeriodPair) : L.lattice ≃ M.lattice :=
  L.latticeEquivProd.toEquiv.trans M.latticeEquivProd.symm.toEquiv

lemma coe_equiv (L M : PeriodPair) {c : ℂ} (h₁ : M.ω₁=c*L.ω₁) (h₂ : M.ω₂=c*L.ω₂) (l : L.lattice) :
    (equiv L M l:ℂ) = c*(l:ℂ) := by
  obtain ⟨x,rfl⟩ := L.latticeEquivProd.symm.surjective l
  change (M.latticeEquivProd.symm (L.latticeEquivProd (L.latticeEquivProd.symm x)):ℂ) = _
  rw [LinearEquiv.apply_symm_apply,M.latticeEquiv_symm_apply,L.latticeEquiv_symm_apply,h₁,h₂]
  ring

lemma lattice_mem (L M : PeriodPair) {c : ℂ} (hc : c≠0) (h₁ : M.ω₁=c*L.ω₁) (h₂ : M.ω₂=c*L.ω₂) (z : ℂ) :
    c*z ∈ M.lattice ↔ z∈L.lattice := by
  constructor
  · intro h
    obtain ⟨v,hv⟩ := (equiv L M).surjective ⟨_,h⟩
    have e := congrArg Subtype.val hv
    rw [coe_equiv L M h₁ h₂] at e
    exact (mul_left_cancel₀ hc e) ▸ v.property
  · intro h
    rw [← coe_equiv L M h₁ h₂ (⟨z,h⟩ : L.lattice)]
    exact (equiv L M ⟨_,h⟩).property

lemma zeta_scale (L M : PeriodPair) {c : ℂ} (hc : c≠0) (h₁ : M.ω₁=c*L.ω₁) (h₂ : M.ω₂=c*L.ω₂) (z : ℂ) :
    zeta M (c*z)=c⁻¹ * zeta L z := by
  unfold zeta
  rw [← (equiv L M).tsum_eq,← tsum_mul_left]
  apply tsum_congr
  intro w
  rw [coe_equiv L M h₁ h₂,summand,summand,← mul_sub,mul_inv_rev,mul_inv_rev,mul_pow]
  rw [div_eq_mul_inv,div_eq_mul_inv,mul_inv_rev]
  field_simp [hc]
  <;> ring

theorem multiplication_scale (L M : PeriodPair) {c : ℂ} (hc : c≠0) (h₁ : M.ω₁=c*L.ω₁)
    (h₂ : M.ω₂=c*L.ω₂) (a : ℕ) (z : ℂ) :
    multiplicationZeta M a (c*z)=c⁻¹*multiplicationZeta L a z := by
  unfold multiplicationZeta
  rw [mul_left_comm (a:ℂ) c,zeta_scale L M hc h₁ h₂,zeta_scale L M hc h₁ h₂]
  ring

end TunnellCMScale
