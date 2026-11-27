import TunnellKummer
import Mathlib.FieldTheory.Galois.Infinite

/-! # The central-element descent in the local Kummer argument of Coates and Wiles -/

namespace TunnellKummer

open WeierstrassCurve

variable {F L : Type*} [Field F] [Field L] [Algebra F L] [DecidableEq L]
variable (W : WeierstrassCurve F) (φ : CurvePoints W L →+ CurvePoints W L)
variable (hφ : ∀ (σ : L ≃ₐ[F] L) (P : CurvePoints W L), φ (act W σ P) = act W σ (φ P))

noncomputable def displacement (σ : L ≃ₐ[F] L) : φ.ker →+ φ.ker where
  toFun T := ⟨act W σ T - T, by
    change φ (act W σ T - T) = 0
    rw [map_sub,hφ,T.property,map_zero,sub_self]⟩
  map_zero' := by ext; change act W σ 0 - 0 = 0; simp
  map_add' A B := by
    apply Subtype.ext
    change act W σ (A+B) - ((A:CurvePoints W L)+B) = (act W σ A-A)+(act W σ B-B)
    rw [map_add]
    abel

lemma point_rational_of_fixed [IsGalois F L] (Q : CurvePoints W L)
    (hQ : ∀ σ : L ≃ₐ[F] L, act W σ Q=Q) :
    Q ∈ rationalPoints W (⊥ : IntermediateField F L) := by
  cases Q with
  | zero => exact AddSubgroup.zero_mem _
  | some x y H =>
    apply (rationalPoints_some W H).mpr
    constructor
    · apply (InfiniteGalois.mem_bot_iff_fixed x).mpr
      exact fun σ => (Affine.Point.some.inj (hQ σ)).1
    · apply (InfiniteGalois.mem_bot_iff_fixed y).mpr
      exact fun σ => (Affine.Point.some.inj (hQ σ)).2

/-- For a central field automorphism with invertible displacement on division torsion, every
division point lying in the Galois extension above an F-rational point has a lift over F. -/
lemma sah_division_descent [IsGalois F L] (σ : L ≃ₐ[F] L)
    (hcentral : ∀ τ : L ≃ₐ[F] L, σ*τ=τ*σ) (hd : Function.Bijective (displacement W φ hφ σ))
    (Q : CurvePoints W L) (hP : ∀ τ : L ≃ₐ[F] L, act W τ (φ Q)=φ Q) :
    ∃ R ∈ rationalPoints W (⊥ : IntermediateField F L), φ R = φ Q := by
  let c : φ.ker := ⟨_,translation_mem W φ Q hφ hP σ⟩
  obtain ⟨T,hT⟩ := hd.surjective c
  have hh := congrArg Subtype.val hT
  change act W σ T - T = act W σ Q - Q at hh
  let R := Q-(T:CurvePoints W L)
  have htzero : φ T=0 := T.property
  have hR : φ R = φ Q := by simp [R,htzero]
  have hσ : act W σ R=R := by
    dsimp [R]
    rw [map_sub,(sub_eq_iff_eq_add).mp hh]
    abel
  have hRP (τ : L ≃ₐ[F] L) : act W τ (φ R)=φ R := by rw [hR,hP]
  refine ⟨R,point_rational_of_fixed W R ?_,hR⟩
  intro τ
  let A : φ.ker := ⟨_,translation_mem W φ R hφ hRP τ⟩
  have hcomm : act W σ (act W τ R) = act W τ R := by
    rw [← act_mul, hcentral, act_mul, hσ]
  have hzero : displacement W φ hφ σ A = displacement W φ hφ σ 0 := by
    rw [map_zero]
    apply Subtype.ext
    change act W σ (act W τ R-R) - (act W τ R-R)=0
    rw [map_sub,hcomm,hσ,sub_self]
  have he := congrArg Subtype.val (hd.injective hzero)
  exact sub_eq_zero.mp he

/-- A Galois element acting by minus one on torsion of odd exponent has invertible
displacement, as required in Sah's lemma. -/
lemma displacement_bijective_neg (σ : L ≃ₐ[F] L) (k : ℕ)
    (hminus : ∀ T : φ.ker, act W σ T = -(T:CurvePoints W L))
    (hexp : ∀ T : φ.ker, (2*k+1) • T=0) : Function.Bijective (displacement W φ hφ σ) := by
  let d := displacement W φ hφ σ
  have hval (T : φ.ker) : d T = -((2:ℕ) • T) := by
    apply Subtype.ext
    change act W σ T - (T:CurvePoints W L) = -(2 • (T:CurvePoints W L))
    rw [hminus,two_nsmul]
    abel
  have hinv (T : φ.ker) : d (k • T) = T := by
    rw [hval, ← mul_smul]
    have hh := hexp T
    rw [add_smul, one_smul] at hh
    exact (neg_eq_of_add_eq_zero_left (by simpa only [add_comm] using hh))
  refine ⟨?_, fun T => ⟨k • T,hinv T⟩⟩
  intro A B he
  have h := congrArg (fun x : φ.ker => k • x) he
  change k • d A = k • d B at h
  simpa only [← map_nsmul,hinv] using h

#print axioms displacement_bijective_neg
#print axioms sah_division_descent

end TunnellKummer
