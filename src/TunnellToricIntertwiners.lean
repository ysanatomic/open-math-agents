import TunnellHurwitzOptimal

/-! Rational conjugacy of the embeddings and their integral intertwiner lattices. -/

namespace TunnellHurwitz

open TunnellShell Quaternion

lemma pure_square {n : ℕ} {v : Triple} (hv : v∈shell n) : pure v*pure v=-(n:Q) := by
  have h := congrArg (embed n v hv) (Zsqrtd.dmuld (d:=-(n:ℤ)))
  simpa only [map_mul,embed_root,map_intCast,map_neg,map_natCast,Int.cast_neg,Int.cast_natCast] using h

lemma intertwine {n : ℕ} (v w : Triple) (hv : v∈shell n) (hw : w∈shell n) :
    ∃ q∈order, q≠0 ∧ pure w*q=q*pure v := by
  by_cases h : pure w+pure v=0
  · have hw' : pure w= -pure v := eq_neg_of_add_eq_zero_left h
    obtain ⟨a,b,c⟩ := v
    by_cases hab : a=0 ∧ b=0
    · obtain ⟨rfl,rfl⟩ := hab
      let q : Q := pure (1,0,0)
      refine ⟨q,pure_mem _,fun he => ?_,?_⟩
      · have t := congrArg QuaternionAlgebra.imI he
        norm_num [q,pure] at t
      · rw [hw',neg_mul]
        apply QuaternionAlgebra.ext <;>
          simp only [Quaternion.re_neg,Quaternion.imI_neg,Quaternion.imJ_neg,Quaternion.imK_neg,
          Quaternion.re_mul,Quaternion.imI_mul,Quaternion.imJ_mul,Quaternion.imK_mul]
        all_goals simp [pure,q]
    · let q : Q := pure (-b,a,0)
      refine ⟨q,pure_mem _,fun he => ?_,?_⟩
      · apply hab
        have h1 := congrArg QuaternionAlgebra.imI he
        have h2 := congrArg QuaternionAlgebra.imJ he
        simp [q,pure] at h1 h2
        exact ⟨h2,h1⟩
      · rw [hw',neg_mul]
        apply QuaternionAlgebra.ext <;>
          simp only [Quaternion.re_neg,Quaternion.imI_neg,Quaternion.imJ_neg,Quaternion.imK_neg,
          Quaternion.re_mul,Quaternion.imI_mul,Quaternion.imJ_mul,Quaternion.imK_mul]
        all_goals simp [pure,q] <;> ring
  · exact ⟨pure w+pure v,order.add_mem (pure_mem _) (pure_mem _),h,
      by rw [mul_add,add_mul,pure_square hw,pure_square hv,add_comm]⟩

def intertwiner (v w : Triple) : AddSubgroup Q where
  carrier := {q | q∈order ∧ pure w*q=q*pure v}
  zero_mem' := by simp
  add_mem' := by
    rintro a b ⟨ha,hea⟩ ⟨hb,heb⟩
    exact ⟨order.add_mem ha hb,by rw [mul_add,add_mul,hea,heb]⟩
  neg_mem' := by rintro a ⟨ha,he⟩; exact ⟨order.neg_mem ha,by rw [mul_neg,neg_mul,he]⟩

lemma intertwiner_comp {u v w : Triple} {a b : Q} (ha : a∈intertwiner v w) (hb : b∈intertwiner u v) :
    a*b∈intertwiner u w := by
  exact ⟨order.mul_mem ha.1 hb.1,by rw [←mul_assoc,ha.2,mul_assoc,hb.2,mul_assoc]⟩

lemma intertwiner_rank_one {v w : Triple} {q r : Q} (hq : q≠0)
    (he : pure w*q=q*pure v) (hs : pure w*r=r*pure v) {n : ℕ} (hn : Squarefree n) (hv : v∈shell n) :
    ∃ a b : ℚ, r=q*evalRat v a b := by
  have hm : (q⁻¹*r)*pure v=pure v*(q⁻¹*r) := by
    apply mul_left_cancel₀ hq
    calc q*(q⁻¹*r*pure v)=r*pure v := by simp [←mul_assoc,hq]
         _=pure w*r := hs.symm
         _=pure w*q*(q⁻¹*r) := by simp [mul_assoc,hq,←mul_assoc q q⁻¹]
         _=q*(pure v*(q⁻¹*r)) := by rw [he,mul_assoc]
  obtain ⟨b,hb⟩ := centralizer hn hv _ hm
  refine ⟨(q⁻¹*r).re,b,?_⟩
  rw [←hb,←mul_assoc,mul_inv_cancel₀ hq,one_mul]

#print axioms intertwiner_rank_one

end TunnellHurwitz
