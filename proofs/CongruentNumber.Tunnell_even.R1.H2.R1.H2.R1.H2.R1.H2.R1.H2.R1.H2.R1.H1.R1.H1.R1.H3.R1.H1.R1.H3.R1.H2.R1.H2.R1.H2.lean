import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H3_R1_H1_R1_H3_R1_H2_R1_H2_R1
import Mathlib
/-! The integer-unit norm of an unramified local extension is surjective. The supporting local-field declarations are adapted from ClassFieldTheory, revision 2e6280f9d2579705a0cc6c76ec68c2b60f9c601a, https://github.com/n-yamaguchi-0729/ClassFieldTheory. Selected declarations are combined and imports replaced by their dependency declarations below. -/
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
   

  integer_isIntegral : ∀ x : 𝒪[L], IsIntegral 𝒪[K] (x : L)
 

instance valuativeExtensionOfIsIntegralClosure
    (K : Type u) (L : Type v) [Field K] [ValuativeRel K]
    [Field L] [ValuativeRel L] [Algebra K L] [IsIntegralClosure 𝒪[L] 𝒪[K] L] :
    ValuativeExtension K L where
  integer_isIntegral x :=
    (IsIntegralClosure.isIntegral_iff (A := 𝒪[L]) (R := 𝒪[K]) (B := L)).2 ⟨x, rfl⟩
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
 
def integerUnitsToFieldUnits (K : Type u) [Field K] [ValuativeRel K] : 𝒪[K]ˣ →* Kˣ :=
  Units.map (algebraMap 𝒪[K] K).toMonoidHom
 

@[simp]
theorem integerUnitsToFieldUnits_apply (K : Type u) [Field K] [ValuativeRel K]
    (x : 𝒪[K]ˣ) :
    ((integerUnitsToFieldUnits K x : Kˣ) : K) = (((x : 𝒪[K]ˣ) : 𝒪[K]) : K) :=
  rfl
 
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
 
def mapBaseUnitsToExtensionUnits
    (K : Type u) (L : Type v) [Field K] [Field L] [Algebra K L] :
    Kˣ →* Lˣ :=
  Units.map (algebraMap K L).toMonoidHom
 

@[simp]
lemma mapBaseUnitsToExtensionUnits_apply_coe (x : Kˣ) :
    ((mapBaseUnitsToExtensionUnits K L x : Lˣ) : L) = algebraMap K L (x : K) :=
  rfl
 
lemma algebraNorm_mem_integers_of_mem_integers [ValuativeRel K] [ValuativeRel L]
    [LocalFieldTheory.ValuativeExtension K L] (x : 𝒪[L]) :
    Algebra.norm K (x : L) ∈ 𝒪[K] := by
  exact Valuation.Integers.mem_of_integral
    (Valuation.integer.integers (ValuativeRel.valuation K))
    (Algebra.isIntegral_norm K (LocalFieldTheory.ValuativeExtension.integer_isIntegral x))
 
def normIntegerUnitsValue [ValuativeRel K] [ValuativeRel L]
    [LocalFieldTheory.ValuativeExtension K L] (x : 𝒪[L]ˣ) : 𝒪[K] :=
  ⟨Algebra.norm K (((x : 𝒪[L]ˣ) : 𝒪[L]) : L),
    algebraNorm_mem_integers_of_mem_integers ((x : 𝒪[L]ˣ) : 𝒪[L])⟩
 
lemma normIntegerUnitsValue_mul_inv [ValuativeRel K] [ValuativeRel L]
    [LocalFieldTheory.ValuativeExtension K L] (x : 𝒪[L]ˣ) :
    normIntegerUnitsValue (K := K) (L := L) x *
      normIntegerUnitsValue (K := K) (L := L) x⁻¹ = 1 := by
  ext
  change Algebra.norm K (((x : 𝒪[L]ˣ) : 𝒪[L]) : L) *
      Algebra.norm K (((x⁻¹ : 𝒪[L]ˣ) : 𝒪[L]) : L) = 1
  have hx : (((x : 𝒪[L]ˣ) : 𝒪[L]) : L) *
      (((x⁻¹ : 𝒪[L]ˣ) : 𝒪[L]) : L) = 1 := by
    change (((x * x⁻¹ : 𝒪[L]ˣ) : 𝒪[L]) : L) = 1
    simp
  rw [← map_mul (Algebra.norm K)]
  simp [hx]
 
lemma normIntegerUnitsValue_inv_mul [ValuativeRel K] [ValuativeRel L]
    [LocalFieldTheory.ValuativeExtension K L] (x : 𝒪[L]ˣ) :
    normIntegerUnitsValue (K := K) (L := L) x⁻¹ *
      normIntegerUnitsValue (K := K) (L := L) x = 1 := by
  ext
  change Algebra.norm K (((x⁻¹ : 𝒪[L]ˣ) : 𝒪[L]) : L) *
      Algebra.norm K (((x : 𝒪[L]ˣ) : 𝒪[L]) : L) = 1
  have hx : (((x⁻¹ : 𝒪[L]ˣ) : 𝒪[L]) : L) *
      (((x : 𝒪[L]ˣ) : 𝒪[L]) : L) = 1 := by
    change (((x⁻¹ * x : 𝒪[L]ˣ) : 𝒪[L]) : L) = 1
    simp
  rw [← map_mul (Algebra.norm K)]
  simp [hx]
 
def normIntegerUnits
    (K : Type u) (L : Type v)
    [Field K] [ValuativeRel K] [Field L] [ValuativeRel L]
    [Algebra K L] [LocalFieldTheory.ValuativeExtension K L] : 𝒪[L]ˣ →* 𝒪[K]ˣ where
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
 
lemma normIntegerUnits_apply_coe [ValuativeRel K] [ValuativeRel L]
    [LocalFieldTheory.ValuativeExtension K L] (x : 𝒪[L]ˣ) :
    (((normIntegerUnits K L x : 𝒪[K]ˣ) : 𝒪[K]) : K) =
      Algebra.norm K (((x : 𝒪[L]ˣ) : 𝒪[L]) : L) :=
  rfl
end UnitNorm
section Valuation
variable [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
variable [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
variable [Algebra K L]
omit [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
  [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L] in
 

lemma mapBaseUnits_normUnits_eq_prod_gal [FiniteDimensional K L] [IsGalois K L]
    (x : Lˣ) :
    mapBaseUnitsToExtensionUnits K L (normUnits K L x) =
      ∏ σ : L ≃ₐ[K] L, Units.mapEquiv σ.toMulEquiv x := by
  ext
  simp [mapBaseUnitsToExtensionUnits, normUnits, Algebra.norm_eq_prod_automorphisms]
end Valuation
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
 

theorem principalUnits_integerRingEquiv_mem (K : Type u) [Field K] [ValuativeRel K]
    (n : Nat) (σ𝒪 : 𝒪[K] ≃+* 𝒪[K])
    (hpow : ∀ x : 𝒪[K],
      x ∈ (𝓂[K] ^ n : Ideal 𝒪[K]) → σ𝒪 x ∈ (𝓂[K] ^ n : Ideal 𝒪[K]))
    (u : 𝒪[K]ˣ) (hu : u ∈ principalUnits K n) :
    Units.mapEquiv σ𝒪.toMulEquiv u ∈ principalUnits K n := by
  rw [mem_principalUnits_iff] at hu ⊢
  have hmem : σ𝒪 ((u : 𝒪[K]) - 1) ∈ (𝓂[K] ^ n : Ideal 𝒪[K]) :=
    hpow ((u : 𝒪[K]) - 1) hu
  simpa using hmem
 
@[simp] theorem principalUnits_zero (K : Type u) [Field K] [ValuativeRel K] :
    principalUnits K 0 = ⊤ := by
  ext u
  simp [principalUnits]
 
theorem principalUnits_antitone (K : Type u) [Field K] [ValuativeRel K]
    {m n : Nat} (h : m ≤ n) :
    principalUnits K n ≤ principalUnits K m := by
  intro u hu
  exact Ideal.pow_le_pow_right h hu
 
theorem principalUnits_succ_le (K : Type u) [Field K] [ValuativeRel K] (n : Nat) :
    principalUnits K (n + 1) ≤ principalUnits K n :=
  principalUnits_antitone K (Nat.le_succ n)
 
def IntegerUnitsPrincipalQuot (K : Type u) [Field K] [ValuativeRel K]
    (n : Nat) : Type u :=
  𝒪[K]ˣ ⧸ principalUnits K n
 

instance integerUnitsPrincipalQuotCommGroup
    (K : Type u) [Field K] [ValuativeRel K] (n : Nat) :
    CommGroup (IntegerUnitsPrincipalQuot K n) := by
  change CommGroup (𝒪[K]ˣ ⧸ principalUnits K n)
  infer_instance
 


def integerUnitsPrincipalQuotConcreteEquiv
    (K : Type u) [Field K] [ValuativeRel K] (n : Nat) :
    IntegerUnitsPrincipalQuot K n ≃* (𝒪[K]ˣ ⧸ principalUnits K n) := by
  change (𝒪[K]ˣ ⧸ principalUnits K n) ≃* (𝒪[K]ˣ ⧸ principalUnits K n)
  exact MulEquiv.refl _
 
def integerUnitsPrincipalQuotMk (K : Type u) [Field K] [ValuativeRel K]
    (n : Nat) : 𝒪[K]ˣ →* IntegerUnitsPrincipalQuot K n := by
  change 𝒪[K]ˣ →* (𝒪[K]ˣ ⧸ principalUnits K n)
  exact QuotientGroup.mk' (principalUnits K n)
 

@[simp]
theorem integerUnitsPrincipalQuotConcreteEquiv_mk
    (K : Type u) [Field K] [ValuativeRel K] (n : Nat) (u : 𝒪[K]ˣ) :
    integerUnitsPrincipalQuotConcreteEquiv K n
        (integerUnitsPrincipalQuotMk K n u) =
      QuotientGroup.mk u :=
  rfl
 

@[simp]
theorem integerUnitsPrincipalQuotMk_eq_one_iff
    (K : Type u) [Field K] [ValuativeRel K] (n : Nat) (u : 𝒪[K]ˣ) :
    integerUnitsPrincipalQuotMk K n u = 1 ↔ u ∈ principalUnits K n := by
  change QuotientGroup.mk' (principalUnits K n) u = 1 ↔ _
  exact QuotientGroup.eq_one_iff (N := principalUnits K n) u
 

@[simp]
theorem integerUnitsPrincipalQuotMk_eq_iff_div_mem
    (K : Type u) [Field K] [ValuativeRel K] (n : Nat) (u v : 𝒪[K]ˣ) :
    integerUnitsPrincipalQuotMk K n u =
        integerUnitsPrincipalQuotMk K n v ↔
      u / v ∈ principalUnits K n := by
  change (QuotientGroup.mk u : 𝒪[K]ˣ ⧸ principalUnits K n) =
      QuotientGroup.mk v ↔ _
  exact QuotientGroup.eq_iff_div_mem (N := principalUnits K n)
 
def integerUnitsPrincipalQuotLift
    {K : Type u} {M : Type*} [Field K] [ValuativeRel K] [Group M]
    (n : Nat) (f : 𝒪[K]ˣ →* M) (h : principalUnits K n ≤ f.ker) :
    IntegerUnitsPrincipalQuot K n →* M := by
  change (𝒪[K]ˣ ⧸ principalUnits K n) →* M
  exact QuotientGroup.lift (principalUnits K n) f h
 

@[simp]
theorem integerUnitsPrincipalQuotLift_mk
    {K : Type u} {M : Type*} [Field K] [ValuativeRel K] [Group M]
    (n : Nat) (f : 𝒪[K]ˣ →* M) (h : principalUnits K n ≤ f.ker)
    (u : 𝒪[K]ˣ) :
    integerUnitsPrincipalQuotLift n f h
        (integerUnitsPrincipalQuotMk K n u) = f u :=
  rfl
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
 

theorem maximalIdeal_iInf_pow_eq_bot
    (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] :
    (⨅ n : Nat, (𝓂[K] ^ n : Ideal 𝒪[K])) = ⊥ := by
  exact Ideal.iInf_pow_eq_bot_of_isLocalRing
    (I := (𝓂[K] : Ideal 𝒪[K])) Ideal.IsPrime.ne_top'
 

theorem eq_zero_of_mem_all_maximalIdeal_pow
    (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (x : 𝒪[K])
    (hx : ∀ n : Nat, x ∈ (𝓂[K] ^ n : Ideal 𝒪[K])) :
    x = 0 := by
  have hxInf : x ∈ (⨅ n : Nat, (𝓂[K] ^ n : Ideal 𝒪[K])) := by
    rw [Ideal.mem_iInf]
    exact hx
  rw [maximalIdeal_iInf_pow_eq_bot K] at hxInf
  exact (Ideal.mem_bot.mp hxInf)
 

theorem principalUnits_eq_one_of_mem_all
    (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (u : 𝒪[K]ˣ)
    (hu : ∀ n : Nat, u ∈ principalUnits K n) :
    u = 1 := by
  apply Units.ext
  have hsub :
      ((u : 𝒪[K]) - 1) = 0 :=
    eq_zero_of_mem_all_maximalIdeal_pow K ((u : 𝒪[K]) - 1) (by
      intro n
      exact (mem_principalUnits_iff K u n).1 (hu n))
  exact sub_eq_zero.mp hsub
 

theorem principalUnits_eq_one_of_mem_add_all
    (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (n : Nat) (u : 𝒪[K]ˣ)
    (hu : ∀ d : Nat, u ∈ principalUnits K (n + d)) :
    u = 1 := by
  refine principalUnits_eq_one_of_mem_all K u ?_
  intro m
  by_cases hm : m ≤ n
  · exact principalUnits_antitone K hm (hu 0)
  · have hnm : n ≤ m := Nat.le_of_not_ge hm
    obtain ⟨d, rfl⟩ := Nat.exists_eq_add_of_le hnm
    exact hu d
 

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
 

theorem eventually_sub_mem_maximalIdeal_pow_of_tendsto
    (K : Type u) [Field K] [ValuativeRel K] [UniformSpace K] [IsUniformAddGroup K]
    [IsNonarchimedeanLocalField K] {f : Nat → 𝒪[K]} {x : 𝒪[K]} (n : Nat)
    (hf : Tendsto f atTop (nhds x)) :
    ∀ᶠ d in atTop, f d - x ∈ (𝓂[K] ^ n : Ideal 𝒪[K]) := by
  have hdiff : Tendsto (fun d : Nat => f d - x) atTop (nhds (0 : 𝒪[K])) := by
    simpa using hf.sub (tendsto_const_nhds (x := x))
  exact hdiff.eventually (maximalIdeal_pow_mem_nhds_zero K n)
 

theorem eventually_div_mem_principalUnits_of_tendsto_units
    (K : Type u) [Field K] [ValuativeRel K] [UniformSpace K] [IsUniformAddGroup K]
    [IsNonarchimedeanLocalField K] {f : Nat → 𝒪[K]ˣ} {x : 𝒪[K]ˣ} (n : Nat)
    (hf : Tendsto (fun d : Nat => ((f d : 𝒪[K]ˣ) : 𝒪[K])) atTop
      (nhds ((x : 𝒪[K]ˣ) : 𝒪[K]))) :
    ∀ᶠ d in atTop, f d / x ∈ principalUnits K n := by
  have hsub := eventually_sub_mem_maximalIdeal_pow_of_tendsto K n hf
  filter_upwards [hsub] with d hd
  rw [mem_principalUnits_iff]
  change (((f d / x : 𝒪[K]ˣ) : 𝒪[K]) - 1) ∈ (𝓂[K] ^ n : Ideal 𝒪[K])
  rw [show (((f d / x : 𝒪[K]ˣ) : 𝒪[K]) - 1) =
      (((f d : 𝒪[K]ˣ) : 𝒪[K]) - ((x : 𝒪[K]ˣ) : 𝒪[K])) * ↑(x⁻¹) by
    simp only [div_eq_mul_inv, Units.val_mul]
    calc
      ((f d : 𝒪[K]ˣ) : 𝒪[K]) * ↑(x⁻¹) - 1 =
          ((f d : 𝒪[K]ˣ) : 𝒪[K]) * ↑(x⁻¹) -
            ((x : 𝒪[K]ˣ) : 𝒪[K]) * ↑(x⁻¹) := by
            simp
      _ = (((f d : 𝒪[K]ˣ) : 𝒪[K]) - ((x : 𝒪[K]ˣ) : 𝒪[K])) * ↑(x⁻¹) := by
            ring]
  exact (𝓂[K] ^ n : Ideal 𝒪[K]).mul_mem_right _ hd
 


def principalUnitsCorrectionProduct (K : Type u) [Field K] [ValuativeRel K]
    (n : Nat) (z : ∀ d : Nat, principalUnits K (n + d)) :
    Nat → 𝒪[K]ˣ
  | 0 => 1
  | d + 1 => principalUnitsCorrectionProduct K n z d * (z d : 𝒪[K]ˣ)
 
@[simp]
theorem principalUnitsCorrectionProduct_zero
    (K : Type u) [Field K] [ValuativeRel K] (n : Nat)
    (z : ∀ d : Nat, principalUnits K (n + d)) :
    principalUnitsCorrectionProduct K n z 0 = 1 :=
  rfl
 
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
 
def principalUnitsSuccIncl (K : Type u) [Field K] [ValuativeRel K] (n : Nat) :
    principalUnits K (n + 1) →* principalUnits K n where
  toFun u := ⟨u.1, principalUnits_succ_le K n u.2⟩
  map_one' := rfl
  map_mul' := by
    intro a b
    rfl
 

theorem principalUnitsSuccIncl_range
    (K : Type u) [Field K] [ValuativeRel K] (n : Nat) :
    MonoidHom.range (principalUnitsSuccIncl K n) =
      (principalUnits K (n + 1)).subgroupOf (principalUnits K n) := by
  ext u
  constructor
  · intro hu
    rcases hu with ⟨v, hv⟩
    rw [← hv]
    exact v.2
  · intro hu
    exact ⟨⟨u.1, hu⟩, by ext; rfl⟩
 
theorem principalUnitsSuccQuotMk_surjective
    (K : Type u) [Field K] [ValuativeRel K] (n : Nat) :
    Function.Surjective (principalUnitsSuccQuotMk K n) :=
  QuotientGroup.mk'_surjective ((principalUnits K (n + 1)).subgroupOf (principalUnits K n))
 
theorem principalUnitsSuccQuotMk_ker (K : Type u) [Field K] [ValuativeRel K] (n : Nat) :
    MonoidHom.ker (principalUnitsSuccQuotMk K n) =
      (principalUnits K (n + 1)).subgroupOf (principalUnits K n) :=
  QuotientGroup.ker_mk'
    (N := (principalUnits K (n + 1)).subgroupOf (principalUnits K n))
 
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
 
theorem principalUnitsSuccIncl_exact
    (K : Type u) [Field K] [ValuativeRel K] (n : Nat) :
    MonoidHom.range (principalUnitsSuccIncl K n) =
      MonoidHom.ker (principalUnitsSuccQuotMk K n) := by
  rw [principalUnitsSuccIncl_range, principalUnitsSuccQuotMk_ker]
 
theorem principalUnitsSuccIncl_mem_ker
    (K : Type u) [Field K] [ValuativeRel K] (n : Nat)
    (u : principalUnits K (n + 1)) :
    principalUnitsSuccIncl K n u ∈ MonoidHom.ker (principalUnitsSuccQuotMk K n) := by
  rw [← principalUnitsSuccIncl_exact K n]
  exact ⟨u, rfl⟩
 
@[simp]
theorem principalUnitsSuccQuotMk_comp_incl_apply
    (K : Type u) [Field K] [ValuativeRel K] (n : Nat)
    (u : principalUnits K (n + 1)) :
    principalUnitsSuccQuotMk K n (principalUnitsSuccIncl K n u) = 1 := by
  exact principalUnitsSuccIncl_mem_ker K n u
 

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
 
def maximalIdealPowSuccQuotConcreteLinearEquiv
    (K : Type u) [Field K] [ValuativeRel K] (n : Nat) :
    MaximalIdealPowSuccQuot K n ≃ₗ[𝒪[K]]
      (((𝓂[K] ^ n : Ideal 𝒪[K]) : Type u) ⧸
        maximalIdealPowSuccSubmodule K n) := by
  change
    (((𝓂[K] ^ n : Ideal 𝒪[K]) : Type u) ⧸
        maximalIdealPowSuccSubmodule K n) ≃ₗ[𝒪[K]]
      (((𝓂[K] ^ n : Ideal 𝒪[K]) : Type u) ⧸
        maximalIdealPowSuccSubmodule K n)
  exact LinearEquiv.refl 𝒪[K] _
 
def maximalIdealPowSuccQuotMk
    (K : Type u) [Field K] [ValuativeRel K] (n : Nat) :
    ((𝓂[K] ^ n : Ideal 𝒪[K]) : Type u) →ₗ[𝒪[K]]
      MaximalIdealPowSuccQuot K n := by
  change ((𝓂[K] ^ n : Ideal 𝒪[K]) : Type u) →ₗ[𝒪[K]]
    (((𝓂[K] ^ n : Ideal 𝒪[K]) : Type u) ⧸
      maximalIdealPowSuccSubmodule K n)
  exact Submodule.mkQ (maximalIdealPowSuccSubmodule K n)
 

@[simp]
theorem maximalIdealPowSuccQuotConcreteLinearEquiv_mk
    (K : Type u) [Field K] [ValuativeRel K] (n : Nat)
    (a : ((𝓂[K] ^ n : Ideal 𝒪[K]) : Type u)) :
    maximalIdealPowSuccQuotConcreteLinearEquiv K n
        (maximalIdealPowSuccQuotMk K n a) =
      Submodule.Quotient.mk a :=
  rfl
 
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
 
@[simp]
theorem maximalIdealPowSuccQuotLift_mk
    {K : Type u} {P : Sort*} [Field K] [ValuativeRel K] (n : Nat)
    (f : ((𝓂[K] ^ n : Ideal 𝒪[K]) : Type u) → P)
    (h : ∀ a b, a - b ∈ maximalIdealPowSuccSubmodule K n →
      f a = f b)
    (a : ((𝓂[K] ^ n : Ideal 𝒪[K]) : Type u)) :
    maximalIdealPowSuccQuotLift n f h
        (maximalIdealPowSuccQuotMk K n a) = f a :=
  rfl
 
def maximalIdealPowSuccQuotLinearLift
    {K : Type u} {M : Type*} [Field K] [ValuativeRel K]
    [AddCommGroup M] [Module 𝒪[K] M] (n : Nat)
    (f : ((𝓂[K] ^ n : Ideal 𝒪[K]) : Type u) →ₗ[𝒪[K]] M)
    (h : maximalIdealPowSuccSubmodule K n ≤ f.ker) :
    MaximalIdealPowSuccQuot K n →ₗ[𝒪[K]] M := by
  change
    (((𝓂[K] ^ n : Ideal 𝒪[K]) : Type u) ⧸
      maximalIdealPowSuccSubmodule K n) →ₗ[𝒪[K]] M
  exact (maximalIdealPowSuccSubmodule K n).liftQ f h
 

@[simp]
theorem maximalIdealPowSuccQuotLinearLift_mk
    {K : Type u} {M : Type*} [Field K] [ValuativeRel K]
    [AddCommGroup M] [Module 𝒪[K] M] (n : Nat)
    (f : ((𝓂[K] ^ n : Ideal 𝒪[K]) : Type u) →ₗ[𝒪[K]] M)
    (h : maximalIdealPowSuccSubmodule K n ≤ f.ker)
    (a : ((𝓂[K] ^ n : Ideal 𝒪[K]) : Type u)) :
    maximalIdealPowSuccQuotLinearLift n f h
        (maximalIdealPowSuccQuotMk K n a) = f a :=
  rfl
 

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
 

@[simp]
theorem maximalIdealPowSuccQuotMk_eq_iff
    (K : Type u) [Field K] [ValuativeRel K] (n : Nat)
    (a b : ((𝓂[K] ^ n : Ideal 𝒪[K]) : Type u)) :
    maximalIdealPowSuccQuotMk K n a =
        maximalIdealPowSuccQuotMk K n b ↔
      a - b ∈ maximalIdealPowSuccSubmodule K n := by
  change (Submodule.Quotient.mk a :
    ((𝓂[K] ^ n : Ideal 𝒪[K]) : Type u) ⧸
      maximalIdealPowSuccSubmodule K n) =
    Submodule.Quotient.mk b ↔ _
  exact Submodule.Quotient.eq (maximalIdealPowSuccSubmodule K n)
 
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
 

theorem principalUnitsSuccQuotMk_eq_oneAdd_of_sub_one_sub_mem_succ
    (K : Type u) [Field K] [ValuativeRel K] (n : Nat) (hn : 1 ≤ n)
    (u : principalUnits K n) (a : (𝓂[K] ^ n : Ideal 𝒪[K]))
    (h : (((u : 𝒪[K]ˣ) : 𝒪[K]) - 1 - (a : 𝒪[K])) ∈
      (𝓂[K] ^ (n + 1) : Ideal 𝒪[K])) :
    principalUnitsSuccQuotMk K n u =
      principalUnitsSuccQuotOfIdealPow K n hn a := by
  rw [principalUnitsSuccQuotOfIdealPow_apply]
  apply (principalUnitsSuccQuotMk_eq_iff_div_mem K n _ _).2
  rw [mem_principalUnits_succ_subgroupOf_iff]
  change ((((u : 𝒪[K]ˣ) /
        principalUnitOneAddOfMemPow K hn (a : 𝒪[K]) a.2 : 𝒪[K]ˣ) : 𝒪[K]) - 1) ∈
    (𝓂[K] ^ (n + 1) : Ideal 𝒪[K])
  rw [show ((((u : 𝒪[K]ˣ) /
        principalUnitOneAddOfMemPow K hn (a : 𝒪[K]) a.2 : 𝒪[K]ˣ) : 𝒪[K]) - 1) =
      (((u : 𝒪[K]ˣ) : 𝒪[K]) - 1 - (a : 𝒪[K])) *
        ↑(principalUnitOneAddOfMemPow K hn (a : 𝒪[K]) a.2)⁻¹ by
    simp only [div_eq_mul_inv, Units.val_mul]
    have hunit :
        ((principalUnitOneAddOfMemPow K hn (a : 𝒪[K]) a.2 : 𝒪[K]ˣ) : 𝒪[K]) *
          ↑(principalUnitOneAddOfMemPow K hn (a : 𝒪[K]) a.2)⁻¹ = 1 := by
      simp
    calc
      ((u : 𝒪[K]ˣ) : 𝒪[K]) *
            ↑(principalUnitOneAddOfMemPow K hn (a : 𝒪[K]) a.2)⁻¹ - 1 =
          ((u : 𝒪[K]ˣ) : 𝒪[K]) *
              ↑(principalUnitOneAddOfMemPow K hn (a : 𝒪[K]) a.2)⁻¹ -
            ((principalUnitOneAddOfMemPow K hn (a : 𝒪[K]) a.2 : 𝒪[K]ˣ) : 𝒪[K]) *
              ↑(principalUnitOneAddOfMemPow K hn (a : 𝒪[K]) a.2)⁻¹ := by
        rw [hunit]
      _ = (((u : 𝒪[K]ˣ) : 𝒪[K]) - 1 - (a : 𝒪[K])) *
          ↑(principalUnitOneAddOfMemPow K hn (a : 𝒪[K]) a.2)⁻¹ := by
        rw [principalUnitOneAddOfMemPow_val K hn (a : 𝒪[K]) a.2]
        ring]
  exact (𝓂[K] ^ (n + 1) : Ideal 𝒪[K]).mul_mem_right _ h
 
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
 

theorem finset_prod_one_add_sub_one_mem_maximalIdeal_of_mem_pow
    (K : Type u) [Field K] [ValuativeRel K] {ι : Type*}
    (s : Finset ι) (n : Nat) (hn : 1 ≤ n) (a : ι → 𝒪[K])
    (ha : ∀ i ∈ s, a i ∈ (𝓂[K] ^ n : Ideal 𝒪[K])) :
    (s.prod fun i => 1 + a i) - 1 ∈ (𝓂[K] : Ideal 𝒪[K]) := by
  classical
  revert a
  refine Finset.induction_on s ?base ?step
  · intro a ha
    simp
  · intro i s hi ih a ha
    have hai_pow : a i ∈ (𝓂[K] ^ n : Ideal 𝒪[K]) := ha i (by simp [hi])
    have hai : a i ∈ (𝓂[K] : Ideal 𝒪[K]) := by
      have hle : (𝓂[K] ^ n : Ideal 𝒪[K]) ≤ (𝓂[K] ^ 1 : Ideal 𝒪[K]) :=
        Ideal.pow_le_pow_right hn
      simpa using hle hai_pow
    have hs : ∀ j ∈ s, a j ∈ (𝓂[K] ^ n : Ideal 𝒪[K]) := by
      intro j hj
      exact ha j (by simp [hj])
    have hprod : (s.prod fun j => 1 + a j) - 1 ∈ (𝓂[K] : Ideal 𝒪[K]) :=
      ih a hs
    have hterm : a i * (s.prod fun j => 1 + a j) ∈ (𝓂[K] : Ideal 𝒪[K]) :=
      (𝓂[K] : Ideal 𝒪[K]).mul_mem_right _ hai
    rw [Finset.prod_insert hi]
    rw [show (1 + a i) * (s.prod fun j => 1 + a j) - 1 =
        ((s.prod fun j => 1 + a j) - 1) +
          a i * (s.prod fun j => 1 + a j) by
      ring]
    exact (𝓂[K] : Ideal 𝒪[K]).add_mem hprod hterm
 


theorem finset_prod_one_add_sub_one_sub_sum_mem_maximalIdeal_pow_succ
    (K : Type u) [Field K] [ValuativeRel K] {ι : Type*}
    (s : Finset ι) (n : Nat) (hn : 1 ≤ n) (a : ι → 𝒪[K])
    (ha : ∀ i ∈ s, a i ∈ (𝓂[K] ^ n : Ideal 𝒪[K])) :
    (s.prod fun i => 1 + a i) - 1 - (s.sum fun i => a i) ∈
      (𝓂[K] ^ (n + 1) : Ideal 𝒪[K]) := by
  classical
  revert a
  refine Finset.induction_on s ?base ?step
  · intro a ha
    simp
  · intro i s hi ih a ha
    have hai : a i ∈ (𝓂[K] ^ n : Ideal 𝒪[K]) := ha i (by simp [hi])
    have hs : ∀ j ∈ s, a j ∈ (𝓂[K] ^ n : Ideal 𝒪[K]) := by
      intro j hj
      exact ha j (by simp [hj])
    have hind :
        (s.prod fun j => 1 + a j) - 1 - (s.sum fun j => a j) ∈
          (𝓂[K] ^ (n + 1) : Ideal 𝒪[K]) :=
      ih a hs
    have hprod :
        (s.prod fun j => 1 + a j) - 1 ∈ (𝓂[K] : Ideal 𝒪[K]) :=
      finset_prod_one_add_sub_one_mem_maximalIdeal_of_mem_pow K s n hn a hs
    have hmul_raw :
        a i * ((s.prod fun j => 1 + a j) - 1) ∈
          (𝓂[K] ^ n : Ideal 𝒪[K]) * (𝓂[K] : Ideal 𝒪[K]) :=
      Ideal.mul_mem_mul hai hprod
    have hmul :
        a i * ((s.prod fun j => 1 + a j) - 1) ∈
          (𝓂[K] ^ (n + 1) : Ideal 𝒪[K]) := by
      simpa [pow_add] using hmul_raw
    rw [Finset.prod_insert hi, Finset.sum_insert hi]
    rw [show (1 + a i) * (s.prod fun j => 1 + a j) - 1 -
          (a i + (s.sum fun j => a j)) =
        ((s.prod fun j => 1 + a j) - 1 - (s.sum fun j => a j)) +
          a i * ((s.prod fun j => 1 + a j) - 1) by
      ring]
    exact (𝓂[K] ^ (n + 1) : Ideal 𝒪[K]).add_mem hind hmul
 
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
 

@[simp]
theorem principalUnitsSuccQuotOfMaximalIdealPowSuccQuotAdd_apply
    (K : Type u) [Field K] [ValuativeRel K] (n : Nat) (hn : 1 ≤ n)
    (x : MaximalIdealPowSuccQuot K n) :
    principalUnitsSuccQuotOfMaximalIdealPowSuccQuotAdd K n hn x =
      Additive.ofMul (principalUnitsSuccQuotOfMaximalIdealPowSuccQuot K n hn x) :=
  rfl
 
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
 

@[simp]
theorem maximalIdealPowSuccQuotAddEquivPrincipalUnitsSuccQuot_apply
    (K : Type u) [Field K] [ValuativeRel K] (n : Nat) (hn : 1 ≤ n)
    (x : MaximalIdealPowSuccQuot K n) :
    maximalIdealPowSuccQuotAddEquivPrincipalUnitsSuccQuot K n hn x =
      principalUnitsSuccQuotOfMaximalIdealPowSuccQuotAdd K n hn x :=
  rfl
 


noncomputable def maximalIdealPowSuccQuotMulEquivPrincipalUnitsSuccQuot
    (K : Type u) [Field K] [ValuativeRel K] (n : Nat) (hn : 1 ≤ n) :
    Multiplicative (MaximalIdealPowSuccQuot K n) ≃*
      PrincipalUnitsSuccQuot K n where
  toFun x :=
    Additive.toMul
      (maximalIdealPowSuccQuotAddEquivPrincipalUnitsSuccQuot K n hn
        (Multiplicative.toAdd x))
  invFun x :=
    Multiplicative.ofAdd
      ((maximalIdealPowSuccQuotAddEquivPrincipalUnitsSuccQuot K n hn).symm
        (Additive.ofMul x))
  left_inv := by
    intro x
    change Multiplicative.ofAdd
        ((maximalIdealPowSuccQuotAddEquivPrincipalUnitsSuccQuot K n hn).symm
          (maximalIdealPowSuccQuotAddEquivPrincipalUnitsSuccQuot K n hn
            (Multiplicative.toAdd x))) =
      Multiplicative.ofAdd (Multiplicative.toAdd x)
    exact congrArg Multiplicative.ofAdd
      ((maximalIdealPowSuccQuotAddEquivPrincipalUnitsSuccQuot K n hn).left_inv
        (Multiplicative.toAdd x))
  right_inv := by
    intro x
    change Additive.toMul
        (maximalIdealPowSuccQuotAddEquivPrincipalUnitsSuccQuot K n hn
          ((maximalIdealPowSuccQuotAddEquivPrincipalUnitsSuccQuot K n hn).symm
            (Additive.ofMul x))) =
      Additive.toMul (Additive.ofMul x)
    exact congrArg Additive.toMul
      ((maximalIdealPowSuccQuotAddEquivPrincipalUnitsSuccQuot K n hn).right_inv
        (Additive.ofMul x))
  map_mul' := by
    intro x y
    rw [show Multiplicative.toAdd (x * y) =
        Multiplicative.toAdd x + Multiplicative.toAdd y from rfl]
    change Additive.toMul
        (maximalIdealPowSuccQuotAddEquivPrincipalUnitsSuccQuot K n hn
          (Multiplicative.toAdd x + Multiplicative.toAdd y)) =
      Additive.toMul
        (maximalIdealPowSuccQuotAddEquivPrincipalUnitsSuccQuot K n hn
          (Multiplicative.toAdd x) +
        maximalIdealPowSuccQuotAddEquivPrincipalUnitsSuccQuot K n hn
          (Multiplicative.toAdd y))
    exact congrArg Additive.toMul
      ((maximalIdealPowSuccQuotAddEquivPrincipalUnitsSuccQuot K n hn).map_add
        (Multiplicative.toAdd x) (Multiplicative.toAdd y))
 

@[simp]
theorem maximalIdealPowSuccQuotMulEquivPrincipalUnitsSuccQuot_apply
    (K : Type u) [Field K] [ValuativeRel K] (n : Nat) (hn : 1 ≤ n)
    (x : MaximalIdealPowSuccQuot K n) :
    maximalIdealPowSuccQuotMulEquivPrincipalUnitsSuccQuot K n hn
        (Multiplicative.ofAdd x) =
      principalUnitsSuccQuotOfMaximalIdealPowSuccQuot K n hn x :=
  rfl
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
 
def maximalIdealPowMapEquivOfIntegerRingEquiv
    (K : Type u) [Field K] [ValuativeRel K]
    (n : Nat) (e : 𝒪[K] ≃+* 𝒪[K]) :
    ((𝓂[K] ^ n : Ideal 𝒪[K]) : Type u) ≃+
      ((𝓂[K] ^ n : Ideal 𝒪[K]) : Type u) where
  toFun a := ⟨e (a : 𝒪[K]), (integerRingEquiv_mem_maximalIdeal_pow K e n a).2 a.2⟩
  invFun a :=
    ⟨e.symm (a : 𝒪[K]), (integerRingEquiv_mem_maximalIdeal_pow K e.symm n a).2 a.2⟩
  left_inv := by
    intro a
    ext
    simp
  right_inv := by
    intro a
    ext
    simp
  map_add' := by
    intro a b
    ext
    simp
private theorem maximalIdealPowSuccQuotMapOfIntegerRingEquiv_respects
    (K : Type u) [Field K] [ValuativeRel K]
    (n : Nat) (e : 𝒪[K] ≃+* 𝒪[K])
    (a b : ((𝓂[K] ^ n : Ideal 𝒪[K]) : Type u))
    (hab : a - b ∈ maximalIdealPowSuccSubmodule K n) :
    maximalIdealPowSuccQuotMk K n
        (maximalIdealPowMapEquivOfIntegerRingEquiv K n e a) =
      maximalIdealPowSuccQuotMk K n
        (maximalIdealPowMapEquivOfIntegerRingEquiv K n e b) := by
  apply (maximalIdealPowSuccQuotMk_eq_iff K n _ _).2
  rw [mem_maximalIdealPowSuccSubmodule_iff]
  change e (a : 𝒪[K]) - e (b : 𝒪[K]) ∈
    (𝓂[K] ^ (n + 1) : Ideal 𝒪[K])
  rw [← map_sub]
  exact (integerRingEquiv_mem_maximalIdeal_pow K e (n + 1)
    ((a - b : (𝓂[K] ^ n : Ideal 𝒪[K])) : 𝒪[K])).2
      ((mem_maximalIdealPowSuccSubmodule_iff K n (a - b)).1 hab)
 
def maximalIdealPowSuccQuotMapOfIntegerRingEquiv
    (K : Type u) [Field K] [ValuativeRel K]
    (n : Nat) (e : 𝒪[K] ≃+* 𝒪[K]) :
    MaximalIdealPowSuccQuot K n →+ MaximalIdealPowSuccQuot K n := by
  let f : MaximalIdealPowSuccQuot K n → MaximalIdealPowSuccQuot K n :=
    maximalIdealPowSuccQuotLift n
      (fun a => maximalIdealPowSuccQuotMk K n
        (maximalIdealPowMapEquivOfIntegerRingEquiv K n e a))
      (maximalIdealPowSuccQuotMapOfIntegerRingEquiv_respects K n e)
  refine
    { toFun := f
      map_zero' := ?_
      map_add' := ?_ }
  · change f 0 = 0
    rw [← map_zero (maximalIdealPowSuccQuotMk K n)]
    dsimp only [f]
    rw [maximalIdealPowSuccQuotLift_mk, map_zero, map_zero]
  · intro x y
    change f (x + y) = f x + f y
    refine MaximalIdealPowSuccQuot.inductionOn₂ n
      (motive := fun x' y' => f (x' + y') = f x' + f y') x y ?_
    intro a b
    rw [← map_add (maximalIdealPowSuccQuotMk K n)]
    dsimp only [f]
    rw [maximalIdealPowSuccQuotLift_mk,
      maximalIdealPowSuccQuotLift_mk,
      maximalIdealPowSuccQuotLift_mk, map_add, map_add]
 

theorem maximalIdealPowSuccQuotMapOfIntegerRingEquiv_mk
    (K : Type u) [Field K] [ValuativeRel K]
    (n : Nat) (e : 𝒪[K] ≃+* 𝒪[K])
    (a : ((𝓂[K] ^ n : Ideal 𝒪[K]) : Type u)) :
    maximalIdealPowSuccQuotMapOfIntegerRingEquiv K n e
        (maximalIdealPowSuccQuotMk K n a) =
      maximalIdealPowSuccQuotMk K n
        (maximalIdealPowMapEquivOfIntegerRingEquiv K n e a) := by
  change maximalIdealPowSuccQuotLift n
      (fun b => maximalIdealPowSuccQuotMk K n
        (maximalIdealPowMapEquivOfIntegerRingEquiv K n e b))
      (maximalIdealPowSuccQuotMapOfIntegerRingEquiv_respects K n e)
      (maximalIdealPowSuccQuotMk K n a) =
    maximalIdealPowSuccQuotMk K n
      (maximalIdealPowMapEquivOfIntegerRingEquiv K n e a)
  exact maximalIdealPowSuccQuotLift_mk n _ _ a
 
def maximalIdealPowSuccQuotMapEquivOfIntegerRingEquiv
    (K : Type u) [Field K] [ValuativeRel K]
    (n : Nat) (e : 𝒪[K] ≃+* 𝒪[K]) :
    MaximalIdealPowSuccQuot K n ≃+ MaximalIdealPowSuccQuot K n where
  toFun := maximalIdealPowSuccQuotMapOfIntegerRingEquiv K n e
  invFun := maximalIdealPowSuccQuotMapOfIntegerRingEquiv K n e.symm
  left_inv := by
    intro x
    refine MaximalIdealPowSuccQuot.inductionOn n
      (motive := fun x' =>
        maximalIdealPowSuccQuotMapOfIntegerRingEquiv K n e.symm
            (maximalIdealPowSuccQuotMapOfIntegerRingEquiv K n e x') = x')
      x ?_
    intro a
    rw [maximalIdealPowSuccQuotMapOfIntegerRingEquiv_mk,
      maximalIdealPowSuccQuotMapOfIntegerRingEquiv_mk]
    have h := (maximalIdealPowMapEquivOfIntegerRingEquiv K n e).left_inv a
    exact congrArg (maximalIdealPowSuccQuotMk K n) h
  right_inv := by
    intro x
    refine MaximalIdealPowSuccQuot.inductionOn n
      (motive := fun x' =>
        maximalIdealPowSuccQuotMapOfIntegerRingEquiv K n e
            (maximalIdealPowSuccQuotMapOfIntegerRingEquiv K n e.symm x') = x')
      x ?_
    intro a
    rw [maximalIdealPowSuccQuotMapOfIntegerRingEquiv_mk,
      maximalIdealPowSuccQuotMapOfIntegerRingEquiv_mk]
    have h := (maximalIdealPowMapEquivOfIntegerRingEquiv K n e).right_inv a
    exact congrArg (maximalIdealPowSuccQuotMk K n) h
  map_add' := by
    intro x y
    exact map_add (maximalIdealPowSuccQuotMapOfIntegerRingEquiv K n e) x y
 
theorem principalUnits_integerRingEquiv_mem_self
    (K : Type u) [Field K] [ValuativeRel K]
    (n : Nat) (e : 𝒪[K] ≃+* 𝒪[K]) (u : 𝒪[K]ˣ)
    (hu : u ∈ principalUnits K n) :
    Units.mapEquiv e.toMulEquiv u ∈ principalUnits K n :=
  principalUnits_integerRingEquiv_mem K n e
    (fun x hx => (integerRingEquiv_mem_maximalIdeal_pow K e n x).2 hx) u hu
 
def principalUnitsMapEquivOfIntegerRingEquiv
    (K : Type u) [Field K] [ValuativeRel K]
    (n : Nat) (e : 𝒪[K] ≃+* 𝒪[K]) :
    principalUnits K n ≃* principalUnits K n where
  toFun u :=
    ⟨Units.mapEquiv e.toMulEquiv u.1,
      principalUnits_integerRingEquiv_mem_self K n e u.1 u.2⟩
  invFun u :=
    ⟨Units.mapEquiv e.symm.toMulEquiv u.1,
      principalUnits_integerRingEquiv_mem_self K n e.symm u.1 u.2⟩
  left_inv := by
    intro u
    ext
    simp
  right_inv := by
    intro u
    ext
    simp
  map_mul' := by
    intro a b
    ext
    simp
 
def principalUnitsSuccQuotMapOfIntegerRingEquiv
    (K : Type u) [Field K] [ValuativeRel K]
    (n : Nat) (e : 𝒪[K] ≃+* 𝒪[K]) :
    PrincipalUnitsSuccQuot K n →* PrincipalUnitsSuccQuot K n :=
  principalUnitsSuccQuotLift n
    ((principalUnitsSuccQuotMk K n).comp
      (principalUnitsMapEquivOfIntegerRingEquiv K n e).toMonoidHom)
    (by
      intro u hu
      rw [MonoidHom.mem_ker, MonoidHom.comp_apply,
        principalUnitsSuccQuotMk_eq_one_iff]
      exact principalUnits_integerRingEquiv_mem_self K (n + 1) e u.1 hu)
 

theorem principalUnitsSuccQuotMapOfIntegerRingEquiv_apply
    (K : Type u) [Field K] [ValuativeRel K]
    (n : Nat) (e : 𝒪[K] ≃+* 𝒪[K]) (u : principalUnits K n) :
    principalUnitsSuccQuotMapOfIntegerRingEquiv K n e
        (principalUnitsSuccQuotMk K n u) =
      principalUnitsSuccQuotMk K n
        (principalUnitsMapEquivOfIntegerRingEquiv K n e u) :=
  rfl
 
def principalUnitsSuccQuotMapEquivOfIntegerRingEquiv
    (K : Type u) [Field K] [ValuativeRel K]
    (n : Nat) (e : 𝒪[K] ≃+* 𝒪[K]) :
    PrincipalUnitsSuccQuot K n ≃* PrincipalUnitsSuccQuot K n where
  toFun := principalUnitsSuccQuotMapOfIntegerRingEquiv K n e
  invFun := principalUnitsSuccQuotMapOfIntegerRingEquiv K n e.symm
  left_inv := by
    intro x
    refine PrincipalUnitsSuccQuot.inductionOn n
      (motive := fun x' =>
        principalUnitsSuccQuotMapOfIntegerRingEquiv K n e.symm
            (principalUnitsSuccQuotMapOfIntegerRingEquiv K n e x') = x')
      x ?_
    intro u
    rw [principalUnitsSuccQuotMapOfIntegerRingEquiv_apply,
      principalUnitsSuccQuotMapOfIntegerRingEquiv_apply]
    have h := (principalUnitsMapEquivOfIntegerRingEquiv K n e).left_inv u
    exact congrArg
      (fun z : principalUnits K n =>
        principalUnitsSuccQuotMk K n z) h
  right_inv := by
    intro x
    refine PrincipalUnitsSuccQuot.inductionOn n
      (motive := fun x' =>
        principalUnitsSuccQuotMapOfIntegerRingEquiv K n e
            (principalUnitsSuccQuotMapOfIntegerRingEquiv K n e.symm x') = x')
      x ?_
    intro u
    rw [principalUnitsSuccQuotMapOfIntegerRingEquiv_apply,
      principalUnitsSuccQuotMapOfIntegerRingEquiv_apply]
    have h := (principalUnitsMapEquivOfIntegerRingEquiv K n e).right_inv u
    exact congrArg
      (fun z : principalUnits K n =>
        principalUnitsSuccQuotMk K n z) h
  map_mul' := by
    intro x y
    exact map_mul (principalUnitsSuccQuotMapOfIntegerRingEquiv K n e) x y
 

def principalUnitsSuccQuotAddEquivOfIntegerRingEquiv
    (K : Type u) [Field K] [ValuativeRel K]
    (n : Nat) (e : 𝒪[K] ≃+* 𝒪[K]) :
    Additive (PrincipalUnitsSuccQuot K n) ≃+
      Additive (PrincipalUnitsSuccQuot K n) where
  toFun x :=
    Additive.ofMul
      (principalUnitsSuccQuotMapEquivOfIntegerRingEquiv K n e (Additive.toMul x))
  invFun x :=
    Additive.ofMul
      (principalUnitsSuccQuotMapEquivOfIntegerRingEquiv K n e.symm (Additive.toMul x))
  left_inv := by
    intro x
    change Additive.ofMul
        (principalUnitsSuccQuotMapEquivOfIntegerRingEquiv K n e.symm
          (principalUnitsSuccQuotMapEquivOfIntegerRingEquiv K n e (Additive.toMul x))) =
      Additive.ofMul (Additive.toMul x)
    exact congrArg Additive.ofMul
      ((principalUnitsSuccQuotMapEquivOfIntegerRingEquiv K n e).left_inv
        (Additive.toMul x))
  right_inv := by
    intro x
    change Additive.ofMul
        (principalUnitsSuccQuotMapEquivOfIntegerRingEquiv K n e
          (principalUnitsSuccQuotMapEquivOfIntegerRingEquiv K n e.symm
            (Additive.toMul x))) =
      Additive.ofMul (Additive.toMul x)
    exact congrArg Additive.ofMul
      ((principalUnitsSuccQuotMapEquivOfIntegerRingEquiv K n e).right_inv
        (Additive.toMul x))
  map_add' := by
    intro x y
    change Additive.ofMul
        (principalUnitsSuccQuotMapEquivOfIntegerRingEquiv K n e
          (Additive.toMul (x + y))) =
      Additive.ofMul
        (principalUnitsSuccQuotMapEquivOfIntegerRingEquiv K n e (Additive.toMul x) *
          principalUnitsSuccQuotMapEquivOfIntegerRingEquiv K n e (Additive.toMul y))
    rw [show Additive.toMul (x + y) = Additive.toMul x * Additive.toMul y from rfl]
    rw [map_mul]
 

@[simp]
theorem principalUnitsSuccQuotAddEquivOfIntegerRingEquiv_apply
    (K : Type u) [Field K] [ValuativeRel K]
    (n : Nat) (e : 𝒪[K] ≃+* 𝒪[K]) (x : PrincipalUnitsSuccQuot K n) :
    principalUnitsSuccQuotAddEquivOfIntegerRingEquiv K n e (Additive.ofMul x) =
      Additive.ofMul (principalUnitsSuccQuotMapEquivOfIntegerRingEquiv K n e x) :=
  rfl
 

def maximalIdealPowSuccQuotMultiplicativeMapEquivOfIntegerRingEquiv
    (K : Type u) [Field K] [ValuativeRel K]
    (n : Nat) (e : 𝒪[K] ≃+* 𝒪[K]) :
    Multiplicative (MaximalIdealPowSuccQuot K n) ≃*
      Multiplicative (MaximalIdealPowSuccQuot K n) where
  toFun x :=
    Multiplicative.ofAdd
      (maximalIdealPowSuccQuotMapEquivOfIntegerRingEquiv K n e
        (Multiplicative.toAdd x))
  invFun x :=
    Multiplicative.ofAdd
      (maximalIdealPowSuccQuotMapEquivOfIntegerRingEquiv K n e.symm
        (Multiplicative.toAdd x))
  left_inv := by
    intro x
    change Multiplicative.ofAdd
        (maximalIdealPowSuccQuotMapEquivOfIntegerRingEquiv K n e.symm
          (maximalIdealPowSuccQuotMapEquivOfIntegerRingEquiv K n e
            (Multiplicative.toAdd x))) =
      Multiplicative.ofAdd (Multiplicative.toAdd x)
    exact congrArg Multiplicative.ofAdd
      ((maximalIdealPowSuccQuotMapEquivOfIntegerRingEquiv K n e).left_inv
        (Multiplicative.toAdd x))
  right_inv := by
    intro x
    change Multiplicative.ofAdd
        (maximalIdealPowSuccQuotMapEquivOfIntegerRingEquiv K n e
          (maximalIdealPowSuccQuotMapEquivOfIntegerRingEquiv K n e.symm
            (Multiplicative.toAdd x))) =
      Multiplicative.ofAdd (Multiplicative.toAdd x)
    exact congrArg Multiplicative.ofAdd
      ((maximalIdealPowSuccQuotMapEquivOfIntegerRingEquiv K n e).right_inv
        (Multiplicative.toAdd x))
  map_mul' := by
    intro x y
    change Multiplicative.ofAdd
        (maximalIdealPowSuccQuotMapEquivOfIntegerRingEquiv K n e
          (Multiplicative.toAdd (x * y))) =
      Multiplicative.ofAdd
        (maximalIdealPowSuccQuotMapEquivOfIntegerRingEquiv K n e
          (Multiplicative.toAdd x) +
        maximalIdealPowSuccQuotMapEquivOfIntegerRingEquiv K n e
          (Multiplicative.toAdd y))
    rw [show Multiplicative.toAdd (x * y) =
        Multiplicative.toAdd x + Multiplicative.toAdd y from rfl]
    rw [map_add]
 

@[simp]
theorem maximalIdealPowSuccQuotMultiplicativeMapEquivOfIntegerRingEquiv_apply
    (K : Type u) [Field K] [ValuativeRel K]
    (n : Nat) (e : 𝒪[K] ≃+* 𝒪[K]) (x : MaximalIdealPowSuccQuot K n) :
    maximalIdealPowSuccQuotMultiplicativeMapEquivOfIntegerRingEquiv K n e
        (Multiplicative.ofAdd x) =
      Multiplicative.ofAdd (maximalIdealPowSuccQuotMapEquivOfIntegerRingEquiv K n e x) :=
  rfl
end
end LocalFieldTheory
end

/- ValuedFieldTheory.LocalField.NonarchimedeanLocalField.AdditiveEquiv -/
section
namespace LocalFieldTheory
noncomputable section
universe u
 
def additiveEquivOfMulEquiv {A B : Type u} [Group A] [Group B] (e : A ≃* B) :
    Additive A ≃+ Additive B where
  toFun := fun a => Additive.ofMul (e (Additive.toMul a))
  invFun := fun b => Additive.ofMul (e.symm (Additive.toMul b))
  left_inv := by
    intro a
    simp
  right_inv := by
    intro b
    simp
  map_add' := by
    intro a b
    ext
    exact e.map_mul _ _
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
 

@[simp]
theorem residueUnitsConcreteEquiv_apply
    (K : Type u) [Field K] [ValuativeRel K] (u : ResidueUnits K) :
    residueUnitsConcreteEquiv K u = u :=
  rfl
 
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
 
abbrev integerUnitsModPrincipalUnitsMk
    (K : Type u) [Field K] [ValuativeRel K] :
    𝒪[K]ˣ →* IntegerUnitsModPrincipalUnits K := by
  change 𝒪[K]ˣ →* (𝒪[K]ˣ ⧸ principalUnits K 1)
  exact QuotientGroup.mk' (principalUnits K 1)
 

@[simp]
theorem integerUnitsModPrincipalUnitsConcreteEquiv_mk
    (K : Type u) [Field K] [ValuativeRel K] (x : 𝒪[K]ˣ) :
    integerUnitsModPrincipalUnitsConcreteEquiv K
        (integerUnitsModPrincipalUnitsMk K x) =
      QuotientGroup.mk x :=
  rfl
 
protected theorem IntegerUnitsModPrincipalUnits.inductionOn
    {K : Type u} [Field K] [ValuativeRel K]
    {motive : IntegerUnitsModPrincipalUnits K → Prop}
    (q : IntegerUnitsModPrincipalUnits K)
    (h : ∀ x : 𝒪[K]ˣ, motive (integerUnitsModPrincipalUnitsMk K x)) :
    motive q := by
  change motive (show 𝒪[K]ˣ ⧸ principalUnits K 1 from q)
  refine QuotientGroup.induction_on q ?_
  intro x
  exact h x
 
def integerUnitsModPrincipalUnitsLift
    {K : Type u} {M : Type*} [Field K] [ValuativeRel K] [Group M]
    (f : 𝒪[K]ˣ →* M) (h : principalUnits K 1 ≤ f.ker) :
    IntegerUnitsModPrincipalUnits K →* M := by
  change (𝒪[K]ˣ ⧸ principalUnits K 1) →* M
  exact QuotientGroup.lift (principalUnits K 1) f h
 

@[simp]
theorem integerUnitsModPrincipalUnitsLift_mk
    {K : Type u} {M : Type*} [Field K] [ValuativeRel K] [Group M]
    (f : 𝒪[K]ˣ →* M) (h : principalUnits K 1 ≤ f.ker) (x : 𝒪[K]ˣ) :
    integerUnitsModPrincipalUnitsLift f h
        (integerUnitsModPrincipalUnitsMk K x) = f x :=
  rfl
 
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
 
theorem integerUnitsToResidueUnits_eq_one_iff_mem_principalUnits_one
    (K : Type u) [Field K] [ValuativeRel K] (x : 𝒪[K]ˣ) :
    integerUnitsToResidueUnits K x = 1 ↔ x ∈ principalUnits K 1 := by
  rw [principalUnits_one_eq_ker_integerUnitsToResidueUnits K, MonoidHom.mem_ker]
 
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
 

@[simp]
theorem integerUnitsModPrincipalUnitsEquivResidueUnits_mk
    (K : Type u) [Field K] [ValuativeRel K] (x : 𝒪[K]ˣ) :
    integerUnitsModPrincipalUnitsEquivResidueUnits K
        (integerUnitsModPrincipalUnitsMk K x) =
      integerUnitsToResidueUnits K x := by
  simp only [integerUnitsModPrincipalUnitsEquivResidueUnits, MulEquiv.trans_apply,
    integerUnitsModPrincipalUnitsConcreteEquiv_mk,
    QuotientGroup.quotientMulEquivOfEq_mk]
  rw [QuotientGroup.quotientKerEquivOfSurjective,
    QuotientGroup.quotientKerEquivOfRightInverse_apply,
    QuotientGroup.kerLift_mk]
 
def integerUnitsModPrincipalUnitsAddEquivResidueUnits
    (K : Type u) [Field K] [ValuativeRel K] :
    Additive (IntegerUnitsModPrincipalUnits K) ≃+ Additive (ResidueUnits K) :=
  additiveEquivOfMulEquiv (integerUnitsModPrincipalUnitsEquivResidueUnits K)
 
theorem IntegerUnitsModPrincipalUnits_mk_eq_mk_iff
    (K : Type u) [Field K] [ValuativeRel K] (x y : 𝒪[K]ˣ) :
    integerUnitsModPrincipalUnitsMk K x =
        integerUnitsModPrincipalUnitsMk K y ↔
      x / y ∈ principalUnits K 1 :=
  by
    change (QuotientGroup.mk x : 𝒪[K]ˣ ⧸ principalUnits K 1) =
      QuotientGroup.mk y ↔ _
    exact QuotientGroup.eq_iff_div_mem (N := principalUnits K 1)
 
theorem IntegerUnitsModPrincipalUnits_mk_eq_one_iff
    (K : Type u) [Field K] [ValuativeRel K] (x : 𝒪[K]ˣ) :
    integerUnitsModPrincipalUnitsMk K x = 1 ↔
      x ∈ principalUnits K 1 :=
  by
    change (QuotientGroup.mk x : 𝒪[K]ˣ ⧸ principalUnits K 1) = 1 ↔ _
    exact QuotientGroup.eq_one_iff (N := principalUnits K 1) x
 
@[simp]
theorem integerUnitsModPrincipalUnitsAddEquivResidueUnits_mk
    (K : Type u) [Field K] [ValuativeRel K] (x : 𝒪[K]ˣ) :
    integerUnitsModPrincipalUnitsAddEquivResidueUnits K
        (Additive.ofMul (integerUnitsModPrincipalUnitsMk K x)) =
      Additive.ofMul (integerUnitsToResidueUnits K x) := by
  exact congrArg Additive.ofMul
    (integerUnitsModPrincipalUnitsEquivResidueUnits_mk K x)
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
 
instance integerRingMapOfValuationExtension_isLocalHom (K L : Type u)
    [Field K] [ValuativeRel K] [Field L] [ValuativeRel L] [Algebra K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)] :
    IsLocalHom (integerRingMapOfValuationExtension K L) := by
  change IsLocalHom (algebraMap 𝒪[K] 𝒪[L])
  infer_instance
 
@[simp]
theorem integerRingMapOfValuationExtension_apply (K L : Type u)
    [Field K] [ValuativeRel K] [Field L] [ValuativeRel L] [Algebra K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    (x : 𝒪[K]) :
    integerRingMapOfValuationExtension K L x = algebraMap 𝒪[K] 𝒪[L] x :=
  rfl
 


def residueFieldMapOfValuationExtension (K L : Type u) [Field K] [ValuativeRel K]
    [Field L] [ValuativeRel L] [Algebra K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)] :
    𝓀[K] →+* 𝓀[L] :=
  IsLocalRing.ResidueField.map (integerRingMapOfValuationExtension K L)
 

theorem residueFieldMapOfValuationExtension_eq_algebraMap (K L : Type u)
    [Field K] [ValuativeRel K] [Field L] [ValuativeRel L] [Algebra K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)] :
    residueFieldMapOfValuationExtension K L = algebraMap 𝓀[K] 𝓀[L] :=
  rfl
 

@[simp]
theorem residueFieldMapOfValuationExtension_residue (K L : Type u)
    [Field K] [ValuativeRel K] [Field L] [ValuativeRel L] [Algebra K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    (x : 𝒪[K]) :
    residueFieldMapOfValuationExtension K L (IsLocalRing.residue 𝒪[K] x) =
      IsLocalRing.residue 𝒪[L] (integerRingMapOfValuationExtension K L x) :=
  rfl
 
@[simp]
theorem residueField_algebraMap_residue (K L : Type u)
    [Field K] [ValuativeRel K] [Field L] [ValuativeRel L] [Algebra K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    (x : 𝒪[K]) :
    algebraMap 𝓀[K] 𝓀[L] (IsLocalRing.residue 𝒪[K] x) =
      IsLocalRing.residue 𝒪[L] (algebraMap 𝒪[K] 𝒪[L] x) :=
  rfl
 
def residueUnitsMapOfValuationExtension (K L : Type u) [Field K] [ValuativeRel K]
    [Field L] [ValuativeRel L] [Algebra K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)] :
    𝓀[K]ˣ →* 𝓀[L]ˣ :=
  Units.map (residueFieldMapOfValuationExtension K L)
 

@[simp]
theorem residueUnitsMapOfValuationExtension_apply (K L : Type u)
    [Field K] [ValuativeRel K] [Field L] [ValuativeRel L] [Algebra K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    (u : 𝓀[K]ˣ) :
    ((residueUnitsMapOfValuationExtension K L u : 𝓀[L]ˣ) : 𝓀[L]) =
      algebraMap 𝓀[K] 𝓀[L] (u : 𝓀[K]) :=
  rfl
 
theorem residueUnitsMapOfValuationExtension_injective (K L : Type u)
    [Field K] [ValuativeRel K] [Field L] [ValuativeRel L] [Algebra K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)] :
    Function.Injective (residueUnitsMapOfValuationExtension K L) :=
  Units.map_injective (RingHom.injective (residueFieldMapOfValuationExtension K L))
 
def integerUnitsMapOfValuationExtension (K L : Type u) [Field K] [ValuativeRel K]
    [Field L] [ValuativeRel L] [Algebra K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)] :
    𝒪[K]ˣ →* 𝒪[L]ˣ :=
  Units.map (integerRingMapOfValuationExtension K L).toMonoidHom
 

@[simp]
theorem integerUnitsMapOfValuationExtension_apply (K L : Type u)
    [Field K] [ValuativeRel K] [Field L] [ValuativeRel L] [Algebra K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    (u : 𝒪[K]ˣ) :
    ((integerUnitsMapOfValuationExtension K L u : 𝒪[L]ˣ) : 𝒪[L]) =
      integerRingMapOfValuationExtension K L (u : 𝒪[K]) :=
  rfl
 

@[simp]
theorem residueUnitsMap_integerUnitsToResidueUnits (K L : Type u)
    [Field K] [ValuativeRel K] [Field L] [ValuativeRel L] [Algebra K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    (u : 𝒪[K]ˣ) :
    residueUnitsMapOfValuationExtension K L (integerUnitsToResidueUnits K u) =
      integerUnitsToResidueUnits L (integerUnitsMapOfValuationExtension K L u) := by
  ext
  rfl
 
theorem integerUnitsMapOfValuationExtension_mem_principalUnits_one (K L : Type u)
    [Field K] [ValuativeRel K] [Field L] [ValuativeRel L] [Algebra K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    (u : 𝒪[K]ˣ) (hu : u ∈ principalUnits K 1) :
    integerUnitsMapOfValuationExtension K L u ∈ principalUnits L 1 := by
  rw [← integerUnitsToResidueUnits_eq_one_iff_mem_principalUnits_one L]
  rw [← residueUnitsMap_integerUnitsToResidueUnits K L u]
  rw [(integerUnitsToResidueUnits_eq_one_iff_mem_principalUnits_one K u).2 hu]
  exact map_one (residueUnitsMapOfValuationExtension K L)
 
def integerUnitsModPrincipalUnitsMapOfValuationExtension (K L : Type u)
    [Field K] [ValuativeRel K] [Field L] [ValuativeRel L] [Algebra K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)] :
    IntegerUnitsModPrincipalUnits K →* IntegerUnitsModPrincipalUnits L :=
  integerUnitsModPrincipalUnitsLift
    ((integerUnitsModPrincipalUnitsMk L).comp
      (integerUnitsMapOfValuationExtension K L))
    (by
      intro u hu
      rw [MonoidHom.mem_ker, MonoidHom.comp_apply,
        IntegerUnitsModPrincipalUnits_mk_eq_one_iff]
      exact integerUnitsMapOfValuationExtension_mem_principalUnits_one K L u hu)
 
@[simp]
theorem integerUnitsModPrincipalUnitsMapOfValuationExtension_mk (K L : Type u)
    [Field K] [ValuativeRel K] [Field L] [ValuativeRel L] [Algebra K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    (u : 𝒪[K]ˣ) :
    integerUnitsModPrincipalUnitsMapOfValuationExtension K L
        (integerUnitsModPrincipalUnitsMk K u) =
      integerUnitsModPrincipalUnitsMk L
        (integerUnitsMapOfValuationExtension K L u) :=
  rfl
 




def integerUnitsModPrincipalUnitsResidueNormOfValuationExtension (K L : Type u)
    [Field K] [ValuativeRel K] [Field L] [ValuativeRel L] [Algebra K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)] :
    IntegerUnitsModPrincipalUnits L →* IntegerUnitsModPrincipalUnits K :=
  (integerUnitsModPrincipalUnitsEquivResidueUnits K).symm.toMonoidHom.comp
    ((Units.map (Algebra.norm 𝓀[K] (S := 𝓀[L]))).comp
      (integerUnitsModPrincipalUnitsEquivResidueUnits L).toMonoidHom)
 

theorem integerUnitsModPrincipalUnitsResidueNorm_residue (K L : Type u)
    [Field K] [ValuativeRel K] [Field L] [ValuativeRel L] [Algebra K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    (x : IntegerUnitsModPrincipalUnits L) :
    integerUnitsModPrincipalUnitsEquivResidueUnits K
        (integerUnitsModPrincipalUnitsResidueNormOfValuationExtension K L x) =
      Units.map (Algebra.norm 𝓀[K] (S := 𝓀[L]))
        (integerUnitsModPrincipalUnitsEquivResidueUnits L x) := by
  change
    integerUnitsModPrincipalUnitsEquivResidueUnits K
        ((integerUnitsModPrincipalUnitsEquivResidueUnits K).symm
          (Units.map (Algebra.norm 𝓀[K] (S := 𝓀[L]))
            (integerUnitsModPrincipalUnitsEquivResidueUnits L x))) =
      Units.map (Algebra.norm 𝓀[K] (S := 𝓀[L]))
        (integerUnitsModPrincipalUnitsEquivResidueUnits L x)
  exact (integerUnitsModPrincipalUnitsEquivResidueUnits K).apply_symm_apply _
 

theorem residueUnitsMap_residueField_norm_eq_prod_algEquiv (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    (u : 𝓀[L]ˣ) :
    residueUnitsMapOfValuationExtension K L
        (Units.map (Algebra.norm 𝓀[K] (S := 𝓀[L])) u) =
      Finset.univ.prod (fun τ : 𝓀[L] ≃ₐ[𝓀[K]] 𝓀[L] =>
        Units.mapEquiv τ.toMulEquiv u) := by
  ext
  change algebraMap 𝓀[K] 𝓀[L] (Algebra.norm 𝓀[K] (u : 𝓀[L])) =
    ↑(Finset.univ.prod (fun τ : 𝓀[L] ≃ₐ[𝓀[K]] 𝓀[L] =>
      Units.mapEquiv τ.toMulEquiv u))
  rw [Algebra.norm_eq_prod_automorphisms]
  simp
 

theorem integerUnitsModPrincipalUnitsResidueNorm_base_extend_eq_prod_algEquiv
    (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    (x : IntegerUnitsModPrincipalUnits L) :
    residueUnitsMapOfValuationExtension K L
        (integerUnitsModPrincipalUnitsEquivResidueUnits K
          (integerUnitsModPrincipalUnitsResidueNormOfValuationExtension K L x)) =
      Finset.univ.prod (fun τ : 𝓀[L] ≃ₐ[𝓀[K]] 𝓀[L] =>
        Units.mapEquiv τ.toMulEquiv (integerUnitsModPrincipalUnitsEquivResidueUnits L x)) := by
  rw [integerUnitsModPrincipalUnitsResidueNorm_residue]
  exact residueUnitsMap_residueField_norm_eq_prod_algEquiv K L
    (integerUnitsModPrincipalUnitsEquivResidueUnits L x)
 

theorem residueAlgEquiv_card_eq_finrank (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)] :
    Nat.card (𝓀[L] ≃ₐ[𝓀[K]] 𝓀[L]) = Module.finrank 𝓀[K] 𝓀[L] :=
  IsGalois.card_aut_eq_finrank (F := 𝓀[K]) (E := 𝓀[L])
 


theorem maximalIdeal_inertiaDeg_eq_residue_finrank (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)] :
    Ideal.inertiaDeg' (𝓂[K] : Ideal 𝒪[K]) (𝓂[L] : Ideal 𝒪[L]) =
      Module.finrank 𝓀[K] 𝓀[L] := by
  rw [Ideal.inertiaDeg'_algebraMap]
  rfl
 


theorem integerRing_moduleFinite_of_isIntegralClosure (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [Algebra K L] [FiniteDimensional K L]
    [Algebra.IsSeparable K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [IsIntegralClosure 𝒪[L] 𝒪[K] L] :
    Module.Finite 𝒪[K] 𝒪[L] :=
  IsIntegralClosure.finite 𝒪[K] K L 𝒪[L]
 

theorem maximalIdeal_ramificationIdx_mul_inertiaDeg_eq_finrank (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [Module.Finite 𝒪[K] 𝒪[L]] :
    Ideal.ramificationIdx' (𝓂[K] : Ideal 𝒪[K]) (𝓂[L] : Ideal 𝒪[L]) *
      Ideal.inertiaDeg' (𝓂[K] : Ideal 𝒪[K]) (𝓂[L] : Ideal 𝒪[L]) =
        Module.finrank K L := by
  classical
  have := FaithfulSMul.of_field_isFractionRing 𝒪[K] 𝒪[L] K L
  have hp := IsDiscreteValuationRing.not_a_field 𝒪[K]
  have hprimes := IsLocalRing.primesOver_eq (A := 𝒪[L]) hp
  have hq (q : (𝓂[K] : Ideal 𝒪[K]).primesOver 𝒪[L]) :
      (q : Ideal 𝒪[L]) = 𝓂[L] :=
    Set.mem_singleton_iff.mp (hprimes ▸ q.property)
  let : Unique ((𝓂[K] : Ideal 𝒪[K]).primesOver 𝒪[L]) :=
    { default := ⟨𝓂[L], hprimes ▸ Set.mem_singleton _⟩
      uniq := fun q => Subtype.ext (Set.mem_singleton_iff.mp (hprimes ▸ q.property)) }
  rw [Ideal.ramificationIdx'_eq_ramificationIdx _ _ hp,
    Ideal.inertiaDeg'_eq_inertiaDeg,
    IsFractionRing.finrank_eq 𝒪[K] K 𝒪[L] L]
  simpa only [Fintype.sum_unique, hq] using
    (Ideal.sum_ramification_inertia_eq_finrank (𝓂[K] : Ideal 𝒪[K]) 𝒪[L])
 

theorem maximalIdeal_ramificationIdx_mul_residue_finrank_eq_finrank
    (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [Module.Finite 𝒪[K] 𝒪[L]] :
    Ideal.ramificationIdx' (𝓂[K] : Ideal 𝒪[K]) (𝓂[L] : Ideal 𝒪[L]) *
      Module.finrank 𝓀[K] 𝓀[L] =
        Module.finrank K L := by
  rw [← maximalIdeal_inertiaDeg_eq_residue_finrank K L]
  exact maximalIdeal_ramificationIdx_mul_inertiaDeg_eq_finrank K L
 
theorem residueFieldAlgebra_isSeparable_of_valuationExtension (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)] :
    Algebra.IsSeparable 𝓀[K] 𝓀[L] := by
  infer_instance
 

theorem residueField_trace_surjective_of_valuationExtension (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)] :
    Function.Surjective (Algebra.trace 𝓀[K] 𝓀[L]) := by
  let : Algebra.IsSeparable 𝓀[K] 𝓀[L] :=
    residueFieldAlgebra_isSeparable_of_valuationExtension K L
  exact Algebra.trace_surjective 𝓀[K] 𝓀[L]
 

theorem residueField_units_norm_surjective_of_valuationExtension (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)] :
    Function.Surjective (Units.map (Algebra.norm 𝓀[K] (S := 𝓀[L]))) := by
  let := Fintype.ofFinite 𝓀[K]
  exact FiniteField.unitsMap_norm_surjective 𝓀[K] 𝓀[L]
 
theorem integerUnitsModPrincipalUnitsResidueNorm_surjective_of_valuationExtension
    (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)] :
    Function.Surjective
      (integerUnitsModPrincipalUnitsResidueNormOfValuationExtension K L) := by
  intro y
  obtain ⟨v, hv⟩ := residueField_units_norm_surjective_of_valuationExtension K L
    (integerUnitsModPrincipalUnitsEquivResidueUnits K y)
  refine ⟨(integerUnitsModPrincipalUnitsEquivResidueUnits L).symm v, ?_⟩
  apply (integerUnitsModPrincipalUnitsEquivResidueUnits K).injective
  rw [integerUnitsModPrincipalUnitsResidueNorm_residue]
  exact (congrArg (Units.map (Algebra.norm 𝓀[K] (S := 𝓀[L])))
    ((integerUnitsModPrincipalUnitsEquivResidueUnits L).apply_symm_apply v)).trans hv
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
 
@[simp]
theorem galoisGroupIntegerRingEquivOfIsIntegralClosure_symm_apply
    (K L : Type u) [Field K] [ValuativeRel K] [Field L] [ValuativeRel L]
    [Algebra K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [IsIntegralClosure 𝒪[L] 𝒪[K] L]
    (σ : Gal(L / K)) (x : 𝒪[L]) :
    (((galoisGroupIntegerRingEquivOfIsIntegralClosure K L σ).symm x : 𝒪[L]) : L) =
      σ.symm (x : L) :=
  rfl
 

def galoisGroupIntegerRingEquivHomOfIsIntegralClosure
    (K L : Type u) [Field K] [ValuativeRel K] [Field L] [ValuativeRel L]
    [Algebra K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [IsIntegralClosure 𝒪[L] 𝒪[K] L] :
    Gal(L / K) →* (𝒪[L] ≃+* 𝒪[L]) where
  toFun := galoisGroupIntegerRingEquivOfIsIntegralClosure K L
  map_one' := by
    ext x
    rfl
  map_mul' := by
    intro σ τ
    ext x
    rfl
 

abbrev galoisGroupIntegerRingMulSemiringActionOfIsIntegralClosure
    (K L : Type u) [Field K] [ValuativeRel K] [Field L] [ValuativeRel L]
    [Algebra K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [IsIntegralClosure 𝒪[L] 𝒪[K] L] :
    MulSemiringAction (Gal(L / K)) 𝒪[L] :=
  MulSemiringAction.compHom 𝒪[L] (galoisGroupIntegerRingEquivHomOfIsIntegralClosure K L)
 

theorem galoisGroupIntegerRingEquivOfIsIntegralClosure_integerRingMap
    (K L : Type u) [Field K] [ValuativeRel K] [Field L] [ValuativeRel L]
    [Algebra K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [IsIntegralClosure 𝒪[L] 𝒪[K] L]
    (σ : Gal(L / K)) (x : 𝒪[K]) :
    galoisGroupIntegerRingEquivOfIsIntegralClosure K L σ
        (integerRingMapOfValuationExtension K L x) =
      integerRingMapOfValuationExtension K L x := by
  ext
  change σ (algebraMap K L (x : K)) = algebraMap K L (x : K)
  exact σ.commutes (x : K)
 

theorem galoisGroupIntegerRingSMulCommClassOfIsIntegralClosure
    (K L : Type u) [Field K] [ValuativeRel K] [Field L] [ValuativeRel L]
    [Algebra K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [IsIntegralClosure 𝒪[L] 𝒪[K] L] :
    letI := galoisGroupIntegerRingMulSemiringActionOfIsIntegralClosure K L
    SMulCommClass (Gal(L / K)) 𝒪[K] 𝒪[L] := by
  let := galoisGroupIntegerRingMulSemiringActionOfIsIntegralClosure K L
  refine ⟨?_⟩
  intro σ x y
  rw [Algebra.smul_def, Algebra.smul_def]
  change galoisGroupIntegerRingEquivOfIsIntegralClosure K L σ
      (algebraMap 𝒪[K] 𝒪[L] x * y) =
    algebraMap 𝒪[K] 𝒪[L] x *
      galoisGroupIntegerRingEquivOfIsIntegralClosure K L σ y
  rw [map_mul]
  have hx : galoisGroupIntegerRingEquivOfIsIntegralClosure K L σ
      (algebraMap 𝒪[K] 𝒪[L] x) = algebraMap 𝒪[K] 𝒪[L] x := by
    simpa [integerRingMapOfValuationExtension] using
      galoisGroupIntegerRingEquivOfIsIntegralClosure_integerRingMap K L σ x
  rw [hx]
 

theorem galoisGroupIntegerRingFieldSMulDistribClassOfIsIntegralClosure
    (K L : Type u) [Field K] [ValuativeRel K] [Field L] [ValuativeRel L]
    [Algebra K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [IsIntegralClosure 𝒪[L] 𝒪[K] L] :
    letI := galoisGroupIntegerRingMulSemiringActionOfIsIntegralClosure K L
    SMulDistribClass (Gal(L / K)) 𝒪[L] L := by
  let := galoisGroupIntegerRingMulSemiringActionOfIsIntegralClosure K L
  refine ⟨?_⟩
  intro σ r s
  change σ (((r : 𝒪[L]) : L) * s) =
    ((galoisGroupIntegerRingEquivOfIsIntegralClosure K L σ r : 𝒪[L]) : L) * σ s
  rw [map_mul]
  rw [galoisGroupIntegerRingEquivOfIsIntegralClosure_apply]
 


theorem galoisGroupIntegerRing_isGaloisGroup_of_isIntegralClosure
    (K L : Type u) [Field K] [ValuativeRel K] [Field L] [ValuativeRel L]
    [Algebra K L] [IsGalois K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [IsIntegralClosure 𝒪[L] 𝒪[K] L] :
    letI := galoisGroupIntegerRingMulSemiringActionOfIsIntegralClosure K L
    IsGaloisGroup (Gal(L / K)) 𝒪[K] 𝒪[L] := by
  let := galoisGroupIntegerRingMulSemiringActionOfIsIntegralClosure K L
  let := galoisGroupIntegerRingFieldSMulDistribClassOfIsIntegralClosure K L
  let : Algebra.IsIntegral 𝒪[K] 𝒪[L] :=
    IsIntegralClosure.isIntegral_algebra 𝒪[K] L
  exact IsGaloisGroup.of_isFractionRing (Gal(L / K)) 𝒪[K] 𝒪[L] K L
 
abbrev galoisGroupIntegerRingIdealDistribMulActionOfIsIntegralClosure
    (K L : Type u) [Field K] [ValuativeRel K] [Field L] [ValuativeRel L]
    [Algebra K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [IsIntegralClosure 𝒪[L] 𝒪[K] L] :
    DistribMulAction (Gal(L / K)) (Ideal 𝒪[L]) := by
  letI := galoisGroupIntegerRingMulSemiringActionOfIsIntegralClosure K L
  exact Ideal.pointwiseDistribMulAction
 

abbrev galoisGroupIntegerRingIdealMulActionOfIsIntegralClosure
    (K L : Type u) [Field K] [ValuativeRel K] [Field L] [ValuativeRel L]
    [Algebra K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [IsIntegralClosure 𝒪[L] 𝒪[K] L] :
    MulAction (Gal(L / K)) (Ideal 𝒪[L]) := by
  exact (galoisGroupIntegerRingIdealDistribMulActionOfIsIntegralClosure K L).toMulAction
 
theorem galoisGroupIntegerRingAction_map_maximalIdeal_of_isIntegralClosure
    (K L : Type u) [Field K] [ValuativeRel K] [Field L] [ValuativeRel L]
    [Algebra K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [IsIntegralClosure 𝒪[L] 𝒪[K] L]
    (σ : Gal(L / K)) :
    Ideal.map (@MulSemiringAction.toRingHom (Gal(L / K)) _ 𝒪[L] _
        (galoisGroupIntegerRingMulSemiringActionOfIsIntegralClosure K L) σ)
      (𝓂[L] : Ideal 𝒪[L]) =
      (𝓂[L] : Ideal 𝒪[L]) := by
  change Ideal.map
      (galoisGroupIntegerRingEquivOfIsIntegralClosure K L σ).toRingHom
      (𝓂[L] : Ideal 𝒪[L]) =
    (𝓂[L] : Ideal 𝒪[L])
  exact integerRingEquiv_map_maximalIdeal L
    (galoisGroupIntegerRingEquivOfIsIntegralClosure K L σ)
 

theorem galoisGroupIntegerRingAction_mem_maximalIdeal_stabilizer_of_isIntegralClosure
    (K L : Type u) [Field K] [ValuativeRel K] [Field L] [ValuativeRel L]
    [Algebra K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [IsIntegralClosure 𝒪[L] 𝒪[K] L]
    (σ : Gal(L / K)) :
    σ ∈ @MulAction.stabilizer (Gal(L / K)) (Ideal 𝒪[L]) _
      (galoisGroupIntegerRingIdealMulActionOfIsIntegralClosure K L)
      (𝓂[L] : Ideal 𝒪[L]) := by
  rw [@MulAction.mem_stabilizer_iff (Gal(L / K)) (Ideal 𝒪[L]) _
    (galoisGroupIntegerRingIdealMulActionOfIsIntegralClosure K L)]
  change Ideal.map (@MulSemiringAction.toRingHom (Gal(L / K)) _ 𝒪[L] _
      (galoisGroupIntegerRingMulSemiringActionOfIsIntegralClosure K L) σ)
        (𝓂[L] : Ideal 𝒪[L]) =
    (𝓂[L] : Ideal 𝒪[L])
  exact galoisGroupIntegerRingAction_map_maximalIdeal_of_isIntegralClosure K L σ
 

def galoisGroupMaximalIdealStabilizerHomOfIsIntegralClosure
    (K L : Type u) [Field K] [ValuativeRel K] [Field L] [ValuativeRel L]
    [Algebra K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [IsIntegralClosure 𝒪[L] 𝒪[K] L] :
    Gal(L / K) →* @MulAction.stabilizer (Gal(L / K)) (Ideal 𝒪[L]) _
      (galoisGroupIntegerRingIdealMulActionOfIsIntegralClosure K L)
      (𝓂[L] : Ideal 𝒪[L]) where
  toFun σ :=
    ⟨σ, galoisGroupIntegerRingAction_mem_maximalIdeal_stabilizer_of_isIntegralClosure K L σ⟩
  map_one' := by
    ext
    rfl
  map_mul' σ τ := by
    ext
    rfl
 

def galoisGroupPrincipalUnitsMapEquivOfIsIntegralClosure
    (K L : Type u) [Field K] [ValuativeRel K] [Field L] [ValuativeRel L]
    [Algebra K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [IsIntegralClosure 𝒪[L] 𝒪[K] L]
    (n : Nat) (σ : Gal(L / K)) :
    principalUnits L n ≃* principalUnits L n :=
  principalUnitsMapEquivOfIntegerRingEquiv L n
    (galoisGroupIntegerRingEquivOfIsIntegralClosure K L σ)
 

theorem galoisGroupPrincipalUnitsMapEquivOfIsIntegralClosure_apply
    (K L : Type u) [Field K] [ValuativeRel K] [Field L] [ValuativeRel L]
    [Algebra K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [IsIntegralClosure 𝒪[L] 𝒪[K] L]
    (n : Nat) (σ : Gal(L / K)) (u : principalUnits L n) :
    ((galoisGroupPrincipalUnitsMapEquivOfIsIntegralClosure K L n σ u :
        principalUnits L n) : 𝒪[L]ˣ) =
      Units.mapEquiv
        (galoisGroupIntegerRingEquivOfIsIntegralClosure K L σ).toMulEquiv u.1 :=
  rfl
 

theorem galoisGroup_prod_one_add_sub_one_sub_sum_mem_maximalIdeal_pow_succ_of_isIntegralClosure
    (K L : Type u) [Field K] [ValuativeRel K] [Field L] [ValuativeRel L]
    [Algebra K L] [FiniteDimensional K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [IsIntegralClosure 𝒪[L] 𝒪[K] L]
    (n : Nat) (hn : 1 ≤ n) (a : (𝓂[L] ^ n : Ideal 𝒪[L])) :
    (Finset.univ.prod fun σ : Gal(L / K) =>
        1 + galoisGroupIntegerRingEquivOfIsIntegralClosure K L σ (a : 𝒪[L])) - 1 -
      (Finset.univ.sum fun σ : Gal(L / K) =>
        galoisGroupIntegerRingEquivOfIsIntegralClosure K L σ (a : 𝒪[L])) ∈
        (𝓂[L] ^ (n + 1) : Ideal 𝒪[L]) := by
  classical
  refine finset_prod_one_add_sub_one_sub_sum_mem_maximalIdeal_pow_succ L
    (Finset.univ : Finset (Gal(L / K))) n hn
    (fun σ => galoisGroupIntegerRingEquivOfIsIntegralClosure K L σ (a : 𝒪[L])) ?_
  intro σ _
  exact (integerRingEquiv_mem_maximalIdeal_pow L
    (galoisGroupIntegerRingEquivOfIsIntegralClosure K L σ) n (a : 𝒪[L])).2 a.2
end
end LocalFieldTheory
end

/- ValuedFieldTheory.LocalField.NonarchimedeanLocalField.ResidueGalois -/
section
namespace LocalFieldTheory
noncomputable section
universe u
open scoped ValuativeRel
open _root_.LocalFieldTheory.IsNonarchimedeanLocalField
 





def galoisGroupResidueFieldEquivOfIsIntegralClosure (K L : Type u)
    [Field K] [ValuativeRel K] [Field L] [ValuativeRel L] [Algebra K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [IsIntegralClosure 𝒪[L] 𝒪[K] L] (σ : Gal(L / K)) :
    𝓀[L] ≃+* 𝓀[L] :=
  IsLocalRing.ResidueField.mapEquiv
    (galoisGroupIntegerRingEquivOfIsIntegralClosure K L σ)
 

@[simp]
theorem galoisGroupResidueFieldEquivOfIsIntegralClosure_residue (K L : Type u)
    [Field K] [ValuativeRel K] [Field L] [ValuativeRel L] [Algebra K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [IsIntegralClosure 𝒪[L] 𝒪[K] L] (σ : Gal(L / K)) (x : 𝒪[L]) :
    galoisGroupResidueFieldEquivOfIsIntegralClosure K L σ
        (IsLocalRing.residue 𝒪[L] x) =
      IsLocalRing.residue 𝒪[L]
        (galoisGroupIntegerRingEquivOfIsIntegralClosure K L σ x) := by
  rfl
 
theorem galoisGroupResidueFieldEquivOfIsIntegralClosure_integerUnitsToResidueUnits
    (K L : Type u)
    [Field K] [ValuativeRel K] [Field L] [ValuativeRel L] [Algebra K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [IsIntegralClosure 𝒪[L] 𝒪[K] L] (σ : Gal(L / K)) (u : 𝒪[L]ˣ) :
    Units.mapEquiv (galoisGroupResidueFieldEquivOfIsIntegralClosure K L σ).toMulEquiv
        (integerUnitsToResidueUnits L u) =
      integerUnitsToResidueUnits L
        (Units.mapEquiv
          (galoisGroupIntegerRingEquivOfIsIntegralClosure K L σ).toMulEquiv u) := by
  ext
  rfl
 
theorem galoisGroupResidueFieldEquivOfIsIntegralClosure_algebraMap (K L : Type u)
    [Field K] [ValuativeRel K] [Field L] [ValuativeRel L] [Algebra K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [IsIntegralClosure 𝒪[L] 𝒪[K] L] (σ : Gal(L / K)) (x : 𝓀[K]) :
    galoisGroupResidueFieldEquivOfIsIntegralClosure K L σ (algebraMap 𝓀[K] 𝓀[L] x) =
      algebraMap 𝓀[K] 𝓀[L] x := by
  obtain ⟨a, rfl⟩ := Ideal.Quotient.mk_surjective x
  change galoisGroupResidueFieldEquivOfIsIntegralClosure K L σ
      (algebraMap 𝓀[K] 𝓀[L] (IsLocalRing.residue 𝒪[K] a)) =
    algebraMap 𝓀[K] 𝓀[L] (IsLocalRing.residue 𝒪[K] a)
  rw [residueField_algebraMap_residue K L a]
  rw [galoisGroupResidueFieldEquivOfIsIntegralClosure_residue]
  exact congrArg (fun z : 𝒪[L] => IsLocalRing.residue 𝒪[L] z)
    (galoisGroupIntegerRingEquivOfIsIntegralClosure_integerRingMap K L σ a)
 
abbrev galoisGroupResidueAlgEquivOfIsIntegralClosure (K L : Type u)
    [Field K] [ValuativeRel K] [Field L] [ValuativeRel L] [Algebra K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [IsIntegralClosure 𝒪[L] 𝒪[K] L] (σ : Gal(L / K)) :
    𝓀[L] ≃ₐ[𝓀[K]] 𝓀[L] where
  __ := galoisGroupResidueFieldEquivOfIsIntegralClosure K L σ
  commutes' := galoisGroupResidueFieldEquivOfIsIntegralClosure_algebraMap K L σ
 
def galoisGroupResidueAlgEquivHomOfIsIntegralClosure (K L : Type u)
    [Field K] [ValuativeRel K] [Field L] [ValuativeRel L] [Algebra K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [IsIntegralClosure 𝒪[L] 𝒪[K] L] :
    Gal(L / K) →* (𝓀[L] ≃ₐ[𝓀[K]] 𝓀[L]) where
  toFun := galoisGroupResidueAlgEquivOfIsIntegralClosure K L
  map_one' := by
    apply AlgEquiv.ext
    intro x
    obtain ⟨a, rfl⟩ := Ideal.Quotient.mk_surjective x
    rfl
  map_mul' := by
    intro σ τ
    apply AlgEquiv.ext
    intro x
    obtain ⟨a, rfl⟩ := Ideal.Quotient.mk_surjective x
    rfl
 

@[simp]
theorem galoisGroupResidueAlgEquivHomOfIsIntegralClosure_apply (K L : Type u)
    [Field K] [ValuativeRel K] [Field L] [ValuativeRel L] [Algebra K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [IsIntegralClosure 𝒪[L] 𝒪[K] L] (σ : Gal(L / K)) :
    galoisGroupResidueAlgEquivHomOfIsIntegralClosure K L σ =
      galoisGroupResidueAlgEquivOfIsIntegralClosure K L σ :=
  rfl
 

theorem galoisGroup_sum_residue_eq_residueAlgEquiv_sum_of_isIntegralClosure
    (K L : Type u)
    [Field K] [ValuativeRel K] [Field L] [ValuativeRel L] [Algebra K L]
    [FiniteDimensional K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [IsIntegralClosure 𝒪[L] 𝒪[K] L] (a : 𝒪[L]) :
    IsLocalRing.residue 𝒪[L]
        (Finset.univ.sum fun σ : Gal(L / K) =>
          galoisGroupIntegerRingEquivOfIsIntegralClosure K L σ a) =
      Finset.univ.sum fun σ : Gal(L / K) =>
        galoisGroupResidueAlgEquivOfIsIntegralClosure K L σ
          (IsLocalRing.residue 𝒪[L] a) := by
  rw [map_sum]
  refine Finset.sum_congr rfl ?_
  intro σ _
  simp [galoisGroupResidueAlgEquivOfIsIntegralClosure]
 

def galoisGroupResidueStabilizerHomOfIsIntegralClosure (K L : Type u)
    [Field K] [ValuativeRel K] [Field L] [ValuativeRel L] [Algebra K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [IsIntegralClosure 𝒪[L] 𝒪[K] L] :
    @MulAction.stabilizer Gal(L / K) (Ideal 𝒪[L]) _
        (galoisGroupIntegerRingIdealMulActionOfIsIntegralClosure K L)
        (𝓂[L] : Ideal 𝒪[L]) →*
      (𝓀[L] ≃ₐ[𝓀[K]] 𝓀[L]) := by
  letI := galoisGroupIntegerRingMulSemiringActionOfIsIntegralClosure K L
  letI := galoisGroupIntegerRingSMulCommClassOfIsIntegralClosure K L
  letI := galoisGroupIntegerRingIdealDistribMulActionOfIsIntegralClosure K L
  exact Ideal.Quotient.stabilizerHom (𝓂[L] : Ideal 𝒪[L])
    (𝓂[K] : Ideal 𝒪[K]) Gal(L / K)
 
def galoisGroupMaximalIdealInertiaOfIsIntegralClosure (K L : Type u)
    [Field K] [ValuativeRel K] [Field L] [ValuativeRel L] [Algebra K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [IsIntegralClosure 𝒪[L] 𝒪[K] L] :
    Subgroup Gal(L / K) := by
  letI := galoisGroupIntegerRingMulSemiringActionOfIsIntegralClosure K L
  exact (𝓂[L] : Ideal 𝒪[L]).toAddSubgroup.inertia Gal(L / K)
 
def galoisGroupResidueStabilizerHomFromGaloisGroupOfIsIntegralClosure (K L : Type u)
    [Field K] [ValuativeRel K] [Field L] [ValuativeRel L] [Algebra K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [IsIntegralClosure 𝒪[L] 𝒪[K] L] :
    Gal(L / K) →* (𝓀[L] ≃ₐ[𝓀[K]] 𝓀[L]) :=
  (galoisGroupResidueStabilizerHomOfIsIntegralClosure K L).comp
    (galoisGroupMaximalIdealStabilizerHomOfIsIntegralClosure K L)
 

theorem galoisGroupResidueStabilizerHomFromGaloisGroupOfIsIntegralClosure_eq
    (K L : Type u)
    [Field K] [ValuativeRel K] [Field L] [ValuativeRel L] [Algebra K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [IsIntegralClosure 𝒪[L] 𝒪[K] L] :
    galoisGroupResidueStabilizerHomFromGaloisGroupOfIsIntegralClosure K L =
      galoisGroupResidueAlgEquivHomOfIsIntegralClosure K L := by
  ext σ x
  obtain ⟨a, rfl⟩ := Ideal.Quotient.mk_surjective x
  rfl
 

theorem galoisGroupResidueAlgEquivHomOfIsIntegralClosure_mem_ker_iff_stabilizerHom
    (K L : Type u)
    [Field K] [ValuativeRel K] [Field L] [ValuativeRel L] [Algebra K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [IsIntegralClosure 𝒪[L] 𝒪[K] L] (σ : Gal(L / K)) :
    σ ∈ (galoisGroupResidueAlgEquivHomOfIsIntegralClosure K L).ker ↔
      galoisGroupMaximalIdealStabilizerHomOfIsIntegralClosure K L σ ∈
        (galoisGroupResidueStabilizerHomOfIsIntegralClosure K L).ker := by
  rw [← galoisGroupResidueStabilizerHomFromGaloisGroupOfIsIntegralClosure_eq K L]
  rfl
 
theorem galoisGroupResidueStabilizerHomOfIsIntegralClosure_ker_eq_maximalIdealInertia
    (K L : Type u)
    [Field K] [ValuativeRel K] [Field L] [ValuativeRel L] [Algebra K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [IsIntegralClosure 𝒪[L] 𝒪[K] L] :
    (galoisGroupResidueStabilizerHomOfIsIntegralClosure K L).ker =
      (galoisGroupMaximalIdealInertiaOfIsIntegralClosure K L).subgroupOf
        (@MulAction.stabilizer Gal(L / K) (Ideal 𝒪[L]) _
          (galoisGroupIntegerRingIdealMulActionOfIsIntegralClosure K L)
          (𝓂[L] : Ideal 𝒪[L])) := by
  let := galoisGroupIntegerRingMulSemiringActionOfIsIntegralClosure K L
  let := galoisGroupIntegerRingSMulCommClassOfIsIntegralClosure K L
  let := galoisGroupIntegerRingIdealDistribMulActionOfIsIntegralClosure K L
  exact Ideal.Quotient.ker_stabilizerHom (𝓂[L] : Ideal 𝒪[L])
    (𝓂[K] : Ideal 𝒪[K]) Gal(L / K)
 

theorem galoisGroupResidueAlgEquivHomOfIsIntegralClosure_mem_ker_iff_mem_maximalIdealInertia
    (K L : Type u)
    [Field K] [ValuativeRel K] [Field L] [ValuativeRel L] [Algebra K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [IsIntegralClosure 𝒪[L] 𝒪[K] L] (σ : Gal(L / K)) :
    σ ∈ (galoisGroupResidueAlgEquivHomOfIsIntegralClosure K L).ker ↔
      σ ∈ galoisGroupMaximalIdealInertiaOfIsIntegralClosure K L := by
  rw [galoisGroupResidueAlgEquivHomOfIsIntegralClosure_mem_ker_iff_stabilizerHom]
  rw [galoisGroupResidueStabilizerHomOfIsIntegralClosure_ker_eq_maximalIdealInertia K L]
  rfl
 
theorem galoisGroupResidueAlgEquivHomOfIsIntegralClosure_ker_eq_maximalIdealInertia
    (K L : Type u)
    [Field K] [ValuativeRel K] [Field L] [ValuativeRel L] [Algebra K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [IsIntegralClosure 𝒪[L] 𝒪[K] L] :
    (galoisGroupResidueAlgEquivHomOfIsIntegralClosure K L).ker =
      galoisGroupMaximalIdealInertiaOfIsIntegralClosure K L := by
  ext σ
  exact galoisGroupResidueAlgEquivHomOfIsIntegralClosure_mem_ker_iff_mem_maximalIdealInertia
    K L σ
 

theorem galoisGroupMaximalIdealInertiaOfIsIntegralClosure_card_eq_ramificationIdxIn
    (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L] [IsGalois K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [IsIntegralClosure 𝒪[L] 𝒪[K] L] :
    Nat.card (galoisGroupMaximalIdealInertiaOfIsIntegralClosure K L) =
      (𝓂[K] : Ideal 𝒪[K]).ramificationIdxIn 𝒪[L] := by
  let := galoisGroupIntegerRingMulSemiringActionOfIsIntegralClosure K L
  let := galoisGroupIntegerRing_isGaloisGroup_of_isIntegralClosure K L
  let : Module.Finite 𝒪[K] 𝒪[L] :=
    integerRing_moduleFinite_of_isIntegralClosure K L
  let : Algebra.IsSeparable (𝒪[K] ⧸ (𝓂[K] : Ideal 𝒪[K]))
      (𝒪[L] ⧸ (𝓂[L] : Ideal 𝒪[L])) :=
    residueFieldAlgebra_isSeparable_of_valuationExtension K L
  let : Finite (𝒪[K] ⧸ (𝓂[K] : Ideal 𝒪[K])) := by
    change Finite 𝓀[K]
    infer_instance
  simpa [galoisGroupMaximalIdealInertiaOfIsIntegralClosure] using
    (Ideal.card_inertia_eq_ramificationIdxIn
      (R := 𝒪[K]) (S := 𝒪[L]) (G := Gal(L / K))
      (𝓂[K] : Ideal 𝒪[K]) (𝓂[L] : Ideal 𝒪[L]))
 

theorem galoisGroupMaximalIdealInertiaOfIsIntegralClosure_card_eq_ramificationIdx
    (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L] [IsGalois K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [IsIntegralClosure 𝒪[L] 𝒪[K] L] :
    Nat.card (galoisGroupMaximalIdealInertiaOfIsIntegralClosure K L) =
      (𝓂[L] : Ideal 𝒪[L]).ramificationIdx 𝒪[K] := by
  let := galoisGroupIntegerRingMulSemiringActionOfIsIntegralClosure K L
  let := galoisGroupIntegerRing_isGaloisGroup_of_isIntegralClosure K L
  rw [galoisGroupMaximalIdealInertiaOfIsIntegralClosure_card_eq_ramificationIdxIn K L]
  exact Ideal.ramificationIdxIn_eq_ramificationIdx
    (𝓂[K] : Ideal 𝒪[K]) (𝓂[L] : Ideal 𝒪[L]) Gal(L / K)
 

theorem galoisGroupResidueAlgEquivHomOfIsIntegralClosure_ker_card_eq_ramificationIdx
    (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L] [IsGalois K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [IsIntegralClosure 𝒪[L] 𝒪[K] L] :
    Nat.card (galoisGroupResidueAlgEquivHomOfIsIntegralClosure K L).ker =
      (𝓂[L] : Ideal 𝒪[L]).ramificationIdx 𝒪[K] := by
  rw [galoisGroupResidueAlgEquivHomOfIsIntegralClosure_ker_eq_maximalIdealInertia K L]
  exact galoisGroupMaximalIdealInertiaOfIsIntegralClosure_card_eq_ramificationIdx K L
 

theorem galoisGroupResidueAlgEquivHomOfIsIntegralClosure_ker_card_eq_one_of_ramificationIdx_eq_one
    (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L] [IsGalois K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [IsIntegralClosure 𝒪[L] 𝒪[K] L]
    (h :
      (𝓂[L] : Ideal 𝒪[L]).ramificationIdx 𝒪[K] = 1) :
    Nat.card (galoisGroupResidueAlgEquivHomOfIsIntegralClosure K L).ker = 1 := by
  rw [galoisGroupResidueAlgEquivHomOfIsIntegralClosure_ker_card_eq_ramificationIdx K L, h]
end
end LocalFieldTheory
end

/- ClassFieldTheory.LocalClassFieldTheory.Finite.Unramified.PrincipalUnits.NormSide -/
section
noncomputable section
universe u
namespace LocalClassFieldTheory
open scoped ValuativeRel
open LocalFieldTheory
open LocalFieldTheory.IsNonarchimedeanLocalField
 





theorem integerUnitsMap_normIntegerUnits_eq_galoisGroup_prod_of_isIntegralClosure
    (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L] [IsGalois K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [IsIntegralClosure 𝒪[L] 𝒪[K] L] [LocalFieldTheory.ValuativeExtension K L]
    (u : 𝒪[L]ˣ) :
    integerUnitsMapOfValuationExtension K L (normIntegerUnits K L u) =
      Finset.univ.prod (fun σ : Gal(L / K) =>
        Units.mapEquiv
          (galoisGroupIntegerRingEquivOfIsIntegralClosure K L σ).toMulEquiv u) := by
  ext
  have hfield := mapBaseUnits_normUnits_eq_prod_gal (K := K) (L := L)
    (integerUnitsToFieldUnits L u)
  have hfield' := congrArg (fun z : Lˣ => (z : L)) hfield
  simp only [mapBaseUnitsToExtensionUnits_apply_coe, normUnits_apply_coe,
    integerUnitsToFieldUnits_apply] at hfield'
  change (algebraMap K L (((normIntegerUnits K L u : 𝒪[K]ˣ) : 𝒪[K]) : K)) =
      (((Finset.univ.prod (fun σ : Gal(L / K) =>
        Units.mapEquiv
          (galoisGroupIntegerRingEquivOfIsIntegralClosure K L σ).toMulEquiv u) : 𝒪[L]ˣ) :
          𝒪[L]) : L)
  rw [normIntegerUnits_apply_coe]
  simpa [galoisGroupIntegerRingEquivOfIsIntegralClosure_apply] using hfield'
 

theorem galoisGroup_prod_mem_principalUnits_of_isIntegralClosure (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [IsIntegralClosure 𝒪[L] 𝒪[K] L]
    (n : Nat) (u : 𝒪[L]ˣ) (hu : u ∈ principalUnits L n) :
    Finset.univ.prod (fun σ : Gal(L / K) =>
      Units.mapEquiv
        (galoisGroupIntegerRingEquivOfIsIntegralClosure K L σ).toMulEquiv u) ∈
        principalUnits L n := by
  simpa using (Subgroup.prod_mem (principalUnits L n) (t := Finset.univ)
    (f := fun σ : Gal(L / K) =>
      Units.mapEquiv
        (galoisGroupIntegerRingEquivOfIsIntegralClosure K L σ).toMulEquiv u)
    (fun σ _ =>
      principalUnits_integerRingEquiv_mem_self L n
        (galoisGroupIntegerRingEquivOfIsIntegralClosure K L σ) u hu))
 

theorem integerUnitsMap_normIntegerUnits_mem_principalUnits_of_isIntegralClosure
    (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L] [IsGalois K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [IsIntegralClosure 𝒪[L] 𝒪[K] L] [LocalFieldTheory.ValuativeExtension K L]
    (n : Nat) (u : 𝒪[L]ˣ) (hu : u ∈ principalUnits L n) :
    integerUnitsMapOfValuationExtension K L (normIntegerUnits K L u) ∈
      principalUnits L n := by
  rw [integerUnitsMap_normIntegerUnits_eq_galoisGroup_prod_of_isIntegralClosure K L u]
  exact galoisGroup_prod_mem_principalUnits_of_isIntegralClosure K L n u hu
 



noncomputable def principalUnitsNormExtensionSideOfIsIntegralClosure (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L] [IsGalois K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [IsIntegralClosure 𝒪[L] 𝒪[K] L] [LocalFieldTheory.ValuativeExtension K L] (n : Nat) :
    principalUnits L n →* principalUnits L n where
  toFun u :=
    ⟨integerUnitsMapOfValuationExtension K L (normIntegerUnits K L u.1),
      integerUnitsMap_normIntegerUnits_mem_principalUnits_of_isIntegralClosure
        K L n u.1 u.2⟩
  map_one' := by
    ext
    simp [integerUnitsMapOfValuationExtension]
  map_mul' := by
    intro u v
    ext
    simp [integerUnitsMapOfValuationExtension]
 
@[simp]
theorem principalUnitsNormExtensionSideOfIsIntegralClosure_apply (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L] [IsGalois K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [IsIntegralClosure 𝒪[L] 𝒪[K] L] [LocalFieldTheory.ValuativeExtension K L]
    (n : Nat) (u : principalUnits L n) :
    ((principalUnitsNormExtensionSideOfIsIntegralClosure K L n u :
        principalUnits L n) : 𝒪[L]ˣ) =
      integerUnitsMapOfValuationExtension K L (normIntegerUnits K L u.1) :=
  rfl
 

theorem principalUnitsNormExtensionSideOfIsIntegralClosure_eq_galoisGroup_prod
    (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L] [IsGalois K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [IsIntegralClosure 𝒪[L] 𝒪[K] L] [LocalFieldTheory.ValuativeExtension K L]
    (n : Nat) (u : principalUnits L n) :
    principalUnitsNormExtensionSideOfIsIntegralClosure K L n u =
      Finset.univ.prod (fun σ : Gal(L / K) =>
        galoisGroupPrincipalUnitsMapEquivOfIsIntegralClosure K L n σ u) := by
  apply Subtype.ext
  simpa [principalUnitsNormExtensionSideOfIsIntegralClosure_apply,
    galoisGroupPrincipalUnitsMapEquivOfIsIntegralClosure_apply] using
    integerUnitsMap_normIntegerUnits_eq_galoisGroup_prod_of_isIntegralClosure K L u.1
 

theorem principalUnitsNormExtensionSideOfIsIntegralClosure_oneAdd_sub_one_sub_sum_mem_maximalIdeal_pow_succ
    (K L : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] [Field L] [ValuativeRel L] [TopologicalSpace L]
    [IsNonarchimedeanLocalField L] [Algebra K L] [FiniteDimensional K L]
    [IsGalois K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [IsIntegralClosure 𝒪[L] 𝒪[K] L] [LocalFieldTheory.ValuativeExtension K L]
    (n : Nat) (hn : 1 ≤ n) (a : (𝓂[L] ^ n : Ideal 𝒪[L])) :
    (((principalUnitsNormExtensionSideOfIsIntegralClosure K L n
          (principalUnitOneAddOfMemPowSubgroup L hn (a : 𝒪[L]) a.2) :
        principalUnits L n) : 𝒪[L]ˣ) : 𝒪[L]) - 1 -
      (Finset.univ.sum fun σ : Gal(L / K) =>
        galoisGroupIntegerRingEquivOfIsIntegralClosure K L σ (a : 𝒪[L])) ∈
        (𝓂[L] ^ (n + 1) : Ideal 𝒪[L]) := by
  classical
  rw [principalUnitsNormExtensionSideOfIsIntegralClosure_eq_galoisGroup_prod K L n
    (principalUnitOneAddOfMemPowSubgroup L hn (a : 𝒪[L]) a.2)]
  simpa [galoisGroupPrincipalUnitsMapEquivOfIsIntegralClosure,
    principalUnitsMapEquivOfIntegerRingEquiv,
    principalUnitOneAddOfMemPowSubgroup, principalUnitOneAddOfMemPow_val]
    using
      galoisGroup_prod_one_add_sub_one_sub_sum_mem_maximalIdeal_pow_succ_of_isIntegralClosure
        K L n hn a
end LocalClassFieldTheory
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
 

@[simp]
theorem integerRingModMaximalIdealAddEquivResidue_mk
    (K : Type u) [Field K] [ValuativeRel K] (x : 𝒪[K]) :
    integerRingModMaximalIdealAddEquivResidue K
        (Ideal.Quotient.mk (𝓂[K] : Ideal 𝒪[K]) x) =
      IsLocalRing.residue 𝒪[K] x :=
  rfl
 

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
 

@[simp]
theorem integerRingUniformizerFieldUnit_coe
    (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] :
    ((integerRingUniformizerFieldUnit K : Kˣ) : K) =
      (((chosenIntegerRingUniformizer K : 𝒪[K]) : K)) :=
  rfl
 




def inverseIntegerRingUniformizerFieldUnit
    (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] : Kˣ :=
  (integerRingUniformizerFieldUnit K)⁻¹
 
@[simp]
theorem inverseIntegerRingUniformizerFieldUnit_coe
    (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] :
    ((inverseIntegerRingUniformizerFieldUnit K : Kˣ) : K) =
      (((chosenIntegerRingUniformizer K : 𝒪[K]) : K))⁻¹ :=
  rfl
 

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
 

@[simp]
theorem maximalIdealPowMulUniformizerPowMap_apply
    (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (ϖ : 𝒪[K]) (hϖ : Irreducible ϖ)
    (n : Nat) (r : 𝒪[K]) :
    (maximalIdealPowMulUniformizerPowMap K ϖ hϖ n r : 𝒪[K]) =
      r * ϖ ^ n :=
  rfl
 
def maximalIdealPowSuccQuotMulUniformizerPowMap
    (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (ϖ : 𝒪[K]) (hϖ : Irreducible ϖ)
    (n : Nat) :
    𝒪[K] →ₗ[𝒪[K]] MaximalIdealPowSuccQuot K n :=
  (maximalIdealPowSuccQuotMk K n).comp
    (maximalIdealPowMulUniformizerPowMap K ϖ hϖ n)
 

@[simp]
theorem maximalIdealPowSuccQuotMulUniformizerPowMap_apply
    (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (ϖ : 𝒪[K]) (hϖ : Irreducible ϖ)
    (n : Nat) (r : 𝒪[K]) :
    maximalIdealPowSuccQuotMulUniformizerPowMap K ϖ hϖ n r =
      maximalIdealPowSuccQuotMk K n
        (maximalIdealPowMulUniformizerPowMap K ϖ hϖ n r) :=
  rfl
 
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
 
def residueAddEquivMaximalIdealPowSuccQuotOfIrreducible
    (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (ϖ : 𝒪[K]) (hϖ : Irreducible ϖ)
    (n : Nat) :
    𝓀[K] ≃+ MaximalIdealPowSuccQuot K n :=
  (residueLinearEquivMaximalIdealPowSuccQuotOfIrreducible K ϖ hϖ n).toAddEquiv
 

@[simp]
theorem residueAddEquivMaximalIdealPowSuccQuotOfIrreducible_residue
    (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (ϖ : 𝒪[K]) (hϖ : Irreducible ϖ)
    (n : Nat) (r : 𝒪[K]) :
    residueAddEquivMaximalIdealPowSuccQuotOfIrreducible K ϖ hϖ n
        (IsLocalRing.residue 𝒪[K] r) =
    maximalIdealPowSuccQuotMulUniformizerPowMap K ϖ hϖ n r := by
  let f := maximalIdealPowSuccQuotMulUniformizerPowMap K ϖ hϖ n
  let hker : (𝓂[K] : Submodule 𝒪[K] 𝒪[K]) = LinearMap.ker f :=
    (maximalIdealPowSuccQuotMulUniformizerPowMap_ker K ϖ hϖ n).symm
  change (Submodule.quotEquivOfEq (𝓂[K] : Submodule 𝒪[K] 𝒪[K])
        (LinearMap.ker f) hker).trans
      (f.quotKerEquivOfSurjective
        (maximalIdealPowSuccQuotMulUniformizerPowMap_surjective K ϖ hϖ n))
      (Submodule.Quotient.mk r) = f r
  rw [LinearEquiv.trans_apply]
  have hquot :
      Submodule.quotEquivOfEq (𝓂[K] : Submodule 𝒪[K] 𝒪[K])
          (LinearMap.ker f) hker (Submodule.Quotient.mk r) =
        (Submodule.Quotient.mk r : 𝒪[K] ⧸ LinearMap.ker f) := by
    exact Submodule.quotEquivOfEq_mk
      (p := (𝓂[K] : Submodule 𝒪[K] 𝒪[K])) (p' := LinearMap.ker f) hker r
  rw [hquot]
  rw [LinearMap.quotKerEquivOfSurjective_apply_mk]
 



def principalUnitsSuccQuotAddEquivResidueOfIrreducible
    (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (ϖ : 𝒪[K]) (hϖ : Irreducible ϖ)
    (n : Nat) (hn : 1 ≤ n) :
    Additive (PrincipalUnitsSuccQuot K n) ≃+ 𝓀[K] :=
  (maximalIdealPowSuccQuotAddEquivPrincipalUnitsSuccQuot K n hn).symm.trans
    (residueAddEquivMaximalIdealPowSuccQuotOfIrreducible K ϖ hϖ n).symm
 

@[simp]
theorem principalUnitsSuccQuotAddEquivResidueOfIrreducible_symm_apply
    (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (ϖ : 𝒪[K]) (hϖ : Irreducible ϖ)
    (n : Nat) (hn : 1 ≤ n) (x : 𝓀[K]) :
    (principalUnitsSuccQuotAddEquivResidueOfIrreducible K ϖ hϖ n hn).symm x =
      principalUnitsSuccQuotOfMaximalIdealPowSuccQuotAdd K n hn
        (residueAddEquivMaximalIdealPowSuccQuotOfIrreducible K ϖ hϖ n x) :=
  rfl
 

@[simp]
theorem principalUnitsSuccQuotAddEquivResidueOfIrreducible_symm_residue
    (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (ϖ : 𝒪[K]) (hϖ : Irreducible ϖ)
    (n : Nat) (hn : 1 ≤ n) (r : 𝒪[K]) :
    (principalUnitsSuccQuotAddEquivResidueOfIrreducible K ϖ hϖ n hn).symm
        (IsLocalRing.residue 𝒪[K] r) =
      Additive.ofMul
        (principalUnitsSuccQuotMk K n
          (principalUnitOneAddOfMemPowSubgroup K hn
            ((maximalIdealPowMulUniformizerPowMap K ϖ hϖ n r :
              (𝓂[K] ^ n : Ideal 𝒪[K])) : 𝒪[K])
            (maximalIdealPowMulUniformizerPowMap K ϖ hϖ n r).2)) := by
  rw [principalUnitsSuccQuotAddEquivResidueOfIrreducible_symm_apply]
  rw [residueAddEquivMaximalIdealPowSuccQuotOfIrreducible_residue]
  rw [principalUnitsSuccQuotOfMaximalIdealPowSuccQuotAdd_apply]
  rw [maximalIdealPowSuccQuotMulUniformizerPowMap_apply]
  rw [principalUnitsSuccQuotOfMaximalIdealPowSuccQuot_mk]
  rfl
 



noncomputable def principalUnitsSuccQuotUniformizerCoord
    (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (ϖ : 𝒪[K]) (hϖ : Irreducible ϖ)
    (n : Nat) (hn : 1 ≤ n) (r : 𝒪[K]) :
    PrincipalUnitsSuccQuot K n :=
  principalUnitsSuccQuotMk K n
    (principalUnitOneAddOfMemPowSubgroup K hn
      ((maximalIdealPowMulUniformizerPowMap K ϖ hϖ n r :
        (𝓂[K] ^ n : Ideal 𝒪[K])) : 𝒪[K])
      (maximalIdealPowMulUniformizerPowMap K ϖ hϖ n r).2)
 
@[simp]
theorem principalUnitsSuccQuotUniformizerCoord_zero
    (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (ϖ : 𝒪[K]) (hϖ : Irreducible ϖ)
    (n : Nat) (hn : 1 ≤ n) :
    principalUnitsSuccQuotUniformizerCoord K ϖ hϖ n hn 0 = 1 := by
  change principalUnitsSuccQuotOfIdealPow K n hn
      (maximalIdealPowMulUniformizerPowMap K ϖ hϖ n 0) = 1
  rw [map_zero]
  exact principalUnitsSuccQuotOfIdealPow_zero K n hn
 


theorem principalUnitsSuccQuotUniformizerCoord_add
    (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (ϖ : 𝒪[K]) (hϖ : Irreducible ϖ)
    (n : Nat) (hn : 1 ≤ n) (r s : 𝒪[K]) :
    principalUnitsSuccQuotUniformizerCoord K ϖ hϖ n hn (r + s) =
      principalUnitsSuccQuotUniformizerCoord K ϖ hϖ n hn r *
        principalUnitsSuccQuotUniformizerCoord K ϖ hϖ n hn s := by
  change principalUnitsSuccQuotOfIdealPow K n hn
      (maximalIdealPowMulUniformizerPowMap K ϖ hϖ n (r + s)) =
    principalUnitsSuccQuotOfIdealPow K n hn
        (maximalIdealPowMulUniformizerPowMap K ϖ hϖ n r) *
      principalUnitsSuccQuotOfIdealPow K n hn
        (maximalIdealPowMulUniformizerPowMap K ϖ hϖ n s)
  rw [map_add]
  exact principalUnitsSuccQuotOfIdealPow_add K n hn
    (maximalIdealPowMulUniformizerPowMap K ϖ hϖ n r)
    (maximalIdealPowMulUniformizerPowMap K ϖ hϖ n s)
 

noncomputable def principalUnitsSuccQuotUniformizerCoordAddHom
    (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (ϖ : 𝒪[K]) (hϖ : Irreducible ϖ)
    (n : Nat) (hn : 1 ≤ n) :
    𝒪[K] →+ Additive (PrincipalUnitsSuccQuot K n) where
  toFun r := Additive.ofMul (principalUnitsSuccQuotUniformizerCoord K ϖ hϖ n hn r)
  map_zero' := by
    change Additive.ofMul (principalUnitsSuccQuotUniformizerCoord K ϖ hϖ n hn 0) = 0
    rw [principalUnitsSuccQuotUniformizerCoord_zero]
    rfl
  map_add' r s := by
    change Additive.ofMul (principalUnitsSuccQuotUniformizerCoord K ϖ hϖ n hn (r + s)) =
      Additive.ofMul (principalUnitsSuccQuotUniformizerCoord K ϖ hϖ n hn r) +
        Additive.ofMul (principalUnitsSuccQuotUniformizerCoord K ϖ hϖ n hn s)
    rw [principalUnitsSuccQuotUniformizerCoord_add]
    rfl
 

@[simp]
theorem principalUnitsSuccQuotUniformizerCoordAddHom_apply
    (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (ϖ : 𝒪[K]) (hϖ : Irreducible ϖ)
    (n : Nat) (hn : 1 ≤ n) (r : 𝒪[K]) :
    principalUnitsSuccQuotUniformizerCoordAddHom K ϖ hϖ n hn r =
      Additive.ofMul (principalUnitsSuccQuotUniformizerCoord K ϖ hϖ n hn r) :=
  rfl
end
end LocalFieldTheory
end

/- ValuedFieldTheory.LocalField.NonarchimedeanLocalField.FiniteUnramified -/
section
namespace LocalFieldTheory
noncomputable section
universe u
namespace IsNonarchimedeanLocalField
open scoped ValuativeRel
 



class IsUnramifiedValuedExtension (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [Module.Finite 𝒪[K] 𝒪[L]] : Prop where
   
  maximalIdeal_ramificationIdx_eq_one :
    (𝓂[L] : Ideal 𝒪[L]).ramificationIdx 𝒪[K] = 1
 
theorem unramifiedValuation_ramificationIdx_eq_one
    (K L : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] [Field L] [ValuativeRel L] [TopologicalSpace L]
    [IsNonarchimedeanLocalField L] [Algebra K L] [FiniteDimensional K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [Module.Finite 𝒪[K] 𝒪[L]] [IsUnramifiedValuedExtension K L] :
    (𝓂[L] : Ideal 𝒪[L]).ramificationIdx 𝒪[K] = 1 :=
  IsUnramifiedValuedExtension.maximalIdeal_ramificationIdx_eq_one
    (K := K) (L := L)
 

theorem unramifiedValuation_residue_finrank_eq_finrank
    (K L : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] [Field L] [ValuativeRel L] [TopologicalSpace L]
    [IsNonarchimedeanLocalField L] [Algebra K L] [FiniteDimensional K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [Module.Finite 𝒪[K] 𝒪[L]] [IsUnramifiedValuedExtension K L] :
    Module.finrank 𝓀[K] 𝓀[L] = Module.finrank K L := by
  have h :=
    LocalFieldTheory.maximalIdeal_ramificationIdx_mul_residue_finrank_eq_finrank K L
  have hp : (𝓂[K] : Ideal 𝒪[K]) ≠ ⊥ :=
    Ring.ne_bot_of_isMaximal_of_not_isField
      (IsLocalRing.maximalIdeal.isMaximal 𝒪[K])
      (IsDiscreteValuationRing.not_isField 𝒪[K])
  rw [Ideal.ramificationIdx'_eq_ramificationIdx _ _ hp,
    unramifiedValuation_ramificationIdx_eq_one K L, one_mul] at h
  exact h
end IsNonarchimedeanLocalField
open scoped ValuativeRel
open _root_.LocalFieldTheory.IsNonarchimedeanLocalField
open Filter
 

theorem maximalIdeal_map_eq_maximalIdeal_of_unramifiedValuation (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [Module.Finite 𝒪[K] 𝒪[L]]
    [LocalFieldTheory.IsNonarchimedeanLocalField.IsUnramifiedValuedExtension K L] :
    Ideal.map (algebraMap 𝒪[K] 𝒪[L]) (𝓂[K] : Ideal 𝒪[K]) =
      (𝓂[L] : Ideal 𝒪[L]) := by
  have hp : (𝓂[K] : Ideal 𝒪[K]) ≠ ⊥ := by
    exact Ring.ne_bot_of_isMaximal_of_not_isField
      (IsLocalRing.maximalIdeal.isMaximal 𝒪[K])
      (IsDiscreteValuationRing.not_isField 𝒪[K])
  have hfact := Ideal.map_algebraMap_eq_finsetProd_pow
    (R := 𝒪[L]) (S := 𝒪[K]) (p := (𝓂[K] : Ideal 𝒪[K])) hp
  have hfin : ((𝓂[K] : Ideal 𝒪[K]).primesOver 𝒪[L]).toFinset =
      ({(𝓂[L] : Ideal 𝒪[L])} : Finset (Ideal 𝒪[L])) := by
    ext P
    simp [IsLocalRing.primesOver_eq 𝒪[L] hp]
  rw [hfin] at hfact
  simpa [LocalFieldTheory.IsNonarchimedeanLocalField.unramifiedValuation_ramificationIdx_eq_one K L]
    using hfact
 

theorem integerRingMap_uniformizer_irreducible_of_unramifiedValuation
    (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [Module.Finite 𝒪[K] 𝒪[L]]
    [LocalFieldTheory.IsNonarchimedeanLocalField.IsUnramifiedValuedExtension K L] :
    Irreducible (integerRingMapOfValuationExtension K L (chosenIntegerRingUniformizer K)) := by
  rw [IsDiscreteValuationRing.irreducible_iff_uniformizer]
  calc
    (𝓂[L] : Ideal 𝒪[L]) =
        Ideal.map (algebraMap 𝒪[K] 𝒪[L]) (𝓂[K] : Ideal 𝒪[K]) :=
      (maximalIdeal_map_eq_maximalIdeal_of_unramifiedValuation K L).symm
    _ = Ideal.map (algebraMap 𝒪[K] 𝒪[L])
        (Ideal.span ({chosenIntegerRingUniformizer K} : Set 𝒪[K])) := by
          rw [chosenIntegerRingUniformizer_maximalIdeal_eq K]
    _ = Ideal.span
        ({integerRingMapOfValuationExtension K L (chosenIntegerRingUniformizer K)} :
          Set 𝒪[L]) := by
          rw [Ideal.map_span, Set.image_singleton]
          rfl
 



theorem integerRingMap_mem_maximalIdeal_pow_of_unramifiedValuation
    (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [Module.Finite 𝒪[K] 𝒪[L]]
    [LocalFieldTheory.IsNonarchimedeanLocalField.IsUnramifiedValuedExtension K L]
    (n : Nat) {a : 𝒪[K]} (ha : a ∈ (𝓂[K] ^ n : Ideal 𝒪[K])) :
    integerRingMapOfValuationExtension K L a ∈ (𝓂[L] ^ n : Ideal 𝒪[L]) := by
  let πK : 𝒪[K] := chosenIntegerRingUniformizer K
  have hπL : Irreducible (integerRingMapOfValuationExtension K L πK) := by
    simpa [πK] using integerRingMap_uniformizer_irreducible_of_unramifiedValuation K L
  have ha_span : a ∈ Ideal.span ({πK ^ n} : Set 𝒪[K]) := by
    simpa [πK, maximalIdeal_pow_eq_span_uniformizer_pow K n] using ha
  rcases (Ideal.mem_span_singleton.mp ha_span) with ⟨r, hr⟩
  rw [maximalIdeal_pow_eq_span_uniformizer_pow_of_irreducible L
    (integerRingMapOfValuationExtension K L πK) hπL n]
  rw [Ideal.mem_span_singleton]
  refine ⟨integerRingMapOfValuationExtension K L r, ?_⟩
  simp [integerRingMapOfValuationExtension, hr, map_pow]
 

def maximalIdealPowMapOfUnramifiedValuation (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [Module.Finite 𝒪[K] 𝒪[L]]
    [LocalFieldTheory.IsNonarchimedeanLocalField.IsUnramifiedValuedExtension K L]
    (n : Nat) :
    ((𝓂[K] ^ n : Ideal 𝒪[K]) : Type u) →+ ((𝓂[L] ^ n : Ideal 𝒪[L]) : Type u) where
  toFun a :=
    ⟨integerRingMapOfValuationExtension K L (a : 𝒪[K]),
      integerRingMap_mem_maximalIdeal_pow_of_unramifiedValuation K L n a.2⟩
  map_zero' := by
    ext
    simp [integerRingMapOfValuationExtension]
  map_add' a b := by
    ext
    simp [integerRingMapOfValuationExtension]
 

@[simp]
theorem maximalIdealPowMapOfUnramifiedValuation_apply (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [Module.Finite 𝒪[K] 𝒪[L]]
    [LocalFieldTheory.IsNonarchimedeanLocalField.IsUnramifiedValuedExtension K L]
    (n : Nat) (a : ((𝓂[K] ^ n : Ideal 𝒪[K]) : Type u)) :
    (maximalIdealPowMapOfUnramifiedValuation K L n a : 𝒪[L]) =
      integerRingMapOfValuationExtension K L (a : 𝒪[K]) :=
  rfl
 

def maximalIdealPowSuccQuotMapOfUnramifiedValuation (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [Module.Finite 𝒪[K] 𝒪[L]]
    [LocalFieldTheory.IsNonarchimedeanLocalField.IsUnramifiedValuedExtension K L]
    (n : Nat) :
    MaximalIdealPowSuccQuot K n →+ MaximalIdealPowSuccQuot L n :=
  QuotientAddGroup.map
    (maximalIdealPowSuccSubmodule K n).toAddSubgroup
    (maximalIdealPowSuccSubmodule L n).toAddSubgroup
    (maximalIdealPowMapOfUnramifiedValuation K L n)
    (by
      intro a ha
      exact (mem_maximalIdealPowSuccSubmodule_iff L n
        (maximalIdealPowMapOfUnramifiedValuation K L n a)).2
        (integerRingMap_mem_maximalIdeal_pow_of_unramifiedValuation K L (n + 1)
          ((mem_maximalIdealPowSuccSubmodule_iff K n a).1 ha)))
 

theorem maximalIdealPowSuccQuotMapOfUnramifiedValuation_mk (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [Module.Finite 𝒪[K] 𝒪[L]]
    [LocalFieldTheory.IsNonarchimedeanLocalField.IsUnramifiedValuedExtension K L]
    (n : Nat) (a : ((𝓂[K] ^ n : Ideal 𝒪[K]) : Type u)) :
    maximalIdealPowSuccQuotMapOfUnramifiedValuation K L n
        (maximalIdealPowSuccQuotMk K n a) =
      maximalIdealPowSuccQuotMk L n
        (maximalIdealPowMapOfUnramifiedValuation K L n a) :=
  QuotientAddGroup.map_mk _ _ _ _ a
 

theorem maximalIdealPowMapOfUnramifiedValuation_mul_uniformizer_pow
    (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [Module.Finite 𝒪[K] 𝒪[L]]
    [LocalFieldTheory.IsNonarchimedeanLocalField.IsUnramifiedValuedExtension K L]
    (n : Nat) (r : 𝒪[K]) :
    maximalIdealPowMapOfUnramifiedValuation K L n
        (maximalIdealPowMulUniformizerPowMap K (chosenIntegerRingUniformizer K)
          (chosenIntegerRingUniformizer_irreducible K) n r) =
      maximalIdealPowMulUniformizerPowMap L
        (integerRingMapOfValuationExtension K L (chosenIntegerRingUniformizer K))
        (integerRingMap_uniformizer_irreducible_of_unramifiedValuation K L) n
        (integerRingMapOfValuationExtension K L r) := by
  ext
  simp [maximalIdealPowMulUniformizerPowMap, integerRingMapOfValuationExtension, map_pow]
 

theorem maximalIdealPowSuccQuotMapOfUnramifiedValuation_mul_uniformizer_pow
    (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [Module.Finite 𝒪[K] 𝒪[L]]
    [LocalFieldTheory.IsNonarchimedeanLocalField.IsUnramifiedValuedExtension K L]
    (n : Nat) (r : 𝒪[K]) :
    maximalIdealPowSuccQuotMapOfUnramifiedValuation K L n
        (maximalIdealPowSuccQuotMulUniformizerPowMap K (chosenIntegerRingUniformizer K)
          (chosenIntegerRingUniformizer_irreducible K) n r) =
      maximalIdealPowSuccQuotMulUniformizerPowMap L
        (integerRingMapOfValuationExtension K L (chosenIntegerRingUniformizer K))
        (integerRingMap_uniformizer_irreducible_of_unramifiedValuation K L) n
        (integerRingMapOfValuationExtension K L r) := by
  rw [maximalIdealPowSuccQuotMulUniformizerPowMap_apply,
    maximalIdealPowSuccQuotMapOfUnramifiedValuation_mk,
    maximalIdealPowSuccQuotMulUniformizerPowMap_apply]
  exact congrArg (maximalIdealPowSuccQuotMk L n)
    (maximalIdealPowMapOfUnramifiedValuation_mul_uniformizer_pow K L n r)
 


theorem residueAddEquivMaximalIdealPowSuccQuotOfIrreducible_map_residue
    (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [Module.Finite 𝒪[K] 𝒪[L]]
    [LocalFieldTheory.IsNonarchimedeanLocalField.IsUnramifiedValuedExtension K L]
    (n : Nat) (r : 𝒪[K]) :
    maximalIdealPowSuccQuotMapOfUnramifiedValuation K L n
        (residueAddEquivMaximalIdealPowSuccQuotOfIrreducible K
          (chosenIntegerRingUniformizer K) (chosenIntegerRingUniformizer_irreducible K) n
          (IsLocalRing.residue 𝒪[K] r)) =
      residueAddEquivMaximalIdealPowSuccQuotOfIrreducible L
        (integerRingMapOfValuationExtension K L (chosenIntegerRingUniformizer K))
        (integerRingMap_uniformizer_irreducible_of_unramifiedValuation K L) n
        (residueFieldMapOfValuationExtension K L (IsLocalRing.residue 𝒪[K] r)) := by
  rw [residueAddEquivMaximalIdealPowSuccQuotOfIrreducible_residue,
    maximalIdealPowSuccQuotMapOfUnramifiedValuation_mul_uniformizer_pow]
  rw [residueFieldMapOfValuationExtension_residue]
  rw [residueAddEquivMaximalIdealPowSuccQuotOfIrreducible_residue]
 





theorem residueAddEquivMaximalIdealPowSuccQuotOfIrreducible_map
    (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [Module.Finite 𝒪[K] 𝒪[L]]
    [LocalFieldTheory.IsNonarchimedeanLocalField.IsUnramifiedValuedExtension K L]
    (n : Nat) (x : 𝓀[K]) :
    maximalIdealPowSuccQuotMapOfUnramifiedValuation K L n
        (residueAddEquivMaximalIdealPowSuccQuotOfIrreducible K
          (chosenIntegerRingUniformizer K) (chosenIntegerRingUniformizer_irreducible K) n x) =
      residueAddEquivMaximalIdealPowSuccQuotOfIrreducible L
        (integerRingMapOfValuationExtension K L (chosenIntegerRingUniformizer K))
        (integerRingMap_uniformizer_irreducible_of_unramifiedValuation K L) n
        (residueFieldMapOfValuationExtension K L x) := by
  refine Quotient.inductionOn' x ?_
  intro r
  exact residueAddEquivMaximalIdealPowSuccQuotOfIrreducible_map_residue K L n r
 

theorem integerUnitsMapOfValuationExtension_mem_principalUnits_of_unramifiedValuation
    (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [Module.Finite 𝒪[K] 𝒪[L]]
    [LocalFieldTheory.IsNonarchimedeanLocalField.IsUnramifiedValuedExtension K L]
    (n : Nat) {u : 𝒪[K]ˣ} (hu : u ∈ principalUnits K n) :
    integerUnitsMapOfValuationExtension K L u ∈ principalUnits L n := by
  rw [mem_principalUnits_iff] at hu ⊢
  have hmap :=
    integerRingMap_mem_maximalIdeal_pow_of_unramifiedValuation K L n hu
  simpa [integerUnitsMapOfValuationExtension_apply, integerRingMapOfValuationExtension,
    sub_eq_add_neg] using hmap
 

def principalUnitsMapOfUnramifiedValuation (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [Module.Finite 𝒪[K] 𝒪[L]]
    [LocalFieldTheory.IsNonarchimedeanLocalField.IsUnramifiedValuedExtension K L]
    (n : Nat) :
    principalUnits K n →* principalUnits L n where
  toFun u :=
    ⟨integerUnitsMapOfValuationExtension K L u.1,
      integerUnitsMapOfValuationExtension_mem_principalUnits_of_unramifiedValuation
        K L n u.2⟩
  map_one' := by
    ext
    simp
  map_mul' u v := by
    ext
    simp
 

@[simp]
theorem principalUnitsMapOfUnramifiedValuation_apply (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [Module.Finite 𝒪[K] 𝒪[L]]
    [LocalFieldTheory.IsNonarchimedeanLocalField.IsUnramifiedValuedExtension K L]
    (n : Nat) (u : principalUnits K n) :
    ((principalUnitsMapOfUnramifiedValuation K L n u : principalUnits L n) :
        𝒪[L]ˣ) =
      integerUnitsMapOfValuationExtension K L u.1 :=
  rfl
 

theorem principalUnitsMapOfUnramifiedValuation_oneAdd (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [Module.Finite 𝒪[K] 𝒪[L]]
    [LocalFieldTheory.IsNonarchimedeanLocalField.IsUnramifiedValuedExtension K L]
    (n : Nat) (hn : 1 ≤ n) (a : (𝓂[K] ^ n : Ideal 𝒪[K])) :
    principalUnitsMapOfUnramifiedValuation K L n
        (principalUnitOneAddOfMemPowSubgroup K hn (a : 𝒪[K]) a.2) =
      principalUnitOneAddOfMemPowSubgroup L hn
        (integerRingMapOfValuationExtension K L (a : 𝒪[K]))
        (integerRingMap_mem_maximalIdeal_pow_of_unramifiedValuation K L n a.2) := by
  ext
  simp [principalUnitsMapOfUnramifiedValuation, principalUnitOneAddOfMemPowSubgroup,
    principalUnitOneAddOfMemPow_val, integerRingMapOfValuationExtension]
 

def principalUnitsSuccQuotMapOfUnramifiedValuation (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [Module.Finite 𝒪[K] 𝒪[L]]
    [LocalFieldTheory.IsNonarchimedeanLocalField.IsUnramifiedValuedExtension K L]
    (n : Nat) :
    PrincipalUnitsSuccQuot K n →* PrincipalUnitsSuccQuot L n :=
  principalUnitsSuccQuotLift n
    ((principalUnitsSuccQuotMk L n).comp
      (principalUnitsMapOfUnramifiedValuation K L n))
    (by
      intro u hu
      rw [MonoidHom.mem_ker, MonoidHom.comp_apply,
        principalUnitsSuccQuotMk_eq_one_iff]
      change ((principalUnitsMapOfUnramifiedValuation K L n u :
        principalUnits L n) : 𝒪[L]ˣ) ∈ principalUnits L (n + 1)
      simpa [principalUnitsMapOfUnramifiedValuation_apply]
        using integerUnitsMapOfValuationExtension_mem_principalUnits_of_unramifiedValuation
          K L (n + 1) (u := u.1) hu)
 

@[simp]
theorem principalUnitsSuccQuotMapOfUnramifiedValuation_mk (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [Module.Finite 𝒪[K] 𝒪[L]]
    [LocalFieldTheory.IsNonarchimedeanLocalField.IsUnramifiedValuedExtension K L]
    (n : Nat) (u : principalUnits K n) :
    principalUnitsSuccQuotMapOfUnramifiedValuation K L n
        (principalUnitsSuccQuotMk K n u) =
      principalUnitsSuccQuotMk L n
        (principalUnitsMapOfUnramifiedValuation K L n u) :=
  rfl
 

theorem principalUnitsSuccQuotOfMaximalIdealPowSuccQuot_map
    (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [Module.Finite 𝒪[K] 𝒪[L]]
    [LocalFieldTheory.IsNonarchimedeanLocalField.IsUnramifiedValuedExtension K L]
    (n : Nat) (hn : 1 ≤ n) (x : MaximalIdealPowSuccQuot K n) :
    principalUnitsSuccQuotMapOfUnramifiedValuation K L n
        (principalUnitsSuccQuotOfMaximalIdealPowSuccQuot K n hn x) =
    principalUnitsSuccQuotOfMaximalIdealPowSuccQuot L n hn
        (maximalIdealPowSuccQuotMapOfUnramifiedValuation K L n x) := by
  refine MaximalIdealPowSuccQuot.inductionOn n
    (motive := fun x =>
      principalUnitsSuccQuotMapOfUnramifiedValuation K L n
          (principalUnitsSuccQuotOfMaximalIdealPowSuccQuot K n hn x) =
        principalUnitsSuccQuotOfMaximalIdealPowSuccQuot L n hn
          (maximalIdealPowSuccQuotMapOfUnramifiedValuation K L n x))
    x ?_
  intro a
  rw [maximalIdealPowSuccQuotMapOfUnramifiedValuation_mk,
    principalUnitsSuccQuotOfMaximalIdealPowSuccQuot_mk,
    principalUnitsSuccQuotOfMaximalIdealPowSuccQuot_mk]
  rw [principalUnitsSuccQuotOfIdealPow_apply, principalUnitsSuccQuotOfIdealPow_apply,
    principalUnitsSuccQuotMapOfUnramifiedValuation_mk]
  congr 1
  exact principalUnitsMapOfUnramifiedValuation_oneAdd K L n hn a
 

theorem principalUnitsSuccQuotOfMaximalIdealPowSuccQuotAdd_map
    (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [Module.Finite 𝒪[K] 𝒪[L]]
    [LocalFieldTheory.IsNonarchimedeanLocalField.IsUnramifiedValuedExtension K L]
    (n : Nat) (hn : 1 ≤ n) (x : MaximalIdealPowSuccQuot K n) :
    MonoidHom.toAdditive (principalUnitsSuccQuotMapOfUnramifiedValuation K L n)
        (principalUnitsSuccQuotOfMaximalIdealPowSuccQuotAdd K n hn x) =
      principalUnitsSuccQuotOfMaximalIdealPowSuccQuotAdd L n hn
        (maximalIdealPowSuccQuotMapOfUnramifiedValuation K L n x) := by
  change Additive.ofMul
      (principalUnitsSuccQuotMapOfUnramifiedValuation K L n
        (principalUnitsSuccQuotOfMaximalIdealPowSuccQuot K n hn x)) =
    Additive.ofMul
      (principalUnitsSuccQuotOfMaximalIdealPowSuccQuot L n hn
        (maximalIdealPowSuccQuotMapOfUnramifiedValuation K L n x))
  rw [principalUnitsSuccQuotOfMaximalIdealPowSuccQuot_map]
 


theorem principalUnitsSuccQuotAddEquivResidueOfIrreducible_symm_map
    (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [Module.Finite 𝒪[K] 𝒪[L]]
    [LocalFieldTheory.IsNonarchimedeanLocalField.IsUnramifiedValuedExtension K L]
    (n : Nat) (hn : 1 ≤ n) (x : 𝓀[K]) :
    MonoidHom.toAdditive (principalUnitsSuccQuotMapOfUnramifiedValuation K L n)
        ((principalUnitsSuccQuotAddEquivResidueOfIrreducible K
          (chosenIntegerRingUniformizer K) (chosenIntegerRingUniformizer_irreducible K)
          n hn).symm x) =
      (principalUnitsSuccQuotAddEquivResidueOfIrreducible L
        (integerRingMapOfValuationExtension K L (chosenIntegerRingUniformizer K))
        (integerRingMap_uniformizer_irreducible_of_unramifiedValuation K L)
        n hn).symm (residueFieldMapOfValuationExtension K L x) := by
  change MonoidHom.toAdditive (principalUnitsSuccQuotMapOfUnramifiedValuation K L n)
      (principalUnitsSuccQuotOfMaximalIdealPowSuccQuotAdd K n hn
        (residueAddEquivMaximalIdealPowSuccQuotOfIrreducible K
          (chosenIntegerRingUniformizer K) (chosenIntegerRingUniformizer_irreducible K) n x)) =
    principalUnitsSuccQuotOfMaximalIdealPowSuccQuotAdd L n hn
      (residueAddEquivMaximalIdealPowSuccQuotOfIrreducible L
        (integerRingMapOfValuationExtension K L (chosenIntegerRingUniformizer K))
        (integerRingMap_uniformizer_irreducible_of_unramifiedValuation K L)
        n (residueFieldMapOfValuationExtension K L x))
  rw [principalUnitsSuccQuotOfMaximalIdealPowSuccQuotAdd_map]
  rw [residueAddEquivMaximalIdealPowSuccQuotOfIrreducible_map]
 

theorem principalUnitsSuccQuotMapOfUnramifiedValuation_injective
    (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [Module.Finite 𝒪[K] 𝒪[L]]
    [LocalFieldTheory.IsNonarchimedeanLocalField.IsUnramifiedValuedExtension K L]
    (n : Nat) (hn : 1 ≤ n) :
    Function.Injective (principalUnitsSuccQuotMapOfUnramifiedValuation K L n) := by
  intro x y hxy
  let eK :=
    principalUnitsSuccQuotAddEquivResidueOfIrreducible K
      (chosenIntegerRingUniformizer K) (chosenIntegerRingUniformizer_irreducible K) n hn
  let eL :=
    principalUnitsSuccQuotAddEquivResidueOfIrreducible L
      (integerRingMapOfValuationExtension K L (chosenIntegerRingUniformizer K))
      (integerRingMap_uniformizer_irreducible_of_unramifiedValuation K L) n hn
  let xκ : 𝓀[K] := eK (Additive.ofMul x)
  let yκ : 𝓀[K] := eK (Additive.ofMul y)
  have hxmap :
      MonoidHom.toAdditive (principalUnitsSuccQuotMapOfUnramifiedValuation K L n)
          (Additive.ofMul x) =
        eL.symm (residueFieldMapOfValuationExtension K L xκ) := by
    simpa [eK, eL, xκ] using
      principalUnitsSuccQuotAddEquivResidueOfIrreducible_symm_map K L n hn xκ
  have hymap :
      MonoidHom.toAdditive (principalUnitsSuccQuotMapOfUnramifiedValuation K L n)
          (Additive.ofMul y) =
        eL.symm (residueFieldMapOfValuationExtension K L yκ) := by
    simpa [eK, eL, yκ] using
      principalUnitsSuccQuotAddEquivResidueOfIrreducible_symm_map K L n hn yκ
  have hxyAdd :
      MonoidHom.toAdditive (principalUnitsSuccQuotMapOfUnramifiedValuation K L n)
          (Additive.ofMul x) =
        MonoidHom.toAdditive (principalUnitsSuccQuotMapOfUnramifiedValuation K L n)
          (Additive.ofMul y) := by
    change Additive.ofMul
        (principalUnitsSuccQuotMapOfUnramifiedValuation K L n x) =
      Additive.ofMul (principalUnitsSuccQuotMapOfUnramifiedValuation K L n y)
    exact congrArg Additive.ofMul hxy
  have hres :
      residueFieldMapOfValuationExtension K L xκ =
        residueFieldMapOfValuationExtension K L yκ :=
    eL.symm.injective (hxmap.symm.trans (hxyAdd.trans hymap))
  have hκ : xκ = yκ :=
    (RingHom.injective (residueFieldMapOfValuationExtension K L)) hres
  have hadd : Additive.ofMul x = Additive.ofMul y :=
    eK.injective (by simpa [xκ, yκ] using hκ)
  exact Additive.ofMul.injective hadd
 



theorem principalUnits_of_integerUnitsMap_mem_principalUnits_of_unramifiedValuation
    (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [Module.Finite 𝒪[K] 𝒪[L]]
    [LocalFieldTheory.IsNonarchimedeanLocalField.IsUnramifiedValuedExtension K L]
    (n : Nat) {a : 𝒪[K]ˣ}
    (haL : integerUnitsMapOfValuationExtension K L a ∈ principalUnits L n) :
    a ∈ principalUnits K n := by
  let xK : 𝒪[K] := (a : 𝒪[K]) - 1
  let πK : 𝒪[K] := chosenIntegerRingUniformizer K
  have hxLpow : integerRingMapOfValuationExtension K L xK ∈ (𝓂[L] ^ n : Ideal 𝒪[L]) := by
    have haLpow :=
      (mem_principalUnits_iff L (integerUnitsMapOfValuationExtension K L a) n).1 haL
    simpa [xK, integerRingMapOfValuationExtension, sub_eq_add_neg] using haLpow
  have hπL : Irreducible (integerRingMapOfValuationExtension K L πK) := by
    simpa [πK] using integerRingMap_uniformizer_irreducible_of_unramifiedValuation K L
  have hvalL :
      ValuativeRel.valuation L
          ((integerRingMapOfValuationExtension K L xK : 𝒪[L]) : L) ≤
        ValuativeRel.valuation L
          ((integerRingMapOfValuationExtension K L πK : 𝒪[L]) : L) ^ n := by
    have hset := Irreducible.maximalIdeal_pow_eq_setOfPred_le_v_coe_pow
      (ValuativeRel.valuation L) hπL n
    exact (show integerRingMapOfValuationExtension K L xK ∈
        ({y : 𝒪[L] | ValuativeRel.valuation L (y : L) ≤
          ValuativeRel.valuation L
            ((integerRingMapOfValuationExtension K L πK : 𝒪[L]) : L) ^ n}) from by
      rw [← hset]
      exact hxLpow)
  have hvalL' :
      ValuativeRel.valuation L (algebraMap K L (xK : K)) ≤
        ValuativeRel.valuation L (algebraMap K L (((πK ^ n : 𝒪[K]) : K))) := by
    simpa [integerRingMapOfValuationExtension, map_pow] using hvalL
  have hvalKpow :
      ValuativeRel.valuation K (xK : K) ≤
        ValuativeRel.valuation K (((πK ^ n : 𝒪[K]) : K)) :=
    (Valuation.HasExtension.val_map_le_iff
      (ValuativeRel.valuation K) (ValuativeRel.valuation L)
      (xK : K) (((πK ^ n : 𝒪[K]) : K))).1 hvalL'
  rw [mem_principalUnits_iff]
  change xK ∈ (𝓂[K] ^ n : Ideal 𝒪[K])
  have hsetK := Irreducible.maximalIdeal_pow_eq_setOfPred_le_v_coe_pow
    (ValuativeRel.valuation K) (chosenIntegerRingUniformizer_irreducible K) n
  have hvalK : xK ∈
      ({y : 𝒪[K] | ValuativeRel.valuation K (y : K) ≤
        ValuativeRel.valuation K ((πK : 𝒪[K]) : K) ^ n}) := by
    simpa [πK, map_pow] using hvalKpow
  change xK ∈ ((𝓂[K] ^ n : Ideal 𝒪[K]) : Set 𝒪[K])
  rw [hsetK]
  exact hvalK
 

theorem galoisGroup_card_eq_finrank (K L : Type u)
    [Field K] [Field L] [Algebra K L] [FiniteDimensional K L] [IsGalois K L] :
    Nat.card Gal(L / K) = Module.finrank K L :=
  IsGalois.card_aut_eq_finrank (F := K) (E := L)
 

theorem residueAlgEquiv_card_eq_finrank_of_unramifiedValuation
    (K L : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] [Field L] [ValuativeRel L] [TopologicalSpace L]
    [IsNonarchimedeanLocalField L] [Algebra K L] [FiniteDimensional K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [Module.Finite 𝒪[K] 𝒪[L]]
    [LocalFieldTheory.IsNonarchimedeanLocalField.IsUnramifiedValuedExtension K L] :
    Nat.card (𝓀[L] ≃ₐ[𝓀[K]] 𝓀[L]) = Module.finrank K L := by
  rw [residueAlgEquiv_card_eq_finrank K L,
    LocalFieldTheory.IsNonarchimedeanLocalField.unramifiedValuation_residue_finrank_eq_finrank K L]
 

theorem residueAlgEquiv_card_eq_galoisGroup_card_of_unramifiedValuation
    (K L : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] [Field L] [ValuativeRel L] [TopologicalSpace L]
    [IsNonarchimedeanLocalField L] [Algebra K L] [FiniteDimensional K L]
    [IsGalois K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [Module.Finite 𝒪[K] 𝒪[L]]
    [LocalFieldTheory.IsNonarchimedeanLocalField.IsUnramifiedValuedExtension K L] :
    Nat.card (𝓀[L] ≃ₐ[𝓀[K]] 𝓀[L]) = Nat.card Gal(L / K) := by
  rw [residueAlgEquiv_card_eq_finrank_of_unramifiedValuation K L,
    galoisGroup_card_eq_finrank K L]
 

theorem galoisGroupResidueAlgEquivHomOfIsIntegralClosure_ker_card_eq_one_of_unramifiedValuation
    (K L : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] [Field L] [ValuativeRel L] [TopologicalSpace L]
    [IsNonarchimedeanLocalField L] [Algebra K L] [FiniteDimensional K L]
    [IsGalois K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [IsIntegralClosure 𝒪[L] 𝒪[K] L] [Module.Finite 𝒪[K] 𝒪[L]]
    [LocalFieldTheory.IsNonarchimedeanLocalField.IsUnramifiedValuedExtension K L] :
    Nat.card (galoisGroupResidueAlgEquivHomOfIsIntegralClosure K L).ker = 1 :=
  galoisGroupResidueAlgEquivHomOfIsIntegralClosure_ker_card_eq_one_of_ramificationIdx_eq_one K L
    (LocalFieldTheory.IsNonarchimedeanLocalField.unramifiedValuation_ramificationIdx_eq_one K L)
 

theorem galoisGroupResidueAlgEquivHomOfIsIntegralClosure_injective_of_unramifiedValuation
    (K L : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] [Field L] [ValuativeRel L] [TopologicalSpace L]
    [IsNonarchimedeanLocalField L] [Algebra K L] [FiniteDimensional K L]
    [IsGalois K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [IsIntegralClosure 𝒪[L] 𝒪[K] L] [Module.Finite 𝒪[K] 𝒪[L]]
    [LocalFieldTheory.IsNonarchimedeanLocalField.IsUnramifiedValuedExtension K L] :
    Function.Injective (galoisGroupResidueAlgEquivHomOfIsIntegralClosure K L) := by
  refine (MonoidHom.ker_eq_bot_iff _).mp ?_
  exact ((galoisGroupResidueAlgEquivHomOfIsIntegralClosure K L).ker).eq_bot_of_card_eq
    (galoisGroupResidueAlgEquivHomOfIsIntegralClosure_ker_card_eq_one_of_unramifiedValuation
      K L)
 

theorem galoisGroupResidueAlgEquivHomOfIsIntegralClosure_surjective_of_unramifiedValuation
    (K L : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] [Field L] [ValuativeRel L] [TopologicalSpace L]
    [IsNonarchimedeanLocalField L] [Algebra K L] [FiniteDimensional K L]
    [IsGalois K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [IsIntegralClosure 𝒪[L] 𝒪[K] L] [Module.Finite 𝒪[K] 𝒪[L]]
    [LocalFieldTheory.IsNonarchimedeanLocalField.IsUnramifiedValuedExtension K L] :
    Function.Surjective (galoisGroupResidueAlgEquivHomOfIsIntegralClosure K L) := by
  exact ((Nat.bijective_iff_injective_and_card
    (galoisGroupResidueAlgEquivHomOfIsIntegralClosure K L)).2
      ⟨galoisGroupResidueAlgEquivHomOfIsIntegralClosure_injective_of_unramifiedValuation
          K L,
        (residueAlgEquiv_card_eq_galoisGroup_card_of_unramifiedValuation K L).symm⟩).2
 

theorem galoisGroupResidueAlgEquivHomOfIsIntegralClosure_bijective_of_unramifiedValuation
    (K L : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] [Field L] [ValuativeRel L] [TopologicalSpace L]
    [IsNonarchimedeanLocalField L] [Algebra K L] [FiniteDimensional K L]
    [IsGalois K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [IsIntegralClosure 𝒪[L] 𝒪[K] L] [Module.Finite 𝒪[K] 𝒪[L]]
    [LocalFieldTheory.IsNonarchimedeanLocalField.IsUnramifiedValuedExtension K L] :
    Function.Bijective (galoisGroupResidueAlgEquivHomOfIsIntegralClosure K L) :=
  ⟨galoisGroupResidueAlgEquivHomOfIsIntegralClosure_injective_of_unramifiedValuation K L,
    galoisGroupResidueAlgEquivHomOfIsIntegralClosure_surjective_of_unramifiedValuation K L⟩
 

noncomputable def galoisGroupEquivResidueAlgEquivOfUnramifiedValuationOfIsIntegralClosure
    (K L : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] [Field L] [ValuativeRel L] [TopologicalSpace L]
    [IsNonarchimedeanLocalField L] [Algebra K L] [FiniteDimensional K L]
    [IsGalois K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [IsIntegralClosure 𝒪[L] 𝒪[K] L] [Module.Finite 𝒪[K] 𝒪[L]]
    [LocalFieldTheory.IsNonarchimedeanLocalField.IsUnramifiedValuedExtension K L] :
    Gal(L / K) ≃* (𝓀[L] ≃ₐ[𝓀[K]] 𝓀[L]) :=
  MulEquiv.ofBijective (galoisGroupResidueAlgEquivHomOfIsIntegralClosure K L)
    (galoisGroupResidueAlgEquivHomOfIsIntegralClosure_bijective_of_unramifiedValuation K L)
 

@[simp]
theorem galoisGroupEquivResidueAlgEquivOfUnramifiedValuationOfIsIntegralClosure_apply
    (K L : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] [Field L] [ValuativeRel L] [TopologicalSpace L]
    [IsNonarchimedeanLocalField L] [Algebra K L] [FiniteDimensional K L]
    [IsGalois K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [IsIntegralClosure 𝒪[L] 𝒪[K] L] [Module.Finite 𝒪[K] 𝒪[L]]
    [LocalFieldTheory.IsNonarchimedeanLocalField.IsUnramifiedValuedExtension K L]
    (σ : Gal(L / K)) :
    galoisGroupEquivResidueAlgEquivOfUnramifiedValuationOfIsIntegralClosure K L σ =
      galoisGroupResidueAlgEquivOfIsIntegralClosure K L σ :=
  rfl
 


theorem galoisGroupResidueAlgEquivOfIsIntegralClosure_prod_eq_prod_algEquiv_of_unramifiedValuation
    (K L : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] [Field L] [ValuativeRel L] [TopologicalSpace L]
    [IsNonarchimedeanLocalField L] [Algebra K L] [FiniteDimensional K L]
    [IsGalois K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [IsIntegralClosure 𝒪[L] 𝒪[K] L] [Module.Finite 𝒪[K] 𝒪[L]]
    [LocalFieldTheory.IsNonarchimedeanLocalField.IsUnramifiedValuedExtension K L]
    (u : 𝓀[L]ˣ) :
    Finset.univ.prod (fun σ : Gal(L / K) =>
      Units.mapEquiv
        (galoisGroupResidueAlgEquivOfIsIntegralClosure K L σ).toMulEquiv u) =
    Finset.univ.prod (fun τ : 𝓀[L] ≃ₐ[𝓀[K]] 𝓀[L] =>
      Units.mapEquiv τ.toMulEquiv u) :=
  Fintype.prod_equiv
    (galoisGroupEquivResidueAlgEquivOfUnramifiedValuationOfIsIntegralClosure K L).toEquiv
    (fun σ : Gal(L / K) =>
      Units.mapEquiv
        (galoisGroupResidueAlgEquivOfIsIntegralClosure K L σ).toMulEquiv u)
    (fun τ : 𝓀[L] ≃ₐ[𝓀[K]] 𝓀[L] => Units.mapEquiv τ.toMulEquiv u)
    (by intro σ; rfl)
 


theorem galoisGroupResidueAlgEquivOfIsIntegralClosure_sum_eq_sum_algEquiv_of_unramifiedValuation
    (K L : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] [Field L] [ValuativeRel L] [TopologicalSpace L]
    [IsNonarchimedeanLocalField L] [Algebra K L] [FiniteDimensional K L]
    [IsGalois K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [IsIntegralClosure 𝒪[L] 𝒪[K] L] [Module.Finite 𝒪[K] 𝒪[L]]
    [LocalFieldTheory.IsNonarchimedeanLocalField.IsUnramifiedValuedExtension K L]
    (x : 𝓀[L]) :
    Finset.univ.sum (fun σ : Gal(L / K) =>
      galoisGroupResidueAlgEquivOfIsIntegralClosure K L σ x) =
    Finset.univ.sum (fun τ : 𝓀[L] ≃ₐ[𝓀[K]] 𝓀[L] => τ x) :=
  Fintype.sum_equiv
    (galoisGroupEquivResidueAlgEquivOfUnramifiedValuationOfIsIntegralClosure K L).toEquiv
    (fun σ : Gal(L / K) => galoisGroupResidueAlgEquivOfIsIntegralClosure K L σ x)
    (fun τ : 𝓀[L] ≃ₐ[𝓀[K]] 𝓀[L] => τ x)
    (by intro σ; rfl)
 

theorem galoisGroup_sum_residue_eq_algebraMap_trace_of_unramifiedValuation_of_isIntegralClosure
    (K L : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] [Field L] [ValuativeRel L] [TopologicalSpace L]
    [IsNonarchimedeanLocalField L] [Algebra K L] [FiniteDimensional K L]
    [IsGalois K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [IsIntegralClosure 𝒪[L] 𝒪[K] L] [Module.Finite 𝒪[K] 𝒪[L]]
    [LocalFieldTheory.IsNonarchimedeanLocalField.IsUnramifiedValuedExtension K L]
    (a : 𝒪[L]) :
    IsLocalRing.residue 𝒪[L]
        (Finset.univ.sum fun σ : Gal(L / K) =>
          galoisGroupIntegerRingEquivOfIsIntegralClosure K L σ a) =
      algebraMap 𝓀[K] 𝓀[L]
        (Algebra.trace 𝓀[K] 𝓀[L] (IsLocalRing.residue 𝒪[L] a)) := by
  rw [galoisGroup_sum_residue_eq_residueAlgEquiv_sum_of_isIntegralClosure K L a]
  rw [galoisGroupResidueAlgEquivOfIsIntegralClosure_sum_eq_sum_algEquiv_of_unramifiedValuation
    K L]
  exact (trace_eq_sum_automorphisms
    (K := 𝓀[K]) (L := 𝓀[L]) (IsLocalRing.residue 𝒪[L] a)).symm
 

theorem galoisGroup_sum_mul_base_uniformizer_pow_eq_coeff_sum_of_isIntegralClosure
    (K L : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] [Field L] [ValuativeRel L]
    [Algebra K L] [FiniteDimensional K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [IsIntegralClosure 𝒪[L] 𝒪[K] L]
    (n : Nat) (r : 𝒪[L]) :
    let πL := integerRingMapOfValuationExtension K L (chosenIntegerRingUniformizer K)
    Finset.univ.sum (fun σ : Gal(L / K) =>
        galoisGroupIntegerRingEquivOfIsIntegralClosure K L σ (r * πL ^ n)) =
      (Finset.univ.sum fun σ : Gal(L / K) =>
        galoisGroupIntegerRingEquivOfIsIntegralClosure K L σ r) * πL ^ n := by
  intro πL
  rw [Finset.sum_mul]
  refine Finset.sum_congr rfl ?_
  intro σ _
  rw [map_mul, map_pow]
  change galoisGroupIntegerRingEquivOfIsIntegralClosure K L σ r *
      (galoisGroupIntegerRingEquivOfIsIntegralClosure K L σ
        (integerRingMapOfValuationExtension K L (chosenIntegerRingUniformizer K))) ^ n =
    galoisGroupIntegerRingEquivOfIsIntegralClosure K L σ r * πL ^ n
  rw [galoisGroupIntegerRingEquivOfIsIntegralClosure_integerRingMap]
 

theorem galoisSum_uniformizerGraded_eq_residueTrace
    (K L : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] [Field L] [ValuativeRel L] [TopologicalSpace L]
    [IsNonarchimedeanLocalField L] [Algebra K L] [FiniteDimensional K L]
    [IsGalois K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [IsIntegralClosure 𝒪[L] 𝒪[K] L] [Module.Finite 𝒪[K] 𝒪[L]]
    [LocalFieldTheory.IsNonarchimedeanLocalField.IsUnramifiedValuedExtension K L]
    (n : Nat) (r : 𝒪[L]) :
    let πL := integerRingMapOfValuationExtension K L (chosenIntegerRingUniformizer K)
    let hπL := integerRingMap_uniformizer_irreducible_of_unramifiedValuation K L
    maximalIdealPowSuccQuotMulUniformizerPowMap L πL hπL n
        (Finset.univ.sum fun σ : Gal(L / K) =>
          galoisGroupIntegerRingEquivOfIsIntegralClosure K L σ r) =
      residueAddEquivMaximalIdealPowSuccQuotOfIrreducible L πL hπL n
        (algebraMap 𝓀[K] 𝓀[L]
          (Algebra.trace 𝓀[K] 𝓀[L] (IsLocalRing.residue 𝒪[L] r))) := by
  intro πL hπL
  rw [← residueAddEquivMaximalIdealPowSuccQuotOfIrreducible_residue L πL hπL n
    (Finset.univ.sum fun σ : Gal(L / K) =>
      galoisGroupIntegerRingEquivOfIsIntegralClosure K L σ r)]
  rw [galoisGroup_sum_residue_eq_algebraMap_trace_of_unramifiedValuation_of_isIntegralClosure
    K L r]
end
end LocalFieldTheory
end

/- ClassFieldTheory.LocalClassFieldTheory.Finite.Unramified.PrincipalUnits.Basic -/
section
noncomputable section
universe u
namespace LocalClassFieldTheory
open scoped ValuativeRel
open LocalFieldTheory
open LocalFieldTheory.IsNonarchimedeanLocalField
open Filter
 

theorem normIntegerUnits_mem_principalUnits_of_unramifiedValuation_of_isIntegralClosure
    (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L] [IsGalois K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [LocalFieldTheory.ValuativeExtension K L] [IsIntegralClosure 𝒪[L] 𝒪[K] L]
    [Module.Finite 𝒪[K] 𝒪[L]]
    [LocalFieldTheory.IsNonarchimedeanLocalField.IsUnramifiedValuedExtension K L]
    (n : Nat) (u : 𝒪[L]ˣ) (hu : u ∈ principalUnits L n) :
    normIntegerUnits K L u ∈ principalUnits K n := by
  apply principalUnits_of_integerUnitsMap_mem_principalUnits_of_unramifiedValuation K L n
  exact integerUnitsMap_normIntegerUnits_mem_principalUnits_of_isIntegralClosure K L n u hu
 

noncomputable def principalUnitsNormOfUnramifiedValuationOfIsIntegralClosure
    (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L] [IsGalois K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [LocalFieldTheory.ValuativeExtension K L] [IsIntegralClosure 𝒪[L] 𝒪[K] L]
    [Module.Finite 𝒪[K] 𝒪[L]]
    [LocalFieldTheory.IsNonarchimedeanLocalField.IsUnramifiedValuedExtension K L] (n : Nat) :
    principalUnits L n →* principalUnits K n where
  toFun u :=
    ⟨normIntegerUnits K L u.1,
      normIntegerUnits_mem_principalUnits_of_unramifiedValuation_of_isIntegralClosure
        K L n u.1 u.2⟩
  map_one' := by
    ext
    simp
  map_mul' := by
    intro u v
    ext
    simp
 
@[simp]
theorem principalUnitsNormOfUnramifiedValuationOfIsIntegralClosure_apply
    (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L] [IsGalois K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [LocalFieldTheory.ValuativeExtension K L] [IsIntegralClosure 𝒪[L] 𝒪[K] L]
    [Module.Finite 𝒪[K] 𝒪[L]]
    [LocalFieldTheory.IsNonarchimedeanLocalField.IsUnramifiedValuedExtension K L] (n : Nat)
    (u : principalUnits L n) :
    ((principalUnitsNormOfUnramifiedValuationOfIsIntegralClosure K L n u :
        principalUnits K n) : 𝒪[K]ˣ) =
      normIntegerUnits K L u.1 :=
  rfl
 


theorem principalUnitsMap_normOfUnramifiedValuationOfIsIntegralClosure_eq_normExtensionSide
    (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L] [IsGalois K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [LocalFieldTheory.ValuativeExtension K L] [IsIntegralClosure 𝒪[L] 𝒪[K] L]
    [Module.Finite 𝒪[K] 𝒪[L]]
    [LocalFieldTheory.IsNonarchimedeanLocalField.IsUnramifiedValuedExtension K L]
    (n : Nat) (u : principalUnits L n) :
    principalUnitsMapOfUnramifiedValuation K L n
        (principalUnitsNormOfUnramifiedValuationOfIsIntegralClosure K L n u) =
      principalUnitsNormExtensionSideOfIsIntegralClosure K L n u := by
  ext
  rfl
namespace UnramifiedPrincipalUnits
 

theorem norm_oneAdd_sub_galoisSum_mem_next
    (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L] [IsGalois K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [LocalFieldTheory.ValuativeExtension K L] [IsIntegralClosure 𝒪[L] 𝒪[K] L]
    [Module.Finite 𝒪[K] 𝒪[L]]
    [LocalFieldTheory.IsNonarchimedeanLocalField.IsUnramifiedValuedExtension K L]
    (n : Nat) (hn : 1 ≤ n) (a : (𝓂[L] ^ n : Ideal 𝒪[L])) :
    (((principalUnitsMapOfUnramifiedValuation K L n
          (principalUnitsNormOfUnramifiedValuationOfIsIntegralClosure K L n
            (principalUnitOneAddOfMemPowSubgroup L hn (a : 𝒪[L]) a.2)) :
        principalUnits L n) : 𝒪[L]ˣ) : 𝒪[L]) - 1 -
      (Finset.univ.sum fun σ : Gal(L / K) =>
        galoisGroupIntegerRingEquivOfIsIntegralClosure K L σ (a : 𝒪[L])) ∈
        (𝓂[L] ^ (n + 1) : Ideal 𝒪[L]) := by
  rw [principalUnitsMap_normOfUnramifiedValuationOfIsIntegralClosure_eq_normExtensionSide
    K L n (principalUnitOneAddOfMemPowSubgroup L hn (a : 𝒪[L]) a.2)]
  exact
      principalUnitsNormExtensionSideOfIsIntegralClosure_oneAdd_sub_one_sub_sum_mem_maximalIdeal_pow_succ
      K L n hn a
end UnramifiedPrincipalUnits
 


noncomputable def principalUnitsSuccQuotNormOfUnramifiedValuationOfIsIntegralClosure
    (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L] [IsGalois K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [LocalFieldTheory.ValuativeExtension K L] [IsIntegralClosure 𝒪[L] 𝒪[K] L]
    [Module.Finite 𝒪[K] 𝒪[L]]
    [LocalFieldTheory.IsNonarchimedeanLocalField.IsUnramifiedValuedExtension K L] (n : Nat) :
    PrincipalUnitsSuccQuot L n →* PrincipalUnitsSuccQuot K n :=
  principalUnitsSuccQuotLift n
    ((principalUnitsSuccQuotMk K n).comp
      (principalUnitsNormOfUnramifiedValuationOfIsIntegralClosure K L n))
    (by
      intro u hu
      rw [MonoidHom.mem_ker, MonoidHom.comp_apply,
        principalUnitsSuccQuotMk_eq_one_iff]
      change ((principalUnitsNormOfUnramifiedValuationOfIsIntegralClosure K L n u :
          principalUnits K n) : 𝒪[K]ˣ) ∈ principalUnits K (n + 1)
      simpa [principalUnitsNormOfUnramifiedValuationOfIsIntegralClosure_apply]
        using
          normIntegerUnits_mem_principalUnits_of_unramifiedValuation_of_isIntegralClosure
            K L (n + 1) u.1 hu)
 
@[simp]
theorem principalUnitsSuccQuotNormOfUnramifiedValuationOfIsIntegralClosure_mk
    (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L] [IsGalois K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [LocalFieldTheory.ValuativeExtension K L] [IsIntegralClosure 𝒪[L] 𝒪[K] L]
    [Module.Finite 𝒪[K] 𝒪[L]]
    [LocalFieldTheory.IsNonarchimedeanLocalField.IsUnramifiedValuedExtension K L] (n : Nat)
    (u : principalUnits L n) :
    principalUnitsSuccQuotNormOfUnramifiedValuationOfIsIntegralClosure K L n
        (principalUnitsSuccQuotMk L n u) =
      principalUnitsSuccQuotMk K n
        (principalUnitsNormOfUnramifiedValuationOfIsIntegralClosure K L n u) :=
  rfl
 

theorem principalUnitsSuccQuotMap_normOfUnramifiedValuationOfIsIntegralClosure_oneAdd_base_eq_sum
    (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L] [IsGalois K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [LocalFieldTheory.ValuativeExtension K L] [IsIntegralClosure 𝒪[L] 𝒪[K] L]
    [Module.Finite 𝒪[K] 𝒪[L]]
    [LocalFieldTheory.IsNonarchimedeanLocalField.IsUnramifiedValuedExtension K L]
    (n : Nat) (hn : 1 ≤ n) (a : (𝓂[L] ^ n : Ideal 𝒪[L])) :
    let b : (𝓂[L] ^ n : Ideal 𝒪[L]) :=
      ⟨Finset.univ.sum fun σ : Gal(L / K) =>
          galoisGroupIntegerRingEquivOfIsIntegralClosure K L σ (a : 𝒪[L]),
        by
          classical
          exact Ideal.sum_mem _ fun σ _ =>
            (integerRingEquiv_mem_maximalIdeal_pow L
              (galoisGroupIntegerRingEquivOfIsIntegralClosure K L σ) n
              (a : 𝒪[L])).2 a.2⟩
    principalUnitsSuccQuotMapOfUnramifiedValuation K L n
        (principalUnitsSuccQuotNormOfUnramifiedValuationOfIsIntegralClosure K L n
          (principalUnitsSuccQuotMk L n
            (principalUnitOneAddOfMemPowSubgroup L hn (a : 𝒪[L]) a.2))) =
      principalUnitsSuccQuotOfIdealPow L n hn b := by
  classical
  intro b
  rw [principalUnitsSuccQuotNormOfUnramifiedValuationOfIsIntegralClosure_mk,
    principalUnitsSuccQuotMapOfUnramifiedValuation_mk]
  exact principalUnitsSuccQuotMk_eq_oneAdd_of_sub_one_sub_mem_succ L n hn
    (principalUnitsMapOfUnramifiedValuation K L n
      (principalUnitsNormOfUnramifiedValuationOfIsIntegralClosure K L n
        (principalUnitOneAddOfMemPowSubgroup L hn (a : 𝒪[L]) a.2)))
    b
    (by
      simpa [b] using
    UnramifiedPrincipalUnits.norm_oneAdd_sub_galoisSum_mem_next
          K L n hn a)
end LocalClassFieldTheory
end

/- ClassFieldTheory.LocalClassFieldTheory.Finite.Unramified.PrincipalUnits.Trace -/
section
noncomputable section
universe u
namespace LocalClassFieldTheory
open scoped ValuativeRel
open LocalFieldTheory
open LocalFieldTheory.IsNonarchimedeanLocalField
open Filter
namespace UnramifiedPrincipalUnits
 


theorem quotientNorm_oneAdd_uniformizerPow_eq_trace
    (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L] [IsGalois K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [LocalFieldTheory.ValuativeExtension K L] [IsIntegralClosure 𝒪[L] 𝒪[K] L]
    [Module.Finite 𝒪[K] 𝒪[L]]
    [LocalFieldTheory.IsNonarchimedeanLocalField.IsUnramifiedValuedExtension K L]
    (n : Nat) (hn : 1 ≤ n) (r : 𝒪[L]) :
    let πL := integerRingMapOfValuationExtension K L (chosenIntegerRingUniformizer K)
    let hπL := integerRingMap_uniformizer_irreducible_of_unramifiedValuation K L
    let a : (𝓂[L] ^ n : Ideal 𝒪[L]) :=
      maximalIdealPowMulUniformizerPowMap L πL hπL n r
    Additive.ofMul
        (principalUnitsSuccQuotMapOfUnramifiedValuation K L n
          (principalUnitsSuccQuotNormOfUnramifiedValuationOfIsIntegralClosure K L n
            (principalUnitsSuccQuotMk L n
              (principalUnitOneAddOfMemPowSubgroup L hn (a : 𝒪[L]) a.2)))) =
      (principalUnitsSuccQuotAddEquivResidueOfIrreducible L πL hπL n hn).symm
        (algebraMap 𝓀[K] 𝓀[L]
          (Algebra.trace 𝓀[K] 𝓀[L] (IsLocalRing.residue 𝒪[L] r))) := by
  classical
  intro πL hπL a
  let b : (𝓂[L] ^ n : Ideal 𝒪[L]) :=
    ⟨Finset.univ.sum fun σ : Gal(L / K) =>
        galoisGroupIntegerRingEquivOfIsIntegralClosure K L σ (a : 𝒪[L]),
      by
        exact Ideal.sum_mem _ fun σ _ =>
          (integerRingEquiv_mem_maximalIdeal_pow L
            (galoisGroupIntegerRingEquivOfIsIntegralClosure K L σ) n
            (a : 𝒪[L])).2 a.2⟩
  have hnorm :=
    principalUnitsSuccQuotMap_normOfUnramifiedValuationOfIsIntegralClosure_oneAdd_base_eq_sum
      K L n hn a
  change Additive.ofMul
      (principalUnitsSuccQuotMapOfUnramifiedValuation K L n
        (principalUnitsSuccQuotNormOfUnramifiedValuationOfIsIntegralClosure K L n
          (principalUnitsSuccQuotMk L n
            (principalUnitOneAddOfMemPowSubgroup L hn (a : 𝒪[L]) a.2)))) =
    (principalUnitsSuccQuotAddEquivResidueOfIrreducible L πL hπL n hn).symm
      (algebraMap 𝓀[K] 𝓀[L]
        (Algebra.trace 𝓀[K] 𝓀[L] (IsLocalRing.residue 𝒪[L] r)))
  rw [hnorm]
  rw [principalUnitsSuccQuotAddEquivResidueOfIrreducible_symm_apply]
  change Additive.ofMul (principalUnitsSuccQuotOfIdealPow L n hn b) =
    principalUnitsSuccQuotOfMaximalIdealPowSuccQuotAdd L n hn
      (residueAddEquivMaximalIdealPowSuccQuotOfIrreducible L πL hπL n
        (algebraMap 𝓀[K] 𝓀[L]
          (Algebra.trace 𝓀[K] 𝓀[L] (IsLocalRing.residue 𝒪[L] r))))
  rw [← principalUnitsSuccQuotOfMaximalIdealPowSuccQuot_mk L n hn b]
  change principalUnitsSuccQuotOfMaximalIdealPowSuccQuotAdd L n hn
      (maximalIdealPowSuccQuotMk L n b) =
    principalUnitsSuccQuotOfMaximalIdealPowSuccQuotAdd L n hn
      (residueAddEquivMaximalIdealPowSuccQuotOfIrreducible L πL hπL n
        (algebraMap 𝓀[K] 𝓀[L]
          (Algebra.trace 𝓀[K] 𝓀[L] (IsLocalRing.residue 𝒪[L] r))))
  congr 1
  have hb_eq :
      (b : 𝒪[L]) =
        (Finset.univ.sum fun σ : Gal(L / K) =>
          galoisGroupIntegerRingEquivOfIsIntegralClosure K L σ r) * πL ^ n := by
    simpa [b, a, πL] using
      galoisGroup_sum_mul_base_uniformizer_pow_eq_coeff_sum_of_isIntegralClosure K L n r
  rw [show maximalIdealPowSuccQuotMk L n b =
      maximalIdealPowSuccQuotMulUniformizerPowMap L πL hπL n
        (Finset.univ.sum fun σ : Gal(L / K) =>
          galoisGroupIntegerRingEquivOfIsIntegralClosure K L σ r) by
    rw [maximalIdealPowSuccQuotMulUniformizerPowMap_apply]
    apply congrArg (maximalIdealPowSuccQuotMk L n)
    apply Subtype.ext
    calc
      (b : 𝒪[L]) = (Finset.univ.sum fun σ : Gal(L / K) =>
            galoisGroupIntegerRingEquivOfIsIntegralClosure K L σ r) * πL ^ n := hb_eq
      _ =
          ((maximalIdealPowMulUniformizerPowMap L πL hπL n
            (Finset.univ.sum fun σ : Gal(L / K) =>
              galoisGroupIntegerRingEquivOfIsIntegralClosure K L σ r) :
            (𝓂[L] ^ n : Ideal 𝒪[L])) : 𝒪[L]) := by
        rw [maximalIdealPowMulUniformizerPowMap_apply]]
  exact
    galoisSum_uniformizerGraded_eq_residueTrace
      K L n r
end UnramifiedPrincipalUnits
 


theorem principalUnitsSuccQuotNormOfUnramifiedValuationOfIsIntegralClosure_oneAdd_uniformizer_pow_eq_trace
    (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L] [IsGalois K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [LocalFieldTheory.ValuativeExtension K L] [IsIntegralClosure 𝒪[L] 𝒪[K] L]
    [Module.Finite 𝒪[K] 𝒪[L]]
    [LocalFieldTheory.IsNonarchimedeanLocalField.IsUnramifiedValuedExtension K L]
    (n : Nat) (hn : 1 ≤ n) (r : 𝒪[L]) :
    let πK := chosenIntegerRingUniformizer K
    let πL := integerRingMapOfValuationExtension K L πK
    let hπL := integerRingMap_uniformizer_irreducible_of_unramifiedValuation K L
    let a : (𝓂[L] ^ n : Ideal 𝒪[L]) :=
      maximalIdealPowMulUniformizerPowMap L πL hπL n r
    Additive.ofMul
        (principalUnitsSuccQuotNormOfUnramifiedValuationOfIsIntegralClosure K L n
          (principalUnitsSuccQuotMk L n
            (principalUnitOneAddOfMemPowSubgroup L hn (a : 𝒪[L]) a.2))) =
      (principalUnitsSuccQuotAddEquivResidueOfIrreducible K πK
        (chosenIntegerRingUniformizer_irreducible K) n hn).symm
        (Algebra.trace 𝓀[K] 𝓀[L] (IsLocalRing.residue 𝒪[L] r)) := by
  classical
  intro πK πL hπL a
  let x :=
    principalUnitsSuccQuotNormOfUnramifiedValuationOfIsIntegralClosure K L n
      (principalUnitsSuccQuotMk L n
        (principalUnitOneAddOfMemPowSubgroup L hn (a : 𝒪[L]) a.2))
  let y :=
    (principalUnitsSuccQuotAddEquivResidueOfIrreducible K πK
      (chosenIntegerRingUniformizer_irreducible K) n hn).symm
      (Algebra.trace 𝓀[K] 𝓀[L] (IsLocalRing.residue 𝒪[L] r))
  have hxmap :
      MonoidHom.toAdditive (principalUnitsSuccQuotMapOfUnramifiedValuation K L n)
          (Additive.ofMul x) =
        (principalUnitsSuccQuotAddEquivResidueOfIrreducible L πL hπL n hn).symm
          (algebraMap 𝓀[K] 𝓀[L]
            (Algebra.trace 𝓀[K] 𝓀[L] (IsLocalRing.residue 𝒪[L] r))) := by
    simpa [x, πK, πL, hπL, a] using
    UnramifiedPrincipalUnits.quotientNorm_oneAdd_uniformizerPow_eq_trace
        K L n hn r
  have hymap :
      MonoidHom.toAdditive (principalUnitsSuccQuotMapOfUnramifiedValuation K L n) y =
        (principalUnitsSuccQuotAddEquivResidueOfIrreducible L πL hπL n hn).symm
          (algebraMap 𝓀[K] 𝓀[L]
            (Algebra.trace 𝓀[K] 𝓀[L] (IsLocalRing.residue 𝒪[L] r))) := by
    simpa [y, πK, πL, hπL, residueFieldMapOfValuationExtension_eq_algebraMap] using
      principalUnitsSuccQuotAddEquivResidueOfIrreducible_symm_map K L n hn
        (Algebra.trace 𝓀[K] 𝓀[L] (IsLocalRing.residue 𝒪[L] r))
  have hmul : x = Additive.toMul y := by
    apply principalUnitsSuccQuotMapOfUnramifiedValuation_injective K L n hn
    apply Additive.ofMul.injective
    change MonoidHom.toAdditive (principalUnitsSuccQuotMapOfUnramifiedValuation K L n)
        (Additive.ofMul x) =
      MonoidHom.toAdditive (principalUnitsSuccQuotMapOfUnramifiedValuation K L n) y
    exact hxmap.trans hymap.symm
  change Additive.ofMul x = y
  simpa using congrArg Additive.ofMul hmul
 

theorem principalUnitsSuccQuotNormOfUnramifiedValuationOfIsIntegralClosure_trace_coord
    (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L] [IsGalois K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [LocalFieldTheory.ValuativeExtension K L] [IsIntegralClosure 𝒪[L] 𝒪[K] L]
    [Module.Finite 𝒪[K] 𝒪[L]]
    [LocalFieldTheory.IsNonarchimedeanLocalField.IsUnramifiedValuedExtension K L]
    (n : Nat) (hn : 1 ≤ n) (x : 𝓀[L]) :
    let πK := chosenIntegerRingUniformizer K
    let πL := integerRingMapOfValuationExtension K L πK
    let hπL := integerRingMap_uniformizer_irreducible_of_unramifiedValuation K L
    let eK := principalUnitsSuccQuotAddEquivResidueOfIrreducible K πK
      (chosenIntegerRingUniformizer_irreducible K) n hn
    let eL := principalUnitsSuccQuotAddEquivResidueOfIrreducible L πL hπL n hn
    MonoidHom.toAdditive
        (principalUnitsSuccQuotNormOfUnramifiedValuationOfIsIntegralClosure K L n)
        (eL.symm x) =
      eK.symm (Algebra.trace 𝓀[K] 𝓀[L] x) := by
  classical
  intro πK πL hπL eK eL
  obtain ⟨r, rfl⟩ := IsLocalRing.residue_surjective x
  have hrep :=
    principalUnitsSuccQuotNormOfUnramifiedValuationOfIsIntegralClosure_oneAdd_uniformizer_pow_eq_trace
      K L n hn r
  rw [principalUnitsSuccQuotAddEquivResidueOfIrreducible_symm_residue]
  change Additive.ofMul _ = _
  simpa only [eK, eL, πK, πL, hπL, toMul_ofMul] using hrep
 

noncomputable def principalUnitsSuccQuotTraceOfUnramifiedValuation (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [Module.Finite 𝒪[K] 𝒪[L]]
    [LocalFieldTheory.IsNonarchimedeanLocalField.IsUnramifiedValuedExtension K L]
    (n : Nat) (hn : 1 ≤ n) :
    Additive (PrincipalUnitsSuccQuot L n) →+ Additive (PrincipalUnitsSuccQuot K n) :=
  let πK := chosenIntegerRingUniformizer K
  let πL := integerRingMapOfValuationExtension K L πK
  let hπL := integerRingMap_uniformizer_irreducible_of_unramifiedValuation K L
  ((principalUnitsSuccQuotAddEquivResidueOfIrreducible K πK
    (chosenIntegerRingUniformizer_irreducible K) n hn).symm.toAddMonoidHom).comp
    ((Algebra.trace 𝓀[K] 𝓀[L]).toAddMonoidHom.comp
      (principalUnitsSuccQuotAddEquivResidueOfIrreducible L πL hπL n hn).toAddMonoidHom)
 

theorem principalUnitsSuccQuotTraceOfUnramifiedValuation_surjective
    (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [Module.Finite 𝒪[K] 𝒪[L]]
    [LocalFieldTheory.IsNonarchimedeanLocalField.IsUnramifiedValuedExtension K L]
    (n : Nat) (hn : 1 ≤ n) :
    Function.Surjective (principalUnitsSuccQuotTraceOfUnramifiedValuation K L n hn) := by
  classical
  intro y
  let πK := chosenIntegerRingUniformizer K
  let πL := integerRingMapOfValuationExtension K L πK
  let hπL := integerRingMap_uniformizer_irreducible_of_unramifiedValuation K L
  let eK := principalUnitsSuccQuotAddEquivResidueOfIrreducible K πK
    (chosenIntegerRingUniformizer_irreducible K) n hn
  let eL := principalUnitsSuccQuotAddEquivResidueOfIrreducible L πL hπL n hn
  obtain ⟨x, hx⟩ :=
    residueField_trace_surjective_of_valuationExtension K L (eK y)
  refine ⟨eL.symm x, ?_⟩
  change
    (((eK.symm.toAddMonoidHom).comp
      ((Algebra.trace 𝓀[K] 𝓀[L]).toAddMonoidHom.comp eL.toAddMonoidHom))
      (eL.symm x)) = y
  simp [hx]
 


theorem principalUnitsSuccQuotNormOfUnramifiedValuationOfIsIntegralClosure_eq_trace
    (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L] [IsGalois K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [LocalFieldTheory.ValuativeExtension K L] [IsIntegralClosure 𝒪[L] 𝒪[K] L]
    [Module.Finite 𝒪[K] 𝒪[L]]
    [LocalFieldTheory.IsNonarchimedeanLocalField.IsUnramifiedValuedExtension K L]
    (n : Nat) (hn : 1 ≤ n) :
    MonoidHom.toAdditive
        (principalUnitsSuccQuotNormOfUnramifiedValuationOfIsIntegralClosure K L n) =
      principalUnitsSuccQuotTraceOfUnramifiedValuation K L n hn := by
  apply AddMonoidHom.ext
  intro x
  let πK := chosenIntegerRingUniformizer K
  let πL := integerRingMapOfValuationExtension K L πK
  let hπL := integerRingMap_uniformizer_irreducible_of_unramifiedValuation K L
  let eL := principalUnitsSuccQuotAddEquivResidueOfIrreducible L πL hπL n hn
  have hcoord :=
    principalUnitsSuccQuotNormOfUnramifiedValuationOfIsIntegralClosure_trace_coord
      K L n hn (eL x)
  simpa [principalUnitsSuccQuotTraceOfUnramifiedValuation, πK, πL, hπL, eL]
    using hcoord
 


theorem principalUnitsSuccQuotNormOfUnramifiedValuationOfIsIntegralClosure_toAdditive_surjective
    (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L] [IsGalois K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [LocalFieldTheory.ValuativeExtension K L] [IsIntegralClosure 𝒪[L] 𝒪[K] L]
    [Module.Finite 𝒪[K] 𝒪[L]]
    [LocalFieldTheory.IsNonarchimedeanLocalField.IsUnramifiedValuedExtension K L]
    (n : Nat) (hn : 1 ≤ n) :
    Function.Surjective
      (MonoidHom.toAdditive
        (principalUnitsSuccQuotNormOfUnramifiedValuationOfIsIntegralClosure K L n)) := by
  rw [principalUnitsSuccQuotNormOfUnramifiedValuationOfIsIntegralClosure_eq_trace
    K L n hn]
  exact principalUnitsSuccQuotTraceOfUnramifiedValuation_surjective K L n hn
 

theorem principalUnitsSuccQuotNormOfUnramifiedValuationOfIsIntegralClosure_surjective
    (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L] [IsGalois K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [LocalFieldTheory.ValuativeExtension K L] [IsIntegralClosure 𝒪[L] 𝒪[K] L]
    [Module.Finite 𝒪[K] 𝒪[L]]
    [LocalFieldTheory.IsNonarchimedeanLocalField.IsUnramifiedValuedExtension K L]
    (n : Nat) (hn : 1 ≤ n) :
    Function.Surjective
      (principalUnitsSuccQuotNormOfUnramifiedValuationOfIsIntegralClosure K L n) := by
  intro y
  obtain ⟨x, hx⟩ :=
    principalUnitsSuccQuotNormOfUnramifiedValuationOfIsIntegralClosure_toAdditive_surjective
      K L n hn (Additive.ofMul y)
  refine ⟨Additive.toMul x, ?_⟩
  apply Additive.ofMul.injective
  change MonoidHom.toAdditive
      (principalUnitsSuccQuotNormOfUnramifiedValuationOfIsIntegralClosure K L n)
      (Additive.ofMul (Additive.toMul x)) = Additive.ofMul y
  simpa using hx
end LocalClassFieldTheory
end

/- ClassFieldTheory.LocalClassFieldTheory.Finite.Unramified.PrincipalUnits.Lift -/
section
noncomputable section
universe u
namespace LocalClassFieldTheory
open scoped ValuativeRel
open LocalFieldTheory
open LocalFieldTheory.IsNonarchimedeanLocalField
open Filter
 
theorem principalUnitsNormOfUnramifiedValuationOfIsIntegralClosure_lift_mod_succ
    (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L] [IsGalois K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [LocalFieldTheory.ValuativeExtension K L] [IsIntegralClosure 𝒪[L] 𝒪[K] L]
    [Module.Finite 𝒪[K] 𝒪[L]]
    [LocalFieldTheory.IsNonarchimedeanLocalField.IsUnramifiedValuedExtension K L]
    (n : Nat) (hn : 1 ≤ n) (y : principalUnits K n) :
    ∃ x : principalUnits L n,
      principalUnitsSuccQuotMk K n
          (principalUnitsNormOfUnramifiedValuationOfIsIntegralClosure K L n x) =
        principalUnitsSuccQuotMk K n y := by
  obtain ⟨q, hq⟩ :=
    principalUnitsSuccQuotNormOfUnramifiedValuationOfIsIntegralClosure_surjective
      K L n hn (principalUnitsSuccQuotMk K n y)
  obtain ⟨x, rfl⟩ := principalUnitsSuccQuotMk_surjective L n q
  refine ⟨x, ?_⟩
  simpa [principalUnitsSuccQuotNormOfUnramifiedValuationOfIsIntegralClosure_mk]
    using hq
 


theorem principalUnitsNormOfUnramifiedValuationOfIsIntegralClosure_div_lift_mem_succ
    (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L] [IsGalois K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [LocalFieldTheory.ValuativeExtension K L] [IsIntegralClosure 𝒪[L] 𝒪[K] L]
    [Module.Finite 𝒪[K] 𝒪[L]]
    [LocalFieldTheory.IsNonarchimedeanLocalField.IsUnramifiedValuedExtension K L]
    (n : Nat) (hn : 1 ≤ n) (y : principalUnits K n) :
    ∃ x : principalUnits L n,
      y / principalUnitsNormOfUnramifiedValuationOfIsIntegralClosure K L n x ∈
        (principalUnits K (n + 1)).subgroupOf (principalUnits K n) := by
  obtain ⟨x, hx⟩ :=
    principalUnitsNormOfUnramifiedValuationOfIsIntegralClosure_lift_mod_succ K L n hn y
  refine ⟨x, ?_⟩
  exact (principalUnitsSuccQuotMk_eq_iff_div_mem K n y
    (principalUnitsNormOfUnramifiedValuationOfIsIntegralClosure K L n x)).1 hx.symm
 

noncomputable def chosenPrincipalUnitsNormOfUnramifiedValuationOfIsIntegralClosureApproxCorrection
    (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L] [IsGalois K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [LocalFieldTheory.ValuativeExtension K L] [IsIntegralClosure 𝒪[L] 𝒪[K] L]
    [Module.Finite 𝒪[K] 𝒪[L]]
    [LocalFieldTheory.IsNonarchimedeanLocalField.IsUnramifiedValuedExtension K L]
    (n : Nat) (hn : 1 ≤ n) (y : principalUnits K n) (d : Nat)
    (s : {x : principalUnits L n //
        ((y : 𝒪[K]ˣ) / normIntegerUnits K L (x : 𝒪[L]ˣ)) ∈
          principalUnits K (n + d)}) :
    principalUnits L (n + d) :=
  let r : principalUnits K (n + d) :=
    ⟨(y : 𝒪[K]ˣ) / normIntegerUnits K L (s.1 : 𝒪[L]ˣ), s.2⟩
  have hnd : 1 ≤ n + d := le_trans hn (Nat.le_add_right n d)
  Classical.choose
    (principalUnitsNormOfUnramifiedValuationOfIsIntegralClosure_div_lift_mem_succ
      K L (n + d) hnd r)
 

noncomputable def principalUnitsNormOfUnramifiedValuationOfIsIntegralClosureApproxStep
    (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L] [IsGalois K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [LocalFieldTheory.ValuativeExtension K L] [IsIntegralClosure 𝒪[L] 𝒪[K] L]
    [Module.Finite 𝒪[K] 𝒪[L]]
    [LocalFieldTheory.IsNonarchimedeanLocalField.IsUnramifiedValuedExtension K L]
    (n : Nat) (hn : 1 ≤ n) (y : principalUnits K n) (d : Nat)
    (s : {x : principalUnits L n //
        ((y : 𝒪[K]ˣ) / normIntegerUnits K L (x : 𝒪[L]ˣ)) ∈
          principalUnits K (n + d)}) :
    {x : principalUnits L n //
      ((y : 𝒪[K]ˣ) / normIntegerUnits K L (x : 𝒪[L]ˣ)) ∈
        principalUnits K (n + (d + 1))} := by
  let r : principalUnits K (n + d) :=
    ⟨(y : 𝒪[K]ˣ) / normIntegerUnits K L (s.1 : 𝒪[L]ˣ), s.2⟩
  let z : principalUnits L (n + d) :=
    chosenPrincipalUnitsNormOfUnramifiedValuationOfIsIntegralClosureApproxCorrection
      K L n hn y d s
  let x' : principalUnits L n :=
    ⟨(s.1 : 𝒪[L]ˣ) * (z : 𝒪[L]ˣ),
      (principalUnits L n).mul_mem s.1.2
        (principalUnits_antitone L (Nat.le_add_right n d) z.2)⟩
  have hz :
      (((r / principalUnitsNormOfUnramifiedValuationOfIsIntegralClosure K L
          (n + d) z : principalUnits K (n + d)) : 𝒪[K]ˣ) ∈
        principalUnits K ((n + d) + 1)) :=
    by
      have hnd : 1 ≤ n + d := le_trans hn (Nat.le_add_right n d)
      dsimp [z, chosenPrincipalUnitsNormOfUnramifiedValuationOfIsIntegralClosureApproxCorrection]
      exact Classical.choose_spec
        (principalUnitsNormOfUnramifiedValuationOfIsIntegralClosure_div_lift_mem_succ
          K L (n + d) hnd r)
  refine ⟨x', ?_⟩
  have hresEq :
      (y : 𝒪[K]ˣ) / normIntegerUnits K L (x' : 𝒪[L]ˣ) =
        ((r / principalUnitsNormOfUnramifiedValuationOfIsIntegralClosure K L
            (n + d) z : principalUnits K (n + d)) : 𝒪[K]ˣ) := by
    change
      (y : 𝒪[K]ˣ) / normIntegerUnits K L (x' : 𝒪[L]ˣ) =
        (r : 𝒪[K]ˣ) /
          ((principalUnitsNormOfUnramifiedValuationOfIsIntegralClosure K L
              (n + d) z : principalUnits K (n + d)) : 𝒪[K]ˣ)
    simp only [x', r, principalUnitsNormOfUnramifiedValuationOfIsIntegralClosure_apply,
      (normIntegerUnits K L).map_mul]
    exact div_mul_eq_div_div _ _ _
  rw [hresEq]
  simpa [Nat.add_assoc] using hz
 

theorem principalUnitsNormOfUnramifiedValuationOfIsIntegralClosureApproxStep_div_mem
    (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L] [IsGalois K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [LocalFieldTheory.ValuativeExtension K L] [IsIntegralClosure 𝒪[L] 𝒪[K] L]
    [Module.Finite 𝒪[K] 𝒪[L]]
    [LocalFieldTheory.IsNonarchimedeanLocalField.IsUnramifiedValuedExtension K L]
    (n : Nat) (hn : 1 ≤ n) (y : principalUnits K n) (d : Nat)
    (s : {x : principalUnits L n //
        ((y : 𝒪[K]ˣ) / normIntegerUnits K L (x : 𝒪[L]ˣ)) ∈
          principalUnits K (n + d)}) :
    (((principalUnitsNormOfUnramifiedValuationOfIsIntegralClosureApproxStep
          K L n hn y d s).1 : 𝒪[L]ˣ) /
        (s.1 : 𝒪[L]ˣ)) ∈ principalUnits L (n + d) := by
  let z : principalUnits L (n + d) :=
    chosenPrincipalUnitsNormOfUnramifiedValuationOfIsIntegralClosureApproxCorrection
      K L n hn y d s
  change (((s.1 : 𝒪[L]ˣ) * (z : 𝒪[L]ˣ)) / (s.1 : 𝒪[L]ˣ)) ∈
    principalUnits L (n + d)
  rw [mul_div_cancel_left]
  exact z.2
 

noncomputable def principalUnitsNormOfUnramifiedValuationOfIsIntegralClosureApproxState
    (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L] [IsGalois K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [LocalFieldTheory.ValuativeExtension K L] [IsIntegralClosure 𝒪[L] 𝒪[K] L]
    [Module.Finite 𝒪[K] 𝒪[L]]
    [LocalFieldTheory.IsNonarchimedeanLocalField.IsUnramifiedValuedExtension K L]
    (n : Nat) (hn : 1 ≤ n) (y : principalUnits K n) :
    (d : Nat) →
      {x : principalUnits L n //
        ((y : 𝒪[K]ˣ) / normIntegerUnits K L (x : 𝒪[L]ˣ)) ∈
          principalUnits K (n + d)}
  | 0 => by
      refine ⟨1, ?_⟩
      change (y : 𝒪[K]ˣ) / normIntegerUnits K L (1 : 𝒪[L]ˣ) ∈
        principalUnits K (n + 0)
      rw [(normIntegerUnits K L).map_one, div_one, Nat.add_zero]
      exact y.2
  | d + 1 =>
      principalUnitsNormOfUnramifiedValuationOfIsIntegralClosureApproxStep K L n hn y d
        (principalUnitsNormOfUnramifiedValuationOfIsIntegralClosureApproxState
          K L n hn y d)
 

theorem principalUnitsNormOfUnramifiedValuationOfIsIntegralClosureApproxState_succ_div_mem
    (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L] [IsGalois K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [LocalFieldTheory.ValuativeExtension K L] [IsIntegralClosure 𝒪[L] 𝒪[K] L]
    [Module.Finite 𝒪[K] 𝒪[L]]
    [LocalFieldTheory.IsNonarchimedeanLocalField.IsUnramifiedValuedExtension K L]
    (n : Nat) (hn : 1 ≤ n) (y : principalUnits K n) (d : Nat) :
    ((((principalUnitsNormOfUnramifiedValuationOfIsIntegralClosureApproxState
          K L n hn y (d + 1)).1 : principalUnits L n) : 𝒪[L]ˣ) /
        (((principalUnitsNormOfUnramifiedValuationOfIsIntegralClosureApproxState
          K L n hn y d).1 : principalUnits L n) : 𝒪[L]ˣ)) ∈
      principalUnits L (n + d) := by
  change
    (((principalUnitsNormOfUnramifiedValuationOfIsIntegralClosureApproxStep K L n hn y d
          (principalUnitsNormOfUnramifiedValuationOfIsIntegralClosureApproxState
            K L n hn y d)).1 : 𝒪[L]ˣ) /
        ((principalUnitsNormOfUnramifiedValuationOfIsIntegralClosureApproxState
          K L n hn y d).1 : 𝒪[L]ˣ)) ∈ principalUnits L (n + d)
  exact principalUnitsNormOfUnramifiedValuationOfIsIntegralClosureApproxStep_div_mem
    K L n hn y d
    (principalUnitsNormOfUnramifiedValuationOfIsIntegralClosureApproxState
      K L n hn y d)
 

noncomputable def chosenPrincipalUnitsNormOfUnramifiedValuationOfIsIntegralClosureApproxCorrectionSeq
    (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L] [IsGalois K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [LocalFieldTheory.ValuativeExtension K L] [IsIntegralClosure 𝒪[L] 𝒪[K] L]
    [Module.Finite 𝒪[K] 𝒪[L]]
    [LocalFieldTheory.IsNonarchimedeanLocalField.IsUnramifiedValuedExtension K L]
    (n : Nat) (hn : 1 ≤ n) (y : principalUnits K n) :
    ∀ d : Nat, principalUnits L (n + d) :=
  fun d =>
    ⟨(((principalUnitsNormOfUnramifiedValuationOfIsIntegralClosureApproxState
          K L n hn y (d + 1)).1 : principalUnits L n) : 𝒪[L]ˣ) /
        (((principalUnitsNormOfUnramifiedValuationOfIsIntegralClosureApproxState
          K L n hn y d).1 : principalUnits L n) : 𝒪[L]ˣ),
      principalUnitsNormOfUnramifiedValuationOfIsIntegralClosureApproxState_succ_div_mem
        K L n hn y d⟩
 

theorem principalUnitsCorrectionProduct_approxCorrectionSeqOfIsIntegralClosure
    (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L] [IsGalois K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [LocalFieldTheory.ValuativeExtension K L] [IsIntegralClosure 𝒪[L] 𝒪[K] L]
    [Module.Finite 𝒪[K] 𝒪[L]]
    [LocalFieldTheory.IsNonarchimedeanLocalField.IsUnramifiedValuedExtension K L]
    (n : Nat) (hn : 1 ≤ n) (y : principalUnits K n) (d : Nat) :
    principalUnitsCorrectionProduct L n
        (chosenPrincipalUnitsNormOfUnramifiedValuationOfIsIntegralClosureApproxCorrectionSeq
          K L n hn y) d =
      (((principalUnitsNormOfUnramifiedValuationOfIsIntegralClosureApproxState
          K L n hn y d).1 : principalUnits L n) : 𝒪[L]ˣ) := by
  induction d with
  | zero =>
      simp [principalUnitsCorrectionProduct_zero,
        principalUnitsNormOfUnramifiedValuationOfIsIntegralClosureApproxState]
  | succ d ih =>
      rw [principalUnitsCorrectionProduct_succ, ih]
      change
        (((principalUnitsNormOfUnramifiedValuationOfIsIntegralClosureApproxState
            K L n hn y d).1 : principalUnits L n) : 𝒪[L]ˣ) *
            ((((principalUnitsNormOfUnramifiedValuationOfIsIntegralClosureApproxState
              K L n hn y (d + 1)).1 : principalUnits L n) : 𝒪[L]ˣ) /
              (((principalUnitsNormOfUnramifiedValuationOfIsIntegralClosureApproxState
                K L n hn y d).1 : principalUnits L n) : 𝒪[L]ˣ)) =
          (((principalUnitsNormOfUnramifiedValuationOfIsIntegralClosureApproxState
            K L n hn y (d + 1)).1 : principalUnits L n) : 𝒪[L]ˣ)
      rw [mul_comm, div_mul_cancel]
 


theorem exists_tendsto_principalUnitsNormOfUnramifiedValuationOfIsIntegralClosureApproxState
    (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [UniformSpace L] [IsUniformAddGroup L]
    [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L] [IsGalois K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [LocalFieldTheory.ValuativeExtension K L] [IsIntegralClosure 𝒪[L] 𝒪[K] L]
    [Module.Finite 𝒪[K] 𝒪[L]]
    [LocalFieldTheory.IsNonarchimedeanLocalField.IsUnramifiedValuedExtension K L]
    (n : Nat) (hn : 1 ≤ n) (y : principalUnits K n) :
    ∃ x : principalUnits L n, Filter.Tendsto
      (fun d : Nat =>
        ((((principalUnitsNormOfUnramifiedValuationOfIsIntegralClosureApproxState
          K L n hn y d).1 : principalUnits L n) : 𝒪[L]ˣ) : 𝒪[L]))
      Filter.atTop (nhds (((x : principalUnits L n) : 𝒪[L]ˣ) : 𝒪[L])) := by
  obtain ⟨x, hx⟩ :=
    exists_tendsto_principalUnitsCorrectionProduct_principalUnit L n hn
      (chosenPrincipalUnitsNormOfUnramifiedValuationOfIsIntegralClosureApproxCorrectionSeq
        K L n hn y)
  refine ⟨x, ?_⟩
  have hseq :
      (fun d : Nat =>
        ((principalUnitsCorrectionProduct L n
            (chosenPrincipalUnitsNormOfUnramifiedValuationOfIsIntegralClosureApproxCorrectionSeq
              K L n hn y) d : 𝒪[L]ˣ) : 𝒪[L])) =
        (fun d : Nat =>
          ((((principalUnitsNormOfUnramifiedValuationOfIsIntegralClosureApproxState
            K L n hn y d).1 : principalUnits L n) : 𝒪[L]ˣ) : 𝒪[L])) := by
    funext d
    rw [principalUnitsCorrectionProduct_approxCorrectionSeqOfIsIntegralClosure
      K L n hn y d]
  simpa [hseq] using hx
 

theorem principalUnitsNormOfUnramifiedValuationOfIsIntegralClosureApproxState_error_mem
    (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L] [IsGalois K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [LocalFieldTheory.ValuativeExtension K L] [IsIntegralClosure 𝒪[L] 𝒪[K] L]
    [Module.Finite 𝒪[K] 𝒪[L]]
    [LocalFieldTheory.IsNonarchimedeanLocalField.IsUnramifiedValuedExtension K L]
    (n : Nat) (hn : 1 ≤ n) (y : principalUnits K n) (d : Nat) :
    ((y : 𝒪[K]ˣ) /
        normIntegerUnits K L
          ((principalUnitsNormOfUnramifiedValuationOfIsIntegralClosureApproxState
            K L n hn y d).1 : 𝒪[L]ˣ)) ∈
      principalUnits K (n + d) :=
  (principalUnitsNormOfUnramifiedValuationOfIsIntegralClosureApproxState
    K L n hn y d).2
 


theorem eventually_normIntegerUnits_div_mem_principalUnits_of_tendsto_units_of_isIntegralClosure
    (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [UniformSpace L] [IsUniformAddGroup L]
    [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L] [IsGalois K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [LocalFieldTheory.ValuativeExtension K L] [IsIntegralClosure 𝒪[L] 𝒪[K] L]
    [Module.Finite 𝒪[K] 𝒪[L]]
    [LocalFieldTheory.IsNonarchimedeanLocalField.IsUnramifiedValuedExtension K L]
    {f : Nat → 𝒪[L]ˣ} {x : 𝒪[L]ˣ} (n : Nat)
    (hf : Tendsto (fun d : Nat => ((f d : 𝒪[L]ˣ) : 𝒪[L])) atTop
      (nhds ((x : 𝒪[L]ˣ) : 𝒪[L]))) :
    ∀ᶠ d in atTop,
      normIntegerUnits K L (f d) / normIntegerUnits K L x ∈ principalUnits K n := by
  have hdiv := eventually_div_mem_principalUnits_of_tendsto_units L n hf
  filter_upwards [hdiv] with d hd
  have hnorm : normIntegerUnits K L (f d / x) ∈ principalUnits K n :=
    normIntegerUnits_mem_principalUnits_of_unramifiedValuation_of_isIntegralClosure
      K L n (f d / x) hd
  simpa [(normIntegerUnits K L).map_div] using hnorm
 

theorem principalUnitsNormOfUnramifiedValuationOfIsIntegralClosureApproxState_limit_error_mem_add_all
    (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [UniformSpace L] [IsUniformAddGroup L]
    [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L] [IsGalois K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [LocalFieldTheory.ValuativeExtension K L] [IsIntegralClosure 𝒪[L] 𝒪[K] L]
    [Module.Finite 𝒪[K] 𝒪[L]]
    [LocalFieldTheory.IsNonarchimedeanLocalField.IsUnramifiedValuedExtension K L]
    (n : Nat) (hn : 1 ≤ n) (y : principalUnits K n)
    (x : principalUnits L n)
    (hx : Tendsto
      (fun d : Nat =>
        ((((principalUnitsNormOfUnramifiedValuationOfIsIntegralClosureApproxState
          K L n hn y d).1 : principalUnits L n) : 𝒪[L]ˣ) : 𝒪[L]))
      atTop (nhds (((x : principalUnits L n) : 𝒪[L]ˣ) : 𝒪[L]))) :
    ∀ d : Nat,
      ((y : 𝒪[K]ˣ) / normIntegerUnits K L (x : 𝒪[L]ˣ)) ∈
        principalUnits K (n + d) := by
  intro d
  let f : Nat → 𝒪[L]ˣ := fun i =>
    (((principalUnitsNormOfUnramifiedValuationOfIsIntegralClosureApproxState
      K L n hn y i).1 : principalUnits L n) : 𝒪[L]ˣ)
  have hnormEv : ∀ᶠ i in atTop,
      normIntegerUnits K L (f i) / normIntegerUnits K L (x : 𝒪[L]ˣ) ∈
        principalUnits K (n + d) := by
    exact
      eventually_normIntegerUnits_div_mem_principalUnits_of_tendsto_units_of_isIntegralClosure
        K L (n + d) hx
  have hge : ∀ᶠ i : Nat in atTop, d ≤ i := eventually_ge_atTop d
  rcases (hnormEv.and hge).exists with ⟨i, hboth⟩
  rcases hboth with ⟨hnorm, hdi⟩
  have herrDeep :
      ((y : 𝒪[K]ˣ) /
          normIntegerUnits K L
            ((principalUnitsNormOfUnramifiedValuationOfIsIntegralClosureApproxState
              K L n hn y i).1 : 𝒪[L]ˣ)) ∈
        principalUnits K (n + i) :=
    principalUnitsNormOfUnramifiedValuationOfIsIntegralClosureApproxState_error_mem
      K L n hn y i
  have herr :
      ((y : 𝒪[K]ˣ) /
          normIntegerUnits K L
            ((principalUnitsNormOfUnramifiedValuationOfIsIntegralClosureApproxState
              K L n hn y i).1 : 𝒪[L]ˣ)) ∈
        principalUnits K (n + d) :=
    principalUnits_antitone K (Nat.add_le_add_left hdi n) herrDeep
  have heq :
      (y : 𝒪[K]ˣ) / normIntegerUnits K L (x : 𝒪[L]ˣ) =
        ((y : 𝒪[K]ˣ) /
          normIntegerUnits K L
            ((principalUnitsNormOfUnramifiedValuationOfIsIntegralClosureApproxState
              K L n hn y i).1 : 𝒪[L]ˣ)) *
        (normIntegerUnits K L
            ((principalUnitsNormOfUnramifiedValuationOfIsIntegralClosureApproxState
              K L n hn y i).1 : 𝒪[L]ˣ) /
          normIntegerUnits K L (x : 𝒪[L]ˣ)) := by
    simp [div_eq_mul_inv, mul_assoc, mul_comm, mul_left_comm]
  rw [heq]
  exact (principalUnits K (n + d)).mul_mem herr (by simpa [f] using hnorm)
 


theorem principalUnitsNormOfUnramifiedValuationOfIsIntegralClosure_eq_of_error_mem_add_all
    (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L] [IsGalois K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [LocalFieldTheory.ValuativeExtension K L] [IsIntegralClosure 𝒪[L] 𝒪[K] L]
    [Module.Finite 𝒪[K] 𝒪[L]]
    [LocalFieldTheory.IsNonarchimedeanLocalField.IsUnramifiedValuedExtension K L]
    (n : Nat) (y : principalUnits K n) (x : principalUnits L n)
    (h : ∀ d : Nat,
      ((y : 𝒪[K]ˣ) / normIntegerUnits K L (x : 𝒪[L]ˣ)) ∈
        principalUnits K (n + d)) :
    (y : 𝒪[K]ˣ) = normIntegerUnits K L (x : 𝒪[L]ˣ) := by
  have hOne :
      (y : 𝒪[K]ˣ) / normIntegerUnits K L (x : 𝒪[L]ˣ) = 1 :=
    principalUnits_eq_one_of_mem_add_all K n
      ((y : 𝒪[K]ˣ) / normIntegerUnits K L (x : 𝒪[L]ˣ)) h
  exact div_eq_one.mp hOne
 


theorem principalUnitsNormOfUnramifiedValuationOfIsIntegralClosure_surjective
    (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [UniformSpace L] [IsUniformAddGroup L]
    [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L] [IsGalois K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [LocalFieldTheory.ValuativeExtension K L] [IsIntegralClosure 𝒪[L] 𝒪[K] L]
    [Module.Finite 𝒪[K] 𝒪[L]]
    [LocalFieldTheory.IsNonarchimedeanLocalField.IsUnramifiedValuedExtension K L]
    (n : Nat) (hn : 1 ≤ n) :
    Function.Surjective (principalUnitsNormOfUnramifiedValuationOfIsIntegralClosure K L n) := by
  intro y
  obtain ⟨x, hx⟩ :=
    exists_tendsto_principalUnitsNormOfUnramifiedValuationOfIsIntegralClosureApproxState
      K L n hn y
  refine ⟨x, ?_⟩
  have hmem :=
    principalUnitsNormOfUnramifiedValuationOfIsIntegralClosureApproxState_limit_error_mem_add_all
      K L n hn y x hx
  have hEq :
      (y : 𝒪[K]ˣ) = normIntegerUnits K L (x : 𝒪[L]ˣ) :=
    principalUnitsNormOfUnramifiedValuationOfIsIntegralClosure_eq_of_error_mem_add_all
      K L n y x hmem
  apply Subtype.ext
  simpa [principalUnitsNormOfUnramifiedValuationOfIsIntegralClosure_apply] using hEq.symm
end LocalClassFieldTheory
end

/- ClassFieldTheory.LocalClassFieldTheory.Finite.Unramified.ResidueNorm -/
section
noncomputable section
universe u
namespace LocalClassFieldTheory
open scoped ValuativeRel
open LocalFieldTheory
open LocalFieldTheory.IsNonarchimedeanLocalField
 


noncomputable def integerUnitsModPrincipalUnitsNormOfGaloisOfIsIntegralClosure
    (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L] [IsGalois K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [LocalFieldTheory.ValuativeExtension K L] [IsIntegralClosure 𝒪[L] 𝒪[K] L]
    [Module.Finite 𝒪[K] 𝒪[L]]
    [LocalFieldTheory.IsNonarchimedeanLocalField.IsUnramifiedValuedExtension K L] :
    IntegerUnitsModPrincipalUnits L →* IntegerUnitsModPrincipalUnits K :=
  integerUnitsModPrincipalUnitsLift
    ((integerUnitsModPrincipalUnitsMk K).comp (normIntegerUnits K L))
    (by
      intro u hu
      rw [MonoidHom.mem_ker, MonoidHom.comp_apply,
        IntegerUnitsModPrincipalUnits_mk_eq_one_iff]
      exact normIntegerUnits_mem_principalUnits_of_unramifiedValuation_of_isIntegralClosure
        K L 1 u hu)
 
@[simp]
theorem integerUnitsModPrincipalUnitsNormOfGaloisOfIsIntegralClosure_mk
    (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L] [IsGalois K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [LocalFieldTheory.ValuativeExtension K L] [IsIntegralClosure 𝒪[L] 𝒪[K] L]
    [Module.Finite 𝒪[K] 𝒪[L]]
    [LocalFieldTheory.IsNonarchimedeanLocalField.IsUnramifiedValuedExtension K L]
    (u : 𝒪[L]ˣ) :
    integerUnitsModPrincipalUnitsNormOfGaloisOfIsIntegralClosure K L
        (integerUnitsModPrincipalUnitsMk L u) =
      integerUnitsModPrincipalUnitsMk K (normIntegerUnits K L u) :=
  integerUnitsModPrincipalUnitsLift_mk
    ((integerUnitsModPrincipalUnitsMk K).comp (normIntegerUnits K L)) _ u
 

theorem residueUnitsMap_normIntegerUnits_eq_galoisGroup_residue_prod_of_isIntegralClosure
    (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L] [IsGalois K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [LocalFieldTheory.ValuativeExtension K L] [IsIntegralClosure 𝒪[L] 𝒪[K] L]
    (u : 𝒪[L]ˣ) :
    residueUnitsMapOfValuationExtension K L
        (integerUnitsToResidueUnits K (normIntegerUnits K L u)) =
      Finset.univ.prod (fun σ : Gal(L / K) =>
        Units.mapEquiv
          (galoisGroupResidueFieldEquivOfIsIntegralClosure K L σ).toMulEquiv
          (integerUnitsToResidueUnits L u)) := by
  rw [residueUnitsMap_integerUnitsToResidueUnits K L (normIntegerUnits K L u)]
  rw [integerUnitsMap_normIntegerUnits_eq_galoisGroup_prod_of_isIntegralClosure K L u]
  rw [map_prod]
  apply Finset.prod_congr rfl
  intro σ _
  exact
    (galoisGroupResidueFieldEquivOfIsIntegralClosure_integerUnitsToResidueUnits
      K L σ u).symm
 

theorem residueUnitsMap_normIntegerUnits_eq_galoisGroup_residue_algEquiv_prod_of_isIntegralClosure
    (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L] [IsGalois K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [LocalFieldTheory.ValuativeExtension K L] [IsIntegralClosure 𝒪[L] 𝒪[K] L]
    (u : 𝒪[L]ˣ) :
    residueUnitsMapOfValuationExtension K L
        (integerUnitsToResidueUnits K (normIntegerUnits K L u)) =
      Finset.univ.prod (fun σ : Gal(L / K) =>
        Units.mapEquiv
          (galoisGroupResidueAlgEquivOfIsIntegralClosure K L σ).toMulEquiv
          (integerUnitsToResidueUnits L u)) := by
  rw [residueUnitsMap_normIntegerUnits_eq_galoisGroup_residue_prod_of_isIntegralClosure
    K L u]
 

theorem integerUnitsModPrincipalUnitsNormOfGaloisOfIsIntegralClosure_residue_algEquiv_base_extend
    (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L] [IsGalois K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [LocalFieldTheory.ValuativeExtension K L] [IsIntegralClosure 𝒪[L] 𝒪[K] L]
    [Module.Finite 𝒪[K] 𝒪[L]]
    [LocalFieldTheory.IsNonarchimedeanLocalField.IsUnramifiedValuedExtension K L]
    (x : IntegerUnitsModPrincipalUnits L) :
    residueUnitsMapOfValuationExtension K L
        (integerUnitsModPrincipalUnitsEquivResidueUnits K
          (integerUnitsModPrincipalUnitsNormOfGaloisOfIsIntegralClosure K L x)) =
      Finset.univ.prod (fun σ : Gal(L / K) =>
        Units.mapEquiv
          (galoisGroupResidueAlgEquivOfIsIntegralClosure K L σ).toMulEquiv
          (integerUnitsModPrincipalUnitsEquivResidueUnits L x)) := by
  refine IntegerUnitsModPrincipalUnits.inductionOn
    (motive := fun x =>
      residueUnitsMapOfValuationExtension K L
          (integerUnitsModPrincipalUnitsEquivResidueUnits K
            (integerUnitsModPrincipalUnitsNormOfGaloisOfIsIntegralClosure K L x)) =
        Finset.univ.prod (fun σ : Gal(L / K) =>
          Units.mapEquiv
            (galoisGroupResidueAlgEquivOfIsIntegralClosure K L σ).toMulEquiv
            (integerUnitsModPrincipalUnitsEquivResidueUnits L x)))
    x ?_
  intro u
  rw [integerUnitsModPrincipalUnitsNormOfGaloisOfIsIntegralClosure_mk]
  rw [integerUnitsModPrincipalUnitsEquivResidueUnits_mk]
  rw [integerUnitsModPrincipalUnitsEquivResidueUnits_mk]
  exact
    residueUnitsMap_normIntegerUnits_eq_galoisGroup_residue_algEquiv_prod_of_isIntegralClosure
      K L u
 

theorem integerUnitsModPrincipalUnitsNormOfGaloisOfIsIntegralClosure_residue_base_extend_eq_residueNorm
    (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L] [IsGalois K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [LocalFieldTheory.ValuativeExtension K L] [IsIntegralClosure 𝒪[L] 𝒪[K] L]
    [Module.Finite 𝒪[K] 𝒪[L]]
    [LocalFieldTheory.IsNonarchimedeanLocalField.IsUnramifiedValuedExtension K L]
    (x : IntegerUnitsModPrincipalUnits L) :
    residueUnitsMapOfValuationExtension K L
        (integerUnitsModPrincipalUnitsEquivResidueUnits K
          (integerUnitsModPrincipalUnitsNormOfGaloisOfIsIntegralClosure K L x)) =
      residueUnitsMapOfValuationExtension K L
        (integerUnitsModPrincipalUnitsEquivResidueUnits K
          (integerUnitsModPrincipalUnitsResidueNormOfValuationExtension K L x)) := by
  rw [integerUnitsModPrincipalUnitsNormOfGaloisOfIsIntegralClosure_residue_algEquiv_base_extend]
  rw [integerUnitsModPrincipalUnitsResidueNorm_base_extend_eq_prod_algEquiv]
  exact
    galoisGroupResidueAlgEquivOfIsIntegralClosure_prod_eq_prod_algEquiv_of_unramifiedValuation
      K L (integerUnitsModPrincipalUnitsEquivResidueUnits L x)
 

theorem integerUnitsModPrincipalUnitsNormOfGaloisOfIsIntegralClosure_eq_residueNorm_of_unramifiedValuation
    (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L] [IsGalois K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [LocalFieldTheory.ValuativeExtension K L] [IsIntegralClosure 𝒪[L] 𝒪[K] L]
    [Module.Finite 𝒪[K] 𝒪[L]]
    [LocalFieldTheory.IsNonarchimedeanLocalField.IsUnramifiedValuedExtension K L] :
    integerUnitsModPrincipalUnitsNormOfGaloisOfIsIntegralClosure K L =
      integerUnitsModPrincipalUnitsResidueNormOfValuationExtension K L := by
  apply MonoidHom.ext
  intro x
  apply (integerUnitsModPrincipalUnitsEquivResidueUnits K).injective
  apply residueUnitsMapOfValuationExtension_injective K L
  exact
    integerUnitsModPrincipalUnitsNormOfGaloisOfIsIntegralClosure_residue_base_extend_eq_residueNorm
      K L x
 

theorem integerUnitsModPrincipalUnitsNormOfGaloisOfIsIntegralClosure_surjective_of_unramifiedValuation
    (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L] [IsGalois K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [LocalFieldTheory.ValuativeExtension K L] [IsIntegralClosure 𝒪[L] 𝒪[K] L]
    [Module.Finite 𝒪[K] 𝒪[L]]
    [LocalFieldTheory.IsNonarchimedeanLocalField.IsUnramifiedValuedExtension K L] :
    Function.Surjective
      (integerUnitsModPrincipalUnitsNormOfGaloisOfIsIntegralClosure K L) := by
  rw [integerUnitsModPrincipalUnitsNormOfGaloisOfIsIntegralClosure_eq_residueNorm_of_unramifiedValuation
    K L]
  exact integerUnitsModPrincipalUnitsResidueNorm_surjective_of_valuationExtension K L
end LocalClassFieldTheory
end

/- ClassFieldTheory.LocalClassFieldTheory.Finite.Unramified.Norm -/
section
noncomputable section
universe u
namespace LocalClassFieldTheory
open scoped ValuativeRel
open LocalFieldTheory
open LocalFieldTheory.IsNonarchimedeanLocalField
 


theorem normIntegerUnits_surjective_unramified_of_isIntegralClosure
    (K L : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [UniformSpace L] [IsUniformAddGroup L]
    [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L] [IsGalois K L]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L)]
    [LocalFieldTheory.ValuativeExtension K L] [IsIntegralClosure 𝒪[L] 𝒪[K] L]
    [Module.Finite 𝒪[K] 𝒪[L]]
    [LocalFieldTheory.IsNonarchimedeanLocalField.IsUnramifiedValuedExtension K L] :
    Function.Surjective (normIntegerUnits K L) := by
  intro y
  obtain ⟨q, hq⟩ :=
    integerUnitsModPrincipalUnitsNormOfGaloisOfIsIntegralClosure_surjective_of_unramifiedValuation
      K L (QuotientGroup.mk y : IntegerUnitsModPrincipalUnits K)
  obtain ⟨u, rfl⟩ := Quotient.exists_rep q
  have hclass :
      (QuotientGroup.mk (normIntegerUnits K L u) : IntegerUnitsModPrincipalUnits K) =
        QuotientGroup.mk y := by
    change integerUnitsModPrincipalUnitsNormOfGaloisOfIsIntegralClosure K L
        (integerUnitsModPrincipalUnitsMk L u) =
      integerUnitsModPrincipalUnitsMk K y at hq
    rw [integerUnitsModPrincipalUnitsNormOfGaloisOfIsIntegralClosure_mk] at hq
    exact hq
  have hresInv : normIntegerUnits K L u / y ∈ principalUnits K 1 :=
    (IntegerUnitsModPrincipalUnits_mk_eq_mk_iff K (normIntegerUnits K L u) y).1 hclass
  have hres : y / normIntegerUnits K L u ∈ principalUnits K 1 := by
    have hinv : (normIntegerUnits K L u / y)⁻¹ ∈ principalUnits K 1 :=
      (principalUnits K 1).inv_mem hresInv
    simpa [div_eq_mul_inv, mul_assoc, mul_comm, mul_left_comm] using hinv
  let r : principalUnits K 1 := ⟨y / normIntegerUnits K L u, hres⟩
  obtain ⟨z, hz⟩ :=
    principalUnitsNormOfUnramifiedValuationOfIsIntegralClosure_surjective
      K L 1 (Nat.le_refl 1) r
  refine ⟨u * (z : 𝒪[L]ˣ), ?_⟩
  have hzUnits : normIntegerUnits K L (z : 𝒪[L]ˣ) = y / normIntegerUnits K L u := by
    have hzUnitsSub := congrArg (fun w : principalUnits K 1 => (w : 𝒪[K]ˣ)) hz
    simpa [principalUnitsNormOfUnramifiedValuationOfIsIntegralClosure_apply, r]
      using hzUnitsSub
  calc
    normIntegerUnits K L (u * (z : 𝒪[L]ˣ))
        = normIntegerUnits K L u * normIntegerUnits K L (z : 𝒪[L]ˣ) := by
          rw [(normIntegerUnits K L).map_mul]
    _ = normIntegerUnits K L u * (y / normIntegerUnits K L u) := by
          rw [hzUnits]
    _ = y := by
          simp [div_eq_mul_inv, mul_left_comm]
end LocalClassFieldTheory
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
 
instance residueField.field (F : DVF.{u, v} K) : Field F.residueField :=
  IsLocalRing.ResidueField.field F.valuation.valuationSubring
 
abbrev residueMap (F : DVF.{u, v} K) :
    RingHom F.valuationSubring F.residueField :=
  IsLocalRing.residue F.valuationSubring
 
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
 
theorem maximalIdeal_eq_span_uniformizer (F : DVF.{u, v} K)
    {pi : F.valuationSubring} (hpi : F.valuation.IsUniformizer (pi : K)) :
    F.maximalIdeal = Ideal.span (Set.singleton pi) := by
  change IsLocalRing.maximalIdeal F.valuation.valuationSubring =
    Ideal.span (Set.singleton pi)
  exact Valuation.IsUniformizer.is_generator (v := F.valuation) hpi
 

theorem maximalIdeal_pow_eq_span_uniformizer_pow (F : DVF.{u, v} K)
    {pi : F.valuationSubring} (hpi : F.valuation.IsUniformizer (pi : K))
    (n : ℕ) :
    F.maximalIdeal ^ n = Ideal.span ({pi ^ n} : Set F.valuationSubring) := by
  rw [F.maximalIdeal_eq_span_uniformizer hpi]
  exact Ideal.span_singleton_pow pi n
 
abbrev maximalIdealPowSuccSubmodule (F : DVF.{u, v} K) (n : ℕ) :
    Submodule F.valuationSubring ((F.maximalIdeal ^ n : Ideal F.valuationSubring) : Type u) :=
  Submodule.comap (Submodule.subtype (p := (F.maximalIdeal ^ n : Ideal F.valuationSubring)))
    ((F.maximalIdeal ^ (n + 1) : Ideal F.valuationSubring) :
      Submodule F.valuationSubring F.valuationSubring)
 
def MaximalIdealPowSuccQuot (F : DVF.{u, v} K) (n : ℕ) : Type u :=
  ((F.maximalIdeal ^ n : Ideal F.valuationSubring) : Type u) ⧸
    F.maximalIdealPowSuccSubmodule n
 
instance maximalIdealPowSuccQuotAddCommGroup
    (F : DVF.{u, v} K) (n : ℕ) :
    AddCommGroup (F.MaximalIdealPowSuccQuot n) := by
  change AddCommGroup
    (((F.maximalIdeal ^ n : Ideal F.valuationSubring) : Type u) ⧸
      F.maximalIdealPowSuccSubmodule n)
  infer_instance
 
instance maximalIdealPowSuccQuotModule
    (F : DVF.{u, v} K) (n : ℕ) :
    Module F.valuationSubring (F.MaximalIdealPowSuccQuot n) := by
  change Module F.valuationSubring
    (((F.maximalIdeal ^ n : Ideal F.valuationSubring) : Type u) ⧸
      F.maximalIdealPowSuccSubmodule n)
  infer_instance
 
def maximalIdealPowSuccQuotConcreteLinearEquiv
    (F : DVF.{u, v} K) (n : ℕ) :
    F.MaximalIdealPowSuccQuot n ≃ₗ[F.valuationSubring]
      (((F.maximalIdeal ^ n : Ideal F.valuationSubring) : Type u) ⧸
        F.maximalIdealPowSuccSubmodule n) := by
  change
    (((F.maximalIdeal ^ n : Ideal F.valuationSubring) : Type u) ⧸
        F.maximalIdealPowSuccSubmodule n) ≃ₗ[F.valuationSubring]
      (((F.maximalIdeal ^ n : Ideal F.valuationSubring) : Type u) ⧸
        F.maximalIdealPowSuccSubmodule n)
  exact LinearEquiv.refl F.valuationSubring _
 
def maximalIdealPowSuccQuotMk (F : DVF.{u, v} K) (n : ℕ) :
    ((F.maximalIdeal ^ n : Ideal F.valuationSubring) : Type u) →ₗ[F.valuationSubring]
      F.MaximalIdealPowSuccQuot n := by
  change
    ((F.maximalIdeal ^ n : Ideal F.valuationSubring) : Type u)
      →ₗ[F.valuationSubring]
        (((F.maximalIdeal ^ n : Ideal F.valuationSubring) : Type u) ⧸
          F.maximalIdealPowSuccSubmodule n)
  exact Submodule.mkQ (F.maximalIdealPowSuccSubmodule n)
 
@[simp]
theorem maximalIdealPowSuccQuotConcreteLinearEquiv_mk
    (F : DVF.{u, v} K) (n : ℕ)
    (a : ((F.maximalIdeal ^ n : Ideal F.valuationSubring) : Type u)) :
    F.maximalIdealPowSuccQuotConcreteLinearEquiv n
        (F.maximalIdealPowSuccQuotMk n a) =
      Submodule.Quotient.mk a :=
  rfl
 
protected theorem MaximalIdealPowSuccQuot.inductionOn
    (F : DVF.{u, v} K) (n : ℕ)
    {motive : F.MaximalIdealPowSuccQuot n → Prop}
    (q : F.MaximalIdealPowSuccQuot n)
    (h : ∀ a : ((F.maximalIdeal ^ n : Ideal F.valuationSubring) : Type u),
      motive (F.maximalIdealPowSuccQuotMk n a)) :
    motive q := by
  change motive
    (show ((F.maximalIdeal ^ n : Ideal F.valuationSubring) : Type u) ⧸
      F.maximalIdealPowSuccSubmodule n from q)
  refine Submodule.Quotient.induction_on
    (F.maximalIdealPowSuccSubmodule n) q ?_
  intro a
  exact h a
 
def maximalIdealPowSuccQuotLift
    (F : DVF.{u, v} K) {P : Sort*} (n : ℕ)
    (f : ((F.maximalIdeal ^ n : Ideal F.valuationSubring) : Type u) → P)
    (h : ∀ a b, a - b ∈ F.maximalIdealPowSuccSubmodule n →
      f a = f b) :
    F.MaximalIdealPowSuccQuot n → P := by
  change
    ((((F.maximalIdeal ^ n : Ideal F.valuationSubring) : Type u) ⧸
      F.maximalIdealPowSuccSubmodule n) → P)
  refine Quotient.lift f ?_
  intro a b hab
  have hq :
      (Submodule.Quotient.mk a :
        ((F.maximalIdeal ^ n : Ideal F.valuationSubring) : Type u) ⧸
          F.maximalIdealPowSuccSubmodule n) =
        Submodule.Quotient.mk b :=
    Quotient.sound hab
  exact h a b
    ((Submodule.Quotient.eq (F.maximalIdealPowSuccSubmodule n)).1 hq)
 
@[simp]
theorem maximalIdealPowSuccQuotLift_mk
    (F : DVF.{u, v} K) {P : Sort*} (n : ℕ)
    (f : ((F.maximalIdeal ^ n : Ideal F.valuationSubring) : Type u) → P)
    (h : ∀ a b, a - b ∈ F.maximalIdealPowSuccSubmodule n →
      f a = f b)
    (a : ((F.maximalIdeal ^ n : Ideal F.valuationSubring) : Type u)) :
    F.maximalIdealPowSuccQuotLift n f h
        (F.maximalIdealPowSuccQuotMk n a) = f a :=
  rfl
 
def maximalIdealPowSuccQuotLinearLift
    (F : DVF.{u, v} K) {M : Type*} [AddCommGroup M]
    [Module F.valuationSubring M] (n : ℕ)
    (f : ((F.maximalIdeal ^ n : Ideal F.valuationSubring) : Type u)
      →ₗ[F.valuationSubring] M)
    (h : F.maximalIdealPowSuccSubmodule n ≤ f.ker) :
    F.MaximalIdealPowSuccQuot n →ₗ[F.valuationSubring] M := by
  change
    (((F.maximalIdeal ^ n : Ideal F.valuationSubring) : Type u) ⧸
      F.maximalIdealPowSuccSubmodule n) →ₗ[F.valuationSubring] M
  exact (F.maximalIdealPowSuccSubmodule n).liftQ f h
 
@[simp]
theorem maximalIdealPowSuccQuotLinearLift_mk
    (F : DVF.{u, v} K) {M : Type*} [AddCommGroup M]
    [Module F.valuationSubring M] (n : ℕ)
    (f : ((F.maximalIdeal ^ n : Ideal F.valuationSubring) : Type u)
      →ₗ[F.valuationSubring] M)
    (h : F.maximalIdealPowSuccSubmodule n ≤ f.ker)
    (a : ((F.maximalIdeal ^ n : Ideal F.valuationSubring) : Type u)) :
    F.maximalIdealPowSuccQuotLinearLift n f h
        (F.maximalIdealPowSuccQuotMk n a) = f a :=
  rfl
 

theorem maximalIdealPowSuccQuotMk_eq_zero_iff (F : DVF.{u, v} K) (n : ℕ)
    (a : ((F.maximalIdeal ^ n : Ideal F.valuationSubring) : Type u)) :
    F.maximalIdealPowSuccQuotMk n a = 0 ↔
      (a : F.valuationSubring) ∈ F.maximalIdeal ^ (n + 1) := by
  change (Submodule.Quotient.mk a :
    ((F.maximalIdeal ^ n : Ideal F.valuationSubring) : Type u) ⧸
      F.maximalIdealPowSuccSubmodule n) = 0 ↔ _
  rw [Submodule.Quotient.mk_eq_zero]
  rfl
 

@[simp]
theorem maximalIdealPowSuccQuotMk_eq_iff
    (F : DVF.{u, v} K) (n : ℕ)
    (a b : ((F.maximalIdeal ^ n : Ideal F.valuationSubring) : Type u)) :
    F.maximalIdealPowSuccQuotMk n a =
        F.maximalIdealPowSuccQuotMk n b ↔
      a - b ∈ F.maximalIdealPowSuccSubmodule n := by
  change (Submodule.Quotient.mk a :
    ((F.maximalIdeal ^ n : Ideal F.valuationSubring) : Type u) ⧸
      F.maximalIdealPowSuccSubmodule n) =
    Submodule.Quotient.mk b ↔ _
  exact Submodule.Quotient.eq (F.maximalIdealPowSuccSubmodule n)
 

theorem mul_uniformizer_pow_mem_maximalIdeal_pow (F : DVF.{u, v} K)
    {pi : F.valuationSubring} (hpi : F.valuation.IsUniformizer (pi : K))
    (n : ℕ) (r : F.valuationSubring) :
    r * pi ^ n ∈ F.maximalIdeal ^ n := by
  rw [F.maximalIdeal_pow_eq_span_uniformizer_pow hpi n]
  rw [Ideal.mem_span_singleton]
  exact ⟨r, mul_comm _ _⟩
 
def maximalIdealPowMulUniformizerPowMap (F : DVF.{u, v} K)
    {pi : F.valuationSubring} (hpi : F.valuation.IsUniformizer (pi : K)) (n : ℕ) :
    F.valuationSubring →ₗ[F.valuationSubring]
      ((F.maximalIdeal ^ n : Ideal F.valuationSubring) : Type u) where
  toFun r := ⟨r * pi ^ n, F.mul_uniformizer_pow_mem_maximalIdeal_pow hpi n r⟩
  map_add' r s := by
    ext
    simp [add_mul]
  map_smul' a r := by
    ext
    simp [mul_assoc]
 

theorem mul_uniformizer_pow_mem_maximalIdeal_pow_succ_iff (F : DVF.{u, v} K)
    {pi : F.valuationSubring} (hpi : F.valuation.IsUniformizer (pi : K))
    (n : ℕ) (r : F.valuationSubring) :
    r * pi ^ n ∈ F.maximalIdeal ^ (n + 1) ↔ r ∈ F.maximalIdeal := by
  rw [F.maximalIdeal_pow_eq_span_uniformizer_pow hpi (n + 1),
    F.maximalIdeal_eq_span_uniformizer hpi]
  constructor
  · intro h
    rcases (Ideal.mem_span_singleton.mp h) with ⟨c, hc⟩
    refine Ideal.mem_span_singleton.mpr ⟨c, ?_⟩
    have hpi_ne : pi ≠ 0 := by
      intro hzero
      exact hpi.ne_zero (by simpa using congrArg (fun x : F.valuationSubring => (x : K)) hzero)
    have hne : pi ^ n ≠ 0 := pow_ne_zero n hpi_ne
    have hcancel : r * pi ^ n = (pi * c) * pi ^ n := by
      calc
        r * pi ^ n = pi ^ (n + 1) * c := hc
        _ = (pi * c) * pi ^ n := by
          rw [pow_succ']
          ring
    exact mul_right_cancel₀ hne hcancel
  · intro h
    rcases (Ideal.mem_span_singleton.mp h) with ⟨c, hc⟩
    refine Ideal.mem_span_singleton.mpr ⟨c, ?_⟩
    rw [hc]
    rw [pow_succ']
    ring
 
def maximalIdealPowSuccQuotMulUniformizerPowMap (F : DVF.{u, v} K)
    {pi : F.valuationSubring} (hpi : F.valuation.IsUniformizer (pi : K)) (n : ℕ) :
    F.valuationSubring →ₗ[F.valuationSubring] F.MaximalIdealPowSuccQuot n :=
  (F.maximalIdealPowSuccQuotMk n).comp
    (F.maximalIdealPowMulUniformizerPowMap hpi n)
 
theorem maximalIdealPowSuccQuotMulUniformizerPowMap_ker (F : DVF.{u, v} K)
    {pi : F.valuationSubring} (hpi : F.valuation.IsUniformizer (pi : K)) (n : ℕ) :
    LinearMap.ker (F.maximalIdealPowSuccQuotMulUniformizerPowMap hpi n) =
      F.maximalIdeal := by
  ext r
  rw [LinearMap.mem_ker]
  change F.maximalIdealPowSuccQuotMk n
      (F.maximalIdealPowMulUniformizerPowMap hpi n r) = 0 ↔
    r ∈ F.maximalIdeal
  rw [F.maximalIdealPowSuccQuotMk_eq_zero_iff n]
  change r * pi ^ n ∈ F.maximalIdeal ^ (n + 1) ↔ r ∈ F.maximalIdeal
  exact F.mul_uniformizer_pow_mem_maximalIdeal_pow_succ_iff hpi n r
 
theorem maximalIdealPowSuccQuotMulUniformizerPowMap_surjective (F : DVF.{u, v} K)
    {pi : F.valuationSubring} (hpi : F.valuation.IsUniformizer (pi : K)) (n : ℕ) :
    Function.Surjective (F.maximalIdealPowSuccQuotMulUniformizerPowMap hpi n) := by
  intro x
  refine MaximalIdealPowSuccQuot.inductionOn F n
    (motive := fun x' ↦
      ∃ a, F.maximalIdealPowSuccQuotMulUniformizerPowMap hpi n a = x') x ?_
  intro a
  have ha_span : (a : F.valuationSubring) ∈
      Ideal.span ({pi ^ n} : Set F.valuationSubring) := by
    simpa [F.maximalIdeal_pow_eq_span_uniformizer_pow hpi n] using a.2
  rcases (Ideal.mem_span_singleton.mp ha_span) with ⟨r, hr⟩
  refine ⟨r, ?_⟩
  change F.maximalIdealPowSuccQuotMk n
      (F.maximalIdealPowMulUniformizerPowMap hpi n r) =
    F.maximalIdealPowSuccQuotMk n a
  have hrep : F.maximalIdealPowMulUniformizerPowMap hpi n r = a := by
    ext
    simp [maximalIdealPowMulUniformizerPowMap, hr, mul_comm]
  rw [hrep]
 

noncomputable def residueLinearEquivMaximalIdealPowSuccQuotOfUniformizer
    (F : DVF.{u, v} K) {pi : F.valuationSubring}
    (hpi : F.valuation.IsUniformizer (pi : K)) (n : ℕ) :
    F.residueField ≃ₗ[F.valuationSubring] F.MaximalIdealPowSuccQuot n :=
  (Submodule.quotEquivOfEq (F.maximalIdeal : Submodule F.valuationSubring F.valuationSubring)
      (LinearMap.ker (F.maximalIdealPowSuccQuotMulUniformizerPowMap hpi n))
      (F.maximalIdealPowSuccQuotMulUniformizerPowMap_ker hpi n).symm).trans
    ((F.maximalIdealPowSuccQuotMulUniformizerPowMap hpi n).quotKerEquivOfSurjective
      (F.maximalIdealPowSuccQuotMulUniformizerPowMap_surjective hpi n))
 
noncomputable def residueAddEquivMaximalIdealPowSuccQuotOfUniformizer
    (F : DVF.{u, v} K) {pi : F.valuationSubring}
    (hpi : F.valuation.IsUniformizer (pi : K)) (n : ℕ) :
    F.residueField ≃+ F.MaximalIdealPowSuccQuot n :=
  (F.residueLinearEquivMaximalIdealPowSuccQuotOfUniformizer hpi n).toAddEquiv
 

@[simp] theorem residueAddEquivMaximalIdealPowSuccQuotOfUniformizer_residue
    (F : DVF.{u, v} K) {pi : F.valuationSubring}
    (hpi : F.valuation.IsUniformizer (pi : K)) (n : ℕ)
    (r : F.valuationSubring) :
    F.residueAddEquivMaximalIdealPowSuccQuotOfUniformizer hpi n
        (F.residueMap r) =
      F.maximalIdealPowSuccQuotMulUniformizerPowMap hpi n r := by
  let f := F.maximalIdealPowSuccQuotMulUniformizerPowMap hpi n
  let hker :
      (F.maximalIdeal : Submodule F.valuationSubring F.valuationSubring) =
        LinearMap.ker f :=
    (F.maximalIdealPowSuccQuotMulUniformizerPowMap_ker hpi n).symm
  change (Submodule.quotEquivOfEq
        (F.maximalIdeal : Submodule F.valuationSubring F.valuationSubring)
        (LinearMap.ker f) hker).trans
      (f.quotKerEquivOfSurjective
        (F.maximalIdealPowSuccQuotMulUniformizerPowMap_surjective hpi n))
      (Submodule.Quotient.mk r) = f r
  rw [LinearEquiv.trans_apply]
  have hquot :
      Submodule.quotEquivOfEq
          (F.maximalIdeal : Submodule F.valuationSubring F.valuationSubring)
          (LinearMap.ker f) hker (Submodule.Quotient.mk r) =
        (Submodule.Quotient.mk r :
          F.valuationSubring ⧸ LinearMap.ker f) := by
    exact Submodule.quotEquivOfEq_mk
      (p := (F.maximalIdeal : Submodule F.valuationSubring F.valuationSubring))
      (p' := LinearMap.ker f) hker r
  rw [hquot]
  rw [LinearMap.quotKerEquivOfSurjective_apply_mk]
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
omit [FiniteDimensional K L] in
 


theorem integralClosure_mem_target_valuationSubring_of_hasExtension
    (base : CompleteDVF.{u, v} K) (target : CompleteDVF.{w, x} L)
    [base.valuation.HasExtension target.valuation]
    [IsScalarTower base.toDVF.valuationSubring target.toDVF.valuationSubring L]
    (z : integralClosure base.toDVF.valuationSubring L) :
    (z : L) ∈ target.valuation.valuationSubring := by
  have hz_base : IsIntegral base.toDVF.valuationSubring (z : L) :=
    z.2
  have hz_target : IsIntegral target.toDVF.valuationSubring (z : L) :=
    IsIntegral.tower_top (A := target.toDVF.valuationSubring) hz_base
  exact Valuation.Integers.mem_of_integral
    (Valuation.valuationSubring.integers (v := target.valuation)) hz_target
 

def integralClosureToTargetValuationSubringOfHasExtension
    (base : CompleteDVF.{u, v} K) (target : CompleteDVF.{w, x} L)
    [base.valuation.HasExtension target.valuation]
    [IsScalarTower base.toDVF.valuationSubring target.toDVF.valuationSubring L] :
    integralClosure base.toDVF.valuationSubring L →+* target.toDVF.valuationSubring where
  toFun z :=
    ⟨(z : L),
      integralClosure_mem_target_valuationSubring_of_hasExtension
        (K := K) (L := L) base target z⟩
  map_zero' := by ext; simp
  map_one' := by ext; simp
  map_add' z₁ z₂ := by ext; simp
  map_mul' z₁ z₂ := by ext; simp
omit [FiniteDimensional K L] in
 
@[simp] theorem integralClosureToTargetValuationSubringOfHasExtension_apply
    (base : CompleteDVF.{u, v} K) (target : CompleteDVF.{w, x} L)
    [base.valuation.HasExtension target.valuation]
    [IsScalarTower base.toDVF.valuationSubring target.toDVF.valuationSubring L]
    (z : integralClosure base.toDVF.valuationSubring L) :
    ((integralClosureToTargetValuationSubringOfHasExtension
      (K := K) (L := L) base target z : target.toDVF.valuationSubring) : L) = z :=
  rfl
omit [FiniteDimensional K L] in
 

theorem integralClosureToTargetValuationSubringOfHasExtension_injective
    (base : CompleteDVF.{u, v} K) (target : CompleteDVF.{w, x} L)
    [base.valuation.HasExtension target.valuation]
    [IsScalarTower base.toDVF.valuationSubring target.toDVF.valuationSubring L] :
    Function.Injective
      (integralClosureToTargetValuationSubringOfHasExtension
        (K := K) (L := L) base target) := by
  intro z₁ z₂ hz
  apply Subtype.ext
  exact congrArg (fun z : target.toDVF.valuationSubring => (z : L)) hz
omit [FiniteDimensional K L] in
 


theorem target_valuationSubring_mem_integralClosure_of_moduleFinite
    (base : CompleteDVF.{u, v} K) (target : CompleteDVF.{w, x} L)
    [base.valuation.HasExtension target.valuation]
    [Module.Finite base.toDVF.valuationSubring target.toDVF.valuationSubring]
    [IsScalarTower base.toDVF.valuationSubring target.toDVF.valuationSubring L]
    (z : target.toDVF.valuationSubring) :
    (z : L) ∈ integralClosure base.toDVF.valuationSubring L := by
  have hz_target : IsIntegral base.toDVF.valuationSubring z :=
    IsIntegral.of_finite base.toDVF.valuationSubring z
  have hz_L : IsIntegral base.toDVF.valuationSubring
      (algebraMap target.toDVF.valuationSubring L z) :=
    hz_target.map
      (IsScalarTower.toAlgHom base.toDVF.valuationSubring target.toDVF.valuationSubring L)
  rw [mem_integralClosure_iff]
  simpa using hz_L
 

def targetValuationSubringToIntegralClosureOfModuleFinite
    (base : CompleteDVF.{u, v} K) (target : CompleteDVF.{w, x} L)
    [base.valuation.HasExtension target.valuation]
    [Module.Finite base.toDVF.valuationSubring target.toDVF.valuationSubring]
    [IsScalarTower base.toDVF.valuationSubring target.toDVF.valuationSubring L] :
    target.toDVF.valuationSubring →+* integralClosure base.toDVF.valuationSubring L where
  toFun z :=
    ⟨(z : L),
      target_valuationSubring_mem_integralClosure_of_moduleFinite
        (K := K) (L := L) base target z⟩
  map_zero' := by ext; simp
  map_one' := by ext; simp
  map_add' z₁ z₂ := by ext; simp
  map_mul' z₁ z₂ := by ext; simp
omit [FiniteDimensional K L] in
 
@[simp] theorem targetValuationSubringToIntegralClosureOfModuleFinite_apply
    (base : CompleteDVF.{u, v} K) (target : CompleteDVF.{w, x} L)
    [base.valuation.HasExtension target.valuation]
    [Module.Finite base.toDVF.valuationSubring target.toDVF.valuationSubring]
    [IsScalarTower base.toDVF.valuationSubring target.toDVF.valuationSubring L]
    (z : target.toDVF.valuationSubring) :
    ((targetValuationSubringToIntegralClosureOfModuleFinite
      (K := K) (L := L) base target z :
        integralClosure base.toDVF.valuationSubring L) : L) = z :=
  rfl
omit [FiniteDimensional K L] in
 

theorem integralClosureToTargetValuationSubringOfHasExtension_surjective_of_moduleFinite
    (base : CompleteDVF.{u, v} K) (target : CompleteDVF.{w, x} L)
    [base.valuation.HasExtension target.valuation]
    [Module.Finite base.toDVF.valuationSubring target.toDVF.valuationSubring]
    [IsScalarTower base.toDVF.valuationSubring target.toDVF.valuationSubring L] :
    Function.Surjective
      (integralClosureToTargetValuationSubringOfHasExtension
        (K := K) (L := L) base target) := by
  intro z
  refine ⟨targetValuationSubringToIntegralClosureOfModuleFinite
    (K := K) (L := L) base target z, ?_⟩
  ext
  rfl
omit [FiniteDimensional K L] in
 

theorem integralClosureToTargetValuationSubringOfHasExtension_bijective_of_moduleFinite
    (base : CompleteDVF.{u, v} K) (target : CompleteDVF.{w, x} L)
    [base.valuation.HasExtension target.valuation]
    [Module.Finite base.toDVF.valuationSubring target.toDVF.valuationSubring]
    [IsScalarTower base.toDVF.valuationSubring target.toDVF.valuationSubring L] :
    Function.Bijective
      (integralClosureToTargetValuationSubringOfHasExtension
        (K := K) (L := L) base target) :=
  ⟨integralClosureToTargetValuationSubringOfHasExtension_injective
      (K := K) (L := L) base target,
    integralClosureToTargetValuationSubringOfHasExtension_surjective_of_moduleFinite
      (K := K) (L := L) base target⟩
 


noncomputable def integralClosureRingEquivTargetValuationSubringOfModuleFinite
    (base : CompleteDVF.{u, v} K) (target : CompleteDVF.{w, x} L)
    [base.valuation.HasExtension target.valuation]
    [Module.Finite base.toDVF.valuationSubring target.toDVF.valuationSubring]
    [IsScalarTower base.toDVF.valuationSubring target.toDVF.valuationSubring L] :
    integralClosure base.toDVF.valuationSubring L ≃+* target.toDVF.valuationSubring :=
  RingEquiv.ofBijective
    (integralClosureToTargetValuationSubringOfHasExtension
      (K := K) (L := L) base target)
    (integralClosureToTargetValuationSubringOfHasExtension_bijective_of_moduleFinite
      (K := K) (L := L) base target)
omit [FiniteDimensional K L] in
 
@[simp] theorem integralClosureRingEquivTargetValuationSubringOfModuleFinite_apply
    (base : CompleteDVF.{u, v} K) (target : CompleteDVF.{w, x} L)
    [base.valuation.HasExtension target.valuation]
    [Module.Finite base.toDVF.valuationSubring target.toDVF.valuationSubring]
    [IsScalarTower base.toDVF.valuationSubring target.toDVF.valuationSubring L]
    (z : integralClosure base.toDVF.valuationSubring L) :
    (integralClosureRingEquivTargetValuationSubringOfModuleFinite
      (K := K) (L := L) base target z :
        target.toDVF.valuationSubring) =
      integralClosureToTargetValuationSubringOfHasExtension
        (K := K) (L := L) base target z :=
  rfl
 

noncomputable def integralClosureAlgEquivTargetValuationSubringOfModuleFinite
    (base : CompleteDVF.{u, v} K) (target : CompleteDVF.{w, x} L)
    [base.valuation.HasExtension target.valuation]
    [Module.Finite base.toDVF.valuationSubring target.toDVF.valuationSubring]
    [IsScalarTower base.toDVF.valuationSubring target.toDVF.valuationSubring L] :
    integralClosure base.toDVF.valuationSubring L ≃ₐ[base.toDVF.valuationSubring]
      target.toDVF.valuationSubring :=
  AlgEquiv.ofRingEquiv
    (f := integralClosureRingEquivTargetValuationSubringOfModuleFinite
      (K := K) (L := L) base target)
    (by
      intro x
      ext
      exact (IsScalarTower.algebraMap_apply
        base.toDVF.valuationSubring target.toDVF.valuationSubring L x).symm)
omit [FiniteDimensional K L] in
 
@[simp] theorem integralClosureAlgEquivTargetValuationSubringOfModuleFinite_apply
    (base : CompleteDVF.{u, v} K) (target : CompleteDVF.{w, x} L)
    [base.valuation.HasExtension target.valuation]
    [Module.Finite base.toDVF.valuationSubring target.toDVF.valuationSubring]
    [IsScalarTower base.toDVF.valuationSubring target.toDVF.valuationSubring L]
    (z : integralClosure base.toDVF.valuationSubring L) :
    (integralClosureAlgEquivTargetValuationSubringOfModuleFinite
      (K := K) (L := L) base target z :
        target.toDVF.valuationSubring) =
      integralClosureToTargetValuationSubringOfHasExtension
        (K := K) (L := L) base target z :=
  integralClosureRingEquivTargetValuationSubringOfModuleFinite_apply
    (K := K) (L := L) base target z
 
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
 
@[simp] theorem integralClosureToValuationSubringOfHasExtension_apply
    {ΓL : Type x} [LinearOrderedCommGroupWithZero ΓL]
    (vK : _root_.Valuation K ΓK) (vL : _root_.Valuation L ΓL)
    [vK.HasExtension vL]
    (z : integralClosure vK.valuationSubring L) :
    ((integralClosureToValuationSubringOfHasExtension
      (L := L) vK vL z : vL.valuationSubring) : L) = z :=
  rfl
 

theorem valuationSubring_mem_integralClosure_of_moduleFinite
    {ΓL : Type x} [LinearOrderedCommGroupWithZero ΓL]
    (vK : _root_.Valuation K ΓK) (vL : _root_.Valuation L ΓL)
    [vK.HasExtension vL]
    [Module.Finite vK.valuationSubring vL.valuationSubring]
    (z : vL.valuationSubring) :
    (z : L) ∈ integralClosure vK.valuationSubring L := by
  have hz_ring : IsIntegral vK.valuationSubring z :=
    IsIntegral.of_finite vK.valuationSubring z
  have hz_field : IsIntegral vK.valuationSubring
      (algebraMap vL.valuationSubring L z) :=
    hz_ring.map
      (IsScalarTower.toAlgHom vK.valuationSubring vL.valuationSubring L)
  rw [mem_integralClosure_iff]
  simpa using hz_field
 

def valuationSubringToIntegralClosureOfModuleFinite
    {ΓL : Type x} [LinearOrderedCommGroupWithZero ΓL]
    (vK : _root_.Valuation K ΓK) (vL : _root_.Valuation L ΓL)
    [vK.HasExtension vL]
    [Module.Finite vK.valuationSubring vL.valuationSubring] :
    vL.valuationSubring →+* integralClosure vK.valuationSubring L where
  toFun z :=
    ⟨(z : L),
      valuationSubring_mem_integralClosure_of_moduleFinite
        (L := L) vK vL z⟩
  map_zero' := by ext; simp
  map_one' := by ext; simp
  map_add' z₁ z₂ := by ext; simp
  map_mul' z₁ z₂ := by ext; simp
 
@[simp] theorem valuationSubringToIntegralClosureOfModuleFinite_apply
    {ΓL : Type x} [LinearOrderedCommGroupWithZero ΓL]
    (vK : _root_.Valuation K ΓK) (vL : _root_.Valuation L ΓL)
    [vK.HasExtension vL]
    [Module.Finite vK.valuationSubring vL.valuationSubring]
    (z : vL.valuationSubring) :
    ((valuationSubringToIntegralClosureOfModuleFinite
      (L := L) vK vL z : integralClosure vK.valuationSubring L) : L) = z :=
  rfl
 

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
 
@[simp] theorem integralClosureValuationSubringIntegerMapOfMemOrInv_apply
    (base : CompleteDVF.{u, v} K)
    (hval :
      ∀ z : L,
        z ∈ (integralClosure base.valuationSubring L).toSubring ∨
          z⁻¹ ∈ (integralClosure base.valuationSubring L).toSubring)
    (a : base.valuationSubring) :
    ((integralClosureValuationSubringIntegerMapOfMemOrInv
      (K := K) (L := L) base hval a :
        integralClosureValuationSubringOfMemOrInv
          (L := L) base.valuation hval) : L) =
      algebraMap K L (a : K) :=
  rfl
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
 

theorem integralClosure_mem_or_inv_of_finite_separable
    (target : CompleteDVF.{w, x} L)
    [base.valuation.HasExtension target.valuation]
    [Algebra.IsSeparable K L] :
    ∀ z : L,
      z ∈ (integralClosure base.valuationSubring L).toSubring ∨
        z⁻¹ ∈ (integralClosure base.valuationSubring L).toSubring := by
  let : HenselianRing (integralClosureIntegers base target)
      (base.maximalIdeal.map
        (algebraMap base.valuationSubring (integralClosureIntegers base target))) :=
    (integralClosure_base_maximal_map_henselianRing base target)
  let : Subsingleton
      (PrimeSpectrum (base.maximalIdeal.Fiber (integralClosureIntegers base target))) :=
    (integralClosure_base_maximal_fiber_subsingleton_of_henselianRing_maximalIdeal_map base target)
  let : IsLocalRing (integralClosureIntegers base target) :=
    (integralClosure_isLocalRing_of_base_maximal_fiber_subsingleton base target)
  exact (integralClosure_mem_or_inv_of_isLocalRing base target)
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
 

theorem target_valuationSubring_isIntegralClosure_of_finite_separable

    [Algebra.IsSeparable K L]
    [IsScalarTower base.valuationSubring target.valuationSubring L] :
    IsIntegralClosure target.valuationSubring base.valuationSubring L := by
  let hval := (integralClosure_mem_or_inv_of_finite_separable base target)
  let B :=
    ValuationTheory.DiscreteValuationField.Valuation.integralClosureValuationSubringOfMemOrInv
      (L := L) base.valuation hval
  let : base.valuation.HasExtension B.valuation :=
    ValuationTheory.DiscreteValuationField.Valuation.integralClosureValuationSubringOfMemOrInv_hasExtension
      (L := L) base.valuation hval
  have htarget_eq : target.valuation.valuationSubring = B :=
    (target_valuationSubring_eq_of_finite_separable base target) B
  have hB : IsIntegralClosure B base.valuationSubring L :=
    ValuationTheory.DiscreteValuationField.Valuation.integralClosureValuationSubringOfMemOrInv_isIntegralClosure
      (L := L) base.valuation hval
  change IsIntegralClosure target.valuation.valuationSubring base.valuationSubring L
  rw [htarget_eq]
  exact hB
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
open DiscreteValuationField
 

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
 

theorem localCompleteDVFValuation_hasExtension
    (K : Type u) (L : Type v) [Field K] [Field L] [Algebra K L]
    [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Valuation.HasExtension (ValuativeRel.valuation K)
      (ValuativeRel.valuation L)] :
    (localCompleteDVF K).valuation.HasExtension
      (localCompleteDVF L).valuation := by
  apply Valuation.HasExtension.ofComapInteger
  ext x
  change
    ValuativeRel.valuation L (algebraMap K L x) ≤ 1 ↔
      ValuativeRel.valuation K x ≤ 1
  exact
    Valuation.HasExtension.val_map_le_one_iff
      (ValuativeRel.valuation K) (ValuativeRel.valuation L) x
 

theorem localCompleteDVF_integerRing_isIntegralClosure
    (K : Type u) (L : Type v) [Field K] [Field L] [Algebra K L]
    [FiniteDimensional K L] [Algebra.IsSeparable K L]
    [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Valuation.HasExtension (ValuativeRel.valuation K)
      (ValuativeRel.valuation L)] :
    IsIntegralClosure 𝒪[L] 𝒪[K] L := by
  let : (localCompleteDVF K).valuation.HasExtension
      (localCompleteDVF L).valuation :=
    localCompleteDVFValuation_hasExtension K L
  let : IsScalarTower
      (localCompleteDVF K).valuationSubring
      (localCompleteDVF L).valuationSubring L :=
    Valuation.valuationSubring_isScalarTower_of_hasExtension
      (localCompleteDVF K).valuation (localCompleteDVF L).valuation
  exact
    target_valuationSubring_isIntegralClosure_of_finite_separable
      (K := K) (L := L) (localCompleteDVF K) (localCompleteDVF L)
end LocalFieldTheory
end


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

namespace TunnellDenseCompletions
open Polynomial IsDedekindDomain NumberField
open scoped Classical WithZero WithZeroTopology ValuativeRel

/- A completion generated densely by a finite Galois field is itself a finite
Galois extension of the completed base. -/
theorem dense_galois {D N V W : Type} [Field D] [Field N] [Algebra D N]
    [FiniteDimensional D N] [IsGalois D N] [NontriviallyNormedField V] [CompleteSpace V]
    [Field W] [UniformSpace W] [T2Space W] [IsTopologicalRing W]
    [Algebra D V] [Algebra V W] [Algebra D W] [IsScalarTower D V W]
    [ContinuousSMul V W] (j : N →ₐ[D] W) (hd : DenseRange j) :
    FiniteDimensional V W ∧ IsGalois V W := by
  classical
  obtain ⟨p, hp, hs⟩ := IsGalois.is_separable_splitting_field D N
  let q := p.map (algebraMap D V)
  have hroots : q.rootSet W = p.rootSet W := by
    simp only [q, Polynomial.rootSet, Polynomial.aroots, Polynomial.map_map,
      ← IsScalarTower.algebraMap_eq]
  have hsplit : (q.map (algebraMap V W)).Splits := by
    rw [show q = p.map (algebraMap D V) from rfl, Polynomial.map_map, ← IsScalarTower.algebraMap_eq]
    exact Polynomial.Splits.of_algHom (Polynomial.IsSplittingField.splits N p) j
  let E := IntermediateField.adjoin V (q.rootSet W)
  haveI : q.IsSplittingField V E := IntermediateField.adjoin_rootSet_isSplittingField hsplit
  haveI : FiniteDimensional V E := Polynomial.IsSplittingField.finiteDimensional E q
  have hclosed : IsClosed (E : Set W) := E.toSubalgebra.toSubmodule.closed_of_finiteDimensional
  have hsub : j.range ≤ E.toSubalgebra.restrictScalars D := by
    rw [← Polynomial.IsSplittingField.adjoin_rootSet_eq_range N p j, Algebra.adjoin_le_iff]
    intro x hx
    exact IntermediateField.subset_adjoin V _ (hroots.symm ▸ hx)
  have htop : E = ⊤ := by
    apply top_unique
    intro x _
    exact hd.induction_on (p := fun y => y ∈ E) x hclosed (fun n => hsub ⟨n,rfl⟩)
  haveI : q.IsSplittingField V W := isSplittingField_iff_intermediateField.mpr ⟨hsplit, htop⟩
  exact ⟨Polynomial.IsSplittingField.finiteDimensional W q,
    IsGalois.of_separable_splitting_field (p:=q) hp.map⟩

theorem fields {D N : Type} [Field D] [NumberField D] [Field N] [NumberField N]
    [Algebra D N] [FiniteDimensional D N] [IsGalois D N]
    (v : HeightOneSpectrum (𝓞 D)) (t : HeightOneSpectrum (𝓞 N))
    (f : v.adicCompletion D →+* t.adicCompletion N) (hf : Continuous f)
    (hc : ∀ c : D, f (algebraMap D _ c) = algebraMap N _ (algebraMap D N c)) :
    letI : Algebra (v.adicCompletion D) (t.adicCompletion N) := f.toAlgebra
    FiniteDimensional (v.adicCompletion D) (t.adicCompletion N) ∧ IsGalois (v.adicCompletion D) (t.adicCompletion N) := by
  let V := v.adicCompletion D
  let W := t.adicCompletion N
  letI : NontriviallyNormedField V := Valued.toNontriviallyNormedField V ℤᵐ⁰
  letI : Algebra V W := f.toAlgebra
  letI : Algebra D W := ((algebraMap N W).comp (algebraMap D N)).toAlgebra
  letI : IsScalarTower D V W := IsScalarTower.of_algebraMap_eq fun x => (hc x).symm
  letI : ContinuousSMul V W := continuousSMul_of_algebraMap V W hf
  let j : N →ₐ[D] W := ⟨algebraMap N W,fun _ => rfl⟩
  exact dense_galois (V:=V) j (t.denseRange_algebraMap N)

theorem extension {D N : Type} [Field D] [NumberField D] [Field N] [NumberField N]
    [Algebra D N] [FiniteDimensional D N] (v : HeightOneSpectrum (𝓞 D))
    (t : HeightOneSpectrum (𝓞 N)) [t.asIdeal.LiesOver v.asIdeal]
    (he : t.asIdeal.ramificationIdx (𝓞 D) = 1)
    (f : v.adicCompletion D →+* t.adicCompletion N) (hf : Continuous f)
    (hc : ∀ c : D, f (algebraMap D _ c) = algebraMap N _ (algebraMap D N c)) :
    letI : Algebra (v.adicCompletion D) (t.adicCompletion N) := f.toAlgebra
    letI : ValuativeRel (v.adicCompletion D) := ValuativeRel.ofValuation (Valued.v : Valuation _ ℤᵐ⁰)
    letI : ValuativeRel (t.adicCompletion N) := ValuativeRel.ofValuation (Valued.v : Valuation _ ℤᵐ⁰)
    Valuation.HasExtension (ValuativeRel.valuation (v.adicCompletion D)) (ValuativeRel.valuation (t.adicCompletion N)) := by
  let V := v.adicCompletion D
  let W := t.adicCompletion N
  letI : Algebra V W := f.toAlgebra
  letI : ValuativeRel V := ValuativeRel.ofValuation (Valued.v : Valuation V ℤᵐ⁰)
  letI : ValuativeRel W := ValuativeRel.ofValuation (Valued.v : Valuation W ℤᵐ⁰)
  have hval : (fun x : V => (Valued.v : Valuation W ℤᵐ⁰) (f x)) = (Valued.v : Valuation V ℤᵐ⁰) := by
    apply (v.denseRange_algebraMap D).equalizer
      ((Valued.continuous_valuation_of_surjective (t.valuedAdicCompletion_surjective N)).comp hf)
      (Valued.continuous_valuation_of_surjective (v.valuedAdicCompletion_surjective D))
    funext c
    change Valued.v (f (algebraMap D V c)) = Valued.v (algebraMap D V c)
    rw [hc]
    refine (t.valuedAdicCompletion_eq_valuation' (algebraMap D N c)).trans (?_ : _ = Valued.v (algebraMap D V c))
    refine Eq.trans ?_ (v.valuedAdicCompletion_eq_valuation' c).symm
    simpa only [Ideal.ramificationIdx'_eq_ramificationIdx _ _ v.ne_bot, he, pow_one] using
      (HeightOneSpectrum.valuation_liesOver N v t c).symm
  constructor
  intro x y
  change ValuativeRel.valuation V x ≤ ValuativeRel.valuation V y ↔
    ValuativeRel.valuation W (f x) ≤ ValuativeRel.valuation W (f y)
  simp only [← Valuation.vle_iff_le]
  change Valued.v x ≤ Valued.v y ↔ Valued.v (f x) ≤ Valued.v (f y)
  rw [congrFun hval x, congrFun hval y]

end TunnellDenseCompletions

namespace TunnellCompletionUnits
open NumberField IsDedekindDomain IsLocalRing
open scoped Classical NumberField ValuativeRel WithZero
def integralUnit : Prop :=
  ∀ (D : Type) [Field D] [NumberField D] (v : HeightOneSpectrum (𝓞 D)) (u : (𝓞 D)ˣ),
    let V := v.adicCompletion D
    letI : ValuativeRel V := ValuativeRel.ofValuation (Valued.v : Valuation V ℤᵐ⁰)
    ∃ a : ((ValuativeRel.valuation (V)).integer)ˣ, (a.val : V) = algebraMap D V u.val.val
def commonUniformizer : Prop :=
  ∀ (D N : Type) [Field D] [NumberField D] [Field N] [NumberField N] [Algebra D N]
    [FiniteDimensional D N] [IsAbelianGalois D N],
  ∀ (v : HeightOneSpectrum (𝓞 D)) (t : HeightOneSpectrum (𝓞 N)), t.asIdeal.LiesOver v.asIdeal →
    let V := v.adicCompletion D
    let W := t.adicCompletion N
    ∀ f : V →+* W, Continuous f →
      (∀ c : D, f (algebraMap D V c) = algebraMap N W (algebraMap D N c)) →
      letI : Algebra V W := f.toAlgebra
      letI : ValuativeRel V := ValuativeRel.ofValuation (Valued.v : Valuation V ℤᵐ⁰)
      letI : ValuativeRel W := ValuativeRel.ofValuation (Valued.v : Valuation W ℤᵐ⁰)
      ∀ [IsNonarchimedeanLocalField V] [IsNonarchimedeanLocalField W]
        [Valuation.HasExtension (ValuativeRel.valuation V) (ValuativeRel.valuation W)],
        t.asIdeal.ramificationIdx (𝓞 D) = 1 →
        (maximalIdeal ((ValuativeRel.valuation (W)).integer)).ramificationIdx ((ValuativeRel.valuation (V)).integer) = 1
end TunnellCompletionUnits
open NumberField IsDedekindDomain
open scoped Classical NumberField ValuativeRel WithZero

theorem TunnellCompletionUnits.unit : TunnellCompletionUnits.integralUnit := by
  intro D _ _ v u
  let K := v.adicCompletion D
  letI : ValuativeRel K := ValuativeRel.ofValuation (Valued.v : Valuation K ℤᵐ⁰)
  letI : (Valued.v : Valuation K ℤᵐ⁰).Compatible := Valuation.Compatible.ofValuation _
  let g := (algebraMap D K).comp (algebraMap (𝓞 D) D)
  have integral (x : 𝓞 D) : g x ∈ ((ValuativeRel.valuation (K)).integer) := by
    change ValuativeRel.valuation K (g x) ≤ 1
    rw [← Valuation.vle_one_iff, Valuation.vle_one_iff (Valued.v : Valuation K ℤᵐ⁰)]
    change Valued.v ((algebraMap D (v.adicCompletion D)) (x : D)) ≤ 1
    exact (v.valuedAdicCompletion_eq_valuation' (x : D)).le.trans (v.valuation_le_one x)
  let intoIntegers := g.codRestrict ((ValuativeRel.valuation (K)).integer) integral
  exact ⟨Units.map intoIntegers.toMonoidHom u, rfl⟩

namespace TunnellUnramifiedCompletion
open NumberField IsDedekindDomain IsDedekindDomain.HeightOneSpectrum IsLocalRing WithZero
open scoped Classical ValuativeRel

private theorem generator {D : Type} [Field D] [NumberField D] (v : HeightOneSpectrum (𝓞 D))
    [ValuativeRel (v.adicCompletion D)] [(Valued.v : Valuation (v.adicCompletion D) ℤᵐ⁰).Compatible]
    (x : ((ValuativeRel.valuation (v.adicCompletion D)).integer)) (hx : Valued.v (x : v.adicCompletion D) = exp (-1 : ℤ)) :
    Ideal.span {x} = maximalIdeal ((ValuativeRel.valuation (v.adicCompletion D)).integer) := by
  let K := v.adicCompletion D
  let e : ((ValuativeRel.valuation (K)).integer) ≃+* v.adicCompletionIntegers D := RingEquiv.restrict (RingEquiv.refl K) ((ValuativeRel.valuation (K)).integer)
    (v.adicCompletionIntegers D).toSubring (fun y => by
      change ValuativeRel.valuation K y ≤ 1 ↔ Valued.v y ≤ 1
      exact (Valuation.vle_one_iff (ValuativeRel.valuation K)).symm.trans (Valuation.vle_one_iff Valued.v))
  have hu : (Valued.v : Valuation K ℤᵐ⁰).IsUniformizer (e x) := by
    rw [Valuation.IsUniformizer.iff, Valuation.IsRankOneDiscrete.generator_eq_exp_neg_one_of_surjective
      (v.valuedAdicCompletion_surjective D)]
    exact hx
  apply e.idealComapOrderIso.symm.injective
  change (Ideal.span {x}).map e.toRingHom = (maximalIdeal _).map e.toRingHom
  rw [Ideal.map_span, Set.image_singleton]
  exact hu.is_generator.symm.trans (map_ringEquiv_maximalIdeal e).symm

theorem indices : TunnellCompletionUnits.commonUniformizer := by
  intro D N _ _ _ _ _ _ _ v t ht
  dsimp only
  intro f _ hc hK hL he hr
  let K := v.adicCompletion D
  let L := t.adicCompletion N
  letI : Algebra K L := f.toAlgebra
  letI : ValuativeRel K := ValuativeRel.ofValuation (Valued.v : Valuation K ℤᵐ⁰)
  letI : ValuativeRel L := ValuativeRel.ofValuation (Valued.v : Valuation L ℤᵐ⁰)
  letI : (Valued.v : Valuation K ℤᵐ⁰).Compatible := Valuation.Compatible.ofValuation _
  letI : (Valued.v : Valuation L ℤᵐ⁰).Compatible := Valuation.Compatible.ofValuation _
  letI : IsNonarchimedeanLocalField K := hK
  letI : IsNonarchimedeanLocalField L := hL
  letI : Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L) := he

  letI : t.asIdeal.LiesOver v.asIdeal := ht
  obtain ⟨π, hπ⟩ := v.valuation_exists_uniformizer D
  have hv : Valued.v (algebraMap D K π) = exp (-1:ℤ) := (v.valuedAdicCompletion_eq_valuation' π).trans hπ
  have hle : algebraMap D K π ∈ ((ValuativeRel.valuation (K)).integer) := by
    change ValuativeRel.valuation K _ ≤ 1
    rw [← Valuation.vle_one_iff, Valuation.vle_one_iff (Valued.v : Valuation K ℤᵐ⁰), hv]
    exact (exp_le_exp.mpr (by decide : (-1:ℤ) ≤ 0)).trans_eq exp_zero
  let r : ((ValuativeRel.valuation (K)).integer) := ⟨algebraMap D K π, hle⟩
  let r' : ((ValuativeRel.valuation (L)).integer) := algebraMap ((ValuativeRel.valuation (K)).integer) ((ValuativeRel.valuation (L)).integer) r
  have htπ : t.valuation N (algebraMap D N π) = exp (-1:ℤ) := by
    have h := valuation_liesOver N v t π
    rw [Ideal.ramificationIdx'_eq_ramificationIdx _ _ v.ne_bot, hr, pow_one, hπ] at h
    exact h.symm
  have hL : Valued.v (r' : L) = exp (-1:ℤ) := by
    change Valued.v (f (algebraMap D K π)) = _
    exact (congrArg (fun b : L => Valued.v b) (hc π)).trans ((t.valuedAdicCompletion_eq_valuation' (algebraMap D N π)).trans htπ)
  have sb := generator v r hv
  have st := generator t r' hL
  have mb : maximalIdeal ((ValuativeRel.valuation (K)).integer) ≠ ⊥ := by
    rw [← sb, ne_eq, Ideal.span_singleton_eq_bot]
    intro hr₀
    have hzero : algebraMap D K π = 0 := congrArg Subtype.val hr₀
    rw [hzero, map_zero] at hv
    exact exp_ne_zero hv.symm
  have mapped : (maximalIdeal ((ValuativeRel.valuation (K)).integer)).map (algebraMap ((ValuativeRel.valuation (K)).integer) ((ValuativeRel.valuation (L)).integer)) = maximalIdeal ((ValuativeRel.valuation (L)).integer) := by
    rw [← sb, Ideal.map_span, Set.image_singleton]
    exact st
  rw [← Ideal.ramificationIdx'_eq_ramificationIdx _ _ mb, ← mapped]
  exact Ideal.ramificationIdx'_map_self_eq_one (by rw [mapped]; exact Ideal.IsMaximal.ne_top inferInstance)
    (Ideal.map_ne_bot_of_ne_bot mb)

end TunnellUnramifiedCompletion



namespace TunnellCompletionUnits
open NumberField IsDedekindDomain IsLocalRing WithZero LocalFieldTheory LocalClassFieldTheory LocalFieldTheory.IsNonarchimedeanLocalField
open scoped Classical ValuativeRel WithZero

theorem localStructure {D : Type} [Field D] [NumberField D] (v : HeightOneSpectrum (𝓞 D)) :
    letI : ValuativeRel (v.adicCompletion D) := ValuativeRel.ofValuation (Valued.v : Valuation _ ℤᵐ⁰)
    IsNonarchimedeanLocalField (v.adicCompletion D) := by
  let K := v.adicCompletion D
  letI : ValuativeRel K := ValuativeRel.ofValuation (Valued.v : Valuation K ℤᵐ⁰)
  letI : (Valued.v : Valuation K ℤᵐ⁰).Compatible := Valuation.Compatible.ofValuation _
  haveI : (Valued.v : Valuation K ℤᵐ⁰).IsNontrivial := by
    obtain ⟨x,hx⟩ := v.valuedAdicCompletion_surjective D (exp (-1:ℤ))
    refine (Valuation.isNontrivial_iff_exists_lt_one _).mpr ⟨x,?_,?_⟩
    · rintro rfl
      exact exp_ne_zero ((map_zero _).symm.trans hx).symm
    · rw [hx]
      decide
  exact {
    toIsValuativeTopology := isValuativeTopology_of_valued_ofValuation K ℤᵐ⁰
    toLocallyCompactSpace := inferInstance
    toIsNontrivial := (ValuativeRel.isNontrivial_iff_isNontrivial (Valued.v : Valuation K ℤᵐ⁰)).mpr inferInstance }

end TunnellCompletionUnits

/- ClassFieldTheory.AlgebraicNumberTheory.Idele.Basic -/
section
open scoped NumberField RestrictedProduct
open NumberField IsDedekindDomain
noncomputable section
variable (K : Type*) [Field K] [NumberField K]
 


abbrev FiniteIdeleGroupOf
    (R : Type*) [CommRing R] [IsDedekindDomain R]
    (F : Type*) [Field F] [Algebra R F] [IsFractionRing R F] :=
  Πʳ v : HeightOneSpectrum R,
    [(v.adicCompletion F)ˣ, (v.adicCompletionIntegers F).units]
 
abbrev FiniteIdeleGroup :=
  FiniteIdeleGroupOf (𝓞 K) K
 
abbrev InfiniteIdeleGroup :=
  (NumberField.InfiniteAdeleRing K)ˣ
 
abbrev IdeleGroup :=
  InfiniteIdeleGroup K × FiniteIdeleGroup K
namespace FiniteIdeleGroup
variable {K}
 
def component (v : HeightOneSpectrum (𝓞 K)) :
    FiniteIdeleGroup K →* (v.adicCompletion K)ˣ where
  toFun a := a v
  map_one' := rfl
  map_mul' _ _ := rfl
end FiniteIdeleGroup
namespace InfiniteIdeleGroup
variable {K}
 
def component (v : InfinitePlace K) :
    InfiniteIdeleGroup K →* v.Completionˣ :=
  (Pi.evalMonoidHom (fun w : InfinitePlace K ↦ w.Completionˣ) v).comp
    ContinuousMulEquiv.piUnits.toMonoidHom
end InfiniteIdeleGroup
namespace IdeleGroup
variable {K}
 

def finiteEquivFiniteAdeleUnitsOf
  (R : Type*) [CommRing R] [IsDedekindDomain R]
    (F : Type*) [Field F] [Algebra R F] [IsFractionRing R F] :
    FiniteIdeleGroupOf R F ≃*
    (IsDedekindDomain.FiniteAdeleRing R F)ˣ :=
  (RestrictedProduct.unitsEquiv
    (ι := HeightOneSpectrum R)
    (S := fun v : HeightOneSpectrum R ↦ ValuationSubring (v.adicCompletion F))
    (B := fun v : HeightOneSpectrum R ↦ v.adicCompletionIntegers F)
    (𝓕 := Filter.cofinite)
    (fun v : HeightOneSpectrum R ↦ v.adicCompletion F)).symm
 
def infiniteComponent (v : InfinitePlace K) :
    IdeleGroup K →* v.Completionˣ :=
  (InfiniteIdeleGroup.component v).comp (MonoidHom.fst _ _)
 
def finiteComponent (v : HeightOneSpectrum (𝓞 K)) :
    IdeleGroup K →* (v.adicCompletion K)ˣ :=
  (FiniteIdeleGroup.component v).comp (MonoidHom.snd _ _)
 


def finiteEquivFiniteAdeleUnits :
    FiniteIdeleGroup K ≃*
      (IsDedekindDomain.FiniteAdeleRing (𝓞 K) K)ˣ :=
  finiteEquivFiniteAdeleUnitsOf (𝓞 K) K
 




def equivAdeleRingUnits :
    IdeleGroup K ≃* (NumberField.AdeleRing (𝓞 K) K)ˣ :=
  ((MulEquiv.refl (InfiniteIdeleGroup K)).prodCongr
      (finiteEquivFiniteAdeleUnits (K := K))).trans
    MulEquiv.prodUnits.symm
end IdeleGroup
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.Idele.PrincipalCore -/
section
open scoped NumberField
open NumberField IsDedekindDomain
noncomputable section
variable (K : Type*) [Field K] [NumberField K]
namespace IdeleGroup
 
def principalIdele : Kˣ →* IdeleGroup K :=
  (equivAdeleRingUnits (K := K)).symm.toMonoidHom.comp
    (Units.map (algebraMap K (NumberField.AdeleRing (𝓞 K) K)))
variable {K}
variable (K)
end IdeleGroup
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.Idele.Extension.BaseChange -/
section
open scoped NumberField TensorProduct
open NumberField
noncomputable section
variable
    (K L : Type*) [Field K] [NumberField K]
    [Field L] [NumberField L] [Algebra K L]
    [FiniteDimensional K L]
 

abbrev RelativeAdeleRing :=
  NumberField.AdeleRing (𝓞 K) K ⊗[K] L
 
abbrev RelativeIdeleGroup :=
  (RelativeAdeleRing K L)ˣ
namespace RelativeIdeleGroup
instance baseAdeleRingNontrivial :
    Nontrivial (NumberField.AdeleRing (𝓞 K) K) :=
  Function.Injective.nontrivial
    (NumberField.AdeleRing.algebraMap_injective
      (R := 𝓞 K) (K := K))
 
def adeleInclusion :
    NumberField.AdeleRing (𝓞 K) K →+*
      RelativeAdeleRing K L :=
  (Algebra.TensorProduct.includeLeft
    (R := K) (S := K)
    (A := NumberField.AdeleRing (𝓞 K) K) (B := L)).toRingHom
 
def inclusion :
    IdeleGroup K →* RelativeIdeleGroup K L :=
  (Units.map (adeleInclusion K L)).comp
    (IdeleGroup.equivAdeleRingUnits (K := K)).toMonoidHom
 

def norm :
    RelativeIdeleGroup K L →* IdeleGroup K :=
  (IdeleGroup.equivAdeleRingUnits (K := K)).symm.toMonoidHom.comp
    (Units.map
      (Algebra.norm
        (NumberField.AdeleRing (𝓞 K) K)))
end RelativeIdeleGroup
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.Idele.Extension.GaloisNorm -/
section
open scoped BigOperators TensorProduct
open NumberField
noncomputable section
namespace RelativeIdeleGroup
universe u v w
variable
    {K : Type u} {L : Type v}
    [Field K] [Field L] [Algebra K L]
    [FiniteDimensional K L]
 


def normPolynomial
    {ι : Type w} [Fintype ι] [DecidableEq ι]
    (b : Module.Basis ι K L) : MvPolynomial ι K :=
  (-1 : MvPolynomial ι K) ^ Module.finrank K L *
    ((Algebra.lmul K L).toLinearMap.polyCharpoly b).coeff 0
omit [FiniteDimensional K L] in
 

theorem baseChangedLmul_eq
    (A : Type w) [CommRing A] [Algebra K A] :
    LinearMap.tensorProduct K A L L ∘ₗ
        (Algebra.lmul K L).toLinearMap.baseChange A =
      (Algebra.lmul A (A ⊗[K] L)).toLinearMap := by
  apply LinearMap.ext
  intro z
  induction z using TensorProduct.induction_on with
  | zero => simp
  | add z₁ z₂ hz₁ hz₂ =>
      rw [map_add, map_add, hz₁, hz₂]
  | tmul a x =>
      apply LinearMap.ext
      intro y
      induction y using TensorProduct.induction_on with
      | zero => simp
      | add y₁ y₂ hy₁ hy₂ =>
          rw [map_add, map_add, hy₁, hy₂]
      | tmul b t =>
          simp [LinearMap.tensorProduct,
            Algebra.TensorProduct.tmul_mul_tmul,
            Algebra.smul_def, mul_comm]
 

theorem eval₂_normPolynomial_baseChange
    (A : Type*) [CommRing A] [Algebra K A] [Nontrivial A]
    {ι : Type w} [Fintype ι] [DecidableEq ι]
    (b : Module.Basis ι K L) (z : A ⊗[K] L) :
    MvPolynomial.eval₂ (algebraMap K A)
        ((Algebra.TensorProduct.basis A b).repr z)
        (normPolynomial b) =
      Algebra.norm A z := by
  have hcoeff := congrArg
      (fun p : Polynomial (MvPolynomial ι A) ↦ p.coeff 0)
      (LinearMap.polyCharpoly_baseChange
        (Algebra.lmul K L).toLinearMap b A)
  rw [Polynomial.coeff_map] at hcoeff
  rw [normPolynomial, MvPolynomial.eval₂_mul,
    MvPolynomial.eval₂_pow, MvPolynomial.eval₂_neg,
    MvPolynomial.eval₂_one]
  have heval :=
    MvPolynomial.eval₂_eq_eval_map
      (algebraMap K A)
      ((Algebra.TensorProduct.basis A b).repr z)
      (((Algebra.lmul K L).toLinearMap.polyCharpoly b).coeff 0)
  rw [heval, ← hcoeff]
  rw [LinearMap.polyCharpoly_coeff_eval]
  rw [baseChangedLmul_eq (K := K) (L := L) A]
  rw [Algebra.norm_apply,
    LinearMap.det_eq_sign_charpoly_coeff,
    Module.finrank_baseChange]
  rfl
end RelativeIdeleGroup
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.Idele.Extension.LocalComponent -/
section
open scoped NumberField TensorProduct
open NumberField IsDedekindDomain
noncomputable section
universe u v
variable
    {K : Type u} {L : Type v}
    [Field K] [NumberField K]
    [Field L] [NumberField L] [Algebra K L]
    [FiniteDimensional K L]
 

def infiniteAdeleComponentAlgHom
    (v : InfinitePlace K) :
    NumberField.AdeleRing (𝓞 K) K →ₐ[K]
      v.Completion :=
  (Pi.evalAlgHom K
      (fun w : InfinitePlace K => w.Completion) v).comp
    (AlgHom.fst K
      (NumberField.InfiniteAdeleRing K)
      (FiniteAdeleRing (𝓞 K) K))
@[simp]
theorem infiniteAdeleComponentAlgHom_apply
    (v : InfinitePlace K)
    (a : NumberField.AdeleRing (𝓞 K) K) :
    infiniteAdeleComponentAlgHom v a = a.1 v :=
  rfl
 

def relativeAdeleInfiniteComponent
    (v : InfinitePlace K) :
    RelativeAdeleRing K L →ₐ[K]
      v.Completion ⊗[K] L :=
  Algebra.TensorProduct.map
    (infiniteAdeleComponentAlgHom v)
    (AlgHom.id K L)
omit [NumberField L] [FiniteDimensional K L] in
@[simp]
theorem relativeAdeleInfiniteComponent_tmul
    (v : InfinitePlace K)
    (a : NumberField.AdeleRing (𝓞 K) K) (x : L) :
    relativeAdeleInfiniteComponent
        (K := K) (L := L) v (a ⊗ₜ[K] x) =
      a.1 v ⊗ₜ[K] x := by
  simp [relativeAdeleInfiniteComponent]
 

def finiteAdeleComponentAlgHom
    (v : HeightOneSpectrum (𝓞 K)) :
    NumberField.AdeleRing (𝓞 K) K →ₐ[K]
      v.adicCompletion K :=
  { __ :=
      (RestrictedProduct.evalRingHom
        (fun w : HeightOneSpectrum (𝓞 K) =>
          w.adicCompletion K) v).comp
        (RingHom.snd
          (NumberField.InfiniteAdeleRing K)
          (FiniteAdeleRing (𝓞 K) K))
    commutes' := by
      intro x
      rfl }
@[simp]
theorem finiteAdeleComponentAlgHom_apply
    (v : HeightOneSpectrum (𝓞 K))
    (a : NumberField.AdeleRing (𝓞 K) K) :
    finiteAdeleComponentAlgHom v a = a.2 v :=
  rfl
omit [NumberField L] [FiniteDimensional K L] in
 

def relativeAdeleFiniteComponent
    (v : HeightOneSpectrum (𝓞 K)) :
    RelativeAdeleRing K L →ₐ[K]
      v.adicCompletion K ⊗[K] L :=
  Algebra.TensorProduct.map
    (finiteAdeleComponentAlgHom v)
    (AlgHom.id K L)
omit [NumberField L] [FiniteDimensional K L] in
@[simp]
theorem relativeAdeleFiniteComponent_tmul
    (v : HeightOneSpectrum (𝓞 K))
    (a : NumberField.AdeleRing (𝓞 K) K) (x : L) :
    relativeAdeleFiniteComponent (K := K) (L := L) v
        (a ⊗ₜ[K] x) =
      a.2 v ⊗ₜ[K] x := by
  simp [relativeAdeleFiniteComponent]
omit [NumberField L] in
 


theorem map_norm_tensorProduct_baseChange
    {A : Type*} {B : Type*}
    [CommRing A] [CommRing B]
    [Algebra K A] [Algebra K B]
    [Nontrivial A] [Nontrivial B]
    (f : A →ₐ[K] B) (z : A ⊗[K] L) :
    f (Algebra.norm A z) =
      Algebra.norm B
        (Algebra.TensorProduct.map f (AlgHom.id K L) z) := by
  classical
  let b := Module.Free.chooseBasis K L
  have hrepr :
      ∀ i,
        (Algebra.TensorProduct.basis B b).repr
            (Algebra.TensorProduct.map f
              (AlgHom.id K L) z) i =
          f ((Algebra.TensorProduct.basis A b).repr z i) := by
    intro i
    induction z using TensorProduct.induction_on with
    | zero => simp
    | add x y hx hy =>
        simp [map_add, hx, hy]
    | tmul a x =>
        simp
  calc
    f (Algebra.norm A z) =
        f
          (MvPolynomial.eval₂ (algebraMap K A)
            ((Algebra.TensorProduct.basis A b).repr z)
            (RelativeIdeleGroup.normPolynomial b)) := by
      rw [RelativeIdeleGroup.eval₂_normPolynomial_baseChange]
    _ =
        MvPolynomial.eval₂
          (f.toRingHom.comp (algebraMap K A))
          (fun i => f
            ((Algebra.TensorProduct.basis A b).repr z i))
          (RelativeIdeleGroup.normPolynomial b) :=
      MvPolynomial.hom_eval₂
        (RelativeIdeleGroup.normPolynomial b)
        (algebraMap K A) f.toRingHom _
    _ =
        MvPolynomial.eval₂ (algebraMap K B)
          ((Algebra.TensorProduct.basis B b).repr
            (Algebra.TensorProduct.map f
              (AlgHom.id K L) z))
          (RelativeIdeleGroup.normPolynomial b) := by
      congr 1
      · ext x
        exact f.commutes x
      · funext i
        exact (hrepr i).symm
    _ =
        Algebra.norm B
          (Algebra.TensorProduct.map f
            (AlgHom.id K L) z) :=
      RelativeIdeleGroup.eval₂_normPolynomial_baseChange
        B b _
 
def RelativeIdeleGroup.infiniteComponent
    (v : InfinitePlace K) :
    RelativeIdeleGroup K L →*
      (v.Completion ⊗[K] L)ˣ :=
  Units.map
    (relativeAdeleInfiniteComponent
      (K := K) (L := L) v).toRingHom
 
def RelativeIdeleGroup.finiteComponent
    (v : HeightOneSpectrum (𝓞 K)) :
    RelativeIdeleGroup K L →*
      (v.adicCompletion K ⊗[K] L)ˣ :=
  Units.map
    (relativeAdeleFiniteComponent
      (K := K) (L := L) v).toRingHom
 
def localTensorNorm
    (v : HeightOneSpectrum (𝓞 K)) :
    (v.adicCompletion K ⊗[K] L)ˣ →*
      (v.adicCompletion K)ˣ :=
  Units.map (Algebra.norm (v.adicCompletion K))
omit [NumberField L] in
 

@[simp]
theorem RelativeIdeleGroup.finiteComponent_norm
    (v : HeightOneSpectrum (𝓞 K))
    (a : RelativeIdeleGroup K L) :
    IdeleGroup.finiteComponent v
        (RelativeIdeleGroup.norm K L a) =
      localTensorNorm (K := K) (L := L) v
        (RelativeIdeleGroup.finiteComponent
          (K := K) (L := L) v a) := by
  apply Units.ext
  change
    finiteAdeleComponentAlgHom v
        (Algebra.norm
          (NumberField.AdeleRing (𝓞 K) K)
          (a : RelativeAdeleRing K L)) =
      Algebra.norm (v.adicCompletion K)
        (relativeAdeleFiniteComponent
          (K := K) (L := L) v
          (a : RelativeAdeleRing K L))
  exact map_norm_tensorProduct_baseChange
    (K := K) (L := L)
    (finiteAdeleComponentAlgHom v)
    (a : RelativeAdeleRing K L)
omit [NumberField L] in
 

@[simp]
theorem RelativeIdeleGroup.infiniteComponent_norm
    (v : InfinitePlace K)
    (a : RelativeIdeleGroup K L) :
    IdeleGroup.infiniteComponent v
        (RelativeIdeleGroup.norm K L a) =
      Units.map (Algebra.norm v.Completion)
        (RelativeIdeleGroup.infiniteComponent
          (K := K) (L := L) v a) := by
  apply Units.ext
  change
    infiniteAdeleComponentAlgHom v
        (Algebra.norm
          (NumberField.AdeleRing (𝓞 K) K)
          (a : RelativeAdeleRing K L)) =
      Algebra.norm v.Completion
        (relativeAdeleInfiniteComponent
          (K := K) (L := L) v
          (a : RelativeAdeleRing K L))
  exact map_norm_tensorProduct_baseChange
    (K := K) (L := L)
    (infiniteAdeleComponentAlgHom v)
    (a : RelativeAdeleRing K L)
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.Idele.Relative.Support -/
section
open scoped NumberField TensorProduct
open NumberField IsDedekindDomain
noncomputable section
universe u v
variable
    {K : Type u} {L : Type v}
    [Field K] [NumberField K]
    [Field L] [NumberField L] [Algebra K L]
    [FiniteDimensional K L]
 
abbrev RelativeAdeleBasisIndex :=
  Module.Free.ChooseBasisIndex K L
 

noncomputable def relativeExtensionBasis :
    Module.Basis (RelativeAdeleBasisIndex (K := K) (L := L)) K L :=
  Module.Free.chooseBasis K L
 
noncomputable def relativeAdeleBasis :
    Module.Basis (RelativeAdeleBasisIndex (K := K) (L := L))
      (NumberField.AdeleRing (𝓞 K) K)
      (RelativeAdeleRing K L) :=
  Algebra.TensorProduct.basis
    (NumberField.AdeleRing (𝓞 K) K)
    (relativeExtensionBasis (K := K) (L := L))
 
noncomputable def relativeAdeleCoefficient
    (z : RelativeAdeleRing K L)
    (i : RelativeAdeleBasisIndex (K := K) (L := L)) :
    NumberField.AdeleRing (𝓞 K) K :=
  (relativeAdeleBasis (K := K) (L := L)).repr z i
omit [NumberField L] in
 
theorem relativeAdele_eq_sum_tmul_coefficients
    (z : RelativeAdeleRing K L) :
    z =
      ∑ i : RelativeAdeleBasisIndex (K := K) (L := L),
        relativeAdeleCoefficient
            (K := K) (L := L) z i ⊗ₜ[K]
          relativeExtensionBasis (K := K) (L := L) i := by
  symm
  simpa [relativeAdeleCoefficient, relativeAdeleBasis,
    relativeExtensionBasis, Algebra.TensorProduct.basis_apply,
    Algebra.TensorProduct.algebraMap_apply,
    Algebra.TensorProduct.tmul_mul_tmul, Algebra.smul_def] using
      (relativeAdeleBasis (K := K) (L := L)).sum_repr z
omit [NumberField L] in
 

theorem relativeAdeleFiniteComponent_eq_sum_tmul_coefficients
    (z : RelativeAdeleRing K L)
    (w : HeightOneSpectrum (𝓞 K)) :
    relativeAdeleFiniteComponent
        (K := K) (L := L) w z =
      ∑ i : RelativeAdeleBasisIndex (K := K) (L := L),
        (relativeAdeleCoefficient
            (K := K) (L := L) z i).2 w ⊗ₜ[K]
          relativeExtensionBasis (K := K) (L := L) i := by
  have h :=
    congrArg
      (relativeAdeleFiniteComponent
        (K := K) (L := L) w)
      (relativeAdele_eq_sum_tmul_coefficients
        (K := K) (L := L) z)
  simpa only [map_sum,
    relativeAdeleFiniteComponent_tmul] using h
omit [NumberField L] in
 

theorem relativeAdeleInfiniteComponent_eq_sum_tmul_coefficients
    (z : RelativeAdeleRing K L)
    (w : InfinitePlace K) :
    relativeAdeleInfiniteComponent
        (K := K) (L := L) w z =
      ∑ i : RelativeAdeleBasisIndex (K := K) (L := L),
        (relativeAdeleCoefficient
            (K := K) (L := L) z i).1 w ⊗ₜ[K]
          relativeExtensionBasis (K := K) (L := L) i := by
  have h :=
    congrArg
      (relativeAdeleInfiniteComponent
        (K := K) (L := L) w)
      (relativeAdele_eq_sum_tmul_coefficients
        (K := K) (L := L) z)
  simpa only [map_sum,
    relativeAdeleInfiniteComponent_tmul] using h
omit [NumberField L] in
 


def RelativeBasisIntegralAt
    (w : HeightOneSpectrum (𝓞 K))
    (x : w.adicCompletion K ⊗[K] L) : Prop :=
  ∃ c :
      RelativeAdeleBasisIndex (K := K) (L := L) →
        w.adicCompletionIntegers K,
    x =
      ∑ i : RelativeAdeleBasisIndex (K := K) (L := L),
        ((c i : w.adicCompletionIntegers K) :
            w.adicCompletion K) ⊗ₜ[K]
          relativeExtensionBasis (K := K) (L := L) i
omit [NumberField L] in
 

def RelativeBasisIntegralUnitAt
    (w : HeightOneSpectrum (𝓞 K))
    (x : (w.adicCompletion K ⊗[K] L)ˣ) : Prop :=
  RelativeBasisIntegralAt
      (K := K) (L := L) w
      (x : w.adicCompletion K ⊗[K] L) ∧
    RelativeBasisIntegralAt
      (K := K) (L := L) w
      ((x⁻¹ : (w.adicCompletion K ⊗[K] L)ˣ) :
        w.adicCompletion K ⊗[K] L)
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.Adele.Coordinates -/
section
open scoped NumberField TensorProduct
open NumberField IsDedekindDomain
noncomputable section
universe u v
variable
    {K : Type u} {L : Type v}
    [Field K] [NumberField K]
    [Field L] [NumberField L] [Algebra K L]
    [FiniteDimensional K L]
 

noncomputable def relativeAdeleCoefficientLinearEquiv :
    RelativeAdeleRing K L ≃ₗ[
      NumberField.AdeleRing (𝓞 K) K]
      (RelativeAdeleBasisIndex (K := K) (L := L) →
        NumberField.AdeleRing (𝓞 K) K) :=
  (relativeAdeleBasis (K := K) (L := L)).equivFun
 
noncomputable def relativeAdeleOfCoefficients
    (a :
      RelativeAdeleBasisIndex (K := K) (L := L) →
        NumberField.AdeleRing (𝓞 K) K) :
    RelativeAdeleRing K L :=
  (relativeAdeleCoefficientLinearEquiv
    (K := K) (L := L)).symm a
omit [NumberField L] in
@[simp]
theorem relativeAdeleCoefficient_ofCoefficients
    (a :
      RelativeAdeleBasisIndex (K := K) (L := L) →
        NumberField.AdeleRing (𝓞 K) K)
    (i : RelativeAdeleBasisIndex (K := K) (L := L)) :
    relativeAdeleCoefficient
        (K := K) (L := L)
        (relativeAdeleOfCoefficients
          (K := K) (L := L) a) i =
      a i := by
  change
    relativeAdeleCoefficientLinearEquiv
        (K := K) (L := L)
        ((relativeAdeleCoefficientLinearEquiv
          (K := K) (L := L)).symm a) i =
      a i
  rw [LinearEquiv.apply_symm_apply]
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.Adele.LocalComponents -/
section
open scoped NumberField TensorProduct
open NumberField IsDedekindDomain
noncomputable section
universe u v
variable
    {K : Type u} {L : Type v}
    [Field K] [NumberField K]
    [Field L] [NumberField L] [Algebra K L]
    [FiniteDimensional K L]
omit [NumberField L] in
 

@[simp]
theorem relativeAdeleFiniteComponent_basis_repr
    (z : RelativeAdeleRing K L)
    (w : HeightOneSpectrum (𝓞 K))
    (i : RelativeAdeleBasisIndex (K := K) (L := L)) :
    (Algebra.TensorProduct.basis
        (w.adicCompletion K)
        (relativeExtensionBasis
          (K := K) (L := L))).repr
        (relativeAdeleFiniteComponent
          (K := K) (L := L) w z) i =
      (relativeAdeleCoefficient
        (K := K) (L := L) z i).2 w := by
  classical
  rw [relativeAdeleFiniteComponent_eq_sum_tmul_coefficients]
  simp [relativeExtensionBasis, Finsupp.single_apply]
omit [NumberField L] in
 

@[simp]
theorem relativeAdeleInfiniteComponent_basis_repr
    (z : RelativeAdeleRing K L)
    (w : InfinitePlace K)
    (i : RelativeAdeleBasisIndex (K := K) (L := L)) :
    (Algebra.TensorProduct.basis
        w.Completion
        (relativeExtensionBasis
          (K := K) (L := L))).repr
        (relativeAdeleInfiniteComponent
          (K := K) (L := L) w z) i =
      (relativeAdeleCoefficient
        (K := K) (L := L) z i).1 w := by
  classical
  rw [relativeAdeleInfiniteComponent_eq_sum_tmul_coefficients]
  simp [relativeExtensionBasis, Finsupp.single_apply]
  change
    (relativeAdeleCoefficient
        (K := K) (L := L) z i).1 w *
        algebraMap K w.Completion (1 : K) =
      (relativeAdeleCoefficient
        (K := K) (L := L) z i).1 w
  rw [map_one, mul_one]
omit [NumberField L] in
 

theorem relativeAdele_ext_of_components
    {x y : RelativeAdeleRing K L}
    (hinfinite :
      ∀ w : InfinitePlace K,
        relativeAdeleInfiniteComponent
            (K := K) (L := L) w x =
          relativeAdeleInfiniteComponent
            (K := K) (L := L) w y)
    (hfinite :
      ∀ w : HeightOneSpectrum (𝓞 K),
        relativeAdeleFiniteComponent
            (K := K) (L := L) w x =
          relativeAdeleFiniteComponent
            (K := K) (L := L) w y) :
    x = y := by
  apply
    (relativeAdeleCoefficientLinearEquiv
      (K := K) (L := L)).injective
  funext i
  apply Prod.ext
  · funext w
    have h :=
      congrArg
        (fun z =>
          (Algebra.TensorProduct.basis
            w.Completion
            (relativeExtensionBasis
              (K := K) (L := L))).repr z i)
        (hinfinite w)
    change (relativeAdeleCoefficient (K := K) (L := L) x i).1 w =
      (relativeAdeleCoefficient (K := K) (L := L) y i).1 w
    simpa using h
  · apply DFunLike.coe_injective
    funext w
    have h :=
      congrArg
        (fun z =>
          (Algebra.TensorProduct.basis
            (w.adicCompletion K)
            (relativeExtensionBasis
              (K := K) (L := L))).repr z i)
        (hfinite w)
    change (relativeAdeleCoefficient (K := K) (L := L) x i).2 w =
      (relativeAdeleCoefficient (K := K) (L := L) y i).2 w
    simpa using h
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.Adele.RestrictedProduct -/
section
open scoped NumberField TensorProduct
open NumberField IsDedekindDomain
noncomputable section
universe u v
variable
    {K : Type u} {L : Type v}
    [Field K] [NumberField K]
    [Field L] [NumberField L] [Algebra K L]
    [FiniteDimensional K L]
 

structure RelativeLocalAdeleData where
   
  infinite :
    ∀ w : InfinitePlace K,
      w.Completion ⊗[K] L
   
  finite :
    ∀ w : HeightOneSpectrum (𝓞 K),
      w.adicCompletion K ⊗[K] L
   

  eventually_integral :
    ∀ i : RelativeAdeleBasisIndex (K := K) (L := L),
      ∀ᶠ w : HeightOneSpectrum (𝓞 K) in Filter.cofinite,
        (Algebra.TensorProduct.basis
            (w.adicCompletion K)
            (relativeExtensionBasis
              (K := K) (L := L))).repr
            (finite w) i ∈
          w.adicCompletionIntegers K
 

noncomputable def relativeLocalAdeleCoefficient
    (a : RelativeLocalAdeleData (K := K) (L := L))
    (i : RelativeAdeleBasisIndex (K := K) (L := L)) :
    NumberField.AdeleRing (𝓞 K) K :=
  ⟨fun w =>
      (Algebra.TensorProduct.basis
          w.Completion
          (relativeExtensionBasis
            (K := K) (L := L))).repr
          (a.infinite w) i,
    ⟨fun w =>
        (Algebra.TensorProduct.basis
            (w.adicCompletion K)
            (relativeExtensionBasis
              (K := K) (L := L))).repr
            (a.finite w) i,
      a.eventually_integral i⟩⟩
 

noncomputable def relativeAdeleOfLocalData
    (a : RelativeLocalAdeleData (K := K) (L := L)) :
    RelativeAdeleRing K L :=
  relativeAdeleOfCoefficients
    (K := K) (L := L)
    (relativeLocalAdeleCoefficient
      (K := K) (L := L) a)
omit [NumberField L] in
@[simp]
theorem relativeAdeleOfLocalData_infiniteComponent
    (a : RelativeLocalAdeleData (K := K) (L := L))
    (w : InfinitePlace K) :
    relativeAdeleInfiniteComponent
        (K := K) (L := L) w
        (relativeAdeleOfLocalData
          (K := K) (L := L) a) =
      a.infinite w := by
  apply
    (Algebra.TensorProduct.basis
      w.Completion
      (relativeExtensionBasis
        (K := K) (L := L))).repr.injective
  apply Finsupp.ext
  intro i
  rw [relativeAdeleInfiniteComponent_basis_repr]
  have h :=
    relativeAdeleCoefficient_ofCoefficients
      (K := K) (L := L)
      (relativeLocalAdeleCoefficient
        (K := K) (L := L) a) i
  exact congrArg
    (fun q : NumberField.AdeleRing (𝓞 K) K =>
      q.1 w) h
omit [NumberField L] in
@[simp]
theorem relativeAdeleOfLocalData_finiteComponent
    (a : RelativeLocalAdeleData (K := K) (L := L))
    (w : HeightOneSpectrum (𝓞 K)) :
    relativeAdeleFiniteComponent
        (K := K) (L := L) w
        (relativeAdeleOfLocalData
          (K := K) (L := L) a) =
      a.finite w := by
  apply
    (Algebra.TensorProduct.basis
      (w.adicCompletion K)
      (relativeExtensionBasis
        (K := K) (L := L))).repr.injective
  apply Finsupp.ext
  intro i
  rw [relativeAdeleFiniteComponent_basis_repr]
  have h :=
    relativeAdeleCoefficient_ofCoefficients
      (K := K) (L := L)
      (relativeLocalAdeleCoefficient
        (K := K) (L := L) a) i
  exact congrArg
    (fun q : NumberField.AdeleRing (𝓞 K) K =>
      q.2.1 w) h
 

structure RelativeLocalIdeleData where
   
  infinite :
    ∀ w : InfinitePlace K,
      (w.Completion ⊗[K] L)ˣ
   
  finite :
    ∀ w : HeightOneSpectrum (𝓞 K),
      (w.adicCompletion K ⊗[K] L)ˣ
   

  eventually_integral :
    ∀ i : RelativeAdeleBasisIndex (K := K) (L := L),
      ∀ᶠ w : HeightOneSpectrum (𝓞 K) in Filter.cofinite,
        (Algebra.TensorProduct.basis
            (w.adicCompletion K)
            (relativeExtensionBasis
              (K := K) (L := L))).repr
            (finite w : w.adicCompletion K ⊗[K] L) i ∈
          w.adicCompletionIntegers K
   

  eventually_inverse_integral :
    ∀ i : RelativeAdeleBasisIndex (K := K) (L := L),
      ∀ᶠ w : HeightOneSpectrum (𝓞 K) in Filter.cofinite,
        (Algebra.TensorProduct.basis
            (w.adicCompletion K)
            (relativeExtensionBasis
              (K := K) (L := L))).repr
            (↑((finite w)⁻¹) :
              w.adicCompletion K ⊗[K] L) i ∈
          w.adicCompletionIntegers K
 
noncomputable def RelativeLocalIdeleData.value
    (a : RelativeLocalIdeleData (K := K) (L := L)) :
    RelativeLocalAdeleData (K := K) (L := L) where
  infinite w := a.infinite w
  finite w := a.finite w
  eventually_integral := a.eventually_integral
 
noncomputable def RelativeLocalIdeleData.inverse
    (a : RelativeLocalIdeleData (K := K) (L := L)) :
    RelativeLocalAdeleData (K := K) (L := L) where
  infinite w :=
    (↑((a.infinite w)⁻¹) :
      w.Completion ⊗[K] L)
  finite w :=
    (↑((a.finite w)⁻¹) :
      w.adicCompletion K ⊗[K] L)
  eventually_integral := a.eventually_inverse_integral
 
noncomputable def relativeIdeleOfLocalData
    (a : RelativeLocalIdeleData (K := K) (L := L)) :
    RelativeIdeleGroup K L := by
  let x :=
    relativeAdeleOfLocalData
      (K := K) (L := L) a.value
  let y :=
    relativeAdeleOfLocalData
      (K := K) (L := L) a.inverse
  have hxy : x * y = 1 := by
    apply relativeAdele_ext_of_components
    · intro w
      rw [map_mul,
        relativeAdeleOfLocalData_infiniteComponent,
        relativeAdeleOfLocalData_infiniteComponent,
        map_one]
      change
        (((a.infinite w) * (a.infinite w)⁻¹ :
          (w.Completion ⊗[K] L)ˣ) :
            w.Completion ⊗[K] L) = 1
      simp
    · intro w
      rw [map_mul,
        relativeAdeleOfLocalData_finiteComponent,
        relativeAdeleOfLocalData_finiteComponent,
        map_one]
      change
        (((a.finite w) * (a.finite w)⁻¹ :
          (w.adicCompletion K ⊗[K] L)ˣ) :
            w.adicCompletion K ⊗[K] L) = 1
      simp
  exact Units.mkOfMulEqOne x y hxy
omit [NumberField L] in
@[simp]
theorem relativeIdeleOfLocalData_infiniteComponent
    (a : RelativeLocalIdeleData (K := K) (L := L))
    (w : InfinitePlace K) :
    RelativeIdeleGroup.infiniteComponent
        (K := K) (L := L) w
        (relativeIdeleOfLocalData
          (K := K) (L := L) a) =
      a.infinite w := by
  apply Units.ext
  change
    relativeAdeleInfiniteComponent
        (K := K) (L := L) w
        (relativeAdeleOfLocalData
          (K := K) (L := L) a.value) =
      (a.infinite w :
        w.Completion ⊗[K] L)
  rw [relativeAdeleOfLocalData_infiniteComponent]
  change
    (↑(a.infinite w) :
      w.Completion ⊗[K] L) =
      (↑(a.infinite w) :
        w.Completion ⊗[K] L)
  rfl
omit [NumberField L] in
@[simp]
theorem relativeIdeleOfLocalData_finiteComponent
    (a : RelativeLocalIdeleData (K := K) (L := L))
    (w : HeightOneSpectrum (𝓞 K)) :
    RelativeIdeleGroup.finiteComponent
        (K := K) (L := L) w
        (relativeIdeleOfLocalData
          (K := K) (L := L) a) =
      a.finite w := by
  apply Units.ext
  change
    relativeAdeleFiniteComponent
        (K := K) (L := L) w
        (relativeAdeleOfLocalData
          (K := K) (L := L) a.value) =
      (a.finite w :
        w.adicCompletion K ⊗[K] L)
  rw [relativeAdeleOfLocalData_finiteComponent]
  change
    (↑(a.finite w) :
      w.adicCompletion K ⊗[K] L) =
      (↑(a.finite w) :
        w.adicCompletion K ⊗[K] L)
  rfl
end
end

/- ValuedFieldTheory.Valuation.Completion.FiniteProductNormTrace -/
section
noncomputable section
namespace ValuationTheory
namespace Completion
universe u v w
open Module
 

theorem algebra_lmul_prod_eq_prodMap
    {R S T : Type*} [CommRing R] [CommRing S] [CommRing T]
    [Algebra R S] [Algebra R T] (x : S × T) :
    Algebra.lmul R (S × T) x =
      (Algebra.lmul R S x.1).prodMap (Algebra.lmul R T x.2) := by
  apply LinearMap.ext
  intro y
  rcases y with ⟨y, z⟩
  rfl
 

theorem algebra_norm_prod_apply
    {R S T : Type*} [CommRing R] [CommRing S] [CommRing T]
    [Algebra R S] [Algebra R T]
    [Module.Free R S] [Module.Finite R S]
    [Module.Free R T] [Module.Finite R T]
    (x : S × T) :
    Algebra.norm R x = Algebra.norm R x.1 * Algebra.norm R x.2 := by
  rw [Algebra.norm_apply, algebra_lmul_prod_eq_prodMap,
    LinearMap.det_prodMap, ← Algebra.norm_apply, ← Algebra.norm_apply]
 
noncomputable def piCongrLeftAlgEquiv
    {R : Type*} [CommSemiring R]
    {ι ι' : Type*} (A : ι' → Type*) [∀ i, Semiring (A i)]
    [∀ i, Algebra R (A i)] (e : ι ≃ ι') :
    ((i : ι) → A (e i)) ≃ₐ[R] ((i' : ι') → A i') where
  __ := RingEquiv.piCongrLeft A e
  commutes' r := by
    funext j
    obtain ⟨i, rfl⟩ := e.surjective j
    change (Equiv.piCongrLeft A e
      (fun i => algebraMap R (A (e i)) r)) (e i) =
        algebraMap R (A (e i)) r
    exact Equiv.piCongrLeft_apply_apply A e _ i
 

noncomputable def piOptionEquivProdAlgEquiv
    {R : Type*} [CommSemiring R]
    {ι : Type*} (A : Option ι → Type*) [∀ i, Semiring (A i)]
    [∀ i, Algebra R (A i)] :
    ((i : Option ι) → A i) ≃ₐ[R] (A none × ((i : ι) → A (some i))) where
  __ := RingEquiv.piOptionEquivProd
  commutes' _ := rfl
 

theorem algebra_norm_pi_apply
    {R : Type u} [CommRing R]
    {ι : Type v} [Fintype ι]
    (A : ι → Type w) [∀ i, CommRing (A i)] [∀ i, Algebra R (A i)]
    [∀ i, Module.Free R (A i)] [∀ i, Module.Finite R (A i)]
    (x : ∀ i, A i) :
    Algebra.norm R x = ∏ i, Algebra.norm R (x i) := by
  classical
  let P : ∀ (ι : Type v) [Fintype ι], Prop :=
    fun ι _ =>
      ∀ (A : ι → Type w) [∀ i, CommRing (A i)] [∀ i, Algebra R (A i)]
        [∀ i, Module.Free R (A i)] [∀ i, Module.Finite R (A i)]
        (x : ∀ i, A i),
        Algebra.norm R x = ∏ i, Algebra.norm R (x i)
  apply Fintype.induction_empty_option (P := P)
  · intro α β _ e h A _ _ _ _ x
    let : Fintype α := Fintype.ofEquiv β e.symm
    let E := piCongrLeftAlgEquiv (R := R) A e
    let x' : ∀ i : α, A (e i) := fun i => x (e i)
    have hEx : E x' = x := by
      apply E.symm.injective
      rw [E.symm_apply_apply]
      funext i
      rfl
    calc
      Algebra.norm R x = Algebra.norm R (E x') := congrArg _ hEx.symm
      _ = Algebra.norm R x' := Algebra.norm_eq_of_algEquiv E x'
      _ = ∏ i : α, Algebra.norm R (x' i) := h _ _
      _ = ∏ j : β, Algebra.norm R (x j) := by
        exact Fintype.prod_equiv e _ _ (fun i => rfl)
  · intro A _ _ _ _ x
    simp only [Fintype.prod_empty]
    rw [Algebra.norm_apply]
    exact LinearMap.det_eq_one_of_subsingleton _
  · intro α _ h A _ _ _ _ x
    let E := piOptionEquivProdAlgEquiv (R := R) A
    let y : A none × ((i : α) → A (some i)) := E x
    calc
      Algebra.norm R x = Algebra.norm R y :=
        (Algebra.norm_eq_of_algEquiv E x).symm
      _ = Algebra.norm R y.1 * Algebra.norm R y.2 :=
        algebra_norm_prod_apply y
      _ = Algebra.norm R (x none) *
          ∏ i : α, Algebra.norm R (x (some i)) := by
        rw [h]
        rfl
      _ = ∏ i : Option α, Algebra.norm R (x i) := by
        rw [Fintype.prod_option]
 

theorem algebra_trace_pi_apply
    {R : Type u} [CommRing R]
    {ι : Type v} [Fintype ι]
    (A : ι → Type w) [∀ i, CommRing (A i)] [∀ i, Algebra R (A i)]
    [∀ i, Module.Free R (A i)] [∀ i, Module.Finite R (A i)]
    (x : ∀ i, A i) :
    Algebra.trace R (∀ i, A i) x = ∑ i, Algebra.trace R (A i) (x i) := by
  classical
  let P : ∀ (ι : Type v) [Fintype ι], Prop :=
    fun ι _ =>
      ∀ (A : ι → Type w) [∀ i, CommRing (A i)] [∀ i, Algebra R (A i)]
        [∀ i, Module.Free R (A i)] [∀ i, Module.Finite R (A i)]
        (x : ∀ i, A i),
        Algebra.trace R (∀ i, A i) x =
          ∑ i, Algebra.trace R (A i) (x i)
  apply Fintype.induction_empty_option (P := P)
  · intro α β _ e h A _ _ _ _ x
    let : Fintype α := Fintype.ofEquiv β e.symm
    let E := piCongrLeftAlgEquiv (R := R) A e
    let x' : ∀ i : α, A (e i) := fun i => x (e i)
    have hEx : E x' = x := by
      apply E.symm.injective
      rw [E.symm_apply_apply]
      funext i
      rfl
    calc
      Algebra.trace R (∀ j : β, A j) x =
          Algebra.trace R (∀ i : α, A (e i)) x' := by
        rw [← Algebra.trace_eq_of_algEquiv E x']
        rw [hEx]
      _ = ∑ i : α, Algebra.trace R (A (e i)) (x' i) := h _ _
      _ = ∑ j : β, Algebra.trace R (A j) (x j) := by
        exact Fintype.sum_equiv e _ _ (fun i => rfl)
  · intro A _ _ _ _ x
    simp only [Fintype.sum_empty]
    rw [Algebra.trace_apply]
    let b : Basis (Fin 0) R ((i : PEmpty) → A i) := Basis.empty _
    rw [LinearMap.trace_eq_matrix_trace R b]
    simp [Matrix.trace]
  · intro α _ h A _ _ _ _ x
    let E := piOptionEquivProdAlgEquiv (R := R) A
    let y : A none × ((i : α) → A (some i)) := E x
    calc
      Algebra.trace R (∀ i : Option α, A i) x =
          Algebra.trace R (A none × ((i : α) → A (some i))) y :=
        (Algebra.trace_eq_of_algEquiv E x).symm
      _ = Algebra.trace R (A none) y.1 +
          Algebra.trace R ((i : α) → A (some i)) y.2 :=
        Algebra.trace_prod_apply y
      _ = Algebra.trace R (A none) (x none) +
          ∑ i : α, Algebra.trace R (A (some i)) (x (some i)) := by
        rw [h]
        rfl
      _ = ∑ i : Option α, Algebra.trace R (A i) (x i) := by
        rw [Fintype.sum_option]
end Completion
end ValuationTheory
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.RayClass.Basic -/
section
open scoped NumberField
open NumberField IsDedekindDomain
noncomputable section
variable {K : Type*} [Field K] [NumberField K]
namespace RayClass
 

def infinitePositiveSubgroup (v : InfinitePlace K) :
    Subgroup v.Completionˣ where
  carrier := {x | ∀ hv : v.IsReal,
    0 < NumberField.InfinitePlace.Completion.extensionEmbeddingOfIsReal
      hv (x : v.Completion)}
  one_mem' hv := by simp
  mul_mem' {x y} hx hy hv := by
    change 0 <
      NumberField.InfinitePlace.Completion.extensionEmbeddingOfIsReal
        hv ((x : v.Completion) * (y : v.Completion))
    rw [map_mul]
    exact mul_pos (hx hv) (hy hv)
  inv_mem' {x} hx hv := by
    rw [Units.val_inv_eq_inv_val, map_inv₀]
    exact inv_pos.mpr (hx hv)
omit [NumberField K] in
@[simp]
theorem mem_infinitePositiveSubgroup_iff
    (v : InfinitePlace K) (x : v.Completionˣ) :
    x ∈ infinitePositiveSubgroup v ↔
      ∀ hv : v.IsReal,
        0 < NumberField.InfinitePlace.Completion.extensionEmbeddingOfIsReal
          hv (x : v.Completion) :=
  Iff.rfl
end RayClass
end
end

/- ValuedFieldTheory.Ramification.HilbertRamification.Dedekind.PrimeContractions -/
section
noncomputable section
namespace HilbertRamification
namespace Dedekind
open Algebra NumberField
open scoped Pointwise
variable {K L : Type*}
variable [Field K] [Field L] [NumberField K] [NumberField L] [Algebra K L]
variable (G : Type*) [Group G] [MulSemiringAction G L] [SMulCommClass G K L]
 

theorem ringOfIntegers_under_ne_bot
    {E F : Type*} [Field E] [Field F] [NumberField E] [NumberField F]
    [Algebra E F] (P : Ideal (𝓞 F)) [P.IsMaximal] :
    P.under (𝓞 E) ≠ ⊥ := by
  exact
    Ring.ne_bot_of_isMaximal_of_not_isField
      (M := P.under (𝓞 E)) inferInstance
      (RingOfIntegers.not_isField E)
 

abbrev basePrime
    (P : Ideal (𝓞 L)) :
    Ideal (𝓞 K) :=
  P.under (𝓞 K)
 
instance basePrime_isPrime
    (P : Ideal (𝓞 L)) [P.IsPrime] :
    (basePrime (K := K) P).IsPrime :=
  inferInstance
end Dedekind
end HilbertRamification
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.Completion.ExtensionIndex -/
section
open scoped NumberField Classical
open NumberField IsDedekindDomain
noncomputable section

universe u v w
variable
    {K : Type u} {L : Type v}
    [Field K] [NumberField K]
    [Field L] [NumberField L] [Algebra K L]
 
noncomputable def finitePlaceBelow
    (W : HeightOneSpectrum (𝓞 L)) :
    HeightOneSpectrum (𝓞 K) where
  asIdeal := W.asIdeal.under (𝓞 K)
  isPrime := inferInstance
  ne_bot :=
    HilbertRamification.Dedekind.ringOfIntegers_under_ne_bot
      (E := K) (F := L) W.asIdeal
section Tower
variable {M : Type w}
    [Field M] [NumberField M]
    [Algebra K M] [Algebra M L]
    [IsScalarTower K M L]
end Tower
section Centre
variable [FiniteDimensional K L]
section CrossBaseEquivalence
variable {F M : Type*}
    [Field F] [NumberField F]
    [Field M] [NumberField M]
    [Algebra F L] [Algebra M L]
end CrossBaseEquivalence
end Centre
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.Completion.AdicCompletionMap -/
section
open scoped NumberField
open NumberField IsDedekindDomain
noncomputable section
universe u v w
variable
    (K : Type u) (L : Type v)
    [Field K] [NumberField K]
    [Field L] [NumberField L] [Algebra K L]
 


noncomputable def finitePlaceAdicCompletionMap
    (w : HeightOneSpectrum (𝓞 K))
    (W : {W : HeightOneSpectrum (𝓞 L) //
      finitePlaceBelow (K := K) W = w}) :
    w.adicCompletion K →+* W.1.adicCompletion L := by
  letI : W.1.asIdeal.LiesOver w.asIdeal := by
    constructor
    exact congrArg HeightOneSpectrum.asIdeal W.2.symm
  exact
    (HeightOneSpectrum.adicCompletion.equiv L W.1).symm.toRingHom.comp
      ((UniformSpace.Completion.mapRingHom
        (algebraMap
          (WithVal (w.valuation K))
          (WithVal (W.1.valuation L)))
        (HeightOneSpectrum.uniformContinuous_algebraMap_liesOver
          K L w W.1).continuous).comp
        (HeightOneSpectrum.adicCompletion.equiv K w).toRingHom)
 

theorem finitePlaceAdicCompletionMap_coe
    (w : HeightOneSpectrum (𝓞 K))
    (W : {W : HeightOneSpectrum (𝓞 L) //
      finitePlaceBelow (K := K) W = w})
    (x : K) :
    finitePlaceAdicCompletionMap K L w W
        (x : w.adicCompletion K) =
      (algebraMap K L x : W.1.adicCompletion L) := by
  let : W.1.asIdeal.LiesOver w.asIdeal := by
    constructor
    exact congrArg HeightOneSpectrum.asIdeal W.2.symm
  change
    HeightOneSpectrum.adicCompletion.ofCompletion
      (UniformSpace.Completion.mapRingHom
        (algebraMap
          (WithVal (w.valuation K))
          (WithVal (W.1.valuation L)))
        (HeightOneSpectrum.uniformContinuous_algebraMap_liesOver
          K L w W.1).continuous
        (algebraMap K (w.valuation K).Completion x)) =
      _
  congr 1
  change
    UniformSpace.Completion.mapRingHom
        (algebraMap
          (WithVal (w.valuation K))
          (WithVal (W.1.valuation L)))
        (HeightOneSpectrum.uniformContinuous_algebraMap_liesOver
          K L w W.1).continuous
        ((WithVal.equiv (w.valuation K)).symm x :
          (w.valuation K).Completion) =
      ((algebraMap
        (WithVal (w.valuation K))
        (WithVal (W.1.valuation L)))
        ((WithVal.equiv (w.valuation K)).symm x) :
          (W.1.valuation L).Completion)
  rw [UniformSpace.Completion.mapRingHom_coe]
 
theorem finitePlaceAdicCompletionMap_continuous
    (w : HeightOneSpectrum (𝓞 K))
    (W : {W : HeightOneSpectrum (𝓞 L) //
      finitePlaceBelow (K := K) W = w}) :
    Continuous (finitePlaceAdicCompletionMap K L w W) := by
  let : W.1.asIdeal.LiesOver w.asIdeal := by
    constructor
    exact congrArg HeightOneSpectrum.asIdeal W.2.symm
  unfold finitePlaceAdicCompletionMap
  exact
    (HeightOneSpectrum.adicCompletion.continuous_ofCompletion L W.1).comp
      (UniformSpace.Completion.continuous_map.comp
        (HeightOneSpectrum.adicCompletion.continuous_toCompletion K w))
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.Idele.Relative.SPlaces -/
section
open scoped NumberField TensorProduct
open NumberField IsDedekindDomain
noncomputable section


universe u v
variable
    {K : Type u} {L : Type v}
    [Field K] [NumberField K]
    [Field L] [NumberField L] [Algebra K L]
    [FiniteDimensional K L] [IsGalois K L]
omit [NumberField L] [IsGalois K L] in
 

theorem relativeBasisIntegralAt_repr_mem
    (w : HeightOneSpectrum (𝓞 K))
    (x : w.adicCompletion K ⊗[K] L)
    (hx : RelativeBasisIntegralAt
      (K := K) (L := L) w x)
    (i : RelativeAdeleBasisIndex (K := K) (L := L)) :
    (Algebra.TensorProduct.basis
        (w.adicCompletion K)
        (relativeExtensionBasis
          (K := K) (L := L))).repr x i ∈
      w.adicCompletionIntegers K := by
  classical
  rcases hx with ⟨c, rfl⟩
  simp
  rw [Finset.sum_eq_single i]
  · simpa only [Finsupp.single_eq_same] using (c i).property
  · intro j _ hji
    simp [hji]
  · simp
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.Idele.NormApproximation.InfinitePlaces -/
section
open scoped NumberField TensorProduct
open NumberField IsDedekindDomain
open LocalFieldTheory
noncomputable section
open LocalClassFieldTheory
variable {K : Type} [Field K] [NumberField K]
omit [NumberField K] in
 


theorem exists_infinitePositiveSubgroup_nthRoot
    (v : InfinitePlace K)
    (n : ℕ) (hn : 0 < n)
    (x : v.Completionˣ)
    (hx : x ∈ RayClass.infinitePositiveSubgroup v) :
    ∃ y : v.Completionˣ, y ^ n = x := by
  by_cases hv : v.IsReal
  · let e : v.Completion ≃+* ℝ :=
      InfinitePlace.Completion.ringEquivRealOfIsReal hv
    let eu : v.Completionˣ ≃* ℝˣ :=
      Units.mapEquiv e.toMulEquiv
    have hxpos : 0 < ((eu x : ℝˣ) : ℝ) := by
      exact
        ((RayClass.mem_infinitePositiveSubgroup_iff v x).mp hx) hv
    let yr : ℝ :=
      ((eu x : ℝˣ) : ℝ) ^ ((n : ℝ)⁻¹)
    have hyrpow :
        yr ^ n = ((eu x : ℝˣ) : ℝ) := by
      exact Real.rpow_inv_natCast_pow hxpos.le hn.ne'
    have hyrne : yr ≠ 0 := by
      intro hyr
      rw [hyr, zero_pow hn.ne'] at hyrpow
      exact (eu x).ne_zero hyrpow.symm
    let yu : ℝˣ := Units.mk0 yr hyrne
    refine ⟨eu.symm yu, ?_⟩
    apply eu.injective
    simp only [map_pow, eu.apply_symm_apply]
    apply Units.ext
    exact hyrpow
  · have hvc : v.IsComplex :=
      InfinitePlace.not_isReal_iff_isComplex.mp hv
    let e : v.Completion ≃+* ℂ :=
      InfinitePlace.Completion.ringEquivComplexOfIsComplex hvc
    let eu : v.Completionˣ ≃* ℂˣ :=
      Units.mapEquiv e.toMulEquiv
    obtain ⟨z, hz⟩ :=
      IsAlgClosed.exists_pow_nat_eq
        ((eu x : ℂˣ) : ℂ) hn
    have hz0 : z ≠ 0 := by
      intro hzero
      rw [hzero, zero_pow hn.ne'] at hz
      exact (eu x).ne_zero hz.symm
    let zu : ℂˣ := Units.mk0 z hz0
    refine ⟨eu.symm zu, ?_⟩
    apply eu.injective
    simp only [map_pow, eu.apply_symm_apply]
    apply Units.ext
    exact hz
variable {L : Type} [Field L] [Algebra K L]
    [FiniteDimensional K L]
 

def infiniteTensorDetNorm
    (v : InfinitePlace K) :
    (v.Completion ⊗[K] L)ˣ →* v.Completionˣ :=
  Units.map (Algebra.norm v.Completion)
 
def infiniteTensorNormSubgroup
    (v : InfinitePlace K) :
    Subgroup v.Completionˣ :=
  (infiniteTensorDetNorm (K := K) (L := L) v).range
 

theorem infinitePositiveSubgroup_le_infiniteTensorNormSubgroup
    (v : InfinitePlace K) :
    RayClass.infinitePositiveSubgroup v ≤
      infiniteTensorNormSubgroup (K := K) (L := L) v := by
  intro x hx
  let n := Module.finrank K L
  have hn : 0 < n :=
    Module.finrank_pos
  obtain ⟨y, hy⟩ :=
    exists_infinitePositiveSubgroup_nthRoot
      v n hn x hx
  let z : (v.Completion ⊗[K] L)ˣ :=
    Units.map
      (algebraMap v.Completion
        (v.Completion ⊗[K] L)).toMonoidHom y
  refine ⟨z, ?_⟩
  apply Units.ext
  change
    Algebra.norm v.Completion
        (algebraMap v.Completion
          (v.Completion ⊗[K] L)
          (y : v.Completion)) =
      (x : v.Completion)
  rw [Algebra.norm_algebraMap,
    Module.finrank_baseChange]
  exact congrArg Units.val hy
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.Idele.Norm -/
section
open scoped NumberField TensorProduct RestrictedProduct
open NumberField IsDedekindDomain
noncomputable section
variable
    {K L : Type}
    [Field K] [NumberField K]
    [Field L] [NumberField L] [Algebra K L]
    [FiniteDimensional K L] [IsGalois K L]
omit [NumberField L] [IsGalois K L] in
 



theorem exists_relativeIdele_norm_eq_of_localTensorPreimages
    (a : IdeleGroup K)
    (zInfinite :
      ∀ w : InfinitePlace K,
        (w.Completion ⊗[K] L)ˣ)
    (zFinite :
      ∀ w : HeightOneSpectrum (𝓞 K),
        (w.adicCompletion K ⊗[K] L)ˣ)
    (hInfinite :
      ∀ w : InfinitePlace K,
        infiniteTensorDetNorm (K := K) (L := L) w
            (zInfinite w) =
          IdeleGroup.infiniteComponent w a)
    (hFinite :
      ∀ w : HeightOneSpectrum (𝓞 K),
        _root_.localTensorNorm
            (K := K) (L := L) w (zFinite w) =
          IdeleGroup.finiteComponent w a)
    (hIntegral :
      ∀ᶠ w : HeightOneSpectrum (𝓞 K) in Filter.cofinite,
        RelativeBasisIntegralUnitAt
          (K := K) (L := L) w (zFinite w)) :
    ∃ z : RelativeIdeleGroup K L,
      RelativeIdeleGroup.norm K L z = a := by
  let d : RelativeLocalIdeleData (K := K) (L := L) :=
    { infinite := zInfinite
      finite := zFinite
      eventually_integral := fun i =>
        hIntegral.mono fun w hw =>
          relativeBasisIntegralAt_repr_mem
            (K := K) (L := L) w _ hw.1 i
      eventually_inverse_integral := fun i =>
        hIntegral.mono fun w hw =>
          relativeBasisIntegralAt_repr_mem
            (K := K) (L := L) w _ hw.2 i }
  refine
    ⟨relativeIdeleOfLocalData (K := K) (L := L) d, ?_⟩
  apply Prod.ext
  · apply ContinuousMulEquiv.piUnits.injective
    funext w
    change
      IdeleGroup.infiniteComponent w
          (RelativeIdeleGroup.norm K L
            (relativeIdeleOfLocalData
              (K := K) (L := L) d)) =
        IdeleGroup.infiniteComponent w a
    rw [RelativeIdeleGroup.infiniteComponent_norm,
      relativeIdeleOfLocalData_infiniteComponent]
    exact hInfinite w
  · apply RestrictedProduct.ext
    intro w
    change
      IdeleGroup.finiteComponent w
          (RelativeIdeleGroup.norm K L
            (relativeIdeleOfLocalData
              (K := K) (L := L) d)) =
        IdeleGroup.finiteComponent w a
    rw [RelativeIdeleGroup.finiteComponent_norm,
      relativeIdeleOfLocalData_finiteComponent]
    exact hFinite w
omit [NumberField L] [IsGalois K L] in
 


theorem idele_mem_relativeNorm_range_of_localNorms_with_integralPreimages
    (a : IdeleGroup K)
    (hInfinite :
      ∀ w : InfinitePlace K,
        IdeleGroup.infiniteComponent w a ∈
          infiniteTensorNormSubgroup
            (K := K) (L := L) w)
    (zFinite :
      ∀ w : HeightOneSpectrum (𝓞 K),
        (w.adicCompletion K ⊗[K] L)ˣ)
    (hFinite :
      ∀ w : HeightOneSpectrum (𝓞 K),
        _root_.localTensorNorm
            (K := K) (L := L) w (zFinite w) =
          IdeleGroup.finiteComponent w a)
    (hIntegral :
      ∀ᶠ w : HeightOneSpectrum (𝓞 K) in Filter.cofinite,
        RelativeBasisIntegralUnitAt
          (K := K) (L := L) w (zFinite w)) :
    a ∈ (RelativeIdeleGroup.norm K L).range := by
  have hInfinite' :
      ∀ w : InfinitePlace K,
        ∃ z : (w.Completion ⊗[K] L)ˣ,
          infiniteTensorDetNorm (K := K) (L := L) w z =
            IdeleGroup.infiniteComponent w a := by
    intro w
    simpa [infiniteTensorNormSubgroup] using hInfinite w
  choose zInfinite hNorm using hInfinite'
  obtain ⟨z, hz⟩ :=
    exists_relativeIdele_norm_eq_of_localTensorPreimages
      (K := K) (L := L) a zInfinite zFinite hNorm hFinite hIntegral
  exact ⟨z, hz⟩
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.Idele.SinglePlace -/
section
open scoped NumberField Classical TensorProduct
open NumberField IsDedekindDomain
noncomputable section
namespace IdeleGroup
variable {K : Type*} [Field K] [NumberField K]
 

private def infinitePlaceValue
    (v : InfinitePlace K)
    (x : v.Completionˣ) :
    (w : InfinitePlace K) → w.Completionˣ :=
  Pi.mulSingle
    (M := fun u : InfinitePlace K ↦ u.Completionˣ)
    v x
omit [NumberField K] in
@[simp]
private theorem infinitePlaceValue_same
    (v : InfinitePlace K)
    (x : v.Completionˣ) :
    infinitePlaceValue v x v = x := by
  exact Pi.mulSingle_eq_same
    (M := fun u : InfinitePlace K ↦ u.Completionˣ) v x
omit [NumberField K] in
@[simp]
private theorem infinitePlaceValue_of_ne
    (v w : InfinitePlace K)
    (x : v.Completionˣ)
    (h : w ≠ v) :
    infinitePlaceValue v x w = 1 := by
  exact Pi.mulSingle_eq_of_ne
    (M := fun u : InfinitePlace K ↦ u.Completionˣ) h x
 

def infinitePlaceIdele
    (v : InfinitePlace K) :
    v.Completionˣ →* IdeleGroup K where
  toFun x :=
    (ContinuousMulEquiv.piUnits.symm
      (infinitePlaceValue v x), 1)
  map_one' := by
    have hvalue : infinitePlaceValue v 1 = 1 := by
      funext w
      by_cases hw : w = v
      · subst w
        exact infinitePlaceValue_same v 1
      · exact infinitePlaceValue_of_ne v w 1 hw
    apply Prod.ext
    · change
        ContinuousMulEquiv.piUnits.symm
            (infinitePlaceValue v 1) = 1
      rw [hvalue, map_one]
    · simp
  map_mul' x y := by
    have hvalue :
        infinitePlaceValue v (x * y) =
          infinitePlaceValue v x * infinitePlaceValue v y := by
      funext w
      by_cases hw : w = v
      · subst w
        simp
      · simp [infinitePlaceValue_of_ne v w x hw,
          infinitePlaceValue_of_ne v w y hw,
          infinitePlaceValue_of_ne v w (x * y) hw]
    apply Prod.ext
    · change
        ContinuousMulEquiv.piUnits.symm
            (infinitePlaceValue v (x * y)) =
          ContinuousMulEquiv.piUnits.symm
              (infinitePlaceValue v x) *
            ContinuousMulEquiv.piUnits.symm
              (infinitePlaceValue v y)
      rw [hvalue, map_mul]
    · simp
 
private def finitePlaceValue
    (v : HeightOneSpectrum (𝓞 K))
    (x : (v.adicCompletion K)ˣ)
    (w : HeightOneSpectrum (𝓞 K)) :
    (w.adicCompletion K)ˣ :=
  if h : w = v then h.symm ▸ x else 1
@[simp]
private theorem finitePlaceValue_same
    (v : HeightOneSpectrum (𝓞 K))
    (x : (v.adicCompletion K)ˣ) :
    finitePlaceValue v x v = x := by
  simp [finitePlaceValue]
@[simp]
private theorem finitePlaceValue_of_ne
    (v w : HeightOneSpectrum (𝓞 K))
    (x : (v.adicCompletion K)ˣ)
    (h : w ≠ v) :
    finitePlaceValue v x w = 1 := by
  simp [finitePlaceValue, h]
 

def finitePlaceIdele
    (v : HeightOneSpectrum (𝓞 K)) :
    (v.adicCompletion K)ˣ →* IdeleGroup K where
  toFun x :=
    (1,
      ⟨finitePlaceValue v x, by
        have hAway :
            ∀ᶠ w : HeightOneSpectrum (𝓞 K) in Filter.cofinite,
              w ≠ v := by
          rw [Filter.eventually_cofinite]
          simp
        filter_upwards [hAway] with w hw
        rw [finitePlaceValue_of_ne v w x hw]
        exact Subgroup.one_mem _⟩)
  map_one' := by
    apply Prod.ext
    · rfl
    · apply RestrictedProduct.ext
      intro w
      change finitePlaceValue v 1 w = (1 : (w.adicCompletion K)ˣ)
      by_cases hw : w = v
      · subst w
        simp
      · simp [finitePlaceValue_of_ne v w 1 hw]
  map_mul' x y := by
    apply Prod.ext
    · simp
    · apply RestrictedProduct.ext
      intro w
      change finitePlaceValue v (x * y) w =
        finitePlaceValue v x w * finitePlaceValue v y w
      by_cases hw : w = v
      · subst w
        simp
      · simp [finitePlaceValue_of_ne v w x hw,
          finitePlaceValue_of_ne v w y hw,
          finitePlaceValue_of_ne v w (x * y) hw]
 

@[simp]
theorem finitePlaceIdele_finiteComponent_same
    (v : HeightOneSpectrum (𝓞 K))
    (x : (v.adicCompletion K)ˣ) :
    IdeleGroup.finiteComponent v
        (finitePlaceIdele v x) = x :=
  finitePlaceValue_same v x
 
@[simp]
theorem finitePlaceIdele_finiteComponent_of_ne
    (v w : HeightOneSpectrum (𝓞 K))
    (x : (v.adicCompletion K)ˣ)
    (h : w ≠ v) :
    IdeleGroup.finiteComponent w
        (finitePlaceIdele v x) = 1 :=
  finitePlaceValue_of_ne v w x h
end IdeleGroup
namespace RelativeIdeleGroup
section Relative
variable
    {K : Type*} [Field K] [NumberField K]
    {L : Type*} [Field L] [NumberField L] [Algebra K L]
    [FiniteDimensional K L]
end Relative
end RelativeIdeleGroup
end
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
theorem mem_integers_iff (x:v.adicCompletion K) : x∈((ValuativeRel.valuation (v.adicCompletion K)).integer) ↔ x∈v.adicCompletionIntegers K := by
  change ValuativeRel.valuation _ x≤1 ↔ Valued.v x≤1
  exact (Valuation.vle_one_iff (ValuativeRel.valuation _) (x:=x)).symm.trans (Valuation.vle_one_iff Valued.v)
def integers : ((ValuativeRel.valuation (v.adicCompletion K)).integer)≃+*v.adicCompletionIntegers K :=
  RingEquiv.restrict (RingEquiv.refl _) ((ValuativeRel.valuation (v.adicCompletion K)).integer) (v.adicCompletionIntegers K).toSubring
    (fun x => mem_integers_iff v x)
end
end TunnellAdicLocalField
end

/- TunnellPrincipalGluing -/
section
namespace TunnellPrincipalGluing
open NumberField IsDedekindDomain IdeleGroup
open scoped NumberField TensorProduct Classical IsMulCommutative
noncomputable section
variable {D N:Type} [Field D] [NumberField D] [Field N] [Algebra D N] [FiniteDimensional D N]
abbrev U (u:(𝓞 D)ˣ):Dˣ:=Units.map (algebraMap (𝓞 D) D).toMonoidHom u
abbrev a (u:(𝓞 D)ˣ):IdeleGroup D:=principalIdele D (U u)
abbrev x (u:(𝓞 D)ˣ) (v:HeightOneSpectrum (𝓞 D)): (v.adicCompletion D)ˣ:=finiteComponent v (a u)
abbrev single (u:(𝓞 D)ˣ) (v:HeightOneSpectrum (𝓞 D)):=finitePlaceIdele v (x u v)
abbrev A (D:Type) [Field D] [NumberField D]:=AdeleRing (𝓞 D) D
abbrev rel (D N:Type) [Field D] [NumberField D] [Field N] [Algebra D N]:Subgroup (A D)ˣ:=
  (Units.map (algebraMap D (A D)).toMonoidHom).range ⊔ (Units.map (Algebra.norm (A D) : A D⊗[D]N →* A D)).range
theorem mem_of_norm (u:(𝓞 D)ˣ) (v:HeightOneSpectrum (𝓞 D))
    (h:a u/single u v∈(RelativeIdeleGroup.norm D N).range):
    equivAdeleRingUnits (single u v) ∈rel D N := by
  obtain ⟨t,ht⟩:=h
  apply Subgroup.mem_sup.mpr
  refine ⟨_,⟨U u,rfl⟩,_,⟨t⁻¹,rfl⟩,?_⟩
  apply equivAdeleRingUnits.symm.injective
  rw [map_mul,map_inv,map_inv,MulEquiv.symm_apply_apply]
  change a u * (RelativeIdeleGroup.norm D N t)⁻¹=single u v
  rw [ht,inv_div, mul_comm,div_mul_cancel]
theorem complex_norm (complex:∀ i:InfinitePlace D,i.IsComplex) (b:IdeleGroup D) (i:InfinitePlace D):
    infiniteComponent i b∈infiniteTensorNormSubgroup (L:=N) i := by
  apply infinitePositiveSubgroup_le_infiniteTensorNormSubgroup
  apply (RayClass.mem_infinitePositiveSubgroup_iff _ _).mpr
  intro hi
  exact (InfinitePlace.not_isReal_iff_isComplex.mpr (complex i) hi).elim
theorem assemble (u:(𝓞 D)ˣ) (v:HeightOneSpectrum (𝓞 D))
    (complex:∀ i:InfinitePlace D,i.IsComplex)
    (z:∀ s:HeightOneSpectrum (𝓞 D),(s.adicCompletion D⊗[D]N)ˣ)
    (hz:∀ s,s≠v → localTensorNorm (L:=N) s (z s)=x u s)
    (hint:∀ᶠ s in Filter.cofinite, RelativeBasisIntegralUnitAt (K:=D) (L:=N) s (z s)) :
    equivAdeleRingUnits (single u v) ∈ rel D N := by
  classical
  let y (s:HeightOneSpectrum (𝓞 D)) : (s.adicCompletion D⊗[D]N)ˣ:=if s=v then 1 else z s
  apply mem_of_norm
  apply idele_mem_relativeNorm_range_of_localNorms_with_integralPreimages _ (complex_norm complex _) y
  · intro s
    rw [map_div]
    by_cases e:s=v
    · subst s
      rw [show y v=1 by simp [y],map_one,show finiteComponent v (single u v)=x u v from finitePlaceIdele_finiteComponent_same _ _,x,div_self']
    · simp [y,e,single,finitePlaceIdele_finiteComponent_of_ne _ _ _ e,hz _ e,x]
  · filter_upwards [Filter.eventually_cofinite_ne v,hint] with s hs hi
    simpa [y,hs] using hi
theorem canonical (u:(𝓞 D)ˣ) (v:HeightOneSpectrum (𝓞 D))
    (h:equivAdeleRingUnits (single u v)∈rel D N) :
    ∃ z:(A D)ˣ,z.val.1=1 ∧ z.val.2 v=(u.val.val:v.adicCompletion D) ∧
    (∀ w:HeightOneSpectrum (𝓞 D),w≠v → z.val.2 w=1) ∧ z∈rel D N := by
  refine ⟨equivAdeleRingUnits (single u v),rfl,?_,?_,h⟩
  · exact congrArg Units.val (finitePlaceIdele_finiteComponent_same v (x u v))
  · intro w hw
    exact congrArg Units.val (finitePlaceIdele_finiteComponent_of_ne v w (x u v) hw)
end
end TunnellPrincipalGluing
end

/- TunnellIntegralTensorBasis -/
section
namespace TunnellIntegralTensorBasis
open NumberField IsDedekindDomain TensorProduct
open scoped TensorProduct NumberField Classical
noncomputable section
variable {D N:Type} [Field D] [NumberField D] [Field N] [NumberField N] [Algebra D N] [FiniteDimensional D N]
abbrev V (s:HeightOneSpectrum (𝓞 D)):=s.adicCompletion D
abbrev O (s:HeightOneSpectrum (𝓞 D)):=s.adicCompletionIntegers D
abbrev T (N:Type) [Field N] [Algebra D N] (s:HeightOneSpectrum (𝓞 D)):=V s⊗[D]N
scoped instance intsAlg (s:HeightOneSpectrum (𝓞 D)):Algebra (O s) (T N s):=Algebra.compHom _ (algebraMap (O s) (V s))
theorem trace_tmul (n:N) (s:HeightOneSpectrum (𝓞 D)) :
    Algebra.trace (V s) (T N s) ((1:V s)⊗ₜ[D]n)=algebraMap D (V s) (Algebra.trace D N n) := by
  change LinearMap.trace _ _ (Algebra.lmul _ _ _)=_
  rw [←Algebra.baseChange_lmul]
  exact LinearMap.trace_baseChange (Algebra.lmul D N n) (V s)
theorem coord {ι:Type*} [Fintype ι] [DecidableEq ι] (b:Module.Basis ι D N)
    (s:HeightOneSpectrum (𝓞 D)) (z:T N s) (i:ι):
    (Algebra.TensorProduct.basis (V s) b).repr z i =
      Algebra.trace (V s) (T N s) (z * ((1:V s)⊗ₜ[D]b.traceDual i)) := by
  let B:=Algebra.TensorProduct.basis (V s) b
  have h(j:ι):Algebra.trace (V s) (T N s) (B j * ((1:V s)⊗ₜ[D]b.traceDual i))=
      if j=i then 1 else 0 := by
    simp only [B,Algebra.TensorProduct.basis_apply,Algebra.TensorProduct.tmul_mul_tmul,one_mul,
      trace_tmul, b.trace_mul_traceDual, MonoidWithZeroHom.map_ite_one_zero]
  conv_rhs => arg 2; arg 1; rw [←B.sum_repr z]
  simp only [Finset.sum_mul,smul_mul_assoc,map_sum,map_smul,h,smul_eq_mul,mul_ite,mul_one,mul_zero,
    Finset.sum_ite_eq',Finset.mem_univ,if_true,B]
theorem eventually_integral (n:N) :
    ∀ᶠ s:HeightOneSpectrum (𝓞 D) in Filter.cofinite, IsIntegral (O s) ((1:V s)⊗ₜ[D]n) := by
  classical
  letI : Algebra.IsAlgebraic ℤ N:=(IsFractionRing.isAlgebraic_iff' ℤ (𝓞 N) N).mp inferInstance
  obtain ⟨d,hd,hm⟩:=Algebra.IsAlgebraic.exists_integral_multiples ℤ ({n}:Finset N)
  have hn:=hm n (Finset.mem_singleton_self n)
  have e:∀ᶠ s:HeightOneSpectrum (𝓞 D) in Filter.cofinite,algebraMap D (V s) (d:D)⁻¹∈O s :=
    (algebraMap D (FiniteAdeleRing (𝓞 D) D) (d:D)⁻¹).property
  filter_upwards [e] with s hs
  let c:O s:=⟨_,hs⟩
  let f:N→ₐ[D]T N s :=Algebra.TensorProduct.includeRight
  have hb:IsIntegral (O s) (f (d • n)):=IsIntegral.map_of_comp_eq (Int.castRingHom _) f.toRingHom (Subsingleton.elim _ _) hn
  have eq:algebraMap (O s) (T N s) c * f (d • n)=f n:=by
    change algebraMap (V s) (T N s) (algebraMap D (V s) (d:D)⁻¹)*f (d • n)=_
    have hd':(d:D)≠0:=Int.cast_ne_zero.mpr hd
    have hcast:(d:T N s)=algebraMap (V s) (T N s) (algebraMap D (V s) (d:D)) := by simp
    rw [map_zsmul,zsmul_eq_mul,hcast,←mul_assoc,←map_mul,←map_mul,inv_mul_cancel₀ hd',map_one,map_one,one_mul]
  change IsIntegral (O s) (f n)
  rw [←eq]
  exact (isIntegral_algebraMap (x:=c)).mul hb
theorem unit_integral (z:∀ s:HeightOneSpectrum (𝓞 D),(T N s)ˣ)
    (tr:∀ (s:HeightOneSpectrum (𝓞 D)) (t:T N s),IsIntegral (O s) t → IsIntegral (O s) (Algebra.trace (V s) (T N s) t))
    (hi:∀ᶠ s in Filter.cofinite,IsIntegral (O s) ((z s):T N s) ∧ IsIntegral (O s) (↑((z s)⁻¹):T N s)) :
    ∀ᶠ s in Filter.cofinite,RelativeBasisIntegralUnitAt (K:=D) (L:=N) s (z s) := by
  classical
  let b:=relativeExtensionBasis (K:=D) (L:=N)
  have ev:∀ᶠ s in Filter.cofinite,∀ i,IsIntegral (O s) ((1:V s)⊗ₜ[D]b.traceDual i):=
    Filter.eventually_all.mpr (fun i=>eventually_integral (D:=D) (b.traceDual i))
  filter_upwards [ev,hi] with s hs hu
  have H(t:T N s)(ht:IsIntegral (O s) t):RelativeBasisIntegralAt (K:=D) (L:=N) s t:=by
    let B:=Algebra.TensorProduct.basis (V s) b
    have co(i):IsIntegral (O s) (B.repr t i):= (coord b s t i) ▸ tr s _ (ht.mul (hs i))
    choose c hc using fun i=>IsIntegrallyClosed.isIntegral_iff.mp (co i)
    refine ⟨c,?_⟩
    conv_lhs => rw [←B.sum_repr t]
    apply Finset.sum_congr rfl
    intro i _
    change _=((c i:O s):V s)⊗ₜ[D]b i
    rw [←hc i]
    simp [B,Algebra.TensorProduct.basis_apply,TensorProduct.smul_tmul']
  exact ⟨H _ hu.1,H _ hu.2⟩
end
end TunnellIntegralTensorBasis
end

/- TunnellIntegralUnramifiedUnit -/
section
namespace TunnellIntegralUnramifiedUnit
open NumberField IsDedekindDomain LocalFieldTheory LocalClassFieldTheory LocalFieldTheory.IsNonarchimedeanLocalField
open scoped NumberField Classical ValuativeRel WithZero
noncomputable section
variable {D N:Type} [Field D] [NumberField D] [Field N] [NumberField N] [Algebra D N] [FiniteDimensional D N] [IsAbelianGalois D N]
theorem above (v:HeightOneSpectrum (𝓞 D)) :
    ∃ t:HeightOneSpectrum (𝓞 N),t.asIdeal.LiesOver v.asIdeal ∧
      ∃ f:v.adicCompletion D→+*t.adicCompletion N,Continuous f ∧
        ∀ c:D,f (c:v.adicCompletion D)=algebraMap N (t.adicCompletion N) (algebraMap D N c) := by
  obtain ⟨Q,hQ,h⟩:=Ideal.exists_maximal_ideal_liesOver_of_isIntegral (S:=𝓞 N) v.asIdeal
  letI:Q.LiesOver v.asIdeal:=h
  let t:HeightOneSpectrum (𝓞 N):=⟨Q,hQ.isPrime,Ideal.ne_bot_of_liesOver_of_ne_bot v.ne_bot Q⟩
  let w:{w:HeightOneSpectrum (𝓞 N)// finitePlaceBelow (K:=D) w=v}:=⟨t,HeightOneSpectrum.ext h.over.symm⟩
  exact ⟨t,h,finitePlaceAdicCompletionMap D N v w,finitePlaceAdicCompletionMap_continuous D N v w,
    finitePlaceAdicCompletionMap_coe D N v w⟩
theorem local_units (v:HeightOneSpectrum (𝓞 D)) (t:HeightOneSpectrum (𝓞 N)) (ht:t.asIdeal.LiesOver v.asIdeal)
    (hr:t.asIdeal.ramificationIdx (𝓞 D)=1) (f:v.adicCompletion D→+*t.adicCompletion N) (hf:Continuous f)
    (hc:∀ d:D,f (d:v.adicCompletion D)=(algebraMap D N d:t.adicCompletion N)) (u:(𝓞 D)ˣ) :
    let V:=v.adicCompletion D
    let W:=t.adicCompletion N
    let O:=v.adicCompletionIntegers D
    letI:Algebra V W:=f.toAlgebra
    letI:Algebra O W:=Algebra.compHom W (algebraMap O V)
    ∃ y:Wˣ,Algebra.norm V (y:W)=algebraMap D V u.val.val ∧ IsIntegral O (y:W) ∧ IsIntegral O (↑(y⁻¹):W) := by
  let K := v.adicCompletion D
  let L := t.adicCompletion N
  letI : Algebra K L := f.toAlgebra
  letI : ValuativeRel K := ValuativeRel.ofValuation (Valued.v : Valuation K ℤᵐ⁰)
  letI : ValuativeRel L := ValuativeRel.ofValuation (Valued.v : Valuation L ℤᵐ⁰)
  letI : t.asIdeal.LiesOver v.asIdeal := ht
  haveI hK : IsNonarchimedeanLocalField K := TunnellCompletionUnits.localStructure v
  haveI hL : IsNonarchimedeanLocalField L := TunnellCompletionUnits.localStructure t
  obtain ⟨hfd,hgal⟩ := TunnellDenseCompletions.fields v t f hf hc
  letI : FiniteDimensional K L := hfd
  letI : IsGalois K L := hgal
  letI he : Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L) :=
    TunnellDenseCompletions.extension v t hr f hf hc
  haveI : IsIntegralClosure ((ValuativeRel.valuation (L)).integer) ((ValuativeRel.valuation (K)).integer) L := localCompleteDVF_integerRing_isIntegralClosure K L
  haveI : Module.Finite ((ValuativeRel.valuation (K)).integer) ((ValuativeRel.valuation (L)).integer) := IsIntegralClosure.finite ((ValuativeRel.valuation (K)).integer) K L ((ValuativeRel.valuation (L)).integer)
  have hi := @TunnellUnramifiedCompletion.indices D N _ _ _ _ _ _ _ v t ht f hf hc hK hL he hr
  letI : IsUnramifiedValuedExtension K L := ⟨hi⟩
  obtain ⟨a,ha⟩ := TunnellCompletionUnits.unit D v u
  obtain ⟨y,hy⟩ := normIntegerUnits_surjective_unramified_of_isIntegralClosure K L a
  letI:Algebra (v.adicCompletionIntegers D) L:=Algebra.compHom L (algebraMap (v.adicCompletionIntegers D) K)
  have integ (b:(ValuativeRel.valuation L).integer):IsIntegral (v.adicCompletionIntegers D) (b:L):=by
    have h:IsIntegral (ValuativeRel.valuation K).integer (b:L):=(IsIntegralClosure.isIntegral (ValuativeRel.valuation K).integer L b).algebraMap
    exact IsIntegral.map_of_comp_eq (TunnellAdicLocalField.integers v).toRingHom (RingHom.id L) (by ext x; rfl) h
  exact ⟨IsNonarchimedeanLocalField.integerUnitsToFieldUnits L y,
    (congrArg (fun b : ((ValuativeRel.valuation (K)).integer)ˣ => (b.val : K)) hy).trans ha,
    integ y.val,integ (y⁻¹).val⟩
end
end TunnellIntegralUnramifiedUnit
end

/- TunnellTensorFactors -/
section
namespace TunnellTensorFactors
open Polynomial TensorProduct
open scoped Classical TensorProduct NumberField WithZero
variable {D N K : Type} [Field D] [Field N] [Algebra D N] [FiniteDimensional D N] [IsGalois D N]
  [Field K] [Algebra D K]
theorem splits_factor (p : D[X]) [p.IsSplittingField D N] {Y : Type} [Field Y] [Algebra K Y]
    (e : K ⊗[D] N →ₐ[K] Y) (he : Function.Surjective e) :
    (p.map (algebraMap D K)).IsSplittingField K Y := by
  letI : Algebra D Y := ((algebraMap K Y).comp (algebraMap D K)).toAlgebra
  letI : IsScalarTower D K Y := IsScalarTower.of_algebraMap_eq fun _ => rfl
  let j : N →ₐ[D] Y := (e.restrictScalars D).comp Algebra.TensorProduct.includeRight
  let q := p.map (algebraMap D K)
  have hroot : q.rootSet Y = p.rootSet Y := by
    simp only [q, Polynomial.rootSet, Polynomial.aroots, Polynomial.map_map, ← IsScalarTower.algebraMap_eq]
  let E := Algebra.adjoin K (q.rootSet Y : Set Y)
  have hsub : j.range ≤ E.restrictScalars D := by
    rw [← Polynomial.IsSplittingField.adjoin_rootSet_eq_range N p j, Algebra.adjoin_le_iff]
    intro x hx
    change x ∈ Algebra.adjoin K (q.rootSet Y : Set Y)
    apply Algebra.subset_adjoin
    rwa [hroot]
  constructor
  · rw [Polynomial.map_map, ← IsScalarTower.algebraMap_eq]
    exact Polynomial.Splits.of_algHom (Polynomial.IsSplittingField.splits N p) j
  · apply top_unique
    intro x hx
    clear hx
    obtain ⟨z,rfl⟩ := he x
    change e z ∈ E
    induction z using TensorProduct.induction_on with
    | zero => simpa using E.zero_mem
    | tmul a b =>
      rw [TensorProduct.tmul_eq_smul_one_tmul, map_smul]
      exact E.toSubmodule.smul_mem a (hsub ⟨b,rfl⟩)
    | add a b ha hb =>
      rw [map_add]
      exact E.add_mem ha hb
theorem product {W : Type} [Field W] [Algebra K W] (f : K ⊗[D] N →ₐ[K] W)
    (hf : Function.Surjective f) :
    ∃ I : Type, Finite I ∧ Nonempty I ∧ Nonempty ((K ⊗[D] N) ≃ₐ[K] (I → W)) := by
  classical
  let T := K ⊗[D] N
  letI : Algebra.FormallyEtale D N := Algebra.FormallyEtale.of_isSeparable D N
  obtain ⟨I, hI, F, hF, hA, e, _⟩ := (Algebra.FormallyEtale.iff_exists_algEquiv_prod K T).mp inferInstance
  letI : Finite I := hI
  letI (i:I) : Field (F i) := hF i
  letI (i:I) : Algebra K (F i) := hA i
  obtain ⟨p, _, hsp⟩ := IsGalois.is_separable_splitting_field D N
  haveI hW := splits_factor p f hf
  let q := p.map (algebraMap D K)
  have hblocks (i:I) : q.IsSplittingField K (F i) :=
    splits_factor p ((Pi.evalAlgHom K F i).comp e.toAlgHom) ((Function.surjective_eval i).comp e.surjective)
  let z (i:I) : F i ≃ₐ[K] W := (Polynomial.IsSplittingField.algEquiv (F i) q).trans
    (Polynomial.IsSplittingField.algEquiv W q).symm
  have hn : Nonempty I := by
    by_contra h
    letI : IsEmpty I := not_nonempty_iff.mp h
    exact zero_ne_one (α:=T) (e.injective (Subsingleton.elim _ _))
  exact ⟨I,hI,hn,⟨e.trans (AlgEquiv.piCongrRight z)⟩⟩
open IsDedekindDomain NumberField
theorem actual_eval {D N : Type} [Field D] [NumberField D] [Field N] [NumberField N]
    [Algebra D N] [FiniteDimensional D N]
    (v : HeightOneSpectrum (𝓞 D)) (t : HeightOneSpectrum (𝓞 N))
    (f : v.adicCompletion D →+* t.adicCompletion N) (hf : Continuous f)
    (hc : ∀ c : D, f (algebraMap D _ c) = algebraMap N _ (algebraMap D N c)) :
    letI : Algebra (v.adicCompletion D) (t.adicCompletion N) := f.toAlgebra
    ∃ e : v.adicCompletion D ⊗[D] N →ₐ[v.adicCompletion D] t.adicCompletion N, Function.Surjective e := by
  let K := v.adicCompletion D
  let W := t.adicCompletion N
  letI : NontriviallyNormedField K := Valued.toNontriviallyNormedField K ℤᵐ⁰
  letI : Algebra K W := f.toAlgebra
  letI : Algebra D W := ((algebraMap N W).comp (algebraMap D N)).toAlgebra
  letI : IsScalarTower D K W := IsScalarTower.of_algebraMap_eq fun x => (hc x).symm
  letI : ContinuousSMul K W := continuousSMul_of_algebraMap K W hf
  let j : N →ₐ[D] W := ⟨algebraMap N W,fun _ => rfl⟩
  let e : K ⊗[D] N →ₐ[K] W := Algebra.TensorProduct.lift (Algebra.ofId K W) j (fun _ _ => Commute.all ..)
  refine ⟨e,fun y => ?_⟩
  haveI : FiniteDimensional K e.range := Module.Finite.of_surjective e.rangeRestrict.toLinearMap e.rangeRestrict_surjective
  have h : IsClosed (e.range : Set W) := e.range.toSubmodule.closed_of_finiteDimensional
  apply (t.denseRange_algebraMap N).induction_on (p:=fun y => y ∈ e.range) y h
  intro x
  refine ⟨1 ⊗ₜ[D] x,?_⟩
  simp [e, j]
  rfl
end TunnellTensorFactors
end

/- TunnellTensorIntegers -/
section
namespace TunnellTensorIntegers
open Polynomial TunnellTensorFactors ValuationTheory.Completion
open scoped Classical TensorProduct
theorem integral_single {R W I : Type} [CommRing R] [CommRing W] [Algebra R W]
    [DecidableEq I] (i : I) (y : W) (hy : IsIntegral R y) :
    IsIntegral R (fun j : I => if j = i then y else 1) := by
  obtain ⟨p,hp,hpy⟩ := hy
  change aeval y p = 0 at hpy
  let u : I → W := fun j => if j = i then y else 1
  refine ⟨p * (X - C 1),hp.mul (monic_X_sub_C _),?_⟩
  funext j
  change Pi.evalAlgHom R (fun _ : I => W) j (aeval u (p * (X - C 1))) = 0
  rw [← aeval_algHom_apply]
  by_cases h : j = i
  · simp [u,h,hpy]
  · simp [u,h]
variable {D N K W : Type} [Field D] [Field N] [Algebra D N] [FiniteDimensional D N] [IsGalois D N]
  [Field K] [Algebra D K] [Field W] [Algebra K W] {O : ValuationSubring K} [Algebra O W] [hsW : IsScalarTower O K W]
scoped instance tensorIntegersAlg : Algebra O (K ⊗[D] N) := Algebra.compHom _ (algebraMap O K)
include hsW
omit hsW in
private theorem map_integral {A B : Type} [CommRing A] [CommRing B] [Algebra K A] [Algebra K B]
    [Algebra O A] [Algebra O B] (f : A →ₐ[K] B)
    (ha : ∀ c : O, algebraMap O A c = algebraMap K A c.val)
    (hb : ∀ c : O, algebraMap O B c = algebraMap K B c.val)
    (z : A) (hz : IsIntegral O z) : IsIntegral O (f z) := by
  apply IsIntegral.map_of_comp_eq (RingHom.id O) f.toRingHom _ hz
  ext c
  change algebraMap O B c = f (algebraMap O A c)
  rw [ha,hb,f.commutes]
theorem exists_tensor_integral_unit (f : K ⊗[D] N →ₐ[K] W) (hf : Function.Surjective f)
    (y : Wˣ) (hy : IsIntegral O (y : W)) (hyi : IsIntegral O (y⁻¹ : Wˣ).val) :
    ∃ z : (K ⊗[D] N)ˣ, Algebra.norm K z.val = Algebra.norm K y.val ∧
      IsIntegral O z.val ∧ IsIntegral O (z⁻¹ : (K ⊗[D] N)ˣ).val := by
  classical
  obtain ⟨I,hI,⟨o⟩,⟨e⟩⟩ := product f hf
  letI : Fintype I := Fintype.ofFinite I
  haveI : FiniteDimensional K W := Module.Finite.of_surjective f.toLinearMap hf
  let U : (I → W)ˣ :=
    { val := fun j => if j = o then y.val else 1
      inv := fun j => if j = o then (y⁻¹ : Wˣ).val else 1
      val_inv := by ext j; by_cases h : j = o <;> simp [h]
      inv_val := by ext j; by_cases h : j = o <;> simp [h] }
  let z := Units.mapEquiv e.symm.toMulEquiv U
  have h (c : O) : algebraMap O (I → W) c = algebraMap K (I → W) c.val :=
    funext fun _ => IsScalarTower.algebraMap_apply O K W c
  refine ⟨z,?_,map_integral e.symm.toAlgHom h (fun _ => rfl) _ (integral_single o (y : W) hy),
    map_integral e.symm.toAlgHom h (fun _ => rfl) _ (integral_single o ((y⁻¹ : Wˣ) : W) hyi)⟩
  change Algebra.norm K (e.symm (U.val)) = _
  rw [Algebra.norm_eq_of_algEquiv, algebra_norm_pi_apply (fun _ : I => W)]
  simp [U, apply_ite (Algebra.norm K)]
omit hsW in
theorem trace_integral_tensor (z : K ⊗[D] N) (hz : IsIntegral O z) :
    IsIntegral O (Algebra.trace K (K ⊗[D] N) z) := by
  classical
  let T := K ⊗[D] N
  letI : Algebra.FormallyEtale D N := Algebra.FormallyEtale.of_isSeparable D N
  obtain ⟨I, hI, F, hF, hA, e, _⟩ := (Algebra.FormallyEtale.iff_exists_algEquiv_prod K T).mp inferInstance
  letI : Fintype I := Fintype.ofFinite I
  letI (i:I) : Field (F i) := hF i
  letI (i:I) : Algebra K (F i) := hA i
  letI (i:I) : Algebra O (F i) := Algebra.compHom _ (algebraMap O K)
  letI (i:I) : IsScalarTower O K (F i) := .of_algebraMap_eq' rfl
  letI (i:I) : FiniteDimensional K (F i) := Module.Finite.of_surjective
    ((Pi.evalAlgHom K F i).comp e.toAlgHom).toLinearMap ((Function.surjective_eval i).comp e.surjective)
  rw [← Algebra.trace_eq_of_algEquiv e z, algebra_trace_pi_apply F]
  apply IsIntegral.sum
  intro i _
  apply Algebra.isIntegral_trace
  exact map_integral ((Pi.evalAlgHom K F i).comp e.toAlgHom) (fun _ => rfl) (fun _ => rfl) z hz
end TunnellTensorIntegers
end

namespace TunnellPrincipalProduct
open NumberField IsDedekindDomain LocalFieldTheory LocalClassFieldTheory LocalFieldTheory.IsNonarchimedeanLocalField
open scoped NumberField Classical ValuativeRel WithZero
noncomputable section
variable {D N:Type} [Field D] [NumberField D] [Field N] [NumberField N] [Algebra D N] [FiniteDimensional D N] [IsAbelianGalois D N]

theorem lift_field (v:HeightOneSpectrum (𝓞 D)) (t:HeightOneSpectrum (𝓞 N)) (ht:t.asIdeal.LiesOver v.asIdeal)
    (hr:t.asIdeal.ramificationIdx (𝓞 D)=1) (f:v.adicCompletion D→+*t.adicCompletion N) (hf:Continuous f)
    (hc:∀ d:D,f (d:v.adicCompletion D)=(algebraMap D N d:t.adicCompletion N)) (u:(v.adicCompletion D)ˣ)
    (hu : u.val ∈ v.adicCompletionIntegers D) (hui : (u⁻¹).val ∈ v.adicCompletionIntegers D) :
    let V:=v.adicCompletion D
    let W:=t.adicCompletion N
    let O:=v.adicCompletionIntegers D
    letI:Algebra V W:=f.toAlgebra
    letI:Algebra O W:=Algebra.compHom W (algebraMap O V)
    ∃ y:Wˣ,Algebra.norm V (y:W)=u.val ∧ IsIntegral O (y:W) ∧ IsIntegral O (↑(y⁻¹):W) := by
  let K := v.adicCompletion D
  let L := t.adicCompletion N
  letI : Algebra K L := f.toAlgebra
  letI : ValuativeRel K := ValuativeRel.ofValuation (Valued.v : Valuation K ℤᵐ⁰)
  letI : ValuativeRel L := ValuativeRel.ofValuation (Valued.v : Valuation L ℤᵐ⁰)
  letI : t.asIdeal.LiesOver v.asIdeal := ht
  haveI hK : IsNonarchimedeanLocalField K := TunnellCompletionUnits.localStructure v
  haveI hL : IsNonarchimedeanLocalField L := TunnellCompletionUnits.localStructure t
  obtain ⟨hfd,hgal⟩ := TunnellDenseCompletions.fields v t f hf hc
  letI : FiniteDimensional K L := hfd
  letI : IsGalois K L := hgal
  letI he : Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L) :=
    TunnellDenseCompletions.extension v t hr f hf hc
  haveI : IsIntegralClosure ((ValuativeRel.valuation (L)).integer) ((ValuativeRel.valuation (K)).integer) L := localCompleteDVF_integerRing_isIntegralClosure K L
  haveI : Module.Finite ((ValuativeRel.valuation (K)).integer) ((ValuativeRel.valuation (L)).integer) := IsIntegralClosure.finite ((ValuativeRel.valuation (K)).integer) K L ((ValuativeRel.valuation (L)).integer)
  have hi := @TunnellUnramifiedCompletion.indices D N _ _ _ _ _ _ _ v t ht f hf hc hK hL he hr
  letI : IsUnramifiedValuedExtension K L := ⟨hi⟩
  let a : ((ValuativeRel.valuation K).integer)ˣ := {
    val := ⟨u.val, (TunnellAdicLocalField.mem_integers_iff v _).mpr hu⟩
    inv := ⟨(u⁻¹).val, (TunnellAdicLocalField.mem_integers_iff v _).mpr hui⟩
    val_inv := Subtype.ext u.val_inv
    inv_val := Subtype.ext u.inv_val }
  have ha : (a.val : K) = u.val := rfl
  obtain ⟨y,hy⟩ := normIntegerUnits_surjective_unramified_of_isIntegralClosure K L a
  letI:Algebra (v.adicCompletionIntegers D) L:=Algebra.compHom L (algebraMap (v.adicCompletionIntegers D) K)
  have integ (b:(ValuativeRel.valuation L).integer):IsIntegral (v.adicCompletionIntegers D) (b:L):=by
    have h:IsIntegral (ValuativeRel.valuation K).integer (b:L):=(IsIntegralClosure.isIntegral (ValuativeRel.valuation K).integer L b).algebraMap
    exact IsIntegral.map_of_comp_eq (TunnellAdicLocalField.integers v).toRingHom (RingHom.id L) (by ext x; rfl) h
  exact ⟨IsNonarchimedeanLocalField.integerUnitsToFieldUnits L y,
    (congrArg (fun b : ((ValuativeRel.valuation (K)).integer)ˣ => (b.val : K)) hy).trans ha,
    integ y.val,integ (y⁻¹).val⟩
end
end TunnellPrincipalProduct
namespace TunnellKummerLocal
open NumberField IsDedekindDomain IdeleGroup TunnellIntegralTensorBasis
open scoped Classical NumberField TensorProduct TunnellIntegralTensorBasis
noncomputable section
variable {D N:Type} [Field D] [NumberField D] [Field N] [NumberField N]
    [Algebra D N] [FiniteDimensional D N] [IsAbelianGalois D N]

theorem unram (v:HeightOneSpectrum (𝓞 D)) (a:(V v)ˣ)
    (h:∀ t:HeightOneSpectrum (𝓞 N),t.asIdeal.LiesOver v.asIdeal → Algebra.IsUnramifiedAt (𝓞 D) t.asIdeal)
    (hu:a.val∈O v ∧ (a⁻¹).val∈O v) :
    ∃ z:(T N v)ˣ,localTensorNorm (L:=N) v z=a ∧ IsIntegral (O v) z.val ∧ IsIntegral (O v) (z⁻¹).val := by
  obtain ⟨t,ht,f,hf,hc⟩:=TunnellIntegralUnramifiedUnit.above (N:=N) v
  let W:=t.adicCompletion N
  letI : Algebra (V v) W:=f.toAlgebra
  letI : Algebra (O v) W:=Algebra.compHom W (algebraMap (O v) (V v))
  letI : IsScalarTower (O v) (V v) W:=.of_algebraMap_eq' rfl
  haveI :=h t ht
  obtain ⟨y,hy,h₁,h₂⟩:=TunnellPrincipalProduct.lift_field v t ht (Ideal.ramificationIdx_eq_one t.asIdeal (𝓞 D)) f hf hc a hu.1 hu.2
  obtain ⟨e,he⟩:=TunnellTensorFactors.actual_eval v t f hf hc
  obtain ⟨z,hz,h₁,h₂⟩:=TunnellTensorIntegers.exists_tensor_integral_unit e he y h₁ h₂
  exact ⟨z,Units.ext (hz.trans hy),h₁,h₂⟩

end
end TunnellKummerLocal

/- A principal S-unit corrects the finite components. Outside the finite ramification support, integral local norm preimages assemble into an idele. -/
section
noncomputable section
namespace AlgebraicNumberTheory.Ramification
local instance auxFracAlgebra (R K : Type*) [CommRing R] [Field K] [Algebra R K] [FaithfulSMul R K] :
    Algebra (FractionRing R) K := FractionRing.liftAlgebra R K
local instance auxFracTower (R K : Type*) [CommRing R] [Field K] [Algebra R K] [FaithfulSMul R K] :
    IsScalarTower R (FractionRing R) K := FractionRing.isScalarTower_liftAlgebra R K
variable (A B : Type*)
variable [CommRing A] [CommRing B] [Algebra A B]
variable [IsDedekindDomain A] [IsDedekindDomain B]
variable [Module.IsTorsionFree A B] [Module.Finite A B]
variable [Algebra.IsSeparable (FractionRing A) (FractionRing B)]
variable {A B}
 

def heightOnePrimeBelow (w : IsDedekindDomain.HeightOneSpectrum B) :
    IsDedekindDomain.HeightOneSpectrum A where
  asIdeal := w.asIdeal.under A
  isPrime := inferInstance
  ne_bot := by
    have : Algebra.IsIntegral A B := Algebra.IsIntegral.of_finite A B
    exact mt Ideal.eq_bot_of_comap_eq_bot w.ne_bot
variable (A B)
 

theorem finite_ramified_heightOne_primes :
    {v : IsDedekindDomain.HeightOneSpectrum B |
        ¬ Algebra.IsUnramifiedAt A v.asIdeal}.Finite := by
  exact
    (Ideal.finite_factors (R := B) (I := differentIdeal A B)
        (differentIdeal_ne_bot (A := A) (B := B))).subset (by
      intro v hv
      exact (dvd_differentIdeal_iff (A := A) (B := B) (P := v.asIdeal)).mpr hv)
 

theorem finite_ramified_base_heightOne_primes :
    {v : IsDedekindDomain.HeightOneSpectrum A |
        ∃ w : IsDedekindDomain.HeightOneSpectrum B,
          w.asIdeal.LiesOver v.asIdeal ∧ ¬ Algebra.IsUnramifiedAt A w.asIdeal}.Finite := by
  let f : IsDedekindDomain.HeightOneSpectrum B →
      IsDedekindDomain.HeightOneSpectrum A :=
    heightOnePrimeBelow (A := A) (B := B)
  refine (finite_ramified_heightOne_primes A B).image f |>.subset ?_
  intro v hv
  rcases hv with ⟨w, hlie, hram⟩
  refine ⟨w, hram, ?_⟩
  apply IsDedekindDomain.HeightOneSpectrum.ext
  dsimp [f, heightOnePrimeBelow]
  let : w.asIdeal.LiesOver v.asIdeal := hlie
  exact (Ideal.over_def w.asIdeal v.asIdeal).symm
end AlgebraicNumberTheory.Ramification
end
end


/- ClassFieldTheory.AlgebraicNumberTheory.Idele.Basic -/
section
open scoped NumberField RestrictedProduct
open NumberField IsDedekindDomain
noncomputable section
variable (K : Type*) [Field K] [NumberField K]
namespace FiniteIdeleGroup
variable {K}
 

theorem eventually_mem_localUnits (a : FiniteIdeleGroup K) :
    ∀ᶠ v in Filter.cofinite,
      a v ∈ (v.adicCompletionIntegers K).units :=
  a.2
end FiniteIdeleGroup
namespace InfiniteIdeleGroup
variable {K}
end InfiniteIdeleGroup
namespace IdeleGroup
variable {K}
@[simp]
theorem finiteComponent_apply (a : IdeleGroup K)
    (v : HeightOneSpectrum (𝓞 K)) :
    finiteComponent v a = a.2 v :=
  rfl
end IdeleGroup
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.Idele.PrincipalCore -/
section
open scoped NumberField
open NumberField IsDedekindDomain
noncomputable section
variable (K : Type*) [Field K] [NumberField K]
namespace IdeleGroup
variable {K}
 

@[simp]
theorem finiteComponent_principalIdele
    (x : Kˣ) (v : HeightOneSpectrum (𝓞 K)) :
    ((finiteComponent v (principalIdele K x) :
      (v.adicCompletion K)ˣ) : v.adicCompletion K) = (x : K) :=
  rfl
variable (K)
end IdeleGroup
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.Idele.SPlaces -/
section
open scoped NumberField RestrictedProduct
open NumberField IsDedekindDomain
noncomputable section
variable {K : Type*} [Field K] [NumberField K]
namespace FiniteIdeleGroup
 
def supportedAt (S : Set (HeightOneSpectrum (𝓞 K))) :
    Subgroup (FiniteIdeleGroup K) where
  carrier := {a | ∀ v, v ∉ S →
    a v ∈ (v.adicCompletionIntegers K).units}
  one_mem' _ _ := Submonoid.one_mem _
  mul_mem' ha hb v hv := Submonoid.mul_mem _
    (ha v hv) (hb v hv)
  inv_mem' ha v hv := Subgroup.inv_mem _
    (ha v hv)
end FiniteIdeleGroup
namespace IdeleGroup
 

def supportedAt (S : Set (HeightOneSpectrum (𝓞 K))) :
    Subgroup (IdeleGroup K) :=
  Subgroup.comap (MonoidHom.snd _ _)
    (FiniteIdeleGroup.supportedAt S)
@[simp]
theorem mem_supportedAt_iff
    (S : Set (HeightOneSpectrum (𝓞 K)))
    (a : IdeleGroup K) :
    a ∈ supportedAt (K := K) S ↔
      ∀ v, v ∉ S →
        a.2 v ∈ (v.adicCompletionIntegers K).units :=
  Iff.rfl
end IdeleGroup
 

abbrev SUnitGroup
    (S : Finset (HeightOneSpectrum (𝓞 K))) :=
  (S : Set (HeightOneSpectrum (𝓞 K))).unit K
@[simp]
theorem mem_SUnitGroup_iff
    (S : Finset (HeightOneSpectrum (𝓞 K))) (x : Kˣ) :
    x ∈ SUnitGroup (K := K) S ↔
      ∀ v : HeightOneSpectrum (𝓞 K), v ∉ S →
        v.valuation K x = 1 :=
  Iff.rfl
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.Idele.Cohomology.SupportedBridge -/
section
open scoped Classical NumberField TensorProduct
open NumberField IsDedekindDomain
noncomputable section
variable
    {K L : Type}
    [Field K] [NumberField K]
    [Field L] [NumberField L] [Algebra K L]
    [FiniteDimensional K L] [IsGalois K L]
 

theorem principalIdele_mem_supportedAt_iff_sUnit
    (T : Finset (HeightOneSpectrum (𝓞 L)))
    (x : Lˣ) :
    IdeleGroup.principalIdele L x ∈
        IdeleGroup.supportedAt (K := L) (T : Set _) ↔
      x ∈ SUnitGroup (K := L) T := by
  rw [IdeleGroup.mem_supportedAt_iff, mem_SUnitGroup_iff]
  constructor
  · intro hx W hW
    have hunit := hx W (by simpa using hW)
    rw [
      HeightOneSpectrum.adicCompletionIntegers.mem_units_iff_valued_eq_one]
        at hunit
    change
      Valued.v
          (((IdeleGroup.finiteComponent W
            (IdeleGroup.principalIdele L x) :
              (W.adicCompletion L)ˣ) :
            W.adicCompletion L)) = 1 at hunit
    rw [IdeleGroup.finiteComponent_principalIdele,
      HeightOneSpectrum.valuedAdicCompletion_eq_valuation'] at hunit
    exact hunit
  · intro hx W hW
    rw [
      HeightOneSpectrum.adicCompletionIntegers.mem_units_iff_valued_eq_one]
    change
      Valued.v
          (((IdeleGroup.finiteComponent W
            (IdeleGroup.principalIdele L x) :
              (W.adicCompletion L)ˣ) :
            W.adicCompletion L)) = 1
    rw [IdeleGroup.finiteComponent_principalIdele,
      HeightOneSpectrum.valuedAdicCompletion_eq_valuation']
    exact hx W (by simpa using hW)
end
end
namespace TunnellKummerSupportGroups
open NumberField IsDedekindDomain IdeleGroup
open scoped NumberField Classical
noncomputable section
variable (K:Type) [Field K] [NumberField K]
abbrev V:=HeightOneSpectrum (𝓞 K)
abbrev A:=AdeleRing (𝓞 K) K
def J(F:Finset (V K)):Subgroup (A K)ˣ:=Subgroup.closure {a:(A K)ˣ | ∀ v:V K,v∉F → a.val.2 v∈v.adicCompletionIntegers K ∧ (a⁻¹).val.2 v∈v.adicCompletionIntegers K}
abbrev e:=equivAdeleRingUnits (K:=K)
theorem units_mem {W:Type} [Field W] (O:ValuationSubring W) (x:Wˣ):
     x∈O.units ↔ x.val∈O ∧ (x⁻¹).val∈O:=by
   exact Submonoid.mem_units_iff _ _
theorem powers_mem {W:Type} [Field W] (n:ℕ+) (x:Wˣ):
     x∈(powMonoidHom (n:ℕ):Wˣ→*Wˣ).range ↔ ∃ y:W,y^(n:ℕ)=x.val:=by
   constructor
   · rintro ⟨u,rfl⟩;exact ⟨u.val,rfl⟩
   · rintro ⟨y,hy⟩
     have h:y≠0:=by rintro rfl;rw [zero_pow n.ne_zero] at hy;exact x.ne_zero hy.symm
     exact ⟨Units.mk0 y h,Units.ext hy⟩
theorem closure_of_carrier {G:Type} [CommGroup G] (H:Subgroup G) (s:Set G)
    (h:∀ a, a∈s ↔ a∈H) : Subgroup.closure s=H := by
  have eq:s=(H:Set G):=Set.ext h
  rw [eq,Subgroup.closure_eq]
theorem supported (F:Finset (V K)): J K F=(supportedAt (K:=K) (F:Set (V K))).comap (e K).symm.toMonoidHom := by
  apply closure_of_carrier
  intro a
  change _ ↔ (e K).symm a∈supportedAt (F:Set _)
  rw [mem_supportedAt_iff,Set.mem_setOf_eq]
  apply forall_congr'
  intro v
  apply imp_congr_right
  intro _
  exact (units_mem (v.adicCompletionIntegers K) (finiteComponent v ((e K).symm a))).symm
end
end TunnellKummerSupportGroups
namespace TunnellDetectGlue
open NumberField IsDedekindDomain IdeleGroup TunnellIntegralTensorBasis
open scoped NumberField TensorProduct Classical TunnellIntegralTensorBasis
noncomputable section

theorem glued {D N:Type} [Field D] [NumberField D] [Field N] [NumberField N]
    [Algebra D N] [FiniteDimensional D N] [IsAbelianGalois D N]
    (a:IdeleGroup D)
    (arch:∀w:InfinitePlace D,infiniteComponent w a∈infiniteTensorNormSubgroup (L:=N) w)
    (finit:∀v:HeightOneSpectrum (𝓞 D),finiteComponent v a∈(localTensorNorm (L:=N) v).range) :
    a∈(RelativeIdeleGroup.norm D N).range := by
  let good(v:HeightOneSpectrum (𝓞 D)) := (finiteComponent v a∈(v.adicCompletionIntegers D).units) ∧
    ∀w:HeightOneSpectrum (𝓞 N),w.asIdeal.LiesOver v.asIdeal → Algebra.IsUnramifiedAt (𝓞 D) w.asIdeal
  have units:∀ᶠ v in Filter.cofinite, finiteComponent v a∈(v.adicCompletionIntegers D).units := by
    simpa [IdeleGroup.finiteComponent_apply] using FiniteIdeleGroup.eventually_mem_localUnits a.2
  have ev:∀ᶠ v in Filter.cofinite,good v := by
    filter_upwards [units,(AlgebraicNumberTheory.Ramification.finite_ramified_base_heightOne_primes (𝓞 D) (𝓞 N)).compl_mem_cofinite] with v hv hr
    exact ⟨hv,fun t ht=>by by_contra hn;exact hr ⟨t,ht,hn⟩⟩
  have choices (v:HeightOneSpectrum (𝓞 D)) :
      ∃ z:(T N v)ˣ,localTensorNorm (L:=N) v z=finiteComponent v a ∧
        (good v → IsIntegral (O v) z.val ∧ IsIntegral (O v) z.inv) := by
    by_cases h:good v
    · obtain ⟨z,hz,integral⟩:=TunnellKummerLocal.unram (N:=N) v _ h.2 h.1
      exact ⟨z,hz,fun _=>integral⟩
    · obtain ⟨z,hz⟩:=finit v
      exact ⟨z,hz,fun hyp=>(h hyp).elim⟩
  choose z hz hi using choices
  exact idele_mem_relativeNorm_range_of_localNorms_with_integralPreimages a arch z hz
    (unit_integral z (fun _ x hx=>TunnellTensorIntegers.trace_integral_tensor x hx)
      (ev.mono fun v hv=>hi v hv))

end
end TunnellDetectGlue
namespace TunnellDetectNorms
open NumberField IsDedekindDomain IdeleGroup TunnellKummerSupportGroups
open scoped NumberField Classical TensorProduct
noncomputable section
set_option maxHeartbeats 1800000 in
theorem result : OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H3_R1_H1_R1_H3_R1_H2_R1_H2_R1.H2 := by
  intro K M _ _ _ _ _ _ _ p hp
  dsimp only
  intro S T hST hclass app loc
  obtain ⟨hInfiniteTop,hSplitS,powers,hAway⟩:=loc
  let n:ℕ+:=⟨p,hp⟩
  letI : NumberField M:=NumberField.of_module_finite K M
  let j:=Units.map (algebraMap K (A K)).toMonoidHom
  letI : IsAbelianGalois K M:=IsAbelianGalois.of_isCyclic K M
  apply top_unique
  intro a _
  have ha:a∈j.range⊔J K S:=by rw [show j.range⊔J K S=⊤ from hclass];exact Subgroup.mem_top a
  obtain ⟨_,⟨b,rfl⟩,v,hv,eq⟩:=Subgroup.mem_sup.mp ha
  let u:IdeleGroup K:=(e K).symm v
  have hu:u∈supportedAt (K:=K) (S:Set (V K)):=by
    rw [supported K S] at hv
    exact hv
  have hT_not_mem_S (w : T) : w.1 ∉ S := by
    intro hwS
    exact (Finset.disjoint_left.mp hST) hwS w.2
  let uLocalUnit (w : T) :
      (w.1.adicCompletionIntegers K)ˣ :=
    (w.1.adicCompletionIntegers K).toSubmonoid.unitsEquivUnitsType
      ⟨IdeleGroup.finiteComponent w.1 u,
        (IdeleGroup.mem_supportedAt_iff
          (K := K)
          (S : Set (HeightOneSpectrum (𝓞 K))) u).mp
            hu w.1 (by simpa using hT_not_mem_S w)⟩
  obtain ⟨s, hs⟩ := app uLocalUnit
  have hsSupported :
      IdeleGroup.principalIdele K (s : Kˣ) ∈
        IdeleGroup.supportedAt
          (K := K)
          (S : Set (HeightOneSpectrum (𝓞 K))) :=
    (_root_.principalIdele_mem_supportedAt_iff_sUnit
      (L := K) S (s : Kˣ)).2 s.2
  let d : IdeleGroup K :=
    u * (IdeleGroup.principalIdele K (s : Kˣ))⁻¹
  have hdSupported :
      d ∈
        IdeleGroup.supportedAt
          (K := K)
          (S : Set (HeightOneSpectrum (𝓞 K))) := by
    dsimp only [d]
    exact
      (IdeleGroup.supportedAt
        (K := K)
        (S : Set (HeightOneSpectrum (𝓞 K)))).mul_mem
          hu
          ((IdeleGroup.supportedAt
            (K := K)
            (S : Set (HeightOneSpectrum (𝓞 K)))).inv_mem
              hsSupported)
  have hTpower (w : T) :
      IdeleGroup.finiteComponent w.1 d ∈
        (powMonoidHom (n : ℕ) :
          (w.1.adicCompletion K)ˣ →*
            (w.1.adicCompletion K)ˣ).range := by
    obtain ⟨y,hy⟩:=hs w
    refine ⟨Units.map (w.val.adicCompletionIntegers K).subtype.toMonoidHom y,Units.ext ?_⟩
    have hu:(uLocalUnit w).val.val=(IdeleGroup.finiteComponent w.val u).val:=rfl
    rw [hu] at hy
    rw [show d=u*(principalIdele K s.val)⁻¹ from rfl,map_mul,map_inv,Units.val_mul,Units.val_inv_eq_inv_val]
    change y.val.val^p=(IdeleGroup.finiteComponent w.val u).val*(algebraMap K (w.val.adicCompletion K) s.val.val)⁻¹
    exact (eq_div_iff ((map_ne_zero (algebraMap K (w.val.adicCompletion K))).mpr s.val.ne_zero)).mpr hy
  have hInfinite :
      ∀ w : InfinitePlace K,
        IdeleGroup.infiniteComponent w d ∈
          _root_.infiniteTensorNormSubgroup
            (K := K) (L := M) w := by
    intro w
    rw [show infiniteTensorNormSubgroup (K:=K) (L:=M) w=⊤ from hInfiniteTop w]
    exact Subgroup.mem_top _
  have hFinite :
      ∀ w : HeightOneSpectrum (𝓞 K),
        IdeleGroup.finiteComponent w d ∈
          (localTensorNorm
            (K := K) (L := M) w).range := by
    intro w
    by_cases hs:w∈S
    · rw [show (localTensorNorm (K:=K) (L:=M) w).range=⊤ from hSplitS w hs]
      exact Subgroup.mem_top _
    · by_cases ht:w∈T
      · exact powers w ht (hTpower ⟨w,ht⟩)
      · have hw:w∉S∪T:=fun h=>(Finset.mem_union.mp h).elim hs ht
        apply hAway w hw
        have hu:=(IdeleGroup.mem_supportedAt_iff (K:=K) (S:Set (V K)) d).mp hdSupported w (by simpa using hs)
        exact ⟨(w.adicCompletionIntegers K).toSubmonoid.unitsEquivUnitsType ⟨_,hu⟩,rfl⟩
  have hdNorm :
      d ∈ (RelativeIdeleGroup.norm K M).range :=
    TunnellDetectGlue.glued (N:=M) d hInfinite hFinite
  obtain ⟨z,hz⟩:=hdNorm
  have normMem:(e K) d∈(Units.map (Algebra.norm (A K) (S:=A K⊗[K]M))).range:=
    ⟨z,congrArg (e K) hz⟩
  have value:(e K) d=v*(j s.val)⁻¹:=by
    rw [show d=u*(principalIdele K s.val)⁻¹ from rfl,map_mul,map_inv,MulEquiv.apply_symm_apply]
    rfl
  apply Subgroup.mem_sup.mpr
  refine ⟨j (b*s.val),⟨_,rfl⟩,(e K) d,normMem,?_⟩
  rw [map_mul,value,←eq]
  simp only [mul_assoc,mul_left_comm,mul_comm,mul_inv_cancel_right,mul_inv_cancel,mul_one,one_mul]
end
end TunnellDetectNorms

theorem OMA.solution : OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H3_R1_H1_R1_H3_R1_H2_R1_H2_R1.H2 := TunnellDetectNorms.result
