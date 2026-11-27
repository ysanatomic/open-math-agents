import TunnellAdicDecomposition

/-! Comparison of field norms under completion at a unique finite place. -/
namespace TunnellAdicNormComparison
open NumberField IsDedekindDomain IsDedekindDomain.HeightOneSpectrum TunnellAdicLocalization LocalFieldTheory
open scoped Classical
noncomputable section
variable {K L:Type} [Field K] [NumberField K] [Field L] [NumberField L] [Algebra K L] [FiniteDimensional K L] [IsGalois K L]
variable (v:HeightOneSpectrum (𝓞 K)) (w:Fibre (L:=L) v)
local notation "F" => adicCompletion K v
local notation "M" => adicCompletion L (Subtype.val w)
local instance : Algebra F M := (finitePlaceAdicCompletionMap K L v w).toAlgebra

theorem norm (hu:∀ w':Fibre (L:=L) v,w'=w) (x:L) :
    Algebra.norm F (algebraMap L M x)=algebraMap K F (Algebra.norm K x) := by
  haveI:=TunnellAdicLocalization.galois v w
  haveI:=finitePlaceAdicCompletionMap_moduleFinite K L v w
  obtain ⟨e,he,_⟩:=TunnellAdicDecomposition.unique_action v w hu
  apply (algebraMap F M).injective
  change algebraMap F M (Algebra.norm F (algebraMap L M x))=finitePlaceAdicCompletionMap K L v w (algebraMap K F (Algebra.norm K x))
  have hcoe:finitePlaceAdicCompletionMap K L v w (algebraMap K F (Algebra.norm K x))=algebraMap L M (algebraMap K L (Algebra.norm K x)):=finitePlaceAdicCompletionMap_coe K L v w (Algebra.norm K x)
  rw [Algebra.norm_eq_prod_automorphisms,hcoe]
  change (∏ g:Gal(M/F),g (algebraMap L M x))=algebraMap L M (algebraMap K L (Algebra.norm K x))
  rw [Algebra.norm_eq_prod_automorphisms,map_prod]
  exact (Fintype.prod_equiv e.toEquiv _ _ fun g=>(he g x).symm).symm

theorem norm_unit (hu:∀ w':Fibre (L:=L) v,w'=w) (x:Lˣ) :
    normUnits F M (Units.map (algebraMap L M).toMonoidHom x)=
      Units.map (algebraMap K F).toMonoidHom (normUnits K L x) :=
  Units.ext (norm v w hu (x:L))

#print axioms norm_unit
end
end TunnellAdicNormComparison
