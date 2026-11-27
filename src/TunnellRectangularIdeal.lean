import TunnellUniformBasis
import TunnellRankOnePacket

/-! Rectangular theta packets for a translated ramified quadratic ideal coset. -/
namespace TunnellRectangularIdeal
open TunnellRankOnePacket TunnellIdealHNF TunnellUniformBasis TunnellIdealFormBasis TunnellOddDiscriminant
open TunnellClassThetaExpansion TunnellIdealThetaExpansion Finset
open scoped Classical
noncomputable section

lemma offset_sum {D : ℕ} [NeZero D] (r : ℤ) {z : ℂ} (hz : 0<z.im) :
    HasSum (fun l:ℤ => kernel D z ((D:ℤ)*l+r)) (TunnellRankOnePacket.packet D (r:ZMod D) z) := by
  let f (l : ℤ) := (D:ℤ)*l+r
  have hi : Function.Injective f := fun _ _ e => mul_left_cancel₀ (by exact_mod_cast (NeZero.ne D) : (D:ℤ)≠0) (add_right_cancel e)
  have h := class_hasSum (r:ZMod D) hz
  have ht : HasSum (fun l => if ((f l):ZMod D)=(r:ZMod D) then kernel D z (f l) else 0) (TunnellRankOnePacket.packet D (r:ZMod D) z) := by
    apply (hi.hasSum_iff ?_).mpr h
    intro n hn
    split_ifs with e
    · exfalso; apply hn
      obtain ⟨k,hk⟩ := (ZMod.intCast_eq_intCast_iff_dvd_sub r n D).mp e.symm
      exact ⟨k,by dsimp [f]; omega⟩
    · rfl
  simpa [f] using ht

def rect (d a κ : ℕ) [NeZero d] [NeZero a] [NeZero κ] (b s : ℤ) (z : ℂ) :=
  ∑ i : ZMod a,
    TunnellRankOnePacket.packet (2*κ*a) ((2*(κ:ℤ)*b*i.val:ℤ):ZMod (2*κ*a)) z *
    TunnellRankOnePacket.packet (2*κ*a*(2*d)) (((2*(κ:ℤ)*(2*(d:ℤ))*i.val+4*κ*a*s):ℤ):ZMod (2*κ*a*(2*d))) z

def term (d a κ : ℕ) (b s : ℤ) (z : ℂ) (x : ℤ×ℤ) :=
  Complex.exp (2*Real.pi*Complex.I*z*κ*((a*x.1+b*x.2:ℤ)^2+(2*(d:ℂ))*((x.2:ℂ)+(a:ℂ)*s/d)^2)/a)

private lemma product_sum {X Y : Type*} {f : X→ℂ} {g : Y→ℂ} {x y : ℂ} (hf : HasSum f x) (hg : HasSum g y) :
    HasSum (fun z:X×Y => f z.1*g z.2) (x*y) := hf.mul hg (summable_mul_of_summable_norm hf.summable.norm hg.summable.norm)

set_option maxHeartbeats 600000 in
theorem translated (d a κ : ℕ) [NeZero d] [NeZero a] [NeZero κ] (b s : ℤ) {z : ℂ} (hz : 0<z.im) :
    HasSum (term d a κ b s z) (rect d a κ b s z) := by
  classical
  let weight (i : ZMod a) (x : ℤ×ℤ) := if (x.2:ZMod a)=i then term d a κ b s z x else 0
  unfold rect
  have hterm (i : ZMod a) : HasSum (weight i)
      (TunnellRankOnePacket.packet (2*κ*a) ((2*(κ:ℤ)*b*i.val:ℤ):ZMod (2*κ*a)) z *
      TunnellRankOnePacket.packet (2*κ*a*(2*d)) (((2*(κ:ℤ)*(2*(d:ℤ))*i.val+4*κ*a*s):ℤ):ZMod (2*κ*a*(2*d))) z) := by
    let f (l : ℤ×ℤ) := (l.1-b*l.2,(a:ℤ)*l.2+i.val)
    have hi : Function.Injective f := by
      intro l k e
      have he := congrArg Prod.snd e
      have hk := mul_left_cancel₀ (by exact_mod_cast (NeZero.ne a) : (a:ℤ)≠0) (add_right_cancel he)
      have hr := congrArg Prod.fst e; change l.1-b*l.2=k.1-b*k.2 at hr
      exact Prod.ext (by rw [hk] at hr; exact sub_left_inj.mp hr) hk
    apply (hi.hasSum_iff ?_).mp
    · have h₁ := offset_sum (D:=2*κ*a) (2*(κ:ℤ)*b*i.val) hz
      have h₂ := offset_sum (D:=2*κ*a*(2*d)) (2*(κ:ℤ)*(2*(d:ℤ))*i.val+4*κ*a*s) hz
      have H := product_sum h₁ h₂
      apply H.congr_fun
      rintro ⟨l,k⟩
      simp only [Function.comp_apply,f,weight,Int.cast_add,Int.cast_mul,Int.cast_natCast,ZMod.natCast_self,zero_mul,zero_add,ZMod.natCast_zmod_val,ite_true]
      simp only [term,kernel,←Complex.exp_add]
      congr 1; push_cast
      have ha : (a:ℂ)≠0 := by exact_mod_cast NeZero.ne a
      have hd : (d:ℂ)≠0 := by exact_mod_cast NeZero.ne d
      have hk : (κ:ℂ)≠0 := by exact_mod_cast NeZero.ne κ
      field_simp; ring
    · rintro ⟨x,y⟩ he
      unfold weight
      split_ifs with h
      · exfalso; apply he
        obtain ⟨k,hk⟩ := (ZMod.intCast_eq_intCast_iff_dvd_sub (i.val:ℤ) y a).mp (by simpa using h.symm)
        exact ⟨(x+b*k,k),Prod.ext (by dsimp [f]; ring) (by dsimp [f]; omega)⟩
      · rfl
  apply (hasSum_sum (s:=univ) (fun i _ => hterm i)).congr_fun
  intro x; simp [weight]

lemma unshifted {d κ : ℕ} [NeZero d] [NeZero κ] {I : Ideal (R (2*d))} (L : TunnellUniformBasis.Basis d I)
    (hI : I≠⊥) {z : ℂ} (hz : 0<z.im) :
    letI : NeZero L.a := ⟨L.pos.ne'⟩
    rect d L.a κ L.b 0 z=thetaI I ((κ:ℂ)*z) := by
  letI : NeZero L.a := ⟨L.pos.ne'⟩
  have ha : (L.a:ℂ)≠0 := by exact_mod_cast L.pos.ne'
  have hN : (normI I:ℂ)≠0 := by exact_mod_cast (normI_positive (by have h := NeZero.pos d; omega) I hI).ne'
  rw [←(translated d L.a κ L.b 0 hz).tsum_eq,thetaI,←L.basis.toEquiv.tsum_eq (normTerm I ((κ:ℂ)*z))]
  apply tsum_congr; intro x
  unfold term normTerm
  change _=Complex.exp (_*(κ*z)*(↑((L.basis x).val.norm):ℂ)/normI I)
  rw [L.norm]; dsimp [quad]
  congr 1; push_cast; simp only [Int.cast_zero,mul_zero,zero_div,add_zero]
  have he := congrArg (fun v:ℤ => (v:ℂ)) L.det; push_cast at he
  field_simp
  linear_combination -(κ:ℂ)*z*(x.2:ℂ)^2*he

end
end TunnellRectangularIdeal
#print axioms TunnellRectangularIdeal.unshifted
#print axioms TunnellRectangularIdeal.translated

