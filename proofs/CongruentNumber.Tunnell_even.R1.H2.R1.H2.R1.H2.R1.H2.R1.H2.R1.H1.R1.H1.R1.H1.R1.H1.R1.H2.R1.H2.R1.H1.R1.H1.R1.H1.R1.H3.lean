import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H1_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1
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
 
@[simp] theorem residueDegreeCardinal_eq_mk_residueQuotient
    (D : DegreeData G) (K : ClosedSubgroup G) :
    D.residueDegreeCardinal K = Cardinal.mk (D.residueQuotient K) :=
  rfl

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

theorem isUnramified_iff_inertia_le (E : AbstractExtension G) (D : DegreeData G) :
    E.IsUnramified D ↔
      E.base.toSubgroup ⊓ D.degree.toMonoidHom.ker ≤ E.field.toSubgroup :=
  Iff.rfl
end AbstractExtension

structure GaloisSubextension (K : ClosedSubgroup G) where
   
  field : ClosedSubgroup G
   
  below : field.toSubgroup ≤ K.toSubgroup
   
  normal : (extensionSubgroup K field below).Normal
namespace GaloisSubextension
variable {K : ClosedSubgroup G}

def extensionQuotient (L : GaloisSubextension K) : Type u :=
  K.toSubgroup ⧸ extensionSubgroup K L.field L.below
 
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

theorem frobeniusExponent_unique (D : DegreeData G)
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (σ : D.FrobeniusElements K L hLK) (n : ℕ)
    (hn :
      D.extensionNormalizedDegree K L hLK σ.1 =
        (Multiplicative.ofAdd (1 : ZHat)) ^ n) :
    n = D.frobeniusExponent K L hLK σ := by
  apply proCIntegerOne_pow_nat_injective
  exact hn.symm.trans
    (D.extensionNormalizedDegree_frobenius_eq_pow K L hLK σ)
 
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
 
def IsUnramified (E : FiniteCyclicSubextension K) (D : DegreeData G) : Prop :=
  E.toFiniteAbstractExtension.IsUnramified D

noncomputable abbrev toFiniteAbstractFieldExtension
    (E : FiniteCyclicSubextension K) : FiniteAbstractFieldExtension G := by
  letI : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field E.field E.below) :=
    E.finite
  exact FiniteAbstractFieldExtension.ofInclusion E.field K E.below
 
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

structure FiniteUnramifiedCyclicExtension
    (D : DegreeData G) (K : FiniteAbstractField G)
    extends FiniteCyclicSubextension K where
   
  unramified : toFiniteCyclicSubextension.IsUnramified D
namespace FiniteUnramifiedCyclicExtension
variable {K : FiniteAbstractField G}

noncomputable abbrev toFiniteAbstractFieldExtension
    (E : FiniteUnramifiedCyclicExtension D K) :
    FiniteAbstractFieldExtension G :=
  E.toFiniteCyclicSubextension.toFiniteAbstractFieldExtension

theorem toFiniteAbstractFieldExtension_isUnramified
    (E : FiniteUnramifiedCyclicExtension D K) :
    E.toFiniteAbstractFieldExtension.IsUnramified D := by
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
namespace FiniteCyclicSubextension
variable {K : FiniteAbstractField G}

noncomputable def fixedRepresentation (E : FiniteCyclicSubextension K)
    (A : Rep ℤ G) :
    Rep ℤ (K.field.toSubgroup ⧸ extensionSubgroup K.field E.field E.below) :=
  extensionFixedRepresentation A K.field E.field E.below E.normal
end FiniteCyclicSubextension

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
 
noncomputable def unitRepresentationOverK
    (v : ValuationData D A) (E : FiniteAbstractFieldExtension G)
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
    (v : ValuationData D A) (E : FiniteAbstractFieldExtension G)
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
    (v : ValuationData D A) (E : FiniteAbstractFieldExtension G)
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
variable {K : FiniteAbstractField G}

noncomputable def unitRepresentation
    (E : FiniteUnramifiedCyclicExtension D K) (v : ValuationData D A) :
    Rep ℤ (K.field.toSubgroup ⧸ extensionSubgroup K.field E.field E.below) :=
  v.unitRepresentation E.toFiniteAbstractFieldExtension E.normal
end FiniteUnramifiedCyclicExtension
namespace ValuationData
 
def unitInclusion
    (v : ValuationData D A) (E : FiniteAbstractFieldExtension G)
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
    (v : ValuationData D A) (E : FiniteAbstractFieldExtension G)
    (hnormal : (extensionSubgroup E.base.field E.field.field E.below).Normal)
    (q : E.base.field.toSubgroup ⧸
      extensionSubgroup E.base.field E.field.field E.below)
    (u : v.unitAddSubgroup E.field) :
    (((v.unitRepresentation E hnormal).ρ q u).1 :
        ambientFixedAddSubgroup A E.field.field).1 =
      relativeCosetAction A E.base.field E.field.field E.below u.1 q := by
  refine Quotient.inductionOn' q ?_
  intro k
  rw [relativeCosetAction_mk]
  rfl

theorem unitRepresentation_norm_coe
    (v : ValuationData D A) (E : FiniteAbstractFieldExtension G)
    (hnormal : (extensionSubgroup E.base.field E.field.field E.below).Normal)
    (u : v.unitAddSubgroup E.field) :
    letI := Fintype.ofFinite
      (E.base.field.toSubgroup ⧸
        extensionSubgroup E.base.field E.field.field E.below)
    ((((v.unitRepresentation E hnormal).norm.hom u).1 :
        ambientFixedAddSubgroup A E.field.field) : A.V) =
      ((relativeNorm A E.base.field E.field.field E.below u.1 :
        ambientFixedAddSubgroup A E.base.field) : A.V) := by
  let := Fintype.ofFinite
    (E.base.field.toSubgroup ⧸
      extensionSubgroup E.base.field E.field.field E.below)
  rw [relativeNorm_apply_coe]
  change
    (((Representation.norm (v.unitRepresentation E hnormal).ρ) u).1 :
      ambientFixedAddSubgroup A E.field.field).1 =
      relativeNormValue A E.base.field E.field.field E.below u.1
  rw [Representation.norm, relativeNormValue]
  let coeToAmbient : v.unitAddSubgroup E.field →+ A.V :=
    (ambientFixedAddSubgroup A E.field.field).subtype.comp
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
    (v : ValuationData D A) (E : FiniteAbstractFieldExtension G)
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
        ambientFixedAddSubgroup A E.base.field) : A.V) =
        ((((v.unitRepresentation E hnormal).norm.hom ε).1 :
          ambientFixedAddSubgroup A E.field.field) : A.V) :=
      (v.unitRepresentation_norm_coe E hnormal ε).symm
    _ = ((uL.1 : ambientFixedAddSubgroup A E.field.field) : A.V) :=
      congrArg
        (fun z : v.unitAddSubgroup E.field =>
          ((z.1 : ambientFixedAddSubgroup A E.field.field) : A.V)) hε
    _ = u.1.1 := rfl

theorem exists_unit_sigma_sub_eq_of_tateHMinusOne_isZero
    (v : ValuationData D A) (E : FiniteAbstractFieldExtension G)
    (hnormal : (extensionSubgroup E.base.field E.field.field E.below).Normal)
    (g : E.base.field.toSubgroup ⧸
      extensionSubgroup E.base.field E.field.field E.below)
    (hg : ∀ x, x ∈ Subgroup.zpowers g) :
    letI := Fintype.ofFinite
      (E.base.field.toSubgroup ⧸
        extensionSubgroup E.base.field E.field.field E.below)
    Limits.IsZero
        (tateCohomology (v.unitRepresentation E hnormal) (-1)) →
      ∀ u : (v.unitRepresentation E hnormal).V,
        (v.unitRepresentation E hnormal).norm.hom u = 0 →
        ∃ ε : (v.unitRepresentation E hnormal).V,
          (v.unitRepresentation E hnormal).ρ g ε - ε = u := by
  let := Fintype.ofFinite
    (E.base.field.toSubgroup ⧸
      extensionSubgroup E.base.field E.field.field E.below)
  intro hzero u hu
  let U := v.unitRepresentation E hnormal
  exact CyclicCohomology.normKernel_le_sigmaMinusOneRange_of_tateHMinusOne_isZero
    U g hg hzero u hu

def SatisfiesUnramifiedUnitCohomology
    (D : DegreeData G) (v : ValuationData D A) : Prop :=
  ∀ (K : FiniteAbstractField G)
    (E : FiniteUnramifiedCyclicExtension D K),
    Limits.IsZero (tateCohomology (E.unitRepresentation v) 0) ∧
      Limits.IsZero (tateCohomology (E.unitRepresentation v) (-1))
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

theorem tateHMinusOne_card
    (hcf : SatisfiesClassFieldAxiom A)
    (K : FiniteAbstractField G) (E : FiniteCyclicSubextension K) :
    Nat.card (tateCohomology (E.fixedRepresentation A) (-1)) = 1 :=
  (hcf K E).tateHMinusOne_card

theorem tateHMinusOne_isZero
    (hcf : SatisfiesClassFieldAxiom A)
    (K : FiniteAbstractField G) (E : FiniteCyclicSubextension K) :
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
 
def frobeniusFixedFieldToClosure (D : DegreeData G) [IsTopologicalGroup G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (σ : D.FrobeniusElements K L hLK) :
    (D.frobeniusFixedField K L hLK σ).toSubgroup →*
      D.frobeniusClosure K L hLK σ where
  toFun s := by
    let k : K.field.toSubgroup :=
      Subgroup.inclusion (D.frobeniusFixedField_le K L hLK σ) s
    refine ⟨QuotientGroup.mk k, ?_⟩
    have hk : k ∈
        extensionSubgroup K.field (D.frobeniusFixedField K L hLK σ)
          (D.frobeniusFixedField_le K L hLK σ) := s.2
    rw [D.extensionSubgroup_frobeniusFixedField K L hLK σ] at hk
    exact hk
  map_one' := by
    apply Subtype.ext
    rfl
  map_mul' := by
    intro a b
    apply Subtype.ext
    rfl

theorem frobeniusFixedField_normalizedDegree_compatibility (D : DegreeData G)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (σ : D.FrobeniusElements K L hLK)
    (s : (D.frobeniusFixedField K L hLK σ).toSubgroup) :
    D.fixedFieldNormalizedDegree K L hLK σ
        (D.frobeniusFixedFieldToClosure K L hLK σ s) =
      D.normalizedDegree (D.frobeniusFixedResidueField K L hLK σ) s := by
  let Sigma := D.frobeniusFixedResidueField K L hLK σ
  let a : D.frobeniusClosure K L hLK σ :=
    D.frobeniusFixedFieldToClosure K L hLK σ s
  let k : K.field.toSubgroup :=
    Subgroup.inclusion (D.frobeniusFixedField_le K L hLK σ) s
  let n := D.frobeniusExponent K L hLK σ
  apply Multiplicative.ext
  apply zHatMulNat_injective Sigma.residueDegree.property
  change (Sigma.residueDegree : ℕ) •
      (D.fixedFieldNormalizedDegree K L hLK σ a).toAdd =
    (Sigma.residueDegree : ℕ) • (D.normalizedDegree Sigma s).toAdd
  calc
    (Sigma.residueDegree : ℕ) •
        (D.fixedFieldNormalizedDegree K L hLK σ a).toAdd =
      (K.residueDegree : ℕ) •
        (n • (D.fixedFieldNormalizedDegree K L hLK σ a).toAdd) := by
          rw [show (Sigma.residueDegree : ℕ) =
              n * (K.residueDegree : ℕ) by
            simpa [Sigma, n] using
              D.frobeniusFixedResidueField_residueDegree K L hLK σ]
          rw [smul_smul, Nat.mul_comm]
    _ = (K.residueDegree : ℕ) •
        (D.frobeniusClosureDegree K L hLK σ a).toAdd := by
          rw [D.frobeniusExponent_nsmul_fixedFieldNormalizedDegree]
    _ = (K.residueDegree : ℕ) • (D.normalizedDegree K k).toAdd := by
          rfl
    _ = (D.degree s.1).toAdd := by
          exact D.residueDegree_nsmul_normalizedDegree K k
    _ = (Sigma.residueDegree : ℕ) •
        (D.normalizedDegree Sigma s).toAdd := by
          exact (D.residueDegree_nsmul_normalizedDegree Sigma s).symm
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

theorem quotient_generator_of_unramified_degree_one (D : DegreeData G)
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
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

theorem absoluteFinite {E K : ClosedSubgroup G}
    [hKfinite : Finite ((baseField G).toSubgroup ⧸
      extensionSubgroup (baseField G) K (le_baseField K))]
    (M : FiniteIntermediateField E K) :
    Finite ((baseField G).toSubgroup ⧸
      extensionSubgroup (baseField G) M.field (le_baseField M.field)) := by
  let : Finite
      (K.toSubgroup ⧸ extensionSubgroup K M.field M.below) := M.finite
  exact relativeTowerQuotientFinite (baseField G) K M.field M.below
    (le_baseField K)
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

/- ClassFieldTheory.AbstractClassFieldTheory.Reciprocity.Construction.FiniteIntermediateFieldCompositum -/
section
universe u v
namespace ClassFormation
open KummerTheory
open CyclicCohomology
noncomputable section
open CategoryTheory
open scoped BigOperators
section finiteIntermediateFields
variable {G : Type u} [Group G] [TopologicalSpace G]
namespace FiniteIntermediateField

noncomputable def quotientCard {E K : ClosedSubgroup G}
    (M : FiniteIntermediateField E K) : ℕ := by
  letI : Finite
      (K.toSubgroup ⧸ extensionSubgroup K M.field M.below) := M.finite
  exact Nat.card
    (K.toSubgroup ⧸ extensionSubgroup K M.field M.below)
 
theorem quotientCard_pos {E K : ClosedSubgroup G}
    (M : FiniteIntermediateField E K) : 0 < M.quotientCard := by
  let : Finite
      (K.toSubgroup ⧸ extensionSubgroup K M.field M.below) := M.finite
  exact Nat.card_pos

theorem exists_common_compositum {E K : ClosedSubgroup G} {ι : Type v}
    (M : FiniteIntermediateField E K) (s : Finset ι)
    (F : ι → FiniteIntermediateField E K) :
    ∃ P : FiniteIntermediateField E K,
      P.field.toSubgroup ≤ M.field.toSubgroup ∧
        ∀ i ∈ s, P.field.toSubgroup ≤ (F i).field.toSubgroup := by
  classical
  induction s using Finset.induction_on with
  | empty =>
      exact ⟨M, le_rfl, by simp⟩
  | @insert i s hi ih =>
      rcases ih with ⟨P, hPM, hPF⟩
      let Q := P.compositum (F i)
      refine ⟨Q, (P.compositum_le_left (F i)).trans hPM, ?_⟩
      intro j hj
      rw [Finset.mem_insert] at hj
      rcases hj with hji | hj
      · simpa [hji] using P.compositum_le_right (F i)
      · exact (P.compositum_le_left (F i)).trans (hPF j hj)
end FiniteIntermediateField
end finiteIntermediateFields
end
end ClassFormation
end

/- ClassFieldTheory.AbstractClassFieldTheory.Reciprocity.Construction.FrobeniusPowerFixedField -/
section
universe u
namespace ClassFormation
open KummerTheory
open CyclicCohomology
noncomputable section
open CategoryTheory
open scoped BigOperators
section degreeOnePowerFields
variable {G : Type u} [Group G] [TopologicalSpace G]
namespace DegreeData

theorem extensionInertia_commutes_of_mem_extensionSubgroup (D : DegreeData G)
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (k : K.field.toSubgroup) (hk : k ∈ extensionSubgroup K.field L hLK)
    (q : K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK)
    (hq : D.extensionNormalizedDegree K L hLK q = 1) :
    (QuotientGroup.mk k :
        K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK) * q =
      q * QuotientGroup.mk k := by
  revert hq
  refine Quotient.inductionOn' q ?_
  intro t hdt
  have htI : t ∈ D.fieldInertiaWithin K.field := by
    rw [← D.normalizedDegree_ker K]
    exact hdt
  change QuotientGroup.mk (k * t) = QuotientGroup.mk (t * k)
  apply QuotientGroup.eq.mpr
  constructor
  · change (k * t)⁻¹ * (t * k) ∈ extensionSubgroup K.field L hLK
    have hconj : t⁻¹ * k⁻¹ * t ∈ extensionSubgroup K.field L hLK := by
      simpa using hLnormal.conj_mem k⁻¹
        ((extensionSubgroup K.field L hLK).inv_mem hk) t⁻¹
    simpa [mul_assoc] using
      (extensionSubgroup K.field L hLK).mul_mem hconj hk
  · change (k * t)⁻¹ * (t * k) ∈ D.fieldInertiaWithin K.field
    have hconj : k⁻¹ * t * k ∈ D.fieldInertiaWithin K.field := by
      simpa using (inferInstance : (D.fieldInertiaWithin K.field).Normal).conj_mem
        t htI k⁻¹
    simp [mul_assoc]

theorem quotientPower_card_commutes_degreeZero (D : DegreeData G)
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (P : FiniteIntermediateField (D.maximalUnramifiedField L) K.field)
    (hPL : P.field.toSubgroup ≤ L.toSubgroup)
    [hPnormal : (extensionSubgroup K.field P.field P.below).Normal]
    (q τ : K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK)
    (hτ : D.extensionNormalizedDegree K L hLK τ = 1) :
    let n := Nat.card
      (K.field.toSubgroup ⧸ extensionSubgroup K.field P.field P.below)
    q ^ n * τ = τ * q ^ n := by
  let R := K.field.toSubgroup ⧸ extensionSubgroup K.field P.field P.below
  let : Finite R := P.finite
  let n := Nat.card R
  let Q := K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK
  let hIP : D.extensionInertiaWithin K.field L hLK ≤
      extensionSubgroup K.field P.field P.below := by
    intro x hx
    have hxE : x ∈ extensionSubgroup K.field (D.maximalUnramifiedField L)
        (D.maximalUnramifiedField_le_of_le hLK) := by
      rw [D.extensionSubgroup_maximalUnramifiedField K.field L hLK]
      exact hx
    apply (mem_extensionSubgroup_iff K.field P.field P.below x).2
    exact P.above
      ((mem_extensionSubgroup_iff K.field (D.maximalUnramifiedField L)
        (D.maximalUnramifiedField_le_of_le hLK) x).1 hxE)
  let rP : Q →* R :=
    QuotientGroup.map (D.extensionInertiaWithin K.field L hLK)
      (extensionSubgroup K.field P.field P.below)
      (MonoidHom.id K.field.toSubgroup) hIP
  let k : K.field.toSubgroup := Quotient.out (q ^ n)
  have hkq : (QuotientGroup.mk k : Q) = q ^ n :=
    Quotient.out_eq' (q ^ n)
  have hrPpow : rP (q ^ n) = 1 := by
    rw [map_pow]
    exact pow_card_eq_one'
  have hkP : k ∈ extensionSubgroup K.field P.field P.below := by
    apply (QuotientGroup.eq_one_iff k).1
    calc
      (QuotientGroup.mk k : R) = rP (QuotientGroup.mk k) := rfl
      _ = rP (q ^ n) := congrArg rP hkq
      _ = 1 := hrPpow
  have hkL : k ∈ extensionSubgroup K.field L hLK := by
    apply (mem_extensionSubgroup_iff K.field L hLK k).2
    exact hPL ((mem_extensionSubgroup_iff K.field P.field P.below k).1 hkP)
  have hcomm := D.extensionInertia_commutes_of_mem_extensionSubgroup
    K L hLK k hkL τ hτ
  simpa [Q, n, hkq] using hcomm
private theorem extensionNormalizedDegree_pow_of_degreeOne (D : DegreeData G)
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (φ : D.FrobeniusElements K L hLK)
    (hφ : D.frobeniusExponent K L hLK φ = 1)
    (n : ℕ) :
    D.extensionNormalizedDegree K L hLK (φ.1 ^ n) =
      (Multiplicative.ofAdd (1 : ZHat)) ^ n := by
  rw [map_pow,
    D.extensionNormalizedDegree_frobenius_eq_pow K L hLK φ, hφ]
  simp

def frobeniusPowerOfDegreeOne (D : DegreeData G)
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (φ : D.FrobeniusElements K L hLK)
    (hφ : D.frobeniusExponent K L hLK φ = 1)
    (n : ℕ) (hn : 0 < n) : D.FrobeniusElements K L hLK :=
  ⟨φ.1 ^ n,
    ⟨n, hn, D.extensionNormalizedDegree_pow_of_degreeOne
      K L hLK φ hφ n⟩⟩
 
@[simp]
theorem frobeniusPowerOfDegreeOne_coe (D : DegreeData G)
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (φ : D.FrobeniusElements K L hLK)
    (hφ : D.frobeniusExponent K L hLK φ = 1)
    (n : ℕ) (hn : 0 < n) :
    (D.frobeniusPowerOfDegreeOne K L hLK φ hφ n hn).1 = φ.1 ^ n :=
  rfl

theorem frobeniusPowerFixedField_le_finiteField (D : DegreeData G)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (P : FiniteIntermediateField (D.maximalUnramifiedField L) K.field)
    [hPnormal : (extensionSubgroup K.field P.field P.below).Normal]
    (φ : D.FrobeniusElements K L hLK)
    (hφ : D.frobeniusExponent K L hLK φ = 1) :
    let n := P.quotientCard
    let hn : 0 < n := P.quotientCard_pos
    (D.frobeniusFixedField K L hLK
      (D.frobeniusPowerOfDegreeOne K L hLK φ hφ n hn)).toSubgroup ≤
      P.field.toSubgroup := by
  dsimp only
  let R := K.field.toSubgroup ⧸ extensionSubgroup K.field P.field P.below
  let n := P.quotientCard
  have hn : 0 < n := P.quotientCard_pos
  let Q := K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK
  let hIP : D.extensionInertiaWithin K.field L hLK ≤
      extensionSubgroup K.field P.field P.below := by
    intro x hx
    have hxE : x ∈ extensionSubgroup K.field (D.maximalUnramifiedField L)
        (D.maximalUnramifiedField_le_of_le hLK) := by
      rw [D.extensionSubgroup_maximalUnramifiedField K.field L hLK]
      exact hx
    apply (mem_extensionSubgroup_iff K.field P.field P.below x).2
    exact P.above
      ((mem_extensionSubgroup_iff K.field (D.maximalUnramifiedField L)
        (D.maximalUnramifiedField_le_of_le hLK) x).1 hxE)
  let rP : Q →ₜ* R :=
    { toMonoidHom :=
        QuotientGroup.map
          (N := D.extensionInertiaWithin K.field L hLK)
          (M := extensionSubgroup K.field P.field P.below)
          (f := MonoidHom.id K.field.toSubgroup) hIP
      continuous_toFun := by
        refine (QuotientGroup.isQuotientMap_mk
          (G := K.field.toSubgroup)
          (N := D.extensionInertiaWithin K.field L hLK)).continuous_iff.2 ?_
        change Continuous
          (⇑(QuotientGroup.map
              (D.extensionInertiaWithin K.field L hLK)
              (extensionSubgroup K.field P.field P.below)
              (MonoidHom.id K.field.toSubgroup) hIP) ∘
            QuotientGroup.mk'
              (D.extensionInertiaWithin K.field L hLK))
        have hcomp :
            (⇑(QuotientGroup.map
                (D.extensionInertiaWithin K.field L hLK)
                (extensionSubgroup K.field P.field P.below)
                (MonoidHom.id K.field.toSubgroup) hIP) ∘
              QuotientGroup.mk'
                (D.extensionInertiaWithin K.field L hLK)) =
              QuotientGroup.mk'
                (extensionSubgroup K.field P.field P.below) := by
          funext k
          exact QuotientGroup.map_mk' _ _ _ _ k
        rw [hcomp]
        exact continuous_quotient_mk' }
  let : Finite R := P.finite
  let : IsClosed
      (extensionSubgroup K.field P.field P.below : Set K.field.toSubgroup) :=
    extensionSubgroup_isClosed K.field P.field P.below
  have hrPpow : rP (φ.1 ^ n) = 1 := by
    rw [map_pow]
    change (rP φ.1) ^ Nat.card R = 1
    exact pow_card_eq_one'
  let σ := D.frobeniusPowerOfDegreeOne K L hLK φ hφ n hn
  have hclosure :
      (D.frobeniusClosure K L hLK σ).toSubgroup ≤
        rP.toMonoidHom.ker := by
    apply Subgroup.topologicalClosure_minimal
    · rw [Subgroup.closure_le]
      intro z hz
      have hz' : z = φ.1 ^ n := by simpa [σ] using hz
      subst z
      exact hrPpow
    · change IsClosed {x : Q | rP x = 1}
      exact isClosed_eq rP.continuous continuous_const
  rintro g ⟨k, hk, rfl⟩
  apply (mem_extensionSubgroup_iff K.field P.field P.below k).1
  apply (QuotientGroup.eq_one_iff k).1
  have hk' := hclosure hk
  change QuotientGroup.mk' (extensionSubgroup K.field P.field P.below) k = 1 at hk'
  exact hk'
 
@[simp]
theorem frobeniusExponent_powerOfDegreeOne (D : DegreeData G)
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (φ : D.FrobeniusElements K L hLK)
    (hφ : D.frobeniusExponent K L hLK φ = 1)
    (n : ℕ) (hn : 0 < n) :
    D.frobeniusExponent K L hLK
      (D.frobeniusPowerOfDegreeOne K L hLK φ hφ n hn) = n :=
  by
    apply proCIntegerOne_pow_nat_injective
    calc
      (Multiplicative.ofAdd (1 : ZHat)) ^
          D.frobeniusExponent K L hLK
            (D.frobeniusPowerOfDegreeOne K L hLK φ hφ n hn) =
          D.extensionNormalizedDegree K L hLK
            (D.frobeniusPowerOfDegreeOne K L hLK φ hφ n hn).1 :=
        (D.extensionNormalizedDegree_frobenius_eq_pow K L hLK
          (D.frobeniusPowerOfDegreeOne K L hLK φ hφ n hn)).symm
      _ = (Multiplicative.ofAdd (1 : ZHat)) ^ n :=
        D.extensionNormalizedDegree_pow_of_degreeOne K L hLK φ hφ n
private theorem frobeniusClosure_power_mul_le (D : DegreeData G)
    [IsTopologicalGroup G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (φ : D.FrobeniusElements K L hLK)
    (hφ : D.frobeniusExponent K L hLK φ = 1)
    (n m : ℕ) (hn : 0 < n) (hm : 0 < m) :
    (D.frobeniusClosure K L hLK
      (D.frobeniusPowerOfDegreeOne K L hLK φ hφ (n * m)
        (Nat.mul_pos hn hm))).toSubgroup ≤
      (D.frobeniusClosure K L hLK
        (D.frobeniusPowerOfDegreeOne K L hLK φ hφ n hn)).toSubgroup := by
  let Q := K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK
  let x : Q := φ.1 ^ n
  let C : ClosedSubgroup Q := closedSubgroupGenerated ({x} : Set Q)
  have hxC : x ∈ C.toSubgroup :=
    Subgroup.le_topologicalClosure _
      (Subgroup.subset_closure (by simp [x]))
  have hpowC : φ.1 ^ (n * m) ∈ C.toSubgroup := by
    rw [pow_mul]
    exact C.toSubgroup.pow_mem hxC m
  change (closedSubgroupGenerated
      (Set.range (fun _ : Unit => φ.1 ^ (n * m)))).toSubgroup ≤
    (closedSubgroupGenerated
      (Set.range (fun _ : Unit => φ.1 ^ n))).toSubgroup
  have hrangeLeft : Set.range (fun _ : Unit => φ.1 ^ (n * m)) =
      ({φ.1 ^ (n * m)} : Set Q) := by ext q; simp
  have hrangeRight : Set.range (fun _ : Unit => φ.1 ^ n) =
      ({φ.1 ^ n} : Set Q) := by ext q; simp
  rw [hrangeLeft, hrangeRight]
  apply Subgroup.topologicalClosure_minimal
  · rw [Subgroup.closure_le]
    simpa [C, x] using hpowC
  · exact (closedSubgroupGenerated ({φ.1 ^ n} : Set Q)).isClosed'

theorem frobeniusPowerFixedField_le (D : DegreeData G)
    [IsTopologicalGroup G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (φ : D.FrobeniusElements K L hLK)
    (hφ : D.frobeniusExponent K L hLK φ = 1)
    (n m : ℕ) (hn : 0 < n) (hm : 0 < m) :
    (D.frobeniusFixedField K L hLK
      (D.frobeniusPowerOfDegreeOne K L hLK φ hφ (n * m)
        (Nat.mul_pos hn hm))).toSubgroup ≤
      (D.frobeniusFixedField K L hLK
        (D.frobeniusPowerOfDegreeOne K L hLK φ hφ n hn)).toSubgroup := by
  rintro z ⟨k, hk, rfl⟩
  exact ⟨k,
    D.frobeniusClosure_power_mul_le K L hLK φ hφ n m hn hm hk,
    rfl⟩

theorem frobeniusPowerFixedField_normal (D : DegreeData G)
    [IsTopologicalGroup G] [T2Space G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (φ : D.FrobeniusElements K L hLK)
    (hφ : D.frobeniusExponent K L hLK φ = 1)
    (n m : ℕ) (hn : 0 < n) (hm : 0 < m) :
    let σ := D.frobeniusPowerOfDegreeOne K L hLK φ hφ n hn
    let σm := D.frobeniusPowerOfDegreeOne K L hLK φ hφ (n * m)
      (Nat.mul_pos hn hm)
    let S := D.frobeniusFixedField K L hLK σ
    let T := D.frobeniusFixedField K L hLK σm
    (extensionSubgroup S T
      (D.frobeniusPowerFixedField_le K L hLK φ hφ n m hn hm)).Normal := by
  dsimp only
  let σ := D.frobeniusPowerOfDegreeOne K L hLK φ hφ n hn
  let σm := D.frobeniusPowerOfDegreeOne K L hLK φ hφ (n * m)
    (Nat.mul_pos hn hm)
  let S := D.frobeniusFixedField K L hLK σ
  let T := D.frobeniusFixedField K L hLK σm
  let hSK := D.frobeniusFixedField_le K L hLK σ
  let hTK := D.frobeniusFixedField_le K L hLK σm
  let hTS := D.frobeniusPowerFixedField_le K L hLK φ hφ n m hn hm
  let C := D.frobeniusClosure K L hLK σ
  let Cm := D.frobeniusClosure K L hLK σm
  let : CommGroup C := D.frobeniusClosureCommGroup K L hLK σ
  have hCmC : Cm.toSubgroup ≤ C.toSubgroup :=
    D.frobeniusClosure_power_mul_le K L hLK φ hφ n m hn hm
  constructor
  intro t ht s
  have htT : t.1 ∈ T.toSubgroup :=
    (mem_extensionSubgroup_iff S T hTS t).1 ht
  let tK : K.field.toSubgroup := ⟨t.1, hSK t.2⟩
  let sK : K.field.toSubgroup := ⟨s.1, hSK s.2⟩
  have htFixed : tK ∈ D.frobeniusFixedSubgroupWithin K L hLK σm := by
    rw [← D.extensionSubgroup_frobeniusFixedField K L hLK σm]
    exact (mem_extensionSubgroup_iff K.field T hTK tK).2 htT
  have hsFixed : sK ∈ D.frobeniusFixedSubgroupWithin K L hLK σ := by
    rw [← D.extensionSubgroup_frobeniusFixedField K L hLK σ]
    exact (mem_extensionSubgroup_iff K.field S hSK sK).2 s.2
  let a : C := ⟨QuotientGroup.mk sK, hsFixed⟩
  let b : C := ⟨QuotientGroup.mk tK, hCmC htFixed⟩
  have hconj :
      (QuotientGroup.mk sK :
          K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK) *
        QuotientGroup.mk tK * (QuotientGroup.mk sK)⁻¹ =
          QuotientGroup.mk tK := by
    exact congrArg Subtype.val (by
      change a * b * a⁻¹ = b
      simp)
  apply (mem_extensionSubgroup_iff S T hTS _).2
  let cK : K.field.toSubgroup := ⟨s.1 * t.1 * s.1⁻¹, by
    exact K.field.toSubgroup.mul_mem
      (K.field.toSubgroup.mul_mem (hSK s.2) (hSK t.2))
      (K.field.toSubgroup.inv_mem (hSK s.2))⟩
  refine ⟨cK, ?_, rfl⟩
  change QuotientGroup.mk cK ∈ Cm.toSubgroup
  change QuotientGroup.mk sK * QuotientGroup.mk tK *
      (QuotientGroup.mk sK)⁻¹ ∈ Cm.toSubgroup
  rw [hconj]
  exact htFixed

theorem frobeniusPowerFixedField_isUnramified (D : DegreeData G)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    [TotallyDisconnectedSpace G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (φ : D.FrobeniusElements K L hLK)
    (hφ : D.frobeniusExponent K L hLK φ = 1)
    (n m : ℕ) (hn : 0 < n) (hm : 0 < m) :
    let σ := D.frobeniusPowerOfDegreeOne K L hLK φ hφ n hn
    let σm := D.frobeniusPowerOfDegreeOne K L hLK φ hφ (n * m)
      (Nat.mul_pos hn hm)
    let S := D.frobeniusFixedField K L hLK σ
    let T := D.frobeniusFixedField K L hLK σm
    let hTS := D.frobeniusPowerFixedField_le K L hLK φ hφ n m hn hm
    (DegreeData.AbstractExtension.mk T S hTS).IsUnramified D := by
  dsimp only
  let σ := D.frobeniusPowerOfDegreeOne K L hLK φ hφ n hn
  let σm := D.frobeniusPowerOfDegreeOne K L hLK φ hφ (n * m)
    (Nat.mul_pos hn hm)
  let S := D.frobeniusFixedField K L hLK σ
  let T := D.frobeniusFixedField K L hLK σm
  let hTS := D.frobeniusPowerFixedField_le K L hLK φ hφ n m hn hm
  rw [(DegreeData.AbstractExtension.mk T S hTS).isUnramified_iff_inertia_le D]
  intro x hx
  have hxI : x ∈ D.fieldInertia S := ⟨hx.1, hx.2⟩
  have hSI : D.fieldInertia S = D.fieldInertia L :=
    D.frobeniusFixedField_fieldInertia K L hLK σ
  have hTI : D.fieldInertia T = D.fieldInertia L :=
    D.frobeniusFixedField_fieldInertia K L hLK σm
  rw [hSI, ← hTI] at hxI
  exact hxI.1
 
theorem frobeniusPowerFixedField_finite (D : DegreeData G)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    [hLfinite : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK)]
    (φ : D.FrobeniusElements K L hLK)
    (hφ : D.frobeniusExponent K L hLK φ = 1)
    (n m : ℕ) (hn : 0 < n) (hm : 0 < m) :
    let σ := D.frobeniusPowerOfDegreeOne K L hLK φ hφ n hn
    let σm := D.frobeniusPowerOfDegreeOne K L hLK φ hφ (n * m)
      (Nat.mul_pos hn hm)
    let S := D.frobeniusFixedField K L hLK σ
    let T := D.frobeniusFixedField K L hLK σm
    let hTS := D.frobeniusPowerFixedField_le K L hLK φ hφ n m hn hm
    Finite (S.toSubgroup ⧸ extensionSubgroup S T hTS) := by
  dsimp only
  let σ := D.frobeniusPowerOfDegreeOne K L hLK φ hφ n hn
  let σm := D.frobeniusPowerOfDegreeOne K L hLK φ hφ (n * m)
    (Nat.mul_pos hn hm)
  let S := D.frobeniusFixedField K L hLK σ
  let T := D.frobeniusFixedField K L hLK σm
  let hSK := D.frobeniusFixedField_le K L hLK σ
  let hTK := D.frobeniusFixedField_le K L hLK σm
  let hTS := D.frobeniusPowerFixedField_le K L hLK φ hφ n m hn hm
  let hTKfinite : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field T hTK) :=
    D.frobeniusFixedField_finite K L hLK σm
  exact FiniteIntermediateField.finite_extension_of_le hTK hSK hTS

private theorem frobeniusPowerFixedField_relIndex (D : DegreeData G)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    [TotallyDisconnectedSpace G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (φ : D.FrobeniusElements K L hLK)
    (hφ : D.frobeniusExponent K L hLK φ = 1)
    (n m : ℕ) (hn : 0 < n) (hm : 0 < m) :
    let σ := D.frobeniusPowerOfDegreeOne K L hLK φ hφ n hn
    let σm := D.frobeniusPowerOfDegreeOne K L hLK φ hφ
      (n * m) (Nat.mul_pos hn hm)
    let S := D.frobeniusFixedField K L hLK σ
    let T := D.frobeniusFixedField K L hLK σm
    T.toSubgroup.relIndex S.toSubgroup = m := by
  dsimp only
  let σ := D.frobeniusPowerOfDegreeOne K L hLK φ hφ n hn
  let σm := D.frobeniusPowerOfDegreeOne K L hLK φ hφ
    (n * m) (Nat.mul_pos hn hm)
  let S := D.frobeniusFixedField K L hLK σ
  let T := D.frobeniusFixedField K L hLK σm
  let hTS := D.frobeniusPowerFixedField_le
    K L hLK φ hφ n m hn hm
  have hTSunramified : (DegreeData.AbstractExtension.mk T S hTS).IsUnramified D :=
    D.frobeniusPowerFixedField_isUnramified
      K L hLK φ hφ n m hn hm
  have hTSramification :
      (T.toSubgroup ⊓ D.degree.toMonoidHom.ker).relIndex
          (S.toSubgroup ⊓ D.degree.toMonoidHom.ker) = 1 := by
    rw [Subgroup.relIndex_eq_one]
    intro x hx
    exact ⟨hTSunramified hx, hx.2⟩
  rw [relIndex_eq_map_relIndex_mul_inf_ker_relIndex
      D.degree.toMonoidHom hTS,
    hTSramification, Nat.mul_one]
  let SR := D.frobeniusFixedResidueField K L hLK σ
  let TR := D.frobeniusFixedResidueField K L hLK σm
  have hSindex : (D.fieldImage S).index = (SR.residueDegree : ℕ) := by
    have h := D.fieldImageAdd_index SR
    change (D.fieldImage S).index = (SR.residueDegree : ℕ) at h
    exact h
  have hTindex : (D.fieldImage T).index = (TR.residueDegree : ℕ) := by
    have h := D.fieldImageAdd_index TR
    change (D.fieldImage T).index = (TR.residueDegree : ℕ) at h
    exact h
  have hresidueMul :
      (T.toSubgroup.map D.degree.toMonoidHom).relIndex
          (S.toSubgroup.map D.degree.toMonoidHom) *
          (SR.residueDegree : ℕ) = (TR.residueDegree : ℕ) := by
    rw [← hSindex, ← hTindex, D.fieldImage_eq_map, D.fieldImage_eq_map]
    exact Subgroup.relIndex_mul_index (Subgroup.map_mono hTS)
  rw [D.frobeniusFixedResidueField_residueDegree K L hLK σ,
    D.frobeniusFixedResidueField_residueDegree K L hLK σm] at hresidueMul
  rw [show D.frobeniusExponent K L hLK σm = n * m by
      exact D.frobeniusExponent_powerOfDegreeOne
        K L hLK φ hφ (n * m) (Nat.mul_pos hn hm),
    show D.frobeniusExponent K L hLK σ = n by
      exact D.frobeniusExponent_powerOfDegreeOne
        K L hLK φ hφ n hn] at hresidueMul
  apply Nat.eq_of_mul_eq_mul_right (Nat.mul_pos hn K.residueDegree.property)
  calc
    (T.toSubgroup.map D.degree.toMonoidHom).relIndex
          (S.toSubgroup.map D.degree.toMonoidHom) *
        (n * (K.residueDegree : ℕ)) =
      (n * m) * (K.residueDegree : ℕ) := hresidueMul
    _ = m * (n * (K.residueDegree : ℕ)) := by ac_rfl

theorem frobeniusPowerFixedField_quotientFinite (D : DegreeData G)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    [TotallyDisconnectedSpace G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (φ : D.FrobeniusElements K L hLK)
    (hφ : D.frobeniusExponent K L hLK φ = 1)
    (n m : ℕ) (hn : 0 < n) (hm : 0 < m) :
    let σ := D.frobeniusPowerOfDegreeOne K L hLK φ hφ n hn
    let σm := D.frobeniusPowerOfDegreeOne K L hLK φ hφ
      (n * m) (Nat.mul_pos hn hm)
    let S := D.frobeniusFixedField K L hLK σ
    let T := D.frobeniusFixedField K L hLK σm
    let hTS := D.frobeniusPowerFixedField_le
      K L hLK φ hφ n m hn hm
    Finite (S.toSubgroup ⧸ extensionSubgroup S T hTS) := by
  dsimp only
  let σ := D.frobeniusPowerOfDegreeOne K L hLK φ hφ n hn
  let σm := D.frobeniusPowerOfDegreeOne K L hLK φ hφ
    (n * m) (Nat.mul_pos hn hm)
  let S := D.frobeniusFixedField K L hLK σ
  let T := D.frobeniusFixedField K L hLK σm
  let hTS := D.frobeniusPowerFixedField_le
    K L hLK φ hφ n m hn hm
  apply (Subgroup.index_ne_zero_iff_finite).mp
  change T.toSubgroup.relIndex S.toSubgroup ≠ 0
  rw [D.frobeniusPowerFixedField_relIndex
    K L hLK φ hφ n m hn hm]
  exact hm.ne'
 
theorem frobeniusPowerFixedField_quotientCard (D : DegreeData G)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    [TotallyDisconnectedSpace G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (φ : D.FrobeniusElements K L hLK)
    (hφ : D.frobeniusExponent K L hLK φ = 1)
    (n m : ℕ) (hn : 0 < n) (hm : 0 < m) :
    let σ := D.frobeniusPowerOfDegreeOne K L hLK φ hφ n hn
    let σm := D.frobeniusPowerOfDegreeOne K L hLK φ hφ
      (n * m) (Nat.mul_pos hn hm)
    let S := D.frobeniusFixedField K L hLK σ
    let T := D.frobeniusFixedField K L hLK σm
    let hTS := D.frobeniusPowerFixedField_le
      K L hLK φ hφ n m hn hm
    Nat.card (S.toSubgroup ⧸ extensionSubgroup S T hTS) = m := by
  dsimp only
  let σ := D.frobeniusPowerOfDegreeOne K L hLK φ hφ n hn
  let σm := D.frobeniusPowerOfDegreeOne K L hLK φ hφ
    (n * m) (Nat.mul_pos hn hm)
  let S := D.frobeniusFixedField K L hLK σ
  let T := D.frobeniusFixedField K L hLK σm
  let hTS := D.frobeniusPowerFixedField_le
    K L hLK φ hφ n m hn hm
  let : Finite (S.toSubgroup ⧸ extensionSubgroup S T hTS) :=
    D.frobeniusPowerFixedField_quotientFinite
      K L hLK φ hφ n m hn hm
  calc
    Nat.card (S.toSubgroup ⧸ extensionSubgroup S T hTS) =
        (extensionSubgroup S T hTS).index := rfl
    _ = T.toSubgroup.relIndex S.toSubgroup := by
      rfl
    _ = m :=
      D.frobeniusPowerFixedField_relIndex
        K L hLK φ hφ n m hn hm

theorem frobeniusPowerFixedField_generator (D : DegreeData G)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    [TotallyDisconnectedSpace G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    [hLfinite : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK)]
    (φ : D.FrobeniusElements K L hLK)
    (hφ : D.frobeniusExponent K L hLK φ = 1)
    (n m : ℕ) (hn : 0 < n) (hm : 0 < m) :
    let σ := D.frobeniusPowerOfDegreeOne K L hLK φ hφ n hn
    let σm := D.frobeniusPowerOfDegreeOne K L hLK φ hφ (n * m)
      (Nat.mul_pos hn hm)
    let S := D.frobeniusFixedField K L hLK σ
    let T := D.frobeniusFixedField K L hLK σm
    let hTS := D.frobeniusPowerFixedField_le K L hLK φ hφ n m hn hm
    let hTSnormal : (extensionSubgroup S T hTS).Normal :=
      D.frobeniusPowerFixedField_normal K L hLK φ hφ n m hn hm
    letI := hTSnormal
    ∃ s : S.toSubgroup,
      D.frobeniusFixedFieldToClosure K L hLK σ s =
          D.frobeniusInClosure K L hLK σ ∧
      D.normalizedDegree (D.frobeniusFixedResidueField K L hLK σ) s =
        Multiplicative.ofAdd (1 : ZHat) ∧
      ∀ x : S.toSubgroup ⧸ extensionSubgroup S T hTS,
        x ∈ Subgroup.zpowers (QuotientGroup.mk s) := by
  dsimp only
  let σ := D.frobeniusPowerOfDegreeOne K L hLK φ hφ n hn
  let σm := D.frobeniusPowerOfDegreeOne K L hLK φ hφ (n * m)
    (Nat.mul_pos hn hm)
  let S := D.frobeniusFixedField K L hLK σ
  let T := D.frobeniusFixedField K L hLK σm
  let hTS := D.frobeniusPowerFixedField_le K L hLK φ hφ n m hn hm
  let hTSnormal : (extensionSubgroup S T hTS).Normal :=
    D.frobeniusPowerFixedField_normal K L hLK φ hφ n m hn hm
  let := hTSnormal
  let k : K.field.toSubgroup := Quotient.out σ.1
  have hkσ :
      (QuotientGroup.mk k :
        K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK) = σ.1 :=
    Quotient.out_eq' σ.1
  have hkClosure : QuotientGroup.mk k ∈
      (D.frobeniusClosure K L hLK σ).toSubgroup := by
    rw [hkσ]
    exact (D.frobeniusInClosure K L hLK σ).2
  let s : S.toSubgroup := ⟨k.1, ⟨k, hkClosure, rfl⟩⟩
  have hsClosure :
      D.frobeniusFixedFieldToClosure K L hLK σ s =
        D.frobeniusInClosure K L hLK σ := by
    apply Subtype.ext
    exact hkσ
  have hsDegree :
      D.normalizedDegree (D.frobeniusFixedResidueField K L hLK σ) s =
        Multiplicative.ofAdd (1 : ZHat) := by
    rw [← D.frobeniusFixedField_normalizedDegree_compatibility
      K L hLK σ s, hsClosure]
    exact D.fixedFieldNormalizedDegree_generator K L hLK σ
  let hTSfinite : Finite
      (S.toSubgroup ⧸ extensionSubgroup S T hTS) :=
    D.frobeniusPowerFixedField_finite K L hLK φ hφ n m hn hm
  have hTSunramified : (DegreeData.AbstractExtension.mk T S hTS).IsUnramified D :=
    D.frobeniusPowerFixedField_isUnramified
      K L hLK φ hφ n m hn hm
  let SR := D.frobeniusFixedResidueField K L hLK σ
  let : (extensionSubgroup SR.field T hTS).Normal := by
    change (extensionSubgroup S T hTS).Normal
    exact hTSnormal
  let : Finite
      (SR.field.toSubgroup ⧸ extensionSubgroup SR.field T hTS) := by
    change Finite (S.toSubgroup ⧸ extensionSubgroup S T hTS)
    exact hTSfinite
  have hTSunramifiedR :
      (DegreeData.AbstractExtension.mk T SR.field hTS).IsUnramified D := by
    change (DegreeData.AbstractExtension.mk T S hTS).IsUnramified D
    exact hTSunramified
  refine ⟨s, hsClosure, hsDegree, ?_⟩
  exact D.quotient_generator_of_unramified_degree_one
    SR T hTS hTSunramifiedR s hsDegree
end DegreeData
end degreeOnePowerFields
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
 
def toGaloisSubextension (L : FiniteGaloisSubextension K) :
    DegreeData.GaloisSubextension K where
  field := L.field
  below := L.below
  normal := L.normal

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

def toGaloisExtensionQuotientMulEquiv (L : FiniteGaloisSubextension K) :
    L.extensionQuotient ≃* L.toGaloisSubextension.extensionQuotient :=
  L.extensionQuotientMulEquiv.trans
    L.toGaloisSubextension.extensionQuotientMulEquiv.symm
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

/- ClassFieldTheory.AbstractClassFieldTheory.Reciprocity.Construction.FrobeniusFixedFieldTower -/
section
universe u
namespace ClassFormation
open KummerTheory
open CyclicCohomology
noncomputable section
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
namespace DegreeData

noncomputable def frobeniusFixedAbstractField
    (D : DegreeData G) [IsTopologicalGroup G]
    (K : DegreeData.FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (σ : D.FrobeniusElements K L hLK)
    [Finite ((baseField G).toSubgroup ⧸
      extensionSubgroup (baseField G)
        (D.frobeniusFixedField K L hLK σ)
        (le_baseField (D.frobeniusFixedField K L hLK σ)))] :
    FiniteAbstractField G where
  field := D.frobeniusFixedField K L hLK σ
  finite := inferInstance

structure FrobeniusFixedFieldTower
    (D : DegreeData G) [IsTopologicalGroup G] where
   
  ambientBase : DegreeData.FiniteResidueAbstractField D
   
  ambient : GaloisSubextension ambientBase.field
   
  baseFrobenius :
    D.FrobeniusElements ambientBase ambient.field ambient.below
   
  fieldFrobenius :
    D.FrobeniusElements ambientBase ambient.field ambient.below
   
  field_le_base :
    (D.frobeniusFixedField ambientBase ambient.field ambient.below
        fieldFrobenius).toSubgroup ≤
      (D.frobeniusFixedField ambientBase ambient.field ambient.below
        baseFrobenius).toSubgroup
   
  finiteQuotient :
    Finite
      ((D.frobeniusFixedField ambientBase ambient.field ambient.below
          baseFrobenius).toSubgroup ⧸
        extensionSubgroup
          (D.frobeniusFixedField ambientBase ambient.field ambient.below
            baseFrobenius)
          (D.frobeniusFixedField ambientBase ambient.field ambient.below
            fieldFrobenius)
          field_le_base)
   
  baseAbsoluteFinite :
    Finite
      ((baseField G).toSubgroup ⧸
        extensionSubgroup (baseField G)
          (D.frobeniusFixedField ambientBase ambient.field ambient.below
            baseFrobenius)
          (le_baseField
            (D.frobeniusFixedField ambientBase ambient.field ambient.below
              baseFrobenius)))
   
  fieldAbsoluteFinite :
    Finite
      ((baseField G).toSubgroup ⧸
        extensionSubgroup (baseField G)
          (D.frobeniusFixedField ambientBase ambient.field ambient.below
            fieldFrobenius)
          (le_baseField
            (D.frobeniusFixedField ambientBase ambient.field ambient.below
              fieldFrobenius)))
   
  normal :
    (extensionSubgroup
      (D.frobeniusFixedField ambientBase ambient.field ambient.below
        baseFrobenius)
      (D.frobeniusFixedField ambientBase ambient.field ambient.below
        fieldFrobenius)
      field_le_base).Normal
   
  commute :
    baseFrobenius.1 * fieldFrobenius.1 =
      fieldFrobenius.1 * baseFrobenius.1
namespace FrobeniusFixedFieldTower
variable {D : DegreeData G} [IsTopologicalGroup G]
 
noncomputable def base (T : FrobeniusFixedFieldTower D) :
    FiniteAbstractField G := by
  letI : Finite
      ((baseField G).toSubgroup ⧸
        extensionSubgroup (baseField G)
          (D.frobeniusFixedField T.ambientBase T.ambient.field T.ambient.below
            T.baseFrobenius)
          (le_baseField
            (D.frobeniusFixedField T.ambientBase T.ambient.field T.ambient.below
              T.baseFrobenius))) :=
    T.baseAbsoluteFinite
  exact D.frobeniusFixedAbstractField T.ambientBase T.ambient.field
    T.ambient.below T.baseFrobenius
 
noncomputable def field (T : FrobeniusFixedFieldTower D) :
    FiniteAbstractField G := by
  letI : Finite
      ((baseField G).toSubgroup ⧸
        extensionSubgroup (baseField G)
          (D.frobeniusFixedField T.ambientBase T.ambient.field T.ambient.below
            T.fieldFrobenius)
          (le_baseField
            (D.frobeniusFixedField T.ambientBase T.ambient.field T.ambient.below
              T.fieldFrobenius))) :=
    T.fieldAbsoluteFinite
  exact D.frobeniusFixedAbstractField T.ambientBase T.ambient.field
    T.ambient.below T.fieldFrobenius
 
noncomputable def extension (T : FrobeniusFixedFieldTower D) :
    FiniteAbstractFieldExtension G where
  field := T.field
  base := T.base
  below := T.field_le_base
  finiteQuotient := T.finiteQuotient
 
structure Representative (T : FrobeniusFixedFieldTower D) where
   
  element : T.extension.base.field.toSubgroup
   
  mapsToFrobenius :
    D.frobeniusFixedFieldToClosure T.ambientBase T.ambient.field
        T.ambient.below T.baseFrobenius element =
      D.frobeniusInClosure T.ambientBase T.ambient.field
        T.ambient.below T.baseFrobenius
 
instance extensionNormal (T : FrobeniusFixedFieldTower D) :
    (extensionSubgroup T.extension.base.field T.extension.field.field
      T.extension.below).Normal :=
  T.normal
 
structure CyclicGenerator (T : FrobeniusFixedFieldTower D)
    extends Representative T where
   
  generates :
    ∀ x :
      T.extension.base.field.toSubgroup ⧸
        extensionSubgroup T.extension.base.field T.extension.field.field
          T.extension.below,
      x ∈ Subgroup.zpowers (QuotientGroup.mk toRepresentative.element)
 
instance extensionFinite (T : FrobeniusFixedFieldTower D) :
    Finite
      (T.extension.base.field.toSubgroup ⧸
        extensionSubgroup T.extension.base.field T.extension.field.field
          T.extension.below) :=
  T.finiteQuotient
 
instance fieldAbsoluteFiniteInstance (T : FrobeniusFixedFieldTower D) :
    Finite
      ((baseField G).toSubgroup ⧸
        extensionSubgroup (baseField G)
          (D.frobeniusFixedField T.ambientBase T.ambient.field T.ambient.below
            T.fieldFrobenius)
          (le_baseField
            (D.frobeniusFixedField T.ambientBase T.ambient.field T.ambient.below
              T.fieldFrobenius))) :=
  T.fieldAbsoluteFinite
end FrobeniusFixedFieldTower

structure FiniteAmbientFrobeniusFixedFieldTower
    (D : DegreeData G) [IsTopologicalGroup G]
    extends FrobeniusFixedFieldTower D where
   
  ambientFinite : Finite toFrobeniusFixedFieldTower.ambient.extensionQuotient
namespace FiniteAmbientFrobeniusFixedFieldTower
variable {D : DegreeData G} [IsTopologicalGroup G]

instance ambientQuotientFinite
    (T : FiniteAmbientFrobeniusFixedFieldTower D) :
    Finite T.ambient.extensionQuotient :=
  T.ambientFinite

noncomputable instance ambientRepresentedQuotientFinite
    (T : FiniteAmbientFrobeniusFixedFieldTower D) :
    Finite
      (T.ambientBase.field.toSubgroup ⧸
        extensionSubgroup T.ambientBase.field T.ambient.field
          T.ambient.below) :=
  Finite.of_equiv T.ambient.extensionQuotient
    T.ambient.extensionQuotientMulEquiv
end FiniteAmbientFrobeniusFixedFieldTower

structure FrobeniusPowerFixedFieldTower
    (D : DegreeData G) [IsTopologicalGroup G] where
   
  ambientBase : DegreeData.FiniteResidueAbstractField D
   
  ambient : FiniteGaloisSubextension ambientBase.field
   
  frobenius :
    D.FrobeniusElements ambientBase ambient.field ambient.below
   
  exponent_one :
    D.frobeniusExponent ambientBase ambient.field ambient.below frobenius = 1
   
  n : ℕ
   
  n_pos : 0 < n
   
  baseAbsoluteFinite :
    let σ := D.frobeniusPowerOfDegreeOne ambientBase ambient.field
      ambient.below frobenius exponent_one n n_pos
    Finite
      ((baseField G).toSubgroup ⧸
        extensionSubgroup (baseField G)
          (D.frobeniusFixedField ambientBase ambient.field ambient.below σ)
          (le_baseField
            (D.frobeniusFixedField ambientBase ambient.field ambient.below σ)))
   
  fieldAbsoluteFinite :
    let σn := D.frobeniusPowerOfDegreeOne ambientBase ambient.field
      ambient.below frobenius exponent_one (n * n) (Nat.mul_pos n_pos n_pos)
    Finite
      ((baseField G).toSubgroup ⧸
        extensionSubgroup (baseField G)
          (D.frobeniusFixedField ambientBase ambient.field ambient.below σn)
          (le_baseField
            (D.frobeniusFixedField ambientBase ambient.field ambient.below σn)))
   
  relativeFinite :
    let σ := D.frobeniusPowerOfDegreeOne ambientBase ambient.field
      ambient.below frobenius exponent_one n n_pos
    let σn := D.frobeniusPowerOfDegreeOne ambientBase ambient.field
      ambient.below frobenius exponent_one (n * n) (Nat.mul_pos n_pos n_pos)
    let hTS := D.frobeniusPowerFixedField_le ambientBase ambient.field
      ambient.below frobenius exponent_one n n n_pos n_pos
    Finite
      ((D.frobeniusFixedField ambientBase ambient.field ambient.below σ).toSubgroup ⧸
        extensionSubgroup
          (D.frobeniusFixedField ambientBase ambient.field ambient.below σ)
          (D.frobeniusFixedField ambientBase ambient.field ambient.below σn)
          hTS)
namespace FrobeniusPowerFixedFieldTower
variable {D : DegreeData G} [IsTopologicalGroup G]
 
noncomputable def ambientGalois (P : FrobeniusPowerFixedFieldTower D) :
    GaloisSubextension P.ambientBase.field :=
  P.ambient.toGaloisSubextension
 
def baseFrobenius (P : FrobeniusPowerFixedFieldTower D) :
    D.FrobeniusElements P.ambientBase P.ambient.field P.ambient.below :=
  D.frobeniusPowerOfDegreeOne P.ambientBase P.ambient.field P.ambient.below
    P.frobenius P.exponent_one P.n P.n_pos
 
def fieldFrobenius (P : FrobeniusPowerFixedFieldTower D) :
    D.FrobeniusElements P.ambientBase P.ambient.field P.ambient.below :=
  D.frobeniusPowerOfDegreeOne P.ambientBase P.ambient.field P.ambient.below
    P.frobenius P.exponent_one (P.n * P.n)
      (Nat.mul_pos P.n_pos P.n_pos)
 
theorem frobenius_commute_base (P : FrobeniusPowerFixedFieldTower D) :
    P.frobenius.1 * P.baseFrobenius.1 =
      P.baseFrobenius.1 * P.frobenius.1 := by
  simpa [baseFrobenius] using
    ((Commute.refl P.frobenius.1).pow_right P.n).eq
 
theorem frobenius_commute_field (P : FrobeniusPowerFixedFieldTower D) :
    P.frobenius.1 * P.fieldFrobenius.1 =
      P.fieldFrobenius.1 * P.frobenius.1 := by
  simpa [fieldFrobenius] using
    ((Commute.refl P.frobenius.1).pow_right (P.n * P.n)).eq
 
theorem field_le_base (P : FrobeniusPowerFixedFieldTower D) :
    (D.frobeniusFixedField P.ambientBase P.ambient.field P.ambient.below
        P.fieldFrobenius).toSubgroup ≤
      (D.frobeniusFixedField P.ambientBase P.ambient.field P.ambient.below
        P.baseFrobenius).toSubgroup :=
  D.frobeniusPowerFixedField_le P.ambientBase P.ambient.field P.ambient.below
    P.frobenius P.exponent_one P.n P.n P.n_pos P.n_pos

instance relativeRepresentedQuotientFinite
    (P : FrobeniusPowerFixedFieldTower D) :
    Finite
      ((D.frobeniusFixedField P.ambientBase P.ambient.field P.ambient.below
          P.baseFrobenius).toSubgroup ⧸
        extensionSubgroup
          (D.frobeniusFixedField P.ambientBase P.ambient.field P.ambient.below
            P.baseFrobenius)
          (D.frobeniusFixedField P.ambientBase P.ambient.field P.ambient.below
            P.fieldFrobenius)
          P.field_le_base) :=
  P.relativeFinite

instance fieldRepresentedAbsoluteFinite
    (P : FrobeniusPowerFixedFieldTower D) :
    Finite
      ((baseField G).toSubgroup ⧸
        extensionSubgroup (baseField G)
          (D.frobeniusFixedField P.ambientBase P.ambient.field P.ambient.below
            P.fieldFrobenius)
          (le_baseField
            (D.frobeniusFixedField P.ambientBase P.ambient.field P.ambient.below
              P.fieldFrobenius))) :=
  P.fieldAbsoluteFinite
 
noncomputable def toFrobeniusFixedFieldTower
    (P : FrobeniusPowerFixedFieldTower D) [T2Space G] :
    FrobeniusFixedFieldTower D where
  ambientBase := P.ambientBase
  ambient := P.ambientGalois
  baseFrobenius := P.baseFrobenius
  fieldFrobenius := P.fieldFrobenius
  field_le_base := P.field_le_base
  finiteQuotient := P.relativeFinite
  baseAbsoluteFinite := P.baseAbsoluteFinite
  fieldAbsoluteFinite := P.fieldAbsoluteFinite
  normal :=
    D.frobeniusPowerFixedField_normal P.ambientBase P.ambient.field
      P.ambient.below P.frobenius P.exponent_one P.n P.n P.n_pos P.n_pos
  commute := by
    change P.baseFrobenius.1 * P.fieldFrobenius.1 =
      P.fieldFrobenius.1 * P.baseFrobenius.1
    simpa [baseFrobenius, fieldFrobenius] using
      ((Commute.refl P.frobenius.1).pow_pow P.n (P.n * P.n)).eq

noncomputable def toFiniteAmbientFrobeniusFixedFieldTower
    (P : FrobeniusPowerFixedFieldTower D) [T2Space G] :
    FiniteAmbientFrobeniusFixedFieldTower D where
  toFrobeniusFixedFieldTower := P.toFrobeniusFixedFieldTower
  ambientFinite := by
    change Finite P.ambient.toGaloisSubextension.extensionQuotient
    exact Finite.of_equiv P.ambient.extensionQuotient
      P.ambient.toGaloisExtensionQuotientMulEquiv
end FrobeniusPowerFixedFieldTower
end DegreeData
end
end ClassFormation
end

/- ClassFieldTheory.AbstractClassFieldTheory.Reciprocity.Construction.FrobeniusClosureCommutation -/
section
universe u
namespace ClassFormation
open KummerTheory
open CyclicCohomology
noncomputable section
open CategoryTheory
open scoped BigOperators
section frobeniusClosureCommutation
variable {G : Type u} [Group G] [TopologicalSpace G]
namespace DegreeData

theorem frobeniusClosure_commutes_of_commutes_generator (D : DegreeData G)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    [TotallyDisconnectedSpace G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (σ : D.FrobeniusElements K L hLK)
    (q : K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK)
    (hq : q * σ.1 = σ.1 * q)
    (c : D.frobeniusClosure K L hLK σ) :
    q * c.1 = c.1 * q := by
  let : IsClosed
      (D.extensionInertiaWithin K.field L hLK : Set K.field.toSubgroup) :=
    D.extensionInertiaWithin_isClosed K L hLK
  let : T2Space
      (K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK) := by
    infer_instance
  let Q := K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK
  let X : Set Q := Set.range (fun _ : Unit => σ.1)
  have hclosure : Subgroup.closure X ≤
      Subgroup.centralizer ({q} : Set Q) := by
    rw [Subgroup.closure_le]
    rintro x ⟨i, rfl⟩
    exact Subgroup.mem_centralizer_singleton_iff.mpr hq.symm
  have htop : (Subgroup.closure X).topologicalClosure ≤
      Subgroup.centralizer ({q} : Set Q) :=
    Subgroup.topologicalClosure_minimal _ hclosure
      (Set.isClosed_centralizer (M := Q) ({q} : Set Q))
  have hc : c.1 ∈ (Subgroup.closure X).topologicalClosure := c.2
  exact (Subgroup.mem_centralizer_singleton_iff.mp (htop hc)).symm

theorem conjugate_frobeniusFixedField_eq_of_commutes (D : DegreeData G)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    [TotallyDisconnectedSpace G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (σ : D.FrobeniusElements K L hLK)
    (q : K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK)
    (hq : q * σ.1 = σ.1 * q) :
    let k : K.field.toSubgroup := Quotient.out q
    conjugateClosedSubgroup (D.frobeniusFixedField K L hLK σ) k.1⁻¹ =
      D.frobeniusFixedField K L hLK σ := by
  dsimp only
  let T := D.frobeniusFixedField K L hLK σ
  let k : K.field.toSubgroup := Quotient.out q
  have hkq :
      (QuotientGroup.mk k :
        K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK) = q :=
    Quotient.out_eq' q
  ext x
  change x ∈ conjugateClosedSubgroup
      (D.frobeniusFixedField K L hLK σ) k.1⁻¹ ↔
    x ∈ D.frobeniusFixedField K L hLK σ
  rw [conjugateClosedSubgroup_mem]
  constructor
  · intro hx
    obtain ⟨t, htClosure, htx⟩ := hx
    let xK : K.field.toSubgroup := ⟨x, by
      have htK : t.1 ∈ K.field.toSubgroup := t.2
      have htxval : t.1 = k.1⁻¹ * x * k.1 := by simpa using htx
      have : x = k.1 * t.1 * k.1⁻¹ := by
        calc
          x = k.1 * (k.1⁻¹ * x * k.1) * k.1⁻¹ := by simp [mul_assoc]
          _ = k.1 * t.1 * k.1⁻¹ := by rw [htxval]
      rw [this]
      exact K.field.toSubgroup.mul_mem
        (K.field.toSubgroup.mul_mem k.2 htK) (K.field.toSubgroup.inv_mem k.2)⟩
    have hcomm := D.frobeniusClosure_commutes_of_commutes_generator
      K L hLK σ q hq ⟨QuotientGroup.mk t, htClosure⟩
    have hcomm' : q * QuotientGroup.mk t = QuotientGroup.mk t * q := hcomm
    have hxClosure : QuotientGroup.mk xK ∈
        (D.frobeniusClosure K L hLK σ).toSubgroup := by
      have hqconj : q * QuotientGroup.mk t * q⁻¹ = QuotientGroup.mk t := by
        calc
          q * QuotientGroup.mk t * q⁻¹ =
              (QuotientGroup.mk t * q) * q⁻¹ := by rw [hcomm']
          _ = QuotientGroup.mk t := by simp
      change QuotientGroup.mk xK ∈
        (D.frobeniusClosure K L hLK σ).toSubgroup
      have hxval : xK = k * t * k⁻¹ := by
        apply Subtype.ext
        dsimp [xK]
        have htxval : t.1 = k.1⁻¹ * x * k.1 := by simpa using htx
        calc
          x = k.1 * (k.1⁻¹ * x * k.1) * k.1⁻¹ := by simp [mul_assoc]
          _ = k.1 * t.1 * k.1⁻¹ := by rw [htxval]
      rw [hxval]
      change (QuotientGroup.mk k :
          K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK) *
          QuotientGroup.mk t * (QuotientGroup.mk k)⁻¹ ∈
        (D.frobeniusClosure K L hLK σ).toSubgroup
      rw [hkq, hqconj]
      exact htClosure
    exact ⟨xK, hxClosure, rfl⟩
  · intro hx
    obtain ⟨t, htClosure, htx⟩ := hx
    let yK : K.field.toSubgroup := ⟨k.1⁻¹ * x * k.1, by
      have htK : t.1 ∈ K.field.toSubgroup := t.2
      rw [← htx]
      exact K.field.toSubgroup.mul_mem
        (K.field.toSubgroup.mul_mem (K.field.toSubgroup.inv_mem k.2) htK) k.2⟩
    have hcomm := D.frobeniusClosure_commutes_of_commutes_generator
      K L hLK σ q hq ⟨QuotientGroup.mk t, htClosure⟩
    have hcomm' : q * QuotientGroup.mk t = QuotientGroup.mk t * q := hcomm
    have hyClosure : QuotientGroup.mk yK ∈
        (D.frobeniusClosure K L hLK σ).toSubgroup := by
      have hqconj : q⁻¹ * QuotientGroup.mk t * q = QuotientGroup.mk t := by
        calc
          q⁻¹ * QuotientGroup.mk t * q =
              q⁻¹ * (QuotientGroup.mk t * q) := by simp [mul_assoc]
          _ = q⁻¹ * (q * QuotientGroup.mk t) := by rw [hcomm']
          _ = QuotientGroup.mk t := by simp
      have hyval : yK = k⁻¹ * t * k := by
        apply Subtype.ext
        dsimp [yK]
        have htxval : t.1 = x := by simpa using htx
        rw [htxval]
      rw [hyval]
      change (QuotientGroup.mk k :
          K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK)⁻¹ *
          QuotientGroup.mk t * QuotientGroup.mk k ∈
        (D.frobeniusClosure K L hLK σ).toSubgroup
      rw [hkq, hqconj]
      exact htClosure
    refine ⟨yK, hyClosure, ?_⟩
    simp [yK]
end DegreeData
end frobeniusClosureCommutation
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

noncomputable def conjugateStableAction
    {R : IntegralRepGroupType} [Group R] [TopologicalSpace R] [ContinuousMul R]
    (B : Rep ℤ R) (F : ClosedSubgroup R) (s : R)
    (hF : conjugateClosedSubgroup F s = F)
    (a : ambientFixedAddSubgroup B F) : ambientFixedAddSubgroup B F :=
  hF ▸ conjugateFixedElement B F s a
private theorem transport_fixed_coe
    {R : IntegralRepGroupType} [Group R] [TopologicalSpace R]
    (B : Rep ℤ R) (F' F : ClosedSubgroup R) (h : F' = F)
    (a : ambientFixedAddSubgroup B F') :
    (((h ▸ a : ambientFixedAddSubgroup B F) : B.V)) = a.1 := by
  cases h
  rfl
private theorem relativeNorm_transport_coe
    {R : IntegralRepGroupType} [Group R] [TopologicalSpace R]
    (B : Rep ℤ R)
    (F' E' F E : ClosedSubgroup R)
    (hF : F' = F) (hE : E' = E)
    (hE'F' : E'.toSubgroup ≤ F'.toSubgroup)
    (hEF : E.toSubgroup ≤ F.toSubgroup)
    [Finite (F'.toSubgroup ⧸ extensionSubgroup F' E' hE'F')]
    [Finite (F.toSubgroup ⧸ extensionSubgroup F E hEF)]
    (a : ambientFixedAddSubgroup B E') :
    ((relativeNorm B F E hEF (hE ▸ a) : ambientFixedAddSubgroup B F) : B.V) =
      ((relativeNorm B F' E' hE'F' a : ambientFixedAddSubgroup B F') : B.V) := by
  cases hF
  cases hE
  rfl
 
@[simp]
theorem conjugateStableAction_coe
    {R : IntegralRepGroupType} [Group R] [TopologicalSpace R] [ContinuousMul R]
    (B : Rep ℤ R) (F : ClosedSubgroup R) (s : R)
    (hF : conjugateClosedSubgroup F s = F)
    (a : ambientFixedAddSubgroup B F) :
    ((conjugateStableAction B F s hF a : ambientFixedAddSubgroup B F) : B.V) =
      B.ρ s⁻¹ a.1 := by
  exact transport_fixed_coe B _ F hF _

theorem relativeNorm_conjugateStableAction
    {R : IntegralRepGroupType} [Group R] [TopologicalSpace R] [ContinuousMul R]
    (B : Rep ℤ R) (F E : ClosedSubgroup R)
    (hEF : E.toSubgroup ≤ F.toSubgroup) (s : R)
    [Finite (F.toSubgroup ⧸ extensionSubgroup F E hEF)]
    (hF : conjugateClosedSubgroup F s = F)
    (hE : conjugateClosedSubgroup E s = E)
    (a : ambientFixedAddSubgroup B E) :
    relativeNorm B F E hEF (conjugateStableAction B E s hE a) =
      conjugateStableAction B F s hF (relativeNorm B F E hEF a) := by
  let hConj := conjugateClosedSubgroup_mono hEF s
  let : Finite ((conjugateClosedSubgroup F s).toSubgroup ⧸
      extensionSubgroup (conjugateClosedSubgroup F s)
        (conjugateClosedSubgroup E s) hConj) :=
    finite_conjugateExtension F E hEF s
  have hs := congrArg Subtype.val
    (relativeNorm_conjugate_apply B F E hEF s a)
  apply Subtype.ext
  calc
    ((relativeNorm B F E hEF (conjugateStableAction B E s hE a) :
        ambientFixedAddSubgroup B F) : B.V) =
        ((relativeNorm B (conjugateClosedSubgroup F s)
          (conjugateClosedSubgroup E s) hConj
          (conjugateFixedElement B E s a) :
            ambientFixedAddSubgroup B (conjugateClosedSubgroup F s)) : B.V) := by
      exact relativeNorm_transport_coe B
        (conjugateClosedSubgroup F s) (conjugateClosedSubgroup E s) F E
        hF hE hConj hEF (conjugateFixedElement B E s a)
    _ = ((conjugateFixedElement B F s (relativeNorm B F E hEF a) :
          ambientFixedAddSubgroup B (conjugateClosedSubgroup F s)) : B.V) := hs
    _ = ((conjugateStableAction B F s hF (relativeNorm B F E hEF a) :
          ambientFixedAddSubgroup B F) : B.V) :=
      (transport_fixed_coe B _ F hF _).symm

theorem rep_norm_eq_generatorPowerSum
    {Q : IntegralRepGroupType} [Group Q] [Fintype Q]
    (B : Rep ℤ Q) (g : Q) (hg : ∀ q, q ∈ Subgroup.zpowers g)
    (n : ℕ) (hcard : Fintype.card Q = n) (x : B.V) :
    B.norm.hom x = ∑ i : Fin n, B.ρ (g ^ i.1) x := by
  classical
  have horder : orderOf g = n := by
    calc
      orderOf g = Nat.card Q :=
        orderOf_eq_card_of_forall_mem_zpowers hg
      _ = Fintype.card Q := Nat.card_eq_fintype_card
      _ = n := hcard
  let e : Fin n ≃ Q := Equiv.ofBijective (fun i => g ^ i.1) (by
    constructor
    · intro i j hij
      apply Fin.ext
      have hmod : i.1 ≡ j.1 [MOD orderOf g] :=
        (pow_eq_pow_iff_modEq).mp hij
      rw [horder] at hmod
      exact hmod.eq_of_lt_of_lt i.2 j.2
    · intro q
      have himage :
          Finset.image (fun i => g ^ i) (Finset.range n) = Finset.univ := by
        rw [← horder]
        exact IsCyclic.image_range_orderOf hg
      have hq : q ∈ Finset.image (fun i => g ^ i) (Finset.range n) := by
        rw [himage]
        simp
      obtain ⟨i, hi, hiq⟩ := Finset.mem_image.mp hq
      exact ⟨⟨i, Finset.mem_range.mp hi⟩, hiq⟩)
  have hsum : (∑ q : Q, B.ρ q x) =
      ∑ i : Fin n, B.ρ (g ^ i.1) x :=
    (e.sum_comp (fun q : Q => B.ρ q x)).symm
  simpa [Rep.norm, Representation.norm] using hsum

theorem rep_action_pow_eq_iterate {R : IntegralRepGroupType} [Group R]
    (B : Rep ℤ R) (g : R) (n : ℕ) (x : B.V) :
    B.ρ (g ^ n) x = ((B.ρ g)^[n]) x := by
  let : Module ℤ B.V := B.hV2
  rw [map_pow, Module.End.coe_pow]

theorem rep_norm_eq_generatorIterateSum
    {Q : IntegralRepGroupType} [Group Q] [Fintype Q]
    (B : Rep ℤ Q) (g : Q) (hg : ∀ q, q ∈ Subgroup.zpowers g)
    (n : ℕ) (hcard : Fintype.card Q = n)
    (f : B.V → B.V) (hf : ∀ z, B.ρ g z = f z) (x : B.V) :
    B.norm.hom x = ∑ i : Fin n, (f^[i.1]) x := by
  rw [rep_norm_eq_generatorPowerSum B g hg n hcard x]
  apply Finset.sum_congr rfl
  intro i _
  rw [rep_action_pow_eq_iterate]
  exact congrFun (congrArg (fun h : B.V → B.V => h^[i.1]) (funext hf)) x

theorem rep_action_pow_fixed {R : IntegralRepGroupType} [Group R]
    (B : Rep ℤ R) (g : R) (x : B.V) (hx : B.ρ g x = x) (n : ℕ) :
    B.ρ (g ^ n) x = x := by
  rw [rep_action_pow_eq_iterate]
  exact Function.IsFixedPt.iterate hx n
end
end ClassFormation
end

/- ClassFieldTheory.AbstractClassFieldTheory.Reciprocity.Construction.FrobeniusFixedFieldAction -/
section
universe u
namespace ClassFormation
open KummerTheory
open CyclicCohomology
noncomputable section
open CategoryTheory
open scoped BigOperators
section fixedFieldActions
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
namespace DegreeData

noncomputable def frobeniusFixedFieldAction (D : DegreeData G) (A : Rep ℤ G)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    [TotallyDisconnectedSpace G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (σ : D.FrobeniusElements K L hLK)
    (q : K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK)
    (hq : q * σ.1 = σ.1 * q) :
    ambientFixedAddSubgroup A (D.frobeniusFixedField K L hLK σ) →+
      ambientFixedAddSubgroup A (D.frobeniusFixedField K L hLK σ) := by
  let k : K.field.toSubgroup := Quotient.out q
  let hstable :
      conjugateClosedSubgroup (D.frobeniusFixedField K L hLK σ) k.1⁻¹ =
        D.frobeniusFixedField K L hLK σ :=
    D.conjugate_frobeniusFixedField_eq_of_commutes K L hLK σ q hq
  exact
    { toFun := fun a => ⟨A.ρ k.1 a.1, by
        intro t
        have htConj : t.1 ∈ conjugateClosedSubgroup
            (D.frobeniusFixedField K L hLK σ) k.1⁻¹ := by
          rw [hstable]
          exact t.2
        have hcMem : k.1⁻¹ * t.1 * k.1 ∈
            D.frobeniusFixedField K L hLK σ := by
          simpa using (conjugateClosedSubgroup_mem
            (D.frobeniusFixedField K L hLK σ) k.1⁻¹ t.1).mp htConj
        let c : (D.frobeniusFixedField K L hLK σ).toSubgroup :=
          ⟨k.1⁻¹ * t.1 * k.1, hcMem⟩
        calc
          A.ρ t.1 (A.ρ k.1 a.1) = A.ρ (t.1 * k.1) a.1 := by
            rw [map_mul]
            rfl
          _ = A.ρ (k.1 * c.1) a.1 := by simp [c, mul_assoc]
          _ = A.ρ k.1 (A.ρ c.1 a.1) := by rw [map_mul]; rfl
          _ = A.ρ k.1 a.1 := by rw [a.2 c]⟩
      map_zero' := by apply Subtype.ext; exact map_zero _
      map_add' := by
        intro a b
        apply Subtype.ext
        exact map_add _ _ _ }
 
@[simp]
theorem frobeniusFixedFieldAction_coe (D : DegreeData G) (A : Rep ℤ G)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    [TotallyDisconnectedSpace G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (σ : D.FrobeniusElements K L hLK)
    (q : K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK)
    (hq : q * σ.1 = σ.1 * q)
    (a : ambientFixedAddSubgroup A (D.frobeniusFixedField K L hLK σ)) :
    ((D.frobeniusFixedFieldAction A K L hLK σ q hq a :
      ambientFixedAddSubgroup A (D.frobeniusFixedField K L hLK σ)) : A.V) =
      A.ρ (Quotient.out q).1 a.1 := by
  rfl
 
theorem frobeniusFixedFieldAction_coe_of_mk (D : DegreeData G) (A : Rep ℤ G)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    [TotallyDisconnectedSpace G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (σ : D.FrobeniusElements K L hLK)
    (q : K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK)
    (hq : q * σ.1 = σ.1 * q)
    (k : K.field.toSubgroup) (hkq : QuotientGroup.mk k = q)
    (a : ambientFixedAddSubgroup A (D.frobeniusFixedField K L hLK σ)) :
    ((D.frobeniusFixedFieldAction A K L hLK σ q hq a :
      ambientFixedAddSubgroup A (D.frobeniusFixedField K L hLK σ)) : A.V) =
      A.ρ k.1 a.1 := by
  let t : K.field.toSubgroup := Quotient.out q
  have htq :
      (QuotientGroup.mk t :
        K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK) = q :=
    Quotient.out_eq' q
  have hrel : t⁻¹ * k ∈ D.extensionInertiaWithin K.field L hLK :=
    QuotientGroup.eq.mp (htq.trans hkq.symm)
  have hrField : (t⁻¹ * k).1 ∈
      (D.frobeniusFixedField K L hLK σ).toSubgroup := by
    let rI : (D.fieldInertia L).toSubgroup :=
      ⟨(t⁻¹ * k).1, ⟨
        (mem_extensionSubgroup_iff K.field L hLK (t⁻¹ * k)).1 hrel.1,
        hrel.2⟩⟩
    exact D.fieldInertia_le_frobeniusFixedField K L hLK σ rI.2
  let r : (D.frobeniusFixedField K L hLK σ).toSubgroup :=
    ⟨(t⁻¹ * k).1, hrField⟩
  rw [D.frobeniusFixedFieldAction_coe]
  calc
    A.ρ t.1 a.1 = A.ρ t.1 (A.ρ r.1 a.1) := by rw [a.2 r]
    _ = A.ρ (t.1 * r.1) a.1 := by rw [map_mul]; rfl
    _ = A.ρ k.1 a.1 := by simp [r, t]
 
theorem frobeniusFixedFieldAction_eq_conjugateStableAction
    (D : DegreeData G) (A : Rep ℤ G)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    [TotallyDisconnectedSpace G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (σ : D.FrobeniusElements K L hLK)
    (q : K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK)
    (hq : q * σ.1 = σ.1 * q)
    (a : ambientFixedAddSubgroup A (D.frobeniusFixedField K L hLK σ)) :
    let k : K.field.toSubgroup := Quotient.out q
    let hstable : conjugateClosedSubgroup
        (D.frobeniusFixedField K L hLK σ) k.1⁻¹ =
      D.frobeniusFixedField K L hLK σ :=
      D.conjugate_frobeniusFixedField_eq_of_commutes K L hLK σ q hq
    D.frobeniusFixedFieldAction A K L hLK σ q hq a =
      conjugateStableAction A (D.frobeniusFixedField K L hLK σ)
        k.1⁻¹ hstable a := by
  dsimp only
  apply Subtype.ext
  rw [D.frobeniusFixedFieldAction_coe, conjugateStableAction_coe]
  simp

theorem relativeNorm_frobeniusFixedFieldAction (D : DegreeData G) (A : Rep ℤ G)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    [TotallyDisconnectedSpace G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (σ σ' : D.FrobeniusElements K L hLK)
    (hTS : (D.frobeniusFixedField K L hLK σ').toSubgroup ≤
      (D.frobeniusFixedField K L hLK σ).toSubgroup)
    [Finite ((D.frobeniusFixedField K L hLK σ).toSubgroup ⧸
      extensionSubgroup (D.frobeniusFixedField K L hLK σ)
        (D.frobeniusFixedField K L hLK σ') hTS)]
    (q : K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK)
    (hq : q * σ.1 = σ.1 * q)
    (hq' : q * σ'.1 = σ'.1 * q)
    (a : ambientFixedAddSubgroup A
      (D.frobeniusFixedField K L hLK σ')) :
    relativeNorm A (D.frobeniusFixedField K L hLK σ)
        (D.frobeniusFixedField K L hLK σ') hTS
        (D.frobeniusFixedFieldAction A K L hLK σ' q hq' a) =
      D.frobeniusFixedFieldAction A K L hLK σ q hq
        (relativeNorm A (D.frobeniusFixedField K L hLK σ)
          (D.frobeniusFixedField K L hLK σ') hTS a) := by
  let k : K.field.toSubgroup := Quotient.out q
  let hSstable := D.conjugate_frobeniusFixedField_eq_of_commutes
    K L hLK σ q hq
  let hTstable := D.conjugate_frobeniusFixedField_eq_of_commutes
    K L hLK σ' q hq'
  rw [D.frobeniusFixedFieldAction_eq_conjugateStableAction
    A K L hLK σ' q hq' a]
  rw [relativeNorm_conjugateStableAction]
  rw [D.frobeniusFixedFieldAction_eq_conjugateStableAction
    A K L hLK σ q hq]

theorem frobeniusFixedFieldAction_inclusion (D : DegreeData G) (A : Rep ℤ G)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    [TotallyDisconnectedSpace G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (σ : D.FrobeniusElements K L hLK)
    (q : K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK)
    (hq : q * σ.1 = σ.1 * q)
    (a : ambientFixedAddSubgroup A
      (D.frobeniusFixedField K L hLK σ)) :
    fixedFieldInclusion A (D.frobeniusFixedField K L hLK σ)
        (D.maximalUnramifiedField L)
        (D.fieldInertia_le_frobeniusFixedField K L hLK σ)
        (D.frobeniusFixedFieldAction A K L hLK σ q hq a) =
      D.frobeniusQuotientAction A K.field L hLK q
        (fixedFieldInclusion A (D.frobeniusFixedField K L hLK σ)
          (D.maximalUnramifiedField L)
          (D.fieldInertia_le_frobeniusFixedField K L hLK σ) a) := by
  apply Subtype.ext
  refine (D.frobeniusFixedFieldAction_coe A K L hLK σ q hq a).trans ?_
  let k : K.field.toSubgroup := Quotient.out q
  have hkq : (QuotientGroup.mk k :
      K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK) = q :=
    Quotient.out_eq' q
  calc
    A.ρ (Quotient.out q).1 a.1 = A.ρ k.1 a.1 := rfl
    _ = (D.frobeniusQuotientAction A K.field L hLK (QuotientGroup.mk k)
        (fixedFieldInclusion A (D.frobeniusFixedField K L hLK σ)
          (D.maximalUnramifiedField L)
          (D.fieldInertia_le_frobeniusFixedField K L hLK σ) a)).1 := rfl
    _ = _ := congrArg (fun z =>
      (D.frobeniusQuotientAction A K.field L hLK z
        (fixedFieldInclusion A (D.frobeniusFixedField K L hLK σ)
          (D.maximalUnramifiedField L)
          (D.fieldInertia_le_frobeniusFixedField K L hLK σ) a)).1) hkq

theorem fixedFieldPowerSum_relativeNorm (D : DegreeData G) (A : Rep ℤ G)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    [TotallyDisconnectedSpace G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (σ σ' : D.FrobeniusElements K L hLK)
    (hTS : (D.frobeniusFixedField K L hLK σ').toSubgroup ≤
      (D.frobeniusFixedField K L hLK σ).toSubgroup)
    [Finite ((D.frobeniusFixedField K L hLK σ).toSubgroup ⧸
      extensionSubgroup (D.frobeniusFixedField K L hLK σ)
        (D.frobeniusFixedField K L hLK σ') hTS)]
    (q : K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK)
    (hq : q * σ.1 = σ.1 * q) (hq' : q * σ'.1 = σ'.1 * q)
    (n : ℕ)
    (a : ambientFixedAddSubgroup A
      (D.frobeniusFixedField K L hLK σ')) :
    relativeNorm A (D.frobeniusFixedField K L hLK σ)
        (D.frobeniusFixedField K L hLK σ') hTS
        (∑ i : Fin n,
          D.frobeniusFixedFieldAction A K L hLK σ'
            (q ^ i.1) (Commute.pow_left hq' i.1) a) =
      ∑ i : Fin n,
        D.frobeniusFixedFieldAction A K L hLK σ
          (q ^ i.1) (Commute.pow_left hq i.1)
          (relativeNorm A (D.frobeniusFixedField K L hLK σ)
            (D.frobeniusFixedField K L hLK σ') hTS a) := by
  rw [map_sum]
  apply Finset.sum_congr rfl
  intro i _
  exact D.relativeNorm_frobeniusFixedFieldAction A K L hLK
    σ σ' hTS (q ^ i.1) (Commute.pow_left hq i.1)
      (Commute.pow_left hq' i.1) a

theorem fixedFieldPowerSum_inclusion (D : DegreeData G) (A : Rep ℤ G)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    [TotallyDisconnectedSpace G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (σ : D.FrobeniusElements K L hLK)
    (q : K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK)
    (hq : q * σ.1 = σ.1 * q) (n : ℕ)
    (a : ambientFixedAddSubgroup A
      (D.frobeniusFixedField K L hLK σ)) :
    fixedFieldInclusion A (D.frobeniusFixedField K L hLK σ)
        (D.maximalUnramifiedField L)
        (D.fieldInertia_le_frobeniusFixedField K L hLK σ)
        (∑ i : Fin n,
          D.frobeniusFixedFieldAction A K L hLK σ
            (q ^ i.1) (Commute.pow_left hq i.1) a) =
      D.frobeniusPowerSum A K.field L hLK q n
        (fixedFieldInclusion A (D.frobeniusFixedField K L hLK σ)
          (D.maximalUnramifiedField L)
          (D.fieldInertia_le_frobeniusFixedField K L hLK σ) a) := by
  apply Subtype.ext
  rw [D.frobeniusPowerSum_coe]
  change
    (AddSubgroup.subtype (ambientFixedAddSubgroup A
      (D.frobeniusFixedField K L hLK σ)))
        (∑ i : Fin n,
          D.frobeniusFixedFieldAction A K L hLK σ
            (q ^ i.1) (Commute.pow_left hq i.1) a) = _
  rw [map_sum]
  apply Finset.sum_congr rfl
  intro i _
  exact congrArg Subtype.val
    (D.frobeniusFixedFieldAction_inclusion A K L hLK σ
      (q ^ i.1) (Commute.pow_left hq i.1) a)
end DegreeData
end fixedFieldActions
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
private theorem ambientFixedAddSubgroup_transport_coe
    (K L : FiniteAbstractField G) (h : K = L)
    (a : ambientFixedAddSubgroup A K.field) :
    (((h ▸ a : ambientFixedAddSubgroup A L.field) : A.V)) = a.1 := by
  cases h
  rfl
private theorem valuationAt_transport
    (v : ValuationData D A) (K L : FiniteAbstractField G) (h : K = L)
    (a : ambientFixedAddSubgroup A K.field) :
    v.valuationAt L (h ▸ a) = v.valuationAt K a := by
  cases h
  rfl

theorem valuationAt_frobeniusFixedFieldAction
    (v : ValuationData D A)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    [TotallyDisconnectedSpace G]
    (K : DegreeData.FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (σ : D.FrobeniusElements K L hLK)
    (q : K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK)
    (hq : q * σ.1 = σ.1 * q)
    [Finite ((baseField G).toSubgroup ⧸
      extensionSubgroup (baseField G)
        (D.frobeniusFixedField K L hLK σ)
        (le_baseField (D.frobeniusFixedField K L hLK σ)))]
    (a : ambientFixedAddSubgroup A
      (D.frobeniusFixedField K L hLK σ)) :
    v.valuationAt (D.frobeniusFixedAbstractField K L hLK σ)
        (D.frobeniusFixedFieldAction A K L hLK σ q hq a) =
      v.valuationAt (D.frobeniusFixedAbstractField K L hLK σ) a := by
  let TF := D.frobeniusFixedAbstractField K L hLK σ
  let k : K.field.toSubgroup := Quotient.out q
  let hstable : conjugateClosedSubgroup TF.field k.1⁻¹ = TF.field :=
    D.conjugate_frobeniusFixedField_eq_of_commutes K L hLK σ q hq
  let CF := TF.conjugate k.1⁻¹
  let C := CF.field
  have hconj := v.normalizedValuation_conjugate TF k.1⁻¹ a
  let bC : ambientFixedAddSubgroup A C :=
    conjugateFixedElement A TF.field k.1⁻¹ a
  have hCFTF : CF = TF := by
    exact FiniteAbstractField.eq_of_field_eq CF TF hstable
  let bT : ambientFixedAddSubgroup A TF.field := hCFTF ▸ bC
  have hbTcoe : bT.1 = bC.1 := by
    exact ambientFixedAddSubgroup_transport_coe CF TF hCFTF bC
  have hvaluationTransport : v.valuationAt TF bT = v.valuationAt CF bC := by
    exact v.valuationAt_transport CF TF hCFTF bC
  have hbT : bT = D.frobeniusFixedFieldAction
      A K L hLK σ q hq a := by
    apply Subtype.ext
    change bT.1 =
      (D.frobeniusFixedFieldAction A K L hLK σ q hq a).1
    calc
      bT.1 = bC.1 := hbTcoe
      _ = A.ρ k.1 a.1 :=
        (conjugateFixedElement_coe A TF.field k.1⁻¹ a).trans
          (congrArg (fun s : G => A.ρ s a.1) (inv_inv k.1))
      _ = (D.frobeniusFixedFieldAction A K L hLK σ q hq a).1 := by rfl
  calc
    v.valuationAt TF (D.frobeniusFixedFieldAction A K L hLK σ q hq a) =
        v.valuationAt TF bT := congrArg (v.valuationAt TF) hbT.symm
    _ = v.valuationAt CF bC := hvaluationTransport
    _ = v.valuationAt TF a := by simpa [CF, C, bC] using hconj

noncomputable def frobeniusFixedFieldUnitAction
    (v : ValuationData D A)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    [TotallyDisconnectedSpace G]
    (K : DegreeData.FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (σ : D.FrobeniusElements K L hLK)
    (q : K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK)
    (hq : q * σ.1 = σ.1 * q)
    [Finite ((baseField G).toSubgroup ⧸
      extensionSubgroup (baseField G)
        (D.frobeniusFixedField K L hLK σ)
        (le_baseField (D.frobeniusFixedField K L hLK σ)))] :
    v.unitAddSubgroup (D.frobeniusFixedAbstractField K L hLK σ) →+
      v.unitAddSubgroup (D.frobeniusFixedAbstractField K L hLK σ) where
  toFun u := ⟨D.frobeniusFixedFieldAction A K L hLK σ q hq u.1, by
    exact (v.mem_unitAddSubgroup_iff
      (D.frobeniusFixedAbstractField K L hLK σ)
      (D.frobeniusFixedFieldAction A K L hLK σ q hq u.1)).2
        ((v.valuationAt_frobeniusFixedFieldAction K L hLK σ q hq u.1).trans u.2)⟩
  map_zero' := by apply Subtype.ext; exact map_zero _
  map_add' _ _ := by apply Subtype.ext; exact map_add _ _ _

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

theorem relativeNorm_mem_unitAddSubgroup
    (v : ValuationData D A) (E : FiniteAbstractFieldExtension G)
    (u : v.unitAddSubgroup E.field) :
    relativeNorm A E.base.field E.field.field E.below u.1 ∈
      v.unitAddSubgroup E.base := by
  rw [v.mem_unitAddSubgroup_iff]
  apply Subtype.ext
  have h := v.normalizedValuation_tower E u.1
  let ER := E.toFiniteResidueAbstractExtension D
  change (ER.residueDegree : ℕ) •
      ((v.valuationAt E.field u.1 : v.valueGroup) : ZHat) =
    ((v.valuationAt E.base
      (relativeNorm A E.base.field E.field.field E.below u.1) :
        v.valueGroup) : ZHat) at h
  have hu : v.valuationAt E.field u.1 = 0 := u.2
  simpa [hu] using h.symm
 
def finiteUnitNorm
    (v : ValuationData D A) (E : FiniteAbstractFieldExtension G) :
    v.unitAddSubgroup E.field →+ v.unitAddSubgroup E.base where
  toFun u := ⟨relativeNorm A E.base.field E.field.field E.below u.1,
    v.relativeNorm_mem_unitAddSubgroup E u⟩
  map_zero' := by apply Subtype.ext; exact map_zero _
  map_add' _ _ := by apply Subtype.ext; exact map_add _ _ _
end ValuationData
end
end ClassFormation
end

/- ClassFieldTheory.AbstractClassFieldTheory.Reciprocity.Construction.FixedTowerUnitCorrection -/
section
universe u v
namespace ClassFormation
open KummerTheory
open CyclicCohomology
noncomputable section
open CategoryTheory
open scoped BigOperators
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
namespace ValuationData
variable {D : DegreeData G} {A : Rep ℤ G}

noncomputable def fixedTowerCorrection
    (v : ValuationData D A)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    [TotallyDisconnectedSpace G]
    (K : DegreeData.FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (σn : D.FrobeniusElements K L hLK)
    [Finite ((baseField G).toSubgroup ⧸
      extensionSubgroup (baseField G)
        (D.frobeniusFixedField K L hLK σn)
        (le_baseField (D.frobeniusFixedField K L hLK σn)))]
    {ι : Type v} (s : Finset ι)
    (φ : K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK)
    (hφσn : φ * σn.1 = σn.1 * φ)
    (τ : ι → K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK)
    (hτσn : ∀ i, τ i * σn.1 = σn.1 * τ i)
    (uBar :
      v.unitAddSubgroup (D.frobeniusFixedAbstractField K L hLK σn))
    (uBarᵢ : ι →
      v.unitAddSubgroup (D.frobeniusFixedAbstractField K L hLK σn)) :
    v.unitAddSubgroup (D.frobeniusFixedAbstractField K L hLK σn) :=
  v.frobeniusFixedFieldUnitAction K L hLK σn φ hφσn uBar -
    uBar -
    ∑ i ∈ s,
      (v.frobeniusFixedFieldUnitAction K L hLK σn
          (τ i) (hτσn i) (uBarᵢ i) - uBarᵢ i)

theorem fixedTowerCorrection_coe
    (v : ValuationData D A)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    [TotallyDisconnectedSpace G]
    (K : DegreeData.FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (σn : D.FrobeniusElements K L hLK)
    [Finite ((baseField G).toSubgroup ⧸
      extensionSubgroup (baseField G)
        (D.frobeniusFixedField K L hLK σn)
        (le_baseField (D.frobeniusFixedField K L hLK σn)))]
    {ι : Type v} (s : Finset ι)
    (φ : K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK)
    (hφσn : φ * σn.1 = σn.1 * φ)
    (τ : ι → K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK)
    (hτσn : ∀ i, τ i * σn.1 = σn.1 * τ i)
    (uBar :
      v.unitAddSubgroup (D.frobeniusFixedAbstractField K L hLK σn))
    (uBarᵢ : ι →
      v.unitAddSubgroup (D.frobeniusFixedAbstractField K L hLK σn)) :
    (v.fixedTowerCorrection K L hLK σn s φ hφσn
      τ hτσn uBar uBarᵢ).1 =
        (v.frobeniusFixedFieldUnitAction K L hLK σn
            φ hφσn uBar).1 -
          uBar.1 -
          ∑ i ∈ s,
            ((v.frobeniusFixedFieldUnitAction K L hLK σn
                (τ i) (hτσn i) (uBarᵢ i)).1 - (uBarᵢ i).1) := by
  let inclusion :=
    (v.unitAddSubgroup (D.frobeniusFixedAbstractField K L hLK σn)).subtype
  change inclusion (v.fixedTowerCorrection K L hLK σn s φ hφσn
    τ hτσn uBar uBarᵢ) =
      inclusion (v.frobeniusFixedFieldUnitAction K L hLK σn φ hφσn uBar) -
        inclusion uBar - ∑ i ∈ s,
          (inclusion (v.frobeniusFixedFieldUnitAction K L hLK σn
            (τ i) (hτσn i) (uBarᵢ i)) - inclusion (uBarᵢ i))
  simp only [fixedTowerCorrection, map_sub, map_sum]

theorem fixedTowerCorrection_relativeNorm_eq_zero
    (v : ValuationData D A)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    [TotallyDisconnectedSpace G]
    (K : DegreeData.FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (σ σn : D.FrobeniusElements K L hLK)
    (hTS : (D.frobeniusFixedField K L hLK σn).toSubgroup ≤
      (D.frobeniusFixedField K L hLK σ).toSubgroup)
    [Finite ((D.frobeniusFixedField K L hLK σ).toSubgroup ⧸
      extensionSubgroup (D.frobeniusFixedField K L hLK σ)
        (D.frobeniusFixedField K L hLK σn) hTS)]
    [Finite ((baseField G).toSubgroup ⧸
      extensionSubgroup (baseField G)
        (D.frobeniusFixedField K L hLK σ)
        (le_baseField (D.frobeniusFixedField K L hLK σ)))]
    [Finite ((baseField G).toSubgroup ⧸
      extensionSubgroup (baseField G)
        (D.frobeniusFixedField K L hLK σn)
        (le_baseField (D.frobeniusFixedField K L hLK σn)))]
    {ι : Type v} (s : Finset ι)
    (φ : K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK)
    (hφσ : φ * σ.1 = σ.1 * φ)
    (hφσn : φ * σn.1 = σn.1 * φ)
    (τ : ι → K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK)
    (hτσ : ∀ i, τ i * σ.1 = σ.1 * τ i)
    (hτσn : ∀ i, τ i * σn.1 = σn.1 * τ i)
    (u :
      v.unitAddSubgroup (D.frobeniusFixedAbstractField K L hLK σ))
    (uᵢ : ι →
      v.unitAddSubgroup (D.frobeniusFixedAbstractField K L hLK σ))
    (uBar :
      v.unitAddSubgroup (D.frobeniusFixedAbstractField K L hLK σn))
    (uBarᵢ : ι →
      v.unitAddSubgroup (D.frobeniusFixedAbstractField K L hLK σn))
    (huBar : relativeNorm A (D.frobeniusFixedField K L hLK σ)
      (D.frobeniusFixedField K L hLK σn) hTS uBar.1 = u.1)
    (huBarᵢ : ∀ i,
      relativeNorm A (D.frobeniusFixedField K L hLK σ)
        (D.frobeniusFixedField K L hLK σn) hTS
          (uBarᵢ i).1 = (uᵢ i).1)
    (hstar :
      A.ρ (Quotient.out φ).1 u.1.1 - u.1.1 =
        ∑ i ∈ s,
          (A.ρ (Quotient.out (τ i)).1 (uᵢ i).1.1 - (uᵢ i).1.1)) :
    relativeNorm A (D.frobeniusFixedField K L hLK σ)
      (D.frobeniusFixedField K L hLK σn) hTS
        (v.fixedTowerCorrection K L hLK σn s φ hφσn
          τ hτσn uBar uBarᵢ).1 = 0 := by
  dsimp only [DegreeData.frobeniusFixedAbstractField] at *
  let u' : ambientFixedAddSubgroup A
      (D.frobeniusFixedField K L hLK σ) :=
    ⟨u.1.1, u.1.2⟩
  let uᵢ' (i : ι) : ambientFixedAddSubgroup A
      (D.frobeniusFixedField K L hLK σ) :=
    ⟨(uᵢ i).1.1, (uᵢ i).1.2⟩
  let uBar' : ambientFixedAddSubgroup A
      (D.frobeniusFixedField K L hLK σn) :=
    ⟨uBar.1.1, uBar.1.2⟩
  let uBarᵢ' (i : ι) : ambientFixedAddSubgroup A
      (D.frobeniusFixedField K L hLK σn) :=
    ⟨(uBarᵢ i).1.1, (uBarᵢ i).1.2⟩
  have hsumBar (f : ι →
      v.unitAddSubgroup (D.frobeniusFixedAbstractField K L hLK σn)) :
      ((∑ i ∈ s, f i).1.1 : A.V) = ∑ i ∈ s, (f i).1.1 := by
    calc
      ((∑ i ∈ s, f i).1.1 : A.V) =
          (ambientFixedAddSubgroup A
            (D.frobeniusFixedField K L hLK σn)).subtype
              (∑ i ∈ s, (v.unitAddSubgroup
                (D.frobeniusFixedAbstractField K L hLK σn)).subtype (f i)) := by
        exact congrArg (ambientFixedAddSubgroup A
          (D.frobeniusFixedField K L hLK σn)).subtype
          (map_sum (v.unitAddSubgroup
            (D.frobeniusFixedAbstractField K L hLK σn)).subtype f s)
      _ = _ := map_sum
        (ambientFixedAddSubgroup A
          (D.frobeniusFixedField K L hLK σn)).subtype
        (fun i => (v.unitAddSubgroup
          (D.frobeniusFixedAbstractField K L hLK σn)).subtype (f i)) s
  have hsumBar' (f : ι → ambientFixedAddSubgroup A
      (D.frobeniusFixedField K L hLK σn)) :
      ((∑ i ∈ s, f i).1 : A.V) = ∑ i ∈ s, (f i).1 :=
    map_sum (ambientFixedAddSubgroup A
      (D.frobeniusFixedField K L hLK σn)).subtype f s
  have hφVal :
      ((D.frobeniusFixedFieldAction A K L hLK σn φ hφσn uBar').1 : A.V) =
        A.ρ (Quotient.out φ).1 uBar.1.1 := by
    simp [uBar']
  have hτVal (i : ι) :
      ((D.frobeniusFixedFieldAction A K L hLK σn
        (τ i) (hτσn i) (uBarᵢ' i)).1 : A.V) =
        A.ρ (Quotient.out (τ i)).1 (uBarᵢ i).1.1 := by
    simp [uBarᵢ']
  have hunitφVal :
      ((v.frobeniusFixedFieldUnitAction K L hLK σn
        φ hφσn uBar).1.1 : A.V) =
        A.ρ (Quotient.out φ).1 uBar.1.1 := by
    change ((D.frobeniusFixedFieldAction A K L hLK σn
      φ hφσn uBar.1).1 : A.V) = _
    exact hφVal
  have hunitτVal (i : ι) :
      ((v.frobeniusFixedFieldUnitAction K L hLK σn
        (τ i) (hτσn i) (uBarᵢ i)).1.1 : A.V) =
        A.ρ (Quotient.out (τ i)).1 (uBarᵢ i).1.1 := by
    change ((D.frobeniusFixedFieldAction A K L hLK σn
      (τ i) (hτσn i) (uBarᵢ i).1).1 : A.V) = _
    exact hτVal i
  have hsubAmbient (x y : ambientFixedAddSubgroup A
      (D.frobeniusFixedField K L hLK σn)) :
      ((x - y).1 : A.V) = x.1 - y.1 :=
    map_sub (ambientFixedAddSubgroup A
      (D.frobeniusFixedField K L hLK σn)).subtype x y
  have hsumAmbient (f : ι → ambientFixedAddSubgroup A
      (D.frobeniusFixedField K L hLK σn)) :
      ((∑ i ∈ s, f i).1 : A.V) = ∑ i ∈ s, (f i).1 :=
    map_sum (ambientFixedAddSubgroup A
      (D.frobeniusFixedField K L hLK σn)).subtype f s
  have hcorrection :
      (v.fixedTowerCorrection K L hLK σn s φ hφσn
          τ hτσn uBar uBarᵢ).1 =
        D.frobeniusFixedFieldAction A K L hLK σn
            φ hφσn uBar' -
          uBar' -
          ∑ i ∈ s,
            (D.frobeniusFixedFieldAction A K L hLK σn
                (τ i) (hτσn i) (uBarᵢ' i) - uBarᵢ' i) := by
    rw [v.fixedTowerCorrection_coe
      K L hLK σn s φ hφσn τ hτσn uBar uBarᵢ]
    rfl
  rw [hcorrection]
  simp only [map_sub, map_sum]
  have hφEquiv :
      relativeNorm A (D.frobeniusFixedField K L hLK σ)
          (D.frobeniusFixedField K L hLK σn) hTS
          (D.frobeniusFixedFieldAction A K L hLK σn
            φ hφσn uBar') =
        D.frobeniusFixedFieldAction A K L hLK σ
          φ hφσ
            (relativeNorm A (D.frobeniusFixedField K L hLK σ)
              (D.frobeniusFixedField K L hLK σn) hTS uBar') := by
    exact D.relativeNorm_frobeniusFixedFieldAction
      A K L hLK σ σn hTS φ hφσ hφσn uBar'
  rw [hφEquiv]
  have hτEquiv (i : ι) :
      relativeNorm A (D.frobeniusFixedField K L hLK σ)
          (D.frobeniusFixedField K L hLK σn) hTS
          (D.frobeniusFixedFieldAction A K L hLK σn
            (τ i) (hτσn i) (uBarᵢ' i)) =
        D.frobeniusFixedFieldAction A K L hLK σ
          (τ i) (hτσ i)
            (relativeNorm A (D.frobeniusFixedField K L hLK σ)
              (D.frobeniusFixedField K L hLK σn) hTS (uBarᵢ' i)) := by
    exact D.relativeNorm_frobeniusFixedFieldAction
      A K L hLK σ σn hTS (τ i) (hτσ i) (hτσn i) (uBarᵢ' i)
  simp_rw [hτEquiv]
  have huBar' :
      relativeNorm A (D.frobeniusFixedField K L hLK σ)
        (D.frobeniusFixedField K L hLK σn) hTS uBar' = u' := by
    exact huBar
  have huBarᵢ' (i : ι) :
      relativeNorm A (D.frobeniusFixedField K L hLK σ)
        (D.frobeniusFixedField K L hLK σn) hTS (uBarᵢ' i) = uᵢ' i := by
    exact huBarᵢ i
  rw [huBar']
  simp_rw [huBarᵢ']
  apply Subtype.ext
  have hsum : ((∑ i ∈ s, uᵢ i).1.1 : A.V) =
      ∑ i ∈ s, (uᵢ i).1.1 := by
    calc
      ((∑ i ∈ s, uᵢ i).1.1 : A.V) =
          (ambientFixedAddSubgroup A
            (D.frobeniusFixedField K L hLK σ)).subtype
              (∑ i ∈ s, (v.unitAddSubgroup
                (D.frobeniusFixedAbstractField K L hLK σ)).subtype (uᵢ i)) := by
        exact congrArg (ambientFixedAddSubgroup A
          (D.frobeniusFixedField K L hLK σ)).subtype
          (map_sum (v.unitAddSubgroup
            (D.frobeniusFixedAbstractField K L hLK σ)).subtype uᵢ s)
      _ = _ := map_sum
        (ambientFixedAddSubgroup A
          (D.frobeniusFixedField K L hLK σ)).subtype
        (fun i => (v.unitAddSubgroup
          (D.frobeniusFixedAbstractField K L hLK σ)).subtype (uᵢ i)) s
  have hsum' (f : ι → ambientFixedAddSubgroup A
      (D.frobeniusFixedField K L hLK σ)) :
      ((∑ i ∈ s, f i).1 : A.V) = ∑ i ∈ s, (f i).1 :=
    map_sum (ambientFixedAddSubgroup A
      (D.frobeniusFixedField K L hLK σ)).subtype f s
  simpa [u', uᵢ', D.frobeniusFixedFieldAction_coe,
    hsum, hsum', Finset.sum_sub_distrib] using
    sub_eq_zero.mpr hstar
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

theorem frobeniusQuotientAction_coe_out (D : DegreeData G) (A : Rep ℤ G)
    (K L : ClosedSubgroup G) (hLK : L.toSubgroup ≤ K.toSubgroup)
    [hLnormal : (extensionSubgroup K L hLK).Normal]
    (q : K.toSubgroup ⧸ D.extensionInertiaWithin K L hLK)
    (a : ambientFixedAddSubgroup A (D.maximalUnramifiedField L)) :
    (D.frobeniusQuotientAction A K L hLK q a).1 =
      A.ρ (Quotient.out q).1 a.1 := by
  let k : K.toSubgroup := Quotient.out q
  have hkq : (QuotientGroup.mk k :
      K.toSubgroup ⧸ D.extensionInertiaWithin K L hLK) = q :=
    Quotient.out_eq' q
  calc
    (D.frobeniusQuotientAction A K L hLK q a).1 =
        (D.frobeniusQuotientAction A K L hLK (QuotientGroup.mk k) a).1 :=
      congrArg (fun z => (D.frobeniusQuotientAction A K L hLK z a).1) hkq.symm
    _ = A.ρ k.1 a.1 := rfl
    _ = A.ρ (Quotient.out q).1 a.1 := rfl

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

theorem frobeniusPowerSum_eq_nsmul_of_fixed (D : DegreeData G) (A : Rep ℤ G)
    (K L : ClosedSubgroup G) (hLK : L.toSubgroup ≤ K.toSubgroup)
    [hLnormal : (extensionSubgroup K L hLK).Normal]
    (q : K.toSubgroup ⧸ D.extensionInertiaWithin K L hLK)
    (n : ℕ)
    (a : ambientFixedAddSubgroup A (D.maximalUnramifiedField L))
    (ha : D.frobeniusQuotientAction A K L hLK q a = a) :
    D.frobeniusPowerSum A K L hLK q n a = n • a := by
  let B := D.frobeniusQuotientRepresentation A K L hLK
  have hpow (i : ℕ) :
      D.frobeniusQuotientAction A K L hLK (q ^ i) a = a := by
    have haB : B.ρ q a = a := by
      change D.frobeniusQuotientAction A K L hLK q a = a
      exact ha
    have hi := rep_action_pow_fixed B q a haB i
    change D.frobeniusQuotientAction A K L hLK (q ^ i) a = a at hi
    exact hi
  unfold DegreeData.frobeniusPowerSum
  simp_rw [hpow]
  simp

theorem maximalUnramifiedNorm_frobeniusQuotientAction (D : DegreeData G)
    (A : Rep ℤ G) (K L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.toSubgroup)
    [hLnormal : (extensionSubgroup K L hLK).Normal]
    [Finite (K.toSubgroup ⧸ extensionSubgroup K L hLK)]
    (q : K.toSubgroup ⧸ D.extensionInertiaWithin K L hLK)
    (a : ambientFixedAddSubgroup A (D.maximalUnramifiedField L)) :
    letI : Finite
        ((D.maximalUnramifiedField K).toSubgroup ⧸
          extensionSubgroup (D.maximalUnramifiedField K)
            (D.maximalUnramifiedField L)
            (D.maximalUnramifiedField_mono hLK)) :=
      D.maximalUnramifiedExtension_finite K L hLK
    fixedFieldInclusion A (D.maximalUnramifiedField K)
        (D.maximalUnramifiedField L) (D.maximalUnramifiedField_mono hLK)
        (relativeNorm A (D.maximalUnramifiedField K)
          (D.maximalUnramifiedField L) (D.maximalUnramifiedField_mono hLK)
          (D.frobeniusQuotientAction A K L hLK q a)) =
      D.frobeniusQuotientAction A K L hLK q
        (fixedFieldInclusion A (D.maximalUnramifiedField K)
          (D.maximalUnramifiedField L) (D.maximalUnramifiedField_mono hLK)
          (relativeNorm A (D.maximalUnramifiedField K)
            (D.maximalUnramifiedField L) (D.maximalUnramifiedField_mono hLK)
            a)) := by
  let : Finite
      ((D.maximalUnramifiedField K).toSubgroup ⧸
        extensionSubgroup (D.maximalUnramifiedField K)
          (D.maximalUnramifiedField L)
          (D.maximalUnramifiedField_mono hLK)) :=
    D.maximalUnramifiedExtension_finite K L hLK
  apply Subtype.ext
  exact D.relativeNorm_frobeniusQuotientAction A K L hLK q a

theorem frobeniusQuotientAction_fixed_of_degreeZero (D : DegreeData G)
    (A : Rep ℤ G) (K : FiniteResidueAbstractField D)
    (L : ClosedSubgroup G) (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (q : K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK)
    (hq : D.extensionNormalizedDegree K L hLK q = 1)
    (a : ambientFixedAddSubgroup A (D.maximalUnramifiedField K.field)) :
    D.frobeniusQuotientAction A K.field L hLK q
        (fixedFieldInclusion A (D.maximalUnramifiedField K.field)
          (D.maximalUnramifiedField L) (D.maximalUnramifiedField_mono hLK) a) =
      fixedFieldInclusion A (D.maximalUnramifiedField K.field)
        (D.maximalUnramifiedField L) (D.maximalUnramifiedField_mono hLK) a := by
  let k : K.field.toSubgroup := Quotient.out q
  have hkq :
      (QuotientGroup.mk k :
        K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK) = q :=
    Quotient.out_eq' q
  have hkDegree : D.normalizedDegree K k = 1 := by
    calc
      D.normalizedDegree K k =
          D.extensionNormalizedDegree K L hLK (QuotientGroup.mk k) := rfl
      _ = D.extensionNormalizedDegree K L hLK q :=
        congrArg (D.extensionNormalizedDegree K L hLK) hkq
      _ = 1 := hq
  have hkInertia : k ∈ D.fieldInertiaWithin K.field := by
    rw [← D.normalizedDegree_ker K]
    exact hkDegree
  let kI : (D.maximalUnramifiedField K.field).toSubgroup :=
    ⟨k.1, ⟨k.2, hkInertia⟩⟩
  rw [← hkq]
  apply Subtype.ext
  exact a.2 kI

theorem maximalUnramifiedNorm_fixed_of_hstar (D : DegreeData G)
    (A : Rep ℤ G) (K : FiniteResidueAbstractField D)
    (L : ClosedSubgroup G) (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    [hLfinite : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK)]
    {ι : Type v} (s : Finset ι)
    (φ : K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK)
    (τ : ι →
      (D.extensionNormalizedDegreeContinuous K L hLK).toMonoidHom.ker)
    (u : ambientFixedAddSubgroup A (D.maximalUnramifiedField L))
    (uᵢ : ι → ambientFixedAddSubgroup A (D.maximalUnramifiedField L))
    (hstar : D.frobeniusQuotientAction A K.field L hLK φ u - u =
      ∑ i ∈ s,
        (D.frobeniusQuotientAction A K.field L hLK (τ i).1 (uᵢ i) - uᵢ i)) :
    letI : Finite
        ((D.maximalUnramifiedField K.field).toSubgroup ⧸
          extensionSubgroup (D.maximalUnramifiedField K.field)
            (D.maximalUnramifiedField L)
            (D.maximalUnramifiedField_mono hLK)) :=
      D.maximalUnramifiedExtension_finite K.field L hLK
    let N := relativeNorm A (D.maximalUnramifiedField K.field)
      (D.maximalUnramifiedField L) (D.maximalUnramifiedField_mono hLK)
    let b := fixedFieldInclusion A (D.maximalUnramifiedField K.field)
      (D.maximalUnramifiedField L) (D.maximalUnramifiedField_mono hLK) (N u)
    D.frobeniusQuotientAction A K.field L hLK φ b = b := by
  dsimp only
  let : Finite
      ((D.maximalUnramifiedField K.field).toSubgroup ⧸
        extensionSubgroup (D.maximalUnramifiedField K.field)
          (D.maximalUnramifiedField L)
          (D.maximalUnramifiedField_mono hLK)) :=
    D.maximalUnramifiedExtension_finite K.field L hLK
  let N := relativeNorm A (D.maximalUnramifiedField K.field)
    (D.maximalUnramifiedField L) (D.maximalUnramifiedField_mono hLK)
  let J := fixedFieldInclusion A (D.maximalUnramifiedField K.field)
    (D.maximalUnramifiedField L) (D.maximalUnramifiedField_mono hLK)
  have hnorm := congrArg (J.comp N) hstar
  simp only [map_sub, map_sum] at hnorm
  change J (N (D.frobeniusQuotientAction A K.field L hLK φ u)) - J (N u) =
    ∑ i ∈ s,
      (J (N (D.frobeniusQuotientAction A K.field L hLK (τ i).1 (uᵢ i))) -
        J (N (uᵢ i))) at hnorm
  have hφEquiv :
      J (N (D.frobeniusQuotientAction A K.field L hLK φ u)) =
        D.frobeniusQuotientAction A K.field L hLK φ (J (N u)) := by
    simpa [J, N] using
      D.maximalUnramifiedNorm_frobeniusQuotientAction A K.field L hLK φ u
  rw [hφEquiv] at hnorm
  have hzero (i : ι) :
      J (N (D.frobeniusQuotientAction A K.field L hLK (τ i).1 (uᵢ i))) =
        J (N (uᵢ i)) := by
    calc
      J (N (D.frobeniusQuotientAction A K.field L hLK (τ i).1 (uᵢ i))) =
          D.frobeniusQuotientAction A K.field L hLK (τ i).1 (J (N (uᵢ i))) := by
        simpa [J, N] using
          D.maximalUnramifiedNorm_frobeniusQuotientAction
            A K.field L hLK (τ i).1 (uᵢ i)
      _ = J (N (uᵢ i)) := by
        simpa [J, N] using D.frobeniusQuotientAction_fixed_of_degreeZero
          A K L hLK (τ i).1 (τ i).2 (N (uᵢ i))
  simp_rw [hzero] at hnorm
  have hnormzero :
      D.frobeniusQuotientAction A K.field L hLK φ (J (N u)) - J (N u) = 0 := by
    simpa only [sub_self, Finset.sum_const_zero] using hnorm
  simpa [J, N] using sub_eq_zero.mp hnormzero

theorem descend_maximalUnramified_fixed_of_finiteSupport (D : DegreeData G)
    (A : Rep ℤ G) [IsTopologicalGroup G]
    (K : FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (φ : D.FrobeniusElements K L hLK)
    (hφ : D.frobeniusExponent K L hLK φ = 1)
    (P : FiniteIntermediateField (D.maximalUnramifiedField L) K.field)
    [hPnormal : (extensionSubgroup K.field P.field P.below).Normal]
    (aI : ambientFixedAddSubgroup A (D.maximalUnramifiedField K.field))
    (aP : ambientFixedAddSubgroup A P.field)
    (hsupport :
      fixedFieldInclusion A P.field (D.maximalUnramifiedField L) P.above aP =
        fixedFieldInclusion A (D.maximalUnramifiedField K.field)
          (D.maximalUnramifiedField L) (D.maximalUnramifiedField_mono hLK) aI)
    (hfixed :
      D.frobeniusQuotientAction A K.field L hLK φ.1
          (fixedFieldInclusion A (D.maximalUnramifiedField K.field)
            (D.maximalUnramifiedField L) (D.maximalUnramifiedField_mono hLK) aI) =
        fixedFieldInclusion A (D.maximalUnramifiedField K.field)
          (D.maximalUnramifiedField L) (D.maximalUnramifiedField_mono hLK) aI) :
    ∃ aK : ambientFixedAddSubgroup A K.field,
      fixedFieldInclusion A K.field (D.maximalUnramifiedField K.field)
        (D.maximalUnramifiedField_le K.field) aK = aI := by
  let hPfinite : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field P.field P.below) := P.finite
  let f : K.field.toSubgroup := Quotient.out φ.1
  have hfφ :
      (QuotientGroup.mk f :
        K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK) = φ.1 :=
    Quotient.out_eq' φ.1
  have hfDegree : D.normalizedDegree K f =
      Multiplicative.ofAdd (1 : ZHat) := by
    calc
      D.normalizedDegree K f =
          D.extensionNormalizedDegree K L hLK (QuotientGroup.mk f) := rfl
      _ = D.extensionNormalizedDegree K L hLK φ.1 :=
        congrArg (D.extensionNormalizedDegree K L hLK) hfφ
      _ = (Multiplicative.ofAdd (1 : ZHat)) ^
            D.frobeniusExponent K L hLK φ :=
        D.extensionNormalizedDegree_frobenius_eq_pow K L hLK φ
      _ = Multiplicative.ofAdd (1 : ZHat) := by simp [hφ]
  have hfFixed : A.ρ f.1 aI.1 = aI.1 := by
    rw [← hfφ] at hfixed
    exact congrArg Subtype.val hfixed
  have hfPowFixed (n : ℕ) : A.ρ (f.1 ^ n) aI.1 = aI.1 := by
    induction n with
    | zero => simp
    | succ n ih =>
        rw [pow_succ, map_mul]
        change A.ρ (f.1 ^ n) (A.ρ f.1 aI.1) = aI.1
        rw [hfFixed, ih]
  have hsval : aP.1 = aI.1 := congrArg Subtype.val hsupport
  have hKfixed (k : K.field.toSubgroup) : A.ρ k.1 aI.1 = aI.1 := by
    obtain ⟨q, hqk⟩ := D.frobeniusRestriction_surjective K P.field P.below
      (QuotientGroup.mk k)
    obtain ⟨n, _hn, hqDegree⟩ := q.2
    let t : K.field.toSubgroup := Quotient.out q.1
    have htq :
        (QuotientGroup.mk t :
          K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field P.field P.below) = q.1 :=
      Quotient.out_eq' q.1
    have htDegree : D.normalizedDegree K t =
        (Multiplicative.ofAdd (1 : ZHat)) ^ n := by
      calc
        D.normalizedDegree K t =
            D.extensionNormalizedDegree K P.field P.below
              (QuotientGroup.mk t) := rfl
        _ = D.extensionNormalizedDegree K P.field P.below q.1 :=
          congrArg (D.extensionNormalizedDegree K P.field P.below) htq
        _ = _ := hqDegree
    let z : K.field.toSubgroup := t⁻¹ * f ^ n
    have hzInertia : z ∈ D.fieldInertiaWithin K.field := by
      rw [← D.normalizedDegree_ker K]
      change D.normalizedDegree K z = 1
      rw [map_mul, map_inv, map_pow, htDegree, hfDegree]
      simp
    let zI : (D.maximalUnramifiedField K.field).toSubgroup :=
      ⟨z.1, ⟨z.2, hzInertia⟩⟩
    have hzFixed : A.ρ z.1 aI.1 = aI.1 := aI.2 zI
    have htFixed : A.ρ t.1 aI.1 = aI.1 := by
      calc
        A.ρ t.1 aI.1 = A.ρ t.1 (A.ρ z.1 aI.1) :=
          congrArg (A.ρ t.1) hzFixed.symm
        _ = A.ρ (t.1 * z.1) aI.1 := by rw [map_mul]; rfl
        _ = A.ρ (f.1 ^ n) aI.1 := by simp [z]
        _ = aI.1 := hfPowFixed n
    have htk :
        (QuotientGroup.mk t :
          K.field.toSubgroup ⧸ extensionSubgroup K.field P.field P.below) =
        QuotientGroup.mk k := by
      calc
        QuotientGroup.mk t =
            D.extensionRestriction K.field P.field P.below (QuotientGroup.mk t) := rfl
        _ = D.extensionRestriction K.field P.field P.below q.1 :=
          congrArg (D.extensionRestriction K.field P.field P.below) htq
        _ = QuotientGroup.mk k := hqk
    have hrel : t⁻¹ * k ∈ extensionSubgroup K.field P.field P.below :=
      QuotientGroup.eq.mp htk
    let rP : P.field.toSubgroup := ⟨(t⁻¹ * k).1, hrel⟩
    have hrval : rP.1 = (t⁻¹ * k).1 := rfl
    have hrval' : rP.1 = t.1⁻¹ * k.1 := hrval
    have hrFixed : A.ρ (t.1⁻¹ * k.1) aI.1 = aI.1 := by
      rw [← hsval, ← hrval']
      exact aP.2 rP
    calc
      A.ρ k.1 aI.1 = A.ρ (t.1 * (t.1⁻¹ * k.1)) aI.1 := by simp
      _ = A.ρ t.1 (A.ρ (t.1⁻¹ * k.1) aI.1) := by rw [map_mul]; rfl
      _ = A.ρ t.1 aI.1 := by rw [hrFixed]
      _ = aI.1 := htFixed
  let aK : ambientFixedAddSubgroup A K.field := ⟨aI.1, hKfixed⟩
  refine ⟨aK, ?_⟩
  apply Subtype.ext
  rfl
end DegreeData
end representationDescent
end
end ClassFormation
end

/- ClassFieldTheory.AbstractClassFieldTheory.Reciprocity.Construction.FixedTowerUnitDescent -/
section
universe u v
namespace ClassFormation
open KummerTheory
open CyclicCohomology
noncomputable section
open CategoryTheory
open scoped BigOperators
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
namespace ValuationData
variable {D : DegreeData G} {A : Rep ℤ G}

noncomputable def fixedTowerUnitAction
    (v : ValuationData D A)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    [TotallyDisconnectedSpace G]
    (T : DegreeData.FrobeniusFixedFieldTower D)
    (q : T.ambientBase.field.toSubgroup ⧸
      D.extensionInertiaWithin T.ambientBase.field T.ambient.field
        T.ambient.below)
    (hq : q * T.fieldFrobenius.1 = T.fieldFrobenius.1 * q) :
    v.unitAddSubgroup
        (DegreeData.FrobeniusFixedFieldTower.field (G := G) (D := D) T) →+
      v.unitAddSubgroup
        (DegreeData.FrobeniusFixedFieldTower.field (G := G) (D := D) T) := by
  let TF :=
    D.frobeniusFixedAbstractField T.ambientBase T.ambient.field
      T.ambient.below T.fieldFrobenius
  have hTF : TF = T.field := by
    apply FiniteAbstractField.eq_of_field_eq
    rfl
  exact hTF ▸
    v.frobeniusFixedFieldUnitAction T.ambientBase T.ambient.field
      T.ambient.below T.fieldFrobenius q hq

noncomputable def powerTowerCorrection
    (v : ValuationData D A)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    [TotallyDisconnectedSpace G]
    (P : DegreeData.FrobeniusPowerFixedFieldTower D)
    {ι : Type v} (s : Finset ι)
    (τ : ι →
      (D.extensionNormalizedDegreeContinuous P.ambientBase P.ambient.field
        P.ambient.below).toMonoidHom.ker)
    (hτ : ∀ i, (τ i).1 * P.fieldFrobenius.1 =
      P.fieldFrobenius.1 * (τ i).1)
    (uBar : v.unitAddSubgroup
      (DegreeData.FrobeniusFixedFieldTower.field (G := G) (D := D)
        (DegreeData.FrobeniusPowerFixedFieldTower.toFrobeniusFixedFieldTower
          (G := G) (D := D) P)))
    (uBarᵢ : ι → v.unitAddSubgroup
      (DegreeData.FrobeniusFixedFieldTower.field (G := G) (D := D)
        (DegreeData.FrobeniusPowerFixedFieldTower.toFrobeniusFixedFieldTower
          (G := G) (D := D) P))) :
    v.unitAddSubgroup
      (DegreeData.FrobeniusFixedFieldTower.field (G := G) (D := D)
        (DegreeData.FrobeniusPowerFixedFieldTower.toFrobeniusFixedFieldTower
          (G := G) (D := D) P)) :=
  let T := DegreeData.FrobeniusPowerFixedFieldTower.toFrobeniusFixedFieldTower
    (G := G) (D := D) P
  v.fixedTowerUnitAction T P.frobenius.1 P.frobenius_commute_field uBar -
    uBar -
    ∑ i ∈ s,
      (v.fixedTowerUnitAction T (τ i).1 (hτ i) (uBarᵢ i) - uBarᵢ i)

theorem unitRepresentation_generator_action_eq
    (v : ValuationData D A)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    [TotallyDisconnectedSpace G]
    (T : DegreeData.FrobeniusFixedFieldTower D)
    (g : T.Representative)
    (y : v.unitAddSubgroup
      (DegreeData.FrobeniusFixedFieldTower.field (G := G) (D := D) T)) :
    v.fixedTowerUnitAction T T.baseFrobenius.1 T.commute y =
      ((v.unitRepresentation T.extension T.normal).ρ
          (QuotientGroup.mk g.element) y :
        v.unitAddSubgroup
          (DegreeData.FrobeniusFixedFieldTower.field (G := G) (D := D) T)) := by
  let gK : T.ambientBase.field.toSubgroup :=
    ⟨g.element.1, (D.frobeniusFixedField_le T.ambientBase T.ambient.field
      T.ambient.below T.baseFrobenius) g.element.2⟩
  have hgKσ :
      (QuotientGroup.mk gK :
        T.ambientBase.field.toSubgroup ⧸
          D.extensionInertiaWithin T.ambientBase.field T.ambient.field
            T.ambient.below) = T.baseFrobenius.1 := by
    exact congrArg Subtype.val g.mapsToFrobenius
  apply Subtype.ext
  apply Subtype.ext
  change A.ρ (Quotient.out T.baseFrobenius.1).1 y.1.1 =
    A.ρ g.element.1 y.1.1
  calc
    A.ρ (Quotient.out T.baseFrobenius.1).1 y.1.1 =
        A.ρ gK.1 y.1.1 := by
      calc
        A.ρ (Quotient.out T.baseFrobenius.1).1 y.1.1 =
            (D.frobeniusFixedFieldAction A T.ambientBase T.ambient.field
              T.ambient.below T.fieldFrobenius T.baseFrobenius.1
                T.commute y.1).1 := by
                exact (D.frobeniusFixedFieldAction_coe A T.ambientBase
                  T.ambient.field T.ambient.below T.fieldFrobenius
                  T.baseFrobenius.1 T.commute y.1).symm
        _ = A.ρ gK.1 y.1.1 := by
          exact D.frobeniusFixedFieldAction_coe_of_mk
            A T.ambientBase T.ambient.field T.ambient.below
              T.fieldFrobenius T.baseFrobenius.1 T.commute gK hgKσ y.1
    _ = A.ρ g.element.1 y.1.1 := rfl

theorem universalNormDescent_fixedTower_solution
    (v : ValuationData D A)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    [TotallyDisconnectedSpace G]
    (hAxiom : v.SatisfiesUnramifiedUnitCohomology)
    (P : DegreeData.FrobeniusPowerFixedFieldTower D)
    {ι : Type v} (s : Finset ι)
    (τ : ι →
      (D.extensionNormalizedDegreeContinuous P.ambientBase P.ambient.field
        P.ambient.below).toMonoidHom.ker)
    (hτσ : ∀ i, (τ i).1 * P.baseFrobenius.1 =
      P.baseFrobenius.1 * (τ i).1)
    (hτσn : ∀ i, (τ i).1 * P.fieldFrobenius.1 =
      P.fieldFrobenius.1 * (τ i).1)
    (u : v.unitAddSubgroup P.toFrobeniusFixedFieldTower.base)
    (uᵢ : ι → v.unitAddSubgroup P.toFrobeniusFixedFieldTower.base)
    (hstar :
      A.ρ (Quotient.out P.frobenius.1).1 u.1.1 - u.1.1 =
        ∑ i ∈ s,
          (A.ρ (Quotient.out (τ i).1).1 (uᵢ i).1.1 - (uᵢ i).1.1)) :
    let T : DegreeData.FrobeniusFixedFieldTower D :=
      DegreeData.FrobeniusPowerFixedFieldTower.toFrobeniusFixedFieldTower
        (G := G) (D := D) P
    ∃ (uBar : v.unitAddSubgroup
          (DegreeData.FrobeniusFixedFieldTower.field (G := G) (D := D) T))
        (uBarᵢ : ι → v.unitAddSubgroup
          (DegreeData.FrobeniusFixedFieldTower.field (G := G) (D := D) T))
        (yBar : v.unitAddSubgroup
          (DegreeData.FrobeniusFixedFieldTower.field (G := G) (D := D) T)),
      relativeNorm A T.extension.base.field T.extension.field.field
          T.extension.below uBar.1 = u.1 ∧
      (∀ i, relativeNorm A T.extension.base.field T.extension.field.field
        T.extension.below
        (uBarᵢ i).1 = (uᵢ i).1) ∧
      v.fixedTowerUnitAction T P.baseFrobenius.1 T.commute yBar - yBar =
        v.powerTowerCorrection P s τ hτσn uBar uBarᵢ := by
  dsimp only
  let K := P.ambientBase
  let L := P.ambient.field
  let hLK := P.ambient.below
  let φ := P.frobenius
  let hφ := P.exponent_one
  let n := P.n
  let hn := P.n_pos
  let σ := P.baseFrobenius
  let σn := P.fieldFrobenius
  let tower := P.toFrobeniusFixedFieldTower
  let S := tower.base.field
  let T := tower.field.field
  let SF := tower.base
  let TF := tower.field
  let hTS := tower.field_le_base
  let hTSnormal : (extensionSubgroup S T hTS).Normal := tower.normal
  let : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK) :=
    P.ambient.finite
  let : Finite
      (S.toSubgroup ⧸ extensionSubgroup S T hTS) :=
    tower.finiteQuotient
  let : (extensionSubgroup S T hTS).Normal := hTSnormal
  have hφσ : φ.1 * σ.1 = σ.1 * φ.1 :=
    P.frobenius_commute_base
  have hφσn : φ.1 * σn.1 = σn.1 * φ.1 :=
    P.frobenius_commute_field
  have hσσn : σ.1 * σn.1 = σn.1 * σ.1 :=
    tower.commute
  have hTSunramified : (DegreeData.AbstractExtension.mk T S hTS).IsUnramified D :=
    D.frobeniusPowerFixedField_isUnramified K L hLK φ hφ n n hn hn
  obtain ⟨gS, hgClosure, _hgDegree, hg⟩ :=
    D.frobeniusPowerFixedField_generator K L hLK φ hφ n n hn hn
  let generator : tower.CyclicGenerator :=
    { element := gS
      mapsToFrobenius := hgClosure
      generates := hg }
  let g : S.toSubgroup ⧸ extensionSubgroup S T hTS := QuotientGroup.mk gS
  let : Fintype (S.toSubgroup ⧸ extensionSubgroup S T hTS) :=
    Fintype.ofFinite _
  let Kuc : FiniteAbstractField G := SF
  let Euc : FiniteUnramifiedCyclicExtension D Kuc :=
    { field := T
      below := hTS
      normal := hTSnormal
      finite := tower.finiteQuotient
      generator := g
      generates := hg
      unramified := hTSunramified }
  let E : FiniteAbstractFieldExtension G := Euc.toFiniteAbstractFieldExtension
  have hEnormal :
      (extensionSubgroup E.base.field E.field.field E.below).Normal :=
    Euc.normal
  let : (extensionSubgroup E.base.field E.field.field E.below).Normal :=
    hEnormal
  let : Fintype
      (E.base.field.toSubgroup ⧸
        extensionSubgroup E.base.field E.field.field E.below) :=
    Fintype.ofFinite _
  have hEunramified : E.IsUnramified D := by
    exact Euc.toFiniteAbstractFieldExtension_isUnramified
  have hA :
      CategoryTheory.Limits.IsZero
          (tateCohomology (v.unitRepresentation E hEnormal) 0) ∧
        CategoryTheory.Limits.IsZero
          (tateCohomology (v.unitRepresentation E hEnormal) (-1)) := by
    simpa [E, hEnormal,
      FiniteUnramifiedCyclicExtension.unitRepresentation] using
        hAxiom Kuc Euc
  obtain ⟨uBar, huBar⟩ :=
    v.exists_unit_relativeNorm_eq_of_tateHZero_isZero
      E hEnormal hEunramified g hg hA.1 u
  have huBarᵢ_exists (i : ι) : ∃ z : v.unitAddSubgroup TF,
      relativeNorm A S T hTS z.1 = (uᵢ i).1 :=
    v.exists_unit_relativeNorm_eq_of_tateHZero_isZero
      E hEnormal hEunramified g hg hA.1 (uᵢ i)
  choose uBarᵢ huBarᵢ using huBarᵢ_exists
  let delta : v.unitAddSubgroup TF :=
    v.powerTowerCorrection P s τ hτσn uBar uBarᵢ
  have hfixedAction
      (q : K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK)
      (hq : q * σn.1 = σn.1 * q)
      (z : v.unitAddSubgroup TF) :
      v.fixedTowerUnitAction tower q hq z =
        v.frobeniusFixedFieldUnitAction K L hLK σn q hq z := by
    apply Subtype.ext
    apply Subtype.ext
    change A.ρ (Quotient.out q).1 z.1.1 =
      A.ρ (Quotient.out q).1 z.1.1
    rfl
  have hdeltaRelativeNorm : relativeNorm A S T hTS delta.1 = 0 := by
    have hdeltaAmbient :
        delta.1 =
          (v.fixedTowerCorrection K L hLK σn s φ.1 hφσn
            (fun i => (τ i).1) hτσn uBar uBarᵢ).1 := by
      have hdeltaUnit :
          delta =
            v.fixedTowerCorrection K L hLK σn s φ.1 hφσn
              (fun i => (τ i).1) hτσn uBar uBarᵢ := by
        simp [delta, powerTowerCorrection,
          fixedTowerCorrection, tower, K, L, σn,
          hfixedAction]
        rfl
      exact congrArg Subtype.val hdeltaUnit
    rw [hdeltaAmbient]
    let : Finite ((baseField G).toSubgroup ⧸
        extensionSubgroup (baseField G) (D.frobeniusFixedField K L hLK σ)
          (le_baseField (D.frobeniusFixedField K L hLK σ))) :=
      tower.baseAbsoluteFinite
    exact
      v.fixedTowerCorrection_relativeNorm_eq_zero K L hLK σ σn hTS
        s φ.1 hφσ hφσn (fun i => (τ i).1) hτσ hτσn
        u uᵢ uBar uBarᵢ huBar huBarᵢ hstar
  let U := v.unitRepresentation E hEnormal
  have hdeltaNorm : U.norm.hom delta = 0 := by
    apply Subtype.ext
    apply Subtype.ext
    calc
      (((U.norm.hom delta).1 : ambientFixedAddSubgroup A T) : A.V) =
          ((relativeNorm A S T hTS delta.1 : ambientFixedAddSubgroup A S) : A.V) :=
        v.unitRepresentation_norm_coe E hEnormal delta
      _ = 0 := congrArg Subtype.val hdeltaRelativeNorm
      _ = (((0 : v.unitAddSubgroup TF).1 : ambientFixedAddSubgroup A T) : A.V) := rfl
  obtain ⟨yBar, hyBar⟩ :=
    v.exists_unit_sigma_sub_eq_of_tateHMinusOne_isZero
      E hEnormal g hg hA.2 delta hdeltaNorm
  have haction :=
    v.unitRepresentation_generator_action_eq
      tower generator.toRepresentative yBar
  have haction' :
      v.fixedTowerUnitAction tower σ.1 hσσn yBar = U.ρ g yBar := by
    apply Subtype.ext
    apply Subtype.ext
    calc
      (v.fixedTowerUnitAction tower σ.1 hσσn yBar).1.1 =
          (((v.unitRepresentation tower.extension tower.normal).ρ
            (QuotientGroup.mk generator.element) yBar).1.1 : A.V) :=
        congrArg (fun z : v.unitAddSubgroup TF => z.1.1) haction
      _ = (U.ρ g yBar).1.1 := by
        rfl
  refine ⟨uBar, uBarᵢ, yBar, huBar, huBarᵢ, ?_⟩
  rw [← haction'] at hyBar
  apply Subtype.ext
  apply Subtype.ext
  exact congrArg (fun z : v.unitAddSubgroup TF => z.1.1) hyBar

theorem maximalNorm_relativeNorm_fixedTower
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    [TotallyDisconnectedSpace G]
    (v : ValuationData D A)
    (FT : DegreeData.FiniteAmbientFrobeniusFixedFieldTower D)
    (generator : FT.toFrobeniusFixedFieldTower.CyclicGenerator)
    (n : ℕ)
    (hcard : (FT.extension.degree : ℕ) = n)
    (a : v.unitAddSubgroup
      (DegreeData.FrobeniusFixedFieldTower.field (G := G) (D := D)
        FT.toFrobeniusFixedFieldTower)) :
    letI : Finite
        ((D.maximalUnramifiedField FT.ambientBase.field).toSubgroup ⧸
          extensionSubgroup (D.maximalUnramifiedField FT.ambientBase.field)
            (D.maximalUnramifiedField FT.ambient.field)
            (D.maximalUnramifiedField_mono FT.ambient.below)) :=
      D.maximalUnramifiedExtension_finite FT.ambientBase.field
        FT.ambient.field FT.ambient.below
    let Ext := FT.extension
    let S := Ext.base.field
    let T := Ext.field.field
    let I := D.maximalUnramifiedField FT.ambientBase.field
    let E := D.maximalUnramifiedField FT.ambient.field
    let hTE : E.toSubgroup ≤ T.toSubgroup := by
      change (D.maximalUnramifiedField FT.ambient.field).toSubgroup ≤
        (D.frobeniusFixedField FT.ambientBase FT.ambient.field
          FT.ambient.below FT.fieldFrobenius).toSubgroup
      rw [D.maximalUnramifiedField_eq_fieldInertia]
      exact D.fieldInertia_le_frobeniusFixedField FT.ambientBase
        FT.ambient.field FT.ambient.below FT.fieldFrobenius
    let hSE : E.toSubgroup ≤ S.toSubgroup := by
      change (D.maximalUnramifiedField FT.ambient.field).toSubgroup ≤
        (D.frobeniusFixedField FT.ambientBase FT.ambient.field
          FT.ambient.below FT.baseFrobenius).toSubgroup
      rw [D.maximalUnramifiedField_eq_fieldInertia]
      exact D.fieldInertia_le_frobeniusFixedField FT.ambientBase
        FT.ambient.field FT.ambient.below FT.baseFrobenius
    let hEI := D.maximalUnramifiedField_mono FT.ambient.below
    let N := relativeNorm A I E hEI
    let J := fixedFieldInclusion A I E hEI
    J (N (fixedFieldInclusion A S E hSE
        (relativeNorm A S T Ext.below a.1))) =
      D.frobeniusPowerSum A FT.ambientBase.field FT.ambient.field
        FT.ambient.below FT.baseFrobenius.1 n
        (J (N (fixedFieldInclusion A T E hTE a.1))) := by
  dsimp only
  let tower := FT.toFrobeniusFixedFieldTower
  let K := FT.ambientBase
  let L := FT.ambient.field
  let hLK := FT.ambient.below
  let σ := FT.baseFrobenius
  let σ' := FT.fieldFrobenius
  let hTS := FT.field_le_base
  let hTSnormal : (extensionSubgroup FT.base.field FT.field.field hTS).Normal :=
    FT.normal
  let gS := generator.element
  let hgClosure := generator.mapsToFrobenius
  let hg := generator.generates
  let hσσ' := FT.commute
  let : Finite
      ((D.maximalUnramifiedField K.field).toSubgroup ⧸
        extensionSubgroup (D.maximalUnramifiedField K.field)
          (D.maximalUnramifiedField L)
          (D.maximalUnramifiedField_mono hLK)) :=
    D.maximalUnramifiedExtension_finite K.field L hLK
  let S := FT.base.field
  let T := FT.field.field
  let SF := FT.base
  let TF := FT.field
  let : Finite (S.toSubgroup ⧸ extensionSubgroup S T hTS) :=
    FT.finiteQuotient
  let : (extensionSubgroup S T hTS).Normal := hTSnormal
  let I := D.maximalUnramifiedField K.field
  let E := D.maximalUnramifiedField L
  let hTE : E.toSubgroup ≤ T.toSubgroup := by
    change (D.maximalUnramifiedField L).toSubgroup ≤
      (D.frobeniusFixedField K L hLK σ').toSubgroup
    rw [D.maximalUnramifiedField_eq_fieldInertia]
    exact D.fieldInertia_le_frobeniusFixedField K L hLK σ'
  let hSE : E.toSubgroup ≤ S.toSubgroup := by
    change (D.maximalUnramifiedField L).toSubgroup ≤
      (D.frobeniusFixedField K L hLK σ).toSubgroup
    rw [D.maximalUnramifiedField_eq_fieldInertia]
    exact D.fieldInertia_le_frobeniusFixedField K L hLK σ
  let hEI := D.maximalUnramifiedField_mono hLK
  let N := relativeNorm A I E hEI
  let J := fixedFieldInclusion A I E hEI
  let Ext : FiniteAbstractFieldExtension G := FT.extension
  have hExtNormal :
      (extensionSubgroup Ext.base.field Ext.field.field Ext.below).Normal :=
    FT.normal
  let : (extensionSubgroup Ext.base.field Ext.field.field Ext.below).Normal :=
    hExtNormal
  let U := v.unitRepresentation Ext hExtNormal
  let g : S.toSubgroup ⧸ extensionSubgroup S T hTS := QuotientGroup.mk gS
  let f : v.unitAddSubgroup TF → v.unitAddSubgroup TF :=
    v.frobeniusFixedFieldUnitAction K L hLK σ' σ.1 hσσ'
  let F : v.unitAddSubgroup TF →+ ambientFixedAddSubgroup A E :=
    (J.comp N).comp
      ((fixedFieldInclusion A T E hTE).comp (v.unitAddSubgroup TF).subtype)
  let act : ambientFixedAddSubgroup A E → ambientFixedAddSubgroup A E :=
    D.frobeniusQuotientAction A K.field L hLK σ.1
  have hsemiconj : Function.Semiconj F f act := by
    intro z
    have hIncl := D.frobeniusFixedFieldAction_inclusion A K L hLK
      σ' σ.1 hσσ' z.1
    have hNorm := D.maximalUnramifiedNorm_frobeniusQuotientAction
      A K.field L hLK σ.1 (fixedFieldInclusion A T E hTE z.1)
    calc
      F (f z) = J (N (D.frobeniusQuotientAction A K.field L hLK σ.1
          (fixedFieldInclusion A T E hTE z.1))) := by
        apply congrArg (J.comp N)
        exact hIncl
      _ = D.frobeniusQuotientAction A K.field L hLK σ.1
          (J (N (fixedFieldInclusion A T E hTE z.1))) := hNorm
      _ = act (F z) := rfl
  let : Fintype (S.toSubgroup ⧸ extensionSubgroup S T hTS) :=
    Fintype.ofFinite _
  let : Fintype
      (Ext.base.field.toSubgroup ⧸
        extensionSubgroup Ext.base.field Ext.field.field Ext.below) := by
    change Fintype (S.toSubgroup ⧸ extensionSubgroup S T hTS)
    infer_instance
  have hcard' : Fintype.card
      (S.toSubgroup ⧸ extensionSubgroup S T hTS) = n := by
    calc
      Fintype.card (S.toSubgroup ⧸ extensionSubgroup S T hTS) =
          Nat.card (S.toSubgroup ⧸ extensionSubgroup S T hTS) := by
        rw [Nat.card_eq_fintype_card]
      _ = (Ext.degree : ℕ) :=
        Ext.toFiniteAbstractExtension.degree_coe.symm
      _ = n := hcard
  have hgen (z : v.unitAddSubgroup TF) : U.ρ g z = f z :=
    (v.unitRepresentation_generator_action_eq
      tower generator.toRepresentative z).symm
  have hRep := rep_norm_eq_generatorIterateSum U g hg n hcard' f hgen a
  have hMapped : F (U.norm.hom a) =
      ∑ i : Fin n, F ((f^[i.1]) a) := by
    calc
      F (U.norm.hom a) = F (∑ i : Fin n, (f^[i.1]) a) :=
        congrArg F hRep
      _ = ∑ i : Fin n, F ((f^[i.1]) a) :=
        map_sum F (fun i : Fin n => (f^[i.1]) a) Finset.univ
  have hMapped' : F (U.norm.hom a) =
      ∑ i : Fin n, D.frobeniusQuotientAction A K.field L hLK
        (σ.1 ^ i.1) (F a) := by
    calc
      F (U.norm.hom a) = ∑ i : Fin n, F ((f^[i.1]) a) := hMapped
      _ = ∑ i : Fin n, (act^[i.1]) (F a) := by
        apply Finset.sum_congr rfl
        intro i _
        exact hsemiconj.iterate_right i.1 a
      _ = _ := by
        apply Finset.sum_congr rfl
        intro i _
        let B := D.frobeniusQuotientRepresentation A K.field L hLK
        have hpow :=
          (rep_action_pow_eq_iterate B σ.1 i.1 (F a)).symm
        change
          ((D.frobeniusQuotientAction A K.field L hLK σ.1)^[i.1]) (F a) =
            D.frobeniusQuotientAction A K.field L hLK
              (σ.1 ^ i.1) (F a) at hpow
        simpa only [act] using hpow
  have hLeft : F (U.norm.hom a) =
      J (N (fixedFieldInclusion A S E hSE
        (relativeNorm A S T hTS a.1))) := by
    apply congrArg (J.comp N)
    apply Subtype.ext
    exact v.unitRepresentation_norm_coe Ext hExtNormal a
  calc
    J (N (fixedFieldInclusion A S E hSE
        (relativeNorm A S T hTS a.1))) = F (U.norm.hom a) := hLeft.symm
    _ = ∑ i : Fin n, D.frobeniusQuotientAction A K.field L hLK
        (σ.1 ^ i.1) (F a) := hMapped'
    _ = D.frobeniusPowerSum A K.field L hLK σ.1 n
        (J (N (fixedFieldInclusion A T E hTE a.1))) := rfl

theorem universalNormDescent_correctedEquation
    (v : ValuationData D A)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    [TotallyDisconnectedSpace G]
    (K : DegreeData.FiniteResidueAbstractField D) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (σ σn : D.FrobeniusElements K L hLK)
    {ι : Type v} (s : Finset ι)
    (φ : K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK)
    (hφσn : φ * σn.1 = σn.1 * φ)
    (τ : ι →
      K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK)
    (hτσn : ∀ i, τ i * σn.1 = σn.1 * τ i)
    (hσσn : σ.1 * σn.1 = σn.1 * σ.1)
    [hTabsolute : Finite ((baseField G).toSubgroup ⧸
      extensionSubgroup (baseField G)
        (D.frobeniusFixedField K L hLK σn)
        (le_baseField (D.frobeniusFixedField K L hLK σn)))]
    (n : ℕ)
    (hσpow : σ.1 = φ ^ n)
    (uBar : v.unitAddSubgroup
      (D.frobeniusFixedAbstractField K L hLK σn))
    (uBarᵢ : ι → v.unitAddSubgroup
      (D.frobeniusFixedAbstractField K L hLK σn))
    (yBar : v.unitAddSubgroup
      (D.frobeniusFixedAbstractField K L hLK σn))
    (hyBar :
      v.frobeniusFixedFieldUnitAction K L hLK σn σ.1 hσσn yBar - yBar =
        v.fixedTowerCorrection K L hLK σn s φ hφσn
          τ hτσn uBar uBarᵢ) :
    let E := D.maximalUnramifiedField L
    let hTE := D.fieldInertia_le_frobeniusFixedField K L hLK σn
    let uBarE := fixedFieldInclusion A
      (D.frobeniusFixedField K L hLK σn) E hTE uBar.1
    let uBarᵢE := fun i => fixedFieldInclusion A
      (D.frobeniusFixedField K L hLK σn) E hTE (uBarᵢ i).1
    let yBarE := fixedFieldInclusion A
      (D.frobeniusFixedField K L hLK σn) E hTE yBar.1
    let w := uBarE - D.frobeniusPowerSum A K.field L hLK φ n yBarE
    D.frobeniusQuotientAction A K.field L hLK φ w - w =
      ∑ i ∈ s,
        (D.frobeniusQuotientAction A K.field L hLK (τ i) (uBarᵢE i) -
          uBarᵢE i) := by
  dsimp only
  let T := D.frobeniusFixedField K L hLK σn
  let TF := D.frobeniusFixedAbstractField K L hLK σn
  let E := D.maximalUnramifiedField L
  let hTE := D.fieldInertia_le_frobeniusFixedField K L hLK σn
  let uBarE := fixedFieldInclusion A T E hTE uBar.1
  let uBarᵢE := fun i => fixedFieldInclusion A T E hTE (uBarᵢ i).1
  let yBarE := fixedFieldInclusion A T E hTE yBar.1
  let φny := D.frobeniusPowerSum A K.field L hLK φ n yBarE
  let w := uBarE - φny
  have hdeltaCoe := v.fixedTowerCorrection_coe K L hLK σn
    s φ hφσn τ hτσn uBar uBarᵢ
  have hyVal := congrArg (fun z : v.unitAddSubgroup TF => z.1.1) hyBar
  have hdeltaVal := congrArg
    (fun z : ambientFixedAddSubgroup A TF.field => z.1) hdeltaCoe
  have hdeltaVal' :
      (v.fixedTowerCorrection K L hLK σn s φ hφσn
        τ hτσn uBar uBarᵢ).1.1 =
        A.ρ (Quotient.out φ).1 uBar.1.1 - uBar.1.1 -
          ∑ i ∈ s,
            (A.ρ (Quotient.out (τ i)).1 (uBarᵢ i).1.1 -
              (uBarᵢ i).1.1) := by
    change
      (v.fixedTowerCorrection K L hLK σn s φ hφσn
        τ hτσn uBar uBarᵢ).1.1 =
        (AddSubgroup.subtype (ambientFixedAddSubgroup A TF.field))
          ((v.frobeniusFixedFieldUnitAction K L hLK σn
              φ hφσn uBar).1 -
            uBar.1 - ∑ i ∈ s,
              ((v.frobeniusFixedFieldUnitAction K L hLK σn
                (τ i) (hτσn i) (uBarᵢ i)).1 - (uBarᵢ i).1)) at hdeltaVal
    rw [map_sub, map_sub, map_sum] at hdeltaVal
    simp only [ValuationData.frobeniusFixedFieldUnitAction] at hdeltaVal
    exact hdeltaVal
  have hraw :
      A.ρ (Quotient.out σ.1).1 yBar.1.1 - yBar.1.1 =
        A.ρ (Quotient.out φ).1 uBar.1.1 - uBar.1.1 -
          ∑ i ∈ s,
            (A.ρ (Quotient.out (τ i)).1 (uBarᵢ i).1.1 -
              (uBarᵢ i).1.1) :=
    hyVal.trans hdeltaVal'
  have hcorrE :
      D.frobeniusQuotientAction A K.field L hLK σ.1 yBarE - yBarE =
        D.frobeniusQuotientAction A K.field L hLK φ uBarE - uBarE -
          ∑ i ∈ s,
            (D.frobeniusQuotientAction A K.field L hLK (τ i) (uBarᵢE i) -
              uBarᵢE i) := by
    apply Subtype.ext
    change
      (AddSubgroup.subtype (ambientFixedAddSubgroup A E))
          (D.frobeniusQuotientAction A K.field L hLK σ.1 yBarE - yBarE) =
        (AddSubgroup.subtype (ambientFixedAddSubgroup A E))
          (D.frobeniusQuotientAction A K.field L hLK φ uBarE - uBarE -
            ∑ i ∈ s,
              (D.frobeniusQuotientAction A K.field L hLK (τ i) (uBarᵢE i) -
                uBarᵢE i))
    rw [map_sub, map_sub, map_sum]
    simp_rw [map_sub]
    change
      (D.frobeniusQuotientAction A K.field L hLK σ.1 yBarE).1 - yBarE.1 =
        (D.frobeniusQuotientAction A K.field L hLK φ uBarE).1 - uBarE.1 -
          ∑ i ∈ s,
            ((D.frobeniusQuotientAction A K.field L hLK (τ i) (uBarᵢE i)).1 -
              (uBarᵢE i).1)
    simp_rw [D.frobeniusQuotientAction_coe_out]
    exact hraw
  have htel := D.frobeniusPowerSum_action_sub A K.field L hLK φ n yBarE
  rw [← hσpow] at htel
  have hw :
      D.frobeniusQuotientAction A K.field L hLK φ w - w =
        (D.frobeniusQuotientAction A K.field L hLK φ uBarE - uBarE) -
          (D.frobeniusQuotientAction A K.field L hLK φ φny - φny) := by
    dsimp [w]
    apply Subtype.ext
    change
      (AddSubgroup.subtype (ambientFixedAddSubgroup A E))
          (D.frobeniusQuotientAction A K.field L hLK φ (uBarE - φny) -
            (uBarE - φny)) =
        (AddSubgroup.subtype (ambientFixedAddSubgroup A E))
          ((D.frobeniusQuotientAction A K.field L hLK φ uBarE - uBarE) -
            (D.frobeniusQuotientAction A K.field L hLK φ φny - φny))
    rw [map_sub, map_sub, map_sub, map_sub]
    change
      (D.frobeniusQuotientAction A K.field L hLK φ (uBarE - φny)).1 -
          (uBarE.1 - φny.1) =
        ((D.frobeniusQuotientAction A K.field L hLK φ uBarE).1 - uBarE.1) -
          ((D.frobeniusQuotientAction A K.field L hLK φ φny).1 - φny.1)
    simp_rw [D.frobeniusQuotientAction_coe_out]
    change
      A.ρ (Quotient.out φ).1 (uBarE.1 - φny.1) -
          (uBarE.1 - φny.1) =
        (A.ρ (Quotient.out φ).1 uBarE.1 - uBarE.1) -
          (A.ρ (Quotient.out φ).1 φny.1 - φny.1)
    rw [map_sub]
    abel
  rw [hw, htel, hcorrE]
  abel
end ValuationData
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

theorem descend_maximalUnramified_fixed_unit_of_finiteSupport
    (v : ValuationData D A) [IsTopologicalGroup G]
    (K : FiniteAbstractField G) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    (φ : D.FrobeniusElements (K.toFiniteResidueAbstractField D) L hLK)
    (hφ : D.frobeniusExponent
      (K.toFiniteResidueAbstractField D) L hLK φ = 1)
    (P : FiniteIntermediateField (D.maximalUnramifiedField L) K.field)
    [hPnormal : (extensionSubgroup K.field P.field P.below).Normal]
    (aI : ambientFixedAddSubgroup A (D.maximalUnramifiedField K.field))
    (aP : v.unitAddSubgroup (P.toFiniteAbstractField K))
    (hsupport :
      fixedFieldInclusion A P.field (D.maximalUnramifiedField L) P.above aP.1 =
        fixedFieldInclusion A (D.maximalUnramifiedField K.field)
          (D.maximalUnramifiedField L) (D.maximalUnramifiedField_mono hLK) aI)
    (hfixed :
      D.frobeniusQuotientAction A K.field L hLK φ.1
          (fixedFieldInclusion A (D.maximalUnramifiedField K.field)
            (D.maximalUnramifiedField L) (D.maximalUnramifiedField_mono hLK) aI) =
        fixedFieldInclusion A (D.maximalUnramifiedField K.field)
          (D.maximalUnramifiedField L) (D.maximalUnramifiedField_mono hLK) aI) :
    ∃ aK : v.unitAddSubgroup K,
      fixedFieldInclusion A K.field (D.maximalUnramifiedField K.field)
        (D.maximalUnramifiedField_le K.field) aK.1 = aI := by
  obtain ⟨bK, hbK⟩ :=
    D.descend_maximalUnramified_fixed_of_finiteSupport
      A (K.toFiniteResidueAbstractField D) L hLK φ hφ
        P aI aP.1 hsupport hfixed
  let : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field P.field P.below) :=
    P.finite
  let EP := P.toFiniteAbstractFieldExtension K
  have hKP :
      fixedFieldInclusion A K.field P.field P.below bK = aP.1 := by
    apply Subtype.ext
    have hsupportVal := congrArg
      (fun z : ambientFixedAddSubgroup A (D.maximalUnramifiedField L) => z.1)
      hsupport
    have hbKVal := congrArg
      (fun z : ambientFixedAddSubgroup A (D.maximalUnramifiedField K.field) => z.1)
      hbK
    exact hbKVal.trans hsupportVal.symm
  have htower := v.normalizedValuation_tower EP
    (fixedFieldInclusion A K.field P.field P.below bK)
  have hvalP :
      v.valuationAt EP.field
        (fixedFieldInclusion A K.field P.field P.below bK) = 0 := by
    rw [hKP]
    exact aP.2
  have hmul :
      (EP.degree : ℕ) •
        ((v.valuationAt K bK : v.valueGroup) : ZHat) = 0 := by
    let ER := EP.toFiniteResidueAbstractExtension D
    change (ER.residueDegree : ℕ) •
        ((v.valuationAt EP.field
          (fixedFieldInclusion A K.field P.field P.below bK) :
            v.valueGroup) : ZHat) =
      ((v.valuationAt K
        (relativeNorm A K.field P.field P.below
          (fixedFieldInclusion A K.field P.field P.below bK)) :
            v.valueGroup) : ZHat) at htower
    rw [hvalP] at htower
    rw [show relativeNorm A K.field P.field P.below
        (fixedFieldInclusion A K.field P.field P.below bK) =
          (EP.degree : ℕ) • bK by
      exact relativeNorm_fixedFieldInclusion A EP.toFiniteAbstractExtension bK,
      map_nsmul] at htower
    simpa using htower.symm
  have hbKunit : bK ∈ v.unitAddSubgroup K := by
    rw [v.mem_unitAddSubgroup_iff]
    apply Subtype.ext
    apply zHatMulNat_injective EP.degree.property
    change (EP.degree : ℕ) •
        ((v.valuationAt K bK : v.valueGroup) : ZHat) =
      (EP.degree : ℕ) • ((0 : v.valueGroup) : ZHat)
    simpa using hmul
  exact ⟨⟨bK, hbKunit⟩, hbK⟩

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

theorem maximalUnramifiedNorm_mem_infiniteUnitAddSubgroup
    (v : ValuationData D A) [IsTopologicalGroup G]
    (K : FiniteAbstractField G) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    [hLfinite : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK)]
    (a : ambientFixedAddSubgroup A (D.maximalUnramifiedField L))
    (ha : a ∈ v.infiniteUnitAddSubgroup
      (D.maximalUnramifiedField L) K
      (D.maximalUnramifiedField_le_of_le hLK)) :
    letI : Finite
        ((D.maximalUnramifiedField K.field).toSubgroup ⧸
          extensionSubgroup (D.maximalUnramifiedField K.field)
            (D.maximalUnramifiedField L)
            (D.maximalUnramifiedField_mono hLK)) :=
      D.maximalUnramifiedExtension_finite K.field L hLK
    fixedFieldInclusion A (D.maximalUnramifiedField K.field)
        (D.maximalUnramifiedField L) (D.maximalUnramifiedField_mono hLK)
        (relativeNorm A (D.maximalUnramifiedField K.field)
          (D.maximalUnramifiedField L) (D.maximalUnramifiedField_mono hLK) a)
      ∈ v.infiniteUnitAddSubgroup (D.maximalUnramifiedField L) K
        (D.maximalUnramifiedField_le_of_le hLK) := by
  let : Finite
      ((D.maximalUnramifiedField K.field).toSubgroup ⧸
        extensionSubgroup (D.maximalUnramifiedField K.field)
          (D.maximalUnramifiedField L)
          (D.maximalUnramifiedField_mono hLK)) :=
    D.maximalUnramifiedExtension_finite K.field L hLK
  let I := D.maximalUnramifiedField K.field
  let E := D.maximalUnramifiedField L
  let hEI := D.maximalUnramifiedField_mono hLK
  let N := relativeNorm A I E hEI
  let : Fintype (I.toSubgroup ⧸ extensionSubgroup I E hEI) :=
    Fintype.ofFinite _
  let qK (q : I.toSubgroup ⧸ extensionSubgroup I E hEI) :
      K.field.toSubgroup ⧸ D.extensionInertiaWithin K.field L hLK :=
    let r : I.toSubgroup := Quotient.out q
    let k : K.field.toSubgroup :=
      ⟨r.1, (D.maximalUnramifiedField_le K.field) r.2⟩
    QuotientGroup.mk k
  let f (q : I.toSubgroup ⧸ extensionSubgroup I E hEI) :
      ambientFixedAddSubgroup A E :=
    D.frobeniusQuotientAction A K.field L hLK (qK q) a
  have hterm (q : I.toSubgroup ⧸ extensionSubgroup I E hEI) :
      f q ∈ v.infiniteUnitAddSubgroup E K
        (D.maximalUnramifiedField_le_of_le hLK) := by
    exact
      v.frobeniusQuotientAction_mem_infiniteUnitAddSubgroup
        K L hLK (qK q) a ha
  have hsum :
      ∑ q : I.toSubgroup ⧸ extensionSubgroup I E hEI, f q ∈
        v.infiniteUnitAddSubgroup E K
          (D.maximalUnramifiedField_le_of_le hLK) :=
    AddSubgroup.sum_mem _ (fun q _ => hterm q)
  have heq :
      fixedFieldInclusion A I E hEI (N a) =
        ∑ q : I.toSubgroup ⧸ extensionSubgroup I E hEI, f q := by
    apply Subtype.ext
    rw [fixedFieldInclusion_coe, relativeNorm_apply_coe]
    rw [relativeNormValue]
    change
      ∑ q : I.toSubgroup ⧸ extensionSubgroup I E hEI,
          relativeCosetAction A I E hEI a q =
        (AddSubgroup.subtype (ambientFixedAddSubgroup A E))
          (∑ q : I.toSubgroup ⧸ extensionSubgroup I E hEI, f q)
    rw [map_sum]
    apply Finset.sum_congr rfl
    intro q _
    let r : I.toSubgroup := Quotient.out q
    have hrq : (QuotientGroup.mk r :
        I.toSubgroup ⧸ extensionSubgroup I E hEI) = q :=
      Quotient.out_eq' q
    change relativeCosetAction A I E hEI a q = (f q).1
    calc
      relativeCosetAction A I E hEI a q =
          relativeCosetAction A I E hEI a (QuotientGroup.mk r) :=
        congrArg (relativeCosetAction A I E hEI a) hrq.symm
      _ = A.ρ r.1 a.1 := relativeCosetAction_mk A I E hEI a r
      _ = (f q).1 := by rfl
  rw [heq]
  exact hsum

theorem descend_maximalUnramifiedNorm_unit
    (v : ValuationData D A) [IsTopologicalGroup G]
    (K : FiniteAbstractField G) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    [hLfinite : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK)]
    (φ : D.FrobeniusElements (K.toFiniteResidueAbstractField D) L hLK)
    (hφ : D.frobeniusExponent
      (K.toFiniteResidueAbstractField D) L hLK φ = 1)
    (a : ambientFixedAddSubgroup A (D.maximalUnramifiedField L))
    (ha : a ∈ v.infiniteUnitAddSubgroup (D.maximalUnramifiedField L) K
      (D.maximalUnramifiedField_le_of_le hLK))
    (hfixed :
      letI : Finite
          ((D.maximalUnramifiedField K.field).toSubgroup ⧸
            extensionSubgroup (D.maximalUnramifiedField K.field)
              (D.maximalUnramifiedField L)
              (D.maximalUnramifiedField_mono hLK)) :=
        D.maximalUnramifiedExtension_finite K.field L hLK
      let N := relativeNorm A (D.maximalUnramifiedField K.field)
        (D.maximalUnramifiedField L) (D.maximalUnramifiedField_mono hLK)
      let J := fixedFieldInclusion A (D.maximalUnramifiedField K.field)
        (D.maximalUnramifiedField L) (D.maximalUnramifiedField_mono hLK)
      D.frobeniusQuotientAction A K.field L hLK φ.1 (J (N a)) = J (N a)) :
    letI : Finite
        ((D.maximalUnramifiedField K.field).toSubgroup ⧸
          extensionSubgroup (D.maximalUnramifiedField K.field)
            (D.maximalUnramifiedField L)
            (D.maximalUnramifiedField_mono hLK)) :=
      D.maximalUnramifiedExtension_finite K.field L hLK
    ∃ aK : v.unitAddSubgroup K,
      fixedFieldInclusion A K.field (D.maximalUnramifiedField K.field)
        (D.maximalUnramifiedField_le K.field) aK.1 =
        relativeNorm A (D.maximalUnramifiedField K.field)
          (D.maximalUnramifiedField L) (D.maximalUnramifiedField_mono hLK) a := by
  let : Finite
      ((D.maximalUnramifiedField K.field).toSubgroup ⧸
        extensionSubgroup (D.maximalUnramifiedField K.field)
          (D.maximalUnramifiedField L)
          (D.maximalUnramifiedField_mono hLK)) :=
    D.maximalUnramifiedExtension_finite K.field L hLK
  let I := D.maximalUnramifiedField K.field
  let E := D.maximalUnramifiedField L
  let hEI := D.maximalUnramifiedField_mono hLK
  let N := relativeNorm A I E hEI
  let J := fixedFieldInclusion A I E hEI
  let hEnormal : (extensionSubgroup K.field E
      (D.maximalUnramifiedField_le_of_le hLK)).Normal :=
    D.extensionSubgroup_maximalUnramifiedField_normal K.field L hLK
  have hmem : J (N a) ∈ v.infiniteUnitAddSubgroup E K
      (D.maximalUnramifiedField_le_of_le hLK) :=
    v.maximalUnramifiedNorm_mem_infiniteUnitAddSubgroup K L hLK a ha
  rcases hmem with ⟨Q, aQ, haQ⟩
  let R := Q.galoisRefinement
  let hRQ : R.field.toSubgroup ≤ Q.field.toSubgroup :=
    Q.galoisRefinement_le_field
  let hQabsolute : Finite ((baseField G).toSubgroup ⧸
      extensionSubgroup (baseField G) Q.field (le_baseField Q.field)) :=
    Q.absoluteFinite
  let hRfinite : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field R.field R.below) :=
    R.finite
  let hRQfinite : Finite
      (Q.field.toSubgroup ⧸ extensionSubgroup Q.field R.field hRQ) :=
    FiniteIntermediateField.finite_extension_of_le R.below Q.below hRQ
  let : Finite
      ((Q.toFiniteAbstractField K).field.toSubgroup ⧸
        extensionSubgroup (Q.toFiniteAbstractField K).field R.field hRQ) := by
    change Finite
      (Q.field.toSubgroup ⧸ extensionSubgroup Q.field R.field hRQ)
    exact hRQfinite
  let hRnormal : (extensionSubgroup K.field R.field R.below).Normal :=
    FiniteIntermediateField.galoisRefinement_normal Q
  let EQR : FiniteAbstractFieldExtension G :=
    FiniteAbstractFieldExtension.ofInclusion
      R.field (Q.toFiniteAbstractField K) hRQ
  let hEQRfield : EQR.field = R.toFiniteAbstractField K :=
    FiniteAbstractField.eq_of_field_eq _ _ rfl
  let aR : v.unitAddSubgroup (R.toFiniteAbstractField K) :=
    hEQRfield ▸ v.finiteUnitInclusion EQR aQ
  have haR : fixedFieldInclusion A R.field E R.above aR.1 = J (N a) := by
    apply Subtype.ext
    change aR.1.1 = (J (N a)).1
    have haRcoe : aR.1.1 = aQ.1.1 :=
      v.finiteUnitInclusion_transport_coe EQR
        (R.toFiniteAbstractField K) hEQRfield aQ
    rw [haRcoe]
    exact congrArg Subtype.val haQ
  exact v.descend_maximalUnramified_fixed_unit_of_finiteSupport
    K L hLK φ hφ R (N a) aR haR hfixed
end ValuationData
end
end ClassFormation
end

/- ClassFieldTheory.AbstractClassFieldTheory.Reciprocity.Construction.InfiniteUnitNormSubgroup -/
section
universe u
namespace ClassFormation
open KummerTheory
open CyclicCohomology
noncomputable section
open CategoryTheory
open scoped BigOperators
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
namespace ValuationData
variable {D : DegreeData G} {A : Rep ℤ G}
 
def finiteIntermediateUnitNormRange
    (v : ValuationData D A) (E : ClosedSubgroup G)
    (K : FiniteAbstractField G)
    (M : FiniteIntermediateField E K.field) :
    AddSubgroup (ambientFixedAddSubgroup A K.field) := by
  letI : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field M.field M.below) :=
    M.finite
  exact ((relativeNorm A K.field M.field M.below).comp
    (v.unitAddSubgroup (M.toFiniteAbstractField K)).subtype).range

theorem mem_finiteIntermediateUnitNormRange_of_overfield
    (v : ValuationData D A) (E : ClosedSubgroup G)
    (K : FiniteAbstractField G)
    (M P : FiniteIntermediateField E K.field)
    (hPM : P.field.toSubgroup ≤ M.field.toSubgroup)
    [hPfinite : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field P.field P.below)]
    (uP : v.unitAddSubgroup (P.toFiniteAbstractField K))
    (aK : ambientFixedAddSubgroup A K.field)
    (haK : relativeNorm A K.field P.field P.below uP.1 = aK) :
    aK ∈ v.finiteIntermediateUnitNormRange E K M := by
  let hMfinite : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field M.field M.below) :=
    M.finite
  let hPMfinite : Finite
      (M.field.toSubgroup ⧸ extensionSubgroup M.field P.field hPM) :=
    FiniteIntermediateField.finite_extension_of_le P.below M.below hPM
  let : Finite
      ((M.toFiniteAbstractField K).field.toSubgroup ⧸
        extensionSubgroup (M.toFiniteAbstractField K).field P.field hPM) := by
    change Finite
      (M.field.toSubgroup ⧸ extensionSubgroup M.field P.field hPM)
    exact hPMfinite
  let EMP : FiniteAbstractFieldExtension G :=
    FiniteAbstractFieldExtension.ofInclusion
      P.field (M.toFiniteAbstractField K) hPM
  let uM : v.unitAddSubgroup (M.toFiniteAbstractField K) :=
    by
      simpa [EMP, FiniteAbstractFieldExtension.ofInclusion] using
        v.finiteUnitNorm EMP uP
  let T : DegreeData.FiniteTower G := {
    top := P.field
    middle := M.field
    base := K.field
    top_le_middle := hPM
    middle_le_base := M.below
    finiteTopQuotient := hPMfinite
    finiteBaseQuotient := hMfinite }
  simp only [finiteIntermediateUnitNormRange]
  change aK ∈ ((relativeNorm A K.field M.field M.below).comp
    (v.unitAddSubgroup (M.toFiniteAbstractField K)).subtype).range
  refine ⟨uM, ?_⟩
  change relativeNorm A K.field M.field M.below
      (relativeNorm A M.field P.field hPM uP.1) = aK
  calc
    _ = relativeNorm A K.field P.field (hPM.trans M.below) uP.1 :=
      T.norm_trans_apply A uP.1
    _ = relativeNorm A K.field P.field P.below uP.1 := by rfl
    _ = aK := haK

def infiniteUnitNormSubgroup
    (v : ValuationData D A) (E : ClosedSubgroup G)
    (K : FiniteAbstractField G) :
    AddSubgroup (ambientFixedAddSubgroup A K.field) :=
  ⨅ M : FiniteIntermediateField E K.field,
    v.finiteIntermediateUnitNormRange E K M

@[simp]
theorem mem_infiniteUnitNormSubgroup_iff
    (v : ValuationData D A) (E : ClosedSubgroup G)
    (K : FiniteAbstractField G)
    (a : ambientFixedAddSubgroup A K.field) :
    a ∈ v.infiniteUnitNormSubgroup E K ↔
      ∀ M : FiniteIntermediateField E K.field,
        a ∈ v.finiteIntermediateUnitNormRange E K M := by
  simp [infiniteUnitNormSubgroup]
end ValuationData
end
end ClassFormation
end

/- ClassFieldTheory.AbstractClassFieldTheory.Reciprocity.Construction.Universal -/
section
namespace ClassFormation
open KummerTheory
open CyclicCohomology
noncomputable section
open CategoryTheory
open scoped BigOperators
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
namespace ValuationData
variable {D : DegreeData G} {A : Rep ℤ G}

theorem universalNormDescent_endpoint_descent
    (v : ValuationData D A) [IsTopologicalGroup G]
    (K : FiniteAbstractField G) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    [hLfinite : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK)]
    (φ : D.FrobeniusElements (K.toFiniteResidueAbstractField D) L hLK)
    (hφ : D.frobeniusExponent
      (K.toFiniteResidueAbstractField D) L hLK φ = 1)
    {ι : Type*} (s : Finset ι)
    (τ : ι →
      (D.extensionNormalizedDegreeContinuous
        (K.toFiniteResidueAbstractField D) L hLK).toMonoidHom.ker)
    (u : v.infiniteUnitAddSubgroup (D.maximalUnramifiedField L) K
      (D.maximalUnramifiedField_le_of_le hLK))
    (uᵢ : ι → v.infiniteUnitAddSubgroup (D.maximalUnramifiedField L) K
      (D.maximalUnramifiedField_le_of_le hLK))
    (hstar : D.frobeniusQuotientAction A K.field L hLK φ.1 u.1 - u.1 =
      ∑ i ∈ s,
        (D.frobeniusQuotientAction A K.field L hLK (τ i).1 (uᵢ i).1 -
          (uᵢ i).1)) :
    letI : Finite
        ((D.maximalUnramifiedField K.field).toSubgroup ⧸
          extensionSubgroup (D.maximalUnramifiedField K.field)
            (D.maximalUnramifiedField L)
            (D.maximalUnramifiedField_mono hLK)) :=
      D.maximalUnramifiedExtension_finite K.field L hLK
    ∃ aK : v.unitAddSubgroup K,
      fixedFieldInclusion A K.field (D.maximalUnramifiedField K.field)
        (D.maximalUnramifiedField_le K.field) aK.1 =
        relativeNorm A (D.maximalUnramifiedField K.field)
          (D.maximalUnramifiedField L) (D.maximalUnramifiedField_mono hLK) u.1 := by
  let : Finite
      ((D.maximalUnramifiedField K.field).toSubgroup ⧸
        extensionSubgroup (D.maximalUnramifiedField K.field)
          (D.maximalUnramifiedField L)
          (D.maximalUnramifiedField_mono hLK)) :=
    D.maximalUnramifiedExtension_finite K.field L hLK
  have hfixed := D.maximalUnramifiedNorm_fixed_of_hstar A
    (K.toFiniteResidueAbstractField D) L hLK
    s φ.1 τ u.1 (fun i => (uᵢ i).1) hstar
  exact v.descend_maximalUnramifiedNorm_unit K L hLK φ hφ u.1 u.2 hfixed

theorem universalNormDescent_mem_finiteUnitNormRange
    (v : ValuationData D A)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    [TotallyDisconnectedSpace G]
    (hAxiom : v.SatisfiesUnramifiedUnitCohomology)
    (K : FiniteAbstractField G) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    [hLfinite : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK)]
    (φ : D.FrobeniusElements (K.toFiniteResidueAbstractField D) L hLK)
    (hφ : D.frobeniusExponent
      (K.toFiniteResidueAbstractField D) L hLK φ = 1)
    {ι : Type*} (s : Finset ι)
    (τ : ι →
      (D.extensionNormalizedDegreeContinuous
        (K.toFiniteResidueAbstractField D) L hLK).toMonoidHom.ker)
    (u : v.infiniteUnitAddSubgroup (D.maximalUnramifiedField L) K
      (D.maximalUnramifiedField_le_of_le hLK))
    (uᵢ : ι → v.infiniteUnitAddSubgroup (D.maximalUnramifiedField L) K
      (D.maximalUnramifiedField_le_of_le hLK))
    (hstar : D.frobeniusQuotientAction A K.field L hLK φ.1 u.1 - u.1 =
      ∑ i ∈ s,
        (D.frobeniusQuotientAction A K.field L hLK (τ i).1 (uᵢ i).1 -
          (uᵢ i).1))
    (aK : v.unitAddSubgroup K)
    (haK :
      letI : Finite
          ((D.maximalUnramifiedField K.field).toSubgroup ⧸
            extensionSubgroup (D.maximalUnramifiedField K.field)
              (D.maximalUnramifiedField L)
              (D.maximalUnramifiedField_mono hLK)) :=
        D.maximalUnramifiedExtension_finite K.field L hLK
      fixedFieldInclusion A K.field (D.maximalUnramifiedField K.field)
        (D.maximalUnramifiedField_le K.field) aK.1 =
        relativeNorm A (D.maximalUnramifiedField K.field)
          (D.maximalUnramifiedField L) (D.maximalUnramifiedField_mono hLK) u.1)
    (M : FiniteIntermediateField (D.maximalUnramifiedField L) K.field) :
    aK.1 ∈ v.finiteIntermediateUnitNormRange
      (D.maximalUnramifiedField L) K M := by
  classical
  let : Finite
      ((D.maximalUnramifiedField K.field).toSubgroup ⧸
        extensionSubgroup (D.maximalUnramifiedField K.field)
          (D.maximalUnramifiedField L)
          (D.maximalUnramifiedField_mono hLK)) :=
    D.maximalUnramifiedExtension_finite K.field L hLK
  let KR := K.toFiniteResidueAbstractField D
  let I := D.maximalUnramifiedField K.field
  let E := D.maximalUnramifiedField L
  let hEI := D.maximalUnramifiedField_mono hLK
  let N := relativeNorm A I E hEI
  let J := fixedFieldInclusion A I E hEI
  let hEK := D.maximalUnramifiedField_le_of_le hLK
  let hEnormal : (extensionSubgroup K.field E hEK).Normal :=
    D.extensionSubgroup_maximalUnramifiedField_normal K.field L hLK
  rcases u.2 with ⟨Mu, uMu, huMu⟩
  let ιs := {i : ι // i ∈ s}
  have huᵢsupport (j : ιs) := (uᵢ j.1).2
  choose Mi uMi huMi using huᵢsupport
  let ML : FiniteIntermediateField E K.field :=
    { field := L
      above := D.maximalUnramifiedField_le L
      below := hLK
      finite := hLfinite }
  let B₀ := M.compositum ML
  let B := B₀.compositum Mu
  obtain ⟨Q, hQB, hQMi⟩ :=
    FiniteIntermediateField.exists_common_compositum B
      (Finset.univ : Finset ιs) Mi
  let P := Q.galoisRefinement
  let hPQ : P.field.toSubgroup ≤ Q.field.toSubgroup :=
    Q.galoisRefinement_le_field
  let hPB : P.field.toSubgroup ≤ B.field.toSubgroup := hPQ.trans hQB
  let hPM : P.field.toSubgroup ≤ M.field.toSubgroup :=
    hPB.trans ((B₀.compositum_le_left Mu).trans (M.compositum_le_left ML))
  let hPL : P.field.toSubgroup ≤ L.toSubgroup :=
    hPB.trans ((B₀.compositum_le_left Mu).trans (M.compositum_le_right ML))
  let hPMu : P.field.toSubgroup ≤ Mu.field.toSubgroup :=
    hPB.trans (B₀.compositum_le_right Mu)
  let hPMi (j : ιs) : P.field.toSubgroup ≤ (Mi j).field.toSubgroup :=
    hPQ.trans (hQMi j (Finset.mem_univ j))
  let hPfinite : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field P.field P.below) := P.finite
  let hPnormal : (extensionSubgroup K.field P.field P.below).Normal :=
    FiniteIntermediateField.galoisRefinement_normal Q
  let n := P.quotientCard
  have hn : 0 < n := P.quotientCard_pos
  let σ := D.frobeniusPowerOfDegreeOne KR L hLK φ hφ n hn
  let σn := D.frobeniusPowerOfDegreeOne KR L hLK φ hφ (n * n)
    (Nat.mul_pos hn hn)
  let S := D.frobeniusFixedField KR L hLK σ
  let T := D.frobeniusFixedField KR L hLK σn
  let hSP : S.toSubgroup ≤ P.field.toSubgroup :=
    D.frobeniusPowerFixedField_le_finiteField KR L hLK P φ hφ
  let hSK := D.frobeniusFixedField_le KR L hLK σ
  let hTK := D.frobeniusFixedField_le KR L hLK σn
  let hTS := D.frobeniusPowerFixedField_le KR L hLK φ hφ n n hn hn
  let hTE := D.fieldInertia_le_frobeniusFixedField KR L hLK σn
  let hSE := D.fieldInertia_le_frobeniusFixedField KR L hLK σ
  let hSfinite : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field S hSK) :=
    D.frobeniusFixedField_finite KR L hLK σ
  let hSabsolute : Finite ((baseField G).toSubgroup ⧸
      extensionSubgroup (baseField G) S (le_baseField S)) :=
    D.frobeniusFixedField_absoluteFinite K L hLK σ
  let hTabsolute : Finite ((baseField G).toSubgroup ⧸
      extensionSubgroup (baseField G) T (le_baseField T)) :=
    D.frobeniusFixedField_absoluteFinite K L hLK σn
  let hTSfinite : Finite
      (S.toSubgroup ⧸ extensionSubgroup S T hTS) :=
    D.frobeniusPowerFixedField_finite KR L hLK φ hφ n n hn hn
  let hTSnormal : (extensionSubgroup S T hTS).Normal :=
    D.frobeniusPowerFixedField_normal KR L hLK φ hφ n n hn hn
  let : (extensionSubgroup S T hTS).Normal := hTSnormal
  let ambientExtension : FiniteGaloisSubextension KR.field :=
    { field := L
      below := hLK
      normal := hLnormal
      finite := hLfinite }
  let powerTower : DegreeData.FrobeniusPowerFixedFieldTower D :=
    { ambientBase := KR
      ambient := ambientExtension
      frobenius := φ
      exponent_one := hφ
      n := n
      n_pos := hn
      baseAbsoluteFinite := hSabsolute
      fieldAbsoluteFinite := hTabsolute
      relativeFinite := hTSfinite }
  let fixedTower := powerTower.toFrobeniusFixedFieldTower
  let finiteFixedTower :=
    powerTower.toFiniteAmbientFrobeniusFixedFieldTower
  let SF := fixedTower.base
  let TF := fixedTower.field
  let hSMu : S.toSubgroup ≤ Mu.field.toSubgroup := hSP.trans hPMu
  let hSMufinite : Finite
      (Mu.field.toSubgroup ⧸ extensionSubgroup Mu.field S hSMu) :=
    FiniteIntermediateField.finite_extension_of_le hSK Mu.below hSMu
  let : Finite
      ((Mu.toFiniteAbstractField K).field.toSubgroup ⧸
        extensionSubgroup (Mu.toFiniteAbstractField K).field S hSMu) := by
    change Finite
      (Mu.field.toSubgroup ⧸ extensionSubgroup Mu.field S hSMu)
    exact hSMufinite
  let ESMu : FiniteAbstractFieldExtension G :=
    FiniteAbstractFieldExtension.ofInclusion
      S (Mu.toFiniteAbstractField K) hSMu
  have hESMuField : ESMu.field = SF :=
    FiniteAbstractField.eq_of_field_eq _ _ rfl
  let uS : v.unitAddSubgroup SF :=
    hESMuField ▸ v.finiteUnitInclusion ESMu uMu
  let hSMi (j : ιs) : S.toSubgroup ≤ (Mi j).field.toSubgroup :=
    hSP.trans (hPMi j)
  let hSMifinite (j : ιs) : Finite
      ((Mi j).field.toSubgroup ⧸ extensionSubgroup (Mi j).field S (hSMi j)) :=
    FiniteIntermediateField.finite_extension_of_le hSK (Mi j).below (hSMi j)
  let hSMifiniteBundled (j : ιs) : Finite
      (((Mi j).toFiniteAbstractField K).field.toSubgroup ⧸
        extensionSubgroup ((Mi j).toFiniteAbstractField K).field S (hSMi j)) := by
    change Finite
      ((Mi j).field.toSubgroup ⧸
        extensionSubgroup (Mi j).field S (hSMi j))
    exact hSMifinite j
  let ESMi (j : ιs) : FiniteAbstractFieldExtension G :=
    FiniteAbstractFieldExtension.ofInclusion
      S ((Mi j).toFiniteAbstractField K) (hSMi j)
  have hESMiField (j : ιs) : (ESMi j).field = SF :=
    FiniteAbstractField.eq_of_field_eq _ _ rfl
  let uᵢS (j : ιs) : v.unitAddSubgroup SF :=
    hESMiField j ▸ v.finiteUnitInclusion (ESMi j) (uMi j)
  have huSval : uS.1.1 = u.1.1 := by
    have huMuVal := congrArg Subtype.val huMu
    change uMu.1.1 = u.1.1 at huMuVal
    have huStransport : uS.1.1 = uMu.1.1 := by
      dsimp only [uS]
      cases hESMuField
      rfl
    calc
      uS.1.1 = uMu.1.1 := huStransport
      _ = u.1.1 := huMuVal
  have huᵢSval (j : ιs) : (uᵢS j).1.1 = (uᵢ j.1).1.1 := by
    have huMiVal := congrArg Subtype.val (huMi j)
    change (uMi j).1.1 = (uᵢ j.1).1.1 at huMiVal
    have huᵢStransport : (uᵢS j).1.1 = (uMi j).1.1 := by
      dsimp only [uᵢS]
      cases hESMiField j
      rfl
    calc
      (uᵢS j).1.1 = (uMi j).1.1 := huᵢStransport
      _ = (uᵢ j.1).1.1 := huMiVal
  have hstarVal :
      (D.frobeniusQuotientAction A K.field L hLK φ.1 u.1).1 - u.1.1 =
        ∑ i ∈ s,
          ((D.frobeniusQuotientAction A K.field L hLK (τ i).1 (uᵢ i).1).1 -
            (uᵢ i).1.1) := by
    have h := congrArg
      (AddSubgroup.subtype
        (ambientFixedAddSubgroup A (D.maximalUnramifiedField L))) hstar
    rw [map_sub, map_sum] at h
    exact h
  simp_rw [D.frobeniusQuotientAction_coe_out] at hstarVal
  have hstarS :
      A.ρ (Quotient.out φ.1).1 uS.1.1 - uS.1.1 =
        ∑ j : ιs,
          (A.ρ (Quotient.out (τ j.1).1).1 (uᵢS j).1.1 - (uᵢS j).1.1) := by
    rw [huSval]
    calc
      A.ρ (Quotient.out φ.1).1 u.1.1 - u.1.1 =
          ∑ i ∈ s,
            (A.ρ (Quotient.out (τ i).1).1 (uᵢ i).1.1 - (uᵢ i).1.1) := hstarVal
      _ = ∑ j : ιs,
            (A.ρ (Quotient.out (τ j.1).1).1 (uᵢ j.1).1.1 -
              (uᵢ j.1).1.1) :=
        Finset.sum_subtype s (fun _ => Iff.rfl) _
      _ = _ := by simp_rw [huᵢSval]
  let τs : ιs →
      (D.extensionNormalizedDegreeContinuous KR L hLK).toMonoidHom.ker :=
    fun j => τ j.1
  have hφσ : φ.1 * σ.1 = σ.1 * φ.1 :=
    powerTower.frobenius_commute_base
  have hφσn : φ.1 * σn.1 = σn.1 * φ.1 :=
    powerTower.frobenius_commute_field
  have hτσ (j : ιs) : (τs j).1 * (φ.1 ^ n) =
      (φ.1 ^ n) * (τs j).1 := by
    exact (D.quotientPower_card_commutes_degreeZero KR L hLK P hPL
      φ.1 (τs j).1 (τs j).2).symm
  have hτσn (j : ιs) : (τs j).1 * (φ.1 ^ (n * n)) =
      (φ.1 ^ (n * n)) * (τs j).1 := by
    have hcomm : Commute (τs j).1 (φ.1 ^ n) := hτσ j
    simpa only [pow_mul] using (hcomm.pow_right n).eq
  have hσσn : σ.1 * σn.1 = σn.1 * σ.1 :=
    fixedTower.commute
  obtain ⟨uBar, uBarᵢ, yBar, huBar, huBarᵢ, hyBar⟩ :=
    v.universalNormDescent_fixedTower_solution hAxiom powerTower
      (Finset.univ : Finset ιs) τs hτσ hτσn uS uᵢS hstarS
  let uBarE := fixedFieldInclusion A T E hTE uBar.1
  let uBarᵢE := fun j : ιs => fixedFieldInclusion A T E hTE (uBarᵢ j).1
  let yBarE := fixedFieldInclusion A T E hTE yBar.1
  let φnyBarE := D.frobeniusPowerSum A K.field L hLK φ.1 n yBarE
  let w := uBarE - φnyBarE
  have hstarW := v.universalNormDescent_correctedEquation KR L hLK σ σn
    (Finset.univ : Finset ιs) φ.1 hφσn (fun j => (τs j).1) hτσn
      hσσn n rfl uBar uBarᵢ yBar hyBar
  have huBarEmem : uBarE ∈ v.infiniteUnitAddSubgroup E K hEK := by
    let MT := D.frobeniusFixedIntermediateField KR L hLK σn
    have hTFMT : TF = MT.toFiniteAbstractField K :=
      FiniteAbstractField.eq_of_field_eq _ _ rfl
    let uBarMT : v.unitAddSubgroup (MT.toFiniteAbstractField K) :=
      hTFMT ▸ uBar
    refine ⟨MT, uBarMT, ?_⟩
    apply Subtype.ext
    change uBarMT.1.1 = uBar.1.1
    dsimp only [uBarMT]
  have hyBarEmem : yBarE ∈ v.infiniteUnitAddSubgroup E K hEK := by
    let MT := D.frobeniusFixedIntermediateField KR L hLK σn
    have hTFMT : TF = MT.toFiniteAbstractField K :=
      FiniteAbstractField.eq_of_field_eq _ _ rfl
    let yBarMT : v.unitAddSubgroup (MT.toFiniteAbstractField K) :=
      hTFMT ▸ yBar
    refine ⟨MT, yBarMT, ?_⟩
    apply Subtype.ext
    change yBarMT.1.1 = yBar.1.1
    dsimp only [yBarMT]
  have hφnyMem : φnyBarE ∈ v.infiniteUnitAddSubgroup E K hEK :=
    v.frobeniusPowerSum_mem_infiniteUnit_universalNormDescent K L hLK φ.1 n yBarE hyBarEmem
  have hwMem : w ∈ v.infiniteUnitAddSubgroup E K hEK :=
    (v.infiniteUnitAddSubgroup E K hEK).sub_mem huBarEmem hφnyMem
  have hfixedZ := D.maximalUnramifiedNorm_fixed_of_hstar A KR L hLK
    (Finset.univ : Finset ιs) φ.1 τs w uBarᵢE hstarW
  obtain ⟨zK, hzK⟩ :=
    v.descend_maximalUnramifiedNorm_unit K L hLK φ hφ w hwMem hfixedZ
  let powerT : ambientFixedAddSubgroup A T :=
    ∑ i : Fin n, D.frobeniusFixedFieldAction A KR L hLK σn
      (φ.1 ^ i.1) (Commute.pow_left hφσn i.1) yBar.1
  let powerTUnit : v.unitAddSubgroup TF :=
    ∑ i : Fin n, v.frobeniusFixedFieldUnitAction KR L hLK σn
      (φ.1 ^ i.1) (Commute.pow_left hφσn i.1) yBar
  have hsumUnit (f : Fin n → v.unitAddSubgroup TF) :
      ((∑ i, f i).1.1 : A.V) = ∑ i, (f i).1.1 := by
    calc
      ((∑ i, f i).1.1 : A.V) =
          (ambientFixedAddSubgroup A TF.field).subtype
            (∑ i, (v.unitAddSubgroup TF).subtype (f i)) := by
        exact congrArg (ambientFixedAddSubgroup A TF.field).subtype
          (map_sum (v.unitAddSubgroup TF).subtype f Finset.univ)
      _ = _ :=
        map_sum (ambientFixedAddSubgroup A TF.field).subtype
          (fun i => (v.unitAddSubgroup TF).subtype (f i)) Finset.univ
  have hsumAmbient (f : Fin n → ambientFixedAddSubgroup A T) :
      ((∑ i, f i).1 : A.V) = ∑ i, (f i).1 :=
    map_sum (ambientFixedAddSubgroup A T).subtype f Finset.univ
  have hpowerTUnit : powerTUnit.1 = powerT := by
    apply Subtype.ext
    calc
      (powerTUnit.1.1 : A.V) =
          ∑ i : Fin n, (v.frobeniusFixedFieldUnitAction KR L hLK σn
            (φ.1 ^ i.1) (Commute.pow_left hφσn i.1) yBar).1.1 :=
        hsumUnit (fun i : Fin n =>
          v.frobeniusFixedFieldUnitAction KR L hLK σn
            (φ.1 ^ i.1) (Commute.pow_left hφσn i.1) yBar)
      _ = ∑ i : Fin n,
          (D.frobeniusFixedFieldAction A KR L hLK σn
            (φ.1 ^ i.1) (Commute.pow_left hφσn i.1) yBar.1).1 := rfl
      _ = powerT.1 :=
        (hsumAmbient (fun i : Fin n =>
          D.frobeniusFixedFieldAction A KR L hLK σn
            (φ.1 ^ i.1) (Commute.pow_left hφσn i.1) yBar.1)).symm
  let wBar : v.unitAddSubgroup TF := uBar - powerTUnit
  have hwBarIncl : fixedFieldInclusion A T E hTE wBar.1 = w := by
    have hpIncl := D.fixedFieldPowerSum_inclusion A KR L hLK σn
      φ.1 hφσn n yBar.1
    apply Subtype.ext
    have hpVal := congrArg Subtype.val hpIncl
    change uBar.1.1 - powerTUnit.1.1 = uBar.1.1 - φnyBarE.1
    rw [hpowerTUnit]
    exact congrArg (fun z => uBar.1.1 - z) hpVal
  let EST : FiniteAbstractFieldExtension G := fixedTower.extension
  let yS : v.unitAddSubgroup SF := v.finiteUnitNorm EST yBar
  let uSraw : ambientFixedAddSubgroup A S :=
    ⟨uS.1.1, by
      intro g
      have hg : g.1 ∈ SF.field := by
        change g.1 ∈ D.frobeniusFixedField KR L hLK σ
        exact g.2
      exact uS.1.2 ⟨g.1, hg⟩⟩
  let ySraw : ambientFixedAddSubgroup A S :=
    ⟨yS.1.1, by
      intro g
      have hg : g.1 ∈ SF.field := by
        change g.1 ∈ D.frobeniusFixedField KR L hLK σ
        exact g.2
      exact yS.1.2 ⟨g.1, hg⟩⟩
  let uBarraw : ambientFixedAddSubgroup A T :=
    ⟨uBar.1.1, by
      intro g
      have hg : g.1 ∈
          (D.frobeniusFixedAbstractField KR L hLK σn).field := by
        change g.1 ∈ D.frobeniusFixedField KR L hLK σn
        exact g.2
      exact uBar.1.2 ⟨g.1, hg⟩⟩
  let wBarraw : ambientFixedAddSubgroup A T :=
    ⟨wBar.1.1, by
      intro g
      have hg : g.1 ∈ TF.field := by
        change g.1 ∈ D.frobeniusFixedField KR L hLK σn
        exact g.2
      exact wBar.1.2 ⟨g.1, hg⟩⟩
  let powerS : ambientFixedAddSubgroup A S :=
    ∑ i : Fin n, D.frobeniusFixedFieldAction A KR L hLK σ
      (φ.1 ^ i.1) (Commute.pow_left hφσ i.1) ySraw
  have hpowerNorm := D.fixedFieldPowerSum_relativeNorm A KR L hLK
    σ σn hTS φ.1 hφσ hφσn n yBar.1
  have huBarraw : relativeNorm A S T hTS uBarraw = uSraw := by
    apply Subtype.ext
    have h := congrArg Subtype.val huBar
    change
      (relativeNorm A S T hTS uBar.1).1 = uS.1.1 at h
    change
      (relativeNorm A S T hTS uBarraw).1 = uSraw.1
    exact h
  have hySraw : relativeNorm A S T hTS yBar.1 = ySraw := by
    apply Subtype.ext
    rfl
  have hpowerNormRaw : relativeNorm A S T hTS powerT = powerS := by
    simpa [powerT, powerS, S, T, σ, σn, hySraw] using hpowerNorm
  have hwBarNorm : relativeNorm A S T hTS wBarraw = uSraw - powerS := by
    have hwBarCoe : wBarraw = uBarraw - powerT := by
      apply Subtype.ext
      change uBar.1.1 - powerTUnit.1.1 = uBar.1.1 - powerT.1
      exact congrArg (fun z => uBar.1.1 - z)
        (congrArg Subtype.val hpowerTUnit)
    rw [hwBarCoe]
    rw [map_sub, huBarraw]
    exact congrArg (fun z => uSraw - z) hpowerNormRaw
  obtain ⟨gS, hgClosure, _hgDegree, hg⟩ :=
    D.frobeniusPowerFixedField_generator KR L hLK φ hφ n n hn hn
  let fixedGenerator :
      finiteFixedTower.toFrobeniusFixedFieldTower.CyclicGenerator :=
    { element := gS
      mapsToFrobenius := hgClosure
      generates := hg }
  have hcard := D.frobeniusPowerFixedField_quotientCard
    KR L hLK φ hφ n n hn hn
  have hdegree : (finiteFixedTower.extension.degree : ℕ) = n := by
    calc
      (finiteFixedTower.extension.degree : ℕ) =
          Nat.card
            finiteFixedTower.extension.toFiniteAbstractExtension.quotient :=
        finiteFixedTower.extension.toFiniteAbstractExtension.degree_coe
      _ = n := hcard
  have hnormW := v.maximalNorm_relativeNorm_fixedTower
    finiteFixedTower fixedGenerator n hdegree wBar
  have hnormWraw :
      J (N (fixedFieldInclusion A S E hSE
        (relativeNorm A S T hTS wBarraw))) =
      D.frobeniusPowerSum A K.field L hLK σ.1 n
        (J (N (fixedFieldInclusion A T E hTE wBarraw))) := by
    change
      J (N (fixedFieldInclusion A S E hSE
        (relativeNorm A S T hTS wBar.1))) =
      D.frobeniusPowerSum A K.field L hLK σ.1 n
        (J (N (fixedFieldInclusion A T E hTE wBar.1))) at hnormW
    exact hnormW
  have hσfixedZ : D.frobeniusQuotientAction A K.field L hLK σ.1 (J (N w)) =
      J (N w) := by
    let B := D.frobeniusQuotientRepresentation A K.field L hLK
    have hpow := rep_action_pow_fixed
      B φ.1 (J (N w)) hfixedZ n
    change D.frobeniusQuotientAction A K.field L hLK
      (φ.1 ^ n) (J (N w)) = J (N w) at hpow
    simpa only [σ, D.frobeniusPowerOfDegreeOne_coe] using hpow
  have hpowerZ : D.frobeniusPowerSum A K.field L hLK σ.1 n (J (N w)) =
      n • J (N w) :=
    D.frobeniusPowerSum_eq_nsmul_of_fixed A K.field L hLK
      σ.1 n (J (N w)) hσfixedZ
  have hnormW' :
      J (N (fixedFieldInclusion A S E hSE (uSraw - powerS))) =
        n • J (N w) := by
    rw [← hwBarNorm, hnormWraw]
    have hwBarInclRaw : fixedFieldInclusion A T E hTE wBarraw = w := by
      apply Subtype.ext
      exact congrArg Subtype.val hwBarIncl
    rw [hwBarInclRaw, hpowerZ]
  have hpowerSIncl := D.fixedFieldPowerSum_inclusion A KR L hLK σ
    φ.1 hφσ n ySraw
  have huSIncl : fixedFieldInclusion A S E hSE uSraw = u.1 := by
    apply Subtype.ext
    change uSraw.1 = u.1.1
    exact huSval
  have hnormRelationE :
      J (N u.1) =
        J (N (D.frobeniusPowerSum A K.field L hLK φ.1 n
          (fixedFieldInclusion A S E hSE ySraw))) + n • J (N w) := by
    have h := hnormW'
    simp only [map_sub] at h
    rw [huSIncl, hpowerSIncl] at h
    calc
      J (N u.1) = n • J (N w) +
          J (N (D.frobeniusPowerSum A K.field L hLK φ.1 n
            (fixedFieldInclusion A S E hSE ySraw))) :=
        sub_eq_iff_eq_add.mp h
      _ = _ := add_comm _ _
  have hlemma53 := (D.frobeniusNormIdentities A KR L hLK φ σ hφ ySraw).1
  have hbaseRelation :
      aK.1 = relativeNorm A K.field S hSK ySraw + n • zK.1 := by
    apply Subtype.ext
    have haKval := congrArg Subtype.val haK
    have hzKval := congrArg Subtype.val hzK
    have hrelVal := congrArg Subtype.val hnormRelationE
    have h53 := hlemma53
    have h53' :
        (N (D.frobeniusPowerSum A K.field L hLK φ.1 n
          (fixedFieldInclusion A S E hSE ySraw))).1 =
          (relativeNorm A K.field S hSK ySraw).1 := by
      have h53' := h53.symm
      have hσexp : D.frobeniusExponent KR L hLK σ = n :=
        D.frobeniusExponent_powerOfDegreeOne KR L hLK φ hφ n hn
      rw [hσexp] at h53'
      change
        (N (D.frobeniusPowerSum A K.field L hLK φ.1 n
          (fixedFieldInclusion A S E hSE ySraw))).1 =
          (relativeNorm A K.field S hSK ySraw).1 at h53'
      exact h53'
    change aK.1.1 =
      (relativeNorm A K.field S hSK ySraw).1 + n • zK.1.1
    change aK.1.1 = (N u.1).1 at haKval
    change zK.1.1 = (N w).1 at hzKval
    change (N u.1).1 =
      (N (D.frobeniusPowerSum A K.field L hLK φ.1 n
        (fixedFieldInclusion A S E hSE ySraw))).1 + n • (N w).1 at hrelVal
    rw [haKval, hrelVal, ← hzKval]
    rw [h53']
  let hPSfinite : Finite
      (P.field.toSubgroup ⧸ extensionSubgroup P.field S hSP) :=
    FiniteIntermediateField.finite_extension_of_le hSK P.below hSP
  let : Finite
      ((P.toFiniteAbstractField K).field.toSubgroup ⧸
        extensionSubgroup (P.toFiniteAbstractField K).field S hSP) := by
    change Finite
      (P.field.toSubgroup ⧸ extensionSubgroup P.field S hSP)
    exact hPSfinite
  let EPS : FiniteAbstractFieldExtension G :=
    FiniteAbstractFieldExtension.ofInclusion
      S (P.toFiniteAbstractField K) hSP
  let yP : v.unitAddSubgroup (P.toFiniteAbstractField K) := by
    simpa [SF, EPS, FiniteAbstractFieldExtension.ofInclusion,
      DegreeData.frobeniusFixedAbstractField] using
        v.finiteUnitNorm EPS yS
  let EP := P.toFiniteAbstractFieldExtension K
  let zP : v.unitAddSubgroup (P.toFiniteAbstractField K) :=
    v.finiteUnitInclusion EP zK
  let aP : v.unitAddSubgroup (P.toFiniteAbstractField K) := yP + zP
  let FT : DegreeData.FiniteTower G := {
    top := S
    middle := P.field
    base := K.field
    top_le_middle := hSP
    middle_le_base := P.below
    finiteTopQuotient := hPSfinite
    finiteBaseQuotient := P.finite }
  have hnDegree : (EP.degree : ℕ) = n := by
    change (EP.toFiniteAbstractExtension.degree : ℕ) = n
    rw [EP.toFiniteAbstractExtension.degree_coe]
    change
      Nat.card
        (K.field.toSubgroup ⧸ extensionSubgroup K.field P.field P.below) = n
    rfl
  let yPraw : ambientFixedAddSubgroup A P.field :=
    ⟨yP.1.1, by
      intro g
      apply yP.1.2⟩
  let zPraw : ambientFixedAddSubgroup A P.field :=
    ⟨zP.1.1, by
      intro g
      apply zP.1.2⟩
  let aPraw : ambientFixedAddSubgroup A P.field :=
    ⟨aP.1.1, by
      intro g
      apply aP.1.2⟩
  have haPnorm : relativeNorm A K.field P.field P.below aP.1 = aK.1 := by
    change relativeNorm A K.field P.field P.below aPraw = aK.1
    have haPraw : aPraw = yPraw + zPraw := by
      apply Subtype.ext
      rfl
    rw [haPraw, map_add]
    have hyTower := FT.norm_trans_apply A yS.1
    have hzNorm := relativeNorm_fixedFieldInclusion A
      EP.toFiniteAbstractExtension zK.1
    change relativeNorm A K.field P.field P.below
        (fixedFieldInclusion A K.field P.field P.below zK.1) =
      (EP.degree : ℕ) • zK.1 at hzNorm
    change relativeNorm A K.field P.field P.below yPraw +
      relativeNorm A K.field P.field P.below zPraw = aK.1
    change relativeNorm A K.field P.field P.below
        (relativeNorm A P.field S hSP yS.1) +
      relativeNorm A K.field P.field P.below
        (fixedFieldInclusion A K.field P.field P.below zK.1) = aK.1
    rw [hyTower]
    rw [hzNorm, hnDegree]
    exact hbaseRelation.symm
  exact v.mem_finiteIntermediateUnitNormRange_of_overfield
    E K M P hPM aP aK.1 haPnorm

theorem universalNormDescent
    (v : ValuationData D A)
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    [TotallyDisconnectedSpace G]
    (hAxiom : v.SatisfiesUnramifiedUnitCohomology)
    (K : FiniteAbstractField G) (L : ClosedSubgroup G)
    (hLK : L.toSubgroup ≤ K.field.toSubgroup)
    [hLnormal : (extensionSubgroup K.field L hLK).Normal]
    [hLfinite : Finite
      (K.field.toSubgroup ⧸ extensionSubgroup K.field L hLK)]
    (φ : D.FrobeniusElements (K.toFiniteResidueAbstractField D) L hLK)
    (hφ : D.frobeniusExponent
      (K.toFiniteResidueAbstractField D) L hLK φ = 1)
    {ι : Type*} (s : Finset ι)
    (τ : ι →
      (D.extensionNormalizedDegreeContinuous
        (K.toFiniteResidueAbstractField D) L hLK).toMonoidHom.ker)
    (u : v.infiniteUnitAddSubgroup (D.maximalUnramifiedField L) K
      (D.maximalUnramifiedField_le_of_le hLK))
    (uᵢ : ι → v.infiniteUnitAddSubgroup (D.maximalUnramifiedField L) K
      (D.maximalUnramifiedField_le_of_le hLK))
    (hstar : D.frobeniusQuotientAction A K.field L hLK φ.1 u.1 - u.1 =
      ∑ i ∈ s,
        (D.frobeniusQuotientAction A K.field L hLK (τ i).1 (uᵢ i).1 -
          (uᵢ i).1)) :
    letI : Finite
        ((D.maximalUnramifiedField K.field).toSubgroup ⧸
          extensionSubgroup (D.maximalUnramifiedField K.field)
            (D.maximalUnramifiedField L)
            (D.maximalUnramifiedField_mono hLK)) :=
      D.maximalUnramifiedExtension_finite K.field L hLK
    ∃ aK : v.unitAddSubgroup K,
      fixedFieldInclusion A K.field (D.maximalUnramifiedField K.field)
          (D.maximalUnramifiedField_le K.field) aK.1 =
        relativeNorm A (D.maximalUnramifiedField K.field)
          (D.maximalUnramifiedField L)
          (D.maximalUnramifiedField_mono hLK) u.1 ∧
      aK.1 ∈ v.infiniteUnitNormSubgroup (D.maximalUnramifiedField L) K := by
  let : Finite
      ((D.maximalUnramifiedField K.field).toSubgroup ⧸
        extensionSubgroup (D.maximalUnramifiedField K.field)
          (D.maximalUnramifiedField L)
          (D.maximalUnramifiedField_mono hLK)) :=
    D.maximalUnramifiedExtension_finite K.field L hLK
  obtain ⟨aK, haK⟩ := v.universalNormDescent_endpoint_descent K L hLK φ hφ
    s τ u uᵢ hstar
  refine ⟨aK, haK, ?_⟩
  rw [v.mem_infiniteUnitNormSubgroup_iff]
  intro M
  exact v.universalNormDescent_mem_finiteUnitNormRange hAxiom K L hLK φ hφ
    s τ u uᵢ hstar aK haK M
end ValuationData
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
    (E : FiniteAbstractFieldExtension G)
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
  let Kcf : FiniteAbstractField G := E.base
  let Ecf : FiniteCyclicSubextension Kcf :=
    { field := L
      below := hLK
      normal := hnormal
      finite := inferInstance
      generator := g
      generates := hg }
  have hMzero : Limits.IsZero (tateCohomology M (-1)) :=
    by
      simpa [Kcf, Ecf,
        FiniteCyclicSubextension.fixedRepresentation] using
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
                ambientFixedAddSubgroup A K) : A.V) :=
          extensionFixedRepresentation_norm_coe A K L hLK hnormal uM
        _ = ((relativeNorm A K L hLK u.1 :
                ambientFixedAddSubgroup A K) : A.V) := by
          rfl
        _ = ((((U.norm.hom u).1 : ambientFixedAddSubgroup A L)) : A.V) :=
          (v.unitRepresentation_norm_coe E hnormal u).symm
        _ = 0 := by rw [huNorm]; rfl
    obtain ⟨a, ha⟩ :=
      CyclicCohomology.normKernel_le_sigmaMinusOneRange_of_tateHMinusOne_isZero
        M g hg hMzero uM huMNorm
    let aL : ambientFixedAddSubgroup A L :=
      extensionFixedRepresentationEquiv A K L hLK hnormal a
    obtain ⟨b, hb⟩ :=
      v.normalizedValuation_surjective E.base (v.valuationAt E.field aL)
    let bL : ambientFixedAddSubgroup A L :=
      fixedFieldInclusion A K L hLK b
    let eL : ambientFixedAddSubgroup A L := aL - bL
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
        (((U.ρ g e).1 : ambientFixedAddSubgroup A L) : A.V) =
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
      ((((U.ρ g e - e).1 : ambientFixedAddSubgroup A L)) : A.V) =
          relativeCosetAction A K L hLK eL g - eL.1 := by
        change (((U.ρ g e).1 : ambientFixedAddSubgroup A L) : A.V) -
            ((e.1 : ambientFixedAddSubgroup A L) : A.V) = _
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
    (E : FiniteAbstractFieldExtension G)
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
    let yL : ambientFixedAddSubgroup A L :=
      extensionFixedRepresentationEquiv A K L hLK hnormal y
    let normK : ambientFixedAddSubgroup A K :=
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
    let aL : ambientFixedAddSubgroup A L :=
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
  let Kcf : FiniteAbstractField G := E.base
  let Ecf : FiniteCyclicSubextension Kcf :=
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
      FiniteCyclicSubextension.fixedRepresentation] using hEcfTateFinite
  let hHFinite : Finite H :=
    Finite.of_equiv (tateCohomology M 0) eHTate.symm
  have hcardT : Nat.card H = n := by
    calc
      Nat.card H = Nat.card (tateCohomology M 0) :=
        Nat.card_congr eHTate
      _ = n := by
        convert hcf.tateHZero_card Kcf Ecf using 1 <;>
          simp [n, M, K, L, Kcf, Ecf,
            FiniteCyclicSubextension.fixedRepresentation,
            FiniteCyclicSubextension.toFiniteAbstractExtension,
            FiniteAbstractFieldExtension.degree,
            FiniteAbstractFieldExtension.toFiniteAbstractExtension]
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
          (((U.ρ g u).1 : ambientFixedAddSubgroup A L) : A.V) =
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
        _ = (((U.ρ g u).1 : ambientFixedAddSubgroup A L) : A.V) :=
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
    let yL : ambientFixedAddSubgroup A L :=
      extensionFixedRepresentationEquiv A K L hLK hnormal y
    let normK : ambientFixedAddSubgroup A K :=
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
      ((((U.norm.hom yU).1 : ambientFixedAddSubgroup A L)) : A.V) =
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
        E.toFiniteAbstractFieldExtension E.normal
        E.toFiniteAbstractFieldExtension_isUnramified E.generator E.generates
  · simpa [FiniteUnramifiedCyclicExtension.unitRepresentation] using
      v.classFieldAxiom_unramifiedUnits_hMinusOne hcf
        E.toFiniteAbstractFieldExtension E.normal
        E.toFiniteAbstractFieldExtension_isUnramified E.generator E.generates
end ValuationData
noncomputable section
variable {G : IntegralRepGroupType} [Group G] [TopologicalSpace G]
end
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

/- TunnellFiniteCoboundaryActual -/
section
namespace TunnellFiniteCoboundaryActual
open ClassFormation CyclicCohomology KummerTheory TunnellAbstractNormCoordinates
open TunnellFrobeniusCoordinates TunnellFrobeniusNormalization TunnellCoboundaryUnitCoordinates
open scoped Classical
noncomputable section
set_option maxHeartbeats 1200000 in
theorem actual : OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H1_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1.H3 := by
  intro G A
  dsimp only
  intro d v cd sd vi vd vr cf
  obtain ⟨D,V,ed,ev⟩ := TunnellNativeValuationData.realize A d v cd sd vi vd (by
    intro H _ z
    constructor
    · rintro ⟨a,⟨b,hb⟩,ha⟩
      exact (vr H z).mp ⟨a,b,hb,ha⟩
    · intro hz
      obtain ⟨a,b,hb,ha⟩ := (vr H z).mpr hz
      exact ⟨a,⟨b,hb⟩,ha⟩)
  subst d v
  intro H J I L hi he hn hf hI hL f g x y df dg ux uy star
  let K := finiteField H
  let KR := K.toFiniteResidueAbstractField D
  letI : (extensionSubgroup K.field J he).Normal := hn
  letI : Finite (U K.field ⧸ extensionSubgroup K.field J he) := hf
  letI : (extensionSubgroup KR.field J he).Normal := hn
  letI : Finite (U KR.field ⧸ extensionSubgroup KR.field J he) := hf
  let E := D.maximalUnramifiedField J
  let T := D.maximalUnramifiedField H
  have hI' : I = T := ClosedSubgroup.toSubgroup_injective (hI.trans (TunnellCoboundaryUnitCoordinates.inertia_eq D H).symm)
  have hL' : L = E := ClosedSubgroup.toSubgroup_injective (hL.trans (TunnellCoboundaryUnitCoordinates.inertia_eq D J).symm)
  subst I L
  let he' := D.maximalUnramifiedField_le_of_le he
  letI : Finite (U T ⧸ M T E) := D.maximalUnramifiedExtension_finite H J he
  obtain ⟨u,hu⟩ := (supports D A V K E he' x).mp ux
  choose w hw using fun i => (supports D A V K E he' (y i)).mp (uy i)
  let l := QuotientGroup.mk' (D.extensionInertiaWithin H J he)
  have deg (t : U H) (n : ℕ) (ht : (coordinate D t.val).toAdd = ((U H).map (coordinate D)).index • (n : TunnellProfiniteCoordinate.Z)) :
      D.extensionNormalizedDegree KR J he (l t) = (Multiplicative.ofAdd (1 : ZHat)) ^ n := by
    change D.normalizedDegree KR t = _
    apply Multiplicative.toAdd.injective
    simpa using (degree_iff D K t n).mp ht
  have df' : (coordinate D f.val).toAdd = (((U H).map (coordinate D)).index : TunnellProfiniteCoordinate.Z) := df
  have phiDegree := deg f 1 (by simpa only [Nat.cast_one,nsmul_eq_mul,mul_one] using df')
  let φ : D.FrobeniusElements KR J he := ⟨l f,1,by decide,phiDegree⟩
  letI : (D.extensionInertiaWithin KR.field J he).Normal := D.extensionInertiaWithin_normal KR.field J he
  let τ (i : Fin 3) : (D.extensionNormalizedDegreeContinuous KR J he).toMonoidHom.ker :=
    ⟨l (g i), by
      change D.extensionNormalizedDegree KR J he (l (g i)) = 1
      simpa only [pow_zero] using deg (g i) 0 (by simp [dg])⟩
  have hx : D.frobeniusQuotientAction A H J he φ.val u.val - u.val =
      ∑ i ∈ (Finset.univ : Finset (Fin 3)), (D.frobeniusQuotientAction A H J he (τ i).val (w i).val - (w i).val) := by
    apply Subtype.ext
    simpa [φ,τ,l,D.frobeniusQuotientAction_mk,normalExtensionAction,hu,hw] using star
  let uc := V.classFieldAxiom_implies_unramifiedUnitCohomology ((tate_iff A).mp cf)
  obtain ⟨a,ha,hnorm⟩ := V.universalNormDescent uc K J he φ
    (D.frobeniusExponent_unique KR J he φ 1 phiDegree).symm Finset.univ τ u w hx
  let M' : FiniteIntermediateField E H := ⟨J,D.maximalUnramifiedField_le J,he,hf⟩
  obtain ⟨b,hb⟩ := (V.mem_infiniteUnitNormSubgroup_iff E K a.val).mp hnorm M'
  refine ⟨b.val, ?_⟩
  calc
    tr A H J b.val.val = (relativeNorm A H J he b.val).val := tr_eq A H J he b.val
    _ = a.val.val := congrArg Subtype.val hb
    _ = (relativeNorm A T E (D.maximalUnramifiedField_mono he) u.val).val := congrArg Subtype.val ha
    _ = tr A T E x := (tr_eq A T E _ u.val).symm.trans (congrArg (tr A T E) hu)
end
end TunnellFiniteCoboundaryActual
end

theorem OMA.solution : OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H1_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1.H3 := TunnellFiniteCoboundaryActual.actual
