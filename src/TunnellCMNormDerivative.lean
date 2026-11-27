import TunnellCMActualNormUnits

/-! The logarithmic derivative of the descended function is the field degree
times the scalar of the complex L-value. -/
namespace TunnellCMNormDerivative
open Complex LSG.Weierstrass WeierstrassCurve WeierstrassCurve.Affine
open TunnellCoates TunnellKummer TunnellCMLemniscate TunnellCMCritical TunnellCMLSeries
open TunnellCMUnitTrace TunnellCMCriticalIntegers TunnellCMCriticalCoordinates TunnellCMDistribution
open TunnellCMEllipticUnit TunnellCMCriticalCoefficients TunnellCMModelUnit
open TunnellCMAbsoluteUnit TunnellCMCoefficientNorm
open scoped Classical
noncomputable section
local notation "AlgC" => algebraicClosure ℚ ℂ
variable (K : Type*) [Field K] [CharZero K] [Algebra K AlgC] [DecidableEq K]
variable (n : ℕ) (hn : 0<n)
local notation "W" => E (n:K)
local notation "Lat" => twistPeriods n hn
local notation "Supp" => support n hn
local notation "GridF" => divisionGrid Lat (aux n)
variable {F : IntermediateField K AlgC} (D : Data K n hn F)

lemma realize_y (P : CurvePoints W AlgC) : Y (realize K n P)=((Y P:AlgC):ℂ) := by
  cases P with
  | zero =>
    change Y (realize K n (0:CurvePoints W AlgC))=((0:AlgC):ℂ)
    rw [map_zero]; rfl
  | some x y h =>
    simp only [realize,mapPoint,TunnellCMGlobalModelUnit.pointMap,AddMonoidHom.comp_apply,
      AddEquiv.coe_toAddMonoidHom,Point.equivOfEq_some,Point.map_some]
    rfl

lemma coords (i : Supp) :
    ((X (D.u i):F):AlgC)=(X (Point.map (W' := (W).toAffine) F.val (D.u i))) ∧
    ((Y (D.u i):F):AlgC)=(Y (Point.map (W' := (W).toAffine) F.val (D.u i))) := by
  cases D.u i <;> exact ⟨rfl,rfl⟩

def scalar : F := ∑ i : Supp, (weight n i.val:F)*∑ j : GridF, (2*Y (D.u i)/(X (D.u i)-D.c j))

theorem scalar_complex :
    ((scalar K n hn D:AlgC):ℂ)=logDeriv (traceUnit n hn) 0 := by
  let h := (algebraMap AlgC ℂ).comp F.val.toRingHom
  change h (∑ i : Supp, (weight n i.val:F)*∑ j : GridF, (2*Y (D.u i)/(X (D.u i)-D.c j)))=_
  have hx (i : Supp) : h (X (D.u i))=X (uniformize n hn (point n i.val)) := by
    rw [← D.shift_spec i,realize_x]
    exact congrArg (algebraMap AlgC ℂ) (coords K n hn D i).1
  have hy (i : Supp) : h (Y (D.u i))=Y (uniformize n hn (point n i.val)) := by
    rw [← D.shift_spec i,realize_y]
    exact congrArg (algebraMap AlgC ℂ) (coords K n hn D i).2
  have hj (j : GridF) : h (D.c j)=X (uniformize n hn (liftGrid Lat j.val)) := by
    rw [x_uniformize]; exact D.grid_spec j
  simp only [map_sum,map_mul,map_intCast,map_div₀,map_sub,map_ofNat,hx,hy,hj,coord_derivative]
  have inner (i : Supp) : (∑ j : GridF, 2*Y (uniformize n hn (point n i.val)) /
      (X (uniformize n hn (point n i.val))-X (uniformize n hn (liftGrid Lat j.val)))) =
    ∑ j ∈ GridF, 2*Y (uniformize n hn (point n i.val)) /
      (X (uniformize n hn (point n i.val))-X (uniformize n hn (liftGrid Lat j))) :=
    Finset.sum_coe_sort GridF (fun j => 2*Y (uniformize n hn (point n i.val)) / (X (uniformize n hn (point n i.val))-X (uniformize n hn (liftGrid Lat j))))
  simp only [inner]
  exact Finset.sum_coe_sort Supp (fun i => (weight n i : ℂ) * ∑ j ∈ GridF, 2*Y (uniformize n hn (point n i)) / (X (uniformize n hn (point n i))-X (uniformize n hn (liftGrid Lat j))))

theorem descended [Fintype (F →ₐ[K] AlgC)] (r : ℚ) (hr : logDeriv (traceUnit n hn) 0=(r:ℂ)) :
    (∑ σ : F →ₐ[K] AlgC, ∑ i : Supp, (weight n i.val:AlgC)*∑ j : GridF,
      (2*σ (Y (D.u i))/(σ (X (D.u i))-σ (D.c j))))=Fintype.card (F →ₐ[K] AlgC)*(r:AlgC) := by
  have e : scalar K n hn D=algebraMap K F (r:K) := by
    apply F.val.injective
    apply (algebraMap AlgC ℂ).injective
    exact (scalar_complex K n hn D).trans (hr.trans (by simp))
  simpa only [map_ratCast] using rational_derivative (B := AlgC) D.c (fun i : Supp => weight n i.val)
    (fun i => X (D.u i)) (fun i => Y (D.u i)) (r:K) e

end
end TunnellCMNormDerivative
#print axioms TunnellCMNormDerivative.descended
