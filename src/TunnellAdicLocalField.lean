import TunnellCompletionRestriction
import ClassFieldTheory.AlgebraicNumberTheory.Completion.IntegerRingComparison
import ValuedFieldTheory.LocalField.NonarchimedeanLocalField.ValuedTopology

/-! The intrinsic nonarchimedean local field structure of an adic completion of a number field. -/
namespace TunnellAdicLocalField
open NumberField IsDedekindDomain IsDedekindDomain.HeightOneSpectrum WithZero LocalFieldTheory
open scoped ValuativeRel Classical
noncomputable section
variable {K:Type} [Field K] [NumberField K] (v:HeightOneSpectrum (𝓞 K))

scoped instance rel : ValuativeRel (v.adicCompletion K) :=
  ValuativeRel.ofValuation (Valued.v : Valuation (v.adicCompletion K) ℤᵐ⁰)

scoped instance compatible : (Valued.v : Valuation (v.adicCompletion K) ℤᵐ⁰).Compatible :=
  Valuation.Compatible.ofValuation _

scoped instance nontrivial : (Valued.v : Valuation (v.adicCompletion K) ℤᵐ⁰).IsNontrivial := by
  obtain ⟨x,hx⟩:=v.valuedAdicCompletion_surjective K (exp (-1:ℤ))
  refine (Valuation.isNontrivial_iff_exists_lt_one _).mpr ⟨x,?_,?_⟩
  · rintro rfl
    exact WithZero.exp_ne_zero ((map_zero _).symm.trans hx).symm
  · rw [hx]
    decide

scoped instance localField : IsNonarchimedeanLocalField (v.adicCompletion K) where
  toIsValuativeTopology:=isValuativeTopology_of_valued_ofValuation _ ℤᵐ⁰
  toLocallyCompactSpace:=(finitePlaceCompletionContinuousMulEquiv v).toHomeomorph.locallyCompactSpace_iff.mp
    (inferInstanceAs (LocallyCompactSpace (ChosenFinitePlaceBaseCompletion v)))
  toIsNontrivial:=(ValuativeRel.isNontrivial_iff_isNontrivial (Valued.v : Valuation (v.adicCompletion K) ℤᵐ⁰)).mpr inferInstance

theorem mem_integers_iff (x:v.adicCompletion K) : x∈𝒪[v.adicCompletion K] ↔ x∈v.adicCompletionIntegers K := by
  change ValuativeRel.valuation _ x≤1 ↔ Valued.v x≤1
  exact (Valuation.vle_one_iff (ValuativeRel.valuation _) (x:=x)).symm.trans (Valuation.vle_one_iff Valued.v)

def integers : 𝒪[v.adicCompletion K]≃+*v.adicCompletionIntegers K :=
  RingEquiv.restrict (RingEquiv.refl _) 𝒪[v.adicCompletion K] (v.adicCompletionIntegers K).toSubring
    (fun x => mem_integers_iff v x)

@[simp] theorem integers_coe (x:𝒪[v.adicCompletion K]) :
    ((integers v x:v.adicCompletionIntegers K):v.adicCompletion K)=x := rfl

#print axioms localField
#print axioms integers
end
end TunnellAdicLocalField
