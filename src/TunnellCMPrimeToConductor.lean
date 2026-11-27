import TunnellCMCriticalCoordinates

/-! Regularity and the exact elliptic-unit norm formula at every torsion translate
whose order is prime to the conductor. -/
namespace TunnellCMPrimeToConductor
open Complex LSG.Weierstrass TunnellCMLemniscate TunnellCMDistribution TunnellCMEllipticUnit
open TunnellCMCritical TunnellCMLSeries TunnellCMUnitTrace TunnellCMNormDistribution
open TunnellCMTraceDistribution TunnellCMCriticalIntegers TunnellCMToricDivision
open scoped NumberField
noncomputable section
variable (n : ℕ) (hn : 0<n)
local notation "L" => twistPeriods n hn
local notation "B" => algebraicClosure ℚ ℂ

theorem translated_regular {m : ℕ} (hc : (4*n).Coprime (aux n*m))
    {z : ℂ} (hz : (m:ℂ)*z∈(L).lattice) (i : Residues n) (hi : weight n i≠0) :
    z+point n i∈regular L (aux n) := by
  intro hbad
  have h := (TunnellCMTranscendental.analytic_killed L _ _).mpr hbad
  have h' := congrArg (m • ·) h
  have hZ := (TunnellCMTranscendental.analytic_killed L _ _).mpr hz
  have hz' : (aux n*m) • expE L z=0 := by rw [← smul_smul,hZ,nsmul_zero]
  have H : (aux n*m) • expE L (point n i)=0 := by
    simpa only [expE_add,← mul_nsmul,mul_comm m (aux n),nsmul_add,hz',zero_add,nsmul_zero] using h'
  have hd := addOrderOf_dvd_of_nsmul_eq_zero H
  rw [TunnellCMConductorOrder.conductor_order n hn i hi] at hd
  have he := hc.gcd_eq_one
  rw [Nat.gcd_eq_left hd] at he
  omega

theorem torsion_unit {m : ℕ} (hm : 0 < m) (hc : (4*n).Coprime (aux n*m))
    (hn8 : n%8=2) (h2 : 2<n) {z : ℂ} (hz : (m:ℂ)*z∈(L).lattice) :
    ∃ u : (𝓞 B)ˣ, ((u.val.val : B) : ℂ)=traceUnit n hn z := by
  classical
  letI : NeZero (aux n) := ⟨by unfold aux; omega⟩
  exact value_unit n hn hm hn8 h2 hc hz (Finset.prod_ne_zero_iff.mpr fun i hi =>
    zpow_ne_zero _ (division_nonzero L _ (translated_regular n hn hc hz i (Finset.mem_filter.mp hi).2)))

theorem torsion_distribution {m p : ℕ} (hc : (4*n).Coprime (aux n*m))
    (hp : p.Prime) (h2 : p≠2) (q : GaussianInt) (hq : q.norm.natAbs=p)
    (hpr : TunnellGaussian.Primary q) (hf : p.Coprime (4*n)) (ha : p.Coprime (aux n))
    (hn8 : n%8=2) [Fintype (kernel n hn q)] (t : kernel n hn q → ℂ)
    (ht : ∀ j, expE L (t j)=j.val) {z : ℂ} (hz : (m:ℂ)*z∈(L).lattice) :
    (∏ j, traceUnit n hn (z+t j))=traceUnit n hn ((q:ℂ)*z)^twistSign n p := by
  have hs : twistSign n p≠0 := by intro h; simpa [h] using signed n hp h2 hf
  apply norm_trace n hn hp h2 q hq hpr hf ha hn8 t ht z
  intro i hi
  have hw : weight n (forward n q i)≠0 := by
    rw [weight_forward n hn q hpr,hq]; exact mul_ne_zero hs hi
  have hz' : (m:ℂ)*((q:ℂ)*z)∈(L).lattice := by rw [mul_left_comm]; exact cm_lattice n hn q hz
  apply TunnellCMUnitDistribution.regular_of_sub n hn (translated_regular n hn hc hz' _ hw)
  simpa [mul_add] using shift n hn q i

end
end TunnellCMPrimeToConductor
#print axioms TunnellCMPrimeToConductor.torsion_distribution
#print axioms TunnellCMPrimeToConductor.torsion_unit
