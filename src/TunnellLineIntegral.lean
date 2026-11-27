import TunnellTraceChoices
import TunnellRectangularNumerator

/-! Integrality of the Fourier exponents attached to every isotropic line family. -/
namespace TunnellLineIntegral
open TunnellIdealHNF TunnellUniformBasis TunnellOddDiscriminant TunnellOddGlueCoordinates TunnellRamifiedLines TunnellGluePacket
open TunnellIntegralPacket TunnellRectangularClasses TunnellRectangularNumerator TunnellIdealThetaExpansion TunnellIdealFormBasis TunnellTraceChoices
noncomputable section
variable {d : ℕ} {I J : Ideal (R (2*d))}
private instance prime (i : P d) : Fact i.val.Prime := ⟨Nat.prime_of_mem_primeFactors i.property⟩

def canonical (hs : Squarefree d) (L : TunnellUniformBasis.Basis d I) (x : I) : ZMod d :=
  (redEquiv hs).symm (fun i => coordinate (L.atPrime i) x)

lemma can_apply (hs : Squarefree d) (L : TunnellUniformBasis.Basis d I) (x : I) (i : P d) :
    reduce i (canonical hs L x)=coordinate (L.atPrime i) x := congrFun ((redEquiv hs).apply_symm_apply _) i

lemma selected_can (hs : Squarefree d) (L : TunnellUniformBasis.Basis d I) (x : I) (s : ZMod d) :
    selected L.a L.b s (L.basis.symm x) ↔ s=canonical hs L x ∧ ∀ i : P d, admissible (L.atPrime i) x := by
  rw [selected_iff hs]; constructor
  · intro h; refine ⟨red_ext hs (fun i => ?_),fun i => (h i).1⟩
    exact ((h i).2).symm.trans (can_apply hs L x i).symm
  · rintro ⟨rfl,h⟩ i; exact ⟨h i,(can_apply hs L x i).symm⟩

lemma shift_value (hn : Squarefree (2*d)) (h2 : (2*d)%4=2) (hI : I≠⊥) (L : TunnellUniformBasis.Basis d I)
    (s : ℤ) (w : ℤ×ℤ) :
    (valence (L.basis (shifted (d:=d) L.a L.b s w)):ℤ)=
      (2*(d:ℤ))*L.a*s^2+(d:ℤ)^2*(quad (L.a:ℤ) L.b L.c w+4*s*w.2) := by
  let x := shifted (d:=d) L.a L.b s w
  have h := L.norm x; rw [TunnellGenusCharacter.norm_valZ hn h2 hI,mul_comm] at h
  have e := mul_left_cancel₀ (by exact_mod_cast (normI_positive (by omega) I hI).ne' : (normI I:ℤ)≠0) h
  change (valence (L.basis x):ℤ)=_
  rw [e]; dsimp [shifted,quad,x]; linear_combination ((L.a:ℤ)*s^2+2*(d:ℤ)*s*w.2)*L.det

def aligned (r : (i : P d) → ZMod i.val) (w : ZMod d×ZMod d) := ∀ i:P d, reduce i w.1=r i*reduce i w.2

lemma integral (hs : Squarefree d) (hn : Squarefree (2*d)) (h2 : (2*d)%4=2) (hI : I≠⊥) (hJ : J≠⊥)
    (U : TunnellUniformBasis.Basis d I) (V : TunnellUniformBasis.Basis d J) (r : Roots (parameter U.atPrime V.atPrime))
    {x : I×J} (hg : good U.atPrime V.atPrime x) (hl : packet U.atPrime V.atPrime x∈linePacket r.val) :
    (d:ℤ)^2∣value x := by
  letI : NeZero d := ⟨hs.ne_zero⟩
  let s := canonical hs U x.1; let t := canonical hs V x.2
  have hs' : selected U.a U.b ((s.val:ℤ):ZMod d) (U.basis.symm x.1) := by
    rw [Int.cast_natCast,ZMod.natCast_zmod_val,selected_can hs]; exact ⟨rfl,fun i => (hg i).1⟩
  have ht' : selected V.a V.b ((t.val:ℤ):ZMod d) (V.basis.symm x.2) := by
    rw [Int.cast_natCast,ZMod.natCast_zmod_val,selected_can hs]; exact ⟨rfl,fun i => (hg i).2⟩
  obtain ⟨w,ew⟩ := (selected_range ..).mp hs'
  obtain ⟨z,ez⟩ := (selected_range ..).mp ht'
  have e₁ := shift_value hn h2 hI U s.val w; have e₂ := shift_value hn h2 hJ V t.val z
  rw [ew,U.basis.apply_symm_apply] at e₁
  rw [ez,V.basis.apply_symm_apply] at e₂
  have hT : (d:ℤ)∣(U.a:ℤ)*(s.val:ℤ)^2+4*V.a*(t.val:ℤ)^2 := by
    apply int_dvd hs; intro i
    apply (ZMod.intCast_zmod_eq_zero_iff_dvd _ _).mp
    have hsl := hl i
    change coordinate (U.atPrime i) x.1=r.val i*coordinate (V.atPrime i) x.2 at hsl
    have es : ((s.val:ℕ):ZMod i.val)=coordinate (U.atPrime i) x.1 := by
      have e : reduce i ((s.val:ℕ):ZMod d)=coordinate (U.atPrime i) x.1 := by rw [ZMod.natCast_zmod_val]; exact can_apply .. 
      rwa [map_natCast] at e
    have et : ((t.val:ℕ):ZMod i.val)=coordinate (V.atPrime i) x.2 := by
      have e : reduce i ((t.val:ℕ):ZMod d)=coordinate (V.atPrime i) x.2 := by rw [ZMod.natCast_zmod_val]; exact can_apply ..
      rwa [map_natCast] at e
    have hU : (U.a:ZMod i.val)≠0 := by simpa [Basis.atPrime] using (U.atPrime i).unit
    have hf : r.val i^2= -(4:ZMod i.val)*V.a/U.a := by simpa [parameter,Basis.atPrime] using r.property i
    push_cast; rw [es,et,hsl,mul_pow,hf]; field_simp; ring
  obtain ⟨k,hk⟩ := hT
  refine ⟨2*k+quad (U.a:ℤ) U.b U.c w+4*s.val*w.2+4*(quad (V.a:ℤ) V.b V.c z+4*t.val*z.2),?_⟩
  unfold value; rw [e₁,e₂]; linear_combination (2*(d:ℤ))*hk

end
end TunnellLineIntegral
#print axioms TunnellLineIntegral.integral

