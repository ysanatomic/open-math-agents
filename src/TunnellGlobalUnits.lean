import TunnellGlobalUnitsLocal
import ClassFieldTheory.GlobalClassFieldTheory.Reciprocity.GlobalArtinCompatibility

/-! Local norms of global units in abelian extensions ramified at a single finite place. -/
namespace TunnellGlobalUnits

open NumberField IsDedekindDomain GlobalClassFieldTheory.Reciprocity
open AlgebraicNumberTheory.Valuations
open scoped IsMulCommutative

variable {K L : Type} [Field K] [NumberField K] [Field L] [NumberField L] [Algebra K L]
  [FiniteDimensional K L] [IsAbelianGalois K L]

/-- In a totally imaginary base, a global unit is a local norm at the only possibly
    ramified finite place of a finite abelian extension. -/
theorem globalUnit_one_prime_is_norm (v₀ : HeightOneSpectrum (𝓞 K))
    (hcomplex : ∀ v : InfinitePlace K, v.IsComplex)
    (hunram : ∀ v ≠ v₀, ChosenFinitePlaceIsUnramified (K:=K) (L:=L) v)
    (u : (𝓞 K)ˣ) :
    IdeleGroup.finiteComponent v₀ (IdeleGroup.principalIdele K (fieldUnit K u)) ∈
      chosenFinitePlaceLocalNormSubgroup (K:=K) (L:=L) v₀ := by
  rw [← chosenFinitePlaceArtinMonoidHom_ker]
  apply MonoidHom.mem_ker.mpr
  have h := chosenLocalArtin_product_principalIdele (K:=K) (L:=L) (fieldUnit K u)
  simp only [complex_symbol K L _ (hcomplex _),Finset.prod_const_one,one_mul] at h
  rwa [finprod_eq_single _ v₀ (fun v hv => globalUnit_unramified_symbol K L u v (hunram v hv))] at h

#print axioms globalUnit_one_prime_is_norm

end TunnellGlobalUnits
