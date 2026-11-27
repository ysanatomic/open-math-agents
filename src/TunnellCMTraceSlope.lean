import TunnellCMUnitTrace

/-! The critical finite zeta trace gives the rational derivative without
any choice of analytic continuation or auxiliary L-function. -/
namespace TunnellCMTraceSlope
open Complex TunnellCMLSeries TunnellCMCritical TunnellCMUnitTrace TunnellEllipticZeta
open TunnellCMLemniscate TunnellCMEllipticUnit TunnellCoates TunnellCMDistribution Finset
open scoped ComplexConjugate Classical
noncomputable section
def trace (n : ℕ) (hn : 0<n) : ℂ :=
  letI : NeZero (4*n):=⟨by omega⟩
  ∑ v : Residues n, (charWeight n (liftResidue v):ℂ) *
    (-conj (multiplicationZeta (periods n hn) (aux n) (liftResidue v:ℂ)))

theorem derivative (n : ℕ) (hn : 0<n) (r : ℚ)
    (h : ((aux n:ℂ)^2-(aux n:ℂ))*((r:ℂ)*(realPeriod n:ℂ))=trace n hn) :
    logDeriv (traceUnit n hn) 0 = -2*(4*n:ℂ)*((aux n:ℂ)^2-(aux n:ℂ))*(r:ℂ) := by
  classical
  letI : NeZero (4*n):=⟨by omega⟩
  have eL := h
  unfold trace at eL
  let Z (r : Residues n) := multiplicationZeta (periods n hn) (aux n) (liftResidue r:ℂ)
  have ce : ∑ v : Residues n, (weight n v:ℂ)*Z v =
      -(((aux n:ℂ)^2-(aux n:ℂ))*(r:ℂ)*(realPeriod n:ℂ)) := by
    have e := congrArg (fun y : ℂ => -conj y) eL.symm
    simpa only [weight,Z,map_mul,map_sub,map_pow,map_natCast,map_ratCast,Complex.conj_ofReal,
      map_sum,map_neg,map_intCast,Complex.conj_conj,mul_neg,Finset.sum_neg_distrib,neg_neg,mul_assoc] using e
  obtain ⟨h1,h2⟩ := base_dilations n hn
  have hZ (v : Residues n) : multiplicationZeta (twistPeriods n hn) (aux n) (point n v) =
      (dilation n:ℂ)⁻¹*Z v := TunnellCMScale.multiplication_scale _ _ (dilation_ne n hn) h1 h2 _ _
  rw [derivative_sum]
  calc
    _ = (2*(dilation n:ℂ)⁻¹) * ∑ v : Residues n, (weight n v:ℂ)*Z v := by
      rw [Finset.mul_sum]
      apply Finset.sum_congr rfl
      intro v _
      rw [hZ]
      ring
    _ = _ := by
      rw [ce,dilation]
      have hΩ : (realPeriod n:ℂ) ≠ 0 := Complex.ofReal_ne_zero.mpr (realPeriod_pos (by exact_mod_cast hn)).ne'
      push_cast
      field_simp [hΩ]
      <;> ring

theorem nonzero (n : ℕ) (hn : 0<n) (r : ℚ) (hr : r≠0)
    (h : ((aux n:ℂ)^2-(aux n:ℂ))*((r:ℂ)*(realPeriod n:ℂ))=trace n hn) :
    ∃ c : ℚ, c≠0 ∧ logDeriv (traceUnit n hn) 0=(c:ℂ) := by
  let a : ℚ:=aux n
  have ha : 1<a := by dsimp [a,aux]; exact_mod_cast (by omega : 1<1+3*(4*n))
  have hpos : 0<a^2-a := by nlinarith [mul_pos (sub_pos.mpr ha) (lt_trans zero_lt_one ha)]
  have hfirst : (-2:ℚ)*(4*(n:ℚ))≠0:=mul_ne_zero (by norm_num) (by positivity)
  refine ⟨-2*(4*(n:ℚ))*(a^2-a)*r,mul_ne_zero (mul_ne_zero hfirst hpos.ne') hr,?_⟩
  rw [derivative n hn r h]
  simp [a]

end
end TunnellCMTraceSlope
#print axioms TunnellCMTraceSlope.nonzero
