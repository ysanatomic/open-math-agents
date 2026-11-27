import TunnellRectangularClasses
import TunnellRectangularIdeal

/-! Fourier terms of a rectangular packet product indexed by actual quadratic ideal numerators. -/
namespace TunnellRectangularNumerator
open TunnellIdealHNF TunnellUniformBasis TunnellOddDiscriminant TunnellOddGlueCoordinates TunnellRamifiedLines TunnellGluePacket
open TunnellIntegralPacket TunnellRectangularClasses TunnellRectangularIdeal TunnellIdealThetaExpansion TunnellIdealFormBasis
open scoped Classical
noncomputable section
variable {d : ℕ}

def shifted (a : ℕ) (b s : ℤ) (x : ℤ×ℤ) := (-b*s+(d:ℤ)*x.1,(a:ℤ)*s+d*x.2)
lemma injective_shift (hd : d≠0) (a : ℕ) (b s : ℤ) : Function.Injective (shifted (d:=d) a b s) := by
  rintro ⟨w,x⟩ ⟨y,z⟩ he; have h₁ := congrArg Prod.fst he; have h₂ := congrArg Prod.snd he
  have h : (d:ℤ)≠0 := by exact_mod_cast hd
  exact Prod.ext (mul_left_cancel₀ h (add_left_cancel h₁)) (mul_left_cancel₀ h (add_left_cancel h₂))

lemma selected_range (a : ℕ) (b s : ℤ) (x : ℤ×ℤ) :
    selected a b (s:ZMod d) x ↔ x∈Set.range (shifted (d:=d) a b s) := by
  constructor
  · rintro ⟨h₁,h₂⟩
    have e₁ : ((-b*s:ℤ):ZMod d)=x.1 := by push_cast; exact h₁.symm
    have e₂ : (((a:ℤ)*s:ℤ):ZMod d)=x.2 := by push_cast; exact h₂.symm
    obtain ⟨u,hu⟩ := (ZMod.intCast_eq_intCast_iff_dvd_sub _ _ _).mp e₁
    obtain ⟨v,hv⟩ := (ZMod.intCast_eq_intCast_iff_dvd_sub _ _ _).mp e₂
    exact ⟨(u,v),Prod.ext (by dsimp [shifted]; omega) (by dsimp [shifted]; omega)⟩
  · rintro ⟨⟨u,v⟩,rfl⟩; simp [selected,shifted]

def elementTerm {I : Ideal (R (2*d))} (κ : ℕ) (z : ℂ) (x : I) :=
  Complex.exp (2*Real.pi*Complex.I*z*κ*(valence x:ℂ)/(d:ℂ)^2)

lemma term_eq {I : Ideal (R (2*d))} (hn : Squarefree (2*d)) (h2 : (2*d)%4=2) (hI : I≠⊥) (L : TunnellUniformBasis.Basis d I)
    (κ : ℕ) (s : ℤ) (z : ℂ) (x : ℤ×ℤ) :
    elementTerm κ z (L.basis (shifted (d:=d) L.a L.b s x))=term d L.a κ L.b s z x := by
  let i := L.basis (shifted (d:=d) L.a L.b s x)
  have he := L.norm (shifted (d:=d) L.a L.b s x)
  rw [TunnellGenusCharacter.norm_valZ hn h2 hI] at he
  have hv : (valence i:ℤ)=quad (L.a:ℤ) L.b L.c (shifted (d:=d) L.a L.b s x) := by
    rw [mul_comm] at he
    exact mul_left_cancel₀ (by exact_mod_cast (normI_positive (by omega) I hI).ne' : (normI I:ℤ)≠0) he
  have hv' := congrArg (fun t:ℤ => (t:ℂ)) hv; simp only [quad,shifted] at hv'; push_cast at hv'
  have det := congrArg (fun t:ℤ => (t:ℂ)) L.det; push_cast at det
  unfold elementTerm term; congr 1
  change 2*Real.pi*Complex.I*z*κ*(valence i:ℂ)/(d:ℂ)^2=_
  rw [hv']; push_cast
  have hd : (d:ℂ)≠0 := by exact_mod_cast (show d≠0 by omega)
  have ha : (L.a:ℂ)≠0 := by exact_mod_cast L.pos.ne'
  field_simp
  linear_combination (κ:ℂ)*z*((L.a:ℂ)*s+d*x.2)^2*det

theorem coset {I : Ideal (R (2*d))} (hn : Squarefree (2*d)) (h2 : (2*d)%4=2) (hI : I≠⊥)
    (L : TunnellUniformBasis.Basis d I) (κ : ℕ) [NeZero κ] (s : ZMod d) {z : ℂ} (hz : 0<z.im) :
    letI : NeZero d := ⟨by omega⟩
    letI : NeZero L.a := ⟨L.pos.ne'⟩
    HasSum (fun x : I => if selected L.a L.b s (L.basis.symm x) then elementTerm κ z x else 0) (rect d L.a κ L.b s.val z) := by
  classical
  letI : NeZero d := ⟨by omega⟩
  letI : NeZero L.a := ⟨L.pos.ne'⟩
  apply L.basis.toEquiv.hasSum_iff.mp
  apply ((injective_shift (NeZero.ne d) L.a L.b (s.val:ℤ)).hasSum_iff ?_).mp
  · apply (translated d L.a κ L.b s.val hz).congr_fun
    intro x
    have he : selected L.a L.b s (shifted (d:=d) L.a L.b s.val x) := by
      have H := (selected_range (d:=d) L.a L.b s.val (shifted (d:=d) L.a L.b s.val x)).mpr ⟨x,rfl⟩
      simpa using H
    change (if selected L.a L.b s (L.basis.symm (L.basis (shifted (d:=d) L.a L.b s.val x))) then elementTerm κ z (L.basis (shifted (d:=d) L.a L.b s.val x)) else 0)=_
    rw [L.basis.symm_apply_apply,if_pos he]
    exact term_eq hn h2 hI L κ s.val z x
  · intro x hx; simp only [Function.comp_apply,AddEquiv.coe_toEquiv,AddEquiv.symm_apply_apply]
    apply if_neg; intro he; apply hx; apply (selected_range _ _ _ _).mp
    simpa using he

end
end TunnellRectangularNumerator
#print axioms TunnellRectangularNumerator.coset

