import TunnellIdealGenerators

/-! Each norm-m ideal in the inverse class contributes exactly two generators. -/
namespace TunnellIdealGenerators
open TunnellIdealHNF TunnellShell TunnellHurwitz TunnellToricClass TunnellEmbeddedIdeals
noncomputable section

abbrev Representations {n : ℕ} (I : Ideal (R n)) (m : ℕ) := {x : R n // x∈I ∧ x≠0 ∧ x.norm.toNat=m*normI I}
abbrev InverseClass {n : ℕ} {v : Triple} (hv : v∈shell n) (I : Ideal (R n)) (m : ℕ) :=
  {B : NormIdeals n m // homothetic v (image hv (conjugate I)) (image hv B.val)}

variable {n m : ℕ} {v : Triple} (hn : Squarefree n) (h2 : n%4=2) (hv : v∈shell n)
  {I : Ideal (R n)} (hI : I≠⊥)

def gen (b : InverseClass hv I m) : R n := ((inverse_class_iff hn h2 hv hI).mp b.property).choose
lemma gen_spec (b : InverseClass hv I m) :
    gen hn h2 hv hI b≠0 ∧ b.val.val*I=principal (gen hn h2 hv hI b) :=
  ((inverse_class_iff hn h2 hv hI).mp b.property).choose_spec

def mkRep (b : InverseClass hv I m) : Representations I m := ⟨gen hn h2 hv hI b,by
  obtain ⟨h₀,he⟩ := gen_spec hn h2 hv hI b
  refine ⟨Ideal.mul_le_right (I:=b.val.val) (J:=I) (he.symm ▸ Ideal.mem_span_singleton_self _),h₀,?_⟩
  rw [←normI_principal hn h2 h₀,←he,normI_mul hn h2 b.val.property.1 hI,show normI b.val.val=m from b.val.property.2]⟩

def repNeg (x : Representations I m) : Representations I m :=
  ⟨-x.val,I.neg_mem x.property.1,neg_ne_zero.mpr x.property.2.1,by simpa only [Zsqrtd.norm_neg] using x.property.2.2⟩

def pick (s : Bool) (b : InverseClass hv I m) : Representations I m :=
  if s then mkRep hn h2 hv hI b else repNeg (mkRep hn h2 hv hI b)

lemma pick_principal (s : Bool) (b : InverseClass hv I m) :
    principal (pick hn h2 hv hI s b).val=b.val.val*I := by
  have he := (gen_spec hn h2 hv hI b).2.symm
  cases s
  · exact (Ideal.span_singleton_neg _).trans he
  · exact he

def repIdeal (x : Representations I m) : InverseClass hv I m := by
  have he := divide_mul hn h2 hI x.property.1
  have hB : divide I x.val≠⊥ := by
    intro e; rw [e,Ideal.bot_mul] at he
    have h : x.val∈principal x.val := Ideal.mem_span_singleton_self _
    rw [←he] at h
    exact x.property.2.1 h
  have hnorm : normI (divide I x.val)*normI I=m*normI I := by
    rw [←normI_mul hn h2 hB hI,he,normI_principal hn h2 x.property.2.1,x.property.2.2]
  exact ⟨⟨divide I x.val,hB,Nat.mul_right_cancel (normI_positive (by omega) I hI) hnorm⟩,
    (inverse_class_iff hn h2 hv hI).mpr ⟨_,x.property.2.1,he⟩⟩

lemma neg_ne_self {x : R n} (hx : x≠0) : -x≠x := by
  intro e; apply hx; apply Zsqrtd.ext
  · have h := congrArg Zsqrtd.re e; change -x.re=x.re at h; change x.re=0; omega
  · have h := congrArg Zsqrtd.im e; change -x.im=x.im at h; change x.im=0; omega

def repEquiv : Bool × InverseClass hv I m ≃ Representations I m := by
  let f (t : Bool × InverseClass hv I m) := pick hn h2 hv hI t.1 t.2
  refine Equiv.ofBijective f ⟨?_,?_⟩
  · rintro ⟨s,b⟩ ⟨s',b'⟩ h
    have he := congrArg (fun x : Representations I m => principal x.val) h
    change principal (pick hn h2 hv hI s b).val=principal (pick hn h2 hv hI s' b').val at he
    rw [pick_principal,pick_principal] at he
    have eb : b=b' := Subtype.ext (Subtype.ext (mul_right_cancel_ideal hn h2 hI he))
    subst b'
    have ex := congrArg Subtype.val h
    obtain hs | hs := Bool.dichotomy s
    all_goals obtain hs' | hs' := Bool.dichotomy s'
    all_goals subst s; subst s'
    · rfl
    · exact False.elim (neg_ne_self (gen_spec hn h2 hv hI b).1 ex)
    · exact False.elim (neg_ne_self (gen_spec hn h2 hv hI b).1 ex.symm)
    · rfl
  · intro x
    let b := repIdeal hn h2 hv hI x
    have he : principal (gen hn h2 hv hI b)=principal x.val :=
      (gen_spec hn h2 hv hI b).2.symm.trans (divide_mul hn h2 hI x.property.1)
    rcases generator_sign (by omega) he with h|h
    · exact ⟨(true,b),Subtype.ext h.symm⟩
    · exact ⟨(false,b),Subtype.ext h.symm⟩

include hn h2 hI in
theorem classwise_count : Nat.card (Representations I m)=2*Nat.card (InverseClass hv I m) := by
  rw [←Nat.card_congr (repEquiv hn h2 hv hI),Nat.card_prod]
  simp

end
end TunnellIdealGenerators
#print axioms TunnellIdealGenerators.classwise_count
