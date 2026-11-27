import TunnellClassThetaCount
import TunnellIdealTheta

/-! The analytic HNF theta series enumerates elements of a given ideal by their normalized norm. -/
namespace TunnellIdealThetaExpansion
open TunnellIdealGenerators TunnellIdealHNF TunnellIdealTheta TunnellClassThetaCount
open TunnellShell TunnellToricClass TunnellToric Complex
open scoped Classical
noncomputable section

variable {n : ℕ}
def normTerm (I : Ideal (R n)) (z : ℂ) (x : I) :=
  Complex.exp (2*Real.pi*Complex.I*z*((x.val.norm:ℤ):ℂ)/normI I)

lemma admit_iff (s : Data n) (u : ℤ×ℤ) :
    admitted s.a (s.b:ℤ) u ↔ (s.a:ℤ)∣u.2-s.b*u.1 := by
  unfold admitted
  rw [← Int.cast_mul, ZMod.intCast_eq_intCast_iff_dvd_sub,dvd_sub_comm]
  
def point (s : Data n) (u : ℤ×ℤ) : R n := ⟨(s.c:ℤ)*u.2,(s.c:ℤ)*u.1⟩

lemma point_mem (s : Data n) {u : ℤ×ℤ} (hu : admitted s.a (s.b:ℤ) u) : point s u∈ideal s := by
  obtain ⟨t,ht⟩ := (admit_iff s u).mp hu
  refine (mem_ideal s _).mpr ⟨⟨u.1,rfl⟩,⟨t,?_⟩⟩
  dsimp only [point]; linear_combination s.c*ht

def pointEquiv (s : Data n) : {u : ℤ×ℤ // admitted s.a (s.b:ℤ) u} ≃ ideal s := by
  let f (u : {u : ℤ×ℤ // admitted s.a (s.b:ℤ) u}) : ideal s := ⟨point s u.val,point_mem s u.property⟩
  refine Equiv.ofBijective f ⟨?_,?_⟩
  · intro a b e
    have e₁ := congrArg (fun t : ideal s => t.val.re) e
    have e₂ := congrArg (fun t : ideal s => t.val.im) e
    have hc : (s.c:ℤ)≠0 := by exact_mod_cast s.pos_c.ne'
    exact Subtype.ext (Prod.ext (mul_left_cancel₀ hc e₂) (mul_left_cancel₀ hc e₁))
  · rintro ⟨x,hx⟩
    obtain ⟨u,v,e⟩ := basis_expansion s hx
    refine ⟨⟨(v,s.a*u+s.b*v),(admit_iff s _).mpr ⟨u,by dsimp only; ring⟩⟩,Subtype.ext ?_⟩
    exact e.symm

lemma point_term (s : Data n) (z : ℂ) (u : {u : ℤ×ℤ // admitted s.a (s.b:ℤ) u}) :
    normTerm (ideal s) z (pointEquiv s u)=term n s.a z u.val := by
  have hc : (s.c:ℂ)≠0 := by exact_mod_cast s.pos_c.ne'
  have ha : (s.a:ℂ)≠0 := by exact_mod_cast s.pos_a.ne'
  rw [normTerm,term,normI,quotient_card]
  change Complex.exp (_ * (((s.c:ℤ)*u.val.2*((s.c:ℤ)*u.val.2) - -(n:ℤ)*((s.c:ℤ)*u.val.1)*((s.c:ℤ)*u.val.1):ℤ) : ℂ)/ _) = _
  congr 1
  push_cast
  field_simp
  ring

theorem hnf_hasSum (s : Data n) (hn : 0<n) {z : ℂ} (hz : 0<z.im) :
    letI : NeZero s.a := ⟨s.pos_a.ne'⟩
    HasSum (normTerm (ideal s) z) (theta n s.a s.b z) := by
  letI : NeZero s.a := ⟨s.pos_a.ne'⟩
  letI : NeZero n := ⟨hn.ne'⟩
  have h := theta_hasSum n s.a (s.b:ℤ) hz
  apply (pointEquiv s).hasSum_iff.mp
  apply HasSum.congr_fun _ (fun u => point_term s z u)
  apply (hasSum_subtype_iff_indicator (f:=term n s.a z) (s:={u : ℤ×ℤ | admitted s.a (s.b:ℤ) u})).mpr
  exact h

def valence {I : Ideal (R n)} (x : I) := x.val.norm.toNat/normI I

lemma norm_valence (hn : Squarefree n) (h2 : n%4=2) {I : Ideal (R n)} (hI : I≠⊥) (x : I) :
    x.val.norm.toNat=valence x*normI I := by
  have hpos := normI_positive (by omega) I hI
  by_cases hx : x.val=0
  · simp [valence,hx,Zsqrtd.norm_zero]
  · have he := divide_mul hn h2 hI x.property
    have hB : divide I x.val≠⊥ := by
      intro e; rw [e,Ideal.bot_mul] at he
      have H : x.val∈principal x.val := Ideal.mem_span_singleton_self _
      rw [←he] at H
      exact hx H
    have eq : x.val.norm.toNat=normI (divide I x.val)*normI I := by
      rw [←normI_principal hn h2 hx,←he,normI_mul hn h2 hB hI]
    simp [valence,eq,Nat.mul_div_cancel _ hpos]

end
end TunnellIdealThetaExpansion
#print axioms TunnellIdealThetaExpansion.hnf_hasSum
