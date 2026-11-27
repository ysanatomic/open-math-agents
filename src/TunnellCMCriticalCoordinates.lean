import TunnellCMCriticalIntegers

/-! The critical logarithmic derivative in torsion coordinates and integral values in the division tower. -/
namespace TunnellCMCriticalCoordinates
open Complex LSG.Weierstrass TunnellCMLemniscate TunnellCMDistribution TunnellCMEllipticUnit
open TunnellCMCritical TunnellCMUnitTrace TunnellCMLSeries TunnellCMModelUnit TunnellCMAbsoluteUnit
open TunnellCMNormDistribution TunnellCMCriticalIntegers TunnellCMCriticalTower
open TunnellEllipticZeta
open scoped NumberField
noncomputable section
variable (n : ℕ) (hn : 0<n)
local notation "L" => twistPeriods n hn
local notation "A" => algebraicClosure ℚ ℂ

lemma direct_log (M : PeriodPair) (a : ℕ) [NeZero a] {z : ℂ} (hz : z∈regular M a) :
    2*multiplicationZeta M a z =
      ∑ j ∈ divisionGrid M a, M.derivWeierstrassP z / (M.weierstrassP z - M.weierstrassP (liftGrid M j)) := by
  rw [← log_divisionProduct M a hz]
  have hs : z∉M.lattice := fun h => hz (mul_mem M a h)
  let G (j : Grid a) (v : ℂ) := M.weierstrassP v - M.weierstrassP (liftGrid M j)
  have hh (j : Grid a) : HasDerivAt (G j) (M.derivWeierstrassP z) z := (hasDerivP M hs).sub_const _
  have hg := Finset.prod_ne_zero_iff.mp (division_nonzero M a hz)
  change logDeriv (fun v => ∏ j ∈ divisionGrid M a, G j v) z = _
  rw [logDeriv_prod (f := G) (fun j hj => hg j hj) (fun j _ => (hh j).differentiableAt)]
  exact Finset.sum_congr rfl (fun j _ => by rw [logDeriv_apply,(hh j).deriv])

def support : Finset (Residues n) := by
  classical
  letI : NeZero (4*n) := ⟨by omega⟩
  exact Finset.univ.filter (fun i => weight n i≠0)

theorem coord_derivative : logDeriv (traceUnit n hn) 0 =
    ∑ i ∈ support n hn, (weight n i : ℂ)*∑ j ∈ divisionGrid L (aux n),
      (2*Y (uniformize n hn (point n i)) /
        (X (uniformize n hn (point n i))-X (uniformize n hn (liftGrid L j)))) := by
  classical
  letI : NeZero (aux n) := ⟨by unfold aux; omega⟩
  letI : NeZero (4*n) := ⟨by omega⟩
  rw [derivative_sum]
  rw [← Finset.sum_filter_of_ne (p := fun i => weight n i≠0) (s := Finset.univ)
    (fun i _ h => by contrapose! h; simp [h])]
  apply Finset.sum_congr rfl
  intro i hi
  have hh := shift_regular n hn i ((Finset.mem_filter.mp hi).2)
  have hs : point n i∉(L).lattice := fun h => hh (mul_mem L _ h)
  have y : Y (uniformize n hn (point n i))=(L).derivWeierstrassP (point n i)/2 := by
    rw [uniformize_apply,expE_of_notMem L hs,WeierstrassCurve.Affine.Point.equivOfEq_some]; rfl
  have twice (v : ℂ) : 2*(v/2)=v := by ring
  simp only [direct_log L _ hh,x_uniformize,y,twice]

theorem tower_units {p : ℕ} (hp : p.Prime) (h2 : p≠2) (q : GaussianInt) (hq : q.norm.natAbs=p)
    (hpr : TunnellGaussian.Primary q) (hf : p.Coprime (4*n)) (ha : p.Coprime (aux n))
    (hn8 : n%8=2) (hn2 : 2<n) :
    ∃ u : ℕ → (𝓞 A)ˣ, ∃ t : kernel n hn q → ℂ, (∀ j, expE L (t j)=j.val) ∧
      (∀ r, ((u r).val.val : ℂ) = traceUnit n hn (parameter n hn q r)) ∧ ∀ r,
      (∏ j ∈ TunnellCMUnitDistribution.points n hn hp h2 hq,
        traceUnit n hn (parameter n hn q (r+1)+t j)) = ((u r).val.val : ℂ)^twistSign n p := by
  obtain ⟨t,ht,H⟩ := critical_tower n hn hp h2 q hq hpr hf ha hn8
  have q0 : q≠0 := by rintro rfl; exact hp.ne_zero (by simpa using hq.symm)
  have hfaux : (4*n).Coprime (aux n) := (Nat.coprime_add_mul_right_right (4*n) 1 3).mpr (Nat.coprime_one_right _)
  have value (r : ℕ) := value_unit n hn (pow_pos hp.pos r) hn8 hn2
    (hfaux.mul_right (hf.symm.pow_right r)) (parameter_torsion n hn q q0 hq r) (H r).2.1
  choose u hu using value
  exact ⟨u,t,ht,hu,fun r => (H r).2.2.trans (congrArg (·^twistSign n p) (hu r).symm)⟩

end
end TunnellCMCriticalCoordinates
#print axioms TunnellCMCriticalCoordinates.coord_derivative
#print axioms TunnellCMCriticalCoordinates.tower_units
