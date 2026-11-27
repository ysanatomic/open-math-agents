import TunnellPacketCRT
import Mathlib.NumberTheory.ModularForms.SlashActions

/-! The integral weight-two action on a product of four unary lattice packets. -/
namespace TunnellRectangularPacket
open Complex Real Finset TunnellRankOnePacket TunnellPacketCRT MatrixGroups ModularGroup ModularForm
open UpperHalfPlane hiding I
open scoped ModularForm
noncomputable section

lemma packet_Tpow {D : ℕ} [NeZero D] (he : Even D) (r : ZMod D) {z : ℂ} (hz : 0<z.im) (j : ℤ) :
    packet D r (z+(j:ℂ))=(phase D r)^j*packet D r z := by
  apply (packet_hasSum r (z:=z+(j:ℂ)) (by simpa using hz)).unique
  apply ((packet_hasSum r hz).mul_left ((phase D r)^j)).congr_fun
  intro l
  let a : ℤ := D*l+r.val
  have h : (a:ZMod D)=r := by simp [a]
  have hh := phase_lift he j a
  rw [h] at hh
  rw [hh]
  unfold kernel expQ
  rw [←Complex.exp_add]
  congr 1
  dsimp [a]
  ring

lemma packet_neg {D : ℕ} [NeZero D] (r : ZMod D) {z : ℂ} (hz : 0<z.im) :
    packet D (-r) z=packet D r z := by
  apply (class_hasSum (-r) hz).unique
  apply (((Equiv.neg ℤ).hasSum_iff).mpr (class_hasSum r hz)).congr_fun
  intro n
  simp [kernel,neg_eq_iff_eq_neg,Function.comp_def]

lemma packet_Sneg {D : ℕ} [NeZero D] (r : ZMod D) {z : ℂ} (hz : 0<z.im) :
    packet D r (-1/z) = ((-I*z)^(1/2:ℂ)/(√(D:ℝ):ℂ))*
      ∑ s : ZMod D, ZMod.stdAddChar (-(r*s))*packet D s z := by
  let w : ℍ := ⟨z,hz⟩
  have hp : 0<(-1/z).im := by simpa [w,neg_div,one_div,inv_neg] using w.im_inv_neg_coe_pos
  rw [←packet_neg r hp,packet_S _ hz]
  simp only [neg_mul]

abbrev Index (D : Fin 4→ℕ) := (i : Fin 4)→ZMod (D i)
variable (D : Fin 4→ℕ) [∀ i, NeZero (D i)]

def theta (r : Index D) (z : ℍ) : ℂ := ∏ i,packet (D i) (r i) z

def scale : ℂ := -(∏ i, (√(D i:ℝ):ℂ))⁻¹

def pair (r s : Index D) : ℂ := ∏ i, ZMod.stdAddChar (r i*s i)

def negPair (r s : Index D) : ℂ := ∏ i, ZMod.stdAddChar (-(r i*s i))

def diag (j : ℤ) (r : Index D) : ℂ := ∏ i,(phase (D i) (r i))^j

lemma theta_T (he : ∀ i, Even (D i)) (j : ℤ) (r : Index D) (z : ℍ) :
    ((theta D r) ∣[(2:ℤ)] (T^j)) z = diag D j r*theta D r z := by
  rw [SL_slash_apply,modular_T_zpow_smul,theta]
  have hj : denom (T^j:SL(2,ℤ)) z=1 := by rw [ModularGroup.denom_apply]; simp [coe_T_zpow]
  simp only [hj,one_zpow,mul_one,UpperHalfPlane.coe_vadd,Complex.ofReal_intCast,add_comm (j:ℂ)]
  simp only [packet_Tpow (he _) _ z.im_pos,prod_mul_distrib,diag,theta]

private lemma S_slash {K : ∀ i, ZMod (D i)→ZMod (D i)→ℂ}
    (h : ∀ i (r : ZMod (D i)) (z : ℍ), packet (D i) r (-1/(z:ℂ)) =
      ((-I*z)^(1/2:ℂ)/(√(D i:ℝ):ℂ))*∑ s, K i r s*packet (D i) s z)
    (r : Index D) (z : ℍ) :
    ((theta D r) ∣[(2:ℤ)] S) z = scale D*∑ s : Index D, (∏ i, K i (r i) (s i))*theta D s z := by
  rw [SL_slash_apply,modular_S_smul,denom_S]
  unfold theta
  change (∏ i,packet (D i) (r i) (-(↑z:ℂ))⁻¹)*_ = _
  simp only [show (-(↑z:ℂ))⁻¹= -1/(z:ℂ) by ring,h,prod_mul_distrib,Finset.prod_div_distrib,
    prod_const,Finset.card_univ,Fintype.card_fin]
  have pow : ((-I*(z:ℂ))^(1/2:ℂ))^4 = -(z:ℂ)^2 := by
    rw [←Complex.cpow_mul_ofNat,show (1/2:ℂ)*4=2 by norm_num,Complex.cpow_ofNat]
    ring_nf
    simp
  rw [pow,Fintype.prod_sum]
  simp only [Finset.prod_mul_distrib]
  unfold scale
  have hn : (z:ℂ)≠0 := z.ne_zero
  rw [zpow_neg,zpow_ofNat]
  field_simp

theorem theta_S (r : Index D) (z : ℍ) :
    ((theta D r) ∣[(2:ℤ)] S) z = scale D*∑ s : Index D,pair D r s*theta D s z :=
  S_slash D (fun i r z => packet_S r z.im_pos) r z

theorem theta_Sminus (r : Index D) (z : ℍ) :
    ((theta D r) ∣[(2:ℤ)] S) z = scale D*∑ s : Index D,negPair D r s*theta D s z :=
  S_slash D (fun i r z => packet_Sneg r z.im_pos) r z

lemma scale_sq : (scale D)^2*(Fintype.card (Index D):ℂ)=1 := by
  have pos (i : Fin 4) : (D i:ℝ)>0 := by exact_mod_cast NeZero.pos (D i)
  have h (i : Fin 4) : (√(D i:ℝ):ℂ)^2=(D i:ℂ) := by exact_mod_cast Real.sq_sqrt (pos i).le
  have p : ∏ i, (√(D i:ℝ):ℂ) ≠ 0 := Finset.prod_ne_zero_iff.mpr fun i _ => by exact_mod_cast (Real.sqrt_pos.mpr (pos i)).ne'
  rw [scale,neg_sq,inv_pow,Fintype.card_pi]
  push_cast
  simp only [ZMod.card,←Finset.prod_pow,h]
  have q : ∏ i,(D i:ℂ) ≠ 0 := Finset.prod_ne_zero_iff.mpr fun i _ => by exact_mod_cast NeZero.ne (D i)
  field_simp

end
end TunnellRectangularPacket
#print axioms TunnellRectangularPacket.theta_S
#print axioms TunnellRectangularPacket.theta_T
