import TunnellCMCoefficientNorm
import Mathlib.FieldTheory.PrimitiveElement

/-! Evaluation after specialization of all the coefficient embeddings of the norm function. -/
namespace TunnellCMSpecializeFunction
open WeierstrassCurve WeierstrassCurve.Affine TunnellKummer TunnellCMCoefficientNorm
noncomputable section
variable {K F B M : Type*} [Field K] [Field F] [Field B] [Field M]
  [Algebra K F] [Algebra K B] [Algebra K M] [DecidableEq F] [DecidableEq B] [DecidableEq M]
variable {ι κ : Type*} [Fintype ι] [Fintype κ]
variable (W : WeierstrassCurve K) (U : ι → CurvePoints W F) (c : κ → F) (w : ι → ℤ)

lemma evaluation (e : B →ₐ[K] M) (σ : F →ₐ[K] B) (P : CurvePoints W B) :
    e (atEmbedding W U c w σ P) =
      atEmbedding W U c w (e.comp σ) (Point.map (W' := W.toAffine) e P) := by
  unfold atEmbedding
  simp only [map_prod,map_zpow₀,map_sub]
  apply Finset.prod_congr rfl
  intro i _
  congr 1
  apply Finset.prod_congr rfl
  intro j _
  congr 1
  rw [← x_map W e,map_add,Point.map_map]

lemma postcomp_injective (e : B →ₐ[K] M) : Function.Injective (fun σ : F →ₐ[K] B => e.comp σ) := by
  intro σ τ h
  exact AlgHom.ext fun x => e.injective (DFunLike.congr_fun h x)

variable [FiniteDimensional K F] [Algebra.IsSeparable K F]
variable [Fintype (F →ₐ[K] B)] [Fintype (F →ₐ[K] M)]

def embeddingEquiv (e : B →ₐ[K] M) (h : Fintype.card (F →ₐ[K] B)=Fintype.card (F →ₐ[K] M)) :
    (F →ₐ[K] B) ≃ (F →ₐ[K] M) :=
  Equiv.ofBijective _ ((Fintype.bijective_iff_injective_and_card _).2 ⟨postcomp_injective e,h⟩)

theorem norm_evaluate (e : B →ₐ[K] M) (P : CurvePoints W B)
    (h : Fintype.card (F →ₐ[K] B)=Fintype.card (F →ₐ[K] M)) :
    e (normFunction W U c w P) = normFunction W U c w (Point.map (W' := W.toAffine) e P) := by
  unfold normFunction
  rw [map_prod]
  simp only [evaluation]
  exact Equiv.prod_comp (embeddingEquiv e h) (fun σ => atEmbedding W U c w σ (Point.map (W' := W.toAffine) e P))

lemma two_specializations {T : Type*} [Field T] [Algebra K T] [DecidableEq T]
    [Fintype (F →ₐ[K] T)] (e : B →ₐ[K] M) (g : T →ₐ[K] M)
    (hB : Fintype.card (F →ₐ[K] B)=Fintype.card (F →ₐ[K] M))
    (hT : Fintype.card (F →ₐ[K] T)=Fintype.card (F →ₐ[K] M))
    (P : CurvePoints W B) (Q : CurvePoints W T)
    (hPQ : Point.map (W' := W.toAffine) e P=Point.map (W' := W.toAffine) g Q) :
    e (normFunction W U c w P)=g (normFunction W U c w Q) := by
  rw [norm_evaluate W U c w e P hB,norm_evaluate W U c w g Q hT,hPQ]

end
end TunnellCMSpecializeFunction
#print axioms TunnellCMSpecializeFunction.two_specializations
