import TunnellPrincipalGenus

/-! The two quadratic components of a pair have one preimage for each ambiguous class. -/
namespace TunnellComponentFibers
open TunnellProperClassGroup TunnellGenusMap TunnellPrincipalGenus TunnellShell TunnellToricClass
noncomputable section

variable {G : Type*} [CommGroup G]
def components (C : G) (t : G×G) := (t.1/t.2,t.1*t.2*C)
def diff (C s t : G) := t/(s*C)

def kernelEquiv {r u : G} (hu : u^2=r) : {a : G // a^2=r} ≃ (powMonoidHom (α:=G) 2).ker where
  toFun a := ⟨a.val/u,by change (a.val/u)^2=1; rw [div_pow,a.property,hu]; simp⟩
  invFun x := ⟨x.val*u,by
    have he : x.val^2=1 := x.property
    rw [mul_pow,he,one_mul,hu]⟩
  left_inv x := Subtype.ext (div_mul_cancel _ _)
  right_inv x := Subtype.ext (mul_div_cancel_right _ _)

def fiberEquiv (C s t : G) : {u : G×G // components C u=(s,t)} ≃ {b : G // b^2=diff C s t} where
  toFun a := ⟨a.val.2,by
    have e₁ := congrArg Prod.fst a.property
    have e₂ := congrArg Prod.snd a.property
    change a.val.1/a.val.2=s at e₁; change a.val.1*a.val.2*C=t at e₂
    have H : a.val.2^2=(a.val.1*a.val.2*C)/(a.val.1/a.val.2*C) := by
      apply eq_div_iff_mul_eq'.mpr
      calc _=(a.val.2/a.val.2)*a.val.1*a.val.2*C := by simp only [div_eq_mul_inv,pow_two]; ac_rfl
           _=_ := by simp
    exact H.trans (congrArg₂ (fun t s => t/(s*C)) e₂ e₁)⟩
  invFun x := ⟨(s*x.val,x.val),by
    have e := x.property; unfold diff at e
    apply Prod.ext
    · dsimp [components]; simp
    · change s*x.val*x.val*C=t
      calc _=(x.val^2)*(s*C) := by rw [pow_two]; ac_rfl
           _=_ := by rw [e,div_mul_cancel]⟩
  left_inv a := by
    apply Subtype.ext; change (s*a.val.2,a.val.2)=a.val; refine Prod.ext ?_ (show a.val.2=a.val.2 from rfl)
    have e := congrArg Prod.fst a.property
    change a.val.1/a.val.2=s at e; change s*a.val.2=a.val.1; exact (congrArg (fun z => z*a.val.2) e.symm).trans (div_mul_cancel _ _)
  right_inv _ := rfl

theorem count {d : ℕ} (hsq : Squarefree d) (hn : Squarefree (2*d)) (hd : d%4=1) (h2 : (2*d)%4=2) {v : Triple} (hv : v∈shell (2*d))
    (C s t : ProperIdealClass v) : letI := group hn h2 hv
    Nat.card {a : ProperIdealClass v × ProperIdealClass v // components C a=(s,t)}=
      if genus hn h2 hv (diff C s t)=1 then 2^d.primeFactors.card else 0 := by
  letI := group hn h2 hv
  have H := principal_genus hsq hn hd h2 hv
  rw [Nat.card_congr (fiberEquiv C s t)]
  split_ifs with h
  · have hh : diff C s t∈(genus hn h2 hv).ker := h
    rw [←H.1] at hh
    obtain ⟨u,hu⟩ := hh
    exact (Nat.card_congr (kernelEquiv hu)).trans H.2
  · have he : IsEmpty {b : ProperIdealClass v // b^2=diff C s t} := ⟨fun x => h (by
      change diff C s t∈(genus hn h2 hv).ker
      rw [←H.1]; exact ⟨x.val,x.property⟩)⟩
    letI := he
    simp

end
end TunnellComponentFibers
#print axioms TunnellComponentFibers.count
