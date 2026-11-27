import TunnellCMUnitTrace
import TunnellCMTranscendental
import Mathlib.FieldTheory.AlgebraicClosure

/-! Arithmeticity of the coordinates and of the elliptic-unit values at all division points. -/
namespace TunnellCMAlgebraicUnits

open Complex LSG.Weierstrass TunnellCMLemniscate TunnellCMDistribution TunnellCMUnitTrace
open TunnellCMEllipticUnit TunnellCoates TunnellCMLSeries TunnellCMCritical

variable (n : ℕ) (hn : 0<n)
local notation "M" => twistPeriods n hn
local notation "A" => algebraicClosure ℚ ℂ

lemma wp_mem {z : ℂ} {m : ℕ} (hm : 0 < m) (h : (m:ℂ)*z∈(M).lattice) :
    (M).weierstrassP z ∈ A := by
  by_cases hz : z∈(M).lattice
  · rw [show (M).weierstrassP z=0 from (M).weierstrassP_coe ⟨z,hz⟩]
    exact (A).zero_mem
  exact mem_algebraicClosure_iff.mpr (TunnellCMTranscendental.division_x_algebraic n m hn hm hz h)

lemma y_mem {z : ℂ} {m : ℕ} (hm : 0 < m) (h : (m:ℂ)*z∈(M).lattice) (hz : z∉(M).lattice) :
    (M).derivWeierstrassP z/2 ∈ A := by
  have hX := wp_mem n hn hm h
  apply mem_algebraicClosure_iff.mpr
  apply IsAlgebraic.of_pow (n := 2) (by decide)
  have e := equation_weierstrassP M hz
  change (curve M).toAffine.Equation _ _ at e
  rw [curve_eq] at e
  rw [(TunnellCoates.E_equation (n:ℂ) _ _).mp e]
  exact mem_algebraicClosure_iff.mp ((A).sub_mem ((A).pow_mem hX (3:ℕ)) ((A).mul_mem ((A).pow_mem ((A).natCast_mem n) 2) hX))

lemma conductor_point (r : Residues n) : ((4*n:ℕ):ℂ)*point n r∈(M).lattice := by
  apply PeriodPair.mem_lattice.mpr
  let g := liftResidue r
  refine ⟨g.re,g.im,?_⟩
  change (g.re:ℂ)*(realPeriod n:ℂ)+g.im*(I*(realPeriod n:ℂ))= ((4*n:ℕ):ℂ)*((dilation n:ℂ)*(g:ℂ))
  rw [GaussianInt.toComplex_def]
  dsimp [dilation]
  push_cast
  have hN : (n:ℂ)≠0 := by exact_mod_cast hn.ne'
  field_simp [hN]
  <;> ring

lemma shifted (r : Residues n) {z : ℂ} {m : ℕ} (h : (m:ℂ)*z∈(M).lattice) :
    ((m*(4*n):ℕ):ℂ)*(z+point n r)∈(M).lattice := by
  have h1 := mul_mem M (4*n) h
  have h2 := mul_mem M m (conductor_point n hn r)
  convert add_mem h1 h2 using 1 <;> push_cast <;> ring

theorem divisionProduct_mem (a : ℕ) [NeZero a] {m : ℕ} (hm : 0 < m) {z : ℂ}
    (h : (m:ℂ)*z∈(M).lattice) : divisionProduct M a z ∈ A := by
  apply (A).prod_mem
  intro j hj
  exact (A).sub_mem (wp_mem n hn hm h) (wp_mem n hn (Nat.pos_of_ne_zero (NeZero.ne a)) (mul_lift M j))

theorem traceUnit_mem {m : ℕ} (hm : 0 < m) {z : ℂ} (h : (m:ℂ)*z∈(M).lattice) : traceUnit n hn z ∈ A := by
  classical
  letI : NeZero (4*n) := ⟨by omega⟩
  letI : NeZero (aux n) := ⟨by unfold aux; omega⟩
  apply (A).prod_mem
  intro r _
  exact (A).toSubfield.zpow_mem (divisionProduct_mem n hn _ (Nat.mul_pos hm (by omega : 0<4*n)) (shifted n hn r h)) _

end TunnellCMAlgebraicUnits

#print axioms TunnellCMAlgebraicUnits.traceUnit_mem
