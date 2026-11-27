import TunnellCMPrimeToConductor
import TunnellCMDescendedIntegers

/-! A single number field of coefficients for the elliptic unit and its specializations. -/
namespace TunnellCMCriticalCoefficients
open Complex LSG.Weierstrass WeierstrassCurve WeierstrassCurve.Affine NumberField
open TunnellCoates TunnellKummer TunnellCMDistribution TunnellCMLemniscate
open TunnellCMUnitTrace TunnellCMCritical TunnellCMLSeries TunnellCMCriticalCoordinates
open TunnellCMEllipticUnit TunnellCMCriticalIntegers TunnellCMModelUnit TunnellCMAbsoluteUnit
open TunnellCMAlgebraicUnits TunnellCMCoefficientNorm
open scoped Classical NumberField
noncomputable section
set_option maxHeartbeats 700000
local notation "B" => algebraicClosure ℚ ℂ
variable (K : Type*) [Field K] [CharZero K] [Algebra K B] [DecidableEq K]
variable (n : ℕ) (hn : 0<n)
local notation "W" => E (n:K)
local notation "L" => twistPeriods n hn
local notation "Supp" => support n hn
local notation "J" => divisionGrid L (aux n)

def realize : CurvePoints W B →+ (E (n:ℂ)).toAffine.Point :=
  (mapPoint B ℂ n).comp (Point.equivOfEq (eq_E K B n)).toAddMonoidHom

lemma realize_x (P : CurvePoints W B) : X (realize K n P)=((X P : B) : ℂ) :=
  (x_point B ℂ n _).trans (congrArg (algebraMap B ℂ) (x_equality B _ P))

lemma parameter (P : CurvePoints W B) : ∃ z, uniformize n hn z=realize K n P := by
  obtain ⟨z,h⟩ := TunnellCMTorus.exp_surjective L ((Point.equivOfEq (model_eq n hn)).symm (realize K n P))
  exact ⟨z,(congrArg (Point.equivOfEq (model_eq n hn)) h).trans ((Point.equivOfEq _).apply_symm_apply _)⟩

lemma lift_coords (F : IntermediateField K B) (P : CurvePoints W B)
    (hx : X P∈F) (hy : Y P∈F) :
    ∃ U : CurvePoints W F, Point.map (W' := (W).toAffine) F.val U=P := by
  cases P with
  | zero => exact ⟨0,map_zero _⟩
  | some x y h => exact (rationalPoints_some W h).mpr ⟨hx,hy⟩

structure Data (F : IntermediateField K B) where
  u : Supp → CurvePoints W F
  c : J → F
  shift_spec (i : Supp) : realize K n (Point.map (W' := (W).toAffine) F.val (u i)) =
    uniformize n hn (point n i.val)
  grid_spec (j : J) : ((c j : B) : ℂ) = (L).weierstrassP (liftGrid L j.val)

theorem finite_data : ∃ F : IntermediateField K B, FiniteDimensional K F ∧ Nonempty (Data K n hn F) := by
  letI : NeZero (aux n) := ⟨by unfold aux; omega⟩
  choose V hV using fun i : Supp => torsion_lift n hn (by omega : 0<4*n) (conductor_point n hn i.val)
  let U (i : Supp) : CurvePoints W B := (Point.equivOfEq (eq_E K B n)).symm (V i)
  let b (j : J) : B := ⟨_,wp_mem n hn (Nat.pos_of_ne_zero (NeZero.ne (aux n))) (mul_lift L j.val)⟩
  let T := coordinateSet U ∪ Finset.univ.image b
  let F := IntermediateField.adjoin K (T : Set B)
  have hf {a : B} (ha : a∈T) : a∈F := IntermediateField.subset_adjoin _ _ ha
  have base (i : Supp) : ∃ P, Point.map (W' := (W).toAffine) F.val P=U i := by
    apply lift_coords
    · apply hf; simp [T,coordinateSet,Finset.mem_image_of_mem _ (Finset.mem_univ i)]
    · apply hf; simp [T,coordinateSet,Finset.mem_image_of_mem _ (Finset.mem_univ i)]
  choose u hu using base
  let c (j : J) : F := ⟨b j,hf (Finset.mem_union_right _ (Finset.mem_image_of_mem _ (Finset.mem_univ j)))⟩
  letI : Algebra.IsAlgebraic ℚ B := algebraicClosure.isAlgebraic ℚ ℂ
  refine ⟨F,IntermediateField.finiteDimensional_adjoin (S := (T : Set B)) (fun a _ =>
    (IsAlgebraic.tower_top K (Algebra.IsAlgebraic.isAlgebraic (R := ℚ) a)).isIntegral),⟨⟨u,c,?_,fun j => rfl⟩⟩⟩
  intro i
  rw [hu]
  change mapPoint B ℂ n ((Point.equivOfEq _) ((Point.equivOfEq _).symm (V i)))=_
  rw [AddEquiv.apply_symm_apply,hV]

theorem evaluate {F : IntermediateField K B} (D : Data K n hn F) (P : CurvePoints W B)
    {z : ℂ} (hz : realize K n P=uniformize n hn z) :
    ((atEmbedding W D.u D.c (fun i : Supp => weight n i.val) F.val P : B) : ℂ)=traceUnit n hn z := by
  classical
  change algebraMap B ℂ (∏ i : Supp, (∏ j : J, (X (P+Point.map (W' := (W).toAffine) F.val (D.u i)) -
      (D.c j:B)))^weight n i.val)=_
  simp only [map_prod,map_zpow₀,map_sub]
  have he i j : algebraMap B ℂ (X (P+Point.map (W' := (W).toAffine) F.val (D.u i))) -
      algebraMap B ℂ (D.c j : B)=(L).weierstrassP (z+point n i.val)-(L).weierstrassP (liftGrid L j.val) := by
    have ex : algebraMap B ℂ (X (P+Point.map (W' := (W).toAffine) F.val (D.u i))) =
        X (realize K n (P+Point.map (W' := (W).toAffine) F.val (D.u i))) := (realize_x K n _).symm
    rw [ex,map_add,hz,D.shift_spec,← map_add,x_uniformize]
    exact congrArg (_ - ·) (D.grid_spec j)
  simp only [he]
  have inner (i : Supp) : (∏ j : J, ((L).weierstrassP (z+point n i.val)-(L).weierstrassP (liftGrid L j.val))) =
      divisionProduct L (aux n) (z+point n i.val) :=
    Finset.prod_coe_sort J (fun j => (L).weierstrassP (z+point n i.val)-(L).weierstrassP (liftGrid L j))
  simp only [inner]
  exact Finset.prod_coe_sort Supp (fun i => divisionProduct L (aux n) (z+point n i)^weight n i)

end
end TunnellCMCriticalCoefficients
#print axioms TunnellCMCriticalCoefficients.finite_data
#print axioms TunnellCMCriticalCoefficients.evaluate
