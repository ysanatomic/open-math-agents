import TunnellClassThetaCount

/-! The proper ideal classes parametrizing Hurwitz embeddings form the ordinary quadratic ideal class group. -/
namespace TunnellProperClassGroup
open TunnellIdealHNF TunnellIdealGenerators TunnellClassThetaCount TunnellToricClass TunnellShell TunnellEmbeddedIdeals TunnellHurwitz
noncomputable section

variable {n : ℕ} (hn : Squarefree n) (h2 : n%4=2) {v : Triple} (hv : v∈shell n)

def cls {I : Ideal (R n)} (hI : I≠⊥) : ProperIdealClass v :=
  Quotient.mk _ (integralEquiv hn h2 hv ⟨I,hI⟩)

lemma cls_congr {I B : Ideal (R n)} {hI : I≠⊥} {hB : B≠⊥} (e : I=B) : cls hn h2 hv hI=cls hn h2 hv hB := by cases e; rfl

lemma cls_eq {I B : Ideal (R n)} (hI : I≠⊥) (hB : B≠⊥) :
    cls hn h2 hv hI=cls hn h2 hv hB ↔ homothetic v (image hv I) (image hv B) := Quotient.eq

lemma exists_rep (c : ProperIdealClass v) : ∃ (I : Ideal (R n)) (hI : I≠⊥), cls hn h2 hv hI=c := by
  refine ⟨preimage hv c.out,preimage_ne_bot hn h2 hv c.out,?_⟩
  calc _=Quotient.mk (idealSetoid v) c.out := congrArg (Quotient.mk (idealSetoid v)) (Subtype.ext (image_preimage hn h2 hv c.out))
       _=_ := Quotient.out_eq _

def mulI (A B : IntegralIdeal v) : IntegralIdeal v :=
  integralEquiv hn h2 hv ⟨preimage hv A*preimage hv B,mul_ne_bot (by omega) (preimage_ne_bot hn h2 hv A) (preimage_ne_bot hn h2 hv B)⟩

lemma val_mulI (A B : IntegralIdeal v) : (mulI hn h2 hv A B).val=A.val*B.val := by
  change image hv (preimage hv A*preimage hv B)=_
  rw [image_mul,image_preimage hn h2 hv A,image_preimage hn h2 hv B]

def mul : ProperIdealClass v → ProperIdealClass v → ProperIdealClass v :=
  Quotient.map₂ (mulI hn h2 hv) (by
    rintro A A' ⟨s,hs,hs₀,e⟩ B B' ⟨t,ht,ht₀,e'⟩
    change homothetic v (mulI hn h2 hv A B).val (mulI hn h2 hv A' B').val
    rw [val_mulI,val_mulI,←e,←e']
    refine ⟨s*t,(mul_C v) (Submodule.mul_mem_mul hs ht),mul_ne_zero hs₀ ht₀,?_⟩
    have ht' : line t≤C v := Submodule.span_le.mpr (Set.singleton_subset_iff.mpr ht)
    calc line (s*t)*(A.val*B.val)=line s*(line t*A.val)*B.val := by rw [←line_mul]; simp only [mul_assoc]
         _= _ := by rw [ideals_comm hn hv ht' A.property.2.1]; simp only [mul_assoc])

lemma cls_mul {I B : Ideal (R n)} (hI : I≠⊥) (hB : B≠⊥) :
    mul hn h2 hv (cls hn h2 hv hI) (cls hn h2 hv hB)=cls hn h2 hv (mul_ne_bot (by omega) hI hB) := by
  apply congrArg (Quotient.mk (idealSetoid v)); apply Subtype.ext
  rw [val_mulI]
  exact (image_mul hv I B).symm

def one : ProperIdealClass v := cls hn h2 hv (I:=⊤) top_ne_bot

lemma cls_principal {x : R n} (hx : x≠0) (hi : principal x≠⊥) : cls hn h2 hv hi=one hn h2 hv := by
  symm; apply (cls_eq ..).mpr
  refine ⟨embed n v hv x,center_image hv (principal x) ⟨x,Ideal.mem_span_singleton_self _,rfl⟩,?_,?_⟩
  · exact fun h => hx (embed_inj hn hv (h.trans (map_zero _).symm))
  · rw [principal,image_principal hn h2 hv,image_order hn h2 hv]

def inv (c : ProperIdealClass v) : ProperIdealClass v := cls hn h2 hv (conj_ne_bot (preimage_ne_bot hn h2 hv c.out))

lemma inv_mul (c : ProperIdealClass v) : mul hn h2 hv (inv hn h2 hv c) c=one hn h2 hv := by
  let A := preimage hv c.out
  have hA : A≠⊥ := preimage_ne_bot hn h2 hv c.out
  have e : cls hn h2 hv hA=c := by
    calc _ = Quotient.mk (idealSetoid v) c.out := congrArg _ (Subtype.ext (image_preimage hn h2 hv c.out))
         _ = _ := Quotient.out_eq _
  change mul hn h2 hv (cls hn h2 hv (conj_ne_bot hA)) c=_
  rw [←e,cls_mul]
  have hN : (normI A:R n)≠0 := Nat.cast_ne_zero.mpr (normI_positive (by omega) A hA).ne'
  have he : conjugate A*A=principal (normI A:R n) := (mul_comm ..).trans (norm_conjugate hn h2 A hA)
  have hi : principal (normI A:R n)≠⊥ := he ▸ mul_ne_bot (by omega) (conj_ne_bot hA) hA
  exact (cls_congr hn h2 hv he).trans (cls_principal hn h2 hv hN hi)

def group : CommGroup (ProperIdealClass v) where
  mul := mul hn h2 hv
  one := one hn h2 hv
  inv := inv hn h2 hv
  mul_assoc := by
    intro a b c
    change mul hn h2 hv (mul hn h2 hv a b) c=mul hn h2 hv a (mul hn h2 hv b c)
    obtain ⟨A,hA,rfl⟩ := exists_rep hn h2 hv a
    obtain ⟨B,hB,rfl⟩ := exists_rep hn h2 hv b
    obtain ⟨C,hC,rfl⟩ := exists_rep hn h2 hv c
    simp only [cls_mul]; exact cls_congr _ _ _ (mul_assoc ..)
  one_mul := by
    intro a; obtain ⟨A,hA,rfl⟩ := exists_rep hn h2 hv a
    change mul hn h2 hv (one hn h2 hv) (cls hn h2 hv hA)=_
    rw [one,cls_mul]; exact cls_congr _ _ _ (Ideal.top_mul _)
  mul_one := by
    intro a; obtain ⟨A,hA,rfl⟩ := exists_rep hn h2 hv a
    change mul hn h2 hv (cls hn h2 hv hA) (one hn h2 hv)=_
    rw [one,cls_mul]; exact cls_congr _ _ _ (Ideal.mul_top _)
  mul_comm := by
    intro a b
    change mul hn h2 hv a b=mul hn h2 hv b a
    obtain ⟨A,hA,rfl⟩ := exists_rep hn h2 hv a
    obtain ⟨B,hB,rfl⟩ := exists_rep hn h2 hv b
    simp only [cls_mul]; exact cls_congr _ _ _ (mul_comm ..)
  inv_mul_cancel := inv_mul hn h2 hv

end
end TunnellProperClassGroup
#print axioms TunnellProperClassGroup.group
