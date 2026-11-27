import TunnellPlaneDensity
import TunnellTraceChoices
import TunnellRectangularClasses

/-! The product of local Weil trace densities equals the sum of line families over the squarefree modulus. -/
namespace TunnellLineDensity
open TunnellRamifiedPlane TunnellRamifiedLines TunnellTraceChoices TunnellRectangularClasses Finset
open scoped Classical
noncomputable section
variable {d : ℕ}
private instance prime (i : P d) : Fact i.val.Prime := ⟨Nat.prime_of_mem_primeFactors i.property⟩

def fibers (t : (i : P d) → ZMod i.val) (x : Packet d) :
    {r : Roots t // ∀ i, (x i).1=r.val i*(x i).2} ≃ ((i:P d) → RootsAt (t i) (x i)) where
  toFun r i := ⟨r.val.val i,r.val.property i,r.property i⟩
  invFun r := ⟨⟨fun i => (r i).val,fun i => (r i).property.1⟩,fun i => (r i).property.2⟩
  left_inv _ := rfl
  right_inv _ := rfl

theorem factor [NeZero d] (t : (i : P d) → ZMod i.val) (f : ZMod d×ZMod d → ℂ) :
    (∑ r : Roots t, ∑ w : ZMod d×ZMod d, if ∀ i:P d, reduce i w.1=r.val i*reduce i w.2 then f w else 0)=
      ∑ w : ZMod d×ZMod d, (∏ i : P d, (density (t i) (reduce i w.1,reduce i w.2):ℂ))*f w := by
  classical
  rw [sum_comm]; apply sum_congr rfl
  intro w _
  let x (i : P d) := (reduce i w.1,reduce i w.2)
  let R := {r : Roots t // ∀ i, (x i).1=r.val i*(x i).2}
  have e : Nat.card R=∏ i:P d, density (t i) (x i) := by rw [Nat.card_congr (fibers t x),Nat.card_pi]; rfl
  have h : (∑ r : Roots t, if ∀ i:P d, reduce i w.1=r.val i*reduce i w.2 then f w else 0)=(Nat.card R:ℂ)*f w := by
    rw [←sum_filter,sum_const,nsmul_eq_mul]
    congr 1
    rw [Nat.card_eq_fintype_card]; congr 1; exact (Fintype.card_subtype _).symm
  rw [h,e,Nat.cast_prod]

end
end TunnellLineDensity
#print axioms TunnellLineDensity.factor
#print axioms TunnellLineDensity.roots_sum

