import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1_H1_R1_H2_R1_H1_R1
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

/- ClassFieldTheory.AbstractClassFieldTheory.Degree.Indices -/
section
namespace ClassFormation
open scoped Pointwise
universe u v
variable {G : Type u} {D : Type v} [Group G] [Group D]
private def kernelToSaturation (d : G →* D) (L K : Subgroup G) :
    ↑(K ⊓ d.ker) →* ↑(K ⊓ (L ⊔ d.ker)) :=
  Subgroup.inclusion (inf_le_inf le_rfl le_sup_right)
private theorem kernelToSaturation_rel_iff (d : G →* D) (L K : Subgroup G)
    (x y : ↑(K ⊓ d.ker)) :
    QuotientGroup.leftRel ((L ⊓ d.ker).subgroupOf (K ⊓ d.ker)) x y ↔
      QuotientGroup.leftRel (L.subgroupOf (K ⊓ (L ⊔ d.ker)))
        (kernelToSaturation d L K x) (kernelToSaturation d L K y) := by
  simp only [QuotientGroup.leftRel_apply, Subgroup.mem_subgroupOf, Subgroup.mem_inf]
  constructor
  · exact fun h ↦ h.1
  · intro h
    exact ⟨h, d.ker.mul_mem (d.ker.inv_mem x.property.2) y.property.2⟩
private noncomputable def kernelCosetToSaturationCoset (d : G →* D) (L K : Subgroup G) :
    (↑(K ⊓ d.ker) ⧸ (L ⊓ d.ker).subgroupOf (K ⊓ d.ker)) →
      (↑(K ⊓ (L ⊔ d.ker)) ⧸ L.subgroupOf (K ⊓ (L ⊔ d.ker))) :=
  Quotient.map' (kernelToSaturation d L K) fun x y h ↦
    (kernelToSaturation_rel_iff d L K x y).mp h
private theorem kernelCosetToSaturationCoset_injective (d : G →* D) (L K : Subgroup G) :
    Function.Injective (kernelCosetToSaturationCoset d L K) := by
  intro q₁ q₂
  refine Quotient.inductionOn₂ q₁ q₂ ?_
  intro x y h
  apply Quotient.eq''.mpr
  apply (kernelToSaturation_rel_iff d L K x y).mpr
  apply Quotient.eq''.mp
  simpa only [kernelCosetToSaturationCoset, Quotient.map'_mk''] using h
private theorem kernelCosetToSaturationCoset_surjective (d : G →* D) {L K : Subgroup G}
    (hLK : L ≤ K) : Function.Surjective (kernelCosetToSaturationCoset d L K) := by
  intro q
  refine Quotient.inductionOn q ?_
  intro z
  have hzSup : (z : G) ∈ d.ker ⊔ L := by
    rw [sup_comm]
    exact z.property.2
  obtain ⟨n, hnKer, l, hlL, hnl⟩ :=
    (Subgroup.mem_sup_of_normal_left (s := d.ker) (t := L)).mp hzSup
  have hnK : n ∈ K := by
    rw [show n = (z : G) * l⁻¹ by rw [← hnl]; simp]
    exact K.mul_mem z.property.1 (K.inv_mem (hLK hlL))
  let n' : ↑(K ⊓ d.ker) := ⟨n, hnK, hnKer⟩
  refine ⟨Quotient.mk'' n', ?_⟩
  simp only [kernelCosetToSaturationCoset, Quotient.map'_mk'']
  apply Quotient.eq''.mpr
  rw [QuotientGroup.leftRel_apply, Subgroup.mem_subgroupOf]
  change n⁻¹ * (z : G) ∈ L
  rw [← hnl]
  simpa using hlL

noncomputable def kernelCosetEquivSaturation (d : G →* D) {L K : Subgroup G} (hLK : L ≤ K) :
    (↑(K ⊓ d.ker) ⧸ (L ⊓ d.ker).subgroupOf (K ⊓ d.ker)) ≃
      (↑(K ⊓ (L ⊔ d.ker)) ⧸ L.subgroupOf (K ⊓ (L ⊔ d.ker))) :=
  Equiv.ofBijective (kernelCosetToSaturationCoset d L K)
    ⟨kernelCosetToSaturationCoset_injective d L K,
      kernelCosetToSaturationCoset_surjective d hLK⟩

theorem relIndex_saturation_eq_inf_ker_relIndex (d : G →* D)
    {L K : Subgroup G} (hLK : L ≤ K) :
    L.relIndex (K ⊓ (L ⊔ d.ker)) =
      (L ⊓ d.ker).relIndex (K ⊓ d.ker) := by
  unfold Subgroup.relIndex
  exact Nat.card_congr (kernelCosetEquivSaturation d hLK).symm

theorem map_relIndex_eq_saturation_relIndex (d : G →* D)
    (L K : Subgroup G) :
    (L.map d).relIndex (K.map d) =
      (K ⊓ (L ⊔ d.ker)).relIndex K := by
  rw [← Subgroup.relIndex_comap, Subgroup.comap_map_eq, ← Subgroup.inf_relIndex_right,
    inf_comm]

theorem relIndex_eq_map_relIndex_mul_inf_ker_relIndex (d : G →* D) {L K : Subgroup G}
    (hLK : L ≤ K) :
    L.relIndex K =
      (L.map d).relIndex (K.map d) * (L ⊓ d.ker).relIndex (K ⊓ d.ker) := by
  rw [map_relIndex_eq_saturation_relIndex,
    ← relIndex_saturation_eq_inf_ker_relIndex d hLK, mul_comm]
  exact (Subgroup.relIndex_mul_relIndex L (K ⊓ (L ⊔ d.ker)) K
    (fun x hx ↦ ⟨hLK hx, (show L ≤ L ⊔ d.ker from le_sup_left) hx⟩) inf_le_left).symm

noncomputable def intersectionIndexCardinal (L K : Subgroup G) : Cardinal :=
  Cardinal.mk (K ⧸ L.subgroupOf K)
 
noncomputable def relativeIndexCardinal {L K : Subgroup G} (_ : L ≤ K) : Cardinal :=
  intersectionIndexCardinal L K
 
theorem relativeIndexCardinal_mul {M L K : Subgroup G}
    (hML : M ≤ L) (hLK : L ≤ K) :
    relativeIndexCardinal hML * relativeIndexCardinal hLK =
      relativeIndexCardinal (hML.trans hLK) := by
  rw [mul_comm, relativeIndexCardinal, relativeIndexCardinal,
    relativeIndexCardinal, intersectionIndexCardinal, intersectionIndexCardinal,
    intersectionIndexCardinal, Cardinal.mul_def]
  exact Cardinal.mk_congr (Subgroup.quotientTowerEquiv hML hLK).symm
private def subgroupMapRestriction (d : G →* D) (K : Subgroup G) :
    K →* K.map d where
  toFun x := ⟨d x.1, ⟨x.1, x.2, rfl⟩⟩
  map_one' := Subtype.ext (map_one d)
  map_mul' x y := Subtype.ext (map_mul d x.1 y.1)
private theorem subgroupMapRestriction_surjective (d : G →* D) (K : Subgroup G) :
    Function.Surjective (subgroupMapRestriction d K) := by
  rintro ⟨_, x, hx, rfl⟩
  exact ⟨⟨x, hx⟩, rfl⟩
private theorem subgroupMapRestriction_rel_iff (d : G →* D)
    (H : Subgroup D) (K : Subgroup G) (x y : K) :
    QuotientGroup.leftRel ((H.comap d).subgroupOf K) x y ↔
      QuotientGroup.leftRel (H.subgroupOf (K.map d))
        (subgroupMapRestriction d K x) (subgroupMapRestriction d K y) := by
  simp only [QuotientGroup.leftRel_apply, Subgroup.mem_subgroupOf,
    Subgroup.mem_comap]
  change d (x.1⁻¹ * y.1) ∈ H ↔ (d x.1)⁻¹ * d y.1 ∈ H
  rw [map_mul, map_inv]
private noncomputable def relativeCosetComapMap (d : G →* D)
    (H : Subgroup D) (K : Subgroup G) :
    (K ⧸ (H.comap d).subgroupOf K) →
      (K.map d ⧸ H.subgroupOf (K.map d)) :=
  Quotient.map' (subgroupMapRestriction d K) fun x y h ↦
    (subgroupMapRestriction_rel_iff d H K x y).mp h
private theorem relativeCosetComapMap_injective (d : G →* D)
    (H : Subgroup D) (K : Subgroup G) :
    Function.Injective (relativeCosetComapMap d H K) := by
  intro q₁ q₂
  refine Quotient.inductionOn₂ q₁ q₂ ?_
  intro x y h
  apply Quotient.eq''.mpr
  apply (subgroupMapRestriction_rel_iff d H K x y).mpr
  apply Quotient.eq''.mp
  simpa only [relativeCosetComapMap, Quotient.map'_mk''] using h
private theorem relativeCosetComapMap_surjective (d : G →* D)
    (H : Subgroup D) (K : Subgroup G) :
    Function.Surjective (relativeCosetComapMap d H K) := by
  intro q
  refine Quotient.inductionOn' q ?_
  intro z
  obtain ⟨x, rfl⟩ := subgroupMapRestriction_surjective d K z
  exact ⟨Quotient.mk'' x, by
    simp only [relativeCosetComapMap, Quotient.map'_mk'']⟩
private noncomputable def relativeCosetComapEquiv (d : G →* D)
    (H : Subgroup D) (K : Subgroup G) :
    (K ⧸ (H.comap d).subgroupOf K) ≃
      (K.map d ⧸ H.subgroupOf (K.map d)) :=
  Equiv.ofBijective (relativeCosetComapMap d H K)
    ⟨relativeCosetComapMap_injective d H K,
      relativeCosetComapMap_surjective d H K⟩
private noncomputable def imageCosetEquivSaturation (d : G →* D)
    (L K : Subgroup G) :
    (K ⧸ (K ⊓ (L ⊔ d.ker)).subgroupOf K) ≃
      (K.map d ⧸ (L.map d).subgroupOf (K.map d)) := by
  have hsub :
      ((L.map d).comap d).subgroupOf K =
        (K ⊓ (L ⊔ d.ker)).subgroupOf K := by
    ext x
    simp only [Subgroup.mem_subgroupOf, Subgroup.mem_inf]
    rw [Subgroup.comap_map_eq]
    exact (and_iff_right x.2).symm
  exact (Subgroup.quotientEquivOfEq hsub.symm).trans
    (relativeCosetComapEquiv d (L.map d) K)

theorem intersectionIndexCardinal_image_eq_saturation (d : G →* D)
    (L K : Subgroup G) :
    Cardinal.lift.{u} (intersectionIndexCardinal (L.map d) (K.map d)) =
      Cardinal.lift.{v}
        (intersectionIndexCardinal (K ⊓ (L ⊔ d.ker)) K) := by
  exact (imageCosetEquivSaturation d L K).lift_cardinal_eq.symm

theorem relativeIndexCardinal_kernel_eq_saturation (d : G →* D)
    {L K : Subgroup G} (hLK : L ≤ K) :
    relativeIndexCardinal
      (show L ⊓ d.ker ≤ K ⊓ d.ker from inf_le_inf hLK le_rfl) =
      relativeIndexCardinal
        (show L ≤ K ⊓ (L ⊔ d.ker) from fun _ hx ↦
          ⟨hLK hx, (show L ≤ L ⊔ d.ker from le_sup_left) hx⟩) := by
  exact Cardinal.mk_congr (kernelCosetEquivSaturation d hLK)

theorem relativeIndexCardinal_eq_map_mul_inf_ker (d : G →* D)
    {L K : Subgroup G} (hLK : L ≤ K) :
    Cardinal.lift.{v} (relativeIndexCardinal hLK) =
      Cardinal.lift.{u}
          (relativeIndexCardinal (Subgroup.map_mono (f := d) hLK)) *
        Cardinal.lift.{v}
          (relativeIndexCardinal
            (show L ⊓ d.ker ≤ K ⊓ d.ker from inf_le_inf hLK le_rfl)) := by
  have hLS : L ≤ K ⊓ (L ⊔ d.ker) := fun _ hx ↦
    ⟨hLK hx, (show L ≤ L ⊔ d.ker from le_sup_left) hx⟩
  have hSK : K ⊓ (L ⊔ d.ker) ≤ K := inf_le_left
  calc
    Cardinal.lift.{v} (relativeIndexCardinal hLK) =
        Cardinal.lift.{v}
            (relativeIndexCardinal hLS) *
          Cardinal.lift.{v}
            (relativeIndexCardinal hSK) := by
      rw [← Cardinal.lift_mul, relativeIndexCardinal_mul hLS hSK]
    _ = Cardinal.lift.{v}
            (relativeIndexCardinal
              (show L ⊓ d.ker ≤ K ⊓ d.ker from inf_le_inf hLK le_rfl)) *
          Cardinal.lift.{u}
            (relativeIndexCardinal (Subgroup.map_mono (f := d) hLK)) := by
      have hkernel :
          intersectionIndexCardinal (L ⊓ d.ker) (K ⊓ d.ker) =
            intersectionIndexCardinal L (K ⊓ (L ⊔ d.ker)) := by
        simpa only [relativeIndexCardinal] using
          relativeIndexCardinal_kernel_eq_saturation d hLK
      change
        Cardinal.lift.{v}
            (intersectionIndexCardinal L (K ⊓ (L ⊔ d.ker))) *
          Cardinal.lift.{v}
            (intersectionIndexCardinal (K ⊓ (L ⊔ d.ker)) K) =
          Cardinal.lift.{v}
            (intersectionIndexCardinal (L ⊓ d.ker) (K ⊓ d.ker)) *
          Cardinal.lift.{u}
            (intersectionIndexCardinal (L.map d) (K.map d))
      rw [hkernel, intersectionIndexCardinal_image_eq_saturation d L K]
    _ = Cardinal.lift.{u}
            (relativeIndexCardinal (Subgroup.map_mono (f := d) hLK)) *
          Cardinal.lift.{v}
            (relativeIndexCardinal
              (show L ⊓ d.ker ≤ K ⊓ d.ker from inf_le_inf hLK le_rfl)) := mul_comm _ _
end ClassFormation
end

/- GaloisCohomology.ProfiniteIntegers.TopologicalGeneration -/
section
namespace ClassFormation
open Set
open scoped Topology Pointwise
universe u v
section
variable {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]

def TopologicallyGenerates (X : Set G) : Prop :=
  (Subgroup.closure X).topologicalClosure = ⊤

theorem topologicallyGenerates_iff_dense {X : Set G} :
    TopologicallyGenerates (G := G) X ↔
      Dense ((Subgroup.closure X : Subgroup G) : Set G) := by
  rw [TopologicallyGenerates, SetLike.ext'_iff, Subgroup.topologicalClosure_coe,
    Subgroup.coe_top, dense_iff_closure_eq]
 
def closedSubgroupGenerated (X : Set G) : ClosedSubgroup G where
  toSubgroup := (Subgroup.closure X).topologicalClosure
  isClosed' := Subgroup.isClosed_topologicalClosure _
 
def closedSubgroupGeneratedMap {A : Type v} (φ : A → G) :
    A → (closedSubgroupGenerated (G := G) (Set.range φ) : Subgroup G) :=
  fun a =>
    ⟨φ a, Subgroup.le_topologicalClosure _
      (Subgroup.subset_closure ⟨a, rfl⟩)⟩

theorem closedSubgroupGeneratedMap_topologicallyGenerates {A : Type v}
    (φ : A → G) :
    TopologicallyGenerates
      (G := (closedSubgroupGenerated (G := G) (Set.range φ) : Subgroup G))
      (Set.range (closedSubgroupGeneratedMap (G := G) φ)) := by
  let K : ClosedSubgroup G := closedSubgroupGenerated (G := G) (Set.range φ)
  let φK : A → (K : Subgroup G) := closedSubgroupGeneratedMap (G := G) φ
  let L : Subgroup (K : Subgroup G) := Subgroup.closure (Set.range φK)
  have hmap :
      Subgroup.map (K : Subgroup G).subtype L =
        Subgroup.closure (Set.range φ) := by
    refine le_antisymm ?_ ?_
    · rw [Subgroup.map_le_iff_le_comap, Subgroup.closure_le]
      rintro y ⟨a, rfl⟩
      exact Subgroup.subset_closure ⟨a, rfl⟩
    · rw [Subgroup.closure_le]
      rintro y ⟨a, rfl⟩
      change φ a ∈ Subgroup.map (K : Subgroup G).subtype L
      exact ⟨φK a, Subgroup.subset_closure ⟨a, rfl⟩, rfl⟩
  have himage :
      ((Subtype.val : ↥(K : Subgroup G) → G) ''
          ((L : Subgroup ↥(K : Subgroup G)) : Set ↥(K : Subgroup G))) =
        ((Subgroup.map (K : Subgroup G).subtype L : Subgroup G) : Set G) := by
    ext y
    constructor
    · rintro ⟨z, hz, rfl⟩
      exact ⟨z, hz, rfl⟩
    · rintro ⟨z, hz, hzy⟩
      exact ⟨z, hz, hzy⟩
  rw [topologicallyGenerates_iff_dense, dense_iff_closure_eq]
  ext y
  constructor
  · intro _
    simp only [mem_univ]
  · intro _
    change y ∈ closure ((L : Subgroup K) : Set K)
    rw [closure_subtype]
    change (y : G) ∈
      closure
        (((Subtype.val : ↥(K : Subgroup G) → G) ''
          ((L : Subgroup ↥(K : Subgroup G)) : Set ↥(K : Subgroup G))))
    rw [himage, hmap]
    change (y : G) ∈
      ((Subgroup.closure (Set.range φ)).topologicalClosure : Set G)
    exact y.2

theorem map_mem_closedSubgroupGenerated_image
    {H : Type v} [Group H] [TopologicalSpace H] [IsTopologicalGroup H]
    (φ : G →ₜ* H) {X : Set G} {y : G}
    (hy : y ∈ (closedSubgroupGenerated (G := G) X : Subgroup G)) :
    φ y ∈ (closedSubgroupGenerated (G := H) (φ '' X) : Subgroup H) := by
  let K : Subgroup G :=
    (closedSubgroupGenerated (G := H) (φ '' X) : Subgroup H).comap
      (φ : G →* H)
  have hX : X ⊆ K := by
    intro x hx
    exact Subgroup.le_topologicalClosure _
      (Subgroup.subset_closure ⟨x, hx, rfl⟩)
  have hKclosed : IsClosed (K : Set G) := by
    change IsClosed {x : G | φ x ∈
      (closedSubgroupGenerated (G := H) (φ '' X) : Subgroup H)}
    exact (closedSubgroupGenerated (G := H) (φ '' X)).isClosed'.preimage
      φ.continuous
  exact
    (Subgroup.topologicalClosure_minimal _
      ((Subgroup.closure_le (K := K)).2 hX) hKclosed) hy
 
theorem map_mem_closedSubgroupGenerated_singleton
    {H : Type v} [Group H] [TopologicalSpace H] [IsTopologicalGroup H]
    (φ : G →ₜ* H) (x : G) {y : G}
    (hy : y ∈
      (closedSubgroupGenerated (G := G) ({x} : Set G) : Subgroup G)) :
    φ y ∈
      (closedSubgroupGenerated (G := H) ({φ x} : Set H) : Subgroup H) := by
  simpa using
    (map_mem_closedSubgroupGenerated_image (G := G) (H := H) φ
      (X := ({x} : Set G)) hy)

theorem topologicallyGenerates_singleton_of_denseRange_mint
    {H : Type v} [Group H] [TopologicalSpace H] [IsTopologicalGroup H]
    (f : Multiplicative ℤ →* H) (hf : DenseRange f) :
    TopologicallyGenerates
      (G := H) ({f (Multiplicative.ofAdd 1)} : Set H) := by
  let g : H := f (Multiplicative.ofAdd 1)
  have hsubset :
      Set.range f ⊆
        (((Subgroup.closure ({g} : Set H)).topologicalClosure : Subgroup H) :
          Set H) := by
    intro y hy
    rcases hy with ⟨n, rfl⟩
    have hz : f n ∈ Subgroup.zpowers g := by
      have hEq : f n = g ^ n.toAdd := by
        simpa [g] using (MonoidHom.apply_mint (f := f) (n := n))
      rw [hEq]
      exact (Subgroup.zpowers g).zpow_mem (Subgroup.mem_zpowers g) n.toAdd
    exact Subgroup.le_topologicalClosure _
      (by simpa [g, Subgroup.zpowers_eq_closure] using hz)
  have hclosure :
      closure (Set.range f) ⊆
        (((Subgroup.closure ({g} : Set H)).topologicalClosure : Subgroup H) :
          Set H) :=
    closure_minimal hsubset (Subgroup.isClosed_topologicalClosure _)
  rw [TopologicallyGenerates]
  apply top_unique
  intro x _hx
  have hx' : x ∈ closure (Set.range f) := by
    rw [hf.closure_range]
    simp only [mem_univ]
  exact hclosure hx'
end
end ClassFormation
end

/- GaloisCohomology.ProfiniteIntegers.ProfiniteIntegerCore -/
section
namespace ClassFormation
open scoped Topology
private structure ZHatIndex where
  modulus : ℕ
  positive : 0 < modulus
private instance (i : ZHatIndex) : NeZero i.modulus :=
  ⟨Nat.ne_of_gt i.positive⟩
private def zHatIndex (n : ℕ) (hn : 0 < n) : ZHatIndex :=
  ⟨n, hn⟩
private abbrev ZHatAmbient : Type 0 :=
  ∀ i : ZHatIndex, ZMod i.modulus
private def zHatDiagonal : ℤ →+* ZHatAmbient where
  toFun a i := (a : ZMod i.modulus)
  map_zero' := by
    funext i
    exact Int.cast_zero
  map_one' := by
    funext i
    exact Int.cast_one
  map_add' a b := by
    funext i
    exact Int.cast_add a b
  map_mul' a b := by
    funext i
    exact Int.cast_mul a b
private def zHatIntegerSubring : Subring ZHatAmbient :=
  zHatDiagonal.range
private abbrev ZHatClosureModel : Type 0 :=
  zHatIntegerSubring.topologicalClosure

def ZHat : Type 0 :=
  ZHatClosureModel
 
instance : CommRing ZHat := by
  change CommRing ZHatClosureModel
  infer_instance
 
instance : TopologicalSpace ZHat := by
  change TopologicalSpace ZHatClosureModel
  infer_instance
 
instance : IsTopologicalRing ZHat := by
  change IsTopologicalRing ZHatClosureModel
  infer_instance
 
instance : T2Space ZHat := by
  change T2Space ZHatClosureModel
  infer_instance
 
instance : CompactSpace ZHat :=
  Topology.IsClosedEmbedding.compactSpace
    (Subring.isClosed_topologicalClosure zHatIntegerSubring).isClosedEmbedding_subtypeVal
 
def zHatReduction (n : ℕ) (hn : 0 < n) :
    ContinuousAddMonoidHom ZHat (ZMod n) where
  toFun x := (show ZHatClosureModel from x).1 (zHatIndex n hn)
  map_zero' := rfl
  map_add' _ _ := rfl
  continuous_toFun := by
    change Continuous
      (fun x : ZHatClosureModel => x.1 (zHatIndex n hn))
    exact (continuous_apply (zHatIndex n hn)).comp continuous_subtype_val

@[simp] theorem zHatReduction_intCast (n : ℕ) (hn : 0 < n) (a : ℤ) :
    zHatReduction n hn (a : ZHat) = (a : ZMod n) :=
  rfl
namespace ZHat
 
theorem ext {x y : ZHat}
    (h : ∀ n (hn : 0 < n), zHatReduction n hn x = zHatReduction n hn y) :
    x = y := by
  apply Subtype.ext
  funext i
  rcases i with ⟨n, hn⟩
  exact h n hn
end ZHat
 
theorem zHatReduction_transition {m n : ℕ}
    (hm : 0 < m) (hn : 0 < n) (hmn : m ∣ n) (x : ZHat) :
    ZMod.castHom hmn (ZMod m) (zHatReduction n hn x) =
      zHatReduction m hm x := by
  let f : ZHatAmbient → ZMod m :=
    fun z => ZMod.castHom hmn (ZMod m) (z (zHatIndex n hn))
  let g : ZHatAmbient → ZMod m :=
    fun z => z (zHatIndex m hm)
  have hfg : Set.EqOn f g (zHatIntegerSubring : Set ZHatAmbient) := by
    rintro _ ⟨a, rfl⟩
    exact map_intCast (ZMod.castHom hmn (ZMod m)) a
  have hf : Continuous f :=
    continuous_of_discreteTopology.comp (continuous_apply (zHatIndex n hn))
  have hg : Continuous g :=
    continuous_apply (zHatIndex m hm)
  exact hfg.closure hf hg x.property
 
theorem denseRange_intCast_zHat :
    DenseRange (Int.castRingHom ZHat) := by
  have hinclusion : DenseRange
      (Set.inclusion (Subring.le_topologicalClosure zHatIntegerSubring)) := by
    apply (denseRange_inclusion_iff
      (Subring.le_topologicalClosure zHatIntegerSubring)).2
    change closure (zHatIntegerSubring : Set ZHatAmbient) ⊆
      closure (zHatIntegerSubring : Set ZHatAmbient)
    exact Set.Subset.rfl
  have hdiagonal : DenseRange zHatDiagonal.rangeRestrict :=
    zHatDiagonal.rangeRestrict_surjective.denseRange
  have hcomp : DenseRange
      (Set.inclusion (Subring.le_topologicalClosure zHatIntegerSubring) ∘
        zHatDiagonal.rangeRestrict) :=
    hinclusion.comp hdiagonal
      (continuous_inclusion
        (Subring.le_topologicalClosure zHatIntegerSubring))
  have heq :
      Set.inclusion (Subring.le_topologicalClosure zHatIntegerSubring) ∘
          zHatDiagonal.rangeRestrict =
        (fun a : ℤ => Int.castRingHom ZHat a) := by
    funext a
    apply Subtype.ext
    funext i
    rfl
  rw [heq] at hcomp
  exact hcomp

theorem zHatOne_topologicallyGenerates :
    TopologicallyGenerates
      (G := Multiplicative ZHat)
      ({Multiplicative.ofAdd (1 : ZHat)} : Set (Multiplicative ZHat)) := by
  let f : Multiplicative ℤ →* Multiplicative ZHat :=
    AddMonoidHom.toMultiplicative (Int.castRingHom ZHat).toAddMonoidHom
  have hf : DenseRange f := by
    have hOfAdd :
        DenseRange (Multiplicative.ofAdd : ZHat → Multiplicative ZHat) :=
      (show Function.Surjective
          (Multiplicative.ofAdd : ZHat → Multiplicative ZHat) from
        fun x => ⟨Multiplicative.toAdd x, rfl⟩).denseRange
    have hCast :
        DenseRange
          (Multiplicative.ofAdd ∘ fun a : ℤ => (a : ZHat)) :=
      hOfAdd.comp denseRange_intCast_zHat continuous_id
    have hToAdd :
        DenseRange (Multiplicative.toAdd : Multiplicative ℤ → ℤ) :=
      (show Function.Surjective
          (Multiplicative.toAdd : Multiplicative ℤ → ℤ) from
        fun a => ⟨Multiplicative.ofAdd a, rfl⟩).denseRange
    simpa [f, Function.comp_def] using
      hCast.comp hToAdd continuous_of_discreteTopology
  simpa [f] using
    (topologicallyGenerates_singleton_of_denseRange_mint f hf)
end ClassFormation
end

/- GaloisCohomology.ProfiniteIntegers.ProfiniteInteger -/
section
namespace ClassFormation
noncomputable section

theorem proCIntegerOne_pow_nat_injective :
    Function.Injective (fun n : ℕ =>
      (Multiplicative.ofAdd (1 : ZHat)) ^ n) := by
  intro a b hab
  let m := a + b + 1
  have hm : 0 < m := by simp [m]
  have ha : a < m := by omega
  have hb : b < m := by omega
  have habAdd := congrArg Multiplicative.toAdd hab
  have habAdd' : a • (1 : ZHat) = b • (1 : ZHat) := by
    simpa using habAdd
  have habRed := congrArg (fun z : ZHat => zHatReduction m hm z) habAdd'
  have hredOne : zHatReduction m hm (1 : ZHat) = 1 :=
    rfl
  change zHatReduction m hm (a • (1 : ZHat)) =
      zHatReduction m hm (b • (1 : ZHat)) at habRed
  rw [map_nsmul, map_nsmul, hredOne] at habRed
  have hval := congrArg ZMod.val habRed
  simpa [ZMod.val_natCast_of_lt ha, ZMod.val_natCast_of_lt hb] using hval
 
def zHatMulNat (n : ℕ) : ContinuousAddMonoidHom ZHat ZHat where
  toFun := fun x => n • x
  map_zero' := nsmul_zero n
  map_add' := fun x y => nsmul_add x y n
  continuous_toFun := continuous_nsmul n
 
@[simp]
theorem zHatMulNat_apply (n : ℕ) (x : ZHat) :
    zHatMulNat n x = n • x :=
  rfl
private theorem zmod_cast_eq_of_nsmul_eq
    {n m : ℕ} (hn : 0 < n) {a b : ZMod (n * m)}
    (h : n • a = n • b) :
    ZMod.castHom (show m ∣ n * m from ⟨n, by simp [Nat.mul_comm]⟩) (ZMod m) a =
      ZMod.castHom (show m ∣ n * m from ⟨n, by simp [Nat.mul_comm]⟩) (ZMod m) b := by
  rcases ZMod.intCast_surjective a with ⟨a, rfl⟩
  rcases ZMod.intCast_surjective b with ⟨b, rfl⟩
  rw [ZMod.castHom_apply, ZMod.castHom_apply]
  rw [ZMod.cast_intCast
      (R := ZMod m) (n := n * m) (m := m)
      (show m ∣ n * m from ⟨n, by simp [Nat.mul_comm]⟩) a,
    ZMod.cast_intCast
      (R := ZMod m) (n := n * m) (m := m)
      (show m ∣ n * m from ⟨n, by simp [Nat.mul_comm]⟩) b]
  rw [← sub_eq_zero, ← Int.cast_sub, ZMod.intCast_zmod_eq_zero_iff_dvd]
  have hzero : (n • ((a - b : ℤ) : ZMod (n * m))) = 0 := by
    rw [Int.cast_sub, nsmul_sub, h, sub_self]
  have hdiv : ((n * m : ℕ) : ℤ) ∣ (n : ℤ) * (a - b) := by
    rw [← ZMod.intCast_zmod_eq_zero_iff_dvd]
    simpa [nsmul_eq_mul, Int.cast_natCast, Int.cast_mul] using hzero
  have hn0 : (n : ℤ) ≠ 0 := by exact_mod_cast Nat.ne_of_gt hn
  apply (mul_dvd_mul_iff_left hn0).mp
  simpa [Nat.cast_mul] using hdiv
 
theorem zHatMulNat_injective {n : ℕ} (hn : 0 < n) :
    Function.Injective (zHatMulNat n) := by
  intro x y hxy
  apply ZHat.ext
  intro m hm
  have hnm : 0 < n * m := Nat.mul_pos hn hm
  have hdiv : m ∣ n * m := ⟨n, by simp [Nat.mul_comm]⟩
  have hj : n • zHatReduction (n * m) hnm x =
      n • zHatReduction (n * m) hnm y := by
    simpa only [zHatMulNat_apply, map_nsmul] using
      congrArg (fun z : ZHat => zHatReduction (n * m) hnm z) hxy
  rw [← zHatReduction_transition hm hnm hdiv x,
    ← zHatReduction_transition hm hnm hdiv y]
  exact zmod_cast_eq_of_nsmul_eq hn hj
 
theorem isClosed_zHatMulNat_range (n : ℕ) :
    IsClosed ((zHatMulNat n).toAddMonoidHom.range : Set ZHat) := by
  rw [AddMonoidHom.coe_range]
  exact (isCompact_range (map_continuous (zHatMulNat n))).isClosed
 
theorem zHatReduction_surjective (n : ℕ) (hn : 0 < n) :
    Function.Surjective (zHatReduction n hn) := by
  intro a
  rcases ZMod.intCast_surjective a with ⟨a, rfl⟩
  exact ⟨(Int.castRingHom ZHat) a, rfl⟩

@[simp]
theorem zHatMulNat_int (n : ℕ) (a : ℤ) :
    zHatMulNat n ((Int.castRingHom ZHat) a) =
      (Int.castRingHom ZHat) ((n : ℤ) * a) := by
  apply ZHat.ext
  intro m hm
  change n • (a : ZMod m) = (((n : ℤ) * a : ℤ) : ZMod m)
  simp [nsmul_eq_mul]
 
theorem zHatMulNat_range_eq_ker_reduction (n : ℕ) (hn : 0 < n) :
    (zHatMulNat n).toAddMonoidHom.range =
      (zHatReduction n hn).toAddMonoidHom.ker := by
  apply AddSubgroup.ext
  intro y
  constructor
  · rintro ⟨x, rfl⟩
    change zHatReduction n hn (zHatMulNat n x) = 0
    change n • zHatReduction n hn x = 0
    simp [nsmul_eq_mul]
  · intro hy
    let K : Set ZHat :=
      ((zHatReduction n hn).toAddMonoidHom.ker : Set ZHat)
    let D : Set ZHat :=
      Set.range (Int.castRingHom ZHat)
    have hKopen : IsOpen K := by
      change IsOpen ((zHatReduction n hn) ⁻¹' ({0} : Set (ZMod n)))
      have hzeroOpen : IsOpen ({0} : Set (ZMod n)) := isOpen_discrete _
      exact hzeroOpen.preimage (map_continuous (zHatReduction n hn))
    have hDdense : Dense D := by
      exact denseRange_intCast_zHat
    have hKD : K ∩ D ⊆
        ((zHatMulNat n).toAddMonoidHom.range : Set ZHat) := by
      rintro _ ⟨hzK, a, rfl⟩
      have ha0 : (a : ZMod n) = 0 := by
        simpa [K] using hzK
      have hna : (n : ℤ) ∣ a :=
        (ZMod.intCast_zmod_eq_zero_iff_dvd a n).mp ha0
      rcases hna with ⟨b, rfl⟩
      refine ⟨(Int.castRingHom ZHat) b, ?_⟩
      exact zHatMulNat_int n b
    have hyClosure : y ∈ closure (K ∩ D) :=
      (hDdense.open_subset_closure_inter hKopen) hy
    exact (closure_minimal hKD (isClosed_zHatMulNat_range n)) hyClosure
 
theorem zHatMulNat_range_index (n : ℕ) (hn : 0 < n) :
    (zHatMulNat n).toAddMonoidHom.range.index = n := by
  let : NeZero n := ⟨hn.ne'⟩
  rw [zHatMulNat_range_eq_ker_reduction n hn,
    AddSubgroup.index_ker]
  rw [AddMonoidHom.range_eq_top_of_surjective
    (zHatReduction n hn).toAddMonoidHom (zHatReduction_surjective n hn)]
  calc
    Nat.card (↑(⊤ : AddSubgroup (ZMod n))) = Nat.card (ZMod n) :=
      Nat.card_congr
        { toFun := fun x => x.1
          invFun := fun x => ⟨x, AddSubgroup.mem_top x⟩
          left_inv := fun x => Subtype.ext rfl
          right_inv := fun _ => rfl }
    _ = n := Nat.card_zmod n

theorem zHatAddSubgroup_eq_mulNat_range_of_index_ne_zero
    (H : AddSubgroup ZHat) (hH : H.index ≠ 0) :
    H = (zHatMulNat H.index).toAddMonoidHom.range := by
  have hle : (zHatMulNat H.index).toAddMonoidHom.range ≤ H := by
    rintro y ⟨x, rfl⟩
    exact H.nsmul_index_mem x
  have hrangeIndex :
      (zHatMulNat H.index).toAddMonoidHom.range.index = H.index :=
    zHatMulNat_range_index H.index (Nat.pos_of_ne_zero hH)
  have hrel :
      (zHatMulNat H.index).toAddMonoidHom.range.relIndex H = 1 := by
    have heq :
        (zHatMulNat H.index).toAddMonoidHom.range.relIndex H * H.index =
          H.index :=
      (AddSubgroup.relIndex_mul_index hle).trans hrangeIndex
    apply Nat.eq_of_mul_eq_mul_right (Nat.pos_of_ne_zero hH)
    simpa only [one_mul] using heq
  exact le_antisymm (AddSubgroup.relIndex_eq_one.mp hrel) hle

theorem zHatAddSubgroup_eq_mulNat_range_of_index_eq
    (H : AddSubgroup ZHat) {n : ℕ} (hn : 0 < n) (hindex : H.index = n) :
    H = (zHatMulNat n).toAddMonoidHom.range := by
  subst n
  exact zHatAddSubgroup_eq_mulNat_range_of_index_ne_zero H
    (Nat.ne_of_gt hn)
 
noncomputable def zHatMulNatRangeEquiv (n : ℕ) (hn : 0 < n) :
    ZHat ≃ₜ+ (zHatMulNat n).toAddMonoidHom.range := by
  let e : ZHat ≃+ (zHatMulNat n).toAddMonoidHom.range :=
    AddMonoidHom.ofInjective (zHatMulNat_injective hn)
  have he : Continuous e := by
    change Continuous fun x : ZHat =>
      (⟨zHatMulNat n x, ⟨x, rfl⟩⟩ : (zHatMulNat n).toAddMonoidHom.range)
    exact Continuous.subtype_mk (map_continuous (zHatMulNat n)) fun x => ⟨x, rfl⟩
  let h : ZHat ≃ₜ (zHatMulNat n).toAddMonoidHom.range :=
    he.homeoOfEquivCompactToT2
  exact
    { e with
      continuous_toFun := h.continuous
      continuous_invFun := h.symm.continuous }
 
noncomputable def zHatDivide (n : ℕ) (hn : 0 < n) :
    ContinuousAddMonoidHom ((zHatMulNat n).toAddMonoidHom.range) ZHat :=
  (zHatMulNatRangeEquiv n hn).symm
 
@[simp]
theorem zHatMulNat_zHatDivide (n : ℕ) (hn : 0 < n)
    (y : (zHatMulNat n).toAddMonoidHom.range) :
    zHatMulNat n (zHatDivide n hn y) = y.1 := by
  change ((zHatMulNatRangeEquiv n hn)
    ((zHatMulNatRangeEquiv n hn).symm y)).1 = y.1
  exact congrArg Subtype.val ((zHatMulNatRangeEquiv n hn).apply_symm_apply y)
 
@[simp]
theorem zHatDivide_zHatMulNat (n : ℕ) (hn : 0 < n) (x : ZHat) :
    zHatDivide n hn
      ⟨zHatMulNat n x, ⟨x, rfl⟩⟩ = x := by
  change (zHatMulNatRangeEquiv n hn).symm
    ((zHatMulNatRangeEquiv n hn) x) = x
  exact (zHatMulNatRangeEquiv n hn).symm_apply_apply x
end
end ClassFormation
end

/- ClassFieldTheory.AbstractClassFieldTheory.Degree.Fields -/
section
namespace ClassFormation
open CyclicCohomology
noncomputable section
universe u

abbrev ZHatMul : Type 0 := Multiplicative ZHat

structure DegreeData (G : Type*) [Group G] [TopologicalSpace G] where
   
  degree : G →ₜ* ZHatMul
   
  degree_surjective : Function.Surjective degree
variable {G : Type u} [Group G] [TopologicalSpace G]

def baseField (G : Type u) [Group G] [TopologicalSpace G] : ClosedSubgroup G where
  toSubgroup := ⊤
  isClosed' := isClosed_univ
 
@[simp]
theorem baseField_toSubgroup (G : Type u) [Group G] [TopologicalSpace G] :
    (baseField G).toSubgroup = ⊤ :=
  rfl
 
theorem le_baseField (K : ClosedSubgroup G) :
    K.toSubgroup ≤ (baseField G).toSubgroup :=
  le_top
namespace DegreeData
 
def restrictedDegree (D : DegreeData G) (K : ClosedSubgroup G) :
    K.toSubgroup →ₜ* ZHatMul where
  toMonoidHom := D.degree.toMonoidHom.comp K.toSubgroup.subtype
  continuous_toFun := D.degree.continuous_toFun.comp continuous_subtype_val
 
def fieldImage (D : DegreeData G) (K : ClosedSubgroup G) : Subgroup ZHatMul :=
  (D.restrictedDegree K).toMonoidHom.range
 
theorem fieldImage_eq_map (D : DegreeData G) (K : ClosedSubgroup G) :
    D.fieldImage K = K.toSubgroup.map D.degree.toMonoidHom := by
  ext z
  constructor
  · rintro ⟨k, rfl⟩
    exact ⟨k.1, k.2, rfl⟩
  · rintro ⟨g, hg, rfl⟩
    exact ⟨⟨g, hg⟩, rfl⟩
 
def fieldInertiaWithin (D : DegreeData G) (K : ClosedSubgroup G) :
    Subgroup K.toSubgroup :=
  (D.restrictedDegree K).toMonoidHom.ker
 
instance fieldInertiaWithin_normal (D : DegreeData G) (K : ClosedSubgroup G) :
    (D.fieldInertiaWithin K).Normal := by
  rw [fieldInertiaWithin]
  infer_instance

noncomputable def residueDegreeCardinal (D : DegreeData G)
    (K : ClosedSubgroup G) : Cardinal :=
  relativeIndexCardinal
    (show D.fieldImage K ≤ (⊤ : Subgroup ZHatMul) from le_top)
 
def residueQuotient (D : DegreeData G) (K : ClosedSubgroup G) : Type :=
  (⊤ : Subgroup ZHatMul) ⧸ (D.fieldImage K).subgroupOf ⊤
 
@[simp] theorem residueDegreeCardinal_eq_mk_residueQuotient
    (D : DegreeData G) (K : ClosedSubgroup G) :
    D.residueDegreeCardinal K = Cardinal.mk (D.residueQuotient K) :=
  rfl

structure FiniteResidueAbstractField (D : DegreeData G) where
   
  field : ClosedSubgroup G
   
  finiteResidueQuotient : Finite (D.residueQuotient field)
namespace FiniteResidueAbstractField
variable {D : DegreeData G}
 
abbrev toSubgroup (K : FiniteResidueAbstractField D) : Subgroup G :=
  K.field.toSubgroup
 
instance (K : FiniteResidueAbstractField D) :
    Finite (D.residueQuotient K.field) :=
  K.finiteResidueQuotient
 
noncomputable def residueDegree (K : FiniteResidueAbstractField D) : ℕ+ := by
  letI : Nonempty (D.residueQuotient K.field) := ⟨QuotientGroup.mk 1⟩
  exact ⟨Nat.card (D.residueQuotient K.field), Nat.card_pos⟩
 
@[simp] theorem residueDegree_coe (K : FiniteResidueAbstractField D) :
    (K.residueDegree : ℕ) = Nat.card (D.residueQuotient K.field) :=
  rfl
 
@[simp] theorem residueDegreeCardinal_eq_coe
    (K : FiniteResidueAbstractField D) :
    D.residueDegreeCardinal K.field = ((K.residueDegree : ℕ) : Cardinal) := by
  change Cardinal.mk (D.residueQuotient K.field) =
    (Nat.card (D.residueQuotient K.field) : Cardinal)
  exact Nat.cast_card.symm
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

noncomputable def degreeCardinal (E : AbstractExtension G) : Cardinal :=
  relativeIndexCardinal E.below

noncomputable def relativeResidueDegreeCardinal
    (E : AbstractExtension G) (D : DegreeData G) : Cardinal :=
  relativeIndexCardinal (Subgroup.map_mono (f := D.degree.toMonoidHom) E.below)

noncomputable def relativeRamificationIndexCardinal
    (E : AbstractExtension G) (D : DegreeData G) : Cardinal :=
  relativeIndexCardinal
    (show E.field.toSubgroup ⊓ D.degree.toMonoidHom.ker ≤
      E.base.toSubgroup ⊓ D.degree.toMonoidHom.ker from
        inf_le_inf E.below le_rfl)

theorem degreeCardinal_eq_relativeResidueDegreeCardinal_mul_relativeRamificationIndexCardinal
    (E : AbstractExtension G) (D : DegreeData G) :
    E.degreeCardinal =
      Cardinal.lift.{u} (E.relativeResidueDegreeCardinal D) *
        E.relativeRamificationIndexCardinal D := by
  simpa [degreeCardinal, relativeResidueDegreeCardinal,
    relativeRamificationIndexCardinal] using
    (relativeIndexCardinal_eq_map_mul_inf_ker
      D.degree.toMonoidHom E.below)

theorem relativeResidueDegreeCardinal_mul_residueDegreeCardinal
    (E : AbstractExtension G) (D : DegreeData G) :
    E.relativeResidueDegreeCardinal D * D.residueDegreeCardinal E.base =
      D.residueDegreeCardinal E.field := by
  change
    intersectionIndexCardinal
        (E.field.toSubgroup.map D.degree.toMonoidHom)
        (E.base.toSubgroup.map D.degree.toMonoidHom) *
      intersectionIndexCardinal (D.fieldImage E.base) (⊤ : Subgroup ZHatMul) =
        intersectionIndexCardinal (D.fieldImage E.field) (⊤ : Subgroup ZHatMul)
  rw [D.fieldImage_eq_map,
    D.fieldImage_eq_map]
  simpa only [relativeIndexCardinal] using
    (relativeIndexCardinal_mul
      (Subgroup.map_mono (f := D.degree.toMonoidHom) E.below)
      (show E.base.toSubgroup.map D.degree.toMonoidHom ≤
        (⊤ : Subgroup ZHatMul) from le_top))

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

def IsTotallyRamified (E : AbstractExtension G) (D : DegreeData G) : Prop :=
  E.base.toSubgroup.map D.degree.toMonoidHom ≤
    E.field.toSubgroup.map D.degree.toMonoidHom

theorem isTotallyRamified_iff_image_le (E : AbstractExtension G) (D : DegreeData G) :
    E.IsTotallyRamified D ↔
      E.base.toSubgroup.map D.degree.toMonoidHom ≤
        E.field.toSubgroup.map D.degree.toMonoidHom :=
  Iff.rfl
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

def IsTotallyRamified (D : DegreeData G) : Prop :=
  E.toAbstractExtension.IsTotallyRamified D

theorem isTotallyRamified_iff_image_le (D : DegreeData G) :
    E.IsTotallyRamified D ↔
      E.base.toSubgroup.map D.degree.toMonoidHom ≤
        E.field.toSubgroup.map D.degree.toMonoidHom :=
  E.toAbstractExtension.isTotallyRamified_iff_image_le D
 
instance quotientFinite :
    Finite E.quotient := by
  simpa [quotient, subgroup] using E.finiteQuotient

instance representedQuotientFinite :
    Finite
      (E.base.toSubgroup ⧸
        extensionSubgroup E.base E.field E.below) :=
  E.finiteQuotient
private theorem degreeCardinal_lt_aleph0 :
    E.toAbstractExtension.degreeCardinal < Cardinal.aleph0 := by
  change Cardinal.mk
      (E.base.toSubgroup ⧸ extensionSubgroup E.base E.field E.below) <
    Cardinal.aleph0
  exact Cardinal.lt_aleph0_of_finite _
private theorem relativeDegreeCardinals_lt_aleph0 (D : DegreeData G) :
    Cardinal.lift.{u}
          (E.toAbstractExtension.relativeResidueDegreeCardinal D) <
        Cardinal.aleph0 ∧
      E.toAbstractExtension.relativeRamificationIndexCardinal D <
        Cardinal.aleph0 := by
  have hresidueUnlifted :
      E.toAbstractExtension.relativeResidueDegreeCardinal D ≠ 0 := by
    rw [AbstractExtension.relativeResidueDegreeCardinal,
      relativeIndexCardinal, intersectionIndexCardinal]
    exact Cardinal.mk_ne_zero _
  have hresidue :
      Cardinal.lift.{u}
          (E.toAbstractExtension.relativeResidueDegreeCardinal D) ≠ 0 := by
    intro hzero
    exact hresidueUnlifted (Cardinal.lift_eq_zero.mp hzero)
  have hramification :
      E.toAbstractExtension.relativeRamificationIndexCardinal D ≠ 0 := by
    rw [AbstractExtension.relativeRamificationIndexCardinal,
      relativeIndexCardinal, intersectionIndexCardinal]
    exact Cardinal.mk_ne_zero _
  apply (Cardinal.mul_lt_aleph0_iff_of_ne_zero
    hresidue hramification).mp
  rw [← E.toAbstractExtension.degreeCardinal_eq_relativeResidueDegreeCardinal_mul_relativeRamificationIndexCardinal D]
  exact E.degreeCardinal_lt_aleph0
private theorem relativeResidueDegreeCardinal_lt_aleph0
    (D : DegreeData G) :
    E.toAbstractExtension.relativeResidueDegreeCardinal D <
      Cardinal.aleph0 :=
  Cardinal.lift_lt_aleph0.mp (E.relativeDegreeCardinals_lt_aleph0 D).1

noncomputable instance residueQuotientFinite (D : DegreeData G) :
    Finite
      (↥(E.base.toSubgroup.map D.degree.toMonoidHom) ⧸
        (E.field.toSubgroup.map D.degree.toMonoidHom).subgroupOf
          (E.base.toSubgroup.map D.degree.toMonoidHom)) := by
  apply Cardinal.lt_aleph0_iff_finite.mp
  simpa [AbstractExtension.relativeResidueDegreeCardinal,
    relativeIndexCardinal, intersectionIndexCardinal] using
      E.relativeResidueDegreeCardinal_lt_aleph0 D
 
def degree : ℕ+ :=
  by
    letI : Nonempty E.quotient :=
      ⟨QuotientGroup.mk 1⟩
    exact ⟨Nat.card E.quotient, Nat.card_pos⟩
 
def residueDegree (D : DegreeData G) : ℕ+ :=
  ⟨Nat.card
      (↥(E.base.toSubgroup.map D.degree.toMonoidHom) ⧸
        (E.field.toSubgroup.map D.degree.toMonoidHom).subgroupOf
          (E.base.toSubgroup.map D.degree.toMonoidHom)),
    Nat.card_pos⟩
 
@[simp] theorem degree_coe :
    (E.degree : ℕ) = Nat.card E.quotient :=
  rfl
 
@[simp] theorem residueDegree_coe (D : DegreeData G) :
    (E.residueDegree D : ℕ) =
      Nat.card
        (↥(E.base.toSubgroup.map D.degree.toMonoidHom) ⧸
          (E.field.toSubgroup.map D.degree.toMonoidHom).subgroupOf
            (E.base.toSubgroup.map D.degree.toMonoidHom)) :=
  rfl

@[simp] theorem extensionSubgroup_index_eq_degree :
    (extensionSubgroup E.base E.field E.below).index = (E.degree : ℕ) := by
  rw [Subgroup.index, E.degree_coe]
  rfl

@[simp] theorem mapped_relIndex_eq_residueDegree (D : DegreeData G) :
    (E.field.toSubgroup.map D.degree.toMonoidHom).relIndex
        (E.base.toSubgroup.map D.degree.toMonoidHom) =
      (E.residueDegree D : ℕ) := by
  rw [Subgroup.relIndex, Subgroup.index, E.residueDegree_coe]
 
theorem residueDegree_eq_one_of_isTotallyRamified (D : DegreeData G)
    (hE : E.IsTotallyRamified D) :
    (E.residueDegree D : ℕ) = 1 := by
  rw [← E.mapped_relIndex_eq_residueDegree D,
    Subgroup.relIndex_eq_one]
  exact hE

theorem isTotallyRamified_iff_residueDegree_eq_one (D : DegreeData G) :
    E.IsTotallyRamified D ↔ (E.residueDegree D : ℕ) = 1 := by
  constructor
  · exact E.residueDegree_eq_one_of_isTotallyRamified D
  · intro h
    rw [isTotallyRamified_iff_image_le]
    rw [← E.mapped_relIndex_eq_residueDegree D,
      Subgroup.relIndex_eq_one] at h
    exact h

theorem isTotallyRamified_of_residueDegree_eq_one (D : DegreeData G)
    (h : (E.residueDegree D : ℕ) = 1) : E.IsTotallyRamified D :=
  (E.isTotallyRamified_iff_residueDegree_eq_one D).2 h

@[simp] theorem relativeResidueDegreeCardinal_eq_coe (D : DegreeData G) :
    E.toAbstractExtension.relativeResidueDegreeCardinal D =
      ((E.residueDegree D : ℕ) : Cardinal) := by
  change Cardinal.mk
    (↥(E.base.toSubgroup.map D.degree.toMonoidHom) ⧸
      (E.field.toSubgroup.map D.degree.toMonoidHom).subgroupOf
        (E.base.toSubgroup.map D.degree.toMonoidHom)) =
      (Nat.card
        (↥(E.base.toSubgroup.map D.degree.toMonoidHom) ⧸
          (E.field.toSubgroup.map D.degree.toMonoidHom).subgroupOf
            (E.base.toSubgroup.map D.degree.toMonoidHom)) : Cardinal)
  exact (Nat.cast_card).symm
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
variable {D : DegreeData G}

noncomputable def ofRelativeInclusion (D : DegreeData G)
    (field : ClosedSubgroup G) (base : FiniteResidueAbstractField D)
    (below : field.toSubgroup ≤ base.field.toSubgroup)
    [finiteRelativeResidueQuotient : Finite
      (↥(base.field.toSubgroup.map D.degree.toMonoidHom) ⧸
        (field.toSubgroup.map D.degree.toMonoidHom).subgroupOf
          (base.field.toSubgroup.map D.degree.toMonoidHom))] :
    FiniteResidueAbstractField D where
  field := field
  finiteResidueQuotient := by
    apply Cardinal.lt_aleph0_iff_finite.mp
    rw [← D.residueDegreeCardinal_eq_mk_residueQuotient]
    let E : AbstractExtension G := {
      field := field
      base := base.field
      below := below
    }
    rw [← E.relativeResidueDegreeCardinal_mul_residueDegreeCardinal D]
    apply Cardinal.mul_lt_aleph0_iff.mpr
    exact Or.inr (Or.inr ⟨by
      change Cardinal.mk
          (↥(base.field.toSubgroup.map D.degree.toMonoidHom) ⧸
            (field.toSubgroup.map D.degree.toMonoidHom).subgroupOf
              (base.field.toSubgroup.map D.degree.toMonoidHom)) <
        Cardinal.aleph0
      exact Cardinal.lt_aleph0_of_finite _, by
      rw [D.residueDegreeCardinal_eq_mk_residueQuotient]
      exact Cardinal.lt_aleph0_of_finite _⟩)
end FiniteResidueAbstractField

structure FiniteResidueAbstractExtension (D : DegreeData G) where
   
  field : FiniteResidueAbstractField D
   
  base : FiniteResidueAbstractField D
   
  below : field.field.toSubgroup ≤ base.field.toSubgroup
   
  finiteQuotient :
    Finite
      (base.field.toSubgroup ⧸
        extensionSubgroup base.field field.field below)
namespace FiniteResidueAbstractExtension
variable {D : DegreeData G}
 
def toFiniteAbstractExtension (E : FiniteResidueAbstractExtension D) :
    FiniteAbstractExtension G where
  field := E.field.field
  base := E.base.field
  below := E.below
  finiteQuotient := E.finiteQuotient
 
instance (E : FiniteResidueAbstractExtension D) :
    Finite
      (E.base.field.toSubgroup ⧸
        extensionSubgroup E.base.field E.field.field E.below) :=
  E.finiteQuotient
 
noncomputable def residueDegree (E : FiniteResidueAbstractExtension D) : ℕ+ :=
  E.toFiniteAbstractExtension.residueDegree D
end FiniteResidueAbstractExtension
end DegreeData
 
structure FiniteAbstractField (G : Type u) [Group G] [TopologicalSpace G] where
   
  field : ClosedSubgroup G
   
  finite : Finite ((baseField G).toSubgroup ⧸
    extensionSubgroup (baseField G) field (le_baseField field))
namespace FiniteAbstractField

def toFiniteAbstractExtension (K : FiniteAbstractField G) :
    DegreeData.FiniteAbstractExtension G where
  field := K.field
  base := baseField G
  below := le_baseField K.field
  finiteQuotient := K.finite
 
instance (K : FiniteAbstractField G) :
    Finite ((baseField G).toSubgroup ⧸
      extensionSubgroup (baseField G) K.field (le_baseField K.field)) :=
  K.finite

noncomputable abbrev toFiniteResidueAbstractField
    (K : FiniteAbstractField G) (D : DegreeData G) :
    DegreeData.FiniteResidueAbstractField D where
  field := K.field
  finiteResidueQuotient := by
    apply Cardinal.lt_aleph0_iff_finite.mp
    change
      intersectionIndexCardinal (D.fieldImage K.field)
        (⊤ : Subgroup ZHatMul) < Cardinal.aleph0
    rw [D.fieldImage_eq_map]
    have htop :
        (baseField G).toSubgroup.map D.degree.toMonoidHom = ⊤ := by
      rw [baseField_toSubgroup]
      exact Subgroup.map_top_of_surjective _ D.degree_surjective
    rw [← htop]
    simpa only [FiniteAbstractField.toFiniteAbstractExtension,
      DegreeData.AbstractExtension.relativeResidueDegreeCardinal, relativeIndexCardinal] using
      K.toFiniteAbstractExtension.relativeResidueDegreeCardinal_lt_aleph0 D

noncomputable def residueDegree (K : FiniteAbstractField G)
    (D : DegreeData G) : ℕ+ :=
  (K.toFiniteResidueAbstractField D).residueDegree
end FiniteAbstractField

structure FiniteAbstractFieldExtension (G : Type u)
    [Group G] [TopologicalSpace G] where
   
  field : FiniteAbstractField G
   
  base : FiniteAbstractField G
   
  below : field.field.toSubgroup ≤ base.field.toSubgroup
   
  finiteQuotient :
    Finite
      (base.field.toSubgroup ⧸
        extensionSubgroup base.field field.field below)
namespace FiniteAbstractFieldExtension
 
abbrev toFiniteAbstractExtension (E : FiniteAbstractFieldExtension G) :
    DegreeData.FiniteAbstractExtension G where
  field := E.field.field
  base := E.base.field
  below := E.below
  finiteQuotient := E.finiteQuotient
 
def IsTotallyRamified (E : FiniteAbstractFieldExtension G)
    (D : DegreeData G) : Prop :=
  E.toFiniteAbstractExtension.IsTotallyRamified D
 
noncomputable def residueDegree (E : FiniteAbstractFieldExtension G)
    (D : DegreeData G) : ℕ+ :=
  E.toFiniteAbstractExtension.residueDegree D
 
instance (E : FiniteAbstractFieldExtension G) :
    Finite
      (E.base.field.toSubgroup ⧸
        extensionSubgroup E.base.field E.field.field E.below) :=
  E.finiteQuotient
 
noncomputable def toFiniteResidueAbstractExtension
    (E : FiniteAbstractFieldExtension G) (D : DegreeData G) :
    DegreeData.FiniteResidueAbstractExtension D where
  field := E.field.toFiniteResidueAbstractField D
  base := E.base.toFiniteResidueAbstractField D
  below := E.below
  finiteQuotient := E.finiteQuotient
end FiniteAbstractFieldExtension
end
end ClassFormation
end

/- ClassFieldTheory.AbstractClassFieldTheory.Degree.Frobenius -/
section
namespace ClassFormation
noncomputable section
variable {G : Type*} [Group G] [TopologicalSpace G]
namespace DegreeData
 
def fieldImageAdd (D : DegreeData G) (K : ClosedSubgroup G) : AddSubgroup ZHat :=
  Subgroup.toAddSubgroup' (D.fieldImage K)
 
@[simp]
theorem fieldImageAdd_index (D : DegreeData G)
    (K : FiniteResidueAbstractField D) :
    (D.fieldImageAdd K.field).index = (K.residueDegree : ℕ) := by
  change (D.fieldImage K.field).index = (K.residueDegree : ℕ)
  rw [← Subgroup.relIndex_top_right]
  change Nat.card (D.residueQuotient K.field) = (K.residueDegree : ℕ)
  exact K.residueDegree_coe.symm
 
theorem fieldImageAdd_eq_mulNat_range (D : DegreeData G)
    (K : FiniteResidueAbstractField D) :
    D.fieldImageAdd K.field =
      (zHatMulNat (K.residueDegree : ℕ)).toAddMonoidHom.range := by
  apply zHatAddSubgroup_eq_mulNat_range_of_index_eq
  · exact K.residueDegree.property
  · exact D.fieldImageAdd_index K
 
def restrictedDegreeInMulNatRange (D : DegreeData G)
    (K : FiniteResidueAbstractField D) (k : K.field.toSubgroup) :
    (zHatMulNat (K.residueDegree : ℕ)).toAddMonoidHom.range := by
  refine ⟨(D.degree k.1).toAdd, ?_⟩
  rw [← D.fieldImageAdd_eq_mulNat_range K]
  change D.degree k.1 ∈ D.fieldImage K.field
  exact ⟨k, rfl⟩
 
def normalizedDegree (D : DegreeData G) (K : FiniteResidueAbstractField D) :
    K.field.toSubgroup →ₜ* ZHatMul where
  toFun k := Multiplicative.ofAdd
    (zHatDivide (K.residueDegree : ℕ) K.residueDegree.property
      (D.restrictedDegreeInMulNatRange K k))
  map_one' := by
    apply Multiplicative.ext
    change zHatDivide (K.residueDegree : ℕ) K.residueDegree.property
      (D.restrictedDegreeInMulNatRange K 1) = 0
    rw [show D.restrictedDegreeInMulNatRange K 1 = 0 by
      apply Subtype.ext
      exact congrArg Multiplicative.toAdd (map_one D.degree)]
    exact map_zero (zHatDivide (K.residueDegree : ℕ) K.residueDegree.property)
  map_mul' x y := by
    apply Multiplicative.ext
    change zHatDivide (K.residueDegree : ℕ) K.residueDegree.property
        (D.restrictedDegreeInMulNatRange K (x * y)) =
      zHatDivide (K.residueDegree : ℕ) K.residueDegree.property
          (D.restrictedDegreeInMulNatRange K x) +
        zHatDivide (K.residueDegree : ℕ) K.residueDegree.property
          (D.restrictedDegreeInMulNatRange K y)
    rw [show D.restrictedDegreeInMulNatRange K (x * y) =
        D.restrictedDegreeInMulNatRange K x +
          D.restrictedDegreeInMulNatRange K y by
      apply Subtype.ext
      exact congrArg Multiplicative.toAdd
        (map_mul D.degree x.1 y.1)]
    exact map_add (zHatDivide (K.residueDegree : ℕ) K.residueDegree.property) _ _
  continuous_toFun := by
    apply (map_continuous
      (zHatDivide (K.residueDegree : ℕ) K.residueDegree.property)).comp
    exact Continuous.subtype_mk
      (D.restrictedDegree K.field).continuous_toFun
      (fun k => (D.restrictedDegreeInMulNatRange K k).2)
 
theorem residueDegree_nsmul_normalizedDegree (D : DegreeData G)
    (K : FiniteResidueAbstractField D) (k : K.field.toSubgroup) :
    (K.residueDegree : ℕ) • (D.normalizedDegree K k).toAdd =
      (D.degree k.1).toAdd := by
  exact zHatMulNat_zHatDivide (K.residueDegree : ℕ) K.residueDegree.property
    (D.restrictedDegreeInMulNatRange K k)
 
theorem normalizedDegree_surjective (D : DegreeData G)
    (K : FiniteResidueAbstractField D) :
    Function.Surjective (D.normalizedDegree K) := by
  intro z
  have hzImageAdd : (K.residueDegree : ℕ) • z.toAdd ∈
      D.fieldImageAdd K.field := by
    rw [D.fieldImageAdd_eq_mulNat_range K]
    exact ⟨z.toAdd, rfl⟩
  have hzImage : Multiplicative.ofAdd ((K.residueDegree : ℕ) • z.toAdd) ∈
      D.fieldImage K.field := hzImageAdd
  obtain ⟨k, hk⟩ := hzImage
  refine ⟨k, ?_⟩
  apply Multiplicative.ext
  apply zHatMulNat_injective K.residueDegree.property
  change (K.residueDegree : ℕ) • (D.normalizedDegree K k).toAdd =
    (K.residueDegree : ℕ) • z.toAdd
  rw [D.residueDegree_nsmul_normalizedDegree K k]
  exact congrArg Multiplicative.toAdd hk
 
theorem normalizedDegree_ker (D : DegreeData G)
    (K : FiniteResidueAbstractField D) :
    (D.normalizedDegree K).toMonoidHom.ker = D.fieldInertiaWithin K.field := by
  ext k
  constructor
  · intro hk
    change D.degree k.1 = 1
    apply Multiplicative.ext
    rw [← D.residueDegree_nsmul_normalizedDegree K k]
    change (K.residueDegree : ℕ) • (D.normalizedDegree K k).toAdd = 0
    rw [show D.normalizedDegree K k = 1 from hk]
    simp
  · intro hk
    apply Multiplicative.ext
    apply zHatMulNat_injective K.residueDegree.property
    change (K.residueDegree : ℕ) • (D.normalizedDegree K k).toAdd =
      (K.residueDegree : ℕ) • (1 : ZHatMul).toAdd
    rw [D.residueDegree_nsmul_normalizedDegree K k]
    rw [show D.degree k.1 = 1 from hk]
    simp

theorem FiniteResidueAbstractExtension.residueDegree_mul_absoluteResidueDegree
    (D : DegreeData G) (E : FiniteResidueAbstractExtension D) :
    (E.residueDegree : ℕ) * (E.base.residueDegree : ℕ) =
      (E.field.residueDegree : ℕ) := by
  have h :=
    AbstractExtension.relativeResidueDegreeCardinal_mul_residueDegreeCardinal
      E.toFiniteAbstractExtension.toAbstractExtension D
  rw [E.toFiniteAbstractExtension.relativeResidueDegreeCardinal_eq_coe D] at h
  change ((E.residueDegree : ℕ) : Cardinal) *
      D.residueDegreeCardinal E.base.field =
    D.residueDegreeCardinal E.field.field at h
  rw [E.base.residueDegreeCardinal_eq_coe,
    E.field.residueDegreeCardinal_eq_coe] at h
  exact_mod_cast h

theorem frobeniusRestrictionNaturality_normalizedDegree (D : DegreeData G)
    (E : FiniteResidueAbstractExtension D)
    (l : E.field.field.toSubgroup) :
    (D.normalizedDegree E.base (Subgroup.inclusion E.below l)).toAdd =
      (E.residueDegree : ℕ) •
        (D.normalizedDegree E.field l).toAdd := by
  apply zHatMulNat_injective E.base.residueDegree.property
  change (E.base.residueDegree : ℕ) •
      (D.normalizedDegree E.base (Subgroup.inclusion E.below l)).toAdd =
    (E.base.residueDegree : ℕ) •
      ((E.residueDegree : ℕ) •
        (D.normalizedDegree E.field l).toAdd)
  rw [D.residueDegree_nsmul_normalizedDegree E.base]
  change (D.degree l.1).toAdd = _
  rw [smul_smul, Nat.mul_comm (E.base.residueDegree : ℕ),
    E.residueDegree_mul_absoluteResidueDegree D,
    D.residueDegree_nsmul_normalizedDegree E.field]
end DegreeData
end
end ClassFormation
end

/- ClassFieldTheory.AbstractClassFieldTheory.Degree.FrobeniusLift -/
section
namespace ClassFormation
open CyclicCohomology
noncomputable section
universe u
variable {G : Type u} [Group G] [TopologicalSpace G]

theorem exists_positive_nsmul_one_sub_mem_of_index_ne_zero
    (H : AddSubgroup ZHat) (hH : H.index ≠ 0) (z : ZHat) :
    ∃ n : ℕ, 0 < n ∧ z - n • (1 : ZHat) ∈ H := by
  let m := H.index
  have hm : 0 < m := Nat.pos_of_ne_zero hH
  let r : ZMod m := zHatReduction m hm z
  let n : ℕ := r.val + m
  refine ⟨n, Nat.add_pos_right r.val hm, ?_⟩
  rw [zHatAddSubgroup_eq_mulNat_range_of_index_ne_zero H hH,
    zHatMulNat_range_eq_ker_reduction m hm]
  change zHatReduction m hm (z - n • (1 : ZHat)) = 0
  rw [map_sub, map_nsmul]
  have hredOne : zHatReduction m hm (1 : ZHat) = 1 :=
    rfl
  rw [hredOne]
  change zHatReduction m hm z - n • (1 : ZMod m) = 0
  rw [nsmul_eq_mul, mul_one]
  change r - (n : ZMod m) = 0
  have : NeZero m := ⟨Nat.ne_of_gt hm⟩
  have hn : (n : ZMod m) = r := by
    change ((r.val + m : ℕ) : ZMod m) = r
    rw [Nat.cast_add, ZMod.natCast_zmod_val, ZMod.natCast_self, add_zero]
  rw [hn, sub_self]
namespace DegreeData
 
def extensionInertiaWithin (D : DegreeData G) (K L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.toSubgroup) : Subgroup K.toSubgroup :=
  extensionSubgroup K L hLK ⊓ D.fieldInertiaWithin K

instance extensionInertiaWithin_normal (D : DegreeData G)
    (K L : ClosedSubgroup G) (hLK : L.toSubgroup ≤ K.toSubgroup)
    [hLnormal : (extensionSubgroup K L hLK).Normal] :
    (D.extensionInertiaWithin K L hLK).Normal := by
  rw [extensionInertiaWithin]
  infer_instance
private theorem extensionInertiaWithin_le_normalizedDegree_ker
    (D : DegreeData G) (K : FiniteResidueAbstractField D)
    (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup) :
    D.extensionInertiaWithin K.field L hLK ≤
      (D.normalizedDegree K).toMonoidHom.ker := by
  intro x hx
  rw [D.normalizedDegree_ker K]
  exact hx.2
 
def extensionNormalizedDegree (D : DegreeData G)
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal] :
    (K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK) →* ZHatMul :=
  QuotientGroup.lift (D.extensionInertiaWithin K.field L hLK)
    (D.normalizedDegree K).toMonoidHom
    (D.extensionInertiaWithin_le_normalizedDegree_ker K L hLK)

@[simp]
theorem extensionNormalizedDegree_mk (D : DegreeData G)
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (k : K.field.toSubgroup) :
    D.extensionNormalizedDegree K L hLK (QuotientGroup.mk k) =
      D.normalizedDegree K k :=
  rfl
 
def extensionRestriction (D : DegreeData G) (K L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.toSubgroup)
    [hLnormal : (extensionSubgroup K L hLK).Normal] :
    (K.toSubgroup ⧸ D.extensionInertiaWithin K L hLK) →*
      (K.toSubgroup ⧸ extensionSubgroup K L hLK) :=
  QuotientGroup.map (D.extensionInertiaWithin K L hLK)
    (extensionSubgroup K L hLK) (MonoidHom.id K.toSubgroup) inf_le_left

@[simp]
theorem extensionRestriction_mk (D : DegreeData G)
    (K L : ClosedSubgroup G) (hLK : L.toSubgroup ≤ K.toSubgroup)
    [hLnormal : (extensionSubgroup K L hLK).Normal]
    (k : K.toSubgroup) :
    D.extensionRestriction K L hLK (QuotientGroup.mk k) =
      QuotientGroup.mk k :=
  rfl

def FrobeniusElements (D : DegreeData G)
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal] : Type u :=
  {σ : K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK //
    ∃ n : ℕ, 0 < n ∧
      D.extensionNormalizedDegree K L hLK σ =
        (Multiplicative.ofAdd (1 : ZHat)) ^ n}
 
def frobeniusRestriction (D : DegreeData G)
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal] :
    D.FrobeniusElements K L hLK →
      (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK) :=
  fun σ => D.extensionRestriction K.field L hLK σ.1
private def normalizedExtensionImageAdd (D : DegreeData G)
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup) : AddSubgroup ZHat :=
  Subgroup.toAddSubgroup'
    ((extensionSubgroup K.field L hLK).map
      (D.normalizedDegree K).toMonoidHom)
private theorem normalizedExtensionImageAdd_index_ne_zero
    (D : DegreeData G) (K : FiniteResidueAbstractField D)
    (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [Finite (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK)] :
    (D.normalizedExtensionImageAdd K L hLK).index ≠ 0 := by
  let E := extensionSubgroup K.field L hLK
  let dK := (D.normalizedDegree K).toMonoidHom
  let H := E.map dK
  have hE : E ≤ H.comap dK := Subgroup.le_comap_map dK E
  have hdvd : (H.comap dK).index ∣ E.index :=
    Subgroup.index_dvd_of_le hE
  have hcomap : (H.comap dK).index = H.index :=
    Subgroup.index_comap_of_surjective H (D.normalizedDegree_surjective K)
  have hHdvd : H.index ∣ E.index := hcomap ▸ hdvd
  have hE0 : E.index ≠ 0 := E.index_ne_zero_of_finite
  have hH0 : H.index ≠ 0 := by
    intro hzero
    rw [hzero] at hHdvd
    exact hE0 (zero_dvd_iff.mp hHdvd)
  exact hH0

theorem frobeniusRestriction_surjective (D : DegreeData G)
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    [hLfinite : Finite (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK)] :
    Function.Surjective (D.frobeniusRestriction K L hLK) := by
  intro σ
  refine Quotient.inductionOn' σ ?_
  intro s
  let H := D.normalizedExtensionImageAdd K L hLK
  have hH0 : H.index ≠ 0 :=
    D.normalizedExtensionImageAdd_index_ne_zero K L hLK
  obtain ⟨n, hn, hmem⟩ :=
    exists_positive_nsmul_one_sub_mem_of_index_ne_zero H hH0
      (D.normalizedDegree K s).toAdd
  have hneg : n • (1 : ZHat) - (D.normalizedDegree K s).toAdd ∈ H := by
    simpa [sub_eq_add_neg, add_comm] using H.neg_mem hmem
  change Multiplicative.ofAdd
      (n • (1 : ZHat) - (D.normalizedDegree K s).toAdd) ∈
    (extensionSubgroup K.field L hLK).map
      (D.normalizedDegree K).toMonoidHom at hneg
  obtain ⟨l, hlE, hdl⟩ := hneg
  let t : K.field.toSubgroup := s * l
  let q : K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK :=
    QuotientGroup.mk t
  have hdq : D.extensionNormalizedDegree K L hLK q =
      (Multiplicative.ofAdd (1 : ZHat)) ^ n := by
    apply Multiplicative.ext
    change (D.normalizedDegree K (s * l)).toAdd =
      n • (1 : ZHat)
    rw [map_mul]
    change (D.normalizedDegree K s).toAdd +
        (D.normalizedDegree K l).toAdd = n • (1 : ZHat)
    have hdl' := congrArg Multiplicative.toAdd hdl
    change (D.normalizedDegree K l).toAdd =
      n • (1 : ZHat) - (D.normalizedDegree K s).toAdd at hdl'
    rw [hdl']
    abel
  let qF : D.FrobeniusElements K L hLK := ⟨q, n, hn, hdq⟩
  refine ⟨qF, ?_⟩
  change QuotientGroup.mk (s * l) = QuotientGroup.mk s
  apply QuotientGroup.eq.mpr
  change (s * l)⁻¹ * s ∈ extensionSubgroup K.field L hLK
  simpa [mul_inv_rev, mul_assoc] using
    (extensionSubgroup K.field L hLK).inv_mem hlE
end DegreeData
end
end ClassFormation
end

/- ClassFieldTheory.AbstractClassFieldTheory.Degree.FrobeniusFixedField -/
section
namespace ClassFormation
open CyclicCohomology
noncomputable section
universe u
variable {G : Type u} [Group G] [TopologicalSpace G]

private def continuousQuotientLift
    {A : Type*} {B : Type*} [Group A] [TopologicalSpace A]
    [Group B] [TopologicalSpace B]
    (N : Subgroup A) [N.Normal] (f : A →ₜ* B)
    (hN : N ≤ f.toMonoidHom.ker) : A ⧸ N →ₜ* B := by
  let φ : A ⧸ N →* B := QuotientGroup.lift N f.toMonoidHom hN
  have hcomp : Continuous (fun x : A => φ (QuotientGroup.mk' N x)) := by
    simpa [φ, QuotientGroup.lift_mk'] using f.continuous_toFun
  exact
    { toMonoidHom := φ
      continuous_toFun :=
        (QuotientGroup.isQuotientMap_mk (G := A) (N := N)).continuous_iff.2 hcomp }
 
private def continuousSubgroupSubtype
    {A : Type*} [Group A] [TopologicalSpace A]
    (H : Subgroup A) : H →ₜ* A where
  toMonoidHom := H.subtype
  continuous_toFun := continuous_subtype_val
 
def zHatPowNat (n : ℕ) : ZHatMul →ₜ* ZHatMul where
  toFun z := Multiplicative.ofAdd (zHatMulNat n z.toAdd)
  map_one' := by
    apply Multiplicative.ext
    simp [zHatMulNat]
  map_mul' x y := by
    apply Multiplicative.ext
    exact nsmul_add x.toAdd y.toAdd n
  continuous_toFun := map_continuous (zHatMulNat n)
 
@[simp]
theorem zHatPowNat_one (n : ℕ) :
    zHatPowNat n
        (Multiplicative.ofAdd (1 : ZHat)) =
      (Multiplicative.ofAdd (1 : ZHat)) ^ n := by
  apply Multiplicative.ext
  rfl
namespace DegreeData
 
def frobeniusExponent (D : DegreeData G) (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (σ : D.FrobeniusElements K L hLK) : ℕ :=
  Exists.choose σ.2
 
theorem frobeniusExponent_pos (D : DegreeData G) (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (σ : D.FrobeniusElements K L hLK) :
    0 < D.frobeniusExponent K L hLK σ :=
  (Exists.choose_spec σ.2).1
 
theorem extensionNormalizedDegree_frobenius_eq_pow (D : DegreeData G)
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (σ : D.FrobeniusElements K L hLK) :
    D.extensionNormalizedDegree K L hLK σ.1 =
      (Multiplicative.ofAdd (1 : ZHat)) ^
          D.frobeniusExponent K L hLK σ :=
  (Exists.choose_spec σ.2).2
 
def extensionNormalizedDegreeContinuous (D : DegreeData G)
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal] :
    (K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK) →ₜ* ZHatMul :=
  { toMonoidHom := D.extensionNormalizedDegree K L hLK
    continuous_toFun :=
      (continuousQuotientLift (D.extensionInertiaWithin K.field L hLK)
        (D.normalizedDegree K)
        (by
          intro x hx
          rw [D.normalizedDegree_ker K]
          exact hx.2)).continuous_toFun }
 
@[simp]
theorem extensionNormalizedDegreeContinuous_apply (D : DegreeData G)
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (x : K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK) :
    D.extensionNormalizedDegreeContinuous K L hLK x =
      D.extensionNormalizedDegree K L hLK x :=
  rfl
 
theorem extensionNormalizedDegreeContinuous_surjective (D : DegreeData G)
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal] :
    Function.Surjective
      (D.extensionNormalizedDegreeContinuous K L hLK) := by
  intro z
  obtain ⟨k, hk⟩ := D.normalizedDegree_surjective K z
  refine ⟨QuotientGroup.mk k, ?_⟩
  simpa using hk

def extensionDegreeKernelRestriction (D : DegreeData G)
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal] :
    (D.extensionNormalizedDegreeContinuous K L hLK).toMonoidHom.ker →*
      (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK) :=
  (D.extensionRestriction K.field L hLK).comp
    (D.extensionNormalizedDegreeContinuous K L hLK).toMonoidHom.ker.subtype
 
theorem extensionDegreeKernelRestriction_injective (D : DegreeData G)
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal] :
    Function.Injective
      (D.extensionDegreeKernelRestriction K L hLK) := by
  intro a b hab
  let c := (a.1 : K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK)⁻¹ * b.1
  have hcRestriction : D.extensionRestriction K.field L hLK c = 1 := by
    dsimp [c]
    rw [map_mul, map_inv]
    change (D.extensionDegreeKernelRestriction K L hLK a)⁻¹ *
        D.extensionDegreeKernelRestriction K L hLK b = 1
    rw [hab, inv_mul_cancel]
  have hcDegree :
      D.extensionNormalizedDegreeContinuous K L hLK c = 1 := by
    dsimp [c]
    rw [map_mul, map_inv]
    change (D.extensionNormalizedDegreeContinuous K L hLK a.1)⁻¹ *
        D.extensionNormalizedDegreeContinuous K L hLK b.1 = 1
    have ha : D.extensionNormalizedDegreeContinuous K L hLK a.1 = 1 := a.2
    have hb : D.extensionNormalizedDegreeContinuous K L hLK b.1 = 1 := b.2
    rw [ha, hb, inv_one, one_mul]
  obtain ⟨k, hk⟩ := QuotientGroup.mk'_surjective
    (D.extensionInertiaWithin K.field L hLK) c
  have hkE : k ∈ extensionSubgroup K.field L hLK := by
    apply (QuotientGroup.eq_one_iff k).mp
    rw [← hk] at hcRestriction
    simpa using hcRestriction
  have hkI : k ∈ D.fieldInertiaWithin K.field := by
    rw [← D.normalizedDegree_ker K]
    change D.normalizedDegree K k = 1
    rw [← hk] at hcDegree
    simpa using hcDegree
  have hkc : k ∈ D.extensionInertiaWithin K.field L hLK :=
    ⟨hkE, hkI⟩
  have hcOne : c = 1 := by
    rw [← hk]
    exact (QuotientGroup.eq_one_iff k).mpr hkc
  apply Subtype.ext
  exact inv_mul_eq_one.mp hcOne

def frobeniusClosure (D : DegreeData G) [IsTopologicalGroup G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (σ : D.FrobeniusElements K L hLK) :
    ClosedSubgroup
      (K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK) :=
  closedSubgroupGenerated
    (Set.range (fun _ : Unit => σ.1))
 
def frobeniusInClosure (D : DegreeData G) [IsTopologicalGroup G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (σ : D.FrobeniusElements K L hLK) :
    D.frobeniusClosure K L hLK σ :=
  closedSubgroupGeneratedMap (fun _ : Unit => σ.1) ()
 
instance frobeniusClosure_isTopologicalGroup
    (D : DegreeData G) [IsTopologicalGroup G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (σ : D.FrobeniusElements K L hLK) :
    IsTopologicalGroup (D.frobeniusClosure K L hLK σ) := by
  change IsTopologicalGroup
    ↑((D.frobeniusClosure K L hLK σ).toSubgroup)
  infer_instance
 
theorem frobeniusInClosure_topologicallyGenerates
    (D : DegreeData G) [IsTopologicalGroup G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (σ : D.FrobeniusElements K L hLK) :
    TopologicallyGenerates
      ({D.frobeniusInClosure K L hLK σ} : Set
        (D.frobeniusClosure K L hLK σ)) := by
  let φ : Unit →
      (K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK) :=
    fun _ => σ.1
  have hgen := closedSubgroupGeneratedMap_topologicallyGenerates φ
  have hrange : Set.range (closedSubgroupGeneratedMap φ) =
      ({closedSubgroupGeneratedMap φ ()} : Set
        (closedSubgroupGenerated (Set.range φ))) := by
    ext x
    simp only [Set.mem_range, Set.mem_singleton_iff]
    constructor
    · rintro ⟨u, rfl⟩
      cases u
      rfl
    · intro hx
      exact ⟨(), hx.symm⟩
  rw [hrange] at hgen
  change TopologicallyGenerates
    ({closedSubgroupGeneratedMap φ ()} : Set
      (closedSubgroupGenerated (Set.range φ) : Subgroup _))
  exact hgen
 
def frobeniusClosureDegree (D : DegreeData G) [IsTopologicalGroup G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (σ : D.FrobeniusElements K L hLK) :
    D.frobeniusClosure K L hLK σ →ₜ* ZHatMul :=
  (D.extensionNormalizedDegreeContinuous K L hLK).comp
    (continuousSubgroupSubtype
      (D.frobeniusClosure K L hLK σ).toSubgroup)
 
@[simp]
theorem frobeniusClosureDegree_generator (D : DegreeData G)
    [IsTopologicalGroup G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (σ : D.FrobeniusElements K L hLK) :
    D.frobeniusClosureDegree K L hLK σ
        (D.frobeniusInClosure K L hLK σ) =
      (Multiplicative.ofAdd (1 : ZHat)) ^
          D.frobeniusExponent K L hLK σ := by
  change D.extensionNormalizedDegree K L hLK
      (D.frobeniusInClosure K L hLK σ).1 =
    (Multiplicative.ofAdd (1 : ZHat)) ^
      D.frobeniusExponent K L hLK σ
  have hval :
      (D.frobeniusInClosure K L hLK σ).1 = σ.1 := rfl
  rw [hval]
  exact D.extensionNormalizedDegree_frobenius_eq_pow K L hLK σ

theorem frobeniusClosureDegree_range (D : DegreeData G)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (σ : D.FrobeniusElements K L hLK) :
    (D.frobeniusClosureDegree K L hLK σ).toMonoidHom.range =
      AddSubgroup.toSubgroup
        ((zHatMulNat (D.frobeniusExponent K L hLK σ)).toAddMonoidHom.range) := by
  let : CompactSpace K.field.toSubgroup := by
    change CompactSpace K.field
    infer_instance
  let Γ := D.frobeniusClosure K L hLK σ
  let x : Γ := D.frobeniusInClosure K L hLK σ
  let f : Γ →ₜ* ZHatMul :=
    D.frobeniusClosureDegree K L hLK σ
  let n := D.frobeniusExponent K L hLK σ
  let R : Subgroup ZHatMul :=
    AddSubgroup.toSubgroup ((zHatMulNat n).toAddMonoidHom.range)
  have hn : 0 < n := D.frobeniusExponent_pos K L hLK σ
  have hxgen : TopologicallyGenerates ({x} : Set Γ) := by
    simpa [Γ, x] using
      D.frobeniusInClosure_topologicallyGenerates K L hLK σ
  have hfx : f x =
      (Multiplicative.ofAdd (1 : ZHat)) ^ n := by
    change D.frobeniusClosureDegree K L hLK σ
        (D.frobeniusInClosure K L hLK σ) =
      (Multiplicative.ofAdd (1 : ZHat)) ^
          D.frobeniusExponent K L hLK σ
    exact D.frobeniusClosureDegree_generator K L hLK σ
  have hRclosed : IsClosed (R : Set ZHatMul) := by
    exact isClosed_zHatMulNat_range n
  have hclosed_le_R :
      (closedSubgroupGenerated ({f x} : Set ZHatMul) : Subgroup ZHatMul) ≤ R := by
    apply Subgroup.topologicalClosure_minimal
    · rw [Subgroup.closure_le]
      intro y hy
      rw [Set.mem_singleton_iff] at hy
      subst y
      rw [hfx]
      change n • (1 : ZHat) ∈
        (zHatMulNat n).toAddMonoidHom.range
      exact ⟨(1 : ZHat), rfl⟩
    · exact hRclosed
  apply le_antisymm
  · rintro y ⟨a, rfl⟩
    have ha : a ∈
        (closedSubgroupGenerated ({x} : Set Γ) : Subgroup Γ) := by
      rw [show (closedSubgroupGenerated ({x} : Set Γ) : Subgroup Γ) = ⊤ by
        simpa [TopologicallyGenerates, closedSubgroupGenerated] using hxgen]
      trivial
    exact hclosed_le_R
      (map_mem_closedSubgroupGenerated_singleton f x ha)
  · intro y hy
    change y.toAdd ∈ (zHatMulNat n).toAddMonoidHom.range at hy
    obtain ⟨z, hz⟩ := hy
    have hzgen : z ∈
        (closedSubgroupGenerated
          ({Multiplicative.ofAdd (1 : ZHat)} : Set ZHatMul) :
          Subgroup ZHatMul) := by
      rw [show (closedSubgroupGenerated
          ({Multiplicative.ofAdd (1 : ZHat)} : Set ZHatMul) :
          Subgroup ZHatMul) = ⊤ by
        simpa [TopologicallyGenerates, closedSubgroupGenerated] using
          zHatOne_topologicallyGenerates]
      trivial
    have hmap := map_mem_closedSubgroupGenerated_singleton
      (zHatPowNat n)
      (Multiplicative.ofAdd (1 : ZHat)) hzgen
    have hclosed_le_range :
        (closedSubgroupGenerated
          ({(Multiplicative.ofAdd (1 : ZHat)) ^ n} : Set ZHatMul) :
          Subgroup ZHatMul) ≤ f.toMonoidHom.range := by
      apply Subgroup.topologicalClosure_minimal
      · rw [Subgroup.closure_le]
        intro w hw
        rw [Set.mem_singleton_iff] at hw
        subst w
        exact ⟨x, hfx⟩
      · have hcompact : IsCompact (Set.range f) :=
          isCompact_range f.continuous_toFun
        have hrange : Set.range f = (f.toMonoidHom.range : Set ZHatMul) := by
          ext w
          constructor <;> rintro ⟨a, rfl⟩ <;> exact ⟨a, rfl⟩
        let : T2Space ZHatMul := by
          change T2Space ZHat
          infer_instance
        exact (hrange ▸ hcompact).isClosed
    have hzmap : zHatPowNat n z ∈ f.toMonoidHom.range := by
      apply hclosed_le_range
      simpa using hmap
    have hzy : zHatPowNat n z = y := by
      apply Multiplicative.ext
      exact hz
    exact hzy ▸ hzmap

theorem frobeniusFixedField_finiteIndex (D : DegreeData G)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    [hLfinite : Finite (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK)]
    (σ : D.FrobeniusElements K L hLK) :
    Finite
      ((K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK) ⧸
        (D.frobeniusClosure K L hLK σ).toSubgroup) := by
  let Q := K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK
  let Γ : Subgroup Q :=
    (D.frobeniusClosure K L hLK σ).toSubgroup
  let dQ : Q →ₜ* ZHatMul :=
    D.extensionNormalizedDegreeContinuous K L hLK
  have hΓmap : Γ.map dQ.toMonoidHom =
      (D.frobeniusClosureDegree K L hLK σ).toMonoidHom.range := by
    ext z
    constructor
    · rintro ⟨q, hq, rfl⟩
      exact ⟨⟨q, hq⟩, rfl⟩
    · rintro ⟨q, rfl⟩
      exact ⟨q.1, q.2, rfl⟩
  have htopmap : (Subgroup.map dQ.toMonoidHom (⊤ : Subgroup Q)) = ⊤ := by
    apply top_unique
    intro z _
    obtain ⟨q, rfl⟩ :=
      D.extensionNormalizedDegreeContinuous_surjective K L hLK z
    exact ⟨q, trivial, rfl⟩
  have himage : (Γ.map dQ.toMonoidHom).relIndex
      ((⊤ : Subgroup Q).map dQ.toMonoidHom) ≠ 0 := by
    rw [hΓmap, htopmap, Subgroup.relIndex_top_right,
      D.frobeniusClosureDegree_range K L hLK σ,
      AddSubgroup.index_toSubgroup,
      zHatMulNat_range_index _
        (D.frobeniusExponent_pos K L hLK σ)]
    exact (D.frobeniusExponent_pos K L hLK σ).ne'
  let j := D.extensionDegreeKernelRestriction K L hLK
  let : Finite dQ.toMonoidHom.ker :=
    Finite.of_injective j
      (D.extensionDegreeKernelRestriction_injective K L hLK)
  let T : Subgroup Q := (⊤ : Subgroup Q) ⊓ dQ.toMonoidHom.ker
  let toKer : T → dQ.toMonoidHom.ker :=
    fun t => ⟨t.1, t.2.2⟩
  let : Finite T := Finite.of_injective toKer (by
    intro a b hab
    apply Subtype.ext
    exact congrArg (fun x : dQ.toMonoidHom.ker => x.1) hab)
  have hkernel : (Γ ⊓ dQ.toMonoidHom.ker).relIndex
      ((⊤ : Subgroup Q) ⊓ dQ.toMonoidHom.ker) ≠ 0 := by
    rw [Subgroup.relIndex]
    change ((Γ ⊓ dQ.toMonoidHom.ker).subgroupOf T).index ≠ 0
    exact Subgroup.index_ne_zero_of_finite
  have hrel : Γ.relIndex (⊤ : Subgroup Q) ≠ 0 := by
    rw [relIndex_eq_map_relIndex_mul_inf_ker_relIndex
      dQ.toMonoidHom le_top]
    exact Nat.mul_ne_zero himage hkernel
  apply (Subgroup.index_ne_zero_iff_finite).mp
  simpa [Γ, Q, Subgroup.relIndex_top_right] using hrel
end DegreeData
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

/- ClassFieldTheory.AbstractClassFieldTheory.Degree.Valuation -/
section
namespace ClassFormation
open KummerTheory
open CyclicCohomology
noncomputable section
universe u
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
 
def normToBase (A : Rep ℤ G) (K : ClosedSubgroup G)
    [Finite ((baseField G).toSubgroup ⧸
      extensionSubgroup (baseField G) K (le_baseField K))] :
    ambientFixedAddSubgroup A K →+
      ambientFixedAddSubgroup A (baseField G) :=
  relativeNorm A (baseField G) K (le_baseField K)
 
def nsmulOnAddSubgroup (Z : AddSubgroup ZHat) (n : ℕ) : Z →+ Z where
  toFun z := ⟨n • z.1, Z.nsmul_mem z.2 n⟩
  map_zero' := by ext; simp
  map_add' x y := by ext; simp
 
def nsmulWithin (Z : AddSubgroup ZHat) (n : ℕ) : AddSubgroup Z :=
  (nsmulOnAddSubgroup Z n).range
 
def nsmulImage (Z : AddSubgroup ZHat) (n : ℕ) : AddSubgroup ZHat :=
  Z.map
    { toFun := fun z : ZHat => n • z
      map_zero' := nsmul_zero n
      map_add' := fun x y => nsmul_add x y n }
 
def valueGroupReduction (Z : AddSubgroup ZHat) (n : ℕ) (hn : 0 < n) :
    Z →+ ZMod n :=
  (zHatReduction n hn).toAddMonoidHom.comp Z.subtype

def canonicalValueQuotientMap (Z : AddSubgroup ZHat)
    (n : ℕ) (hn : 0 < n) : (Z ⧸ nsmulWithin Z n) →+ ZMod n :=
  QuotientAddGroup.lift (nsmulWithin Z n) (valueGroupReduction Z n hn) (by
    rintro _ ⟨z, rfl⟩
    change zHatReduction n hn (n • (z : ZHat)) = 0
    rw [map_nsmul]
    simp [nsmul_eq_mul])

structure ValuationData (D : DegreeData G) (A : Rep ℤ G) where
   
  toAddMonoidHom : ambientFixedAddSubgroup A (baseField G) →+ ZHat
   
  integers_mem : ∀ m : ℤ,
    (Int.castRingHom ZHat) m ∈
      toAddMonoidHom.range
   
  canonical_value_quotient_bijective : ∀ (n : ℕ) (hn : 0 < n),
    Function.Bijective
      (canonicalValueQuotientMap toAddMonoidHom.range n hn)
   
  norm_range : ∀ K : FiniteAbstractField G,
    (toAddMonoidHom.comp (normToBase A K.field)).range =
      nsmulImage toAddMonoidHom.range (K.residueDegree D : ℕ)
namespace ValuationData
variable {D : DegreeData G} {A : Rep ℤ G}
 
def valueGroup (v : ValuationData D A) : AddSubgroup ZHat :=
  v.toAddMonoidHom.range
 
def normCompositeAt (v : ValuationData D A) (K : FiniteAbstractField G) :
    ambientFixedAddSubgroup A K.field →+ ZHat :=
  v.toAddMonoidHom.comp (normToBase A K.field)
 
theorem normCompositeAt_range (v : ValuationData D A) (K : FiniteAbstractField G) :
    (v.normCompositeAt K).range =
      nsmulImage v.valueGroup (K.residueDegree D : ℕ) :=
  v.norm_range K
 
def normCompositeAtInResidueImage (v : ValuationData D A)
    (K : FiniteAbstractField G) :
    ambientFixedAddSubgroup A K.field →+
      (zHatMulNat (K.residueDegree D : ℕ)).toAddMonoidHom.range where
  toFun a := ⟨v.normCompositeAt K a, by
    have ha : v.normCompositeAt K a ∈ (v.normCompositeAt K).range := ⟨a, rfl⟩
    rw [v.normCompositeAt_range K] at ha
    obtain ⟨z, _hz, hz⟩ := ha
    exact ⟨z, hz⟩⟩
  map_zero' := by ext; simp [normCompositeAt]
  map_add' x y := by
    apply Subtype.ext
    exact map_add (v.normCompositeAt K) x y
 
def dividedAt (v : ValuationData D A) (K : FiniteAbstractField G) :
    ambientFixedAddSubgroup A K.field →+ ZHat :=
  (zHatDivide (K.residueDegree D : ℕ)
    (K.residueDegree D).property).toAddMonoidHom.comp
      (v.normCompositeAtInResidueImage K)

theorem residueDegree_nsmul_dividedAt (v : ValuationData D A)
    (K : FiniteAbstractField G)
    (a : ambientFixedAddSubgroup A K.field) :
    (K.residueDegree D : ℕ) • v.dividedAt K a = v.normCompositeAt K a := by
  exact zHatMulNat_zHatDivide (K.residueDegree D : ℕ)
    (K.residueDegree D).property
    (v.normCompositeAtInResidueImage K a)
 
theorem dividedAt_mem_valueGroup (v : ValuationData D A)
    (K : FiniteAbstractField G)
    (a : ambientFixedAddSubgroup A K.field) :
    v.dividedAt K a ∈ v.valueGroup := by
  have ha : v.normCompositeAt K a ∈ (v.normCompositeAt K).range := ⟨a, rfl⟩
  rw [v.normCompositeAt_range K] at ha
  obtain ⟨z, hzZ, hz⟩ := ha
  have hzSubtype : v.normCompositeAtInResidueImage K a =
      ⟨zHatMulNat (K.residueDegree D : ℕ) z, ⟨z, rfl⟩⟩ := by
    apply Subtype.ext
    change v.normCompositeAt K a =
      zHatMulNat (K.residueDegree D : ℕ) z
    exact hz.symm
  change zHatDivide (K.residueDegree D : ℕ)
      (K.residueDegree D).property
        (v.normCompositeAtInResidueImage K a) ∈ v.valueGroup
  rw [hzSubtype]
  exact (zHatDivide_zHatMulNat (K.residueDegree D : ℕ)
    (K.residueDegree D).property z).symm ▸ hzZ

def valuationAt (v : ValuationData D A) (K : FiniteAbstractField G) :
    ambientFixedAddSubgroup A K.field →+ v.valueGroup :=
  (v.dividedAt K).codRestrict v.valueGroup (fun a => v.dividedAt_mem_valueGroup K a)

theorem normalizedValuation_surjective (v : ValuationData D A)
    (K : FiniteAbstractField G) :
    Function.Surjective (v.valuationAt K) := by
  intro z
  have hzImage : (K.residueDegree D : ℕ) • z.1 ∈
      nsmulImage v.valueGroup (K.residueDegree D : ℕ) :=
    ⟨z.1, z.2, rfl⟩
  rw [← v.normCompositeAt_range K] at hzImage
  obtain ⟨a, ha⟩ := hzImage
  refine ⟨a, ?_⟩
  apply Subtype.ext
  change zHatDivide (K.residueDegree D : ℕ)
      (K.residueDegree D).property
        (v.normCompositeAtInResidueImage K a) = z.1
  have hsub : v.normCompositeAtInResidueImage K a =
      ⟨zHatMulNat (K.residueDegree D : ℕ) z.1, ⟨z.1, rfl⟩⟩ := by
    apply Subtype.ext
    change v.normCompositeAt K a =
      zHatMulNat (K.residueDegree D : ℕ) z.1
    exact ha
  rw [hsub]
  exact zHatDivide_zHatMulNat (K.residueDegree D : ℕ)
    (K.residueDegree D).property z.1
end ValuationData
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

def conjugateClosedSubgroup {G : Type*} [Group G] [TopologicalSpace G]
    [ContinuousMul G]
    (K : ClosedSubgroup G) (σ : G) : ClosedSubgroup G where
  toSubgroup := ConjAct.toConjAct σ⁻¹ • K.toSubgroup
  isClosed' := by
    convert IsClosed.preimage
      (IsTopologicalGroup.continuous_conj (G := G) σ) K.isClosed' using 1
    ext x
    change x ∈ (ConjAct.toConjAct σ⁻¹ • K.toSubgroup : Subgroup G) ↔
      σ * x * σ⁻¹ ∈ K.toSubgroup
    rw [Subgroup.mem_pointwise_smul_iff_inv_smul_mem]
    simp only [ConjAct.toConjAct_inv, inv_inv, ConjAct.toConjAct_smul]

@[simp]
theorem conjugateClosedSubgroup_mem {G : Type*} [Group G] [TopologicalSpace G]
    [ContinuousMul G]
    (K : ClosedSubgroup G) (σ x : G) :
    x ∈ conjugateClosedSubgroup K σ ↔ σ * x * σ⁻¹ ∈ K := by
  change x ∈ (ConjAct.toConjAct σ⁻¹ • K.toSubgroup : Subgroup G) ↔
    σ * x * σ⁻¹ ∈ K.toSubgroup
  rw [Subgroup.mem_pointwise_smul_iff_inv_smul_mem]
  simp only [ConjAct.toConjAct_inv, inv_inv, ConjAct.toConjAct_smul]
 
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

/- ClassFieldTheory.AbstractClassFieldTheory.Degree.NormConjugation -/
section
namespace ClassFormation
open KummerTheory
open CyclicCohomology
noncomputable section
open scoped BigOperators
universe u
section GroupOnly
variable {G : Type u} [Group G] [TopologicalSpace G]
 
theorem conjugateClosedSubgroup_mono [ContinuousMul G]
    {K L : ClosedSubgroup G} (hLK : L.toSubgroup ≤ K.toSubgroup)
    (s : G) :
    (conjugateClosedSubgroup L s).toSubgroup ≤
      (conjugateClosedSubgroup K s).toSubgroup := by
  intro x hx
  change x ∈ conjugateClosedSubgroup L s at hx
  change x ∈ conjugateClosedSubgroup K s
  rw [conjugateClosedSubgroup_mem] at hx ⊢
  exact hLK hx

def conjugateSubgroupEquiv [ContinuousMul G]
    (K : ClosedSubgroup G) (s : G) :
    K.toSubgroup ≃* (conjugateClosedSubgroup K s).toSubgroup where
  toFun k := ⟨s⁻¹ * k.1 * s, by
    change s⁻¹ * k.1 * s ∈ conjugateClosedSubgroup K s
    rw [conjugateClosedSubgroup_mem]
    convert k.2 using 1
    simp [mul_assoc]⟩
  invFun x := ⟨s * x.1 * s⁻¹,
    (conjugateClosedSubgroup_mem K s x.1).mp x.2⟩
  left_inv k := by
    apply Subtype.ext
    simp [mul_assoc]
  right_inv x := by
    apply Subtype.ext
    simp [mul_assoc]
  map_mul' a b := by
    apply Subtype.ext
    simp [mul_assoc]

theorem map_extensionSubgroup_conjugate [ContinuousMul G]
    (K L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.toSubgroup) (s : G) :
    (extensionSubgroup K L hLK).map
        (conjugateSubgroupEquiv K s).toMonoidHom =
      extensionSubgroup (conjugateClosedSubgroup K s)
        (conjugateClosedSubgroup L s)
        (conjugateClosedSubgroup_mono hLK s) := by
  ext x
  constructor
  · rintro ⟨k, hk, rfl⟩
    change s⁻¹ * k.1 * s ∈ conjugateClosedSubgroup L s
    rw [conjugateClosedSubgroup_mem]
    simpa [mul_assoc] using hk
  · intro hx
    refine ⟨(conjugateSubgroupEquiv K s).symm x, ?_, ?_⟩
    · change s * x.1 * s⁻¹ ∈ L.toSubgroup
      exact (conjugateClosedSubgroup_mem L s x.1).mp hx
    · exact (conjugateSubgroupEquiv K s).apply_symm_apply x
 
instance conjugateExtension_normal [ContinuousMul G]
    (K L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.toSubgroup) (s : G)
    [hLnormal : (extensionSubgroup K L hLK).Normal] :
    (extensionSubgroup (conjugateClosedSubgroup K s)
      (conjugateClosedSubgroup L s)
      (conjugateClosedSubgroup_mono hLK s)).Normal := by
  rw [← map_extensionSubgroup_conjugate K L hLK s]
  exact Subgroup.Normal.map hLnormal
    (conjugateSubgroupEquiv K s).toMonoidHom
    (conjugateSubgroupEquiv K s).surjective
end GroupOnly
section Representation
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
end Representation
end
end ClassFormation
end

/- ClassFieldTheory.AbstractClassFieldTheory.Degree.ValuationLaws -/
section
namespace ClassFormation
open KummerTheory
open CyclicCohomology
noncomputable section
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
variable {D : DegreeData G} {A : Rep ℤ G}
 
theorem DegreeData.fieldImage_conjugate
    {G : Type*} [Group G] [TopologicalSpace G] [ContinuousMul G]
    (D : DegreeData G) (K : ClosedSubgroup G) (σ : G) :
    D.fieldImage (conjugateClosedSubgroup K σ) = D.fieldImage K := by
  rw [D.fieldImage_eq_map, D.fieldImage_eq_map]
  ext z
  constructor
  · rintro ⟨x, hx, rfl⟩
    let k : K.toSubgroup :=
      ⟨σ * x * σ⁻¹, (conjugateClosedSubgroup_mem K σ x).mp hx⟩
    refine ⟨k.1, k.2, ?_⟩
    simp [k, map_mul, mul_assoc]
  · rintro ⟨k, hk, rfl⟩
    let x : G := σ⁻¹ * k * σ
    have hx : x ∈ conjugateClosedSubgroup K σ := by
      rw [conjugateClosedSubgroup_mem]
      change σ * x * σ⁻¹ ∈ K.toSubgroup
      simpa [x, mul_assoc] using hk
    refine ⟨x, hx, ?_⟩
    simp [x, map_mul, mul_assoc, mul_comm]

noncomputable def DegreeData.FiniteResidueAbstractField.conjugate
    {G : Type*} [Group G] [TopologicalSpace G] {D : DegreeData G}
    [ContinuousMul G] (K : DegreeData.FiniteResidueAbstractField D) (σ : G) :
    DegreeData.FiniteResidueAbstractField D where
  field := conjugateClosedSubgroup K.field σ
  finiteResidueQuotient := by
    unfold DegreeData.residueQuotient
    rw [D.fieldImage_conjugate K.field σ]
    exact K.finiteResidueQuotient
namespace ValuationData

theorem normalizedValuation_tower (v : ValuationData D A)
    (E : FiniteAbstractFieldExtension G)
    (a : ambientFixedAddSubgroup A E.field.field) :
    let ER := E.toFiniteResidueAbstractExtension D
    (ER.residueDegree : ℕ) •
        ((v.valuationAt E.field a : v.valueGroup) : ZHat) =
      ((v.valuationAt E.base
        (relativeNorm A E.base.field E.field.field E.below a) : v.valueGroup) : ZHat) := by
  let ER := E.toFiniteResidueAbstractExtension D
  apply zHatMulNat_injective (E.base.residueDegree D).property
  change (ER.base.residueDegree : ℕ) •
      ((ER.residueDegree : ℕ) • v.dividedAt E.field a) =
    (ER.base.residueDegree : ℕ) •
      v.dividedAt E.base
        (relativeNorm A E.base.field E.field.field E.below a)
  rw [smul_smul, Nat.mul_comm (ER.base.residueDegree : ℕ),
    ER.residueDegree_mul_absoluteResidueDegree D]
  change (E.field.residueDegree D : ℕ) • v.dividedAt E.field a =
    (E.base.residueDegree D : ℕ) •
      v.dividedAt E.base
        (relativeNorm A E.base.field E.field.field E.below a)
  rw [v.residueDegree_nsmul_dividedAt E.field,
    v.residueDegree_nsmul_dividedAt E.base]
  change v.toAddMonoidHom (normToBase A E.field.field a) =
    v.toAddMonoidHom
      (normToBase A E.base.field
        (relativeNorm A E.base.field E.field.field E.below a))
  let T : DegreeData.FiniteTower G := {
    top := E.field.field
    middle := E.base.field
    base := baseField G
    top_le_middle := E.below
    middle_le_base := le_baseField E.base.field
    finiteTopQuotient := E.finiteQuotient
    finiteBaseQuotient := E.base.finite }
  exact congrArg v.toAddMonoidHom
    (by simpa [T, normToBase] using (T.norm_trans_apply A a).symm)
end ValuationData
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
variable {D : DegreeData G} {A : Rep ℤ G}
 
def fixedFieldInclusion (A : Rep ℤ G) (K L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.toSubgroup) :
    ambientFixedAddSubgroup A K →+ ambientFixedAddSubgroup A L where
  toFun a := ⟨a.1, fun l => a.2 ⟨l.1, hLK l.2⟩⟩
  map_zero' := rfl
  map_add' _ _ := rfl
 
@[simp]
theorem relativeNorm_self
    (A : Rep ℤ G) (K : ClosedSubgroup G)
    [Finite (K.toSubgroup ⧸ extensionSubgroup K K le_rfl)]
    (a : ambientFixedAddSubgroup A K) :
    relativeNorm A K K le_rfl a = a := by
  apply Subtype.ext
  let := Fintype.ofFinite
    (K.toSubgroup ⧸ extensionSubgroup K K le_rfl)
  have hterm : ∀ q : K.toSubgroup ⧸ extensionSubgroup K K le_rfl,
      relativeCosetAction A K K le_rfl a q = a.1 := by
    intro q
    refine Quotient.inductionOn' q ?_
    intro k
    rw [relativeCosetAction_mk]
    exact a.2 k
  simp only [relativeNorm_apply_coe, relativeNormValue]
  simp_rw [hterm]
  rw [Finset.sum_const, Finset.card_univ]
  have htop : extensionSubgroup K K le_rfl = ⊤ := by
    change K.toSubgroup.subgroupOf K.toSubgroup = ⊤
    exact Subgroup.subgroupOf_self _
  have hcard :
      Fintype.card (K.toSubgroup ⧸ extensionSubgroup K K le_rfl) = 1 := by
    rw [← Nat.card_eq_fintype_card,
      ← Subgroup.index_eq_card (extensionSubgroup K K le_rfl),
      htop, Subgroup.index_top]
  rw [hcard, one_nsmul]
namespace ValuationData
 
def oneValue (v : ValuationData D A) : v.valueGroup :=
  ⟨1, by
    obtain ⟨a, ha⟩ := v.integers_mem 1
    exact ⟨a, by simpa using ha⟩⟩
 
def IsPrimeElement (v : ValuationData D A) (K : FiniteAbstractField G)
    (π : ambientFixedAddSubgroup A K.field) : Prop :=
  v.valuationAt K π = v.oneValue
 
theorem norm_prime_of_totallyRamified (v : ValuationData D A)
    (E : FiniteAbstractFieldExtension G)
    (hTot : E.IsTotallyRamified D)
    (π : ambientFixedAddSubgroup A E.field.field) :
    v.IsPrimeElement E.field π →
      v.IsPrimeElement E.base
        (relativeNorm A E.base.field E.field.field E.below π) := by
  intro hπ
  have htower := v.normalizedValuation_tower E π
  have hresidue : (E.residueDegree D : ℕ) = 1 :=
    E.toFiniteAbstractExtension.residueDegree_eq_one_of_isTotallyRamified D hTot
  change (E.residueDegree D : ℕ) •
      ((v.valuationAt E.field π : v.valueGroup) : ZHat) =
    ((v.valuationAt E.base
      (relativeNorm A E.base.field E.field.field E.below π) :
        v.valueGroup) : ZHat) at htower
  rw [hresidue, one_nsmul] at htower
  rw [IsPrimeElement] at hπ ⊢
  apply Subtype.ext
  exact htower.symm.trans (congrArg Subtype.val hπ)
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
variable {D : DegreeData G} {A : Rep ℤ G}
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

/- ClassFieldTheory.AbstractClassFieldTheory.Reciprocity.Construction.FrobeniusField -/
section
namespace ClassFormation
open CyclicCohomology
noncomputable section
variable {G : Type*} [Group G] [TopologicalSpace G]
namespace DegreeData

def frobeniusFixedSubgroupWithin (D : DegreeData G) [IsTopologicalGroup G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (σ : D.FrobeniusElements K L hLK) : Subgroup K.field.toSubgroup :=
  (D.frobeniusClosure K L hLK σ).toSubgroup.comap
    (QuotientGroup.mk' (D.extensionInertiaWithin K.field L hLK))

@[simp]
theorem mem_frobeniusFixedSubgroupWithin_iff (D : DegreeData G)
    [IsTopologicalGroup G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (σ : D.FrobeniusElements K L hLK) (k : K.field.toSubgroup) :
    k ∈ D.frobeniusFixedSubgroupWithin K L hLK σ ↔
      QuotientGroup.mk k ∈
        (D.frobeniusClosure K L hLK σ).toSubgroup :=
  Iff.rfl
 
theorem frobeniusFixedSubgroupWithin_isClosed (D : DegreeData G)
    [IsTopologicalGroup G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (σ : D.FrobeniusElements K L hLK) :
    IsClosed
      (D.frobeniusFixedSubgroupWithin K L hLK σ : Set K.field.toSubgroup) := by
  change IsClosed
    ((QuotientGroup.mk' (D.extensionInertiaWithin K.field L hLK)) ⁻¹'
      ((D.frobeniusClosure K L hLK σ).toSubgroup : Set
        (K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK)))
  exact (D.frobeniusClosure K L hLK σ).isClosed'.preimage
    continuous_quotient_mk'

def frobeniusFixedField (D : DegreeData G) [IsTopologicalGroup G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (σ : D.FrobeniusElements K L hLK) : ClosedSubgroup G where
  toSubgroup :=
    (D.frobeniusFixedSubgroupWithin K L hLK σ).map
      K.field.toSubgroup.subtype
  isClosed' := by
    change IsClosed
      (Subtype.val ''
        (D.frobeniusFixedSubgroupWithin K L hLK σ : Set K.field.toSubgroup))
    exact K.field.isClosed'.isClosedEmbedding_subtypeVal.isClosedMap _
      (D.frobeniusFixedSubgroupWithin_isClosed K L hLK σ)
 
@[simp]
theorem mem_frobeniusFixedField_iff (D : DegreeData G)
    [IsTopologicalGroup G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (σ : D.FrobeniusElements K L hLK) (g : G) :
    g ∈ D.frobeniusFixedField K L hLK σ ↔
      ∃ k : K.field.toSubgroup,
        k ∈ D.frobeniusFixedSubgroupWithin K L hLK σ ∧ k.1 = g := by
  rfl
 
theorem frobeniusFixedField_le (D : DegreeData G) [IsTopologicalGroup G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (σ : D.FrobeniusElements K L hLK) :
    (D.frobeniusFixedField K L hLK σ).toSubgroup ≤ K.field.toSubgroup := by
  rintro g ⟨k, _, rfl⟩
  exact k.2

theorem extensionSubgroup_frobeniusFixedField (D : DegreeData G)
    [IsTopologicalGroup G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (σ : D.FrobeniusElements K L hLK) :
    extensionSubgroup K.field (D.frobeniusFixedField K L hLK σ)
        (D.frobeniusFixedField_le K L hLK σ) =
      D.frobeniusFixedSubgroupWithin K L hLK σ := by
  ext k
  change
    (k.1 ∈ D.frobeniusFixedField K L hLK σ) ↔
      k ∈ D.frobeniusFixedSubgroupWithin K L hLK σ
  rw [D.mem_frobeniusFixedField_iff K L hLK σ]
  constructor
  · rintro ⟨t, ht, htk⟩
    have : t = k := by
      apply Subtype.ext
      exact htk
    simpa [this] using ht
  · intro hk
    exact ⟨k, hk, rfl⟩
 
theorem frobeniusFixedField_finite (D : DegreeData G)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    [hLfinite : Finite (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK)]
    (σ : D.FrobeniusElements K L hLK) :
    Finite
      (K.field.toSubgroup ⧸
        extensionSubgroup K.field (D.frobeniusFixedField K L hLK σ)
          (D.frobeniusFixedField_le K L hLK σ)) := by
  let N := D.extensionInertiaWithin K.field L hLK
  let Q := K.field.toSubgroup ⧸ N
  let Γ : Subgroup Q :=
    (D.frobeniusClosure K L hLK σ).toSubgroup
  let S : Subgroup K.field.toSubgroup :=
    D.frobeniusFixedSubgroupWithin K L hLK σ
  let : Finite (Q ⧸ Γ) := by
    simpa [Q, Γ, N] using
      D.frobeniusFixedField_finiteIndex K L hLK σ
  have hΓ : Γ.index ≠ 0 := Γ.index_ne_zero_of_finite
  have hS : S.index ≠ 0 := by
    rw [show S = Γ.comap (QuotientGroup.mk' N) by rfl]
    rw [Subgroup.index_comap_of_surjective Γ
      (QuotientGroup.mk'_surjective N)]
    exact hΓ
  apply Nat.finite_of_card_ne_zero
  change
    (extensionSubgroup K.field (D.frobeniusFixedField K L hLK σ)
      (D.frobeniusFixedField_le K L hLK σ)).index ≠ 0
  rw [D.extensionSubgroup_frobeniusFixedField K L hLK σ]
  exact hS

theorem frobeniusFixedSubgroupWithin_normalizedDegree_image
    (D : DegreeData G) [IsTopologicalGroup G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (σ : D.FrobeniusElements K L hLK) :
    (D.frobeniusFixedSubgroupWithin K L hLK σ).map
        (D.normalizedDegree K).toMonoidHom =
      (D.frobeniusClosureDegree K L hLK σ).toMonoidHom.range := by
  ext z
  constructor
  · rintro ⟨k, hk, rfl⟩
    exact ⟨⟨QuotientGroup.mk k, hk⟩, rfl⟩
  · rintro ⟨a, rfl⟩
    obtain ⟨k, hk⟩ := QuotientGroup.mk'_surjective
      (D.extensionInertiaWithin K.field L hLK) a.1
    have hkS : k ∈ D.frobeniusFixedSubgroupWithin K L hLK σ := by
      change (QuotientGroup.mk' (D.extensionInertiaWithin K.field L hLK)) k ∈
        (D.frobeniusClosure K L hLK σ).toSubgroup
      exact hk.symm ▸ a.2
    refine ⟨k, hkS, ?_⟩
    calc
      D.normalizedDegree K k =
          D.extensionNormalizedDegree K L hLK
            ((QuotientGroup.mk' (D.extensionInertiaWithin K.field L hLK)) k) :=
        (D.extensionNormalizedDegree_mk K L hLK k).symm
      _ = D.extensionNormalizedDegree K L hLK a.1 :=
        congrArg (D.extensionNormalizedDegree K L hLK) hk
private theorem frobeniusFixedField_mappedRelIndex (D : DegreeData G)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (σ : D.FrobeniusElements K L hLK) :
    ((D.frobeniusFixedField K L hLK σ).toSubgroup.map
        D.degree.toMonoidHom).relIndex
      (K.field.toSubgroup.map D.degree.toMonoidHom) =
      D.frobeniusExponent K L hLK σ := by
  let S : Subgroup K.field.toSubgroup :=
    D.frobeniusFixedSubgroupWithin K L hLK σ
  let dK : K.field.toSubgroup →* ZHatMul :=
    (D.normalizedDegree K).toMonoidHom
  let scale : ZHatMul →* ZHatMul :=
    (zHatPowNat (K.residueDegree : ℕ)).toMonoidHom
  have hraw : (D.restrictedDegree K.field).toMonoidHom = scale.comp dK := by
    apply MonoidHom.ext
    intro k
    apply Multiplicative.ext
    exact (D.residueDegree_nsmul_normalizedDegree K k).symm
  have hSigmaImage :
      (D.frobeniusFixedField K L hLK σ).toSubgroup.map
          D.degree.toMonoidHom =
        S.map (D.restrictedDegree K.field).toMonoidHom := by
    ext z
    constructor
    · rintro ⟨g, hg, rfl⟩
      obtain ⟨k, hk, hkg⟩ := hg
      refine ⟨k, hk, ?_⟩
      exact congrArg D.degree hkg
    · rintro ⟨k, hk, rfl⟩
      exact ⟨k.1, ⟨k, hk, rfl⟩, rfl⟩
  have hKimage :
      K.field.toSubgroup.map D.degree.toMonoidHom =
        (⊤ : Subgroup K.field.toSubgroup).map
          (D.restrictedDegree K.field).toMonoidHom := by
    ext z
    constructor
    · rintro ⟨g, hg, rfl⟩
      exact ⟨⟨g, hg⟩, trivial, rfl⟩
    · rintro ⟨k, _, rfl⟩
      exact ⟨k.1, k.2, rfl⟩
  have hscale : Function.Injective scale := by
    intro x y hxy
    apply Multiplicative.ext
    apply zHatMulNat_injective K.residueDegree.property
    exact congrArg Multiplicative.toAdd hxy
  have htop : (⊤ : Subgroup K.field.toSubgroup).map dK = ⊤ := by
    apply top_unique
    intro z _
    obtain ⟨k, hk⟩ := D.normalizedDegree_surjective K z
    exact ⟨k, trivial, hk⟩
  rw [hSigmaImage, hKimage, hraw]
  rw [← Subgroup.map_map, ← Subgroup.map_map]
  rw [Subgroup.relIndex_map_map_of_injective _ _ hscale]
  rw [show S.map dK =
      (D.frobeniusClosureDegree K L hLK σ).toMonoidHom.range by
        simpa [S, dK] using
          D.frobeniusFixedSubgroupWithin_normalizedDegree_image
            K L hLK σ]
  rw [htop, Subgroup.relIndex_top_right,
    D.frobeniusClosureDegree_range K L hLK σ,
    AddSubgroup.index_toSubgroup,
    zHatMulNat_range_index _
      (D.frobeniusExponent_pos K L hLK σ)]

theorem frobeniusFixedField_relativeResidueQuotientFinite
    (D : DegreeData G)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (σ : D.FrobeniusElements K L hLK) :
    Finite
      (↥(K.field.toSubgroup.map D.degree.toMonoidHom) ⧸
        ((D.frobeniusFixedField K L hLK σ).toSubgroup.map
            D.degree.toMonoidHom).subgroupOf
          (K.field.toSubgroup.map D.degree.toMonoidHom)) := by
  apply (Subgroup.index_ne_zero_iff_finite).mp
  change ((D.frobeniusFixedField K L hLK σ).toSubgroup.map
      D.degree.toMonoidHom).relIndex
        (K.field.toSubgroup.map D.degree.toMonoidHom) ≠ 0
  rw [D.frobeniusFixedField_mappedRelIndex K L hLK σ]
  exact (D.frobeniusExponent_pos K L hLK σ).ne'

noncomputable def frobeniusFixedResidueField (D : DegreeData G)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (σ : D.FrobeniusElements K L hLK) :
    FiniteResidueAbstractField D := by
  letI := D.frobeniusFixedField_relativeResidueQuotientFinite K L hLK σ
  exact FiniteResidueAbstractField.ofRelativeInclusion D
    (D.frobeniusFixedField K L hLK σ) K
    (D.frobeniusFixedField_le K L hLK σ)

theorem frobeniusFixedResidueField_residueDegree (D : DegreeData G)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (σ : D.FrobeniusElements K L hLK) :
    ((D.frobeniusFixedResidueField K L hLK σ).residueDegree : ℕ) =
      D.frobeniusExponent K L hLK σ * (K.residueDegree : ℕ) := by
  let Sigma := D.frobeniusFixedResidueField K L hLK σ
  let E : AbstractExtension G := {
    field := D.frobeniusFixedField K L hLK σ
    base := K.field
    below := D.frobeniusFixedField_le K L hLK σ
  }
  let := D.frobeniusFixedField_relativeResidueQuotientFinite K L hLK σ
  have hrelative :
      E.relativeResidueDegreeCardinal D =
        (D.frobeniusExponent K L hLK σ : Cardinal) := by
    rw [AbstractExtension.relativeResidueDegreeCardinal]
    change Cardinal.mk
        (↥(K.field.toSubgroup.map D.degree.toMonoidHom) ⧸
          ((D.frobeniusFixedField K L hLK σ).toSubgroup.map
              D.degree.toMonoidHom).subgroupOf
            (K.field.toSubgroup.map D.degree.toMonoidHom)) = _
    rw [← Nat.cast_card]
    exact_mod_cast D.frobeniusFixedField_mappedRelIndex K L hLK σ
  have hcard :=
    E.relativeResidueDegreeCardinal_mul_residueDegreeCardinal D
  change E.relativeResidueDegreeCardinal D *
      D.residueDegreeCardinal K.field =
    D.residueDegreeCardinal Sigma.field at hcard
  rw [hrelative, K.residueDegreeCardinal_eq_coe,
    Sigma.residueDegreeCardinal_eq_coe] at hcard
  exact_mod_cast hcard.symm
end DegreeData
end
end ClassFormation
end

/- ClassFieldTheory.AbstractClassFieldTheory.Reciprocity.Construction.PrimeChoice -/
section
namespace ClassFormation
open KummerTheory
open CyclicCohomology
noncomputable section
namespace ValuationData
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
variable {D : DegreeData G} {A : Rep ℤ G}

def chosenPrimeElement (v : ValuationData D A) (K : FiniteAbstractField G) :
    ambientFixedAddSubgroup A K.field :=
  Classical.choose (v.normalizedValuation_surjective K v.oneValue)
 
@[simp]
theorem valuationAt_chosenPrimeElement (v : ValuationData D A)
    (K : FiniteAbstractField G) :
    v.valuationAt K (v.chosenPrimeElement K) = v.oneValue :=
  Classical.choose_spec (v.normalizedValuation_surjective K v.oneValue)
 
theorem chosenPrimeElement_isPrime (v : ValuationData D A)
    (K : FiniteAbstractField G) :
    v.IsPrimeElement K (v.chosenPrimeElement K) :=
  v.valuationAt_chosenPrimeElement K
end ValuationData
end
end ClassFormation
end

/- ClassFieldTheory.AbstractClassFieldTheory.Reciprocity.Construction.ReciprocityDefinition -/
section
universe u
namespace ClassFormation
open KummerTheory
open CyclicCohomology
noncomputable section
section frobeniusFixedFields
variable {G : Type u} [Group G] [TopologicalSpace G]
namespace DegreeData
 
theorem frobeniusFixedField_absoluteFinite (D : DegreeData G)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    (K : FiniteAbstractField G) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    [hLfinite : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK)]
    (σ : D.FrobeniusElements (K.toFiniteResidueAbstractField D) L hLK
      (hLnormal := by
        simpa only [FiniteAbstractField.toFiniteResidueAbstractField] using hLnormal)) :
    Finite ((baseField G).toSubgroup ⧸
      extensionSubgroup (baseField G)
        (D.frobeniusFixedField (K.toFiniteResidueAbstractField D) L hLK
          (hLnormal := by
            simpa only [FiniteAbstractField.toFiniteResidueAbstractField] using hLnormal) σ)
        (le_baseField
          (D.frobeniusFixedField (K.toFiniteResidueAbstractField D) L hLK
            (hLnormal := by
              simpa only [FiniteAbstractField.toFiniteResidueAbstractField] using hLnormal) σ))) := by
  let KR := K.toFiniteResidueAbstractField D
  let hLnormalKR : (extensionSubgroup KR.field L hLK).Normal := by
    simpa only [KR, FiniteAbstractField.toFiniteResidueAbstractField] using hLnormal
  let hLfiniteKR : Finite
      (KR.field.toSubgroup ⧸ extensionSubgroup KR.field L hLK) := by
    simpa only [KR, FiniteAbstractField.toFiniteResidueAbstractField] using hLfinite
  let : Finite (K.field.toSubgroup ⧸
      extensionSubgroup K.field (D.frobeniusFixedField KR L hLK σ)
        (D.frobeniusFixedField_le KR L hLK σ)) :=
    D.frobeniusFixedField_finite KR L hLK σ
  exact relativeTowerQuotientFinite (baseField G) K.field
    (D.frobeniusFixedField KR L hLK σ)
    (D.frobeniusFixedField_le KR L hLK σ) (le_baseField K.field)
end DegreeData
end frobeniusFixedFields
section reciprocityValues
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
variable {D : DegreeData G} {A : Rep ℤ G}
namespace DegreeData
end DegreeData
end reciprocityValues
end
end ClassFormation
end

/- ClassFieldTheory.AbstractClassFieldTheory.Reciprocity.Construction.ReciprocityIndependence -/
section
universe u
namespace ClassFormation
open KummerTheory
open CyclicCohomology
noncomputable section
section groupTheoreticRefinements
variable {G : Type u} [Group G] [TopologicalSpace G]
namespace FiniteIntermediateField

theorem finite_extension_of_le
    {P M K : ClosedSubgroup G}
    (hPK : P.toSubgroup ≤ K.toSubgroup)
    (hMK : M.toSubgroup ≤ K.toSubgroup)
    (hPM : P.toSubgroup ≤ M.toSubgroup)
    [hPfinite : Finite
      (K.toSubgroup ⧸ extensionSubgroup K P hPK)] :
    Finite (M.toSubgroup ⧸ extensionSubgroup M P hPM) := by
  have hPKindex : P.toSubgroup.relIndex K.toSubgroup ≠ 0 := by
    rw [Subgroup.relIndex]
    exact @Subgroup.index_ne_zero_of_finite K.toSubgroup _
      (extensionSubgroup K P hPK) hPfinite
  have hPMindex : P.toSubgroup.relIndex M.toSubgroup ≠ 0 := by
    intro hzero
    have hmul := Subgroup.relIndex_mul_relIndex
      P.toSubgroup M.toSubgroup K.toSubgroup hPM hMK
    rw [hzero, zero_mul] at hmul
    exact hPKindex hmul.symm
  apply Nat.finite_of_card_ne_zero
  change (extensionSubgroup M P hPM).index ≠ 0
  simpa [Subgroup.relIndex] using hPMindex
end FiniteIntermediateField
namespace DegreeData
end DegreeData
end groupTheoreticRefinements
section reciprocityIndependence
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
namespace DegreeData
end DegreeData
end reciprocityIndependence
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
 
def finiteNormClassHom
    (A : Rep ℤ G) (K L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.toSubgroup)
    [Finite (K.toSubgroup ⧸ extensionSubgroup K L hLK)] :
    ambientFixedAddSubgroup A K →+ FiniteNormQuotient A K L hLK := by
  unfold FiniteNormQuotient
  exact QuotientAddGroup.mk' (finiteNormSubgroup A K L hLK)
 
def finiteNormClass
    (A : Rep ℤ G) (K L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.toSubgroup)
    [Finite (K.toSubgroup ⧸ extensionSubgroup K L hLK)]
    (a : ambientFixedAddSubgroup A K) :
    FiniteNormQuotient A K L hLK :=
  finiteNormClassHom A K L hLK a
 
@[simp]
theorem finiteNormClass_eq_zero_iff
    (A : Rep ℤ G) (K L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.toSubgroup)
    [Finite (K.toSubgroup ⧸ extensionSubgroup K L hLK)]
    (a : ambientFixedAddSubgroup A K) :
    finiteNormClass A K L hLK a = 0 ↔
      a ∈ finiteNormSubgroup A K L hLK := by
  unfold finiteNormClass finiteNormClassHom FiniteNormQuotient
  exact QuotientAddGroup.eq_zero_iff _
 
theorem finiteNormClass_surjective
    (A : Rep ℤ G) (K L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.toSubgroup)
    [Finite (K.toSubgroup ⧸ extensionSubgroup K L hLK)] :
    Function.Surjective (finiteNormClass A K L hLK) := by
  intro q
  change ambientFixedAddSubgroup A K ⧸
    finiteNormSubgroup A K L hLK at q
  obtain ⟨a, rfl⟩ := QuotientAddGroup.mk'_surjective
    (finiteNormSubgroup A K L hLK) q
  exact ⟨a, rfl⟩

theorem FiniteNormQuotient.induction_on
    (A : Rep ℤ G) (K L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.toSubgroup)
    [Finite (K.toSubgroup ⧸ extensionSubgroup K L hLK)]
    {motive : FiniteNormQuotient A K L hLK → Prop}
    (q : FiniteNormQuotient A K L hLK)
    (h : ∀ a, motive (finiteNormClass A K L hLK a)) : motive q := by
  obtain ⟨a, rfl⟩ := finiteNormClass_surjective A K L hLK q
  exact h a
 
def finiteNormQuotientLift
    {B : Type*} [AddCommGroup B]
    (A : Rep ℤ G) (K L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.toSubgroup)
    [Finite (K.toSubgroup ⧸ extensionSubgroup K L hLK)]
    (f : ambientFixedAddSubgroup A K →+ B)
    (hf : finiteNormSubgroup A K L hLK ≤ f.ker) :
    FiniteNormQuotient A K L hLK →+ B := by
  unfold FiniteNormQuotient
  exact QuotientAddGroup.lift (finiteNormSubgroup A K L hLK) f hf
 
@[simp]
theorem finiteNormQuotientLift_finiteNormClass
    {B : Type*} [AddCommGroup B]
    (A : Rep ℤ G) (K L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.toSubgroup)
    [Finite (K.toSubgroup ⧸ extensionSubgroup K L hLK)]
    (f : ambientFixedAddSubgroup A K →+ B)
    (hf : finiteNormSubgroup A K L hLK ≤ f.ker)
    (a : ambientFixedAddSubgroup A K) :
    finiteNormQuotientLift A K L hLK f hf
        (finiteNormClass A K L hLK a) = f a := by
  rfl
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
 
def refl (K : ClosedSubgroup G) : FiniteGaloisSubextension K where
  field := K
  below := le_rfl
  normal := by
    have htop : extensionSubgroup K K le_rfl = ⊤ := by
      rw [eq_top_iff]
      intro x _
      exact x.2
    rw [htop]
    infer_instance
  finite := by
    have htop : extensionSubgroup K K le_rfl = ⊤ := by
      rw [eq_top_iff]
      intro x _
      exact x.2
    rw [htop]
    infer_instance
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

/- ClassFieldTheory.AbstractClassFieldTheory.Reciprocity.Construction.FiniteFieldUnitMaps -/
section
universe u v
namespace ClassFormation
open KummerTheory
open CyclicCohomology
noncomputable section
open CategoryTheory
open scoped BigOperators
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
namespace FiniteAbstractField
 
instance toFiniteResidueAbstractField_extensionNormal
    (K : FiniteAbstractField G) (D : DegreeData G) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hnormal : (extensionSubgroup K.field L hLK).Normal] :
    (extensionSubgroup (K.toFiniteResidueAbstractField D).field L hLK).Normal := by
  change (extensionSubgroup K.field L hLK).Normal
  exact hnormal
 
instance toFiniteResidueAbstractField_extensionFinite
    (K : FiniteAbstractField G) (D : DegreeData G) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hfinite : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK)] :
    Finite ((K.toFiniteResidueAbstractField D).field.toSubgroup ⧸
      extensionSubgroup (K.toFiniteResidueAbstractField D).field L hLK) := by
  change Finite
    (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK)
  exact hfinite
end FiniteAbstractField
namespace ValuationData
variable {D : DegreeData G} {A : Rep ℤ G}
end ValuationData
end
end ClassFormation
end

/- ClassFieldTheory.AbstractClassFieldTheory.Reciprocity.Construction.MainFiniteReciprocity -/
section
universe u
namespace ClassFormation
open KummerTheory
open CyclicCohomology
open CategoryTheory
open scoped BigOperators
noncomputable section
section finiteReciprocityValues
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
namespace DegreeData
end DegreeData
end finiteReciprocityValues
section frobeniusLiftAlgebra
variable {G : Type u} [Group G] [TopologicalSpace G]
namespace DegreeData
end DegreeData
end frobeniusLiftAlgebra
section trivialRestrictionValues
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
namespace DegreeData
end DegreeData
end trivialRestrictionValues
section equalFrobeniusLifts
variable {G : Type u} [Group G] [TopologicalSpace G]
namespace DegreeData
end DegreeData
end equalFrobeniusLifts
section liftComparison
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
namespace DegreeData
end DegreeData
end liftComparison
section chosenFrobeniusLifts
variable {G : Type u} [Group G] [TopologicalSpace G]
namespace DegreeData

def chosenFiniteReciprocityFrobeniusLift (D : DegreeData G)
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    [hLfinite : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK)]
    (q : K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK) :
    D.FrobeniusElements K L hLK :=
  Classical.choose (D.frobeniusRestriction_surjective K L hLK q)
 
@[simp]
theorem frobeniusRestriction_chosenFiniteReciprocityFrobeniusLift (D : DegreeData G)
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    [hLfinite : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK)]
    (q : K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK) :
    D.frobeniusRestriction K L hLK
      (D.chosenFiniteReciprocityFrobeniusLift K L hLK q) = q :=
  Classical.choose_spec (D.frobeniusRestriction_surjective K L hLK q)
end DegreeData
end chosenFrobeniusLifts
section finiteReciprocityHom
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
namespace DegreeData
end DegreeData
end finiteReciprocityHom
noncomputable section
section unramifiedFixedFields
variable {G : Type u} [Group G] [TopologicalSpace G]
namespace DegreeData
end DegreeData
end unramifiedFixedFields
section unramifiedReciprocity
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
variable {D : DegreeData G} {A : Rep ℤ G}
namespace ValuationData
end ValuationData
end unramifiedReciprocity
end
end
end ClassFormation
end

/- ClassFieldTheory.AbstractClassFieldTheory.Reciprocity.Construction.MainNaturality -/
section
universe u
namespace ClassFormation
open KummerTheory
open CyclicCohomology
open CategoryTheory
noncomputable section
open scoped BigOperators
section GroupOnly
variable {G : Type u} [Group G] [TopologicalSpace G]

def finiteReciprocityNaturalityRestriction
    (K K' L L' : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.toSubgroup)
    (hL'K' : L'.toSubgroup ≤ K'.toSubgroup)
    (hK'K : K'.toSubgroup ≤ K.toSubgroup)
    (hL'L : L'.toSubgroup ≤ L.toSubgroup)
    [hLnormal : (extensionSubgroup K L hLK).Normal]
    [hL'normal : (extensionSubgroup K' L' hL'K').Normal] :
    (K'.toSubgroup ⧸ extensionSubgroup K' L' hL'K') →*
      (K.toSubgroup ⧸ extensionSubgroup K L hLK) := by
  apply QuotientGroup.map
    (extensionSubgroup K' L' hL'K')
    (extensionSubgroup K L hLK)
    (Subgroup.inclusion hK'K)
  intro k' hk'L'
  change k'.1 ∈ L'.toSubgroup at hk'L'
  change (Subgroup.inclusion hK'K k').1 ∈ L.toSubgroup
  exact hL'L hk'L'

@[simp]
theorem finiteReciprocityNaturalityRestriction_mk
    (K K' L L' : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.toSubgroup)
    (hL'K' : L'.toSubgroup ≤ K'.toSubgroup)
    (hK'K : K'.toSubgroup ≤ K.toSubgroup)
    (hL'L : L'.toSubgroup ≤ L.toSubgroup)
    [hLnormal : (extensionSubgroup K L hLK).Normal]
    [hL'normal : (extensionSubgroup K' L' hL'K').Normal]
    (k' : K'.toSubgroup) :
    finiteReciprocityNaturalityRestriction K K' L L' hLK hL'K' hK'K hL'L
        (QuotientGroup.mk k') =
      QuotientGroup.mk (Subgroup.inclusion hK'K k') :=
  rfl
namespace DegreeData

def finiteReciprocityNaturalityFrobeniusTowerMap
    (D : DegreeData G) [IsTopologicalGroup G]
    (K K' L L' : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.toSubgroup)
    (hL'K' : L'.toSubgroup ≤ K'.toSubgroup)
    (hK'K : K'.toSubgroup ≤ K.toSubgroup)
    (hL'L : L'.toSubgroup ≤ L.toSubgroup)
    [hLnormal : (extensionSubgroup K L hLK).Normal]
    [hL'normal : (extensionSubgroup K' L' hL'K').Normal] :
    (K'.toSubgroup ⧸ D.extensionInertiaWithin K' L' hL'K') →*
      (K.toSubgroup ⧸ D.extensionInertiaWithin K L hLK) := by
  apply QuotientGroup.map
    (D.extensionInertiaWithin K' L' hL'K')
    (D.extensionInertiaWithin K L hLK)
    (Subgroup.inclusion hK'K)
  rintro k' ⟨hk'L', hk'I⟩
  constructor
  · change k'.1 ∈ L'.toSubgroup at hk'L'
    change (Subgroup.inclusion hK'K k').1 ∈ L.toSubgroup
    exact hL'L hk'L'
  · exact hk'I

def finiteReciprocityNaturalityFrobeniusTowerMapContinuous
    (D : DegreeData G) [IsTopologicalGroup G]
    (K K' L L' : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.toSubgroup)
    (hL'K' : L'.toSubgroup ≤ K'.toSubgroup)
    (hK'K : K'.toSubgroup ≤ K.toSubgroup)
    (hL'L : L'.toSubgroup ≤ L.toSubgroup)
    [hLnormal : (extensionSubgroup K L hLK).Normal]
    [hL'normal : (extensionSubgroup K' L' hL'K').Normal] :
    (K'.toSubgroup ⧸ D.extensionInertiaWithin K' L' hL'K') →ₜ*
      (K.toSubgroup ⧸ D.extensionInertiaWithin K L hLK) where
  toMonoidHom := D.finiteReciprocityNaturalityFrobeniusTowerMap
    K K' L L' hLK hL'K' hK'K hL'L
  continuous_toFun := by
    rw [← QuotientGroup.isOpenQuotientMap_mk.continuous_comp_iff]
    change Continuous (fun k' : K'.toSubgroup =>
      QuotientGroup.mk (Subgroup.inclusion hK'K k'))
    apply QuotientGroup.continuous_mk.comp
    exact continuous_subtype_val.subtype_mk _

theorem finiteReciprocityNaturalityFrobeniusTowerMap_degree
    (D : DegreeData G) [IsTopologicalGroup G]
    (E : DegreeData.FiniteResidueAbstractExtension D)
    (L L' : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ E.base.toSubgroup)
    (hL'K' : L'.toSubgroup ≤ E.field.toSubgroup)
    (hL'L : L'.toSubgroup ≤ L.toSubgroup)
    [hLnormal : (extensionSubgroup E.base.field L hLK).Normal]
    [hL'normal : (extensionSubgroup E.field.field L' hL'K').Normal]
    (q : E.field.toSubgroup ⧸
      D.extensionInertiaWithin E.field.field L' hL'K') :
    (D.extensionNormalizedDegree E.base L hLK
      (D.finiteReciprocityNaturalityFrobeniusTowerMap
        E.base.field E.field.field L L'
        hLK hL'K' E.below hL'L q)).toAdd =
      (E.residueDegree : ℕ) •
        (D.extensionNormalizedDegree E.field L' hL'K' q).toAdd := by
  refine Quotient.inductionOn' q ?_
  intro k'
  change (D.normalizedDegree E.base (Subgroup.inclusion E.below k')).toAdd =
    (E.residueDegree : ℕ) • (D.normalizedDegree E.field k').toAdd
  exact D.frobeniusRestrictionNaturality_normalizedDegree E k'

def finiteReciprocityNaturalityFrobeniusTowerLift
    (D : DegreeData G) [IsTopologicalGroup G]
    (E : DegreeData.FiniteResidueAbstractExtension D)
    (L L' : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ E.base.toSubgroup)
    (hL'K' : L'.toSubgroup ≤ E.field.toSubgroup)
    (hL'L : L'.toSubgroup ≤ L.toSubgroup)
    [hLnormal : (extensionSubgroup E.base.field L hLK).Normal]
    [hL'normal : (extensionSubgroup E.field.field L' hL'K').Normal]
    (σ : D.FrobeniusElements E.field L' hL'K') :
    D.FrobeniusElements E.base L hLK := by
  let f := (E.residueDegree : ℕ)
  let n := D.frobeniusExponent E.field L' hL'K' σ
  refine ⟨D.finiteReciprocityNaturalityFrobeniusTowerMap
      E.base.field E.field.field L L' hLK hL'K' E.below hL'L σ.1,
    f * n, Nat.mul_pos E.residueDegree.property
      (D.frobeniusExponent_pos E.field L' hL'K' σ), ?_⟩
  apply Multiplicative.ext
  rw [D.finiteReciprocityNaturalityFrobeniusTowerMap_degree E L L'
    hLK hL'K' hL'L σ.1]
  rw [D.extensionNormalizedDegree_frobenius_eq_pow E.field L' hL'K' σ]
  change f • (n • (1 : ZHat)) = (f * n) • (1 : ZHat)
  rw [smul_smul]
 
@[simp]
theorem finiteReciprocityNaturalityFrobeniusTowerLift_coe
    (D : DegreeData G) [IsTopologicalGroup G]
    (E : DegreeData.FiniteResidueAbstractExtension D)
    (L L' : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ E.base.toSubgroup)
    (hL'K' : L'.toSubgroup ≤ E.field.toSubgroup)
    (hL'L : L'.toSubgroup ≤ L.toSubgroup)
    [hLnormal : (extensionSubgroup E.base.field L hLK).Normal]
    [hL'normal : (extensionSubgroup E.field.field L' hL'K').Normal]
    (σ : D.FrobeniusElements E.field L' hL'K') :
    (D.finiteReciprocityNaturalityFrobeniusTowerLift
      E L L' hLK hL'K' hL'L σ).1 =
      D.finiteReciprocityNaturalityFrobeniusTowerMap
        E.base.field E.field.field L L' hLK hL'K' E.below hL'L σ.1 := by
  simp [finiteReciprocityNaturalityFrobeniusTowerLift]
 
@[simp]
theorem finiteReciprocityNaturalityFrobeniusTowerLift_exponent
    (D : DegreeData G) [IsTopologicalGroup G]
    (E : DegreeData.FiniteResidueAbstractExtension D)
    (L L' : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ E.base.toSubgroup)
    (hL'K' : L'.toSubgroup ≤ E.field.toSubgroup)
    (hL'L : L'.toSubgroup ≤ L.toSubgroup)
    [hLnormal : (extensionSubgroup E.base.field L hLK).Normal]
    [hL'normal : (extensionSubgroup E.field.field L' hL'K').Normal]
    (σ : D.FrobeniusElements E.field L' hL'K') :
    D.frobeniusExponent E.base L hLK
        (D.finiteReciprocityNaturalityFrobeniusTowerLift
          E L L' hLK hL'K' hL'L σ) =
      (E.residueDegree : ℕ) *
        D.frobeniusExponent E.field L' hL'K' σ := by
  apply proCIntegerOne_pow_nat_injective
  let f := (E.residueDegree : ℕ)
  let n := D.frobeniusExponent E.field L' hL'K' σ
  calc
    (Multiplicative.ofAdd (1 : ZHat)) ^
        D.frobeniusExponent E.base L hLK
          (D.finiteReciprocityNaturalityFrobeniusTowerLift
            E L L' hLK hL'K' hL'L σ) =
      D.extensionNormalizedDegree E.base L hLK
        (D.finiteReciprocityNaturalityFrobeniusTowerLift
          E L L' hLK hL'K' hL'L σ).1 :=
      (D.extensionNormalizedDegree_frobenius_eq_pow E.base L hLK _).symm
    _ = (Multiplicative.ofAdd (1 : ZHat)) ^ (f * n) := by
      apply Multiplicative.ext
      rw [D.finiteReciprocityNaturalityFrobeniusTowerLift_coe]
      rw [D.finiteReciprocityNaturalityFrobeniusTowerMap_degree E L L'
        hLK hL'K' hL'L σ.1]
      rw [D.extensionNormalizedDegree_frobenius_eq_pow
        E.field L' hL'K' σ]
      change f • (n • (1 : ZHat)) = (f * n) • (1 : ZHat)
      rw [smul_smul]
    _ = (Multiplicative.ofAdd (1 : ZHat)) ^
        ((E.residueDegree : ℕ) *
          D.frobeniusExponent E.field L' hL'K' σ) := by rfl

theorem finiteReciprocityNaturalityRestriction_frobeniusTowerLift
    (D : DegreeData G) [IsTopologicalGroup G]
    (E : DegreeData.FiniteResidueAbstractExtension D)
    (L L' : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ E.base.toSubgroup)
    (hL'K' : L'.toSubgroup ≤ E.field.toSubgroup)
    (hL'L : L'.toSubgroup ≤ L.toSubgroup)
    [hLnormal : (extensionSubgroup E.base.field L hLK).Normal]
    [hL'normal : (extensionSubgroup E.field.field L' hL'K').Normal]
    (σ : D.FrobeniusElements E.field L' hL'K') :
    finiteReciprocityNaturalityRestriction
        E.base.field E.field.field L L' hLK hL'K' E.below hL'L
        (D.frobeniusRestriction E.field L' hL'K' σ) =
      D.frobeniusRestriction E.base L hLK
        (D.finiteReciprocityNaturalityFrobeniusTowerLift
          E L L' hLK hL'K' hL'L σ) := by
  change finiteReciprocityNaturalityRestriction
      E.base.field E.field.field L L' hLK hL'K' E.below hL'L
      (D.extensionRestriction E.field.field L' hL'K' σ.1) =
    D.extensionRestriction E.base.field L hLK
      (D.finiteReciprocityNaturalityFrobeniusTowerLift
        E L L' hLK hL'K' hL'L σ).1
  rw [D.finiteReciprocityNaturalityFrobeniusTowerLift_coe]
  refine Quotient.inductionOn' σ.1 ?_
  intro k'
  rfl

theorem finiteReciprocityNaturalityFrobeniusFixedField_le
    (D : DegreeData G) [IsTopologicalGroup G]
    (E : DegreeData.FiniteResidueAbstractExtension D)
    (L L' : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ E.base.toSubgroup)
    (hL'K' : L'.toSubgroup ≤ E.field.toSubgroup)
    (hL'L : L'.toSubgroup ≤ L.toSubgroup)
    [hLnormal : (extensionSubgroup E.base.field L hLK).Normal]
    [hL'normal : (extensionSubgroup E.field.field L' hL'K').Normal]
    (σ : D.FrobeniusElements E.field L' hL'K') :
    (D.frobeniusFixedField E.field L' hL'K' σ).toSubgroup ≤
      (D.frobeniusFixedField E.base L hLK
        (D.finiteReciprocityNaturalityFrobeniusTowerLift
          E L L' hLK hL'K' hL'L σ)).toSubgroup := by
  rintro g ⟨k', hk', rfl⟩
  let k : E.base.field.toSubgroup := Subgroup.inclusion E.below k'
  refine ⟨k, ?_, rfl⟩
  change QuotientGroup.mk k ∈
    (D.frobeniusClosure E.base L hLK
      (D.finiteReciprocityNaturalityFrobeniusTowerLift
        E L L' hLK hL'K' hL'L σ)).toSubgroup
  change QuotientGroup.mk k' ∈
    (D.frobeniusClosure E.field L' hL'K' σ).toSubgroup at hk'
  have hmap := map_mem_closedSubgroupGenerated_singleton
    (D.finiteReciprocityNaturalityFrobeniusTowerMapContinuous
      E.base.field E.field.field L L' hLK hL'K' E.below hL'L) σ.1 (by
        simpa [DegreeData.frobeniusClosure] using hk')
  let f := D.finiteReciprocityNaturalityFrobeniusTowerMap
    E.base.field E.field.field L L' hLK hL'K' E.below hL'L
  change f (QuotientGroup.mk k') ∈
    (closedSubgroupGenerated ({f σ.1} : Set _) : Subgroup _) at hmap
  simp [DegreeData.frobeniusClosure]
  change f (QuotientGroup.mk k') ∈
    (closedSubgroupGenerated ({f σ.1} : Set _) : Subgroup _)
  exact hmap

theorem finiteReciprocityNaturalityFrobeniusFixedField_isTotallyRamified
    (D : DegreeData G) [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    (E : DegreeData.FiniteResidueAbstractExtension D)
    (L L' : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ E.base.toSubgroup)
    (hL'K' : L'.toSubgroup ≤ E.field.toSubgroup)
    (hL'L : L'.toSubgroup ≤ L.toSubgroup)
    [hLnormal : (extensionSubgroup E.base.field L hLK).Normal]
    [hL'normal : (extensionSubgroup E.field.field L' hL'K').Normal]
    [Finite
      (E.base.toSubgroup ⧸ extensionSubgroup E.base.field L hLK)]
    [hL'K'finite : Finite
      (E.field.toSubgroup ⧸ extensionSubgroup E.field.field L' hL'K')]
    (σ : D.FrobeniusElements E.field L' hL'K') :
    (DegreeData.AbstractExtension.mk
      (D.frobeniusFixedField E.field L' hL'K' σ)
      (D.frobeniusFixedField E.base L hLK
        (D.finiteReciprocityNaturalityFrobeniusTowerLift
          E L L' hLK hL'K' hL'L σ))
      (D.finiteReciprocityNaturalityFrobeniusFixedField_le
        E L L' hLK hL'K' hL'L σ)).IsTotallyRamified D := by
  let τ := D.finiteReciprocityNaturalityFrobeniusTowerLift
    E L L' hLK hL'K' hL'L σ
  let S' := D.frobeniusFixedField E.field L' hL'K' σ
  let S := D.frobeniusFixedField E.base L hLK τ
  let hS'S := D.finiteReciprocityNaturalityFrobeniusFixedField_le
    E L L' hLK hL'K' hL'L σ
  let FS := D.frobeniusFixedResidueField E.base L hLK τ
  let FS' := D.frobeniusFixedResidueField E.field L' hL'K' σ
  have hresidue : (FS.residueDegree : ℕ) = (FS'.residueDegree : ℕ) := by
    calc
      (FS.residueDegree : ℕ) =
          D.frobeniusExponent E.base L hLK τ *
            (E.base.residueDegree : ℕ) :=
        D.frobeniusFixedResidueField_residueDegree E.base L hLK τ
      _ = ((E.residueDegree : ℕ) *
            D.frobeniusExponent E.field L' hL'K' σ) *
          (E.base.residueDegree : ℕ) := by
        rw [D.finiteReciprocityNaturalityFrobeniusTowerLift_exponent]
      _ = D.frobeniusExponent E.field L' hL'K' σ *
          ((E.residueDegree : ℕ) * (E.base.residueDegree : ℕ)) := by
        ac_rfl
      _ = D.frobeniusExponent E.field L' hL'K' σ *
          (E.field.residueDegree : ℕ) := by
        rw [E.residueDegree_mul_absoluteResidueDegree D]
      _ = (FS'.residueDegree : ℕ) :=
        (D.frobeniusFixedResidueField_residueDegree E.field L' hL'K' σ).symm
  let hS'K' := D.frobeniusFixedField_le E.field L' hL'K' σ
  let hSK := D.frobeniusFixedField_le E.base L hLK τ
  let : Finite (E.field.toSubgroup ⧸
      extensionSubgroup E.field.field S' hS'K') :=
    D.frobeniusFixedField_finite E.field L' hL'K' σ
  let : Finite (E.base.toSubgroup ⧸
      extensionSubgroup E.base.field S hSK) :=
    D.frobeniusFixedField_finite E.base L hLK τ
  let : Finite (E.base.toSubgroup ⧸
      extensionSubgroup E.base.field S' (hS'K'.trans E.below)) :=
    relativeTowerQuotientFinite E.base.field E.field.field S' hS'K' E.below
  let hS'Sfinite : Finite
      (S.toSubgroup ⧸ extensionSubgroup S S' hS'S) :=
    FiniteIntermediateField.finite_extension_of_le
      (hS'S.trans hSK) hSK hS'S
  let ES'S : DegreeData.FiniteResidueAbstractExtension D :=
    { field := FS'
      base := FS
      below := hS'S
      finiteQuotient := hS'Sfinite }
  have hrelative : (ES'S.residueDegree : ℕ) = 1 := by
    change (ES'S.base.residueDegree : ℕ) =
      (ES'S.field.residueDegree : ℕ) at hresidue
    have hmul := ES'S.residueDegree_mul_absoluteResidueDegree D
    rw [← hresidue] at hmul
    have hpos : 0 < (ES'S.base.residueDegree : ℕ) :=
      ES'S.base.residueDegree.property
    nlinarith
  exact ES'S.toFiniteAbstractExtension.isTotallyRamified_of_residueDegree_eq_one
    D hrelative
end DegreeData

private theorem finiteReciprocityNaturality_tower_finite
    (K K' L' : ClosedSubgroup G)
    (hK'K : K'.toSubgroup ≤ K.toSubgroup)
    (hL'K' : L'.toSubgroup ≤ K'.toSubgroup)
    [Finite (K.toSubgroup ⧸ extensionSubgroup K K' hK'K)]
    [Finite (K'.toSubgroup ⧸ extensionSubgroup K' L' hL'K')] :
    Finite (K.toSubgroup ⧸
      extensionSubgroup K L' (hL'K'.trans hK'K)) :=
  relativeTowerQuotientFinite K K' L' hL'K' hK'K
end GroupOnly
section Representation
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]

def finiteReciprocityNaturalityNormMap
    (A : Rep ℤ G) (K K' L L' : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.toSubgroup)
    (hL'K' : L'.toSubgroup ≤ K'.toSubgroup)
    (hK'K : K'.toSubgroup ≤ K.toSubgroup)
    (hL'L : L'.toSubgroup ≤ L.toSubgroup)
    [hLKfinite : Finite
      (K.toSubgroup ⧸ extensionSubgroup K L hLK)]
    [hL'K'finite : Finite
      (K'.toSubgroup ⧸ extensionSubgroup K' L' hL'K')]
    [hK'Kfinite : Finite
      (K.toSubgroup ⧸ extensionSubgroup K K' hK'K)] :
    FiniteNormQuotient A K' L' hL'K' →+
      FiniteNormQuotient A K L hLK := by
  letI hL'Kfinite : Finite (K.toSubgroup ⧸
      extensionSubgroup K L' (hL'K'.trans hK'K)) :=
    finiteReciprocityNaturality_tower_finite K K' L' hK'K hL'K'
  letI hL'Lfinite : Finite
      (L.toSubgroup ⧸ extensionSubgroup L L' hL'L) :=
    FiniteIntermediateField.finite_extension_of_le
      (hL'L.trans hLK) hLK hL'L
  let f : ambientFixedAddSubgroup A K' →+ FiniteNormQuotient A K L hLK :=
    (finiteNormClassHom A K L hLK).comp (relativeNorm A K K' hK'K)
  apply finiteNormQuotientLift A K' L' hL'K' f
  rintro _ ⟨a, rfl⟩
  let TLL' : DegreeData.FiniteTower G :=
    { top := L'
      middle := L
      base := K
      top_le_middle := hL'L
      middle_le_base := hLK
      finiteTopQuotient := hL'Lfinite
      finiteBaseQuotient := hLKfinite }
  let TKK' : DegreeData.FiniteTower G :=
    { top := L'
      middle := K'
      base := K
      top_le_middle := hL'K'
      middle_le_base := hK'K
      finiteTopQuotient := hL'K'finite
      finiteBaseQuotient := hK'Kfinite }
  apply (finiteNormClass_eq_zero_iff A K L hLK _).2
  refine ⟨relativeNorm A L L' hL'L a, ?_⟩
  calc
    relativeNorm A K L hLK (relativeNorm A L L' hL'L a) =
        relativeNorm A K L' (hL'L.trans hLK) a :=
      TLL'.norm_trans_apply A a
    _ = relativeNorm A K L' (hL'K'.trans hK'K) a := by
      congr 2
    _ = relativeNorm A K K' hK'K (relativeNorm A K' L' hL'K' a) :=
      (TKK'.norm_trans_apply A a).symm
 
@[simp]
theorem finiteReciprocityNaturalityNormMap_finiteNormClass
    (A : Rep ℤ G) (K K' L L' : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.toSubgroup)
    (hL'K' : L'.toSubgroup ≤ K'.toSubgroup)
    (hK'K : K'.toSubgroup ≤ K.toSubgroup)
    (hL'L : L'.toSubgroup ≤ L.toSubgroup)
    [hLKfinite : Finite
      (K.toSubgroup ⧸ extensionSubgroup K L hLK)]
    [Finite
      (K'.toSubgroup ⧸ extensionSubgroup K' L' hL'K')]
    [hK'Kfinite : Finite
      (K.toSubgroup ⧸ extensionSubgroup K K' hK'K)]
    (a : ambientFixedAddSubgroup A K') :
    finiteReciprocityNaturalityNormMap A K K' L L' hLK hL'K' hK'K hL'L
        (finiteNormClass A K' L' hL'K' a) =
      finiteNormClass A K L hLK (relativeNorm A K K' hK'K a) :=
  by
    simp [finiteReciprocityNaturalityNormMap]
    rfl

theorem finiteReciprocityNaturality_norm_tower_class
    (A : Rep ℤ G)
    (K K' L L' S S' : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.toSubgroup)
    (hL'K' : L'.toSubgroup ≤ K'.toSubgroup)
    (hK'K : K'.toSubgroup ≤ K.toSubgroup)
    (hL'L : L'.toSubgroup ≤ L.toSubgroup)
    (hSK : S.toSubgroup ≤ K.toSubgroup)
    (hS'K' : S'.toSubgroup ≤ K'.toSubgroup)
    (hS'S : S'.toSubgroup ≤ S.toSubgroup)
    [hLKfinite : Finite (K.toSubgroup ⧸ extensionSubgroup K L hLK)]
    [hL'K'finite : Finite (K'.toSubgroup ⧸ extensionSubgroup K' L' hL'K')]
    [hK'Kfinite : Finite (K.toSubgroup ⧸ extensionSubgroup K K' hK'K)]
    [hSKfinite : Finite (K.toSubgroup ⧸ extensionSubgroup K S hSK)]
    [hS'K'finite : Finite (K'.toSubgroup ⧸ extensionSubgroup K' S' hS'K')]
    [hS'Sfinite : Finite (S.toSubgroup ⧸ extensionSubgroup S S' hS'S)]
    (π : ambientFixedAddSubgroup A S') :
    finiteReciprocityNaturalityNormMap A K K' L L' hLK hL'K' hK'K hL'L
        (finiteNormClass A K' L' hL'K'
          (relativeNorm A K' S' hS'K' π)) =
      finiteNormClass A K L hLK
        (relativeNorm A K S hSK (relativeNorm A S S' hS'S π)) := by
  let hS'Kfinite : Finite (K.toSubgroup ⧸
      extensionSubgroup K S' (hS'K'.trans hK'K)) :=
    finiteReciprocityNaturality_tower_finite K K' S' hK'K hS'K'
  let TKK' : DegreeData.FiniteTower G :=
    { top := S'
      middle := K'
      base := K
      top_le_middle := hS'K'
      middle_le_base := hK'K
      finiteTopQuotient := hS'K'finite
      finiteBaseQuotient := hK'Kfinite }
  let TSS' : DegreeData.FiniteTower G :=
    { top := S'
      middle := S
      base := K
      top_le_middle := hS'S
      middle_le_base := hSK
      finiteTopQuotient := hS'Sfinite
      finiteBaseQuotient := hSKfinite }
  rw [finiteReciprocityNaturalityNormMap_finiteNormClass]
  apply congrArg (finiteNormClass A K L hLK)
  calc
    relativeNorm A K K' hK'K (relativeNorm A K' S' hS'K' π) =
        relativeNorm A K S' (hS'K'.trans hK'K) π :=
      TKK'.norm_trans_apply A π
    _ = relativeNorm A K S' (hS'S.trans hSK) π := by
      congr 2
    _ = relativeNorm A K S hSK (relativeNorm A S S' hS'S π) :=
      (TSS'.norm_trans_apply A π).symm
namespace DegreeData
end DegreeData
end Representation
section GroupOnly
variable {G : Type u} [Group G] [TopologicalSpace G]
namespace DegreeData

instance finiteReciprocityNaturalityFiniteResidueConjugate_normal
    (D : DegreeData G) [IsTopologicalGroup G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup) (s : G)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal] :
    (extensionSubgroup (K.conjugate s).field
      (conjugateClosedSubgroup L s)
      (conjugateClosedSubgroup_mono hLK s)).Normal := by
  change
    (extensionSubgroup (conjugateClosedSubgroup K.field s)
      (conjugateClosedSubgroup L s)
      (conjugateClosedSubgroup_mono hLK s)).Normal
  infer_instance
section ConjugateFrobeniusQuotients
local instance finiteReciprocityNaturalityConjugateInertia_normal
    (D : DegreeData G) [IsTopologicalGroup G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup) (s : G)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal] :
    (D.extensionInertiaWithin (K.conjugate s).field
      (conjugateClosedSubgroup L s)
      (conjugateClosedSubgroup_mono hLK s)).Normal :=
  D.extensionInertiaWithin_normal
    (K.conjugate s).field (conjugateClosedSubgroup L s)
    (conjugateClosedSubgroup_mono hLK s)
    (hLnormal := D.finiteReciprocityNaturalityFiniteResidueConjugate_normal
      K L hLK s (hLnormal := hLnormal))
end ConjugateFrobeniusQuotients
end DegreeData
end GroupOnly
section Representation
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
namespace DegreeData

end DegreeData
end Representation
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

/- ClassFieldTheory.AbstractClassFieldTheory.Reciprocity.Core -/
section
namespace ClassFormation
open KummerTheory
open CyclicCohomology
noncomputable section
open CategoryTheory
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
variable {D : DegreeData G} {A : Rep ℤ G}
namespace ValuationData
end ValuationData
noncomputable section
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
 
def abstractReciprocityRestriction
    {G : Type*} [Group G] [TopologicalSpace G]
    (K M L : ClosedSubgroup G)
    (hLM : L.toSubgroup ≤ M.toSubgroup)
    (hMK : M.toSubgroup ≤ K.toSubgroup)
    [hLnormal :
      (extensionSubgroup K L (hLM.trans hMK)).Normal]
    [hMnormal : (extensionSubgroup K M hMK).Normal] :
    (K.toSubgroup ⧸ extensionSubgroup K L (hLM.trans hMK)) →*
      (K.toSubgroup ⧸ extensionSubgroup K M hMK) := by
  apply QuotientGroup.map
    (extensionSubgroup K L (hLM.trans hMK))
    (extensionSubgroup K M hMK)
    (MonoidHom.id K.toSubgroup)
  intro k hk
  exact hLM hk

@[simp]
theorem abstractReciprocityRestriction_mk
    {G : Type*} [Group G] [TopologicalSpace G]
    (K M L : ClosedSubgroup G)
    (hLM : L.toSubgroup ≤ M.toSubgroup)
    (hMK : M.toSubgroup ≤ K.toSubgroup)
    [hLnormal :
      (extensionSubgroup K L (hLM.trans hMK)).Normal]
    [hMnormal : (extensionSubgroup K M hMK).Normal]
    (k : K.toSubgroup) :
    abstractReciprocityRestriction K M L hLM hMK (QuotientGroup.mk k) =
      QuotientGroup.mk k :=
  rfl
 
theorem abstractReciprocityRestriction_surjective
    {G : Type*} [Group G] [TopologicalSpace G]
    (K M L : ClosedSubgroup G)
    (hLM : L.toSubgroup ≤ M.toSubgroup)
    (hMK : M.toSubgroup ≤ K.toSubgroup)
    [hLnormal :
      (extensionSubgroup K L (hLM.trans hMK)).Normal]
    [hMnormal : (extensionSubgroup K M hMK).Normal] :
    Function.Surjective (abstractReciprocityRestriction K M L hLM hMK) := by
  intro q
  refine QuotientGroup.induction_on q ?_
  intro k
  exact ⟨QuotientGroup.mk k, rfl⟩

theorem finiteReciprocityNaturalityRestriction_sameBase_eq_restriction
    {G : Type*} [Group G] [TopologicalSpace G]
    (K M L : ClosedSubgroup G)
    (hLM : L.toSubgroup ≤ M.toSubgroup)
    (hMK : M.toSubgroup ≤ K.toSubgroup)
    [hLnormal :
      (extensionSubgroup K L (hLM.trans hMK)).Normal]
    [hMnormal : (extensionSubgroup K M hMK).Normal] :
    finiteReciprocityNaturalityRestriction K K M L hMK (hLM.trans hMK) le_rfl hLM =
      abstractReciprocityRestriction K M L hLM hMK := by
  apply MonoidHom.ext
  intro q
  refine QuotientGroup.induction_on q ?_
  intro k
  rfl

theorem abstractReciprocity_intermediateQuotient_finite
    {G : Type*} [Group G] [TopologicalSpace G]
    (K M L : ClosedSubgroup G)
    (hLM : L.toSubgroup ≤ M.toSubgroup)
    (hMK : M.toSubgroup ≤ K.toSubgroup)
    [hLnormal :
      (extensionSubgroup K L (hLM.trans hMK)).Normal]
    [hMnormal : (extensionSubgroup K M hMK).Normal]
    [hLfinite : Finite
      (K.toSubgroup ⧸ extensionSubgroup K L (hLM.trans hMK))] :
    Finite (K.toSubgroup ⧸ extensionSubgroup K M hMK) :=
  Finite.of_surjective (abstractReciprocityRestriction K M L hLM hMK)
    (abstractReciprocityRestriction_surjective K M L hLM hMK)
 
theorem abstractReciprocity_lowerExtension_finite
    {G : Type*} [Group G] [TopologicalSpace G]
    (K M L : ClosedSubgroup G)
    (hLM : L.toSubgroup ≤ M.toSubgroup)
    (hMK : M.toSubgroup ≤ K.toSubgroup)
    [hLfinite : Finite
      (K.toSubgroup ⧸ extensionSubgroup K L (hLM.trans hMK))] :
    Finite (M.toSubgroup ⧸ extensionSubgroup M L hLM) := by
  let inclusion :
      (M.toSubgroup ⧸ extensionSubgroup M L hLM) →
        (K.toSubgroup ⧸ extensionSubgroup K L (hLM.trans hMK)) :=
    Quotient.map' (Subgroup.inclusion hMK) (by
      intro x y hxy
      rw [QuotientGroup.leftRel_apply] at hxy ⊢
      apply (mem_extensionSubgroup_iff K L (hLM.trans hMK) _).2
      simpa using (mem_extensionSubgroup_iff M L hLM _).1 hxy)
  apply Finite.of_injective inclusion
  intro x y
  refine QuotientGroup.induction_on x ?_
  intro m
  refine QuotientGroup.induction_on y ?_
  intro n h
  apply QuotientGroup.eq.mpr
  apply (mem_extensionSubgroup_iff M L hLM (m⁻¹ * n)).2
  have h' :
      (QuotientGroup.mk (Subgroup.inclusion hMK m) :
          K.toSubgroup ⧸ extensionSubgroup K L (hLM.trans hMK)) =
        QuotientGroup.mk (Subgroup.inclusion hMK n) := by
    simpa [inclusion] using h
  have hmem := QuotientGroup.eq.mp h'
  have hG := (mem_extensionSubgroup_iff K L (hLM.trans hMK)
    ((Subgroup.inclusion hMK m)⁻¹ * Subgroup.inclusion hMK n)).1 hmem
  simpa using hG

theorem abstractReciprocity_finiteNormSubgroup_le
    (A : Rep ℤ G) (K M L : ClosedSubgroup G)
    (hLM : L.toSubgroup ≤ M.toSubgroup)
    (hMK : M.toSubgroup ≤ K.toSubgroup)
    [hKMfinite : Finite
      (K.toSubgroup ⧸ extensionSubgroup K M hMK)]
    [hMLfinite : Finite
      (M.toSubgroup ⧸ extensionSubgroup M L hLM)]
    [hKLfinite : Finite
      (K.toSubgroup ⧸ extensionSubgroup K L (hLM.trans hMK))] :
    finiteNormSubgroup A K L (hLM.trans hMK) ≤
      finiteNormSubgroup A K M hMK := by
  let T : DegreeData.FiniteTower G :=
    { top := L
      middle := M
      base := K
      top_le_middle := hLM
      middle_le_base := hMK
      finiteTopQuotient := hMLfinite
      finiteBaseQuotient := hKMfinite }
  rintro _ ⟨a, rfl⟩
  refine ⟨relativeNorm A M L hLM a, ?_⟩
  exact T.norm_trans_apply A a

def abstractReciprocityNormProjection
    (A : Rep ℤ G) (K M L : ClosedSubgroup G)
    (hLM : L.toSubgroup ≤ M.toSubgroup)
    (hMK : M.toSubgroup ≤ K.toSubgroup)
    [hLnormal :
      (extensionSubgroup K L (hLM.trans hMK)).Normal]
    [hMnormal : (extensionSubgroup K M hMK).Normal]
    [hKLfinite : Finite
      (K.toSubgroup ⧸ extensionSubgroup K L (hLM.trans hMK))] :
    letI : Finite (M.toSubgroup ⧸ extensionSubgroup M L hLM) :=
      abstractReciprocity_lowerExtension_finite K M L hLM hMK
    letI : Finite (K.toSubgroup ⧸ extensionSubgroup K M hMK) :=
      abstractReciprocity_intermediateQuotient_finite K M L hLM hMK
    FiniteNormQuotient A K L (hLM.trans hMK) →+
      FiniteNormQuotient A K M hMK := by
  letI : Finite (M.toSubgroup ⧸ extensionSubgroup M L hLM) :=
    abstractReciprocity_lowerExtension_finite K M L hLM hMK
  letI : Finite (K.toSubgroup ⧸ extensionSubgroup K M hMK) :=
    abstractReciprocity_intermediateQuotient_finite K M L hLM hMK
  apply finiteNormQuotientLift A K L (hLM.trans hMK)
    (finiteNormClassHom A K M hMK)
  intro a ha
  exact (finiteNormClass_eq_zero_iff A K M hMK a).2
    (abstractReciprocity_finiteNormSubgroup_le A K M L hLM hMK ha)

@[simp]
theorem abstractReciprocityNormProjection_finiteNormClass
    (A : Rep ℤ G) (K M L : ClosedSubgroup G)
    (hLM : L.toSubgroup ≤ M.toSubgroup)
    (hMK : M.toSubgroup ≤ K.toSubgroup)
    [hLnormal :
      (extensionSubgroup K L (hLM.trans hMK)).Normal]
    [hMnormal : (extensionSubgroup K M hMK).Normal]
    [hKLfinite : Finite
      (K.toSubgroup ⧸ extensionSubgroup K L (hLM.trans hMK))]
    (a : ambientFixedAddSubgroup A K) :
    letI : Finite (M.toSubgroup ⧸ extensionSubgroup M L hLM) :=
      abstractReciprocity_lowerExtension_finite K M L hLM hMK
    letI : Finite (K.toSubgroup ⧸ extensionSubgroup K M hMK) :=
      abstractReciprocity_intermediateQuotient_finite K M L hLM hMK
    abstractReciprocityNormProjection A K M L hLM hMK
        (finiteNormClass A K L (hLM.trans hMK) a) =
      finiteNormClass A K M hMK a := by
  let : Finite (M.toSubgroup ⧸ extensionSubgroup M L hLM) :=
    abstractReciprocity_lowerExtension_finite K M L hLM hMK
  let : Finite (K.toSubgroup ⧸ extensionSubgroup K M hMK) :=
    abstractReciprocity_intermediateQuotient_finite K M L hLM hMK
  simp [abstractReciprocityNormProjection]
  rfl

theorem finiteReciprocityNaturalityNormMap_sameBase_eq_normProjection
    (A : Rep ℤ G) (K M L : ClosedSubgroup G)
    (hLM : L.toSubgroup ≤ M.toSubgroup)
    (hMK : M.toSubgroup ≤ K.toSubgroup)
    [hLnormal :
      (extensionSubgroup K L (hLM.trans hMK)).Normal]
    [hMnormal : (extensionSubgroup K M hMK).Normal]
    [hKLfinite : Finite
      (K.toSubgroup ⧸ extensionSubgroup K L (hLM.trans hMK))] :
    letI : Finite (M.toSubgroup ⧸ extensionSubgroup M L hLM) :=
      abstractReciprocity_lowerExtension_finite K M L hLM hMK
    letI : Finite (K.toSubgroup ⧸ extensionSubgroup K M hMK) :=
      abstractReciprocity_intermediateQuotient_finite K M L hLM hMK
    letI : Finite (K.toSubgroup ⧸ extensionSubgroup K K le_rfl) :=
      (FiniteGaloisSubextension.refl K).finite
    finiteReciprocityNaturalityNormMap A K K M L hMK (hLM.trans hMK) le_rfl hLM =
      abstractReciprocityNormProjection A K M L hLM hMK := by
  let : Finite (M.toSubgroup ⧸ extensionSubgroup M L hLM) :=
    abstractReciprocity_lowerExtension_finite K M L hLM hMK
  let : Finite (K.toSubgroup ⧸ extensionSubgroup K M hMK) :=
    abstractReciprocity_intermediateQuotient_finite K M L hLM hMK
  let : Finite (K.toSubgroup ⧸ extensionSubgroup K K le_rfl) :=
    (FiniteGaloisSubextension.refl K).finite
  apply AddMonoidHom.ext
  intro q
  obtain ⟨a,rfl⟩ := finiteNormClass_surjective A K L (hLM.trans hMK) q
  have hmap := finiteReciprocityNaturalityNormMap_finiteNormClass
    A K K M L hMK (hLM.trans hMK) le_rfl hLM a
  have hnorm := congrArg (finiteNormClass A K M hMK) (relativeNorm_self A K a)
  exact hmap.trans (hnorm.trans
    (abstractReciprocityNormProjection_finiteNormClass A K M L hLM hMK a).symm)
end
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
 
def upperQuotientMk (L : FiniteGaloisSubextension K)
    (S : Subgroup L.extensionQuotient) [S.Normal] :
    L.extensionQuotient →* L.upperQuotient S :=
  QuotientGroup.mk' S

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
 
@[simp]
theorem upperQuotientEquiv_mk_mk (L : FiniteGaloisSubextension K)
    (S : Subgroup L.extensionQuotient) [S.Normal] (k : K.toSubgroup) :
    L.upperQuotientEquiv S
        (L.upperQuotientMk S (L.extensionQuotientMk k)) =
      (L.intermediateFiniteGalois S inferInstance).extensionQuotientMk k := by
  let H := extensionSubgroup K L.field L.below
  let P := L.intermediateSubgroup S
  let π : K.toSubgroup →* L.extensionQuotient := L.extensionQuotientMk
  have hHP : H ≤ P := L.extensionSubgroup_le_intermediateSubgroup S
  have hmap : P.map π = S := L.intermediateSubgroup_map_quotient_eq S
  have hupper : extensionSubgroup K (L.intermediateField S)
      (L.intermediateField_le_base S) = P :=
    L.extensionSubgroup_intermediateField_eq S
  let : H.Normal := L.normal
  let : P.Normal := L.intermediateSubgroup_normal S inferInstance
  let : (P.map π).Normal := by rw [hmap]; infer_instance
  change
    (L.intermediateFiniteGalois S
        inferInstance).extensionQuotientMulEquiv.symm
      ((QuotientGroup.quotientMulEquivOfEq hupper.symm)
        ((QuotientGroup.quotientQuotientEquivQuotient H P hHP)
          ((QuotientGroup.quotientMulEquivOfEq hmap.symm)
            (QuotientGroup.mk (L.extensionQuotientMk k))))) =
      (L.intermediateFiniteGalois S inferInstance).extensionQuotientMk k
  apply
    (L.intermediateFiniteGalois S inferInstance).extensionQuotientMulEquiv.injective
  refine ((L.intermediateFiniteGalois S
    inferInstance).extensionQuotientMulEquiv.apply_symm_apply _).trans ?_
  refine Eq.trans ?_
    ((L.intermediateFiniteGalois S inferInstance).extensionQuotientMk_apply k).symm
  have hmk :
      L.extensionQuotientMk k =
        (QuotientGroup.mk k : K.toSubgroup ⧸ H) := by
    change L.extensionQuotientMulEquiv (L.extensionQuotientMk k) =
      (QuotientGroup.mk k : K.toSubgroup ⧸ H)
    exact L.extensionQuotientMk_apply k
  have hthird :
      (QuotientGroup.quotientQuotientEquivQuotient H P hHP)
          ((QuotientGroup.mk
            (QuotientGroup.mk k : K.toSubgroup ⧸ H)) :
              (K.toSubgroup ⧸ H) ⧸
                P.map (QuotientGroup.mk' H)) =
        (QuotientGroup.mk k : K.toSubgroup ⧸ P) := by
    exact
      QuotientGroup.quotientQuotientEquivQuotientAux_mk_mk H P hHP k
  calc
    _ =
        (QuotientGroup.quotientMulEquivOfEq hupper.symm)
          ((QuotientGroup.quotientQuotientEquivQuotient H P hHP)
            (QuotientGroup.mk (L.extensionQuotientMk k))) :=
      congrArg
        (fun q => (QuotientGroup.quotientMulEquivOfEq hupper.symm)
          ((QuotientGroup.quotientQuotientEquivQuotient H P hHP) q))
        (QuotientGroup.quotientMulEquivOfEq_mk hmap.symm (L.extensionQuotientMk k))
    _ =
        (QuotientGroup.quotientMulEquivOfEq hupper.symm)
          ((QuotientGroup.quotientQuotientEquivQuotient H P hHP)
            (QuotientGroup.mk (QuotientGroup.mk k : K.toSubgroup ⧸ H))) :=
      congrArg
        (fun q : K.toSubgroup ⧸ H =>
          (QuotientGroup.quotientMulEquivOfEq hupper.symm)
            ((QuotientGroup.quotientQuotientEquivQuotient H P hHP)
              (QuotientGroup.mk q))) hmk
    _ =
        (QuotientGroup.quotientMulEquivOfEq hupper.symm)
          (QuotientGroup.mk k : K.toSubgroup ⧸ P) :=
      congrArg (QuotientGroup.quotientMulEquivOfEq hupper.symm) hthird
    _ = _ := QuotientGroup.quotientMulEquivOfEq_mk hupper.symm k
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

def upperRestrictionHom (L : FiniteGaloisSubextension K)
    (S : Subgroup L.extensionQuotient) [S.Normal] :
    L.extensionQuotient →*
      K.toSubgroup ⧸ extensionSubgroup K (L.intermediateField S)
        (L.intermediateField_le_base S) :=
  (L.upperQuotientEquiv S).toMonoidHom.comp (QuotientGroup.mk' S)
 
@[simp]
theorem upperRestrictionHom_mk (L : FiniteGaloisSubextension K)
    (S : Subgroup L.extensionQuotient) [S.Normal] (k : K.toSubgroup) :
    L.upperRestrictionHom S
        (QuotientGroup.mk k : L.extensionQuotient) =
      QuotientGroup.mk k := by
  exact L.upperQuotientEquiv_mk_mk S k
 
theorem upperRestrictionHom_eq_one_iff (L : FiniteGaloisSubextension K)
    (S : Subgroup L.extensionQuotient) [S.Normal]
    (q : L.extensionQuotient) :
    L.upperRestrictionHom S q = 1 ↔ q ∈ S := by
  change L.upperQuotientEquiv S
      (L.upperQuotientMk S q) = 1 ↔ q ∈ S
  constructor
  · intro h
    apply (QuotientGroup.eq_one_iff q).1
    change L.upperQuotientMk S q = 1
    apply (L.upperQuotientEquiv S).injective
    exact h.trans ((L.upperQuotientEquiv S).map_one).symm
  · intro h
    have hmk : L.upperQuotientMk S q = 1 := by
      change (QuotientGroup.mk' S) q = 1
      exact (QuotientGroup.eq_one_iff q).2 h
    exact (congrArg (L.upperQuotientEquiv S) hmk).trans
      (L.upperQuotientEquiv S).map_one

theorem upperRestrictionHom_jointlyFaithful
    (L : FiniteGaloisSubextension K)
    {I : Type*} {C : I → Type*} [∀ i, Group (C i)]
    (f : ∀ i, L.extensionQuotient →* C i)
    (hfaithful : (⨅ i, MonoidHom.ker (f i)) = ⊥)
    (q : L.extensionQuotient) :
    (∀ i, L.upperRestrictionHom (MonoidHom.ker (f i)) q = 1) ↔
      q = 1 := by
  constructor
  · intro hq
    have hmem : q ∈ ⨅ i, MonoidHom.ker (f i) := by
      rw [Subgroup.mem_iInf]
      intro i
      exact (L.upperRestrictionHom_eq_one_iff
        (MonoidHom.ker (f i)) q).1 (hq i)
    rw [hfaithful, Subgroup.mem_bot] at hmem
    exact hmem
  · rintro rfl
    intro i
    exact map_one _

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

/- TunnellProfiniteCoordinate -/
section
namespace TunnellProfiniteCoordinate
open ClassFormation Topology Set
open scoped Classical
noncomputable section
abbrev R := ∀ n:ℕ+,ZMod (n:ℕ)
abbrev Z := (Int.castRingHom R).range.topologicalClosure
def evalHom : ZHat →+ R := AddMonoidHom.pi (fun n:ℕ+ => (zHatReduction n n.property).toAddMonoidHom)
theorem eval_cont : Continuous evalHom :=
  continuous_pi (fun n => (zHatReduction n n.property).continuous)
theorem eval_int (z:ℤ) : evalHom (z:ZHat) = (Int.castRingHom R) z := by ext n; exact zHatReduction_intCast n n.property z
theorem inRange (x:ZHat) : evalHom x ∈ Z := by
  have dense : DenseRange (Int.cast : ℤ → ZHat) := denseRange_intCast_zHat
  have h : Continuous fun y:ZHat=>evalHom y := eval_cont
  have closed : IsClosed ((evalHom : ZHat → R) ⁻¹' (Z : Set R)) := (isClosed_closure (s:=((Int.castRingHom R).range : Set R))).preimage h
  exact dense.induction_on x closed (fun z => eval_int z ▸ Subring.le_topologicalClosure _ ⟨z,rfl⟩)
def coords : ZHat →+ Z.toAddSubgroup := evalHom.codRestrict Z.toAddSubgroup inRange
theorem bijective : Function.Bijective coords := by
  constructor
  · intro a b h
    apply ZHat.ext
    intro n hn
    exact congrFun (congrArg Subtype.val h) ⟨n,hn⟩
  · intro x
    have closed : IsClosed (Set.range evalHom) := isCompact_range eval_cont |>.isClosed
    have contains : ((Int.castRingHom R).range : Set R) ⊆ Set.range evalHom := by
      rintro _ ⟨z,rfl⟩
      exact ⟨_,eval_int z⟩
    obtain ⟨y,hy⟩ := closure_minimal contains closed x.property
    exact ⟨y,Subtype.ext hy⟩
def equiv : ZHat ≃+ Z := AddEquiv.ofBijective coords bijective
theorem continuous_equiv : Continuous equiv := eval_cont.subtype_mk _
theorem continuous_inv : Continuous equiv.symm :=
  (Continuous.homeoOfEquivCompactToT2 continuous_equiv).symm.continuous
end
end TunnellProfiniteCoordinate
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

/- TunnellAbstractValueCoordinates -/
section
namespace TunnellAbstractValueCoordinates
open ClassFormation KummerTheory TunnellAbstractNormCoordinates
open scoped Classical
noncomputable section
private abbrev I := TunnellProfiniteCoordinate.equiv
private abbrev Z := TunnellProfiniteCoordinate.Z
theorem int_coord (m : ℤ) : I (m : ZHat) = (m : Z) :=
  Subtype.ext (TunnellProfiniteCoordinate.eval_int m)
set_option maxHeartbeats 1600000 in
theorem divides_iff {P : Type} [AddCommGroup P] (v : P →+ ZHat)
    (integers : ∀ m : ℤ, (m : ZHat) ∈ v.range) (n : ℕ+) :
    Function.Bijective (canonicalValueQuotientMap v.range n n.property) ↔
      ∀ x : P, zHatReduction n n.property (v x) = 0 → ∃ y : P, (n : ℕ) • v y = v x := by
  let q := QuotientAddGroup.mk' (nsmulWithin v.range n)
  let c := canonicalValueQuotientMap v.range n n.property
  constructor
  · intro hc x hx
    let a : v.range := ⟨v x,⟨x,rfl⟩⟩
    have eq : q a = 0 := hc.injective ((show c (q a) = 0 from hx).trans (map_zero c).symm)
    obtain ⟨b,hb⟩ := (QuotientAddGroup.eq_zero_iff a).mp eq
    obtain ⟨y,hy⟩ := b.property
    have hb' : (n : ℕ) • (b : ZHat) = v x := congrArg Subtype.val hb
    exact ⟨y, (congrArg ((n : ℕ) • ·) hy).trans hb'⟩
  · intro hdiv
    constructor
    · intro a b
      obtain ⟨a,rfl⟩ := QuotientAddGroup.mk'_surjective _ a
      obtain ⟨b,rfl⟩ := QuotientAddGroup.mk'_surjective _ b
      intro h
      apply QuotientAddGroup.eq_iff_sub_mem.mpr
      obtain ⟨x,hx⟩ := (a - b).property
      have h0 : zHatReduction n n.property (v x) = 0 := by
        rw [hx]
        change zHatReduction n n.property (a.val - b.val) = 0
        rw [map_sub]
        exact sub_eq_zero.mpr h
      obtain ⟨y,hy⟩ := hdiv x h0
      exact ⟨(⟨v y,⟨y,rfl⟩⟩ : v.range), Subtype.ext (hy.trans hx)⟩
    · intro z
      let a : v.range := ⟨((z.val : ℤ) : ZHat), integers z.val⟩
      refine ⟨q a, ?_⟩
      change zHatReduction n n.property ((z.val : ℤ) : ZHat) = z
      exact (zHatReduction_intCast n n.property (z.val : ℤ)).trans (by simp)
variable {G : Type} [Group G] [TopologicalSpace G]
theorem index_degree (D : DegreeData G) (H : FiniteAbstractField G) :
    ((U H.field).map D.degree.toMonoidHom).index = (H.residueDegree D : ℕ) := by
  rw [← D.fieldImage_eq_map]
  exact D.fieldImageAdd_index (H.toFiniteResidueAbstractField D)
abbrev e := I.toMultiplicative
theorem index_equiv {X Y : Type*} [Group X] [Group Y] (f : G →* X) (i : X ≃* Y)
    (H : Subgroup G) : (H.map (i.toMonoidHom.comp f)).index = (H.map f).index := by
  rw [← Subgroup.map_map]
  exact Subgroup.index_map_equiv _ _
theorem index_coord (d : G →* Multiplicative ZHat) (H : ClosedSubgroup G) :
    ((U H).map (e.toMonoidHom.comp d)).index = ((U H).map d).index :=
  index_equiv d e (U H)
set_option maxHeartbeats 1600000 in
theorem value_norm_iff (A : Rep ℤ G) (D : DegreeData G)
    (v : ambientFixedAddSubgroup A (baseField G) →+ ZHat)
    (H : FiniteAbstractField G) :
    (v.comp (normToBase A H.field)).range = nsmulImage v.range (H.residueDegree D : ℕ) ↔
      ∀ z : Z, (∃ x : B A (baseField G), N A (baseField G) H.field x.val ∧ I (v x) = z) ↔
        ∃ x, ((U H.field).map (e.toMonoidHom.comp D.degree.toMonoidHom)).index • I (v x) = z := by
  rw [index_coord, index_degree]
  constructor
  · intro hr z
    constructor
    · rintro ⟨a,ha,rfl⟩
      obtain ⟨b,hb⟩ := (native_norm A _ _ (le_baseField H.field) a).mp ha
      obtain ⟨_,⟨x,rfl⟩,hx⟩ := hr.le (show v a ∈ (v.comp (normToBase A H.field)).range from
        ⟨b,congrArg v hb⟩)
      exact ⟨x, (map_nsmul I _ _).symm.trans (congrArg I hx)⟩
    · rintro ⟨x,rfl⟩
      obtain ⟨b,hb⟩ := hr.ge (show (H.residueDegree D : ℕ) • v x ∈ nsmulImage v.range _ from
        ⟨_,⟨x,rfl⟩,rfl⟩)
      refine ⟨_,(native_norm A _ _ (le_baseField H.field) _).mpr ⟨b,rfl⟩,?_⟩
      exact (congrArg I hb).trans (map_nsmul I _ _)
  · intro h
    ext z
    constructor
    · rintro ⟨b,rfl⟩
      obtain ⟨x,hx⟩ := (h _).mp ⟨_,(native_norm A _ _ (le_baseField H.field) _).mpr ⟨b,rfl⟩,rfl⟩
      exact ⟨_,⟨x,rfl⟩, I.injective ((map_nsmul I _ _).trans hx)⟩
    · rintro ⟨_,⟨x,rfl⟩,rfl⟩
      obtain ⟨a,ha,hv⟩ := (h _).mpr ⟨x,rfl⟩
      obtain ⟨b,hb⟩ := (native_norm A _ _ (le_baseField H.field) a).mp ha
      exact ⟨b,(congrArg v hb).trans (I.injective (hv.trans (map_nsmul I _ _).symm))⟩
end
end TunnellAbstractValueCoordinates
end

/- TunnellFrobeniusCoordinates -/
section
namespace TunnellFrobeniusCoordinates
open ClassFormation CyclicCohomology KummerTheory TunnellAbstractNormCoordinates TunnellAbstractValueCoordinates
open scoped Classical
noncomputable section
variable {G : Type} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
abbrev coordinate (D : DegreeData G) := TunnellAbstractValueCoordinates.e.toMonoidHom.comp D.degree.toMonoidHom
abbrev inertia (d : G →* Multiplicative TunnellProfiniteCoordinate.Z) (H J : ClosedSubgroup G) :=
  M H J ⊓ (d.comp (U H).subtype).ker
instance normal (d : G →* Multiplicative TunnellProfiniteCoordinate.Z) (H J : ClosedSubgroup G)
    [(M H J).Normal] : (inertia d H J).Normal := Subgroup.normal_inf_normal _ _
def shape (H : ClosedSubgroup G) (I : Subgroup (U H)) [I.Normal] (t : U H) : Subgroup G :=
  ((Subgroup.zpowers (QuotientGroup.mk' I t)).topologicalClosure.comap (QuotientGroup.mk' I)).map (U H).subtype
theorem inertia_eq (D : DegreeData G) (H J : ClosedSubgroup G) (h : J ≤ H) :
    inertia (coordinate D) H J = D.extensionInertiaWithin H J h := by
  ext t
  change (_ ∧ TunnellAbstractValueCoordinates.e (D.degree t.val) = 1) ↔ (_ ∧ D.degree t.val = 1)
  rw [TunnellAbstractValueCoordinates.e.map_eq_one_iff]
theorem fixed (D : DegreeData G) (K : FiniteAbstractField G) (J : ClosedSubgroup G) (h : J ≤ K.field)
    [(M K.field J).Normal] (t : U K.field)
    (σ : D.FrobeniusElements (K.toFiniteResidueAbstractField D) J h)
    (ht : σ.val = QuotientGroup.mk t) :
    shape K.field (inertia (coordinate D) K.field J) t = (D.frobeniusFixedField (K.toFiniteResidueAbstractField D) J h σ).toSubgroup := by
  have shape_eq (I L : Subgroup (U K.field)) [I.Normal] [L.Normal] (hIL : I = L) :
      shape K.field I t = shape K.field L t := by subst L; rfl
  rw [shape_eq _ _ (inertia_eq D K.field J h)]
  change (((Subgroup.zpowers (QuotientGroup.mk' _ t)).topologicalClosure.comap _).map _) =
    (((Subgroup.closure (Set.range (fun _ : Unit => σ.val))).topologicalClosure.comap _).map _)
  rw [Set.range_const,← Subgroup.zpowers_eq_closure,ht]
  rfl
theorem degree_iff (D : DegreeData G) (K : FiniteAbstractField G) (t : U K.field) (n : ℕ) :
    ((coordinate D t.val).toAdd = ((U K.field).map (coordinate D)).index • (n : TunnellProfiniteCoordinate.Z)) ↔
      (D.normalizedDegree (K.toFiniteResidueAbstractField D) t).toAdd = (n : ZHat) := by
  let i := TunnellProfiniteCoordinate.equiv
  let KR := K.toFiniteResidueAbstractField D
  have norm := D.residueDegree_nsmul_normalizedDegree KR t
  have cn : i (n : ZHat) = (n : TunnellProfiniteCoordinate.Z) := by
    simpa using int_coord (n : ℤ)
  change i (D.degree t.val).toAdd = ((U K.field).map (coordinate D)).index • _ ↔ _
  rw [index_coord,index_degree,← cn,← map_nsmul,i.injective.eq_iff]
  rw [← norm]
  exact (zHatMulNat_injective KR.residueDegree.property).eq_iff
theorem prime_iff (D : DegreeData G) (A : Rep ℤ G) (V : ValuationData D A)
    (K : FiniteAbstractField G) (b : ambientFixedAddSubgroup A K.field) :
    TunnellProfiniteCoordinate.equiv (V.toAddMonoidHom (normToBase A K.field b)) =
      (((U K.field).map (coordinate D)).index : TunnellProfiniteCoordinate.Z) ↔ V.IsPrimeElement K b := by
  let i := TunnellProfiniteCoordinate.equiv
  rw [index_coord,index_degree]
  have cn : i ((K.residueDegree D : ℕ) : ZHat) = ((K.residueDegree D : ℕ) : TunnellProfiniteCoordinate.Z) := by
    simpa using int_coord ((K.residueDegree D : ℕ) : ℤ)
  rw [← cn,i.injective.eq_iff]
  have h := V.residueDegree_nsmul_dividedAt K b
  change V.toAddMonoidHom (normToBase A K.field b) = _ ↔ _
  constructor
  · intro ha
    apply Subtype.ext
    apply zHatMulNat_injective (K.residueDegree D).property
    change (K.residueDegree D : ℕ) • V.dividedAt K b = (K.residueDegree D : ℕ) • (1 : ZHat)
    simpa using h.trans ha
  · intro hp
    have hv : V.dividedAt K b = 1 := congrArg Subtype.val hp
    change V.normCompositeAt K b = _
    rw [← h,hv,nsmul_one]
end
end TunnellFrobeniusCoordinates
end

/- TunnellFrobeniusFamily -/
section
namespace TunnellFrobeniusFamily
open scoped Classical
noncomputable section
variable {G : Type} [Group G] [TopologicalSpace G]
abbrev U (H : ClosedSubgroup G) := H.toSubgroup
abbrev M (H J : ClosedSubgroup G) := (U J).subgroupOf (U H)
abbrev B (A : Rep ℤ G) (H : ClosedSubgroup G) :=
  letI : Module ℤ A.V := A.hV2
  (Representation.invariants (A.ρ.comp (U H).subtype)).toAddSubgroup
abbrev tr (A : Rep ℤ G) (H J : ClosedSubgroup G) (b : A.V) :=
  ∑ᶠ q : U H ⧸ M H J, A.ρ q.out.val b
abbrev P (G : Type) [Group G] [TopologicalSpace G] :=
  {p : ClosedSubgroup G × ClosedSubgroup G //
    (U p.1).FiniteIndex ∧ p.2 ≤ p.1 ∧ (M p.1 p.2).Normal ∧ Finite (U p.1 ⧸ M p.1 p.2)}
abbrev H (p : P G) := p.val.1
abbrev J (p : P G) := p.val.2
instance normal (p : P G) : (M (H p) (J p)).Normal := p.property.2.2.1
instance fnt (p : P G) : Fintype (U (H p) ⧸ M (H p) (J p)) := @Fintype.ofFinite _ p.property.2.2.2
abbrev Q (p : P G) := U (H p) ⧸ M (H p) (J p)
abbrev W (A : Rep ℤ G) (p : P G) :=
  AddSubgroup.closure { x : B A (H p) | ∃ b : B A (J p), tr A (H p) (J p) b.val = x.val }
theorem mem (A : Rep ℤ G) (p : P G) (x : B A (H p)) :
    x ∈ W A p ↔ ∃ b : B A (J p), tr A (H p) (J p) b.val = x.val := by
  letI : Module ℤ A.V := A.hV2
  let f : A.V →ₗ[ℤ] A.V := ∑ q : Q p, A.ρ q.out.val
  have eq (b : A.V) : f b = tr A (H p) (J p) b := by simp only [f,tr,finsum_eq_sum_of_fintype,LinearMap.sum_apply]
  let D := ((f.toAddMonoidHom.comp (B A (J p)).subtype).range.comap (B A (H p)).subtype)
  have hD (a : B A (H p)) : a ∈ D ↔ ∃ b : B A (J p), tr A (H p) (J p) b.val = a.val := by
    change (∃ b : B A (J p), f b.val = a.val) ↔ _
    simp only [eq]
  have he : W A p = D := by
    change AddSubgroup.closure _ = D
    rw [show {a : B A (H p) | ∃ b : B A (J p), tr A (H p) (J p) b.val = a.val} = (D : Set _) from
      Set.ext fun a => (hD a).symm, AddSubgroup.closure_eq]
  exact he ▸ hD x
end
end TunnellFrobeniusFamily
end

/- TunnellFrobeniusQuotient -/
section
namespace TunnellFrobeniusEvaluation
open ClassFormation KummerTheory TunnellAbstractNormCoordinates
open scoped Classical
noncomputable section
variable {G : Type} [Group G] [TopologicalSpace G]
def codomain (A : Rep ℤ G) (K : FiniteAbstractField G) (E : FiniteGaloisSubextension K.field)
    (W : AddSubgroup (ambientFixedAddSubgroup A K.field)) (hW : ∀ x, x ∈ W ↔ N A K.field E.field x.val) :
    letI := E.finite
    FiniteNormQuotient A K.field E.field E.below ≃+ ambientFixedAddSubgroup A K.field ⧸ W := by
  letI := E.finite
  have hw : finiteNormSubgroup A K.field E.field E.below = W := AddSubgroup.ext fun x =>
    ((native_norm A K.field E.field E.below x).symm.trans (hW x).symm)
  let nW : W.Normal := by
    constructor
    intro n hn z
    rw [add_comm z n,add_assoc,add_neg_cancel,add_zero]
    exact hn
  exact (finiteNormQuotientConcreteEquiv A K.field E.field E.below).trans
    (@QuotientAddGroup.quotientAddEquivOfEq (ambientFixedAddSubgroup A K.field) _ _ W _ nW hw)
end
end TunnellFrobeniusEvaluation
end

/- TunnellFrobeniusNormalization -/
section
namespace TunnellFrobeniusNormalization
open ClassFormation KummerTheory CyclicCohomology TunnellAbstractNormCoordinates TunnellAbstractValueCoordinates
open TunnellFrobeniusCoordinates
open scoped Classical
noncomputable section
variable {G : Type} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
  [TotallyDisconnectedSpace G]
abbrev tr (A : Rep ℤ G) (H J : ClosedSubgroup G) (b : A.V) :=
  ∑ᶠ q : U H ⧸ M H J, A.ρ q.out.val b
theorem tr_eq (A : Rep ℤ G) (H J : ClosedSubgroup G) (h : J ≤ H) [Finite (U H ⧸ M H J)]
    (b : B A J) : tr A H J b.val = (relativeNorm A H J h b).val := by
  letI : Fintype (U H ⧸ M H J) := Fintype.ofFinite _
  unfold tr
  rw [finsum_eq_sum_of_fintype]
  apply Finset.sum_congr rfl
  intro q _
  exact congrArg (relativeCosetAction A H J h b) (Quotient.out_eq' q)
abbrev Normalized (d : G →* Multiplicative TunnellProfiniteCoordinate.Z) (A : Rep ℤ G)
    (v : B A (baseField G) →+ TunnellProfiniteCoordinate.Z)
    (H J : ClosedSubgroup G) [(M H J).Normal] (W : AddSubgroup (B A H))
    (r : Additive (U H ⧸ M H J) →+ B A H ⧸ W) :=
  ∀ (t : U H) (n : ℕ+) (F : ClosedSubgroup G) (b : B A F) (a : B A (baseField G)) (x : B A H),
    (d t.val).toAdd = ((U H).map d).index • ((n : ℕ) : TunnellProfiniteCoordinate.Z) →
    U F = shape H (inertia d H J) t → tr A (baseField G) F b.val = a.val →
    v a = (((U F).map d).index : TunnellProfiniteCoordinate.Z) → tr A H F b.val = x.val →
    r (Additive.ofMul (t : U H ⧸ M H J)) = x
variable (D : DegreeData G) (A : Rep ℤ G) (V : ValuationData D A)
    (K : FiniteAbstractField G) (E : FiniteGaloisSubextension K.field)
local instance : (extensionSubgroup K.field E.field E.below).Normal := E.normal
local instance : Finite (K.field.toSubgroup ⧸ extensionSubgroup K.field E.field E.below) := E.finite
def PrimeFormula (W : AddSubgroup (B A K.field))
    (r : Additive E.extensionQuotient →+ B A K.field ⧸ W) : Prop :=
  ∀ σ : D.FrobeniusElements (K.toFiniteResidueAbstractField D) E.field E.below,
    let F := D.frobeniusFixedField (K.toFiniteResidueAbstractField D) E.field E.below σ
    let F' : FiniteAbstractField G := ⟨F,D.frobeniusFixedField_absoluteFinite K E.field E.below σ⟩
    letI : Finite (U K.field ⧸ M K.field F) := D.frobeniusFixedField_finite (K.toFiniteResidueAbstractField D) E.field E.below σ
    ∀ b : B A F, V.IsPrimeElement F' b →
      r (Additive.ofMul (D.frobeniusRestriction (K.toFiniteResidueAbstractField D) E.field E.below σ)) =
      QuotientAddGroup.mk (relativeNorm A K.field F (D.frobeniusFixedField_le (K.toFiniteResidueAbstractField D) E.field E.below σ) b)
set_option maxHeartbeats 1600000 in
theorem normalize (W : AddSubgroup (B A K.field))
    (r : Additive E.extensionQuotient →+ B A K.field ⧸ W) :
    letI := E.normal
    letI := E.finite
    PrimeFormula D A V K E W r ↔ Normalized (coordinate D) A
      (TunnellProfiniteCoordinate.equiv.toAddMonoidHom.comp V.toAddMonoidHom) K.field E.field W r := by
  letI := E.normal
  letI := E.finite
  constructor
  · intro h t n F b a x deg shp ha hb hx
    let σ : D.FrobeniusElements (K.toFiniteResidueAbstractField D) E.field E.below := ⟨QuotientGroup.mk t,
      n,n.property,by
        apply Multiplicative.toAdd.injective
        change (D.normalizedDegree (K.toFiniteResidueAbstractField D) t).toAdd = _
        simpa using (degree_iff D K t n).mp deg⟩
    have fi : F = D.frobeniusFixedField (K.toFiniteResidueAbstractField D) E.field E.below σ :=
      ClosedSubgroup.toSubgroup_injective (shp.trans (fixed D K E.field E.below t σ rfl))
    subst F
    let S := D.frobeniusFixedField (K.toFiniteResidueAbstractField D) E.field E.below σ
    let S' : FiniteAbstractField G := ⟨S,D.frobeniusFixedField_absoluteFinite K E.field E.below σ⟩
    letI : Finite (U (baseField G) ⧸ M (baseField G) S) := S'.finite
    letI : Finite (U K.field ⧸ M K.field S) := D.frobeniusFixedField_finite (K.toFiniteResidueAbstractField D) E.field E.below σ
    have a0 : normToBase A S b = a := Subtype.ext ((tr_eq A _ S (le_baseField S) b).symm.trans ha)
    have b0 : V.IsPrimeElement S' b := (prime_iff D A V S' b).mp ((congrArg (fun y => TunnellProfiniteCoordinate.equiv (V.toAddMonoidHom y)) a0).trans hb)
    exact (h σ b b0).trans (congrArg QuotientAddGroup.mk (Subtype.ext
      ((tr_eq A K.field S (D.frobeniusFixedField_le (K.toFiniteResidueAbstractField D) E.field E.below σ) b).symm.trans hx)))
  · intro h σ
    dsimp only
    intro b hb
    let S := D.frobeniusFixedField (K.toFiniteResidueAbstractField D) E.field E.below σ
    let S' : FiniteAbstractField G := ⟨S,D.frobeniusFixedField_absoluteFinite K E.field E.below σ⟩
    letI : Finite (U (baseField G) ⧸ M (baseField G) S) := S'.finite
    letI : Finite (U K.field ⧸ M K.field S) := D.frobeniusFixedField_finite (K.toFiniteResidueAbstractField D) E.field E.below σ
    let t := σ.val.out
    have ht : σ.val = QuotientGroup.mk t := (Quotient.out_eq' σ.val).symm
    obtain ⟨n,hn,hdegree⟩ := σ.property
    have nn : (D.normalizedDegree (K.toFiniteResidueAbstractField D) t).toAdd = (n : ZHat) := by
      have hz := congrArg (D.extensionNormalizedDegree (K.toFiniteResidueAbstractField D) E.field E.below) ht
      rw [hdegree, D.extensionNormalizedDegree_mk] at hz
      simpa using congrArg Multiplicative.toAdd hz.symm
    let hSK := D.frobeniusFixedField_le (K.toFiniteResidueAbstractField D) E.field E.below σ
    have eq := h t ⟨n,hn⟩ S b (normToBase A S b) (relativeNorm A K.field S hSK b)
      ((degree_iff D K t n).mpr nn) (fixed D K E.field E.below t σ ht).symm (tr_eq A _ S (le_baseField S) b)
      ((prime_iff D A V S' b).mpr hb) (tr_eq A K.field S hSK b)
    have cq : D.frobeniusRestriction (K.toFiniteResidueAbstractField D) E.field E.below σ = QuotientGroup.mk t :=
      congrArg (D.extensionRestriction K.field E.field E.below) ht
    exact (congrArg (fun z => r (Additive.ofMul z)) cq).trans eq
end
end TunnellFrobeniusNormalization
end

/- TunnellFrobeniusInput -/
section
namespace TunnellFrobeniusInput
open ClassFormation KummerTheory CyclicCohomology
noncomputable section
variable {G : Type} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
  [T2Space G] [TotallyDisconnectedSpace G]
class Family (D : DegreeData G) (A : Rep ℤ G) (v : ValuationData D A) where
  raw
    (K : FiniteAbstractField G) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    [hLfinite : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK)] :
    Additive (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK) →+
      FiniteNormQuotient A K.field L hLK
  prime
    (K : FiniteAbstractField G) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    [hLfinite : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK)]
    (q : Additive
      (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK))
    (σ : D.FrobeniusElements (K.toFiniteResidueAbstractField D) L hLK)
    (hσ : D.frobeniusRestriction
      (K.toFiniteResidueAbstractField D) L hLK σ = q.toMul)
    (π : ambientFixedAddSubgroup A
      (D.frobeniusFixedField (K.toFiniteResidueAbstractField D) L hLK σ))
    (hπ :
      let Sigma : FiniteAbstractField G :=
        { field := D.frobeniusFixedField
            (K.toFiniteResidueAbstractField D) L hLK σ
          finite := D.frobeniusFixedField_absoluteFinite K L hLK σ }
      v.IsPrimeElement Sigma π) :
    let KR := K.toFiniteResidueAbstractField D
    let S := D.frobeniusFixedField KR L hLK σ
    let hSK := D.frobeniusFixedField_le KR L hLK σ
    letI : Finite
        (K.field.toSubgroup ⧸ extensionSubgroup K.field S hSK) :=
      D.frobeniusFixedField_finite KR L hLK σ
    raw K L hLK q =
      finiteNormClass A K.field L hLK
        (relativeNorm A K.field S hSK π)
end
end TunnellFrobeniusInput
namespace ClassFormation.DegreeData
open ClassFormation KummerTheory CyclicCohomology TunnellFrobeniusInput
noncomputable section
variable {G : Type} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
  [T2Space G] [TotallyDisconnectedSpace G]
def finiteReciprocityHomGivenFamily
    (D : DegreeData G) (A : Rep ℤ G) (v : ValuationData D A) [n : Family D A v]
    (K : FiniteAbstractField G) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    [hLfinite : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK)] :
    Additive (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK) →+
      FiniteNormQuotient A K.field L hLK := n.raw K L hLK
theorem finiteReciprocityHom_apply_eq_primeNormClassGivenFamily
    (D : DegreeData G) (A : Rep ℤ G) (v : ValuationData D A) [n : Family D A v]
    (K : FiniteAbstractField G) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    [hLfinite : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK)]
    (q : Additive
      (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK))
    (σ : D.FrobeniusElements (K.toFiniteResidueAbstractField D) L hLK)
    (hσ : D.frobeniusRestriction
      (K.toFiniteResidueAbstractField D) L hLK σ = q.toMul)
    (π : ambientFixedAddSubgroup A
      (D.frobeniusFixedField (K.toFiniteResidueAbstractField D) L hLK σ))
    (hπ :
      let Sigma : FiniteAbstractField G :=
        { field := D.frobeniusFixedField
            (K.toFiniteResidueAbstractField D) L hLK σ
          finite := D.frobeniusFixedField_absoluteFinite K L hLK σ }
      v.IsPrimeElement Sigma π) :
    let KR := K.toFiniteResidueAbstractField D
    let S := D.frobeniusFixedField KR L hLK σ
    let hSK := D.frobeniusFixedField_le KR L hLK σ
    letI : Finite
        (K.field.toSubgroup ⧸ extensionSubgroup K.field S hSK) :=
      D.frobeniusFixedField_finite KR L hLK σ
    D.finiteReciprocityHomGivenFamily A v K L hLK q =
      finiteNormClass A K.field L hLK
        (relativeNorm A K.field S hSK π) := n.prime K L hLK q σ hσ π hπ
end
end ClassFormation.DegreeData
end

/- TunnellFrobeniusFamilyBridge -/
section
namespace TunnellFrobeniusFamilyBridge
open ClassFormation CyclicCohomology KummerTheory TunnellFrobeniusCoordinates TunnellFrobeniusNormalization
open TunnellFrobeniusFamily
open scoped Classical
noncomputable section
variable {G : Type} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
  [TotallyDisconnectedSpace G]
variable (D : DegreeData G) (A : Rep ℤ G) (V : ValuationData D A)
variable (r : ∀ p : P G, Additive (Q p) →+ B A (H p) ⧸ W A p)
variable (hn : ∀ p : P G, Normalized (coordinate D) A
  (TunnellProfiniteCoordinate.equiv.toAddMonoidHom.comp V.toAddMonoidHom) (H p) (J p) (W A p) (r p))
def point (K : FiniteAbstractField G) (E : FiniteGaloisSubextension K.field) : P G :=
  ⟨(K.field,E.field),TunnellAbstractNormCoordinates.finite_index K,E.below,E.normal,E.finite⟩
def quotient (K : FiniteAbstractField G) (E : FiniteGaloisSubextension K.field) :
    letI := E.finite
    FiniteNormQuotient A K.field E.field E.below ≃+
      B A (H (point K E)) ⧸ W A (point K E) :=
  let p := point K E
  TunnellFrobeniusEvaluation.codomain A K E (W A p) (mem A p)
def family : TunnellFrobeniusInput.Family D A V where
  raw K J h normal fin :=
    let E : FiniteGaloisSubextension K.field := ⟨J,h,normal,fin⟩
    (quotient A K E).symm.toAddMonoidHom.comp (r (point K E))
  prime K J h normal fin q σ hσ π prime := by
    let E : FiniteGaloisSubextension K.field := ⟨J,h,normal,fin⟩
    let p := point K E
    have data := (normalize D A V K E (W A p) (r p)).mpr (hn p)
    apply (quotient A K E).injective
    change quotient A K E ((quotient A K E).symm (r p q)) = _
    rw [(quotient A K E).apply_symm_apply]
    have eq : Additive.ofMul (D.frobeniusRestriction (K.toFiniteResidueAbstractField D) J h σ) = q :=
      congrArg Additive.ofMul hσ
    rw [← eq]
    exact data σ π prime
end
end TunnellFrobeniusFamilyBridge
end

/- TunnellNormalizedStep2 -/
section
section
universe u
namespace ClassFormation
open KummerTheory
open CyclicCohomology
open CategoryTheory
noncomputable section
open scoped BigOperators
section GroupOnly
variable {G : Type u} [Group G] [TopologicalSpace G]
namespace DegreeData
end DegreeData
private theorem finiteReciprocityNaturality_tower_finiteGivenFamily
    (K K' L' : ClosedSubgroup G)
    (hK'K : K'.toSubgroup ≤ K.toSubgroup)
    (hL'K' : L'.toSubgroup ≤ K'.toSubgroup)
    [Finite (K.toSubgroup ⧸ extensionSubgroup K K' hK'K)]
    [Finite (K'.toSubgroup ⧸ extensionSubgroup K' L' hL'K')] :
    Finite (K.toSubgroup ⧸
      extensionSubgroup K L' (hL'K'.trans hK'K)) :=
  relativeTowerQuotientFinite K K' L' hL'K' hK'K
end GroupOnly
section Representation
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
namespace DegreeData
theorem finiteReciprocityNaturality_restriction_norm_commutesGivenFamily
    (D : DegreeData G) (A : Rep ℤ G) (v : ValuationData D A)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    [TotallyDisconnectedSpace G] [TunnellFrobeniusInput.Family D A v]
    (E : FiniteAbstractFieldExtension G)
    (L L' : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ E.base.field.toSubgroup)
    (hL'K' : L'.toSubgroup ≤ E.field.field.toSubgroup)
    (hL'L : L'.toSubgroup ≤ L.toSubgroup)
    [hLnormal : (extensionSubgroup E.base.field L hLK).Normal]
    [hL'normal : (extensionSubgroup E.field.field L' hL'K').Normal]
    [hLKfinite : Finite
      (E.base.field.toSubgroup ⧸ extensionSubgroup E.base.field L hLK)]
    [hL'K'finite : Finite
      (E.field.field.toSubgroup ⧸
        extensionSubgroup E.field.field L' hL'K')] :
    (finiteReciprocityNaturalityNormMap A E.base.field E.field.field L L'
      hLK hL'K' E.below hL'L).comp
        (D.finiteReciprocityHomGivenFamily A v E.field L' hL'K') =
      (D.finiteReciprocityHomGivenFamily A v E.base L hLK).comp
      (finiteReciprocityNaturalityRestriction
          E.base.field E.field.field L L'
          hLK hL'K' E.below hL'L).toAdditive := by
  let ER := E.toFiniteResidueAbstractExtension D
  let hL'K'finiteER : Finite
      (ER.field.field.toSubgroup ⧸
        extensionSubgroup ER.field.field L' hL'K') := by
    change Finite
      (ER.field.field.toSubgroup ⧸
        extensionSubgroup ER.field.field L' hL'K') at hL'K'finite
    exact hL'K'finite
  let hLKfiniteER : Finite
      (ER.base.field.toSubgroup ⧸
        extensionSubgroup ER.base.field L hLK) := by
    change Finite
      (ER.base.field.toSubgroup ⧸
        extensionSubgroup ER.base.field L hLK) at hLKfinite
    exact hLKfinite
  let hLnormalERbase :
      (extensionSubgroup ER.base.field L hLK).Normal := by
    change (extensionSubgroup ER.base.field L hLK).Normal at hLnormal
    exact hLnormal
  let hL'normalERfield :
      (extensionSubgroup ER.field.field L' hL'K').Normal := by
    change (extensionSubgroup ER.field.field L' hL'K').Normal at hL'normal
    exact hL'normal
  apply AddMonoidHom.ext
  intro q
  let σ := D.chosenFiniteReciprocityFrobeniusLift ER.field L' hL'K' q.toMul
  let τ := D.finiteReciprocityNaturalityFrobeniusTowerLift
    ER L L' hLK hL'K' hL'L σ
  have hσ : D.frobeniusRestriction ER.field L' hL'K' σ = q.toMul :=
    D.frobeniusRestriction_chosenFiniteReciprocityFrobeniusLift
      ER.field L' hL'K' q.toMul
  have hτ : D.frobeniusRestriction ER.base L hLK τ =
      ((finiteReciprocityNaturalityRestriction
        E.base.field E.field.field L L'
        hLK hL'K' E.below hL'L).toAdditive q).toMul := by
    rw [← D.finiteReciprocityNaturalityRestriction_frobeniusTowerLift
      ER L L' hLK hL'K' hL'L σ, hσ]
    rfl
  let S' := D.frobeniusFixedField ER.field L' hL'K' σ
  let S := D.frobeniusFixedField ER.base L hLK τ
  let hS'K' := D.frobeniusFixedField_le ER.field L' hL'K' σ
  let hSK := D.frobeniusFixedField_le ER.base L hLK τ
  let hS'S := D.finiteReciprocityNaturalityFrobeniusFixedField_le
    ER L L' hLK hL'K' hL'L σ
  let hS'K'finite : Finite
      (E.field.field.toSubgroup ⧸
        extensionSubgroup E.field.field S' hS'K') :=
    D.frobeniusFixedField_finite ER.field L' hL'K' σ
  let hSKfinite : Finite
      (E.base.field.toSubgroup ⧸
        extensionSubgroup E.base.field S hSK) :=
    D.frobeniusFixedField_finite ER.base L hLK τ
  let hS'Kfinite : Finite
      (E.base.field.toSubgroup ⧸
        extensionSubgroup E.base.field S' (hS'K'.trans E.below)) :=
    finiteReciprocityNaturality_tower_finiteGivenFamily
      E.base.field E.field.field S' E.below hS'K'
  let hS'Sfinite : Finite
      (S.toSubgroup ⧸ extensionSubgroup S S' hS'S) :=
    FiniteIntermediateField.finite_extension_of_le
      (K := E.base.field) (hS'S.trans hSK) hSK hS'S
  let hSabsolute : Finite ((baseField G).toSubgroup ⧸
      extensionSubgroup (baseField G) S (le_baseField S)) :=
    D.frobeniusFixedField_absoluteFinite E.base L hLK τ
  let hS'absolute : Finite ((baseField G).toSubgroup ⧸
      extensionSubgroup (baseField G) S' (le_baseField S')) :=
    D.frobeniusFixedField_absoluteFinite E.field L' hL'K' σ
  let Sfinite : FiniteAbstractField G := ⟨S, hSabsolute⟩
  let S'finite : FiniteAbstractField G := ⟨S', hS'absolute⟩
  let ES'S : FiniteAbstractFieldExtension G :=
    { field := S'finite
      base := Sfinite
      below := hS'S
      finiteQuotient := hS'Sfinite }
  let π : ambientFixedAddSubgroup A S' := v.chosenPrimeElement S'finite
  have hπ : v.IsPrimeElement S'finite π := v.chosenPrimeElement_isPrime S'finite
  let πS : ambientFixedAddSubgroup A S := relativeNorm A S S' hS'S π
  have hTot : ES'S.IsTotallyRamified D := by
    have hTot' :=
      D.finiteReciprocityNaturalityFrobeniusFixedField_isTotallyRamified
        ER L L' hLK hL'K' hL'L σ
    change ES'S.IsTotallyRamified D at hTot'
    exact hTot'
  have hπS : v.IsPrimeElement Sfinite πS :=
    v.norm_prime_of_totallyRamified ES'S hTot π hπ
  change finiteReciprocityNaturalityNormMap
      A E.base.field E.field.field L L' hLK hL'K' E.below hL'L
      (D.finiteReciprocityHomGivenFamily A v E.field L' hL'K' q) =
    D.finiteReciprocityHomGivenFamily A v E.base L hLK
      ((finiteReciprocityNaturalityRestriction
        E.base.field E.field.field L L'
        hLK hL'K' E.below hL'L).toAdditive q)
  calc
    finiteReciprocityNaturalityNormMap
        A E.base.field E.field.field L L' hLK hL'K' E.below hL'L
        (D.finiteReciprocityHomGivenFamily A v E.field L' hL'K' q) =
      finiteReciprocityNaturalityNormMap
        A E.base.field E.field.field L L' hLK hL'K' E.below hL'L
        (finiteNormClass A E.field.field L' hL'K'
          (relativeNorm A E.field.field S' hS'K' π)) := by
      apply congrArg (finiteReciprocityNaturalityNormMap
        A E.base.field E.field.field L L' hLK hL'K' E.below hL'L)
      have hprime :=
        D.finiteReciprocityHom_apply_eq_primeNormClassGivenFamily
          A v E.field L' hL'K' q σ hσ π hπ
      change D.finiteReciprocityHomGivenFamily A v E.field L' hL'K' q =
        finiteNormClass A E.field.field L' hL'K'
          (relativeNorm A E.field.field S' hS'K' π) at hprime
      exact hprime
    _ = finiteNormClass A E.base.field L hLK
        (relativeNorm A E.base.field S hSK πS) := by
      exact finiteReciprocityNaturality_norm_tower_class
        A E.base.field E.field.field L L' S S'
        hLK hL'K' E.below hL'L hSK hS'K' hS'S π
    _ = D.finiteReciprocityHomGivenFamily A v E.base L hLK
        ((finiteReciprocityNaturalityRestriction
          E.base.field E.field.field L L'
          hLK hL'K' E.below hL'L).toAdditive q) := by
      symm
      have hprime :=
        D.finiteReciprocityHom_apply_eq_primeNormClassGivenFamily
          A v E.base L hLK _ τ hτ πS hπS
      change D.finiteReciprocityHomGivenFamily A v E.base L hLK _ =
        finiteNormClass A E.base.field L hLK
          (relativeNorm A E.base.field S hSK πS) at hprime
      exact hprime
end DegreeData
end Representation
section GroupOnly
variable {G : Type u} [Group G] [TopologicalSpace G]
namespace DegreeData

end DegreeData
end GroupOnly
section Representation
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
namespace DegreeData

end DegreeData
end Representation
end
end ClassFormation
end
end

/- TunnellFrobeniusFieldWitness -/
section
namespace TunnellFrobeniusFieldWitness
open ClassFormation CyclicCohomology KummerTheory TunnellAbstractNormCoordinates
open scoped Classical
noncomputable section
variable {G : Type} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
  [TotallyDisconnectedSpace G]
variable (D : DegreeData G) (A : Rep ℤ G) (V : ValuationData D A) [TunnellFrobeniusInput.Family D A V]
  (K : FiniteAbstractField G)
abbrev symbol (L : FiniteGaloisSubextension K.field) :=
  letI := L.normal
  letI := L.finite
  D.finiteReciprocityHomGivenFamily A V K L.field L.below
theorem restrict {L E : FiniteGaloisSubextension K.field} (h : L.field ≤ E.field)
    (t : U K.field) (a : ambientFixedAddSubgroup A K.field) :
    letI := L.normal
    letI := L.finite
    letI := E.normal
    letI := E.finite
    symbol D A V K L (Additive.ofMul (QuotientGroup.mk t)) = finiteNormClass A K.field L.field L.below a →
    symbol D A V K E (Additive.ofMul (QuotientGroup.mk t)) = finiteNormClass A K.field E.field E.below a := by
  letI := L.normal
  letI := L.finite
  letI := E.normal
  letI := E.finite
  let KK : FiniteAbstractFieldExtension G := ⟨K,K,le_rfl,(FiniteGaloisSubextension.refl K.field).finite⟩
  letI := KK.finiteQuotient
  intro ht
  have eq := D.finiteReciprocityNaturality_restriction_norm_commutesGivenFamily A V KK E.field L.field E.below L.below h
  have e := DFunLike.congr_fun eq (Additive.ofMul (QuotientGroup.mk t))
  change finiteReciprocityNaturalityNormMap A K.field K.field E.field L.field E.below L.below le_rfl h
    (symbol D A V K L (Additive.ofMul (QuotientGroup.mk t))) =
    symbol D A V K E (Additive.ofMul (finiteReciprocityNaturalityRestriction K.field K.field E.field L.field
      E.below L.below le_rfl h (QuotientGroup.mk t))) at e
  rw [ht,finiteReciprocityNaturalityNormMap_finiteNormClass,relativeNorm_self,
    finiteReciprocityNaturalityRestriction_mk] at e
  exact e.symm
theorem witness (L : FiniteGaloisSubextension K.field)
    (surj : Function.Surjective (symbol D A V K L)) (a : ambientFixedAddSubgroup A K.field) :
    ∃ t : U K.field, ∀ (E : FiniteGaloisSubextension K.field), L.field ≤ E.field →
      Function.Injective (symbol D A V K E) →
      (t.val ∈ E.field ↔ N A K.field E.field a.val) := by
  letI := L.normal
  letI := L.finite
  obtain ⟨q,hq⟩ := surj (finiteNormClass A K.field L.field L.below a)
  let t := q.toMul.out
  have qt : (QuotientGroup.mk t : L.extensionQuotient) = q.toMul := Quotient.out_eq' q.toMul
  refine ⟨t,?_⟩
  intro E h inj
  letI := E.normal
  letI := E.finite
  have eq := restrict D A V K h t a (by rw [qt]; exact hq)
  rw [native_norm A K.field E.field E.below a]
  change t.val ∈ E.field ↔ a ∈ finiteNormSubgroup A K.field E.field E.below
  rw [← finiteNormClass_eq_zero_iff,← eq]
  constructor
  · intro mem
    have tr : (QuotientGroup.mk t : E.extensionQuotient) = 1 := (QuotientGroup.eq_one_iff t).mpr mem
    rw [tr]
    exact map_zero _
  · intro zero
    have z : Additive.ofMul (QuotientGroup.mk t : E.extensionQuotient) = 0 := inj (zero.trans (map_zero _).symm)
    exact (QuotientGroup.eq_one_iff t).mp z
end
end TunnellFrobeniusFieldWitness
end

/- TunnellNativeValuationData -/
section
namespace TunnellNativeValuationData
open ClassFormation KummerTheory CyclicCohomology TunnellAbstractNormCoordinates TunnellAbstractValueCoordinates
open scoped Classical
noncomputable section
variable {G : Type} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
variable (A : Rep.{0} ℤ G)
def degreeOf (d : G →* Multiplicative (TunnellProfiniteCoordinate.Z)) (hd : Continuous d) (ds : Function.Surjective d) : DegreeData G :=
  ⟨⟨e.symm.toMonoidHom.comp d,TunnellProfiniteCoordinate.continuous_inv.comp hd⟩,e.symm.surjective.comp ds⟩
theorem degree_eq (d : G →* Multiplicative (TunnellProfiniteCoordinate.Z)) (hd : Continuous d) (ds : Function.Surjective d) :
    e.toMonoidHom.comp (degreeOf d hd ds).degree.toMonoidHom = d :=
  MonoidHom.ext fun g => e.apply_symm_apply _
def valueOf (d : G →* Multiplicative (TunnellProfiniteCoordinate.Z)) (v : ambientFixedAddSubgroup A (baseField G) →+ (TunnellProfiniteCoordinate.Z))
    (hd : Continuous d) (ds : Function.Surjective d) (ints : ∀ m : ℤ, (m : (TunnellProfiniteCoordinate.Z)) ∈ v.range)
    (divs : ∀ (n : ℕ+) (x : ambientFixedAddSubgroup A (baseField G)), (v x).val n = 0 →
      ∃ y : ambientFixedAddSubgroup A (baseField G), (n : ℕ) • v y = v x)
    (norms : ∀ (H : ClosedSubgroup G) [(U H).FiniteIndex] (z : (TunnellProfiniteCoordinate.Z)),
      (∃ a : B A (baseField G), N A (baseField G) H a.val ∧ v a = z) ↔ ∃ a, ((U H).map d).index • v a = z) : ValuationData (degreeOf d hd ds) A := by
  let D := degreeOf d hd ds
  let i := TunnellProfiniteCoordinate.equiv
  let e := i.toMultiplicative
  have d' : e.toMonoidHom.comp D.degree.toMonoidHom = d := degree_eq d hd ds
  let v0 := i.symm.toAddMonoidHom.comp v
  have hv (a) : i (v0 a) = v a := i.apply_symm_apply _
  have vi (m : ℤ) : (m : ZHat) ∈ v0.range := by
    obtain ⟨x,hx⟩ := ints m
    exact ⟨x,i.injective ((hv x).trans (hx.trans (int_coord m).symm))⟩
  exact {
    toAddMonoidHom := v0
    integers_mem := vi
    canonical_value_quotient_bijective := fun n hn =>
      (divides_iff v0 vi ⟨n,hn⟩).mpr fun x hx => by
        have hz : (v x).val ⟨n,hn⟩ = 0 :=
          (congrArg (fun a : TunnellProfiniteCoordinate.Z => a.val ⟨n,hn⟩) (hv x).symm).trans hx
        obtain ⟨y,hy⟩ := divs ⟨n,hn⟩ x hz
        refine ⟨y, i.injective ?_⟩
        rw [map_nsmul,hv,hv]
        exact hy
    norm_range := fun K => by
      letI := finite_index K
      apply (value_norm_iff A D v0 K).mpr
      change ∀ z, (∃ a : B A (baseField G), N A (baseField G) K.field a.val ∧ i (v0 a) = z) ↔
        ∃ a : B A (baseField G), ((U K.field).map (e.toMonoidHom.comp D.degree.toMonoidHom)).index • i (v0 a) = z
      rw [d']
      intro z
      constructor
      · rintro ⟨a,ha,he⟩
        obtain ⟨b,hb⟩ := (norms K.field z).mp ⟨a,ha,(hv a).symm.trans he⟩
        exact ⟨b,(congrArg (((U K.field).map d).index • ·) (hv b)).trans hb⟩
      · rintro ⟨a,ha⟩
        obtain ⟨b,hb,he⟩ := (norms K.field z).mpr
          ⟨a,(congrArg (((U K.field).map d).index • ·) (hv a).symm).trans ha⟩
        exact ⟨b,hb,(hv b).trans he⟩
  }
set_option maxHeartbeats 1600000 in
theorem realize (d : G →* Multiplicative (TunnellProfiniteCoordinate.Z)) (v : ambientFixedAddSubgroup A (baseField G) →+ (TunnellProfiniteCoordinate.Z))
    (hd : Continuous d) (ds : Function.Surjective d) (ints : ∀ m : ℤ, (m : (TunnellProfiniteCoordinate.Z)) ∈ v.range)
    (divs : ∀ (n : ℕ+) (x : ambientFixedAddSubgroup A (baseField G)), (v x).val n = 0 →
      ∃ y : ambientFixedAddSubgroup A (baseField G), (n : ℕ) • v y = v x)
    (norms : ∀ (H : ClosedSubgroup G) [(U H).FiniteIndex] (z : (TunnellProfiniteCoordinate.Z)),
      (∃ a : B A (baseField G), N A (baseField G) H a.val ∧ v a = z) ↔ ∃ a, ((U H).map d).index • v a = z) :
    ∃ (D : DegreeData G) (V : ValuationData D A),
      TunnellAbstractValueCoordinates.e.toMonoidHom.comp D.degree.toMonoidHom = d ∧
      TunnellProfiniteCoordinate.equiv.toAddMonoidHom.comp V.toAddMonoidHom = v := by
  let D := degreeOf d hd ds
  let V := valueOf A d v hd ds ints divs norms
  refine ⟨D,V,degree_eq d hd ds,?_⟩
  apply AddMonoidHom.ext
  intro x
  exact TunnellProfiniteCoordinate.equiv.apply_symm_apply (v x)
end
end TunnellNativeValuationData
end

/- TunnellNormalizedStep4 -/
section
section
namespace ClassFormation
open KummerTheory
open CyclicCohomology
noncomputable section
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
namespace ValuationData
variable {D : DegreeData G} {A : Rep ℤ G}

theorem abstractReciprocity_abelian_finiteReciprocityHom_injectiveGivenFamily
    (v : ValuationData D A) 
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    [TotallyDisconnectedSpace G] [TunnellFrobeniusInput.Family D A v]
    (cyclic : ∀ (K : FiniteAbstractField G) (E : FiniteGaloisSubextension K.field),
      IsCyclic E.extensionQuotient → letI := E.finite
        Function.Injective (D.finiteReciprocityHomGivenFamily A v K E.field E.below))
    (K : FiniteAbstractField G) (L : FiniteGaloisSubextension K.field)
    [hcommutative : IsMulCommutative L.extensionQuotient] :
    letI : Finite
        (K.field.toSubgroup ⧸
          extensionSubgroup K.field L.field L.below) := L.finite
    Function.Injective
      (D.finiteReciprocityHomGivenFamily A v K L.field L.below) := by
  classical
  let : Finite
      (K.field.toSubgroup ⧸
        extensionSubgroup K.field L.field L.below) := L.finite
  let EKK : FiniteAbstractFieldExtension G :=
    { field := K
      base := K
      below := le_rfl
      finiteQuotient := (FiniteGaloisSubextension.refl K.field).finite }
  obtain ⟨I, hIfinite, _, _, f, _, hfaithful, hfactorCyclic,
      _⟩ := L.exists_cyclicIntermediateFields
  let : Fintype I := hIfinite
  rw [injective_iff_map_eq_zero]
  intro q hq
  have hrestriction (i : I) :
      L.upperRestrictionHom (MonoidHom.ker (f i)) q.toMul = 1 := by
    let S := MonoidHom.ker (f i)
    let hSnormal : S.Normal := inferInstance
    let M := L.intermediateField S
    let hLM := L.field_le_intermediateField S
    let hMK := L.intermediateField_le_base S
    let U := L.intermediateFiniteGalois S hSnormal
    let hMnormal : (extensionSubgroup K.field M hMK).Normal :=
      L.intermediateField_normal S hSnormal
    let hMfinite : Finite
        (K.field.toSubgroup ⧸ extensionSubgroup K.field M hMK) :=
      L.intermediateField_finite S
    let hUcyclic : IsCyclic U.extensionQuotient := hfactorCyclic i
    let rFactor := D.finiteReciprocityHomGivenFamily A v K M hMK
    have hrFactor : Function.Injective rFactor :=
      (cyclic K U hUcyclic)
    have hcomm := D.finiteReciprocityNaturality_restriction_norm_commutesGivenFamily
      A v EKK M L.field hMK L.below hLM
    rw [finiteReciprocityNaturalityNormMap_sameBase_eq_normProjection,
      finiteReciprocityNaturalityRestriction_sameBase_eq_restriction] at hcomm
    have hzero : rFactor (MonoidHom.toAdditive
        (abstractReciprocityRestriction K.field M L.field hLM hMK) q) = 0 := by
      calc
        rFactor (MonoidHom.toAdditive
            (abstractReciprocityRestriction K.field M L.field hLM hMK) q) =
            abstractReciprocityNormProjection A K.field M L.field hLM hMK
              (D.finiteReciprocityHomGivenFamily A v
                K L.field L.below q) := by
                  simpa only [rFactor, AddMonoidHom.comp_apply] using
                    (congrArg (fun h => h q) hcomm).symm
        _ = 0 := by rw [hq, map_zero]
    have hadd : MonoidHom.toAdditive
        (abstractReciprocityRestriction K.field M L.field hLM hMK) q = 0 := by
      apply hrFactor
      simpa only [map_zero] using hzero
    have hbridge (z : L.extensionQuotient) :
        L.upperRestrictionHom S z =
          abstractReciprocityRestriction K.field M L.field hLM hMK z := by
      refine QuotientGroup.induction_on z ?_
      intro k
      rw [L.upperRestrictionHom_mk,
        abstractReciprocityRestriction_mk]
    have hmul :
        abstractReciprocityRestriction K.field M L.field hLM hMK q.toMul = 1 :=
      congrArg Additive.toMul hadd
    exact (hbridge (show L.extensionQuotient from q.toMul)).trans hmul
  have hqone : q.toMul = 1 :=
    (L.upperRestrictionHom_jointlyFaithful f hfaithful q.toMul).1
      hrestriction
  exact Additive.toMul.injective (by simpa using hqone)
end ValuationData
namespace DegreeData
end DegreeData
noncomputable section
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
namespace DegreeData
end DegreeData
end
end
end ClassFormation
end
end

/- TunnellNormalizedAbelianBijective -/
section
namespace TunnellNormalizedAbelianBijective
open ClassFormation CyclicCohomology KummerTheory
open scoped Classical IsMulCommutative
noncomputable section
variable {G : Type} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
  [T2Space G] [TotallyDisconnectedSpace G]
variable (D : DegreeData G) (A : Rep ℤ G) (V : ValuationData D A) [TunnellFrobeniusInput.Family D A V]
theorem of_cyclic (cf : SatisfiesClassFieldAxiom A)
    (cyclic : ∀ (X : FiniteAbstractField G) (L : FiniteGaloisSubextension X.field), IsCyclic L.extensionQuotient →
      Function.Injective (TunnellFrobeniusFieldWitness.symbol D A V X L)) (K : FiniteAbstractField G)
    (E : FiniteGaloisSubextension K.field) [IsMulCommutative E.extensionQuotient] :
    Function.Bijective (TunnellFrobeniusFieldWitness.symbol D A V K E) := by
  letI := E.normal
  letI := E.finite
  let e := finiteNormQuotientConcreteEquiv A K.field E.field E.below
  have bound := TunnellAbelianNormIndex.bound A (TunnellAbelianNormIndex.cyclic A cf) K E
  have dvd : Nat.card (FiniteNormQuotient A K.field E.field E.below) ∣ Nat.card E.extensionQuotient := by
    rw [Nat.card_congr e.toEquiv]
    exact bound
  haveI : Finite (FiniteNormQuotient A K.field E.field E.below) :=
    Nat.finite_of_card_ne_zero (fun h => Nat.card_pos.ne' (zero_dvd_iff.mp (h ▸ dvd)))
  have inject := V.abstractReciprocity_abelian_finiteReciprocityHom_injectiveGivenFamily cyclic K E
  exact inject.bijective_of_nat_card_le (Nat.le_of_dvd Nat.card_pos dvd)
end
end TunnellNormalizedAbelianBijective
end

/- «compatible-core».CoreConditional -/
section
namespace TunnellCoreConditional
open ClassFormation CyclicCohomology KummerTheory
open TunnellFrobeniusFamily TunnellFrobeniusFamilyBridge
open scoped Classical IsMulCommutative
noncomputable section
theorem receiver : OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1_H1_R1_H2_R1_H1_R1.H3 := by
  intro G A
  dsimp only
  intro d v hd ds vi vd norms t r normalized hc
  have vr (H : ClosedSubgroup G) [(U H).FiniteIndex] (z : TunnellProfiniteCoordinate.Z) :
      (∃ a : B A (baseField G), TunnellAbstractNormCoordinates.N A (baseField G) H a.val ∧ v a=z) ↔
        ∃ a,((U H).map d).index • v a=z := by
    constructor
    · rintro ⟨a,⟨b,h⟩,hz⟩
      exact (norms H z).mp ⟨a,b,h,hz⟩
    · intro he
      obtain ⟨a,b,h,hz⟩ := (norms H z).mpr he
      exact ⟨a,⟨b,h⟩,hz⟩
  obtain ⟨D,V,ed,ev⟩ := TunnellNativeValuationData.realize A d v hd ds vi vd vr
  subst d v
  have cf : SatisfiesClassFieldAxiom A := by
    apply (TunnellAbstractNormCoordinates.tate_iff A).mp
    intro H J idx below normal fint cyc
    let p : P G := ⟨(H,J),idx,below,normal,@Finite.of_fintype _ fint⟩
    exact t p
  letI := family D A V r normalized
  have bij (K : FiniteAbstractField G) (E : FiniteGaloisSubextension K.field) [IsMulCommutative E.extensionQuotient] :
      Function.Bijective (TunnellFrobeniusFieldWitness.symbol D A V K E) := by
    apply TunnellNormalizedAbelianBijective.of_cyclic D A V cf _ K E
    intro X L h a b hab
    exact hc (point X L) h ((quotient A X L).symm.injective hab)
  intro p comm
  letI : (U (H p)).FiniteIndex := p.property.1
  let K:=TunnellAbstractNormCoordinates.finiteField (H p)
  let E : FiniteGaloisSubextension K.field := ⟨J p,p.property.2.1,p.property.2.2.1,p.property.2.2.2⟩
  letI : IsMulCommutative E.extensionQuotient := comm
  letI := E.normal
  letI := E.finite
  let q:=quotient A K E
  let f:=AddEquiv.ofBijective _ (bij K E)
  refine ⟨⟨q.symm.trans f.symm⟩,?_⟩
  intro a
  obtain ⟨x,hx⟩:=TunnellFrobeniusFieldWitness.witness D A V K E (bij K E).surjective a
  refine ⟨x,?_⟩
  intro L jl lh nl fl cl
  let Z : FiniteGaloisSubextension K.field := ⟨L,lh,nl,inferInstanceAs (Finite (U (H p) ⧸ M (H p) L))⟩
  letI : IsMulCommutative Z.extensionQuotient:=cl
  exact hx Z jl (bij K Z).injective
end
end TunnellCoreConditional
end

theorem OMA.solution : OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1_H1_R1_H2_R1_H1_R1.H3 := TunnellCoreConditional.receiver
