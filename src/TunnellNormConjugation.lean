import ClassFieldTheory.LocalClassFieldTheory.Finite.LocalReciprocity.SemilinearNaturality
import ValuedFieldTheory.LocalField.NonarchimedeanLocalField.GaloisIntegerRing

/-! In an abelian tower, the tame group acts trivially on the local norm quotient. -/
namespace TunnellNormDescent

open LocalClassFieldTheory LocalFieldTheory LocalFieldTheory.IsNonarchimedeanLocalField
open scoped ValuativeRel IsMulCommutative

variable (K T L : Type) [Field K] [ValuativeRel K] [Field T] [ValuativeRel T]
  [TopologicalSpace T] [IsNonarchimedeanLocalField T] [Field L]
  [Algebra K T] [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation T)]
  [IsIntegralClosure 𝒪[T] 𝒪[K] T]

lemma galois_valuation_compatible (δ : Gal(T/K)) : SemilinearValuationCompatible T T δ.toRingEquiv := by
  letI : Algebra T T := δ.toRingEquiv.toRingHom.toAlgebra
  change (ValuativeRel.valuation T).HasExtension (ValuativeRel.valuation T)
  refine ⟨?_⟩
  apply Valuation.isEquiv_iff_val_le_one.mpr
  intro x
  change ValuativeRel.valuation T x ≤ 1 ↔ ValuativeRel.valuation T (δ x) ≤ 1
  constructor
  · intro h
    exact galoisGroup_mem_integerRing_of_isIntegralClosure K T δ ⟨x,h⟩
  · intro h
    change x ∈ (ValuativeRel.valuation T).integer
    simpa using galoisGroup_mem_integerRing_of_isIntegralClosure K T δ.symm ⟨δ x,h⟩

variable [Algebra T L] [Algebra K L] [IsScalarTower K T L] [FiniteDimensional T L]
  [IsAbelianGalois K L]

/-- The displacement δ(x)/x of every unit at a lower level is an actual norm from
    the upper level when the Galois tower is abelian. -/
theorem displacement_is_norm (δ:Gal(T/K)) (σ:Gal(L/K))
    (h : ∀ x:T, σ (algebraMap T L x)=algebraMap T L (δ x)) (x:Tˣ) :
    ∃ y:Lˣ, normUnits T L y=Units.map δ.toRingEquiv.toMonoidHom x/x := by
  have : IsAbelianGalois T L := IsAbelianGalois.tower_top K T L
  let Art := abelianLocalArtinMonoidHom T L
  have he := abelianLocalArtinMonoidHom_semilinear_conjugation_apply T T L L δ.toRingEquiv σ.toRingEquiv h
    (galois_valuation_compatible K T δ) x
  have hc (g:Gal(L/T)) : semilinearGaloisGroupCongr T T L L δ.toRingEquiv σ.toRingEquiv h g =g := by
    ext y
    obtain ⟨z,rfl⟩ := σ.surjective y
    exact (semilinearGaloisGroupCongr_apply_equiv T T L L δ.toRingEquiv σ.toRingEquiv h g z).trans
      (congrArg (fun f:Gal(L/K) => f z) (mul_comm σ (g.restrictScalars K)))
  have hArt : Art (Units.map δ.toRingEquiv.toMonoidHom x / x)=1 := by
    have hh : Art (Units.map δ.toRingEquiv.toMonoidHom x)=Art x := he.symm.trans (hc _)
    exact (map_div Art _ _).trans (div_eq_one.mpr hh)
  have hnorm := (MonoidHom.mem_ker.mpr hArt)
  rw [show Art.ker=localNormSubgroup T L from abelianLocalArtinMonoidHom_ker T L] at hnorm
  exact hnorm

#print axioms displacement_is_norm
end TunnellNormDescent
