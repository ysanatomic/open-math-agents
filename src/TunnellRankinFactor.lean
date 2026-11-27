import TunnellRankinGlobal

/-! Factorization of the central Rankin convolution in the half-plane of absolute convergence. -/

namespace TunnellRankin
open TunnellCMLSeries

noncomputable def quadraticCoeff (d m : ℕ) : ℂ := negWeight d m

lemma summable_quadratic (d : ℕ) {s : ℝ} (hs : 1<s) : Summable (dir (quadraticCoeff d) s) := by
  apply Summable.of_norm
  apply (Real.summable_nat_rpow_inv.mpr hs).of_nonneg_of_le (fun _ => norm_nonneg _)
  intro m
  by_cases hm : m=0
  · subst m
    simp [dir,quadraticCoeff,negWeight,Real.zero_rpow (by linarith : s≠0)]
  · rw [dir,norm_div,Complex.norm_natCast_cpow_of_pos (Nat.pos_of_ne_zero hm),Complex.ofReal_re]
    rw [←one_div]
    exact div_le_div_of_nonneg_right (norm_weight d m) (Real.rpow_nonneg (Nat.cast_nonneg _) _)

lemma quadratic_factor (d : ℕ) (s : ℝ) (hs : 5/2<s) (p : Nat.Primes) :
    localSum (quadraticCoeff d) (2*s-1) p *
      (1-(p.val:ℂ)*(negWeight d p.val:ℂ)*((p.val:ℂ)^(-(s:ℂ)))^2)=1 := by
  let u : ℂ := negWeight d p.val
  let q : ℂ := (p.val:ℂ)^(-((2*s-1:ℝ):ℂ))
  have he : q=(p.val:ℂ)*((p.val:ℂ)^(-(s:ℂ)))^2 := by
    dsimp [q]
    rw [show -((2*s-1:ℝ):ℂ)=1+(2:ℕ)*(-(s:ℂ)) by push_cast; ring,
      Complex.cpow_add _ _ (Nat.cast_ne_zero.mpr p.property.ne_zero),Complex.cpow_one,Complex.cpow_nat_mul]
  have hq : ‖q‖<1 := by
    dsimp only [q]
    rw [Complex.norm_natCast_cpow_of_pos p.property.pos,Complex.neg_re,Complex.ofReal_re]
    exact Real.rpow_lt_one_of_one_lt_of_neg (by exact_mod_cast p.property.one_lt) (by linarith)
  have hnorm : ‖u*q‖<1 := by
    rw [norm_mul]
    exact (mul_le_of_le_one_left (norm_nonneg _) (norm_weight d p.val)).trans_lt hq
  have hseries := local_hasSum (summable_quadratic d (s:=2*s-1) (by linarith)) p
  have hloc : localSum (quadraticCoeff d) (2*s-1) p=(1-u*q)⁻¹ := by
    apply hseries.unique
    apply (hasSum_geometric_of_norm_lt_one hnorm).congr_fun
    intro k
    simp only [quadraticCoeff,negWeight_pow,Int.cast_pow,mul_pow,u,q]
  rw [hloc,show (p.val:ℂ)*(negWeight d p.val:ℂ)*((p.val:ℂ)^(-(s:ℂ)))^2=u*q by rw [he]; ring]
  apply inv_mul_cancel₀
  intro h
  rw [←sub_eq_zero.mp h,norm_one] at hnorm
  exact (lt_irrefl _ hnorm)

theorem rankin_factorization (d : ℕ) (s : ℝ) (hs : 5/2<s) :
    latticeValue 1 s*latticeValue (2*d) s =
      (∑' m : ℕ, (negWeight d m:ℂ)/(m:ℂ)^((2*s-1:ℝ):ℂ))*
      ∑' m : ℕ, gaussCoeff 1 m*(idealCoeff d m:ℂ)/(m:ℂ)^(s:ℂ) := by
  have hbase (n : ℕ) : HasProd (localSum (twistA n) s) (latticeValue n s) := by
    have ha : HasSum (dir (twistA n) s) (latticeValue n s) := shell_expansion n s (by linarith)
    rw [←ha.tsum_eq]
    exact euler (by linarith) (twistA_one n) (twistA_mul n) ha.summable
  have hL := euler (f:=quadraticCoeff d) (s:=2*s-1) (by linarith) (by simp [quadraticCoeff,negWeight_one])
    (fun {a b} _ => by simp [quadraticCoeff,negWeight_mul]) (summable_quadratic d (by linarith))
  have hR := euler (f:=rankinA d) (s:=s) (by linarith) (by simp [rankinA,idealCoeff_one,twistA_one])
    (fun {a b} h => by simp only [rankinA,idealCoeff_mul d h,twistA_mul 1 h,Int.cast_mul]; ring)
    (summable_rankin d s hs)
  apply ((hbase 1).mul (hbase (2*d))).unique
  apply (hL.mul hR).congr_fun
  intro p
  change _ = localSum (quadraticCoeff d) (2*s-1) p * localSum (rankinA d) s p
  rw [local_rankin d s hs p,←mul_assoc,←mul_assoc,quadratic_factor d s hs p,one_mul]

end TunnellRankin
#print axioms TunnellRankin.rankin_factorization
