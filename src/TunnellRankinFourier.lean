import TunnellRankinFactor

/-! Polarized Parseval on horizontal lines for the weight-two and weight-one factors. -/

namespace TunnellRankin
open AddCircle MeasureTheory Complex
open scoped ComplexConjugate InnerProductSpace

noncomputable def circleSeries (a : ℕ→ℂ) : C(AddCircle (1:ℝ),ℂ) := ∑' n : ℕ,a n • fourier (T:=1) (n:ℤ)

lemma circle_hasSum {a : ℕ→ℂ} (ha : Summable a) :
    HasSum (fun n : ℕ => a n • fourier (T:=1) (n:ℤ)) (circleSeries a) := by
  apply Summable.hasSum
  apply Summable.of_norm
  simpa [norm_smul,fourier_norm] using ha.norm

lemma circle_parseval {a b : ℕ→ℂ} (ha : Summable a) (hb : Summable b) :
    HasSum (fun n : ℕ => a n*conj (b n)) (∫ x : AddCircle (1:ℝ),
      conj (circleSeries b x)*circleSeries a x ∂haarAddCircle) := by
  let μ := @haarAddCircle (1:ℝ) (by exact ⟨by norm_num⟩)
  let v (k : ℕ) : Lp ℂ 2 μ := fourierLp 2 (T:=1) (k:ℤ)
  let A := ContinuousMap.toLp 2 μ ℂ (circleSeries a)
  let B := ContinuousMap.toLp 2 μ ℂ (circleSeries b)
  have ha' : HasSum (fun n : ℕ => a n • v n) A := by
    simpa only [A,v,map_smul] using (circle_hasSum ha).mapL (ContinuousMap.toLp 2 μ ℂ)
  have hb' : HasSum (fun n : ℕ => b n • v n) B := by
    simpa only [B,v,map_smul] using (circle_hasSum hb).mapL (ContinuousMap.toLp 2 μ ℂ)
  have hi (k : ℕ) : inner ℂ (v k) B=b k := by
    have hh := hb'.mapL (innerSL ℂ (v k))
    simp only [innerSL_apply_apply,inner_smul_right] at hh
    apply hh.unique
    have vv (n : ℕ) : inner ℂ (v k) (v n) = if k=n then 1 else 0 := by
      simpa only [v,Nat.cast_inj] using (orthonormal_iff_ite.mp (orthonormal_fourier (T:=1)) (k:ℤ) (n:ℤ))
    simp only [vv,mul_ite,mul_one,mul_zero]
    simpa using (hasSum_single (f:=fun n => if k=n then b n else 0) k (by intro n hn; simp [Ne.symm hn]))
  have sum := ha'.mapL (innerSL ℂ B)
  simp only [innerSL_apply_apply] at sum
  rw [show inner ℂ B A = ∫ x : AddCircle (1:ℝ),conj (circleSeries b x)*circleSeries a x ∂haarAddCircle by
    simpa only [A,B,μ,RCLike.inner_apply,mul_comm] using
      ContinuousMap.inner_toLp μ (circleSeries b) (circleSeries a)] at sum
  apply sum.congr_fun
  intro n
  simp only [innerSL_apply_apply,inner_smul_right,←hi n]
  rw [inner_conj_symm]

end TunnellRankin
#print axioms TunnellRankin.circle_parseval
