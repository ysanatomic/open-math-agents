import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H1_R1_H2_R1_H2_R1_H1_R1
import Mathlib

/-! Finite norm quotients in a profinite class formation. Adapted in part from ClassFieldTheory at commit 2e6280f9d2579705a0cc6c76ec68c2b60f9c601a, https://github.com/n-yamaguchi-0729/ClassFieldTheory. -/
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

/- GaloisCohomology.GroupTheory.QuotientTower -/
section
noncomputable section
universe u
namespace Subgroup
variable {G : Type u} [Group G]
 

def quotientSubgroupOfEquiv {H K M : Subgroup G} (hHK : H ≤ K) :
    (↑(H.subgroupOf K) ⧸ (M.subgroupOf K).subgroupOf (H.subgroupOf K)) ≃
      (↑H ⧸ M.subgroupOf H) where
  toFun := Quotient.map' (subgroupOfEquivOfLe hHK) (by
    intro x y hxy
    rw [QuotientGroup.leftRel_apply] at hxy ⊢
    exact hxy)
  invFun := Quotient.map' (subgroupOfEquivOfLe hHK).symm (by
    intro x y hxy
    rw [QuotientGroup.leftRel_apply] at hxy ⊢
    exact hxy)
  left_inv q := by
    refine Quotient.inductionOn' q ?_
    intro x
    change Quotient.map' _ _ (Quotient.map' _ _ (Quotient.mk'' x)) = Quotient.mk'' x
    simpa only [Quotient.map'_mk''] using
      congrArg Quotient.mk'' ((subgroupOfEquivOfLe hHK).symm_apply_apply x)
  right_inv q := by
    refine Quotient.inductionOn' q ?_
    intro x
    change Quotient.map' _ _ (Quotient.map' _ _ (Quotient.mk'' x)) = Quotient.mk'' x
    simpa only [Quotient.map'_mk''] using
      congrArg Quotient.mk'' ((subgroupOfEquivOfLe hHK).apply_symm_apply x)
 

def quotientTowerEquiv {M L K : Subgroup G} (hML : M ≤ L) (hLK : L ≤ K) :
    (K ⧸ M.subgroupOf K) ≃
      (K ⧸ L.subgroupOf K) × (L ⧸ M.subgroupOf L) :=
  (quotientEquivProdOfLE (subgroupOf_mono K hML)).trans
    (Equiv.prodCongr (Equiv.refl _) (quotientSubgroupOfEquiv hLK))
end Subgroup
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
 


def subgroup (E : AbstractExtension G) : Subgroup E.base.toSubgroup :=
  extensionSubgroup E.base E.field E.below
 
def quotient (E : AbstractExtension G) : Type u :=
  E.base.toSubgroup ⧸ E.subgroup
 

structure Tower (G : Type*) [Group G] [TopologicalSpace G] where
   
  top : ClosedSubgroup G
   
  middle : ClosedSubgroup G
   
  base : ClosedSubgroup G
   
  top_le_middle : top.toSubgroup ≤ middle.toSubgroup
   
  middle_le_base : middle.toSubgroup ≤ base.toSubgroup
namespace Tower
variable (T : Tower G)
 
def topExtension : AbstractExtension G where
  field := T.top
  base := T.middle
  below := T.top_le_middle
 
def baseExtension : AbstractExtension G where
  field := T.middle
  base := T.base
  below := T.middle_le_base
 
def totalExtension : AbstractExtension G where
  field := T.top
  base := T.base
  below := T.top_le_middle.trans T.middle_le_base
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
 

instance representedQuotientFinite :
    Finite
      (E.base.toSubgroup ⧸
        extensionSubgroup E.base E.field E.below) :=
  E.finiteQuotient
 
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
 



structure FiniteTower (G : Type*) [Group G] [TopologicalSpace G]
    extends AbstractExtension.Tower G where
   
  finiteTopQuotient : Finite toTower.topExtension.quotient
   
  finiteBaseQuotient : Finite toTower.baseExtension.quotient
namespace FiniteTower
variable (T : FiniteTower G)
 
instance topQuotientFinite :
    Finite (T.middle.toSubgroup ⧸
      extensionSubgroup T.middle T.top T.top_le_middle) :=
  T.finiteTopQuotient
 
instance baseQuotientFinite :
    Finite (T.base.toSubgroup ⧸
      extensionSubgroup T.base T.middle T.middle_le_base) :=
  T.finiteBaseQuotient
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
 
instance (K : FiniteAbstractField G) :
    Finite ((baseField G).toSubgroup ⧸
      extensionSubgroup (baseField G) K.field (le_baseField K.field)) :=
  K.finite
end FiniteAbstractField
namespace FiniteAbstractFieldExtension
end FiniteAbstractFieldExtension
end
end ClassFormation
end

/- GaloisCohomology.Kummer.Abstract.KummerAbelianCyclicFactors -/
section
namespace KummerTheory
open CyclicCohomology
noncomputable section
section FiniteAbelianCyclicFactors
 

theorem finiteCommGroup_exists_jointlyFaithful_cyclic_factors
    (Q : Type*) [CommGroup Q] [Finite Q] :
    ∃ (ι : Type 0) (_ : Fintype ι) (m : ι → ℕ),
      (∀ i, 1 < m i) ∧
      ∃ f : ∀ i, Q →* Multiplicative (ZMod (m i)),
        (∀ i, Function.Surjective (f i)) ∧
        (⨅ i, MonoidHom.ker (f i)) = ⊥ := by
  obtain ⟨ι, hι, m, hm, ⟨e⟩⟩ :=
    CommGroup.equiv_prod_multiplicative_zmod_of_finite Q
  let f : ∀ i, Q →* Multiplicative (ZMod (m i)) := fun i =>
    (Pi.evalMonoidHom (fun j => Multiplicative (ZMod (m j))) i).comp e
  refine ⟨ι, hι, m, hm, f, ?_, ?_⟩
  · intro i
    exact (Function.surjective_eval i).comp e.surjective
  · apply le_antisymm
    · intro x hx
      rw [Subgroup.mem_bot]
      apply e.injective
      ext i
      have hxi : x ∈ MonoidHom.ker (f i) :=
        (Subgroup.mem_iInf.mp hx) i
      simpa [f] using MonoidHom.mem_ker.mp hxi
    · exact bot_le
section Pullback
variable {P C : Type*} [Group P] [Group C]
  (H : Subgroup P) [H.Normal]
variable {ι : Type*} {Cι : ι → Type*} [∀ i, Group (Cι i)]
end Pullback
end FiniteAbelianCyclicFactors
section ClosedCyclicSubextensions
variable {G : Type*} [Group G] [TopologicalSpace G]
 

theorem extensionSubgroup_isClosed
    {G : Type*} [Group G] [TopologicalSpace G]
    (K L : ClosedSubgroup G) (hLK : L.toSubgroup ≤ K.toSubgroup) :
    IsClosed (extensionSubgroup (G := G) K L hLK : Set K.toSubgroup) := by
  change IsClosed ((fun x : K.toSubgroup => (x : G)) ⁻¹' (L : Set G))
  exact L.isClosed'.preimage continuous_subtype_val
variable [IsTopologicalGroup G]
end ClosedCyclicSubextensions
end
end KummerTheory
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
 
def leftMulCosetEquiv {G : Type*} [Group G]
    (H : Subgroup G) (g : G) : (G ⧸ H) ≃ (G ⧸ H) where
  toFun q := g • q
  invFun q := g⁻¹ • q
  left_inv q := by simp
  right_inv q := by simp
 
@[simp] theorem leftMulCosetEquiv_mk {G : Type*} [Group G]
    (H : Subgroup G) (g x : G) :
    leftMulCosetEquiv H g (QuotientGroup.mk x) = QuotientGroup.mk (g * x) :=
  rfl
 
def relativeNormValue
    (A : Rep ℤ G) (K L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.toSubgroup)
    [Finite (K.toSubgroup ⧸ extensionSubgroup K L hLK)]
    (a : ambientFixedAddSubgroup A L) : A.V := by
  letI := Fintype.ofFinite (K.toSubgroup ⧸ extensionSubgroup K L hLK)
  exact ∑ q, relativeCosetAction A K L hLK a q
 
theorem relativeCosetAction_add
    (A : Rep ℤ G) (K L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.toSubgroup)
    (a b : ambientFixedAddSubgroup A L)
    (q : K.toSubgroup ⧸ extensionSubgroup K L hLK) :
    relativeCosetAction A K L hLK (a + b) q =
      relativeCosetAction A K L hLK a q +
        relativeCosetAction A K L hLK b q := by
  refine Quotient.inductionOn' q ?_
  intro k
  simp only [relativeCosetAction_mk]
  exact map_add (A.ρ k.1) a.1 b.1
 
@[simp]
theorem relativeCosetAction_zero
    (A : Rep ℤ G) (K L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.toSubgroup)
    (q : K.toSubgroup ⧸ extensionSubgroup K L hLK) :
    relativeCosetAction A K L hLK 0 q = 0 := by
  refine Quotient.inductionOn' q ?_
  intro k
  simp only [relativeCosetAction_mk]
  exact map_zero (A.ρ k.1)
 
theorem relativeNormValue_fixed
    (A : Rep ℤ G) (K L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.toSubgroup)
    [Finite (K.toSubgroup ⧸ extensionSubgroup K L hLK)]
    (a : ambientFixedAddSubgroup A L) (k : K.toSubgroup) :
    A.ρ k.1 (relativeNormValue A K L hLK a) =
      relativeNormValue A K L hLK a := by
  let := Fintype.ofFinite (K.toSubgroup ⧸ extensionSubgroup K L hLK)
  have hterm : ∀ q : K.toSubgroup ⧸ extensionSubgroup K L hLK,
      A.ρ k.1 (relativeCosetAction A K L hLK a q) =
        relativeCosetAction A K L hLK a
          (leftMulCosetEquiv (extensionSubgroup K L hLK) k q) := by
    intro q
    refine Quotient.inductionOn' q ?_
    intro x
    simp only [relativeCosetAction_mk, leftMulCosetEquiv_mk]
    change A.ρ k.1 (A.ρ x.1 a.1) = A.ρ (k.1 * x.1) a.1
    rw [map_mul]
    rfl
  rw [relativeNormValue]
  simp_rw [map_sum, hterm]
  exact (leftMulCosetEquiv (extensionSubgroup K L hLK) k).sum_comp
    (relativeCosetAction A K L hLK a)
 




def relativeNorm
    (A : Rep ℤ G) (K L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.toSubgroup)
    [Finite (K.toSubgroup ⧸ extensionSubgroup K L hLK)] :
    ambientFixedAddSubgroup A L →+ ambientFixedAddSubgroup A K where
  toFun a := ⟨relativeNormValue A K L hLK a,
    relativeNormValue_fixed A K L hLK a⟩
  map_zero' := by
    apply Subtype.ext
    let := Fintype.ofFinite (K.toSubgroup ⧸ extensionSubgroup K L hLK)
    simp [relativeNormValue]
  map_add' a b := by
    apply Subtype.ext
    let := Fintype.ofFinite (K.toSubgroup ⧸ extensionSubgroup K L hLK)
    simp only [AddSubgroup.coe_add, relativeNormValue]
    rw [← Finset.sum_add_distrib]
    apply Finset.sum_congr rfl
    intro q _
    exact relativeCosetAction_add A K L hLK a b q
 
@[simp]
theorem relativeNorm_apply_coe
    (A : Rep ℤ G) (K L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.toSubgroup)
    [Finite (K.toSubgroup ⧸ extensionSubgroup K L hLK)]
    (a : ambientFixedAddSubgroup A L) :
    ((relativeNorm A K L hLK a : ambientFixedAddSubgroup A K) : A.V) =
      relativeNormValue A K L hLK a :=
  rfl
end
end ClassFormation
end

/- ClassFieldTheory.AbstractClassFieldTheory.Degree.NormLaws -/
section
namespace ClassFormation
open KummerTheory
open CyclicCohomology
noncomputable section
open scoped BigOperators Pointwise
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
 
theorem relativeTowerQuotientFinite
    {G : Type*} [Group G] [TopologicalSpace G]
    (K L M : ClosedSubgroup G)
    (hML : M.toSubgroup ≤ L.toSubgroup)
    (hLK : L.toSubgroup ≤ K.toSubgroup)
    [Finite (K.toSubgroup ⧸ extensionSubgroup K L hLK)]
    [Finite (L.toSubgroup ⧸ extensionSubgroup L M hML)] :
    Finite
      (K.toSubgroup ⧸ extensionSubgroup K M (hML.trans hLK)) :=
  Finite.of_equiv
    ((K.toSubgroup ⧸ extensionSubgroup K L hLK) ×
      (L.toSubgroup ⧸ extensionSubgroup L M hML))
    (Subgroup.quotientTowerEquiv hML hLK).symm
namespace DegreeData.FiniteTower
variable (T : DegreeData.FiniteTower G)
 
noncomputable def totalExtension : DegreeData.FiniteAbstractExtension G where
  toAbstractExtension := T.toTower.totalExtension
  finiteQuotient := relativeTowerQuotientFinite
    T.base T.middle T.top T.top_le_middle T.middle_le_base
 
instance totalQuotientFinite :
    Finite (T.base.toSubgroup ⧸
      extensionSubgroup T.base T.top
        (T.top_le_middle.trans T.middle_le_base)) :=
  T.totalExtension.finiteQuotient
end DegreeData.FiniteTower
private theorem relativeCosetAction_towerProductEquiv
    (A : Rep ℤ G) (K L M : ClosedSubgroup G)
    (hML : M.toSubgroup ≤ L.toSubgroup)
    (hLK : L.toSubgroup ≤ K.toSubgroup)
    (a : ambientFixedAddSubgroup A M)
    (q : K.toSubgroup ⧸ extensionSubgroup K L hLK)
    (r : L.toSubgroup ⧸ extensionSubgroup L M hML) :
    relativeCosetAction A K M (hML.trans hLK) a
        ((Subgroup.quotientTowerEquiv hML hLK).symm (q, r)) =
      A.ρ (Quotient.out q).1 (relativeCosetAction A L M hML a r) := by
  refine Quotient.inductionOn' r ?_
  intro x
  have he : (Subgroup.quotientTowerEquiv hML hLK).symm
      (q, QuotientGroup.mk x) =
      QuotientGroup.mk (Quotient.out q * Subgroup.inclusion hLK x) := rfl
  rw [he, relativeCosetAction_mk, relativeCosetAction_mk]
  change A.ρ ((Quotient.out q).1 * x.1) a.1 =
    A.ρ (Quotient.out q).1 (A.ρ x.1 a.1)
  rw [map_mul]
  rfl
private theorem finiteTowerNormTransApplyAux
    (A : Rep ℤ G) (K L M : ClosedSubgroup G)
    (hML : M.toSubgroup ≤ L.toSubgroup)
    (hLK : L.toSubgroup ≤ K.toSubgroup)
    [Finite (K.toSubgroup ⧸ extensionSubgroup K L hLK)]
    [Finite (L.toSubgroup ⧸ extensionSubgroup L M hML)]
    (a : ambientFixedAddSubgroup A M) :
    letI : Finite (K.toSubgroup ⧸ extensionSubgroup K M (hML.trans hLK)) :=
      relativeTowerQuotientFinite K L M hML hLK
    relativeNorm A K L hLK (relativeNorm A L M hML a) =
      relativeNorm A K M (hML.trans hLK) a := by
  apply Subtype.ext
  let := Fintype.ofFinite (K.toSubgroup ⧸ extensionSubgroup K L hLK)
  let := Fintype.ofFinite (L.toSubgroup ⧸ extensionSubgroup L M hML)
  let totalFintype : Fintype
      (K.toSubgroup ⧸ extensionSubgroup K M (hML.trans hLK)) :=
    Fintype.ofEquiv
      ((K.toSubgroup ⧸ extensionSubgroup K L hLK) ×
        (L.toSubgroup ⧸ extensionSubgroup L M hML))
      (Subgroup.quotientTowerEquiv hML hLK).symm
  have htotalFintype : Fintype.ofFinite
      (K.toSubgroup ⧸ extensionSubgroup K M (hML.trans hLK)) = totalFintype :=
    Subsingleton.elim _ _
  have houter : ∀ q : K.toSubgroup ⧸ extensionSubgroup K L hLK,
      relativeCosetAction A K L hLK (relativeNorm A L M hML a) q =
        A.ρ (Quotient.out q).1 (relativeNormValue A L M hML a) := by
    intro q
    calc
      relativeCosetAction A K L hLK (relativeNorm A L M hML a) q =
          relativeCosetAction A K L hLK (relativeNorm A L M hML a)
            (QuotientGroup.mk (Quotient.out q)) := by
              exact congrArg
                (relativeCosetAction A K L hLK (relativeNorm A L M hML a))
                (Quotient.out_eq' q).symm
      _ = A.ρ (Quotient.out q).1
          ((relativeNorm A L M hML a : ambientFixedAddSubgroup A L) : A.V) :=
        relativeCosetAction_mk A K L hLK (relativeNorm A L M hML a)
          (Quotient.out q)
      _ = A.ρ (Quotient.out q).1 (relativeNormValue A L M hML a) := by
        rw [relativeNorm_apply_coe]
  simp only [relativeNorm_apply_coe, relativeNormValue]
  rw [htotalFintype]
  rw [Finset.sum_congr rfl (fun q _ ↦ houter q)]
  simp only [relativeNormValue]
  simp_rw [map_sum]
  rw [← Fintype.sum_prod_type (f := fun p :
    (K.toSubgroup ⧸ extensionSubgroup K L hLK) ×
      (L.toSubgroup ⧸ extensionSubgroup L M hML) ↦
        A.ρ (Quotient.out p.1).1
          (relativeCosetAction A L M hML a p.2))]
  calc
    ∑ p : (K.toSubgroup ⧸ extensionSubgroup K L hLK) ×
        (L.toSubgroup ⧸ extensionSubgroup L M hML),
        A.ρ (Quotient.out p.1).1 (relativeCosetAction A L M hML a p.2) =
      ∑ p, relativeCosetAction A K M (hML.trans hLK) a
        ((Subgroup.quotientTowerEquiv hML hLK).symm p) := by
          apply Fintype.sum_congr
          intro p
          exact (relativeCosetAction_towerProductEquiv A K L M hML hLK a p.1 p.2).symm
    _ = ∑ q, relativeCosetAction A K M (hML.trans hLK) a q :=
      (Subgroup.quotientTowerEquiv hML hLK).symm.sum_comp
        (relativeCosetAction A K M (hML.trans hLK) a)
namespace DegreeData.FiniteTower
variable (T : DegreeData.FiniteTower G)
 

theorem norm_trans_apply (A : Rep ℤ G)
    (a : ambientFixedAddSubgroup A T.top) :
    relativeNorm A T.base T.middle T.middle_le_base
        (relativeNorm A T.middle T.top T.top_le_middle a) =
      relativeNorm A T.base T.top
        (T.top_le_middle.trans T.middle_le_base) a := by
  exact finiteTowerNormTransApplyAux A T.base T.middle T.top
    T.top_le_middle T.middle_le_base a
 
theorem norm_trans (A : Rep ℤ G) :
    (relativeNorm A T.base T.middle T.middle_le_base).comp
        (relativeNorm A T.middle T.top T.top_le_middle) =
      relativeNorm A T.base T.top
        (T.top_le_middle.trans T.middle_le_base) := by
  apply AddMonoidHom.ext
  intro a
  exact T.norm_trans_apply A a
end DegreeData.FiniteTower
end
end ClassFormation
end

/- ClassFieldTheory.AbstractClassFieldTheory.Degree.PrimeElements -/
section
namespace ClassFormation
open KummerTheory
open CyclicCohomology
noncomputable section
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]

 
def fixedFieldInclusion (A : Rep ℤ G) (K L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.toSubgroup) :
    ambientFixedAddSubgroup A K →+ ambientFixedAddSubgroup A L where
  toFun a := ⟨a.1, fun l => a.2 ⟨l.1, hLK l.2⟩⟩
  map_zero' := rfl
  map_add' _ _ := rfl
namespace ValuationData
end ValuationData
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
 

theorem tateHZero_card
    (hcf : SatisfiesClassFieldAxiom A)
    (K : FiniteAbstractField G) (E : FiniteCyclicSubextension K) :
    Nat.card (tateCohomology (E.fixedRepresentation A) 0) =
      (E.toFiniteAbstractExtension.degree : ℕ) :=
  (hcf K E).tateHZero_card
end SatisfiesClassFieldAxiom
end
end ClassFormation
end

/- ClassFieldTheory.AbstractClassFieldTheory.Reciprocity.Construction.FiniteNormQuotient -/
section
universe u
namespace ClassFormation
open KummerTheory
open CyclicCohomology
noncomputable section
section finiteNorms
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
 
def finiteNormSubgroup (A : Rep ℤ G) (K L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.toSubgroup)
    [Finite (K.toSubgroup ⧸ extensionSubgroup K L hLK)] :
    AddSubgroup (ambientFixedAddSubgroup A K) :=
  (relativeNorm A K L hLK).range
 




def FiniteNormQuotient (A : Rep ℤ G) (K L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.toSubgroup)
    [Finite (K.toSubgroup ⧸ extensionSubgroup K L hLK)] :=
  ambientFixedAddSubgroup A K ⧸ finiteNormSubgroup A K L hLK
 


instance finiteNormQuotientAddCommGroup
    (A : Rep ℤ G) (K L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.toSubgroup)
    [Finite (K.toSubgroup ⧸ extensionSubgroup K L hLK)] :
    AddCommGroup (FiniteNormQuotient A K L hLK) := by
  unfold FiniteNormQuotient
  infer_instance
 


def finiteNormQuotientConcreteEquiv
    (A : Rep ℤ G) (K L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.toSubgroup)
    [Finite (K.toSubgroup ⧸ extensionSubgroup K L hLK)] :
    FiniteNormQuotient A K L hLK ≃+
      ambientFixedAddSubgroup A K ⧸ finiteNormSubgroup A K L hLK := by
  unfold FiniteNormQuotient
  exact AddEquiv.refl _
end finiteNorms
section finiteIntermediateField
variable {G : Type u} [Group G] [TopologicalSpace G]
namespace DegreeData
end DegreeData
end finiteIntermediateField
section quotientMaps
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
namespace DegreeData
end DegreeData
end quotientMaps
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
 

theorem extensionFixedRepresentation_norm_coe
    (A : Rep ℤ G) (K L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.toSubgroup)
    (hnormal : (extensionSubgroup K L hLK).Normal)
    [Finite (K.toSubgroup ⧸ extensionSubgroup K L hLK)]
    (a : (extensionFixedRepresentation A K L hLK hnormal).V) :
    letI := hnormal
    letI := Fintype.ofFinite
      (K.toSubgroup ⧸ extensionSubgroup K L hLK)
    ((extensionFixedRepresentation A K L hLK hnormal).norm.hom a).1 =
      ((relativeNorm A K L hLK
        (extensionFixedRepresentationEquiv A K L hLK hnormal a) :
          ambientFixedAddSubgroup A K) : A.V) := by
  let := hnormal
  let := Fintype.ofFinite
    (K.toSubgroup ⧸ extensionSubgroup K L hLK)
  rw [relativeNorm_apply_coe]
  simp only [Rep.norm, Representation.norm, relativeNormValue]
  let M := extensionFixedRepresentation A K L hLK hnormal
  let : Module ℤ M.V := M.hV2
  change ((∑ q, M.ρ q) a).1 =
    ∑ q, relativeCosetAction A K L hLK
      (extensionFixedRepresentationEquiv A K L hLK hnormal a) q
  rw [LinearMap.sum_apply]
  let coeToAmbient :
      (extensionFixedRepresentation A K L hLK hnormal).V →+ A.V :=
    { toFun := fun x => x.1
      map_zero' := rfl
      map_add' := fun _ _ => rfl }
  change coeToAmbient (∑ q, M.ρ q a) =
    ∑ q, relativeCosetAction A K L hLK
      (extensionFixedRepresentationEquiv A K L hLK hnormal a) q
  rw [map_sum]
  apply Finset.sum_congr rfl
  intro q _
  exact extensionFixedRepresentation_action_coe A K L hLK hnormal q a
end
end ClassFormation
end

/- ClassFieldTheory.AbstractClassFieldTheory.Reciprocity.CyclicNormQuotient -/
section
namespace ClassFormation
open KummerTheory
open CyclicCohomology
noncomputable section
open CategoryTheory
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
 

def cyclicFixedCycleEquiv
    (A : Rep ℤ G)
    (K L : ClosedSubgroup G) (hLK : L.toSubgroup ≤ K.toSubgroup)
    (hnormal : (extensionSubgroup K L hLK).Normal)
    (hfinite : Finite (K.toSubgroup ⧸ extensionSubgroup K L hLK))
    (g : K.toSubgroup ⧸ extensionSubgroup K L hLK)
    (hg : ∀ x, x ∈ Subgroup.zpowers g) :
    letI := hnormal
    letI := hfinite
    letI := Fintype.ofFinite
      (K.toSubgroup ⧸ extensionSubgroup K L hLK)
    letI : IsCyclic
        (K.toSubgroup ⧸ extensionSubgroup K L hLK) :=
      isCyclic_of_generator g hg
    letI : CommGroup
        (K.toSubgroup ⧸ extensionSubgroup K L hLK) :=
      IsCyclic.commGroup
    let M := extensionFixedRepresentation A K L hLK hnormal
    let T := Rep.FiniteCyclicGroup.normHomCompSub M g
    ambientFixedAddSubgroup A K ≃+
      T.moduleCatLeftHomologyData.K := by
  dsimp only
  letI := hnormal
  letI := hfinite
  letI := Fintype.ofFinite
    (K.toSubgroup ⧸ extensionSubgroup K L hLK)
  letI : IsCyclic (K.toSubgroup ⧸ extensionSubgroup K L hLK) :=
    isCyclic_of_generator g hg
  letI : CommGroup (K.toSubgroup ⧸ extensionSubgroup K L hLK) :=
    IsCyclic.commGroup
  let M := extensionFixedRepresentation A K L hLK hnormal
  let T := Rep.FiniteCyclicGroup.normHomCompSub M g
  let toCycle : ambientFixedAddSubgroup A K →
      T.moduleCatLeftHomologyData.K := fun a => by
    let aL := fixedFieldInclusion A K L hLK a
    let aM : M.V :=
      (extensionFixedRepresentationEquiv A K L hLK hnormal).symm aL
    refine ⟨aM, sub_eq_zero.mpr ?_⟩
    refine Quotient.inductionOn' g ?_
    intro k
    apply Subtype.ext
    change A.ρ k.1 a.1 = a.1
    exact a.2 k
  let fromCycle : T.moduleCatLeftHomologyData.K →
      ambientFixedAddSubgroup A K := fun x => by
    let aM : M.V := x.1
    let aL : ambientFixedAddSubgroup A L :=
      extensionFixedRepresentationEquiv A K L hLK hnormal aM
    have hxzero : T.g.hom aM = 0 := x.2
    have hxg : M.ρ g aM = aM := by
      apply sub_eq_zero.mp
      exact hxzero
    have hxall : ∀ q, M.ρ q aM = aM := by
      let : Module ℤ M := M.hV2
      exact (Representation.mem_invariants_iff_of_forall_mem_zpowers
        M.ρ g hg aM).2 hxg
    refine ⟨aL.1, ?_⟩
    intro k
    have hk := hxall
      ((QuotientGroup.mk' (extensionSubgroup K L hLK)) k)
    have haction := extensionFixedRepresentation_action_coe
      A K L hLK hnormal
      ((QuotientGroup.mk' (extensionSubgroup K L hLK)) k) aM
    have haction' :
        (M.ρ ((QuotientGroup.mk'
          (extensionSubgroup K L hLK)) k) aM).1 =
          A.ρ k.1 aL.1 := by
      calc
        _ = relativeCosetAction A K L hLK aL
              ((QuotientGroup.mk'
                (extensionSubgroup K L hLK)) k) := haction
        _ = A.ρ k.1 aL.1 :=
          relativeCosetAction_mk A K L hLK aL k
    exact haction'.symm.trans ((congrArg Subtype.val hk).trans rfl)
  exact
    { toFun := toCycle
      invFun := fromCycle
      left_inv := by
        intro a
        apply Subtype.ext
        rfl
      right_inv := by
        intro x
        apply Subtype.ext
        rfl
      map_add' := by
        intro a b
        apply Subtype.ext
        apply Subtype.ext
        rfl }
 

def cyclicNormClassHom
    (A : Rep ℤ G)
    (K L : ClosedSubgroup G) (hLK : L.toSubgroup ≤ K.toSubgroup)
    (hnormal : (extensionSubgroup K L hLK).Normal)
    (hfinite : Finite (K.toSubgroup ⧸ extensionSubgroup K L hLK))
    (g : K.toSubgroup ⧸ extensionSubgroup K L hLK)
    (hg : ∀ x, x ∈ Subgroup.zpowers g) :
    letI := hnormal
    letI := hfinite
    letI := Fintype.ofFinite
      (K.toSubgroup ⧸ extensionSubgroup K L hLK)
    letI : IsCyclic
        (K.toSubgroup ⧸ extensionSubgroup K L hLK) :=
      isCyclic_of_generator g hg
    letI : CommGroup
        (K.toSubgroup ⧸ extensionSubgroup K L hLK) :=
      IsCyclic.commGroup
    let M := extensionFixedRepresentation A K L hLK hnormal
    let T := Rep.FiniteCyclicGroup.normHomCompSub M g
    ambientFixedAddSubgroup A K →+
      T.moduleCatLeftHomologyData.H := by
  dsimp only
  letI := hnormal
  letI := hfinite
  letI := Fintype.ofFinite
    (K.toSubgroup ⧸ extensionSubgroup K L hLK)
  letI : IsCyclic (K.toSubgroup ⧸ extensionSubgroup K L hLK) :=
    isCyclic_of_generator g hg
  letI : CommGroup (K.toSubgroup ⧸ extensionSubgroup K L hLK) :=
    IsCyclic.commGroup
  let M := extensionFixedRepresentation A K L hLK hnormal
  let T := Rep.FiniteCyclicGroup.normHomCompSub M g
  let e := cyclicFixedCycleEquiv A K L hLK hnormal hfinite g hg
  exact
    { toFun := fun a => T.moduleCatLeftHomologyData.π (e a)
      map_zero' := by simp
      map_add' := by
        intro a b
        simp }
 



@[simp]
theorem cyclicNormClassHom_apply
    (A : Rep ℤ G)
    (K L : ClosedSubgroup G) (hLK : L.toSubgroup ≤ K.toSubgroup)
    (hnormal : (extensionSubgroup K L hLK).Normal)
    (hfinite : Finite (K.toSubgroup ⧸ extensionSubgroup K L hLK))
    (g : K.toSubgroup ⧸ extensionSubgroup K L hLK)
    (hg : ∀ x, x ∈ Subgroup.zpowers g)
    (a : ambientFixedAddSubgroup A K) :
    letI := hnormal
    letI := hfinite
    letI := Fintype.ofFinite
      (K.toSubgroup ⧸ extensionSubgroup K L hLK)
    letI : IsCyclic
        (K.toSubgroup ⧸ extensionSubgroup K L hLK) :=
      isCyclic_of_generator g hg
    letI : CommGroup
        (K.toSubgroup ⧸ extensionSubgroup K L hLK) :=
      IsCyclic.commGroup
    let M := extensionFixedRepresentation A K L hLK hnormal
    let T := Rep.FiniteCyclicGroup.normHomCompSub M g
    cyclicNormClassHom A K L hLK hnormal hfinite g hg a =
      T.moduleCatLeftHomologyData.π
        (cyclicFixedCycleEquiv A K L hLK hnormal hfinite g hg a) := by
  rfl
 

theorem cyclicFixedCycleEquiv_relativeNorm
    (A : Rep ℤ G)
    (K L : ClosedSubgroup G) (hLK : L.toSubgroup ≤ K.toSubgroup)
    (hnormal : (extensionSubgroup K L hLK).Normal)
    (hfinite : Finite (K.toSubgroup ⧸ extensionSubgroup K L hLK))
    (g : K.toSubgroup ⧸ extensionSubgroup K L hLK)
    (hg : ∀ x, x ∈ Subgroup.zpowers g)
    (a : ambientFixedAddSubgroup A L) :
    letI := hnormal
    letI := hfinite
    letI := Fintype.ofFinite
      (K.toSubgroup ⧸ extensionSubgroup K L hLK)
    letI : IsCyclic
        (K.toSubgroup ⧸ extensionSubgroup K L hLK) :=
      isCyclic_of_generator g hg
    letI : CommGroup
        (K.toSubgroup ⧸ extensionSubgroup K L hLK) :=
      IsCyclic.commGroup
    let M := extensionFixedRepresentation A K L hLK hnormal
    let T := Rep.FiniteCyclicGroup.normHomCompSub M g
    cyclicFixedCycleEquiv A K L hLK hnormal hfinite g hg
        (relativeNorm A K L hLK a) =
      T.moduleCatToCycles
        ((extensionFixedRepresentationEquiv A K L hLK hnormal).symm a) := by
  dsimp only
  let := hnormal
  let := hfinite
  let := Fintype.ofFinite
    (K.toSubgroup ⧸ extensionSubgroup K L hLK)
  let : IsCyclic (K.toSubgroup ⧸ extensionSubgroup K L hLK) :=
    isCyclic_of_generator g hg
  let : CommGroup (K.toSubgroup ⧸ extensionSubgroup K L hLK) :=
    IsCyclic.commGroup
  let M := extensionFixedRepresentation A K L hLK hnormal
  let T := Rep.FiniteCyclicGroup.normHomCompSub M g
  apply Subtype.ext
  apply Subtype.ext
  exact (extensionFixedRepresentation_norm_coe
    A K L hLK hnormal
      ((extensionFixedRepresentationEquiv A K L hLK hnormal).symm a)).symm
 

theorem cyclicNormClassHom_ker
    (A : Rep ℤ G)
    (K L : ClosedSubgroup G) (hLK : L.toSubgroup ≤ K.toSubgroup)
    (hnormal : (extensionSubgroup K L hLK).Normal)
    (hfinite : Finite (K.toSubgroup ⧸ extensionSubgroup K L hLK))
    (g : K.toSubgroup ⧸ extensionSubgroup K L hLK)
    (hg : ∀ x, x ∈ Subgroup.zpowers g) :
    letI := hnormal
    letI := hfinite
    letI := Fintype.ofFinite
      (K.toSubgroup ⧸ extensionSubgroup K L hLK)
    letI : IsCyclic
        (K.toSubgroup ⧸ extensionSubgroup K L hLK) :=
      isCyclic_of_generator g hg
    letI : CommGroup
        (K.toSubgroup ⧸ extensionSubgroup K L hLK) :=
      IsCyclic.commGroup
    (cyclicNormClassHom A K L hLK hnormal hfinite g hg).ker =
      finiteNormSubgroup A K L hLK := by
  let := hnormal
  let := hfinite
  let := Fintype.ofFinite
    (K.toSubgroup ⧸ extensionSubgroup K L hLK)
  let : IsCyclic (K.toSubgroup ⧸ extensionSubgroup K L hLK) :=
    isCyclic_of_generator g hg
  let : CommGroup (K.toSubgroup ⧸ extensionSubgroup K L hLK) :=
    IsCyclic.commGroup
  let M := extensionFixedRepresentation A K L hLK hnormal
  let T := Rep.FiniteCyclicGroup.normHomCompSub M g
  let : Module ℤ T.X₁ := T.X₁.isModule
  let : Module ℤ (LinearMap.ker T.g.hom) :=
    (LinearMap.ker T.g.hom).module
  let e := cyclicFixedCycleEquiv A K L hLK hnormal hfinite g hg
  ext a
  constructor
  · intro ha
    change cyclicNormClassHom A K L hLK hnormal hfinite g hg a = 0 at ha
    rw [cyclicNormClassHom_apply] at ha
    let ea : T.moduleCatLeftHomologyData.K := e a
    have ha' :
        Submodule.mkQ (LinearMap.range T.moduleCatToCycles) ea = 0 := by
      exact ha
    have harange : ea ∈ LinearMap.range T.moduleCatToCycles :=
      (Submodule.Quotient.mk_eq_zero _).1 ha'
    obtain ⟨y, hy⟩ := harange
    change a ∈ (relativeNorm A K L hLK).range
    let b : ambientFixedAddSubgroup A L :=
      extensionFixedRepresentationEquiv A K L hLK hnormal y
    refine ⟨b, ?_⟩
    apply Subtype.ext
    calc
      (relativeNorm A K L hLK b).1 = (M.norm.hom y).1 :=
        (extensionFixedRepresentation_norm_coe
          A K L hLK hnormal y).symm
      _ = ea.1.1 :=
        congrArg Subtype.val (congrArg Subtype.val hy)
      _ = a.1 := rfl
  · intro ha
    change a ∈ (relativeNorm A K L hLK).range at ha
    obtain ⟨b, rfl⟩ := ha
    change cyclicNormClassHom A K L hLK hnormal hfinite g hg
      (relativeNorm A K L hLK b) = 0
    rw [cyclicNormClassHom_apply]
    let eb : T.moduleCatLeftHomologyData.K :=
      e (relativeNorm A K L hLK b)
    change Submodule.mkQ (LinearMap.range T.moduleCatToCycles)
      eb = 0
    apply (Submodule.Quotient.mk_eq_zero _).2
    refine ⟨(extensionFixedRepresentationEquiv
      A K L hLK hnormal).symm b, ?_⟩
    exact (cyclicFixedCycleEquiv_relativeNorm
      A K L hLK hnormal hfinite g hg b).symm
 

theorem cyclicNormClassHom_surjective
    (A : Rep ℤ G)
    (K L : ClosedSubgroup G) (hLK : L.toSubgroup ≤ K.toSubgroup)
    (hnormal : (extensionSubgroup K L hLK).Normal)
    (hfinite : Finite (K.toSubgroup ⧸ extensionSubgroup K L hLK))
    (g : K.toSubgroup ⧸ extensionSubgroup K L hLK)
    (hg : ∀ x, x ∈ Subgroup.zpowers g) :
    letI := hnormal
    letI := hfinite
    letI := Fintype.ofFinite
      (K.toSubgroup ⧸ extensionSubgroup K L hLK)
    letI : IsCyclic
        (K.toSubgroup ⧸ extensionSubgroup K L hLK) :=
      isCyclic_of_generator g hg
    letI : CommGroup
        (K.toSubgroup ⧸ extensionSubgroup K L hLK) :=
      IsCyclic.commGroup
    Function.Surjective
      (cyclicNormClassHom A K L hLK hnormal hfinite g hg) := by
  let := hnormal
  let := hfinite
  let := Fintype.ofFinite
    (K.toSubgroup ⧸ extensionSubgroup K L hLK)
  let : IsCyclic (K.toSubgroup ⧸ extensionSubgroup K L hLK) :=
    isCyclic_of_generator g hg
  let : CommGroup (K.toSubgroup ⧸ extensionSubgroup K L hLK) :=
    IsCyclic.commGroup
  let M := extensionFixedRepresentation A K L hLK hnormal
  let T := Rep.FiniteCyclicGroup.normHomCompSub M g
  let e := cyclicFixedCycleEquiv A K L hLK hnormal hfinite g hg
  have hπ : Function.Surjective T.moduleCatLeftHomologyData.π :=
    (ModuleCat.epi_iff_surjective
      T.moduleCatLeftHomologyData.π).1 inferInstance
  intro z
  obtain ⟨x, hx⟩ := hπ z
  refine ⟨e.symm x, ?_⟩
  rw [cyclicNormClassHom_apply, e.apply_symm_apply]
  exact hx
 

def cyclicFiniteNormQuotientEquivConcrete
    (A : Rep ℤ G)
    (K L : ClosedSubgroup G) (hLK : L.toSubgroup ≤ K.toSubgroup)
    (hnormal : (extensionSubgroup K L hLK).Normal)
    (hfinite : Finite (K.toSubgroup ⧸ extensionSubgroup K L hLK))
    (g : K.toSubgroup ⧸ extensionSubgroup K L hLK)
    (hg : ∀ x, x ∈ Subgroup.zpowers g) :
    letI := hnormal
    letI := hfinite
    letI := Fintype.ofFinite
      (K.toSubgroup ⧸ extensionSubgroup K L hLK)
    letI : IsCyclic
        (K.toSubgroup ⧸ extensionSubgroup K L hLK) :=
      isCyclic_of_generator g hg
    letI : CommGroup
        (K.toSubgroup ⧸ extensionSubgroup K L hLK) :=
      IsCyclic.commGroup
    let M := extensionFixedRepresentation A K L hLK hnormal
    let T := Rep.FiniteCyclicGroup.normHomCompSub M g
    FiniteNormQuotient A K L hLK ≃+
      T.moduleCatLeftHomologyData.H := by
  dsimp only
  letI := hnormal
  letI := hfinite
  letI := Fintype.ofFinite
    (K.toSubgroup ⧸ extensionSubgroup K L hLK)
  letI : IsCyclic (K.toSubgroup ⧸ extensionSubgroup K L hLK) :=
    isCyclic_of_generator g hg
  letI : CommGroup (K.toSubgroup ⧸ extensionSubgroup K L hLK) :=
    IsCyclic.commGroup
  let f := cyclicNormClassHom A K L hLK hnormal hfinite g hg
  exact
    (finiteNormQuotientConcreteEquiv A K L hLK).trans
      ((QuotientAddGroup.quotientAddEquivOfEq
        (cyclicNormClassHom_ker A K L hLK hnormal hfinite g hg).symm).trans
        (QuotientAddGroup.quotientKerEquivOfSurjective f
          (cyclicNormClassHom_surjective
            A K L hLK hnormal hfinite g hg)))
 

def cyclicConcreteEquivTateHZero
    (A : Rep ℤ G)
    (K L : ClosedSubgroup G) (hLK : L.toSubgroup ≤ K.toSubgroup)
    (hnormal : (extensionSubgroup K L hLK).Normal)
    (hfinite : Finite (K.toSubgroup ⧸ extensionSubgroup K L hLK))
    (g : K.toSubgroup ⧸ extensionSubgroup K L hLK)
    (hg : ∀ x, x ∈ Subgroup.zpowers g) :
    letI := hnormal
    letI := hfinite
    letI := Fintype.ofFinite
      (K.toSubgroup ⧸ extensionSubgroup K L hLK)
    letI : IsCyclic
        (K.toSubgroup ⧸ extensionSubgroup K L hLK) :=
      isCyclic_of_generator g hg
    letI : CommGroup
        (K.toSubgroup ⧸ extensionSubgroup K L hLK) :=
      IsCyclic.commGroup
    let M := extensionFixedRepresentation A K L hLK hnormal
    let T := Rep.FiniteCyclicGroup.normHomCompSub M g
    T.moduleCatLeftHomologyData.H ≃+ tateCohomology M 0 := by
  dsimp only
  letI := hnormal
  letI := hfinite
  letI := Fintype.ofFinite
    (K.toSubgroup ⧸ extensionSubgroup K L hLK)
  letI : IsCyclic (K.toSubgroup ⧸ extensionSubgroup K L hLK) :=
    isCyclic_of_generator g hg
  letI : CommGroup (K.toSubgroup ⧸ extensionSubgroup K L hLK) :=
    IsCyclic.commGroup
  let M := extensionFixedRepresentation A K L hLK hnormal
  let T := Rep.FiniteCyclicGroup.normHomCompSub M g
  exact
    (T.moduleCatHomologyIso.symm ≪≫
      (TateCohomology.isoFiniteCyclicZero M g hg).symm).toLinearEquiv.toAddEquiv
 

def cyclicFiniteNormQuotientEquivTateHZero
    (A : Rep ℤ G)
    (K L : ClosedSubgroup G) (hLK : L.toSubgroup ≤ K.toSubgroup)
    (hnormal : (extensionSubgroup K L hLK).Normal)
    (hfinite : Finite (K.toSubgroup ⧸ extensionSubgroup K L hLK))
    (g : K.toSubgroup ⧸ extensionSubgroup K L hLK)
    (hg : ∀ x, x ∈ Subgroup.zpowers g) :
    letI := hnormal
    letI := hfinite
    letI := Fintype.ofFinite
      (K.toSubgroup ⧸ extensionSubgroup K L hLK)
    let M := extensionFixedRepresentation A K L hLK hnormal
    FiniteNormQuotient A K L hLK ≃+ tateCohomology M 0 := by
  dsimp only
  letI := hnormal
  letI := hfinite
  letI := Fintype.ofFinite
    (K.toSubgroup ⧸ extensionSubgroup K L hLK)
  exact
    (cyclicFiniteNormQuotientEquivConcrete
      A K L hLK hnormal hfinite g hg).trans
      (cyclicConcreteEquivTateHZero
        A K L hLK hnormal hfinite g hg)
 

theorem finiteNormQuotientFiniteOfClassFieldAxiom
    (A : Rep ℤ G) (hcf : SatisfiesClassFieldAxiom A)
    (E : DegreeData.FiniteAbstractExtension G)
    [hKfinite : Finite ((baseField G).toSubgroup ⧸
      extensionSubgroup (baseField G) E.base (le_baseField E.base))]
    (hnormal : (extensionSubgroup E.base E.field E.below).Normal)
    (g : E.base.toSubgroup ⧸
      extensionSubgroup E.base E.field E.below)
    (hg : ∀ x, x ∈ Subgroup.zpowers g) :
    Finite (FiniteNormQuotient A E.base E.field E.below) := by
  let := hnormal
  let := E.finiteQuotient
  let := Fintype.ofFinite
    (E.base.toSubgroup ⧸ extensionSubgroup E.base E.field E.below)
  let M := extensionFixedRepresentation A E.base E.field E.below hnormal
  let Kcf : FiniteAbstractField G := ⟨E.base, hKfinite⟩
  let Ecf : FiniteCyclicSubextension Kcf :=
    { field := E.field
      below := E.below
      normal := hnormal
      finite := E.finiteQuotient
      generator := g
      generates := hg }
  let : Finite (tateCohomology (Ecf.fixedRepresentation A) 0) :=
    (hcf Kcf Ecf).finiteTateHZero
  exact Finite.of_equiv (tateCohomology (Ecf.fixedRepresentation A) 0) (by
    simpa [Kcf, Ecf, FiniteCyclicSubextension.fixedRepresentation] using
        (cyclicFiniteNormQuotientEquivTateHZero
          A E.base E.field E.below hnormal E.finiteQuotient g hg).symm.toEquiv)
 

theorem finiteNormQuotient_card_of_classFieldAxiom
    (A : Rep ℤ G) (hcf : SatisfiesClassFieldAxiom A)
    (E : DegreeData.FiniteAbstractExtension G)
    [hKfinite : Finite ((baseField G).toSubgroup ⧸
      extensionSubgroup (baseField G) E.base (le_baseField E.base))]
    (hnormal : (extensionSubgroup E.base E.field E.below).Normal)
    (g : E.base.toSubgroup ⧸
      extensionSubgroup E.base E.field E.below)
    (hg : ∀ x, x ∈ Subgroup.zpowers g) :
    Nat.card (FiniteNormQuotient A E.base E.field E.below) =
      (E.degree : ℕ) := by
  let := hnormal
  let := E.finiteQuotient
  let := Fintype.ofFinite
    (E.base.toSubgroup ⧸ extensionSubgroup E.base E.field E.below)
  let M := extensionFixedRepresentation A E.base E.field E.below hnormal
  let Kcf : FiniteAbstractField G := ⟨E.base, hKfinite⟩
  let Ecf : FiniteCyclicSubextension Kcf :=
    { field := E.field
      below := E.below
      normal := hnormal
      finite := E.finiteQuotient
      generator := g
      generates := hg }
  let : Finite (tateCohomology (Ecf.fixedRepresentation A) 0) :=
    (hcf Kcf Ecf).finiteTateHZero
  let : Finite (tateCohomology M 0) := by
    simpa [M, Kcf, Ecf,
      FiniteCyclicSubextension.fixedRepresentation] using
        (inferInstance :
          Finite (tateCohomology (Ecf.fixedRepresentation A) 0))
  let : Finite (FiniteNormQuotient A E.base E.field E.below) :=
    finiteNormQuotientFiniteOfClassFieldAxiom A hcf E hnormal g hg
  calc
    Nat.card (FiniteNormQuotient A E.base E.field E.below) =
        Nat.card (tateCohomology M 0) :=
      Nat.card_congr
        (cyclicFiniteNormQuotientEquivTateHZero
          A E.base E.field E.below hnormal E.finiteQuotient g hg).toEquiv
    _ = (E.degree : ℕ) :=
      by
        simpa [Kcf, Ecf,
          FiniteCyclicSubextension.fixedRepresentation,
          FiniteCyclicSubextension.toFiniteAbstractExtension] using
            hcf.tateHZero_card Kcf Ecf
 
theorem additiveExtensionQuotient_card
    (E : DegreeData.FiniteAbstractExtension G) :
    Nat.card
        (Additive
          (E.base.toSubgroup ⧸
            extensionSubgroup E.base E.field E.below)) =
      (E.degree : ℕ) := by
  calc
    Nat.card
        (Additive
          (E.base.toSubgroup ⧸
            extensionSubgroup E.base E.field E.below)) =
        Nat.card
          (E.base.toSubgroup ⧸
            extensionSubgroup E.base E.field E.below) :=
      (Nat.card_congr
        (Additive.ofMul :
          (E.base.toSubgroup ⧸
              extensionSubgroup E.base E.field E.below) ≃
            Additive
              (E.base.toSubgroup ⧸
                extensionSubgroup E.base E.field E.below))).symm
    _ = (extensionSubgroup E.base E.field E.below).index :=
      (Subgroup.index_eq_card
        (extensionSubgroup E.base E.field E.below)).symm
    _ = (E.degree : ℕ) := E.extensionSubgroup_index_eq_degree
 

theorem cyclicReciprocity_card_equality
    (A : Rep ℤ G) (hcf : SatisfiesClassFieldAxiom A)
    (E : DegreeData.FiniteAbstractExtension G)
    [Finite ((baseField G).toSubgroup ⧸
      extensionSubgroup (baseField G) E.base (le_baseField E.base))]
    (hnormal : (extensionSubgroup E.base E.field E.below).Normal)
    (g : E.base.toSubgroup ⧸
      extensionSubgroup E.base E.field E.below)
    (hg : ∀ x, x ∈ Subgroup.zpowers g) :
    Nat.card
        (Additive
          (E.base.toSubgroup ⧸
            extensionSubgroup E.base E.field E.below)) =
      Nat.card (FiniteNormQuotient A E.base E.field E.below) := by
  rw [additiveExtensionQuotient_card E,
    finiteNormQuotient_card_of_classFieldAxiom
      A hcf E hnormal g hg]
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
 
structure FiniteGaloisSubextension (K : ClosedSubgroup G) where
   
  field : ClosedSubgroup G
   
  below : field.toSubgroup ≤ K.toSubgroup
   
  normal : (extensionSubgroup K field below).Normal
   
  finite : Finite (K.toSubgroup ⧸ extensionSubgroup K field below)
namespace FiniteGaloisSubextension
variable {K : ClosedSubgroup G}
 

def extensionQuotient (L : FiniteGaloisSubextension K) : Type u :=
  K.toSubgroup ⧸ extensionSubgroup K L.field L.below
 
instance extensionSubgroup_normalInstance (L : FiniteGaloisSubextension K) :
    (extensionSubgroup K L.field L.below).Normal :=
  L.normal
 

instance extensionQuotient_groupInstance (L : FiniteGaloisSubextension K) :
    Group L.extensionQuotient := by
  change Group
    (K.toSubgroup ⧸ extensionSubgroup K L.field L.below)
  infer_instance
 
instance extensionQuotient_finiteInstance (L : FiniteGaloisSubextension K) :
    Finite L.extensionQuotient :=
  L.finite
 

def extensionQuotientMulEquiv (L : FiniteGaloisSubextension K) :
    L.extensionQuotient ≃*
      (K.toSubgroup ⧸ extensionSubgroup K L.field L.below) :=
  MulEquiv.refl _
 
def extensionQuotientMk (L : FiniteGaloisSubextension K) :
    K.toSubgroup →* L.extensionQuotient :=
  QuotientGroup.mk' (extensionSubgroup K L.field L.below)
 
@[simp]
theorem extensionQuotientMk_apply (L : FiniteGaloisSubextension K)
    (k : K.toSubgroup) :
    L.extensionQuotientMulEquiv (L.extensionQuotientMk k) =
      (QuotientGroup.mk k :
        K.toSubgroup ⧸ extensionSubgroup K L.field L.below) :=
  rfl
 
@[simp]
theorem extensionQuotientMk_eq_one_iff (L : FiniteGaloisSubextension K)
    (k : K.toSubgroup) :
    L.extensionQuotientMk k = 1 ↔
      k ∈ extensionSubgroup K L.field L.below := by
  constructor
  · intro h
    apply (QuotientGroup.eq_one_iff k).1
    calc
      (QuotientGroup.mk k :
          K.toSubgroup ⧸ extensionSubgroup K L.field L.below) =
          L.extensionQuotientMulEquiv (L.extensionQuotientMk k) :=
        (L.extensionQuotientMk_apply k).symm
      _ = L.extensionQuotientMulEquiv 1 := congrArg L.extensionQuotientMulEquiv h
      _ = 1 := L.extensionQuotientMulEquiv.map_one
  · intro hk
    apply L.extensionQuotientMulEquiv.injective
    rw [L.extensionQuotientMk_apply, L.extensionQuotientMulEquiv.map_one]
    exact (QuotientGroup.eq_one_iff k).2 hk
 
theorem extensionQuotientMk_surjective (L : FiniteGaloisSubextension K) :
    Function.Surjective L.extensionQuotientMk := by
  intro q
  obtain ⟨k, hk⟩ := QuotientGroup.mk'_surjective
    (extensionSubgroup K L.field L.below) (L.extensionQuotientMulEquiv q)
  refine ⟨k, L.extensionQuotientMulEquiv.injective ?_⟩
  rw [L.extensionQuotientMk_apply]
  exact hk
 
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
 
theorem finite_extension_over_intermediate
    {P M K : ClosedSubgroup G}
    (hPK : P.toSubgroup ≤ K.toSubgroup)
    (hMK : M.toSubgroup ≤ K.toSubgroup)
    (hPM : P.toSubgroup ≤ M.toSubgroup)
    [hPKfinite : Finite
      (K.toSubgroup ⧸ extensionSubgroup K P hPK)] :
    Finite (M.toSubgroup ⧸ extensionSubgroup M P hPM) := by
  have hPK0 : P.toSubgroup.relIndex K.toSubgroup ≠ 0 := by
    rw [Subgroup.relIndex]
    exact @Subgroup.index_ne_zero_of_finite K.toSubgroup _
      (extensionSubgroup K P hPK) hPKfinite
  have hPM0 : P.toSubgroup.relIndex M.toSubgroup ≠ 0 := by
    intro hzero
    have hmul := Subgroup.relIndex_mul_relIndex
      P.toSubgroup M.toSubgroup K.toSubgroup hPM hMK
    rw [hzero, zero_mul] at hmul
    exact hPK0 hmul.symm
  apply Nat.finite_of_card_ne_zero
  change (extensionSubgroup M P hPM).index ≠ 0
  simpa [Subgroup.relIndex] using hPM0
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

/- ClassFieldTheory.AbstractClassFieldTheory.Reciprocity.IntermediateExtension -/
section
namespace ClassFormation
open KummerTheory
open CyclicCohomology
noncomputable section
variable {G : Type*} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
namespace FiniteGaloisSubextension
variable {K : ClosedSubgroup G}
 
def intermediateSubgroup (L : FiniteGaloisSubextension K)
    (S : Subgroup L.extensionQuotient) : Subgroup K.toSubgroup := by
  exact S.comap L.extensionQuotientMk
omit [IsTopologicalGroup G] in
 

@[simp]
theorem mem_intermediateSubgroup_iff
    (L : FiniteGaloisSubextension K) (S : Subgroup L.extensionQuotient)
    (k : K.toSubgroup) :
    k ∈ L.intermediateSubgroup S ↔ L.extensionQuotientMk k ∈ S :=
  Iff.rfl
omit [IsTopologicalGroup G] in
 
theorem extensionSubgroup_le_intermediateSubgroup
    (L : FiniteGaloisSubextension K) (S : Subgroup L.extensionQuotient) :
    extensionSubgroup K L.field L.below ≤ L.intermediateSubgroup S := by
  intro x hx
  apply (L.mem_intermediateSubgroup_iff S x).2
  have hmk : L.extensionQuotientMk x = 1 :=
    (L.extensionQuotientMk_eq_one_iff x).2 hx
  rw [hmk]
  exact S.one_mem
 


def intermediateCoset (L : FiniteGaloisSubextension K)
    (q : L.extensionQuotient) : Set K.toSubgroup :=
  {x | L.extensionQuotientMk x = q}
 

private def representativeIntermediateCoset (L : FiniteGaloisSubextension K)
    (q : L.extensionQuotient) : Set K.toSubgroup :=
  (fun x : K.toSubgroup =>
      x * Quotient.out (L.extensionQuotientMulEquiv q)) ''
    (extensionSubgroup K L.field L.below : Set K.toSubgroup)
omit [IsTopologicalGroup G] in
 
theorem mem_intermediateCoset_iff (L : FiniteGaloisSubextension K)
    (q : L.extensionQuotient) (x : K.toSubgroup) :
    x ∈ L.intermediateCoset q ↔
      L.extensionQuotientMk x = q :=
  Iff.rfl
omit [IsTopologicalGroup G] in
private theorem mem_representativeIntermediateCoset_iff
    (L : FiniteGaloisSubextension K)
    (q : L.extensionQuotient) (x : K.toSubgroup) :
    x ∈ representativeIntermediateCoset L q ↔
      L.extensionQuotientMk x = q := by
  let : (extensionSubgroup K L.field L.below).Normal := L.normal
  constructor
  · rintro ⟨h, hh, rfl⟩
    apply L.extensionQuotientMulEquiv.injective
    rw [L.extensionQuotientMk_apply]
    rw [← Quotient.out_eq' (L.extensionQuotientMulEquiv q)]
    apply QuotientGroup.eq_iff_div_mem.mpr
    simpa [div_eq_mul_inv, mul_assoc] using hh
  · intro hx
    have hxout :
        (QuotientGroup.mk' (extensionSubgroup K L.field L.below)) x =
          (QuotientGroup.mk'
            (extensionSubgroup K L.field L.below))
              (Quotient.out (L.extensionQuotientMulEquiv q)) := by
      calc
        (QuotientGroup.mk'
            (extensionSubgroup K L.field L.below)) x =
              L.extensionQuotientMulEquiv (L.extensionQuotientMk x) :=
          (L.extensionQuotientMk_apply x).symm
        _ = L.extensionQuotientMulEquiv q :=
          congrArg L.extensionQuotientMulEquiv hx
        _ = (QuotientGroup.mk'
            (extensionSubgroup K L.field L.below))
              (Quotient.out (L.extensionQuotientMulEquiv q)) :=
          (Quotient.out_eq' (L.extensionQuotientMulEquiv q)).symm
    have hdiv : x / Quotient.out (L.extensionQuotientMulEquiv q) ∈
        extensionSubgroup K L.field L.below :=
      QuotientGroup.eq_iff_div_mem.mp hxout
    refine ⟨x / Quotient.out (L.extensionQuotientMulEquiv q), hdiv, ?_⟩
    simp [div_eq_mul_inv, mul_assoc]
omit [IsTopologicalGroup G] in
private theorem intermediateCoset_eq_representativeIntermediateCoset
    (L : FiniteGaloisSubextension K) (q : L.extensionQuotient) :
    L.intermediateCoset q = representativeIntermediateCoset L q := by
  ext x
  exact (mem_representativeIntermediateCoset_iff L q x).symm
omit [IsTopologicalGroup G] in
 

theorem intermediateSubgroup_eq_iUnion_cosets
    (L : FiniteGaloisSubextension K) (S : Subgroup L.extensionQuotient) :
    (L.intermediateSubgroup S : Set K.toSubgroup) =
      ⋃ q ∈ (S : Set L.extensionQuotient), L.intermediateCoset q := by
  ext x
  constructor
  · intro hx
    have hxS := (L.mem_intermediateSubgroup_iff S x).1 hx
    refine Set.mem_iUnion₂.mpr ⟨
      L.extensionQuotientMk x, hxS, ?_⟩
    exact (mem_intermediateCoset_iff L _ x).2 rfl
  · intro hx
    rcases Set.mem_iUnion₂.mp hx with ⟨q, hqS, hxq⟩
    apply (L.mem_intermediateSubgroup_iff S x).2
    rw [(mem_intermediateCoset_iff L q x).1 hxq]
    exact hqS
private theorem representativeIntermediateCoset_isClosed
    (L : FiniteGaloisSubextension K) (q : L.extensionQuotient) :
    IsClosed (representativeIntermediateCoset L q) := by
  exact isClosedMap_mul_right
    (Quotient.out (L.extensionQuotientMulEquiv q)) _
    (extensionSubgroup_isClosed K L.field L.below)
 

theorem intermediateCoset_isClosed (L : FiniteGaloisSubextension K)
    (q : L.extensionQuotient) : IsClosed (L.intermediateCoset q) := by
  rw [intermediateCoset_eq_representativeIntermediateCoset]
  exact representativeIntermediateCoset_isClosed L q
 

theorem intermediateSubgroup_isClosed (L : FiniteGaloisSubextension K)
    (S : Subgroup L.extensionQuotient) :
    IsClosed (L.intermediateSubgroup S : Set K.toSubgroup) := by
  let : Finite L.extensionQuotient := L.finite
  rw [intermediateSubgroup_eq_iUnion_cosets]
  have hfinite : (S : Set L.extensionQuotient).Finite := Set.toFinite _
  exact hfinite.isClosed_biUnion fun q _ => intermediateCoset_isClosed L q
 
def intermediateField (L : FiniteGaloisSubextension K)
    (S : Subgroup L.extensionQuotient) : ClosedSubgroup G where
  toSubgroup := (L.intermediateSubgroup S).map K.toSubgroup.subtype
  isClosed' := by
    change IsClosed
      ((fun x : K.toSubgroup => (x : G)) ''
        (L.intermediateSubgroup S : Set K.toSubgroup))
    exact K.isClosed'.isClosedMap_subtype_val _
      (intermediateSubgroup_isClosed L S)
 
theorem intermediateField_le_base (L : FiniteGaloisSubextension K)
    (S : Subgroup L.extensionQuotient) :
    (L.intermediateField S).toSubgroup ≤ K.toSubgroup := by
  rintro _ ⟨m, hm, rfl⟩
  exact m.property
 

theorem extensionSubgroup_intermediateField_eq
    (L : FiniteGaloisSubextension K) (S : Subgroup L.extensionQuotient) :
    extensionSubgroup K (L.intermediateField S)
        (L.intermediateField_le_base S) =
      L.intermediateSubgroup S := by
  ext x
  simp [extensionSubgroup, intermediateField]
  rw [Subgroup.mem_subgroupOf]
  constructor
  · rintro ⟨y, hy, hxy⟩
    have hyx : y = x := Subtype.ext hxy
    simpa [hyx] using hy
  · intro hx
    exact ⟨x, hx, rfl⟩
 
theorem field_le_intermediateField (L : FiniteGaloisSubextension K)
    (S : Subgroup L.extensionQuotient) :
    L.field.toSubgroup ≤ (L.intermediateField S).toSubgroup := by
  intro x hx
  let xK : K.toSubgroup := ⟨x, L.below hx⟩
  have hxH : xK ∈ extensionSubgroup K L.field L.below :=
    (mem_extensionSubgroup_iff K L.field L.below xK).2 hx
  have hxP : xK ∈ L.intermediateSubgroup S :=
    L.extensionSubgroup_le_intermediateSubgroup S hxH
  exact ⟨xK, hxP, rfl⟩
 

theorem extensionSubgroup_over_intermediate_eq_comap
    (L : FiniteGaloisSubextension K) (S : Subgroup L.extensionQuotient) :
    extensionSubgroup (L.intermediateField S) L.field
        (L.field_le_intermediateField S) =
      (extensionSubgroup K L.field L.below).comap
        (Subgroup.inclusion (L.intermediateField_le_base S)) := by
  ext x
  rw [mem_extensionSubgroup_iff, Subgroup.mem_comap,
    mem_extensionSubgroup_iff]
  rfl
 

theorem extensionSubgroup_over_intermediate_normal
    (L : FiniteGaloisSubextension K) (S : Subgroup L.extensionQuotient) :
    (extensionSubgroup (L.intermediateField S) L.field
      (L.field_le_intermediateField S)).Normal := by
  rw [extensionSubgroup_over_intermediate_eq_comap]
  infer_instance
 
theorem extension_over_intermediate_finite
    (L : FiniteGaloisSubextension K) (S : Subgroup L.extensionQuotient) :
    Finite ((L.intermediateField S).toSubgroup ⧸
      extensionSubgroup (L.intermediateField S) L.field
        (L.field_le_intermediateField S)) := by
  let : Finite (K.toSubgroup ⧸
      extensionSubgroup K L.field L.below) := L.finite
  exact FiniteGaloisSubextension.finite_extension_over_intermediate
    L.below (L.intermediateField_le_base S)
      (L.field_le_intermediateField S)
 

theorem intermediateField_finite
    (L : FiniteGaloisSubextension K) (S : Subgroup L.extensionQuotient) :
    Finite (K.toSubgroup ⧸ extensionSubgroup K (L.intermediateField S)
      (L.intermediateField_le_base S)) := by
  rw [extensionSubgroup_intermediateField_eq]
  let : (extensionSubgroup K L.field L.below).FiniteIndex :=
    @Subgroup.finiteIndex_of_finite_quotient K.toSubgroup _
      (extensionSubgroup K L.field L.below) L.finite
  let : (L.intermediateSubgroup S).FiniteIndex :=
    Subgroup.finiteIndex_of_le (L.extensionSubgroup_le_intermediateSubgroup S)
  exact Subgroup.finite_quotient_of_finiteIndex
omit [IsTopologicalGroup G] in
 
theorem intermediateSubgroup_normal
    (L : FiniteGaloisSubextension K) (S : Subgroup L.extensionQuotient)
    (hS : S.Normal) : (L.intermediateSubgroup S).Normal := by
  let : S.Normal := hS
  exact hS.comap L.extensionQuotientMk
 
theorem intermediateField_normal
    (L : FiniteGaloisSubextension K) (S : Subgroup L.extensionQuotient)
    (hS : S.Normal) :
    (extensionSubgroup K (L.intermediateField S)
      (L.intermediateField_le_base S)).Normal := by
  rw [extensionSubgroup_intermediateField_eq]
  exact L.intermediateSubgroup_normal S hS
 
def lowerFiniteGalois (L : FiniteGaloisSubextension K)
    (S : Subgroup L.extensionQuotient) :
    FiniteGaloisSubextension (L.intermediateField S) where
  field := L.field
  below := L.field_le_intermediateField S
  normal := L.extensionSubgroup_over_intermediate_normal S
  finite := L.extension_over_intermediate_finite S
 
def intermediateFiniteGalois (L : FiniteGaloisSubextension K)
    (S : Subgroup L.extensionQuotient) (hS : S.Normal) :
    FiniteGaloisSubextension K where
  field := L.intermediateField S
  below := L.intermediateField_le_base S
  normal := L.intermediateField_normal S hS
  finite := L.intermediateField_finite S
 


def lowerRestrictionHom (L : FiniteGaloisSubextension K)
    (S : Subgroup L.extensionQuotient) :
    (L.intermediateField S).toSubgroup →* S :=
  (L.extensionQuotientMk.comp
      (Subgroup.inclusion (L.intermediateField_le_base S))).codRestrict S
    (by
      intro m
      apply (L.mem_intermediateSubgroup_iff S _).1
      rw [← extensionSubgroup_intermediateField_eq L S]
      exact
        (mem_extensionSubgroup_iff K (L.intermediateField S)
          (L.intermediateField_le_base S)
          (Subgroup.inclusion (L.intermediateField_le_base S) m)).2
          m.property)
 

@[simp]
theorem lowerRestrictionHom_apply_coe (L : FiniteGaloisSubextension K)
    (S : Subgroup L.extensionQuotient)
    (m : (L.intermediateField S).toSubgroup) :
    ((L.lowerRestrictionHom S m : S) : L.extensionQuotient) =
      L.extensionQuotientMk
        (Subgroup.inclusion (L.intermediateField_le_base S) m) :=
  rfl
 

theorem lowerRestrictionHom_surjective (L : FiniteGaloisSubextension K)
    (S : Subgroup L.extensionQuotient) :
    Function.Surjective (L.lowerRestrictionHom S) := by
  intro s
  rcases L.extensionQuotientMk_surjective s.1 with ⟨k, hk⟩
  have hkP : k ∈ L.intermediateSubgroup S := by
    apply (L.mem_intermediateSubgroup_iff S k).2
    rw [hk]
    exact s.property
  let m : (L.intermediateField S).toSubgroup :=
    ⟨k.1, ⟨k, hkP, rfl⟩⟩
  refine ⟨m, ?_⟩
  apply Subtype.ext
  rw [lowerRestrictionHom_apply_coe]
  change L.extensionQuotientMk k = s
  exact hk
 
theorem lowerRestrictionHom_ker (L : FiniteGaloisSubextension K)
    (S : Subgroup L.extensionQuotient) :
    MonoidHom.ker (L.lowerRestrictionHom S) =
      extensionSubgroup (L.intermediateField S) L.field
        (L.field_le_intermediateField S) := by
  ext m
  rw [MonoidHom.mem_ker, mem_extensionSubgroup_iff]
  constructor
  · intro hm
    let mK : K.toSubgroup :=
      ⟨m.1, L.intermediateField_le_base S m.property⟩
    have hq :
        ((L.lowerRestrictionHom S m : S) : L.extensionQuotient) = 1 :=
      congrArg Subtype.val hm
    rw [lowerRestrictionHom_apply_coe] at hq
    have hH : mK ∈ extensionSubgroup K L.field L.below :=
      (L.extensionQuotientMk_eq_one_iff mK).1 hq
    exact (mem_extensionSubgroup_iff K L.field L.below
      mK).1 hH
  · intro hm
    let mK : K.toSubgroup :=
      ⟨m.1, L.intermediateField_le_base S m.property⟩
    have hH : mK ∈ extensionSubgroup K L.field L.below :=
      (mem_extensionSubgroup_iff K L.field L.below mK).2 hm
    have hq : L.extensionQuotientMk mK = 1 :=
      (L.extensionQuotientMk_eq_one_iff mK).2 hH
    apply Subtype.ext
    rw [lowerRestrictionHom_apply_coe]
    exact hq
 

noncomputable def lowerQuotientEquiv (L : FiniteGaloisSubextension K)
    (S : Subgroup L.extensionQuotient) :
    (L.lowerFiniteGalois S).extensionQuotient ≃* S := by
  letI : (extensionSubgroup (L.intermediateField S) L.field
      (L.field_le_intermediateField S)).Normal :=
    L.extensionSubgroup_over_intermediate_normal S
  exact (L.lowerFiniteGalois S).extensionQuotientMulEquiv.trans
    ((QuotientGroup.quotientMulEquivOfEq
        (L.lowerRestrictionHom_ker S).symm).trans
      (QuotientGroup.quotientKerEquivOfSurjective
        (L.lowerRestrictionHom S) (L.lowerRestrictionHom_surjective S)))
omit [IsTopologicalGroup G] in
 

theorem intermediateSubgroup_map_quotient_eq
    (L : FiniteGaloisSubextension K) (S : Subgroup L.extensionQuotient) :
    (L.intermediateSubgroup S).map L.extensionQuotientMk = S := by
  exact Subgroup.map_comap_eq_self_of_surjective
    L.extensionQuotientMk_surjective S
 
instance intermediateField_normalInstance
    (L : FiniteGaloisSubextension K) (S : Subgroup L.extensionQuotient)
    [hS : S.Normal] :
    (extensionSubgroup K (L.intermediateField S)
      (L.intermediateField_le_base S)).Normal :=
  L.intermediateField_normal S hS
 

def upperQuotient (L : FiniteGaloisSubextension K)
    (S : Subgroup L.extensionQuotient) : Type _ :=
  L.extensionQuotient ⧸ S
 
instance upperQuotient_groupInstance (L : FiniteGaloisSubextension K)
    (S : Subgroup L.extensionQuotient) [S.Normal] :
    Group (L.upperQuotient S) := by
  change Group (L.extensionQuotient ⧸ S)
  infer_instance
 
def upperQuotientMulEquiv (L : FiniteGaloisSubextension K)
    (S : Subgroup L.extensionQuotient) [S.Normal] :
    L.upperQuotient S ≃* (L.extensionQuotient ⧸ S) :=
  MulEquiv.refl _
 

noncomputable def upperQuotientEquiv (L : FiniteGaloisSubextension K)
    (S : Subgroup L.extensionQuotient) [S.Normal] :
    L.upperQuotient S ≃*
      (L.intermediateFiniteGalois S inferInstance).extensionQuotient := by
  let H := extensionSubgroup K L.field L.below
  let P := L.intermediateSubgroup S
  let π : K.toSubgroup →* L.extensionQuotient := L.extensionQuotientMk
  have hHP : H ≤ P := L.extensionSubgroup_le_intermediateSubgroup S
  have hmap : P.map π = S := L.intermediateSubgroup_map_quotient_eq S
  have hupper : extensionSubgroup K (L.intermediateField S)
      (L.intermediateField_le_base S) = P :=
    L.extensionSubgroup_intermediateField_eq S
  letI : H.Normal := L.normal
  letI : P.Normal := L.intermediateSubgroup_normal S inferInstance
  letI : (P.map π).Normal := by rw [hmap]; infer_instance
  exact (L.upperQuotientMulEquiv S).trans
    ((QuotientGroup.quotientMulEquivOfEq hmap.symm).trans
      ((QuotientGroup.quotientQuotientEquivQuotient H P hHP).trans
        ((QuotientGroup.quotientMulEquivOfEq hupper.symm).trans
          (L.intermediateFiniteGalois S inferInstance).extensionQuotientMulEquiv.symm)))
end FiniteGaloisSubextension
end
end ClassFormation
end

/- ClassFieldTheory.AbstractClassFieldTheory.Reciprocity.Reduction -/
section
namespace ClassFormation
open KummerTheory
open CyclicCohomology
noncomputable section
universe u
section Representation
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
  [IsTopologicalGroup G]
namespace FiniteGaloisSubextension
variable {K : ClosedSubgroup G}
end FiniteGaloisSubextension
end Representation
section GroupOnly
variable {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
namespace FiniteGaloisSubextension
variable {K : ClosedSubgroup G}
 



theorem exists_cyclicIntermediateFields
    (L : FiniteGaloisSubextension K)
    [IsMulCommutative L.extensionQuotient] :
    ∃ (I : Type 0) (_ : Fintype I) (m : I → ℕ),
      (∀ i, 1 < m i) ∧
      ∃ f : ∀ i,
          L.extensionQuotient →* Multiplicative (ZMod (m i)),
        (∀ i, Function.Surjective (f i)) ∧
        (⨅ i, MonoidHom.ker (f i)) = ⊥ ∧
        (∀ i, IsCyclic
          (K.toSubgroup ⧸ extensionSubgroup K
            (L.intermediateField (MonoidHom.ker (f i)))
            (L.intermediateField_le_base (MonoidHom.ker (f i))))) ∧
        (∀ i, Finite
          (K.toSubgroup ⧸ extensionSubgroup K
            (L.intermediateField (MonoidHom.ker (f i)))
            (L.intermediateField_le_base (MonoidHom.ker (f i))))) := by
  let : CommGroup L.extensionQuotient :=
    open scoped IsMulCommutative in inferInstance
  obtain ⟨I, hI, m, hm, f, hf, hfaithful⟩ :=
    finiteCommGroup_exists_jointlyFaithful_cyclic_factors
      L.extensionQuotient
  let : Fintype I := hI
  refine ⟨I, hI, m, hm, f, hf, hfaithful, ?_, ?_⟩
  · intro i
    let e : L.extensionQuotient ⧸ MonoidHom.ker (f i) ≃*
        Multiplicative (ZMod (m i)) :=
      QuotientGroup.quotientKerEquivOfSurjective (f i) (hf i)
    have hsource : IsCyclic
        (L.extensionQuotient ⧸ MonoidHom.ker (f i)) :=
      e.isCyclic.2 inferInstance
    exact (L.upperQuotientEquiv (MonoidHom.ker (f i))).isCyclic.1 hsource
  · intro i
    exact L.intermediateField_finite (MonoidHom.ker (f i))
end FiniteGaloisSubextension
end GroupOnly
section Representation
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
  [IsTopologicalGroup G]
namespace FiniteGaloisSubextension
variable {K : ClosedSubgroup G}
end FiniteGaloisSubextension
end Representation
end
end ClassFormation
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
abbrev B (A : Rep ℤ G) (H : ClosedSubgroup G) :=
  letI : Module ℤ A.V := A.hV2
  (Representation.invariants (A.ρ.comp (U H).subtype)).toAddSubgroup
abbrev N (A : Rep ℤ G) (H J : ClosedSubgroup G) (a : A.V) :=
  ∃ b : B A J, ∑ᶠ q : U H ⧸ M H J, A.ρ q.out.val b.val = a
theorem native_norm (A : Rep ℤ G) (H J : ClosedSubgroup G) (h : J ≤ H)
    [Finite (U H ⧸ M H J)] (a : ambientFixedAddSubgroup A H) :
    N A H J a.val ↔ a ∈ (relativeNorm A H J h).range := by
  letI : Fintype (U H ⧸ M H J) := Fintype.ofFinite _
  have sum (b : ambientFixedAddSubgroup A J) :
      ∑ᶠ q : U H ⧸ M H J, A.ρ q.out.val b.val = (relativeNorm A H J h b).val := by
    rw [finsum_eq_sum_of_fintype]
    apply Finset.sum_congr rfl
    intro q _
    exact congrArg (relativeCosetAction A H J h b) (Quotient.out_eq' q)
  constructor
  · rintro ⟨b,hb⟩
    exact ⟨b, Subtype.ext ((sum b).symm.trans hb)⟩
  · rintro ⟨b,rfl⟩
    exact ⟨b,sum b⟩
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

/- TunnellAbelianNormIndex -/
section
namespace TunnellAbelianNormIndex
open ClassFormation CyclicCohomology KummerTheory
open scoped Classical IsMulCommutative
noncomputable section
theorem comp_dvd {X Y Z : Type*} [AddCommGroup X] [AddCommGroup Y] [AddCommGroup Z]
    (f : X →+ Y) (g : Y →+ Z) :
    (g.comp f).range.index ∣ f.range.index * g.range.index := by
  rw [← AddMonoidHom.map_range,AddSubgroup.index_map]
  exact Nat.mul_dvd_mul (AddSubgroup.index_dvd_of_le le_sup_left) dvd_rfl
variable {G : Type} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [CompactSpace G] [T2Space G] [TotallyDisconnectedSpace G]
variable (A : Rep ℤ G)
abbrev index (K : FiniteAbstractField G) (E : FiniteGaloisSubextension K.field) :=
  letI := E.finite
  (relativeNorm A K.field E.field E.below).range.index
def CyclicBound : Prop := ∀ (K : FiniteAbstractField G) (E : FiniteGaloisSubextension K.field)
    [IsCyclic E.extensionQuotient], index A K E ∣ Nat.card E.extensionQuotient
theorem cyclic (cf : SatisfiesClassFieldAxiom A) : CyclicBound A := by
  intro K E hc
  letI := E.finite
  letI := E.normal
  letI := K.finite
  let T := DegreeData.FiniteAbstractExtension.ofInclusion E.field K.field E.below
  letI : Finite ((baseField G).toSubgroup ⧸ extensionSubgroup (baseField G) T.base (le_baseField T.base)) := K.finite
  obtain ⟨g,hg⟩ := IsCyclic.exists_generator (α:=E.extensionQuotient)
  have eq := cyclicReciprocity_card_equality A cf T E.normal g hg
  have e := finiteNormQuotientConcreteEquiv A K.field E.field E.below
  exact dvd_of_eq ((Nat.card_congr e.toEquiv).symm.trans eq.symm)
private theorem proper_card {Q : Type*} [Group Q] [Finite Q] (S : Subgroup Q) (hS : S ≠ ⊤) :
    Nat.card S < Nat.card Q := by
  by_contra h
  have hs := (S.subtype_injective.bijective_of_nat_card_le (Nat.le_of_not_gt h)).surjective
  apply hS
  exact top_unique fun x _ => by obtain ⟨a,rfl⟩ := hs x; exact a.property
theorem bound (c : CyclicBound A) (K : FiniteAbstractField G) (E : FiniteGaloisSubextension K.field)
    [comm : IsMulCommutative E.extensionQuotient] : index A K E ∣ Nat.card E.extensionQuotient := by
  letI := E.finite
  let Q := E.extensionQuotient
  by_cases hc : IsCyclic Q
  · letI := hc
    exact c K E
  have hnt : Nontrivial Q := not_subsingleton_iff_nontrivial.mp fun h => by
    letI := h
    exact hc inferInstance
  obtain ⟨I,hI,m,hm,f,hf,hsep,hcy,hfin⟩ := E.exists_cyclicIntermediateFields
  obtain ⟨q,hq⟩ := exists_ne (1 : Q)
  have i0 : ∃ i, f i q ≠ 1 := by
    by_contra! hall
    have he : q ∈ ⨅ i, (f i).ker := Subgroup.mem_iInf.mpr hall
    rw [hsep] at he
    exact hq he
  obtain ⟨i,hi⟩ := i0
  let S := (f i).ker
  have hs : S ≠ ⊤ := fun top => hi (show q ∈ S from top.symm ▸ Subgroup.mem_top q)
  let X := E.intermediateFiniteGalois S inferInstance
  let Y := E.lowerFiniteGalois S
  let hsub := E.intermediateField_le_base S
  let K' : FiniteAbstractField G := ⟨E.intermediateField S,
    FiniteGaloisSubextension.finite_extension_trans hsub (le_baseField K.field)⟩
  letI : IsCyclic X.extensionQuotient := hcy i
  letI : IsMulCommutative Y.extensionQuotient := ⟨⟨fun a b =>
    (E.lowerQuotientEquiv S).injective (by rw [map_mul,map_mul,mul_comm])⟩⟩
  have lowercard : Nat.card Y.extensionQuotient = Nat.card S := Nat.card_congr (E.lowerQuotientEquiv S).toEquiv
  have lt : Nat.card Y.extensionQuotient < Nat.card Q := lowercard.trans_lt (proper_card S hs)
  have lower := bound c K' Y
  have upper := c K X
  let T : DegreeData.FiniteTower G := {
    base := K.field, middle := K'.field, top := E.field, top_le_middle := Y.below, middle_le_base := X.below
    finiteTopQuotient := Y.finite, finiteBaseQuotient := X.finite }
  letI : Finite (K.field.toSubgroup ⧸ extensionSubgroup K.field K'.field X.below) := X.finite
  letI : Finite (K'.field.toSubgroup ⧸ extensionSubgroup K'.field E.field Y.below) := Y.finite
  have tower := comp_dvd (relativeNorm A K'.field E.field Y.below) (relativeNorm A K.field K'.field X.below)
  have total : index A K E ∣ index A K' Y * index A K X := by
    rw [show (relativeNorm A K.field K'.field X.below).comp (relativeNorm A K'.field E.field Y.below) =
      relativeNorm A K.field E.field E.below from T.norm_trans A] at tower
    exact tower
  have uppercard : Nat.card X.extensionQuotient = S.index :=
    Nat.card_congr (E.upperQuotientEquiv S).symm.toEquiv
  exact (total.trans (Nat.mul_dvd_mul lower upper)).trans (dvd_of_eq (by
    rw [lowercard,uppercard,S.card_mul_index]))
termination_by Nat.card E.extensionQuotient
end
end TunnellAbelianNormIndex
end

/- TunnellAbstractAbelianIndexActual -/
section
namespace TunnellAbstractAbelianIndexActual
open ClassFormation KummerTheory TunnellAbstractNormCoordinates
open scoped Classical IsMulCommutative
theorem actual : OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H1_R1_H2_R1_H2_R1_H1_R1.H2 := by
  intro G _ _ _ _ _ _ A
  dsimp only
  intro cf H J hH hJ normal finite comm
  let K := finiteField H
  let E : FiniteGaloisSubextension K.field := ⟨J,hJ,normal,@Finite.of_fintype _ finite⟩
  let N := relativeNorm A H J hJ
  letI : IsMulCommutative E.extensionQuotient := comm
  refine ⟨N.range, fun x => (native_norm A H J hJ x).symm,?_⟩
  exact TunnellAbelianNormIndex.bound A (TunnellAbelianNormIndex.cyclic A ((tate_iff A).mp cf)) K E
end TunnellAbstractAbelianIndexActual
end

theorem OMA.solution : OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H1_R1_H2_R1_H2_R1_H1_R1.H2 := TunnellAbstractAbelianIndexActual.actual
