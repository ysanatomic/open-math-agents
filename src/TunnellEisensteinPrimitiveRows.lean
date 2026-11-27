import TunnellRankinCritical

/-! The integer bottom row and its residue-class parametrization in the weight-one
Rankin Eisenstein family. -/
namespace TunnellRankinEisenstein
open Complex TunnellCMRegularized Filter Set Finset
open UpperHalfPlane hiding I
open scoped Topology ComplexConjugate
noncomputable section

def combine (N : ℕ) [NeZero N] : ZMod N × (ℤ×ℤ) ≃ ℤ×ℤ :=
  (Equiv.prodAssoc _ _ _).symm.trans <|
    (((Equiv.prodComm _ _).trans <| ((Equiv.refl ℤ).prodCongr (ZMod.finEquiv N).symm.toEquiv).trans
      (Int.divModEquiv N).symm).prodCongr (Equiv.refl ℤ)).trans (Equiv.prodComm _ _)

lemma combine_apply (N : ℕ) [NeZero N] (r : ZMod N) (j c : ℤ) :
    combine N (r,j,c) = (c,j*(N:ℤ)+(r.val:ℤ)) := by
  change (c,(Int.divModEquiv N).symm (j,(ZMod.finEquiv N).symm r))=_
  rw [Int.divModEquiv_symm_apply]
  cases N with
  | zero => exact (NeZero.ne 0 rfl).elim
  | succ n => rfl

def coordSum {N k : ℕ} [NeZero N] [NeZero k] (z : ℍ) (r : ZMod N) (s : ℂ) (p : ℤ×ℤ) :=
  kernel s ((p.1:ℂ)+(p.2:ℂ)*((k:ℂ)*conj (z:ℂ))+offset r)

lemma coordinate_summable {N k : ℕ} [NeZero N] [NeZero k] (z : ℍ) (r : ZMod N) {s : ℂ} (hs : 3/2<s.re) :
    Summable (coordSum (k:=k) z r s) := by
  let e := (periods k z).latticeEquivProd.symm.toEquiv
  have h := e.summable_iff.mpr (shifted_summable (periods k z) (offset r) s hs)
  apply h.congr
  intro p
  change kernel s (((periods k z).latticeEquivProd.symm p:ℂ)+offset r)=_
  rw [PeriodPair.latticeEquiv_symm_apply]
  simp [periods,coordSum]

def physicalTerm {N k : ℕ} (χ : DirichletCharacter ℂ N) (z : ℍ) (s : ℂ) (p : ℤ×ℤ) :=
  χ (p.2:ZMod N)*kernel s ((N:ℂ)*k*p.1*conj (z:ℂ)+(p.2:ℂ))

lemma physical_lattice {N k : ℕ} [NeZero N] [NeZero k] (χ : DirichletCharacter ℂ N) (z : ℍ)
    {s : ℂ} (hs : 3/2<s.re) : HasSum (physicalTerm (k:=k) χ z s)
      (kernel s (N:ℂ)*regular N k χ z s) := by
  let F (p : ZMod N × (ℤ×ℤ)) := kernel s (N:ℂ)*χ p.1*coordSum (k:=k) z p.1 s p.2
  have hsum : Summable F := by
    apply Summable.of_norm
    rw [summable_prod_of_nonneg (fun _ => norm_nonneg _)]
    exact ⟨fun r => (((coordinate_summable (k:=k) z r hs).mul_left (kernel s (N:ℂ)*χ r)).norm),(hasSum_fintype _).summable⟩
  apply (combine N).hasSum_iff.mp
  have hh : ∑' p,F p = kernel s (N:ℂ)*regular N k χ z s := by
    rw [hsum.tsum_prod,tsum_fintype,regular_large _ _ _ _ hs,mul_sum]
    apply sum_congr rfl
    intro r _
    simp [F,coordSum,offset,tsum_mul_left,mul_assoc]
  rw [←hh]
  apply hsum.hasSum.congr_fun
  rintro ⟨r,j,c⟩
  change physicalTerm (k:=k) χ z s (combine N (r,j,c))=_
  rw [combine_apply]
  have he : ((j*(N:ℤ)+(r.val:ℤ):ℤ):ZMod N)=r := by push_cast; simp
  simp only [physicalTerm,he,F,coordSum,offset,Int.cast_add,Int.cast_mul,Int.cast_natCast]
  rw [mul_comm (kernel s (N:ℂ)) (χ r),mul_assoc (χ r),←kernel_mul]
  congr 2
  have hN : (N:ℂ)≠0 := by exact_mod_cast NeZero.ne N
  field_simp
  ring

end
end TunnellRankinEisenstein
#print axioms TunnellRankinEisenstein.physical_lattice
