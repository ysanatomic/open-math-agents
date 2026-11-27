import TunnellCMGluing

/-! The exact dyadic denominator of the anti-commuting component in the integral Hurwitz order. -/
namespace TunnellTwoProjection
open TunnellHurwitz TunnellToricClass TunnellShell TunnellToricLocal
local notation "ι" => TunnellHurwitz.pure
noncomputable section

def filt (d : ℕ) (v w : Triple) (q : Q) := (2*(d:Q))*q+ι w*q*ι v
def admits (d : ℕ) (v w : Triple) (q : Q) := ∃ x∈J v w, ∃ y∈O,
    ι w*y= -(y*ι v) ∧ (d:Q)*q=x+2*y

lemma squares {d : ℕ} {v : Triple} (hv : v∈shell (2*d)) : ι v*ι v= -(2*(d:Q)) := by simpa using pure_square hv

lemma filt_left {d : ℕ} {v w : Triple} (hw : w∈shell (2*d)) (q : Q) :
    ι w*filt d v w q=(d:Q)*(ι w*q-q*ι v)*2 := by
  have h₁ : ι w*((2*(d:Q))*q)=(2*(d:Q))*(ι w*q) := by rw [←mul_assoc,show (2*(d:Q))=((2*d:ℕ):Q) by push_cast; rfl,Nat.commute_cast,mul_assoc]
  have h₂ : ι w*(ι w*q*ι v)= -(2*(d:Q))*q*ι v := by rw [←mul_assoc,←mul_assoc,squares hw]
  rw [filt,mul_add,h₁,h₂]; noncomm_ring

lemma filt_anti {d : ℕ} {v w : Triple} (hv : v∈shell (2*d)) (hw : w∈shell (2*d)) (q : Q) :
    ι w*filt d v w q= -(filt d v w q*ι v) := by
  have h₃ : (ι w*q*ι v)*ι v = -((2*(d:Q))*(ι w*q)) := by
    rw [mul_assoc (ι w*q),squares hv,mul_neg,show (2*(d:Q))=((2*d:ℕ):Q) by push_cast; rfl,Nat.commute_cast]
  rw [filt_left hw,filt,add_mul,h₃]; noncomm_ring

theorem admits_iff {d : ℕ} {v w : Triple} (hv : v∈shell (2*d)) (hw : w∈shell (2*d))
    (hd : 0<d) {q : Q} (hq : q∈O) : admits d v w q ↔ ∃ b∈O, filt d v w q=8*b := by
  have hdq : (d:Q)≠0 := by intro e; have H:=congrArg QuaternionAlgebra.re e; change (d:ℚ)=0 at H; exact hd.ne' (by exact_mod_cast H)
  constructor
  · rintro ⟨x,hx,y,hy,ey,e⟩
    refine ⟨y,hy,mul_left_cancel₀ hdq ?_⟩
    have hd' (r : Q) : (d:Q)*r=r*d := Nat.cast_comm d r
    have hx' : (ι w*x)*ι v = -((2*(d:Q))*x) := by
      rw [hx.2,mul_assoc,squares hv,mul_neg,show 2*(d:Q)=((2*d:ℕ):Q) by push_cast; rfl,Nat.commute_cast]
    have hy' : (ι w*y)*ι v = (2*(d:Q))*y := by
      rw [ey,neg_mul,mul_assoc,squares hv,mul_neg,neg_neg,show 2*(d:Q)=((2*d:ℕ):Q) by push_cast; rfl,Nat.commute_cast]
    calc (d:Q)*filt d v w q=(2*(d:Q))*((d:Q)*q)+ι w*((d:Q)*q)*ι v := by
           rw [filt,mul_add]; congr 1
           · noncomm_ring
           · rw [←mul_assoc,←mul_assoc,hd' (ι w),mul_assoc, mul_assoc]; simp only [mul_assoc]
         _=(d:Q)*(8*y) := by rw [e]; noncomm_ring [hx',hy']
  · rintro ⟨b,hb,e⟩
    have h8 : (8:Q)≠0 := by intro he; have H:=congrArg QuaternionAlgebra.re he; change (8:ℚ)=0 at H; norm_num at H
    have h2 : (2:Q)≠0 := by intro he; have H:=congrArg QuaternionAlgebra.re he; change (2:ℚ)=0 at H; norm_num at H
    have hC (k : ℕ) (s t : Q) : s*((k:Q)*t)=(k:Q)*(s*t) := by rw [←mul_assoc,Nat.commute_cast,mul_assoc]
    have hc8 (s t : Q) : s*(8*t)=8*(s*t) := by noncomm_ring
    have hc2 (s t : Q) : s*(2*t)=2*(s*t) := by noncomm_ring
    have hb' := filt_anti hv hw q
    rw [e,hc8, mul_assoc,←mul_neg] at hb'
    have ha := mul_left_cancel₀ h8 hb'
    have hF := filt_left hw (v:=v) q
    rw [e,hc8] at hF
    have hF' : (2:Q)*(4*(ι w*b))=2*((d:Q)*(ι w*q-q*ι v)) := by calc
      _=8*(ι w*b) := by noncomm_ring
      _=_ := by rw [hF]; noncomm_ring
    have hD := mul_left_cancel₀ h2 hF'
    let x := (d:Q)*q-2*b
    have hx : x∈O := O.sub_mem (by simpa only [zsmul_eq_mul,Int.cast_natCast] using O.smul_mem (d:ℤ) hq) (by simpa only [zsmul_eq_mul,Int.cast_ofNat] using O.smul_mem (2:ℤ) hb)
    refine ⟨x,⟨hx,?_⟩,b,hb,ha,by dsimp [x]; abel⟩
    change ι w*((d:Q)*q-2*b)=((d:Q)*q-2*b)*ι v
    rw [mul_sub,sub_mul,hC,hc2,mul_assoc,mul_assoc]
    have h := congrArg (fun t:Q => t+(d:Q)*(q*ι v)) hD
    rw [mul_sub,sub_add_cancel] at h
    rw [←h,ha]; noncomm_ring

end
end TunnellTwoProjection
#print axioms TunnellTwoProjection.admits_iff
