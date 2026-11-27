import TunnellPointTransport
import TunnellCMGlobalModelUnit
import TunnellCompletionRestriction
import EllipticCurves.WeierstrassFormalGroup.Foundations

/-! The primitive global point has its genuine formal parameter in the selected completion. -/
namespace TunnellFormalAtPlace
open NumberField IsLocalRing IsDedekindDomain IsDedekindDomain.HeightOneSpectrum WithZero
open WeierstrassCurve WeierstrassCurve.Affine TunnellKummer TunnellCMGlobalModelUnit
open TunnellTameParameter TunnellPointTransport
open scoped NumberField
noncomputable section
variable {D R K:Type} [Field D] [NumberField D] [CommRing R] [IsDedekindDomain R]
    [Field K] [Algebra R K] [IsFractionRing R K]

theorem restrict_origin (v:HeightOneSpectrum R) (g:D→+*v.adicCompletion K)
    (s:TunnellRestrictedPlaces.Restriction (B:=v.adicCompletionIntegers K) g)
    (W:WeierstrassCurve D) (P:W.toAffine.Point) (h:above_origin g P) :
    above_origin (algebraMap D (s.v.adicCompletion D)) P := by
  cases P with
  | zero => trivial
  | some x y hh =>
    change 1<Valued.v (g x) at h
    change 1<Valued.v (algebraMap D _ x)
    rw [show Valued.v (algebraMap D (s.v.adicCompletion D) x)=s.v.valuation D x from s.v.valuedAdicCompletion_eq_valuation' x]
    by_contra! hn
    have hv:Valued.v (g x)=s.v.valuation D x^s.e := (v.valuation_maximalIdeal_adicCompletionIntegers _).symm.trans (s.valuation x).symm
    exact h.not_ge (hv ▸ pow_le_one' hn _)

variable (w:HeightOneSpectrum (𝓞 D)) [DecidableEq D] [DecidableEq (w.adicCompletion D)]
local notation "O" => w.adicCompletionIntegers D
local notation "M" => w.adicCompletion D

theorem parameter_at (W:WeierstrassCurve D) (W₀:WeierstrassCurve O)
    (hW:W₀.map (algebraMap O M)=W.baseChange M) [(W.baseChange M).IsElliptic]
    (S:W.toAffine.Point) (hS:above_origin (algebraMap D M) S)
    (z:O) (hz:(z:M)=algebraMap D M (parameter S)) :
    ∃ Z:W₀.formalGroupLaw.Points, formalPoint hW Z=pointMap W M S ∧ (Z ():O)=z := by
  have hmem : pointMap W M S∈filtration hW 0 := by
    cases S with
    | zero => exact zero_mem_filtration
    | some x y hh =>
      change 1<Valued.v (algebraMap D M x) at hS
      change exp (2:ℤ)≤Valued.v (algebraMap D M x)
      by_contra hn
      apply hS.not_ge
      exact (integral_of_not_mem hW ((W.toAffine.map_equation (algebraMap D M).injective x y).mpr hh.1) hn).1
  obtain ⟨Z,hZ⟩ := formalPoint_surjective (hW:=hW) hmem
  refine ⟨Z,hZ,(IsFractionRing.injective O M) ?_⟩
  have hparam : parameter (pointMap W M S)=algebraMap D M (parameter S) := by
    cases S with
    | zero => exact (map_zero _).symm
    | some x y hh => change -(algebraMap D M x)/(algebraMap D M y)=algebraMap D M (-x/y); rw [map_div₀,map_neg]
  exact (parameter_formal hW Z).symm.trans ((congrArg parameter hZ).trans (hparam.trans hz.symm))

#print axioms parameter_at
end
end TunnellFormalAtPlace
