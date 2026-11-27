import TunnellCMCoefficientNorm
import Mathlib.FieldTheory.Normal.Basic

/-! The exact distribution relation survives descent to the Gaussian base field. -/
namespace TunnellCMGaloisDistribution
open WeierstrassCurve WeierstrassCurve.Affine TunnellKummer TunnellCMCoefficientNorm
noncomputable section
variable {K F B : Type*} [Field K] [Field F] [Field B] [Algebra K F] [Algebra K B]
  [Algebra F B] [IsScalarTower K F B] [Normal K B] [DecidableEq F] [DecidableEq B]
variable {ι κ : Type*} [Fintype ι] [Fintype κ]
variable (W : WeierstrassCurve K) (U : ι → CurvePoints W F) (c : κ → F) (w : ι → ℤ)
local notation "T" => CurvePoints W B
local notation "emb" => IsScalarTower.toAlgHom K F B

lemma lift_embedding (σ : F →ₐ[K] B) : ∃ τ : B ≃ₐ[K] B, τ.toAlgHom.comp emb=σ := by
  let τ := σ.liftNormal B
  refine ⟨AlgEquiv.ofBijective τ (AlgHom.normal_bijective K B B τ),AlgHom.ext (fun x => ?_)⟩
  exact (σ.liftNormal_commutes B x).trans (Algebra.algebraMap_self_apply _)

def onKernel (φ : CurvePoints W B →+ CurvePoints W B)
    (hφ : ∀ τ : B ≃ₐ[K] B, ∀ P, φ (act W τ P)=act W τ (φ P))
    (τ : B ≃ₐ[K] B) : φ.ker ≃ φ.ker where
  toFun x := ⟨act W τ x.val,by change φ (act W τ x.val)=0; rw [hφ,x.property,map_zero]⟩
  invFun x := ⟨act W τ⁻¹ x.val,by change φ (act W τ⁻¹ x.val)=0; rw [hφ,x.property,map_zero]⟩
  left_inv x := by apply Subtype.ext; change act W τ⁻¹ (act W τ x.val)=x.val; rw [← act_mul,inv_mul_cancel,act_one]
  right_inv x := by apply Subtype.ext; exact act_inv_apply W τ x.val

theorem descended_relation (φ : CurvePoints W B →+ CurvePoints W B)
    (hφ : ∀ τ : B ≃ₐ[K] B, ∀ P, φ (act W τ P)=act W τ (φ P))
    [Fintype φ.ker] [Fintype (F →ₐ[K] B)]
    (A : Set T) (hs : ∀ τ : B ≃ₐ[K] B, ∀ P∈A, act W τ P∈A) (ε : ℤ)
    (H : ∀ P∈A, (∏ i : φ.ker, atEmbedding W U c w emb (P+i.val)) =
                  atEmbedding W U c w emb (φ P)^ε) (P : T) (hP : P∈A) :
    (∏ i : φ.ker, normFunction W U c w (P+i.val)) = normFunction W U c w (φ P)^ε := by
  have all (σ : F →ₐ[K] B) :
      (∏ i : φ.ker, atEmbedding W U c w σ (P+i.val)) = atEmbedding W U c w σ (φ P)^ε := by
    obtain ⟨τ,hτ⟩ := lift_embedding σ
    let P' := act W τ⁻¹ P
    have hh := congrArg τ (H P' (hs _ _ hP))
    simp only [map_prod,map_zpow₀,embedding_covariant,hτ,← hφ,map_add] at hh
    have hP' : act W τ P'=P := act_inv_apply W _ _
    simp only [hP'] at hh
    let e := onKernel W φ hφ τ
    exact (Equiv.prod_comp e (fun i : φ.ker => atEmbedding W U c w σ (P+i.val))).symm.trans hh
  unfold normFunction
  rw [Finset.prod_comm,← Finset.prod_zpow]
  exact Finset.prod_congr rfl (fun σ _ => all σ)

end
end TunnellCMGaloisDistribution
#print axioms TunnellCMGaloisDistribution.descended_relation
