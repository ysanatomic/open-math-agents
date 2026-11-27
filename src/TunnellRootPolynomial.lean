import Mathlib

/-! A distinguished polynomial representative of the positive square root of 8d in a cyclotomic field. -/

namespace TunnellRootPolynomial
open Finset Polynomial Complex
open scoped Real

noncomputable def root (d : ℕ) := exp (2*(Real.pi:ℂ)*I/(16*d))
noncomputable def angle (d j : ℕ) := Real.pi * j/(8*d)
noncomputable def chord (d j : ℕ) := 2*Real.sin (angle d j)

noncomputable def chordPoly (d j : ℕ) : ℤ[X] := (X^(16*d-j)-X^j)*X^(4*d)
noncomputable def rootPoly (d : ℕ) : ℤ[X] := chordPoly d (2*d) * ∏ j ∈ range (4*d-1), chordPoly d (j+1)

lemma primitive {d : ℕ} (hd : 0<d) : IsPrimitiveRoot (root d) (16*d) := by
  simpa [root] using Complex.isPrimitiveRoot_exp (16*d) (by omega)

lemma root_pow (d j : ℕ) : root d ^ j = exp ((angle d j:ℝ)*I) := by
  rw [root,←exp_nat_mul]; congr 1; unfold angle; push_cast; ring

lemma angle_half {d : ℕ} (hd : 0<d) : angle d (4*d) = Real.pi/2 := by
  simp only [angle,Nat.cast_mul,Nat.cast_ofNat]; field_simp; ring

lemma angle_quarter {d : ℕ} (hd : 0<d) : angle d (2*d) = Real.pi/4 := by
  simp only [angle,Nat.cast_mul,Nat.cast_ofNat]; field_simp; ring

lemma eval_chord {d : ℕ} (hd : 0<d) {j : ℕ} (hj : j≤16*d) :
    aeval (root d) (chordPoly d j) = (chord d j:ℂ) := by
  have hr : root d≠0 := exp_ne_zero _
  have hinv : root d ^ (16*d-j) = (root d^j)⁻¹ := by
    rw [←one_div]
    apply (eq_div_iff (pow_ne_zero j hr)).mpr
    rw [←pow_add,Nat.sub_add_cancel hj,(primitive hd).pow_eq_one]
  have hi : root d^(4*d)=I := by
    rw [root_pow,angle_half hd,ofReal_div,ofReal_ofNat,exp_pi_div_two_mul_I]
  rw [chordPoly,map_mul,map_sub,map_pow,map_pow,map_pow,aeval_X,hinv,hi,root_pow,←exp_neg]
  unfold chord
  push_cast
  rw [two_sin,neg_mul]

lemma chord_pos {d j : ℕ} (hj : 0<j) (hjd : j<8*d) : 0<chord d j := by
  have hd : 0<d := by omega
  apply mul_pos (by norm_num) (Real.sin_pos_of_pos_of_lt_pi (by dsimp [angle]; positivity) _)
  dsimp [angle]
  apply (div_lt_iff₀ (by positivity : (0:ℝ)<8*d)).mpr
  apply mul_lt_mul_of_pos_left _ Real.pi_pos
  exact_mod_cast hjd

lemma chord_reflect {d j : ℕ} (hd : 0<d) (hj : j≤8*d) : chord d (8*d-j)=chord d j := by
  have h : angle d (8*d-j) = Real.pi-angle d j := by
    simp only [angle,Nat.cast_sub hj,Nat.cast_mul,Nat.cast_ofNat]
    field_simp
  rw [chord,h,Real.sin_pi_sub,chord]

lemma norm_factor {d j : ℕ} (hj : 0<j) (hjd : j<8*d) :
    ‖1-(root d^2)^j‖ = chord d j := by
  rw [norm_sub_rev,←pow_mul,root_pow]
  rw [mul_comm _ I, norm_exp_I_mul_ofReal_sub_one]
  have hr : angle d (2*j)/2=angle d j := by unfold angle; push_cast; ring
  rw [hr,Real.norm_eq_abs]
  exact abs_of_nonneg (chord_pos hj hjd).le

private lemma reflect_product (f : ℕ→ℝ) (m : ℕ) (hs : ∀ j < m, f (m+(j+1))= f (m-1-j)) :
    ∏ j ∈ range (2*m+1), f j = (∏ j ∈ range m, f j)^2*f m := by
  rw [show 2*m+1=m+(m+1) by omega,prod_range_add,prod_range_succ']
  have he : (∏ j ∈ range m, f (m+(j+1))) = ∏ j ∈ range m,f j :=
    (prod_congr rfl (fun j hj => hs j (mem_range.mp hj))).trans (prod_range_reflect f m)
  rw [he]; ring

lemma real_product {d : ℕ} (hd : 0<d) :
    2*(∏ j ∈ range (4*d-1),chord d (j+1))^2 = 8*(d:ℝ) := by
  let m := 4*d-1
  have hm : 4*d=m+1 := by dsimp [m]; omega
  have hn : 8*d=(2*m+1)+1 := by omega
  have hp : IsPrimitiveRoot (root d^2) (8*d) := by
    exact (primitive hd).pow (by omega) (show 16*d = 2*(8*d) by omega)
  rw [hn] at hp
  have prodEq := congrArg norm hp.prod_one_sub_pow_eq_order
  simp only [norm_prod] at prodEq
  have hf : (∏ k ∈ range (2*m+1), ‖1-(root d^2)^(k+1)‖) = ∏ k∈range (2*m+1),chord d (k+1) :=
    prod_congr rfl (fun k hk => norm_factor (Nat.succ_pos _) (by have := mem_range.mp hk; omega))
  rw [hf,reflect_product (fun k => chord d (k+1)) m] at prodEq
  · rw [←hm,chord,angle_half hd,Real.sin_pi_div_two,mul_one] at prodEq
    have hnorm : ‖(((2*m+1:ℕ):ℂ)+1)‖=8*(d:ℝ) := by
      rw [show (((2*m+1:ℕ):ℂ)+1)=((8*d:ℕ):ℂ) by rw [hn]; push_cast; ring]
      simp
    change 2*_=8*(d:ℝ)
    rw [←hnorm,←prodEq]
    ring
  · intro k hk
    have h : m+(k+1)+1=8*d-(m-1-k+1) := by omega
    rw [h,chord_reflect hd (by omega)]

theorem eval_rootPoly {d : ℕ} (hd : 0<d) :
    aeval (root d) (rootPoly d) = (Real.sqrt (8*d):ℂ) := by
  have he : (∏ k∈range (4*d-1),aeval (root d) (chordPoly d (k+1))) =
      ((∏ k∈range (4*d-1),chord d (k+1):ℝ):ℂ) := by
    rw [ofReal_prod]
    exact prod_congr rfl (fun k hk => eval_chord hd (by have := mem_range.mp hk; omega))
  rw [rootPoly,map_mul,map_prod,he,eval_chord hd (by omega),chord,angle_quarter hd,Real.sin_pi_div_four]
  norm_num only [mul_div_cancel₀ _ (by norm_num : (2:ℝ)≠0)]
  rw [←ofReal_mul,ofReal_inj]
  have hprod : 0≤∏ j∈range (4*d-1),chord d (j+1) := prod_nonneg (fun k hk => (chord_pos (by omega) (by have := mem_range.mp hk; omega)).le)
  have hh := real_product hd
  have hsq := Real.sq_sqrt (show 0≤8*(d:ℝ) by positivity)
  have h2 := Real.sq_sqrt (by norm_num : (0:ℝ)≤2)
  apply (sq_eq_sq₀ (by positivity) (Real.sqrt_nonneg _)).mp
  rw [mul_pow,h2,hsq,hh]

end TunnellRootPolynomial
#print axioms TunnellRootPolynomial.eval_rootPoly
