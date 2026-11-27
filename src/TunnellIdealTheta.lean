import Mathlib

/-! Fricke transformation of a binary quadratic ideal theta series, via the Jacobi theta function. -/

namespace TunnellIdealTheta
open Complex Finset Real
open scoped Classical
noncomputable section

def shift (u z : ℂ) : ℂ := Complex.exp (π*I*u^2*z)*jacobiTheta₂ (u*z) z

lemma shift_hasSum (u z : ℂ) (hz : 0 < z.im) :
    HasSum (fun k : ℤ => Complex.exp (π*I*((k:ℂ)+u)^2*z)) (shift u z) := by
  apply ((hasSum_jacobiTheta₂_term (u*z) hz).mul_left _).congr_fun
  intro k
  rw [jacobiTheta₂_term,←Complex.exp_add]
  congr 1
  ring

lemma shift_neg (u z : ℂ) : shift (-u) z=shift u z := by
  simp [shift,jacobiTheta₂_neg_left,neg_mul]

lemma shift_invert (u z : ℂ) (hz : z≠0) :
    shift u (-1/z) = (-I*z)^(1/2:ℂ)*jacobiTheta₂ u z := by
  rw [shift,jacobiTheta₂_functional_equation u z]
  rw [show u*(-1/z)= -(u/z) by ring,jacobiTheta₂_neg_left]
  rw [show (π:ℂ)*I*u^2*(-1/z)= -π*I*u^2/z by ring]
  have h : (-I*z)^(1/2:ℂ)≠0 := Complex.cpow_ne_zero_iff.mpr (Or.inl (mul_ne_zero (by simp) hz))
  field_simp

lemma half_scale {r : ℝ} (hr : 0<r) {w : ℂ} (hw : w≠0) :
    ((r:ℂ)*w)^(1/2:ℂ) = (√r:ℂ)*w^(1/2:ℂ) := by
  have hc : (r:ℂ)≠0 := by exact_mod_cast hr.ne'
  rw [Complex.cpow_def_of_ne_zero (mul_ne_zero hc hw),Complex.log_ofReal_mul hr hw,add_mul,Complex.exp_add,
    ←Complex.cpow_def_of_ne_zero hw,Complex.ofReal_log hr.le,←Complex.cpow_def_of_ne_zero hc]
  congr 1
  rw [Real.sqrt_eq_rpow,Complex.ofReal_cpow hr.le]
  norm_num

def theta (n a : ℕ) [NeZero a] (b : ℤ) (z : ℂ) : ℂ :=
  ∑ r : ZMod a, shift ((b:ℂ)*r.val/a) (2*a*z)*shift ((r.val:ℂ)/a) (2*n*a*z)

def term (n a : ℕ) (z : ℂ) (uv : ℤ×ℤ) : ℂ :=
  Complex.exp (2*π*I*z*((n:ℂ)*(uv.1:ℂ)^2+(uv.2:ℂ)^2)/a)

def admitted (a : ℕ) (b : ℤ) (uv : ℤ×ℤ) : Prop :=
  (uv.2:ZMod a)=(b:ZMod a)*(uv.1:ZMod a)

private lemma product_sum {f g : ℤ→ℂ} {A B : ℂ} (hf : HasSum f A) (hg : HasSum g B) :
    HasSum (fun v : ℤ×ℤ => f v.1*g v.2) (A*B) :=
  hf.mul hg (summable_mul_of_summable_norm hf.summable.norm hg.summable.norm)

private lemma half_factors {z : ℂ} (hz : z≠0) (n a : ℕ) [NeZero n] [NeZero a] :
    (-I*(2*n*z/a))^(1/2:ℂ)*(-I*(2*z/a))^(1/2:ℂ)= 2*(√n:ℂ)*(-I*z)/a := by
  have ha : (0:ℝ)<a := Nat.cast_pos.mpr (NeZero.pos a)
  have hn : (0:ℝ)<n := Nat.cast_pos.mpr (NeZero.pos n)
  have he (r : ℝ) (hr : 0<r) : (-I*((r:ℂ)*z))^(1/2:ℂ) = (√r:ℂ)*(-I*z)^(1/2:ℂ) := by
    rw [show -I*((r:ℂ)*z)=(r:ℂ)*(-I*z) by ring,half_scale hr (mul_ne_zero (by simp) hz)]
  rw [show (2:ℂ)*n*z/a= ((2*(n:ℝ)/a:ℝ):ℂ)*z by push_cast; ring,
    show (2:ℂ)*z/a= ((2/(a:ℝ):ℝ):ℂ)*z by push_cast; ring,he _ (by positivity),he _ (by positivity)]
  have hpow : ((-I*z)^(1/2:ℂ))^2 = -I*z := by rw [←Complex.cpow_mul_ofNat]; norm_num
  have hroot : √(2*(n:ℝ)/a)*√(2/(a:ℝ))=2*√n/a := by
    rw [←Real.sqrt_mul (by positivity),show 2*(n:ℝ)/a*(2/a)=(2/a)^2*n by ring,
      Real.sqrt_mul (sq_nonneg _),Real.sqrt_sq (by positivity)]
    ring
  calc
    _ = (((√(2*(n:ℝ)/a)*√(2/(a:ℝ)):ℝ):ℂ))*((-I*z)^(1/2:ℂ))^2 := by push_cast; ring
    _ = _ := by rw [hpow,hroot]; push_cast; ring

lemma theta_invert_packet (n a : ℕ) [NeZero n] [NeZero a] (b : ℤ) {z : ℂ} (hz : z≠0) :
    theta n a b (-1/(4*n*z)) = 2*(√n:ℂ)*(-I*z)/a *
      ∑ r : ZMod a, jacobiTheta₂ ((b:ℂ)*r.val/a) (2*n*z/a) *
        jacobiTheta₂ (-(r.val:ℂ)/a) (2*z/a) := by
  have ha : (a:ℂ)≠0 := by exact_mod_cast NeZero.ne a
  have hn : (n:ℂ)≠0 := by exact_mod_cast NeZero.ne n
  unfold theta
  rw [mul_sum]
  apply sum_congr rfl
  intro r _
  rw [show 2*(a:ℂ)*(-1/(4*n*z))= -1/(2*n*z/a) by field_simp; norm_num,
    show 2*(n:ℂ)*a*(-1/(4*n*z))= -1/(2*z/a) by field_simp; norm_num,
    shift_invert _ _ (div_ne_zero (mul_ne_zero (mul_ne_zero (by norm_num) hn) hz) ha),
    shift_invert _ _ (div_ne_zero (mul_ne_zero (by norm_num) hz) ha),
    neg_div,jacobiTheta₂_neg_left,←half_factors hz n a]
  ring

private lemma refine_residue {a : ℕ} [NeZero a] (r u : ℤ)
    (h : (u:ZMod a)=(r:ZMod a)) : ∃ k:ℤ, (a:ℤ)*k+r=u := by
  obtain ⟨k,hk⟩ := (ZMod.intCast_eq_intCast_iff_dvd_sub r u a).mp h.symm
  exact ⟨k,by omega⟩

theorem theta_hasSum (n a : ℕ) [NeZero n] [NeZero a] (b : ℤ) {z : ℂ} (hz : 0 < z.im) :
    HasSum (fun uv : ℤ×ℤ => if admitted a b uv then term n a z uv else 0) (theta n a b z) := by
  classical
  have ha : (a:ℂ)≠0 := by exact_mod_cast NeZero.ne a
  have hap : (0:ℝ)<a := Nat.cast_pos.mpr (NeZero.pos a)
  have hnp : (0:ℝ)<n := Nat.cast_pos.mpr (NeZero.pos n)
  let cls (r : ZMod a) (uv : ℤ×ℤ) := if (uv.1:ZMod a)=r ∧ (uv.2:ZMod a)=(b:ZMod a)*r then term n a z uv else 0
  have hsum (r : ZMod a) : HasSum (cls r) (shift ((b:ℂ)*r.val/a) (2*a*z)*shift ((r.val:ℂ)/a) (2*n*a*z)) := by
    let e (v : ℤ×ℤ) : ℤ×ℤ := (a*v.2+r.val,a*v.1+b*r.val)
    have hi : Function.Injective e := by
      rintro ⟨x,y⟩ ⟨x',y'⟩ h
      have h1 := congrArg Prod.fst h
      have h2 := congrArg Prod.snd h
      dsimp only [e] at h1 h2
      have hac : (a:ℤ)≠0 := by exact_mod_cast NeZero.ne a
      exact Prod.ext (mul_left_cancel₀ hac (add_right_cancel h2)) (mul_left_cancel₀ hac (add_right_cancel h1))
    apply (hi.hasSum_iff ?_).mp
    · have H := product_sum (shift_hasSum ((b:ℂ)*r.val/a) (2*a*z)
          (by simpa [Complex.mul_im] using (show (0:ℝ)<2*a*z.im by positivity)))
        (shift_hasSum ((r.val:ℂ)/a) (2*n*a*z)
          (by simpa [Complex.mul_im] using (show (0:ℝ)<2*n*a*z.im by positivity)))
      apply H.congr_fun
      rintro ⟨x,y⟩
      simp only [Function.comp_apply,e,cls,Int.cast_add,Int.cast_mul,Int.cast_natCast,
        ZMod.natCast_self,zero_mul,zero_add,ZMod.natCast_zmod_val,and_self,ite_true]
      simp only [term,Int.cast_add,Int.cast_mul,Int.cast_natCast,←Complex.exp_add]
      congr 1
      field_simp
      ring
    · rintro ⟨u,v⟩ h
      unfold cls
      split_ifs with hc
      · exfalso; apply h
        obtain ⟨y,hy⟩ := refine_residue (a:=a) r.val u (by simpa using hc.1)
        obtain ⟨x,hx⟩ := refine_residue (a:=a) (b*r.val) v (by simpa using hc.2)
        exact ⟨(x,y),Prod.ext hy hx⟩
      · rfl
  apply (hasSum_sum (s:=univ) (fun r _ => hsum r)).congr_fun
  rintro ⟨u,v⟩
  dsimp only [cls,admitted]
  rw [sum_eq_single (u:ZMod a)]
  · by_cases h : (v:ZMod a)=(b:ZMod a)*(u:ZMod a) <;> simp [h]
  · intro s _ h; simp [Ne.symm h]
  · simp

private lemma dual_hsum (n a : ℕ) [NeZero n] [NeZero a] (b : ℤ) {z : ℂ} (hz : 0 < z.im)
    (r : ZMod a) :
    HasSum (fun uv : ℤ×ℤ => ZMod.stdAddChar (r*((b:ZMod a)*(uv.1:ZMod a)-(uv.2:ZMod a)))*term n a z uv)
      (jacobiTheta₂ ((b:ℂ)*r.val/a) (2*n*z/a) * jacobiTheta₂ (-(r.val:ℂ)/a) (2*z/a)) := by
  have hap : (0:ℝ)<a := Nat.cast_pos.mpr (NeZero.pos a)
  have hnp : (0:ℝ)<n := Nat.cast_pos.mpr (NeZero.pos n)
  have hA : 0 < (2*(n:ℂ)*z/a).im := by
    simp [div_eq_mul_inv,Complex.mul_im,Complex.mul_re]; positivity
  have hB : 0 < (2*z/a).im := by
    simp [div_eq_mul_inv,Complex.mul_im,Complex.mul_re]; positivity
  apply (product_sum (hasSum_jacobiTheta₂_term _ hA) (hasSum_jacobiTheta₂_term _ hB)).congr_fun
  rintro ⟨u,v⟩
  rw [show r*((b:ZMod a)*(u:ZMod a)-v)=(((r.val:ℤ)*(b*u-v):ℤ):ZMod a) by push_cast; simp,
    ZMod.stdAddChar_coe]
  simp only [jacobiTheta₂_term,term,←Complex.exp_add,Int.cast_mul,Int.cast_sub,Int.cast_natCast]
  congr 1
  ring

lemma dual_packet (n a : ℕ) [NeZero n] [NeZero a] (b : ℤ) {z : ℂ} (hz : 0 < z.im) :
    (∑ r : ZMod a, jacobiTheta₂ ((b:ℂ)*r.val/a) (2*n*z/a) * jacobiTheta₂ (-(r.val:ℂ)/a) (2*z/a)) =
      (a:ℂ)*theta n a b z := by
  classical
  apply (hasSum_sum (s:=univ) (fun r _ => dual_hsum n a b hz r)).unique
  apply ((theta_hasSum n a b hz).mul_left (a:ℂ)).congr_fun
  rintro ⟨u,v⟩
  rw [←sum_mul,AddChar.sum_mulShift _ (ZMod.isPrimitive_stdAddChar a),ZMod.card]
  unfold admitted
  simp only [sub_eq_zero,eq_comm (a:=(b:ZMod a)*(u:ZMod a))]
  split_ifs <;> simp_all

/-- Every binary ideal form (a x+b y)²/a+n y²/a is Fricke-invariant at weight one and level 4n
with the standard multiplier −i. -/
theorem theta_fricke (n a : ℕ) [NeZero n] [NeZero a] (b : ℤ) {z : ℂ} (hz : 0 < z.im) :
    theta n a b (-1/(4*n*z)) = 2*(√n:ℂ)*(-I*z)*theta n a b z := by
  rw [theta_invert_packet n a b (by intro h; simp [h] at hz),dual_packet n a b hz]
  have ha : (a:ℂ)≠0 := by exact_mod_cast NeZero.ne a
  field_simp

#print axioms theta_fricke

end
end TunnellIdealTheta
