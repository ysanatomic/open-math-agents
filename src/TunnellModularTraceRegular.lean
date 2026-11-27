import TunnellLevelPairing
import TunnellPeterssonTrace

/-! Regularity and Petersson evaluation after taking an actual coset trace. -/
namespace TunnellModularTraceRegular
open Complex Finset Matrix MatrixGroups ModularGroup ModularForm CongruenceSubgroup MeasureTheory
open TunnellTraceCosets TunnellPeterssonTrace TunnellRankinIntegral TunnellHalfPairing TunnellLevelPairing
open TunnellShell TunnellFullClassTheta TunnellRankinCotangent
open UpperHalfPlane hiding I
open scoped ModularForm ComplexConjugate
noncomputable section
variable {d : ℕ}

def series (R : Choices d→Gamma0 32) (F : ℍ→ℂ) (z : ℍ) := ∑ i,(F ∣[(2:ℤ)] (R i).val) z

lemma pair_series (R : Choices d→Gamma0 32) (F : ℍ→ℂ) (z : ℍ) :
    pair (series R F) z=∑ i,pair F ((R i).val • z) := by
  calc
    _ = ∑ i,pair (F ∣[(2:ℤ)] (R i).val) z := by
      simp only [pair_eta,series,map_sum,mul_sum]
    _ = _ := sum_congr rfl (fun i _ => (pair_pull (R i).property F z).symm)

def move (R : Choices d→Gamma0 32) (g : Gamma0 32) (i : Choices d) : Choices d := slope ((R i)*g).val

lemma move_slope (hs : Squarefree d) (hd : d%4=1) (R : Choices d→Gamma0 32)
    (hR : ∀ j,slope (R j).val=j) (g h : Gamma0 32) : move R g (slope h.val)=slope (h*g).val := by
  apply (slope_level hs hd _ _).mpr
  have e := (slope_level hs hd (R (slope h.val)) h).mp (hR _)
  simpa [Subgroup.coe_mul,mul_assoc] using e

def perm (hs : Squarefree d) (hd : d%4=1) (R : Choices d→Gamma0 32)
    (hR : ∀ j,slope (R j).val=j) (g : Gamma0 32) : Equiv.Perm (Choices d) where
  toFun := move R g
  invFun := move R g⁻¹
  left_inv i := by change move R g⁻¹ (slope ((R i)*g).val)=_; rw [move_slope hs hd R hR]; simp [hR]
  right_inv i := by change move R g (slope ((R i)*g⁻¹).val)=_; rw [move_slope hs hd R hR]; simp [hR]

lemma sum_invariant (hs : Squarefree d) (hd : d%4=1) (R : Choices d→Gamma0 32)
    (hR : ∀ j,slope (R j).val=j) {F : ℍ→ℂ} (hi : ∀ g∈Gamma0 (32*d), ∀ z, F (g • z)=F z)
    (g : Gamma0 32) (z : ℍ) :
    (∑ i,F ((R i).val • (g.val • z)))=∑ i,F ((R i).val • z) := by
  let E := perm hs hd R hR g
  rw [←Equiv.sum_comp E (fun i => F ((R i).val • z))]
  apply sum_congr rfl
  intro i _
  have e := (slope_level hs hd (R i*g) (R (E i))).mp (hR (E i)).symm
  simpa only [Subgroup.coe_mul,mul_smul,inv_smul_smul] using hi _ e ((R (E i)).val • z)

variable {b : Triple} (hs : Squarefree d) (hn : Squarefree (2*d)) (hd : d%4=1) (hb : b∈shell (2*d))

include hs in
theorem regularity (R : Choices d→Gamma0 32) (hR : ∀ j,slope (R j).val=j) :
    regular (series R (source hn hd hb)) ∧
      TunnellRankinIntegral.petersson 32 (pair (series R (source hn hd hb)))=
      TunnellRankinIntegral.petersson (4*(2*d)*4) (pair (source hn hd hb)) := by
  let F := source hn hd hb
  have hi (q : Cosets 32) (i : Choices d) : IntegrableOn (fun z => pair F ((R i).val • (rep q • z))) fdo := by
    simpa only [mul_smul] using high_integrable hn hd hb ((R i).val*rep q)
  have he : pair (series R F)=fun z=>∑ i,pair F ((R i).val • z) := funext (pair_series R F)
  change regular (series R F) ∧ _=_
  constructor
  · unfold regular
    rw [he]
    refine ⟨?_,?_,?_⟩
    · exact Finset.measurable_fun_sum _ (fun i _ => (high_meas hn hd hb).comp (measurePreserving_smul ((R i).val:GL (Fin 2) ℝ) volume).measurable)
    · exact sum_invariant hs hd R hR (high_invariant hn hd hb)
    · intro q
      exact integrable_finsetSum _ (fun i _ => hi q i)
  · change TunnellRankinIntegral.petersson 32 (pair (series R F))=TunnellRankinIntegral.petersson _ (pair F)
    rw [he,←trace_integral hs hd R hR _ (high_invariant hn hd hb) hi]
    congr 1
    ring

end
end TunnellModularTraceRegular
#print axioms TunnellModularTraceRegular.regularity
