import TunnellEtaGammaGeneration
import Mathlib.NumberTheory.ModularForms.SlashActions

/-! Translation and lower unipotent laws for the level-two eta product. -/
namespace TunnellEtaLevel
open Complex TunnellFricke Matrix MatrixGroups ModularGroup
open UpperHalfPlane hiding I
open scoped ModularForm
noncomputable section

lemma trans_one (z : ℂ) : h (z+1)=I*h z := by
  rw [present,q_T,disk_rot,present z,mul_assoc]

lemma trans (n : ℤ) (z : ℂ) : h (z+(n:ℂ))=I^n*h z := by
  induction n using Int.induction_on with
  | zero => simp
  | succ k ih =>
    simpa [zpow_add₀ I_ne_zero,add_assoc,mul_left_comm,mul_comm,mul_assoc] using
      (trans_one (z+k)).trans (congrArg (I*·) ih)
  | pred k ih =>
    let m : ℤ := -(k:ℤ)
    change h (z+(m:ℂ))=I^m*h z at ih
    change h (z+((m-1:ℤ):ℂ))=I^(m-1)*h z
    have he := trans_one (z+(m:ℂ)-1)
    rw [sub_add_cancel,ih] at he
    simp only [Int.cast_sub,Int.cast_one]
    rw [show z+((m:ℂ)-1)=z+(m:ℂ)-1 by ring]
    apply mul_left_cancel₀ I_ne_zero
    rw [←he,zpow_sub₀ I_ne_zero,zpow_one]
    field_simp

lemma lower (n : ℤ) (z : ℍ) :
    h ((z:ℂ)/(2*(n:ℂ)*z+1))=I^(-n)*(2*(n:ℂ)*z+1)^2*h z := by
  let w := W (z:ℂ) + ((-n:ℤ):ℂ)
  have hw : 0<w.im := by simpa [w] using W_mem z.im_pos
  have hw₀ := ne_zero (⟨w,hw⟩:ℍ)
  have hden : 2*(n:ℂ)*z+1≠0 := by
    have H := linear_ne_zero (cd:=![(2*(n:ℝ)),1]) z (by
      intro he; have hh := congrFun he 1; norm_num at hh)
    simpa using H
  have hW : W w=(z:ℂ)/(2*(n:ℂ)*z+1) := by
    rw [W,div_eq_div_iff (mul_ne_zero two_ne_zero hw₀) hden]
    dsimp [w,W]; push_cast; field_simp [z.ne_zero]; ring
  rw [←hW,h_fricke _ hw,show h w=I^(-n)*h (W z) from trans (-n) _,h_fricke _ z.im_pos]
  dsimp [w,W]; push_cast; field_simp [z.ne_zero]; ring

def mat (a b c d : ℤ) (hd : a*d-2*b*c=1) : SL(2,ℤ) :=
  ⟨!![a,b;2*c,d],by simp [Matrix.det_fin_two]; linear_combination hd⟩

def H (z : ℍ) := h (z:ℂ)

lemma slash_mat (a b c d : ℤ) (hd : a*d-2*b*c=1) (z : ℍ) :
    (H ∣[(2:ℤ)] (mat a b c d hd)) z =
      h (((a:ℂ)*z+b)/(2*(c:ℂ)*z+d))*(2*(c:ℂ)*z+d)^(-(2:ℤ)) := by
  rw [ModularForm.SL_slash_apply]
  unfold H
  rw [UpperHalfPlane.coe_specialLinearGroup_apply,ModularGroup.denom_apply]
  simp [mat]

lemma upper_slash (n : ℤ) : H ∣[(2:ℤ)] (mat 1 n 0 1 (by ring)) = I^n • H := by
  ext z : 1
  simp [slash_mat,trans,H]

lemma lower_slash (n : ℤ) : H ∣[(2:ℤ)] (mat 1 0 n 1 (by ring)) = I^(-n) • H := by
  ext z : 1
  rw [slash_mat]
  simp only [Int.cast_one,one_mul,Int.cast_zero,add_zero,lower,Pi.smul_apply,smul_eq_mul,H,
    _root_.zpow_neg,zpow_ofNat]
  have hden : 2*(n:ℂ)*z+1≠0 := by
    have HH := linear_ne_zero (cd:=![(2*(n:ℝ)),1]) z (by
      intro he; have hh := congrFun he 1; norm_num at hh)
    simpa using HH
  field_simp [hden]

lemma phase {u v : ℤ} (e : (u:ZMod 4)=(v:ZMod 4)) : I^u=I^v := by
  rw [I_zpow_eq_zpow_mod u,I_zpow_eq_zpow_mod v]
  exact congrArg (I^·) ((ZMod.intCast_eq_intCast_iff' u v 4).mp e)

set_option maxRecDepth 8000 in
lemma phase_upper (a b c d n : ℤ) (det : a*d-2*b*c=1) :
    I^((a+2*n*c)*(b+n*d-c))=I^n*I^(a*(b-c)) := by
  rw [←zpow_add₀ I_ne_zero]
  apply phase
  push_cast
  have t : ∀ a b c d n : ZMod 4, a*d-2*b*c=1 →
      (a+2*n*c)*(b+n*d-c)=n+a*(b-c) := by decide
  apply t a b c d n
  simpa using congrArg (fun x : ℤ => (x:ZMod 4)) det

set_option maxRecDepth 8000 in
lemma phase_lower (a b c d n : ℤ) (det : a*d-2*b*c=1) :
    I^(a*(b-(c+n*a)))=I^(-n)*I^(a*(b-c)) := by
  rw [←zpow_add₀ I_ne_zero]
  apply phase
  push_cast
  have t : ∀ a b c d n : ZMod 4, a*d-2*b*c=1 →
      a*(b-(c+n*a))= -n+a*(b-c) := by decide
  apply t a b c d n
  simpa using congrArg (fun x : ℤ => (x:ZMod 4)) det
end
end TunnellEtaLevel
#print axioms TunnellEtaLevel.lower_slash
