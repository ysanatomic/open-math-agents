import TunnellCMCoherentFields

/-! The field norm of a rational elliptic function between two point-coordinate fields. -/
namespace TunnellCMRelativeOrbitNorm
open WeierstrassCurve WeierstrassCurve.Affine TunnellKummer TunnellCMTorsionField
open TunnellLocalCMCoordDegree TunnellCMDivisionNorm
open scoped Classical
noncomputable section
variable {K B : Type} [Field K] [Field B] [Algebra K B] [CharZero B] [DecidableEq B]
variable (W : WeierstrassCurve K)

def relativeNorm {D N : IntermediateField K B} (h : D≤N) : N →* D :=
  letI := (IntermediateField.inclusion h).toAlgebra
  Algebra.norm D

lemma fixed_at_coords (P : CurvePoints W B) (τ : B ≃ₐ[coordField W P] B) :
    act W (τ.restrictScalars K) P=P := by
  obtain ⟨Q,hQ⟩ := point_rational W P
  calc
    _ = act W (τ.restrictScalars K) (Point.map (W' := W.toAffine) (coordField W P).val Q) := congrArg _ hQ.symm
    _ = Point.map (W' := W.toAffine) (coordField W P).val Q := by
      cases Q with
      | zero => rfl
      | some x y h => exact Point.some_eq_some _ (τ.commutes x) (τ.commutes y)
    _ = P := hQ

lemma extends_generators {D N : Type*} [Field D] [Field N] [Algebra K D] [Algebra K N]
    [Algebra D N] [IsScalarTower K D N] (x y : N) (h : IntermediateField.adjoin K {x,y}=⊤) :
    IntermediateField.adjoin D {x,y}=⊤ := by
  let E := IntermediateField.adjoin D ({x,y}:Set N)
  have he : IntermediateField.adjoin K {x,y} ≤ E.restrictScalars K :=
    IntermediateField.adjoin_le_iff.mpr (fun _ hx => IntermediateField.subset_adjoin D _ hx)
  rw [h] at he
  exact top_unique (fun z _ => he (show z∈(⊤ : IntermediateField K N) from trivial))

theorem coordinate_norm [IsAlgClosed B] (φ : CurvePoints W B →+ CurvePoints W B) [Fintype φ.ker]
    (hφ : ∀ τ : B ≃ₐ[K] B, ∀ P, φ (act W τ P)=act W τ (φ P))
    (g : CurvePoints W B → B) (hg : ∀ τ : B ≃ₐ[K] B, ∀ P, τ (g P)=g (act W τ P))
    (P : CurvePoints W B) (hP0 : P≠0) (D : IntermediateField K B) (hle : D≤coordField W P)
    [Normal D B] [FiniteDimensional K (coordField W P)]
    (hfixed : ∀ τ : B ≃ₐ[D] B, act W (τ.restrictScalars K) (φ P)=φ P)
    (hd : Module.finrank K (coordField W P)=Module.finrank K D*Nat.card φ.ker)
    (u : coordField W P) (hu : (u:B)=g P) :
    ((relativeNorm hle u : D):B)=∏ j : φ.ker, g (P+j.val) := by
  let N := coordField W P
  letI : Algebra D N := (IntermediateField.inclusion hle).toAlgebra
  letI : IsScalarTower K D N := .of_algebraMap_eq' rfl
  letI : IsScalarTower D N B := .of_algebraMap_eq' rfl
  letI : FiniteDimensional D N := Module.Finite.of_restrictScalars_finite K D N
  letI : FiniteDimensional K D := Module.Finite.left K D N
  have hdeg : Module.finrank D N=Nat.card φ.ker := Nat.eq_of_mul_eq_mul_left Module.finrank_pos
    ((Module.finrank_mul_finrank K D N).trans hd)
  obtain ⟨Q,hQ⟩ := point_rational W P
  have htop : coordField W Q=⊤ := by
    apply IntermediateField.map_injective N.val
    rw [coord_map,hQ,← AlgHom.fieldRange_eq_map,IntermediateField.fieldRange_val]
  cases Q with
  | zero => exact (hP0 (hQ.symm.trans (map_zero _))).elim
  | some x y h =>
    change algebraMap D B (Algebra.norm D u)=_
    exact field_norm W φ hφ g hg h (extends_generators x y htop) hdeg u P hQ.symm hu
      hfixed

end
end TunnellCMRelativeOrbitNorm
#print axioms TunnellCMRelativeOrbitNorm.coordinate_norm
