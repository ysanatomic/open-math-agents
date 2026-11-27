import TunnellRamifiedDivision
import TunnellAbelianDescent

/-! Nonabelianity of a p-primary Kummer division extension at a nonanomalous place. -/

namespace TunnellKummer

open WeierstrassCurve

variable {F L : Type*} [Field F] [Field L] [Algebra F L] [DecidableEq F] [DecidableEq L]
  [FiniteDimensional F L]

open scoped IsMulCommutative in
theorem primary_division_nonabelian (W : WeierstrassCurve F) {p r : ℕ} [Fact p.Prime]
    (φ : CurvePoints W L →+ CurvePoints W L) (ψ : CurvePoints W F →+ CurvePoints W F)
    (hψ : ∀ x, φ (changeBase W x) = changeBase W (ψ x))
    (heq : ∀ (σ : L≃ₐ[F]L) x, φ (act W σ x)=act W σ (φ x))
    (ht : ∀ T : φ.ker, p^r • (T:CurvePoints W L)=0)
    (hn : ∀ S : CurvePoints W F, p^r • S=0 → S=0)
    (P : CurvePoints W F) (hnd : ¬∃ S, ψ S=P) (Q : CurvePoints W L)
    (hQ : φ Q=changeBase W P) : ¬ IsAbelianGalois F L := by
  intro habel
  letI : DistribMulAction (L≃ₐ[F]L) φ.ker := {
    smul σ x := ⟨act W σ x,by change φ (act W σ x)=0; rw [heq,x.property,map_zero]⟩
    one_smul x := Subtype.ext (act_one W (x:CurvePoints W L))
    mul_smul σ τ x := Subtype.ext (act_mul W σ τ (x:CurvePoints W L))
    smul_zero σ := Subtype.ext (map_zero (act W σ))
    smul_add σ x y := Subtype.ext (map_add (act W σ) (x:CurvePoints W L) (y:CurvePoints W L)) }
  have hfixed (σ : L≃ₐ[F]L) : act W σ (φ Q)=φ Q := by
    rw [hQ]; exact Affine.Point.map_baseChange σ.toAlgHom P
  let c (σ : L≃ₐ[F]L) : φ.ker := ⟨_,translation_mem W φ Q heq hfixed σ⟩
  have hc (σ τ:L≃ₐ[F]L) : c (σ*τ)=c σ+σ • c τ := by
    apply Subtype.ext
    change act W (σ*τ) Q-Q=act W σ Q-Q+act W σ (act W τ Q-Q)
    rw [act_mul,map_sub]; abel
  have hinv (T : φ.ker) (hT : ∀ σ : L≃ₐ[F]L, σ • T=T) : T=0 := by
    have hrat := point_rational_of_fixed W T (fun σ => congrArg Subtype.val (hT σ))
    obtain ⟨S,hS⟩ := exists_point_of_rational W _ hrat
    have h0 := ht T
    rw [←hS,←map_nsmul] at h0
    have hz := hn S ( (Affine.Point.map_injective (W':=W.toAffine) (Algebra.ofId F L))
      (h0.trans (map_zero _).symm))
    exact Subtype.ext (by rw [←hS,hz,map_zero]; rfl)
  obtain ⟨t,htc⟩ := TunnellAbelianDescent.cocycle_is_coboundary
    (fun T : φ.ker => Subtype.ext (ht T)) hinv c hc
  let R := Q-(t:CurvePoints W L)
  have hRf (σ:L≃ₐ[F]L) : act W σ R=R := by
    have hh := congrArg Subtype.val (htc σ)
    change act W σ Q-Q = act W σ t-t at hh
    dsimp [R]; rw [map_sub]; abel_nf at hh ⊢; abel_nf; try grind
  obtain ⟨S,hS⟩ := exists_point_of_rational W R (point_rational_of_fixed W R hRf)
  refine hnd ⟨S,Affine.Point.map_injective (W':=W.toAffine) (Algebra.ofId F L) ?_⟩
  rw [←hψ,hS]
  dsimp [R]; rw [map_sub,t.property,sub_zero,hQ]

end TunnellKummer
