import TunnellWindingTraceSource
import TunnellUniformTranslation
import TunnellModularTraceRegular
import TunnellTraceIdentification

/-! The geometric line trace and the actual level-lowering Petersson pairing coincide
for every squarefree discriminant and every class-pair family. -/
namespace TunnellWindingBridge
open Finset MatrixGroups CongruenceSubgroup ModularForm TunnellWindingTrace TunnellTraceHeight
open TunnellLevelPairing TunnellModularTraceRegular TunnellUniformTranslation TunnellTraceIdentification
open TunnellTraceLifts TunnellRamifiedLines TunnellTraceCosets
open TunnellToricClass TunnellProperClassGroup TunnellOddTraceHeight TunnellRankinCotangent
open scoped ModularForm UpperHalfPlane Classical
noncomputable section

theorem bridge : Bridge := by
  intro d inst hs hn hd v hv
  letI := TunnellFullClassTheta.classFintype hn (by omega) hv
  intro θ D HB
  let C := ProperIdealClass v×ProperIdealClass v
  let a (x : C×Bool) := if x.2 then (D x.1).V.a else (D x.1).U.a
  have hC (i : P d) (x : C×Bool) : i.val.Coprime (a x) := by
    letI : Fact i.val.Prime := ⟨Nat.prime_of_mem_primeFactors i.property⟩
    apply Nat.Coprime.symm
    apply (ZMod.isUnit_iff_coprime _ i.val).mp
    apply isUnit_iff_ne_zero.mpr
    unfold a
    split <;> first | exact unit_a (D x.1) i | exact unit_b (D x.1) i
  obtain ⟨m,hm,hzero,h32,hwidth⟩ := exists_translation hs hd a hC
  let R (j : Choices d) : Gamma0 32 := ⟨lift m j,lift_mem m h32 j⟩
  have hR (j : Choices d) : TunnellTraceCosets.slope (R j).val=j := lift_slope m hm hzero j
  have hsum : source hn hd hv=∑ x : C,fun z : ℍ => base (D x) z := by
    funext z
    simp only [Finset.sum_apply]
    exact HB z
  have trace_eq : series R (source hn hd hv)=fun z : ℍ => ∑ x : C,traced (D x) z := by
    funext z
    rw [hsum,series]
    simp only [SlashAction.sum_slash,Finset.sum_apply]
    rw [sum_comm]
    apply sum_congr rfl; intro x _
    apply identify hs hd (D x) m hm
    · intro i; simpa [a] using hwidth i (x,false)
    · intro i; simpa [a] using hwidth i (x,true)
  rw [←trace_eq]
  exact regularity hs hn hd hv R hR

end
end TunnellWindingBridge
#print axioms TunnellWindingBridge.bridge
