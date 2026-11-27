import TunnellCMIntegralSlope
import TunnellCMOrientedPlace
import TunnellCMUnitTrace

/-! Simultaneous choice of the split prime, the oriented primary factor,
the base place and the integral unit first coefficient. -/
namespace TunnellCMOrdinaryPrime
open Complex WeierstrassCurve IntermediateField NumberField IsLocalRing
open TunnellCoates TunnellCMLemniscate TunnellCMCritical TunnellCMLSeries TunnellCMEllipticUnit
open TunnellCMUnitTrace TunnellCMCriticalIntegers TunnellCMCriticalCoefficients
open TunnellCMIntegralSlope TunnellCMCoefficientCompletion TunnellPadicDivisionSeries TunnellLocalDivisibility
open scoped Classical NumberField
noncomputable section
set_option maxHeartbeats 800000
local notation "AlgC" => algebraicClosure ℚ ℂ
variable (K : Type) [Field K] [NumberField K] [Algebra K AlgC] [DecidableEq K]
variable (n : ℕ) (hn : 0<n) {F : IntermediateField K AlgC} (D : Data K n hn F) [FiniteDimensional K F]
local notation "N" => normalClosure K F AlgC

theorem exists_prime (i : K) (hi : i^2= -1) (r : ℚ) (hr : r≠0)
    (hder : logDeriv (traceUnit n hn) 0=(r:ℂ)) (bound : ℕ) :
    ∃ p : ℕ, ∃ hp : p.Prime, bound<p ∧ 3<p ∧ p%4=1 ∧ p.Coprime (4*n) ∧ p.Coprime (aux n) ∧
      letI : Fact p.Prime := ⟨hp⟩
      ∃ (e : N →ₐ[ℚ] ℚ_[p]) (C : Coordinates K n hn D p e), IsUnit (firstCoefficient K n hn D C) ∧
        let g:K→+*Local p := padicMap.comp (e.toRingHom.comp (algebraMap K N))
        ∃ (v : TunnellRestrictedPlaces.Restriction (B:=IntegerRing p) g) (j : IntegerRing p) (q : GaussianInt),
          j^2= -1 ∧ g i=(j:Local p) ∧ TunnellGaussian.Primary q ∧ q.norm.natAbs=p ∧ q.re^2+q.im^2=(p:ℤ) ∧
          (q.re:IntegerRing p)+(q.im:IntegerRing p)*j∈maximalIdeal _ ∧ IsUnit ((q.re:IntegerRing p)-(q.im:IntegerRing p)*j) := by
  obtain ⟨p,hp,hl,hmod,e,C,hC⟩:=good_slope K n hn D i hi r hr hder (max (max bound 3) (max (4*n) (aux n)))
  letI : Fact p.Prime := ⟨hp⟩
  have hfa : 0<aux n := by unfold aux; omega
  have cop (k : ℕ) (hk : 0<k) (hle : k<p) : p.Coprime k := hp.coprime_iff_not_dvd.mpr (fun h => hle.not_ge (Nat.le_of_dvd hk h))
  refine ⟨p,hp,by omega,by omega,hmod,cop _ (by omega) (by omega),cop _ hfa (by omega),?_⟩
  refine ⟨e,C,hC,?_⟩
  let g:=e.toRingHom.comp (algebraMap K N)
  exact TunnellCMOrientedPlace.of_embedding hmod i hi g

end
end TunnellCMOrdinaryPrime
#print axioms TunnellCMOrdinaryPrime.exists_prime
