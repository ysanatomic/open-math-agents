import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1_H1_R1_H2_R1_H1_R1_H1_R1
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

/- GaloisCohomology.Cyclic.NormKernelVanishing -/
section
namespace CyclicCohomology
noncomputable section
open CategoryTheory
universe u

abbrev extensionSubgroup {G : Type u} [Group G] [TopologicalSpace G]
    (K L : ClosedSubgroup G) (_hLK : L.toSubgroup ≤ K.toSubgroup) :
    Subgroup K.toSubgroup :=
  L.toSubgroup.subgroupOf K.toSubgroup
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

theorem topologicallyGenerates_image_of_continuousSurjective
    {H : Type v} [Group H] [TopologicalSpace H] [IsTopologicalGroup H]
    (f : G →* H) (hf : Continuous f) (hfsurj : Function.Surjective f)
    {X : Set G} (hX : TopologicallyGenerates (G := G) X) :
    TopologicallyGenerates (G := H) (f '' X) := by
  have hmap :
      (Subgroup.closure X).map f = Subgroup.closure (f '' X) := by
    simpa using MonoidHom.map_closure f X
  have htop :
      ((Subgroup.closure X).map f).topologicalClosure = ⊤ := by
    exact DenseRange.topologicalClosure_map_subgroup
      (f := f) (hf := hf) (hf' := hfsurj.denseRange)
      (by simpa [TopologicallyGenerates] using hX)
  rw [TopologicallyGenerates, ← hmap]
  exact htop
 
theorem topologicallyGenerates_quotient_image
    (N : Subgroup G) [N.Normal]
    {X : Set G} (hX : TopologicallyGenerates (G := G) X) :
    TopologicallyGenerates
      (G := G ⧸ N) ((QuotientGroup.mk' N) '' X) :=
  topologicallyGenerates_image_of_continuousSurjective
    (G := G) (H := G ⧸ N) (QuotientGroup.mk' N)
    continuous_quotient_mk' (QuotientGroup.mk'_surjective N) hX
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
 
@[simp] theorem zHatReduction_one (n : ℕ) (hn : 0 < n) :
    zHatReduction n hn (1 : ZHat) = 1 := by
  simpa only [Int.cast_one] using zHatReduction_intCast n hn 1
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
 
def inertia (D : DegreeData G) : ClosedSubgroup G where
  toSubgroup := D.degree.toMonoidHom.ker
  isClosed' := by
    change IsClosed {g : G | (D.degree g).toAdd = 0}
    exact isClosed_eq D.degree.continuous_toFun continuous_const
 
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
 
def fieldInertia (D : DegreeData G) (K : ClosedSubgroup G) : ClosedSubgroup G :=
  K ⊓ D.inertia
 
@[simp]
theorem mem_fieldInertia_iff (D : DegreeData G) (K : ClosedSubgroup G) (g : G) :
    g ∈ D.fieldInertia K ↔ g ∈ K ∧ D.degree g = 1 :=
  Iff.rfl
 
def fieldInertiaWithin (D : DegreeData G) (K : ClosedSubgroup G) :
    Subgroup K.toSubgroup :=
  (D.restrictedDegree K).toMonoidHom.ker
 
instance fieldInertiaWithin_normal (D : DegreeData G) (K : ClosedSubgroup G) :
    (D.fieldInertiaWithin K).Normal := by
  rw [fieldInertiaWithin]
  infer_instance
 
@[simp]
theorem mem_fieldInertiaWithin_iff (D : DegreeData G) (K : ClosedSubgroup G)
    (k : K.toSubgroup) : k ∈ D.fieldInertiaWithin K ↔ D.degree k.1 = 1 :=
  Iff.rfl

noncomputable def residueDegreeCardinal (D : DegreeData G)
    (K : ClosedSubgroup G) : Cardinal :=
  relativeIndexCardinal
    (show D.fieldImage K ≤ (⊤ : Subgroup ZHatMul) from le_top)
 
def residueQuotient (D : DegreeData G) (K : ClosedSubgroup G) : Type :=
  (⊤ : Subgroup ZHatMul) ⧸ (D.fieldImage K).subgroupOf ⊤

structure FiniteResidueAbstractField (D : DegreeData G) where
   
  field : ClosedSubgroup G
   
  finiteResidueQuotient : Finite (D.residueQuotient field)
namespace FiniteResidueAbstractField
variable {D : DegreeData G}
 
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
 
theorem degreeCardinal_mul :
    T.topExtension.degreeCardinal * T.baseExtension.degreeCardinal =
      T.totalExtension.degreeCardinal := by
  exact relativeIndexCardinal_mul T.top_le_middle T.middle_le_base
end Tower

def IsUnramified (E : AbstractExtension G) (D : DegreeData G) : Prop :=
  E.base.toSubgroup ⊓ D.degree.toMonoidHom.ker ≤ E.field.toSubgroup
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

def IsUnramified (D : DegreeData G) : Prop :=
  E.toAbstractExtension.IsUnramified D
 
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
private theorem relativeRamificationIndexCardinal_lt_aleph0
    (D : DegreeData G) :
    E.toAbstractExtension.relativeRamificationIndexCardinal D <
      Cardinal.aleph0 :=
  (E.relativeDegreeCardinals_lt_aleph0 D).2

noncomputable instance residueQuotientFinite (D : DegreeData G) :
    Finite
      (↥(E.base.toSubgroup.map D.degree.toMonoidHom) ⧸
        (E.field.toSubgroup.map D.degree.toMonoidHom).subgroupOf
          (E.base.toSubgroup.map D.degree.toMonoidHom)) := by
  apply Cardinal.lt_aleph0_iff_finite.mp
  simpa [AbstractExtension.relativeResidueDegreeCardinal,
    relativeIndexCardinal, intersectionIndexCardinal] using
      E.relativeResidueDegreeCardinal_lt_aleph0 D

noncomputable instance ramificationQuotientFinite (D : DegreeData G) :
    Finite
      (↥(E.base.toSubgroup ⊓ D.degree.toMonoidHom.ker) ⧸
        (E.field.toSubgroup ⊓ D.degree.toMonoidHom.ker).subgroupOf
          (E.base.toSubgroup ⊓ D.degree.toMonoidHom.ker)) := by
  apply Cardinal.lt_aleph0_iff_finite.mp
  simpa [AbstractExtension.relativeRamificationIndexCardinal,
    relativeIndexCardinal, intersectionIndexCardinal] using
      E.relativeRamificationIndexCardinal_lt_aleph0 D
 
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
 
def ramificationIndex (D : DegreeData G) : ℕ+ :=
  ⟨Nat.card
      (↥(E.base.toSubgroup ⊓ D.degree.toMonoidHom.ker) ⧸
        (E.field.toSubgroup ⊓ D.degree.toMonoidHom.ker).subgroupOf
          (E.base.toSubgroup ⊓ D.degree.toMonoidHom.ker)),
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
 
@[simp] theorem ramificationIndex_coe (D : DegreeData G) :
    (E.ramificationIndex D : ℕ) =
      Nat.card
        (↥(E.base.toSubgroup ⊓ D.degree.toMonoidHom.ker) ⧸
          (E.field.toSubgroup ⊓ D.degree.toMonoidHom.ker).subgroupOf
            (E.base.toSubgroup ⊓ D.degree.toMonoidHom.ker)) :=
  rfl

@[simp] theorem relIndex_eq_degree :
    E.field.toSubgroup.relIndex E.base.toSubgroup = (E.degree : ℕ) := by
  rw [Subgroup.relIndex, Subgroup.index, E.degree_coe]
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

@[simp] theorem inertia_relIndex_eq_ramificationIndex (D : DegreeData G) :
    (E.field.toSubgroup ⊓ D.degree.toMonoidHom.ker).relIndex
        (E.base.toSubgroup ⊓ D.degree.toMonoidHom.ker) =
      (E.ramificationIndex D : ℕ) := by
  rw [Subgroup.relIndex, Subgroup.index, E.ramificationIndex_coe]

theorem degree_eq_residueDegree_mul_ramificationIndex (D : DegreeData G) :
    (E.degree : ℕ) =
      (E.residueDegree D : ℕ) * (E.ramificationIndex D : ℕ) := by
  rw [← E.relIndex_eq_degree, ← E.mapped_relIndex_eq_residueDegree D,
    ← E.inertia_relIndex_eq_ramificationIndex D]
  exact relIndex_eq_map_relIndex_mul_inf_ker_relIndex
    D.degree.toMonoidHom E.below
 
theorem ramificationIndex_eq_one_of_isUnramified (D : DegreeData G)
    (hE : E.IsUnramified D) :
    (E.ramificationIndex D : ℕ) = 1 := by
  rw [← E.inertia_relIndex_eq_ramificationIndex D,
    Subgroup.relIndex_eq_one]
  intro x hx
  exact ⟨hE hx, hx.2⟩

theorem residueDegree_eq_degree_of_isUnramified (D : DegreeData G)
    (hE : E.IsUnramified D) :
    (E.residueDegree D : ℕ) = (E.degree : ℕ) := by
  rw [E.degree_eq_residueDegree_mul_ramificationIndex D,
    E.ramificationIndex_eq_one_of_isUnramified D hE, mul_one]

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
 
noncomputable def residueDegree (E : FiniteResidueAbstractExtension D) : ℕ+ :=
  E.toFiniteAbstractExtension.residueDegree D
end FiniteResidueAbstractExtension
end DegreeData
 
structure FiniteAbstractField (G : Type u) [Group G] [TopologicalSpace G] where
   
  field : ClosedSubgroup G
   
  finite : Finite ((baseField G).toSubgroup ⧸
    extensionSubgroup (baseField G) field (le_baseField field))
namespace FiniteAbstractField

theorem eq_of_field_eq (K L : FiniteAbstractField G)
    (h : K.field = L.field) : K = L := by
  cases K with
  | mk K hK =>
    cases L with
    | mk L hL =>
      cases h
      rfl

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

noncomputable abbrev ofInclusion (field : ClosedSubgroup G)
    (base : FiniteAbstractField G)
    (below : field.toSubgroup ≤ base.field.toSubgroup)
    [finiteQuotient : Finite
      (base.field.toSubgroup ⧸
        extensionSubgroup base.field field below)] :
    FiniteAbstractFieldExtension G where
  field := {
    field := field
    finite := by
      apply Cardinal.lt_aleph0_iff_finite.mp
      let T : DegreeData.AbstractExtension.Tower G := {
        top := field
        middle := base.field
        base := baseField G
        top_le_middle := below
        middle_le_base := le_baseField base.field }
      change T.totalExtension.degreeCardinal < Cardinal.aleph0
      rw [← T.degreeCardinal_mul]
      apply Cardinal.mul_lt_aleph0
      · change Cardinal.mk
          (base.field.toSubgroup ⧸
            extensionSubgroup base.field field below) < Cardinal.aleph0
        exact Cardinal.lt_aleph0_of_finite _
      · change Cardinal.mk
          ((baseField G).toSubgroup ⧸
            extensionSubgroup (baseField G) base.field
              (le_baseField base.field)) < Cardinal.aleph0
        exact Cardinal.lt_aleph0_of_finite _ }
  base := base
  below := below
  finiteQuotient := finiteQuotient
 
abbrev toFiniteAbstractExtension (E : FiniteAbstractFieldExtension G) :
    DegreeData.FiniteAbstractExtension G where
  field := E.field.field
  base := E.base.field
  below := E.below
  finiteQuotient := E.finiteQuotient
 
abbrev IsUnramified (E : FiniteAbstractFieldExtension G) (D : DegreeData G) : Prop :=
  E.toFiniteAbstractExtension.IsUnramified D
 
noncomputable def degree (E : FiniteAbstractFieldExtension G) : ℕ+ :=
  E.toFiniteAbstractExtension.degree
 
noncomputable def residueDegree (E : FiniteAbstractFieldExtension G)
    (D : DegreeData G) : ℕ+ :=
  E.toFiniteAbstractExtension.residueDegree D

theorem residueDegree_eq_degree_of_isUnramified
    (E : FiniteAbstractFieldExtension G) (D : DegreeData G)
    (hE : E.IsUnramified D) :
    (E.residueDegree D : ℕ) = (E.degree : ℕ) :=
  E.toFiniteAbstractExtension.residueDegree_eq_degree_of_isUnramified D hE
 
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
end DegreeData
end
end ClassFormation
end

/- GaloisCohomology.Topology.TotallyDisconnectedQuotients -/
section
namespace QuotientGroup

theorem totallyDisconnectedSpace_of_isClosed
    {G : Type*} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [T2Space G] [TotallyDisconnectedSpace G]
    (N : Subgroup G) [N.Normal] (hN : IsClosed (N : Set G)) :
    TotallyDisconnectedSpace (G ⧸ N) := by
  let q : G →* G ⧸ N := QuotientGroup.mk' N
  have hsep : Pairwise (fun a b : G ⧸ N =>
      ∃ U : Set (G ⧸ N), IsClopen U ∧ a ∈ U ∧ b ∈ Uᶜ) := by
    intro a b hab
    obtain ⟨x, rfl⟩ := QuotientGroup.mk'_surjective N a
    obtain ⟨y, rfl⟩ := QuotientGroup.mk'_surjective N b
    let g : G := x⁻¹ * y
    have hgN : g ∉ N := by
      intro hgN
      apply hab
      apply inv_mul_eq_one.mp
      change q g = 1
      exact (QuotientGroup.eq_one_iff g).2 hgN
    let W : Set G := {u | g * u⁻¹ ∉ N}
    have hWopen : IsOpen W := by
      change IsOpen ((fun u : G => g * u⁻¹) ⁻¹' ((N : Set G)ᶜ))
      exact hN.isOpen_compl.preimage (continuous_const.mul continuous_inv)
    have hWone : (1 : G) ∈ W := by
      simpa only [W, Set.mem_ofPred_eq, inv_one, mul_one] using hgN
    obtain ⟨V, hVW⟩ :=
      ProfiniteGrp.exist_openNormalSubgroup_sub_open_nhds_of_one
        (G := G) hWopen hWone
    let K : Subgroup G := N ⊔ (V : Subgroup G)
    have hKopen : IsOpen (K : Set G) :=
      Subgroup.isOpen_of_openSubgroup K
        (show (V : Subgroup G) ≤ K from le_sup_right)
    have hNK : N ≤ K := le_sup_left
    have hgK : g ∉ K := by
      intro hgK
      rcases (Subgroup.mem_sup_of_normal_right
          (s := N) (t := (V : Subgroup G))).1 hgK with
        ⟨n, hnN, v, hvV, hnv⟩
      have hvW : v ∈ W := hVW hvV
      have hgn : g * v⁻¹ = n := by
        calc
          g * v⁻¹ = (n * v) * v⁻¹ := by rw [hnv]
          _ = n := by simp only [mul_assoc, mul_inv_cancel, mul_one]
      apply hvW
      simpa only [hgn] using hnN
    let Kbar : Subgroup (G ⧸ N) := K.map q
    have hKbarOpen : IsOpen (Kbar : Set (G ⧸ N)) := by
      change IsOpen (((↑) : G → G ⧸ N) '' (K : Set G))
      exact QuotientGroup.isOpenMap_coe (K : Set G) hKopen
    have hqgKbar : q g ∉ Kbar := by
      intro hqgKbar
      have hgComap : g ∈ Kbar.comap q := hqgKbar
      have hker : q.ker ≤ K := by
        simpa only [q, QuotientGroup.ker_mk'] using hNK
      have hcomap : Kbar.comap q = K := by
        simpa only [Kbar] using Subgroup.comap_map_eq_self hker
      rw [hcomap] at hgComap
      exact hgK hgComap
    let U : Set (G ⧸ N) := {z | (q x)⁻¹ * z ∈ Kbar}
    have hUclopen : IsClopen U := by
      have hcont : Continuous (fun z : G ⧸ N => (q x)⁻¹ * z) :=
        (continuous_const :
          Continuous (fun _ : G ⧸ N => (q x)⁻¹)).mul continuous_id
      exact
        ⟨(Subgroup.isClosed_of_isOpen Kbar hKbarOpen).preimage hcont,
          hKbarOpen.preimage hcont⟩
    refine ⟨U, hUclopen, ?_, ?_⟩
    · change (q x)⁻¹ * q x ∈ Kbar
      rw [inv_mul_cancel]
      exact Kbar.one_mem
    · change (q x)⁻¹ * q y ∉ Kbar
      change q (x⁻¹ * y) ∉ Kbar at hqgKbar
      simpa only [map_mul, map_inv] using hqgKbar
  let : TotallySeparatedSpace (G ⧸ N) :=
    totallySeparatedSpace_iff_exists_isClopen.2 hsep
  infer_instance
end QuotientGroup
namespace QuotientGroup
end QuotientGroup
namespace ContinuousMonoidHom
end ContinuousMonoidHom
end

/- ClassFieldTheory.AbstractClassFieldTheory.Degree.FrobeniusFixedField -/
section
namespace ClassFormation
open CyclicCohomology
noncomputable section
universe u
variable {G : Type u} [Group G] [TopologicalSpace G]
 
private def continuousQuotientMk
    {A : Type*} [Group A] [TopologicalSpace A]
    (N : Subgroup A) [N.Normal] : A →ₜ* A ⧸ N where
  toMonoidHom := QuotientGroup.mk' N
  continuous_toFun := continuous_quotient_mk'

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

private theorem exists_openNormalSubgroup_not_mem
    {A : Type*} [Group A] [TopologicalSpace A] [IsTopologicalGroup A]
    [CompactSpace A] [T2Space A] [TotallyDisconnectedSpace A]
    {x : A} (hx : x ≠ 1) :
    ∃ U : OpenNormalSubgroup A, x ∉ (U : Subgroup A) := by
  let W : Set A := ({x} : Set A)ᶜ
  have hWopen : IsOpen W := isClosed_singleton.isOpen_compl
  have hWone : (1 : A) ∈ W := by
    simpa [W] using hx.symm
  obtain ⟨U, hUW⟩ :=
    ProfiniteGrp.exist_openNormalSubgroup_sub_open_nhds_of_one
      (G := A) hWopen hWone
  refine ⟨U, ?_⟩
  intro hxU
  have hxW : x ∈ W := hUW hxU
  change x ∉ ({x} : Set A) at hxW
  exact hxW (by simp)
 
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
 
def zHatReductionMul (n : ℕ) (hn : 0 < n) :
    ZHatMul →ₜ* Multiplicative (ZMod n) where
  toFun z := Multiplicative.ofAdd (zHatReduction n hn z.toAdd)
  map_one' := by
    apply Multiplicative.ext
    exact map_zero (zHatReduction n hn)
  map_mul' x y := by
    apply Multiplicative.ext
    exact map_add (zHatReduction n hn) x.toAdd y.toAdd
  continuous_toFun := map_continuous (zHatReduction n hn)

private theorem injective_of_topologicallyGenerates_zHat_one
    {A : Type*} [CommGroup A] [TopologicalSpace A]
    [IsTopologicalGroup A] [CompactSpace A] [T2Space A]
    [TotallyDisconnectedSpace A]
    (f : A →ₜ* ZHatMul) (x : A)
    (hxgen : TopologicallyGenerates ({x} : Set A))
    (hfx : f x = Multiplicative.ofAdd (1 : ZHat)) :
    Function.Injective f := by
  intro a b hab
  suffices h : a⁻¹ * b = 1 by
    exact inv_mul_eq_one.mp h
  let y := a⁻¹ * b
  have hfy : f y = 1 := by
    dsimp [y]
    rw [map_mul, map_inv, hab, inv_mul_cancel]
  by_contra hy
  obtain ⟨U, hyU⟩ := exists_openNormalSubgroup_not_mem hy
  let : Finite (A ⧸ (U : Subgroup A)) :=
    Subgroup.quotient_finite_of_isOpen (U : Subgroup A)
      U.toOpenSubgroup.isOpen'
  let : DiscreteTopology (A ⧸ (U : Subgroup A)) :=
    QuotientGroup.discreteTopology U.toOpenSubgroup.isOpen'
  let m := Nat.card (A ⧸ (U : Subgroup A))
  have hm : 0 < m := by
    dsimp [m]
    exact Nat.card_pos
  let : NeZero m := ⟨hm.ne'⟩
  let q : A →ₜ* (A ⧸ (U : Subgroup A)) :=
    continuousQuotientMk (U : Subgroup A)
  have hqx :
      q x = QuotientGroup.mk' (U : Subgroup A) x := rfl
  have hqgen : TopologicallyGenerates ({q x} : Set
      (A ⧸ (U : Subgroup A))) := by
    have h := topologicallyGenerates_quotient_image (U : Subgroup A) hxgen
    simpa only [Set.image_singleton, hqx] using h
  have hqpow : (q x) ^ m = 1 := by
    exact pow_card_eq_one'
  let H : ClosedSubgroup A :=
    closedSubgroupGenerated ({x ^ m} : Set A)
  have hHU : H.toSubgroup ≤ (U : Subgroup A) := by
    apply Subgroup.topologicalClosure_minimal
    · rw [Subgroup.closure_le]
      intro z hz
      rw [Set.mem_singleton_iff] at hz
      subst z
      apply (QuotientGroup.eq_one_iff (x ^ m)).mp
      change q (x ^ m) = 1
      rw [map_pow]
      simpa only [hqx] using hqpow
    · exact Subgroup.isClosed_of_isOpen (U : Subgroup A) U.isOpen'
  let : IsClosed (H.toSubgroup : Set A) := H.isClosed'
  let B := A ⧸ H.toSubgroup
  let qH : A →ₜ* B := continuousQuotientMk H.toSubgroup
  have hqHx :
      qH x = QuotientGroup.mk' H.toSubgroup x := rfl
  have hqHgen : TopologicallyGenerates ({qH x} : Set B) := by
    have h := topologicallyGenerates_quotient_image H.toSubgroup hxgen
    simpa only [Set.image_singleton, hqHx] using h
  have hqHpow : (qH x) ^ m = 1 := by
    rw [← map_pow]
    change (QuotientGroup.mk' H.toSubgroup) (x ^ m) = 1
    apply (QuotientGroup.eq_one_iff (N := H.toSubgroup) (x ^ m)).2
    change x ^ m ∈
      (closedSubgroupGenerated ({x ^ m} : Set A) : Subgroup A)
    exact Subgroup.le_topologicalClosure _
      (Subgroup.subset_closure (by simp))
  have hqHfiniteOrder : IsOfFinOrder (qH x) := by
    rw [← orderOf_pos_iff]
    have hdvd : orderOf (qH x) ∣ m :=
      orderOf_dvd_of_pow_eq_one hqHpow
    exact Nat.pos_of_dvd_of_pos hdvd hm
  have hzpowersClosed :
      IsClosed ((Subgroup.zpowers (qH x) : Subgroup B) : Set B) :=
    (finite_zpowers.mpr hqHfiniteOrder).isClosed
  have hzpowersTopologicalClosure :
      (Subgroup.zpowers (qH x)).topologicalClosure =
        Subgroup.zpowers (qH x) := by
    apply SetLike.ext'
    rw [Subgroup.topologicalClosure_coe]
    rw [hzpowersClosed.closure_eq]
  have hzpowersTop : Subgroup.zpowers (qH x) = ⊤ := by
    rw [TopologicallyGenerates, ← Subgroup.zpowers_eq_closure,
      hzpowersTopologicalClosure] at hqHgen
    exact hqHgen
  let : Finite (Subgroup.zpowers (qH x)) :=
    (finite_zpowers.mpr hqHfiniteOrder).to_subtype
  let : Finite B :=
    Finite.of_injective
      (fun b : B =>
        (⟨b, by rw [hzpowersTop]; trivial⟩ : Subgroup.zpowers (qH x)))
      (by
        intro a b hab
        exact congrArg Subtype.val hab)
  have hcardB : Nat.card B = orderOf (qH x) :=
    (orderOf_eq_card_of_zpowers_eq_top hzpowersTop).symm
  have hcardBle : Nat.card B ≤ m := by
    rw [hcardB]
    exact orderOf_le_of_pow_eq_one hm hqHpow
  let r : A →ₜ* Multiplicative (ZMod m) :=
    (zHatReductionMul m hm).comp f
  have hrx : r x = Multiplicative.ofAdd (1 : ZMod m) := by
    apply Multiplicative.ext
    change zHatReduction m hm (f x).toAdd = 1
    rw [hfx]
    simp
  have hHker : H.toSubgroup ≤ r.toMonoidHom.ker := by
    apply Subgroup.topologicalClosure_minimal
    · rw [Subgroup.closure_le]
      intro z hz
      rw [Set.mem_singleton_iff] at hz
      subst z
      change r (x ^ m) = 1
      rw [map_pow, hrx]
      apply Multiplicative.ext
      simp
    · change IsClosed {z : A | r z = 1}
      let : T2Space (Multiplicative (ZMod m)) := by
        change T2Space (ZMod m)
        infer_instance
      exact isClosed_eq r.continuous_toFun continuous_const
  let rbar : B →ₜ* Multiplicative (ZMod m) :=
    continuousQuotientLift H.toSubgroup r hHker
  have hrbarSurj : Function.Surjective rbar := by
    intro z
    obtain ⟨k, hk⟩ := ZMod.intCast_surjective z.toAdd
    refine ⟨(qH x) ^ k, ?_⟩
    apply Multiplicative.ext
    rw [map_zpow]
    change ((r x) ^ k).toAdd = z.toAdd
    rw [hrx]
    simpa using hk
  have hcodCard : Nat.card (Multiplicative (ZMod m)) = m := by
    calc
      Nat.card (Multiplicative (ZMod m)) =
          Nat.card (ZMod m) :=
        Nat.card_congr Multiplicative.toAdd
      _ = m := Nat.card_zmod m
  have hcardLower : m ≤ Nat.card B := by
    rw [← hcodCard]
    exact Nat.card_le_card_of_surjective rbar hrbarSurj
  have hcardEq : Nat.card B =
      Nat.card (Multiplicative (ZMod m)) := by
    rw [hcodCard]
    exact le_antisymm hcardBle hcardLower
  have hrbarInj : Function.Injective rbar :=
    (Nat.bijective_iff_surjective_and_card rbar).mpr
      ⟨hrbarSurj, hcardEq⟩ |>.1
  have hry : r y = 1 := by
    change zHatReductionMul m hm (f y) = 1
    rw [hfy, map_one]
  have hqy : qH y = 1 := by
    apply hrbarInj
    change r y = r 1
    rw [hry, map_one]
  change (QuotientGroup.mk' H.toSubgroup) y = 1 at hqy
  have hyH : y ∈ H.toSubgroup :=
    (QuotientGroup.eq_one_iff (N := H.toSubgroup) y).mp hqy
  exact hyU (hHU hyH)
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
 
theorem extensionInertiaWithin_isClosed (D : DegreeData G)
    [IsTopologicalGroup G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup) :
    IsClosed (D.extensionInertiaWithin K.field L hLK : Set K.field.toSubgroup) := by
  have hE : IsClosed (extensionSubgroup K.field L hLK : Set K.field.toSubgroup) := by
    change IsClosed ((fun x : K.field.toSubgroup => (x : G)) ⁻¹' (L : Set G))
    exact L.isClosed'.preimage continuous_subtype_val
  have hI : IsClosed (D.fieldInertiaWithin K.field : Set K.field.toSubgroup) := by
    let : T2Space ZHatMul := by
      change T2Space ZHat
      infer_instance
    change IsClosed {x : K.field.toSubgroup | D.degree x.1 = 1}
    exact isClosed_eq
      (D.restrictedDegree K.field).continuous_toFun continuous_const
  change IsClosed
    ((extensionSubgroup K.field L hLK ⊓ D.fieldInertiaWithin K.field) : Set K.field.toSubgroup)
  exact hE.inter hI

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
 
abbrev frobeniusClosureCommGroup
    (D : DegreeData G) [IsTopologicalGroup G] [T2Space G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (σ : D.FrobeniusElements K L hLK) :
    CommGroup (D.frobeniusClosure K L hLK σ) := by
  letI : IsClosed
      (D.extensionInertiaWithin K.field L hLK : Set K.field.toSubgroup) :=
    D.extensionInertiaWithin_isClosed K L hLK
  let Q := K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK
  let s : Subgroup Q :=
    Subgroup.closure (Set.range (fun _ : Unit => σ.1))
  let c : CommGroup ↑s.topologicalClosure :=
    Subgroup.commGroupTopologicalClosure s (by
      intro a b
      have hrange : Set.range (fun _ : Unit => σ.1) = ({σ.1} : Set Q) := by
        ext y
        simp
      have ha : (a : Q) ∈ Subgroup.zpowers σ.1 := by
        simpa [s, hrange, Subgroup.zpowers_eq_closure] using a.2
      have hb : (b : Q) ∈ Subgroup.zpowers σ.1 := by
        simpa [s, hrange, Subgroup.zpowers_eq_closure] using b.2
      obtain ⟨m, hm⟩ := Subgroup.mem_zpowers_iff.mp ha
      obtain ⟨n, hn⟩ := Subgroup.mem_zpowers_iff.mp hb
      apply Subtype.ext
      change (a : Q) * (b : Q) = (b : Q) * (a : Q)
      rw [← hm, ← hn, ← zpow_add, add_comm, zpow_add])
  letI : IsMulCommutative (D.frobeniusClosure K L hLK σ) :=
    isMulCommutative_iff.mpr c.mul_comm
  exact open scoped IsMulCommutative in inferInstance
 
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
 
def frobeniusClosureDegreeInMulNatRange (D : DegreeData G)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (σ : D.FrobeniusElements K L hLK)
    (a : D.frobeniusClosure K L hLK σ) :
    (zHatMulNat (D.frobeniusExponent K L hLK σ)).toAddMonoidHom.range := by
  refine ⟨(D.frobeniusClosureDegree K L hLK σ a).toAdd, ?_⟩
  have ha : D.frobeniusClosureDegree K L hLK σ a ∈
      (D.frobeniusClosureDegree K L hLK σ).toMonoidHom.range :=
    ⟨a, rfl⟩
  rw [D.frobeniusClosureDegree_range K L hLK σ] at ha
  exact ha
 
def fixedFieldNormalizedDegree (D : DegreeData G)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (σ : D.FrobeniusElements K L hLK) :
    D.frobeniusClosure K L hLK σ →ₜ* ZHatMul where
  toFun a := Multiplicative.ofAdd
    (zHatDivide (D.frobeniusExponent K L hLK σ)
      (D.frobeniusExponent_pos K L hLK σ)
      (D.frobeniusClosureDegreeInMulNatRange K L hLK σ a))
  map_one' := by
    apply Multiplicative.ext
    rw [show D.frobeniusClosureDegreeInMulNatRange K L hLK σ 1 = 0 by
      apply Subtype.ext
      exact congrArg Multiplicative.toAdd
        (map_one (D.frobeniusClosureDegree K L hLK σ))]
    exact map_zero (zHatDivide
      (D.frobeniusExponent K L hLK σ)
      (D.frobeniusExponent_pos K L hLK σ))
  map_mul' a b := by
    apply Multiplicative.ext
    rw [show D.frobeniusClosureDegreeInMulNatRange K L hLK σ (a * b) =
        D.frobeniusClosureDegreeInMulNatRange K L hLK σ a +
          D.frobeniusClosureDegreeInMulNatRange K L hLK σ b by
      apply Subtype.ext
      exact congrArg Multiplicative.toAdd
        (map_mul (D.frobeniusClosureDegree K L hLK σ) a b)]
    exact map_add (zHatDivide
      (D.frobeniusExponent K L hLK σ)
      (D.frobeniusExponent_pos K L hLK σ)) _ _
  continuous_toFun := by
    apply (map_continuous (zHatDivide
      (D.frobeniusExponent K L hLK σ)
      (D.frobeniusExponent_pos K L hLK σ))).comp
    exact Continuous.subtype_mk
      (D.frobeniusClosureDegree K L hLK σ).continuous_toFun
      (fun a =>
        (D.frobeniusClosureDegreeInMulNatRange K L hLK σ a).2)
 
theorem frobeniusExponent_nsmul_fixedFieldNormalizedDegree
    (D : DegreeData G)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (σ : D.FrobeniusElements K L hLK)
    (a : D.frobeniusClosure K L hLK σ) :
    D.frobeniusExponent K L hLK σ •
        (D.fixedFieldNormalizedDegree K L hLK σ a).toAdd =
      (D.frobeniusClosureDegree K L hLK σ a).toAdd := by
  exact zHatMulNat_zHatDivide
    (D.frobeniusExponent K L hLK σ)
    (D.frobeniusExponent_pos K L hLK σ)
    (D.frobeniusClosureDegreeInMulNatRange K L hLK σ a)
 
@[simp]
theorem fixedFieldNormalizedDegree_generator (D : DegreeData G)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (σ : D.FrobeniusElements K L hLK) :
    D.fixedFieldNormalizedDegree K L hLK σ
        (D.frobeniusInClosure K L hLK σ) =
      Multiplicative.ofAdd (1 : ZHat) := by
  apply Multiplicative.ext
  apply zHatMulNat_injective
    (D.frobeniusExponent_pos K L hLK σ)
  change D.frobeniusExponent K L hLK σ •
      (D.fixedFieldNormalizedDegree K L hLK σ
        (D.frobeniusInClosure K L hLK σ)).toAdd =
    D.frobeniusExponent K L hLK σ •
      (Multiplicative.ofAdd (1 : ZHat)).toAdd
  rw [D.frobeniusExponent_nsmul_fixedFieldNormalizedDegree]
  change (D.frobeniusClosureDegree K L hLK σ
      (D.frobeniusInClosure K L hLK σ)).toAdd =
    D.frobeniusExponent K L hLK σ • (1 : ZHat)
  rw [D.frobeniusClosureDegree_generator]
  rfl
 
theorem frobeniusClosure_totallyDisconnectedSpace (D : DegreeData G)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    [TotallyDisconnectedSpace G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (σ : D.FrobeniusElements K L hLK) :
    TotallyDisconnectedSpace (D.frobeniusClosure K L hLK σ) := by
  let : CompactSpace K.field.toSubgroup := by
    change CompactSpace K.field
    infer_instance
  let Q := K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK
  let : TotallyDisconnectedSpace Q :=
    QuotientGroup.totallyDisconnectedSpace_of_isClosed
      (D.extensionInertiaWithin K.field L hLK)
      (D.extensionInertiaWithin_isClosed K L hLK)
  infer_instance

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

theorem frobeniusFixedField_normalizedDegree_injective (D : DegreeData G)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    [TotallyDisconnectedSpace G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (σ : D.FrobeniusElements K L hLK) :
    Function.Injective
      (D.fixedFieldNormalizedDegree K L hLK σ) := by
  let Γ := D.frobeniusClosure K L hLK σ
  let : CompactSpace K.field.toSubgroup := by
    change CompactSpace K.field
    infer_instance
  let : IsClosed
      (D.extensionInertiaWithin K.field L hLK : Set K.field.toSubgroup) :=
    D.extensionInertiaWithin_isClosed K L hLK
  let : TotallyDisconnectedSpace Γ :=
    D.frobeniusClosure_totallyDisconnectedSpace K L hLK σ
  let : CommGroup Γ :=
    D.frobeniusClosureCommGroup K L hLK σ
  apply injective_of_topologicallyGenerates_zHat_one
    (D.fixedFieldNormalizedDegree K L hLK σ)
    (D.frobeniusInClosure K L hLK σ)
  · exact D.frobeniusInClosure_topologicallyGenerates K L hLK σ
  · exact D.fixedFieldNormalizedDegree_generator K L hLK σ
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
 
def conjugateFixedElement [ContinuousMul G]
    (A : Rep ℤ G) (K : ClosedSubgroup G) (σ : G)
    (a : ambientFixedAddSubgroup A K) :
    ambientFixedAddSubgroup A (conjugateClosedSubgroup K σ) := by
  refine ⟨A.ρ σ⁻¹ a.1, ?_⟩
  intro x
  let k : K.toSubgroup := ⟨σ * x.1 * σ⁻¹,
    (conjugateClosedSubgroup_mem K σ x.1).mp x.2⟩
  calc
    A.ρ x.1 (A.ρ σ⁻¹ a.1) = A.ρ (x.1 * σ⁻¹) a.1 := by
      rw [map_mul]
      rfl
    _ = A.ρ (σ⁻¹ * k.1) a.1 := by simp [k, mul_assoc]
    _ = A.ρ σ⁻¹ (A.ρ k.1 a.1) := by
      rw [map_mul]
      rfl
    _ = A.ρ σ⁻¹ a.1 := by rw [a.2 k]

@[simp]
theorem conjugateFixedElement_coe [ContinuousMul G]
    (A : Rep ℤ G) (K : ClosedSubgroup G) (σ : G)
    (a : ambientFixedAddSubgroup A K) :
    ((conjugateFixedElement A K σ a :
      ambientFixedAddSubgroup A (conjugateClosedSubgroup K σ)) : A.V) =
      A.ρ σ⁻¹ a.1 :=
  rfl
private def absoluteConjugationEquiv {G : Type*} [Group G] [TopologicalSpace G]
    (σ : G) :
    (baseField G).toSubgroup ≃
      (baseField G).toSubgroup where
  toFun x := ⟨σ * x.1 * σ⁻¹, trivial⟩
  invFun x := ⟨σ⁻¹ * x.1 * σ, trivial⟩
  left_inv x := by
    apply Subtype.ext
    simp [mul_assoc]
  right_inv x := by
    apply Subtype.ext
    simp [mul_assoc]
private theorem mem_absoluteExtension {G : Type*} [Group G] [TopologicalSpace G]
    (K : ClosedSubgroup G)
    (x : (baseField G).toSubgroup) :
    x ∈ extensionSubgroup (baseField G) K
        (le_baseField K) ↔ x.1 ∈ K :=
  Iff.rfl
 
noncomputable def absoluteConjugateCosetEquiv
    {G : Type*} [Group G] [TopologicalSpace G] [ContinuousMul G]
    (K : ClosedSubgroup G) (σ : G) :
    ((baseField G).toSubgroup ⧸
        extensionSubgroup (baseField G)
          (conjugateClosedSubgroup K σ)
          (le_baseField (conjugateClosedSubgroup K σ))) ≃
      ((baseField G).toSubgroup ⧸
        extensionSubgroup (baseField G) K
          (le_baseField K)) :=
  Quotient.congr (absoluteConjugationEquiv σ) (by
    intro x y
    rw [QuotientGroup.leftRel_apply, QuotientGroup.leftRel_apply,
      mem_absoluteExtension, mem_absoluteExtension,
      conjugateClosedSubgroup_mem]
    change σ * (x.1⁻¹ * y.1) * σ⁻¹ ∈ K.toSubgroup ↔
      (σ * x.1 * σ⁻¹)⁻¹ * (σ * y.1 * σ⁻¹) ∈ K.toSubgroup
    simp [mul_assoc])

@[simp]
theorem absoluteConjugateCosetEquiv_mk
    {G : Type*} [Group G] [TopologicalSpace G] [ContinuousMul G]
    (K : ClosedSubgroup G) (σ : G)
    (x : (baseField G).toSubgroup) :
    absoluteConjugateCosetEquiv K σ (QuotientGroup.mk x) =
      QuotientGroup.mk (absoluteConjugationEquiv σ x) :=
  rfl
private theorem relativeCosetAction_absoluteConjugate [ContinuousMul G]
    (A : Rep ℤ G) (K : ClosedSubgroup G) (σ : G)
    (a : ambientFixedAddSubgroup A K)
    (q : (baseField G).toSubgroup ⧸
      extensionSubgroup (baseField G)
        (conjugateClosedSubgroup K σ)
        (le_baseField (conjugateClosedSubgroup K σ))) :
    relativeCosetAction A (baseField G)
        (conjugateClosedSubgroup K σ)
        (le_baseField (conjugateClosedSubgroup K σ))
        (conjugateFixedElement A K σ a) q =
      A.ρ σ⁻¹
        (relativeCosetAction A (baseField G) K
          (le_baseField K) a
          (absoluteConjugateCosetEquiv K σ q)) := by
  refine Quotient.inductionOn' q ?_
  intro x
  rw [relativeCosetAction_mk, absoluteConjugateCosetEquiv_mk,
    relativeCosetAction_mk, conjugateFixedElement_coe]
  calc
    A.ρ x.1 (A.ρ σ⁻¹ a.1) = A.ρ (x.1 * σ⁻¹) a.1 := by
      rw [map_mul]
      rfl
    _ = A.ρ (σ⁻¹ * (σ * x.1 * σ⁻¹)) a.1 := by simp [mul_assoc]
    _ = A.ρ σ⁻¹ (A.ρ (σ * x.1 * σ⁻¹) a.1) := by
      rw [map_mul]
      rfl

theorem relativeNorm_absoluteConjugate_apply [ContinuousMul G]
    (A : Rep ℤ G) (K : ClosedSubgroup G) (σ : G)
    [Finite
      ((baseField G).toSubgroup ⧸
        extensionSubgroup (baseField G) K
          (le_baseField K))]
    (a : ambientFixedAddSubgroup A K) :
    letI : Finite
        ((baseField G).toSubgroup ⧸
          extensionSubgroup (baseField G)
            (conjugateClosedSubgroup K σ)
            (le_baseField (conjugateClosedSubgroup K σ))) :=
      Finite.of_equiv
        ((baseField G).toSubgroup ⧸
          extensionSubgroup (baseField G) K
            (le_baseField K))
        (absoluteConjugateCosetEquiv K σ).symm
    ((relativeNorm A (baseField G)
        (conjugateClosedSubgroup K σ)
        (le_baseField (conjugateClosedSubgroup K σ))
        (conjugateFixedElement A K σ a) :
      ambientFixedAddSubgroup A (baseField G)) : A.V) =
      A.ρ σ⁻¹
        ((relativeNorm A (baseField G) K
          (le_baseField K) a :
          ambientFixedAddSubgroup A (baseField G)) : A.V) := by
  let := Fintype.ofFinite
    ((baseField G).toSubgroup ⧸
      extensionSubgroup (baseField G) K
        (le_baseField K))
  let conjugateFintype : Fintype
      ((baseField G).toSubgroup ⧸
        extensionSubgroup (baseField G)
          (conjugateClosedSubgroup K σ)
          (le_baseField (conjugateClosedSubgroup K σ))) :=
    Fintype.ofEquiv
      ((baseField G).toSubgroup ⧸
        extensionSubgroup (baseField G) K
          (le_baseField K))
      (absoluteConjugateCosetEquiv K σ).symm
  have hconjugateFintype : Fintype.ofFinite
      ((baseField G).toSubgroup ⧸
        extensionSubgroup (baseField G)
          (conjugateClosedSubgroup K σ)
          (le_baseField (conjugateClosedSubgroup K σ))) = conjugateFintype :=
    Subsingleton.elim _ _
  simp only [relativeNorm_apply_coe, relativeNormValue]
  rw [hconjugateFintype]
  calc
    ∑ q, relativeCosetAction A (baseField G)
        (conjugateClosedSubgroup K σ)
        (le_baseField (conjugateClosedSubgroup K σ))
        (conjugateFixedElement A K σ a) q =
      ∑ q, A.ρ σ⁻¹
        (relativeCosetAction A (baseField G) K
          (le_baseField K) a
          (absoluteConjugateCosetEquiv K σ q)) := by
            apply Finset.sum_congr rfl
            intro q _
            exact relativeCosetAction_absoluteConjugate A K σ a q
    _ = A.ρ σ⁻¹
        (∑ q, relativeCosetAction A (baseField G) K
          (le_baseField K) a
          (absoluteConjugateCosetEquiv K σ q)) := by
            rw [map_sum]
    _ = A.ρ σ⁻¹
        (∑ q, relativeCosetAction A (baseField G) K
          (le_baseField K) a q) := by
            rw [(absoluteConjugateCosetEquiv K σ).sum_comp]

def normalExtensionAction
    (A : Rep ℤ G) (K L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.toSubgroup)
    (hnormal : (extensionSubgroup K L hLK).Normal)
    (k : K.toSubgroup) (a : ambientFixedAddSubgroup A L) :
    ambientFixedAddSubgroup A L := by
  refine ⟨A.ρ k.1 a.1, ?_⟩
  intro l
  let lK : K.toSubgroup := Subgroup.inclusion hLK l
  have hc : k⁻¹ * lK * k ∈ extensionSubgroup K L hLK :=
    by simpa using hnormal.conj_mem lK l.2 k⁻¹
  let l' : L.toSubgroup := ⟨(k⁻¹ * lK * k).1, hc⟩
  have hl'val : (l' : G) = (k⁻¹ * lK * k : K.toSubgroup) :=
    rfl
  calc
    A.ρ l.1 (A.ρ k.1 a.1) = A.ρ (l.1 * k.1) a.1 := by rw [map_mul]; rfl
    _ = A.ρ (k.1 * l'.1) a.1 := by rw [hl'val]; simp [lK, mul_assoc]
    _ = A.ρ k.1 (A.ρ l'.1 a.1) := by rw [map_mul]; rfl
    _ = A.ρ k.1 a.1 := by rw [a.2 l']

@[simp]
theorem normalExtensionAction_coe
    (A : Rep ℤ G) (K L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.toSubgroup)
    (hnormal : (extensionSubgroup K L hLK).Normal)
    (k : K.toSubgroup) (a : ambientFixedAddSubgroup A L) :
    ((normalExtensionAction A K L hLK hnormal k a : ambientFixedAddSubgroup A L) : A.V) =
      A.ρ k.1 a.1 :=
  rfl

theorem relativeNorm_normalExtensionAction
    (A : Rep ℤ G) (K L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.toSubgroup)
    (hnormal : (extensionSubgroup K L hLK).Normal)
    [Finite (K.toSubgroup ⧸ extensionSubgroup K L hLK)]
    (k : K.toSubgroup) (a : ambientFixedAddSubgroup A L) :
    relativeNorm A K L hLK (normalExtensionAction A K L hLK hnormal k a) =
      relativeNorm A K L hLK a := by
  apply Subtype.ext
  let := Fintype.ofFinite (K.toSubgroup ⧸ extensionSubgroup K L hLK)
  let e : (K.toSubgroup ⧸ extensionSubgroup K L hLK) ≃
      (K.toSubgroup ⧸ extensionSubgroup K L hLK) :=
    Equiv.mulRight (QuotientGroup.mk k)
  have hterm : ∀ q : K.toSubgroup ⧸ extensionSubgroup K L hLK,
      relativeCosetAction A K L hLK (normalExtensionAction A K L hLK hnormal k a) q =
        relativeCosetAction A K L hLK a (e q) := by
    intro q
    refine Quotient.inductionOn' q ?_
    intro x
    simp only [relativeCosetAction_mk, normalExtensionAction_coe]
    have he : e (QuotientGroup.mk x) = QuotientGroup.mk (x * k) := rfl
    rw [he, relativeCosetAction_mk]
    change A.ρ x.1 (A.ρ k.1 a.1) = A.ρ (x.1 * k.1) a.1
    rw [map_mul]
    rfl
  simp only [relativeNorm_apply_coe, relativeNormValue]
  simp_rw [hterm]
  exact e.sum_comp (relativeCosetAction A K L hLK a)
 
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

noncomputable def relativeConjugateCosetEquiv [ContinuousMul G]
    (K L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.toSubgroup) (s : G) :
    (K.toSubgroup ⧸ extensionSubgroup K L hLK) ≃
      ((conjugateClosedSubgroup K s).toSubgroup ⧸
        extensionSubgroup (conjugateClosedSubgroup K s)
          (conjugateClosedSubgroup L s)
          (conjugateClosedSubgroup_mono hLK s)) :=
  Quotient.congr (conjugateSubgroupEquiv K s).toEquiv (by
    intro x y
    rw [QuotientGroup.leftRel_apply, QuotientGroup.leftRel_apply]
    let e := conjugateSubgroupEquiv K s
    let H := extensionSubgroup K L hLK
    let Hs := extensionSubgroup (conjugateClosedSubgroup K s)
      (conjugateClosedSubgroup L s)
      (conjugateClosedSubgroup_mono hLK s)
    have hmap : H.map e.toMonoidHom = Hs :=
      map_extensionSubgroup_conjugate K L hLK s
    change x⁻¹ * y ∈ H ↔ (e x)⁻¹ * e y ∈ Hs
    rw [← hmap]
    constructor
    · intro hxy
      refine ⟨x⁻¹ * y, hxy, ?_⟩
      simp
    · rintro ⟨z, hz, hez⟩
      have heq : z = x⁻¹ * y := by
        apply e.injective
        simpa using hez
      simpa [heq] using hz)

@[simp]
theorem relativeConjugateCosetEquiv_mk [ContinuousMul G]
    (K L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.toSubgroup) (s : G)
    (k : K.toSubgroup) :
    relativeConjugateCosetEquiv K L hLK s (QuotientGroup.mk k) =
      QuotientGroup.mk (conjugateSubgroupEquiv K s k) :=
  rfl
 
theorem finite_conjugateExtension [ContinuousMul G]
    (K L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.toSubgroup) (s : G)
    [hLfinite : Finite
      (K.toSubgroup ⧸ extensionSubgroup K L hLK)] :
    Finite ((conjugateClosedSubgroup K s).toSubgroup ⧸
      extensionSubgroup (conjugateClosedSubgroup K s)
        (conjugateClosedSubgroup L s)
        (conjugateClosedSubgroup_mono hLK s)) :=
  Finite.of_equiv
    (K.toSubgroup ⧸ extensionSubgroup K L hLK)
    (relativeConjugateCosetEquiv K L hLK s)
end GroupOnly
section Representation
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
 
private theorem relativeCosetAction_conjugate
    [ContinuousMul G] (A : Rep ℤ G)
    (K L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.toSubgroup) (s : G)
    (a : ambientFixedAddSubgroup A L)
    (q : K.toSubgroup ⧸ extensionSubgroup K L hLK) :
    relativeCosetAction A (conjugateClosedSubgroup K s)
        (conjugateClosedSubgroup L s)
        (conjugateClosedSubgroup_mono hLK s)
        (conjugateFixedElement A L s a)
        (relativeConjugateCosetEquiv K L hLK s q) =
      A.ρ s⁻¹ (relativeCosetAction A K L hLK a q) := by
  refine Quotient.inductionOn' q ?_
  intro k
  rw [relativeConjugateCosetEquiv_mk, relativeCosetAction_mk,
    relativeCosetAction_mk, conjugateFixedElement_coe]
  calc
    A.ρ (s⁻¹ * k.1 * s) (A.ρ s⁻¹ a.1) =
        A.ρ ((s⁻¹ * k.1 * s) * s⁻¹) a.1 := by
      have hm := congrArg (fun φ => φ a.1)
        (map_mul A.ρ (s⁻¹ * k.1 * s) s⁻¹)
      exact hm.symm
    _ = A.ρ (s⁻¹ * k.1) a.1 := by
      congr 2
      simp [mul_assoc]
    _ = A.ρ s⁻¹ (A.ρ k.1 a.1) := by
      exact congrArg (fun φ => φ a.1) (map_mul A.ρ s⁻¹ k.1)

theorem relativeNorm_conjugate_apply
    [ContinuousMul G] (A : Rep ℤ G)
    (K L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.toSubgroup) (s : G)
    [hLfinite : Finite
      (K.toSubgroup ⧸ extensionSubgroup K L hLK)]
    (a : ambientFixedAddSubgroup A L) :
    letI : Finite ((conjugateClosedSubgroup K s).toSubgroup ⧸
        extensionSubgroup (conjugateClosedSubgroup K s)
          (conjugateClosedSubgroup L s)
          (conjugateClosedSubgroup_mono hLK s)) :=
      finite_conjugateExtension K L hLK s
    relativeNorm A (conjugateClosedSubgroup K s)
        (conjugateClosedSubgroup L s)
        (conjugateClosedSubgroup_mono hLK s)
        (conjugateFixedElement A L s a) =
      conjugateFixedElement A K s (relativeNorm A K L hLK a) := by
  let hConj := conjugateClosedSubgroup_mono hLK s
  let := Fintype.ofFinite
    (K.toSubgroup ⧸ extensionSubgroup K L hLK)
  let e := relativeConjugateCosetEquiv K L hLK s
  let conjugateFintype : Fintype
      ((conjugateClosedSubgroup K s).toSubgroup ⧸
        extensionSubgroup (conjugateClosedSubgroup K s)
          (conjugateClosedSubgroup L s) hConj) :=
    Fintype.ofEquiv (K.toSubgroup ⧸ extensionSubgroup K L hLK) e
  have hconjugateFintype : Fintype.ofFinite
      ((conjugateClosedSubgroup K s).toSubgroup ⧸
        extensionSubgroup (conjugateClosedSubgroup K s)
          (conjugateClosedSubgroup L s) hConj) = conjugateFintype :=
    Subsingleton.elim _ _
  apply Subtype.ext
  simp only [relativeNorm_apply_coe, relativeNormValue,
    conjugateFixedElement_coe]
  rw [hconjugateFintype]
  calc
    ∑ q, relativeCosetAction A (conjugateClosedSubgroup K s)
        (conjugateClosedSubgroup L s) hConj
        (conjugateFixedElement A L s a) q =
      ∑ q, relativeCosetAction A (conjugateClosedSubgroup K s)
        (conjugateClosedSubgroup L s) hConj
        (conjugateFixedElement A L s a) (e q) := by
          exact (e.sum_comp fun q =>
            relativeCosetAction A (conjugateClosedSubgroup K s)
              (conjugateClosedSubgroup L s) hConj
              (conjugateFixedElement A L s a) q).symm
    _ = ∑ q, A.ρ s⁻¹ (relativeCosetAction A K L hLK a q) := by
      apply Finset.sum_congr rfl
      intro q _
      exact relativeCosetAction_conjugate A K L hLK s a q
    _ = A.ρ s⁻¹ (∑ q, relativeCosetAction A K L hLK a q) := by
      rw [map_sum]
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

noncomputable def FiniteAbstractField.conjugate
    {G : Type*} [Group G] [TopologicalSpace G]
    [ContinuousMul G] (K : FiniteAbstractField G) (σ : G) :
    FiniteAbstractField G where
  field := conjugateClosedSubgroup K.field σ
  finite := Finite.of_equiv
    ((baseField G).toSubgroup ⧸
      extensionSubgroup (baseField G) K.field (le_baseField K.field))
    (absoluteConjugateCosetEquiv K.field σ).symm
 
theorem FiniteAbstractField.residueDegree_conjugate
    {G : Type*} [Group G] [TopologicalSpace G]
    [ContinuousMul G] (K : FiniteAbstractField G)
    (D : DegreeData G) (σ : G) :
    (K.conjugate σ).residueDegree D = K.residueDegree D := by
  apply PNat.eq
  change Nat.card
      (D.residueQuotient (conjugateClosedSubgroup K.field σ)) =
    Nat.card (D.residueQuotient K.field)
  unfold DegreeData.residueQuotient
  have himage := D.fieldImage_conjugate K.field σ
  apply Nat.card_congr
  exact Subgroup.quotientEquivOfEq
    (congrArg
      (fun H : Subgroup ZHatMul => H.subgroupOf (⊤ : Subgroup ZHatMul))
      himage)
namespace ValuationData

theorem normalizedValuation_conjugate [ContinuousMul G]
    (v : ValuationData D A) (K : FiniteAbstractField G) (σ : G)
    (a : ambientFixedAddSubgroup A K.field) :
    v.valuationAt (K.conjugate σ)
        (conjugateFixedElement A K.field σ a) =
      v.valuationAt K a := by
  let : Finite ((baseField G).toSubgroup ⧸
      extensionSubgroup (baseField G) (conjugateClosedSubgroup K.field σ)
        (le_baseField (conjugateClosedSubgroup K.field σ))) :=
    (K.conjugate σ).finite
  apply Subtype.ext
  apply zHatMulNat_injective (K.residueDegree D).property
  calc
    (K.residueDegree D : ℕ) •
        v.dividedAt (K.conjugate σ)
          (conjugateFixedElement A K.field σ a) =
      ((K.conjugate σ).residueDegree D : ℕ) •
        v.dividedAt (K.conjugate σ)
          (conjugateFixedElement A K.field σ a) := by
            rw [K.residueDegree_conjugate D σ]
    _ = v.normCompositeAt (K.conjugate σ)
        (conjugateFixedElement A K.field σ a) :=
      v.residueDegree_nsmul_dividedAt (K.conjugate σ) _
    _ = v.normCompositeAt K a := by
      change v.toAddMonoidHom
          (normToBase A (conjugateClosedSubgroup K.field σ)
            (conjugateFixedElement A K.field σ a)) =
        v.toAddMonoidHom (normToBase A K.field a)
      congr 1
      apply Subtype.ext
      calc
        ((normToBase A (conjugateClosedSubgroup K.field σ)
            (conjugateFixedElement A K.field σ a) :
              ambientFixedAddSubgroup A (baseField G)) : A.V) =
          A.ρ σ⁻¹
            ((normToBase A K.field a :
              ambientFixedAddSubgroup A (baseField G)) : A.V) := by
                simpa [normToBase] using
                  (relativeNorm_absoluteConjugate_apply A K.field σ a)
        _ = ((normToBase A K.field a :
              ambientFixedAddSubgroup A (baseField G)) : A.V) := by
                exact (normToBase A K.field a).2 ⟨σ⁻¹, trivial⟩
    _ = (K.residueDegree D : ℕ) • v.dividedAt K a :=
      (v.residueDegree_nsmul_dividedAt K a).symm

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
theorem fixedFieldInclusion_coe (A : Rep ℤ G) (K L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.toSubgroup)
    (a : ambientFixedAddSubgroup A K) :
    ((fixedFieldInclusion A K L hLK a : ambientFixedAddSubgroup A L) : A.V) = a.1 :=
  rfl
 
theorem relativeNorm_fixedFieldInclusion
    (A : Rep ℤ G) (E : DegreeData.FiniteAbstractExtension G)
    (a : ambientFixedAddSubgroup A E.base) :
    relativeNorm A E.base E.field E.below
        (fixedFieldInclusion A E.base E.field E.below a) =
      (E.degree : ℕ) • a := by
  apply Subtype.ext
  let := Fintype.ofFinite
    (E.base.toSubgroup ⧸ extensionSubgroup E.base E.field E.below)
  have hterm : ∀ q : E.base.toSubgroup ⧸
      extensionSubgroup E.base E.field E.below,
      relativeCosetAction A E.base E.field E.below
        (fixedFieldInclusion A E.base E.field E.below a) q = a.1 := by
    intro q
    refine Quotient.inductionOn' q ?_
    intro k
    rw [relativeCosetAction_mk, fixedFieldInclusion_coe]
    exact a.2 k
  simp only [relativeNorm_apply_coe, relativeNormValue]
  simp_rw [hterm]
  rw [Finset.sum_const, Finset.card_univ]
  change Fintype.card
      (E.base.toSubgroup ⧸ extensionSubgroup E.base E.field E.below) • a.1 =
    (E.degree : ℕ) • a.1
  rw [← E.extensionSubgroup_index_eq_degree,
    Subgroup.index, Nat.card_eq_fintype_card]
namespace ValuationData
 
def oneValue (v : ValuationData D A) : v.valueGroup :=
  ⟨1, by
    obtain ⟨a, ha⟩ := v.integers_mem 1
    exact ⟨a, by simpa using ha⟩⟩
 
def IsPrimeElement (v : ValuationData D A) (K : FiniteAbstractField G)
    (π : ambientFixedAddSubgroup A K.field) : Prop :=
  v.valuationAt K π = v.oneValue

def unitAddSubgroup (v : ValuationData D A) (K : FiniteAbstractField G) :
    AddSubgroup (ambientFixedAddSubgroup A K.field) :=
  (v.valuationAt K).ker
 
@[simp]
theorem mem_unitAddSubgroup_iff (v : ValuationData D A)
    (K : FiniteAbstractField G)
    (u : ambientFixedAddSubgroup A K.field) :
    u ∈ v.unitAddSubgroup K ↔ v.valuationAt K u = 0 :=
  Iff.rfl

theorem valuationAt_fixedFieldInclusion_of_unramified
    (v : ValuationData D A)
    (E : FiniteAbstractFieldExtension G)
    (hUn : E.IsUnramified D)
    (a : ambientFixedAddSubgroup A E.base.field) :
    v.valuationAt E.field
        (fixedFieldInclusion A E.base.field E.field.field E.below a) =
      v.valuationAt E.base a := by
  let EF := E.toFiniteAbstractExtension
  have hfeq : (E.residueDegree D : ℕ) = (E.degree : ℕ) :=
    E.residueDegree_eq_degree_of_isUnramified D hUn
  apply Subtype.ext
  apply zHatMulNat_injective (E.residueDegree D).property
  calc
    (E.residueDegree D : ℕ) •
        ((v.valuationAt E.field
          (fixedFieldInclusion A E.base.field E.field.field E.below a) :
          v.valueGroup) : ZHat) =
      ((v.valuationAt E.base
        (relativeNorm A E.base.field E.field.field E.below
          (fixedFieldInclusion A E.base.field E.field.field E.below a)) :
          v.valueGroup) : ZHat) :=
        v.normalizedValuation_tower E
          (fixedFieldInclusion A E.base.field E.field.field E.below a)
    _ = ((v.valuationAt E.base ((E.degree : ℕ) • a) :
          v.valueGroup) : ZHat) := by
        rw [show relativeNorm A E.base.field E.field.field E.below
            (fixedFieldInclusion A E.base.field E.field.field E.below a) =
              (E.degree : ℕ) • a by
          simpa [EF, FiniteAbstractFieldExtension.toFiniteAbstractExtension,
              FiniteAbstractFieldExtension.degree] using
                relativeNorm_fixedFieldInclusion A EF a]
    _ = (E.degree : ℕ) •
        ((v.valuationAt E.base a : v.valueGroup) : ZHat) := by
          exact congrArg Subtype.val
            (map_nsmul (v.valuationAt E.base) (E.degree : ℕ) a)
    _ = (E.residueDegree D : ℕ) •
        ((v.valuationAt E.base a : v.valueGroup) : ZHat) := by
          rw [hfeq]
 
theorem prime_of_unramified (v : ValuationData D A)
    (E : FiniteAbstractFieldExtension G)
    (hUn : E.IsUnramified D)
    (π : ambientFixedAddSubgroup A E.base.field)
    (hπ : v.IsPrimeElement E.base π) :
    v.IsPrimeElement E.field
      (fixedFieldInclusion A E.base.field E.field.field E.below π) := by
  rw [IsPrimeElement,
    v.valuationAt_fixedFieldInclusion_of_unramified E hUn π]
  exact hπ
end ValuationData
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
 
theorem extensionInertiaWithin_le_frobeniusFixedSubgroupWithin
    (D : DegreeData G) [IsTopologicalGroup G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (σ : D.FrobeniusElements K L hLK) :
    D.extensionInertiaWithin K.field L hLK ≤
      D.frobeniusFixedSubgroupWithin K L hLK σ := by
  intro k hk
  change QuotientGroup.mk k ∈
    (D.frobeniusClosure K L hLK σ).toSubgroup
  rw [(QuotientGroup.eq_one_iff k).2 hk]
  exact Subgroup.one_mem _
 
theorem fieldInertia_le_frobeniusFixedField (D : DegreeData G)
    [IsTopologicalGroup G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (σ : D.FrobeniusElements K L hLK) :
    (D.fieldInertia L).toSubgroup ≤
      (D.frobeniusFixedField K L hLK σ).toSubgroup := by
  intro g hg
  let k : K.field.toSubgroup := ⟨g, hLK hg.1⟩
  have hkE : k ∈ extensionSubgroup K.field L hLK := hg.1
  have hkI : k ∈ D.fieldInertiaWithin K.field := hg.2
  exact ⟨k,
    D.extensionInertiaWithin_le_frobeniusFixedSubgroupWithin
      K L hLK σ ⟨hkE, hkI⟩,
    rfl⟩
 
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

theorem frobeniusFixedSubgroupWithin_inf_fieldInertiaWithin
    (D : DegreeData G)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    [TotallyDisconnectedSpace G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (σ : D.FrobeniusElements K L hLK) :
    D.frobeniusFixedSubgroupWithin K L hLK σ ⊓
        D.fieldInertiaWithin K.field =
      D.extensionInertiaWithin K.field L hLK := by
  apply le_antisymm
  · intro k hk
    let a : D.frobeniusClosure K L hLK σ :=
      ⟨QuotientGroup.mk k, hk.1⟩
    have hda : D.fixedFieldNormalizedDegree K L hLK σ a = 1 := by
      apply Multiplicative.ext
      apply zHatMulNat_injective
        (D.frobeniusExponent_pos K L hLK σ)
      change D.frobeniusExponent K L hLK σ •
          (D.fixedFieldNormalizedDegree K L hLK σ a).toAdd =
        D.frobeniusExponent K L hLK σ • (1 : ZHatMul).toAdd
      rw [D.frobeniusExponent_nsmul_fixedFieldNormalizedDegree]
      change (D.normalizedDegree K k).toAdd =
        D.frobeniusExponent K L hLK σ • (1 : ZHatMul).toAdd
      have hdk : D.normalizedDegree K k = 1 := by
        change k ∈ (D.normalizedDegree K).toMonoidHom.ker
        rw [D.normalizedDegree_ker K]
        exact hk.2
      rw [hdk]
      simp
    have ha : a = 1 := by
      apply D.frobeniusFixedField_normalizedDegree_injective K L hLK σ
      simpa using hda
    apply (QuotientGroup.eq_one_iff k).mp
    exact congrArg Subtype.val ha
  · intro k hk
    exact
      ⟨D.extensionInertiaWithin_le_frobeniusFixedSubgroupWithin
          K L hLK σ hk,
        hk.2⟩

theorem frobeniusFixedField_fieldInertia (D : DegreeData G)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    [TotallyDisconnectedSpace G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (σ : D.FrobeniusElements K L hLK) :
    D.fieldInertia (D.frobeniusFixedField K L hLK σ) =
      D.fieldInertia L := by
  ext g
  constructor
  · intro hg
    obtain ⟨k, hkS, hkg⟩ := hg.1
    have hgdeg : D.degree g = 1 := hg.2
    have hkI : k ∈ D.fieldInertiaWithin K.field := by
      change D.degree k.1 = 1
      exact (congrArg D.degree hkg).trans hgdeg
    have hkN : k ∈ D.extensionInertiaWithin K.field L hLK := by
      rw [← D.frobeniusFixedSubgroupWithin_inf_fieldInertiaWithin
        K L hLK σ]
      exact ⟨hkS, hkI⟩
    exact ⟨hkg ▸ hkN.1, hg.2⟩
  · intro hg
    let k : K.field.toSubgroup := ⟨g, hLK hg.1⟩
    have hgdeg : D.degree g = 1 := hg.2
    have hkE : k ∈ extensionSubgroup K.field L hLK := hg.1
    have hkI : k ∈ D.fieldInertiaWithin K.field := hgdeg
    have hkS : k ∈ D.frobeniusFixedSubgroupWithin K L hLK σ :=
      D.extensionInertiaWithin_le_frobeniusFixedSubgroupWithin
        K L hLK σ ⟨hkE, hkI⟩
    exact ⟨⟨k, hkS, rfl⟩, hg.2⟩
end DegreeData
end
end ClassFormation
end

/- ClassFieldTheory.AbstractClassFieldTheory.Reciprocity.Construction.FrobeniusSemigroup -/
section
namespace ClassFormation
open CyclicCohomology
noncomputable section
namespace DegreeData
variable {G : Type*} [Group G] [TopologicalSpace G]
 
def frobeniusMul (D : DegreeData G) (K : FiniteResidueAbstractField D)
    (L : ClosedSubgroup G) (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (CyclicCohomology.extensionSubgroup (G := G)
      K.field L hLK).Normal]
    (σ τ : D.FrobeniusElements K L hLK) :
    D.FrobeniusElements K L hLK := by
  let m := D.frobeniusExponent K L hLK σ
  let n := D.frobeniusExponent K L hLK τ
  refine ⟨σ.1 * τ.1, m + n,
    Nat.add_pos_left (D.frobeniusExponent_pos K L hLK σ) n, ?_⟩
  rw [map_mul,
    D.extensionNormalizedDegree_frobenius_eq_pow K L hLK σ,
    D.extensionNormalizedDegree_frobenius_eq_pow K L hLK τ,
    pow_add]

instance frobeniusElementsMul (D : DegreeData G)
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (CyclicCohomology.extensionSubgroup (G := G)
      K.field L hLK).Normal] :
    Mul (D.FrobeniusElements K L hLK) :=
  ⟨D.frobeniusMul K L hLK⟩
 
@[simp]
theorem frobeniusMul_coe (D : DegreeData G)
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (CyclicCohomology.extensionSubgroup (G := G)
      K.field L hLK).Normal]
    (σ τ : D.FrobeniusElements K L hLK) :
    (σ * τ).1 = σ.1 * τ.1 :=
  rfl
end DegreeData
end
end ClassFormation
end

/- ClassFieldTheory.AbstractClassFieldTheory.Reciprocity.Construction.NormSubgroup -/
section
universe u
namespace ClassFormation
open KummerTheory
open CyclicCohomology
noncomputable section
section finiteIntermediateFields
variable {G : Type u} [Group G] [TopologicalSpace G]

structure FiniteIntermediateField (E K : ClosedSubgroup G) where
   
  field : ClosedSubgroup G
   
  above : E.toSubgroup ≤ field.toSubgroup
   
  below : field.toSubgroup ≤ K.toSubgroup
   
  finite : Finite
    (K.toSubgroup ⧸ extensionSubgroup K field below)
namespace FiniteIntermediateField
 
def base (E K : ClosedSubgroup G) (hEK : E.toSubgroup ≤ K.toSubgroup) :
    FiniteIntermediateField E K where
  field := K
  above := hEK
  below := le_rfl
  finite := by
    have htop : extensionSubgroup K K le_rfl = ⊤ := by
      ext x
      constructor
      · intro _
        trivial
      · intro _
        exact x.2
    rw [htop]
    infer_instance
end FiniteIntermediateField
end finiteIntermediateFields
section infiniteNorms
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
end infiniteNorms
section maximalUnramifiedFields
variable {G : Type u} [Group G] [TopologicalSpace G]
namespace DegreeData

def maximalUnramifiedField (D : DegreeData G) (L : ClosedSubgroup G) :
    ClosedSubgroup G :=
  D.fieldInertia L

theorem maximalUnramifiedField_eq_fieldInertia
    (D : DegreeData G) (L : ClosedSubgroup G) :
    D.maximalUnramifiedField L = D.fieldInertia L := by
  rfl

@[simp]
theorem mem_maximalUnramifiedField_iff
    (D : DegreeData G) (L : ClosedSubgroup G) (g : G) :
    g ∈ D.maximalUnramifiedField L ↔ g ∈ L ∧ D.degree g = 1 := by
  rw [D.maximalUnramifiedField_eq_fieldInertia]
  exact D.mem_fieldInertia_iff L g
 
theorem maximalUnramifiedField_le (D : DegreeData G) (L : ClosedSubgroup G) :
    (D.maximalUnramifiedField L).toSubgroup ≤ L.toSubgroup := by
  rw [D.maximalUnramifiedField_eq_fieldInertia]
  exact inf_le_left
 
theorem maximalUnramifiedField_le_of_le (D : DegreeData G)
    {L K : ClosedSubgroup G} (hLK : L.toSubgroup ≤ K.toSubgroup) :
    (D.maximalUnramifiedField L).toSubgroup ≤ K.toSubgroup :=
  (D.maximalUnramifiedField_le L).trans hLK
 
theorem maximalUnramifiedField_mono (D : DegreeData G)
    {K L : ClosedSubgroup G} (hLK : L.toSubgroup ≤ K.toSubgroup) :
    (D.maximalUnramifiedField L).toSubgroup ≤
      (D.maximalUnramifiedField K).toSubgroup := by
  intro g hg
  have hg' : g ∈ D.maximalUnramifiedField L := hg
  obtain ⟨hgL, hgd⟩ := (D.mem_maximalUnramifiedField_iff L g).1 hg'
  exact (D.mem_maximalUnramifiedField_iff K g).2 ⟨hLK hgL, hgd⟩

theorem extensionSubgroup_maximalUnramifiedField (D : DegreeData G)
    (K L : ClosedSubgroup G) (hLK : L.toSubgroup ≤ K.toSubgroup) :
    extensionSubgroup K (D.maximalUnramifiedField L)
        (D.maximalUnramifiedField_le_of_le hLK) =
      D.extensionInertiaWithin K L hLK := by
  ext k
  constructor
  · intro hk
    have hkMax : k.1 ∈ D.maximalUnramifiedField L :=
      (mem_extensionSubgroup_iff K (D.maximalUnramifiedField L)
        (D.maximalUnramifiedField_le_of_le hLK) k).1 hk
    have hkData := (D.mem_maximalUnramifiedField_iff L k.1).1 hkMax
    exact ⟨(mem_extensionSubgroup_iff K L hLK k).2 hkData.1,
      (D.mem_fieldInertiaWithin_iff K k).2 hkData.2⟩
  · intro hk
    apply (mem_extensionSubgroup_iff K (D.maximalUnramifiedField L)
      (D.maximalUnramifiedField_le_of_le hLK) k).2
    apply (D.mem_maximalUnramifiedField_iff L k.1).2
    exact ⟨(mem_extensionSubgroup_iff K L hLK k).1 hk.1,
      (D.mem_fieldInertiaWithin_iff K k).1 hk.2⟩
 
theorem extensionSubgroup_maximalUnramifiedField_normal (D : DegreeData G)
    (K L : ClosedSubgroup G) (hLK : L.toSubgroup ≤ K.toSubgroup)
    [hLnormal : (extensionSubgroup K L hLK).Normal] :
    (extensionSubgroup K (D.maximalUnramifiedField L)
      (D.maximalUnramifiedField_le_of_le hLK)).Normal := by
  rw [D.extensionSubgroup_maximalUnramifiedField K L hLK]
  infer_instance
end DegreeData
end maximalUnramifiedFields
section maximalUnramifiedNorms
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
namespace DegreeData
end DegreeData
end maximalUnramifiedNorms
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
 
theorem sub_mem_unitAddSubgroup_of_prime
    (v : ValuationData D A) (K : FiniteAbstractField G)
    {π π' : ambientFixedAddSubgroup A K.field}
    (hπ : v.IsPrimeElement K π) (hπ' : v.IsPrimeElement K π') :
    π' - π ∈ v.unitAddSubgroup K := by
  rw [v.mem_unitAddSubgroup_iff, map_sub, hπ, hπ']
  exact sub_self _
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

def frobeniusFixedIntermediateField (D : DegreeData G)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    [hLfinite : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK)]
    (σ : D.FrobeniusElements K L hLK) :
    FiniteIntermediateField (D.maximalUnramifiedField L) K.field where
  field := D.frobeniusFixedField K L hLK σ
  above := D.fieldInertia_le_frobeniusFixedField K L hLK σ
  below := D.frobeniusFixedField_le K L hLK σ
  finite := D.frobeniusFixedField_finite K L hLK σ
 
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
namespace FiniteCyclicSubextension
variable {K : FiniteAbstractField G}
end FiniteCyclicSubextension
end Generic
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
variable {D : DegreeData G} {A : Rep ℤ G}
namespace FiniteUnramifiedCyclicExtension
variable {K : FiniteAbstractField G}
end FiniteUnramifiedCyclicExtension
namespace FiniteCyclicSubextension
variable {K : FiniteAbstractField G}
end FiniteCyclicSubextension
namespace ValuationData

theorem valuationAt_normalExtensionAction
    (v : ValuationData D A) (E : FiniteAbstractFieldExtension G)
    (hnormal : (extensionSubgroup E.base.field E.field.field E.below).Normal)
    (k : E.base.field.toSubgroup)
    (a : ambientFixedAddSubgroup A E.field.field) :
    v.valuationAt E.field
        (normalExtensionAction A E.base.field E.field.field E.below
          hnormal k a) =
      v.valuationAt E.field a := by
  apply Subtype.ext
  apply zHatMulNat_injective (E.field.residueDegree D).property
  calc
    (E.field.residueDegree D : ℕ) •
        ((v.valuationAt E.field
          (normalExtensionAction A E.base.field E.field.field E.below
            hnormal k a) : v.valueGroup) : ZHat) =
      v.normCompositeAt E.field
        (normalExtensionAction A E.base.field E.field.field E.below
          hnormal k a) :=
        v.residueDegree_nsmul_dividedAt E.field _
    _ = v.normCompositeAt E.field a := by
      change v.toAddMonoidHom
          (normToBase A E.field.field
            (normalExtensionAction A E.base.field E.field.field E.below
              hnormal k a)) =
        v.toAddMonoidHom (normToBase A E.field.field a)
      congr 1
      let T : DegreeData.FiniteTower G := {
        top := E.field.field
        middle := E.base.field
        base := baseField G
        top_le_middle := E.below
        middle_le_base := le_baseField E.base.field
        finiteTopQuotient := E.finiteQuotient
        finiteBaseQuotient := E.base.finite }
      calc
        relativeNorm A (baseField G) E.field.field
            (E.below.trans (le_baseField E.base.field))
            (normalExtensionAction A E.base.field E.field.field E.below
              hnormal k a) =
          relativeNorm A (baseField G) E.base.field
            (le_baseField E.base.field)
            (relativeNorm A E.base.field E.field.field E.below
              (normalExtensionAction A E.base.field E.field.field E.below
                hnormal k a)) :=
          (T.norm_trans_apply A _).symm
        _ = relativeNorm A (baseField G) E.base.field
            (le_baseField E.base.field)
            (relativeNorm A E.base.field E.field.field E.below a) := by
          rw [relativeNorm_normalExtensionAction A E.base.field E.field.field
            E.below hnormal k a]
        _ = relativeNorm A (baseField G) E.field.field
            (E.below.trans (le_baseField E.base.field)) a :=
          T.norm_trans_apply A a
    _ = (E.field.residueDegree D : ℕ) •
        ((v.valuationAt E.field a : v.valueGroup) : ZHat) :=
      (v.residueDegree_nsmul_dividedAt E.field a).symm
 
noncomputable def unitActionLinearMap
    (v : ValuationData D A) (E : FiniteAbstractFieldExtension G)
    (hnormal : (extensionSubgroup E.base.field E.field.field E.below).Normal)
    (k : E.base.field.toSubgroup) :
    v.unitAddSubgroup E.field →ₗ[ℤ] v.unitAddSubgroup E.field where
  toFun u := ⟨normalExtensionAction A E.base.field E.field.field E.below
      hnormal k u.1, by
    rw [mem_unitAddSubgroup_iff,
      v.valuationAt_normalExtensionAction E hnormal k u.1]
    exact u.2⟩
  map_add' u w := by
    apply Subtype.ext
    apply Subtype.ext
    change A.ρ k.1 (u.1.1 + w.1.1) = A.ρ k.1 u.1.1 + A.ρ k.1 w.1.1
    exact map_add (A.ρ k.1) _ _
  map_smul' n u := by
    apply Subtype.ext
    apply Subtype.ext
    change A.ρ k.1 (n • u.1.1) = n • A.ρ k.1 u.1.1
    exact map_zsmul (A.ρ k.1) n u.1.1
end ValuationData
namespace FiniteUnramifiedCyclicExtension
variable {K : FiniteAbstractField G}
end FiniteUnramifiedCyclicExtension
namespace ValuationData
end ValuationData
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

def normalCoreField [IsTopologicalGroup G]
    {E K : ClosedSubgroup G} (M : FiniteIntermediateField E K) :
    ClosedSubgroup G where
  toSubgroup :=
    (extensionSubgroup K M.field M.below).normalCore.map
      K.toSubgroup.subtype
  isClosed' := by
    change IsClosed
      (Subtype.val ''
        ((extensionSubgroup K M.field M.below).normalCore : Set K.toSubgroup))
    exact K.isClosed'.isClosedEmbedding_subtypeVal.isClosedMap _
      ((extensionSubgroup K M.field M.below).normalCore_isClosed
        (extensionSubgroup_isClosed K M.field M.below))
 
theorem normalCoreField_le [IsTopologicalGroup G]
    {E K : ClosedSubgroup G} (M : FiniteIntermediateField E K) :
    (M.normalCoreField).toSubgroup ≤ K.toSubgroup := by
  rintro g ⟨k, _, rfl⟩
  exact k.2
 
theorem normalCoreField_le_field [IsTopologicalGroup G]
    {E K : ClosedSubgroup G} (M : FiniteIntermediateField E K) :
    (M.normalCoreField).toSubgroup ≤ M.field.toSubgroup := by
  rintro g ⟨k, hk, rfl⟩
  exact (mem_extensionSubgroup_iff K M.field M.below k).1
    ((extensionSubgroup K M.field M.below).normalCore_le hk)
 
theorem extensionSubgroup_normalCoreField [IsTopologicalGroup G]
    {E K : ClosedSubgroup G} (M : FiniteIntermediateField E K) :
    extensionSubgroup K M.normalCoreField M.normalCoreField_le =
      (extensionSubgroup K M.field M.below).normalCore := by
  ext k
  constructor
  · intro hk
    obtain ⟨k', hk', hk'n⟩ := hk
    have hk'eq : k' = k := by
      apply Subtype.ext
      exact hk'n
    simpa [hk'eq] using hk'
  · intro hk
    exact ⟨k, hk, rfl⟩

def galoisRefinement [IsTopologicalGroup G]
    {E K : ClosedSubgroup G} (M : FiniteIntermediateField E K)
    [hEnormal :
      (extensionSubgroup K E (M.above.trans M.below)).Normal] :
    FiniteIntermediateField E K where
  field := M.normalCoreField
  above := by
    intro e he
    let eK : K.toSubgroup := ⟨e, M.below (M.above he)⟩
    have heE : eK ∈ extensionSubgroup K E (M.above.trans M.below) :=
      (mem_extensionSubgroup_iff K E (M.above.trans M.below) eK).2 he
    have hle : extensionSubgroup K E (M.above.trans M.below) ≤
        extensionSubgroup K M.field M.below := by
      intro x hx
      apply (mem_extensionSubgroup_iff K M.field M.below x).2
      exact M.above
        ((mem_extensionSubgroup_iff K E (M.above.trans M.below) x).1 hx)
    have heCore : eK ∈ (extensionSubgroup K M.field M.below).normalCore :=
      (Subgroup.normal_le_normalCore.mpr hle) heE
    exact ⟨eK, heCore, rfl⟩
  below := M.normalCoreField_le
  finite := by
    let H := extensionSubgroup K M.field M.below
    let : H.FiniteIndex :=
      @Subgroup.finiteIndex_of_finite_quotient K.toSubgroup _ H M.finite
    let : H.normalCore.FiniteIndex := inferInstance
    rw [M.extensionSubgroup_normalCoreField]
    infer_instance
 
theorem galoisRefinement_le_field [IsTopologicalGroup G]
    {E K : ClosedSubgroup G} (M : FiniteIntermediateField E K)
    [_hEnormal :
      (extensionSubgroup K E (M.above.trans M.below)).Normal] :
    (M.galoisRefinement).field.toSubgroup ≤ M.field.toSubgroup :=
  M.normalCoreField_le_field
 
instance galoisRefinement_normal [IsTopologicalGroup G]
    {E K : ClosedSubgroup G} (M : FiniteIntermediateField E K)
    [hEnormal :
      (extensionSubgroup K E (M.above.trans M.below)).Normal] :
    (extensionSubgroup K (M.galoisRefinement).field
      (M.galoisRefinement).below).Normal := by
  change (extensionSubgroup K M.normalCoreField M.normalCoreField_le).Normal
  rw [M.extensionSubgroup_normalCoreField]
  infer_instance

def compositumWith
    {E K : ClosedSubgroup G} (M : FiniteIntermediateField E K)
    (S : ClosedSubgroup G) : ClosedSubgroup G :=
  M.field ⊓ S
 
theorem compositumWith_le_right
    {E K : ClosedSubgroup G} (M : FiniteIntermediateField E K)
    (S : ClosedSubgroup G) :
    (M.compositumWith S).toSubgroup ≤ S.toSubgroup :=
  inf_le_right

theorem compositumWith_finite_over_base
    {E K : ClosedSubgroup G} (M : FiniteIntermediateField E K)
    (S : ClosedSubgroup G) (hSK : S.toSubgroup ≤ K.toSubgroup)
    [hSfinite : Finite (K.toSubgroup ⧸ extensionSubgroup K S hSK)] :
    Finite (K.toSubgroup ⧸ extensionSubgroup K (M.compositumWith S)
      ((M.compositumWith_le_right S).trans hSK)) := by
  have hMindex : M.field.toSubgroup.relIndex K.toSubgroup ≠ 0 := by
    rw [Subgroup.relIndex]
    exact @Subgroup.index_ne_zero_of_finite K.toSubgroup _
      (extensionSubgroup K M.field M.below) M.finite
  have hSindex : S.toSubgroup.relIndex K.toSubgroup ≠ 0 := by
    rw [Subgroup.relIndex]
    exact @Subgroup.index_ne_zero_of_finite K.toSubgroup _
      (extensionSubgroup K S hSK) hSfinite
  apply Nat.finite_of_card_ne_zero
  change (extensionSubgroup K (M.compositumWith S)
      ((M.compositumWith_le_right S).trans hSK)).index ≠ 0
  have hsub : extensionSubgroup K (M.compositumWith S)
      ((M.compositumWith_le_right S).trans hSK) =
      (M.field.toSubgroup ⊓ S.toSubgroup).subgroupOf K.toSubgroup := by
    ext x
    rw [mem_extensionSubgroup_iff, Subgroup.mem_subgroupOf, Subgroup.mem_inf]
    rfl
  rw [hsub]
  simpa only [Subgroup.relIndex] using
    Subgroup.relIndex_inf_ne_zero hMindex hSindex

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

/- ClassFieldTheory.AbstractClassFieldTheory.Reciprocity.Construction.FiniteIntermediateCompositum -/
section
namespace ClassFormation
open CyclicCohomology
noncomputable section
variable {G : Type*} [Group G] [TopologicalSpace G]
namespace FiniteIntermediateField
 
def compositum {E K : ClosedSubgroup G}
    (M N : FiniteIntermediateField E K) :
    FiniteIntermediateField E K where
  field := M.field ⊓ N.field
  above := fun x hx => ⟨M.above hx, N.above hx⟩
  below := (inf_le_left :
    (M.field ⊓ N.field).toSubgroup ≤ M.field.toSubgroup).trans M.below
  finite := by
    let : Finite
        (K.toSubgroup ⧸ extensionSubgroup K N.field N.below) := N.finite
    exact M.compositumWith_finite_over_base N.field N.below
 
theorem compositum_le_left {E K : ClosedSubgroup G}
    (M N : FiniteIntermediateField E K) :
    (M.compositum N).field.toSubgroup ≤ M.field.toSubgroup :=
  inf_le_left
 
theorem compositum_le_right {E K : ClosedSubgroup G}
    (M N : FiniteIntermediateField E K) :
    (M.compositum N).field.toSubgroup ≤ N.field.toSubgroup :=
  inf_le_right
end FiniteIntermediateField
end
end ClassFormation
end

/- ClassFieldTheory.AbstractClassFieldTheory.Reciprocity.Construction.CoreFrobeniusNorm -/
section
universe u
namespace ClassFormation
open KummerTheory
open CyclicCohomology
noncomputable section
open scoped BigOperators
section inertiaQuotients
variable {G : Type u} [Group G] [TopologicalSpace G]
namespace DegreeData
 
private noncomputable def inertiaCosetToExtensionCoset (D : DegreeData G)
    (K L : ClosedSubgroup G) (hLK : L.toSubgroup ≤ K.toSubgroup) :
    ((D.maximalUnramifiedField K).toSubgroup ⧸
        extensionSubgroup (D.maximalUnramifiedField K)
          (D.maximalUnramifiedField L)
          (D.maximalUnramifiedField_mono hLK)) →
      (K.toSubgroup ⧸ extensionSubgroup K L hLK) :=
  Quotient.map'
    (fun x : (D.maximalUnramifiedField K).toSubgroup =>
      (⟨x.1, x.2.1⟩ : K.toSubgroup))
    (by
      intro x y hxy
      rw [QuotientGroup.leftRel_apply] at hxy ⊢
      exact hxy.1)
private theorem inertiaCosetToExtensionCoset_injective (D : DegreeData G)
    (K L : ClosedSubgroup G) (hLK : L.toSubgroup ≤ K.toSubgroup) :
    Function.Injective (D.inertiaCosetToExtensionCoset K L hLK) := by
  intro x y hxy
  refine Quotient.inductionOn₂' x y ?_ hxy
  intro a b hab
  apply Quotient.sound'
  rw [QuotientGroup.leftRel_apply]
  have habE :
      (⟨a.1, a.2.1⟩ : K.toSubgroup)⁻¹ * ⟨b.1, b.2.1⟩ ∈
        extensionSubgroup K L hLK := by
    exact QuotientGroup.leftRel_apply.mp (Quotient.exact' hab)
  refine ⟨habE, ?_⟩
  change D.degree (a.1⁻¹ * b.1) = 1
  rw [map_mul, map_inv]
  change (D.degree a.1)⁻¹ * D.degree b.1 = 1
  rw [show D.degree a.1 = 1 from a.2.2,
    show D.degree b.1 = 1 from b.2.2]
  simp

theorem maximalUnramifiedExtension_finite (D : DegreeData G)
    (K L : ClosedSubgroup G) (hLK : L.toSubgroup ≤ K.toSubgroup)
    [Finite (K.toSubgroup ⧸ extensionSubgroup K L hLK)] :
    Finite
      ((D.maximalUnramifiedField K).toSubgroup ⧸
        extensionSubgroup (D.maximalUnramifiedField K)
          (D.maximalUnramifiedField L)
          (D.maximalUnramifiedField_mono hLK)) :=
  Finite.of_injective (D.inertiaCosetToExtensionCoset K L hLK)
    (D.inertiaCosetToExtensionCoset_injective K L hLK)

private noncomputable def inertiaCosetToDegreeKernel (D : DegreeData G)
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal] :
    ((D.maximalUnramifiedField K.field).toSubgroup ⧸
        extensionSubgroup (D.maximalUnramifiedField K.field)
          (D.maximalUnramifiedField L)
          (D.maximalUnramifiedField_mono hLK)) →
      (D.extensionNormalizedDegreeContinuous K L hLK).toMonoidHom.ker :=
  fun r => Quotient.liftOn' r
    (fun x : (D.maximalUnramifiedField K.field).toSubgroup => by
      let k : K.field.toSubgroup := ⟨x.1, x.2.1⟩
      refine ⟨QuotientGroup.mk k, ?_⟩
      change D.normalizedDegree K k = 1
      change k ∈ (D.normalizedDegree K).toMonoidHom.ker
      rw [D.normalizedDegree_ker K]
      exact x.2.2)
    (by
      intro x y hxy
      apply Subtype.ext
      apply QuotientGroup.eq.mpr
      rw [← D.extensionSubgroup_maximalUnramifiedField K.field L hLK]
      rw [QuotientGroup.leftRel_apply] at hxy
      exact hxy)
private theorem inertiaCosetToDegreeKernel_bijective (D : DegreeData G)
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal] :
    Function.Bijective (D.inertiaCosetToDegreeKernel K L hLK) := by
  constructor
  · intro x y hxy
    refine Quotient.inductionOn₂' x y ?_ hxy
    intro a b hab
    apply Quotient.sound'
    rw [QuotientGroup.leftRel_apply]
    have hq : QuotientGroup.mk (⟨a.1, a.2.1⟩ : K.field.toSubgroup) =
        QuotientGroup.mk (⟨b.1, b.2.1⟩ : K.field.toSubgroup) :=
      congrArg Subtype.val hab
    have hkN :
        (⟨a.1, a.2.1⟩ : K.field.toSubgroup)⁻¹ * ⟨b.1, b.2.1⟩ ∈
          D.extensionInertiaWithin K.field L hLK :=
      QuotientGroup.eq.mp hq
    refine ⟨hkN.1, ?_⟩
    change D.degree (a.1⁻¹ * b.1) = 1
    rw [map_mul, map_inv]
    change (D.degree a.1)⁻¹ * D.degree b.1 = 1
    rw [show D.degree a.1 = 1 from a.2.2,
      show D.degree b.1 = 1 from b.2.2]
    simp
  · intro z
    obtain ⟨k, hk⟩ := QuotientGroup.mk'_surjective
      (D.extensionInertiaWithin K.field L hLK) z.1
    have hkNorm : D.normalizedDegree K k = 1 := by
      change D.extensionNormalizedDegreeContinuous K L hLK
          ((QuotientGroup.mk' (D.extensionInertiaWithin K.field L hLK)) k) = 1
      exact (congrArg
        (D.extensionNormalizedDegreeContinuous K L hLK) hk).trans z.2
    have hkI : k ∈ D.fieldInertiaWithin K.field := by
      rw [← D.normalizedDegree_ker K]
      exact hkNorm
    let x : (D.maximalUnramifiedField K.field).toSubgroup :=
      ⟨k.1, ⟨k.2, hkI⟩⟩
    refine ⟨QuotientGroup.mk x, ?_⟩
    apply Subtype.ext
    exact hk
 
noncomputable def inertiaQuotientDegreeKernelEquiv (D : DegreeData G)
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal] :
    ((D.maximalUnramifiedField K.field).toSubgroup ⧸
        extensionSubgroup (D.maximalUnramifiedField K.field)
          (D.maximalUnramifiedField L)
          (D.maximalUnramifiedField_mono hLK)) ≃
      (D.extensionNormalizedDegreeContinuous K L hLK).toMonoidHom.ker :=
  Equiv.ofBijective (D.inertiaCosetToDegreeKernel K L hLK)
    (D.inertiaCosetToDegreeKernel_bijective K L hLK)
end DegreeData
end inertiaQuotients
section quotientActions
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
namespace DegreeData
 
def frobeniusQuotientAction (D : DegreeData G) (A : Rep ℤ G)
    (K L : ClosedSubgroup G) (hLK : L.toSubgroup ≤ K.toSubgroup)
    [hLnormal : (extensionSubgroup K L hLK).Normal]
    (q : K.toSubgroup ⧸ D.extensionInertiaWithin K L hLK)
    (a : ambientFixedAddSubgroup A (D.maximalUnramifiedField L)) :
    ambientFixedAddSubgroup A (D.maximalUnramifiedField L) :=
  Quotient.liftOn' q
    (fun k : K.toSubgroup =>
      normalExtensionAction A K (D.maximalUnramifiedField L)
        (D.maximalUnramifiedField_le_of_le hLK)
        (D.extensionSubgroup_maximalUnramifiedField_normal K L hLK) k a)
    (by
      intro x y hxy
      rw [QuotientGroup.leftRel_apply] at hxy
      rw [← D.extensionSubgroup_maximalUnramifiedField K L hLK] at hxy
      let l : (D.maximalUnramifiedField L).toSubgroup :=
        ⟨x.1⁻¹ * y.1, hxy⟩
      have hy : y = x * Subgroup.inclusion
          (D.maximalUnramifiedField_le_of_le hLK) l := by
        apply Subtype.ext
        simp [l]
      apply Subtype.ext
      change A.ρ x.1 a.1 = A.ρ y.1 a.1
      rw [hy]
      change A.ρ x.1 a.1 = A.ρ (x.1 * l.1) a.1
      rw [map_mul]
      change A.ρ x.1 a.1 = A.ρ x.1 (A.ρ l.1 a.1)
      rw [a.2 l])

@[simp]
theorem frobeniusQuotientAction_mk (D : DegreeData G) (A : Rep ℤ G)
    (K L : ClosedSubgroup G) (hLK : L.toSubgroup ≤ K.toSubgroup)
    [hLnormal : (extensionSubgroup K L hLK).Normal]
    (k : K.toSubgroup)
    (a : ambientFixedAddSubgroup A (D.maximalUnramifiedField L)) :
    D.frobeniusQuotientAction A K L hLK (QuotientGroup.mk k) a =
      normalExtensionAction A K (D.maximalUnramifiedField L)
        (D.maximalUnramifiedField_le_of_le hLK)
        (D.extensionSubgroup_maximalUnramifiedField_normal K L hLK) k a :=
  rfl

private def inertiaConjugationEquiv (D : DegreeData G) (K : ClosedSubgroup G)
    (k : K.toSubgroup) :
    (D.maximalUnramifiedField K).toSubgroup ≃
      (D.maximalUnramifiedField K).toSubgroup where
  toFun x := ⟨k.1⁻¹ * x.1 * k.1, ⟨by
    exact K.toSubgroup.mul_mem
      (K.toSubgroup.mul_mem (K.toSubgroup.inv_mem k.2) x.2.1) k.2, by
    change D.degree (k.1⁻¹ * x.1 * k.1) = 1
    have hx : D.degree x.1 = 1 := x.2.2
    rw [map_mul, map_mul, map_inv, hx]
    simp⟩⟩
  invFun x := ⟨k.1 * x.1 * k.1⁻¹, ⟨by
    exact K.toSubgroup.mul_mem
      (K.toSubgroup.mul_mem k.2 x.2.1) (K.toSubgroup.inv_mem k.2), by
    change D.degree (k.1 * x.1 * k.1⁻¹) = 1
    have hx : D.degree x.1 = 1 := x.2.2
    rw [map_mul, map_mul, map_inv, hx]
    simp⟩⟩
  left_inv x := by
    apply Subtype.ext
    simp [mul_assoc]
  right_inv x := by
    apply Subtype.ext
    simp [mul_assoc]
 
private theorem conjugate_mem_maximalUnramifiedField (D : DegreeData G)
    (K L : ClosedSubgroup G) (hLK : L.toSubgroup ≤ K.toSubgroup)
    [hLnormal : (extensionSubgroup K L hLK).Normal]
    (k : K.toSubgroup) (l : (D.maximalUnramifiedField L).toSubgroup) :
    k.1⁻¹ * l.1 * k.1 ∈ (D.maximalUnramifiedField L).toSubgroup := by
  let lK : K.toSubgroup := ⟨l.1, hLK l.2.1⟩
  have hcK : k⁻¹ * lK * k ∈ extensionSubgroup K L hLK := by
    simpa [lK] using hLnormal.conj_mem lK l.2.1 k⁻¹
  refine ⟨?_, ?_⟩
  · exact hcK
  · change D.degree (k.1⁻¹ * l.1 * k.1) = 1
    have hlDegree : D.degree l.1 = 1 := l.2.2
    rw [map_mul, map_mul, map_inv, hlDegree]
    simp

private noncomputable def inertiaConjugationCosetEquiv (D : DegreeData G)
    (K L : ClosedSubgroup G) (hLK : L.toSubgroup ≤ K.toSubgroup)
    [hLnormal : (extensionSubgroup K L hLK).Normal]
    (k : K.toSubgroup) :
    ((D.maximalUnramifiedField K).toSubgroup ⧸
        extensionSubgroup (D.maximalUnramifiedField K)
          (D.maximalUnramifiedField L)
          (D.maximalUnramifiedField_mono hLK)) ≃
      ((D.maximalUnramifiedField K).toSubgroup ⧸
        extensionSubgroup (D.maximalUnramifiedField K)
          (D.maximalUnramifiedField L)
          (D.maximalUnramifiedField_mono hLK)) :=
  Quotient.congr (D.inertiaConjugationEquiv K k) (by
    intro x y
    rw [QuotientGroup.leftRel_apply, QuotientGroup.leftRel_apply]
    constructor
    · intro hxy
      let l : (D.maximalUnramifiedField L).toSubgroup :=
        ⟨x.1⁻¹ * y.1, hxy⟩
      have hl := D.conjugate_mem_maximalUnramifiedField K L hLK k l
      change (k.1⁻¹ * x.1 * k.1)⁻¹ * (k.1⁻¹ * y.1 * k.1) ∈
        (D.maximalUnramifiedField L).toSubgroup
      simpa [l, mul_assoc] using hl
    · intro hxy
      let l : (D.maximalUnramifiedField L).toSubgroup :=
        ⟨(k.1⁻¹ * x.1 * k.1)⁻¹ * (k.1⁻¹ * y.1 * k.1), hxy⟩
      have hl := D.conjugate_mem_maximalUnramifiedField K L hLK k⁻¹ l
      change x.1⁻¹ * y.1 ∈ (D.maximalUnramifiedField L).toSubgroup
      simpa [l, mul_assoc] using hl)
@[simp]
private theorem inertiaConjugationCosetEquiv_mk (D : DegreeData G)
    (K L : ClosedSubgroup G) (hLK : L.toSubgroup ≤ K.toSubgroup)
    [hLnormal : (extensionSubgroup K L hLK).Normal]
    (k : K.toSubgroup) (x : (D.maximalUnramifiedField K).toSubgroup) :
    D.inertiaConjugationCosetEquiv K L hLK k (QuotientGroup.mk x) =
      QuotientGroup.mk (D.inertiaConjugationEquiv K k x) :=
  rfl
private theorem relativeCosetAction_inertiaConjugation (D : DegreeData G)
    (A : Rep ℤ G)
    (K L : ClosedSubgroup G) (hLK : L.toSubgroup ≤ K.toSubgroup)
    [hLnormal : (extensionSubgroup K L hLK).Normal]
    (k : K.toSubgroup)
    (a : ambientFixedAddSubgroup A (D.maximalUnramifiedField L))
    (r : (D.maximalUnramifiedField K).toSubgroup ⧸
      extensionSubgroup (D.maximalUnramifiedField K)
        (D.maximalUnramifiedField L)
        (D.maximalUnramifiedField_mono hLK)) :
    relativeCosetAction A (D.maximalUnramifiedField K)
        (D.maximalUnramifiedField L) (D.maximalUnramifiedField_mono hLK)
        (normalExtensionAction A K (D.maximalUnramifiedField L)
          (D.maximalUnramifiedField_le_of_le hLK)
          (D.extensionSubgroup_maximalUnramifiedField_normal K L hLK) k a) r =
      A.ρ k.1
        (relativeCosetAction A (D.maximalUnramifiedField K)
          (D.maximalUnramifiedField L) (D.maximalUnramifiedField_mono hLK)
          a (D.inertiaConjugationCosetEquiv K L hLK k r)) := by
  refine Quotient.inductionOn' r ?_
  intro x
  rw [relativeCosetAction_mk, D.inertiaConjugationCosetEquiv_mk,
    relativeCosetAction_mk, normalExtensionAction_coe]
  calc
    A.ρ x.1 (A.ρ k.1 a.1) = A.ρ (x.1 * k.1) a.1 := by
      rw [map_mul]
      rfl
    _ = A.ρ (k.1 * (k.1⁻¹ * x.1 * k.1)) a.1 := by
      simp [mul_assoc]
    _ = A.ρ k.1 (A.ρ (k.1⁻¹ * x.1 * k.1) a.1) := by
      rw [map_mul]
      rfl

private theorem relativeNorm_normalizingAction (D : DegreeData G) (A : Rep ℤ G)
    (K L : ClosedSubgroup G) (hLK : L.toSubgroup ≤ K.toSubgroup)
    [hLnormal : (extensionSubgroup K L hLK).Normal]
    [Finite ((D.maximalUnramifiedField K).toSubgroup ⧸
      extensionSubgroup (D.maximalUnramifiedField K)
        (D.maximalUnramifiedField L)
        (D.maximalUnramifiedField_mono hLK))]
    (k : K.toSubgroup)
    (a : ambientFixedAddSubgroup A (D.maximalUnramifiedField L)) :
    ((relativeNorm A (D.maximalUnramifiedField K)
      (D.maximalUnramifiedField L) (D.maximalUnramifiedField_mono hLK)
      (normalExtensionAction A K (D.maximalUnramifiedField L)
        (D.maximalUnramifiedField_le_of_le hLK)
        (D.extensionSubgroup_maximalUnramifiedField_normal K L hLK) k a) :
      ambientFixedAddSubgroup A (D.maximalUnramifiedField K)) : A.V) =
      A.ρ k.1
        ((relativeNorm A (D.maximalUnramifiedField K)
          (D.maximalUnramifiedField L) (D.maximalUnramifiedField_mono hLK) a :
          ambientFixedAddSubgroup A (D.maximalUnramifiedField K)) : A.V) := by
  let R := (D.maximalUnramifiedField K).toSubgroup ⧸
    extensionSubgroup (D.maximalUnramifiedField K)
      (D.maximalUnramifiedField L) (D.maximalUnramifiedField_mono hLK)
  let e := D.inertiaConjugationCosetEquiv K L hLK k
  let := Fintype.ofFinite R
  simp only [relativeNorm_apply_coe, relativeNormValue]
  calc
    ∑ r : R, relativeCosetAction A (D.maximalUnramifiedField K)
        (D.maximalUnramifiedField L) (D.maximalUnramifiedField_mono hLK)
        (normalExtensionAction A K (D.maximalUnramifiedField L)
          (D.maximalUnramifiedField_le_of_le hLK)
          (D.extensionSubgroup_maximalUnramifiedField_normal K L hLK) k a) r =
      ∑ r : R, A.ρ k.1
        (relativeCosetAction A (D.maximalUnramifiedField K)
          (D.maximalUnramifiedField L) (D.maximalUnramifiedField_mono hLK)
          a (e r)) := by
      apply Finset.sum_congr rfl
      intro r _
      exact D.relativeCosetAction_inertiaConjugation A K L hLK k a r
    _ = A.ρ k.1
        (∑ r : R, relativeCosetAction A (D.maximalUnramifiedField K)
          (D.maximalUnramifiedField L) (D.maximalUnramifiedField_mono hLK)
          a (e r)) := by
      rw [map_sum]
    _ = A.ρ k.1
        (∑ r : R, relativeCosetAction A (D.maximalUnramifiedField K)
          (D.maximalUnramifiedField L) (D.maximalUnramifiedField_mono hLK)
          a r) := by
      rw [e.sum_comp]

theorem relativeNorm_frobeniusQuotientAction (D : DegreeData G)
    (A : Rep ℤ G)
    (K L : ClosedSubgroup G) (hLK : L.toSubgroup ≤ K.toSubgroup)
    [hLnormal : (extensionSubgroup K L hLK).Normal]
    [Finite ((D.maximalUnramifiedField K).toSubgroup ⧸
      extensionSubgroup (D.maximalUnramifiedField K)
        (D.maximalUnramifiedField L)
        (D.maximalUnramifiedField_mono hLK))]
    (q : K.toSubgroup ⧸ D.extensionInertiaWithin K L hLK)
    (a : ambientFixedAddSubgroup A (D.maximalUnramifiedField L)) :
    ((relativeNorm A (D.maximalUnramifiedField K)
      (D.maximalUnramifiedField L) (D.maximalUnramifiedField_mono hLK)
      (D.frobeniusQuotientAction A K L hLK q a) :
      ambientFixedAddSubgroup A (D.maximalUnramifiedField K)) : A.V) =
      ((D.frobeniusQuotientAction A K L hLK q
        (fixedFieldInclusion A (D.maximalUnramifiedField K)
          (D.maximalUnramifiedField L) (D.maximalUnramifiedField_mono hLK)
          (relativeNorm A (D.maximalUnramifiedField K)
            (D.maximalUnramifiedField L) (D.maximalUnramifiedField_mono hLK)
            a)) : ambientFixedAddSubgroup A (D.maximalUnramifiedField L)) :
        A.V) := by
  let k : K.toSubgroup := Quotient.out q
  have hq : q = QuotientGroup.mk k := (Quotient.out_eq' q).symm
  rw [hq]
  exact D.relativeNorm_normalizingAction A K L hLK k a
 
def frobeniusPowerSum (D : DegreeData G) (A : Rep ℤ G)
    (K L : ClosedSubgroup G) (hLK : L.toSubgroup ≤ K.toSubgroup)
    [hLnormal : (extensionSubgroup K L hLK).Normal]
    (φ : K.toSubgroup ⧸ D.extensionInertiaWithin K L hLK)
    (n : ℕ)
    (a : ambientFixedAddSubgroup A (D.maximalUnramifiedField L)) :
    ambientFixedAddSubgroup A (D.maximalUnramifiedField L) :=
  ∑ i : Fin n, D.frobeniusQuotientAction A K L hLK (φ ^ i.1) a

@[simp]
theorem frobeniusPowerSum_coe (D : DegreeData G) (A : Rep ℤ G)
    (K L : ClosedSubgroup G) (hLK : L.toSubgroup ≤ K.toSubgroup)
    [hLnormal : (extensionSubgroup K L hLK).Normal]
    (φ : K.toSubgroup ⧸ D.extensionInertiaWithin K L hLK)
    (n : ℕ)
    (a : ambientFixedAddSubgroup A (D.maximalUnramifiedField L)) :
    ((D.frobeniusPowerSum A K L hLK φ n a :
      ambientFixedAddSubgroup A (D.maximalUnramifiedField L)) : A.V) =
      ∑ i : Fin n,
        (D.frobeniusQuotientAction A K L hLK (φ ^ i.1) a : A.V) :=
  by
    change (ambientFixedAddSubgroup A
        (D.maximalUnramifiedField L)).subtype
      (∑ i : Fin n,
        D.frobeniusQuotientAction A K L hLK (φ ^ i.1) a) = _
    rw [map_sum]
    apply Finset.sum_congr rfl
    intro i _
    rfl
end DegreeData
end quotientActions
section frobeniusCosetEquivalences
variable {G : Type u} [Group G] [TopologicalSpace G]
namespace DegreeData

private noncomputable def frobeniusFixedCosetToClosureCoset
    (D : DegreeData G) [IsTopologicalGroup G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (σ : D.FrobeniusElements K L hLK) :
    (K.field.toSubgroup ⧸
        extensionSubgroup K.field (D.frobeniusFixedField K L hLK σ)
          (D.frobeniusFixedField_le K L hLK σ)) →
      ((K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK) ⧸
        (D.frobeniusClosure K L hLK σ).toSubgroup) :=
  Quotient.map'
    (QuotientGroup.mk' (D.extensionInertiaWithin K.field L hLK))
    (by
      intro x y hxy
      rw [QuotientGroup.leftRel_apply] at hxy ⊢
      rw [D.extensionSubgroup_frobeniusFixedField K L hLK σ] at hxy
      exact hxy)
private theorem frobeniusFixedCosetToClosureCoset_bijective
    (D : DegreeData G) [IsTopologicalGroup G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (σ : D.FrobeniusElements K L hLK) :
    Function.Bijective
      (D.frobeniusFixedCosetToClosureCoset K L hLK σ) := by
  constructor
  · intro x y hxy
    refine Quotient.inductionOn₂' x y ?_ hxy
    intro a b hab
    apply Quotient.sound'
    rw [QuotientGroup.leftRel_apply]
    rw [D.extensionSubgroup_frobeniusFixedField K L hLK σ]
    have hrel := QuotientGroup.leftRel_apply.mp (Quotient.exact' hab)
    exact hrel
  · intro z
    refine Quotient.inductionOn' z ?_
    intro q
    obtain ⟨k, hk⟩ := QuotientGroup.mk'_surjective
      (D.extensionInertiaWithin K.field L hLK) q
    refine ⟨QuotientGroup.mk k, ?_⟩
    change QuotientGroup.mk
        ((QuotientGroup.mk' (D.extensionInertiaWithin K.field L hLK)) k) =
      QuotientGroup.mk q
    rw [hk]
 
noncomputable def frobeniusFixedCosetClosureEquiv
    (D : DegreeData G) [IsTopologicalGroup G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (σ : D.FrobeniusElements K L hLK) :
    (K.field.toSubgroup ⧸
        extensionSubgroup K.field (D.frobeniusFixedField K L hLK σ)
          (D.frobeniusFixedField_le K L hLK σ)) ≃
      ((K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK) ⧸
        (D.frobeniusClosure K L hLK σ).toSubgroup) :=
  Equiv.ofBijective
    (D.frobeniusFixedCosetToClosureCoset K L hLK σ)
    (D.frobeniusFixedCosetToClosureCoset_bijective K L hLK σ)
 
private theorem frobeniusClosure_inf_degreeKernel (D : DegreeData G)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    [TotallyDisconnectedSpace G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (σ : D.FrobeniusElements K L hLK) :
    (D.frobeniusClosure K L hLK σ).toSubgroup ⊓
        (D.extensionNormalizedDegreeContinuous K L hLK).toMonoidHom.ker =
      ⊥ := by
  ext q
  constructor
  · intro hq
    let a : D.frobeniusClosure K L hLK σ := ⟨q, hq.1⟩
    have hclosure : D.frobeniusClosureDegree K L hLK σ a = 1 := hq.2
    have hfixed : D.fixedFieldNormalizedDegree K L hLK σ a = 1 := by
      apply Multiplicative.ext
      apply zHatMulNat_injective
        (D.frobeniusExponent_pos K L hLK σ)
      change D.frobeniusExponent K L hLK σ •
          (D.fixedFieldNormalizedDegree K L hLK σ a).toAdd =
        D.frobeniusExponent K L hLK σ • (1 : ZHatMul).toAdd
      rw [D.frobeniusExponent_nsmul_fixedFieldNormalizedDegree]
      rw [hclosure]
      simp
    have ha : a = 1 :=
      D.frobeniusFixedField_normalizedDegree_injective K L hLK σ (by
        simpa using hfixed)
    exact congrArg Subtype.val ha
  · intro hq
    have : q = 1 := hq
    subst q
    exact ⟨Subgroup.one_mem _, Subgroup.one_mem _⟩

private def kernelPowerCosetMap (D : DegreeData G) [IsTopologicalGroup G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (φ σ : D.FrobeniusElements K L hLK) :
    (D.extensionNormalizedDegreeContinuous K L hLK).toMonoidHom.ker ×
        Fin (D.frobeniusExponent K L hLK σ) →
      ((K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK) ⧸
        (D.frobeniusClosure K L hLK σ).toSubgroup) :=
  fun p => QuotientGroup.mk (φ.1 ^ p.2.1 * p.1.1)
private theorem kernelPowerCosetMap_injective (D : DegreeData G)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    [TotallyDisconnectedSpace G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (φ σ : D.FrobeniusElements K L hLK)
    (hφ : D.frobeniusExponent K L hLK φ = 1) :
    Function.Injective (D.kernelPowerCosetMap K L hLK φ σ) := by
  rintro ⟨h, i⟩ ⟨h', j⟩ hij
  let n := D.frobeniusExponent K L hLK σ
  let dQ := D.extensionNormalizedDegreeContinuous K L hLK
  have hn : 0 < n := D.frobeniusExponent_pos K L hLK σ
  have hdφ : dQ φ.1 =
      Multiplicative.ofAdd (1 : ZHat) := by
    change D.extensionNormalizedDegree K L hLK φ.1 = _
    rw [D.extensionNormalizedDegree_frobenius_eq_pow K L hLK φ, hφ]
    simp
  have hrel : (φ.1 ^ i.1 * h.1)⁻¹ * (φ.1 ^ j.1 * h'.1) ∈
      (D.frobeniusClosure K L hLK σ).toSubgroup :=
    QuotientGroup.leftRel_apply.mp (Quotient.exact' hij)
  let γ : D.frobeniusClosure K L hLK σ :=
    ⟨(φ.1 ^ i.1 * h.1)⁻¹ * (φ.1 ^ j.1 * h'.1), hrel⟩
  have hdegreeRange :
      (D.frobeniusClosureDegree K L hLK σ γ).toAdd ∈
        (zHatMulNat n).toAddMonoidHom.range := by
    have hmem : D.frobeniusClosureDegree K L hLK σ γ ∈
        (D.frobeniusClosureDegree K L hLK σ).toMonoidHom.range :=
      ⟨γ, rfl⟩
    rw [D.frobeniusClosureDegree_range K L hLK σ] at hmem
    exact hmem
  have hred : zHatReduction n hn
      (D.frobeniusClosureDegree K L hLK σ γ).toAdd = 0 := by
    have hker :
        (D.frobeniusClosureDegree K L hLK σ γ).toAdd ∈
          (zHatReduction n hn).ker := by
      rw [← zHatMulNat_range_eq_ker_reduction n hn]
      exact hdegreeRange
    exact hker
  have hredOne : zHatReduction n hn (1 : ZHat) = 1 := rfl
  have hmod : (j.1 : ZMod n) - (i.1 : ZMod n) = 0 := by
    have hdh : dQ h.1 = 1 := h.2
    have hdh' : dQ h'.1 = 1 := h'.2
    have hdegMul :
        dQ ((φ.1 ^ i.1 * h.1)⁻¹ * (φ.1 ^ j.1 * h'.1)) =
          (Multiplicative.ofAdd (1 : ZHat) ^ i.1)⁻¹ *
            Multiplicative.ofAdd (1 : ZHat) ^ j.1 := by
      rw [map_mul, map_inv, map_mul, map_mul, map_pow, map_pow,
        hdφ, hdh, hdh', mul_one, mul_one]
    have hdegAdd := congrArg Multiplicative.toAdd hdegMul
    change (D.frobeniusClosureDegree K L hLK σ γ).toAdd =
      -(i.1 • (1 : ZHat)) + j.1 • (1 : ZHat) at hdegAdd
    rw [hdegAdd] at hred
    rw [map_add, map_neg, map_nsmul, map_nsmul, hredOne] at hred
    simpa [sub_eq_add_neg, add_comm] using hred
  have hijCast : (i.1 : ZMod n) = (j.1 : ZMod n) := by
    exact (sub_eq_zero.mp hmod).symm
  have hijVal : i.1 = j.1 := by
    have hv := congrArg ZMod.val hijCast
    simpa [ZMod.val_natCast_of_lt i.2, ZMod.val_natCast_of_lt j.2] using hv
  have hijFin : i = j := Fin.ext hijVal
  subst j
  have hkernel : h.1⁻¹ * h'.1 ∈ dQ.toMonoidHom.ker := by
    have hdh : dQ h.1 = 1 := h.2
    have hdh' : dQ h'.1 = 1 := h'.2
    change dQ (h.1⁻¹ * h'.1) = 1
    rw [map_mul, map_inv, hdh, hdh', inv_one, one_mul]
  have hgamma : h.1⁻¹ * h'.1 ∈
      (D.frobeniusClosure K L hLK σ).toSubgroup := by
    simpa [mul_assoc] using hrel
  have hone : h.1⁻¹ * h'.1 = 1 := by
    have hm : h.1⁻¹ * h'.1 ∈ (⊥ : Subgroup
        (K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK)) := by
      rw [← D.frobeniusClosure_inf_degreeKernel K L hLK σ]
      exact ⟨hgamma, hkernel⟩
    exact hm
  have hh : h = h' := by
    apply Subtype.ext
    exact inv_mul_eq_one.mp hone
  subst h'
  rfl
private theorem kernelPowerCosetMap_bijective (D : DegreeData G)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    [TotallyDisconnectedSpace G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    [hLfinite : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK)]
    (φ σ : D.FrobeniusElements K L hLK)
    (hφ : D.frobeniusExponent K L hLK φ = 1) :
    Function.Bijective (D.kernelPowerCosetMap K L hLK φ σ) := by
  let Q := K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK
  let dQ := D.extensionNormalizedDegreeContinuous K L hLK
  let H : Subgroup Q := dQ.toMonoidHom.ker
  let Γ : Subgroup Q := (D.frobeniusClosure K L hLK σ).toSubgroup
  let n := D.frobeniusExponent K L hLK σ
  let j := D.extensionDegreeKernelRestriction K L hLK
  let : Finite H :=
    Finite.of_injective j
      (D.extensionDegreeKernelRestriction_injective K L hLK)
  let : Finite (Q ⧸ Γ) := by
    simpa [Q, Γ] using D.frobeniusFixedField_finiteIndex K L hLK σ
  have hΓmap : Γ.map dQ.toMonoidHom =
      (D.frobeniusClosureDegree K L hLK σ).toMonoidHom.range := by
    ext z
    constructor
    · rintro ⟨q, hq, rfl⟩
      exact ⟨⟨q, hq⟩, rfl⟩
    · rintro ⟨q, rfl⟩
      exact ⟨q.1, q.2, rfl⟩
  have htopmap : (⊤ : Subgroup Q).map dQ.toMonoidHom = ⊤ := by
    apply top_unique
    intro z _
    obtain ⟨q, hq⟩ :=
      D.extensionNormalizedDegreeContinuous_surjective K L hLK z
    exact ⟨q, trivial, hq⟩
  have himage : (Γ.map dQ.toMonoidHom).relIndex
      ((⊤ : Subgroup Q).map dQ.toMonoidHom) = n := by
    rw [hΓmap, htopmap, Subgroup.relIndex_top_right,
      D.frobeniusClosureDegree_range K L hLK σ,
      AddSubgroup.index_toSubgroup,
      zHatMulNat_range_index _
        (D.frobeniusExponent_pos K L hLK σ)]
  have hkernel : (Γ ⊓ dQ.toMonoidHom.ker).relIndex
      ((⊤ : Subgroup Q) ⊓ dQ.toMonoidHom.ker) = Nat.card H := by
    rw [show Γ ⊓ dQ.toMonoidHom.ker = ⊥ by
      simpa [Γ, dQ, Q] using
        D.frobeniusClosure_inf_degreeKernel K L hLK σ]
    rw [top_inf_eq]
    change (⊥ : Subgroup Q).relIndex H = Nat.card H
    rw [Subgroup.relIndex_bot_left]
  have hindex : Γ.index = n * Nat.card H := by
    rw [← Subgroup.relIndex_top_right]
    rw [relIndex_eq_map_relIndex_mul_inf_ker_relIndex dQ.toMonoidHom le_top,
      himage, hkernel]
  have hcard :
      Nat.card (H × Fin n) = Nat.card (Q ⧸ Γ) := by
    calc
      Nat.card (H × Fin n) =
          Nat.card H * Nat.card (Fin n) := Nat.card_prod _ _
      _ = Nat.card H * n := by
        have hfin : Nat.card (Fin n) = n := by
          calc
            Nat.card (Fin n) = Fintype.card (Fin n) :=
              Nat.card_eq_fintype_card
            _ = n := Fintype.card_fin n
        rw [hfin]
      _ = n * Nat.card H := Nat.mul_comm _ _
      _ = Γ.index := hindex.symm
      _ = Nat.card (Q ⧸ Γ) := Subgroup.index_eq_card Γ
  apply (Nat.bijective_iff_injective_and_card
    (D.kernelPowerCosetMap K L hLK φ σ)).2
  exact ⟨D.kernelPowerCosetMap_injective K L hLK φ σ hφ,
    by simpa [H, n, Q, Γ, dQ] using hcard⟩
 
noncomputable def kernelPowerCosetEquiv (D : DegreeData G)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    [TotallyDisconnectedSpace G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    [hLfinite : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK)]
    (φ σ : D.FrobeniusElements K L hLK)
    (hφ : D.frobeniusExponent K L hLK φ = 1) :
    (D.extensionNormalizedDegreeContinuous K L hLK).toMonoidHom.ker ×
        Fin (D.frobeniusExponent K L hLK σ) ≃
      ((K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK) ⧸
        (D.frobeniusClosure K L hLK σ).toSubgroup) :=
  Equiv.ofBijective (D.kernelPowerCosetMap K L hLK φ σ)
    (D.kernelPowerCosetMap_bijective K L hLK φ σ hφ)

private noncomputable def frobeniusNormIdentityCosetMap (D : DegreeData G)
    [IsTopologicalGroup G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (φ σ : D.FrobeniusElements K L hLK) :
    ((D.maximalUnramifiedField K.field).toSubgroup ⧸
        extensionSubgroup (D.maximalUnramifiedField K.field)
          (D.maximalUnramifiedField L)
          (D.maximalUnramifiedField_mono hLK)) ×
        Fin (D.frobeniusExponent K L hLK σ) →
      (K.field.toSubgroup ⧸
        extensionSubgroup K.field (D.frobeniusFixedField K L hLK σ)
          (D.frobeniusFixedField_le K L hLK σ)) :=
  fun p =>
    let kφ : K.field.toSubgroup := Quotient.out (φ.1 ^ p.2.1)
    let kI : (D.maximalUnramifiedField K.field).toSubgroup := Quotient.out p.1
    QuotientGroup.mk (kφ * (⟨kI.1, kI.2.1⟩ : K.field.toSubgroup))
private theorem frobeniusNormIdentityCosetMap_commutes (D : DegreeData G)
    [IsTopologicalGroup G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (φ σ : D.FrobeniusElements K L hLK)
    (p : ((D.maximalUnramifiedField K.field).toSubgroup ⧸
        extensionSubgroup (D.maximalUnramifiedField K.field)
          (D.maximalUnramifiedField L)
          (D.maximalUnramifiedField_mono hLK)) ×
      Fin (D.frobeniusExponent K L hLK σ)) :
    D.frobeniusFixedCosetToClosureCoset K L hLK σ
        (D.frobeniusNormIdentityCosetMap K L hLK φ σ p) =
      D.kernelPowerCosetMap K L hLK φ σ
        (D.inertiaQuotientDegreeKernelEquiv K L hLK p.1, p.2) := by
  let kφ : K.field.toSubgroup := Quotient.out (φ.1 ^ p.2.1)
  let kI : (D.maximalUnramifiedField K.field).toSubgroup := Quotient.out p.1
  let kIK : K.field.toSubgroup := ⟨kI.1, kI.2.1⟩
  have hkφ : (QuotientGroup.mk'
      (D.extensionInertiaWithin K.field L hLK)) kφ = φ.1 ^ p.2.1 :=
    Quotient.out_eq' (φ.1 ^ p.2.1)
  have hkI :
      (D.inertiaQuotientDegreeKernelEquiv K L hLK p.1).1 =
        (QuotientGroup.mk' (D.extensionInertiaWithin K.field L hLK)) kIK := by
    change (D.inertiaCosetToDegreeKernel K L hLK p.1).1 = _
    calc
      (D.inertiaCosetToDegreeKernel K L hLK p.1).1 =
          (D.inertiaCosetToDegreeKernel K L hLK
            (QuotientGroup.mk kI)).1 := by
        exact congrArg
          (fun r => (D.inertiaCosetToDegreeKernel K L hLK r).1)
          (Quotient.out_eq' p.1).symm
      _ = _ := rfl
  change QuotientGroup.mk
      ((QuotientGroup.mk' (D.extensionInertiaWithin K.field L hLK))
        (kφ * kIK)) =
    QuotientGroup.mk
      (φ.1 ^ p.2.1 *
        (D.inertiaQuotientDegreeKernelEquiv K L hLK p.1).1)
  rw [map_mul, hkφ, hkI]
private theorem frobeniusNormIdentityCosetMap_bijective (D : DegreeData G)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    [TotallyDisconnectedSpace G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    [hLfinite : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK)]
    (φ σ : D.FrobeniusElements K L hLK)
    (hφ : D.frobeniusExponent K L hLK φ = 1) :
    Function.Bijective (D.frobeniusNormIdentityCosetMap K L hLK φ σ) := by
  let eI := D.inertiaQuotientDegreeKernelEquiv K L hLK
  let eP := D.kernelPowerCosetEquiv K L hLK φ σ hφ
  let eSigma := D.frobeniusFixedCosetClosureEquiv K L hLK σ
  have hinj : Function.Injective (D.frobeniusNormIdentityCosetMap K L hLK φ σ) := by
    intro p q hpq
    apply (Equiv.prodCongr eI (Equiv.refl _)).injective
    apply eP.injective
    calc
      eP (eI p.1, p.2) =
          eSigma (D.frobeniusNormIdentityCosetMap K L hLK φ σ p) :=
        (D.frobeniusNormIdentityCosetMap_commutes K L hLK φ σ p).symm
      _ = eSigma (D.frobeniusNormIdentityCosetMap K L hLK φ σ q) :=
        congrArg eSigma hpq
      _ = eP (eI q.1, q.2) :=
        D.frobeniusNormIdentityCosetMap_commutes K L hLK φ σ q
  have hsurj : Function.Surjective (D.frobeniusNormIdentityCosetMap K L hLK φ σ) := by
    intro q
    obtain ⟨p, hp⟩ := eP.surjective (eSigma q)
    obtain ⟨r, hr⟩ := (Equiv.prodCongr eI (Equiv.refl _)).surjective p
    refine ⟨r, ?_⟩
    apply eSigma.injective
    calc
      eSigma (D.frobeniusNormIdentityCosetMap K L hLK φ σ r) =
          eP (eI r.1, r.2) :=
        D.frobeniusNormIdentityCosetMap_commutes K L hLK φ σ r
      _ = eP p := by
        apply congrArg eP
        exact hr
      _ = eSigma q := hp
  exact ⟨hinj, hsurj⟩
 
noncomputable def frobeniusNormIdentityCosetEquiv (D : DegreeData G)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    [TotallyDisconnectedSpace G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    [hLfinite : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK)]
    (φ σ : D.FrobeniusElements K L hLK)
    (hφ : D.frobeniusExponent K L hLK φ = 1) :
    ((D.maximalUnramifiedField K.field).toSubgroup ⧸
        extensionSubgroup (D.maximalUnramifiedField K.field)
          (D.maximalUnramifiedField L)
          (D.maximalUnramifiedField_mono hLK)) ×
        Fin (D.frobeniusExponent K L hLK σ) ≃
      (K.field.toSubgroup ⧸
        extensionSubgroup K.field (D.frobeniusFixedField K L hLK σ)
          (D.frobeniusFixedField_le K L hLK σ)) :=
  Equiv.ofBijective (D.frobeniusNormIdentityCosetMap K L hLK φ σ)
    (D.frobeniusNormIdentityCosetMap_bijective K L hLK φ σ hφ)
end DegreeData
end frobeniusCosetEquivalences
section frobeniusNormIdentities
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
namespace DegreeData
private theorem relativeCosetAction_frobeniusNormIdentityCosetEquiv
    (D : DegreeData G) (A : Rep ℤ G)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    [TotallyDisconnectedSpace G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    [hLfinite : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK)]
    (φ σ : D.FrobeniusElements K L hLK)
    (hφ : D.frobeniusExponent K L hLK φ = 1)
    (a : ambientFixedAddSubgroup A
      (D.frobeniusFixedField K L hLK σ))
    (r : (D.maximalUnramifiedField K.field).toSubgroup ⧸
      extensionSubgroup (D.maximalUnramifiedField K.field)
        (D.maximalUnramifiedField L)
        (D.maximalUnramifiedField_mono hLK))
    (i : Fin (D.frobeniusExponent K L hLK σ)) :
    relativeCosetAction A K.field (D.frobeniusFixedField K L hLK σ)
        (D.frobeniusFixedField_le K L hLK σ) a
        (D.frobeniusNormIdentityCosetEquiv K L hLK φ σ hφ (r, i)) =
      A.ρ (Quotient.out (φ.1 ^ i.1)).1
        (relativeCosetAction A (D.maximalUnramifiedField K.field)
          (D.maximalUnramifiedField L)
          (D.maximalUnramifiedField_mono hLK)
          (fixedFieldInclusion A
            (D.frobeniusFixedField K L hLK σ)
            (D.maximalUnramifiedField L)
            (D.fieldInertia_le_frobeniusFixedField K L hLK σ) a) r) := by
  let kφ : K.field.toSubgroup := Quotient.out (φ.1 ^ i.1)
  let kI : (D.maximalUnramifiedField K.field).toSubgroup := Quotient.out r
  let kIK : K.field.toSubgroup := ⟨kI.1, kI.2.1⟩
  change relativeCosetAction A K.field
      (D.frobeniusFixedField K L hLK σ)
      (D.frobeniusFixedField_le K L hLK σ) a
      (QuotientGroup.mk (kφ * kIK)) = _
  rw [relativeCosetAction_mk]
  have hr : r = QuotientGroup.mk kI := (Quotient.out_eq' r).symm
  rw [hr, relativeCosetAction_mk]
  change A.ρ (kφ.1 * kI.1) a.1 = A.ρ kφ.1 (A.ρ kI.1 a.1)
  rw [map_mul]
  rfl
private theorem frobeniusQuotientAction_relativeNorm (D : DegreeData G)
    (A : Rep ℤ G)
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    [hInertiaFintype : Fintype
      ((D.maximalUnramifiedField K.field).toSubgroup ⧸
        extensionSubgroup (D.maximalUnramifiedField K.field)
          (D.maximalUnramifiedField L)
          (D.maximalUnramifiedField_mono hLK))]
    (φ : D.FrobeniusElements K L hLK)
    (a : ambientFixedAddSubgroup A (D.maximalUnramifiedField L))
    (i : ℕ) :
    ((D.frobeniusQuotientAction A K.field L hLK (φ.1 ^ i)
      (fixedFieldInclusion A (D.maximalUnramifiedField K.field)
        (D.maximalUnramifiedField L)
        (D.maximalUnramifiedField_mono hLK)
        (relativeNorm A (D.maximalUnramifiedField K.field)
          (D.maximalUnramifiedField L)
          (D.maximalUnramifiedField_mono hLK) a)) :
        ambientFixedAddSubgroup A (D.maximalUnramifiedField L)) : A.V) =
      (@Finset.univ
        ((D.maximalUnramifiedField K.field).toSubgroup ⧸
          extensionSubgroup (D.maximalUnramifiedField K.field)
            (D.maximalUnramifiedField L)
            (D.maximalUnramifiedField_mono hLK))
        (Fintype.ofFinite _)).sum (fun r =>
          A.ρ (Quotient.out (φ.1 ^ i)).1
            (relativeCosetAction A (D.maximalUnramifiedField K.field)
              (D.maximalUnramifiedField L)
              (D.maximalUnramifiedField_mono hLK) a r)) := by
  let kφ : K.field.toSubgroup := Quotient.out (φ.1 ^ i)
  have hkφ : φ.1 ^ i = QuotientGroup.mk kφ :=
    (Quotient.out_eq' (φ.1 ^ i)).symm
  let b := fixedFieldInclusion A (D.maximalUnramifiedField K.field)
    (D.maximalUnramifiedField L) (D.maximalUnramifiedField_mono hLK)
    (relativeNorm A (D.maximalUnramifiedField K.field)
      (D.maximalUnramifiedField L) (D.maximalUnramifiedField_mono hLK) a)
  calc
    ((D.frobeniusQuotientAction A K.field L hLK (φ.1 ^ i) b :
        ambientFixedAddSubgroup A (D.maximalUnramifiedField L)) : A.V) =
      (D.frobeniusQuotientAction A K.field L hLK
        (QuotientGroup.mk kφ) b : A.V) := by
          exact congrArg
            (fun q => (D.frobeniusQuotientAction A K.field L hLK q b : A.V)) hkφ
    _ = A.ρ kφ.1 b.1 := rfl
    _ = A.ρ kφ.1
        ((relativeNorm A (D.maximalUnramifiedField K.field)
          (D.maximalUnramifiedField L)
          (D.maximalUnramifiedField_mono hLK) a :
            ambientFixedAddSubgroup A (D.maximalUnramifiedField K.field)) : A.V) := by
          rw [fixedFieldInclusion_coe]
    _ = A.ρ kφ.1
        (relativeNormValue A (D.maximalUnramifiedField K.field)
          (D.maximalUnramifiedField L)
          (D.maximalUnramifiedField_mono hLK) a) := by
          rw [relativeNorm_apply_coe]
    _ = A.ρ kφ.1
        ((@Finset.univ
          ((D.maximalUnramifiedField K.field).toSubgroup ⧸
            extensionSubgroup (D.maximalUnramifiedField K.field)
              (D.maximalUnramifiedField L)
              (D.maximalUnramifiedField_mono hLK))
          (Fintype.ofFinite _)).sum (fun r =>
            relativeCosetAction A (D.maximalUnramifiedField K.field)
              (D.maximalUnramifiedField L)
              (D.maximalUnramifiedField_mono hLK) a r)) := by
          rfl
    _ = (@Finset.univ
        ((D.maximalUnramifiedField K.field).toSubgroup ⧸
          extensionSubgroup (D.maximalUnramifiedField K.field)
            (D.maximalUnramifiedField L)
            (D.maximalUnramifiedField_mono hLK))
        (Fintype.ofFinite _)).sum (fun r => A.ρ kφ.1
          (relativeCosetAction A (D.maximalUnramifiedField K.field)
            (D.maximalUnramifiedField L)
            (D.maximalUnramifiedField_mono hLK) a r)) := by
          rw [map_sum]
 
theorem frobeniusNormIdentity_norm_eq_powerSum_norm (D : DegreeData G) (A : Rep ℤ G)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    [TotallyDisconnectedSpace G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    [hLfinite : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK)]
    (φ σ : D.FrobeniusElements K L hLK)
    (hφ : D.frobeniusExponent K L hLK φ = 1)
    (a : ambientFixedAddSubgroup A
      (D.frobeniusFixedField K L hLK σ)) :
    letI : Finite
        (K.field.toSubgroup ⧸
          extensionSubgroup K.field (D.frobeniusFixedField K L hLK σ)
            (D.frobeniusFixedField_le K L hLK σ)) :=
      D.frobeniusFixedField_finite K L hLK σ
    letI : Finite
        ((D.maximalUnramifiedField K.field).toSubgroup ⧸
          extensionSubgroup (D.maximalUnramifiedField K.field)
            (D.maximalUnramifiedField L)
            (D.maximalUnramifiedField_mono hLK)) :=
      D.maximalUnramifiedExtension_finite K.field L hLK
    ((relativeNorm A K.field (D.frobeniusFixedField K L hLK σ)
      (D.frobeniusFixedField_le K L hLK σ) a :
        ambientFixedAddSubgroup A K.field) : A.V) =
      ((D.frobeniusPowerSum A K.field L hLK φ.1
        (D.frobeniusExponent K L hLK σ)
        (fixedFieldInclusion A (D.maximalUnramifiedField K.field)
          (D.maximalUnramifiedField L)
          (D.maximalUnramifiedField_mono hLK)
          (relativeNorm A (D.maximalUnramifiedField K.field)
            (D.maximalUnramifiedField L)
            (D.maximalUnramifiedField_mono hLK)
            (fixedFieldInclusion A
              (D.frobeniusFixedField K L hLK σ)
              (D.maximalUnramifiedField L)
              (D.fieldInertia_le_frobeniusFixedField K L hLK σ) a))) :
          ambientFixedAddSubgroup A (D.maximalUnramifiedField L)) : A.V) := by
  let : Finite
      (K.field.toSubgroup ⧸
        extensionSubgroup K.field (D.frobeniusFixedField K L hLK σ)
          (D.frobeniusFixedField_le K L hLK σ)) :=
    D.frobeniusFixedField_finite K L hLK σ
  let : Finite
      ((D.maximalUnramifiedField K.field).toSubgroup ⧸
        extensionSubgroup (D.maximalUnramifiedField K.field)
          (D.maximalUnramifiedField L)
          (D.maximalUnramifiedField_mono hLK)) :=
    D.maximalUnramifiedExtension_finite K.field L hLK
  let R := (D.maximalUnramifiedField K.field).toSubgroup ⧸
    extensionSubgroup (D.maximalUnramifiedField K.field)
      (D.maximalUnramifiedField L) (D.maximalUnramifiedField_mono hLK)
  let n := D.frobeniusExponent K L hLK σ
  let e := D.frobeniusNormIdentityCosetEquiv K L hLK φ σ hφ
  let aI := fixedFieldInclusion A
    (D.frobeniusFixedField K L hLK σ)
    (D.maximalUnramifiedField L)
    (D.fieldInertia_le_frobeniusFixedField K L hLK σ) a
  let b := fixedFieldInclusion A (D.maximalUnramifiedField K.field)
    (D.maximalUnramifiedField L) (D.maximalUnramifiedField_mono hLK)
    (relativeNorm A (D.maximalUnramifiedField K.field)
      (D.maximalUnramifiedField L) (D.maximalUnramifiedField_mono hLK) aI)
  let := Fintype.ofFinite R
  let := Fintype.ofFinite
    (K.field.toSubgroup ⧸
      extensionSubgroup K.field (D.frobeniusFixedField K L hLK σ)
        (D.frobeniusFixedField_le K L hLK σ))
  rw [relativeNorm_apply_coe, relativeNormValue,
    D.frobeniusPowerSum_coe]
  calc
    ∑ q, relativeCosetAction A K.field
        (D.frobeniusFixedField K L hLK σ)
        (D.frobeniusFixedField_le K L hLK σ) a q =
      ∑ p : R × Fin n,
        relativeCosetAction A K.field
          (D.frobeniusFixedField K L hLK σ)
          (D.frobeniusFixedField_le K L hLK σ) a (e p) :=
      (e.sum_comp _).symm
    _ = ∑ p : R × Fin n,
        A.ρ (Quotient.out (φ.1 ^ p.2.1)).1
          (relativeCosetAction A (D.maximalUnramifiedField K.field)
            (D.maximalUnramifiedField L) (D.maximalUnramifiedField_mono hLK)
            aI p.1) := by
      apply Finset.sum_congr rfl
      intro p _
      exact D.relativeCosetAction_frobeniusNormIdentityCosetEquiv
        A K L hLK φ σ hφ a p.1 p.2
    _ = ∑ i : Fin n, ∑ r : R,
        A.ρ (Quotient.out (φ.1 ^ i.1)).1
          (relativeCosetAction A (D.maximalUnramifiedField K.field)
            (D.maximalUnramifiedField L) (D.maximalUnramifiedField_mono hLK)
            aI r) := by
      rw [Fintype.sum_prod_type]
      exact Finset.sum_comm
    _ = ∑ i : Fin n,
        (D.frobeniusQuotientAction A K.field L hLK (φ.1 ^ i.1) b : A.V) := by
      apply Finset.sum_congr rfl
      intro i _
      exact (D.frobeniusQuotientAction_relativeNorm
        A K L hLK φ aI i.1).symm

theorem frobeniusNormIdentity_norm_powerSum_eq_powerSum_norm (D : DegreeData G)
    (A : Rep ℤ G)
    (K L : ClosedSubgroup G) (hLK : L.toSubgroup ≤ K.toSubgroup)
    [hLnormal : (extensionSubgroup K L hLK).Normal]
    [hLfinite : Finite (K.toSubgroup ⧸ extensionSubgroup K L hLK)]
    (φ : K.toSubgroup ⧸ D.extensionInertiaWithin K L hLK)
    (n : ℕ)
    (a : ambientFixedAddSubgroup A (D.maximalUnramifiedField L)) :
    letI : Finite
        ((D.maximalUnramifiedField K).toSubgroup ⧸
          extensionSubgroup (D.maximalUnramifiedField K)
            (D.maximalUnramifiedField L)
            (D.maximalUnramifiedField_mono hLK)) :=
      D.maximalUnramifiedExtension_finite K L hLK
    ((relativeNorm A (D.maximalUnramifiedField K)
      (D.maximalUnramifiedField L) (D.maximalUnramifiedField_mono hLK)
      (D.frobeniusPowerSum A K L hLK φ n a) :
        ambientFixedAddSubgroup A (D.maximalUnramifiedField K)) : A.V) =
      ((D.frobeniusPowerSum A K L hLK φ n
        (fixedFieldInclusion A (D.maximalUnramifiedField K)
          (D.maximalUnramifiedField L) (D.maximalUnramifiedField_mono hLK)
          (relativeNorm A (D.maximalUnramifiedField K)
            (D.maximalUnramifiedField L) (D.maximalUnramifiedField_mono hLK)
            a)) : ambientFixedAddSubgroup A (D.maximalUnramifiedField L)) :
        A.V) := by
  let : Finite
      ((D.maximalUnramifiedField K).toSubgroup ⧸
        extensionSubgroup (D.maximalUnramifiedField K)
          (D.maximalUnramifiedField L)
          (D.maximalUnramifiedField_mono hLK)) :=
    D.maximalUnramifiedExtension_finite K L hLK
  change
    ((relativeNorm A (D.maximalUnramifiedField K)
      (D.maximalUnramifiedField L) (D.maximalUnramifiedField_mono hLK))
      (∑ i : Fin n, D.frobeniusQuotientAction A K L hLK (φ ^ i.1) a)).1 =
      (∑ i : Fin n, D.frobeniusQuotientAction A K L hLK (φ ^ i.1)
        (fixedFieldInclusion A (D.maximalUnramifiedField K)
          (D.maximalUnramifiedField L) (D.maximalUnramifiedField_mono hLK)
          (relativeNorm A (D.maximalUnramifiedField K)
            (D.maximalUnramifiedField L) (D.maximalUnramifiedField_mono hLK)
            a))).1
  simp only [map_sum]
  change (ambientFixedAddSubgroup A
      (D.maximalUnramifiedField K)).subtype
      (∑ i : Fin n, relativeNorm A (D.maximalUnramifiedField K)
        (D.maximalUnramifiedField L) (D.maximalUnramifiedField_mono hLK)
        (D.frobeniusQuotientAction A K L hLK (φ ^ i.1) a)) =
    (ambientFixedAddSubgroup A
      (D.maximalUnramifiedField L)).subtype
      (∑ i : Fin n, D.frobeniusQuotientAction A K L hLK (φ ^ i.1)
        (fixedFieldInclusion A (D.maximalUnramifiedField K)
          (D.maximalUnramifiedField L) (D.maximalUnramifiedField_mono hLK)
          (relativeNorm A (D.maximalUnramifiedField K)
            (D.maximalUnramifiedField L) (D.maximalUnramifiedField_mono hLK)
            a)))
  rw [map_sum, map_sum]
  apply Finset.sum_congr rfl
  intro i _
  exact D.relativeNorm_frobeniusQuotientAction A K L hLK (φ ^ i.1) a

theorem frobeniusNormIdentities (D : DegreeData G) (A : Rep ℤ G)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    [TotallyDisconnectedSpace G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    [hLfinite : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK)]
    (φ σ : D.FrobeniusElements K L hLK)
    (hφ : D.frobeniusExponent K L hLK φ = 1)
    (a : ambientFixedAddSubgroup A
      (D.frobeniusFixedField K L hLK σ)) :
    letI : Finite
        (K.field.toSubgroup ⧸
          extensionSubgroup K.field (D.frobeniusFixedField K L hLK σ)
            (D.frobeniusFixedField_le K L hLK σ)) :=
      D.frobeniusFixedField_finite K L hLK σ
    letI : Finite
        ((D.maximalUnramifiedField K.field).toSubgroup ⧸
          extensionSubgroup (D.maximalUnramifiedField K.field)
            (D.maximalUnramifiedField L)
            (D.maximalUnramifiedField_mono hLK)) :=
      D.maximalUnramifiedExtension_finite K.field L hLK
    let n := D.frobeniusExponent K L hLK σ
    let aI := fixedFieldInclusion A
      (D.frobeniusFixedField K L hLK σ)
      (D.maximalUnramifiedField L)
      (D.fieldInertia_le_frobeniusFixedField K L hLK σ) a
    let b := fixedFieldInclusion A (D.maximalUnramifiedField K.field)
      (D.maximalUnramifiedField L) (D.maximalUnramifiedField_mono hLK)
      (relativeNorm A (D.maximalUnramifiedField K.field)
        (D.maximalUnramifiedField L) (D.maximalUnramifiedField_mono hLK) aI)
    let φnAI := D.frobeniusPowerSum A K.field L hLK φ.1 n aI
    (((relativeNorm A K.field (D.frobeniusFixedField K L hLK σ)
      (D.frobeniusFixedField_le K L hLK σ) a :
        ambientFixedAddSubgroup A K.field) : A.V) =
      ((relativeNorm A (D.maximalUnramifiedField K.field)
        (D.maximalUnramifiedField L) (D.maximalUnramifiedField_mono hLK)
        φnAI : ambientFixedAddSubgroup A
          (D.maximalUnramifiedField K.field)) : A.V)) ∧
    (((relativeNorm A (D.maximalUnramifiedField K.field)
      (D.maximalUnramifiedField L) (D.maximalUnramifiedField_mono hLK)
      φnAI : ambientFixedAddSubgroup A
        (D.maximalUnramifiedField K.field)) : A.V) =
      ((D.frobeniusPowerSum A K.field L hLK φ.1 n b :
        ambientFixedAddSubgroup A (D.maximalUnramifiedField L)) : A.V)) := by
  let : Finite
      (K.field.toSubgroup ⧸
        extensionSubgroup K.field (D.frobeniusFixedField K L hLK σ)
          (D.frobeniusFixedField_le K L hLK σ)) :=
    D.frobeniusFixedField_finite K L hLK σ
  let : Finite
      ((D.maximalUnramifiedField K.field).toSubgroup ⧸
        extensionSubgroup (D.maximalUnramifiedField K.field)
          (D.maximalUnramifiedField L)
          (D.maximalUnramifiedField_mono hLK)) :=
    D.maximalUnramifiedExtension_finite K.field L hLK
  let n := D.frobeniusExponent K L hLK σ
  let aI := fixedFieldInclusion A
    (D.frobeniusFixedField K L hLK σ)
    (D.maximalUnramifiedField L)
    (D.fieldInertia_le_frobeniusFixedField K L hLK σ) a
  let b := fixedFieldInclusion A (D.maximalUnramifiedField K.field)
    (D.maximalUnramifiedField L) (D.maximalUnramifiedField_mono hLK)
    (relativeNorm A (D.maximalUnramifiedField K.field)
      (D.maximalUnramifiedField L) (D.maximalUnramifiedField_mono hLK) aI)
  let φnAI := D.frobeniusPowerSum A K.field L hLK φ.1 n aI
  have hFirst :
      ((relativeNorm A K.field (D.frobeniusFixedField K L hLK σ)
        (D.frobeniusFixedField_le K L hLK σ) a :
          ambientFixedAddSubgroup A K.field) : A.V) =
        ((D.frobeniusPowerSum A K.field L hLK φ.1 n b :
          ambientFixedAddSubgroup A (D.maximalUnramifiedField L)) : A.V) := by
    simpa [n, aI, b] using
      D.frobeniusNormIdentity_norm_eq_powerSum_norm A K L hLK φ σ hφ a
  have hCommute :
      ((relativeNorm A (D.maximalUnramifiedField K.field)
        (D.maximalUnramifiedField L) (D.maximalUnramifiedField_mono hLK)
        φnAI : ambientFixedAddSubgroup A
          (D.maximalUnramifiedField K.field)) : A.V) =
        ((D.frobeniusPowerSum A K.field L hLK φ.1 n b :
          ambientFixedAddSubgroup A (D.maximalUnramifiedField L)) : A.V) := by
    simpa [n, aI, b, φnAI] using
      D.frobeniusNormIdentity_norm_powerSum_eq_powerSum_norm
        A K.field L hLK φ.1 n aI
  exact ⟨hFirst.trans hCommute.symm, hCommute⟩
end DegreeData
end frobeniusNormIdentities
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

/- ClassFieldTheory.AbstractClassFieldTheory.Reciprocity.Construction.UniversalNormDescent -/
section
universe u v
namespace ClassFormation
open KummerTheory
open CyclicCohomology
noncomputable section
open CategoryTheory
open scoped BigOperators

theorem rep_action_pow_eq_iterate {R : IntegralRepGroupType} [Group R]
    (B : Rep ℤ R) (g : R) (n : ℕ) (x : B.V) :
    B.ρ (g ^ n) x = ((B.ρ g)^[n]) x := by
  let : Module ℤ B.V := B.hV2
  rw [map_pow, Module.End.coe_pow]
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

theorem fixedFieldInclusion_mem_unitAddSubgroup
    (v : ValuationData D A) (E : FiniteAbstractFieldExtension G)
    (u : v.unitAddSubgroup E.base) :
    fixedFieldInclusion A E.base.field E.field.field E.below u.1 ∈
      v.unitAddSubgroup E.field := by
  rw [v.mem_unitAddSubgroup_iff]
  apply Subtype.ext
  let ER := E.toFiniteResidueAbstractExtension D
  apply zHatMulNat_injective ER.residueDegree.property
  change (ER.residueDegree : ℕ) •
      ((v.valuationAt E.field
        (fixedFieldInclusion A E.base.field E.field.field E.below u.1) :
        v.valueGroup) : ZHat) =
    (ER.residueDegree : ℕ) • ((0 : v.valueGroup) : ZHat)
  have htower :=
    v.normalizedValuation_tower E
      (fixedFieldInclusion A E.base.field E.field.field E.below u.1)
  have htower' :
      (ER.residueDegree : ℕ) •
          ((v.valuationAt E.field
            (fixedFieldInclusion A E.base.field E.field.field E.below u.1) :
            v.valueGroup) : ZHat) =
        ((v.valuationAt E.base
          (relativeNorm A E.base.field E.field.field E.below
            (fixedFieldInclusion A E.base.field E.field.field E.below u.1)) :
              v.valueGroup) : ZHat) := by
    simpa [ER] using htower
  rw [htower']
  rw [show relativeNorm A E.base.field E.field.field E.below
      (fixedFieldInclusion A E.base.field E.field.field E.below u.1) =
        (E.degree : ℕ) • u.1 by
    exact relativeNorm_fixedFieldInclusion A E.toFiniteAbstractExtension u.1]
  rw [map_nsmul]
  have hu : v.valuationAt E.base u.1 = 0 := u.2
  simp [hu]
 
def finiteUnitInclusion
    (v : ValuationData D A) (E : FiniteAbstractFieldExtension G) :
    v.unitAddSubgroup E.base →+ v.unitAddSubgroup E.field where
  toFun u := ⟨fixedFieldInclusion A E.base.field E.field.field E.below u.1,
    v.fixedFieldInclusion_mem_unitAddSubgroup E u⟩
  map_zero' := by apply Subtype.ext; rfl
  map_add' _ _ := by apply Subtype.ext; rfl

theorem finiteUnitInclusion_transport_coe
    (v : ValuationData D A) (E : FiniteAbstractFieldExtension G)
    (F : FiniteAbstractField G) (h : E.field = F)
    (u : v.unitAddSubgroup E.base) :
    (((h ▸ v.finiteUnitInclusion E u : v.unitAddSubgroup F).1 :
        ambientFixedAddSubgroup A F.field) : A.V) = u.1.1 := by
  cases h
  rfl
end ValuationData
end
end ClassFormation
end

/- ClassFieldTheory.AbstractClassFieldTheory.Reciprocity.Construction.FrobeniusQuotientDescent -/
section
universe u v
namespace ClassFormation
open KummerTheory
open CyclicCohomology
noncomputable section
open CategoryTheory
open scoped BigOperators
section representationDescent
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
namespace DegreeData

noncomputable def frobeniusQuotientActionLinearMap (D : DegreeData G)
    (A : Rep ℤ G) (K L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.toSubgroup)
    [hLnormal : (extensionSubgroup K L hLK).Normal]
    (q : K.toSubgroup ⧸ D.extensionInertiaWithin K L hLK) :
    ambientFixedAddSubgroup A (D.maximalUnramifiedField L) →ₗ[ℤ]
      ambientFixedAddSubgroup A (D.maximalUnramifiedField L) where
  toFun := D.frobeniusQuotientAction A K L hLK q
  map_add' a b := by
    refine Quotient.inductionOn' q ?_
    intro k
    apply Subtype.ext
    change A.ρ k.1 (a.1 + b.1) = A.ρ k.1 a.1 + A.ρ k.1 b.1
    exact map_add (A.ρ k.1) _ _
  map_smul' n a := by
    refine Quotient.inductionOn' q ?_
    intro k
    apply Subtype.ext
    change A.ρ k.1 (n • a.1) = n • A.ρ k.1 a.1
    exact map_zsmul (A.ρ k.1) n a.1

noncomputable def frobeniusQuotientRepresentation (D : DegreeData G)
    (A : Rep ℤ G) (K L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.toSubgroup)
    [hLnormal : (extensionSubgroup K L hLK).Normal] :
    Rep ℤ (K.toSubgroup ⧸ D.extensionInertiaWithin K L hLK) :=
  Rep.of
    { toFun := D.frobeniusQuotientActionLinearMap A K L hLK
      map_one' := by
        ext a
        change A.ρ (1 : G) a.1 = a.1
        simp
      map_mul' := by
        intro q r
        refine Quotient.inductionOn₂' q r ?_
        intro k l
        ext a
        change A.ρ (k.1 * l.1) a.1 = A.ρ k.1 (A.ρ l.1 a.1)
        rw [map_mul]
        rfl }
 
@[simp]
theorem frobeniusQuotientRepresentation_apply (D : DegreeData G)
    (A : Rep ℤ G) (K L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.toSubgroup)
    [hLnormal : (extensionSubgroup K L hLK).Normal]
    (q : K.toSubgroup ⧸ D.extensionInertiaWithin K L hLK)
    (a : ambientFixedAddSubgroup A (D.maximalUnramifiedField L)) :
    (D.frobeniusQuotientRepresentation A K L hLK).ρ q a =
      D.frobeniusQuotientAction A K L hLK q a :=
  rfl
 
theorem birkhoffSum_eq_frobeniusPowerSum (D : DegreeData G)
    (A : Rep ℤ G)
    (K L : ClosedSubgroup G) (hLK : L.toSubgroup ≤ K.toSubgroup)
    [hLnormal : (extensionSubgroup K L hLK).Normal]
    (φ : K.toSubgroup ⧸ D.extensionInertiaWithin K L hLK) (n : ℕ)
    (a : ambientFixedAddSubgroup A (D.maximalUnramifiedField L)) :
    birkhoffSum
        ((D.frobeniusQuotientRepresentation A K L hLK).ρ φ) id n a =
      D.frobeniusPowerSum A K L hLK φ n a := by
  unfold birkhoffSum frobeniusPowerSum
  rw [Finset.sum_fin_eq_sum_range]
  apply Finset.sum_congr rfl
  intro i hi
  simp only [id_eq, Finset.mem_range.mp hi, dite_true]
  exact (rep_action_pow_eq_iterate
    (D.frobeniusQuotientRepresentation A K L hLK) φ i a).symm

theorem frobeniusPowerSum_add (D : DegreeData G) (A : Rep ℤ G)
    (K L : ClosedSubgroup G) (hLK : L.toSubgroup ≤ K.toSubgroup)
    [hLnormal : (extensionSubgroup K L hLK).Normal]
    (φ : K.toSubgroup ⧸ D.extensionInertiaWithin K L hLK)
    (n m : ℕ)
    (x : ambientFixedAddSubgroup A (D.maximalUnramifiedField L)) :
    D.frobeniusPowerSum A K L hLK φ (n + m) x =
      D.frobeniusPowerSum A K L hLK φ n x +
        D.frobeniusPowerSum A K L hLK φ m
          (D.frobeniusQuotientAction A K L hLK (φ ^ n) x) := by
  let B := D.frobeniusQuotientRepresentation A K L hLK
  have hsum (r : ℕ)
      (a : ambientFixedAddSubgroup A (D.maximalUnramifiedField L)) :
      birkhoffSum (B.ρ φ) id r a =
        D.frobeniusPowerSum A K L hLK φ r a :=
    D.birkhoffSum_eq_frobeniusPowerSum A K L hLK φ r a
  have hiterate : ((B.ρ φ)^[n]) x =
      D.frobeniusQuotientAction A K L hLK (φ ^ n) x :=
    (rep_action_pow_eq_iterate B φ n x).symm
  exact ((hsum (n + m) x).symm.trans
    (birkhoffSum_add (B.ρ φ) id n m x)).trans
      (congrArg₂
        (fun a b : ambientFixedAddSubgroup A (D.maximalUnramifiedField L) => a + b)
        (hsum n x)
        ((hsum m (((B.ρ φ)^[n]) x)).trans
          (congrArg (D.frobeniusPowerSum A K L hLK φ m) hiterate)))
 
theorem frobeniusPowerSum_action_sub (D : DegreeData G)
    (A : Rep ℤ G)
    (K L : ClosedSubgroup G) (hLK : L.toSubgroup ≤ K.toSubgroup)
    [hLnormal : (extensionSubgroup K L hLK).Normal]
    (φ : K.toSubgroup ⧸ D.extensionInertiaWithin K L hLK) (n : ℕ)
    (a : ambientFixedAddSubgroup A (D.maximalUnramifiedField L)) :
    D.frobeniusQuotientAction A K L hLK φ
        (D.frobeniusPowerSum A K L hLK φ n a) -
        D.frobeniusPowerSum A K L hLK φ n a =
      D.frobeniusQuotientAction A K L hLK (φ ^ n) a - a := by
  let B := D.frobeniusQuotientRepresentation A K L hLK
  have h := birkhoffSum_apply_sub_birkhoffSum (B.ρ φ) id n a
  have hshift :
      B.ρ φ (birkhoffSum (B.ρ φ) id n a) =
        birkhoffSum (B.ρ φ) id n (B.ρ φ a) := by
    calc
      B.ρ φ (birkhoffSum (B.ρ φ) id n a) =
          birkhoffSum (B.ρ φ) (B.ρ φ ∘ id) n a :=
        map_birkhoffSum (B.ρ φ) (B.ρ φ) id n a
      _ = birkhoffSum (B.ρ φ) id n (B.ρ φ a) := by
        unfold birkhoffSum
        apply Finset.sum_congr rfl
        intro i _
        simp only [Function.comp_apply, id_eq]
        exact (Function.Commute.self_iterate (B.ρ φ) i).eq a
  rw [← hshift] at h
  simp only [id_eq] at h
  rw [D.birkhoffSum_eq_frobeniusPowerSum A K L hLK,
    ← rep_action_pow_eq_iterate B φ n a] at h
  change
    D.frobeniusQuotientAction A K L hLK φ
          (D.frobeniusPowerSum A K L hLK φ n a) -
        D.frobeniusPowerSum A K L hLK φ n a =
      D.frobeniusQuotientAction A K L hLK (φ ^ n) a - a at h
  exact h
 
theorem frobeniusPowerSum_sub_universalNormDescent (D : DegreeData G) (A : Rep ℤ G)
    (K L : ClosedSubgroup G) (hLK : L.toSubgroup ≤ K.toSubgroup)
    [hLnormal : (extensionSubgroup K L hLK).Normal]
    (φ : K.toSubgroup ⧸ D.extensionInertiaWithin K L hLK)
    (n : ℕ)
    (x y : ambientFixedAddSubgroup A (D.maximalUnramifiedField L)) :
    D.frobeniusPowerSum A K L hLK φ n (x - y) =
      D.frobeniusPowerSum A K L hLK φ n x -
        D.frobeniusPowerSum A K L hLK φ n y := by
  unfold DegreeData.frobeniusPowerSum
  change
    (∑ i : Fin n,
      D.frobeniusQuotientActionLinearMap A K L hLK (φ ^ i.1) (x - y)) =
      (∑ i : Fin n,
        D.frobeniusQuotientActionLinearMap A K L hLK (φ ^ i.1) x) -
      ∑ i : Fin n,
        D.frobeniusQuotientActionLinearMap A K L hLK (φ ^ i.1) y
  simp only [map_sub, Finset.sum_sub_distrib]
end DegreeData
end representationDescent
end
end ClassFormation
end

/- ClassFieldTheory.AbstractClassFieldTheory.Reciprocity.Construction.InfiniteUnitDescent -/
section
universe u v
namespace ClassFormation
open KummerTheory
open CyclicCohomology
noncomputable section
open CategoryTheory
open scoped BigOperators
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
namespace FiniteIntermediateField

noncomputable def toFiniteAbstractFieldExtension
    {E : ClosedSubgroup G} (K : FiniteAbstractField G)
    (M : FiniteIntermediateField E K.field) :
    FiniteAbstractFieldExtension G := by
  letI : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field M.field M.below) :=
    M.finite
  exact FiniteAbstractFieldExtension.ofInclusion M.field K M.below
 
noncomputable def toFiniteAbstractField
    {E : ClosedSubgroup G} (K : FiniteAbstractField G)
    (M : FiniteIntermediateField E K.field) : FiniteAbstractField G :=
  (M.toFiniteAbstractFieldExtension K).field
end FiniteIntermediateField
namespace ValuationData
variable {D : DegreeData G} {A : Rep ℤ G}

def IsFiniteStageUnit
    (v : ValuationData D A) (E : ClosedSubgroup G)
    (K : FiniteAbstractField G)
    (a : ambientFixedAddSubgroup A E) : Prop :=
  ∃ M : FiniteIntermediateField E K.field,
    ∃ u : v.unitAddSubgroup (M.toFiniteAbstractField K),
      fixedFieldInclusion A M.field E M.above u.1 = a
 
noncomputable def infiniteUnitAddSubgroup
    (v : ValuationData D A) (E : ClosedSubgroup G)
    (K : FiniteAbstractField G)
    (hEK : E.toSubgroup ≤ K.field.toSubgroup) :
    AddSubgroup (ambientFixedAddSubgroup A E) where
  carrier := {a | v.IsFiniteStageUnit E K a}
  zero_mem' := by
    let M := FiniteIntermediateField.base E K.field hEK
    refine ⟨M, 0, ?_⟩
    rfl
  add_mem' := by
    intro a b ha hb
    rcases ha with ⟨M, u, hu⟩
    rcases hb with ⟨N, w, hw⟩
    let P := M.compositum N
    let hPfinite : Finite
        (K.field.toSubgroup ⧸ extensionSubgroup K.field P.field P.below) :=
      P.finite
    let hPM : P.field.toSubgroup ≤ M.field.toSubgroup := M.compositum_le_left N
    let hPN : P.field.toSubgroup ≤ N.field.toSubgroup := M.compositum_le_right N
    let hPMfinite : Finite
        (M.field.toSubgroup ⧸ extensionSubgroup M.field P.field hPM) :=
      FiniteIntermediateField.finite_extension_of_le
        P.below M.below hPM
    let hPNfinite : Finite
        (N.field.toSubgroup ⧸ extensionSubgroup N.field P.field hPN) :=
      FiniteIntermediateField.finite_extension_of_le
        P.below N.below hPN
    let : Finite
        ((M.toFiniteAbstractField K).field.toSubgroup ⧸
          extensionSubgroup (M.toFiniteAbstractField K).field P.field hPM) := by
      change Finite
        (M.field.toSubgroup ⧸ extensionSubgroup M.field P.field hPM)
      exact hPMfinite
    let : Finite
        ((N.toFiniteAbstractField K).field.toSubgroup ⧸
          extensionSubgroup (N.toFiniteAbstractField K).field P.field hPN) := by
      change Finite
        (N.field.toSubgroup ⧸ extensionSubgroup N.field P.field hPN)
      exact hPNfinite
    let EMP : FiniteAbstractFieldExtension G :=
      FiniteAbstractFieldExtension.ofInclusion
        P.field (M.toFiniteAbstractField K) hPM
    let ENP : FiniteAbstractFieldExtension G :=
      FiniteAbstractFieldExtension.ofInclusion
        P.field (N.toFiniteAbstractField K) hPN
    let hEMPfield : EMP.field = P.toFiniteAbstractField K :=
      FiniteAbstractField.eq_of_field_eq _ _ rfl
    let hENPfield : ENP.field = P.toFiniteAbstractField K :=
      FiniteAbstractField.eq_of_field_eq _ _ rfl
    let uP : v.unitAddSubgroup (P.toFiniteAbstractField K) :=
      hEMPfield ▸ v.finiteUnitInclusion EMP u
    let wP : v.unitAddSubgroup (P.toFiniteAbstractField K) :=
      hENPfield ▸ v.finiteUnitInclusion ENP w
    refine ⟨P, uP + wP, ?_⟩
    apply Subtype.ext
    have huval : u.1.1 = a.1 :=
      congrArg (fun x : ambientFixedAddSubgroup A E => x.1) hu
    have hwval : w.1.1 = b.1 :=
      congrArg (fun x : ambientFixedAddSubgroup A E => x.1) hw
    change uP.1.1 + wP.1.1 = a.1 + b.1
    have huP : uP.1.1 = u.1.1 :=
      v.finiteUnitInclusion_transport_coe EMP
        (P.toFiniteAbstractField K) hEMPfield u
    have hwP : wP.1.1 = w.1.1 :=
      v.finiteUnitInclusion_transport_coe ENP
        (P.toFiniteAbstractField K) hENPfield w
    rw [huP, hwP, huval, hwval]
  neg_mem' := by
    intro a ha
    rcases ha with ⟨M, u, hu⟩
    refine ⟨M, -u, ?_⟩
    apply Subtype.ext
    exact congrArg Neg.neg (congrArg Subtype.val hu)

@[simp]
theorem mem_infiniteUnitAddSubgroup_iff
    (v : ValuationData D A) (E : ClosedSubgroup G)
    (K : FiniteAbstractField G)
    (hEK : E.toSubgroup ≤ K.field.toSubgroup)
    (a : ambientFixedAddSubgroup A E) :
    a ∈ v.infiniteUnitAddSubgroup E K hEK ↔
      v.IsFiniteStageUnit E K a :=
  Iff.rfl

theorem frobeniusQuotientAction_mem_infiniteUnitAddSubgroup
    (v : ValuationData D A) [IsTopologicalGroup G]
    (K : FiniteAbstractField G) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (q : K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK)
    (a : ambientFixedAddSubgroup A (D.maximalUnramifiedField L))
    (ha : a ∈ v.infiniteUnitAddSubgroup (D.maximalUnramifiedField L) K
      (D.maximalUnramifiedField_le_of_le hLK)) :
    D.frobeniusQuotientAction A K.field L hLK q a ∈
      v.infiniteUnitAddSubgroup (D.maximalUnramifiedField L) K
        (D.maximalUnramifiedField_le_of_le hLK) := by
  let E := D.maximalUnramifiedField L
  let hEK := D.maximalUnramifiedField_le_of_le hLK
  let hEnormal : (extensionSubgroup K.field E hEK).Normal :=
    D.extensionSubgroup_maximalUnramifiedField_normal K.field L hLK
  rcases ha with ⟨M, u, hu⟩
  let R := M.galoisRefinement
  have hRM : R.field.toSubgroup ≤ M.field.toSubgroup :=
    M.galoisRefinement_le_field
  let hRfinite : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field R.field R.below) :=
    R.finite
  let hRMfinite : Finite
      (M.field.toSubgroup ⧸ extensionSubgroup M.field R.field hRM) :=
    FiniteIntermediateField.finite_extension_of_le R.below M.below hRM
  let : Finite
      ((M.toFiniteAbstractField K).field.toSubgroup ⧸
        extensionSubgroup (M.toFiniteAbstractField K).field R.field hRM) := by
    change Finite
      (M.field.toSubgroup ⧸ extensionSubgroup M.field R.field hRM)
    exact hRMfinite
  let k : K.field.toSubgroup := Quotient.out q
  have hkq :
      (QuotientGroup.mk k :
        K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK) = q :=
    Quotient.out_eq' q
  let EMR : FiniteAbstractFieldExtension G :=
    FiniteAbstractFieldExtension.ofInclusion
      R.field (M.toFiniteAbstractField K) hRM
  let ER := R.toFiniteAbstractFieldExtension K
  let hEMRfield : EMR.field = R.toFiniteAbstractField K :=
    FiniteAbstractField.eq_of_field_eq _ _ rfl
  let uR : v.unitAddSubgroup (R.toFiniteAbstractField K) :=
    hEMRfield ▸ v.finiteUnitInclusion EMR u
  let uR' : v.unitAddSubgroup (R.toFiniteAbstractField K) :=
    v.unitActionLinearMap ER
      (inferInstance : (extensionSubgroup K.field R.field R.below).Normal) k uR
  refine ⟨R, uR', ?_⟩
  rw [← hkq]
  apply Subtype.ext
  have huval : u.1.1 = a.1 :=
    congrArg (fun z : ambientFixedAddSubgroup A E => z.1) hu
  change A.ρ k.1 uR.1.1 = A.ρ k.1 a.1
  have huR : uR.1.1 = u.1.1 :=
    v.finiteUnitInclusion_transport_coe EMR
      (R.toFiniteAbstractField K) hEMRfield u
  rw [huR, huval]

theorem frobeniusPowerSum_mem_infiniteUnit_universalNormDescent
    (v : ValuationData D A) [IsTopologicalGroup G]
    (K : FiniteAbstractField G) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (φ : K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK)
    (n : ℕ)
    (x : ambientFixedAddSubgroup A (D.maximalUnramifiedField L))
    (hx : x ∈ v.infiniteUnitAddSubgroup
      (D.maximalUnramifiedField L) K
      (D.maximalUnramifiedField_le_of_le hLK)) :
    D.frobeniusPowerSum A K.field L hLK φ n x ∈
      v.infiniteUnitAddSubgroup (D.maximalUnramifiedField L) K
        (D.maximalUnramifiedField_le_of_le hLK) := by
  unfold DegreeData.frobeniusPowerSum
  apply AddSubgroup.sum_mem
  intro i _
  exact v.frobeniusQuotientAction_mem_infiniteUnitAddSubgroup
    K L hLK (φ ^ i.1) x hx
end ValuationData
end
end ClassFormation
end

/- ClassFieldTheory.AbstractClassFieldTheory.Reciprocity.Construction.ChosenDegreeOneFrobenius -/
section
universe u
namespace ClassFormation
open CyclicCohomology
noncomputable section
variable {G : Type u} [Group G] [TopologicalSpace G]
namespace DegreeData

noncomputable def chosenDegreeOneFrobeniusElement (D : DegreeData G)
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal] :
    D.FrobeniusElements K L hLK := by
  let hsurj := D.extensionNormalizedDegreeContinuous_surjective K L hLK
    (Multiplicative.ofAdd (1 : ZHat))
  refine ⟨Classical.choose hsurj, 1, Nat.one_pos, ?_⟩
  rw [pow_one, ← D.extensionNormalizedDegreeContinuous_apply]
  exact Classical.choose_spec hsurj

@[simp]
theorem frobeniusExponent_chosenDegreeOneFrobeniusElement (D : DegreeData G)
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal] :
    D.frobeniusExponent K L hLK
        (D.chosenDegreeOneFrobeniusElement K L hLK) = 1 := by
  apply proCIntegerOne_pow_nat_injective
  calc
    (Multiplicative.ofAdd (1 : ZHat)) ^
        D.frobeniusExponent K L hLK
          (D.chosenDegreeOneFrobeniusElement K L hLK) =
      D.extensionNormalizedDegree K L hLK
        (D.chosenDegreeOneFrobeniusElement K L hLK).1 :=
      (D.extensionNormalizedDegree_frobenius_eq_pow K L hLK
        (D.chosenDegreeOneFrobeniusElement K L hLK)).symm
    _ = Multiplicative.ofAdd (1 : ZHat) := by
      rw [← D.extensionNormalizedDegreeContinuous_apply]
      change D.extensionNormalizedDegreeContinuous K L hLK
        (Classical.choose
          (D.extensionNormalizedDegreeContinuous_surjective K L hLK
            (Multiplicative.ofAdd (1 : ZHat)))) =
          Multiplicative.ofAdd (1 : ZHat)
      exact Classical.choose_spec
        (D.extensionNormalizedDegreeContinuous_surjective K L hLK
          (Multiplicative.ofAdd (1 : ZHat)))
    _ = (Multiplicative.ofAdd (1 : ZHat)) ^ (1 : ℕ) := by simp
end DegreeData
end
end ClassFormation
end

/- ClassFieldTheory.AbstractClassFieldTheory.Reciprocity.Construction.TransferOrbitClosure -/
section
namespace ClassFormation
noncomputable section
open MulAction

theorem mem_closedSubgroupGenerated_conjugate_iff
    {Q : Type*} [Group Q] [TopologicalSpace Q] [IsTopologicalGroup Q]
    (q x c : Q) :
    c ∈ (closedSubgroupGenerated ({x} : Set Q)).toSubgroup ↔
      q * c * q⁻¹ ∈
        (closedSubgroupGenerated ({q * x * q⁻¹} : Set Q)).toSubgroup := by
  let conjugationHom (g : Q) : Q →ₜ* Q :=
    { toMonoidHom := (MulAut.conj g).toMonoidHom
      continuous_toFun := IsTopologicalGroup.continuous_conj g }
  constructor
  · intro hc
    exact map_mem_closedSubgroupGenerated_singleton
      (conjugationHom q) x hc
  · intro hc
    have h := map_mem_closedSubgroupGenerated_singleton
      (conjugationHom q⁻¹) (q * x * q⁻¹) hc
    change q⁻¹ * (q * c * q⁻¹) * (q⁻¹)⁻¹ ∈
      (closedSubgroupGenerated
        ({q⁻¹ * (q * x * q⁻¹) * (q⁻¹)⁻¹} : Set Q)).toSubgroup at h
    simpa [mul_assoc] using h
end
end ClassFormation
end

/- ClassFieldTheory.AbstractClassFieldTheory.Reciprocity.Construction.MainMultiplicativity.FrobeniusActionRemainder -/
section
universe u
namespace ClassFormation
open KummerTheory
open CyclicCohomology
noncomputable section
open CategoryTheory
section frobeniusAlgebra
variable {G : Type u} [Group G] [TopologicalSpace G]
namespace DegreeData

@[simp]
theorem frobeniusExponent_mul (D : DegreeData G)
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (σ₁ σ₂ : D.FrobeniusElements K L hLK) :
    D.frobeniusExponent K L hLK (σ₁ * σ₂) =
      D.frobeniusExponent K L hLK σ₁ +
      D.frobeniusExponent K L hLK σ₂ := by
  apply proCIntegerOne_pow_nat_injective
  calc
    (Multiplicative.ofAdd (1 : ZHat)) ^
        D.frobeniusExponent K L hLK (σ₁ * σ₂) =
      D.extensionNormalizedDegree K L hLK (σ₁ * σ₂).1 :=
        (D.extensionNormalizedDegree_frobenius_eq_pow K L hLK
          (σ₁ * σ₂)).symm
    _ = D.extensionNormalizedDegree K L hLK σ₁.1 *
        D.extensionNormalizedDegree K L hLK σ₂.1 := by
      rw [frobeniusMul_coe, map_mul]
    _ = (Multiplicative.ofAdd (1 : ZHat)) ^
            D.frobeniusExponent K L hLK σ₁ *
        (Multiplicative.ofAdd (1 : ZHat)) ^
            D.frobeniusExponent K L hLK σ₂ := by
      rw [D.extensionNormalizedDegree_frobenius_eq_pow,
        D.extensionNormalizedDegree_frobenius_eq_pow]
    _ = (Multiplicative.ofAdd (1 : ZHat)) ^
            (D.frobeniusExponent K L hLK σ₁ +
              D.frobeniusExponent K L hLK σ₂) := by
      rw [pow_add]
end DegreeData
end frobeniusAlgebra
section frobeniusQuotientActions
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
namespace DegreeData

theorem frobeniusQuotientAction_fixedFieldInclusion (D : DegreeData G)
    (A : Rep ℤ G) [IsTopologicalGroup G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (σ : D.FrobeniusElements K L hLK)
    (a : ambientFixedAddSubgroup A
      (D.frobeniusFixedField K L hLK σ)) :
    D.frobeniusQuotientAction A K.field L hLK σ.1
        (fixedFieldInclusion A (D.frobeniusFixedField K L hLK σ)
          (D.maximalUnramifiedField L)
          (D.fieldInertia_le_frobeniusFixedField K L hLK σ) a) =
      fixedFieldInclusion A (D.frobeniusFixedField K L hLK σ)
        (D.maximalUnramifiedField L)
        (D.fieldInertia_le_frobeniusFixedField K L hLK σ) a := by
  let k : K.field.toSubgroup := Quotient.out σ.1
  have hσk : σ.1 = QuotientGroup.mk k := (Quotient.out_eq' σ.1).symm
  have hσClosure : σ.1 ∈
      (D.frobeniusClosure K L hLK σ).toSubgroup := by
    exact Subgroup.le_topologicalClosure _
      (Subgroup.subset_closure (by simp))
  have hkFixed : k ∈ D.frobeniusFixedSubgroupWithin K L hLK σ := by
    change QuotientGroup.mk k ∈
      (D.frobeniusClosure K L hLK σ).toSubgroup
    rw [← hσk]
    exact hσClosure
  rw [← D.extensionSubgroup_frobeniusFixedField K L hLK σ] at hkFixed
  obtain ⟨s, hs⟩ := hkFixed
  rw [hσk]
  apply Subtype.ext
  change A.ρ k.1 a.1 = a.1
  let sFixed : (D.frobeniusFixedField K L hLK σ).toSubgroup :=
    ⟨s.1, ⟨s, hs.1, rfl⟩⟩
  have hsval : sFixed.1 = k.1 := hs.2
  rw [← hsval]
  exact a.2 sFixed
end DegreeData
end frobeniusQuotientActions
section actionRemainderAlgebra
variable {G : Type u} [Group G] [TopologicalSpace G]
namespace DegreeData

def frobeniusActionRemainder (D : DegreeData G)
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (φ σ : D.FrobeniusElements K L hLK) :
    K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK :=
  φ.1 ^ D.frobeniusExponent K L hLK σ * σ.1⁻¹

theorem frobeniusActionRemainder_mem_degreeKernel (D : DegreeData G)
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (φ σ : D.FrobeniusElements K L hLK)
    (hφ : D.frobeniusExponent K L hLK φ = 1) :
    D.frobeniusActionRemainder K L hLK φ σ ∈
      (D.extensionNormalizedDegreeContinuous K L hLK).toMonoidHom.ker := by
  change D.extensionNormalizedDegree K L hLK
      (φ.1 ^ D.frobeniusExponent K L hLK σ * σ.1⁻¹) = 1
  rw [map_mul, map_pow, map_inv,
    D.extensionNormalizedDegree_frobenius_eq_pow K L hLK σ,
    D.extensionNormalizedDegree_frobenius_eq_pow K L hLK φ, hφ]
  simp

def frobeniusActionConjugate (D : DegreeData G)
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (φ σ : D.FrobeniusElements K L hLK) (m : ℕ) :
    D.FrobeniusElements K L hLK := by
  let n := D.frobeniusExponent K L hLK σ
  refine ⟨φ.1 ^ m * σ.1 * φ.1⁻¹ ^ m, n,
    D.frobeniusExponent_pos K L hLK σ, ?_⟩
  rw [map_mul, map_mul, map_pow, map_pow, map_inv,
    D.extensionNormalizedDegree_frobenius_eq_pow K L hLK σ]
  simp [n, mul_assoc]
 
@[simp]
theorem frobeniusActionConjugate_coe (D : DegreeData G)
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (φ σ : D.FrobeniusElements K L hLK) (m : ℕ) :
    (D.frobeniusActionConjugate K L hLK φ σ m).1 =
      φ.1 ^ m * σ.1 * φ.1⁻¹ ^ m := by
  simp [frobeniusActionConjugate]
 
@[simp]
theorem frobeniusExponent_actionConjugate (D : DegreeData G)
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (φ σ : D.FrobeniusElements K L hLK) (m : ℕ) :
    D.frobeniusExponent K L hLK
        (D.frobeniusActionConjugate K L hLK φ σ m) =
      D.frobeniusExponent K L hLK σ := by
  apply proCIntegerOne_pow_nat_injective
  calc
    (Multiplicative.ofAdd (1 : ZHat)) ^
        D.frobeniusExponent K L hLK
          (D.frobeniusActionConjugate K L hLK φ σ m) =
      D.extensionNormalizedDegree K L hLK
        (D.frobeniusActionConjugate K L hLK φ σ m).1 :=
          (D.extensionNormalizedDegree_frobenius_eq_pow K L hLK
            (D.frobeniusActionConjugate K L hLK φ σ m)).symm
    _ = (Multiplicative.ofAdd (1 : ZHat)) ^
          D.frobeniusExponent K L hLK σ := by
      rw [frobeniusActionConjugate_coe, map_mul, map_mul, map_pow, map_pow,
        map_inv,
        D.extensionNormalizedDegree_frobenius_eq_pow K L hLK σ]
      simp [mul_assoc]

theorem conjugate_frobeniusFixedField_actionConjugate
    (D : DegreeData G) [IsTopologicalGroup G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (φ σ : D.FrobeniusElements K L hLK) (m : ℕ) :
    let q := φ.1 ^ m
    let k : K.field.toSubgroup := Quotient.out q
    conjugateClosedSubgroup
        (D.frobeniusFixedField K L hLK σ) k.1⁻¹ =
      D.frobeniusFixedField K L hLK
        (D.frobeniusActionConjugate K L hLK φ σ m) := by
  dsimp only
  let q := φ.1 ^ m
  let k : K.field.toSubgroup := Quotient.out q
  let σ' := D.frobeniusActionConjugate K L hLK φ σ m
  have hkq :
      (QuotientGroup.mk k :
        K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK) = q :=
    Quotient.out_eq' q
  have hσ' : σ'.1 = q * σ.1 * q⁻¹ := by
    simp [σ', q, frobeniusActionConjugate_coe]
  ext x
  change x ∈ conjugateClosedSubgroup
      (D.frobeniusFixedField K L hLK σ) k.1⁻¹ ↔
    x ∈ D.frobeniusFixedField K L hLK σ'
  rw [conjugateClosedSubgroup_mem]
  constructor
  · intro hx
    obtain ⟨t, htClosure, htx⟩ := hx
    let xK : K.field.toSubgroup := ⟨x, by
      have htK : t.1 ∈ K.field.toSubgroup := t.2
      have htxval : t.1 = k.1⁻¹ * x * k.1 := by simpa using htx
      have hxval : x = k.1 * t.1 * k.1⁻¹ := by
        calc
          x = k.1 * (k.1⁻¹ * x * k.1) * k.1⁻¹ := by
            simp [mul_assoc]
          _ = k.1 * t.1 * k.1⁻¹ := by rw [htxval]
      rw [hxval]
      exact K.field.toSubgroup.mul_mem
        (K.field.toSubgroup.mul_mem k.2 htK) (K.field.toSubgroup.inv_mem k.2)⟩
    have htClosure' : QuotientGroup.mk t ∈
        (closedSubgroupGenerated ({σ.1} : Set
          (K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK))).toSubgroup := by
      simpa [DegreeData.frobeniusClosure] using htClosure
    have hxClosure' : q * QuotientGroup.mk t * q⁻¹ ∈
        (closedSubgroupGenerated ({σ'.1} : Set
          (K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK))).toSubgroup := by
      rw [hσ']
      exact (mem_closedSubgroupGenerated_conjugate_iff
        q σ.1 (QuotientGroup.mk t)).mp htClosure'
    have hxClosure : QuotientGroup.mk xK ∈
        (D.frobeniusClosure K L hLK σ').toSubgroup := by
      have hxK : xK = k * t * k⁻¹ := by
        apply Subtype.ext
        dsimp [xK]
        have htxval : t.1 = k.1⁻¹ * x * k.1 := by simpa using htx
        calc
          x = k.1 * (k.1⁻¹ * x * k.1) * k.1⁻¹ := by
            simp [mul_assoc]
          _ = k.1 * t.1 * k.1⁻¹ := by rw [htxval]
      rw [hxK]
      change (QuotientGroup.mk k :
          K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK) *
          QuotientGroup.mk t * (QuotientGroup.mk k)⁻¹ ∈ _
      rw [hkq]
      simpa [DegreeData.frobeniusClosure] using hxClosure'
    exact ⟨xK, hxClosure, rfl⟩
  · intro hx
    obtain ⟨t, htClosure, htx⟩ := hx
    let yK : K.field.toSubgroup := ⟨k.1⁻¹ * x * k.1, by
      have htK : t.1 ∈ K.field.toSubgroup := t.2
      rw [← htx]
      exact K.field.toSubgroup.mul_mem
        (K.field.toSubgroup.mul_mem (K.field.toSubgroup.inv_mem k.2) htK) k.2⟩
    have htClosure' : QuotientGroup.mk t ∈
        (closedSubgroupGenerated ({σ'.1} : Set
          (K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK))).toSubgroup := by
      simpa [DegreeData.frobeniusClosure] using htClosure
    have hyClosure' : QuotientGroup.mk yK ∈
        (closedSubgroupGenerated ({σ.1} : Set
          (K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK))).toSubgroup := by
      apply (mem_closedSubgroupGenerated_conjugate_iff
        q σ.1 (QuotientGroup.mk yK)).mpr
      have hyK : k * yK * k⁻¹ = t := by
        apply Subtype.ext
        dsimp [yK]
        simpa [mul_assoc] using htx.symm
      have hyKq : q * QuotientGroup.mk yK * q⁻¹ =
          (QuotientGroup.mk t :
            K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK) := by
        rw [← hkq]
        simpa using congrArg
          (fun z : K.field.toSubgroup =>
            (QuotientGroup.mk z :
              K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK)) hyK
      rw [hyKq]
      rw [← hσ']
      exact htClosure'
    exact ⟨yK, by simpa [DegreeData.frobeniusClosure] using hyClosure', by simp [yK]⟩
end DegreeData
end actionRemainderAlgebra
section actionRemainderMultiplication
variable {G : Type u} [Group G] [TopologicalSpace G]
namespace DegreeData

theorem frobeniusActionRemainder_mul (D : DegreeData G)
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (φ σ₁ σ₂ : D.FrobeniusElements K L hLK) :
    D.frobeniusActionRemainder K L hLK φ (σ₁ * σ₂) =
      D.frobeniusActionRemainder K L hLK φ
          (D.frobeniusActionConjugate K L hLK φ σ₂
            (D.frobeniusExponent K L hLK σ₁)) *
        D.frobeniusActionRemainder K L hLK φ σ₁ := by
  simp [frobeniusActionRemainder, frobeniusExponent_mul,
    frobeniusActionConjugate_coe, frobeniusExponent_actionConjugate,
    frobeniusMul_coe, pow_add, mul_assoc]
  have hp : φ.1 ^ D.frobeniusExponent K L hLK σ₁ *
      φ.1 ^ D.frobeniusExponent K L hLK σ₂ =
      φ.1 ^ D.frobeniusExponent K L hLK σ₂ *
        φ.1 ^ D.frobeniusExponent K L hLK σ₁ := by
    rw [← pow_add, ← pow_add, Nat.add_comm]
  calc
    φ.1 ^ D.frobeniusExponent K L hLK σ₁ *
          (φ.1 ^ D.frobeniusExponent K L hLK σ₂ *
            (σ₂.1⁻¹ * σ₁.1⁻¹)) =
        (φ.1 ^ D.frobeniusExponent K L hLK σ₁ *
          φ.1 ^ D.frobeniusExponent K L hLK σ₂) *
            (σ₂.1⁻¹ * σ₁.1⁻¹) := by rw [mul_assoc]
    _ = (φ.1 ^ D.frobeniusExponent K L hLK σ₂ *
          φ.1 ^ D.frobeniusExponent K L hLK σ₁) *
            (σ₂.1⁻¹ * σ₁.1⁻¹) := by rw [hp]
    _ = φ.1 ^ D.frobeniusExponent K L hLK σ₂ *
          (φ.1 ^ D.frobeniusExponent K L hLK σ₁ *
            (σ₂.1⁻¹ * σ₁.1⁻¹)) := by rw [mul_assoc]
end DegreeData
end actionRemainderMultiplication
section fixedFieldRemainderActions
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
namespace DegreeData

theorem frobeniusActionRemainder_apply_fixedField (D : DegreeData G)
    (A : Rep ℤ G) [IsTopologicalGroup G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (φ σ : D.FrobeniusElements K L hLK)
    (a : ambientFixedAddSubgroup A
      (D.frobeniusFixedField K L hLK σ)) :
    D.frobeniusQuotientAction A K.field L hLK
        (D.frobeniusActionRemainder K L hLK φ σ)
        (fixedFieldInclusion A (D.frobeniusFixedField K L hLK σ)
          (D.maximalUnramifiedField L)
          (D.fieldInertia_le_frobeniusFixedField K L hLK σ) a) =
      D.frobeniusQuotientAction A K.field L hLK
        (φ.1 ^ D.frobeniusExponent K L hLK σ)
        (fixedFieldInclusion A (D.frobeniusFixedField K L hLK σ)
          (D.maximalUnramifiedField L)
          (D.fieldInertia_le_frobeniusFixedField K L hLK σ) a) := by
  let aI := fixedFieldInclusion A
    (D.frobeniusFixedField K L hLK σ)
    (D.maximalUnramifiedField L)
    (D.fieldInertia_le_frobeniusFixedField K L hLK σ) a
  let B := D.frobeniusQuotientRepresentation A K.field L hLK
  have hfix : B.ρ σ.1 aI = aI := by
    change D.frobeniusQuotientAction A K.field L hLK σ.1 aI = aI
    exact D.frobeniusQuotientAction_fixedFieldInclusion A K L hLK σ a
  have hinv : B.ρ σ.1⁻¹ aI = aI := by
    have hmul : B.ρ (σ.1⁻¹ * σ.1) aI = aI := by
      rw [inv_mul_cancel, map_one]
      rfl
    rw [map_mul] at hmul
    change B.ρ σ.1⁻¹ (B.ρ σ.1 aI) = aI at hmul
    rw [hfix] at hmul
    exact hmul
  change B.ρ
      (φ.1 ^ D.frobeniusExponent K L hLK σ * σ.1⁻¹) aI =
    B.ρ (φ.1 ^ D.frobeniusExponent K L hLK σ) aI
  rw [map_mul]
  change B.ρ (φ.1 ^ D.frobeniusExponent K L hLK σ) (B.ρ σ.1⁻¹ aI) =
    B.ρ (φ.1 ^ D.frobeniusExponent K L hLK σ) aI
  rw [hinv]
end DegreeData
end fixedFieldRemainderActions
end
end ClassFormation
end

/- ClassFieldTheory.AbstractClassFieldTheory.Reciprocity.Construction.MainMultiplicativity.ConjugatePrimeNorm -/
section
universe u
namespace ClassFormation
open KummerTheory
open CyclicCohomology
noncomputable section
open CategoryTheory
section conjugatePrimeNorms
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
namespace DegreeData

theorem exists_primeElement_frobeniusActionConjugate_norm_eq
    (D : DegreeData G) (A : Rep ℤ G) (v : ValuationData D A)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    (K : FiniteAbstractField G) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    [hLfinite : Finite (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK)]
    (φ σ : D.FrobeniusElements
      (K.toFiniteResidueAbstractField D) L hLK) (m : ℕ)
    (π : ambientFixedAddSubgroup A
      (D.frobeniusFixedField (K.toFiniteResidueAbstractField D) L hLK σ))
    (hπ :
      let KR := K.toFiniteResidueAbstractField D
      let Sigma : FiniteAbstractField G :=
        ⟨D.frobeniusFixedField KR L hLK σ,
          D.frobeniusFixedField_absoluteFinite K L hLK σ⟩
      v.IsPrimeElement Sigma π) :
    let KR := K.toFiniteResidueAbstractField D
    let σ' := D.frobeniusActionConjugate KR L hLK φ σ m
    let S := D.frobeniusFixedField KR L hLK σ
    let S' := D.frobeniusFixedField KR L hLK σ'
    let hSK := D.frobeniusFixedField_le KR L hLK σ
    let hS'K := D.frobeniusFixedField_le KR L hLK σ'
    letI : Finite (K.field.toSubgroup ⧸ extensionSubgroup K.field S hSK) :=
      D.frobeniusFixedField_finite KR L hLK σ
    letI : Finite (K.field.toSubgroup ⧸ extensionSubgroup K.field S' hS'K) :=
      D.frobeniusFixedField_finite KR L hLK σ'
    let Sigma' : FiniteAbstractField G :=
      ⟨S', D.frobeniusFixedField_absoluteFinite K L hLK σ'⟩
    ∃ π' : ambientFixedAddSubgroup A S',
      v.IsPrimeElement Sigma' π' ∧
        relativeNorm A K.field S' hS'K π' =
          relativeNorm A K.field S hSK π := by
  dsimp only
  let KR := K.toFiniteResidueAbstractField D
  let hLnormalKR : (extensionSubgroup KR.field L hLK).Normal := by
    simpa only [KR, FiniteAbstractField.toFiniteResidueAbstractField] using hLnormal
  let hLfiniteKR : Finite
      (KR.field.toSubgroup ⧸ extensionSubgroup KR.field L hLK) := by
    simpa only [KR, FiniteAbstractField.toFiniteResidueAbstractField] using hLfinite
  let σ' := D.frobeniusActionConjugate KR L hLK φ σ m
  let S := D.frobeniusFixedField KR L hLK σ
  let S' := D.frobeniusFixedField KR L hLK σ'
  let hSK := D.frobeniusFixedField_le KR L hLK σ
  let hS'K := D.frobeniusFixedField_le KR L hLK σ'
  let hSfinite : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field S hSK) :=
    D.frobeniusFixedField_finite KR L hLK σ
  let hS'finite : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field S' hS'K) :=
    D.frobeniusFixedField_finite KR L hLK σ'
  let hSabsolute : Finite ((baseField G).toSubgroup ⧸
      extensionSubgroup (baseField G) S (le_baseField S)) :=
    D.frobeniusFixedField_absoluteFinite K L hLK σ
  let hS'absolute : Finite ((baseField G).toSubgroup ⧸
      extensionSubgroup (baseField G) S' (le_baseField S')) :=
    D.frobeniusFixedField_absoluteFinite K L hLK σ'
  let Sigma : FiniteAbstractField G := ⟨S, hSabsolute⟩
  let Sigma' : FiniteAbstractField G := ⟨S', hS'absolute⟩
  let q := φ.1 ^ m
  let k : K.field.toSubgroup := Quotient.out q
  let s : G := k.1⁻¹
  let C := conjugateClosedSubgroup S s
  let Kc := conjugateClosedSubgroup K.field s
  let hCS := conjugateClosedSubgroup_mono hSK s
  have hC : C = S' := by
    simpa [C, S, S', σ', q, k, s] using
      D.conjugate_frobeniusFixedField_actionConjugate KR L hLK φ σ m
  have hKc : Kc = K.field := by
    ext x
    change x ∈ conjugateClosedSubgroup K.field s ↔ x ∈ K.field
    rw [conjugateClosedSubgroup_mem]
    constructor
    · intro hx
      change x ∈ K.field.toSubgroup
      simpa [s, mul_assoc] using K.field.toSubgroup.mul_mem
        (K.field.toSubgroup.mul_mem k.2 hx) (K.field.toSubgroup.inv_mem k.2)
    · intro hx
      change s * x * s⁻¹ ∈ K.field.toSubgroup
      simpa [s] using K.field.toSubgroup.mul_mem
        (K.field.toSubgroup.mul_mem (K.field.toSubgroup.inv_mem k.2) hx) k.2
  let hCabsolute : Finite ((baseField G).toSubgroup ⧸
      extensionSubgroup (baseField G) C (le_baseField C)) :=
    Finite.of_equiv
      ((baseField G).toSubgroup ⧸
        extensionSubgroup (baseField G) S (le_baseField S))
      (by
        simpa [C, baseField] using
          (absoluteConjugateCosetEquiv S s).symm)
  let SigmaC : FiniteAbstractField G := Sigma.conjugate s
  let πC : ambientFixedAddSubgroup A C :=
    conjugateFixedElement A S s π
  let π' : ambientFixedAddSubgroup A S' :=
    ⟨πC.1, by rw [← hC]; exact πC.2⟩
  have hπC : v.IsPrimeElement SigmaC πC := by
    change v.valuationAt Sigma π = v.oneValue at hπ
    change v.valuationAt SigmaC πC = v.oneValue
    have hconj : v.valuationAt SigmaC πC = v.valuationAt Sigma π := by
      simpa [C, SigmaC, Sigma, πC] using
        v.normalizedValuation_conjugate Sigma s π
    exact hconj.trans hπ
  have hπ' : v.IsPrimeElement Sigma' π' := by
    change v.valuationAt SigmaC πC = v.oneValue at hπC
    change v.valuationAt Sigma' π' = v.oneValue
    have valuation_transport
        (C₀ S₀ : FiniteAbstractField G)
        (h : C₀.field = S₀.field)
        (aC : ambientFixedAddSubgroup A C₀.field)
        (aS : ambientFixedAddSubgroup A S₀.field)
        (ha : aC.1 = aS.1) :
        v.valuationAt S₀ aS = v.valuationAt C₀ aC := by
      cases C₀ with
      | mk C₀ hC₀ =>
          cases S₀ with
          | mk S₀ hS₀ =>
              dsimp only at h
              subst S₀
              congr 1
              exact Subtype.ext ha.symm
    have hSigmaField : SigmaC.field = Sigma'.field := by
      change C = S'
      exact hC
    have hv : v.valuationAt Sigma' π' = v.valuationAt SigmaC πC :=
      valuation_transport SigmaC Sigma' hSigmaField πC π' rfl
    exact hv.trans hπC
  refine ⟨π', hπ', ?_⟩
  let hCSfinite : Finite
      (Kc.toSubgroup ⧸ extensionSubgroup Kc C hCS) :=
    finite_conjugateExtension K.field S hSK s
  have hnormC := relativeNorm_conjugate_apply A K.field S hSK s π
  apply Subtype.ext
  have relativeNorm_transport
      (K₀ K₁ L₀ L₁ : ClosedSubgroup G)
      (h₀ : L₀.toSubgroup ≤ K₀.toSubgroup)
      (h₁ : L₁.toSubgroup ≤ K₁.toSubgroup)
      [Finite (K₀.toSubgroup ⧸ extensionSubgroup K₀ L₀ h₀)]
      [Finite (K₁.toSubgroup ⧸ extensionSubgroup K₁ L₁ h₁)]
      (hK₀ : K₀ = K₁) (hL₀ : L₀ = L₁)
      (a₀ : ambientFixedAddSubgroup A L₀)
      (a₁ : ambientFixedAddSubgroup A L₁)
      (ha : a₀.1 = a₁.1) :
      ((relativeNorm A K₀ L₀ h₀ a₀ :
        ambientFixedAddSubgroup A K₀) : A.V) =
      ((relativeNorm A K₁ L₁ h₁ a₁ :
        ambientFixedAddSubgroup A K₁) : A.V) := by
    subst K₁
    subst L₁
    have ha' : a₀ = a₁ := Subtype.ext ha
    subst a₁
    rfl
  have hleft :
      ((relativeNorm A K.field S' hS'K π' :
        ambientFixedAddSubgroup A K.field) : A.V) =
      ((relativeNorm A Kc C hCS πC :
        ambientFixedAddSubgroup A Kc) : A.V) := by
    exact (relativeNorm_transport Kc K.field C S' hCS hS'K
      hKc hC πC π' rfl).symm
  calc
    ((relativeNorm A K.field S' hS'K π' :
        ambientFixedAddSubgroup A K.field) : A.V) =
        ((relativeNorm A Kc C hCS πC :
          ambientFixedAddSubgroup A Kc) : A.V) := hleft
    _ = ((conjugateFixedElement A K.field s
        (relativeNorm A K.field S hSK π) :
          ambientFixedAddSubgroup A Kc) : A.V) :=
      congrArg Subtype.val hnormC
    _ = ((relativeNorm A K.field S hSK π :
        ambientFixedAddSubgroup A K.field) : A.V) := by
      rw [conjugateFixedElement_coe]
      have hs : s⁻¹ = k.1 := by simp [s]
      rw [hs]
      change A.ρ k.1 (relativeNorm A K.field S hSK π).1 =
        (relativeNorm A K.field S hSK π).1
      exact (relativeNorm A K.field S hSK π).2 k
end DegreeData
end conjugatePrimeNorms
end
end ClassFormation
end

/- ClassFieldTheory.AbstractClassFieldTheory.Reciprocity.Construction.MainMultiplicativity.CorrectionSum -/
section
universe u
namespace ClassFormation
open KummerTheory
open CyclicCohomology
noncomputable section
open CategoryTheory
open scoped BigOperators

def frobeniusMultiplicativityCorrectionTerm
    {R : IntegralRepGroupType} [Group R]
    (B : Rep ℤ R) (τ₁ : R) (p₁ p₃ p₄ : B.V) : Fin 3 → B.V :=
  ![p₄ - p₃, p₁ - p₃, p₃ - B.ρ τ₁ p₃]

def frobeniusMultiplicativityCorrectionAction {R : Type*} [Group R]
    (τ₁ τ₄ : R) : Fin 3 → R :=
  ![τ₄, τ₁, τ₄]
section correctionActionDegrees
variable {G : Type u} [Group G] [TopologicalSpace G]
namespace DegreeData

theorem frobeniusMultiplicativityCorrectionAction_mem_degreeKernel
    (D : DegreeData G)
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (φ σ₁ σ₂ : D.FrobeniusElements K L hLK)
    (hφ : D.frobeniusExponent K L hLK φ = 1) :
    let σ₄ := D.frobeniusActionConjugate K L hLK φ σ₂
      (D.frobeniusExponent K L hLK σ₁)
    let τ₁ := D.frobeniusActionRemainder K L hLK φ σ₁
    let τ₄ := D.frobeniusActionRemainder K L hLK φ σ₄
    ∀ i : Fin 3,
      frobeniusMultiplicativityCorrectionAction τ₁ τ₄ i ∈
        (D.extensionNormalizedDegreeContinuous K L hLK).toMonoidHom.ker := by
  dsimp only
  let σ₄ := D.frobeniusActionConjugate K L hLK φ σ₂
    (D.frobeniusExponent K L hLK σ₁)
  let τ₁ := D.frobeniusActionRemainder K L hLK φ σ₁
  let τ₄ := D.frobeniusActionRemainder K L hLK φ σ₄
  have hτ₁ := D.frobeniusActionRemainder_mem_degreeKernel
    K L hLK φ σ₁ hφ
  have hτ₄ := D.frobeniusActionRemainder_mem_degreeKernel
    K L hLK φ σ₄ hφ
  intro i
  fin_cases i
  · exact hτ₄
  · exact hτ₁
  · exact hτ₄
end DegreeData
end correctionActionDegrees

theorem frobeniusMultiplicativity_actionDifference_eq_correctionSum
    {R : IntegralRepGroupType} [Group R] (B : Rep ℤ R)
    (τ₁ τ₄ : R) (p₁ p₃ p₄ : B.V) :
    (B.ρ τ₄ p₄ - p₄) + (B.ρ τ₁ p₁ - p₁) +
        (p₃ - B.ρ (τ₄ * τ₁) p₃) =
      ∑ i : Fin 3,
        (B.ρ (frobeniusMultiplicativityCorrectionAction τ₁ τ₄ i)
          (frobeniusMultiplicativityCorrectionTerm B τ₁ p₁ p₃ p₄ i) -
          frobeniusMultiplicativityCorrectionTerm B τ₁ p₁ p₃ p₄ i) := by
  have hmul : B.ρ (τ₄ * τ₁) p₃ = B.ρ τ₄ (B.ρ τ₁ p₃) := by
    rw [map_mul]
    rfl
  rw [hmul]
  simp [frobeniusMultiplicativityCorrectionAction,
    frobeniusMultiplicativityCorrectionTerm, Fin.sum_univ_succ, map_sub]
  abel
end
end ClassFormation
end

/- ClassFieldTheory.AbstractClassFieldTheory.Reciprocity.Construction.MainMultiplicativity.PrimeUnitDifferences -/
section
universe u
namespace ClassFormation
open KummerTheory
open CyclicCohomology
noncomputable section
open CategoryTheory
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
namespace DegreeData

theorem frobeniusPrimeDifference_mem_infiniteUnitAddSubgroup
    (D : DegreeData G) (A : Rep ℤ G) (v : ValuationData D A)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    [TotallyDisconnectedSpace G]
    (K : FiniteAbstractField G) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    [hLfinite : Finite (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK)]
    (σ τ : D.FrobeniusElements
      (K.toFiniteResidueAbstractField D) L hLK)
    (πσ : ambientFixedAddSubgroup A
      (D.frobeniusFixedField (K.toFiniteResidueAbstractField D) L hLK σ))
    (πτ : ambientFixedAddSubgroup A
      (D.frobeniusFixedField (K.toFiniteResidueAbstractField D) L hLK τ))
    (hπσ :
      let KR := K.toFiniteResidueAbstractField D
      let Sigma : FiniteAbstractField G :=
        ⟨D.frobeniusFixedField KR L hLK σ,
          D.frobeniusFixedField_absoluteFinite K L hLK σ⟩
      v.IsPrimeElement Sigma πσ)
    (hπτ :
      let KR := K.toFiniteResidueAbstractField D
      let Tau : FiniteAbstractField G :=
        ⟨D.frobeniusFixedField KR L hLK τ,
          D.frobeniusFixedField_absoluteFinite K L hLK τ⟩
      v.IsPrimeElement Tau πτ) :
    let KR := K.toFiniteResidueAbstractField D
    let E := D.maximalUnramifiedField L
    let pσ := fixedFieldInclusion A
      (D.frobeniusFixedField KR L hLK σ) E
      (D.fieldInertia_le_frobeniusFixedField KR L hLK σ) πσ
    let pτ := fixedFieldInclusion A
      (D.frobeniusFixedField KR L hLK τ) E
      (D.fieldInertia_le_frobeniusFixedField KR L hLK τ) πτ
    pσ - pτ ∈ v.infiniteUnitAddSubgroup E K
      (D.maximalUnramifiedField_le_of_le hLK) := by
  dsimp only
  let KR := K.toFiniteResidueAbstractField D
  let hLnormalKR : (extensionSubgroup KR.field L hLK).Normal := by
    simpa only [KR, FiniteAbstractField.toFiniteResidueAbstractField] using hLnormal
  let hLfiniteKR : Finite
      (KR.field.toSubgroup ⧸ extensionSubgroup KR.field L hLK) := by
    simpa only [KR, FiniteAbstractField.toFiniteResidueAbstractField] using hLfinite
  let E := D.maximalUnramifiedField L
  let S := D.frobeniusFixedField KR L hLK σ
  let T := D.frobeniusFixedField KR L hLK τ
  let hSK : S.toSubgroup ≤ K.field.toSubgroup :=
    D.frobeniusFixedField_le KR L hLK σ
  let hTK : T.toSubgroup ≤ K.field.toSubgroup :=
    D.frobeniusFixedField_le KR L hLK τ
  let M := D.frobeniusFixedIntermediateField KR L hLK σ
  let N := D.frobeniusFixedIntermediateField KR L hLK τ
  let P := M.compositum N
  let hPS : P.field.toSubgroup ≤ S.toSubgroup :=
    M.compositum_le_left N
  let hPT : P.field.toSubgroup ≤ T.toSubgroup :=
    M.compositum_le_right N
  let hSabsolute : Finite ((baseField G).toSubgroup ⧸
      extensionSubgroup (baseField G) S (le_baseField S)) :=
    D.frobeniusFixedField_absoluteFinite K L hLK σ
  let hTabsolute : Finite ((baseField G).toSubgroup ⧸
      extensionSubgroup (baseField G) T (le_baseField T)) :=
    D.frobeniusFixedField_absoluteFinite K L hLK τ
  let Sigma : FiniteAbstractField G := ⟨S, hSabsolute⟩
  let Tau : FiniteAbstractField G := ⟨T, hTabsolute⟩
  let hPfinite : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field P.field P.below) := P.finite
  let Pi : FiniteAbstractField G := P.toFiniteAbstractField K
  let hPSfinite : Finite
      (S.toSubgroup ⧸ extensionSubgroup S P.field hPS) :=
    FiniteIntermediateField.finite_extension_of_le P.below hSK hPS
  let hPTfinite : Finite
      (T.toSubgroup ⧸ extensionSubgroup T P.field hPT) :=
    FiniteIntermediateField.finite_extension_of_le P.below hTK hPT
  let EPS : FiniteAbstractFieldExtension G :=
    { field := Pi
      base := Sigma
      below := hPS
      finiteQuotient := hPSfinite }
  let EPT : FiniteAbstractFieldExtension G :=
    { field := Pi
      base := Tau
      below := hPT
      finiteQuotient := hPTfinite }
  have hPSunramified :
      EPS.IsUnramified D := by
    change D.fieldInertia S ≤ P.field.toSubgroup
    have hSI : D.fieldInertia S = D.fieldInertia L := by
      simpa [S] using
        D.frobeniusFixedField_fieldInertia KR L hLK σ
    rw [hSI]
    exact P.above
  have hPTunramified :
      EPT.IsUnramified D := by
    change D.fieldInertia T ≤ P.field.toSubgroup
    have hTI : D.fieldInertia T = D.fieldInertia L := by
      simpa [T] using
        D.frobeniusFixedField_fieldInertia KR L hLK τ
    rw [hTI]
    exact P.above
  let πσP := fixedFieldInclusion A S P.field hPS πσ
  let πτP := fixedFieldInclusion A T P.field hPT πτ
  have hπσP : v.IsPrimeElement Pi πσP := by
    exact v.prime_of_unramified EPS hPSunramified πσ hπσ
  have hπτP : v.IsPrimeElement Pi πτP := by
    exact v.prime_of_unramified EPT hPTunramified πτ hπτ
  let uP : v.unitAddSubgroup Pi :=
    ⟨πσP - πτP,
      v.sub_mem_unitAddSubgroup_of_prime Pi hπτP hπσP⟩
  rw [v.mem_infiniteUnitAddSubgroup_iff]
  refine ⟨P, uP, ?_⟩
  apply Subtype.ext
  rfl

theorem frobeniusPrime_actionDifference_mem_infiniteUnitAddSubgroup
    (D : DegreeData G) (A : Rep ℤ G) (v : ValuationData D A)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    [TotallyDisconnectedSpace G]
    (K : FiniteAbstractField G) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    [hLfinite : Finite (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK)]
    (σ : D.FrobeniusElements (K.toFiniteResidueAbstractField D) L hLK)
    (π : ambientFixedAddSubgroup A
      (D.frobeniusFixedField (K.toFiniteResidueAbstractField D) L hLK σ))
    (hπ :
      let KR := K.toFiniteResidueAbstractField D
      let Sigma : FiniteAbstractField G :=
        ⟨D.frobeniusFixedField KR L hLK σ,
          D.frobeniusFixedField_absoluteFinite K L hLK σ⟩
      v.IsPrimeElement Sigma π)
    (q : K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK) :
    let KR := K.toFiniteResidueAbstractField D
    let E := D.maximalUnramifiedField L
    let p := fixedFieldInclusion A
      (D.frobeniusFixedField KR L hLK σ) E
      (D.fieldInertia_le_frobeniusFixedField KR L hLK σ) π
    p - D.frobeniusQuotientAction A K.field L hLK q p ∈
      v.infiniteUnitAddSubgroup E K
        (D.maximalUnramifiedField_le_of_le hLK) := by
  dsimp only
  let KR := K.toFiniteResidueAbstractField D
  let hLnormalKR : (extensionSubgroup KR.field L hLK).Normal := by
    simpa only [KR, FiniteAbstractField.toFiniteResidueAbstractField] using hLnormal
  let hLfiniteKR : Finite
      (KR.field.toSubgroup ⧸ extensionSubgroup KR.field L hLK) := by
    simpa only [KR, FiniteAbstractField.toFiniteResidueAbstractField] using hLfinite
  let E := D.maximalUnramifiedField L
  let S := D.frobeniusFixedField KR L hLK σ
  let hSK : S.toSubgroup ≤ K.field.toSubgroup :=
    D.frobeniusFixedField_le KR L hLK σ
  let M := D.frobeniusFixedIntermediateField KR L hLK σ
  let hEnormal : (extensionSubgroup K.field E
      (D.maximalUnramifiedField_le_of_le hLK)).Normal :=
    D.extensionSubgroup_maximalUnramifiedField_normal K.field L hLK
  let P := M.galoisRefinement
  let hPS : P.field.toSubgroup ≤ S.toSubgroup :=
    M.galoisRefinement_le_field
  let hSabsolute : Finite ((baseField G).toSubgroup ⧸
      extensionSubgroup (baseField G) S (le_baseField S)) :=
    D.frobeniusFixedField_absoluteFinite K L hLK σ
  let Sigma : FiniteAbstractField G := ⟨S, hSabsolute⟩
  let hPfinite : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field P.field P.below) := P.finite
  let Pi : FiniteAbstractField G := P.toFiniteAbstractField K
  let hPSfinite : Finite
      (S.toSubgroup ⧸ extensionSubgroup S P.field hPS) :=
    FiniteIntermediateField.finite_extension_of_le P.below hSK hPS
  let hPnormal : (extensionSubgroup K.field P.field P.below).Normal := by
    exact FiniteIntermediateField.galoisRefinement_normal M
  let EPS : FiniteAbstractFieldExtension G :=
    { field := Pi
      base := Sigma
      below := hPS
      finiteQuotient := hPSfinite }
  let EPK : FiniteAbstractFieldExtension G :=
    { field := Pi
      base := K
      below := P.below
      finiteQuotient := hPfinite }
  have hPSunramified :
      EPS.IsUnramified D := by
    change D.fieldInertia S ≤ P.field.toSubgroup
    have hSI : D.fieldInertia S = D.fieldInertia L := by
      simpa [S] using
        D.frobeniusFixedField_fieldInertia KR L hLK σ
    rw [hSI]
    exact P.above
  let πP := fixedFieldInclusion A S P.field hPS π
  have hπP : v.IsPrimeElement Pi πP := by
    exact v.prime_of_unramified EPS hPSunramified π hπ
  let k : K.field.toSubgroup := Quotient.out q
  let πqP := normalExtensionAction A K.field P.field P.below hPnormal k πP
  have hπqP : v.IsPrimeElement Pi πqP := by
    change v.valuationAt Pi πP = v.oneValue at hπP
    change v.valuationAt Pi πqP = v.oneValue
    calc
      v.valuationAt Pi πqP = v.valuationAt Pi πP := by
        have hvaluation :=
          v.valuationAt_normalExtensionAction EPK hPnormal k πP
        change v.valuationAt Pi
            (normalExtensionAction A K.field P.field P.below hPnormal k πP) =
          v.valuationAt Pi πP at hvaluation
        exact hvaluation
      _ = v.oneValue := hπP
  let uP : v.unitAddSubgroup Pi :=
    ⟨πP - πqP,
      v.sub_mem_unitAddSubgroup_of_prime Pi hπqP hπP⟩
  rw [v.mem_infiniteUnitAddSubgroup_iff]
  refine ⟨P, uP, ?_⟩
  have hkq : (QuotientGroup.mk k :
      K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK) = q :=
    Quotient.out_eq' q
  rw [← hkq, D.frobeniusQuotientAction_mk]
  apply Subtype.ext
  rfl
end DegreeData
end
end ClassFormation
end

/- ClassFieldTheory.AbstractClassFieldTheory.Reciprocity.Construction.MainMultiplicativity.FiniteStageCorrections -/
section
universe u
namespace ClassFormation
open KummerTheory
open CyclicCohomology
noncomputable section
open CategoryTheory
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
namespace DegreeData

theorem frobeniusPowerSum_alternating_mem_infiniteUnitAddSubgroup
    (D : DegreeData G) (A : Rep ℤ G) (v : ValuationData D A)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    [TotallyDisconnectedSpace G]
    (K : FiniteAbstractField G) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    [hLfinite : Finite (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK)]
    (φ σ₁ σ₂ : D.FrobeniusElements
      (K.toFiniteResidueAbstractField D) L hLK)
    (π₁ : ambientFixedAddSubgroup A
      (D.frobeniusFixedField (K.toFiniteResidueAbstractField D) L hLK σ₁))
    (π₃ : ambientFixedAddSubgroup A
      (D.frobeniusFixedField (K.toFiniteResidueAbstractField D) L hLK
        (σ₁ * σ₂)))
    (π₄ : ambientFixedAddSubgroup A
      (D.frobeniusFixedField (K.toFiniteResidueAbstractField D) L hLK
        (D.frobeniusActionConjugate (K.toFiniteResidueAbstractField D)
          L hLK φ σ₂
          (D.frobeniusExponent (K.toFiniteResidueAbstractField D)
            L hLK σ₁))))
    (hπ₁ :
      let KR := K.toFiniteResidueAbstractField D
      let Sigma1 : FiniteAbstractField G :=
        ⟨D.frobeniusFixedField KR L hLK σ₁,
          D.frobeniusFixedField_absoluteFinite K L hLK σ₁⟩
      v.IsPrimeElement Sigma1 π₁)
    (hπ₃ :
      let KR := K.toFiniteResidueAbstractField D
      let Sigma3 : FiniteAbstractField G :=
        ⟨D.frobeniusFixedField KR L hLK (σ₁ * σ₂),
          D.frobeniusFixedField_absoluteFinite K L hLK (σ₁ * σ₂)⟩
      v.IsPrimeElement Sigma3 π₃)
    (hπ₄ :
      let KR := K.toFiniteResidueAbstractField D
      let σ₄ := D.frobeniusActionConjugate KR L hLK φ σ₂
        (D.frobeniusExponent KR L hLK σ₁)
      let Sigma4 : FiniteAbstractField G :=
        ⟨D.frobeniusFixedField KR L hLK σ₄,
          D.frobeniusFixedField_absoluteFinite K L hLK σ₄⟩
      v.IsPrimeElement Sigma4 π₄) :
    let KR := K.toFiniteResidueAbstractField D
    let σ₃ := σ₁ * σ₂
    let σ₄ := D.frobeniusActionConjugate KR L hLK φ σ₂
      (D.frobeniusExponent KR L hLK σ₁)
    let p₁ := fixedFieldInclusion A
      (D.frobeniusFixedField KR L hLK σ₁)
      (D.maximalUnramifiedField L)
      (D.fieldInertia_le_frobeniusFixedField KR L hLK σ₁) π₁
    let p₃ := fixedFieldInclusion A
      (D.frobeniusFixedField KR L hLK σ₃)
      (D.maximalUnramifiedField L)
      (D.fieldInertia_le_frobeniusFixedField KR L hLK σ₃) π₃
    let p₄ := fixedFieldInclusion A
      (D.frobeniusFixedField KR L hLK σ₄)
      (D.maximalUnramifiedField L)
      (D.fieldInertia_le_frobeniusFixedField KR L hLK σ₄) π₄
    let u := D.frobeniusPowerSum A KR.field L hLK φ.1
        (D.frobeniusExponent KR L hLK σ₄) p₄ +
      D.frobeniusPowerSum A KR.field L hLK φ.1
        (D.frobeniusExponent KR L hLK σ₁) p₁ -
      D.frobeniusPowerSum A KR.field L hLK φ.1
        (D.frobeniusExponent KR L hLK σ₃) p₃
    u ∈ v.infiniteUnitAddSubgroup (D.maximalUnramifiedField L) K
      (D.maximalUnramifiedField_le_of_le hLK) := by
  dsimp only
  let KR := K.toFiniteResidueAbstractField D
  let hLnormalKR : (extensionSubgroup KR.field L hLK).Normal := by
    simpa only [KR, FiniteAbstractField.toFiniteResidueAbstractField] using hLnormal
  let hLfiniteKR : Finite
      (KR.field.toSubgroup ⧸ extensionSubgroup KR.field L hLK) := by
    simpa only [KR, FiniteAbstractField.toFiniteResidueAbstractField] using hLfinite
  let σ₃ := σ₁ * σ₂
  let σ₄ := D.frobeniusActionConjugate KR L hLK φ σ₂
    (D.frobeniusExponent KR L hLK σ₁)
  let p₁ := fixedFieldInclusion A
    (D.frobeniusFixedField KR L hLK σ₁)
    (D.maximalUnramifiedField L)
    (D.fieldInertia_le_frobeniusFixedField KR L hLK σ₁) π₁
  let p₃ := fixedFieldInclusion A
    (D.frobeniusFixedField KR L hLK σ₃)
    (D.maximalUnramifiedField L)
    (D.fieldInertia_le_frobeniusFixedField KR L hLK σ₃) π₃
  let p₄ := fixedFieldInclusion A
    (D.frobeniusFixedField KR L hLK σ₄)
    (D.maximalUnramifiedField L)
    (D.fieldInertia_le_frobeniusFixedField KR L hLK σ₄) π₄
  let n₁ := D.frobeniusExponent KR L hLK σ₁
  let n₃ := D.frobeniusExponent KR L hLK σ₃
  let n₄ := D.frobeniusExponent KR L hLK σ₄
  let U := v.infiniteUnitAddSubgroup (D.maximalUnramifiedField L) K
    (D.maximalUnramifiedField_le_of_le hLK)
  have h₄₃ : p₄ - p₃ ∈ U := by
    exact D.frobeniusPrimeDifference_mem_infiniteUnitAddSubgroup
      A v K L hLK σ₄ σ₃ π₄ π₃ hπ₄ hπ₃
  have h₁₃ : p₁ - p₃ ∈ U := by
    exact D.frobeniusPrimeDifference_mem_infiniteUnitAddSubgroup
      A v K L hLK σ₁ σ₃ π₁ π₃ hπ₁ hπ₃
  have h₃action : p₃ - D.frobeniusQuotientAction A KR.field L hLK
      (φ.1 ^ n₄) p₃ ∈ U := by
    exact D.frobeniusPrime_actionDifference_mem_infiniteUnitAddSubgroup
      A v K L hLK σ₃ π₃ hπ₃ (φ.1 ^ n₄)
  have h₁shift : p₁ - D.frobeniusQuotientAction A KR.field L hLK
      (φ.1 ^ n₄) p₃ ∈ U := by
    have heq : p₁ - D.frobeniusQuotientAction A KR.field L hLK
        (φ.1 ^ n₄) p₃ = (p₁ - p₃) +
          (p₃ - D.frobeniusQuotientAction A KR.field L hLK
            (φ.1 ^ n₄) p₃) := by
      abel
    rw [heq]
    exact U.add_mem h₁₃ h₃action
  have hn₃ : n₃ = n₄ + n₁ := by
    simp [n₁, n₃, n₄, σ₃, σ₄, Nat.add_comm]
  let u := D.frobeniusPowerSum A KR.field L hLK φ.1 n₄ p₄ +
    D.frobeniusPowerSum A KR.field L hLK φ.1 n₁ p₁ -
    D.frobeniusPowerSum A KR.field L hLK φ.1 n₃ p₃
  have huEq : u =
      D.frobeniusPowerSum A KR.field L hLK φ.1 n₄ (p₄ - p₃) +
      D.frobeniusPowerSum A KR.field L hLK φ.1 n₁
        (p₁ - D.frobeniusQuotientAction A KR.field L hLK
          (φ.1 ^ n₄) p₃) := by
    dsimp [u]
    rw [D.frobeniusPowerSum_sub_universalNormDescent,
      D.frobeniusPowerSum_sub_universalNormDescent, hn₃,
      D.frobeniusPowerSum_add]
    abel
  have hsum₄₃ : D.frobeniusPowerSum A KR.field L hLK φ.1 n₄
      (p₄ - p₃) ∈ U :=
    v.frobeniusPowerSum_mem_infiniteUnit_universalNormDescent
      K L hLK φ.1 n₄ (p₄ - p₃) h₄₃
  have hsum₁ : D.frobeniusPowerSum A KR.field L hLK φ.1 n₁
      (p₁ - D.frobeniusQuotientAction A KR.field L hLK
        (φ.1 ^ n₄) p₃) ∈ U :=
    v.frobeniusPowerSum_mem_infiniteUnit_universalNormDescent
      K L hLK φ.1 n₁ _ h₁shift
  rw [show D.frobeniusPowerSum A KR.field L hLK φ.1 n₄ p₄ +
      D.frobeniusPowerSum A KR.field L hLK φ.1 n₁ p₁ -
      D.frobeniusPowerSum A KR.field L hLK φ.1 n₃ p₃ = u from rfl,
    huEq]
  exact U.add_mem hsum₄₃ hsum₁

theorem frobeniusCorrectionTerms_mem_infiniteUnitAddSubgroup
    (D : DegreeData G) (A : Rep ℤ G) (v : ValuationData D A)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    [TotallyDisconnectedSpace G]
    (K : FiniteAbstractField G) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    [hLfinite : Finite (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK)]
    (φ σ₁ σ₂ : D.FrobeniusElements
      (K.toFiniteResidueAbstractField D) L hLK)
    (π₁ : ambientFixedAddSubgroup A
      (D.frobeniusFixedField (K.toFiniteResidueAbstractField D) L hLK σ₁))
    (π₃ : ambientFixedAddSubgroup A
      (D.frobeniusFixedField (K.toFiniteResidueAbstractField D) L hLK
        (σ₁ * σ₂)))
    (π₄ : ambientFixedAddSubgroup A
      (D.frobeniusFixedField (K.toFiniteResidueAbstractField D) L hLK
        (D.frobeniusActionConjugate (K.toFiniteResidueAbstractField D)
          L hLK φ σ₂
          (D.frobeniusExponent (K.toFiniteResidueAbstractField D)
            L hLK σ₁))))
    (hπ₁ :
      let KR := K.toFiniteResidueAbstractField D
      let Sigma1 : FiniteAbstractField G :=
        ⟨D.frobeniusFixedField KR L hLK σ₁,
          D.frobeniusFixedField_absoluteFinite K L hLK σ₁⟩
      v.IsPrimeElement Sigma1 π₁)
    (hπ₃ :
      let KR := K.toFiniteResidueAbstractField D
      let Sigma3 : FiniteAbstractField G :=
        ⟨D.frobeniusFixedField KR L hLK (σ₁ * σ₂),
          D.frobeniusFixedField_absoluteFinite K L hLK (σ₁ * σ₂)⟩
      v.IsPrimeElement Sigma3 π₃)
    (hπ₄ :
      let KR := K.toFiniteResidueAbstractField D
      let σ₄ := D.frobeniusActionConjugate KR L hLK φ σ₂
        (D.frobeniusExponent KR L hLK σ₁)
      let Sigma4 : FiniteAbstractField G :=
        ⟨D.frobeniusFixedField KR L hLK σ₄,
          D.frobeniusFixedField_absoluteFinite K L hLK σ₄⟩
      v.IsPrimeElement Sigma4 π₄) :
    let KR := K.toFiniteResidueAbstractField D
    let σ₃ := σ₁ * σ₂
    let σ₄ := D.frobeniusActionConjugate KR L hLK φ σ₂
      (D.frobeniusExponent KR L hLK σ₁)
    let p₁ := fixedFieldInclusion A
      (D.frobeniusFixedField KR L hLK σ₁)
      (D.maximalUnramifiedField L)
      (D.fieldInertia_le_frobeniusFixedField KR L hLK σ₁) π₁
    let p₃ := fixedFieldInclusion A
      (D.frobeniusFixedField KR L hLK σ₃)
      (D.maximalUnramifiedField L)
      (D.fieldInertia_le_frobeniusFixedField KR L hLK σ₃) π₃
    let p₄ := fixedFieldInclusion A
      (D.frobeniusFixedField KR L hLK σ₄)
      (D.maximalUnramifiedField L)
      (D.fieldInertia_le_frobeniusFixedField KR L hLK σ₄) π₄
    let τ₁ := D.frobeniusActionRemainder KR L hLK φ σ₁
    ∀ i : Fin 3,
      (![p₄ - p₃, p₁ - p₃,
          p₃ - D.frobeniusQuotientAction A KR.field L hLK τ₁ p₃] :
        Fin 3 → ambientFixedAddSubgroup A
          (D.maximalUnramifiedField L)) i ∈
        v.infiniteUnitAddSubgroup (D.maximalUnramifiedField L) K
      (D.maximalUnramifiedField_le_of_le hLK) := by
  dsimp only
  let KR := K.toFiniteResidueAbstractField D
  let hLnormalKR : (extensionSubgroup KR.field L hLK).Normal := by
    simpa only [KR, FiniteAbstractField.toFiniteResidueAbstractField] using hLnormal
  let hLfiniteKR : Finite
      (KR.field.toSubgroup ⧸ extensionSubgroup KR.field L hLK) := by
    simpa only [KR, FiniteAbstractField.toFiniteResidueAbstractField] using hLfinite
  let σ₃ := σ₁ * σ₂
  let σ₄ := D.frobeniusActionConjugate KR L hLK φ σ₂
    (D.frobeniusExponent KR L hLK σ₁)
  let p₁ := fixedFieldInclusion A
    (D.frobeniusFixedField KR L hLK σ₁)
    (D.maximalUnramifiedField L)
    (D.fieldInertia_le_frobeniusFixedField KR L hLK σ₁) π₁
  let p₃ := fixedFieldInclusion A
    (D.frobeniusFixedField KR L hLK σ₃)
    (D.maximalUnramifiedField L)
    (D.fieldInertia_le_frobeniusFixedField KR L hLK σ₃) π₃
  let p₄ := fixedFieldInclusion A
    (D.frobeniusFixedField KR L hLK σ₄)
    (D.maximalUnramifiedField L)
    (D.fieldInertia_le_frobeniusFixedField KR L hLK σ₄) π₄
  let τ₁ := D.frobeniusActionRemainder KR L hLK φ σ₁
  have h₄₃ := D.frobeniusPrimeDifference_mem_infiniteUnitAddSubgroup
    A v K L hLK σ₄ σ₃ π₄ π₃ hπ₄ hπ₃
  have h₁₃ := D.frobeniusPrimeDifference_mem_infiniteUnitAddSubgroup
    A v K L hLK σ₁ σ₃ π₁ π₃ hπ₁ hπ₃
  have h₃action :=
    D.frobeniusPrime_actionDifference_mem_infiniteUnitAddSubgroup
      A v K L hLK σ₃ π₃ hπ₃ τ₁
  intro i
  fin_cases i
  · change p₄ - p₃ ∈ _
    exact h₄₃
  · change p₁ - p₃ ∈ _
    exact h₁₃
  · change p₃ - D.frobeniusQuotientAction A KR.field L hLK τ₁ p₃ ∈ _
    exact h₃action
end DegreeData
end
end ClassFormation
end

/- ClassFieldTheory.AbstractClassFieldTheory.Reciprocity.Construction.MainMultiplicativity.FrobeniusPowerSumRelation -/
section
universe u
namespace ClassFormation
open KummerTheory
open CyclicCohomology
noncomputable section
open CategoryTheory
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
namespace DegreeData

theorem frobeniusPowerSum_mul_action_sub (D : DegreeData G) (A : Rep ℤ G)
    [IsTopologicalGroup G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (φ σ₁ σ₂ : D.FrobeniusElements K L hLK)
    (π₁ : ambientFixedAddSubgroup A
      (D.frobeniusFixedField K L hLK σ₁))
    (π₃ : ambientFixedAddSubgroup A
      (D.frobeniusFixedField K L hLK (σ₁ * σ₂)))
    (π₄ : ambientFixedAddSubgroup A
      (D.frobeniusFixedField K L hLK
        (D.frobeniusActionConjugate K L hLK φ σ₂
          (D.frobeniusExponent K L hLK σ₁)))) :
    let σ₃ := σ₁ * σ₂
    let σ₄ := D.frobeniusActionConjugate K L hLK φ σ₂
      (D.frobeniusExponent K L hLK σ₁)
    let p₁ := fixedFieldInclusion A
      (D.frobeniusFixedField K L hLK σ₁)
      (D.maximalUnramifiedField L)
      (D.fieldInertia_le_frobeniusFixedField K L hLK σ₁) π₁
    let p₃ := fixedFieldInclusion A
      (D.frobeniusFixedField K L hLK σ₃)
      (D.maximalUnramifiedField L)
      (D.fieldInertia_le_frobeniusFixedField K L hLK σ₃) π₃
    let p₄ := fixedFieldInclusion A
      (D.frobeniusFixedField K L hLK σ₄)
      (D.maximalUnramifiedField L)
      (D.fieldInertia_le_frobeniusFixedField K L hLK σ₄) π₄
    let τ₁ := D.frobeniusActionRemainder K L hLK φ σ₁
    let τ₄ := D.frobeniusActionRemainder K L hLK φ σ₄
    let u := D.frobeniusPowerSum A K.field L hLK φ.1
        (D.frobeniusExponent K L hLK σ₄) p₄ +
      D.frobeniusPowerSum A K.field L hLK φ.1
        (D.frobeniusExponent K L hLK σ₁) p₁ -
      D.frobeniusPowerSum A K.field L hLK φ.1
        (D.frobeniusExponent K L hLK σ₃) p₃
    D.frobeniusQuotientAction A K.field L hLK φ.1 u - u =
      (D.frobeniusQuotientAction A K.field L hLK τ₄ p₄ - p₄) +
      (D.frobeniusQuotientAction A K.field L hLK τ₁ p₁ - p₁) +
      (p₃ - D.frobeniusQuotientAction A K.field L hLK (τ₄ * τ₁) p₃) := by
  let σ₃ := σ₁ * σ₂
  let σ₄ := D.frobeniusActionConjugate K L hLK φ σ₂
    (D.frobeniusExponent K L hLK σ₁)
  let p₁ := fixedFieldInclusion A
    (D.frobeniusFixedField K L hLK σ₁)
    (D.maximalUnramifiedField L)
    (D.fieldInertia_le_frobeniusFixedField K L hLK σ₁) π₁
  let p₃ := fixedFieldInclusion A
    (D.frobeniusFixedField K L hLK σ₃)
    (D.maximalUnramifiedField L)
    (D.fieldInertia_le_frobeniusFixedField K L hLK σ₃) π₃
  let p₄ := fixedFieldInclusion A
    (D.frobeniusFixedField K L hLK σ₄)
    (D.maximalUnramifiedField L)
    (D.fieldInertia_le_frobeniusFixedField K L hLK σ₄) π₄
  let s₁ := D.frobeniusPowerSum A K.field L hLK φ.1
    (D.frobeniusExponent K L hLK σ₁) p₁
  let s₃ := D.frobeniusPowerSum A K.field L hLK φ.1
    (D.frobeniusExponent K L hLK σ₃) p₃
  let s₄ := D.frobeniusPowerSum A K.field L hLK φ.1
    (D.frobeniusExponent K L hLK σ₄) p₄
  let τ₁ := D.frobeniusActionRemainder K L hLK φ σ₁
  let τ₃ := D.frobeniusActionRemainder K L hLK φ σ₃
  let τ₄ := D.frobeniusActionRemainder K L hLK φ σ₄
  have h₁ :
      D.frobeniusQuotientAction A K.field L hLK τ₁ p₁ =
        D.frobeniusQuotientAction A K.field L hLK
          (φ.1 ^ D.frobeniusExponent K L hLK σ₁) p₁ := by
    exact D.frobeniusActionRemainder_apply_fixedField
      A K L hLK φ σ₁ π₁
  have h₃ :
      D.frobeniusQuotientAction A K.field L hLK τ₃ p₃ =
        D.frobeniusQuotientAction A K.field L hLK
          (φ.1 ^ D.frobeniusExponent K L hLK σ₃) p₃ := by
    exact D.frobeniusActionRemainder_apply_fixedField
      A K L hLK φ σ₃ π₃
  have h₄ :
      D.frobeniusQuotientAction A K.field L hLK τ₄ p₄ =
        D.frobeniusQuotientAction A K.field L hLK
          (φ.1 ^ D.frobeniusExponent K L hLK σ₄) p₄ := by
    exact D.frobeniusActionRemainder_apply_fixedField
      A K L hLK φ σ₄ π₄
  have hτ : τ₃ = τ₄ * τ₁ := by
    exact D.frobeniusActionRemainder_mul K L hLK φ σ₁ σ₂
  change
    D.frobeniusQuotientAction A K.field L hLK φ.1
          (s₄ + s₁ - s₃) - (s₄ + s₁ - s₃) =
      (D.frobeniusQuotientAction A K.field L hLK τ₄ p₄ - p₄) +
        (D.frobeniusQuotientAction A K.field L hLK τ₁ p₁ - p₁) +
        (p₃ -
          D.frobeniusQuotientAction A K.field L hLK (τ₄ * τ₁) p₃)
  have hmap :
      D.frobeniusQuotientAction A K.field L hLK φ.1 (s₄ + s₁ - s₃) =
        D.frobeniusQuotientAction A K.field L hLK φ.1 s₄ +
          D.frobeniusQuotientAction A K.field L hLK φ.1 s₁ -
          D.frobeniusQuotientAction A K.field L hLK φ.1 s₃ := by
    change
      D.frobeniusQuotientActionLinearMap A K.field L hLK φ.1
          (s₄ + s₁ - s₃) =
        D.frobeniusQuotientActionLinearMap A K.field L hLK φ.1 s₄ +
          D.frobeniusQuotientActionLinearMap A K.field L hLK φ.1 s₁ -
          D.frobeniusQuotientActionLinearMap A K.field L hLK φ.1 s₃
    rw [map_sub, map_add]
  rw [hmap]
  calc
    _ =
        (D.frobeniusQuotientAction A K.field L hLK φ.1 s₄ - s₄) +
          (D.frobeniusQuotientAction A K.field L hLK φ.1 s₁ - s₁) -
          (D.frobeniusQuotientAction A K.field L hLK φ.1 s₃ - s₃) := by
      abel
    _ =
        (D.frobeniusQuotientAction A K.field L hLK
            (φ.1 ^ D.frobeniusExponent K L hLK σ₄) p₄ - p₄) +
          (D.frobeniusQuotientAction A K.field L hLK
            (φ.1 ^ D.frobeniusExponent K L hLK σ₁) p₁ - p₁) -
          (D.frobeniusQuotientAction A K.field L hLK
            (φ.1 ^ D.frobeniusExponent K L hLK σ₃) p₃ - p₃) := by
      dsimp only [s₁, s₃, s₄]
      rw [D.frobeniusPowerSum_action_sub,
        D.frobeniusPowerSum_action_sub,
        D.frobeniusPowerSum_action_sub]
    _ =
        (D.frobeniusQuotientAction A K.field L hLK τ₄ p₄ - p₄) +
          (D.frobeniusQuotientAction A K.field L hLK τ₁ p₁ - p₁) +
          (p₃ -
            D.frobeniusQuotientAction A K.field L hLK (τ₄ * τ₁) p₃) := by
      rw [← h₄, ← h₁, ← h₃, hτ]
      abel
end DegreeData
end
end ClassFormation
end

/- ClassFieldTheory.AbstractClassFieldTheory.Reciprocity.Construction.MainMultiplicativity.NormClassRelation -/
section
universe u
namespace ClassFormation
open KummerTheory
open CyclicCohomology
noncomputable section
open CategoryTheory
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
namespace DegreeData

theorem relativeNorm_frobeniusPowerSum_alternating
    (D : DegreeData G) (A : Rep ℤ G)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    [TotallyDisconnectedSpace G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    [hLfinite : Finite (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK)]
    (φ σ₁ σ₂ : D.FrobeniusElements K L hLK)
    (hφ : D.frobeniusExponent K L hLK φ = 1)
    (π₁ : ambientFixedAddSubgroup A
      (D.frobeniusFixedField K L hLK σ₁))
    (π₃ : ambientFixedAddSubgroup A
      (D.frobeniusFixedField K L hLK (σ₁ * σ₂)))
    (π₄ : ambientFixedAddSubgroup A
      (D.frobeniusFixedField K L hLK
        (D.frobeniusActionConjugate K L hLK φ σ₂
          (D.frobeniusExponent K L hLK σ₁)))) :
    let σ₃ := σ₁ * σ₂
    let σ₄ := D.frobeniusActionConjugate K L hLK φ σ₂
      (D.frobeniusExponent K L hLK σ₁)
    let S₁ := D.frobeniusFixedField K L hLK σ₁
    let S₃ := D.frobeniusFixedField K L hLK σ₃
    let S₄ := D.frobeniusFixedField K L hLK σ₄
    let hS₁K := D.frobeniusFixedField_le K L hLK σ₁
    let hS₃K := D.frobeniusFixedField_le K L hLK σ₃
    let hS₄K := D.frobeniusFixedField_le K L hLK σ₄
    let p₁ := fixedFieldInclusion A S₁ (D.maximalUnramifiedField L)
      (D.fieldInertia_le_frobeniusFixedField K L hLK σ₁) π₁
    let p₃ := fixedFieldInclusion A S₃ (D.maximalUnramifiedField L)
      (D.fieldInertia_le_frobeniusFixedField K L hLK σ₃) π₃
    let p₄ := fixedFieldInclusion A S₄ (D.maximalUnramifiedField L)
      (D.fieldInertia_le_frobeniusFixedField K L hLK σ₄) π₄
    let u := D.frobeniusPowerSum A K.field L hLK φ.1
        (D.frobeniusExponent K L hLK σ₄) p₄ +
      D.frobeniusPowerSum A K.field L hLK φ.1
        (D.frobeniusExponent K L hLK σ₁) p₁ -
      D.frobeniusPowerSum A K.field L hLK φ.1
        (D.frobeniusExponent K L hLK σ₃) p₃
    letI : Finite (K.field.toSubgroup ⧸ extensionSubgroup K.field S₁ hS₁K) :=
      D.frobeniusFixedField_finite K L hLK σ₁
    letI : Finite (K.field.toSubgroup ⧸ extensionSubgroup K.field S₃ hS₃K) :=
      D.frobeniusFixedField_finite K L hLK σ₃
    letI : Finite (K.field.toSubgroup ⧸ extensionSubgroup K.field S₄ hS₄K) :=
      D.frobeniusFixedField_finite K L hLK σ₄
    letI : Finite
        ((D.maximalUnramifiedField K.field).toSubgroup ⧸
          extensionSubgroup (D.maximalUnramifiedField K.field)
            (D.maximalUnramifiedField L)
            (D.maximalUnramifiedField_mono hLK)) :=
      D.maximalUnramifiedExtension_finite K.field L hLK
    ((relativeNorm A (D.maximalUnramifiedField K.field)
      (D.maximalUnramifiedField L) (D.maximalUnramifiedField_mono hLK) u :
        ambientFixedAddSubgroup A (D.maximalUnramifiedField K.field)) : A.V) =
      ((relativeNorm A K.field S₄ hS₄K π₄ +
        relativeNorm A K.field S₁ hS₁K π₁ -
        relativeNorm A K.field S₃ hS₃K π₃ :
          ambientFixedAddSubgroup A K.field) : A.V) := by
  dsimp only
  let σ₃ := σ₁ * σ₂
  let σ₄ := D.frobeniusActionConjugate K L hLK φ σ₂
    (D.frobeniusExponent K L hLK σ₁)
  let S₁ := D.frobeniusFixedField K L hLK σ₁
  let S₃ := D.frobeniusFixedField K L hLK σ₃
  let S₄ := D.frobeniusFixedField K L hLK σ₄
  let hS₁K := D.frobeniusFixedField_le K L hLK σ₁
  let hS₃K := D.frobeniusFixedField_le K L hLK σ₃
  let hS₄K := D.frobeniusFixedField_le K L hLK σ₄
  let p₁ := fixedFieldInclusion A S₁ (D.maximalUnramifiedField L)
    (D.fieldInertia_le_frobeniusFixedField K L hLK σ₁) π₁
  let p₃ := fixedFieldInclusion A S₃ (D.maximalUnramifiedField L)
    (D.fieldInertia_le_frobeniusFixedField K L hLK σ₃) π₃
  let p₄ := fixedFieldInclusion A S₄ (D.maximalUnramifiedField L)
    (D.fieldInertia_le_frobeniusFixedField K L hLK σ₄) π₄
  let s₁ := D.frobeniusPowerSum A K.field L hLK φ.1
    (D.frobeniusExponent K L hLK σ₁) p₁
  let s₃ := D.frobeniusPowerSum A K.field L hLK φ.1
    (D.frobeniusExponent K L hLK σ₃) p₃
  let s₄ := D.frobeniusPowerSum A K.field L hLK φ.1
    (D.frobeniusExponent K L hLK σ₄) p₄
  let u := s₄ + s₁ - s₃
  let hS₁finite : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field S₁ hS₁K) :=
    D.frobeniusFixedField_finite K L hLK σ₁
  let hS₃finite : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field S₃ hS₃K) :=
    D.frobeniusFixedField_finite K L hLK σ₃
  let hS₄finite : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field S₄ hS₄K) :=
    D.frobeniusFixedField_finite K L hLK σ₄
  let hIfinite : Finite
      ((D.maximalUnramifiedField K.field).toSubgroup ⧸
        extensionSubgroup (D.maximalUnramifiedField K.field)
          (D.maximalUnramifiedField L)
          (D.maximalUnramifiedField_mono hLK)) :=
    D.maximalUnramifiedExtension_finite K.field L hLK
  have h₁ := (D.frobeniusNormIdentities A K L hLK φ σ₁ hφ π₁).1
  have h₃ := (D.frobeniusNormIdentities A K L hLK φ σ₃ hφ π₃).1
  have h₄ := (D.frobeniusNormIdentities A K L hLK φ σ₄ hφ π₄).1
  let N := relativeNorm A (D.maximalUnramifiedField K.field)
    (D.maximalUnramifiedField L) (D.maximalUnramifiedField_mono hLK)
  change ((N (s₄ + s₁ - s₃) :
      ambientFixedAddSubgroup A (D.maximalUnramifiedField K.field)) : A.V) = _
  rw [map_sub, map_add]
  change (N s₄).1 + (N s₁).1 - (N s₃).1 = _
  rw [← h₄, ← h₁, ← h₃]
  rfl
end DegreeData
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
end
end TunnellAbstractNormCoordinates
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
variable (D : DegreeData G) (A : Rep ℤ G) (V : ValuationData D A)
    (K : FiniteAbstractField G) (E : FiniteGaloisSubextension K.field)
local instance : (extensionSubgroup K.field E.field E.below).Normal := E.normal
local instance : Finite (K.field.toSubgroup ⧸ extensionSubgroup K.field E.field E.below) := E.finite
end
end TunnellFrobeniusNormalization
end

/- TunnellCoboundaryUnitCoordinates -/
section
namespace TunnellCoboundaryUnitCoordinates
open ClassFormation KummerTheory CyclicCohomology TunnellAbstractNormCoordinates
open TunnellFrobeniusCoordinates TunnellFrobeniusNormalization
open scoped Classical
noncomputable section
variable {G : Type} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
  [TotallyDisconnectedSpace G]
variable (D : DegreeData G) (A : Rep ℤ G) (V : ValuationData D A)
abbrev UnitAt (H X : ClosedSubgroup G) (x : A.V) :=
  ∃ F : ClosedSubgroup G, X ≤ F ∧ F ≤ H ∧ (U F).FiniteIndex ∧
    ∃ (w : B A F) (a : B A (baseField G)), w.val = x ∧ tr A (baseField G) F x = a.val ∧
      TunnellProfiniteCoordinate.equiv (V.toAddMonoidHom a) = 0
theorem unit_iff (K : FiniteAbstractField G) (b : ambientFixedAddSubgroup A K.field) :
    b ∈ V.unitAddSubgroup K ↔ TunnellProfiniteCoordinate.equiv (V.toAddMonoidHom (normToBase A K.field b)) = 0 := by
  rw [TunnellProfiniteCoordinate.equiv.map_eq_zero_iff,V.mem_unitAddSubgroup_iff]
  have hb := V.residueDegree_nsmul_dividedAt K b
  constructor
  · intro h
    have hv : V.dividedAt K b = 0 := congrArg Subtype.val h
    change V.normCompositeAt K b = 0
    rw [← hb,hv,nsmul_zero]
  · intro h
    apply Subtype.ext
    apply zHatMulNat_injective (K.residueDegree D).property
    change (K.residueDegree D : ℕ) • V.dividedAt K b = (K.residueDegree D : ℕ) • (0 : ZHat)
    rw [hb,nsmul_zero]
    exact h
set_option maxHeartbeats 1000000 in
theorem supports (K : FiniteAbstractField G) (X : ClosedSubgroup G) (h : X ≤ K.field)
    (x : A.V) : UnitAt D A V K.field X x ↔ ∃ b : V.infiniteUnitAddSubgroup X K h, b.val.val = x := by
  constructor
  · rintro ⟨F,hXF,hFK,hF,w,a,rfl,ha,hzero⟩
    letI : (U F).FiniteIndex := hF
    let F' := finiteField F
    letI := F'.finite
    let M : FiniteIntermediateField X K.field := ⟨F,hXF,hFK, inferInstanceAs (Finite (U K.field ⧸ M K.field F))⟩
    have e : normToBase A F w = a := Subtype.ext ((tr_eq A _ F _ w).symm.trans ha)
    have z : TunnellProfiniteCoordinate.equiv (V.toAddMonoidHom (normToBase A F w)) = 0 :=
      (congrArg (fun y => TunnellProfiniteCoordinate.equiv (V.toAddMonoidHom y)) e).trans hzero
    have mw := (unit_iff D A V (M.toFiniteAbstractField K) w).mpr z
    exact ⟨⟨fixedFieldInclusion A F X hXF w, M,⟨w,mw⟩,rfl⟩,rfl⟩
  · rintro ⟨⟨b,M,w,hw⟩,hx⟩
    let F := M.toFiniteAbstractField K
    letI : Finite (U (baseField G) ⧸ TunnellAbstractNormCoordinates.M (baseField G) M.field) := F.finite
    have eq : w.val.val = x := (congrArg Subtype.val hw).trans hx
    refine ⟨M.field,M.above,M.below,finite_index F,w.val,normToBase A M.field w.val,eq,?_,?_⟩
    · rw [← eq]
      exact tr_eq A _ M.field _ w.val
    · exact (unit_iff D A V F w.val).mp w.property
theorem inertia_eq (H : ClosedSubgroup G) :
    U (D.maximalUnramifiedField H) = U H ⊓ (coordinate D).ker := by
  ext g
  change (_ ∧ D.degree g = 1) ↔ (_ ∧ TunnellAbstractValueCoordinates.e (D.degree g) = 1)
  rw [TunnellAbstractValueCoordinates.e.map_eq_one_iff]
end
end TunnellCoboundaryUnitCoordinates
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

/- TunnellPrimeProductCoboundary -/
section
namespace ClassFormation.DegreeData
open KummerTheory CyclicCohomology
open scoped Classical
noncomputable section
variable {G : Type} [Group G] [TopologicalSpace G]
theorem primeProductCoboundary
    (D : DegreeData G) (A : Rep ℤ G) (v : ValuationData D A)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    [TotallyDisconnectedSpace G]
    (K : FiniteAbstractField G) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    [hLfinite : Finite (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK)]
    (sigma1 sigma2 : D.FrobeniusElements
      (K.toFiniteResidueAbstractField D) L hLK) :
    let KR := K.toFiniteResidueAbstractField D
    let S (s : D.FrobeniusElements KR L hLK) := D.frobeniusFixedField KR L hLK s
    let F (s : D.FrobeniusElements KR L hLK) : FiniteAbstractField G :=
      ⟨S s, D.frobeniusFixedField_absoluteFinite K L hLK s⟩
    let X := D.maximalUnramifiedField L
    let Y := D.maximalUnramifiedField K.field
    let H := D.maximalUnramifiedField_le_of_le hLK
    letI := D.maximalUnramifiedExtension_finite K.field L hLK
    let norm (s : D.FrobeniusElements KR L hLK) (b : ambientFixedAddSubgroup A (S s)) :=
      letI : Finite (K.field.toSubgroup ⧸ extensionSubgroup K.field (S s) (D.frobeniusFixedField_le KR L hLK s)) :=
        D.frobeniusFixedField_finite KR L hLK s
      relativeNorm A K.field (S s) (D.frobeniusFixedField_le KR L hLK s) b
    ∀ (pi1 : ambientFixedAddSubgroup A (S sigma1)) (pi2 : ambientFixedAddSubgroup A (S sigma2))
      (pi3 : ambientFixedAddSubgroup A (S (sigma1*sigma2))),
      v.IsPrimeElement (F sigma1) pi1 → v.IsPrimeElement (F sigma2) pi2 →
      v.IsPrimeElement (F (sigma1*sigma2)) pi3 →
      ∃ (φ : D.FrobeniusElements KR L hLK) (τ : Fin 3 →
        (D.extensionNormalizedDegreeContinuous KR L hLK).toMonoidHom.ker)
        (u : v.infiniteUnitAddSubgroup X K H) (w : Fin 3 → v.infiniteUnitAddSubgroup X K H),
        D.frobeniusExponent KR L hLK φ = 1 ∧
        D.frobeniusQuotientAction A K.field L hLK φ.val u.val - u.val =
          ∑ i, (D.frobeniusQuotientAction A K.field L hLK (τ i).val (w i).val - (w i).val) ∧
        (relativeNorm A Y X (D.maximalUnramifiedField_mono hLK) u.val).val =
          (norm sigma1 pi1 + norm sigma2 pi2 - norm (sigma1*sigma2) pi3).val := by
  dsimp only
  intro pi1 pi2 pi3 hpi1 hpi2 hpi3
  let KR := K.toFiniteResidueAbstractField D
  let hLnormalKR : (extensionSubgroup KR.field L hLK).Normal := by
    simpa only [KR, FiniteAbstractField.toFiniteResidueAbstractField] using hLnormal
  let hLfiniteKR : Finite
      (KR.field.toSubgroup ⧸ extensionSubgroup KR.field L hLK) := by
    simpa only [KR, FiniteAbstractField.toFiniteResidueAbstractField] using hLfinite
  let phi := D.chosenDegreeOneFrobeniusElement KR L hLK
  have hphi : D.frobeniusExponent KR L hLK phi = 1 :=
    D.frobeniusExponent_chosenDegreeOneFrobeniusElement KR L hLK
  let sigma3 := sigma1 * sigma2
  let m := D.frobeniusExponent KR L hLK sigma1
  let sigma4 := D.frobeniusActionConjugate KR L hLK phi sigma2 m
  let S1 := D.frobeniusFixedField KR L hLK sigma1
  let S2 := D.frobeniusFixedField KR L hLK sigma2
  let S3 := D.frobeniusFixedField KR L hLK sigma3
  let S4 := D.frobeniusFixedField KR L hLK sigma4
  let hS1K := D.frobeniusFixedField_le KR L hLK sigma1
  let hS2K := D.frobeniusFixedField_le KR L hLK sigma2
  let hS3K := D.frobeniusFixedField_le KR L hLK sigma3
  let hS4K := D.frobeniusFixedField_le KR L hLK sigma4
  let hS1finite : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field S1 hS1K) :=
    D.frobeniusFixedField_finite KR L hLK sigma1
  let hS2finite : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field S2 hS2K) :=
    D.frobeniusFixedField_finite KR L hLK sigma2
  let hS3finite : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field S3 hS3K) :=
    D.frobeniusFixedField_finite KR L hLK sigma3
  let hS4finite : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field S4 hS4K) :=
    D.frobeniusFixedField_finite KR L hLK sigma4
  let hS1absolute : Finite ((baseField G).toSubgroup ⧸
      extensionSubgroup (baseField G) S1 (le_baseField S1)) :=
    D.frobeniusFixedField_absoluteFinite K L hLK sigma1
  let hS2absolute : Finite ((baseField G).toSubgroup ⧸
      extensionSubgroup (baseField G) S2 (le_baseField S2)) :=
    D.frobeniusFixedField_absoluteFinite K L hLK sigma2
  let hS3absolute : Finite ((baseField G).toSubgroup ⧸
      extensionSubgroup (baseField G) S3 (le_baseField S3)) :=
    D.frobeniusFixedField_absoluteFinite K L hLK sigma3
  let hS4absolute : Finite ((baseField G).toSubgroup ⧸
      extensionSubgroup (baseField G) S4 (le_baseField S4)) :=
    D.frobeniusFixedField_absoluteFinite K L hLK sigma4
  let Sigma1 : FiniteAbstractField G := ⟨S1, hS1absolute⟩
  let Sigma2 : FiniteAbstractField G := ⟨S2, hS2absolute⟩
  let Sigma3 : FiniteAbstractField G := ⟨S3, hS3absolute⟩
  obtain ⟨pi4, hpi4, hnorm42⟩ :=
    D.exists_primeElement_frobeniusActionConjugate_norm_eq A v K L hLK
      phi sigma2 m pi2 hpi2
  let E := D.maximalUnramifiedField L
  let I := D.maximalUnramifiedField KR.field
  let hEI := D.maximalUnramifiedField_mono hLK
  let p1 := fixedFieldInclusion A S1 E
    (D.fieldInertia_le_frobeniusFixedField KR L hLK sigma1) pi1
  let p3 := fixedFieldInclusion A S3 E
    (D.fieldInertia_le_frobeniusFixedField KR L hLK sigma3) pi3
  let p4 := fixedFieldInclusion A S4 E
    (D.fieldInertia_le_frobeniusFixedField KR L hLK sigma4) pi4
  let u := D.frobeniusPowerSum A KR.field L hLK phi.1
        (D.frobeniusExponent KR L hLK sigma4) p4 +
      D.frobeniusPowerSum A KR.field L hLK phi.1
        (D.frobeniusExponent KR L hLK sigma1) p1 -
      D.frobeniusPowerSum A KR.field L hLK phi.1
        (D.frobeniusExponent KR L hLK sigma3) p3
  let tau1 := D.frobeniusActionRemainder KR L hLK phi sigma1
  let tau4 := D.frobeniusActionRemainder KR L hLK phi sigma4
  let B := D.frobeniusQuotientRepresentation A KR.field L hLK
  let correction : Fin 3 → ambientFixedAddSubgroup A E :=
    frobeniusMultiplicativityCorrectionTerm B tau1 p1 p3 p4
  have hcorrectionMem : ∀ i : Fin 3,
      correction i ∈ v.infiniteUnitAddSubgroup E K
        (D.maximalUnramifiedField_le_of_le hLK) := by
    have hmem :=
      D.frobeniusCorrectionTerms_mem_infiniteUnitAddSubgroup
        A v K L hLK phi sigma1 sigma2 pi1 pi3 pi4 hpi1 hpi3 hpi4
    change ∀ i : Fin 3,
      (![p4 - p3, p1 - p3,
          p3 - D.frobeniusQuotientAction A KR.field L hLK tau1 p3] :
        Fin 3 → ambientFixedAddSubgroup A E) i ∈
          v.infiniteUnitAddSubgroup E K
            (D.maximalUnramifiedField_le_of_le hLK)
    change ∀ i : Fin 3,
      (![p4 - p3, p1 - p3,
          p3 - D.frobeniusQuotientAction A KR.field L hLK tau1 p3] :
        Fin 3 → ambientFixedAddSubgroup A E) i ∈
          v.infiniteUnitAddSubgroup E K
            (D.maximalUnramifiedField_le_of_le hLK) at hmem
    exact hmem
  have huMem : u ∈ v.infiniteUnitAddSubgroup E K
      (D.maximalUnramifiedField_le_of_le hLK) := by
    simpa [u, p1, p3, p4, E, S1, S3, S4, sigma3, sigma4, m] using
      D.frobeniusPowerSum_alternating_mem_infiniteUnitAddSubgroup
        A v K L hLK phi sigma1 sigma2 pi1 pi3 pi4 hpi1 hpi3 hpi4
  have hactionMem :=
    D.frobeniusMultiplicativityCorrectionAction_mem_degreeKernel
      KR L hLK phi sigma1 sigma2 hphi
  let tau : Fin 3 →
      (D.extensionNormalizedDegreeContinuous KR L hLK).toMonoidHom.ker :=
    fun i ↦ ⟨frobeniusMultiplicativityCorrectionAction tau1 tau4 i, by
      simpa [tau1, tau4, sigma4, m] using hactionMem i⟩
  let uU : v.infiniteUnitAddSubgroup E K
      (D.maximalUnramifiedField_le_of_le hLK) := ⟨u, huMem⟩
  let uiU : Fin 3 → v.infiniteUnitAddSubgroup E K
      (D.maximalUnramifiedField_le_of_le hLK) :=
    fun i ↦ ⟨correction i, hcorrectionMem i⟩
  have hraw := D.frobeniusPowerSum_mul_action_sub A KR L hLK
    phi sigma1 sigma2 pi1 pi3 pi4
  have hdiff :=
    frobeniusMultiplicativity_actionDifference_eq_correctionSum
      B tau1 tau4 p1 p3 p4
  change
      (D.frobeniusQuotientAction A KR.field L hLK tau4 p4 - p4) +
          (D.frobeniusQuotientAction A KR.field L hLK tau1 p1 - p1) +
        (p3 - D.frobeniusQuotientAction A KR.field L hLK (tau4 * tau1) p3) =
      ∑ i : Fin 3,
        (D.frobeniusQuotientAction A KR.field L hLK
            (frobeniusMultiplicativityCorrectionAction tau1 tau4 i)
            (correction i) - correction i) at hdiff
  have hstar :
      D.frobeniusQuotientAction A KR.field L hLK phi.1 uU.1 - uU.1 =
        ∑ i ∈ (Finset.univ : Finset (Fin 3)),
          (D.frobeniusQuotientAction A KR.field L hLK (tau i).1 (uiU i).1 -
            (uiU i).1) := by
    change D.frobeniusQuotientAction A KR.field L hLK phi.1 u - u = _
    rw [show D.frobeniusQuotientAction A KR.field L hLK phi.1 u - u =
      (D.frobeniusQuotientAction A KR.field L hLK tau4 p4 - p4) +
      (D.frobeniusQuotientAction A KR.field L hLK tau1 p1 - p1) +
      (p3 - D.frobeniusQuotientAction A KR.field L hLK (tau4 * tau1) p3) by
        simpa [u, p1, p3, p4, tau1, tau4, sigma3, sigma4, m,
          E, S1, S3, S4] using hraw]
    simpa only [tau, uiU, correction, B,
      D.frobeniusQuotientRepresentation_apply] using hdiff
  let hIfinite : Finite
      (I.toSubgroup ⧸ extensionSubgroup I E hEI) :=
    D.maximalUnramifiedExtension_finite KR.field L hLK
  refine ⟨phi, tau, uU, uiU, hphi, ?_, ?_⟩
  · simpa only [KR,FiniteAbstractField.toFiniteResidueAbstractField] using hstar
  · have e := D.relativeNorm_frobeniusPowerSum_alternating A KR L hLK
      phi sigma1 sigma2 hphi pi1 pi3 pi4
    dsimp only at e
    refine e.trans ?_
    apply congrArg Subtype.val
    let r1 := relativeNorm A K.field S1 hS1K pi1
    let r2 := relativeNorm A K.field S2 hS2K pi2
    let r3 := relativeNorm A K.field S3 hS3K pi3
    let r4 := relativeNorm A K.field S4 hS4K pi4
    change r4 + r1 - r3 = r1 + r2 - r3
    have eq42 : r4 = r2 := by simpa only [r4,r2,S4,S2,sigma4,m] using hnorm42
    rw [eq42,add_comm]
end
end ClassFormation.DegreeData
end

/- TunnellPositivePrimeCoordinates -/
section
namespace TunnellPositivePrimeCoordinates
open ClassFormation KummerTheory CyclicCohomology TunnellAbstractNormCoordinates
open TunnellFrobeniusCoordinates TunnellFrobeniusNormalization
open scoped Classical
noncomputable section
variable {G : Type} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
  [TotallyDisconnectedSpace G]
variable (D : DegreeData G) (A : Rep ℤ G) (V : ValuationData D A)
  (K : FiniteAbstractField G) (E : FiniteGaloisSubextension K.field)
local instance : (extensionSubgroup K.field E.field E.below).Normal := E.normal
local instance : Finite (K.field.toSubgroup ⧸ extensionSubgroup K.field E.field E.below) := E.finite
abbrev Pos := D.FrobeniusElements (K.toFiniteResidueAbstractField D) E.field E.below
abbrev fixedField (s : Pos D K E) : FiniteAbstractField G :=
  ⟨D.frobeniusFixedField (K.toFiniteResidueAbstractField D) E.field E.below s,D.frobeniusFixedField_absoluteFinite K E.field E.below s⟩
abbrev primeNorm (s : Pos D K E) (b : B A (fixedField D K E s).field) : B A K.field :=
  letI : Finite (U K.field ⧸ M K.field (fixedField D K E s).field) := D.frobeniusFixedField_finite (K.toFiniteResidueAbstractField D) E.field E.below s
  relativeNorm A K.field (fixedField D K E s).field (D.frobeniusFixedField_le (K.toFiniteResidueAbstractField D) E.field E.below s) b
abbrev PrimeRelation (t : U K.field) (x : A.V) :=
  ∃ (s : Pos D K E) (b : B A (fixedField D K E s).field), s.val = QuotientGroup.mk t ∧
    V.IsPrimeElement (fixedField D K E s) b ∧ (primeNorm D A K E s b).val = x
abbrev NativeRelation (t : U K.field) (x : A.V) :=
  let d := coordinate D
  ∃ (n : ℕ+) (F : ClosedSubgroup G) (b : B A F) (a : B A (baseField G)),
    (d t.val).toAdd = ((U K.field).map d).index • ((n : ℕ) : TunnellProfiniteCoordinate.Z) ∧
    U F = shape K.field (inertia d K.field E.field) t ∧
    tr A (baseField G) F b.val = a.val ∧ TunnellProfiniteCoordinate.equiv (V.toAddMonoidHom a) = (((U F).map d).index : TunnellProfiniteCoordinate.Z) ∧
    tr A K.field F b.val = x
theorem iff_prime (t : U K.field) (x : A.V) :
    NativeRelation D A V K E t x ↔ PrimeRelation D A V K E t x := by
  constructor
  · rintro ⟨n,F,b,a,deg,shp,ha,hb,hx⟩
    let s : Pos D K E := ⟨QuotientGroup.mk t,n,n.property,by
      apply Multiplicative.toAdd.injective
      change (D.normalizedDegree (K.toFiniteResidueAbstractField D) t).toAdd = _
      simpa using (degree_iff D K t n).mp deg⟩
    have f : F = (fixedField D K E s).field :=
      ClosedSubgroup.toSubgroup_injective (shp.trans (fixed D K E.field E.below t s rfl))
    subst F
    let S := fixedField D K E s
    letI := S.finite
    letI : Finite (U K.field ⧸ M K.field S.field) := D.frobeniusFixedField_finite (K.toFiniteResidueAbstractField D) E.field E.below s
    have eq : normToBase A S.field b = a :=
      Subtype.ext ((tr_eq A _ S.field (le_baseField S.field) b).symm.trans ha)
    refine ⟨s,b,rfl,(prime_iff D A V S b).mp (by rw [eq]; exact hb),?_⟩
    exact (tr_eq A K.field S.field _ b).symm.trans hx
  · rintro ⟨s,b,ht,hprime,rfl⟩
    obtain ⟨n,hn,deg⟩ := s.property
    let S := fixedField D K E s
    letI := S.finite
    letI : Finite (U K.field ⧸ M K.field S.field) := D.frobeniusFixedField_finite (K.toFiniteResidueAbstractField D) E.field E.below s
    refine ⟨⟨n,hn⟩,S.field,b,normToBase A S.field b,?_,(fixed D K E.field E.below t s ht).symm,
      tr_eq A _ S.field _ b,(prime_iff D A V S b).mpr hprime,tr_eq A K.field S.field _ b⟩
    apply (degree_iff D K t n).mpr
    rw [ht,D.extensionNormalizedDegree_mk] at deg
    simpa using congrArg Multiplicative.toAdd deg
end
end TunnellPositivePrimeCoordinates
end

/- TunnellPositiveCorrectionActual -/
section
namespace TunnellPositiveCorrectionActual
open ClassFormation KummerTheory CyclicCohomology TunnellAbstractNormCoordinates
open TunnellFrobeniusCoordinates TunnellFrobeniusNormalization TunnellPositivePrimeCoordinates
open TunnellCoboundaryUnitCoordinates
open scoped Classical
noncomputable section
set_option maxHeartbeats 1200000 in
theorem actual : OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1_H1_R1_H2_R1_H1_R1_H1_R1.H2 := by
  intro G A
  dsimp only
  intro d v cd sd vi vd vr
  obtain ⟨D,V,ed,ev⟩ := TunnellNativeValuationData.realize A d v cd sd vi vd (by
    intro H _ z
    constructor
    · rintro ⟨a,⟨b,hb⟩,ha⟩
      exact (vr H z).mp ⟨a,b,hb,ha⟩
    · intro hz
      obtain ⟨a,b,hb,ha⟩ := (vr H z).mpr hz
      exact ⟨a,⟨b,hb⟩,ha⟩)
  subst d v
  intro H J fi hj normal fin I L hI hL s t a b c ha hb hc
  let K := finiteField H
  let E : FiniteGaloisSubextension K.field := ⟨J,hj,normal,@Finite.of_fintype _ fin⟩
  let KR := K.toFiniteResidueAbstractField D
  letI : (extensionSubgroup K.field J hj).Normal := normal
  letI : Finite (U K.field ⧸ extensionSubgroup K.field J hj) := @Finite.of_fintype _ fin
  letI : (extensionSubgroup KR.field J hj).Normal := normal
  letI : Finite (U KR.field ⧸ extensionSubgroup KR.field J hj) := @Finite.of_fintype _ fin
  let X := D.maximalUnramifiedField J
  let Y := D.maximalUnramifiedField H
  have hI' : I = Y := ClosedSubgroup.toSubgroup_injective (hI.trans (TunnellCoboundaryUnitCoordinates.inertia_eq D H).symm)
  have hL' : L = X := ClosedSubgroup.toSubgroup_injective (hL.trans (TunnellCoboundaryUnitCoordinates.inertia_eq D J).symm)
  subst I L
  obtain ⟨α,p,hα,hp,rfl⟩ := (iff_prime D A V K E s a).mp ha
  obtain ⟨β,q,hβ,hq,rfl⟩ := (iff_prime D A V K E t b).mp hb
  obtain ⟨γ,r,hγ,hr,rfl⟩ := (iff_prime D A V K E (s*t) c).mp hc
  have hmul : γ = α * β := Subtype.ext (by
    change γ.val = α.val*β.val
    rw [hγ,hα,hβ]
    rfl)
  subst γ
  obtain ⟨φ,τ,u,w,one,eq,hx⟩ := D.primeProductCoboundary A V K J hj α β p q r hp hq hr
  let f := φ.val.out
  let l := QuotientGroup.mk' (D.extensionInertiaWithin H J hj)
  have eφ : l f = φ.val := Quotient.out_eq' _
  let g (i : Fin 3) := (τ i).val.out
  have eτ (i : Fin 3) : l (g i) = (τ i).val := Quotient.out_eq' _
  letI : Finite (U Y ⧸ M Y X) := D.maximalUnramifiedExtension_finite H J hj
  let hX := D.maximalUnramifiedField_le_of_le hj
  refine ⟨f,g,u.val.val,fun i => (w i).val.val,?_,?_,(supports D A V K X hX _).mpr ⟨u,rfl⟩,
    fun i => (supports D A V K X hX _).mpr ⟨w i,rfl⟩,?_,?_⟩
  · have eq := D.extensionNormalizedDegree_frobenius_eq_pow KR J hj φ
    rw [one,pow_one,← eφ] at eq
    change D.normalizedDegree KR f = Multiplicative.ofAdd (1 : ZHat) at eq
    have deg : (D.normalizedDegree KR f).toAdd = ((1 : ℕ) : ZHat) := by
      rw [eq]
      simp
    change (coordinate D f.val).toAdd = (((U K.field).map (coordinate D)).index : TunnellProfiniteCoordinate.Z)
    simpa only [Nat.cast_one,nsmul_eq_mul,mul_one] using (degree_iff D K f 1).mpr deg
  · intro i
    have eq := (τ i).property
    change D.extensionNormalizedDegree KR J hj (τ i).val = 1 at eq
    rw [← eτ i] at eq
    change D.normalizedDegree KR (g i) = 1 at eq
    have deg : (D.normalizedDegree KR (g i)).toAdd = ((0 : ℕ) : ZHat) := by
      rw [eq]
      simp
    apply Multiplicative.toAdd.injective
    simpa using (degree_iff D K (g i) 0).mpr deg
  · have h := congrArg Subtype.val eq
    have af : (D.frobeniusQuotientAction A K.field J hj (l f) u.val).val = A.ρ f.val u.val.val := rfl
    have ag (i : Fin 3) : (D.frobeniusQuotientAction A K.field J hj (l (g i)) (w i).val).val =
      A.ρ (g i).val (w i).val.val := rfl
    simpa only [← eφ,← eτ,AddSubgroup.coe_sub,AddSubmonoidClass.coe_finsetSum,af,ag] using h
  · exact (tr_eq A Y X _ u.val).trans hx
end
end TunnellPositiveCorrectionActual
end

theorem OMA.solution : OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1_H1_R1_H2_R1_H1_R1_H1_R1.H2 := TunnellPositiveCorrectionActual.actual
