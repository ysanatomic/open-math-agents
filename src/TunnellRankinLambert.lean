import TunnellRankinCotangent
import TunnellRankinEisenstein
import Mathlib.NumberTheory.TsumDivisorsAntidiagonal

/-! The positive vertical rows of the central Rankin Eisenstein series recover the
quadratic ideal-counting theta series. -/
namespace TunnellRankinCotangent
open Complex Finset TunnellRankin UpperHalfPlane
noncomputable section

lemma lambert (d : ℕ) {r : ℂ} (hr : ‖r‖ < 1) :
    (∑' a : ℕ+, ∑' b : ℕ+, (negWeight d b : ℂ)*r^((a:ℕ)*(b:ℕ))) =
      ∑' m : ℕ, (idealCoeff d m : ℂ)*r^m := by
  let F (x : ℕ+×ℕ+) := (negWeight d x.2:ℂ)*r^((x.1:ℕ)*(x.2:ℕ))
  have hsum : Summable F := by
    have h : Summable (fun x : ℕ+×ℕ+ => ‖r‖^((x.1:ℕ)*(x.2:ℕ))) := by
      simpa using (summable_prod_mul_pow 0 (r:=‖r‖) (by simpa using hr))
    apply h.of_norm_bounded
    intro x
    exact (norm_mul _ _).trans_le (by rw [norm_pow]; exact mul_le_of_le_one_left (by positivity) (norm_weight d _))
  change (∑' a : ℕ+, ∑' b : ℕ+, F (a,b)) = _
  have hS : Summable (fun x => F (sigmaAntidiagonalEquivProd x)) := sigmaAntidiagonalEquivProd.summable_iff.mpr hsum
  rw [← hsum.tsum_prod, ←sigmaAntidiagonalEquivProd.tsum_eq F, hS.tsum_sigma,
    ←tsum_pnat_eq_tsum_of_eq_zero (f:=fun m : ℕ => (idealCoeff d m:ℂ)*r^m) (by simp [idealCoeff])]
  apply tsum_congr
  intro n
  rw [tsum_fintype]
  simp only [sigmaAntidiagonalEquivProd,F,Equiv.coe_fn_mk,divisorsAntidiagonalFactors,PNat.mk_coe,
    Nat.mem_divisorsAntidiagonal,Finset.univ_eq_attach,idealCoeff,Int.cast_sum,Finset.sum_mul]
  rw [Finset.sum_attach _ (fun p : ℕ×ℕ => (negWeight d p.2:ℂ)*r^(p.1*p.2)),
    Nat.sum_divisorsAntidiagonal' (fun x y => (negWeight d y:ℂ)*r^(x*y))]
  apply Finset.sum_congr rfl
  intro i hi
  rw [Nat.div_mul_cancel (Nat.dvd_of_mem_divisors hi)]

def multiple (a : ℕ+) (z : ℍ) : ℍ :=
  ⟨(a.val:ℂ)*(z:ℂ), by simpa [Complex.mul_im] using z.im_pos⟩

lemma sum_positive_rows {d : ℕ} (hd : d%4=1) (hs : Squarefree d) (z : ℍ) :
    haveI : NeZero (4*(2*d)) := ⟨by omega⟩
    (∑' a : ℕ+, row (negCharacter d (by omega)) (multiple a z)) =
      (-2*Real.pi*Complex.I*gaussSum (negCharacter d (by omega)) ZMod.stdAddChar) * theta d z := by
  letI : NeZero (4*(2*d)) := ⟨by omega⟩
  have hnt : negCharacter d (by omega)≠1 := by
    intro hz
    have he := negCharacter_odd hd
    rw [DirichletCharacter.Odd,hz,MulChar.one_apply (by simp)] at he
    norm_num at he
  have he (a : ℕ+) := row_qExpansion (TunnellRankinEisenstein.negative_primitive hd hs)
    (TunnellRankinEisenstein.negative_quadratic (by omega)) hnt (multiple a z)
  simp only [he,tsum_mul_left,negCharacter_nat]
  congr 1
  rw [theta,show Function.Periodic.qParam 1 z=q (z:ℂ) by simp [q,Function.Periodic.qParam],
    ←lambert d (show ‖q z‖<1 from norm_exp_two_pi_I_lt_one _)]
  apply tsum_congr
  intro a
  rw [←tsum_pnat_eq_tsum_of_eq_zero (f:=fun b : ℕ => (negWeight d b:ℂ)*q (multiple a z)^b) (by simp [negWeight])]
  apply tsum_congr
  intro b
  congr 1
  change (exp (_*((a.val:ℂ)*(z:ℂ))))^b.val = (exp (_*(z:ℂ)))^(a.val*b.val)
  simp only [← Complex.exp_nat_mul,Nat.cast_mul]
  congr 1
  ring

end
end TunnellRankinCotangent
#print axioms TunnellRankinCotangent.sum_positive_rows
