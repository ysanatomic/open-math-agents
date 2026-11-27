import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H1_R1_H2_R1_H2_R1_H1_R1_H1_R1
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

/- IntegralRepUniverse -/
section
 
abbrev IntegralRepGroupType := Type 0
end

/- TateComparison -/
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

/- NormKernelVanishing -/
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
    (K L : ClosedSubgroup G) (_hLK : L ≤ K) :
    Subgroup K.toSubgroup :=
  L.toSubgroup.subgroupOf K.toSubgroup

noncomputable def extensionFixedRepresentation {G : Type} [Group G]
    [TopologicalSpace G] (A : Rep.{0} ℤ G) (K L : ClosedSubgroup G)
    (hLK : L ≤ K)
    (hnormal : (extensionSubgroup K L hLK).Normal) :
    Rep ℤ (K.toSubgroup ⧸ extensionSubgroup K L hLK) := by
  exact Rep.quotientToInvariants
    (Rep.res K.toSubgroup.subtype A)
    (extensionSubgroup K L hLK)

noncomputable def finiteCyclicH1IsoTateHMinusOne {G : Type} [Group G] [Fintype G]
    (A : Rep.{0} ℤ G) (g : G) (hg : ∀ x, x ∈ Subgroup.zpowers g) :
    groupCohomology.H1 A ≅ tateCohomology A (-1) := by
  letI : IsCyclic G := isCyclic_of_generator g hg
  letI : CommGroup G := IsCyclic.commGroup (α := G)
  let e :
      groupCohomology.H1 A ≅
        (Rep.FiniteCyclicGroup.subCompNormHom A g).homology := by
    simpa using
      (Rep.FiniteCyclicGroup.groupCohomologyIsoOdd A g hg 1 (by simp))
  exact e ≪≫ (TateCohomology.isoFiniteCyclicNegOne A g hg).symm

theorem normKernel_le_sigmaMinusOneRange_of_tateHMinusOne_isZero
    {G : Type} [Group G] [Fintype G]
    (A : Rep.{0} ℤ G) (g : G) (hg : ∀ x, x ∈ Subgroup.zpowers g)
    (hzero : Limits.IsZero (tateCohomology A (-1))) :
    ∀ x : A.V, A.norm.hom x = 0 →
      ∃ y : A.V, A.ρ g y - y = x := by
  let : IsCyclic G := isCyclic_of_generator g hg
  let : CommGroup G := IsCyclic.commGroup (α := G)
  have hH1 : Limits.IsZero (groupCohomology.H1 A) :=
    Limits.IsZero.of_iso hzero (finiteCyclicH1IsoTateHMinusOne A g hg)
  let : Subsingleton (groupCohomology.H1 A) :=
    ModuleCat.subsingleton_of_isZero hH1
  intro x hx
  let : Module ℤ A.V := A.hV2
  let x' : LinearMap.ker A.norm.hom.toLinearMap := ⟨x, hx⟩
  have hclass :
      Rep.FiniteCyclicGroup.groupCohomologyπOdd A g hg 1 (by simp) x' = 0 :=
    Subsingleton.elim _ _
  rcases (Rep.FiniteCyclicGroup.groupCohomologyπOdd_eq_zero_iff
    A g hg 1 (by simp) x').1 hclass with ⟨y, hy⟩
  exact ⟨y, by simpa [Rep.sub_hom] using hy⟩
end
end CyclicCohomology
end

/- QuotientTower -/
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

/- Indices -/
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

/- TopologicalGeneration -/
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

/- ProfiniteIntegerCore -/
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

/- ProfiniteInteger -/
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

/- Fields -/
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
 
@[simp] theorem residueDegreeCardinal_eq_mk_residueQuotient
    (D : DegreeData G) (K : ClosedSubgroup G) :
    D.residueDegreeCardinal K = Cardinal.mk (D.residueQuotient K) :=
  rfl

structure ResidueLevel (D : DegreeData G) where
   
  field : ClosedSubgroup G
   
  finiteResidueQuotient : Finite (D.residueQuotient field)
namespace ResidueLevel
variable {D : DegreeData G}
 
abbrev toSubgroup (K : ResidueLevel D) : Subgroup G :=
  K.field.toSubgroup
 
instance (K : ResidueLevel D) :
    Finite (D.residueQuotient K.field) :=
  K.finiteResidueQuotient
 
noncomputable def residueDegree (K : ResidueLevel D) : ℕ+ := by
  letI : Nonempty (D.residueQuotient K.field) := ⟨QuotientGroup.mk 1⟩
  exact ⟨Nat.card (D.residueQuotient K.field), Nat.card_pos⟩
 
@[simp] theorem residueDegree_coe (K : ResidueLevel D) :
    (K.residueDegree : ℕ) = Nat.card (D.residueQuotient K.field) :=
  rfl
 
@[simp] theorem residueDegreeCardinal_eq_coe
    (K : ResidueLevel D) :
    D.residueDegreeCardinal K.field = ((K.residueDegree : ℕ) : Cardinal) := by
  change Cardinal.mk (D.residueQuotient K.field) =
    (Nat.card (D.residueQuotient K.field) : Cardinal)
  exact Nat.cast_card.symm
end ResidueLevel
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

def IsTotallyRamified (E : AbstractExtension G) (D : DegreeData G) : Prop :=
  E.base.toSubgroup.map D.degree.toMonoidHom ≤
    E.field.toSubgroup.map D.degree.toMonoidHom

theorem isUnramified_iff_inertia_le (E : AbstractExtension G) (D : DegreeData G) :
    E.IsUnramified D ↔
      E.base.toSubgroup ⊓ D.degree.toMonoidHom.ker ≤ E.field.toSubgroup :=
  Iff.rfl

theorem isTotallyRamified_iff_image_le (E : AbstractExtension G) (D : DegreeData G) :
    E.IsTotallyRamified D ↔
      E.base.toSubgroup.map D.degree.toMonoidHom ≤
        E.field.toSubgroup.map D.degree.toMonoidHom :=
  Iff.rfl
end AbstractExtension

structure GaloisSubextension (K : ClosedSubgroup G) where
   
  field : ClosedSubgroup G
   
  below : field.toSubgroup ≤ K.toSubgroup
   
  normal : (extensionSubgroup K field below).Normal
namespace GaloisSubextension
variable {K : ClosedSubgroup G}
 
def toAbstractExtension (L : GaloisSubextension K) :
    DegreeData.AbstractExtension G where
  field := L.field
  base := K
  below := L.below

def extensionQuotient (L : GaloisSubextension K) : Type u :=
  K.toSubgroup ⧸ extensionSubgroup K L.field L.below
 
def IsTotallyRamified (L : GaloisSubextension K) (D : DegreeData G) : Prop :=
  L.toAbstractExtension.IsTotallyRamified D
 
instance extensionSubgroup_normalInstance (L : GaloisSubextension K) :
    (extensionSubgroup K L.field L.below).Normal :=
  L.normal
 
instance extensionQuotient_groupInstance (L : GaloisSubextension K) :
    Group L.extensionQuotient := by
  change Group
    (K.toSubgroup ⧸ extensionSubgroup K L.field L.below)
  infer_instance

def extensionQuotientMulEquiv (L : GaloisSubextension K) :
    L.extensionQuotient ≃*
      (K.toSubgroup ⧸ extensionSubgroup K L.field L.below) :=
  MulEquiv.refl _
 
theorem isTotallyRamified_iff_image_le (L : GaloisSubextension K)
    (D : DegreeData G) :
    L.IsTotallyRamified D ↔
      K.toSubgroup.map D.degree.toMonoidHom ≤
        L.field.toSubgroup.map D.degree.toMonoidHom :=
  L.toAbstractExtension.isTotallyRamified_iff_image_le D
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

def IsUnramified (D : DegreeData G) : Prop :=
  E.toAbstractExtension.IsUnramified D

def IsTotallyRamified (D : DegreeData G) : Prop :=
  E.toAbstractExtension.IsTotallyRamified D

@[simp] theorem isUnramified_iff (D : DegreeData G) :
    E.IsUnramified D ↔ E.toAbstractExtension.IsUnramified D :=
  Iff.rfl
 
@[simp] theorem isTotallyRamified_iff (D : DegreeData G) :
    E.IsTotallyRamified D ↔ E.toAbstractExtension.IsTotallyRamified D :=
  Iff.rfl

theorem isUnramified_iff_inertia_le (D : DegreeData G) :
    E.IsUnramified D ↔
      E.base.toSubgroup ⊓ D.degree.toMonoidHom.ker ≤ E.field.toSubgroup :=
  E.toAbstractExtension.isUnramified_iff_inertia_le D

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
namespace ResidueLevel
variable {D : DegreeData G}

noncomputable def ofRelativeInclusion (D : DegreeData G)
    (field : ClosedSubgroup G) (base : ResidueLevel D)
    (below : field.toSubgroup ≤ base.field.toSubgroup)
    [finiteRelativeResidueQuotient : Finite
      (↥(base.field.toSubgroup.map D.degree.toMonoidHom) ⧸
        (field.toSubgroup.map D.degree.toMonoidHom).subgroupOf
          (base.field.toSubgroup.map D.degree.toMonoidHom))] :
    ResidueLevel D where
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
end ResidueLevel

structure FiniteResidueAbstractExtension (D : DegreeData G) where
   
  field : ResidueLevel D
   
  base : ResidueLevel D
   
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
 
structure FiniteLevel (G : Type u) [Group G] [TopologicalSpace G] where
   
  field : ClosedSubgroup G
   
  finite : Finite ((baseField G).toSubgroup ⧸
    extensionSubgroup (baseField G) field (le_baseField field))
namespace FiniteLevel

def toFiniteAbstractExtension (K : FiniteLevel G) :
    DegreeData.FiniteAbstractExtension G where
  field := K.field
  base := baseField G
  below := le_baseField K.field
  finiteQuotient := K.finite
 
instance (K : FiniteLevel G) :
    Finite ((baseField G).toSubgroup ⧸
      extensionSubgroup (baseField G) K.field (le_baseField K.field)) :=
  K.finite

noncomputable abbrev toResidueLevel
    (K : FiniteLevel G) (D : DegreeData G) :
    DegreeData.ResidueLevel D where
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
    simpa only [FiniteLevel.toFiniteAbstractExtension,
      DegreeData.AbstractExtension.relativeResidueDegreeCardinal, relativeIndexCardinal] using
      K.toFiniteAbstractExtension.relativeResidueDegreeCardinal_lt_aleph0 D

noncomputable def residueDegree (K : FiniteLevel G)
    (D : DegreeData G) : ℕ+ :=
  (K.toResidueLevel D).residueDegree
end FiniteLevel

structure LevelExtension (G : Type u)
    [Group G] [TopologicalSpace G] where
   
  field : FiniteLevel G
   
  base : FiniteLevel G
   
  below : field.field.toSubgroup ≤ base.field.toSubgroup
   
  finiteQuotient :
    Finite
      (base.field.toSubgroup ⧸
        extensionSubgroup base.field field.field below)
namespace LevelExtension

noncomputable abbrev ofInclusion (field : ClosedSubgroup G)
    (base : FiniteLevel G)
    (below : field.toSubgroup ≤ base.field.toSubgroup)
    [finiteQuotient : Finite
      (base.field.toSubgroup ⧸
        extensionSubgroup base.field field below)] :
    LevelExtension G where
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
 
abbrev toFiniteAbstractExtension (E : LevelExtension G) :
    DegreeData.FiniteAbstractExtension G where
  field := E.field.field
  base := E.base.field
  below := E.below
  finiteQuotient := E.finiteQuotient
 
abbrev IsUnramified (E : LevelExtension G) (D : DegreeData G) : Prop :=
  E.toFiniteAbstractExtension.IsUnramified D
 
def IsTotallyRamified (E : LevelExtension G)
    (D : DegreeData G) : Prop :=
  E.toFiniteAbstractExtension.IsTotallyRamified D
 
noncomputable def degree (E : LevelExtension G) : ℕ+ :=
  E.toFiniteAbstractExtension.degree
 
noncomputable def residueDegree (E : LevelExtension G)
    (D : DegreeData G) : ℕ+ :=
  E.toFiniteAbstractExtension.residueDegree D

theorem residueDegree_eq_degree_of_isUnramified
    (E : LevelExtension G) (D : DegreeData G)
    (hE : E.IsUnramified D) :
    (E.residueDegree D : ℕ) = (E.degree : ℕ) :=
  E.toFiniteAbstractExtension.residueDegree_eq_degree_of_isUnramified D hE
 
instance (E : LevelExtension G) :
    Finite
      (E.base.field.toSubgroup ⧸
        extensionSubgroup E.base.field E.field.field E.below) :=
  E.finiteQuotient
 
noncomputable def toFiniteResidueAbstractExtension
    (E : LevelExtension G) (D : DegreeData G) :
    DegreeData.FiniteResidueAbstractExtension D where
  field := E.field.toResidueLevel D
  base := E.base.toResidueLevel D
  below := E.below
  finiteQuotient := E.finiteQuotient
end LevelExtension
end
end ClassFormation
end

/- Frobenius -/
section
namespace ClassFormation
noncomputable section
variable {G : Type*} [Group G] [TopologicalSpace G]
namespace DegreeData
 
def fieldImageAdd (D : DegreeData G) (K : ClosedSubgroup G) : AddSubgroup ZHat :=
  Subgroup.toAddSubgroup' (D.fieldImage K)
 
@[simp]
theorem fieldImageAdd_index (D : DegreeData G)
    (K : ResidueLevel D) :
    (D.fieldImageAdd K.field).index = (K.residueDegree : ℕ) := by
  change (D.fieldImage K.field).index = (K.residueDegree : ℕ)
  rw [← Subgroup.relIndex_top_right]
  change Nat.card (D.residueQuotient K.field) = (K.residueDegree : ℕ)
  exact K.residueDegree_coe.symm
 
theorem fieldImageAdd_eq_mulNat_range (D : DegreeData G)
    (K : ResidueLevel D) :
    D.fieldImageAdd K.field =
      (zHatMulNat (K.residueDegree : ℕ)).toAddMonoidHom.range := by
  apply zHatAddSubgroup_eq_mulNat_range_of_index_eq
  · exact K.residueDegree.property
  · exact D.fieldImageAdd_index K
 
def restrictedDegreeInMulNatRange (D : DegreeData G)
    (K : ResidueLevel D) (k : K.field.toSubgroup) :
    (zHatMulNat (K.residueDegree : ℕ)).toAddMonoidHom.range := by
  refine ⟨(D.degree k.1).toAdd, ?_⟩
  rw [← D.fieldImageAdd_eq_mulNat_range K]
  change D.degree k.1 ∈ D.fieldImage K.field
  exact ⟨k, rfl⟩
 
def normalizedDegree (D : DegreeData G) (K : ResidueLevel D) :
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
    (K : ResidueLevel D) (k : K.field.toSubgroup) :
    (K.residueDegree : ℕ) • (D.normalizedDegree K k).toAdd =
      (D.degree k.1).toAdd := by
  exact zHatMulNat_zHatDivide (K.residueDegree : ℕ) K.residueDegree.property
    (D.restrictedDegreeInMulNatRange K k)
 
theorem normalizedDegree_surjective (D : DegreeData G)
    (K : ResidueLevel D) :
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
    (K : ResidueLevel D) :
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

/- FrobeniusLift -/
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
    (hLK : L ≤ K) : Subgroup K.toSubgroup :=
  extensionSubgroup K L hLK ⊓ D.fieldInertiaWithin K

instance extensionInertiaWithin_normal (D : DegreeData G)
    (K L : ClosedSubgroup G) (hLK : L ≤ K)
    [hLnormal : (extensionSubgroup K L hLK).Normal] :
    (D.extensionInertiaWithin K L hLK).Normal := by
  rw [extensionInertiaWithin]
  infer_instance
private theorem extensionInertiaWithin_le_normalizedDegree_ker
    (D : DegreeData G) (K : ResidueLevel D)
    (L : ClosedSubgroup G)
    (hLK : L ≤ K.field) :
    D.extensionInertiaWithin K.field L hLK ≤
      (D.normalizedDegree K).toMonoidHom.ker := by
  intro x hx
  rw [D.normalizedDegree_ker K]
  exact hx.2
 
def extensionNormalizedDegree (D : DegreeData G)
    (K : ResidueLevel D) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal] :
    (K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK) →* ZHatMul :=
  QuotientGroup.lift (D.extensionInertiaWithin K.field L hLK)
    (D.normalizedDegree K).toMonoidHom
    (D.extensionInertiaWithin_le_normalizedDegree_ker K L hLK)

@[simp]
theorem extensionNormalizedDegree_mk (D : DegreeData G)
    (K : ResidueLevel D) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (k : K.field.toSubgroup) :
    D.extensionNormalizedDegree K L hLK (QuotientGroup.mk k) =
      D.normalizedDegree K k :=
  rfl
 
def extensionRestriction (D : DegreeData G) (K L : ClosedSubgroup G)
    (hLK : L ≤ K)
    [hLnormal : (extensionSubgroup K L hLK).Normal] :
    (K.toSubgroup ⧸ D.extensionInertiaWithin K L hLK) →*
      (K.toSubgroup ⧸ extensionSubgroup K L hLK) :=
  QuotientGroup.map (D.extensionInertiaWithin K L hLK)
    (extensionSubgroup K L hLK) (MonoidHom.id K.toSubgroup) inf_le_left

@[simp]
theorem extensionRestriction_mk (D : DegreeData G)
    (K L : ClosedSubgroup G) (hLK : L ≤ K)
    [hLnormal : (extensionSubgroup K L hLK).Normal]
    (k : K.toSubgroup) :
    D.extensionRestriction K L hLK (QuotientGroup.mk k) =
      QuotientGroup.mk k :=
  rfl

def FrobeniusElements (D : DegreeData G)
    (K : ResidueLevel D) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal] : Type u :=
  {σ : K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK //
    ∃ n : ℕ, 0 < n ∧
      D.extensionNormalizedDegree K L hLK σ =
        (Multiplicative.ofAdd (1 : ZHat)) ^ n}
 
def frobeniusRestriction (D : DegreeData G)
    (K : ResidueLevel D) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal] :
    D.FrobeniusElements K L hLK →
      (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK) :=
  fun σ => D.extensionRestriction K.field L hLK σ.1
private def normalizedExtensionImageAdd (D : DegreeData G)
    (K : ResidueLevel D) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field) : AddSubgroup ZHat :=
  Subgroup.toAddSubgroup'
    ((extensionSubgroup K.field L hLK).map
      (D.normalizedDegree K).toMonoidHom)
private theorem normalizedExtensionImageAdd_index_ne_zero
    (D : DegreeData G) (K : ResidueLevel D)
    (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
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
    (K : ResidueLevel D) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
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

/- TotallyDisconnectedQuotients -/
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

/- FrobeniusFixedField -/
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
 
def frobeniusExponent (D : DegreeData G) (K : ResidueLevel D) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (σ : D.FrobeniusElements K L hLK) : ℕ :=
  Exists.choose σ.2
 
theorem frobeniusExponent_pos (D : DegreeData G) (K : ResidueLevel D) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (σ : D.FrobeniusElements K L hLK) :
    0 < D.frobeniusExponent K L hLK σ :=
  (Exists.choose_spec σ.2).1
 
theorem extensionNormalizedDegree_frobenius_eq_pow (D : DegreeData G)
    (K : ResidueLevel D) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (σ : D.FrobeniusElements K L hLK) :
    D.extensionNormalizedDegree K L hLK σ.1 =
      (Multiplicative.ofAdd (1 : ZHat)) ^
          D.frobeniusExponent K L hLK σ :=
  (Exists.choose_spec σ.2).2
 
def extensionNormalizedDegreeContinuous (D : DegreeData G)
    (K : ResidueLevel D) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
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
    (K : ResidueLevel D) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (x : K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK) :
    D.extensionNormalizedDegreeContinuous K L hLK x =
      D.extensionNormalizedDegree K L hLK x :=
  rfl
 
theorem extensionNormalizedDegreeContinuous_surjective (D : DegreeData G)
    (K : ResidueLevel D) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal] :
    Function.Surjective
      (D.extensionNormalizedDegreeContinuous K L hLK) := by
  intro z
  obtain ⟨k, hk⟩ := D.normalizedDegree_surjective K z
  refine ⟨QuotientGroup.mk k, ?_⟩
  simpa using hk

def extensionDegreeKernelRestriction (D : DegreeData G)
    (K : ResidueLevel D) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal] :
    (D.extensionNormalizedDegreeContinuous K L hLK).toMonoidHom.ker →*
      (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK) :=
  (D.extensionRestriction K.field L hLK).comp
    (D.extensionNormalizedDegreeContinuous K L hLK).toMonoidHom.ker.subtype
 
theorem extensionDegreeKernelRestriction_injective (D : DegreeData G)
    (K : ResidueLevel D) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
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
    (K : ResidueLevel D) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field) :
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
    (K : ResidueLevel D) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (σ : D.FrobeniusElements K L hLK) :
    ClosedSubgroup
      (K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK) :=
  closedSubgroupGenerated
    (Set.range (fun _ : Unit => σ.1))
 
def frobeniusInClosure (D : DegreeData G) [IsTopologicalGroup G]
    (K : ResidueLevel D) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (σ : D.FrobeniusElements K L hLK) :
    D.frobeniusClosure K L hLK σ :=
  closedSubgroupGeneratedMap (fun _ : Unit => σ.1) ()
 
instance frobeniusClosure_isTopologicalGroup
    (D : DegreeData G) [IsTopologicalGroup G]
    (K : ResidueLevel D) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (σ : D.FrobeniusElements K L hLK) :
    IsTopologicalGroup (D.frobeniusClosure K L hLK σ) := by
  change IsTopologicalGroup
    ↑((D.frobeniusClosure K L hLK σ).toSubgroup)
  infer_instance
 
abbrev frobeniusClosureCommGroup
    (D : DegreeData G) [IsTopologicalGroup G] [T2Space G]
    (K : ResidueLevel D) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
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
    (K : ResidueLevel D) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
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
    (K : ResidueLevel D) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (σ : D.FrobeniusElements K L hLK) :
    D.frobeniusClosure K L hLK σ →ₜ* ZHatMul :=
  (D.extensionNormalizedDegreeContinuous K L hLK).comp
    (continuousSubgroupSubtype
      (D.frobeniusClosure K L hLK σ).toSubgroup)
 
@[simp]
theorem frobeniusClosureDegree_generator (D : DegreeData G)
    [IsTopologicalGroup G]
    (K : ResidueLevel D) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
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
    (K : ResidueLevel D) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
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
    (K : ResidueLevel D) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
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
    (K : ResidueLevel D) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
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
    (K : ResidueLevel D) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
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
    (K : ResidueLevel D) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
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
    (K : ResidueLevel D) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
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
    (K : ResidueLevel D) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
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
    (K : ResidueLevel D) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
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

/- KummerAbelianCyclicFactors -/
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
    (K L : ClosedSubgroup G) (hLK : L ≤ K) :
    IsClosed (extensionSubgroup (G := G) K L hLK : Set K.toSubgroup) := by
  change IsClosed ((fun x : K.toSubgroup => (x : G)) ⁻¹' (L : Set G))
  exact L.isClosed'.preimage continuous_subtype_val
variable [IsTopologicalGroup G]
end ClosedCyclicSubextensions
end
end KummerTheory
end

/- KummerAbelianAssembly -/
section
namespace KummerTheory
open CyclicCohomology
noncomputable section
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]

@[simp]
theorem mem_extensionSubgroup_iff
    {G : Type*} [Group G] [TopologicalSpace G]
    (K L : ClosedSubgroup G) (hLK : L ≤ K)
    (k : K.toSubgroup) :
    k ∈ extensionSubgroup (G := G) K L hLK ↔ (k : G) ∈ L :=
  Iff.rfl
end
end KummerTheory
end

/- KummerDelta -/
section
namespace KummerTheory
open CyclicCohomology
noncomputable section
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]

def fixedCoefficients (A : Rep ℤ G) (H : ClosedSubgroup G) :
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

/- Norm -/
section
namespace ClassFormation
open KummerTheory
open CyclicCohomology
noncomputable section
open scoped BigOperators
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]

def relativeCosetAction
    (A : Rep ℤ G) (K L : ClosedSubgroup G)
    (hLK : L ≤ K)
    (a : fixedCoefficients A L)
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
    (hLK : L ≤ K)
    (a : fixedCoefficients A L) (k : K.toSubgroup) :
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
    (hLK : L ≤ K)
    [Finite (K.toSubgroup ⧸ extensionSubgroup K L hLK)]
    (a : fixedCoefficients A L) : A.V := by
  letI := Fintype.ofFinite (K.toSubgroup ⧸ extensionSubgroup K L hLK)
  exact ∑ q, relativeCosetAction A K L hLK a q
 
theorem relativeCosetAction_add
    (A : Rep ℤ G) (K L : ClosedSubgroup G)
    (hLK : L ≤ K)
    (a b : fixedCoefficients A L)
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
    (hLK : L ≤ K)
    (q : K.toSubgroup ⧸ extensionSubgroup K L hLK) :
    relativeCosetAction A K L hLK 0 q = 0 := by
  refine Quotient.inductionOn' q ?_
  intro k
  simp only [relativeCosetAction_mk]
  exact map_zero (A.ρ k.1)
 
theorem relativeNormValue_fixed
    (A : Rep ℤ G) (K L : ClosedSubgroup G)
    (hLK : L ≤ K)
    [Finite (K.toSubgroup ⧸ extensionSubgroup K L hLK)]
    (a : fixedCoefficients A L) (k : K.toSubgroup) :
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
    (hLK : L ≤ K)
    [Finite (K.toSubgroup ⧸ extensionSubgroup K L hLK)] :
    fixedCoefficients A L →+ fixedCoefficients A K where
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
    (hLK : L ≤ K)
    [Finite (K.toSubgroup ⧸ extensionSubgroup K L hLK)]
    (a : fixedCoefficients A L) :
    ((relativeNorm A K L hLK a : fixedCoefficients A K) : A.V) =
      relativeNormValue A K L hLK a :=
  rfl
end
end ClassFormation
end

/- Valuation -/
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
    fixedCoefficients A K →+
      fixedCoefficients A (baseField G) :=
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
   
  toAddMonoidHom : fixedCoefficients A (baseField G) →+ ZHat
   
  integers_mem : ∀ m : ℤ,
    (Int.castRingHom ZHat) m ∈
      toAddMonoidHom.range
   
  canonical_value_quotient_bijective : ∀ (n : ℕ) (hn : 0 < n),
    Function.Bijective
      (canonicalValueQuotientMap toAddMonoidHom.range n hn)
   
  norm_range : ∀ K : FiniteLevel G,
    (toAddMonoidHom.comp (normToBase A K.field)).range =
      nsmulImage toAddMonoidHom.range (K.residueDegree D : ℕ)
namespace ValuationData
variable {D : DegreeData G} {A : Rep ℤ G}
 
def valueGroup (v : ValuationData D A) : AddSubgroup ZHat :=
  v.toAddMonoidHom.range
 
def canonicalQuotientMap (v : ValuationData D A)
    (n : ℕ) (hn : 0 < n) :
    (v.valueGroup ⧸ nsmulWithin v.valueGroup n) →+ ZMod n :=
  canonicalValueQuotientMap v.valueGroup n hn

def cyclic_value_quotients (v : ValuationData D A)
    (n : ℕ) (hn : 0 < n) :
    (v.valueGroup ⧸ nsmulWithin v.valueGroup n) ≃+ ZMod n :=
  AddEquiv.ofBijective (v.canonicalQuotientMap n hn)
    (v.canonical_value_quotient_bijective n hn)
 
def valueModulo (v : ValuationData D A) (n : ℕ) (hn : 0 < n) :
    v.valueGroup →+ ZMod n :=
  (v.cyclic_value_quotients n hn).toAddMonoidHom.comp
    (QuotientAddGroup.mk' (nsmulWithin v.valueGroup n))
 
theorem valueModulo_surjective (v : ValuationData D A)
    (n : ℕ) (hn : 0 < n) :
    Function.Surjective (v.valueModulo n hn) := by
  intro z
  obtain ⟨q, rfl⟩ := (v.cyclic_value_quotients n hn).surjective z
  refine Quotient.inductionOn' q ?_
  intro a
  exact ⟨a, rfl⟩
 
def normCompositeAt (v : ValuationData D A) (K : FiniteLevel G) :
    fixedCoefficients A K.field →+ ZHat :=
  v.toAddMonoidHom.comp (normToBase A K.field)
 
theorem normCompositeAt_range (v : ValuationData D A) (K : FiniteLevel G) :
    (v.normCompositeAt K).range =
      nsmulImage v.valueGroup (K.residueDegree D : ℕ) :=
  v.norm_range K
 
def normCompositeAtInResidueImage (v : ValuationData D A)
    (K : FiniteLevel G) :
    fixedCoefficients A K.field →+
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
 
def dividedAt (v : ValuationData D A) (K : FiniteLevel G) :
    fixedCoefficients A K.field →+ ZHat :=
  (zHatDivide (K.residueDegree D : ℕ)
    (K.residueDegree D).property).toAddMonoidHom.comp
      (v.normCompositeAtInResidueImage K)

theorem residueDegree_nsmul_dividedAt (v : ValuationData D A)
    (K : FiniteLevel G)
    (a : fixedCoefficients A K.field) :
    (K.residueDegree D : ℕ) • v.dividedAt K a = v.normCompositeAt K a := by
  exact zHatMulNat_zHatDivide (K.residueDegree D : ℕ)
    (K.residueDegree D).property
    (v.normCompositeAtInResidueImage K a)
 
theorem dividedAt_mem_valueGroup (v : ValuationData D A)
    (K : FiniteLevel G)
    (a : fixedCoefficients A K.field) :
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

def valuationAt (v : ValuationData D A) (K : FiniteLevel G) :
    fixedCoefficients A K.field →+ v.valueGroup :=
  (v.dividedAt K).codRestrict v.valueGroup (fun a => v.dividedAt_mem_valueGroup K a)

theorem normalizedValuation_surjective (v : ValuationData D A)
    (K : FiniteLevel G) :
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

/- NormLaws -/
section
namespace ClassFormation
open KummerTheory
open CyclicCohomology
noncomputable section
open scoped BigOperators Pointwise
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]

def normalExtensionAction
    (A : Rep ℤ G) (K L : ClosedSubgroup G)
    (hLK : L ≤ K)
    (hnormal : (extensionSubgroup K L hLK).Normal)
    (k : K.toSubgroup) (a : fixedCoefficients A L) :
    fixedCoefficients A L := by
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
    (hLK : L ≤ K)
    (hnormal : (extensionSubgroup K L hLK).Normal)
    (k : K.toSubgroup) (a : fixedCoefficients A L) :
    ((normalExtensionAction A K L hLK hnormal k a : fixedCoefficients A L) : A.V) =
      A.ρ k.1 a.1 :=
  rfl

theorem relativeNorm_normalExtensionAction
    (A : Rep ℤ G) (K L : ClosedSubgroup G)
    (hLK : L ≤ K)
    (hnormal : (extensionSubgroup K L hLK).Normal)
    [Finite (K.toSubgroup ⧸ extensionSubgroup K L hLK)]
    (k : K.toSubgroup) (a : fixedCoefficients A L) :
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
    (hLK : L ≤ K)
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
    (hLK : L ≤ K)
    (a : fixedCoefficients A M)
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
    (hLK : L ≤ K)
    [Finite (K.toSubgroup ⧸ extensionSubgroup K L hLK)]
    [Finite (L.toSubgroup ⧸ extensionSubgroup L M hML)]
    (a : fixedCoefficients A M) :
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
          ((relativeNorm A L M hML a : fixedCoefficients A L) : A.V) :=
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
    (a : fixedCoefficients A T.top) :
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

/- ValuationLaws -/
section
namespace ClassFormation
open KummerTheory
open CyclicCohomology
noncomputable section
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
variable {D : DegreeData G} {A : Rep ℤ G}
namespace ValuationData

theorem normalizedValuation_tower (v : ValuationData D A)
    (E : LevelExtension G)
    (a : fixedCoefficients A E.field.field) :
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

/- PrimeElements -/
section
namespace ClassFormation
open KummerTheory
open CyclicCohomology
noncomputable section
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
variable {D : DegreeData G} {A : Rep ℤ G}
 
def fixedFieldInclusion (A : Rep ℤ G) (K L : ClosedSubgroup G)
    (hLK : L ≤ K) :
    fixedCoefficients A K →+ fixedCoefficients A L where
  toFun a := ⟨a.1, fun l => a.2 ⟨l.1, hLK l.2⟩⟩
  map_zero' := rfl
  map_add' _ _ := rfl

@[simp]
theorem fixedFieldInclusion_coe (A : Rep ℤ G) (K L : ClosedSubgroup G)
    (hLK : L ≤ K)
    (a : fixedCoefficients A K) :
    ((fixedFieldInclusion A K L hLK a : fixedCoefficients A L) : A.V) = a.1 :=
  rfl
 
theorem relativeNorm_fixedFieldInclusion
    (A : Rep ℤ G) (E : DegreeData.FiniteAbstractExtension G)
    (a : fixedCoefficients A E.base) :
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
 
@[simp]
theorem relativeNorm_self
    (A : Rep ℤ G) (K : ClosedSubgroup G)
    [Finite (K.toSubgroup ⧸ extensionSubgroup K K le_rfl)]
    (a : fixedCoefficients A K) :
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
 
@[simp]
theorem oneValue_coe (v : ValuationData D A) :
    (v.oneValue : ZHat) = 1 :=
  rfl
 
def IsPrimeElement (v : ValuationData D A) (K : FiniteLevel G)
    (π : fixedCoefficients A K.field) : Prop :=
  v.valuationAt K π = v.oneValue

def unitAddSubgroup (v : ValuationData D A) (K : FiniteLevel G) :
    AddSubgroup (fixedCoefficients A K.field) :=
  (v.valuationAt K).ker
 
@[simp]
theorem mem_unitAddSubgroup_iff (v : ValuationData D A)
    (K : FiniteLevel G)
    (u : fixedCoefficients A K.field) :
    u ∈ v.unitAddSubgroup K ↔ v.valuationAt K u = 0 :=
  Iff.rfl

theorem valuationAt_fixedFieldInclusion_of_unramified
    (v : ValuationData D A)
    (E : LevelExtension G)
    (hUn : E.IsUnramified D)
    (a : fixedCoefficients A E.base.field) :
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
          simpa [EF, LevelExtension.toFiniteAbstractExtension,
              LevelExtension.degree] using
                relativeNorm_fixedFieldInclusion A EF a]
    _ = (E.degree : ℕ) •
        ((v.valuationAt E.base a : v.valueGroup) : ZHat) := by
          exact congrArg Subtype.val
            (map_nsmul (v.valuationAt E.base) (E.degree : ℕ) a)
    _ = (E.residueDegree D : ℕ) •
        ((v.valuationAt E.base a : v.valueGroup) : ZHat) := by
          rw [hfeq]
 
theorem prime_of_unramified (v : ValuationData D A)
    (E : LevelExtension G)
    (hUn : E.IsUnramified D)
    (π : fixedCoefficients A E.base.field)
    (hπ : v.IsPrimeElement E.base π) :
    v.IsPrimeElement E.field
      (fixedFieldInclusion A E.base.field E.field.field E.below π) := by
  rw [IsPrimeElement,
    v.valuationAt_fixedFieldInclusion_of_unramified E hUn π]
  exact hπ
 
theorem norm_prime_of_totallyRamified (v : ValuationData D A)
    (E : LevelExtension G)
    (hTot : E.IsTotallyRamified D)
    (π : fixedCoefficients A E.field.field) :
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

/- UnitCohomologyAxiom -/
section
namespace ClassFormation
open KummerTheory
open CyclicCohomology
noncomputable section
open CategoryTheory
universe u
section Generic
variable {G : Type u} [Group G] [TopologicalSpace G]

structure CyclicExtension (K : FiniteLevel G) where
   
  field : ClosedSubgroup G
   
  below : field.toSubgroup ≤ K.field.toSubgroup
   
  normal : (extensionSubgroup K.field field below).Normal
   
  finite : Finite (K.field.toSubgroup ⧸
    extensionSubgroup K.field field below)
   
  generator : K.field.toSubgroup ⧸ extensionSubgroup K.field field below
   
  generates : ∀ x, x ∈ Subgroup.zpowers generator
namespace CyclicExtension
variable {K : FiniteLevel G}

abbrev toFiniteAbstractExtension (E : CyclicExtension K) :
    DegreeData.FiniteAbstractExtension G where
  field := E.field
  base := K.field
  below := E.below
  finiteQuotient := E.finite
 
def IsUnramified (E : CyclicExtension K) (D : DegreeData G) : Prop :=
  E.toFiniteAbstractExtension.IsUnramified D
 
def IsTotallyRamified (E : CyclicExtension K)
    (D : DegreeData G) : Prop :=
  E.toFiniteAbstractExtension.IsTotallyRamified D

noncomputable abbrev toLevelExtension
    (E : CyclicExtension K) : LevelExtension G := by
  letI : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field E.field E.below) :=
    E.finite
  exact LevelExtension.ofInclusion E.field K E.below
 
instance (E : CyclicExtension K) :
    (extensionSubgroup K.field E.field E.below).Normal :=
  E.normal
 
instance (E : CyclicExtension K) :
    Finite (K.field.toSubgroup ⧸ extensionSubgroup K.field E.field E.below) :=
  E.finite
 
noncomputable instance (E : CyclicExtension K) :
    Fintype (K.field.toSubgroup ⧸ extensionSubgroup K.field E.field E.below) :=
  Fintype.ofFinite _
end CyclicExtension
end Generic
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
variable {D : DegreeData G} {A : Rep ℤ G}

structure FiniteUnramifiedCyclicExtension
    (D : DegreeData G) (K : FiniteLevel G)
    extends CyclicExtension K where
   
  unramified : toCyclicExtension.IsUnramified D
namespace FiniteUnramifiedCyclicExtension
variable {K : FiniteLevel G}

noncomputable abbrev toLevelExtension
    (E : FiniteUnramifiedCyclicExtension D K) :
    LevelExtension G :=
  E.toCyclicExtension.toLevelExtension

theorem toLevelExtension_isUnramified
    (E : FiniteUnramifiedCyclicExtension D K) :
    E.toLevelExtension.IsUnramified D := by
  exact E.unramified
 
instance (E : FiniteUnramifiedCyclicExtension D K) :
    (extensionSubgroup K.field E.field E.below).Normal :=
  E.normal
 
instance (E : FiniteUnramifiedCyclicExtension D K) :
    Finite (K.field.toSubgroup ⧸ extensionSubgroup K.field E.field E.below) :=
  E.finite
 
noncomputable instance (E : FiniteUnramifiedCyclicExtension D K) :
    Fintype (K.field.toSubgroup ⧸ extensionSubgroup K.field E.field E.below) :=
  Fintype.ofFinite _
end FiniteUnramifiedCyclicExtension
namespace CyclicExtension
variable {K : FiniteLevel G}

noncomputable def fixedRepresentation (E : CyclicExtension K)
    (A : Rep ℤ G) :
    Rep ℤ (K.field.toSubgroup ⧸ extensionSubgroup K.field E.field E.below) :=
  extensionFixedRepresentation A K.field E.field E.below E.normal
end CyclicExtension

theorem exists_norm_eq_of_tateHZero_isZero
    {Q : IntegralRepGroupType} [Group Q] [Fintype Q]
    (M : Rep ℤ Q) (g : Q) (hg : ∀ x, x ∈ Subgroup.zpowers g)
    (hzero : Limits.IsZero (tateCohomology M 0)) :
    ∀ x : M.V, M.ρ g x = x → ∃ y : M.V, M.norm.hom y = x := by
  let : IsCyclic Q := isCyclic_of_generator g hg
  let : CommGroup Q := IsCyclic.commGroup (α := Q)
  let S := Rep.FiniteCyclicGroup.normHomCompSub M g
  have hSzero : Limits.IsZero S.homology := by
    exact Limits.IsZero.of_iso hzero
      (TateCohomology.isoFiniteCyclicZero M g hg).symm
  have hS : S.Exact := (S.exact_iff_isZero_homology).2 hSzero
  intro x hx
  have hxker : S.g x = 0 := by
    change M.ρ g x - x = 0
    exact sub_eq_zero.mpr hx
  rcases (S.moduleCat_exact_iff.mp hS x hxker) with ⟨y, hy⟩
  exact ⟨y, hy⟩
namespace ValuationData

theorem valuationAt_normalExtensionAction
    (v : ValuationData D A) (E : LevelExtension G)
    (hnormal : (extensionSubgroup E.base.field E.field.field E.below).Normal)
    (k : E.base.field.toSubgroup)
    (a : fixedCoefficients A E.field.field) :
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
    (v : ValuationData D A) (E : LevelExtension G)
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
 
noncomputable def unitRepresentationOverK
    (v : ValuationData D A) (E : LevelExtension G)
    (hnormal : (extensionSubgroup E.base.field E.field.field E.below).Normal) :
    Rep ℤ E.base.field.toSubgroup :=
  Rep.of
    { toFun := fun k => v.unitActionLinearMap E hnormal k
      map_one' := by
        ext u
        change A.ρ (1 : G) u.1.1 = u.1.1
        simp
      map_mul' := by
        intro k₁ k₂
        ext u
        change A.ρ (k₁.1 * k₂.1) u.1.1 =
          A.ρ k₁.1 (A.ρ k₂.1 u.1.1)
        rw [map_mul]
        rfl }
private theorem unitRepresentationOverK_isTrivialOnExtension
    (v : ValuationData D A) (E : LevelExtension G)
    (hnormal : (extensionSubgroup E.base.field E.field.field E.below).Normal) :
    Representation.IsTrivial
      ((v.unitRepresentationOverK E hnormal).ρ.comp
        (extensionSubgroup E.base.field E.field.field E.below).subtype) := by
  constructor
  intro s
  ext u
  apply Subtype.ext
  apply Subtype.ext
  change A.ρ s.1.1 u.1.1 = u.1.1
  exact u.1.2
    ⟨s.1.1, (mem_extensionSubgroup_iff E.base.field E.field.field E.below s.1).1 s.2⟩
 
noncomputable def unitRepresentation
    (v : ValuationData D A) (E : LevelExtension G)
    (hnormal : (extensionSubgroup E.base.field E.field.field E.below).Normal) :
    Rep ℤ (E.base.field.toSubgroup ⧸
      extensionSubgroup E.base.field E.field.field E.below) := by
  letI := hnormal
  letI : Representation.IsTrivial
      ((v.unitRepresentationOverK E hnormal).ρ.comp
        (extensionSubgroup E.base.field E.field.field E.below).subtype) :=
    v.unitRepresentationOverK_isTrivialOnExtension E hnormal
  exact (v.unitRepresentationOverK E hnormal).ofQuotient
    (extensionSubgroup E.base.field E.field.field E.below)
end ValuationData
namespace FiniteUnramifiedCyclicExtension
variable {K : FiniteLevel G}

noncomputable def unitRepresentation
    (E : FiniteUnramifiedCyclicExtension D K) (v : ValuationData D A) :
    Rep ℤ (K.field.toSubgroup ⧸ extensionSubgroup K.field E.field E.below) :=
  v.unitRepresentation E.toLevelExtension E.normal
end FiniteUnramifiedCyclicExtension
namespace ValuationData
 
def unitInclusion
    (v : ValuationData D A) (E : LevelExtension G)
    (hUnramified : E.IsUnramified D) :
    v.unitAddSubgroup E.base →+ v.unitAddSubgroup E.field where
  toFun u := ⟨fixedFieldInclusion A E.base.field E.field.field E.below u.1, by
    rw [mem_unitAddSubgroup_iff]
    exact (v.valuationAt_fixedFieldInclusion_of_unramified E hUnramified u.1).trans
      u.2⟩
  map_zero' := by
    apply Subtype.ext
    rfl
  map_add' _ _ := by
    apply Subtype.ext
    rfl

theorem unitRepresentation_action_coe
    (v : ValuationData D A) (E : LevelExtension G)
    (hnormal : (extensionSubgroup E.base.field E.field.field E.below).Normal)
    (q : E.base.field.toSubgroup ⧸
      extensionSubgroup E.base.field E.field.field E.below)
    (u : v.unitAddSubgroup E.field) :
    (((v.unitRepresentation E hnormal).ρ q u).1 :
        fixedCoefficients A E.field.field).1 =
      relativeCosetAction A E.base.field E.field.field E.below u.1 q := by
  refine Quotient.inductionOn' q ?_
  intro k
  rw [relativeCosetAction_mk]
  rfl

theorem unitRepresentation_norm_coe
    (v : ValuationData D A) (E : LevelExtension G)
    (hnormal : (extensionSubgroup E.base.field E.field.field E.below).Normal)
    (u : v.unitAddSubgroup E.field) :
    letI := Fintype.ofFinite
      (E.base.field.toSubgroup ⧸
        extensionSubgroup E.base.field E.field.field E.below)
    ((((v.unitRepresentation E hnormal).norm.hom u).1 :
        fixedCoefficients A E.field.field) : A.V) =
      ((relativeNorm A E.base.field E.field.field E.below u.1 :
        fixedCoefficients A E.base.field) : A.V) := by
  let := Fintype.ofFinite
    (E.base.field.toSubgroup ⧸
      extensionSubgroup E.base.field E.field.field E.below)
  rw [relativeNorm_apply_coe]
  change
    (((Representation.norm (v.unitRepresentation E hnormal).ρ) u).1 :
      fixedCoefficients A E.field.field).1 =
      relativeNormValue A E.base.field E.field.field E.below u.1
  rw [Representation.norm, relativeNormValue]
  let coeToAmbient : v.unitAddSubgroup E.field →+ A.V :=
    (fixedCoefficients A E.field.field).subtype.comp
      (v.unitAddSubgroup E.field).subtype
  change coeToAmbient
      ((∑ q, (v.unitRepresentation E hnormal).ρ q) u) =
    ∑ q, relativeCosetAction A E.base.field E.field.field E.below u.1 q
  refine (congrArg coeToAmbient (LinearMap.sum_apply Finset.univ
    (fun q : E.base.field.toSubgroup ⧸
        extensionSubgroup E.base.field E.field.field E.below =>
      (v.unitRepresentation E hnormal).ρ q) u)).trans ?_
  refine (map_sum coeToAmbient _ _).trans ?_
  apply Finset.sum_congr rfl
  intro q _
  exact v.unitRepresentation_action_coe E hnormal q u

theorem exists_unit_relativeNorm_eq_of_tateHZero_isZero
    (v : ValuationData D A) (E : LevelExtension G)
    (hnormal : (extensionSubgroup E.base.field E.field.field E.below).Normal)
    (hUnramified : E.IsUnramified D)
    (g : E.base.field.toSubgroup ⧸
      extensionSubgroup E.base.field E.field.field E.below)
    (hg : ∀ x, x ∈ Subgroup.zpowers g) :
    letI := Fintype.ofFinite
      (E.base.field.toSubgroup ⧸
        extensionSubgroup E.base.field E.field.field E.below)
    Limits.IsZero
        (tateCohomology (v.unitRepresentation E hnormal) 0) →
      ∀ u : v.unitAddSubgroup E.base, ∃ ε : v.unitAddSubgroup E.field,
        relativeNorm A E.base.field E.field.field E.below ε.1 = u.1 := by
  let := Fintype.ofFinite
    (E.base.field.toSubgroup ⧸
      extensionSubgroup E.base.field E.field.field E.below)
  intro hzero u
  let U := v.unitRepresentation E hnormal
  let uL := v.unitInclusion E hUnramified u
  have hfixed : U.ρ g uL = uL := by
    refine Quotient.inductionOn' g ?_
    intro k
    apply Subtype.ext
    apply Subtype.ext
    change A.ρ k.1 u.1.1 = u.1.1
    exact u.1.2 k
  obtain ⟨ε, hε⟩ := exists_norm_eq_of_tateHZero_isZero
    U g hg hzero uL hfixed
  refine ⟨ε, ?_⟩
  apply Subtype.ext
  calc
    ((relativeNorm A E.base.field E.field.field E.below ε.1 :
        fixedCoefficients A E.base.field) : A.V) =
        ((((v.unitRepresentation E hnormal).norm.hom ε).1 :
          fixedCoefficients A E.field.field) : A.V) :=
      (v.unitRepresentation_norm_coe E hnormal ε).symm
    _ = ((uL.1 : fixedCoefficients A E.field.field) : A.V) :=
      congrArg
        (fun z : v.unitAddSubgroup E.field =>
          ((z.1 : fixedCoefficients A E.field.field) : A.V)) hε
    _ = u.1.1 := rfl

def SatisfiesUnramifiedUnitCohomology
    (D : DegreeData G) (v : ValuationData D A) : Prop :=
  ∀ (K : FiniteLevel G)
    (E : FiniteUnramifiedCyclicExtension D K),
    Limits.IsZero (tateCohomology (E.unitRepresentation v) 0) ∧
      Limits.IsZero (tateCohomology (E.unitRepresentation v) (-1))
end ValuationData
end
end ClassFormation
end

/- ClassFieldAxiom -/
section
namespace ClassFormation
open CyclicCohomology
noncomputable section
open CategoryTheory
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]

structure ClassFieldAxiomCohomologyData (A : Rep ℤ G)
    (K : FiniteLevel G) (E : CyclicExtension K) : Prop where
   
  finiteTateHZero : Finite (tateCohomology (E.fixedRepresentation A) 0)
   
  finiteTateHMinusOne :
    Finite (tateCohomology (E.fixedRepresentation A) (-1))
   
  tateHZero_card :
    Nat.card (tateCohomology (E.fixedRepresentation A) 0) =
      (E.toFiniteAbstractExtension.degree : ℕ)
   
  tateHMinusOne_card :
    Nat.card (tateCohomology (E.fixedRepresentation A) (-1)) = 1

def SatisfiesClassFieldAxiom (A : Rep ℤ G) : Prop :=
  ∀ (K : FiniteLevel G) (E : CyclicExtension K),
    ClassFieldAxiomCohomologyData A K E
namespace SatisfiesClassFieldAxiom
variable {A : Rep ℤ G}

theorem tateHZero_card
    (hcf : SatisfiesClassFieldAxiom A)
    (K : FiniteLevel G) (E : CyclicExtension K) :
    Nat.card (tateCohomology (E.fixedRepresentation A) 0) =
      (E.toFiniteAbstractExtension.degree : ℕ) :=
  (hcf K E).tateHZero_card

theorem tateHMinusOne_card
    (hcf : SatisfiesClassFieldAxiom A)
    (K : FiniteLevel G) (E : CyclicExtension K) :
    Nat.card (tateCohomology (E.fixedRepresentation A) (-1)) = 1 :=
  (hcf K E).tateHMinusOne_card

theorem tateHMinusOne_isZero
    (hcf : SatisfiesClassFieldAxiom A)
    (K : FiniteLevel G) (E : CyclicExtension K) :
    Limits.IsZero (tateCohomology (E.fixedRepresentation A) (-1)) := by
  let H := tateCohomology (E.fixedRepresentation A) (-1)
  let : Finite H := (hcf K E).finiteTateHMinusOne
  have hcard : Nat.card H = 1 := by
    simpa [H] using hcf.tateHMinusOne_card K E
  let : Subsingleton H := (Nat.card_eq_one_iff_unique.mp hcard).1
  exact ModuleCat.isZero_of_subsingleton H
end SatisfiesClassFieldAxiom
end
end ClassFormation
end

/- FrobeniusField -/
section
namespace ClassFormation
open CyclicCohomology
noncomputable section
variable {G : Type*} [Group G] [TopologicalSpace G]
namespace DegreeData

def frobeniusFixedSubgroupWithin (D : DegreeData G) [IsTopologicalGroup G]
    (K : ResidueLevel D) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (σ : D.FrobeniusElements K L hLK) : Subgroup K.field.toSubgroup :=
  (D.frobeniusClosure K L hLK σ).toSubgroup.comap
    (QuotientGroup.mk' (D.extensionInertiaWithin K.field L hLK))

@[simp]
theorem mem_frobeniusFixedSubgroupWithin_iff (D : DegreeData G)
    [IsTopologicalGroup G]
    (K : ResidueLevel D) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (σ : D.FrobeniusElements K L hLK) (k : K.field.toSubgroup) :
    k ∈ D.frobeniusFixedSubgroupWithin K L hLK σ ↔
      QuotientGroup.mk k ∈
        (D.frobeniusClosure K L hLK σ).toSubgroup :=
  Iff.rfl
 
theorem frobeniusFixedSubgroupWithin_isClosed (D : DegreeData G)
    [IsTopologicalGroup G]
    (K : ResidueLevel D) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
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
    (K : ResidueLevel D) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
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
    (K : ResidueLevel D) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (σ : D.FrobeniusElements K L hLK) (g : G) :
    g ∈ D.frobeniusFixedField K L hLK σ ↔
      ∃ k : K.field.toSubgroup,
        k ∈ D.frobeniusFixedSubgroupWithin K L hLK σ ∧ k.1 = g := by
  rfl
 
theorem frobeniusFixedField_le (D : DegreeData G) [IsTopologicalGroup G]
    (K : ResidueLevel D) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (σ : D.FrobeniusElements K L hLK) :
    (D.frobeniusFixedField K L hLK σ).toSubgroup ≤ K.field.toSubgroup := by
  rintro g ⟨k, _, rfl⟩
  exact k.2

theorem extensionSubgroup_frobeniusFixedField (D : DegreeData G)
    [IsTopologicalGroup G]
    (K : ResidueLevel D) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
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
    (K : ResidueLevel D) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
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
    (K : ResidueLevel D) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
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
    (K : ResidueLevel D) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
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
 
def frobeniusFixedFiniteExtension (D : DegreeData G)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    (K : ResidueLevel D) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    [hLfinite : Finite (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK)]
    (σ : D.FrobeniusElements K L hLK) :
    FiniteAbstractExtension G where
  field := D.frobeniusFixedField K L hLK σ
  base := K.field
  below := D.frobeniusFixedField_le K L hLK σ
  finiteQuotient := D.frobeniusFixedField_finite K L hLK σ

theorem frobeniusFixedSubgroupWithin_inf_fieldInertiaWithin
    (D : DegreeData G)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    [TotallyDisconnectedSpace G]
    (K : ResidueLevel D) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
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
    (K : ResidueLevel D) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
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

theorem frobeniusFixedSubgroupWithin_normalizedDegree_image
    (D : DegreeData G) [IsTopologicalGroup G]
    (K : ResidueLevel D) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
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
    (K : ResidueLevel D) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
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

theorem frobeniusFixedField_residueDegreeOverBase (D : DegreeData G)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    (K : ResidueLevel D) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    [hLfinite : Finite (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK)]
    (σ : D.FrobeniusElements K L hLK) :
    ((D.frobeniusFixedFiniteExtension K L hLK σ).residueDegree D : ℕ) =
      D.frobeniusExponent K L hLK σ := by
  let E := D.frobeniusFixedFiniteExtension K L hLK σ
  rw [← E.mapped_relIndex_eq_residueDegree D]
  simpa [E, frobeniusFixedFiniteExtension] using
    D.frobeniusFixedField_mappedRelIndex K L hLK σ

theorem frobeniusFixedField_relativeResidueQuotientFinite
    (D : DegreeData G)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    (K : ResidueLevel D) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
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
    (K : ResidueLevel D) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (σ : D.FrobeniusElements K L hLK) :
    ResidueLevel D := by
  letI := D.frobeniusFixedField_relativeResidueQuotientFinite K L hLK σ
  exact ResidueLevel.ofRelativeInclusion D
    (D.frobeniusFixedField K L hLK σ) K
    (D.frobeniusFixedField_le K L hLK σ)

theorem frobeniusFixedResidueField_residueDegree (D : DegreeData G)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    (K : ResidueLevel D) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
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

/- NormSubgroup -/
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
    {L K : ClosedSubgroup G} (hLK : L ≤ K) :
    (D.maximalUnramifiedField L).toSubgroup ≤ K.toSubgroup :=
  (D.maximalUnramifiedField_le L).trans hLK

theorem extensionSubgroup_maximalUnramifiedField (D : DegreeData G)
    (K L : ClosedSubgroup G) (hLK : L ≤ K) :
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
    (K L : ClosedSubgroup G) (hLK : L ≤ K)
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

/- PrimeChoice -/
section
namespace ClassFormation
open KummerTheory
open CyclicCohomology
noncomputable section
namespace ValuationData
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
variable {D : DegreeData G} {A : Rep ℤ G}

def chosenPrimeElement (v : ValuationData D A) (K : FiniteLevel G) :
    fixedCoefficients A K.field :=
  Classical.choose (v.normalizedValuation_surjective K v.oneValue)
 
@[simp]
theorem valuationAt_chosenPrimeElement (v : ValuationData D A)
    (K : FiniteLevel G) :
    v.valuationAt K (v.chosenPrimeElement K) = v.oneValue :=
  Classical.choose_spec (v.normalizedValuation_surjective K v.oneValue)
 
theorem chosenPrimeElement_isPrime (v : ValuationData D A)
    (K : FiniteLevel G) :
    v.IsPrimeElement K (v.chosenPrimeElement K) :=
  v.valuationAt_chosenPrimeElement K
end ValuationData
end
end ClassFormation
end

/- ReciprocityDefinition -/
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
    (K : ResidueLevel D) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
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
    (K : FiniteLevel G) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    [hLfinite : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK)]
    (σ : D.FrobeniusElements (K.toResidueLevel D) L hLK
      (hLnormal := by
        simpa only [FiniteLevel.toResidueLevel] using hLnormal)) :
    Finite ((baseField G).toSubgroup ⧸
      extensionSubgroup (baseField G)
        (D.frobeniusFixedField (K.toResidueLevel D) L hLK
          (hLnormal := by
            simpa only [FiniteLevel.toResidueLevel] using hLnormal) σ)
        (le_baseField
          (D.frobeniusFixedField (K.toResidueLevel D) L hLK
            (hLnormal := by
              simpa only [FiniteLevel.toResidueLevel] using hLnormal) σ))) := by
  let KR := K.toResidueLevel D
  let hLnormalKR : (extensionSubgroup KR.field L hLK).Normal := by
    simpa only [KR, FiniteLevel.toResidueLevel] using hLnormal
  let hLfiniteKR : Finite
      (KR.field.toSubgroup ⧸ extensionSubgroup KR.field L hLK) := by
    simpa only [KR, FiniteLevel.toResidueLevel] using hLfinite
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

/- ReciprocityIndependence -/
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

theorem quotient_generator_of_unramified_degree_one (D : DegreeData G)
    (K : ResidueLevel D) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
    [hnormal : (extensionSubgroup K.field L hLK).Normal]
    [hfinite : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK)]
    (hUnramified :
      (DegreeData.AbstractExtension.mk L K.field hLK).IsUnramified D)
    (φ : K.field.toSubgroup)
    (hφ : D.normalizedDegree K φ =
      Multiplicative.ofAdd (1 : ZHat)) :
    ∀ x : K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK,
      x ∈ Subgroup.zpowers (QuotientGroup.mk φ) := by
  intro x
  obtain ⟨q, hqx⟩ := D.frobeniusRestriction_surjective K L hLK x
  obtain ⟨n, _hn, hdegree⟩ := q.2
  let t : K.field.toSubgroup := Quotient.out q.1
  have htq :
      (QuotientGroup.mk t :
        K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK) = q.1 :=
    Quotient.out_eq' q.1
  have hdt : D.normalizedDegree K t =
      (Multiplicative.ofAdd (1 : ZHat)) ^ n := by
    calc
      D.normalizedDegree K t =
          D.extensionNormalizedDegree K L hLK
            (QuotientGroup.mk t) := rfl
      _ = D.extensionNormalizedDegree K L hLK q.1 :=
        congrArg (D.extensionNormalizedDegree K L hLK) htq
      _ = _ := hdegree
  let z : K.field.toSubgroup := t⁻¹ * φ ^ n
  have hzI : z ∈ D.fieldInertiaWithin K.field := by
    rw [← D.normalizedDegree_ker K]
    change D.normalizedDegree K z = 1
    calc
      D.normalizedDegree K z =
          (D.normalizedDegree K t)⁻¹ *
            (D.normalizedDegree K φ) ^ n := by
        simp [z, map_mul, map_inv, map_pow]
      _ = ((Multiplicative.ofAdd (1 : ZHat)) ^ n)⁻¹ *
            (Multiplicative.ofAdd (1 : ZHat)) ^ n := by
        rw [hdt, hφ]
      _ = 1 := by simp
  have hzL : z.1 ∈ L.toSubgroup :=
    ((DegreeData.AbstractExtension.mk L K.field hLK).isUnramified_iff_inertia_le D).1
      hUnramified ⟨z.2, hzI⟩
  have hzE : z ∈ extensionSubgroup K.field L hLK :=
    (mem_extensionSubgroup_iff K.field L hLK z).2 hzL
  have htgen :
      (QuotientGroup.mk t : K.field.toSubgroup ⧸
        extensionSubgroup K.field L hLK) = (QuotientGroup.mk φ) ^ n := by
    apply QuotientGroup.eq.mpr
    simpa [z] using hzE
  have htx :
      (QuotientGroup.mk t : K.field.toSubgroup ⧸
        extensionSubgroup K.field L hLK) = x := by
    calc
      QuotientGroup.mk t = D.extensionRestriction K.field L hLK
          (QuotientGroup.mk t) := rfl
      _ = D.extensionRestriction K.field L hLK q.1 :=
        congrArg (D.extensionRestriction K.field L hLK) htq
      _ = x := hqx
  have hxpow : x = (QuotientGroup.mk φ) ^ n := htx.symm.trans htgen
  rw [hxpow]
  exact Subgroup.mem_zpowers_iff.mpr ⟨(n : ℤ), by simp⟩

theorem exists_quotient_generator_of_unramified
    (D : DegreeData G) (K : ResidueLevel D)
    (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
    [hnormal : (extensionSubgroup K.field L hLK).Normal]
    [hfinite : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK)]
    (hUnramified :
      (DegreeData.AbstractExtension.mk L K.field hLK).IsUnramified D) :
    ∃ g : K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK,
      ∀ x, x ∈ Subgroup.zpowers g := by
  obtain ⟨φ, hφ⟩ := D.normalizedDegree_surjective K
    (Multiplicative.ofAdd (1 : ZHat))
  refine ⟨QuotientGroup.mk φ, ?_⟩
  exact D.quotient_generator_of_unramified_degree_one
    K L hLK hUnramified φ hφ
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

/- FiniteIntermediateCompositum -/
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

/- FiniteNormQuotient -/
section
universe u
namespace ClassFormation
open KummerTheory
open CyclicCohomology
noncomputable section
section finiteNorms
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
 
def finiteNormSubgroup (A : Rep ℤ G) (K L : ClosedSubgroup G)
    (hLK : L ≤ K)
    [Finite (K.toSubgroup ⧸ extensionSubgroup K L hLK)] :
    AddSubgroup (fixedCoefficients A K) :=
  (relativeNorm A K L hLK).range

def FiniteNormQuotient (A : Rep ℤ G) (K L : ClosedSubgroup G)
    (hLK : L ≤ K)
    [Finite (K.toSubgroup ⧸ extensionSubgroup K L hLK)] :=
  fixedCoefficients A K ⧸ finiteNormSubgroup A K L hLK

instance finiteNormQuotientAddCommGroup
    (A : Rep ℤ G) (K L : ClosedSubgroup G)
    (hLK : L ≤ K)
    [Finite (K.toSubgroup ⧸ extensionSubgroup K L hLK)] :
    AddCommGroup (FiniteNormQuotient A K L hLK) := by
  unfold FiniteNormQuotient
  infer_instance

def finiteNormQuotientConcreteEquiv
    (A : Rep ℤ G) (K L : ClosedSubgroup G)
    (hLK : L ≤ K)
    [Finite (K.toSubgroup ⧸ extensionSubgroup K L hLK)] :
    FiniteNormQuotient A K L hLK ≃+
      fixedCoefficients A K ⧸ finiteNormSubgroup A K L hLK := by
  unfold FiniteNormQuotient
  exact AddEquiv.refl _
 
def finiteNormClassHom
    (A : Rep ℤ G) (K L : ClosedSubgroup G)
    (hLK : L ≤ K)
    [Finite (K.toSubgroup ⧸ extensionSubgroup K L hLK)] :
    fixedCoefficients A K →+ FiniteNormQuotient A K L hLK := by
  unfold FiniteNormQuotient
  exact QuotientAddGroup.mk' (finiteNormSubgroup A K L hLK)
 
def finiteNormClass
    (A : Rep ℤ G) (K L : ClosedSubgroup G)
    (hLK : L ≤ K)
    [Finite (K.toSubgroup ⧸ extensionSubgroup K L hLK)]
    (a : fixedCoefficients A K) :
    FiniteNormQuotient A K L hLK :=
  finiteNormClassHom A K L hLK a
 
@[simp]
theorem finiteNormClass_nsmul
    (A : Rep ℤ G) (K L : ClosedSubgroup G)
    (hLK : L ≤ K)
    [Finite (K.toSubgroup ⧸ extensionSubgroup K L hLK)]
    (n : ℕ) (a : fixedCoefficients A K) :
    finiteNormClass A K L hLK (n • a) =
      n • finiteNormClass A K L hLK a := by
  exact map_nsmul (finiteNormClassHom A K L hLK) n a
 
@[simp]
theorem finiteNormClass_eq_zero_iff
    (A : Rep ℤ G) (K L : ClosedSubgroup G)
    (hLK : L ≤ K)
    [Finite (K.toSubgroup ⧸ extensionSubgroup K L hLK)]
    (a : fixedCoefficients A K) :
    finiteNormClass A K L hLK a = 0 ↔
      a ∈ finiteNormSubgroup A K L hLK := by
  unfold finiteNormClass finiteNormClassHom FiniteNormQuotient
  exact QuotientAddGroup.eq_zero_iff _
 
theorem finiteNormClass_surjective
    (A : Rep ℤ G) (K L : ClosedSubgroup G)
    (hLK : L ≤ K)
    [Finite (K.toSubgroup ⧸ extensionSubgroup K L hLK)] :
    Function.Surjective (finiteNormClass A K L hLK) := by
  intro q
  change fixedCoefficients A K ⧸
    finiteNormSubgroup A K L hLK at q
  obtain ⟨a, rfl⟩ := QuotientAddGroup.mk'_surjective
    (finiteNormSubgroup A K L hLK) q
  exact ⟨a, rfl⟩

theorem FiniteNormQuotient.induction_on
    (A : Rep ℤ G) (K L : ClosedSubgroup G)
    (hLK : L ≤ K)
    [Finite (K.toSubgroup ⧸ extensionSubgroup K L hLK)]
    {motive : FiniteNormQuotient A K L hLK → Prop}
    (q : FiniteNormQuotient A K L hLK)
    (h : ∀ a, motive (finiteNormClass A K L hLK a)) : motive q := by
  obtain ⟨a, rfl⟩ := finiteNormClass_surjective A K L hLK q
  exact h a
 
def finiteNormQuotientLift
    {B : Type*} [AddCommGroup B]
    (A : Rep ℤ G) (K L : ClosedSubgroup G)
    (hLK : L ≤ K)
    [Finite (K.toSubgroup ⧸ extensionSubgroup K L hLK)]
    (f : fixedCoefficients A K →+ B)
    (hf : finiteNormSubgroup A K L hLK ≤ f.ker) :
    FiniteNormQuotient A K L hLK →+ B := by
  unfold FiniteNormQuotient
  exact QuotientAddGroup.lift (finiteNormSubgroup A K L hLK) f hf
 
@[simp]
theorem finiteNormQuotientLift_finiteNormClass
    {B : Type*} [AddCommGroup B]
    (A : Rep ℤ G) (K L : ClosedSubgroup G)
    (hLK : L ≤ K)
    [Finite (K.toSubgroup ⧸ extensionSubgroup K L hLK)]
    (f : fixedCoefficients A K →+ B)
    (hf : finiteNormSubgroup A K L hLK ≤ f.ker)
    (a : fixedCoefficients A K) :
    finiteNormQuotientLift A K L hLK f hf
        (finiteNormClass A K L hLK a) = f a := by
  rfl
end finiteNorms
section finiteIntermediateField
variable {G : Type u} [Group G] [TopologicalSpace G]
namespace DegreeData
 
def fieldAsMaximalUnramifiedIntermediate (D : DegreeData G)
    (K L : ClosedSubgroup G) (hLK : L ≤ K)
    [hfinite : Finite (K.toSubgroup ⧸ extensionSubgroup K L hLK)] :
    FiniteIntermediateField (D.maximalUnramifiedField L) K where
  field := L
  above := D.maximalUnramifiedField_le L
  below := hLK
  finite := hfinite
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

/- FiniteGaloisSubextension -/
section
namespace ClassFormation
open KummerTheory
open CyclicCohomology
noncomputable section
universe u
section GroupOnly
variable {G : Type u} [Group G] [TopologicalSpace G]
 
structure GaloisExtension (K : ClosedSubgroup G) where
   
  field : ClosedSubgroup G
   
  below : field.toSubgroup ≤ K.toSubgroup
   
  normal : (extensionSubgroup K field below).Normal
   
  finite : Finite (K.toSubgroup ⧸ extensionSubgroup K field below)
namespace GaloisExtension
variable {K : ClosedSubgroup G}
 
def toGaloisSubextension (L : GaloisExtension K) :
    DegreeData.GaloisSubextension K where
  field := L.field
  below := L.below
  normal := L.normal

def toFiniteAbstractExtension (L : GaloisExtension K) :
    DegreeData.FiniteAbstractExtension G where
  field := L.field
  base := K
  below := L.below
  finiteQuotient := L.finite

def extensionQuotient (L : GaloisExtension K) : Type u :=
  K.toSubgroup ⧸ extensionSubgroup K L.field L.below
 
def IsTotallyRamified (L : GaloisExtension K)
    (D : DegreeData G) : Prop :=
  L.toFiniteAbstractExtension.IsTotallyRamified D
 
instance extensionSubgroup_normalInstance (L : GaloisExtension K) :
    (extensionSubgroup K L.field L.below).Normal :=
  L.normal

instance extensionQuotient_groupInstance (L : GaloisExtension K) :
    Group L.extensionQuotient := by
  change Group
    (K.toSubgroup ⧸ extensionSubgroup K L.field L.below)
  infer_instance
 
instance extensionQuotient_finiteInstance (L : GaloisExtension K) :
    Finite L.extensionQuotient :=
  L.finite

def extensionQuotientMulEquiv (L : GaloisExtension K) :
    L.extensionQuotient ≃*
      (K.toSubgroup ⧸ extensionSubgroup K L.field L.below) :=
  MulEquiv.refl _
 
def extensionQuotientMk (L : GaloisExtension K) :
    K.toSubgroup →* L.extensionQuotient :=
  QuotientGroup.mk' (extensionSubgroup K L.field L.below)
 
@[simp]
theorem extensionQuotientMk_apply (L : GaloisExtension K)
    (k : K.toSubgroup) :
    L.extensionQuotientMulEquiv (L.extensionQuotientMk k) =
      (QuotientGroup.mk k :
        K.toSubgroup ⧸ extensionSubgroup K L.field L.below) :=
  rfl
 
@[simp]
theorem extensionQuotientMk_eq_one_iff (L : GaloisExtension K)
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
 
theorem extensionQuotientMk_surjective (L : GaloisExtension K) :
    Function.Surjective L.extensionQuotientMk := by
  intro q
  obtain ⟨k, hk⟩ := QuotientGroup.mk'_surjective
    (extensionSubgroup K L.field L.below) (L.extensionQuotientMulEquiv q)
  refine ⟨k, L.extensionQuotientMulEquiv.injective ?_⟩
  rw [L.extensionQuotientMk_apply]
  exact hk

def toGaloisExtensionQuotientMulEquiv (L : GaloisExtension K) :
    L.extensionQuotient ≃* L.toGaloisSubextension.extensionQuotient :=
  L.extensionQuotientMulEquiv.trans
    L.toGaloisSubextension.extensionQuotientMulEquiv.symm
 
@[simp]
theorem toGaloisSubextension_isTotallyRamified_iff
    (L : GaloisExtension K) (D : DegreeData G) :
    L.toGaloisSubextension.IsTotallyRamified D ↔ L.IsTotallyRamified D :=
  Iff.rfl

theorem isTotallyRamified_toGaloisSubextension
    (L : GaloisExtension K) (D : DegreeData G)
    (hL : L.IsTotallyRamified D) :
    L.toGaloisSubextension.IsTotallyRamified D :=
  (L.toGaloisSubextension_isTotallyRamified_iff D).2 hL
 
theorem finite_extension_trans
    {P L K : ClosedSubgroup G}
    (hPL : P.toSubgroup ≤ L.toSubgroup)
    (hLK : L ≤ K)
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
 
def refl (K : ClosedSubgroup G) : GaloisExtension K where
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
end GaloisExtension
end GroupOnly
section Representation
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
namespace GaloisExtension
variable {K : ClosedSubgroup G}
end GaloisExtension
end Representation
end
end ClassFormation
end

/- FiniteFieldUnitMaps -/
section
universe u v
namespace ClassFormation
open KummerTheory
open CyclicCohomology
noncomputable section
open CategoryTheory
open scoped BigOperators
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
namespace FiniteLevel
 
instance toResidueLevel_extensionNormal
    (K : FiniteLevel G) (D : DegreeData G) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
    [hnormal : (extensionSubgroup K.field L hLK).Normal] :
    (extensionSubgroup (K.toResidueLevel D).field L hLK).Normal := by
  change (extensionSubgroup K.field L hLK).Normal
  exact hnormal
 
instance toResidueLevel_extensionFinite
    (K : FiniteLevel G) (D : DegreeData G) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
    [hfinite : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK)] :
    Finite ((K.toResidueLevel D).field.toSubgroup ⧸
      extensionSubgroup (K.toResidueLevel D).field L hLK) := by
  change Finite
    (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK)
  exact hfinite
end FiniteLevel
namespace ValuationData
variable {D : DegreeData G} {A : Rep ℤ G}
end ValuationData
end
end ClassFormation
end

/- ChosenDegreeOneFrobenius -/
section
universe u
namespace ClassFormation
open CyclicCohomology
noncomputable section
variable {G : Type u} [Group G] [TopologicalSpace G]
namespace DegreeData

noncomputable def chosenDegreeOneFrobeniusElement (D : DegreeData G)
    (K : ResidueLevel D) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal] :
    D.FrobeniusElements K L hLK := by
  let hsurj := D.extensionNormalizedDegreeContinuous_surjective K L hLK
    (Multiplicative.ofAdd (1 : ZHat))
  refine ⟨Classical.choose hsurj, 1, Nat.one_pos, ?_⟩
  rw [pow_one, ← D.extensionNormalizedDegreeContinuous_apply]
  exact Classical.choose_spec hsurj

@[simp]
theorem frobeniusExponent_chosenDegreeOneFrobeniusElement (D : DegreeData G)
    (K : ResidueLevel D) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
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

/- UnramifiedNormQuotient -/
section
universe u
namespace ClassFormation
open KummerTheory
open CyclicCohomology
noncomputable section
section unramifiedFrobenius
variable {G : Type u} [Group G] [TopologicalSpace G]
namespace DegreeData
 
def chosenUnramifiedFrobeniusLift
    (D : DegreeData G) (K : ResidueLevel D)
    (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
    [hnormal : (extensionSubgroup K.field L hLK).Normal] :
    D.FrobeniusElements K L hLK := by
  let φ : K.field.toSubgroup := Classical.choose
    (D.normalizedDegree_surjective K
      (Multiplicative.ofAdd (1 : ZHat)))
  have hφ : D.normalizedDegree K φ =
      Multiplicative.ofAdd (1 : ZHat) :=
    Classical.choose_spec
      (D.normalizedDegree_surjective K
        (Multiplicative.ofAdd (1 : ZHat)))
  refine ⟨QuotientGroup.mk φ, 1, Nat.zero_lt_one, ?_⟩
  rw [D.extensionNormalizedDegree_mk K L hLK φ, hφ, pow_one]

@[simp]
theorem chosenUnramifiedFrobeniusLift_exponent
    (D : DegreeData G) (K : ResidueLevel D)
    (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
    [hnormal : (extensionSubgroup K.field L hLK).Normal] :
    D.frobeniusExponent K L hLK
      (D.chosenUnramifiedFrobeniusLift K L hLK) = 1 := by
  apply proCIntegerOne_pow_nat_injective
  calc
    (Multiplicative.ofAdd (1 : ZHat)) ^
        D.frobeniusExponent K L hLK
          (D.chosenUnramifiedFrobeniusLift K L hLK) =
      D.extensionNormalizedDegree K L hLK
        (D.chosenUnramifiedFrobeniusLift K L hLK).1 :=
      (D.extensionNormalizedDegree_frobenius_eq_pow K L hLK
        (D.chosenUnramifiedFrobeniusLift K L hLK)).symm
    _ = Multiplicative.ofAdd (1 : ZHat) := by
      change D.normalizedDegree K
          (Classical.choose
            (D.normalizedDegree_surjective K
              (Multiplicative.ofAdd (1 : ZHat)))) = _
      exact Classical.choose_spec
        (D.normalizedDegree_surjective K
          (Multiplicative.ofAdd (1 : ZHat)))
    _ = (Multiplicative.ofAdd (1 : ZHat)) ^ 1 := (pow_one _).symm
 
def unramifiedFrobenius
    (D : DegreeData G) (K : ResidueLevel D)
    (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
    [hnormal : (extensionSubgroup K.field L hLK).Normal] :
    K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK :=
  D.frobeniusRestriction K L hLK
    (D.chosenUnramifiedFrobeniusLift K L hLK)
end DegreeData
end unramifiedFrobenius
section valuationQuotient
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
variable {D : DegreeData G} {A : Rep ℤ G}
namespace ValuationData
private theorem valueModulo_eq_zero_iff
    (v : ValuationData D A) (n : ℕ) (hn : 0 < n)
    (z : v.valueGroup) :
    v.valueModulo n hn z = 0 ↔ ∃ w : v.valueGroup, z = n • w := by
  constructor
  · intro hz
    have hq :
        (QuotientAddGroup.mk' (nsmulWithin v.valueGroup n)) z = 0 := by
      apply (v.cyclic_value_quotients n hn).injective
      change v.valueModulo n hn z = v.valueModulo n hn 0
      rw [hz, map_zero]
    obtain ⟨w, hw⟩ :=
      (QuotientAddGroup.eq_zero_iff z).1 hq
    exact ⟨w, hw.symm⟩
  · rintro ⟨w, rfl⟩
    have hq :
        (QuotientAddGroup.mk' (nsmulWithin v.valueGroup n)) (n • w) = 0 := by
      apply (QuotientAddGroup.eq_zero_iff _).2
      exact ⟨w, rfl⟩
    change (v.cyclic_value_quotients n hn)
        ((QuotientAddGroup.mk' (nsmulWithin v.valueGroup n)) (n • w)) = 0
    rw [hq, map_zero]
private def unramifiedValuationHom
    (v : ValuationData D A) (K : FiniteLevel G)
    (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
    [Finite (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK)] :
    fixedCoefficients A K.field →+
      ZMod ((LevelExtension.ofInclusion L K hLK).degree : ℕ) :=
  (v.valueModulo
      ((LevelExtension.ofInclusion L K hLK).degree : ℕ)
      (LevelExtension.ofInclusion L K hLK).degree.property).comp
    (v.valuationAt K)
private theorem finiteNormSubgroup_le_unramifiedValuationHom_ker
    (v : ValuationData D A)
    (K : FiniteLevel G) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
    [Finite (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK)]
    (hUnramified :
      (DegreeData.AbstractExtension.mk L K.field hLK).IsUnramified D) :
    finiteNormSubgroup A K.field L hLK ≤
      (v.unramifiedValuationHom K L hLK).ker := by
  rintro _ ⟨a, rfl⟩
  let E := LevelExtension.ofInclusion L K hLK
  let n := (E.degree : ℕ)
  have hUn : E.IsUnramified D := by
    change (DegreeData.AbstractExtension.mk L K.field hLK).IsUnramified D
    exact hUnramified
  have htower := v.normalizedValuation_tower E a
  change (E.residueDegree D : ℕ) • _ = _ at htower
  rw [E.residueDegree_eq_degree_of_isUnramified D hUn] at htower
  have hval : v.valuationAt K (relativeNorm A K.field L hLK a) =
      n • v.valuationAt E.field a := by
    apply Subtype.ext
    exact htower.symm
  change v.valueModulo n E.degree.property
      (v.valuationAt K (relativeNorm A K.field L hLK a)) = 0
  rw [hval]
  exact (v.valueModulo_eq_zero_iff n E.degree.property _).2
    ⟨v.valuationAt E.field a, rfl⟩
 
def unramifiedNormQuotientValuation
    (v : ValuationData D A)
    (K : FiniteLevel G) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
    [Finite (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK)]
    (hUnramified :
      (DegreeData.AbstractExtension.mk L K.field hLK).IsUnramified D) :
    FiniteNormQuotient A K.field L hLK →+
      ZMod ((LevelExtension.ofInclusion L K hLK).degree : ℕ) :=
  finiteNormQuotientLift A K.field L hLK
    (v.unramifiedValuationHom K L hLK)
    (v.finiteNormSubgroup_le_unramifiedValuationHom_ker K L hLK hUnramified)

@[simp]
theorem unramifiedNormQuotientValuation_finiteNormClass
    (v : ValuationData D A)
    (K : FiniteLevel G) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
    [Finite (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK)]
    (hUnramified :
      (DegreeData.AbstractExtension.mk L K.field hLK).IsUnramified D)
    (a : fixedCoefficients A K.field) :
    v.unramifiedNormQuotientValuation K L hLK hUnramified
        (finiteNormClass A K.field L hLK a) =
      v.unramifiedValuationHom K L hLK a :=
  rfl

theorem unramifiedNormQuotientValuation_surjective
    (v : ValuationData D A)
    (K : FiniteLevel G) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
    [Finite (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK)]
    (hUnramified :
      (DegreeData.AbstractExtension.mk L K.field hLK).IsUnramified D) :
    Function.Surjective
      (v.unramifiedNormQuotientValuation K L hLK hUnramified) := by
  intro z
  let E := LevelExtension.ofInclusion L K hLK
  let n := (E.degree : ℕ)
  obtain ⟨c, hc⟩ :=
    v.valueModulo_surjective n E.degree.property z
  obtain ⟨a, ha⟩ := v.normalizedValuation_surjective K c
  refine ⟨finiteNormClass A K.field L hLK a, ?_⟩
  rw [v.unramifiedNormQuotientValuation_finiteNormClass]
  change v.valueModulo n E.degree.property
      (v.valuationAt K a) = z
  rw [ha]
  exact hc

theorem unramifiedNormQuotientValuation_injective
    (v : ValuationData D A) (hAxiom : SatisfiesUnramifiedUnitCohomology D v)
    (K : FiniteLevel G) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
    [hnormal : (extensionSubgroup K.field L hLK).Normal]
    [hfinite : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK)]
    (hUnramified :
      (DegreeData.AbstractExtension.mk L K.field hLK).IsUnramified D) :
    Function.Injective
      (v.unramifiedNormQuotientValuation K L hLK hUnramified) := by
  let E := LevelExtension.ofInclusion L K hLK
  let n := (E.degree : ℕ)
  have hUn : E.IsUnramified D := by
    change (DegreeData.AbstractExtension.mk L K.field hLK).IsUnramified D
    exact hUnramified
  have hkernel : ∀ q : FiniteNormQuotient A K.field L hLK,
      v.unramifiedNormQuotientValuation K L hLK hUnramified q = 0 → q = 0 := by
    intro q
    obtain ⟨a,rfl⟩ := finiteNormClass_surjective A K.field L hLK q
    intro ha
    change v.unramifiedValuationHom K L hLK a = 0 at ha
    change v.valueModulo n E.degree.property
        (v.valuationAt K a) = 0 at ha
    obtain ⟨z, haz⟩ :=
      (v.valueModulo_eq_zero_iff n E.degree.property
        (v.valuationAt K a)).1 ha
    obtain ⟨b, hb⟩ := v.normalizedValuation_surjective E.field z
    let normb : fixedCoefficients A K.field :=
      relativeNorm A K.field L hLK b
    have htower := v.normalizedValuation_tower E b
    change (E.residueDegree D : ℕ) • _ = _ at htower
    rw [E.residueDegree_eq_degree_of_isUnramified D hUn] at htower
    have hnormb : v.valuationAt K normb = n • z := by
      apply Subtype.ext
      calc
        ((v.valuationAt K normb : v.valueGroup) : ZHat) =
            n • ((v.valuationAt E.field b : v.valueGroup) : ZHat) := htower.symm
        _ = n • ((z : v.valueGroup) : ZHat) := by rw [hb]
        _ = (((n • z : v.valueGroup)) : ZHat) := rfl
    let u : v.unitAddSubgroup K :=
      ⟨a - normb, by
        rw [v.mem_unitAddSubgroup_iff, map_sub, haz, hnormb, sub_self]⟩
    let KR := K.toResidueLevel D
    let : (extensionSubgroup KR.field L hLK).Normal := by
      change (extensionSubgroup K.field L hLK).Normal
      exact hnormal
    let : Finite
        (KR.field.toSubgroup ⧸ extensionSubgroup KR.field L hLK) := by
      change Finite
        (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK)
      exact hfinite
    obtain ⟨g, hg⟩ :=
      D.exists_quotient_generator_of_unramified
        KR L hLK hUnramified
    let : Fintype
        (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK) :=
      Fintype.ofFinite _
    let Euc : FiniteUnramifiedCyclicExtension D K :=
      { field := L
        below := hLK
        normal := hnormal
        finite := hfinite
        generator := g
        generates := hg
        unramified := hUnramified }
    have hzero :
        CategoryTheory.Limits.IsZero
            (tateCohomology (Euc.unitRepresentation v) 0) ∧
          CategoryTheory.Limits.IsZero
            (tateCohomology (Euc.unitRepresentation v) (-1)) :=
      hAxiom K Euc
    obtain ⟨ε, hε⟩ :=
      v.exists_unit_relativeNorm_eq_of_tateHZero_isZero
        Euc.toLevelExtension Euc.normal
          Euc.toLevelExtension_isUnramified
          g hg hzero.1 u
    change v.unitAddSubgroup E.field at ε
    change relativeNorm A K.field L hLK ε.1 = u.1 at hε
    apply (finiteNormClass_eq_zero_iff A K.field L hLK a).2
    refine ⟨b + ε.1, ?_⟩
    rw [map_add, hε]
    change normb + (a - normb) = a
    abel
  intro x y hxy
  apply sub_eq_zero.mp
  apply hkernel
  rw [map_sub, hxy, sub_self]

def unramifiedReciprocity_valuationEquiv
    (v : ValuationData D A) (hAxiom : SatisfiesUnramifiedUnitCohomology D v)
    (K : FiniteLevel G) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
    [hnormal : (extensionSubgroup K.field L hLK).Normal]
    [Finite (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK)]
    (hUnramified :
      (DegreeData.AbstractExtension.mk L K.field hLK).IsUnramified D) :
    FiniteNormQuotient A K.field L hLK ≃+
      ZMod ((LevelExtension.ofInclusion L K hLK).degree : ℕ) :=
  AddEquiv.ofBijective
    (v.unramifiedNormQuotientValuation K L hLK hUnramified)
    ⟨v.unramifiedNormQuotientValuation_injective hAxiom K L hLK
        hUnramified,
      v.unramifiedNormQuotientValuation_surjective K L hLK hUnramified⟩

theorem primeClass_addOrderOf
    (v : ValuationData D A)
    (K : FiniteLevel G) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
    [Finite (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK)]
    (hUnramified :
      (DegreeData.AbstractExtension.mk L K.field hLK).IsUnramified D)
    (π : fixedCoefficients A K.field) (hπ : v.IsPrimeElement K π) :
    addOrderOf
      (finiteNormClass A K.field L hLK π) =
      ((LevelExtension.ofInclusion L K hLK).degree : ℕ) := by
  let E := LevelExtension.ofInclusion L K hLK
  let n := (E.degree : ℕ)
  have hUn : E.IsUnramified D := by
    change (DegreeData.AbstractExtension.mk L K.field hLK).IsUnramified D
    exact hUnramified
  let g : FiniteNormQuotient A K.field L hLK :=
    finiteNormClass A K.field L hLK π
  have hn : 0 < n := E.degree.property
  have hng : n • g = 0 := by
    change n • finiteNormClass A K.field L hLK π = 0
    rw [← finiteNormClass_nsmul]
    apply (finiteNormClass_eq_zero_iff A K.field L hLK _).2
    refine ⟨fixedFieldInclusion A K.field L hLK π, ?_⟩
    have hnorm :=
      relativeNorm_fixedFieldInclusion A E.toFiniteAbstractExtension π
    change relativeNorm A K.field L hLK
        (fixedFieldInclusion A K.field L hLK π) = n • π at hnorm
    exact hnorm
  have hdiv : ∀ m : ℕ, m • g = 0 → n ∣ m := by
    intro m hm
    have hm' :
        finiteNormClass A K.field L hLK (m • π) = 0 := by
      simpa [g] using hm
    have hmNorm := (finiteNormClass_eq_zero_iff A K.field L hLK _).1 hm'
    obtain ⟨b, hb⟩ := hmNorm
    have htower := v.normalizedValuation_tower E b
    change (E.residueDegree D : ℕ) • _ = _ at htower
    rw [E.residueDegree_eq_degree_of_isUnramified D hUn] at htower
    have hval :
        n • ((v.valuationAt E.field b : v.valueGroup) : ZHat) =
          m • (1 : ZHat) := by
      calc
        n • ((v.valuationAt E.field b : v.valueGroup) : ZHat) =
            ((v.valuationAt K (relativeNorm A K.field L hLK b) :
              v.valueGroup) : ZHat) := htower
        _ = ((v.valuationAt K (m • π) : v.valueGroup) : ZHat) := by
          rw [hb]
        _ = m • ((v.valuationAt K π : v.valueGroup) : ZHat) := by
          exact congrArg Subtype.val (map_nsmul (v.valuationAt K) m π)
        _ = m • (1 : ZHat) := by rw [hπ, v.oneValue_coe]
    have hred := congrArg (fun z : ZHat => zHatReduction n hn z) hval
    have hredOne : zHatReduction n hn (1 : ZHat) = 1 := rfl
    have hred' :
        n • zHatReduction n hn
            ((v.valuationAt E.field b : v.valueGroup) : ZHat) =
          m • (1 : ZMod n) := by
      simpa only [map_nsmul, hredOne] using hred
    have hmzero : (m : ZMod n) = 0 := by
      have hmzero' : m • (1 : ZMod n) = 0 := by
        rw [← hred']
        simp [nsmul_eq_mul]
      simpa using hmzero'
    exact (ZMod.natCast_eq_zero_iff m n).1 hmzero
  apply Nat.dvd_antisymm
  · exact (addOrderOf_dvd_iff_nsmul_eq_zero).2 hng
  · exact hdiv (addOrderOf g) (addOrderOf_nsmul_eq_zero g)

theorem primeClass_zmultiples_eq_top
    (v : ValuationData D A) (hAxiom : SatisfiesUnramifiedUnitCohomology D v)
    (K : FiniteLevel G) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
    [hnormal : (extensionSubgroup K.field L hLK).Normal]
    [Finite (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK)]
    (hUnramified :
      (DegreeData.AbstractExtension.mk L K.field hLK).IsUnramified D)
    (π : fixedCoefficients A K.field) (hπ : v.IsPrimeElement K π) :
    AddSubgroup.zmultiples
      (finiteNormClass A K.field L hLK π) = ⊤ := by
  let e := v.unramifiedReciprocity_valuationEquiv hAxiom K L hLK hUnramified
  let E := LevelExtension.ofInclusion L K hLK
  let : NeZero (E.degree : ℕ) :=
    ⟨E.degree.property.ne'⟩
  let : Finite (FiniteNormQuotient A K.field L hLK) :=
    Finite.of_equiv (ZMod (E.degree : ℕ)) (by
      simpa [E] using e.symm.toEquiv)
  apply AddSubgroup.eq_top_of_card_eq
  rw [Nat.card_zmultiples,
    v.primeClass_addOrderOf K L hLK hUnramified π hπ]
  exact ((Nat.card_congr e.toEquiv).trans (Nat.card_zmod _)).symm
end ValuationData
end valuationQuotient
end
end ClassFormation
end

/- MainFiniteReciprocity -/
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
    (K : ResidueLevel D) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    [hLfinite : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK)]
    (q : K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK) :
    D.FrobeniusElements K L hLK :=
  Classical.choose (D.frobeniusRestriction_surjective K L hLK q)
 
@[simp]
theorem frobeniusRestriction_chosenFiniteReciprocityFrobeniusLift (D : DegreeData G)
    (K : ResidueLevel D) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
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

theorem unramifiedFrobenius_fixedField_isUnramified
    (D : DegreeData G)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    (K : ResidueLevel D) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
    [hnormal : (extensionSubgroup K.field L hLK).Normal]
    (hUnramified :
      (DegreeData.AbstractExtension.mk L K.field hLK).IsUnramified D) :
    (DegreeData.AbstractExtension.mk
      (D.frobeniusFixedField K L hLK
        (D.chosenUnramifiedFrobeniusLift K L hLK)) K.field
      (D.frobeniusFixedField_le K L hLK
        (D.chosenUnramifiedFrobeniusLift K L hLK))).IsUnramified D := by
  let σ := D.chosenUnramifiedFrobeniusLift K L hLK
  let S := D.frobeniusFixedField K L hLK σ
  let hSK : S.toSubgroup ≤ K.field.toSubgroup :=
    D.frobeniusFixedField_le K L hLK σ
  rw [(DegreeData.AbstractExtension.mk S K.field hSK).isUnramified_iff_inertia_le D]
  intro g hg
  have hgL : g ∈ L.toSubgroup :=
    ((DegreeData.AbstractExtension.mk L K.field hLK).isUnramified_iff_inertia_le D).1
      hUnramified hg
  exact D.fieldInertia_le_frobeniusFixedField K L hLK σ
    ⟨hgL, hg.2⟩

theorem unramifiedFrobenius_fixedField_degree
    (D : DegreeData G)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    (K : ResidueLevel D) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
    [hnormal : (extensionSubgroup K.field L hLK).Normal]
    [hfinite : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK)]
    (hUnramified :
      (DegreeData.AbstractExtension.mk L K.field hLK).IsUnramified D) :
    let σ := D.chosenUnramifiedFrobeniusLift K L hLK
    let S := D.frobeniusFixedField K L hLK σ
    let hSK := D.frobeniusFixedField_le K L hLK σ
    letI : Finite
        (K.field.toSubgroup ⧸ extensionSubgroup K.field S hSK) :=
      D.frobeniusFixedField_finite K L hLK σ
    ((DegreeData.FiniteAbstractExtension.ofInclusion S K.field hSK).degree : ℕ) = 1 := by
  let σ := D.chosenUnramifiedFrobeniusLift K L hLK
  let S := D.frobeniusFixedField K L hLK σ
  let hSK : S.toSubgroup ≤ K.field.toSubgroup :=
    D.frobeniusFixedField_le K L hLK σ
  let : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field S hSK) :=
    D.frobeniusFixedField_finite K L hLK σ
  let E : DegreeData.FiniteAbstractExtension G :=
    DegreeData.FiniteAbstractExtension.ofInclusion S K.field hSK
  have hSUnramified :
      (DegreeData.AbstractExtension.mk S K.field hSK).IsUnramified D :=
    D.unramifiedFrobenius_fixedField_isUnramified
      K L hLK hUnramified
  calc
    (E.degree : ℕ) = (E.residueDegree D : ℕ) := by
      symm
      exact E.residueDegree_eq_degree_of_isUnramified D (by
        simpa [E, DegreeData.FiniteAbstractExtension.ofInclusion] using hSUnramified)
    _ = D.frobeniusExponent K L hLK σ :=
      D.frobeniusFixedField_residueDegreeOverBase K L hLK σ
    _ = 1 := D.chosenUnramifiedFrobeniusLift_exponent K L hLK
end DegreeData
end unramifiedFixedFields
section unramifiedReciprocity
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
variable {D : DegreeData G} {A : Rep ℤ G}
namespace ValuationData

theorem unramifiedFrobenius_primeNorm
    (v : ValuationData D A)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    (K : FiniteLevel G) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
    [hnormal : (extensionSubgroup K.field L hLK).Normal]
    [Finite (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK)]
    (hUnramified :
      (DegreeData.AbstractExtension.mk L K.field hLK).IsUnramified D) :
    let KR := K.toResidueLevel D
    letI hLnormalKR : (extensionSubgroup KR.field L hLK).Normal := by
      simpa only [KR, FiniteLevel.toResidueLevel] using hnormal
    let σ := D.chosenUnramifiedFrobeniusLift KR L hLK
    let S := D.frobeniusFixedField KR L hLK σ
    let hSK := D.frobeniusFixedField_le KR L hLK σ
    letI : Finite
        (K.field.toSubgroup ⧸ extensionSubgroup K.field S hSK) :=
      D.frobeniusFixedField_finite KR L hLK σ
    relativeNorm A K.field S hSK
        (fixedFieldInclusion A K.field S hSK (v.chosenPrimeElement K)) =
      v.chosenPrimeElement K := by
  dsimp only
  let KR := K.toResidueLevel D
  let hLnormalKR : (extensionSubgroup KR.field L hLK).Normal := by
    simpa only [KR, FiniteLevel.toResidueLevel] using hnormal
  let σ := D.chosenUnramifiedFrobeniusLift KR L hLK
  let : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field
        (D.frobeniusFixedField KR L hLK σ)
        (D.frobeniusFixedField_le KR L hLK σ)) :=
    D.frobeniusFixedField_finite KR L hLK σ
  let S := D.frobeniusFixedField KR L hLK σ
  let hSK : S.toSubgroup ≤ K.field.toSubgroup :=
    D.frobeniusFixedField_le KR L hLK σ
  let E : DegreeData.FiniteAbstractExtension G :=
    DegreeData.FiniteAbstractExtension.ofInclusion S K.field hSK
  change relativeNorm A K.field S hSK
      (fixedFieldInclusion A K.field S hSK (v.chosenPrimeElement K)) =
    v.chosenPrimeElement K
  calc
    relativeNorm A K.field S hSK
        (fixedFieldInclusion A K.field S hSK (v.chosenPrimeElement K)) =
        (E.degree : ℕ) • v.chosenPrimeElement K := by
      have hnorm :=
        relativeNorm_fixedFieldInclusion A E (v.chosenPrimeElement K)
      change relativeNorm A K.field S hSK
          (fixedFieldInclusion A K.field S hSK (v.chosenPrimeElement K)) =
        (E.degree : ℕ) • v.chosenPrimeElement K at hnorm
      exact hnorm
    _ = 1 • v.chosenPrimeElement K := by
      rw [show (E.degree : ℕ) = 1 by
        have hdegree :=
          D.unramifiedFrobenius_fixedField_degree
            KR L hLK hUnramified
        change (E.degree : ℕ) = 1 at hdegree
        exact hdegree]
    _ = v.chosenPrimeElement K := one_nsmul _

theorem unramifiedFrobenius_includedPrime_isPrime
    (v : ValuationData D A)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    (K : FiniteLevel G) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
    [hnormal : (extensionSubgroup K.field L hLK).Normal]
    [Finite (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK)]
    (hUnramified :
      (DegreeData.AbstractExtension.mk L K.field hLK).IsUnramified D) :
    let KR := K.toResidueLevel D
    letI hLnormalKR : (extensionSubgroup KR.field L hLK).Normal := by
      simpa only [KR, FiniteLevel.toResidueLevel] using hnormal
    let σ := D.chosenUnramifiedFrobeniusLift KR L hLK
    let S := D.frobeniusFixedField KR L hLK σ
    let hSK := D.frobeniusFixedField_le KR L hLK σ
    letI : Finite
        (K.field.toSubgroup ⧸ extensionSubgroup K.field S hSK) :=
      D.frobeniusFixedField_finite KR L hLK σ
    letI : Finite ((baseField G).toSubgroup ⧸
        extensionSubgroup (baseField G) S (le_baseField S)) :=
      D.frobeniusFixedField_absoluteFinite K L hLK σ
    let Sigma : FiniteLevel G := ⟨S, inferInstance⟩
    v.IsPrimeElement Sigma
      (fixedFieldInclusion A K.field S hSK (v.chosenPrimeElement K)) := by
  dsimp only
  let KR := K.toResidueLevel D
  let hLnormalKR : (extensionSubgroup KR.field L hLK).Normal := by
    simpa only [KR, FiniteLevel.toResidueLevel] using hnormal
  let σ := D.chosenUnramifiedFrobeniusLift KR L hLK
  let S := D.frobeniusFixedField KR L hLK σ
  let hSK : S.toSubgroup ≤ K.field.toSubgroup :=
    D.frobeniusFixedField_le KR L hLK σ
  let hSfinite : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field S hSK) :=
    D.frobeniusFixedField_finite KR L hLK σ
  let hSabsolute : Finite ((baseField G).toSubgroup ⧸
      extensionSubgroup (baseField G) S (le_baseField S)) :=
    D.frobeniusFixedField_absoluteFinite K L hLK σ
  let Sigma : FiniteLevel G := ⟨S, hSabsolute⟩
  let ES : LevelExtension G :=
    { field := Sigma
      base := K
      below := hSK
      finiteQuotient := hSfinite }
  have hES : ES.IsUnramified D := by
    have hunramified :=
      D.unramifiedFrobenius_fixedField_isUnramified KR L hLK hUnramified
    change ES.IsUnramified D at hunramified
    exact hunramified
  exact v.prime_of_unramified ES hES
    (v.chosenPrimeElement K) (v.chosenPrimeElement_isPrime K)

theorem unramifiedReciprocity_bijective_of_generator
    (v : ValuationData D A) (hAxiom : SatisfiesUnramifiedUnitCohomology D v)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    (K : FiniteLevel G) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
    [hnormal : (extensionSubgroup K.field L hLK).Normal]
    [Finite (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK)]
    (hUnramified :
      (DegreeData.AbstractExtension.mk L K.field hLK).IsUnramified D)
    (f : Additive
      (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK) →+
      FiniteNormQuotient A K.field L hLK)
    (hf : f (Additive.ofMul (D.unramifiedFrobenius
        (K.toResidueLevel D) L hLK)) =
      finiteNormClass A K.field L hLK (v.chosenPrimeElement K)) :
    Function.Bijective f := by
  let e := v.unramifiedReciprocity_valuationEquiv
    hAxiom K L hLK hUnramified
  let E : LevelExtension G :=
    LevelExtension.ofInclusion L K hLK
  let : NeZero (E.degree : ℕ) := ⟨E.degree.property.ne'⟩
  let : Finite (FiniteNormQuotient A K.field L hLK) :=
    Finite.of_equiv (ZMod (E.degree : ℕ)) e.symm
  have hsurj : Function.Surjective f := by
    rw [← AddMonoidHom.range_eq_top]
    apply top_unique
    rw [← v.primeClass_zmultiples_eq_top hAxiom K L hLK
      hUnramified (v.chosenPrimeElement K) (v.chosenPrimeElement_isPrime K)]
    rw [AddSubgroup.zmultiples_le]
    exact ⟨Additive.ofMul (D.unramifiedFrobenius
      (K.toResidueLevel D) L hLK), hf⟩
  apply (Nat.bijective_iff_surjective_and_card f).2
  refine ⟨hsurj, ?_⟩
  calc
    Nat.card (Additive
        (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK)) =
        Nat.card
          (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK) :=
      Nat.card_congr Additive.toMul
    _ = (extensionSubgroup K.field L hLK).index :=
      (Subgroup.index_eq_card _).symm
    _ = (E.degree : ℕ) := by
      exact E.toFiniteAbstractExtension.extensionSubgroup_index_eq_degree
    _ = Nat.card (ZMod (E.degree : ℕ)) :=
      (Nat.card_zmod _).symm
    _ = Nat.card (FiniteNormQuotient A K.field L hLK) :=
      (Nat.card_congr e.toEquiv).symm

noncomputable def unramifiedReciprocity_equiv_of_generator
    (v : ValuationData D A) (hAxiom : SatisfiesUnramifiedUnitCohomology D v)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    (K : FiniteLevel G) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
    [hnormal : (extensionSubgroup K.field L hLK).Normal]
    [Finite (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK)]
    (hUnramified :
      (DegreeData.AbstractExtension.mk L K.field hLK).IsUnramified D)
    (f : Additive
      (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK) →+
      FiniteNormQuotient A K.field L hLK)
    (hf : f (Additive.ofMul (D.unramifiedFrobenius
        (K.toResidueLevel D) L hLK)) =
      finiteNormClass A K.field L hLK (v.chosenPrimeElement K)) :
    Additive (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK) ≃+
      FiniteNormQuotient A K.field L hLK :=
  AddEquiv.ofBijective f
    (v.unramifiedReciprocity_bijective_of_generator hAxiom
      K L hLK hUnramified f hf)
end ValuationData
end unramifiedReciprocity
end
end
end ClassFormation
end

/- MainNaturality -/
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

def symbolNaturalityRestriction
    (K K' L L' : ClosedSubgroup G)
    (hLK : L ≤ K)
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
namespace DegreeData

def symbolNaturalityFrobeniusTowerMap
    (D : DegreeData G) [IsTopologicalGroup G]
    (K K' L L' : ClosedSubgroup G)
    (hLK : L ≤ K)
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

def symbolNaturalityFrobeniusTowerMapContinuous
    (D : DegreeData G) [IsTopologicalGroup G]
    (K K' L L' : ClosedSubgroup G)
    (hLK : L ≤ K)
    (hL'K' : L'.toSubgroup ≤ K'.toSubgroup)
    (hK'K : K'.toSubgroup ≤ K.toSubgroup)
    (hL'L : L'.toSubgroup ≤ L.toSubgroup)
    [hLnormal : (extensionSubgroup K L hLK).Normal]
    [hL'normal : (extensionSubgroup K' L' hL'K').Normal] :
    (K'.toSubgroup ⧸ D.extensionInertiaWithin K' L' hL'K') →ₜ*
      (K.toSubgroup ⧸ D.extensionInertiaWithin K L hLK) where
  toMonoidHom := D.symbolNaturalityFrobeniusTowerMap
    K K' L L' hLK hL'K' hK'K hL'L
  continuous_toFun := by
    rw [← QuotientGroup.isOpenQuotientMap_mk.continuous_comp_iff]
    change Continuous (fun k' : K'.toSubgroup =>
      QuotientGroup.mk (Subgroup.inclusion hK'K k'))
    apply QuotientGroup.continuous_mk.comp
    exact continuous_subtype_val.subtype_mk _

theorem symbolNaturalityFrobeniusTowerMap_degree
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
      (D.symbolNaturalityFrobeniusTowerMap
        E.base.field E.field.field L L'
        hLK hL'K' E.below hL'L q)).toAdd =
      (E.residueDegree : ℕ) •
        (D.extensionNormalizedDegree E.field L' hL'K' q).toAdd := by
  refine Quotient.inductionOn' q ?_
  intro k'
  change (D.normalizedDegree E.base (Subgroup.inclusion E.below k')).toAdd =
    (E.residueDegree : ℕ) • (D.normalizedDegree E.field k').toAdd
  exact D.frobeniusRestrictionNaturality_normalizedDegree E k'

def symbolNaturalityFrobeniusTowerLift
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
  refine ⟨D.symbolNaturalityFrobeniusTowerMap
      E.base.field E.field.field L L' hLK hL'K' E.below hL'L σ.1,
    f * n, Nat.mul_pos E.residueDegree.property
      (D.frobeniusExponent_pos E.field L' hL'K' σ), ?_⟩
  apply Multiplicative.ext
  rw [D.symbolNaturalityFrobeniusTowerMap_degree E L L'
    hLK hL'K' hL'L σ.1]
  rw [D.extensionNormalizedDegree_frobenius_eq_pow E.field L' hL'K' σ]
  change f • (n • (1 : ZHat)) = (f * n) • (1 : ZHat)
  rw [smul_smul]
 
@[simp]
theorem symbolNaturalityFrobeniusTowerLift_coe
    (D : DegreeData G) [IsTopologicalGroup G]
    (E : DegreeData.FiniteResidueAbstractExtension D)
    (L L' : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ E.base.toSubgroup)
    (hL'K' : L'.toSubgroup ≤ E.field.toSubgroup)
    (hL'L : L'.toSubgroup ≤ L.toSubgroup)
    [hLnormal : (extensionSubgroup E.base.field L hLK).Normal]
    [hL'normal : (extensionSubgroup E.field.field L' hL'K').Normal]
    (σ : D.FrobeniusElements E.field L' hL'K') :
    (D.symbolNaturalityFrobeniusTowerLift
      E L L' hLK hL'K' hL'L σ).1 =
      D.symbolNaturalityFrobeniusTowerMap
        E.base.field E.field.field L L' hLK hL'K' E.below hL'L σ.1 := by
  simp [symbolNaturalityFrobeniusTowerLift]
 
@[simp]
theorem symbolNaturalityFrobeniusTowerLift_exponent
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
        (D.symbolNaturalityFrobeniusTowerLift
          E L L' hLK hL'K' hL'L σ) =
      (E.residueDegree : ℕ) *
        D.frobeniusExponent E.field L' hL'K' σ := by
  apply proCIntegerOne_pow_nat_injective
  let f := (E.residueDegree : ℕ)
  let n := D.frobeniusExponent E.field L' hL'K' σ
  calc
    (Multiplicative.ofAdd (1 : ZHat)) ^
        D.frobeniusExponent E.base L hLK
          (D.symbolNaturalityFrobeniusTowerLift
            E L L' hLK hL'K' hL'L σ) =
      D.extensionNormalizedDegree E.base L hLK
        (D.symbolNaturalityFrobeniusTowerLift
          E L L' hLK hL'K' hL'L σ).1 :=
      (D.extensionNormalizedDegree_frobenius_eq_pow E.base L hLK _).symm
    _ = (Multiplicative.ofAdd (1 : ZHat)) ^ (f * n) := by
      apply Multiplicative.ext
      rw [D.symbolNaturalityFrobeniusTowerLift_coe]
      rw [D.symbolNaturalityFrobeniusTowerMap_degree E L L'
        hLK hL'K' hL'L σ.1]
      rw [D.extensionNormalizedDegree_frobenius_eq_pow
        E.field L' hL'K' σ]
      change f • (n • (1 : ZHat)) = (f * n) • (1 : ZHat)
      rw [smul_smul]
    _ = (Multiplicative.ofAdd (1 : ZHat)) ^
        ((E.residueDegree : ℕ) *
          D.frobeniusExponent E.field L' hL'K' σ) := by rfl

theorem symbolNaturalityRestriction_frobeniusTowerLift
    (D : DegreeData G) [IsTopologicalGroup G]
    (E : DegreeData.FiniteResidueAbstractExtension D)
    (L L' : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ E.base.toSubgroup)
    (hL'K' : L'.toSubgroup ≤ E.field.toSubgroup)
    (hL'L : L'.toSubgroup ≤ L.toSubgroup)
    [hLnormal : (extensionSubgroup E.base.field L hLK).Normal]
    [hL'normal : (extensionSubgroup E.field.field L' hL'K').Normal]
    (σ : D.FrobeniusElements E.field L' hL'K') :
    symbolNaturalityRestriction
        E.base.field E.field.field L L' hLK hL'K' E.below hL'L
        (D.frobeniusRestriction E.field L' hL'K' σ) =
      D.frobeniusRestriction E.base L hLK
        (D.symbolNaturalityFrobeniusTowerLift
          E L L' hLK hL'K' hL'L σ) := by
  change symbolNaturalityRestriction
      E.base.field E.field.field L L' hLK hL'K' E.below hL'L
      (D.extensionRestriction E.field.field L' hL'K' σ.1) =
    D.extensionRestriction E.base.field L hLK
      (D.symbolNaturalityFrobeniusTowerLift
        E L L' hLK hL'K' hL'L σ).1
  rw [D.symbolNaturalityFrobeniusTowerLift_coe]
  refine Quotient.inductionOn' σ.1 ?_
  intro k'
  rfl

theorem symbolNaturalityFrobeniusFixedField_le
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
        (D.symbolNaturalityFrobeniusTowerLift
          E L L' hLK hL'K' hL'L σ)).toSubgroup := by
  rintro g ⟨k', hk', rfl⟩
  let k : E.base.field.toSubgroup := Subgroup.inclusion E.below k'
  refine ⟨k, ?_, rfl⟩
  change QuotientGroup.mk k ∈
    (D.frobeniusClosure E.base L hLK
      (D.symbolNaturalityFrobeniusTowerLift
        E L L' hLK hL'K' hL'L σ)).toSubgroup
  change QuotientGroup.mk k' ∈
    (D.frobeniusClosure E.field L' hL'K' σ).toSubgroup at hk'
  have hmap := map_mem_closedSubgroupGenerated_singleton
    (D.symbolNaturalityFrobeniusTowerMapContinuous
      E.base.field E.field.field L L' hLK hL'K' E.below hL'L) σ.1 (by
        simpa [DegreeData.frobeniusClosure] using hk')
  let f := D.symbolNaturalityFrobeniusTowerMap
    E.base.field E.field.field L L' hLK hL'K' E.below hL'L
  change f (QuotientGroup.mk k') ∈
    (closedSubgroupGenerated ({f σ.1} : Set _) : Subgroup _) at hmap
  simp [DegreeData.frobeniusClosure]
  change f (QuotientGroup.mk k') ∈
    (closedSubgroupGenerated ({f σ.1} : Set _) : Subgroup _)
  exact hmap

theorem symbolNaturalityFrobeniusFixedField_isTotallyRamified
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
        (D.symbolNaturalityFrobeniusTowerLift
          E L L' hLK hL'K' hL'L σ))
      (D.symbolNaturalityFrobeniusFixedField_le
        E L L' hLK hL'K' hL'L σ)).IsTotallyRamified D := by
  let τ := D.symbolNaturalityFrobeniusTowerLift
    E L L' hLK hL'K' hL'L σ
  let S' := D.frobeniusFixedField E.field L' hL'K' σ
  let S := D.frobeniusFixedField E.base L hLK τ
  let hS'S := D.symbolNaturalityFrobeniusFixedField_le
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
        rw [D.symbolNaturalityFrobeniusTowerLift_exponent]
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

private theorem symbolNaturality_tower_finite
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

def symbolNaturalityNormMap
    (A : Rep ℤ G) (K K' L L' : ClosedSubgroup G)
    (hLK : L ≤ K)
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
    symbolNaturality_tower_finite K K' L' hK'K hL'K'
  letI hL'Lfinite : Finite
      (L.toSubgroup ⧸ extensionSubgroup L L' hL'L) :=
    FiniteIntermediateField.finite_extension_of_le
      (hL'L.trans hLK) hLK hL'L
  let f : fixedCoefficients A K' →+ FiniteNormQuotient A K L hLK :=
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
theorem symbolNaturalityNormMap_finiteNormClass
    (A : Rep ℤ G) (K K' L L' : ClosedSubgroup G)
    (hLK : L ≤ K)
    (hL'K' : L'.toSubgroup ≤ K'.toSubgroup)
    (hK'K : K'.toSubgroup ≤ K.toSubgroup)
    (hL'L : L'.toSubgroup ≤ L.toSubgroup)
    [hLKfinite : Finite
      (K.toSubgroup ⧸ extensionSubgroup K L hLK)]
    [Finite
      (K'.toSubgroup ⧸ extensionSubgroup K' L' hL'K')]
    [hK'Kfinite : Finite
      (K.toSubgroup ⧸ extensionSubgroup K K' hK'K)]
    (a : fixedCoefficients A K') :
    symbolNaturalityNormMap A K K' L L' hLK hL'K' hK'K hL'L
        (finiteNormClass A K' L' hL'K' a) =
      finiteNormClass A K L hLK (relativeNorm A K K' hK'K a) :=
  by
    simp [symbolNaturalityNormMap]
    rfl

theorem symbolNaturality_norm_tower_class
    (A : Rep ℤ G)
    (K K' L L' S S' : ClosedSubgroup G)
    (hLK : L ≤ K)
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
    (π : fixedCoefficients A S') :
    symbolNaturalityNormMap A K K' L L' hLK hL'K' hK'K hL'L
        (finiteNormClass A K' L' hL'K'
          (relativeNorm A K' S' hS'K' π)) =
      finiteNormClass A K L hLK
        (relativeNorm A K S hSK (relativeNorm A S S' hS'S π)) := by
  let hS'Kfinite : Finite (K.toSubgroup ⧸
      extensionSubgroup K S' (hS'K'.trans hK'K)) :=
    symbolNaturality_tower_finite K K' S' hK'K hS'K'
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
  rw [symbolNaturalityNormMap_finiteNormClass]
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

/- MainTransferFrobeniusGeometry -/
section
universe u
namespace ClassFormation
open KummerTheory
open CyclicCohomology
open CategoryTheory
noncomputable section
open scoped BigOperators
open MulAction
section transferFrobeniusGeometry
variable {G : Type u} [Group G] [TopologicalSpace G]
 
theorem transferNormNaturality_intermediateExtension_normal
    (K K' L : ClosedSubgroup G)
    (hLK' : L.toSubgroup ≤ K'.toSubgroup)
    (hK'K : K'.toSubgroup ≤ K.toSubgroup)
    [hLnormal : (extensionSubgroup K L (hLK'.trans hK'K)).Normal] :
    (extensionSubgroup K' L hLK').Normal := by
  have hcomap : extensionSubgroup K' L hLK' =
      (extensionSubgroup K L (hLK'.trans hK'K)).comap
        (Subgroup.inclusion hK'K) := by
    ext k'
    rw [Subgroup.mem_comap, mem_extensionSubgroup_iff,
      mem_extensionSubgroup_iff]
    rfl
  rw [hcomap]
  exact hLnormal.comap (Subgroup.inclusion hK'K)
namespace DegreeData
end DegreeData
end transferFrobeniusGeometry
end
end ClassFormation
end

/- MainTransfer -/
section
universe u
namespace ClassFormation
open KummerTheory
open CyclicCohomology
noncomputable section
open CategoryTheory
open scoped BigOperators
open MulAction
section GroupOnly
variable {G : Type u} [Group G] [TopologicalSpace G]
 
def transferNormNaturalityIntermediateInclusion
    (K K' L : ClosedSubgroup G)
    (hLK' : L.toSubgroup ≤ K'.toSubgroup)
    (hK'K : K'.toSubgroup ≤ K.toSubgroup)
    [hLnormal : (extensionSubgroup K L (hLK'.trans hK'K)).Normal]
    [hL'normal : (extensionSubgroup K' L hLK').Normal] :
    (K'.toSubgroup ⧸ extensionSubgroup K' L hLK') →*
      (K.toSubgroup ⧸ extensionSubgroup K L (hLK'.trans hK'K)) :=
  symbolNaturalityRestriction K K' L L (hLK'.trans hK'K) hLK'
    hK'K le_rfl
namespace DegreeData
end DegreeData
namespace DegreeData
end DegreeData
end GroupOnly
section Representation
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
namespace DegreeData
end DegreeData
end Representation
section GroupOnly
variable {G : Type u} [Group G] [TopologicalSpace G]
end GroupOnly
section Representation
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
end Representation
section GroupOnly
variable {G : Type u} [Group G] [TopologicalSpace G]
end GroupOnly
section Representation
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
namespace DegreeData
end DegreeData
end Representation
end
end ClassFormation
end

/- FieldRepresentation -/
section
namespace ClassFormation
open KummerTheory
open CyclicCohomology
noncomputable section
open scoped BigOperators
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]

def extensionFixedRepresentationEquiv
    (A : Rep ℤ G) (K L : ClosedSubgroup G)
    (hLK : L ≤ K)
    (hnormal : (extensionSubgroup K L hLK).Normal) :
    (extensionFixedRepresentation A K L hLK hnormal).V ≃+
      fixedCoefficients A L where
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
    (hLK : L ≤ K)
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
    (hLK : L ≤ K)
    (hnormal : (extensionSubgroup K L hLK).Normal)
    [Finite (K.toSubgroup ⧸ extensionSubgroup K L hLK)]
    (a : (extensionFixedRepresentation A K L hLK hnormal).V) :
    letI := hnormal
    letI := Fintype.ofFinite
      (K.toSubgroup ⧸ extensionSubgroup K L hLK)
    ((extensionFixedRepresentation A K L hLK hnormal).norm.hom a).1 =
      ((relativeNorm A K L hLK
        (extensionFixedRepresentationEquiv A K L hLK hnormal a) :
          fixedCoefficients A K) : A.V) := by
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

/- CyclicNormQuotient -/
section
namespace ClassFormation
open KummerTheory
open CyclicCohomology
noncomputable section
open CategoryTheory
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]

def cyclicFixedCycleEquiv
    (A : Rep ℤ G)
    (K L : ClosedSubgroup G) (hLK : L ≤ K)
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
    fixedCoefficients A K ≃+
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
  let toCycle : fixedCoefficients A K →
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
      fixedCoefficients A K := fun x => by
    let aM : M.V := x.1
    let aL : fixedCoefficients A L :=
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
    (K L : ClosedSubgroup G) (hLK : L ≤ K)
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
    fixedCoefficients A K →+
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
    (K L : ClosedSubgroup G) (hLK : L ≤ K)
    (hnormal : (extensionSubgroup K L hLK).Normal)
    (hfinite : Finite (K.toSubgroup ⧸ extensionSubgroup K L hLK))
    (g : K.toSubgroup ⧸ extensionSubgroup K L hLK)
    (hg : ∀ x, x ∈ Subgroup.zpowers g)
    (a : fixedCoefficients A K) :
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
    (K L : ClosedSubgroup G) (hLK : L ≤ K)
    (hnormal : (extensionSubgroup K L hLK).Normal)
    (hfinite : Finite (K.toSubgroup ⧸ extensionSubgroup K L hLK))
    (g : K.toSubgroup ⧸ extensionSubgroup K L hLK)
    (hg : ∀ x, x ∈ Subgroup.zpowers g)
    (a : fixedCoefficients A L) :
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
    (K L : ClosedSubgroup G) (hLK : L ≤ K)
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
    let b : fixedCoefficients A L :=
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
    (K L : ClosedSubgroup G) (hLK : L ≤ K)
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
    (K L : ClosedSubgroup G) (hLK : L ≤ K)
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
    (K L : ClosedSubgroup G) (hLK : L ≤ K)
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
    (K L : ClosedSubgroup G) (hLK : L ≤ K)
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
  let Kcf : FiniteLevel G := ⟨E.base, hKfinite⟩
  let Ecf : CyclicExtension Kcf :=
    { field := E.field
      below := E.below
      normal := hnormal
      finite := E.finiteQuotient
      generator := g
      generates := hg }
  let : Finite (tateCohomology (Ecf.fixedRepresentation A) 0) :=
    (hcf Kcf Ecf).finiteTateHZero
  exact Finite.of_equiv (tateCohomology (Ecf.fixedRepresentation A) 0) (by
    simpa [Kcf, Ecf, CyclicExtension.fixedRepresentation] using
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
  let Kcf : FiniteLevel G := ⟨E.base, hKfinite⟩
  let Ecf : CyclicExtension Kcf :=
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
      CyclicExtension.fixedRepresentation] using
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
          CyclicExtension.fixedRepresentation,
          CyclicExtension.toFiniteAbstractExtension] using
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
 
theorem finiteNormQuotient_finite_of_classFieldAxiom
    (A : Rep ℤ G) (hcf : SatisfiesClassFieldAxiom A)
    (E : DegreeData.FiniteAbstractExtension G)
    [Finite ((baseField G).toSubgroup ⧸
      extensionSubgroup (baseField G) E.base (le_baseField E.base))]
    (hnormal : (extensionSubgroup E.base E.field E.below).Normal)
    (g : E.base.toSubgroup ⧸
      extensionSubgroup E.base E.field E.below)
    (hg : ∀ x, x ∈ Subgroup.zpowers g) :
    Finite (FiniteNormQuotient A E.base E.field E.below) :=
  finiteNormQuotientFiniteOfClassFieldAxiom A hcf E hnormal g hg
end
end ClassFormation
end

/- Core -/
section
namespace ClassFormation
open KummerTheory
open CyclicCohomology
noncomputable section
open CategoryTheory
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
variable {D : DegreeData G} {A : Rep ℤ G}
namespace ValuationData
private theorem valueModulo_nsmul
    (v : ValuationData D A) (n : ℕ) (hn : 0 < n)
    (z : v.valueGroup) :
    v.valueModulo n hn (n • z) = 0 := by
  have hq :
      (QuotientAddGroup.mk' (nsmulWithin v.valueGroup n)) (n • z) = 0 := by
    apply (QuotientAddGroup.eq_zero_iff _).2
    exact ⟨z, rfl⟩
  change (v.cyclic_value_quotients n hn)
      ((QuotientAddGroup.mk' (nsmulWithin v.valueGroup n)) (n • z)) = 0
  rw [hq, map_zero]
private theorem classFieldAxiom_unramifiedUnits_hMinusOne
    (v : ValuationData D A) (hcf : SatisfiesClassFieldAxiom A)
    (E : LevelExtension G)
    (hnormal : (extensionSubgroup E.base.field E.field.field E.below).Normal)
    (hUnramified : E.IsUnramified D)
    (g : E.base.field.toSubgroup ⧸
      extensionSubgroup E.base.field E.field.field E.below)
    (hg : ∀ x, x ∈ Subgroup.zpowers g) :
    letI := Fintype.ofFinite
      (E.base.field.toSubgroup ⧸
        extensionSubgroup E.base.field E.field.field E.below)
    Limits.IsZero
      (tateCohomology (v.unitRepresentation E hnormal) (-1)) := by
  let K := E.base.field
  let L := E.field.field
  let hLK := E.below
  let := hnormal
  let := Fintype.ofFinite
    (K.toSubgroup ⧸ extensionSubgroup K L hLK)
  let : IsCyclic (K.toSubgroup ⧸ extensionSubgroup K L hLK) :=
    isCyclic_of_generator g hg
  let : CommGroup (K.toSubgroup ⧸ extensionSubgroup K L hLK) :=
    IsCyclic.commGroup
  let U := v.unitRepresentation E hnormal
  let M := extensionFixedRepresentation A K L hLK hnormal
  let S := Rep.FiniteCyclicGroup.subCompNormHom U g
  let Kcf : FiniteLevel G := E.base
  let Ecf : CyclicExtension Kcf :=
    { field := L
      below := hLK
      normal := hnormal
      finite := inferInstance
      generator := g
      generates := hg }
  have hMzero : Limits.IsZero (tateCohomology M (-1)) :=
    by
      simpa [Kcf, Ecf,
        CyclicExtension.fixedRepresentation] using
          hcf.tateHMinusOne_isZero Kcf Ecf
  have hExact : S.Exact := by
    rw [S.moduleCat_exact_iff]
    intro u hu
    have huNorm : U.norm.hom u = 0 := by
      simpa [S] using hu
    let uM : M.V :=
      (extensionFixedRepresentationEquiv A K L hLK hnormal).symm u.1
    have huMNorm : M.norm.hom uM = 0 := by
      apply Subtype.ext
      calc
        (M.norm.hom uM).1 =
            ((relativeNorm A K L hLK
              (extensionFixedRepresentationEquiv A K L hLK hnormal uM) :
                fixedCoefficients A K) : A.V) :=
          extensionFixedRepresentation_norm_coe A K L hLK hnormal uM
        _ = ((relativeNorm A K L hLK u.1 :
                fixedCoefficients A K) : A.V) := by
          rfl
        _ = ((((U.norm.hom u).1 : fixedCoefficients A L)) : A.V) :=
          (v.unitRepresentation_norm_coe E hnormal u).symm
        _ = 0 := by rw [huNorm]; rfl
    obtain ⟨a, ha⟩ :=
      CyclicCohomology.normKernel_le_sigmaMinusOneRange_of_tateHMinusOne_isZero
        M g hg hMzero uM huMNorm
    let aL : fixedCoefficients A L :=
      extensionFixedRepresentationEquiv A K L hLK hnormal a
    obtain ⟨b, hb⟩ :=
      v.normalizedValuation_surjective E.base (v.valuationAt E.field aL)
    let bL : fixedCoefficients A L :=
      fixedFieldInclusion A K L hLK b
    let eL : fixedCoefficients A L := aL - bL
    have heL : v.valuationAt E.field eL = 0 := by
      change v.valuationAt E.field (aL - bL) = 0
      rw [map_sub,
        v.valuationAt_fixedFieldInclusion_of_unramified E hUnramified b,
        hb, sub_self]
    let e : U.V := ⟨eL, (v.mem_unitAddSubgroup_iff E.field eL).2 heL⟩
    refine ⟨e, ?_⟩
    have hactionSub :
        relativeCosetAction A K L hLK eL g =
          relativeCosetAction A K L hLK aL g -
            relativeCosetAction A K L hLK bL g := by
      refine Quotient.inductionOn' g ?_
      intro k
      rw [relativeCosetAction_mk, relativeCosetAction_mk,
        relativeCosetAction_mk]
      exact map_sub (A.ρ k.1) aL.1 bL.1
    have hactionB :
        relativeCosetAction A K L hLK bL g = bL.1 := by
      refine Quotient.inductionOn' g ?_
      intro k
      rw [relativeCosetAction_mk]
      exact b.2 k
    have hUaction :
        (((U.ρ g e).1 : fixedCoefficients A L) : A.V) =
          relativeCosetAction A K L hLK eL g := by
      simpa [U] using
        v.unitRepresentation_action_coe E hnormal g e
    have hMaction :
        (M.ρ g a).1 = relativeCosetAction A K L hLK aL g := by
      simpa [M, aL] using
        extensionFixedRepresentation_action_coe A K L hLK hnormal g a
    apply Subtype.ext
    apply Subtype.ext
    calc
      ((((U.ρ g e - e).1 : fixedCoefficients A L)) : A.V) =
          relativeCosetAction A K L hLK eL g - eL.1 := by
        change (((U.ρ g e).1 : fixedCoefficients A L) : A.V) -
            ((e.1 : fixedCoefficients A L) : A.V) = _
        rw [hUaction]
      _ = relativeCosetAction A K L hLK aL g - aL.1 := by
        rw [hactionSub, hactionB]
        change (_ - bL.1) - (aL.1 - bL.1) = _ - aL.1
        abel
      _ = (M.ρ g a - a).1 := by
        change _ = (M.ρ g a).1 - a.1
        rw [hMaction]
        rfl
      _ = uM.1 := congrArg Subtype.val ha
      _ = u.1.1 := rfl
  have hzeroS : Limits.IsZero S.homology :=
    (S.exact_iff_isZero_homology).1 hExact
  exact Limits.IsZero.of_iso hzeroS
    (TateCohomology.isoFiniteCyclicNegOne U g hg)
private theorem classFieldAxiom_unramifiedUnits_hZero
    (v : ValuationData D A) (hcf : SatisfiesClassFieldAxiom A)
    (E : LevelExtension G)
    (hnormal : (extensionSubgroup E.base.field E.field.field E.below).Normal)
    (hUnramified : E.IsUnramified D)
    (g : E.base.field.toSubgroup ⧸
      extensionSubgroup E.base.field E.field.field E.below)
    (hg : ∀ x, x ∈ Subgroup.zpowers g) :
    letI := Fintype.ofFinite
      (E.base.field.toSubgroup ⧸
        extensionSubgroup E.base.field E.field.field E.below)
    Limits.IsZero
      (tateCohomology (v.unitRepresentation E hnormal) 0) := by
  let K := E.base.field
  let L := E.field.field
  let hLK := E.below
  let := hnormal
  let := Fintype.ofFinite
    (K.toSubgroup ⧸ extensionSubgroup K L hLK)
  let : IsCyclic (K.toSubgroup ⧸ extensionSubgroup K L hLK) :=
    isCyclic_of_generator g hg
  let : CommGroup (K.toSubgroup ⧸ extensionSubgroup K L hLK) :=
    IsCyclic.commGroup
  let n := (E.degree : ℕ)
  have hn : 0 < n := E.degree.property
  let M := extensionFixedRepresentation A K L hLK hnormal
  let instM : Module ℤ M.V := M.hV2
  let T := Rep.FiniteCyclicGroup.normHomCompSub M g
  let instTCycles : Module ℤ (LinearMap.ker T.g.hom) :=
    (LinearMap.ker T.g.hom).module
  let C := LinearMap.ker T.g.hom
  let cycleValAdd : C →+ ZMod n :=
    (v.valueModulo n hn).comp <|
      (v.valuationAt E.field).comp <|
        (extensionFixedRepresentationEquiv A K L hLK hnormal).toAddMonoidHom.comp
          C.subtype.toAddMonoidHom
  let cycleVal : C →ₗ[ℤ] ZMod n :=
    { toFun := cycleValAdd
      map_add' := cycleValAdd.map_add
      map_smul' := by
        intro m x
        simp only [RingHom.id_apply]
        convert! cycleValAdd.map_zsmul m x using 1
        exact congrArg cycleValAdd (int_smul_eq_zsmul ..) }
  have hcycleValNorm :
      LinearMap.range T.moduleCatToCycles ≤ LinearMap.ker cycleVal := by
    rintro x ⟨y, rfl⟩
    let yL : fixedCoefficients A L :=
      extensionFixedRepresentationEquiv A K L hLK hnormal y
    let normK : fixedCoefficients A K :=
      relativeNorm A K L hLK yL
    have hnormM :
        extensionFixedRepresentationEquiv A K L hLK hnormal (M.norm.hom y) =
          fixedFieldInclusion A K L hLK normK := by
      apply Subtype.ext
      exact extensionFixedRepresentation_norm_coe A K L hLK hnormal y
    have htower := v.normalizedValuation_tower E yL
    change (E.residueDegree D : ℕ) •
        ((v.valuationAt E.field yL : v.valueGroup) : ZHat) =
      ((v.valuationAt E.base
        (relativeNorm A E.base.field E.field.field E.below yL) :
          v.valueGroup) : ZHat) at htower
    rw [E.residueDegree_eq_degree_of_isUnramified D hUnramified] at htower
    have hvalNorm :
        v.valuationAt E.field
            (extensionFixedRepresentationEquiv A K L hLK hnormal
              (M.norm.hom y)) =
          n • v.valuationAt E.field yL := by
      rw [hnormM,
        v.valuationAt_fixedFieldInclusion_of_unramified E hUnramified normK]
      apply Subtype.ext
      exact htower.symm
    change v.valueModulo n hn
        (v.valuationAt E.field
          (extensionFixedRepresentationEquiv A K L hLK hnormal
            (M.norm.hom y))) = 0
    rw [hvalNorm]
    exact v.valueModulo_nsmul n hn (v.valuationAt E.field yL)
  let H := T.moduleCatLeftHomologyData.H
  let fieldVal : H →ₗ[ℤ] ZMod n :=
    (LinearMap.range T.moduleCatToCycles).liftQ cycleVal hcycleValNorm
  have hfieldValSurjective : Function.Surjective fieldVal := by
    intro z
    obtain ⟨c, hc⟩ := v.valueModulo_surjective n hn z
    obtain ⟨aK, haK⟩ := v.normalizedValuation_surjective E.base c
    let aL : fixedCoefficients A L :=
      fixedFieldInclusion A K L hLK aK
    let aM : M.V :=
      (extensionFixedRepresentationEquiv A K L hLK hnormal).symm aL
    have haMfixed : M.ρ g aM = aM := by
      refine Quotient.inductionOn' g ?_
      intro k
      apply Subtype.ext
      change A.ρ k.1 aK.1 = aK.1
      exact aK.2 k
    have haMcycle : T.g aM = 0 := by
      change M.ρ g aM - aM = 0
      exact sub_eq_zero.mpr haMfixed
    let aCycle : C := ⟨aM, haMcycle⟩
    refine ⟨Submodule.mkQ (LinearMap.range T.moduleCatToCycles) aCycle, ?_⟩
    change v.valueModulo n hn (v.valuationAt E.field aL) = z
    rw [v.valuationAt_fixedFieldInclusion_of_unramified E hUnramified aK,
      haK]
    exact hc
  let homologyEquiv : H ≃ T.homology :=
    { toFun := fun x => T.moduleCatLeftHomologyData.homologyIso.inv x
      invFun := fun x => T.moduleCatLeftHomologyData.homologyIso.hom x
      left_inv := by intro x; simp
      right_inv := by intro x; simp }
  let eHTate : H ≃ tateCohomology M 0 :=
    homologyEquiv.trans
      (TateCohomology.isoFiniteCyclicZero M g hg).symm.toLinearEquiv.toEquiv
  let Kcf : FiniteLevel G := E.base
  let Ecf : CyclicExtension Kcf :=
    { field := E.field.field
      below := E.below
      normal := hnormal
      finite := E.finiteQuotient
      generator := g
      generates := hg }
  let hEcfTateFinite :
      Finite (tateCohomology (Ecf.fixedRepresentation A) 0) :=
    (hcf Kcf Ecf).finiteTateHZero
  let hMTateFinite : Finite (tateCohomology M 0) := by
    simpa [M, K, L, hLK, Kcf, Ecf,
      CyclicExtension.fixedRepresentation] using hEcfTateFinite
  let hHFinite : Finite H :=
    Finite.of_equiv (tateCohomology M 0) eHTate.symm
  have hcardT : Nat.card H = n := by
    calc
      Nat.card H = Nat.card (tateCohomology M 0) :=
        Nat.card_congr eHTate
      _ = n := by
        convert hcf.tateHZero_card Kcf Ecf using 1 <;>
          simp [n, M, K, L, Kcf, Ecf,
            CyclicExtension.fixedRepresentation,
            CyclicExtension.toFiniteAbstractExtension,
            LevelExtension.degree,
            LevelExtension.toFiniteAbstractExtension]
  have hfieldValInjective : Function.Injective fieldVal :=
    ((Nat.bijective_iff_surjective_and_card fieldVal).2
      ⟨hfieldValSurjective, hcardT.trans (Nat.card_zmod n).symm⟩).1
  let U := v.unitRepresentation E hnormal
  let S := Rep.FiniteCyclicGroup.normHomCompSub U g
  have hExact : S.Exact := by
    rw [S.moduleCat_exact_iff]
    intro u hu
    have huFixed : U.ρ g u = u := by
      apply sub_eq_zero.mp
      simpa [S, Rep.sub_hom, Rep.applyAsHom_apply] using hu
    let uM : M.V :=
      (extensionFixedRepresentationEquiv A K L hLK hnormal).symm u.1
    have huMFixed : M.ρ g uM = uM := by
      have hUaction :
          (((U.ρ g u).1 : fixedCoefficients A L) : A.V) =
            relativeCosetAction A K L hLK u.1 g := by
        simpa [U] using
          v.unitRepresentation_action_coe E hnormal g u
      have hMaction :
          (M.ρ g uM).1 = relativeCosetAction A K L hLK u.1 g := by
        simpa [M, uM] using
          extensionFixedRepresentation_action_coe A K L hLK hnormal g uM
      apply Subtype.ext
      calc
        (M.ρ g uM).1 = relativeCosetAction A K L hLK u.1 g := hMaction
        _ = (((U.ρ g u).1 : fixedCoefficients A L) : A.V) :=
          hUaction.symm
        _ = u.1.1 := by rw [huFixed]
        _ = uM.1 := rfl
    have huMcycle : T.g uM = 0 := by
      change M.ρ g uM - uM = 0
      exact sub_eq_zero.mpr huMFixed
    let uCycle : C := ⟨uM, huMcycle⟩
    have huClassVal :
        fieldVal (Submodule.mkQ (LinearMap.range T.moduleCatToCycles) uCycle) = 0 := by
      change v.valueModulo n hn (v.valuationAt E.field u.1) = 0
      rw [(v.mem_unitAddSubgroup_iff E.field u.1).1 u.2, map_zero]
    have huClass :
        Submodule.mkQ (LinearMap.range T.moduleCatToCycles) uCycle = 0 := by
      apply hfieldValInjective
      exact huClassVal.trans (map_zero fieldVal).symm
    have huCycleRange :
        uCycle ∈ LinearMap.range T.moduleCatToCycles := by
      exact (Submodule.Quotient.mk_eq_zero _).1 huClass
    obtain ⟨y, hy⟩ := huCycleRange
    have hyNorm : M.norm.hom y = uM := by
      exact congrArg Subtype.val hy
    let yL : fixedCoefficients A L :=
      extensionFixedRepresentationEquiv A K L hLK hnormal y
    let normK : fixedCoefficients A K :=
      relativeNorm A K L hLK yL
    have hnormInclusion :
        fixedFieldInclusion A K L hLK normK = u.1 := by
      apply Subtype.ext
      calc
        normK.1 = (M.norm.hom y).1 :=
          (extensionFixedRepresentation_norm_coe A K L hLK hnormal y).symm
        _ = uM.1 := congrArg Subtype.val hyNorm
        _ = u.1.1 := rfl
    have huVal : v.valuationAt E.field u.1 = 0 :=
      (v.mem_unitAddSubgroup_iff E.field u.1).1 u.2
    have htower := v.normalizedValuation_tower E yL
    change (E.residueDegree D : ℕ) •
        ((v.valuationAt E.field yL : v.valueGroup) : ZHat) =
      ((v.valuationAt E.base
        (relativeNorm A E.base.field E.field.field E.below yL) :
          v.valueGroup) : ZHat) at htower
    rw [E.residueDegree_eq_degree_of_isUnramified D hUnramified] at htower
    have hyVal : v.valuationAt E.field yL = 0 := by
      apply Subtype.ext
      apply zHatMulNat_injective hn
      calc
        n • ((v.valuationAt E.field yL : v.valueGroup) : ZHat) =
            ((v.valuationAt E.base normK : v.valueGroup) : ZHat) := htower
        _ = ((v.valuationAt E.field
              (fixedFieldInclusion A K L hLK normK) : v.valueGroup) : ZHat) := by
          rw [v.valuationAt_fixedFieldInclusion_of_unramified E hUnramified normK]
        _ = ((v.valuationAt E.field u.1 : v.valueGroup) : ZHat) := by
          rw [hnormInclusion]
        _ = 0 := congrArg Subtype.val huVal
        _ = n • (0 : ZHat) := (nsmul_zero n).symm
    let yU : U.V :=
      ⟨yL, (v.mem_unitAddSubgroup_iff E.field yL).2 hyVal⟩
    refine ⟨yU, ?_⟩
    apply Subtype.ext
    apply Subtype.ext
    calc
      ((((U.norm.hom yU).1 : fixedCoefficients A L)) : A.V) =
          normK.1 := v.unitRepresentation_norm_coe E hnormal yU
      _ = (M.norm.hom y).1 :=
        (extensionFixedRepresentation_norm_coe A K L hLK hnormal y).symm
      _ = uM.1 := congrArg Subtype.val hyNorm
      _ = u.1.1 := rfl
  have hzeroS : Limits.IsZero S.homology :=
    (S.exact_iff_isZero_homology).1 hExact
  exact Limits.IsZero.of_iso hzeroS
    (TateCohomology.isoFiniteCyclicZero U g hg)

theorem classFieldAxiom_implies_unramifiedUnitCohomology
    (v : ValuationData D A) (hcf : SatisfiesClassFieldAxiom A) :
    SatisfiesUnramifiedUnitCohomology D v := by
  intro K E
  constructor
  · simpa [FiniteUnramifiedCyclicExtension.unitRepresentation] using
      v.classFieldAxiom_unramifiedUnits_hZero hcf
        E.toLevelExtension E.normal
        E.toLevelExtension_isUnramified E.generator E.generates
  · simpa [FiniteUnramifiedCyclicExtension.unitRepresentation] using
      v.classFieldAxiom_unramifiedUnits_hMinusOne hcf
        E.toLevelExtension E.normal
        E.toLevelExtension_isUnramified E.generator E.generates
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

theorem symbolNaturalityRestriction_sameBase_eq_restriction
    {G : Type*} [Group G] [TopologicalSpace G]
    (K M L : ClosedSubgroup G)
    (hLM : L.toSubgroup ≤ M.toSubgroup)
    (hMK : M.toSubgroup ≤ K.toSubgroup)
    [hLnormal :
      (extensionSubgroup K L (hLM.trans hMK)).Normal]
    [hMnormal : (extensionSubgroup K M hMK).Normal] :
    symbolNaturalityRestriction K K M L hMK (hLM.trans hMK) le_rfl hLM =
      abstractReciprocityRestriction K M L hLM hMK := by
  apply MonoidHom.ext
  intro q
  refine QuotientGroup.induction_on q ?_
  intro k
  rfl

theorem reciprocity_intermediateQuotient_finite
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

def abstractReciprocityInclusion
    {G : Type*} [Group G] [TopologicalSpace G]
    (K M L : ClosedSubgroup G)
    (hLM : L.toSubgroup ≤ M.toSubgroup)
    (hMK : M.toSubgroup ≤ K.toSubgroup)
    [hLnormal :
      (extensionSubgroup K L (hLM.trans hMK)).Normal] :
    letI : (extensionSubgroup M L hLM).Normal :=
      transferNormNaturality_intermediateExtension_normal K M L hLM hMK
    (M.toSubgroup ⧸ extensionSubgroup M L hLM) →*
      (K.toSubgroup ⧸ extensionSubgroup K L (hLM.trans hMK)) := by
  letI : (extensionSubgroup M L hLM).Normal :=
    transferNormNaturality_intermediateExtension_normal K M L hLM hMK
  exact transferNormNaturalityIntermediateInclusion K M L hLM hMK

theorem reciprocity_galois_exact
    {G : Type*} [Group G] [TopologicalSpace G]
    (K M L : ClosedSubgroup G)
    (hLM : L.toSubgroup ≤ M.toSubgroup)
    (hMK : M.toSubgroup ≤ K.toSubgroup)
    [hLnormal :
      (extensionSubgroup K L (hLM.trans hMK)).Normal]
    [hMnormal : (extensionSubgroup K M hMK).Normal] :
    letI : (extensionSubgroup M L hLM).Normal :=
      transferNormNaturality_intermediateExtension_normal K M L hLM hMK
    (abstractReciprocityRestriction K M L hLM hMK).ker =
      (abstractReciprocityInclusion K M L hLM hMK).range := by
  let : (extensionSubgroup M L hLM).Normal :=
    transferNormNaturality_intermediateExtension_normal K M L hLM hMK
  ext q
  refine QuotientGroup.induction_on q ?_
  intro k
  constructor
  · intro hk
    change abstractReciprocityRestriction K M L hLM hMK
      (QuotientGroup.mk k) = 1 at hk
    have hkM : k ∈ extensionSubgroup K M hMK :=
      (QuotientGroup.eq_one_iff k).1 hk
    let m : M.toSubgroup := ⟨k.1, hkM⟩
    refine ⟨QuotientGroup.mk m, ?_⟩
    exact congrArg
      (fun t : K.toSubgroup =>
        (QuotientGroup.mk t :
          K.toSubgroup ⧸ extensionSubgroup K L (hLM.trans hMK)))
      (Subtype.ext rfl)
  · rintro ⟨q, hq⟩
    rw [← hq]
    refine QuotientGroup.induction_on q ?_
    intro m
    change (QuotientGroup.mk (Subgroup.inclusion hMK m) :
      K.toSubgroup ⧸ extensionSubgroup K M hMK) = 1
    exact (QuotientGroup.eq_one_iff _).2 m.2
 
theorem reciprocity_lowerExtension_finite
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

theorem reciprocity_finiteNormSubgroup_le
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
 
def abstractReciprocityNormMap
    (A : Rep ℤ G) (K M L : ClosedSubgroup G)
    (hLM : L.toSubgroup ≤ M.toSubgroup)
    (hMK : M.toSubgroup ≤ K.toSubgroup)
    [hLnormal :
      (extensionSubgroup K L (hLM.trans hMK)).Normal]
    [hMnormal : (extensionSubgroup K M hMK).Normal]
    [hKLfinite : Finite
      (K.toSubgroup ⧸ extensionSubgroup K L (hLM.trans hMK))] :
    letI : Finite (M.toSubgroup ⧸ extensionSubgroup M L hLM) :=
      reciprocity_lowerExtension_finite K M L hLM hMK
    letI : Finite (K.toSubgroup ⧸ extensionSubgroup K M hMK) :=
      reciprocity_intermediateQuotient_finite K M L hLM hMK
    FiniteNormQuotient A M L hLM →+
      FiniteNormQuotient A K L (hLM.trans hMK) := by
  letI : Finite (M.toSubgroup ⧸ extensionSubgroup M L hLM) :=
    reciprocity_lowerExtension_finite K M L hLM hMK
  letI : Finite (K.toSubgroup ⧸ extensionSubgroup K M hMK) :=
    reciprocity_intermediateQuotient_finite K M L hLM hMK
  exact symbolNaturalityNormMap A K M L L (hLM.trans hMK) hLM hMK le_rfl

@[simp]
theorem abstractReciprocityNormMap_finiteNormClass
    (A : Rep ℤ G) (K M L : ClosedSubgroup G)
    (hLM : L.toSubgroup ≤ M.toSubgroup)
    (hMK : M.toSubgroup ≤ K.toSubgroup)
    [hLnormal :
      (extensionSubgroup K L (hLM.trans hMK)).Normal]
    [hMnormal : (extensionSubgroup K M hMK).Normal]
    [hKLfinite : Finite
      (K.toSubgroup ⧸ extensionSubgroup K L (hLM.trans hMK))]
    (a : fixedCoefficients A M) :
    letI : Finite (M.toSubgroup ⧸ extensionSubgroup M L hLM) :=
      reciprocity_lowerExtension_finite K M L hLM hMK
    letI : Finite (K.toSubgroup ⧸ extensionSubgroup K M hMK) :=
      reciprocity_intermediateQuotient_finite K M L hLM hMK
    abstractReciprocityNormMap A K M L hLM hMK
        (finiteNormClass A M L hLM a) =
      finiteNormClass A K L (hLM.trans hMK)
        (relativeNorm A K M hMK a) := by
  let : Finite (M.toSubgroup ⧸ extensionSubgroup M L hLM) :=
    reciprocity_lowerExtension_finite K M L hLM hMK
  let : Finite (K.toSubgroup ⧸ extensionSubgroup K M hMK) :=
    reciprocity_intermediateQuotient_finite K M L hLM hMK
  exact symbolNaturalityNormMap_finiteNormClass A K M L L
    (hLM.trans hMK) hLM hMK le_rfl a

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
      reciprocity_lowerExtension_finite K M L hLM hMK
    letI : Finite (K.toSubgroup ⧸ extensionSubgroup K M hMK) :=
      reciprocity_intermediateQuotient_finite K M L hLM hMK
    FiniteNormQuotient A K L (hLM.trans hMK) →+
      FiniteNormQuotient A K M hMK := by
  letI : Finite (M.toSubgroup ⧸ extensionSubgroup M L hLM) :=
    reciprocity_lowerExtension_finite K M L hLM hMK
  letI : Finite (K.toSubgroup ⧸ extensionSubgroup K M hMK) :=
    reciprocity_intermediateQuotient_finite K M L hLM hMK
  apply finiteNormQuotientLift A K L (hLM.trans hMK)
    (finiteNormClassHom A K M hMK)
  intro a ha
  exact (finiteNormClass_eq_zero_iff A K M hMK a).2
    (reciprocity_finiteNormSubgroup_le A K M L hLM hMK ha)

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
    (a : fixedCoefficients A K) :
    letI : Finite (M.toSubgroup ⧸ extensionSubgroup M L hLM) :=
      reciprocity_lowerExtension_finite K M L hLM hMK
    letI : Finite (K.toSubgroup ⧸ extensionSubgroup K M hMK) :=
      reciprocity_intermediateQuotient_finite K M L hLM hMK
    abstractReciprocityNormProjection A K M L hLM hMK
        (finiteNormClass A K L (hLM.trans hMK) a) =
      finiteNormClass A K M hMK a := by
  let : Finite (M.toSubgroup ⧸ extensionSubgroup M L hLM) :=
    reciprocity_lowerExtension_finite K M L hLM hMK
  let : Finite (K.toSubgroup ⧸ extensionSubgroup K M hMK) :=
    reciprocity_intermediateQuotient_finite K M L hLM hMK
  simp [abstractReciprocityNormProjection]
  rfl

theorem symbolNaturalityNormMap_sameBase_eq_normProjection
    (A : Rep ℤ G) (K M L : ClosedSubgroup G)
    (hLM : L.toSubgroup ≤ M.toSubgroup)
    (hMK : M.toSubgroup ≤ K.toSubgroup)
    [hLnormal :
      (extensionSubgroup K L (hLM.trans hMK)).Normal]
    [hMnormal : (extensionSubgroup K M hMK).Normal]
    [hKLfinite : Finite
      (K.toSubgroup ⧸ extensionSubgroup K L (hLM.trans hMK))] :
    letI : Finite (M.toSubgroup ⧸ extensionSubgroup M L hLM) :=
      reciprocity_lowerExtension_finite K M L hLM hMK
    letI : Finite (K.toSubgroup ⧸ extensionSubgroup K M hMK) :=
      reciprocity_intermediateQuotient_finite K M L hLM hMK
    letI : Finite (K.toSubgroup ⧸ extensionSubgroup K K le_rfl) :=
      (GaloisExtension.refl K).finite
    symbolNaturalityNormMap A K K M L hMK (hLM.trans hMK) le_rfl hLM =
      abstractReciprocityNormProjection A K M L hLM hMK := by
  let : Finite (M.toSubgroup ⧸ extensionSubgroup M L hLM) :=
    reciprocity_lowerExtension_finite K M L hLM hMK
  let : Finite (K.toSubgroup ⧸ extensionSubgroup K M hMK) :=
    reciprocity_intermediateQuotient_finite K M L hLM hMK
  let : Finite (K.toSubgroup ⧸ extensionSubgroup K K le_rfl) :=
    (GaloisExtension.refl K).finite
  apply AddMonoidHom.ext
  intro q
  obtain ⟨a,rfl⟩ := finiteNormClass_surjective A K L (hLM.trans hMK) q
  have hmap := symbolNaturalityNormMap_finiteNormClass
    A K K M L hMK (hLM.trans hMK) le_rfl hLM a
  have hnorm := congrArg (finiteNormClass A K M hMK) (relativeNorm_self A K a)
  exact hmap.trans (hnorm.trans
    (abstractReciprocityNormProjection_finiteNormClass A K M L hLM hMK a).symm)
 
theorem abstractReciprocityNormProjection_surjective
    (A : Rep ℤ G) (K M L : ClosedSubgroup G)
    (hLM : L.toSubgroup ≤ M.toSubgroup)
    (hMK : M.toSubgroup ≤ K.toSubgroup)
    [hLnormal :
      (extensionSubgroup K L (hLM.trans hMK)).Normal]
    [hMnormal : (extensionSubgroup K M hMK).Normal]
    [hKLfinite : Finite
      (K.toSubgroup ⧸ extensionSubgroup K L (hLM.trans hMK))] :
    letI : Finite (M.toSubgroup ⧸ extensionSubgroup M L hLM) :=
      reciprocity_lowerExtension_finite K M L hLM hMK
    letI : Finite (K.toSubgroup ⧸ extensionSubgroup K M hMK) :=
      reciprocity_intermediateQuotient_finite K M L hLM hMK
    Function.Surjective (abstractReciprocityNormProjection A K M L hLM hMK) := by
  let : Finite (M.toSubgroup ⧸ extensionSubgroup M L hLM) :=
    reciprocity_lowerExtension_finite K M L hLM hMK
  let : Finite (K.toSubgroup ⧸ extensionSubgroup K M hMK) :=
    reciprocity_intermediateQuotient_finite K M L hLM hMK
  intro q
  obtain ⟨a,rfl⟩ := finiteNormClass_surjective A K M hMK q
  exact ⟨finiteNormClass A K L (hLM.trans hMK) a, by
    rw [abstractReciprocityNormProjection_finiteNormClass]⟩
 
theorem reciprocity_normQuotient_exact
    (A : Rep ℤ G) (K M L : ClosedSubgroup G)
    (hLM : L.toSubgroup ≤ M.toSubgroup)
    (hMK : M.toSubgroup ≤ K.toSubgroup)
    [hLnormal :
      (extensionSubgroup K L (hLM.trans hMK)).Normal]
    [hMnormal : (extensionSubgroup K M hMK).Normal]
    [hKLfinite : Finite
      (K.toSubgroup ⧸ extensionSubgroup K L (hLM.trans hMK))] :
    letI : Finite (M.toSubgroup ⧸ extensionSubgroup M L hLM) :=
      reciprocity_lowerExtension_finite K M L hLM hMK
    letI : Finite (K.toSubgroup ⧸ extensionSubgroup K M hMK) :=
      reciprocity_intermediateQuotient_finite K M L hLM hMK
    Function.Exact (abstractReciprocityNormMap A K M L hLM hMK)
      (abstractReciprocityNormProjection A K M L hLM hMK) := by
  let : Finite (M.toSubgroup ⧸ extensionSubgroup M L hLM) :=
    reciprocity_lowerExtension_finite K M L hLM hMK
  let : Finite (K.toSubgroup ⧸ extensionSubgroup K M hMK) :=
    reciprocity_intermediateQuotient_finite K M L hLM hMK
  rw [AddMonoidHom.exact_iff]
  ext q
  obtain ⟨a,rfl⟩ := finiteNormClass_surjective A K L (hLM.trans hMK) q
  constructor
  · intro ha
    change abstractReciprocityNormProjection A K M L hLM hMK
        (finiteNormClass A K L (hLM.trans hMK) a) = 0 at ha
    rw [abstractReciprocityNormProjection_finiteNormClass] at ha
    have haM : a ∈ finiteNormSubgroup A K M hMK :=
      (finiteNormClass_eq_zero_iff A K M hMK a).1 ha
    obtain ⟨b, rfl⟩ := haM
    exact ⟨finiteNormClass A M L hLM b, by
      rw [abstractReciprocityNormMap_finiteNormClass]⟩
  · rintro ⟨q, hq⟩
    rw [← hq]
    obtain ⟨b,rfl⟩ := finiteNormClass_surjective A M L hLM q
    change abstractReciprocityNormProjection A K M L hLM hMK
        (abstractReciprocityNormMap A K M L hLM hMK
          (finiteNormClass A M L hLM b)) = 0
    rw [abstractReciprocityNormMap_finiteNormClass,
      abstractReciprocityNormProjection_finiteNormClass]
    exact (finiteNormClass_eq_zero_iff A K M hMK _).2 ⟨b, rfl⟩

theorem reciprocity_cyclicTower_normMap_injective
    (A : Rep ℤ G) (hcf : SatisfiesClassFieldAxiom A)
    (K M L : ClosedSubgroup G)
    (hLM : L.toSubgroup ≤ M.toSubgroup)
    (hMK : M.toSubgroup ≤ K.toSubgroup)
    [hKabsolute : Finite ((baseField G).toSubgroup ⧸
      extensionSubgroup (baseField G) K (le_baseField K))]
    [hLnormal :
      (extensionSubgroup K L (hLM.trans hMK)).Normal]
    [hMnormal : (extensionSubgroup K M hMK).Normal]
    [hKLfinite : Finite
      (K.toSubgroup ⧸ extensionSubgroup K L (hLM.trans hMK))]
    (gKL : K.toSubgroup ⧸
      extensionSubgroup K L (hLM.trans hMK))
    (hgKL : ∀ q, q ∈ Subgroup.zpowers gKL)
    (gML :
      letI : (extensionSubgroup M L hLM).Normal :=
        transferNormNaturality_intermediateExtension_normal K M L hLM hMK
      M.toSubgroup ⧸ extensionSubgroup M L hLM)
    (hgML :
      letI : (extensionSubgroup M L hLM).Normal :=
        transferNormNaturality_intermediateExtension_normal K M L hLM hMK
      ∀ q, q ∈ Subgroup.zpowers gML)
    (gKM : K.toSubgroup ⧸ extensionSubgroup K M hMK)
    (hgKM : ∀ q, q ∈ Subgroup.zpowers gKM) :
    letI : Finite (M.toSubgroup ⧸ extensionSubgroup M L hLM) :=
      reciprocity_lowerExtension_finite K M L hLM hMK
    letI : Finite (K.toSubgroup ⧸ extensionSubgroup K M hMK) :=
      reciprocity_intermediateQuotient_finite K M L hLM hMK
    Function.Injective (abstractReciprocityNormMap A K M L hLM hMK) := by
  let hMLnormal : (extensionSubgroup M L hLM).Normal :=
    transferNormNaturality_intermediateExtension_normal K M L hLM hMK
  let hMLfinite : Finite
      (M.toSubgroup ⧸ extensionSubgroup M L hLM) :=
    reciprocity_lowerExtension_finite K M L hLM hMK
  let hKMfinite : Finite
      (K.toSubgroup ⧸ extensionSubgroup K M hMK) :=
    reciprocity_intermediateQuotient_finite K M L hLM hMK
  let hMabsolute : Finite ((baseField G).toSubgroup ⧸
      extensionSubgroup (baseField G) M (le_baseField M)) :=
    relativeTowerQuotientFinite (baseField G) K M hMK (le_baseField K)
  let ELM : DegreeData.FiniteAbstractExtension G :=
    DegreeData.FiniteAbstractExtension.ofInclusion L M hLM
  let EMK : DegreeData.FiniteAbstractExtension G :=
    DegreeData.FiniteAbstractExtension.ofInclusion M K hMK
  let ELK : DegreeData.FiniteAbstractExtension G :=
    DegreeData.FiniteAbstractExtension.ofInclusion L K (hLM.trans hMK)
  let hELMbaseAbsolute : Finite ((baseField G).toSubgroup ⧸
      extensionSubgroup (baseField G) ELM.base (le_baseField ELM.base)) := by
    simpa [ELM, DegreeData.FiniteAbstractExtension.ofInclusion] using hMabsolute
  let hEMKbaseAbsolute : Finite ((baseField G).toSubgroup ⧸
      extensionSubgroup (baseField G) EMK.base (le_baseField EMK.base)) := by
    simpa [EMK, DegreeData.FiniteAbstractExtension.ofInclusion] using hKabsolute
  let hELKbaseAbsolute : Finite ((baseField G).toSubgroup ⧸
      extensionSubgroup (baseField G) ELK.base (le_baseField ELK.base)) := by
    simpa [ELK, DegreeData.FiniteAbstractExtension.ofInclusion] using hKabsolute
  let f := abstractReciprocityNormMap A K M L hLM hMK
  let p := abstractReciprocityNormProjection A K M L hLM hMK
  let : Finite (FiniteNormQuotient A M L hLM) :=
    finiteNormQuotient_finite_of_classFieldAxiom
      A hcf ELM hMLnormal gML hgML
  let : Finite (FiniteNormQuotient A K L (hLM.trans hMK)) :=
    finiteNormQuotient_finite_of_classFieldAxiom
      A hcf ELK hLnormal gKL hgKL
  let : Finite (FiniteNormQuotient A K M hMK) :=
    finiteNormQuotient_finite_of_classFieldAxiom
      A hcf EMK hMnormal gKM hgKM
  have hexact : p.ker = f.range :=
    (AddMonoidHom.exact_iff).1
      (reciprocity_normQuotient_exact A K M L hLM hMK)
  have hpsurjective : Function.Surjective p :=
    abstractReciprocityNormProjection_surjective A K M L hLM hMK
  have hmiddle :
      Nat.card (FiniteNormQuotient A K L (hLM.trans hMK)) =
        Nat.card f.range *
          Nat.card (FiniteNormQuotient A K M hMK) := by
    calc
      Nat.card (FiniteNormQuotient A K L (hLM.trans hMK)) =
          Nat.card p.ker * p.ker.index :=
        (AddSubgroup.card_mul_index p.ker).symm
      _ = Nat.card f.range * Nat.card p.range := by
        rw [AddSubgroup.index_ker, hexact]
      _ = Nat.card f.range *
          Nat.card (FiniteNormQuotient A K M hMK) := by
        have hpRange : p.range = ⊤ :=
          (AddMonoidHom.range_eq_top).2 hpsurjective
        rw [hpRange]
        simp
  have hdegree :
      (ELM.degree : ℕ) * (EMK.degree : ℕ) = (ELK.degree : ℕ) := by
    rw [← ELM.relIndex_eq_degree, ← EMK.relIndex_eq_degree,
      ← ELK.relIndex_eq_degree]
    exact Subgroup.relIndex_mul_relIndex L.toSubgroup M.toSubgroup
      K.toSubgroup hLM hMK
  have hKMpositive : 0 < (EMK.degree : ℕ) := EMK.degree.property
  have hcardML :
      Nat.card (FiniteNormQuotient A M L hLM) =
        (ELM.degree : ℕ) := by
    simpa [ELM, DegreeData.FiniteAbstractExtension.ofInclusion] using
      finiteNormQuotient_card_of_classFieldAxiom
        A hcf ELM hMLnormal gML hgML
  have hcardKL :
      Nat.card (FiniteNormQuotient A K L (hLM.trans hMK)) =
        (ELK.degree : ℕ) := by
    simpa [ELK, DegreeData.FiniteAbstractExtension.ofInclusion] using
      finiteNormQuotient_card_of_classFieldAxiom
        A hcf ELK hLnormal gKL hgKL
  have hcardKM :
      Nat.card (FiniteNormQuotient A K M hMK) =
        (EMK.degree : ℕ) := by
    simpa [EMK, DegreeData.FiniteAbstractExtension.ofInclusion] using
      finiteNormQuotient_card_of_classFieldAxiom
        A hcf EMK hMnormal gKM hgKM
  have hcardRange :
      Nat.card (FiniteNormQuotient A M L hLM) =
        Nat.card f.range := by
    apply Nat.mul_right_cancel hKMpositive
    calc
      Nat.card (FiniteNormQuotient A M L hLM) *
          (EMK.degree : ℕ) =
          (ELM.degree : ℕ) * (EMK.degree : ℕ) := by
        rw [hcardML]
      _ = (ELK.degree : ℕ) := hdegree
      _ = Nat.card (FiniteNormQuotient A K L (hLM.trans hMK)) := by
        rw [hcardKL]
      _ = Nat.card f.range *
          Nat.card (FiniteNormQuotient A K M hMK) := hmiddle
      _ = Nat.card f.range * (EMK.degree : ℕ) := by
        rw [hcardKM]
  have hRangeBijective : Function.Bijective f.rangeRestrict :=
    (Nat.bijective_iff_surjective_and_card f.rangeRestrict).2
      ⟨AddMonoidHom.rangeRestrict_surjective f, hcardRange⟩
  intro x y hxy
  apply hRangeBijective.1
  exact Subtype.ext hxy

theorem reciprocity_zHat_nsmul_eq_natCast_forces_zero
    (n k : ℕ) (hn : 0 < n) (hk : k < n) (z : ZHat)
    (h : n • z =
      Int.castRingHom ZHat (k : ℤ)) :
    k = 0 := by
  have hkmod : (k : ZMod n) = 0 := by
    have hkmodInt : ((k : ℤ) : ZMod n) = 0 := by
      calc
        ((k : ℤ) : ZMod n) = zHatReduction n hn
          (Int.castRingHom ZHat (k : ℤ)) :=
              (zHatReduction_int n hn (k : ℤ)).symm
        _ =
          zHatReduction n hn (n • z) := congrArg (zHatReduction n hn) h.symm
        _ = n • zHatReduction n hn z := map_nsmul (zHatReduction n hn) n z
        _ = 0 := by simp
    simpa using hkmodInt
  exact Nat.eq_zero_of_dvd_of_lt
    ((ZMod.natCast_eq_zero_iff k n).1 hkmod) hk

theorem reciprocity_valuationAt_fixedFieldInclusion_of_totallyRamified
    {D : DegreeData G} {A : Rep ℤ G} (v : ValuationData D A)
    (E : LevelExtension G)
    (hTot : E.IsTotallyRamified D)
    (x : fixedCoefficients A E.base.field) :
    ((v.valuationAt E.field
      (fixedFieldInclusion A E.base.field E.field.field E.below x) :
      v.valueGroup) : ZHat) =
      (E.degree : ℕ) •
        ((v.valuationAt E.base x : v.valueGroup) : ZHat) := by
  let EF := E.toFiniteAbstractExtension
  let hEFfinite : Finite
      (E.base.field.toSubgroup ⧸
        extensionSubgroup E.base.field E.field.field E.below) :=
    EF.finiteQuotient
  have htower := v.normalizedValuation_tower E
    (fixedFieldInclusion A E.base.field E.field.field E.below x)
  have hresidue : (E.residueDegree D : ℕ) = 1 :=
    EF.residueDegree_eq_one_of_isTotallyRamified D hTot
  change (E.residueDegree D : ℕ) •
      ((v.valuationAt E.field
        (fixedFieldInclusion A E.base.field E.field.field E.below x) :
          v.valueGroup) : ZHat) =
    ((v.valuationAt E.base
      (relativeNorm A E.base.field E.field.field E.below
        (fixedFieldInclusion A E.base.field E.field.field E.below x)) :
          v.valueGroup) : ZHat) at htower
  rw [hresidue, one_nsmul] at htower
  have hbelow : E.below = EF.below := Subsingleton.elim _ _
  rw [hbelow] at htower
  change
    ((v.valuationAt E.field
      (fixedFieldInclusion A EF.base EF.field EF.below x) :
        v.valueGroup) : ZHat) =
      ((v.valuationAt E.base
        (relativeNorm A EF.base EF.field EF.below
          (fixedFieldInclusion A EF.base EF.field EF.below x)) :
            v.valueGroup) : ZHat) at htower
  rw [relativeNorm_fixedFieldInclusion A EF x] at htower
  have hfixedFieldInclusion :
      fixedFieldInclusion A EF.base EF.field EF.below x =
        fixedFieldInclusion A E.base.field E.field.field E.below x := by
    apply Subtype.ext
    rfl
  rw [hfixedFieldInclusion] at htower
  have htower' :
      ((v.valuationAt E.field
        (fixedFieldInclusion A E.base.field E.field.field E.below x) :
          v.valueGroup) : ZHat) =
        ((v.valuationAt E.base ((E.degree : ℕ) • x) :
          v.valueGroup) : ZHat) := by
    simpa [EF, LevelExtension.degree] using htower
  calc
    ((v.valuationAt E.field
      (fixedFieldInclusion A E.base.field E.field.field E.below x) :
        v.valueGroup) : ZHat) =
        ((v.valuationAt E.base ((E.degree : ℕ) • x) :
          v.valueGroup) : ZHat) := htower'
    _ = (E.degree : ℕ) •
        ((v.valuationAt E.base x : v.valueGroup) : ZHat) :=
      congrArg Subtype.val
        (map_nsmul (v.valuationAt E.base) (E.degree : ℕ) x)

theorem reciprocity_totallyRamified_valuation_forces_exponent_zero
    {D : DegreeData G} {A : Rep ℤ G} (v : ValuationData D A)
    (E : LevelExtension G)
    (hTot : E.IsTotallyRamified D)
    (k : ℕ) (hk : k < (E.degree : ℕ))
    (x : fixedCoefficients A E.base.field)
    (hx :
      ((v.valuationAt E.field
        (fixedFieldInclusion A E.base.field E.field.field E.below x) :
        v.valueGroup) : ZHat) =
        Int.castRingHom ZHat (k : ℤ)) :
    k = 0 := by
  have hn : 0 < (E.degree : ℕ) := E.degree.property
  apply reciprocity_zHat_nsmul_eq_natCast_forces_zero
    (E.degree : ℕ) k hn hk
    (((v.valuationAt E.base x : v.valueGroup) : ZHat))
  rw [← reciprocity_valuationAt_fixedFieldInclusion_of_totallyRamified
    v E hTot]
  exact hx
end
end
end ClassFormation
end

/- IntermediateExtension -/
section
namespace ClassFormation
open KummerTheory
open CyclicCohomology
noncomputable section
variable {G : Type*} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
namespace GaloisExtension
variable {K : ClosedSubgroup G}
 
def intermediateSubgroup (L : GaloisExtension K)
    (S : Subgroup L.extensionQuotient) : Subgroup K.toSubgroup := by
  exact S.comap L.extensionQuotientMk
omit [IsTopologicalGroup G] in

@[simp]
theorem mem_intermediateSubgroup_iff
    (L : GaloisExtension K) (S : Subgroup L.extensionQuotient)
    (k : K.toSubgroup) :
    k ∈ L.intermediateSubgroup S ↔ L.extensionQuotientMk k ∈ S :=
  Iff.rfl
omit [IsTopologicalGroup G] in
 
theorem extensionSubgroup_le_intermediateSubgroup
    (L : GaloisExtension K) (S : Subgroup L.extensionQuotient) :
    extensionSubgroup K L.field L.below ≤ L.intermediateSubgroup S := by
  intro x hx
  apply (L.mem_intermediateSubgroup_iff S x).2
  have hmk : L.extensionQuotientMk x = 1 :=
    (L.extensionQuotientMk_eq_one_iff x).2 hx
  rw [hmk]
  exact S.one_mem

def intermediateCoset (L : GaloisExtension K)
    (q : L.extensionQuotient) : Set K.toSubgroup :=
  {x | L.extensionQuotientMk x = q}

private def representativeIntermediateCoset (L : GaloisExtension K)
    (q : L.extensionQuotient) : Set K.toSubgroup :=
  (fun x : K.toSubgroup =>
      x * Quotient.out (L.extensionQuotientMulEquiv q)) ''
    (extensionSubgroup K L.field L.below : Set K.toSubgroup)
omit [IsTopologicalGroup G] in
 
theorem mem_intermediateCoset_iff (L : GaloisExtension K)
    (q : L.extensionQuotient) (x : K.toSubgroup) :
    x ∈ L.intermediateCoset q ↔
      L.extensionQuotientMk x = q :=
  Iff.rfl
omit [IsTopologicalGroup G] in
private theorem mem_representativeIntermediateCoset_iff
    (L : GaloisExtension K)
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
    (L : GaloisExtension K) (q : L.extensionQuotient) :
    L.intermediateCoset q = representativeIntermediateCoset L q := by
  ext x
  exact (mem_representativeIntermediateCoset_iff L q x).symm
omit [IsTopologicalGroup G] in

theorem intermediateSubgroup_eq_iUnion_cosets
    (L : GaloisExtension K) (S : Subgroup L.extensionQuotient) :
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
    (L : GaloisExtension K) (q : L.extensionQuotient) :
    IsClosed (representativeIntermediateCoset L q) := by
  exact isClosedMap_mul_right
    (Quotient.out (L.extensionQuotientMulEquiv q)) _
    (extensionSubgroup_isClosed K L.field L.below)

theorem intermediateCoset_isClosed (L : GaloisExtension K)
    (q : L.extensionQuotient) : IsClosed (L.intermediateCoset q) := by
  rw [intermediateCoset_eq_representativeIntermediateCoset]
  exact representativeIntermediateCoset_isClosed L q

theorem intermediateSubgroup_isClosed (L : GaloisExtension K)
    (S : Subgroup L.extensionQuotient) :
    IsClosed (L.intermediateSubgroup S : Set K.toSubgroup) := by
  let : Finite L.extensionQuotient := L.finite
  rw [intermediateSubgroup_eq_iUnion_cosets]
  have hfinite : (S : Set L.extensionQuotient).Finite := Set.toFinite _
  exact hfinite.isClosed_biUnion fun q _ => intermediateCoset_isClosed L q
 
def intermediateField (L : GaloisExtension K)
    (S : Subgroup L.extensionQuotient) : ClosedSubgroup G where
  toSubgroup := (L.intermediateSubgroup S).map K.toSubgroup.subtype
  isClosed' := by
    change IsClosed
      ((fun x : K.toSubgroup => (x : G)) ''
        (L.intermediateSubgroup S : Set K.toSubgroup))
    exact K.isClosed'.isClosedMap_subtype_val _
      (intermediateSubgroup_isClosed L S)
 
theorem intermediateField_le_base (L : GaloisExtension K)
    (S : Subgroup L.extensionQuotient) :
    (L.intermediateField S).toSubgroup ≤ K.toSubgroup := by
  rintro _ ⟨m, hm, rfl⟩
  exact m.property

theorem extensionSubgroup_intermediateField_eq
    (L : GaloisExtension K) (S : Subgroup L.extensionQuotient) :
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
 
theorem field_le_intermediateField (L : GaloisExtension K)
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
    (L : GaloisExtension K) (S : Subgroup L.extensionQuotient) :
    extensionSubgroup (L.intermediateField S) L.field
        (L.field_le_intermediateField S) =
      (extensionSubgroup K L.field L.below).comap
        (Subgroup.inclusion (L.intermediateField_le_base S)) := by
  ext x
  rw [mem_extensionSubgroup_iff, Subgroup.mem_comap,
    mem_extensionSubgroup_iff]
  rfl

theorem extensionSubgroup_over_intermediate_normal
    (L : GaloisExtension K) (S : Subgroup L.extensionQuotient) :
    (extensionSubgroup (L.intermediateField S) L.field
      (L.field_le_intermediateField S)).Normal := by
  rw [extensionSubgroup_over_intermediate_eq_comap]
  infer_instance
 
instance extensionSubgroup_over_intermediate_normalInstance
    (L : GaloisExtension K) (S : Subgroup L.extensionQuotient) :
    (extensionSubgroup (L.intermediateField S) L.field
      (L.field_le_intermediateField S)).Normal :=
  L.extensionSubgroup_over_intermediate_normal S
 
theorem extension_over_intermediate_finite
    (L : GaloisExtension K) (S : Subgroup L.extensionQuotient) :
    Finite ((L.intermediateField S).toSubgroup ⧸
      extensionSubgroup (L.intermediateField S) L.field
        (L.field_le_intermediateField S)) := by
  let : Finite (K.toSubgroup ⧸
      extensionSubgroup K L.field L.below) := L.finite
  exact GaloisExtension.finite_extension_over_intermediate
    L.below (L.intermediateField_le_base S)
      (L.field_le_intermediateField S)

theorem intermediateField_finite
    (L : GaloisExtension K) (S : Subgroup L.extensionQuotient) :
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
    (L : GaloisExtension K) (S : Subgroup L.extensionQuotient)
    (hS : S.Normal) : (L.intermediateSubgroup S).Normal := by
  let : S.Normal := hS
  exact hS.comap L.extensionQuotientMk
 
theorem intermediateField_normal
    (L : GaloisExtension K) (S : Subgroup L.extensionQuotient)
    (hS : S.Normal) :
    (extensionSubgroup K (L.intermediateField S)
      (L.intermediateField_le_base S)).Normal := by
  rw [extensionSubgroup_intermediateField_eq]
  exact L.intermediateSubgroup_normal S hS
 
def lowerFiniteGalois (L : GaloisExtension K)
    (S : Subgroup L.extensionQuotient) :
    GaloisExtension (L.intermediateField S) where
  field := L.field
  below := L.field_le_intermediateField S
  normal := L.extensionSubgroup_over_intermediate_normal S
  finite := L.extension_over_intermediate_finite S
 
def intermediateFiniteGalois (L : GaloisExtension K)
    (S : Subgroup L.extensionQuotient) (hS : S.Normal) :
    GaloisExtension K where
  field := L.intermediateField S
  below := L.intermediateField_le_base S
  normal := L.intermediateField_normal S hS
  finite := L.intermediateField_finite S

def lowerRestrictionHom (L : GaloisExtension K)
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
theorem lowerRestrictionHom_apply_coe (L : GaloisExtension K)
    (S : Subgroup L.extensionQuotient)
    (m : (L.intermediateField S).toSubgroup) :
    ((L.lowerRestrictionHom S m : S) : L.extensionQuotient) =
      L.extensionQuotientMk
        (Subgroup.inclusion (L.intermediateField_le_base S) m) :=
  rfl

theorem lowerRestrictionHom_surjective (L : GaloisExtension K)
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
 
theorem lowerRestrictionHom_ker (L : GaloisExtension K)
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

noncomputable def lowerQuotientEquiv (L : GaloisExtension K)
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
 
@[simp]
theorem lowerQuotientEquiv_mk (L : GaloisExtension K)
    (S : Subgroup L.extensionQuotient)
    (m : (L.intermediateField S).toSubgroup) :
    L.lowerQuotientEquiv S
        ((L.lowerFiniteGalois S).extensionQuotientMk m) =
      L.lowerRestrictionHom S m := by
  let : (extensionSubgroup (L.intermediateField S) L.field
      (L.field_le_intermediateField S)).Normal :=
    L.extensionSubgroup_over_intermediate_normal S
  change
    ((QuotientGroup.quotientMulEquivOfEq
        (L.lowerRestrictionHom_ker S).symm).trans
      (QuotientGroup.quotientKerEquivOfSurjective
        (L.lowerRestrictionHom S) (L.lowerRestrictionHom_surjective S)))
      (QuotientGroup.mk m) = L.lowerRestrictionHom S m
  rfl

@[simp]
theorem lowerQuotientEquiv_mk_coe (L : GaloisExtension K)
    (S : Subgroup L.extensionQuotient)
    (m : (L.intermediateField S).toSubgroup) :
    ((L.lowerQuotientEquiv S
        ((L.lowerFiniteGalois S).extensionQuotientMk m) : S) :
          L.extensionQuotient) =
      L.extensionQuotientMk
        ⟨m.1, L.intermediateField_le_base S m.property⟩ := by
  rw [lowerQuotientEquiv_mk, lowerRestrictionHom_apply_coe]
  apply congrArg L.extensionQuotientMk
  exact Subtype.ext (by rfl)
omit [IsTopologicalGroup G] in

theorem intermediateSubgroup_map_quotient_eq
    (L : GaloisExtension K) (S : Subgroup L.extensionQuotient) :
    (L.intermediateSubgroup S).map L.extensionQuotientMk = S := by
  exact Subgroup.map_comap_eq_self_of_surjective
    L.extensionQuotientMk_surjective S
 
instance intermediateField_normalInstance
    (L : GaloisExtension K) (S : Subgroup L.extensionQuotient)
    [hS : S.Normal] :
    (extensionSubgroup K (L.intermediateField S)
      (L.intermediateField_le_base S)).Normal :=
  L.intermediateField_normal S hS

def upperQuotient (L : GaloisExtension K)
    (S : Subgroup L.extensionQuotient) : Type _ :=
  L.extensionQuotient ⧸ S
 
instance upperQuotient_groupInstance (L : GaloisExtension K)
    (S : Subgroup L.extensionQuotient) [S.Normal] :
    Group (L.upperQuotient S) := by
  change Group (L.extensionQuotient ⧸ S)
  infer_instance
 
def upperQuotientMulEquiv (L : GaloisExtension K)
    (S : Subgroup L.extensionQuotient) [S.Normal] :
    L.upperQuotient S ≃* (L.extensionQuotient ⧸ S) :=
  MulEquiv.refl _

noncomputable def upperQuotientEquiv (L : GaloisExtension K)
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
end GaloisExtension
end
end ClassFormation
end

/- Reduction -/
section
namespace ClassFormation
open KummerTheory
open CyclicCohomology
noncomputable section
universe u
section Representation
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
  [IsTopologicalGroup G]
namespace GaloisExtension
variable {K : ClosedSubgroup G}
end GaloisExtension
end Representation
section GroupOnly
variable {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
namespace GaloisExtension
variable {K : ClosedSubgroup G}

def lowerInclusionHom (L : GaloisExtension K)
    (S : Subgroup L.extensionQuotient) :
    (L.intermediateField S).toSubgroup ⧸
        extensionSubgroup (L.intermediateField S) L.field
          (L.field_le_intermediateField S) →*
      L.extensionQuotient :=
  S.subtype.comp (L.lowerQuotientEquiv S).toMonoidHom
 
@[simp]
theorem lowerInclusionHom_mk (L : GaloisExtension K)
    (S : Subgroup L.extensionQuotient)
    (m : (L.intermediateField S).toSubgroup) :
    L.lowerInclusionHom S (QuotientGroup.mk m) =
      (QuotientGroup.mk'
        (extensionSubgroup K L.field L.below))
          ⟨m.1, L.intermediateField_le_base S m.property⟩ := by
  exact L.lowerQuotientEquiv_mk_coe S m
 
theorem lowerQuotient_isCyclic (L : GaloisExtension K)
    (S : Subgroup L.extensionQuotient) [IsCyclic L.extensionQuotient] :
    IsCyclic
      ((L.intermediateField S).toSubgroup ⧸
        extensionSubgroup (L.intermediateField S) L.field
          (L.field_le_intermediateField S)) :=
  (L.lowerQuotientEquiv S).isCyclic.2 inferInstance
 
theorem upperQuotient_isCyclic (L : GaloisExtension K)
    (S : Subgroup L.extensionQuotient) [S.Normal]
    [IsCyclic L.extensionQuotient] :
    IsCyclic
      (K.toSubgroup ⧸ extensionSubgroup K (L.intermediateField S)
        (L.intermediateField_le_base S)) := by
  have hsource : IsCyclic (L.extensionQuotient ⧸ S) :=
    isCyclic_of_surjective (QuotientGroup.mk' S)
      (QuotientGroup.mk'_surjective S)
  exact (L.upperQuotientEquiv S).isCyclic.1 hsource

def inertiaImage (D : DegreeData G) (L : GaloisExtension K) :
    Subgroup L.extensionQuotient :=
  (D.fieldInertiaWithin K).map
    (QuotientGroup.mk' (extensionSubgroup K L.field L.below))
omit [IsTopologicalGroup G] in

theorem inertiaImage_normal (D : DegreeData G)
    (L : GaloisExtension K) : (L.inertiaImage D).Normal := by
  exact (inferInstance : (D.fieldInertiaWithin K).Normal).map
    (QuotientGroup.mk' (extensionSubgroup K L.field L.below))
    (QuotientGroup.mk'_surjective
      (extensionSubgroup K L.field L.below))
 
instance inertiaImage_normalInstance (D : DegreeData G)
    (L : GaloisExtension K) : (L.inertiaImage D).Normal :=
  L.inertiaImage_normal D
 
def maximalUnramifiedSubextension (D : DegreeData G)
    (L : GaloisExtension K) : ClosedSubgroup G :=
  L.intermediateField (L.inertiaImage D)
 
theorem maximalUnramifiedSubextension_isUnramified
    (D : DegreeData G) (L : GaloisExtension K) :
    (DegreeData.AbstractExtension.mk (L.maximalUnramifiedSubextension D) K
      (L.intermediateField_le_base (L.inertiaImage D))).IsUnramified D := by
  change (DegreeData.AbstractExtension.mk
    (L.intermediateField (L.inertiaImage D)) K
    (L.intermediateField_le_base (L.inertiaImage D))).IsUnramified D
  rw [(DegreeData.AbstractExtension.mk
    (L.intermediateField (L.inertiaImage D)) K
    (L.intermediateField_le_base (L.inertiaImage D))).isUnramified_iff_inertia_le D]
  intro x hx
  let k : K.toSubgroup := ⟨x, hx.1⟩
  have hkI : k ∈ D.fieldInertiaWithin K := by
    exact hx.2
  have hkS :
      (QuotientGroup.mk'
        (extensionSubgroup K L.field L.below)) k ∈ L.inertiaImage D :=
    ⟨k, hkI, rfl⟩
  have hkP : k ∈ L.intermediateSubgroup (L.inertiaImage D) := by
    change (QuotientGroup.mk'
      (extensionSubgroup K L.field L.below)) k ∈ L.inertiaImage D
    exact hkS
  exact ⟨k, hkP, rfl⟩

theorem maximalUnramifiedSubextension_isTotallyRamified
    (D : DegreeData G) (L : GaloisExtension K) :
    (DegreeData.AbstractExtension.mk L.field
      (L.maximalUnramifiedSubextension D)
      (L.field_le_intermediateField (L.inertiaImage D))).IsTotallyRamified D := by
  let S := L.inertiaImage D
  let M := L.maximalUnramifiedSubextension D
  let hLM := L.field_le_intermediateField S
  let hMK := L.intermediateField_le_base S
  change (DegreeData.AbstractExtension.mk L.field
    (L.intermediateField (L.inertiaImage D)) hLM).IsTotallyRamified D
  rw [(DegreeData.AbstractExtension.mk L.field
    (L.intermediateField (L.inertiaImage D)) hLM).isTotallyRamified_iff_image_le D]
  rintro z ⟨x, hxM, rfl⟩
  let xK : K.toSubgroup := ⟨x, hMK hxM⟩
  have hxP : xK ∈ L.intermediateSubgroup S := by
    rw [← L.extensionSubgroup_intermediateField_eq S]
    exact (mem_extensionSubgroup_iff K M hMK xK).2 hxM
  change (QuotientGroup.mk'
    (extensionSubgroup K L.field L.below)) xK ∈
      (D.fieldInertiaWithin K).map
        (QuotientGroup.mk'
          (extensionSubgroup K L.field L.below)) at hxP
  obtain ⟨i, hiI, hi⟩ := hxP
  have hiH : i⁻¹ * xK ∈ extensionSubgroup K L.field L.below :=
    QuotientGroup.eq.mp hi
  have hiL : i.1⁻¹ * x ∈ L.field.toSubgroup := by
    exact (mem_extensionSubgroup_iff K L.field L.below (i⁻¹ * xK)).1 hiH
  refine ⟨i.1⁻¹ * x, hiL, ?_⟩
  have hdegree : D.degree i.1 = 1 :=
    (D.mem_fieldInertiaWithin_iff K i).1 hiI
  simp [hdegree]
end GaloisExtension
end GroupOnly
section Representation
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
  [IsTopologicalGroup G]
namespace GaloisExtension
variable {K : ClosedSubgroup G}

theorem maximalUnramified_normMap_injective
    (A : Rep ℤ G) (hcf : SatisfiesClassFieldAxiom A)
    (D : DegreeData G) (L : GaloisExtension K)
    [Finite ((baseField G).toSubgroup ⧸
      extensionSubgroup (baseField G) K (le_baseField K))]
    [IsCyclic L.extensionQuotient] :
    let S := L.inertiaImage D
    let M := L.intermediateField S
    let hLM := L.field_le_intermediateField S
    let hMK := L.intermediateField_le_base S
    letI : Finite
        (M.toSubgroup ⧸ extensionSubgroup M L.field hLM) :=
      L.extension_over_intermediate_finite S
    letI : Finite
        (K.toSubgroup ⧸ extensionSubgroup K M hMK) :=
      L.intermediateField_finite S
    letI : Finite
        (K.toSubgroup ⧸ extensionSubgroup K L.field (hLM.trans hMK)) := by
      simpa only using L.finite
    Function.Injective
      (abstractReciprocityNormMap A K M L.field hLM hMK) := by
  dsimp only
  let S := L.inertiaImage D
  let M := L.intermediateField S
  let hLM := L.field_le_intermediateField S
  let hMK := L.intermediateField_le_base S
  let : (extensionSubgroup K L.field (hLM.trans hMK)).Normal := by
    simpa only using L.normal
  let : (extensionSubgroup K M hMK).Normal :=
    L.intermediateField_normal S inferInstance
  let : Finite
      (K.toSubgroup ⧸ extensionSubgroup K L.field (hLM.trans hMK)) := by
    simpa only using L.finite
  let : Finite
      (M.toSubgroup ⧸ extensionSubgroup M L.field hLM) :=
    L.extension_over_intermediate_finite S
  let : Finite
      (K.toSubgroup ⧸ extensionSubgroup K M hMK) :=
    L.intermediateField_finite S
  let : IsCyclic
      (M.toSubgroup ⧸ extensionSubgroup M L.field hLM) :=
    L.lowerQuotient_isCyclic S
  let : IsCyclic
      (K.toSubgroup ⧸ extensionSubgroup K M hMK) :=
    L.upperQuotient_isCyclic S
  obtain ⟨gKL, hgKL⟩ := IsCyclic.exists_generator
    (α := L.extensionQuotient)
  obtain ⟨gML, hgML⟩ := IsCyclic.exists_generator
    (α := M.toSubgroup ⧸ extensionSubgroup M L.field hLM)
  obtain ⟨gKM, hgKM⟩ := IsCyclic.exists_generator
    (α := K.toSubgroup ⧸ extensionSubgroup K M hMK)
  exact reciprocity_cyclicTower_normMap_injective
    A hcf K M L.field hLM hMK gKL hgKL gML hgML gKM hgKM
end GaloisExtension

theorem reciprocity_surjective_of_exact_diagram
    {Q₀ Q Q₁ B₀ B B₁ : Type*}
    [AddGroup Q₀] [AddGroup Q] [AddGroup Q₁]
    [AddGroup B₀] [AddGroup B] [AddGroup B₁]
    (iQ : Q₀ →+ Q) (pQ : Q →+ Q₁)
    (iB : B₀ →+ B) (pB : B →+ B₁)
    (r₀ : Q₀ →+ B₀) (r : Q →+ B) (r₁ : Q₁ →+ B₁)
    (hexact : Function.Exact iB pB)
    (hpQ : Function.Surjective pQ)
    (hleft : ∀ q, r (iQ q) = iB (r₀ q))
    (hright : ∀ q, pB (r q) = r₁ (pQ q))
    (hr₀ : Function.Surjective r₀)
    (hr₁ : Function.Surjective r₁) :
    Function.Surjective r := by
  intro b
  obtain ⟨q₁, hq₁⟩ := hr₁ (pB b)
  obtain ⟨q, hq⟩ := hpQ q₁
  have hzero : pB (b - r q) = 0 := by
    calc
      pB (b - r q) = pB b - pB (r q) := map_sub pB b (r q)
      _ = pB b - r₁ (pQ q) := by rw [hright q]
      _ = pB b - r₁ q₁ := by rw [hq]
      _ = pB b - pB b := by rw [hq₁]
      _ = 0 := sub_self _
  obtain ⟨b₀, hb₀⟩ := (hexact (b - r q)).mp hzero
  obtain ⟨q₀, hq₀⟩ := hr₀ b₀
  refine ⟨iQ q₀ + q, ?_⟩
  calc
    r (iQ q₀ + q) = r (iQ q₀) + r q := map_add r _ _
    _ = iB (r₀ q₀) + r q := by rw [hleft q₀]
    _ = iB b₀ + r q := by rw [hq₀]
    _ = (b - r q) + r q := by rw [hb₀]
    _ = b := sub_add_cancel b (r q)

theorem reciprocity_bijective_of_exact_diagram
    {Q₀ Q Q₁ B₀ B B₁ : Type*}
    [AddGroup Q₀] [AddGroup Q] [AddGroup Q₁]
    [AddGroup B₀] [AddGroup B] [AddGroup B₁]
    (iQ : Q₀ →+ Q) (pQ : Q →+ Q₁)
    (iB : B₀ →+ B) (pB : B →+ B₁)
    (r₀ : Q₀ →+ B₀) (r : Q →+ B) (r₁ : Q₁ →+ B₁)
    (hexactQ : Function.Exact iQ pQ)
    (hexactB : Function.Exact iB pB)
    (hpQ : Function.Surjective pQ)
    (hiB : Function.Injective iB)
    (hleft : ∀ q, r (iQ q) = iB (r₀ q))
    (hright : ∀ q, pB (r q) = r₁ (pQ q))
    (hr₀ : Function.Bijective r₀)
    (hr₁ : Function.Bijective r₁) :
    Function.Bijective r := by
  refine ⟨?_, reciprocity_surjective_of_exact_diagram
    iQ pQ iB pB r₀ r r₁ hexactB hpQ hleft hright hr₀.2 hr₁.2⟩
  rw [injective_iff_map_eq_zero]
  intro q hq
  have hpzero : pB (r q) = 0 := by rw [hq, map_zero]
  have hr₁zero : r₁ (pQ q) = 0 := by
    rw [← hright q]
    exact hpzero
  have hpQzero : pQ q = 0 := by
    apply hr₁.1
    simpa using hr₁zero
  obtain ⟨q₀, hq₀⟩ := (hexactQ q).mp hpQzero
  have hiBzero : iB (r₀ q₀) = 0 := by
    calc
      iB (r₀ q₀) = r (iQ q₀) := (hleft q₀).symm
      _ = r q := by rw [hq₀]
      _ = 0 := hq
  have hr₀zero : r₀ q₀ = 0 := by
    apply hiB
    simpa using hiBzero
  have hq₀zero : q₀ = 0 := by
    apply hr₀.1
    simpa using hr₀zero
  rw [← hq₀, hq₀zero, map_zero]
end Representation
end
end ClassFormation
end

/- TotallyRamified -/
section
namespace ClassFormation
open KummerTheory
open CyclicCohomology
noncomputable section
open CategoryTheory
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
namespace ValuationData
variable {D : DegreeData G} {A : Rep ℤ G}

theorem primeNormClass_eq_zero_exists_unit_norm_eq
    (v : ValuationData D A)
    (K L S : FiniteLevel G)
    (hLK : L.field.toSubgroup ≤ K.field.toSubgroup)
    (hSK : S.field.toSubgroup ≤ K.field.toSubgroup)
    (hTot : (DegreeData.AbstractExtension.mk
      L.field K.field hLK).IsTotallyRamified D)
    [hLKfinite : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field L.field hLK)]
    [hSKfinite : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field S.field hSK)]
    (hSigmaResidue :
      ((DegreeData.FiniteAbstractExtension.ofInclusion
        S.field K.field hSK).residueDegree D : ℕ) = 1)
    (k : ℕ)
    (piS : fixedCoefficients A S.field)
    (piL : fixedCoefficients A L.field)
    (hpiS : v.IsPrimeElement S piS)
    (hpiL : v.IsPrimeElement L piL)
    (hclass :
      finiteNormClass A K.field L.field hLK
          (relativeNorm A K.field S.field hSK (k • piS)) = 0) :
    ∃ w : v.unitAddSubgroup L,
      relativeNorm A K.field L.field hLK (k • piL + w.1) =
        relativeNorm A K.field S.field hSK (k • piS) := by
  obtain ⟨b, hb⟩ :=
    (finiteNormClass_eq_zero_iff
      A K.field L.field hLK _).1 hclass
  let EL : LevelExtension G :=
    { field := L
      base := K
      below := hLK
      finiteQuotient := hLKfinite }
  let ES : LevelExtension G :=
    LevelExtension.ofInclusion S.field K hSK
  have hvalB : v.valuationAt L b = k • v.oneValue := by
    apply Subtype.ext
    have hL := v.normalizedValuation_tower EL b
    have hS := v.normalizedValuation_tower ES (k • piS)
    have hTotEL : EL.IsTotallyRamified D := by
      simpa [EL, LevelExtension.IsTotallyRamified,
        LevelExtension.toFiniteAbstractExtension] using hTot
    have hresidue : (EL.residueDegree D : ℕ) = 1 :=
      EL.toFiniteAbstractExtension.residueDegree_eq_one_of_isTotallyRamified
        D hTotEL
    change (EL.residueDegree D : ℕ) •
        ((v.valuationAt L b : v.valueGroup) : ZHat) =
      ((v.valuationAt K (relativeNorm A K.field L.field hLK b) :
        v.valueGroup) : ZHat) at hL
    rw [hresidue, one_nsmul] at hL
    have hSigmaResidue' : (ES.residueDegree D : ℕ) = 1 := by
      let ES₀ :=
        DegreeData.FiniteAbstractExtension.ofInclusion S.field K.field hSK
      have hSigmaCard :
          ES₀.toAbstractExtension.relativeResidueDegreeCardinal D = 1 := by
        calc
          ES₀.toAbstractExtension.relativeResidueDegreeCardinal D =
              ((ES₀.residueDegree D : ℕ) : Cardinal) :=
            ES₀.relativeResidueDegreeCardinal_eq_coe D
          _ = 1 := by rw [hSigmaResidue]; simp
      apply Nat.cast_injective (R := Cardinal)
      unfold LevelExtension.residueDegree
      rw [← ES.toFiniteAbstractExtension.relativeResidueDegreeCardinal_eq_coe D]
      simpa [ES, ES₀, LevelExtension.toFiniteAbstractExtension,
        LevelExtension.ofInclusion,
        DegreeData.FiniteAbstractExtension.toAbstractExtension,
        DegreeData.FiniteAbstractExtension.ofInclusion] using hSigmaCard
    change (ES.residueDegree D : ℕ) •
        ((v.valuationAt S (k • piS) : v.valueGroup) : ZHat) =
      ((v.valuationAt K
        (relativeNorm A K.field S.field hSK (k • piS)) :
          v.valueGroup) : ZHat) at hS
    rw [hSigmaResidue', one_nsmul] at hS
    calc
      ((v.valuationAt L b : v.valueGroup) : ZHat) =
          ((v.valuationAt K (relativeNorm A K.field L.field hLK b) :
            v.valueGroup) : ZHat) := hL
      _ = ((v.valuationAt K
          (relativeNorm A K.field S.field hSK (k • piS)) :
            v.valueGroup) : ZHat) := by rw [hb]
      _ = ((v.valuationAt S (k • piS) : v.valueGroup) : ZHat) := hS.symm
      _ = ((k • v.oneValue : v.valueGroup) : ZHat) := by
        congr 1
        rw [map_nsmul, hpiS]
  let wL : fixedCoefficients A L.field := b - k • piL
  have hw : v.valuationAt L wL = 0 := by
    change v.valuationAt L (b - k • piL) = 0
    rw [map_sub, map_nsmul, hvalB, hpiL, sub_self]
  let w : v.unitAddSubgroup L :=
    ⟨wL, (v.mem_unitAddSubgroup_iff L wL).2 hw⟩
  refine ⟨w, ?_⟩
  calc
    relativeNorm A K.field L.field hLK (k • piL + w.1) =
        relativeNorm A K.field L.field hLK b := by
      congr 1
      apply Subtype.ext
      dsimp [w, wL]
      abel
    _ = relativeNorm A K.field S.field hSK (k • piS) := hb

theorem valuationAt_extensionFixedRepresentation_action
    (v : ValuationData D A)
    (E : LevelExtension G)
    (hnormal : (extensionSubgroup
      E.base.field E.field.field E.below).Normal)
    (q : E.base.field.toSubgroup ⧸
      extensionSubgroup E.base.field E.field.field E.below)
    (a : (extensionFixedRepresentation A E.base.field E.field.field
      E.below hnormal).V) :
    v.valuationAt E.field
        (extensionFixedRepresentationEquiv A E.base.field E.field.field
          E.below hnormal
          ((extensionFixedRepresentation A E.base.field E.field.field
            E.below hnormal).ρ q a)) =
      v.valuationAt E.field
        (extensionFixedRepresentationEquiv A E.base.field E.field.field
          E.below hnormal a) := by
  let := hnormal
  refine Quotient.inductionOn' q ?_
  intro r
  let aL : fixedCoefficients A E.field.field :=
    extensionFixedRepresentationEquiv A E.base.field E.field.field
      E.below hnormal a
  have heq :
      extensionFixedRepresentationEquiv A E.base.field E.field.field
          E.below hnormal
          ((extensionFixedRepresentation A E.base.field E.field.field
            E.below hnormal).ρ
            (QuotientGroup.mk r) a) =
        normalExtensionAction A E.base.field E.field.field E.below
          hnormal r aL := by
    apply Subtype.ext
    rfl
  rw [heq]
  exact v.valuationAt_normalExtensionAction E hnormal r aL

theorem reciprocity_exists_hMinusOne_primitive
    (hcf : SatisfiesClassFieldAxiom A)
    (E : LevelExtension G)
    (hnormal : (extensionSubgroup
      E.base.field E.field.field E.below).Normal)
    (g : E.base.field.toSubgroup ⧸
      extensionSubgroup E.base.field E.field.field E.below)
    (hg : ∀ q, q ∈ Subgroup.zpowers g)
    (u w : fixedCoefficients A E.field.field)
    (hnorm : relativeNorm A E.base.field E.field.field E.below w =
      relativeNorm A E.base.field E.field.field E.below u) :
    let M := extensionFixedRepresentation A E.base.field E.field.field
      E.below hnormal
    ∃ a : M.V,
      M.ρ g a - a =
        (extensionFixedRepresentationEquiv A E.base.field E.field.field
          E.below hnormal).symm
          (w - u) := by
  let := hnormal
  let := E.finiteQuotient
  let := Fintype.ofFinite
    (E.base.field.toSubgroup ⧸
      extensionSubgroup E.base.field E.field.field E.below)
  let M := extensionFixedRepresentation A E.base.field E.field.field
    E.below hnormal
  let z : M.V :=
    (extensionFixedRepresentationEquiv A E.base.field E.field.field
      E.below hnormal).symm (w - u)
  have hzNorm : M.norm.hom z = 0 := by
    apply Subtype.ext
    calc
      (M.norm.hom z).1 =
          ((relativeNorm A E.base.field E.field.field E.below (w - u) :
            fixedCoefficients A E.base.field) : A.V) :=
        extensionFixedRepresentation_norm_coe A E.base.field E.field.field
          E.below hnormal z
      _ = ((relativeNorm A E.base.field E.field.field E.below w -
          relativeNorm A E.base.field E.field.field E.below u :
            fixedCoefficients A E.base.field) : A.V) := by
        rw [map_sub]
      _ = 0 := by rw [hnorm, sub_self]; rfl
  let Ecf : CyclicExtension E.base :=
    { field := E.field.field
      below := E.below
      normal := hnormal
      finite := E.finiteQuotient
      generator := g
      generates := hg }
  have hzero : Limits.IsZero (tateCohomology M (-1)) := by
    simpa [Ecf,
      CyclicExtension.fixedRepresentation] using
        hcf.tateHMinusOne_isZero E.base Ecf
  obtain ⟨a, ha⟩ :=
    CyclicCohomology.normKernel_le_sigmaMinusOneRange_of_tateHMinusOne_isZero
      M g hg hzero z hzNorm
  exact ⟨a, ha⟩
end ValuationData
end
end ClassFormation
end

/- RestrictionCosets -/
section
noncomputable section
namespace ClassFormation
open KummerTheory
open CyclicCohomology
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
namespace GaloisExtension
 
def bundledRestrictionHom
    {K : ClosedSubgroup G}
    (M L : GaloisExtension K)
    (hML : M.field.toSubgroup ≤ L.field.toSubgroup) :
    M.extensionQuotient →* L.extensionQuotient :=
  L.extensionQuotientMulEquiv.symm.toMonoidHom.comp
    ((abstractReciprocityRestriction
      K L.field M.field hML L.below).comp
        M.extensionQuotientMulEquiv.toMonoidHom)

noncomputable def abstractReciprocityRestrictionCosetMap
    (D : DegreeData G) [IsTopologicalGroup G]
    (E : DegreeData.AbstractExtension G)
    (M : GaloisExtension E.base)
    (hME : M.field.toSubgroup ≤ E.field.toSubgroup) :
    let M₀ := M.maximalUnramifiedSubextension D
    let hMM₀ : M.field.toSubgroup ≤ M₀.toSubgroup :=
      M.field_le_intermediateField (M.inertiaImage D)
    (M₀.toSubgroup ⧸ extensionSubgroup M₀ M.field hMM₀) →
      (E.base.toSubgroup ⧸ E.subgroup) := by
  let S := M.inertiaImage D
  let M₀ := M.maximalUnramifiedSubextension D
  let hMM₀ : M.field.toSubgroup ≤ M₀.toSubgroup :=
    M.field_le_intermediateField S
  let hM₀K : M₀.toSubgroup ≤ E.base.toSubgroup :=
    M.intermediateField_le_base S
  exact Quotient.map'
    (fun x : M₀.toSubgroup =>
      (⟨x.1, hM₀K x.2⟩ : E.base.toSubgroup))
    (by
      intro x y hxy
      rw [QuotientGroup.leftRel_apply] at hxy ⊢
      exact hME hxy)

theorem abstractReciprocityRestrictionCosetMap_bijective
    (D : DegreeData G) [IsTopologicalGroup G]
    (E : DegreeData.AbstractExtension G)
    (M : GaloisExtension E.base)
    (hME : M.field.toSubgroup ≤ E.field.toSubgroup)
    (hTot : E.IsTotallyRamified D)
    (hInertia : ∀ i : E.base.toSubgroup,
      i ∈ D.fieldInertiaWithin E.base →
      i.1 ∈ E.field.toSubgroup → i.1 ∈ M.field.toSubgroup) :
    Function.Bijective (M.abstractReciprocityRestrictionCosetMap D E hME) := by
  let S := M.inertiaImage D
  let M₀ := M.maximalUnramifiedSubextension D
  let hMM₀ : M.field.toSubgroup ≤ M₀.toSubgroup :=
    M.field_le_intermediateField S
  let hM₀K : M₀.toSubgroup ≤ E.base.toSubgroup :=
    M.intermediateField_le_base S
  constructor
  · intro x y hxy
    refine Quotient.inductionOn₂' x y ?_ hxy
    intro a b hab
    apply Quotient.sound'
    rw [QuotientGroup.leftRel_apply]
    let aK : E.base.toSubgroup := ⟨a.1, hM₀K a.2⟩
    let bK : E.base.toSubgroup := ⟨b.1, hM₀K b.2⟩
    let z : E.base.toSubgroup := aK⁻¹ * bK
    have habE : aK⁻¹ * bK ∈ E.subgroup := by
      exact QuotientGroup.leftRel_apply.mp (Quotient.exact' hab)
    have hzE : z.1 ∈ E.field.toSubgroup :=
      (mem_extensionSubgroup_iff E.base E.field E.below z).1 habE
    have haP : aK ∈ M.intermediateSubgroup S := by
      rw [← M.extensionSubgroup_intermediateField_eq S]
      exact (mem_extensionSubgroup_iff E.base M₀ hM₀K aK).2 a.2
    have hbP : bK ∈ M.intermediateSubgroup S := by
      rw [← M.extensionSubgroup_intermediateField_eq S]
      exact (mem_extensionSubgroup_iff E.base M₀ hM₀K bK).2 b.2
    have hzP : z ∈ M.intermediateSubgroup S :=
      (M.intermediateSubgroup S).mul_mem
        ((M.intermediateSubgroup S).inv_mem haP) hbP
    change (QuotientGroup.mk'
      (extensionSubgroup E.base M.field M.below)) z ∈
        (D.fieldInertiaWithin E.base).map
          (QuotientGroup.mk'
            (extensionSubgroup E.base M.field M.below)) at hzP
    obtain ⟨i, hiI, hi⟩ := hzP
    have hizM : i⁻¹ * z ∈ extensionSubgroup E.base M.field M.below :=
      QuotientGroup.eq.mp hi
    have hizM' : i.1⁻¹ * z.1 ∈ M.field.toSubgroup :=
      (mem_extensionSubgroup_iff E.base M.field M.below (i⁻¹ * z)).1 hizM
    have hiE : i.1 ∈ E.field.toSubgroup := by
      have hmul := E.field.toSubgroup.mul_mem hzE
        (E.field.toSubgroup.inv_mem (hME hizM'))
      simpa [mul_inv_rev, mul_assoc] using hmul
    have hiM : i.1 ∈ M.field.toSubgroup := hInertia i hiI hiE
    have hzM : z.1 ∈ M.field.toSubgroup := by
      have hmul := M.field.toSubgroup.mul_mem hiM hizM'
      simpa [mul_assoc] using hmul
    exact hzM
  · intro x
    refine Quotient.inductionOn' x ?_
    intro k
    have hkDegree : D.degree k.1 ∈
        E.base.toSubgroup.map D.degree.toMonoidHom := ⟨k.1, k.2, rfl⟩
    obtain ⟨e, heE, heDegree⟩ :=
      (E.isTotallyRamified_iff_image_le D).1 hTot hkDegree
    let eE : E.field.toSubgroup := ⟨e, heE⟩
    let eK : E.base.toSubgroup := Subgroup.inclusion E.below eE
    let i : E.base.toSubgroup := k * eK⁻¹
    have hiI : i ∈ D.fieldInertiaWithin E.base := by
      change D.degree i.1 = 1
      dsimp [i, eK, eE]
      rw [map_mul, map_inv]
      change D.degree k.1 * (D.degree e)⁻¹ = 1
      change D.degree e = D.degree k.1 at heDegree
      rw [heDegree]
      simp
    have hiS : (QuotientGroup.mk'
        (extensionSubgroup E.base M.field M.below)) i ∈ S :=
      ⟨i, hiI, rfl⟩
    have hiP : i ∈ M.intermediateSubgroup S := hiS
    let iM₀ : M₀.toSubgroup := ⟨i.1, ⟨i, hiP, rfl⟩⟩
    refine ⟨QuotientGroup.mk iM₀, ?_⟩
    apply Quotient.sound'
    rw [QuotientGroup.leftRel_apply]
    change (i⁻¹ * k).1 ∈ E.field.toSubgroup
    simpa [i, eK, eE, mul_inv_rev, mul_assoc] using eE.2
 
noncomputable def abstractReciprocityRestrictionCosetEquiv
    (D : DegreeData G) [IsTopologicalGroup G]
    (E : DegreeData.AbstractExtension G)
    (M : GaloisExtension E.base)
    (hME : M.field.toSubgroup ≤ E.field.toSubgroup)
    (hTot : E.IsTotallyRamified D)
    (hInertia : ∀ i : E.base.toSubgroup,
      i ∈ D.fieldInertiaWithin E.base →
      i.1 ∈ E.field.toSubgroup → i.1 ∈ M.field.toSubgroup) :
    let M₀ := M.maximalUnramifiedSubextension D
    let hMM₀ : M.field.toSubgroup ≤ M₀.toSubgroup :=
      M.field_le_intermediateField (M.inertiaImage D)
    (M₀.toSubgroup ⧸ extensionSubgroup M₀ M.field hMM₀) ≃
      E.quotient :=
  Equiv.ofBijective (M.abstractReciprocityRestrictionCosetMap D E hME)
    (M.abstractReciprocityRestrictionCosetMap_bijective
      D E hME hTot hInertia)

noncomputable def abstractReciprocityRestrictionMulEquiv
    (D : DegreeData G) [IsTopologicalGroup G]
    (E : DegreeData.AbstractExtension G)
    (M : GaloisExtension E.base)
    (hME : M.field.toSubgroup ≤ E.field.toSubgroup)
    [hEnormal :
      (extensionSubgroup E.base E.field E.below).Normal]
    (hTot : E.IsTotallyRamified D)
    (hInertia : ∀ i : E.base.toSubgroup,
      i ∈ D.fieldInertiaWithin E.base →
      i.1 ∈ E.field.toSubgroup → i.1 ∈ M.field.toSubgroup) :
    let S := M.inertiaImage D
    let N := M.lowerFiniteGalois S
    letI : (extensionSubgroup
        (M.maximalUnramifiedSubextension D) M.field N.below).Normal :=
      N.normal
    letI : Group E.quotient := by
      change Group
        (E.base.toSubgroup ⧸ extensionSubgroup E.base E.field E.below)
      infer_instance
    N.extensionQuotient ≃*
      E.quotient := by
  let S := M.inertiaImage D
  let M₀ := M.maximalUnramifiedSubextension D
  let N := M.lowerFiniteGalois S
  let hM₀K : M₀.toSubgroup ≤ E.base.toSubgroup :=
    M.intermediateField_le_base S
  letI : (extensionSubgroup M₀ M.field N.below).Normal := N.normal
  letI : Group E.quotient := by
    change Group
      (E.base.toSubgroup ⧸ extensionSubgroup E.base E.field E.below)
    infer_instance
  let r : N.extensionQuotient →*
      E.quotient :=
    QuotientGroup.map
      (extensionSubgroup M₀ M.field N.below)
      (extensionSubgroup E.base E.field E.below)
      (Subgroup.inclusion hM₀K)
      (by
        intro m hm
        exact hME hm)
  apply MulEquiv.ofBijective r
  have hr : (r : N.extensionQuotient →
      E.quotient) =
      M.abstractReciprocityRestrictionCosetMap D E hME := by
    funext x
    refine Quotient.inductionOn' x ?_
    intro m
    rfl
  rw [hr]
  exact M.abstractReciprocityRestrictionCosetMap_bijective
    D E hME hTot hInertia

theorem relativeCosetAction_abstractReciprocityRestrictionCosetEquiv
    (A : Rep ℤ G) (D : DegreeData G) [IsTopologicalGroup G]
    (E : DegreeData.AbstractExtension G)
    (M : GaloisExtension E.base)
    (hME : M.field.toSubgroup ≤ E.field.toSubgroup)
    (hTot : E.IsTotallyRamified D)
    (hInertia : ∀ i : E.base.toSubgroup,
      i ∈ D.fieldInertiaWithin E.base →
      i.1 ∈ E.field.toSubgroup → i.1 ∈ M.field.toSubgroup)
    (a : fixedCoefficients A E.field)
    (r : let M₀ := M.maximalUnramifiedSubextension D
      let hMM₀ : M.field.toSubgroup ≤ M₀.toSubgroup :=
        M.field_le_intermediateField (M.inertiaImage D)
      M₀.toSubgroup ⧸ extensionSubgroup M₀ M.field hMM₀) :
    let M₀ := M.maximalUnramifiedSubextension D
    let hMM₀ : M.field.toSubgroup ≤ M₀.toSubgroup :=
      M.field_le_intermediateField (M.inertiaImage D)
    relativeCosetAction A M₀ M.field hMM₀
        (fixedFieldInclusion A E.field M.field hME a) r =
      relativeCosetAction A E.base E.field E.below a
        (M.abstractReciprocityRestrictionCosetEquiv
          D E hME hTot hInertia r) := by
  let S := M.inertiaImage D
  let M₀ := M.maximalUnramifiedSubextension D
  let hMM₀ : M.field.toSubgroup ≤ M₀.toSubgroup :=
    M.field_le_intermediateField S
  let hM₀K : M₀.toSubgroup ≤ E.base.toSubgroup :=
    M.intermediateField_le_base S
  refine Quotient.inductionOn' r ?_
  intro x
  rfl

theorem reciprocity_relativeNorm_fixedFieldInclusion
    (A : Rep ℤ G) (D : DegreeData G) [IsTopologicalGroup G]
    (E : DegreeData.FiniteAbstractExtension G)
    (M : GaloisExtension E.base)
    (hME : M.field.toSubgroup ≤ E.field.toSubgroup)
    (hTot : E.IsTotallyRamified D)
    (hInertia : ∀ i : E.base.toSubgroup,
      i ∈ D.fieldInertiaWithin E.base →
      i.1 ∈ E.field.toSubgroup → i.1 ∈ M.field.toSubgroup)
    (a : fixedCoefficients A E.field) :
    let M₀ := M.maximalUnramifiedSubextension D
    let hMM₀ : M.field.toSubgroup ≤ M₀.toSubgroup :=
      M.field_le_intermediateField (M.inertiaImage D)
    let hM₀K : M₀.toSubgroup ≤ E.base.toSubgroup :=
      M.intermediateField_le_base (M.inertiaImage D)
    letI : Finite
        (M₀.toSubgroup ⧸ extensionSubgroup M₀ M.field hMM₀) :=
      M.extension_over_intermediate_finite (M.inertiaImage D)
    relativeNorm A M₀ M.field hMM₀
        (fixedFieldInclusion A E.field M.field hME a) =
      fixedFieldInclusion A E.base M₀ hM₀K
        (relativeNorm A E.base E.field E.below a) := by
  let S := M.inertiaImage D
  let M₀ := M.maximalUnramifiedSubextension D
  let hMM₀ : M.field.toSubgroup ≤ M₀.toSubgroup :=
    M.field_le_intermediateField S
  let hM₀K : M₀.toSubgroup ≤ E.base.toSubgroup :=
    M.intermediateField_le_base S
  let hMfinite : Finite
      (M₀.toSubgroup ⧸ extensionSubgroup M₀ M.field hMM₀) :=
    M.extension_over_intermediate_finite S
  let : Finite
      (E.base.toSubgroup ⧸ extensionSubgroup E.base E.field E.below) :=
    E.finiteQuotient
  let e : (M₀.toSubgroup ⧸ extensionSubgroup M₀ M.field hMM₀) ≃
      (E.base.toSubgroup ⧸ extensionSubgroup E.base E.field E.below) :=
    M.abstractReciprocityRestrictionCosetEquiv
      D E.toAbstractExtension hME hTot hInertia
  apply Subtype.ext
  let : Fintype
      (M₀.toSubgroup ⧸ extensionSubgroup M₀ M.field hMM₀) :=
    Fintype.ofFinite _
  let : Fintype
      (E.base.toSubgroup ⧸ extensionSubgroup E.base E.field E.below) :=
    Fintype.ofFinite _
  change (∑ r, relativeCosetAction A M₀ M.field hMM₀
      (fixedFieldInclusion A E.field M.field hME a) r) =
    ∑ q, relativeCosetAction A E.base E.field E.below a q
  calc
    ∑ r, relativeCosetAction A M₀ M.field hMM₀
        (fixedFieldInclusion A E.field M.field hME a) r =
      ∑ r, relativeCosetAction A E.base E.field E.below a (e r) := by
        apply Fintype.sum_congr
        intro r
        exact M.relativeCosetAction_abstractReciprocityRestrictionCosetEquiv
          A D E.toAbstractExtension hME hTot hInertia a r
    _ = ∑ q, relativeCosetAction A E.base E.field E.below a q :=
      e.sum_comp (relativeCosetAction A E.base E.field E.below a)

theorem commute_of_same_restriction_of_inertia_le
    (D : DegreeData G) [IsTopologicalGroup G]
    (E : DegreeData.AbstractExtension G)
    (M : GaloisExtension E.base)
    (hME : M.field.toSubgroup ≤ E.field.toSubgroup)
    (hIE : (D.fieldInertia E.field).toSubgroup ≤ M.field.toSubgroup)
    [hEnormal :
      (extensionSubgroup E.base E.field E.below).Normal]
    (g t : E.base.toSubgroup ⧸
      extensionSubgroup E.base M.field M.below)
    (hres : abstractReciprocityRestriction
        E.base E.field M.field hME E.below g =
      abstractReciprocityRestriction
        E.base E.field M.field hME E.below t) :
    Commute g t := by
  rw [Commute]
  let a : E.base.toSubgroup := Quotient.out g
  let b : E.base.toSubgroup := Quotient.out t
  have ha : (QuotientGroup.mk'
      (extensionSubgroup E.base M.field M.below)) a = g :=
    Quotient.out_eq' g
  have hb : (QuotientGroup.mk'
      (extensionSubgroup E.base M.field M.below)) b = t :=
    Quotient.out_eq' t
  have hcosetE :
      (QuotientGroup.mk'
        (extensionSubgroup E.base E.field E.below)) (a * b) =
      (QuotientGroup.mk'
        (extensionSubgroup E.base E.field E.below)) (b * a) := by
    rw [map_mul, map_mul]
    have haE : (QuotientGroup.mk'
        (extensionSubgroup E.base E.field E.below)) a =
        abstractReciprocityRestriction
          E.base E.field M.field hME E.below g := by
      calc
        (QuotientGroup.mk'
            (extensionSubgroup E.base E.field E.below)) a =
            abstractReciprocityRestriction E.base E.field M.field hME E.below
              ((QuotientGroup.mk'
                (extensionSubgroup E.base M.field M.below)) a) := rfl
        _ = abstractReciprocityRestriction
            E.base E.field M.field hME E.below g :=
          congrArg (abstractReciprocityRestriction
            E.base E.field M.field hME E.below) ha
    have hbE : (QuotientGroup.mk'
        (extensionSubgroup E.base E.field E.below)) b =
        abstractReciprocityRestriction
          E.base E.field M.field hME E.below t := by
      calc
        (QuotientGroup.mk'
            (extensionSubgroup E.base E.field E.below)) b =
            abstractReciprocityRestriction E.base E.field M.field hME E.below
              ((QuotientGroup.mk'
                (extensionSubgroup E.base M.field M.below)) b) := rfl
        _ = abstractReciprocityRestriction
            E.base E.field M.field hME E.below t :=
          congrArg (abstractReciprocityRestriction
            E.base E.field M.field hME E.below) hb
    rw [haE, hbE, hres]
  let z : E.base.toSubgroup := (a * b)⁻¹ * (b * a)
  have hzE : z ∈ extensionSubgroup E.base E.field E.below :=
    QuotientGroup.eq.mp hcosetE
  have hzE' : z.1 ∈ E.field.toSubgroup :=
    (mem_extensionSubgroup_iff E.base E.field E.below z).1 hzE
  have hzDegree : D.degree z.1 = 1 := by
    dsimp [z]
    rw [map_mul, map_inv, map_mul, map_mul]
    apply Multiplicative.ext
    change -((D.degree a.1).toAdd + (D.degree b.1).toAdd) +
        ((D.degree b.1).toAdd + (D.degree a.1).toAdd) = 0
    abel
  have hzM : z.1 ∈ M.field.toSubgroup :=
    hIE ⟨hzE', hzDegree⟩
  have hzH : z ∈ extensionSubgroup E.base M.field M.below :=
    (mem_extensionSubgroup_iff E.base M.field M.below z).2 hzM
  calc
    g * t = (QuotientGroup.mk'
        (extensionSubgroup E.base M.field M.below)) (a * b) := by
      rw [map_mul, ha, hb]
    _ = (QuotientGroup.mk'
        (extensionSubgroup E.base M.field M.below)) (b * a) :=
      QuotientGroup.eq.mpr hzH
    _ = t * g := by rw [map_mul, ha, hb]

theorem relativeCosetAction_eq_of_restriction_eq
    (A : Rep ℤ G) (E : DegreeData.AbstractExtension G)
    (M : GaloisExtension E.base)
    (hME : M.field.toSubgroup ≤ E.field.toSubgroup)
    [hEnormal :
      (extensionSubgroup E.base E.field E.below).Normal]
    (a : fixedCoefficients A E.field)
    (g t : E.base.toSubgroup ⧸
      extensionSubgroup E.base M.field M.below)
    (hres : abstractReciprocityRestriction
        E.base E.field M.field hME E.below g =
      abstractReciprocityRestriction
        E.base E.field M.field hME E.below t) :
    relativeCosetAction A E.base M.field M.below
        (fixedFieldInclusion A E.field M.field hME a) g =
      relativeCosetAction A E.base M.field M.below
        (fixedFieldInclusion A E.field M.field hME a) t := by
  refine Quotient.inductionOn₂' g t ?_ hres
  intro x y hxy
  simp only [relativeCosetAction_mk, fixedFieldInclusion_coe]
  have hxyE : x⁻¹ * y ∈ extensionSubgroup E.base E.field E.below :=
    QuotientGroup.eq.mp hxy
  let e : E.field.toSubgroup := ⟨(x⁻¹ * y).1, hxyE⟩
  have hy : y = x * Subgroup.inclusion E.below e := by
    apply Subtype.ext
    simp [e]
  rw [hy]
  change A.ρ x.1 a.1 = A.ρ (x.1 * e.1) a.1
  rw [map_mul]
  change A.ρ x.1 a.1 = A.ρ x.1 (A.ρ e.1 a.1)
  rw [a.2 e]
end GaloisExtension
end ClassFormation
end

/- FrobeniusLift -/
section
noncomputable section
namespace ClassFormation
open KummerTheory
open CyclicCohomology
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
namespace DegreeData

theorem exists_degreeOneFrobeniusLiftOfTotallyRamified
    (D : DegreeData G)
    (K : ResidueLevel D) (L : GaloisSubextension K.field)
    (hTot : L.IsTotallyRamified D)
    (q : L.extensionQuotient) :
    ∃ σ : D.FrobeniusElements K L.field L.below,
      D.frobeniusExponent K L.field L.below σ = 1 ∧
      L.extensionQuotientMulEquiv.symm
        (D.frobeniusRestriction K L.field L.below σ) = q := by
  let φ := D.chosenDegreeOneFrobeniusElement K L.field L.below
  let q₀ := D.frobeniusRestriction K L.field L.below φ
  let qRaw := L.extensionQuotientMulEquiv q
  obtain ⟨s, hs⟩ := QuotientGroup.mk'_surjective
    (extensionSubgroup K.field L.field L.below) (qRaw * q₀⁻¹)
  have hsDegree : D.degree s.1 ∈
      K.field.toSubgroup.map D.degree.toMonoidHom := ⟨s.1, s.2, rfl⟩
  have hImage :=
    (L.isTotallyRamified_iff_image_le D).1 hTot hsDegree
  obtain ⟨l, hlL, hlDegree⟩ := hImage
  let lL : L.field.toSubgroup := ⟨l, hlL⟩
  let lK : K.field.toSubgroup := Subgroup.inclusion L.below lL
  let i : K.field.toSubgroup := s * lK⁻¹
  let t : K.field.toSubgroup ⧸
      D.extensionInertiaWithin K.field L.field L.below :=
    QuotientGroup.mk i * φ.1
  have hiDegree : D.normalizedDegree K i = 1 := by
    change i ∈ (D.normalizedDegree K).toMonoidHom.ker
    rw [D.normalizedDegree_ker K]
    change D.degree i.1 = 1
    dsimp [i, lK, lL]
    rw [map_mul, map_inv]
    change D.degree s.1 * (D.degree l)⁻¹ = 1
    rw [← hlDegree]
    simp
  have htDegree : D.extensionNormalizedDegree K L.field L.below t =
      (Multiplicative.ofAdd (1 : ZHat) : ZHatMul) ^ (1 : ℕ) := by
    change D.extensionNormalizedDegree K L.field L.below
        (QuotientGroup.mk i * φ.1) = _
    rw [map_mul, D.extensionNormalizedDegree_mk, hiDegree, one_mul]
    calc
      D.extensionNormalizedDegree K L.field L.below φ.1 =
          (Multiplicative.ofAdd (1 : ZHat) : ZHatMul) ^
              D.frobeniusExponent K L.field L.below φ :=
        D.extensionNormalizedDegree_frobenius_eq_pow K L.field L.below φ
      _ = (Multiplicative.ofAdd (1 : ZHat) : ZHatMul) ^ (1 : ℕ) := by
        rw [D.frobeniusExponent_chosenDegreeOneFrobeniusElement]
  let σ : D.FrobeniusElements K L.field L.below :=
    ⟨t, 1, Nat.one_pos, htDegree⟩
  have hσExponent : D.frobeniusExponent K L.field L.below σ = 1 := by
    apply proCIntegerOne_pow_nat_injective
    calc
      (Multiplicative.ofAdd (1 : ZHat) : ZHatMul) ^
            D.frobeniusExponent K L.field L.below σ =
          D.extensionNormalizedDegree K L.field L.below σ.1 :=
        (D.extensionNormalizedDegree_frobenius_eq_pow
          K L.field L.below σ).symm
      _ = (Multiplicative.ofAdd (1 : ZHat) : ZHatMul) ^ (1 : ℕ) :=
        htDegree
  refine ⟨σ, hσExponent, ?_⟩
  apply L.extensionQuotientMulEquiv.injective
  rw [MulEquiv.apply_symm_apply]
  change D.extensionRestriction K.field L.field L.below
      (QuotientGroup.mk i * φ.1) = qRaw
  rw [map_mul, D.extensionRestriction_mk]
  have hiRestriction :
      (QuotientGroup.mk i :
        K.field.toSubgroup ⧸ extensionSubgroup K.field L.field L.below) =
        QuotientGroup.mk s := by
    dsimp [i]
    change (QuotientGroup.mk' (extensionSubgroup K.field L.field L.below))
        (s * lK⁻¹) =
      (QuotientGroup.mk' (extensionSubgroup K.field L.field L.below)) s
    rw [map_mul, map_inv]
    have hlOne :
        (QuotientGroup.mk' (extensionSubgroup K.field L.field L.below)) lK = 1 := by
      apply (QuotientGroup.eq_one_iff _).2
      exact lL.2
    rw [hlOne, inv_one, mul_one]
  rw [hiRestriction]
  change (QuotientGroup.mk' (extensionSubgroup K.field L.field L.below)) s * q₀ = qRaw
  rw [hs]
  simp [q₀]

noncomputable def chosenDegreeOneFrobeniusLiftOfTotallyRamified
    (D : DegreeData G)
    (K : ResidueLevel D) (L : GaloisSubextension K.field)
    (hTot : L.IsTotallyRamified D)
    (q : L.extensionQuotient) :
    D.FrobeniusElements K L.field L.below :=
  Classical.choose
    (D.exists_degreeOneFrobeniusLiftOfTotallyRamified
      K L hTot q)
 
@[simp]
theorem frobeniusExponent_chosenDegreeOneFrobeniusLiftOfTotallyRamified
    (D : DegreeData G)
    (K : ResidueLevel D) (L : GaloisSubextension K.field)
    (hTot : L.IsTotallyRamified D)
    (q : L.extensionQuotient) :
    D.frobeniusExponent K L.field L.below
      (D.chosenDegreeOneFrobeniusLiftOfTotallyRamified
        K L hTot q) = 1 := by
  exact (Classical.choose_spec
    (D.exists_degreeOneFrobeniusLiftOfTotallyRamified
      K L hTot q)).1
 
@[simp]
theorem frobeniusRestriction_chosenDegreeOneFrobeniusLiftOfTotallyRamified
    (D : DegreeData G)
    (K : ResidueLevel D) (L : GaloisSubextension K.field)
    (hTot : L.IsTotallyRamified D)
    (q : L.extensionQuotient) :
    L.extensionQuotientMulEquiv.symm
        (D.frobeniusRestriction K L.field L.below
          (D.chosenDegreeOneFrobeniusLiftOfTotallyRamified
            K L hTot q)) = q := by
  exact (Classical.choose_spec
    (D.exists_degreeOneFrobeniusLiftOfTotallyRamified
      K L hTot q)).2
 
theorem frobeniusRestriction_chosenDegreeOneFrobeniusLiftOfTotallyRamified_underlying
    (D : DegreeData G)
    (K : ResidueLevel D) (L : GaloisSubextension K.field)
    (hTot : L.IsTotallyRamified D)
    (q : L.extensionQuotient) :
    D.frobeniusRestriction K L.field L.below
        (D.chosenDegreeOneFrobeniusLiftOfTotallyRamified
          K L hTot q) =
      L.extensionQuotientMulEquiv q := by
  apply L.extensionQuotientMulEquiv.symm.injective
  exact
    D.frobeniusRestriction_chosenDegreeOneFrobeniusLiftOfTotallyRamified
      K L hTot q

noncomputable def chosenDegreeOneFrobeniusLiftOfFiniteTotallyRamified
    (D : DegreeData G)
    (K : ResidueLevel D)
    (L : GaloisExtension K.field)
    (hTot : L.IsTotallyRamified D)
    (q : L.extensionQuotient) :
    D.FrobeniusElements K L.field L.below :=
  D.chosenDegreeOneFrobeniusLiftOfTotallyRamified
    K L.toGaloisSubextension
      (L.isTotallyRamified_toGaloisSubextension D hTot)
      (L.toGaloisExtensionQuotientMulEquiv q)
 
@[simp]
theorem frobeniusExponent_chosenDegreeOneFrobeniusLiftOfFiniteTotallyRamified
    (D : DegreeData G)
    (K : ResidueLevel D)
    (L : GaloisExtension K.field)
    (hTot : L.IsTotallyRamified D)
    (q : L.extensionQuotient) :
    D.frobeniusExponent K L.field L.below
      (D.chosenDegreeOneFrobeniusLiftOfFiniteTotallyRamified
        K L hTot q) = 1 := by
  exact D.frobeniusExponent_chosenDegreeOneFrobeniusLiftOfTotallyRamified
    K L.toGaloisSubextension
      (L.isTotallyRamified_toGaloisSubextension D hTot)
      (L.toGaloisExtensionQuotientMulEquiv q)
 
@[simp]
theorem frobeniusRestriction_chosenDegreeOneFrobeniusLiftOfFiniteTotallyRamified
    (D : DegreeData G)
    (K : ResidueLevel D)
    (L : GaloisExtension K.field)
    (hTot : L.IsTotallyRamified D)
    (q : L.extensionQuotient) :
    L.extensionQuotientMulEquiv.symm
        (D.frobeniusRestriction K L.field L.below
          (D.chosenDegreeOneFrobeniusLiftOfFiniteTotallyRamified
            K L hTot q)) = q := by
  apply L.extensionQuotientMulEquiv.injective
  rw [L.extensionQuotientMulEquiv.apply_symm_apply]
  have h :=
    D.frobeniusRestriction_chosenDegreeOneFrobeniusLiftOfTotallyRamified_underlying
      K L.toGaloisSubextension
        (L.isTotallyRamified_toGaloisSubextension D hTot)
        (L.toGaloisExtensionQuotientMulEquiv q)
  change
    D.frobeniusRestriction K L.field L.below
        (D.chosenDegreeOneFrobeniusLiftOfTotallyRamified
          K L.toGaloisSubextension
            (L.isTotallyRamified_toGaloisSubextension D hTot)
            (L.toGaloisExtensionQuotientMulEquiv q)) =
      L.extensionQuotientMulEquiv q at h
  exact h
 
theorem frobeniusRestriction_chosenDegreeOneFrobeniusLiftOfFiniteTotallyRamified_underlying
    (D : DegreeData G)
    (K : ResidueLevel D)
    (L : GaloisExtension K.field)
    (hTot : L.IsTotallyRamified D)
    (q : L.extensionQuotient) :
    D.frobeniusRestriction K L.field L.below
        (D.chosenDegreeOneFrobeniusLiftOfFiniteTotallyRamified
          K L hTot q) =
      L.extensionQuotientMulEquiv q := by
  apply L.extensionQuotientMulEquiv.symm.injective
  exact
    D.frobeniusRestriction_chosenDegreeOneFrobeniusLiftOfFiniteTotallyRamified
      K L hTot q

noncomputable def totallyRamifiedFiniteGaloisExtension
    (D : DegreeData G)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    (K : ResidueLevel D)
    (L : GaloisExtension K.field)
    (hTot : L.IsTotallyRamified D)
    (q : L.extensionQuotient) :
    GaloisExtension K.field := by
  let σ := D.chosenDegreeOneFrobeniusLiftOfFiniteTotallyRamified
    K L hTot q
  letI : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field L.field L.below) :=
    L.finite
  let SigmaI := D.frobeniusFixedIntermediateField K L.field L.below σ
  let LI := D.fieldAsMaximalUnramifiedIntermediate K.field L.field L.below
  let C := SigmaI.compositum LI
  letI : (extensionSubgroup K.field (D.maximalUnramifiedField L.field)
      (D.maximalUnramifiedField_le_of_le L.below)).Normal :=
    D.extensionSubgroup_maximalUnramifiedField_normal K.field L.field L.below
  let M := C.galoisRefinement
  exact
    { field := M.field
      below := M.below
      normal := by
        exact FiniteIntermediateField.galoisRefinement_normal C
      finite := M.finite }
 
theorem totallyRamifiedFiniteGaloisExtension_le_L
    (D : DegreeData G)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    (K : ResidueLevel D)
    (L : GaloisExtension K.field)
    (hTot : L.IsTotallyRamified D)
    (q : L.extensionQuotient) :
    (D.totallyRamifiedFiniteGaloisExtension
      K L hTot q).field.toSubgroup ≤ L.field.toSubgroup := by
  let σ := D.chosenDegreeOneFrobeniusLiftOfFiniteTotallyRamified
    K L hTot q
  let : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field L.field L.below) :=
    L.finite
  let SigmaI := D.frobeniusFixedIntermediateField K L.field L.below σ
  let LI := D.fieldAsMaximalUnramifiedIntermediate K.field L.field L.below
  let C := SigmaI.compositum LI
  let : (extensionSubgroup K.field (D.maximalUnramifiedField L.field)
      (D.maximalUnramifiedField_le_of_le L.below)).Normal :=
    D.extensionSubgroup_maximalUnramifiedField_normal K.field L.field L.below
  change (C.galoisRefinement).field.toSubgroup ≤ L.field.toSubgroup
  exact C.galoisRefinement_le_field.trans
    (FiniteIntermediateField.compositum_le_right SigmaI LI)
 
theorem totallyRamifiedFiniteGaloisExtension_le_sigma
    (D : DegreeData G)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    (K : ResidueLevel D)
    (L : GaloisExtension K.field)
    (hTot : L.IsTotallyRamified D)
    (q : L.extensionQuotient) :
    (D.totallyRamifiedFiniteGaloisExtension
      K L hTot q).field.toSubgroup ≤
      (D.frobeniusFixedField K L.field L.below
        (D.chosenDegreeOneFrobeniusLiftOfFiniteTotallyRamified
          K L hTot q)).toSubgroup := by
  let σ := D.chosenDegreeOneFrobeniusLiftOfFiniteTotallyRamified
    K L hTot q
  let : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field L.field L.below) :=
    L.finite
  let SigmaI := D.frobeniusFixedIntermediateField K L.field L.below σ
  let LI := D.fieldAsMaximalUnramifiedIntermediate K.field L.field L.below
  let C := SigmaI.compositum LI
  let : (extensionSubgroup K.field (D.maximalUnramifiedField L.field)
      (D.maximalUnramifiedField_le_of_le L.below)).Normal :=
    D.extensionSubgroup_maximalUnramifiedField_normal K.field L.field L.below
  change (C.galoisRefinement).field.toSubgroup ≤ SigmaI.field.toSubgroup
  exact C.galoisRefinement_le_field.trans
    (FiniteIntermediateField.compositum_le_left SigmaI LI)
 
theorem maximalUnramifiedField_le_totallyRamifiedFiniteGaloisExtension
    (D : DegreeData G)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    (K : ResidueLevel D)
    (L : GaloisExtension K.field)
    (hTot : L.IsTotallyRamified D)
    (q : L.extensionQuotient) :
    (D.maximalUnramifiedField L.field).toSubgroup ≤
      (D.totallyRamifiedFiniteGaloisExtension
        K L hTot q).field.toSubgroup := by
  let σ := D.chosenDegreeOneFrobeniusLiftOfFiniteTotallyRamified
    K L hTot q
  let : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field L.field L.below) :=
    L.finite
  let SigmaI := D.frobeniusFixedIntermediateField K L.field L.below σ
  let LI := D.fieldAsMaximalUnramifiedIntermediate K.field L.field L.below
  let C := SigmaI.compositum LI
  let : (extensionSubgroup K.field (D.maximalUnramifiedField L.field)
      (D.maximalUnramifiedField_le_of_le L.below)).Normal :=
    D.extensionSubgroup_maximalUnramifiedField_normal K.field L.field L.below
  change (D.maximalUnramifiedField L.field).toSubgroup ≤
    (C.galoisRefinement).field.toSubgroup
  exact (C.galoisRefinement).above
end DegreeData
end ClassFormation
end

/- RestrictionEquiv -/
section
noncomputable section
namespace ClassFormation
open KummerTheory
open CyclicCohomology
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
namespace DegreeData

noncomputable def totallyRamifiedRestrictionEquiv
    (D : DegreeData G)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    (K : ResidueLevel D)
    (L : GaloisExtension K.field)
    (hTot : L.IsTotallyRamified D)
    (q : L.extensionQuotient) :
    let M := D.totallyRamifiedFiniteGaloisExtension
      K L hTot q
    let S := M.inertiaImage D
    let N := M.lowerFiniteGalois S
    letI : (extensionSubgroup
        (M.maximalUnramifiedSubextension D) M.field N.below).Normal :=
      N.normal
    N.extensionQuotient ≃* L.extensionQuotient := by
  let M := D.totallyRamifiedFiniteGaloisExtension
    K L hTot q
  let hML := D.totallyRamifiedFiniteGaloisExtension_le_L
    K L hTot q
  have hInertia : ∀ i : K.field.toSubgroup,
      i ∈ D.fieldInertiaWithin K.field →
      i.1 ∈ L.field.toSubgroup → i.1 ∈ M.field.toSubgroup := by
    intro i hiI hiL
    apply D.maximalUnramifiedField_le_totallyRamifiedFiniteGaloisExtension
      K L hTot q
    exact ⟨hiL, (D.mem_fieldInertiaWithin_iff K.field i).1 hiI⟩
  letI : (extensionSubgroup K.field L.field L.below).Normal := L.normal
  let EL := L.toFiniteAbstractExtension.toAbstractExtension
  letI : (extensionSubgroup EL.base EL.field EL.below).Normal := by
    change (extensionSubgroup K.field L.field L.below).Normal
    exact L.normal
  letI : Group EL.quotient := by
    change Group
      (K.field.toSubgroup ⧸ extensionSubgroup K.field L.field L.below)
    infer_instance
  exact (M.abstractReciprocityRestrictionMulEquiv
    D EL
      hML hTot hInertia).trans
      L.extensionQuotientMulEquiv.symm

theorem totallyRamifiedLowerDegree_eq
    (D : DegreeData G)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    (K : ResidueLevel D)
    (L : GaloisExtension K.field)
    (hTot : L.IsTotallyRamified D)
    (q : L.extensionQuotient) :
  let M := D.totallyRamifiedFiniteGaloisExtension
    K L hTot q
  let N := M.lowerFiniteGalois (M.inertiaImage D)
  (N.toFiniteAbstractExtension.degree : ℕ) =
    (L.toFiniteAbstractExtension.degree : ℕ) := by
  let M := D.totallyRamifiedFiniteGaloisExtension
    K L hTot q
  let S := M.inertiaImage D
  let M₀ := M.maximalUnramifiedSubextension D
  let hMM₀ : M.field.toSubgroup ≤ M₀.toSubgroup :=
    M.field_le_intermediateField S
  let N := M.lowerFiniteGalois S
  let E := L.toFiniteAbstractExtension
  let e := D.totallyRamifiedRestrictionEquiv
    K L hTot q
  calc
    (N.toFiniteAbstractExtension.degree : ℕ) =
        (extensionSubgroup M₀ M.field hMM₀).index :=
      N.toFiniteAbstractExtension.extensionSubgroup_index_eq_degree.symm
    _ = Nat.card N.extensionQuotient :=
      Subgroup.index_eq_card (extensionSubgroup M₀ M.field hMM₀)
    _ = Nat.card L.extensionQuotient :=
      Nat.card_congr e.toEquiv
    _ = (extensionSubgroup K.field L.field L.below).index :=
      (Subgroup.index_eq_card (extensionSubgroup K.field L.field L.below)).symm
    _ = (E.degree : ℕ) := by
      have h := E.extensionSubgroup_index_eq_degree
      change (extensionSubgroup K.field L.field L.below).index =
        (E.degree : ℕ) at h
      exact h

noncomputable def totallyRamifiedLowerGenerator
    (D : DegreeData G)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    (K : ResidueLevel D)
    (L : GaloisExtension K.field)
    (hTot : L.IsTotallyRamified D)
    (q : L.extensionQuotient) :
    let M := D.totallyRamifiedFiniteGaloisExtension
      K L hTot q
    let S := M.inertiaImage D
    let N := M.lowerFiniteGalois S
    letI : (extensionSubgroup
        (M.maximalUnramifiedSubextension D) M.field N.below).Normal :=
      N.normal
    N.extensionQuotient := by
  exact (D.totallyRamifiedRestrictionEquiv
    K L hTot q).symm q
 
@[simp]
theorem totallyRamifiedRestrictionEquiv_lowerGenerator
    (D : DegreeData G)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    (K : ResidueLevel D)
    (L : GaloisExtension K.field)
    (hTot : L.IsTotallyRamified D)
    (q : L.extensionQuotient) :
    D.totallyRamifiedRestrictionEquiv K L hTot q
      (D.totallyRamifiedLowerGenerator
        K L hTot q) = q := by
  exact MulEquiv.apply_symm_apply _ q
 
theorem totallyRamifiedLowerGenerator_generates
    (D : DegreeData G)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    (K : ResidueLevel D)
    (L : GaloisExtension K.field)
    (hTot : L.IsTotallyRamified D)
    (q : L.extensionQuotient)
    (hq : ∀ x, x ∈ Subgroup.zpowers q) :
    ∀ x, x ∈ Subgroup.zpowers
      (D.totallyRamifiedLowerGenerator
        K L hTot q) := by
  let e := D.totallyRamifiedRestrictionEquiv
    K L hTot q
  let g := D.totallyRamifiedLowerGenerator
    K L hTot q
  intro x
  obtain ⟨n, hn⟩ := Subgroup.mem_zpowers_iff.mp (hq (e x))
  apply Subgroup.mem_zpowers_iff.mpr
  refine ⟨n, ?_⟩
  apply e.injective
  rw [map_zpow,
    D.totallyRamifiedRestrictionEquiv_lowerGenerator, hn]
end DegreeData
end ClassFormation
end

/- FrobeniusNorms -/
section
noncomputable section
namespace ClassFormation
open KummerTheory
open CyclicCohomology
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
namespace DegreeData

noncomputable def totallyRamifiedFrobeniusInM
    (D : DegreeData G)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    (K : ResidueLevel D)
    (L : GaloisExtension K.field)
    (hTot : L.IsTotallyRamified D)
    (q : L.extensionQuotient) :
    (D.totallyRamifiedFiniteGaloisExtension
      K L hTot q).extensionQuotient := by
  let σ := D.chosenDegreeOneFrobeniusLiftOfFiniteTotallyRamified
    K L hTot q
  let M := D.totallyRamifiedFiniteGaloisExtension
    K L hTot q
  letI : (extensionSubgroup K.field M.field M.below).Normal := M.normal
  have hIM : D.extensionInertiaWithin K.field L.field L.below ≤
      extensionSubgroup K.field M.field M.below := by
    intro x hx
    apply (mem_extensionSubgroup_iff K.field M.field M.below x).2
    apply D.maximalUnramifiedField_le_totallyRamifiedFiniteGaloisExtension
      K L hTot q
    exact ⟨(mem_extensionSubgroup_iff K.field L.field L.below x).1 hx.1,
      (D.mem_fieldInertiaWithin_iff K.field x).1 hx.2⟩
  let r : (K.field.toSubgroup ⧸
      D.extensionInertiaWithin K.field L.field L.below) →*
      (K.field.toSubgroup ⧸
        extensionSubgroup K.field M.field M.below) :=
    QuotientGroup.map
      (D.extensionInertiaWithin K.field L.field L.below)
      (extensionSubgroup K.field M.field M.below)
      (MonoidHom.id K.field.toSubgroup) hIM
  exact M.extensionQuotientMulEquiv.symm (r σ.1)
 
@[simp]
theorem totallyRamifiedFrobeniusInM_restriction
    (D : DegreeData G)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    (K : ResidueLevel D)
    (L : GaloisExtension K.field)
    (hTot : L.IsTotallyRamified D)
    (q : L.extensionQuotient) :
    let M := D.totallyRamifiedFiniteGaloisExtension
      K L hTot q
    let hML := D.totallyRamifiedFiniteGaloisExtension_le_L
      K L hTot q
    M.bundledRestrictionHom L hML
      (D.totallyRamifiedFrobeniusInM
        K L hTot q) = q := by
  let σ := D.chosenDegreeOneFrobeniusLiftOfFiniteTotallyRamified
    K L hTot q
  let M := D.totallyRamifiedFiniteGaloisExtension
    K L hTot q
  let hML := D.totallyRamifiedFiniteGaloisExtension_le_L
    K L hTot q
  let : (extensionSubgroup K.field M.field M.below).Normal := M.normal
  have hIM : D.extensionInertiaWithin K.field L.field L.below ≤
      extensionSubgroup K.field M.field M.below := by
    intro x hx
    apply (mem_extensionSubgroup_iff K.field M.field M.below x).2
    apply D.maximalUnramifiedField_le_totallyRamifiedFiniteGaloisExtension
      K L hTot q
    exact ⟨(mem_extensionSubgroup_iff K.field L.field L.below x).1 hx.1,
      (D.mem_fieldInertiaWithin_iff K.field x).1 hx.2⟩
  let r : (K.field.toSubgroup ⧸
      D.extensionInertiaWithin K.field L.field L.below) →*
      (K.field.toSubgroup ⧸
        extensionSubgroup K.field M.field M.below) :=
    QuotientGroup.map
      (D.extensionInertiaWithin K.field L.field L.below)
      (extensionSubgroup K.field M.field M.below)
      (MonoidHom.id K.field.toSubgroup) hIM
  change L.extensionQuotientMulEquiv.symm
      (abstractReciprocityRestriction K.field L.field M.field hML L.below
        (r σ.1)) = q
  apply L.extensionQuotientMulEquiv.injective
  rw [MulEquiv.apply_symm_apply]
  have hcompat : ∀ z : K.field.toSubgroup ⧸
      D.extensionInertiaWithin K.field L.field L.below,
      abstractReciprocityRestriction K.field L.field M.field hML L.below (r z) =
        D.extensionRestriction K.field L.field L.below z := by
    intro z
    refine Quotient.inductionOn' z ?_
    intro x
    rfl
  exact (hcompat σ.1).trans
    (D.frobeniusRestriction_chosenDegreeOneFrobeniusLiftOfFiniteTotallyRamified_underlying
      K L hTot q)
 
@[simp]
theorem totallyRamifiedLowerGenerator_inclusion_restriction
    (D : DegreeData G)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    (K : ResidueLevel D)
    (L : GaloisExtension K.field)
    (hTot : L.IsTotallyRamified D)
    (q : L.extensionQuotient) :
    let M := D.totallyRamifiedFiniteGaloisExtension
      K L hTot q
    let S := M.inertiaImage D
    let hML := D.totallyRamifiedFiniteGaloisExtension_le_L
      K L hTot q
    M.bundledRestrictionHom L hML
      (M.lowerInclusionHom S
        (D.totallyRamifiedLowerGenerator
          K L hTot q)) = q := by
  let M := D.totallyRamifiedFiniteGaloisExtension
    K L hTot q
  let S := M.inertiaImage D
  let hML := D.totallyRamifiedFiniteGaloisExtension_le_L
    K L hTot q
  let e := D.totallyRamifiedRestrictionEquiv
    K L hTot q
  let g := D.totallyRamifiedLowerGenerator
    K L hTot q
  change M.bundledRestrictionHom L hML
      (M.lowerInclusionHom S g) = q
  have hcompat : ∀ x,
      M.bundledRestrictionHom L hML
        (M.lowerInclusionHom S x) = e x := by
    intro x
    refine Quotient.inductionOn' x ?_
    intro m
    rw [M.lowerInclusionHom_mk S m]
    dsimp [e, totallyRamifiedRestrictionEquiv]
    rfl
  exact (hcompat g).trans
    (D.totallyRamifiedRestrictionEquiv_lowerGenerator K L hTot q)
 
theorem totallyRamified_generator_commutes_frobenius
    (D : DegreeData G)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    (K : ResidueLevel D)
    (L : GaloisExtension K.field)
    (hTot : L.IsTotallyRamified D)
    (q : L.extensionQuotient) :
    let M := D.totallyRamifiedFiniteGaloisExtension
      K L hTot q
    let S := M.inertiaImage D
    Commute
      (M.lowerInclusionHom S
        (D.totallyRamifiedLowerGenerator
          K L hTot q))
      (D.totallyRamifiedFrobeniusInM
        K L hTot q) := by
  let M := D.totallyRamifiedFiniteGaloisExtension
    K L hTot q
  let S := M.inertiaImage D
  let hML := D.totallyRamifiedFiniteGaloisExtension_le_L
    K L hTot q
  let g := D.totallyRamifiedLowerGenerator
    K L hTot q
  let t := D.totallyRamifiedFrobeniusInM
    K L hTot q
  let EL : DegreeData.AbstractExtension G := {
    field := L.field
    base := K.field
    below := L.below }
  let : (extensionSubgroup EL.base EL.field EL.below).Normal := by
    change (extensionSubgroup K.field L.field L.below).Normal
    exact L.normal
  have hresBundled :
      M.bundledRestrictionHom L hML (M.lowerInclusionHom S g) =
        M.bundledRestrictionHom L hML t := by
    rw [D.totallyRamifiedLowerGenerator_inclusion_restriction,
      D.totallyRamifiedFrobeniusInM_restriction]
  have hresRaw :
      abstractReciprocityRestriction K.field L.field M.field hML L.below
          (M.extensionQuotientMulEquiv (M.lowerInclusionHom S g)) =
        abstractReciprocityRestriction K.field L.field M.field hML L.below
          (M.extensionQuotientMulEquiv t) := by
    apply L.extensionQuotientMulEquiv.symm.injective
    simpa [GaloisExtension.bundledRestrictionHom] using hresBundled
  have hcommRaw := M.commute_of_same_restriction_of_inertia_le
    D EL hML
    (D.maximalUnramifiedField_le_totallyRamifiedFiniteGaloisExtension
      K L hTot q)
    (M.extensionQuotientMulEquiv (M.lowerInclusionHom S g))
    (M.extensionQuotientMulEquiv t) hresRaw
  rw [Commute]
  apply M.extensionQuotientMulEquiv.injective
  simpa only [map_mul] using hcommRaw.eq
 
theorem totallyRamified_frobenius_fixes_sigma
    (D : DegreeData G) (A : Rep ℤ G)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    (K : ResidueLevel D)
    (L : GaloisExtension K.field)
    (hTot : L.IsTotallyRamified D)
    (q : L.extensionQuotient)
    (a : fixedCoefficients A
      (D.frobeniusFixedField K L.field L.below
        (D.chosenDegreeOneFrobeniusLiftOfFiniteTotallyRamified
          K L hTot q))) :
    let σ := D.chosenDegreeOneFrobeniusLiftOfFiniteTotallyRamified
      K L hTot q
    let Sigma := D.frobeniusFixedField K L.field L.below σ
    let M := D.totallyRamifiedFiniteGaloisExtension
      K L hTot q
    let hMSigma :=
      D.totallyRamifiedFiniteGaloisExtension_le_sigma
        K L hTot q
    relativeCosetAction A K.field M.field M.below
        (fixedFieldInclusion A Sigma M.field hMSigma a)
        (M.extensionQuotientMulEquiv
          (D.totallyRamifiedFrobeniusInM
            K L hTot q)) =
      (fixedFieldInclusion A Sigma M.field hMSigma a).1 := by
  let σ := D.chosenDegreeOneFrobeniusLiftOfFiniteTotallyRamified
    K L hTot q
  let Sigma := D.frobeniusFixedField K L.field L.below σ
  let M := D.totallyRamifiedFiniteGaloisExtension
    K L hTot q
  let hMSigma :=
    D.totallyRamifiedFiniteGaloisExtension_le_sigma
      K L hTot q
  let : (extensionSubgroup K.field M.field M.below).Normal := M.normal
  have hIM : D.extensionInertiaWithin K.field L.field L.below ≤
      extensionSubgroup K.field M.field M.below := by
    intro x hx
    apply (mem_extensionSubgroup_iff K.field M.field M.below x).2
    apply D.maximalUnramifiedField_le_totallyRamifiedFiniteGaloisExtension
      K L hTot q
    exact ⟨(mem_extensionSubgroup_iff K.field L.field L.below x).1 hx.1,
      (D.mem_fieldInertiaWithin_iff K.field x).1 hx.2⟩
  let r : (K.field.toSubgroup ⧸
      D.extensionInertiaWithin K.field L.field L.below) →*
      (K.field.toSubgroup ⧸
        extensionSubgroup K.field M.field M.below) :=
    QuotientGroup.map
      (D.extensionInertiaWithin K.field L.field L.below)
      (extensionSubgroup K.field M.field M.below)
      (MonoidHom.id K.field.toSubgroup) hIM
  change relativeCosetAction A K.field M.field M.below
      (fixedFieldInclusion A Sigma M.field hMSigma a) (r σ.1) = _
  let x : K.field.toSubgroup := Quotient.out σ.1
  have hx : (QuotientGroup.mk x :
      K.field.toSubgroup ⧸
        D.extensionInertiaWithin K.field L.field L.below) = σ.1 :=
    Quotient.out_eq' σ.1
  rw [← hx]
  change A.ρ x.1 a.1 = a.1
  have hxClosure : (QuotientGroup.mk x :
      K.field.toSubgroup ⧸
        D.extensionInertiaWithin K.field L.field L.below) ∈
      (D.frobeniusClosure K L.field L.below σ).toSubgroup := by
    rw [hx]
    exact (D.frobeniusInClosure K L.field L.below σ).2
  let xSigma : Sigma.toSubgroup :=
    ⟨x.1, ⟨x, hxClosure, rfl⟩⟩
  exact a.2 xSigma
 
theorem totallyRamified_actions_agree_on_L
    (D : DegreeData G) (A : Rep ℤ G)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    (K : ResidueLevel D)
    (L : GaloisExtension K.field)
    (hTot : L.IsTotallyRamified D)
    (q : L.extensionQuotient)
    (a : fixedCoefficients A L.field) :
    let M := D.totallyRamifiedFiniteGaloisExtension
      K L hTot q
    let S := M.inertiaImage D
    let hML := D.totallyRamifiedFiniteGaloisExtension_le_L
      K L hTot q
    relativeCosetAction A K.field M.field M.below
        (fixedFieldInclusion A L.field M.field hML a)
        (M.extensionQuotientMulEquiv
          (M.lowerInclusionHom S
            (D.totallyRamifiedLowerGenerator
              K L hTot q))) =
      relativeCosetAction A K.field M.field M.below
        (fixedFieldInclusion A L.field M.field hML a)
        (M.extensionQuotientMulEquiv
          (D.totallyRamifiedFrobeniusInM
            K L hTot q)) := by
  let M := D.totallyRamifiedFiniteGaloisExtension
    K L hTot q
  let S := M.inertiaImage D
  let hML := D.totallyRamifiedFiniteGaloisExtension_le_L
    K L hTot q
  let EL : DegreeData.AbstractExtension G := {
    field := L.field
    base := K.field
    below := L.below }
  let : (extensionSubgroup EL.base EL.field EL.below).Normal := by
    change (extensionSubgroup K.field L.field L.below).Normal
    exact L.normal
  apply M.relativeCosetAction_eq_of_restriction_eq A EL hML
  apply L.extensionQuotientMulEquiv.symm.injective
  simpa [GaloisExtension.bundledRestrictionHom] using
    (show M.bundledRestrictionHom L hML
        (M.lowerInclusionHom S
          (D.totallyRamifiedLowerGenerator
            K L hTot q)) =
      M.bundledRestrictionHom L hML
        (D.totallyRamifiedFrobeniusInM
          K L hTot q) by
      rw [D.totallyRamifiedLowerGenerator_inclusion_restriction,
        D.totallyRamifiedFrobeniusInM_restriction])

theorem reciprocity_totallyRamified_relativeNorm_L
    (D : DegreeData G) (A : Rep ℤ G)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    (K : ResidueLevel D)
    (L : GaloisExtension K.field)
    (hTot : L.IsTotallyRamified D)
    (q : L.extensionQuotient)
    (a : fixedCoefficients A L.field) :
    let M := D.totallyRamifiedFiniteGaloisExtension
      K L hTot q
    let M₀ := M.maximalUnramifiedSubextension D
    let hML := D.totallyRamifiedFiniteGaloisExtension_le_L
      K L hTot q
    let hMM₀ : M.field.toSubgroup ≤ M₀.toSubgroup :=
      M.field_le_intermediateField (M.inertiaImage D)
    let hM₀K : M₀.toSubgroup ≤ K.field.toSubgroup :=
      M.intermediateField_le_base (M.inertiaImage D)
    letI : Finite
        (K.field.toSubgroup ⧸ extensionSubgroup K.field L.field L.below) :=
      L.finite
    letI : Finite
        (M₀.toSubgroup ⧸ extensionSubgroup M₀ M.field hMM₀) :=
      M.extension_over_intermediate_finite (M.inertiaImage D)
    relativeNorm A M₀ M.field hMM₀
        (fixedFieldInclusion A L.field M.field hML a) =
      fixedFieldInclusion A K.field M₀ hM₀K
        (relativeNorm A K.field L.field L.below a) := by
  let M := D.totallyRamifiedFiniteGaloisExtension
    K L hTot q
  let hML := D.totallyRamifiedFiniteGaloisExtension_le_L
    K L hTot q
  let : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field L.field L.below) :=
    L.finite
  have hInertia : ∀ i : K.field.toSubgroup,
      i ∈ D.fieldInertiaWithin K.field →
      i.1 ∈ L.field.toSubgroup → i.1 ∈ M.field.toSubgroup := by
    intro i hiI hiL
    apply D.maximalUnramifiedField_le_totallyRamifiedFiniteGaloisExtension
      K L hTot q
    exact ⟨hiL, (D.mem_fieldInertiaWithin_iff K.field i).1 hiI⟩
  exact M.reciprocity_relativeNorm_fixedFieldInclusion
    A D L.toFiniteAbstractExtension hML hTot hInertia a

theorem reciprocity_totallyRamified_relativeNorm_sigma
    (D : DegreeData G) (A : Rep ℤ G)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    [TotallyDisconnectedSpace G]
    (K : ResidueLevel D)
    (L : GaloisExtension K.field)
    (hTot : L.IsTotallyRamified D)
    (q : L.extensionQuotient)
    (a : fixedCoefficients A
      (D.frobeniusFixedField K L.field L.below
        (D.chosenDegreeOneFrobeniusLiftOfFiniteTotallyRamified
          K L hTot q))) :
    letI : Finite
        (K.field.toSubgroup ⧸ extensionSubgroup K.field L.field L.below) :=
      L.finite
    let σ := D.chosenDegreeOneFrobeniusLiftOfFiniteTotallyRamified
      K L hTot q
    let Sigma := D.frobeniusFixedField K L.field L.below σ
    let hSigmaK := D.frobeniusFixedField_le K L.field L.below σ
    letI : Finite
        (K.field.toSubgroup ⧸ extensionSubgroup K.field Sigma hSigmaK) :=
      D.frobeniusFixedField_finite K L.field L.below σ
    let M := D.totallyRamifiedFiniteGaloisExtension
      K L hTot q
    let M₀ := M.maximalUnramifiedSubextension D
    let hMSigma :=
      D.totallyRamifiedFiniteGaloisExtension_le_sigma
        K L hTot q
    let hMM₀ : M.field.toSubgroup ≤ M₀.toSubgroup :=
      M.field_le_intermediateField (M.inertiaImage D)
    let hM₀K : M₀.toSubgroup ≤ K.field.toSubgroup :=
      M.intermediateField_le_base (M.inertiaImage D)
    letI : Finite
        (M₀.toSubgroup ⧸ extensionSubgroup M₀ M.field hMM₀) :=
      M.extension_over_intermediate_finite (M.inertiaImage D)
    relativeNorm A M₀ M.field hMM₀
        (fixedFieldInclusion A Sigma M.field hMSigma a) =
      fixedFieldInclusion A K.field M₀ hM₀K
        (relativeNorm A K.field Sigma hSigmaK a) := by
  let : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field L.field L.below) :=
    L.finite
  let σ := D.chosenDegreeOneFrobeniusLiftOfFiniteTotallyRamified
    K L hTot q
  let Sigma := D.frobeniusFixedField K L.field L.below σ
  let hSigmaK := D.frobeniusFixedField_le K L.field L.below σ
  let hSigmaFinite : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field Sigma hSigmaK) :=
    D.frobeniusFixedField_finite K L.field L.below σ
  let ESigma : DegreeData.FiniteAbstractExtension G :=
    DegreeData.FiniteAbstractExtension.ofInclusion Sigma K.field hSigmaK
  let M := D.totallyRamifiedFiniteGaloisExtension
    K L hTot q
  let hMSigma :=
    D.totallyRamifiedFiniteGaloisExtension_le_sigma
      K L hTot q
  have hSigmaTot : ESigma.IsTotallyRamified D := by
    have hrelative : (ESigma.residueDegree D : ℕ) = 1 := by
      calc
        (ESigma.residueDegree D : ℕ) =
            D.frobeniusExponent K L.field L.below σ :=
          D.frobeniusFixedField_residueDegreeOverBase K L.field L.below σ
        _ = 1 :=
          D.frobeniusExponent_chosenDegreeOneFrobeniusLiftOfFiniteTotallyRamified
            K L hTot q
    exact ESigma.isTotallyRamified_of_residueDegree_eq_one D hrelative
  have hInertia : ∀ i : K.field.toSubgroup,
      i ∈ D.fieldInertiaWithin K.field →
      i.1 ∈ Sigma.toSubgroup → i.1 ∈ M.field.toSubgroup := by
    intro i hiI hiSigma
    apply D.maximalUnramifiedField_le_totallyRamifiedFiniteGaloisExtension
      K L hTot q
    have hiSigmaInertia :
        i.1 ∈ (D.fieldInertia Sigma).toSubgroup :=
      ⟨hiSigma, (D.mem_fieldInertiaWithin_iff K.field i).1 hiI⟩
    rw [D.frobeniusFixedField_fieldInertia
      K L.field L.below σ] at hiSigmaInertia
    exact hiSigmaInertia
  exact M.reciprocity_relativeNorm_fixedFieldInclusion
    A D ESigma hMSigma hSigmaTot hInertia a
end DegreeData
end ClassFormation
end

/- FixedSource -/
section
noncomputable section
namespace ClassFormation
open KummerTheory
open CyclicCohomology
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]

theorem reciprocity_fixedCombination_of_commute
    {Q : IntegralRepGroupType} [Group Q] (B : Rep ℤ Q)
    (g t : Q) (hcomm : Commute g t) (c b a : B.V)
    (htc : B.ρ t c = c)
    (hgb : B.ρ g b = B.ρ t b)
    (hbc : b - c = B.ρ g a - a) :
    B.ρ g (b + a - B.ρ t a) = b + a - B.ρ t a := by
  have hcommAction : B.ρ g (B.ρ t a) = B.ρ t (B.ρ g a) := by
    calc
      B.ρ g (B.ρ t a) = B.ρ (g * t) a := by
        rw [map_mul]
        rfl
      _ = B.ρ (t * g) a := by rw [hcomm.eq]
      _ = B.ρ t (B.ρ g a) := by
        rw [map_mul]
        rfl
  have hb : b = c + B.ρ g a - a := by
    calc
      b = (b - c) + c := by abel
      _ = (B.ρ g a - a) + c := by rw [hbc]
      _ = c + B.ρ g a - a := by abel
  have htbc := congrArg (fun z : B.V ↦ B.ρ t z) hbc
  have htbc' : B.ρ t b - c = B.ρ t (B.ρ g a) - B.ρ t a := by
    simpa only [map_sub, htc] using htbc
  have htb : B.ρ t b = c + B.ρ t (B.ρ g a) - B.ρ t a := by
    calc
      B.ρ t b = (B.ρ t b - c) + c := by abel
      _ = (B.ρ t (B.ρ g a) - B.ρ t a) + c := by rw [htbc']
      _ = c + B.ρ t (B.ρ g a) - B.ρ t a := by abel
  calc
    B.ρ g (b + a - B.ρ t a) =
        B.ρ g b + B.ρ g a - B.ρ g (B.ρ t a) := by
      simp only [map_add, map_sub]
    _ = B.ρ t b + B.ρ g a - B.ρ t (B.ρ g a) := by
      rw [hgb, hcommAction]
    _ = c + B.ρ g a - B.ρ t a := by rw [htb]; abel
    _ = b + a - B.ρ t a := by rw [hb]; abel
namespace GaloisExtension
 
theorem relativeCosetAction_lowerInclusionHom
    (A : Rep ℤ G) [IsTopologicalGroup G] {K : ClosedSubgroup G}
    (M : GaloisExtension K) (S : Subgroup M.extensionQuotient)
    (a : fixedCoefficients A M.field)
    (g : (M.intermediateField S).toSubgroup ⧸
      extensionSubgroup (M.intermediateField S) M.field
        (M.field_le_intermediateField S)) :
    relativeCosetAction A (M.intermediateField S) M.field
        (M.field_le_intermediateField S) a g =
      relativeCosetAction A K M.field M.below a
        (M.lowerInclusionHom S g) := by
  refine Quotient.inductionOn' g ?_
  intro m
  rfl
end GaloisExtension
namespace CyclicExtension
variable {K : FiniteLevel G}

def toGaloisExtension (E : CyclicExtension K) :
    GaloisExtension K.field where
  field := E.field
  below := E.below
  normal := E.normal
  finite := E.finite

def galoisGenerator (E : CyclicExtension K) :
    E.toGaloisExtension.extensionQuotient :=
  E.toGaloisExtension.extensionQuotientMulEquiv.symm E.generator

theorem galoisGenerator_generates (E : CyclicExtension K) :
    ∀ x, x ∈ Subgroup.zpowers E.galoisGenerator := by
  cases E with
  | mk L le normal finite g generates => exact generates
end CyclicExtension
namespace ValuationData
variable {D : DegreeData G} {A : Rep ℤ G}

theorem reciprocity_cyclicTotallyRamified_fixedSource
    (v : ValuationData D A) (hcf : SatisfiesClassFieldAxiom A)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    [TotallyDisconnectedSpace G]
    (K : FiniteLevel G)
    (E : CyclicExtension K)
    (hTot : E.IsTotallyRamified D)
    (k : ℕ)
    (piSigma : fixedCoefficients A
      (D.frobeniusFixedField (K.toResidueLevel D)
        E.field E.below
        (D.chosenDegreeOneFrobeniusLiftOfFiniteTotallyRamified
          (K.toResidueLevel D)
          E.toGaloisExtension
          hTot
          E.galoisGenerator)))
    (piL : fixedCoefficients A E.field) :
    let L := E.toLevelExtension.field
    let KR := K.toResidueLevel D
    letI : Finite
        ((baseField G).toSubgroup ⧸
          extensionSubgroup (baseField G) KR.field
            (le_baseField KR.field)) := by
      change Finite
        ((baseField G).toSubgroup ⧸
          extensionSubgroup (baseField G) K.field
            (le_baseField K.field))
      exact K.finite
    let LG := E.toGaloisExtension
    letI : Finite
        (KR.field.toSubgroup ⧸
          extensionSubgroup KR.field LG.field LG.below) :=
      LG.finite
    let q := E.galoisGenerator
    let hLGTot := hTot
    let σ := D.chosenDegreeOneFrobeniusLiftOfFiniteTotallyRamified
      KR LG hLGTot q
    let Sigma := D.frobeniusFixedField KR LG.field LG.below σ
    let hSigmaK := D.frobeniusFixedField_le KR LG.field LG.below σ
    letI : Finite
        (K.field.toSubgroup ⧸ extensionSubgroup K.field Sigma hSigmaK) :=
      D.frobeniusFixedField_finite KR LG.field LG.below σ
    ∀ (w : v.unitAddSubgroup L)
      (_hpiL : v.IsPrimeElement L piL)
      (_hnorm :
        relativeNorm A K.field E.field E.below (k • piL + w.1) =
          relativeNorm A K.field Sigma hSigmaK (k • piSigma)),
    let M := D.totallyRamifiedFiniteGaloisExtension
      KR LG hLGTot q
    letI : Finite
        (KR.field.toSubgroup ⧸
          extensionSubgroup KR.field M.field M.below) :=
      M.finite
    letI : Finite ((baseField G).toSubgroup ⧸
        extensionSubgroup (baseField G) M.field
          (le_baseField M.field)) :=
      GaloisExtension.finite_extension_trans M.below (le_baseField K.field)
    let MF : FiniteLevel G := ⟨M.field, inferInstance⟩
    let S := M.inertiaImage D
    let M₀ := M.maximalUnramifiedSubextension D
    let hMM₀ : M.field.toSubgroup ≤ M₀.toSubgroup :=
      M.field_le_intermediateField S
    ∃ x : fixedCoefficients A M₀,
      ((v.valuationAt MF
        (fixedFieldInclusion A M₀ M.field hMM₀ x) :
          v.valueGroup) : ZHat) =
        Int.castRingHom ZHat (k : ℤ) := by
  dsimp only
  let L := E.toLevelExtension.field
  let KR := K.toResidueLevel D
  let LG := E.toGaloisExtension
  let hLGfinite : Finite
      (KR.field.toSubgroup ⧸
        extensionSubgroup KR.field LG.field LG.below) :=
    LG.finite
  let hLGfiniteOverK : Finite
      (K.field.toSubgroup ⧸
        extensionSubgroup K.field LG.field LG.below) := by
    have h := hLGfinite
    change Finite
      (K.field.toSubgroup ⧸
        extensionSubgroup K.field LG.field LG.below) at h
    exact h
  let q := E.galoisGenerator
  let hq := E.galoisGenerator_generates
  let hLGTot := hTot
  let hKRabsolute : Finite ((baseField G).toSubgroup ⧸
      extensionSubgroup (baseField G) KR.field (le_baseField KR.field)) := by
    change Finite
      ((baseField G).toSubgroup ⧸
        extensionSubgroup (baseField G) K.field
          (le_baseField K.field))
    exact K.finite
  let σ := D.chosenDegreeOneFrobeniusLiftOfFiniteTotallyRamified
    KR LG hLGTot q
  let Sigma := D.frobeniusFixedField KR LG.field LG.below σ
  let hSigmaK := D.frobeniusFixedField_le KR LG.field LG.below σ
  let hSigmaFinite : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field Sigma hSigmaK) :=
    D.frobeniusFixedField_finite KR LG.field LG.below σ
  intro w hpiL hnorm
  let M := D.totallyRamifiedFiniteGaloisExtension
    KR LG hLGTot q
  let hMfinite : Finite
      (KR.field.toSubgroup ⧸
        extensionSubgroup KR.field M.field M.below) :=
    M.finite
  let hMabsolute : Finite ((baseField G).toSubgroup ⧸
      extensionSubgroup (baseField G) M.field (le_baseField M.field)) :=
    GaloisExtension.finite_extension_trans M.below (le_baseField K.field)
  let MF : FiniteLevel G := ⟨M.field, hMabsolute⟩
  let S := M.inertiaImage D
  let M₀ := M.maximalUnramifiedSubextension D
  let hML := D.totallyRamifiedFiniteGaloisExtension_le_L
    KR LG hLGTot q
  let hMSigma :=
    D.totallyRamifiedFiniteGaloisExtension_le_sigma
      KR LG hLGTot q
  let hMM₀ : M.field.toSubgroup ≤ M₀.toSubgroup :=
    M.field_le_intermediateField S
  let hM₀K : M₀.toSubgroup ≤ K.field.toSubgroup :=
    M.intermediateField_le_base S
  let N := M.lowerFiniteGalois S
  let hMnormal : (extensionSubgroup K.field M.field M.below).Normal := M.normal
  let hNnormal : (extensionSubgroup M₀ M.field hMM₀).Normal := N.normal
  let hNfinite : Finite
      (M₀.toSubgroup ⧸ extensionSubgroup M₀ M.field hMM₀) :=
    N.finite
  let hMLfinite : Finite
      (E.field.toSubgroup ⧸ extensionSubgroup E.field M.field hML) :=
    GaloisExtension.finite_extension_over_intermediate
      M.below E.below hML
  let hM₀finite : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field M₀ hM₀K) :=
    M.intermediateField_finite S
  let hM₀absolute : Finite ((baseField G).toSubgroup ⧸
      extensionSubgroup (baseField G) M₀ (le_baseField M₀)) :=
    GaloisExtension.finite_extension_trans hM₀K (le_baseField K.field)
  let M₀F : FiniteLevel G := ⟨M₀, hM₀absolute⟩
  let EN : LevelExtension G :=
    { field := MF
      base := M₀F
      below := hMM₀
      finiteQuotient := hNfinite }
  let EM : LevelExtension G :=
    { field := MF
      base := K
      below := M.below
      finiteQuotient := M.finite }
  let EML : LevelExtension G :=
    { field := MF
      base := L
      below := hML
      finiteQuotient := hMLfinite }
  have hUnramifiedML :
      EML.IsUnramified D := by
    change EML.toFiniteAbstractExtension.IsUnramified D
    rw [EML.toFiniteAbstractExtension.isUnramified_iff_inertia_le D]
    intro x hx
    apply D.maximalUnramifiedField_le_totallyRamifiedFiniteGaloisExtension
      KR LG hLGTot q
    exact hx
  let piSigmaM : fixedCoefficients A M.field :=
    fixedFieldInclusion A Sigma M.field hMSigma piSigma
  let piLM : fixedCoefficients A M.field :=
    fixedFieldInclusion A E.field M.field hML piL
  let wUnitM : v.unitAddSubgroup MF :=
    v.unitInclusion EML hUnramifiedML w
  let wM : fixedCoefficients A M.field := wUnitM.1
  have hpiLM : v.IsPrimeElement MF piLM := by
    exact v.prime_of_unramified EML hUnramifiedML piL hpiL
  let cM : fixedCoefficients A M.field := k • piSigmaM
  let bM : fixedCoefficients A M.field := k • piLM + wM
  let uM : fixedCoefficients A M.field := cM - k • piLM
  have hbM :
      bM = fixedFieldInclusion A E.field M.field hML (k • piL + w.1) := by
    apply Subtype.ext
    rfl
  have hcM :
      cM = fixedFieldInclusion A Sigma M.field hMSigma (k • piSigma) := by
    apply Subtype.ext
    rfl
  have hNormL :
      relativeNorm A M₀ M.field hMM₀
          (fixedFieldInclusion A E.field M.field hML (k • piL + w.1)) =
        fixedFieldInclusion A K.field M₀ hM₀K
          (relativeNorm A K.field E.field E.below (k • piL + w.1)) := by
    have h :=
      D.reciprocity_totallyRamified_relativeNorm_L
        A KR LG hLGTot q (k • piL + w.1)
    change
      relativeNorm A M₀ M.field hMM₀
          (fixedFieldInclusion A E.field M.field hML (k • piL + w.1)) =
        fixedFieldInclusion A K.field M₀ hM₀K
          (relativeNorm A K.field E.field E.below (k • piL + w.1)) at h
    exact h
  have hNormSigma :
      relativeNorm A M₀ M.field hMM₀
          (fixedFieldInclusion A Sigma M.field hMSigma (k • piSigma)) =
        fixedFieldInclusion A K.field M₀ hM₀K
          (relativeNorm A K.field Sigma hSigmaK (k • piSigma)) := by
    have h :=
      D.reciprocity_totallyRamified_relativeNorm_sigma
        A KR LG hLGTot q (k • piSigma)
    change
      relativeNorm A M₀ M.field hMM₀
          (fixedFieldInclusion A Sigma M.field hMSigma (k • piSigma)) =
        fixedFieldInclusion A K.field M₀ hM₀K
          (relativeNorm A K.field Sigma hSigmaK (k • piSigma)) at h
    exact h
  have hNormBC : relativeNorm A M₀ M.field hMM₀ bM =
      relativeNorm A M₀ M.field hMM₀ cM := by
    calc
      relativeNorm A M₀ M.field hMM₀ bM =
          relativeNorm A M₀ M.field hMM₀
            (fixedFieldInclusion A E.field M.field hML
              (k • piL + w.1)) := congrArg _ hbM
      _ =
          fixedFieldInclusion A K.field M₀ hM₀K
            (relativeNorm A K.field E.field E.below (k • piL + w.1)) :=
        hNormL
      _ = fixedFieldInclusion A K.field M₀ hM₀K
          (relativeNorm A K.field Sigma hSigmaK (k • piSigma)) := by
        exact congrArg
          (fixedFieldInclusion A K.field M₀ hM₀K) hnorm
      _ = relativeNorm A M₀ M.field hMM₀
          (fixedFieldInclusion A Sigma M.field hMSigma (k • piSigma)) :=
        hNormSigma.symm
      _ = relativeNorm A M₀ M.field hMM₀ cM :=
        congrArg _ hcM.symm
  have hnormWU : relativeNorm A M₀ M.field hMM₀ wM =
      relativeNorm A M₀ M.field hMM₀ uM := by
    dsimp only [bM, cM, uM] at hNormBC ⊢
    rw [map_add, map_nsmul, map_nsmul] at hNormBC
    rw [map_sub, map_nsmul, map_nsmul]
    exact eq_sub_of_add_eq' hNormBC
  let g := D.totallyRamifiedLowerGenerator
    KR LG hLGTot q
  have hg : ∀ x, x ∈ Subgroup.zpowers g :=
    D.totallyRamifiedLowerGenerator_generates
      KR LG hLGTot q hq
  let hNFintype : Fintype N.extensionQuotient := Fintype.ofFinite _
  let hNCyclic : IsCyclic N.extensionQuotient := by
    rw [isCyclic_iff_exists_zpowers_eq_top]
    refine ⟨g, ?_⟩
    ext x
    constructor
    · intro _
      exact Subgroup.mem_top x
    · intro _
      exact hg x
  let hNcomm : CommGroup N.extensionQuotient := IsCyclic.commGroup
  obtain ⟨aN, haN⟩ :=
    reciprocity_exists_hMinusOne_primitive hcf
      EN N.normal g hg uM wM hnormWU
  let B := extensionFixedRepresentation A K.field M.field M.below M.normal
  let B₀ := extensionFixedRepresentation A M₀ M.field hMM₀ N.normal
  let eB := extensionFixedRepresentationEquiv A K.field M.field M.below M.normal
  let eB₀ := extensionFixedRepresentationEquiv A M₀ M.field hMM₀ N.normal
  let gB := M.extensionQuotientMulEquiv (M.lowerInclusionHom S g)
  let tB := M.extensionQuotientMulEquiv
    (D.totallyRamifiedFrobeniusInM
      KR LG hLGTot q)
  let aB : B.V := eB.symm (eB₀ aN)
  let bB : B.V := eB.symm bM
  let cB : B.V := eB.symm cM
  have haNLocal :
      B₀.ρ g aN - aN = eB₀.symm (wM - uM) := by
    have h := haN
    change B₀.ρ g aN - aN = eB₀.symm (wM - uM) at h
    exact h
  have hActionPrimitive : eB (B.ρ gB aB) = eB₀ (B₀.ρ g aN) := by
    apply Subtype.ext
    calc
      (eB (B.ρ gB aB)).1 =
          relativeCosetAction A K.field M.field M.below (eB aB) gB :=
        extensionFixedRepresentation_action_coe
          A K.field M.field M.below M.normal gB aB
      _ = relativeCosetAction A M₀ M.field hMM₀ (eB₀ aN) g := by
        exact (M.relativeCosetAction_lowerInclusionHom A S (eB₀ aN) g).symm
      _ = (eB₀ (B₀.ρ g aN)).1 := by
        exact (extensionFixedRepresentation_action_coe
          A M₀ M.field hMM₀ N.normal g aN).symm
  have hprimitiveB : B.ρ gB aB - aB = eB.symm (wM - uM) := by
    apply eB.injective
    calc
      eB (B.ρ gB aB - aB) =
          eB₀ (B₀.ρ g aN) - eB₀ aN := by
        rw [map_sub, hActionPrimitive]
        simp [aB]
      _ = eB₀ (B₀.ρ g aN - aN) := by
        rw [map_sub]
      _ = eB₀ (eB₀.symm (wM - uM)) :=
        congrArg eB₀ haNLocal
      _ = wM - uM := eB₀.apply_symm_apply _
      _ = eB (eB.symm (wM - uM)) :=
        (eB.apply_symm_apply _).symm
  have hbc : bB - cB = B.ρ gB aB - aB := by
    rw [hprimitiveB]
    apply eB.injective
    dsimp only [bB, cB]
    simp only [map_sub, AddEquiv.apply_symm_apply]
    dsimp only [bM, cM, uM]
    abel
  have htc : B.ρ tB cB = cB := by
    apply eB.injective
    apply Subtype.ext
    calc
      (eB (B.ρ tB cB)).1 =
          relativeCosetAction A K.field M.field M.below cM tB :=
        extensionFixedRepresentation_action_coe
          A K.field M.field M.below M.normal tB cB
      _ = cM.1 := by
        dsimp only [cM]
        have hActionNsmul :
            relativeCosetAction A K.field M.field M.below
                (k • piSigmaM) tB =
              k • relativeCosetAction A K.field M.field M.below
                piSigmaM tB := by
          refine Quotient.inductionOn' tB ?_
          intro t
          simp only [relativeCosetAction_mk]
          exact map_nsmul (A.ρ t.1) k piSigmaM.1
        rw [hActionNsmul]
        congr 1
        have h :=
          D.totallyRamified_frobenius_fixes_sigma
            A KR LG hLGTot q piSigma
        change
          relativeCosetAction A K.field M.field M.below
              (fixedFieldInclusion A Sigma M.field hMSigma piSigma) tB =
            (fixedFieldInclusion A Sigma M.field hMSigma piSigma).1 at h
        simpa [piSigmaM] using h
      _ = (eB cB).1 := rfl
  have hgb : B.ρ gB bB = B.ρ tB bB := by
    apply eB.injective
    apply Subtype.ext
    calc
      (eB (B.ρ gB bB)).1 =
          relativeCosetAction A K.field M.field M.below bM gB :=
        extensionFixedRepresentation_action_coe
          A K.field M.field M.below M.normal gB bB
      _ = relativeCosetAction A K.field M.field M.below bM tB := by
        have h :=
          D.totallyRamified_actions_agree_on_L
            A KR LG hLGTot q (k • piL + w.1)
        change
          relativeCosetAction A K.field M.field M.below
              (fixedFieldInclusion A E.field M.field hML (k • piL + w.1)) gB =
            relativeCosetAction A K.field M.field M.below
              (fixedFieldInclusion A E.field M.field hML (k • piL + w.1)) tB at h
        rw [hbM]
        exact h
      _ = (eB (B.ρ tB bB)).1 := by
        exact (extensionFixedRepresentation_action_coe
          A K.field M.field M.below M.normal tB bB).symm
  have hcomm : Commute gB tB :=
    (D.totallyRamified_generator_commutes_frobenius
      KR LG hLGTot q).map M.extensionQuotientMulEquiv.toMonoidHom
  let xB : B.V := bB + aB - B.ρ tB aB
  have hxB : B.ρ gB xB = xB :=
    reciprocity_fixedCombination_of_commute
      B gB tB hcomm cB bB aB htc hgb hbc
  let xB₀ : B₀.V := eB₀.symm (eB xB)
  have hActionX : eB₀ (B₀.ρ g xB₀) = eB (B.ρ gB xB) := by
    apply Subtype.ext
    calc
      (eB₀ (B₀.ρ g xB₀)).1 =
          relativeCosetAction A M₀ M.field hMM₀ (eB₀ xB₀) g :=
        extensionFixedRepresentation_action_coe
          A M₀ M.field hMM₀ N.normal g xB₀
      _ = relativeCosetAction A K.field M.field M.below (eB xB) gB :=
        M.relativeCosetAction_lowerInclusionHom A S (eB xB) g
      _ = (eB (B.ρ gB xB)).1 := by
        exact (extensionFixedRepresentation_action_coe
          A K.field M.field M.below M.normal gB xB).symm
  have hxB₀ : B₀.ρ g xB₀ = xB₀ := by
    apply eB₀.injective
    rw [hActionX, hxB]
    rfl
  let T := Rep.FiniteCyclicGroup.normHomCompSub B₀ g
  let xCycle : T.moduleCatLeftHomologyData.K := ⟨xB₀, by
    change B₀.ρ g xB₀ - xB₀ = 0
    exact sub_eq_zero.mpr hxB₀⟩
  let x : fixedCoefficients A M₀ :=
    (cyclicFixedCycleEquiv A M₀ M.field hMM₀
      N.normal N.finite g hg).symm xCycle
  refine ⟨x, ?_⟩
  have hxFormula : fixedFieldInclusion A M₀ M.field hMM₀ x = eB xB := by
    apply Subtype.ext
    rfl
  have hActionVal :=
    v.valuationAt_extensionFixedRepresentation_action
      EM M.normal tB aB
  have hval : v.valuationAt MF
      (fixedFieldInclusion A M₀ M.field hMM₀ x) =
      k • v.oneValue := by
    rw [hxFormula]
    have hxBFormula : eB xB = bM + eB aB - eB (B.ρ tB aB) := by
      apply Subtype.ext
      rfl
    rw [hxBFormula]
    dsimp only [bM]
    rw [map_sub, map_add, map_add, map_nsmul, hpiLM,
      wUnitM.2, hActionVal]
    abel
  calc
    ((v.valuationAt MF
        (fixedFieldInclusion A M₀ M.field hMM₀ x) :
          v.valueGroup) : ZHat) =
        ((k • v.oneValue : v.valueGroup) : ZHat) :=
      congrArg Subtype.val hval
    _ = k • (1 : ZHat) := rfl
    _ = Int.castRingHom ZHat (k : ℤ) := by
      simp
end ValuationData
end ClassFormation
end

/- Conclusion -/
section
noncomputable section
namespace ClassFormation
open KummerTheory
open CyclicCohomology
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
namespace ValuationData
variable {D : DegreeData G} {A : Rep ℤ G}
 
theorem reciprocity_cyclicTotallyRamified_exponent_eq_zero
    (v : ValuationData D A) (hcf : SatisfiesClassFieldAxiom A)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    [TotallyDisconnectedSpace G]
    (K : FiniteLevel G)
    (E : CyclicExtension K)
    (hTot : E.IsTotallyRamified D)
    (k : ℕ)
    (hk : k < (E.toFiniteAbstractExtension.degree : ℕ))
    (piSigma : fixedCoefficients A
      (D.frobeniusFixedField (K.toResidueLevel D)
        E.field E.below
        (D.chosenDegreeOneFrobeniusLiftOfFiniteTotallyRamified
          (K.toResidueLevel D)
          E.toGaloisExtension
          hTot
          E.galoisGenerator)))
    (piL : fixedCoefficients A E.field) :
    let L := E.toLevelExtension.field
    let KR := K.toResidueLevel D
    letI : Finite
        ((baseField G).toSubgroup ⧸
          extensionSubgroup (baseField G) KR.field
            (le_baseField KR.field)) := by
      change Finite
        ((baseField G).toSubgroup ⧸
          extensionSubgroup (baseField G) K.field
            (le_baseField K.field))
      exact K.finite
    let LG := E.toGaloisExtension
    letI : Finite
        (KR.field.toSubgroup ⧸
          extensionSubgroup KR.field LG.field LG.below) :=
      LG.finite
    let q := E.galoisGenerator
    let hLGTot := hTot
    let σ := D.chosenDegreeOneFrobeniusLiftOfFiniteTotallyRamified
      KR LG hLGTot q
    let Sigma := D.frobeniusFixedField KR LG.field LG.below σ
    let hSigmaK := D.frobeniusFixedField_le KR LG.field LG.below σ
    letI : Finite
        (K.field.toSubgroup ⧸ extensionSubgroup K.field Sigma hSigmaK) :=
      D.frobeniusFixedField_finite KR LG.field LG.below σ
    ∀ (w : v.unitAddSubgroup L)
      (_hpiL : v.IsPrimeElement L piL)
      (_hnorm :
        relativeNorm A K.field E.field E.below (k • piL + w.1) =
          relativeNorm A K.field Sigma hSigmaK (k • piSigma)),
      k = 0 := by
  dsimp only
  let L := E.toLevelExtension.field
  let KR := K.toResidueLevel D
  let LG := E.toGaloisExtension
  let hLGfinite : Finite
      (KR.field.toSubgroup ⧸
        extensionSubgroup KR.field LG.field LG.below) :=
    LG.finite
  let hLGfiniteOverK : Finite
      (K.field.toSubgroup ⧸
        extensionSubgroup K.field LG.field LG.below) := by
    have h := hLGfinite
    change Finite
      (K.field.toSubgroup ⧸
        extensionSubgroup K.field LG.field LG.below) at h
    exact h
  let q := E.galoisGenerator
  let hLGTot := hTot
  let hKRabsolute : Finite ((baseField G).toSubgroup ⧸
      extensionSubgroup (baseField G) KR.field (le_baseField KR.field)) := by
    change Finite ((baseField G).toSubgroup ⧸
      extensionSubgroup (baseField G) K.field (le_baseField K.field))
    exact K.finite
  let σ := D.chosenDegreeOneFrobeniusLiftOfFiniteTotallyRamified
    KR LG hLGTot q
  let Sigma := D.frobeniusFixedField KR LG.field LG.below σ
  let hSigmaK := D.frobeniusFixedField_le KR LG.field LG.below σ
  let hSigmaFinite : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field Sigma hSigmaK) :=
    D.frobeniusFixedField_finite KR LG.field LG.below σ
  intro w hpiL hnorm
  let M := D.totallyRamifiedFiniteGaloisExtension
    KR LG hLGTot q
  let hMfinite : Finite
      (KR.field.toSubgroup ⧸
        extensionSubgroup KR.field M.field M.below) :=
    M.finite
  let S := M.inertiaImage D
  let M₀ := M.maximalUnramifiedSubextension D
  let hMM₀ : M.field.toSubgroup ≤ M₀.toSubgroup :=
    M.field_le_intermediateField S
  let hM₀K : M₀.toSubgroup ≤ K.field.toSubgroup :=
    M.intermediateField_le_base S
  let N := M.lowerFiniteGalois S
  let hNnormal : (extensionSubgroup M₀ M.field hMM₀).Normal := N.normal
  let hNfinite : Finite
      (M₀.toSubgroup ⧸ extensionSubgroup M₀ M.field hMM₀) :=
    N.finite
  let hM₀finite : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field M₀ hM₀K) :=
    M.intermediateField_finite S
  let hM₀absolute : Finite ((baseField G).toSubgroup ⧸
      extensionSubgroup (baseField G) M₀ (le_baseField M₀)) :=
    GaloisExtension.finite_extension_trans hM₀K (le_baseField K.field)
  let hMabsolute : Finite ((baseField G).toSubgroup ⧸
      extensionSubgroup (baseField G) M.field (le_baseField M.field)) :=
    GaloisExtension.finite_extension_trans M.below (le_baseField K.field)
  let MF : FiniteLevel G := ⟨M.field, hMabsolute⟩
  let M₀F : FiniteLevel G := ⟨M₀, hM₀absolute⟩
  let EN : LevelExtension G :=
    { field := MF
      base := M₀F
      below := hMM₀
      finiteQuotient := hNfinite }
  obtain ⟨x, hx⟩ :=
    v.reciprocity_cyclicTotallyRamified_fixedSource hcf
      K E hTot k piSigma piL w hpiL hnorm
  have hkLower : k < (N.toFiniteAbstractExtension.degree : ℕ) := by
    rw [D.totallyRamifiedLowerDegree_eq
      KR LG hLGTot q]
    exact hk
  exact reciprocity_totallyRamified_valuation_forces_exponent_zero
    v EN (by
      simpa [EN, LevelExtension.IsTotallyRamified,
        LevelExtension.toFiniteAbstractExtension] using
          M.maximalUnramifiedSubextension_isTotallyRamified D)
      k hkLower x hx
end ValuationData
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
    [Finite (U H ⧸ M H J)] (a : fixedCoefficients A H) :
    N A H J a.val ↔ a ∈ (relativeNorm A H J h).range := by
  letI : Fintype (U H ⧸ M H J) := Fintype.ofFinite _
  have sum (b : fixedCoefficients A J) :
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
theorem finite_index (H : FiniteLevel G) : (U H.field).FiniteIndex := by
  letI := H.finite
  constructor
  rw [← Subgroup.relIndex_top_right]
  exact Subgroup.index_ne_zero_of_finite (H := extensionSubgroup (baseField G) H.field (le_baseField _))
def finiteField (H : ClosedSubgroup G) [(U H).FiniteIndex] : FiniteLevel G :=
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
    let E : CyclicExtension K := ⟨J,h,hnormal,@Finite.of_fintype _ htype,g,hg⟩
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
theorem index_degree (D : DegreeData G) (H : FiniteLevel G) :
    ((U H.field).map D.degree.toMonoidHom).index = (H.residueDegree D : ℕ) := by
  rw [← D.fieldImage_eq_map]
  exact D.fieldImageAdd_index (H.toResidueLevel D)
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
    (v : fixedCoefficients A (baseField G) →+ ZHat)
    (H : FiniteLevel G) :
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
theorem fixed (D : DegreeData G) (K : FiniteLevel G) (J : ClosedSubgroup G) (h : J ≤ K.field)
    [(M K.field J).Normal] (t : U K.field)
    (σ : D.FrobeniusElements (K.toResidueLevel D) J h)
    (ht : σ.val = QuotientGroup.mk t) :
    shape K.field (inertia (coordinate D) K.field J) t = (D.frobeniusFixedField (K.toResidueLevel D) J h σ).toSubgroup := by
  have shape_eq (I L : Subgroup (U K.field)) [I.Normal] [L.Normal] (hIL : I = L) :
      shape K.field I t = shape K.field L t := by subst L; rfl
  rw [shape_eq _ _ (inertia_eq D K.field J h)]
  change (((Subgroup.zpowers (QuotientGroup.mk' _ t)).topologicalClosure.comap _).map _) =
    (((Subgroup.closure (Set.range (fun _ : Unit => σ.val))).topologicalClosure.comap _).map _)
  rw [Set.range_const,← Subgroup.zpowers_eq_closure,ht]
  rfl
theorem degree_iff (D : DegreeData G) (K : FiniteLevel G) (t : U K.field) (n : ℕ) :
    ((coordinate D t.val).toAdd = ((U K.field).map (coordinate D)).index • (n : TunnellProfiniteCoordinate.Z)) ↔
      (D.normalizedDegree (K.toResidueLevel D) t).toAdd = (n : ZHat) := by
  let i := TunnellProfiniteCoordinate.equiv
  let KR := K.toResidueLevel D
  have norm := D.residueDegree_nsmul_normalizedDegree KR t
  have cn : i (n : ZHat) = (n : TunnellProfiniteCoordinate.Z) := by
    simpa using int_coord (n : ℤ)
  change i (D.degree t.val).toAdd = ((U K.field).map (coordinate D)).index • _ ↔ _
  rw [index_coord,index_degree,← cn,← map_nsmul,i.injective.eq_iff]
  rw [← norm]
  exact (zHatMulNat_injective KR.residueDegree.property).eq_iff
theorem prime_iff (D : DegreeData G) (A : Rep ℤ G) (V : ValuationData D A)
    (K : FiniteLevel G) (b : fixedCoefficients A K.field) :
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

/- TunnellFrobeniusQuotient -/
section
namespace TunnellFrobeniusEvaluation
open ClassFormation KummerTheory TunnellAbstractNormCoordinates
open scoped Classical
noncomputable section
variable {G : Type} [Group G] [TopologicalSpace G]
def codomain (A : Rep ℤ G) (K : FiniteLevel G) (E : GaloisExtension K.field)
    (W : AddSubgroup (fixedCoefficients A K.field)) (hW : ∀ x, x ∈ W ↔ N A K.field E.field x.val) :
    letI := E.finite
    FiniteNormQuotient A K.field E.field E.below ≃+ fixedCoefficients A K.field ⧸ W := by
  letI := E.finite
  have hw : finiteNormSubgroup A K.field E.field E.below = W := AddSubgroup.ext fun x =>
    ((native_norm A K.field E.field E.below x).symm.trans (hW x).symm)
  let nW : W.Normal := by
    constructor
    intro n hn z
    rw [add_comm z n,add_assoc,add_neg_cancel,add_zero]
    exact hn
  exact (finiteNormQuotientConcreteEquiv A K.field E.field E.below).trans
    (@QuotientAddGroup.quotientAddEquivOfEq (fixedCoefficients A K.field) _ _ W _ nW hw)
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
    (K : FiniteLevel G) (E : GaloisExtension K.field)
local instance : (extensionSubgroup K.field E.field E.below).Normal := E.normal
local instance : Finite (K.field.toSubgroup ⧸ extensionSubgroup K.field E.field E.below) := E.finite
def PrimeFormula (W : AddSubgroup (B A K.field))
    (r : Additive E.extensionQuotient →+ B A K.field ⧸ W) : Prop :=
  ∀ σ : D.FrobeniusElements (K.toResidueLevel D) E.field E.below,
    let F := D.frobeniusFixedField (K.toResidueLevel D) E.field E.below σ
    let F' : FiniteLevel G := ⟨F,D.frobeniusFixedField_absoluteFinite K E.field E.below σ⟩
    letI : Finite (U K.field ⧸ M K.field F) := D.frobeniusFixedField_finite (K.toResidueLevel D) E.field E.below σ
    ∀ b : B A F, V.IsPrimeElement F' b →
      r (Additive.ofMul (D.frobeniusRestriction (K.toResidueLevel D) E.field E.below σ)) =
      QuotientAddGroup.mk (relativeNorm A K.field F (D.frobeniusFixedField_le (K.toResidueLevel D) E.field E.below σ) b)
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
    let σ : D.FrobeniusElements (K.toResidueLevel D) E.field E.below := ⟨QuotientGroup.mk t,
      n,n.property,by
        apply Multiplicative.toAdd.injective
        change (D.normalizedDegree (K.toResidueLevel D) t).toAdd = _
        simpa using (degree_iff D K t n).mp deg⟩
    have fi : F = D.frobeniusFixedField (K.toResidueLevel D) E.field E.below σ :=
      ClosedSubgroup.toSubgroup_injective (shp.trans (fixed D K E.field E.below t σ rfl))
    subst F
    let S := D.frobeniusFixedField (K.toResidueLevel D) E.field E.below σ
    let S' : FiniteLevel G := ⟨S,D.frobeniusFixedField_absoluteFinite K E.field E.below σ⟩
    letI : Finite (U (baseField G) ⧸ M (baseField G) S) := S'.finite
    letI : Finite (U K.field ⧸ M K.field S) := D.frobeniusFixedField_finite (K.toResidueLevel D) E.field E.below σ
    have a0 : normToBase A S b = a := Subtype.ext ((tr_eq A _ S (le_baseField S) b).symm.trans ha)
    have b0 : V.IsPrimeElement S' b := (prime_iff D A V S' b).mp ((congrArg (fun y => TunnellProfiniteCoordinate.equiv (V.toAddMonoidHom y)) a0).trans hb)
    exact (h σ b b0).trans (congrArg QuotientAddGroup.mk (Subtype.ext
      ((tr_eq A K.field S (D.frobeniusFixedField_le (K.toResidueLevel D) E.field E.below σ) b).symm.trans hx)))
  · intro h σ
    dsimp only
    intro b hb
    let S := D.frobeniusFixedField (K.toResidueLevel D) E.field E.below σ
    let S' : FiniteLevel G := ⟨S,D.frobeniusFixedField_absoluteFinite K E.field E.below σ⟩
    letI : Finite (U (baseField G) ⧸ M (baseField G) S) := S'.finite
    letI : Finite (U K.field ⧸ M K.field S) := D.frobeniusFixedField_finite (K.toResidueLevel D) E.field E.below σ
    let t := σ.val.out
    have ht : σ.val = QuotientGroup.mk t := (Quotient.out_eq' σ.val).symm
    obtain ⟨n,hn,hdegree⟩ := σ.property
    have nn : (D.normalizedDegree (K.toResidueLevel D) t).toAdd = (n : ZHat) := by
      have hz := congrArg (D.extensionNormalizedDegree (K.toResidueLevel D) E.field E.below) ht
      rw [hdegree, D.extensionNormalizedDegree_mk] at hz
      simpa using congrArg Multiplicative.toAdd hz.symm
    let hSK := D.frobeniusFixedField_le (K.toResidueLevel D) E.field E.below σ
    have eq := h t ⟨n,hn⟩ S b (normToBase A S b) (relativeNorm A K.field S hSK b)
      ((degree_iff D K t n).mpr nn) (fixed D K E.field E.below t σ ht).symm (tr_eq A _ S (le_baseField S) b)
      ((prime_iff D A V S' b).mpr hb) (tr_eq A K.field S hSK b)
    have cq : D.frobeniusRestriction (K.toResidueLevel D) E.field E.below σ = QuotientGroup.mk t :=
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
    (K : FiniteLevel G) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    [hLfinite : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK)] :
    Additive (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK) →+
      FiniteNormQuotient A K.field L hLK
  prime
    (K : FiniteLevel G) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    [hLfinite : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK)]
    (q : Additive
      (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK))
    (σ : D.FrobeniusElements (K.toResidueLevel D) L hLK)
    (hσ : D.frobeniusRestriction
      (K.toResidueLevel D) L hLK σ = q.toMul)
    (π : fixedCoefficients A
      (D.frobeniusFixedField (K.toResidueLevel D) L hLK σ))
    (hπ :
      let Sigma : FiniteLevel G :=
        { field := D.frobeniusFixedField
            (K.toResidueLevel D) L hLK σ
          finite := D.frobeniusFixedField_absoluteFinite K L hLK σ }
      v.IsPrimeElement Sigma π) :
    let KR := K.toResidueLevel D
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
    (K : FiniteLevel G) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    [hLfinite : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK)] :
    Additive (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK) →+
      FiniteNormQuotient A K.field L hLK := n.raw K L hLK
theorem finiteReciprocityHom_apply_eq_primeNormClassGivenFamily
    (D : DegreeData G) (A : Rep ℤ G) (v : ValuationData D A) [n : Family D A v]
    (K : FiniteLevel G) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    [hLfinite : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK)]
    (q : Additive
      (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK))
    (σ : D.FrobeniusElements (K.toResidueLevel D) L hLK)
    (hσ : D.frobeniusRestriction
      (K.toResidueLevel D) L hLK σ = q.toMul)
    (π : fixedCoefficients A
      (D.frobeniusFixedField (K.toResidueLevel D) L hLK σ))
    (hπ :
      let Sigma : FiniteLevel G :=
        { field := D.frobeniusFixedField
            (K.toResidueLevel D) L hLK σ
          finite := D.frobeniusFixedField_absoluteFinite K L hLK σ }
      v.IsPrimeElement Sigma π) :
    let KR := K.toResidueLevel D
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
instance idx (p : P G) : (U (H p)).FiniteIndex := p.property.1
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
def point (K : FiniteLevel G) (E : GaloisExtension K.field) : P G :=
  ⟨(K.field,E.field),TunnellAbstractNormCoordinates.finite_index K,E.below,E.normal,E.finite⟩
def quotient (K : FiniteLevel G) (E : GaloisExtension K.field) :
    letI := E.finite
    FiniteNormQuotient A K.field E.field E.below ≃+
      B A (H (point K E)) ⧸ W A (point K E) :=
  let p := point K E
  TunnellFrobeniusEvaluation.codomain A K E (W A p) (mem A p)
def family : TunnellFrobeniusInput.Family D A V where
  raw K J h normal fin :=
    let E : GaloisExtension K.field := ⟨J,h,normal,fin⟩
    (quotient A K E).symm.toAddMonoidHom.comp (r (point K E))
  prime K J h normal fin q σ hσ π prime := by
    let E : GaloisExtension K.field := ⟨J,h,normal,fin⟩
    let p := point K E
    have data := (normalize D A V K E (W A p) (r p)).mpr (hn p)
    apply (quotient A K E).injective
    change quotient A K E ((quotient A K E).symm (r p q)) = _
    rw [(quotient A K E).apply_symm_apply]
    have eq : Additive.ofMul (D.frobeniusRestriction (K.toResidueLevel D) J h σ) = q :=
      congrArg Additive.ofMul hσ
    rw [← eq]
    exact data σ π prime
end
end TunnellFrobeniusFamilyBridge
end

/- TunnellNormalizedStep1 -/
section
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
end DegreeData
end chosenFrobeniusLifts
section finiteReciprocityHomGivenFamily
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
namespace DegreeData
end DegreeData
end finiteReciprocityHomGivenFamily
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
theorem unramifiedReciprocity_frobenius_imageGivenFamily
    (v : ValuationData D A) (hAxiom : SatisfiesUnramifiedUnitCohomology D v)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    [TotallyDisconnectedSpace G] [TunnellFrobeniusInput.Family D A v]
    (K : FiniteLevel G) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
    [hnormal : (extensionSubgroup K.field L hLK).Normal]
    [Finite (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK)]
    (hUnramified :
      (DegreeData.AbstractExtension.mk L K.field hLK).IsUnramified D) :
    D.finiteReciprocityHomGivenFamily A v K L hLK
        (Additive.ofMul (D.unramifiedFrobenius
          (K.toResidueLevel D) L hLK)) =
      finiteNormClass A K.field L hLK (v.chosenPrimeElement K) := by
  let KR := K.toResidueLevel D
  let hLnormalKR : (extensionSubgroup KR.field L hLK).Normal := by
    simpa only [KR, FiniteLevel.toResidueLevel] using hnormal
  let σ := D.chosenUnramifiedFrobeniusLift KR L hLK
  let S := D.frobeniusFixedField KR L hLK σ
  let hSK := D.frobeniusFixedField_le KR L hLK σ
  let hSfinite : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field S hSK) :=
    D.frobeniusFixedField_finite KR L hLK σ
  let hSabsolute : Finite ((baseField G).toSubgroup ⧸
      extensionSubgroup (baseField G) S (le_baseField S)) :=
    D.frobeniusFixedField_absoluteFinite K L hLK σ
  let Sigma : FiniteLevel G := ⟨S, hSabsolute⟩
  let π : fixedCoefficients A S :=
    fixedFieldInclusion A K.field S hSK (v.chosenPrimeElement K)
  have hπ : v.IsPrimeElement Sigma π := by
    simpa [σ, S, hSK, π] using
      v.unramifiedFrobenius_includedPrime_isPrime K L hLK hUnramified
  rw [D.finiteReciprocityHom_apply_eq_primeNormClassGivenFamily
    A v K L hLK
      (Additive.ofMul (D.unramifiedFrobenius KR L hLK)) σ
      (by rfl) π hπ]
  rw [show relativeNorm A K.field S hSK π = v.chosenPrimeElement K by
    simpa [σ, S, hSK, π] using
      v.unramifiedFrobenius_primeNorm K L hLK hUnramified]
noncomputable def unramifiedReciprocityEquivGivenFamily
    (v : ValuationData D A) (hAxiom : SatisfiesUnramifiedUnitCohomology D v)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    [TotallyDisconnectedSpace G] [TunnellFrobeniusInput.Family D A v]
    (K : FiniteLevel G) (L : ClosedSubgroup G)
    (hLK : L ≤ K.field)
    [hnormal : (extensionSubgroup K.field L hLK).Normal]
    [Finite (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK)]
    (hUnramified :
      (DegreeData.AbstractExtension.mk L K.field hLK).IsUnramified D) :
    Additive (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK) ≃+
      FiniteNormQuotient A K.field L hLK :=
  v.unramifiedReciprocity_equiv_of_generator hAxiom K L hLK hUnramified
    (D.finiteReciprocityHomGivenFamily A v K L hLK)
    (v.unramifiedReciprocity_frobenius_imageGivenFamily hAxiom
      K L hLK hUnramified)
end ValuationData
end unramifiedReciprocity
end
end
end ClassFormation
end
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
private theorem symbolNaturality_tower_finiteGivenFamily
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
theorem symbolNaturality_restriction_norm_commutesGivenFamily
    (D : DegreeData G) (A : Rep ℤ G) (v : ValuationData D A)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    [TotallyDisconnectedSpace G] [TunnellFrobeniusInput.Family D A v]
    (E : LevelExtension G)
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
    (symbolNaturalityNormMap A E.base.field E.field.field L L'
      hLK hL'K' E.below hL'L).comp
        (D.finiteReciprocityHomGivenFamily A v E.field L' hL'K') =
      (D.finiteReciprocityHomGivenFamily A v E.base L hLK).comp
      (symbolNaturalityRestriction
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
  let τ := D.symbolNaturalityFrobeniusTowerLift
    ER L L' hLK hL'K' hL'L σ
  have hσ : D.frobeniusRestriction ER.field L' hL'K' σ = q.toMul :=
    D.frobeniusRestriction_chosenFiniteReciprocityFrobeniusLift
      ER.field L' hL'K' q.toMul
  have hτ : D.frobeniusRestriction ER.base L hLK τ =
      ((symbolNaturalityRestriction
        E.base.field E.field.field L L'
        hLK hL'K' E.below hL'L).toAdditive q).toMul := by
    rw [← D.symbolNaturalityRestriction_frobeniusTowerLift
      ER L L' hLK hL'K' hL'L σ, hσ]
    rfl
  let S' := D.frobeniusFixedField ER.field L' hL'K' σ
  let S := D.frobeniusFixedField ER.base L hLK τ
  let hS'K' := D.frobeniusFixedField_le ER.field L' hL'K' σ
  let hSK := D.frobeniusFixedField_le ER.base L hLK τ
  let hS'S := D.symbolNaturalityFrobeniusFixedField_le
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
    symbolNaturality_tower_finiteGivenFamily
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
  let Sfinite : FiniteLevel G := ⟨S, hSabsolute⟩
  let S'finite : FiniteLevel G := ⟨S', hS'absolute⟩
  let ES'S : LevelExtension G :=
    { field := S'finite
      base := Sfinite
      below := hS'S
      finiteQuotient := hS'Sfinite }
  let π : fixedCoefficients A S' := v.chosenPrimeElement S'finite
  have hπ : v.IsPrimeElement S'finite π := v.chosenPrimeElement_isPrime S'finite
  let πS : fixedCoefficients A S := relativeNorm A S S' hS'S π
  have hTot : ES'S.IsTotallyRamified D := by
    have hTot' :=
      D.symbolNaturalityFrobeniusFixedField_isTotallyRamified
        ER L L' hLK hL'K' hL'L σ
    change ES'S.IsTotallyRamified D at hTot'
    exact hTot'
  have hπS : v.IsPrimeElement Sfinite πS :=
    v.norm_prime_of_totallyRamified ES'S hTot π hπ
  change symbolNaturalityNormMap
      A E.base.field E.field.field L L' hLK hL'K' E.below hL'L
      (D.finiteReciprocityHomGivenFamily A v E.field L' hL'K' q) =
    D.finiteReciprocityHomGivenFamily A v E.base L hLK
      ((symbolNaturalityRestriction
        E.base.field E.field.field L L'
        hLK hL'K' E.below hL'L).toAdditive q)
  calc
    symbolNaturalityNormMap
        A E.base.field E.field.field L L' hLK hL'K' E.below hL'L
        (D.finiteReciprocityHomGivenFamily A v E.field L' hL'K' q) =
      symbolNaturalityNormMap
        A E.base.field E.field.field L L' hLK hL'K' E.below hL'L
        (finiteNormClass A E.field.field L' hL'K'
          (relativeNorm A E.field.field S' hS'K' π)) := by
      apply congrArg (symbolNaturalityNormMap
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
      exact symbolNaturality_norm_tower_class
        A E.base.field E.field.field L L' S S'
        hLK hL'K' E.below hL'L hSK hS'K' hS'S π
    _ = D.finiteReciprocityHomGivenFamily A v E.base L hLK
        ((symbolNaturalityRestriction
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

/- TunnellNormalizedStep3 -/
section
section
noncomputable section
namespace ClassFormation
open KummerTheory
open CyclicCohomology
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
namespace ValuationData
variable {D : DegreeData G} {A : Rep ℤ G}
theorem reciprocity_cyclicTotallyRamified_finiteReciprocityHom_injectiveGivenFamily
    (v : ValuationData D A) (hcf : SatisfiesClassFieldAxiom A)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    [TotallyDisconnectedSpace G] [TunnellFrobeniusInput.Family D A v]
    (hAxiom : v.SatisfiesUnramifiedUnitCohomology D)
    (K : FiniteLevel G)
    (E : CyclicExtension K)
    (hTot : E.IsTotallyRamified D) :
    Function.Injective
      (D.finiteReciprocityHomGivenFamily A v K E.field E.below) := by
  let L := E.toLevelExtension.field
  let KR := K.toResidueLevel D
  let LG := E.toGaloisExtension
  let hLGfinite : Finite
      (KR.field.toSubgroup ⧸
        extensionSubgroup KR.field LG.field LG.below) :=
    LG.finite
  let hLGfiniteOverK : Finite
      (K.field.toSubgroup ⧸
        extensionSubgroup K.field LG.field LG.below) := by
    have h := hLGfinite
    change Finite
      (K.field.toSubgroup ⧸
        extensionSubgroup K.field LG.field LG.below) at h
    exact h
  let q := E.galoisGenerator
  let qRaw := E.generator
  let hLGTot := hTot
  let hKRabsolute : Finite ((baseField G).toSubgroup ⧸
      extensionSubgroup (baseField G) KR.field (le_baseField KR.field)) := by
    change Finite ((baseField G).toSubgroup ⧸
      extensionSubgroup (baseField G) K.field (le_baseField K.field))
    exact K.finite
  let Q := K.field.toSubgroup ⧸
    extensionSubgroup K.field E.field E.below
  let EF := E.toFiniteAbstractExtension
  let hQFintype : Fintype Q := Fintype.ofFinite _
  let σ := D.chosenDegreeOneFrobeniusLiftOfFiniteTotallyRamified
    KR LG hLGTot q
  let Sigma := D.frobeniusFixedField KR LG.field LG.below σ
  let hSigmaK := D.frobeniusFixedField_le KR LG.field LG.below σ
  let hSigmaFinite : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field Sigma hSigmaK) :=
    D.frobeniusFixedField_finite KR LG.field LG.below σ
  let hSigmaAbsolute : Finite ((baseField G).toSubgroup ⧸
      extensionSubgroup (baseField G) Sigma (le_baseField Sigma)) :=
    D.frobeniusFixedField_absoluteFinite K LG.field LG.below σ
  let SigmaF : FiniteLevel G := ⟨Sigma, hSigmaAbsolute⟩
  let piSigma : fixedCoefficients A Sigma := v.chosenPrimeElement SigmaF
  let piL : fixedCoefficients A E.field := v.chosenPrimeElement L
  rw [injective_iff_map_eq_zero]
  intro x hx
  obtain ⟨i, hi, _⟩ :=
    IsCyclic.unique_zpow_zmod (a := qRaw) E.generates x.toMul
  let k : ℕ := i.val
  have hcard : Fintype.card Q = (EF.degree : ℕ) := by
    calc
      Fintype.card Q = Nat.card Q := by
        rw [Nat.card_eq_fintype_card]
      _ = (extensionSubgroup K.field E.field E.below).index :=
        (Subgroup.index_eq_card
          (extensionSubgroup K.field E.field E.below)).symm
      _ = (EF.degree : ℕ) :=
        EF.extensionSubgroup_index_eq_degree
  have hk : k < (EF.degree : ℕ) := by
    rw [← hcard]
    exact i.val_lt
  have hxrepr : x = k • Additive.ofMul qRaw := by
    apply Additive.toMul.injective
    change x.toMul = qRaw ^ k
    exact hi
  rw [hxrepr, map_nsmul,
    D.finiteReciprocityHom_apply_eq_primeNormClassGivenFamily
      A v K E.field E.below (Additive.ofMul qRaw) σ
      (by
        change D.frobeniusRestriction KR LG.field LG.below σ = qRaw
        exact
          (D.frobeniusRestriction_chosenDegreeOneFrobeniusLiftOfFiniteTotallyRamified_underlying
            KR LG hLGTot q).trans
            (E.toGaloisExtension.extensionQuotientMulEquiv.apply_symm_apply
              E.generator))
      piSigma (v.chosenPrimeElement_isPrime SigmaF)] at hx
  have hclass :
      finiteNormClass A K.field E.field E.below
          (relativeNorm A K.field Sigma hSigmaK (k • piSigma)) = 0 := by
    have hx' := hx
    change k • finiteNormClass A K.field E.field E.below
        (relativeNorm A K.field Sigma hSigmaK piSigma) = 0 at hx'
    rw [map_nsmul, finiteNormClass_nsmul]
    exact hx'
  have hSigmaResidue :
      ((DegreeData.FiniteAbstractExtension.ofInclusion
        Sigma K.field hSigmaK).residueDegree D : ℕ) = 1 := by
    calc
      ((DegreeData.FiniteAbstractExtension.ofInclusion
          Sigma K.field hSigmaK).residueDegree D : ℕ) =
          D.frobeniusExponent KR LG.field LG.below σ :=
        D.frobeniusFixedField_residueDegreeOverBase KR LG.field LG.below σ
      _ = 1 :=
        D.frobeniusExponent_chosenDegreeOneFrobeniusLiftOfFiniteTotallyRamified
          KR LG hLGTot q
  let : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field L.field E.below) := E.finite
  obtain ⟨w, hnorm⟩ :=
    v.primeNormClass_eq_zero_exists_unit_norm_eq
      K L SigmaF E.below hSigmaK hTot hSigmaResidue
      k piSigma piL (v.chosenPrimeElement_isPrime SigmaF)
      (v.chosenPrimeElement_isPrime L) hclass
  have hkzero := v.reciprocity_cyclicTotallyRamified_exponent_eq_zero
    hcf K E hTot k hk piSigma piL
      w (v.chosenPrimeElement_isPrime L) hnorm
  rw [hxrepr, hkzero, zero_nsmul]
theorem reciprocity_cyclicTotallyRamified_finiteReciprocityHom_bijectiveGivenFamily
    (v : ValuationData D A) (hcf : SatisfiesClassFieldAxiom A)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    [TotallyDisconnectedSpace G] [TunnellFrobeniusInput.Family D A v]
    (hAxiom : v.SatisfiesUnramifiedUnitCohomology D)
    (K : FiniteLevel G)
    (E : CyclicExtension K)
    (hTot : E.IsTotallyRamified D) :
    Function.Bijective
      (D.finiteReciprocityHomGivenFamily A v K E.field E.below) := by
  let EF := E.toFiniteAbstractExtension
  let hEbaseAbsolute : Finite ((baseField G).toSubgroup ⧸
      extensionSubgroup (baseField G) EF.base (le_baseField EF.base)) := by
    simpa [EF, CyclicExtension.toFiniteAbstractExtension] using K.finite
  let : Finite (FiniteNormQuotient A K.field E.field E.below) :=
    finiteNormQuotient_finite_of_classFieldAxiom
      A hcf EF E.normal E.generator E.generates
  apply (Nat.bijective_iff_injective_and_card
    (D.finiteReciprocityHomGivenFamily A v K E.field E.below)).2
  exact ⟨v.reciprocity_cyclicTotallyRamified_finiteReciprocityHom_injectiveGivenFamily
      hcf hAxiom K E hTot,
    cyclicReciprocity_card_equality
      A hcf EF E.normal E.generator E.generates⟩
end ValuationData
end ClassFormation
end
end

/- TunnellNormalizedStep4 -/
section
section
namespace ClassFormation
open KummerTheory
open CyclicCohomology
noncomputable section
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
private theorem reciprocity_galois_functionExactGivenFamily
    (K M L : ClosedSubgroup G)
    (hLM : L.toSubgroup ≤ M.toSubgroup)
    (hMK : M.toSubgroup ≤ K.toSubgroup)
    [hLnormal :
      (extensionSubgroup K L (hLM.trans hMK)).Normal]
    [hMnormal : (extensionSubgroup K M hMK).Normal] :
    letI : (extensionSubgroup M L hLM).Normal :=
      transferNormNaturality_intermediateExtension_normal K M L hLM hMK
    Function.Exact
      (MonoidHom.toAdditive (abstractReciprocityInclusion K M L hLM hMK))
      (MonoidHom.toAdditive (abstractReciprocityRestriction K M L hLM hMK)) := by
  let : (extensionSubgroup M L hLM).Normal :=
    transferNormNaturality_intermediateExtension_normal K M L hLM hMK
  intro q
  constructor
  · intro hq
    have hmul : abstractReciprocityRestriction K M L hLM hMK q.toMul = 1 := by
      exact Additive.ofMul.injective (by simpa using hq)
    have hmem : q.toMul ∈
        (abstractReciprocityRestriction K M L hLM hMK).ker := hmul
    rw [reciprocity_galois_exact K M L hLM hMK] at hmem
    obtain ⟨x, hx⟩ := hmem
    refine ⟨Additive.ofMul x, ?_⟩
    exact Additive.toMul.injective hx
  · rintro ⟨x, rfl⟩
    have hmem : abstractReciprocityInclusion K M L hLM hMK x.toMul ∈
        (abstractReciprocityInclusion K M L hLM hMK).range :=
      ⟨x.toMul, rfl⟩
    rw [← reciprocity_galois_exact K M L hLM hMK] at hmem
    exact Additive.ofMul.injective (by simpa using hmem)
namespace ValuationData
variable {D : DegreeData G} {A : Rep ℤ G}
theorem reciprocity_finiteReciprocityHom_diagramGivenFamily
    (v : ValuationData D A)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    [TotallyDisconnectedSpace G] [TunnellFrobeniusInput.Family D A v]
    (hAxiom : v.SatisfiesUnramifiedUnitCohomology D)
    (K M : FiniteLevel G) (L : ClosedSubgroup G)
    (hLM : L.toSubgroup ≤ M.field.toSubgroup)
    (hMK : M.field.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L (hLM.trans hMK)).Normal]
    [hLfinite : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field L (hLM.trans hMK))]
    [hMnormal : (extensionSubgroup K.field M.field hMK).Normal]
    [hMfinite : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field M.field hMK)]
    [hLMnormal : (extensionSubgroup M.field L hLM).Normal]
    [hLMfinite : Finite
      (M.field.toSubgroup ⧸ extensionSubgroup M.field L hLM)] :
    let r₀ := D.finiteReciprocityHomGivenFamily A v M L hLM
    let r := D.finiteReciprocityHomGivenFamily A v K L (hLM.trans hMK)
    let r₁ := D.finiteReciprocityHomGivenFamily A v K M.field hMK
    let i := MonoidHom.toAdditive
      (abstractReciprocityInclusion K.field M.field L hLM hMK)
    let q := MonoidHom.toAdditive
      (abstractReciprocityRestriction K.field M.field L hLM hMK)
    let n := abstractReciprocityNormMap A K.field M.field L hLM hMK
    let p := abstractReciprocityNormProjection A K.field M.field L hLM hMK
    Function.Surjective q ∧
      (∀ x, r (i x) = n (r₀ x)) ∧
      (∀ x, p (r x) = r₁ (q x)) := by
  dsimp only
  let EMK : LevelExtension G :=
    { field := M
      base := K
      below := hMK
      finiteQuotient := hMfinite }
  let EKK : LevelExtension G :=
    { field := K
      base := K
      below := le_rfl
      finiteQuotient := (GaloisExtension.refl K.field).finite }
  let r₀ := D.finiteReciprocityHomGivenFamily A v M L hLM
  let r := D.finiteReciprocityHomGivenFamily A v K L (hLM.trans hMK)
  let r₁ := D.finiteReciprocityHomGivenFamily A v K M.field hMK
  let i := MonoidHom.toAdditive
    (abstractReciprocityInclusion K.field M.field L hLM hMK)
  let q := MonoidHom.toAdditive
    (abstractReciprocityRestriction K.field M.field L hLM hMK)
  let n := abstractReciprocityNormMap A K.field M.field L hLM hMK
  let p := abstractReciprocityNormProjection A K.field M.field L hLM hMK
  have hq : Function.Surjective q := by
    intro y
    obtain ⟨x, hx⟩ := abstractReciprocityRestriction_surjective
      K.field M.field L hLM hMK y.toMul
    refine ⟨Additive.ofMul x, ?_⟩
    exact Additive.toMul.injective hx
  have hleft : ∀ x, r (i x) = n (r₀ x) := by
    intro x
    have hcomm := D.symbolNaturality_restriction_norm_commutesGivenFamily
      A v EMK L L (hLM.trans hMK) hLM le_rfl
    simpa only [r, r₀, n, i, abstractReciprocityNormMap,
      abstractReciprocityInclusion, transferNormNaturalityIntermediateInclusion,
      AddMonoidHom.comp_apply] using
        (congrArg (fun f => f x) hcomm).symm
  have hright : ∀ x, p (r x) = r₁ (q x) := by
    intro x
    have hcomm := D.symbolNaturality_restriction_norm_commutesGivenFamily
      A v EKK M.field L hMK (hLM.trans hMK) hLM
    rw [symbolNaturalityNormMap_sameBase_eq_normProjection,
      symbolNaturalityRestriction_sameBase_eq_restriction] at hcomm
    simpa only [r, r₁, p, q, AddMonoidHom.comp_apply] using
      congrArg (fun f => f x) hcomm
  exact ⟨hq, hleft, hright⟩
theorem reciprocity_cyclic_finiteReciprocityHom_bijectiveGivenFamily
    (v : ValuationData D A) (hcf : SatisfiesClassFieldAxiom A)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    [TotallyDisconnectedSpace G] [TunnellFrobeniusInput.Family D A v]
    (hAxiom : v.SatisfiesUnramifiedUnitCohomology D)
    (K : FiniteLevel G) (L : GaloisExtension K.field)
    [hCyclic : IsCyclic L.extensionQuotient] :
    letI : Finite
        (K.field.toSubgroup ⧸
          extensionSubgroup K.field L.field L.below) := L.finite
    Function.Bijective
      (D.finiteReciprocityHomGivenFamily A v K L.field L.below) := by
  let : Finite
      (K.field.toSubgroup ⧸
        extensionSubgroup K.field L.field L.below) := L.finite
  let S := L.inertiaImage D
  let M := L.maximalUnramifiedSubextension D
  let hLM : L.field.toSubgroup ≤ M.toSubgroup :=
    L.field_le_intermediateField S
  let hMK : M.toSubgroup ≤ K.field.toSubgroup :=
    L.intermediateField_le_base S
  let hLnormal :
      (extensionSubgroup K.field L.field (hLM.trans hMK)).Normal := by
    simpa only using L.normal
  let hLfinite : Finite
      (K.field.toSubgroup ⧸
        extensionSubgroup K.field L.field (hLM.trans hMK)) := by
    simpa only using L.finite
  let hMnormal : (extensionSubgroup K.field M hMK).Normal :=
    L.intermediateField_normal S inferInstance
  let hMfinite : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field M hMK) :=
    L.intermediateField_finite S
  let hLMnormal : (extensionSubgroup M L.field hLM).Normal :=
    L.extensionSubgroup_over_intermediate_normal S
  let hLMfinite : Finite
      (M.toSubgroup ⧸ extensionSubgroup M L.field hLM) :=
    L.extension_over_intermediate_finite S
  let hMabsolute : Finite ((baseField G).toSubgroup ⧸
      extensionSubgroup (baseField G) M (le_baseField M)) :=
    GaloisExtension.finite_extension_trans hMK (le_baseField K.field)
  let MF : FiniteLevel G := ⟨M, hMabsolute⟩
  let hLowerCyclic : IsCyclic
      (M.toSubgroup ⧸ extensionSubgroup M L.field hLM) :=
    L.lowerQuotient_isCyclic S
  obtain ⟨g, hg⟩ := IsCyclic.exists_generator
    (α := M.toSubgroup ⧸ extensionSubgroup M L.field hLM)
  let Ecyc : CyclicExtension MF :=
    { field := L.field
      below := hLM
      normal := hLMnormal
      finite := hLMfinite
      generator := g
      generates := hg }
  let r₀ := D.finiteReciprocityHomGivenFamily A v MF L.field hLM
  let r := D.finiteReciprocityHomGivenFamily A v K L.field (hLM.trans hMK)
  let r₁ := D.finiteReciprocityHomGivenFamily A v K M hMK
  have hr₀ : Function.Bijective r₀ :=
    v.reciprocity_cyclicTotallyRamified_finiteReciprocityHom_bijectiveGivenFamily
      hcf hAxiom MF Ecyc
        (L.maximalUnramifiedSubextension_isTotallyRamified D)
  have hr₁ : Function.Bijective r₁ :=
    (v.unramifiedReciprocityEquivGivenFamily hAxiom K M hMK
      (L.maximalUnramifiedSubextension_isUnramified D)).bijective
  obtain ⟨hpQ, hleft, hright⟩ :=
    reciprocity_finiteReciprocityHom_diagramGivenFamily
      v hAxiom K MF L.field hLM hMK
  exact reciprocity_bijective_of_exact_diagram
    (MonoidHom.toAdditive
      (abstractReciprocityInclusion K.field M L.field hLM hMK))
    (MonoidHom.toAdditive
      (abstractReciprocityRestriction K.field M L.field hLM hMK))
    (abstractReciprocityNormMap A K.field M L.field hLM hMK)
    (abstractReciprocityNormProjection A K.field M L.field hLM hMK)
    r₀ r r₁
    (reciprocity_galois_functionExactGivenFamily K.field M L.field hLM hMK)
    (reciprocity_normQuotient_exact A K.field M L.field hLM hMK)
    hpQ (L.maximalUnramified_normMap_injective A hcf D)
    hleft hright hr₀ hr₁

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
def valueOf (d : G →* Multiplicative (TunnellProfiniteCoordinate.Z)) (v : fixedCoefficients A (baseField G) →+ (TunnellProfiniteCoordinate.Z))
    (hd : Continuous d) (ds : Function.Surjective d) (ints : ∀ m : ℤ, (m : (TunnellProfiniteCoordinate.Z)) ∈ v.range)
    (divs : ∀ (n : ℕ+) (x : fixedCoefficients A (baseField G)), (v x).val n = 0 →
      ∃ y : fixedCoefficients A (baseField G), (n : ℕ) • v y = v x)
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
theorem realize (d : G →* Multiplicative (TunnellProfiniteCoordinate.Z)) (v : fixedCoefficients A (baseField G) →+ (TunnellProfiniteCoordinate.Z))
    (hd : Continuous d) (ds : Function.Surjective d) (ints : ∀ m : ℤ, (m : (TunnellProfiniteCoordinate.Z)) ∈ v.range)
    (divs : ∀ (n : ℕ+) (x : fixedCoefficients A (baseField G)), (v x).val n = 0 →
      ∃ y : fixedCoefficients A (baseField G), (n : ℕ) • v y = v x)
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

/- TunnellFrobeniusCyclic -/
section
namespace TunnellFrobeniusCyclic
open ClassFormation CyclicCohomology KummerTheory TunnellFrobeniusFamily TunnellFrobeniusFamilyBridge
open scoped Classical
noncomputable section
set_option maxHeartbeats 1200000 in
theorem actual : OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H1_R1_H2_R1_H2_R1_H1_R1_H1_R1.H2 := by
  intro G A
  dsimp only
  intro d v hd ds vi vd norms tate r normed p cyc
  obtain ⟨D,V,ed,ev⟩ := TunnellNativeValuationData.realize A d v hd ds vi vd (by
    intro H _ z
    constructor
    · rintro ⟨a,⟨b,hb⟩,ha⟩
      exact (norms H z).mp ⟨a,b,hb,ha⟩
    · intro hz
      obtain ⟨a,b,hb,ha⟩ := (norms H z).mpr hz
      exact ⟨a,⟨b,hb⟩,ha⟩)
  subst d v
  have cf : SatisfiesClassFieldAxiom A := (TunnellAbstractNormCoordinates.tate_iff A).mp (by
    intro H J fi hj normal ft cyclic
    let u : P G := ⟨(H,J),fi,hj,normal,@Finite.of_fintype _ ft⟩
    exact @tate u ft cyclic)
  letI := family D A V r normed
  let K := TunnellAbstractNormCoordinates.finiteField (H p)
  let E : GaloisExtension K.field := ⟨J p,p.property.2.1,p.property.2.2.1,p.property.2.2.2⟩
  letI : IsCyclic E.extensionQuotient := cyc
  have hc := (V.reciprocity_cyclic_finiteReciprocityHom_bijectiveGivenFamily cf
    (V.classFieldAxiom_implies_unramifiedUnitCohomology cf) K E).1
  intro x y h
  exact hc (congrArg (quotient A K E).symm h)
end
end TunnellFrobeniusCyclic
end

theorem OMA.solution : OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H1_R1_H2_R1_H2_R1_H1_R1_H1_R1.H2 := TunnellFrobeniusCyclic.actual
