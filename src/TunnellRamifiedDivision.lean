import TunnellSah
import Mathlib.FieldTheory.Galois.Abelian

/-! Galois division fields above a point without a local lift. -/

namespace TunnellKummer

open WeierstrassCurve

variable {F L : Type*} [Field F] [Field L] [Algebra F L] [DecidableEq F] [DecidableEq L]
variable (W : WeierstrassCurve F)

noncomputable abbrev changeBase := Affine.Point.baseChange (W':=W.toAffine) F L

lemma exists_point_of_rational (R : CurvePoints W L)
    (hR : R∈rationalPoints W (⊥ : IntermediateField F L)) :
    ∃ S : CurvePoints W F, changeBase W S=R := by
  cases R with
  | zero => exact ⟨0,rfl⟩
  | some x y h =>
    obtain ⟨hx,hy⟩ := (rationalPoints_some W h).mp hR
    obtain ⟨a,rfl⟩ := IntermediateField.mem_bot.mp hx
    obtain ⟨b,rfl⟩ := IntermediateField.mem_bot.mp hy
    have hab := (W.toAffine.baseChange_nonsingular (Algebra.ofId F L).injective a b).mp h
    exact ⟨.some a b hab,rfl⟩

open scoped IsMulCommutative in
/-- A Kummer division extension over a local point without a rational lift cannot be abelian
    if some element acts by minus one on its odd division kernel. -/
lemma division_extension_nonabelian (φ : CurvePoints W L →+ CurvePoints W L)
    (ψ : CurvePoints W F →+ CurvePoints W F)
    (hψ : ∀ x, φ (changeBase W x) = changeBase W (ψ x))
    (heq : ∀ (σ : L≃ₐ[F]L) x, φ (act W σ x)=act W σ (φ x))
    (P : CurvePoints W F) (hnd : ¬∃ S, ψ S=P) (Q : CurvePoints W L)
    (hQ : φ Q=changeBase W P) (σ : L≃ₐ[F]L) (k : ℕ)
    (hneg : ∀ T : φ.ker, act W σ T= -(T:CurvePoints W L))
    (hexp : ∀ T : φ.ker, (2*k+1)•T=0) : ¬IsAbelianGalois F L := by
  intro h
  obtain ⟨R,hR,hφR⟩ := sah_division_descent W φ heq σ (fun τ => mul_comm σ τ)
    (displacement_bijective_neg W φ heq σ k hneg hexp) Q (fun τ => by
      rw [hQ]; exact Affine.Point.map_baseChange τ.toAlgHom P)
  obtain ⟨S,rfl⟩ := exists_point_of_rational W R hR
  refine hnd ⟨S,Affine.Point.map_injective (W':=W.toAffine) (Algebra.ofId F L) ?_⟩
  exact (hψ S).symm.trans (hφR.trans hQ)

end TunnellKummer
