import TunnellCMModelUnit
import TunnellKummer
import Mathlib.FieldTheory.Galois.Infinite
import Mathlib.RingTheory.Norm.Transitivity

/-! Descent of a product of translated elliptic functions by taking the product over coefficient embeddings. -/
namespace TunnellCMCoefficientNorm
open WeierstrassCurve WeierstrassCurve.Affine TunnellKummer TunnellCMModelUnit
noncomputable section
variable {K F B : Type*} [Field K] [Field F] [Field B] [Algebra K F] [Algebra K B]
  [DecidableEq F] [DecidableEq B]
variable {ι κ : Type*} [Fintype ι] [Fintype κ]
variable (W : WeierstrassCurve K) (U : ι → CurvePoints W F) (c : κ → F) (w : ι → ℤ)

def atEmbedding (σ : F →ₐ[K] B) (P : CurvePoints W B) :=
  ∏ i, (∏ j, (X (P + Point.map (W' := W.toAffine) σ (U i)) - σ (c j)))^w i

def normFunction [Fintype (F →ₐ[K] B)] (P : CurvePoints W B) :=
  ∏ σ : F →ₐ[K] B, atEmbedding W U c w σ P

lemma x_map {L : Type*} [Field L] [Algebra K L] [DecidableEq L]
    (σ : F →ₐ[K] L) (P : CurvePoints W F) :
    X (Point.map (W' := W.toAffine) σ P) = σ (X P) := by
  cases P with
  | zero => exact (map_zero σ).symm
  | some => rfl

lemma embedding_covariant (τ : B ≃ₐ[K] B) (σ : F →ₐ[K] B) (P : CurvePoints W B) :
    τ (atEmbedding W U c w σ P) = atEmbedding W U c w (τ.toAlgHom.comp σ) (act W τ P) := by
  unfold atEmbedding
  simp only [map_prod,map_zpow₀,map_sub]
  apply Finset.prod_congr rfl
  intro i _
  congr 1
  apply Finset.prod_congr rfl
  intro j _
  congr 1
  change τ.toAlgHom (X (P+Point.map (W' := W.toAffine) σ (U i))) = _
  rw [← x_map W τ.toAlgHom,map_add,Point.map_map]
  rfl

theorem norm_covariant [Fintype (F →ₐ[K] B)] (τ : B ≃ₐ[K] B) (P : CurvePoints W B) :
    τ (normFunction W U c w P) = normFunction W U c w (act W τ P) := by
  unfold normFunction
  rw [map_prod]
  simp only [embedding_covariant]
  let e : (F →ₐ[K] B) ≃ (F →ₐ[K] B) :=
    ⟨fun σ => τ.toAlgHom.comp σ,fun σ => τ.symm.toAlgHom.comp σ,
      fun σ => AlgHom.ext (fun x => τ.symm_apply_apply (σ x)),
      fun σ => AlgHom.ext (fun x => τ.apply_symm_apply (σ x))⟩
  exact Equiv.prod_comp e (fun σ => atEmbedding W U c w σ (act W τ P))

theorem at_rational_point [Fintype (F →ₐ[K] B)] (D : IntermediateField K B) [IsGalois D B]
    (P : CurvePoints W B) (hP : ∀ τ : B ≃ₐ[D] B, act W (τ.restrictScalars K) P=P) :
    normFunction W U c w P ∈ D := by
  have hh : normFunction W U c w P ∈ (⊥ : IntermediateField D B) := by
    apply (InfiniteGalois.mem_bot_iff_fixed _).mpr
    intro τ
    exact (norm_covariant W U c w (τ.restrictScalars K) P).trans (congrArg _ (hP τ))
  obtain ⟨x,hx⟩ := IntermediateField.mem_bot.mp hh
  exact hx ▸ x.property

theorem rational_derivative [Fintype (F →ₐ[K] B)] (x : ι → F) (y : ι → F) (r : K)
    (h : (∑ i, (w i : F)*∑ j, (2*y i/(x i-c j)))=algebraMap K F r) :
    (∑ σ : F →ₐ[K] B, ∑ i, (w i : B)*∑ j, (2*σ (y i)/(σ (x i)-σ (c j)))) =
        Fintype.card (F →ₐ[K] B) * algebraMap K B r := by
  have he (σ : F →ₐ[K] B) := congrArg σ h
  simp only [map_sum,map_mul,map_intCast,map_div₀,map_sub,map_ofNat,AlgHom.commutes] at he
  simp only [he,Finset.sum_const,Finset.card_univ,nsmul_eq_mul]

end
end TunnellCMCoefficientNorm
#print axioms TunnellCMCoefficientNorm.at_rational_point
#print axioms TunnellCMCoefficientNorm.rational_derivative
