import TunnellRankinContinue

/-! Discrete Fourier transformation of the horizontal rows of the central Eisenstein series. -/
namespace TunnellRankinCotangent
open Complex Finset TunnellRankin UpperHalfPlane
open scoped Real
noncomputable section

def q (z : ℂ) := Complex.exp (2*Real.pi*Complex.I*z)

def row {N : ℕ} [NeZero N] (χ : ZMod N→ℂ) (z : ℂ) :=
  ∑ r : ZMod N,χ r*((Real.pi:ℂ)*Complex.cot (Real.pi*(z+(r.val:ℂ)/N)))

lemma exp_mul_char {N : ℕ} [NeZero N] (r : ZMod N) (k : ℕ) (z : ℂ) :
    (q (z+(r.val:ℂ)/N))^k = ZMod.stdAddChar (r*(k:ZMod N))*(q z)^k := by
  rw [show r*(k:ZMod N)=(((r.val:ℤ)*(k:ℤ):ℤ):ZMod N) by push_cast; simp,ZMod.stdAddChar_coe]
  simp only [q,←Complex.exp_nat_mul,Int.cast_mul,Int.cast_natCast,←Complex.exp_add]
  congr 1
  ring

lemma finite_dft {N : ℕ} [NeZero N] {χ : DirichletCharacter ℂ N}
    (hχ : χ.IsPrimitive) (hq : χ.IsQuadratic) (k : ℕ) :
    ∑ r : ZMod N,χ r*ZMod.stdAddChar (r*(k:ZMod N))=χ k*gaussSum χ ZMod.stdAddChar := by
  simpa only [ZMod.dft_apply,mul_neg,neg_neg,smul_eq_mul,hq.inv,mul_comm] using
    hχ.fourierTransform_eq_inv_mul_gaussSum (-(k:ZMod N))

lemma row_qExpansion {N : ℕ} [NeZero N] {χ : DirichletCharacter ℂ N} (hχ : χ.IsPrimitive)
    (hq : χ.IsQuadratic) (hnt : χ≠1) (z : ℍ) :
    row χ z = (-2*Real.pi*Complex.I*gaussSum χ ZMod.stdAddChar) * ∑' k : ℕ,χ k*(q z)^k := by
  classical
  let e (r : ZMod N) : ℍ := ⟨(z:ℂ)+(r.val:ℂ)/N,by
    change 0 < ((z:ℂ) + ((r.val:ℕ):ℂ)/(N:ℂ)).im
    simp only [Complex.add_im,Complex.div_im,Complex.natCast_im,mul_zero,zero_mul,sub_zero,zero_div,add_zero]
    exact z.im_pos⟩
  have es (r : ZMod N) : ‖q (e r)‖<1 := norm_exp_two_pi_I_lt_one _
  have eg (r : ZMod N) := (hasSum_geometric_of_norm_lt_one (es r)).summable
  have hgeom (r : ZMod N) : Summable (fun k : ℕ => χ r*(q (e r))^k) := (eg r).mul_left _
  have he (r : ZMod N) : (Real.pi:ℂ)*Complex.cot (Real.pi*(e r:ℂ)) =
      Real.pi*Complex.I-2*Real.pi*Complex.I*∑' k : ℕ,(q (e r))^k := pi_mul_cot_pi_q_exp _
  change ∑ r, χ r*((Real.pi:ℂ)*Complex.cot (Real.pi*(e r:ℂ))) = _
  simp only [he,mul_sub,sum_sub_distrib,←sum_mul,χ.sum_eq_zero_of_ne_one hnt,zero_mul,zero_sub]
  have e1 (r : ZMod N) : χ r*(2*Real.pi*Complex.I*∑' k : ℕ,q (e r)^k) =
      (2*Real.pi*Complex.I)*∑' k : ℕ,χ r*q (e r)^k := by rw [tsum_mul_left]; ring
  simp only [e1,←mul_sum]
  rw [←Summable.tsum_finsetSum (fun r _ => hgeom r)]
  have hk (k : ℕ) : ∑ r,χ r*q (e r)^k=gaussSum χ ZMod.stdAddChar*(χ (k:ZMod N)*(q z)^k) := by
    simp only [e,exp_mul_char,←mul_assoc,←sum_mul,finite_dft hχ hq]
    ring
  simp only [hk,tsum_mul_left]
  ring

end
end TunnellRankinCotangent
#print axioms TunnellRankinCotangent.row_qExpansion
