import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H1_R1_H2_R1_H2_R1
import Mathlib

/-! Equivariant field realization of the abstract reciprocity symbol. The fixed-unit equivalence and closed fixing subgroup are adapted from ClassFieldTheory, revision 2e6280f9d2579705a0cc6c76ec68c2b60f9c601a, https://github.com/n-yamaguchi-0729/ClassFieldTheory. -/
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
open scoped Classical
namespace TunnellAbstractNormCoordinates
noncomputable section
variable {G : Type} [Group G] [TopologicalSpace G]
abbrev U (H : ClosedSubgroup G) := H.toSubgroup
abbrev M (H J : ClosedSubgroup G) := (U J).subgroupOf (U H)
abbrev B (A : Rep ℤ G) (H : ClosedSubgroup G) :=
  letI : Module ℤ A.V := A.hV2
  (Representation.invariants (A.ρ.comp (U H).subtype)).toAddSubgroup
abbrev N (A : Rep ℤ G) (H J : ClosedSubgroup G) (a : A.V) :=
  ∃ b : B A J, ∑ᶠ q : U H ⧸ M H J, A.ρ q.out.val b.val = a


end
end TunnellAbstractNormCoordinates

namespace RamificationTheory
noncomputable abbrev closedFixingSubgroup
    (k Ω : Type*) [Field k] [Field Ω] [Algebra k Ω] [IsGalois k Ω]
    (K : IntermediateField k Ω) : ClosedSubgroup Gal(Ω/k) :=
  ⟨K.fixingSubgroup, InfiniteGalois.fixingSubgroup_isClosed K⟩
end RamificationTheory

namespace LocalClassFieldTheory
open RamificationTheory
noncomputable section

variable (K Ω : Type) [Field K] [Field Ω] [Algebra K Ω]

/-- The actual Galois representation on `Ωˣ`, written additively for the
group-cohomology API. -/
abbrev galoisAmbientUnitsRep : Rep ℤ (Gal(Ω / K)) :=
  Rep.ofAlgebraAutOnUnits K Ω

/-- Inclusion of the units of an intermediate field into the units of the
chosen Galois ambient field, in additive notation. -/
def intermediateFieldUnitsToGaloisAmbient
    (E : IntermediateField K Ω) :
    Additive Eˣ →+ Additive Ωˣ :=
  MonoidHom.toAdditive (Units.map E.val.toRingHom)

/-- States the theorem `intermediateFieldUnitsToGaloisAmbient_apply`. -/
@[simp]
theorem intermediateFieldUnitsToGaloisAmbient_apply
    (E : IntermediateField K Ω) (x : Eˣ) :
    intermediateFieldUnitsToGaloisAmbient K Ω E (Additive.ofMul x) =
      Additive.ofMul (Units.map E.val.toRingHom x) :=
  rfl

variable [IsGalois K Ω]

/-- An ambient unit is fixed by `Gal(Ω/E)` exactly when its underlying
field element belongs to `E`. -/
theorem mem_galoisAmbientUnits_fixed_iff
    (E : IntermediateField K Ω)
    (x : Additive Ωˣ) :
    x ∈ TunnellAbstractNormCoordinates.B (galoisAmbientUnitsRep K Ω)
        (closedFixingSubgroup K Ω E) ↔
      ((Additive.toMul x : Ωˣ) : Ω) ∈ E := by
  change
    (show galoisAmbientUnitsRep K Ω from x) ∈
        TunnellAbstractNormCoordinates.B (galoisAmbientUnitsRep K Ω)
          (closedFixingSubgroup K Ω E) ↔
      ((Additive.toMul x : Ωˣ) : Ω) ∈ E
  change (∀ g : (closedFixingSubgroup K Ω E).toSubgroup, (Rep.ofAlgebraAutOnUnits K Ω).ρ g.val x = x) ↔ _
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

/-- The image of `Eˣ` in `Ωˣ` is precisely the abstract fixed
subgroup `A_E` used in the abstract class-formation framework. -/
theorem intermediateFieldUnitsToGaloisAmbient_range
    (E : IntermediateField K Ω) :
    (intermediateFieldUnitsToGaloisAmbient K Ω E).range =
      TunnellAbstractNormCoordinates.B (galoisAmbientUnitsRep K Ω)
        (closedFixingSubgroup K Ω E) := by
  apply AddSubgroup.ext
  intro x
  constructor
  · rintro ⟨y, rfl⟩
    change
      (show galoisAmbientUnitsRep K Ω from
        intermediateFieldUnitsToGaloisAmbient K Ω E y) ∈
        TunnellAbstractNormCoordinates.B (galoisAmbientUnitsRep K Ω)
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

/-- Canonical additive equivalence `Eˣ ≃ A_E` for the actual ambient-unit
representation. -/
def intermediateFieldUnitsEquivGaloisFixed
    (E : IntermediateField K Ω) :
    Additive Eˣ ≃+ TunnellAbstractNormCoordinates.B (galoisAmbientUnitsRep K Ω)
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

/-- States the theorem `intermediateFieldUnitsEquivGaloisFixed_coe`. -/
@[simp]
theorem intermediateFieldUnitsEquivGaloisFixed_coe
    (E : IntermediateField K Ω) (x : Additive Eˣ) :
    (intermediateFieldUnitsEquivGaloisFixed K Ω E x).1 =
        intermediateFieldUnitsToGaloisAmbient K Ω E x :=
  rfl

/-- For an embedded extension `i : L → Ω`, the coefficient group fixed by
`Gal(Ω/i(L))` is canonically the actual unit group `Lˣ`.  This is the form
needed when an abstract finite extension is realized inside a separable
closure. -/
def embeddedFieldUnitsEquivGaloisFixed
    (L : Type) [Field L] [Algebra K L]
    (i : L →ₐ[K] Ω) :
    Additive Lˣ ≃+ TunnellAbstractNormCoordinates.B (galoisAmbientUnitsRep K Ω)
      (closedFixingSubgroup K Ω (AlgHom.fieldRange i)) :=
  (MulEquiv.toAdditive
    (Units.mapEquiv (AlgEquiv.ofInjectiveField i).toMulEquiv)).trans
      (intermediateFieldUnitsEquivGaloisFixed K Ω (AlgHom.fieldRange i))

/-- States the theorem `embeddedFieldUnitsEquivGaloisFixed_coe`. -/
@[simp]
theorem embeddedFieldUnitsEquivGaloisFixed_coe
    (L : Type) [Field L] [Algebra K L]
    (i : L →ₐ[K] Ω) (x : Lˣ) :
    (embeddedFieldUnitsEquivGaloisFixed K Ω L i (Additive.ofMul x)).1 =
      Additive.ofMul (Units.map i.toRingHom.toMonoidHom x) :=
  rfl

end
end LocalClassFieldTheory


namespace TunnellRelativeUnitAction
open RamificationTheory LocalClassFieldTheory
open scoped Classical IsMulCommutative
noncomputable section
variable (k L Y Ω : Type) [Field k] [Field L] [Field Y] [Field Ω]
  [Algebra k L] [Algebra L Y] [Algebra k Y] [IsScalarTower k L Y]
  [Algebra k Ω] [Algebra L Ω] [Algebra Y Ω] [IsScalarTower k L Ω]
  [IsScalarTower k Y Ω] [IsScalarTower L Y Ω] [IsGalois k Ω]

abbrev fix (k L Ω : Type) [Field k] [Field L] [Field Ω] [Algebra k L] [Algebra k Ω]
    [Algebra L Ω] [IsScalarTower k L Ω] [IsGalois k Ω] :=
  closedFixingSubgroup k Ω (IsScalarTower.toAlgHom k L Ω).fieldRange

theorem fix_iff (g : Gal(Ω/k)) : g ∈ fix k L Ω ↔ ∀ t : L, g (algebraMap L Ω t) = algebraMap L Ω t := by
  change g ∈ (IsScalarTower.toAlgHom k L Ω).fieldRange.fixingSubgroup ↔ _
  rw [IntermediateField.mem_fixingSubgroup_iff]
  exact ⟨fun h t => h _ ⟨t,rfl⟩, fun h y ⟨t,ht⟩ => ht ▸ h t⟩

theorem le : fix k Y Ω ≤ fix k L Ω := by
  intro g hg
  apply (fix_iff k L Ω g).mpr
  intro a
  rw [IsScalarTower.algebraMap_apply L Y Ω]
  exact (fix_iff k Y Ω g).mp hg _

theorem finite_index [FiniteDimensional k L] : (fix k L Ω).toSubgroup.FiniteIndex := by
  let P := (IsScalarTower.toAlgHom k L Ω).fieldRange
  have : FiniteDimensional k P :=
    Module.Finite.of_surjective (IsScalarTower.toAlgHom k L Ω).equivFieldRange.toLinearMap
      (IsScalarTower.toAlgHom k L Ω).equivFieldRange.surjective
  constructor
  change P.fixingSubgroup.index ≠ 0
  rw [← IntermediateField.finrank_eq_fixingSubgroup_index]
  exact Module.finrank_pos.ne'

def fixEquiv : (fix k L Ω).toSubgroup ≃* Gal(Ω/L) where
  toFun g := { g.val.toRingEquiv with commutes' := (fix_iff k L Ω g.val).mp g.property }
  invFun g := ⟨g.restrictScalars k,(fix_iff k L Ω _).mpr g.commutes⟩
  left_inv _ := rfl
  right_inv _ := rfl
  map_mul' _ _ := rfl

variable [IsGalois L Y]

def restrict : (fix k L Ω).toSubgroup →* Gal(Y/L) :=
  (AlgEquiv.restrictNormalHom Y).comp (fixEquiv k L Ω).toMonoidHom

theorem restrict_apply (g : (fix k L Ω).toSubgroup) (a : Y) :
    algebraMap Y Ω (restrict k L Y Ω g a) = g.val (algebraMap Y Ω a) :=
  (fixEquiv k L Ω g).restrictNormal_commutes Y a

theorem restrict_surj [Normal L Ω] : Function.Surjective (restrict k L Y Ω) :=
  (AlgEquiv.restrictNormalHom_surjective Ω).comp (fixEquiv k L Ω).surjective

theorem ker :
    (restrict k L Y Ω).ker = (fix k Y Ω).toSubgroup.subgroupOf (fix k L Ω).toSubgroup := by
  ext g
  change restrict k L Y Ω g = 1 ↔ g.val ∈ fix k Y Ω
  rw [fix_iff]
  constructor
  · intro hg a
    rw [← restrict_apply, hg]
    rfl
  · intro hg
    exact AlgEquiv.ext fun a => (algebraMap Y Ω).injective ((restrict_apply k L Y Ω g a).trans (hg a))

end
end TunnellRelativeUnitAction

namespace TunnellRelativeUnitAction
open RamificationTheory LocalClassFieldTheory TunnellAbstractNormCoordinates
open scoped Classical IsMulCommutative
noncomputable section
variable (k L Y Ω : Type) [Field k] [Field L] [Field Y] [Field Ω]
  [Algebra k L] [Algebra L Y] [Algebra k Y] [IsScalarTower k L Y]
  [Algebra k Ω] [Algebra L Ω] [Algebra Y Ω] [IsScalarTower k L Ω]
  [IsScalarTower k Y Ω] [IsScalarTower L Y Ω] [IsGalois k Ω]

abbrev units := embeddedFieldUnitsEquivGaloisFixed k Ω L (IsScalarTower.toAlgHom k L Ω)

variable [IsGalois L Y] [Normal L Ω]
instance normal : (M (fix k L Ω) (fix k Y Ω)).Normal := by
  change ((fix k Y Ω).toSubgroup.subgroupOf (fix k L Ω).toSubgroup).Normal
  rw [← ker k L Y Ω]
  infer_instance

def quotient : U (fix k L Ω) ⧸ M (fix k L Ω) (fix k Y Ω) ≃* Gal(Y/L) :=
  (QuotientGroup.quotientMulEquivOfEq (ker k L Y Ω).symm).trans
    (QuotientGroup.quotientKerEquivOfSurjective (restrict k L Y Ω) (restrict_surj k L Y Ω))

theorem quotient_mk (g : U (fix k L Ω)) :
    quotient k L Y Ω (QuotientGroup.mk g) = restrict k L Y Ω g := rfl

variable [FiniteDimensional L Y]

instance fin : Fintype (U (fix k L Ω) ⧸ M (fix k L Ω) (fix k Y Ω)) := Fintype.ofEquiv (Gal(Y/L)) (quotient k L Y Ω).symm.toEquiv

theorem sum_norm (y : Yˣ) :
    ∑ᶠ q : (U (fix k L Ω) ⧸ M (fix k L Ω) (fix k Y Ω)), (galoisAmbientUnitsRep k Ω).ρ q.out.val (units k Y Ω (Additive.ofMul y)).val =
    (units k L Ω (Additive.ofMul (Units.map (Algebra.norm L) y))).val := by
  rw [finsum_eq_sum_of_fintype]
  change (∑ q : (U (fix k L Ω) ⧸ M (fix k L Ω) (fix k Y Ω)), Additive.ofMul (Units.map q.out.val.toMonoidHom (Units.map (algebraMap Y Ω).toMonoidHom y))) =
    Additive.ofMul (Units.map (algebraMap L Ω).toMonoidHom (Units.map (Algebra.norm L) y))
  apply (@Additive.toMul Ωˣ).injective
  apply Units.ext
  rw [toMul_sum, Units.coe_prod]
  change (∏ q : (U (fix k L Ω) ⧸ M (fix k L Ω) (fix k Y Ω)), q.out.val (algebraMap Y Ω y.val)) = algebraMap L Ω (Algebra.norm L y.val)
  rw [IsScalarTower.algebraMap_apply L Y Ω, Algebra.norm_eq_prod_automorphisms, map_prod]
  apply Fintype.prod_equiv (quotient k L Y Ω).toEquiv
  intro q
  have h := restrict_apply k L Y Ω q.out y.val
  have hd : restrict k L Y Ω q.out = quotient k L Y Ω q :=
    (quotient_mk k L Y Ω q.out).symm.trans (congrArg (quotient k L Y Ω) (Quotient.out_eq' q))
  exact h.symm.trans (congrArg (fun a : Gal(Y/L) => algebraMap Y Ω (a y.val)) hd)

theorem norm_iff (x : Lˣ) :
    N (galoisAmbientUnitsRep k Ω) (fix k L Ω) (fix k Y Ω) (units k L Ω (Additive.ofMul x)).val ↔
      x ∈ (Units.map (Algebra.norm L (S := Y))).range := by
  constructor
  · rintro ⟨b,hb⟩
    obtain ⟨y,rfl⟩ := (units k Y Ω).surjective b
    exact ⟨y.toMul, (units k L Ω).injective (Subtype.ext ((sum_norm k L Y Ω y.toMul).symm.trans hb))⟩
  · rintro ⟨y,rfl⟩
    exact ⟨units k Y Ω (Additive.ofMul y),sum_norm k L Y Ω y⟩

end
end TunnellRelativeUnitAction

namespace TunnellRelativeUnitAction
open TunnellAbstractNormCoordinates
open scoped Classical
noncomputable section
variable (k L Ω : Type) [Field k] [Field L] [Field Ω]
  [Algebra k L] [Algebra k Ω] [Algebra L Ω] [IsScalarTower k L Ω] [IsGalois k Ω]
variable (d : Gal(L/k)) (s : Gal(Ω/k))
  (h : ∀ z : L, s (algebraMap L Ω z) = algebraMap L Ω (d z))
include h

theorem conjugate_mem (g : U (fix k L Ω)) : s * g.val * s⁻¹ ∈ U (fix k L Ω) := by
  apply (fix_iff k L Ω _).mpr
  intro x
  obtain ⟨y,rfl⟩ := d.surjective x
  rw [← h y]
  change s (g.val (s.symm (s (algebraMap L Ω y)))) = _
  rw [s.symm_apply_apply,(fix_iff k L Ω g.val).mp g.property]

theorem conjugate_fix : (U (fix k L Ω)).map (MulAut.conj s) = U (fix k L Ω) := by
  apply le_antisymm
  · rintro _ ⟨g,hg,rfl⟩
    exact conjugate_mem k L Ω d s h ⟨g,hg⟩
  · intro g hg
    have hi (z : L) : s⁻¹ (algebraMap L Ω z) = algebraMap L Ω (d⁻¹ z) := by
      apply s.injective
      change s (s.symm _) = _
      rw [s.apply_symm_apply,h]
      exact congrArg (algebraMap L Ω) (d.apply_symm_apply z).symm
    exact ⟨s⁻¹ * g * s,by simpa using conjugate_mem k L Ω d⁻¹ s⁻¹ hi ⟨g,hg⟩,by simp [mul_assoc]⟩

end
end TunnellRelativeUnitAction

namespace TunnellRelativeArtinRealization
open LocalClassFieldTheory TunnellAbstractNormCoordinates TunnellRelativeUnitAction
open scoped Classical IsMulCommutative
noncomputable section

variable (k L Y Ω : Type) [Field k] [Field L] [Field Y] [Field Ω]
  [Algebra k L] [Algebra L Y] [Algebra k Y] [IsScalarTower k L Y]
  [Algebra k Ω] [Algebra L Ω] [Algebra Y Ω] [IsScalarTower k L Ω]
  [IsScalarTower k Y Ω] [IsScalarTower L Y Ω] [IsGalois k Ω]
  [FiniteDimensional k L] [FiniteDimensional L Y] [IsAbelianGalois L Y] [Normal L Ω]




local instance : (M (fix k L Ω) (fix k Y Ω)).Normal := TunnellRelativeUnitAction.normal k L Y Ω
local instance : IsMulCommutative (U (fix k L Ω) ⧸ M (fix k L Ω) (fix k Y Ω)) := ⟨⟨fun a b => (quotient k L Y Ω).injective
  (by rw [map_mul,map_mul,mul_comm])⟩⟩

theorem realize
    (f : B (galoisAmbientUnitsRep k Ω) (fix k L Ω) →+ Additive (U (fix k L Ω) ⧸ M (fix k L Ω) (fix k Y Ω))) (surj : Function.Surjective f)
    (norm : ∀ a, f a = 0 ↔ N (galoisAmbientUnitsRep k Ω) (fix k L Ω) (fix k Y Ω) a.val)
    (conj : ∀ s : Gal(Ω/k), (U (fix k L Ω)).map (MulAut.conj s) = U (fix k L Ω) → (U (fix k Y Ω)).map (MulAut.conj s) = U (fix k Y Ω) →
      ∀ (x y : B (galoisAmbientUnitsRep k Ω) (fix k L Ω)) (a b : U (fix k L Ω)), y.val = ((galoisAmbientUnitsRep k Ω)).ρ s x.val → b.val = s * a.val * s⁻¹ →
        f x = Additive.ofMul (a : (U (fix k L Ω) ⧸ M (fix k L Ω) (fix k Y Ω))) → f y = Additive.ofMul (b : (U (fix k L Ω) ⧸ M (fix k L Ω) (fix k Y Ω)))) :
    ∃ F : Lˣ →* Gal(Y/L), Function.Surjective F ∧
      F.ker = (Units.map (Algebra.norm L (S := Y))).range ∧
      ∀ (d : Gal(L/k)) (s : Gal(Y/k)),
      (∀ z : L, s (algebraMap L Y z) = algebraMap L Y (d z)) →
      ∀ (u : Lˣ) (z : Y), s (F u z) = F (Units.map d.toMonoidHom u) (s z) := by
  let e := quotient k L Y Ω
  let h := units k L Ω
  let F : Lˣ →* Gal(Y/L) := e.toMonoidHom.comp ((f.comp h.toAddMonoidHom).toMultiplicative)
  refine ⟨F, e.surjective.comp (surj.comp h.surjective), ?_, ?_⟩
  · ext u
    change e (f (h (Additive.ofMul u))).toMul = 1 ↔ _
    rw [e.map_eq_one_iff]
    exact (norm _).trans (norm_iff k L Y Ω u)
  · intro d s hd u z
    let S := s.liftNormal Ω
    have SY (y : Y) : S (algebraMap Y Ω y) = algebraMap Y Ω (s y) := s.liftNormal_commutes Ω y
    have SL (x : L) : S (algebraMap L Ω x) = algebraMap L Ω (d x) := by
      rw [IsScalarTower.algebraMap_apply L Y Ω,SY,hd]
      exact (IsScalarTower.algebraMap_apply L Y Ω _).symm
    let x := h (Additive.ofMul u)
    let y := h (Additive.ofMul (Units.map d.toMonoidHom u))
    let a := (f x).toMul.out
    let b : U (fix k L Ω) := ⟨S * a.val * S⁻¹,conjugate_mem k L Ω d S SL a⟩
    have ha : f x = Additive.ofMul (a : (U (fix k L Ω) ⧸ M (fix k L Ω) (fix k Y Ω))) := (Quotient.out_eq' (f x).toMul).symm
    have hb := conj S (conjugate_fix k L Ω d S SL) (conjugate_fix k Y Ω s S SY) x y a b (by
      apply (@Additive.toMul Ωˣ).injective
      apply Units.ext
      exact (SL u.val).symm) rfl ha
    have ax : F u = restrict k L Y Ω a := by
      change e (f x).toMul = _
      rw [ha]
      rfl
    have by' : F (Units.map d.toMonoidHom u) = restrict k L Y Ω b := by
      change e (f y).toMul = _
      rw [hb]
      rfl
    rw [ax,by']
    apply (algebraMap Y Ω).injective
    rw [← SY,restrict_apply,restrict_apply,← SY]
    change _ = S (a.val (S.symm (S _)))
    rw [S.symm_apply_apply]

end
end TunnellRelativeArtinRealization

open NumberField IsDedekindDomain TunnellRelativeUnitAction TunnellAbstractNormCoordinates
open scoped NumberField Classical IsMulCommutative
theorem OMA.solution : OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H1_R1_H2_R1_H2_R1.H4 := by
  intro p
  dsimp only
  intro core L Y _ _ _ _ _ _ _ _ _
  let k := p.adicCompletion ℚ
  let Ω := SeparableClosure k
  let : CharZero k := charZero_of_injective_algebraMap (algebraMap ℚ k).injective
  let : FiniteDimensional k Y := Module.Finite.trans L Y
  let i : Y →ₐ[k] Ω := IsSepClosed.lift
  let : Algebra Y Ω := i.toRingHom.toAlgebra
  let : IsScalarTower k Y Ω := .of_algebraMap_eq fun x => (i.commutes x).symm
  let : Algebra L Ω := (i.toRingHom.comp (algebraMap L Y)).toAlgebra
  let : IsScalarTower L Y Ω := .of_algebraMap_eq' rfl
  let : IsScalarTower k L Ω := .of_algebraMap_eq fun x => by
    change algebraMap k Ω x = i (algebraMap L Y (algebraMap k L x))
    rw [← IsScalarTower.algebraMap_apply k L Y,i.commutes]
  let : Normal L Ω := Normal.tower_top_of_normal k L Ω
  let H := fix k L Ω
  let J := fix k Y Ω
  let e := quotient k L Y Ω
  letI : (U H).FiniteIndex := TunnellRelativeUnitAction.finite_index k L Ω
  letI : (M H J).Normal := TunnellRelativeUnitAction.normal k L Y Ω
  letI : Fintype (U H ⧸ M H J) := TunnellRelativeUnitAction.fin k L Y Ω
  letI : IsMulCommutative (U H ⧸ M H J) := ⟨⟨fun a b => e.injective
    (by rw [map_mul,map_mul,mul_comm])⟩⟩
  obtain ⟨f,surj,norm,conj⟩ := core H J (le k L Y Ω)
  exact TunnellRelativeArtinRealization.realize k L Y Ω f surj norm conj
