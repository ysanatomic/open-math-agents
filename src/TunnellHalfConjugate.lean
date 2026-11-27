import Mathlib.NumberTheory.ModularForms.CongruenceSubgroups
import Mathlib.Tactic.FinCases
import Mathlib.Tactic.LinearCombination
import Mathlib.Tactic.NormNum

/-! Translation by one half normalizes the conductor-32 subgroup and negates its eta form. -/
namespace TunnellHalfNormalizer
open Matrix MatrixGroups ModularGroup CongruenceSubgroup
noncomputable section

def tau (s : ℤ) : SL(2,ℝ) := ⟨!![1,(s:ℝ)/2;0,1],by simp [Matrix.det_fin_two]⟩

lemma tau_neg (s : ℤ) : tau (-s)*tau s=1 := by
  apply Subtype.ext
  change !![(1:ℝ),((-s:ℤ):ℝ)/2;0,1]*!![1,(s:ℝ)/2;0,1]=1
  ext i j
  fin_cases i <;> fin_cases j <;> norm_num [Matrix.mul_fin_two,Matrix.one_apply] <;> ring

lemma model (g : Gamma0 32) : ∃ a b k l : ℤ, g.val.val=!![a,b;32*k,a+2*l] := by
  let a := g.val 0 0
  let b := g.val 0 1
  let e := g.val 1 1
  obtain ⟨k,hk⟩ := (ZMod.intCast_zmod_eq_zero_iff_dvd _ _).mp (Gamma0_mem.mp g.property)
  have H := g.val.property
  rw [Matrix.det_fin_two,hk] at H
  change a*e-b*(32*k)=1 at H
  have h := congrArg (fun x : ℤ => (x:ZMod 2)) H
  push_cast at h
  have hz : (32:ZMod 2)=0 := by decide
  rw [hz,zero_mul,mul_zero,sub_zero] at h
  have same : ∀ a e : ZMod 2, a*e=1 → a=e := by decide
  obtain ⟨l,hl⟩ := (ZMod.intCast_eq_intCast_iff_dvd_sub a e 2).mp (same _ _ h)
  refine ⟨a,b,k,l,?_⟩
  ext i j
  fin_cases i <;> fin_cases j
  · rfl
  · rfl
  · exact hk
  · change e=a+2*l; omega

lemma exists_shift (s : ℤ) (g : Gamma0 32) :
    ∃ h : Gamma0 32, tau s*(g.val:SL(2,ℝ))=(h.val:SL(2,ℝ))*tau s := by
  obtain ⟨a,b,k,l,H⟩ := model g
  have hdet := g.val.property
  rw [H,Matrix.det_fin_two] at hdet
  change a*(a+2*l)-b*(32*k)=1 at hdet
  let h : SL(2,ℤ) := ⟨!![a+16*s*k,b+s*l-8*s^2*k;32*k,a+2*l-16*s*k],by
    rw [Matrix.det_fin_two]; change (a+16*s*k)*(a+2*l-16*s*k)-(b+s*l-8*s^2*k)*(32*k)=1
    linear_combination hdet⟩
  have hh : h∈Gamma0 32 := by apply Gamma0_mem.mpr; exact (ZMod.intCast_zmod_eq_zero_iff_dvd _ _).mpr ⟨k,rfl⟩
  refine ⟨⟨h,hh⟩,?_⟩
  apply Subtype.ext
  change (tau s).val*(g.val:SL(2,ℝ)).val=(h:SL(2,ℝ)).val*(tau s).val
  rw [SpecialLinearGroup.coe_matrix_coe,SpecialLinearGroup.coe_matrix_coe,H]
  ext i j
  fin_cases i <;> fin_cases j <;> simp [Matrix.mul_apply,Fin.sum_univ_two,tau,h,Matrix.map_apply] <;> ring

def shift (s : ℤ) (g : Gamma0 32) := (exists_shift s g).choose
lemma shift_spec (s : ℤ) (g : Gamma0 32) :
    tau s*(g.val:SL(2,ℝ))=((shift s g).val:SL(2,ℝ))*tau s := (exists_shift s g).choose_spec

lemma undo (s : ℤ) (g : Gamma0 32) : shift (-s) (shift s g)=g := by
  apply Subtype.ext
  apply SpecialLinearGroup.map_intCast_injective (R:=ℝ)
  have h : (tau (-s)*tau s)*(g.val:SL(2,ℝ))=
      ((shift (-s) (shift s g)).val:SL(2,ℝ))*(tau (-s)*tau s) := by
    rw [mul_assoc,shift_spec,←mul_assoc (tau (-s)),shift_spec,mul_assoc]
  simpa only [tau_neg,one_mul,mul_one] using h.symm

def conjugate : Gamma0 32 ≃ Gamma0 32 where
  toFun := shift 1
  invFun := shift (-1)
  left_inv := undo 1
  right_inv g := by simpa using undo (-1) g


end
end TunnellHalfNormalizer
#print axioms TunnellHalfNormalizer.shift_spec
