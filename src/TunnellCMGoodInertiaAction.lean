import TunnellCMIntegralInertia
import TunnellCMInertiaAtGood
import TunnellCMGlobalModelUnit
import TunnellKummer

/-! Actual inertia automorphisms at good primes fix prime-to-residue-characteristic division points. -/
namespace TunnellCMGoodInertiaAction
open IsDedekindDomain IsDedekindDomain.HeightOneSpectrum IsLocalRing NumberField
open WeierstrassCurve WeierstrassCurve.Affine TunnellKummer TunnellCMIntegralInertia
open TunnellCMInertiaAtGood TunnellCMGlobalModelUnit
open scoped NumberField
noncomputable section
variable {F N : Type*} [Field F] [Field N] [NumberField N] [Algebra F N] [DecidableEq N]
  (v : HeightOneSpectrum (𝓞 N))
local notation "O" => v.adicCompletionIntegers N
local notation "L" => v.adicCompletion N
local notation "ι" => algebraMap N (v.adicCompletion N)

lemma complete_value (x : N) : Valued.v (ι x) = v.valuation N x :=
  v.valuedAdicCompletion_eq_valuation' x

lemma integral_iff (σ : N ≃ₐ[F] N) (hσ : σ∈v.asIdeal.inertia (N ≃ₐ[F] N)) (x : N) :
    Valued.v (ι (σ x))≤1 ↔ Valued.v (ι x)≤1 := by
  rw [complete_value,complete_value]
  refine ⟨fun h => ?_,image_integral v σ.toRingEquiv.toRingHom (inertia_on_integers v σ hσ)⟩
  have hinv := (v.asIdeal.inertia (N ≃ₐ[F] N)).inv_mem hσ
  exact (show (σ⁻¹ : N ≃ₐ[F] N) (σ x)=x from σ.symm_apply_apply x) ▸
    image_integral v (σ⁻¹).toRingEquiv.toRingHom (inertia_on_integers v _ hinv) h

lemma residue_fixed (σ : N ≃ₐ[F] N) (hσ : σ∈v.asIdeal.inertia (N ≃ₐ[F] N))
    (x : N) (h₁ : Valued.v (ι (σ x))≤1) (h₂ : Valued.v (ι x)≤1) :
    residue O (⟨ι (σ x),h₁⟩:O)=residue O (⟨ι x,h₂⟩:O) := by
  apply sub_eq_zero.mp
  rw [← map_sub,residue_eq_zero_iff]
  apply Valuation.Integer.not_isUnit_iff_valuation_lt_one.mpr
  change Valued.v (ι (σ x)-ι x)<1
  rw [← map_sub,complete_value]
  exact integral_difference v σ.toRingEquiv.toRingHom (inertia_on_integers v σ hσ)
    ((complete_value v x) ▸ h₂)

theorem reduction_invariant (W : WeierstrassCurve F) (W₀ : WeierstrassCurve O)
    (hW : W₀.map (algebraMap O L)=(W.baseChange N).baseChange L)
    [W₀.IsElliptic] [((W.baseChange N).baseChange L).IsElliptic]
    [DecidableEq L] [DecidableEq (ResidueField O)]
    (σ : N ≃ₐ[F] N) (hσ : σ∈v.asIdeal.inertia (N ≃ₐ[F] N)) (P : CurvePoints W N) :
    adicRed hW (pointMap (W.baseChange N) L (act W σ P)) =
      adicRed hW (pointMap (W.baseChange N) L P) := by
  cases P with
  | zero => rfl
  | some x y hp =>
    simp only [act,pointMap,AddMonoidHom.comp_apply,AddEquiv.coe_toAddMonoidHom,Point.equivOfEq_some,Point.map_some]
    apply reduction_of_integral_coordinates hW (integral_iff v σ hσ x)
      (residue_fixed v σ hσ x) (residue_fixed v σ hσ y)

theorem inertia_fixes_division (W : WeierstrassCurve F) (W₀ : WeierstrassCurve O)
    (hW : W₀.map (algebraMap O L)=(W.baseChange N).baseChange L)
    [W₀.IsElliptic] [((W.baseChange N).baseChange L).IsElliptic]
    [DecidableEq L] [DecidableEq (ResidueField O)]
    (σ : N ≃ₐ[F] N) (hσ : σ∈v.asIdeal.inertia (N ≃ₐ[F] N))
    {l p : ℕ} (hl : l.Prime) (hp : p.Prime) (hne : p≠l) (hchar : (l:O)∈maximalIdeal O)
    (r : ℕ) (P : CurvePoints W N) (hP : act W σ (p^r • P)=p^r • P) : act W σ P=P := by
  let f := pointMap (W.baseChange N) L
  apply pointMap_inj (W.baseChange N) L
  apply same_division hW hl hp hne hchar r
  · exact (f.map_nsmul _ _).symm.trans ((congrArg f ((map_nsmul (act W σ) _ _).symm.trans hP)).trans (f.map_nsmul _ _))
  · exact reduction_invariant v W W₀ hW σ hσ P

end
end TunnellCMGoodInertiaAction
#print axioms TunnellCMGoodInertiaAction.inertia_fixes_division
