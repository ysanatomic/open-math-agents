import TunnellCMSpecializeFunction
import Mathlib.FieldTheory.IsAlgClosed.AlgebraicClosure
import Mathlib.LinearAlgebra.FreeModule.Finite.Matrix

/-! The conjugate product at a point in a number field agrees with its value in
every completion in which the coefficient polynomial splits. -/
namespace TunnellCMLocalEvaluation
open WeierstrassCurve WeierstrassCurve.Affine TunnellKummer TunnellCMCoefficientNorm
open TunnellCMSpecializeFunction
open scoped Classical
noncomputable section
variable {K F D B M : Type} [Field K] [Field F] [Field B] [Field M] [Field D]
  [Algebra K F] [Algebra K D] [Algebra D B] [Algebra K B] [IsScalarTower K D B]
  [Algebra D M] [Algebra K M] [IsScalarTower K D M]
  [FiniteDimensional K F] [Algebra.IsSeparable K F] [IsAlgClosed B] [Algebra.IsAlgebraic D B]
  [DecidableEq F] [DecidableEq D] [DecidableEq B] [DecidableEq M]
variable {ι κ : Type*} [Fintype ι] [Fintype κ]
variable (W : WeierstrassCurve K) (U : ι → CurvePoints W F) (c : κ → F) (w : ι → ℤ)

theorem at_local_point (g : (F →ₐ[K] B) → (F →ₐ[K] M)) (hg : Function.Injective g)
    (Q : CurvePoints W D) (a : D) (ha : algebraMap D B a =
      normFunction W U c w (Point.map (W' := W.toAffine) (IsScalarTower.toAlgHom K D B) Q)) :
    algebraMap D M a = ∏ σ : F →ₐ[K] B, atEmbedding W U c w (g σ)
      (Point.map (W' := W.toAffine) (IsScalarTower.toAlgHom K D M) Q) := by
  let L:=AlgebraicClosure M
  let f : B →ₐ[D] L := IsAlgClosed.lift
  let m := IsScalarTower.toAlgHom K M L
  let b := f.restrictScalars K
  have cardB : Fintype.card (F →ₐ[K] B)=Module.finrank K F := AlgHom.card K F B
  have cardL : Fintype.card (F →ₐ[K] L)=Module.finrank K F := AlgHom.card K F L
  have hcard : Fintype.card (F →ₐ[K] B)=Fintype.card (F →ₐ[K] L) := cardB.trans cardL.symm
  let j (σ : F →ₐ[K] B) := m.comp (g σ)
  let eqv : (F →ₐ[K] B) ≃ (F →ₐ[K] L) := Equiv.ofBijective j
    ((Fintype.bijective_iff_injective_and_card j).mpr ⟨(postcomp_injective m).comp hg,hcard⟩)
  let Q₀ := Point.map (W' := W.toAffine) (IsScalarTower.toAlgHom K D B) Q
  let Q₁ := Point.map (W' := W.toAffine) (IsScalarTower.toAlgHom K D M) Q
  have hpoint : Point.map (W' := W.toAffine) b Q₀ = Point.map (W' := W.toAffine) m Q₁ := by
    dsimp only [Q₀,Q₁]
    rw [Point.map_map,Point.map_map]
    have e : b.comp (IsScalarTower.toAlgHom K D B)=m.comp (IsScalarTower.toAlgHom K D M) :=
      AlgHom.ext fun x => (f.commutes x).trans (IsScalarTower.algebraMap_apply D M L x)
    rw [e]
  apply m.injective
  calc
    m (algebraMap D M a) = f (algebraMap D B a) :=
      (IsScalarTower.algebraMap_apply D M L a).symm.trans (f.commutes a).symm
    _ = b (normFunction W U c w Q₀) := congrArg f ha
    _ = normFunction W U c w (Point.map (W' := W.toAffine) b Q₀) := norm_evaluate W U c w b Q₀ hcard
    _ = ∏ σ : F →ₐ[K] B, atEmbedding W U c w (j σ) (Point.map (W' := W.toAffine) m Q₁) := by
      rw [hpoint]
      exact (Equiv.prod_comp eqv (fun σ => atEmbedding W U c w σ (Point.map (W' := W.toAffine) m Q₁))).symm
    _ = _ := by
      rw [map_prod]
      exact Finset.prod_congr rfl fun σ _ => (evaluation W U c w m (g σ) Q₁).symm

end
end TunnellCMLocalEvaluation
#print axioms TunnellCMLocalEvaluation.at_local_point
