import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H2_R1_H1_R1_H1_R1
import Mathlib
namespace TunnellAdicLocalField
end TunnellAdicLocalField
namespace TunnellAdicLocalization
end TunnellAdicLocalization
namespace TunnellKummer
end TunnellKummer
/-
The selected completion and ramification results are adapted from ClassFieldTheory, revision 2e6280f9d2579705a0cc6c76ec68c2b60f9c601a at https://github.com/n-yamaguchi-0729/ClassFieldTheory, under the Apache License below.
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
      boilerplate notice, with the fields enclosed by brackets "[]"
      replaced with your own identifying information. (Don't include
      the brackets!)  The text should be enclosed in the appropriate
      comment syntax for the file format. We also recommend that a
      file or class name and description of purpose be included on the
      same "printed page" as the copyright notice for easier
      identification within third-party archives.

   Copyright [yyyy] [name of copyright owner]

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

/- ClassFieldTheory.AlgebraicNumberTheory.SUnit.GaloisAction -/
section
open scoped BigOperators Classical NumberField nonZeroDivisors
open IsDedekindDomain Module
noncomputable section
 
variable (K L:Type*) [Field K] [NumberField K] [Field L] [NumberField L] [Algebra K L]
noncomputable def finitePlaceEquiv
    (σ : L ≃ₐ[K] L) :
    HeightOneSpectrum (𝓞 L) ≃
      HeightOneSpectrum (𝓞 L) :=
  HeightOneSpectrum.equivOfRingEquiv
    (NumberField.RingOfIntegers.mapAlgEquiv σ).toRingEquiv

noncomputable def idealMapMulEquiv
    {R : Type*} [CommRing R]
    (e : R ≃+* R) : Ideal R ≃* Ideal R where
  toFun I := I.map e
  invFun I := I.map e.symm
  left_inv _ := Ideal.map_of_equiv e
  right_inv _ := Ideal.map_of_equiv e.symm
  map_mul' I J := Ideal.map_mul e I J
omit [NumberField K] [NumberField L] in
@[simp]
theorem finitePlaceEquiv_asIdeal
    (σ : L ≃ₐ[K] L)
    (v : HeightOneSpectrum (𝓞 L)) :
    (finitePlaceEquiv K L σ v).asIdeal =
      v.asIdeal.map
        (NumberField.RingOfIntegers.mapAlgEquiv σ).toRingEquiv := by
  ext x
  exact Ideal.symm_apply_mem_of_equiv_iff
omit [NumberField K] in

theorem intValuation_finitePlaceEquiv
    (σ : L ≃ₐ[K] L)
    (v : HeightOneSpectrum (𝓞 L))
    (r : 𝓞 L) :
    (finitePlaceEquiv K L σ v).intValuation
        (NumberField.RingOfIntegers.mapAlgEquiv σ r) =
      v.intValuation r := by
  let e := (NumberField.RingOfIntegers.mapAlgEquiv σ).toRingEquiv
  by_cases hr : r = 0
  · subst r
    simp
  change
    (finitePlaceEquiv K L σ v).intValuation (e r) =
      v.intValuation r
  have her : e r ≠ 0 := by
    simpa using e.injective.ne hr
  rw [HeightOneSpectrum.intValuation_eq_exp_neg_multiplicity
      (finitePlaceEquiv K L σ v) her,
    HeightOneSpectrum.intValuation_eq_exp_neg_multiplicity v hr]
  congr 2
  have hspan :
      Ideal.span ({e r} : Set (𝓞 L)) =
        idealMapMulEquiv e (Ideal.span ({r} : Set (𝓞 L))) := by
    simp [idealMapMulEquiv, Ideal.map_span]
  rw [finitePlaceEquiv_asIdeal, hspan]
  norm_cast
  exact multiplicity_map_eq (idealMapMulEquiv e)
    (a := v.asIdeal) (b := Ideal.span ({r} : Set (𝓞 L)))
omit [NumberField K] in

theorem valuation_finitePlaceEquiv
    (σ : L ≃ₐ[K] L)
    (v : HeightOneSpectrum (𝓞 L))
    (x : L) :
    (finitePlaceEquiv K L σ v).valuation L (σ x) =
      v.valuation L x := by
  obtain ⟨r, d, hrd⟩ :=
    IsLocalization.exists_mk'_eq (𝓞 L)⁰ x
  rw [← hrd, IsFractionRing.mk'_eq_div, map_div₀,
    map_div₀, map_div₀]
  have hσr :
      σ ((algebraMap (𝓞 L) L) r) =
        (algebraMap (𝓞 L) L)
          (NumberField.RingOfIntegers.mapAlgEquiv σ r) :=
    rfl
  have hσd :
      σ ((algebraMap (𝓞 L) L) (d : 𝓞 L)) =
        (algebraMap (𝓞 L) L)
          (NumberField.RingOfIntegers.mapAlgEquiv σ (d : 𝓞 L)) :=
    rfl
  rw [hσr, hσd]
  simp only [HeightOneSpectrum.valuation_of_algebraMap]
  rw [intValuation_finitePlaceEquiv, intValuation_finitePlaceEquiv]

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
 
instance basePrime_liesOver
    (P : Ideal (𝓞 L)) :
    P.LiesOver (basePrime (K := K) P) where
  «over» := rfl
end Dedekind
end HilbertRamification
end

/- ClassFieldTheory.AlgebraicNumberTheory.Completion.ExtensionIndex -/
section
open scoped NumberField Classical
open NumberField IsDedekindDomain
noncomputable section

universe u v w
 
variable {K : Type u} {L : Type v} [Field K] [Field L] [NumberField K] [NumberField L] [Algebra K L]
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

/- ClassFieldTheory.AlgebraicNumberTheory.Completion.AdicCompletionMap -/
section
open scoped NumberField
open NumberField IsDedekindDomain
noncomputable section
universe u v w

variable (K:Type u) (L:Type v) [Field K] [NumberField K] [Field L] [NumberField L] [Algebra K L]
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

/- TunnellAdicLocalization -/
section
namespace TunnellAdicLocalization
open NumberField IsDedekindDomain IsDedekindDomain.HeightOneSpectrum

open scoped Classical ValuativeRel
noncomputable section
variable {K L:Type} [Field K] [NumberField K] [Field L] [NumberField L] [Algebra K L] [FiniteDimensional K L] [IsGalois K L]
variable (v:HeightOneSpectrum (𝓞 K))
abbrev Fibre := {w:HeightOneSpectrum (𝓞 L) // finitePlaceBelow (K:=K) w=v}
end
end TunnellAdicLocalization
end

/- TunnellDirectAdic -/
section
namespace TunnellDirectAdic
open Polynomial IsDedekindDomain NumberField
open scoped Classical WithZero WithZeroTopology ValuativeRel
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
noncomputable section
open  TunnellAdicLocalField TunnellAdicLocalization IsDedekindDomain.HeightOneSpectrum
open scoped TunnellAdicLocalField ValuativeRel
variable {K L:Type} [Field K] [NumberField K] [Field L] [NumberField L] [Algebra K L] [FiniteDimensional K L] [IsGalois K L]
variable (v:HeightOneSpectrum (𝓞 K)) (w:Fibre (L:=L) v)
local instance : Algebra (adicCompletion K v) (adicCompletion L (Subtype.val w)) := (finitePlaceAdicCompletionMap K L v w).toAlgebra
theorem localFields : FiniteDimensional (adicCompletion K v) (adicCompletion L (Subtype.val w)) ∧ IsGalois (adicCompletion K v) (adicCompletion L (Subtype.val w)) :=
  fields v w.1 (finitePlaceAdicCompletionMap K L v w)
    (finitePlaceAdicCompletionMap_continuous K L v w) (finitePlaceAdicCompletionMap_coe K L v w)
end
end TunnellDirectAdic
end

/- TunnellDirectDecomposition -/
section
namespace TunnellDirectDecomposition
open NumberField IsDedekindDomain IsDedekindDomain.HeightOneSpectrum TunnellAdicLocalization
open scoped Classical WithZero WithZeroTopology
noncomputable section
variable {K L:Type} [Field K] [NumberField K] [Field L] [NumberField L] [Algebra K L]
  [FiniteDimensional K L] [IsGalois K L]
variable (v:HeightOneSpectrum (𝓞 K)) (w:Fibre (L:=L) v)
local instance : Algebra (adicCompletion K v) (adicCompletion L (Subtype.val w)) := (finitePlaceAdicCompletionMap K L v w).toAlgebra
theorem action : ∃r:Gal((adicCompletion L (Subtype.val w))/(adicCompletion K v))→*Gal(L/K),Function.Injective r ∧
    ∀(s:Gal((adicCompletion L (Subtype.val w))/(adicCompletion K v)))(x:L),s (algebraMap L (adicCompletion L (Subtype.val w)) x)=algebraMap L (adicCompletion L (Subtype.val w)) (r s x) := by
  letI:Algebra K (adicCompletion L (Subtype.val w)):=((algebraMap L (adicCompletion L (Subtype.val w))).comp (algebraMap K L)).toAlgebra
  letI:IsScalarTower K L (adicCompletion L (Subtype.val w)):=.of_algebraMap_eq' rfl
  letI:IsScalarTower K (adicCompletion K v) (adicCompletion L (Subtype.val w)):=.of_algebraMap_eq (fun x=>(finitePlaceAdicCompletionMap_coe K L v w x).symm)
  let r:Gal((adicCompletion L (Subtype.val w))/(adicCompletion K v))→*Gal(L/K):=(AlgEquiv.restrictNormalHom L).comp (AlgEquiv.restrictScalarsHom K)
  have hr (s:Gal((adicCompletion L (Subtype.val w))/(adicCompletion K v))) (x:L):s (algebraMap L (adicCompletion L (Subtype.val w)) x)=algebraMap L (adicCompletion L (Subtype.val w)) (r s x):=
    (AlgEquiv.restrictNormal_commutes (s.restrictScalars K) L x).symm
  refine ⟨r,?_,hr⟩
  letI:NontriviallyNormedField (adicCompletion K v):=Valued.toNontriviallyNormedField (adicCompletion K v) ℤᵐ⁰
  letI:FiniteDimensional (adicCompletion K v) (adicCompletion L (Subtype.val w)):=(TunnellDirectAdic.localFields v w).1
  letI:ContinuousSMul (adicCompletion K v) (adicCompletion L (Subtype.val w)):=continuousSMul_of_algebraMap (adicCompletion K v) (adicCompletion L (Subtype.val w)) (finitePlaceAdicCompletionMap_continuous K L v w)
  intro s t h
  have eq:((s:(adicCompletion L (Subtype.val w))→(adicCompletion L (Subtype.val w))))=(t:(adicCompletion L (Subtype.val w))→(adicCompletion L (Subtype.val w))):=w.1.denseRange_algebraMap L |>.equalizer
    s.toLinearMap.continuous_of_finiteDimensional t.toLinearMap.continuous_of_finiteDimensional
    (funext fun x=>(hr s x).trans (h ▸ (hr t x).symm))
  exact AlgEquiv.ext (congrFun eq)
theorem stable (hu:∀w':Fibre (L:=L) v,w'=w) (g:Gal(L/K)) : finitePlaceEquiv K L g w.1=w.1 := by
  let t:=finitePlaceEquiv K L g w.1
  have ht : finitePlaceBelow (K:=K) t=finitePlaceBelow (K:=K) w.1 := by
    apply HeightOneSpectrum.ext
    ext a
    change (algebraMap (𝓞 K) (𝓞 L) a)∈t.asIdeal ↔ (algebraMap (𝓞 K) (𝓞 L) a)∈w.1.asIdeal
    rw [show t.asIdeal=w.1.asIdeal.map (RingOfIntegers.mapAlgEquiv g).toRingEquiv from finitePlaceEquiv_asIdeal K L g w.1,
      ←Ideal.symm_apply_mem_of_equiv_iff]
    exact Iff.of_eq (congrArg (fun z:𝓞 L=>z∈w.1.asIdeal) (Subtype.ext (g.symm.commutes (a:K))))
  exact congrArg Subtype.val (hu ⟨t,ht.trans w.2⟩)
def onValued (g:Gal(L/K)):WithVal (w.1.valuation L)≃+*WithVal (w.1.valuation L):=
  ((WithVal.equiv _).trans g.toRingEquiv).trans (WithVal.equiv _).symm
theorem onValued_continuous (g:Gal(L/K)) (hg:∀x:L,w.1.valuation L (g x)=w.1.valuation L x) :
    Continuous (onValued v w g) := by
  let A:=WithVal (w.1.valuation L)
  apply UniformContinuous.continuous
  refine uniformContinuous_of_continuousAt_zero (onValued v w g).toRingHom ?_
  simp_rw [ContinuousAt,map_zero,(Valued.hasBasis_nhds_zero A ℤᵐ⁰).tendsto_iff
    (Valued.hasBasis_nhds_zero A ℤᵐ⁰),true_and,forall_const]
  intro γ
  refine ⟨γ,fun x hx=>?_⟩
  simp only [Set.mem_setOf_eq,Valuation.restrict_lt_iff_lt_embedding] at hx ⊢
  exact (hg ((WithVal.equiv _) x)) ▸ hx
theorem lift (hu:∀w':Fibre (L:=L) v,w'=w) (g:Gal(L/K)) :
    ∃s:Gal((adicCompletion L (Subtype.val w))/(adicCompletion K v)),∀x:L,s (algebraMap L (adicCompletion L (Subtype.val w)) x)=algebraMap L (adicCompletion L (Subtype.val w)) (g x) := by
  let a:=onValued v w g
  have hv (d:Gal(L/K)) (x:L):w.1.valuation L (d x)=w.1.valuation L x:=by
    simpa only [stable v w hu d] using valuation_finitePlaceEquiv K L d w.1 x
  have ha:Continuous a:=onValued_continuous v w g (hv g)
  have hb:Continuous a.symm:=onValued_continuous v w g.symm (hv g.symm)
  let b:=UniformSpace.Completion.mapRingEquiv a ha hb
  let c:=((adicCompletion.equiv L w.1).trans b).trans (adicCompletion.equiv L w.1).symm
  have hc:Continuous c:=(adicCompletion.continuous_ofCompletion L w.1).comp
    (UniformSpace.Completion.continuous_map.comp (adicCompletion.continuous_toCompletion L w.1))
  have hs (x:L):c (algebraMap L (adicCompletion L (Subtype.val w)) x)=algebraMap L (adicCompletion L (Subtype.val w)) (g x):=by
    change adicCompletion.ofCompletion (UniformSpace.Completion.mapRingHom a.toRingHom ha ((WithVal.equiv (w.1.valuation L)).symm x))=_
    exact congrArg (adicCompletion.ofCompletion (v:=w.1) (K:=L)) (UniformSpace.Completion.mapRingHom_coe (f:=a.toRingHom) ha ((WithVal.equiv (w.1.valuation L)).symm x))
  let f:=finitePlaceAdicCompletionMap K L v w
  have hf:Continuous f:=finitePlaceAdicCompletionMap_continuous K L v w
  have he:(fun x:(adicCompletion K v)=>c (f x))=f:=by
    apply (v.denseRange_algebraMap K).equalizer (hc.comp hf) hf
    funext x
    change c (f (algebraMap K (adicCompletion K v) x))=f (algebraMap K (adicCompletion K v) x)
    rw [show f (algebraMap K (adicCompletion K v) x)=algebraMap L (adicCompletion L (Subtype.val w)) (algebraMap K L x) from finitePlaceAdicCompletionMap_coe K L v w x,hs,g.commutes]
  exact ⟨{c with commutes':=congrFun he},hs⟩
theorem unique_action (hu:∀w':Fibre (L:=L) v,w'=w) :
    ∃e:Gal(L/K)≃*Gal((adicCompletion L (Subtype.val w))/(adicCompletion K v)),(∀g x,e g (algebraMap L (adicCompletion L (Subtype.val w)) x)=algebraMap L (adicCompletion L (Subtype.val w)) (g x)) ∧
      Module.finrank (adicCompletion K v) (adicCompletion L (Subtype.val w))=Module.finrank K L := by
  obtain ⟨f,hf,he⟩:=action v w
  have hs:Function.Surjective f:=by
    intro g
    obtain ⟨s,h⟩:=lift v w hu g
    exact ⟨s,AlgEquiv.ext (fun x=>(algebraMap L (adicCompletion L (Subtype.val w))).injective ((he s x).symm.trans (h x)))⟩
  let e:=MulEquiv.ofBijective f ⟨hf,hs⟩
  have hh:=TunnellDirectAdic.localFields v w
  letI:=hh.1
  letI:=hh.2
  refine ⟨e.symm,fun g x=>(he (e.symm g) x).trans ?_,?_⟩
  · exact congrArg (fun z:Gal(L/K)=>algebraMap L (adicCompletion L (Subtype.val w)) (z x)) (e.apply_symm_apply g)
  · rw [←IsGalois.card_aut_eq_finrank,←IsGalois.card_aut_eq_finrank]
    exact Nat.card_congr e.toEquiv
end
end TunnellDirectDecomposition
end

/- TunnellDirectGenerators -/
section
namespace TunnellDirectGenerators
open NumberField IsDedekindDomain IsDedekindDomain.HeightOneSpectrum TunnellAdicLocalization TunnellKummer
open scoped Classical IsMulCommutative
noncomputable section
variable {K L:Type} [Field K] [NumberField K] [Field L] [NumberField L] [Algebra K L] [FiniteDimensional K L] [IsGalois K L]
variable (v:HeightOneSpectrum (𝓞 K)) (W:Fibre (L:=L) v)
local instance alg : Algebra (adicCompletion K v) (adicCompletion L (Subtype.val W)) := (finitePlaceAdicCompletionMap K L v W).toAlgebra
theorem abelian [IsAbelianGalois K L] : IsAbelianGalois (adicCompletion K v) (adicCompletion L (Subtype.val W)) := by
  haveI:=(TunnellDirectAdic.localFields v W).2
  obtain ⟨r,hi,_⟩:=TunnellDirectDecomposition.action v W
  exact {is_comm.comm x y:=hi (by rw [r.map_mul,r.map_mul,mul_comm])}
end
end TunnellDirectGenerators
end

/- TunnellDirectNormComparison -/
section
namespace TunnellDirectNormComparison
open NumberField IsDedekindDomain IsDedekindDomain.HeightOneSpectrum TunnellAdicLocalization
open scoped Classical
noncomputable section
variable {K L:Type} [Field K] [NumberField K] [Field L] [NumberField L] [Algebra K L] [FiniteDimensional K L] [IsGalois K L]
variable (v:HeightOneSpectrum (𝓞 K)) (w:Fibre (L:=L) v)
local instance : Algebra (adicCompletion K v) (adicCompletion L (Subtype.val w)) := (finitePlaceAdicCompletionMap K L v w).toAlgebra

theorem norm (hu:∀ w':Fibre (L:=L) v,w'=w) (x:L) :
    Algebra.norm (adicCompletion K v) (algebraMap L (adicCompletion L (Subtype.val w)) x)=algebraMap K (adicCompletion K v) (Algebra.norm K x) := by
  haveI:=(TunnellDirectAdic.localFields v w).2
  haveI:=(TunnellDirectAdic.localFields v w).1
  obtain ⟨e,he,_⟩:=TunnellDirectDecomposition.unique_action v w hu
  apply (algebraMap (adicCompletion K v) (adicCompletion L (Subtype.val w))).injective
  change algebraMap (adicCompletion K v) (adicCompletion L (Subtype.val w)) (Algebra.norm (adicCompletion K v) (algebraMap L (adicCompletion L (Subtype.val w)) x))=finitePlaceAdicCompletionMap K L v w (algebraMap K (adicCompletion K v) (Algebra.norm K x))
  have hcoe:finitePlaceAdicCompletionMap K L v w (algebraMap K (adicCompletion K v) (Algebra.norm K x))=algebraMap L (adicCompletion L (Subtype.val w)) (algebraMap K L (Algebra.norm K x)):=finitePlaceAdicCompletionMap_coe K L v w (Algebra.norm K x)
  rw [Algebra.norm_eq_prod_automorphisms,hcoe]
  change (∏ g:Gal((adicCompletion L (Subtype.val w))/(adicCompletion K v)),g (algebraMap L (adicCompletion L (Subtype.val w)) x))=algebraMap L (adicCompletion L (Subtype.val w)) (algebraMap K L (Algebra.norm K x))
  rw [Algebra.norm_eq_prod_automorphisms,map_prod]
  exact (Fintype.prod_equiv e.toEquiv _ _ fun g=>(he g x).symm).symm
end
end TunnellDirectNormComparison
end

/- TunnellPointCompletionTower -/
section
namespace TunnellPointCompletionTower
open NumberField IsDedekindDomain IsDedekindDomain.HeightOneSpectrum TunnellAdicLocalization
open scoped Classical
noncomputable section
variable {K D:Type} [Field K] [Field D] [NumberField K] [NumberField D] [Algebra K D]
variable (v:HeightOneSpectrum (𝓞 K)) (w:Fibre (L:=D) v)
local instance : Algebra (adicCompletion K v) (adicCompletion D (Subtype.val w)) := (finitePlaceAdicCompletionMap K D v w).toAlgebra
def fibre (w':HeightOneSpectrum (𝓞 D)) (hw:w'.asIdeal.LiesOver v.asIdeal) : Fibre (L:=D) v :=
  ⟨w',HeightOneSpectrum.ext hw.over.symm⟩
theorem unique (h:∀u:HeightOneSpectrum (𝓞 D),u.asIdeal.LiesOver v.asIdeal → u=w.val) :
    ∀u:Fibre (L:=D) v,u=w := by
  rintro ⟨u,hu⟩
  apply Subtype.ext
  refine h u ?_
  rw [←hu]
  exact inferInstanceAs (u.asIdeal.LiesOver (u.asIdeal.under (𝓞 K)))
variable {N:Type} [Field N] [NumberField N] [Algebra D N] [Algebra K N] [IsScalarTower K D N]
end
end TunnellPointCompletionTower
end

/- TunnellIntrinsicUpperNorm -/
section
namespace TunnellIntrinsicUpperNorm
open NumberField IsDedekindDomain IsDedekindDomain.HeightOneSpectrum TunnellAdicLocalization
open scoped Classical NumberField
noncomputable section
def Norm : Prop :=
  ∀(T D:Type)[Field T][Field D][NumberField T][NumberField D][Algebra T D][IsAbelianGalois T D]
  (w:HeightOneSpectrum (𝓞 T))(v:HeightOneSpectrum (𝓞 D)),v.asIdeal.LiesOver w.asIdeal→
  let L:=w.adicCompletion T;let C:=v.adicCompletion D
  ∀f:L→+*C,Continuous f→(∀z:T,f (z:L)=(algebraMap T D z:C))→letI:=f.toAlgebra
  FiniteDimensional L C∧IsAbelianGalois L C∧((∀s≠v,¬s.asIdeal.LiesOver w.asIdeal)→∀z:D,Algebra.norm L (z:C)=(Algebra.norm T z:L))
theorem result : Norm := by
  intro T D _ _ _ _ _ _ w v hOver L C f cont compat
  letI:FiniteDimensional T D:=Module.Finite.of_restrictScalars_finite ℚ T D
  let u:Fibre (L:=D) w:=TunnellPointCompletionTower.fibre w v hOver
  let g:=finitePlaceAdicCompletionMap T D w u
  have e:f=g:=by
    apply RingHom.ext
    intro x
    have ee:(f:L→C)=(g:L→C):=(w.denseRange_algebraMap T).equalizer cont (finitePlaceAdicCompletionMap_continuous T D w u) (funext fun z=> (compat z).trans (finitePlaceAdicCompletionMap_coe T D w u z).symm)
    exact congrFun ee x
  subst f
  letI:Algebra L C:=g.toAlgebra
  refine ⟨(TunnellDirectAdic.localFields w u).1,TunnellDirectGenerators.abelian w u,fun h z=>TunnellDirectNormComparison.norm w u ?_ z⟩
  apply TunnellPointCompletionTower.unique w u
  intro s hs
  by_contra hh
  exact h s hh hs
end
end TunnellIntrinsicUpperNorm
end

theorem OMA.solution : OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H2_R1_H1_R1_H1_R1.H4 := TunnellIntrinsicUpperNorm.result
