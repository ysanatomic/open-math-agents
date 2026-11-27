import Mathlib.RingTheory.PowerSeries.Derivative
import Mathlib.Data.Nat.Choose.Central
import Mathlib.Tactic

/-! # Integral coefficients of the lemniscatic differential -/

namespace TunnellLemniscaticCoefficients
open PowerSeries
variable {O:Type*} [CommRing O] [IsDomain O] [CharZero O]

private lemma euler_coefficient (D:O⟦X⟧) (j:ℕ) :
    coeff j (X*derivative O D) = (j:O)*coeff j D := by
  cases j with
  | zero => simp
  | succ j => rw [coeff_succ_X_mul,coeff_derivative,Nat.cast_succ,mul_comm]

/-- The coefficients of `dt/√(1+4 n²t⁴)` in all degrees divisible by four. -/
theorem quartic_coefficient (D:O⟦X⟧) (n:O) (hconst : constantCoeff D=1)
    (h : D^2*(1+C (4*n^2)*X^4)=1) (m:ℕ) :
    coeff (4*m) D = (m.centralBinom:O)*(-n^2)^m := by
  have hD : D≠0 := fun hh => by simp [hh] at hconst
  let Z : O⟦X⟧ := X*derivative O D
  have hdiff := congrArg (derivative O) h
  simp only [Derivation.leibniz, Derivation.leibniz_pow, map_add, derivative_C,
    derivative_one, derivative_X, smul_eq_mul, nsmul_eq_mul, zero_add, mul_zero,
    add_zero, mul_one, Nat.reduceSub, pow_one, Nat.cast_ofNat] at hdiff
  have he : Z + C (4*n^2)*(X^4*Z)+C (8*n^2)*(X^4*D)=0 := by
    apply (mul_eq_zero.mp (show (2*D)*(Z+C (4*n^2)*(X^4*Z)+C (8*n^2)*(X^4*D))=0 by
      dsimp [Z]
      simp only [map_mul,map_ofNat,map_pow] at hdiff ⊢
      linear_combination (X:O⟦X⟧)*hdiff)).resolve_left (mul_ne_zero (show (2:O⟦X⟧) ≠ 0 from fun he => by
        have he' := congrArg (constantCoeff (R:=O)) he
        simpa [map_ofNat] using he') hD)
  have hec (j:ℕ) := congrArg (coeff (R:=O) (4*j+4)) he
  simp only [map_add,coeff_C_mul,coeff_X_pow_mul,map_zero] at hec
  have hz (j:ℕ) : coeff j Z=(j:O)*coeff j D := euler_coefficient D j
  induction m with
  | zero => simpa [coeff_zero_eq_constantCoeff] using hconst
  | succ m ih =>
    have hnext := hec m
    rw [hz,hz,ih] at hnext
    rw [show 4*m+4=4*(m+1) by omega] at hnext
    have hbin : ((m:O)+1)*((m+1).centralBinom:O) =
        2*(2*(m:O)+1)*(m.centralBinom:O) := by
      exact_mod_cast Nat.succ_mul_centralBinom_succ m
    have hc : (4*((m:O)+1))≠0 :=
      mul_ne_zero (by norm_num) (by exact_mod_cast Nat.succ_ne_zero m)
    apply mul_left_cancel₀ hc
    rw [pow_succ]
    push_cast at hnext
    linear_combination hnext + 4*n^2*(-n^2)^m*hbin

#print axioms quartic_coefficient
end TunnellLemniscaticCoefficients
