import TunnellTraceCosets
import TunnellRankinPetersson

/-! Transitivity of the unnormalized Petersson integral from level 32d to level 32. -/
namespace TunnellPeterssonTrace
open Complex Matrix MatrixGroups ModularGroup CongruenceSubgroup TunnellTraceCosets
open TunnellRankinIntegral MeasureTheory
open UpperHalfPlane hiding I
noncomputable section
variable {d : ℕ}

def cls {L : ℕ} (g : SL(2,ℤ)) : Cosets L := QuotientGroup.mk g⁻¹

lemma cls_eq {L : ℕ} (g h : SL(2,ℤ)) : cls (L:=L) g=cls h ↔ g*h⁻¹ ∈ Gamma0 L := by
  simp only [cls,QuotientGroup.eq,inv_inv]

lemma cls_rep {L : ℕ} (q : Cosets L) : cls (rep q)=q := by
  simp [cls,rep,Quotient.out_eq']

def compose (R : Choices d→Gamma0 32) (w : Cosets 32 × Choices d) : SL(2,ℤ) := (R w.2).val*rep w.1

lemma large_cls (R : Choices d→Gamma0 32) (w : Cosets 32 × Choices d) :
    cls (L:=32) (compose R w)=w.1 := cosetProd_class w.1 (R w.2)

def transitive (hs : Squarefree d) (hd : d%4=1) (R : Choices d→Gamma0 32)
    (hR : ∀ j,slope (R j).val=j) : Cosets 32 × Choices d ≃ Cosets (32*d) :=
  Equiv.ofBijective (fun w => cls (compose R w)) (by
    constructor
    · rintro ⟨q,i⟩ ⟨r,j⟩ H
      have h := (cls_eq _ _).mp H
      have h' := gamma_dvd (dvd_mul_right 32 d) h
      have e := (cls_eq _ _).mpr h'
      rw [large_cls,large_cls] at e
      dsimp only at e
      subst r
      have C : (R i).val*(R j).val⁻¹∈Gamma0 (32*d) := by simpa [compose,mul_assoc] using h
      exact Prod.ext rfl (by simpa only [hR] using (slope_level hs hd (R i) (R j)).mpr C)
    · intro q
      obtain ⟨⟨r,h⟩,he⟩ := (cosetProd_bijective 32).surjective (rep q)
      let j := slope (d:=d) h.val
      refine ⟨(r,j),?_⟩
      rw [←cls_rep q]
      apply (cls_eq _ _).mpr
      rw [←he]
      have H := (slope_level hs hd (R j) h).mp (hR j)
      simpa [compose,cosetProd,mul_assoc] using H)

theorem trace_integral (hs : Squarefree d) (hd : d%4=1) (R : Choices d→Gamma0 32)
    (hR : ∀ j,slope (R j).val=j) (F : ℍ→ℂ)
    (H : ∀ g∈Gamma0 (32*d),∀ z,F (g • z)=F z)
    (hi : ∀ (q : Cosets 32) i, IntegrableOn (fun z => F ((R i).val • (rep q • z))) fdo) :
    TunnellRankinIntegral.petersson (32*d) F=TunnellRankinIntegral.petersson 32 (fun z => ∑ i,F ((R i).val • z)) := by
  classical
  letI : NeZero (32*d) := ⟨by omega⟩
  letI := Fintype.ofFinite (Cosets 32)
  letI := Fintype.ofFinite (Cosets (32*d))
  let E := transitive hs hd R hR
  have HE (w : Cosets 32 × Choices d) z : F (rep (E w) • z)=F (compose R w • z) := by
    have hh : cls (rep (E w))=cls (compose R w) := cls_rep (E w)
    have hh' := (cls_eq _ _).mp hh
    simpa [mul_smul] using H _ hh' (compose R w • z)
  unfold TunnellRankinIntegral.petersson
  rw [←E.tsum_eq (fun q => ∫ z in fdo,F (rep q • z))]
  simp only [tsum_fintype,Fintype.sum_prod_type,HE,compose,mul_smul,
    MeasureTheory.integral_finsetSum _ (fun i _ => hi _ i)]

end
end TunnellPeterssonTrace
#print axioms TunnellPeterssonTrace.trace_integral
