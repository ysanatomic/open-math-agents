import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H1_R1
import Mathlib

/-! The norm index for a cyclic extension of local fields equals its degree. The local-field and Tate cohomology results are adapted from ClassFieldTheory, revision 2e6280f9d2579705a0cc6c76ec68c2b60f9c601a, https://github.com/n-yamaguchi-0729/ClassFieldTheory. The source declarations used in the proof have been combined below. -/
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
end
end CyclicCohomology
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
 


def normQuotientConcreteEquiv
    (K L : Type u) [Field K] [Field L] [Algebra K L] :
    NormQuotient K L ≃* Kˣ ⧸ localNormSubgroup K L := by
  change (Kˣ ⧸ localNormSubgroup K L) ≃* Kˣ ⧸ localNormSubgroup K L
  exact MulEquiv.refl _
 
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
 
@[simp]
lemma additive_toMul_finset_sum_units {ι : Type*} (L : Type*) [Field L]
    (s : Finset ι) (f : ι → Additive Lˣ) :
    Additive.toMul (Finset.sum s f) =
      Finset.prod s (fun i => Additive.toMul (f i)) := by
  classical
  refine Finset.induction_on s ?h0 ?hstep
  · simp
  · intro a s ha hs
    simp [Finset.sum_insert, Finset.prod_insert, ha, hs]
 
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

/- GaloisCohomology.Cyclic.Herbrand.HerbrandLowDegree.Basic -/
section
namespace CyclicCohomology
noncomputable section
open scoped BigOperators
namespace ProfiniteCohomology
namespace Herbrand
universe uG uA uB uC
 

def tateNorm (G : Type uG) (A : Type uA) [Group G] [Fintype G] [CommGroup A]
    [MulDistribMulAction G A] (a : A) : A :=
  ∏ g : G, g • a
 
def sigmaMinusOne (G : Type uG) (A : Type uA) [Group G] [CommGroup A]
    [MulDistribMulAction G A] (σ : G) (a : A) : A :=
  σ • a * a⁻¹
 
def fixedSubgroup (G : Type uG) (A : Type uA) [Group G] [CommGroup A]
    [MulDistribMulAction G A] : Subgroup A where
  carrier := {a | ∀ g : G, g • a = a}
  one_mem' := by
    intro g
    exact MulDistribMulAction.smul_one g
  mul_mem' := by
    intro a b ha hb g
    rw [MulDistribMulAction.smul_mul, ha g, hb g]
  inv_mem' := by
    intro a ha g
    calc
      g • a⁻¹ = (g • a)⁻¹ := smul_inv' g a
      _ = a⁻¹ := by rw [ha g]
variable {G : Type uG} {A : Type uA} {B : Type uB} {C : Type uC}
variable [Group G] [Fintype G] [CommGroup A] [CommGroup B] [CommGroup C]
variable [MulDistribMulAction G A] [MulDistribMulAction G B] [MulDistribMulAction G C]
omit [Fintype G] [CommGroup B] [CommGroup C]
    [MulDistribMulAction G B] [MulDistribMulAction G C] in
 

theorem smul_eq_of_mem_zpowers_of_sigmaMinusOne_eq_one
    {σ g : G} {a : A} (hg : g ∈ Subgroup.zpowers σ)
    (hσ : sigmaMinusOne G A σ a = 1) :
    g • a = a := by
  have hσa : σ • a = a := by
    exact mul_inv_eq_one.mp (by simpa [sigmaMinusOne] using hσ)
  exact smul_eq_self_of_mem_zpowers hg hσa
omit [Fintype G] [CommGroup B] [CommGroup C]
    [MulDistribMulAction G B] [MulDistribMulAction G C] in
 

theorem fixed_of_forall_mem_zpowers_of_sigmaMinusOne_eq_one
    {σ : G} {a : A} (hgen : ∀ g : G, g ∈ Subgroup.zpowers σ)
    (hσ : sigmaMinusOne G A σ a = 1) :
    ∀ g : G, g • a = a := by
  intro g
  exact smul_eq_of_mem_zpowers_of_sigmaMinusOne_eq_one
    (G := G) (A := A) (g := g) (hg := hgen g) hσ
omit [Group G] [Fintype G] [CommGroup A] [CommGroup B] [CommGroup C]
    [MulDistribMulAction G A] [MulDistribMulAction G B]
    [MulDistribMulAction G C] in
 


theorem monoidHom_card_eq_card_ker_mul_card_range
    {X : Type uA} {Y : Type uB} [Group X] [Group Y] [Finite X] (f : X →* Y) :
    Nat.card X = Nat.card (MonoidHom.ker f) * Nat.card (MonoidHom.range f) := by
  rw [← (MonoidHom.ker f).card_mul_index,
    Subgroup.index_ker]
omit [Group G] [Fintype G] [CommGroup A] [CommGroup B] [CommGroup C]
    [MulDistribMulAction G A] [MulDistribMulAction G B]
    [MulDistribMulAction G C] in
 


theorem monoidHom_card_eq_card_range_mul_card_range_of_exact
    {X : Type uA} {Y : Type uB} {Z : Type uC} [Group X] [Group Y] [Group Z]
    [Finite Y]
    (f : X →* Y) (g : Y →* Z)
    (hexact : MonoidHom.range f = MonoidHom.ker g) :
    Nat.card Y = Nat.card (MonoidHom.range f) * Nat.card (MonoidHom.range g) := by
  rw [monoidHom_card_eq_card_ker_mul_card_range g, ← hexact]
omit [Group G] [Fintype G] [CommGroup A] [CommGroup B] [CommGroup C]
    [MulDistribMulAction G A] [MulDistribMulAction G B]
    [MulDistribMulAction G C] in
 

theorem card_subgroupOf_eq_card
    {X : Type uA} [Group X] [Finite X] {H K : Subgroup X} (hHK : H ≤ K) :
    Nat.card (H.subgroupOf K) = Nat.card H :=
  Nat.card_congr (Subgroup.subgroupOfEquivOfLe hHK).toEquiv
omit [Fintype G] [CommGroup A] [CommGroup C]
    [MulDistribMulAction G A] [MulDistribMulAction G B]
    [MulDistribMulAction G C] in
 


abbrev rightRegularFunctionMulDistribMulAction :
    MulDistribMulAction G (G → B) where
  smul g f := fun x => f (x * g)
  one_smul := by
    intro f
    change (fun x => f (x * 1)) = f
    funext x
    rw [mul_one]
  mul_smul := by
    intro g h f
    change (fun x => f (x * (g * h))) = fun x => f ((x * g) * h)
    funext x
    rw [mul_assoc]
  smul_mul := by
    intro g f h
    funext x
    rfl
  smul_one := by
    intro g
    funext x
    rfl
 
theorem map_tateNorm (f : A →* B)
    (hf : ∀ (g : G) (a : A), f (g • a) = g • f a) (a : A) :
    f (tateNorm G A a) = tateNorm G B (f a) := by
  simp only [tateNorm, map_prod]
  exact Finset.prod_congr rfl (fun g _hg => hf g a)
omit [CommGroup B] [CommGroup C]
    [MulDistribMulAction G B] [MulDistribMulAction G C] in
 
theorem tateNorm_mul (a b : A) :
    tateNorm G A (a * b) = tateNorm G A a * tateNorm G A b := by
  calc
    tateNorm G A (a * b) = ∏ g : G, (g • a) * (g • b) := by
      unfold tateNorm
      apply Finset.prod_congr rfl
      intro g _hg
      exact MulDistribMulAction.smul_mul g a b
    _ = tateNorm G A a * tateNorm G A b := by
      simp only [tateNorm, Finset.prod_mul_distrib]
omit [CommGroup B] [CommGroup C]
    [MulDistribMulAction G B] [MulDistribMulAction G C] in
 
@[simp]
theorem tateNorm_one : tateNorm G A 1 = 1 := by
  unfold tateNorm
  exact Finset.prod_eq_one (fun g _hg => MulDistribMulAction.smul_one g)
omit [CommGroup B] [CommGroup C]
    [MulDistribMulAction G B] [MulDistribMulAction G C] in
 
def tateNormHom : A →* A where
  toFun := tateNorm G A
  map_one' := tateNorm_one (G := G) (A := A)
  map_mul' := tateNorm_mul (G := G) (A := A)
omit [CommGroup B] [CommGroup C]
    [MulDistribMulAction G B] [MulDistribMulAction G C] in
 
@[simp]
theorem tateNormHom_apply (a : A) :
    tateNormHom (G := G) (A := A) a = tateNorm G A a :=
  rfl
omit [CommGroup B] [CommGroup C]
    [MulDistribMulAction G B] [MulDistribMulAction G C] in
 
theorem tateNorm_inv (a : A) : tateNorm G A a⁻¹ = (tateNorm G A a)⁻¹ :=
  map_inv (tateNormHom (G := G) (A := A)) a
omit [Fintype G] [CommGroup C] [MulDistribMulAction G C] in
 
theorem map_sigmaMinusOne (f : A →* B)
    (hf : ∀ (g : G) (a : A), f (g • a) = g • f a) (σ : G) (a : A) :
    f (sigmaMinusOne G A σ a) = sigmaMinusOne G B σ (f a) := by
  simp [sigmaMinusOne, hf σ a]
omit [Fintype G] [CommGroup B] [CommGroup C]
    [MulDistribMulAction G B] [MulDistribMulAction G C] in
 
theorem sigmaMinusOne_mul (σ : G) (a b : A) :
    sigmaMinusOne G A σ (a * b) = sigmaMinusOne G A σ a * sigmaMinusOne G A σ b := by
  simp [sigmaMinusOne, mul_comm, mul_left_comm, mul_assoc]
omit [Fintype G] [CommGroup B] [CommGroup C]
    [MulDistribMulAction G B] [MulDistribMulAction G C] in
 
def sigmaMinusOneHom (σ : G) : A →* A where
  toFun := sigmaMinusOne G A σ
  map_one' := by simp [sigmaMinusOne, MulDistribMulAction.smul_one]
  map_mul' := sigmaMinusOne_mul (G := G) (A := A) σ
omit [Fintype G] [CommGroup B] [CommGroup C]
    [MulDistribMulAction G B] [MulDistribMulAction G C] in
 
@[simp]
theorem sigmaMinusOneHom_apply (σ : G) (a : A) :
    sigmaMinusOneHom (G := G) (A := A) σ a = sigmaMinusOne G A σ a :=
  rfl
 
def tateNormSubgroup (G : Type uG) (A : Type uA) [Group G] [Fintype G] [CommGroup A]
    [MulDistribMulAction G A] : Subgroup A :=
  MonoidHom.range (tateNormHom (G := G) (A := A))
 
def normKernelSubgroup (G : Type uG) (A : Type uA) [Group G] [Fintype G] [CommGroup A]
    [MulDistribMulAction G A] : Subgroup A :=
  MonoidHom.ker (tateNormHom (G := G) (A := A))
 
def augmentationSubgroup (G : Type uG) (A : Type uA) [Group G] [CommGroup A]
    [MulDistribMulAction G A] (σ : G) : Subgroup A :=
  MonoidHom.range (sigmaMinusOneHom (G := G) (A := A) σ)
omit [Fintype G] [CommGroup B] [CommGroup C]
    [MulDistribMulAction G B] [MulDistribMulAction G C] in
 
theorem sigmaMinusOneHom_ker_eq_fixedSubgroup
    (σ : G) (hgen : ∀ g : G, g ∈ Subgroup.zpowers σ) :
    MonoidHom.ker (sigmaMinusOneHom (G := G) (A := A) σ) = fixedSubgroup G A := by
  ext a
  constructor
  · intro ha
    exact fixed_of_forall_mem_zpowers_of_sigmaMinusOne_eq_one
      (G := G) (A := A) (σ := σ) hgen (by simpa using ha)
  · intro ha
    change sigmaMinusOne G A σ a = 1
    simp [sigmaMinusOne, ha σ]
omit [CommGroup B] [CommGroup C]
    [MulDistribMulAction G B] [MulDistribMulAction G C] in
 

theorem card_eq_card_normKernelSubgroup_mul_card_tateNormSubgroup [Finite A] :
    Nat.card A = Nat.card (normKernelSubgroup G A) * Nat.card (tateNormSubgroup G A) := by
  simpa [normKernelSubgroup, tateNormSubgroup] using
    monoidHom_card_eq_card_ker_mul_card_range (tateNormHom (G := G) (A := A))
omit [Fintype G] [CommGroup B] [CommGroup C]
    [MulDistribMulAction G B] [MulDistribMulAction G C] in
 


theorem card_eq_card_fixedSubgroup_mul_card_augmentationSubgroup
    (σ : G) (hgen : ∀ g : G, g ∈ Subgroup.zpowers σ) [Finite A] :
    Nat.card A = Nat.card (fixedSubgroup G A) * Nat.card (augmentationSubgroup G A σ) := by
  simpa [sigmaMinusOneHom_ker_eq_fixedSubgroup (G := G) (A := A) σ hgen,
    augmentationSubgroup] using
    monoidHom_card_eq_card_ker_mul_card_range
      (sigmaMinusOneHom (G := G) (A := A) σ)
omit [CommGroup B] [CommGroup C]
    [MulDistribMulAction G B] [MulDistribMulAction G C] in
 

theorem herbrand_finite_module_cardinality_balance
    (σ : G) (hgen : ∀ g : G, g ∈ Subgroup.zpowers σ) [Finite A] :
    Nat.card (fixedSubgroup G A) * Nat.card (augmentationSubgroup G A σ) =
      Nat.card (normKernelSubgroup G A) * Nat.card (tateNormSubgroup G A) := by
  rw [← card_eq_card_fixedSubgroup_mul_card_augmentationSubgroup
      (G := G) (A := A) σ hgen,
    ← card_eq_card_normKernelSubgroup_mul_card_tateNormSubgroup (G := G) (A := A)]
 
def HerbrandH0 (G : Type uG) (A : Type uA) [Group G] [Fintype G] [CommGroup A]
    [MulDistribMulAction G A] : Type uA :=
  fixedSubgroup G A ⧸ (tateNormSubgroup G A).subgroupOf (fixedSubgroup G A)
 

def HerbrandHMinusOne (G : Type uG) (A : Type uA) [Group G] [Fintype G] [CommGroup A]
    [MulDistribMulAction G A] (σ : G) : Type uA :=
  normKernelSubgroup G A ⧸ (augmentationSubgroup G A σ).subgroupOf (normKernelSubgroup G A)
omit [CommGroup B] [CommGroup C]
    [MulDistribMulAction G B] [MulDistribMulAction G C] in
 
instance herbrandH0CommGroup : CommGroup (HerbrandH0 G A) := by
  unfold HerbrandH0
  infer_instance
omit [CommGroup B] [CommGroup C]
    [MulDistribMulAction G B] [MulDistribMulAction G C] in
 
instance herbrandHMinusOneCommGroup (σ : G) :
    CommGroup (HerbrandHMinusOne G A σ) := by
  unfold HerbrandHMinusOne
  infer_instance
omit [CommGroup B] [CommGroup C]
    [MulDistribMulAction G B] [MulDistribMulAction G C] in
 

def HerbrandH0.equiv :
    HerbrandH0 G A ≃*
      fixedSubgroup G A ⧸
        (tateNormSubgroup G A).subgroupOf (fixedSubgroup G A) := by
  change
    (fixedSubgroup G A ⧸
        (tateNormSubgroup G A).subgroupOf (fixedSubgroup G A)) ≃*
      fixedSubgroup G A ⧸
        (tateNormSubgroup G A).subgroupOf (fixedSubgroup G A)
  exact MulEquiv.refl _
omit [CommGroup B] [CommGroup C]
    [MulDistribMulAction G B] [MulDistribMulAction G C] in
 

def HerbrandHMinusOne.equiv (σ : G) :
    HerbrandHMinusOne G A σ ≃*
      normKernelSubgroup G A ⧸
        (augmentationSubgroup G A σ).subgroupOf (normKernelSubgroup G A) := by
  change
    (normKernelSubgroup G A ⧸
        (augmentationSubgroup G A σ).subgroupOf (normKernelSubgroup G A)) ≃*
      normKernelSubgroup G A ⧸
        (augmentationSubgroup G A σ).subgroupOf (normKernelSubgroup G A)
  exact MulEquiv.refl _
omit [CommGroup B] [CommGroup C]
    [MulDistribMulAction G B] [MulDistribMulAction G C] in
 
def HerbrandH0.mk : fixedSubgroup G A →* HerbrandH0 G A := by
  unfold HerbrandH0
  exact QuotientGroup.mk'
    ((tateNormSubgroup G A).subgroupOf (fixedSubgroup G A))
omit [CommGroup B] [CommGroup C]
    [MulDistribMulAction G B] [MulDistribMulAction G C] in
 
def HerbrandHMinusOne.mk (σ : G) :
    normKernelSubgroup G A →* HerbrandHMinusOne G A σ := by
  unfold HerbrandHMinusOne
  exact QuotientGroup.mk'
    ((augmentationSubgroup G A σ).subgroupOf (normKernelSubgroup G A))
omit [CommGroup B] [CommGroup C]
    [MulDistribMulAction G B] [MulDistribMulAction G C] in
 
@[simp]
theorem HerbrandH0.equiv_mk (a : fixedSubgroup G A) :
    HerbrandH0.equiv (G := G) (A := A) (HerbrandH0.mk a) =
      QuotientGroup.mk a := by
  rfl
omit [CommGroup B] [CommGroup C]
    [MulDistribMulAction G B] [MulDistribMulAction G C] in
 

@[simp]
theorem HerbrandHMinusOne.equiv_mk (σ : G) (a : normKernelSubgroup G A) :
    HerbrandHMinusOne.equiv (G := G) (A := A) σ
        (HerbrandHMinusOne.mk σ a) =
      QuotientGroup.mk a := by
  rfl
omit [CommGroup B] [CommGroup C]
    [MulDistribMulAction G B] [MulDistribMulAction G C] in
 
theorem HerbrandH0.mk_surjective :
    Function.Surjective (HerbrandH0.mk (G := G) (A := A)) := by
  intro q
  obtain ⟨a, ha⟩ := QuotientGroup.mk'_surjective
    ((tateNormSubgroup G A).subgroupOf (fixedSubgroup G A))
    (HerbrandH0.equiv (G := G) (A := A) q)
  refine ⟨a, (HerbrandH0.equiv (G := G) (A := A)).injective ?_⟩
  rw [HerbrandH0.equiv_mk]
  exact ha
omit [CommGroup B] [CommGroup C]
    [MulDistribMulAction G B] [MulDistribMulAction G C] in
 
theorem HerbrandHMinusOne.mk_surjective (σ : G) :
    Function.Surjective (HerbrandHMinusOne.mk (G := G) (A := A) σ) := by
  intro q
  obtain ⟨a, ha⟩ := QuotientGroup.mk'_surjective
    ((augmentationSubgroup G A σ).subgroupOf (normKernelSubgroup G A))
    (HerbrandHMinusOne.equiv (G := G) (A := A) σ q)
  refine ⟨a, (HerbrandHMinusOne.equiv (G := G) (A := A) σ).injective ?_⟩
  rw [HerbrandHMinusOne.equiv_mk]
  exact ha
omit [CommGroup B] [CommGroup C]
    [MulDistribMulAction G B] [MulDistribMulAction G C] in
 

@[simp]
theorem HerbrandH0.mk_eq_one_iff (a : fixedSubgroup G A) :
    HerbrandH0.mk a = 1 ↔ (a : A) ∈ tateNormSubgroup G A := by
  constructor
  · intro h
    have hraw :
        (QuotientGroup.mk a :
          fixedSubgroup G A ⧸
            (tateNormSubgroup G A).subgroupOf (fixedSubgroup G A)) = 1 := by
      simpa only [HerbrandH0.equiv_mk, map_one] using
        congrArg (HerbrandH0.equiv (G := G) (A := A)) h
    simpa only [Subgroup.mem_subgroupOf] using
      (QuotientGroup.eq_one_iff a).1 hraw
  · intro h
    apply (HerbrandH0.equiv (G := G) (A := A)).injective
    rw [HerbrandH0.equiv_mk, map_one]
    apply (QuotientGroup.eq_one_iff a).2
    simpa only [Subgroup.mem_subgroupOf] using h
omit [CommGroup B] [CommGroup C]
    [MulDistribMulAction G B] [MulDistribMulAction G C] in
 

@[simp]
theorem HerbrandHMinusOne.mk_eq_one_iff (σ : G)
    (a : normKernelSubgroup G A) :
    HerbrandHMinusOne.mk σ a = 1 ↔
      (a : A) ∈ augmentationSubgroup G A σ := by
  constructor
  · intro h
    have hraw :
        (QuotientGroup.mk a :
          normKernelSubgroup G A ⧸
            (augmentationSubgroup G A σ).subgroupOf (normKernelSubgroup G A)) = 1 := by
      simpa only [HerbrandHMinusOne.equiv_mk, map_one] using
        congrArg (HerbrandHMinusOne.equiv (G := G) (A := A) σ) h
    simpa only [Subgroup.mem_subgroupOf] using
      (QuotientGroup.eq_one_iff a).1 hraw
  · intro h
    apply (HerbrandHMinusOne.equiv (G := G) (A := A) σ).injective
    rw [HerbrandHMinusOne.equiv_mk, map_one]
    apply (QuotientGroup.eq_one_iff a).2
    simpa only [Subgroup.mem_subgroupOf] using h
omit [CommGroup B] [CommGroup C]
    [MulDistribMulAction G B] [MulDistribMulAction G C] in
 

protected theorem HerbrandH0.inductionOn
    {motive : HerbrandH0 G A → Prop} (q : HerbrandH0 G A)
    (h : ∀ a : fixedSubgroup G A, motive (HerbrandH0.mk a)) : motive q := by
  obtain ⟨a, rfl⟩ := HerbrandH0.mk_surjective (G := G) (A := A) q
  exact h a
omit [CommGroup B] [CommGroup C]
    [MulDistribMulAction G B] [MulDistribMulAction G C] in
 

protected theorem HerbrandHMinusOne.inductionOn (σ : G)
    {motive : HerbrandHMinusOne G A σ → Prop}
    (q : HerbrandHMinusOne G A σ)
    (h : ∀ a : normKernelSubgroup G A,
      motive (HerbrandHMinusOne.mk σ a)) : motive q := by
  obtain ⟨a, rfl⟩ :=
    HerbrandHMinusOne.mk_surjective (G := G) (A := A) σ q
  exact h a
omit [CommGroup B] [CommGroup C]
    [MulDistribMulAction G B] [MulDistribMulAction G C] in
 
noncomputable instance herbrandH0FiniteOfFinite [Finite A] :
    Finite (HerbrandH0 G A) := by
  exact Finite.of_equiv
    (fixedSubgroup G A ⧸
      (tateNormSubgroup G A).subgroupOf (fixedSubgroup G A))
    (HerbrandH0.equiv (G := G) (A := A)).symm.toEquiv
omit [CommGroup B] [CommGroup C]
    [MulDistribMulAction G B] [MulDistribMulAction G C] in
 
noncomputable instance herbrandHMinusOneFiniteOfFinite (σ : G) [Finite A] :
    Finite (HerbrandHMinusOne G A σ) := by
  exact Finite.of_equiv
    (normKernelSubgroup G A ⧸
      (augmentationSubgroup G A σ).subgroupOf (normKernelSubgroup G A))
    (HerbrandHMinusOne.equiv (G := G) (A := A) σ).symm.toEquiv
omit [Fintype G] [CommGroup A] [CommGroup C]
    [MulDistribMulAction G A] [MulDistribMulAction G B]
    [MulDistribMulAction G C] in
 
abbrev rightRegularFunctionFixedSubgroup : Subgroup (G → B) := by
  letI := rightRegularFunctionMulDistribMulAction (G := G) (B := B)
  exact fixedSubgroup G (G → B)
omit [CommGroup A] [CommGroup C]
    [MulDistribMulAction G A] [MulDistribMulAction G B]
    [MulDistribMulAction G C] in
 
abbrev rightRegularFunctionTateNormSubgroup : Subgroup (G → B) := by
  letI := rightRegularFunctionMulDistribMulAction (G := G) (B := B)
  exact tateNormSubgroup G (G → B)
omit [CommGroup A] [CommGroup C]
    [MulDistribMulAction G A] [MulDistribMulAction G B]
    [MulDistribMulAction G C] in
 
abbrev rightRegularFunctionNormKernelSubgroup : Subgroup (G → B) := by
  letI := rightRegularFunctionMulDistribMulAction (G := G) (B := B)
  exact normKernelSubgroup G (G → B)
omit [Fintype G] [CommGroup A] [CommGroup C]
    [MulDistribMulAction G A] [MulDistribMulAction G B]
    [MulDistribMulAction G C] in
 
abbrev rightRegularFunctionAugmentationSubgroup (σ : G) : Subgroup (G → B) := by
  letI := rightRegularFunctionMulDistribMulAction (G := G) (B := B)
  exact augmentationSubgroup G (G → B) σ
 

theorem tateNorm_sigmaMinusOne_eq_one (σ : G) (a : A) :
    tateNorm G A (sigmaMinusOne G A σ a) = 1 := by
  have hshift : (∏ g : G, (g * σ) • a) = ∏ g : G, g • a := by
    exact Fintype.prod_equiv (Equiv.mulRight σ)
      (fun g : G => (g * σ) • a) (fun g : G => g • a) (by intro g; rfl)
  calc
    tateNorm G A (sigmaMinusOne G A σ a) = ∏ g : G, ((g * σ) • a) * (g • a)⁻¹ := by
      unfold tateNorm sigmaMinusOne
      apply Finset.prod_congr rfl
      intro g _hg
      calc
        g • (σ • a * a⁻¹) = g • (σ • a) * g • a⁻¹ :=
          MulDistribMulAction.smul_mul g (σ • a) a⁻¹
        _ = (g * σ) • a * (g • a)⁻¹ := by
          rw [← SemigroupAction.mul_smul, smul_inv']
    _ = (∏ g : G, (g * σ) • a) * ∏ g : G, (g • a)⁻¹ := by
      exact Finset.prod_mul_distrib
    _ = 1 := by
      rw [hshift, Finset.prod_inv_distrib, mul_inv_cancel]
 
theorem augmentationSubgroup_le_normKernelSubgroup (σ : G) :
    augmentationSubgroup G A σ ≤ normKernelSubgroup G A := by
  intro a ha
  rcases ha with ⟨b, rfl⟩
  exact tateNorm_sigmaMinusOne_eq_one (G := G) (A := A) σ b
 

theorem smul_tateNorm_eq (h : G) (a : A) :
    h • tateNorm G A a = tateNorm G A a := by
  have hmap : h • (∏ g : G, g • a) = ∏ g : G, h • (g • a) := by
    exact map_prod (MulDistribMulAction.toMonoidHom A h) (fun g : G => g • a) Finset.univ
  have hshift : (∏ g : G, (h * g) • a) = ∏ g : G, g • a := by
    exact Fintype.prod_equiv (Equiv.mulLeft h)
      (fun g : G => (h * g) • a) (fun g : G => g • a) (by intro g; rfl)
  calc
    h • tateNorm G A a = ∏ g : G, h • (g • a) := by
      simpa [tateNorm] using hmap
    _ = ∏ g : G, (h * g) • a := by
      apply Finset.prod_congr rfl
      intro g _hg
      exact (SemigroupAction.mul_smul h g a).symm
    _ = tateNorm G A a := by
      simpa [tateNorm] using hshift
 
theorem tateNormSubgroup_le_fixedSubgroup :
    tateNormSubgroup G A ≤ fixedSubgroup G A := by
  intro a ha g
  rcases ha with ⟨b, rfl⟩
  exact smul_tateNorm_eq (G := G) (A := A) g b
omit [CommGroup B] [CommGroup C]
    [MulDistribMulAction G B] [MulDistribMulAction G C] in
 

theorem herbrandH0_subsingleton_of_fixed_le_tateNormSubgroup
    (h : fixedSubgroup G A ≤ tateNormSubgroup G A) :
    Subsingleton (HerbrandH0 G A) := by
  refine ⟨fun q r => ?_⟩
  have hq : q = 1 := by
    refine HerbrandH0.inductionOn (motive := fun z => z = 1) q ?_
    intro a
    apply (HerbrandH0.mk_eq_one_iff (G := G) (A := A) a).2
    exact h a.2
  have hr : r = 1 := by
    refine HerbrandH0.inductionOn (motive := fun z => z = 1) r ?_
    intro a
    apply (HerbrandH0.mk_eq_one_iff (G := G) (A := A) a).2
    exact h a.2
  rw [hq, hr]
omit [CommGroup B] [CommGroup C]
    [MulDistribMulAction G B] [MulDistribMulAction G C] in
 


theorem herbrandHMinusOne_subsingleton_of_normKernel_le_augmentationSubgroup
    (σ : G) (h : normKernelSubgroup G A ≤ augmentationSubgroup G A σ) :
    Subsingleton (HerbrandHMinusOne G A σ) := by
  refine ⟨fun q r => ?_⟩
  have hq : q = 1 := by
    refine HerbrandHMinusOne.inductionOn σ
      (motive := fun z => z = 1) q ?_
    intro a
    apply (HerbrandHMinusOne.mk_eq_one_iff (G := G) (A := A) σ a).2
    exact h a.2
  have hr : r = 1 := by
    refine HerbrandHMinusOne.inductionOn σ
      (motive := fun z => z = 1) r ?_
    intro a
    apply (HerbrandHMinusOne.mk_eq_one_iff (G := G) (A := A) σ a).2
    exact h a.2
  rw [hq, hr]
omit [CommGroup C] [MulDistribMulAction G C] in
 

theorem fixed_le_tateNormSubgroup_of_mulEquiv
    (e : A ≃* B)
    (he : ∀ (g : G) (a : A), e (g • a) = g • e a)
    (hB : fixedSubgroup G B ≤ tateNormSubgroup G B) :
    fixedSubgroup G A ≤ tateNormSubgroup G A := by
  intro a ha
  have hea : e a ∈ fixedSubgroup G B := by
    intro g
    rw [← he g a, ha g]
  rcases hB hea with ⟨b, hb⟩
  refine ⟨e.symm b, ?_⟩
  apply e.injective
  calc
    e (tateNorm G A (e.symm b)) =
        tateNorm G B (e (e.symm b)) :=
      map_tateNorm (G := G) (A := A) (B := B) e.toMonoidHom
        (fun g a => by simpa using he g a) (e.symm b)
    _ = tateNorm G B b := by rw [e.apply_symm_apply]
    _ = e a := hb
omit [CommGroup C] [MulDistribMulAction G C] in
 

theorem normKernel_le_augmentationSubgroup_of_mulEquiv
    (e : A ≃* B)
    (he : ∀ (g : G) (a : A), e (g • a) = g • e a)
    (σ : G) (hB : normKernelSubgroup G B ≤ augmentationSubgroup G B σ) :
    normKernelSubgroup G A ≤ augmentationSubgroup G A σ := by
  intro a ha
  have haNorm : tateNorm G A a = 1 := by
    simpa [normKernelSubgroup] using ha
  have hea : e a ∈ normKernelSubgroup G B := by
    change tateNorm G B (e a) = 1
    calc
      tateNorm G B (e a) = e (tateNorm G A a) :=
        (map_tateNorm (G := G) (A := A) (B := B) e.toMonoidHom
          (fun g a => by simpa using he g a) a).symm
      _ = e 1 := by rw [haNorm]
      _ = 1 := by simp
  rcases hB hea with ⟨b, hb⟩
  refine ⟨e.symm b, ?_⟩
  apply e.injective
  calc
    e (sigmaMinusOne G A σ (e.symm b)) =
        sigmaMinusOne G B σ (e (e.symm b)) :=
      map_sigmaMinusOne (G := G) (A := A) (B := B) e.toMonoidHom
        (fun g a => by simpa using he g a) σ (e.symm b)
    _ = sigmaMinusOne G B σ b := by rw [e.apply_symm_apply]
    _ = e a := hb
omit [CommGroup C] [MulDistribMulAction G C] in
 

theorem herbrandH0_subsingleton_of_mulEquiv
    (e : A ≃* B)
    (he : ∀ (g : G) (a : A), e (g • a) = g • e a)
    (hB : fixedSubgroup G B ≤ tateNormSubgroup G B) :
    Subsingleton (HerbrandH0 G A) :=
  herbrandH0_subsingleton_of_fixed_le_tateNormSubgroup
    (G := G) (A := A)
    (fixed_le_tateNormSubgroup_of_mulEquiv (G := G) (A := A) (B := B) e he hB)
omit [CommGroup C] [MulDistribMulAction G C] in
 

theorem herbrandHMinusOne_subsingleton_of_mulEquiv
    (e : A ≃* B)
    (he : ∀ (g : G) (a : A), e (g • a) = g • e a)
    (σ : G) (hB : normKernelSubgroup G B ≤ augmentationSubgroup G B σ) :
    Subsingleton (HerbrandHMinusOne G A σ) :=
  herbrandHMinusOne_subsingleton_of_normKernel_le_augmentationSubgroup
    (G := G) (A := A) σ
    (normKernel_le_augmentationSubgroup_of_mulEquiv
      (G := G) (A := A) (B := B) e he σ hB)
omit [CommGroup A] [CommGroup C]
    [MulDistribMulAction G A] [MulDistribMulAction G B]
    [MulDistribMulAction G C] in
 

theorem rightRegularFunction_mem_normKernelSubgroup_iff (f : G → B) :
    f ∈ rightRegularFunctionNormKernelSubgroup (G := G) (B := B) ↔
      (∏ g : G, f g) = 1 := by
  let := rightRegularFunctionMulDistribMulAction (G := G) (B := B)
  have hnorm (x : G) : tateNorm G (G → B) f x = ∏ g : G, f g := by
    calc
      tateNorm G (G → B) f x = ∏ g : G, f (x * g) := by
        unfold tateNorm
        let ev : (G → B) →* B := {
          toFun q := q x
          map_one' := rfl
          map_mul' := by
            intro q r
            rfl
        }
        calc
          ((∏ c : G, c • f) : G → B) x = ev (∏ c : G, c • f) := rfl
          _ = ∏ c : G, ev (c • f) := by rw [map_prod]
          _ = ∏ c : G, f (x * c) := by
            refine Finset.prod_congr rfl ?_
            intro c _hc
            change (c • f) x = f (x * c)
            rfl
      _ = ∏ g : G, f g := by
        exact Fintype.prod_equiv (Equiv.mulLeft x)
          (fun g : G => f (x * g)) (fun g : G => f g) (by intro g; rfl)
  constructor
  · intro hf
    change tateNorm G (G → B) f = 1 at hf
    have hx := congrArg (fun q : G → B => q 1) hf
    calc
      (∏ g : G, f g) = tateNorm G (G → B) f 1 := (hnorm 1).symm
      _ = 1 := by simpa using hx
  · intro hf
    change tateNorm G (G → B) f = 1
    funext x
    calc
      tateNorm G (G → B) f x = ∏ g : G, f g := hnorm x
      _ = 1 := hf
omit [Fintype G] [CommGroup A] [CommGroup C]
    [MulDistribMulAction G A] [MulDistribMulAction G B]
    [MulDistribMulAction G C] in
 


def rightRegularCyclicPartialProduct (σ : G) (f : G → B) (i : ℕ) : B :=
  (Finset.range i).prod (fun k => f (σ ^ k))
omit [Fintype G] [CommGroup A] [CommGroup C]
    [MulDistribMulAction G A] [MulDistribMulAction G B]
    [MulDistribMulAction G C] in
 
theorem rightRegularCyclicPartialProduct_succ (σ : G) (f : G → B) (i : ℕ) :
    rightRegularCyclicPartialProduct (G := G) (B := B) σ f (i + 1) =
      rightRegularCyclicPartialProduct (G := G) (B := B) σ f i * f (σ ^ i) := by
  simp [rightRegularCyclicPartialProduct, Finset.prod_range_succ]
omit [Fintype G] [CommGroup A] [CommGroup C]
    [MulDistribMulAction G A] [MulDistribMulAction G B]
    [MulDistribMulAction G C] in
 

theorem rightRegularCyclicPartialProduct_succ_mul_inv
    (σ : G) (f : G → B) (i : ℕ) :
    rightRegularCyclicPartialProduct (G := G) (B := B) σ f (i + 1) *
        (rightRegularCyclicPartialProduct (G := G) (B := B) σ f i)⁻¹ =
      f (σ ^ i) := by
  rw [rightRegularCyclicPartialProduct_succ]
  simp [mul_comm, mul_assoc]
omit [Fintype G] [CommGroup A] [CommGroup C]
    [MulDistribMulAction G A] [MulDistribMulAction G B]
    [MulDistribMulAction G C] in
 

theorem rightRegularCyclicPartialProduct_wrap_mul_inv_of_eq_one
    (σ : G) (f : G → B) {n : ℕ} (hn : 0 < n)
    (hprod : rightRegularCyclicPartialProduct (G := G) (B := B) σ f n = 1) :
    rightRegularCyclicPartialProduct (G := G) (B := B) σ f 0 *
        (rightRegularCyclicPartialProduct (G := G) (B := B) σ f (n - 1))⁻¹ =
      f (σ ^ (n - 1)) := by
  cases n with
  | zero => cases hn
  | succ n =>
      have hlast :
          rightRegularCyclicPartialProduct (G := G) (B := B) σ f n * f (σ ^ n) = 1 := by
        simpa [rightRegularCyclicPartialProduct_succ] using hprod
      have hinv :
          (rightRegularCyclicPartialProduct (G := G) (B := B) σ f n)⁻¹ = f (σ ^ n) :=
        (mul_eq_one_iff_inv_eq).1 hlast
      simpa [rightRegularCyclicPartialProduct, hinv]
omit [CommGroup A] [CommGroup B] [CommGroup C]
    [MulDistribMulAction G A] [MulDistribMulAction G B]
    [MulDistribMulAction G C] in
 

noncomputable def rightRegularCyclicIndex
    (σ : G) (hgen : ∀ g : G, g ∈ Subgroup.zpowers σ) (x : G) :
    ZMod (Fintype.card G) :=
  Classical.choose (IsCyclic.unique_zpow_zmod (a := σ) hgen x)
omit [CommGroup A] [CommGroup B] [CommGroup C]
    [MulDistribMulAction G A] [MulDistribMulAction G B]
    [MulDistribMulAction G C] in
 
theorem rightRegularCyclicIndex_spec
    (σ : G) (hgen : ∀ g : G, g ∈ Subgroup.zpowers σ) (x : G) :
    x = σ ^ (rightRegularCyclicIndex (G := G) σ hgen x).val := by
  simpa [rightRegularCyclicIndex] using
    (Classical.choose_spec (IsCyclic.unique_zpow_zmod (a := σ) hgen x)).1
omit [CommGroup A] [CommGroup B] [CommGroup C]
    [MulDistribMulAction G A] [MulDistribMulAction G B]
    [MulDistribMulAction G C] in
 

theorem rightRegularCyclicIndex_eq_of_repr
    (σ : G) (hgen : ∀ g : G, g ∈ Subgroup.zpowers σ)
    {x : G} {m : ZMod (Fintype.card G)} (hm : x = σ ^ m.val) :
    rightRegularCyclicIndex (G := G) σ hgen x = m := by
  exact ((Classical.choose_spec (IsCyclic.unique_zpow_zmod (a := σ) hgen x)).2 m hm).symm
omit [CommGroup A] [CommGroup B] [CommGroup C]
    [MulDistribMulAction G A] [MulDistribMulAction G B]
    [MulDistribMulAction G C] in
 

theorem rightRegularCyclicIndex_val_pow_of_lt
    (σ : G) (hgen : ∀ g : G, g ∈ Subgroup.zpowers σ)
    {i : ℕ} (hi : i < Fintype.card G) :
    (rightRegularCyclicIndex (G := G) σ hgen (σ ^ i)).val = i := by
  have hidx :
      rightRegularCyclicIndex (G := G) σ hgen (σ ^ i) =
        (i : ZMod (Fintype.card G)) := by
    apply rightRegularCyclicIndex_eq_of_repr (G := G) σ hgen
    simp [ZMod.val_natCast_of_lt hi]
  rw [hidx, ZMod.val_natCast_of_lt hi]
omit [CommGroup A] [CommGroup C]
    [MulDistribMulAction G A] [MulDistribMulAction G B]
    [MulDistribMulAction G C] in
 

noncomputable def rightRegularCyclicPrimitive
    (σ : G) (hgen : ∀ g : G, g ∈ Subgroup.zpowers σ) (f : G → B) : G → B :=
  fun x =>
    rightRegularCyclicPartialProduct (G := G) (B := B) σ f
      (rightRegularCyclicIndex (G := G) σ hgen x).val
omit [CommGroup A] [CommGroup C]
    [MulDistribMulAction G A] [MulDistribMulAction G B]
    [MulDistribMulAction G C] in
 

theorem rightRegularCyclicPrimitive_mul_sigma_mul_inv_of_index_succ_lt
    (σ : G) (hgen : ∀ g : G, g ∈ Subgroup.zpowers σ) (f : G → B) (x : G)
    (hix : (rightRegularCyclicIndex (G := G) σ hgen x).val + 1 < Fintype.card G) :
    rightRegularCyclicPrimitive (G := G) (B := B) σ hgen f (x * σ) *
        (rightRegularCyclicPrimitive (G := G) (B := B) σ hgen f x)⁻¹ =
      f x := by
  let i := (rightRegularCyclicIndex (G := G) σ hgen x).val
  have hi : i + 1 < Fintype.card G := by
    simpa [i] using hix
  have hx : x = σ ^ i := by
    simpa [i] using rightRegularCyclicIndex_spec (G := G) σ hgen x
  have hxσ : x * σ = σ ^ (i + 1) := by
    calc
      x * σ = σ ^ i * σ := by rw [hx]
      _ = σ ^ (i + 1) := (pow_succ σ i).symm
  have hidx_xσ :
      (rightRegularCyclicIndex (G := G) σ hgen (x * σ)).val = i + 1 := by
    rw [hxσ]
    exact rightRegularCyclicIndex_val_pow_of_lt (G := G) σ hgen hi
  change rightRegularCyclicPartialProduct (G := G) (B := B) σ f
        (rightRegularCyclicIndex (G := G) σ hgen (x * σ)).val *
      (rightRegularCyclicPartialProduct (G := G) (B := B) σ f
        (rightRegularCyclicIndex (G := G) σ hgen x).val)⁻¹ = f x
  rw [hidx_xσ, show (rightRegularCyclicIndex (G := G) σ hgen x).val = i by rfl, hx]
  exact rightRegularCyclicPartialProduct_succ_mul_inv (G := G) (B := B) σ f i
omit [CommGroup A] [CommGroup C]
    [MulDistribMulAction G A] [MulDistribMulAction G B]
    [MulDistribMulAction G C] in
 

theorem rightRegularCyclicPrimitive_mul_sigma_mul_inv_of_index_eq_card_sub_one
    (σ : G) (hgen : ∀ g : G, g ∈ Subgroup.zpowers σ) (f : G → B) (x : G)
    (hix : (rightRegularCyclicIndex (G := G) σ hgen x).val = Fintype.card G - 1)
    (hprod :
      rightRegularCyclicPartialProduct (G := G) (B := B) σ f (Fintype.card G) = 1) :
    rightRegularCyclicPrimitive (G := G) (B := B) σ hgen f (x * σ) *
        (rightRegularCyclicPrimitive (G := G) (B := B) σ hgen f x)⁻¹ =
      f x := by
  have hcard_pos : 0 < Fintype.card G := Fintype.card_pos
  let i := (rightRegularCyclicIndex (G := G) σ hgen x).val
  have hi : i = Fintype.card G - 1 := by
    simpa [i] using hix
  have hx : x = σ ^ i := by
    simpa [i] using rightRegularCyclicIndex_spec (G := G) σ hgen x
  have horder : orderOf σ = Fintype.card G := by
    simpa [Nat.card_eq_fintype_card] using
      orderOf_eq_card_of_forall_mem_zpowers (g := σ) hgen
  have hpow_card : σ ^ Fintype.card G = 1 := by
    rw [← horder]
    exact pow_orderOf_eq_one σ
  have hxσ : x * σ = 1 := by
    calc
      x * σ = σ ^ i * σ := by rw [hx]
      _ = σ ^ (i + 1) := (pow_succ σ i).symm
      _ = σ ^ Fintype.card G := by
        rw [hi, Nat.sub_add_cancel (Nat.succ_le_of_lt hcard_pos)]
      _ = 1 := hpow_card
  have hidx_xσ :
      (rightRegularCyclicIndex (G := G) σ hgen (x * σ)).val = 0 := by
    have hidx :
        rightRegularCyclicIndex (G := G) σ hgen (x * σ) =
          (0 : ZMod (Fintype.card G)) := by
      apply rightRegularCyclicIndex_eq_of_repr (G := G) σ hgen
      simp [hxσ]
    rw [hidx]
    simp
  have hwrap :
      rightRegularCyclicPartialProduct (G := G) (B := B) σ f 0 *
          (rightRegularCyclicPartialProduct (G := G) (B := B) σ f
            (Fintype.card G - 1))⁻¹ =
        f (σ ^ (Fintype.card G - 1)) :=
    rightRegularCyclicPartialProduct_wrap_mul_inv_of_eq_one
      (G := G) (B := B) σ f hcard_pos hprod
  change rightRegularCyclicPartialProduct (G := G) (B := B) σ f
        (rightRegularCyclicIndex (G := G) σ hgen (x * σ)).val *
      (rightRegularCyclicPartialProduct (G := G) (B := B) σ f
        (rightRegularCyclicIndex (G := G) σ hgen x).val)⁻¹ = f x
  rw [hidx_xσ, hix, hx, hi]
  exact hwrap
omit [CommGroup A] [CommGroup C]
    [MulDistribMulAction G A] [MulDistribMulAction G B]
    [MulDistribMulAction G C] in
 

theorem rightRegularCyclicPrimitive_mul_sigma_mul_inv_of_partialProduct_eq_one
    (σ : G) (hgen : ∀ g : G, g ∈ Subgroup.zpowers σ) (f : G → B)
    (hprod :
      rightRegularCyclicPartialProduct (G := G) (B := B) σ f (Fintype.card G) = 1)
    (x : G) :
    rightRegularCyclicPrimitive (G := G) (B := B) σ hgen f (x * σ) *
        (rightRegularCyclicPrimitive (G := G) (B := B) σ hgen f x)⁻¹ =
      f x := by
  have hcard_pos : 0 < Fintype.card G := Fintype.card_pos
  have : NeZero (Fintype.card G) := ⟨hcard_pos.ne'⟩
  let i := (rightRegularCyclicIndex (G := G) σ hgen x).val
  have hi_lt : i < Fintype.card G := by
    simpa [i] using ZMod.val_lt (rightRegularCyclicIndex (G := G) σ hgen x)
  by_cases hsucc : i + 1 < Fintype.card G
  · exact rightRegularCyclicPrimitive_mul_sigma_mul_inv_of_index_succ_lt
      (G := G) (B := B) σ hgen f x (by simpa [i] using hsucc)
  · have hsucc_le : i + 1 ≤ Fintype.card G := Nat.succ_le_of_lt hi_lt
    have hcard_le : Fintype.card G ≤ i + 1 := le_of_not_gt hsucc
    have hsucc_eq : i + 1 = Fintype.card G := le_antisymm hsucc_le hcard_le
    have hlast : i = Fintype.card G - 1 := by
      rw [← hsucc_eq]
      simp
    exact rightRegularCyclicPrimitive_mul_sigma_mul_inv_of_index_eq_card_sub_one
      (G := G) (B := B) σ hgen f x (by simpa [i] using hlast) hprod
omit [CommGroup A] [CommGroup C]
    [MulDistribMulAction G A] [MulDistribMulAction G B]
    [MulDistribMulAction G C] in
 

theorem rightRegularFunction_prod_powers_eq_one_of_mem_normKernel
    (σ : G) (hgen : ∀ g : G, g ∈ Subgroup.zpowers σ)
    {f : G → B}
    (hf : f ∈ rightRegularFunctionNormKernelSubgroup (G := G) (B := B)) :
    (Finset.range (Nat.card G)).prod (fun i => f (σ ^ i)) = 1 := by
  classical
  have hprod : (∏ g : G, f g) = 1 :=
    (rightRegularFunction_mem_normKernelSubgroup_iff (G := G) (B := B) f).1 hf
  have hcard : orderOf σ = Nat.card G :=
    orderOf_eq_card_of_forall_mem_zpowers (g := σ) hgen
  have hinj : Set.InjOn (fun i : ℕ => σ ^ i) (Finset.range (Nat.card G) : Set ℕ) := by
    intro i hi j hj hij
    have hmod : i ≡ j [MOD orderOf σ] := (pow_eq_pow_iff_modEq (x := σ)).1 hij
    rw [hcard] at hmod
    exact Nat.ModEq.eq_of_lt_of_lt hmod (by simpa using hi) (by simpa using hj)
  have himage :
      Finset.image (fun i : ℕ => σ ^ i) (Finset.range (Nat.card G)) = Finset.univ :=
    IsCyclic.image_range_card (a := σ) hgen
  calc
    (Finset.range (Nat.card G)).prod (fun i => f (σ ^ i)) =
        (Finset.image (fun i : ℕ => σ ^ i) (Finset.range (Nat.card G))).prod
          (fun x => f x) := by
      exact (Finset.prod_image (s := Finset.range (Nat.card G))
        (g := fun i : ℕ => σ ^ i) (f := f) hinj).symm
    _ = ∏ x : G, f x := by
      rw [himage]
    _ = 1 := hprod
omit [Fintype G] [CommGroup A] [CommGroup C]
    [MulDistribMulAction G A] [MulDistribMulAction G B]
    [MulDistribMulAction G C] in
 

theorem rightRegularFunction_mem_augmentationSubgroup_iff
    (σ : G) (f : G → B) :
    f ∈ rightRegularFunctionAugmentationSubgroup (G := G) (B := B) σ ↔
      ∃ b : G → B, ∀ x : G, b (x * σ) * (b x)⁻¹ = f x := by
  let := rightRegularFunctionMulDistribMulAction (G := G) (B := B)
  constructor
  · intro hf
    change f ∈ augmentationSubgroup G (G → B) σ at hf
    rcases hf with ⟨b, hb⟩
    refine ⟨b, ?_⟩
    intro x
    have hx := congrArg (fun q : G → B => q x) hb
    change b (x * σ) * (b x)⁻¹ = f x at hx
    exact hx
  · rintro ⟨b, hb⟩
    change f ∈ augmentationSubgroup G (G → B) σ
    refine ⟨b, ?_⟩
    funext x
    change b (x * σ) * (b x)⁻¹ = f x
    exact hb x
omit [CommGroup A] [CommGroup C]
    [MulDistribMulAction G A] [MulDistribMulAction G B]
    [MulDistribMulAction G C] in
 

theorem rightRegularFunction_normKernel_le_augmentationSubgroup
    (σ : G) (hgen : ∀ g : G, g ∈ Subgroup.zpowers σ) :
    rightRegularFunctionNormKernelSubgroup (G := G) (B := B) ≤
      rightRegularFunctionAugmentationSubgroup (G := G) (B := B) σ := by
  intro f hf
  have hprod_nat :
      (Finset.range (Nat.card G)).prod (fun i => f (σ ^ i)) = 1 :=
    rightRegularFunction_prod_powers_eq_one_of_mem_normKernel
      (G := G) (B := B) σ hgen hf
  have hprod :
      rightRegularCyclicPartialProduct (G := G) (B := B) σ f (Fintype.card G) = 1 := by
    simpa [rightRegularCyclicPartialProduct, Nat.card_eq_fintype_card] using hprod_nat
  rw [rightRegularFunction_mem_augmentationSubgroup_iff (G := G) (B := B) σ f]
  refine ⟨rightRegularCyclicPrimitive (G := G) (B := B) σ hgen f, ?_⟩
  intro x
  exact rightRegularCyclicPrimitive_mul_sigma_mul_inv_of_partialProduct_eq_one
    (G := G) (B := B) σ hgen f hprod x
omit [CommGroup A] [CommGroup C]
    [MulDistribMulAction G A] [MulDistribMulAction G B]
    [MulDistribMulAction G C] in
 

theorem rightRegularFunction_fixed_le_tateNormSubgroup :
    rightRegularFunctionFixedSubgroup (G := G) (B := B) ≤
      rightRegularFunctionTateNormSubgroup (G := G) (B := B) := by
  classical
  let := rightRegularFunctionMulDistribMulAction (G := G) (B := B)
  intro f hf
  change f ∈ fixedSubgroup G (G → B) at hf
  change f ∈ tateNormSubgroup G (G → B)
  let d : G → B := fun y => if y = 1 then f 1 else 1
  refine ⟨d, ?_⟩
  funext x
  have hfixed_x : f x = f 1 := by
    have hx := congrArg (fun q : G → B => q 1) (hf x)
    change f (1 * x) = f 1 at hx
    simpa using hx
  calc
    tateNorm G (G → B) d x = ∏ g : G, d (x * g) := by
      unfold tateNorm
      let ev : (G → B) →* B := {
        toFun q := q x
        map_one' := rfl
        map_mul' := by
          intro q r
          rfl
      }
      calc
        ((∏ c : G, c • d) : G → B) x = ev (∏ c : G, c • d) := rfl
        _ = ∏ c : G, ev (c • d) := by rw [map_prod]
        _ = ∏ c : G, d (x * c) := by
          refine Finset.prod_congr rfl ?_
          intro c _hc
          change (c • d) x = d (x * c)
          rfl
    _ = f 1 := by
      calc
        (∏ g : G, d (x * g)) = d (x * x⁻¹) := by
          refine Finset.prod_eq_single (s := Finset.univ) x⁻¹ ?_ ?_
          · intro g _hg hg
            have hxg : x * g ≠ 1 := by
              intro hxg_one
              apply hg
              calc
                g = 1 * g := by simp
                _ = (x⁻¹ * x) * g := by simp
                _ = x⁻¹ * (x * g) := by rw [mul_assoc]
                _ = x⁻¹ * 1 := by rw [hxg_one]
                _ = x⁻¹ := by simp
            simp [d, hxg]
          · intro hxinv
            simp at hxinv
        _ = f 1 := by simp [d]
    _ = f x := hfixed_x.symm
omit [CommGroup C] [MulDistribMulAction G B] [MulDistribMulAction G C] in
 

theorem herbrandH0_subsingleton_of_equiv_rightRegularFunction
    (e : A ≃* (G → B))
    (he : ∀ (g : G) (a : A) (x : G), e (g • a) x = e a (x * g)) :
    Subsingleton (HerbrandH0 G A) := by
  let := rightRegularFunctionMulDistribMulAction (G := G) (B := B)
  exact herbrandH0_subsingleton_of_mulEquiv
    (G := G) (A := A) (B := G → B) e
    (by
      intro g a
      funext x
      change e (g • a) x = e a (x * g)
      exact he g a x)
    (rightRegularFunction_fixed_le_tateNormSubgroup (G := G) (B := B))
omit [CommGroup C] [MulDistribMulAction G B] [MulDistribMulAction G C] in
 

theorem herbrandHMinusOne_subsingleton_of_equiv_rightRegularFunction
    (σ : G) (hgen : ∀ g : G, g ∈ Subgroup.zpowers σ)
    (e : A ≃* (G → B))
    (he : ∀ (g : G) (a : A) (x : G), e (g • a) x = e a (x * g)) :
    Subsingleton (HerbrandHMinusOne G A σ) := by
  let := rightRegularFunctionMulDistribMulAction (G := G) (B := B)
  exact herbrandHMinusOne_subsingleton_of_mulEquiv
    (G := G) (A := A) (B := G → B) e
    (by
      intro g a
      funext x
      change e (g • a) x = e a (x * g)
      exact he g a x)
    σ
    (rightRegularFunction_normKernel_le_augmentationSubgroup
      (G := G) (B := B) σ hgen)
omit [CommGroup A] [CommGroup B] [CommGroup C]
    [MulDistribMulAction G A] [MulDistribMulAction G B]
    [MulDistribMulAction G C] in
 

abbrev multiplicativeMulDistribMulActionOfDistribMulAction
    (G : Type uG) (M : Type uA) [Group G] [AddCommGroup M]
    [DistribMulAction G M] :
    MulDistribMulAction G (Multiplicative M) where
  smul g m := Multiplicative.ofAdd (g • Multiplicative.toAdd m)
  one_smul := by
    intro m
    change Multiplicative.ofAdd (1 • Multiplicative.toAdd m) =
      Multiplicative.ofAdd (Multiplicative.toAdd m)
    rw [one_smul]
  mul_smul := by
    intro g h m
    change Multiplicative.ofAdd ((g * h) • Multiplicative.toAdd m) =
      Multiplicative.ofAdd (g • h • Multiplicative.toAdd m)
    rw [mul_smul]
  smul_mul := by
    intro g m n
    change Multiplicative.ofAdd (g • Multiplicative.toAdd (m * n)) =
      Multiplicative.ofAdd
        (g • Multiplicative.toAdd m + g • Multiplicative.toAdd n)
    rw [show Multiplicative.toAdd (m * n) =
        Multiplicative.toAdd m + Multiplicative.toAdd n from rfl]
    rw [smul_add]
  smul_one := by
    intro g
    change Multiplicative.ofAdd (g • (0 : M)) = Multiplicative.ofAdd (0 : M)
    rw [smul_zero]
omit [Group G] [Fintype G] [CommGroup A] [CommGroup B] [CommGroup C]
    [MulDistribMulAction G A] [MulDistribMulAction G B]
    [MulDistribMulAction G C] in
 

def mulEquivRightRegularFunctionOfAddEquiv
    (G : Type uG) {M : Type uA} {D : Type uB}
    [AddCommGroup M] [AddCommGroup D] (e : M ≃+ (G → D)) :
    Multiplicative M ≃* (G → Multiplicative D) where
  toFun m := fun x => Multiplicative.ofAdd (e (Multiplicative.toAdd m) x)
  invFun f := Multiplicative.ofAdd (e.symm (fun x => Multiplicative.toAdd (f x)))
  left_inv := by
    intro m
    change Multiplicative.ofAdd
        (e.symm (e (Multiplicative.toAdd m))) =
      Multiplicative.ofAdd (Multiplicative.toAdd m)
    exact congrArg Multiplicative.ofAdd (e.left_inv (Multiplicative.toAdd m))
  right_inv := by
    intro f
    funext x
    change Multiplicative.ofAdd
        (e (e.symm (fun y : G => Multiplicative.toAdd (f y))) x) =
      Multiplicative.ofAdd (Multiplicative.toAdd (f x))
    exact congrArg Multiplicative.ofAdd
      (congrArg (fun q : G → D => q x)
        (e.right_inv (fun y : G => Multiplicative.toAdd (f y))))
  map_mul' := by
    intro m n
    funext x
    change Multiplicative.ofAdd (e (Multiplicative.toAdd (m * n)) x) =
      Multiplicative.ofAdd
        (e (Multiplicative.toAdd m) x + e (Multiplicative.toAdd n) x)
    rw [show Multiplicative.toAdd (m * n) =
        Multiplicative.toAdd m + Multiplicative.toAdd n from rfl]
    exact congrArg Multiplicative.ofAdd
      (congrArg (fun q : G → D => q x)
        (e.map_add (Multiplicative.toAdd m) (Multiplicative.toAdd n)))
omit [Fintype G] [CommGroup A] [CommGroup B] [CommGroup C]
    [MulDistribMulAction G A] [MulDistribMulAction G B]
    [MulDistribMulAction G C] in
 

theorem mulEquivRightRegularFunctionOfAddEquiv_commutes
    {M : Type uA} {D : Type uB}
    [AddCommGroup M] [DistribMulAction G M] [AddCommGroup D]
    (e : M ≃+ (G → D))
    (he : ∀ (g : G) (m : M) (x : G), e (g • m) x = e m (x * g))
    (g : G) (m : Multiplicative M) (x : G) :
    letI := multiplicativeMulDistribMulActionOfDistribMulAction G M
    mulEquivRightRegularFunctionOfAddEquiv G e (g • m) x =
      mulEquivRightRegularFunctionOfAddEquiv G e m (x * g) := by
  change Multiplicative.ofAdd (e (g • Multiplicative.toAdd m) x) =
    Multiplicative.ofAdd (e (Multiplicative.toAdd m) (x * g))
  exact congrArg Multiplicative.ofAdd (he g (Multiplicative.toAdd m) x)
omit [CommGroup A] [CommGroup B] [CommGroup C]
    [MulDistribMulAction G A] [MulDistribMulAction G B]
    [MulDistribMulAction G C] in
 

theorem herbrandH0_subsingleton_of_addEquiv_rightRegularFunction
    {M : Type uA} {D : Type uB}
    [AddCommGroup M] [DistribMulAction G M] [AddCommGroup D]
    (e : M ≃+ (G → D))
    (he : ∀ (g : G) (m : M) (x : G), e (g • m) x = e m (x * g)) :
    letI := multiplicativeMulDistribMulActionOfDistribMulAction G M
    Subsingleton (HerbrandH0 G (Multiplicative M)) := by
  let := multiplicativeMulDistribMulActionOfDistribMulAction G M
  let : MulDistribMulAction G (Multiplicative D) := {
    smul _ d := d
    one_smul := by
      intro d
      rfl
    mul_smul := by
      intro _ _ d
      rfl
    smul_mul := by
      intro _ d e
      rfl
    smul_one := by
      intro _
      rfl
  }
  exact herbrandH0_subsingleton_of_equiv_rightRegularFunction
    (G := G) (A := Multiplicative M) (B := Multiplicative D)
    (mulEquivRightRegularFunctionOfAddEquiv G e)
    (by
      intro g m x
      exact mulEquivRightRegularFunctionOfAddEquiv_commutes
        (G := G) e he g m x)
omit [CommGroup A] [CommGroup B] [CommGroup C]
    [MulDistribMulAction G A] [MulDistribMulAction G B]
    [MulDistribMulAction G C] in
 

theorem herbrandHMinusOne_subsingleton_of_addEquiv_rightRegularFunction
    {M : Type uA} {D : Type uB}
    [AddCommGroup M] [DistribMulAction G M] [AddCommGroup D]
    (σ : G) (hgen : ∀ g : G, g ∈ Subgroup.zpowers σ)
    (e : M ≃+ (G → D))
    (he : ∀ (g : G) (m : M) (x : G), e (g • m) x = e m (x * g)) :
    letI := multiplicativeMulDistribMulActionOfDistribMulAction G M
    Subsingleton (HerbrandHMinusOne G (Multiplicative M) σ) := by
  let := multiplicativeMulDistribMulActionOfDistribMulAction G M
  let : MulDistribMulAction G (Multiplicative D) := {
    smul _ d := d
    one_smul := by
      intro d
      rfl
    mul_smul := by
      intro _ _ d
      rfl
    smul_mul := by
      intro _ d e
      rfl
    smul_one := by
      intro _
      rfl
  }
  exact herbrandHMinusOne_subsingleton_of_equiv_rightRegularFunction
    (G := G) (A := Multiplicative M) (B := Multiplicative D)
    σ hgen (mulEquivRightRegularFunctionOfAddEquiv G e)
    (by
      intro g m x
      exact mulEquivRightRegularFunctionOfAddEquiv_commutes
        (G := G) e he g m x)
omit [CommGroup B] [CommGroup C]
    [MulDistribMulAction G B] [MulDistribMulAction G C] in
 
theorem card_fixedSubgroup_eq_card_herbrandH0_mul_card_tateNormSubgroup [Finite A] :
    Nat.card (fixedSubgroup G A) =
      Nat.card (HerbrandH0 G A) * Nat.card (tateNormSubgroup G A) := by
  simpa [HerbrandH0,
    card_subgroupOf_eq_card (tateNormSubgroup_le_fixedSubgroup (G := G) (A := A))] using
    (Subgroup.card_eq_card_quotient_mul_card_subgroup
      ((tateNormSubgroup G A).subgroupOf (fixedSubgroup G A)))
omit [CommGroup B] [CommGroup C]
    [MulDistribMulAction G B] [MulDistribMulAction G C] in
 

theorem card_normKernelSubgroup_eq_card_herbrandHMinusOne_mul_card_augmentationSubgroup
    (σ : G) [Finite A] :
    Nat.card (normKernelSubgroup G A) =
      Nat.card (HerbrandHMinusOne G A σ) *
        Nat.card (augmentationSubgroup G A σ) := by
  simpa [HerbrandHMinusOne,
    card_subgroupOf_eq_card (augmentationSubgroup_le_normKernelSubgroup (G := G) (A := A) σ)] using
    (Subgroup.card_eq_card_quotient_mul_card_subgroup
      ((augmentationSubgroup G A σ).subgroupOf (normKernelSubgroup G A)))
omit [CommGroup B] [CommGroup C]
    [MulDistribMulAction G B] [MulDistribMulAction G C] in
 

theorem herbrand_finite_module_card_eq
    (σ : G) (hgen : ∀ g : G, g ∈ Subgroup.zpowers σ) [Finite A] :
    Nat.card (HerbrandH0 G A) = Nat.card (HerbrandHMinusOne G A σ) := by
  have h0 := card_fixedSubgroup_eq_card_herbrandH0_mul_card_tateNormSubgroup
    (G := G) (A := A)
  have hm := card_normKernelSubgroup_eq_card_herbrandHMinusOne_mul_card_augmentationSubgroup
    (G := G) (A := A) σ
  have hbal := herbrand_finite_module_cardinality_balance
    (G := G) (A := A) σ hgen
  rw [h0, hm] at hbal
  have hfactor :
      Nat.card (HerbrandH0 G A) *
          (Nat.card (tateNormSubgroup G A) * Nat.card (augmentationSubgroup G A σ)) =
        Nat.card (HerbrandHMinusOne G A σ) *
          (Nat.card (tateNormSubgroup G A) * Nat.card (augmentationSubgroup G A σ)) := by
    calc
      Nat.card (HerbrandH0 G A) *
          (Nat.card (tateNormSubgroup G A) * Nat.card (augmentationSubgroup G A σ))
          =
          (Nat.card (HerbrandH0 G A) * Nat.card (tateNormSubgroup G A)) *
            Nat.card (augmentationSubgroup G A σ) := by
            ac_rfl
      _ = (Nat.card (HerbrandHMinusOne G A σ) *
            Nat.card (augmentationSubgroup G A σ)) *
            Nat.card (tateNormSubgroup G A) := hbal
      _ = Nat.card (HerbrandHMinusOne G A σ) *
          (Nat.card (tateNormSubgroup G A) * Nat.card (augmentationSubgroup G A σ)) := by
            ac_rfl
  have hNpos : 0 < Nat.card (tateNormSubgroup G A) :=
    Finite.card_pos (α := tateNormSubgroup G A)
  have hIpos : 0 < Nat.card (augmentationSubgroup G A σ) :=
    Finite.card_pos (α := augmentationSubgroup G A σ)
  exact Nat.mul_right_cancel (Nat.mul_pos hNpos hIpos) hfactor
end Herbrand
end ProfiniteCohomology
end
end CyclicCohomology
end

/- ClassFieldTheory.LocalClassFieldTheory.ClassFormation.CohomologyBridge -/
section
namespace LocalClassFieldTheory
open CyclicCohomology
noncomputable section
open scoped BigOperators
open CyclicCohomology.ProfiniteCohomology.Herbrand
open CategoryTheory
variable (K L : Type) [Field K] [Field L] [Algebra K L]
 

theorem unitsNormLinearMap_toMul_eq_tateNorm
    [Fintype (Gal(L / K))] (x : Lˣ) :
    Additive.toMul (unitsNormLinearMap K L (Additive.ofMul x)) =
      tateNorm (Gal(L / K)) Lˣ x := by
  have hnorm :
      unitsNormLinearMap K L (Additive.ofMul x) =
        ∑ σ : Gal(L / K), (Rep.ofAlgebraAutOnUnits K L).ρ σ (Additive.ofMul x) := by
    exact LinearMap.sum_apply Finset.univ
      (fun σ : Gal(L / K) => (Rep.ofAlgebraAutOnUnits K L).ρ σ)
      (Additive.ofMul x : Additive Lˣ)
  rw [hnorm]
  calc
    (Additive.toMul
        ((∑ σ : Gal(L / K), (Rep.ofAlgebraAutOnUnits K L).ρ σ (Additive.ofMul x)) :
          Additive Lˣ) : Lˣ) =
        ∏ σ : Gal(L / K),
          (Additive.toMul
            ((Rep.ofAlgebraAutOnUnits K L).ρ σ (Additive.ofMul x) : Additive Lˣ) : Lˣ) := by
      simpa only using additive_toMul_finset_sum_units L Finset.univ
        (fun σ : Gal(L / K) => (Rep.ofAlgebraAutOnUnits K L).ρ σ (Additive.ofMul x))
    _ = tateNorm (Gal(L / K)) Lˣ x := by
      rfl
 

def additiveFixedUnitsEquivInvariants :
    Additive (fixedSubgroup (Gal(L / K)) Lˣ) ≃+
      unitsInvariantSubmodule K L where
  toFun x := ⟨Additive.ofMul ((Additive.toMul x : fixedSubgroup (Gal(L / K)) Lˣ) : Lˣ), by
    intro σ
    exact congrArg Additive.ofMul ((Additive.toMul x).property σ)⟩
  invFun x := Additive.ofMul ⟨Additive.toMul (x : Additive Lˣ), by
    intro σ
    exact Additive.ofMul.injective (x.property σ)⟩
  left_inv x := rfl
  right_inv x := rfl
  map_add' x y := rfl
 




private def additiveEquivToQuotientHom
    {A M : Type} [AddCommGroup A] [AddCommGroup M]
    (e : A ≃+ M) (N : Submodule ℤ M) : A →+ M ⧸ N :=
  N.mkQ.toAddMonoidHom.comp e.toAddMonoidHom
 

private def additiveHomToMultiplicativeHom
    {G B : Type} [Group G] [AddCommGroup B]
    (f : Additive G →+ B) : G →* Multiplicative B :=
  AddMonoidHom.toMultiplicativeRight f
 


private abbrev multiplicativeQuotientGroup
    {M : Type} [AddCommGroup M] (N : Submodule ℤ M) :
    Group (Multiplicative (M ⧸ N)) :=
  Multiplicative.group
 

private def kernelOfAdditiveQuotientHom
    {G M : Type} [Group G] [AddCommGroup M]
    (N : Submodule ℤ M) (f : G →* Multiplicative (M ⧸ N)) : Subgroup G :=
  @MonoidHom.ker G inferInstance (Multiplicative (M ⧸ N))
    (multiplicativeQuotientGroup N).toMulOneClass f
 

private def quotientMulEquivOfSurjectiveAdditiveQuotient
    {G M : Type} [CommGroup G] [AddCommGroup M]
    (N : Submodule ℤ M) (S : Subgroup G)
    (f : G →* Multiplicative (M ⧸ N))
    (hker : kernelOfAdditiveQuotientHom N f = S)
    (hsurj : Function.Surjective f) :
    G ⧸ S ≃* Multiplicative (M ⧸ N) := by
  letI : Group (Multiplicative (M ⧸ N)) := multiplicativeQuotientGroup N
  exact
    (QuotientGroup.quotientMulEquivOfEq hker.symm).trans
      (QuotientGroup.quotientKerEquivOfSurjective f hsurj)
 

private def mulEquivMultiplicativeToEquiv
    {G B : Type} [Group G] [AddCommGroup B]
    (e : G ≃* Multiplicative B) : G ≃ B where
  toFun q := Multiplicative.toAdd (e q)
  invFun q := e.symm (Multiplicative.ofAdd q)
  left_inv q := e.left_inv q
  right_inv q := e.right_inv (Multiplicative.ofAdd q)
 
def additiveFixedUnitToInvariantsNormQuotientHom
    [Fintype (Gal(L / K))] :
    Additive (fixedSubgroup (Gal(L / K)) Lˣ) →+
      (unitsInvariantSubmodule K L ⧸ unitsTateH0NormSubmodule K L) :=
  additiveEquivToQuotientHom (additiveFixedUnitsEquivInvariants K L)
    (unitsTateH0NormSubmodule K L)
 
def fixedUnitToInvariantsNormQuotientMonoidHom
    [Fintype (Gal(L / K))] :
    fixedSubgroup (Gal(L / K)) Lˣ →*
      Multiplicative
        (unitsInvariantSubmodule K L ⧸ unitsTateH0NormSubmodule K L) :=
  additiveHomToMultiplicativeHom
    (additiveFixedUnitToInvariantsNormQuotientHom K L)
 

theorem fixedUnitToInvariantsNormQuotientMonoidHom_ker
    [Fintype (Gal(L / K))] :
    kernelOfAdditiveQuotientHom (unitsTateH0NormSubmodule K L)
        (fixedUnitToInvariantsNormQuotientMonoidHom K L) =
      (tateNormSubgroup (Gal(L / K)) Lˣ).subgroupOf
        (fixedSubgroup (Gal(L / K)) Lˣ) := by
  ext x
  constructor
  · intro hx
    have hx0 := congrArg Multiplicative.toAdd hx
    change
      (unitsTateH0NormSubmodule K L).mkQ
        (additiveFixedUnitsEquivInvariants K L (Additive.ofMul x)) = 0 at hx0
    have hxmem :
        additiveFixedUnitsEquivInvariants K L (Additive.ofMul x) ∈
          unitsTateH0NormSubmodule K L :=
      (Submodule.Quotient.mk_eq_zero (unitsTateH0NormSubmodule K L)).1 hx0
    rcases hxmem with ⟨y, hy⟩
    change (x : Lˣ) ∈ tateNormSubgroup (Gal(L / K)) Lˣ
    refine ⟨Additive.toMul y, ?_⟩
    have hy' := congrArg
      (fun z : unitsInvariantSubmodule K L =>
        Additive.toMul (z : Additive Lˣ)) hy
    change Additive.toMul (unitsNormLinearMap K L y) = (x : Lˣ) at hy'
    rw [tateNormHom_apply,
      ← unitsNormLinearMap_toMul_eq_tateNorm K L (Additive.toMul y)]
    simpa using hy'
  · intro hx
    change (x : Lˣ) ∈ tateNormSubgroup (Gal(L / K)) Lˣ at hx
    rcases hx with ⟨y, hy⟩
    apply Multiplicative.toAdd.injective
    change
      (unitsTateH0NormSubmodule K L).mkQ
        (additiveFixedUnitsEquivInvariants K L (Additive.ofMul x)) = 0
    apply (Submodule.Quotient.mk_eq_zero (unitsTateH0NormSubmodule K L)).2
    change additiveFixedUnitsEquivInvariants K L (Additive.ofMul x) ∈
      LinearMap.range (unitsNormToInvariantsLinearMap K L)
    refine ⟨Additive.ofMul y, ?_⟩
    apply Subtype.ext
    apply Additive.toMul.injective
    change Additive.toMul
      (unitsNormLinearMap K L (Additive.ofMul y)) = (x : Lˣ)
    rw [unitsNormLinearMap_toMul_eq_tateNorm K L y]
    exact hy
 
theorem fixedUnitToInvariantsNormQuotientMonoidHom_surjective
    [Fintype (Gal(L / K))] :
    Function.Surjective (fixedUnitToInvariantsNormQuotientMonoidHom K L) := by
  intro q
  rcases Submodule.mkQ_surjective (unitsTateH0NormSubmodule K L)
      (Multiplicative.toAdd q) with ⟨z, hz⟩
  let x : fixedSubgroup (Gal(L / K)) Lˣ :=
    Additive.toMul ((additiveFixedUnitsEquivInvariants K L).symm z)
  refine ⟨x, ?_⟩
  apply Multiplicative.toAdd.injective
  change
    (unitsTateH0NormSubmodule K L).mkQ
      (additiveFixedUnitsEquivInvariants K L (Additive.ofMul x)) =
        Multiplicative.toAdd q
  calc
    _ = (unitsTateH0NormSubmodule K L).mkQ z := by
      apply congrArg (unitsTateH0NormSubmodule K L).mkQ
      change additiveFixedUnitsEquivInvariants K L
        ((additiveFixedUnitsEquivInvariants K L).symm z) = z
      exact (additiveFixedUnitsEquivInvariants K L).apply_symm_apply z
    _ = Multiplicative.toAdd q := hz
 
def herbrandH0MulEquivInvariantsNormQuotient
    [Fintype (Gal(L / K))] :=
  quotientMulEquivOfSurjectiveAdditiveQuotient
    (unitsTateH0NormSubmodule K L)
    ((tateNormSubgroup (Gal(L / K)) Lˣ).subgroupOf
      (fixedSubgroup (Gal(L / K)) Lˣ))
    (fixedUnitToInvariantsNormQuotientMonoidHom K L)
    (fixedUnitToInvariantsNormQuotientMonoidHom_ker K L)
    (fixedUnitToInvariantsNormQuotientMonoidHom_surjective K L)
 

def herbrandH0EquivTateCohomologyZero [Fintype (Gal(L / K))] :
    HerbrandH0 (Gal(L / K)) Lˣ ≃
      tateCohomology (Rep.ofAlgebraAutOnUnits K L) 0 :=
  (mulEquivMultiplicativeToEquiv
      (herbrandH0MulEquivInvariantsNormQuotient K L)).trans
    (tateUnitsH0IsoInvariantsQuotient K L).symm.toLinearEquiv.toEquiv
 

theorem unitsRhoSub_toMul_eq_sigmaMinusOne
    (g : Gal(L / K)) (x : Lˣ) :
    (Additive.toMul ((Rep.ofAlgebraAutOnUnits K L).ρ g (Additive.ofMul x)) : Lˣ) * x⁻¹ =
      sigmaMinusOne (Gal(L / K)) Lˣ g x := by
  rfl
 

def additiveNormKernelEquivUnitsNormKer [Fintype (Gal(L / K))] :
    Additive (normKernelSubgroup (Gal(L / K)) Lˣ) ≃+
      LinearMap.ker (unitsNormLinearMap K L) where
  toFun x := ⟨Additive.ofMul
      ((Additive.toMul x : normKernelSubgroup (Gal(L / K)) Lˣ) : Lˣ), by
    apply Additive.toMul.injective
    change Additive.toMul
      (unitsNormLinearMap K L (Additive.ofMul
        ((Additive.toMul x : normKernelSubgroup (Gal(L / K)) Lˣ) : Lˣ))) = 1
    rw [unitsNormLinearMap_toMul_eq_tateNorm K L
      ((Additive.toMul x : normKernelSubgroup (Gal(L / K)) Lˣ) : Lˣ)]
    exact (Additive.toMul x).property⟩
  invFun x := Additive.ofMul ⟨Additive.toMul (x : Additive Lˣ), by
    change tateNorm (Gal(L / K)) Lˣ (Additive.toMul (x : Additive Lˣ)) = 1
    rw [← unitsNormLinearMap_toMul_eq_tateNorm K L
      (Additive.toMul (x : Additive Lˣ))]
    have hx := congrArg Additive.toMul x.property
    exact hx⟩
  left_inv x := rfl
  right_inv x := rfl
  map_add' x y := rfl
 

def unitsRhoSubToNormKerLinearMap [Fintype (Gal(L / K))]
    (g : Gal(L / K)) :
    Additive Lˣ →ₗ[ℤ] LinearMap.ker (unitsNormLinearMap K L) :=
  ((Rep.ofAlgebraAutOnUnits K L).ρ g - LinearMap.id).codRestrict
    (LinearMap.ker (unitsNormLinearMap K L)) (by
      intro x
      change unitsNormLinearMap K L
        ((Rep.ofAlgebraAutOnUnits K L).ρ g x - x) = 0
      change (Rep.ofAlgebraAutOnUnits K L).norm.hom
        ((Rep.ofAlgebraAutOnUnits K L).ρ g x - x) = 0
      rw [map_sub]
      apply sub_eq_zero.mpr
      change Representation.norm (Rep.ofAlgebraAutOnUnits K L).ρ
        ((Rep.ofAlgebraAutOnUnits K L).ρ g x) =
          Representation.norm (Rep.ofAlgebraAutOnUnits K L).ρ x
      exact Representation.norm_self_apply (Rep.ofAlgebraAutOnUnits K L).ρ g x)
 

def additiveNormKernelToUnitsBoundaryQuotientHom
    [Fintype (Gal(L / K))] (g : Gal(L / K)) :
    Additive (normKernelSubgroup (Gal(L / K)) Lˣ) →+
      LinearMap.ker (unitsNormLinearMap K L) ⧸
        LinearMap.range (unitsRhoSubToNormKerLinearMap K L g) :=
  additiveEquivToQuotientHom
    (additiveNormKernelEquivUnitsNormKer K L)
    (LinearMap.range (unitsRhoSubToNormKerLinearMap K L g))
 
def normKernelToUnitsBoundaryQuotientMonoidHom
    [Fintype (Gal(L / K))] (g : Gal(L / K)) :
    normKernelSubgroup (Gal(L / K)) Lˣ →*
      Multiplicative
        (LinearMap.ker (unitsNormLinearMap K L) ⧸
          LinearMap.range (unitsRhoSubToNormKerLinearMap K L g)) :=
  additiveHomToMultiplicativeHom
    (additiveNormKernelToUnitsBoundaryQuotientHom K L g)
 

theorem normKernelToUnitsBoundaryQuotientMonoidHom_ker
    [Fintype (Gal(L / K))] (g : Gal(L / K)) :
    kernelOfAdditiveQuotientHom
        (LinearMap.range (unitsRhoSubToNormKerLinearMap K L g))
        (normKernelToUnitsBoundaryQuotientMonoidHom K L g) =
      (augmentationSubgroup (Gal(L / K)) Lˣ g).subgroupOf
        (normKernelSubgroup (Gal(L / K)) Lˣ) := by
  ext x
  constructor
  · intro hx
    have hx0 := congrArg Multiplicative.toAdd hx
    change
      (LinearMap.range (unitsRhoSubToNormKerLinearMap K L g)).mkQ
          (additiveNormKernelEquivUnitsNormKer K L (Additive.ofMul x)) =
        0 at hx0
    have hxmem :
        additiveNormKernelEquivUnitsNormKer K L (Additive.ofMul x) ∈
          LinearMap.range (unitsRhoSubToNormKerLinearMap K L g) :=
      (Submodule.Quotient.mk_eq_zero
        (LinearMap.range (unitsRhoSubToNormKerLinearMap K L g))).1 hx0
    rcases hxmem with ⟨y, hy⟩
    change (x : Lˣ) ∈ augmentationSubgroup (Gal(L / K)) Lˣ g
    refine ⟨Additive.toMul y, ?_⟩
    have hy' := congrArg
      (fun z : LinearMap.ker (unitsNormLinearMap K L) =>
        Additive.toMul (z : Additive Lˣ)) hy
    simp only [unitsRhoSubToNormKerLinearMap,
      additiveNormKernelEquivUnitsNormKer] at hy'
    change
      (Additive.toMul ((Rep.ofAlgebraAutOnUnits K L).ρ g y) : Lˣ) *
        (Additive.toMul y)⁻¹ = (x : Lˣ) at hy'
    rw [sigmaMinusOneHom_apply,
      ← unitsRhoSub_toMul_eq_sigmaMinusOne K L g (Additive.toMul y)]
    exact hy'
  · intro hx
    change (x : Lˣ) ∈ augmentationSubgroup (Gal(L / K)) Lˣ g at hx
    rcases hx with ⟨y, hy⟩
    apply Multiplicative.toAdd.injective
    change
      (LinearMap.range (unitsRhoSubToNormKerLinearMap K L g)).mkQ
          (additiveNormKernelEquivUnitsNormKer K L (Additive.ofMul x)) =
        0
    apply (Submodule.Quotient.mk_eq_zero
      (LinearMap.range (unitsRhoSubToNormKerLinearMap K L g))).2
    refine ⟨Additive.ofMul y, ?_⟩
    apply Subtype.ext
    apply Additive.toMul.injective
    simp only [unitsRhoSubToNormKerLinearMap,
      additiveNormKernelEquivUnitsNormKer]
    change
      (Additive.toMul ((Rep.ofAlgebraAutOnUnits K L).ρ g (Additive.ofMul y)) : Lˣ) * y⁻¹ =
        (x : Lˣ)
    rw [unitsRhoSub_toMul_eq_sigmaMinusOne K L g y]
    exact hy
 

theorem normKernelToUnitsBoundaryQuotientMonoidHom_surjective
    [Fintype (Gal(L / K))] (g : Gal(L / K)) :
    Function.Surjective
      (normKernelToUnitsBoundaryQuotientMonoidHom K L g) := by
  intro q
  rcases Submodule.mkQ_surjective
      (LinearMap.range (unitsRhoSubToNormKerLinearMap K L g))
      (Multiplicative.toAdd q) with ⟨z, hz⟩
  let x : normKernelSubgroup (Gal(L / K)) Lˣ :=
    Additive.toMul ((additiveNormKernelEquivUnitsNormKer K L).symm z)
  refine ⟨x, ?_⟩
  apply Multiplicative.toAdd.injective
  change
    (LinearMap.range (unitsRhoSubToNormKerLinearMap K L g)).mkQ
        (additiveNormKernelEquivUnitsNormKer K L (Additive.ofMul x)) =
        Multiplicative.toAdd q
  calc
    _ = (LinearMap.range (unitsRhoSubToNormKerLinearMap K L g)).mkQ z := by
      apply congrArg
        (LinearMap.range (unitsRhoSubToNormKerLinearMap K L g)).mkQ
      change additiveNormKernelEquivUnitsNormKer K L
        ((additiveNormKernelEquivUnitsNormKer K L).symm z) = z
      exact (additiveNormKernelEquivUnitsNormKer K L).apply_symm_apply z
    _ = Multiplicative.toAdd q := hz
 

def herbrandHminusOneMulEquivUnitsBoundaryQuotient
    [Fintype (Gal(L / K))] (g : Gal(L / K)) :
    HerbrandHMinusOne (Gal(L / K)) Lˣ g ≃*
      Multiplicative
        (LinearMap.ker (unitsNormLinearMap K L) ⧸
          LinearMap.range (unitsRhoSubToNormKerLinearMap K L g)) :=
  (HerbrandHMinusOne.equiv (G := Gal(L / K)) (A := Lˣ) g).trans
    (quotientMulEquivOfSurjectiveAdditiveQuotient
      (LinearMap.range (unitsRhoSubToNormKerLinearMap K L g))
      ((augmentationSubgroup (Gal(L / K)) Lˣ g).subgroupOf
        (normKernelSubgroup (Gal(L / K)) Lˣ))
      (normKernelToUnitsBoundaryQuotientMonoidHom K L g)
      (normKernelToUnitsBoundaryQuotientMonoidHom_ker K L g)
      (normKernelToUnitsBoundaryQuotientMonoidHom_surjective K L g))
 
def herbrandHminusOneEquivUnitsBoundaryQuotient
    [Fintype (Gal(L / K))] (g : Gal(L / K)) :
    HerbrandHMinusOne (Gal(L / K)) Lˣ g ≃
      LinearMap.ker (unitsNormLinearMap K L) ⧸
        LinearMap.range (unitsRhoSubToNormKerLinearMap K L g) :=
  mulEquivMultiplicativeToEquiv
    (herbrandHminusOneMulEquivUnitsBoundaryQuotient K L g)
 

noncomputable def unitsTateHminusOneIsoBoundaryQuotient
    [FiniteDimensional K L] (g : Gal(L / K))
    (hg : ∀ x : Gal(L / K), x ∈ Subgroup.zpowers g) :
    tateCohomology (Rep.ofAlgebraAutOnUnits K L) (-1) ≅
      ModuleCat.of ℤ
        (LinearMap.ker (unitsNormLinearMap K L) ⧸
          LinearMap.range (unitsRhoSubToNormKerLinearMap K L g)) := by
  letI : IsCyclic (Gal(L / K)) :=
    CyclicCohomology.isCyclic_of_generator g hg
  letI : CommGroup (Gal(L / K)) := IsCyclic.commGroup
  let T :=
    Rep.FiniteCyclicGroup.subCompNormHom (Rep.ofAlgebraAutOnUnits K L) g
  have hmap :
      T.moduleCatToCycles =
          unitsRhoSubToNormKerLinearMap K L g := by
    ext x
    rfl
  have e := T.moduleCatHomologyIso
  change
    T.homology ≅
      ModuleCat.of ℤ
        (LinearMap.ker (unitsNormLinearMap K L) ⧸
          LinearMap.range
            T.moduleCatToCycles) at e
  rw [hmap] at e
  exact TateCohomology.isoFiniteCyclicNegOne (Rep.ofAlgebraAutOnUnits K L) g hg ≪≫
    e
 

noncomputable def herbrandHminusOneEquivUnitsTateHminusOne
    [FiniteDimensional K L] (g : Gal(L / K))
    (hg : ∀ x : Gal(L / K), x ∈ Subgroup.zpowers g) :
    HerbrandHMinusOne (Gal(L / K)) Lˣ g ≃
      tateCohomology (Rep.ofAlgebraAutOnUnits K L) (-1) :=
  (herbrandHminusOneEquivUnitsBoundaryQuotient K L g).trans
    (unitsTateHminusOneIsoBoundaryQuotient K L g hg).symm.toLinearEquiv.toEquiv
end
end LocalClassFieldTheory
end

/- ClassFieldTheory.LocalClassFieldTheory.ClassFormation.Hilbert90 -/
section
namespace LocalClassFieldTheory
open CyclicCohomology
noncomputable section
 


theorem unitsTateHminusOne_card_eq_one
    (K L : Type) [Field K] [Field L] [Algebra K L] [FiniteDimensional K L]
    (g : Gal(L / K)) (hg : ∀ σ : Gal(L / K), σ ∈ Subgroup.zpowers g) :
    Nat.card (tateCohomology (Rep.ofAlgebraAutOnUnits K L) (-1)) = 1 := by
  calc
    Nat.card (tateCohomology (Rep.ofAlgebraAutOnUnits K L) (-1)) =
        Nat.card (groupCohomology.H1 (Rep.ofAlgebraAutOnUnits K L)) :=
      Nat.card_congr
        (unitsH1IsoTateHminusOne K L g hg).symm.toLinearEquiv.toEquiv
    _ = 1 := Nat.card_unique
end
end LocalClassFieldTheory
end

/- GaloisCohomology.Cyclic.Herbrand.HerbrandLowDegree.TateComparison -/
section
open CategoryTheory
namespace CyclicCohomology.ProfiniteCohomology.Herbrand
noncomputable section
universe u w
private theorem repExact_of_hom_exact {k G : Type u} [CommRing k] [Group G]
    (S : ShortComplex (Rep.{w} k G))
    (h : ∀ b : S.X₂, S.g.hom b = 0 → ∃ a : S.X₁, S.f.hom a = b) :
    S.Exact :=
  (forget₂ (Rep.{w} k G) (ModuleCat.{w} k)).reflects_exact_of_faithful _ <|
    (ShortComplex.moduleCat_exact_iff _).2 h
variable {G A B C : Type}
variable [Group G] [Fintype G] [CommGroup A] [CommGroup B] [CommGroup C]
variable [MulDistribMulAction G A] [MulDistribMulAction G B]
  [MulDistribMulAction G C]
 

def equivariantRepHom (f : A →* B)
    (hf : ∀ (g : G) (a : A), f (g • a) = g • f a) :
    Rep.ofMulDistribMulAction G A ⟶ Rep.ofMulDistribMulAction G B :=
  Rep.ofHom <|
    (MonoidHom.toAdditive f).toIntLinearMap.intertwiningMap_of_isIntertwiningMap
      (Rep.ofMulDistribMulAction G A).ρ
      (Rep.ofMulDistribMulAction G B).ρ <| by
      intro g a
      apply Additive.ofMul.injective
      exact hf g a.toMul
 

def equivariantShortComplex
    (i : A →* B) (j : B →* C)
    (hi : ∀ (g : G) (a : A), i (g • a) = g • i a)
    (hj : ∀ (g : G) (b : B), j (g • b) = g • j b)
    (hker : ∀ b : B, j b = 1 ↔ ∃ a : A, i a = b) :
    ShortComplex (Rep ℤ G) :=
  ShortComplex.mk (equivariantRepHom i hi) (equivariantRepHom j hj) <| by
    apply Rep.hom_ext
    ext a
    change Additive.ofMul (j (i a.toMul)) = 0
    apply Additive.ofMul.injective
    exact (hker (i a.toMul)).2 ⟨a.toMul, rfl⟩
omit [Fintype G] in
theorem equivariantShortComplex_shortExact
    (i : A →* B) (j : B →* C)
    (hi : ∀ (g : G) (a : A), i (g • a) = g • i a)
    (hj : ∀ (g : G) (b : B), j (g • b) = g • j b)
    (hker : ∀ b : B, j b = 1 ↔ ∃ a : A, i a = b)
    (hinj : Function.Injective i) (hsurj : Function.Surjective j) :
    (equivariantShortComplex i j hi hj hker).ShortExact := by
  refine
    { exact := repExact_of_hom_exact _ ?_
      mono_f := (Rep.mono_iff_injective _).2 ?_
      epi_g := (Rep.epi_iff_surjective _).2 ?_ }
  · intro b hb
    change Additive.ofMul (j b.toMul) = 0 at hb
    have hb' : j b.toMul = 1 := Additive.ofMul.injective hb
    rcases (hker b.toMul).1 hb' with ⟨a, ha⟩
    refine ⟨Additive.ofMul a, ?_⟩
    change Additive.ofMul (i a) = b
    apply Additive.toMul.injective
    exact ha
  · intro a a' h
    change Additive.ofMul (i a.toMul) = Additive.ofMul (i a'.toMul) at h
    apply Additive.toMul.injective
    apply hinj
    exact Additive.ofMul.injective h
  · intro c
    rcases hsurj c.toMul with ⟨b, hb⟩
    refine ⟨Additive.ofMul b, ?_⟩
    change Additive.ofMul (j b) = c
    apply Additive.toMul.injective
    exact hb
private theorem repNorm_toMul (a : Additive A) :
    Additive.toMul
        ((Rep.ofMulDistribMulAction G A).ρ.norm a) =
      tateNorm G A a.toMul := by
  unfold Rep.ofMulDistribMulAction
  change Additive.toMul
      ((Representation.ofMulDistribMulAction G A).norm a) =
    ∏ g : G, g • a.toMul
  exact Representation.norm_ofMulDistribMulAction_eq a
private theorem repSigmaMinusOne_toMul
    {G A : Type} [CommGroup G] [CommGroup A]
    [MulDistribMulAction G A] (σ : G) (a : Additive A) :
    Additive.toMul
        ((Rep.toAdditive (M := G) (G := A))
          (((Rep.ofMulDistribMulAction G A).applyAsHom σ -
            𝟙 (Rep.ofMulDistribMulAction G A)).hom a)) =
      sigmaMinusOne G A σ a.toMul := by
  unfold Rep.toAdditive
  unfold Rep.ofMulDistribMulAction
  rw [Rep.sub_hom]
  rw [show
    (Rep.Hom.hom
        ((Rep.of (Representation.ofMulDistribMulAction G A)).applyAsHom σ) -
      Rep.Hom.hom
        (𝟙 (Rep.of (Representation.ofMulDistribMulAction G A)))) a =
        Rep.Hom.hom
            ((Rep.of (Representation.ofMulDistribMulAction G A)).applyAsHom σ) a -
          Rep.Hom.hom
            (𝟙 (Rep.of (Representation.ofMulDistribMulAction G A))) a by
    rfl]
  rw [Rep.applyAsHom_apply]
  rw [show
    Rep.Hom.hom
        (𝟙 (Rep.of (Representation.ofMulDistribMulAction G A))) a = a by
    rfl]
  unfold sigmaMinusOne
  rw [show
    ((Rep.of (Representation.ofMulDistribMulAction G A)).ρ σ) a =
      Additive.ofMul (σ • a.toMul) by
    rfl]
  change Additive.toMul
      (Additive.ofMul (σ • a.toMul) - a) =
    σ • a.toMul * (a.toMul)⁻¹
  rw [toMul_sub]
  exact div_eq_mul_inv _ _
private def fixedCyclesAddEquiv :
    LinearMap.ker
        (groupCohomology.d₀₁ (Rep.ofMulDistribMulAction G A)).hom ≃+
      Additive (fixedSubgroup G A) where
  toFun x :=
    Additive.ofMul
      ⟨x.1.toMul, by
        have hx : x.1 ∈ (Rep.ofMulDistribMulAction G A).ρ.invariants := by
          rw [← groupCohomology.d₀₁_ker_eq_invariants]
          exact x.2
        intro g
        apply Additive.ofMul.injective
        exact hx g⟩
  invFun x :=
    ⟨Additive.ofMul x.toMul.1, by
      rw [groupCohomology.d₀₁_ker_eq_invariants]
      intro g
      apply Additive.ofMul.injective
      exact x.toMul.2 g⟩
  left_inv x := by
    apply Subtype.ext
    rfl
  right_inv x := by
    apply Additive.ofMul.injective
    apply Subtype.ext
    rfl
  map_add' x y := by
    apply Additive.ofMul.injective
    apply Subtype.ext
    rfl
 

noncomputable def tateH0IsoHerbrandH0 :
    tateCohomology (Rep.ofMulDistribMulAction G A) 0 ≅
      ModuleCat.of ℤ (Additive (HerbrandH0 G A)) := by
  let M := Rep.ofMulDistribMulAction G A
  let S : ShortComplex (ModuleCat ℤ) :=
    ShortComplex.mk M.norm.toModuleCatHom (groupCohomology.d₀₁ M)
      (Rep.norm_comp_d_eq_zero M)
  let eKOwner :
      S.moduleCatLeftHomologyData.K ≅
        ModuleCat.of ℤ
          (LinearMap.ker
            (groupCohomology.d₀₁ (Rep.ofMulDistribMulAction G A)).hom) :=
    eqToIso (by rfl)
  let eK :=
    (eKOwner ≪≫
      ((fixedCyclesAddEquiv (G := G) (A := A)).toIntLinearEquiv
        (modM := inferInstance) (modM₂ := inferInstance)).toModuleIso).toLinearEquiv
  let q : Additive (fixedSubgroup G A) →+ Additive (HerbrandH0 G A) :=
    MonoidHom.toAdditive (HerbrandH0.mk (G := G) (A := A))
  have hboundary :
      (LinearMap.range S.moduleCatToCycles).map eK.toLinearMap =
        q.ker.toIntSubmodule := by
    ext x
    constructor
    · rintro ⟨y, ⟨a, ha⟩, rfl⟩
      subst y
      change Additive A at a
      change q (eK (S.moduleCatToCycles a)) = 0
      apply Additive.ofMul.injective
      change HerbrandH0.mk _ = 1
      apply (HerbrandH0.mk_eq_one_iff _).2
      refine ⟨a.toMul, ?_⟩
      dsimp [eK, fixedCyclesAddEquiv, S, M]
      exact (repNorm_toMul (G := G) (A := A) a).symm
    · intro hx
      change q x = 0 at hx
      have hx' : HerbrandH0.mk x.toMul = 1 := by
        apply Additive.ofMul.injective
        exact hx
      rcases (HerbrandH0.mk_eq_one_iff x.toMul).1 hx' with ⟨a, ha⟩
      refine ⟨eK.symm x, ?_, eK.apply_symm_apply x⟩
      refine ⟨Additive.ofMul a, ?_⟩
      apply eK.injective
      rw [eK.apply_symm_apply]
      apply Additive.toMul.injective
      apply Subtype.ext
      have hnorm :
          Additive.toMul
              ((Representation.ofMulDistribMulAction G A).norm
                (Additive.ofMul a)) =
            x.toMul.1 :=
        (Representation.norm_ofMulDistribMulAction_eq
          (G := G) (M := A) (Additive.ofMul a)).trans <| by
            rw [show Additive.toMul (Additive.ofMul a) = a by rfl]
            simpa only [tateNormHom_apply, tateNorm] using ha
      dsimp [eK, fixedCyclesAddEquiv, S, M]
      unfold Rep.ofMulDistribMulAction
      exact hnorm
  let eQ :=
    (Submodule.Quotient.equiv (LinearMap.range S.moduleCatToCycles)
      q.ker.toIntSubmodule eK hboundary).trans
      ((QuotientAddGroup.quotientKerEquivOfSurjective q
        (HerbrandH0.mk_surjective (G := G) (A := A))).toIntLinearEquiv
          (modM₂ := inferInstance))
  exact TateCohomology.isoZeroBoundary M ≪≫
    S.moduleCatHomologyIso ≪≫ eQ.toModuleIso
private def normKernelCyclesAddEquiv :
    LinearMap.ker
        (Rep.ofMulDistribMulAction G A).norm.toModuleCatHom.hom ≃+
      Additive (normKernelSubgroup G A) where
  toFun x :=
    let a : Additive A := x.1
    Additive.ofMul
      ⟨a.toMul, by
        change tateNorm G A a.toMul = 1
        have hx := x.2
        change (Rep.ofMulDistribMulAction G A).ρ.norm a = 0 at hx
        exact (repNorm_toMul (G := G) (A := A) a).symm.trans <| by
          rw [hx]
          rfl⟩
  invFun x :=
    let a : Additive A := Additive.ofMul x.toMul.1
    ⟨a, by
      have hx0 := x.toMul.2
      change tateNorm G A x.toMul.1 = 1 at hx0
      have hx : tateNorm G A a.toMul = 1 := hx0
      change (Rep.ofMulDistribMulAction G A).ρ.norm a = 0
      unfold Rep.ofMulDistribMulAction
      apply Additive.toMul.injective
      change Additive.toMul
          ((Representation.ofMulDistribMulAction G A).norm a) = (1 : A)
      exact
        (Representation.norm_ofMulDistribMulAction_eq
          (G := G) (M := A) a).trans <| by
            simpa [tateNorm] using hx⟩
  left_inv x := by
    apply Subtype.ext
    rfl
  right_inv x := by
    apply Additive.ofMul.injective
    apply Subtype.ext
    rfl
  map_add' x y := by
    apply Additive.ofMul.injective
    apply Subtype.ext
    rfl
private noncomputable def tateHMinusOneIsoHerbrandHMinusOne_of_commGroup
    {G A : Type} [CommGroup G] [Fintype G] [CommGroup A]
    [MulDistribMulAction G A]
    (σ : G) (hgen : ∀ g : G, g ∈ Subgroup.zpowers σ) :
    tateCohomology (Rep.ofMulDistribMulAction G A) (-1) ≅
      ModuleCat.of ℤ (Additive (HerbrandHMinusOne G A σ)) := by
  let M := Rep.ofMulDistribMulAction G A
  let S := Rep.FiniteCyclicGroup.subCompNormHom M σ
  let eKOwner :
      S.moduleCatLeftHomologyData.K ≅
        ModuleCat.of ℤ
          (LinearMap.ker
            (Rep.ofMulDistribMulAction G A).norm.toModuleCatHom.hom) :=
    eqToIso (by rfl)
  let eK :=
    (eKOwner ≪≫
      ((normKernelCyclesAddEquiv (G := G) (A := A)).toIntLinearEquiv
        (modM := inferInstance) (modM₂ := inferInstance)).toModuleIso).toLinearEquiv
  let q : Additive (normKernelSubgroup G A) →+
      Additive (HerbrandHMinusOne G A σ) :=
    MonoidHom.toAdditive (HerbrandHMinusOne.mk (G := G) (A := A) σ)
  have hboundary :
      (LinearMap.range S.moduleCatToCycles).map eK.toLinearMap =
        q.ker.toIntSubmodule := by
    ext x
    constructor
    · rintro ⟨y, ⟨a, ha⟩, rfl⟩
      subst y
      change Additive A at a
      change q (eK (S.moduleCatToCycles a)) = 0
      apply Additive.ofMul.injective
      change HerbrandHMinusOne.mk σ _ = 1
      apply (HerbrandHMinusOne.mk_eq_one_iff σ _).2
      refine ⟨a.toMul, ?_⟩
      dsimp [eK, normKernelCyclesAddEquiv, S, M]
      exact (repSigmaMinusOne_toMul
        (G := G) (A := A) σ a).symm
    · intro hx
      change q x = 0 at hx
      have hx' : HerbrandHMinusOne.mk σ x.toMul = 1 := by
        apply Additive.ofMul.injective
        exact hx
      rcases (HerbrandHMinusOne.mk_eq_one_iff σ x.toMul).1 hx' with ⟨a, ha⟩
      refine ⟨eK.symm x, ?_, eK.apply_symm_apply x⟩
      refine ⟨Additive.ofMul a, ?_⟩
      apply eK.injective
      rw [eK.apply_symm_apply]
      apply Additive.toMul.injective
      apply Subtype.ext
      dsimp [eK, normKernelCyclesAddEquiv, S, M]
      have hσ := repSigmaMinusOne_toMul
        (G := G) (A := A) σ (Additive.ofMul a)
      rw [show Additive.toMul (Additive.ofMul a) = a by rfl] at hσ
      exact hσ.trans ha
  let eQ :=
    (Submodule.Quotient.equiv (LinearMap.range S.moduleCatToCycles)
      q.ker.toIntSubmodule eK hboundary).trans
      ((QuotientAddGroup.quotientKerEquivOfSurjective q
        (HerbrandHMinusOne.mk_surjective (G := G) (A := A) σ)).toIntLinearEquiv
          (modM₂ := inferInstance))
  exact TateCohomology.isoFiniteCyclicNegOne M σ hgen ≪≫
    S.moduleCatHomologyIso ≪≫ eQ.toModuleIso
 

noncomputable def tateHMinusOneIsoHerbrandHMinusOne
    (σ : G) (hgen : ∀ g : G, g ∈ Subgroup.zpowers σ) :
    tateCohomology (Rep.ofMulDistribMulAction G A) (-1) ≅
      ModuleCat.of ℤ (Additive (HerbrandHMinusOne G A σ)) := by
  letI : IsCyclic G := ⟨⟨σ, hgen⟩⟩
  letI : CommGroup G := IsCyclic.commGroup
  exact tateHMinusOneIsoHerbrandHMinusOne_of_commGroup σ hgen
end
end CyclicCohomology.ProfiniteCohomology.Herbrand
end

/- GaloisCohomology.Cyclic.Herbrand.HerbrandLowDegree.Cardinality -/
section
namespace CyclicCohomology
noncomputable section
namespace ProfiniteCohomology
namespace Herbrand
open CategoryTheory
variable {G A B C : Type}
section
variable [CommGroup G] [Fintype G]
variable [CommGroup A] [CommGroup B] [CommGroup C]
variable [MulDistribMulAction G A] [MulDistribMulAction G B]
  [MulDistribMulAction G C]
private noncomputable def subCompNormMap
    (σ : G) (f : A →* B)
    (hf : ∀ (g : G) (a : A), f (g • a) = g • f a) :
    Rep.FiniteCyclicGroup.subCompNormHom
        (Rep.ofMulDistribMulAction G A) σ ⟶
      Rep.FiniteCyclicGroup.subCompNormHom
        (Rep.ofMulDistribMulAction G B) σ where
  τ₁ := (equivariantRepHom f hf).toModuleCatHom
  τ₂ := (equivariantRepHom f hf).toModuleCatHom
  τ₃ := (equivariantRepHom f hf).toModuleCatHom
  comm₁₂ := by
    ext a
    change Additive A at a
    change
      Additive.ofMul ((σ • f a.toMul) / f a.toMul) =
        Additive.ofMul (f ((σ • a.toMul) / a.toMul))
    exact congrArg Additive.ofMul (by rw [map_div, hf])
  comm₂₃ := by
    ext a
    apply Additive.ofMul.injective
    simp [Rep.FiniteCyclicGroup.subCompNormHom, Rep.norm,
      Representation.norm, Rep.hom_comm_apply]
private noncomputable def periodicChainMap
    (σ : G) (f : A →* B)
    (hf : ∀ (g : G) (a : A), f (g • a) = g • f a) :
    Rep.FiniteCyclicGroup.moduleCatChainComplex
        (Rep.ofMulDistribMulAction G A) σ ⟶
      Rep.FiniteCyclicGroup.moduleCatChainComplex
        (Rep.ofMulDistribMulAction G B) σ where
  f _ := (equivariantRepHom f hf).toModuleCatHom
  comm' := by
    rintro i j ⟨rfl⟩
    by_cases hj : Even (j + 1)
    · simp [Rep.FiniteCyclicGroup.moduleCatChainComplex,
        HomologicalComplex.alternatingConst, hj]
      exact (subCompNormMap σ f hf).comm₂₃
    · simp [Rep.FiniteCyclicGroup.moduleCatChainComplex,
        HomologicalComplex.alternatingConst, hj]
      exact (subCompNormMap σ f hf).comm₁₂
private noncomputable def periodicShortComplex
    (σ : G)
    (i : A →* B) (j : B →* C)
    (hi : ∀ (g : G) (a : A), i (g • a) = g • i a)
    (hj : ∀ (g : G) (b : B), j (g • b) = g • j b)
    (hker : ∀ b : B, j b = 1 ↔ ∃ a : A, i a = b) :
    ShortComplex (ChainComplex (ModuleCat ℤ) ℕ) :=
  ShortComplex.mk (periodicChainMap σ i hi) (periodicChainMap σ j hj) <| by
    apply HomologicalComplex.hom_ext
    intro n
    ext a
    change Additive.ofMul (j (i a.toMul)) = 0
    apply Additive.ofMul.injective
    exact (hker (i a.toMul)).2 ⟨a.toMul, rfl⟩
private theorem periodicShortComplex_shortExact
    (σ : G)
    (i : A →* B) (j : B →* C)
    (hi : ∀ (g : G) (a : A), i (g • a) = g • i a)
    (hj : ∀ (g : G) (b : B), j (g • b) = g • j b)
    (hker : ∀ b : B, j b = 1 ↔ ∃ a : A, i a = b)
    (hinj : Function.Injective i) (hsurj : Function.Surjective j) :
    (periodicShortComplex σ i j hi hj hker).ShortExact := by
  rw [HomologicalComplex.shortExact_iff_degreewise_shortExact]
  intro n
  refine
    { exact := ?_
      mono_f := (ModuleCat.mono_iff_injective _).2 ?_
      epi_g := (ModuleCat.epi_iff_surjective _).2 ?_ }
  · apply (ShortComplex.moduleCat_exact_iff _).2
    intro b hb
    change Additive.ofMul (j b.toMul) = 0 at hb
    have hb' : j b.toMul = 1 := Additive.ofMul.injective hb
    rcases (hker b.toMul).1 hb' with ⟨a, ha⟩
    refine ⟨Additive.ofMul a, ?_⟩
    apply Additive.toMul.injective
    exact ha
  · intro a a' ha
    apply Additive.toMul.injective
    apply hinj
    exact Additive.ofMul.injective ha
  · intro c
    rcases hsurj c.toMul with ⟨b, hb⟩
    refine ⟨Additive.ofMul b, ?_⟩
    apply Additive.toMul.injective
    exact hb
private noncomputable def periodicScIsoEven
    {R H : Type} [CommRing R] [CommGroup H] [Fintype H]
    (M : Rep R H) (τ : H)
    {n : ℕ} [h₀ : NeZero n] (hn : Even n) :
    (Rep.FiniteCyclicGroup.moduleCatChainComplex M τ).sc n ≅
      Rep.FiniteCyclicGroup.subCompNormHom M τ :=
  HomologicalComplex.alternatingConstScIsoEven
    (ModuleCat.of R M.V)
    (by ext; simp [Rep.sub_hom, Rep.applyAsHom, Rep.norm])
    (by ext; simp [Rep.sub_hom, Rep.applyAsHom, Rep.norm])
    (fun _ _ => ComplexShape.down_nat_odd_add)
    (by simp)
    (by
      induction n generalizing h₀ with
      | zero => exact (NeZero.ne 0 rfl).elim
      | succ n _ => simp)
    hn
private noncomputable def periodicScIsoOdd
    {R H : Type} [CommRing R] [CommGroup H] [Fintype H]
    (M : Rep R H) (τ : H) {n : ℕ} (hn : Odd n) :
    (Rep.FiniteCyclicGroup.moduleCatChainComplex M τ).sc n ≅
      Rep.FiniteCyclicGroup.normHomCompSub M τ :=
  HomologicalComplex.alternatingConstScIsoOdd
    (ModuleCat.of R M.V)
    (by ext; simp [Rep.sub_hom, Rep.applyAsHom, Rep.norm])
    (by ext; simp [Rep.sub_hom, Rep.applyAsHom, Rep.norm])
    (fun _ _ => ComplexShape.down_nat_odd_add)
    (by simp)
    (by rcases hn with ⟨m, rfl⟩; simp)
    hn
private noncomputable def periodicHomologyIsoEven
    {R H : Type} [CommRing R] [CommGroup H] [Fintype H]
    (M : Rep R H) (τ : H)
    {n : ℕ} [NeZero n] (hn : Even n) :
    (Rep.FiniteCyclicGroup.moduleCatChainComplex M τ).homology n ≅
      (Rep.FiniteCyclicGroup.subCompNormHom M τ).homology :=
  ShortComplex.homologyMapIso (periodicScIsoEven M τ hn)
private noncomputable def periodicHomologyIsoOdd
    {R H : Type} [CommRing R] [CommGroup H] [Fintype H]
    (M : Rep R H) (τ : H) {n : ℕ} (hn : Odd n) :
    (Rep.FiniteCyclicGroup.moduleCatChainComplex M τ).homology n ≅
      (Rep.FiniteCyclicGroup.normHomCompSub M τ).homology :=
  ShortComplex.homologyMapIso (periodicScIsoOdd M τ hn)
private noncomputable def periodicEvenHerbrandHMinusOneIso
    (σ : G) (hgen : ∀ g : G, g ∈ Subgroup.zpowers σ)
    {n : ℕ} [NeZero n] (hn : Even n) :
    (Rep.FiniteCyclicGroup.moduleCatChainComplex
        (Rep.ofMulDistribMulAction G A) σ).homology n ≅
      ModuleCat.of ℤ (Additive (HerbrandHMinusOne G A σ)) :=
  periodicHomologyIsoEven (Rep.ofMulDistribMulAction G A) σ hn ≪≫
    (TateCohomology.isoFiniteCyclicNegOne
      (Rep.ofMulDistribMulAction G A) σ hgen).symm ≪≫
    tateHMinusOneIsoHerbrandHMinusOne σ hgen
private noncomputable def periodicOddHerbrandHZeroIso
    (σ : G) (hgen : ∀ g : G, g ∈ Subgroup.zpowers σ)
    {n : ℕ} (hn : Odd n) :
    (Rep.FiniteCyclicGroup.moduleCatChainComplex
        (Rep.ofMulDistribMulAction G A) σ).homology n ≅
      ModuleCat.of ℤ (Additive (HerbrandH0 G A)) :=
  periodicHomologyIsoOdd (Rep.ofMulDistribMulAction G A) σ hn ≪≫
    (TateCohomology.isoFiniteCyclicZero
      (Rep.ofMulDistribMulAction G A) σ hgen).symm ≪≫
    tateH0IsoHerbrandH0
private theorem periodicScIsoEven_naturality
    (σ : G) {n : ℕ} [NeZero n] (hn : Even n)
    (f : A →* B)
    (hf : ∀ (g : G) (a : A), f (g • a) = g • f a) :
    CategoryStruct.comp (ShortComplex.homologyMap
          (periodicScIsoEven
            (Rep.ofMulDistribMulAction G A) σ hn).inv)
      (CategoryStruct.comp (ShortComplex.homologyMap
          ((HomologicalComplex.shortComplexFunctor
            (ModuleCat ℤ) (ComplexShape.down ℕ) n).map
              (periodicChainMap σ f hf))) (ShortComplex.homologyMap
          (periodicScIsoEven
            (Rep.ofMulDistribMulAction G B) σ hn).hom)) =
      ShortComplex.homologyMap (subCompNormMap σ f hf) := by
  rw [← ShortComplex.homologyMap_comp, ← ShortComplex.homologyMap_comp]
  congr 1
private theorem periodicHomologyIsoEven_naturality
    (σ : G) {n : ℕ} [NeZero n] (hn : Even n)
    (f : A →* B)
    (hf : ∀ (g : G) (a : A), f (g • a) = g • f a) :
    CategoryStruct.comp ((periodicHomologyIsoEven
      (Rep.ofMulDistribMulAction G A) σ hn).inv)
      (CategoryStruct.comp (HomologicalComplex.homologyMap (periodicChainMap σ f hf) n) ((periodicHomologyIsoEven
          (Rep.ofMulDistribMulAction G B) σ hn).hom)) =
      ShortComplex.homologyMap (subCompNormMap σ f hf) :=
  periodicScIsoEven_naturality σ hn f hf
 

noncomputable def moduleCatRangeEquivOfConjugate
    {X Y X' Y' : ModuleCat.{0} ℤ}
    (f : X ⟶ Y) (g : X' ⟶ Y')
    (eX : X ≅ X') (eY : Y ≅ Y')
    (h : CategoryStruct.comp eX.inv (CategoryStruct.comp f eY.hom) = g) :
    MonoidHom.range f.hom.toAddMonoidHom.toMultiplicative ≃
      MonoidHom.range g.hom.toAddMonoidHom.toMultiplicative := by
  have hnat : CategoryStruct.comp f eY.hom = CategoryStruct.comp eX.hom g := by
    rw [← cancel_epi eX.inv]
    simpa only [Category.assoc, eX.inv_hom_id_assoc] using h
  have hinv : CategoryStruct.comp eX.inv f = CategoryStruct.comp g eY.inv := by
    rw [← cancel_mono eY.hom]
    simpa only [Category.assoc, eY.inv_hom_id, Category.comp_id] using h
  refine
    { toFun := fun y => ⟨Multiplicative.ofAdd (eY.hom y.1.toAdd), ?_⟩
      invFun := fun y => ⟨Multiplicative.ofAdd (eY.inv y.1.toAdd), ?_⟩
      left_inv := ?_
      right_inv := ?_ }
  · rcases y.2 with ⟨x, hx⟩
    refine ⟨Multiplicative.ofAdd (eX.hom x.toAdd), ?_⟩
    apply Multiplicative.toAdd.injective
    change g (eX.hom x.toAdd) = eY.hom y.1.toAdd
    have hx' : f x.toAdd = y.1.toAdd :=
      congrArg Multiplicative.toAdd hx
    rw [← hx']
    exact (congrArg (fun k : X ⟶ Y' => k x.toAdd) hnat).symm
  · rcases y.2 with ⟨x, hx⟩
    refine ⟨Multiplicative.ofAdd (eX.inv x.toAdd), ?_⟩
    apply Multiplicative.toAdd.injective
    change f (eX.inv x.toAdd) = eY.inv y.1.toAdd
    have hx' : g x.toAdd = y.1.toAdd :=
      congrArg Multiplicative.toAdd hx
    rw [← hx']
    exact congrArg (fun k : X' ⟶ Y => k x.toAdd) hinv
  · intro y
    apply Subtype.ext
    apply Multiplicative.toAdd.injective
    exact eY.hom_inv_id_apply y.1.toAdd
  · intro y
    apply Subtype.ext
    apply Multiplicative.toAdd.injective
    exact eY.inv_hom_id_apply y.1.toAdd
 

theorem moduleCatRangeCard_eq_of_conjugate
    {X Y X' Y' : ModuleCat.{0} ℤ}
    (f : X ⟶ Y) (g : X' ⟶ Y')
    (eX : X ≅ X') (eY : Y ≅ Y')
    (h : CategoryStruct.comp eX.inv (CategoryStruct.comp f eY.hom) = g) :
    Nat.card (MonoidHom.range
        f.hom.toAddMonoidHom.toMultiplicative) =
      Nat.card (MonoidHom.range
        g.hom.toAddMonoidHom.toMultiplicative) :=
  Nat.card_congr (moduleCatRangeEquivOfConjugate f g eX eY h)
 

theorem mulExact_of_moduleCat_exact
    {X Y Z : ModuleCat.{0} ℤ} (f : X ⟶ Y) (g : Y ⟶ Z)
    (hexact : Function.Exact f g) :
    Function.MulExact
      f.hom.toAddMonoidHom.toMultiplicative
      g.hom.toAddMonoidHom.toMultiplicative := by
  intro y
  constructor
  · intro hy
    change g y.toAdd = 0 at hy
    rcases (hexact y.toAdd).1 hy with ⟨x, hx⟩
    refine ⟨Multiplicative.ofAdd x, ?_⟩
    apply Multiplicative.toAdd.injective
    exact hx
  · rintro ⟨x, rfl⟩
    change g (f x.toAdd) = 0
    exact (hexact (f x.toAdd)).2 ⟨x.toAdd, rfl⟩
 


theorem moduleCat_card_eq_card_range_mul_card_range_of_exact
    {X Y Z : ModuleCat.{0} ℤ} (f : X ⟶ Y) (g : Y ⟶ Z)
    (hexact : Function.Exact f g) [Finite Y] :
    Nat.card Y =
      Nat.card (MonoidHom.range
        f.hom.toAddMonoidHom.toMultiplicative) *
      Nat.card (MonoidHom.range
        g.hom.toAddMonoidHom.toMultiplicative) := by
  exact
    monoidHom_card_eq_card_range_mul_card_range_of_exact
      f.hom.toAddMonoidHom.toMultiplicative
      g.hom.toAddMonoidHom.toMultiplicative
      (mulExact_of_moduleCat_exact f g hexact).monoidHom_ker_eq.symm
 

theorem finite_source_of_moduleIso
    {X Y : ModuleCat.{0} ℤ} (e : X ≅ Y) [Finite Y] :
    Finite X := by
  let e' : X ≃ Y := ((forget (ModuleCat ℤ)).mapIso e).toEquiv
  exact Finite.of_injective e' e'.injective
 

theorem finite_target_of_moduleIso
    {X Y : ModuleCat.{0} ℤ} (e : X ≅ Y) [Finite X] :
    Finite Y := by
  let e' : Y ≃ X := ((forget (ModuleCat ℤ)).mapIso e.symm).toEquiv
  exact Finite.of_injective e' e'.injective
 

theorem moduleCat_card_eq_of_iso
    {X : ModuleCat.{0} ℤ} {T : Type} [CommGroup T]
    (e : X ≅ ModuleCat.of ℤ (Additive T)) :
    Nat.card X = Nat.card T :=
  Nat.card_congr ((forget (ModuleCat ℤ)).mapIso e).toEquiv
end
 

theorem herbrand_exact_cardinality_identity
    [Group G] [Fintype G]
    [CommGroup A] [CommGroup B] [CommGroup C]
    [MulDistribMulAction G A] [MulDistribMulAction G B]
    [MulDistribMulAction G C]
    (i : A →* B) (j : B →* C)
    (hi : ∀ (g : G) (a : A), i (g • a) = g • i a)
    (hj : ∀ (g : G) (b : B), j (g • b) = g • j b)
    (hker : ∀ b : B, j b = 1 ↔ ∃ a : A, i a = b)
    (hinj : Function.Injective i)
    (hsurj : ∀ c : C, ∃ b : B, j b = c)
    (σ : G) (hgen : ∀ g : G, g ∈ Subgroup.zpowers σ)
    [Finite (HerbrandH0 G A)] [Finite (HerbrandHMinusOne G A σ)]
    [Finite (HerbrandH0 G B)] [Finite (HerbrandHMinusOne G B σ)]
    [Finite (HerbrandH0 G C)] [Finite (HerbrandHMinusOne G C σ)] :
    Nat.card (HerbrandH0 G B) *
        Nat.card (HerbrandHMinusOne G A σ) *
        Nat.card (HerbrandHMinusOne G C σ) =
      Nat.card (HerbrandH0 G A) *
        Nat.card (HerbrandH0 G C) *
        Nat.card (HerbrandHMinusOne G B σ) := by
  let : IsCyclic G := ⟨⟨σ, hgen⟩⟩
  let : CommGroup G := IsCyclic.commGroup
  let S := periodicShortComplex σ i j hi hj hker
  have hS : S.ShortExact :=
    periodicShortComplex_shortExact σ i j hi hj hker hinj hsurj
  let eA4 : S.X₁.homology 4 ≅
      ModuleCat.of ℤ (Additive (HerbrandHMinusOne G A σ)) := by
    exact periodicEvenHerbrandHMinusOneIso
      (G := G) (A := A) (n := 4) σ hgen (⟨2, rfl⟩ : Even 4)
  let eB4 : S.X₂.homology 4 ≅
      ModuleCat.of ℤ (Additive (HerbrandHMinusOne G B σ)) := by
    exact periodicEvenHerbrandHMinusOneIso
      (G := G) (A := B) (n := 4) σ hgen (⟨2, rfl⟩ : Even 4)
  let eC4 : S.X₃.homology 4 ≅
      ModuleCat.of ℤ (Additive (HerbrandHMinusOne G C σ)) := by
    exact periodicEvenHerbrandHMinusOneIso
      (G := G) (A := C) (n := 4) σ hgen (⟨2, rfl⟩ : Even 4)
  let eA3 : S.X₁.homology 3 ≅
      ModuleCat.of ℤ (Additive (HerbrandH0 G A)) := by
    exact periodicOddHerbrandHZeroIso
      (G := G) (A := A) (n := 3) σ hgen (⟨1, rfl⟩ : Odd 3)
  let eB3 : S.X₂.homology 3 ≅
      ModuleCat.of ℤ (Additive (HerbrandH0 G B)) := by
    exact periodicOddHerbrandHZeroIso
      (G := G) (A := B) (n := 3) σ hgen (⟨1, rfl⟩ : Odd 3)
  let eC3 : S.X₃.homology 3 ≅
      ModuleCat.of ℤ (Additive (HerbrandH0 G C)) := by
    exact periodicOddHerbrandHZeroIso
      (G := G) (A := C) (n := 3) σ hgen (⟨1, rfl⟩ : Odd 3)
  let eA2 : S.X₁.homology 2 ≅
      ModuleCat.of ℤ (Additive (HerbrandHMinusOne G A σ)) := by
    exact periodicEvenHerbrandHMinusOneIso
      (G := G) (A := A) (n := 2) σ hgen (by simp : Even 2)
  let eB2 : S.X₂.homology 2 ≅
      ModuleCat.of ℤ (Additive (HerbrandHMinusOne G B σ)) := by
    exact periodicEvenHerbrandHMinusOneIso
      (G := G) (A := B) (n := 2) σ hgen (by simp : Even 2)
  let pA4 : S.X₁.homology 4 ≅
      (Rep.FiniteCyclicGroup.subCompNormHom
        (Rep.ofMulDistribMulAction G A) σ).homology := by
    exact periodicHomologyIsoEven
      (Rep.ofMulDistribMulAction G A) σ (⟨2, rfl⟩ : Even 4)
  let pB4 : S.X₂.homology 4 ≅
      (Rep.FiniteCyclicGroup.subCompNormHom
        (Rep.ofMulDistribMulAction G B) σ).homology := by
    exact periodicHomologyIsoEven
      (Rep.ofMulDistribMulAction G B) σ (⟨2, rfl⟩ : Even 4)
  let pA2 : S.X₁.homology 2 ≅
      (Rep.FiniteCyclicGroup.subCompNormHom
        (Rep.ofMulDistribMulAction G A) σ).homology := by
    exact periodicHomologyIsoEven
      (Rep.ofMulDistribMulAction G A) σ (by simp : Even 2)
  let pB2 : S.X₂.homology 2 ≅
      (Rep.FiniteCyclicGroup.subCompNormHom
        (Rep.ofMulDistribMulAction G B) σ).homology := by
    exact periodicHomologyIsoEven
      (Rep.ofMulDistribMulAction G B) σ (by simp : Even 2)
  let : Finite (S.X₁.homology 4) := finite_source_of_moduleIso eA4
  let : Finite (S.X₂.homology 4) := finite_source_of_moduleIso eB4
  let : Finite (S.X₃.homology 4) := finite_source_of_moduleIso eC4
  let : Finite (S.X₁.homology 3) := finite_source_of_moduleIso eA3
  let : Finite (S.X₂.homology 3) := finite_source_of_moduleIso eB3
  let : Finite (S.X₃.homology 3) := finite_source_of_moduleIso eC3
  let : Finite (S.X₁.homology 2) := finite_source_of_moduleIso eA2
  let f4 := HomologicalComplex.homologyMap S.f 4
  let g4 := HomologicalComplex.homologyMap S.g 4
  let δ43 := hS.δ 4 3 (by simp)
  let f3 := HomologicalComplex.homologyMap S.f 3
  let g3 := HomologicalComplex.homologyMap S.g 3
  let δ32 := hS.δ 3 2 (by simp)
  let f2 := HomologicalComplex.homologyMap S.f 2
  have hexactB4 : Function.Exact f4 g4 :=
    (ShortComplex.ShortExact.moduleCat_exact_iff_function_exact _).1
      (hS.homology_exact₂ 4)
  have hexactC4 : Function.Exact g4 δ43 :=
    (ShortComplex.ShortExact.moduleCat_exact_iff_function_exact _).1
      (hS.homology_exact₃ 4 3 (by simp))
  have hexactA3 : Function.Exact δ43 f3 :=
    (ShortComplex.ShortExact.moduleCat_exact_iff_function_exact _).1
      (hS.homology_exact₁ 4 3 (by simp))
  have hexactB3 : Function.Exact f3 g3 :=
    (ShortComplex.ShortExact.moduleCat_exact_iff_function_exact _).1
      (hS.homology_exact₂ 3)
  have hexactC3 : Function.Exact g3 δ32 :=
    (ShortComplex.ShortExact.moduleCat_exact_iff_function_exact _).1
      (hS.homology_exact₃ 3 2 (by simp))
  have hexactA2 : Function.Exact δ32 f2 :=
    (ShortComplex.ShortExact.moduleCat_exact_iff_function_exact _).1
      (hS.homology_exact₁ 3 2 (by simp))
  have hB4 :=
    moduleCat_card_eq_card_range_mul_card_range_of_exact f4 g4 hexactB4
  have hC4 :=
    moduleCat_card_eq_card_range_mul_card_range_of_exact g4 δ43 hexactC4
  have hA3 :=
    moduleCat_card_eq_card_range_mul_card_range_of_exact δ43 f3 hexactA3
  have hB3 :=
    moduleCat_card_eq_card_range_mul_card_range_of_exact f3 g3 hexactB3
  have hC3 :=
    moduleCat_card_eq_card_range_mul_card_range_of_exact g3 δ32 hexactC3
  have hA2 :=
    moduleCat_card_eq_card_range_mul_card_range_of_exact δ32 f2 hexactA2
  let q := ShortComplex.homologyMap (subCompNormMap σ i hi)
  have hf4q :
      Nat.card (MonoidHom.range
          f4.hom.toAddMonoidHom.toMultiplicative) =
        Nat.card (MonoidHom.range
          q.hom.toAddMonoidHom.toMultiplicative) := by
    apply moduleCatRangeCard_eq_of_conjugate f4 q pA4 pB4
    exact periodicHomologyIsoEven_naturality
      σ (⟨2, rfl⟩ : Even 4) i hi
  have hf2q :
      Nat.card (MonoidHom.range
          f2.hom.toAddMonoidHom.toMultiplicative) =
        Nat.card (MonoidHom.range
          q.hom.toAddMonoidHom.toMultiplicative) := by
    apply moduleCatRangeCard_eq_of_conjugate f2 q pA2 pB2
    exact periodicHomologyIsoEven_naturality σ (by simp : Even 2) i hi
  have hrange :
      Nat.card (MonoidHom.range
          f4.hom.toAddMonoidHom.toMultiplicative) =
        Nat.card (MonoidHom.range
          f2.hom.toAddMonoidHom.toMultiplicative) :=
    hf4q.trans hf2q.symm
  have hperiodic :
      Nat.card (S.X₂.homology 3) *
          Nat.card (S.X₁.homology 2) *
          Nat.card (S.X₃.homology 4) =
        Nat.card (S.X₁.homology 3) *
          Nat.card (S.X₃.homology 3) *
          Nat.card (S.X₂.homology 4) := by
    rw [hB3, hA2, hC4, hA3, hC3, hB4, ← hrange]
    ac_rfl
  have hcB4 := moduleCat_card_eq_of_iso eB4
  have hcC4 := moduleCat_card_eq_of_iso eC4
  have hcA3 := moduleCat_card_eq_of_iso eA3
  have hcB3 := moduleCat_card_eq_of_iso eB3
  have hcC3 := moduleCat_card_eq_of_iso eC3
  have hcA2 := moduleCat_card_eq_of_iso eA2
  calc
    _ = Nat.card (S.X₂.homology 3) *
          Nat.card (S.X₁.homology 2) *
          Nat.card (S.X₃.homology 4) := by
      rw [hcB3, hcA2, hcC4]
    _ = Nat.card (S.X₁.homology 3) *
          Nat.card (S.X₃.homology 3) *
          Nat.card (S.X₂.homology 4) :=
      hperiodic
    _ = _ := by
      rw [hcA3, hcC3, hcB4]
end Herbrand
end ProfiniteCohomology
end
end CyclicCohomology
end

/- GaloisCohomology.Cyclic.Herbrand.HerbrandLowDegree.Core -/
section
namespace CyclicCohomology
noncomputable section
open scoped BigOperators
namespace ProfiniteCohomology
namespace Herbrand
universe uG uA uB uC
variable {G : Type uG} {A : Type uA} {B : Type uB} {C : Type uC}
variable [Group G] [Fintype G] [CommGroup A] [CommGroup B] [CommGroup C]
variable [MulDistribMulAction G A] [MulDistribMulAction G B]
  [MulDistribMulAction G C]
 


noncomputable def herbrandQuotient (σ : G)
    [Finite (HerbrandH0 G A)] [Finite (HerbrandHMinusOne G A σ)] : ℚ :=
  (Nat.card (HerbrandH0 G A) : ℚ) / (Nat.card (HerbrandHMinusOne G A σ) : ℚ)
 
theorem herbrandQuotient_eq_card_ratio (σ : G)
    [Finite (HerbrandH0 G A)] [Finite (HerbrandHMinusOne G A σ)] :
    herbrandQuotient (G := G) (A := A) σ =
      (Nat.card (HerbrandH0 G A) : ℚ) /
        (Nat.card (HerbrandHMinusOne G A σ) : ℚ) :=
  rfl
 

theorem herbrandQuotient_eq_one_of_card_eq (σ : G)
    [Finite (HerbrandH0 G A)] [Finite (HerbrandHMinusOne G A σ)]
    (hcard : Nat.card (HerbrandH0 G A) = Nat.card (HerbrandHMinusOne G A σ)) :
    herbrandQuotient (G := G) (A := A) σ = 1 := by
  have hden : ((Nat.card (HerbrandHMinusOne G A σ) : ℚ) ≠ 0) :=
    Nat.cast_ne_zero.mpr (Finite.card_pos (α := HerbrandHMinusOne G A σ)).ne'
  unfold herbrandQuotient
  rw [hcard]
  exact div_self hden
 

theorem herbrandQuotient_finite_module_eq_one
    (σ : G) (hgen : ∀ g : G, g ∈ Subgroup.zpowers σ) [Finite A] :
    herbrandQuotient (G := G) (A := A) σ = 1 := by
  exact herbrandQuotient_eq_one_of_card_eq (G := G) (A := A) σ
    (herbrand_finite_module_card_eq (G := G) (A := A) σ hgen)
 



theorem herbrandQuotient_exact_multiplicative
    {G A B C : Type}
    [Group G] [Fintype G]
    [CommGroup A] [CommGroup B] [CommGroup C]
    [MulDistribMulAction G A] [MulDistribMulAction G B]
    [MulDistribMulAction G C]
    (i : A →* B) (j : B →* C)
    (hi : ∀ (g : G) (a : A), i (g • a) = g • i a)
    (hj : ∀ (g : G) (b : B), j (g • b) = g • j b)
    (hker : ∀ b : B, j b = 1 ↔ ∃ a : A, i a = b)
    (hinj : Function.Injective i)
    (hsurj : ∀ c : C, ∃ b : B, j b = c) (σ : G)
    (hgen : ∀ g : G, g ∈ Subgroup.zpowers σ)
    [Finite (HerbrandH0 G A)] [Finite (HerbrandHMinusOne G A σ)]
    [Finite (HerbrandH0 G B)] [Finite (HerbrandHMinusOne G B σ)]
    [Finite (HerbrandH0 G C)] [Finite (HerbrandHMinusOne G C σ)] :
    herbrandQuotient (G := G) (A := B) σ =
      herbrandQuotient (G := G) (A := A) σ *
        herbrandQuotient (G := G) (A := C) σ := by
  have hcard :=
    herbrand_exact_cardinality_identity
      (G := G) (A := A) (B := B) (C := C)
      i j hi hj hker hinj hsurj σ hgen
  have hA :
      ((Nat.card (HerbrandHMinusOne G A σ) : ℚ) ≠ 0) :=
    Nat.cast_ne_zero.mpr
      (Finite.card_pos (α := HerbrandHMinusOne G A σ)).ne'
  have hB :
      ((Nat.card (HerbrandHMinusOne G B σ) : ℚ) ≠ 0) :=
    Nat.cast_ne_zero.mpr
      (Finite.card_pos (α := HerbrandHMinusOne G B σ)).ne'
  have hC :
      ((Nat.card (HerbrandHMinusOne G C σ) : ℚ) ≠ 0) :=
    Nat.cast_ne_zero.mpr
      (Finite.card_pos (α := HerbrandHMinusOne G C σ)).ne'
  unfold herbrandQuotient
  field_simp [hA, hB, hC]
  have hcardQ :
      (Nat.card (HerbrandH0 G B) : ℚ) *
          Nat.card (HerbrandHMinusOne G A σ) *
          Nat.card (HerbrandHMinusOne G C σ) =
        Nat.card (HerbrandH0 G A) *
          Nat.card (HerbrandH0 G C) *
          Nat.card (HerbrandHMinusOne G B σ) := by
    exact_mod_cast hcard
  simpa [mul_assoc, mul_left_comm, mul_comm] using hcardQ
end Herbrand
end ProfiniteCohomology
end
end CyclicCohomology
end

/- GaloisCohomology.Cyclic.Herbrand.HerbrandFiniteness -/
section
namespace CyclicCohomology
noncomputable section
namespace ProfiniteCohomology
namespace Herbrand
open CategoryTheory
universe uG uA
variable {G A B C : Type}
variable [Group G] [Fintype G] [CommGroup A] [CommGroup B] [CommGroup C]
variable [MulDistribMulAction G A] [MulDistribMulAction G B]
  [MulDistribMulAction G C]
 
def HerbrandQuotientDefined (G : Type uG) (A : Type uA)
    [Group G] [Fintype G] [CommGroup A] [MulDistribMulAction G A]
    (σ : G) : Prop :=
  Finite (HerbrandH0 G A) ∧ Finite (HerbrandHMinusOne G A σ)
 

private theorem finite_middle_of_exact
    {X Y Z : Type}
    [Group X] [Group Y] [Group Z]
    (f : X →* Y) (g : Y →* Z) (hexact : MonoidHom.range f = MonoidHom.ker g)
    [Finite X] [Finite Z] :
    Finite Y := by
  apply g.finite_iff_finite_ker_range.mpr
  constructor
  · let : Finite (MonoidHom.range f) :=
      Finite.of_surjective f.rangeRestrict f.rangeRestrict_surjective
    rw [← hexact]
    infer_instance
  · infer_instance
private theorem finite_middle_of_moduleCat_exact
    {X Y Z : ModuleCat.{0} ℤ} (f : X ⟶ Y) (g : Y ⟶ Z)
    (hexact : Function.Exact f g)
    [Finite X] [Finite Z] :
    Finite Y := by
  let fm : Multiplicative X →* Multiplicative Y :=
    f.hom.toAddMonoidHom.toMultiplicative
  let gm : Multiplicative Y →* Multiplicative Z :=
    g.hom.toAddMonoidHom.toMultiplicative
  exact finite_middle_of_exact
    (X := Multiplicative X) (Y := Multiplicative Y)
    (Z := Multiplicative Z) fm gm
    (mulExact_of_moduleCat_exact f g hexact).monoidHom_ker_eq.symm
 

theorem herbrandQuotientDefined_middle_of_left_right
    (i : A →* B) (j : B →* C)
    (hi : ∀ (g : G) (a : A), i (g • a) = g • i a)
    (hj : ∀ (g : G) (b : B), j (g • b) = g • j b)
    (hker : ∀ b : B, j b = 1 ↔ ∃ a : A, i a = b)
    (hinj : Function.Injective i)
    (hsurj : ∀ c : C, ∃ b : B, j b = c)
    (σ : G) (hgen : ∀ g : G, g ∈ Subgroup.zpowers σ)
    (hA : HerbrandQuotientDefined G A σ)
    (hC : HerbrandQuotientDefined G C σ) :
    HerbrandQuotientDefined G B σ := by
  let : Finite (HerbrandH0 G A) := hA.1
  let : Finite (HerbrandHMinusOne G A σ) := hA.2
  let : Finite (HerbrandH0 G C) := hC.1
  let : Finite (HerbrandHMinusOne G C σ) := hC.2
  let S := equivariantShortComplex i j hi hj hker
  have hS : S.ShortExact :=
    equivariantShortComplex_shortExact
      i j hi hj hker hinj hsurj
  let : Finite (tateCohomology S.X₁ (-1)) :=
    finite_source_of_moduleIso
      (tateHMinusOneIsoHerbrandHMinusOne
        (G := G) (A := A) σ hgen)
  let : Finite (tateCohomology S.X₃ (-1)) :=
    finite_source_of_moduleIso
      (tateHMinusOneIsoHerbrandHMinusOne
        (G := G) (A := C) σ hgen)
  have hminusTate : Finite (tateCohomology S.X₂ (-1)) :=
    finite_middle_of_moduleCat_exact
      ((tateCohomologyFunctor (-1)).map S.f)
      ((tateCohomologyFunctor (-1)).map S.g)
      ((ShortComplex.ShortExact.moduleCat_exact_iff_function_exact _).1
        ((TateCohomology.map_tateComplexFunctor_shortExact hS)
          |>.homology_exact₂ (-1)))
  have hminus : Finite (HerbrandHMinusOne G B σ) := by
    let :
        Finite
          (tateCohomology
            (Rep.ofMulDistribMulAction G B) (-1)) := by
      change Finite (tateCohomology S.X₂ (-1))
      exact hminusTate
    exact finite_target_of_moduleIso
      (tateHMinusOneIsoHerbrandHMinusOne
        (G := G) (A := B) σ hgen)
  let : Finite (tateCohomology S.X₁ 0) :=
    finite_source_of_moduleIso
      (tateH0IsoHerbrandH0 (G := G) (A := A))
  let : Finite (tateCohomology S.X₃ 0) :=
    finite_source_of_moduleIso
      (tateH0IsoHerbrandH0 (G := G) (A := C))
  have hzeroTate : Finite (tateCohomology S.X₂ 0) :=
    finite_middle_of_moduleCat_exact
      ((tateCohomologyFunctor 0).map S.f)
      ((tateCohomologyFunctor 0).map S.g)
      ((ShortComplex.ShortExact.moduleCat_exact_iff_function_exact _).1
        ((TateCohomology.map_tateComplexFunctor_shortExact hS)
          |>.homology_exact₂ 0))
  have hzero : Finite (HerbrandH0 G B) := by
    let :
        Finite
          (tateCohomology
            (Rep.ofMulDistribMulAction G B) 0) := by
      change Finite (tateCohomology S.X₂ 0)
      exact hzeroTate
    exact finite_target_of_moduleIso
      (tateH0IsoHerbrandH0 (G := G) (A := B))
  exact ⟨hzero, hminus⟩
 

theorem herbrandQuotient_multiplicative_of_shortExact
    (i : A →* B) (j : B →* C)
    (hi : ∀ (g : G) (a : A), i (g • a) = g • i a)
    (hj : ∀ (g : G) (b : B), j (g • b) = g • j b)
    (hker : ∀ b : B, j b = 1 ↔ ∃ a : A, i a = b)
    (hinj : Function.Injective i)
    (hsurj : ∀ c : C, ∃ b : B, j b = c)
    (σ : G) (hgen : ∀ g : G, g ∈ Subgroup.zpowers σ)
    [Finite (HerbrandH0 G A)] [Finite (HerbrandHMinusOne G A σ)]
    [Finite (HerbrandH0 G B)] [Finite (HerbrandHMinusOne G B σ)]
    [Finite (HerbrandH0 G C)] [Finite (HerbrandHMinusOne G C σ)] :
    herbrandQuotient (G := G) (A := B) σ =
      herbrandQuotient (G := G) (A := A) σ *
        herbrandQuotient (G := G) (A := C) σ :=
  herbrandQuotient_exact_multiplicative
    i j hi hj hker hinj hsurj σ hgen
 
theorem herbrandQuotient_eq_one_of_finite_module
    (σ : G) (hgen : ∀ g : G, g ∈ Subgroup.zpowers σ) [Finite A] :
    herbrandQuotient (G := G) (A := A) σ = 1 :=
  herbrandQuotient_finite_module_eq_one σ hgen
end Herbrand
end ProfiniteCohomology
end
end CyclicCohomology
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
 
def integerUnitsToFieldUnits (K : Type u) [Field K] [ValuativeRel K] : 𝒪[K]ˣ →* Kˣ :=
  Units.map (algebraMap 𝒪[K] K).toMonoidHom
 

theorem integerUnitsToFieldUnits_injective
    (K : Type u) [Field K] [ValuativeRel K] :
    Function.Injective (integerUnitsToFieldUnits K) := by
  intro x y hxy
  apply Units.ext
  apply Subtype.ext
  simpa [integerUnitsToFieldUnits] using congrArg Units.val hxy
 
@[simp]
theorem v_integerUnitsToFieldUnits (K : Type u) [Field K] [ValuativeRel K]
    [TopologicalSpace K] [IsNonarchimedeanLocalField K] (x : 𝒪[K]ˣ) :
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

/- ValuedFieldTheory.LocalField.NonarchimedeanLocalField.Valuation -/
section
namespace LocalFieldTheory
noncomputable section
universe u
namespace IsNonarchimedeanLocalField

open scoped ValuativeRel
 
theorem valuation_integer_membership
    (K : Type u) [Field K] [ValuativeRel K] (x : K) :
    x ∈ 𝒪[K] ↔ ValuativeRel.valuation K x ≤ 1 :=
  (Valuation.mem_integer_iff (ValuativeRel.valuation K) x).symm
end IsNonarchimedeanLocalField
end
end LocalFieldTheory
end

/- ValuedFieldTheory.LocalField.NonarchimedeanLocalField.PrincipalUnits -/
section
namespace LocalFieldTheory
noncomputable section
universe u
open scoped ValuativeRel
 
def principalUnits (K : Type u) [Field K] [ValuativeRel K] (n : Nat) :
    Subgroup 𝒪[K]ˣ where
  carrier := {u | ((u : 𝒪[K]) - 1) ∈ (𝓂[K] ^ n : Ideal 𝒪[K])}
  one_mem' := by
    simp
  mul_mem' := by
    intro a b ha hb
    change ((a : 𝒪[K]) * (b : 𝒪[K]) - 1) ∈ (𝓂[K] ^ n : Ideal 𝒪[K])
    rw [show ((a : 𝒪[K]) * (b : 𝒪[K]) - 1) =
        ((a : 𝒪[K]) - 1) * (b : 𝒪[K]) + ((b : 𝒪[K]) - 1) by
      ring]
    exact Ideal.add_mem _ (Ideal.mul_mem_right _ _ ha) hb
  inv_mem' := by
    intro a ha
    change (((a⁻¹ : 𝒪[K]ˣ) : 𝒪[K]) - 1) ∈ (𝓂[K] ^ n : Ideal 𝒪[K])
    rw [show (((a⁻¹ : 𝒪[K]ˣ) : 𝒪[K]) - 1) =
        -(((a⁻¹ : 𝒪[K]ˣ) : 𝒪[K]) * ((a : 𝒪[K]) - 1)) by
      calc
        (((a⁻¹ : 𝒪[K]ˣ) : 𝒪[K]) - 1)
            = ((a⁻¹ : 𝒪[K]ˣ) : 𝒪[K])
              - (((a⁻¹ : 𝒪[K]ˣ) : 𝒪[K]) * (a : 𝒪[K])) := by
                simp
        _ = -(((a⁻¹ : 𝒪[K]ˣ) : 𝒪[K]) * ((a : 𝒪[K]) - 1)) := by
          ring]
    exact (𝓂[K] ^ n : Ideal 𝒪[K]).neg_mem (Ideal.mul_mem_left _ _ ha)
 

theorem mem_principalUnits_iff (K : Type u) [Field K] [ValuativeRel K]
    (u : 𝒪[K]ˣ) (n : Nat) :
    u ∈ principalUnits K n ↔ ((u : 𝒪[K]) - 1) ∈ (𝓂[K] ^ n : Ideal 𝒪[K]) :=
  Iff.rfl
 
@[simp] theorem principalUnits_zero (K : Type u) [Field K] [ValuativeRel K] :
    principalUnits K 0 = ⊤ := by
  ext u
  simp [principalUnits]
 
theorem principalUnits_antitone (K : Type u) [Field K] [ValuativeRel K]
    {m n : Nat} (h : m ≤ n) :
    principalUnits K n ≤ principalUnits K m := by
  intro u hu
  exact Ideal.pow_le_pow_right h hu
 
lemma unit_mul_sub_one_eq (K : Type u) [Field K] [ValuativeRel K] (a b : 𝒪[K]ˣ) :
    ((a * b : 𝒪[K]ˣ) : 𝒪[K]) - 1 =
      ((a : 𝒪[K]) - 1) * ((b : 𝒪[K]) - 1) +
        ((a : 𝒪[K]) - 1) + ((b : 𝒪[K]) - 1) := by
  simp only [Units.val_mul]
  ring
end
end LocalFieldTheory
end

/- ValuedFieldTheory.LocalField.NonarchimedeanLocalField.PrincipalUnitQuotients -/
section
namespace LocalFieldTheory
noncomputable section
universe u
open scoped ValuativeRel
open Filter
 
def PrincipalUnitsSuccQuot (K : Type u) [Field K] [ValuativeRel K] (n : Nat) :
    Type u :=
  principalUnits K n ⧸ (principalUnits K (n + 1)).subgroupOf (principalUnits K n)
 

instance principalUnitsSuccQuotCommGroup
    (K : Type u) [Field K] [ValuativeRel K] (n : Nat) :
    CommGroup (PrincipalUnitsSuccQuot K n) := by
  change CommGroup
    (principalUnits K n ⧸
      (principalUnits K (n + 1)).subgroupOf (principalUnits K n))
  infer_instance
 
def principalUnitsSuccQuotConcreteEquiv
    (K : Type u) [Field K] [ValuativeRel K] (n : Nat) :
    PrincipalUnitsSuccQuot K n ≃*
      (principalUnits K n ⧸
        (principalUnits K (n + 1)).subgroupOf (principalUnits K n)) := by
  change
    (principalUnits K n ⧸
        (principalUnits K (n + 1)).subgroupOf (principalUnits K n)) ≃*
      (principalUnits K n ⧸
        (principalUnits K (n + 1)).subgroupOf (principalUnits K n))
  exact MulEquiv.refl _
 
def principalUnitsSuccQuotMk (K : Type u) [Field K] [ValuativeRel K] (n : Nat) :
    principalUnits K n →* PrincipalUnitsSuccQuot K n := by
  change principalUnits K n →*
    (principalUnits K n ⧸
      (principalUnits K (n + 1)).subgroupOf (principalUnits K n))
  exact QuotientGroup.mk'
    ((principalUnits K (n + 1)).subgroupOf (principalUnits K n))
 
def principalUnitsSuccQuotLift
    {K : Type u} {M : Type*} [Field K] [ValuativeRel K] [Group M]
    (n : Nat) (f : principalUnits K n →* M)
    (h : (principalUnits K (n + 1)).subgroupOf
      (principalUnits K n) ≤ f.ker) :
    PrincipalUnitsSuccQuot K n →* M := by
  change
    (principalUnits K n ⧸
      (principalUnits K (n + 1)).subgroupOf (principalUnits K n)) →* M
  exact QuotientGroup.lift
    ((principalUnits K (n + 1)).subgroupOf (principalUnits K n)) f h
 

@[simp]
theorem principalUnitsSuccQuotLift_mk
    {K : Type u} {M : Type*} [Field K] [ValuativeRel K] [Group M]
    (n : Nat) (f : principalUnits K n →* M)
    (h : (principalUnits K (n + 1)).subgroupOf
      (principalUnits K n) ≤ f.ker) (x : principalUnits K n) :
    principalUnitsSuccQuotLift n f h
        (principalUnitsSuccQuotMk K n x) = f x :=
  rfl
 
protected theorem PrincipalUnitsSuccQuot.inductionOn
    {K : Type u} [Field K] [ValuativeRel K] (n : Nat)
    {motive : PrincipalUnitsSuccQuot K n → Prop}
    (q : PrincipalUnitsSuccQuot K n)
    (h : ∀ x : principalUnits K n,
      motive (principalUnitsSuccQuotMk K n x)) :
    motive q := by
  change motive
    (show principalUnits K n ⧸
      (principalUnits K (n + 1)).subgroupOf (principalUnits K n) from q)
  refine QuotientGroup.induction_on q ?_
  intro x
  exact h x
 

theorem exists_maximalIdeal_pow_subset_nhds_zero
    (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (s : Set 𝒪[K])
    (hs : s ∈ nhds (0 : 𝒪[K])) :
    ∃ N : Nat, ((𝓂[K] ^ N : Ideal 𝒪[K]) : Set 𝒪[K]) ⊆ s := by
  rcases (mem_nhds_subtype ((ValuativeRel.valuation K).integer : Set K)
      (0 : 𝒪[K]) s).1 hs with
    ⟨t, ht, hts⟩
  rcases (IsValuativeTopology.hasBasis_nhds_zero K).mem_iff.mp ht with
    ⟨γ, -, hγt⟩
  rcases IsDiscreteValuationRing.exists_irreducible 𝒪[K] with ⟨ϖ, hϖ⟩
  rcases exists_pow_lt₀
      (Valuation.integer.v_irreducible_lt_one (v := ValuativeRel.valuation K) hϖ)
      γ with
    ⟨N, hN⟩
  refine ⟨N, ?_⟩
  intro x hx
  apply hts
  apply hγt
  have hset := Irreducible.maximalIdeal_pow_eq_setOfPred_le_v_coe_pow
    (v := ValuativeRel.valuation K) hϖ N
  have hxset : x ∈ ((𝓂[K] ^ N : Ideal 𝒪[K]) : Set 𝒪[K]) := hx
  rw [hset] at hxset
  exact hxset.trans_lt hN
 

theorem eventually_maximalIdeal_pow_subset_nhds_zero
    (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (s : Set 𝒪[K])
    (hs : s ∈ nhds (0 : 𝒪[K])) :
    ∃ N : Nat, ∀ m : Nat, N ≤ m →
      ((𝓂[K] ^ m : Ideal 𝒪[K]) : Set 𝒪[K]) ⊆ s := by
  rcases exists_maximalIdeal_pow_subset_nhds_zero K s hs with ⟨N, hN⟩
  refine ⟨N, fun m hm x hx => hN ?_⟩
  exact Ideal.pow_le_pow_right hm hx
 
theorem isClosed_maximalIdeal_pow
    (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (n : Nat) :
    IsClosed (((𝓂[K] ^ n : Ideal 𝒪[K]) : Set 𝒪[K])) := by
  rcases IsDiscreteValuationRing.exists_irreducible 𝒪[K] with ⟨ϖ, hϖ⟩
  have hset := Irreducible.maximalIdeal_pow_eq_setOfPred_le_v_coe_pow
    (v := ValuativeRel.valuation K) hϖ n
  rw [hset]
  have hclosed :
      IsClosed {x : 𝒪[K] |
        (ValuativeRel.valuation K).restrict (x : K) ≤
          (ValuativeRel.valuation K).restrict ((ϖ : K) ^ n)} :=
    ((ValuativeRel.valuation K).isClosed_closedBall
      ((ValuativeRel.valuation K).restrict ((ϖ : K) ^ n))).preimage
        (continuous_subtype_val : Continuous (fun x : 𝒪[K] => (x : K)))
  convert hclosed using 1
  ext x
  simp only [Set.mem_ofPred_eq]
  rw [← map_pow, Valuation.restrict_le_iff, map_pow]
 

theorem maximalIdeal_pow_mem_nhds_zero
    (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (n : Nat) :
    (((𝓂[K] ^ n : Ideal 𝒪[K]) : Set 𝒪[K])) ∈ nhds (0 : 𝒪[K]) := by
  rcases IsDiscreteValuationRing.exists_irreducible 𝒪[K] with ⟨ϖ, hϖ⟩
  let γ : (ValuativeRel.ValueGroupWithZero K)ˣ :=
    Units.mk0 (ValuativeRel.valuation K ((ϖ : 𝒪[K]) : K) ^ n)
      (pow_ne_zero n (ne_of_gt (Valuation.integer.v_irreducible_pos
        (v := ValuativeRel.valuation K) hϖ)))
  refine (mem_nhds_subtype ((ValuativeRel.valuation K).integer : Set K)
      (0 : 𝒪[K]) (((𝓂[K] ^ n : Ideal 𝒪[K]) : Set 𝒪[K]))).2 ?_
  refine ⟨{x : K | ValuativeRel.valuation K x <
      (γ : ValuativeRel.ValueGroupWithZero K)}, ?_, ?_⟩
  · exact (IsValuativeTopology.hasBasis_nhds_zero K).mem_of_mem (i := γ) trivial
  · intro x hx
    change x ∈ ((𝓂[K] ^ n : Ideal 𝒪[K]) : Set 𝒪[K])
    have hset := Irreducible.maximalIdeal_pow_eq_setOfPred_le_v_coe_pow
      (v := ValuativeRel.valuation K) hϖ n
    rw [hset]
    have hxv : ValuativeRel.valuation K ((x : 𝒪[K]) : K) <
        (γ : ValuativeRel.ValueGroupWithZero K) := hx
    exact le_of_lt hxv
 

theorem tendsto_pow_succ_of_mem_maximalIdeal
    (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] {x : 𝒪[K]}
    (hx : x ∈ (𝓂[K] : Ideal 𝒪[K])) :
    Tendsto (fun d : Nat => x ^ (d + 1)) atTop (nhds (0 : 𝒪[K])) := by
  rw [tendsto_def]
  intro s hs
  rcases eventually_maximalIdeal_pow_subset_nhds_zero K s hs with ⟨N, hN⟩
  filter_upwards [eventually_ge_atTop N] with d hd
  exact hN (d + 1) (le_trans hd (Nat.le_succ d))
    (Ideal.pow_mem_pow hx (d + 1))
 
theorem tendsto_neg_pow_succ_of_mem_maximalIdeal
    (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] {x : 𝒪[K]}
    (hx : x ∈ (𝓂[K] : Ideal 𝒪[K])) :
    Tendsto (fun d : Nat => (-x) ^ (d + 1)) atTop (nhds (0 : 𝒪[K])) :=
  tendsto_pow_succ_of_mem_maximalIdeal K ((𝓂[K] : Ideal 𝒪[K]).neg_mem hx)
 


def principalUnitsCorrectionProduct (K : Type u) [Field K] [ValuativeRel K]
    (n : Nat) (z : ∀ d : Nat, principalUnits K (n + d)) :
    Nat → 𝒪[K]ˣ
  | 0 => 1
  | d + 1 => principalUnitsCorrectionProduct K n z d * (z d : 𝒪[K]ˣ)
 
@[simp]
theorem principalUnitsCorrectionProduct_succ
    (K : Type u) [Field K] [ValuativeRel K] (n d : Nat)
    (z : ∀ d : Nat, principalUnits K (n + d)) :
    principalUnitsCorrectionProduct K n z (d + 1) =
      principalUnitsCorrectionProduct K n z d * (z d : 𝒪[K]ˣ) :=
  rfl
 

theorem principalUnitsCorrectionProduct_mem
    (K : Type u) [Field K] [ValuativeRel K] (n : Nat)
    (z : ∀ d : Nat, principalUnits K (n + d)) (d : Nat) :
    principalUnitsCorrectionProduct K n z d ∈ principalUnits K n := by
  induction d with
  | zero =>
      simp [principalUnitsCorrectionProduct]
  | succ d ih =>
      rw [principalUnitsCorrectionProduct_succ]
      exact (principalUnits K n).mul_mem ih
        (principalUnits_antitone K (Nat.le_add_right n d) (z d).2)
 


theorem principalUnitsCorrectionProduct_div_mem
    (K : Type u) [Field K] [ValuativeRel K] (n m d : Nat)
    (z : ∀ d : Nat, principalUnits K (n + d)) :
    principalUnitsCorrectionProduct K n z (m + d) /
        principalUnitsCorrectionProduct K n z m ∈
      principalUnits K (n + m) := by
  induction d with
  | zero =>
      simp
  | succ d ih =>
      have hprod :
          principalUnitsCorrectionProduct K n z (m + (d + 1)) =
            principalUnitsCorrectionProduct K n z (m + d) *
              (z (m + d) : 𝒪[K]ˣ) := by
        rw [Nat.add_succ]
        rfl
      rw [hprod]
      have hz :
          (z (m + d) : 𝒪[K]ˣ) ∈ principalUnits K (n + m) := by
        exact principalUnits_antitone K
          (Nat.add_le_add_left (Nat.le_add_right m d) n) (z (m + d)).2
      have hEq :
          principalUnitsCorrectionProduct K n z (m + d) *
              (z (m + d) : 𝒪[K]ˣ) /
              principalUnitsCorrectionProduct K n z m =
            (principalUnitsCorrectionProduct K n z (m + d) /
              principalUnitsCorrectionProduct K n z m) *
              (z (m + d) : 𝒪[K]ˣ) := by
        simp [div_eq_mul_inv, mul_assoc, mul_comm]
      rw [hEq]
      exact (principalUnits K (n + m)).mul_mem ih hz
 

theorem principalUnitsCorrectionProduct_div_sub_one_mem
    (K : Type u) [Field K] [ValuativeRel K] (n m d : Nat)
    (z : ∀ d : Nat, principalUnits K (n + d)) :
    ((principalUnitsCorrectionProduct K n z (m + d) /
          principalUnitsCorrectionProduct K n z m : 𝒪[K]ˣ) : 𝒪[K]) - 1 ∈
      (𝓂[K] ^ (n + m) : Ideal 𝒪[K]) := by
  exact (mem_principalUnits_iff K
    (principalUnitsCorrectionProduct K n z (m + d) /
      principalUnitsCorrectionProduct K n z m) (n + m)).1
    (principalUnitsCorrectionProduct_div_mem K n m d z)
 


lemma unit_sub_eq_mul_div_sub_one
    (K : Type u) [Field K] [ValuativeRel K] (a b : 𝒪[K]ˣ) :
    (a : 𝒪[K]) - (b : 𝒪[K]) =
      (b : 𝒪[K]) * (((a / b : 𝒪[K]ˣ) : 𝒪[K]) - 1) := by
  have hmul : (b : 𝒪[K]) * ((a / b : 𝒪[K]ˣ) : 𝒪[K]) = (a : 𝒪[K]) := by
    simp [div_eq_mul_inv, mul_left_comm]
  calc
    (a : 𝒪[K]) - (b : 𝒪[K]) =
        (b : 𝒪[K]) * ((a / b : 𝒪[K]ˣ) : 𝒪[K]) - (b : 𝒪[K]) := by
      rw [hmul]
    _ = (b : 𝒪[K]) * (((a / b : 𝒪[K]ˣ) : 𝒪[K]) - 1) := by
      ring
 

theorem principalUnitsCorrectionProduct_sub_mem
    (K : Type u) [Field K] [ValuativeRel K] (n m d : Nat)
    (z : ∀ d : Nat, principalUnits K (n + d)) :
    ((principalUnitsCorrectionProduct K n z (m + d) : 𝒪[K]ˣ) : 𝒪[K]) -
        ((principalUnitsCorrectionProduct K n z m : 𝒪[K]ˣ) : 𝒪[K]) ∈
      (𝓂[K] ^ (n + m) : Ideal 𝒪[K]) := by
  let a : 𝒪[K]ˣ := principalUnitsCorrectionProduct K n z (m + d)
  let b : 𝒪[K]ˣ := principalUnitsCorrectionProduct K n z m
  have htail : (((a / b : 𝒪[K]ˣ) : 𝒪[K]) - 1) ∈
      (𝓂[K] ^ (n + m) : Ideal 𝒪[K]) := by
    simpa [a, b] using principalUnitsCorrectionProduct_div_sub_one_mem K n m d z
  rw [unit_sub_eq_mul_div_sub_one K a b]
  exact Ideal.mul_mem_left _ _ htail
 

theorem principalUnitsCorrectionProduct_sub_mem_of_le
    (K : Type u) [Field K] [ValuativeRel K] (n N i j : Nat)
    (z : ∀ d : Nat, principalUnits K (n + d))
    (hi : N ≤ i) (hj : N ≤ j) :
    ((principalUnitsCorrectionProduct K n z i : 𝒪[K]ˣ) : 𝒪[K]) -
        ((principalUnitsCorrectionProduct K n z j : 𝒪[K]ˣ) : 𝒪[K]) ∈
      (𝓂[K] ^ (n + N) : Ideal 𝒪[K]) := by
  by_cases hji : j ≤ i
  · obtain ⟨d, rfl⟩ := Nat.exists_eq_add_of_le hji
    exact Ideal.pow_le_pow_right (Nat.add_le_add_left hj n)
      (principalUnitsCorrectionProduct_sub_mem K n j d z)
  · have hij : i ≤ j := Nat.le_of_not_ge hji
    obtain ⟨d, rfl⟩ := Nat.exists_eq_add_of_le hij
    have hdiff :
        ((principalUnitsCorrectionProduct K n z (i + d) : 𝒪[K]ˣ) : 𝒪[K]) -
            ((principalUnitsCorrectionProduct K n z i : 𝒪[K]ˣ) : 𝒪[K]) ∈
          (𝓂[K] ^ (n + N) : Ideal 𝒪[K]) := by
      exact Ideal.pow_le_pow_right (Nat.add_le_add_left hi n)
        (principalUnitsCorrectionProduct_sub_mem K n i d z)
    have hEq :
        ((principalUnitsCorrectionProduct K n z i : 𝒪[K]ˣ) : 𝒪[K]) -
            ((principalUnitsCorrectionProduct K n z (i + d) : 𝒪[K]ˣ) : 𝒪[K]) =
          -(((principalUnitsCorrectionProduct K n z (i + d) : 𝒪[K]ˣ) : 𝒪[K]) -
            ((principalUnitsCorrectionProduct K n z i : 𝒪[K]ˣ) : 𝒪[K])) := by
      ring
    rw [hEq]
    exact (𝓂[K] ^ (n + N) : Ideal 𝒪[K]).neg_mem hdiff
 

theorem principalUnitsCorrectionProduct_cauchySeq
    (K : Type u) [Field K] [ValuativeRel K] [UniformSpace K] [IsUniformAddGroup K]
    [IsNonarchimedeanLocalField K] (n : Nat)
    (z : ∀ d : Nat, principalUnits K (n + d)) :
    CauchySeq fun d : Nat =>
      ((principalUnitsCorrectionProduct K n z d : 𝒪[K]ˣ) : 𝒪[K]) := by
  rw [cauchySeq_iff]
  intro V hV
  rw [uniformity_eq_comap_nhds_zero 𝒪[K]] at hV
  rw [mem_comap] at hV
  rcases hV with ⟨s, hs, hsub⟩
  rcases eventually_maximalIdeal_pow_subset_nhds_zero K s hs with ⟨N, hN⟩
  refine ⟨N, ?_⟩
  intro i hi j hj
  apply hsub
  exact hN (n + N) (Nat.le_add_left N n)
    (principalUnitsCorrectionProduct_sub_mem_of_le K n N j i z hj hi)
 



theorem exists_tendsto_principalUnitsCorrectionProduct
    (K : Type u) [Field K] [ValuativeRel K] [UniformSpace K] [IsUniformAddGroup K]
    [IsNonarchimedeanLocalField K] (n : Nat)
    (z : ∀ d : Nat, principalUnits K (n + d)) :
    ∃ x : 𝒪[K], Tendsto
      (fun d : Nat => ((principalUnitsCorrectionProduct K n z d : 𝒪[K]ˣ) : 𝒪[K]))
      atTop (nhds x) :=
  cauchySeq_tendsto_of_complete
    (principalUnitsCorrectionProduct_cauchySeq K n z)
 

theorem principalUnitsCorrectionProduct_limit_sub_one_mem
    (K : Type u) [Field K] [ValuativeRel K] [UniformSpace K] [IsUniformAddGroup K]
    [IsNonarchimedeanLocalField K] (n : Nat)
    (z : ∀ d : Nat, principalUnits K (n + d)) (x : 𝒪[K])
    (hx : Tendsto
      (fun d : Nat => ((principalUnitsCorrectionProduct K n z d : 𝒪[K]ˣ) : 𝒪[K]))
      atTop (nhds x)) :
    x - 1 ∈ (𝓂[K] ^ n : Ideal 𝒪[K]) := by
  have hclosed := isClosed_maximalIdeal_pow K n
  refine hclosed.mem_of_tendsto
    (f := fun d : Nat =>
      ((principalUnitsCorrectionProduct K n z d : 𝒪[K]ˣ) : 𝒪[K]) - 1)
    (b := (atTop : Filter Nat)) (x := x - 1) ?_ ?_
  · exact hx.sub tendsto_const_nhds
  · exact Eventually.of_forall fun d =>
      (mem_principalUnits_iff K (principalUnitsCorrectionProduct K n z d) n).1
        (principalUnitsCorrectionProduct_mem K n z d)
 


theorem exists_tendsto_principalUnitsCorrectionProduct_sub_one_mem
    (K : Type u) [Field K] [ValuativeRel K] [UniformSpace K] [IsUniformAddGroup K]
    [IsNonarchimedeanLocalField K] (n : Nat)
    (z : ∀ d : Nat, principalUnits K (n + d)) :
    ∃ x : 𝒪[K], Tendsto
        (fun d : Nat => ((principalUnitsCorrectionProduct K n z d : 𝒪[K]ˣ) : 𝒪[K]))
        atTop (nhds x) ∧
      x - 1 ∈ (𝓂[K] ^ n : Ideal 𝒪[K]) := by
  rcases exists_tendsto_principalUnitsCorrectionProduct K n z with ⟨x, hx⟩
  exact ⟨x, hx, principalUnitsCorrectionProduct_limit_sub_one_mem K n z x hx⟩
 

@[simp]
theorem principalUnitsSuccQuotConcreteEquiv_mk
    (K : Type u) [Field K] [ValuativeRel K]
    (n : Nat) (u : principalUnits K n) :
    principalUnitsSuccQuotConcreteEquiv K n
        (principalUnitsSuccQuotMk K n u) =
      QuotientGroup.mk u :=
  rfl
 
theorem principalUnitsSuccQuotMk_surjective
    (K : Type u) [Field K] [ValuativeRel K] (n : Nat) :
    Function.Surjective (principalUnitsSuccQuotMk K n) :=
  QuotientGroup.mk'_surjective ((principalUnits K (n + 1)).subgroupOf (principalUnits K n))
 
theorem principalUnitsSuccQuotMk_eq_one_iff
    (K : Type u) [Field K] [ValuativeRel K] (n : Nat)
    (u : principalUnits K n) :
    principalUnitsSuccQuotMk K n u = 1 ↔
      u ∈ (principalUnits K (n + 1)).subgroupOf (principalUnits K n) := by
  constructor
  · intro h
    apply (QuotientGroup.eq_one_iff
      (N := (principalUnits K (n + 1)).subgroupOf (principalUnits K n)) u).mp
    have h' := congrArg (principalUnitsSuccQuotConcreteEquiv K n) h
    simpa using h'
  · intro h
    apply (principalUnitsSuccQuotConcreteEquiv K n).injective
    simpa using
      (QuotientGroup.eq_one_iff
        (N := (principalUnits K (n + 1)).subgroupOf (principalUnits K n)) u).mpr h
 

theorem principalUnitsSuccQuotMk_eq_iff_div_mem
    (K : Type u) [Field K] [ValuativeRel K] (n : Nat)
    (u v : principalUnits K n) :
    principalUnitsSuccQuotMk K n u = principalUnitsSuccQuotMk K n v ↔
      u / v ∈ (principalUnits K (n + 1)).subgroupOf (principalUnits K n) := by
  constructor
  · intro h
    have h' := congrArg (principalUnitsSuccQuotConcreteEquiv K n) h
    exact (QuotientGroup.eq_iff_div_mem
      (N := (principalUnits K (n + 1)).subgroupOf (principalUnits K n))).mp h'
  · intro h
    apply (principalUnitsSuccQuotConcreteEquiv K n).injective
    exact (QuotientGroup.eq_iff_div_mem
      (N := (principalUnits K (n + 1)).subgroupOf (principalUnits K n))).mpr h
 

theorem mem_principalUnits_succ_subgroupOf_iff
    (K : Type u) [Field K] [ValuativeRel K] (n : Nat)
    (u : principalUnits K n) :
    u ∈ (principalUnits K (n + 1)).subgroupOf (principalUnits K n) ↔
      (((u : 𝒪[K]ˣ) : 𝒪[K]) - 1) ∈
        (𝓂[K] ^ (n + 1) : Ideal 𝒪[K]) := by
  rw [Subgroup.mem_subgroupOf, mem_principalUnits_iff]
 
abbrev maximalIdealPowSuccSubmodule
    (K : Type u) [Field K] [ValuativeRel K] (n : Nat) :
    Submodule (𝒪[K]) ((𝓂[K] ^ n : Ideal 𝒪[K]) : Type u) :=
  Submodule.comap (Submodule.subtype (p := (𝓂[K] ^ n : Ideal 𝒪[K])))
    ((𝓂[K] ^ (n + 1) : Ideal 𝒪[K]) : Submodule (𝒪[K]) (𝒪[K]))
 
def MaximalIdealPowSuccQuot
    (K : Type u) [Field K] [ValuativeRel K] (n : Nat) : Type u :=
  ((𝓂[K] ^ n : Ideal 𝒪[K]) : Type u) ⧸ maximalIdealPowSuccSubmodule K n
 
instance maximalIdealPowSuccQuotAddCommGroup
    (K : Type u) [Field K] [ValuativeRel K] (n : Nat) :
    AddCommGroup (MaximalIdealPowSuccQuot K n) := by
  change AddCommGroup
    (((𝓂[K] ^ n : Ideal 𝒪[K]) : Type u) ⧸
      maximalIdealPowSuccSubmodule K n)
  infer_instance
 
instance maximalIdealPowSuccQuotModule
    (K : Type u) [Field K] [ValuativeRel K] (n : Nat) :
    Module 𝒪[K] (MaximalIdealPowSuccQuot K n) := by
  change Module 𝒪[K]
    (((𝓂[K] ^ n : Ideal 𝒪[K]) : Type u) ⧸
      maximalIdealPowSuccSubmodule K n)
  infer_instance
 
def maximalIdealPowSuccQuotMk
    (K : Type u) [Field K] [ValuativeRel K] (n : Nat) :
    ((𝓂[K] ^ n : Ideal 𝒪[K]) : Type u) →ₗ[𝒪[K]]
      MaximalIdealPowSuccQuot K n := by
  change ((𝓂[K] ^ n : Ideal 𝒪[K]) : Type u) →ₗ[𝒪[K]]
    (((𝓂[K] ^ n : Ideal 𝒪[K]) : Type u) ⧸
      maximalIdealPowSuccSubmodule K n)
  exact Submodule.mkQ (maximalIdealPowSuccSubmodule K n)
 
protected theorem MaximalIdealPowSuccQuot.inductionOn
    {K : Type u} [Field K] [ValuativeRel K] (n : Nat)
    {motive : MaximalIdealPowSuccQuot K n → Prop}
    (q : MaximalIdealPowSuccQuot K n)
    (h : ∀ a : ((𝓂[K] ^ n : Ideal 𝒪[K]) : Type u),
      motive (maximalIdealPowSuccQuotMk K n a)) :
    motive q := by
  change motive
    (show ((𝓂[K] ^ n : Ideal 𝒪[K]) : Type u) ⧸
      maximalIdealPowSuccSubmodule K n from q)
  refine Quotient.inductionOn q ?_
  intro a
  exact h a
 
protected theorem MaximalIdealPowSuccQuot.inductionOn₂
    {K : Type u} [Field K] [ValuativeRel K] (n : Nat)
    {motive : MaximalIdealPowSuccQuot K n →
      MaximalIdealPowSuccQuot K n → Prop}
    (q r : MaximalIdealPowSuccQuot K n)
    (h : ∀ a b : ((𝓂[K] ^ n : Ideal 𝒪[K]) : Type u),
      motive (maximalIdealPowSuccQuotMk K n a)
        (maximalIdealPowSuccQuotMk K n b)) :
    motive q r := by
  refine MaximalIdealPowSuccQuot.inductionOn n
    (motive := fun q' => motive q' r) q ?_
  intro a
  refine MaximalIdealPowSuccQuot.inductionOn n
    (motive := fun r' => motive (maximalIdealPowSuccQuotMk K n a) r') r ?_
  intro b
  exact h a b
 

def maximalIdealPowSuccQuotLift
    {K : Type u} {P : Sort*} [Field K] [ValuativeRel K] (n : Nat)
    (f : ((𝓂[K] ^ n : Ideal 𝒪[K]) : Type u) → P)
    (h : ∀ a b, a - b ∈ maximalIdealPowSuccSubmodule K n →
      f a = f b) :
    MaximalIdealPowSuccQuot K n → P := by
  change
    ((((𝓂[K] ^ n : Ideal 𝒪[K]) : Type u) ⧸
      maximalIdealPowSuccSubmodule K n) → P)
  refine Quotient.lift f ?_
  intro a b hab
  have hq :
      (Submodule.Quotient.mk a :
        ((𝓂[K] ^ n : Ideal 𝒪[K]) : Type u) ⧸
          maximalIdealPowSuccSubmodule K n) =
        Submodule.Quotient.mk b :=
    Quotient.sound hab
  exact h a b
    ((Submodule.Quotient.eq (maximalIdealPowSuccSubmodule K n)).1 hq)
 

theorem mem_maximalIdealPowSuccSubmodule_iff
    (K : Type u) [Field K] [ValuativeRel K] (n : Nat)
    (a : ((𝓂[K] ^ n : Ideal 𝒪[K]) : Type u)) :
    a ∈ maximalIdealPowSuccSubmodule K n ↔
      (a : 𝒪[K]) ∈ (𝓂[K] ^ (n + 1) : Ideal 𝒪[K]) :=
  Iff.rfl
 
theorem maximalIdealPowSuccQuotMk_eq_zero_iff
    (K : Type u) [Field K] [ValuativeRel K] (n : Nat)
    (a : ((𝓂[K] ^ n : Ideal 𝒪[K]) : Type u)) :
    maximalIdealPowSuccQuotMk K n a = 0 ↔
      (a : 𝒪[K]) ∈ (𝓂[K] ^ (n + 1) : Ideal 𝒪[K]) := by
  change (Submodule.Quotient.mk a :
    ((𝓂[K] ^ n : Ideal 𝒪[K]) : Type u) ⧸
      maximalIdealPowSuccSubmodule K n) = 0 ↔ _
  rw [Submodule.Quotient.mk_eq_zero]
  rfl
 
theorem isUnit_one_add_of_mem_maximalIdeal_pow
    (K : Type u) [Field K] [ValuativeRel K] {n : Nat} (hn : 1 ≤ n)
    (a : 𝒪[K]) (ha : a ∈ (𝓂[K] ^ n : Ideal 𝒪[K])) : IsUnit (1 + a) := by
  have ha1 : a ∈ (𝓂[K] : Ideal 𝒪[K]) := by
    have hle : (𝓂[K] ^ n : Ideal 𝒪[K]) ≤ (𝓂[K] ^ 1 : Ideal 𝒪[K]) :=
      Ideal.pow_le_pow_right hn
    simpa using hle ha
  have hnon : (-a) ∈ nonunits 𝒪[K] := by
    rw [← IsLocalRing.mem_maximalIdeal]
    exact (𝓂[K] : Ideal 𝒪[K]).neg_mem ha1
  have hunit : IsUnit (1 - (-a)) :=
    IsLocalRing.isUnit_one_sub_self_of_mem_nonunits (-a) hnon
  simpa [sub_neg_eq_add] using hunit
 
noncomputable def principalUnitOneAddOfMemPow
    (K : Type u) [Field K] [ValuativeRel K] {n : Nat} (hn : 1 ≤ n)
    (a : 𝒪[K]) (ha : a ∈ (𝓂[K] ^ n : Ideal 𝒪[K])) : 𝒪[K]ˣ :=
  (isUnit_one_add_of_mem_maximalIdeal_pow K hn a ha).unit
 
@[simp]
theorem principalUnitOneAddOfMemPow_val
    (K : Type u) [Field K] [ValuativeRel K] {n : Nat} (hn : 1 ≤ n)
    (a : 𝒪[K]) (ha : a ∈ (𝓂[K] ^ n : Ideal 𝒪[K])) :
    ((principalUnitOneAddOfMemPow K hn a ha : 𝒪[K]ˣ) : 𝒪[K]) = 1 + a :=
  IsUnit.unit_spec (isUnit_one_add_of_mem_maximalIdeal_pow K hn a ha)
 
noncomputable def principalUnitOneAddOfMemPowSubgroup
    (K : Type u) [Field K] [ValuativeRel K] {n : Nat} (hn : 1 ≤ n)
    (a : 𝒪[K]) (ha : a ∈ (𝓂[K] ^ n : Ideal 𝒪[K])) : principalUnits K n :=
  ⟨principalUnitOneAddOfMemPow K hn a ha, by
    rw [mem_principalUnits_iff]
    simp [principalUnitOneAddOfMemPow_val, ha]
  ⟩
 
@[simp]
theorem principalUnitOneAddOfMemPowSubgroup_val
    (K : Type u) [Field K] [ValuativeRel K] {n : Nat} (hn : 1 ≤ n)
    (a : 𝒪[K]) (ha : a ∈ (𝓂[K] ^ n : Ideal 𝒪[K])) :
    ((principalUnitOneAddOfMemPowSubgroup K hn a ha : principalUnits K n) : 𝒪[K]ˣ) =
      principalUnitOneAddOfMemPow K hn a ha :=
  rfl
 

theorem exists_tendsto_principalUnitsCorrectionProduct_principalUnit
    (K : Type u) [Field K] [ValuativeRel K] [UniformSpace K] [IsUniformAddGroup K]
    [IsNonarchimedeanLocalField K] (n : Nat) (hn : 1 ≤ n)
    (z : ∀ d : Nat, principalUnits K (n + d)) :
    ∃ x : principalUnits K n, Tendsto
      (fun d : Nat => ((principalUnitsCorrectionProduct K n z d : 𝒪[K]ˣ) : 𝒪[K]))
      atTop (nhds (((x : principalUnits K n) : 𝒪[K]ˣ) : 𝒪[K])) := by
  rcases exists_tendsto_principalUnitsCorrectionProduct_sub_one_mem K n z with
    ⟨x, hx, hmem⟩
  let u : principalUnits K n :=
    principalUnitOneAddOfMemPowSubgroup K hn (x - 1) hmem
  refine ⟨u, ?_⟩
  have huval : (((u : principalUnits K n) : 𝒪[K]ˣ) : 𝒪[K]) = x := by
    change ((principalUnitOneAddOfMemPow K hn (x - 1) hmem : 𝒪[K]ˣ) : 𝒪[K]) = x
    rw [principalUnitOneAddOfMemPow_val]
    ring
  simpa [huval] using hx
 
noncomputable def principalUnitsSuccQuotOfIdealPow
    (K : Type u) [Field K] [ValuativeRel K] (n : Nat) (hn : 1 ≤ n) :
    (𝓂[K] ^ n : Ideal 𝒪[K]) → PrincipalUnitsSuccQuot K n :=
  fun a =>
    principalUnitsSuccQuotMk K n
      (principalUnitOneAddOfMemPowSubgroup K hn a.1 a.2)
 
@[simp]
theorem principalUnitsSuccQuotOfIdealPow_apply
    (K : Type u) [Field K] [ValuativeRel K] (n : Nat) (hn : 1 ≤ n)
    (a : (𝓂[K] ^ n : Ideal 𝒪[K])) :
    principalUnitsSuccQuotOfIdealPow K n hn a =
      principalUnitsSuccQuotMk K n
        (principalUnitOneAddOfMemPowSubgroup K hn a.1 a.2) :=
  rfl
 
theorem principalUnitsSuccQuotOfIdealPow_eq_one_of_mem_succ
    (K : Type u) [Field K] [ValuativeRel K] (n : Nat) (hn : 1 ≤ n)
    (a : (𝓂[K] ^ n : Ideal 𝒪[K]))
    (ha : (a : 𝒪[K]) ∈ (𝓂[K] ^ (n + 1) : Ideal 𝒪[K])) :
    principalUnitsSuccQuotOfIdealPow K n hn a = 1 := by
  apply (principalUnitsSuccQuotMk_eq_one_iff K n _).2
  rw [mem_principalUnits_succ_subgroupOf_iff]
  simp [principalUnitOneAddOfMemPowSubgroup, principalUnitOneAddOfMemPow_val, ha]
 
theorem principalUnitsSuccQuotOfIdealPow_eq_of_sub_mem_succ
    (K : Type u) [Field K] [ValuativeRel K] (n : Nat) (hn : 1 ≤ n)
    (a b : (𝓂[K] ^ n : Ideal 𝒪[K]))
    (hab : ((a : 𝒪[K]) - (b : 𝒪[K])) ∈ (𝓂[K] ^ (n + 1) : Ideal 𝒪[K])) :
    principalUnitsSuccQuotOfIdealPow K n hn a =
      principalUnitsSuccQuotOfIdealPow K n hn b := by
  apply (principalUnitsSuccQuotMk_eq_iff_div_mem K n _ _).2
  rw [mem_principalUnits_succ_subgroupOf_iff]
  change (((principalUnitOneAddOfMemPow K hn (a : 𝒪[K]) a.2 /
            principalUnitOneAddOfMemPow K hn (b : 𝒪[K]) b.2 : 𝒪[K]ˣ) : 𝒪[K]) - 1) ∈
    (𝓂[K] ^ (n + 1) : Ideal 𝒪[K])
  rw [show (((principalUnitOneAddOfMemPow K hn (a : 𝒪[K]) a.2 /
            principalUnitOneAddOfMemPow K hn (b : 𝒪[K]) b.2 : 𝒪[K]ˣ) : 𝒪[K]) - 1) =
      ((a : 𝒪[K]) - (b : 𝒪[K])) *
        ↑(principalUnitOneAddOfMemPow K hn (b : 𝒪[K]) b.2)⁻¹ by
    simp only [div_eq_mul_inv, Units.val_mul]
    rw [principalUnitOneAddOfMemPow_val K hn (a : 𝒪[K]) a.2]
    have hbval :
        ((principalUnitOneAddOfMemPow K hn (b : 𝒪[K]) b.2 : 𝒪[K]ˣ) : 𝒪[K]) =
          1 + (b : 𝒪[K]) :=
      principalUnitOneAddOfMemPow_val K hn (b : 𝒪[K]) b.2
    have hbinv :
        ((principalUnitOneAddOfMemPow K hn (b : 𝒪[K]) b.2 : 𝒪[K]ˣ) : 𝒪[K]) *
          ↑(principalUnitOneAddOfMemPow K hn (b : 𝒪[K]) b.2)⁻¹ = 1 := by
      simp
    calc
      (1 + (a : 𝒪[K])) * ↑(principalUnitOneAddOfMemPow K hn ↑b b.2)⁻¹ - 1 =
          (1 + (a : 𝒪[K])) * ↑(principalUnitOneAddOfMemPow K hn ↑b b.2)⁻¹ -
            ((principalUnitOneAddOfMemPow K hn ↑b b.2 : 𝒪[K]ˣ) : 𝒪[K]) *
              ↑(principalUnitOneAddOfMemPow K hn ↑b b.2)⁻¹ := by
        rw [hbinv]
      _ = (↑a - ↑b) * ↑(principalUnitOneAddOfMemPow K hn ↑b b.2)⁻¹ := by
        rw [hbval]
        ring]
  exact (𝓂[K] ^ (n + 1) : Ideal 𝒪[K]).mul_mem_right _ hab
 
noncomputable def principalUnitsSuccQuotOfMaximalIdealPowSuccQuot
    (K : Type u) [Field K] [ValuativeRel K] (n : Nat) (hn : 1 ≤ n) :
    MaximalIdealPowSuccQuot K n → PrincipalUnitsSuccQuot K n :=
  maximalIdealPowSuccQuotLift n
    (principalUnitsSuccQuotOfIdealPow K n hn)
    (fun a b hab =>
      principalUnitsSuccQuotOfIdealPow_eq_of_sub_mem_succ K n hn a b (by
        simpa using
          (mem_maximalIdealPowSuccSubmodule_iff K n (a - b)).1 hab))
 

@[simp]
theorem principalUnitsSuccQuotOfMaximalIdealPowSuccQuot_mk
    (K : Type u) [Field K] [ValuativeRel K] (n : Nat) (hn : 1 ≤ n)
    (a : (𝓂[K] ^ n : Ideal 𝒪[K])) :
    principalUnitsSuccQuotOfMaximalIdealPowSuccQuot K n hn
        (maximalIdealPowSuccQuotMk K n a) =
      principalUnitsSuccQuotOfIdealPow K n hn a :=
  rfl
 
theorem maximalIdealPow_mul_mem_succ
    (K : Type u) [Field K] [ValuativeRel K] {n : Nat} (hn : 1 ≤ n)
    (a b : (𝓂[K] ^ n : Ideal 𝒪[K])) :
    ((a : 𝒪[K]) * (b : 𝒪[K])) ∈ (𝓂[K] ^ (n + 1) : Ideal 𝒪[K]) := by
  have hmul : ((a : 𝒪[K]) * (b : 𝒪[K])) ∈ (𝓂[K] ^ (n + n) : Ideal 𝒪[K]) := by
    simpa [pow_add] using (Ideal.mul_mem_mul a.2 b.2)
  have hle : (𝓂[K] ^ (n + n) : Ideal 𝒪[K]) ≤
      (𝓂[K] ^ (n + 1) : Ideal 𝒪[K]) :=
    Ideal.pow_le_pow_right (Nat.add_le_add_left hn n)
  exact hle hmul
 
@[simp]
theorem principalUnitsSuccQuotOfIdealPow_zero
    (K : Type u) [Field K] [ValuativeRel K] (n : Nat) (hn : 1 ≤ n) :
    principalUnitsSuccQuotOfIdealPow K n hn (0 : (𝓂[K] ^ n : Ideal 𝒪[K])) = 1 := by
  apply principalUnitsSuccQuotOfIdealPow_eq_one_of_mem_succ
  simp
 

theorem principalUnitsSuccQuotOfIdealPow_add
    (K : Type u) [Field K] [ValuativeRel K] (n : Nat) (hn : 1 ≤ n)
    (a b : (𝓂[K] ^ n : Ideal 𝒪[K])) :
    principalUnitsSuccQuotOfIdealPow K n hn (a + b) =
      principalUnitsSuccQuotOfIdealPow K n hn a *
        principalUnitsSuccQuotOfIdealPow K n hn b := by
  rw [principalUnitsSuccQuotOfIdealPow_apply,
    principalUnitsSuccQuotOfIdealPow_apply,
    principalUnitsSuccQuotOfIdealPow_apply,
    ← (principalUnitsSuccQuotMk K n).map_mul]
  symm
  apply (principalUnitsSuccQuotMk_eq_iff_div_mem K n _ _).2
  rw [mem_principalUnits_succ_subgroupOf_iff]
  change ((((principalUnitOneAddOfMemPow K hn (a : 𝒪[K]) a.2 *
              principalUnitOneAddOfMemPow K hn (b : 𝒪[K]) b.2 : 𝒪[K]ˣ) /
            principalUnitOneAddOfMemPow K hn
              ((a + b : (𝓂[K] ^ n : Ideal 𝒪[K])) : 𝒪[K]) (a + b).2 :
              𝒪[K]ˣ) : 𝒪[K]) - 1) ∈
    (𝓂[K] ^ (n + 1) : Ideal 𝒪[K])
  rw [show ((((principalUnitOneAddOfMemPow K hn (a : 𝒪[K]) a.2 *
              principalUnitOneAddOfMemPow K hn (b : 𝒪[K]) b.2 : 𝒪[K]ˣ) /
            principalUnitOneAddOfMemPow K hn
              ((a + b : (𝓂[K] ^ n : Ideal 𝒪[K])) : 𝒪[K]) (a + b).2 :
              𝒪[K]ˣ) : 𝒪[K]) - 1) =
      ((a : 𝒪[K]) * (b : 𝒪[K])) *
        ↑(principalUnitOneAddOfMemPow K hn
          ((a + b : (𝓂[K] ^ n : Ideal 𝒪[K])) : 𝒪[K]) (a + b).2)⁻¹ by
    simp only [div_eq_mul_inv, Units.val_mul]
    rw [principalUnitOneAddOfMemPow_val K hn (a : 𝒪[K]) a.2,
      principalUnitOneAddOfMemPow_val K hn (b : 𝒪[K]) b.2]
    have habval :
        ((principalUnitOneAddOfMemPow K hn
            ((a + b : (𝓂[K] ^ n : Ideal 𝒪[K])) : 𝒪[K]) (a + b).2 : 𝒪[K]ˣ) :
            𝒪[K]) =
          1 + (a : 𝒪[K]) + (b : 𝒪[K]) := by
      rw [principalUnitOneAddOfMemPow_val K hn
        ((a + b : (𝓂[K] ^ n : Ideal 𝒪[K])) : 𝒪[K]) (a + b).2]
      change 1 + ((a : 𝒪[K]) + (b : 𝒪[K])) = 1 + (a : 𝒪[K]) + (b : 𝒪[K])
      ring
    have habinv :
        ((principalUnitOneAddOfMemPow K hn
            ((a + b : (𝓂[K] ^ n : Ideal 𝒪[K])) : 𝒪[K]) (a + b).2 : 𝒪[K]ˣ) :
            𝒪[K]) *
          ↑(principalUnitOneAddOfMemPow K hn
            ((a + b : (𝓂[K] ^ n : Ideal 𝒪[K])) : 𝒪[K]) (a + b).2)⁻¹ = 1 := by
      simp
    calc
      ((1 + (a : 𝒪[K])) * (1 + (b : 𝒪[K]))) *
            ↑(principalUnitOneAddOfMemPow K hn
              ((a + b : (𝓂[K] ^ n : Ideal 𝒪[K])) : 𝒪[K]) (a + b).2)⁻¹ - 1 =
          ((1 + (a : 𝒪[K])) * (1 + (b : 𝒪[K]))) *
              ↑(principalUnitOneAddOfMemPow K hn
                ((a + b : (𝓂[K] ^ n : Ideal 𝒪[K])) : 𝒪[K]) (a + b).2)⁻¹ -
            ((principalUnitOneAddOfMemPow K hn
                ((a + b : (𝓂[K] ^ n : Ideal 𝒪[K])) : 𝒪[K]) (a + b).2 :
                𝒪[K]ˣ) : 𝒪[K]) *
              ↑(principalUnitOneAddOfMemPow K hn
                ((a + b : (𝓂[K] ^ n : Ideal 𝒪[K])) : 𝒪[K]) (a + b).2)⁻¹ := by
        rw [habinv]
      _ = ((a : 𝒪[K]) * (b : 𝒪[K])) *
          ↑(principalUnitOneAddOfMemPow K hn
            ((a + b : (𝓂[K] ^ n : Ideal 𝒪[K])) : 𝒪[K]) (a + b).2)⁻¹ := by
        rw [habval]
        ring]
  exact (𝓂[K] ^ (n + 1) : Ideal 𝒪[K]).mul_mem_right _
    (maximalIdealPow_mul_mem_succ K hn a b)
 
@[simp]
theorem principalUnitsSuccQuotOfMaximalIdealPowSuccQuot_map_zero
    (K : Type u) [Field K] [ValuativeRel K] (n : Nat) (hn : 1 ≤ n) :
    principalUnitsSuccQuotOfMaximalIdealPowSuccQuot K n hn 0 = 1 := by
  rw [← map_zero (maximalIdealPowSuccQuotMk K n)]
  change principalUnitsSuccQuotOfMaximalIdealPowSuccQuot K n hn
      (maximalIdealPowSuccQuotMk K n (0 : (𝓂[K] ^ n : Ideal 𝒪[K]))) = 1
  rw [principalUnitsSuccQuotOfMaximalIdealPowSuccQuot_mk]
  exact principalUnitsSuccQuotOfIdealPow_zero K n hn
 
theorem principalUnitsSuccQuotOfMaximalIdealPowSuccQuot_map_add
    (K : Type u) [Field K] [ValuativeRel K] (n : Nat) (hn : 1 ≤ n)
    (x y : MaximalIdealPowSuccQuot K n) :
    principalUnitsSuccQuotOfMaximalIdealPowSuccQuot K n hn (x + y) =
      principalUnitsSuccQuotOfMaximalIdealPowSuccQuot K n hn x *
        principalUnitsSuccQuotOfMaximalIdealPowSuccQuot K n hn y := by
  refine MaximalIdealPowSuccQuot.inductionOn₂ n
    (motive := fun x' y' =>
      principalUnitsSuccQuotOfMaximalIdealPowSuccQuot K n hn (x' + y') =
        principalUnitsSuccQuotOfMaximalIdealPowSuccQuot K n hn x' *
          principalUnitsSuccQuotOfMaximalIdealPowSuccQuot K n hn y') x y ?_
  intro a b
  let qa : MaximalIdealPowSuccQuot K n := maximalIdealPowSuccQuotMk K n a
  let qb : MaximalIdealPowSuccQuot K n := maximalIdealPowSuccQuotMk K n b
  have hleft :
      principalUnitsSuccQuotOfMaximalIdealPowSuccQuot K n hn (qa + qb) =
        principalUnitsSuccQuotOfMaximalIdealPowSuccQuot K n hn
          (maximalIdealPowSuccQuotMk K n (a + b)) := by
    have hadd : qa + qb = maximalIdealPowSuccQuotMk K n (a + b) := by
      exact (map_add (maximalIdealPowSuccQuotMk K n) a b).symm
    exact congrArg (principalUnitsSuccQuotOfMaximalIdealPowSuccQuot K n hn) hadd
  have hrep :
      principalUnitsSuccQuotOfMaximalIdealPowSuccQuot K n hn
          (maximalIdealPowSuccQuotMk K n (a + b)) =
        principalUnitsSuccQuotOfMaximalIdealPowSuccQuot K n hn qa *
          principalUnitsSuccQuotOfMaximalIdealPowSuccQuot K n hn qb := by
    dsimp [qa, qb]
    change principalUnitsSuccQuotOfMaximalIdealPowSuccQuot K n hn
        (maximalIdealPowSuccQuotMk K n (a + b)) =
      principalUnitsSuccQuotOfMaximalIdealPowSuccQuot K n hn
        (maximalIdealPowSuccQuotMk K n a) *
      principalUnitsSuccQuotOfMaximalIdealPowSuccQuot K n hn
        (maximalIdealPowSuccQuotMk K n b)
    rw [principalUnitsSuccQuotOfMaximalIdealPowSuccQuot_mk,
      principalUnitsSuccQuotOfMaximalIdealPowSuccQuot_mk,
      principalUnitsSuccQuotOfMaximalIdealPowSuccQuot_mk]
    exact principalUnitsSuccQuotOfIdealPow_add K n hn a b
  exact hleft.trans hrep
 
noncomputable def principalUnitsSuccQuotOfMaximalIdealPowSuccQuotAdd
    (K : Type u) [Field K] [ValuativeRel K] (n : Nat) (hn : 1 ≤ n) :
    MaximalIdealPowSuccQuot K n →+ Additive (PrincipalUnitsSuccQuot K n) where
  toFun x := Additive.ofMul (principalUnitsSuccQuotOfMaximalIdealPowSuccQuot K n hn x)
  map_zero' := by
    change Additive.ofMul (principalUnitsSuccQuotOfMaximalIdealPowSuccQuot K n hn 0) = 0
    simp [principalUnitsSuccQuotOfMaximalIdealPowSuccQuot_map_zero]
  map_add' x y := by
    change Additive.ofMul (principalUnitsSuccQuotOfMaximalIdealPowSuccQuot K n hn (x + y)) =
      Additive.ofMul (principalUnitsSuccQuotOfMaximalIdealPowSuccQuot K n hn x *
        principalUnitsSuccQuotOfMaximalIdealPowSuccQuot K n hn y)
    rw [principalUnitsSuccQuotOfMaximalIdealPowSuccQuot_map_add]
 
theorem principalUnitsSuccQuotOfIdealPow_eq_one_iff
    (K : Type u) [Field K] [ValuativeRel K] (n : Nat) (hn : 1 ≤ n)
    (a : (𝓂[K] ^ n : Ideal 𝒪[K])) :
    principalUnitsSuccQuotOfIdealPow K n hn a = 1 ↔
      (a : 𝒪[K]) ∈ (𝓂[K] ^ (n + 1) : Ideal 𝒪[K]) := by
  constructor
  · intro h
    have hmem := (principalUnitsSuccQuotMk_eq_one_iff K n _).1 h
    rw [mem_principalUnits_succ_subgroupOf_iff] at hmem
    simpa [principalUnitsSuccQuotOfIdealPow, principalUnitOneAddOfMemPowSubgroup,
      principalUnitOneAddOfMemPow_val] using hmem
  · intro ha
    exact principalUnitsSuccQuotOfIdealPow_eq_one_of_mem_succ K n hn a ha
 

theorem principalUnitsSuccQuotOfMaximalIdealPowSuccQuot_eq_one_iff
    (K : Type u) [Field K] [ValuativeRel K] (n : Nat) (hn : 1 ≤ n)
    (x : MaximalIdealPowSuccQuot K n) :
    principalUnitsSuccQuotOfMaximalIdealPowSuccQuot K n hn x = 1 ↔ x = 0 := by
  refine MaximalIdealPowSuccQuot.inductionOn n
    (motive := fun x' =>
      principalUnitsSuccQuotOfMaximalIdealPowSuccQuot K n hn x' = 1 ↔ x' = 0)
    x ?_
  intro a
  rw [← map_zero (maximalIdealPowSuccQuotMk K n)]
  change principalUnitsSuccQuotOfMaximalIdealPowSuccQuot K n hn
      (maximalIdealPowSuccQuotMk K n a) = 1 ↔
    (maximalIdealPowSuccQuotMk K n a : MaximalIdealPowSuccQuot K n) = 0
  rw [principalUnitsSuccQuotOfMaximalIdealPowSuccQuot_mk,
    maximalIdealPowSuccQuotMk_eq_zero_iff]
  exact principalUnitsSuccQuotOfIdealPow_eq_one_iff K n hn a
 
theorem principalUnitsSuccQuotOfMaximalIdealPowSuccQuot_surjective
    (K : Type u) [Field K] [ValuativeRel K] (n : Nat) (hn : 1 ≤ n) :
    Function.Surjective (principalUnitsSuccQuotOfMaximalIdealPowSuccQuot K n hn) := by
  intro x
  rcases principalUnitsSuccQuotMk_surjective K n x with ⟨u, rfl⟩
  let a0 : 𝒪[K] := ((u : 𝒪[K]ˣ) : 𝒪[K]) - 1
  have ha0 : a0 ∈ (𝓂[K] ^ n : Ideal 𝒪[K]) := by
    dsimp [a0]
    exact (mem_principalUnits_iff K (u : 𝒪[K]ˣ) n).1 u.2
  let a : (𝓂[K] ^ n : Ideal 𝒪[K]) := ⟨a0, ha0⟩
  refine ⟨maximalIdealPowSuccQuotMk K n a, ?_⟩
  rw [principalUnitsSuccQuotOfMaximalIdealPowSuccQuot_mk,
    principalUnitsSuccQuotOfIdealPow_apply]
  congr 1
  dsimp [a]
  apply Subtype.ext
  rw [principalUnitOneAddOfMemPowSubgroup_val]
  apply Units.ext
  rw [principalUnitOneAddOfMemPow_val]
  dsimp [a0]
  ring
 

theorem principalUnitsSuccQuotOfMaximalIdealPowSuccQuotAdd_surjective
    (K : Type u) [Field K] [ValuativeRel K] (n : Nat) (hn : 1 ≤ n) :
    Function.Surjective (principalUnitsSuccQuotOfMaximalIdealPowSuccQuotAdd K n hn) := by
  intro y
  rcases principalUnitsSuccQuotOfMaximalIdealPowSuccQuot_surjective K n hn
      (Additive.toMul y) with ⟨x, hx⟩
  refine ⟨x, ?_⟩
  change Additive.ofMul (principalUnitsSuccQuotOfMaximalIdealPowSuccQuot K n hn x) = y
  rw [hx]
  rfl
 
theorem principalUnitsSuccQuotOfMaximalIdealPowSuccQuotAdd_injective
    (K : Type u) [Field K] [ValuativeRel K] (n : Nat) (hn : 1 ≤ n) :
    Function.Injective (principalUnitsSuccQuotOfMaximalIdealPowSuccQuotAdd K n hn) := by
  intro x y hxy
  have hzero : principalUnitsSuccQuotOfMaximalIdealPowSuccQuotAdd K n hn (x - y) = 0 := by
    rw [map_sub, hxy, sub_self]
  have hmul : principalUnitsSuccQuotOfMaximalIdealPowSuccQuot K n hn (x - y) = 1 := by
    change Additive.ofMul (principalUnitsSuccQuotOfMaximalIdealPowSuccQuot K n hn (x - y)) =
      Additive.ofMul (1 : PrincipalUnitsSuccQuot K n) at hzero
    exact Additive.ofMul.injective hzero
  have hxmy : x - y = 0 :=
    (principalUnitsSuccQuotOfMaximalIdealPowSuccQuot_eq_one_iff K n hn (x - y)).1 hmul
  exact sub_eq_zero.mp hxmy
 
noncomputable def maximalIdealPowSuccQuotAddEquivPrincipalUnitsSuccQuot
    (K : Type u) [Field K] [ValuativeRel K] (n : Nat) (hn : 1 ≤ n) :
    MaximalIdealPowSuccQuot K n ≃+ Additive (PrincipalUnitsSuccQuot K n) :=
  AddEquiv.ofBijective (principalUnitsSuccQuotOfMaximalIdealPowSuccQuotAdd K n hn)
    ⟨principalUnitsSuccQuotOfMaximalIdealPowSuccQuotAdd_injective K n hn,
      principalUnitsSuccQuotOfMaximalIdealPowSuccQuotAdd_surjective K n hn⟩
end
end LocalFieldTheory
end

/- ValuedFieldTheory.LocalField.NonarchimedeanLocalField.IdealQuotients -/
section
namespace LocalFieldTheory
noncomputable section
universe u
open scoped ValuativeRel
 




def integerRingModMaximalIdealAddEquivResidue
    (K : Type u) [Field K] [ValuativeRel K] :
    (𝒪[K] ⧸ (𝓂[K] : Ideal 𝒪[K])) ≃+ 𝓀[K] :=
  AddEquiv.refl _
 

def chosenIntegerRingUniformizer
    (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] : 𝒪[K] :=
  Classical.choose (IsDiscreteValuationRing.exists_irreducible 𝒪[K])
 
theorem chosenIntegerRingUniformizer_irreducible
    (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] :
    Irreducible (chosenIntegerRingUniformizer K) :=
  Classical.choose_spec (IsDiscreteValuationRing.exists_irreducible 𝒪[K])
 
theorem chosenIntegerRingUniformizer_maximalIdeal_eq
    (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] :
    (𝓂[K] : Ideal 𝒪[K]) = Ideal.span ({chosenIntegerRingUniformizer K} : Set 𝒪[K]) :=
  (chosenIntegerRingUniformizer_irreducible K).maximalIdeal_eq
 




def integerRingUniformizerFieldUnit
    (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] : Kˣ :=
  Units.mk0 (((chosenIntegerRingUniformizer K : 𝒪[K]) : K)) (by
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
    [IsNonarchimedeanLocalField K] (ϖ : 𝒪[K]) (hϖ : Irreducible ϖ) :
    IsNonarchimedeanLocalField.valueGroupWithZeroIsoInt K
        (ValuativeRel.valuation K ((ϖ : 𝒪[K]) : K)) =
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
    · let y : 𝒪[K] := ⟨x, by
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
      have hym : y ∈ (𝓂[K] : Ideal 𝒪[K]) := by
        rw [IsLocalRing.mem_maximalIdeal]
        simpa [nonunits] using hynot
      have hyspan : y ∈
          (Ideal.span ({ϖ} : Set 𝒪[K]) : Ideal 𝒪[K]) := by
        simpa [hϖ.maximalIdeal_eq] using hym
      have hset := Valuation.integer.coe_span_singleton_eq_setOfPred_le_v_coe
        (v := ValuativeRel.valuation K) ϖ
      have hyle : ValuativeRel.valuation K (y : K) ≤
          ValuativeRel.valuation K ((ϖ : 𝒪[K]) : K) := by
        have hyspanSet : y ∈
            ((Ideal.span ({ϖ} : Set 𝒪[K]) : Ideal 𝒪[K]) : Set 𝒪[K]) := hyspan
        rw [hset] at hyspanSet
        exact hyspanSet
      simpa [y, hx] using hyle
 

theorem v_integerRingIrreducibleFieldUnit
    (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (ϖ : 𝒪[K]) (hϖ : Irreducible ϖ)
    (u : Kˣ) (hu : (u : K) = ((ϖ : 𝒪[K]) : K)) :
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
    [IsNonarchimedeanLocalField K] (ϖ : 𝒪[K]) (hϖ : Irreducible ϖ)
    (u : Kˣ) (hu : (u : K) = ((ϖ : 𝒪[K]) : K)) :
    LocalFieldTheory.IsNonarchimedeanLocalField.v K (Additive.ofMul u⁻¹) = 1 := by
  rw [LocalFieldTheory.IsNonarchimedeanLocalField.v_inv]
  rw [v_integerRingIrreducibleFieldUnit K ϖ hϖ u hu]
  norm_num
 


theorem v_inverseIntegerRingUniformizerFieldUnit
    (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] :
    LocalFieldTheory.IsNonarchimedeanLocalField.v K
      (Additive.ofMul (inverseIntegerRingUniformizerFieldUnit K)) = 1 := by
  rw [inverseIntegerRingUniformizerFieldUnit]
  exact v_integerRingIrreducibleFieldUnit_inv K
    (chosenIntegerRingUniformizer K) (chosenIntegerRingUniformizer_irreducible K)
    (integerRingUniformizerFieldUnit K) rfl
 






theorem exists_chosenIntegerRingUniformizer_pow_mul_mem_integerRing
    (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (x : K) :
    ∃ n : Nat,
      (((chosenIntegerRingUniformizer K : 𝒪[K]) : K) ^ n) * x ∈ 𝒪[K] := by
  obtain ⟨a, b, hb, hfrac⟩ := IsFractionRing.div_surjective (A := 𝒪[K]) x
  have hb_ne : b ≠ 0 := nonZeroDivisors.ne_zero hb
  obtain ⟨n, u, hb_factor⟩ :=
    IsDiscreteValuationRing.eq_unit_mul_pow_irreducible hb_ne
      (chosenIntegerRingUniformizer_irreducible K)
  refine ⟨n, ?_⟩
  rw [← hfrac, hb_factor]
  have hϖ_ne : (((chosenIntegerRingUniformizer K : 𝒪[K]) : K)) ≠ 0 := by
    intro h
    exact (chosenIntegerRingUniformizer_irreducible K).ne_zero
      ((IsFractionRing.injective 𝒪[K] K) h)
  have hϖ_pow_ne :
      (((chosenIntegerRingUniformizer K : 𝒪[K]) : K) ^ n) ≠ 0 :=
    pow_ne_zero n hϖ_ne
  have hu_ne : (((u : 𝒪[K]) : K)) ≠ 0 := by
    intro h
    exact u.ne_zero ((IsFractionRing.injective 𝒪[K] K) h)
  have hclear :
      (((chosenIntegerRingUniformizer K : 𝒪[K]) : K) ^ n) *
          ((a : K) /
            (((u : 𝒪[K]) * chosenIntegerRingUniformizer K ^ n : 𝒪[K]) : K)) =
        ((a * ↑u⁻¹ : 𝒪[K]) : K) := by
    calc
      (((chosenIntegerRingUniformizer K : 𝒪[K]) : K) ^ n) *
          ((a : K) /
            (((u : 𝒪[K]) * chosenIntegerRingUniformizer K ^ n : 𝒪[K]) : K))
          =
          (((chosenIntegerRingUniformizer K : 𝒪[K]) : K) ^ n) *
            ((a : K) / (((u : 𝒪[K]) : K) *
              (((chosenIntegerRingUniformizer K : 𝒪[K]) : K) ^ n))) := by
            simp
      _ = (a : K) * (((u : 𝒪[K]) : K))⁻¹ := by
            field_simp [hu_ne, hϖ_pow_ne]
      _ = ((a * ↑u⁻¹ : 𝒪[K]) : K) := by
            have hu_inv :
                (((↑u⁻¹ : 𝒪[K]) : K)) = (((u : 𝒪[K]) : K))⁻¹ := by
              exact map_units_inv (algebraMap 𝒪[K] K) u
            rw [← hu_inv]
            simp
  change (((chosenIntegerRingUniformizer K : 𝒪[K]) : K) ^ n) *
      ((a : K) /
        (((u : 𝒪[K]) * chosenIntegerRingUniformizer K ^ n : 𝒪[K]) : K)) ∈ 𝒪[K]
  rw [hclear]
  exact (a * ↑u⁻¹ : 𝒪[K]).2
 

theorem maximalIdeal_pow_eq_span_uniformizer_pow_of_irreducible
    (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (ϖ : 𝒪[K]) (hϖ : Irreducible ϖ) (n : Nat) :
    (𝓂[K] ^ n : Ideal 𝒪[K]) = Ideal.span ({ϖ ^ n} : Set 𝒪[K]) := by
  rw [hϖ.maximalIdeal_eq, Ideal.span_singleton_pow]
 
theorem maximalIdeal_pow_eq_span_uniformizer_pow
    (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (n : Nat) :
    (𝓂[K] ^ n : Ideal 𝒪[K]) =
      Ideal.span ({chosenIntegerRingUniformizer K ^ n} : Set 𝒪[K]) :=
  maximalIdeal_pow_eq_span_uniformizer_pow_of_irreducible K
    (chosenIntegerRingUniformizer K) (chosenIntegerRingUniformizer_irreducible K) n
 

theorem mul_uniformizer_pow_mem_maximalIdeal_pow
    (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (ϖ : 𝒪[K]) (hϖ : Irreducible ϖ)
    (n : Nat) (r : 𝒪[K]) :
    r * ϖ ^ n ∈ (𝓂[K] ^ n : Ideal 𝒪[K]) := by
  rw [maximalIdeal_pow_eq_span_uniformizer_pow_of_irreducible K ϖ hϖ n]
  rw [Ideal.mem_span_singleton]
  exact ⟨r, by rw [mul_comm]⟩
 

theorem mul_uniformizer_pow_mem_maximalIdeal_pow_succ_iff
    (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (ϖ : 𝒪[K]) (hϖ : Irreducible ϖ)
    (n : Nat) (r : 𝒪[K]) :
    r * ϖ ^ n ∈ (𝓂[K] ^ (n + 1) : Ideal 𝒪[K]) ↔
      r ∈ (𝓂[K] : Ideal 𝒪[K]) := by
  rw [hϖ.maximalIdeal_eq, Ideal.span_singleton_pow]
  rw [Ideal.mem_span_singleton, Ideal.mem_span_singleton]
  constructor
  · rintro ⟨c, hc⟩
    refine ⟨c, ?_⟩
    have hne : ϖ ^ n ≠ 0 := pow_ne_zero n hϖ.ne_zero
    have hcancel : r * ϖ ^ n = (ϖ * c) * ϖ ^ n := by
      calc
        r * ϖ ^ n = ϖ ^ (n + 1) * c := hc
        _ = (ϖ * c) * ϖ ^ n := by
          rw [pow_succ']
          ring
    exact mul_right_cancel₀ hne hcancel
  · rintro ⟨c, hc⟩
    refine ⟨c, ?_⟩
    rw [hc]
    rw [pow_succ']
    ring
 
def maximalIdealPowMulUniformizerPowMap
    (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (ϖ : 𝒪[K]) (hϖ : Irreducible ϖ)
    (n : Nat) :
    𝒪[K] →ₗ[𝒪[K]] ((𝓂[K] ^ n : Ideal 𝒪[K]) : Type u) where
  toFun r := ⟨r * ϖ ^ n, mul_uniformizer_pow_mem_maximalIdeal_pow K ϖ hϖ n r⟩
  map_add' r s := by
    ext
    simp [add_mul]
  map_smul' a r := by
    ext
    simp [mul_assoc]
 
def maximalIdealPowSuccQuotMulUniformizerPowMap
    (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (ϖ : 𝒪[K]) (hϖ : Irreducible ϖ)
    (n : Nat) :
    𝒪[K] →ₗ[𝒪[K]] MaximalIdealPowSuccQuot K n :=
  (maximalIdealPowSuccQuotMk K n).comp
    (maximalIdealPowMulUniformizerPowMap K ϖ hϖ n)
 
theorem maximalIdealPowSuccQuotMulUniformizerPowMap_ker
    (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (ϖ : 𝒪[K]) (hϖ : Irreducible ϖ)
    (n : Nat) :
    LinearMap.ker (maximalIdealPowSuccQuotMulUniformizerPowMap K ϖ hϖ n) =
      (𝓂[K] : Ideal 𝒪[K]) := by
  ext r
  rw [LinearMap.mem_ker]
  change maximalIdealPowSuccQuotMk K n
      (maximalIdealPowMulUniformizerPowMap K ϖ hϖ n r) = 0 ↔
    r ∈ (𝓂[K] : Ideal 𝒪[K])
  rw [maximalIdealPowSuccQuotMk_eq_zero_iff]
  change r * ϖ ^ n ∈ (𝓂[K] ^ (n + 1) : Ideal 𝒪[K]) ↔
    r ∈ (𝓂[K] : Ideal 𝒪[K])
  exact mul_uniformizer_pow_mem_maximalIdeal_pow_succ_iff K ϖ hϖ n r
 

theorem maximalIdealPowSuccQuotMulUniformizerPowMap_surjective
    (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (ϖ : 𝒪[K]) (hϖ : Irreducible ϖ)
    (n : Nat) :
    Function.Surjective (maximalIdealPowSuccQuotMulUniformizerPowMap K ϖ hϖ n) := by
  intro x
  refine MaximalIdealPowSuccQuot.inductionOn n
    (motive := fun x' =>
      ∃ r, maximalIdealPowSuccQuotMulUniformizerPowMap K ϖ hϖ n r = x')
    x ?_
  intro a
  have ha_span : (a : 𝒪[K]) ∈ Ideal.span ({ϖ ^ n} : Set 𝒪[K]) := by
    simpa [maximalIdeal_pow_eq_span_uniformizer_pow_of_irreducible K ϖ hϖ n] using a.2
  rcases (Ideal.mem_span_singleton.mp ha_span) with ⟨r, hr⟩
  refine ⟨r, ?_⟩
  change maximalIdealPowSuccQuotMk K n
      (maximalIdealPowMulUniformizerPowMap K ϖ hϖ n r) =
    maximalIdealPowSuccQuotMk K n a
  have hrep : maximalIdealPowMulUniformizerPowMap K ϖ hϖ n r = a := by
    ext
    simp [maximalIdealPowMulUniformizerPowMap, hr, mul_comm]
  rw [hrep]
 

def residueLinearEquivMaximalIdealPowSuccQuotOfIrreducible
    (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (ϖ : 𝒪[K]) (hϖ : Irreducible ϖ)
    (n : Nat) :
    𝓀[K] ≃ₗ[𝒪[K]] MaximalIdealPowSuccQuot K n :=
  (Submodule.quotEquivOfEq (𝓂[K] : Submodule 𝒪[K] 𝒪[K])
      (LinearMap.ker (maximalIdealPowSuccQuotMulUniformizerPowMap K ϖ hϖ n))
      (maximalIdealPowSuccQuotMulUniformizerPowMap_ker K ϖ hϖ n).symm).trans
    ((maximalIdealPowSuccQuotMulUniformizerPowMap K ϖ hϖ n).quotKerEquivOfSurjective
      (maximalIdealPowSuccQuotMulUniformizerPowMap_surjective K ϖ hϖ n))
 

def chosenResidueLinearEquivMaximalIdealPowSuccQuot
    (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (n : Nat) :
    𝓀[K] ≃ₗ[𝒪[K]] MaximalIdealPowSuccQuot K n :=
  residueLinearEquivMaximalIdealPowSuccQuotOfIrreducible K
    (chosenIntegerRingUniformizer K) (chosenIntegerRingUniformizer_irreducible K) n
 

def chosenResidueAddEquivMaximalIdealPowSuccQuot
    (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (n : Nat) :
    𝓀[K] ≃+ MaximalIdealPowSuccQuot K n :=
  (chosenResidueLinearEquivMaximalIdealPowSuccQuot K n).toAddEquiv
 

def principalUnitsSuccQuotAddEquivResidue
    (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (n : Nat) (hn : 1 ≤ n) :
    Additive (PrincipalUnitsSuccQuot K n) ≃+ 𝓀[K] :=
  (maximalIdealPowSuccQuotAddEquivPrincipalUnitsSuccQuot K n hn).symm.trans
    (chosenResidueAddEquivMaximalIdealPowSuccQuot K n).symm
 
theorem finite_principalUnitsSuccQuot
    (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (n : Nat) (hn : 1 ≤ n) :
    Finite (PrincipalUnitsSuccQuot K n) :=
  Finite.of_equiv 𝓀[K]
    ((Additive.ofMul.trans (principalUnitsSuccQuotAddEquivResidue K n hn).toEquiv).symm)
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
 
def additiveIntegerUnitsToFieldUnits (K : Type u) [Field K] [ValuativeRel K] :
    Additive 𝒪[K]ˣ →+ Additive Kˣ :=
  MonoidHom.toAdditive (integerUnitsToFieldUnits K)
 
def integerUnitOfValuationMapZero (K : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (x : Kˣ) (hx : valuationMap K (Additive.ofMul x) = 0) : 𝒪[K]ˣ where
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
 
theorem integerUnitsToFieldUnits_mem_range_iff_valuationMap_eq_zero (K : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (x : Kˣ) :
    x ∈ MonoidHom.range (integerUnitsToFieldUnits K) ↔
      valuationMap K (Additive.ofMul x) = 0 := by
  constructor
  · rintro ⟨u, rfl⟩
    rw [valuationMap_apply]
    exact v_integerUnitsToFieldUnits K u
  · intro hx
    exact ⟨integerUnitOfValuationMapZero K x hx,
      integerUnitOfValuationMapZero_spec K x hx⟩
 

theorem uniformizerUnitFactorValuationZero (K : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (ϖ x : Kˣ) (hϖ : valuationMap K (Additive.ofMul ϖ) = 1) :
    valuationMap K
      (Additive.ofMul (x / ϖ ^ valuationMap K (Additive.ofMul x))) = 0 := by
  rw [valuationMap_ofMul_div, valuationMap_ofMul_zpow, hϖ, mul_one, sub_self]
 
noncomputable def uniformizerUnitFactor (K : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (ϖ : Kˣ) (hϖ : valuationMap K (Additive.ofMul ϖ) = 1)
    (x : Kˣ) : 𝒪[K]ˣ :=
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
end IsNonarchimedeanLocalField
end
end LocalFieldTheory
end

/- ValuedFieldTheory.LocalField.NonarchimedeanLocalField.PrincipalUnitActions -/
section
namespace LocalFieldTheory
noncomputable section
universe u
open scoped ValuativeRel
 
theorem integerRingEquiv_mem_maximalIdeal
    (K : Type u) [Field K] [ValuativeRel K]
    (e : 𝒪[K] ≃+* 𝒪[K]) (x : 𝒪[K]) :
    e x ∈ (𝓂[K] : Ideal 𝒪[K]) ↔ x ∈ (𝓂[K] : Ideal 𝒪[K]) := by
  rw [IsLocalRing.mem_maximalIdeal, map_mem_nonunits_iff e,
    ← IsLocalRing.mem_maximalIdeal]
 
theorem integerRingEquiv_map_maximalIdeal
    (K : Type u) [Field K] [ValuativeRel K]
    (e : 𝒪[K] ≃+* 𝒪[K]) :
    Ideal.map e.toRingHom (𝓂[K] : Ideal 𝒪[K]) = (𝓂[K] : Ideal 𝒪[K]) := by
  ext y
  constructor
  · intro hy
    rcases (Ideal.mem_map_iff_of_surjective e.toRingHom e.surjective).1 hy with
      ⟨x, hx, rfl⟩
    exact (integerRingEquiv_mem_maximalIdeal K e x).2 hx
  · intro hy
    refine (Ideal.mem_map_iff_of_surjective e.toRingHom e.surjective).2 ?_
    refine ⟨e.symm y, ?_, by simp⟩
    have hy' : e (e.symm y) ∈ (𝓂[K] : Ideal 𝒪[K]) := by
      simpa using hy
    exact (integerRingEquiv_mem_maximalIdeal K e (e.symm y)).1 hy'
 
theorem integerRingEquiv_map_maximalIdeal_pow
    (K : Type u) [Field K] [ValuativeRel K]
    (e : 𝒪[K] ≃+* 𝒪[K]) (n : Nat) :
    Ideal.map e.toRingHom (𝓂[K] ^ n : Ideal 𝒪[K]) =
      (𝓂[K] ^ n : Ideal 𝒪[K]) := by
  rw [Ideal.map_pow, integerRingEquiv_map_maximalIdeal]
 
theorem integerRingEquiv_mem_maximalIdeal_pow
    (K : Type u) [Field K] [ValuativeRel K]
    (e : 𝒪[K] ≃+* 𝒪[K]) (n : Nat) (x : 𝒪[K]) :
    e x ∈ (𝓂[K] ^ n : Ideal 𝒪[K]) ↔ x ∈ (𝓂[K] ^ n : Ideal 𝒪[K]) := by
  constructor
  · intro hx
    have hxmap :
        e.symm (e x) ∈ Ideal.map e.symm.toRingHom (𝓂[K] ^ n : Ideal 𝒪[K]) :=
      Ideal.mem_map_of_mem e.symm.toRingHom hx
    rw [integerRingEquiv_map_maximalIdeal_pow K e.symm n] at hxmap
    simpa using hxmap
  · intro hx
    have hxmap : e x ∈ Ideal.map e.toRingHom (𝓂[K] ^ n : Ideal 𝒪[K]) :=
      Ideal.mem_map_of_mem e.toRingHom hx
    rw [integerRingEquiv_map_maximalIdeal_pow K e n] at hxmap
    exact hxmap
end
end LocalFieldTheory
end

/- ValuedFieldTheory.LocalField.NonarchimedeanLocalField.ResidueUnits -/
section
namespace LocalFieldTheory
noncomputable section
universe u
open scoped ValuativeRel
 
def ResidueUnits (K : Type u) [Field K] [ValuativeRel K] : Type u :=
  𝓀[K]ˣ
 
instance residueUnitsCommGroup
    (K : Type u) [Field K] [ValuativeRel K] :
    CommGroup (ResidueUnits K) := by
  change CommGroup 𝓀[K]ˣ
  infer_instance
 
def residueUnitsConcreteEquiv
    (K : Type u) [Field K] [ValuativeRel K] :
    ResidueUnits K ≃* 𝓀[K]ˣ := by
  change 𝓀[K]ˣ ≃* 𝓀[K]ˣ
  exact MulEquiv.refl _
 
noncomputable instance residueUnitsFinite
    (K : Type u) [Field K] [ValuativeRel K] [Finite 𝓀[K]] :
    Finite (ResidueUnits K) := by
  exact Finite.of_equiv 𝓀[K]ˣ (residueUnitsConcreteEquiv K).symm.toEquiv
 
abbrev IntegerUnitsModPrincipalUnits
    (K : Type u) [Field K] [ValuativeRel K] : Type u :=
  𝒪[K]ˣ ⧸ principalUnits K 1
 
instance integerUnitsModPrincipalUnitsCommGroup
    (K : Type u) [Field K] [ValuativeRel K] :
    CommGroup (IntegerUnitsModPrincipalUnits K) := by
  change CommGroup (𝒪[K]ˣ ⧸ principalUnits K 1)
  infer_instance
 
def integerUnitsModPrincipalUnitsConcreteEquiv
    (K : Type u) [Field K] [ValuativeRel K] :
    IntegerUnitsModPrincipalUnits K ≃*
      (𝒪[K]ˣ ⧸ principalUnits K 1) := by
  change (𝒪[K]ˣ ⧸ principalUnits K 1) ≃*
    (𝒪[K]ˣ ⧸ principalUnits K 1)
  exact MulEquiv.refl _
 
def integerUnitsToResidueUnits (K : Type u) [Field K] [ValuativeRel K] :
    𝒪[K]ˣ →* ResidueUnits K :=
  Units.map (IsLocalRing.residue 𝒪[K]).toMonoidHom
 

theorem integerUnitsToResidueUnits_apply (K : Type u) [Field K] [ValuativeRel K]
    (x : 𝒪[K]ˣ) :
    ((residueUnitsConcreteEquiv K (integerUnitsToResidueUnits K x) : 𝓀[K]ˣ) :
        𝓀[K]) =
      IsLocalRing.residue 𝒪[K] (x : 𝒪[K]) :=
  rfl
 
theorem mem_ker_integerUnitsToResidueUnits_iff (K : Type u) [Field K] [ValuativeRel K]
    (x : 𝒪[K]ˣ) :
    x ∈ (integerUnitsToResidueUnits K).ker ↔
      IsLocalRing.residue 𝒪[K] (x : 𝒪[K]) = 1 := by
  rw [MonoidHom.mem_ker]
  constructor
  · intro h
    have h' := congrArg (residueUnitsConcreteEquiv K) h
    have h'' := congrArg Units.val h'
    simpa only [integerUnitsToResidueUnits_apply, map_one, Units.val_one] using h''
  · intro h
    apply (residueUnitsConcreteEquiv K).injective
    apply Units.ext
    simpa only [integerUnitsToResidueUnits_apply, map_one, Units.val_one] using h
 
theorem principalUnits_one_eq_ker_integerUnitsToResidueUnits
    (K : Type u) [Field K] [ValuativeRel K] :
    principalUnits K 1 = (integerUnitsToResidueUnits K).ker := by
  ext x
  rw [mem_principalUnits_iff, mem_ker_integerUnitsToResidueUnits_iff]
  rw [pow_one]
  rw [← sub_eq_zero]
  rw [← map_one (IsLocalRing.residue 𝒪[K]), ← map_sub]
  exact Ideal.Quotient.eq_zero_iff_mem.symm
 
theorem integerUnitsToResidueUnits_surjective (K : Type u) [Field K] [ValuativeRel K] :
    Function.Surjective (integerUnitsToResidueUnits K) :=
  IsLocalRing.surjective_units_map_of_local_ringHom _ Ideal.Quotient.mk_surjective
    (inferInstanceAs (IsLocalHom (IsLocalRing.residue 𝒪[K])))
 
def integerUnitsModPrincipalUnitsEquivResidueUnits
    (K : Type u) [Field K] [ValuativeRel K] :
    IntegerUnitsModPrincipalUnits K ≃* ResidueUnits K :=
  (integerUnitsModPrincipalUnitsConcreteEquiv K).trans
    ((QuotientGroup.quotientMulEquivOfEq
      (principalUnits_one_eq_ker_integerUnitsToResidueUnits K)).trans
      (QuotientGroup.quotientKerEquivOfSurjective (integerUnitsToResidueUnits K)
        (integerUnitsToResidueUnits_surjective K)))
end
end LocalFieldTheory
end

/- ValuedFieldTheory.LocalField.NonarchimedeanLocalField.ResidueExtension -/
section
namespace LocalFieldTheory
noncomputable section
universe u
open scoped ValuativeRel
 

def integerRingMapOfValuationExtension (K L : Type u) [Field K] [ValuativeRel K]
    [Field L] [ValuativeRel L] [Algebra K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)] :
    𝒪[K] →+* 𝒪[L] :=
  algebraMap 𝒪[K] 𝒪[L]
 


theorem integerRing_moduleFinite_of_isIntegralClosure (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [Algebra K L] [FiniteDimensional K L]
    [Algebra.IsSeparable K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [IsIntegralClosure 𝒪[L] 𝒪[K] L] :
    Module.Finite 𝒪[K] 𝒪[L] :=
  IsIntegralClosure.finite 𝒪[K] K L 𝒪[L]
end
end LocalFieldTheory
end

/- ValuedFieldTheory.LocalField.NonarchimedeanLocalField.GaloisIntegerRing -/
section
namespace LocalFieldTheory
noncomputable section
universe u
open scoped ValuativeRel
 






theorem galoisGroup_mem_integerRing_of_isIntegralClosure
    (K L : Type u) [Field K] [ValuativeRel K] [Field L] [ValuativeRel L]
    [Algebra K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [IsIntegralClosure 𝒪[L] 𝒪[K] L]
    (σ : Gal(L / K)) (x : 𝒪[L]) :
    σ (x : L) ∈ 𝒪[L] := by
  have hx : IsIntegral 𝒪[K] ((x : 𝒪[L]) : L) :=
    (IsIntegralClosure.isIntegral_iff (A := 𝒪[L]) (R := 𝒪[K]) (B := L)).2
      ⟨x, rfl⟩
  have hσ : IsIntegral 𝒪[K] (σ ((x : 𝒪[L]) : L)) :=
    IsIntegral.map σ.toAlgHom hx
  rcases (IsIntegralClosure.isIntegral_iff (A := 𝒪[L]) (R := 𝒪[K]) (B := L)).1 hσ
    with ⟨y, hy⟩
  exact hy ▸ y.2
 

def galoisGroupIntegerRingEquivOfIsIntegralClosure
    (K L : Type u) [Field K] [ValuativeRel K] [Field L] [ValuativeRel L]
    [Algebra K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [IsIntegralClosure 𝒪[L] 𝒪[K] L] (σ : Gal(L / K)) :
    𝒪[L] ≃+* 𝒪[L] where
  toFun x :=
    ⟨σ (x : L), galoisGroup_mem_integerRing_of_isIntegralClosure K L σ x⟩
  invFun x :=
    ⟨σ.symm (x : L), galoisGroup_mem_integerRing_of_isIntegralClosure K L σ.symm x⟩
  left_inv := by
    intro x
    ext
    simp
  right_inv := by
    intro x
    ext
    simp
  map_mul' := by
    intro x y
    ext
    simp
  map_add' := by
    intro x y
    ext
    simp
 

@[simp]
theorem galoisGroupIntegerRingEquivOfIsIntegralClosure_apply
    (K L : Type u) [Field K] [ValuativeRel K] [Field L] [ValuativeRel L]
    [Algebra K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [IsIntegralClosure 𝒪[L] 𝒪[K] L]
    (σ : Gal(L / K)) (x : 𝒪[L]) :
    ((galoisGroupIntegerRingEquivOfIsIntegralClosure K L σ x : 𝒪[L]) : L) =
      σ (x : L) :=
  rfl
end
end LocalFieldTheory
end

/- ClassFieldTheory.LocalClassFieldTheory.ClassFormation.Valuation -/
section
namespace LocalClassFieldTheory
open LocalFieldTheory
noncomputable section
universe u
open scoped ValuativeRel
open IsNonarchimedeanLocalField
 

abbrev galoisGroupFieldUnitsMulDistribMulAction
    (K L : Type u) [Field K] [Field L] [Algebra K L] :
    MulDistribMulAction (Gal(L / K)) Lˣ where
  smul σ x := Units.mapEquiv σ.toMulEquiv x
  one_smul := by
    intro x
    ext
    rfl
  mul_smul := by
    intro σ τ x
    ext
    rfl
  smul_mul := by
    intro σ x y
    exact map_mul (Units.mapEquiv σ.toMulEquiv) x y
  smul_one := by
    intro σ
    exact map_one (Units.mapEquiv σ.toMulEquiv)
 

abbrev galoisGroupIntegerUnitsMulDistribMulActionOfIsIntegralClosure
    (K L : Type u) [Field K] [ValuativeRel K] [Field L] [ValuativeRel L]
    [Algebra K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [IsIntegralClosure 𝒪[L] 𝒪[K] L] :
    MulDistribMulAction (Gal(L / K)) 𝒪[L]ˣ where
  smul σ x := Units.mapEquiv
    (galoisGroupIntegerRingEquivOfIsIntegralClosure K L σ).toMulEquiv x
  one_smul := by
    intro x
    ext
    rfl
  mul_smul := by
    intro σ τ x
    ext
    rfl
  smul_mul := by
    intro σ x y
    exact map_mul
      (Units.mapEquiv
        (galoisGroupIntegerRingEquivOfIsIntegralClosure K L σ).toMulEquiv) x y
  smul_one := by
    intro σ
    exact map_one
      (Units.mapEquiv
        (galoisGroupIntegerRingEquivOfIsIntegralClosure K L σ).toMulEquiv)
 
@[simp]
theorem galoisGroupIntegerUnitsMulDistribMulActionOfIsIntegralClosure_smul
    (K L : Type u) [Field K] [ValuativeRel K] [Field L] [ValuativeRel L]
    [Algebra K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [IsIntegralClosure 𝒪[L] 𝒪[K] L]
    (σ : Gal(L / K)) (x : 𝒪[L]ˣ) :
    letI := galoisGroupIntegerUnitsMulDistribMulActionOfIsIntegralClosure K L
    σ • x = Units.mapEquiv
      (galoisGroupIntegerRingEquivOfIsIntegralClosure K L σ).toMulEquiv x :=
  rfl
 

abbrev galoisGroupValueGroupMulDistribMulAction
    (K L : Type u) [Field K] [Field L] [Algebra K L] :
    MulDistribMulAction (Gal(L / K)) (Multiplicative Int) where
  smul _ n := n
  one_smul := by intro n; rfl
  mul_smul := by intro _ _ n; rfl
  smul_mul := by intro _ m n; rfl
  smul_one := by intro _; rfl
 
@[simp]
theorem galoisGroupValueGroupMulDistribMulAction_smul
    (K L : Type u) [Field K] [Field L] [Algebra K L]
    (σ : Gal(L / K)) (n : Multiplicative Int) :
    letI := galoisGroupValueGroupMulDistribMulAction K L
    σ • n = n :=
  rfl
 
theorem integerUnitsToFieldUnits_galoisGroup_equivariant
    (K L : Type u) [Field K] [ValuativeRel K] [Field L] [ValuativeRel L]
    [Algebra K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [IsIntegralClosure 𝒪[L] 𝒪[K] L]
    (σ : Gal(L / K)) (x : 𝒪[L]ˣ) :
    letI := galoisGroupIntegerUnitsMulDistribMulActionOfIsIntegralClosure K L
    letI := galoisGroupFieldUnitsMulDistribMulAction K L
    integerUnitsToFieldUnits L (σ • x) =
      σ • integerUnitsToFieldUnits L x := by
  let := galoisGroupIntegerUnitsMulDistribMulActionOfIsIntegralClosure K L
  let := galoisGroupFieldUnitsMulDistribMulAction K L
  ext
  rfl
 



theorem valuationMap_unitsMapEquiv_galoisGroup
    (K L : Type u) [Field K] [ValuativeRel K]
    [Field L] [ValuativeRel L] [TopologicalSpace L]
    [IsNonarchimedeanLocalField L] [Algebra K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [IsIntegralClosure 𝒪[L] 𝒪[K] L]
    (σ : Gal(L / K)) (x : Lˣ) :
    valuationMap L
        (Additive.ofMul (Units.mapEquiv σ.toMulEquiv x)) =
      valuationMap L (Additive.ofMul x) := by
  let e : 𝒪[L] ≃+* 𝒪[L] := galoisGroupIntegerRingEquivOfIsIntegralClosure K L σ
  let πO : 𝒪[L] := chosenIntegerRingUniformizer L
  let π : Lˣ := integerRingUniformizerFieldUnit L
  let σπ : Lˣ := Units.mapEquiv σ.toMulEquiv π
  have heπO : Irreducible (e πO) :=
    (MulEquiv.irreducible_iff e.toMulEquiv).2
      (chosenIntegerRingUniformizer_irreducible L)
  have hσπ : (σπ : L) = ((e πO : 𝒪[L]) : L) := by
    rfl
  have hvσπ : v L (Additive.ofMul σπ) = -1 :=
    v_integerRingIrreducibleFieldUnit L (e πO) heπO σπ hσπ
  have hvσπinv : v L (Additive.ofMul σπ⁻¹) = 1 := by
    rw [v_inv, hvσπ]
    norm_num
  let ϖ : Lˣ := inverseIntegerRingUniformizerFieldUnit L
  have hmapϖ : Units.mapEquiv σ.toMulEquiv ϖ = σπ⁻¹ := by
    ext
    rfl
  have hvmapϖ :
      v L (Additive.ofMul (Units.mapEquiv σ.toMulEquiv ϖ)) = 1 := by
    rw [hmapϖ]
    exact hvσπinv
  have hϖ : valuationMap L (Additive.ofMul ϖ) = 1 := by
    exact v_inverseIntegerRingUniformizerFieldUnit L
  let n : Int := valuationMap L (Additive.ofMul x)
  let u : 𝒪[L]ˣ := uniformizerUnitFactor L ϖ hϖ x
  let σu : 𝒪[L]ˣ := Units.mapEquiv e.toMulEquiv u
  have hmapu :
      Units.mapEquiv σ.toMulEquiv (integerUnitsToFieldUnits L u) =
        integerUnitsToFieldUnits L σu := by
    ext
    rfl
  have hvmapu :
      v L (Additive.ofMul
        (Units.mapEquiv σ.toMulEquiv (integerUnitsToFieldUnits L u))) = 0 := by
    rw [hmapu]
    exact v_integerUnitsToFieldUnits L σu
  have hx : integerUnitsToFieldUnits L u * ϖ ^ n = x := by
    simp [u, n]
  have hxσ :
      Units.mapEquiv σ.toMulEquiv x =
        Units.mapEquiv σ.toMulEquiv (integerUnitsToFieldUnits L u) *
          (Units.mapEquiv σ.toMulEquiv ϖ) ^ n := by
    calc
      Units.mapEquiv σ.toMulEquiv x =
          Units.mapEquiv σ.toMulEquiv
            (integerUnitsToFieldUnits L u * ϖ ^ n) :=
        congrArg (Units.mapEquiv σ.toMulEquiv) hx.symm
      _ = Units.mapEquiv σ.toMulEquiv (integerUnitsToFieldUnits L u) *
          (Units.mapEquiv σ.toMulEquiv ϖ) ^ n := by
        simp only [map_mul, map_zpow]
  rw [valuationMap_apply, valuationMap_apply, hxσ, v_mul, v_zpow,
    hvmapu, hvmapϖ, mul_one, zero_add]
  rfl
 

theorem valuationUnitsMulHom_galoisGroup_equivariant
    (K L : Type u) [Field K] [ValuativeRel K]
    [Field L] [ValuativeRel L] [TopologicalSpace L]
    [IsNonarchimedeanLocalField L] [Algebra K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [IsIntegralClosure 𝒪[L] 𝒪[K] L]
    (σ : Gal(L / K)) (x : Lˣ) :
    letI := galoisGroupFieldUnitsMulDistribMulAction K L
    letI := galoisGroupValueGroupMulDistribMulAction K L
    valuationUnitsMulHom L (σ • x) =
      σ • valuationUnitsMulHom L x := by
  let := galoisGroupFieldUnitsMulDistribMulAction K L
  let := galoisGroupValueGroupMulDistribMulAction K L
  exact congrArg Multiplicative.ofAdd
    (valuationMap_unitsMapEquiv_galoisGroup K L σ x)
 

theorem valuationUnitsMulHom_eq_one_iff_valuationMap_eq_zero
    (L : Type u) [Field L] [ValuativeRel L] [TopologicalSpace L]
    [IsNonarchimedeanLocalField L] (x : Lˣ) :
    valuationUnitsMulHom L x = 1 ↔
      valuationMap L (Additive.ofMul x) = 0 := by
  change valuationUnitsMulHom L x = 1 ↔
    Multiplicative.toAdd (valuationUnitsMulHom L x) = 0
  constructor
  · intro hx
    exact congrArg Multiplicative.toAdd hx
  · intro hx
    apply Multiplicative.toAdd.injective
    exact hx
 

theorem valuationUnitsMulHom_eq_one_iff_exists_integerUnit
    (L : Type u) [Field L] [ValuativeRel L] [TopologicalSpace L]
    [IsNonarchimedeanLocalField L] (x : Lˣ) :
    valuationUnitsMulHom L x = 1 ↔
      ∃ y : 𝒪[L]ˣ, integerUnitsToFieldUnits L y = x := by
  rw [valuationUnitsMulHom_eq_one_iff_valuationMap_eq_zero]
  constructor
  · intro hx
    exact
      (integerUnitsToFieldUnits_mem_range_iff_valuationMap_eq_zero L x).2 hx
  · rintro ⟨y, rfl⟩
    exact
      (integerUnitsToFieldUnits_mem_range_iff_valuationMap_eq_zero L
        (integerUnitsToFieldUnits L y)).1 ⟨y, rfl⟩
 

theorem valuationUnitsMulHom_surjective
    (L : Type u) [Field L] [ValuativeRel L] [TopologicalSpace L]
    [IsNonarchimedeanLocalField L] :
    Function.Surjective (valuationUnitsMulHom L) := by
  intro n
  rcases valuationMap_surjective L (Multiplicative.toAdd n) with ⟨x, hx⟩
  refine ⟨Additive.toMul x, ?_⟩
  change Multiplicative.ofAdd (valuationMap L x) = n
  rw [hx]
  rfl
end
end LocalClassFieldTheory
end

/- ClassFieldTheory.LocalClassFieldTheory.ClassFormation.ValueGroupCohomology -/
section
namespace LocalClassFieldTheory
open LocalFieldTheory
open CyclicCohomology
noncomputable section
open scoped BigOperators
universe u
open CyclicCohomology.ProfiniteCohomology.Herbrand
variable (K L : Type u) [Field K] [Field L] [Algebra K L]
  [FiniteDimensional K L]
 

theorem galoisGroupValueGroup_tateNorm_toAdd (a : Multiplicative Int) :
    letI := galoisGroupValueGroupMulDistribMulAction K L
    Multiplicative.toAdd
        (tateNorm (Gal(L / K)) (Multiplicative Int) a) =
      (Fintype.card (Gal(L / K)) : Int) * Multiplicative.toAdd a := by
  let := galoisGroupValueGroupMulDistribMulAction K L
  have hnorm : tateNorm (Gal(L / K)) (Multiplicative Int) a =
      a ^ Fintype.card (Gal(L / K)) := by
    simp only [tateNorm, galoisGroupValueGroupMulDistribMulAction_smul,
      Finset.prod_const, Finset.card_univ]
  simpa only [toAdd_pow, nsmul_eq_mul] using
    congrArg Multiplicative.toAdd hnorm
 

def galoisGroupValueGroupFixedToZModHom :
    letI := galoisGroupValueGroupMulDistribMulAction K L
    fixedSubgroup (Gal(L / K)) (Multiplicative Int) →*
      Multiplicative (ZMod (Fintype.card (Gal(L / K)))) := by
  letI := galoisGroupValueGroupMulDistribMulAction K L
  exact
    { toFun := fun x => Multiplicative.ofAdd
        ((Multiplicative.toAdd (x : Multiplicative Int) : Int) :
          ZMod (Fintype.card (Gal(L / K))))
      map_one' := by simp
      map_mul' := by
        intro x y
        simp }
 
theorem galoisGroupValueGroupFixedToZModHom_surjective :
    letI := galoisGroupValueGroupMulDistribMulAction K L
    Function.Surjective (galoisGroupValueGroupFixedToZModHom K L) := by
  let := galoisGroupValueGroupMulDistribMulAction K L
  intro y
  rcases ZMod.intCast_surjective (Multiplicative.toAdd y) with ⟨z, hz⟩
  let x : fixedSubgroup (Gal(L / K)) (Multiplicative Int) :=
    ⟨Multiplicative.ofAdd z, by intro σ; rfl⟩
  refine ⟨x, ?_⟩
  rw [show galoisGroupValueGroupFixedToZModHom K L x =
      Multiplicative.ofAdd
        ((z : Int) : ZMod (Fintype.card (Gal(L / K)))) by rfl]
  exact congrArg Multiplicative.ofAdd hz
 

theorem galoisGroupValueGroupFixedToZModHom_ker :
    letI := galoisGroupValueGroupMulDistribMulAction K L
    MonoidHom.ker (galoisGroupValueGroupFixedToZModHom K L) =
      (tateNormSubgroup (Gal(L / K)) (Multiplicative Int)).subgroupOf
        (fixedSubgroup (Gal(L / K)) (Multiplicative Int)) := by
  let := galoisGroupValueGroupMulDistribMulAction K L
  ext x
  rw [MonoidHom.mem_ker]
  constructor
  · intro hx
    have hx0 :
        ((Multiplicative.toAdd (x : Multiplicative Int) : Int) :
          ZMod (Fintype.card (Gal(L / K)))) = 0 := by
      exact congrArg Multiplicative.toAdd hx
    rcases (ZMod.intCast_zmod_eq_zero_iff_dvd _ _).1 hx0 with ⟨z, hz⟩
    change (x : Multiplicative Int) ∈
      tateNormSubgroup (Gal(L / K)) (Multiplicative Int)
    refine ⟨Multiplicative.ofAdd z, ?_⟩
    have htoAdd :
        Multiplicative.toAdd
            (tateNorm (Gal(L / K)) (Multiplicative Int)
              (Multiplicative.ofAdd z)) =
          Multiplicative.toAdd (x : Multiplicative Int) := by
      rw [galoisGroupValueGroup_tateNorm_toAdd]
      exact hz.symm
    exact congrArg Multiplicative.ofAdd htoAdd
  · intro hx
    change (x : Multiplicative Int) ∈
      tateNormSubgroup (Gal(L / K)) (Multiplicative Int) at hx
    rcases hx with ⟨z, hz⟩
    rw [tateNormHom_apply] at hz
    exact congrArg Multiplicative.ofAdd (by
      change
        ((Multiplicative.toAdd (x : Multiplicative Int) : Int) :
            ZMod (Fintype.card (Gal(L / K)))) = 0
      rw [← hz, galoisGroupValueGroup_tateNorm_toAdd]
      apply (ZMod.intCast_zmod_eq_zero_iff_dvd _ _).2
      exact ⟨Multiplicative.toAdd z, rfl⟩)
 
noncomputable def galoisGroupValueGroupHerbrandH0MulEquivZMod :
    letI := galoisGroupValueGroupMulDistribMulAction K L
    HerbrandH0 (Gal(L / K)) (Multiplicative Int) ≃*
      Multiplicative (ZMod (Fintype.card (Gal(L / K)))) := by
  letI := galoisGroupValueGroupMulDistribMulAction K L
  exact
    (HerbrandH0.equiv
      (G := Gal(L / K)) (A := Multiplicative Int)).trans
      ((QuotientGroup.quotientMulEquivOfEq
        (galoisGroupValueGroupFixedToZModHom_ker K L).symm).trans
        (QuotientGroup.quotientKerEquivOfSurjective
          (galoisGroupValueGroupFixedToZModHom K L)
          (galoisGroupValueGroupFixedToZModHom_surjective K L)))
 

theorem galoisGroupValueGroupHerbrandH0Finite :
    letI := galoisGroupValueGroupMulDistribMulAction K L
    Finite (HerbrandH0 (Gal(L / K)) (Multiplicative Int)) := by
  let := galoisGroupValueGroupMulDistribMulAction K L
  exact Finite.of_equiv
    (Multiplicative (ZMod (Fintype.card (Gal(L / K)))))
    (galoisGroupValueGroupHerbrandH0MulEquivZMod K L).symm.toEquiv
 
theorem galoisGroupValueGroup_herbrandH0_card :
    letI := galoisGroupValueGroupMulDistribMulAction K L
    letI := galoisGroupValueGroupHerbrandH0Finite K L
    Nat.card (HerbrandH0 (Gal(L / K)) (Multiplicative Int)) =
      Fintype.card (Gal(L / K)) := by
  let := galoisGroupValueGroupMulDistribMulAction K L
  rw [Nat.card_congr (galoisGroupValueGroupHerbrandH0MulEquivZMod K L).toEquiv]
  simp
 

theorem galoisGroupValueGroup_herbrandH0_card_eq_finrank [IsGalois K L] :
    letI := galoisGroupValueGroupMulDistribMulAction K L
    letI := galoisGroupValueGroupHerbrandH0Finite K L
    Nat.card (HerbrandH0 (Gal(L / K)) (Multiplicative Int)) =
      Module.finrank K L := by
  let := galoisGroupValueGroupMulDistribMulAction K L
  rw [galoisGroupValueGroup_herbrandH0_card K L]
  exact Fintype.card_eq_nat_card.trans (IsGalois.card_aut_eq_finrank K L)
 
theorem galoisGroupValueGroup_normKernelSubgroup_eq_bot :
    letI := galoisGroupValueGroupMulDistribMulAction K L
    normKernelSubgroup (Gal(L / K)) (Multiplicative Int) = ⊥ := by
  let := galoisGroupValueGroupMulDistribMulAction K L
  apply le_antisymm
  · intro x hx
    rw [Subgroup.mem_bot]
    exact congrArg Multiplicative.ofAdd (by
      change Multiplicative.toAdd (x : Multiplicative Int) = 0
      have hnorm :
          (Fintype.card (Gal(L / K)) : Int) *
              Multiplicative.toAdd (x : Multiplicative Int) = 0 := by
        rw [← galoisGroupValueGroup_tateNorm_toAdd K L]
        exact congrArg Multiplicative.toAdd hx
      exact (mul_eq_zero.mp hnorm).resolve_left (by
        exact_mod_cast Fintype.card_ne_zero))
  · exact bot_le
 

theorem galoisGroupValueGroupHerbrandHMinusOneFinite
    (σ : Gal(L / K)) :
    letI := galoisGroupValueGroupMulDistribMulAction K L
    Finite
      (HerbrandHMinusOne (Gal(L / K)) (Multiplicative Int) σ) := by
  let := galoisGroupValueGroupMulDistribMulAction K L
  have : Subsingleton
      (normKernelSubgroup (Gal(L / K)) (Multiplicative Int)) := by
    rw [galoisGroupValueGroup_normKernelSubgroup_eq_bot K L]
    infer_instance
  let : Subsingleton
      (HerbrandHMinusOne (Gal(L / K)) (Multiplicative Int) σ) :=
    ⟨fun q =>
      HerbrandHMinusOne.inductionOn σ
        (motive := fun q => ∀ r, q = r) q fun x r =>
          HerbrandHMinusOne.inductionOn σ
            (motive := fun r => HerbrandHMinusOne.mk σ x = r) r fun y =>
              congrArg (fun z => HerbrandHMinusOne.mk σ z)
                (Subsingleton.elim x y)⟩
  exact Finite.of_injective
    (fun _ : HerbrandHMinusOne (Gal(L / K))
      (Multiplicative Int) σ => false)
    (fun x y _ => Subsingleton.elim x y)
 
theorem galoisGroupValueGroup_herbrandHMinusOne_card_eq_one
    (σ : Gal(L / K)) :
    letI := galoisGroupValueGroupMulDistribMulAction K L
    letI := galoisGroupValueGroupHerbrandHMinusOneFinite K L σ
    Nat.card
      (HerbrandHMinusOne (Gal(L / K)) (Multiplicative Int) σ) = 1 := by
  let := galoisGroupValueGroupMulDistribMulAction K L
  have : Subsingleton
      (normKernelSubgroup (Gal(L / K)) (Multiplicative Int)) := by
    rw [galoisGroupValueGroup_normKernelSubgroup_eq_bot K L]
    infer_instance
  let : Subsingleton
      (HerbrandHMinusOne (Gal(L / K)) (Multiplicative Int) σ) :=
    ⟨fun q =>
      HerbrandHMinusOne.inductionOn σ
        (motive := fun q => ∀ r, q = r) q fun x r =>
          HerbrandHMinusOne.inductionOn σ
            (motive := fun r => HerbrandHMinusOne.mk σ x = r) r fun y =>
              congrArg (fun z => HerbrandHMinusOne.mk σ z)
                (Subsingleton.elim x y)⟩
  exact Nat.card_unique
end
end LocalClassFieldTheory
end

/- ClassFieldTheory.LocalClassFieldTheory.ClassFormation.ValuationHerbrand -/
section
namespace LocalClassFieldTheory
open LocalFieldTheory
open CyclicCohomology
noncomputable section
open scoped ValuativeRel
open CyclicCohomology.ProfiniteCohomology.Herbrand
open IsNonarchimedeanLocalField
variable (K L : Type) [Field K] [ValuativeRel K]
  [Field L] [ValuativeRel L] [TopologicalSpace L]
  [IsNonarchimedeanLocalField L] [Algebra K L] [FiniteDimensional K L]
  [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
  [IsIntegralClosure (ValuativeRel.valuation L).integer
    (ValuativeRel.valuation K).integer L]
omit [FiniteDimensional K L] in
 

theorem valuationHerbrand_shortExact :
    letI := galoisGroupIntegerUnitsMulDistribMulActionOfIsIntegralClosure K L
    letI := galoisGroupFieldUnitsMulDistribMulAction K L
    letI := galoisGroupValueGroupMulDistribMulAction K L
    (∀ (σ : Gal(L / K)) (x : (ValuativeRel.valuation L).integerˣ),
        integerUnitsToFieldUnits L (σ • x) =
          σ • integerUnitsToFieldUnits L x) ∧
      (∀ (σ : Gal(L / K)) (x : Lˣ),
        valuationUnitsMulHom L (σ • x) =
          σ • valuationUnitsMulHom L x) ∧
      (∀ x : Lˣ, valuationUnitsMulHom L x = 1 ↔
        ∃ y : (ValuativeRel.valuation L).integerˣ,
          integerUnitsToFieldUnits L y = x) ∧
      Function.Injective (integerUnitsToFieldUnits L) ∧
      Function.Surjective (valuationUnitsMulHom L) := by
  let := galoisGroupIntegerUnitsMulDistribMulActionOfIsIntegralClosure K L
  let := galoisGroupFieldUnitsMulDistribMulAction K L
  let := galoisGroupValueGroupMulDistribMulAction K L
  exact ⟨integerUnitsToFieldUnits_galoisGroup_equivariant K L,
    valuationUnitsMulHom_galoisGroup_equivariant K L,
    valuationUnitsMulHom_eq_one_iff_exists_integerUnit L,
    integerUnitsToFieldUnits_injective L,
    valuationUnitsMulHom_surjective L⟩
omit [ValuativeRel K] [ValuativeRel L] [TopologicalSpace L]
    [IsNonarchimedeanLocalField L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [IsIntegralClosure (ValuativeRel.valuation L).integer
      (ValuativeRel.valuation K).integer L] in
 


theorem galoisGroupValueGroup_herbrandQuotientDefined
    (g : Gal(L / K)) :
    letI := galoisGroupValueGroupMulDistribMulAction K L
    HerbrandQuotientDefined (Gal(L / K)) (Multiplicative Int) g := by
  exact ⟨galoisGroupValueGroupHerbrandH0Finite K L,
    galoisGroupValueGroupHerbrandHMinusOneFinite K L g⟩
 








theorem valuationHerbrand_multiplicativity_of_integerUnits_defined
    (g : Gal(L / K))
    (hg : ∀ σ : Gal(L / K), σ ∈ Subgroup.zpowers g)
    (hU :
      letI := galoisGroupIntegerUnitsMulDistribMulActionOfIsIntegralClosure K L
      HerbrandQuotientDefined (Gal(L / K))
        (ValuativeRel.valuation L).integerˣ g) :
    letI := galoisGroupIntegerUnitsMulDistribMulActionOfIsIntegralClosure K L
    letI := galoisGroupFieldUnitsMulDistribMulAction K L
    letI := galoisGroupValueGroupMulDistribMulAction K L
    let hZ : HerbrandQuotientDefined (Gal(L / K)) (Multiplicative Int) g :=
      galoisGroupValueGroup_herbrandQuotientDefined K L g
    ∃ hField : HerbrandQuotientDefined (Gal(L / K)) Lˣ g,
      @herbrandQuotient (Gal(L / K)) Lˣ _ _ _
          (galoisGroupFieldUnitsMulDistribMulAction K L) g hField.1 hField.2 =
        @herbrandQuotient (Gal(L / K))
            (ValuativeRel.valuation L).integerˣ _ _ _
            (galoisGroupIntegerUnitsMulDistribMulActionOfIsIntegralClosure K L)
            g hU.1 hU.2 *
          @herbrandQuotient (Gal(L / K)) (Multiplicative Int) _ _ _
            (galoisGroupValueGroupMulDistribMulAction K L) g hZ.1 hZ.2 := by
  let := galoisGroupIntegerUnitsMulDistribMulActionOfIsIntegralClosure K L
  let := galoisGroupFieldUnitsMulDistribMulAction K L
  let := galoisGroupValueGroupMulDistribMulAction K L
  let hZ : HerbrandQuotientDefined (Gal(L / K)) (Multiplicative Int) g :=
    galoisGroupValueGroup_herbrandQuotientDefined K L g
  let hseq := valuationHerbrand_shortExact K L
  let hField := herbrandQuotientDefined_middle_of_left_right
    (G := Gal(L / K))
    (A := (ValuativeRel.valuation L).integerˣ)
    (B := Lˣ) (C := Multiplicative Int)
    (integerUnitsToFieldUnits L) (valuationUnitsMulHom L)
    hseq.1 hseq.2.1 hseq.2.2.1 hseq.2.2.2.1 hseq.2.2.2.2
    g hg hU hZ
  refine ⟨hField, ?_⟩
  let : Finite
      (HerbrandH0 (Gal(L / K)) (ValuativeRel.valuation L).integerˣ) := hU.1
  let : Finite
      (HerbrandHMinusOne (Gal(L / K))
        (ValuativeRel.valuation L).integerˣ g) := hU.2
  let : Finite (HerbrandH0 (Gal(L / K)) Lˣ) := hField.1
  let : Finite (HerbrandHMinusOne (Gal(L / K)) Lˣ g) := hField.2
  let : Finite
      (HerbrandH0 (Gal(L / K)) (Multiplicative Int)) := hZ.1
  let : Finite
      (HerbrandHMinusOne (Gal(L / K)) (Multiplicative Int) g) := hZ.2
  exact herbrandQuotient_multiplicative_of_shortExact
    (G := Gal(L / K))
    (A := (ValuativeRel.valuation L).integerˣ)
    (B := Lˣ) (C := Multiplicative Int)
    (integerUnitsToFieldUnits L) (valuationUnitsMulHom L)
    hseq.1 hseq.2.1 hseq.2.2.1 hseq.2.2.2.1 hseq.2.2.2.2
    g hg
end
end LocalClassFieldTheory
end

/- ClassFieldTheory.LocalClassFieldTheory.ClassFormation.FieldUnitsHerbrand -/
section
namespace LocalClassFieldTheory
open CyclicCohomology
open LocalFieldTheory
noncomputable section
open scoped ValuativeRel
open CyclicCohomology.ProfiniteCohomology.Herbrand
open IsNonarchimedeanLocalField
variable (K L : Type) [Field K] [ValuativeRel K]
  [Field L] [ValuativeRel L] [TopologicalSpace L]
  [IsNonarchimedeanLocalField L] [Algebra K L] [FiniteDimensional K L]
  [IsGalois K L]
  [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
  [IsIntegralClosure (ValuativeRel.valuation L).integer
    (ValuativeRel.valuation K).integer L]
omit [IsGalois K L] in
 


theorem unitsTateH0FiniteOfIntegerUnitsHerbrand
    (g : Gal(L / K))
    (hg : ∀ σ : Gal(L / K), σ ∈ Subgroup.zpowers g)
    (hU :
      letI := galoisGroupIntegerUnitsMulDistribMulActionOfIsIntegralClosure K L
      HerbrandQuotientDefined (Gal(L / K))
        (ValuativeRel.valuation L).integerˣ g) :
    Finite (tateCohomology (Rep.ofAlgebraAutOnUnits K L) 0) := by
  let := galoisGroupIntegerUnitsMulDistribMulActionOfIsIntegralClosure K L
  let := galoisGroupFieldUnitsMulDistribMulAction K L
  let := galoisGroupValueGroupMulDistribMulAction K L
  obtain ⟨hField, _⟩ :=
    valuationHerbrand_multiplicativity_of_integerUnits_defined K L g hg hU
  let : Finite (HerbrandH0 (Gal(L / K)) Lˣ) := hField.1
  exact Finite.of_equiv (HerbrandH0 (Gal(L / K)) Lˣ)
    (herbrandH0EquivTateCohomologyZero K L)
 



theorem fieldUnits_tate_card_of_integerUnits_herbrand_eq_one
    (g : Gal(L / K))
    (hg : ∀ σ : Gal(L / K), σ ∈ Subgroup.zpowers g)
    (hU :
      letI := galoisGroupIntegerUnitsMulDistribMulActionOfIsIntegralClosure K L
      HerbrandQuotientDefined (Gal(L / K))
        (ValuativeRel.valuation L).integerˣ g)
    (hU_one :
      letI := galoisGroupIntegerUnitsMulDistribMulActionOfIsIntegralClosure K L
      @herbrandQuotient (Gal(L / K))
          (ValuativeRel.valuation L).integerˣ _ _ _
          (galoisGroupIntegerUnitsMulDistribMulActionOfIsIntegralClosure K L)
          g hU.1 hU.2 = 1) :
    letI := unitsTateH0FiniteOfIntegerUnitsHerbrand K L g hg hU
    Nat.card (tateCohomology (Rep.ofAlgebraAutOnUnits K L) 0) = Module.finrank K L ∧
      Nat.card (tateCohomology (Rep.ofAlgebraAutOnUnits K L) (-1)) = 1 := by
  let := galoisGroupIntegerUnitsMulDistribMulActionOfIsIntegralClosure K L
  let := galoisGroupFieldUnitsMulDistribMulAction K L
  let := galoisGroupValueGroupMulDistribMulAction K L
  let hZ : HerbrandQuotientDefined
      (Gal(L / K)) (Multiplicative Int) g :=
    galoisGroupValueGroup_herbrandQuotientDefined K L g
  rcases valuationHerbrand_multiplicativity_of_integerUnits_defined
      K L g hg hU with ⟨hField, hmult⟩
  let : Finite (HerbrandH0 (Gal(L / K)) Lˣ) := hField.1
  let : Finite (HerbrandHMinusOne (Gal(L / K)) Lˣ g) := hField.2
  let : Finite
      (HerbrandH0 (Gal(L / K)) (Multiplicative Int)) := hZ.1
  let : Finite
      (HerbrandHMinusOne (Gal(L / K)) (Multiplicative Int) g) := hZ.2
  have hZ0 :
      Nat.card (HerbrandH0 (Gal(L / K)) (Multiplicative Int)) =
        Module.finrank K L :=
    galoisGroupValueGroup_herbrandH0_card_eq_finrank K L
  have hZm1 :
      Nat.card (HerbrandHMinusOne
        (Gal(L / K)) (Multiplicative Int) g) = 1 :=
    galoisGroupValueGroup_herbrandHMinusOne_card_eq_one K L g
  have hZ_one :
      @herbrandQuotient (Gal(L / K)) (Multiplicative Int) _ _ _
          (galoisGroupValueGroupMulDistribMulAction K L) g hZ.1 hZ.2 =
        (Module.finrank K L : ℚ) := by
    rw [herbrandQuotient_eq_card_ratio, hZ0, hZm1]
    simp
  have hm1_actual :
      Nat.card (tateCohomology (Rep.ofAlgebraAutOnUnits K L) (-1)) = 1 :=
    unitsTateHminusOne_card_eq_one K L g hg
  have hm1_field :
      Nat.card (HerbrandHMinusOne (Gal(L / K)) Lˣ g) = 1 := by
    exact (Nat.card_congr
      (herbrandHminusOneEquivUnitsTateHminusOne K L g hg)).trans hm1_actual
  have hField_quotient :
      @herbrandQuotient (Gal(L / K)) Lˣ _ _ _
          (galoisGroupFieldUnitsMulDistribMulAction K L)
          g hField.1 hField.2 = (Module.finrank K L : ℚ) := by
    rw [hmult, hU_one, hZ_one]
    simp
  have h0_field_rat :
      (Nat.card (HerbrandH0 (Gal(L / K)) Lˣ) : ℚ) =
        (Module.finrank K L : ℚ) := by
    rw [← hField_quotient, herbrandQuotient_eq_card_ratio, hm1_field]
    simp
  have h0_field :
      Nat.card (HerbrandH0 (Gal(L / K)) Lˣ) = Module.finrank K L := by
    exact_mod_cast h0_field_rat
  constructor
  · exact
      (Nat.card_congr (herbrandH0EquivTateCohomologyZero K L)).symm.trans h0_field
  · exact hm1_actual
end
end LocalClassFieldTheory
end

/- GaloisCohomology.Cyclic.Herbrand.NormalBasisLattice -/
section
namespace CyclicCohomology
open LocalFieldTheory
noncomputable section
universe u
open scoped ValuativeRel
open Filter
variable (K L : Type u) [Field K] [Field L] [Algebra K L]
  [FiniteDimensional K L] [IsGalois K L]
 
theorem normalBasisConjugates_span_eq_top :
    Submodule.span K
        (Set.range (fun σ : Gal(L / K) =>
          σ (IsGalois.normalBasis K L (1 : Gal(L / K))))) = ⊤ := by
  have hset :
      Set.range (fun σ : Gal(L / K) =>
        σ (IsGalois.normalBasis K L (1 : Gal(L / K)))) =
        Set.range (IsGalois.normalBasis K L) := by
    ext x
    constructor
    · rintro ⟨σ, rfl⟩
      exact ⟨σ, IsGalois.normalBasis_apply (K := K) (L := L) σ⟩
    · rintro ⟨σ, rfl⟩
      exact ⟨σ, (IsGalois.normalBasis_apply (K := K) (L := L) σ).symm⟩
  rw [hset]
  exact (IsGalois.normalBasis K L).span_eq
variable [ValuativeRel K]
 


def chosenNormalBasisIntegerLattice : Submodule 𝒪[K] L :=
  Submodule.span 𝒪[K]
    (Set.range (fun σ : Gal(L / K) =>
      σ (IsGalois.normalBasis K L (1 : Gal(L / K)))))
 

theorem chosenNormalBasisIntegerLattice_eq_span :
    chosenNormalBasisIntegerLattice K L =
      Submodule.span 𝒪[K]
        (Set.range (fun σ : Gal(L / K) =>
          σ (IsGalois.normalBasis K L (1 : Gal(L / K))))) :=
  rfl
 
theorem normalBasis_mem_integerLattice (σ : Gal(L / K)) :
    IsGalois.normalBasis K L σ ∈ chosenNormalBasisIntegerLattice K L := by
  rw [IsGalois.normalBasis_apply]
  exact Submodule.subset_span (Set.mem_range_self σ)
 

theorem chosenNormalBasisIntegerLattice_field_span_eq_top :
    Submodule.span K ((chosenNormalBasisIntegerLattice K L : Submodule 𝒪[K] L) : Set L) =
      ⊤ := by
  refine le_antisymm le_top ?_
  rw [← normalBasisConjugates_span_eq_top (K := K) (L := L)]
  refine Submodule.span_mono ?_
  intro x hx
  exact Submodule.subset_span hx
 

theorem galoisGroup_apply_mem_chosenNormalBasisIntegerLattice
    (τ : Gal(L / K)) {x : L}
    (hx : x ∈ chosenNormalBasisIntegerLattice K L) :
    τ x ∈ chosenNormalBasisIntegerLattice K L := by
  refine Submodule.span_induction
    (p := fun x _ => τ x ∈ chosenNormalBasisIntegerLattice K L)
    ?hgen ?hzero ?hadd ?hsmul hx
  · intro x hx
    rcases hx with ⟨σ, rfl⟩
    have hτ :
        τ (σ (IsGalois.normalBasis K L (1 : Gal(L / K)))) =
          IsGalois.normalBasis K L (τ * σ) := by
      rw [IsGalois.normalBasis_apply (K := K) (L := L) (τ * σ)]
      rfl
    rw [hτ]
    exact normalBasis_mem_integerLattice (K := K) (L := L) (τ * σ)
  · simp
  · intro x y _ _ hx hy
    simpa using
      (chosenNormalBasisIntegerLattice K L).add_mem hx hy
  · intro a x _ hx
    have ha : τ (algebraMap 𝒪[K] L a) = algebraMap 𝒪[K] L a := by
      change τ (algebraMap K L (a : K)) = algebraMap K L (a : K)
      exact τ.commutes (a : K)
    simpa [Algebra.smul_def, ha, map_mul] using
      (chosenNormalBasisIntegerLattice K L).smul_mem a hx
 
theorem chosenNormalBasisIntegerLattice_fg :
    (chosenNormalBasisIntegerLattice K L).FG := by
  dsimp [chosenNormalBasisIntegerLattice]
  exact Submodule.fg_span (Set.finite_range _)
 

def baseIntegerScalarMulLinearMap (a : 𝒪[K]) : L →ₗ[𝒪[K]] L where
  toFun x := algebraMap 𝒪[K] L a * x
  map_add' := by
    intro x y
    rw [mul_add]
  map_smul' := by
    intro r x
    simp [Algebra.smul_def, mul_comm, mul_left_comm]
 

def baseIntegerScalarMulSubmodule (a : 𝒪[K]) (N : Submodule 𝒪[K] L) :
    Submodule 𝒪[K] L :=
  N.map (baseIntegerScalarMulLinearMap K L a)
variable [TopologicalSpace K] [IsNonarchimedeanLocalField K]
 




def chosenBaseUniformizerPowSubmodule (n : Nat) (N : Submodule 𝒪[K] L) :
    Submodule 𝒪[K] L :=
  baseIntegerScalarMulSubmodule K L (chosenIntegerRingUniformizer K ^ n) N
omit [FiniteDimensional K L] [IsGalois K L] in
 
@[simp]
theorem mem_chosenBaseUniformizerPowSubmodule_iff
    (n : Nat) (N : Submodule 𝒪[K] L) (x : L) :
    x ∈ chosenBaseUniformizerPowSubmodule K L n N ↔
      ∃ y : L, y ∈ N ∧
        algebraMap 𝒪[K] L (chosenIntegerRingUniformizer K ^ n) * y = x :=
  Iff.rfl
omit [FiniteDimensional K L] [IsGalois K L] in
 

theorem chosenBaseUniformizerPow_mul_mem_mono
    {M : Submodule 𝒪[K] L} {m n : Nat} {x : L} (hmn : m ≤ n)
    (hx : algebraMap 𝒪[K] L (chosenIntegerRingUniformizer K ^ m) * x ∈ M) :
    algebraMap 𝒪[K] L (chosenIntegerRingUniformizer K ^ n) * x ∈ M := by
  rcases Nat.exists_eq_add_of_le hmn with ⟨d, hd⟩
  rw [hd]
  have hscaled :
      algebraMap 𝒪[K] L (chosenIntegerRingUniformizer K ^ d) *
          (algebraMap 𝒪[K] L (chosenIntegerRingUniformizer K ^ m) * x) ∈ M := by
    simpa [Algebra.smul_def, mul_assoc] using
      M.smul_mem (chosenIntegerRingUniformizer K ^ d) hx
  simpa [pow_add, map_mul, mul_assoc, mul_comm, mul_left_comm] using hscaled
omit [FiniteDimensional K L] [IsGalois K L] in
 
theorem chosenBaseUniformizerPowSubmodule_antitone
    (N : Submodule 𝒪[K] L) {m n : Nat} (hmn : m ≤ n) :
    chosenBaseUniformizerPowSubmodule K L n N ≤
      chosenBaseUniformizerPowSubmodule K L m N := by
  intro x hx
  rcases (mem_chosenBaseUniformizerPowSubmodule_iff (K := K) (L := L) n N x).1 hx with
    ⟨y, hyN, rfl⟩
  rcases Nat.exists_eq_add_of_le hmn with ⟨d, hd⟩
  refine (mem_chosenBaseUniformizerPowSubmodule_iff (K := K) (L := L) m N _).2 ?_
  refine ⟨algebraMap 𝒪[K] L (chosenIntegerRingUniformizer K ^ d) * y, ?_, ?_⟩
  · simpa [Algebra.smul_def, mul_assoc] using
      N.smul_mem (chosenIntegerRingUniformizer K ^ d) hyN
  · simp [hd, pow_add, map_mul, mul_comm, mul_left_comm]
omit [FiniteDimensional K L] [IsGalois K L] in
 
theorem chosenBaseUniformizerPowSubmodule_succ_le
    (n : Nat) (N : Submodule 𝒪[K] L) :
    chosenBaseUniformizerPowSubmodule K L (n + 1) N ≤
      chosenBaseUniformizerPowSubmodule K L n N :=
  chosenBaseUniformizerPowSubmodule_antitone (K := K) (L := L) N (Nat.le_succ n)
omit [FiniteDimensional K L] [IsGalois K L] in
 



theorem exists_chosenBaseUniformizerPow_mul_mem_of_field_span_eq_top
    {M : Submodule 𝒪[K] L}
    (hMspan : Submodule.span K ((M : Set L)) = ⊤) (x : L) :
    ∃ n : Nat, algebraMap 𝒪[K] L (chosenIntegerRingUniformizer K ^ n) * x ∈ M := by
  have hx : x ∈ Submodule.span K ((M : Set L)) := by
    rw [hMspan]
    exact Submodule.mem_top
  refine Submodule.span_induction
    (p := fun y _ =>
      ∃ n : Nat, algebraMap 𝒪[K] L (chosenIntegerRingUniformizer K ^ n) * y ∈ M)
    ?hgen ?hzero ?hadd ?hsmul hx
  · intro y hyM
    refine ⟨0, ?_⟩
    simpa using hyM
  · refine ⟨0, ?_⟩
    simp
  · intro y z _ _ hy hz
    rcases hy with ⟨m, hm⟩
    rcases hz with ⟨n, hn⟩
    refine ⟨max m n, ?_⟩
    have hy' := chosenBaseUniformizerPow_mul_mem_mono
      (K := K) (L := L) (M := M) (Nat.le_max_left m n) hm
    have hz' := chosenBaseUniformizerPow_mul_mem_mono
      (K := K) (L := L) (M := M) (Nat.le_max_right m n) hn
    simpa [mul_add] using M.add_mem hy' hz'
  · intro c y _ hy
    rcases hy with ⟨m, hm⟩
    obtain ⟨d, hd⟩ := exists_chosenIntegerRingUniformizer_pow_mul_mem_integerRing K c
    let cInt : 𝒪[K] :=
      ⟨(((chosenIntegerRingUniformizer K : 𝒪[K]) : K) ^ d) * c, hd⟩
    refine ⟨d + m, ?_⟩
    have hscaled :
        algebraMap 𝒪[K] L cInt *
            (algebraMap 𝒪[K] L (chosenIntegerRingUniformizer K ^ m) * y) ∈ M := by
      simpa [Algebra.smul_def, mul_assoc] using M.smul_mem cInt hm
    have hcInt :
        algebraMap 𝒪[K] L cInt =
          algebraMap 𝒪[K] L (chosenIntegerRingUniformizer K ^ d) *
            algebraMap K L c := by
      change algebraMap K L
          ((((chosenIntegerRingUniformizer K : 𝒪[K]) : K) ^ d) * c) = _
      simp only [map_mul, map_pow]
      rfl
    rw [hcInt] at hscaled
    convert hscaled using 1
    rw [Algebra.smul_def, pow_add, map_mul]
    ring
omit [FiniteDimensional K L] [IsGalois K L] in
 


theorem exists_chosenBaseUniformizerPowSubmodule_le_of_fg_of_field_span_eq_top
    {M N : Submodule 𝒪[K] L} (hN : N.FG)
    (hMspan : Submodule.span K ((M : Set L)) = ⊤) :
    ∃ n : Nat, chosenBaseUniformizerPowSubmodule K L n N ≤ M := by
  rcases Submodule.fg_def.mp hN with ⟨S, hSfinite, hSspan⟩
  let t : Finset L := hSfinite.toFinset
  let nOf : L → Nat := fun y =>
    Classical.choose
      (exists_chosenBaseUniformizerPow_mul_mem_of_field_span_eq_top
        (K := K) (L := L) hMspan y)
  let n : Nat := t.sup nOf
  have hnOf_spec (y : L) :
      algebraMap 𝒪[K] L (chosenIntegerRingUniformizer K ^ nOf y) * y ∈ M :=
    Classical.choose_spec
      (exists_chosenBaseUniformizerPow_mul_mem_of_field_span_eq_top
        (K := K) (L := L) hMspan y)
  have hpow_mono {m : Nat} {y : L} (hmn : m ≤ n)
      (hy : algebraMap 𝒪[K] L (chosenIntegerRingUniformizer K ^ m) * y ∈ M) :
      algebraMap 𝒪[K] L (chosenIntegerRingUniformizer K ^ n) * y ∈ M := by
    rcases Nat.exists_eq_add_of_le hmn with ⟨d, hd⟩
    rw [hd]
    have hscaled :
        algebraMap 𝒪[K] L (chosenIntegerRingUniformizer K ^ d) *
            (algebraMap 𝒪[K] L (chosenIntegerRingUniformizer K ^ m) * y) ∈ M := by
      simpa [Algebra.smul_def, mul_assoc] using
        M.smul_mem (chosenIntegerRingUniformizer K ^ d) hy
    simpa [pow_add, map_mul, mul_assoc, mul_comm, mul_left_comm] using hscaled
  have hN_mem (y : L) (hyN : y ∈ N) :
      algebraMap 𝒪[K] L (chosenIntegerRingUniformizer K ^ n) * y ∈ M := by
    rw [← hSspan] at hyN
    refine Submodule.span_induction
      (p := fun y _ =>
        algebraMap 𝒪[K] L (chosenIntegerRingUniformizer K ^ n) * y ∈ M)
      ?hgen ?hzero ?hadd ?hsmul hyN
    · intro y hyS
      have hyt : y ∈ t := by
        exact (Set.Finite.mem_toFinset hSfinite).2 hyS
      exact hpow_mono (Finset.le_sup hyt) (hnOf_spec y)
    · simp
    · intro y z _ _ hy hz
      simpa [mul_add] using M.add_mem hy hz
    · intro a y _ hy
      have hscaled :
          algebraMap 𝒪[K] L a *
              (algebraMap 𝒪[K] L (chosenIntegerRingUniformizer K ^ n) * y) ∈ M := by
        simpa [Algebra.smul_def, mul_assoc] using M.smul_mem a hy
      simpa [Algebra.smul_def, mul_assoc, mul_comm, mul_left_comm] using hscaled
  refine ⟨n, ?_⟩
  intro z hz
  rcases (mem_chosenBaseUniformizerPowSubmodule_iff (K := K) (L := L) n N z).1 hz with
    ⟨y, hyN, rfl⟩
  exact hN_mem y hyN
omit [FiniteDimensional K L] [IsGalois K L] in
 





theorem exists_chosenBaseUniformizerPow_mul_mul_mem_of_fg_of_field_span_eq_top
    {M N P : Submodule 𝒪[K] L} (hN : N.FG) (hP : P.FG)
    (hMspan : Submodule.span K ((M : Set L)) = ⊤) :
    ∃ n : Nat, ∀ x : L, x ∈ N → ∀ y : L, y ∈ P →
      algebraMap 𝒪[K] L (chosenIntegerRingUniformizer K ^ n) * (x * y) ∈ M := by
  rcases Submodule.fg_def.mp hN with ⟨S, hSfinite, hSspan⟩
  rcases Submodule.fg_def.mp hP with ⟨T, hTfinite, hTspan⟩
  let s : Finset L := hSfinite.toFinset
  let t : Finset L := hTfinite.toFinset
  let pairExp : L × L → Nat := fun p =>
    Classical.choose
      (exists_chosenBaseUniformizerPow_mul_mem_of_field_span_eq_top
        (K := K) (L := L) hMspan (p.1 * p.2))
  let n : Nat := (s.product t).sup pairExp
  have hpair_spec (x y : L) :
      algebraMap 𝒪[K] L (chosenIntegerRingUniformizer K ^ (pairExp (x, y))) * (x * y) ∈ M :=
    Classical.choose_spec
      (exists_chosenBaseUniformizerPow_mul_mem_of_field_span_eq_top
        (K := K) (L := L) hMspan (x * y))
  have hpow_mono {m : Nat} {z : L} (hmn : m ≤ n)
      (hz : algebraMap 𝒪[K] L (chosenIntegerRingUniformizer K ^ m) * z ∈ M) :
      algebraMap 𝒪[K] L (chosenIntegerRingUniformizer K ^ n) * z ∈ M := by
    rcases Nat.exists_eq_add_of_le hmn with ⟨d, hd⟩
    rw [hd]
    have hscaled :
        algebraMap 𝒪[K] L (chosenIntegerRingUniformizer K ^ d) *
            (algebraMap 𝒪[K] L (chosenIntegerRingUniformizer K ^ m) * z) ∈ M := by
      simpa [Algebra.smul_def, mul_assoc] using
        M.smul_mem (chosenIntegerRingUniformizer K ^ d) hz
    simpa [pow_add, map_mul, mul_assoc, mul_comm, mul_left_comm] using hscaled
  have hgen (x y : L) (hxS : x ∈ S) (hyT : y ∈ T) :
      algebraMap 𝒪[K] L (chosenIntegerRingUniformizer K ^ n) * (x * y) ∈ M := by
    have hxs : x ∈ s := (Set.Finite.mem_toFinset hSfinite).2 hxS
    have hyt : y ∈ t := (Set.Finite.mem_toFinset hTfinite).2 hyT
    exact hpow_mono (Finset.le_sup (Finset.mem_product.2 ⟨hxs, hyt⟩))
      (hpair_spec x y)
  have hleft (x : L) (hxS : x ∈ S) :
      ∀ y : L, y ∈ P →
        algebraMap 𝒪[K] L (chosenIntegerRingUniformizer K ^ n) * (x * y) ∈ M := by
    intro y hyP
    rw [← hTspan] at hyP
    refine Submodule.span_induction
      (p := fun y _ =>
        algebraMap 𝒪[K] L (chosenIntegerRingUniformizer K ^ n) * (x * y) ∈ M)
      ?hgen ?hzero ?hadd ?hsmul hyP
    · intro y hyT
      exact hgen x y hxS hyT
    · simp
    · intro y z _ _ hy hz
      simpa [mul_add] using M.add_mem hy hz
    · intro a y _ hy
      have hscaled :
          algebraMap 𝒪[K] L a *
              (algebraMap 𝒪[K] L (chosenIntegerRingUniformizer K ^ n) * (x * y)) ∈ M := by
        simpa [Algebra.smul_def, mul_assoc] using M.smul_mem a hy
      simpa [Algebra.smul_def, mul_assoc, mul_comm, mul_left_comm] using hscaled
  refine ⟨n, ?_⟩
  intro x hxN y hyP
  rw [← hSspan] at hxN
  refine Submodule.span_induction
    (p := fun x _ =>
      algebraMap 𝒪[K] L (chosenIntegerRingUniformizer K ^ n) * (x * y) ∈ M)
    ?gen ?zero ?add ?smul hxN
  · intro x hxS
    exact hleft x hxS y hyP
  · simp
  · intro x z _ _ hx hz
    convert M.add_mem hx hz using 1 ; ring
  · intro a x _ hx
    have hscaled :
        algebraMap 𝒪[K] L a *
            (algebraMap 𝒪[K] L (chosenIntegerRingUniformizer K ^ n) * (x * y)) ∈ M := by
      simpa [Algebra.smul_def, mul_assoc] using M.smul_mem a hx
    simpa [Algebra.smul_def, mul_assoc, mul_comm, mul_left_comm] using hscaled
omit [FiniteDimensional K L] [IsGalois K L] in
 


theorem exists_chosenBaseUniformizerPowSubmodule_mul_mul_mem_self_of_fg_of_field_span_eq_top
    {M : Submodule 𝒪[K] L} (hMfg : M.FG)
    (hMspan : Submodule.span K ((M : Set L)) = ⊤) :
    ∃ c : Nat, ∀ n : Nat, c ≤ n → ∀ x : L,
      x ∈ chosenBaseUniformizerPowSubmodule K L n M →
      ∀ y : L, y ∈ chosenBaseUniformizerPowSubmodule K L n M →
        x * y ∈ chosenBaseUniformizerPowSubmodule K L n M := by
  rcases exists_chosenBaseUniformizerPow_mul_mul_mem_of_fg_of_field_span_eq_top
      (K := K) (L := L) (M := M) (N := M) (P := M) hMfg hMfg hMspan with
    ⟨c, hc⟩
  refine ⟨c, ?_⟩
  intro n hcn x hx y hy
  rcases (mem_chosenBaseUniformizerPowSubmodule_iff (K := K) (L := L) n M x).1 hx with
    ⟨x0, hx0M, rfl⟩
  rcases (mem_chosenBaseUniformizerPowSubmodule_iff (K := K) (L := L) n M y).1 hy with
    ⟨y0, hy0M, rfl⟩
  have hprod :
      algebraMap 𝒪[K] L (chosenIntegerRingUniformizer K ^ n) * (x0 * y0) ∈ M :=
    chosenBaseUniformizerPow_mul_mem_mono (K := K) (L := L) hcn
      (hc x0 hx0M y0 hy0M)
  refine (mem_chosenBaseUniformizerPowSubmodule_iff (K := K) (L := L) n M _).2 ?_
  refine ⟨algebraMap 𝒪[K] L (chosenIntegerRingUniformizer K ^ n) * (x0 * y0),
    hprod, ?_⟩
  simp [mul_assoc, mul_comm, mul_left_comm]
omit [FiniteDimensional K L] [IsGalois K L] in
 




theorem exists_chosenBaseUniformizerPowSubmodule_mul_mul_mem_succ_of_fg_of_field_span_eq_top
    {M : Submodule 𝒪[K] L} (hMfg : M.FG)
    (hMspan : Submodule.span K ((M : Set L)) = ⊤) :
    ∃ c : Nat, ∀ n : Nat, c ≤ n → ∀ x : L,
      x ∈ chosenBaseUniformizerPowSubmodule K L n M →
      ∀ y : L, y ∈ chosenBaseUniformizerPowSubmodule K L n M →
        x * y ∈ chosenBaseUniformizerPowSubmodule K L (n + 1) M := by
  rcases exists_chosenBaseUniformizerPow_mul_mul_mem_of_fg_of_field_span_eq_top
      (K := K) (L := L) (M := M) (N := M) (P := M) hMfg hMfg hMspan with
    ⟨c, hc⟩
  refine ⟨c + 1, ?_⟩
  intro n hcn x hx y hy
  rcases Nat.exists_eq_add_of_le hcn with ⟨d, hd⟩
  rcases (mem_chosenBaseUniformizerPowSubmodule_iff (K := K) (L := L) n M x).1 hx with
    ⟨x0, hx0M, rfl⟩
  rcases (mem_chosenBaseUniformizerPowSubmodule_iff (K := K) (L := L) n M y).1 hy with
    ⟨y0, hy0M, rfl⟩
  have hprod :
      algebraMap 𝒪[K] L (chosenIntegerRingUniformizer K ^ (c + d)) * (x0 * y0) ∈ M :=
    chosenBaseUniformizerPow_mul_mem_mono (K := K) (L := L)
      (Nat.le_add_right c d) (hc x0 hx0M y0 hy0M)
  refine (mem_chosenBaseUniformizerPowSubmodule_iff (K := K) (L := L) (n + 1) M _).2 ?_
  refine ⟨algebraMap 𝒪[K] L (chosenIntegerRingUniformizer K ^ (c + d)) * (x0 * y0),
    hprod, ?_⟩
  rw [hd]
  simp only [map_mul, pow_add, pow_one]
  ring
 

theorem exists_chosenBaseUniformizerPow_chosenNormalBasisIntegerLattice_mul_mul_mem_self :
    ∃ c : Nat, ∀ n : Nat, c ≤ n → ∀ x : L,
      x ∈ chosenBaseUniformizerPowSubmodule K L n (chosenNormalBasisIntegerLattice K L) →
      ∀ y : L,
        y ∈ chosenBaseUniformizerPowSubmodule K L n (chosenNormalBasisIntegerLattice K L) →
          x * y ∈
            chosenBaseUniformizerPowSubmodule K L n (chosenNormalBasisIntegerLattice K L) :=
  exists_chosenBaseUniformizerPowSubmodule_mul_mul_mem_self_of_fg_of_field_span_eq_top
    (K := K) (L := L)
    (M := chosenNormalBasisIntegerLattice K L)
    (chosenNormalBasisIntegerLattice_fg (K := K) (L := L))
    (chosenNormalBasisIntegerLattice_field_span_eq_top (K := K) (L := L))
 
theorem exists_chosenBaseUniformizerPow_chosenNormalBasisIntegerLattice_mul_mul_mem_succ :
    ∃ c : Nat, ∀ n : Nat, c ≤ n → ∀ x : L,
      x ∈ chosenBaseUniformizerPowSubmodule K L n (chosenNormalBasisIntegerLattice K L) →
      ∀ y : L,
        y ∈ chosenBaseUniformizerPowSubmodule K L n (chosenNormalBasisIntegerLattice K L) →
          x * y ∈
            chosenBaseUniformizerPowSubmodule K L (n + 1) (chosenNormalBasisIntegerLattice K L) :=
  exists_chosenBaseUniformizerPowSubmodule_mul_mul_mem_succ_of_fg_of_field_span_eq_top
    (K := K) (L := L)
    (M := chosenNormalBasisIntegerLattice K L)
    (chosenNormalBasisIntegerLattice_fg (K := K) (L := L))
    (chosenNormalBasisIntegerLattice_field_span_eq_top (K := K) (L := L))
omit [FiniteDimensional K L] [IsGalois K L]
  [TopologicalSpace K] [IsNonarchimedeanLocalField K] in
 


theorem submodule_pow_succ_mem_of_mul_closed
    {E : Submodule 𝒪[K] L}
    (hmul : ∀ x : L, x ∈ E → ∀ y : L, y ∈ E → x * y ∈ E)
    {x : L} (hx : x ∈ E) :
    ∀ m : Nat, x ^ (m + 1) ∈ E := by
  intro m
  induction m with
  | zero =>
      simpa using hx
  | succ m ih =>
      have hmul_mem : x ^ (m + 1) * x ∈ E := hmul (x ^ (m + 1)) ih x hx
      simpa [pow_add, mul_assoc, mul_comm, mul_left_comm] using hmul_mem
omit [FiniteDimensional K L] [IsGalois K L] in
 




def inverseCorrectionPartialSum (x : L) (d : Nat) : L :=
  (Finset.range d).sum fun i => (-x) ^ (i + 1)
omit [FiniteDimensional K L] [IsGalois K L] in
 
theorem inverseCorrectionPartialSum_succ (x : L) (d : Nat) :
    inverseCorrectionPartialSum (L := L) x (d + 1) =
      inverseCorrectionPartialSum (L := L) x d + (-x) ^ (d + 1) := by
  simp [inverseCorrectionPartialSum, Finset.sum_range_succ]
omit [FiniteDimensional K L] [IsGalois K L] in
 

theorem one_add_inverseCorrectionPartialSum_eq_geom_sum (x : L) (d : Nat) :
    1 + inverseCorrectionPartialSum (L := L) x d =
      (Finset.range (d + 1)).sum fun i => (-x) ^ i := by
  induction d with
  | zero =>
      simp [inverseCorrectionPartialSum]
  | succ d ih =>
      rw [inverseCorrectionPartialSum_succ, Finset.sum_range_succ, ← ih]
      simp [add_assoc]
omit [FiniteDimensional K L] [IsGalois K L] in
 
theorem one_add_mul_one_add_inverseCorrectionPartialSum (x : L) (d : Nat) :
    (1 + x) * (1 + inverseCorrectionPartialSum (L := L) x d) =
      1 - (-x) ^ (d + 1) := by
  rw [one_add_inverseCorrectionPartialSum_eq_geom_sum]
  simpa [sub_neg_eq_add] using
    (mul_neg_geom_sum (x := (-x : L)) (n := d + 1))
omit [FiniteDimensional K L] [IsGalois K L]
  [TopologicalSpace K] [IsNonarchimedeanLocalField K] in
 
theorem inverseCorrectionPartialSum_mem_of_mul_closed
    {E : Submodule 𝒪[K] L}
    (hmul : ∀ x : L, x ∈ E → ∀ y : L, y ∈ E → x * y ∈ E)
    {x : L} (hx : x ∈ E) (d : Nat) :
    inverseCorrectionPartialSum (L := L) x d ∈ E := by
  unfold inverseCorrectionPartialSum
  refine Submodule.sum_mem E ?_
  intro i _
  exact submodule_pow_succ_mem_of_mul_closed (K := K) (L := L)
    hmul (E.neg_mem hx) i
omit [FiniteDimensional K L] [IsGalois K L]
  [TopologicalSpace K] [IsNonarchimedeanLocalField K] in
 
theorem submodule_isOpen_of_mem_nhds_zero
    [TopologicalSpace L] [IsTopologicalAddGroup L]
    {E : Submodule 𝒪[K] L} (hE : (E : Set L) ∈ nhds (0 : L)) :
    IsOpen (E : Set L) := by
  simpa using AddSubgroup.isOpen_of_mem_nhds E.toAddSubgroup hE
omit [FiniteDimensional K L] [IsGalois K L]
  [TopologicalSpace K] [IsNonarchimedeanLocalField K] in
 
theorem submodule_isClosed_of_isOpen
    [TopologicalSpace L] [IsTopologicalAddGroup L]
    {E : Submodule 𝒪[K] L} (hE : IsOpen (E : Set L)) :
    IsClosed (E : Set L) := by
  simpa using AddSubgroup.isClosed_of_isOpen E.toAddSubgroup hE
omit [FiniteDimensional K L] [IsGalois K L]
  [TopologicalSpace K] [IsNonarchimedeanLocalField K] in
 
theorem submodule_isClosed_of_mem_nhds_zero
    [TopologicalSpace L] [IsTopologicalAddGroup L]
    {E : Submodule 𝒪[K] L} (hE : (E : Set L) ∈ nhds (0 : L)) :
    IsClosed (E : Set L) :=
  submodule_isClosed_of_isOpen (K := K) (L := L)
    (submodule_isOpen_of_mem_nhds_zero (K := K) (L := L) hE)
omit [FiniteDimensional K L] [IsGalois K L]
  [TopologicalSpace K] [IsNonarchimedeanLocalField K] in
 

theorem submodule_mem_of_tendsto_of_forall_mem_of_closed
    [TopologicalSpace L] {E : Submodule 𝒪[K] L} {f : Nat → L} {x : L}
    (hclosed : IsClosed (E : Set L)) (hf : Tendsto f atTop (nhds x))
    (hmem : ∀ d : Nat, f d ∈ E) :
    x ∈ E := by
  exact hclosed.mem_of_tendsto hf (Eventually.of_forall hmem)
variable [ValuativeRel L]
  [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
omit [FiniteDimensional K L] [IsGalois K L] in
 

theorem integerRingMap_uniformizer_mem_maximalIdeal_of_valuationExtension :
    integerRingMapOfValuationExtension K L (chosenIntegerRingUniformizer K) ∈
      (𝓂[L] : Ideal 𝒪[L]) := by
  have hπK :
      chosenIntegerRingUniformizer K ∈ (𝓂[K] : Ideal 𝒪[K]) := by
    rw [chosenIntegerRingUniformizer_maximalIdeal_eq K]
    exact Ideal.subset_span (Set.mem_singleton (chosenIntegerRingUniformizer K))
  exact (Valuation.HasExtension.algebraMap_mem_maximalIdeal_iff
    (ValuativeRel.valuation K) (ValuativeRel.valuation L)).2 hπK
omit [FiniteDimensional K L] [IsGalois K L] in
 





theorem exists_chosenBaseUniformizerPow_mul_mem_integerRing_of_valuationExtension
    [TopologicalSpace L] [IsNonarchimedeanLocalField L] (x : L) :
    ∃ n : Nat,
      algebraMap 𝒪[K] L (chosenIntegerRingUniformizer K ^ n) * x ∈ 𝒪[L] := by
  obtain ⟨a, b, hb, hfrac⟩ := IsFractionRing.div_surjective (A := 𝒪[L]) x
  have hb_ne : b ≠ 0 := nonZeroDivisors.ne_zero hb
  obtain ⟨m, ub, hb_factor⟩ :=
    IsDiscreteValuationRing.eq_unit_mul_pow_irreducible hb_ne
      (chosenIntegerRingUniformizer_irreducible L)
  refine ⟨m, ?_⟩
  let πK_L : 𝒪[L] :=
    integerRingMapOfValuationExtension K L (chosenIntegerRingUniformizer K)
  have hπK_L_mem : πK_L ∈ (𝓂[L] : Ideal 𝒪[L]) := by
    dsimp [πK_L]
    exact integerRingMap_uniformizer_mem_maximalIdeal_of_valuationExtension
      (K := K) (L := L)
  have hπK_L_pow_mem : πK_L ^ m ∈ (𝓂[L] ^ m : Ideal 𝒪[L]) :=
    Ideal.pow_mem_pow hπK_L_mem m
  have hπK_L_span :
      πK_L ^ m ∈
        Ideal.span ({chosenIntegerRingUniformizer L ^ m} : Set 𝒪[L]) := by
    simpa [maximalIdeal_pow_eq_span_uniformizer_pow L m] using hπK_L_pow_mem
  rcases Ideal.mem_span_singleton'.mp hπK_L_span with ⟨c, hc⟩
  rw [← hfrac, hb_factor]
  have hϖL_ne : (((chosenIntegerRingUniformizer L : 𝒪[L]) : L)) ≠ 0 := by
    intro h
    exact (chosenIntegerRingUniformizer_irreducible L).ne_zero
      ((IsFractionRing.injective 𝒪[L] L) h)
  have hϖL_pow_ne :
      (((chosenIntegerRingUniformizer L : 𝒪[L]) : L) ^ m) ≠ 0 :=
    pow_ne_zero m hϖL_ne
  have hub_ne : (((ub : 𝒪[L]) : L)) ≠ 0 := by
    intro h
    exact ub.ne_zero ((IsFractionRing.injective 𝒪[L] L) h)
  have hub_inv :
      (((↑ub⁻¹ : 𝒪[L]) : L)) = (((ub : 𝒪[L]) : L))⁻¹ := by
    exact map_units_inv (algebraMap 𝒪[L] L) ub
  have hbase :
      algebraMap 𝒪[K] L (chosenIntegerRingUniformizer K ^ m) =
        ((πK_L ^ m : 𝒪[L]) : L) := by
    dsimp [πK_L, integerRingMapOfValuationExtension]
    simp only [map_pow]
    change (algebraMap K L ((chosenIntegerRingUniformizer K : 𝒪[K]) : K)) ^ m =
      (algebraMap K L ((chosenIntegerRingUniformizer K : 𝒪[K]) : K)) ^ m
    rfl
  change algebraMap 𝒪[K] L (chosenIntegerRingUniformizer K ^ m) *
      ((a : L) /
        (((ub : 𝒪[L]) * chosenIntegerRingUniformizer L ^ m : 𝒪[L]) : L)) ∈ 𝒪[L]
  rw [hbase]
  have hclear :
      ((πK_L ^ m : 𝒪[L]) : L) *
          ((a : L) /
            (((ub : 𝒪[L]) * chosenIntegerRingUniformizer L ^ m : 𝒪[L]) : L)) =
        ((c * ↑ub⁻¹ * a : 𝒪[L]) : L) := by
    calc
      ((πK_L ^ m : 𝒪[L]) : L) *
          ((a : L) /
            (((ub : 𝒪[L]) * chosenIntegerRingUniformizer L ^ m : 𝒪[L]) : L))
          =
          ((c * chosenIntegerRingUniformizer L ^ m : 𝒪[L]) : L) *
            ((a : L) /
              (((ub : 𝒪[L]) * chosenIntegerRingUniformizer L ^ m : 𝒪[L]) : L)) := by
            rw [← hc]
      _ = ((c : L) * (((ub : 𝒪[L]) : L))⁻¹ * (a : L)) := by
            change
              ((c : L) * (((chosenIntegerRingUniformizer L : 𝒪[L]) : L) ^ m)) *
                  ((a : L) /
                    (((ub : 𝒪[L]) : L) *
                      (((chosenIntegerRingUniformizer L : 𝒪[L]) : L) ^ m))) =
                (c : L) * (((ub : 𝒪[L]) : L))⁻¹ * (a : L)
            field_simp [hub_ne, hϖL_pow_ne]
      _ = ((c * ↑ub⁻¹ * a : 𝒪[L]) : L) := by
            rw [← hub_inv]
            simp [mul_assoc]
  rw [hclear]
  exact (c * ↑ub⁻¹ * a : 𝒪[L]).2
 

def integerRingToFieldLinearMap : 𝒪[L] →ₗ[𝒪[K]] L where
  toFun x := (x : L)
  map_add' := by
    intro x y
    rfl
  map_smul' := by
    intro a x
    rfl
 

def integerRingFieldSubmodule : Submodule 𝒪[K] L where
  carrier := {x | x ∈ 𝒪[L]}
  zero_mem' := by
    change (0 : L) ∈ 𝒪[L]
    exact zero_mem _
  add_mem' := by
    intro x y hx hy
    change x + y ∈ 𝒪[L]
    exact add_mem hx hy
  smul_mem' := by
    intro a x hx
    change a • x ∈ 𝒪[L]
    rw [Algebra.smul_def]
    have ha : algebraMap 𝒪[K] L a ∈ 𝒪[L] := by
      change algebraMap K L (a : K) ∈ 𝒪[L]
      exact (integerRingMapOfValuationExtension K L a).2
    exact mul_mem ha hx
omit [FiniteDimensional K L] [IsGalois K L] [TopologicalSpace K]
  [IsNonarchimedeanLocalField K] in
 
@[simp]
theorem mem_integerRingFieldSubmodule_iff (x : L) :
    x ∈ integerRingFieldSubmodule K L ↔ x ∈ 𝒪[L] :=
  Iff.rfl
omit [FiniteDimensional K L] [IsGalois K L] in
 
theorem chosenBaseUniformizerPow_integerRingFieldSubmodule_mem_nhds_zero
    [TopologicalSpace L] [IsNonarchimedeanLocalField L] (m : Nat) :
    ((chosenBaseUniformizerPowSubmodule K L m
      (integerRingFieldSubmodule K L) : Set L)) ∈ nhds (0 : L) := by
  let a : L := algebraMap 𝒪[K] L (chosenIntegerRingUniformizer K ^ m)
  have hπ_ne : (chosenIntegerRingUniformizer K ^ m : 𝒪[K]) ≠ 0 :=
    pow_ne_zero m (chosenIntegerRingUniformizer_irreducible K).ne_zero
  have ha_ne : a ≠ 0 := by
    dsimp [a]
    change algebraMap K L ((chosenIntegerRingUniformizer K ^ m : 𝒪[K]) : K) ≠ 0
    apply (map_ne_zero (algebraMap K L)).2
    intro h
    exact hπ_ne ((IsFractionRing.injective 𝒪[K] K) h)
  have ha_val_pos : 0 < ValuativeRel.valuation L a := by
    exact (ValuativeRel.valuation L).pos_iff.2 ha_ne
  let γ : (ValuativeRel.ValueGroupWithZero L)ˣ :=
    Units.mk0 (ValuativeRel.valuation L a) (ne_of_gt ha_val_pos)
  refine Filter.mem_of_superset
    ((IsValuativeTopology.hasBasis_nhds_zero L).mem_of_mem (i := γ) trivial) ?_
  intro x hx
  refine (mem_chosenBaseUniformizerPowSubmodule_iff
    (K := K) (L := L) m (integerRingFieldSubmodule K L) x).2 ?_
  refine ⟨a⁻¹ * x, ?_, ?_⟩
  · rw [mem_integerRingFieldSubmodule_iff]
    rw [Valuation.mem_integer_iff]
    have hxle : ValuativeRel.valuation L x ≤ ValuativeRel.valuation L a := le_of_lt hx
    have hval :
        ValuativeRel.valuation L (a⁻¹ * x) =
          (ValuativeRel.valuation L a)⁻¹ * ValuativeRel.valuation L x := by
      simp [map_mul]
    rw [hval]
    exact (inv_mul_le_one₀ ha_val_pos).2 hxle
  · change a * (a⁻¹ * x) = x
    rw [← mul_assoc, mul_inv_cancel₀ ha_ne, one_mul]
omit [FiniteDimensional K L] [IsGalois K L] [TopologicalSpace K]
  [IsNonarchimedeanLocalField K] in
 
def maximalIdealFieldSubmodule : Submodule 𝒪[K] L where
  carrier := {x | ∃ a : 𝒪[L], a ∈ (𝓂[L] : Ideal 𝒪[L]) ∧ (a : L) = x}
  zero_mem' := by
    refine ⟨0, by simp, by simp⟩
  add_mem' := by
    intro x y hx hy
    rcases hx with ⟨a, ha, rfl⟩
    rcases hy with ⟨b, hb, rfl⟩
    refine ⟨a + b, (𝓂[L] : Ideal 𝒪[L]).add_mem ha hb, by simp⟩
  smul_mem' := by
    intro c x hx
    rcases hx with ⟨a, ha, rfl⟩
    refine ⟨integerRingMapOfValuationExtension K L c * a, ?_, ?_⟩
    · exact Ideal.mul_mem_left _ (integerRingMapOfValuationExtension K L c) ha
    · change ((integerRingMapOfValuationExtension K L c : 𝒪[L]) : L) * (a : L) =
        c • (a : L)
      rw [Algebra.smul_def]
      congr 1
omit [FiniteDimensional K L] [IsGalois K L] [TopologicalSpace K]
  [IsNonarchimedeanLocalField K] in
 
@[simp]
theorem mem_maximalIdealFieldSubmodule_iff (x : L) :
    x ∈ maximalIdealFieldSubmodule K L ↔
      ∃ a : 𝒪[L], a ∈ (𝓂[L] : Ideal 𝒪[L]) ∧ (a : L) = x :=
  Iff.rfl
omit [FiniteDimensional K L] [IsGalois K L] in
 





theorem exists_chosenBaseUniformizerPowSubmodule_le_integerRingFieldSubmodule_of_fg
    [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    {N : Submodule 𝒪[K] L} (hN : N.FG) :
    ∃ n : Nat,
      chosenBaseUniformizerPowSubmodule K L n N ≤ integerRingFieldSubmodule K L := by
  rcases Submodule.fg_def.mp hN with ⟨S, hSfinite, hSspan⟩
  let t : Finset L := hSfinite.toFinset
  let nOf : L → Nat := fun y =>
    Classical.choose
      (exists_chosenBaseUniformizerPow_mul_mem_integerRing_of_valuationExtension
        (K := K) (L := L) y)
  let n : Nat := t.sup nOf
  have hnOf_spec (y : L) :
      algebraMap 𝒪[K] L (chosenIntegerRingUniformizer K ^ nOf y) * y ∈ 𝒪[L] :=
    Classical.choose_spec
      (exists_chosenBaseUniformizerPow_mul_mem_integerRing_of_valuationExtension
        (K := K) (L := L) y)
  have hpow_mono {m : Nat} {y : L} (hmn : m ≤ n)
      (hy : algebraMap 𝒪[K] L (chosenIntegerRingUniformizer K ^ m) * y ∈ 𝒪[L]) :
      algebraMap 𝒪[K] L (chosenIntegerRingUniformizer K ^ n) * y ∈ 𝒪[L] := by
    rcases Nat.exists_eq_add_of_le hmn with ⟨d, hd⟩
    have hd_mem :
        algebraMap 𝒪[K] L (chosenIntegerRingUniformizer K ^ d) ∈ 𝒪[L] := by
      change algebraMap K L ((chosenIntegerRingUniformizer K ^ d : 𝒪[K]) : K) ∈ 𝒪[L]
      exact (integerRingMapOfValuationExtension K L
        (chosenIntegerRingUniformizer K ^ d)).2
    rw [hd]
    rw [pow_add, map_mul]
    simpa [mul_assoc, mul_comm, mul_left_comm] using mul_mem hd_mem hy
  have hN_mem (y : L) (hyN : y ∈ N) :
      algebraMap 𝒪[K] L (chosenIntegerRingUniformizer K ^ n) * y ∈ 𝒪[L] := by
    rw [← hSspan] at hyN
    refine Submodule.span_induction
      (p := fun y _ =>
        algebraMap 𝒪[K] L (chosenIntegerRingUniformizer K ^ n) * y ∈ 𝒪[L])
      ?hgen ?hzero ?hadd ?hsmul hyN
    · intro y hyS
      have hyt : y ∈ t := by
        exact (Set.Finite.mem_toFinset hSfinite).2 hyS
      exact hpow_mono (Finset.le_sup hyt) (hnOf_spec y)
    · simp
    · intro y z _ _ hy hz
      simpa [mul_add] using add_mem hy hz
    · intro a y _ hy
      have ha_mem : algebraMap 𝒪[K] L a ∈ 𝒪[L] := by
        change algebraMap K L (a : K) ∈ 𝒪[L]
        exact (integerRingMapOfValuationExtension K L a).2
      simpa [Algebra.smul_def, mul_assoc, mul_comm, mul_left_comm] using
        mul_mem ha_mem hy
  refine ⟨n, ?_⟩
  intro z hz
  rcases (mem_chosenBaseUniformizerPowSubmodule_iff (K := K) (L := L) n N z).1 hz with
    ⟨y, hyN, rfl⟩
  exact hN_mem y hyN
 
theorem exists_chosenBaseUniformizerPow_chosenNormalBasisIntegerLattice_le_integerRingFieldSubmodule
    [TopologicalSpace L] [IsNonarchimedeanLocalField L] :
    ∃ n : Nat,
      chosenBaseUniformizerPowSubmodule K L n (chosenNormalBasisIntegerLattice K L) ≤
        integerRingFieldSubmodule K L :=
  exists_chosenBaseUniformizerPowSubmodule_le_integerRingFieldSubmodule_of_fg
    (K := K) (L := L) (chosenNormalBasisIntegerLattice_fg (K := K) (L := L))
omit [FiniteDimensional K L] [IsGalois K L] [ValuativeRel L]
  [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)] in
 
theorem chosenBaseUniformizerPowSubmodule_add_le_chosenBaseUniformizerPowSubmodule_of_le
    {N M : Submodule 𝒪[K] L} {a n : Nat}
    (h : chosenBaseUniformizerPowSubmodule K L a N ≤ M) :
    chosenBaseUniformizerPowSubmodule K L (a + n) N ≤
      chosenBaseUniformizerPowSubmodule K L n M := by
  intro x hx
  rcases (mem_chosenBaseUniformizerPowSubmodule_iff (K := K) (L := L) (a + n) N x).1 hx with
    ⟨y, hyN, rfl⟩
  refine (mem_chosenBaseUniformizerPowSubmodule_iff (K := K) (L := L) n M _).2 ?_
  refine ⟨algebraMap 𝒪[K] L (chosenIntegerRingUniformizer K ^ a) * y, ?_, ?_⟩
  · exact h ((mem_chosenBaseUniformizerPowSubmodule_iff (K := K) (L := L) a N _).2
      ⟨y, hyN, rfl⟩)
  · simp [pow_add, map_mul, mul_assoc, mul_comm]
omit [FiniteDimensional K L] [IsGalois K L] in
 

theorem chosenBaseUniformizerPowSubmodule_succ_le_maximalIdealFieldSubmodule_of_le_integerRingFieldSubmodule
    {N : Submodule 𝒪[K] L} {b : Nat}
    (hb : chosenBaseUniformizerPowSubmodule K L b N ≤ integerRingFieldSubmodule K L) :
    chosenBaseUniformizerPowSubmodule K L (b + 1) N ≤
      maximalIdealFieldSubmodule K L := by
  intro x hx
  rcases (mem_chosenBaseUniformizerPowSubmodule_iff (K := K) (L := L) (b + 1) N x).1 hx with
    ⟨y, hyN, rfl⟩
  have hby :
      algebraMap 𝒪[K] L (chosenIntegerRingUniformizer K ^ b) * y ∈
        integerRingFieldSubmodule K L := by
    exact hb ((mem_chosenBaseUniformizerPowSubmodule_iff (K := K) (L := L) b N _).2
      ⟨y, hyN, rfl⟩)
  have hby_int :
      algebraMap 𝒪[K] L (chosenIntegerRingUniformizer K ^ b) * y ∈ 𝒪[L] :=
    (mem_integerRingFieldSubmodule_iff (K := K) (L := L)
      (algebraMap 𝒪[K] L (chosenIntegerRingUniformizer K ^ b) * y)).1 hby
  let z : 𝒪[L] :=
    ⟨algebraMap 𝒪[K] L (chosenIntegerRingUniformizer K ^ b) * y, hby_int⟩
  let πL : 𝒪[L] :=
    integerRingMapOfValuationExtension K L (chosenIntegerRingUniformizer K)
  have hπL : πL ∈ (𝓂[L] : Ideal 𝒪[L]) := by
    dsimp [πL]
    exact integerRingMap_uniformizer_mem_maximalIdeal_of_valuationExtension
      (K := K) (L := L)
  refine (mem_maximalIdealFieldSubmodule_iff (K := K) (L := L) _).2 ?_
  refine ⟨πL * z, Ideal.mul_mem_right z _ hπL, ?_⟩
  dsimp [πL, z]
  change algebraMap 𝒪[K] L (chosenIntegerRingUniformizer K) *
      (algebraMap 𝒪[K] L (chosenIntegerRingUniformizer K ^ b) * y) =
    algebraMap 𝒪[K] L (chosenIntegerRingUniformizer K ^ (b + 1)) * y
  simp [pow_add, map_mul, mul_comm, mul_left_comm]
omit [FiniteDimensional K L] [IsGalois K L] in
 

theorem exists_chosenBaseUniformizerPowSubmodule_le_maximalIdealFieldSubmodule_of_fg
    [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    {N : Submodule 𝒪[K] L} (hN : N.FG) :
    ∃ n : Nat,
      chosenBaseUniformizerPowSubmodule K L n N ≤ maximalIdealFieldSubmodule K L := by
  rcases exists_chosenBaseUniformizerPowSubmodule_le_integerRingFieldSubmodule_of_fg
      (K := K) (L := L) hN with
    ⟨b, hb⟩
  exact ⟨b + 1,
    chosenBaseUniformizerPowSubmodule_succ_le_maximalIdealFieldSubmodule_of_le_integerRingFieldSubmodule
      (K := K) (L := L) hb⟩
 
theorem exists_chosenBaseUniformizerPow_chosenNormalBasisIntegerLattice_le_maximalIdealFieldSubmodule
    [TopologicalSpace L] [IsNonarchimedeanLocalField L] :
    ∃ n : Nat,
      chosenBaseUniformizerPowSubmodule K L n (chosenNormalBasisIntegerLattice K L) ≤
        maximalIdealFieldSubmodule K L :=
  exists_chosenBaseUniformizerPowSubmodule_le_maximalIdealFieldSubmodule_of_fg
    (K := K) (L := L) (chosenNormalBasisIntegerLattice_fg (K := K) (L := L))
 

theorem exists_chosenBaseUniformizerPow_chosenNormalBasisIntegerLattice_le_maximalIdeal_and_mul_closed
    [TopologicalSpace L] [IsNonarchimedeanLocalField L] :
    ∃ c : Nat, ∀ n : Nat, c ≤ n →
      chosenBaseUniformizerPowSubmodule K L n (chosenNormalBasisIntegerLattice K L) ≤
        maximalIdealFieldSubmodule K L ∧
      ∀ x : L,
        x ∈ chosenBaseUniformizerPowSubmodule K L n (chosenNormalBasisIntegerLattice K L) →
        ∀ y : L,
          y ∈ chosenBaseUniformizerPowSubmodule K L n (chosenNormalBasisIntegerLattice K L) →
            x * y ∈
              chosenBaseUniformizerPowSubmodule K L n (chosenNormalBasisIntegerLattice K L) := by
  rcases exists_chosenBaseUniformizerPow_chosenNormalBasisIntegerLattice_le_maximalIdealFieldSubmodule
      (K := K) (L := L) with
    ⟨d, hd⟩
  rcases exists_chosenBaseUniformizerPow_chosenNormalBasisIntegerLattice_mul_mul_mem_self
      (K := K) (L := L) with
    ⟨c, hc⟩
  refine ⟨max c d, ?_⟩
  intro n hmaxn
  have hcn : c ≤ n := le_trans (le_max_left c d) hmaxn
  have hdn : d ≤ n := le_trans (le_max_right c d) hmaxn
  constructor
  · exact (chosenBaseUniformizerPowSubmodule_antitone
      (K := K) (L := L) (chosenNormalBasisIntegerLattice K L) hdn).trans hd
  · exact hc n hcn
 




def chosenNormalBasisPrincipalUnitSet (n : Nat) : Set 𝒪[L]ˣ :=
  {u | ((((u : 𝒪[L]ˣ) : 𝒪[L]) - 1 : 𝒪[L]) : L) ∈
    chosenBaseUniformizerPowSubmodule K L n (chosenNormalBasisIntegerLattice K L)}
omit [Valuation.HasExtension
  (ValuativeRel.valuation K) (ValuativeRel.valuation L)] in
 
@[simp]
theorem mem_chosenNormalBasisPrincipalUnitSet_iff (n : Nat) (u : 𝒪[L]ˣ) :
    u ∈ chosenNormalBasisPrincipalUnitSet K L n ↔
      ((((u : 𝒪[L]ˣ) : 𝒪[L]) - 1 : 𝒪[L]) : L) ∈
        chosenBaseUniformizerPowSubmodule K L n (chosenNormalBasisIntegerLattice K L) :=
  Iff.rfl
omit [Valuation.HasExtension
  (ValuativeRel.valuation K) (ValuativeRel.valuation L)] in
 
theorem chosenNormalBasisPrincipalUnitSet_one_mem (n : Nat) :
    (1 : 𝒪[L]ˣ) ∈ chosenNormalBasisPrincipalUnitSet K L n := by
  rw [mem_chosenNormalBasisPrincipalUnitSet_iff]
  simp
omit [Valuation.HasExtension
  (ValuativeRel.valuation K) (ValuativeRel.valuation L)] in
 
theorem chosenNormalBasisPrincipalUnitSet_mul_mem {n : Nat}
    (hmul : ∀ x : L,
      x ∈ chosenBaseUniformizerPowSubmodule K L n (chosenNormalBasisIntegerLattice K L) →
      ∀ y : L,
        y ∈ chosenBaseUniformizerPowSubmodule K L n (chosenNormalBasisIntegerLattice K L) →
          x * y ∈ chosenBaseUniformizerPowSubmodule K L n (chosenNormalBasisIntegerLattice K L))
    {u v : 𝒪[L]ˣ}
    (hu : u ∈ chosenNormalBasisPrincipalUnitSet K L n)
    (hv : v ∈ chosenNormalBasisPrincipalUnitSet K L n) :
    u * v ∈ chosenNormalBasisPrincipalUnitSet K L n := by
  let E : Submodule 𝒪[K] L :=
    chosenBaseUniformizerPowSubmodule K L n (chosenNormalBasisIntegerLattice K L)
  let x : L := ((((u : 𝒪[L]ˣ) : 𝒪[L]) - 1 : 𝒪[L]) : L)
  let y : L := ((((v : 𝒪[L]ˣ) : 𝒪[L]) - 1 : 𝒪[L]) : L)
  have hx : x ∈ E := hu
  have hy : y ∈ E := hv
  have hxy : x * y ∈ E := hmul x hx y hy
  have hsum : x * y + x + y ∈ E := by
    exact E.add_mem (E.add_mem hxy hx) hy
  have hunit :
      ((((u * v : 𝒪[L]ˣ) : 𝒪[L]) - 1 : 𝒪[L]) : L) = x * y + x + y := by
    have h :=
      congrArg (fun z : 𝒪[L] => (z : L)) (unit_mul_sub_one_eq L u v)
    simpa [x, y, map_add, map_mul, mul_assoc, mul_comm, mul_left_comm,
      add_assoc, add_comm, add_left_comm] using h
  rw [mem_chosenNormalBasisPrincipalUnitSet_iff]
  rw [hunit]
  exact hsum
 
theorem chosenNormalBasisPrincipalUnitSet_mem_principalUnits_one {n : Nat}
    (hle : chosenBaseUniformizerPowSubmodule K L n (chosenNormalBasisIntegerLattice K L) ≤
      maximalIdealFieldSubmodule K L)
    {u : 𝒪[L]ˣ} (hu : u ∈ chosenNormalBasisPrincipalUnitSet K L n) :
    u ∈ principalUnits L 1 := by
  rw [mem_principalUnits_iff]
  have hmax :
      ((((u : 𝒪[L]ˣ) : 𝒪[L]) - 1 : 𝒪[L]) : L) ∈
        maximalIdealFieldSubmodule K L :=
    hle hu
  rcases (mem_maximalIdealFieldSubmodule_iff (K := K) (L := L)
      ((((u : 𝒪[L]ˣ) : 𝒪[L]) - 1 : 𝒪[L]) : L)).1 hmax with
    ⟨a, ha, haeq⟩
  have ha_eq : a = ((u : 𝒪[L]ˣ) : 𝒪[L]) - 1 :=
    Subtype.ext haeq
  simpa [ha_eq] using ha
 

theorem exists_chosenNormalBasisPrincipalUnitSet_mul_closed_le_principalUnits_one
    [TopologicalSpace L] [IsNonarchimedeanLocalField L] :
    ∃ c : Nat, ∀ n : Nat, c ≤ n →
      (∀ u : 𝒪[L]ˣ, u ∈ chosenNormalBasisPrincipalUnitSet K L n →
        ∀ v : 𝒪[L]ˣ, v ∈ chosenNormalBasisPrincipalUnitSet K L n →
          u * v ∈ chosenNormalBasisPrincipalUnitSet K L n) ∧
      ∀ u : 𝒪[L]ˣ, u ∈ chosenNormalBasisPrincipalUnitSet K L n →
        u ∈ principalUnits L 1 := by
  rcases exists_chosenBaseUniformizerPow_chosenNormalBasisIntegerLattice_le_maximalIdeal_and_mul_closed
      (K := K) (L := L) with
    ⟨c, hc⟩
  refine ⟨c, ?_⟩
  intro n hcn
  rcases hc n hcn with ⟨hle, hmul⟩
  constructor
  · intro u hu v hv
    exact chosenNormalBasisPrincipalUnitSet_mul_mem (K := K) (L := L) hmul hu hv
  · intro u hu
    exact chosenNormalBasisPrincipalUnitSet_mem_principalUnits_one
      (K := K) (L := L) hle hu
omit [Valuation.HasExtension
  (ValuativeRel.valuation K) (ValuativeRel.valuation L)] in
 
theorem chosenNormalBasisPrincipalUnitSet_inverseCorrectionPartialSum_mem {n : Nat}
    (hmul : ∀ x : L,
      x ∈ chosenBaseUniformizerPowSubmodule K L n (chosenNormalBasisIntegerLattice K L) →
      ∀ y : L,
        y ∈ chosenBaseUniformizerPowSubmodule K L n (chosenNormalBasisIntegerLattice K L) →
          x * y ∈ chosenBaseUniformizerPowSubmodule K L n (chosenNormalBasisIntegerLattice K L))
    {u : 𝒪[L]ˣ} (hu : u ∈ chosenNormalBasisPrincipalUnitSet K L n) (d : Nat) :
    inverseCorrectionPartialSum (L := L)
        ((((u : 𝒪[L]ˣ) : 𝒪[L]) - 1 : 𝒪[L]) : L) d ∈
      chosenBaseUniformizerPowSubmodule K L n (chosenNormalBasisIntegerLattice K L) :=
  inverseCorrectionPartialSum_mem_of_mul_closed (K := K) (L := L) hmul hu d
 
theorem chosenNormalBasisPrincipalUnitSet_neg_sub_one_pow_succ_tendsto_zero
    [TopologicalSpace L] [IsNonarchimedeanLocalField L] {n : Nat}
    (hle : chosenBaseUniformizerPowSubmodule K L n (chosenNormalBasisIntegerLattice K L) ≤
      maximalIdealFieldSubmodule K L)
    {u : 𝒪[L]ˣ} (hu : u ∈ chosenNormalBasisPrincipalUnitSet K L n) :
    Tendsto
      (fun d : Nat => (-(((u : 𝒪[L]ˣ) : 𝒪[L]) - 1)) ^ (d + 1))
      atTop (nhds (0 : 𝒪[L])) := by
  have hu_one : u ∈ principalUnits L 1 :=
    chosenNormalBasisPrincipalUnitSet_mem_principalUnits_one
      (K := K) (L := L) hle hu
  have hpow :
      (((u : 𝒪[L]ˣ) : 𝒪[L]) - 1) ∈ (𝓂[L] ^ 1 : Ideal 𝒪[L]) :=
    (mem_principalUnits_iff L u 1).1 hu_one
  have hmax :
      (((u : 𝒪[L]ˣ) : 𝒪[L]) - 1) ∈ (𝓂[L] : Ideal 𝒪[L]) := by
    simpa [pow_one] using hpow
  exact tendsto_neg_pow_succ_of_mem_maximalIdeal L hmax
 
theorem chosenNormalBasisPrincipalUnitSet_inverseCorrectionProduct_tendsto_one
    [TopologicalSpace L] [IsNonarchimedeanLocalField L] {n : Nat}
    (hle : chosenBaseUniformizerPowSubmodule K L n (chosenNormalBasisIntegerLattice K L) ≤
      maximalIdealFieldSubmodule K L)
    {u : 𝒪[L]ˣ} (hu : u ∈ chosenNormalBasisPrincipalUnitSet K L n) :
    Tendsto
      (fun d : Nat =>
        (((u : 𝒪[L]ˣ) : 𝒪[L]) : L) *
          (1 + inverseCorrectionPartialSum (L := L)
            ((((u : 𝒪[L]ˣ) : 𝒪[L]) - 1 : 𝒪[L]) : L) d))
      atTop (nhds (1 : L)) := by
  let x𝒪 : 𝒪[L] := ((u : 𝒪[L]ˣ) : 𝒪[L]) - 1
  let x : L := (x𝒪 : L)
  have hres𝒪 :
      Tendsto (fun d : Nat => (-x𝒪) ^ (d + 1)) atTop (nhds (0 : 𝒪[L])) := by
    simpa [x𝒪] using
      chosenNormalBasisPrincipalUnitSet_neg_sub_one_pow_succ_tendsto_zero
        (K := K) (L := L) hle hu
  have hresL :
      Tendsto (fun d : Nat => ((((-x𝒪) ^ (d + 1) : 𝒪[L]) : L)))
        atTop (nhds (0 : L)) :=
    (continuous_subtype_val.tendsto (0 : 𝒪[L])).comp hres𝒪
  have htarget :
      Tendsto (fun d : Nat => (1 : L) - ((((-x𝒪) ^ (d + 1) : 𝒪[L]) : L)))
        atTop (nhds (1 : L)) := by
    simpa using (tendsto_const_nhds (x := (1 : L))).sub hresL
  refine htarget.congr' (Eventually.of_forall ?_)
  intro d
  have hgeom :
      (1 + x) * (1 + inverseCorrectionPartialSum (L := L) x d) =
        1 - (-x) ^ (d + 1) :=
    one_add_mul_one_add_inverseCorrectionPartialSum (L := L) x d
  have hu_eq : 1 + x = (((u : 𝒪[L]ˣ) : 𝒪[L]) : L) := by
    simp [x, x𝒪]
  simpa [x, x𝒪, hu_eq] using hgeom.symm
 
theorem chosenNormalBasisPrincipalUnitSet_one_add_inverseCorrection_tendsto_inv
    [TopologicalSpace L] [IsNonarchimedeanLocalField L] {n : Nat}
    (hle : chosenBaseUniformizerPowSubmodule K L n (chosenNormalBasisIntegerLattice K L) ≤
      maximalIdealFieldSubmodule K L)
    {u : 𝒪[L]ˣ} (hu : u ∈ chosenNormalBasisPrincipalUnitSet K L n) :
    Tendsto
      (fun d : Nat =>
        1 + inverseCorrectionPartialSum (L := L)
          ((((u : 𝒪[L]ˣ) : 𝒪[L]) - 1 : 𝒪[L]) : L) d)
      atTop (nhds ((((u⁻¹ : 𝒪[L]ˣ) : 𝒪[L]) : L))) := by
  have hprod :=
    chosenNormalBasisPrincipalUnitSet_inverseCorrectionProduct_tendsto_one
      (K := K) (L := L) hle hu
  have hmul :
      Tendsto
        (fun d : Nat =>
          (((u⁻¹ : 𝒪[L]ˣ) : 𝒪[L]) : L) *
            ((((u : 𝒪[L]ˣ) : 𝒪[L]) : L) *
              (1 + inverseCorrectionPartialSum (L := L)
                ((((u : 𝒪[L]ˣ) : 𝒪[L]) - 1 : 𝒪[L]) : L) d)))
        atTop (nhds ((((u⁻¹ : 𝒪[L]ˣ) : 𝒪[L]) : L))) := by
    simpa using
      (tendsto_const_nhds (x := (((u⁻¹ : 𝒪[L]ˣ) : 𝒪[L]) : L))).mul hprod
  refine hmul.congr' (Eventually.of_forall ?_)
  intro d
  have huinv :
      ((((u⁻¹ : 𝒪[L]ˣ) : 𝒪[L]) : L)) *
          ((((u : 𝒪[L]ˣ) : 𝒪[L]) : L)) = 1 := by
    have huinvₒ :
        (((u⁻¹ : 𝒪[L]ˣ) : 𝒪[L]) * ((u : 𝒪[L]ˣ) : 𝒪[L])) = 1 :=
      Units.inv_mul u
    exact congrArg (algebraMap 𝒪[L] L) huinvₒ
  rw [← mul_assoc, huinv, one_mul]
 
theorem chosenNormalBasisPrincipalUnitSet_inverseCorrection_tendsto_inv_sub_one
    [TopologicalSpace L] [IsNonarchimedeanLocalField L] {n : Nat}
    (hle : chosenBaseUniformizerPowSubmodule K L n (chosenNormalBasisIntegerLattice K L) ≤
      maximalIdealFieldSubmodule K L)
    {u : 𝒪[L]ˣ} (hu : u ∈ chosenNormalBasisPrincipalUnitSet K L n) :
    Tendsto
      (fun d : Nat =>
        inverseCorrectionPartialSum (L := L)
          ((((u : 𝒪[L]ˣ) : 𝒪[L]) - 1 : 𝒪[L]) : L) d)
      atTop (nhds (((((u⁻¹ : 𝒪[L]ˣ) : 𝒪[L]) : L) - 1))) := by
  have h :=
    chosenNormalBasisPrincipalUnitSet_one_add_inverseCorrection_tendsto_inv
      (K := K) (L := L) hle hu
  simpa [sub_eq_add_neg, add_assoc, add_comm, add_left_comm] using
    h.sub (tendsto_const_nhds (x := (1 : L)))
 
theorem chosenNormalBasisPrincipalUnitSet_inverse_sub_one_mem_of_closed
    [TopologicalSpace L] [IsNonarchimedeanLocalField L] {n : Nat}
    (hclosed : IsClosed
      ((chosenBaseUniformizerPowSubmodule K L n
        (chosenNormalBasisIntegerLattice K L) : Set L)))
    (hle : chosenBaseUniformizerPowSubmodule K L n (chosenNormalBasisIntegerLattice K L) ≤
      maximalIdealFieldSubmodule K L)
    (hmul : ∀ x : L,
      x ∈ chosenBaseUniformizerPowSubmodule K L n (chosenNormalBasisIntegerLattice K L) →
      ∀ y : L,
        y ∈ chosenBaseUniformizerPowSubmodule K L n (chosenNormalBasisIntegerLattice K L) →
          x * y ∈ chosenBaseUniformizerPowSubmodule K L n
            (chosenNormalBasisIntegerLattice K L))
    {u : 𝒪[L]ˣ} (hu : u ∈ chosenNormalBasisPrincipalUnitSet K L n) :
    ((((u⁻¹ : 𝒪[L]ˣ) : 𝒪[L]) - 1 : 𝒪[L]) : L) ∈
      chosenBaseUniformizerPowSubmodule K L n (chosenNormalBasisIntegerLattice K L) := by
  let E : Submodule 𝒪[K] L :=
    chosenBaseUniformizerPowSubmodule K L n (chosenNormalBasisIntegerLattice K L)
  have hlim :
      (((((u⁻¹ : 𝒪[L]ˣ) : 𝒪[L]) : L) - 1)) ∈ E := by
    exact submodule_mem_of_tendsto_of_forall_mem_of_closed
      (K := K) (L := L) (E := E) hclosed
      (chosenNormalBasisPrincipalUnitSet_inverseCorrection_tendsto_inv_sub_one
        (K := K) (L := L) hle hu)
      (fun d => chosenNormalBasisPrincipalUnitSet_inverseCorrectionPartialSum_mem
        (K := K) (L := L) hmul hu d)
  simpa [E] using hlim
 
theorem chosenNormalBasisPrincipalUnitSet_inv_mem_of_closed
    [TopologicalSpace L] [IsNonarchimedeanLocalField L] {n : Nat}
    (hclosed : IsClosed
      ((chosenBaseUniformizerPowSubmodule K L n
        (chosenNormalBasisIntegerLattice K L) : Set L)))
    (hle : chosenBaseUniformizerPowSubmodule K L n (chosenNormalBasisIntegerLattice K L) ≤
      maximalIdealFieldSubmodule K L)
    (hmul : ∀ x : L,
      x ∈ chosenBaseUniformizerPowSubmodule K L n (chosenNormalBasisIntegerLattice K L) →
      ∀ y : L,
        y ∈ chosenBaseUniformizerPowSubmodule K L n (chosenNormalBasisIntegerLattice K L) →
          x * y ∈ chosenBaseUniformizerPowSubmodule K L n
            (chosenNormalBasisIntegerLattice K L))
    {u : 𝒪[L]ˣ} (hu : u ∈ chosenNormalBasisPrincipalUnitSet K L n) :
    u⁻¹ ∈ chosenNormalBasisPrincipalUnitSet K L n := by
  rw [mem_chosenNormalBasisPrincipalUnitSet_iff]
  exact chosenNormalBasisPrincipalUnitSet_inverse_sub_one_mem_of_closed
    (K := K) (L := L) hclosed hle hmul hu
 
theorem exists_chosenNormalBasisPrincipalUnitSet_inv_mem_of_closed
    [TopologicalSpace L] [IsNonarchimedeanLocalField L] :
    ∃ c : Nat, ∀ n : Nat, c ≤ n →
      IsClosed
        ((chosenBaseUniformizerPowSubmodule K L n
          (chosenNormalBasisIntegerLattice K L) : Set L)) →
      ∀ u : 𝒪[L]ˣ, u ∈ chosenNormalBasisPrincipalUnitSet K L n →
        u⁻¹ ∈ chosenNormalBasisPrincipalUnitSet K L n := by
  rcases exists_chosenBaseUniformizerPow_chosenNormalBasisIntegerLattice_le_maximalIdeal_and_mul_closed
      (K := K) (L := L) with
    ⟨c, hc⟩
  refine ⟨c, ?_⟩
  intro n hcn hclosed u hu
  rcases hc n hcn with ⟨hle, hmul⟩
  exact chosenNormalBasisPrincipalUnitSet_inv_mem_of_closed
    (K := K) (L := L) hclosed hle hmul hu
omit [FiniteDimensional K L] [IsGalois K L] [TopologicalSpace K]
  [IsNonarchimedeanLocalField K] in
 
theorem integerRingToFieldLinearMap_range_eq :
    LinearMap.range (integerRingToFieldLinearMap K L) =
      integerRingFieldSubmodule K L := by
  ext x
  constructor
  · rintro ⟨y, rfl⟩
    exact y.2
  · intro hx
    exact ⟨⟨x, hx⟩, rfl⟩
omit [FiniteDimensional K L] [IsGalois K L] [TopologicalSpace K]
  [IsNonarchimedeanLocalField K] in
 

theorem integerRingFieldSubmodule_fg_of_moduleFinite
    [Module.Finite 𝒪[K] 𝒪[L]] :
    (integerRingFieldSubmodule K L).FG := by
  have hfg :
      Submodule.FG
        ((⊤ : Submodule 𝒪[K] 𝒪[L]).map (integerRingToFieldLinearMap K L)) :=
    (Module.Finite.fg_top (R := 𝒪[K]) (M := 𝒪[L])).map
      (integerRingToFieldLinearMap K L)
  have hmap :
      (⊤ : Submodule 𝒪[K] 𝒪[L]).map (integerRingToFieldLinearMap K L) =
        integerRingFieldSubmodule K L := by
    rw [Submodule.map_top]
    exact integerRingToFieldLinearMap_range_eq (K := K) (L := L)
  simpa [hmap] using hfg
 


theorem exists_chosenBaseUniformizerPow_integerRingFieldSubmodule_le_chosenNormalBasisIntegerLattice
    [Module.Finite 𝒪[K] 𝒪[L]] :
    ∃ n : Nat,
      chosenBaseUniformizerPowSubmodule K L n (integerRingFieldSubmodule K L) ≤
        chosenNormalBasisIntegerLattice K L :=
  exists_chosenBaseUniformizerPowSubmodule_le_of_fg_of_field_span_eq_top
    (K := K) (L := L)
    (M := chosenNormalBasisIntegerLattice K L)
    (N := integerRingFieldSubmodule K L)
    (integerRingFieldSubmodule_fg_of_moduleFinite (K := K) (L := L))
    (chosenNormalBasisIntegerLattice_field_span_eq_top (K := K) (L := L))
 
theorem exists_chosenBaseUniformizerPow_chosenNormalBasisIntegerLattice_mem_nhds_zero
    [TopologicalSpace L] [IsNonarchimedeanLocalField L] [Module.Finite 𝒪[K] 𝒪[L]] :
    ∃ c : Nat, ∀ n : Nat, c ≤ n →
      ((chosenBaseUniformizerPowSubmodule K L n
        (chosenNormalBasisIntegerLattice K L) : Set L)) ∈ nhds (0 : L) := by
  rcases exists_chosenBaseUniformizerPow_integerRingFieldSubmodule_le_chosenNormalBasisIntegerLattice
      (K := K) (L := L) with
    ⟨a, ha⟩
  refine ⟨a, ?_⟩
  intro n han
  rcases Nat.exists_eq_add_of_le han with ⟨d, rfl⟩
  exact Filter.mem_of_superset
    (chosenBaseUniformizerPow_integerRingFieldSubmodule_mem_nhds_zero
      (K := K) (L := L) (a + (a + d)))
    (chosenBaseUniformizerPowSubmodule_add_le_chosenBaseUniformizerPowSubmodule_of_le
      (K := K) (L := L) (N := integerRingFieldSubmodule K L)
      (M := chosenNormalBasisIntegerLattice K L) (a := a) (n := a + d) ha)
 
theorem exists_chosenBaseUniformizerPow_chosenNormalBasisIntegerLattice_isClosed
    [TopologicalSpace L] [IsNonarchimedeanLocalField L] [Module.Finite 𝒪[K] 𝒪[L]] :
    ∃ c : Nat, ∀ n : Nat, c ≤ n →
      IsClosed
        ((chosenBaseUniformizerPowSubmodule K L n
          (chosenNormalBasisIntegerLattice K L) : Set L)) := by
  rcases exists_chosenBaseUniformizerPow_chosenNormalBasisIntegerLattice_mem_nhds_zero
      (K := K) (L := L) with
    ⟨c, hc⟩
  refine ⟨c, ?_⟩
  intro n hcn
  exact submodule_isClosed_of_mem_nhds_zero
    (K := K) (L := L) (E := chosenBaseUniformizerPowSubmodule K L n
      (chosenNormalBasisIntegerLattice K L)) (hc n hcn)
 
theorem exists_chosenNormalBasisPrincipalUnitSet_inv_mem
    [TopologicalSpace L] [IsNonarchimedeanLocalField L] [Module.Finite 𝒪[K] 𝒪[L]] :
    ∃ c : Nat, ∀ n : Nat, c ≤ n →
      ∀ u : 𝒪[L]ˣ, u ∈ chosenNormalBasisPrincipalUnitSet K L n →
        u⁻¹ ∈ chosenNormalBasisPrincipalUnitSet K L n := by
  rcases exists_chosenNormalBasisPrincipalUnitSet_inv_mem_of_closed
      (K := K) (L := L) with
    ⟨c₁, hc₁⟩
  rcases exists_chosenBaseUniformizerPow_chosenNormalBasisIntegerLattice_isClosed
      (K := K) (L := L) with
    ⟨c₂, hc₂⟩
  refine ⟨max c₁ c₂, ?_⟩
  intro n hmaxn u hu
  have hc₁n : c₁ ≤ n := le_trans (le_max_left c₁ c₂) hmaxn
  have hc₂n : c₂ ≤ n := le_trans (le_max_right c₁ c₂) hmaxn
  exact hc₁ n hc₁n (hc₂ n hc₂n) u hu
 
theorem exists_chosenNormalBasisPrincipalUnitSubgroup
    [TopologicalSpace L] [IsNonarchimedeanLocalField L] [Module.Finite 𝒪[K] 𝒪[L]] :
    ∃ c : Nat, ∀ n : Nat, c ≤ n →
      ∃ V : Subgroup 𝒪[L]ˣ,
        (V : Set 𝒪[L]ˣ) = chosenNormalBasisPrincipalUnitSet K L n ∧
        V ≤ principalUnits L 1 := by
  rcases exists_chosenNormalBasisPrincipalUnitSet_mul_closed_le_principalUnits_one
      (K := K) (L := L) with
    ⟨c₁, hc₁⟩
  rcases exists_chosenNormalBasisPrincipalUnitSet_inv_mem
      (K := K) (L := L) with
    ⟨c₂, hc₂⟩
  refine ⟨max c₁ c₂, ?_⟩
  intro n hmaxn
  have hc₁n : c₁ ≤ n := le_trans (le_max_left c₁ c₂) hmaxn
  have hc₂n : c₂ ≤ n := le_trans (le_max_right c₁ c₂) hmaxn
  rcases hc₁ n hc₁n with ⟨hmul, hle_one⟩
  let V : Subgroup 𝒪[L]ˣ := {
    carrier := chosenNormalBasisPrincipalUnitSet K L n
    one_mem' := chosenNormalBasisPrincipalUnitSet_one_mem (K := K) (L := L) n
    mul_mem' := by
      intro u v hu hv
      exact hmul u hu v hv
    inv_mem' := by
      intro u hu
      exact hc₂ n hc₂n u hu }
  refine ⟨V, rfl, ?_⟩
  intro u hu
  exact hle_one u hu
end
end CyclicCohomology
universe u
namespace CyclicCohomology
open LocalFieldTheory
noncomputable section
open scoped ValuativeRel
open Filter
variable (K L : Type u) [Field K] [Field L] [Algebra K L]
  [FiniteDimensional K L] [IsGalois K L] [ValuativeRel K]
  [TopologicalSpace K] [IsNonarchimedeanLocalField K] [ValuativeRel L]
  [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
omit [Valuation.HasExtension
  (ValuativeRel.valuation K) (ValuativeRel.valuation L)] in
 
theorem chosenNormalBasisPrincipalUnitSet_succ_subset (n : Nat) :
    chosenNormalBasisPrincipalUnitSet K L (n + 1) ⊆
      chosenNormalBasisPrincipalUnitSet K L n := by
  intro u hu
  rw [mem_chosenNormalBasisPrincipalUnitSet_iff] at hu ⊢
  exact chosenBaseUniformizerPowSubmodule_succ_le
    (K := K) (L := L) n (chosenNormalBasisIntegerLattice K L) hu
 
def chosenNormalBasisLatticeSuccSubmodule (n : Nat) :
    Submodule 𝒪[K]
      (chosenBaseUniformizerPowSubmodule K L n (chosenNormalBasisIntegerLattice K L)) :=
  (chosenBaseUniformizerPowSubmodule K L (n + 1)
    (chosenNormalBasisIntegerLattice K L)).submoduleOf
      (chosenBaseUniformizerPowSubmodule K L n
        (chosenNormalBasisIntegerLattice K L))
 
def chosenNormalBasisLatticeSuccQuot (n : Nat) : Type u :=
  (chosenBaseUniformizerPowSubmodule K L n (chosenNormalBasisIntegerLattice K L)) ⧸
    chosenNormalBasisLatticeSuccSubmodule K L n
 
instance chosenNormalBasisLatticeSuccQuotAddCommGroup (n : Nat) :
    AddCommGroup (chosenNormalBasisLatticeSuccQuot K L n) := by
  change AddCommGroup
    ((chosenBaseUniformizerPowSubmodule K L n (chosenNormalBasisIntegerLattice K L)) ⧸
      chosenNormalBasisLatticeSuccSubmodule K L n)
  infer_instance
 

instance chosenNormalBasisLatticeSuccQuotModule (n : Nat) :
    Module 𝒪[K] (chosenNormalBasisLatticeSuccQuot K L n) := by
  change Module 𝒪[K]
    ((chosenBaseUniformizerPowSubmodule K L n (chosenNormalBasisIntegerLattice K L)) ⧸
      chosenNormalBasisLatticeSuccSubmodule K L n)
  infer_instance
 

def chosenNormalBasisLatticeSuccQuotConcreteLinearEquiv (n : Nat) :
    chosenNormalBasisLatticeSuccQuot K L n ≃ₗ[𝒪[K]]
      ((chosenBaseUniformizerPowSubmodule K L n (chosenNormalBasisIntegerLattice K L)) ⧸
        chosenNormalBasisLatticeSuccSubmodule K L n) := by
  change
    ((chosenBaseUniformizerPowSubmodule K L n (chosenNormalBasisIntegerLattice K L)) ⧸
        chosenNormalBasisLatticeSuccSubmodule K L n) ≃ₗ[𝒪[K]]
      ((chosenBaseUniformizerPowSubmodule K L n (chosenNormalBasisIntegerLattice K L)) ⧸
        chosenNormalBasisLatticeSuccSubmodule K L n)
  exact LinearEquiv.refl 𝒪[K] _
omit [ValuativeRel L]
  [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)] in
 
@[simp]
theorem mem_chosenNormalBasisLatticeSuccSubmodule_iff (n : Nat)
    (x : chosenBaseUniformizerPowSubmodule K L n (chosenNormalBasisIntegerLattice K L)) :
    x ∈ chosenNormalBasisLatticeSuccSubmodule K L n ↔
      (x : L) ∈ chosenBaseUniformizerPowSubmodule K L (n + 1)
        (chosenNormalBasisIntegerLattice K L) :=
  Iff.rfl
 
def chosenNormalBasisLatticeSuccQuotMk (n : Nat) :
    chosenBaseUniformizerPowSubmodule K L n (chosenNormalBasisIntegerLattice K L) →ₗ[𝒪[K]]
      chosenNormalBasisLatticeSuccQuot K L n := by
  change
    chosenBaseUniformizerPowSubmodule K L n (chosenNormalBasisIntegerLattice K L) →ₗ[𝒪[K]]
      ((chosenBaseUniformizerPowSubmodule K L n (chosenNormalBasisIntegerLattice K L)) ⧸
        chosenNormalBasisLatticeSuccSubmodule K L n)
  exact (chosenNormalBasisLatticeSuccSubmodule K L n).mkQ
omit [ValuativeRel L]
  [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)] in
 
@[simp]
theorem chosenNormalBasisLatticeSuccQuotConcreteLinearEquiv_mk (n : Nat)
    (x : chosenBaseUniformizerPowSubmodule K L n (chosenNormalBasisIntegerLattice K L)) :
    chosenNormalBasisLatticeSuccQuotConcreteLinearEquiv K L n
        (chosenNormalBasisLatticeSuccQuotMk K L n x) =
      Submodule.Quotient.mk x :=
  rfl
omit [ValuativeRel L]
  [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)] in
 

protected theorem chosenNormalBasisLatticeSuccQuot.inductionOn
    (n : Nat)
    {motive : chosenNormalBasisLatticeSuccQuot K L n → Prop}
    (q : chosenNormalBasisLatticeSuccQuot K L n)
    (h : ∀ x :
      chosenBaseUniformizerPowSubmodule K L n (chosenNormalBasisIntegerLattice K L),
      motive (chosenNormalBasisLatticeSuccQuotMk K L n x)) :
    motive q := by
  change motive
    (show
      (chosenBaseUniformizerPowSubmodule K L n (chosenNormalBasisIntegerLattice K L)) ⧸
        chosenNormalBasisLatticeSuccSubmodule K L n from q)
  exact
    Submodule.Quotient.induction_on
      (chosenNormalBasisLatticeSuccSubmodule K L n) q h
omit [ValuativeRel L]
  [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)] in
 

theorem chosenNormalBasisLatticeSuccQuotMk_eq_zero_iff (n : Nat)
    (x : chosenBaseUniformizerPowSubmodule K L n (chosenNormalBasisIntegerLattice K L)) :
    chosenNormalBasisLatticeSuccQuotMk K L n x = 0 ↔
      (x : L) ∈ chosenBaseUniformizerPowSubmodule K L (n + 1)
        (chosenNormalBasisIntegerLattice K L) := by
  change
    (Submodule.Quotient.mk x :
      (chosenBaseUniformizerPowSubmodule K L n (chosenNormalBasisIntegerLattice K L)) ⧸
        chosenNormalBasisLatticeSuccSubmodule K L n) = 0 ↔ _
  rw [Submodule.Quotient.mk_eq_zero]
  rfl
omit [ValuativeRel L]
  [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)] in
 

@[simp]
theorem chosenNormalBasisLatticeSuccQuotMk_eq_iff (n : Nat)
    (x y :
      chosenBaseUniformizerPowSubmodule K L n (chosenNormalBasisIntegerLattice K L)) :
    chosenNormalBasisLatticeSuccQuotMk K L n x =
        chosenNormalBasisLatticeSuccQuotMk K L n y ↔
      x - y ∈ chosenNormalBasisLatticeSuccSubmodule K L n := by
  change
    (Submodule.Quotient.mk x :
      (chosenBaseUniformizerPowSubmodule K L n (chosenNormalBasisIntegerLattice K L)) ⧸
        chosenNormalBasisLatticeSuccSubmodule K L n) =
      Submodule.Quotient.mk y ↔ _
  exact Submodule.Quotient.eq (chosenNormalBasisLatticeSuccSubmodule K L n)
 
def chosenNormalBasisPrincipalUnitLatticeClass (n : Nat)
    (u : 𝒪[L]ˣ) (hu : u ∈ chosenNormalBasisPrincipalUnitSet K L n) :
    chosenNormalBasisLatticeSuccQuot K L n :=
  chosenNormalBasisLatticeSuccQuotMk K L n
    ⟨((((u : 𝒪[L]ˣ) : 𝒪[L]) - 1 : 𝒪[L]) : L), hu⟩
omit [Valuation.HasExtension
  (ValuativeRel.valuation K) (ValuativeRel.valuation L)] in
 

theorem chosenNormalBasisPrincipalUnitLatticeClass_eq_zero_iff {n : Nat}
    (u : 𝒪[L]ˣ) (hu : u ∈ chosenNormalBasisPrincipalUnitSet K L n) :
    chosenNormalBasisPrincipalUnitLatticeClass K L n u hu = 0 ↔
      u ∈ chosenNormalBasisPrincipalUnitSet K L (n + 1) := by
  rw [chosenNormalBasisPrincipalUnitLatticeClass,
    chosenNormalBasisLatticeSuccQuotMk_eq_zero_iff]
  rfl
omit [Valuation.HasExtension
  (ValuativeRel.valuation K) (ValuativeRel.valuation L)] in
 

theorem chosenNormalBasisPrincipalUnitSet_mul_error_mem_succ {n : Nat}
    (hmul_succ : ∀ x : L,
      x ∈ chosenBaseUniformizerPowSubmodule K L n (chosenNormalBasisIntegerLattice K L) →
      ∀ y : L,
        y ∈ chosenBaseUniformizerPowSubmodule K L n (chosenNormalBasisIntegerLattice K L) →
          x * y ∈
            chosenBaseUniformizerPowSubmodule K L (n + 1) (chosenNormalBasisIntegerLattice K L))
    {u v : 𝒪[L]ˣ}
    (hu : u ∈ chosenNormalBasisPrincipalUnitSet K L n)
    (hv : v ∈ chosenNormalBasisPrincipalUnitSet K L n) :
    (((((u * v : 𝒪[L]ˣ) : 𝒪[L]) - 1 : 𝒪[L]) : L) -
        (((((u : 𝒪[L]ˣ) : 𝒪[L]) - 1 : 𝒪[L]) : L) +
          ((((v : 𝒪[L]ˣ) : 𝒪[L]) - 1 : 𝒪[L]) : L))) ∈
      chosenBaseUniformizerPowSubmodule K L (n + 1)
        (chosenNormalBasisIntegerLattice K L) := by
  let x : L := ((((u : 𝒪[L]ˣ) : 𝒪[L]) - 1 : 𝒪[L]) : L)
  let y : L := ((((v : 𝒪[L]ˣ) : 𝒪[L]) - 1 : 𝒪[L]) : L)
  have hx : x ∈ chosenBaseUniformizerPowSubmodule K L n
      (chosenNormalBasisIntegerLattice K L) := hu
  have hy : y ∈ chosenBaseUniformizerPowSubmodule K L n
      (chosenNormalBasisIntegerLattice K L) := hv
  have hxy : x * y ∈ chosenBaseUniformizerPowSubmodule K L (n + 1)
      (chosenNormalBasisIntegerLattice K L) :=
    hmul_succ x hx y hy
  have hunit :
      ((((u * v : 𝒪[L]ˣ) : 𝒪[L]) - 1 : 𝒪[L]) : L) = x * y + x + y := by
    have h :=
      congrArg (fun z : 𝒪[L] => (z : L)) (unit_mul_sub_one_eq L u v)
    simpa [x, y, map_add, map_mul, mul_assoc, mul_comm, mul_left_comm,
      add_assoc, add_comm, add_left_comm] using h
  change
    ((((u * v : 𝒪[L]ˣ) : 𝒪[L]) - 1 : 𝒪[L]) : L) - (x + y) ∈
      chosenBaseUniformizerPowSubmodule K L (n + 1)
        (chosenNormalBasisIntegerLattice K L)
  rw [hunit]
  convert hxy using 1 ; ring
omit [Valuation.HasExtension
  (ValuativeRel.valuation K) (ValuativeRel.valuation L)] in
 

theorem exists_chosenNormalBasisPrincipalUnitSet_mul_error_mem_succ :
    ∃ c : Nat, ∀ n : Nat, c ≤ n →
      ∀ u : 𝒪[L]ˣ, u ∈ chosenNormalBasisPrincipalUnitSet K L n →
        ∀ v : 𝒪[L]ˣ, v ∈ chosenNormalBasisPrincipalUnitSet K L n →
          (((((u * v : 𝒪[L]ˣ) : 𝒪[L]) - 1 : 𝒪[L]) : L) -
              (((((u : 𝒪[L]ˣ) : 𝒪[L]) - 1 : 𝒪[L]) : L) +
                ((((v : 𝒪[L]ˣ) : 𝒪[L]) - 1 : 𝒪[L]) : L))) ∈
            chosenBaseUniformizerPowSubmodule K L (n + 1)
              (chosenNormalBasisIntegerLattice K L) := by
  rcases exists_chosenBaseUniformizerPow_chosenNormalBasisIntegerLattice_mul_mul_mem_succ
      (K := K) (L := L) with
    ⟨c, hc⟩
  refine ⟨c, ?_⟩
  intro n hcn u hu v hv
  exact chosenNormalBasisPrincipalUnitSet_mul_error_mem_succ
    (K := K) (L := L) (hc n hcn) hu hv
omit [Valuation.HasExtension
  (ValuativeRel.valuation K) (ValuativeRel.valuation L)] in
 
theorem chosenNormalBasisPrincipalUnitLatticeClass_mul_eq_add {n : Nat}
    (hmul_error : ∀ u : 𝒪[L]ˣ, u ∈ chosenNormalBasisPrincipalUnitSet K L n →
      ∀ v : 𝒪[L]ˣ, v ∈ chosenNormalBasisPrincipalUnitSet K L n →
        (((((u * v : 𝒪[L]ˣ) : 𝒪[L]) - 1 : 𝒪[L]) : L) -
            (((((u : 𝒪[L]ˣ) : 𝒪[L]) - 1 : 𝒪[L]) : L) +
              ((((v : 𝒪[L]ˣ) : 𝒪[L]) - 1 : 𝒪[L]) : L))) ∈
          chosenBaseUniformizerPowSubmodule K L (n + 1)
            (chosenNormalBasisIntegerLattice K L))
    (u v : 𝒪[L]ˣ)
    (hu : u ∈ chosenNormalBasisPrincipalUnitSet K L n)
    (hv : v ∈ chosenNormalBasisPrincipalUnitSet K L n)
    (huv : u * v ∈ chosenNormalBasisPrincipalUnitSet K L n) :
    chosenNormalBasisPrincipalUnitLatticeClass K L n (u * v) huv =
      chosenNormalBasisPrincipalUnitLatticeClass K L n u hu +
        chosenNormalBasisPrincipalUnitLatticeClass K L n v hv := by
  rw [chosenNormalBasisPrincipalUnitLatticeClass, chosenNormalBasisPrincipalUnitLatticeClass,
    chosenNormalBasisPrincipalUnitLatticeClass]
  rw [← map_add, chosenNormalBasisLatticeSuccQuotMk_eq_iff,
    mem_chosenNormalBasisLatticeSuccSubmodule_iff]
  change
    (((((u * v : 𝒪[L]ˣ) : 𝒪[L]) - 1 : 𝒪[L]) : L) -
        (((((u : 𝒪[L]ˣ) : 𝒪[L]) - 1 : 𝒪[L]) : L) +
          ((((v : 𝒪[L]ˣ) : 𝒪[L]) - 1 : 𝒪[L]) : L))) ∈
      chosenBaseUniformizerPowSubmodule K L (n + 1)
        (chosenNormalBasisIntegerLattice K L)
  exact hmul_error u hu v hv
 
theorem exists_chosenNormalBasisPrincipalUnitSubgroupSuccPair
    [TopologicalSpace L] [IsNonarchimedeanLocalField L] [Module.Finite 𝒪[K] 𝒪[L]] :
    ∃ c : Nat, ∀ n : Nat, c ≤ n →
      ∃ Vn Vsucc : Subgroup 𝒪[L]ˣ,
        (Vn : Set 𝒪[L]ˣ) = chosenNormalBasisPrincipalUnitSet K L n ∧
        (Vsucc : Set 𝒪[L]ˣ) = chosenNormalBasisPrincipalUnitSet K L (n + 1) ∧
        Vsucc ≤ Vn ∧
        Vn ≤ principalUnits L 1 := by
  rcases exists_chosenNormalBasisPrincipalUnitSubgroup (K := K) (L := L) with
    ⟨c, hc⟩
  refine ⟨c, ?_⟩
  intro n hcn
  rcases hc n hcn with ⟨Vn, hVn, hVnle⟩
  have hcsucc : c ≤ n + 1 := le_trans hcn (Nat.le_succ n)
  rcases hc (n + 1) hcsucc with ⟨Vsucc, hVsucc, _hVsuccle⟩
  refine ⟨Vn, Vsucc, hVn, hVsucc, ?_, hVnle⟩
  intro u hu
  have hu_succ : u ∈ chosenNormalBasisPrincipalUnitSet K L (n + 1) := by
    exact hVsucc ▸ hu
  have hu_n : u ∈ chosenNormalBasisPrincipalUnitSet K L n :=
    chosenNormalBasisPrincipalUnitSet_succ_subset (K := K) (L := L) n hu_succ
  change u ∈ (Vn : Set 𝒪[L]ˣ)
  exact hVn.symm ▸ hu_n
 


def chosenNormalBasisPrincipalUnitSuccSubgroup {Vn Vsucc : Subgroup 𝒪[L]ˣ}
    (_hV : Vsucc ≤ Vn) : Subgroup Vn :=
  Vsucc.subgroupOf Vn
 
theorem mem_chosenNormalBasisPrincipalUnitSuccSubgroup_iff
    {Vn Vsucc : Subgroup 𝒪[L]ˣ} (hV : Vsucc ≤ Vn) (u : Vn) :
    u ∈ chosenNormalBasisPrincipalUnitSuccSubgroup (L := L) hV ↔
      (u : 𝒪[L]ˣ) ∈ Vsucc := by
  rw [chosenNormalBasisPrincipalUnitSuccSubgroup]
  exact Subgroup.mem_subgroupOf
 

def chosenNormalBasisPrincipalUnitSuccQuot
    {Vn Vsucc : Subgroup 𝒪[L]ˣ} (hV : Vsucc ≤ Vn) : Type u :=
  Vn ⧸ chosenNormalBasisPrincipalUnitSuccSubgroup (L := L) hV
 
instance chosenNormalBasisPrincipalUnitSuccQuotCommGroup
    {Vn Vsucc : Subgroup 𝒪[L]ˣ} (hV : Vsucc ≤ Vn) :
    CommGroup (chosenNormalBasisPrincipalUnitSuccQuot (L := L) hV) := by
  change CommGroup
    (Vn ⧸ chosenNormalBasisPrincipalUnitSuccSubgroup (L := L) hV)
  infer_instance
 

def chosenNormalBasisPrincipalUnitSuccQuotConcreteEquiv
    {Vn Vsucc : Subgroup 𝒪[L]ˣ} (hV : Vsucc ≤ Vn) :
    chosenNormalBasisPrincipalUnitSuccQuot (L := L) hV ≃*
      (Vn ⧸ chosenNormalBasisPrincipalUnitSuccSubgroup (L := L) hV) := by
  change
    (Vn ⧸ chosenNormalBasisPrincipalUnitSuccSubgroup (L := L) hV) ≃*
      (Vn ⧸ chosenNormalBasisPrincipalUnitSuccSubgroup (L := L) hV)
  exact MulEquiv.refl _
 
def chosenNormalBasisPrincipalUnitSuccQuotMk
    {Vn Vsucc : Subgroup 𝒪[L]ˣ} (hV : Vsucc ≤ Vn) :
    Vn →* chosenNormalBasisPrincipalUnitSuccQuot (L := L) hV := by
  change Vn →*
    (Vn ⧸ chosenNormalBasisPrincipalUnitSuccSubgroup (L := L) hV)
  exact QuotientGroup.mk'
    (chosenNormalBasisPrincipalUnitSuccSubgroup (L := L) hV)
 
theorem chosenNormalBasisPrincipalUnitSuccQuotMk_surjective
    {Vn Vsucc : Subgroup 𝒪[L]ˣ} (hV : Vsucc ≤ Vn) :
    Function.Surjective
      (chosenNormalBasisPrincipalUnitSuccQuotMk (L := L) hV) :=
  QuotientGroup.mk'_surjective
    (chosenNormalBasisPrincipalUnitSuccSubgroup (L := L) hV)
 

protected theorem chosenNormalBasisPrincipalUnitSuccQuot.inductionOn
    {Vn Vsucc : Subgroup 𝒪[L]ˣ} (hV : Vsucc ≤ Vn)
    {motive : chosenNormalBasisPrincipalUnitSuccQuot (L := L) hV → Prop}
    (q : chosenNormalBasisPrincipalUnitSuccQuot (L := L) hV)
    (h : ∀ u : Vn,
      motive (chosenNormalBasisPrincipalUnitSuccQuotMk (L := L) hV u)) :
    motive q := by
  change motive
    (show Vn ⧸ chosenNormalBasisPrincipalUnitSuccSubgroup (L := L) hV from q)
  refine QuotientGroup.induction_on q ?_
  intro u
  exact h u
 
def chosenNormalBasisPrincipalUnitSuccQuotLift
    {Vn Vsucc : Subgroup 𝒪[L]ˣ} {H : Type*} [Group H]
    (hV : Vsucc ≤ Vn) (f : Vn →* H)
    (h : chosenNormalBasisPrincipalUnitSuccSubgroup (L := L) hV ≤ f.ker) :
    chosenNormalBasisPrincipalUnitSuccQuot (L := L) hV →* H := by
  change
    (Vn ⧸ chosenNormalBasisPrincipalUnitSuccSubgroup (L := L) hV) →* H
  exact QuotientGroup.lift
    (chosenNormalBasisPrincipalUnitSuccSubgroup (L := L) hV) f h
 
theorem chosenNormalBasisPrincipalUnitSuccQuotMk_eq_one_iff
    {Vn Vsucc : Subgroup 𝒪[L]ˣ} (hV : Vsucc ≤ Vn) (u : Vn) :
    chosenNormalBasisPrincipalUnitSuccQuotMk (L := L) hV u = 1 ↔
      (u : 𝒪[L]ˣ) ∈ Vsucc := by
  change
    (QuotientGroup.mk u :
      Vn ⧸ chosenNormalBasisPrincipalUnitSuccSubgroup (L := L) hV) = 1 ↔ _
  rw [QuotientGroup.eq_one_iff]
  exact mem_chosenNormalBasisPrincipalUnitSuccSubgroup_iff (L := L) hV u
 

def chosenNormalBasisPrincipalUnitToLatticeSuccQuotHom (n : Nat)
    {Vn : Subgroup 𝒪[L]ˣ}
    (hVn : (Vn : Set 𝒪[L]ˣ) = chosenNormalBasisPrincipalUnitSet K L n)
    (hmul_error : ∀ u : 𝒪[L]ˣ, u ∈ chosenNormalBasisPrincipalUnitSet K L n →
      ∀ v : 𝒪[L]ˣ, v ∈ chosenNormalBasisPrincipalUnitSet K L n →
        (((((u * v : 𝒪[L]ˣ) : 𝒪[L]) - 1 : 𝒪[L]) : L) -
            (((((u : 𝒪[L]ˣ) : 𝒪[L]) - 1 : 𝒪[L]) : L) +
              ((((v : 𝒪[L]ˣ) : 𝒪[L]) - 1 : 𝒪[L]) : L))) ∈
          chosenBaseUniformizerPowSubmodule K L (n + 1)
            (chosenNormalBasisIntegerLattice K L)) :
    Vn →* Multiplicative (chosenNormalBasisLatticeSuccQuot K L n) where
  toFun u :=
    Multiplicative.ofAdd
      (chosenNormalBasisPrincipalUnitLatticeClass K L n (u : 𝒪[L]ˣ)
        (by
          exact hVn ▸ u.2))
  map_one' := by
    change chosenNormalBasisPrincipalUnitLatticeClass K L n
      (1 : 𝒪[L]ˣ) (by exact hVn ▸ (1 : Vn).2) = 0
    rw [chosenNormalBasisPrincipalUnitLatticeClass,
      chosenNormalBasisLatticeSuccQuotMk_eq_zero_iff]
    simp
  map_mul' := by
    intro u v
    have hu : (u : 𝒪[L]ˣ) ∈ chosenNormalBasisPrincipalUnitSet K L n := by
      exact hVn ▸ u.2
    have hv : (v : 𝒪[L]ˣ) ∈ chosenNormalBasisPrincipalUnitSet K L n := by
      exact hVn ▸ v.2
    have huv : ((u * v : Vn) : 𝒪[L]ˣ) ∈ chosenNormalBasisPrincipalUnitSet K L n := by
      exact hVn ▸ (u * v).2
    have hclass :=
      chosenNormalBasisPrincipalUnitLatticeClass_mul_eq_add
        (K := K) (L := L) hmul_error (u : 𝒪[L]ˣ) (v : 𝒪[L]ˣ) hu hv huv
    simpa using congrArg Multiplicative.ofAdd hclass
omit [Valuation.HasExtension
  (ValuativeRel.valuation K) (ValuativeRel.valuation L)] in
 
theorem chosenNormalBasisPrincipalUnitToLatticeSuccQuotHom_mem_ker_of_mem_succ
    {n : Nat} {Vn Vsucc : Subgroup 𝒪[L]ˣ}
    (hVn : (Vn : Set 𝒪[L]ˣ) = chosenNormalBasisPrincipalUnitSet K L n)
    (hVsucc : (Vsucc : Set 𝒪[L]ˣ) = chosenNormalBasisPrincipalUnitSet K L (n + 1))
    (hmul_error : ∀ u : 𝒪[L]ˣ, u ∈ chosenNormalBasisPrincipalUnitSet K L n →
      ∀ v : 𝒪[L]ˣ, v ∈ chosenNormalBasisPrincipalUnitSet K L n →
        (((((u * v : 𝒪[L]ˣ) : 𝒪[L]) - 1 : 𝒪[L]) : L) -
            (((((u : 𝒪[L]ˣ) : 𝒪[L]) - 1 : 𝒪[L]) : L) +
              ((((v : 𝒪[L]ˣ) : 𝒪[L]) - 1 : 𝒪[L]) : L))) ∈
          chosenBaseUniformizerPowSubmodule K L (n + 1)
            (chosenNormalBasisIntegerLattice K L))
    (u : Vn) (hu : (u : 𝒪[L]ˣ) ∈ Vsucc) :
    u ∈ (chosenNormalBasisPrincipalUnitToLatticeSuccQuotHom
      K L n hVn hmul_error).ker := by
  rw [MonoidHom.mem_ker]
  have hu_n : (u : 𝒪[L]ˣ) ∈ chosenNormalBasisPrincipalUnitSet K L n := by
    exact hVn ▸ u.2
  have hu_succ : (u : 𝒪[L]ˣ) ∈ chosenNormalBasisPrincipalUnitSet K L (n + 1) := by
    exact hVsucc ▸ hu
  have hzero :
      chosenNormalBasisPrincipalUnitLatticeClass K L n (u : 𝒪[L]ˣ) hu_n = 0 :=
    (chosenNormalBasisPrincipalUnitLatticeClass_eq_zero_iff
      (K := K) (L := L) (u : 𝒪[L]ˣ) hu_n).2 hu_succ
  change Multiplicative.ofAdd
      (chosenNormalBasisPrincipalUnitLatticeClass K L n (u : 𝒪[L]ˣ) hu_n) = 1
  simpa using congrArg Multiplicative.ofAdd hzero
 


def chosenNormalBasisPrincipalUnitSuccQuotToLatticeSuccQuotHom (n : Nat)
    {Vn Vsucc : Subgroup 𝒪[L]ˣ}
    (hVn : (Vn : Set 𝒪[L]ˣ) = chosenNormalBasisPrincipalUnitSet K L n)
    (hVsucc : (Vsucc : Set 𝒪[L]ˣ) = chosenNormalBasisPrincipalUnitSet K L (n + 1))
    (hV : Vsucc ≤ Vn)
    (hmul_error : ∀ u : 𝒪[L]ˣ, u ∈ chosenNormalBasisPrincipalUnitSet K L n →
      ∀ v : 𝒪[L]ˣ, v ∈ chosenNormalBasisPrincipalUnitSet K L n →
        (((((u * v : 𝒪[L]ˣ) : 𝒪[L]) - 1 : 𝒪[L]) : L) -
            (((((u : 𝒪[L]ˣ) : 𝒪[L]) - 1 : 𝒪[L]) : L) +
              ((((v : 𝒪[L]ˣ) : 𝒪[L]) - 1 : 𝒪[L]) : L))) ∈
          chosenBaseUniformizerPowSubmodule K L (n + 1)
            (chosenNormalBasisIntegerLattice K L)) :
    chosenNormalBasisPrincipalUnitSuccQuot (L := L) hV →*
      Multiplicative (chosenNormalBasisLatticeSuccQuot K L n) :=
  chosenNormalBasisPrincipalUnitSuccQuotLift (L := L) hV
    (chosenNormalBasisPrincipalUnitToLatticeSuccQuotHom K L n hVn hmul_error)
    (by
      intro u hu
      have hu_succ : (u : 𝒪[L]ˣ) ∈ Vsucc :=
        (mem_chosenNormalBasisPrincipalUnitSuccSubgroup_iff (L := L) hV u).1 hu
      exact chosenNormalBasisPrincipalUnitToLatticeSuccQuotHom_mem_ker_of_mem_succ
        (K := K) (L := L) hVn hVsucc hmul_error u hu_succ)
omit [Valuation.HasExtension
  (ValuativeRel.valuation K) (ValuativeRel.valuation L)] in
 
theorem chosenNormalBasisPrincipalUnitSuccQuotToLatticeSuccQuotHom_mk
    {n : Nat} {Vn Vsucc : Subgroup 𝒪[L]ˣ}
    (hVn : (Vn : Set 𝒪[L]ˣ) = chosenNormalBasisPrincipalUnitSet K L n)
    (hVsucc : (Vsucc : Set 𝒪[L]ˣ) = chosenNormalBasisPrincipalUnitSet K L (n + 1))
    (hV : Vsucc ≤ Vn)
    (hmul_error : ∀ u : 𝒪[L]ˣ, u ∈ chosenNormalBasisPrincipalUnitSet K L n →
      ∀ v : 𝒪[L]ˣ, v ∈ chosenNormalBasisPrincipalUnitSet K L n →
        (((((u * v : 𝒪[L]ˣ) : 𝒪[L]) - 1 : 𝒪[L]) : L) -
            (((((u : 𝒪[L]ˣ) : 𝒪[L]) - 1 : 𝒪[L]) : L) +
              ((((v : 𝒪[L]ˣ) : 𝒪[L]) - 1 : 𝒪[L]) : L))) ∈
          chosenBaseUniformizerPowSubmodule K L (n + 1)
            (chosenNormalBasisIntegerLattice K L))
    (u : Vn) :
    chosenNormalBasisPrincipalUnitSuccQuotToLatticeSuccQuotHom
        K L n hVn hVsucc hV hmul_error
        (chosenNormalBasisPrincipalUnitSuccQuotMk (L := L) hV u) =
      chosenNormalBasisPrincipalUnitToLatticeSuccQuotHom K L n hVn hmul_error u :=
  rfl
end
end CyclicCohomology
end

/- ClassFieldTheory.LocalClassFieldTheory.ClassFormation.NormalBasisInfiniteProduct -/
section
namespace LocalClassFieldTheory
open CyclicCohomology
open CyclicCohomology LocalFieldTheory
noncomputable section
universe u
open scoped BigOperators
open scoped ValuativeRel
open Filter IsNonarchimedeanLocalField
open CyclicCohomology.ProfiniteCohomology.Herbrand
variable (K L : Type u) [Field K] [Field L] [Algebra K L]
  [FiniteDimensional K L] [IsGalois K L]
  [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
  [ValuativeRel L]
  [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
omit [FiniteDimensional K L] [IsGalois K L] in
 


theorem chosenBaseUniformizerPow_integerRingFieldSubmodule_exists_mem_maximalIdeal_pow
    (m : Nat) {x : L}
    (hx : x ∈ chosenBaseUniformizerPowSubmodule K L m
      (integerRingFieldSubmodule K L)) :
    ∃ a : 𝒪[L], a ∈ (𝓂[L] ^ m : Ideal 𝒪[L]) ∧ (a : L) = x := by
  rcases (mem_chosenBaseUniformizerPowSubmodule_iff
      (K := K) (L := L) m (integerRingFieldSubmodule K L) x).1 hx with
    ⟨y, hy, rfl⟩
  let yInt : 𝒪[L] := ⟨y,
    (mem_integerRingFieldSubmodule_iff (K := K) (L := L) y).1 hy⟩
  let πL : 𝒪[L] :=
    integerRingMapOfValuationExtension K L (chosenIntegerRingUniformizer K)
  have hπL : πL ∈ (𝓂[L] : Ideal 𝒪[L]) := by
    exact integerRingMap_uniformizer_mem_maximalIdeal_of_valuationExtension
      (K := K) (L := L)
  refine ⟨πL ^ m * yInt, ?_, ?_⟩
  · exact Ideal.mul_mem_right yInt _ (Ideal.pow_mem_pow hπL m)
  · dsimp [πL, yInt]
    rw [map_pow]
    rfl
 

theorem chosenNormalBasisPrincipalUnitSet_mem_principalUnits_succ_of_lattice_bound
    {b n i : Nat}
    (hb : chosenBaseUniformizerPowSubmodule K L b
        (chosenNormalBasisIntegerLattice K L) ≤
      integerRingFieldSubmodule K L)
    (hbn : b + 1 ≤ n) {z : 𝒪[L]ˣ}
    (hz : z ∈ chosenNormalBasisPrincipalUnitSet K L (n + i)) :
    z ∈ principalUnits L (1 + i) := by
  rcases Nat.exists_eq_add_of_le hbn with ⟨r, rfl⟩
  let x : L := ((((z : 𝒪[L]ˣ) : 𝒪[L]) - 1 : 𝒪[L]) : L)
  have hxdeep : x ∈ chosenBaseUniformizerPowSubmodule K L
      (b + ((1 + r) + i)) (chosenNormalBasisIntegerLattice K L) := by
    simpa [x, Nat.add_assoc] using hz
  have hxint : x ∈ chosenBaseUniformizerPowSubmodule K L ((1 + r) + i)
      (integerRingFieldSubmodule K L) :=
    chosenBaseUniformizerPowSubmodule_add_le_chosenBaseUniformizerPowSubmodule_of_le
      (K := K) (L := L) (a := b) (n := (1 + r) + i) hb hxdeep
  rcases chosenBaseUniformizerPow_integerRingFieldSubmodule_exists_mem_maximalIdeal_pow
      (K := K) (L := L) ((1 + r) + i) hxint with ⟨a, ha, hax⟩
  have hpow : (𝓂[L] ^ ((1 + r) + i) : Ideal 𝒪[L]) ≤
      (𝓂[L] ^ (1 + i) : Ideal 𝒪[L]) := by
    apply Ideal.pow_le_pow_right
    exact Nat.add_le_add_right (Nat.le_add_right 1 r) i
  have ha' : a ∈ (𝓂[L] ^ (1 + i) : Ideal 𝒪[L]) := hpow ha
  rw [mem_principalUnits_iff]
  have haeq : a = ((z : 𝒪[L]ˣ) : 𝒪[L]) - 1 := by
    apply Subtype.ext
    simpa [x] using hax
  simpa [haeq] using ha'
 

theorem tendsto_chosenNormalBasisPrincipalUnitSequence_one_of_lattice_bound
    [UniformSpace L] [IsUniformAddGroup L] [IsNonarchimedeanLocalField L]
    {b n : Nat}
    (hb : chosenBaseUniformizerPowSubmodule K L b
        (chosenNormalBasisIntegerLattice K L) ≤
      integerRingFieldSubmodule K L)
    (hbn : b + 1 ≤ n) (z : Nat → 𝒪[L]ˣ)
    (hz : ∀ i : Nat, z i ∈ chosenNormalBasisPrincipalUnitSet K L (n + i)) :
    Tendsto (fun i : Nat => ((z i : 𝒪[L]ˣ) : 𝒪[L])) atTop
      (nhds (1 : 𝒪[L])) := by
  have hsub : Tendsto
      (fun i : Nat => ((z i : 𝒪[L]ˣ) : 𝒪[L]) - 1) atTop
      (nhds (0 : 𝒪[L])) := by
    rw [tendsto_def]
    intro s hs
    rcases eventually_maximalIdeal_pow_subset_nhds_zero L s hs with ⟨N, hN⟩
    filter_upwards [eventually_ge_atTop N] with i hi
    apply hN (1 + i)
    · exact le_trans hi (Nat.le_add_left i 1)
    · exact (mem_principalUnits_iff L (z i) (1 + i)).1
        (chosenNormalBasisPrincipalUnitSet_mem_principalUnits_succ_of_lattice_bound
          (K := K) (L := L) hb hbn (hz i))
  simpa using hsub.const_add (1 : 𝒪[L])
 


theorem continuous_integerRingEquiv_of_isNonarchimedeanLocalField
    [UniformSpace L] [IsUniformAddGroup L] [IsNonarchimedeanLocalField L]
    (e : 𝒪[L] ≃+* 𝒪[L]) : Continuous e := by
  apply continuous_of_continuousAt_zero e.toAddMonoidHom
  rw [ContinuousAt, map_zero, tendsto_def]
  intro s hs
  rcases exists_maximalIdeal_pow_subset_nhds_zero L s hs with ⟨N, hN⟩
  exact Filter.mem_of_superset (maximalIdeal_pow_mem_nhds_zero L N)
    (fun x hx => hN
      ((integerRingEquiv_mem_maximalIdeal_pow L e N x).2 hx))
omit [IsGalois K L] [TopologicalSpace K] [IsNonarchimedeanLocalField K] in
 


theorem tendsto_galoisGroupIntegerUnits_tateNorm_of_tendsto
    [UniformSpace L] [IsUniformAddGroup L] [IsNonarchimedeanLocalField L]
    [IsIntegralClosure 𝒪[L] 𝒪[K] L]
    (f : Nat → 𝒪[L]ˣ) (x : 𝒪[L]ˣ)
    (hf : Tendsto (fun d : Nat => ((f d : 𝒪[L]ˣ) : 𝒪[L])) atTop
      (nhds ((x : 𝒪[L]ˣ) : 𝒪[L]))) :
    letI := galoisGroupIntegerUnitsMulDistribMulActionOfIsIntegralClosure K L
    Tendsto
      (fun d : Nat =>
        ((tateNorm (Gal(L / K)) 𝒪[L]ˣ (f d) : 𝒪[L]ˣ) : 𝒪[L]))
      atTop
      (nhds ((tateNorm (Gal(L / K)) 𝒪[L]ˣ x : 𝒪[L]ˣ) : 𝒪[L])) := by
  let := galoisGroupIntegerUnitsMulDistribMulActionOfIsIntegralClosure K L
  have hσ (sigma : Gal(L / K)) : Tendsto
      (fun d : Nat => ((sigma • f d : 𝒪[L]ˣ) : 𝒪[L])) atTop
      (nhds ((sigma • x : 𝒪[L]ˣ) : 𝒪[L])) := by
    have he :=
      (continuous_integerRingEquiv_of_isNonarchimedeanLocalField L
        (galoisGroupIntegerRingEquivOfIsIntegralClosure K L sigma)).tendsto
          ((x : 𝒪[L]ˣ) : 𝒪[L]) |>.comp hf
    rw [show
      (⇑(galoisGroupIntegerRingEquivOfIsIntegralClosure K L sigma) ∘
          fun d : Nat => ((f d : 𝒪[L]ˣ) : 𝒪[L])) =
        (fun d : Nat =>
          (galoisGroupIntegerRingEquivOfIsIntegralClosure K L sigma)
            ((f d : 𝒪[L]ˣ) : 𝒪[L])) by
      funext d
      rfl] at he
    simpa [
      galoisGroupIntegerUnitsMulDistribMulActionOfIsIntegralClosure_smul] using he
  have hprod := tendsto_finsetProd
    (Finset.univ : Finset (Gal(L / K))) (fun sigma _ => hσ sigma)
  convert hprod using 1 <;> simp [tateNorm]
omit [FiniteDimensional K L] [IsGalois K L]
    [TopologicalSpace K] [IsNonarchimedeanLocalField K] in
 



theorem tendsto_galoisGroupIntegerUnits_sigmaMinusOne_of_tendsto
    [UniformSpace L] [IsUniformAddGroup L] [IsNonarchimedeanLocalField L]
    [IsIntegralClosure 𝒪[L] 𝒪[K] L]
    (g : Gal(L / K)) (f : Nat → 𝒪[L]ˣ) (x : 𝒪[L]ˣ)
    (hf : Tendsto (fun d : Nat => ((f d : 𝒪[L]ˣ) : 𝒪[L])) atTop
      (nhds ((x : 𝒪[L]ˣ) : 𝒪[L]))) :
    letI := galoisGroupIntegerUnitsMulDistribMulActionOfIsIntegralClosure K L
    Tendsto
      (fun d : Nat =>
        ((sigmaMinusOne (Gal(L / K)) 𝒪[L]ˣ g (f d) : 𝒪[L]ˣ) : 𝒪[L]))
      atTop
      (nhds ((sigmaMinusOne (Gal(L / K)) 𝒪[L]ˣ g x : 𝒪[L]ˣ) : 𝒪[L])) := by
  let := galoisGroupIntegerUnitsMulDistribMulActionOfIsIntegralClosure K L
  have hgO : Tendsto
      (fun d : Nat => ((g • f d : 𝒪[L]ˣ) : 𝒪[L])) atTop
      (nhds ((g • x : 𝒪[L]ˣ) : 𝒪[L])) := by
    have he :=
      (continuous_integerRingEquiv_of_isNonarchimedeanLocalField L
        (galoisGroupIntegerRingEquivOfIsIntegralClosure K L g)).tendsto
          ((x : 𝒪[L]ˣ) : 𝒪[L]) |>.comp hf
    rw [show
      (⇑(galoisGroupIntegerRingEquivOfIsIntegralClosure K L g) ∘
          fun d : Nat => ((f d : 𝒪[L]ˣ) : 𝒪[L])) =
        (fun d : Nat =>
          (galoisGroupIntegerRingEquivOfIsIntegralClosure K L g)
            ((f d : 𝒪[L]ˣ) : 𝒪[L])) by
      funext d
      rfl] at he
    simpa [
      galoisGroupIntegerUnitsMulDistribMulActionOfIsIntegralClosure_smul] using he
  have hfL : Tendsto
      (fun d : Nat => (((f d : 𝒪[L]ˣ) : 𝒪[L]) : L)) atTop
      (nhds (((x : 𝒪[L]ˣ) : 𝒪[L]) : L)) :=
    continuous_subtype_val.tendsto ((x : 𝒪[L]ˣ) : 𝒪[L]) |>.comp hf
  have hgL : Tendsto
      (fun d : Nat => (((g • f d : 𝒪[L]ˣ) : 𝒪[L]) : L)) atTop
      (nhds (((g • x : 𝒪[L]ˣ) : 𝒪[L]) : L)) :=
    continuous_subtype_val.tendsto ((g • x : 𝒪[L]ˣ) : 𝒪[L]) |>.comp hgO
  have hinv_coe (u : 𝒪[L]ˣ) :
      ((((u⁻¹ : 𝒪[L]ˣ) : 𝒪[L])) : L) =
        ((((u : 𝒪[L]ˣ) : 𝒪[L])) : L)⁻¹ := by
    apply eq_inv_of_mul_eq_one_right
    exact congrArg (fun y : 𝒪[L] => (y : L)) u.val_inv
  apply tendsto_subtype_rng.2
  have h := hgL.mul (hfL.inv₀ (by
    intro hx0
    apply Units.ne_zero x
    apply Subtype.ext
    exact hx0))
  convert h using 1 <;> simp [sigmaMinusOne, hinv_coe]
 

def chosenNormalBasisPrincipalUnitSequenceAsPrincipalUnits
    {b n : Nat}
    (hb : chosenBaseUniformizerPowSubmodule K L b
        (chosenNormalBasisIntegerLattice K L) ≤
      integerRingFieldSubmodule K L)
    (hbn : b + 1 ≤ n) (z : Nat → 𝒪[L]ˣ)
    (hz : ∀ i : Nat, z i ∈ chosenNormalBasisPrincipalUnitSet K L (n + i))
    (i : Nat) : principalUnits L (1 + i) :=
  ⟨z i,
    chosenNormalBasisPrincipalUnitSet_mem_principalUnits_succ_of_lattice_bound
      (K := K) (L := L) hb hbn (hz i)⟩
 
def chosenNormalBasisPrincipalUnitCorrectionProduct (z : Nat → 𝒪[L]ˣ) :
    Nat → 𝒪[L]ˣ
  | 0 => 1
  | d + 1 => chosenNormalBasisPrincipalUnitCorrectionProduct z d * z d
 
@[simp]
theorem chosenNormalBasisPrincipalUnitCorrectionProduct_succ
    (z : Nat → 𝒪[L]ˣ) (d : Nat) :
    chosenNormalBasisPrincipalUnitCorrectionProduct (L := L) z (d + 1) =
      chosenNormalBasisPrincipalUnitCorrectionProduct (L := L) z d * z d :=
  rfl
 

theorem chosenNormalBasisPrincipalUnitCorrectionProduct_eq_principalUnitsCorrectionProduct
    {b n : Nat}
    (hb : chosenBaseUniformizerPowSubmodule K L b
        (chosenNormalBasisIntegerLattice K L) ≤
      integerRingFieldSubmodule K L)
    (hbn : b + 1 ≤ n) (z : Nat → 𝒪[L]ˣ)
    (hz : ∀ i : Nat, z i ∈ chosenNormalBasisPrincipalUnitSet K L (n + i))
    (d : Nat) :
    chosenNormalBasisPrincipalUnitCorrectionProduct (L := L) z d =
      principalUnitsCorrectionProduct L 1
        (chosenNormalBasisPrincipalUnitSequenceAsPrincipalUnits K L hb hbn z hz) d := by
  induction d with
  | zero => rfl
  | succ d ih =>
      rw [chosenNormalBasisPrincipalUnitCorrectionProduct_succ,
        principalUnitsCorrectionProduct_succ, ih]
      rfl
omit [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)] in
 

theorem chosenNormalBasisPrincipalUnitCorrectionProduct_mem
    {n : Nat}
    (hmul : ∀ u : 𝒪[L]ˣ, u ∈ chosenNormalBasisPrincipalUnitSet K L n →
      ∀ v : 𝒪[L]ˣ, v ∈ chosenNormalBasisPrincipalUnitSet K L n →
        u * v ∈ chosenNormalBasisPrincipalUnitSet K L n)
    (z : Nat → 𝒪[L]ˣ)
    (hz : ∀ i : Nat, z i ∈ chosenNormalBasisPrincipalUnitSet K L (n + i))
    (d : Nat) :
    chosenNormalBasisPrincipalUnitCorrectionProduct (L := L) z d ∈
      chosenNormalBasisPrincipalUnitSet K L n := by
  induction d with
  | zero =>
      exact chosenNormalBasisPrincipalUnitSet_one_mem (K := K) (L := L) n
  | succ d ih =>
      rw [chosenNormalBasisPrincipalUnitCorrectionProduct_succ]
      apply hmul _ ih (z d)
      exact chosenBaseUniformizerPowSubmodule_antitone
        (K := K) (L := L) (chosenNormalBasisIntegerLattice K L)
        (Nat.le_add_right n d) (hz d)
 


theorem exists_tendsto_chosenNormalBasisPrincipalUnitCorrectionProduct_principalUnit
    [UniformSpace L] [IsUniformAddGroup L] [IsNonarchimedeanLocalField L]
    {b n : Nat}
    (hb : chosenBaseUniformizerPowSubmodule K L b
        (chosenNormalBasisIntegerLattice K L) ≤
      integerRingFieldSubmodule K L)
    (hbn : b + 1 ≤ n) (z : Nat → 𝒪[L]ˣ)
    (hz : ∀ i : Nat, z i ∈ chosenNormalBasisPrincipalUnitSet K L (n + i)) :
    ∃ x : principalUnits L 1,
      Tendsto
        (fun d : Nat =>
          ((chosenNormalBasisPrincipalUnitCorrectionProduct (L := L) z d : 𝒪[L]ˣ) :
            𝒪[L]))
        atTop (nhds (((x : principalUnits L 1) : 𝒪[L]ˣ) : 𝒪[L])) := by
  let zU : ∀ i : Nat, principalUnits L (1 + i) :=
    chosenNormalBasisPrincipalUnitSequenceAsPrincipalUnits K L hb hbn z hz
  rcases exists_tendsto_principalUnitsCorrectionProduct_principalUnit
      L 1 (by rfl) zU with ⟨x, hx⟩
  refine ⟨x, hx.congr' (Eventually.of_forall ?_)⟩
  intro d
  exact congrArg (fun q : 𝒪[L]ˣ => (q : 𝒪[L]))
    (chosenNormalBasisPrincipalUnitCorrectionProduct_eq_principalUnitsCorrectionProduct
      (K := K) (L := L) hb hbn z hz d).symm
omit [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)] in
 

theorem chosenNormalBasisPrincipalUnitCorrectionProduct_limit_mem
    [UniformSpace L] [IsUniformAddGroup L] [IsNonarchimedeanLocalField L]
    {n : Nat}
    (hclosed : IsClosed
      ((chosenBaseUniformizerPowSubmodule K L n
        (chosenNormalBasisIntegerLattice K L) : Set L)))
    (hmul : ∀ u : 𝒪[L]ˣ, u ∈ chosenNormalBasisPrincipalUnitSet K L n →
      ∀ v : 𝒪[L]ˣ, v ∈ chosenNormalBasisPrincipalUnitSet K L n →
        u * v ∈ chosenNormalBasisPrincipalUnitSet K L n)
    (z : Nat → 𝒪[L]ˣ)
    (hz : ∀ i : Nat, z i ∈ chosenNormalBasisPrincipalUnitSet K L (n + i))
    (x : 𝒪[L]ˣ)
    (hx : Tendsto
      (fun d : Nat =>
        ((chosenNormalBasisPrincipalUnitCorrectionProduct (L := L) z d : 𝒪[L]ˣ) :
          𝒪[L]))
      atTop (nhds ((x : 𝒪[L]ˣ) : 𝒪[L]))) :
    x ∈ chosenNormalBasisPrincipalUnitSet K L n := by
  have hxL : Tendsto
      (fun d : Nat =>
        (((chosenNormalBasisPrincipalUnitCorrectionProduct (L := L) z d : 𝒪[L]ˣ) :
          𝒪[L]) : L))
      atTop (nhds ((((x : 𝒪[L]ˣ) : 𝒪[L])) : L)) :=
    (continuous_subtype_val.tendsto ((x : 𝒪[L]ˣ) : 𝒪[L])).comp hx
  have hsub : Tendsto
      (fun d : Nat =>
        (((((chosenNormalBasisPrincipalUnitCorrectionProduct (L := L) z d : 𝒪[L]ˣ) :
          𝒪[L]) - 1 : 𝒪[L]) : L)))
      atTop (nhds (((((x : 𝒪[L]ˣ) : 𝒪[L]) - 1 : 𝒪[L]) : L))) := by
    simpa using hxL.sub (tendsto_const_nhds (x := (1 : L)))
  rw [mem_chosenNormalBasisPrincipalUnitSet_iff]
  exact submodule_mem_of_tendsto_of_forall_mem_of_closed
    (K := K) (L := L) hclosed hsub
    (fun d => chosenNormalBasisPrincipalUnitCorrectionProduct_mem
      (K := K) (L := L) hmul z hz d)
 


theorem exists_tendsto_chosenNormalBasisPrincipalUnitCorrectionProduct
    [UniformSpace L] [IsUniformAddGroup L] [IsNonarchimedeanLocalField L]
    [Module.Finite 𝒪[K] 𝒪[L]] :
    ∃ c : Nat, ∀ n : Nat, c ≤ n →
      ∀ z : Nat → 𝒪[L]ˣ,
        (∀ i : Nat, z i ∈ chosenNormalBasisPrincipalUnitSet K L (n + i)) →
          ∃ x : 𝒪[L]ˣ,
            Tendsto
                (fun d : Nat =>
                  ((chosenNormalBasisPrincipalUnitCorrectionProduct (L := L) z d :
                    𝒪[L]ˣ) : 𝒪[L]))
                atTop (nhds ((x : 𝒪[L]ˣ) : 𝒪[L])) ∧
              x ∈ chosenNormalBasisPrincipalUnitSet K L n := by
  rcases exists_chosenBaseUniformizerPow_chosenNormalBasisIntegerLattice_le_integerRingFieldSubmodule
      (K := K) (L := L) with ⟨b, hb⟩
  rcases exists_chosenBaseUniformizerPow_chosenNormalBasisIntegerLattice_mul_mul_mem_self
      (K := K) (L := L) with ⟨cMul, hcMul⟩
  rcases exists_chosenBaseUniformizerPow_chosenNormalBasisIntegerLattice_isClosed
      (K := K) (L := L) with ⟨cClosed, hcClosed⟩
  refine ⟨max (b + 1) (max cMul cClosed), ?_⟩
  intro n hn z hz
  have hbn : b + 1 ≤ n :=
    le_trans (le_max_left (b + 1) (max cMul cClosed)) hn
  have hrest : max cMul cClosed ≤ max (b + 1) (max cMul cClosed) :=
    le_max_right (b + 1) (max cMul cClosed)
  have hcMuln : cMul ≤ n :=
    le_trans (le_trans (le_max_left cMul cClosed) hrest) hn
  have hcClosedn : cClosed ≤ n :=
    le_trans (le_trans (le_max_right cMul cClosed) hrest) hn
  let hmulLattice := hcMul n hcMuln
  have hmul : ∀ u : 𝒪[L]ˣ, u ∈ chosenNormalBasisPrincipalUnitSet K L n →
      ∀ v : 𝒪[L]ˣ, v ∈ chosenNormalBasisPrincipalUnitSet K L n →
        u * v ∈ chosenNormalBasisPrincipalUnitSet K L n := by
    intro u hu v hv
    exact chosenNormalBasisPrincipalUnitSet_mul_mem
      (K := K) (L := L) hmulLattice hu hv
  rcases exists_tendsto_chosenNormalBasisPrincipalUnitCorrectionProduct_principalUnit
      (K := K) (L := L) hb hbn z hz with ⟨x, hx⟩
  let xu : 𝒪[L]ˣ := (x : principalUnits L 1)
  refine ⟨xu, ?_, ?_⟩
  · exact hx
  · exact chosenNormalBasisPrincipalUnitCorrectionProduct_limit_mem
      (K := K) (L := L) (hcClosed n hcClosedn) hmul z hz xu hx
end
end LocalClassFieldTheory
end

/- ClassFieldTheory.LocalClassFieldTheory.ClassFormation.FilteredLiftingSequence -/
section
namespace LocalClassFieldTheory
noncomputable section
universe u
 
def filteredCorrectionProduct {A : Type u} [Monoid A] (z : Nat → A) : Nat → A
  | 0 => 1
  | d + 1 => filteredCorrectionProduct z d * z d
 
@[simp]
theorem filteredCorrectionProduct_zero {A : Type u} [Monoid A] (z : Nat → A) :
    filteredCorrectionProduct z 0 = 1 :=
  rfl
 
@[simp]
theorem filteredCorrectionProduct_succ {A : Type u} [Monoid A]
    (z : Nat → A) (d : Nat) :
    filteredCorrectionProduct z (d + 1) = filteredCorrectionProduct z d * z d :=
  rfl
 

structure FilteredLiftState (A : Type u) (P : Nat → A → Prop)
    (R : A → Prop) (n i : Nat) where
   
  value : A
   
  mem : P (n + i) value
   
  stable : R value
 
structure FilteredLiftStep (A : Type u) [CommGroup A]
    (P : Nat → A → Prop) (R : A → Prop) (F : A →* A)
    (n i : Nat) (s : FilteredLiftState A P R n i) where
   
  correction : A
   
  correction_mem : P (n + i) correction
   
  next : FilteredLiftState A P R n (i + 1)
   
  equation : s.value = F correction * next.value
 
noncomputable def chosenFilteredLiftStateSequence
    (A : Type u) [CommGroup A] (P : Nat → A → Prop) (R : A → Prop)
    (F : A →* A) (n : Nat) (initial : FilteredLiftState A P R n 0)
    (step : ∀ i (s : FilteredLiftState A P R n i),
      Nonempty (FilteredLiftStep A P R F n i s)) :
    (i : Nat) → FilteredLiftState A P R n i
  | 0 => initial
  | i + 1 =>
      (Classical.choice
        (step i (chosenFilteredLiftStateSequence A P R F n initial step i))).next
 
noncomputable def chosenFilteredLiftCorrectionSequence
    (A : Type u) [CommGroup A] (P : Nat → A → Prop) (R : A → Prop)
    (F : A →* A) (n : Nat) (initial : FilteredLiftState A P R n 0)
    (step : ∀ i (s : FilteredLiftState A P R n i),
      Nonempty (FilteredLiftStep A P R F n i s)) (i : Nat) : A :=
  (Classical.choice
    (step i (chosenFilteredLiftStateSequence A P R F n initial step i))).correction
 
@[simp]
theorem chosenFilteredLiftStateSequence_zero
    (A : Type u) [CommGroup A] (P : Nat → A → Prop) (R : A → Prop)
    (F : A →* A) (n : Nat) (initial : FilteredLiftState A P R n 0)
    (step : ∀ i (s : FilteredLiftState A P R n i),
      Nonempty (FilteredLiftStep A P R F n i s)) :
    chosenFilteredLiftStateSequence A P R F n initial step 0 = initial :=
  rfl
 
theorem chosenFilteredLiftCorrectionSequence_mem
    (A : Type u) [CommGroup A] (P : Nat → A → Prop) (R : A → Prop)
    (F : A →* A) (n : Nat) (initial : FilteredLiftState A P R n 0)
    (step : ∀ i (s : FilteredLiftState A P R n i),
      Nonempty (FilteredLiftStep A P R F n i s)) (i : Nat) :
    P (n + i)
      (chosenFilteredLiftCorrectionSequence A P R F n initial step i) :=
  (Classical.choice
    (step i (chosenFilteredLiftStateSequence A P R F n initial step i))).correction_mem
 
theorem chosenFilteredLiftStateSequence_equation
    (A : Type u) [CommGroup A] (P : Nat → A → Prop) (R : A → Prop)
    (F : A →* A) (n : Nat) (initial : FilteredLiftState A P R n 0)
    (step : ∀ i (s : FilteredLiftState A P R n i),
      Nonempty (FilteredLiftStep A P R F n i s)) (i : Nat) :
    (chosenFilteredLiftStateSequence A P R F n initial step i).value =
      F (chosenFilteredLiftCorrectionSequence A P R F n initial step i) *
        (chosenFilteredLiftStateSequence A P R F n initial step (i + 1)).value := by
  exact (Classical.choice
    (step i (chosenFilteredLiftStateSequence A P R F n initial step i))).equation
 

theorem filteredLift_initial_eq_correctionProduct_mul_state
    (A : Type u) [CommGroup A] (P : Nat → A → Prop) (R : A → Prop)
    (F : A →* A) (n : Nat) (initial : FilteredLiftState A P R n 0)
    (step : ∀ i (s : FilteredLiftState A P R n i),
      Nonempty (FilteredLiftStep A P R F n i s)) (d : Nat) :
    initial.value =
      F (filteredCorrectionProduct
          (chosenFilteredLiftCorrectionSequence A P R F n initial step) d) *
        (chosenFilteredLiftStateSequence A P R F n initial step d).value := by
  induction d with
  | zero =>
      rw [filteredCorrectionProduct_zero, chosenFilteredLiftStateSequence_zero,
        map_one, one_mul]
  | succ d ih =>
      rw [filteredCorrectionProduct_succ, map_mul]
      rw [mul_assoc, ← chosenFilteredLiftStateSequence_equation
        A P R F n initial step d]
      exact ih
end
end LocalClassFieldTheory
end

/- ClassFieldTheory.LocalClassFieldTheory.ClassFormation.NormalBasisGaloisAction -/
section
namespace LocalClassFieldTheory
open LocalFieldTheory
open CyclicCohomology
noncomputable section
universe uG uA u
open scoped ValuativeRel
open IsNonarchimedeanLocalField
open CyclicCohomology.ProfiniteCohomology.Herbrand
 

abbrev subgroupMulDistribMulActionOfStable
    (G : Type uG) (A : Type uA) [Group G] [CommGroup A]
    [MulDistribMulAction G A] (V : Subgroup A)
    (hstable : ∀ (g : G) (a : A), a ∈ V → g • a ∈ V) :
    MulDistribMulAction G V where
  smul g a := ⟨g • (a : A), hstable g a a.2⟩
  one_smul := by
    intro a
    apply Subtype.ext
    exact one_smul G (a : A)
  mul_smul := by
    intro g h a
    apply Subtype.ext
    exact mul_smul g h (a : A)
  smul_mul := by
    intro g a b
    apply Subtype.ext
    exact MulDistribMulAction.smul_mul g (a : A) (b : A)
  smul_one := by
    intro g
    apply Subtype.ext
    exact MulDistribMulAction.smul_one g
 

theorem quotientActionOfSubgroupStable
    (G : Type uG) (A : Type uA) [Group G] [CommGroup A]
    [MulDistribMulAction G A] (V : Subgroup A)
    (hstable : ∀ (g : G) (a : A), a ∈ V → g • a ∈ V) :
    MulAction.QuotientAction G V where
  inv_mul_mem g a b hab := by
    have hsmul : g • (a⁻¹ * b) ∈ V := hstable g (a⁻¹ * b) hab
    simpa [MulDistribMulAction.smul_mul, map_inv] using hsmul
 

abbrev quotientMulDistribMulActionOfSubgroupStable
    (G : Type uG) (A : Type uA) [Group G] [CommGroup A]
    [MulDistribMulAction G A] (V : Subgroup A)
    (hstable : ∀ (g : G) (a : A), a ∈ V → g • a ∈ V) :
    MulDistribMulAction G (A ⧸ V) := by
  letI : MulAction.QuotientAction G V :=
    quotientActionOfSubgroupStable G A V hstable
  exact
    { smul := (· • ·)
      one_smul := one_smul G
      mul_smul := mul_smul
      smul_mul := by
        intro g x y
        refine Quotient.inductionOn₂' x y ?_
        intro a b
        exact congrArg QuotientGroup.mk
          (MulDistribMulAction.smul_mul g a b)
      smul_one := by
        intro g
        exact congrArg QuotientGroup.mk
          (MulDistribMulAction.smul_one g) }
variable (K L : Type u) [Field K] [Field L] [Algebra K L]
  [FiniteDimensional K L] [IsGalois K L]
  [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
 

theorem galoisGroup_apply_mem_chosenBaseUniformizerPow_chosenNormalBasisIntegerLattice
    (n : Nat) (sigma : Gal(L / K)) {x : L}
    (hx : x ∈ chosenBaseUniformizerPowSubmodule K L n
      (chosenNormalBasisIntegerLattice K L)) :
    sigma x ∈ chosenBaseUniformizerPowSubmodule K L n
      (chosenNormalBasisIntegerLattice K L) := by
  rcases (mem_chosenBaseUniformizerPowSubmodule_iff
      (K := K) (L := L) n (chosenNormalBasisIntegerLattice K L) x).1 hx with
    ⟨y, hy, rfl⟩
  refine (mem_chosenBaseUniformizerPowSubmodule_iff
      (K := K) (L := L) n (chosenNormalBasisIntegerLattice K L) _).2
    ⟨sigma y,
      galoisGroup_apply_mem_chosenNormalBasisIntegerLattice
        (K := K) (L := L) sigma hy, ?_⟩
  rw [map_mul]
  change
    algebraMap K L (((chosenIntegerRingUniformizer K ^ n : 𝒪[K]) : K)) *
        sigma y =
      sigma (algebraMap K L
        (((chosenIntegerRingUniformizer K ^ n : 𝒪[K]) : K))) * sigma y
  rw [sigma.commutes]
variable [ValuativeRel L]
  [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
  [IsIntegralClosure 𝒪[L] 𝒪[K] L]
 

theorem galoisGroup_smul_mem_chosenNormalBasisPrincipalUnitSet
    (n : Nat) (sigma : Gal(L / K)) {a : 𝒪[L]ˣ}
    (ha : a ∈ chosenNormalBasisPrincipalUnitSet K L n) :
    letI := galoisGroupIntegerUnitsMulDistribMulActionOfIsIntegralClosure K L
    sigma • a ∈ chosenNormalBasisPrincipalUnitSet K L n := by
  let := galoisGroupIntegerUnitsMulDistribMulActionOfIsIntegralClosure K L
  rw [mem_chosenNormalBasisPrincipalUnitSet_iff] at ha ⊢
  have hstable :=
    galoisGroup_apply_mem_chosenBaseUniformizerPow_chosenNormalBasisIntegerLattice
      (K := K) (L := L) n sigma ha
  simpa [galoisGroupIntegerUnitsMulDistribMulActionOfIsIntegralClosure_smul,
    map_sub, map_one] using hstable
 

abbrev chosenNormalBasisPrincipalUnitSubgroupMulDistribMulAction
    (n : Nat) (V : Subgroup 𝒪[L]ˣ)
    (hV : (V : Set 𝒪[L]ˣ) = chosenNormalBasisPrincipalUnitSet K L n) :
    MulDistribMulAction (Gal(L / K)) V := by
  letI := galoisGroupIntegerUnitsMulDistribMulActionOfIsIntegralClosure K L
  exact subgroupMulDistribMulActionOfStable (Gal(L / K)) 𝒪[L]ˣ V
    (by
      intro sigma a ha
      change sigma • (a : 𝒪[L]ˣ) ∈ (V : Set 𝒪[L]ˣ)
      rw [hV]
      exact galoisGroup_smul_mem_chosenNormalBasisPrincipalUnitSet
        (K := K) (L := L) n sigma (hV ▸ ha))
 
@[simp]
theorem chosenNormalBasisPrincipalUnitSubgroup_tateNorm_coe
    (n : Nat) (V : Subgroup 𝒪[L]ˣ)
    (hV : (V : Set 𝒪[L]ˣ) = chosenNormalBasisPrincipalUnitSet K L n)
    (a : V) :
    letI := chosenNormalBasisPrincipalUnitSubgroupMulDistribMulAction K L n V hV
    letI := galoisGroupIntegerUnitsMulDistribMulActionOfIsIntegralClosure K L
    ((tateNorm (Gal(L / K)) V a : V) : 𝒪[L]ˣ) =
      tateNorm (Gal(L / K)) 𝒪[L]ˣ (a : 𝒪[L]ˣ) := by
  let := chosenNormalBasisPrincipalUnitSubgroupMulDistribMulAction K L n V hV
  let := galoisGroupIntegerUnitsMulDistribMulActionOfIsIntegralClosure K L
  unfold tateNorm
  change V.subtype (∏ g : Gal(L / K), g • a) =
    ∏ g : Gal(L / K), g • (a : 𝒪[L]ˣ)
  rw [map_prod]
  apply Finset.prod_congr rfl
  intro g _hg
  rfl
 
@[simp]
theorem chosenNormalBasisPrincipalUnitSubgroup_sigmaMinusOne_coe
    (n : Nat) (V : Subgroup 𝒪[L]ˣ)
    (hV : (V : Set 𝒪[L]ˣ) = chosenNormalBasisPrincipalUnitSet K L n)
    (sigma : Gal(L / K)) (a : V) :
    letI := chosenNormalBasisPrincipalUnitSubgroupMulDistribMulAction K L n V hV
    letI := galoisGroupIntegerUnitsMulDistribMulActionOfIsIntegralClosure K L
    ((sigmaMinusOne (Gal(L / K)) V sigma a : V) : 𝒪[L]ˣ) =
      sigmaMinusOne (Gal(L / K)) 𝒪[L]ˣ sigma (a : 𝒪[L]ˣ) := by
  let := chosenNormalBasisPrincipalUnitSubgroupMulDistribMulAction K L n V hV
  let := galoisGroupIntegerUnitsMulDistribMulActionOfIsIntegralClosure K L
  rfl
 

abbrev chosenNormalBasisIntegerUnitsQuotMulDistribMulAction
    (n : Nat) (V : Subgroup 𝒪[L]ˣ)
    (hV : (V : Set 𝒪[L]ˣ) = chosenNormalBasisPrincipalUnitSet K L n) :
    MulDistribMulAction (Gal(L / K)) (𝒪[L]ˣ ⧸ V) := by
  letI := galoisGroupIntegerUnitsMulDistribMulActionOfIsIntegralClosure K L
  exact quotientMulDistribMulActionOfSubgroupStable
    (Gal(L / K)) 𝒪[L]ˣ V (by
      intro sigma a ha
      change a ∈ (V : Set 𝒪[L]ˣ) at ha
      change sigma • a ∈ (V : Set 𝒪[L]ˣ)
      rw [hV] at ha ⊢
      exact galoisGroup_smul_mem_chosenNormalBasisPrincipalUnitSet
        (K := K) (L := L) n sigma ha)
 

def chosenNormalBasisPrincipalUnitSubgroupInclusion
    (V : Subgroup 𝒪[L]ˣ) : V →* 𝒪[L]ˣ :=
  V.subtype
 
@[simp]
theorem chosenNormalBasisPrincipalUnitSubgroupInclusion_apply
    (V : Subgroup 𝒪[L]ˣ) (a : V) :
    chosenNormalBasisPrincipalUnitSubgroupInclusion (L := L) V a = a :=
  rfl
 
def chosenNormalBasisIntegerUnitsQuotientMap
    (V : Subgroup 𝒪[L]ˣ) : 𝒪[L]ˣ →* (𝒪[L]ˣ ⧸ V) :=
  QuotientGroup.mk' V
 
theorem chosenNormalBasisPrincipalUnitSubgroupInclusion_equivariant
    (n : Nat) (V : Subgroup 𝒪[L]ˣ)
    (hV : (V : Set 𝒪[L]ˣ) = chosenNormalBasisPrincipalUnitSet K L n)
    (sigma : Gal(L / K)) (a : V) :
    letI := chosenNormalBasisPrincipalUnitSubgroupMulDistribMulAction K L n V hV
    letI := galoisGroupIntegerUnitsMulDistribMulActionOfIsIntegralClosure K L
    chosenNormalBasisPrincipalUnitSubgroupInclusion (L := L) V (sigma • a) =
      sigma • chosenNormalBasisPrincipalUnitSubgroupInclusion (L := L) V a :=
  rfl
 
theorem chosenNormalBasisIntegerUnitsQuotientMap_equivariant
    (n : Nat) (V : Subgroup 𝒪[L]ˣ)
    (hV : (V : Set 𝒪[L]ˣ) = chosenNormalBasisPrincipalUnitSet K L n)
    (sigma : Gal(L / K)) (a : 𝒪[L]ˣ) :
    letI := galoisGroupIntegerUnitsMulDistribMulActionOfIsIntegralClosure K L
    letI := chosenNormalBasisIntegerUnitsQuotMulDistribMulAction K L n V hV
    chosenNormalBasisIntegerUnitsQuotientMap (L := L) V (sigma • a) =
      sigma • chosenNormalBasisIntegerUnitsQuotientMap (L := L) V a := by
  rfl
 
theorem chosenNormalBasisPrincipalUnitSubgroupInclusion_injective
    (V : Subgroup 𝒪[L]ˣ) :
    Function.Injective (chosenNormalBasisPrincipalUnitSubgroupInclusion (L := L) V) :=
  Subtype.val_injective
 
theorem chosenNormalBasisIntegerUnitsQuotientMap_surjective
    (V : Subgroup 𝒪[L]ˣ) :
    Function.Surjective (chosenNormalBasisIntegerUnitsQuotientMap (L := L) V) :=
  QuotientGroup.mk'_surjective V
 

theorem chosenNormalBasisPrincipalUnitSubgroupInclusion_range_eq_ker_quotient
    (V : Subgroup 𝒪[L]ˣ) :
    MonoidHom.range (chosenNormalBasisPrincipalUnitSubgroupInclusion (L := L) V) =
      MonoidHom.ker (chosenNormalBasisIntegerUnitsQuotientMap (L := L) V) := by
  ext a
  change (∃ v : V, (v : 𝒪[L]ˣ) = a) ↔ QuotientGroup.mk' V a = 1
  rw [QuotientGroup.mk'_apply, QuotientGroup.eq_one_iff]
  constructor
  · rintro ⟨v, rfl⟩
    exact v.2
  · intro ha
    exact ⟨⟨a, ha⟩, rfl⟩
end
end LocalClassFieldTheory
end

/- GaloisCohomology.Cyclic.Herbrand.PrincipalUnits.QuotientReps -/
section
namespace CyclicCohomology
open LocalFieldTheory
noncomputable section
universe u
open scoped ValuativeRel
 



def IntegerUnitsModPrincipalUnitsAtLevel
    (K : Type u) [Field K] [ValuativeRel K] (n : Nat) : Type u :=
  𝒪[K]ˣ ⧸ principalUnits K n
 
instance integerUnitsModPrincipalUnitsAtLevelCommGroup
    (K : Type u) [Field K] [ValuativeRel K] (n : Nat) :
    CommGroup (IntegerUnitsModPrincipalUnitsAtLevel K n) := by
  change CommGroup (𝒪[K]ˣ ⧸ principalUnits K n)
  infer_instance
 
def integerUnitsModPrincipalUnitsAtLevelConcreteEquiv
    (K : Type u) [Field K] [ValuativeRel K] (n : Nat) :
    IntegerUnitsModPrincipalUnitsAtLevel K n ≃*
      (𝒪[K]ˣ ⧸ principalUnits K n) := by
  change (𝒪[K]ˣ ⧸ principalUnits K n) ≃*
    (𝒪[K]ˣ ⧸ principalUnits K n)
  exact MulEquiv.refl _
 
def integerUnitsModPrincipalUnitsAtLevelMk
    (K : Type u) [Field K] [ValuativeRel K] (n : Nat) :
    𝒪[K]ˣ →* IntegerUnitsModPrincipalUnitsAtLevel K n := by
  change 𝒪[K]ˣ →* (𝒪[K]ˣ ⧸ principalUnits K n)
  exact QuotientGroup.mk' (principalUnits K n)
 
protected theorem IntegerUnitsModPrincipalUnitsAtLevel.inductionOn
    {K : Type u} [Field K] [ValuativeRel K] (n : Nat)
    {motive : IntegerUnitsModPrincipalUnitsAtLevel K n → Prop}
    (q : IntegerUnitsModPrincipalUnitsAtLevel K n)
    (h : ∀ x : 𝒪[K]ˣ,
      motive (integerUnitsModPrincipalUnitsAtLevelMk K n x)) :
    motive q := by
  change motive (show 𝒪[K]ˣ ⧸ principalUnits K n from q)
  refine QuotientGroup.induction_on q ?_
  intro x
  exact h x
 
def integerUnitsModPrincipalUnitsAtLevelLift
    {K : Type u} {M : Type*} [Field K] [ValuativeRel K] [Group M]
    (n : Nat) (f : 𝒪[K]ˣ →* M) (h : principalUnits K n ≤ f.ker) :
    IntegerUnitsModPrincipalUnitsAtLevel K n →* M := by
  change (𝒪[K]ˣ ⧸ principalUnits K n) →* M
  exact QuotientGroup.lift (principalUnits K n) f h
 
@[simp]
theorem integerUnitsModPrincipalUnitsAtLevelLift_mk
    {K : Type u} {M : Type*} [Field K] [ValuativeRel K] [Group M]
    (n : Nat) (f : 𝒪[K]ˣ →* M) (h : principalUnits K n ≤ f.ker)
    (x : 𝒪[K]ˣ) :
    integerUnitsModPrincipalUnitsAtLevelLift n f h
        (integerUnitsModPrincipalUnitsAtLevelMk K n x) = f x :=
  rfl
 
theorem integerUnitsModPrincipalUnitsAtLevelMk_eq_one_iff
    (K : Type u) [Field K] [ValuativeRel K] (n : Nat) (x : 𝒪[K]ˣ) :
    integerUnitsModPrincipalUnitsAtLevelMk K n x = 1 ↔
      x ∈ principalUnits K n := by
  change (QuotientGroup.mk x : 𝒪[K]ˣ ⧸ principalUnits K n) = 1 ↔ _
  exact QuotientGroup.eq_one_iff x
end
end CyclicCohomology
end

/- GaloisCohomology.Cyclic.Herbrand.PrincipalUnits.QuotientTower -/
section
namespace CyclicCohomology
open LocalFieldTheory
noncomputable section
universe u
open scoped ValuativeRel
 
def integerUnitsModPrincipalUnitsMapOfLe
    (K : Type u) [Field K] [ValuativeRel K] {n m : Nat} (hnm : n ≤ m) :
    IntegerUnitsModPrincipalUnitsAtLevel K m →*
      IntegerUnitsModPrincipalUnitsAtLevel K n :=
  integerUnitsModPrincipalUnitsAtLevelLift m
    (integerUnitsModPrincipalUnitsAtLevelMk K n)
    (by
      intro x hx
      rw [MonoidHom.mem_ker,
        integerUnitsModPrincipalUnitsAtLevelMk_eq_one_iff]
      exact principalUnits_antitone K hnm hx)
 
@[simp]
theorem integerUnitsModPrincipalUnitsMapOfLe_mk
    (K : Type u) [Field K] [ValuativeRel K] {n m : Nat} (hnm : n ≤ m)
    (x : 𝒪[K]ˣ) :
    integerUnitsModPrincipalUnitsMapOfLe K hnm
        (integerUnitsModPrincipalUnitsAtLevelMk K m x) =
      integerUnitsModPrincipalUnitsAtLevelMk K n x :=
  integerUnitsModPrincipalUnitsAtLevelLift_mk m
    (integerUnitsModPrincipalUnitsAtLevelMk K n) _ x
 
def integerUnitsModPrincipalUnitsSuccMap
    (K : Type u) [Field K] [ValuativeRel K] (n : Nat) :
    IntegerUnitsModPrincipalUnitsAtLevel K (n + 1) →*
      IntegerUnitsModPrincipalUnitsAtLevel K n :=
  integerUnitsModPrincipalUnitsMapOfLe K (Nat.le_succ n)
 
@[simp]
theorem integerUnitsModPrincipalUnitsSuccMap_mk
    (K : Type u) [Field K] [ValuativeRel K] (n : Nat)
    (x : 𝒪[K]ˣ) :
    integerUnitsModPrincipalUnitsSuccMap K n
        (integerUnitsModPrincipalUnitsAtLevelMk K (n + 1) x) =
      integerUnitsModPrincipalUnitsAtLevelMk K n x :=
  integerUnitsModPrincipalUnitsMapOfLe_mk K (Nat.le_succ n) x
 

def principalUnitsSuccQuotToIntegerUnitsModPrincipalUnitsSucc
    (K : Type u) [Field K] [ValuativeRel K] (n : Nat) :
    PrincipalUnitsSuccQuot K n →*
      IntegerUnitsModPrincipalUnitsAtLevel K (n + 1) :=
  principalUnitsSuccQuotLift n
    ((integerUnitsModPrincipalUnitsAtLevelMk K (n + 1)).comp
      (principalUnits K n).subtype)
    (by
      intro u hu
      rw [MonoidHom.mem_ker, MonoidHom.comp_apply,
        integerUnitsModPrincipalUnitsAtLevelMk_eq_one_iff]
      exact hu)
 
@[simp]
theorem principalUnitsSuccQuotToIntegerUnitsModPrincipalUnitsSucc_mk
    (K : Type u) [Field K] [ValuativeRel K] (n : Nat)
    (u : principalUnits K n) :
    principalUnitsSuccQuotToIntegerUnitsModPrincipalUnitsSucc K n
        (principalUnitsSuccQuotMk K n u) =
      integerUnitsModPrincipalUnitsAtLevelMk K (n + 1) (u : 𝒪[K]ˣ) :=
  principalUnitsSuccQuotLift_mk n
    ((integerUnitsModPrincipalUnitsAtLevelMk K (n + 1)).comp
      (principalUnits K n).subtype) _ u
 
theorem integerUnitsSuccMap_comp_principalUnitsSuccQuot
    (K : Type u) [Field K] [ValuativeRel K] (n : Nat) :
    (integerUnitsModPrincipalUnitsSuccMap K n).comp
        (principalUnitsSuccQuotToIntegerUnitsModPrincipalUnitsSucc K n) = 1 := by
  ext q
  refine PrincipalUnitsSuccQuot.inductionOn n
    (motive := fun q =>
      ((integerUnitsModPrincipalUnitsSuccMap K n).comp
        (principalUnitsSuccQuotToIntegerUnitsModPrincipalUnitsSucc K n)) q =
          (1 : PrincipalUnitsSuccQuot K n →*
            IntegerUnitsModPrincipalUnitsAtLevel K n) q)
    q ?_
  intro u
  rw [MonoidHom.comp_apply,
    principalUnitsSuccQuotToIntegerUnitsModPrincipalUnitsSucc_mk,
    integerUnitsModPrincipalUnitsSuccMap_mk]
  change integerUnitsModPrincipalUnitsAtLevelMk K n (u : 𝒪[K]ˣ) = 1
  rw [integerUnitsModPrincipalUnitsAtLevelMk_eq_one_iff]
  exact u.2
 

theorem principalUnitsSuccQuotToIntegerUnitsModPrincipalUnitsSucc_range_eq_ker
    (K : Type u) [Field K] [ValuativeRel K] (n : Nat) :
    MonoidHom.range (principalUnitsSuccQuotToIntegerUnitsModPrincipalUnitsSucc K n) =
      MonoidHom.ker (integerUnitsModPrincipalUnitsSuccMap K n) := by
  ext q
  constructor
  · rintro ⟨x, rfl⟩
    change (integerUnitsModPrincipalUnitsSuccMap K n).comp
        (principalUnitsSuccQuotToIntegerUnitsModPrincipalUnitsSucc K n) x = 1
    rw [integerUnitsSuccMap_comp_principalUnitsSuccQuot]
    rfl
  · intro hq
    revert hq
    refine IntegerUnitsModPrincipalUnitsAtLevel.inductionOn (n + 1)
      (motive := fun q =>
        q ∈ MonoidHom.ker (integerUnitsModPrincipalUnitsSuccMap K n) →
          q ∈ MonoidHom.range
            (principalUnitsSuccQuotToIntegerUnitsModPrincipalUnitsSucc K n))
      q ?_
    intro x hq
    have hx : x ∈ principalUnits K n := by
      exact (integerUnitsModPrincipalUnitsAtLevelMk_eq_one_iff K n x).1
        (by simpa using hq)
    let u : principalUnits K n := ⟨x, hx⟩
    exact ⟨principalUnitsSuccQuotMk K n u, by
      rw [principalUnitsSuccQuotToIntegerUnitsModPrincipalUnitsSucc_mk]⟩
 
theorem integerUnitsModPrincipalUnitsAtLevel_finite_zero
    (K : Type u) [Field K] [ValuativeRel K] :
    Finite (IntegerUnitsModPrincipalUnitsAtLevel K 0) := by
  let : Finite (𝒪[K]ˣ ⧸ principalUnits K 0) := by
    rw [principalUnits_zero]
    infer_instance
  exact Finite.of_equiv (𝒪[K]ˣ ⧸ principalUnits K 0)
    (integerUnitsModPrincipalUnitsAtLevelConcreteEquiv K 0).symm.toEquiv
 

theorem integerUnitsModPrincipalUnitsAtLevel_finite_one_of_isNonarchimedeanLocalField
    (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] :
    Finite (IntegerUnitsModPrincipalUnitsAtLevel K 1) := by
  let e : IntegerUnitsModPrincipalUnitsAtLevel K 1 ≃* ResidueUnits K :=
    (integerUnitsModPrincipalUnitsAtLevelConcreteEquiv K 1).trans
      ((integerUnitsModPrincipalUnitsConcreteEquiv K).symm.trans
        (integerUnitsModPrincipalUnitsEquivResidueUnits K))
  exact Finite.of_equiv (ResidueUnits K) e.symm.toEquiv
 

theorem integerUnitsModPrincipalUnitsAtLevel_finite_succ_of_finite
    (K : Type u) [Field K] [ValuativeRel K] (n : Nat)
    [Finite (PrincipalUnitsSuccQuot K n)]
    [Finite (IntegerUnitsModPrincipalUnitsAtLevel K n)] :
    Finite (IntegerUnitsModPrincipalUnitsAtLevel K (n + 1)) := by
  let i := principalUnitsSuccQuotToIntegerUnitsModPrincipalUnitsSucc K n
  have : Finite i.range :=
    Finite.of_surjective
      (fun a : PrincipalUnitsSuccQuot K n => (⟨i a, ⟨a, rfl⟩⟩ : i.range))
      (by
        intro x
        rcases x with ⟨b, ⟨a, ha⟩⟩
        exact ⟨a, Subtype.ext ha⟩)
  let f := integerUnitsModPrincipalUnitsSuccMap K n
  exact (f.finite_iff_finite_ker_range).2 (by
    constructor
    · rw [← principalUnitsSuccQuotToIntegerUnitsModPrincipalUnitsSucc_range_eq_ker K n]
      infer_instance
    · infer_instance)
 

theorem integerUnitsModPrincipalUnitsAtLevel_finite_of_isNonarchimedeanLocalField
    (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (n : Nat) :
    Finite (IntegerUnitsModPrincipalUnitsAtLevel K n) := by
  induction n with
  | zero =>
      exact integerUnitsModPrincipalUnitsAtLevel_finite_zero K
  | succ n ih =>
      cases n with
      | zero =>
          exact integerUnitsModPrincipalUnitsAtLevel_finite_one_of_isNonarchimedeanLocalField K
      | succ k =>
          have : Finite (PrincipalUnitsSuccQuot K (k + 1)) :=
            finite_principalUnitsSuccQuot K (k + 1) (Nat.succ_le_succ (Nat.zero_le k))
          exact integerUnitsModPrincipalUnitsAtLevel_finite_succ_of_finite K (k + 1)
end
end CyclicCohomology
end

/- ClassFieldTheory.LocalClassFieldTheory.ClassFormation.NormalBasisFiniteQuotient -/
section
namespace LocalClassFieldTheory
open LocalFieldTheory
open CyclicCohomology
noncomputable section
universe u
open scoped ValuativeRel
open Filter IsNonarchimedeanLocalField
variable (K L : Type u) [Field K] [Field L] [Algebra K L]
  [FiniteDimensional K L] [IsGalois K L]
  [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
  [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
  [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
  [Module.Finite 𝒪[K] 𝒪[L]]
 

theorem exists_principalUnits_le_chosenNormalBasisPrincipalUnitSet :
    ∃ c : Nat, ∀ n : Nat, c ≤ n →
      ∃ m : Nat, (principalUnits L m : Set 𝒪[L]ˣ) ⊆
        chosenNormalBasisPrincipalUnitSet K L n := by
  rcases exists_chosenBaseUniformizerPow_chosenNormalBasisIntegerLattice_mem_nhds_zero
      (K := K) (L := L) with ⟨c, hc⟩
  refine ⟨c, ?_⟩
  intro n hcn
  let S : Set L :=
    (chosenBaseUniformizerPowSubmodule K L n
      (chosenNormalBasisIntegerLattice K L) : Set L)
  have hS : S ∈ nhds (0 : L) := hc n hcn
  have hSO : {x : 𝒪[L] | (x : L) ∈ S} ∈ nhds (0 : 𝒪[L]) := by
    exact continuous_subtype_val.continuousAt hS
  rcases exists_maximalIdeal_pow_subset_nhds_zero L
      {x : 𝒪[L] | (x : L) ∈ S} hSO with ⟨m, hm⟩
  refine ⟨m, ?_⟩
  intro a ha
  rw [mem_chosenNormalBasisPrincipalUnitSet_iff]
  change
    (((((a : 𝒪[L]ˣ) : 𝒪[L]) - 1 : 𝒪[L]) : L)) ∈ S
  exact hm ((mem_principalUnits_iff L a m).1 ha)
 

def integerUnitsModPrincipalUnitsToSubgroupQuotient
    (m : Nat) (V : Subgroup 𝒪[L]ˣ) (h : principalUnits L m ≤ V) :
    IntegerUnitsModPrincipalUnitsAtLevel L m →* (𝒪[L]ˣ ⧸ V) :=
  integerUnitsModPrincipalUnitsAtLevelLift m (QuotientGroup.mk' V)
    (by
      intro a ha
      rw [MonoidHom.mem_ker]
      change (QuotientGroup.mk a : 𝒪[L]ˣ ⧸ V) = 1
      exact (QuotientGroup.eq_one_iff a).2 (h ha))
omit [TopologicalSpace L] [IsNonarchimedeanLocalField L] in
 
theorem integerUnitsModPrincipalUnitsToSubgroupQuotient_surjective
    (m : Nat) (V : Subgroup 𝒪[L]ˣ) (h : principalUnits L m ≤ V) :
    Function.Surjective
      (integerUnitsModPrincipalUnitsToSubgroupQuotient L m V h) := by
  intro q
  refine Quotient.inductionOn' q ?_
  intro a
  refine ⟨integerUnitsModPrincipalUnitsAtLevelMk L m a, ?_⟩
  rfl
 

theorem finite_chosenNormalBasisIntegerUnitsQuotient_of_principalUnits_le
    (m : Nat) (V : Subgroup 𝒪[L]ˣ) (h : principalUnits L m ≤ V) :
    Finite (𝒪[L]ˣ ⧸ V) := by
  let : Finite (IntegerUnitsModPrincipalUnitsAtLevel L m) :=
    integerUnitsModPrincipalUnitsAtLevel_finite_of_isNonarchimedeanLocalField L m
  exact Finite.of_surjective
    (integerUnitsModPrincipalUnitsToSubgroupQuotient L m V h)
    (integerUnitsModPrincipalUnitsToSubgroupQuotient_surjective L m V h)
 

theorem exists_finite_chosenNormalBasisIntegerUnitsQuotient :
    ∃ c : Nat, ∀ n : Nat, c ≤ n →
      ∀ (V : Subgroup 𝒪[L]ˣ),
        (V : Set 𝒪[L]ˣ) = chosenNormalBasisPrincipalUnitSet K L n →
          Finite (𝒪[L]ˣ ⧸ V) := by
  rcases exists_principalUnits_le_chosenNormalBasisPrincipalUnitSet
      (K := K) (L := L) with ⟨c, hc⟩
  refine ⟨c, ?_⟩
  intro n hcn V hV
  rcases hc n hcn with ⟨m, hm⟩
  have hle : principalUnits L m ≤ V := by
    intro a ha
    change (a : 𝒪[L]ˣ) ∈ (V : Set 𝒪[L]ˣ)
    rw [hV]
    exact hm ha
  exact finite_chosenNormalBasisIntegerUnitsQuotient_of_principalUnits_le
    (L := L) m V hle
end
end LocalClassFieldTheory
end

/- ClassFieldTheory.LocalClassFieldTheory.ClassFormation.IntegerUnitsHerbrand -/
section
namespace LocalClassFieldTheory
open LocalFieldTheory
open CyclicCohomology
noncomputable section
open scoped ValuativeRel
open CyclicCohomology.ProfiniteCohomology.Herbrand
open IsNonarchimedeanLocalField
variable (K L : Type) [Field K] [Field L] [Algebra K L]
  [FiniteDimensional K L] [IsGalois K L]
  [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
  [ValuativeRel L]
  [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
  [IsIntegralClosure 𝒪[L] 𝒪[K] L]
 

theorem chosenNormalBasisIntegerUnitsHerbrand_shortExact
    (n : Nat) (V : Subgroup 𝒪[L]ˣ)
    (hV : (V : Set 𝒪[L]ˣ) = chosenNormalBasisPrincipalUnitSet K L n) :
    letI := chosenNormalBasisPrincipalUnitSubgroupMulDistribMulAction K L n V hV
    letI := galoisGroupIntegerUnitsMulDistribMulActionOfIsIntegralClosure K L
    letI := chosenNormalBasisIntegerUnitsQuotMulDistribMulAction K L n V hV
    (∀ (sigma : Gal(L / K)) (a : V),
        chosenNormalBasisPrincipalUnitSubgroupInclusion (L := L) V (sigma • a) =
          sigma • chosenNormalBasisPrincipalUnitSubgroupInclusion (L := L) V a) ∧
      (∀ (sigma : Gal(L / K)) (a : 𝒪[L]ˣ),
        chosenNormalBasisIntegerUnitsQuotientMap (L := L) V (sigma • a) =
          sigma • chosenNormalBasisIntegerUnitsQuotientMap (L := L) V a) ∧
      (∀ a : 𝒪[L]ˣ,
        chosenNormalBasisIntegerUnitsQuotientMap (L := L) V a = 1 ↔
          ∃ v : V,
            chosenNormalBasisPrincipalUnitSubgroupInclusion (L := L) V v = a) ∧
      Function.Injective
        (chosenNormalBasisPrincipalUnitSubgroupInclusion (L := L) V) ∧
      Function.Surjective
        (chosenNormalBasisIntegerUnitsQuotientMap (L := L) V) := by
  let := chosenNormalBasisPrincipalUnitSubgroupMulDistribMulAction K L n V hV
  let := galoisGroupIntegerUnitsMulDistribMulActionOfIsIntegralClosure K L
  let := chosenNormalBasisIntegerUnitsQuotMulDistribMulAction K L n V hV
  refine ⟨chosenNormalBasisPrincipalUnitSubgroupInclusion_equivariant K L n V hV,
    chosenNormalBasisIntegerUnitsQuotientMap_equivariant K L n V hV, ?_,
    chosenNormalBasisPrincipalUnitSubgroupInclusion_injective (L := L) V,
    chosenNormalBasisIntegerUnitsQuotientMap_surjective (L := L) V⟩
  intro a
  have hrange :=
    chosenNormalBasisPrincipalUnitSubgroupInclusion_range_eq_ker_quotient
      (L := L) V
  constructor
  · intro ha
    have ha' : a ∈ MonoidHom.ker
        (chosenNormalBasisIntegerUnitsQuotientMap (L := L) V) := ha
    rw [← hrange] at ha'
    exact ha'
  · rintro ⟨v, rfl⟩
    have hv :
        chosenNormalBasisPrincipalUnitSubgroupInclusion (L := L) V v ∈
          MonoidHom.range
            (chosenNormalBasisPrincipalUnitSubgroupInclusion (L := L) V) :=
      ⟨v, rfl⟩
    rw [hrange] at hv
    exact hv
 



theorem integerUnits_herbrandQuotient_eq_one_of_chosenNormalBasis
    (n : Nat) (V : Subgroup 𝒪[L]ˣ)
    (hV : (V : Set 𝒪[L]ˣ) = chosenNormalBasisPrincipalUnitSet K L n)
    (hfinite : Finite (𝒪[L]ˣ ⧸ V))
    (g : Gal(L / K))
    (hg : ∀ sigma : Gal(L / K), sigma ∈ Subgroup.zpowers g)
    (hH0 :
      letI := chosenNormalBasisPrincipalUnitSubgroupMulDistribMulAction K L n V hV
      Subsingleton (HerbrandH0 (Gal(L / K)) V))
    (hHminusOne :
      letI := chosenNormalBasisPrincipalUnitSubgroupMulDistribMulAction K L n V hV
      Subsingleton (HerbrandHMinusOne (Gal(L / K)) V g)) :
    letI := chosenNormalBasisPrincipalUnitSubgroupMulDistribMulAction K L n V hV
    letI := galoisGroupIntegerUnitsMulDistribMulActionOfIsIntegralClosure K L
    letI := chosenNormalBasisIntegerUnitsQuotMulDistribMulAction K L n V hV
    ∃ hU : HerbrandQuotientDefined (Gal(L / K)) 𝒪[L]ˣ g,
      @herbrandQuotient (Gal(L / K)) 𝒪[L]ˣ _ _ _
        (galoisGroupIntegerUnitsMulDistribMulActionOfIsIntegralClosure K L)
        g hU.1 hU.2 = 1 := by
  let := chosenNormalBasisPrincipalUnitSubgroupMulDistribMulAction K L n V hV
  let := galoisGroupIntegerUnitsMulDistribMulActionOfIsIntegralClosure K L
  let := chosenNormalBasisIntegerUnitsQuotMulDistribMulAction K L n V hV
  let : Finite (𝒪[L]ˣ ⧸ V) := hfinite
  let : Subsingleton (HerbrandH0 (Gal(L / K)) V) := hH0
  let : Subsingleton (HerbrandHMinusOne (Gal(L / K)) V g) := hHminusOne
  let hVdefined : HerbrandQuotientDefined (Gal(L / K)) V g :=
    ⟨inferInstance, inferInstance⟩
  let hQdefined : HerbrandQuotientDefined (Gal(L / K)) (𝒪[L]ˣ ⧸ V) g :=
    ⟨inferInstance, inferInstance⟩
  let hseq := chosenNormalBasisIntegerUnitsHerbrand_shortExact K L n V hV
  have hsurj : ∀ c : 𝒪[L]ˣ ⧸ V, ∃ b : 𝒪[L]ˣ,
      chosenNormalBasisIntegerUnitsQuotientMap (L := L) V b = c := by
    intro c
    exact hseq.2.2.2.2 c
  let hU := herbrandQuotientDefined_middle_of_left_right
    (G := Gal(L / K)) (A := V) (B := 𝒪[L]ˣ) (C := 𝒪[L]ˣ ⧸ V)
    (chosenNormalBasisPrincipalUnitSubgroupInclusion (L := L) V)
    (chosenNormalBasisIntegerUnitsQuotientMap (L := L) V)
    hseq.1 hseq.2.1 hseq.2.2.1 hseq.2.2.2.1 hsurj
    g hg hVdefined hQdefined
  refine ⟨hU, ?_⟩
  let : Finite (HerbrandH0 (Gal(L / K)) 𝒪[L]ˣ) := hU.1
  let : Finite (HerbrandHMinusOne (Gal(L / K)) 𝒪[L]ˣ g) := hU.2
  have hVone : herbrandQuotient (G := Gal(L / K)) (A := V) g = 1 := by
    exact herbrandQuotient_eq_one_of_card_eq
      (G := Gal(L / K)) (A := V) g
      (by simp only [Nat.card_unique])
  have hQone :
      herbrandQuotient (G := Gal(L / K)) (A := 𝒪[L]ˣ ⧸ V) g = 1 := by
    exact herbrandQuotient_eq_one_of_finite_module
      (G := Gal(L / K)) (A := 𝒪[L]ˣ ⧸ V) g hg
  have hmul : herbrandQuotient (G := Gal(L / K)) (A := 𝒪[L]ˣ) g =
      herbrandQuotient (G := Gal(L / K)) (A := V) g *
        herbrandQuotient (G := Gal(L / K)) (A := 𝒪[L]ˣ ⧸ V) g :=
    herbrandQuotient_multiplicative_of_shortExact
      (G := Gal(L / K)) (A := V) (B := 𝒪[L]ˣ) (C := 𝒪[L]ˣ ⧸ V)
      (chosenNormalBasisPrincipalUnitSubgroupInclusion (L := L) V)
      (chosenNormalBasisIntegerUnitsQuotientMap (L := L) V)
      hseq.1 hseq.2.1 hseq.2.2.1 hseq.2.2.2.1 hsurj g hg
  exact hmul.trans (by rw [hVone, hQone, one_mul])
variable [TopologicalSpace L] [IsNonarchimedeanLocalField L]
  [Module.Finite 𝒪[K] 𝒪[L]]
 


theorem exists_integerUnits_herbrandQuotient_eq_one_of_large_chosenNormalBasisLevel :
    ∃ c : Nat, ∀ n : Nat, c ≤ n →
      ∀ (V : Subgroup 𝒪[L]ˣ)
        (hV : (V : Set 𝒪[L]ˣ) = chosenNormalBasisPrincipalUnitSet K L n)
        (g : Gal(L / K)),
        (∀ sigma : Gal(L / K), sigma ∈ Subgroup.zpowers g) →
        (letI := chosenNormalBasisPrincipalUnitSubgroupMulDistribMulAction K L n V hV;
          Subsingleton (HerbrandH0 (Gal(L / K)) V)) →
        (letI := chosenNormalBasisPrincipalUnitSubgroupMulDistribMulAction K L n V hV;
          Subsingleton (HerbrandHMinusOne (Gal(L / K)) V g)) →
        letI := chosenNormalBasisPrincipalUnitSubgroupMulDistribMulAction K L n V hV
        letI := galoisGroupIntegerUnitsMulDistribMulActionOfIsIntegralClosure K L
        letI := chosenNormalBasisIntegerUnitsQuotMulDistribMulAction K L n V hV
        ∃ hU : HerbrandQuotientDefined (Gal(L / K)) 𝒪[L]ˣ g,
          @herbrandQuotient (Gal(L / K)) 𝒪[L]ˣ _ _ _
            (galoisGroupIntegerUnitsMulDistribMulActionOfIsIntegralClosure K L)
            g hU.1 hU.2 = 1 := by
  rcases exists_finite_chosenNormalBasisIntegerUnitsQuotient
      (K := K) (L := L) with ⟨c, hc⟩
  refine ⟨c, ?_⟩
  intro n hcn V hV g hg hH0 hHminusOne
  exact integerUnits_herbrandQuotient_eq_one_of_chosenNormalBasis
    K L n V hV (hc n hcn V hV) g hg hH0 hHminusOne
end
end LocalClassFieldTheory
end

/- ClassFieldTheory.LocalClassFieldTheory.ClassFormation.NormalBasis -/
section
namespace LocalClassFieldTheory
open LocalFieldTheory
open CyclicCohomology
noncomputable section
universe u
open scoped ValuativeRel
variable (K L : Type u) [Field K] [ValuativeRel K] [Field L]
  [Algebra K L] [FiniteDimensional K L] [IsGalois K L]
 
theorem span_normalBasis_eq_chosenNormalBasisIntegerLattice :
    Submodule.span 𝒪[K] (Set.range (IsGalois.normalBasis K L)) =
      chosenNormalBasisIntegerLattice K L := by
  rw [chosenNormalBasisIntegerLattice_eq_span]
  congr 1
  ext y
  constructor
  · rintro ⟨σ, rfl⟩
    exact ⟨σ, (IsGalois.normalBasis_apply (K := K) (L := L) σ).symm⟩
  · rintro ⟨σ, rfl⟩
    exact ⟨σ, IsGalois.normalBasis_apply (K := K) (L := L) σ⟩
 


noncomputable def chosenNormalBasisIntegerLatticeBasis :
    Module.Basis Gal(L / K) 𝒪[K] (chosenNormalBasisIntegerLattice K L) :=
  ((IsGalois.normalBasis K L).restrictScalars 𝒪[K]).map
    (LinearEquiv.ofEq _ _
      (span_normalBasis_eq_chosenNormalBasisIntegerLattice K L))
 
@[simp]
theorem chosenNormalBasisIntegerLatticeBasis_apply (σ : Gal(L / K)) :
    ((chosenNormalBasisIntegerLatticeBasis K L σ :
      chosenNormalBasisIntegerLattice K L) : L) = IsGalois.normalBasis K L σ := by
  simp [chosenNormalBasisIntegerLatticeBasis, LinearEquiv.coe_ofEq_apply]
section GradedCoordinates
variable [TopologicalSpace K] [IsNonarchimedeanLocalField K]
 

def chosenNormalBasisIntegerLatticeMulPowLinearMap (n : Nat) :
    chosenNormalBasisIntegerLattice K L →ₗ[𝒪[K]]
      chosenBaseUniformizerPowSubmodule K L n (chosenNormalBasisIntegerLattice K L) where
  toFun x :=
    ⟨algebraMap 𝒪[K] L (chosenIntegerRingUniformizer K ^ n) * (x : L),
      (mem_chosenBaseUniformizerPowSubmodule_iff
        (K := K) (L := L) n (chosenNormalBasisIntegerLattice K L) _).2
        ⟨x, x.2, rfl⟩⟩
  map_add' := by
    intro x y
    ext
    exact mul_add _ _ _
  map_smul' := by
    intro a x
    ext
    simp [Algebra.smul_def, mul_assoc, mul_comm, mul_left_comm]
 
theorem chosenNormalBasisIntegerLatticeMulPowLinearMap_bijective (n : Nat) :
    Function.Bijective (chosenNormalBasisIntegerLatticeMulPowLinearMap K L n) := by
  constructor
  · intro x y hxy
    apply Subtype.ext
    have hxy' := congrArg Subtype.val hxy
    change algebraMap 𝒪[K] L (chosenIntegerRingUniformizer K ^ n) * (x : L) =
      algebraMap 𝒪[K] L (chosenIntegerRingUniformizer K ^ n) * (y : L) at hxy'
    have hπ : chosenIntegerRingUniformizer K ^ n ≠ 0 :=
      pow_ne_zero n (chosenIntegerRingUniformizer_irreducible K).ne_zero
    have hπL : algebraMap 𝒪[K] L (chosenIntegerRingUniformizer K ^ n) ≠ 0 := by
      change algebraMap K L
          ((chosenIntegerRingUniformizer K ^ n : 𝒪[K]) : K) ≠ 0
      apply (map_ne_zero (algebraMap K L)).2
      intro h
      exact hπ ((IsFractionRing.injective 𝒪[K] K) h)
    exact mul_left_cancel₀ hπL hxy'
  · intro x
    rcases (mem_chosenBaseUniformizerPowSubmodule_iff
      (K := K) (L := L) n (chosenNormalBasisIntegerLattice K L) (x : L)).1 x.2 with
      ⟨y, hy, hxy⟩
    refine ⟨⟨y, hy⟩, ?_⟩
    apply Subtype.ext
    exact hxy
 

noncomputable def chosenNormalBasisIntegerLatticeMulPowLinearEquiv (n : Nat) :
    chosenNormalBasisIntegerLattice K L ≃ₗ[𝒪[K]]
      chosenBaseUniformizerPowSubmodule K L n (chosenNormalBasisIntegerLattice K L) :=
  LinearEquiv.ofBijective (chosenNormalBasisIntegerLatticeMulPowLinearMap K L n)
    (chosenNormalBasisIntegerLatticeMulPowLinearMap_bijective K L n)
 

def chosenNormalBasisIntegerLatticeUniformizerSubmodule :
    Submodule 𝒪[K] (chosenNormalBasisIntegerLattice K L) :=
  (chosenBaseUniformizerPowSubmodule K L 1
      (chosenNormalBasisIntegerLattice K L)).comap
    (chosenNormalBasisIntegerLattice K L).subtype
 
theorem chosenNormalBasisIntegerLatticeUniformizerSubmodule_map_mulPow
    (n : Nat) :
    (chosenNormalBasisIntegerLatticeUniformizerSubmodule K L).map
        (chosenNormalBasisIntegerLatticeMulPowLinearEquiv K L n :
          chosenNormalBasisIntegerLattice K L →ₗ[𝒪[K]]
            chosenBaseUniformizerPowSubmodule K L n
              (chosenNormalBasisIntegerLattice K L)) =
      chosenNormalBasisLatticeSuccSubmodule K L n := by
  ext x
  constructor
  · rintro ⟨y, hy, rfl⟩
    change algebraMap 𝒪[K] L (chosenIntegerRingUniformizer K ^ n) * (y : L) ∈
      chosenBaseUniformizerPowSubmodule K L (n + 1)
        (chosenNormalBasisIntegerLattice K L)
    rcases (mem_chosenBaseUniformizerPowSubmodule_iff
      (K := K) (L := L) 1 (chosenNormalBasisIntegerLattice K L) (y : L)).1 hy with
      ⟨z, hz, hzy⟩
    refine (mem_chosenBaseUniformizerPowSubmodule_iff
      (K := K) (L := L) (n + 1) (chosenNormalBasisIntegerLattice K L) _).2
      ⟨z, hz, ?_⟩
    rw [← hzy]
    simp only [pow_succ, pow_zero, map_mul, one_mul]
    ring
  · intro hx
    change (x : L) ∈ chosenBaseUniformizerPowSubmodule K L (n + 1)
      (chosenNormalBasisIntegerLattice K L) at hx
    rcases (mem_chosenBaseUniformizerPowSubmodule_iff
      (K := K) (L := L) (n + 1) (chosenNormalBasisIntegerLattice K L) (x : L)).1 hx with
      ⟨z, hz, hzx⟩
    let y : chosenNormalBasisIntegerLattice K L :=
      ⟨algebraMap 𝒪[K] L (chosenIntegerRingUniformizer K) * z, by
        simpa [Algebra.smul_def] using
          (chosenNormalBasisIntegerLattice K L).smul_mem
            (chosenIntegerRingUniformizer K) hz⟩
    have hy : y ∈ chosenNormalBasisIntegerLatticeUniformizerSubmodule K L := by
      refine (mem_chosenBaseUniformizerPowSubmodule_iff
        (K := K) (L := L) 1 (chosenNormalBasisIntegerLattice K L) (y : L)).2
        ⟨z, hz, ?_⟩
      simp [y]
    refine ⟨y, hy, ?_⟩
    apply Subtype.ext
    change algebraMap 𝒪[K] L (chosenIntegerRingUniformizer K ^ n) * (y : L) =
      (x : L)
    rw [← hzx]
    simp only [y, pow_succ, map_mul]
    ring
 

noncomputable def chosenNormalBasisLatticeSuccQuotToIntegerLatticeQuotLinearEquiv
    (n : Nat) :
    chosenNormalBasisLatticeSuccQuot K L n ≃ₗ[𝒪[K]]
      (chosenNormalBasisIntegerLattice K L ⧸
        chosenNormalBasisIntegerLatticeUniformizerSubmodule K L) :=
  (chosenNormalBasisLatticeSuccQuotConcreteLinearEquiv K L n).trans
    (Submodule.Quotient.equiv
      (chosenNormalBasisIntegerLatticeUniformizerSubmodule K L)
      (chosenNormalBasisLatticeSuccSubmodule K L n)
      (chosenNormalBasisIntegerLatticeMulPowLinearEquiv K L n)
      (chosenNormalBasisIntegerLatticeUniformizerSubmodule_map_mulPow K L n)).symm
 
@[simp]
theorem chosenNormalBasisLatticeSuccQuotToIntegerLatticeQuotLinearEquiv_mk_mulPow
    (n : Nat) (x : chosenNormalBasisIntegerLattice K L) :
    chosenNormalBasisLatticeSuccQuotToIntegerLatticeQuotLinearEquiv K L n
        (chosenNormalBasisLatticeSuccQuotMk K L n
          (chosenNormalBasisIntegerLatticeMulPowLinearEquiv K L n x)) =
      Submodule.Quotient.mk x := by
  let e := Submodule.Quotient.equiv
    (chosenNormalBasisIntegerLatticeUniformizerSubmodule K L)
    (chosenNormalBasisLatticeSuccSubmodule K L n)
    (chosenNormalBasisIntegerLatticeMulPowLinearEquiv K L n)
    (chosenNormalBasisIntegerLatticeUniformizerSubmodule_map_mulPow K L n)
  change
    e.symm
        (chosenNormalBasisLatticeSuccQuotConcreteLinearEquiv K L n
          (chosenNormalBasisLatticeSuccQuotMk K L n
            (chosenNormalBasisIntegerLatticeMulPowLinearEquiv K L n x))) =
      Submodule.Quotient.mk x
  rw [chosenNormalBasisLatticeSuccQuotConcreteLinearEquiv_mk]
  apply e.injective
  rw [LinearEquiv.apply_symm_apply]
  rfl
 

def chosenNormalBasisCoordinateMaximalSubmodule :
    Submodule 𝒪[K] (Gal(L / K) → 𝒪[K]) :=
  Submodule.pi Set.univ (fun _ => (𝓂[K] : Ideal 𝒪[K]))
 
theorem chosenNormalBasisIntegerLatticeUniformizerSubmodule_map_equivFun :
    (chosenNormalBasisIntegerLatticeUniformizerSubmodule K L).map
        ((chosenNormalBasisIntegerLatticeBasis K L).equivFun :
          chosenNormalBasisIntegerLattice K L →ₗ[𝒪[K]] (Gal(L / K) → 𝒪[K])) =
      chosenNormalBasisCoordinateMaximalSubmodule K L := by
  ext f
  constructor
  · rintro ⟨x, hx, rfl⟩
    rw [chosenNormalBasisCoordinateMaximalSubmodule, Submodule.mem_pi]
    intro σ _
    rcases (mem_chosenBaseUniformizerPowSubmodule_iff
      (K := K) (L := L) 1 (chosenNormalBasisIntegerLattice K L) (x : L)).1 hx with
      ⟨z, hz, hzx⟩
    let zM : chosenNormalBasisIntegerLattice K L := ⟨z, hz⟩
    have hx_eq : x = chosenIntegerRingUniformizer K • zM := by
      apply Subtype.ext
      simpa [Algebra.smul_def, zM] using hzx.symm
    rw [chosenIntegerRingUniformizer_maximalIdeal_eq,
      Ideal.mem_span_singleton']
    refine ⟨(chosenNormalBasisIntegerLatticeBasis K L).equivFun zM σ, ?_⟩
    rw [hx_eq]
    simp [mul_comm]
  · intro hf
    have hf' : ∀ σ : Gal(L / K),
        ∃ c : 𝒪[K], c * chosenIntegerRingUniformizer K = f σ := by
      intro σ
      have hσ := (Submodule.mem_pi.mp hf) σ (Set.mem_univ σ)
      rw [chosenIntegerRingUniformizer_maximalIdeal_eq,
        Ideal.mem_span_singleton'] at hσ
      exact hσ
    let c : Gal(L / K) → 𝒪[K] := fun σ => Classical.choose (hf' σ)
    have hc (σ : Gal(L / K)) :
        c σ * chosenIntegerRingUniformizer K = f σ :=
      Classical.choose_spec (hf' σ)
    let z : chosenNormalBasisIntegerLattice K L :=
      (chosenNormalBasisIntegerLatticeBasis K L).equivFun.symm c
    let x : chosenNormalBasisIntegerLattice K L :=
      chosenIntegerRingUniformizer K • z
    have hx : x ∈ chosenNormalBasisIntegerLatticeUniformizerSubmodule K L := by
      refine (mem_chosenBaseUniformizerPowSubmodule_iff
        (K := K) (L := L) 1 (chosenNormalBasisIntegerLattice K L) (x : L)).2
        ⟨z, z.2, ?_⟩
      simp [x, Algebra.smul_def]
    refine ⟨x, hx, ?_⟩
    funext σ
    have hzcoord :
        (chosenNormalBasisIntegerLatticeBasis K L).equivFun z = c :=
      (chosenNormalBasisIntegerLatticeBasis K L).equivFun.apply_symm_apply c
    calc
      (chosenNormalBasisIntegerLatticeBasis K L).equivFun x σ =
          chosenIntegerRingUniformizer K *
            (chosenNormalBasisIntegerLatticeBasis K L).equivFun z σ := by
        simp [x]
      _ = chosenIntegerRingUniformizer K * c σ := by rw [hzcoord]
      _ = f σ := by rw [mul_comm, hc]
 

noncomputable def chosenNormalBasisIntegerLatticeQuotCoordinateQuotLinearEquiv :
    (chosenNormalBasisIntegerLattice K L ⧸
        chosenNormalBasisIntegerLatticeUniformizerSubmodule K L) ≃ₗ[𝒪[K]]
      ((Gal(L / K) → 𝒪[K]) ⧸ chosenNormalBasisCoordinateMaximalSubmodule K L) :=
  Submodule.Quotient.equiv
    (chosenNormalBasisIntegerLatticeUniformizerSubmodule K L)
    (chosenNormalBasisCoordinateMaximalSubmodule K L)
    (chosenNormalBasisIntegerLatticeBasis K L).equivFun
    (chosenNormalBasisIntegerLatticeUniformizerSubmodule_map_equivFun K L)
 

noncomputable def chosenNormalBasisCoordinateQuotPiLinearEquiv :
    ((Gal(L / K) → 𝒪[K]) ⧸ chosenNormalBasisCoordinateMaximalSubmodule K L) ≃ₗ[𝒪[K]]
      (Gal(L / K) → (𝒪[K] ⧸ (𝓂[K] : Ideal 𝒪[K]))) := by
  classical
  exact Submodule.quotientPi (fun _ : Gal(L / K) => (𝓂[K] : Ideal 𝒪[K]))
 


def chosenNormalBasisPiResidueInverseIndexAddEquiv :
    (Gal(L / K) → (𝒪[K] ⧸ (𝓂[K] : Ideal 𝒪[K]))) ≃+
      (Gal(L / K) → 𝓀[K]) where
  toFun f σ := integerRingModMaximalIdealAddEquivResidue K (f σ⁻¹)
  invFun f σ := (integerRingModMaximalIdealAddEquivResidue K).symm (f σ⁻¹)
  left_inv := by
    intro f
    funext σ
    simp
  right_inv := by
    intro f
    funext σ
    simp
  map_add' := by
    intro f g
    funext σ
    simp
 


noncomputable def chosenNormalBasisLatticeSuccQuotRightRegularAddEquiv (n : Nat) :
    chosenNormalBasisLatticeSuccQuot K L n ≃+ (Gal(L / K) → 𝓀[K]) :=
  (chosenNormalBasisLatticeSuccQuotToIntegerLatticeQuotLinearEquiv K L n).toAddEquiv.trans
    ((chosenNormalBasisIntegerLatticeQuotCoordinateQuotLinearEquiv K L).toAddEquiv.trans
      ((chosenNormalBasisCoordinateQuotPiLinearEquiv K L).toAddEquiv.trans
        (chosenNormalBasisPiResidueInverseIndexAddEquiv K L)))
 
@[simp]
theorem chosenNormalBasisLatticeSuccQuotRightRegularAddEquiv_mk_mulPow
    (n : Nat) (x : chosenNormalBasisIntegerLattice K L) (σ : Gal(L / K)) :
    chosenNormalBasisLatticeSuccQuotRightRegularAddEquiv K L n
        (chosenNormalBasisLatticeSuccQuotMk K L n
          (chosenNormalBasisIntegerLatticeMulPowLinearEquiv K L n x)) σ =
      IsLocalRing.residue 𝒪[K]
        ((chosenNormalBasisIntegerLatticeBasis K L).equivFun x σ⁻¹) := by
  rw [chosenNormalBasisLatticeSuccQuotRightRegularAddEquiv]
  simp [chosenNormalBasisIntegerLatticeQuotCoordinateQuotLinearEquiv,
    chosenNormalBasisCoordinateQuotPiLinearEquiv,
    chosenNormalBasisPiResidueInverseIndexAddEquiv]
  change integerRingModMaximalIdealAddEquivResidue K
      (Ideal.Quotient.mk (𝓂[K] : Ideal 𝒪[K])
        ((chosenNormalBasisIntegerLatticeBasis K L).equivFun x σ⁻¹)) = _
  rfl
 
def galoisGroupChosenNormalBasisIntegerLatticeLinearEquiv (τ : Gal(L / K)) :
    chosenNormalBasisIntegerLattice K L ≃ₗ[𝒪[K]]
      chosenNormalBasisIntegerLattice K L where
  toFun x := ⟨τ (x : L),
    galoisGroup_apply_mem_chosenNormalBasisIntegerLattice (K := K) (L := L) τ x.2⟩
  invFun x := ⟨τ⁻¹ (x : L),
    galoisGroup_apply_mem_chosenNormalBasisIntegerLattice (K := K) (L := L) τ⁻¹ x.2⟩
  left_inv x := by
    apply Subtype.ext
    exact τ.symm_apply_apply (x : L)
  right_inv x := by
    apply Subtype.ext
    exact τ.apply_symm_apply (x : L)
  map_add' x y := by
    apply Subtype.ext
    exact map_add τ (x : L) (y : L)
  map_smul' a x := by
    apply Subtype.ext
    have ha : τ (algebraMap 𝒪[K] L a) = algebraMap 𝒪[K] L a := by
      change τ (algebraMap K L (a : K)) = algebraMap K L (a : K)
      exact τ.commutes (a : K)
    change τ (((a • x : chosenNormalBasisIntegerLattice K L) : L)) =
      ((a • (⟨τ (x : L), galoisGroup_apply_mem_chosenNormalBasisIntegerLattice
        (K := K) (L := L) τ x.2⟩ : chosenNormalBasisIntegerLattice K L) :
          chosenNormalBasisIntegerLattice K L) : L)
    rw [Submodule.coe_smul, Submodule.coe_smul]
    rw [Algebra.smul_def, Algebra.smul_def]
    rw [map_mul, ha]
omit [TopologicalSpace K] [IsNonarchimedeanLocalField K] in
 
@[simp]
theorem galoisGroupChosenNormalBasisIntegerLatticeLinearEquiv_apply_coe
    (τ : Gal(L / K)) (x : chosenNormalBasisIntegerLattice K L) :
    ((galoisGroupChosenNormalBasisIntegerLatticeLinearEquiv K L τ x :
      chosenNormalBasisIntegerLattice K L) : L) = τ (x : L) :=
  rfl
omit [TopologicalSpace K] [IsNonarchimedeanLocalField K] in
 
@[simp]
theorem galoisGroupChosenNormalBasisIntegerLatticeLinearEquiv_one_apply
    (x : chosenNormalBasisIntegerLattice K L) :
    galoisGroupChosenNormalBasisIntegerLatticeLinearEquiv K L 1 x = x := by
  apply Subtype.ext
  rfl
omit [TopologicalSpace K] [IsNonarchimedeanLocalField K] in
 
@[simp]
theorem galoisGroupChosenNormalBasisIntegerLatticeLinearEquiv_mul_apply
    (τ υ : Gal(L / K)) (x : chosenNormalBasisIntegerLattice K L) :
    galoisGroupChosenNormalBasisIntegerLatticeLinearEquiv K L (τ * υ) x =
      galoisGroupChosenNormalBasisIntegerLatticeLinearEquiv K L τ
        (galoisGroupChosenNormalBasisIntegerLatticeLinearEquiv K L υ x) := by
  apply Subtype.ext
  rfl
omit [TopologicalSpace K] [IsNonarchimedeanLocalField K] in
 

theorem chosenNormalBasisIntegerLatticeBasis_equivFun_galoisGroup
    (τ σ : Gal(L / K)) (x : chosenNormalBasisIntegerLattice K L) :
    (chosenNormalBasisIntegerLatticeBasis K L).equivFun
        (galoisGroupChosenNormalBasisIntegerLatticeLinearEquiv K L τ x) σ =
      (chosenNormalBasisIntegerLatticeBasis K L).equivFun x (τ⁻¹ * σ) := by
  let b := chosenNormalBasisIntegerLatticeBasis K L
  let f := galoisGroupChosenNormalBasisIntegerLatticeLinearEquiv K L τ
  let e : Gal(L / K) ≃ Gal(L / K) := Equiv.mulLeft τ⁻¹
  have hbmap : b.map f = b.reindex e := by
    ext ρ
    rw [Module.Basis.map_apply, Module.Basis.reindex_apply]
    have he : e.symm ρ = τ * ρ := by
      simp [e]
    rw [he]
    simp only [f, b, galoisGroupChosenNormalBasisIntegerLatticeLinearEquiv_apply_coe,
      chosenNormalBasisIntegerLatticeBasis_apply]
    rw [IsGalois.normalBasis_apply (K := K) (L := L) (τ * ρ),
      IsGalois.normalBasis_apply (K := K) (L := L) ρ]
    rfl
  have hcoord (ρ : Gal(L / K)) :
      b.equivFun (f x) (τ * ρ) = b.equivFun x ρ := by
    calc
      b.equivFun (f x) (τ * ρ) =
          (b.reindex e).equivFun (f x) ρ := by
            rw [Module.Basis.equivFun_apply, Module.Basis.equivFun_apply,
              Module.Basis.repr_reindex_apply]
            simp [e]
      _ = (b.map f).equivFun (f x) ρ := by rw [hbmap]
      _ = b.equivFun x ρ := by
        rw [Module.Basis.map_equivFun]
        simp [f]
  simpa using hcoord (τ⁻¹ * σ)
 
theorem chosenNormalBasisIntegerLatticeUniformizerSubmodule_map_galoisGroup
    (τ : Gal(L / K)) :
    (chosenNormalBasisIntegerLatticeUniformizerSubmodule K L).map
        (galoisGroupChosenNormalBasisIntegerLatticeLinearEquiv K L τ :
          chosenNormalBasisIntegerLattice K L →ₗ[𝒪[K]]
            chosenNormalBasisIntegerLattice K L) =
      chosenNormalBasisIntegerLatticeUniformizerSubmodule K L := by
  ext x
  constructor
  · rintro ⟨y, hy, rfl⟩
    rcases (mem_chosenBaseUniformizerPowSubmodule_iff
      (K := K) (L := L) 1 (chosenNormalBasisIntegerLattice K L) (y : L)).1 hy with
      ⟨z, hz, hzy⟩
    refine (mem_chosenBaseUniformizerPowSubmodule_iff
      (K := K) (L := L) 1 (chosenNormalBasisIntegerLattice K L) _).2
      ⟨τ z, galoisGroup_apply_mem_chosenNormalBasisIntegerLattice
        (K := K) (L := L) τ hz, ?_⟩
    change algebraMap 𝒪[K] L (chosenIntegerRingUniformizer K ^ 1) * τ z = τ (y : L)
    rw [← hzy, map_mul]
    congr 1
    change algebraMap K L
        ((chosenIntegerRingUniformizer K ^ 1 : 𝒪[K]) : K) =
      τ (algebraMap K L
        ((chosenIntegerRingUniformizer K ^ 1 : 𝒪[K]) : K))
    exact (τ.commutes _).symm
  · intro hx
    let y := galoisGroupChosenNormalBasisIntegerLatticeLinearEquiv K L τ⁻¹ x
    have hy : y ∈ chosenNormalBasisIntegerLatticeUniformizerSubmodule K L := by
      rcases (mem_chosenBaseUniformizerPowSubmodule_iff
        (K := K) (L := L) 1 (chosenNormalBasisIntegerLattice K L) (x : L)).1 hx with
        ⟨z, hz, hzx⟩
      refine (mem_chosenBaseUniformizerPowSubmodule_iff
        (K := K) (L := L) 1 (chosenNormalBasisIntegerLattice K L) (y : L)).2
        ⟨τ⁻¹ z, galoisGroup_apply_mem_chosenNormalBasisIntegerLattice
          (K := K) (L := L) τ⁻¹ hz, ?_⟩
      change algebraMap 𝒪[K] L (chosenIntegerRingUniformizer K ^ 1) * τ⁻¹ z =
        τ⁻¹ (x : L)
      rw [← hzx, map_mul]
      congr 1
      change algebraMap K L
          ((chosenIntegerRingUniformizer K ^ 1 : 𝒪[K]) : K) =
        τ⁻¹ (algebraMap K L
          ((chosenIntegerRingUniformizer K ^ 1 : 𝒪[K]) : K))
      exact ((τ⁻¹).commutes _).symm
    refine ⟨y, hy, ?_⟩
    apply Subtype.ext
    exact τ.apply_symm_apply (x : L)
 
noncomputable def galoisGroupChosenNormalBasisIntegerLatticeQuotLinearEquiv
    (τ : Gal(L / K)) :
    (chosenNormalBasisIntegerLattice K L ⧸
        chosenNormalBasisIntegerLatticeUniformizerSubmodule K L) ≃ₗ[𝒪[K]]
      (chosenNormalBasisIntegerLattice K L ⧸
        chosenNormalBasisIntegerLatticeUniformizerSubmodule K L) :=
  Submodule.Quotient.equiv
    (chosenNormalBasisIntegerLatticeUniformizerSubmodule K L)
    (chosenNormalBasisIntegerLatticeUniformizerSubmodule K L)
    (galoisGroupChosenNormalBasisIntegerLatticeLinearEquiv K L τ)
    (chosenNormalBasisIntegerLatticeUniformizerSubmodule_map_galoisGroup K L τ)
 
@[simp]
theorem galoisGroupChosenNormalBasisIntegerLatticeQuotLinearEquiv_mk
    (τ : Gal(L / K)) (x : chosenNormalBasisIntegerLattice K L) :
    galoisGroupChosenNormalBasisIntegerLatticeQuotLinearEquiv K L τ
        (Submodule.Quotient.mk x) =
      Submodule.Quotient.mk
        (galoisGroupChosenNormalBasisIntegerLatticeLinearEquiv K L τ x) :=
  rfl
 

noncomputable def galoisGroupChosenNormalBasisLatticeSuccQuotAddEquiv
    (n : Nat) (τ : Gal(L / K)) :
    chosenNormalBasisLatticeSuccQuot K L n ≃+
      chosenNormalBasisLatticeSuccQuot K L n :=
  (chosenNormalBasisLatticeSuccQuotToIntegerLatticeQuotLinearEquiv K L n).toAddEquiv.trans
    ((galoisGroupChosenNormalBasisIntegerLatticeQuotLinearEquiv K L τ).toAddEquiv.trans
      (chosenNormalBasisLatticeSuccQuotToIntegerLatticeQuotLinearEquiv K L n).symm.toAddEquiv)
 
@[simp]
theorem galoisGroupChosenNormalBasisLatticeSuccQuotAddEquiv_mk_mulPow
    (n : Nat) (τ : Gal(L / K)) (x : chosenNormalBasisIntegerLattice K L) :
    galoisGroupChosenNormalBasisLatticeSuccQuotAddEquiv K L n τ
        (chosenNormalBasisLatticeSuccQuotMk K L n
          (chosenNormalBasisIntegerLatticeMulPowLinearEquiv K L n x)) =
      chosenNormalBasisLatticeSuccQuotMk K L n
        (chosenNormalBasisIntegerLatticeMulPowLinearEquiv K L n
          (galoisGroupChosenNormalBasisIntegerLatticeLinearEquiv K L τ x)) := by
  let e := chosenNormalBasisLatticeSuccQuotToIntegerLatticeQuotLinearEquiv K L n
  change e.symm
      (galoisGroupChosenNormalBasisIntegerLatticeQuotLinearEquiv K L τ
        (e (chosenNormalBasisLatticeSuccQuotMk K L n
          (chosenNormalBasisIntegerLatticeMulPowLinearEquiv K L n x)))) = _
  rw [chosenNormalBasisLatticeSuccQuotToIntegerLatticeQuotLinearEquiv_mk_mulPow,
    galoisGroupChosenNormalBasisIntegerLatticeQuotLinearEquiv_mk]
  apply e.injective
  rw [LinearEquiv.apply_symm_apply,
    chosenNormalBasisLatticeSuccQuotToIntegerLatticeQuotLinearEquiv_mk_mulPow]
 
@[simp]
theorem chosenNormalBasisLatticeSuccQuotToIntegerLatticeQuotLinearEquiv_galoisGroup
    (n : Nat) (τ : Gal(L / K))
    (q : chosenNormalBasisLatticeSuccQuot K L n) :
    chosenNormalBasisLatticeSuccQuotToIntegerLatticeQuotLinearEquiv K L n
        (galoisGroupChosenNormalBasisLatticeSuccQuotAddEquiv K L n τ q) =
      galoisGroupChosenNormalBasisIntegerLatticeQuotLinearEquiv K L τ
        (chosenNormalBasisLatticeSuccQuotToIntegerLatticeQuotLinearEquiv K L n q) := by
  let e := chosenNormalBasisLatticeSuccQuotToIntegerLatticeQuotLinearEquiv K L n
  change e (e.symm
    (galoisGroupChosenNormalBasisIntegerLatticeQuotLinearEquiv K L τ (e q))) = _
  exact e.apply_symm_apply _
 

theorem chosenNormalBasisIntegerLatticeMulPowLinearEquiv_galoisGroup_apply_coe
    (n : Nat) (τ : Gal(L / K)) (x : chosenNormalBasisIntegerLattice K L) :
    ((chosenNormalBasisIntegerLatticeMulPowLinearEquiv K L n
      (galoisGroupChosenNormalBasisIntegerLatticeLinearEquiv K L τ x) :
        chosenBaseUniformizerPowSubmodule K L n
          (chosenNormalBasisIntegerLattice K L)) : L) =
      τ ((chosenNormalBasisIntegerLatticeMulPowLinearEquiv K L n x :
        chosenBaseUniformizerPowSubmodule K L n
          (chosenNormalBasisIntegerLattice K L)) : L) := by
  change algebraMap 𝒪[K] L (chosenIntegerRingUniformizer K ^ n) * τ (x : L) =
    τ (algebraMap 𝒪[K] L (chosenIntegerRingUniformizer K ^ n) * (x : L))
  rw [map_mul]
  congr 1
  change algebraMap K L ((chosenIntegerRingUniformizer K ^ n : 𝒪[K]) : K) =
    τ (algebraMap K L ((chosenIntegerRingUniformizer K ^ n : 𝒪[K]) : K))
  exact (τ.commutes _).symm
 

noncomputable abbrev galoisGroupChosenNormalBasisLatticeSuccQuotDistribMulAction
    (n : Nat) :
    DistribMulAction Gal(L / K) (chosenNormalBasisLatticeSuccQuot K L n) where
  smul τ q := galoisGroupChosenNormalBasisLatticeSuccQuotAddEquiv K L n τ q
  one_smul := by
    intro q
    change galoisGroupChosenNormalBasisLatticeSuccQuotAddEquiv K L n 1 q = q
    let e := chosenNormalBasisLatticeSuccQuotToIntegerLatticeQuotLinearEquiv K L n
    apply e.injective
    rw [chosenNormalBasisLatticeSuccQuotToIntegerLatticeQuotLinearEquiv_galoisGroup]
    refine Submodule.Quotient.induction_on
      (chosenNormalBasisIntegerLatticeUniformizerSubmodule K L) (e q) ?_
    intro x
    rw [galoisGroupChosenNormalBasisIntegerLatticeQuotLinearEquiv_mk,
      galoisGroupChosenNormalBasisIntegerLatticeLinearEquiv_one_apply]
  mul_smul := by
    intro τ υ q
    change galoisGroupChosenNormalBasisLatticeSuccQuotAddEquiv K L n (τ * υ) q =
      galoisGroupChosenNormalBasisLatticeSuccQuotAddEquiv K L n τ
        (galoisGroupChosenNormalBasisLatticeSuccQuotAddEquiv K L n υ q)
    let e := chosenNormalBasisLatticeSuccQuotToIntegerLatticeQuotLinearEquiv K L n
    apply e.injective
    rw [chosenNormalBasisLatticeSuccQuotToIntegerLatticeQuotLinearEquiv_galoisGroup,
      chosenNormalBasisLatticeSuccQuotToIntegerLatticeQuotLinearEquiv_galoisGroup,
      chosenNormalBasisLatticeSuccQuotToIntegerLatticeQuotLinearEquiv_galoisGroup]
    refine Submodule.Quotient.induction_on
      (chosenNormalBasisIntegerLatticeUniformizerSubmodule K L) (e q) ?_
    intro x
    rw [galoisGroupChosenNormalBasisIntegerLatticeQuotLinearEquiv_mk,
      galoisGroupChosenNormalBasisIntegerLatticeQuotLinearEquiv_mk,
      galoisGroupChosenNormalBasisIntegerLatticeQuotLinearEquiv_mk,
      galoisGroupChosenNormalBasisIntegerLatticeLinearEquiv_mul_apply]
  smul_zero := by
    intro τ
    exact (galoisGroupChosenNormalBasisLatticeSuccQuotAddEquiv K L n τ).map_zero
  smul_add := by
    intro τ q r
    exact (galoisGroupChosenNormalBasisLatticeSuccQuotAddEquiv K L n τ).map_add q r
 
@[simp]
theorem galoisGroupChosenNormalBasisLatticeSuccQuotDistribMulAction_smul_mk_mulPow
    (n : Nat) (τ : Gal(L / K)) (x : chosenNormalBasisIntegerLattice K L) :
    letI := galoisGroupChosenNormalBasisLatticeSuccQuotDistribMulAction K L n
    τ • chosenNormalBasisLatticeSuccQuotMk K L n
        (chosenNormalBasisIntegerLatticeMulPowLinearEquiv K L n x) =
      chosenNormalBasisLatticeSuccQuotMk K L n
        (chosenNormalBasisIntegerLatticeMulPowLinearEquiv K L n
          (galoisGroupChosenNormalBasisIntegerLatticeLinearEquiv K L τ x)) :=
  galoisGroupChosenNormalBasisLatticeSuccQuotAddEquiv_mk_mulPow K L n τ x
 

theorem chosenNormalBasisLatticeSuccQuotRightRegularAddEquiv_commutes
    (n : Nat) (τ : Gal(L / K))
    (q : chosenNormalBasisLatticeSuccQuot K L n) (σ : Gal(L / K)) :
    letI := galoisGroupChosenNormalBasisLatticeSuccQuotDistribMulAction K L n
    chosenNormalBasisLatticeSuccQuotRightRegularAddEquiv K L n (τ • q) σ =
      chosenNormalBasisLatticeSuccQuotRightRegularAddEquiv K L n q (σ * τ) := by
  let := galoisGroupChosenNormalBasisLatticeSuccQuotDistribMulAction K L n
  refine chosenNormalBasisLatticeSuccQuot.inductionOn K L n
    (motive := fun q =>
      chosenNormalBasisLatticeSuccQuotRightRegularAddEquiv K L n (τ • q) σ =
        chosenNormalBasisLatticeSuccQuotRightRegularAddEquiv K L n q (σ * τ))
    q ?_
  intro z
  let x : chosenNormalBasisIntegerLattice K L :=
    (chosenNormalBasisIntegerLatticeMulPowLinearEquiv K L n).symm z
  have hz : chosenNormalBasisIntegerLatticeMulPowLinearEquiv K L n x = z :=
    (chosenNormalBasisIntegerLatticeMulPowLinearEquiv K L n).apply_symm_apply z
  rw [← hz,
    galoisGroupChosenNormalBasisLatticeSuccQuotDistribMulAction_smul_mk_mulPow,
    chosenNormalBasisLatticeSuccQuotRightRegularAddEquiv_mk_mulPow,
    chosenNormalBasisLatticeSuccQuotRightRegularAddEquiv_mk_mulPow,
    chosenNormalBasisIntegerLatticeBasis_equivFun_galoisGroup]
  congr 1
 

theorem chosenNormalBasisLatticeSuccQuot_herbrandH0_subsingleton (n : Nat) :
    letI := galoisGroupChosenNormalBasisLatticeSuccQuotDistribMulAction K L n
    letI :=
      CyclicCohomology.ProfiniteCohomology.Herbrand.multiplicativeMulDistribMulActionOfDistribMulAction
        Gal(L / K) (chosenNormalBasisLatticeSuccQuot K L n)
    Subsingleton (CyclicCohomology.ProfiniteCohomology.Herbrand.HerbrandH0
      Gal(L / K) (Multiplicative (chosenNormalBasisLatticeSuccQuot K L n))) := by
  let := galoisGroupChosenNormalBasisLatticeSuccQuotDistribMulAction K L n
  exact
    CyclicCohomology.ProfiniteCohomology.Herbrand.herbrandH0_subsingleton_of_addEquiv_rightRegularFunction
      (G := Gal(L / K)) (M := chosenNormalBasisLatticeSuccQuot K L n) (D := 𝓀[K])
      (chosenNormalBasisLatticeSuccQuotRightRegularAddEquiv K L n)
      (chosenNormalBasisLatticeSuccQuotRightRegularAddEquiv_commutes K L n)
 

theorem chosenNormalBasisLatticeSuccQuot_herbrandHMinusOne_subsingleton
    (n : Nat) (τ : Gal(L / K))
    (hgen : ∀ g : Gal(L / K), g ∈ Subgroup.zpowers τ) :
    letI := galoisGroupChosenNormalBasisLatticeSuccQuotDistribMulAction K L n
    letI :=
      CyclicCohomology.ProfiniteCohomology.Herbrand.multiplicativeMulDistribMulActionOfDistribMulAction
        Gal(L / K) (chosenNormalBasisLatticeSuccQuot K L n)
    Subsingleton (CyclicCohomology.ProfiniteCohomology.Herbrand.HerbrandHMinusOne
      Gal(L / K) (Multiplicative (chosenNormalBasisLatticeSuccQuot K L n)) τ) := by
  let := galoisGroupChosenNormalBasisLatticeSuccQuotDistribMulAction K L n
  exact
    CyclicCohomology.ProfiniteCohomology.Herbrand.herbrandHMinusOne_subsingleton_of_addEquiv_rightRegularFunction
      (G := Gal(L / K)) (M := chosenNormalBasisLatticeSuccQuot K L n) (D := 𝓀[K])
      τ hgen (chosenNormalBasisLatticeSuccQuotRightRegularAddEquiv K L n)
      (chosenNormalBasisLatticeSuccQuotRightRegularAddEquiv_commutes K L n)
end GradedCoordinates
end
end LocalClassFieldTheory
end

/- ClassFieldTheory.LocalClassFieldTheory.ClassFormation.PrincipalUnitGraded -/
section
namespace LocalClassFieldTheory
open CyclicCohomology LocalFieldTheory
noncomputable section
universe u
open scoped ValuativeRel
open IsNonarchimedeanLocalField
variable (K L : Type u) [Field K] [Field L] [Algebra K L]
  [FiniteDimensional K L] [IsGalois K L]
  [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
  [ValuativeRel L]
  [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
omit [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)] in
 


theorem chosenNormalBasisPrincipalUnitSuccQuotToLatticeSuccQuotHom_injective
    {n : Nat} {Vn Vsucc : Subgroup 𝒪[L]ˣ}
    (hVn : (Vn : Set 𝒪[L]ˣ) = chosenNormalBasisPrincipalUnitSet K L n)
    (hVsucc : (Vsucc : Set 𝒪[L]ˣ) =
      chosenNormalBasisPrincipalUnitSet K L (n + 1))
    (hV : Vsucc ≤ Vn)
    (hmul_error : ∀ u : 𝒪[L]ˣ, u ∈ chosenNormalBasisPrincipalUnitSet K L n →
      ∀ v : 𝒪[L]ˣ, v ∈ chosenNormalBasisPrincipalUnitSet K L n →
        (((((u * v : 𝒪[L]ˣ) : 𝒪[L]) - 1 : 𝒪[L]) : L) -
            (((((u : 𝒪[L]ˣ) : 𝒪[L]) - 1 : 𝒪[L]) : L) +
              ((((v : 𝒪[L]ˣ) : 𝒪[L]) - 1 : 𝒪[L]) : L))) ∈
          chosenBaseUniformizerPowSubmodule K L (n + 1)
            (chosenNormalBasisIntegerLattice K L)) :
    Function.Injective
      (chosenNormalBasisPrincipalUnitSuccQuotToLatticeSuccQuotHom
        K L n hVn hVsucc hV hmul_error) := by
  rw [← MonoidHom.ker_eq_bot_iff]
  apply le_antisymm
  · intro q hq
    rw [Subgroup.mem_bot]
    revert hq
    refine
      chosenNormalBasisPrincipalUnitSuccQuot.inductionOn
        (L := L) hV
        (motive := fun q =>
          q ∈ (chosenNormalBasisPrincipalUnitSuccQuotToLatticeSuccQuotHom
            K L n hVn hVsucc hV hmul_error).ker → q = 1)
        q ?_
    intro u hu
    rw [MonoidHom.mem_ker] at hu
    change chosenNormalBasisPrincipalUnitSuccQuotToLatticeSuccQuotHom
        K L n hVn hVsucc hV hmul_error
        (chosenNormalBasisPrincipalUnitSuccQuotMk (L := L) hV u) = 1 at hu
    rw [chosenNormalBasisPrincipalUnitSuccQuotToLatticeSuccQuotHom_mk] at hu
    have hu_n : (u : 𝒪[L]ˣ) ∈ chosenNormalBasisPrincipalUnitSet K L n := by
      exact hVn ▸ u.2
    have hzero :
        chosenNormalBasisPrincipalUnitLatticeClass K L n (u : 𝒪[L]ˣ) hu_n = 0 := by
      have h := congrArg
        (fun x : Multiplicative (chosenNormalBasisLatticeSuccQuot K L n) => x.toAdd) hu
      change
        chosenNormalBasisPrincipalUnitLatticeClass K L n (u : 𝒪[L]ˣ) hu_n = 0 at h
      exact h
    have hu_succ :
        (u : 𝒪[L]ˣ) ∈ chosenNormalBasisPrincipalUnitSet K L (n + 1) :=
      (chosenNormalBasisPrincipalUnitLatticeClass_eq_zero_iff
        (K := K) (L := L) (u : 𝒪[L]ˣ) hu_n).1 hzero
    change chosenNormalBasisPrincipalUnitSuccQuotMk (L := L) hV u = 1
    rw [chosenNormalBasisPrincipalUnitSuccQuotMk_eq_one_iff]
    change (u : 𝒪[L]ˣ) ∈ (Vsucc : Set 𝒪[L]ˣ)
    rw [hVsucc]
    exact hu_succ
  · exact bot_le
 


theorem chosenNormalBasisPrincipalUnitSuccQuotToLatticeSuccQuotHom_surjective_of_le_maximalIdeal
    {n : Nat} {Vn Vsucc : Subgroup 𝒪[L]ˣ}
    (hVn : (Vn : Set 𝒪[L]ˣ) = chosenNormalBasisPrincipalUnitSet K L n)
    (hVsucc : (Vsucc : Set 𝒪[L]ˣ) =
      chosenNormalBasisPrincipalUnitSet K L (n + 1))
    (hV : Vsucc ≤ Vn)
    (hmul_error : ∀ u : 𝒪[L]ˣ, u ∈ chosenNormalBasisPrincipalUnitSet K L n →
      ∀ v : 𝒪[L]ˣ, v ∈ chosenNormalBasisPrincipalUnitSet K L n →
        (((((u * v : 𝒪[L]ˣ) : 𝒪[L]) - 1 : 𝒪[L]) : L) -
            (((((u : 𝒪[L]ˣ) : 𝒪[L]) - 1 : 𝒪[L]) : L) +
              ((((v : 𝒪[L]ˣ) : 𝒪[L]) - 1 : 𝒪[L]) : L))) ∈
          chosenBaseUniformizerPowSubmodule K L (n + 1)
            (chosenNormalBasisIntegerLattice K L))
    (hle : chosenBaseUniformizerPowSubmodule K L n
        (chosenNormalBasisIntegerLattice K L) ≤
      maximalIdealFieldSubmodule K L) :
    Function.Surjective
      (chosenNormalBasisPrincipalUnitSuccQuotToLatticeSuccQuotHom
        K L n hVn hVsucc hV hmul_error) := by
  intro y
  let yadd : chosenNormalBasisLatticeSuccQuot K L n := Multiplicative.toAdd y
  suffices ∃ q : chosenNormalBasisPrincipalUnitSuccQuot (L := L) hV,
      chosenNormalBasisPrincipalUnitSuccQuotToLatticeSuccQuotHom
          K L n hVn hVsucc hV hmul_error q = Multiplicative.ofAdd yadd by
    simpa [yadd] using this
  refine chosenNormalBasisLatticeSuccQuot.inductionOn K L n
    (motive := fun yadd =>
      ∃ q : chosenNormalBasisPrincipalUnitSuccQuot (L := L) hV,
        chosenNormalBasisPrincipalUnitSuccQuotToLatticeSuccQuotHom
            K L n hVn hVsucc hV hmul_error q =
          Multiplicative.ofAdd yadd)
    yadd ?_
  intro x
  have hxmax : (x : L) ∈ maximalIdealFieldSubmodule K L := hle x.2
  rcases (mem_maximalIdealFieldSubmodule_iff
      (K := K) (L := L) (x : L)).1 hxmax with ⟨a, ha, hax⟩
  have ha_pow : a ∈ (𝓂[L] ^ (1 : Nat) : Ideal 𝒪[L]) := by
    simpa using ha
  let hunit : IsUnit (1 + a) :=
    isUnit_one_add_of_mem_maximalIdeal_pow L (n := 1) (by rfl) a ha_pow
  let u : 𝒪[L]ˣ := hunit.unit
  have huval : ((u : 𝒪[L]ˣ) : 𝒪[L]) = 1 + a := by
    exact IsUnit.unit_spec hunit
  have hu_sub_one :
      (((((u : 𝒪[L]ˣ) : 𝒪[L]) - 1 : 𝒪[L]) : L) = (x : L)) := by
    rw [huval]
    simpa using hax
  have hu_set : u ∈ chosenNormalBasisPrincipalUnitSet K L n := by
    rw [mem_chosenNormalBasisPrincipalUnitSet_iff, hu_sub_one]
    exact x.2
  have huVn : u ∈ Vn := by
    change u ∈ (Vn : Set 𝒪[L]ˣ)
    rw [hVn]
    exact hu_set
  let ux : Vn := ⟨u, huVn⟩
  refine ⟨chosenNormalBasisPrincipalUnitSuccQuotMk (L := L) hV ux, ?_⟩
  rw [chosenNormalBasisPrincipalUnitSuccQuotToLatticeSuccQuotHom_mk]
  change Multiplicative.ofAdd
      (chosenNormalBasisPrincipalUnitLatticeClass K L n u hu_set) =
    Multiplicative.ofAdd (chosenNormalBasisLatticeSuccQuotMk K L n x)
  congr 1
  rw [chosenNormalBasisPrincipalUnitLatticeClass]
  exact congrArg (chosenNormalBasisLatticeSuccQuotMk K L n)
    (Subtype.ext hu_sub_one)
 


noncomputable def chosenNormalBasisPrincipalUnitSuccQuotMulEquivLatticeSuccQuot
    {n : Nat} {Vn Vsucc : Subgroup 𝒪[L]ˣ}
    (hVn : (Vn : Set 𝒪[L]ˣ) = chosenNormalBasisPrincipalUnitSet K L n)
    (hVsucc : (Vsucc : Set 𝒪[L]ˣ) =
      chosenNormalBasisPrincipalUnitSet K L (n + 1))
    (hV : Vsucc ≤ Vn)
    (hmul_error : ∀ u : 𝒪[L]ˣ, u ∈ chosenNormalBasisPrincipalUnitSet K L n →
      ∀ v : 𝒪[L]ˣ, v ∈ chosenNormalBasisPrincipalUnitSet K L n →
        (((((u * v : 𝒪[L]ˣ) : 𝒪[L]) - 1 : 𝒪[L]) : L) -
            (((((u : 𝒪[L]ˣ) : 𝒪[L]) - 1 : 𝒪[L]) : L) +
              ((((v : 𝒪[L]ˣ) : 𝒪[L]) - 1 : 𝒪[L]) : L))) ∈
          chosenBaseUniformizerPowSubmodule K L (n + 1)
            (chosenNormalBasisIntegerLattice K L))
    (hle : chosenBaseUniformizerPowSubmodule K L n
        (chosenNormalBasisIntegerLattice K L) ≤
      maximalIdealFieldSubmodule K L) :
    chosenNormalBasisPrincipalUnitSuccQuot (L := L) hV ≃*
      Multiplicative (chosenNormalBasisLatticeSuccQuot K L n) :=
  MulEquiv.ofBijective
    (chosenNormalBasisPrincipalUnitSuccQuotToLatticeSuccQuotHom
      K L n hVn hVsucc hV hmul_error)
    ⟨chosenNormalBasisPrincipalUnitSuccQuotToLatticeSuccQuotHom_injective
        (K := K) (L := L) hVn hVsucc hV hmul_error,
      chosenNormalBasisPrincipalUnitSuccQuotToLatticeSuccQuotHom_surjective_of_le_maximalIdeal
        (K := K) (L := L) hVn hVsucc hV hmul_error hle⟩
 


theorem exists_chosenNormalBasisPrincipalUnitSuccQuotMulEquivLatticeSuccQuot
    [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Module.Finite 𝒪[K] 𝒪[L]] :
    ∃ c : Nat, ∀ n : Nat, c ≤ n →
      ∃ Vn Vsucc : Subgroup 𝒪[L]ˣ,
        ∃ hV : Vsucc ≤ Vn,
          ∃ hVn : (Vn : Set 𝒪[L]ˣ) = chosenNormalBasisPrincipalUnitSet K L n,
            (Vsucc : Set 𝒪[L]ˣ) = chosenNormalBasisPrincipalUnitSet K L (n + 1) ∧
              ∃ Φ : chosenNormalBasisPrincipalUnitSuccQuot (L := L) hV ≃*
                  Multiplicative (chosenNormalBasisLatticeSuccQuot K L n),
                Vn ≤ principalUnits L 1 ∧
                  ∀ u : Vn,
                    Φ (chosenNormalBasisPrincipalUnitSuccQuotMk (L := L) hV u) =
                      Multiplicative.ofAdd
                        (chosenNormalBasisPrincipalUnitLatticeClass K L n
                          (u : 𝒪[L]ˣ) (by exact hVn ▸ u.2)) := by
  rcases exists_chosenNormalBasisPrincipalUnitSubgroupSuccPair
      (K := K) (L := L) with ⟨c₁, hc₁⟩
  rcases exists_chosenNormalBasisPrincipalUnitSet_mul_error_mem_succ
      (K := K) (L := L) with ⟨c₂, hc₂⟩
  rcases exists_chosenBaseUniformizerPow_chosenNormalBasisIntegerLattice_le_maximalIdeal_and_mul_closed
      (K := K) (L := L) with ⟨c₃, hc₃⟩
  refine ⟨max c₁ (max c₂ c₃), ?_⟩
  intro n hn
  have hc₁n : c₁ ≤ n :=
    le_trans (le_max_left c₁ (max c₂ c₃)) hn
  have hcrest : max c₂ c₃ ≤ max c₁ (max c₂ c₃) :=
    le_max_right c₁ (max c₂ c₃)
  have hc₂n : c₂ ≤ n :=
    le_trans (le_trans (le_max_left c₂ c₃) hcrest) hn
  have hc₃n : c₃ ≤ n :=
    le_trans (le_trans (le_max_right c₂ c₃) hcrest) hn
  rcases hc₁ n hc₁n with ⟨Vn, Vsucc, hVn, hVsucc, hV, hVnle⟩
  let hmul_error := hc₂ n hc₂n
  let hle := (hc₃ n hc₃n).1
  let Φ : chosenNormalBasisPrincipalUnitSuccQuot (L := L) hV ≃*
      Multiplicative (chosenNormalBasisLatticeSuccQuot K L n) :=
    chosenNormalBasisPrincipalUnitSuccQuotMulEquivLatticeSuccQuot
      K L hVn hVsucc hV hmul_error hle
  refine ⟨Vn, Vsucc, hV, hVn, hVsucc, Φ, hVnle, ?_⟩
  intro u
  rfl
end
end LocalClassFieldTheory
end

/- ClassFieldTheory.LocalClassFieldTheory.ClassFormation.NormalBasisGradedLifting -/
section
namespace LocalClassFieldTheory
open LocalFieldTheory
open CyclicCohomology
noncomputable section
universe u
open scoped BigOperators ValuativeRel
open IsNonarchimedeanLocalField
open CyclicCohomology.ProfiniteCohomology.Herbrand
variable (K L : Type u) [Field K] [Field L] [Algebra K L]
  [FiniteDimensional K L] [IsGalois K L]
  [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
  [ValuativeRel L]
  [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
  [IsIntegralClosure 𝒪[L] 𝒪[K] L]
 


theorem chosenNormalBasisPrincipalUnitLatticeClass_galoisGroup
    (n : Nat) (sigma : Gal(L / K)) (u : 𝒪[L]ˣ)
    (hu : u ∈ chosenNormalBasisPrincipalUnitSet K L n) :
    letI := galoisGroupIntegerUnitsMulDistribMulActionOfIsIntegralClosure K L
    letI := galoisGroupChosenNormalBasisLatticeSuccQuotDistribMulAction K L n
    chosenNormalBasisPrincipalUnitLatticeClass K L n (sigma • u)
        (galoisGroup_smul_mem_chosenNormalBasisPrincipalUnitSet
          (K := K) (L := L) n sigma hu) =
      sigma • chosenNormalBasisPrincipalUnitLatticeClass K L n u hu := by
  let := galoisGroupIntegerUnitsMulDistribMulActionOfIsIntegralClosure K L
  let := galoisGroupChosenNormalBasisLatticeSuccQuotDistribMulAction K L n
  let y : chosenBaseUniformizerPowSubmodule K L n
      (chosenNormalBasisIntegerLattice K L) :=
    ⟨((((u : 𝒪[L]ˣ) : 𝒪[L]) - 1 : 𝒪[L]) : L), hu⟩
  let x : chosenNormalBasisIntegerLattice K L :=
    (chosenNormalBasisIntegerLatticeMulPowLinearEquiv K L n).symm y
  have hxy : chosenNormalBasisIntegerLatticeMulPowLinearEquiv K L n x = y :=
    (chosenNormalBasisIntegerLatticeMulPowLinearEquiv K L n).apply_symm_apply y
  rw [chosenNormalBasisPrincipalUnitLatticeClass,
    chosenNormalBasisPrincipalUnitLatticeClass]
  change chosenNormalBasisLatticeSuccQuotMk K L n _ =
    sigma • chosenNormalBasisLatticeSuccQuotMk K L n y
  rw [← hxy,
    galoisGroupChosenNormalBasisLatticeSuccQuotDistribMulAction_smul_mk_mulPow]
  apply congrArg (chosenNormalBasisLatticeSuccQuotMk K L n)
  apply Subtype.ext
  have hfield := chosenNormalBasisIntegerLatticeMulPowLinearEquiv_galoisGroup_apply_coe
    K L n sigma x
  rw [hxy] at hfield
  simpa [y, galoisGroupIntegerUnitsMulDistribMulActionOfIsIntegralClosure_smul,
    map_sub, map_one] using hfield.symm
 

abbrev chosenNormalBasisPrincipalUnitSuccQuotMulDistribMulAction
    (n : Nat) {Vn Vsucc : Subgroup 𝒪[L]ˣ} (hV : Vsucc ≤ Vn)
    (hVn : (Vn : Set 𝒪[L]ˣ) = chosenNormalBasisPrincipalUnitSet K L n)
    (hVsucc : (Vsucc : Set 𝒪[L]ˣ) =
      chosenNormalBasisPrincipalUnitSet K L (n + 1)) :
    MulDistribMulAction (Gal(L / K))
      (chosenNormalBasisPrincipalUnitSuccQuot (L := L) hV) := by
  letI := galoisGroupIntegerUnitsMulDistribMulActionOfIsIntegralClosure K L
  letI := chosenNormalBasisPrincipalUnitSubgroupMulDistribMulAction
    K L n Vn hVn
  change MulDistribMulAction (Gal(L / K))
    (Vn ⧸ chosenNormalBasisPrincipalUnitSuccSubgroup (L := L) hV)
  exact quotientMulDistribMulActionOfSubgroupStable
    (Gal(L / K)) Vn
    (chosenNormalBasisPrincipalUnitSuccSubgroup (L := L) hV) (by
      intro sigma a ha
      apply (mem_chosenNormalBasisPrincipalUnitSuccSubgroup_iff
        (L := L) hV (sigma • a)).2
      change (sigma • (a : 𝒪[L]ˣ)) ∈ (Vsucc : Set 𝒪[L]ˣ)
      rw [hVsucc]
      apply galoisGroup_smul_mem_chosenNormalBasisPrincipalUnitSet
        (K := K) (L := L) (n + 1) sigma
      rw [← hVsucc]
      exact (mem_chosenNormalBasisPrincipalUnitSuccSubgroup_iff
        (L := L) hV a).1 ha)
 
@[simp]
theorem chosenNormalBasisPrincipalUnitSuccQuotMulDistribMulAction_smul_mk
    (n : Nat) {Vn Vsucc : Subgroup 𝒪[L]ˣ} (hV : Vsucc ≤ Vn)
    (hVn : (Vn : Set 𝒪[L]ˣ) = chosenNormalBasisPrincipalUnitSet K L n)
    (hVsucc : (Vsucc : Set 𝒪[L]ˣ) =
      chosenNormalBasisPrincipalUnitSet K L (n + 1))
    (sigma : Gal(L / K)) (u : Vn) :
    letI := chosenNormalBasisPrincipalUnitSubgroupMulDistribMulAction
      K L n Vn hVn
    letI := chosenNormalBasisPrincipalUnitSuccQuotMulDistribMulAction
      K L n hV hVn hVsucc
    sigma • chosenNormalBasisPrincipalUnitSuccQuotMk (L := L) hV u =
      chosenNormalBasisPrincipalUnitSuccQuotMk (L := L) hV (sigma • u) :=
  rfl
 

theorem chosenNormalBasisPrincipalUnitSuccQuotMulEquiv_galoisGroup
    (n : Nat) {Vn Vsucc : Subgroup 𝒪[L]ˣ} (hV : Vsucc ≤ Vn)
    (hVn : (Vn : Set 𝒪[L]ˣ) = chosenNormalBasisPrincipalUnitSet K L n)
    (hVsucc : (Vsucc : Set 𝒪[L]ˣ) =
      chosenNormalBasisPrincipalUnitSet K L (n + 1))
    (Phi : chosenNormalBasisPrincipalUnitSuccQuot (L := L) hV ≃*
      Multiplicative (chosenNormalBasisLatticeSuccQuot K L n))
    (hPhi : ∀ u : Vn,
      Phi (chosenNormalBasisPrincipalUnitSuccQuotMk (L := L) hV u) =
        Multiplicative.ofAdd
          (chosenNormalBasisPrincipalUnitLatticeClass K L n (u : 𝒪[L]ˣ)
            (by exact hVn ▸ u.2)))
    (sigma : Gal(L / K))
    (q : chosenNormalBasisPrincipalUnitSuccQuot (L := L) hV) :
    letI := chosenNormalBasisPrincipalUnitSubgroupMulDistribMulAction
      K L n Vn hVn
    letI := chosenNormalBasisPrincipalUnitSuccQuotMulDistribMulAction
      K L n hV hVn hVsucc
    letI := galoisGroupChosenNormalBasisLatticeSuccQuotDistribMulAction K L n
    letI := multiplicativeMulDistribMulActionOfDistribMulAction
      (Gal(L / K)) (chosenNormalBasisLatticeSuccQuot K L n)
    Phi (sigma • q) = sigma • Phi q := by
  let := galoisGroupIntegerUnitsMulDistribMulActionOfIsIntegralClosure K L
  let := chosenNormalBasisPrincipalUnitSubgroupMulDistribMulAction
    K L n Vn hVn
  let := chosenNormalBasisPrincipalUnitSuccQuotMulDistribMulAction
    K L n hV hVn hVsucc
  let := galoisGroupChosenNormalBasisLatticeSuccQuotDistribMulAction K L n
  let := multiplicativeMulDistribMulActionOfDistribMulAction
    (Gal(L / K)) (chosenNormalBasisLatticeSuccQuot K L n)
  refine
    chosenNormalBasisPrincipalUnitSuccQuot.inductionOn
      (L := L) hV
      (motive := fun q => Phi (sigma • q) = sigma • Phi q)
      q ?_
  intro u
  rw [chosenNormalBasisPrincipalUnitSuccQuotMulDistribMulAction_smul_mk,
    hPhi, hPhi]
  exact congrArg Multiplicative.ofAdd
    (chosenNormalBasisPrincipalUnitLatticeClass_galoisGroup
      (K := K) (L := L) n sigma (u : 𝒪[L]ˣ) (by exact hVn ▸ u.2))
 

theorem exists_chosenNormalBasisPrincipalUnit_h0_oneStep_lifting
    [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Module.Finite 𝒪[K] 𝒪[L]] :
    letI := galoisGroupIntegerUnitsMulDistribMulActionOfIsIntegralClosure K L
    ∃ c : Nat, ∀ k : Nat, c ≤ k → ∀ a : 𝒪[L]ˣ,
      a ∈ chosenNormalBasisPrincipalUnitSet K L k →
      (∀ sigma : Gal(L / K), sigma • a = a) →
      ∃ b a' : 𝒪[L]ˣ,
        b ∈ chosenNormalBasisPrincipalUnitSet K L k ∧
        a' ∈ chosenNormalBasisPrincipalUnitSet K L (k + 1) ∧
        (∀ sigma : Gal(L / K), sigma • a' = a') ∧
        a = tateNorm (Gal(L / K)) 𝒪[L]ˣ b * a' := by
  let := galoisGroupIntegerUnitsMulDistribMulActionOfIsIntegralClosure K L
  rcases exists_chosenNormalBasisPrincipalUnitSuccQuotMulEquivLatticeSuccQuot
      (K := K) (L := L) with ⟨c, hc⟩
  refine ⟨c, ?_⟩
  intro k hck a ha hfixed
  rcases hc k hck with
    ⟨Vn, Vsucc, hV, hVn, hVsucc, Phi, _hVnle, hPhi⟩
  let := chosenNormalBasisPrincipalUnitSubgroupMulDistribMulAction
    K L k Vn hVn
  let := chosenNormalBasisPrincipalUnitSuccQuotMulDistribMulAction
    K L k hV hVn hVsucc
  let := galoisGroupChosenNormalBasisLatticeSuccQuotDistribMulAction K L k
  let := multiplicativeMulDistribMulActionOfDistribMulAction
    (Gal(L / K)) (chosenNormalBasisLatticeSuccQuot K L k)
  let av : Vn := ⟨a, by
    change a ∈ (Vn : Set 𝒪[L]ˣ)
    rw [hVn]
    exact ha⟩
  let q : Multiplicative (chosenNormalBasisLatticeSuccQuot K L k) :=
    Phi (chosenNormalBasisPrincipalUnitSuccQuotMk (L := L) hV av)
  have hqfixed : ∀ sigma : Gal(L / K), sigma • q = q := by
    intro sigma
    dsimp [q]
    calc
      sigma • Phi (chosenNormalBasisPrincipalUnitSuccQuotMk (L := L) hV av) =
          Phi (sigma • chosenNormalBasisPrincipalUnitSuccQuotMk (L := L) hV av) :=
        (chosenNormalBasisPrincipalUnitSuccQuotMulEquiv_galoisGroup
          (K := K) (L := L) k hV hVn hVsucc Phi hPhi sigma _).symm
      _ = Phi (chosenNormalBasisPrincipalUnitSuccQuotMk (L := L) hV (sigma • av)) := by
        rw [chosenNormalBasisPrincipalUnitSuccQuotMulDistribMulAction_smul_mk]
      _ = Phi (chosenNormalBasisPrincipalUnitSuccQuotMk (L := L) hV av) := by
        congr 2
        apply Subtype.ext
        exact hfixed sigma
  let qfixed : fixedSubgroup (Gal(L / K))
      (Multiplicative (chosenNormalBasisLatticeSuccQuot K L k)) :=
    ⟨q, hqfixed⟩
  have hH0 := chosenNormalBasisLatticeSuccQuot_herbrandH0_subsingleton K L k
  have hqone :
      QuotientGroup.mk'
          ((tateNormSubgroup (Gal(L / K))
            (Multiplicative (chosenNormalBasisLatticeSuccQuot K L k))).subgroupOf
              (fixedSubgroup (Gal(L / K))
                (Multiplicative (chosenNormalBasisLatticeSuccQuot K L k))))
          qfixed = 1 :=
    @Subsingleton.elim _ hH0 _ _
  have hqmem : q ∈ tateNormSubgroup (Gal(L / K))
      (Multiplicative (chosenNormalBasisLatticeSuccQuot K L k)) := by
    have hm := (QuotientGroup.eq_one_iff _).1 hqone
    exact hm
  rcases hqmem with ⟨y, hy⟩
  rcases Phi.surjective y with ⟨qb, hqb⟩
  rcases chosenNormalBasisPrincipalUnitSuccQuotMk_surjective
      (L := L) hV qb with
    ⟨bv, hbvmk⟩
  change chosenNormalBasisPrincipalUnitSuccQuotMk (L := L) hV bv = qb at hbvmk
  have hPhiNorm :
      Phi (tateNorm (Gal(L / K))
        (chosenNormalBasisPrincipalUnitSuccQuot (L := L) hV)
        (chosenNormalBasisPrincipalUnitSuccQuotMk (L := L) hV bv)) = q := by
    calc
      Phi (tateNorm (Gal(L / K))
          (chosenNormalBasisPrincipalUnitSuccQuot (L := L) hV)
          (chosenNormalBasisPrincipalUnitSuccQuotMk (L := L) hV bv)) =
          tateNorm (Gal(L / K))
            (Multiplicative (chosenNormalBasisLatticeSuccQuot K L k))
            (Phi (chosenNormalBasisPrincipalUnitSuccQuotMk (L := L) hV bv)) :=
        map_tateNorm Phi.toMonoidHom
          (fun sigma z => chosenNormalBasisPrincipalUnitSuccQuotMulEquiv_galoisGroup
            (K := K) (L := L) k hV hVn hVsucc Phi hPhi sigma z) _
      _ = tateNorm (Gal(L / K))
          (Multiplicative (chosenNormalBasisLatticeSuccQuot K L k)) y := by
        rw [hbvmk, hqb]
      _ = q := hy
  have hquotNorm :
      tateNorm (Gal(L / K))
          (chosenNormalBasisPrincipalUnitSuccQuot (L := L) hV)
          (chosenNormalBasisPrincipalUnitSuccQuotMk (L := L) hV bv) =
        chosenNormalBasisPrincipalUnitSuccQuotMk (L := L) hV av := by
    apply Phi.injective
    simpa [q] using hPhiNorm
  let bn : Vn := tateNorm (Gal(L / K)) Vn bv
  have hmkbn : chosenNormalBasisPrincipalUnitSuccQuotMk (L := L) hV bn =
      chosenNormalBasisPrincipalUnitSuccQuotMk (L := L) hV av := by
    calc
      chosenNormalBasisPrincipalUnitSuccQuotMk (L := L) hV bn =
          tateNorm (Gal(L / K))
            (chosenNormalBasisPrincipalUnitSuccQuot (L := L) hV)
            (chosenNormalBasisPrincipalUnitSuccQuotMk (L := L) hV bv) := by
        exact map_tateNorm
          (chosenNormalBasisPrincipalUnitSuccQuotMk (L := L) hV)
          (fun sigma z =>
            (chosenNormalBasisPrincipalUnitSuccQuotMulDistribMulAction_smul_mk
              (K := K) (L := L) k hV hVn hVsucc sigma z).symm) bv
      _ = chosenNormalBasisPrincipalUnitSuccQuotMk (L := L) hV av := hquotNorm
  let aprimev : Vn := av / bn
  have haprimeSucc : (aprimev : 𝒪[L]ˣ) ∈ Vsucc := by
    apply (chosenNormalBasisPrincipalUnitSuccQuotMk_eq_one_iff
      (L := L) hV aprimev).1
    dsimp [aprimev]
    rw [map_div, hmkbn]
    simp
  have havfixed : ∀ sigma : Gal(L / K), sigma • av = av := by
    intro sigma
    apply Subtype.ext
    exact hfixed sigma
  have hbnfixed : ∀ sigma : Gal(L / K), sigma • bn = bn := by
    intro sigma
    exact smul_tateNorm_eq (G := Gal(L / K)) (A := Vn) sigma bv
  have haprimefixed : ∀ sigma : Gal(L / K), sigma • aprimev = aprimev := by
    intro sigma
    dsimp [aprimev]
    have ha' := havfixed sigma
    have hb' := hbnfixed sigma
    change (MulDistribMulAction.toMonoidHom Vn sigma) av = av at ha'
    change (MulDistribMulAction.toMonoidHom Vn sigma) bn = bn at hb'
    change (MulDistribMulAction.toMonoidHom Vn sigma) (av / bn) = av / bn
    rw [map_div, ha', hb']
  refine ⟨(bv : 𝒪[L]ˣ), (aprimev : 𝒪[L]ˣ), ?_, ?_, ?_, ?_⟩
  · exact hVn ▸ bv.2
  · exact hVsucc ▸ haprimeSucc
  · intro sigma
    exact congrArg (fun z : Vn => (z : 𝒪[L]ˣ)) (haprimefixed sigma)
  · have hbnval : (bn : 𝒪[L]ˣ) =
        tateNorm (Gal(L / K)) 𝒪[L]ˣ (bv : 𝒪[L]ˣ) := by
      exact map_tateNorm
        (chosenNormalBasisPrincipalUnitSubgroupInclusion (L := L) Vn)
        (fun sigma z => chosenNormalBasisPrincipalUnitSubgroupInclusion_equivariant
          (K := K) (L := L) k Vn hVn sigma z) bv
    change a = tateNorm (Gal(L / K)) 𝒪[L]ˣ (bv : 𝒪[L]ˣ) *
      (aprimev : 𝒪[L]ˣ)
    rw [← hbnval]
    dsimp [aprimev, av]
    simp
 


theorem exists_chosenNormalBasisPrincipalUnit_hMinusOne_oneStep_lifting
    [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Module.Finite 𝒪[K] 𝒪[L]]
    (g : Gal(L / K)) (hgen : ∀ sigma : Gal(L / K),
      sigma ∈ Subgroup.zpowers g) :
    letI := galoisGroupIntegerUnitsMulDistribMulActionOfIsIntegralClosure K L
    ∃ c : Nat, ∀ k : Nat, c ≤ k → ∀ a : 𝒪[L]ˣ,
      a ∈ chosenNormalBasisPrincipalUnitSet K L k →
      tateNorm (Gal(L / K)) 𝒪[L]ˣ a = 1 →
      ∃ b a' : 𝒪[L]ˣ,
        b ∈ chosenNormalBasisPrincipalUnitSet K L k ∧
        a' ∈ chosenNormalBasisPrincipalUnitSet K L (k + 1) ∧
        tateNorm (Gal(L / K)) 𝒪[L]ˣ a' = 1 ∧
        a = sigmaMinusOne (Gal(L / K)) 𝒪[L]ˣ g b * a' := by
  let := galoisGroupIntegerUnitsMulDistribMulActionOfIsIntegralClosure K L
  rcases exists_chosenNormalBasisPrincipalUnitSuccQuotMulEquivLatticeSuccQuot
      (K := K) (L := L) with ⟨c, hc⟩
  refine ⟨c, ?_⟩
  intro k hck a ha hnorm
  rcases hc k hck with
    ⟨Vn, Vsucc, hV, hVn, hVsucc, Phi, _hVnle, hPhi⟩
  let := chosenNormalBasisPrincipalUnitSubgroupMulDistribMulAction
    K L k Vn hVn
  let := chosenNormalBasisPrincipalUnitSuccQuotMulDistribMulAction
    K L k hV hVn hVsucc
  let := galoisGroupChosenNormalBasisLatticeSuccQuotDistribMulAction K L k
  let := multiplicativeMulDistribMulActionOfDistribMulAction
    (Gal(L / K)) (chosenNormalBasisLatticeSuccQuot K L k)
  let av : Vn := ⟨a, by
    change a ∈ (Vn : Set 𝒪[L]ˣ)
    rw [hVn]
    exact ha⟩
  have hnormv : tateNorm (Gal(L / K)) Vn av = 1 := by
    apply Subtype.ext
    have hmap := map_tateNorm
      (chosenNormalBasisPrincipalUnitSubgroupInclusion (L := L) Vn)
      (fun sigma z => chosenNormalBasisPrincipalUnitSubgroupInclusion_equivariant
        (K := K) (L := L) k Vn hVn sigma z) av
    change ((chosenNormalBasisPrincipalUnitSubgroupInclusion (L := L) Vn)
      (tateNorm (Gal(L / K)) Vn av) : 𝒪[L]ˣ) =
        tateNorm (Gal(L / K)) 𝒪[L]ˣ a at hmap
    rw [hnorm] at hmap
    exact hmap
  let q : Multiplicative (chosenNormalBasisLatticeSuccQuot K L k) :=
    Phi (chosenNormalBasisPrincipalUnitSuccQuotMk (L := L) hV av)
  have hqnorm : tateNorm (Gal(L / K))
      (Multiplicative (chosenNormalBasisLatticeSuccQuot K L k)) q = 1 := by
    dsimp [q]
    calc
      tateNorm (Gal(L / K))
          (Multiplicative (chosenNormalBasisLatticeSuccQuot K L k))
          (Phi (chosenNormalBasisPrincipalUnitSuccQuotMk (L := L) hV av)) =
          Phi (tateNorm (Gal(L / K))
            (chosenNormalBasisPrincipalUnitSuccQuot (L := L) hV)
            (chosenNormalBasisPrincipalUnitSuccQuotMk (L := L) hV av)) :=
        (map_tateNorm Phi.toMonoidHom
          (fun sigma z => chosenNormalBasisPrincipalUnitSuccQuotMulEquiv_galoisGroup
            (K := K) (L := L) k hV hVn hVsucc Phi hPhi sigma z) _).symm
      _ = Phi (chosenNormalBasisPrincipalUnitSuccQuotMk (L := L) hV
          (tateNorm (Gal(L / K)) Vn av)) := by
        congr 1
        exact (map_tateNorm
          (chosenNormalBasisPrincipalUnitSuccQuotMk (L := L) hV)
          (fun sigma z =>
            (chosenNormalBasisPrincipalUnitSuccQuotMulDistribMulAction_smul_mk
              (K := K) (L := L) k hV hVn hVsucc sigma z).symm) av).symm
      _ = 1 := by rw [hnormv]; simp
  let qker : normKernelSubgroup (Gal(L / K))
      (Multiplicative (chosenNormalBasisLatticeSuccQuot K L k)) :=
    ⟨q, hqnorm⟩
  have hHm := chosenNormalBasisLatticeSuccQuot_herbrandHMinusOne_subsingleton
    K L k g hgen
  have hqone :
      QuotientGroup.mk'
          ((augmentationSubgroup (Gal(L / K))
            (Multiplicative (chosenNormalBasisLatticeSuccQuot K L k)) g).subgroupOf
              (normKernelSubgroup (Gal(L / K))
                (Multiplicative (chosenNormalBasisLatticeSuccQuot K L k))))
          qker = 1 :=
    @Subsingleton.elim _ hHm _ _
  have hqmem : q ∈ augmentationSubgroup (Gal(L / K))
      (Multiplicative (chosenNormalBasisLatticeSuccQuot K L k)) g := by
    have hm := (QuotientGroup.eq_one_iff _).1 hqone
    exact hm
  rcases hqmem with ⟨y, hy⟩
  rcases Phi.surjective y with ⟨qb, hqb⟩
  rcases chosenNormalBasisPrincipalUnitSuccQuotMk_surjective
      (L := L) hV qb with
    ⟨bv, hbvmk⟩
  change chosenNormalBasisPrincipalUnitSuccQuotMk (L := L) hV bv = qb at hbvmk
  have hPhiCoboundary :
      Phi (sigmaMinusOne (Gal(L / K))
        (chosenNormalBasisPrincipalUnitSuccQuot (L := L) hV) g
        (chosenNormalBasisPrincipalUnitSuccQuotMk (L := L) hV bv)) = q := by
    calc
      Phi (sigmaMinusOne (Gal(L / K))
          (chosenNormalBasisPrincipalUnitSuccQuot (L := L) hV) g
          (chosenNormalBasisPrincipalUnitSuccQuotMk (L := L) hV bv)) =
          sigmaMinusOne (Gal(L / K))
            (Multiplicative (chosenNormalBasisLatticeSuccQuot K L k)) g
            (Phi (chosenNormalBasisPrincipalUnitSuccQuotMk (L := L) hV bv)) :=
        map_sigmaMinusOne Phi.toMonoidHom
          (fun sigma z => chosenNormalBasisPrincipalUnitSuccQuotMulEquiv_galoisGroup
            (K := K) (L := L) k hV hVn hVsucc Phi hPhi sigma z) g _
      _ = sigmaMinusOne (Gal(L / K))
          (Multiplicative (chosenNormalBasisLatticeSuccQuot K L k)) g y := by
        rw [hbvmk, hqb]
      _ = q := hy
  have hquotCoboundary :
      sigmaMinusOne (Gal(L / K))
          (chosenNormalBasisPrincipalUnitSuccQuot (L := L) hV) g
          (chosenNormalBasisPrincipalUnitSuccQuotMk (L := L) hV bv) =
        chosenNormalBasisPrincipalUnitSuccQuotMk (L := L) hV av := by
    apply Phi.injective
    simpa [q] using hPhiCoboundary
  let cobv : Vn := sigmaMinusOne (Gal(L / K)) Vn g bv
  have hmkcob : chosenNormalBasisPrincipalUnitSuccQuotMk (L := L) hV cobv =
      chosenNormalBasisPrincipalUnitSuccQuotMk (L := L) hV av := by
    calc
      chosenNormalBasisPrincipalUnitSuccQuotMk (L := L) hV cobv =
          sigmaMinusOne (Gal(L / K))
            (chosenNormalBasisPrincipalUnitSuccQuot (L := L) hV) g
            (chosenNormalBasisPrincipalUnitSuccQuotMk (L := L) hV bv) := by
        exact map_sigmaMinusOne
          (chosenNormalBasisPrincipalUnitSuccQuotMk (L := L) hV)
          (fun sigma z =>
            (chosenNormalBasisPrincipalUnitSuccQuotMulDistribMulAction_smul_mk
              (K := K) (L := L) k hV hVn hVsucc sigma z).symm) g bv
      _ = chosenNormalBasisPrincipalUnitSuccQuotMk (L := L) hV av := hquotCoboundary
  let aprimev : Vn := av / cobv
  have haprimeSucc : (aprimev : 𝒪[L]ˣ) ∈ Vsucc := by
    apply (chosenNormalBasisPrincipalUnitSuccQuotMk_eq_one_iff
      (L := L) hV aprimev).1
    dsimp [aprimev]
    rw [map_div, hmkcob]
    simp
  have haprimeNormV : tateNorm (Gal(L / K)) Vn aprimev = 1 := by
    dsimp [aprimev, cobv]
    rw [div_eq_mul_inv, tateNorm_mul, tateNorm_inv, hnormv,
      tateNorm_sigmaMinusOne_eq_one]
    simp
  have haprimeNorm : tateNorm (Gal(L / K)) 𝒪[L]ˣ
      (aprimev : 𝒪[L]ˣ) = 1 := by
    have hmap := map_tateNorm
      (chosenNormalBasisPrincipalUnitSubgroupInclusion (L := L) Vn)
      (fun sigma z => chosenNormalBasisPrincipalUnitSubgroupInclusion_equivariant
        (K := K) (L := L) k Vn hVn sigma z) aprimev
    have hleft :
        chosenNormalBasisPrincipalUnitSubgroupInclusion (L := L) Vn
          (tateNorm (Gal(L / K)) Vn aprimev) = 1 :=
      (congrArg
        (chosenNormalBasisPrincipalUnitSubgroupInclusion (L := L) Vn)
        haprimeNormV).trans
          (chosenNormalBasisPrincipalUnitSubgroupInclusion (L := L) Vn).map_one
    exact (congrArg (tateNorm (Gal(L / K)) 𝒪[L]ˣ)
      (chosenNormalBasisPrincipalUnitSubgroupInclusion_apply
        (L := L) Vn aprimev)).symm.trans (hmap.symm.trans hleft)
  refine ⟨(bv : 𝒪[L]ˣ), (aprimev : 𝒪[L]ˣ), ?_, ?_, haprimeNorm, ?_⟩
  · exact hVn ▸ bv.2
  · exact hVsucc ▸ haprimeSucc
  · have hcobval : (cobv : 𝒪[L]ˣ) =
        sigmaMinusOne (Gal(L / K)) 𝒪[L]ˣ g (bv : 𝒪[L]ˣ) := by
      exact map_sigmaMinusOne
        (chosenNormalBasisPrincipalUnitSubgroupInclusion (L := L) Vn)
        (fun sigma z => chosenNormalBasisPrincipalUnitSubgroupInclusion_equivariant
          (K := K) (L := L) k Vn hVn sigma z) g bv
    change a = sigmaMinusOne (Gal(L / K)) 𝒪[L]ˣ g (bv : 𝒪[L]ˣ) *
      (aprimev : 𝒪[L]ˣ)
    rw [← hcobval]
    dsimp [aprimev, av]
    simp
end
end LocalClassFieldTheory
end

/- ClassFieldTheory.LocalClassFieldTheory.ClassFormation.NormalBasisRecursiveLifting -/
section
namespace LocalClassFieldTheory
open CyclicCohomology
open LocalFieldTheory
noncomputable section
universe u
open scoped ValuativeRel
open Filter IsNonarchimedeanLocalField
open CyclicCohomology.ProfiniteCohomology.Herbrand
variable (K L : Type u) [Field K] [Field L] [Algebra K L]
  [FiniteDimensional K L] [IsGalois K L]
  [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
  [ValuativeRel L] [UniformSpace L] [IsUniformAddGroup L]
  [IsNonarchimedeanLocalField L]
  [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
  [IsIntegralClosure 𝒪[L] 𝒪[K] L] [Module.Finite 𝒪[K] 𝒪[L]]
omit [UniformSpace L] [IsUniformAddGroup L] [IsNonarchimedeanLocalField L] in
private theorem filteredCorrectionProduct_eq_chosenNormalBasisProduct
    (z : Nat → 𝒪[L]ˣ) (d : Nat) :
    filteredCorrectionProduct z d =
      chosenNormalBasisPrincipalUnitCorrectionProduct (L := L) z d := by
  induction d with
  | zero => rfl
  | succ d ih =>
      rw [filteredCorrectionProduct_succ,
        chosenNormalBasisPrincipalUnitCorrectionProduct_succ, ih]
 


theorem exists_chosenNormalBasisPrincipalUnit_fixed_is_tateNorm :
    letI := galoisGroupIntegerUnitsMulDistribMulActionOfIsIntegralClosure K L
    ∃ c : Nat, ∀ n : Nat, c ≤ n → ∀ a : 𝒪[L]ˣ,
      a ∈ chosenNormalBasisPrincipalUnitSet K L n →
      (∀ sigma : Gal(L / K), sigma • a = a) →
      ∃ b : 𝒪[L]ˣ, b ∈ chosenNormalBasisPrincipalUnitSet K L n ∧
        a = tateNorm (Gal(L / K)) 𝒪[L]ˣ b := by
  let := galoisGroupIntegerUnitsMulDistribMulActionOfIsIntegralClosure K L
  rcases exists_chosenNormalBasisPrincipalUnit_h0_oneStep_lifting
      (K := K) (L := L) with ⟨cStep, hStep⟩
  rcases exists_tendsto_chosenNormalBasisPrincipalUnitCorrectionProduct
      (K := K) (L := L) with ⟨cProd, hProd⟩
  rcases exists_chosenBaseUniformizerPow_chosenNormalBasisIntegerLattice_le_integerRingFieldSubmodule
      (K := K) (L := L) with ⟨b, hb⟩
  refine ⟨max cStep (max cProd (b + 1)), ?_⟩
  intro n hn a ha hfixed
  have hcStep : cStep ≤ n :=
    le_trans (le_max_left cStep (max cProd (b + 1))) hn
  have hrest : max cProd (b + 1) ≤ max cStep (max cProd (b + 1)) :=
    le_max_right cStep (max cProd (b + 1))
  have hcProd : cProd ≤ n :=
    le_trans (le_trans (le_max_left cProd (b + 1)) hrest) hn
  have hbn : b + 1 ≤ n :=
    le_trans (le_trans (le_max_right cProd (b + 1)) hrest) hn
  let P : Nat → 𝒪[L]ˣ → Prop := fun k x =>
    x ∈ chosenNormalBasisPrincipalUnitSet K L k
  let R : 𝒪[L]ˣ → Prop := fun x =>
    ∀ sigma : Gal(L / K), sigma • x = x
  let F : 𝒪[L]ˣ →* 𝒪[L]ˣ :=
    tateNormHom (G := Gal(L / K)) (A := 𝒪[L]ˣ)
  let initial : FilteredLiftState 𝒪[L]ˣ P R n 0 :=
    ⟨a, by simpa [P] using ha, hfixed⟩
  let step : ∀ i (s : FilteredLiftState 𝒪[L]ˣ P R n i),
      Nonempty (FilteredLiftStep 𝒪[L]ˣ P R F n i s) := by
    intro i s
    have hlevel : cStep ≤ n + i :=
      le_trans hcStep (Nat.le_add_right n i)
    rcases hStep (n + i) hlevel s.value (by simpa [P] using s.mem)
        (by simpa [R] using s.stable) with
      ⟨z, a', hz, ha', hfixed', heq⟩
    refine ⟨⟨z, ?_, ⟨a', ?_, ?_⟩, ?_⟩⟩
    · simpa [P] using hz
    · simpa [P, Nat.add_assoc] using ha'
    · simpa [R] using hfixed'
    · simpa [F] using heq
  let states : (i : Nat) → FilteredLiftState 𝒪[L]ˣ P R n i :=
    chosenFilteredLiftStateSequence 𝒪[L]ˣ P R F n initial step
  let z : Nat → 𝒪[L]ˣ :=
    chosenFilteredLiftCorrectionSequence 𝒪[L]ˣ P R F n initial step
  have hz (i : Nat) : z i ∈ chosenNormalBasisPrincipalUnitSet K L (n + i) := by
    exact chosenFilteredLiftCorrectionSequence_mem
      𝒪[L]ˣ P R F n initial step i
  rcases hProd n hcProd z hz with ⟨x, hx, hxmem⟩
  have hstates (i : Nat) :
      (states i).value ∈ chosenNormalBasisPrincipalUnitSet K L (n + i) := by
    exact (states i).mem
  have hrem : Tendsto
      (fun i : Nat => (((states i).value : 𝒪[L]ˣ) : 𝒪[L])) atTop
      (nhds (1 : 𝒪[L])) :=
    tendsto_chosenNormalBasisPrincipalUnitSequence_one_of_lattice_bound
      (K := K) (L := L) hb hbn (fun i => (states i).value) hstates
  have hnorm := tendsto_galoisGroupIntegerUnits_tateNorm_of_tendsto
    (K := K) (L := L)
    (fun d => chosenNormalBasisPrincipalUnitCorrectionProduct (L := L) z d) x hx
  have hrec (d : Nat) :
      a = tateNorm (Gal(L / K)) 𝒪[L]ˣ
          (chosenNormalBasisPrincipalUnitCorrectionProduct (L := L) z d) *
        (states d).value := by
    have h := filteredLift_initial_eq_correctionProduct_mul_state
      𝒪[L]ˣ P R F n initial step d
    rw [filteredCorrectionProduct_eq_chosenNormalBasisProduct
      (L := L) z d] at h
    simpa [initial, states, F] using h
  have hmul : Tendsto
      (fun d : Nat =>
        ((tateNorm (Gal(L / K)) 𝒪[L]ˣ
            (chosenNormalBasisPrincipalUnitCorrectionProduct (L := L) z d) :
          𝒪[L]ˣ) : 𝒪[L]) * (((states d).value : 𝒪[L]ˣ) : 𝒪[L]))
      atTop
      (nhds (((tateNorm (Gal(L / K)) 𝒪[L]ˣ x : 𝒪[L]ˣ) : 𝒪[L]) * 1)) :=
    hnorm.mul hrem
  have hconst : Tendsto (fun _d : Nat => ((a : 𝒪[L]ˣ) : 𝒪[L])) atTop
      (nhds ((a : 𝒪[L]ˣ) : 𝒪[L])) := tendsto_const_nhds
  have heqO : ((a : 𝒪[L]ˣ) : 𝒪[L]) =
      ((tateNorm (Gal(L / K)) 𝒪[L]ˣ x : 𝒪[L]ˣ) : 𝒪[L]) * 1 := by
    apply tendsto_nhds_unique hconst
    exact hmul.congr' (Eventually.of_forall (fun d => by
      simpa using congrArg (fun q : 𝒪[L]ˣ => (q : 𝒪[L])) (hrec d).symm))
  refine ⟨x, hxmem, ?_⟩
  apply Units.ext
  simpa using heqO
 


theorem exists_chosenNormalBasisPrincipalUnit_normOne_is_sigmaMinusOne
    (g : Gal(L / K)) (hgen : ∀ sigma : Gal(L / K),
      sigma ∈ Subgroup.zpowers g) :
    letI := galoisGroupIntegerUnitsMulDistribMulActionOfIsIntegralClosure K L
    ∃ c : Nat, ∀ n : Nat, c ≤ n → ∀ a : 𝒪[L]ˣ,
      a ∈ chosenNormalBasisPrincipalUnitSet K L n →
      tateNorm (Gal(L / K)) 𝒪[L]ˣ a = 1 →
      ∃ b : 𝒪[L]ˣ, b ∈ chosenNormalBasisPrincipalUnitSet K L n ∧
        a = sigmaMinusOne (Gal(L / K)) 𝒪[L]ˣ g b := by
  let := galoisGroupIntegerUnitsMulDistribMulActionOfIsIntegralClosure K L
  rcases exists_chosenNormalBasisPrincipalUnit_hMinusOne_oneStep_lifting
      (K := K) (L := L) g hgen with ⟨cStep, hStep⟩
  rcases exists_tendsto_chosenNormalBasisPrincipalUnitCorrectionProduct
      (K := K) (L := L) with ⟨cProd, hProd⟩
  rcases exists_chosenBaseUniformizerPow_chosenNormalBasisIntegerLattice_le_integerRingFieldSubmodule
      (K := K) (L := L) with ⟨b, hb⟩
  refine ⟨max cStep (max cProd (b + 1)), ?_⟩
  intro n hn a ha hnorma
  have hcStep : cStep ≤ n :=
    le_trans (le_max_left cStep (max cProd (b + 1))) hn
  have hrest : max cProd (b + 1) ≤ max cStep (max cProd (b + 1)) :=
    le_max_right cStep (max cProd (b + 1))
  have hcProd : cProd ≤ n :=
    le_trans (le_trans (le_max_left cProd (b + 1)) hrest) hn
  have hbn : b + 1 ≤ n :=
    le_trans (le_trans (le_max_right cProd (b + 1)) hrest) hn
  let P : Nat → 𝒪[L]ˣ → Prop := fun k x =>
    x ∈ chosenNormalBasisPrincipalUnitSet K L k
  let R : 𝒪[L]ˣ → Prop := fun x =>
    tateNorm (Gal(L / K)) 𝒪[L]ˣ x = 1
  let F : 𝒪[L]ˣ →* 𝒪[L]ˣ :=
    sigmaMinusOneHom (G := Gal(L / K)) (A := 𝒪[L]ˣ) g
  let initial : FilteredLiftState 𝒪[L]ˣ P R n 0 :=
    ⟨a, by simpa [P] using ha, hnorma⟩
  let step : ∀ i (s : FilteredLiftState 𝒪[L]ˣ P R n i),
      Nonempty (FilteredLiftStep 𝒪[L]ˣ P R F n i s) := by
    intro i s
    have hlevel : cStep ≤ n + i :=
      le_trans hcStep (Nat.le_add_right n i)
    rcases hStep (n + i) hlevel s.value (by simpa [P] using s.mem)
        (by simpa [R] using s.stable) with
      ⟨z, a', hz, ha', hnorm', heq⟩
    refine ⟨⟨z, ?_, ⟨a', ?_, ?_⟩, ?_⟩⟩
    · simpa [P] using hz
    · simpa [P, Nat.add_assoc] using ha'
    · simpa [R] using hnorm'
    · simpa [F] using heq
  let states : (i : Nat) → FilteredLiftState 𝒪[L]ˣ P R n i :=
    chosenFilteredLiftStateSequence 𝒪[L]ˣ P R F n initial step
  let z : Nat → 𝒪[L]ˣ :=
    chosenFilteredLiftCorrectionSequence 𝒪[L]ˣ P R F n initial step
  have hz (i : Nat) : z i ∈ chosenNormalBasisPrincipalUnitSet K L (n + i) := by
    exact chosenFilteredLiftCorrectionSequence_mem
      𝒪[L]ˣ P R F n initial step i
  rcases hProd n hcProd z hz with ⟨x, hx, hxmem⟩
  have hstates (i : Nat) :
      (states i).value ∈ chosenNormalBasisPrincipalUnitSet K L (n + i) :=
    (states i).mem
  have hrem : Tendsto
      (fun i : Nat => (((states i).value : 𝒪[L]ˣ) : 𝒪[L])) atTop
      (nhds (1 : 𝒪[L])) :=
    tendsto_chosenNormalBasisPrincipalUnitSequence_one_of_lattice_bound
      (K := K) (L := L) hb hbn (fun i => (states i).value) hstates
  have hcob := tendsto_galoisGroupIntegerUnits_sigmaMinusOne_of_tendsto
    (K := K) (L := L) g
    (fun d => chosenNormalBasisPrincipalUnitCorrectionProduct (L := L) z d) x hx
  have hrec (d : Nat) :
      a = sigmaMinusOne (Gal(L / K)) 𝒪[L]ˣ g
          (chosenNormalBasisPrincipalUnitCorrectionProduct (L := L) z d) *
        (states d).value := by
    have h := filteredLift_initial_eq_correctionProduct_mul_state
      𝒪[L]ˣ P R F n initial step d
    rw [filteredCorrectionProduct_eq_chosenNormalBasisProduct
      (L := L) z d] at h
    simpa [initial, states, F] using h
  have hmul : Tendsto
      (fun d : Nat =>
        ((sigmaMinusOne (Gal(L / K)) 𝒪[L]ˣ g
            (chosenNormalBasisPrincipalUnitCorrectionProduct (L := L) z d) :
          𝒪[L]ˣ) : 𝒪[L]) * (((states d).value : 𝒪[L]ˣ) : 𝒪[L]))
      atTop
      (nhds (((sigmaMinusOne (Gal(L / K)) 𝒪[L]ˣ g x : 𝒪[L]ˣ) : 𝒪[L]) * 1)) :=
    hcob.mul hrem
  have hconst : Tendsto (fun _d : Nat => ((a : 𝒪[L]ˣ) : 𝒪[L])) atTop
      (nhds ((a : 𝒪[L]ˣ) : 𝒪[L])) := tendsto_const_nhds
  have heqO : ((a : 𝒪[L]ˣ) : 𝒪[L]) =
      ((sigmaMinusOne (Gal(L / K)) 𝒪[L]ˣ g x : 𝒪[L]ˣ) : 𝒪[L]) * 1 := by
    apply tendsto_nhds_unique hconst
    exact hmul.congr' (Eventually.of_forall (fun d => by
      simpa using congrArg (fun q : 𝒪[L]ˣ => (q : 𝒪[L])) (hrec d).symm))
  refine ⟨x, hxmem, ?_⟩
  apply Units.ext
  simpa using heqO
end
end LocalClassFieldTheory
end

/- ClassFieldTheory.LocalClassFieldTheory.ClassFormation.NormalBasisCohomology -/
section
namespace LocalClassFieldTheory
open CyclicCohomology
open LocalFieldTheory
noncomputable section
universe u
open scoped ValuativeRel
open IsNonarchimedeanLocalField
open CyclicCohomology.ProfiniteCohomology.Herbrand
variable (K L : Type u) [Field K] [Field L] [Algebra K L]
  [FiniteDimensional K L] [IsGalois K L]
  [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
  [ValuativeRel L] [UniformSpace L] [IsUniformAddGroup L]
  [IsNonarchimedeanLocalField L]
  [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
  [IsIntegralClosure 𝒪[L] 𝒪[K] L] [Module.Finite 𝒪[K] 𝒪[L]]
 

theorem exists_chosenNormalBasisPrincipalUnit_herbrand_subsingleton
    (g : Gal(L / K))
    (hgen : ∀ sigma : Gal(L / K), sigma ∈ Subgroup.zpowers g) :
    ∃ c : Nat, ∀ n : Nat, c ≤ n →
      ∀ (V : Subgroup 𝒪[L]ˣ)
        (hV : (V : Set 𝒪[L]ˣ) = chosenNormalBasisPrincipalUnitSet K L n),
        letI := chosenNormalBasisPrincipalUnitSubgroupMulDistribMulAction
          K L n V hV
        Subsingleton (HerbrandH0 (Gal(L / K)) V) ∧
          Subsingleton (HerbrandHMinusOne (Gal(L / K)) V g) := by
  rcases exists_chosenNormalBasisPrincipalUnit_fixed_is_tateNorm
      (K := K) (L := L) with ⟨c0, hc0⟩
  rcases exists_chosenNormalBasisPrincipalUnit_normOne_is_sigmaMinusOne
      (K := K) (L := L) g hgen with ⟨cm, hcm⟩
  refine ⟨max c0 cm, ?_⟩
  intro n hn V hV
  have hc0n : c0 ≤ n := le_trans (le_max_left c0 cm) hn
  have hcmn : cm ≤ n := le_trans (le_max_right c0 cm) hn
  let := chosenNormalBasisPrincipalUnitSubgroupMulDistribMulAction
    K L n V hV
  have hfixed : fixedSubgroup (Gal(L / K)) V ≤
      tateNormSubgroup (Gal(L / K)) V := by
    intro a ha
    have haSet : ((a : V) : 𝒪[L]ˣ) ∈ (V : Set 𝒪[L]ˣ) := (a : V).2
    have haLevel : ((a : V) : 𝒪[L]ˣ) ∈
        chosenNormalBasisPrincipalUnitSet K L n := by
      rw [← hV]
      exact haSet
    have haFixed : ∀ sigma : Gal(L / K),
        letI := galoisGroupIntegerUnitsMulDistribMulActionOfIsIntegralClosure K L
        sigma • ((a : V) : 𝒪[L]ˣ) = ((a : V) : 𝒪[L]ˣ) := by
      intro sigma
      exact congrArg (fun z : V => (z : 𝒪[L]ˣ)) (ha sigma)
    rcases hc0 n hc0n ((a : V) : 𝒪[L]ˣ) haLevel haFixed with
      ⟨b, hb, hab⟩
    let bv : V := ⟨b, by
      change b ∈ (V : Set 𝒪[L]ˣ)
      rw [hV]
      exact hb⟩
    refine ⟨bv, ?_⟩
    apply Subtype.ext
    rw [tateNormHom_apply,
      chosenNormalBasisPrincipalUnitSubgroup_tateNorm_coe K L n V hV]
    exact hab.symm
  have hkernel : normKernelSubgroup (Gal(L / K)) V ≤
      augmentationSubgroup (Gal(L / K)) V g := by
    intro a ha
    have haLevel : ((a : V) : 𝒪[L]ˣ) ∈
        chosenNormalBasisPrincipalUnitSet K L n := by
      rw [← hV]
      exact (a : V).2
    have haNorm :
        letI := galoisGroupIntegerUnitsMulDistribMulActionOfIsIntegralClosure K L
        tateNorm (Gal(L / K)) 𝒪[L]ˣ ((a : V) : 𝒪[L]ˣ) = 1 := by
      rw [← chosenNormalBasisPrincipalUnitSubgroup_tateNorm_coe K L n V hV]
      exact congrArg (fun z : V => (z : 𝒪[L]ˣ)) ha
    rcases hcm n hcmn ((a : V) : 𝒪[L]ˣ) haLevel haNorm with
      ⟨b, hb, hab⟩
    let bv : V := ⟨b, by
      change b ∈ (V : Set 𝒪[L]ˣ)
      rw [hV]
      exact hb⟩
    refine ⟨bv, ?_⟩
    apply Subtype.ext
    rw [sigmaMinusOneHom_apply,
      chosenNormalBasisPrincipalUnitSubgroup_sigmaMinusOne_coe K L n V hV]
    exact hab.symm
  exact ⟨
    herbrandH0_subsingleton_of_fixed_le_tateNormSubgroup hfixed,
    herbrandHMinusOne_subsingleton_of_normKernel_le_augmentationSubgroup
      g hkernel⟩
end
end LocalClassFieldTheory
end

/- ClassFieldTheory.LocalClassFieldTheory.ClassFormation.Main -/
section
namespace LocalClassFieldTheory
open CyclicCohomology
open LocalFieldTheory
noncomputable section
open scoped ValuativeRel
open IsNonarchimedeanLocalField
open CyclicCohomology.ProfiniteCohomology.Herbrand
variable (K L : Type) [Field K] [Field L] [Algebra K L]
  [FiniteDimensional K L] [IsGalois K L]
  [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
  [ValuativeRel L] [UniformSpace L] [IsUniformAddGroup L]
  [IsNonarchimedeanLocalField L]
  [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
  [IsIntegralClosure 𝒪[L] 𝒪[K] L] [Module.Finite 𝒪[K] 𝒪[L]]
 

theorem exists_localIntegerUnitsHerbrandDefinedAndEqOne
    (g : Gal(L / K))
    (hg : ∀ sigma : Gal(L / K), sigma ∈ Subgroup.zpowers g) :
    letI := galoisGroupIntegerUnitsMulDistribMulActionOfIsIntegralClosure K L
    ∃ hU : HerbrandQuotientDefined (Gal(L / K)) 𝒪[L]ˣ g,
      @herbrandQuotient (Gal(L / K)) 𝒪[L]ˣ _ _ _
        (galoisGroupIntegerUnitsMulDistribMulActionOfIsIntegralClosure K L)
        g hU.1 hU.2 = 1 := by
  rcases exists_chosenNormalBasisPrincipalUnitSubgroup
      (K := K) (L := L) with ⟨cV, hcV⟩
  rcases exists_chosenNormalBasisPrincipalUnit_herbrand_subsingleton
      (K := K) (L := L) g hg with ⟨cH, hcH⟩
  rcases exists_integerUnits_herbrandQuotient_eq_one_of_large_chosenNormalBasisLevel
      (K := K) (L := L) with ⟨cU, hcU⟩
  let n : Nat := max cV (max cH cU)
  have hcVn : cV ≤ n := le_max_left cV (max cH cU)
  have hrest : max cH cU ≤ n := le_max_right cV (max cH cU)
  have hcHn : cH ≤ n := le_trans (le_max_left cH cU) hrest
  have hcUn : cU ≤ n := le_trans (le_max_right cH cU) hrest
  rcases hcV n hcVn with ⟨V, hV, _hVprincipal⟩
  let := chosenNormalBasisPrincipalUnitSubgroupMulDistribMulAction
    K L n V hV
  let := galoisGroupIntegerUnitsMulDistribMulActionOfIsIntegralClosure K L
  let := chosenNormalBasisIntegerUnitsQuotMulDistribMulAction K L n V hV
  have hcoh := hcH n hcHn V hV
  rcases hcU n hcUn V hV g hg hcoh.1 hcoh.2 with ⟨hU, hUone⟩
  exact ⟨hU, hUone⟩
 

private theorem localIntegerUnitsHerbrandDefined
    (g : Gal(L / K))
    (hg : ∀ sigma : Gal(L / K), sigma ∈ Subgroup.zpowers g) :
    letI := galoisGroupIntegerUnitsMulDistribMulActionOfIsIntegralClosure K L
    HerbrandQuotientDefined (Gal(L / K)) 𝒪[L]ˣ g :=
  Classical.choose (exists_localIntegerUnitsHerbrandDefinedAndEqOne K L g hg)
private theorem localIntegerUnitsHerbrandQuotient_eq_one
    (g : Gal(L / K))
    (hg : ∀ sigma : Gal(L / K), sigma ∈ Subgroup.zpowers g) :
    letI := galoisGroupIntegerUnitsMulDistribMulActionOfIsIntegralClosure K L
    @herbrandQuotient (Gal(L / K)) 𝒪[L]ˣ _ _ _
      (galoisGroupIntegerUnitsMulDistribMulActionOfIsIntegralClosure K L) g
      (localIntegerUnitsHerbrandDefined K L g hg).1
      (localIntegerUnitsHerbrandDefined K L g hg).2 = 1 :=
  Classical.choose_spec (exists_localIntegerUnitsHerbrandDefinedAndEqOne K L g hg)
 

theorem localFieldUnitsTateH0FiniteOfGenerator
    (g : Gal(L / K))
    (hg : ∀ sigma : Gal(L / K), sigma ∈ Subgroup.zpowers g) :
    Finite (tateCohomology (Rep.ofAlgebraAutOnUnits K L) 0) :=
  unitsTateH0FiniteOfIntegerUnitsHerbrand K L g hg
    (localIntegerUnitsHerbrandDefined K L g hg)
 
theorem localFieldUnits_tate_card_of_generator
    (g : Gal(L / K))
    (hg : ∀ sigma : Gal(L / K), sigma ∈ Subgroup.zpowers g) :
    letI := localFieldUnitsTateH0FiniteOfGenerator K L g hg
    Nat.card (tateCohomology (Rep.ofAlgebraAutOnUnits K L) 0) = Module.finrank K L ∧
      Nat.card (tateCohomology (Rep.ofAlgebraAutOnUnits K L) (-1)) = 1 := by
  exact fieldUnits_tate_card_of_integerUnits_herbrand_eq_one
    K L g hg (localIntegerUnitsHerbrandDefined K L g hg)
      (localIntegerUnitsHerbrandQuotient_eq_one K L g hg)
end
end LocalClassFieldTheory
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
 






def integralClosureValuationSubringOfMemOrInv
    (vK : _root_.Valuation K ΓK)
    (hval :
      ∀ z : L,
        z ∈ (integralClosure vK.valuationSubring L).toSubring ∨
          z⁻¹ ∈ (integralClosure vK.valuationSubring L).toSubring) :
    ValuationSubring L :=
  ValuationSubring.ofSubring
    (integralClosure vK.valuationSubring L).toSubring hval
 

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

/- ClassFieldTheory.LocalClassFieldTheory.Finite.LocalReciprocity.FiniteExtensionClassFieldAxiom -/
section
namespace LocalClassFieldTheory
open LocalFieldTheory
open ValuationTheory
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
 


theorem finiteExtensionUnits_tate_card_of_generator
    (K L : Type) [Field K] [Field L] [Algebra K L]
    [FiniteDimensional K L] [IsGalois K L]
    [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (g : Gal(L / K))
    (hg : ∀ sigma : Gal(L / K), sigma ∈ Subgroup.zpowers g) :
    UnitsTateCardinalityData K L := by
  let : UniformSpace K := IsTopologicalAddGroup.rightUniformSpace K
  let : IsUniformAddGroup K := isUniformAddGroup_of_addCommGroup
  let : (Valued.v : Valuation K (ValuativeRel.ValueGroupWithZero K)).RankOne :=
    { hom' := ValuativeRel.IsRankLeOne.nonempty.some.emb (R := K) |>.comp
        MonoidWithZeroHom.ValueGroup₀.embedding
      strictMono' := ValuativeRel.IsRankLeOne.nonempty.some.strictMono.comp
        MonoidWithZeroHom.ValueGroup₀.embedding_strictMono }
  let : NontriviallyNormedField K :=
    Valued.toNontriviallyNormedField
      (L := K) (Γ₀ := ValuativeRel.ValueGroupWithZero K)

  let : NontriviallyNormedField L :=
    spectralNorm.nontriviallyNormedField K L
  let : NormedSpace K L := spectralNorm.normedSpace K L
  let : CompleteSpace L := spectralNorm.completeSpace K L
  let : LocallyCompactSpace L :=
    LocallyCompactSpace.of_finiteDimensional_of_complete K L
  let : IsUltrametricDist L :=
    ⟨fun x y z => by
      change ‖x - z‖ ≤ max ‖x - y‖ ‖y - z‖
      rw [← sub_add_sub_cancel x y z]
      exact isNonarchimedean_spectralNorm
        (K := K) (L := L) (x - y) (y - z)⟩
  let : Valued L ℝ≥0 := NormedField.toValued
  let vL : Valuation L ℝ≥0 := Valued.v
  let : vL.IsNontrivial :=
    (inferInstance : (NormedField.valuation (K := L)).IsNontrivial)
  let : ValuativeRel L := ValuativeRel.ofValuation vL
  let : vL.Compatible := Valuation.Compatible.ofValuation vL
  let : ValuativeRel.IsNontrivial L :=
    (ValuativeRel.isNontrivial_iff_isNontrivial vL).2 inferInstance
  let : IsValuativeTopology L :=
    isValuativeTopology_of_valued_ofValuation L ℝ≥0
  let : IsNonarchimedeanLocalField L :=
    { toIsValuativeTopology := inferInstance
      toLocallyCompactSpace := inferInstance
      toIsNontrivial := inferInstance }

  let : (ValuativeRel.valuation K).HasExtension
      (ValuativeRel.valuation L) := by
    apply Valuation.HasExtension.ofComapInteger
    ext x
    change ValuativeRel.valuation L (algebraMap K L x) ≤ 1 ↔
      ValuativeRel.valuation K x ≤ 1
    rw [← (ValuativeRel.valuation L).vle_one_iff, vL.vle_one_iff]
    change spectralNorm K L (algebraMap K L x) ≤ 1 ↔
      ValuativeRel.valuation K x ≤ 1
    rw [spectralNorm_extends]
    exact Valued.toNormedField.norm_le_one_iff

  let : Algebra.IsIntegral
      (ValuativeRel.valuation K).valuationSubring
      (ValuativeRel.valuation L).valuationSubring := by
    change Algebra.IsIntegral 𝒪[K] 𝒪[L]
    refine ⟨?_⟩
    intro y
    apply IsIntegral.tower_bot
      (R := 𝒪[K]) (A := 𝒪[L]) (B := L)
      (Subring.subtype_injective (ValuativeRel.valuation L).integer)
    have hyv : vL (y : L) ≤ 1 := by
      apply (vL.vle_one_iff).1
      apply ((ValuativeRel.valuation L).vle_one_iff).2
      exact y.property
    have hynorm : ‖(y : L)‖ ≤ 1 := by
      have hynormNN : ‖(y : L)‖₊ ≤ 1 := by
        simpa [vL, NormedField.valuation_apply] using hyv
      exact_mod_cast hynormNN
    change spectralNorm K L (y : L) ≤ 1 at hynorm
    have hcoeffNorm :
        ∀ n : ℕ, ‖(minpoly K (y : L)).coeff n‖ ≤ 1 :=
      (spectralValue_le_one_iff
        (minpoly.monic (Algebra.IsIntegral.isIntegral (y : L)))).1
        (by simpa [spectralNorm] using hynorm)
    have hcoeff :
        (↑(minpoly K (y : L)).coeffs : Set K) ⊆
          (ValuativeRel.valuation K).integer := by
      intro c hc
      obtain ⟨n, _hn, rfl⟩ := Polynomial.mem_coeffs_iff.mp hc
      exact ((ValuativeRel.valuation K).mem_integer_iff _).2
        (Valued.toNormedField.norm_le_one_iff.mp (hcoeffNorm n))
    let p : Polynomial 𝒪[K] :=
      (minpoly K (y : L)).toSubring
        (ValuativeRel.valuation K).integer hcoeff
    refine ⟨p, ?_, ?_⟩
    · exact (Polynomial.monic_toSubring
        (minpoly K (y : L)) (ValuativeRel.valuation K).integer hcoeff).2
          (minpoly.monic (Algebra.IsIntegral.isIntegral (y : L)))
    · have hmaproot :
          Polynomial.aeval (y : L)
            (p.map (algebraMap 𝒪[K] K)) = 0 := by
        dsimp only [p]
        rw [show algebraMap 𝒪[K] K =
          (ValuativeRel.valuation K).integer.subtype from rfl,
          Polynomial.map_toSubring]
        exact minpoly.aeval K (y : L)
      rwa [Polynomial.aeval_map_algebraMap K (y : L) p] at hmaproot
  let hIntegralClosure : IsIntegralClosure
      (ValuativeRel.valuation L).valuationSubring
      (ValuativeRel.valuation K).valuationSubring L :=
    DiscreteValuationField.Valuation.valuationSubring_isIntegralClosure_of_isIntegral
      (ValuativeRel.valuation K) (ValuativeRel.valuation L)
  let : IsIntegralClosure 𝒪[L] 𝒪[K] L := by
    change IsIntegralClosure
      (ValuativeRel.valuation L).valuationSubring
      (ValuativeRel.valuation K).valuationSubring L
    exact hIntegralClosure
  let : Module.Finite 𝒪[K] 𝒪[L] :=
    integerRing_moduleFinite_of_isIntegralClosure K L

  let : Finite (tateCohomology (Rep.ofAlgebraAutOnUnits K L) 0) :=
    localFieldUnitsTateH0FiniteOfGenerator K L g hg
  have hcard := localFieldUnits_tate_card_of_generator K L g hg
  exact
    { finiteH0 := inferInstance
      cardH0 := hcard.1
      cardHminusOne := hcard.2 }
 


theorem finiteTowerUnits_tate_card_of_generator
    (k K L : Type) [Field k] [Field K] [Field L]
    [Algebra k K] [FiniteDimensional k K]
    [Algebra K L] [FiniteDimensional K L] [IsGalois K L]
    [ValuativeRel k] [TopologicalSpace k] [IsNonarchimedeanLocalField k]
    (g : Gal(L / K))
    (hg : ∀ sigma : Gal(L / K), sigma ∈ Subgroup.zpowers g) :
    UnitsTateCardinalityData K L := by
  let : UniformSpace k := IsTopologicalAddGroup.rightUniformSpace k
  let : IsUniformAddGroup k := isUniformAddGroup_of_addCommGroup
  let : (Valued.v : Valuation k (ValuativeRel.ValueGroupWithZero k)).RankOne :=
    { hom' := ValuativeRel.IsRankLeOne.nonempty.some.emb (R := k) |>.comp
        MonoidWithZeroHom.ValueGroup₀.embedding
      strictMono' := ValuativeRel.IsRankLeOne.nonempty.some.strictMono.comp
        MonoidWithZeroHom.ValueGroup₀.embedding_strictMono }
  let : NontriviallyNormedField k :=
    Valued.toNontriviallyNormedField
      (L := k) (Γ₀ := ValuativeRel.ValueGroupWithZero k)

  let : NontriviallyNormedField K :=
    spectralNorm.nontriviallyNormedField k K
  let : NormedSpace k K := spectralNorm.normedSpace k K
  let : CompleteSpace K := spectralNorm.completeSpace k K
  let : LocallyCompactSpace K :=
    LocallyCompactSpace.of_finiteDimensional_of_complete k K
  let : IsUltrametricDist K :=
    ⟨fun x y z => by
      change ‖x - z‖ ≤ max ‖x - y‖ ‖y - z‖
      rw [← sub_add_sub_cancel x y z]
      exact isNonarchimedean_spectralNorm
        (K := k) (L := K) (x - y) (y - z)⟩
  let : Valued K ℝ≥0 := NormedField.toValued
  let vK : Valuation K ℝ≥0 := Valued.v
  let : vK.IsNontrivial :=
    (inferInstance : (NormedField.valuation (K := K)).IsNontrivial)
  let : ValuativeRel K := ValuativeRel.ofValuation vK
  let : vK.Compatible := Valuation.Compatible.ofValuation vK
  let : ValuativeRel.IsNontrivial K :=
    (ValuativeRel.isNontrivial_iff_isNontrivial vK).2 inferInstance
  let : IsValuativeTopology K :=
    isValuativeTopology_of_valued_ofValuation K ℝ≥0
  let : IsNonarchimedeanLocalField K :=
    { toIsValuativeTopology := inferInstance
      toLocallyCompactSpace := inferInstance
      toIsNontrivial := inferInstance }

  exact finiteExtensionUnits_tate_card_of_generator K L g hg
end
end LocalClassFieldTheory
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

/- TunnellLocalCyclicNormIndex -/
section
namespace TunnellLocalCyclicNormIndex
open NumberField IsDedekindDomain LocalClassFieldTheory CyclicCohomology LocalFieldTheory
open scoped Classical NumberField
noncomputable section
def CyclicIndex (K:Type) [Field K] :Prop :=
  ∀(L:Type)[Field L][Algebra K L][FiniteDimensional K L](Y:Type)[Field Y][Algebra L Y]
   [FiniteDimensional L Y][IsGalois L Y][IsCyclic Gal(Y/L)],
    Nat.card (Lˣ ⧸ (Units.map (Algebra.norm L (S:=Y))).range)=Module.finrank L Y
theorem result (K:Type) [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K] : CyclicIndex K := by
  intro L _ _ _ Y _ _ _ _ _
  obtain ⟨g,hg⟩:=IsCyclic.exists_generator (α:=Gal(Y/L))
  have h:=finiteTowerUnits_tate_card_of_generator K L Y g hg
  let e:=H0TateUnitsIsoNormQuotient L Y
  exact (Nat.card_congr e.toLinearEquiv.toEquiv.symm).trans h.cardH0
end
end TunnellLocalCyclicNormIndex
end

theorem OMA.solution : OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H1_R1.H1 := TunnellLocalCyclicNormIndex.result
