import TunnellRankinConstant
import Mathlib.NumberTheory.LSeries.Convolution

/-! The class-group theta Dirichlet series factors as ζ(s)L(χ,s) on Re(s)>1. -/
namespace TunnellClassThetaMellin
open Complex TunnellRankin DirichletCharacter
open scoped LSeries.notation
noncomputable section

lemma class_hasSum {d : ℕ} (hd : 0<d) {s : ℂ} (hs : 1<s.re) :
    HasSum (fun m : ℕ => (idealCoeff d m:ℂ)/(m:ℂ)^s) (riemannZeta s*negativeL d hd s) := by
  letI : NeZero (4*(2*d)) := ⟨by omega⟩
  let χ := negCharacter d hd
  have hc : LSeriesHasSum (fun n : ℕ => χ n) s (negativeL d hd s) := by
    rw [negativeL,DirichletCharacter.LFunction_eq_LSeries _ hs]
    exact (χ.LSeriesSummable_of_one_lt_re hs).LSeriesHasSum
  apply ((LSeriesHasSum_one hs).convolution hc).congr_fun
  intro m
  rw [LSeries.term_of_ne_zero' (by intro e; simp [e] at hs; linarith)]
  congr 1
  simp only [LSeries.convolution_def,Pi.one_apply,one_mul,χ,negCharacter_nat,
    idealCoeff,Int.cast_sum,Nat.sum_divisorsAntidiagonal' (fun _ b => (negWeight d b:ℂ))]
end
end TunnellClassThetaMellin
#print axioms TunnellClassThetaMellin.class_hasSum
