import TunnellCMGaloisDistribution
import Mathlib.NumberTheory.NumberField.Basic

/-! Descent of the integral elliptic units to the field of a division point. -/
namespace TunnellCMDescendedIntegers
open NumberField WeierstrassCurve WeierstrassCurve.Affine TunnellKummer
open TunnellCMCoefficientNorm TunnellCMGaloisDistribution
open scoped NumberField
noncomputable section
variable {K F B : Type*} [Field K] [Field F] [Field B] [Algebra K F] [Algebra K B]
  [Algebra F B] [IsScalarTower K F B] [Normal K B] [DecidableEq F] [DecidableEq B]
variable {ι κ : Type*} [Fintype ι] [Fintype κ]
variable (W : WeierstrassCurve K) (U : ι → CurvePoints W F) (c : κ → F) (w : ι → ℤ)
local notation "emb" => IsScalarTower.toAlgHom K F B

lemma unit_descent (D : IntermediateField K B) (u : (𝓞 B)ˣ) (h : (u.val : B)∈D) :
    ∃ v : (𝓞 D)ˣ, ((v.val.val : D) : B)=u.val.val := by
  let x : D := ⟨u.val.val,h⟩
  have hx : IsIntegral ℤ x :=
    (isIntegral_algHom_iff (D.val.restrictScalars ℤ) D.val.injective).mp u.val.property
  have hi : (↑(u⁻¹).val : B)=x.val⁻¹ := by
    exact Units.val_inv_eq_inv_val (Units.map (algebraMap (𝓞 B) B).toMonoidHom u)
  have hxi : IsIntegral ℤ x⁻¹ := by
    apply (isIntegral_algHom_iff (D.val.restrictScalars ℤ) D.val.injective).mp
    change IsIntegral ℤ x.val⁻¹
    rw [← hi]
    exact (u⁻¹).val.property
  have h0 : x≠0 := fun he => u.ne_zero (Subtype.ext (congrArg (fun t : D => (t:B)) he))
  exact ⟨⟨⟨x,hx⟩,⟨x⁻¹,hxi⟩,Subtype.ext (mul_inv_cancel₀ h0),Subtype.ext (inv_mul_cancel₀ h0)⟩,rfl⟩

theorem norm_unit [Fintype (F →ₐ[K] B)] (D : IntermediateField K B) [IsGalois D B]
    {m : ℕ} (H : ∀ Q : CurvePoints W B, m • Q=0 →
      ∃ u : (𝓞 B)ˣ, u.val.val=atEmbedding W U c w emb Q)
    (P : CurvePoints W B) (hp : m • P=0)
    (hD : ∀ τ : B ≃ₐ[D] B, act W (τ.restrictScalars K) P=P) :
    ∃ u : (𝓞 D)ˣ, ((u.val.val : D) : B)=normFunction W U c w P := by
  classical
  have eg (σ : F →ₐ[K] B) : ∃ u : (𝓞 B)ˣ, u.val.val=atEmbedding W U c w σ P := by
    obtain ⟨τ,hτ⟩ := lift_embedding σ
    obtain ⟨u,hu⟩ := H (act W τ⁻¹ P) (by rw [← map_nsmul,hp,map_zero])
    refine ⟨Units.map (RingOfIntegers.mapRingHom τ.toRingHom).toMonoidHom u,?_⟩
    change τ u.val.val=_
    rw [hu,embedding_covariant,hτ,act_inv_apply]
  choose us hus using eg
  let u : (𝓞 B)ˣ := ∏ σ, us σ
  have hu : u.val.val=normFunction W U c w P := by
    change algebraMap (𝓞 B) B (Units.coeHom _ u) = _
    simp only [u,map_prod,normFunction]
    exact Finset.prod_congr rfl (fun σ _ => hus σ)
  obtain ⟨v,hv⟩ := unit_descent D u (hu ▸ at_rational_point W U c w D P hD)
  exact ⟨v,hv.trans hu⟩

end
end TunnellCMDescendedIntegers
#print axioms TunnellCMDescendedIntegers.norm_unit
