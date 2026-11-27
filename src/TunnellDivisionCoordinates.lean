import TunnellKummerCompositum

/-! The compositum with one division lift, with actual defining coordinates and both field structures. -/
namespace TunnellDivisionCoordinates
open WeierstrassCurve WeierstrassCurve.Affine TunnellKummer TunnellCMTorsionField IntermediateField
open scoped Classical
noncomputable section
variable {F B:Type} [Field F] [Field B] [Algebra F B] [Normal F B] [DecidableEq F] [DecidableEq B]
variable (W:WeierstrassCurve F) (D:IntermediateField F B) [Normal F D] (x y:B)

abbrev field := adjoin D ({x,y}:Set B)

local notation "N" => field D x y
scoped instance base : Algebra F N := inferInstanceAs (Algebra F ((field D x y).restrictScalars F))
scoped instance tower : IsScalarTower F D N := IsScalarTower.of_algebraMap_eq (fun _=>rfl)
def embed : N→ₐ[F]B := ((field D x y).restrictScalars F).val

def X : N := ⟨x,subset_adjoin D _ (by simp)⟩
def Y : N := ⟨y,subset_adjoin D _ (by simp)⟩

def point (h:(W.baseChange B).toAffine.Nonsingular x y) : CurvePoints W N :=
  .some (X D x y) (Y D x y) ((W.toAffine.baseChange_nonsingular (embed D x y).injective _ _).mp h)

theorem generated : adjoin D {X D x y,Y D x y}=⊤ := by
  apply IntermediateField.map_injective (field D x y).val
  rw [adjoin_map,Set.image_insert_eq,Set.image_singleton,←AlgHom.fieldRange_eq_map,IntermediateField.fieldRange_val]
  rfl

theorem finite [Algebra.IsAlgebraic D B] : FiniteDimensional D N := by
  exact IntermediateField.finiteDimensional_adjoin (fun z _=> (Algebra.IsAlgebraic.isAlgebraic (R:=D) z).isIntegral)

theorem normal (h:(W.baseChange B).toAffine.Nonsingular x y) (φ:CurvePoints W B→+CurvePoints W B)
    (hφ:∀σ:Gal(B/F),∀U,φ (act W σ U)=act W σ (φ U))
    (hP:∀σ:Gal(B/F),act W σ (φ (.some x y h))=φ (.some x y h))
    (ht:φ.ker≤rationalPoints W D) : Normal F N := by
  have hn:=TunnellKummerCompositum.normal W φ D (.some x y h) hφ hP ht
  change Normal F ↥((adjoin D {x,y}).restrictScalars F)
  rw [restrictScalars_adjoin_eq_sup]
  exact hn

theorem fix_lift (S:CurvePoints W D) (σ:Gal(N/D)) :
    act W (σ.restrictScalars F) (Point.map (W':=W.toAffine) (IsScalarTower.toAlgHom F D N) S)=
      Point.map (W':=W.toAffine) (IsScalarTower.toAlgHom F D N) S := by
  cases S with
  | zero=>rfl
  | some a b h=>exact (Point.some.injEq ..).mpr ⟨σ.commutes a,σ.commutes b⟩

#print axioms generated
#print axioms normal
#print axioms fix_lift
end
end TunnellDivisionCoordinates
