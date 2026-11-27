import TunnellIdealThetaExpansion
import TunnellRankinUnfold

/-! The class theta series, its Fourier expansion, and its Fricke transformation. -/
namespace TunnellClassThetaExpansion
open TunnellIdealGenerators TunnellIdealHNF TunnellIdealTheta TunnellClassThetaCount TunnellIdealThetaExpansion
open TunnellShell TunnellToricClass TunnellToric Complex
open scoped Classical
noncomputable section

variable {n : ℕ} {I : Ideal (R n)} (hn : Squarefree n) (h2 : n%4=2) (hI : I≠⊥)

def thetaI (I : Ideal (R n)) (z : ℂ) : ℂ := ∑' x : I, normTerm I z x

lemma thetaI_hasSum (hn' : 0<n) (hI : I≠⊥) {z : ℂ} (hz : 0<z.im) :
    HasSum (normTerm I z) (thetaI I z) := by
  obtain ⟨s,rfl⟩ := normal_form hn' hI
  exact (hnf_hasSum s hn' hz).summable.hasSum

include hn h2 hI in
lemma valence_zero (x : I) : valence x=0 ↔ x.val=0 := by
  constructor
  · intro h; by_contra e
    have eq := norm_valence hn h2 hI x
    rw [h,zero_mul] at eq
    have H := positive_norm (by omega) e
    omega
  · intro h; simp [valence,h,Zsqrtd.norm_zero]

def finiteRep (m : ℕ) (hm : 0 < m) {v : Triple} (hv : v∈shell n) : Finite (Representations I m) := by
  letI := Fintype.ofEquiv (finiteRoot n m) ((divisorEquiv hm).symm.trans (indexedEquiv (by omega)))
  exact Finite.of_equiv _ (repEquiv hn h2 hv hI)

def fiberRep {m : ℕ} (hm : 0 < m) : {x : I // valence x=m} ≃ Representations I m where
  toFun u := ⟨u.val.val,u.val.property,fun e => hm.ne' (u.property.symm.trans ((valence_zero hn h2 hI _).mpr e)),
    (norm_valence hn h2 hI u.val).trans (by rw [u.property])⟩
  invFun x := ⟨⟨x.val,x.property.1⟩,by
    change x.val.norm.toNat/normI I=m
    rw [x.property.2.2,Nat.mul_div_cancel _ (normI_positive (by omega) I hI)]⟩
  left_inv _ := rfl
  right_inv _ := rfl

def fiberZero : {x : I // valence x=0} ≃ Unit where
  toFun _ := ()
  invFun _ := ⟨0,(valence_zero hn h2 hI _).mpr rfl⟩
  left_inv x := Subtype.ext (Subtype.ext (((valence_zero hn h2 hI x.val).mp x.property).symm))
  right_inv _ := rfl

def thetaCoeff (I : Ideal (R n)) (m : ℕ) := if m=0 then 1 else Nat.card (Representations I m)

include hn h2 hI in
lemma normTerm_fiber {m : ℕ} {z : ℂ} (x : {x : I // valence x=m}) :
    normTerm I z x.val = (Function.Periodic.qParam 1 z)^m := by
  have H := norm_valence hn h2 hI x.val
  rw [x.property] at H
  have e : x.val.val.norm=(m:ℤ)*normI I := by
    have H' : (x.val.val.norm.toNat:ℤ)=(m:ℤ)*normI I := by exact_mod_cast H
    rwa [Int.toNat_of_nonneg (Zsqrtd.norm_nonneg (by omega) _)] at H'
  have hN : (normI I:ℂ)≠0 := by exact_mod_cast (normI_positive (by omega) I hI).ne'
  rw [normTerm,e,Function.Periodic.qParam,←Complex.exp_nat_mul]
  congr 1
  push_cast
  field_simp <;> ring

include hn h2 hI in
theorem thetaI_expansion {v : Triple} (hv : v∈shell n) {z : ℂ} (hz : 0<z.im) :
    HasSum (fun m : ℕ => (thetaCoeff I m:ℂ)*(Function.Periodic.qParam 1 z)^m) (thetaI I z) := by
  have H := ((Equiv.sigmaFiberEquiv (@valence n I)).hasSum_iff).mpr (thetaI_hasSum (by omega) hI hz)
  apply H.sigma
  intro m
  let F := {x : I // valence x=m}
  have Hf : Finite F := by
    by_cases hm : m=0
    · subst m; exact Finite.of_equiv Unit (fiberZero hn h2 hI).symm
    · letI := finiteRep hn h2 hI m (Nat.pos_of_ne_zero hm) hv
      exact Finite.of_equiv _ (fiberRep hn h2 hI (Nat.pos_of_ne_zero hm)).symm
  letI := Fintype.ofFinite F
  have hc : Nat.card F=thetaCoeff I m := by
    by_cases hm : m=0
    · subst m; rw [Nat.card_congr (fiberZero hn h2 hI)]; simp [thetaCoeff]
    · simpa [thetaCoeff,hm] using Nat.card_congr (fiberRep hn h2 hI (Nat.pos_of_ne_zero hm))
  have hfin := hasSum_fintype (fun _ : F => (Function.Periodic.qParam 1 z)^m)
  simp only [Finset.sum_const,Finset.card_univ,nsmul_eq_mul,←Nat.card_eq_fintype_card,hc] at hfin
  exact hfin.congr_fun (fun x => normTerm_fiber hn h2 hI x)


end
end TunnellClassThetaExpansion
#print axioms TunnellClassThetaExpansion.thetaI_expansion
