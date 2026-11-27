import TunnellOddGlueCoordinates

/-! Integral bases of the normalized binary ideal form, with a unit leading coefficient at a chosen ramified prime. -/
namespace TunnellIdealFormBasis
open TunnellIdealHNF TunnellOddDiscriminant TunnellIdealThetaExpansion TunnellGenusCharacter
noncomputable section
variable {n p : ℕ}

def basisPoint (s : Data n) (x : ℤ×ℤ) : R n := ⟨s.c*(s.a*x.1+s.b*x.2),s.c*x.2⟩

lemma basis_mem (s : Data n) (x : ℤ×ℤ) : basisPoint s x∈ideal s := by
  apply (mem_ideal _ _).mpr
  exact ⟨⟨x.2,rfl⟩,⟨x.1,by dsimp [basisPoint]; ring⟩⟩

def basisHom (s : Data n) : (ℤ×ℤ) →+ ideal s where
  toFun x := ⟨basisPoint s x,basis_mem s x⟩
  map_zero' := Subtype.ext (Zsqrtd.ext (by simp [basisPoint]) (by simp [basisPoint]))
  map_add' x y := by apply Subtype.ext; apply Zsqrtd.ext <;> dsimp [basisPoint] <;> ring

def basis (s : Data n) : (ℤ×ℤ) ≃+ ideal s := by
  apply AddEquiv.ofBijective (basisHom s)
  refine ⟨?_,?_⟩
  · intro x y e
    have ex := congrArg (fun w : ideal s => w.val.re) e
    have ey := congrArg (fun w : ideal s => w.val.im) e
    change (s.c:ℤ)*(s.a*x.1+s.b*x.2)=s.c*(s.a*y.1+s.b*y.2) at ex
    change (s.c:ℤ)*x.2=s.c*y.2 at ey
    have hc : (s.c:ℤ)≠0 := by exact_mod_cast s.pos_c.ne'
    have ha : (s.a:ℤ)≠0 := by exact_mod_cast s.pos_a.ne'
    have hy := mul_left_cancel₀ hc ey
    rw [hy] at ex
    exact Prod.ext (mul_left_cancel₀ ha (add_right_cancel (mul_left_cancel₀ hc ex))) hy
  · rintro ⟨x,hx⟩; obtain ⟨u,v,e⟩ := basis_expansion s hx; exact ⟨(u,v),Subtype.ext e.symm⟩

lemma basis_norm (s : Data n) (C : ℤ) (hC : (s.b:ℤ)^2+n=s.a*C) (x : ℤ×ℤ) :
    (basis s x).val.norm=(normI (ideal s):ℤ)*quad (s.a:ℤ) s.b C x := by
  rw [normI,quotient_card]; change (s.c:ℤ)*(s.a*x.1+s.b*x.2)*(s.c*(s.a*x.1+s.b*x.2))- -(n:ℤ)*(s.c*x.2)*(s.c*x.2)=_
  unfold quad; push_cast; linear_combination (s.c:ℤ)^2*x.2^2*hC

structure LocalBasis (p : ℕ) [Fact p.Prime] (I : Ideal (R n)) where
  A : ℤ
  B : ℤ
  C : ℤ
  det : A*C-B^2=n
  unit : (A:ZMod p)≠0
  basis : (ℤ×ℤ) ≃+ I
  norm : ∀ x, (basis x).val.norm=(normI I:ℤ)*quad A B C x

variable [Fact p.Prime]

theorem exists_basis (hn : Squarefree n) (h2 : n%4=2) (hp : p∣n) (hp2 : p≠2) {I : Ideal (R n)} (hI : I≠⊥) :
    ∃ L : LocalBasis p I, charI (p:=p) hn h2 hI=quadraticChar (ZMod p) (L.A:ZMod p) := by
  obtain ⟨A,B,C,hdet,hu,hχ,s,rfl,rfl,hac⟩ := coefficient hn h2 hp hp2 hI
  rcases hac with h|h
  · refine ⟨⟨A,s.b,C,hdet,hu,basis s,?_⟩,hχ⟩
    intro x; rw [h]; apply basis_norm
    rw [←h]; linear_combination -hdet
  · refine ⟨⟨A,s.b,C,hdet,hu,AddEquiv.prodComm.trans (basis s),?_⟩,hχ⟩
    intro x
    change (basis s (x.2,x.1)).val.norm=_
    rw [basis_norm s A (by rw [←h]; linear_combination -hdet)]
    rw [h]; unfold quad; ring

end
end TunnellIdealFormBasis
#print axioms TunnellIdealFormBasis.exists_basis

