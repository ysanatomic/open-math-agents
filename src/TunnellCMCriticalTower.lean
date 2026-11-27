import TunnellCMTraceDistribution

/-! Algebraic critical-value units on each level of the primary division tower. -/
namespace TunnellCMCriticalTower

open Complex LSG.Weierstrass TunnellCMLemniscate TunnellCMNormDistribution TunnellCMDistribution
open TunnellCMCritical TunnellCMUnitTrace TunnellCMLSeries TunnellCMTraceDistribution TunnellCMUnitDistribution

noncomputable section
variable (n : ℕ) (hn : 0<n)
local notation "L" => twistPeriods n hn

def parameter (q : GaussianInt) (r : ℕ) := (L).ω₁/(q : ℂ)^r

lemma parameter_step (q : GaussianInt) (h : q ≠ 0) (r : ℕ) :
    (q : ℂ)*parameter n hn q (r+1)=parameter n hn q r := by
  have h' := GaussianInt.toComplex_eq_zero.not.mpr h
  simp only [parameter,pow_succ]
  field_simp

lemma parameter_torsion {p : ℕ} (q : GaussianInt) (h : q ≠ 0) (hq : q.norm.natAbs=p) (r : ℕ) :
    ((p^r : ℕ) : ℂ)*parameter n hn q r ∈ (L).lattice := by
  have h' := GaussianInt.toComplex_eq_zero.not.mpr h
  have e : (q : ℂ)*((star q : GaussianInt) : ℂ) = (p : ℂ) := by
    simpa only [map_mul,map_natCast,hq] using congrArg GaussianInt.toComplex (TunnellGaussian.norm_product q)
  have eqn : ((p^r : ℕ) : ℂ)*parameter n hn q r=(((star q)^r : GaussianInt) : ℂ)*(L).ω₁ := by
    rw [parameter,map_pow,Nat.cast_pow,← e,mul_pow]
    field_simp
  rw [eqn]
  exact cm_lattice n hn _ (L).ω₁_mem_lattice

theorem critical_tower {p : ℕ} (hp : p.Prime) (h2 : p≠2) (q : GaussianInt) (hq : q.norm.natAbs=p)
    (hpr : TunnellGaussian.Primary q) (hf : p.Coprime (4*n)) (ha : p.Coprime (aux n)) (hn8 : n%8=2) :
    ∃ t : kernel n hn q → ℂ, (∀ j, expE L (t j)=j.val) ∧ ∀ r : ℕ,
      traceUnit n hn (parameter n hn q r) ∈ algebraicClosure ℚ ℂ ∧
      traceUnit n hn (parameter n hn q r) ≠ 0 ∧
      (∏ j ∈ points n hn hp h2 hq,
        traceUnit n hn (parameter n hn q (r+1)+t j)) = traceUnit n hn (parameter n hn q r)^twistSign n p := by
  classical
  letI : NeZero (4*n) := ⟨by omega⟩
  letI : NeZero (aux n) := ⟨by unfold aux; omega⟩
  letI : Finite (kernel n hn q) := Nat.finite_of_card_ne_zero ((gram_card n hn hp h2 hq).trans_ne hp.ne_zero)
  letI : Fintype (kernel n hn q) := Fintype.ofFinite _
  let t (j : kernel n hn q) := (TunnellCMTorus.exp_surjective L j.val).choose
  have ht (j : kernel n hn q) : expE L (t j)=j.val := (TunnellCMTorus.exp_surjective L j.val).choose_spec
  have q0 : q≠0 := by rintro rfl; exact hp.ne_zero (by simpa using hq.symm)
  have sign0 : twistSign n p ≠ 0 := by
    intro e
    have h := signed n hp h2 hf
    simp [e] at h
  have reg_step (r : ℕ) (i : Residues n) (hi : weight n i≠0)
      (H : ∀ j : Residues n, weight n j≠0 → parameter n hn q r + point n j ∈ regular L (aux n)) :
      (q : ℂ)*(parameter n hn q (r+1)+point n i) ∈ regular L (aux n) := by
    have hfw : weight n (forward n q i)≠0 := by
      rw [weight_forward n hn q hpr,hq]; exact mul_ne_zero sign0 hi
    apply regular_of_sub n hn (H _ hfw)
    simpa only [mul_add,parameter_step n hn q q0,add_sub_add_left_eq_sub] using shift n hn q i
  have reg (r : ℕ) (i : Residues n) (hi : weight n i≠0) :
      parameter n hn q r + point n i ∈ regular L (aux n) := by
    induction r generalizing i with
    | zero =>
      apply regular_of_sub n hn (shift_regular n hn i hi)
      simpa [parameter] using (L).ω₁_mem_lattice
    | succ r ih =>
      have hh := reg_step r i hi ih
      intro he
      apply hh
      rw [mul_left_comm]
      exact cm_lattice n hn q he
  refine ⟨t,ht,fun r => ⟨TunnellCMAlgebraicUnits.traceUnit_mem n hn (pow_pos hp.pos r)
    (parameter_torsion n hn q q0 hq r),?_,?_⟩⟩
  · apply Finset.prod_ne_zero_iff.mpr
    intro i hi
    exact zpow_ne_zero _ (division_nonzero L _ (reg r i ((Finset.mem_filter.mp hi).2)))
  · have e := norm_trace n hn hp h2 q hq hpr hf ha hn8 t ht (parameter n hn q (r+1))
        (fun i hi => reg_step r i hi (reg r))
    rw [parameter_step n hn q q0] at e
    exact e

end
end TunnellCMCriticalTower
#print axioms TunnellCMCriticalTower.critical_tower
