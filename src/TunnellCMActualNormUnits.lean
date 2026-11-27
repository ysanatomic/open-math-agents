import TunnellCMAlgebraicKernel

/-! The actual coefficient norm is an integral unit in the individual division field,
and satisfies the CM distribution relation there. -/
namespace TunnellCMActualNormUnits
open Complex LSG.Weierstrass WeierstrassCurve WeierstrassCurve.Affine NumberField
open TunnellCoates TunnellKummer TunnellCMLemniscate TunnellCMCritical TunnellCMLSeries
open TunnellCMCriticalCoefficients TunnellCMAlgebraicKernel TunnellCMPrimeToConductor
open TunnellCMCriticalCoordinates TunnellCMUnitTrace TunnellCMNormDistribution TunnellCMToricDivision
open TunnellCMTorsionField TunnellCMCoefficientNorm TunnellCMGaloisDistribution
open scoped Classical NumberField
noncomputable section
local notation "B" => algebraicClosure ℚ ℂ
variable (K : Type*) [Field K] [CharZero K] [Algebra K B] [DecidableEq K]
variable (n : ℕ) (hn : 0<n)
local notation "W" => E (n:K)
local notation "Lat" => twistPeriods n hn
variable {F : IntermediateField K B} (D : Data K n hn F)
def weights (u : support n hn) := weight n u.val
local notation "wt" => weights n hn
local notation "g" => atEmbedding W D.u D.c wt F.val
local notation "G" => normFunction W D.u D.c wt

theorem individual_unit {m : ℕ} (hm : 0 < m) (hc : (4*n).Coprime (aux n*m))
    (hn8 : n%8=2) (h2 : 2<n) (P : CurvePoints W B) (hp : m • P=0) :
    ∃ u : (𝓞 B)ˣ, u.val.val=g P := by
  obtain ⟨z,hz⟩ := toric_parameter K n hn P
  obtain ⟨u,hu⟩ := torsion_unit n hn hm hc hn8 h2 (integral_parameter K n hn hz hp)
  exact ⟨u,Subtype.ext (hu.trans (evaluate K n hn D P (realize_parameter K n hn hz)).symm)⟩

theorem in_division_field [Normal K B] [Fintype (F →ₐ[K] B)] {m : ℕ} (hm : 0 < m)
    (hc : (4*n).Coprime (aux n*m)) (hn8 : n%8=2) (h2 : 2<n)
    (P : CurvePoints W B) [IsGalois (coordField W P) B] (hp : m • P=0) :
    ∃ u : (𝓞 (coordField W P))ˣ, ((u.val.val : coordField W P) : B)=G P := by
  apply TunnellCMDescendedIntegers.norm_unit W D.u D.c wt _ (individual_unit K n hn D hm hc hn8 h2) P hp
  intro τ
  obtain ⟨Q,hQ⟩ := point_rational W P
  calc
    act W (τ.restrictScalars K) P = act W (τ.restrictScalars K) (Point.map (W' := (W).toAffine) (coordField W P).val Q) :=
      congrArg _ hQ.symm
    _ = Point.map (W' := (W).toAffine) (coordField W P).val Q := by
      cases Q with
      | zero => rfl
      | some x y h => exact Point.some_eq_some ((W).baseChange B) (τ.commutes x) (τ.commutes y)
    _ = P := hQ

variable [(E (n:K)).IsElliptic] (i : K) (hi : i^2= -1) (hiC : ((algebraMap K B i:B):ℂ)=I)
local notation "φ" => cm (L := B) (n:K) i hi
variable {p : ℕ} (hp : p.Prime) (h2 : p≠2) (q : GaussianInt) (hq : q.norm.natAbs=p)
  (hpr : TunnellGaussian.Primary q) (hf : p.Coprime (4*n)) (ha : p.Coprime (aux n))
  (hn8 : n%8=2)

include hiC hp h2 hq hpr hf ha hn8 in
theorem algebraic_relation [Fintype (φ q).ker] {m : ℕ} (hc : (4*n).Coprime (aux n*m))
    (P : CurvePoints W B) (hP : m • P=0) :
    (∏ j : (φ q).ker, g (P+j.val))=g (φ q P)^twistSign n p := by
  let e := kernel_equiv K n hn i hi hiC hp q hq
  letI : Fintype (kernel n hn q) := Fintype.ofEquiv _ e
  choose t ht using fun j : kernel n hn q => TunnellCMTorus.exp_surjective Lat j.val
  obtain ⟨z,hz⟩ := toric_parameter K n hn P
  have hshift (j : (φ q).ker) : toric K n hn (P+j.val)=expE Lat (z+t (e j)) := by
    rw [map_add,hz,expE_add,ht]; rfl
  have endo : toric K n hn (φ q P)=expE Lat ((q:ℂ)*z) := by
    rw [toric_gaussian K n hn i hi hiC,hz,action_exp]
  apply (algebraMap B ℂ).injective
  rw [map_prod,map_zpow₀]
  calc
    _ = ∏ j : (φ q).ker, traceUnit n hn (z+t (e j)) :=
      Finset.prod_congr rfl (fun j _ => evaluate K n hn D _ (realize_parameter K n hn (hshift j)))
    _ = ∏ j : kernel n hn q, traceUnit n hn (z+t j) := Equiv.prod_comp e (fun j => traceUnit n hn (z+t j))
    _ = traceUnit n hn ((q:ℂ)*z)^twistSign n p :=
      torsion_distribution n hn hc hp h2 q hq hpr hf ha hn8 t ht (integral_parameter K n hn hz hP)
    _ = _ := congrArg (·^twistSign n p) (evaluate K n hn D _ (realize_parameter K n hn endo)).symm

include hiC hp h2 hq hpr hf ha hn8 in
theorem norm_relation [Normal K B] [Fintype (F →ₐ[K] B)] [Fintype (φ q).ker]
    {m : ℕ} (hc : (4*n).Coprime (aux n*m)) (P : CurvePoints W B) (hP : m • P=0) :
    (∏ j : (φ q).ker, G (P+j.val))=G (φ q P)^twistSign n p := by
  apply descended_relation W D.u D.c wt (φ q) (cm_act _ _ _ _) {P | m • P=0} _ _ _ P hP
  · intro τ Q h
    change m • act W τ Q=0
    rw [← map_nsmul,show m • Q=0 from h,map_zero]
  · exact fun Q h => algebraic_relation K n hn D i hi hiC hp h2 q hq hpr hf ha hn8 hc Q h

end
end TunnellCMActualNormUnits
#print axioms TunnellCMActualNormUnits.in_division_field
#print axioms TunnellCMActualNormUnits.norm_relation
