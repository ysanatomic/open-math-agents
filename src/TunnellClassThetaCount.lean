import TunnellIdealRepresentations
/-! The full ideal theta coefficient counts every integral ideal twice. -/
namespace TunnellClassThetaCount
open TunnellHurwitz TunnellToricLocal TunnellToric TunnellIdealHNF TunnellShell TunnellToricClass TunnellEmbeddedIdeals TunnellIdealGenerators
noncomputable section
variable {n m : ℕ} {v : Triple} (hn : Squarefree n) (h2 : n%4=2) (hv : v∈shell n)

def liftClass (c : ProperIdealClass v) : Ideal (R n) := conjugate (preimage hv c.out)
def classOf (B : NormIdeals n m) : ProperIdealClass v :=
  Quotient.mk _ (integralEquiv hn h2 hv ⟨B.val,B.property.1⟩)

lemma conj_invol (I : Ideal (R n)) : conjugate (conjugate I)=I := by
  ext x; simp only [mem_conjugate,star_star]
lemma conj_ne_bot {I : Ideal (R n)} (hI : I≠⊥) : conjugate I≠⊥ := by
  intro h; apply hI; rw [←conj_invol I,h]; ext t; simp [mem_conjugate]
include hn h2 in
lemma lift_ne_bot (c : ProperIdealClass v) : liftClass hv c≠⊥ :=
  conj_ne_bot (preimage_ne_bot hn h2 hv c.out)

lemma fiber_iff (c : ProperIdealClass v) (B : NormIdeals n m) :
    homothetic v (image hv (conjugate (liftClass hv c))) (image hv B.val) ↔ classOf hn h2 hv B=c := by
  rw [liftClass,conj_invol,image_preimage hn h2 hv]
  calc
    _ ↔ Quotient.mk (idealSetoid v) c.out=classOf hn h2 hv B := Quotient.eq.symm
    _ ↔ _ := by rw [Quotient.out_eq,eq_comm]

def fiberEquiv (c : ProperIdealClass v) :
    InverseClass hv (liftClass hv c) m ≃ {B : NormIdeals n m // classOf hn h2 hv B=c} :=
  Equiv.subtypeEquivRight (fiber_iff hn h2 hv c)

theorem total_count (hm : 0 < m) :
    letI := Fintype.ofEquiv ↥(representatives n) (idealEquiv hn h2 hv).symm
    (∑ c : ProperIdealClass v, Nat.card (Representations (liftClass hv c) m))=2*Nat.card (NormIdeals n m) := by
  classical
  letI := Fintype.ofEquiv ↥(representatives n) (idealEquiv hn h2 hv).symm
  letI : Fintype (NormIdeals n m) := Fintype.ofEquiv (finiteRoot n m) ((divisorEquiv hm).symm.trans (indexedEquiv (by omega)))
  calc
    _=∑ c : ProperIdealClass v, 2*Nat.card {B : NormIdeals n m // classOf hn h2 hv B=c} := by
      apply Finset.sum_congr rfl
      intro c _
      rw [classwise_count hn h2 hv (lift_ne_bot hn h2 hv c),Nat.card_congr (fiberEquiv hn h2 hv c)]
    _=_ := by
      rw [←Finset.mul_sum,←Nat.card_sigma,Nat.card_congr (Equiv.sigmaFiberEquiv (classOf hn h2 hv : NormIdeals n m → _))]

end
end TunnellClassThetaCount
#print axioms TunnellClassThetaCount.total_count
