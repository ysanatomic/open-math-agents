import TunnellProperClassGroup
import TunnellIntertwinerTheta

/-! An ambiguous proper class contains a conjugation-stable integral ideal. -/
namespace TunnellAmbiguousClass
open TunnellIdealHNF TunnellIdealGenerators TunnellClassThetaCount TunnellToricClass TunnellShell TunnellEmbeddedIdeals TunnellHurwitz TunnellProperClassGroup
noncomputable section
variable {n : ℕ} (hn : Squarefree n) (h2 : n%4=2) {v : Triple} (hv : v∈shell n)

lemma nonzero_principal {x : R n} (hx : x≠0) : principal x≠⊥ := by
  intro h; have e : x∈principal x := Ideal.mem_span_singleton_self _; rw [h] at e; exact hx e

include hn h2 in
lemma cross_mult {I B : Ideal (R n)} (hI : I≠⊥) (h : homothetic v (image hv I) (image hv B)) :
    ∃ m : ℕ, 0 < m ∧ ∃ x : R n, x≠0 ∧ principal x*I=principal (m:R n)*B := by
  obtain ⟨c,_,hc,e⟩ := h
  obtain ⟨m,hm,hM⟩ := int_pos_mem (by omega) I hI
  have hm' : (m:Q)≠0 := by intro h; have H:=congrArg QuaternionAlgebra.re h; change (m:ℚ)=0 at H; exact hm.ne' (by exact_mod_cast H)
  have hq : c*(m:Q)∈image hv B := by
    rw [←e]; exact Submodule.mem_span_singleton_mul.mpr ⟨_,⟨(m:R n),hM,map_natCast (embed n v hv) m⟩,rfl⟩
  obtain ⟨x,_,eq⟩ := (mem_image hv).mp hq
  refine ⟨m,hm,x,fun H => (mul_ne_zero hc hm') (by simpa [H] using eq.symm),image_injective hn hv ?_⟩
  rw [image_principal_mul hn h2 hv,image_principal_mul hn h2 hv,map_natCast,eq,←e,←mul_assoc,line_mul,Nat.cast_comm]

lemma scalar_class {I : Ideal (R n)} (hI : I≠⊥) {z : R n} (hz : z≠0) :
    cls hn h2 hv (mul_ne_bot (by omega) (nonzero_principal hz) hI)=cls hn h2 hv hI := by
  symm; apply (cls_eq ..).mpr
  refine ⟨embed n v hv z,center_image hv (principal z) ⟨z,Ideal.mem_span_singleton_self _,rfl⟩,?_,?_⟩
  · exact fun e => hz (embed_inj hn hv (e.trans (map_zero _).symm))
  · exact (image_principal_mul hn h2 hv z I).symm

theorem stable_rep {I : Ideal (R n)} (hI : I≠⊥)
    (h : cls hn h2 hv hI=cls hn h2 hv (conj_ne_bot hI)) :
    ∃ (B : Ideal (R n)) (hB : B≠⊥), conjugate B=B ∧ cls hn h2 hv hB=cls hn h2 hv hI := by
  obtain ⟨m,hm,x,hx,e⟩ := cross_mult hn h2 hv hI ((cls_eq ..).mp h)
  letI := domain (show 0<n by omega)
  have hm' : (m:R n)≠0 := Nat.cast_ne_zero.mpr hm.ne'
  have hN := congrArg normI e
  rw [normI_mul hn h2 (nonzero_principal hx) hI,normI_mul hn h2 (nonzero_principal hm') (conj_ne_bot hI),
    TunnellIntertwinerTheta.conj_norm hn h2 hI,normI_principal hn h2 hx,normI_principal hn h2 hm'] at hN
  have h' := Nat.mul_right_cancel (normI_positive (by omega) I hI) hN
  have hnorm : x.norm=((m:R n)).norm := by
    have h₁ := positive_norm (by omega) hx; have h₂ := positive_norm (by omega) hm'; omega
  have he : star x*x=(m:R n)*m := by
    rw [mul_comm (star x),←Zsqrtd.norm_eq_mul_conj,hnorm,Zsqrtd.norm_eq_mul_conj,star_natCast]
  by_cases hx' : x= -(m:R n)
  · rw [hx',principal,Ideal.span_singleton_neg] at e
    refine ⟨I,hI,?_,rfl⟩; exact ((Ideal.span_singleton_mul_right_inj hm').mp e).symm
  · let z : R n := x+m
    have hz : z≠0 := by simpa [z,add_eq_zero_iff_eq_neg] using hx'
    have hh : star z*x=(m:R n)*z := by rw [show star z=star x+m by simp [z],add_mul,he]; dsimp [z]; ring
    let B := principal z*I
    refine ⟨B,mul_ne_bot (by omega) (nonzero_principal hz) hI,?_,scalar_class hn h2 hv hI hz⟩
    apply (Ideal.span_singleton_mul_right_inj hm').mp
    change principal (m:R n)*conjugate (principal z*I)=principal (m:R n)*(principal z*I)
    calc _=principal (star z)*(principal (m:R n)*conjugate I) := by rw [conjugate_mul,principal_star]; ac_rfl
         _=principal (star z*x)*I := by rw [←e,principal_mul,mul_assoc]
         _=_ := by rw [hh,principal_mul,mul_assoc]

theorem stable_hnf {n : ℕ} (h2 : n%4=2) (s : Data n) (h : conjugate (ideal s)=ideal s) :
    s.b=0 ∧ s.a∣n := by
  have H := conj_mem _ (lift_basis s)
  rw [h] at H
  obtain ⟨k,hk⟩ := ((mem_ideal s _).mp H).2
  change (s.c:ℤ)*s.b-s.b*(-(s.c:ℤ))=s.c*s.a*k at hk
  have hc : (s.c:ℤ)≠0 := by exact_mod_cast s.pos_c.ne'
  have e : (2:ℤ)*s.b=s.a*k := mul_left_cancel₀ hc (by linear_combination hk)
  have hpos : (0:ℤ)<s.a := by exact_mod_cast s.pos_a
  have hlt : (s.b:ℤ)<s.a := by exact_mod_cast s.lt_b
  have hk0 : 0≤k := nonneg_of_mul_nonneg_right (by rw [←e]; positivity) hpos
  have hk2 : k<2 := by by_contra! hh; nlinarith [mul_le_mul_of_nonneg_left hh hpos.le]
  obtain ⟨C,hC⟩ := s.divides
  have hb : s.b=0 := by
    rcases (show k=0 ∨ k=1 by omega) with rfl|rfl
    · simp at e; exact e
    · simp only [mul_one] at e
      have hc := congrArg (fun x:ℤ => (x:ZMod 4)) hC
      push_cast at hc
      have hn4 : (n:ZMod 4)=2 := by apply ZMod.val_injective 4; rw [ZMod.val_natCast,h2]; decide
      have he' := congrArg (fun x:ℤ => (x:ZMod 4)) e
      push_cast at he'
      rw [hn4,←he'] at hc
      exact False.elim ((show ∀ x y:ZMod 4, x^2+2≠2*x*y by decide) _ _ hc)
  refine ⟨hb,Int.natCast_dvd_natCast.mp ⟨C,?_⟩⟩
  simpa [hb] using hC

end
end TunnellAmbiguousClass
#print axioms TunnellAmbiguousClass.stable_rep
#print axioms TunnellAmbiguousClass.stable_hnf
