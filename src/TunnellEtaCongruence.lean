import TunnellEtaLevelGenerators
import TunnellBaseActual

/-! The conductor-32 eta product transforms with trivial character on Γ₀(32). -/
namespace TunnellEtaLevel
open Complex TunnellFricke Matrix MatrixGroups ModularGroup CongruenceSubgroup TunnellEtaValue
open UpperHalfPlane hiding I
open scoped ModularForm
noncomputable section

lemma left_upper (a b c d n : ℤ) (hd : a*d-2*b*c=1) :
    mat 1 n 0 1 (by ring)*mat a b c d hd=
      mat (a+2*n*c) (b+n*d) c d (by linear_combination hd) := by
  apply Subtype.ext
  change !![(1:ℤ),n;0,1]*!![a,b;2*c,d]=!![a+2*n*c,b+n*d;2*c,d]
  ext i j
  fin_cases i <;> fin_cases j <;> simp [Matrix.mul_fin_two] <;> ring

lemma left_lower (a b c d n : ℤ) (hd : a*d-2*b*c=1) :
    mat 1 0 n 1 (by ring)*mat a b c d hd=
      mat a b (c+n*a) (d+2*n*b) (by linear_combination hd) := by
  apply Subtype.ext
  change !![(1:ℤ),0;2*n,1]*!![a,b;2*c,d]=!![a,b;2*(c+n*a),d+2*n*b]
  ext i j
  fin_cases i <;> fin_cases j <;> simp [Matrix.mul_fin_two] <;> ring

lemma cancel_phase (w : ℂ) (nw : w≠0) (f g : ℍ → ℂ) (e : w • f = w • g) : f=g := by
  ext z : 1
  exact mul_left_cancel₀ nw (congrFun e z)

lemma gamma_two (a b c d : ℤ) (hd : a*d-2*b*c=1) :
    H ∣[(2:ℤ)] (mat a b c d hd)= I^(a*(b-c)) • H := by
  let P (a b c d : ℤ) := ∀ hd : a*d-2*b*c=1,
    H ∣[(2:ℤ)] (mat a b c d hd)=I^(a*(b-c)) • H
  suffices P a b c d from this hd
  apply gamma_two_induction P _ _ _ hd
  · intro a b d e hd
    rcases Int.eq_one_or_neg_one_of_mul_eq_one' e with ⟨rfl,rfl⟩|⟨rfl,rfl⟩
    · simpa using upper_slash b
    · ext z : 1
      rw [slash_mat]
      simp [H,show -(z:ℂ)+(b:ℂ) = -(z+(-b:ℤ)) by push_cast; ring,trans]
      rw [show ((b:ℂ)+ -(z:ℂ)) / -1=(z:ℂ)+((-b:ℤ):ℂ) by push_cast; ring,trans,_root_.zpow_neg]
  · intro n a b c d ih hd
    have he := ih (by linear_combination hd)
    rw [←left_upper a b c d n hd,SlashAction.slash_mul,upper_slash,ModularForm.SL_smul_slash,phase_upper _ _ _ _ _ hd,mul_smul] at he
    exact cancel_phase _ (zpow_ne_zero _ I_ne_zero) _ _ he
  · intro n a b c d ih hd
    have he := ih (by linear_combination hd)
    rw [←left_lower a b c d n hd,SlashAction.slash_mul,lower_slash,ModularForm.SL_smul_slash,phase_lower _ _ _ _ _ hd,mul_smul] at he
    exact cancel_phase _ (zpow_ne_zero _ I_ne_zero) _ _ he

lemma physical (z : ℍ) : etaValue z = h (4*(z:ℂ)) := by
  simp [etaValue,h,show 2*(4*(z:ℂ))=8*z by ring]

theorem eta_level (g : SL(2,ℤ)) (hg : g∈Gamma0 32) (z : ℍ) :
    etaValue (g • z)=denom g z^2*etaValue z := by
  obtain ⟨c,hc⟩ := (ZMod.intCast_zmod_eq_zero_iff_dvd _ _).mp (Gamma0_mem.mp hg)
  let a := g 0 0
  let b := g 0 1
  let d := g 1 1
  have hdet : a*d-2*(4*b)*(4*c)=1 := by
    have e := g.property
    rw [Matrix.det_fin_two,hc] at e
    dsimp [a,b,d]; norm_num at e; linear_combination e
  let w : ℍ := ⟨4*(z:ℂ),by simpa [Complex.mul_im] using z.im_pos⟩
  have ee := congrFun (gamma_two a (4*b) (4*c) d hdet) w
  have ep : I^(a*(4*b-4*c))=1 := by
    rw [show a*(4*b-4*c)=4*(a*(b-c)) by ring,_root_.zpow_mul]
    simp [zpow_ofNat,I_pow_four]
  rw [slash_mat,ep,one_smul] at ee
  have hd : denom g z=2*((4*c:ℤ):ℂ)*(w:ℂ)+(d:ℂ) := by
    simp [ModularGroup.denom_apply,hc,w,d]; ring
  have he : 4*((g • z:ℍ):ℂ)=((a:ℂ)*(w:ℂ)+((4*b:ℤ):ℂ))/denom g z := by
    rw [UpperHalfPlane.coe_specialLinearGroup_apply]
    simp [ModularGroup.denom_apply,a,b,w,mul_div_assoc',mul_add]; ring
  rw [physical,physical,he,hd]
  change h _ * _ = h (w:ℂ) at ee
  have hn := hd ▸ denom_ne_zero g z
  rw [_root_.zpow_neg,zpow_ofNat,←div_eq_mul_inv,div_eq_iff (pow_ne_zero _ hn)] at ee
  simpa [mul_comm,w] using ee
end
end TunnellEtaLevel
#print axioms TunnellEtaLevel.eta_level
