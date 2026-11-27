import TunnellAmbiguousClass

/-! The two-torsion of the class group is covered by ramified ideals indexed by divisors of the odd part. -/
namespace TunnellRamifiedClasses
open TunnellIdealHNF TunnellIdealGenerators TunnellClassThetaCount TunnellToricClass TunnellShell TunnellEmbeddedIdeals
open TunnellProperClassGroup TunnellAmbiguousClass
noncomputable section

def ram (n a : ℕ) : Ideal (R n) := principal (a:R n) ⊔ principal Zsqrtd.sqrtd
lemma root_ne_zero (n : ℕ) : (Zsqrtd.sqrtd:R n)≠0 := by intro h; exact one_ne_zero (congrArg Zsqrtd.im h : (1:ℤ)=0)
lemma ram_ne_bot (n a : ℕ) : ram n a≠⊥ := by
  intro h; have he : principal (Zsqrtd.sqrtd:R n) ≤ ram n a := le_sup_right
  rw [h] at he
  exact nonzero_principal (root_ne_zero n) (le_bot_iff.mp he)

lemma hnf_eq {n : ℕ} (s : Data n) (hb : s.b=0) : ideal s = principal (s.c:R n)*ram n s.a := by
  rw [ram,Ideal.mul_sup,←principal_mul,←principal_mul]
  let x : R n := ⟨s.c*s.a,0⟩
  let y : R n := ⟨0,s.c⟩
  have ex : (s.c:R n)*s.a=x := by change (⟨s.c,0⟩:R n)*⟨s.a,0⟩=x; apply Zsqrtd.ext <;> simp [x,Zsqrtd.re_mul,Zsqrtd.im_mul]
  have ey : (s.c:R n)*Zsqrtd.sqrtd=y := by change (⟨s.c,0⟩:R n)*⟨0,1⟩=y; apply Zsqrtd.ext <;> simp [y,Zsqrtd.re_mul,Zsqrtd.im_mul]
  rw [ex,ey]
  apply le_antisymm
  · intro z hz
    obtain ⟨u,v,e⟩ := basis_expansion s hz
    have q : z=(u:R n)*x+(v:R n)*y := by
      rw [e,hb]; apply Zsqrtd.ext <;> simp [x,y,Zsqrtd.re_add,Zsqrtd.im_add,Zsqrtd.re_mul,Zsqrtd.im_mul] <;> ring
    rw [q]
    apply add_mem
    · exact (show principal x≤principal x ⊔ principal y from le_sup_left) (Ideal.mul_mem_left _ _ (Ideal.mem_span_singleton_self x))
    · exact (show principal y≤principal x ⊔ principal y from le_sup_right) (Ideal.mul_mem_left _ _ (Ideal.mem_span_singleton_self y))
  · apply sup_le
    · rw [principal,Ideal.span_singleton_le_iff_mem]; exact real_basis s
    · rw [principal,Ideal.span_singleton_le_iff_mem]
      simpa only [hb,Nat.cast_zero,mul_zero] using lift_basis s

lemma complement {n a b : ℕ} (e : n=a*b) :
    principal (Zsqrtd.sqrtd:R n)*ram n a=principal (a:R n)*ram n b := by
  rw [ram,ram,Ideal.mul_sup,Ideal.mul_sup,←principal_mul,←principal_mul,←principal_mul,←principal_mul]
  have he : (Zsqrtd.sqrtd:R n)*Zsqrtd.sqrtd= -((a:R n)*(b:R n)) := by
    rw [←Nat.cast_mul,←e]; apply Zsqrtd.ext <;> simp [Zsqrtd.re_mul,Zsqrtd.im_mul]
  rw [he,mul_comm (Zsqrtd.sqrtd:R n)]; simp only [principal,Ideal.span_singleton_neg,sup_comm]

variable {n : ℕ} (hn : Squarefree n) (h2 : n%4=2) {v : Triple} (hv : v∈shell n)

theorem inv_cls {I : Ideal (R n)} (hI : I≠⊥) : letI := group hn h2 hv
    (cls hn h2 hv hI)⁻¹=cls hn h2 hv (conj_ne_bot hI) := by
  letI := group hn h2 hv
  have he : conjugate I*I=principal (normI I:R n) := (mul_comm ..).trans (norm_conjugate hn h2 I hI)
  have hc : cls hn h2 hv (conj_ne_bot hI)*cls hn h2 hv hI=1 := by
    change mul hn h2 hv _ _=one hn h2 hv
    rw [cls_mul]
    have hN : (normI I:R n)≠0 := Nat.cast_ne_zero.mpr (normI_positive (by omega) I hI).ne'
    exact (cls_congr hn h2 hv he).trans (cls_principal hn h2 hv hN (nonzero_principal hN))
  exact (eq_inv_of_mul_eq_one_left hc).symm

theorem ram_classes_cover {d : ℕ} (hn : Squarefree (2*d)) (h2 : (2*d)%4=2) {v : Triple} (hv : v∈shell (2*d))
    (c : ProperIdealClass v) : letI := group hn h2 hv
    c⁻¹=c → ∃ a∈d.divisors, c=cls hn h2 hv (ram_ne_bot (2*d) a) := by
  letI := group hn h2 hv
  obtain ⟨I,hI,rfl⟩ := TunnellProperClassGroup.exists_rep hn h2 hv c
  rw [inv_cls hn h2 hv hI]; intro e
  obtain ⟨B,hB,hstable,e⟩ := stable_rep hn h2 hv hI e.symm
  obtain ⟨s,rfl⟩ := normal_form (by omega) hB
  obtain ⟨hb,ha⟩ := stable_hnf h2 s hstable
  have hc : (s.c:R (2*d))≠0 := Nat.cast_ne_zero.mpr s.pos_c.ne'
  have e' : cls hn h2 hv hI=cls hn h2 hv (ram_ne_bot (2*d) s.a) :=
    e.symm.trans ((cls_congr hn h2 hv (hnf_eq s hb)).trans (scalar_class hn h2 hv (ram_ne_bot _ _) hc))
  by_cases hodd : Odd s.a
  · have hc := Nat.coprime_two_right.mpr hodd
    exact ⟨s.a,Nat.mem_divisors.mpr ⟨hc.dvd_of_dvd_mul_left ha,by omega⟩,e'⟩
  · obtain ⟨k,hk⟩ := (even_iff_two_dvd.mp (Nat.not_odd_iff_even.mp hodd))
    obtain ⟨b,he⟩ := ha
    have he' : d=k*b := by rw [hk,mul_assoc] at he; omega
    have hA : (s.a:R (2*d))≠0 := Nat.cast_ne_zero.mpr s.pos_a.ne'
    refine ⟨b,Nat.mem_divisors.mpr ⟨⟨k,he'.trans (mul_comm _ _)⟩,by omega⟩,e'.trans ?_⟩
    exact (scalar_class hn h2 hv (ram_ne_bot _ _) (root_ne_zero _)).symm.trans
      ((cls_congr hn h2 hv (complement he)).trans (scalar_class hn h2 hv (ram_ne_bot _ _) hA))

end
end TunnellRamifiedClasses
#print axioms TunnellRamifiedClasses.ram_classes_cover
