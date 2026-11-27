import ClassFieldTheory.GlobalClassFieldTheory.Reciprocity.GlobalArtin

/-! Local factors in the product formula for a global unit in a one-prime extension. -/

namespace TunnellGlobalUnits

open NumberField IsDedekindDomain GlobalClassFieldTheory.Reciprocity
open AlgebraicNumberTheory.Valuations
open scoped IsMulCommutative

variable (K L : Type) [Field K] [NumberField K] [Field L] [NumberField L] [Algebra K L]
  [FiniteDimensional K L] [IsAbelianGalois K L]

noncomputable abbrev fieldUnit (u : (𝓞 K)ˣ) : Kˣ := Units.map (algebraMap (𝓞 K) K).toMonoidHom u

lemma globalUnit_component (u : (𝓞 K)ˣ) (v : HeightOneSpectrum (𝓞 K)) :
    IdeleGroup.finiteComponent v (IdeleGroup.principalIdele K (fieldUnit K u)) ∈ (v.adicCompletionIntegers K).units := by
  rw [HeightOneSpectrum.adicCompletionIntegers.mem_units_iff_valued_eq_one,
    IdeleGroup.finiteComponent_principalIdele, HeightOneSpectrum.valuedAdicCompletion_eq_valuation']
  exact v.valuation_eq_one_iff_notMem.mpr (v.asIdeal.notMem_of_isUnit u.isUnit)

lemma globalUnit_unramified_symbol (u : (𝓞 K)ˣ) (v : HeightOneSpectrum (𝓞 K))
    (h : ChosenFinitePlaceIsUnramified (K:=K) (L:=L) v) :
    chosenFinitePlaceArtinMonoidHom (K:=K) (L:=L) v
      (IdeleGroup.finiteComponent v (IdeleGroup.principalIdele K (fieldUnit K u))) = 1 := by
  apply MonoidHom.mem_ker.mp
  rw [chosenFinitePlaceArtinMonoidHom_ker]
  exact adicCompletionIntegerUnits_le_chosenFinitePlaceLocalNormSubgroup v h (globalUnit_component K u v)

lemma complex_symbol (v : InfinitePlace K) (hv : v.IsComplex) (x : v.Completionˣ) :
    chosenInfinitePlaceArtinMonoidHom (K:=K) (L:=L) v x = 1 := by
  have h : (chosenInfinitePlaceAbove (L:=L) v).IsUnramified K := by
    apply InfinitePlace.isUnramified_iff.mpr
    right
    rwa [chosenInfinitePlaceAbove_comap]
  unfold chosenInfinitePlaceArtinMonoidHom infinitePlaceArtinMonoidHomOfPlace
  rw [dif_pos h]
  rfl

end TunnellGlobalUnits
