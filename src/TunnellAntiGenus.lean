import TunnellGenusMap
import TunnellToricOddLocal

/-! The anti-commuting component has ramified genus character (−1/p). -/
namespace TunnellAntiGenus
open TunnellShell TunnellToricLocal TunnellHurwitz TunnellToricClass TunnellQuaternion Matrix
open TunnellHurwitzFour
noncomputable section

lemma anti_det {K : Type*} [Field K] (h2 : (2:K)≠0) (V X : M2 K)
    (hn : V≠0) (ht : V.trace=0) (hd : V.det=0) (e : V*X= -(X*V)) : ∃ r : K, X.det= -r^2 := by
  obtain ⟨x,y,hB⟩ := cyclic_exists V h2 hn ht
  let B := cyclicBasis x y V
  let D : M2 K := !![0,0;1,0]
  let Y := B⁻¹*X*B
  have hD : V*B=B*D := by simpa [D,hd] using cyclic_action V ht x y
  have hu : IsUnit B.det := isUnit_iff_ne_zero.mpr hB
  have hIB : D*B⁻¹=B⁻¹*V := by
    calc _=B⁻¹*(B*D)*B⁻¹ := by simp [←mul_assoc,Matrix.nonsing_inv_mul B hu]
         _=_ := by rw [←hD]; simp [mul_assoc,Matrix.mul_nonsing_inv B hu]
  have hy : D*Y= -(Y*D) := by
    dsimp only [Y]
    rw [←mul_assoc,←mul_assoc,hIB,mul_assoc B⁻¹,e,mul_neg,neg_mul]
    simp only [mul_assoc]; rw [hD]
  have e₀ := congrArg (fun t:M2 K => t 0 0) hy
  have e₁ := congrArg (fun t:M2 K => t 1 0) hy
  simp only [D,mul_apply,Fin.sum_univ_two,of_apply,cons_val_zero,cons_val_one,cons_val_fin_one,zero_mul,mul_zero,one_mul,mul_one,zero_add,add_zero,Matrix.neg_apply,zero_eq_neg] at e₀ e₁
  have hdet : Y.det=X.det := by dsimp only [Y]; rw [det_mul,det_mul,det_nonsing_inv,Ring.inverse_eq_inv]; field_simp [hu.ne_zero]
  refine ⟨Y 0 0,?_⟩
  have hy0 : Y 0 1=0 := by simpa using e₀
  rw [←hdet,det_fin_two,hy0]; linear_combination (Y 0 0)*e₁

lemma rat_injective : Function.Injective rat := by
  intro x y e; apply QuaternionAlgebra.ext
  · exact_mod_cast (show ((x.re:ℤ):ℚ)=y.re from congrArg QuaternionAlgebra.re e)
  · exact_mod_cast (show ((x.imI:ℤ):ℚ)=y.imI from congrArg QuaternionAlgebra.imI e)
  · exact_mod_cast (show ((x.imJ:ℤ):ℚ)=y.imJ from congrArg QuaternionAlgebra.imJ e)
  · exact_mod_cast (show ((x.imK:ℤ):ℚ)=y.imK from congrArg QuaternionAlgebra.imK e)

def twice (q : H ℤ) : Quaternion ℤ :=
  ⟨2*q.1+q.2.2.2,2*q.2.1+q.2.2.2,2*q.2.2.1+q.2.2.2,q.2.2.2⟩

lemma twice_rat (q : H ℤ) : rat (twice q)=2*hamZ q := by
  rw [two_mul]; apply QuaternionAlgebra.ext
  all_goals simp only [Quaternion.re_add,Quaternion.imI_add,Quaternion.imJ_add,Quaternion.imK_add] <;> dsimp [twice,rat,hamZ,ham] <;> push_cast <;> ring

lemma rat_neg (x : Quaternion ℤ) : rat (-x)= -(rat x) := by
  apply QuaternionAlgebra.ext
  all_goals simp only [Quaternion.re_neg,Quaternion.imI_neg,Quaternion.imJ_neg,Quaternion.imK_neg] <;> dsimp [rat] <;> simp

lemma anti_char {p n : ℕ} [Fact p.Prime] (hp2 : p≠2) (hn : Squarefree n) (hp : p∣n)
    {v : Triple} (hv : v∈shell n) {q : H ℤ} (e : TunnellHurwitz.pure v*hamZ q= -(hamZ q*TunnellHurwitz.pure v))
    (hq : ((nr q:ℤ):ZMod p)≠0) :
    quadraticChar (ZMod p) ((nr q:ℤ):ZMod p)=quadraticChar (ZMod p) (-1) := by
  let M := localModel hp2
  let V := residue M (TunnellQuaternion.pure v)
  let X := residue M (twice q)
  have hV : V.trace=0 := by rw [residue_trace]; simp [TunnellQuaternion.pure]
  have hD : V.det=0 := by rw [residue_det,norm_pure,mem_shell.mp hv,Int.cast_natCast,ZMod.natCast_eq_zero_iff]; exact hp
  have h2 : (2:ZMod p)≠0 := by
    intro h; have ht := (ZMod.natCast_eq_zero_iff 2 p).mp (by simpa using h)
    exact hp2 ((Nat.prime_dvd_prime_iff_eq (Fact.out:p.Prime) Nat.prime_two).mp ht)
  have hqZ : TunnellQuaternion.pure v*twice q= -(twice q*TunnellQuaternion.pure v) := by
    apply rat_injective; rw [rat_mul,rat_neg,rat_mul,twice_rat]
    have h : rat (TunnellQuaternion.pure v)=TunnellHurwitz.pure v := rfl
    rw [h]; noncomm_ring [e]
  have hX : V*X= -(X*V) := by simpa only [map_mul,map_neg,V,X] using congrArg (residue M) hqZ
  obtain ⟨r,hr⟩ := anti_det h2 V X (residue_nonzero M hn hv) hV hD hX
  have hZ : Quaternion.normSq (twice q)=4*nr q := by
    rw [Quaternion.normSq_def']; dsimp [twice,nr]; ring
  rw [show X.det=((Quaternion.normSq (twice q):ℤ):ZMod p) from residue_det _ _,hZ,Int.cast_mul,Int.cast_ofNat] at hr
  have h4 : (4:ZMod p)≠0 := by simpa only [show (4:ZMod p)=2^2 by norm_num] using pow_ne_zero 2 h2
  have hr0 : r≠0 := fun h => (mul_ne_zero h4 hq) (by simpa [h] using hr)
  have he := congrArg (quadraticChar (ZMod p)) hr
  rw [show (4:ZMod p)=2^2 by norm_num,map_mul,quadraticChar_sq_one' h2,one_mul,←neg_one_mul,map_mul,quadraticChar_sq_one' hr0,mul_one] at he
  exact he
end
end TunnellAntiGenus
#print axioms TunnellAntiGenus.anti_char
