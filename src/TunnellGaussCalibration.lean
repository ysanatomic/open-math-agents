import TunnellRankinCalibration
import TunnellSignedFinite

/-! The sign of the base real quadratic Gauss sum. -/
namespace TunnellGaussCalibration
open TunnellRootPolynomial TunnellFiniteSymbols TunnellTwistCharacter Polynomial Finset
noncomputable section

private lemma chi : chiPoly 1 (by decide)= X^2-X^6-X^10+X^14 := by
  change (∑ i : Fin 8, C (weight 2 i.val)*X^(2*i.val))=_
  rw [Fin.sum_univ_eight]
  norm_num [weight,Nat.odd_iff]
  ring

lemma epsilon_one : epsilon 1 (by decide)=1 := by
  rw [epsilon,if_pos]
  rw [modByMonic_eq_zero_iff_dvd (cyclotomic.monic _ _),chi]
  have h : cyclotomic 16 ℤ = X^8+1 := by
    simpa [sum_range_succ,add_comm] using cyclotomic_prime_pow_eq_geom_sum (R:=ℤ) (n:=3) Nat.prime_two
  change cyclotomic 16 ℤ ∣ _
  rw [h]
  refine ⟨(1)*X^2 + (-1)*X^6 + (-2)*X^10 + (2)*X^14 + (2)*X^18 + (-2)*X^22 + (-1)*X^24 + (-2)*X^26 + (2)*X^30 + (1)*X^32 + (3)*X^34 + (2)*X^36 + (-1)*X^38 + (-1)*X^40 + (-3)*X^42 + (-2)*X^44 + (-1)*X^46 + (-1)*X^48 + (1)*X^50 + (2)*X^52 + (1)*X^54 + (1)*X^56 + (-1)*X^64,?_⟩
  norm_num [rootPoly,chordPoly,prod_range_succ]
  ring

end
end TunnellGaussCalibration
#print axioms TunnellGaussCalibration.epsilon_one
