import TunnellAdicDecomposition
import TunnellKummer

/-! Transfer of generators, abelianity, and scalar towers to the actual adic completions. -/
namespace TunnellAdicGenerators
open NumberField IsDedekindDomain IsDedekindDomain.HeightOneSpectrum TunnellAdicLocalization TunnellKummer
open scoped Classical IsMulCommutative
noncomputable section
variable {K L:Type} [Field K] [NumberField K] [Field L] [NumberField L] [Algebra K L] [FiniteDimensional K L] [IsGalois K L]
variable (v:HeightOneSpectrum (𝓞 K)) (W:Fibre (L:=L) v)
local notation "F" => adicCompletion K v
local notation "M" => adicCompletion L (Subtype.val W)
local instance alg : Algebra F M := (finitePlaceAdicCompletionMap K L v W).toAlgebra

theorem abelian [IsAbelianGalois K L] : IsAbelianGalois F M := by
  haveI:=TunnellAdicLocalization.galois v W
  obtain ⟨r,hi,_⟩:=TunnellAdicDecomposition.action v W
  exact {is_comm.comm x y:=hi (by rw [r.map_mul,r.map_mul,mul_comm])}

theorem generate {x y:L} (hh:IntermediateField.adjoin K {x,y}=⊤) :
    IntermediateField.adjoin F {algebraMap L M x,algebraMap L M y}=⊤ := by
  haveI:=TunnellAdicLocalization.galois v W
  haveI:=finitePlaceAdicCompletionMap_moduleFinite K L v W
  obtain ⟨r,hi,hr⟩:=TunnellAdicDecomposition.action v W
  let U:=IntermediateField.adjoin F {algebraMap L M x,algebraMap L M y}
  have h:U.fixingSubgroup=⊥ := by
    apply le_antisymm _ bot_le
    intro g hg
    apply Subgroup.mem_bot.mpr
    apply hi
    rw [r.map_one]
    have hx:algebraMap L M (r g x)=algebraMap L M x := (hr g x).symm.trans
      (hg ⟨_,IntermediateField.subset_adjoin F _ (Set.mem_insert _ _)⟩)
    have hy:algebraMap L M (r g y)=algebraMap L M y := (hr g y).symm.trans
      (hg ⟨_,IntermediateField.subset_adjoin F _ (Set.mem_insert_of_mem _ (Set.mem_singleton _))⟩)
    exact autos_eq_of_generate hh (r g) 1 ((algebraMap L M).injective hx) ((algebraMap L M).injective hy)
  change U=⊤
  rw [←IsGalois.fixedField_fixingSubgroup U,h,IntermediateField.fixedField_bot]

theorem tower {N:Type} [Field N] [NumberField N] [Algebra K N] [Algebra L N] [IsScalarTower K L N]
    (V:Fibre (L:=N) W.1) :
    letI:Algebra M (V.1.adicCompletion N):=(finitePlaceAdicCompletionMap L N W.1 V).toAlgebra
    let h:= (finitePlaceBelow_finitePlaceBelow (K:=K) («M»:=L) (L:=N) V.1).symm.trans ((congrArg (finitePlaceBelow (K:=K)) V.2).trans W.2)
    letI:Algebra F (V.1.adicCompletion N):=(finitePlaceAdicCompletionMap K N v ⟨V.1,h⟩).toAlgebra
    IsScalarTower F M (V.1.adicCompletion N) := by
  letI:Algebra M (V.1.adicCompletion N):=(finitePlaceAdicCompletionMap L N W.1 V).toAlgebra
  let h:= (finitePlaceBelow_finitePlaceBelow (K:=K) («M»:=L) (L:=N) V.1).symm.trans ((congrArg (finitePlaceBelow (K:=K)) V.2).trans W.2)
  letI:Algebra F (V.1.adicCompletion N):=(finitePlaceAdicCompletionMap K N v ⟨V.1,h⟩).toAlgebra
  apply IsScalarTower.of_algebraMap_eq
  intro z
  exact (finitePlaceAdicCompletionMap_comp K N v W.1 V.1 W.2 V.2 _ z).symm

#print axioms abelian
#print axioms generate
#print axioms tower
end
end TunnellAdicGenerators
