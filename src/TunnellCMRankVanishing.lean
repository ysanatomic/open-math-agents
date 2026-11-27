import TunnellCMTracePrime
import TunnellCMKummerUnramified
import TunnellGlobalRankObstruction
import TunnellCMConcreteGaussian
import TunnellCMGroundPoint
import TunnellCMTraceSlope

/-! An infinite-order rational point forces the Gaussian critical trace to
vanish whenever it is a rational multiple of the real period. -/
namespace TunnellCMRankVanishing
open Complex WeierstrassCurve WeierstrassCurve.Affine NumberField IntermediateField IsLocalRing
open IsDedekindDomain IsDedekindDomain.HeightOneSpectrum TunnellCoates TunnellKummer TunnellCMTorsionField
open TunnellCMCriticalCoefficients TunnellCMFirstValues TunnellCMArithmeticTowers TunnellCMFirstTowerAt
open TunnellCMCoefficientCompletion TunnellCMCritical TunnellCMIntegralSlope TunnellCMUnitTrace
open TunnellRestrictedPlaces TunnellLocalDivisibility TunnellPadicDivisionSeries
open scoped Classical NumberField
noncomputable section
set_option maxHeartbeats 1200000
local notation "B" => algebraicClosure ℚ ℂ
variable (K : Type) [Field K] [NumberField K] [Algebra K B] [dK' : DecidableEq K]
  [Algebra K ℂ] [IsScalarTower K B ℂ] (i : K) (hi : i^2= -1) (hiC : ((algebraMap K B i:B):ℂ)=I)
variable (n : ℕ) (hn : 0<n) [(E (n:K)).IsElliptic]
local notation "W" => E (n:K)
local notation "Ω" => algebraicClosure K ℂ

include hi hiC in
theorem finite_order (dK : Module.finrank ℚ K=2) (hn2 : 2<n) (hn8 : n%8=2) (c : ℚ) (hc : c≠0)
    (hder : logDeriv (traceUnit n hn) 0=(c:ℂ)) (P : CurvePoints W K) : IsOfFinAddOrder P := by
  obtain rfl : dK'=Classical.decEq K := Subsingleton.elim _ _
  letI : IsAlgClosure K Ω:=algebraicClosure.isAlgClosure K ℂ
  letI : IsAlgClosed Ω:=IsAlgClosure.isAlgClosed K
  letI : Algebra.IsAlgebraic ℚ Ω:=Algebra.IsAlgebraic.trans ℚ K Ω
  obtain ⟨bound,away⟩:=TunnellCMKummerUnramified.uniform («B»:=Ω) n hn i hi
  obtain ⟨p,hp,hlarge,h₃,hmod,good,g,v,j,q,hj,hij,hq,hN,hplus,hminus,first⟩:=
    TunnellCMTracePrime.arbitrarily_large K i hi hiC n hn hn2 hn8 c hc hder bound
  letI : Fact p.Prime:=⟨hp⟩
  letI : Algebra K (Local p):=g.toAlgebra
  have hspl : p=4*(p/4)+1:=by omega
  have hIC : algebraMap K ℂ i=I:=by rw [IsScalarTower.algebraMap_apply K B ℂ]; exact hiC
  obtain ⟨U,hU,ho,hG,hd,hT,Z,w,hg,hZ,hz,hw,_,_,hu,a,a₀,hjet,hupper⟩:=first
  let T:=coordField W U
  letI : NumberField T:=hT
  letI : IsAbelianGalois K T:=hG
  letI : FiniteDimensional K T:=FiniteDimensional.of_finrank_pos (hd.trans_gt (by omega))
  apply TunnellGlobalRankObstruction.finite_order v hn hspl good i hi hIC j hj hij q hq hN hminus hplus U dK hU w hw hu Z hZ hz a.val.val a₀ hjet _ _ P
  · exact hupper
  · intro H _ _ x y hh r
    exact away H x y hh p r q hp hlarge hN

theorem trace_zero (n : ℕ) (hn : 0<n) (hn2 : 2<n) (hn8 : n%8=2)
    (P : (E (n:ℚ)).toAffine.Point) (hP : ¬IsOfFinAddOrder P) (r : ℚ)
    (h : ((aux n:ℂ)^2-(aux n:ℂ))*((r:ℂ)*(realPeriod n:ℂ))=TunnellCMTraceSlope.trace n hn) : r=0 := by
  classical
  by_contra hr
  letI : (E (n:TunnellCMConcreteGaussian.K)).IsElliptic:=E_elliptic (by norm_num) (by exact_mod_cast hn.ne')
  obtain ⟨Q,hQ⟩:=TunnellCMGroundPoint.non_torsion (↥TunnellCMConcreteGaussian.K) n P hP
  obtain ⟨c,hc,hc'⟩:=TunnellCMTraceSlope.nonzero n hn r hr h
  exact hQ (finite_order (↥TunnellCMConcreteGaussian.K) TunnellCMConcreteGaussian.i
    TunnellCMConcreteGaussian.square TunnellCMConcreteGaussian.orientation n hn TunnellCMConcreteGaussian.degree hn2 hn8 c hc hc' Q)

end
end TunnellCMRankVanishing
#print axioms TunnellCMRankVanishing.trace_zero
