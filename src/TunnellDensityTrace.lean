import TunnellLineDensity
import TunnellAnalyticLine

/-! The arithmetic trace of the rectangular theta series in orthogonal local coordinates. -/
namespace TunnellDensityTrace
open TunnellRamifiedLines TunnellRectangularClasses TunnellLineDensity TunnellGluePacket
open TunnellIntegralPacket TunnellAnalyticLine TunnellIdealHNF TunnellUniformBasis TunnellRectangularIdeal
open scoped Classical
noncomputable section
variable {d : ℕ}
private instance prime (i : P d) : Fact i.val.Prime := ⟨Nat.prime_of_mem_primeFactors i.property⟩

def shifts (hs : Squarefree d) (k : (i : P d) → (ZMod i.val)ˣ) : Packet d ≃ ZMod d×ZMod d where
  toFun x := ((redEquiv hs).symm (fun i => (k i:ZMod i.val)*(x i).1),
    (redEquiv hs).symm (fun i => (k i:ZMod i.val)*(x i).2))
  invFun w i := (((k i)⁻¹:ZMod i.val)*reduce i w.1,((k i)⁻¹:ZMod i.val)*reduce i w.2)
  left_inv x := by
    funext i; apply Prod.ext
    · change ((k i)⁻¹:ZMod i.val) * ((redEquiv hs) ((redEquiv hs).symm _)) i = (x i).1
      rw [Equiv.apply_symm_apply]; exact inv_mul_cancel_left₀ (Units.ne_zero (k i)) _
    · change ((k i)⁻¹:ZMod i.val) * ((redEquiv hs) ((redEquiv hs).symm _)) i = (x i).2
      rw [Equiv.apply_symm_apply]; exact inv_mul_cancel_left₀ (Units.ne_zero (k i)) _
  right_inv w := by
    apply Prod.ext
    · apply (redEquiv hs).injective
      rw [Equiv.apply_symm_apply]; funext i; change (k i:ZMod i.val)*(((k i)⁻¹:ZMod i.val)*_)=_; exact mul_inv_cancel_left₀ (Units.ne_zero (k i)) _
    · apply (redEquiv hs).injective
      rw [Equiv.apply_symm_apply]; funext i; change (k i:ZMod i.val)*(((k i)⁻¹:ZMod i.val)*_)=_; exact mul_inv_cancel_left₀ (Units.ne_zero (k i)) _

lemma shifts_apply (hs : Squarefree d) (k : (i : P d) → (ZMod i.val)ˣ) (x : Packet d) (i : P d) :
    (reduce i (shifts hs k x).1,reduce i (shifts hs k x).2)=((k i:ZMod i.val)*(x i).1,(k i:ZMod i.val)*(x i).2) := by
  apply Prod.ext
  · exact congrFun ((redEquiv hs).apply_symm_apply _) i
  · exact congrFun ((redEquiv hs).apply_symm_apply _) i

theorem product [NeZero d] (hs : Squarefree d) (k : (i : P d) → (ZMod i.val)ˣ)
    {I J : Ideal (R (2*d))} (U : TunnellUniformBasis.Basis d I) (V : TunnellUniformBasis.Basis d J) (z : ℂ) :
    letI : NeZero U.a := ⟨U.pos.ne'⟩
    letI : NeZero V.a := ⟨V.pos.ne'⟩
    trace U V z=∑ x : Packet d,
      (∏ i : P d, (density (parameter U.atPrime V.atPrime i) (x i):ℂ))*
        (rect d U.a 1 U.b (shifts hs k x).1.val z*rect d V.a 4 V.b (shifts hs k x).2.val z) := by
  classical
  letI : NeZero U.a := ⟨U.pos.ne'⟩
  letI : NeZero V.a := ⟨V.pos.ne'⟩
  let f (w : ZMod d×ZMod d) := rect d U.a 1 U.b w.1.val z*rect d V.a 4 V.b w.2.val z
  let t := parameter U.atPrime V.atPrime
  have he : trace U V z=(∑ r : TunnellTraceChoices.Roots t, ∑ w : ZMod d×ZMod d,
    if ∀ i:P d, reduce i w.1=r.val i*reduce i w.2 then f w else 0) := by
    dsimp only [t,f]
    unfold TunnellAnalyticLine.trace theta
    apply Finset.sum_congr rfl; intro r _
    apply Finset.sum_congr rfl; intro w _
    unfold TunnellLineIntegral.aligned
    split_ifs <;> rfl
  rw [he,factor]
  rw [←(shifts hs k).sum_comp (fun w => (∏ i : P d, (density (t i) (reduce i w.1,reduce i w.2):ℂ))*f w)]
  apply Finset.sum_congr rfl; intro x _
  apply congrArg (·*f ((shifts hs k) x)); apply Finset.prod_congr rfl
  intro i _; rw [shifts_apply]; exact_mod_cast scale (t i) (k i:ZMod i.val) (Units.ne_zero (k i)) (x i)

end
end TunnellDensityTrace
#print axioms TunnellDensityTrace.product
