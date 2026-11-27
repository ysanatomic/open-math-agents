import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H1_R1_H2_R1_H2_R1
import Mathlib

/-! Cyclic Tate cohomology of units in the separable closure at rational finite places. Some declarations are adapted from ClassFieldTheory at revision 2e6280f9d2579705a0cc6c76ec68c2b60f9c601a, https://github.com/n-yamaguchi-0729/ClassFieldTheory. -/
/-
                                 Apache License
                           Version 2.0, January 2004
                        http://www.apache.org/licenses/

   TERMS AND CONDITIONS FOR USE, REPRODUCTION, AND DISTRIBUTION

   1. Definitions.

      "License" shall mean the terms and conditions for use, reproduction,
      and distribution as defined by Sections 1 through 9 of this document.

      "Licensor" shall mean the copyright owner or entity authorized by
      the copyright owner that is granting the License.

      "Legal Entity" shall mean the union of the acting entity and all
      other entities that control, are controlled by, or are under common
      control with that entity. For the purposes of this definition,
      "control" means (i) the power, direct or indirect, to cause the
      direction or management of such entity, whether by contract or
      otherwise, or (ii) ownership of fifty percent (50%) or more of the
      outstanding shares, or (iii) beneficial ownership of such entity.

      "You" (or "Your") shall mean an individual or Legal Entity
      exercising permissions granted by this License.

      "Source" form shall mean the preferred form for making modifications,
      including but not limited to software source code, documentation
      source, and configuration files.

      "Object" form shall mean any form resulting from mechanical
      transformation or translation of a Source form, including but
      not limited to compiled object code, generated documentation,
      and conversions to other media types.

      "Work" shall mean the work of authorship, whether in Source or
      Object form, made available under the License, as indicated by a
      copyright notice that is included in or attached to the work
      (an example is provided in the Appendix below).

      "Derivative Works" shall mean any work, whether in Source or Object
      form, that is based on (or derived from) the Work and for which the
      editorial revisions, annotations, elaborations, or other modifications
      represent, as a whole, an original work of authorship. For the purposes
      of this License, Derivative Works shall not include works that remain
      separable from, or merely link (or bind by name) to the interfaces of,
      the Work and Derivative Works thereof.

      "Contribution" shall mean any work of authorship, including
      the original version of the Work and any modifications or additions
      to that Work or Derivative Works thereof, that is intentionally
      submitted to Licensor for inclusion in the Work by the copyright owner
      or by an individual or Legal Entity authorized to submit on behalf of
      the copyright owner. For the purposes of this definition, "submitted"
      means any form of electronic, verbal, or written communication sent
      to the Licensor or its representatives, including but not limited to
      communication on electronic mailing lists, source code control systems,
      and issue tracking systems that are managed by, or on behalf of, the
      Licensor for the purpose of discussing and improving the Work, but
      excluding communication that is conspicuously marked or otherwise
      designated in writing by the copyright owner as "Not a Contribution."

      "Contributor" shall mean Licensor and any individual or Legal Entity
      on behalf of whom a Contribution has been received by Licensor and
      subsequently incorporated within the Work.

   2. Grant of Copyright License. Subject to the terms and conditions of
      this License, each Contributor hereby grants to You a perpetual,
      worldwide, non-exclusive, no-charge, royalty-free, irrevocable
      copyright license to reproduce, prepare Derivative Works of,
      publicly display, publicly perform, sublicense, and distribute the
      Work and such Derivative Works in Source or Object form.

   3. Grant of Patent License. Subject to the terms and conditions of
      this License, each Contributor hereby grants to You a perpetual,
      worldwide, non-exclusive, no-charge, royalty-free, irrevocable
      (except as stated in this section) patent license to make, have made,
      use, offer to sell, sell, import, and otherwise transfer the Work,
      where such license applies only to those patent claims licensable
      by such Contributor that are necessarily infringed by their
      Contribution(s) alone or by combination of their Contribution(s)
      with the Work to which such Contribution(s) was submitted. If You
      institute patent litigation against any entity (including a
      cross-claim or counterclaim in a lawsuit) alleging that the Work
      or a Contribution incorporated within the Work constitutes direct
      or contributory patent infringement, then any patent licenses
      granted to You under this License for that Work shall terminate
      as of the date such litigation is filed.

   4. Redistribution. You may reproduce and distribute copies of the
      Work or Derivative Works thereof in any medium, with or without
      modifications, and in Source or Object form, provided that You
      meet the following conditions:

      (a) You must give any other recipients of the Work or
          Derivative Works a copy of this License; and

      (b) You must cause any modified files to carry prominent notices
          stating that You changed the files; and

      (c) You must retain, in the Source form of any Derivative Works
          that You distribute, all copyright, patent, trademark, and
          attribution notices from the Source form of the Work,
          excluding those notices that do not pertain to any part of
          the Derivative Works; and

      (d) If the Work includes a "NOTICE" text file as part of its
          distribution, then any Derivative Works that You distribute must
          include a readable copy of the attribution notices contained
          within such NOTICE file, excluding those notices that do not
          pertain to any part of the Derivative Works, in at least one
          of the following places: within a NOTICE text file distributed
          as part of the Derivative Works; within the Source form or
          documentation, if provided along with the Derivative Works; or,
          within a display generated by the Derivative Works, if and
          wherever such third-party notices normally appear. The contents
          of the NOTICE file are for informational purposes only and
          do not modify the License. You may add Your own attribution
          notices within Derivative Works that You distribute, alongside
          or as an addendum to the NOTICE text from the Work, provided
          that such additional attribution notices cannot be construed
          as modifying the License.

      You may add Your own copyright statement to Your modifications and
      may provide additional or different license terms and conditions
      for use, reproduction, or distribution of Your modifications, or
      for any such Derivative Works as a whole, provided Your use,
      reproduction, and distribution of the Work otherwise complies with
      the conditions stated in this License.

   5. Submission of Contributions. Unless You explicitly state otherwise,
      any Contribution intentionally submitted for inclusion in the Work
      by You to the Licensor shall be under the terms and conditions of
      this License, without any additional terms or conditions.
      Notwithstanding the above, nothing herein shall supersede or modify
      the terms of any separate license agreement you may have executed
      with Licensor regarding such Contributions.

   6. Trademarks. This License does not grant permission to use the trade
      names, trademarks, service marks, or product names of the Licensor,
      except as required for reasonable and customary use in describing the
      origin of the Work and reproducing the content of the NOTICE file.

   7. Disclaimer of Warranty. Unless required by applicable law or
      agreed to in writing, Licensor provides the Work (and each
      Contributor provides its Contributions) on an "AS IS" BASIS,
      WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
      implied, including, without limitation, any warranties or conditions
      of TITLE, NON-INFRINGEMENT, MERCHANTABILITY, or FITNESS FOR A
      PARTICULAR PURPOSE. You are solely responsible for determining the
      appropriateness of using or redistributing the Work and assume any
      risks associated with Your exercise of permissions under this License.

   8. Limitation of Liability. In no event and under no legal theory,
      whether in tort (including negligence), contract, or otherwise,
      unless required by applicable law (such as deliberate and grossly
      negligent acts) or agreed to in writing, shall any Contributor be
      liable to You for damages, including any direct, indirect, special,
      incidental, or consequential damages of any character arising as a
      result of this License or out of the use or inability to use the
      Work (including but not limited to damages for loss of goodwill,
      work stoppage, computer failure or malfunction, or any and all
      other commercial damages or losses), even if such Contributor
      has been advised of the possibility of such damages.

   9. Accepting Warranty or Additional Liability. While redistributing
      the Work or Derivative Works thereof, You may choose to offer,
      and charge a fee for, acceptance of support, warranty, indemnity,
      or other liability obligations and/or rights consistent with this
      License. However, in accepting such obligations, You may act only
      on Your own behalf and on Your sole responsibility, not on behalf
      of any other Contributor, and only if You agree to indemnify,
      defend, and hold each Contributor harmless for any liability
      incurred by, or claims asserted against, such Contributor by reason
      of your accepting any such warranty or additional liability.

   END OF TERMS AND CONDITIONS

   APPENDIX: How to apply the Apache License to your work.

      To apply the Apache License to your work, attach the following
      boilerplate notice, with the fields enclosed by brackets "{}"
      replaced with your own identifying information. (Don't include
      the brackets!)  The text should be enclosed in the appropriate
      comment syntax for the file format. We also recommend that a
      file or class name and description of purpose be included on the
      same "printed page" as the copyright notice for easier
      identification within third-party archives.

   Copyright {yyyy} {name of copyright owner}

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.

-/

/- GaloisCohomology.Cyclic.IntegralRepUniverse -/
section
 
abbrev IntegralRepGroupType := Type 0
end

/- GaloisCohomology.Cyclic.TateComparison -/
section
noncomputable section
open CategoryTheory
namespace TateCohomology
universe u
 

def isoZeroBoundary {R G : Type u} [CommRing R] [Group G] [Fintype G]
    (A : Rep R G) :
    tateCohomology A 0 ≅
      (ShortComplex.mk A.norm.toModuleCatHom (groupCohomology.d₀₁ A)
        (Rep.norm_comp_d_eq_zero A)).homology := by
  let S : ShortComplex (ModuleCat R) :=
    .mk A.norm.toModuleCatHom (groupCohomology.d₀₁ A)
      (Rep.norm_comp_d_eq_zero A)
  let eS : (tateComplex A).sc 0 ≅ S :=
    (tateComplex A).isoSc' (-1) 0 1 (by simp) (by simp) ≪≫
      ShortComplex.isoMk
        (by exact groupHomology.chainsIso₀ A)
        (groupCohomology.cochainsIso₀ A)
        (groupCohomology.cochainsIso₁ A)
        (by
          change
            CategoryStruct.comp (groupHomology.chainsIso₀ A).hom A.norm.toModuleCatHom =
              CategoryStruct.comp A.tateNorm (groupCohomology.cochainsIso₀ A).hom
          rw [Rep.tateNorm]
          simp)
        (groupCohomology.comp_d₀₁_eq A)
  exact ShortComplex.homologyMapIso eS
 

def isoFiniteCyclicZero {R G : Type u} [CommRing R] [CommGroup G] [Fintype G]
    (A : Rep R G) (g : G) (hg : ∀ x, x ∈ Subgroup.zpowers g) :
    tateCohomology A 0 ≅
      (Rep.FiniteCyclicGroup.normHomCompSub A g).homology := by
  let S : ShortComplex (ModuleCat R) :=
    .mk A.norm.toModuleCatHom (groupCohomology.d₀₁ A)
      (Rep.norm_comp_d_eq_zero A)
  let T := Rep.FiniteCyclicGroup.normHomCompSub A g
  have hker : LinearMap.ker S.g.hom = LinearMap.ker T.g.hom := by
    dsimp [S, T]
    rw [groupCohomology.d₀₁_ker_eq_invariants]
    ext x
    simpa [Rep.sub_hom, sub_eq_zero] using
      Representation.mem_invariants_iff_of_forall_mem_zpowers A.ρ g hg x
  let eK : LinearMap.ker S.g.hom ≃ₗ[R] LinearMap.ker T.g.hom :=
    LinearEquiv.ofEq _ _ hker
  have hboundary :
      (LinearMap.range S.moduleCatToCycles).map eK.toLinearMap =
        LinearMap.range T.moduleCatToCycles := by
    ext x
    constructor
    · rintro ⟨y, ⟨z, rfl⟩, rfl⟩
      refine ⟨z, ?_⟩
      apply Subtype.ext
      rfl
    · rintro ⟨z, rfl⟩
      refine ⟨S.moduleCatToCycles z, ⟨z, rfl⟩, ?_⟩
      apply Subtype.ext
      rfl
  let eQ : S.moduleCatLeftHomologyData.H ≅ T.moduleCatLeftHomologyData.H :=
    (Submodule.Quotient.equiv _ _ eK hboundary).toModuleIso
  exact isoZeroBoundary A ≪≫
    S.moduleCatHomologyIso ≪≫ eQ ≪≫ T.moduleCatHomologyIso.symm
 

def isoFiniteCyclicNegOne {R G : Type u} [CommRing R] [CommGroup G] [Fintype G]
    (A : Rep R G) (g : G) (hg : ∀ x, x ∈ Subgroup.zpowers g) :
    tateCohomology A (-1) ≅
      (Rep.FiniteCyclicGroup.subCompNormHom A g).homology := by
  let S : ShortComplex (ModuleCat R) :=
    .mk (groupHomology.d₁₀ A) A.norm.toModuleCatHom (Rep.comp_eq_zero A)
  let eS : (tateComplex A).sc (-1) ≅ S :=
    (tateComplex A).isoSc' (-2) (-1) 0 (by simp) (by simp) ≪≫
      ShortComplex.isoMk
        (groupHomology.chainsIso₁ A)
        (groupHomology.chainsIso₀ A)
        (groupCohomology.cochainsIso₀ A)
        (groupHomology.comp_d₁₀_eq A)
        (by simp [S, tateComplex, Rep.tateNorm]; rfl)
  let T := Rep.FiniteCyclicGroup.subCompNormHom A g
  have hRange : LinearMap.range S.f.hom = LinearMap.range T.f.hom := by
    dsimp [S, T]
    rw [groupHomology.range_d₁₀_eq_coinvariantsKer]
    exact Representation.FiniteCyclicGroup.coinvariantsKer_eq_range A.ρ g hg
  let eK : LinearMap.ker S.g.hom ≃ₗ[R] LinearMap.ker T.g.hom :=
    LinearEquiv.ofEq _ _ rfl
  have hboundary :
      (LinearMap.range S.moduleCatToCycles).map eK.toLinearMap =
        LinearMap.range T.moduleCatToCycles := by
    ext x
    constructor
    · rintro ⟨y, ⟨z, rfl⟩, rfl⟩
      have hz : S.f z ∈ LinearMap.range T.f.hom := by
        rw [← hRange]
        exact ⟨z, rfl⟩
      rcases hz with ⟨w, hw⟩
      refine ⟨w, ?_⟩
      apply Subtype.ext
      exact hw
    · rintro ⟨w, rfl⟩
      have hw : T.f w ∈ LinearMap.range S.f.hom := by
        rw [hRange]
        exact ⟨w, rfl⟩
      rcases hw with ⟨z, hz⟩
      refine ⟨S.moduleCatToCycles z, ⟨z, rfl⟩, ?_⟩
      apply Subtype.ext
      exact hz
  let eQ : S.moduleCatLeftHomologyData.H ≅ T.moduleCatLeftHomologyData.H :=
    (Submodule.Quotient.equiv _ _ eK hboundary).toModuleIso
  exact ShortComplex.homologyMapIso eS ≪≫
    S.moduleCatHomologyIso ≪≫ eQ ≪≫ T.moduleCatHomologyIso.symm
end TateCohomology
end

/- GaloisCohomology.Cyclic.NormKernelVanishing -/
section
namespace CyclicCohomology
noncomputable section
open CategoryTheory
universe u
 

theorem isCyclic_of_generator {G : Type} [Group G] (g : G)
    (hg : ∀ x : G, x ∈ Subgroup.zpowers g) : IsCyclic G := by
  rw [isCyclic_iff_exists_zpowers_eq_top]
  refine ⟨g, ?_⟩
  ext x
  constructor
  · intro _
    exact Subgroup.mem_top x
  · intro _
    exact hg x
 



abbrev extensionSubgroup {G : Type u} [Group G] [TopologicalSpace G]
    (K L : ClosedSubgroup G) (_hLK : L.toSubgroup ≤ K.toSubgroup) :
    Subgroup K.toSubgroup :=
  L.toSubgroup.subgroupOf K.toSubgroup
 




noncomputable def extensionFixedRepresentation {G : Type} [Group G]
    [TopologicalSpace G] (A : Rep.{0} ℤ G) (K L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.toSubgroup)
    (hnormal : (extensionSubgroup K L hLK).Normal) :
    Rep ℤ (K.toSubgroup ⧸ extensionSubgroup K L hLK) := by
  exact Rep.quotientToInvariants
    (Rep.res K.toSubgroup.subtype A)
    (extensionSubgroup K L hLK)
end
end CyclicCohomology
end

/- ClassFieldTheory.AbstractClassFieldTheory.Degree.Fields -/
section
namespace ClassFormation
open CyclicCohomology
noncomputable section
universe u
variable {G : Type u} [Group G] [TopologicalSpace G]
 

def baseField (G : Type u) [Group G] [TopologicalSpace G] : ClosedSubgroup G where
  toSubgroup := ⊤
  isClosed' := isClosed_univ
 
theorem le_baseField (K : ClosedSubgroup G) :
    K.toSubgroup ≤ (baseField G).toSubgroup :=
  le_top
namespace DegreeData
namespace FiniteResidueAbstractField

end FiniteResidueAbstractField
end DegreeData
namespace DegreeData
 



structure AbstractExtension (G : Type*) [Group G] [TopologicalSpace G] where
   
  field : ClosedSubgroup G
   
  base : ClosedSubgroup G
   
  below : field.toSubgroup ≤ base.toSubgroup
namespace AbstractExtension
namespace Tower

end Tower
end AbstractExtension
namespace GaloisSubextension
variable {K : ClosedSubgroup G}
end GaloisSubextension
 



structure FiniteAbstractExtension (G : Type*) [Group G] [TopologicalSpace G]
    extends AbstractExtension G where
   
  finiteQuotient :
    Finite
      (toAbstractExtension.base.toSubgroup ⧸
        extensionSubgroup toAbstractExtension.base toAbstractExtension.field
          toAbstractExtension.below)
namespace FiniteAbstractExtension
variable (E : FiniteAbstractExtension G)
 
def subgroup : Subgroup E.base.toSubgroup :=
  extensionSubgroup E.base E.field E.below
 
def quotient : Type u :=
  E.base.toSubgroup ⧸ E.subgroup
 



def ofInclusion (field base : ClosedSubgroup G)
    (below : field.toSubgroup ≤ base.toSubgroup)
    [hfinite : Finite
      (base.toSubgroup ⧸ extensionSubgroup base field below)] :
    FiniteAbstractExtension G where
  field := field
  base := base
  below := below
  finiteQuotient := hfinite
 
instance quotientFinite :
    Finite E.quotient := by
  simpa [quotient, subgroup] using E.finiteQuotient
 
def degree : ℕ+ :=
  by
    letI : Nonempty E.quotient :=
      ⟨QuotientGroup.mk 1⟩
    exact ⟨Nat.card E.quotient, Nat.card_pos⟩
 
@[simp] theorem degree_coe :
    (E.degree : ℕ) = Nat.card E.quotient :=
  rfl
 

@[simp] theorem extensionSubgroup_index_eq_degree :
    (extensionSubgroup E.base E.field E.below).index = (E.degree : ℕ) := by
  rw [Subgroup.index, E.degree_coe]
  rfl
end FiniteAbstractExtension
namespace FiniteTower

end FiniteTower
namespace FiniteResidueAbstractField

end FiniteResidueAbstractField
namespace FiniteResidueAbstractExtension

end FiniteResidueAbstractExtension
end DegreeData
 
structure FiniteAbstractField (G : Type u) [Group G] [TopologicalSpace G] where
   
  field : ClosedSubgroup G
   
  finite : Finite ((baseField G).toSubgroup ⧸
    extensionSubgroup (baseField G) field (le_baseField field))
namespace FiniteAbstractField
end FiniteAbstractField
namespace FiniteAbstractFieldExtension
end FiniteAbstractFieldExtension
end
end ClassFormation
end

/- GaloisCohomology.Kummer.Abstract.KummerAbelianAssembly -/
section
namespace KummerTheory
open CyclicCohomology
noncomputable section
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
 

@[simp]
theorem mem_extensionSubgroup_iff
    {G : Type*} [Group G] [TopologicalSpace G]
    (K L : ClosedSubgroup G) (hLK : L.toSubgroup ≤ K.toSubgroup)
    (k : K.toSubgroup) :
    k ∈ extensionSubgroup (G := G) K L hLK ↔ (k : G) ∈ L :=
  Iff.rfl
end
end KummerTheory
end

/- GaloisCohomology.Kummer.Abstract.KummerDelta -/
section
namespace KummerTheory
open CyclicCohomology
noncomputable section
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
 

def ambientFixedAddSubgroup (A : Rep ℤ G) (H : ClosedSubgroup G) :
    AddSubgroup A.V := by
  exact
    { carrier := {a | ∀ h : H.toSubgroup, A.ρ h.1 a = a}
      zero_mem' := by simp
      add_mem' := by
        intro a b ha hb h
        rw [map_add, ha h, hb h]
      neg_mem' := by
        intro a ha h
        rw [map_neg, ha h] }
end
end KummerTheory
end

/- ClassFieldTheory.AbstractClassFieldTheory.Degree.Norm -/
section
namespace ClassFormation
open KummerTheory
open CyclicCohomology
noncomputable section
open scoped BigOperators
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
 


def relativeCosetAction
    (A : Rep ℤ G) (K L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.toSubgroup)
    (a : ambientFixedAddSubgroup A L)
    (q : K.toSubgroup ⧸ extensionSubgroup K L hLK) : A.V :=
  Quotient.liftOn' q (fun k : K.toSubgroup => A.ρ k.1 a.1) (by
    intro x y hxy
    have hmem : x⁻¹ * y ∈ extensionSubgroup K L hLK :=
      QuotientGroup.leftRel_apply.mp hxy
    let l : L.toSubgroup := ⟨(x⁻¹ * y).1, hmem⟩
    have hy : y = x * ⟨l.1, hLK l.2⟩ := by
      apply Subtype.ext
      simp [l]
    rw [hy]
    change A.ρ x.1 a.1 = A.ρ (x.1 * l.1) a.1
    rw [map_mul]
    change A.ρ x.1 a.1 = A.ρ x.1 (A.ρ l.1 a.1)
    rw [a.2 l])
 
@[simp]
theorem relativeCosetAction_mk
    (A : Rep ℤ G) (K L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.toSubgroup)
    (a : ambientFixedAddSubgroup A L) (k : K.toSubgroup) :
    relativeCosetAction A K L hLK a (QuotientGroup.mk k) = A.ρ k.1 a.1 :=
  rfl
end
end ClassFormation
end

/- ClassFieldTheory.AbstractClassFieldTheory.Reciprocity.Construction.UnitCohomologyAxiom -/
section
namespace ClassFormation
open KummerTheory
open CyclicCohomology
noncomputable section
open CategoryTheory
universe u
section Generic
variable {G : Type u} [Group G] [TopologicalSpace G]
 

structure FiniteCyclicSubextension (K : FiniteAbstractField G) where
   
  field : ClosedSubgroup G
   
  below : field.toSubgroup ≤ K.field.toSubgroup
   
  normal : (extensionSubgroup K.field field below).Normal
   
  finite : Finite (K.field.toSubgroup ⧸
    extensionSubgroup K.field field below)
   
  generator : K.field.toSubgroup ⧸ extensionSubgroup K.field field below
   
  generates : ∀ x, x ∈ Subgroup.zpowers generator
namespace FiniteCyclicSubextension
variable {K : FiniteAbstractField G}
 

abbrev toFiniteAbstractExtension (E : FiniteCyclicSubextension K) :
    DegreeData.FiniteAbstractExtension G where
  field := E.field
  base := K.field
  below := E.below
  finiteQuotient := E.finite
 
instance (E : FiniteCyclicSubextension K) :
    (extensionSubgroup K.field E.field E.below).Normal :=
  E.normal
 
instance (E : FiniteCyclicSubextension K) :
    Finite (K.field.toSubgroup ⧸ extensionSubgroup K.field E.field E.below) :=
  E.finite
 
noncomputable instance (E : FiniteCyclicSubextension K) :
    Fintype (K.field.toSubgroup ⧸ extensionSubgroup K.field E.field E.below) :=
  Fintype.ofFinite _
end FiniteCyclicSubextension
end Generic
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]

namespace FiniteUnramifiedCyclicExtension
variable {K : FiniteAbstractField G}
end FiniteUnramifiedCyclicExtension
namespace FiniteCyclicSubextension
variable {K : FiniteAbstractField G}
 

noncomputable def fixedRepresentation (E : FiniteCyclicSubextension K)
    (A : Rep ℤ G) :
    Rep ℤ (K.field.toSubgroup ⧸ extensionSubgroup K.field E.field E.below) :=
  extensionFixedRepresentation A K.field E.field E.below E.normal
end FiniteCyclicSubextension
namespace ValuationData
end ValuationData
namespace FiniteUnramifiedCyclicExtension
variable {K : FiniteAbstractField G}
end FiniteUnramifiedCyclicExtension
namespace ValuationData
end ValuationData
end
end ClassFormation
end

/- ClassFieldTheory.AbstractClassFieldTheory.Reciprocity.ClassFieldAxiom -/
section
namespace ClassFormation
open CyclicCohomology
noncomputable section
open CategoryTheory
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
 

structure ClassFieldAxiomCohomologyData (A : Rep ℤ G)
    (K : FiniteAbstractField G) (E : FiniteCyclicSubextension K) : Prop where
   
  finiteTateHZero : Finite (tateCohomology (E.fixedRepresentation A) 0)
   
  finiteTateHMinusOne :
    Finite (tateCohomology (E.fixedRepresentation A) (-1))
   
  tateHZero_card :
    Nat.card (tateCohomology (E.fixedRepresentation A) 0) =
      (E.toFiniteAbstractExtension.degree : ℕ)
   
  tateHMinusOne_card :
    Nat.card (tateCohomology (E.fixedRepresentation A) (-1)) = 1
 






def SatisfiesClassFieldAxiom (A : Rep ℤ G) : Prop :=
  ∀ (K : FiniteAbstractField G) (E : FiniteCyclicSubextension K),
    ClassFieldAxiomCohomologyData A K E
namespace SatisfiesClassFieldAxiom
variable {A : Rep ℤ G}
end SatisfiesClassFieldAxiom
end
end ClassFormation
end

/- ClassFieldTheory.AbstractClassFieldTheory.Reciprocity.FieldRepresentation -/
section
namespace ClassFormation
open KummerTheory
open CyclicCohomology
noncomputable section
open scoped BigOperators
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
 

def extensionFixedRepresentationEquiv
    (A : Rep ℤ G) (K L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.toSubgroup)
    (hnormal : (extensionSubgroup K L hLK).Normal) :
    (extensionFixedRepresentation A K L hLK hnormal).V ≃+
      ambientFixedAddSubgroup A L where
  toFun x := ⟨x.1, by
    intro l
    exact x.2 ⟨⟨l.1, hLK l.2⟩, l.2⟩⟩
  invFun a := ⟨a.1, by
    intro s
    let l : L.toSubgroup := ⟨s.1.1, s.2⟩
    change A.ρ s.1.1 a.1 = a.1
    exact a.2 l⟩
  left_inv x := by
    apply Subtype.ext
    rfl
  right_inv a := by
    apply Subtype.ext
    rfl
  map_add' _ _ := by
    apply Subtype.ext
    rfl
 

theorem extensionFixedRepresentation_action_coe
    (A : Rep ℤ G) (K L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.toSubgroup)
    (hnormal : (extensionSubgroup K L hLK).Normal)
    (q : K.toSubgroup ⧸ extensionSubgroup K L hLK)
    (a : (extensionFixedRepresentation A K L hLK hnormal).V) :
    ((extensionFixedRepresentation A K L hLK hnormal).ρ q a).1 =
      relativeCosetAction A K L hLK
        (extensionFixedRepresentationEquiv A K L hLK hnormal a) q := by
  let := hnormal
  refine Quotient.inductionOn' q ?_
  intro k
  rw [relativeCosetAction_mk]
  rfl
end
end ClassFormation
end

/- ClassFieldTheory.AbstractClassFieldTheory.Reciprocity.FiniteGaloisSubextension -/
section
namespace ClassFormation
open KummerTheory
open CyclicCohomology
noncomputable section
universe u
section GroupOnly
variable {G : Type u} [Group G] [TopologicalSpace G]
namespace FiniteGaloisSubextension
variable {K : ClosedSubgroup G}
 
theorem finite_extension_trans
    {P L K : ClosedSubgroup G}
    (hPL : P.toSubgroup ≤ L.toSubgroup)
    (hLK : L.toSubgroup ≤ K.toSubgroup)
    [hPLfinite : Finite
      (L.toSubgroup ⧸ extensionSubgroup L P hPL)]
    [hLKfinite : Finite
      (K.toSubgroup ⧸ extensionSubgroup K L hLK)] :
    Finite (K.toSubgroup ⧸ extensionSubgroup K P (hPL.trans hLK)) := by
  have hPL0 : P.toSubgroup.relIndex L.toSubgroup ≠ 0 := by
    rw [Subgroup.relIndex]
    exact @Subgroup.index_ne_zero_of_finite L.toSubgroup _
      (extensionSubgroup L P hPL) hPLfinite
  have hLK0 : L.toSubgroup.relIndex K.toSubgroup ≠ 0 := by
    rw [Subgroup.relIndex]
    exact @Subgroup.index_ne_zero_of_finite K.toSubgroup _
      (extensionSubgroup K L hLK) hLKfinite
  apply Nat.finite_of_card_ne_zero
  change (extensionSubgroup K P (hPL.trans hLK)).index ≠ 0
  simpa [Subgroup.relIndex] using
    Subgroup.relIndex_ne_zero_trans hPL0 hLK0
end FiniteGaloisSubextension
end GroupOnly
section Representation
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
namespace FiniteGaloisSubextension
variable {K : ClosedSubgroup G}
end FiniteGaloisSubextension
end Representation
end
end ClassFormation
end

/- GaloisCohomology.Cyclic.TateH0.Invariants -/
section
namespace CyclicCohomology
noncomputable section
 
def unitsInvariantSubmodule (K L : Type) [Field K] [Field L] [Algebra K L] :
    Submodule ℤ (Additive Lˣ) :=
  (Rep.ofAlgebraAutOnUnits K L).ρ.invariants
private noncomputable def invariantUnitToBaseUnit (K L : Type)
    [Field K] [Field L] [Algebra K L] [IsGalois K L] [FiniteDimensional K L]
    (x : unitsInvariantSubmodule K L) : Kˣ := by
  classical
  let y : Lˣ := Additive.toMul (x : Additive Lˣ)
  have hfixed : ∀ σ : Gal(L/K), σ (y : L) = (y : L) := by
    intro σ
    have h :=
      congrArg (fun z : Additive Lˣ => ((Additive.toMul z : Lˣ) : L)) (x.property σ)
    have hρ :
        (Rep.ofAlgebraAutOnUnits K L).ρ σ (x : Additive Lˣ) =
          Additive.ofMul
            (Units.mapEquiv σ.toMulEquiv (Additive.toMul (x : Additive Lˣ))) :=
      rfl
    rw [hρ] at h
    simpa [y] using h
  have hmem : (y : L) ∈ Set.range (algebraMap K L) :=
    (IsGalois.mem_range_algebraMap_iff_fixed (F := K) (E := L) (y : L)).2 hfixed
  let a : K := Classical.choose hmem
  have ha : algebraMap K L a = (y : L) := Classical.choose_spec hmem
  have ha0 : a ≠ 0 := by
    intro hzero
    exact y.ne_zero (by rw [← ha, hzero, map_zero])
  exact ⟨a, a⁻¹, by simp [ha0], by simp [ha0]⟩
private lemma invariantUnitToBaseUnit_spec (K L : Type)
    [Field K] [Field L] [Algebra K L] [IsGalois K L] [FiniteDimensional K L]
    (x : unitsInvariantSubmodule K L) :
    algebraMap K L (invariantUnitToBaseUnit K L x : K) =
      ((Additive.toMul (x : Additive Lˣ) : Lˣ) : L) := by
  classical
  let y : Lˣ := Additive.toMul (x : Additive Lˣ)
  have hfixed : ∀ σ : Gal(L/K), σ (y : L) = (y : L) := by
    intro σ
    have h :=
      congrArg (fun z : Additive Lˣ => ((Additive.toMul z : Lˣ) : L)) (x.property σ)
    have hρ :
        (Rep.ofAlgebraAutOnUnits K L).ρ σ (x : Additive Lˣ) =
          Additive.ofMul
            (Units.mapEquiv σ.toMulEquiv (Additive.toMul (x : Additive Lˣ))) :=
      rfl
    rw [hρ] at h
    simpa [y] using h
  have hmem : (y : L) ∈ Set.range (algebraMap K L) :=
    (IsGalois.mem_range_algebraMap_iff_fixed (F := K) (E := L) (y : L)).2 hfixed
  change algebraMap K L (Classical.choose hmem) = (y : L)
  exact Classical.choose_spec hmem
private noncomputable def baseUnitToInvariantUnit (K L : Type)
    [Field K] [Field L] [Algebra K L] (x : Kˣ) : unitsInvariantSubmodule K L where
  val := Additive.ofMul (Units.map (algebraMap K L).toMonoidHom x)
  property := by
    intro σ
    change
      Additive.ofMul
          (Units.mapEquiv σ.toMulEquiv (Units.map (algebraMap K L).toMonoidHom x)) =
        Additive.ofMul (Units.map (algebraMap K L).toMonoidHom x)
    apply Additive.ofMul.injective
    ext
    simp
private lemma invariantUnitToBaseUnit_baseUnitToInvariantUnit (K L : Type)
    [Field K] [Field L] [Algebra K L] [IsGalois K L] [FiniteDimensional K L]
    (x : Kˣ) :
    invariantUnitToBaseUnit K L (baseUnitToInvariantUnit K L x) = x := by
  ext
  apply FaithfulSMul.algebraMap_injective K L
  rw [invariantUnitToBaseUnit_spec]
  rfl
private lemma baseUnitToInvariantUnit_invariantUnitToBaseUnit (K L : Type)
    [Field K] [Field L] [Algebra K L] [IsGalois K L] [FiniteDimensional K L]
    (x : unitsInvariantSubmodule K L) :
    baseUnitToInvariantUnit K L (invariantUnitToBaseUnit K L x) = x := by
  apply Subtype.ext
  apply Additive.ofMul.injective
  ext
  exact invariantUnitToBaseUnit_spec K L x
 
noncomputable def invariantsUnitsAddEquivBaseUnits (K L : Type)
    [Field K] [Field L] [Algebra K L] [IsGalois K L] [FiniteDimensional K L] :
    unitsInvariantSubmodule K L ≃+ Additive Kˣ where
  toFun := fun x => Additive.ofMul (invariantUnitToBaseUnit K L x)
  invFun := fun x => baseUnitToInvariantUnit K L (Additive.toMul x)
  left_inv := baseUnitToInvariantUnit_invariantUnitToBaseUnit K L
  right_inv := by
    intro x
    apply Additive.ofMul.injective
    exact invariantUnitToBaseUnit_baseUnitToInvariantUnit K L (Additive.toMul x)
  map_add' := by
    intro x y
    apply Additive.ofMul.injective
    change
      invariantUnitToBaseUnit K L (x + y) =
        invariantUnitToBaseUnit K L x * invariantUnitToBaseUnit K L y
    ext
    apply FaithfulSMul.algebraMap_injective K L
    change
      algebraMap K L (invariantUnitToBaseUnit K L (x + y) : K) =
        algebraMap K L
          ((invariantUnitToBaseUnit K L x : K) *
            (invariantUnitToBaseUnit K L y : K))
    rw [map_mul, invariantUnitToBaseUnit_spec,
      invariantUnitToBaseUnit_spec, invariantUnitToBaseUnit_spec]
    rfl
 
noncomputable def invariantsUnitsEquivBaseUnits (K L : Type)
    [Field K] [Field L] [Algebra K L] [IsGalois K L] [FiniteDimensional K L] :
    unitsInvariantSubmodule K L ≃ₗ[ℤ] Additive Kˣ :=
  (invariantsUnitsAddEquivBaseUnits K L).toIntLinearEquiv
 

lemma invariantsUnitsAddEquivBaseUnits_spec (K L : Type)
    [Field K] [Field L] [Algebra K L] [IsGalois K L] [FiniteDimensional K L]
    (x : unitsInvariantSubmodule K L) :
    algebraMap K L
        ((Additive.toMul (invariantsUnitsAddEquivBaseUnits K L x) : Kˣ) : K) =
      ((Additive.toMul (x : Additive Lˣ) : Lˣ) : L) := by
  exact invariantUnitToBaseUnit_spec K L x
end
end CyclicCohomology
end

/- ValuedFieldTheory.LocalField.NormUnits -/
section
namespace LocalFieldTheory
noncomputable section
universe u v w
variable (K : Type u) (L : Type v)
variable [Field K] [Field L] [Algebra K L]
 
def normUnits : Lˣ →* Kˣ :=
  Units.map (Algebra.norm K)
end
end LocalFieldTheory
end

/- ValuedFieldTheory.LocalField.NonarchimedeanLocalField.NormQuotient -/
section
namespace LocalFieldTheory
noncomputable section
universe u v
 
def localNormSubgroup (K L : Type u) [Field K] [Field L] [Algebra K L] : Subgroup Kˣ :=
  (normUnits K L).range
 
def NormQuotient (K L : Type u) [Field K] [Field L] [Algebra K L] : Type u :=
  Kˣ ⧸ localNormSubgroup K L
 
instance normQuotientCommGroup (K L : Type u) [Field K] [Field L] [Algebra K L] :
    CommGroup (NormQuotient K L) := by
  change CommGroup (Kˣ ⧸ localNormSubgroup K L)
  infer_instance
 
def normClass (K L : Type u) [Field K] [Field L] [Algebra K L] :
    Kˣ →* NormQuotient K L := by
  change Kˣ →* Kˣ ⧸ localNormSubgroup K L
  let N := localNormSubgroup K L
  exact QuotientGroup.mk' N
 
theorem normClass_eq_one_iff (K L : Type u) [Field K] [Field L]
    [Algebra K L] (x : Kˣ) :
    normClass K L x = 1 ↔ ∃ y : Lˣ, normUnits K L y = x := by
  rw [← MonoidHom.mem_range]
  exact QuotientGroup.eq_one_iff x
end
end LocalFieldTheory
end

/- GaloisCohomology.Cyclic.TateH0.NormImage -/
section
namespace CyclicCohomology
open LocalFieldTheory
open CategoryTheory
noncomputable section
universe u
 
def unitsNormLinearMap (K L : Type) [Field K] [Field L] [Algebra K L]
    [Fintype Gal(L/K)] : Additive Lˣ →ₗ[ℤ] Additive Lˣ :=
  (Rep.ofAlgebraAutOnUnits K L).norm.hom.toLinearMap
 
lemma unitsNorm_mem_invariants (K L : Type) [Field K] [Field L] [Algebra K L]
    [Fintype Gal(L/K)] (x : Additive Lˣ) :
    unitsNormLinearMap K L x ∈ unitsInvariantSubmodule K L := by
  intro σ
  exact Representation.self_norm_apply (Rep.ofAlgebraAutOnUnits K L).ρ σ x
 
def unitsNormToInvariantsLinearMap (K L : Type) [Field K] [Field L] [Algebra K L]
    [Fintype Gal(L/K)] : Additive Lˣ →ₗ[ℤ] unitsInvariantSubmodule K L :=
  (unitsNormLinearMap K L).codRestrict (unitsInvariantSubmodule K L)
    (unitsNorm_mem_invariants K L)
 
def unitsTateH0NormSubmodule (K L : Type) [Field K] [Field L] [Algebra K L]
    [Fintype Gal(L/K)] : Submodule ℤ (unitsInvariantSubmodule K L) :=
  LinearMap.range (unitsNormToInvariantsLinearMap K L)
 

def tateUnitsH0IsoInvariantsQuotient (K L : Type)
    [Field K] [Field L] [Algebra K L] [Fintype Gal(L/K)] :
    tateCohomology (Rep.ofAlgebraAutOnUnits K L) 0 ≅
      ModuleCat.of ℤ
        (unitsInvariantSubmodule K L ⧸ unitsTateH0NormSubmodule K L) := by
  let A := Rep.ofAlgebraAutOnUnits K L
  let S : ShortComplex (ModuleCat ℤ) :=
    .mk A.norm.toModuleCatHom (groupCohomology.d₀₁ A)
      (Rep.norm_comp_d_eq_zero A)
  have hker :
      LinearMap.ker S.g.hom = unitsInvariantSubmodule K L := by
    exact groupCohomology.d₀₁_ker_eq_invariants A
  let eK : LinearMap.ker S.g.hom ≃ₗ[ℤ] unitsInvariantSubmodule K L :=
    LinearEquiv.ofEq _ _ hker
  have hboundary :
      (LinearMap.range S.moduleCatToCycles).map eK.toLinearMap =
        unitsTateH0NormSubmodule K L := by
    ext x
    constructor
    · rintro ⟨y, ⟨z, rfl⟩, rfl⟩
      refine ⟨z, ?_⟩
      apply Subtype.ext
      rfl
    · rintro ⟨z, rfl⟩
      refine ⟨S.moduleCatToCycles z, ⟨z, rfl⟩, ?_⟩
      apply Subtype.ext
      rfl
  let eQ :
      S.moduleCatLeftHomologyData.H ≅
        ModuleCat.of ℤ
          (unitsInvariantSubmodule K L ⧸ unitsTateH0NormSubmodule K L) :=
    (Submodule.Quotient.equiv _ _ eK hboundary).toModuleIso
  exact TateCohomology.isoZeroBoundary A ≪≫
    S.moduleCatHomologyIso ≪≫ eQ
 
theorem unitsNormLinearMap_apply_val (K L : Type) [Field K] [Field L] [Algebra K L]
    [FiniteDimensional K L] [IsGalois K L] (x : Lˣ) :
    (letI := AlgEquiv.fintype K L
     (Additive.toMul (unitsNormLinearMap K L (Additive.ofMul x)) : Lˣ).1) =
      algebraMap K L (Algebra.norm K (x : L)) := by
  let := AlgEquiv.fintype K L
  dsimp only [unitsNormLinearMap]
  change ((Additive.toMul
    ((Rep.ofAlgebraAutOnUnits K L).norm.hom (Additive.ofMul x)) : Lˣ).1) =
      algebraMap K L (Algebra.norm K (x : L))
  rw [← groupCohomology.norm_ofAlgebraAutOnUnits_eq (K := K) (L := L) x]
  rfl
 
def additiveNormSubgroup (K L : Type u) [Field K] [Field L] [Algebra K L] :
    AddSubgroup (Additive Kˣ) :=
  (localNormSubgroup K L).toAddSubgroup
 
lemma additiveNormSubgroup_eq_ker_quotient_map (K L : Type u)
    [Field K] [Field L] [Algebra K L] :
    additiveNormSubgroup K L =
      (MonoidHom.toAdditive (normClass K L)).ker := by
  ext x
  change Additive.toMul x ∈ localNormSubgroup K L ↔
    Additive.ofMul (normClass K L (Additive.toMul x)) = 0
  constructor
  · intro hx
    exact congrArg Additive.ofMul
      ((normClass_eq_one_iff K L (Additive.toMul x)).mpr
        (MonoidHom.mem_range.mp hx))
  · intro hx
    exact MonoidHom.mem_range.mpr
      ((normClass_eq_one_iff K L (Additive.toMul x)).mp
        (Additive.ofMul.injective hx))
 
lemma invariantsUnitsAddEquivBaseUnits_unitsNorm_apply (K L : Type)
    [Field K] [Field L] [Algebra K L] [FiniteDimensional K L] [IsGalois K L]
    (x : Lˣ) :
    (letI := AlgEquiv.fintype K L
     invariantsUnitsAddEquivBaseUnits K L
        (unitsNormToInvariantsLinearMap K L (Additive.ofMul x))) =
      Additive.ofMul (normUnits K L x) := by
  let := AlgEquiv.fintype K L
  apply Additive.toMul.injective
  ext
  apply FaithfulSMul.algebraMap_injective K L
  rw [invariantsUnitsAddEquivBaseUnits_spec]
  exact (unitsNormLinearMap_apply_val K L x).trans (by rfl)
 
lemma invariantsUnitsAddEquivBaseUnits_map_tateNormSubgroup (K L : Type)
    [Field K] [Field L] [Algebra K L] [FiniteDimensional K L] [IsGalois K L] :
    (letI := AlgEquiv.fintype K L
     (unitsTateH0NormSubmodule K L).toAddSubgroup.map
        (invariantsUnitsAddEquivBaseUnits K L).toAddMonoidHom) =
      additiveNormSubgroup K L := by
  let := AlgEquiv.fintype K L
  ext y
  constructor
  · rintro ⟨x, hx, rfl⟩
    rcases hx with ⟨z, rfl⟩
    change Additive.toMul
        (invariantsUnitsAddEquivBaseUnits K L
          (unitsNormToInvariantsLinearMap K L z)) ∈ localNormSubgroup K L
    let a : Lˣ := Additive.toMul z
    rw [show z = Additive.ofMul a by cases z; rfl]
    have hmap :=
      congrArg Additive.toMul
        (invariantsUnitsAddEquivBaseUnits_unitsNorm_apply K L a)
    rw [hmap]
    exact ⟨a, rfl⟩
  · intro hy
    change Additive.toMul y ∈ localNormSubgroup K L at hy
    rcases hy with ⟨x, hx⟩
    refine ⟨unitsNormToInvariantsLinearMap K L (Additive.ofMul x), ⟨Additive.ofMul x, rfl⟩, ?_⟩
    change
      invariantsUnitsAddEquivBaseUnits K L
          (unitsNormToInvariantsLinearMap K L (Additive.ofMul x)) = y
    calc
      invariantsUnitsAddEquivBaseUnits K L
          (unitsNormToInvariantsLinearMap K L (Additive.ofMul x))
          = Additive.ofMul (normUnits K L x) :=
            invariantsUnitsAddEquivBaseUnits_unitsNorm_apply K L x
      _ = Additive.ofMul (Additive.toMul y) := congrArg Additive.ofMul hx
      _ = y := by cases y; rfl
 
lemma invariantsUnitsEquivBaseUnits_map_tateNormSubmodule (K L : Type)
    [Field K] [Field L] [Algebra K L] [FiniteDimensional K L] [IsGalois K L] :
    (letI := AlgEquiv.fintype K L
     (unitsTateH0NormSubmodule K L).map
        (invariantsUnitsEquivBaseUnits K L : unitsInvariantSubmodule K L →ₗ[ℤ] Additive Kˣ)) =
      (additiveNormSubgroup K L).toIntSubmodule := by
  let := AlgEquiv.fintype K L
  apply Submodule.toAddSubgroup_injective
  rw [Submodule.map_toAddSubgroup]
  exact invariantsUnitsAddEquivBaseUnits_map_tateNormSubgroup K L
end
end CyclicCohomology
end

/- GaloisCohomology.Cyclic.TateH0.Main -/
section
namespace CyclicCohomology
open LocalFieldTheory
noncomputable section
 


def H0TateUnitsIsoNormQuotient (K L : Type)
    [Field K] [Field L] [Algebra K L] [FiniteDimensional K L] [IsGalois K L] :
    CategoryTheory.Iso (tateCohomology (Rep.ofAlgebraAutOnUnits K L) 0)
      (ModuleCat.of Int (Additive (NormQuotient K L))) := by
  letI := AlgEquiv.fintype K L
  let eInv :
      (unitsInvariantSubmodule K L ⧸ unitsTateH0NormSubmodule K L) ≃ₗ[Int]
        (Additive Kˣ ⧸ (additiveNormSubgroup K L).toIntSubmodule) :=
    Submodule.Quotient.equiv
      (unitsTateH0NormSubmodule K L)
      ((additiveNormSubgroup K L).toIntSubmodule)
      (invariantsUnitsEquivBaseUnits K L)
      (invariantsUnitsEquivBaseUnits_map_tateNormSubmodule K L)
  let eNorm :
      (Additive Kˣ ⧸ (additiveNormSubgroup K L).toIntSubmodule) ≃+
        Additive (NormQuotient K L) :=
    (QuotientAddGroup.quotientAddEquivOfEq
        (additiveNormSubgroup_eq_ker_quotient_map K L)).trans
      (QuotientAddGroup.quotientKerEquivOfSurjective
        (MonoidHom.toAdditive (normClass K L)) (by
          change Function.Surjective
            (QuotientGroup.mk' (localNormSubgroup K L))
          exact QuotientGroup.mk'_surjective _))
  exact tateUnitsH0IsoInvariantsQuotient K L ≪≫
    eInv.toModuleIso ≪≫ eNorm.toIntLinearEquiv.toModuleIso
end
end CyclicCohomology
end

/- ValuedFieldTheory.LocalField.NonarchimedeanLocalField.ValuedTopology -/
section
noncomputable section
namespace LocalFieldTheory
open scoped ValuativeRel
universe u v
 

theorem isValuativeTopology_of_valued_ofValuation
    (F : Type u) (Γ : Type v)
    [Field F] [LinearOrderedCommGroupWithZero Γ]
    [MulArchimedean Γ] [Valued F Γ]
    [Valuation.IsNontrivial (Valued.v : Valuation F Γ)] :
    letI := ValuativeRel.ofValuation (Valued.v : Valuation F Γ)
    IsValuativeTopology F := by
  let v : Valuation F Γ := Valued.v
  let : ValuativeRel F := ValuativeRel.ofValuation v
  let : v.Compatible := Valuation.Compatible.ofValuation v
  let : ValuativeRel.IsNontrivial F :=
    (ValuativeRel.isNontrivial_iff_isNontrivial v).2 inferInstance
  apply IsValuativeTopology.of_zero
  intro s
  rw [Valued.mem_nhds_zero]
  constructor
  · rintro ⟨δ, hδ⟩
    refine
      ⟨δ.mapEquiv
          (ValuativeRel.ValueGroupWithZero.orderMonoidIso v).symm, ?_⟩
    intro z hz
    apply hδ
    exact
      (ValuativeRel.valuation_lt_symm_orderMonoidIso
        v (δ : MonoidWithZeroHom.ValueGroup₀ (.ofClass v)) z).1
        (by simpa using hz)
  · rintro ⟨γ, hγ⟩
    refine
      ⟨γ.mapEquiv
          (ValuativeRel.ValueGroupWithZero.orderMonoidIso v), ?_⟩
    intro z hz
    apply hγ
    have hz' :
        v.restrict z <
          (ValuativeRel.ValueGroupWithZero.orderMonoidIso v)
            (γ : ValuativeRel.ValueGroupWithZero F) := by
      exact hz
    exact
      (ValuativeRel.restrict_lt_orderMonoidIso
        v (γ : ValuativeRel.ValueGroupWithZero F) z).1 hz'
end LocalFieldTheory
end

/- GaloisCohomology.Cyclic.GaloisCohomology -/
section
namespace CyclicCohomology
noncomputable section
open CategoryTheory
private theorem zpowers_eq_top_of_forall_mem_zpowers {G : Type} [Group G] (g : G)
    (hg : ∀ x : G, x ∈ Subgroup.zpowers g) :
    Subgroup.zpowers g = ⊤ := by
  ext x
  constructor
  · intro _
    exact Subgroup.mem_top x
  · intro _
    exact hg x
private theorem isCyclic_of_forall_mem_zpowers {G : Type} [Group G] (g : G)
    (hg : ∀ x : G, x ∈ Subgroup.zpowers g) :
    IsCyclic G := by
  rw [isCyclic_iff_exists_zpowers_eq_top]
  exact ⟨g, zpowers_eq_top_of_forall_mem_zpowers g hg⟩
 


noncomputable def cyclic_H1_iso_HminusOne {k G : Type} [CommRing k] [Group G]
    [Fintype G] (A : Rep k G) (g : G)
    (hg : ∀ x : G, x ∈ Subgroup.zpowers g) :
    groupCohomology A 1 ≅ tateCohomology A (-1) := by
  letI : IsCyclic G := isCyclic_of_forall_mem_zpowers g hg
  letI : CommGroup G := IsCyclic.commGroup (α := G)
  exact Rep.FiniteCyclicGroup.groupCohomologyIsoOdd A g hg 1 (by decide) ≪≫
    (TateCohomology.isoFiniteCyclicNegOne A g hg).symm
 
noncomputable def unitsH1IsoTateHminusOne (K L : Type) [Field K] [Field L]
    [Algebra K L] [FiniteDimensional K L] (g : Gal(L / K))
    (hg : ∀ x : Gal(L / K), x ∈ Subgroup.zpowers g) :
    groupCohomology.H1 (Rep.ofAlgebraAutOnUnits K L) ≅
      tateCohomology (Rep.ofAlgebraAutOnUnits K L) (-1) :=
  cyclic_H1_iso_HminusOne (Rep.ofAlgebraAutOnUnits K L) g hg
 


theorem hilbert90_unitsTateHminusOne_isZero (K L : Type) [Field K]
    [Field L] [Algebra K L] [FiniteDimensional K L] (g : Gal(L / K))
    (hg : ∀ x : Gal(L / K), x ∈ Subgroup.zpowers g) :
    CategoryTheory.Limits.IsZero
      (tateCohomology (Rep.ofAlgebraAutOnUnits K L) (-1)) := by
  have hzero :
      CategoryTheory.Limits.IsZero
        (groupCohomology.H1 (Rep.ofAlgebraAutOnUnits K L)) := by
    let _ := groupCohomology.H1ofAutOnUnitsUnique K L
    exact ModuleCat.isZero_of_subsingleton _
  exact hzero.of_iso
    (unitsH1IsoTateHminusOne K L g hg).symm
end
end CyclicCohomology
end

/- ClassFieldTheory.LocalClassFieldTheory.Finite.LocalReciprocity.FiniteExtensionClassFieldAxiom -/
section
namespace LocalClassFieldTheory
open LocalFieldTheory

open CyclicCohomology
noncomputable section
open scoped NNReal ValuativeRel
 


structure UnitsTateCardinalityData
    (K L : Type) [Field K] [Field L] [Algebra K L] [FiniteDimensional K L] where
   
  finiteH0 : Finite (tateCohomology (Rep.ofAlgebraAutOnUnits K L) 0)
   
  cardH0 :
    letI := finiteH0
    Nat.card (tateCohomology (Rep.ofAlgebraAutOnUnits K L) 0) = Module.finrank K L
   
  cardHminusOne : Nat.card (tateCohomology (Rep.ofAlgebraAutOnUnits K L) (-1)) = 1
end
end LocalClassFieldTheory
end

/- ClassFieldTheory.AlgebraicNumberTheory.Idele.LocallyCompact -/
section
open scoped NumberField RestrictedProduct Valued
open NumberField IsDedekindDomain
noncomputable section
variable (K : Type*) [Field K] [NumberField K]
 

theorem exists_ringOfIntegers_approximation
    (v : HeightOneSpectrum (𝓞 K)) (y : K)
    (hy : v.valuation K y ≤ 1) :
    ∃ r : 𝓞 K, v.valuation K (y - algebraMap (𝓞 K) K r) < 1 := by
  let : Field (𝓞 K ⧸ v.asIdeal) := Ideal.Quotient.field v.asIdeal
  have hy' : y ∈ v.valuationSubringAtPrime K := by
    rw [v.valuationSubringAtPrime_eq_valuationSubring]
    exact hy
  let y' : v.valuationSubringAtPrime K := ⟨y, hy'⟩
  obtain ⟨⟨a, d⟩, had⟩ := IsLocalization.surj v.asIdeal.primeCompl y'
  have hd : d.1 ∉ v.asIdeal := d.2
  have hdmk : Ideal.Quotient.mk v.asIdeal d.1 ≠ 0 := by
    simpa only [ne_eq, Ideal.Quotient.eq_zero_iff_mem]
  obtain ⟨r, hr⟩ := Ideal.Quotient.mk_surjective
    (Ideal.Quotient.mk v.asIdeal a /
      Ideal.Quotient.mk v.asIdeal d.1)
  refine ⟨r, ?_⟩
  have hard : a - r * d.1 ∈ v.asIdeal := by
    rw [← Ideal.Quotient.eq_zero_iff_mem]
    rw [map_sub, map_mul, hr]
    field_simp
    simp
  have hvalard :
      v.valuation K (algebraMap (𝓞 K) K (a - r * d.1)) < 1 :=
    (v.valuation_lt_one_iff_mem (K := K) (a - r * d.1)).2 hard
  have hdval : v.valuation K (algebraMap (𝓞 K) K d.1) = 1 := by
    exact le_antisymm (v.valuation_le_one d.1)
      (not_lt.mp ((v.valuation_lt_one_iff_mem (K := K) d.1).not.mpr hd))
  have hadK :
      y * algebraMap (𝓞 K) K d.1 = algebraMap (𝓞 K) K a := by
    exact congrArg Subtype.val had
  rw [← mul_lt_mul_iff_right₀ (show
    0 < v.valuation K (algebraMap (𝓞 K) K d.1) by simp [hdval])]
  rw [← map_mul, mul_sub, mul_comm _ y, hadK, mul_comm _ (algebraMap (𝓞 K) K r),
    ← map_mul, ← map_sub, hdval, mul_one]
  exact hvalard
namespace GlobalClassFieldTheory.ClassFieldAxiom
universe u
variable {K : Type u} [Field K] [NumberField K]
 

noncomputable def ringOfIntegersQuotientEquivAdicResidueField
    (v : HeightOneSpectrum (𝓞 K)) :
    (𝓞 K ⧸ v.asIdeal) ≃+*
      Valued.ResidueField (v.adicCompletion K) := by
  let integerMap :
      𝓞 K →+* Valued.integer (v.adicCompletion K) := {
    toFun r :=
      ⟨algebraMap (𝓞 K) (v.adicCompletion K) r, by
        change
          Valued.v
            (algebraMap
              (𝓞 K) (v.adicCompletion K) r) ≤ 1
        rw [show
          Valued.v
              (algebraMap
                (𝓞 K) (v.adicCompletion K) r) =
            v.valuation K
              (algebraMap (𝓞 K) K r) from
          HeightOneSpectrum.valuedAdicCompletion_eq_valuation
            (v := v) r]
        exact v.valuation_le_one r⟩
    map_one' := by
      ext
      simp
    map_mul' _ _ := by
      ext
      simp
    map_zero' := by
      ext
      simp
    map_add' _ _ := by
      ext
      simp
  }
  let residueMap :
      𝓞 K →+*
        Valued.ResidueField (v.adicCompletion K) :=
    (IsLocalRing.residue
      (Valued.integer
        (v.adicCompletion K))).comp integerMap
  have hker :
      RingHom.ker residueMap = v.asIdeal := by
    ext r
    change residueMap r = 0 ↔ r ∈ v.asIdeal
    change
      IsLocalRing.residue
          (Valued.integer (v.adicCompletion K))
          (integerMap r) = 0 ↔
        r ∈ v.asIdeal
    rw [IsLocalRing.residue_eq_zero_iff]
    rw [IsLocalRing.mem_maximalIdeal]
    change ¬ IsUnit (integerMap r) ↔ r ∈ v.asIdeal
    rw [Valuation.Integer.not_isUnit_iff_valuation_lt_one]
    change
      Valued.v
          (algebraMap
            (𝓞 K) (v.adicCompletion K) r) < 1 ↔
        r ∈ v.asIdeal
    rw [show
      Valued.v
          (algebraMap
            (𝓞 K) (v.adicCompletion K) r) =
        v.valuation K
          (algebraMap (𝓞 K) K r) from
      HeightOneSpectrum.valuedAdicCompletion_eq_valuation
        (v := v) r]
    exact v.valuation_lt_one_iff_mem (K := K) r
  have hsur : Function.Surjective residueMap := by
    intro z
    obtain ⟨x, hx⟩ :=
      (IsLocalRing.residue_surjective
        (R :=
          Valued.integer
            (v.adicCompletion K))) z
    obtain ⟨y, hy⟩ :=
      (v.denseRange_algebraMap K).exists_dist_lt
        (x : v.adicCompletion K) zero_lt_one
    have hxy :
        Valued.v
            ((x : v.adicCompletion K) -
              algebraMap K
                (v.adicCompletion K) y) < 1 := by
      rw [← Valued.toNormedField.norm_lt_one_iff]
      simpa only [dist_eq_norm] using hy
    have hy_integral : v.valuation K y ≤ 1 := by
      rw [show
        v.valuation K y =
          Valued.v
            (algebraMap K
              (v.adicCompletion K) y) from
        (HeightOneSpectrum.valuedAdicCompletion_eq_valuation'
          (v := v) y).symm]
      rw [show
        algebraMap K (v.adicCompletion K) y =
          (x : v.adicCompletion K) -
            ((x : v.adicCompletion K) -
              algebraMap K
                (v.adicCompletion K) y) by
        ring]
      exact Valued.v.map_sub_le x.2 hxy.le
    obtain ⟨r, hyr⟩ :=
      _root_.exists_ringOfIntegers_approximation
        K v y hy_integral
    have hyr' :
        Valued.v
            (algebraMap K
                (v.adicCompletion K) y -
              algebraMap (𝓞 K)
                (v.adicCompletion K) r) < 1 := by
      rw [IsScalarTower.algebraMap_apply
        (𝓞 K) K, ← map_sub]
      rw [show
        Valued.v
            (algebraMap K
              (v.adicCompletion K)
              (y - algebraMap (𝓞 K) K r)) =
          v.valuation K
            (y - algebraMap (𝓞 K) K r) from
        HeightOneSpectrum.valuedAdicCompletion_eq_valuation'
          (v := v)
          (y - algebraMap (𝓞 K) K r)]
      exact hyr
    have hxr :
        Valued.v
            ((x : v.adicCompletion K) -
              algebraMap (𝓞 K)
                (v.adicCompletion K) r) < 1 := by
      rw [show
        (x : v.adicCompletion K) -
            algebraMap (𝓞 K)
              (v.adicCompletion K) r =
          ((x : v.adicCompletion K) -
              algebraMap K
                (v.adicCompletion K) y) +
            (algebraMap K
                (v.adicCompletion K) y -
              algebraMap (𝓞 K)
                (v.adicCompletion K) r) by
        ring]
      exact Valued.v.map_add_lt hxy hyr'
    refine ⟨r, ?_⟩
    rw [← hx]
    change
      IsLocalRing.residue
          (Valued.integer
            (v.adicCompletion K))
          (integerMap r) =
        IsLocalRing.residue
          (Valued.integer
            (v.adicCompletion K)) x
    apply sub_eq_zero.mp
    rw [← map_sub, IsLocalRing.residue_eq_zero_iff]
    rw [IsLocalRing.mem_maximalIdeal]
    change ¬ IsUnit (integerMap r - x)
    rw [Valuation.Integer.not_isUnit_iff_valuation_lt_one]
    change
      Valued.v
          ((integerMap r : v.adicCompletion K) -
            (x : v.adicCompletion K)) < 1
    rw [Valued.v.map_sub_swap]
    exact hxr
  exact
    (Ideal.quotEquivOfEq hker).symm.trans
      (RingHom.quotientKerEquivOfSurjective hsur)
end GlobalClassFieldTheory.ClassFieldAxiom
 

theorem finite_adicCompletion_residueField
    (v : HeightOneSpectrum (𝓞 K)) :
    Finite (Valued.ResidueField (v.adicCompletion K)) := by
  let : Finite (𝓞 K ⧸ v.asIdeal) :=
    v.asIdeal.finiteQuotientOfFreeOfNeBot v.ne_bot
  exact Finite.of_equiv (𝓞 K ⧸ v.asIdeal)
    (GlobalClassFieldTheory.ClassFieldAxiom.ringOfIntegersQuotientEquivAdicResidueField
      (K := K) v).toEquiv
 

instance adicCompletionProperSpace
    (v : HeightOneSpectrum (𝓞 K)) :
    ProperSpace (v.adicCompletion K) := by
  apply
    Valued.integer.properSpace_iff_completeSpace_and_isDiscreteValuationRing_integer_and_finite_residueField.mpr
  refine ⟨inferInstance, ?_, finite_adicCompletion_residueField K v⟩
  change IsDiscreteValuationRing (v.adicCompletionIntegers K)
  infer_instance
end

/- ValuedFieldTheory.Ramification.GaloisValuation.ClosedFixingSubgroup -/
section
noncomputable section
namespace RamificationTheory
 
noncomputable abbrev closedFixingSubgroup
    (k Ω : Type*) [Field k] [Field Ω] [Algebra k Ω] [IsGalois k Ω]
    (K : IntermediateField k Ω) : ClosedSubgroup Gal(Ω/k) :=
  ⟨K.fixingSubgroup, InfiniteGalois.fixingSubgroup_isClosed K⟩
end RamificationTheory
end

/- ClassFieldTheory.LocalClassFieldTheory.Finite.LocalReciprocity.AbsoluteUnitsFixedField -/
section
namespace LocalClassFieldTheory
open RamificationTheory KummerTheory CyclicCohomology
noncomputable section
variable (K Ω : Type) [Field K] [Field Ω] [Algebra K Ω]
 

abbrev galoisAmbientUnitsRep : Rep ℤ (Gal(Ω / K)) :=
  Rep.ofAlgebraAutOnUnits K Ω
 

def intermediateFieldUnitsToGaloisAmbient
    (E : IntermediateField K Ω) :
    Additive Eˣ →+ Additive Ωˣ :=
  MonoidHom.toAdditive (Units.map E.val.toRingHom)
variable [IsGalois K Ω]
end
end LocalClassFieldTheory
end

/- ClassFieldTheory.LocalClassFieldTheory.Finite.LocalReciprocity.FiniteAbstractFixedField -/
section
namespace LocalClassFieldTheory
open RamificationTheory KummerTheory CyclicCohomology
open ClassFormation
noncomputable section
variable (k Ω : Type) [Field k] [Field Ω] [Algebra k Ω] [IsGalois k Ω]
 
abbrev abstractFixedField (H : ClosedSubgroup (Gal(Ω / k))) :
    IntermediateField k Ω :=
  IntermediateField.fixedField H.toSubgroup
omit [IsGalois k Ω] in
 

theorem ambientQuotientFiniteOfAbstractFinite
    (H : ClosedSubgroup (Gal(Ω / k)))
    (hfinite : Finite ((baseField (Gal(Ω / k))).toSubgroup ⧸
      extensionSubgroup (baseField (Gal(Ω / k))) H (le_baseField H))) :
    Finite (Gal(Ω / k) ⧸ H.toSubgroup) := by
  apply Nat.finite_of_card_ne_zero
  change H.toSubgroup.index ≠ 0
  rw [← Subgroup.relIndex_top_right]
  change (extensionSubgroup (baseField (Gal(Ω / k))) H
    (le_baseField H)).index ≠ 0
  exact @Subgroup.index_ne_zero_of_finite
    (baseField (Gal(Ω / k))).toSubgroup _
    (extensionSubgroup (baseField (Gal(Ω / k))) H (le_baseField H))
    hfinite
omit [IsGalois k Ω] in
 

theorem abstractFiniteClosedSubgroup_isOpen
    (H : ClosedSubgroup (Gal(Ω / k)))
    (hfinite : Finite ((baseField (Gal(Ω / k))).toSubgroup ⧸
      extensionSubgroup (baseField (Gal(Ω / k))) H (le_baseField H))) :
    IsOpen H.carrier := by
  let : Finite (Gal(Ω / k) ⧸ H.toSubgroup) :=
    ambientQuotientFiniteOfAbstractFinite k Ω H hfinite
  let : Subgroup.FiniteIndex H.toSubgroup :=
    H.toSubgroup.finiteIndex_of_finite_quotient
  exact Subgroup.isOpen_of_isClosed_of_finiteIndex H.toSubgroup H.isClosed'
 

theorem abstractFixedField_finiteDimensional
    (H : ClosedSubgroup (Gal(Ω / k)))
    (hfinite : Finite ((baseField (Gal(Ω / k))).toSubgroup ⧸
      extensionSubgroup (baseField (Gal(Ω / k))) H (le_baseField H))) :
    FiniteDimensional k (abstractFixedField k Ω H) := by
  apply (InfiniteGalois.isOpen_iff_finite
    (K := Ω) (abstractFixedField k Ω H)).1
  rw [InfiniteGalois.fixingSubgroup_fixedField H]
  exact abstractFiniteClosedSubgroup_isOpen k Ω H hfinite
omit [IsGalois k Ω] in
 

theorem abstractFixedField_le {K L : ClosedSubgroup (Gal(Ω / k))}
    (hLK : L.toSubgroup ≤ K.toSubgroup) :
    abstractFixedField k Ω K ≤ abstractFixedField k Ω L :=
  IntermediateField.fixedField_le hLK
 

def abstractSubgroupEquivGaloisGroup
    (H : ClosedSubgroup (Gal(Ω / k))) :
    H.toSubgroup ≃* Gal(Ω / abstractFixedField k Ω H) :=
  (MulEquiv.subgroupCongr
      (InfiniteGalois.fixingSubgroup_fixedField H).symm).trans
    (IntermediateField.fixingSubgroupEquiv (abstractFixedField k Ω H))
 
@[simp]
theorem abstractSubgroupEquivGaloisGroup_apply
    (H : ClosedSubgroup (Gal(Ω / k))) (σ : H.toSubgroup) (x : Ω) :
    abstractSubgroupEquivGaloisGroup k Ω H σ x = σ.1 x :=
  rfl
 

abbrev abstractRelativeFixedField
    {K L : ClosedSubgroup (Gal(Ω / k))}
    (hLK : L.toSubgroup ≤ K.toSubgroup) :
    IntermediateField (abstractFixedField k Ω K) Ω :=
  IntermediateField.extendScalars (abstractFixedField_le k Ω hLK)
 

theorem map_extensionSubgroup_abstractSubgroupEquiv
    (K L : ClosedSubgroup (Gal(Ω / k)))
    (hLK : L.toSubgroup ≤ K.toSubgroup) :
    (extensionSubgroup K L hLK).map
        (abstractSubgroupEquivGaloisGroup k Ω K).toMonoidHom =
      (abstractRelativeFixedField k Ω hLK).fixingSubgroup := by
  ext τ
  constructor
  · rintro ⟨σ, hσ, rfl⟩
    rw [IntermediateField.mem_fixingSubgroup_iff]
    intro x hx
    have hσL : (σ.1 : Gal(Ω / k)) ∈ L :=
      (mem_extensionSubgroup_iff K L hLK σ).1 hσ
    have hfix : ∀ y ∈ abstractFixedField k Ω L, σ.1 y = y := by
      have hσfix : σ.1 ∈ (abstractFixedField k Ω L).fixingSubgroup := by
        rw [InfiniteGalois.fixingSubgroup_fixedField L]
        exact hσL
      exact (IntermediateField.mem_fixingSubgroup_iff
        (abstractFixedField k Ω L) σ.1).1 hσfix
    exact hfix x hx
  · intro hτ
    let σ : K.toSubgroup :=
      (abstractSubgroupEquivGaloisGroup k Ω K).symm τ
    refine ⟨σ, ?_, (abstractSubgroupEquivGaloisGroup k Ω K).apply_symm_apply τ⟩
    apply (mem_extensionSubgroup_iff K L hLK σ).2
    have hσfix : (σ.1 : Gal(Ω / k)) ∈
        (abstractFixedField k Ω L).fixingSubgroup := by
      rw [IntermediateField.mem_fixingSubgroup_iff]
      intro x hx
      have hτfix := (IntermediateField.mem_fixingSubgroup_iff
        (abstractRelativeFixedField k Ω hLK) τ).1 hτ x hx
      calc
        σ.1 x = abstractSubgroupEquivGaloisGroup k Ω K σ x :=
          (abstractSubgroupEquivGaloisGroup_apply k Ω K σ x).symm
        _ = τ x := by
          rw [show abstractSubgroupEquivGaloisGroup k Ω K σ = τ by
            exact (abstractSubgroupEquivGaloisGroup k Ω K).apply_symm_apply τ]
        _ = x := hτfix
    rw [InfiniteGalois.fixingSubgroup_fixedField L] at hσfix
    exact hσfix
 

theorem abstractRelativeFixingSubgroup_normal
    (K L : ClosedSubgroup (Gal(Ω / k)))
    (hLK : L.toSubgroup ≤ K.toSubgroup)
    (hnormal : (extensionSubgroup K L hLK).Normal) :
    (abstractRelativeFixedField k Ω hLK).fixingSubgroup.Normal := by
  have hmap : ((extensionSubgroup K L hLK).map
      (abstractSubgroupEquivGaloisGroup k Ω K).toMonoidHom).Normal :=
    hnormal.map (abstractSubgroupEquivGaloisGroup k Ω K).toMonoidHom
      (abstractSubgroupEquivGaloisGroup k Ω K).surjective
  rw [map_extensionSubgroup_abstractSubgroupEquiv k Ω K L hLK] at hmap
  exact hmap
 

theorem abstractRelativeFixedField_isGalois
    (K L : ClosedSubgroup (Gal(Ω / k)))
    (hLK : L.toSubgroup ≤ K.toSubgroup)
    (hnormal : (extensionSubgroup K L hLK).Normal) :
    IsGalois (abstractFixedField k Ω K)
      (abstractRelativeFixedField k Ω hLK) := by
  apply (InfiniteGalois.normal_iff_isGalois
    (abstractRelativeFixedField k Ω hLK)).1
  exact abstractRelativeFixingSubgroup_normal k Ω K L hLK hnormal
 

def abstractRelativeToAmbientQuotient
    (K L : ClosedSubgroup (Gal(Ω / k)))
    (hLK : L.toSubgroup ≤ K.toSubgroup)
    (hnormal : (extensionSubgroup K L hLK).Normal) :
    letI := abstractRelativeFixingSubgroup_normal k Ω K L hLK hnormal
    K.toSubgroup →*
      Gal(Ω / abstractFixedField k Ω K) ⧸
        (abstractRelativeFixedField k Ω hLK).fixingSubgroup := by
  letI : (abstractRelativeFixedField k Ω hLK).fixingSubgroup.Normal :=
    abstractRelativeFixingSubgroup_normal k Ω K L hLK hnormal
  exact (QuotientGroup.mk'
    (abstractRelativeFixedField k Ω hLK).fixingSubgroup).comp
      (abstractSubgroupEquivGaloisGroup k Ω K).toMonoidHom
 

theorem abstractRelativeToAmbientQuotient_ker
    (K L : ClosedSubgroup (Gal(Ω / k)))
    (hLK : L.toSubgroup ≤ K.toSubgroup)
    (hnormal : (extensionSubgroup K L hLK).Normal) :
    letI := abstractRelativeFixingSubgroup_normal k Ω K L hLK hnormal
    (abstractRelativeToAmbientQuotient k Ω K L hLK hnormal).ker =
      extensionSubgroup K L hLK := by
  let : (abstractRelativeFixedField k Ω hLK).fixingSubgroup.Normal :=
    abstractRelativeFixingSubgroup_normal k Ω K L hLK hnormal
  ext σ
  change
    QuotientGroup.mk' (abstractRelativeFixedField k Ω hLK).fixingSubgroup
        (abstractSubgroupEquivGaloisGroup k Ω K σ) = 1 ↔
      σ ∈ extensionSubgroup K L hLK
  rw [QuotientGroup.mk'_apply, QuotientGroup.eq_one_iff]
  rw [← map_extensionSubgroup_abstractSubgroupEquiv k Ω K L hLK]
  constructor
  · rintro ⟨τ, hτ, hτσ⟩
    have : τ = σ :=
      (abstractSubgroupEquivGaloisGroup k Ω K).injective hτσ
    simpa [this] using hτ
  · intro hσ
    exact ⟨σ, hσ, rfl⟩
 
theorem abstractRelativeToAmbientQuotient_surjective
    (K L : ClosedSubgroup (Gal(Ω / k)))
    (hLK : L.toSubgroup ≤ K.toSubgroup)
    (hnormal : (extensionSubgroup K L hLK).Normal) :
    letI := abstractRelativeFixingSubgroup_normal k Ω K L hLK hnormal
    Function.Surjective
      (abstractRelativeToAmbientQuotient k Ω K L hLK hnormal) := by
  let : (abstractRelativeFixedField k Ω hLK).fixingSubgroup.Normal :=
    abstractRelativeFixingSubgroup_normal k Ω K L hLK hnormal
  intro q
  refine Quotient.inductionOn' q ?_
  intro τ
  refine ⟨(abstractSubgroupEquivGaloisGroup k Ω K).symm τ, ?_⟩
  change QuotientGroup.mk
    (abstractSubgroupEquivGaloisGroup k Ω K
      ((abstractSubgroupEquivGaloisGroup k Ω K).symm τ)) =
      QuotientGroup.mk τ
  rw [(abstractSubgroupEquivGaloisGroup k Ω K).apply_symm_apply]
 


def abstractExtensionQuotientEquivAmbient
    (K L : ClosedSubgroup (Gal(Ω / k)))
    (hLK : L.toSubgroup ≤ K.toSubgroup)
    (hnormal : (extensionSubgroup K L hLK).Normal) :
    letI := hnormal
    letI := abstractRelativeFixingSubgroup_normal k Ω K L hLK hnormal
    K.toSubgroup ⧸ extensionSubgroup K L hLK ≃*
      Gal(Ω / abstractFixedField k Ω K) ⧸
        (abstractRelativeFixedField k Ω hLK).fixingSubgroup := by
  letI := hnormal
  letI : (abstractRelativeFixedField k Ω hLK).fixingSubgroup.Normal :=
    abstractRelativeFixingSubgroup_normal k Ω K L hLK hnormal
  exact (QuotientGroup.quotientMulEquivOfEq
      (abstractRelativeToAmbientQuotient_ker
        k Ω K L hLK hnormal).symm).trans
    (QuotientGroup.quotientKerEquivOfSurjective
      (abstractRelativeToAmbientQuotient k Ω K L hLK hnormal)
      (abstractRelativeToAmbientQuotient_surjective
        k Ω K L hLK hnormal))
 

def abstractExtensionQuotientEquivGaloisGroup
    (K L : ClosedSubgroup (Gal(Ω / k)))
    (hLK : L.toSubgroup ≤ K.toSubgroup)
    (hnormal : (extensionSubgroup K L hLK).Normal) :
    letI := hnormal
    K.toSubgroup ⧸ extensionSubgroup K L hLK ≃*
      Gal(abstractRelativeFixedField k Ω hLK / abstractFixedField k Ω K) := by
  letI := hnormal
  letI : (abstractRelativeFixedField k Ω hLK).fixingSubgroup.Normal :=
    abstractRelativeFixingSubgroup_normal k Ω K L hLK hnormal
  let H : ClosedSubgroup (Gal(Ω / abstractFixedField k Ω K)) :=
    closedFixingSubgroup (abstractFixedField k Ω K) Ω
      (abstractRelativeFixedField k Ω hLK)
  letI : H.toSubgroup.Normal := by
    exact abstractRelativeFixingSubgroup_normal k Ω K L hLK hnormal
  exact (abstractExtensionQuotientEquivAmbient
      k Ω K L hLK hnormal).trans
    ((InfiniteGalois.normalAutEquivQuotient H).trans
      (AlgEquiv.autCongr
        (IntermediateField.equivOfEq
          (InfiniteGalois.fixedField_fixingSubgroup
            (abstractRelativeFixedField k Ω hLK)))))
 

theorem abstractFixedField_relativeFiniteDimensional
    (K L : ClosedSubgroup (Gal(Ω / k)))
    (hLK : L.toSubgroup ≤ K.toSubgroup)
    (hKfinite : Finite ((baseField (Gal(Ω / k))).toSubgroup ⧸
      extensionSubgroup (baseField (Gal(Ω / k))) K (le_baseField K)))
    (hLKfinite : Finite
      (K.toSubgroup ⧸ extensionSubgroup K L hLK)) :
    letI : Algebra (abstractFixedField k Ω K) (abstractFixedField k Ω L) :=
      RingHom.toAlgebra
        (IntermediateField.inclusion (abstractFixedField_le k Ω hLK))
    FiniteDimensional (abstractFixedField k Ω K)
      (abstractFixedField k Ω L) := by
  let : Algebra (abstractFixedField k Ω K) (abstractFixedField k Ω L) :=
    RingHom.toAlgebra
      (IntermediateField.inclusion (abstractFixedField_le k Ω hLK))
  let : IsScalarTower k (abstractFixedField k Ω K)
      (abstractFixedField k Ω L) :=
    IsScalarTower.of_algebraMap_eq' rfl
  let : Finite ((baseField (Gal(Ω / k))).toSubgroup ⧸
      extensionSubgroup (baseField (Gal(Ω / k))) K (le_baseField K)) :=
    hKfinite
  let : Finite
      (K.toSubgroup ⧸ extensionSubgroup K L hLK) := hLKfinite
  let : Finite ((baseField (Gal(Ω / k))).toSubgroup ⧸
      extensionSubgroup (baseField (Gal(Ω / k))) L (le_baseField L)) :=
    FiniteGaloisSubextension.finite_extension_trans hLK (le_baseField K)
  let : FiniteDimensional k (abstractFixedField k Ω L) :=
    abstractFixedField_finiteDimensional k Ω L inferInstance
  exact FiniteDimensional.right k
    (abstractFixedField k Ω K) (abstractFixedField k Ω L)
 

theorem abstractRelativeFixedField_finiteDimensional
    (K L : ClosedSubgroup (Gal(Ω / k)))
    (hLK : L.toSubgroup ≤ K.toSubgroup)
    (hKfinite : Finite ((baseField (Gal(Ω / k))).toSubgroup ⧸
      extensionSubgroup (baseField (Gal(Ω / k))) K (le_baseField K)))
    (hLKfinite : Finite
      (K.toSubgroup ⧸ extensionSubgroup K L hLK)) :
    FiniteDimensional (abstractFixedField k Ω K)
      (abstractRelativeFixedField k Ω hLK) := by
  let : Algebra (abstractFixedField k Ω K) (abstractFixedField k Ω L) :=
    RingHom.toAlgebra
      (IntermediateField.inclusion (abstractFixedField_le k Ω hLK))
  let : FiniteDimensional (abstractFixedField k Ω K)
      (abstractFixedField k Ω L) :=
    abstractFixedField_relativeFiniteDimensional
      k Ω K L hLK hKfinite hLKfinite
  let e : abstractFixedField k Ω L ≃ₗ[abstractFixedField k Ω K]
      abstractRelativeFixedField k Ω hLK :=
    { toFun := fun x => ⟨x.1, x.2⟩
      invFun := fun x => ⟨x.1, x.2⟩
      left_inv := fun _ => rfl
      right_inv := fun _ => rfl
      map_add' := fun _ _ => rfl
      map_smul' := fun _ _ => rfl }
  exact e.finiteDimensional
 

theorem finiteAbstractExtension_degree_eq_finrank
    (K L : ClosedSubgroup (Gal(Ω / k)))
    (hLK : L.toSubgroup ≤ K.toSubgroup)
    (hnormal : (extensionSubgroup K L hLK).Normal)
    (hKfinite : Finite ((baseField (Gal(Ω / k))).toSubgroup ⧸
      extensionSubgroup (baseField (Gal(Ω / k))) K (le_baseField K)))
    (hLKfinite : Finite
      (K.toSubgroup ⧸ extensionSubgroup K L hLK)) :
    ((DegreeData.FiniteAbstractExtension.ofInclusion L K hLK).degree : ℕ) =
      Module.finrank (abstractFixedField k Ω K)
        (abstractRelativeFixedField k Ω hLK) := by
  let := hnormal
  let : Finite
      (K.toSubgroup ⧸ extensionSubgroup K L hLK) := hLKfinite
  let : FiniteDimensional (abstractFixedField k Ω K)
      (abstractRelativeFixedField k Ω hLK) :=
    abstractRelativeFixedField_finiteDimensional
      k Ω K L hLK hKfinite hLKfinite
  let : IsGalois (abstractFixedField k Ω K)
      (abstractRelativeFixedField k Ω hLK) :=
    abstractRelativeFixedField_isGalois k Ω K L hLK hnormal
  calc
    ((DegreeData.FiniteAbstractExtension.ofInclusion L K hLK).degree : ℕ) =
        (extensionSubgroup K L hLK).index :=
      (DegreeData.FiniteAbstractExtension.ofInclusion L K hLK).extensionSubgroup_index_eq_degree.symm
    _ = Nat.card
        (K.toSubgroup ⧸ extensionSubgroup K L hLK) :=
      Subgroup.index_eq_card (extensionSubgroup K L hLK)
    _ = Nat.card (Gal(abstractRelativeFixedField k Ω hLK / abstractFixedField k Ω K)) :=
      Nat.card_congr
        (abstractExtensionQuotientEquivGaloisGroup
          k Ω K L hLK hnormal).toEquiv
    _ = Module.finrank (abstractFixedField k Ω K)
        (abstractRelativeFixedField k Ω hLK) :=
      IsGalois.card_aut_eq_finrank
        (abstractFixedField k Ω K)
        (abstractRelativeFixedField k Ω hLK)
end
end LocalClassFieldTheory
end

/- ClassFieldTheory.LocalClassFieldTheory.Finite.LocalReciprocity.TateTransport -/
section
namespace LocalClassFieldTheory
open ClassFormation
noncomputable section
open CategoryTheory
section CyclicGenerator
variable {Q P : Type} [Group Q] [Group P]
 
theorem map_cyclicGenerator (e : Q ≃* P) (g : Q)
    (hg : ∀ q : Q, q ∈ Subgroup.zpowers g) :
    ∀ p : P, p ∈ Subgroup.zpowers (e g) := by
  intro p
  obtain ⟨n, hn⟩ := Subgroup.mem_zpowers_iff.mp (hg (e.symm p))
  apply Subgroup.mem_zpowers_iff.mpr
  refine ⟨n, ?_⟩
  rw [← map_zpow e, hn, e.apply_symm_apply]
end CyclicGenerator
section GroupEquiv
variable {R Q P : Type} [CommRing R]
  [CommGroup Q] [CommGroup P] [Fintype Q] [Fintype P]
private theorem res_norm_eq (e : Q ≃* P) (A : Rep R P) :
    let Ares : Rep R Q :=
      Rep.res e.toMonoidHom A
    ModuleCat.ofHom Ares.norm.hom.toLinearMap =
      ModuleCat.ofHom A.norm.hom.toLinearMap := by
  let Ares : Rep R Q :=
    Rep.res e.toMonoidHom A
  apply congrArg ModuleCat.ofHom
  change Representation.norm Ares.ρ = Representation.norm A.ρ
  simp only [Representation.norm]
  exact Fintype.sum_equiv e.toEquiv
    (fun q : Q => Ares.ρ q)
    (fun p : P => A.ρ p) (fun _ => rfl)
 

def normHomCompSubResEquivIso
    (e : Q ≃* P) (A : Rep R P) (g : Q) :
    Rep.FiniteCyclicGroup.normHomCompSub
        (Rep.res e.toMonoidHom A) g ≅
      Rep.FiniteCyclicGroup.normHomCompSub A (e g) := by
  let Ares : Rep R Q :=
    Rep.res e.toMonoidHom A
  let i : ModuleCat.of R Ares.V ≅ ModuleCat.of R A.V := Iso.refl _
  refine ShortComplex.isoMk i i i ?_ ?_
  · simpa [Ares, i] using (res_norm_eq e A).symm
  · rfl
 

def subCompNormHomResEquivIso
    (e : Q ≃* P) (A : Rep R P) (g : Q) :
    Rep.FiniteCyclicGroup.subCompNormHom
        (Rep.res e.toMonoidHom A) g ≅
      Rep.FiniteCyclicGroup.subCompNormHom A (e g) := by
  let Ares : Rep R Q :=
    Rep.res e.toMonoidHom A
  let i : ModuleCat.of R Ares.V ≅ ModuleCat.of R A.V := Iso.refl _
  refine ShortComplex.isoMk i i i ?_ ?_
  · rfl
  · simpa [Ares, i] using (res_norm_eq e A).symm
 
def normHomCompSubHomologyResEquivIso
    (e : Q ≃* P) (A : Rep R P) (g : Q) :
    (Rep.FiniteCyclicGroup.normHomCompSub
        (Rep.res e.toMonoidHom A) g).homology ≅
      (Rep.FiniteCyclicGroup.normHomCompSub A (e g)).homology :=
  ShortComplex.homologyMapIso (normHomCompSubResEquivIso e A g)
 
def subCompNormHomHomologyResEquivIso
    (e : Q ≃* P) (A : Rep R P) (g : Q) :
    (Rep.FiniteCyclicGroup.subCompNormHom
        (Rep.res e.toMonoidHom A) g).homology ≅
      (Rep.FiniteCyclicGroup.subCompNormHom A (e g)).homology :=
  ShortComplex.homologyMapIso (subCompNormHomResEquivIso e A g)
end GroupEquiv
section RepresentationIso
variable {R Q : Type} [CommRing R] [CommGroup Q] [Fintype Q]
 

def normHomCompSubIsoOfRepIso
    {M N : Rep R Q} (e : M ≅ N) (g : Q) :
    Rep.FiniteCyclicGroup.normHomCompSub M g ≅
      Rep.FiniteCyclicGroup.normHomCompSub N g := by
  let i : ModuleCat.of R M.V ≅ ModuleCat.of R N.V :=
    (forget₂ (Rep R Q) (ModuleCat R)).mapIso e
  refine ShortComplex.isoMk i i i ?_ ?_
  · have h := congrArg
      (fun f : M ⟶ N => ModuleCat.ofHom f.hom.toLinearMap)
      (Rep.norm_comm e.hom)
    simpa [i, Rep.norm] using h
  · have hrep :
        CategoryStruct.comp e.hom (Rep.applyAsHom N g - 𝟙 N) =
          CategoryStruct.comp (Rep.applyAsHom M g - 𝟙 M) e.hom := by
      rw [Preadditive.comp_sub, Preadditive.sub_comp, Category.comp_id,
        Category.id_comp, Rep.applyAsHom_comm]
    let F := forget₂ (Rep R Q) (ModuleCat R)
    change CategoryStruct.comp (F.map e.hom) (F.map (Rep.applyAsHom N g - 𝟙 N)) =
      CategoryStruct.comp (F.map (Rep.applyAsHom M g - 𝟙 M)) (F.map e.hom)
    rw [← F.map_comp, ← F.map_comp, hrep]
 

def subCompNormHomIsoOfRepIso
    {M N : Rep R Q} (e : M ≅ N) (g : Q) :
    Rep.FiniteCyclicGroup.subCompNormHom M g ≅
      Rep.FiniteCyclicGroup.subCompNormHom N g := by
  let i : ModuleCat.of R M.V ≅ ModuleCat.of R N.V :=
    (forget₂ (Rep R Q) (ModuleCat R)).mapIso e
  refine ShortComplex.isoMk i i i ?_ ?_
  · have hrep :
        CategoryStruct.comp e.hom (Rep.applyAsHom N g - 𝟙 N) =
          CategoryStruct.comp (Rep.applyAsHom M g - 𝟙 M) e.hom := by
      rw [Preadditive.comp_sub, Preadditive.sub_comp, Category.comp_id,
        Category.id_comp, Rep.applyAsHom_comm]
    let F := forget₂ (Rep R Q) (ModuleCat R)
    change CategoryStruct.comp (F.map e.hom) (F.map (Rep.applyAsHom N g - 𝟙 N)) =
      CategoryStruct.comp (F.map (Rep.applyAsHom M g - 𝟙 M)) (F.map e.hom)
    rw [← F.map_comp, ← F.map_comp, hrep]
  · have h := congrArg
      (fun f : M ⟶ N => ModuleCat.ofHom f.hom.toLinearMap)
      (Rep.norm_comm e.hom)
    simpa [i, Rep.norm] using h
 
def normHomCompSubHomologyIsoOfRepIso
    {M N : Rep R Q} (e : M ≅ N) (g : Q) :
    (Rep.FiniteCyclicGroup.normHomCompSub M g).homology ≅
      (Rep.FiniteCyclicGroup.normHomCompSub N g).homology :=
  ShortComplex.homologyMapIso (normHomCompSubIsoOfRepIso e g)
 

def subCompNormHomHomologyIsoOfRepIso
    {M N : Rep R Q} (e : M ≅ N) (g : Q) :
    (Rep.FiniteCyclicGroup.subCompNormHom M g).homology ≅
      (Rep.FiniteCyclicGroup.subCompNormHom N g).homology :=
  ShortComplex.homologyMapIso (subCompNormHomIsoOfRepIso e g)
end RepresentationIso
end
end LocalClassFieldTheory
end

/- ClassFieldTheory.LocalClassFieldTheory.Finite.LocalReciprocity.AbstractFixedFieldUnits -/
section
namespace LocalClassFieldTheory
open RamificationTheory CyclicCohomology KummerTheory
open LocalFieldTheory
open ClassFormation
noncomputable section
open CategoryTheory
variable (k Ω : Type) [Field k] [Field Ω] [Algebra k Ω] [IsGalois k Ω]
 

def abstractFixedFieldUnitsEquivGaloisFixed
    (H : ClosedSubgroup (Gal(Ω / k))) :
    Additive (abstractFixedField k Ω H)ˣ ≃+
      ambientFixedAddSubgroup (galoisAmbientUnitsRep k Ω) H where
  toFun x := ⟨intermediateFieldUnitsToGaloisAmbient k Ω
      (abstractFixedField k Ω H) x, by
    intro σ
    apply Additive.ext
    apply Units.ext
    exact (IntermediateField.mem_fixedField_iff H.toSubgroup
      ((Additive.toMul x : (abstractFixedField k Ω H)ˣ) : Ω)).1
        (Additive.toMul x : (abstractFixedField k Ω H)ˣ).1.property σ.1 σ.2⟩
  invFun a := by
    have ha : ((Additive.toMul a.1 : Ωˣ) : Ω) ∈
        abstractFixedField k Ω H := by
      rw [IntermediateField.mem_fixedField_iff]
      intro σ hσ
      have hfixed := a.2 ⟨σ, hσ⟩
      exact congrArg
        (fun z : Additive Ωˣ => ((Additive.toMul z : Ωˣ) : Ω)) hfixed
    let y₀ : abstractFixedField k Ω H :=
      ⟨((Additive.toMul a.1 : Ωˣ) : Ω), ha⟩
    have hy₀ : y₀ ≠ 0 := by
      intro h
      have h' : ((Additive.toMul a.1 : Ωˣ) : Ω) = 0 :=
        congrArg (abstractFixedField k Ω H).val h
      exact (Additive.toMul a.1 : Ωˣ).ne_zero h'
    exact Additive.ofMul (Units.mk0 y₀ hy₀)
  left_inv x := by
    apply Additive.ext
    apply Units.ext
    rfl
  right_inv a := by
    apply Subtype.ext
    apply Additive.ext
    apply Units.ext
    rfl
  map_add' _ _ := by
    apply Subtype.ext
    rfl
 

def abstractRelativeFixedFieldUnitsEquivGaloisFixed
    (K L : ClosedSubgroup (Gal(Ω / k)))
    (hLK : L.toSubgroup ≤ K.toSubgroup) :
    Additive (abstractRelativeFixedField k Ω hLK)ˣ ≃+
      ambientFixedAddSubgroup (galoisAmbientUnitsRep k Ω) L := by
  change Additive (abstractFixedField k Ω L)ˣ ≃+ _
  exact abstractFixedFieldUnitsEquivGaloisFixed k Ω L
 

def abstractExtensionFixedRepresentationUnitsEquiv
    (K L : ClosedSubgroup (Gal(Ω / k)))
    (hLK : L.toSubgroup ≤ K.toSubgroup)
    (hnormal : (extensionSubgroup K L hLK).Normal) :
    (extensionFixedRepresentation (galoisAmbientUnitsRep k Ω)
        K L hLK hnormal).V ≃+
      Additive (abstractRelativeFixedField k Ω hLK)ˣ :=
  (extensionFixedRepresentationEquiv (galoisAmbientUnitsRep k Ω)
      K L hLK hnormal).trans
    (abstractRelativeFixedFieldUnitsEquivGaloisFixed
      k Ω K L hLK).symm
omit [IsGalois k Ω] in
 
@[simp]
theorem abstractRelativeUnitsEquiv_extensionUnitsEquiv
    (K L : ClosedSubgroup (Gal(Ω / k)))
    (hLK : L.toSubgroup ≤ K.toSubgroup)
    (hnormal : (extensionSubgroup K L hLK).Normal)
    (x : (extensionFixedRepresentation (galoisAmbientUnitsRep k Ω)
      K L hLK hnormal).V) :
    abstractRelativeFixedFieldUnitsEquivGaloisFixed k Ω K L hLK
        (abstractExtensionFixedRepresentationUnitsEquiv
          k Ω K L hLK hnormal x) =
      extensionFixedRepresentationEquiv
        (galoisAmbientUnitsRep k Ω) K L hLK hnormal x := by
  exact (abstractRelativeFixedFieldUnitsEquivGaloisFixed
    k Ω K L hLK).apply_symm_apply
      (extensionFixedRepresentationEquiv
        (galoisAmbientUnitsRep k Ω) K L hLK hnormal x)
 

theorem abstractExtensionQuotientEquivGaloisGroup_mk_apply_val
    (K L : ClosedSubgroup (Gal(Ω / k)))
    (hLK : L.toSubgroup ≤ K.toSubgroup)
    (hnormal : (extensionSubgroup K L hLK).Normal)
    (σ : K.toSubgroup)
    (x : abstractRelativeFixedField k Ω hLK) :
    letI := hnormal
    σ.1 (x : Ω) =
      (((abstractExtensionQuotientEquivGaloisGroup
          k Ω K L hLK hnormal
          (QuotientGroup.mk' (extensionSubgroup K L hLK) σ)) x :
        abstractRelativeFixedField k Ω hLK) : Ω) := by
  let := hnormal
  let : (abstractRelativeFixedField k Ω hLK).fixingSubgroup.Normal :=
    abstractRelativeFixingSubgroup_normal k Ω K L hLK hnormal
  let H : ClosedSubgroup (Gal(Ω / abstractFixedField k Ω K)) :=
    closedFixingSubgroup (abstractFixedField k Ω K) Ω
      (abstractRelativeFixedField k Ω hLK)
  let : H.toSubgroup.Normal :=
    abstractRelativeFixingSubgroup_normal k Ω K L hLK hnormal
  have hq :
      abstractExtensionQuotientEquivAmbient k Ω K L hLK hnormal
          (QuotientGroup.mk' (extensionSubgroup K L hLK) σ) =
        QuotientGroup.mk'
          (abstractRelativeFixedField k Ω hLK).fixingSubgroup
          (abstractSubgroupEquivGaloisGroup k Ω K σ) := by
    rfl
  rw [abstractExtensionQuotientEquivGaloisGroup, MulEquiv.trans_apply, hq,
    MulEquiv.trans_apply]
  change σ.1 (x : Ω) =
    ((((IntermediateField.equivOfEq
      (InfiniteGalois.fixedField_fixingSubgroup
        (abstractRelativeFixedField k Ω hLK))).autCongr
      (InfiniteGalois.normalAutEquivQuotient
        (closedFixingSubgroup (abstractFixedField k Ω K) Ω
          (abstractRelativeFixedField k Ω hLK))
        ((abstractSubgroupEquivGaloisGroup k Ω K σ :
            Gal(Ω / abstractFixedField k Ω K)) :
          Gal(Ω / abstractFixedField k Ω K) ⧸
            (abstractRelativeFixedField k Ω hLK).fixingSubgroup))) x :
      abstractRelativeFixedField k Ω hLK) : Ω)
  rw [InfiniteGalois.normalAutEquivQuotient_apply,
    AlgEquiv.autCongr_apply]
  simp only [AlgEquiv.trans_apply, IntermediateField.equivOfEq_symm,
    IntermediateField.equivOfEq_apply]
  change σ.1 (x : Ω) =
    (((AlgEquiv.restrictNormalHom
      (IntermediateField.fixedField H.toSubgroup)
      (abstractSubgroupEquivGaloisGroup k Ω K σ))
      ⟨(x : Ω), _⟩ : IntermediateField.fixedField H.toSubgroup) : Ω)
  rw [AlgEquiv.restrictNormalHom_apply]
  rfl
 

theorem relativeCosetAction_abstractRelativeFixedFieldUnit_val
    (K L : ClosedSubgroup (Gal(Ω / k)))
    (hLK : L.toSubgroup ≤ K.toSubgroup)
    (hnormal : (extensionSubgroup K L hLK).Normal)
    (x : Additive (abstractRelativeFixedField k Ω hLK)ˣ)
    (q : K.toSubgroup ⧸ extensionSubgroup K L hLK) :
    letI := hnormal
    ((Additive.toMul
      (relativeCosetAction (galoisAmbientUnitsRep k Ω)
        K L hLK
        (abstractRelativeFixedFieldUnitsEquivGaloisFixed
          k Ω K L hLK x) q) : Ωˣ) : Ω) =
      (((Additive.toMul
        ((Rep.ofAlgebraAutOnUnits (abstractFixedField k Ω K)
          (abstractRelativeFixedField k Ω hLK)).ρ
            (abstractExtensionQuotientEquivGaloisGroup
              k Ω K L hLK hnormal q) x) :
          (abstractRelativeFixedField k Ω hLK)ˣ) :
        abstractRelativeFixedField k Ω hLK) : Ω) := by
  let := hnormal
  refine Quotient.inductionOn' q ?_
  intro σ
  rw [relativeCosetAction_mk]
  change σ.1 ((Additive.toMul x :
      (abstractRelativeFixedField k Ω hLK)ˣ) : Ω) = _
  exact abstractExtensionQuotientEquivGaloisGroup_mk_apply_val
    k Ω K L hLK hnormal σ
      (Additive.toMul x : (abstractRelativeFixedField k Ω hLK)ˣ)
 

theorem abstractExtensionFixedRepresentationUnitsEquiv_action
    (K L : ClosedSubgroup (Gal(Ω / k)))
    (hLK : L.toSubgroup ≤ K.toSubgroup)
    (hnormal : (extensionSubgroup K L hLK).Normal)
    (q : K.toSubgroup ⧸ extensionSubgroup K L hLK)
    (x : (extensionFixedRepresentation (galoisAmbientUnitsRep k Ω)
      K L hLK hnormal).V) :
    letI := hnormal
    abstractExtensionFixedRepresentationUnitsEquiv k Ω K L hLK hnormal
        ((extensionFixedRepresentation (galoisAmbientUnitsRep k Ω)
          K L hLK hnormal).ρ q x) =
      (Rep.ofAlgebraAutOnUnits (abstractFixedField k Ω K)
        (abstractRelativeFixedField k Ω hLK)).ρ
          (abstractExtensionQuotientEquivGaloisGroup
            k Ω K L hLK hnormal q)
          (abstractExtensionFixedRepresentationUnitsEquiv
            k Ω K L hLK hnormal x) := by
  let := hnormal
  let eFixed := abstractRelativeFixedFieldUnitsEquivGaloisFixed
    k Ω K L hLK
  apply eFixed.injective
  rw [abstractRelativeUnitsEquiv_extensionUnitsEquiv]
  apply Subtype.ext
  apply Additive.ext
  apply Units.ext
  have haction := extensionFixedRepresentation_action_coe
    (galoisAmbientUnitsRep k Ω) K L hLK hnormal q x
  change
    ((Additive.toMul
      ((extensionFixedRepresentation (galoisAmbientUnitsRep k Ω)
        K L hLK hnormal).ρ q x).1 : Ωˣ) : Ω) = _
  rw [haction]
  rw [← abstractRelativeUnitsEquiv_extensionUnitsEquiv
    k Ω K L hLK hnormal x]
  exact relativeCosetAction_abstractRelativeFixedFieldUnit_val
    k Ω K L hLK hnormal
      (abstractExtensionFixedRepresentationUnitsEquiv
        k Ω K L hLK hnormal x) q
 


def abstractExtensionFixedRepresentationIsoUnitsRes
    (K L : ClosedSubgroup (Gal(Ω / k)))
    (hLK : L.toSubgroup ≤ K.toSubgroup)
    (hnormal : (extensionSubgroup K L hLK).Normal) :
    letI := hnormal
    extensionFixedRepresentation (galoisAmbientUnitsRep k Ω)
        K L hLK hnormal ≅
      Rep.res
        (abstractExtensionQuotientEquivGaloisGroup
          k Ω K L hLK hnormal).toMonoidHom
        (Rep.ofAlgebraAutOnUnits (abstractFixedField k Ω K)
          (abstractRelativeFixedField k Ω hLK)) := by
  letI := hnormal
  let e := abstractExtensionFixedRepresentationUnitsEquiv
    k Ω K L hLK hnormal
  refine Rep.mkIso (Representation.Equiv.mk e.toIntLinearEquiv ?_)
  intro q
  apply LinearMap.ext
  intro x
  exact abstractExtensionFixedRepresentationUnitsEquiv_action
    k Ω K L hLK hnormal q x
end
end LocalClassFieldTheory
end

/- ClassFieldTheory.AlgebraicNumberTheory.Idele.NormApproximation.FinitePlaces -/
section
open scoped NumberField Classical NNReal
open NumberField IsDedekindDomain
noncomputable section
open LocalClassFieldTheory

open LocalClassFieldTheory
open LocalFieldTheory
variable {K L : Type}
    [Field K] [NumberField K]
    [Field L] [Algebra K L]
    [FiniteDimensional K L] [IsGalois K L]
 

noncomputable def finitePlaceCompletionBaseMap
    (v : HeightOneSpectrum (𝓞 K)) :
    WithAbs (NumberField.HeightOneSpectrum.adicAbv K v) →+*
      v.adicCompletion K :=
  (FinitePlace.embedding v).comp
    (WithAbs.equiv
      (NumberField.HeightOneSpectrum.adicAbv K v)).toRingHom
@[simp]
theorem finitePlaceCompletionBaseMap_apply
    (v : HeightOneSpectrum (𝓞 K))
    (x : WithAbs
      (NumberField.HeightOneSpectrum.adicAbv K v)) :
    finitePlaceCompletionBaseMap v x =
      FinitePlace.embedding v
        (WithAbs.equiv
          (NumberField.HeightOneSpectrum.adicAbv K v) x) :=
  rfl
theorem finitePlaceCompletionBaseMap_norm
    (v : HeightOneSpectrum (𝓞 K))
    (x : WithAbs
      (NumberField.HeightOneSpectrum.adicAbv K v)) :
    ‖finitePlaceCompletionBaseMap v x‖ = ‖x‖ := by
  rw [finitePlaceCompletionBaseMap_apply,
    FinitePlace.norm_embedding]
  rfl
 
theorem finitePlaceCompletionBaseMap_isometry
    (v : HeightOneSpectrum (𝓞 K)) :
    Isometry (finitePlaceCompletionBaseMap v) :=
  AddMonoidHomClass.isometry_of_norm _
    (finitePlaceCompletionBaseMap_norm v)
 
noncomputable def finitePlaceCompletionRingHom
    (v : HeightOneSpectrum (𝓞 K)) :
    (NumberField.HeightOneSpectrum.adicAbv K v).Completion →+*
      v.adicCompletion K :=
  (finitePlaceCompletionBaseMap_isometry v).extensionHom
@[simp]
theorem finitePlaceCompletionRingHom_coe
    (v : HeightOneSpectrum (𝓞 K))
    (x : WithAbs
      (NumberField.HeightOneSpectrum.adicAbv K v)) :
    finitePlaceCompletionRingHom v
        (x :
          (NumberField.HeightOneSpectrum.adicAbv K v).Completion) =
      finitePlaceCompletionBaseMap v x :=
  (finitePlaceCompletionBaseMap_isometry v).extensionHom_coe x
theorem finitePlaceCompletionRingHom_isometry
    (v : HeightOneSpectrum (𝓞 K)) :
    Isometry (finitePlaceCompletionRingHom v) :=
  (finitePlaceCompletionBaseMap_isometry v).completion_extension
 

theorem finitePlaceCompletionRingHom_surjective
    (v : HeightOneSpectrum (𝓞 K)) :
    Function.Surjective (finitePlaceCompletionRingHom v) := by
  let f := finitePlaceCompletionRingHom v
  have hrangeClosed : IsClosed (Set.range f) :=
    (finitePlaceCompletionRingHom_isometry v).isClosedEmbedding.isClosed_range
  have hdense :
      DenseRange (algebraMap K (v.adicCompletion K)) :=
    v.denseRange_algebraMap K
  have hrange :
      Set.range (algebraMap K (v.adicCompletion K)) ⊆
        Set.range f := by
    rintro _ ⟨x, rfl⟩
    let x' : WithAbs
        (NumberField.HeightOneSpectrum.adicAbv K v) :=
      (WithAbs.equiv
        (NumberField.HeightOneSpectrum.adicAbv K v)).symm x
    refine
      ⟨(x' :
          (NumberField.HeightOneSpectrum.adicAbv K v).Completion),
        ?_⟩
    rw [finitePlaceCompletionRingHom_coe]
    rfl
  intro x
  have hx :
      x ∈ closure
        (Set.range (algebraMap K (v.adicCompletion K))) := by
    rw [hdense.closure_range]
    trivial
  exact closure_minimal hrange hrangeClosed hx
 
noncomputable def finitePlaceCompletionRingEquiv
    (v : HeightOneSpectrum (𝓞 K)) :
    (NumberField.HeightOneSpectrum.adicAbv K v).Completion ≃+*
      v.adicCompletion K :=
  RingEquiv.ofBijective (finitePlaceCompletionRingHom v)
    ⟨(finitePlaceCompletionRingHom_isometry v).injective,
      finitePlaceCompletionRingHom_surjective v⟩
 
noncomputable def finitePlaceCompletionContinuousMulEquiv
    (v : HeightOneSpectrum (𝓞 K)) :
    (NumberField.HeightOneSpectrum.adicAbv K v).Completion ≃ₜ*
      v.adicCompletion K where
  __ := (finitePlaceCompletionRingEquiv v).toMulEquiv
  continuous_toFun :=
    (finitePlaceCompletionRingHom_isometry v).continuous
  continuous_invFun :=
    ((finitePlaceCompletionRingHom_isometry v).right_inv
      (finitePlaceCompletionRingEquiv v).right_inv).continuous
end

/- ClassFieldTheory.AlgebraicNumberTheory.Completion.ChosenLocalization -/
section
open scoped NumberField Classical ValuativeRel NNReal
open NumberField IsDedekindDomain
noncomputable section

open LocalFieldTheory

variable
    {K L : Type}
    [Field K] [NumberField K]
    [Field L] [Algebra K L]
    [FiniteDimensional K L] [IsGalois K L]
 
abbrev ChosenFinitePlaceBaseCompletion
    (w₀ : HeightOneSpectrum (𝓞 K)) :=
  (HeightOneSpectrum.adicAbv K w₀).Completion
noncomputable instance chosenFinitePlaceBaseLocallyCompactSpace
    (w₀ : HeightOneSpectrum (𝓞 K)) :
    LocallyCompactSpace
      (ChosenFinitePlaceBaseCompletion (K := K) w₀) :=
  AbsoluteValue.Completion.locallyCompactSpace
    (finitePlaceCompletionBaseMap_isometry w₀)
end

/- TunnellAbstractNormCoordinates -/
section
namespace TunnellAbstractNormCoordinates
open ClassFormation CyclicCohomology KummerTheory
open scoped Classical IsMulCommutative
noncomputable section
variable {G : Type} [Group G] [TopologicalSpace G]
abbrev U (H : ClosedSubgroup G) := H.toSubgroup
abbrev M (H J : ClosedSubgroup G) := (U J).subgroupOf (U H)
theorem finite_index (H : FiniteAbstractField G) : (U H.field).FiniteIndex := by
  letI := H.finite
  constructor
  rw [← Subgroup.relIndex_top_right]
  exact Subgroup.index_ne_zero_of_finite (H := extensionSubgroup (baseField G) H.field (le_baseField _))
def finiteField (H : ClosedSubgroup G) [(U H).FiniteIndex] : FiniteAbstractField G :=
  ⟨H, by
    apply Nat.finite_of_card_ne_zero
    change H.toSubgroup.relIndex ⊤ ≠ 0
    rw [Subgroup.relIndex_top_right]
    exact Subgroup.FiniteIndex.index_ne_zero⟩
abbrev Tate (A : Rep ℤ G) : Prop :=
  ∀ (H J : ClosedSubgroup G) [(U H).FiniteIndex], J ≤ H → ∀ [(M H J).Normal] [Fintype (U H ⧸ M H J)]
    [IsCyclic (U H ⧸ M H J)],
    let P := (Rep.res (U H).subtype A).quotientToInvariants (M H J)
    Nat.card (tateCohomology P 0) = Nat.card (U H ⧸ M H J) ∧
      Subsingleton (tateCohomology P (-1))
theorem tate_iff (A : Rep ℤ G) : Tate A ↔ SatisfiesClassFieldAxiom A := by
  constructor
  · intro hc K E
    letI := finite_index K
    letI := E.normal
    letI := E.finite
    letI : Fintype (U K.field ⧸ M K.field E.field) := Fintype.ofFinite _
    letI : IsCyclic (U K.field ⧸ M K.field E.field) := isCyclic_of_generator E.generator E.generates
    obtain ⟨h0,h1⟩ := hc K.field E.field E.below
    haveI : Finite (tateCohomology (E.fixedRepresentation A) 0) :=
      Nat.finite_of_card_ne_zero (h0.trans_ne Nat.card_pos.ne')
    haveI : Subsingleton (tateCohomology (E.fixedRepresentation A) (-1)) := h1
    exact ⟨inferInstance,inferInstance,h0, Nat.card_unique⟩
  · intro hc H J _ h hnormal htype hcyclic
    obtain ⟨g,hg⟩ := IsCyclic.exists_generator (α:=U H ⧸ M H J)
    let K := finiteField H
    let E : FiniteCyclicSubextension K := ⟨J,h,hnormal,@Finite.of_fintype _ htype,g,hg⟩
    have c := hc K E
    have htype' : htype = Fintype.ofFinite (U H ⧸ M H J) := Subsingleton.elim _ _
    constructor
    · convert c.tateHZero_card using 1
      · rw [htype']
        rfl
      · rfl
    · convert (Nat.card_eq_one_iff_unique.mp c.tateHMinusOne_card).1 using 1
      rw [htype']
      rfl
end
end TunnellAbstractNormCoordinates
end

/- TunnellAdicLocalField -/
section
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
end
end TunnellAdicLocalField
end

/- TunnellLocalCyclicNormIndex -/
section
namespace TunnellLocalCyclicNormIndex
open NumberField IsDedekindDomain LocalClassFieldTheory CyclicCohomology LocalFieldTheory
open scoped Classical NumberField TunnellAdicLocalField
noncomputable section
def CyclicIndex (K:Type) [Field K] :Prop :=
  ∀(L:Type)[Field L][Algebra K L][FiniteDimensional K L](Y:Type)[Field Y][Algebra L Y]
   [FiniteDimensional L Y][IsGalois L Y][IsCyclic Gal(Y/L)],
    Nat.card (Lˣ ⧸ (Units.map (Algebra.norm L (S:=Y))).range)=Module.finrank L Y
theorem tate_data {K:Type} [Field K] (h:CyclicIndex K) (L:Type) [Field L] [Algebra K L] [FiniteDimensional K L]
    (Y:Type) [Field Y] [Algebra L Y] [FiniteDimensional L Y] [IsGalois L Y] (g:Gal(Y/L)) (hg:∀s,s∈Subgroup.zpowers g) :
    UnitsTateCardinalityData L Y := by
  letI:IsCyclic Gal(Y/L):=CyclicCohomology.isCyclic_of_generator g hg
  let e:=H0TateUnitsIsoNormQuotient L Y
  have hc:Nat.card (tateCohomology (Rep.ofAlgebraAutOnUnits L Y) 0)=Module.finrank L Y:=
    (Nat.card_congr e.toLinearEquiv.toEquiv).trans (h L Y)
  letI : Finite (tateCohomology (Rep.ofAlgebraAutOnUnits L Y) 0) :=
    Nat.finite_of_card_ne_zero (hc.trans_ne (Module.finrank_pos (R:=L) (M:=Y)).ne')
  letI : Subsingleton (tateCohomology (Rep.ofAlgebraAutOnUnits L Y) (-1)) :=
    ModuleCat.subsingleton_of_isZero (hilbert90_unitsTateHminusOne_isZero L Y g hg)
  exact ⟨inferInstance,hc,Nat.card_unique⟩
end
end TunnellLocalCyclicNormIndex
end

/- TunnellConditionedLocalFormation -/
section
namespace TunnellConditionedLocalFormation
open CyclicCohomology ClassFormation LocalClassFieldTheory LocalFieldTheory CategoryTheory
noncomputable section
theorem ambient
    (k Ω : Type) [Field k] [Field Ω] [Algebra k Ω] [IsGalois k Ω]
    (hi:TunnellLocalCyclicNormIndex.CyclicIndex k) :
    SatisfiesClassFieldAxiom (galoisAmbientUnitsRep k Ω) := by
  rintro ⟨K, hKfinite⟩
  rintro ⟨L, hLK, hnormal, hfinite, g, hg⟩
  let := hKfinite
  let := hnormal
  let := hfinite
  let Q := K.toSubgroup ⧸ extensionSubgroup K L hLK
  let : Fintype Q := Fintype.ofFinite Q
  let F := abstractFixedField k Ω K
  let E := abstractRelativeFixedField k Ω hLK
  let : FiniteDimensional k F :=
    abstractFixedField_finiteDimensional k Ω K hKfinite
  let : FiniteDimensional F E :=
    abstractRelativeFixedField_finiteDimensional
      k Ω K L hLK hKfinite hfinite
  let : IsGalois F E :=
    abstractRelativeFixedField_isGalois k Ω K L hLK hnormal
  let eQ : Q ≃* Gal(E / F) :=
    abstractExtensionQuotientEquivGaloisGroup k Ω K L hLK hnormal
  let g' : Gal(E / F) := eQ g
  have hg' : ∀ σ : Gal(E / F), σ ∈ Subgroup.zpowers g' :=
    map_cyclicGenerator eQ g hg
  have hUnitsTateCard := TunnellLocalCyclicNormIndex.tate_data hi F E g' hg'

  let : IsCyclic Q := CyclicCohomology.isCyclic_of_generator g hg
  let : CommGroup Q := IsCyclic.commGroup
  let : IsCyclic (Gal(E / F)) :=
    CyclicCohomology.isCyclic_of_generator g' hg'
  let : CommGroup (Gal(E / F)) := IsCyclic.commGroup
  let M := extensionFixedRepresentation
    (galoisAmbientUnitsRep k Ω) K L hLK hnormal
  let U := Rep.ofAlgebraAutOnUnits F E
  let eM : M ≅
      Rep.res eQ.toMonoidHom U :=
    abstractExtensionFixedRepresentationIsoUnitsRes
      k Ω K L hLK hnormal
  let eH0 :
      (Rep.FiniteCyclicGroup.normHomCompSub M g).homology ≅
        (Rep.FiniteCyclicGroup.normHomCompSub U g').homology :=
    (normHomCompSubHomologyIsoOfRepIso eM g) ≪≫
      normHomCompSubHomologyResEquivIso eQ U g
  let eHm1 :
      (Rep.FiniteCyclicGroup.subCompNormHom M g).homology ≅
        (Rep.FiniteCyclicGroup.subCompNormHom U g').homology :=
    (subCompNormHomHomologyIsoOfRepIso eM g) ≪≫
      subCompNormHomHomologyResEquivIso eQ U g
  let eTateH0 :
      tateCohomology M 0 ≅ tateCohomology U 0 :=
    TateCohomology.isoFiniteCyclicZero M g hg ≪≫ eH0 ≪≫
      (TateCohomology.isoFiniteCyclicZero U g' hg').symm
  let eTateHm1 :
      tateCohomology M (-1) ≅ tateCohomology U (-1) :=
    TateCohomology.isoFiniteCyclicNegOne M g hg ≪≫ eHm1 ≪≫
      (TateCohomology.isoFiniteCyclicNegOne U g' hg').symm
  let : Finite (tateCohomology U 0) :=
    hUnitsTateCard.finiteH0
  have hUTateMinusOneZero :
      Limits.IsZero (tateCohomology U (-1)) :=
    hilbert90_unitsTateHminusOne_isZero F E g' hg'
  let : Subsingleton (tateCohomology U (-1)) :=
    ModuleCat.subsingleton_of_isZero hUTateMinusOneZero
  let : Finite (tateCohomology U (-1)) := by infer_instance
  let : Finite (tateCohomology M 0) :=
    Finite.of_equiv (tateCohomology U 0) eTateH0.symm.toLinearEquiv.toEquiv
  let : Finite (tateCohomology M (-1)) :=
    Finite.of_equiv (tateCohomology U (-1)) eTateHm1.symm.toLinearEquiv.toEquiv
  have hH0actual :
      Nat.card (tateCohomology U 0) =
        Module.finrank F E :=
    hUnitsTateCard.cardH0
  have hHm1actual :
      Nat.card (tateCohomology U (-1)) = 1 :=
    hUnitsTateCard.cardHminusOne
  refine
    { finiteTateHZero := by
        change Finite (tateCohomology M 0)
        infer_instance
      finiteTateHMinusOne := by
        change Finite (tateCohomology M (-1))
        infer_instance
      tateHZero_card := ?_
      tateHMinusOne_card := ?_ }
  · change Nat.card
      (tateCohomology M 0) =
        ((DegreeData.FiniteAbstractExtension.ofInclusion L K hLK).degree : ℕ)
    calc
      Nat.card (tateCohomology M 0) =
          Nat.card (tateCohomology U 0) :=
        Nat.card_congr eTateH0.toLinearEquiv.toEquiv
      _ = Module.finrank F E := hH0actual
      _ = ((DegreeData.FiniteAbstractExtension.ofInclusion L K hLK).degree : ℕ) :=
        (finiteAbstractExtension_degree_eq_finrank
          k Ω K L hLK hnormal hKfinite hfinite).symm
  · change Nat.card
      (tateCohomology M (-1)) = 1
    calc
      Nat.card (tateCohomology M (-1)) =
          Nat.card (tateCohomology U (-1)) :=
        Nat.card_congr eTateHm1.toLinearEquiv.toEquiv
      _ = 1 := hHm1actual
 


theorem separableClosureUnits_isClassFormation
    (k : Type) [Field k] (hi:TunnellLocalCyclicNormIndex.CyclicIndex k) :
    SatisfiesClassFieldAxiom
      (galoisAmbientUnitsRep k (SeparableClosure k)) :=
  ambient k (SeparableClosure k) hi
end
end TunnellConditionedLocalFormation
end

/- TunnellLocalTateActual -/
section
namespace TunnellLocalTateActual
open scoped TunnellAdicLocalField
theorem actual : OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H1_R1_H2_R1_H2_R1.H3 := by
  intro index p
  let k := p.adicCompletion ℚ
  exact (TunnellAbstractNormCoordinates.tate_iff _).mpr
    (TunnellConditionedLocalFormation.separableClosureUnits_isClassFormation k (index k))
end TunnellLocalTateActual
end

theorem OMA.solution : OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H1_R1_H2_R1_H2_R1.H3 := TunnellLocalTateActual.actual
