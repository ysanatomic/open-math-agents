import TunnellCMFirstTowerAt
import TunnellCMOrdinaryPrime

/-! A nonzero rational logarithmic derivative produces arbitrarily large
split primes with the global universal norm and nonzero local first coefficient
in the same first division field. -/
namespace TunnellCMTracePrime
open NumberField WeierstrassCurve IntermediateField IsLocalRing
open TunnellCMCriticalCoefficients TunnellCMFirstTowerAt TunnellCMUnitTrace TunnellCMCoefficientCompletion
open TunnellRestrictedPlaces TunnellLocalDivisibility TunnellPadicDivisionSeries TunnellCoates
open scoped Classical NumberField
noncomputable section
local notation "B" => algebraicClosure ℚ ℂ
variable (K : Type) [Field K] [NumberField K] [Algebra K B] [DecidableEq K]
  [Algebra K ℂ] [IsScalarTower K B ℂ] (i : K) (hi : i^2= -1) (hiC : ((algebraMap K B i:B):ℂ)=Complex.I)
variable (n : ℕ) (hn : 0<n) [(E (n:K)).IsElliptic]

include hiC in
theorem arbitrarily_large (hn2 : 2<n) (hn8 : n%8=2) (c : ℚ) (hc : c≠0)
    (hder : logDeriv (traceUnit n hn) 0=(c:ℂ)) (bound : ℕ) :
    ∃ p : ℕ, ∃ hp : p.Prime, bound<p ∧ 3<p ∧ p%4=1 ∧ ¬p∣2*n ∧
      letI : Fact p.Prime:=⟨hp⟩
      ∃ (g : K →+* Local p) (v : Restriction («B»:=IntegerRing p) g) (j : IntegerRing p) (q : GaussianInt),
        j^2= -1 ∧ g i=(j:Local p) ∧ q.norm.natAbs=p ∧ q.re^2+q.im^2=(p:ℤ) ∧
        (q.re:IntegerRing p)+(q.im:IntegerRing p)*j∈maximalIdeal _ ∧
        IsUnit ((q.re:IntegerRing p)-(q.im:IntegerRing p)*j) ∧ HasFirstTower K n i hi p q v.v := by
  obtain ⟨F,hF,⟨D⟩⟩:=finite_data K n hn
  letI : FiniteDimensional K F:=hF
  obtain ⟨p,hp,hlarge,h₃,hmod,hcop,haux,e,C,hs,v,j,q,hj,hij,hpr,hq,hN,hplus,hminus⟩:=
    TunnellCMOrdinaryPrime.exists_prime K n hn D i hi c hc hder bound
  letI : Fact p.Prime:=⟨hp⟩
  let g:=padicMap.comp (e.toRingHom.comp (algebraMap K (normalClosure K F B)))
  have good : ¬p∣2*n := hp.coprime_iff_not_dvd.mp (Nat.Coprime.of_dvd_right (by exact ⟨2,by ring⟩) hcop)
  exact ⟨p,hp,hlarge,h₃,hmod,good,g,v,j,q,hj,hij,hq,hN,hplus,hminus,
    TunnellCMFirstTowerAt.realize K n i hi hn D e hiC C hs v q j hmod hj hij hq hN hminus hpr hcop haux hn8 hn2⟩

end
end TunnellCMTracePrime
#print axioms TunnellCMTracePrime.arbitrarily_large
