import Mathlib.FieldTheory.Galois.Basic

/-! Galois base change and explicit generators in the compositum of the field
of one division lift and a field carrying the good models. -/
namespace TunnellCMCompositum
open IntermediateField
noncomputable section
set_option maxHeartbeats 350000
variable {D B : Type} [Field D] [Field B] [Algebra D B]

lemma included_image {N H : IntermediateField D B} (h : N≤H) :
    (inclusion h).fieldRange.map H.val=N := by
  ext x
  constructor
  · rintro ⟨y,⟨z,rfl⟩,rfl⟩; exact z.property
  · intro hx
    exact ⟨inclusion h ⟨x,hx⟩,⟨⟨x,hx⟩,rfl⟩,rfl⟩

variable (N F : IntermediateField D B)
local notation "H" => (N ⊔ F : IntermediateField D B)
local notation "nMap" => inclusion (le_sup_left : N≤H)
local notation "fMap" => inclusion (le_sup_right : F≤H)

lemma generates : (nMap).fieldRange ⊔ (fMap).fieldRange=⊤ := by
  apply IntermediateField.map_injective (H).val
  rw [IntermediateField.map_sup,included_image,included_image,←AlgHom.fieldRange_eq_map,IntermediateField.fieldRange_val]

theorem galois_of_ranges {K A C M : Type} [Field K] [Field A] [Field C] [Field M]
    [Algebra K A] [Algebra K C] [Algebra K M] [Algebra C M] [IsScalarTower K C M]
    [FiniteDimensional K A] [IsGalois K A] (a : A →ₐ[K] M)
    (ht : a.fieldRange ⊔ (IsScalarTower.toAlgHom K C M).fieldRange=⊤) : IsGalois C M := by
  let f:=IsScalarTower.toAlgHom K C M
  letI : IsGalois K a.fieldRange := IsGalois.of_algEquiv a.equivFieldRange
  letI : FiniteDimensional K a.fieldRange := Module.Finite.equiv a.equivFieldRange.toLinearEquiv
  letI : IsGalois f.fieldRange M := IsGalois.sup_right _ _ ht
  exact IsGalois.of_equiv_equiv (f:=f.equivFieldRange.symm.toRingEquiv) (g:=RingEquiv.refl M)
    (RingHom.ext (fun x => congrArg Subtype.val (f.equivFieldRange.apply_symm_apply x)))

theorem top_of_ranges {K A C M : Type} [Field K] [Field A] [Field C] [Field M]
    [Algebra K A] [Algebra K C] [Algebra K M] [Algebra C M] [IsScalarTower K C M]
    (a : A →ₐ[K] M) (ht : a.fieldRange ⊔ (IsScalarTower.toAlgHom K C M).fieldRange=⊤)
    (x y : A) (hxy : adjoin K {x,y}=⊤) : adjoin C {a x,a y}=⊤ := by
  let f:=IsScalarTower.toAlgHom K C M
  let P:=adjoin C ({a x,a y}:Set M)
  have hf : f.fieldRange≤P.restrictScalars K := by
    rintro _ ⟨z,rfl⟩; exact P.algebraMap_mem z
  have hj : adjoin K {x,y}≤(P.restrictScalars K).comap a := by
    apply adjoin_le_iff.mpr
    intro z hz
    change a z∈P
    rcases Set.mem_insert_iff.mp hz with hx|hy
    · rw [hx]; exact subset_adjoin C _ (Set.mem_insert _ _)
    · rw [Set.mem_singleton_iff.mp hy]
      exact subset_adjoin C _ (Set.mem_insert_of_mem _ (Set.mem_singleton _))
  have hn : a.fieldRange≤P.restrictScalars K := by
    rintro _ ⟨z,rfl⟩
    exact hj (show z∈adjoin K {x,y} by rw [hxy]; trivial)
  have he : a.fieldRange ⊔ f.fieldRange≤P.restrictScalars K := sup_le hn hf
  have ht' : (⊤ : IntermediateField K M)≤P.restrictScalars K := ht.ge.trans he
  exact top_unique (fun z _ => ht' (show z∈(⊤:IntermediateField K M) from trivial))


theorem galois [IsGalois D N] [FiniteDimensional D N] :
    letI : Algebra F H := (fMap).toAlgebra
    IsGalois F H := by
  letI : Algebra F H := (fMap).toAlgebra
  letI : IsScalarTower D F H := .of_algebraMap_eq' rfl
  exact galois_of_ranges (C:=F) nMap (generates N F)

theorem adjoin_top (x y : N) (hxy : adjoin D {x,y}=⊤) :
    letI : Algebra F H := (fMap).toAlgebra
    adjoin F {nMap x,nMap y}=⊤ := by
  letI : Algebra F H := (fMap).toAlgebra
  letI : IsScalarTower D F H := .of_algebraMap_eq' rfl
  exact top_of_ranges (C:=F) nMap (generates N F) x y hxy

end
end TunnellCMCompositum
#print axioms TunnellCMCompositum.galois
#print axioms TunnellCMCompositum.adjoin_top
