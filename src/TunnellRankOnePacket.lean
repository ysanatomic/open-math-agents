import TunnellIdealTheta

/-! The translated theta packet of the even rank-one lattice.  The index D is twice
the positive integral coefficient of its quadratic form. -/
namespace TunnellRankOnePacket
open Complex Finset Real TunnellIdealTheta
open scoped Classical
noncomputable section

def packet (D : ℕ) [NeZero D] (r : ZMod D) (z : ℂ) : ℂ :=
  shift ((r.val:ℂ)/D) ((D:ℂ)*z)

def kernel (D : ℕ) (z : ℂ) (u : ℤ) := Complex.exp (π*I*(u:ℂ)^2*z/D)

def phase (D : ℕ) [NeZero D] (r : ZMod D) := Complex.exp (π*I*(r.val:ℂ)^2/D)

lemma packet_hasSum {D : ℕ} [NeZero D] (r : ZMod D) {z : ℂ} (hz : 0<z.im) :
    HasSum (fun l : ℤ => kernel D z (D*l+r.val)) (packet D r z) := by
  have hD : (D:ℂ)≠0 := by exact_mod_cast NeZero.ne D
  have hp : (0:ℝ)<D := Nat.cast_pos.mpr (NeZero.pos D)
  apply (shift_hasSum ((r.val:ℂ)/D) ((D:ℂ)*z) (by simpa [Complex.mul_im] using (mul_pos hp hz))).congr_fun
  intro l
  unfold kernel
  congr 1
  push_cast
  field_simp

lemma class_hasSum {D : ℕ} [NeZero D] (r : ZMod D) {z : ℂ} (hz : 0<z.im) :
    HasSum (fun n : ℤ => if (n:ZMod D)=r then kernel D z n else 0) (packet D r z) := by
  let e (l : ℤ) := (D:ℤ)*l+r.val
  have hD : (D:ℤ)≠0 := by exact_mod_cast NeZero.ne D
  have hi : Function.Injective e := fun a b h => mul_left_cancel₀ hD (add_right_cancel h)
  apply (hi.hasSum_iff ?_).mp
  · apply (packet_hasSum r hz).congr_fun
    intro l
    simp [Function.comp_def,e]
  · intro n hn
    split_ifs with h
    · exfalso
      apply hn
      obtain ⟨l,hl⟩ := (ZMod.intCast_eq_intCast_iff_dvd_sub (r.val:ℤ) n D).mp (by simpa using h.symm)
      exact ⟨l,by dsimp [e]; omega⟩
    · rfl

theorem packet_T {D : ℕ} [NeZero D] (hD : Even D) (r : ZMod D) {z : ℂ} (hz : 0<z.im) :
    packet D r (z+1)=phase D r*packet D r z := by
  apply (packet_hasSum r (z:=z+1) (by simpa using hz)).unique
  apply ((packet_hasSum r hz).mul_left (phase D r)).congr_fun
  intro l
  obtain ⟨k,hk⟩ := hD
  let m : ℤ := k*l^2+r.val*l
  have hD' : (D:ℂ)≠0 := by exact_mod_cast NeZero.ne D
  have hk' : (D:ℂ)=(k:ℂ)+k := by exact_mod_cast hk
  let n : ℤ := D*l+r.val
  have e : (π:ℂ)*I*(n:ℂ)^2*(z+1)/D =
      (π*I*(r.val:ℂ)^2/D + π*I*(n:ℂ)^2*z/D) + (m:ℂ)*(2*π*I) := by
    dsimp [n,m]
    push_cast
    field_simp
    rw [hk']
    ring
  unfold kernel phase
  rw [e,Complex.exp_add,Complex.exp_int_mul_two_pi_mul_I,mul_one,Complex.exp_add]

lemma jacobi_packet {D : ℕ} [NeZero D] (r : ZMod D) {z : ℂ} (hz : 0<z.im) :
    jacobiTheta₂ ((r.val:ℂ)/D) (z/D) = ∑ s : ZMod D, ZMod.stdAddChar (r*s)*packet D s z := by
  have hp : (0:ℝ)<D := Nat.cast_pos.mpr (NeZero.pos D)
  have hz' : 0<(z/(D:ℂ)).im := by simp [div_eq_mul_inv,Complex.mul_im]; positivity
  apply (hasSum_jacobiTheta₂_term _ hz').unique
  apply (hasSum_sum (s:=univ) (fun s _ => (class_hasSum s hz).mul_left (ZMod.stdAddChar (r*s)))).congr_fun
  intro n
  rw [sum_eq_single (n:ZMod D)]
  · rw [if_pos rfl,show r*(n:ZMod D)=(((r.val:ℤ)*n:ℤ):ZMod D) by push_cast; simp,ZMod.stdAddChar_coe]
    simp only [kernel,jacobiTheta₂_term,←Complex.exp_add,Int.cast_mul,Int.cast_natCast]
    congr 1
    ring
  · intro t _ ht
    simp [Ne.symm ht]
  · simp

theorem packet_S {D : ℕ} [NeZero D] (r : ZMod D) {z : ℂ} (hz : 0<z.im) :
    packet D r (-1/z) = ((-I*z)^(1/2:ℂ)/(√(D:ℝ):ℂ))*
      ∑ s : ZMod D, ZMod.stdAddChar (r*s)*packet D s z := by
  have hD : (D:ℂ)≠0 := by exact_mod_cast NeZero.ne D
  have hp : (0:ℝ)<D := Nat.cast_pos.mpr (NeZero.pos D)
  have hzne : z≠0 := by intro e; simp [e] at hz
  rw [packet, show (D:ℂ)*(-1/z)= -1/(z/D) by field_simp, shift_invert _ _ (div_ne_zero hzne hD),
    jacobi_packet r hz]
  congr 1
  rw [show -I*(z/(D:ℂ))=(((D:ℝ)⁻¹:ℝ):ℂ)*(-I*z) by push_cast; ring,
    half_scale (inv_pos.mpr hp) (mul_ne_zero (by simp) hzne),Real.sqrt_inv,Complex.ofReal_inv]
  ring

end
end TunnellRankOnePacket
#print axioms TunnellRankOnePacket.packet_S
#print axioms TunnellRankOnePacket.packet_T
