import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1_H2_R1_H2_R1_H1_R1
import Mathlib

/-! The local Frobenius degree and Henselian valuation at finite places of number fields. Some declarations are adapted from ClassFieldTheory at revision 2e6280f9d2579705a0cc6c76ec68c2b60f9c601a, https://github.com/n-yamaguchi-0729/ClassFieldTheory. -/
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
 




noncomputable def intersectionIndexCardinal (L K : Subgroup G) : Cardinal :=
  Cardinal.mk (K ⧸ L.subgroupOf K)
 
noncomputable def relativeIndexCardinal {L K : Subgroup G} (_ : L ≤ K) : Cardinal :=
  intersectionIndexCardinal L K
 

theorem relativeIndexCardinal_eq_index_of_finite {L K : Subgroup G} (hLK : L ≤ K)
    [Finite (K ⧸ L.subgroupOf K)] :
    relativeIndexCardinal hLK = (L.relIndex K : Cardinal) := by
  rw [relativeIndexCardinal, intersectionIndexCardinal, Subgroup.relIndex, Subgroup.index]
  exact Nat.cast_card.symm
 
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
end ClassFormation
end

/- GaloisCohomology.ProfiniteIntegers.ProfiniteInteger -/
section
namespace ClassFormation
noncomputable section
 
def zHatMulNat (n : ℕ) : ContinuousAddMonoidHom ZHat ZHat where
  toFun := fun x => n • x
  map_zero' := nsmul_zero n
  map_add' := fun x y => nsmul_add x y n
  continuous_toFun := continuous_nsmul n
 
theorem isClosed_zHatMulNat_range (n : ℕ) :
    IsClosed ((zHatMulNat n).toAddMonoidHom.range : Set ZHat) := by
  rw [AddMonoidHom.coe_range]
  exact (isCompact_range (map_continuous (zHatMulNat n))).isClosed
 
@[simp]
theorem zHatReduction_int (n : ℕ) (hn : 0 < n) (a : ℤ) :
    zHatReduction n hn
        ((Int.castRingHom ZHat) a) =
      (a : ZMod n) :=
  rfl
 
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
end FiniteAbstractExtension
namespace FiniteTower

end FiniteTower
namespace FiniteResidueAbstractField
variable {D : DegreeData G}
end FiniteResidueAbstractField
namespace FiniteResidueAbstractExtension
variable {D : DegreeData G}
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
namespace FiniteAbstractFieldExtension
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
end DegreeData
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
 

@[simp]
theorem mem_ambientFixedAddSubgroup_iff
    (A : Rep ℤ G) (H : ClosedSubgroup G) (a : A.V) :
    a ∈ ambientFixedAddSubgroup A H ↔
      ∀ h : H.toSubgroup, A.ρ h.1 a = a :=
  Iff.rfl
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
 

@[simp]
theorem mem_nsmulImage_iff (Z : AddSubgroup ZHat) (n : ℕ) (z : ZHat) :
    z ∈ nsmulImage Z n ↔ ∃ x ∈ Z, n • x = z := by
  rfl
 
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
end ValuationData
end
end ClassFormation
end

/- ValuedFieldTheory.Valuation.DiscreteValuationField.Basic -/
section
namespace ValuationTheory
noncomputable section
universe u v
namespace ValuationSubring
end ValuationSubring
namespace DiscreteValuationField
 
structure DVF (K : Type u) [Field K] where
   
  ValueGroup : Type v
   
  [instValueGroup : LinearOrderedCommGroupWithZero ValueGroup]
   
  valuation : _root_.Valuation K ValueGroup
   
  [instRankOneDiscrete : valuation.IsRankOneDiscrete]
instance dvfValueGroup {K : Type u} [Field K] (F : DVF.{u,v} K) :
    LinearOrderedCommGroupWithZero F.ValueGroup := F.instValueGroup
instance dvfRankOne {K : Type u} [Field K] (F : DVF.{u,v} K) :
    F.valuation.IsRankOneDiscrete := F.instRankOneDiscrete
namespace DVF
variable {K : Type u} [Field K]
 
abbrev valuationSubring (F : DVF.{u, v} K) : Type u :=
  F.valuation.valuationSubring
 
instance valuationSubring.commRing (F : DVF.{u, v} K) :
    CommRing F.valuationSubring :=
  ValuationSubring.instCommRingSubtypeMem F.valuation.valuationSubring
 
instance valuationSubring.isLocalRing (F : DVF.{u, v} K) :
    IsLocalRing F.valuationSubring :=
  ValuationSubring.isLocalRing F.valuation.valuationSubring
 
instance valuationSubring.isDomain (F : DVF.{u, v} K) :
    IsDomain F.valuationSubring :=
  ValuationSubring.instIsDomainSubtypeMem F.valuation.valuationSubring
 
abbrev maximalIdeal (F : DVF.{u, v} K) : Ideal F.valuationSubring :=
  IsLocalRing.maximalIdeal F.valuationSubring
 
abbrev residueField (F : DVF.{u, v} K) : Type u :=
  IsLocalRing.ResidueField F.valuationSubring
 
theorem valuationSubring_isDiscreteValuationRing (F : DVF.{u, v} K) :
    IsDiscreteValuationRing F.valuationSubring :=
  Valuation.valuationSubring_isDiscreteValuationRing F.valuation
 
theorem exists_uniformizer (F : DVF.{u, v} K) :
    Exists (fun pi : F.valuationSubring => F.valuation.IsUniformizer (pi : K)) := by
  change Exists
    (fun pi : F.valuation.valuationSubring => F.valuation.IsUniformizer (pi : K))
  exact Valuation.exists_isUniformizer_of_isCyclic_of_nontrivial F.valuation
 
theorem uniformizer_mem_maximalIdeal (F : DVF.{u, v} K)
    {pi : F.valuationSubring} (hpi : F.valuation.IsUniformizer (pi : K)) :
    pi ∈ F.maximalIdeal := by
  change pi ∈ IsLocalRing.maximalIdeal F.valuation.valuationSubring
  exact (Valuation.mem_maximalIdeal_iff (v := F.valuation)).2 hpi.val_lt_one
 
theorem maximalIdeal_ne_bot (F : DVF.{u, v} K) :
    F.maximalIdeal ≠ ⊥ := by
  rcases F.exists_uniformizer with ⟨pi, hpi⟩
  intro hbot
  have hmem : pi ∈ (⊥ : Ideal F.valuationSubring) := by
    rw [← hbot]
    exact F.uniformizer_mem_maximalIdeal hpi
  have hzero_sub : pi = 0 := by
    simpa using hmem
  apply hpi.ne_zero
  exact Subtype.ext_iff.mp hzero_sub
end DVF
end DiscreteValuationField
end
end ValuationTheory
end

/- ValuedFieldTheory.Valuation.DiscreteValuationField.Henselian -/
section
namespace ValuationTheory
noncomputable section
universe u v
namespace DiscreteValuationField
 

theorem idempotentPolynomial_monic
    {R : Type*} [CommRing R] [Nontrivial R] :
    (Polynomial.X ^ 2 - Polynomial.X : Polynomial R).Monic := by
  exact Polynomial.monic_X_pow_sub (by
    rw [Polynomial.degree_X]
    norm_num)
 
theorem idempotentPolynomial_eval_mem_of_quotient_idempotent
    {R : Type*} [CommRing R] {I : Ideal R} (a0 : R)
    (ha0 : IsIdempotentElem (Ideal.Quotient.mk I a0)) :
    (Polynomial.X ^ 2 - Polynomial.X : Polynomial R).eval a0 ∈ I := by
  rw [← Ideal.Quotient.eq_zero_iff_mem]
  change
    Ideal.Quotient.mk I
      ((Polynomial.X ^ 2 - Polynomial.X : Polynomial R).eval a0) = 0
  simpa [pow_two] using sub_eq_zero.mpr ha0.eq
 

theorem idempotentPolynomial_derivative_eval_isUnit_of_quotient_idempotent
    {R : Type*} [CommRing R] {I : Ideal R} (a0 : R)
    (ha0 : IsIdempotentElem (Ideal.Quotient.mk I a0)) :
    IsUnit
      (Ideal.Quotient.mk I
        ((Polynomial.X ^ 2 - Polynomial.X : Polynomial R).derivative.eval a0)) := by
  rw [isUnit_iff_exists]
  refine
    ⟨Ideal.Quotient.mk I
      ((Polynomial.X ^ 2 - Polynomial.X : Polynomial R).derivative.eval a0),
      ?_, ?_⟩
  · simp [pow_two]
    calc
      (Ideal.Quotient.mk I a0 + Ideal.Quotient.mk I a0 - 1) *
          (Ideal.Quotient.mk I a0 + Ideal.Quotient.mk I a0 - 1) =
        1 + (4 * (Ideal.Quotient.mk I a0 * Ideal.Quotient.mk I a0) -
          4 * Ideal.Quotient.mk I a0) := by
          ring
      _ = 1 := by
          rw [ha0.eq]
          ring
  · simp [pow_two]
    calc
      (Ideal.Quotient.mk I a0 + Ideal.Quotient.mk I a0 - 1) *
          (Ideal.Quotient.mk I a0 + Ideal.Quotient.mk I a0 - 1) =
        1 + (4 * (Ideal.Quotient.mk I a0 * Ideal.Quotient.mk I a0) -
          4 * Ideal.Quotient.mk I a0) := by
          ring
      _ = 1 := by
          rw [ha0.eq]
          ring
 




theorem exists_idempotent_lift_of_surjective_henselianRing_ker
    {R S : Type*} [CommRing R] [CommRing S] (f : R →+* S)
    (hf : Function.Surjective f)
    [HenselianRing R (RingHom.ker f)]
    (e : S) (he : IsIdempotentElem e) :
    ∃ e' : R, IsIdempotentElem e' ∧ f e' = e := by
  cases subsingleton_or_nontrivial R with
  | inl hR =>
      have hS : Subsingleton S := by
        constructor
        intro x y
        rcases hf x with ⟨a, rfl⟩
        rcases hf y with ⟨b, rfl⟩
        exact congrArg f (Subsingleton.elim a b)
      exact ⟨0, Subsingleton.elim _ _, Subsingleton.elim _ _⟩
  | inr hR =>
      let : Nontrivial R := hR
      rcases hf e with ⟨a0, ha0⟩
      let p : Polynomial R := Polynomial.X ^ 2 - Polynomial.X
      have hpmonic : p.Monic := by
        dsimp [p]
        exact idempotentPolynomial_monic
      have ha0_quotient :
          IsIdempotentElem
            (Ideal.Quotient.mk (RingHom.ker f) a0) := by
        rw [IsIdempotentElem]
        rw [← map_mul, Ideal.Quotient.eq]
        rw [RingHom.mem_ker]
        simp [ha0, he.eq]
      have hroot : p.eval a0 ∈ RingHom.ker f := by
        simpa [p] using
          idempotentPolynomial_eval_mem_of_quotient_idempotent
            (I := RingHom.ker f) a0 ha0_quotient
      have hsimple :
          IsUnit
            (Ideal.Quotient.mk (RingHom.ker f) (p.derivative.eval a0)) := by
        simpa [p] using
          idempotentPolynomial_derivative_eval_isUnit_of_quotient_idempotent
            (I := RingHom.ker f) a0 ha0_quotient
      rcases HenselianRing.is_henselian p hpmonic a0 hroot hsimple with
        ⟨a, haroot, hacongr⟩
      refine ⟨a, ?_, ?_⟩
      · change a * a = a
        exact sub_eq_zero.mp (by simpa [p, pow_two] using haroot)
      · have hsub : f (a - a0) = 0 := RingHom.mem_ker.mp hacongr
        rw [map_sub, ha0, sub_eq_zero] at hsub
        exact hsub
 
structure HenselianDVF (K : Type u) [Field K] extends DVF.{u, v} K where
   
  [instHenselian : HenselianRing toDVF.valuationSubring toDVF.maximalIdeal]
instance henselianDVF_isHenselian {K : Type u} [Field K] (F : HenselianDVF.{u,v} K) :
    HenselianRing F.toDVF.valuationSubring F.toDVF.maximalIdeal := F.instHenselian
namespace HenselianDVF
variable {K : Type u} [Field K]
 
abbrev valuationSubring (F : HenselianDVF.{u, v} K) : Type u :=
  F.toDVF.valuationSubring
 
abbrev maximalIdeal (F : HenselianDVF.{u, v} K) : Ideal F.valuationSubring :=
  F.toDVF.maximalIdeal
 
abbrev residueField (F : HenselianDVF.{u, v} K) : Type u :=
  F.toDVF.residueField
end HenselianDVF
end DiscreteValuationField
end
end ValuationTheory
end

/- ValuedFieldTheory.Valuation.DiscreteValuationField.AdicPower -/
section
namespace ValuationTheory
noncomputable section
namespace DiscreteValuationField
variable {R : Type*} [CommRing R]
variable {M : Type*} [AddCommGroup M] [Module R M]
variable {N : Type*} [AddCommGroup N] [Module R N]
 

theorem isAdicComplete_of_linearEquiv
    (I : Ideal R) (e : M ≃ₗ[R] N) [IsAdicComplete I M] :
    IsAdicComplete I N := by
  refine AdicCompletion.of_bijective_iff.mp ?_
  constructor
  · intro x y hxy
    have hpre :
        e.symm x = e.symm y := by
      apply (AdicCompletion.of_bijective I M).1
      apply (AdicCompletion.congr I e).injective
      simpa [AdicCompletion.congr_apply, AdicCompletion.map_of] using hxy
    exact e.symm.injective hpre
  · intro y
    obtain ⟨m, hm⟩ :=
      (AdicCompletion.of_bijective I M).2
        ((AdicCompletion.congr I e).symm y)
    refine ⟨e m, ?_⟩
    calc
      AdicCompletion.of I N (e m) =
          AdicCompletion.congr I e (AdicCompletion.of I M m) := by
        simp [AdicCompletion.congr_apply, AdicCompletion.map_of]
      _ = AdicCompletion.congr I e
          ((AdicCompletion.congr I e).symm y) := by
        rw [hm]
      _ = y := (AdicCompletion.congr I e).apply_symm_apply y
 

theorem mem_map_algebraMap_pow_iff_mem_pow_smul_top
    {S : Type*} [CommRing S] [Algebra R S] (I : Ideal R)
    (n : ℕ) {x : S} :
    x ∈ (I.map (algebraMap R S)) ^ n ↔
      x ∈ I ^ n • (⊤ : Submodule R S) := by
  rw [Ideal.smul_top_eq_map, Ideal.map_pow]
  rfl
 
theorem mem_map_algebraMap_pow_smul_top_iff
    {S : Type*} [CommRing S] [Algebra R S] (I : Ideal R)
    (n : ℕ) {x : S} :
    x ∈ ((I.map (algebraMap R S)) ^ n • ⊤ : Submodule S S) ↔
      x ∈ I ^ n • (⊤ : Submodule R S) := by
  simpa only [smul_eq_mul, Ideal.mul_top] using
    (mem_map_algebraMap_pow_iff_mem_pow_smul_top
      (R := R) (S := S) I n (x := x))
 

theorem smodEq_map_algebraMap_pow_smul_top_iff
    {S : Type*} [CommRing S] [Algebra R S] (I : Ideal R)
    {x y : S} (n : ℕ) :
    x ≡ y [SMOD ((I.map (algebraMap R S)) ^ n • ⊤ : Submodule S S)] ↔
      x ≡ y [SMOD (I ^ n • ⊤ : Submodule R S)] := by
  rw [SModEq.sub_mem, SModEq.sub_mem]
  exact mem_map_algebraMap_pow_smul_top_iff (I := I) n
 

theorem isPrecomplete_map_algebraMap_iff
    {S : Type*} [CommRing S] [Algebra R S] (I : Ideal R) :
    IsPrecomplete (I.map (algebraMap R S)) S ↔ IsPrecomplete I S := by
  constructor
  · intro h
    refine ⟨fun f hf => ?_⟩
    have hfS :
        ∀ {m n : ℕ}, m ≤ n →
          f m ≡ f n
            [SMOD ((I.map (algebraMap R S)) ^ m • ⊤ : Submodule S S)] := by
      intro m n hmn
      exact (smodEq_map_algebraMap_pow_smul_top_iff (I := I) m).mpr (hf hmn)
    obtain ⟨L, hL⟩ := IsPrecomplete.prec h hfS
    refine ⟨L, fun n => ?_⟩
    exact (smodEq_map_algebraMap_pow_smul_top_iff (I := I) n).mp (hL n)
  · intro h
    refine ⟨fun f hf => ?_⟩
    have hfR :
        ∀ {m n : ℕ}, m ≤ n →
          f m ≡ f n [SMOD (I ^ m • ⊤ : Submodule R S)] := by
      intro m n hmn
      exact (smodEq_map_algebraMap_pow_smul_top_iff (I := I) m).mp (hf hmn)
    obtain ⟨L, hL⟩ := IsPrecomplete.prec h hfR
    refine ⟨L, fun n => ?_⟩
    exact (smodEq_map_algebraMap_pow_smul_top_iff (I := I) n).mpr (hL n)
 

theorem isAdicComplete_map_algebraMap_iff
    {S : Type*} [CommRing S] [Algebra R S] (I : Ideal R) :
    IsAdicComplete (I.map (algebraMap R S)) S ↔ IsAdicComplete I S := by
  constructor
  · intro h
    exact
      { toIsHausdorff := IsHausdorff.map_algebraMap_iff.mp h.toIsHausdorff
        toIsPrecomplete := (isPrecomplete_map_algebraMap_iff
          (R := R) (S := S) I).mp h.toIsPrecomplete }
  · intro h
    exact
      { toIsHausdorff := IsHausdorff.map_algebraMap_iff.mpr h.toIsHausdorff
        toIsPrecomplete := (isPrecomplete_map_algebraMap_iff
          (R := R) (S := S) I).mpr h.toIsPrecomplete }
 

theorem isHausdorff_of_isHausdorff_pow
    (I : Ideal R) {n : ℕ} (_hn : 0 < n)
    [IsHausdorff (I ^ n) M] :
    IsHausdorff I M := by
  refine ⟨fun x hx => IsHausdorff.haus
    (inferInstance : IsHausdorff (I ^ n) M) x ?_⟩
  intro k
  simpa [pow_mul] using hx (n * k)
 

theorem isPrecomplete_of_isPrecomplete_pow
    (I : Ideal R) {n : ℕ} (hn : 0 < n)
    [IsPrecomplete (I ^ n) M] :
    IsPrecomplete I M := by
  refine ⟨fun f hf => ?_⟩
  have hsub :
      ∀ {a b : ℕ}, a ≤ b →
        f (n * a) ≡ f (n * b)
          [SMOD ((I ^ n) ^ a • ⊤ : Submodule R M)] := by
    intro a b hab
    have hle : n * a ≤ n * b := Nat.mul_le_mul_left n hab
    simpa [pow_mul] using hf hle
  obtain ⟨L, hL⟩ :=
    IsPrecomplete.prec (I := I ^ n) (M := M)
      (inferInstance : IsPrecomplete (I ^ n) M)
      (f := fun k => f (n * k)) hsub
  refine ⟨L, fun m => ?_⟩
  have hm : m ≤ n * m := by
    simpa using Nat.mul_le_mul_right m (Nat.succ_le_of_lt hn)
  have hfm : f m ≡ f (n * m)
      [SMOD (I ^ m • ⊤ : Submodule R M)] :=
    hf hm
  have htail : f (n * m) ≡ L
      [SMOD (I ^ m • ⊤ : Submodule R M)] := by
    apply SModEq.mono (Submodule.pow_smul_top_le I M hm)
    simpa [pow_mul] using hL m
  exact hfm.trans htail
 

theorem isAdicComplete_of_isAdicComplete_pow
    (I : Ideal R) {n : ℕ} (hn : 0 < n)
    [IsAdicComplete (I ^ n) M] :
    IsAdicComplete I M where
  toIsHausdorff := isHausdorff_of_isHausdorff_pow (M := M) I hn
  toIsPrecomplete := isPrecomplete_of_isPrecomplete_pow (M := M) I hn
end DiscreteValuationField
end
end ValuationTheory
end

/- ValuedFieldTheory.Valuation.DiscreteValuationField.Complete -/
section
namespace ValuationTheory
noncomputable section
universe u v w
namespace DiscreteValuationField
namespace Valuation
variable {K : Type u} [Field K]
variable {Gamma : Type v} [LinearOrderedCommGroupWithZero Gamma]
 
class IsCompleteDiscrete (val : _root_.Valuation K Gamma) : Prop where
   
  [isRankOneDiscrete : val.IsRankOneDiscrete]
   
  isAdicComplete :
    IsAdicComplete (IsLocalRing.maximalIdeal val.valuationSubring) val.valuationSubring
instance completeDiscrete_rankOne (val : _root_.Valuation K Gamma) [h : IsCompleteDiscrete val] :
    val.IsRankOneDiscrete := h.isRankOneDiscrete
 
theorem isAdicComplete (val : _root_.Valuation K Gamma) [IsCompleteDiscrete val] :
    IsAdicComplete (IsLocalRing.maximalIdeal val.valuationSubring) val.valuationSubring :=
  IsCompleteDiscrete.isAdicComplete (val := val)
 
theorem henselianRing (val : _root_.Valuation K Gamma) [IsCompleteDiscrete val] :
    HenselianRing val.valuationSubring (IsLocalRing.maximalIdeal val.valuationSubring) := by
  let : IsAdicComplete (IsLocalRing.maximalIdeal val.valuationSubring)
      val.valuationSubring := isAdicComplete val
  infer_instance
 


theorem mem_maximalIdeal_pow_iff_valuation_le_uniformizer_pow
    (val : _root_.Valuation K Gamma) [val.IsRankOneDiscrete]
    {pi x : val.valuationSubring}
    (hpi : val.IsUniformizer (pi : K)) (n : ℕ) :
    x ∈ IsLocalRing.maximalIdeal val.valuationSubring ^ n ↔
      val (x : K) ≤ val ((pi ^ n : val.valuationSubring) : K) := by
  rw [hpi.is_generator, Ideal.span_singleton_pow]
  simpa [Ideal.mem_span_singleton] using
    (_root_.Valuation.Integers.dvd_iff_le
      (_root_.Valuation.valuationSubring.integers (v := val))
      (x := pi ^ n) (y := x))
end Valuation
 
structure CompleteDVF (K : Type u) [Field K] where
   
  ValueGroup : Type v
   
  [instValueGroup : LinearOrderedCommGroupWithZero ValueGroup]
   
  valuation : _root_.Valuation K ValueGroup
   
  [instCompleteDiscrete : Valuation.IsCompleteDiscrete valuation]
instance completeDVF_valueGroup {K : Type u} [Field K] (F : CompleteDVF.{u,v} K) :
    LinearOrderedCommGroupWithZero F.ValueGroup := F.instValueGroup
instance completeDVF_completeDiscrete {K : Type u} [Field K] (F : CompleteDVF.{u,v} K) :
    Valuation.IsCompleteDiscrete F.valuation := F.instCompleteDiscrete
namespace CompleteDVF
variable {K : Type u} [Field K]
 

abbrev toHenselianDVF (F : CompleteDVF.{u, v} K) : HenselianDVF.{u, v} K where
  toDVF :=
    { ValueGroup := F.ValueGroup
      valuation := F.valuation }
  instHenselian := by
    change HenselianRing F.valuation.valuationSubring
      (IsLocalRing.maximalIdeal F.valuation.valuationSubring)
    exact Valuation.henselianRing F.valuation
 

abbrev toDVF (F : CompleteDVF.{u, v} K) : DVF.{u, v} K :=
  F.toHenselianDVF.toDVF
 
abbrev valuationSubring (F : CompleteDVF.{u, v} K) : Type u :=
  F.toHenselianDVF.valuationSubring
 
abbrev maximalIdeal (F : CompleteDVF.{u, v} K) : Ideal F.valuationSubring :=
  F.toHenselianDVF.maximalIdeal
 
abbrev residueField (F : CompleteDVF.{u, v} K) : Type u :=
  F.toHenselianDVF.residueField
 
theorem valuationSubring_isDiscreteValuationRing (F : CompleteDVF.{u, v} K) :
    IsDiscreteValuationRing F.valuationSubring :=
  F.toDVF.valuationSubring_isDiscreteValuationRing
 
theorem isAdicComplete (F : CompleteDVF.{u, v} K) :
    IsAdicComplete F.maximalIdeal F.valuationSubring := by
  change IsAdicComplete
    (IsLocalRing.maximalIdeal F.valuation.valuationSubring)
    F.valuation.valuationSubring
  exact Valuation.isAdicComplete F.valuation
 
theorem exists_uniformizer (F : CompleteDVF.{u, v} K) :
    Exists (fun pi : F.valuationSubring => F.valuation.IsUniformizer (pi : K)) :=
  F.toDVF.exists_uniformizer
 
theorem uniformizer_mem_maximalIdeal (F : CompleteDVF.{u, v} K)
    {pi : F.valuationSubring} (hpi : F.valuation.IsUniformizer (pi : K)) :
    pi ∈ F.maximalIdeal :=
  F.toDVF.uniformizer_mem_maximalIdeal hpi
 
theorem maximalIdeal_ne_bot (F : CompleteDVF.{u, v} K) :
    F.maximalIdeal ≠ ⊥ := by
  rcases F.exists_uniformizer with ⟨pi, hpi⟩
  intro hbot
  have hmem : pi ∈ (⊥ : Ideal F.valuationSubring) := by
    rw [← hbot]
    exact F.uniformizer_mem_maximalIdeal hpi
  have hzero_sub : pi = 0 := by
    simpa using hmem
  apply hpi.ne_zero
  exact Subtype.ext_iff.mp hzero_sub
end CompleteDVF
end DiscreteValuationField
end
end ValuationTheory
end

/- ValuedFieldTheory.Valuation.DiscreteValuationField.Extensions -/
section
namespace ValuationTheory
noncomputable section
universe u v w x
namespace DiscreteValuationField
namespace ValuedExtension
variable {K : Type u} {L : Type w} [Field K] [Field L]
variable [Algebra K L] [FiniteDimensional K L]
variable (base : DVF.{u, v} K) (target : DVF.{w, x} L)
variable [base.valuation.HasExtension target.valuation]
 
def degree (_base : DVF.{u, v} K) (_target : DVF.{w, x} L) : ℕ :=
  Module.finrank K L
 

noncomputable def ramificationIndex : ℕ :=
  Ideal.ramificationIdx'
    (base.maximalIdeal : Ideal base.valuationSubring)
    (target.maximalIdeal : Ideal target.valuationSubring)
 

noncomputable def residueDegree : ℕ :=
  Ideal.inertiaDeg'
    (base.maximalIdeal : Ideal base.valuationSubring)
    (target.maximalIdeal : Ideal target.valuationSubring)
 
def IsDefectless : Prop :=
  degree base target =
    ramificationIndex base target * residueDegree base target
end ValuedExtension
end DiscreteValuationField
end
end ValuationTheory
end

/- ValuedFieldTheory.Valuation.DiscreteValuationField.HenselianFinite -/
section
namespace ValuationTheory
noncomputable section
universe u v
namespace DiscreteValuationField
 

theorem isAdicComplete_of_moduleFinite_sameUniverse
    {R M : Type u} [CommRing R] (I : Ideal R)
    [AddCommGroup M] [Module R M]
    [IsNoetherianRing R] [Module.Finite R M]
    [IsAdicComplete I R] :
    IsAdicComplete I M := by
  refine AdicCompletion.of_bijective_iff.mp ?_
  let e : M ≃ₗ[R] AdicCompletion I M :=
    (TensorProduct.lid R M).symm.trans
      ((TensorProduct.congr (AdicCompletion.ofLinearEquiv I R)
        (LinearEquiv.refl R M)).trans
        ((AdicCompletion.ofTensorProductEquivOfFiniteNoetherian I M).restrictScalars R))
  have heq : (e : M →ₗ[R] AdicCompletion I M) = AdicCompletion.of I M := by
    ext x n
    simp [e]
    exact one_smul (R ⧸ (I ^ n • ⊤ : Ideal R))
      (Submodule.Quotient.mk (p := (I ^ n • ⊤ : Submodule R M)) x)
  have hebij : Function.Bijective (e : M → AdicCompletion I M) := e.bijective
  rw [← heq]
  exact hebij
 



theorem isAdicComplete_of_moduleFinite
    {R : Type u} {M : Type v} [CommRing R] (I : Ideal R)
    [AddCommGroup M] [Module R M]
    [IsNoetherianRing R] [Module.Finite R M]
    [IsAdicComplete I R] :
    IsAdicComplete I M := by
  let : Small.{u} M := Module.Finite.small R M
  let : Module.Finite R (Shrink.{u} M) :=
    Module.Finite.of_surjective
      ((Shrink.linearEquiv R M).symm : M →ₗ[R] Shrink.{u} M)
      (Shrink.linearEquiv R M).symm.surjective
  have : IsAdicComplete I (Shrink.{u} M) :=
    isAdicComplete_of_moduleFinite_sameUniverse (I := I)
  exact ValuationTheory.DiscreteValuationField.isAdicComplete_of_linearEquiv
    (I := I) (Shrink.linearEquiv R M)
namespace HenselianDVF
variable {K : Type u} [Field K]
end HenselianDVF
end DiscreteValuationField
end
end ValuationTheory
end

/- ValuedFieldTheory.Valuation.DiscreteValuationField.IntegralClosure -/
section
namespace ValuationTheory
noncomputable section
universe u v w x
namespace DiscreteValuationField
namespace ValuedExtension
 




theorem primeSpectrum_subsingleton_of_isArtinianRing_of_idempotents_trivial
    {A : Type u} [CommRing A] [IsArtinianRing A]
    (hidempotent : ∀ e : A, IsIdempotentElem e → e = 0 ∨ e = 1) :
    Subsingleton (PrimeSpectrum A) := by
  constructor
  intro P Q
  by_contra hPQ
  have hclopen : IsClopen ({P} : Set (PrimeSpectrum A)) :=
    isClopen_discrete {P}
  rcases PrimeSpectrum.exists_idempotent_basicOpen_eq_of_isClopen hclopen with
    ⟨e, heidem, heopen⟩
  rcases hidempotent e heidem with rfl | rfl
  · have hPmem :
        P ∈ (PrimeSpectrum.basicOpen (0 : A) : Set (PrimeSpectrum A)) := by
      rw [← heopen]
      exact Set.mem_singleton P
    simp at hPmem
  · have hQmem : Q ∈ ({P} : Set (PrimeSpectrum A)) := by
      rw [heopen]
      simp
    exact hPQ hQmem.symm
 

theorem maximalIdeal_fiber_includeRight_surjective
    {R S : Type*} [CommRing R] [IsLocalRing R] [CommRing S]
    [Algebra R S] :
    Function.Surjective
      (Algebra.TensorProduct.includeRight :
        S →ₐ[R] (IsLocalRing.maximalIdeal R).Fiber S) := by
  intro x
  rcases Ideal.Fiber.exists_smul_eq_one_tmul
      (p := IsLocalRing.maximalIdeal R) (S := S) x with
    ⟨r, hr, s, hs⟩
  have hrunit : IsUnit r := by
    rw [IsLocalRing.mem_maximalIdeal, mem_nonunits_iff] at hr
    exact Classical.not_not.mp hr
  rcases hrunit with ⟨u, rfl⟩
  refine ⟨(↑u⁻¹ : R) • s, ?_⟩
  have hs' := congrArg (fun y =>
      (↑u⁻¹ : R) • y) hs
  simpa [Algebra.TensorProduct.includeRight_apply, smul_smul,
    Units.inv_mul, one_smul] using hs'.symm
 





theorem maximalIdeal_fiber_includeRight_ker_eq_maximalIdeal_map
    {R S : Type*} [CommRing R] [IsLocalRing R] [CommRing S]
    [Algebra R S] :
    RingHom.ker ((Algebra.TensorProduct.includeRight :
      S →ₐ[R] (IsLocalRing.maximalIdeal R).Fiber S) :
        S →+* (IsLocalRing.maximalIdeal R).Fiber S) =
      (IsLocalRing.maximalIdeal R).map (algebraMap R S) := by
  let I := (IsLocalRing.maximalIdeal R).map (algebraMap R S)
  let e : (IsLocalRing.maximalIdeal R).Fiber S ≃ₐ[R] S ⧸ I :=
    (Algebra.TensorProduct.congr (.symm <| .ofBijective _
      (Ideal.bijective_algebraMap_quotient_residueField
        (IsLocalRing.maximalIdeal R))) .refl).trans <|
    (Algebra.TensorProduct.comm _ _ _).trans
    ((Algebra.TensorProduct.quotIdealMapEquivTensorQuot S
      (IsLocalRing.maximalIdeal R)).symm.restrictScalars _)
  have he_apply (s : S) :
      e ((Algebra.TensorProduct.includeRight :
        S →ₐ[R] (IsLocalRing.maximalIdeal R).Fiber S) s) =
        Ideal.Quotient.mk I s := by
    simpa [e, I, Algebra.TensorProduct.includeRight_apply] using
      (Algebra.TensorProduct.quotIdealMapEquivTensorQuot_symm_tmul
        (B := S) (I := IsLocalRing.maximalIdeal R) s (1 : R))
  ext s
  constructor
  · intro hs
    have hq :
        e ((Algebra.TensorProduct.includeRight :
          S →ₐ[R] (IsLocalRing.maximalIdeal R).Fiber S) s) = 0 := by
      simpa using congrArg e hs
    rw [he_apply s] at hq
    simpa [I, Ideal.Quotient.eq_zero_iff_mem] using hq
  · intro hs
    change (Algebra.TensorProduct.includeRight :
      S →ₐ[R] (IsLocalRing.maximalIdeal R).Fiber S) s = 0
    apply e.injective
    rw [he_apply s, map_zero]
    simpa [I, Ideal.Quotient.eq_zero_iff_mem] using hs
variable {K : Type u} {L : Type w} [Field K] [Field L]
variable [Algebra K L] [FiniteDimensional K L]
variable (base : CompleteDVF.{u, v} K) (target : CompleteDVF.{w, x} L)
variable [base.valuation.HasExtension target.valuation]
 
theorem base_valuationSubring_isFractionRing (base : CompleteDVF.{u, v} K) :
    IsFractionRing base.toDVF.valuationSubring K :=
  (Valuation.valuationSubring.integers (v := base.valuation)).isFractionRing
 
theorem base_valuationSubring_isIntegrallyClosed
    (base : CompleteDVF.{u, v} K) :
    IsIntegrallyClosed base.toDVF.valuationSubring := by
  exact inferInstanceAs (IsIntegrallyClosed base.valuation.valuationSubring)
 
theorem base_valuationSubring_isNoetherianRing
    (base : CompleteDVF.{u, v} K) :
    IsNoetherianRing base.toDVF.valuationSubring := by
  have : IsDiscreteValuationRing base.toDVF.valuationSubring :=
    base.valuationSubring_isDiscreteValuationRing
  infer_instance
 


theorem moduleFinite_target_valuationSubring_of_isIntegralClosure
    (base : CompleteDVF.{u, v} K) (target : CompleteDVF.{w, x} L)
    [base.valuation.HasExtension target.valuation]
    [Algebra.IsSeparable K L]
    [IsScalarTower base.toDVF.valuationSubring target.toDVF.valuationSubring L]
    [IsIntegralClosure target.toDVF.valuationSubring base.toDVF.valuationSubring L] :
    Module.Finite base.toDVF.valuationSubring target.toDVF.valuationSubring := by
  let : IsFractionRing base.toDVF.valuationSubring K :=
    base_valuationSubring_isFractionRing (K := K) base
  let : IsIntegrallyClosed base.toDVF.valuationSubring :=
    base_valuationSubring_isIntegrallyClosed (K := K) base
  let : IsNoetherianRing base.toDVF.valuationSubring :=
    base_valuationSubring_isNoetherianRing (K := K) base
  exact IsIntegralClosure.finite base.toDVF.valuationSubring K L target.toDVF.valuationSubring
 

abbrev integralClosureIntegers (base : CompleteDVF.{u, v} K)
    (_target : CompleteDVF.{w, x} L) : Type _ :=
  integralClosure base.toDVF.valuationSubring L
omit [FiniteDimensional K L] [base.valuation.HasExtension target.valuation] in
 
theorem integralClosure_isIntegral :
    Algebra.IsIntegral base.toDVF.valuationSubring (integralClosureIntegers base target) := by
  exact inferInstanceAs
    (Algebra.IsIntegral base.toDVF.valuationSubring
      (integralClosure base.toDVF.valuationSubring L))
omit [base.valuation.HasExtension target.valuation] in
 

theorem integralClosure_algebraMap_injective :
    Function.Injective
      (algebraMap base.toDVF.valuationSubring (integralClosureIntegers base target)) := by
  intro x y hxy
  apply Subtype.ext
  apply FaithfulSMul.algebraMap_injective K L
  exact congrArg (fun z : (integralClosureIntegers base target) => (z : L)) hxy
omit [base.valuation.HasExtension target.valuation] in
 
theorem integralClosure_faithfulSMul :
    FaithfulSMul base.toDVF.valuationSubring (integralClosureIntegers base target) :=
  (faithfulSMul_iff_algebraMap_injective
    base.toDVF.valuationSubring (integralClosureIntegers base target)).mpr
    (integralClosure_algebraMap_injective base target)
omit [base.valuation.HasExtension target.valuation] in
 

theorem moduleFinite_integralClosureIntegers
    [Algebra.IsSeparable K L] :
    Module.Finite base.toDVF.valuationSubring (integralClosureIntegers base target) := by
  let : IsFractionRing base.toDVF.valuationSubring K :=
    base_valuationSubring_isFractionRing (K := K) base
  let : IsIntegrallyClosed base.toDVF.valuationSubring :=
    base_valuationSubring_isIntegrallyClosed (K := K) base
  let : IsNoetherianRing base.toDVF.valuationSubring :=
    base_valuationSubring_isNoetherianRing (K := K) base
  exact
    (show Module.Finite base.toDVF.valuationSubring
        (integralClosure base.toDVF.valuationSubring L) from
      IsIntegralClosure.finite base.toDVF.valuationSubring K L
        (integralClosure base.toDVF.valuationSubring L))
omit [base.valuation.HasExtension target.valuation] in
 

theorem integralClosure_quasiFinite
    [Algebra.IsSeparable K L] :
    Algebra.QuasiFinite base.toDVF.valuationSubring (integralClosureIntegers base target) := by
  let : Module.Finite base.toDVF.valuationSubring (integralClosureIntegers base target) :=
    (moduleFinite_integralClosureIntegers base target)
  infer_instance
omit [base.valuation.HasExtension target.valuation] in
 

theorem integralClosure_base_maximal_fiber_isArtinianRing
    [Algebra.IsSeparable K L] :
    IsArtinianRing (base.maximalIdeal.Fiber (integralClosureIntegers base target)) := by
  let : Algebra.QuasiFinite base.toDVF.valuationSubring (integralClosureIntegers base target) :=
    (integralClosure_quasiFinite base target)
  infer_instance
omit [FiniteDimensional K L] [base.valuation.HasExtension target.valuation] in
 

theorem integralClosure_base_maximal_fiber_includeRight_ker_eq_maximalIdeal_map
     :
    RingHom.ker
        ((Algebra.TensorProduct.includeRight :
          (integralClosureIntegers base target) →ₐ[base.toDVF.valuationSubring]
            base.maximalIdeal.Fiber (integralClosureIntegers base target)) :
          (integralClosureIntegers base target) →+*
            base.maximalIdeal.Fiber (integralClosureIntegers base target)) =
      base.maximalIdeal.map
        (algebraMap base.toDVF.valuationSubring (integralClosureIntegers base target)) := by
  simpa using
    (maximalIdeal_fiber_includeRight_ker_eq_maximalIdeal_map
      (R := base.toDVF.valuationSubring) (S := (integralClosureIntegers base target)))
omit [FiniteDimensional K L] [base.valuation.HasExtension target.valuation] in
 





theorem integralClosure_idempotent_eq_zero_or_one
    (e : (integralClosureIntegers base target))
    (he : IsIdempotentElem e) :
    e = 0 ∨ e = 1 := by
  let : IsDomain (integralClosureIntegers base target) := by
    exact inferInstanceAs
      (IsDomain (integralClosure base.toDVF.valuationSubring L))
  exact IsIdempotentElem.iff_eq_zero_or_one.mp he
omit [base.valuation.HasExtension target.valuation] in
 





theorem integralClosure_base_maximal_fiber_subsingleton_of_idempotents_lift
    [Algebra.IsSeparable K L]
    (hlift :
      ∀ e : base.maximalIdeal.Fiber (integralClosureIntegers base target),
        IsIdempotentElem e →
          ∃ b : (integralClosureIntegers base target),
            IsIdempotentElem b ∧
              Algebra.TensorProduct.includeRight b = e) :
    Subsingleton
      (PrimeSpectrum (base.maximalIdeal.Fiber (integralClosureIntegers base target))) := by
  let : IsArtinianRing
      (base.maximalIdeal.Fiber (integralClosureIntegers base target)) :=
    (integralClosure_base_maximal_fiber_isArtinianRing base target)
  refine primeSpectrum_subsingleton_of_isArtinianRing_of_idempotents_trivial ?_
  intro e he
  rcases hlift e he with ⟨b, hbidem, hbmap⟩
  rcases (integralClosure_idempotent_eq_zero_or_one base target) b hbidem with rfl | rfl
  · left
    rw [← hbmap]
    simp
  · right
    rw [← hbmap]
    exact (Algebra.TensorProduct.includeRight :
      (integralClosureIntegers base target) →ₐ[base.toDVF.valuationSubring]
        base.maximalIdeal.Fiber (integralClosureIntegers base target)).map_one
omit [FiniteDimensional K L] [base.valuation.HasExtension target.valuation] in
 






theorem
integralClosure_base_maximal_fiber_idempotents_lift_of_includeRight_surjective_henselianRing_ker
    (hsurj :
      Function.Surjective
        (Algebra.TensorProduct.includeRight :
          (integralClosureIntegers base target) →ₐ[base.toDVF.valuationSubring]
            base.maximalIdeal.Fiber (integralClosureIntegers base target)))
    [HenselianRing (integralClosureIntegers base target)
      (RingHom.ker
        ((Algebra.TensorProduct.includeRight :
          (integralClosureIntegers base target) →ₐ[base.toDVF.valuationSubring]
            base.maximalIdeal.Fiber (integralClosureIntegers base target)) :
          (integralClosureIntegers base target) →+*
            base.maximalIdeal.Fiber (integralClosureIntegers base target)))] :
    ∀ e : base.maximalIdeal.Fiber (integralClosureIntegers base target),
      IsIdempotentElem e →
        ∃ b : (integralClosureIntegers base target),
          IsIdempotentElem b ∧
            Algebra.TensorProduct.includeRight b = e := by
  intro e he
  let φ : (integralClosureIntegers base target) →+*
      base.maximalIdeal.Fiber (integralClosureIntegers base target) :=
    (Algebra.TensorProduct.includeRight :
      (integralClosureIntegers base target) →ₐ[base.toDVF.valuationSubring]
        base.maximalIdeal.Fiber (integralClosureIntegers base target))
  have hsurjφ : Function.Surjective φ := by
    simpa [φ] using hsurj
  rcases exists_idempotent_lift_of_surjective_henselianRing_ker
      φ hsurjφ e he with
    ⟨b, hbidem, hbmap⟩
  exact ⟨b, hbidem, by simpa [φ] using hbmap⟩
omit [FiniteDimensional K L] [base.valuation.HasExtension target.valuation] in
 




theorem integralClosure_base_maximal_fiber_idempotents_lift_of_includeRight_henselianRing_ker
    [HenselianRing (integralClosureIntegers base target)
      (RingHom.ker
        ((Algebra.TensorProduct.includeRight :
          (integralClosureIntegers base target) →ₐ[base.toDVF.valuationSubring]
            base.maximalIdeal.Fiber (integralClosureIntegers base target)) :
          (integralClosureIntegers base target) →+*
            base.maximalIdeal.Fiber (integralClosureIntegers base target)))] :
    ∀ e : base.maximalIdeal.Fiber (integralClosureIntegers base target),
      IsIdempotentElem e →
        ∃ b : (integralClosureIntegers base target),
          IsIdempotentElem b ∧
            Algebra.TensorProduct.includeRight b = e := by
  refine (
integralClosure_base_maximal_fiber_idempotents_lift_of_includeRight_surjective_henselianRing_ker
    base target) ?_
  simpa using
    (maximalIdeal_fiber_includeRight_surjective
      (R := base.toDVF.valuationSubring) (S := (integralClosureIntegers base target)))
omit [base.valuation.HasExtension target.valuation] in
 

theorem integralClosure_base_maximal_fiber_subsingleton_of_includeRight_henselianRing_ker
    [Algebra.IsSeparable K L]
    [HenselianRing (integralClosureIntegers base target)
      (RingHom.ker
        ((Algebra.TensorProduct.includeRight :
          (integralClosureIntegers base target) →ₐ[base.toDVF.valuationSubring]
            base.maximalIdeal.Fiber (integralClosureIntegers base target)) :
          (integralClosureIntegers base target) →+*
            base.maximalIdeal.Fiber (integralClosureIntegers base target)))] :
    Subsingleton
      (PrimeSpectrum (base.maximalIdeal.Fiber (integralClosureIntegers base target))) := by
  refine
    (integralClosure_base_maximal_fiber_subsingleton_of_idempotents_lift base target) ?_
  exact
    (integralClosure_base_maximal_fiber_idempotents_lift_of_includeRight_henselianRing_ker
      base target)
omit [base.valuation.HasExtension target.valuation] in
 

theorem integralClosure_base_maximal_fiber_subsingleton_of_henselianRing_maximalIdeal_map
    [Algebra.IsSeparable K L]
    [HenselianRing (integralClosureIntegers base target)
      (base.maximalIdeal.map
        (algebraMap base.toDVF.valuationSubring (integralClosureIntegers base target)))] :
    Subsingleton
      (PrimeSpectrum (base.maximalIdeal.Fiber (integralClosureIntegers base target))) := by
  let : HenselianRing (integralClosureIntegers base target)
      (RingHom.ker
        ((Algebra.TensorProduct.includeRight :
          (integralClosureIntegers base target) →ₐ[base.toDVF.valuationSubring]
            base.maximalIdeal.Fiber (integralClosureIntegers base target)) :
          (integralClosureIntegers base target) →+*
            base.maximalIdeal.Fiber (integralClosureIntegers base target))) := by
    rw [(integralClosure_base_maximal_fiber_includeRight_ker_eq_maximalIdeal_map base target)]
    infer_instance
  exact
    (integralClosure_base_maximal_fiber_subsingleton_of_includeRight_henselianRing_ker base target)
omit [base.valuation.HasExtension target.valuation] in
 




theorem integralClosure_base_maximal_map_henselianRing
    [Algebra.IsSeparable K L] :
    HenselianRing (integralClosureIntegers base target)
      (base.maximalIdeal.map
        (algebraMap base.toDVF.valuationSubring (integralClosureIntegers base target))) := by
  let : IsNoetherianRing base.toDVF.valuationSubring :=
    base_valuationSubring_isNoetherianRing (K := K) base
  let : Module.Finite base.toDVF.valuationSubring (integralClosureIntegers base target) :=
    (moduleFinite_integralClosureIntegers base target)
  have : IsAdicComplete base.maximalIdeal base.toDVF.valuationSubring :=
    base.isAdicComplete
  have hcomplete : IsAdicComplete base.maximalIdeal (integralClosureIntegers base target) :=
    ValuationTheory.DiscreteValuationField.isAdicComplete_of_moduleFinite
      (I := base.maximalIdeal)
  have hmapComplete :
      IsAdicComplete
        (base.maximalIdeal.map
          (algebraMap base.toDVF.valuationSubring (integralClosureIntegers base target)))
        (integralClosureIntegers base target) :=
    (isAdicComplete_map_algebraMap_iff
      (I := base.maximalIdeal) (S := (integralClosureIntegers base target))).mpr hcomplete
  have := hmapComplete
  infer_instance
omit [base.valuation.HasExtension target.valuation] in
 

theorem integralClosure_primesOver_base_maximal_nonempty
     :
    Nonempty (Ideal.primesOver base.maximalIdeal (integralClosureIntegers base target)) := by
  let : Algebra.IsIntegral base.toDVF.valuationSubring (integralClosureIntegers base target) :=
    (integralClosure_isIntegral base target)
  let : FaithfulSMul base.toDVF.valuationSubring (integralClosureIntegers base target) :=
    (integralClosure_faithfulSMul base target)
  rcases Ideal.exists_maximal_ideal_liesOver_of_isIntegral
      (S := (integralClosureIntegers base target)) base.maximalIdeal with
    ⟨P, hPmax, hPover⟩
  exact ⟨⟨P, hPmax.isPrime, hPover⟩⟩
omit [FiniteDimensional K L] [base.valuation.HasExtension target.valuation] in
 

theorem integralClosure_primesOver_base_maximal_subsingleton_of_fiber_subsingleton
    [Subsingleton
      (PrimeSpectrum (base.maximalIdeal.Fiber (integralClosureIntegers base target)))] :
    Subsingleton
      (Ideal.primesOver base.maximalIdeal (integralClosureIntegers base target)) := by
  constructor
  intro P Q
  let e := PrimeSpectrum.primesOverOrderIsoFiber
    base.toDVF.valuationSubring (integralClosureIntegers base target) base.maximalIdeal
  exact e.injective (Subsingleton.elim (e P) (e Q))
omit [base.valuation.HasExtension target.valuation] in
 


theorem integralClosure_primesOver_base_maximal_eq_singleton_of_fiber_subsingleton
    [Subsingleton
      (PrimeSpectrum (base.maximalIdeal.Fiber (integralClosureIntegers base target)))] :
    ∃ P : Ideal (integralClosureIntegers base target),
      Ideal.primesOver base.maximalIdeal (integralClosureIntegers base target) = {P} := by
  let : Subsingleton
      (Ideal.primesOver base.maximalIdeal (integralClosureIntegers base target)) :=
    (integralClosure_primesOver_base_maximal_subsingleton_of_fiber_subsingleton base target)
  rcases (integralClosure_primesOver_base_maximal_nonempty base target) with ⟨P⟩
  refine ⟨P, Set.eq_singleton_iff_unique_mem.mpr ⟨P.2, ?_⟩⟩
  intro Q hQ
  exact congrArg Subtype.val
    (Subsingleton.elim
      (⟨Q, hQ⟩ :
        Ideal.primesOver base.maximalIdeal (integralClosureIntegers base target)) P)
omit [base.valuation.HasExtension target.valuation] in
 

theorem integralClosure_isFractionRing :
    IsFractionRing (integralClosureIntegers base target) L := by
  let : IsFractionRing base.toDVF.valuationSubring K :=
    base_valuationSubring_isFractionRing (K := K) base
  exact
    (show IsFractionRing (integralClosure base.toDVF.valuationSubring L) L from
      integralClosure.isFractionRing_of_finite_extension K L)
omit [base.valuation.HasExtension target.valuation] in
 





theorem integralClosure_mem_or_inv_of_integralClosure_valuationRing
    [ValuationRing (integralClosureIntegers base target)] :
    ∀ z : L,
      z ∈ (integralClosure base.toDVF.valuationSubring L).toSubring ∨
        z⁻¹ ∈ (integralClosure base.toDVF.valuationSubring L).toSubring := by
  let : IsFractionRing (integralClosureIntegers base target) L :=
    (integralClosure_isFractionRing base target)
  intro z
  rcases ValuationRing.isInteger_or_isInteger
      (R := (integralClosureIntegers base target)) (K := L) z with hz | hz
  · left
    rcases hz with ⟨y, hy⟩
    rw [← hy]
    exact y.2
  · right
    rcases hz with ⟨y, hy⟩
    rw [← hy]
    exact y.2
omit [base.valuation.HasExtension target.valuation] in
 

theorem integralClosure_isDedekindDomain
    [IsFractionRing base.toDVF.valuationSubring K] [Algebra.IsSeparable K L] :
    IsDedekindDomain (integralClosureIntegers base target) := by
  exact
    (show IsDedekindDomain (integralClosure base.toDVF.valuationSubring L) from
      integralClosure.isDedekindDomain base.toDVF.valuationSubring K L)
omit [FiniteDimensional K L] [base.valuation.HasExtension target.valuation] in
 






theorem integralClosure_isLocalRing_of_primesOver_base_maximal_eq_singleton
    (P : Ideal (integralClosureIntegers base target))
    (hP :
      Ideal.primesOver base.maximalIdeal (integralClosureIntegers base target) = {P}) :
    IsLocalRing (integralClosureIntegers base target) := by
  let : Algebra.IsIntegral base.toDVF.valuationSubring (integralClosureIntegers base target) :=
    (integralClosure_isIntegral base target)
  have hPmem : P ∈ Ideal.primesOver base.maximalIdeal (integralClosureIntegers base target) := by
    rw [hP]
    exact Set.mem_singleton P
  let : Nonempty (MaximalSpectrum (integralClosureIntegers base target)) :=
    ⟨⟨P, Ideal.isMaximal_of_mem_primesOver hPmem⟩⟩
  have hsub :
      Subsingleton (MaximalSpectrum (integralClosureIntegers base target)) := by
    constructor
    intro M N
    apply MaximalSpectrum.ext
    have hMcomap :
        (M.asIdeal.comap
            (algebraMap base.toDVF.valuationSubring (integralClosureIntegers base target))) =
          base.maximalIdeal :=
      IsLocalRing.eq_maximalIdeal
        (Ideal.isMaximal_comap_of_isIntegral_of_isMaximal
          (R := base.toDVF.valuationSubring)
          (S := (integralClosureIntegers base target)) M.asIdeal)
    have hNcomap :
        (N.asIdeal.comap
            (algebraMap base.toDVF.valuationSubring (integralClosureIntegers base target))) =
          base.maximalIdeal :=
      IsLocalRing.eq_maximalIdeal
        (Ideal.isMaximal_comap_of_isIntegral_of_isMaximal
          (R := base.toDVF.valuationSubring)
          (S := (integralClosureIntegers base target)) N.asIdeal)
    have hMmem :
        M.asIdeal ∈ Ideal.primesOver base.maximalIdeal
          (integralClosureIntegers base target) :=
      ⟨M.isMaximal.isPrime, ⟨hMcomap.symm⟩⟩
    have hNmem :
        N.asIdeal ∈ Ideal.primesOver base.maximalIdeal
          (integralClosureIntegers base target) :=
      ⟨N.isMaximal.isPrime, ⟨hNcomap.symm⟩⟩
    have hMeq : M.asIdeal = P := by
      simpa [hP] using hMmem
    have hNeq : N.asIdeal = P := by
      simpa [hP] using hNmem
    exact hMeq.trans hNeq.symm
  exact IsLocalRing.of_singleton_maximalSpectrum
omit [base.valuation.HasExtension target.valuation] in
 

theorem integralClosure_isLocalRing_of_base_maximal_fiber_subsingleton
    [Subsingleton
      (PrimeSpectrum (base.maximalIdeal.Fiber (integralClosureIntegers base target)))] :
    IsLocalRing (integralClosureIntegers base target) := by
  rcases
      (integralClosure_primesOver_base_maximal_eq_singleton_of_fiber_subsingleton
        base target) with
    ⟨P, hP⟩
  exact (integralClosure_isLocalRing_of_primesOver_base_maximal_eq_singleton base target) P hP
omit [base.valuation.HasExtension target.valuation] in
 






theorem integralClosure_valuationRing_of_isLocalRing
    [Algebra.IsSeparable K L]
    [IsLocalRing (integralClosureIntegers base target)] :
    ValuationRing (integralClosureIntegers base target) := by
  let : IsFractionRing base.toDVF.valuationSubring K :=
    base_valuationSubring_isFractionRing (K := K) base
  let : IsIntegrallyClosed base.toDVF.valuationSubring :=
    base_valuationSubring_isIntegrallyClosed (K := K) base
  let : IsNoetherianRing base.toDVF.valuationSubring :=
    base_valuationSubring_isNoetherianRing (K := K) base
  let : IsDomain (integralClosureIntegers base target) := by
    exact inferInstanceAs
      (IsDomain (integralClosure base.toDVF.valuationSubring L))
  let : IsDedekindDomain (integralClosureIntegers base target) :=
    (integralClosure_isDedekindDomain base target)
  exact
    ((tfae_of_isNoetherianRing_of_isLocalRing_of_isDomain
      (integralClosureIntegers base target)).out 2 1).mp
      (show IsDedekindDomain (integralClosureIntegers base target) from inferInstance)
omit [base.valuation.HasExtension target.valuation] in
 

theorem integralClosure_mem_or_inv_of_isLocalRing
    [Algebra.IsSeparable K L]
    [IsLocalRing (integralClosureIntegers base target)] :
    ∀ z : L,
      z ∈ (integralClosure base.toDVF.valuationSubring L).toSubring ∨
        z⁻¹ ∈ (integralClosure base.toDVF.valuationSubring L).toSubring := by
  let : ValuationRing (integralClosureIntegers base target) :=
    (integralClosure_valuationRing_of_isLocalRing base target)
  exact (integralClosure_mem_or_inv_of_integralClosure_valuationRing base target)
end ValuedExtension
namespace ValuedExtension.Henselian
variable {K : Type u} {L : Type w} [Field K] [Field L]
variable [Algebra K L] [FiniteDimensional K L]
variable (base : HenselianDVF.{u, v} K) (target : HenselianDVF.{w, x} L)
variable [base.toDVF.valuation.HasExtension target.toDVF.valuation]
end ValuedExtension.Henselian
end DiscreteValuationField
end
end ValuationTheory
end

/- ValuedFieldTheory.Valuation.DiscreteValuationField.ValuationExtension -/
section
namespace ValuationTheory
noncomputable section
universe u v w x y
namespace DiscreteValuationField
namespace ValuedExtension
variable {K : Type u} {L : Type w} [Field K] [Field L] [Algebra K L]
section EquivalentBase
variable {Gamma₁ Gamma₂ GammaL : Type*}
variable [LinearOrderedCommGroupWithZero Gamma₁]
variable [LinearOrderedCommGroupWithZero Gamma₂]
variable [LinearOrderedCommGroupWithZero GammaL]
end EquivalentBase
section ComapAlongCompatibleEmbedding
variable {M : Type y} [Field M] [Algebra K M]
variable {GammaK GammaM : Type*}
variable [LinearOrderedCommGroupWithZero GammaK]
variable [LinearOrderedCommGroupWithZero GammaM]
end ComapAlongCompatibleEmbedding
section LocalValuationSubringMap
variable (base : CompleteDVF.{u, v} K) (target : CompleteDVF.{w, x} L)
end LocalValuationSubringMap
section Pullback
variable (base : CompleteDVF.{u, v} K) (target : CompleteDVF.{w, x} L)
variable [base.valuation.HasExtension target.valuation]
end Pullback
section Comparison
variable (target : CompleteDVF.{w, x} L)
 
theorem valuation_isEquiv_of_valuationSubring_eq
    {Gamma' : Type y} [LinearOrderedCommGroupWithZero Gamma']
    (v' : _root_.Valuation L Gamma')
    (hsub : target.valuation.valuationSubring = v'.valuationSubring) :
    target.valuation.IsEquiv v' :=
  (_root_.Valuation.isEquiv_iff_valuationSubring target.valuation v').2 hsub
end Comparison
end ValuedExtension
end DiscreteValuationField
end
end ValuationTheory
end

/- ValuedFieldTheory.Valuation.DiscreteValuationField.ChevalleyExtension -/
section
namespace ValuationTheory
noncomputable section
universe u v w x y z
namespace DiscreteValuationField
namespace Valuation

variable {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
variable {ΓK : Type w} [LinearOrderedCommGroupWithZero ΓK]
 


theorem mem_base_valuationSubring_of_lift_mem
    (vK : _root_.Valuation K ΓK)
    (B : ValuationSubring L)
    (hB : ∀ x : vK.valuationSubring, algebraMap vK.valuationSubring L x ∈ B.toSubring)
    (hlocal : IsLocalHom
      ((algebraMap vK.valuationSubring L).codRestrict B.toSubring hB))
    {x : K} (hxB : algebraMap K L x ∈ B.toSubring) :
    x ∈ vK.valuationSubring := by
  let A := vK.valuationSubring
  rcases A.mem_or_inv_mem x with hxA | hxinvA
  · exact hxA
  · by_cases hx0 : x = 0
    · simp [hx0]
    let y : A := ⟨x⁻¹, hxinvA⟩
    let f : A →+* B.toSubring :=
      (algebraMap A L).codRestrict B.toSubring hB
    let : IsLocalHom f := by
      dsimp [f, A]
      exact hlocal
    have hfy_unit : IsUnit (f y) := by
      apply IsUnit.of_mul_eq_one (⟨algebraMap K L x, hxB⟩ : B.toSubring)
      ext
      change (algebraMap K L) (x⁻¹) * (algebraMap K L) x = 1
      rw [← map_mul, inv_mul_cancel₀ hx0, map_one]
    have hy_unit : IsUnit y := IsUnit.of_map f y hfy_unit
    have hy_val : A.valuation (x⁻¹) = 1 := by
      simpa [y] using (A.valuation_eq_one_iff y).1 hy_unit
    have hx_val : A.valuation x = 1 := by
      rw [← inv_inv x, map_inv₀, hy_val, inv_one]
    exact A.mem_of_valuation_le_one x hx_val.le
 







theorem exists_extension_valuationSubring
    (vK : _root_.Valuation K ΓK) :
    ∃ B : ValuationSubring L,
      ∃ hB : ∀ x : vK.valuationSubring,
        algebraMap vK.valuationSubring L x ∈ B.toSubring,
        IsLocalHom
          ((algebraMap vK.valuationSubring L).codRestrict B.toSubring hB) ∧
        ∀ x : K, algebraMap K L x ∈ B.toSubring ↔
          x ∈ vK.valuationSubring := by
  obtain ⟨B, hB, hlocal⟩ :=
    IsLocalRing.exists_factor_valuationRing
      (f := algebraMap vK.valuationSubring L)
  refine ⟨B, hB, hlocal, ?_⟩
  intro x
  constructor
  · intro hxB
    exact mem_base_valuationSubring_of_lift_mem vK B hB hlocal hxB
  · intro hxA
    have hxB :
        algebraMap vK.valuationSubring L
            (⟨x, hxA⟩ : vK.valuationSubring) ∈ B.toSubring :=
      hB ⟨x, hxA⟩
    rw [IsScalarTower.algebraMap_apply vK.valuationSubring K L] at hxB
    simpa using hxB
 

theorem hasExtension_valuation_of_valuationSubring_pullback
    (vK : _root_.Valuation K ΓK) (B : ValuationSubring L)
    (hpullback : ∀ x : K, algebraMap K L x ∈ B.toSubring ↔
      x ∈ vK.valuationSubring) :
    vK.HasExtension B.valuation := by
  apply _root_.Valuation.HasExtension.ofComapInteger
  apply le_antisymm
  · intro x hx
    have hxB : algebraMap K L x ∈ B.toSubring := by
      exact B.mem_of_valuation_le_one _ hx
    have hxA : x ∈ vK.valuationSubring := (hpullback x).1 hxB
    exact (vK.mem_integer_iff x).2
      ((vK.mem_valuationSubring_iff x).2 hxA)
  · intro x hx
    have hxA : x ∈ vK.valuationSubring := by
      exact (vK.mem_valuationSubring_iff x).1
        ((vK.mem_integer_iff x).1 hx)
    have hxB : algebraMap K L x ∈ B.toSubring := (hpullback x).2 hxA
    exact (B.valuation_le_one_iff (algebraMap K L x)).2 hxB
 

theorem valuationSubring_pullback_of_hasExtension_valuation
    (vK : _root_.Valuation K ΓK) (B : ValuationSubring L)
    [vK.HasExtension B.valuation] (x : K) :
    algebraMap K L x ∈ B.toSubring ↔ x ∈ vK.valuationSubring := by
  constructor
  · intro hxB
    have hx_le : B.valuation (algebraMap K L x) ≤ 1 :=
      (B.valuation_le_one_iff (algebraMap K L x)).2 hxB
    have hxK_le : vK x ≤ 1 :=
      (_root_.Valuation.HasExtension.val_map_le_one_iff vK B.valuation x).1 hx_le
    exact (vK.mem_valuationSubring_iff x).1 hxK_le
  · intro hxK
    have hxK_le : vK x ≤ 1 :=
      (vK.mem_valuationSubring_iff x).2 hxK
    have hx_le : B.valuation (algebraMap K L x) ≤ 1 :=
      (_root_.Valuation.HasExtension.val_map_le_one_iff vK B.valuation x).2 hxK_le
    exact (B.valuation_le_one_iff (algebraMap K L x)).1 hx_le
 


theorem integralClosure_mem_valuationSubring_of_hasExtension
    {ΓL : Type x} [LinearOrderedCommGroupWithZero ΓL]
    (vK : _root_.Valuation K ΓK) (vL : _root_.Valuation L ΓL)
    [vK.HasExtension vL] (z : integralClosure vK.valuationSubring L) :
    (z : L) ∈ vL.valuationSubring := by
  have hz_base : IsIntegral vK.valuationSubring (z : L) :=
    z.2
  have hz_target : IsIntegral vL.valuationSubring (z : L) :=
    IsIntegral.tower_top (A := vL.valuationSubring) hz_base
  exact _root_.Valuation.Integers.mem_of_integral
    (_root_.Valuation.valuationSubring.integers (v := vL)) hz_target
 







theorem algebraMap_mem_integralClosure_valuationSubring_iff
    (vK : _root_.Valuation K ΓK) (a : K) :
    algebraMap K L a ∈ (integralClosure vK.valuationSubring L).toSubring ↔
      a ∈ vK.valuationSubring := by
  let A := vK.valuationSubring
  constructor
  · intro ha
    have ha_integral_L : IsIntegral A (algebraMap K L a) := ha
    have ha_integral_K : IsIntegral A a := by
      let f : K →ₐ[A] L := IsScalarTower.toAlgHom A K L
      exact (isIntegral_algHom_iff f (RingHom.injective _)).mp ha_integral_L
    have hclosed : IsIntegrallyClosedIn A K :=
      (isIntegrallyClosed_iff_isIntegrallyClosedIn (R := A) (K := K)).mp
        inferInstance
    let : IsIntegrallyClosedIn A K := hclosed
    rcases IsIntegrallyClosedIn.algebraMap_eq_of_integral
        (R := A) (A := K) ha_integral_K with
      ⟨b, hb⟩
    rw [← hb]
    exact b.2
  · intro ha
    change algebraMap A L (⟨a, ha⟩ : A) ∈
      (integralClosure A L).toSubring
    exact algebraMap_mem (integralClosure A L) (⟨a, ha⟩ : A)
 






def integralClosureValuationSubringOfMemOrInv
    (vK : _root_.Valuation K ΓK)
    (hval :
      ∀ z : L,
        z ∈ (integralClosure vK.valuationSubring L).toSubring ∨
          z⁻¹ ∈ (integralClosure vK.valuationSubring L).toSubring) :
    ValuationSubring L :=
  ValuationSubring.ofSubring
    (integralClosure vK.valuationSubring L).toSubring hval
 
@[simp] theorem mem_integralClosureValuationSubringOfMemOrInv
    (vK : _root_.Valuation K ΓK)
    (hval :
      ∀ z : L,
        z ∈ (integralClosure vK.valuationSubring L).toSubring ∨
          z⁻¹ ∈ (integralClosure vK.valuationSubring L).toSubring)
    (z : L) :
    z ∈ integralClosureValuationSubringOfMemOrInv (L := L) vK hval ↔
      z ∈ (integralClosure vK.valuationSubring L).toSubring :=
  ValuationSubring.mem_ofSubring _ _ z
 

theorem integralClosureValuationSubringOfMemOrInv_pullback
    (vK : _root_.Valuation K ΓK)
    (hval :
      ∀ z : L,
        z ∈ (integralClosure vK.valuationSubring L).toSubring ∨
          z⁻¹ ∈ (integralClosure vK.valuationSubring L).toSubring)
    (a : K) :
    algebraMap K L a ∈
        integralClosureValuationSubringOfMemOrInv (L := L) vK hval ↔
      a ∈ vK.valuationSubring := by
  rw [mem_integralClosureValuationSubringOfMemOrInv]
  exact algebraMap_mem_integralClosure_valuationSubring_iff (L := L) vK a
 


theorem integralClosureValuationSubringOfMemOrInv_hasExtension
    (vK : _root_.Valuation K ΓK)
    (hval :
      ∀ z : L,
        z ∈ (integralClosure vK.valuationSubring L).toSubring ∨
          z⁻¹ ∈ (integralClosure vK.valuationSubring L).toSubring) :
    vK.HasExtension
      (integralClosureValuationSubringOfMemOrInv (L := L) vK hval).valuation := by
  exact hasExtension_valuation_of_valuationSubring_pullback vK
    (integralClosureValuationSubringOfMemOrInv (L := L) vK hval)
    (integralClosureValuationSubringOfMemOrInv_pullback (L := L) vK hval)
 







theorem integralClosureValuationSubringOfMemOrInv_isIntegralClosure
    (vK : _root_.Valuation K ΓK)
    (hval :
      ∀ z : L,
        z ∈ (integralClosure vK.valuationSubring L).toSubring ∨
          z⁻¹ ∈ (integralClosure vK.valuationSubring L).toSubring) :
    let B := integralClosureValuationSubringOfMemOrInv (L := L) vK hval
    letI : vK.HasExtension B.valuation :=
      integralClosureValuationSubringOfMemOrInv_hasExtension (L := L) vK hval
    IsIntegralClosure B vK.valuationSubring L := by
  let B := integralClosureValuationSubringOfMemOrInv (L := L) vK hval
  let : vK.HasExtension B.valuation :=
    integralClosureValuationSubringOfMemOrInv_hasExtension (L := L) vK hval
  change IsIntegralClosure B vK.valuationSubring L
  refine
    { algebraMap_injective := Subtype.coe_injective
      isIntegral_iff := ?_ }
  intro z
  constructor
  · intro hz
    refine ⟨⟨z, ?_⟩, ?_⟩
    · exact
        (mem_integralClosureValuationSubringOfMemOrInv
          (L := L) vK hval z).2 hz
    · rfl
  · rintro ⟨y, rfl⟩
    exact
      (mem_integralClosureValuationSubringOfMemOrInv
        (L := L) vK hval (y : L)).1 y.2
 

theorem integralClosureValuationSubringOfMemOrInv_le_valuationSubring_of_hasExtension
    {ΓL : Type x} [LinearOrderedCommGroupWithZero ΓL]
    (vK : _root_.Valuation K ΓK) (vL : _root_.Valuation L ΓL)
    (hval :
      ∀ z : L,
        z ∈ (integralClosure vK.valuationSubring L).toSubring ∨
          z⁻¹ ∈ (integralClosure vK.valuationSubring L).toSubring)
    [vK.HasExtension vL] :
    integralClosureValuationSubringOfMemOrInv (L := L) vK hval ≤
      vL.valuationSubring := by
  intro z hz
  have hz_integral :
      z ∈ (integralClosure vK.valuationSubring L).toSubring := by
    exact
      (mem_integralClosureValuationSubringOfMemOrInv
        (L := L) vK hval z).1 hz
  exact integralClosure_mem_valuationSubring_of_hasExtension
    (L := L) vK vL ⟨z, hz_integral⟩
 



theorem valuationSubring_eq_of_le_of_idealOfLE_eq_maximalIdeal
    (R S : ValuationSubring L) (hRS : R ≤ S)
    (hcenter :
      ValuationSubring.idealOfLE R S hRS = IsLocalRing.maximalIdeal R) :
    S = R := by
  have hcenter_self :
      ValuationSubring.idealOfLE R R le_rfl = IsLocalRing.maximalIdeal R := by
    change (IsLocalRing.maximalIdeal R).comap (R.inclusion R le_rfl) =
      IsLocalRing.maximalIdeal R
    ext x
    rfl
  have hle :
      ValuationSubring.idealOfLE R R le_rfl ≤
        ValuationSubring.idealOfLE R S hRS := by
    intro x hx
    rw [hcenter_self] at hx
    rw [hcenter]
    exact hx
  have hOfPrime :
      ValuationSubring.ofPrime R (ValuationSubring.idealOfLE R S hRS) ≤
        ValuationSubring.ofPrime R (ValuationSubring.idealOfLE R R le_rfl) :=
    ValuationSubring.ofPrime_le_of_le (A := R)
      (ValuationSubring.idealOfLE R R le_rfl)
      (ValuationSubring.idealOfLE R S hRS) hle
  have hSR : S ≤ R := by
    intro x hx
    have hx' :
        x ∈ ValuationSubring.ofPrime R
          (ValuationSubring.idealOfLE R S hRS) := by
      rwa [ValuationSubring.ofPrime_idealOfLE R S hRS]
    have hx'' := hOfPrime hx'
    rwa [ValuationSubring.ofPrime_idealOfLE R R le_rfl] at hx''
  exact le_antisymm hSR hRS
 

def integralClosureToValuationSubringOfHasExtension
    {ΓL : Type x} [LinearOrderedCommGroupWithZero ΓL]
    (vK : _root_.Valuation K ΓK) (vL : _root_.Valuation L ΓL)
    [vK.HasExtension vL] :
    integralClosure vK.valuationSubring L →+* vL.valuationSubring where
  toFun z :=
    ⟨(z : L),
      integralClosure_mem_valuationSubring_of_hasExtension
        (L := L) vK vL z⟩
  map_zero' := by ext; simp
  map_one' := by ext; simp
  map_add' z₁ z₂ := by ext; simp
  map_mul' z₁ z₂ := by ext; simp
 



theorem valuationSubring_mem_integralClosure_of_isIntegral
    {ΓL : Type x} [LinearOrderedCommGroupWithZero ΓL]
    (vK : _root_.Valuation K ΓK) (vL : _root_.Valuation L ΓL)
    [vK.HasExtension vL]
    [Algebra.IsIntegral vK.valuationSubring vL.valuationSubring]
    (z : vL.valuationSubring) :
    (z : L) ∈ integralClosure vK.valuationSubring L := by
  have hz_ring : IsIntegral vK.valuationSubring z :=
    Algebra.IsIntegral.isIntegral (R := vK.valuationSubring) z
  have hz_field : IsIntegral vK.valuationSubring
      (algebraMap vL.valuationSubring L z) :=
    hz_ring.map
      (IsScalarTower.toAlgHom vK.valuationSubring vL.valuationSubring L)
  rw [mem_integralClosure_iff]
  simpa using hz_field
 



theorem valuationSubring_isIntegralClosure_of_isIntegral
    {ΓL : Type x} [LinearOrderedCommGroupWithZero ΓL]
    (vK : _root_.Valuation K ΓK) (vL : _root_.Valuation L ΓL)
    [vK.HasExtension vL]
    [Algebra.IsIntegral vK.valuationSubring vL.valuationSubring] :
    IsIntegralClosure vL.valuationSubring vK.valuationSubring L := by
  refine
    { algebraMap_injective := Subtype.coe_injective
      isIntegral_iff := ?_ }
  intro z
  constructor
  · intro hz
    refine ⟨integralClosureToValuationSubringOfHasExtension
      (L := L) vK vL ⟨z, hz⟩, ?_⟩
    rfl
  · rintro ⟨y, rfl⟩
    exact valuationSubring_mem_integralClosure_of_isIntegral
      (L := L) vK vL y
 

theorem valuationSubring_isScalarTower_of_hasExtension
    {ΓL : Type x} [LinearOrderedCommGroupWithZero ΓL]
    (vK : _root_.Valuation K ΓK) (vL : _root_.Valuation L ΓL)
    [vK.HasExtension vL] :
    IsScalarTower vK.valuationSubring vL.valuationSubring L := by
  refine ⟨?_⟩
  intro a b z
  simp only [Algebra.smul_def]
  have hmap :
      (algebraMap vL.valuationSubring L)
          ((algebraMap vK.valuationSubring vL.valuationSubring) a) =
        (algebraMap vK.valuationSubring L) a := by
    rfl
  rw [map_mul, hmap, mul_assoc]
section Tower
variable {M : Type y} [Field M]
variable [Algebra L M] [Algebra K M] [IsScalarTower K L M]
variable {ΓL : Type x} {ΓM : Type z}
variable [LinearOrderedCommGroupWithZero ΓL]
variable [LinearOrderedCommGroupWithZero ΓM]
end Tower
end Valuation
end DiscreteValuationField
end
end ValuationTheory
end

/- ValuedFieldTheory.Valuation.DiscreteValuationField.FiniteExtension.Defectless -/
section
noncomputable section
namespace ValuationTheory.DiscreteValuationField.ValuedExtension
universe u v w x
variable {K : Type u} {L : Type w} [Field K] [Field L] [Algebra K L]
 

theorem isDefectless_of_moduleFinite
    (base : DVF.{u, v} K) (target : DVF.{w, x} L)
    [base.valuation.HasExtension target.valuation]
    [Module.Finite base.valuationSubring target.valuationSubring]
    [IsScalarTower base.valuationSubring target.valuationSubring L] :
    IsDefectless base target := by
  classical
  let : FaithfulSMul base.valuationSubring target.valuationSubring :=
    FaithfulSMul.of_field_isFractionRing
      base.valuationSubring target.valuationSubring K L
  have hprimes :=
    IsLocalRing.primesOver_eq target.valuationSubring base.maximalIdeal_ne_bot
  have hq : target.maximalIdeal ∈ base.maximalIdeal.primesOver target.valuationSubring := by
    rw [hprimes]
    exact Set.mem_singleton target.maximalIdeal
  let : target.maximalIdeal.LiesOver base.maximalIdeal := hq.2
  let : Subsingleton (base.maximalIdeal.primesOver target.valuationSubring) :=
    Set.Subsingleton.coe_sort (by
      rw [hprimes]
      exact Set.subsingleton_singleton)
  have hsum :=
    Ideal.sum_ramification_inertia_eq_finrank base.maximalIdeal target.valuationSubring
  rw [Fintype.sum_subsingleton _ ⟨target.maximalIdeal, hq⟩] at hsum
  change Module.finrank K L =
    Ideal.ramificationIdx' base.maximalIdeal target.maximalIdeal *
      base.maximalIdeal.inertiaDeg' target.maximalIdeal
  rw [Ideal.ramificationIdx'_eq_ramificationIdx
      base.maximalIdeal target.maximalIdeal base.maximalIdeal_ne_bot,
    Ideal.inertiaDeg'_eq_inertiaDeg base.maximalIdeal target.maximalIdeal,
    IsFractionRing.finrank_eq base.valuationSubring K target.valuationSubring L]
  exact hsum.symm
end ValuationTheory.DiscreteValuationField.ValuedExtension
end
end

/- ValuedFieldTheory.Valuation.DiscreteValuationField.FiniteExtension.Degree -/
section
namespace ValuationTheory
noncomputable section
universe u v w x y
namespace DiscreteValuationField
namespace ValuedExtension
open ValuationTheory.DiscreteValuationField.Valuation
variable {K : Type u} {L : Type w} [Field K] [Field L]
variable [Algebra K L] [FiniteDimensional K L]
variable (base : CompleteDVF.{u, v} K) (target : CompleteDVF.{w, x} L)
variable [base.valuation.HasExtension target.valuation]
 



def integralClosureValuationSubringIntegerMapOfMemOrInv
    (base : CompleteDVF.{u, v} K)
    (hval :
      ∀ z : L,
        z ∈ (integralClosure base.valuationSubring L).toSubring ∨
          z⁻¹ ∈ (integralClosure base.valuationSubring L).toSubring) :
    base.valuationSubring →+*
      integralClosureValuationSubringOfMemOrInv
        (L := L) base.valuation hval where
  toFun a :=
    ⟨algebraMap K L (a : K),
      (integralClosureValuationSubringOfMemOrInv_pullback
        (L := L) base.valuation hval (a : K)).2 a.2⟩
  map_zero' := by ext; simp
  map_one' := by ext; simp
  map_add' := by intro a b; ext; simp
  map_mul' := by intro a b; ext; simp
omit [FiniteDimensional K L] in
 



theorem integralClosureValuationSubringIntegerMapOfMemOrInv_injective
    (base : CompleteDVF.{u, v} K)
    (hval :
      ∀ z : L,
        z ∈ (integralClosure base.valuationSubring L).toSubring ∨
          z⁻¹ ∈ (integralClosure base.valuationSubring L).toSubring) :
    Function.Injective
      (integralClosureValuationSubringIntegerMapOfMemOrInv
        (K := K) (L := L) base hval) := by
  intro a b hab
  apply Subtype.ext
  apply FaithfulSMul.algebraMap_injective K L
  have hvalEq := congrArg
    (fun x :
      integralClosureValuationSubringOfMemOrInv
        (L := L) base.valuation hval => (x : L)) hab
  change algebraMap K L (a : K) = algebraMap K L (b : K) at hvalEq
  exact hvalEq
omit [FiniteDimensional K L] in
 








theorem idealOfLE_comap_integralClosureValuationSubringIntegerMap_eq_maximalIdeal
    {ΓL : Type x} [LinearOrderedCommGroupWithZero ΓL]
    (base : CompleteDVF.{u, v} K) (vL : _root_.Valuation L ΓL)
    [base.valuation.HasExtension vL]
    (hval :
      ∀ z : L,
        z ∈ (integralClosure base.valuationSubring L).toSubring ∨
          z⁻¹ ∈ (integralClosure base.valuationSubring L).toSubring) :
    let B :=
      integralClosureValuationSubringOfMemOrInv
        (L := L) base.valuation hval
    let hvL_le : B ≤ vL.valuationSubring :=
      integralClosureValuationSubringOfMemOrInv_le_valuationSubring_of_hasExtension
        (L := L) base.valuation vL hval
    (ValuationSubring.idealOfLE B vL.valuationSubring hvL_le).comap
        (integralClosureValuationSubringIntegerMapOfMemOrInv
          (K := K) (L := L) base hval) =
      base.maximalIdeal := by
  let B :=
    integralClosureValuationSubringOfMemOrInv
      (L := L) base.valuation hval
  let hvL_le : B ≤ vL.valuationSubring :=
    integralClosureValuationSubringOfMemOrInv_le_valuationSubring_of_hasExtension
      (L := L) base.valuation vL hval
  let i : base.valuationSubring →+* B :=
    integralClosureValuationSubringIntegerMapOfMemOrInv
      (K := K) (L := L) base hval
  apply Ideal.ext
  intro a
  rw [Ideal.mem_comap]
  change B.inclusion vL.valuationSubring hvL_le (i a) ∈
      IsLocalRing.maximalIdeal vL.valuationSubring ↔
    a ∈ IsLocalRing.maximalIdeal base.valuation.valuationSubring
  rw [Valuation.mem_maximalIdeal_iff (v := vL)]
  rw [Valuation.mem_maximalIdeal_iff (v := base.valuation)]
  change vL
      ((B.inclusion vL.valuationSubring hvL_le (i a) :
        vL.valuationSubring) : L) < 1 ↔
    base.valuation (a : K) < 1
  have hcoe :
      ((B.inclusion vL.valuationSubring hvL_le (i a) :
        vL.valuationSubring) : L) =
        algebraMap K L (a : K) := by
    rfl
  rw [hcoe]
  exact Valuation.HasExtension.val_map_lt_one_iff base.valuation vL (a : K)
 








theorem prime_eq_maximalIdeal_of_comap_integralClosureValuationSubringIntegerMap_eq_maximalIdeal
    (base : CompleteDVF.{u, v} K)
    [Algebra.IsSeparable K L]
    (hval :
      ∀ z : L,
        z ∈ (integralClosure base.valuationSubring L).toSubring ∨
          z⁻¹ ∈ (integralClosure base.valuationSubring L).toSubring)
    (P :
      Ideal
        (integralClosureValuationSubringOfMemOrInv
          (L := L) base.valuation hval))
    (hP : P.IsPrime)
    (hcomap :
      P.comap
          (integralClosureValuationSubringIntegerMapOfMemOrInv
            (K := K) (L := L) base hval) =
        base.maximalIdeal) :
    P =
      IsLocalRing.maximalIdeal
        (integralClosureValuationSubringOfMemOrInv
          (L := L) base.valuation hval) := by
  let B :=
    integralClosureValuationSubringOfMemOrInv
      (L := L) base.valuation hval
  let i : base.valuationSubring →+* B :=
    integralClosureValuationSubringIntegerMapOfMemOrInv
      (K := K) (L := L) base hval
  let : base.valuation.HasExtension B.valuation :=
    integralClosureValuationSubringOfMemOrInv_hasExtension
      (L := L) base.valuation hval
  let : IsFractionRing base.valuationSubring K :=
    base_valuationSubring_isFractionRing (K := K) base
  let : IsDiscreteValuationRing base.valuationSubring :=
    base.valuationSubring_isDiscreteValuationRing
  let : IsDedekindDomain base.valuationSubring := inferInstance
  let : Algebra base.valuationSubring B := RingHom.toAlgebra i
  let : IsScalarTower base.valuationSubring B L :=
    IsScalarTower.of_algebraMap_eq (by
      intro a
      rfl)
  let : IsIntegralClosure B base.valuationSubring L :=
    integralClosureValuationSubringOfMemOrInv_isIntegralClosure
      (L := L) base.valuation hval
  let : IsDedekindDomain B :=
    IsIntegralClosure.isDedekindDomain base.valuationSubring K L B
  have hi : Function.Injective i :=
    integralClosureValuationSubringIntegerMapOfMemOrInv_injective
      (K := K) (L := L) base hval
  have hP_ne_bot : P ≠ ⊥ := by
    have hnot_le_bot : ¬ base.maximalIdeal ≤ ⊥ := by
      intro hle
      exact base.maximalIdeal_ne_bot (le_antisymm hle bot_le)
    obtain ⟨a, ha_max, ha_not_bot⟩ := Set.not_subset.mp hnot_le_bot
    have ha_ne_zero : a ≠ 0 := by
      intro ha
      exact ha_not_bot (by simp [ha])
    intro hPbot
    have ha_comap : a ∈ P.comap i := by
      simpa [B, i, hcomap] using ha_max
    have hai_mem : i a ∈ P := by
      simpa [Ideal.mem_comap] using ha_comap
    have hai_zero : i a = 0 := by
      simpa [hPbot] using hai_mem
    exact ha_ne_zero (hi (by simpa using hai_zero))
  exact IsLocalRing.eq_maximalIdeal (hP.isMaximal hP_ne_bot)
omit [FiniteDimensional K L] in
 


theorem ideal_ramificationIdx_mul_inertiaDeg_eq_finrank_of_hasExtension
    (base : CompleteDVF.{u, v} K) (target : CompleteDVF.{w, x} L)
    [base.valuation.HasExtension target.valuation]
    [Module.Finite base.valuationSubring target.valuationSubring]
    [IsScalarTower base.valuationSubring target.valuationSubring L] :
    Ideal.ramificationIdx' base.maximalIdeal target.maximalIdeal *
      base.maximalIdeal.inertiaDeg' target.maximalIdeal = Module.finrank K L := by
  exact (isDefectless_of_moduleFinite base.toDVF target.toDVF).symm
 


theorem ideal_ramificationIdx_mul_inertiaDeg_eq_finrank_of_isIntegralClosure
    (base : CompleteDVF.{u, v} K) (target : CompleteDVF.{w, x} L)
    [base.valuation.HasExtension target.valuation]
    [Algebra.IsSeparable K L]
    [IsScalarTower base.valuationSubring target.valuationSubring L]
    [IsIntegralClosure target.valuationSubring base.valuationSubring L] :
    Ideal.ramificationIdx' base.maximalIdeal target.maximalIdeal *
      base.maximalIdeal.inertiaDeg' target.maximalIdeal = Module.finrank K L := by
  let : Module.Finite base.valuationSubring target.valuationSubring :=
    moduleFinite_target_valuationSubring_of_isIntegralClosure
      (K := K) (L := L) base target
  exact ideal_ramificationIdx_mul_inertiaDeg_eq_finrank_of_hasExtension
    (K := K) (L := L) base target
 
theorem isDefectless_of_isIntegralClosure
    (base : CompleteDVF.{u, v} K) (target : CompleteDVF.{w, x} L)
    [base.valuation.HasExtension target.valuation]
    [Algebra.IsSeparable K L]
    [IsScalarTower base.valuationSubring target.valuationSubring L]
    [IsIntegralClosure target.valuationSubring base.valuationSubring L] :
    ValuedExtension.IsDefectless base.toDVF target.toDVF := by
  change Module.finrank K L =
    Ideal.ramificationIdx' base.maximalIdeal target.maximalIdeal *
      base.maximalIdeal.inertiaDeg' target.maximalIdeal
  exact (ideal_ramificationIdx_mul_inertiaDeg_eq_finrank_of_isIntegralClosure
    (K := K) (L := L) base target).symm
end ValuedExtension
end DiscreteValuationField
end
end ValuationTheory
end

/- ValuedFieldTheory.Valuation.DiscreteValuationField.FiniteExtension.Uniqueness -/
section
namespace ValuationTheory
noncomputable section
universe u v w x y
namespace DiscreteValuationField
namespace ValuedExtension
variable {K : Type u} {L : Type w} [Field K] [Field L]
variable [Algebra K L] [FiniteDimensional K L]
variable (base : CompleteDVF.{u, v} K) (target : CompleteDVF.{w, x} L)
variable [base.valuation.HasExtension target.valuation]
 
def HasUniqueValuationExtension (base : CompleteDVF.{u, v} K)
    (target : CompleteDVF.{w, x} L) : Prop :=
  ∀ {Gamma' : Type y} [LinearOrderedCommGroupWithZero Gamma']
    (v' : _root_.Valuation L Gamma') [base.valuation.HasExtension v'],
      target.valuation.IsEquiv v'
omit [FiniteDimensional K L] in
 









theorem hasUniqueValuationExtension_of_integralClosure_mem_or_inv_of_forall_center_eq_maximalIdeal

    (hval :
      ∀ z : L,
        z ∈ (integralClosure base.valuationSubring L).toSubring ∨
          z⁻¹ ∈ (integralClosure base.valuationSubring L).toSubring)
    (htargetCenter :
      ValuationSubring.idealOfLE
        (ValuationTheory.DiscreteValuationField.Valuation.integralClosureValuationSubringOfMemOrInv
          (L := L) base.valuation hval)
        target.valuation.valuationSubring
        (ValuationTheory.DiscreteValuationField.Valuation.integralClosureValuationSubringOfMemOrInv_le_valuationSubring_of_hasExtension
          (L := L) base.valuation target.valuation hval) =
        IsLocalRing.maximalIdeal
          (ValuationTheory.DiscreteValuationField.Valuation.integralClosureValuationSubringOfMemOrInv
            (L := L) base.valuation hval))
    (hcenter :
      ∀ {Gamma' : Type y} [LinearOrderedCommGroupWithZero Gamma']
        (v' : _root_.Valuation L Gamma') [base.valuation.HasExtension v'],
          ValuationSubring.idealOfLE
            (ValuationTheory.DiscreteValuationField.Valuation.integralClosureValuationSubringOfMemOrInv
              (L := L) base.valuation hval)
            v'.valuationSubring
            (ValuationTheory.DiscreteValuationField.Valuation.integralClosureValuationSubringOfMemOrInv_le_valuationSubring_of_hasExtension
              (L := L) base.valuation v' hval) =
            IsLocalRing.maximalIdeal
              (ValuationTheory.DiscreteValuationField.Valuation.integralClosureValuationSubringOfMemOrInv
                (L := L) base.valuation hval)) :
    HasUniqueValuationExtension.{u, v, w, x, y} (base := base) (target := target) := by
  let B :=
    ValuationTheory.DiscreteValuationField.Valuation.integralClosureValuationSubringOfMemOrInv
      (L := L) base.valuation hval
  have htarget_le : B ≤ target.valuation.valuationSubring :=
    ValuationTheory.DiscreteValuationField.Valuation.integralClosureValuationSubringOfMemOrInv_le_valuationSubring_of_hasExtension
      (L := L) base.valuation target.valuation hval
  have htarget_eq : target.valuation.valuationSubring = B :=
    ValuationTheory.DiscreteValuationField.Valuation.valuationSubring_eq_of_le_of_idealOfLE_eq_maximalIdeal
      B target.valuation.valuationSubring htarget_le
      (by simpa [B, htarget_le] using htargetCenter)
  intro Gamma' _ v' hExt
  let : base.valuation.HasExtension v' := hExt
  have hv_le : B ≤ v'.valuationSubring :=
    ValuationTheory.DiscreteValuationField.Valuation.integralClosureValuationSubringOfMemOrInv_le_valuationSubring_of_hasExtension
      (L := L) base.valuation v' hval
  have hv_eq : v'.valuationSubring = B :=
    ValuationTheory.DiscreteValuationField.Valuation.valuationSubring_eq_of_le_of_idealOfLE_eq_maximalIdeal
      B v'.valuationSubring hv_le
      (by simpa [B, hv_le] using (@hcenter Gamma' inferInstance v' hExt))
  have hSubring : target.valuation.valuationSubring = v'.valuationSubring :=
    htarget_eq.trans hv_eq.symm
  exact valuation_isEquiv_of_valuationSubring_eq target v' hSubring
omit [FiniteDimensional K L] in
 







theorem hasUniqueValuationExtension_of_integralClosure_mem_or_inv_of_unique_primes_over_base_maximal

    (hval :
      ∀ z : L,
        z ∈ (integralClosure base.valuationSubring L).toSubring ∨
          z⁻¹ ∈ (integralClosure base.valuationSubring L).toSubring)
    (hunique :
      let B :=
        ValuationTheory.DiscreteValuationField.Valuation.integralClosureValuationSubringOfMemOrInv
          (L := L) base.valuation hval
      let i : base.valuationSubring →+* B :=
        integralClosureValuationSubringIntegerMapOfMemOrInv
          (K := K) (L := L) base hval
      ∀ P : Ideal B, P.IsPrime → P.comap i = base.maximalIdeal →
        P = IsLocalRing.maximalIdeal B) :
    HasUniqueValuationExtension.{u, v, w, x, y} (base := base) (target := target) := by
  let B :=
    ValuationTheory.DiscreteValuationField.Valuation.integralClosureValuationSubringOfMemOrInv
      (L := L) base.valuation hval
  let i : base.valuationSubring →+* B :=
    integralClosureValuationSubringIntegerMapOfMemOrInv
      (K := K) (L := L) base hval
  refine
    (hasUniqueValuationExtension_of_integralClosure_mem_or_inv_of_forall_center_eq_maximalIdeal
      (K := K) (L := L) (base := base) (target := target)  hval ?_ ?_ :
        HasUniqueValuationExtension.{u, v, w, x, y} (base := base) (target := target))
  · let htarget_le : B ≤ target.valuation.valuationSubring :=
      ValuationTheory.DiscreteValuationField.Valuation.integralClosureValuationSubringOfMemOrInv_le_valuationSubring_of_hasExtension
        (L := L) base.valuation target.valuation hval
    exact hunique
      (ValuationSubring.idealOfLE B target.valuation.valuationSubring htarget_le)
      (by infer_instance)
      (by
        simpa [B, htarget_le, i] using
          idealOfLE_comap_integralClosureValuationSubringIntegerMap_eq_maximalIdeal
            (K := K) (L := L) base target.valuation hval)
  · intro Gamma' _ v' hExt
    let : base.valuation.HasExtension v' := hExt
    let hv_le : B ≤ v'.valuationSubring :=
      ValuationTheory.DiscreteValuationField.Valuation.integralClosureValuationSubringOfMemOrInv_le_valuationSubring_of_hasExtension
        (L := L) base.valuation v' hval
    exact hunique
      (ValuationSubring.idealOfLE B v'.valuationSubring hv_le)
      (by infer_instance)
      (by
        simpa [B, hv_le, i] using
          idealOfLE_comap_integralClosureValuationSubringIntegerMap_eq_maximalIdeal
            (K := K) (L := L) base v' hval)
 






theorem hasUniqueValuationExtension_of_integralClosure_mem_or_inv

    [Algebra.IsSeparable K L]
    (hval :
      ∀ z : L,
        z ∈ (integralClosure base.valuationSubring L).toSubring ∨
          z⁻¹ ∈ (integralClosure base.valuationSubring L).toSubring) :
    HasUniqueValuationExtension.{u, v, w, x, y} (base := base) (target := target) :=
  (hasUniqueValuationExtension_of_integralClosure_mem_or_inv_of_unique_primes_over_base_maximal base target)
    hval
    (by
      let B :=
        ValuationTheory.DiscreteValuationField.Valuation.integralClosureValuationSubringOfMemOrInv
          (L := L) base.valuation hval
      let i : base.valuationSubring →+* B :=
        integralClosureValuationSubringIntegerMapOfMemOrInv
          (K := K) (L := L) base hval
      change ∀ P : Ideal B, P.IsPrime → P.comap i = base.maximalIdeal →
        P = IsLocalRing.maximalIdeal B
      intro P hP hcomap
      exact
        prime_eq_maximalIdeal_of_comap_integralClosureValuationSubringIntegerMap_eq_maximalIdeal
          (K := K) (L := L) (base := base) hval P hP hcomap)
 





theorem hasUniqueValuationExtension_of_integralClosure_isLocalRing

    [Algebra.IsSeparable K L]
    [IsLocalRing (integralClosureIntegers base target)] :
    HasUniqueValuationExtension.{u, v, w, x, y} (base := base) (target := target) :=
  (hasUniqueValuationExtension_of_integralClosure_mem_or_inv base target)
    (integralClosure_mem_or_inv_of_isLocalRing base target)
 






theorem hasUniqueValuationExtension_of_integralClosure_base_maximal_fiber_subsingleton

    [Algebra.IsSeparable K L]
    [Subsingleton
      (PrimeSpectrum (base.maximalIdeal.Fiber (integralClosureIntegers base target)))] :
    HasUniqueValuationExtension.{u, v, w, x, y} (base := base) (target := target) := by
  let : IsLocalRing (integralClosureIntegers base target) :=
    (integralClosure_isLocalRing_of_base_maximal_fiber_subsingleton base target)
  exact
    (hasUniqueValuationExtension_of_integralClosure_isLocalRing
      (K := K) (L := L) (base := base) (target := target)  :
        HasUniqueValuationExtension.{u, v, w, x, y}
          (base := base) (target := target))
 





theorem hasUniqueValuationExtension_of_integralClosure_base_maximal_map_henselianRing

    [Algebra.IsSeparable K L]
    [HenselianRing (integralClosureIntegers base target)
      (base.maximalIdeal.map
        (algebraMap base.valuationSubring (integralClosureIntegers base target)))] :
    HasUniqueValuationExtension.{u, v, w, x, y} (base := base) (target := target) := by
  let : Subsingleton
      (PrimeSpectrum (base.maximalIdeal.Fiber (integralClosureIntegers base target))) :=
    (integralClosure_base_maximal_fiber_subsingleton_of_henselianRing_maximalIdeal_map base target)
  exact
    (hasUniqueValuationExtension_of_integralClosure_base_maximal_fiber_subsingleton
      (K := K) (L := L) (base := base) (target := target)  :
        HasUniqueValuationExtension.{u, v, w, x, y}
          (base := base) (target := target))
 






theorem hasUniqueValuationExtension_of_finite_separable

    [Algebra.IsSeparable K L] :
    HasUniqueValuationExtension.{u, v, w, x, y} (base := base) (target := target) := by
  let : HenselianRing (integralClosureIntegers base target)
      (base.maximalIdeal.map
        (algebraMap base.valuationSubring (integralClosureIntegers base target))) :=
    (integralClosure_base_maximal_map_henselianRing base target)
  exact
    (hasUniqueValuationExtension_of_integralClosure_base_maximal_map_henselianRing
      (K := K) (L := L) (base := base) (target := target)  :
        HasUniqueValuationExtension.{u, v, w, x, y}
          (base := base) (target := target))
omit [FiniteDimensional K L] [base.valuation.HasExtension target.valuation] in
 

theorem target_valuationSubring_eq_of_hasUniqueValuationExtension
    (huniq : HasUniqueValuationExtension.{u, v, w, x, w}
      (base := base) (target := target))
    (B : ValuationSubring L) [base.valuation.HasExtension B.valuation] :
    target.valuation.valuationSubring = B := by
  have hEquiv : target.valuation.IsEquiv B.valuation :=
    huniq B.valuation
  have hSubring :
      target.valuation.valuationSubring = B.valuation.valuationSubring :=
    (_root_.Valuation.isEquiv_iff_valuationSubring
      target.valuation B.valuation).1 hEquiv
  simpa [ValuationSubring.valuationSubring_valuation] using hSubring
 

theorem target_valuationSubring_eq_of_finite_separable

    [Algebra.IsSeparable K L]
    (B : ValuationSubring L) [base.valuation.HasExtension B.valuation] :
    target.valuation.valuationSubring = B := by
  exact target_valuationSubring_eq_of_hasUniqueValuationExtension
    (K := K) (L := L) (base := base) (target := target)
    ((hasUniqueValuationExtension_of_finite_separable base target) :
      HasUniqueValuationExtension.{u, v, w, x, w}
        (base := base) (target := target)) B
end ValuedExtension
end DiscreteValuationField
end
end ValuationTheory
end

/- ValuedFieldTheory.Valuation.UniqueRing -/
section
namespace ValuationTheory
noncomputable section
open scoped Pointwise
namespace Valuations
 


def valuationSubringMapOfHasExtension
    {K L : Type*} [Field K] [Field L] [Algebra K L]
    (V : ValuationSubring K) (W : ValuationSubring L)
    (hW : V.valuation.HasExtension W.valuation) : V →+* W := by
  letI : V.valuation.HasExtension W.valuation := hW
  exact (algebraMap K L).restrict V.toSubring W.toSubring (by
    intro x hx
    exact
      (ValuationTheory.DiscreteValuationField.Valuation.valuationSubring_pullback_of_hasExtension_valuation
        V.valuation W x).2 (by
          simpa only [ValuationSubring.valuationSubring_valuation,
            ValuationSubring.mem_toSubring] using hx))
end Valuations
end
end ValuationTheory
end

/- ValuedFieldTheory.Ramification.HilbertRamification.ValuationSubring -/
section
namespace RamificationTheory
noncomputable section
universe u v
namespace HilbertRamification
namespace ValuationSubring
variable (K : Type u) {L : Type v} [Field K] [Field L] [Algebra K L]
 

abbrev decompositionGroup (A : _root_.ValuationSubring L) :
    Subgroup (L ≃ₐ[K] L) :=
  A.decompositionSubgroup K
 

abbrev decompositionField (A : _root_.ValuationSubring L) :
    IntermediateField K L :=
  IntermediateField.fixedField (decompositionGroup K A)
section IntermediateFieldFunctoriality
variable {M : Type*} [Field M] [Algebra K M] [Algebra M L]
  [IsScalarTower K M L]
end IntermediateFieldFunctoriality
end ValuationSubring
end HilbertRamification
end
end RamificationTheory
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
 
@[simp]
theorem normUnits_apply_coe (x : Lˣ) :
    ((normUnits K L x : Kˣ) : K) = Algebra.norm K (x : L) :=
  rfl
end
end LocalFieldTheory
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

/- ValuedFieldTheory.LocalField.NonarchimedeanLocalField.ValuativeExtension -/
section
namespace Valuation
end Valuation
namespace LocalFieldTheory
noncomputable section
universe u v
open scoped ValuativeRel
 


class ValuativeExtension (K : Type u) (L : Type v) [Field K] [ValuativeRel K]
    [Field L] [ValuativeRel L] [Algebra K L] : Prop where
   

  integer_isIntegral : ∀ x : ((ValuativeRel.valuation (L)).integer), IsIntegral ((ValuativeRel.valuation (K)).integer) (x : L)
 

instance valuativeExtensionOfIsIntegralClosure
    (K : Type u) (L : Type v) [Field K] [ValuativeRel K]
    [Field L] [ValuativeRel L] [Algebra K L] [IsIntegralClosure ((ValuativeRel.valuation (L)).integer) ((ValuativeRel.valuation (K)).integer) L] :
    ValuativeExtension K L where
  integer_isIntegral x :=
    (IsIntegralClosure.isIntegral_iff (A := ((ValuativeRel.valuation (L)).integer)) (R := ((ValuativeRel.valuation (K)).integer)) (B := L)).2 ⟨x, rfl⟩
end
end LocalFieldTheory
end

/- ValuedFieldTheory.LocalField.NonarchimedeanLocalField.Basic -/
section
namespace LocalFieldTheory
noncomputable section
universe u
namespace IsNonarchimedeanLocalField
open scoped ValuativeRel WithZero
 



noncomputable def v (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] : Additive Kˣ → Int :=
  fun x =>
    Multiplicative.toAdd
      (WithZero.unzero
        (x := (_root_.IsNonarchimedeanLocalField.valueGroupWithZeroIsoInt K)
          (ValuativeRel.valuation K ((Additive.toMul x : Kˣ) : K)))
        (by simp))
 

@[simp]
theorem v_apply (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (x : Additive Kˣ) :
    v K x =
      Multiplicative.toAdd
        (WithZero.unzero
          (x := (_root_.IsNonarchimedeanLocalField.valueGroupWithZeroIsoInt K)
            (ValuativeRel.valuation K ((Additive.toMul x : Kˣ) : K)))
          (by simp)) :=
  rfl
 
theorem v_surjective (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] :
    Function.Surjective (v K) := by
  intro n
  let γ : ValuativeRel.ValueGroupWithZero K :=
    (_root_.IsNonarchimedeanLocalField.valueGroupWithZeroIsoInt K).symm
      ((Multiplicative.ofAdd n : Multiplicative Int) : WithZero (Multiplicative Int))
  obtain ⟨a, ha⟩ := ValuativeRel.valuation_surjective γ
  have hγ_ne : γ ≠ 0 := by
    dsimp [γ]
    simp
  have ha0 : a ≠ 0 := by
    intro h
    apply hγ_ne
    simpa [h] using ha.symm
  refine ⟨Additive.ofMul (Units.mk0 a ha0), ?_⟩
  simp [v, γ, ha]
 
theorem v_mul (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (x y : Kˣ) :
    v K (Additive.ofMul (x * y)) =
      v K (Additive.ofMul x) + v K (Additive.ofMul y) := by
  simp [v, Valuation.map_mul, WithZero.unzero_mul, toAdd_mul]
 
@[simp]
theorem v_one (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] :
    v K (Additive.ofMul (1 : Kˣ)) = 0 := by
  dsimp [v]
  have hunzero :
      WithZero.unzero
        (x := (_root_.IsNonarchimedeanLocalField.valueGroupWithZeroIsoInt K)
          (ValuativeRel.valuation K (((1 : Kˣ) : K))))
        (by simp) = (1 : Multiplicative Int) := by
    apply WithZero.coe_injective
    rw [WithZero.coe_unzero]
    simp
  rw [hunzero]
  exact toAdd_one
 
theorem v_inv (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (x : Kˣ) :
    v K (Additive.ofMul x⁻¹) = -v K (Additive.ofMul x) := by
  have hmul := v_mul K x x⁻¹
  rw [mul_inv_cancel, v_one] at hmul
  omega
 
theorem v_div (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (x y : Kˣ) :
    v K (Additive.ofMul (x / y)) =
      v K (Additive.ofMul x) - v K (Additive.ofMul y) := by
  rw [div_eq_mul_inv, v_mul, v_inv, sub_eq_add_neg]
 
theorem v_pow (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (x : Kˣ) (n : Nat) :
    v K (Additive.ofMul (x ^ n)) = (n : Int) * v K (Additive.ofMul x) := by
  induction n with
  | zero =>
      rw [pow_zero, v_one]
      simp
  | succ n ih =>
      rw [pow_succ, v_mul, ih]
      rw [show ((n + 1 : Nat) : Int) = (n : Int) + 1 by simp]
      ring
 

theorem v_zpow (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (x : Kˣ) (n : Int) :
    v K (Additive.ofMul (x ^ n)) = n * v K (Additive.ofMul x) := by
  cases n with
  | ofNat n =>
      simpa using v_pow K x n
  | negSucc n =>
      rw [zpow_negSucc, v_inv, v_pow]
      change -(((n + 1 : Nat) : Int) * v K (Additive.ofMul x)) =
        (-(((n + 1 : Nat) : Int))) * v K (Additive.ofMul x)
      ring
 
def integerUnitsToFieldUnits (K : Type u) [Field K] [ValuativeRel K] : ((ValuativeRel.valuation (K)).integer)ˣ →* Kˣ :=
  Units.map (algebraMap ((ValuativeRel.valuation (K)).integer) K).toMonoidHom
 
@[simp]
theorem v_integerUnitsToFieldUnits (K : Type u) [Field K] [ValuativeRel K]
    [TopologicalSpace K] [IsNonarchimedeanLocalField K] (x : ((ValuativeRel.valuation (K)).integer)ˣ) :
    v K (Additive.ofMul (integerUnitsToFieldUnits K x)) = 0 := by
  have hxv :
      ValuativeRel.valuation K ((integerUnitsToFieldUnits K x : Kˣ) : K) = 1 := by
    simpa [integerUnitsToFieldUnits] using
      (Valuation.Integers.valuation_unit
        (Valuation.integer.integers (ValuativeRel.valuation K)) x)
  rw [v_apply]
  apply (WithZero.toAdd_unzero_eq_iff _ 0).2
  change
    (_root_.IsNonarchimedeanLocalField.valueGroupWithZeroIsoInt K)
        (ValuativeRel.valuation K
          ((integerUnitsToFieldUnits K x : Kˣ) : K)) =
      ((Multiplicative.ofAdd (0 : Int) : Multiplicative Int) :
        WithZero (Multiplicative Int))
  rw [hxv, map_one]
  rfl
end IsNonarchimedeanLocalField
end
end LocalFieldTheory
end

/- ValuedFieldTheory.LocalField.NonarchimedeanLocalField.Norm -/
section
namespace LocalFieldTheory
noncomputable section
universe u v
namespace IsNonarchimedeanLocalField
open scoped BigOperators ValuativeRel
variable {K : Type u} {L : Type v}
section AlgebraNorm
variable [Field K] [Field L] [Algebra K L] [Module.Free K L] [Module.Finite K L]
end AlgebraNorm
section UnitNorm
variable [Field K] [Field L] [Algebra K L]
 
lemma algebraNorm_mem_integers_of_mem_integers [ValuativeRel K] [ValuativeRel L]
    [LocalFieldTheory.ValuativeExtension K L] (x : ((ValuativeRel.valuation (L)).integer)) :
    Algebra.norm K (x : L) ∈ ((ValuativeRel.valuation (K)).integer) := by
  exact Valuation.Integers.mem_of_integral
    (Valuation.integer.integers (ValuativeRel.valuation K))
    (Algebra.isIntegral_norm K (LocalFieldTheory.ValuativeExtension.integer_isIntegral x))
 
def normIntegerUnitsValue [ValuativeRel K] [ValuativeRel L]
    [LocalFieldTheory.ValuativeExtension K L] (x : ((ValuativeRel.valuation (L)).integer)ˣ) : ((ValuativeRel.valuation (K)).integer) :=
  ⟨Algebra.norm K (((x : ((ValuativeRel.valuation (L)).integer)ˣ) : ((ValuativeRel.valuation (L)).integer)) : L),
    algebraNorm_mem_integers_of_mem_integers ((x : ((ValuativeRel.valuation (L)).integer)ˣ) : ((ValuativeRel.valuation (L)).integer))⟩
 
lemma normIntegerUnitsValue_mul_inv [ValuativeRel K] [ValuativeRel L]
    [LocalFieldTheory.ValuativeExtension K L] (x : ((ValuativeRel.valuation (L)).integer)ˣ) :
    normIntegerUnitsValue (K := K) (L := L) x *
      normIntegerUnitsValue (K := K) (L := L) x⁻¹ = 1 := by
  ext
  change Algebra.norm K (((x : ((ValuativeRel.valuation (L)).integer)ˣ) : ((ValuativeRel.valuation (L)).integer)) : L) *
      Algebra.norm K (((x⁻¹ : ((ValuativeRel.valuation (L)).integer)ˣ) : ((ValuativeRel.valuation (L)).integer)) : L) = 1
  have hx : (((x : ((ValuativeRel.valuation (L)).integer)ˣ) : ((ValuativeRel.valuation (L)).integer)) : L) *
      (((x⁻¹ : ((ValuativeRel.valuation (L)).integer)ˣ) : ((ValuativeRel.valuation (L)).integer)) : L) = 1 := by
    change (((x * x⁻¹ : ((ValuativeRel.valuation (L)).integer)ˣ) : ((ValuativeRel.valuation (L)).integer)) : L) = 1
    simp
  rw [← map_mul (Algebra.norm K)]
  simp [hx]
 
lemma normIntegerUnitsValue_inv_mul [ValuativeRel K] [ValuativeRel L]
    [LocalFieldTheory.ValuativeExtension K L] (x : ((ValuativeRel.valuation (L)).integer)ˣ) :
    normIntegerUnitsValue (K := K) (L := L) x⁻¹ *
      normIntegerUnitsValue (K := K) (L := L) x = 1 := by
  ext
  change Algebra.norm K (((x⁻¹ : ((ValuativeRel.valuation (L)).integer)ˣ) : ((ValuativeRel.valuation (L)).integer)) : L) *
      Algebra.norm K (((x : ((ValuativeRel.valuation (L)).integer)ˣ) : ((ValuativeRel.valuation (L)).integer)) : L) = 1
  have hx : (((x⁻¹ : ((ValuativeRel.valuation (L)).integer)ˣ) : ((ValuativeRel.valuation (L)).integer)) : L) *
      (((x : ((ValuativeRel.valuation (L)).integer)ˣ) : ((ValuativeRel.valuation (L)).integer)) : L) = 1 := by
    change (((x⁻¹ * x : ((ValuativeRel.valuation (L)).integer)ˣ) : ((ValuativeRel.valuation (L)).integer)) : L) = 1
    simp
  rw [← map_mul (Algebra.norm K)]
  simp [hx]
 
def normIntegerUnits
    (K : Type u) (L : Type v)
    [Field K] [ValuativeRel K] [Field L] [ValuativeRel L]
    [Algebra K L] [LocalFieldTheory.ValuativeExtension K L] : ((ValuativeRel.valuation (L)).integer)ˣ →* ((ValuativeRel.valuation (K)).integer)ˣ where
  toFun := fun x => {
    val := normIntegerUnitsValue (K := K) (L := L) x
    inv := normIntegerUnitsValue (K := K) (L := L) x⁻¹
    val_inv := normIntegerUnitsValue_mul_inv (K := K) (L := L) x
    inv_val := normIntegerUnitsValue_inv_mul (K := K) (L := L) x
  }
  map_one' := by
    ext
    simp [normIntegerUnitsValue]
  map_mul' := by
    intro x y
    ext
    simp [normIntegerUnitsValue]
end UnitNorm
section Valuation
variable [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
variable [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
variable [Algebra K L]
end Valuation
end IsNonarchimedeanLocalField
end
end LocalFieldTheory
end

/- ValuedFieldTheory.LocalField.NonarchimedeanLocalField.Valuation -/
section
namespace LocalFieldTheory
noncomputable section
universe u
namespace IsNonarchimedeanLocalField
open ValuationTheory.DiscreteValuationField
open scoped ValuativeRel
 
theorem valuation_integer_membership
    (K : Type u) [Field K] [ValuativeRel K] (x : K) :
    x ∈ ((ValuativeRel.valuation (K)).integer) ↔ ValuativeRel.valuation K x ≤ 1 :=
  (Valuation.mem_integer_iff (ValuativeRel.valuation K) x).symm
end IsNonarchimedeanLocalField
end
end LocalFieldTheory
end

/- ValuedFieldTheory.LocalField.NonarchimedeanLocalField.IdealQuotients -/
section
namespace LocalFieldTheory
noncomputable section
universe u
open scoped ValuativeRel
 

def chosenIntegerRingUniformizer
    (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] : ((ValuativeRel.valuation (K)).integer) :=
  Classical.choose (IsDiscreteValuationRing.exists_irreducible ((ValuativeRel.valuation (K)).integer))
 
theorem chosenIntegerRingUniformizer_irreducible
    (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] :
    Irreducible (chosenIntegerRingUniformizer K) :=
  Classical.choose_spec (IsDiscreteValuationRing.exists_irreducible ((ValuativeRel.valuation (K)).integer))
 
theorem chosenIntegerRingUniformizer_maximalIdeal_eq
    (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] :
    (𝓂[K] : Ideal ((ValuativeRel.valuation (K)).integer)) = Ideal.span ({chosenIntegerRingUniformizer K} : Set ((ValuativeRel.valuation (K)).integer)) :=
  (chosenIntegerRingUniformizer_irreducible K).maximalIdeal_eq
 




def integerRingUniformizerFieldUnit
    (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] : Kˣ :=
  Units.mk0 (((chosenIntegerRingUniformizer K : ((ValuativeRel.valuation (K)).integer)) : K)) (by
    intro h
    exact (chosenIntegerRingUniformizer_irreducible K).ne_zero (Subtype.ext h))
 




def inverseIntegerRingUniformizerFieldUnit
    (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] : Kˣ :=
  (integerRingUniformizerFieldUnit K)⁻¹
private lemma withZeroMultiplicativeInt_le_of_lt_one
    (δ : WithZero (Multiplicative Int)) (hδ : δ < 1) :
    δ ≤ ((Multiplicative.ofAdd (-1 : Int) : Multiplicative Int) :
      WithZero (Multiplicative Int)) := by
  cases δ using WithZero.recZeroCoe with
  | zero => exact bot_le
  | coe d =>
      rw [WithZero.coe_le_coe]
      rw [← Multiplicative.toAdd_le]
      change Multiplicative.toAdd d ≤ (-1 : Int)
      have hdlt : Multiplicative.toAdd d < (0 : Int) := by
        have h' : d < (1 : Multiplicative Int) := by
          simpa using hδ
        change Multiplicative.toAdd d < Multiplicative.toAdd (1 : Multiplicative Int)
        exact Multiplicative.toAdd_lt.mpr h'
      omega
private lemma withZeroMultiplicativeInt_maximal_lt_one_eq_ofAdd_neg_one
    {a : WithZero (Multiplicative Int)} (ha : a < 1)
    (hmax : ∀ δ : WithZero (Multiplicative Int), δ < 1 → δ ≤ a) :
    a = ((Multiplicative.ofAdd (-1 : Int) : Multiplicative Int) :
      WithZero (Multiplicative Int)) := by
  apply le_antisymm
  · exact withZeroMultiplicativeInt_le_of_lt_one a ha
  · apply hmax
    rw [← WithZero.coe_one, WithZero.coe_lt_coe]
    change (-1 : Int) < 0
    omega
private theorem valueGroupWithZeroIsoInt_eq_of_maximal_lt_one
    (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K]
    {a : ValuativeRel.ValueGroupWithZero K} (ha : a < 1)
    (hmax : ∀ δ : ValuativeRel.ValueGroupWithZero K, δ < 1 → δ ≤ a) :
    IsNonarchimedeanLocalField.valueGroupWithZeroIsoInt K a =
      ((Multiplicative.ofAdd (-1 : Int) : Multiplicative Int) :
        WithZero (Multiplicative Int)) := by
  let φ := IsNonarchimedeanLocalField.valueGroupWithZeroIsoInt K
  apply withZeroMultiplicativeInt_maximal_lt_one_eq_ofAdd_neg_one
  · simpa using φ.strictMono ha
  · intro δ hδ
    let ε : ValuativeRel.ValueGroupWithZero K := φ.symm δ
    have hε : ε < 1 := by
      have h := φ.symm.strictMono hδ
      simpa using h
    have hle : ε ≤ a := hmax ε hε
    have hle' := φ.strictMono.monotone hle
    dsimp [ε, φ] at hle'
    simpa using hle'
 





theorem valueGroupWithZeroIsoInt_of_integerRing_irreducible
    (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (ϖ : ((ValuativeRel.valuation (K)).integer)) (hϖ : Irreducible ϖ) :
    IsNonarchimedeanLocalField.valueGroupWithZeroIsoInt K
        (ValuativeRel.valuation K ((ϖ : ((ValuativeRel.valuation (K)).integer)) : K)) =
      ((Multiplicative.ofAdd (-1 : Int) : Multiplicative Int) :
        WithZero (Multiplicative Int)) := by
  apply valueGroupWithZeroIsoInt_eq_of_maximal_lt_one K
  · simpa using (Valuation.integer.v_irreducible_lt_one
      (v := ValuativeRel.valuation K) hϖ)
  · intro δ hδ
    obtain ⟨x, hx⟩ := ValuativeRel.valuation_surjective (K := K) δ
    by_cases hx0 : x = 0
    · have hδ0 : δ = 0 := by
        simpa [hx0] using hx.symm
      rw [hδ0]
      exact bot_le
    · let y : ((ValuativeRel.valuation (K)).integer) := ⟨x, by
        change ValuativeRel.valuation K x ≤ 1
        rw [hx]
        exact le_of_lt hδ⟩
      have hylt : ValuativeRel.valuation K (y : K) < 1 := by
        change ValuativeRel.valuation K x < 1
        simpa [hx]
      have hynot : ¬ IsUnit y := by
        rw [Valuation.Integer.not_isUnit_iff_valuation_lt_one
          (v := ValuativeRel.valuation K)]
        exact hylt
      have hym : y ∈ (𝓂[K] : Ideal ((ValuativeRel.valuation (K)).integer)) := by
        rw [IsLocalRing.mem_maximalIdeal]
        simpa [nonunits] using hynot
      have hyspan : y ∈
          (Ideal.span ({ϖ} : Set ((ValuativeRel.valuation (K)).integer)) : Ideal ((ValuativeRel.valuation (K)).integer)) := by
        simpa [hϖ.maximalIdeal_eq] using hym
      have hset := Valuation.integer.coe_span_singleton_eq_setOfPred_le_v_coe
        (v := ValuativeRel.valuation K) ϖ
      have hyle : ValuativeRel.valuation K (y : K) ≤
          ValuativeRel.valuation K ((ϖ : ((ValuativeRel.valuation (K)).integer)) : K) := by
        have hyspanSet : y ∈
            ((Ideal.span ({ϖ} : Set ((ValuativeRel.valuation (K)).integer)) : Ideal ((ValuativeRel.valuation (K)).integer)) : Set ((ValuativeRel.valuation (K)).integer)) := hyspan
        rw [hset] at hyspanSet
        exact hyspanSet
      simpa [y, hx] using hyle
 

theorem v_integerRingIrreducibleFieldUnit
    (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (ϖ : ((ValuativeRel.valuation (K)).integer)) (hϖ : Irreducible ϖ)
    (u : Kˣ) (hu : (u : K) = ((ϖ : ((ValuativeRel.valuation (K)).integer)) : K)) :
    LocalFieldTheory.IsNonarchimedeanLocalField.v K (Additive.ofMul u) = -1 := by
  dsimp [LocalFieldTheory.IsNonarchimedeanLocalField.v]
  have hne :
      IsNonarchimedeanLocalField.valueGroupWithZeroIsoInt K
          (ValuativeRel.valuation K ((u : Kˣ) : K)) ≠ 0 := by
    rw [hu]
    simp [hϖ.ne_zero]
  have hunzero :
      WithZero.unzero
        (x := IsNonarchimedeanLocalField.valueGroupWithZeroIsoInt K
          (ValuativeRel.valuation K ((u : Kˣ) : K))) hne =
        (Multiplicative.ofAdd (-1 : Int) : Multiplicative Int) := by
    apply WithZero.coe_injective
    rw [WithZero.coe_unzero]
    rw [hu]
    simpa using valueGroupWithZeroIsoInt_of_integerRing_irreducible K ϖ hϖ
  rw [hunzero]
  simp
 

theorem v_integerRingIrreducibleFieldUnit_inv
    (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (ϖ : ((ValuativeRel.valuation (K)).integer)) (hϖ : Irreducible ϖ)
    (u : Kˣ) (hu : (u : K) = ((ϖ : ((ValuativeRel.valuation (K)).integer)) : K)) :
    LocalFieldTheory.IsNonarchimedeanLocalField.v K (Additive.ofMul u⁻¹) = 1 := by
  rw [LocalFieldTheory.IsNonarchimedeanLocalField.v_inv]
  rw [v_integerRingIrreducibleFieldUnit K ϖ hϖ u hu]
  norm_num
 


theorem v_integerRingUniformizerFieldUnit
    (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] :
    LocalFieldTheory.IsNonarchimedeanLocalField.v K
      (Additive.ofMul (integerRingUniformizerFieldUnit K)) = -1 := by
  exact v_integerRingIrreducibleFieldUnit K
    (chosenIntegerRingUniformizer K) (chosenIntegerRingUniformizer_irreducible K)
    (integerRingUniformizerFieldUnit K) rfl
 


theorem v_inverseIntegerRingUniformizerFieldUnit
    (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] :
    LocalFieldTheory.IsNonarchimedeanLocalField.v K
      (Additive.ofMul (inverseIntegerRingUniformizerFieldUnit K)) = 1 := by
  rw [inverseIntegerRingUniformizerFieldUnit]
  exact v_integerRingIrreducibleFieldUnit_inv K
    (chosenIntegerRingUniformizer K) (chosenIntegerRingUniformizer_irreducible K)
    (integerRingUniformizerFieldUnit K) rfl
 

theorem maximalIdeal_pow_eq_span_uniformizer_pow_of_irreducible
    (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (ϖ : ((ValuativeRel.valuation (K)).integer)) (hϖ : Irreducible ϖ) (n : Nat) :
    (𝓂[K] ^ n : Ideal ((ValuativeRel.valuation (K)).integer)) = Ideal.span ({ϖ ^ n} : Set ((ValuativeRel.valuation (K)).integer)) := by
  rw [hϖ.maximalIdeal_eq, Ideal.span_singleton_pow]
 
theorem maximalIdeal_pow_eq_span_uniformizer_pow
    (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (n : Nat) :
    (𝓂[K] ^ n : Ideal ((ValuativeRel.valuation (K)).integer)) =
      Ideal.span ({chosenIntegerRingUniformizer K ^ n} : Set ((ValuativeRel.valuation (K)).integer)) :=
  maximalIdeal_pow_eq_span_uniformizer_pow_of_irreducible K
    (chosenIntegerRingUniformizer K) (chosenIntegerRingUniformizer_irreducible K) n
end
end LocalFieldTheory
end

/- ValuedFieldTheory.LocalField.NonarchimedeanLocalField.ValuationExactSequence -/
section
namespace LocalFieldTheory
noncomputable section
universe u
namespace IsNonarchimedeanLocalField
open scoped ValuativeRel WithZero
 
noncomputable def valuationUnitsMulHom
    (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] : Kˣ →* Multiplicative Int :=
  (@WithZero.unitsWithZeroEquiv (Multiplicative Int) _).toMonoidHom.comp
    ((Units.map (_root_.IsNonarchimedeanLocalField.valueGroupWithZeroIsoInt K).toMonoidHom).comp
      (Units.map (ValuativeRel.valuation K).toMonoidWithZeroHom.toMonoidHom))
 
noncomputable def valuationMap (K : Type u) [Field K] [ValuativeRel K]
    [TopologicalSpace K] [IsNonarchimedeanLocalField K] : Additive Kˣ →+ Int :=
  MonoidHom.toAdditive (valuationUnitsMulHom K)
 

@[simp]
theorem valuationMap_apply (K : Type u) [Field K] [ValuativeRel K]
    [TopologicalSpace K] [IsNonarchimedeanLocalField K] (x : Additive Kˣ) :
    valuationMap K x = v K x :=
  rfl
 
theorem valuationMap_surjective (K : Type u) [Field K] [ValuativeRel K]
    [TopologicalSpace K] [IsNonarchimedeanLocalField K] :
    Function.Surjective (valuationMap K) :=
  v_surjective K
 
theorem valuation_eq_one_of_valuationMap_eq_zero (K : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    {x : Kˣ} (hx : valuationMap K (Additive.ofMul x) = 0) :
    ValuativeRel.valuation K (x : K) = 1 := by
  rw [valuationMap_apply] at hx
  dsimp [v] at hx
  have hunzero :
      WithZero.unzero
        (x := (_root_.IsNonarchimedeanLocalField.valueGroupWithZeroIsoInt K) (ValuativeRel.valuation K (x : K)))
        (by simp) = (1 : Multiplicative Int) := by
    have h := congrArg Multiplicative.ofAdd hx
    simpa using h
  apply (_root_.IsNonarchimedeanLocalField.valueGroupWithZeroIsoInt K).injective
  have hcoe :
      ((WithZero.unzero
        (x := (_root_.IsNonarchimedeanLocalField.valueGroupWithZeroIsoInt K) (ValuativeRel.valuation K (x : K)))
        (by simp) : Multiplicative Int) : WithZero (Multiplicative Int)) =
        (1 : WithZero (Multiplicative Int)) := by
    simpa using congrArg
      (fun y : Multiplicative Int => (y : WithZero (Multiplicative Int))) hunzero
  rw [WithZero.coe_unzero] at hcoe
  simpa using hcoe
 
theorem valuationMap_ofMul_div (K : Type u) [Field K] [ValuativeRel K]
    [TopologicalSpace K] [IsNonarchimedeanLocalField K] (x y : Kˣ) :
    valuationMap K (Additive.ofMul (x / y)) =
      valuationMap K (Additive.ofMul x) - valuationMap K (Additive.ofMul y) := by
  change v K (Additive.ofMul (x / y)) = v K (Additive.ofMul x) - v K (Additive.ofMul y)
  exact v_div K x y
 
theorem valuationMap_ofMul_zpow (K : Type u) [Field K] [ValuativeRel K]
    [TopologicalSpace K] [IsNonarchimedeanLocalField K] (x : Kˣ) (n : Int) :
    valuationMap K (Additive.ofMul (x ^ n)) =
      n * valuationMap K (Additive.ofMul x) := by
  change v K (Additive.ofMul (x ^ n)) = n * v K (Additive.ofMul x)
  exact v_zpow K x n
 
def integerUnitOfValuationMapZero (K : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (x : Kˣ) (hx : valuationMap K (Additive.ofMul x) = 0) : ((ValuativeRel.valuation (K)).integer)ˣ where
  val := ⟨(x : K), by
    rw [valuation_integer_membership]
    have hv := valuation_eq_one_of_valuationMap_eq_zero K hx
    simp [hv]⟩
  inv := ⟨(x⁻¹ : K), by
    rw [valuation_integer_membership]
    have hv := valuation_eq_one_of_valuationMap_eq_zero K hx
    simp [hv]⟩
  val_inv := by
    ext
    simp
  inv_val := by
    ext
    simp
 

@[simp]
theorem integerUnitOfValuationMapZero_spec (K : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (x : Kˣ) (hx : valuationMap K (Additive.ofMul x) = 0) :
    integerUnitsToFieldUnits K (integerUnitOfValuationMapZero K x hx) = x := by
  ext
  rfl
 

theorem uniformizerUnitFactorValuationZero (K : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (ϖ x : Kˣ) (hϖ : valuationMap K (Additive.ofMul ϖ) = 1) :
    valuationMap K
      (Additive.ofMul (x / ϖ ^ valuationMap K (Additive.ofMul x))) = 0 := by
  rw [valuationMap_ofMul_div, valuationMap_ofMul_zpow, hϖ, mul_one, sub_self]
 
noncomputable def uniformizerUnitFactor (K : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (ϖ : Kˣ) (hϖ : valuationMap K (Additive.ofMul ϖ) = 1)
    (x : Kˣ) : ((ValuativeRel.valuation (K)).integer)ˣ :=
  integerUnitOfValuationMapZero K
    (x / ϖ ^ valuationMap K (Additive.ofMul x))
    (uniformizerUnitFactorValuationZero K ϖ x hϖ)
 

@[simp]
theorem integerUnitsToFieldUnits_uniformizerUnitFactor (K : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (ϖ : Kˣ) (hϖ : valuationMap K (Additive.ofMul ϖ) = 1) (x : Kˣ) :
    integerUnitsToFieldUnits K (uniformizerUnitFactor K ϖ hϖ x) =
      x / ϖ ^ valuationMap K (Additive.ofMul x) :=
  integerUnitOfValuationMapZero_spec K
    (x / ϖ ^ valuationMap K (Additive.ofMul x))
    (uniformizerUnitFactorValuationZero K ϖ x hϖ)
 
theorem uniformizerUnitFactor_mul_uniformizer_zpow (K : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (ϖ : Kˣ) (hϖ : valuationMap K (Additive.ofMul ϖ) = 1) (x : Kˣ) :
    integerUnitsToFieldUnits K (uniformizerUnitFactor K ϖ hϖ x) *
        ϖ ^ valuationMap K (Additive.ofMul x) = x := by
  rw [integerUnitsToFieldUnits_uniformizerUnitFactor]
  simp [div_eq_mul_inv, mul_assoc]
end IsNonarchimedeanLocalField
end
end LocalFieldTheory
end

/- ValuedFieldTheory.LocalField.NonarchimedeanLocalField.ResidueExtension -/
section
namespace LocalFieldTheory
noncomputable section
universe u
open scoped ValuativeRel
 
@[simp]
theorem residueField_algebraMap_residue (K L : Type u)
    [Field K] [ValuativeRel K] [Field L] [ValuativeRel L] [Algebra K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    (x : ((ValuativeRel.valuation (K)).integer)) :
    algebraMap (IsLocalRing.ResidueField ((ValuativeRel.valuation (K)).integer)) (IsLocalRing.ResidueField ((ValuativeRel.valuation (L)).integer)) (IsLocalRing.residue ((ValuativeRel.valuation (K)).integer) x) =
      IsLocalRing.residue ((ValuativeRel.valuation (L)).integer) (algebraMap ((ValuativeRel.valuation (K)).integer) ((ValuativeRel.valuation (L)).integer) x) :=
  rfl
end
end LocalFieldTheory
namespace LocalFieldTheory
open scoped ValuativeRel
noncomputable abbrev valuationResidueAlgebra (K : Type*) (L : Type*) [Field K] [ValuativeRel K]
    [Field L] [ValuativeRel L] [Algebra K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)] :
    Algebra (IsLocalRing.ResidueField ((ValuativeRel.valuation (K)).integer)) (IsLocalRing.ResidueField ((ValuativeRel.valuation (L)).integer)) := inferInstance
noncomputable abbrev valuationResidueDegree (K : Type*) (L : Type*) [Field K] [ValuativeRel K]
    [Field L] [ValuativeRel L] [Algebra K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)] : ℕ :=
  Module.finrank (IsLocalRing.ResidueField ((ValuativeRel.valuation (K)).integer)) (IsLocalRing.ResidueField ((ValuativeRel.valuation (L)).integer))
theorem valuationResidueDegree_card (K : Type*) (L : Type*) [Field K] [ValuativeRel K]
    [Field L] [ValuativeRel L] [Algebra K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)] [Finite (IsLocalRing.ResidueField ((ValuativeRel.valuation (L)).integer))] :
    Nat.card (IsLocalRing.ResidueField ((ValuativeRel.valuation (L)).integer)) = Nat.card (IsLocalRing.ResidueField ((ValuativeRel.valuation (K)).integer)) ^ valuationResidueDegree K L := by
  letI : Module.Finite (IsLocalRing.ResidueField ((ValuativeRel.valuation (K)).integer)) (IsLocalRing.ResidueField ((ValuativeRel.valuation (L)).integer)) := .of_finite
  exact Module.natCard_eq_pow_finrank
end LocalFieldTheory

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
 
@[simp]
theorem intermediateFieldUnitsToGaloisAmbient_apply
    (E : IntermediateField K Ω) (x : Eˣ) :
    intermediateFieldUnitsToGaloisAmbient K Ω E (Additive.ofMul x) =
      Additive.ofMul (Units.map E.val.toRingHom x) :=
  rfl
variable [IsGalois K Ω]
 

theorem mem_galoisAmbientUnits_fixed_iff
    (E : IntermediateField K Ω)
    (x : Additive Ωˣ) :
    x ∈ ambientFixedAddSubgroup (galoisAmbientUnitsRep K Ω)
        (closedFixingSubgroup K Ω E) ↔
      ((Additive.toMul x : Ωˣ) : Ω) ∈ E := by
  change
    (show galoisAmbientUnitsRep K Ω from x) ∈
        ambientFixedAddSubgroup (galoisAmbientUnitsRep K Ω)
          (closedFixingSubgroup K Ω E) ↔
      ((Additive.toMul x : Ωˣ) : Ω) ∈ E
  rw [mem_ambientFixedAddSubgroup_iff]
  constructor
  · intro hx
    rw [← InfiniteGalois.fixedField_fixingSubgroup E,
      IntermediateField.mem_fixedField_iff]
    intro σ hσ
    have hσclosed :
        σ ∈ (closedFixingSubgroup K Ω E).toSubgroup := by
      simpa only [closedFixingSubgroup] using hσ
    have hfixed := hx ⟨σ, hσclosed⟩
    have hρ :
        (Rep.ofAlgebraAutOnUnits K Ω).ρ σ x =
          Additive.ofMul
            (Units.mapEquiv σ.toMulEquiv (Additive.toMul x)) :=
      rfl
    rw [hρ] at hfixed
    have hval := congrArg
      (fun z : Additive Ωˣ ↦ ((Additive.toMul z : Ωˣ) : Ω)) hfixed
    convert hval using 1
    rfl
  · intro hx σ
    have hσE : σ.1 ∈ E.fixingSubgroup := by
      simpa only [closedFixingSubgroup] using σ.2
    have hρ :
        (Rep.ofAlgebraAutOnUnits K Ω).ρ
            (σ : Gal(Ω / K)) x =
          Additive.ofMul
            (Units.mapEquiv
              (σ : Gal(Ω / K)).toMulEquiv (Additive.toMul x)) :=
      rfl
    rw [hρ]
    apply Additive.ext
    rw [toMul_ofMul]
    apply Units.ext
    convert (IntermediateField.mem_fixingSubgroup_iff E σ.1).1 hσE _ hx using 1
    rfl
 

theorem intermediateFieldUnitsToGaloisAmbient_range
    (E : IntermediateField K Ω) :
    (intermediateFieldUnitsToGaloisAmbient K Ω E).range =
      ambientFixedAddSubgroup (galoisAmbientUnitsRep K Ω)
        (closedFixingSubgroup K Ω E) := by
  apply AddSubgroup.ext
  intro x
  constructor
  · rintro ⟨y, rfl⟩
    change
      (show galoisAmbientUnitsRep K Ω from
        intermediateFieldUnitsToGaloisAmbient K Ω E y) ∈
        ambientFixedAddSubgroup (galoisAmbientUnitsRep K Ω)
          (closedFixingSubgroup K Ω E)
    apply (mem_galoisAmbientUnits_fixed_iff K Ω E _).2
    rw [← ofMul_toMul y, intermediateFieldUnitsToGaloisAmbient_apply,
      toMul_ofMul, Units.coe_map]
    exact (Additive.toMul y : Eˣ).1.property
  · intro hx
    have hxE :
        ((Additive.toMul x : Ωˣ) : Ω) ∈ E :=
      (mem_galoisAmbientUnits_fixed_iff K Ω E x).1 hx
    let y₀ : E :=
      ⟨((Additive.toMul x : Ωˣ) : Ω), hxE⟩
    have hy₀ : y₀ ≠ 0 := by
      intro h
      have h' :
          ((Additive.toMul x : Ωˣ) : Ω) = 0 :=
        congrArg E.val h
      exact (Additive.toMul x : Ωˣ).ne_zero h'
    let y : Eˣ := Units.mk0 y₀ hy₀
    refine ⟨Additive.ofMul y, ?_⟩
    rw [intermediateFieldUnitsToGaloisAmbient_apply]
    apply Additive.ext
    rw [toMul_ofMul]
    apply Units.ext
    rw [Units.coe_map]
    rfl
 

def intermediateFieldUnitsEquivGaloisFixed
    (E : IntermediateField K Ω) :
    Additive Eˣ ≃+ ambientFixedAddSubgroup (galoisAmbientUnitsRep K Ω)
      (closedFixingSubgroup K Ω E) := by
  let eRange : Additive Eˣ ≃+
      (intermediateFieldUnitsToGaloisAmbient K Ω E).range :=
    AddMonoidHom.ofInjective (by
      intro x y hxy
      apply Additive.toMul.injective
      exact (Units.map_injective E.val.injective) (congrArg Additive.toMul hxy))
  exact eRange.trans
    (AddEquiv.addSubgroupCongr
      (intermediateFieldUnitsToGaloisAmbient_range K Ω E))
 
@[simp]
theorem intermediateFieldUnitsEquivGaloisFixed_coe
    (E : IntermediateField K Ω) (x : Additive Eˣ) :
    (intermediateFieldUnitsEquivGaloisFixed K Ω E x).1 =
        intermediateFieldUnitsToGaloisAmbient K Ω E x :=
  rfl
end
end LocalClassFieldTheory
end

/- ClassFieldTheory.LocalClassFieldTheory.Finite.LocalReciprocity.GaloisExtensionQuotient -/
section
namespace LocalClassFieldTheory
open RamificationTheory CyclicCohomology
open ClassFormation
noncomputable section
variable (K Ω : Type) [Field K] [Field Ω] [Algebra K Ω] [IsGalois K Ω]
 

theorem closedFixingSubgroup_bot_eq_baseField :
    closedFixingSubgroup K Ω (⊥ : IntermediateField K Ω) =
      baseField (Gal(Ω / K)) := by
  ext σ
  change σ ∈ (⊥ : IntermediateField K Ω).fixingSubgroup ↔
    σ ∈ (⊤ : Subgroup (Gal(Ω / K)))
  rw [IntermediateField.fixingSubgroup_bot]
 

theorem fixingSubgroupLeBase
    (E : IntermediateField K Ω) :
    (closedFixingSubgroup K Ω E).toSubgroup ≤
      (closedFixingSubgroup K Ω (⊥ : IntermediateField K Ω)).toSubgroup :=
  IntermediateField.fixingSubgroup_le bot_le
end
end LocalClassFieldTheory
end

/- ClassFieldTheory.LocalClassFieldTheory.Finite.LocalReciprocity.SeparableUnitsNorm -/
section
namespace LocalClassFieldTheory
open RamificationTheory KummerTheory
open LocalFieldTheory
open ClassFormation CyclicCohomology
noncomputable section
open scoped BigOperators
variable (K : Type) (Ω : Type) [Field K] [Field Ω] [Algebra K Ω]
  [IsGalois K Ω]
 

def baseUnitsEquivGaloisAmbientFixed :
    Additive Kˣ ≃+ ambientFixedAddSubgroup
      (galoisAmbientUnitsRep K Ω)
      (closedFixingSubgroup K Ω (⊥ : IntermediateField K Ω)) := by
  let eBot : Additive Kˣ ≃+
      Additive (⊥ : IntermediateField K Ω)ˣ :=
    MulEquiv.toAdditive
      (Units.mapEquiv (IntermediateField.botEquiv K Ω).symm.toMulEquiv)
  exact eBot.trans
    (intermediateFieldUnitsEquivGaloisFixed K Ω ⊥)
 
@[simp]
theorem baseUnitsEquivGaloisAmbientFixed_val (x : Kˣ) :
    ((Additive.toMul
      ((baseUnitsEquivGaloisAmbientFixed K Ω (Additive.ofMul x)).1 :
        Additive Ωˣ) : Ωˣ) : Ω) = algebraMap K Ω (x : K) := by
  rfl
section FiniteGaloisIntermediate
variable (E : IntermediateField K Ω) [FiniteDimensional K E] [IsGalois K E]
end FiniteGaloisIntermediate
section EmbeddedFiniteGaloisExtension
variable (L : Type) [Field L] [Algebra K L]
  [FiniteDimensional K L] [IsGalois K L]
  (i : L →ₐ[K] Ω)
end EmbeddedFiniteGaloisExtension
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
 

theorem closedFixingSubgroup_abstractFixedField_eq
    (H : ClosedSubgroup (Gal(Ω / k))) :
    closedFixingSubgroup k Ω (abstractFixedField k Ω H) = H := by
  ext σ
  change σ ∈ (abstractFixedField k Ω H).fixingSubgroup ↔ σ ∈ H
  rw [InfiniteGalois.fixingSubgroup_fixedField H]
  rfl
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
 

def abstractSubgroupEquivGaloisGroup
    (H : ClosedSubgroup (Gal(Ω / k))) :
    H.toSubgroup ≃* Gal(Ω / abstractFixedField k Ω H) :=
  (MulEquiv.subgroupCongr
      (InfiniteGalois.fixingSubgroup_fixedField H).symm).trans
    (IntermediateField.fixingSubgroupEquiv (abstractFixedField k Ω H))
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
omit [IsGalois k Ω] in
 
@[simp]
theorem abstractFixedFieldUnitsEquivGaloisFixed_coe
    (H : ClosedSubgroup (Gal(Ω / k)))
    (x : Additive (abstractFixedField k Ω H)ˣ) :
    ((abstractFixedFieldUnitsEquivGaloisFixed k Ω H x).1 :
        Additive Ωˣ) =
      intermediateFieldUnitsToGaloisAmbient k Ω
        (abstractFixedField k Ω H) x :=
  rfl
end
end LocalClassFieldTheory
end

/- ValuedFieldTheory.LocalField.NonarchimedeanLocalField.SeparableNormValuation -/
section
namespace LocalClassFieldTheory
open LocalFieldTheory
noncomputable section
universe u v w
open scoped BigOperators ValuativeRel
open IsNonarchimedeanLocalField
section SeparableIdealNorm
variable (R : Type u) (S : Type v)
  [CommRing R] [IsDomain R] [CommRing S] [IsDomain S]
  [IsIntegrallyClosed R] [IsIntegrallyClosed S]
  [Algebra R S] [Module.Finite R S] [Module.IsTorsionFree R S]
end SeparableIdealNorm
section SeparableIdealNormDedekind
variable (R : Type u) (S : Type v)
  [CommRing R] [IsDomain R] [CommRing S] [IsDedekindDomain S]
  [Algebra R S] [Module.Finite R S] [Module.IsTorsionFree R S]
end SeparableIdealNormDedekind
section SeparableIdealNormGalois
variable (R : Type u) (S : Type v)
  [CommRing R] [IsDomain R] [CommRing S] [IsDomain S]
  [Algebra R S] [Module.Finite R S] [Module.IsTorsionFree R S]
end SeparableIdealNormGalois
section SeparableIdealNormRelNorm
variable (R : Type u) (S : Type v)
  [CommRing R] [IsDedekindDomain R]
  [CommRing S] [IsDedekindDomain S]
  [Algebra R S] [Module.Finite R S] [Module.IsTorsionFree R S]
end SeparableIdealNormRelNorm
 


theorem relNorm_maximalIdeal_eq_pow_residue_finrank
    (K : Type u) (L : Type v)
    [Field K] [CharZero K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L]
    [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L] [Algebra.IsSeparable K L]
    [Valuation.HasExtension (ValuativeRel.valuation K)
      (ValuativeRel.valuation L)]
    [Module.Finite ((ValuativeRel.valuation (K)).integer) ((ValuativeRel.valuation (L)).integer)] :
    Ideal.relNorm ((ValuativeRel.valuation (K)).integer) (𝓂[L] : Ideal ((ValuativeRel.valuation (L)).integer)) =
      (𝓂[K] : Ideal ((ValuativeRel.valuation (K)).integer)) ^ LocalFieldTheory.valuationResidueDegree K (L) := by
  have h := Ideal.relNorm_eq_pow_of_isMaximal (𝓂[L] : Ideal ((ValuativeRel.valuation (L)).integer)) (𝓂[K] : Ideal ((ValuativeRel.valuation (K)).integer))
  rw [← Ideal.inertiaDeg'_eq_inertiaDeg
      (𝓂[K] : Ideal ((ValuativeRel.valuation (K)).integer)) (𝓂[L] : Ideal ((ValuativeRel.valuation (L)).integer)),
    Ideal.inertiaDeg'_algebraMap] at h
  exact h
 


theorem v_normUnits_integerRingUniformizerFieldUnit_of_isSeparable
    (K : Type u) (L : Type v)
    [Field K] [CharZero K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L]
    [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L] [Algebra.IsSeparable K L]
    [Valuation.HasExtension (ValuativeRel.valuation K)
      (ValuativeRel.valuation L)]
    [IsIntegralClosure ((ValuativeRel.valuation (L)).integer) ((ValuativeRel.valuation (K)).integer) L] :
    v K (Additive.ofMul
        (normUnits K L (integerRingUniformizerFieldUnit L))) =
      -(LocalFieldTheory.valuationResidueDegree K (L) : Int) := by
  let : Module.Finite ((ValuativeRel.valuation (K)).integer) ((ValuativeRel.valuation (L)).integer) :=
    IsIntegralClosure.finite ((ValuativeRel.valuation (K)).integer) K L ((ValuativeRel.valuation (L)).integer)
  let f : Nat := LocalFieldTheory.valuationResidueDegree K (L)
  have hspan :
      Ideal.span
          ({Algebra.intNorm ((ValuativeRel.valuation (K)).integer) ((ValuativeRel.valuation (L)).integer)
            (chosenIntegerRingUniformizer L)} : Set ((ValuativeRel.valuation (K)).integer)) =
        Ideal.span ({chosenIntegerRingUniformizer K ^ f} : Set ((ValuativeRel.valuation (K)).integer)) := by
    calc
      Ideal.span
          ({Algebra.intNorm ((ValuativeRel.valuation (K)).integer) ((ValuativeRel.valuation (L)).integer)
            (chosenIntegerRingUniformizer L)} : Set ((ValuativeRel.valuation (K)).integer)) =
          Ideal.relNorm ((ValuativeRel.valuation (K)).integer)
            (Ideal.span ({chosenIntegerRingUniformizer L} : Set ((ValuativeRel.valuation (L)).integer))) := by
        exact (Ideal.spanNorm_singleton (R := ((ValuativeRel.valuation (K)).integer))
          (r := chosenIntegerRingUniformizer L)).symm
      _ = Ideal.relNorm ((ValuativeRel.valuation (K)).integer) (𝓂[L] : Ideal ((ValuativeRel.valuation (L)).integer)) := by
        rw [chosenIntegerRingUniformizer_maximalIdeal_eq L]
      _ = (𝓂[K] : Ideal ((ValuativeRel.valuation (K)).integer)) ^ f := by
        simpa [f] using relNorm_maximalIdeal_eq_pow_residue_finrank K L
      _ = Ideal.span ({chosenIntegerRingUniformizer K ^ f} : Set ((ValuativeRel.valuation (K)).integer)) :=
        maximalIdeal_pow_eq_span_uniformizer_pow K f
  obtain ⟨u, hu⟩ := Ideal.span_singleton_eq_span_singleton.mp hspan
  have hfieldUnits :
      normUnits K L (integerRingUniformizerFieldUnit L) *
        integerUnitsToFieldUnits K u =
      integerRingUniformizerFieldUnit K ^ f := by
    apply Units.ext
    have huField := congrArg (algebraMap ((ValuativeRel.valuation (K)).integer) K) hu
    rw [map_mul, Algebra.algebraMap_intNorm (K := K) (L := L)] at huField
    change
      Algebra.norm K (algebraMap ((ValuativeRel.valuation (L)).integer) L (chosenIntegerRingUniformizer L)) *
          algebraMap ((ValuativeRel.valuation (K)).integer) K (u : ((ValuativeRel.valuation (K)).integer)) =
        algebraMap ((ValuativeRel.valuation (K)).integer) K (chosenIntegerRingUniformizer K) ^ f
    exact huField
  have hvalue := congrArg
    (fun z : Kˣ => v K (Additive.ofMul z)) hfieldUnits
  change v K (Additive.ofMul
      (normUnits K L (integerRingUniformizerFieldUnit L) *
        integerUnitsToFieldUnits K u)) =
    v K (Additive.ofMul (integerRingUniformizerFieldUnit K ^ f)) at hvalue
  rw [v_mul, v_integerUnitsToFieldUnits, add_zero, v_pow,
    v_integerRingUniformizerFieldUnit] at hvalue
  simpa [f] using hvalue
 

theorem v_normUnits_inverseIntegerRingUniformizerFieldUnit_of_isSeparable
    (K : Type u) (L : Type v)
    [Field K] [CharZero K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L]
    [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L] [Algebra.IsSeparable K L]
    [Valuation.HasExtension (ValuativeRel.valuation K)
      (ValuativeRel.valuation L)]
    [IsIntegralClosure ((ValuativeRel.valuation (L)).integer) ((ValuativeRel.valuation (K)).integer) L] :
    v K (Additive.ofMul
        (normUnits K L (inverseIntegerRingUniformizerFieldUnit L))) =
      (LocalFieldTheory.valuationResidueDegree K (L) : Int) := by
  rw [inverseIntegerRingUniformizerFieldUnit, map_inv, v_inv,
    v_normUnits_integerRingUniformizerFieldUnit_of_isSeparable]
  simp only [neg_neg]
 


theorem v_normUnits_eq_residue_finrank_mul_of_isSeparable
    (K : Type u) (L : Type v)
    [Field K] [CharZero K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L]
    [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L] [Algebra.IsSeparable K L]
    [Valuation.HasExtension (ValuativeRel.valuation K)
      (ValuativeRel.valuation L)]
    [IsIntegralClosure ((ValuativeRel.valuation (L)).integer) ((ValuativeRel.valuation (K)).integer) L]
    (x : Lˣ) :
    v K (Additive.ofMul (normUnits K L x)) =
      (LocalFieldTheory.valuationResidueDegree K (L) : Int) *
        v L (Additive.ofMul x) := by
  let ϖ : Lˣ := inverseIntegerRingUniformizerFieldUnit L
  have hϖ : v L (Additive.ofMul ϖ) = 1 :=
    v_inverseIntegerRingUniformizerFieldUnit L
  let n : Int := v L (Additive.ofMul x)
  let a : ((ValuativeRel.valuation (L)).integer)ˣ := uniformizerUnitFactor L ϖ hϖ x
  have haNorm :
      normUnits K L (integerUnitsToFieldUnits L a) =
        integerUnitsToFieldUnits K (normIntegerUnits K L a) := by
    apply Units.ext
    rfl
  have hx : integerUnitsToFieldUnits L a * ϖ ^ n = x := by
    exact uniformizerUnitFactor_mul_uniformizer_zpow L ϖ hϖ x
  have hxNorm :
      normUnits K L x =
        integerUnitsToFieldUnits K (normIntegerUnits K L a) *
          (normUnits K L ϖ) ^ n := by
    calc
      normUnits K L x =
          normUnits K L (integerUnitsToFieldUnits L a * ϖ ^ n) :=
        congrArg (normUnits K L) hx.symm
      _ = normUnits K L (integerUnitsToFieldUnits L a) *
          (normUnits K L ϖ) ^ n := by
        simp only [map_mul, map_zpow]
      _ = integerUnitsToFieldUnits K (normIntegerUnits K L a) *
          (normUnits K L ϖ) ^ n := by rw [haNorm]
  rw [hxNorm, v_mul, v_integerUnitsToFieldUnits, zero_add, v_zpow,
    v_normUnits_inverseIntegerRingUniformizerFieldUnit_of_isSeparable]
  simp only [n]
  ring
end
end LocalClassFieldTheory
end

/- ClassFieldTheory.LocalClassFieldTheory.Finite.LocalReciprocity.HenselianValuationBase -/
section
namespace LocalClassFieldTheory
open RamificationTheory KummerTheory
open LocalFieldTheory
open ClassFormation
noncomputable section
variable (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K]
  [IsNonarchimedeanLocalField K]
private abbrev G := Gal(SeparableClosure K / K)
private abbrev A : Rep ℤ (G K) :=
  galoisAmbientUnitsRep K (SeparableClosure K)
 

def baseFieldUnitsEquiv :
    Additive Kˣ ≃+ ambientFixedAddSubgroup (A K) (baseField (G K)) :=
  (baseUnitsEquivGaloisAmbientFixed K (SeparableClosure K)).trans
    (AddEquiv.addSubgroupCongr
      (congrArg (ambientFixedAddSubgroup (A K))
        (closedFixingSubgroup_bot_eq_baseField K (SeparableClosure K))))
omit [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K] in
 
@[simp]
theorem baseFieldUnitsEquiv_val (x : Kˣ) :
    ((Additive.toMul
      ((baseFieldUnitsEquiv K (Additive.ofMul x)).1 :
        Additive (SeparableClosure K)ˣ) : (SeparableClosure K)ˣ) :
      SeparableClosure K) = algebraMap K (SeparableClosure K) (x : K) := by
  change
    ((Additive.toMul
      ((baseUnitsEquivGaloisAmbientFixed K (SeparableClosure K)
          (Additive.ofMul x)).1 :
        Additive (SeparableClosure K)ˣ) : (SeparableClosure K)ˣ) :
      SeparableClosure K) = algebraMap K (SeparableClosure K) (x : K)
  exact baseUnitsEquivGaloisAmbientFixed_val K (SeparableClosure K) x
 

def localBaseValuation :
    ambientFixedAddSubgroup (A K) (baseField (G K)) →+ ZHat :=
  (Int.castRingHom ZHat).toAddMonoidHom.comp
    ((LocalFieldTheory.IsNonarchimedeanLocalField.valuationMap K).comp
      (baseFieldUnitsEquiv K).symm.toAddMonoidHom)
 
@[simp]
theorem localBaseValuation_baseFieldUnitsEquiv (x : Additive Kˣ) :
    localBaseValuation K (baseFieldUnitsEquiv K x) =
      Int.castRingHom ZHat
        (LocalFieldTheory.IsNonarchimedeanLocalField.valuationMap K x) := by
  simp [localBaseValuation]
 

theorem localBaseValuation_range :
    (localBaseValuation K).range =
      (Int.castRingHom ZHat).toAddMonoidHom.range := by
  apply le_antisymm
  · rintro z ⟨x, rfl⟩
    exact ⟨IsNonarchimedeanLocalField.valuationMap K
      ((baseFieldUnitsEquiv K).symm x), rfl⟩
  · rintro z ⟨m, rfl⟩
    obtain ⟨x, hx⟩ :=
      LocalFieldTheory.IsNonarchimedeanLocalField.valuationMap_surjective K m
    refine ⟨baseFieldUnitsEquiv K x, ?_⟩
    rw [localBaseValuation_baseFieldUnitsEquiv, hx]
    rfl
 
theorem intToProCInteger_mem_localBaseValuation_range (m : ℤ) :
    Int.castRingHom ZHat m ∈
      (localBaseValuation K).range := by
  rw [localBaseValuation_range]
  exact ⟨m, rfl⟩
 
def localValueGroupReduction (n : ℕ) (hn : 0 < n) :
    (localBaseValuation K).range →+ ZMod n :=
  (zHatReduction n hn).toAddMonoidHom.comp
    (localBaseValuation K).range.subtype
 
theorem localValueGroupReduction_surjective (n : ℕ) (hn : 0 < n) :
    Function.Surjective (localValueGroupReduction K n hn) := by
  intro a
  obtain ⟨m, rfl⟩ := ZMod.intCast_surjective a
  let z : (localBaseValuation K).range :=
    ⟨Int.castRingHom ZHat m,
      intToProCInteger_mem_localBaseValuation_range K m⟩
  refine ⟨z, ?_⟩
  exact zHatReduction_int n hn m
 
theorem localValueGroupReduction_ker (n : ℕ) (hn : 0 < n) :
    (localValueGroupReduction K n hn).ker =
      nsmulWithin (localBaseValuation K).range n := by
  apply le_antisymm
  · intro z hz
    have hzInt : (z : ZHat) ∈
        (Int.castRingHom ZHat).toAddMonoidHom.range := by
      rw [← localBaseValuation_range K]
      exact z.property
    obtain ⟨m, hm⟩ := hzInt
    change Int.castRingHom ZHat m = (z : ZHat) at hm
    have hmod : (m : ZMod n) = 0 := by
      have hz0 : localValueGroupReduction K n hn z = 0 := hz
      change zHatReduction n hn (z : ZHat) = 0 at hz0
      rw [← hm, zHatReduction_int] at hz0
      exact hz0
    have hdiv : (n : ℤ) ∣ m := by
      rwa [ZMod.intCast_zmod_eq_zero_iff_dvd] at hmod
    obtain ⟨k, hk⟩ := hdiv
    let w : (localBaseValuation K).range :=
      ⟨Int.castRingHom ZHat k,
        intToProCInteger_mem_localBaseValuation_range K k⟩
    refine ⟨w, ?_⟩
    apply Subtype.ext
    change n • Int.castRingHom ZHat k = (z : ZHat)
    rw [← map_nsmul]
    have hnk : n • k = m := by
      simpa [nsmul_eq_mul] using hk.symm
    rw [hnk, hm]
  · rintro z ⟨w, rfl⟩
    change zHatReduction n hn (n • (w : ZHat)) = 0
    rw [map_nsmul]
    simp [nsmul_eq_mul]
 

theorem localCanonicalValueQuotientMap_bijective (n : ℕ) (hn : 0 < n) :
    Function.Bijective
      (canonicalValueQuotientMap (localBaseValuation K).range n hn) := by
  constructor
  · intro q₁ q₂
    refine Quotient.inductionOn' q₁ ?_
    intro z₁
    refine Quotient.inductionOn' q₂ ?_
    intro z₂ h
    apply QuotientAddGroup.eq_iff_sub_mem.mpr
    rw [← localValueGroupReduction_ker K n hn]
    change localValueGroupReduction K n hn (z₁ - z₂) = 0
    rw [map_sub]
    change localValueGroupReduction K n hn z₁ =
      localValueGroupReduction K n hn z₂ at h
    rw [h, sub_self]
  · intro a
    obtain ⟨z, hz⟩ := localValueGroupReduction_surjective K n hn a
    refine ⟨QuotientAddGroup.mk'
      (nsmulWithin (localBaseValuation K).range n) z, ?_⟩
    exact hz
end
end LocalClassFieldTheory
end

/- ClassFieldTheory.LocalClassFieldTheory.Finite.LocalReciprocity.SeparableNormProduct -/
section
noncomputable section
open scoped BigOperators
namespace LocalClassFieldTheory
noncomputable local instance finiteSeparableAlgHomFintypeForNormProduct
    {k E T : Type} [Field k] [Field E] [Field T]
    [Algebra k E] [Algebra k T]
    [FiniteDimensional k E] [Algebra.IsSeparable k E] :
    Fintype (E →ₐ[k] T) :=
  PowerBasis.AlgHom.fintype (Field.powerBasisOfFiniteOfSeparable k E)
 

theorem prod_embeddings_algebraMap_powerBasisGen_eq
    (k Ω : Type) [Field k] [Field Ω] [Algebra k Ω] [IsSepClosed Ω]
    {L E : Type} [Field L] [Field E]
    [Algebra k L] [Algebra k E] [Algebra L E] [IsScalarTower k L E]
    [FiniteDimensional k L] [Algebra.IsSeparable k L]
    [Algebra.IsSeparable k E] [FiniteDimensional k E]
    (pb : PowerBasis k L) :
    ∏ σ : E →ₐ[k] Ω, σ (algebraMap L E pb.gen) =
      ((@Finset.univ (L →ₐ[k] Ω) (PowerBasis.AlgHom.fintype pb)).prod
        (fun σ => σ pb.gen)) ^ Module.finrank L E := by
  have : FiniteDimensional L E := FiniteDimensional.right k L E
  have : Algebra.IsSeparable L E :=
    Algebra.isSeparable_tower_top_of_isSeparable k L E
  let : Fintype (L →ₐ[k] Ω) := PowerBasis.AlgHom.fintype pb
  rw [Fintype.prod_equiv algHomEquivSigma
    (fun σ : E →ₐ[k] Ω => σ (algebraMap L E pb.gen))
    (fun σ => σ.1 pb.gen)]
  rw [← Finset.univ_sigma_univ, Finset.prod_sigma, ← Finset.prod_pow]
  · refine Finset.prod_congr rfl fun σ _ => ?_
    let : Algebra L Ω := σ.toRingHom.toAlgebra
    simp_rw [Finset.prod_const]
    congr
    rw [Finset.card_univ, Fintype.card_eq_nat_card]
    exact AlgHom.natCard_of_splits L E Ω (fun x =>
      IsSepClosed.splits_codomain _ (Algebra.IsSeparable.isSeparable L x))
  · intro σ
    change σ (algebraMap L E pb.gen) =
      (σ.comp (IsScalarTower.toAlgHom k L E)) pb.gen
    exact (AlgHom.comp_apply σ (IsScalarTower.toAlgHom k L E) pb.gen).symm
 

theorem algebraMap_norm_eq_prod_embeddings_of_isSepClosed
    (k Ω E : Type) [Field k] [Field Ω] [Field E]
    [Algebra k Ω] [IsSepClosed Ω] [Algebra k E]
    [FiniteDimensional k E] [Algebra.IsSeparable k E]
    (x : E) :
    algebraMap k Ω (Algebra.norm k x) = ∏ σ : E →ₐ[k] Ω, σ x := by
  have hx := Algebra.IsSeparable.isIntegral k x
  let : Algebra.IsSeparable k
      (IntermediateField.adjoin k ({x} : Set E)) :=
    Algebra.isSeparable_tower_bot_of_isSeparable k
      (IntermediateField.adjoin k ({x} : Set E)) E
  rw [Algebra.norm_eq_norm_adjoin k x, map_pow,
    ← IntermediateField.adjoin.powerBasis_gen hx,
    Algebra.norm_eq_prod_embeddings_gen Ω
      (IntermediateField.adjoin.powerBasis hx)
      (IsSepClosed.splits_codomain _
        (Algebra.IsSeparable.isSeparable k
          (IntermediateField.adjoin.powerBasis hx).gen))]
  · simpa only [IntermediateField.adjoin.powerBasis_gen,
      IntermediateField.AdjoinSimple.algebraMap_gen] using
      (prod_embeddings_algebraMap_powerBasisGen_eq
        (L := IntermediateField.adjoin k ({x} : Set E)) (E := E)
        k Ω (IntermediateField.adjoin.powerBasis hx)).symm
  · exact Algebra.IsSeparable.isSeparable k _
end LocalClassFieldTheory
end

/- ClassFieldTheory.LocalClassFieldTheory.Finite.LocalReciprocity.SeparableFixedFieldNorm -/
section
namespace LocalClassFieldTheory
open RamificationTheory KummerTheory
open LocalFieldTheory
open ClassFormation CyclicCohomology
noncomputable section
open scoped BigOperators
variable (K Ω : Type) [Field K] [Field Ω] [Algebra K Ω]
  [IsGalois K Ω] [IsSepClosed Ω]
section CosetsAndEmbeddings
variable (E : IntermediateField K Ω)
 

def baseFixingCosetToAlgHom :
    ((closedFixingSubgroup K Ω (⊥ : IntermediateField K Ω)).toSubgroup ⧸
      extensionSubgroup
        (closedFixingSubgroup K Ω (⊥ : IntermediateField K Ω))
        (closedFixingSubgroup K Ω E) (fixingSubgroupLeBase K Ω E)) →
      (E →ₐ[K] Ω) := fun q =>
  Quotient.liftOn' q
    (fun σ => σ.1.toAlgHom.comp E.val)
    (by
      intro σ τ hστ
      have hmem : σ⁻¹ * τ ∈
          extensionSubgroup
            (closedFixingSubgroup K Ω (⊥ : IntermediateField K Ω))
            (closedFixingSubgroup K Ω E) (fixingSubgroupLeBase K Ω E) :=
        QuotientGroup.leftRel_apply.mp hστ
      let η : (closedFixingSubgroup K Ω E).toSubgroup :=
        ⟨(σ⁻¹ * τ).1, hmem⟩
      have hτ : τ = σ * Subgroup.inclusion
          (fixingSubgroupLeBase K Ω E) η := by
        apply Subtype.ext
        change τ.1 = σ.1 * η.1
        simp [η]
      apply AlgHom.ext
      intro x
      have hηfix :=
        (IntermediateField.mem_fixingSubgroup_iff E η.1).mp η.2
      have hηx : η.1 (x : Ω) = (x : Ω) := hηfix x x.2
      have hτ' := congrArg Subtype.val hτ
      change τ.1 = σ.1 * η.1 at hτ'
      change σ.1 (x : Ω) = τ.1 (x : Ω)
      calc
        σ.1 (x : Ω) = σ.1 (η.1 (x : Ω)) :=
          congrArg σ.1 hηx.symm
        _ = (σ.1 * η.1) (x : Ω) := rfl
        _ = τ.1 (x : Ω) := by rw [hτ'])
private theorem baseFixingCosetToAlgHom_surjective
    [FiniteDimensional K E] [Algebra.IsSeparable K E] :
    Function.Surjective (baseFixingCosetToAlgHom K Ω E) := by
  intro f
  let : Algebra.IsSeparable E Ω :=
    Algebra.isSeparable_tower_top_of_isSeparable K E Ω
  obtain ⟨φ, hφ⟩ :=
    (IsSepClosed.surjective_domRestrict_of_isSeparable
      (K := K) (L := E) (M := Ω) (E := Ω)) f
  let σ : Ω ≃ₐ[K] Ω :=
    AlgEquiv.ofBijective φ
      (Normal.toIsAlgebraic.algHom_bijective₂
        φ (AlgHom.id K Ω)).1
  have hσ : σ ∈ (closedFixingSubgroup K Ω
      (⊥ : IntermediateField K Ω)).toSubgroup := by
    change σ ∈ (⊥ : IntermediateField K Ω).fixingSubgroup
    rw [IntermediateField.fixingSubgroup_bot]
    exact Subgroup.mem_top σ
  let σbase : (closedFixingSubgroup K Ω
      (⊥ : IntermediateField K Ω)).toSubgroup := ⟨σ, hσ⟩
  refine ⟨QuotientGroup.mk σbase, ?_⟩
  apply AlgHom.ext
  intro x
  have hx := congrArg (fun ψ : E →ₐ[K] Ω => ψ x) hφ
  change φ (x : Ω) = f x
  change φ (x : Ω) = f x at hx
  exact hx
omit [IsSepClosed Ω] in
private theorem baseFixingCosetToAlgHom_injective :
    Function.Injective (baseFixingCosetToAlgHom K Ω E) := by
  intro q r hqr
  rw [← Quotient.out_eq q, ← Quotient.out_eq r] at hqr ⊢
  apply Quotient.sound'
  apply QuotientGroup.leftRel_apply.mpr
  apply (mem_extensionSubgroup_iff
    (closedFixingSubgroup K Ω (⊥ : IntermediateField K Ω))
    (closedFixingSubgroup K Ω E) (fixingSubgroupLeBase K Ω E)
    ((Quotient.out q)⁻¹ * Quotient.out r)).2
  change (Quotient.out q).1⁻¹ * (Quotient.out r).1 ∈ E.fixingSubgroup
  rw [IntermediateField.mem_fixingSubgroup_iff]
  intro x hx
  let y : E := ⟨x, hx⟩
  have hy := congrArg (fun ψ : E →ₐ[K] Ω => ψ y) hqr
  change (Quotient.out q).1 (y : Ω) =
    (Quotient.out r).1 (y : Ω) at hy
  change (Quotient.out q).1⁻¹ ((Quotient.out r).1 x) = x
  rw [← hy]
  simp [y]
 

def baseFixingCosetEquivAlgHom
    [FiniteDimensional K E] [Algebra.IsSeparable K E] :
    ((closedFixingSubgroup K Ω (⊥ : IntermediateField K Ω)).toSubgroup ⧸
      extensionSubgroup
        (closedFixingSubgroup K Ω (⊥ : IntermediateField K Ω))
        (closedFixingSubgroup K Ω E) (fixingSubgroupLeBase K Ω E)) ≃
      (E →ₐ[K] Ω) :=
  Equiv.ofBijective (baseFixingCosetToAlgHom K Ω E)
    ⟨baseFixingCosetToAlgHom_injective K Ω E,
      baseFixingCosetToAlgHom_surjective K Ω E⟩
 
noncomputable instance baseFixingExtensionQuotient_finite_of_isSeparable
    [FiniteDimensional K E] [Algebra.IsSeparable K E] :
    Finite
      ((closedFixingSubgroup K Ω (⊥ : IntermediateField K Ω)).toSubgroup ⧸
        extensionSubgroup
          (closedFixingSubgroup K Ω (⊥ : IntermediateField K Ω))
          (closedFixingSubgroup K Ω E) (fixingSubgroupLeBase K Ω E)) :=
  (baseFixingCosetEquivAlgHom K Ω E).finite_iff.mpr inferInstance
end CosetsAndEmbeddings
section NormAsProduct
noncomputable local instance finiteSeparableAlgHomFintype
    {k F T : Type} [Field k] [Field F] [Field T]
    [Algebra k F] [Algebra k T]
    [FiniteDimensional k F] [Algebra.IsSeparable k F] :
    Fintype (F →ₐ[k] T) :=
  PowerBasis.AlgHom.fintype (Field.powerBasisOfFiniteOfSeparable k F)
variable (E : IntermediateField K Ω)
  [FiniteDimensional K E] [Algebra.IsSeparable K E]
omit [IsSepClosed Ω] [FiniteDimensional K E] [Algebra.IsSeparable K E] in
 

theorem relativeCosetAction_intermediateFieldUnit_val_of_isSeparable
    (x : Eˣ)
    (q : (closedFixingSubgroup K Ω
        (⊥ : IntermediateField K Ω)).toSubgroup ⧸
      extensionSubgroup
        (closedFixingSubgroup K Ω (⊥ : IntermediateField K Ω))
        (closedFixingSubgroup K Ω E) (fixingSubgroupLeBase K Ω E)) :
    ((Additive.toMul
      (relativeCosetAction (galoisAmbientUnitsRep K Ω)
        (closedFixingSubgroup K Ω (⊥ : IntermediateField K Ω))
        (closedFixingSubgroup K Ω E) (fixingSubgroupLeBase K Ω E)
        (intermediateFieldUnitsEquivGaloisFixed K Ω E
          (Additive.ofMul x)) q) : Ωˣ) : Ω) =
      baseFixingCosetToAlgHom K Ω E q (x : E) := by
  refine Quotient.inductionOn' q ?_
  intro σ
  rfl
 

theorem relativeNorm_intermediateFieldUnit_val_of_isSeparable (x : Eˣ) :
    ((Additive.toMul
      ((relativeNorm (galoisAmbientUnitsRep K Ω)
        (closedFixingSubgroup K Ω (⊥ : IntermediateField K Ω))
        (closedFixingSubgroup K Ω E) (fixingSubgroupLeBase K Ω E)
        (intermediateFieldUnitsEquivGaloisFixed K Ω E
          (Additive.ofMul x))).1 : Additive Ωˣ) : Ωˣ) : Ω) =
      algebraMap K Ω (Algebra.norm K (x : E)) := by
  let Q := (closedFixingSubgroup K Ω
      (⊥ : IntermediateField K Ω)).toSubgroup ⧸
    extensionSubgroup
      (closedFixingSubgroup K Ω (⊥ : IntermediateField K Ω))
      (closedFixingSubgroup K Ω E) (fixingSubgroupLeBase K Ω E)
  let := Fintype.ofFinite Q
  change
    ((Additive.toMul
      (relativeNormValue (galoisAmbientUnitsRep K Ω)
        (closedFixingSubgroup K Ω (⊥ : IntermediateField K Ω))
        (closedFixingSubgroup K Ω E) (fixingSubgroupLeBase K Ω E)
        (intermediateFieldUnitsEquivGaloisFixed K Ω E
          (Additive.ofMul x))) : Ωˣ) : Ω) = _
  rw [relativeNormValue]
  change
    (↑(Additive.toMul (∑ q : Q,
      relativeCosetAction (galoisAmbientUnitsRep K Ω)
        (closedFixingSubgroup K Ω (⊥ : IntermediateField K Ω))
        (closedFixingSubgroup K Ω E) (fixingSubgroupLeBase K Ω E)
        (intermediateFieldUnitsEquivGaloisFixed K Ω E
          (Additive.ofMul x)) q) : Ωˣ) : Ω) = _

  change (Units.coeHom Ω) (∏ q : Q,
    Additive.toMul
      (relativeCosetAction (galoisAmbientUnitsRep K Ω)
        (closedFixingSubgroup K Ω (⊥ : IntermediateField K Ω))
        (closedFixingSubgroup K Ω E) (fixingSubgroupLeBase K Ω E)
        (intermediateFieldUnitsEquivGaloisFixed K Ω E
          (Additive.ofMul x)) q)) = _
  rw [map_prod]
  change
    (∏ q : Q,
      ((Additive.toMul
        (relativeCosetAction (galoisAmbientUnitsRep K Ω)
          (closedFixingSubgroup K Ω (⊥ : IntermediateField K Ω))
          (closedFixingSubgroup K Ω E) (fixingSubgroupLeBase K Ω E)
          (intermediateFieldUnitsEquivGaloisFixed K Ω E
            (Additive.ofMul x)) q) : Ωˣ) : Ω)) = _
  calc
    _ = ∏ σ : E →ₐ[K] Ω, σ (x : E) := by
      exact Fintype.prod_equiv
        (baseFixingCosetEquivAlgHom K Ω E)
        (fun q : Q =>
          ((Additive.toMul
            (relativeCosetAction (galoisAmbientUnitsRep K Ω)
              (closedFixingSubgroup K Ω (⊥ : IntermediateField K Ω))
              (closedFixingSubgroup K Ω E) (fixingSubgroupLeBase K Ω E)
              (intermediateFieldUnitsEquivGaloisFixed K Ω E
                (Additive.ofMul x)) q) : Ωˣ) : Ω))
        (fun σ : E →ₐ[K] Ω => σ (x : E))
        (relativeCosetAction_intermediateFieldUnit_val_of_isSeparable
          K Ω E x)
    _ = algebraMap K Ω (Algebra.norm K (x : E)) :=
      (algebraMap_norm_eq_prod_embeddings_of_isSepClosed
        K Ω E (x : E)).symm
end NormAsProduct
end
end LocalClassFieldTheory
end

/- ClassFieldTheory.LocalClassFieldTheory.Finite.LocalReciprocity.AbstractFixedFieldNorm -/
section
namespace LocalClassFieldTheory
open RamificationTheory CyclicCohomology KummerTheory ClassFormation
open LocalFieldTheory
noncomputable section
open scoped ValuativeRel
variable (K Ω : Type) [Field K] [Field Ω] [Algebra K Ω]
  [IsGalois K Ω] [IsSepClosed Ω]
 



theorem relativeNorm_coe_eq_of_closedSubgroup_eq
    {G : Type} [Group G] [TopologicalSpace G]
    (A : Rep ℤ G)
    (B B' C C' : ClosedSubgroup G)
    (hCB : C.toSubgroup ≤ B.toSubgroup)
    (hC'B' : C'.toSubgroup ≤ B'.toSubgroup)
    [hfinite : Finite
      (B.toSubgroup ⧸ extensionSubgroup B C hCB)]
    [hfinite' : Finite
      (B'.toSubgroup ⧸ extensionSubgroup B' C' hC'B')]
    (hB : B = B') (hC : C = C')
    (x : ambientFixedAddSubgroup A C)
    (x' : ambientFixedAddSubgroup A C')
    (hx : x.1 = x'.1) :
    ((relativeNorm A B C hCB x : ambientFixedAddSubgroup A B) : A.V) =
      ((relativeNorm A B' C' hC'B' x' :
        ambientFixedAddSubgroup A B') : A.V) := by
  subst B'
  subst C'
  have hle : hCB = hC'B' := Subsingleton.elim _ _
  subst hC'B'
  have hfin : hfinite = hfinite' := Subsingleton.elim _ _
  subst hfinite'
  have hxx' : x = x' := Subtype.ext hx
  subst x'
  rfl
 


theorem normToBase_abstractFixedFieldUnit_val_of_isSeparable
    (H : ClosedSubgroup (Gal(Ω / K)))
    [Finite ((baseField (Gal(Ω / K))).toSubgroup ⧸
      extensionSubgroup (baseField (Gal(Ω / K))) H (le_baseField H))]
    [FiniteDimensional K (abstractFixedField K Ω H)]
    [Algebra.IsSeparable K (abstractFixedField K Ω H)]
    (x : (abstractFixedField K Ω H)ˣ) :
    ((Additive.toMul
      ((normToBase (galoisAmbientUnitsRep K Ω) H
        (abstractFixedFieldUnitsEquivGaloisFixed K Ω H
          (Additive.ofMul x))).1 : Additive Ωˣ) : Ωˣ) : Ω) =
      algebraMap K Ω (Algebra.norm K
        (x : abstractFixedField K Ω H)) := by
  let E := abstractFixedField K Ω H
  let y : ambientFixedAddSubgroup (galoisAmbientUnitsRep K Ω) H :=
    abstractFixedFieldUnitsEquivGaloisFixed K Ω H (Additive.ofMul x)
  let yE := intermediateFieldUnitsEquivGaloisFixed K Ω E (Additive.ofMul x)
  have hy : yE.1 = y.1 := by
    rw [intermediateFieldUnitsEquivGaloisFixed_coe]
    exact (abstractFixedFieldUnitsEquivGaloisFixed_coe
      K Ω H (Additive.ofMul x)).symm
  have hnorm :=
    relativeNorm_intermediateFieldUnit_val_of_isSeparable K Ω E x
  have htransport := relativeNorm_coe_eq_of_closedSubgroup_eq
    (galoisAmbientUnitsRep K Ω)
    (closedFixingSubgroup K Ω (⊥ : IntermediateField K Ω))
    (baseField (Gal(Ω / K)))
    (closedFixingSubgroup K Ω E) H
    (fixingSubgroupLeBase K Ω E) (le_baseField H)
    (closedFixingSubgroup_bot_eq_baseField K Ω)
    (closedFixingSubgroup_abstractFixedField_eq K Ω H)
    yE y hy
  have htransport' := congrArg
    (fun z : Additive Ωˣ => ((Additive.toMul z : Ωˣ) : Ω)) htransport
  change
    ((Additive.toMul
      ((normToBase (galoisAmbientUnitsRep K Ω) H y).1 :
        Additive Ωˣ) : Ωˣ) : Ω) = _
  exact htransport'.symm.trans hnorm
 

theorem localBaseValuation_normToBase_abstractFixedFieldUnit
    (K : Type) [Field K] [CharZero K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K]
    (H : ClosedSubgroup (Gal(SeparableClosure K / K)))
    [Finite ((baseField (Gal(SeparableClosure K / K))).toSubgroup ⧸
      extensionSubgroup (baseField (Gal(SeparableClosure K / K))) H
        (le_baseField H))]
    [FiniteDimensional K
      (abstractFixedField K (SeparableClosure K) H)]
    (x : (abstractFixedField K (SeparableClosure K) H)ˣ) :
    localBaseValuation K
        (normToBase
          (galoisAmbientUnitsRep K (SeparableClosure K)) H
          (abstractFixedFieldUnitsEquivGaloisFixed
            K (SeparableClosure K) H (Additive.ofMul x))) =
      Int.castRingHom ZHat
        (LocalFieldTheory.IsNonarchimedeanLocalField.valuationMap K
          (Additive.ofMul
            (normUnits K (abstractFixedField K (SeparableClosure K) H) x))) := by
  let E := abstractFixedField K (SeparableClosure K) H
  let a := normToBase
    (galoisAmbientUnitsRep K (SeparableClosure K)) H
    (abstractFixedFieldUnitsEquivGaloisFixed
      K (SeparableClosure K) H (Additive.ofMul x))
  have ha : (baseFieldUnitsEquiv K).symm a =
      Additive.ofMul (normUnits K E x) := by
    apply (baseFieldUnitsEquiv K).injective
    rw [(baseFieldUnitsEquiv K).apply_symm_apply]
    apply Subtype.ext
    apply Additive.ext
    apply Units.ext
    calc
      ((Additive.toMul
          ((normToBase
            (galoisAmbientUnitsRep K (SeparableClosure K)) H
            (abstractFixedFieldUnitsEquivGaloisFixed
              K (SeparableClosure K) H (Additive.ofMul x))).1 :
              Additive (SeparableClosure K)ˣ) :
            (SeparableClosure K)ˣ) : SeparableClosure K) =
          algebraMap K (SeparableClosure K)
            (Algebra.norm K (x : E)) :=
        normToBase_abstractFixedFieldUnit_val_of_isSeparable
          K (SeparableClosure K) H x
      _ = algebraMap K (SeparableClosure K)
          ((normUnits K E x : Kˣ) : K) := by
        rw [LocalFieldTheory.normUnits_apply_coe]
      _ =
          ((Additive.toMul
            ((baseFieldUnitsEquiv K
              (Additive.ofMul (normUnits K E x))).1 :
                Additive (SeparableClosure K)ˣ) :
              (SeparableClosure K)ˣ) : SeparableClosure K) :=
        (baseFieldUnitsEquiv_val K (normUnits K E x)).symm
  rw [show normToBase
      (galoisAmbientUnitsRep K (SeparableClosure K)) H
      (abstractFixedFieldUnitsEquivGaloisFixed
        K (SeparableClosure K) H (Additive.ofMul x)) = a from rfl]
  change Int.castRingHom ZHat
      (LocalFieldTheory.IsNonarchimedeanLocalField.valuationMap K
        ((baseFieldUnitsEquiv K).symm a)) = _
  rw [ha]
 


theorem localBaseValuation_comp_normToBase_range_eq_residueFinrank
    (K : Type) [Field K] [CharZero K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K]
    (H : ClosedSubgroup (Gal(SeparableClosure K / K)))
    [Finite ((baseField (Gal(SeparableClosure K / K))).toSubgroup ⧸
      extensionSubgroup (baseField (Gal(SeparableClosure K / K))) H
        (le_baseField H))]
    [FiniteDimensional K
      (abstractFixedField K (SeparableClosure K) H)]
    [ValuativeRel (abstractFixedField K (SeparableClosure K) H)]
    [TopologicalSpace (abstractFixedField K (SeparableClosure K) H)]
    [IsNonarchimedeanLocalField
      (abstractFixedField K (SeparableClosure K) H)]
    [Valuation.HasExtension (ValuativeRel.valuation K)
      (ValuativeRel.valuation
        (abstractFixedField K (SeparableClosure K) H))]
    [hIntegralClosure : IsIntegralClosure
      ((ValuativeRel.valuation (abstractFixedField K (SeparableClosure K) H)).integer) ((ValuativeRel.valuation (K)).integer)
      (abstractFixedField K (SeparableClosure K) H)] :
    ((localBaseValuation K).comp
      (normToBase
        (galoisAmbientUnitsRep K (SeparableClosure K)) H)).range =
      nsmulImage (localBaseValuation K).range
        (LocalFieldTheory.valuationResidueDegree K (abstractFixedField K (SeparableClosure K) H)) := by
  let f := LocalFieldTheory.valuationResidueDegree K (abstractFixedField K (SeparableClosure K) H)
  ext z
  constructor
  · rintro ⟨a, rfl⟩
    let x : Additive
        (abstractFixedField K (SeparableClosure K) H)ˣ :=
      (abstractFixedFieldUnitsEquivGaloisFixed
        K (SeparableClosure K) H).symm a
    have hxa : abstractFixedFieldUnitsEquivGaloisFixed
        K (SeparableClosure K) H x = a :=
      (abstractFixedFieldUnitsEquivGaloisFixed
        K (SeparableClosure K) H).apply_symm_apply a
    rw [← hxa]
    change localBaseValuation K
      (normToBase (galoisAmbientUnitsRep K (SeparableClosure K)) H
        (abstractFixedFieldUnitsEquivGaloisFixed
          K (SeparableClosure K) H
            (Additive.ofMul (Additive.toMul x)))) ∈ _
    rw [localBaseValuation_normToBase_abstractFixedFieldUnit]
    have hnorm :=
      @v_normUnits_eq_residue_finrank_mul_of_isSeparable
        K (abstractFixedField K (SeparableClosure K) H)
          _ _ _ _ _ _ _ _ _ _ _ _ _ hIntegralClosure (Additive.toMul x)
    have hnorm' :
        LocalFieldTheory.IsNonarchimedeanLocalField.valuationMap K
            (Additive.ofMul
              (normUnits K
                (abstractFixedField K (SeparableClosure K) H)
                (Additive.toMul x))) =
          (f : Int) *
            LocalFieldTheory.IsNonarchimedeanLocalField.valuationMap
              (abstractFixedField K (SeparableClosure K) H) x := by
      simp only [LocalFieldTheory.IsNonarchimedeanLocalField.valuationMap_apply,f]
      exact hnorm
    rw [hnorm', mem_nsmulImage_iff]
    refine ⟨Int.castRingHom ZHat
        (LocalFieldTheory.IsNonarchimedeanLocalField.valuationMap
          (abstractFixedField K (SeparableClosure K) H) x),
      intToProCInteger_mem_localBaseValuation_range K _, ?_⟩
    rw [← map_nsmul]
    congr 1
  · rw [mem_nsmulImage_iff]
    rintro ⟨w, hw, hwz⟩
    rw [localBaseValuation_range K] at hw
    obtain ⟨m, rfl⟩ := hw
    obtain ⟨x, hx⟩ :=
      LocalFieldTheory.IsNonarchimedeanLocalField.valuationMap_surjective
        (abstractFixedField K (SeparableClosure K) H) m
    refine ⟨abstractFixedFieldUnitsEquivGaloisFixed
      K (SeparableClosure K) H x, ?_⟩
    change localBaseValuation K
      (normToBase (galoisAmbientUnitsRep K (SeparableClosure K)) H
        (abstractFixedFieldUnitsEquivGaloisFixed
          K (SeparableClosure K) H
            (Additive.ofMul (Additive.toMul x)))) = z
    rw [localBaseValuation_normToBase_abstractFixedFieldUnit]
    have hnorm :=
      @v_normUnits_eq_residue_finrank_mul_of_isSeparable
        K (abstractFixedField K (SeparableClosure K) H)
          _ _ _ _ _ _ _ _ _ _ _ _ _ hIntegralClosure (Additive.toMul x)
    have hnorm' :
        LocalFieldTheory.IsNonarchimedeanLocalField.valuationMap K
            (Additive.ofMul
              (normUnits K
                (abstractFixedField K (SeparableClosure K) H)
                (Additive.toMul x))) =
          (f : Int) *
            LocalFieldTheory.IsNonarchimedeanLocalField.valuationMap
              (abstractFixedField K (SeparableClosure K) H) x := by
      simp only [LocalFieldTheory.IsNonarchimedeanLocalField.valuationMap_apply,f]
      exact hnorm
    rw [hnorm', hx]
    calc
      Int.castRingHom ZHat
          ((f : Int) * m) =
          f • Int.castRingHom ZHat m := by
        rw [← map_nsmul]
        congr 1
      _ = z := hwz
end
end LocalClassFieldTheory
end

/- ClassFieldTheory.LocalClassFieldTheory.Finite.LocalReciprocity.FiniteResidueFrobenius -/
section
namespace LocalClassFieldTheory
open ClassFormation
noncomputable section
universe u v w
variable (k : Type u) (L : Type v)
  [Field k] [Fintype k] [Field L] [Finite L] [Algebra k L]
 
private def finiteResidueFrobeniusIntegerPowers :
    ℤ →+ Additive (L ≃ₐ[k] L) :=
  zmultiplesHom (Additive (L ≃ₐ[k] L)) (Additive.ofMul
    (FiniteField.frobeniusAlgEquivOfAlgebraic k L))
 

private theorem finiteResidueFrobeniusIntegerPowers_degree_eq_zero :
    finiteResidueFrobeniusIntegerPowers k L (Module.finrank k L) = 0 := by
  apply Additive.ext
  change (FiniteField.frobeniusAlgEquivOfAlgebraic k L) ^
      (Module.finrank k L : ℤ) = 1
  rw [← FiniteField.orderOf_frobeniusAlgEquivOfAlgebraic (K := k) (L := L)]
  rw [zpow_natCast, pow_orderOf_eq_one]
 

def finiteResidueFrobeniusExponentHom :
    Multiplicative (ZMod (Module.finrank k L)) →* (L ≃ₐ[k] L) :=
  AddMonoidHom.toMultiplicative
    (ZMod.lift (Module.finrank k L)
      ⟨finiteResidueFrobeniusIntegerPowers k L,
        finiteResidueFrobeniusIntegerPowers_degree_eq_zero k L⟩)
 
@[simp]
theorem finiteResidueFrobeniusExponentHom_intCast (m : ℤ) :
    finiteResidueFrobeniusExponentHom k L
        (Multiplicative.ofAdd (m : ZMod (Module.finrank k L))) =
      (FiniteField.frobeniusAlgEquivOfAlgebraic k L) ^ m := by
  change
    (ZMod.lift (Module.finrank k L)
      ⟨finiteResidueFrobeniusIntegerPowers k L,
        finiteResidueFrobeniusIntegerPowers_degree_eq_zero k L⟩)
      (m : ZMod (Module.finrank k L)) =
        Additive.ofMul ((FiniteField.frobeniusAlgEquivOfAlgebraic k L) ^ m)
  rw [ZMod.lift_coe]
  rfl
 
@[simp]
theorem finiteResidueFrobeniusExponentHom_one :
    finiteResidueFrobeniusExponentHom k L
        (Multiplicative.ofAdd (1 : ZMod (Module.finrank k L))) =
      FiniteField.frobeniusAlgEquivOfAlgebraic k L := by
  simpa using finiteResidueFrobeniusExponentHom_intCast k L 1
 

theorem finiteResidueFrobeniusExponentHom_surjective :
    Function.Surjective (finiteResidueFrobeniusExponentHom k L) := by
  intro sigma
  obtain ⟨m, hm⟩ :=
    (FiniteField.bijective_frobeniusAlgEquivOfAlgebraic_pow k L).2 sigma
  refine ⟨Multiplicative.ofAdd
    ((m.1 : ℤ) : ZMod (Module.finrank k L)), ?_⟩
  rw [finiteResidueFrobeniusExponentHom_intCast]
  simpa [zpow_natCast] using hm
 
theorem finiteResidueFrobeniusExponentHom_injective :
    Function.Injective (finiteResidueFrobeniusExponentHom k L) := by
  let : NeZero (Module.finrank k L) := ⟨Module.finrank_pos.ne'⟩
  have hcard :
      Nat.card (Multiplicative (ZMod (Module.finrank k L))) =
        Nat.card (L ≃ₐ[k] L) := by
    rw [Nat.card_congr Multiplicative.toAdd,
      Nat.card_zmod, IsGalois.card_aut_eq_finrank]
  exact ((finiteResidueFrobeniusExponentHom_surjective k L).bijective_of_nat_card_le
    hcard.le).1
 
def finiteResidueFrobeniusExponentEquiv :
    Multiplicative (ZMod (Module.finrank k L)) ≃* (L ≃ₐ[k] L) :=
  MulEquiv.ofBijective (finiteResidueFrobeniusExponentHom k L)
    ⟨finiteResidueFrobeniusExponentHom_injective k L,
      finiteResidueFrobeniusExponentHom_surjective k L⟩
 

def finiteResidueFrobeniusFromZHat :
    ZHatMul →ₜ* (L ≃ₐ[k] L) where
  toFun z := finiteResidueFrobeniusExponentHom k L
    (Multiplicative.ofAdd
      (zHatReduction (Module.finrank k L) Module.finrank_pos z.toAdd))
  map_one' := by
    apply (finiteResidueFrobeniusExponentHom k L).map_one
  map_mul' x y := by
    apply (finiteResidueFrobeniusExponentHom k L).map_mul
  continuous_toFun := by
    apply continuous_of_discreteTopology.comp
    exact continuous_ofAdd.comp
      ((zHatReduction (Module.finrank k L) Module.finrank_pos).continuous_toFun.comp
        continuous_toAdd)
 
@[simp]
theorem finiteResidueFrobeniusFromZHat_apply (z : ZHatMul) :
    finiteResidueFrobeniusFromZHat k L z =
      finiteResidueFrobeniusExponentHom k L
        (Multiplicative.ofAdd
          (zHatReduction (Module.finrank k L) Module.finrank_pos z.toAdd)) :=
  rfl
 
@[simp]
theorem finiteResidueFrobeniusFromZHat_one :
    finiteResidueFrobeniusFromZHat k L
        (Multiplicative.ofAdd (1 : ZHat)) =
      FiniteField.frobeniusAlgEquivOfAlgebraic k L := by
  rw [finiteResidueFrobeniusFromZHat_apply]
  exact finiteResidueFrobeniusExponentHom_one k L
section Tower
variable {E : Type v} {F : Type w}
  [Field E] [Finite E] [Field F] [Finite F]
  [Algebra k E] [Algebra k F] [Algebra E F]
  [IsScalarTower k E F] [Normal k E]
 

theorem restrictNormalHom_finiteResidueFrobenius :
    AlgEquiv.restrictNormalHom E
        (FiniteField.frobeniusAlgEquivOfAlgebraic k F) =
      FiniteField.frobeniusAlgEquivOfAlgebraic k E := by
  apply AlgEquiv.ext
  intro x
  apply (algebraMap E F).injective
  calc
    (algebraMap E F)
        (((AlgEquiv.restrictNormalHom E)
          (FiniteField.frobeniusAlgEquivOfAlgebraic k F)) x) =
        FiniteField.frobeniusAlgEquivOfAlgebraic k F
          (algebraMap E F x) :=
      AlgEquiv.restrictNormal_commutes
        (FiniteField.frobeniusAlgEquivOfAlgebraic k F) E x
    _ = (algebraMap E F
        ((FiniteField.frobeniusAlgEquivOfAlgebraic k E) x) : F) := by
      simp only [FiniteField.coe_frobeniusAlgEquivOfAlgebraic]
      exact (map_pow (algebraMap E F) x (Fintype.card k)).symm
 


theorem restrictNormalHom_finiteResidueFrobeniusExponentHom
    (z : Multiplicative (ZMod (Module.finrank k F))) :
    AlgEquiv.restrictNormalHom E
        (finiteResidueFrobeniusExponentHom k F z) =
      finiteResidueFrobeniusExponentHom k E
        (Multiplicative.ofAdd
          (ZMod.castHom
            (show Module.finrank k E ∣ Module.finrank k F from
              ⟨Module.finrank E F,
                (Module.finrank_mul_finrank k E F).symm⟩)
            (ZMod (Module.finrank k E)) z.toAdd)) := by
  rcases ZMod.intCast_surjective z.toAdd with ⟨m, hm⟩
  have hz : z = Multiplicative.ofAdd
      (m : ZMod (Module.finrank k F)) := by
    apply Multiplicative.ext
    exact hm.symm
  subst z
  apply AlgEquiv.ext
  intro x
  rw [finiteResidueFrobeniusExponentHom_intCast]
  simp only [toAdd_ofAdd]
  have hred :
      ZMod.castHom
          (show Module.finrank k E ∣ Module.finrank k F from
            ⟨Module.finrank E F,
              (Module.finrank_mul_finrank k E F).symm⟩)
          (ZMod (Module.finrank k E))
          (m : ZMod (Module.finrank k F)) =
        (m : ZMod (Module.finrank k E)) := by
    exact map_intCast _ m
  rw [hred, finiteResidueFrobeniusExponentHom_intCast]
  have hfrob := restrictNormalHom_finiteResidueFrobenius
    (k := k) (E := E) (F := F)
  have hpow := congrArg (fun sigma : E ≃ₐ[k] E => sigma ^ m) hfrob
  rw [map_zpow]
  exact DFunLike.congr_fun hpow x
 

theorem restrictNormalHom_finiteResidueFrobeniusFromZHat (z : ZHatMul) :
    AlgEquiv.restrictNormalHom E
        (finiteResidueFrobeniusFromZHat k F z) =
      finiteResidueFrobeniusFromZHat k E z := by
  rw [finiteResidueFrobeniusFromZHat_apply,
    restrictNormalHom_finiteResidueFrobeniusExponentHom,
    finiteResidueFrobeniusFromZHat_apply]
  congr 2
  apply Multiplicative.ext
  exact zHatReduction_transition
    (m := Module.finrank k E) (n := Module.finrank k F)
    Module.finrank_pos Module.finrank_pos
    (show Module.finrank k E ∣ Module.finrank k F from
      ⟨Module.finrank E F,
        (Module.finrank_mul_finrank k E F).symm⟩)
    z.toAdd
end Tower
end
end LocalClassFieldTheory
end

/- ClassFieldTheory.LocalClassFieldTheory.Finite.LocalReciprocity.ResidueAbsoluteFrobenius -/
section
namespace LocalClassFieldTheory
open ClassFormation
noncomputable section
universe u v
open CategoryTheory Opposite
open FiniteGaloisIntermediateField ProfiniteGrp
variable (k : Type u) (Omega : Type v)
  [Field k] [Fintype k] [Field Omega] [Algebra k Omega]
  [IsGalois k Omega]
 

def finiteResidueFrobeniusIntermediate
    (E : FiniteGaloisIntermediateField k Omega) :
    ZHatMul →ₜ* (E ≃ₐ[k] E) := by
  letI : Finite E := Module.finite_of_finite k
  exact finiteResidueFrobeniusFromZHat k E
 

private def residueFrobeniusLimitPoint (z : ZHatMul) :
    limit (InfiniteGalois.asProfiniteGaloisGroupFunctor k Omega) where
  val := fun E => finiteResidueFrobeniusIntermediate k Omega E.unop z
  property := by
    intro E F f
    algebraize [Subsemiring.inclusion <| leOfHom f.1]
    have : IsScalarTower k F.unop E.unop :=
      IsScalarTower.of_algebraMap_eq (congrFun rfl)
    let : Finite F.unop := Module.finite_of_finite k
    let : Finite E.unop := Module.finite_of_finite k
    change AlgEquiv.restrictNormalHom F.unop
        (finiteResidueFrobeniusFromZHat k E.unop z) =
      finiteResidueFrobeniusFromZHat k F.unop z
    exact restrictNormalHom_finiteResidueFrobeniusFromZHat
      (k := k) (E := F.unop) (F := E.unop) z
 

def residueFrobeniusToLimit :
    ZHatMul →ₜ* limit (InfiniteGalois.asProfiniteGaloisGroupFunctor k Omega) where
  toFun := residueFrobeniusLimitPoint k Omega
  map_one' := by
    apply Subtype.ext
    funext E
    exact (finiteResidueFrobeniusIntermediate k Omega E.unop).map_one
  map_mul' x y := by
    apply Subtype.ext
    funext E
    exact (finiteResidueFrobeniusIntermediate k Omega E.unop).map_mul x y
  continuous_toFun := by
    have hcontinuous (E : (FiniteGaloisIntermediateField k Omega)ᵒᵖ) :
        @Continuous ZHatMul (E.unop ≃ₐ[k] E.unop)
          inferInstance (krullTopology k E.unop)
          (finiteResidueFrobeniusIntermediate k Omega E.unop) :=
      (finiteResidueFrobeniusIntermediate k Omega E.unop).continuous_toFun
    let (E : (FiniteGaloisIntermediateField k Omega)ᵒᵖ) :
        TopologicalSpace (E.unop ≃ₐ[k] E.unop) :=
      ((InfiniteGalois.asProfiniteGaloisGroupFunctor k Omega).obj E).toProfinite.toTop.str
    apply Continuous.subtype_mk
    exact continuous_pi fun E => by
      change @Continuous ZHatMul (E.unop ≃ₐ[k] E.unop)
        inferInstance inferInstance
        (finiteResidueFrobeniusIntermediate k Omega E.unop)
      rw [show
        (inferInstance : TopologicalSpace (E.unop ≃ₐ[k] E.unop)) =
          krullTopology k E.unop by
        change (⊥ : TopologicalSpace (E.unop ≃ₐ[k] E.unop)) = krullTopology k E.unop
        exact (@DiscreteTopology.eq_bot _ (krullTopology k E.unop) inferInstance).symm]
      exact hcontinuous E
 

def residueAbsoluteFrobenius : ZHatMul →ₜ* (Omega ≃ₐ[k] Omega) :=
  (ContinuousMonoidHom.toContinuousMonoidHom
    (InfiniteGalois.continuousMulEquivToLimit k Omega).symm).comp
    (residueFrobeniusToLimit k Omega)
 

theorem restrictNormalHom_residueAbsoluteFrobenius
    (z : ZHatMul) (E : FiniteGaloisIntermediateField k Omega) :
    AlgEquiv.restrictNormalHom E (residueAbsoluteFrobenius k Omega z) =
      finiteResidueFrobeniusIntermediate k Omega E z := by
  have hcomponent := congrArg (fun q => q.val (op E))
    ((InfiniteGalois.continuousMulEquivToLimit k Omega).apply_symm_apply
      (residueFrobeniusToLimit k Omega z))
  exact hcomponent
 

theorem restrictNormalHom_residueAbsoluteFrobenius_one
    (E : FiniteGaloisIntermediateField k Omega) :
    AlgEquiv.restrictNormalHom E
        (residueAbsoluteFrobenius k Omega
          (Multiplicative.ofAdd (1 : ZHat))) =
      FiniteField.frobeniusAlgEquivOfAlgebraic k E := by
  rw [restrictNormalHom_residueAbsoluteFrobenius]
  let : Finite E := Module.finite_of_finite k
  exact finiteResidueFrobeniusFromZHat_one k E
 

theorem restrictNormalHom_frobeniusAlgEquivOfAlgebraic
    (E : FiniteGaloisIntermediateField k Omega) :
    AlgEquiv.restrictNormalHom E
        (FiniteField.frobeniusAlgEquivOfAlgebraic k Omega) =
      FiniteField.frobeniusAlgEquivOfAlgebraic k E := by
  apply AlgEquiv.ext
  intro x
  apply (algebraMap E Omega).injective
  calc
    algebraMap E Omega
        ((AlgEquiv.restrictNormalHom E
          (FiniteField.frobeniusAlgEquivOfAlgebraic k Omega)) x) =
        FiniteField.frobeniusAlgEquivOfAlgebraic k Omega
          (algebraMap E Omega x) :=
      AlgEquiv.restrictNormal_commutes
        (FiniteField.frobeniusAlgEquivOfAlgebraic k Omega) E x
    _ = algebraMap E Omega
        (FiniteField.frobeniusAlgEquivOfAlgebraic k E x) := by
      simp only [FiniteField.coe_frobeniusAlgEquivOfAlgebraic]
      exact (map_pow (algebraMap E Omega) x (Fintype.card k)).symm
 

@[simp]
theorem residueAbsoluteFrobenius_one :
    residueAbsoluteFrobenius k Omega
        (Multiplicative.ofAdd (1 : ZHat)) =
      FiniteField.frobeniusAlgEquivOfAlgebraic k Omega := by
  apply (InfiniteGalois.continuousMulEquivToLimit k Omega).injective
  apply Subtype.ext
  funext E
  change AlgEquiv.restrictNormalHom E.unop
      (residueAbsoluteFrobenius k Omega
        (Multiplicative.ofAdd (1 : ZHat))) =
    AlgEquiv.restrictNormalHom E.unop
      (FiniteField.frobeniusAlgEquivOfAlgebraic k Omega)
  rw [restrictNormalHom_residueAbsoluteFrobenius_one,
    restrictNormalHom_frobeniusAlgEquivOfAlgebraic]
end
end LocalClassFieldTheory
end

/- ValuedFieldTheory.Ramification.GaloisValuation.AbsoluteGalois.FiniteLevelValuationRestriction -/
section
namespace RamificationTheory
open ValuationTheory
open ValuationTheory.DiscreteValuationField.HenselianDVF
noncomputable section
universe u v w z
namespace ValuationSubring
variable {K : Type u} [Field K] (A : ValuationSubring K)
section RestrictIntermediateField
variable {K : Type u} {Ω : Type v} [Field K] [Field Ω] [Algebra K Ω]
 
def restrictIntermediateField
    (A : ValuationSubring Ω) (E : IntermediateField K Ω) :
    ValuationSubring E :=
  A.comap (algebraMap E Ω)
 
@[simp] theorem restrictIntermediateField_eq_comap
    (A : ValuationSubring Ω) (E : IntermediateField K Ω) :
    (restrictIntermediateField A E) = A.comap (algebraMap E Ω) :=
  rfl
 
@[simp] theorem mem_restrictIntermediateField_iff
    (A : ValuationSubring Ω) (E : IntermediateField K Ω) (x : E) :
    x ∈ (restrictIntermediateField A E) ↔ (x : Ω) ∈ A :=
  Iff.rfl
 
theorem restrictIntermediateField_hasExtension
    {Γ : Type w} [LinearOrderedCommGroupWithZero Γ]
    (v : Valuation K Γ) (A : ValuationSubring Ω)
    [_root_.Valuation.HasExtension v A.valuation]
    (E : IntermediateField K Ω) :
    _root_.Valuation.HasExtension v ((restrictIntermediateField A E)).valuation := by
  apply _root_.Valuation.HasExtension.ofComapInteger
  ext x
  simp only [Subring.mem_comap, Valuation.mem_integer_iff,
    ValuationSubring.valuation_le_one_iff,
    mem_restrictIntermediateField_iff]
  change algebraMap E Ω (algebraMap K E x) ∈ A ↔ v x ≤ 1
  rw [← IsScalarTower.algebraMap_apply K E Ω x]
  rw [← A.valuation_le_one_iff (algebraMap K Ω x)]
  exact _root_.Valuation.HasExtension.val_map_le_one_iff
    (vR := v) (vA := A.valuation) x
open scoped Pointwise
 

theorem smul_hasExtension
    {Γ : Type w} [LinearOrderedCommGroupWithZero Γ]
    (v : Valuation K Γ) (A : ValuationSubring Ω)
    [_root_.Valuation.HasExtension v A.valuation]
    (σ : Ω ≃ₐ[K] Ω) :
    _root_.Valuation.HasExtension v (σ • A).valuation := by
  apply _root_.Valuation.HasExtension.ofComapInteger
  ext x
  simp [ValuationSubring.integer_valuation, Valuation.mem_integer_iff]
  rw [Subring.mem_pointwise_smul_iff_inv_smul_mem]
  have hcomm : (σ⁻¹) (algebraMap K Ω x) = algebraMap K Ω x :=
    (σ⁻¹).commutes x
  change (σ⁻¹) (algebraMap K Ω x) ∈ A.toSubring ↔ v x ≤ 1
  rw [hcomm]
  change (algebraMap K Ω x) ∈ A ↔ v x ≤ 1
  rw [← A.valuation_le_one_iff (algebraMap K Ω x)]
  exact _root_.Valuation.HasExtension.val_map_le_one_iff
    (vR := v) (vA := A.valuation) x
end RestrictIntermediateField
end ValuationSubring
end
end RamificationTheory
end

/- ClassFieldTheory.LocalClassFieldTheory.Finite.LocalReciprocity.ResidueAlgebraicClosureDegree -/
section
namespace LocalClassFieldTheory
open ClassFormation
noncomputable section
universe u v
open CategoryTheory Opposite
open FiniteGaloisIntermediateField ProfiniteGrp

open Polynomial
variable (k : Type u) [Field k] [Fintype k]
variable (Omega : Type v) [Field Omega] [Algebra k Omega]
  [Algebra.IsAlgebraic k Omega] [IsAlgClosed Omega]
private instance finiteResidueBaseRingCharPrime : Fact (ringChar k).Prime :=
  ⟨CharP.char_is_prime k (ringChar k)⟩
private instance residueAlgebraicClosureIsAlgClosure : IsAlgClosure k Omega :=
  ⟨inferInstance, inferInstance⟩
private instance residueAlgebraicClosureIsGalois : IsGalois k Omega := by
  infer_instance
private instance residueAlgebraicClosureGaloisT2 :
    T2Space (Omega ≃ₐ[k] Omega) := by
  infer_instance
 


noncomputable def finiteResidueExtensionEmbeddingInto
    (n : ℕ) [NeZero n] :
    FiniteField.Extension k (ringChar k) n →ₐ[k] Omega := by
  letI : Module.IsTorsionFree k Omega :=
    Module.isTorsionFree_iff_algebraMap_injective.mpr
      (algebraMap k Omega).injective
  exact IsAlgClosed.lift (R := k)
    (S := FiniteField.Extension k (ringChar k) n) (M := Omega)
 

noncomputable def finiteResidueIntermediateFieldIn
    (n : ℕ) [NeZero n] : IntermediateField k Omega :=
  (⊤ : IntermediateField k
      (FiniteField.Extension k (ringChar k) n)).map
    (finiteResidueExtensionEmbeddingInto k Omega n)
 
noncomputable def finiteResidueExtensionEquivIntermediateIn
    (n : ℕ) [NeZero n] :
    FiniteField.Extension k (ringChar k) n ≃ₐ[k]
      finiteResidueIntermediateFieldIn k Omega n :=
  IntermediateField.topEquiv.symm.trans
    (IntermediateField.equivMap ⊤
      (finiteResidueExtensionEmbeddingInto k Omega n))
 

noncomputable def finiteResidueGaloisIntermediateFieldIn
    (n : ℕ) [NeZero n] : FiniteGaloisIntermediateField k Omega where
  toIntermediateField := finiteResidueIntermediateFieldIn k Omega n
  finiteDimensional := Module.Finite.equiv
    (finiteResidueExtensionEquivIntermediateIn k Omega n).toLinearEquiv
  isGalois := IsGalois.of_algEquiv
    (finiteResidueExtensionEquivIntermediateIn k Omega n)
omit [Algebra.IsAlgebraic k Omega] in
 
@[simp]
theorem finrank_finiteResidueGaloisIntermediateFieldIn
    (n : ℕ) [NeZero n] :
    Module.finrank k
        (finiteResidueGaloisIntermediateFieldIn k Omega n) = n := by
  calc
    Module.finrank k
        (finiteResidueGaloisIntermediateFieldIn k Omega n) =
        Module.finrank k
          (FiniteField.Extension k (ringChar k) n) :=
      (finiteResidueExtensionEquivIntermediateIn k Omega n).toLinearEquiv.finrank_eq.symm
    _ = n := FiniteField.finrank_extension k (ringChar k) n
 


theorem residueAbsoluteFrobenius_isAlgClosure_injective :
    Function.Injective (residueAbsoluteFrobenius k Omega) := by
  intro z w hzw
  apply Multiplicative.ext
  apply ZHat.ext
  intro n hn
  let : NeZero n := ⟨Nat.ne_of_gt hn⟩
  let E := finiteResidueGaloisIntermediateFieldIn k Omega n
  have hrestriction := congrArg (AlgEquiv.restrictNormalHom E) hzw
  rw [restrictNormalHom_residueAbsoluteFrobenius (z := z) (E := E),
    restrictNormalHom_residueAbsoluteFrobenius (z := w) (E := E)] at hrestriction
  let : Finite E := Module.finite_of_finite k
  change finiteResidueFrobeniusFromZHat k E z =
    finiteResidueFrobeniusFromZHat k E w at hrestriction
  rw [finiteResidueFrobeniusFromZHat_apply,
    finiteResidueFrobeniusFromZHat_apply] at hrestriction
  have hcoordinate := congrArg Multiplicative.toAdd
    (finiteResidueFrobeniusExponentHom_injective k E hrestriction)
  have hdegree : Module.finrank k E = n := by
    exact finrank_finiteResidueGaloisIntermediateFieldIn
      k Omega n
  simp only [toAdd_ofAdd] at hcoordinate
  change zHatReduction (Module.finrank k E) Module.finrank_pos z.toAdd =
    zHatReduction (Module.finrank k E) Module.finrank_pos w.toAdd at hcoordinate
  have hdiv : n ∣ Module.finrank k E := by simp [hdegree]
  have hcast := congrArg (ZMod.castHom hdiv (ZMod n)) hcoordinate
  rw [zHatReduction_transition hn Module.finrank_pos hdiv z.toAdd,
    zHatReduction_transition hn Module.finrank_pos hdiv w.toAdd] at hcast
  exact hcast
omit [IsAlgClosed Omega] in
 

theorem mem_range_algebraMap_iff_frobenius_fixed_in
    (x : Omega) :
    x ∈ Set.range (algebraMap k Omega) ↔
      FiniteField.frobeniusAlgEquivOfAlgebraic k Omega x = x := by
  constructor
  · rintro ⟨a, rfl⟩
    simp only [FiniteField.coe_frobeniusAlgEquivOfAlgebraic]
    rw [← map_pow, FiniteField.pow_card]
  · intro hx
    have hxpow : x ^ Fintype.card k = x := by
      simpa only [FiniteField.coe_frobeniusAlgEquivOfAlgebraic] using hx
    let p : k[X] := X ^ Fintype.card k - X
    have hpne : p ≠ 0 :=
      FiniteField.X_pow_card_sub_X_ne_zero k Fintype.one_lt_card
    have hxroot : x ∈ p.rootSet Omega := by
      rw [Polynomial.mem_rootSet_of_ne hpne]
      simp [p, hxpow]
    have hsplits : (p.map (algebraMap k k)).Splits := by
      simpa only [p] using (FiniteField.isSplittingField_sub k k).splits
    have himage := hsplits.image_rootSet (Algebra.ofId k Omega)
    rw [← himage] at hxroot
    rcases hxroot with ⟨a, _ha, hax⟩
    exact ⟨a, hax⟩
 
noncomputable def residueAbsoluteFrobeniusRangeIn :
    ClosedSubgroup (Omega ≃ₐ[k] Omega) where
  toSubgroup := (residueAbsoluteFrobenius k Omega).toMonoidHom.range
  isClosed' := by
    change IsClosed (Set.range (residueAbsoluteFrobenius k Omega))
    exact (isCompact_range
      (residueAbsoluteFrobenius k Omega).continuous_toFun).isClosed
 
theorem fixedField_residueAbsoluteFrobeniusRangeIn :
    IntermediateField.fixedField
        (residueAbsoluteFrobeniusRangeIn k Omega).toSubgroup = ⊥ := by
  apply le_antisymm
  · intro x hx
    have hfrobenius_mem :
        FiniteField.frobeniusAlgEquivOfAlgebraic k Omega ∈
          residueAbsoluteFrobeniusRangeIn k Omega := by
      change FiniteField.frobeniusAlgEquivOfAlgebraic k Omega ∈
        (residueAbsoluteFrobenius k Omega).toMonoidHom.range
      exact ⟨Multiplicative.ofAdd (1 : ZHat),
        residueAbsoluteFrobenius_one k Omega⟩
    rw [IntermediateField.mem_fixedField_iff] at hx
    have hxFrobenius := hx
      (FiniteField.frobeniusAlgEquivOfAlgebraic k Omega)
      hfrobenius_mem
    rw [IntermediateField.mem_bot]
    exact (mem_range_algebraMap_iff_frobenius_fixed_in k Omega x).mpr
      hxFrobenius
  · exact bot_le
 
theorem residueAbsoluteFrobeniusRangeIn_eq_top :
    (residueAbsoluteFrobeniusRangeIn k Omega).toSubgroup = ⊤ := by
  have hfixed := InfiniteGalois.fixingSubgroup_fixedField
    (residueAbsoluteFrobeniusRangeIn k Omega)
  rw [fixedField_residueAbsoluteFrobeniusRangeIn,
    IntermediateField.fixingSubgroup_bot] at hfixed
  exact hfixed.symm
 
theorem residueAbsoluteFrobenius_isAlgClosure_surjective :
    Function.Surjective (residueAbsoluteFrobenius k Omega) := by
  intro sigma
  have hsigma : sigma ∈
      (residueAbsoluteFrobeniusRangeIn k Omega).toSubgroup := by
    rw [residueAbsoluteFrobeniusRangeIn_eq_top]
    exact Subgroup.mem_top sigma
  exact hsigma
 

noncomputable def residueAbsoluteFrobeniusEquivIn :
    ZHatMul ≃ₜ* (Omega ≃ₐ[k] Omega) where
  toMulEquiv := MulEquiv.ofBijective
    (residueAbsoluteFrobenius k Omega).toMonoidHom
    ⟨residueAbsoluteFrobenius_isAlgClosure_injective k Omega,
      residueAbsoluteFrobenius_isAlgClosure_surjective k Omega⟩
  continuous_toFun := (residueAbsoluteFrobenius k Omega).continuous_toFun
  continuous_invFun :=
    Continuous.continuous_symm_of_equiv_compact_to_t2
      (f := (MulEquiv.ofBijective
        (residueAbsoluteFrobenius k Omega).toMonoidHom
        ⟨residueAbsoluteFrobenius_isAlgClosure_injective k Omega,
          residueAbsoluteFrobenius_isAlgClosure_surjective k Omega⟩).toEquiv)
      (residueAbsoluteFrobenius k Omega).continuous_toFun
 

noncomputable def residueAbsoluteDegreeIn :
    (Omega ≃ₐ[k] Omega) →ₜ* ZHatMul :=
  ContinuousMonoidHom.toContinuousMonoidHom
    (residueAbsoluteFrobeniusEquivIn k Omega).symm
 
theorem finiteResidueFrobeniusExponentEquiv_symm_restrict_in
    (sigma : Omega ≃ₐ[k] Omega)
    (E : FiniteGaloisIntermediateField k Omega) :
    letI : Finite E := Module.finite_of_finite k
    (finiteResidueFrobeniusExponentEquiv k E).symm
        (AlgEquiv.restrictNormalHom E sigma) =
      Multiplicative.ofAdd
        (zHatReduction (Module.finrank k E) Module.finrank_pos
          (residueAbsoluteDegreeIn k Omega sigma).toAdd) := by
  let : Finite E := Module.finite_of_finite k
  apply (finiteResidueFrobeniusExponentEquiv k E).injective
  rw [(finiteResidueFrobeniusExponentEquiv k E).apply_symm_apply]
  change AlgEquiv.restrictNormalHom E sigma =
    finiteResidueFrobeniusIntermediate k Omega E
      (residueAbsoluteDegreeIn k Omega sigma)
  rw [← restrictNormalHom_residueAbsoluteFrobenius]
  congr 1
  exact ((residueAbsoluteFrobeniusEquivIn k Omega).apply_symm_apply sigma).symm
end
end LocalClassFieldTheory
end

/- ClassFieldTheory.LocalClassFieldTheory.Finite.LocalReciprocity.ResidueAlgebraicallyClosed -/
section
namespace LocalClassFieldTheory
noncomputable section
universe u
variable {Omega : Type u} [Field Omega] [IsAlgClosed Omega]
 



theorem valuationSubring_residueField_isAlgClosed
    (A : ValuationSubring Omega) :
    IsAlgClosed (IsLocalRing.ResidueField A) := by
  apply IsAlgClosed.of_exists_root
  intro p hpmonic hpirreducible
  have hlifts : p ∈ Polynomial.lifts (IsLocalRing.residue A) := by
    rw [Polynomial.mem_lifts]
    exact (Polynomial.map_surjective
      (IsLocalRing.residue A) IsLocalRing.residue_surjective) p
  obtain ⟨q, hqmap, hqdegree, hqmonic⟩ :=
    Polynomial.lifts_and_degree_eq_and_monic hlifts hpmonic
  have hqmapSubtypeDegree :
      (q.map A.subtype).degree ≠ 0 := by
    rw [Polynomial.degree_map_eq_of_injective A.subtype_injective q]
    rw [hqdegree]
    exact ne_of_gt (Polynomial.degree_pos_of_irreducible hpirreducible)
  obtain ⟨x, hxroot⟩ :=
    IsAlgClosed.exists_root (q.map A.subtype) hqmapSubtypeDegree
  have hxIntegral : IsIntegral A x := by
    refine ⟨q, hqmonic, ?_⟩
    change Polynomial.eval₂ A.subtype x q = 0
    simpa [Polynomial.eval_map] using hxroot
  have hxA : x ∈ A := by
    let hAIntegers : A.valuation.Integers A :=
      { hom_inj := A.subtype_injective
        map_le_one := fun a =>
          (A.valuation_le_one_iff (a : Omega)).mpr a.property
        exists_of_le_one := fun {r} hr =>
          ⟨⟨r, (A.valuation_le_one_iff r).mp hr⟩, rfl⟩ }
    have hxValuation : A.valuation x ≤ 1 :=
      (hAIntegers.isIntegral_iff_v_le_one).mp hxIntegral
    exact (A.valuation_le_one_iff x).mp hxValuation
  let xA : A := ⟨x, hxA⟩
  have hxrootEval₂ : Polynomial.eval₂ A.subtype x q = 0 := by
    rw [← Polynomial.eval_map]
    exact hxroot
  have hxrootA : q.eval xA = 0 := by
    apply A.subtype_injective
    rw [← Polynomial.eval₂_at_apply A.subtype xA]
    simpa [xA] using hxrootEval₂
  refine ⟨IsLocalRing.residue A xA, ?_⟩
  rw [← hqmap]
  simp [Polynomial.eval_map, hxrootA]
section PurelyInseparableComap
variable {F Omega : Type u} [Field F] [Field Omega] [Algebra F Omega]
 

def valuationSubringComapMap (A : ValuationSubring Omega) :
    A.comap (algebraMap F Omega) →+* A where
  toFun x := ⟨algebraMap F Omega x, x.property⟩
  map_one' := by ext; simp
  map_mul' x y := by ext; simp
  map_zero' := by ext; simp
  map_add' x y := by ext; simp
 
theorem valuationSubringComapMap_isLocalHom (A : ValuationSubring Omega) :
    IsLocalHom (valuationSubringComapMap (F := F) A) := by
  constructor
  intro x hx
  obtain ⟨u, hu⟩ := hx
  have hx0 : (x : F) ≠ 0 := by
    intro hzero
    have hmapZero : valuationSubringComapMap (F := F) A x = 0 := by
      apply Subtype.ext
      simp [valuationSubringComapMap, hzero]
    exact Units.ne_zero u (hu.trans hmapZero)
  let xinv : A.comap (algebraMap F Omega) :=
    ⟨(x : F)⁻¹, by
      change algebraMap F Omega ((x : F)⁻¹) ∈ A
      rw [map_inv₀]
      have hu' : algebraMap F Omega (x : F) = ((u : A) : Omega) := by
        have h := congrArg Subtype.val hu
        exact h.symm
      rw [hu']
      have hinv : (((u : A) : Omega))⁻¹ = (((u⁻¹ : Aˣ) : A) : Omega) := by
        have hprod :
            ((u : A) : Omega) * (((u⁻¹ : Aˣ) : A) : Omega) = 1 := by
          have hprodA : (u : A) * ((u⁻¹ : Aˣ) : A) = 1 := u.val_inv
          exact congrArg A.subtype hprodA
        exact (eq_inv_of_mul_eq_one_right hprod).symm
      rw [hinv]
      exact (u⁻¹ : Aˣ).val.property⟩
  let xu : (A.comap (algebraMap F Omega))ˣ :=
    { val := x
      inv := xinv
      val_inv := by apply Subtype.ext; simp [xinv, hx0]
      inv_val := by apply Subtype.ext; simp [xinv, hx0] }
  exact ⟨xu, rfl⟩
 
noncomputable def valuationSubringComapResidueMap
    (A : ValuationSubring Omega) :
    IsLocalRing.ResidueField (A.comap (algebraMap F Omega)) →+*
      IsLocalRing.ResidueField A := by
  letI : IsLocalHom (valuationSubringComapMap (F := F) A) :=
    valuationSubringComapMap_isLocalHom (F := F) A
  exact IsLocalRing.ResidueField.map (valuationSubringComapMap (F := F) A)
 
@[simp] theorem valuationSubringComapResidueMap_residue
    (A : ValuationSubring Omega)
    (x : A.comap (algebraMap F Omega)) :
    valuationSubringComapResidueMap (F := F) A
        (IsLocalRing.residue (A.comap (algebraMap F Omega)) x) =
      IsLocalRing.residue A (valuationSubringComapMap (F := F) A x) :=
  rfl
 



theorem valuationSubring_comap_residueField_isPurelyInseparable
    [IsPurelyInseparable F Omega] (A : ValuationSubring Omega) :
    letI : Algebra
        (IsLocalRing.ResidueField (A.comap (algebraMap F Omega)))
        (IsLocalRing.ResidueField A) :=
      (valuationSubringComapResidueMap (F := F) A).toAlgebra
    IsPurelyInseparable
      (IsLocalRing.ResidueField (A.comap (algebraMap F Omega)))
      (IsLocalRing.ResidueField A) := by
  let B := A.comap (algebraMap F Omega)
  let barI := valuationSubringComapResidueMap (F := F) A
  let : Algebra (IsLocalRing.ResidueField B)
      (IsLocalRing.ResidueField A) := barI.toAlgebra
  obtain ⟨q, hqF⟩ := ExpChar.exists F
  let : ExpChar F q := hqF
  cases hqF with
  | zero =>
      let : Algebra.IsSeparable F Omega := inferInstance
      rw [isPurelyInseparable_iff_pow_mem
        (IsLocalRing.ResidueField B)
        (ringExpChar (IsLocalRing.ResidueField B))]
      intro y
      obtain ⟨a, rfl⟩ := IsLocalRing.residue_surjective y
      obtain ⟨z, hz⟩ :=
        IsPurelyInseparable.surjective_algebraMap_of_isSeparable F Omega
          (a : Omega)
      let zB : B := ⟨z, by
        change algebraMap F Omega z ∈ A
        rw [hz]
        exact a.property⟩
      refine ⟨0, IsLocalRing.residue B zB, ?_⟩
      simp only [pow_zero, pow_one]
      change barI (IsLocalRing.residue B zB) = IsLocalRing.residue A a
      dsimp only [barI, B]
      rw [valuationSubringComapResidueMap_residue]
      apply congrArg (IsLocalRing.residue A)
      apply Subtype.ext
      exact hz
  | prime hq =>
      let : CharP Omega q :=
        charP_of_injective_algebraMap (algebraMap F Omega).injective q
      let : CharP A q := A.subtype.charP A.subtype_injective q
      let : CharP (IsLocalRing.ResidueField A) q :=
        CharP.of_ringHom_of_ne_zero (IsLocalRing.residue A) q hq.ne_zero
      let : CharP (IsLocalRing.ResidueField B) q :=
        barI.charP barI.injective q
      let : ExpChar (IsLocalRing.ResidueField B) q := ExpChar.prime hq
      rw [isPurelyInseparable_iff_pow_mem
        (IsLocalRing.ResidueField B) q]
      intro y
      obtain ⟨a, rfl⟩ := IsLocalRing.residue_surjective y
      obtain ⟨n, z, hz⟩ := IsPurelyInseparable.pow_mem F q (a : Omega)
      let zB : B := ⟨z, by
        change algebraMap F Omega z ∈ A
        rw [hz]
        exact pow_mem a.property _⟩
      refine ⟨n, IsLocalRing.residue B zB, ?_⟩
      change barI (IsLocalRing.residue B zB) =
        (IsLocalRing.residue A a) ^ q ^ n
      dsimp only [barI, B]
      rw [valuationSubringComapResidueMap_residue]
      rw [← map_pow]
      apply congrArg (IsLocalRing.residue A)
      apply Subtype.ext
      exact hz
end PurelyInseparableComap
end
end LocalClassFieldTheory
end

/- ClassFieldTheory.LocalClassFieldTheory.Finite.LocalReciprocity.ResidueDatum -/
section
namespace LocalClassFieldTheory
open RamificationTheory
open ClassFormation
noncomputable section
variable (k Omega : Type)
  [Field k] [Fintype k] [Field Omega] [Algebra k Omega]
  [Algebra.IsAlgebraic k Omega] [IsAlgClosed Omega]
 

noncomputable def residueDatumIn : DegreeData (Omega ≃ₐ[k] Omega) where
  degree := residueAbsoluteDegreeIn k Omega
  degree_surjective := (residueAbsoluteFrobeniusEquivIn k Omega).symm.surjective
omit [Fintype k] [Algebra.IsAlgebraic k Omega] [IsAlgClosed Omega] in
private theorem mem_fixingSubgroup_iff_restrictNormalHom_eq_one
    (E : FiniteGaloisIntermediateField k Omega)
    (sigma : Omega ≃ₐ[k] Omega) :
    sigma ∈ E.toIntermediateField.fixingSubgroup ↔
      AlgEquiv.restrictNormalHom E sigma = 1 := by
  constructor
  · intro hsigma
    rw [IntermediateField.mem_fixingSubgroup_iff] at hsigma
    apply AlgEquiv.ext
    intro x
    apply Subtype.ext
    change ((AlgEquiv.restrictNormalHom E sigma x : E) : Omega) = (x : Omega)
    rw [AlgEquiv.restrictNormalHom_apply]
    exact hsigma x x.property
  · intro hsigma
    rw [IntermediateField.mem_fixingSubgroup_iff]
    intro x hx
    let y : E := ⟨x, hx⟩
    have hy := congrArg (fun tau : E ≃ₐ[k] E => tau y) hsigma
    have hyval := congrArg Subtype.val hy
    rw [AlgEquiv.restrictNormalHom_apply] at hyval
    simpa [y] using hyval
 

theorem residueDatumIn_fieldImage_closedFixingSubgroup
    (E : FiniteGaloisIntermediateField k Omega) :
    (residueDatumIn k Omega).fieldImage
        (closedFixingSubgroup k Omega E) =
      (zHatMulNat (Module.finrank k E)).toAddMonoidHom.range.toSubgroup := by
  ext z
  let : Finite E := Module.finite_of_finite k
  constructor
  · rintro ⟨sigma, rfl⟩
    change (residueAbsoluteDegreeIn k Omega sigma.1).toAdd ∈
      (zHatMulNat (Module.finrank k E)).toAddMonoidHom.range
    rw [zHatMulNat_range_eq_ker_reduction
      (Module.finrank k E) Module.finrank_pos]
    change zHatReduction (Module.finrank k E) Module.finrank_pos
      (residueAbsoluteDegreeIn k Omega sigma.1).toAdd = 0
    have hrestrict : AlgEquiv.restrictNormalHom E sigma.1 = 1 :=
      (mem_fixingSubgroup_iff_restrictNormalHom_eq_one
        k Omega E sigma.1).1 sigma.2
    have hcoordinate :=
      finiteResidueFrobeniusExponentEquiv_symm_restrict_in
        k Omega sigma.1 E
    rw [hrestrict, map_one] at hcoordinate
    exact congrArg Multiplicative.toAdd hcoordinate |>.symm
  · intro hz
    change z.toAdd ∈
      (zHatMulNat (Module.finrank k E)).toAddMonoidHom.range at hz
    rw [zHatMulNat_range_eq_ker_reduction
      (Module.finrank k E) Module.finrank_pos] at hz
    refine ⟨⟨residueAbsoluteFrobenius k Omega z, ?_⟩, ?_⟩
    · apply (mem_fixingSubgroup_iff_restrictNormalHom_eq_one
        k Omega E (residueAbsoluteFrobenius k Omega z)).2
      rw [restrictNormalHom_residueAbsoluteFrobenius]
      change finiteResidueFrobeniusFromZHat k E z = 1
      rw [finiteResidueFrobeniusFromZHat_apply]
      change finiteResidueFrobeniusExponentHom k E
        (Multiplicative.ofAdd
          (zHatReduction (Module.finrank k E) Module.finrank_pos z.toAdd)) = 1
      rw [show zHatReduction (Module.finrank k E) Module.finrank_pos z.toAdd = 0
        from hz]
      simp
    · exact (residueAbsoluteFrobeniusEquivIn k Omega).symm_apply_apply z
 


theorem Internal.residueDatumIn_fieldImage_index_closedFixingSubgroup
    (E : FiniteGaloisIntermediateField k Omega) :
    ((residueDatumIn k Omega).fieldImage
        (closedFixingSubgroup k Omega E)).index = Module.finrank k E := by
  rw [residueDatumIn_fieldImage_closedFixingSubgroup k Omega E,
    AddSubgroup.index_toSubgroup]
  exact zHatMulNat_range_index (Module.finrank k E) Module.finrank_pos
end
end LocalClassFieldTheory
end

/- ValuedFieldTheory.Ramification.ClosedSubgroups -/
section
namespace RamificationTheory
noncomputable section
universe u v
namespace HilbertRamification
namespace ValuationSubring
open scoped Pointwise Topology
variable (K : Type u) {L : Type v} [Field K] [Field L] [Algebra K L]
variable [Algebra.IsAlgebraic K L]
omit [Algebra.IsAlgebraic K L] in
private theorem mem_decompositionGroup_iff_apply_mem
    (A : _root_.ValuationSubring L) (sigma : L ≃ₐ[K] L) :
    sigma ∈ decompositionGroup K A ↔
      ∀ x : L, sigma x ∈ A ↔ x ∈ A := by
  change sigma • A = A ↔ _
  constructor
  · intro hsigma x
    have hmem := congrArg (fun B : _root_.ValuationSubring L => sigma x ∈ B) hsigma
    change (sigma x ∈ sigma • A) = (sigma x ∈ A) at hmem
    rw [_root_.ValuationSubring.mem_pointwise_smul_iff_inv_smul_mem] at hmem
    change (sigma⁻¹ (sigma x) ∈ A) = (sigma x ∈ A) at hmem
    have hinv : sigma⁻¹ (sigma x) = x := by simp
    rw [hinv] at hmem
    exact hmem.symm.to_iff
  · intro hsigma
    ext x
    rw [_root_.ValuationSubring.mem_pointwise_smul_iff_inv_smul_mem]
    simpa using (hsigma (sigma⁻¹ x)).symm
 

theorem decompositionGroup_isClosed
    (A : _root_.ValuationSubring L) :
    IsClosed (decompositionGroup K A : Set (L ≃ₐ[K] L)) where
  isOpen_compl := isOpen_iff_mem_nhds.mpr fun sigma hsigma => by
    rw [Set.mem_compl_iff, SetLike.mem_coe,
      mem_decompositionGroup_iff_apply_mem] at hsigma
    rcases Classical.not_forall.mp hsigma with ⟨x, hx⟩
    let E : IntermediateField K L := IntermediateField.adjoin K {x}
    let : FiniteDimensional K E :=
      IntermediateField.adjoin.finiteDimensional
        (Algebra.IsIntegral.isIntegral x)
    apply mem_nhds_iff.mpr
    refine ⟨sigma • (E.fixingSubgroup : Set (L ≃ₐ[K] L)), ?_, ?_, ?_⟩
    · intro tau htau
      rcases Set.mem_smul_set.mp htau with ⟨g, hg, rfl⟩
      rw [Set.mem_compl_iff, SetLike.mem_coe,
        mem_decompositionGroup_iff_apply_mem]
      intro hmem
      apply hx
      have hgx : g x = x :=
        (IntermediateField.mem_fixingSubgroup_iff E g).mp hg x
          (IntermediateField.subset_adjoin (F := K) (S := {x}) (by simp))
      simpa [AlgEquiv.mul_apply, hgx] using hmem x
    · exact E.fixingSubgroup_isOpen.smul sigma
    · exact ⟨1, E.fixingSubgroup.one_mem, by simp⟩
end ValuationSubring
end HilbertRamification
end
end RamificationTheory
end

/- ValuedFieldTheory.Ramification.ProfiniteInvariant -/
section
namespace RamificationTheory
noncomputable local instance valueIdealQuotientField {R : Type*} [CommRing R] (I : Ideal R) [I.IsMaximal] :
    Field (R ⧸ I) := Ideal.Quotient.field I
noncomputable section
open scoped Pointwise
variable {A B : Type*} [CommRing A] [CommRing B] [Algebra A B]
variable {G : Type*} [Group G] [MulSemiringAction G B] [SMulCommClass G A B]
variable [TopologicalSpace G] [CompactSpace G] [TotallyDisconnectedSpace G]
variable [IsTopologicalGroup G] [TopologicalSpace B] [DiscreteTopology B]
variable [ContinuousSMul G B] [Algebra.IsInvariant A B G]
namespace Ideal.Quotient
include G
 




theorem normal_of_profinite
    (P : Ideal A) (Q : Ideal B) [P.IsMaximal] [Q.IsMaximal] [Q.LiesOver P] :
    Normal (A ⧸ P) (B ⧸ Q) := by
  cases subsingleton_or_nontrivial B
  · cases ‹Q.IsMaximal›.ne_top (Subsingleton.elim _ _)
  have hIntegral : Algebra.IsIntegral A B :=
    Algebra.IsInvariant.isIntegral_of_profinite (G := G)
  constructor
  intro x
  obtain ⟨x, rfl⟩ := Ideal.Quotient.mk_surjective x
  obtain ⟨N, hN⟩ :=
    ProfiniteGrp.exist_openNormalSubgroup_sub_open_nhds_of_one
      (stabilizer_isOpen G x) (MulAction.mem_stabilizer_iff.mpr (one_smul G x))
  let B' := FixedPoints.subalgebra A B N.1.1
  let x' : B' := ⟨x, fun g ↦ hN g.2⟩
  let j : B' →ₐ[A] B := B'.val
  have hjx : j x' = x := rfl
  let : Algebra.IsInvariant A B' (G ⧸ N.1.1) := inferInstance
  cases nonempty_fintype (G ⧸ N.1.1)
  obtain ⟨p, hp, _hdegree, hpmonic⟩ :=
    Polynomial.lifts_and_degree_eq_and_monic
      (Algebra.IsInvariant.charpoly_mem_lifts A B' (G ⧸ N.1.1) x')
      (MulSemiringAction.monic_charpoly (G ⧸ N.1.1) x')
  let qB : B →+* B ⧸ Q := Ideal.Quotient.mk Q
  let qB' : B' →+* B ⧸ Q := qB.comp j.toRingHom
  have hroot : Polynomial.aeval (Ideal.Quotient.mk Q x)
      (p.map (algebraMap A (A ⧸ P))) = 0 := by
    rw [Polynomial.aeval_def, ← Polynomial.eval_map]
    have hmap :
        (p.map (algebraMap A B')).map qB' =
          p.map ((algebraMap (A ⧸ P) (B ⧸ Q)).comp
            (Ideal.Quotient.mk P)) := by
      rw [Polynomial.map_map]
      apply congrArg (fun f : A →+* B ⧸ Q ↦ p.map f)
      ext a
      rfl
    calc
      Polynomial.eval (Ideal.Quotient.mk Q x)
          ((p.map (algebraMap A (A ⧸ P))).map
            (algebraMap (A ⧸ P) (B ⧸ Q))) =
          Polynomial.eval (Ideal.Quotient.mk Q x)
            ((p.map (algebraMap A B')).map qB') := by
        rw [hmap, Polynomial.map_map, Ideal.Quotient.algebraMap_eq]
      _ = 0 := by
        rw [hp, show Ideal.Quotient.mk Q x = qB' x' from rfl,
          Polynomial.eval_map_apply, MulSemiringAction.eval_charpoly, map_zero]
  have hdiv := minpoly.dvd (A ⧸ P) (Ideal.Quotient.mk Q x)
    (p := p.map (algebraMap A (A ⧸ P))) hroot
  refine Polynomial.Splits.of_dvd ?_ ?_ ((Polynomial.map_dvd_map' _).mpr hdiv)
  · rw [Polynomial.map_map, ← IsScalarTower.algebraMap_eq,
      IsScalarTower.algebraMap_eq A B', ← Polynomial.map_map, hp,
      MulSemiringAction.charpoly_eq, Polynomial.map_prod]
    exact Polynomial.Splits.prod
      (fun _ _ ↦ (Polynomial.Splits.X_sub_C _).map _)
  · exact ((hpmonic.map _).map _).ne_zero
end Ideal.Quotient
end
end RamificationTheory
end

/- ValuedFieldTheory.Ramification.HilbertRamification.ResidueExactSequence -/
section
namespace RamificationTheory
noncomputable section
universe u v
namespace HilbertRamification
namespace ValuationSubring
open scoped Pointwise Topology
variable (K : Type u) {L : Type v} [Field K] [Field L] [Algebra K L]
variable [IsGalois K L]
 

abbrev decompositionFixedSubring (A : _root_.ValuationSubring L) : Subring A :=
  FixedPoints.subring A (decompositionGroup K A)
 
abbrev decompositionFixedMaximalIdeal (A : _root_.ValuationSubring L) :
    Ideal (decompositionFixedSubring K A) :=
  (IsLocalRing.maximalIdeal A).comap (decompositionFixedSubring K A).subtype
 
abbrev decompositionResidueField (A : _root_.ValuationSubring L) :=
  decompositionFixedSubring K A ⧸ decompositionFixedMaximalIdeal K A
 
abbrev selectedResidueField (A : _root_.ValuationSubring L) :=
  IsLocalRing.ResidueField A
 
abbrev decompositionFieldValuationSubring
    (A : _root_.ValuationSubring L) :
    _root_.ValuationSubring (decompositionField K A) :=
  A.comap (decompositionField K A).val
 

def decompositionFieldValuationSubringEquivFixedSubring
    (A : _root_.ValuationSubring L) :
    decompositionFieldValuationSubring K A ≃+*
      decompositionFixedSubring K A where
  toFun z :=
    ⟨⟨((z : decompositionField K A) : L), z.property⟩, by
      intro sigma
      apply Subtype.ext
      change ((sigma : decompositionGroup K A) : L ≃ₐ[K] L)
          ((z : decompositionField K A) : L) =
        ((z : decompositionField K A) : L)
      exact (IntermediateField.mem_fixedField_iff
        (H := decompositionGroup K A) ((z : decompositionField K A) : L)).mp
          (z : decompositionField K A).property
          (sigma : L ≃ₐ[K] L) sigma.property⟩
  invFun r := by
    let z : decompositionField K A :=
      ⟨((r : A) : L), by
        rw [IntermediateField.mem_fixedField_iff]
        intro sigma hsigma
        have hr := r.property ⟨sigma, hsigma⟩
        exact congrArg Subtype.val hr⟩
    exact ⟨z, r.val.property⟩
  left_inv z := by ext; rfl
  right_inv r := by ext; rfl
  map_add' _ _ := by ext; rfl
  map_mul' _ _ := by ext; rfl
 
instance decompositionFixedSubring.instIsLocalRing
    (A : _root_.ValuationSubring L) :
    IsLocalRing (decompositionFixedSubring K A) :=
  (decompositionFieldValuationSubringEquivFixedSubring (K := K) A).isLocalRing
private theorem decompositionGroup_action_locallyConstant
    (A : _root_.ValuationSubring L) (a : A) :
    IsLocallyConstant (fun g : decompositionGroup K A ↦ g • a) := by
  rw [IsLocallyConstant.iff_exists_open]
  intro sigma
  let E : IntermediateField K L := IntermediateField.adjoin K {(a : L)}
  let : FiniteDimensional K E :=
    IntermediateField.adjoin.finiteDimensional
      (Algebra.IsIntegral.isIntegral (a : L))
  let U : Set (decompositionGroup K A) :=
    ((↑) : decompositionGroup K A → (L ≃ₐ[K] L)) ⁻¹'
      (((sigma : L ≃ₐ[K] L)) • (E.fixingSubgroup : Set (L ≃ₐ[K] L)))
  refine ⟨U, E.fixingSubgroup_isOpen.smul
      (sigma : L ≃ₐ[K] L) |>.preimage continuous_subtype_val, ?_, ?_⟩
  · exact ⟨1, E.fixingSubgroup.one_mem, by simp⟩
  · intro tau htau
    rcases htau with ⟨g, hg, heq⟩
    have hga : g (a : L) = (a : L) :=
      (IntermediateField.mem_fixingSubgroup_iff E g).mp hg (a : L)
        (IntermediateField.subset_adjoin (F := K) (S := {(a : L)}) (by simp))
    apply Subtype.ext
    change (((tau : decompositionGroup K A) : L ≃ₐ[K] L) (a : L)) =
      (((sigma : decompositionGroup K A) : L ≃ₐ[K] L) (a : L))
    rw [← heq]
    simp [AlgEquiv.mul_apply, hga]
private theorem decompositionGroup_continuousSMul
    (A : _root_.ValuationSubring L) :
    letI : TopologicalSpace A := ⊥
    ContinuousSMul (decompositionGroup K A) A := by
  let : TopologicalSpace A := ⊥
  let : DiscreteTopology A := ⟨rfl⟩
  constructor
  rw [continuous_prod_of_discrete_right]
  intro a
  exact (decompositionGroup_action_locallyConstant (K := K) A a).continuous
private theorem decompositionGroup_compactSpace
    (A : _root_.ValuationSubring L) :
    CompactSpace (decompositionGroup K A) := by
  have hc : IsCompact (decompositionGroup K A : Set (L ≃ₐ[K] L)) :=
    (decompositionGroup_isClosed K A).isCompact
  exact isCompact_iff_compactSpace.mp hc
omit [IsGalois K L] in
private theorem decompositionFixedSubring_smulCommClass
    (A : _root_.ValuationSubring L) :
    SMulCommClass (decompositionGroup K A)
      (decompositionFixedSubring K A) A := by
  constructor
  intro g r x
  change g • ((r : A) * x) = (r : A) * (g • x)
  rw [smul_mul', r.property g]
omit [IsGalois K L] in
private theorem decompositionFixedSubring_isInvariant
    (A : _root_.ValuationSubring L) :
    Algebra.IsInvariant (decompositionFixedSubring K A) A
      (decompositionGroup K A) := by
  constructor
  intro x hx
  exact ⟨⟨x, hx⟩, rfl⟩
 
instance decompositionFixedSubring.instSMulCommClass
    (A : _root_.ValuationSubring L) :
    SMulCommClass (decompositionGroup K A)
      (decompositionFixedSubring K A) A :=
  decompositionFixedSubring_smulCommClass (K := K) A
private theorem decompositionFixedMaximalIdeal_isMaximal
    (A : _root_.ValuationSubring L) :
    (decompositionFixedMaximalIdeal K A).IsMaximal := by
  let : TopologicalSpace A := ⊥
  let : DiscreteTopology A := ⟨rfl⟩
  let : CompactSpace (decompositionGroup K A) :=
    decompositionGroup_compactSpace (K := K) A
  let : ContinuousSMul (decompositionGroup K A) A :=
    decompositionGroup_continuousSMul (K := K) A
  let : SMulCommClass (decompositionGroup K A)
      (decompositionFixedSubring K A) A :=
    decompositionFixedSubring_smulCommClass (K := K) A
  let : Algebra.IsInvariant (decompositionFixedSubring K A) A
      (decompositionGroup K A) :=
    decompositionFixedSubring_isInvariant (K := K) A
  let : Algebra.IsIntegral (decompositionFixedSubring K A) A :=
    Algebra.IsInvariant.isIntegral_of_profinite
      (G := decompositionGroup K A)
  exact Ideal.isMaximal_comap_of_isIntegral_of_isMaximal
    (IsLocalRing.maximalIdeal A)
 
instance decompositionFixedMaximalIdeal.instIsMaximal
    (A : _root_.ValuationSubring L) :
    (decompositionFixedMaximalIdeal K A).IsMaximal :=
  decompositionFixedMaximalIdeal_isMaximal (K := K) A
 

theorem decompositionFixedMaximalIdeal_eq_maximalIdeal
    (A : _root_.ValuationSubring L) :
    decompositionFixedMaximalIdeal K A =
      IsLocalRing.maximalIdeal (decompositionFixedSubring K A) :=
  IsLocalRing.eq_maximalIdeal
    (decompositionFixedMaximalIdeal.instIsMaximal (K := K) A)
 

def decompositionFieldResidueEquiv
    (A : _root_.ValuationSubring L) :
    IsLocalRing.ResidueField (decompositionFieldValuationSubring K A) ≃+*
      decompositionResidueField K A :=
  (IsLocalRing.ResidueField.mapEquiv
      (decompositionFieldValuationSubringEquivFixedSubring (K := K) A)).trans
    (Ideal.quotientEquivAlgOfEq ℤ
      (decompositionFixedMaximalIdeal_eq_maximalIdeal (K := K) A).symm).toRingEquiv
 
instance selectedMaximalIdeal.instLiesOver
    (A : _root_.ValuationSubring L) :
    (IsLocalRing.maximalIdeal A).LiesOver
      (decompositionFixedMaximalIdeal K A) := by
  constructor
  rfl
 
noncomputable instance decompositionResidueField.instField
    (A : _root_.ValuationSubring L) :
    Field (decompositionResidueField K A) :=
  Ideal.Quotient.field (decompositionFixedMaximalIdeal K A)
 
noncomputable instance selectedResidueField.instAlgebra
    (A : _root_.ValuationSubring L) :
    Algebra (decompositionResidueField K A) (selectedResidueField A) :=
  Ideal.Quotient.algebraQuotientOfLEComap
    (le_of_eq ((IsLocalRing.maximalIdeal A).over_def
      (decompositionFixedMaximalIdeal K A)))
omit [IsGalois K L] in
 

theorem decompositionGroup_maximalIdeal_stabilizer_eq_top
    (A : _root_.ValuationSubring L) :
    MulAction.stabilizer (decompositionGroup K A)
        (IsLocalRing.maximalIdeal A) = ⊤ := by
  apply top_unique
  intro sigma _hsigma
  change sigma • IsLocalRing.maximalIdeal A = IsLocalRing.maximalIdeal A
  apply Ideal.ext
  intro x
  rw [Ideal.mem_pointwise_smul_iff_inv_smul_mem]
  simp only [IsLocalRing.mem_maximalIdeal]
  constructor
  · intro hnonunit hx
    apply hnonunit
    simpa using hx.map (MulSemiringAction.toRingAut
      (decompositionGroup K A) A sigma⁻¹)
  · intro hnonunit hx
    apply hnonunit
    simpa using hx.map (MulSemiringAction.toRingAut
      (decompositionGroup K A) A sigma)
 

def decompositionGroupToMaximalIdealStabilizer
    (A : _root_.ValuationSubring L) :
    decompositionGroup K A →*
      MulAction.stabilizer (decompositionGroup K A)
        (IsLocalRing.maximalIdeal A) where
  toFun sigma := ⟨sigma, by
    rw [decompositionGroup_maximalIdeal_stabilizer_eq_top (K := K) A]
    exact Subgroup.mem_top sigma⟩
  map_one' := rfl
  map_mul' _ _ := rfl
 
def decompositionGroupResidueAction
    (A : _root_.ValuationSubring L) :
    decompositionGroup K A →*
      (selectedResidueField A ≃ₐ[decompositionResidueField K A]
        selectedResidueField A) :=
  (Ideal.Quotient.stabilizerHom
      (IsLocalRing.maximalIdeal A)
      (decompositionFixedMaximalIdeal K A)
      (decompositionGroup K A)).comp
    (decompositionGroupToMaximalIdealStabilizer (K := K) A)
 

theorem decompositionGroupResidueAction_surjective
    (A : _root_.ValuationSubring L) :
    Function.Surjective (decompositionGroupResidueAction (K := K) A) := by
  let : TopologicalSpace A := ⊥
  let : DiscreteTopology A := ⟨rfl⟩
  let : CompactSpace (decompositionGroup K A) :=
    decompositionGroup_compactSpace (K := K) A
  let : ContinuousSMul (decompositionGroup K A) A :=
    decompositionGroup_continuousSMul (K := K) A
  let : SMulCommClass (decompositionGroup K A)
      (decompositionFixedSubring K A) A :=
    decompositionFixedSubring_smulCommClass (K := K) A
  let : Algebra.IsInvariant (decompositionFixedSubring K A) A
      (decompositionGroup K A) :=
    decompositionFixedSubring_isInvariant (K := K) A
  intro sigma
  obtain ⟨tau, htau⟩ :=
    Ideal.Quotient.stabilizerHom_surjective_of_profinite
      (G := decompositionGroup K A)
      (decompositionFixedMaximalIdeal K A)
      (IsLocalRing.maximalIdeal A) sigma
  refine ⟨tau.1, ?_⟩
  have htau_eq :
      decompositionGroupToMaximalIdealStabilizer (K := K) A tau.1 = tau := by
    apply Subtype.ext
    rfl
  change
    Ideal.Quotient.stabilizerHom
        (IsLocalRing.maximalIdeal A)
        (decompositionFixedMaximalIdeal K A)
        (decompositionGroup K A)
        (decompositionGroupToMaximalIdealStabilizer (K := K) A tau.1) =
      sigma
  rw [htau_eq]
  exact htau
 
instance decompositionResidueExtension_normal
    (A : _root_.ValuationSubring L) :
    Normal (decompositionResidueField K A) (selectedResidueField A) := by
  let : TopologicalSpace A := ⊥
  let : DiscreteTopology A := ⟨rfl⟩
  let : CompactSpace (decompositionGroup K A) :=
    decompositionGroup_compactSpace (K := K) A
  let : ContinuousSMul (decompositionGroup K A) A :=
    decompositionGroup_continuousSMul (K := K) A
  let : SMulCommClass (decompositionGroup K A)
      (decompositionFixedSubring K A) A :=
    decompositionFixedSubring_smulCommClass (K := K) A
  let : Algebra.IsInvariant (decompositionFixedSubring K A) A
      (decompositionGroup K A) :=
    decompositionFixedSubring_isInvariant (K := K) A
  exact RamificationTheory.Ideal.Quotient.normal_of_profinite
    (G := decompositionGroup K A)
    (decompositionFixedMaximalIdeal K A)
    (IsLocalRing.maximalIdeal A)
end ValuationSubring
end HilbertRamification
end
end RamificationTheory
end

/- ClassFieldTheory.LocalClassFieldTheory.Finite.LocalReciprocity.ResidueActionIndex -/
section
namespace LocalClassFieldTheory
open RamificationTheory
open ClassFormation
noncomputable section
universe u v
open HilbertRamification.ValuationSubring
variable (K : Type u) {L : Type v} [Field K] [Field L] [Algebra K L]
  [IsGalois K L]
 




noncomputable def toDecompositionGroupOfEqTop
    (A : _root_.ValuationSubring L)
    (hA : decompositionGroup K A = ⊤) :
    (L ≃ₐ[K] L) →* decompositionGroup K A where
  toFun sigma := ⟨sigma, by rw [hA]; exact Subgroup.mem_top sigma⟩
  map_one' := by ext; rfl
  map_mul' _ _ := by ext; rfl
 

noncomputable def residueAlgActionOfEqTop
    (A : _root_.ValuationSubring L)
    (hA : decompositionGroup K A = ⊤) :
    (L ≃ₐ[K] L) →*
      (selectedResidueField A ≃ₐ[decompositionResidueField K A]
        selectedResidueField A) :=
  (decompositionGroupResidueAction (K := K) A).comp
    (toDecompositionGroupOfEqTop K A hA)
 
theorem residueAlgActionOfEqTop_surjective
    (A : _root_.ValuationSubring L)
    (hA : decompositionGroup K A = ⊤) :
    Function.Surjective (residueAlgActionOfEqTop K A hA) := by
  intro tau
  obtain ⟨sigma, hsigma⟩ :=
    decompositionGroupResidueAction_surjective (K := K) A tau
  refine ⟨(sigma : L ≃ₐ[K] L), ?_⟩
  have heq :
      toDecompositionGroupOfEqTop K A hA (sigma : L ≃ₐ[K] L) = sigma := by
    ext
    rfl
  simpa [residueAlgActionOfEqTop, heq] using hsigma
section FiniteImageIndex
variable (k Omega : Type)
  [Field k] [Fintype k] [Field Omega] [Algebra k Omega]
  [Algebra.IsAlgebraic k Omega] [IsAlgClosed Omega]
 


theorem residueDegreeImage_index_eq_finrank_of_map_eq_fixingSubgroup
    {G : Type*} [Group G]
    (rho : G →* (Omega ≃ₐ[k] Omega))
    (H : Subgroup G)
    (E : FiniteGaloisIntermediateField k Omega)
    (himage : H.map rho = E.toIntermediateField.fixingSubgroup) :
    (H.map ((residueAbsoluteDegreeIn k Omega).toMonoidHom.comp rho)).index =
      Module.finrank k E := by
  rw [← Subgroup.map_map, himage]
  have h :=
    Internal.residueDatumIn_fieldImage_index_closedFixingSubgroup k Omega E
  rw [(residueDatumIn k Omega).fieldImage_eq_map] at h
  simpa [residueDatumIn, closedFixingSubgroup] using h
end FiniteImageIndex
end
end LocalClassFieldTheory
end

/- ValuedFieldTheory.Valuation.DiscreteValuationField.FiniteIntegralClosure -/
section
namespace ValuationTheory
noncomputable section
universe u v w
namespace DiscreteValuationField
namespace ValuedExtension
open DiscreteValuationField.Valuation
variable {K : Type u} {L : Type w} [Field K] [Field L]
variable [Algebra K L] [FiniteDimensional K L]
omit [FiniteDimensional K L] in
 
theorem CanonicalIntegralClosure.algebraMap_injective
    (base : CompleteDVF.{u, v} K) :
    Function.Injective
      (algebraMap base.valuationSubring
        (integralClosure base.valuationSubring L)) := by
  intro x y hxy
  apply Subtype.ext
  apply FaithfulSMul.algebraMap_injective K L
  exact
    congrArg
      (fun z : integralClosure base.valuationSubring L => (z : L)) hxy
omit [FiniteDimensional K L] in
 
theorem CanonicalIntegralClosure.faithfulSMul
    (base : CompleteDVF.{u, v} K) :
    FaithfulSMul base.valuationSubring
      (integralClosure base.valuationSubring L) :=
  (faithfulSMul_iff_algebraMap_injective base.valuationSubring
    (integralClosure base.valuationSubring L)).mpr
    (CanonicalIntegralClosure.algebraMap_injective (K := K) (L := L) base)
 

theorem integralClosure_base_maximal_map_isAdicComplete_of_finite_separable
    (base : CompleteDVF.{u, v} K)
    [Algebra.IsSeparable K L] :
    IsAdicComplete
      (base.maximalIdeal.map
        (algebraMap base.valuationSubring
          (integralClosure base.valuationSubring L)))
      (integralClosure base.valuationSubring L) := by
  let : IsNoetherianRing base.valuationSubring :=
    base_valuationSubring_isNoetherianRing (K := K) base
  let : IsFractionRing base.valuationSubring K :=
    base_valuationSubring_isFractionRing (K := K) base
  let : IsIntegrallyClosed base.valuationSubring :=
    base_valuationSubring_isIntegrallyClosed (K := K) base
  let : Module.Finite base.valuationSubring
      (integralClosure base.valuationSubring L) :=
    IsIntegralClosure.finite base.valuationSubring K L
      (integralClosure base.valuationSubring L)
  have : IsAdicComplete base.maximalIdeal base.valuationSubring :=
    base.isAdicComplete
  have hcomplete :
      IsAdicComplete base.maximalIdeal
        (integralClosure base.valuationSubring L) :=
    ValuationTheory.DiscreteValuationField.isAdicComplete_of_moduleFinite
      (I := base.maximalIdeal)
  exact
    (isAdicComplete_map_algebraMap_iff
      (I := base.maximalIdeal)
      (S := integralClosure base.valuationSubring L)).mpr hcomplete
 






theorem integralClosure_henselianRing_of_finite_separable
    (base : CompleteDVF.{u, v} K)
    [Algebra.IsSeparable K L] :
    HenselianRing (integralClosure base.valuationSubring L)
      (base.maximalIdeal.map
        (algebraMap base.valuationSubring
          (integralClosure base.valuationSubring L))) := by
  let :
      IsAdicComplete
        (base.maximalIdeal.map
          (algebraMap base.valuationSubring
            (integralClosure base.valuationSubring L)))
        (integralClosure base.valuationSubring L) :=
    integralClosure_base_maximal_map_isAdicComplete_of_finite_separable
      (K := K) (L := L) base
  infer_instance
 




theorem integralClosure_base_maximal_fiber_subsingleton_of_finite_separable
    (base : CompleteDVF.{u, v} K)
    [Algebra.IsSeparable K L] :
    Subsingleton
      (PrimeSpectrum
        (base.maximalIdeal.Fiber (integralClosure base.valuationSubring L))) := by
  let B := integralClosure base.valuationSubring L
  let : IsNoetherianRing base.valuationSubring :=
    base_valuationSubring_isNoetherianRing (K := K) base
  let : IsFractionRing base.valuationSubring K :=
    base_valuationSubring_isFractionRing (K := K) base
  let : IsIntegrallyClosed base.valuationSubring :=
    base_valuationSubring_isIntegrallyClosed (K := K) base
  let : Module.Finite base.valuationSubring B :=
    IsIntegralClosure.finite base.valuationSubring K L B
  let : Algebra.QuasiFinite base.valuationSubring B := by
    infer_instance
  let : IsArtinianRing (base.maximalIdeal.Fiber B) := by
    infer_instance
  refine primeSpectrum_subsingleton_of_isArtinianRing_of_idempotents_trivial ?_
  intro e he
  let : HenselianRing B
      (base.maximalIdeal.map (algebraMap base.valuationSubring B)) :=
    integralClosure_henselianRing_of_finite_separable (K := K) (L := L) base
  let : HenselianRing B
      (RingHom.ker
        ((Algebra.TensorProduct.includeRight :
          B →ₐ[base.valuationSubring] base.maximalIdeal.Fiber B) :
          B →+* base.maximalIdeal.Fiber B)) := by
    rw [maximalIdeal_fiber_includeRight_ker_eq_maximalIdeal_map
      (R := base.valuationSubring) (S := B)]
    infer_instance
  let φ : B →+* base.maximalIdeal.Fiber B :=
    (Algebra.TensorProduct.includeRight :
      B →ₐ[base.valuationSubring] base.maximalIdeal.Fiber B)
  have hsurj : Function.Surjective φ := by
    simpa [φ] using
      (maximalIdeal_fiber_includeRight_surjective
        (R := base.valuationSubring) (S := B))
  rcases exists_idempotent_lift_of_surjective_henselianRing_ker
      φ hsurj e he with
    ⟨b, hbidem, hbmap⟩
  let : IsDomain B := by
    change IsDomain (integralClosure base.valuationSubring L)
    infer_instance
  rcases IsIdempotentElem.iff_eq_zero_or_one.mp hbidem with rfl | rfl
  · left
    rw [← hbmap]
    simp [φ]
  · right
    rw [← hbmap]
    exact (Algebra.TensorProduct.includeRight :
      B →ₐ[base.valuationSubring] base.maximalIdeal.Fiber B).map_one
 






theorem integralClosure_isLocalRing_of_finite_separable
    (base : CompleteDVF.{u, v} K)
    [Algebra.IsSeparable K L] :
    IsLocalRing (integralClosure base.valuationSubring L) := by
  let B := integralClosure base.valuationSubring L
  let : Algebra.IsIntegral base.valuationSubring B := by
    change Algebra.IsIntegral base.valuationSubring
      (integralClosure base.valuationSubring L)
    infer_instance
  let : FaithfulSMul base.valuationSubring B :=
    CanonicalIntegralClosure.faithfulSMul (K := K) (L := L) base
  have hNonempty :
      Nonempty (Ideal.primesOver base.maximalIdeal B) := by
    rcases Ideal.exists_maximal_ideal_liesOver_of_isIntegral
        (S := B) base.maximalIdeal with
      ⟨P, hPmax, hPover⟩
    exact ⟨⟨P, hPmax.isPrime, hPover⟩⟩
  let : Subsingleton (PrimeSpectrum (base.maximalIdeal.Fiber B)) :=
    integralClosure_base_maximal_fiber_subsingleton_of_finite_separable
      (K := K) (L := L) base
  have hPrimeSub :
      Subsingleton (Ideal.primesOver base.maximalIdeal B) := by
    constructor
    intro P Q
    let e := PrimeSpectrum.primesOverOrderIsoFiber
      base.valuationSubring B base.maximalIdeal
    exact e.injective (Subsingleton.elim (e P) (e Q))
  rcases hNonempty with ⟨P⟩
  have hPrimesSingleton :
      Ideal.primesOver base.maximalIdeal B = {P.1} := by
    let : Subsingleton (Ideal.primesOver base.maximalIdeal B) := hPrimeSub
    refine Set.eq_singleton_iff_unique_mem.mpr ⟨P.2, ?_⟩
    intro Q hQ
    exact congrArg Subtype.val
      (Subsingleton.elim
        (⟨Q, hQ⟩ : Ideal.primesOver base.maximalIdeal B) P)
  have hPmem : P.1 ∈ Ideal.primesOver base.maximalIdeal B := P.2
  let : Nonempty (MaximalSpectrum B) :=
    ⟨⟨P.1, Ideal.isMaximal_of_mem_primesOver hPmem⟩⟩
  have hMaxSub : Subsingleton (MaximalSpectrum B) := by
    constructor
    intro M N
    apply MaximalSpectrum.ext
    have hMcomap :
        (M.asIdeal.comap (algebraMap base.valuationSubring B)) =
          base.maximalIdeal :=
      IsLocalRing.eq_maximalIdeal
        (Ideal.isMaximal_comap_of_isIntegral_of_isMaximal
          (R := base.valuationSubring) (S := B) M.asIdeal)
    have hNcomap :
        (N.asIdeal.comap (algebraMap base.valuationSubring B)) =
          base.maximalIdeal :=
      IsLocalRing.eq_maximalIdeal
        (Ideal.isMaximal_comap_of_isIntegral_of_isMaximal
          (R := base.valuationSubring) (S := B) N.asIdeal)
    have hMmem :
        M.asIdeal ∈ Ideal.primesOver base.maximalIdeal B :=
      ⟨M.isMaximal.isPrime, ⟨hMcomap.symm⟩⟩
    have hNmem :
        N.asIdeal ∈ Ideal.primesOver base.maximalIdeal B :=
      ⟨N.isMaximal.isPrime, ⟨hNcomap.symm⟩⟩
    have hMeq : M.asIdeal = P.1 := by
      simpa [hPrimesSingleton] using hMmem
    have hNeq : N.asIdeal = P.1 := by
      simpa [hPrimesSingleton] using hNmem
    exact hMeq.trans hNeq.symm
  exact IsLocalRing.of_singleton_maximalSpectrum
 

noncomputable def CanonicalIntegralClosure.maximalIdeal
    (base : CompleteDVF.{u, v} K)
    [Algebra.IsSeparable K L] :
    Ideal (integralClosure base.valuationSubring L) :=
  letI : IsLocalRing (integralClosure base.valuationSubring L) :=
    integralClosure_isLocalRing_of_finite_separable (K := K) (L := L) base
  IsLocalRing.maximalIdeal (integralClosure base.valuationSubring L)
 

theorem integralClosure_base_maximal_map_le_maximalIdeal_of_finite_separable
    (base : CompleteDVF.{u, v} K)
    [Algebra.IsSeparable K L] :
    base.maximalIdeal.map
        (algebraMap base.valuationSubring
          (integralClosure base.valuationSubring L)) ≤
      CanonicalIntegralClosure.maximalIdeal (K := K) (L := L) base := by
  let B := integralClosure base.valuationSubring L
  let : IsLocalRing B :=
    integralClosure_isLocalRing_of_finite_separable (K := K) (L := L) base
  change
    base.maximalIdeal.map (algebraMap base.valuationSubring B) ≤
      IsLocalRing.maximalIdeal B
  let : Algebra.IsIntegral base.valuationSubring B := by
    change Algebra.IsIntegral base.valuationSubring
      (integralClosure base.valuationSubring L)
    infer_instance
  have hlocal : IsLocalHom (algebraMap base.valuationSubring B) :=
    (algebraMap_isIntegral_iff.mpr
      (show Algebra.IsIntegral base.valuationSubring B from inferInstance)
    ).isLocalHom
      (CanonicalIntegralClosure.algebraMap_injective (K := K) (L := L) base)
  exact
    ((IsLocalRing.local_hom_TFAE
      (algebraMap base.valuationSubring B)).out 0 2).mp hlocal
omit [FiniteDimensional K L] in
 
theorem integralClosure_base_maximal_map_ne_bot_of_finite_separable
    (base : CompleteDVF.{u, v} K)
    [Algebra.IsSeparable K L] :
    base.maximalIdeal.map
      (algebraMap base.valuationSubring
        (integralClosure base.valuationSubring L)) ≠ ⊥ := by
  intro hbot
  exact base.maximalIdeal_ne_bot
    ((Ideal.map_eq_bot_iff_of_injective
      (CanonicalIntegralClosure.algebraMap_injective (K := K) (L := L) base)).1
      hbot)
omit [FiniteDimensional K L] in
 
theorem integralClosure_not_isField_of_finite_separable
    (base : CompleteDVF.{u, v} K)
    [Algebra.IsSeparable K L] :
    ¬ IsField (integralClosure base.valuationSubring L) := by
  let B := integralClosure base.valuationSubring L
  let : Algebra.IsIntegral base.valuationSubring B := by
    change Algebra.IsIntegral base.valuationSubring
      (integralClosure base.valuationSubring L)
    infer_instance
  let : FaithfulSMul base.valuationSubring B :=
    CanonicalIntegralClosure.faithfulSMul (K := K) (L := L) base
  intro hB
  have hbase : IsField base.valuationSubring :=
    isField_of_isIntegral_of_isField
      (R := base.valuationSubring) (S := B)
      (FaithfulSMul.algebraMap_injective base.valuationSubring B) hB
  exact IsDiscreteValuationRing.not_isField base.valuationSubring hbase
 

theorem integralClosure_isDiscreteValuationRing_of_finite_separable
    (base : CompleteDVF.{u, v} K)
    [Algebra.IsSeparable K L] :
    IsDiscreteValuationRing (integralClosure base.valuationSubring L) := by
  let : IsLocalRing (integralClosure base.valuationSubring L) :=
    integralClosure_isLocalRing_of_finite_separable (K := K) (L := L) base
  let : IsFractionRing base.valuationSubring K :=
    base_valuationSubring_isFractionRing (K := K) base
  let : IsDomain (integralClosure base.valuationSubring L) := by
    infer_instance
  let : IsDedekindDomain (integralClosure base.valuationSubring L) := by
    exact integralClosure.isDedekindDomain base.valuationSubring K L
  let : IsNoetherianRing (integralClosure base.valuationSubring L) := by
    exact integralClosure.isNoetherianRing (A := base.valuationSubring) (K := K) L
  have hnot :
      ¬ IsField (integralClosure base.valuationSubring L) :=
    integralClosure_not_isField_of_finite_separable
      (K := K) (L := L) base
  exact
    ((IsDiscreteValuationRing.TFAE
      (integralClosure base.valuationSubring L) hnot).out 2 0).mp
      (show IsDedekindDomain (integralClosure base.valuationSubring L) from
        inferInstance)
 

theorem exists_integralClosure_base_maximal_map_eq_maximalIdeal_pow
    (base : CompleteDVF.{u, v} K)
    [Algebra.IsSeparable K L] :
    ∃ n : ℕ,
      base.maximalIdeal.map
          (algebraMap base.valuationSubring
            (integralClosure base.valuationSubring L)) =
        CanonicalIntegralClosure.maximalIdeal (K := K) (L := L) base ^ n := by
  let B := integralClosure base.valuationSubring L
  let : IsLocalRing B :=
    integralClosure_isLocalRing_of_finite_separable (K := K) (L := L) base
  change
    ∃ n : ℕ,
      base.maximalIdeal.map (algebraMap base.valuationSubring B) =
        IsLocalRing.maximalIdeal B ^ n
  let : IsDomain B := by
    change IsDomain (integralClosure base.valuationSubring L)
    infer_instance
  let : IsDiscreteValuationRing B :=
    integralClosure_isDiscreteValuationRing_of_finite_separable
      (K := K) (L := L) base
  have hI :
      base.maximalIdeal.map
          (algebraMap base.valuationSubring B) ≠ ⊥ :=
    integralClosure_base_maximal_map_ne_bot_of_finite_separable
      (K := K) (L := L) base
  obtain ⟨pi, hpi⟩ := IsDiscreteValuationRing.exists_irreducible B
  obtain ⟨n, hn⟩ :=
    IsDiscreteValuationRing.ideal_eq_span_pow_irreducible hI hpi
  refine ⟨n, ?_⟩
  rw [hn, ← Ideal.span_singleton_pow, ← hpi.maximalIdeal_eq]
 

theorem exists_integralClosure_base_maximal_map_eq_maximalIdeal_pow_pos
    (base : CompleteDVF.{u, v} K)
    [Algebra.IsSeparable K L] :
    ∃ n : ℕ,
      0 < n ∧
        base.maximalIdeal.map
            (algebraMap base.valuationSubring
              (integralClosure base.valuationSubring L)) =
          CanonicalIntegralClosure.maximalIdeal (K := K) (L := L) base ^ n := by
  let B := integralClosure base.valuationSubring L
  let : IsLocalRing B :=
    integralClosure_isLocalRing_of_finite_separable (K := K) (L := L) base
  change
    ∃ n : ℕ,
      0 < n ∧
        base.maximalIdeal.map (algebraMap base.valuationSubring B) =
          IsLocalRing.maximalIdeal B ^ n
  obtain ⟨n, hn⟩ :=
    exists_integralClosure_base_maximal_map_eq_maximalIdeal_pow
      (K := K) (L := L) base
  refine ⟨n, ?_, hn⟩
  by_contra hnot
  have hn0 : n = 0 := Nat.eq_zero_of_not_pos hnot
  have htop :
      base.maximalIdeal.map (algebraMap base.valuationSubring B) = ⊤ := by
    simpa [hn0] using hn
  have hle :
      base.maximalIdeal.map (algebraMap base.valuationSubring B) ≤
        IsLocalRing.maximalIdeal B :=
    integralClosure_base_maximal_map_le_maximalIdeal_of_finite_separable
      (K := K) (L := L) base
  have htop_le : (⊤ : Ideal B) ≤ IsLocalRing.maximalIdeal B := by
    simpa [htop] using hle
  exact
    (IsLocalRing.maximalIdeal.isMaximal B).ne_top
      (top_le_iff.mp htop_le)
 

theorem integralClosure_maximalIdeal_isAdicComplete_of_finite_separable
    (base : CompleteDVF.{u, v} K)
    [Algebra.IsSeparable K L] :
    IsAdicComplete
      (CanonicalIntegralClosure.maximalIdeal (K := K) (L := L) base)
      (integralClosure base.valuationSubring L) := by
  let B := integralClosure base.valuationSubring L
  let : IsLocalRing B :=
    integralClosure_isLocalRing_of_finite_separable (K := K) (L := L) base
  change IsAdicComplete (IsLocalRing.maximalIdeal B) B
  obtain ⟨n, hnpos, hn⟩ :=
    exists_integralClosure_base_maximal_map_eq_maximalIdeal_pow_pos
      (K := K) (L := L) base
  have hmap :
      IsAdicComplete
        (base.maximalIdeal.map (algebraMap base.valuationSubring B)) B :=
    integralClosure_base_maximal_map_isAdicComplete_of_finite_separable
      (K := K) (L := L) base
  let :
      IsAdicComplete ((IsLocalRing.maximalIdeal B) ^ n) B := by
    have hn' :
        base.maximalIdeal.map (algebraMap base.valuationSubring B) =
          IsLocalRing.maximalIdeal B ^ n := by
      simpa [CanonicalIntegralClosure.maximalIdeal] using hn
    simpa [hn'] using hmap
  exact
    isAdicComplete_of_isAdicComplete_pow
      (M := B) (IsLocalRing.maximalIdeal B) hnpos
 

theorem exists_integralClosure_standard_completeDVF
    (base : CompleteDVF.{u, v} K)
    [Algebra.IsSeparable K L] :
    ∃ target : CompleteDVF.{w, 0} L,
      (∀ z : L,
        z ∈ target.valuation.valuationSubring ↔
          z ∈ (integralClosure base.valuationSubring L).toSubring) ∧
          ∃ _ : (integralClosure base.valuationSubring L) ≃+*
            target.valuationSubring,
            True := by
  let B := integralClosure base.valuationSubring L
  let : IsLocalRing B :=
    integralClosure_isLocalRing_of_finite_separable (K := K) (L := L) base
  let : IsDomain B := by
    change IsDomain (integralClosure base.valuationSubring L)
    infer_instance
  let : IsDiscreteValuationRing B :=
    integralClosure_isDiscreteValuationRing_of_finite_separable
      (K := K) (L := L) base
  let : IsFractionRing B L := by
    change IsFractionRing (integralClosure base.valuationSubring L) L
    exact integralClosure.isFractionRing_of_finite_extension K L
  let vL := (IsDiscreteValuationRing.maximalIdeal B).valuation L
  let e : B ≃+* vL.valuationSubring :=
    IsDiscreteValuationRing.equivValuationSubring (A := B) (K := L)
  let : Algebra B vL.valuationSubring := e.toRingHom.toAlgebra
  let eLin : B ≃ₗ[B] vL.valuationSubring :=
    { toFun := e
      invFun := e.symm
      left_inv := e.left_inv
      right_inv := e.right_inv
      map_add' := e.map_add
      map_smul' := by
        intro r x
        change e (r * x) = (algebraMap B vL.valuationSubring r) * e x
        simp [RingHom.algebraMap_toAlgebra] }
  have :
      IsAdicComplete (IsLocalRing.maximalIdeal B) B :=
    integralClosure_maximalIdeal_isAdicComplete_of_finite_separable
      (K := K) (L := L) base
  have hcompleteAsB :
      IsAdicComplete (IsLocalRing.maximalIdeal B) vL.valuationSubring :=
    isAdicComplete_of_linearEquiv
      (M := B) (N := vL.valuationSubring)
      (IsLocalRing.maximalIdeal B) eLin
  have hcompleteMap :
      IsAdicComplete
        ((IsLocalRing.maximalIdeal B).map
          (algebraMap B vL.valuationSubring))
        vL.valuationSubring :=
    (isAdicComplete_map_algebraMap_iff
      (I := IsLocalRing.maximalIdeal B)
      (S := vL.valuationSubring)).2 hcompleteAsB
  have hmem (x : B) :
      algebraMap B vL.valuationSubring x ∈
          IsLocalRing.maximalIdeal vL.valuationSubring ↔
        x ∈ IsLocalRing.maximalIdeal B := by
    simp only [IsLocalRing.mem_maximalIdeal, mem_nonunits_iff]
    constructor
    · intro hx hunit
      exact hx (hunit.map (algebraMap B vL.valuationSubring))
    · intro hx hunit
      apply hx
      have hpre := hunit.map e.symm.toRingHom
      simpa [RingHom.algebraMap_toAlgebra] using hpre
  have hmapMax :
      (IsLocalRing.maximalIdeal B).map
          (algebraMap B vL.valuationSubring) =
        IsLocalRing.maximalIdeal vL.valuationSubring := by
    apply le_antisymm
    · rw [Ideal.map_le_iff_le_comap]
      intro x hx
      exact (hmem x).2 hx
    · intro y hy
      have hx :
          e.symm y ∈ IsLocalRing.maximalIdeal B := by
        apply (hmem (e.symm y)).1
        simpa [RingHom.algebraMap_toAlgebra] using hy
      have hmap :=
        Ideal.mem_map_of_mem (algebraMap B vL.valuationSubring) hx
      simpa [RingHom.algebraMap_toAlgebra] using hmap
  have hcompletev :
      IsAdicComplete
        (IsLocalRing.maximalIdeal vL.valuationSubring)
        vL.valuationSubring := by
    simpa [hmapMax] using hcompleteMap
  have hmapSub :
      Subring.map (algebraMap B L) ⊤ =
        vL.valuationSubring.toSubring :=
    IsDiscreteValuationRing.map_algebraMap_eq_valuationSubring
      (A := B) (K := L)
  have hmemStandard (z : L) :
      z ∈ vL.valuationSubring ↔ z ∈ B.toSubring := by
    constructor
    · intro hz
      have hzmap :
          z ∈ Subring.map (algebraMap B L) ⊤ := by
        simpa [hmapSub] using hz
      rcases hzmap with ⟨b, _hbtop, hb⟩
      rw [← hb]
      exact b.2
    · intro hz
      have hzmap :
          z ∈ Subring.map (algebraMap B L) ⊤ :=
        ⟨⟨z, hz⟩, trivial, rfl⟩
      simpa [hmapSub] using hzmap
  let : Valuation.IsCompleteDiscrete vL :=
    { isRankOneDiscrete := inferInstance
      isAdicComplete := hcompletev }
  let target : CompleteDVF.{w, 0} L :=
    { ValueGroup := WithZero (Multiplicative ℤ)
      instValueGroup := inferInstance
      valuation := vL
      instCompleteDiscrete := inferInstance }
  refine ⟨target, ?_, e, trivial⟩
  intro z
  exact hmemStandard z
 


theorem exists_integralClosure_standard_fundamental_identity
    (base : CompleteDVF.{u, v} K)
    [Algebra.IsSeparable K L] :
    ∃ target : CompleteDVF.{w, 0} L,
      ∃ hExt : base.valuation.HasExtension target.valuation,
        letI : base.valuation.HasExtension target.valuation := hExt
        IsIntegralClosure target.valuationSubring
          base.valuationSubring L ∧
          ValuedExtension.degree base.toDVF target.toDVF =
            ValuedExtension.ramificationIndex base.toDVF target.toDVF *
              ValuedExtension.residueDegree base.toDVF target.toDVF := by
  obtain ⟨target, hmem, _hequiv⟩ :=
    exists_integralClosure_standard_completeDVF
      (K := K) (L := L) base
  have hExt : base.valuation.HasExtension target.valuation := by
    apply _root_.Valuation.HasExtension.ofComapInteger
    ext a
    change
      algebraMap K L a ∈ target.valuation.valuationSubring ↔
        a ∈ base.valuation.valuationSubring
    rw [hmem]
    exact algebraMap_mem_integralClosure_valuationSubring_iff
      (L := L) base.valuation a
  refine ⟨target, hExt, ?_⟩
  let : base.valuation.HasExtension target.valuation := hExt
  have hIntegralClosure :
      IsIntegralClosure target.valuationSubring
        base.valuationSubring L := by
    refine
      { algebraMap_injective := ?_
        isIntegral_iff := ?_ }
    · intro x y hxy
      exact Subtype.ext hxy
    · intro z
      constructor
      · intro hz
        have hzmem :
            z ∈ (integralClosure base.valuationSubring L).toSubring := hz
        exact ⟨⟨z, (hmem z).2 hzmem⟩, rfl⟩
      · rintro ⟨y, rfl⟩
        exact (hmem (y : L)).1 y.2
  refine ⟨hIntegralClosure, ?_⟩
  let :
      IsIntegralClosure target.valuationSubring
        base.valuationSubring L := hIntegralClosure
  let : IsScalarTower base.valuationSubring
      target.valuationSubring L := by
    apply IsScalarTower.of_algebraMap_eq
    intro x
    rfl
  exact isDefectless_of_isIntegralClosure
    (K := K) (L := L) base target
end ValuedExtension
end DiscreteValuationField
end
end ValuationTheory
end

/- ValuedFieldTheory.Valuation.ValuedAdicComplete -/
section
universe u v
namespace ValuationTheory
noncomputable section
namespace Valuations
open ValuationTheory.DiscreteValuationField
 

theorem rankOneDiscreteValuationSubring_isAdic
    {K : Type u} [Field K] {Gamma : Type v}
    [LinearOrderedCommGroupWithZero Gamma] [MulArchimedean Gamma]
    [Valued K Gamma]
    [(Valued.v : Valuation K Gamma).IsRankOneDiscrete] :
    IsAdic
      (IsLocalRing.maximalIdeal
        (Valued.v : Valuation K Gamma).valuationSubring) := by
  let val := (Valued.v : Valuation K Gamma)
  let : IsTopologicalRing val.valuationSubring :=
    Subring.instIsTopologicalRing val.valuationSubring.toSubring
  rcases Valuation.exists_isUniformizer_of_isCyclic_of_nontrivial val with
    ⟨pi, hpi⟩
  rw [isAdic_iff]
  constructor
  · intro n
    have h_radius_ne :
        val (((pi ^ n : val.valuationSubring) : K)) ≠ 0 := by
      change val ((pi : K) ^ n) ≠ 0
      rw [map_pow]
      exact pow_ne_zero n hpi.val_ne_zero
    have h_restrict_radius_ne :
        val.restrict (((pi ^ n : val.valuationSubring) : K)) ≠ 0 := by
      simpa using h_radius_ne
    have h_open_ball_restrict : IsOpen
        {x : K |
          val.restrict x ≤
            val.restrict (((pi ^ n : val.valuationSubring) : K))} :=
      Valued.isOpen_closedBall K h_restrict_radius_ne
    have h_open_ball : IsOpen
        {x : K |
          val x ≤ val (((pi ^ n : val.valuationSubring) : K))} := by
      simpa only [val.restrict_le_iff] using h_open_ball_restrict
    have h_preimage_open : IsOpen
        {x : val.valuationSubring |
          val (x : K) ≤ val (((pi ^ n : val.valuationSubring) : K))} :=
      h_open_ball.preimage continuous_subtype_val
    convert h_preimage_open using 1
    ext x
    exact
      (ValuationTheory.DiscreteValuationField.Valuation.mem_maximalIdeal_pow_iff_valuation_le_uniformizer_pow
          (val := val) (pi := pi) hpi n)
  · intro s hs
    rcases
        (mem_nhds_subtype (val.valuationSubring : Set K)
          (0 : val.valuationSubring) s).1 hs with
      ⟨t, ht, hts⟩
    rcases (Valued.hasBasis_nhds_zero K Gamma).mem_iff.mp ht with
      ⟨gamma, _hgamma, hgamma_t⟩
    let gamma' : Gammaˣ :=
      Units.map
        (MonoidWithZeroHom.ValueGroup₀.embedding (f := (.ofClass val)))
        gamma
    rcases exists_pow_lt
        (Valuation.IsRankOneDiscrete.generator_lt_one val)
        gamma' with
      ⟨n, hn⟩
    refine ⟨n, ?_⟩
    intro x hx
    apply hts
    apply hgamma_t
    change val.restrict (x : K) < gamma.1
    rw [Valuation.restrict_lt_iff_lt_embedding]
    have hx_le :=
      (ValuationTheory.DiscreteValuationField.Valuation.mem_maximalIdeal_pow_iff_valuation_le_uniformizer_pow
          (val := val) (pi := pi) hpi n).1 hx
    calc
      val (x : K) ≤ val (((pi ^ n : val.valuationSubring) : K)) := hx_le
      _ = ((Valuation.IsRankOneDiscrete.generator val) ^ n : Gamma) := by
            simp [map_pow, hpi.val]
      _ < MonoidWithZeroHom.ValueGroup₀.embedding (f := (.ofClass val)) gamma.1 := by
        have hn_coe := Units.val_lt_val.mp hn
        change
          ((Valuation.IsRankOneDiscrete.generator val : Gammaˣ) : Gamma) ^ n <
            MonoidWithZeroHom.ValueGroup₀.embedding
              (f := (.ofClass val)) gamma.1 at hn_coe
        exact hn_coe
 


theorem rankOneDiscreteValuationSubring_isAdicComplete
    {K : Type u} [Field K] {Gamma : Type v}
    [LinearOrderedCommGroupWithZero Gamma] [MulArchimedean Gamma]
    [Valued K Gamma]
    [(Valued.v : Valuation K Gamma).IsRankOneDiscrete]
    [CompleteSpace K] :
    IsAdicComplete
      (IsLocalRing.maximalIdeal
        (Valued.v : Valuation K Gamma).valuationSubring)
      (Valued.v : Valuation K Gamma).valuationSubring := by
  let val := (Valued.v : Valuation K Gamma)
  let : IsUniformAddGroup val.valuationSubring :=
    val.valuationSubring.toAddSubgroup.isUniformAddGroup
  let : IsTopologicalRing val.valuationSubring :=
    Subring.instIsTopologicalRing val.valuationSubring.toSubring
  let : CompleteSpace val.valuationSubring :=
    (Valued.isClosed_valuationSubring K).completeSpace_coe
  exact rankOneDiscreteValuationSubring_isAdic.isAdicComplete_iff.2
    ⟨inferInstance, inferInstance⟩
 

noncomputable def completeDVFOfCompleteValuedField
    {K : Type u} [Field K] {Gamma : Type v}
    [LinearOrderedCommGroupWithZero Gamma] [MulArchimedean Gamma]
    [Valued K Gamma]
    [(Valued.v : Valuation K Gamma).IsRankOneDiscrete]
    [CompleteSpace K] :
    CompleteDVF.{u, v} K where
  ValueGroup := Gamma
  valuation := Valued.v
  instCompleteDiscrete :=
    { isRankOneDiscrete := inferInstance
      isAdicComplete := rankOneDiscreteValuationSubring_isAdicComplete }
end Valuations
end
end ValuationTheory
end

/- ValuedFieldTheory.LocalField.NonarchimedeanLocalField.FiniteExtensionCompleteDVF -/
section
noncomputable section
namespace LocalFieldTheory
open ValuationTheory.DiscreteValuationField
open ValuationTheory.DiscreteValuationField.ValuedExtension
open scoped ValuativeRel
universe u v y
 

noncomputable def localCompleteDVF
    (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] :
    CompleteDVF.{u, u} K := by
  letI : UniformSpace K := IsTopologicalAddGroup.rightUniformSpace K
  letI : IsUniformAddGroup K := isUniformAddGroup_of_addCommGroup
  let v : Valuation K (ValuativeRel.ValueGroupWithZero K) := Valued.v
  let e :=
    (OrderMonoidIso.unitsCongr
      (IsNonarchimedeanLocalField.valueGroupWithZeroIsoInt K)).trans
      OrderMonoidIso.unitsWithZero
  letI : IsCyclic (ValuativeRel.ValueGroupWithZero K)ˣ :=
    e.toMulEquiv.isCyclic.mpr inferInstance
  letI : v.IsNontrivial :=
    (ValuativeRel.isNontrivial_iff_isNontrivial v).mp inferInstance
  letI : IsCyclic (MonoidWithZeroHom.valueGroup v.toMonoidWithZeroHom) :=
    Subgroup.isCyclic_of_le
      (show MonoidWithZeroHom.valueGroup v.toMonoidWithZeroHom ≤ ⊤ from le_top)
  letI : v.IsRankOneDiscrete := Valuation.IsRankOneDiscrete.mk' v
  exact ValuationTheory.Valuations.completeDVFOfCompleteValuedField
end LocalFieldTheory
end

/- ClassFieldTheory.LocalClassFieldTheory.Finite.LocalReciprocity.LocalResidueDatum -/
section
namespace LocalClassFieldTheory
open ClassFormation
open ValuationTheory RamificationTheory LocalFieldTheory
noncomputable section
open scoped Pointwise ValuativeRel
open HilbertRamification.ValuationSubring
open Field.absoluteGaloisGroup
variable (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K]
  [IsNonarchimedeanLocalField K]
local instance localSeparableClosureAlgebra :
    Algebra (SeparableClosure K) (AlgebraicClosure K) :=
  (separableClosure K (AlgebraicClosure K)).val.toRingHom.toAlgebra
local instance localSeparableClosureScalarTower :
    IsScalarTower K (SeparableClosure K) (AlgebraicClosure K) :=
  IsScalarTower.of_algebraMap_eq fun _ => rfl
 

private noncomputable def localAbsoluteValuationSubring :
    ValuationSubring (AlgebraicClosure K) :=
  Classical.choose
    (ValuationTheory.DiscreteValuationField.Valuation.exists_extension_valuationSubring
      (L := AlgebraicClosure K) (localCompleteDVF K).valuation)
 

private theorem localAbsoluteValuationSubring_pullback (x : K) :
    algebraMap K (AlgebraicClosure K) x ∈
        localAbsoluteValuationSubring K ↔
      x ∈ (localCompleteDVF K).valuation.valuationSubring := by
  rcases Classical.choose_spec
      (ValuationTheory.DiscreteValuationField.Valuation.exists_extension_valuationSubring
        (L := AlgebraicClosure K) (localCompleteDVF K).valuation) with
    ⟨_hmap, _hlocal, hpullback⟩
  exact hpullback x
 


noncomputable def localSeparableValuationSubring :
    ValuationSubring (SeparableClosure K) :=
  (localAbsoluteValuationSubring K).comap
    (algebraMap (SeparableClosure K) (AlgebraicClosure K))
 
theorem localSeparableValuationSubring_pullback (x : K) :
    algebraMap K (SeparableClosure K) x ∈
        localSeparableValuationSubring K ↔
      x ∈ (localCompleteDVF K).valuation.valuationSubring := by
  change algebraMap (SeparableClosure K) (AlgebraicClosure K)
      (algebraMap K (SeparableClosure K) x) ∈
        localAbsoluteValuationSubring K ↔ _
  rw [← IsScalarTower.algebraMap_apply K (SeparableClosure K)
    (AlgebraicClosure K)]
  exact localAbsoluteValuationSubring_pullback K x
 
noncomputable instance localSeparableValuationHasExtension :
    (localCompleteDVF K).valuation.HasExtension
      (localSeparableValuationSubring K).valuation :=
  ValuationTheory.DiscreteValuationField.Valuation.hasExtension_valuation_of_valuationSubring_pullback
    (localCompleteDVF K).valuation (localSeparableValuationSubring K)
      (localSeparableValuationSubring_pullback K)
 


theorem localSeparableValuationSubring_eq_of_hasExtension
    (B : ValuationSubring (SeparableClosure K))
    [(localCompleteDVF K).valuation.HasExtension B.valuation] :
    localSeparableValuationSubring K = B := by
  ext z
  let E : IntermediateField K (SeparableClosure K) :=
    IntermediateField.adjoin K ({z} : Set (SeparableClosure K))
  let : FiniteDimensional K E :=
    IntermediateField.adjoin.finiteDimensional
      (Algebra.IsIntegral.isIntegral z)
  let : Algebra.IsSeparable K E := inferInstance
  obtain ⟨target, hExt, _hIntegralClosure, _hFundamental⟩ :=
    ValuationTheory.DiscreteValuationField.ValuedExtension.exists_integralClosure_standard_fundamental_identity
      (K := K) (L := E) (localCompleteDVF K)
  let : (localCompleteDVF K).valuation.HasExtension target.valuation := hExt
  let : IsScalarTower (localCompleteDVF K).valuationSubring
      target.valuationSubring E :=
    ValuationTheory.DiscreteValuationField.Valuation.valuationSubring_isScalarTower_of_hasExtension
      (localCompleteDVF K).valuation target.valuation
  let Ares := (localSeparableValuationSubring K).restrictIntermediateField E
  let Bres := B.restrictIntermediateField E
  let : (localCompleteDVF K).valuation.HasExtension Ares.valuation :=
    RamificationTheory.ValuationSubring.restrictIntermediateField_hasExtension
      (localCompleteDVF K).valuation (localSeparableValuationSubring K) E
  let : (localCompleteDVF K).valuation.HasExtension Bres.valuation :=
    RamificationTheory.ValuationSubring.restrictIntermediateField_hasExtension
      (localCompleteDVF K).valuation B E
  have hA : target.valuation.valuationSubring = Ares :=
    ValuationTheory.DiscreteValuationField.ValuedExtension.target_valuationSubring_eq_of_finite_separable
      (localCompleteDVF K) target Ares
  have hB : target.valuation.valuationSubring = Bres :=
    ValuationTheory.DiscreteValuationField.ValuedExtension.target_valuationSubring_eq_of_finite_separable
      (localCompleteDVF K) target Bres
  have hAB : Ares = Bres := hA.symm.trans hB
  let zE : E :=
    ⟨z, IntermediateField.subset_adjoin (F := K)
      (S := ({z} : Set (SeparableClosure K))) (by simp)⟩
  change zE ∈ Ares ↔ zE ∈ Bres
  rw [hAB]
 

theorem localSeparableDecompositionGroup_eq_top :
    decompositionGroup K (localSeparableValuationSubring K) = ⊤ := by
  apply top_unique
  intro sigma _hsigma
  change sigma • localSeparableValuationSubring K =
    localSeparableValuationSubring K
  let : (localCompleteDVF K).valuation.HasExtension
      (sigma • localSeparableValuationSubring K).valuation :=
    RamificationTheory.ValuationSubring.smul_hasExtension
      (localCompleteDVF K).valuation (localSeparableValuationSubring K) sigma
  exact (localSeparableValuationSubring_eq_of_hasExtension K
    (sigma • localSeparableValuationSubring K)).symm
 

private noncomputable def localBaseValuationSubringEquivDecompositionField :
    (localCompleteDVF K).valuationSubring ≃+*
      decompositionFieldValuationSubring K
        (localSeparableValuationSubring K) := by
  let A := localSeparableValuationSubring K
  let Z := decompositionField K A
  have hZ : Z = ⊥ := by
    change IntermediateField.fixedField (decompositionGroup K A) = ⊥
    rw [localSeparableDecompositionGroup_eq_top K]
    simpa using
      (InfiniteGalois.fixedField_fixingSubgroup
        (⊥ : IntermediateField K (SeparableClosure K)))
  let eKZ : K ≃ₐ[K] Z :=
    (IntermediateField.botEquiv K (SeparableClosure K)).symm.trans
      (IntermediateField.equivOfEq hZ.symm)
  refine
    { toFun := fun x => ⟨eKZ (x : K), ?_⟩
      invFun := fun z => ⟨eKZ.symm (z : Z), ?_⟩
      left_inv := fun x => by
        apply Subtype.ext
        exact eKZ.symm_apply_apply (x : K)
      right_inv := fun z => by
        apply Subtype.ext
        exact eKZ.apply_symm_apply (z : Z)
      map_add' := fun x y => by
        apply Subtype.ext
        exact map_add eKZ (x : K) (y : K)
      map_mul' := fun x y => by
        apply Subtype.ext
        exact map_mul eKZ (x : K) (y : K) }
  · change ((eKZ x : Z) : SeparableClosure K) ∈ A
    have he : ((eKZ x : Z) : SeparableClosure K) =
        algebraMap K (SeparableClosure K) (x : K) := by
      rfl
    rw [he]
    exact (localSeparableValuationSubring_pullback K (x : K)).2 x.property
  · change eKZ.symm (z : Z) ∈
      (localCompleteDVF K).valuation.valuationSubring
    apply (localSeparableValuationSubring_pullback K (eKZ.symm (z : Z))).1
    have he : algebraMap K (SeparableClosure K) (eKZ.symm (z : Z)) =
        ((z : Z) : SeparableClosure K) := by
      exact congrArg Subtype.val (eKZ.apply_symm_apply (z : Z))
    rw [he]
    exact z.property
 

noncomputable def localBaseResidueEquivDecompositionResidue :
    (localCompleteDVF K).residueField ≃+*
      decompositionResidueField K (localSeparableValuationSubring K) :=
  (IsLocalRing.ResidueField.mapEquiv
      (localBaseValuationSubringEquivDecompositionField K)).trans
    (decompositionFieldResidueEquiv (K := K)
      (localSeparableValuationSubring K))
 



theorem localBaseResidueEquivDecompositionResidue_algebraMap
    (x : (localCompleteDVF K).valuationSubring) :
    algebraMap
        (decompositionResidueField K (localSeparableValuationSubring K))
        (selectedResidueField (localSeparableValuationSubring K))
        (localBaseResidueEquivDecompositionResidue K
          (IsLocalRing.residue (localCompleteDVF K).valuationSubring x)) =
      IsLocalRing.residue (localSeparableValuationSubring K)
        (⟨algebraMap K (SeparableClosure K) (x : K),
          (localSeparableValuationSubring_pullback K (x : K)).2
            x.property⟩ : localSeparableValuationSubring K) := by
  rfl
 
noncomputable instance localDecompositionResidueFinite :
    Finite (decompositionResidueField K
      (localSeparableValuationSubring K)) := by
  have : Finite (localCompleteDVF K).residueField := by
    change Finite (IsLocalRing.ResidueField ((ValuativeRel.valuation (K)).integer))
    infer_instance
  exact Finite.of_equiv (localCompleteDVF K).residueField
    (localBaseResidueEquivDecompositionResidue K).toEquiv
 
noncomputable instance localDecompositionResidueFintype :
    Fintype (decompositionResidueField K
      (localSeparableValuationSubring K)) :=
  Fintype.ofFinite _
 
instance localSelectedResidueIsAlgClosed :
    IsAlgClosed (selectedResidueField
      (localSeparableValuationSubring K)) := by
  let A := localAbsoluteValuationSubring K
  let B := localSeparableValuationSubring K
  let barI := valuationSubringComapResidueMap
    (F := SeparableClosure K) A
  let : Algebra (selectedResidueField B) (selectedResidueField A) :=
    barI.toAlgebra
  let : IsPurelyInseparable (SeparableClosure K) (AlgebraicClosure K) :=
    separableClosure.isPurelyInseparable K (AlgebraicClosure K)
  let : IsPurelyInseparable (selectedResidueField B)
      (selectedResidueField A) :=
    valuationSubring_comap_residueField_isPurelyInseparable
      (F := SeparableClosure K) A
  let : PerfectField (decompositionResidueField K B) := inferInstance
  let : Algebra.IsAlgebraic (decompositionResidueField K B)
      (selectedResidueField B) := inferInstance
  let : PerfectField (selectedResidueField B) :=
    Algebra.IsAlgebraic.perfectField
      (K := decompositionResidueField K B)
      (L := selectedResidueField B)
  let : Algebra.IsSeparable (selectedResidueField B)
      (selectedResidueField A) := inferInstance
  have hsurjective : Function.Surjective barI :=
    IsPurelyInseparable.surjective_algebraMap_of_isSeparable
      (selectedResidueField B) (selectedResidueField A)
  let e : selectedResidueField B ≃+* selectedResidueField A :=
    RingEquiv.ofBijective barI ⟨barI.injective, hsurjective⟩
  let : IsAlgClosed (selectedResidueField A) :=
    valuationSubring_residueField_isAlgClosed A
  exact IsAlgClosed.of_ringEquiv (selectedResidueField A)
    (selectedResidueField B) e.symm
 
private noncomputable def localSelectedResidueLift
    (x : selectedResidueField (localSeparableValuationSubring K)) :
    localSeparableValuationSubring K :=
  Classical.choose (IsLocalRing.residue_surjective x)
@[simp]
private theorem localSelectedResidueLift_residue
    (x : selectedResidueField (localSeparableValuationSubring K)) :
    IsLocalRing.residue (localSeparableValuationSubring K)
        (localSelectedResidueLift K x) = x :=
  Classical.choose_spec (IsLocalRing.residue_surjective x)
 



private theorem localSeparableResidueAlgAction_continuous :
    Continuous
      (residueAlgActionOfEqTop K
        (localSeparableValuationSubring K)
        (localSeparableDecompositionGroup_eq_top K)) := by
  classical
  let A := localSeparableValuationSubring K
  let k : Type := decompositionResidueField K A
  let Omega : Type := selectedResidueField A
  let hA := localSeparableDecompositionGroup_eq_top K
  let rho := residueAlgActionOfEqTop K A hA
  refine continuous_of_continuousAt_one rho ?_
  rw [ContinuousAt, MonoidHom.map_one, Filter.Tendsto]
  intro s hs
  rw [Filter.mem_map]
  rcases (krullTopology_mem_nhds_one_iff k Omega s).1 hs with
    ⟨E, hE, hEs⟩
  let : Algebra k E := E.algebra
  let : FiniteDimensional k E := hE
  let : Finite E := Module.finite_of_finite k
  let : Fintype E := Fintype.ofFinite E
  let lifts : Finset (SeparableClosure K) :=
    Finset.univ.image (fun x : E =>
      ((localSelectedResidueLift K (x : Omega) : A) : SeparableClosure K))
  let F : IntermediateField K (SeparableClosure K) :=
    IntermediateField.adjoin K (lifts : Set (SeparableClosure K))
  let : FiniteDimensional K F :=
    IntermediateField.finiteDimensional_adjoin (fun x _hx =>
      Algebra.IsIntegral.isIntegral x)
  refine (krullTopology_mem_nhds_one_iff K (SeparableClosure K)
    (rho ⁻¹' s)).2 ?_
  refine ⟨F, inferInstance, ?_⟩
  intro sigma hsigma
  apply hEs
  change rho sigma ∈ E.fixingSubgroup
  rw [IntermediateField.mem_fixingSubgroup_iff]
  intro x hx
  let y : E := ⟨x, hx⟩
  let a : A := localSelectedResidueLift K (y : Omega)
  have ha_lifts : (a : SeparableClosure K) ∈ lifts := by
    apply Finset.mem_image.mpr
    exact ⟨y, Finset.mem_univ y, rfl⟩
  have haF : (a : SeparableClosure K) ∈ F :=
    IntermediateField.subset_adjoin (F := K)
      (S := (lifts : Set (SeparableClosure K))) ha_lifts
  have hfix : sigma (a : SeparableClosure K) = (a : SeparableClosure K) :=
    (IntermediateField.mem_fixingSubgroup_iff F sigma).mp hsigma
      (a : SeparableClosure K) haF
  change rho sigma (y : Omega) = (y : Omega)
  rw [← localSelectedResidueLift_residue K (y : Omega)]
  change IsLocalRing.residue A
      ((toDecompositionGroupOfEqTop
        K A hA sigma) • a) = IsLocalRing.residue A a
  congr 1
  apply Subtype.ext
  exact hfix
 
noncomputable def localSeparableResidueAlgAction :
    Gal(SeparableClosure K / K) →ₜ*
      (selectedResidueField (localSeparableValuationSubring K) ≃ₐ[
        decompositionResidueField K (localSeparableValuationSubring K)]
          selectedResidueField (localSeparableValuationSubring K)) where
  toMonoidHom :=
    residueAlgActionOfEqTop K
      (localSeparableValuationSubring K)
      (localSeparableDecompositionGroup_eq_top K)
  continuous_toFun := localSeparableResidueAlgAction_continuous K
 
theorem localSeparableResidueAlgAction_surjective :
    Function.Surjective (localSeparableResidueAlgAction K) :=
  residueAlgActionOfEqTop_surjective K
    (localSeparableValuationSubring K)
    (localSeparableDecompositionGroup_eq_top K)
 


noncomputable def localResidueDegree :
    Gal(SeparableClosure K / K) →ₜ* ZHatMul where
  toMonoidHom :=
    (residueAbsoluteDegreeIn
      (decompositionResidueField K (localSeparableValuationSubring K))
      (selectedResidueField (localSeparableValuationSubring K))).toMonoidHom.comp
        (localSeparableResidueAlgAction K).toMonoidHom
  continuous_toFun :=
    (residueAbsoluteDegreeIn
      (decompositionResidueField K (localSeparableValuationSubring K))
      (selectedResidueField
        (localSeparableValuationSubring K))).continuous_toFun.comp
      (localSeparableResidueAlgAction K).continuous_toFun
 
theorem localResidueDegree_surjective :
    Function.Surjective (localResidueDegree K) := by
  intro z
  obtain ⟨tau, htau⟩ :=
    (residueDatumIn
      (decompositionResidueField K (localSeparableValuationSubring K))
      (selectedResidueField
        (localSeparableValuationSubring K))).degree_surjective z
  obtain ⟨sigma, hsigma⟩ :=
    localSeparableResidueAlgAction_surjective K tau
  refine ⟨sigma, ?_⟩
  change residueAbsoluteDegreeIn
      (decompositionResidueField K (localSeparableValuationSubring K))
      (selectedResidueField (localSeparableValuationSubring K))
        (localSeparableResidueAlgAction K sigma) = z
  rw [hsigma]
  simpa [residueDatumIn] using htau
 

noncomputable def localResidueDatum :
    DegreeData (Gal(SeparableClosure K / K)) where
  degree := localResidueDegree K
  degree_surjective := localResidueDegree_surjective K
end
end LocalClassFieldTheory
end

/- ClassFieldTheory.LocalClassFieldTheory.Finite.LocalReciprocity.FiniteSubgroupResidueDegree -/
section
namespace LocalClassFieldTheory
open CyclicCohomology RamificationTheory ClassFormation
open LocalFieldTheory
noncomputable section
open scoped Pointwise ValuativeRel
open HilbertRamification.ValuationSubring
open Field.absoluteGaloisGroup
variable (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K]
  [IsNonarchimedeanLocalField K]
 




noncomputable def localAbstractFixedResidueIntermediateField
    (H : ClosedSubgroup (Gal(SeparableClosure K / K))) :
    IntermediateField
      (decompositionResidueField K (localSeparableValuationSubring K))
      (selectedResidueField (localSeparableValuationSubring K)) := by
  let E := abstractFixedField K (SeparableClosure K) H
  let A := localSeparableValuationSubring K
  let k := decompositionResidueField K A
  let Omega := selectedResidueField A
  let kE := decompositionResidueField E A
  exact IntermediateField.adjoin k
    (Set.range (algebraMap kE Omega))
 


noncomputable local instance localAbstractFixedResidueIntermediateFieldAlgebra
    (H : ClosedSubgroup (Gal(SeparableClosure K / K))) :
    Algebra
      (decompositionResidueField K (localSeparableValuationSubring K))
      (localAbstractFixedResidueIntermediateField K H) :=
  (localAbstractFixedResidueIntermediateField K H).algebra
noncomputable local instance localAbstractFixedResidueIntermediateFieldModule
    (H : ClosedSubgroup (Gal(SeparableClosure K / K))) :
    Module
      (decompositionResidueField K (localSeparableValuationSubring K))
      (localAbstractFixedResidueIntermediateField K H) :=
  @Algebra.toModule _ _ _ _
    (localAbstractFixedResidueIntermediateFieldAlgebra K H)
 


theorem localAbstractFixedDecompositionGroup_eq_top
    (H : ClosedSubgroup (Gal(SeparableClosure K / K))) :
    decompositionGroup (abstractFixedField K (SeparableClosure K) H)
      (localSeparableValuationSubring K) = ⊤ := by
  let E := abstractFixedField K (SeparableClosure K) H
  let A := localSeparableValuationSubring K
  apply top_unique
  intro tau _htau
  let sigma : Gal(SeparableClosure K / K) := tau.restrictScalars K
  have hsigma : sigma • A = A := by
    change sigma ∈ decompositionGroup K A
    rw [localSeparableDecompositionGroup_eq_top K]
    exact Subgroup.mem_top sigma
  change tau • A = A
  exact hsigma
 


theorem localAbstractFixedResidueAction_apply
    (H : ClosedSubgroup (Gal(SeparableClosure K / K)))
    (sigma : H.toSubgroup)
    (x : selectedResidueField (localSeparableValuationSubring K)) :
    localSeparableResidueAlgAction K sigma.1 x =
      residueAlgActionOfEqTop
        (abstractFixedField K (SeparableClosure K) H)
        (localSeparableValuationSubring K)
        (localAbstractFixedDecompositionGroup_eq_top K H)
        (abstractSubgroupEquivGaloisGroup K (SeparableClosure K) H sigma) x := by
  let A := localSeparableValuationSubring K
  obtain ⟨a, rfl⟩ := IsLocalRing.residue_surjective x
  change IsLocalRing.residue A
      ((toDecompositionGroupOfEqTop K A
        (localSeparableDecompositionGroup_eq_top K) sigma.1) • a) =
    IsLocalRing.residue A
      ((toDecompositionGroupOfEqTop
        (abstractFixedField K (SeparableClosure K) H) A
        (localAbstractFixedDecompositionGroup_eq_top K H)
        (abstractSubgroupEquivGaloisGroup K (SeparableClosure K) H sigma)) • a)
  congr 1
 



theorem localAbstractFixedResidueAction_map_eq_fixingSubgroup
    (H : ClosedSubgroup (Gal(SeparableClosure K / K))) :
    H.toSubgroup.map (localSeparableResidueAlgAction K).toMonoidHom =
      (localAbstractFixedResidueIntermediateField K H).fixingSubgroup := by
  let E := abstractFixedField K (SeparableClosure K) H
  let A := localSeparableValuationSubring K
  let k := decompositionResidueField K A
  let Omega := selectedResidueField A
  let kE := decompositionResidueField E A
  let rhoK := localSeparableResidueAlgAction K
  let hE := localAbstractFixedDecompositionGroup_eq_top K H
  let rhoE := residueAlgActionOfEqTop E A hE
  let F := localAbstractFixedResidueIntermediateField K H
  ext tau
  constructor
  · rintro ⟨sigma, hsigma, rfl⟩
    let sigmaH : H.toSubgroup := ⟨sigma, hsigma⟩
    rw [IntermediateField.mem_fixingSubgroup_iff]
    intro x hx
    let T : IntermediateField k Omega :=
      { carrier := {y | rhoK sigma y = y}
        zero_mem' := by simp
        one_mem' := by simp
        add_mem' := by
          intro y z hy hz
          change rhoK sigma y = y at hy
          change rhoK sigma z = z at hz
          change rhoK sigma (y + z) = y + z
          rw [map_add]
          exact congrArg₂ (fun a b : Omega => a + b) hy hz
        mul_mem' := by
          intro y z hy hz
          change rhoK sigma y = y at hy
          change rhoK sigma z = z at hz
          change rhoK sigma (y * z) = y * z
          rw [map_mul]
          exact congrArg₂ (fun a b : Omega => a * b) hy hz
        algebraMap_mem' := fun y => (rhoK sigma).commutes y
        inv_mem' := by
          intro y hy
          change rhoK sigma y = y at hy
          simp [hy] }
    have hrange : Set.range (algebraMap kE Omega) ⊆ T := by
      rintro y ⟨z, rfl⟩
      have hbase : rhoK sigma (algebraMap kE Omega z) =
          algebraMap kE Omega z := by
        rw [localAbstractFixedResidueAction_apply K H sigmaH]
        exact (rhoE (abstractSubgroupEquivGaloisGroup
          K (SeparableClosure K) H sigmaH)).commutes z
      change rhoK sigma (algebraMap kE Omega z) =
        algebraMap kE Omega z
      exact hbase
    have hFT : F ≤ T := by
      apply IntermediateField.adjoin_le_iff.mpr
      exact hrange
    have hxT : x ∈ T := hFT hx
    change rhoK sigma x = x
    change rhoK sigma x = x at hxT
    exact hxT
  · intro htau
    let tauE : Omega ≃ₐ[kE] Omega :=
      { tau.toRingEquiv with
        commutes' := fun z => by
          have hzF : algebraMap kE Omega z ∈ F := by
            apply IntermediateField.subset_adjoin
            exact ⟨z, rfl⟩
          exact (IntermediateField.mem_fixingSubgroup_iff F tau).mp
            htau (algebraMap kE Omega z) hzF }
    obtain ⟨sigmaE, hsigmaE⟩ :=
      residueAlgActionOfEqTop_surjective E A hE tauE
    let sigmaH : H.toSubgroup :=
      (abstractSubgroupEquivGaloisGroup K (SeparableClosure K) H).symm sigmaE
    refine ⟨sigmaH.1, sigmaH.2, ?_⟩
    apply AlgEquiv.ext
    intro x
    change localSeparableResidueAlgAction K sigmaH.1 x = tau x
    rw [localAbstractFixedResidueAction_apply K H sigmaH]
    have hsigmaH : abstractSubgroupEquivGaloisGroup
        K (SeparableClosure K) H sigmaH = sigmaE :=
      (abstractSubgroupEquivGaloisGroup
        K (SeparableClosure K) H).apply_symm_apply sigmaE
    rw [hsigmaH, hsigmaE]
    rfl
 



theorem localAbstractFixedResidueIntermediateField_finiteDimensional
    (H : ClosedSubgroup (Gal(SeparableClosure K / K)))
    [Finite
      ((baseField (Gal(SeparableClosure K / K))).toSubgroup ⧸
        extensionSubgroup
          (baseField (Gal(SeparableClosure K / K))) H
          (le_baseField H))] :
    FiniteDimensional
      (decompositionResidueField K (localSeparableValuationSubring K))
      (localAbstractFixedResidueIntermediateField K H) := by
  let G := Gal(SeparableClosure K / K)
  let A := localSeparableValuationSubring K
  let k := decompositionResidueField K A
  let Omega := selectedResidueField A
  let rho := (localSeparableResidueAlgAction K).toMonoidHom
  let F := localAbstractFixedResidueIntermediateField K H
  let : Finite (G ⧸ H.toSubgroup) :=
    ambientQuotientFiniteOfAbstractFinite
      K (SeparableClosure K) H inferInstance
  have hHindex : H.toSubgroup.index ≠ 0 :=
    Subgroup.index_ne_zero_of_finite
  have hmapIndex : (H.toSubgroup.map rho).index ≠ 0 := by
    intro hzero
    have hdiv : (H.toSubgroup.map rho).index ∣ H.toSubgroup.index :=
      H.toSubgroup.index_map_dvd (localSeparableResidueAlgAction_surjective K)
    rw [hzero] at hdiv
    exact hHindex (eq_zero_of_zero_dvd hdiv)
  let : Finite
      ((Omega ≃ₐ[k] Omega) ⧸ H.toSubgroup.map rho) :=
    (Subgroup.index_ne_zero_iff_finite (H := H.toSubgroup.map rho)).mp
      hmapIndex
  have himage : H.toSubgroup.map rho = F.fixingSubgroup :=
    localAbstractFixedResidueAction_map_eq_fixingSubgroup K H
  let : Finite ((Omega ≃ₐ[k] Omega) ⧸ F.fixingSubgroup) := by
    rw [← himage]
    infer_instance
  let : Subgroup.FiniteIndex F.fixingSubgroup :=
    F.fixingSubgroup.finiteIndex_of_finite_quotient
  apply (InfiniteGalois.isOpen_iff_finite (K := Omega) F).1
  exact Subgroup.isOpen_of_isClosed_of_finiteIndex
    F.fixingSubgroup (InfiniteGalois.fixingSubgroup_isClosed F)
 

noncomputable def localAbstractFixedResidueFiniteGaloisIntermediateField
    (H : ClosedSubgroup (Gal(SeparableClosure K / K)))
    [Finite
      ((baseField (Gal(SeparableClosure K / K))).toSubgroup ⧸
        extensionSubgroup
          (baseField (Gal(SeparableClosure K / K))) H
          (le_baseField H))] :
    FiniteGaloisIntermediateField
      (decompositionResidueField K (localSeparableValuationSubring K))
      (selectedResidueField (localSeparableValuationSubring K)) := by
  let A := localSeparableValuationSubring K
  let k := decompositionResidueField K A
  let Omega := selectedResidueField A
  let F := localAbstractFixedResidueIntermediateField K H
  letI : Algebra k F := F.algebra
  letI : FiniteDimensional k F :=
    localAbstractFixedResidueIntermediateField_finiteDimensional K H
  letI : Finite F := Module.finite_of_finite k
  letI : Fintype F := Fintype.ofFinite F
  letI : IsGalois k F := by
    obtain ⟨p, hp⟩ := CharP.exists k
    let : CharP k p := hp
    let : CharP F p :=
      charP_of_injective_algebraMap (R := k) (A := F)
        (algebraMap k F).injective p
    exact IsGalois.of_separable_splitting_field
      (galois_poly_separable p (Fintype.card F)
        (let ⟨n, _, hn⟩ := FiniteField.card F p
        hn.symm ▸ dvd_pow_self p n.ne_zero))
  exact { toIntermediateField := F }
 


theorem localResidueDatum_residueDegree_eq_selectedResidueFinrank
    (H : FiniteAbstractField (Gal(SeparableClosure K / K))) :
    (H.residueDegree (localResidueDatum K) : ℕ) =
      Module.finrank
        (decompositionResidueField K (localSeparableValuationSubring K))
        (localAbstractFixedResidueIntermediateField K H.field) := by
  let A := localSeparableValuationSubring K
  let k := decompositionResidueField K A
  let Omega := selectedResidueField A
  let rho := (localSeparableResidueAlgAction K).toMonoidHom
  let R := localAbstractFixedResidueIntermediateField K H.field
  let : Algebra k R := R.algebra
  let : FiniteDimensional k R :=
    localAbstractFixedResidueIntermediateField_finiteDimensional K H.field
  let F := localAbstractFixedResidueFiniteGaloisIntermediateField K H.field
  let HR := H.toFiniteResidueAbstractField (localResidueDatum K)
  let : Finite ((localResidueDatum K).residueQuotient H.field) :=
    HR.finiteResidueQuotient
  have himage : H.field.toSubgroup.map rho =
      F.toIntermediateField.fixingSubgroup := by
    change H.field.toSubgroup.map
        (localSeparableResidueAlgAction K).toMonoidHom =
      (localAbstractFixedResidueIntermediateField K H.field).fixingSubgroup
    exact localAbstractFixedResidueAction_map_eq_fixingSubgroup K H.field
  have hindex :
      ((localResidueDatum K).fieldImage HR.field).index =
        Module.finrank k R := by
    rw [(localResidueDatum K).fieldImage_eq_map]
    change
      (H.field.toSubgroup.map
        ((residueAbsoluteDegreeIn k Omega).toMonoidHom.comp rho)).index =
          Module.finrank k R
    exact residueDegreeImage_index_eq_finrank_of_map_eq_fixingSubgroup
      k Omega rho H.field.toSubgroup F himage
  let : ((localResidueDatum K).fieldImage HR.field).IsFiniteRelIndex
      (⊤ : Subgroup ZHatMul) :=
    ⟨by
      rw [Subgroup.relIndex_top_right, hindex]
      let : Module.IsTorsionFree k R :=
        (Module.isTorsionFree_iff_algebraMap_injective (R := k) (A := R)).mpr
          (algebraMap k R).injective
      exact (Module.finrank_pos (R := k) (M := R)).ne'⟩
  apply Nat.cast_injective (R := Cardinal)
  change ((H.residueDegree (localResidueDatum K) : ℕ) : Cardinal) =
    (Module.finrank k R : Cardinal)
  rw [show H.residueDegree (localResidueDatum K) = HR.residueDegree from rfl,
    ← HR.residueDegreeCardinal_eq_coe,
    DegreeData.residueDegreeCardinal,
    relativeIndexCardinal_eq_index_of_finite
      (show (localResidueDatum K).fieldImage HR.field ≤
        (⊤ : Subgroup ZHatMul) from le_top)]
  norm_cast
  simpa only [Subgroup.relIndex_top_right] using hindex
end
end LocalClassFieldTheory
end

/- ClassFieldTheory.LocalClassFieldTheory.Finite.LocalReciprocity.FiniteResidueValuationComparison -/
section
namespace LocalClassFieldTheory
open ValuationTheory RamificationTheory
noncomputable section
universe u v w
open ValuationTheory.DiscreteValuationField
 



theorem ValuationSubring.restrictIntermediateField_eq_of_finite_separable
    {K : Type u} {Omega : Type v} [Field K] [Field Omega] [Algebra K Omega]
    (base : CompleteDVF K)
    (A : ValuationSubring Omega) [base.valuation.HasExtension A.valuation]
    (E : IntermediateField K Omega) [FiniteDimensional K E]
    [Algebra.IsSeparable K E]
    (C : ValuationSubring E) [base.valuation.HasExtension C.valuation] :
    A.restrictIntermediateField E = C := by
  let B := A.restrictIntermediateField E
  let : base.valuation.HasExtension B.valuation :=
    RamificationTheory.ValuationSubring.restrictIntermediateField_hasExtension
      base.valuation A E
  obtain ⟨target, hExt, _hIntegralClosure, _hFundamental⟩ :=
    DiscreteValuationField.ValuedExtension.exists_integralClosure_standard_fundamental_identity
      (K := K) (L := E) base
  let : base.valuation.HasExtension target.valuation := hExt
  have hB : target.valuation.valuationSubring = B :=
    DiscreteValuationField.ValuedExtension.target_valuationSubring_eq_of_finite_separable
      base target B
  have hC : target.valuation.valuationSubring = C :=
    DiscreteValuationField.ValuedExtension.target_valuationSubring_eq_of_finite_separable
      base target C
  exact hB.symm.trans hC
end
end LocalClassFieldTheory
end

/- ClassFieldTheory.LocalClassFieldTheory.Finite.LocalReciprocity.FiniteResidueFinrankTransfer -/
section
namespace LocalClassFieldTheory
open CyclicCohomology RamificationTheory ClassFormation
open LocalFieldTheory ValuationTheory
noncomputable section
open scoped ValuativeRel
open HilbertRamification.ValuationSubring
universe u v
 


noncomputable def valuationSubringEquivDecompositionFieldOfEqTop
    {F : Type u} {Omega : Type v} [Field F] [Field Omega] [Algebra F Omega]
    [IsGalois F Omega]
    (A : ValuationSubring Omega) (C : ValuationSubring F)
    (hC : A.comap (algebraMap F Omega) = C)
    (hA : decompositionGroup F A = ⊤) :
    C ≃+* decompositionFieldValuationSubring F A := by
  let Z := decompositionField F A
  have hZ : Z = ⊥ := by
    change IntermediateField.fixedField (decompositionGroup F A) = ⊥
    rw [hA]
    simpa using
      (InfiniteGalois.fixedField_fixingSubgroup
        (⊥ : IntermediateField F Omega))
  let eFZ : F ≃ₐ[F] Z :=
    (IntermediateField.botEquiv F Omega).symm.trans
      (IntermediateField.equivOfEq hZ.symm)
  refine
    { toFun := fun x => ⟨eFZ (x : F), ?_⟩
      invFun := fun z => ⟨eFZ.symm (z : Z), ?_⟩
      left_inv := fun x => by
        apply Subtype.ext
        exact eFZ.symm_apply_apply (x : F)
      right_inv := fun z => by
        apply Subtype.ext
        exact eFZ.apply_symm_apply (z : Z)
      map_add' := fun x y => by
        apply Subtype.ext
        exact map_add eFZ (x : F) (y : F)
      map_mul' := fun x y => by
        apply Subtype.ext
        exact map_mul eFZ (x : F) (y : F) }
  · change ((eFZ x : Z) : Omega) ∈ A
    have he : ((eFZ x : Z) : Omega) =
        algebraMap F Omega (x : F) := by
      rfl
    rw [he]
    have hx : (x : F) ∈ A.comap (algebraMap F Omega) := by
      rw [hC]
      exact x.property
    exact hx
  · have hz : eFZ.symm (z : Z) ∈ A.comap (algebraMap F Omega) := by
      change algebraMap F Omega (eFZ.symm (z : Z)) ∈ A
      have he : algebraMap F Omega (eFZ.symm (z : Z)) =
          ((z : Z) : Omega) := by
        exact congrArg Subtype.val (eFZ.apply_symm_apply (z : Z))
      rw [he]
      exact z.property
    rw [hC] at hz
    exact hz
 

noncomputable def residueFieldEquivDecompositionResidueOfEqTop
    {F : Type u} {Omega : Type v} [Field F] [Field Omega] [Algebra F Omega]
    [IsGalois F Omega]
    (A : ValuationSubring Omega) (C : ValuationSubring F)
    (hC : A.comap (algebraMap F Omega) = C)
    (hA : decompositionGroup F A = ⊤) :
    IsLocalRing.ResidueField C ≃+* decompositionResidueField F A :=
  (IsLocalRing.ResidueField.mapEquiv
      (valuationSubringEquivDecompositionFieldOfEqTop A C hC hA)).trans
    (decompositionFieldResidueEquiv (K := F) A)
 

theorem residueFieldEquivDecompositionResidueOfEqTop_algebraMap
    {F : Type u} {Omega : Type v} [Field F] [Field Omega] [Algebra F Omega]
    [IsGalois F Omega]
    (A : ValuationSubring Omega) (C : ValuationSubring F)
    (hC : A.comap (algebraMap F Omega) = C)
    (hA : decompositionGroup F A = ⊤) (x : C) :
    algebraMap (decompositionResidueField F A) (selectedResidueField A)
        (residueFieldEquivDecompositionResidueOfEqTop A C hC hA
          (IsLocalRing.residue C x)) =
      IsLocalRing.residue A
        (⟨algebraMap F Omega (x : F), by
          have hx : (x : F) ∈ A.comap (algebraMap F Omega) := by
            rw [hC]
            exact x.property
          exact hx⟩ : A) := by
  rfl
variable (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K]
  [IsNonarchimedeanLocalField K]
 



set_option synthInstance.maxHeartbeats 120000 in
set_option maxHeartbeats 1500000 in
theorem localResidueDatum_residueDegree_eq_residueFinrank
    (H : FiniteAbstractField (Gal(SeparableClosure K / K)))
    [FiniteDimensional K
      (abstractFixedField K (SeparableClosure K) H.field)]
    [ValuativeRel (abstractFixedField K (SeparableClosure K) H.field)]
    [TopologicalSpace (abstractFixedField K (SeparableClosure K) H.field)]
    [IsNonarchimedeanLocalField
      (abstractFixedField K (SeparableClosure K) H.field)]
    [Valuation.HasExtension (ValuativeRel.valuation K)
      (ValuativeRel.valuation
        (abstractFixedField K (SeparableClosure K) H.field))] :
    (H.residueDegree (localResidueDatum K) : ℕ) =
      LocalFieldTheory.valuationResidueDegree K (abstractFixedField K (SeparableClosure K) H.field) := by
  let E := abstractFixedField K (SeparableClosure K) H.field
  let A := localSeparableValuationSubring K
  let C := (ValuativeRel.valuation E).valuationSubring
  let V := (localCompleteDVF K).valuation.valuationSubring
  let kK := IsLocalRing.ResidueField
    V
  let kE := IsLocalRing.ResidueField C
  let k₀ := decompositionResidueField K A
  let kE' := decompositionResidueField E A
  let Omega := selectedResidueField A
  let F := localAbstractFixedResidueIntermediateField K H.field
  let : Algebra kK kE := LocalFieldTheory.valuationResidueAlgebra K E
  suffices hc : (H.residueDegree (localResidueDatum K) : ℕ) = Module.finrank kK kE by
    refine hc.trans ?_
    first
    | rfl
    | letI : Finite kK := inferInstanceAs (Finite (IsLocalRing.ResidueField ((ValuativeRel.valuation (K)).integer)))
      letI : Finite kE := inferInstanceAs (Finite (IsLocalRing.ResidueField ((ValuativeRel.valuation (E)).integer)))
      letI : Module.Finite kK kE := .of_finite
      apply Nat.pow_right_injective (Finite.one_lt_card : 2 ≤ Nat.card kK)
      exact (Module.natCard_eq_pow_finrank (K := kK) (V := kE)).symm.trans
        (LocalFieldTheory.valuationResidueDegree_card K E)

  have hExtC : (localCompleteDVF K).valuation.HasExtension C.valuation := by
    apply
      ValuationTheory.DiscreteValuationField.Valuation.hasExtension_valuation_of_valuationSubring_pullback
    intro x
    change ValuativeRel.valuation E (algebraMap K E x) ≤ 1 ↔
      (localCompleteDVF K).valuation x ≤ 1
    rw [_root_.Valuation.HasExtension.val_map_le_one_iff
      (ValuativeRel.valuation K) (ValuativeRel.valuation E)]
    rfl
  let : (localCompleteDVF K).valuation.HasExtension C.valuation := hExtC
  have hVC : V.valuation.HasExtension C.valuation := by
    apply
      ValuationTheory.DiscreteValuationField.Valuation.hasExtension_valuation_of_valuationSubring_pullback
    intro x
    simpa only [V, ValuationSubring.valuationSubring_valuation] using
      (ValuationTheory.DiscreteValuationField.Valuation.valuationSubring_pullback_of_hasExtension_valuation
        (localCompleteDVF K).valuation C x)
  have hC : A.comap (algebraMap E (SeparableClosure K)) = C := by
    simpa only [RamificationTheory.ValuationSubring.restrictIntermediateField_eq_comap] using
      (ValuationSubring.restrictIntermediateField_eq_of_finite_separable
        (localCompleteDVF K) A
        (abstractFixedField K (SeparableClosure K) H.field) C)
  have htop : decompositionGroup E A = ⊤ :=
    localAbstractFixedDecompositionGroup_eq_top K H.field

  let eK : kK ≃+* k₀ :=
    localBaseResidueEquivDecompositionResidue K
  let eE : kE ≃+* kE' :=
    residueFieldEquivDecompositionResidueOfEqTop A C hC htop
  let i : V →+* C :=
    ValuationTheory.Valuations.valuationSubringMapOfHasExtension V C hVC
  let bar : kE →+* Omega :=
    (algebraMap kE' Omega).comp eE.toRingHom

  have hbar_base (x : kK) :
      bar (algebraMap kK kE x) =
        algebraMap k₀ Omega (eK x) := by
    obtain ⟨a, rfl⟩ := IsLocalRing.residue_surjective x
    have hres :
        algebraMap kK kE
            (IsLocalRing.residue V a) =
          IsLocalRing.residue C
            (i a) := by
      change algebraMap (IsLocalRing.ResidueField ((ValuativeRel.valuation (K)).integer)) (IsLocalRing.ResidueField ((ValuativeRel.valuation (E)).integer))
          (IsLocalRing.residue ((ValuativeRel.valuation (K)).integer) a) =
        IsLocalRing.residue ((ValuativeRel.valuation (E)).integer) (algebraMap ((ValuativeRel.valuation (K)).integer) ((ValuativeRel.valuation (E)).integer) a)
      exact residueField_algebraMap_residue K E a
    rw [hres]
    change algebraMap kE' Omega
        (eE (IsLocalRing.residue C
          (i a))) =
      algebraMap k₀ Omega
        (eK (IsLocalRing.residue V a))
    rw [residueFieldEquivDecompositionResidueOfEqTop_algebraMap]
    have hbase :=
      localBaseResidueEquivDecompositionResidue_algebraMap K a
    change algebraMap k₀ Omega
      (eK (IsLocalRing.residue V a)) = _ at hbase
    rw [hbase]
    congr 1

  let : Algebra k₀ kE :=
    ((algebraMap kK kE).comp eK.symm.toRingHom).toAlgebra
  let barAlg : kE →ₐ[k₀] Omega :=
    { bar with
      commutes' := fun z => by
        change bar (algebraMap kK kE (eK.symm z)) =
          algebraMap k₀ Omega z
        simpa using hbar_base (eK.symm z) }

  have hF : F = barAlg.fieldRange := by
    change IntermediateField.adjoin k₀
        (Set.range (algebraMap kE' Omega)) = barAlg.fieldRange
    apply le_antisymm
    · apply IntermediateField.adjoin_le_iff.mpr
      rintro y ⟨z, rfl⟩
      obtain ⟨x, rfl⟩ := eE.surjective z
      exact ⟨x, rfl⟩
    · rintro y ⟨x, rfl⟩
      apply IntermediateField.subset_adjoin
      exact ⟨eE x, rfl⟩

  let eRange : kE ≃+* barAlg.fieldRange :=
    (AlgEquiv.ofInjectiveField barAlg).toRingEquiv
  let : Algebra k₀ barAlg.fieldRange := barAlg.fieldRange.algebra
  let : Algebra k₀ F :=
    localAbstractFixedResidueIntermediateFieldAlgebra K H.field
  letI : Module k₀ F := @Algebra.toModule k₀ F _ _ (localAbstractFixedResidueIntermediateFieldAlgebra K H.field)
  let eTop : kE ≃+* F :=
    eRange.trans
      (IntermediateField.equivOfEq hF.symm).toRingEquiv
  have hcomm :
      (algebraMap k₀ F).comp eK.toRingHom =
        eTop.toRingHom.comp (algebraMap kK kE) := by
    ext x
    change algebraMap k₀ Omega (eK x) =
      bar (algebraMap kK kE x)
    exact (hbar_base x).symm
  have hfinrankRaw :
      Module.finrank kK kE = Module.finrank k₀ F :=
    Algebra.finrank_eq_of_equiv_equiv eK eTop hcomm
  exact
    (localResidueDatum_residueDegree_eq_selectedResidueFinrank K H).trans
      hfinrankRaw.symm
end
end LocalClassFieldTheory
end

/- ClassFieldTheory.LocalClassFieldTheory.Finite.LocalReciprocity.LocalHenselianValuation -/
section
namespace LocalClassFieldTheory
open ClassFormation LocalFieldTheory
noncomputable section
open scoped NNReal ValuativeRel
 


noncomputable def localHenselianValuation
    (K : Type) [Field K] [CharZero K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] :
    ValuationData (localResidueDatum K)
      (galoisAmbientUnitsRep K (SeparableClosure K)) := by
  refine
    { toAddMonoidHom := localBaseValuation K
      integers_mem := intToProCInteger_mem_localBaseValuation_range K
      canonical_value_quotient_bijective :=
        localCanonicalValueQuotientMap_bijective K
      norm_range := ?_ }
  intro F
  let H := F.field
  let := F.finite
  let E := abstractFixedField K (SeparableClosure K) H
  let : FiniteDimensional K E :=
    abstractFixedField_finiteDimensional K (SeparableClosure K) H F.finite

  let : UniformSpace K := IsTopologicalAddGroup.rightUniformSpace K
  let : IsUniformAddGroup K := isUniformAddGroup_of_addCommGroup
  let : (Valued.v : Valuation K
      (ValuativeRel.ValueGroupWithZero K)).RankOne :=
    { hom' := ValuativeRel.IsRankLeOne.nonempty.some.emb (R := K) |>.comp
        MonoidWithZeroHom.ValueGroup₀.embedding
      strictMono' := ValuativeRel.IsRankLeOne.nonempty.some.strictMono.comp
        MonoidWithZeroHom.ValueGroup₀.embedding_strictMono }
  let : NontriviallyNormedField K :=
    Valued.toNontriviallyNormedField
      (L := K) (Γ₀ := ValuativeRel.ValueGroupWithZero K)

  let : NontriviallyNormedField E :=
    spectralNorm.nontriviallyNormedField K E
  let : NormedSpace K E := spectralNorm.normedSpace K E
  let : CompleteSpace E := spectralNorm.completeSpace K E
  let : LocallyCompactSpace E :=
    LocallyCompactSpace.of_finiteDimensional_of_complete K E
  let : IsUltrametricDist E :=
    ⟨fun x y z => by
      change ‖x - z‖ ≤ max ‖x - y‖ ‖y - z‖
      rw [← sub_add_sub_cancel x y z]
      exact isNonarchimedean_spectralNorm
        (K := K) (L := E) (x - y) (y - z)⟩
  let : Valued E ℝ≥0 := NormedField.toValued
  let vE : Valuation E ℝ≥0 := Valued.v
  let : vE.IsNontrivial :=
    (inferInstance : (NormedField.valuation (K := E)).IsNontrivial)
  let : ValuativeRel E := ValuativeRel.ofValuation vE
  let : vE.Compatible := Valuation.Compatible.ofValuation vE
  let : ValuativeRel.IsNontrivial E :=
    (ValuativeRel.isNontrivial_iff_isNontrivial vE).2 inferInstance
  let : IsValuativeTopology E :=
    isValuativeTopology_of_valued_ofValuation E ℝ≥0
  let : IsNonarchimedeanLocalField E :=
    { toIsValuativeTopology := inferInstance
      toLocallyCompactSpace := inferInstance
      toIsNontrivial := inferInstance }

  let : (ValuativeRel.valuation K).HasExtension
      (ValuativeRel.valuation E) := by
    apply Valuation.HasExtension.ofComapInteger
    ext x
    change ValuativeRel.valuation E (algebraMap K E x) ≤ 1 ↔
      ValuativeRel.valuation K x ≤ 1
    rw [← (ValuativeRel.valuation E).vle_one_iff, vE.vle_one_iff]
    change spectralNorm K E (algebraMap K E x) ≤ 1 ↔
      ValuativeRel.valuation K x ≤ 1
    rw [spectralNorm_extends]
    exact Valued.toNormedField.norm_le_one_iff

  let : Algebra.IsIntegral ((ValuativeRel.valuation (K)).integer) ((ValuativeRel.valuation (E)).integer) := ⟨by
    intro y
    have hyv : vE (y : E) ≤ 1 := by
      apply (vE.vle_one_iff).1
      apply ((ValuativeRel.valuation E).vle_one_iff).2
      exact y.property
    have hynorm : ‖(y : E)‖ ≤ 1 := by
      have hynnnorm : ‖(y : E)‖₊ ≤ 1 := by
        simpa [vE, NormedField.valuation_apply] using hyv
      exact_mod_cast hynnnorm
    change spectralNorm K E (y : E) ≤ 1 at hynorm
    have hcoeffNorm :
        ∀ n : ℕ, ‖(minpoly K (y : E)).coeff n‖ ≤ 1 :=
      (spectralValue_le_one_iff
        (minpoly.monic (Algebra.IsIntegral.isIntegral (y : E)))).1
        (by simpa [spectralNorm] using hynorm)
    have hcoeff :
        (↑(minpoly K (y : E)).coeffs : Set K) ⊆
          (ValuativeRel.valuation K).integer := by
      intro c hc
      obtain ⟨n, _hn, rfl⟩ := Polynomial.mem_coeffs_iff.mp hc
      exact ((ValuativeRel.valuation K).mem_integer_iff _).2
        (Valued.toNormedField.norm_le_one_iff.mp (hcoeffNorm n))
    let p : Polynomial ((ValuativeRel.valuation (K)).integer) :=
      (minpoly K (y : E)).toSubring
        (ValuativeRel.valuation K).integer hcoeff
    refine ⟨p, ?_, ?_⟩
    · exact (Polynomial.monic_toSubring
        (minpoly K (y : E)) (ValuativeRel.valuation K).integer hcoeff).2
          (minpoly.monic (Algebra.IsIntegral.isIntegral (y : E)))
    · apply Subtype.ext
      have hmaproot :
          Polynomial.aeval (y : E)
            (p.map (algebraMap ((ValuativeRel.valuation (K)).integer) K)) = 0 := by
        dsimp only [p]
        rw [show algebraMap ((ValuativeRel.valuation (K)).integer) K =
          (ValuativeRel.valuation K).integer.subtype from rfl,
          Polynomial.map_toSubring]
        exact minpoly.aeval K (y : E)
      change (ValuativeRel.valuation E).integer.subtype
        (Polynomial.eval₂ (algebraMap ((ValuativeRel.valuation (K)).integer) ((ValuativeRel.valuation (E)).integer)) y p) = (0 : E)
      rw [Polynomial.hom_eval₂]
      change Polynomial.aeval (y : E) p = 0
      rwa [Polynomial.aeval_map_algebraMap K (y : E) p] at hmaproot⟩

  let : Algebra.IsIntegral
      (ValuativeRel.valuation K).valuationSubring
      (ValuativeRel.valuation E).valuationSubring := by
    change Algebra.IsIntegral ((ValuativeRel.valuation (K)).integer) ((ValuativeRel.valuation (E)).integer)
    infer_instance
  let hIntegralClosure : IsIntegralClosure
      (ValuativeRel.valuation E).valuationSubring
      (ValuativeRel.valuation K).valuationSubring E :=
    ValuationTheory.DiscreteValuationField.Valuation.valuationSubring_isIntegralClosure_of_isIntegral
      (ValuativeRel.valuation K) (ValuativeRel.valuation E)
  let : IsIntegralClosure ((ValuativeRel.valuation (E)).integer) ((ValuativeRel.valuation (K)).integer) E := by
    change IsIntegralClosure
      (ValuativeRel.valuation E).valuationSubring
      (ValuativeRel.valuation K).valuationSubring E
    exact hIntegralClosure

  rw [localResidueDatum_residueDegree_eq_residueFinrank K F]
  exact localBaseValuation_comp_normToBase_range_eq_residueFinrank K H
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
open LocalFieldTheory.IsNonarchimedeanLocalField
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

/- TunnellCompletionValues -/
section
namespace TunnellCompletionValues
open ClassFormation CyclicCohomology KummerTheory LocalClassFieldTheory
open TunnellAbstractNormCoordinates TunnellAbstractValueCoordinates
open scoped TunnellAdicLocalField
noncomputable section
set_option maxHeartbeats 1600000 in
theorem actual : OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1_H2_R1_H2_R1_H1_R1.H1 := by
  intro K _ _ p
  let k := p.adicCompletion K
  letI : CharZero k := charZero_of_injective_algebraMap (algebraMap K k).injective
  let Ω := SeparableClosure k
  let A := galoisAmbientUnitsRep k Ω
  let D := localResidueDatum k
  let V := localHenselianValuation k
  let i := TunnellProfiniteCoordinate.equiv
  let d := i.toMultiplicative.toMonoidHom.comp D.degree.toMonoidHom
  let v := i.toAddMonoidHom.comp V.toAddMonoidHom
  refine ⟨d,v,TunnellProfiniteCoordinate.continuous_equiv.comp D.degree.continuous,
    i.toMultiplicative.surjective.comp D.degree_surjective,?_,?_,?_⟩
  · intro z
    obtain ⟨x,hx⟩ := V.integers_mem z
    exact ⟨x,(congrArg i hx).trans (int_coord z)⟩
  · intro n x hz
    obtain ⟨y,hy⟩ := (divides_iff V.toAddMonoidHom V.integers_mem n).mp
      (V.canonical_value_quotient_bijective n n.property) x hz
    exact ⟨y,(map_nsmul i _ _).symm.trans (congrArg i hy)⟩
  · intro H _
    exact (value_norm_iff A D V.toAddMonoidHom (finiteField H)).mp (V.norm_range (finiteField H))
end
end TunnellCompletionValues
end

theorem OMA.solution : OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1_H2_R1_H2_R1_H1_R1.H1 := TunnellCompletionValues.actual
