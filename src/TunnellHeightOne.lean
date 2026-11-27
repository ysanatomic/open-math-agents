import TunnellFormalGroupHeight
import TunnellChordDifferential
import TunnellLemniscaticCoefficients
import TunnellHasseInvariant

/-! # Explicit ordinary and non-anomalous multiplication series at split primes -/

namespace TunnellHeightOne

open ChabautyColeman IsLocalRing IsDedekindDomain IsDedekindDomain.HeightOneSpectrum
open scoped PowerSeries

variable {R K:Type*} [CommRing R] [IsDedekindDomain R] [Field K]
  [Algebra R K] [IsFractionRing R K] [CharZero K] {v:HeightOneSpectrum R}

/-- At every split good prime the first unit coefficient of the elliptic
p-series has index p and residue distinct from both zero and one. -/
theorem split_prime_series {p m : ℕ} [Fact p.Prime] (hp:p=4*m+1)
    (ρ:ResidueField (v.adicCompletionIntegers K) ≃+* ZMod p)
    (n:v.adicCompletionIntegers K) (hn : ρ (residue _ n) ≠ 0) :
    let O := v.adicCompletionIntegers K
    let F := (TunnellCoates.E n).formalGroupLaw.mulSeries p
    let H := ρ (residue O (PowerSeries.coeff p F))
    PowerSeries.constantCoeff F = 0 ∧ PowerSeries.coeff 1 F = (p:O) ∧
      (∀ j < p, PowerSeries.coeff j F ∈ maximalIdeal O) ∧
      H = ((2*m).choose m : ZMod p)*(-(ρ (residue O n))^2)^m ∧ H ≠ 0 ∧ H ≠ 1 := by
  let O := v.adicCompletionIntegers K
  let Φ := (TunnellCoates.E n).formalGroupLaw
  have hco : CharZero (v.adicCompletion K) :=
    charZero_of_injective_algebraMap (algebraMap K (v.adicCompletion K)).injective
  have : CharZero O := (algebraMap O (v.adicCompletion K)).charZero
  have hmem : (p:O) ∈ maximalIdeal O := by
    apply (residue_eq_zero_iff _).mp
    apply ρ.injective
    simp
  obtain ⟨hbelow,hpF⟩ := TunnellFormalGroupHeight.prime_jet Φ (Fact.out:p.Prime) hmem
  have hD : PowerSeries.constantCoeff (Φ.diffMatrix⁻¹ () ())=1 := by
    rw [PowerSeries.constantCoeff_eq]
    simpa using congrArg (fun M => M () ()) Φ.diffMatrixInv_map_constantCoeff
  have hcoef := TunnellLemniscaticCoefficients.quartic_coefficient (Φ.diffMatrix⁻¹ () ()) n
    hD (TunnellChordDifferential.differential_square n) m
  have hval : ρ (residue O (PowerSeries.coeff p (Φ.mulSeries p))) =
      ((2*m).choose m : ZMod p)*(-(ρ (residue O n))^2)^m := by
    rw [hpF,show p-1=4*m by omega,hcoef]
    simp [Nat.centralBinom,O]
  have hneq := TunnellHasseInvariant.hasse_ne_zero_one hp _ hn
  refine ⟨Φ.constantCoeff_mulSeries _,ChabautyColeman.coeff_single_mulSeries Φ p,
    fun j hj => (residue_eq_zero_iff _).mp (hbelow j hj),hval,?_,?_⟩
  · rw [hval]; exact hneq.1
  · rw [hval]; exact hneq.2

#print axioms split_prime_series
end TunnellHeightOne
