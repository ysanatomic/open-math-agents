import TunnellGlobalUnits
import TunnellAdicLocalization
import ClassFieldTheory.AlgebraicNumberTheory.Completion.UnramifiedComparison.IdealToCompletion

/-! The local algebra norm of a global unit at its only possibly ramified prime. -/
namespace TunnellAdicGlobalUnitNorm
open NumberField IsDedekindDomain IsDedekindDomain.HeightOneSpectrum AlgebraicNumberTheory.Valuations LocalFieldTheory
open scoped Classical
noncomputable section
variable {K L:Type} [Field K] [NumberField K] [Field L] [NumberField L] [Algebra K L] [FiniteDimensional K L] [IsAbelianGalois K L]

theorem norm_at (v:HeightOneSpectrum (𝓞 K)) (hC:∀ z:InfinitePlace K,z.IsComplex)
    (hu:∀ s:HeightOneSpectrum (𝓞 K),s≠v → ∀ t:HeightOneSpectrum (𝓞 L),t.asIdeal.LiesOver s.asIdeal → t.asIdeal.ramificationIdx (𝓞 K)=1)
    (u:(𝓞 K)ˣ) :
    let w:=finitePlaceExtensionEquivAbove (K:=K) (L:=L) v (chosenFinitePlaceExtension (L:=L) v)
    letI:Algebra (v.adicCompletion K) (w.1.adicCompletion L):=(finitePlaceAdicCompletionMap K L v w).toAlgebra
    ∃ y:(w.1.adicCompletion L)ˣ,normUnits (v.adicCompletion K) (w.1.adicCompletion L) y=
      Units.map (algebraMap K (v.adicCompletion K)).toMonoidHom (TunnellGlobalUnits.fieldUnit K u) := by
  have hun(s:HeightOneSpectrum (𝓞 K)) (hne:s≠v) : ChosenFinitePlaceIsUnramified (K:=K) (L:=L) s := by
    let w:=finitePlaceExtensionCentre (K:=K) (L:=L) s (chosenFinitePlaceExtension (L:=L) s)
    haveI:w.asIdeal.LiesOver s.asIdeal:=finitePlaceExtensionCentre_liesOver _ _
    apply chosenFinitePlaceIsUnramified_of_centre_ramificationIdx_eq_one
    rw [Ideal.ramificationIdx'_eq_ramificationIdx s.asIdeal w.asIdeal s.ne_bot]
    exact hu s hne w inferInstance
  apply (TunnellAdicLocalization.chosen_norm (L:=L) v _).mp
  have ha:=TunnellGlobalUnits.globalUnit_one_prime_is_norm (L:=L) v hC hun u
  exact ha

#print axioms norm_at
end
end TunnellAdicGlobalUnitNorm
