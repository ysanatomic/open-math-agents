import TunnellEisensteinPrimitiveRows

/-! The modular transformation of the actual regularized Eisenstein family. -/
namespace TunnellRankinEisenstein
open Complex TunnellCMRegularized Matrix MatrixGroups CongruenceSubgroup ModularGroup Set Filter
open UpperHalfPlane hiding I
open scoped ComplexConjugate Topology
noncomputable section

def rowMove (L a b c e : ℤ) (h : a*e-L*b*c=1) : (ℤ×ℤ) ≃ (ℤ×ℤ) where
  toFun p := (a*p.1+c*p.2,L*b*p.1+e*p.2)
  invFun p := (e*p.1-c*p.2,-L*b*p.1+a*p.2)
  left_inv p := by ext <;> dsimp <;> first | linear_combination p.1*h | linear_combination p.2*h
  right_inv p := by ext <;> dsimp <;> first | linear_combination p.1*h | linear_combination p.2*h

lemma height_kernel {y : ℝ} (hy : 0<y) {j : ℂ} (hj : j≠0) (s : ℂ) :
    ((y/‖j‖^2:ℝ):ℂ)^(s-1) = (y:ℂ)^(s-1)*(j*kernel s (conj j)) := by
  have hu := norm_pos_iff.mpr hj
  have hn : (‖j‖:ℂ)≠0 := ofReal_ne_zero.mpr hu.ne'
  rw [Complex.ofReal_div,Complex.div_cpow_ofReal_nonneg hy.le (sq_nonneg _) (s-1),
    kernel,Complex.norm_conj,←mul_assoc j,Complex.mul_conj,Complex.normSq_eq_norm_sq,Complex.ofReal_pow]
  have h : ((‖j‖:ℂ)^2)^(s-1) = exp (((Real.log ‖j‖:ℝ):ℂ)*(2*(s-1))) := by
    rw [←Complex.ofReal_pow,Complex.cpow_def_of_ne_zero (by exact_mod_cast (pow_ne_zero 2 hu.ne')),
      ←Complex.ofReal_log (sq_nonneg _),Real.log_pow]
    push_cast
    congr 1
    ring
  rw [h,div_eq_mul_inv,←Complex.exp_neg]
  congr 1
  nth_rw 2 [←Real.exp_log hu]
  rw [Complex.ofReal_exp,←Complex.exp_nat_mul,←Complex.exp_add]
  congr 1
  ring

lemma scalar_reindex {α : Type*} (r : α ≃ α) (f g : α→ℂ) (a : ℂ)
    (h : ∀ x, a*f x=g (r x)) : a*(∑' x,f x)=∑' x,g x := by
  rw [← tsum_mul_left]
  exact (tsum_congr h).trans (r.tsum_eq g)

lemma scalar_action (u v J D K A B : ℂ) (h₁ : v=u*(J*K)) (h₂ : (D*K)*B=A) :
    D*(v*B) = J*(u*A) := by rw [h₁,←h₂]; ring

end
end TunnellRankinEisenstein
#print axioms TunnellRankinEisenstein.height_kernel
