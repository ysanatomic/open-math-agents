import TunnellAdicLocalField
import ClassFieldTheory.AlgebraicNumberTheory.Completion.AdicCompletionComparison

/-! Comparison of completions with the class-field-theoretic localizations, including their actual norms. -/
namespace TunnellAdicLocalization
open NumberField IsDedekindDomain IsDedekindDomain.HeightOneSpectrum
open AlgebraicNumberTheory.Valuations LocalFieldTheory TunnellAdicLocalField
open scoped Classical ValuativeRel TunnellAdicLocalField
noncomputable section
variable {K L:Type} [Field K] [NumberField K] [Field L] [NumberField L] [Algebra K L] [FiniteDimensional K L] [IsGalois K L]
variable (v:HeightOneSpectrum (𝓞 K))

abbrev Fibre := {w:HeightOneSpectrum (𝓞 L) // finitePlaceBelow (K:=K) w=v}
abbrev Base := ChosenFinitePlaceBaseCompletion v
abbrev Ext := AbsoluteValueExtension (NumberField.HeightOneSpectrum.adicAbv K v) L
abbrev Loc (a:Ext (L:=L) v) := LocalizedCompletion (NumberField.HeightOneSpectrum.adicAbv K v) a

scoped instance extAlgebra (a:Ext (L:=L) v) : Algebra K a.1.Completion :=
  AbsoluteValue.extensionCompletionAlgebra (K:=K) a.1

scoped instance extSMul (a:Ext (L:=L) v) : SMul K a.1.Completion := (extAlgebra v a).toSMul

scoped instance compAlgebra (a:Ext (L:=L) v) : Algebra (Base v) a.1.Completion :=
  AbsoluteValue.completionAlgebra _ a.1 a.2

def locEquiv (a:Ext (L:=L) v) : Loc v a≃+*(finitePlaceExtensionEquivAbove (K:=K) (L:=L) v a).1.adicCompletion L :=
  (localizedCompletionEquivCompletion _ (RayClass.adicAbv_isNontrivial v) a).toRingEquiv.trans
    (finitePlaceExtensionAdicCompletionRingEquiv v a)

theorem comparison (a:Ext (L:=L) v) :
    (finitePlaceAdicCompletionMap K L v (finitePlaceExtensionEquivAbove v a)).comp (finitePlaceCompletionRingEquiv v).toRingHom =
    (locEquiv v a).toRingHom.comp (algebraMap (Base v) (Loc v a)) := by
  apply RingHom.ext
  intro x
  change finitePlaceAdicCompletionMap K L v (finitePlaceExtensionEquivAbove v a) (finitePlaceCompletionRingEquiv v x)=_
  rw [←finitePlaceExtensionAdicCompletionMap_eq_finitePlaceAdicCompletionMap]
  let e:=localizedCompletionEquivCompletion _ (RayClass.adicAbv_isNontrivial v) a
  have he := e.commutes x
  change finitePlaceExtensionAdicCompletionRingEquiv v a
    (AbsoluteValue.completionMap _ a.1 a.2 ((relativeFinitePlaceCompletionAlgEquiv v).symm (finitePlaceCompletionRingEquiv v x)))=
    finitePlaceExtensionAdicCompletionRingEquiv v a (e (algebraMap _ _ x))
  rw [he]
  change _ = finitePlaceExtensionAdicCompletionRingEquiv v a (AbsoluteValue.completionMap _ a.1 a.2 x)
  congr 2
  exact (relativeFinitePlaceCompletionAlgEquiv v).symm_apply_apply x

theorem galois (w:Fibre (L:=L) v) :
    letI:Algebra (v.adicCompletion K) (w.1.adicCompletion L):=(finitePlaceAdicCompletionMap K L v w).toAlgebra
    IsGalois (v.adicCompletion K) (w.1.adicCompletion L) := by
  obtain ⟨a,rfl⟩ := (finitePlaceExtensionEquivAbove (K:=K) (L:=L) v).surjective w
  letI:= (finitePlaceAdicCompletionMap K L v (finitePlaceExtensionEquivAbove v a)).toAlgebra
  haveI:=HilbertRamification.algebraicLocalization_isGalois _ a
  exact IsGalois.of_equiv_equiv (f:=finitePlaceCompletionRingEquiv v) (g:=locEquiv v a) (comparison v a)

theorem chosen_norm (u:(v.adicCompletion K)ˣ) :
    let w:=finitePlaceExtensionEquivAbove (K:=K) (L:=L) v (chosenFinitePlaceExtension (L:=L) v)
    letI:Algebra (v.adicCompletion K) (w.1.adicCompletion L):=(finitePlaceAdicCompletionMap K L v w).toAlgebra
    u∈chosenFinitePlaceLocalNormSubgroup (K:=K) (L:=L) v ↔
      ∃ y:(w.1.adicCompletion L)ˣ,normUnits (v.adicCompletion K) (w.1.adicCompletion L) y=u := by
  let a:=chosenFinitePlaceExtension (L:=L) v
  let w:=finitePlaceExtensionEquivAbove (K:=K) (L:=L) v a
  letI:= (finitePlaceAdicCompletionMap K L v w).toAlgebra
  let eb:=finitePlaceCompletionRingEquiv v
  let el:=locEquiv v a
  have comm (x:(Loc v a)ˣ) : normUnits (v.adicCompletion K) (w.1.adicCompletion L) (Units.mapEquiv el.toMulEquiv x) =
      finitePlaceCompletionUnitsContinuousMulEquiv v (normUnits (Base v) (Loc v a) x) := by
    apply Units.ext
    change Algebra.norm (v.adicCompletion K) (el (x:Loc v a))=eb (Algebra.norm (Base v) (x:Loc v a))
    exact eb.symm_apply_eq.mp (Algebra.norm_eq_of_equiv_equiv eb el (comparison v a) (x:Loc v a)).symm
  constructor
  · rintro ⟨_,⟨y,rfl⟩,rfl⟩
    exact ⟨_,comm y⟩
  · rintro ⟨y,rfl⟩
    obtain ⟨x,rfl⟩ := (Units.mapEquiv el.toMulEquiv).surjective y
    exact ⟨_,⟨x,rfl⟩,(comm x).symm⟩

#print axioms galois
#print axioms chosen_norm
end
end TunnellAdicLocalization
