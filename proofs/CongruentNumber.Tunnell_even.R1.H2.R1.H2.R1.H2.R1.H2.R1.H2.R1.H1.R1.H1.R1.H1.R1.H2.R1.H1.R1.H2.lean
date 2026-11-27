import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H2_R1_H1_R1
import Mathlib
namespace TunnellCoates
end TunnellCoates
namespace TunnellKummer
end TunnellKummer
namespace TunnellGaussianEnd
end TunnellGaussianEnd
namespace LSG.Weierstrass
end LSG.Weierstrass
namespace TunnellCMToricDivision
end TunnellCMToricDivision
namespace TunnellCMLemniscate
end TunnellCMLemniscate
namespace TunnellCMTorsionField
end TunnellCMTorsionField
namespace TunnellCMModelUnit
end TunnellCMModelUnit
namespace TunnellCMUnitCriterion
end TunnellCMUnitCriterion
namespace TunnellCMLocalUnit
end TunnellCMLocalUnit
namespace TunnellCMIntegralInertia
end TunnellCMIntegralInertia
namespace TunnellCMInertiaAtGood
end TunnellCMInertiaAtGood
namespace TunnellCMGlobalModelUnit
end TunnellCMGlobalModelUnit
namespace TunnellCMGoodInertiaAction
end TunnellCMGoodInertiaAction
namespace TunnellCMChangeBaseField
end TunnellCMChangeBaseField
namespace TunnellLocalCMCoordDegree
end TunnellLocalCMCoordDegree
namespace TunnellCMRebasedDivision
end TunnellCMRebasedDivision
namespace TunnellDivisionCoordinates
end TunnellDivisionCoordinates
namespace TunnellCMGoodKummerBaseChange
end TunnellCMGoodKummerBaseChange
namespace TunnellCMUniformGoodBase
end TunnellCMUniformGoodBase
namespace TunnellFormalQuarter
end TunnellFormalQuarter
namespace TunnellLocalCM
end TunnellLocalCM
namespace TunnellLocalDivisibility
end TunnellLocalDivisibility
namespace TunnellGaussianPrimeIdeal
end TunnellGaussianPrimeIdeal
/-
Selected formal group and ramification results are adapted from EllipticCurves and ClassFieldTheory under the Apache License below. The ClassFieldTheory source is revision 2e6280f9d2579705a0cc6c76ec68c2b60f9c601a at https://github.com/n-yamaguchi-0729/ClassFieldTheory.
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

/- EllipticCurves.Mathlib.AdicCompletionExtension -/
section
section
open Polynomial IsDedekindDomain WithZero
namespace IsDedekindDomain.HeightOneSpectrum
variable {R : Type*} [CommRing R] [IsDedekindDomain R]
  {K : Type*} [Field K] [Algebra R K] [IsFractionRing R K] (v : HeightOneSpectrum R)
 
theorem valued_irreducible_adicCompletionIntegers {π : v.adicCompletionIntegers K}
    (hπ : Irreducible π) :
    Valued.v (algebraMap (v.adicCompletionIntegers K) (v.adicCompletion K) π) = exp (-1) := by
  have hgen : IsLocalRing.maximalIdeal (Valued.v : Valuation (v.adicCompletion K)
      ℤᵐ⁰).valuationSubring = Ideal.span {π} := hπ.maximalIdeal_eq
  have huni := Valuation.isUniformizer_of_maximalIdeal_eq_span
    (v := (Valued.v : Valuation (v.adicCompletion K) ℤᵐ⁰)) hgen
  rwa [Valuation.IsUniformizer.iff,
    Valuation.IsRankOneDiscrete.generator_eq_exp_neg_one_of_surjective
      (v.valuedAdicCompletion_surjective K)] at huni

theorem span_singleton_eq_maximalIdeal_pow {x : v.adicCompletionIntegers K} {e : ℕ}
    (hx : Valued.v (algebraMap (v.adicCompletionIntegers K) (v.adicCompletion K) x) =
      exp (-(e : ℤ))) :
    Ideal.span {x} = IsLocalRing.maximalIdeal (v.adicCompletionIntegers K) ^ e := by
  have hx0 : x ≠ 0 := by
    rintro rfl
    rw [map_zero, map_zero] at hx
    exact absurd hx.symm exp_ne_zero
  obtain ⟨π, hπ⟩ := IsDiscreteValuationRing.exists_irreducible (v.adicCompletionIntegers K)
  obtain ⟨n, u, rfl⟩ := IsDiscreteValuationRing.eq_unit_mul_pow_irreducible hx0 hπ
  have hu2 : Valued.v (algebraMap (v.adicCompletionIntegers K) (v.adicCompletion K)
      (u : v.adicCompletionIntegers K)) = 1 :=
    (Valuation.valuationSubring.integers (v := Valued.v)).valuation_unit u
  have hval : Valued.v (algebraMap (v.adicCompletionIntegers K) (v.adicCompletion K)
      (↑u * π ^ n)) = exp (-(n : ℤ)) := by
    rw [map_mul, map_mul, hu2, one_mul, map_pow, map_pow,
      v.valued_irreducible_adicCompletionIntegers hπ, ← exp_nsmul]
    simp
  rw [hval, exp_inj, neg_inj, Int.natCast_inj] at hx
  subst hx
  rw [Ideal.span_singleton_eq_span_singleton.mpr (associated_unit_mul_left _ _ u.isUnit),
    ← Ideal.span_singleton_pow, hπ.maximalIdeal_eq]

theorem mem_maximalIdeal_pow_iff {x : v.adicCompletionIntegers K} {n : ℕ} :
    x ∈ IsLocalRing.maximalIdeal (v.adicCompletionIntegers K) ^ n ↔
      Valued.v (x : v.adicCompletion K) ≤ exp (-(n : ℤ)) := by
  obtain ⟨π, hπ⟩ := IsDiscreteValuationRing.exists_irreducible (v.adicCompletionIntegers K)
  have hπn : Valued.v (algebraMap (v.adicCompletionIntegers K) (v.adicCompletion K) (π ^ n)) =
      exp (-(n : ℤ)) := by
    rw [map_pow, map_pow, v.valued_irreducible_adicCompletionIntegers hπ, ← exp_nsmul]
    simp
  rw [← span_singleton_eq_maximalIdeal_pow v hπn, Ideal.mem_span_singleton]
  have hint := Valuation.valuationSubring.integers (v := (Valued.v : Valuation
    (v.adicCompletion K) ℤᵐ⁰))
  exact ⟨fun h ↦ (hint.le_of_dvd h).trans hπn.le, fun h ↦ hint.dvd_of_le (h.trans_eq hπn.symm)⟩
instance isTopologicalRing_adicCompletionIntegers :
    IsTopologicalRing (v.adicCompletionIntegers K) :=
  inferInstanceAs (IsTopologicalRing
    (Valued.v (R := v.adicCompletion K)).valuationSubring.toSubring)

theorem isAdic_maximalIdeal_adicCompletionIntegers :
    IsAdic (IsLocalRing.maximalIdeal (v.adicCompletionIntegers K)) := by
  rw [isAdic_iff]
  constructor
  · 
    intro n
    obtain ⟨z, hz⟩ := v.valuedAdicCompletion_surjective K (exp (-(n : ℤ)))
    have hr0 : Valued.v.restrict z ≠ 0 := by
      intro h
      have h0 : Valued.v z = 0 := by rw [← Valuation.embedding_restrict, h, map_zero]
      rw [hz] at h0
      exact exp_ne_zero h0
    have : ((IsLocalRing.maximalIdeal (v.adicCompletionIntegers K) ^ n :
          Ideal (v.adicCompletionIntegers K)) : Set (v.adicCompletionIntegers K)) =
        (fun x : v.adicCompletionIntegers K ↦ (x : v.adicCompletion K)) ⁻¹'
          {y | Valued.v.restrict y ≤ Valued.v.restrict z} := by
      ext x
      rw [Set.mem_preimage, Set.mem_ofPred, Valuation.restrict_le_iff_le_embedding,
        Valuation.embedding_restrict, hz]
      exact v.mem_maximalIdeal_pow_iff (K := K)
    rw [this]
    exact (Valued.isOpen_closedBall _ hr0).preimage continuous_subtype_val
  · 
    intro s hs
    obtain ⟨t, ht, hts⟩ := mem_nhds_subtype _ _ _ |>.mp hs
    rw [ZeroMemClass.coe_zero] at ht
    obtain ⟨γ, hγ⟩ := Valued.mem_nhds_zero.mp ht
    obtain ⟨m, hm⟩ : ∃ m : ℤ, exp m < MonoidWithZeroHom.ValueGroup₀.embedding γ.1 := by
      obtain ⟨a, ha⟩ :=
        WithZero.ne_zero_iff_exists.mp (MonoidWithZeroHom.ValueGroup₀.embedding_unit_ne_zero γ)
      refine ⟨Multiplicative.toAdd a - 1, ?_⟩
      rw [← ha, show (a : ℤᵐ⁰) = exp (Multiplicative.toAdd a) from rfl]
      exact exp_lt_exp.mpr (by lia)
    refine ⟨(-m).toNat, fun x hx ↦ hts ?_⟩
    refine Set.mem_preimage.mpr (hγ ?_)
    have h1 := v.mem_maximalIdeal_pow_iff (K := K) |>.mp hx
    refine Set.mem_ofPred.mpr ((Valuation.restrict_lt_iff_lt_embedding (v := Valued.v)).mpr
      (h1.trans_lt ?_))
    calc exp (-(((-m).toNat : ℤ))) ≤ exp m := exp_le_exp.mpr (by lia)
      _ < _ := hm
instance completeSpace_adicCompletionIntegers : CompleteSpace (v.adicCompletionIntegers K) :=
  (Valued.isClosed_valuationSubring (v.adicCompletion K)).completeSpace_coe
instance isUniformAddGroup_adicCompletionIntegers :
    IsUniformAddGroup (v.adicCompletionIntegers K) :=
  ((Valued.v (R := v.adicCompletion K)).valuationSubring.toSubring.toAddSubgroup).isUniformAddGroup
end IsDedekindDomain.HeightOneSpectrum
namespace IsDedekindDomain.HeightOneSpectrum
section Extension
variable {R : Type*} [CommRing R] [IsDedekindDomain R]
  {K : Type*} [Field K] [Algebra R K] [IsFractionRing R K]
  {B : Type*} [CommRing B] [IsDedekindDomain B] [Algebra R B] [Module.IsTorsionFree R B]
  {L : Type*} [Field L] [Algebra K L] [Algebra R L] [IsScalarTower R K L]
  [Algebra B L] [IsFractionRing B L] [IsScalarTower R B L]
  (v : HeightOneSpectrum R) (w : HeightOneSpectrum B) [w.asIdeal.LiesOver v.asIdeal]
variable (K L)
end Extension
end IsDedekindDomain.HeightOneSpectrum
end
end

/- EllipticCurves.Mathlib.Chabauty.MvPowerSeriesPDeriv -/
section
section
open Filter Topology
open scoped MvPowerSeries.WithPiTopology
namespace MvPowerSeries
section subst
variable {σ R : Type*} [CommRing R] [TopologicalSpace R] [IsTopologicalRing R]

theorem continuous_subst' {τ : Type*} {a : τ → MvPowerSeries σ R}
    (ha : MvPowerSeries.HasSubst a) :
    Continuous (MvPowerSeries.subst a : MvPowerSeries τ R → MvPowerSeries σ R) := by
  classical
  have hc (e : σ →₀ ℕ) : (Function.support fun d : τ →₀ ℕ ↦
      MvPowerSeries.coeff e (d.prod fun s i ↦ (a s) ^ i)).Finite := by
    have h1 := MvPowerSeries.coeff_subst_finite ha
      ((fun _ ↦ 1) : MvPowerSeries τ R) e
    simpa [Function.HasFiniteSupport, show ∀ d, MvPowerSeries.coeff (R := R) d
      ((fun _ ↦ 1) : MvPowerSeries τ R) = 1 from fun d ↦ rfl] using h1
  refine continuous_pi fun e ↦ ?_
  change Continuous fun f : MvPowerSeries τ R ↦ MvPowerSeries.coeff e (MvPowerSeries.subst a f)
  have heq : (fun f : MvPowerSeries τ R ↦ MvPowerSeries.coeff e (MvPowerSeries.subst a f))
      = fun f ↦ ∑ d ∈ (hc e).toFinset,
          MvPowerSeries.coeff d f * MvPowerSeries.coeff e (d.prod fun s i ↦ (a s) ^ i) := by
    funext f
    rw [MvPowerSeries.coeff_subst ha, finsum_eq_sum_of_support_subset]
    · exact Finset.sum_congr rfl fun d _ ↦ smul_eq_mul _ _
    · intro d hd
      rw [Function.mem_support] at hd
      rw [Set.Finite.coe_toFinset, Function.mem_support]
      exact fun h0 ↦ hd (by rw [h0, smul_zero])
  rw [heq]
  exact continuous_finsetSum _ fun d _ ↦
    (MvPowerSeries.WithPiTopology.continuous_coeff R d).mul continuous_const
end subst
variable {σ R : Type*} [CommRing R]
end MvPowerSeries
end
end

/- EllipticCurves.Mathlib.Chabauty.AdicTopology -/
section
section
variable {R : Type*} [CommRing R] [TopologicalSpace R] {I : Ideal R}
 
theorem IsAdic.isLinearTopology (hI : IsAdic I) : IsLinearTopology R R :=
  IsLinearTopology.mk_of_hasBasis _ hI.hasBasis_nhds_zero
 
theorem IsAdic.nonarchimedeanRing (hI : IsAdic I) : NonarchimedeanRing R := by
  simp only [IsAdic] at hI
  subst hI
  exact I.nonarchimedean
 
theorem IsAdic.isOpen_pow (hI : IsAdic I) (n : ℕ) :
    IsOpen ((I ^ n : Ideal R) : Set R) := by
  simp only [IsAdic] at hI
  subst hI
  let : TopologicalSpace R := I.adicTopology
  exact (I.openAddSubgroup n).isOpen'
 
theorem IsAdic.isClosed_pow (hI : IsAdic I) (n : ℕ) :
    IsClosed ((I ^ n : Ideal R) : Set R) := by
  have hopen := hI.isOpen_pow n
  simp only [IsAdic] at hI
  subst hI
  let : TopologicalSpace R := I.adicTopology
  have : NonarchimedeanRing R := I.nonarchimedean
  exact AddSubgroup.isClosed_of_isOpen (I ^ n).toAddSubgroup hopen
 
theorem IsAdic.isTopologicallyNilpotent_of_mem (hI : IsAdic I) {a : R} (ha : a ∈ I) :
    IsTopologicallyNilpotent a := by
  suffices ∀ m : ℕ, ∃ n₀, ∀ n, n₀ ≤ n → a ^ n ∈ I ^ m by
    simpa [IsTopologicallyNilpotent, hI.hasBasis_nhds_zero.tendsto_right_iff]
  exact fun m ↦ ⟨m, fun n hn ↦ Ideal.pow_le_pow_right hn (Ideal.pow_mem_pow ha _)⟩
end
end

/- EllipticCurves.Mathlib.Chabauty.PSeries -/
section
section
open PowerSeries IsLocalRing Filter Topology
open scoped PowerSeries.WithPiTopology
namespace ChabautyColeman
namespace PSeries
variable {O : Type*} [CommRing O] [UniformSpace O]
variable [IsLocalRing O] [Fact (IsAdic (maximalIdeal O))]
instance instIsLinearTopology : IsLinearTopology O O :=
  (Fact.out : IsAdic (maximalIdeal O)).isLinearTopology
instance instNonarchimedeanRing : NonarchimedeanRing O :=
  (Fact.out : IsAdic (maximalIdeal O)).nonarchimedeanRing
theorem isClosed_maximalIdeal : IsClosed ((maximalIdeal O : Ideal O) : Set O) := by
  have := IsAdic.isClosed_pow (I := maximalIdeal O) Fact.out 1
  simpa using this
variable [IsUniformAddGroup O] [CompleteSpace O]
variable [T2Space O]
variable [IsTopologicalRing O]
variable {z₀ : O} (hz₀ : z₀ ∈ maximalIdeal O)
include hz₀
omit hz₀
variable {k : O⟦X⟧} (hk : constantCoeff k ∈ maximalIdeal O)
end PSeries
end ChabautyColeman
section instantiation
end instantiation
end
end

/- EllipticCurves.Mathlib.Chabauty.MvPSeries -/
section
section
open MvPowerSeries IsLocalRing Filter Topology
open scoped MvPowerSeries.WithPiTopology
namespace ChabautyColeman
namespace MvPSeries
variable {σ : Type*} {O : Type*} [CommRing O] [UniformSpace O]

noncomputable def eval (z₀ : σ → O) (h : MvPowerSeries σ O) : O :=
  MvPowerSeries.eval₂ (RingHom.id O) z₀ h
@[simp]
theorem eval_C (r : O) (z₀ : σ → O) : eval z₀ (C r) = r :=
  eval₂_C _ _ r
@[simp]
theorem eval_X (z₀ : σ → O) (s : σ) : eval z₀ (X s) = z₀ s :=
  eval₂_X _ _ s
@[simp]
theorem eval_zero (z₀ : σ → O) : eval z₀ (0 : MvPowerSeries σ O) = 0 := by
  rw [show (0 : MvPowerSeries σ O) = C 0 from (map_zero _).symm, eval_C]
section substContinuity
variable [IsTopologicalRing O]
lemma continuous_substAlgHom {τ : Type*} {a : τ → MvPowerSeries σ O}
    (ha : MvPowerSeries.HasSubst a) :
    Continuous (MvPowerSeries.substAlgHom (R := O) (S := O) ha) := by
  rw [MvPowerSeries.coe_substAlgHom]
  exact MvPowerSeries.continuous_subst' ha
end substContinuity
variable [IsLocalRing O] [Fact (IsAdic (maximalIdeal O))]

theorem hasEval_of_mem [Finite σ] {z₀ : σ → O} (hz₀ : ∀ i, z₀ i ∈ maximalIdeal O) :
    MvPowerSeries.HasEval z₀ where
  hpow i := (Fact.out : IsAdic (maximalIdeal O)).isTopologicallyNilpotent_of_mem (hz₀ i)
  tendsto_zero := by
    rw [Filter.cofinite_eq_bot]
    exact tendsto_bot
variable [IsUniformAddGroup O] [CompleteSpace O]
variable [T2Space O] [IsTopologicalRing O]
variable {τ : Type*}
variable {z₀ : σ → O} (hz₀ : MvPowerSeries.HasEval z₀)
include hz₀ in
 
theorem hasSum_eval (h : MvPowerSeries σ O) :
    HasSum (fun d : σ →₀ ℕ ↦ coeff d h * d.prod fun s e ↦ z₀ s ^ e) (eval z₀ h) :=
  hasSum_eval₂ continuous_id hz₀ h
 
noncomputable def evalRingHom (hz₀ : MvPowerSeries.HasEval z₀) : MvPowerSeries σ O →+* O :=
  MvPowerSeries.eval₂Hom (φ := RingHom.id O) continuous_id hz₀
theorem coe_evalRingHom : ⇑(evalRingHom hz₀) = eval z₀ :=
  coe_eval₂Hom (φ := RingHom.id O) continuous_id hz₀
@[simp]
theorem evalRingHom_apply (h : MvPowerSeries σ O) : evalRingHom hz₀ h = eval z₀ h :=
  congrFun (coe_evalRingHom hz₀) h
include hz₀
theorem eval_sub (h₁ h₂ : MvPowerSeries σ O) :
    eval z₀ (h₁ - h₂) = eval z₀ h₁ - eval z₀ h₂ := by
  simpa using map_sub (evalRingHom hz₀) h₁ h₂
include hz₀ in

theorem eval_sub_constantCoeff_mem (hmem : ∀ i, z₀ i ∈ maximalIdeal O)
    (h : MvPowerSeries σ O) :
    eval z₀ h - constantCoeff h ∈ maximalIdeal O := by
  classical
  have htot := hasSum_eval hz₀ h
  have hupd := htot.update 0 0
  have hval : ∀ d : σ →₀ ℕ, Function.update
      (fun d : σ →₀ ℕ ↦ coeff d h * d.prod fun s e ↦ z₀ s ^ e) 0 0 d
        ∈ maximalIdeal O := by
    intro d
    rcases eq_or_ne d 0 with rfl | hd
    · simp
    · rw [Function.update_of_ne hd]
      obtain ⟨i, hi⟩ := Finsupp.support_nonempty_iff.mpr hd
      rw [Finsupp.prod, ← Finset.prod_erase_mul _ _ hi]
      refine Ideal.mul_mem_left _ _ (Ideal.mul_mem_left _ _ (Ideal.pow_mem_of_mem _ ?_ _ ?_))
      · exact hmem i
      · exact Nat.pos_of_ne_zero (Finsupp.mem_support_iff.mp hi)
  have hmemsum : (∑' d, Function.update
      (fun d : σ →₀ ℕ ↦ coeff d h * d.prod fun s e ↦ z₀ s ^ e) 0 0 d)
        ∈ maximalIdeal O :=
    tsum_mem PSeries.isClosed_maximalIdeal hval
  rw [hupd.tsum_eq] at hmemsum
  simpa [Finsupp.prod_zero_index, zero_sub, neg_add_eq_sub] using hmemsum
include hz₀ in

theorem eval_mem_maximalIdeal (hmem : ∀ i, z₀ i ∈ maximalIdeal O)
    (h : MvPowerSeries σ O) (hcc : constantCoeff h ∈ maximalIdeal O) :
    eval z₀ h ∈ maximalIdeal O := by
  have := Ideal.add_mem _ (eval_sub_constantCoeff_mem hz₀ hmem h) hcc
  simpa using this
section algHomCompat
variable {τ : Type*} {ψ : MvPowerSeries τ O →ₐ[O] MvPowerSeries σ O} (hψ : Continuous ψ)
include hψ

theorem eval_algHom (h : MvPowerSeries τ O) :
    eval z₀ (ψ h) = eval (fun s ↦ eval z₀ (ψ (MvPowerSeries.X s))) h := by
  have hcont : Continuous ((MvPowerSeries.aeval hz₀).comp ψ) := by
    rw [AlgHom.coe_comp]
    exact (MvPowerSeries.continuous_aeval hz₀).comp hψ
  have happ := congrFun (congrArg DFunLike.coe (MvPowerSeries.aeval_unique hcont)) h
  have hXs : (fun s ↦ ((MvPowerSeries.aeval hz₀).comp ψ) (MvPowerSeries.X s))
      = fun s ↦ eval z₀ (ψ (MvPowerSeries.X s)) := by
    funext s
    rw [AlgHom.comp_apply]
    exact congrFun (MvPowerSeries.coe_aeval hz₀) _
  have h1 : ((MvPowerSeries.aeval hz₀).comp ψ) h = eval z₀ (ψ h) := by
    rw [AlgHom.comp_apply]
    exact congrFun (MvPowerSeries.coe_aeval hz₀) _
  have h2 : (MvPowerSeries.aeval (MvPowerSeries.HasEval.X.map hcont)) h
      = eval (fun s ↦ eval z₀ (ψ (MvPowerSeries.X s))) h := by
    rw [← hXs]
    exact congrFun (MvPowerSeries.coe_aeval _) h
  rw [← h1, ← happ, h2]
end algHomCompat
section subst
variable {τ : Type*} {a : τ → MvPowerSeries σ O} (ha : MvPowerSeries.HasSubst a)
include ha
 
theorem eval_subst (h : MvPowerSeries τ O) :
    eval z₀ (MvPowerSeries.subst a h) = eval (fun s ↦ eval z₀ (a s)) h := by
  have := eval_algHom hz₀ (continuous_substAlgHom ha) h
  simpa [MvPowerSeries.substAlgHom_apply, MvPowerSeries.subst_X ha] using this
end subst
end MvPSeries
end ChabautyColeman
end
end

/- EllipticCurves.Mathlib.Chabauty.FormalGroupLaw.Basic -/
section
section
open MvPowerSeries IsLocalRing Filter Topology
open scoped MvPowerSeries.WithPiTopology
namespace ChabautyColeman
section families
variable {O : Type*} [CommRing O] {ι : Type*}

noncomputable def assocLeftFam (F : ι → MvPowerSeries (ι ⊕ ι) O) :
    ι ⊕ ι → MvPowerSeries (ι ⊕ ι ⊕ ι) O :=
  Sum.elim
    (fun j ↦ MvPowerSeries.subst
      (Sum.elim (fun a ↦ X (Sum.inl a)) fun b ↦ X (Sum.inr (Sum.inl b))) (F j))
    fun j ↦ X (Sum.inr (Sum.inr j))

noncomputable def assocRightFam (F : ι → MvPowerSeries (ι ⊕ ι) O) :
    ι ⊕ ι → MvPowerSeries (ι ⊕ ι ⊕ ι) O :=
  Sum.elim
    (fun j ↦ X (Sum.inl j))
    fun j ↦ MvPowerSeries.subst
      (Sum.elim (fun a ↦ X (Sum.inr (Sum.inl a))) fun b ↦ X (Sum.inr (Sum.inr b))) (F j)
end families
variable (O : Type*) [CommRing O] (ι : Type*)

structure FormalGroupLaw where
   
  F : ι → MvPowerSeries (ι ⊕ ι) O
  zero_constantCoeff : ∀ i, constantCoeff (F i) = 0
  add_zero' : ∀ i, MvPowerSeries.subst
    (Sum.elim MvPowerSeries.X fun _ ↦ 0 : ι ⊕ ι → MvPowerSeries ι O) (F i)
    = MvPowerSeries.X i
  zero_add' : ∀ i, MvPowerSeries.subst
    (Sum.elim (fun _ ↦ 0) MvPowerSeries.X : ι ⊕ ι → MvPowerSeries ι O) (F i)
    = MvPowerSeries.X i
  comm' : ∀ i, MvPowerSeries.subst (fun s ↦ MvPowerSeries.X s.swap) (F i) = F i
  assoc' : ∀ i, MvPowerSeries.subst (assocLeftFam F) (F i)
    = MvPowerSeries.subst (assocRightFam F) (F i)
namespace FormalGroupLaw
variable {O ι} (Φ : FormalGroupLaw O ι)
section hasSubst
variable [Finite ι]
lemma hasSubst_unitR :
    MvPowerSeries.HasSubst
      (Sum.elim MvPowerSeries.X (fun _ ↦ 0) : ι ⊕ ι → MvPowerSeries ι O) :=
  hasSubst_of_constantCoeff_zero (by rintro (j | j) <;> simp)
lemma hasSubst_unitL :
    MvPowerSeries.HasSubst
      (Sum.elim (fun _ ↦ 0) MvPowerSeries.X : ι ⊕ ι → MvPowerSeries ι O) :=
  hasSubst_of_constantCoeff_zero (by rintro (j | j) <;> simp)
lemma hasSubst_swap :
    MvPowerSeries.HasSubst
      (fun s : ι ⊕ ι ↦ (MvPowerSeries.X s.swap : MvPowerSeries (ι ⊕ ι) O)) :=
  hasSubst_of_constantCoeff_zero fun s ↦ by simp
lemma hasSubst_emb12 :
    MvPowerSeries.HasSubst
      (Sum.elim (fun a : ι ↦ X (Sum.inl a)) (fun b : ι ↦ X (Sum.inr (Sum.inl b)))
        : ι ⊕ ι → MvPowerSeries (ι ⊕ ι ⊕ ι) O) :=
  hasSubst_of_constantCoeff_zero (by rintro (j | j) <;> simp)
lemma hasSubst_emb23 :
    MvPowerSeries.HasSubst
      (Sum.elim (fun a : ι ↦ X (Sum.inr (Sum.inl a)))
        (fun b : ι ↦ X (Sum.inr (Sum.inr b)))
        : ι ⊕ ι → MvPowerSeries (ι ⊕ ι ⊕ ι) O) :=
  hasSubst_of_constantCoeff_zero (by rintro (j | j) <;> simp)
lemma hasSubst_assocLeft :
    MvPowerSeries.HasSubst (assocLeftFam Φ.F) := by
  refine hasSubst_of_constantCoeff_zero ?_
  rintro (j | j)
  · exact constantCoeff_subst_eq_zero (hasSubst_emb12 (O := O) (ι := ι))
      (by rintro (a | b) <;> simp) (Φ.zero_constantCoeff j)
  · simp [assocLeftFam]
lemma hasSubst_assocRight :
    MvPowerSeries.HasSubst (assocRightFam Φ.F) := by
  refine hasSubst_of_constantCoeff_zero ?_
  rintro (j | j)
  · simp [assocRightFam]
  · exact constantCoeff_subst_eq_zero (hasSubst_emb23 (O := O) (ι := ι))
      (by rintro (a | b) <;> simp) (Φ.zero_constantCoeff j)
end hasSubst
section diffMatrix
variable [DecidableEq ι]
end diffMatrix
section baseChange
variable {O' : Type*} [CommRing O'] [Finite ι]
variable [Fintype ι] [DecidableEq ι]
end baseChange
end FormalGroupLaw
end ChabautyColeman
end
end

/- EllipticCurves.Mathlib.Chabauty.FormalGroupLaw.Points -/
section
section
open MvPowerSeries IsLocalRing Filter Topology
open scoped MvPowerSeries.WithPiTopology
namespace ChabautyColeman
namespace FormalGroupLaw
variable {O : Type*} [CommRing O] {ι : Type*} (Φ : FormalGroupLaw O ι)
variable [IsLocalRing O]

def Points (_Φ : FormalGroupLaw O ι) := ι → maximalIdeal O
instance : Zero Φ.Points := ⟨fun _ ↦ 0⟩
@[simp]
lemma zero_apply_coe (i : ι) : ((0 : Φ.Points) i : O) = 0 := rfl

def pairFam (z w : Φ.Points) : ι ⊕ ι → O :=
  Sum.elim (fun j ↦ (z j : O)) fun j ↦ (w j : O)
lemma pairFam_mem (z w : Φ.Points) (s : ι ⊕ ι) :
    pairFam Φ z w s ∈ maximalIdeal O := by
  rcases s with j | j
  · exact (z j).2
  · exact (w j).2
section points
variable [UniformSpace O] [Fact (IsAdic (maximalIdeal O))] [Finite ι]
lemma hasEval_coe (z : Φ.Points) :
    MvPowerSeries.HasEval fun j : ι ↦ (z j : O) :=
  MvPSeries.hasEval_of_mem fun j ↦ (z j).2
lemma hasEval_pairFam (z w : Φ.Points) :
    MvPowerSeries.HasEval (pairFam Φ z w) :=
  MvPSeries.hasEval_of_mem (pairFam_mem Φ z w)
variable [IsUniformAddGroup O] [CompleteSpace O] [T2Space O] [IsTopologicalRing O]
noncomputable instance : Add Φ.Points :=
  ⟨fun z w i ↦ ⟨MvPSeries.eval (pairFam Φ z w) (Φ.F i),
    MvPSeries.eval_mem_maximalIdeal (hasEval_pairFam Φ z w) (pairFam_mem Φ z w) (Φ.F i)
      (by rw [Φ.zero_constantCoeff i]; exact zero_mem _)⟩⟩
@[simp]
lemma add_apply_coe (z w : Φ.Points) (i : ι) :
    ((z + w) i : O) = MvPSeries.eval (pairFam Φ z w) (Φ.F i) := rfl
noncomputable instance : AddCommMonoid Φ.Points where
  add := (· + ·)
  zero := 0
  nsmul := nsmulRec
  add_zero z := by
    funext i
    refine Subtype.ext ?_
    have hax := congrArg (MvPSeries.eval fun j : ι ↦ (z j : O)) (Φ.add_zero' i)
    rw [MvPSeries.eval_subst (hasEval_coe Φ z) hasSubst_unitR, MvPSeries.eval_X] at hax
    have hfam : (fun s : ι ⊕ ι ↦ MvPSeries.eval (fun j : ι ↦ (z j : O))
          ((Sum.elim MvPowerSeries.X (fun _ ↦ 0) : ι ⊕ ι → MvPowerSeries ι O) s))
        = pairFam Φ z 0 := by
      funext s
      rcases s with j | j <;> simp [pairFam]
    rw [hfam] at hax
    rw [add_apply_coe]
    exact hax
  zero_add z := by
    funext i
    refine Subtype.ext ?_
    have hax := congrArg (MvPSeries.eval fun j : ι ↦ (z j : O)) (Φ.zero_add' i)
    rw [MvPSeries.eval_subst (hasEval_coe Φ z) hasSubst_unitL, MvPSeries.eval_X] at hax
    have hfam : (fun s : ι ⊕ ι ↦ MvPSeries.eval (fun j : ι ↦ (z j : O))
          ((Sum.elim (fun _ ↦ 0) MvPowerSeries.X : ι ⊕ ι → MvPowerSeries ι O) s))
        = pairFam Φ 0 z := by
      funext s
      rcases s with j | j <;> simp [pairFam]
    rw [hfam] at hax
    rw [add_apply_coe]
    exact hax
  add_comm z w := by
    funext i
    refine Subtype.ext ?_
    have hax := congrArg (MvPSeries.eval (pairFam Φ z w)) (Φ.comm' i)
    rw [MvPSeries.eval_subst (hasEval_pairFam Φ z w) hasSubst_swap] at hax
    have hfam : (fun s : ι ⊕ ι ↦ MvPSeries.eval (pairFam Φ z w)
          (MvPowerSeries.X s.swap : MvPowerSeries (ι ⊕ ι) O))
        = pairFam Φ w z := by
      funext s
      rcases s with j | j <;> simp [pairFam]
    rw [hfam] at hax
    rw [add_apply_coe, add_apply_coe]
    exact hax.symm
  add_assoc z w u := by
    funext i
    refine Subtype.ext ?_
    set p3 : ι ⊕ ι ⊕ ι → O :=
      Sum.elim (fun j ↦ (z j : O)) (Sum.elim (fun j ↦ (w j : O)) fun j ↦ (u j : O))
      with hp3def
    have hp3mem (s : ι ⊕ ι ⊕ ι) : p3 s ∈ maximalIdeal O := by
      rcases s with j | j | j
      · exact (z j).2
      · exact (w j).2
      · exact (u j).2
    have hp3 : MvPowerSeries.HasEval p3 := MvPSeries.hasEval_of_mem hp3mem
    have hax := congrArg (MvPSeries.eval p3) (Φ.assoc' i)
    rw [MvPSeries.eval_subst hp3 (hasSubst_assocLeft Φ),
      MvPSeries.eval_subst hp3 (hasSubst_assocRight Φ)] at hax
    have hleft : (fun s : ι ⊕ ι ↦ MvPSeries.eval p3 (assocLeftFam Φ.F s))
        = pairFam Φ (z + w) u := by
      funext s
      rcases s with j | j
      · have h1 : MvPSeries.eval p3 (assocLeftFam Φ.F (Sum.inl j))
            = MvPSeries.eval (fun s' ↦ MvPSeries.eval p3
              ((Sum.elim (fun a : ι ↦ X (Sum.inl a))
                (fun b : ι ↦ X (Sum.inr (Sum.inl b)))
                : ι ⊕ ι → MvPowerSeries (ι ⊕ ι ⊕ ι) O) s')) (Φ.F j) :=
          MvPSeries.eval_subst hp3 hasSubst_emb12 (Φ.F j)
        have h2 : (fun s' : ι ⊕ ι ↦ MvPSeries.eval p3
              ((Sum.elim (fun a : ι ↦ X (Sum.inl a))
                (fun b : ι ↦ X (Sum.inr (Sum.inl b)))
                : ι ⊕ ι → MvPowerSeries (ι ⊕ ι ⊕ ι) O) s'))
            = pairFam Φ z w := by
          funext s'
          rcases s' with a | b <;> simp [pairFam, hp3def]
        rw [h2] at h1
        have h3 : pairFam Φ (z + w) u (Sum.inl j) = ((z + w) j : O) := rfl
        rw [h1, h3, add_apply_coe]
      · simp [assocLeftFam, pairFam, hp3def]
    have hright : (fun s : ι ⊕ ι ↦ MvPSeries.eval p3 (assocRightFam Φ.F s))
        = pairFam Φ z (w + u) := by
      funext s
      rcases s with j | j
      · simp [assocRightFam, pairFam, hp3def]
      · have h1 : MvPSeries.eval p3 (assocRightFam Φ.F (Sum.inr j))
            = MvPSeries.eval (fun s' ↦ MvPSeries.eval p3
              ((Sum.elim (fun a : ι ↦ X (Sum.inr (Sum.inl a)))
                (fun b : ι ↦ X (Sum.inr (Sum.inr b)))
                : ι ⊕ ι → MvPowerSeries (ι ⊕ ι ⊕ ι) O) s')) (Φ.F j) :=
          MvPSeries.eval_subst hp3 hasSubst_emb23 (Φ.F j)
        have h2 : (fun s' : ι ⊕ ι ↦ MvPSeries.eval p3
              ((Sum.elim (fun a : ι ↦ X (Sum.inr (Sum.inl a)))
                (fun b : ι ↦ X (Sum.inr (Sum.inr b)))
                : ι ⊕ ι → MvPowerSeries (ι ⊕ ι ⊕ ι) O) s'))
            = pairFam Φ w u := by
          funext s'
          rcases s' with a | b <;> simp [pairFam, hp3def]
        rw [h2] at h1
        have h3 : pairFam Φ z (w + u) (Sum.inr j) = ((w + u) j : O) := rfl
        rw [h1, h3, add_apply_coe]
    rw [hleft, hright] at hax
    rw [add_apply_coe, add_apply_coe]
    exact hax
end points
end FormalGroupLaw
end ChabautyColeman
end
end

/- EllipticCurves.Mathlib.AdicFormalGroupLog -/
section
section
open MvPowerSeries IsLocalRing
namespace IsDedekindDomain.HeightOneSpectrum
variable {R : Type*} [CommRing R] [IsDedekindDomain R]
  {K : Type*} [Field K] [Algebra R K] [IsFractionRing R K] (v : HeightOneSpectrum R)
 
instance factIsAdic_adicCompletionIntegers :
    Fact (IsAdic (IsLocalRing.maximalIdeal (v.adicCompletionIntegers K))) :=
  ⟨v.isAdic_maximalIdeal_adicCompletionIntegers⟩
end IsDedekindDomain.HeightOneSpectrum
namespace ChabautyColeman
section Helpers
variable {O : Type*} [CommRing O] {ι : Type*} {K : Type*} [CommRing K] {f : O →+* K} {c : O}
end Helpers
namespace FormalGroupLaw
section ScaledFC
variable {O : Type*} [CommRing O] {ι : Type*} (Φ : FormalGroupLaw O ι) (c : O)
end ScaledFC
section Descent
variable {O : Type*} [CommRing O] {ι : Type*} [Finite ι] {K : Type*} [Field K]
  {f : O →+* K} {c : O} (Φ : FormalGroupLaw O ι)
variable [Fintype ι] [DecidableEq ι] [CharZero K]
end Descent
section MulSeries
variable {O : Type*} [CommRing O] (Φ : FormalGroupLaw O Unit)
end MulSeries
section LogMul
variable {K : Type*} [Field K] [CharZero K] (Φ : FormalGroupLaw K Unit)
end LogMul
end FormalGroupLaw
section AdicScaledLog
open IsDedekindDomain IsDedekindDomain.HeightOneSpectrum WithZero
variable {R : Type*} [CommRing R] [IsDedekindDomain R]
  {K : Type*} [Field K] [Algebra R K] [IsFractionRing R K] {v : HeightOneSpectrum R}

theorem exists_valued_eq_exp_neg {x : v.adicCompletionIntegers K}
    (hx : x ∈ maximalIdeal (v.adicCompletionIntegers K)) (hx0 : x ≠ 0) :
    ∃ e : ℕ, 1 ≤ e ∧
      Valued.v ((x : v.adicCompletionIntegers K) : v.adicCompletion K) = exp (-(e : ℤ)) := by
  have hv0 : Valued.v ((x : v.adicCompletionIntegers K) : v.adicCompletion K) ≠ 0 := by
    simpa using hx0
  obtain ⟨m, hm⟩ : ∃ m : ℤ, Valued.v ((x : v.adicCompletionIntegers K) : v.adicCompletion K)
      = exp m := ⟨_, (exp_log hv0).symm⟩
  have hle := (v.mem_maximalIdeal_pow_iff (K := K) (x := x) (n := 1)).mp (by rwa [pow_one])
  rw [hm, exp_le_exp] at hle
  push_cast at hle
  exact ⟨(-m).toNat, by lia, by rw [hm]; congr 1; lia⟩
section ScaledPackage
variable {e : ℕ} {π : v.adicCompletionIntegers K}
  {Φ : FormalGroupLaw (v.adicCompletionIntegers K) Unit}
  {lhat : MvPowerSeries Unit (v.adicCompletionIntegers K)}
end ScaledPackage
end AdicScaledLog
section EvalLayer
open MvPSeries
variable {O : Type*} [CommRing O] [IsLocalRing O] [UniformSpace O]
  [Fact (IsAdic (maximalIdeal O))]
variable [IsUniformAddGroup O] [CompleteSpace O] [T2Space O] [IsTopologicalRing O]
end EvalLayer
section AdicMulSeries
open IsDedekindDomain IsDedekindDomain.HeightOneSpectrum FormalGroupLaw
variable {R : Type*} [CommRing R] [IsDedekindDomain R]
  {K : Type*} [Field K] [Algebra R K] [IsFractionRing R K] {v : HeightOneSpectrum R}
  (Φ : FormalGroupLaw (v.adicCompletionIntegers K) Unit)
variable [CharZero K]
end AdicMulSeries
end ChabautyColeman
end
end

/- EllipticCurves.VariableChange -/
section
section
namespace WeierstrassCurve.Affine
variable {F : Type*} [Field F] (W : WeierstrassCurve F) (C : VariableChange F)
namespace Point
variable [W.IsElliptic]
lemma some_eq_some (W : WeierstrassCurve F) {x₁ x₂ y₁ y₂ : F} (hx : x₁ = x₂) (hy : y₁ = y₂)
    {h₁ : W.toAffine.Nonsingular x₁ y₁} {h₂ : W.toAffine.Nonsingular x₂ y₂} :
    (some x₁ y₁ h₁ : W.toAffine.Point) = some x₂ y₂ h₂ := by
  subst hx hy; rfl
variable [DecidableEq F]
 
def equivOfEq {V V' : WeierstrassCurve F} (h : V = V') :
    V.toAffine.Point ≃+ V'.toAffine.Point := by
  subst h; exact AddEquiv.refl _
@[simp] lemma equivOfEq_some {V V' : WeierstrassCurve F} (h : V = V') {x y : F}
    (hns : V.toAffine.Nonsingular x y) :
    equivOfEq h (some x y hns) = some x y (h ▸ hns) := by
  subst h; rfl
end Point
end WeierstrassCurve.Affine
end
end

/- EllipticCurves.WeierstrassFormalGroup.Chord -/
section
section
open ChabautyColeman PowerSeries IsDedekindDomain
namespace WeierstrassCurve
section wSeries
variable {O : Type*} [CommRing O] (W : WeierstrassCurve O)

noncomputable def wStepAt (q v : PowerSeries O) : PowerSeries O :=
  q ^ 3 + C W.a₁ * q * v + C W.a₂ * q ^ 2 * v + C W.a₃ * v ^ 2 + C W.a₄ * q * v ^ 2 +
    C W.a₆ * v ^ 3

noncomputable def wStep (w : PowerSeries O) : PowerSeries O :=
  W.wStepAt X w
lemma wStepAt_contract {q u v : PowerSeries O} (hq : X ∣ q) (hu : X ∣ u) (hv : X ∣ v)
    {k : ℕ} (h : X ^ k ∣ u - v) : X ^ (k + 1) ∣ W.wStepAt q u - W.wStepAt q v := by
  have h2 : X ^ (k + 1) ∣ u ^ 2 - v ^ 2 := by
    have : u ^ 2 - v ^ 2 = (u + v) * (u - v) := by ring
    rw [this, pow_succ, mul_comm (X ^ k)]
    exact mul_dvd_mul (dvd_add hu hv) h
  have h3 : X ^ (k + 1) ∣ u ^ 3 - v ^ 3 := by
    have : u ^ 3 - v ^ 3 = (u ^ 2 + u * v + v ^ 2) * (u - v) := by ring
    rw [this, pow_succ, mul_comm (X ^ k)]
    refine mul_dvd_mul ?_ h
    exact dvd_add (dvd_add ((hu.mul_right u).trans (by rw [pow_two])) (hu.mul_right v))
      ((hv.mul_right v).trans (by rw [pow_two]))
  have hXk : X ^ (k + 1) ∣ q * (u - v) := by
    rw [pow_succ, mul_comm (X ^ k)]
    exact mul_dvd_mul hq h
  have hstep : W.wStepAt q u - W.wStepAt q v = C W.a₁ * (q * (u - v)) +
      C W.a₂ * q * (q * (u - v)) + C W.a₃ * (u ^ 2 - v ^ 2) + C W.a₄ * q * (u ^ 2 - v ^ 2) +
      C W.a₆ * (u ^ 3 - v ^ 3) := by
    simp only [wStepAt]
    ring
  rw [hstep]
  exact dvd_add (dvd_add (dvd_add (dvd_add (hXk.mul_left _) ((hXk.mul_left _)))
    (h2.mul_left _)) (h2.mul_left _)) (h3.mul_left _)

lemma eq_of_wStepAt_fixed {q v v' : PowerSeries O} (hq : X ∣ q) (hv : X ∣ v)
    (hv' : X ∣ v') (h : v = W.wStepAt q v) (h' : v' = W.wStepAt q v') : v = v' := by
  have key (k : ℕ) : X ^ k ∣ v - v' := by
    induction k with
    | zero => simp
    | succ k ih =>
      have := W.wStepAt_contract hq hv hv' ih
      rwa [← h, ← h'] at this
  ext n
  have h0 := X_pow_dvd_iff.mp (key (n + 1)) n (by lia)
  rwa [map_sub, sub_eq_zero] at h0
lemma X_dvd_wStep {w : PowerSeries O} (hw : X ∣ w) : X ∣ W.wStep w := by
  obtain ⟨u, rfl⟩ := hw
  refine ⟨X ^ 2 + C W.a₁ * X * u + C W.a₂ * X ^ 2 * u + C W.a₃ * (X * u ^ 2) +
    C W.a₄ * X * (X * u ^ 2) + C W.a₆ * (X ^ 2 * u ^ 3), ?_⟩
  simp only [wStep, wStepAt]
  ring
lemma wStep_contract {u v : PowerSeries O} (hu : X ∣ u) (hv : X ∣ v) {k : ℕ}
    (h : X ^ k ∣ u - v) : X ^ (k + 1) ∣ W.wStep u - W.wStep v :=
  W.wStepAt_contract dvd_rfl hu hv h
lemma X_dvd_iterate (m : ℕ) : X ∣ (W.wStep)^[m] (0 : PowerSeries O) := by
  induction m with
  | zero => simp
  | succ m ih => rw [Function.iterate_succ_apply']; exact W.X_dvd_wStep ih
lemma iterate_congr (m d : ℕ) :
    X ^ m ∣ (W.wStep)^[m + d] (0 : PowerSeries O) - (W.wStep)^[m] (0 : PowerSeries O) := by
  induction m with
  | zero => simp
  | succ m ih =>
    rw [show m + 1 + d = (m + d) + 1 by ring, Function.iterate_succ_apply',
      Function.iterate_succ_apply']
    exact W.wStep_contract (W.X_dvd_iterate _) (W.X_dvd_iterate _) ih

noncomputable def wSeries : PowerSeries O :=
  PowerSeries.mk fun n ↦ coeff n ((W.wStep)^[n + 1] 0)
lemma coeff_wSeries (n : ℕ) :
    coeff n W.wSeries = coeff n ((W.wStep)^[n + 1] 0) :=
  coeff_mk _ _
lemma X_pow_dvd_wSeries_sub_iterate (m : ℕ) :
    X ^ m ∣ W.wSeries - (W.wStep)^[m] (0 : PowerSeries O) := by
  rw [X_pow_dvd_iff]
  intro k hk
  rw [map_sub, W.coeff_wSeries, sub_eq_zero]
  have h1 := W.iterate_congr (k + 1) (m - (k + 1))
  rw [show k + 1 + (m - (k + 1)) = m by lia] at h1
  have h2 := X_pow_dvd_iff.mp h1 k (by lia)
  rw [map_sub, sub_eq_zero] at h2
  exact h2.symm
lemma X_dvd_wSeries : (X : PowerSeries O) ∣ W.wSeries := by
  have h := W.X_pow_dvd_wSeries_sub_iterate 1
  rw [pow_one] at h
  have h2 := dvd_add h (W.X_dvd_iterate 1)
  rwa [sub_add_cancel] at h2
theorem wSeries_eq_wStep : W.wSeries = W.wStep W.wSeries := by
  have hX : (X : PowerSeries O) ∣ W.wSeries := W.X_dvd_wSeries
  have key (m : ℕ) : X ^ (m + 1) ∣ W.wSeries - W.wStep W.wSeries := by
    have h1 := W.X_pow_dvd_wSeries_sub_iterate (m + 1)
    have h2 : X ^ (m + 1) ∣ (W.wStep)^[m + 1] (0 : PowerSeries O) - W.wStep W.wSeries := by
      rw [Function.iterate_succ_apply']
      exact W.wStep_contract (W.X_dvd_iterate m) hX
        (dvd_sub_comm.mp (W.X_pow_dvd_wSeries_sub_iterate m))
    have := dvd_add h1 h2
    rwa [sub_add_sub_cancel] at this
  ext n
  have h := X_pow_dvd_iff.mp (key n) n (by lia)
  rwa [map_sub, sub_eq_zero] at h
lemma X_pow_three_dvd_wStep {w : PowerSeries O} (hw : X ^ 3 ∣ w) :
    X ^ 3 ∣ W.wStep w := by
  obtain ⟨u, rfl⟩ := hw
  refine ⟨1 + C W.a₁ * X * u + C W.a₂ * X ^ 2 * u + C W.a₃ * (X ^ 3 * u ^ 2) +
    C W.a₄ * (X ^ 4 * u ^ 2) + C W.a₆ * (X ^ 6 * u ^ 3), ?_⟩
  simp only [wStep, wStepAt]
  ring
theorem X_pow_three_dvd_wSeries : (X : PowerSeries O) ^ 3 ∣ W.wSeries := by
  have h3 : X ^ 3 ∣ (W.wStep)^[3] (0 : PowerSeries O) := by
    have h0 : (X : PowerSeries O) ^ 3 ∣ 0 := dvd_zero _
    exact W.X_pow_three_dvd_wStep (W.X_pow_three_dvd_wStep (W.X_pow_three_dvd_wStep h0))
  have h := dvd_add (W.X_pow_dvd_wSeries_sub_iterate 3) h3
  rwa [sub_add_cancel] at h
@[simp]
theorem constantCoeff_wSeries : constantCoeff W.wSeries = 0 :=
  X_dvd_iff.mp (dvd_trans (dvd_pow_self X three_ne_zero) W.X_pow_three_dvd_wSeries)
theorem coeff_wSeries_of_lt {k : ℕ} (hk : k < 3) : coeff k W.wSeries = 0 :=
  X_pow_dvd_iff.mp W.X_pow_three_dvd_wSeries k hk
@[simp]
theorem coeff_wSeries_three : coeff 3 W.wSeries = 1 := by
  have h4 : X ^ 4 ∣ W.wStep W.wSeries - X ^ 3 := by
    obtain ⟨u, hu⟩ := W.X_pow_three_dvd_wSeries
    refine ⟨C W.a₁ * u + C W.a₂ * (X * u) + C W.a₃ * (X ^ 2 * u ^ 2) +
      C W.a₄ * (X ^ 3 * u ^ 2) + C W.a₆ * (X ^ 5 * u ^ 3), ?_⟩
    rw [hu]
    simp only [wStep, wStepAt]
    ring
  have h0 : coeff 3 (W.wStep W.wSeries - X ^ 3) = 0 := X_pow_dvd_iff.mp h4 3 (by lia)
  rw [map_sub, coeff_X_pow, if_pos rfl, sub_eq_zero] at h0
  rw [W.wSeries_eq_wStep, h0]

theorem wSeries_eq :
    W.wSeries = X ^ 3 + PowerSeries.C W.a₁ * X * W.wSeries +
      PowerSeries.C W.a₂ * X ^ 2 * W.wSeries + PowerSeries.C W.a₃ * W.wSeries ^ 2 +
      PowerSeries.C W.a₄ * X * W.wSeries ^ 2 + PowerSeries.C W.a₆ * W.wSeries ^ 3 :=
  W.wSeries_eq_wStep
 
noncomputable def vSeries : PowerSeries O :=
  (W.X_pow_three_dvd_wSeries).choose
lemma wSeries_eq_X_pow_three_mul : W.wSeries = X ^ 3 * W.vSeries :=
  (W.X_pow_three_dvd_wSeries).choose_spec
@[simp]
lemma constantCoeff_vSeries : constantCoeff W.vSeries = 1 := by
  have h := congrArg (coeff 3) W.wSeries_eq_X_pow_three_mul
  rw [W.coeff_wSeries_three, show (3 : ℕ) = 0 + 3 from rfl,
    PowerSeries.coeff_X_pow_mul] at h
  rw [← PowerSeries.coeff_zero_eq_constantCoeff_apply]
  exact h.symm
section Chord
open MvPowerSeries
lemma coeff_rename_single {τ : Type*} [DecidableEq τ] (s : τ) (w : PowerSeries O)
    (d : τ →₀ ℕ) :
    MvPowerSeries.coeff d (MvPowerSeries.rename (fun _ : Unit ↦ s) w) =
      if d = Finsupp.single s (d s) then PowerSeries.coeff (d s) w else 0 := by
  split_ifs with h
  · have hd : d = Finsupp.embDomain (⟨fun _ ↦ s, fun _ _ _ ↦ rfl⟩ : Unit ↪ τ)
        (Finsupp.single () (d s)) := by
      rw [Finsupp.embDomain_single]
      exact h
    have h1 := coeff_embDomain_rename (⟨fun _ ↦ s, fun _ _ _ ↦ rfl⟩ : Unit ↪ τ) w
      (Finsupp.single () (d s))
    rw [← hd] at h1
    exact h1
  · refine coeff_rename_eq_zero _ _ fun ⟨y, hy⟩ ↦ h ?_
    rw [← hy, Finsupp.unique_single y, Finsupp.mapDomain_single]
    simp
variable (W : WeierstrassCurve O)

noncomputable def slopeSeries : MvPowerSeries (Unit ⊕ Unit) O :=
  fun d ↦ PowerSeries.coeff (d (Sum.inl ()) + d (Sum.inr ()) + 1) W.wSeries
lemma coeff_slopeSeries (d : Unit ⊕ Unit →₀ ℕ) :
    MvPowerSeries.coeff d W.slopeSeries =
      PowerSeries.coeff (d (Sum.inl ()) + d (Sum.inr ()) + 1) W.wSeries :=
  rfl
lemma eq_single_iff (d : Unit ⊕ Unit →₀ ℕ) :
    d = Finsupp.single (Sum.inr ()) (d (Sum.inr ())) ↔ d (Sum.inl ()) = 0 := by
  constructor
  · intro h
    rw [h]
    simp
  · intro h
    ext t
    match t with
    | .inl () => simpa using h
    | .inr () => simp
lemma eq_single_iff' (d : Unit ⊕ Unit →₀ ℕ) :
    d = Finsupp.single (Sum.inl ()) (d (Sum.inl ())) ↔ d (Sum.inr ()) = 0 := by
  constructor
  · intro h
    rw [h]
    simp
  · intro h
    ext t
    match t with
    | .inl () => simp
    | .inr () => simpa using h

theorem slopeSeries_mul_sub :
    W.slopeSeries * (MvPowerSeries.X (Sum.inr ()) - MvPowerSeries.X (Sum.inl ())) =
      MvPowerSeries.rename (fun _ ↦ Sum.inr ()) W.wSeries -
        MvPowerSeries.rename (fun _ ↦ Sum.inl ()) W.wSeries := by
  ext d
  set i := d (Sum.inl ()) with hi
  set j := d (Sum.inr ()) with hj
  rw [mul_sub, map_sub, map_sub,
    show (MvPowerSeries.X (Sum.inr ()) : MvPowerSeries (Unit ⊕ Unit) O) =
      MvPowerSeries.monomial (Finsupp.single (Sum.inr ()) 1) 1 from rfl,
    show (MvPowerSeries.X (Sum.inl ()) : MvPowerSeries (Unit ⊕ Unit) O) =
      MvPowerSeries.monomial (Finsupp.single (Sum.inl ()) 1) 1 from rfl,
    MvPowerSeries.coeff_mul_monomial, MvPowerSeries.coeff_mul_monomial,
    coeff_rename_single, coeff_rename_single]
  have hsubr : 1 ≤ j → (d - Finsupp.single (Sum.inr ()) 1 : Unit ⊕ Unit →₀ ℕ) (Sum.inl ()) +
      (d - Finsupp.single (Sum.inr ()) 1 : Unit ⊕ Unit →₀ ℕ) (Sum.inr ()) + 1 = i + j := by
    intro h
    simp only [Finsupp.tsub_apply, Finsupp.single_apply]
    simp
    lia
  have hsubl : 1 ≤ i → (d - Finsupp.single (Sum.inl ()) 1 : Unit ⊕ Unit →₀ ℕ) (Sum.inl ()) +
      (d - Finsupp.single (Sum.inl ()) 1 : Unit ⊕ Unit →₀ ℕ) (Sum.inr ()) + 1 = i + j := by
    intro h
    simp only [Finsupp.tsub_apply, Finsupp.single_apply]
    simp
    lia
  simp only [mul_one, eq_single_iff, eq_single_iff', Finsupp.single_le_iff, coeff_slopeSeries]
  split_ifs with h1 h2 h3 h4 <;>
    grind

noncomputable def interceptSeries : MvPowerSeries (Unit ⊕ Unit) O :=
  MvPowerSeries.rename (fun _ ↦ Sum.inl ()) W.wSeries -
    W.slopeSeries * MvPowerSeries.X (Sum.inl ())
 
theorem interceptSeries_eq :
    W.interceptSeries = MvPowerSeries.rename (fun _ ↦ Sum.inr ()) W.wSeries -
      W.slopeSeries * MvPowerSeries.X (Sum.inr ()) := by
  have h := W.slopeSeries_mul_sub
  simp only [interceptSeries]
  linear_combination h
@[simp]
lemma constantCoeff_slopeSeries : constantCoeff W.slopeSeries = 0 := by
  have h : constantCoeff W.slopeSeries =
      PowerSeries.coeff ((0 : Unit ⊕ Unit →₀ ℕ) (Sum.inl ()) + (0 : Unit ⊕ Unit →₀ ℕ)
        (Sum.inr ()) + 1) W.wSeries :=
    W.coeff_slopeSeries 0
  rw [h]
  exact W.coeff_wSeries_of_lt (by simp)
lemma constantCoeff_wSeries_mv : MvPowerSeries.constantCoeff W.wSeries = 0 :=
  W.constantCoeff_wSeries
@[simp]
lemma constantCoeff_interceptSeries : constantCoeff W.interceptSeries = 0 := by
  simp [interceptSeries, constantCoeff_rename, W.constantCoeff_wSeries_mv]

noncomputable def thirdRootSeries : MvPowerSeries (Unit ⊕ Unit) O :=
  -MvPowerSeries.X (Sum.inl ()) - MvPowerSeries.X (Sum.inr ()) -
    (MvPowerSeries.C W.a₁ * W.slopeSeries + MvPowerSeries.C W.a₂ * W.interceptSeries +
        MvPowerSeries.C W.a₃ * W.slopeSeries ^ 2 +
        2 * MvPowerSeries.C W.a₄ * W.slopeSeries * W.interceptSeries +
        3 * MvPowerSeries.C W.a₆ * W.slopeSeries ^ 2 * W.interceptSeries) *
      MvPowerSeries.invOfUnit (1 + MvPowerSeries.C W.a₂ * W.slopeSeries +
        MvPowerSeries.C W.a₄ * W.slopeSeries ^ 2 + MvPowerSeries.C W.a₆ * W.slopeSeries ^ 3) 1
@[simp]
lemma constantCoeff_thirdRootSeries : constantCoeff W.thirdRootSeries = 0 := by
  simp [thirdRootSeries]

noncomputable def uSeries : PowerSeries O :=
  1 - PowerSeries.C W.a₁ * PowerSeries.X - PowerSeries.C W.a₃ * W.wSeries
@[simp]
lemma constantCoeff_uSeries : PowerSeries.constantCoeff W.uSeries = 1 := by
  simp [uSeries]
lemma mul_invOfUnit_uSeries : W.uSeries * PowerSeries.invOfUnit W.uSeries 1 = 1 :=
  PowerSeries.mul_invOfUnit _ _ (by simp)
lemma isUnit_uSeries : IsUnit W.uSeries :=
  IsUnit.of_mul_eq_one _ W.mul_invOfUnit_uSeries

noncomputable def inverseSeries : PowerSeries O :=
  -(PowerSeries.X * PowerSeries.invOfUnit W.uSeries 1)
@[simp]
lemma constantCoeff_inverseSeries : PowerSeries.constantCoeff W.inverseSeries = 0 := by
  simp [inverseSeries]
lemma hasSubst_inverseSeries : PowerSeries.HasSubst (W.inverseSeries : PowerSeries O) :=
  PowerSeries.HasSubst.of_constantCoeff_zero' W.constantCoeff_inverseSeries
lemma subst_one_eq (a : PowerSeries O) (ha : PowerSeries.HasSubst a) :
    PowerSeries.subst a (1 : PowerSeries O) = 1 := by
  rw [← PowerSeries.coe_substAlgHom ha, map_one]
lemma subst_inverseSeries_invOfUnit {D : PowerSeries O}
    (hD : PowerSeries.constantCoeff D = 1)
    (hD' : PowerSeries.constantCoeff (PowerSeries.subst W.inverseSeries D) = 1) :
    PowerSeries.subst W.inverseSeries (PowerSeries.invOfUnit D 1) =
      PowerSeries.invOfUnit (PowerSeries.subst W.inverseSeries D) 1 := by
  have h1 : PowerSeries.subst W.inverseSeries D *
      PowerSeries.subst W.inverseSeries (PowerSeries.invOfUnit D 1) = 1 := by
    rw [← PowerSeries.subst_mul W.hasSubst_inverseSeries,
      PowerSeries.mul_invOfUnit _ 1 (by rw [hD]; rfl), subst_one_eq _ W.hasSubst_inverseSeries]
  have h2 : PowerSeries.subst W.inverseSeries D *
      PowerSeries.invOfUnit (PowerSeries.subst W.inverseSeries D) 1 = 1 :=
    PowerSeries.mul_invOfUnit _ 1 (by rw [hD']; rfl)
  calc PowerSeries.subst W.inverseSeries (PowerSeries.invOfUnit D 1)
      = PowerSeries.subst W.inverseSeries (PowerSeries.invOfUnit D 1) *
        (PowerSeries.subst W.inverseSeries D *
          PowerSeries.invOfUnit (PowerSeries.subst W.inverseSeries D) 1) := by
        rw [h2, mul_one]
    _ = (PowerSeries.subst W.inverseSeries D *
          PowerSeries.subst W.inverseSeries (PowerSeries.invOfUnit D 1)) *
        PowerSeries.invOfUnit (PowerSeries.subst W.inverseSeries D) 1 := by ring
    _ = PowerSeries.invOfUnit (PowerSeries.subst W.inverseSeries D) 1 := by rw [h1, one_mul]
lemma subst_inverseSeries_wStepAt (v : PowerSeries O) :
    PowerSeries.subst W.inverseSeries (W.wStepAt X v) =
      W.wStepAt W.inverseSeries (PowerSeries.subst W.inverseSeries v) := by
  simp only [wStepAt, PowerSeries.subst_add W.hasSubst_inverseSeries,
    PowerSeries.subst_mul W.hasSubst_inverseSeries,
    PowerSeries.subst_pow W.hasSubst_inverseSeries, PowerSeries.subst_C,
    PowerSeries.subst_X W.hasSubst_inverseSeries]
  rfl

theorem subst_inverseSeries_wSeries :
    PowerSeries.subst W.inverseSeries W.wSeries =
      -(W.wSeries * PowerSeries.invOfUnit W.uSeries 1) := by
  refine W.eq_of_wStepAt_fixed (q := W.inverseSeries)
    ⟨-(PowerSeries.invOfUnit W.uSeries 1), by rw [inverseSeries]; ring⟩ ?_ ?_ ?_ ?_
  · 
    rw [PowerSeries.X_dvd_iff]
    exact MvPowerSeries.constantCoeff_subst_eq_zero W.hasSubst_inverseSeries.const
      (fun _ ↦ W.constantCoeff_inverseSeries) W.constantCoeff_wSeries
  · exact ((PowerSeries.X_dvd_iff.mpr W.constantCoeff_wSeries).mul_right _).neg_right
  · 
    conv_lhs => rw [W.wSeries_eq_wStep]
    rw [show W.wStep W.wSeries = W.wStepAt X W.wSeries from rfl,
      W.subst_inverseSeries_wStepAt]
  · 
    refine (W.isUnit_uSeries.pow 3).mul_left_cancel ?_
    have h1 := W.mul_invOfUnit_uSeries
    have h2 := W.wSeries_eq_wStep
    rw [show W.wStep W.wSeries = W.wStepAt X W.wSeries from rfl, wStepAt] at h2
    simp only [wStepAt, inverseSeries, uSeries] at h1 h2 ⊢
    grobner
 
theorem subst_inverseSeries_uSeries :
    PowerSeries.subst W.inverseSeries W.uSeries = PowerSeries.invOfUnit W.uSeries 1 := by
  refine W.isUnit_uSeries.mul_left_cancel ?_
  rw [W.mul_invOfUnit_uSeries]
  simp only [uSeries, PowerSeries.subst_sub W.hasSubst_inverseSeries,
    PowerSeries.subst_mul W.hasSubst_inverseSeries, PowerSeries.subst_C,
    PowerSeries.subst_X W.hasSubst_inverseSeries, subst_one_eq _ W.hasSubst_inverseSeries,
    W.subst_inverseSeries_wSeries]
  have h1 := W.mul_invOfUnit_uSeries
  simp only [uSeries, inverseSeries,
    show (MvPowerSeries.C : O →+* MvPowerSeries Unit O) = PowerSeries.C from rfl] at h1 ⊢
  grobner
 
theorem subst_inverseSeries_self :
    PowerSeries.subst W.inverseSeries W.inverseSeries = PowerSeries.X := by
  have hinv := W.subst_inverseSeries_invOfUnit (D := W.uSeries) (by simp)
    (by rw [W.subst_inverseSeries_uSeries]
        simp [PowerSeries.constantCoeff_invOfUnit])
  have hdouble : PowerSeries.invOfUnit (PowerSeries.invOfUnit W.uSeries 1) 1 = W.uSeries := by
    have h1 : PowerSeries.invOfUnit W.uSeries 1 * W.uSeries = 1 := by
      rw [mul_comm]
      exact W.mul_invOfUnit_uSeries
    have h2 : PowerSeries.invOfUnit W.uSeries 1 *
        PowerSeries.invOfUnit (PowerSeries.invOfUnit W.uSeries 1) 1 = 1 :=
      PowerSeries.mul_invOfUnit _ 1 (by simp [PowerSeries.constantCoeff_invOfUnit])
    calc PowerSeries.invOfUnit (PowerSeries.invOfUnit W.uSeries 1) 1
        = (PowerSeries.invOfUnit W.uSeries 1 * W.uSeries) *
          PowerSeries.invOfUnit (PowerSeries.invOfUnit W.uSeries 1) 1 := by rw [h1, one_mul]
      _ = W.uSeries * (PowerSeries.invOfUnit W.uSeries 1 *
          PowerSeries.invOfUnit (PowerSeries.invOfUnit W.uSeries 1) 1) := by ring
      _ = W.uSeries := by rw [h2, mul_one]
  have hexp : PowerSeries.subst W.inverseSeries (-(PowerSeries.X *
      PowerSeries.invOfUnit W.uSeries 1)) = -(W.inverseSeries *
      PowerSeries.subst W.inverseSeries (PowerSeries.invOfUnit W.uSeries 1)) := by
    rw [← PowerSeries.coe_substAlgHom W.hasSubst_inverseSeries, map_neg, map_mul,
      PowerSeries.coe_substAlgHom W.hasSubst_inverseSeries,
      PowerSeries.subst_X W.hasSubst_inverseSeries]
  rw [show PowerSeries.subst W.inverseSeries W.inverseSeries = -(W.inverseSeries *
      PowerSeries.subst W.inverseSeries (PowerSeries.invOfUnit W.uSeries 1)) from hexp,
    hinv, W.subst_inverseSeries_uSeries, hdouble, inverseSeries]
  linear_combination (PowerSeries.X : PowerSeries O) * W.mul_invOfUnit_uSeries

noncomputable def addSeries : MvPowerSeries (Unit ⊕ Unit) O :=
  MvPowerSeries.subst (fun _ : Unit ↦ W.thirdRootSeries) W.inverseSeries
lemma hasSubst_thirdRootSeries :
    MvPowerSeries.HasSubst (fun _ : Unit ↦ W.thirdRootSeries) :=
  MvPowerSeries.hasSubst_of_constantCoeff_zero fun _ ↦ W.constantCoeff_thirdRootSeries
@[simp]
lemma constantCoeff_addSeries :
    MvPowerSeries.constantCoeff W.addSeries = 0 :=
  MvPowerSeries.constantCoeff_subst_eq_zero W.hasSubst_thirdRootSeries
    (fun _ ↦ W.constantCoeff_thirdRootSeries) W.constantCoeff_inverseSeries
lemma rename_swap_slopeSeries :
    MvPowerSeries.rename Sum.swap W.slopeSeries = W.slopeSeries := by
  ext d
  have hd : d = Finsupp.embDomain (Equiv.sumComm Unit Unit).toEmbedding
      (Finsupp.mapDomain Sum.swap d) := by
    ext t
    rw [Finsupp.embDomain_eq_mapDomain, ← Finsupp.mapDomain_comp]
    have : (⇑(Equiv.sumComm Unit Unit).toEmbedding ∘ Sum.swap) = id := by
      ext s
      match s with
      | .inl () => rfl
      | .inr () => rfl
    rw [this, Finsupp.mapDomain_id]
  calc MvPowerSeries.coeff d (MvPowerSeries.rename Sum.swap W.slopeSeries)
      = MvPowerSeries.coeff (Finsupp.mapDomain Sum.swap d) W.slopeSeries := by
        conv_lhs => rw [hd]
        exact coeff_embDomain_rename _ _ _
    _ = MvPowerSeries.coeff d W.slopeSeries := by
        rw [W.coeff_slopeSeries, W.coeff_slopeSeries]
        have h1 : Finsupp.mapDomain Sum.swap d (Sum.inl ()) = d (Sum.inr ()) := by
          rw [show (Sum.inl () : Unit ⊕ Unit) = (Equiv.sumComm Unit Unit) (Sum.inr ()) from rfl]
          exact Finsupp.mapDomain_equiv_apply (f := Equiv.sumComm Unit Unit) d _ |>.trans (by rfl)
        have h2 : Finsupp.mapDomain Sum.swap d (Sum.inr ()) = d (Sum.inl ()) := by
          rw [show (Sum.inr () : Unit ⊕ Unit) = (Equiv.sumComm Unit Unit) (Sum.inl ()) from rfl]
          exact Finsupp.mapDomain_equiv_apply (f := Equiv.sumComm Unit Unit) d _ |>.trans (by rfl)
        rw [h1, h2, add_comm (d (Sum.inr ()))]
lemma rename_swap_interceptSeries :
    MvPowerSeries.rename Sum.swap W.interceptSeries = W.interceptSeries := by
  rw [interceptSeries, map_sub, map_mul, W.rename_swap_slopeSeries, rename_X, rename_rename]
  exact W.interceptSeries_eq.symm
lemma rename_swap_invOfUnit {D : MvPowerSeries (Unit ⊕ Unit) O}
    (hD : MvPowerSeries.constantCoeff D = 1) :
    MvPowerSeries.rename Sum.swap (MvPowerSeries.invOfUnit D 1) =
      MvPowerSeries.invOfUnit (MvPowerSeries.rename Sum.swap D) 1 := by
  have h1 : MvPowerSeries.rename Sum.swap D *
      MvPowerSeries.rename Sum.swap (MvPowerSeries.invOfUnit D 1) = 1 := by
    rw [← map_mul, MvPowerSeries.mul_invOfUnit D 1 (by rw [hD]; rfl), map_one]
  have h2 : MvPowerSeries.rename Sum.swap D *
      MvPowerSeries.invOfUnit (MvPowerSeries.rename Sum.swap D) 1 =
      1 :=
    MvPowerSeries.mul_invOfUnit _ 1 (by rw [constantCoeff_rename, hD]; rfl)
  calc MvPowerSeries.rename Sum.swap (MvPowerSeries.invOfUnit D 1)
      = MvPowerSeries.rename Sum.swap (MvPowerSeries.invOfUnit D 1) *
        (MvPowerSeries.rename Sum.swap D *
          MvPowerSeries.invOfUnit (MvPowerSeries.rename Sum.swap D) 1) := by rw [h2, mul_one]
    _ = (MvPowerSeries.rename Sum.swap D *
          MvPowerSeries.rename Sum.swap (MvPowerSeries.invOfUnit D 1)) *
        MvPowerSeries.invOfUnit (MvPowerSeries.rename Sum.swap D) 1 := by ring
    _ = MvPowerSeries.invOfUnit (MvPowerSeries.rename Sum.swap D) 1 := by rw [h1, one_mul]
lemma rename_swap_thirdRootSeries :
    MvPowerSeries.rename Sum.swap W.thirdRootSeries = W.thirdRootSeries := by
  have hD : MvPowerSeries.constantCoeff (1 + MvPowerSeries.C W.a₂ * W.slopeSeries +
      MvPowerSeries.C W.a₄ * W.slopeSeries ^ 2 + MvPowerSeries.C W.a₆ * W.slopeSeries ^ 3) =
      1 := by
    simp
  rw [thirdRootSeries]
  simp only [map_sub, map_neg, map_add, map_mul, map_pow, map_one, map_ofNat, rename_X,
    MvPowerSeries.rename_C, W.rename_swap_slopeSeries, W.rename_swap_interceptSeries,
    rename_swap_invOfUnit hD]
  simp only [show Sum.swap (Sum.inl () : Unit ⊕ Unit) = Sum.inr () from rfl,
    show Sum.swap (Sum.inr () : Unit ⊕ Unit) = Sum.inl () from rfl]
  ring
lemma rename_swap_addSeries :
    MvPowerSeries.rename Sum.swap W.addSeries = W.addSeries := by
  rw [addSeries, rename_eq_subst,
    MvPowerSeries.subst_comp_subst_apply W.hasSubst_thirdRootSeries (HasSubst.X_comp _)]
  congr 1
  funext u
  rw [← rename_eq_subst, W.rename_swap_thirdRootSeries]
section AddZero
lemma hasSubst_unitR :
    MvPowerSeries.HasSubst
      (Sum.elim MvPowerSeries.X (fun _ ↦ 0) : Unit ⊕ Unit → MvPowerSeries Unit O) :=
  MvPowerSeries.hasSubst_of_constantCoeff_zero (by rintro (j | j) <;> simp)
lemma subst_unitR_renameL :
    MvPowerSeries.subst (Sum.elim MvPowerSeries.X fun _ ↦ 0 : Unit ⊕ Unit → MvPowerSeries Unit O)
      (MvPowerSeries.rename (fun _ ↦ Sum.inl ()) W.wSeries) = W.wSeries := by
  rw [MvPowerSeries.rename_eq_subst,
    MvPowerSeries.subst_comp_subst_apply (MvPowerSeries.HasSubst.X_comp _) hasSubst_unitR]
  have hX : (fun u : Unit ↦ MvPowerSeries.subst
      (Sum.elim MvPowerSeries.X fun _ ↦ 0 : Unit ⊕ Unit → MvPowerSeries Unit O)
      ((MvPowerSeries.X ∘ fun _ ↦ Sum.inl () : Unit → MvPowerSeries (Unit ⊕ Unit) O) u)) =
      MvPowerSeries.X := by
    funext u
    rw [Function.comp_apply, MvPowerSeries.subst_X hasSubst_unitR]
    rfl
  rw [hX, ← MvPowerSeries.map_algebraMap_eq_subst_X]
  have : algebraMap O O = RingHom.id O := rfl
  rw [this]
  exact congrFun (congrArg _ (MvPowerSeries.map_id)) W.wSeries
lemma subst_unitR_renameR :
    MvPowerSeries.subst (Sum.elim MvPowerSeries.X fun _ ↦ 0 : Unit ⊕ Unit → MvPowerSeries Unit O)
      (MvPowerSeries.rename (fun _ ↦ Sum.inr ()) W.wSeries) = 0 := by
  rw [MvPowerSeries.rename_eq_subst,
    MvPowerSeries.subst_comp_subst_apply (MvPowerSeries.HasSubst.X_comp _) hasSubst_unitR]
  have hX : (fun u : Unit ↦ MvPowerSeries.subst
      (Sum.elim MvPowerSeries.X fun _ ↦ 0 : Unit ⊕ Unit → MvPowerSeries Unit O)
      ((MvPowerSeries.X ∘ fun _ ↦ Sum.inr () : Unit → MvPowerSeries (Unit ⊕ Unit) O) u)) =
      fun _ ↦ 0 := by
    funext u
    rw [Function.comp_apply, MvPowerSeries.subst_X hasSubst_unitR]
    rfl
  rw [hX]
  exact MvPowerSeries.subst_zero_of_constantCoeff_zero W.constantCoeff_wSeries
lemma X_mul_subst_unitR_slopeSeries :
    (PowerSeries.X : PowerSeries O) *
      MvPowerSeries.subst (Sum.elim MvPowerSeries.X fun _ ↦ 0) W.slopeSeries = W.wSeries := by
  have h := congrArg (MvPowerSeries.subst
    (Sum.elim MvPowerSeries.X (fun _ ↦ 0) : Unit ⊕ Unit → MvPowerSeries Unit O))
    W.slopeSeries_mul_sub
  rw [← MvPowerSeries.coe_substAlgHom hasSubst_unitR] at h
  simp only [map_mul, map_sub] at h
  simp only [MvPowerSeries.coe_substAlgHom hasSubst_unitR, W.subst_unitR_renameL,
    W.subst_unitR_renameR, MvPowerSeries.subst_X hasSubst_unitR] at h
  have h1 : (Sum.elim MvPowerSeries.X fun _ ↦ 0 : Unit ⊕ Unit → MvPowerSeries Unit O)
      (Sum.inr ()) = 0 := rfl
  have h2 : (Sum.elim MvPowerSeries.X fun _ ↦ 0 : Unit ⊕ Unit → MvPowerSeries Unit O)
      (Sum.inl ()) = PowerSeries.X := rfl
  rw [h1, h2] at h
  linear_combination -h
lemma subst_unitR_interceptSeries :
    MvPowerSeries.subst (Sum.elim MvPowerSeries.X fun _ ↦ 0 : Unit ⊕ Unit → MvPowerSeries Unit O)
      W.interceptSeries = 0 := by
  rw [interceptSeries, ← MvPowerSeries.coe_substAlgHom hasSubst_unitR, map_sub, map_mul]
  simp only [MvPowerSeries.coe_substAlgHom hasSubst_unitR, W.subst_unitR_renameL,
    MvPowerSeries.subst_X hasSubst_unitR]
  have h2 : (Sum.elim MvPowerSeries.X fun _ ↦ 0 : Unit ⊕ Unit → MvPowerSeries Unit O)
      (Sum.inl ()) = PowerSeries.X := rfl
  rw [h2]
  linear_combination -W.X_mul_subst_unitR_slopeSeries
lemma ringHom_invOfUnit {O' : Type*} [CommRing O'] {σ' τ' : Type*} {F : Type*}
    [FunLike F (MvPowerSeries σ' O) (MvPowerSeries τ' O')]
    [RingHomClass F (MvPowerSeries σ' O) (MvPowerSeries τ' O')] (φ : F)
    {D : MvPowerSeries σ' O} (hD : MvPowerSeries.constantCoeff D = 1)
    (hD' : MvPowerSeries.constantCoeff (φ D) = 1) :
    φ (MvPowerSeries.invOfUnit D 1) = MvPowerSeries.invOfUnit (φ D) 1 := by
  have h1 : φ D * φ (MvPowerSeries.invOfUnit D 1) = 1 := by
    rw [← map_mul, MvPowerSeries.mul_invOfUnit D 1 (by rw [hD]; rfl), map_one]
  have h2 : φ D * MvPowerSeries.invOfUnit (φ D) 1 = 1 :=
    MvPowerSeries.mul_invOfUnit _ 1 (by rw [hD']; rfl)
  calc φ (MvPowerSeries.invOfUnit D 1)
      = φ (MvPowerSeries.invOfUnit D 1) * (φ D * MvPowerSeries.invOfUnit (φ D) 1) := by
        rw [h2, mul_one]
    _ = (φ D * φ (MvPowerSeries.invOfUnit D 1)) * MvPowerSeries.invOfUnit (φ D) 1 := by ring
    _ = MvPowerSeries.invOfUnit (φ D) 1 := by rw [h1, one_mul]
 
theorem subst_unitR_thirdRootSeries :
    MvPowerSeries.subst (Sum.elim MvPowerSeries.X fun _ ↦ 0 : Unit ⊕ Unit → MvPowerSeries Unit O)
      W.thirdRootSeries = W.inverseSeries := by
  set L : PowerSeries O :=
    MvPowerSeries.subst (Sum.elim MvPowerSeries.X fun _ ↦ 0 : Unit ⊕ Unit → MvPowerSeries Unit O)
      W.slopeSeries with hL
  have hXL : PowerSeries.X * L = W.wSeries := W.X_mul_subst_unitR_slopeSeries
  
  have hLfix : L = PowerSeries.X ^ 2 + PowerSeries.C W.a₁ * PowerSeries.X * L +
      PowerSeries.C W.a₂ * PowerSeries.X ^ 2 * L + PowerSeries.C W.a₃ * PowerSeries.X * L ^ 2 +
      PowerSeries.C W.a₄ * PowerSeries.X ^ 2 * L ^ 2 +
      PowerSeries.C W.a₆ * PowerSeries.X ^ 2 * L ^ 3 := by
    refine PowerSeries.X_mul_cancel ?_
    rw [hXL]
    conv_lhs => rw [W.wSeries_eq]
    rw [← hXL]
    ring
  have hL0 : PowerSeries.constantCoeff L = 0 := by
    have := congrArg PowerSeries.constantCoeff hLfix
    simpa [pow_two] using this
  
  set D : MvPowerSeries (Unit ⊕ Unit) O := 1 + MvPowerSeries.C W.a₂ * W.slopeSeries +
    MvPowerSeries.C W.a₄ * W.slopeSeries ^ 2 + MvPowerSeries.C W.a₆ * W.slopeSeries ^ 3 with hD
  have hDsub : MvPowerSeries.subst
      (Sum.elim MvPowerSeries.X fun _ ↦ 0 : Unit ⊕ Unit → MvPowerSeries Unit O) D =
      1 + PowerSeries.C W.a₂ * L + PowerSeries.C W.a₄ * L ^ 2 + PowerSeries.C W.a₆ * L ^ 3 := by
    rw [hD, ← MvPowerSeries.coe_substAlgHom hasSubst_unitR]
    simp only [map_add, map_mul, map_pow, map_one]
    rw [MvPowerSeries.coe_substAlgHom hasSubst_unitR]
    simp only [MvPowerSeries.subst_C,
      show (MvPowerSeries.C : O →+* MvPowerSeries Unit O) = PowerSeries.C from rfl]
    rfl
  have hD1 : MvPowerSeries.constantCoeff D = 1 := by simp [hD]
  have hD1' : PowerSeries.constantCoeff
      (1 + PowerSeries.C W.a₂ * L + PowerSeries.C W.a₄ * L ^ 2 +
        PowerSeries.C W.a₆ * L ^ 3) = 1 := by
    simp [hL0]
  have hInv : MvPowerSeries.subst
      (Sum.elim MvPowerSeries.X fun _ ↦ 0 : Unit ⊕ Unit → MvPowerSeries Unit O)
      (MvPowerSeries.invOfUnit D 1) =
      MvPowerSeries.invOfUnit (1 + PowerSeries.C W.a₂ * L + PowerSeries.C W.a₄ * L ^ 2 +
        PowerSeries.C W.a₆ * L ^ 3) 1 := by
    have h := ringHom_invOfUnit (O' := O) (MvPowerSeries.substAlgHom hasSubst_unitR) hD1
      (by rw [MvPowerSeries.coe_substAlgHom, hDsub]; exact hD1')
    rwa [MvPowerSeries.coe_substAlgHom, hDsub] at h
  
  have hexp : MvPowerSeries.subst
      (Sum.elim MvPowerSeries.X fun _ ↦ 0 : Unit ⊕ Unit → MvPowerSeries Unit O)
      W.thirdRootSeries = -PowerSeries.X -
      (PowerSeries.C W.a₁ * L + PowerSeries.C W.a₃ * L ^ 2) *
        MvPowerSeries.invOfUnit (1 + PowerSeries.C W.a₂ * L + PowerSeries.C W.a₄ * L ^ 2 +
          PowerSeries.C W.a₆ * L ^ 3) 1 := by
    rw [thirdRootSeries, ← hD, ← MvPowerSeries.coe_substAlgHom hasSubst_unitR]
    simp only [map_sub, map_neg, map_add, map_mul, map_pow, map_ofNat]
    rw [MvPowerSeries.coe_substAlgHom hasSubst_unitR]
    simp only [MvPowerSeries.subst_C, MvPowerSeries.subst_X hasSubst_unitR, hInv,
      W.subst_unitR_interceptSeries,
      show (MvPowerSeries.C : O →+* MvPowerSeries Unit O) = PowerSeries.C from rfl]
    have h1 : (Sum.elim MvPowerSeries.X fun _ ↦ 0 : Unit ⊕ Unit → MvPowerSeries Unit O)
        (Sum.inr ()) = 0 := rfl
    have h2 : (Sum.elim MvPowerSeries.X fun _ ↦ 0 : Unit ⊕ Unit → MvPowerSeries Unit O)
        (Sum.inl ()) = PowerSeries.X := rfl
    rw [h1, h2]
    ring
  rw [hexp]
  
  set d : PowerSeries O := MvPowerSeries.invOfUnit (1 + PowerSeries.C W.a₂ * L +
    PowerSeries.C W.a₄ * L ^ 2 + PowerSeries.C W.a₆ * L ^ 3) 1 with hd
  have hUnit2 : (1 + PowerSeries.C W.a₂ * L + PowerSeries.C W.a₄ * L ^ 2 +
      PowerSeries.C W.a₆ * L ^ 3) * d = 1 :=
    MvPowerSeries.mul_invOfUnit _ 1 (by exact_mod_cast hD1')
  have hUnit1 := W.mul_invOfUnit_uSeries
  clear_value L d
  refine (W.isUnit_uSeries.mul (IsUnit.of_mul_eq_one _ hUnit2)).mul_left_cancel ?_
  rw [inverseSeries]
  simp only [uSeries] at hUnit1 ⊢
  rw [← hXL] at hUnit1 ⊢
  linear_combination ((1 + PowerSeries.C W.a₂ * L + PowerSeries.C W.a₄ * L ^ 2 +
      PowerSeries.C W.a₆ * L ^ 3) * PowerSeries.X) * hUnit1 -
    ((1 - PowerSeries.C W.a₁ * PowerSeries.X - PowerSeries.C W.a₃ * (PowerSeries.X * L)) *
      (PowerSeries.C W.a₁ * L + PowerSeries.C W.a₃ * L ^ 2)) * hUnit2 -
    (PowerSeries.C W.a₁ + PowerSeries.C W.a₃ * L) * hLfix

theorem subst_unitR_addSeries :
    MvPowerSeries.subst (Sum.elim MvPowerSeries.X fun _ ↦ 0 : Unit ⊕ Unit → MvPowerSeries Unit O)
      W.addSeries = PowerSeries.X := by
  rw [addSeries, MvPowerSeries.subst_comp_subst_apply W.hasSubst_thirdRootSeries hasSubst_unitR]
  have h : (fun _ : Unit ↦ MvPowerSeries.subst
      (Sum.elim MvPowerSeries.X fun _ ↦ 0 : Unit ⊕ Unit → MvPowerSeries Unit O)
      W.thirdRootSeries) = fun _ : Unit ↦ (W.inverseSeries : MvPowerSeries Unit O) := by
    funext u
    exact W.subst_unitR_thirdRootSeries
  rw [h]
  exact W.subst_inverseSeries_self
lemma hasSubst_unitL :
    MvPowerSeries.HasSubst
      (Sum.elim (fun _ ↦ 0) MvPowerSeries.X : Unit ⊕ Unit → MvPowerSeries Unit O) :=
  MvPowerSeries.hasSubst_of_constantCoeff_zero (by rintro (j | j) <;> simp)
 
theorem subst_unitL_addSeries :
    MvPowerSeries.subst (Sum.elim (fun _ ↦ 0) MvPowerSeries.X : Unit ⊕ Unit → MvPowerSeries Unit O)
      W.addSeries = PowerSeries.X := by
  conv_lhs => rw [← W.rename_swap_addSeries]
  rw [MvPowerSeries.rename_eq_subst,
    MvPowerSeries.subst_comp_subst_apply (MvPowerSeries.HasSubst.X_comp _) hasSubst_unitL]
  have h : (fun s : Unit ⊕ Unit ↦ MvPowerSeries.subst
      (Sum.elim (fun _ ↦ 0) MvPowerSeries.X : Unit ⊕ Unit → MvPowerSeries Unit O)
      ((MvPowerSeries.X ∘ Sum.swap : Unit ⊕ Unit → MvPowerSeries (Unit ⊕ Unit) O) s)) =
      (Sum.elim MvPowerSeries.X fun _ ↦ 0 : Unit ⊕ Unit → MvPowerSeries Unit O) := by
    funext s
    rw [Function.comp_apply, MvPowerSeries.subst_X hasSubst_unitL]
    match s with
    | .inl () => rfl
    | .inr () => rfl
  rw [h]
  exact W.subst_unitR_addSeries

lemma coeff_single_eq_one_of_subst_eq_X {f : MvPowerSeries (Unit ⊕ Unit) O}
    {s₀ : Unit ⊕ Unit} {fam : Unit ⊕ Unit → MvPowerSeries Unit O}
    (hfam₀ : fam s₀ = MvPowerSeries.X ()) (hfam : ∀ s ≠ s₀, fam s = 0)
    (hsubst : MvPowerSeries.subst fam f = PowerSeries.X) :
    MvPowerSeries.coeff (Finsupp.single s₀ 1) f = 1 := by
  have hS : MvPowerSeries.HasSubst fam := by
    refine MvPowerSeries.hasSubst_of_constantCoeff_zero fun s ↦ ?_
    rcases eq_or_ne s s₀ with rfl | h
    · rw [hfam₀]
      exact MvPowerSeries.constantCoeff_X ()
    · rw [hfam s h, map_zero]
  have h := congrArg (MvPowerSeries.coeff (Finsupp.single () 1)) hsubst
  rw [MvPowerSeries.coeff_subst hS, show (PowerSeries.X : PowerSeries O) =
    MvPowerSeries.X () from rfl, MvPowerSeries.coeff_X, if_pos rfl] at h
  rw [finsum_eq_single _ (Finsupp.single s₀ 1) (fun d hd ↦ ?_)] at h
  · rwa [Finsupp.prod_single_index (h := fun s e ↦ fam s ^ e) (pow_zero _), hfam₀, pow_one,
      MvPowerSeries.coeff_X, if_pos rfl, smul_eq_mul, mul_one] at h
  · rcases Classical.em (∃ s ≠ s₀, d s ≠ 0) with ⟨s, hs, hds⟩ | hd0
    · rw [Finsupp.prod, Finset.prod_eq_zero (Finsupp.mem_support_iff.mpr hds)
        (by rw [hfam s hs, zero_pow hds]), map_zero, smul_zero]
    · push Not at hd0
      have hd' : d = Finsupp.single s₀ (d s₀) := Finsupp.ext fun u ↦ by
        rcases eq_or_ne u s₀ with rfl | hu
        · rw [Finsupp.single_eq_same]
        · simp [hd0 u hu, Ne.symm hu]
      have hne1 : d s₀ ≠ 1 := fun h1 ↦ hd (by rw [hd', h1])
      rw [hd', Finsupp.prod_single_index (h := fun s e ↦ fam s ^ e) (pow_zero _), hfam₀,
        MvPowerSeries.X_pow_eq () (d s₀), MvPowerSeries.coeff_monomial,
        if_neg (by simpa using fun h ↦ absurd h.symm hne1), smul_zero]
 
theorem coeff_single_inl_addSeries :
    MvPowerSeries.coeff (Finsupp.single (Sum.inl ()) 1) W.addSeries = 1 :=
  coeff_single_eq_one_of_subst_eq_X rfl
    (fun s h ↦ by
      rcases s with u | u
      · exact absurd rfl h
      · rfl)
    W.subst_unitR_addSeries
 
theorem coeff_single_inr_addSeries :
    MvPowerSeries.coeff (Finsupp.single (Sum.inr ()) 1) W.addSeries = 1 :=
  coeff_single_eq_one_of_subst_eq_X rfl
    (fun s h ↦ by
      rcases s with u | u
      · rfl
      · exact absurd rfl h)
    W.subst_unitL_addSeries
lemma degree_two_var (d : Unit ⊕ Unit →₀ ℕ) :
    d.degree = d (Sum.inl ()) + d (Sum.inr ()) := by
  conv_lhs => rw [show d = Finsupp.single (Sum.inl ()) (d (Sum.inl ())) +
    Finsupp.single (Sum.inr ()) (d (Sum.inr ())) from Finsupp.ext fun s ↦ by
      rcases s with u | u <;> simp]
  rw [map_add, Finsupp.degree_single, Finsupp.degree_single]

theorem coeff_addSeries_sub_of_degree_lt {d : Unit ⊕ Unit →₀ ℕ} (hd : d.degree < 2) :
    MvPowerSeries.coeff d (W.addSeries - MvPowerSeries.X (Sum.inl ()) -
      MvPowerSeries.X (Sum.inr ())) = 0 := by
  rw [degree_two_var] at hd
  simp only [map_sub, MvPowerSeries.coeff_X]
  have hcase : d (Sum.inl ()) = 0 ∧ d (Sum.inr ()) = 0 ∨
      d (Sum.inl ()) = 1 ∧ d (Sum.inr ()) = 0 ∨
      d (Sum.inl ()) = 0 ∧ d (Sum.inr ()) = 1 := by lia
  have hext : ∀ a b, d (Sum.inl ()) = a → d (Sum.inr ()) = b →
      d = Finsupp.single (Sum.inl ()) a + Finsupp.single (Sum.inr ()) b := fun a b ha hb ↦
    Finsupp.ext fun s ↦ by rcases s with u | u <;> simp [← ha, ← hb]
  rcases hcase with ⟨h1, h2⟩ | ⟨h1, h2⟩ | ⟨h1, h2⟩ <;>
    rw [show d = _ from hext _ _ h1 h2] <;>
    simp [show MvPowerSeries.coeff (0 : Unit ⊕ Unit →₀ ℕ) W.addSeries =
        MvPowerSeries.constantCoeff W.addSeries from rfl, W.constantCoeff_addSeries,
      W.coeff_single_inl_addSeries, W.coeff_single_inr_addSeries,
      Finsupp.single_eq_single_iff,
      (Ne.symm (Finsupp.single_ne_zero.mpr one_ne_zero) :
        (0 : Unit ⊕ Unit →₀ ℕ) ≠ Finsupp.single (Sum.inl ()) 1),
      (Ne.symm (Finsupp.single_ne_zero.mpr one_ne_zero) :
        (0 : Unit ⊕ Unit →₀ ℕ) ≠ Finsupp.single (Sum.inr ()) 1)]
end AddZero
section Naturality
variable {O' : Type*} [CommRing O'] (φ : O →+* O')
theorem map_wSeries : PowerSeries.map φ W.wSeries = (W.map φ).wSeries := by
  refine (W.map φ).eq_of_wStepAt_fixed (q := X) dvd_rfl ?_ ?_ ?_ ((W.map φ).wSeries_eq_wStep)
  · rw [PowerSeries.X_dvd_iff, show PowerSeries.constantCoeff (PowerSeries.map φ W.wSeries) =
      φ (PowerSeries.constantCoeff W.wSeries) from rfl, W.constantCoeff_wSeries, map_zero]
  · exact PowerSeries.X_dvd_iff.mpr (W.map φ).constantCoeff_wSeries
  · conv_lhs => rw [W.wSeries_eq_wStep]
    simp only [wStep, wStepAt, map_add, map_mul, map_pow, PowerSeries.map_C, PowerSeries.map_X,
      WeierstrassCurve.map_a₁, WeierstrassCurve.map_a₂, WeierstrassCurve.map_a₃,
      WeierstrassCurve.map_a₄, WeierstrassCurve.map_a₆]
theorem map_slopeSeries :
    MvPowerSeries.map φ W.slopeSeries = (W.map φ).slopeSeries := by
  ext d
  rw [MvPowerSeries.coeff_map, W.coeff_slopeSeries, (W.map φ).coeff_slopeSeries,
    ← W.map_wSeries φ, PowerSeries.coeff_map]
theorem map_interceptSeries :
    MvPowerSeries.map φ W.interceptSeries = (W.map φ).interceptSeries := by
  simp only [interceptSeries, map_sub, map_mul, ← MvPowerSeries.rename_map,
    MvPowerSeries.map_X, W.map_slopeSeries φ]
  rw [show MvPowerSeries.map φ (W.wSeries : MvPowerSeries Unit O) =
    ((W.map φ).wSeries : MvPowerSeries Unit O') from W.map_wSeries φ]
theorem map_uSeries : PowerSeries.map φ W.uSeries = (W.map φ).uSeries := by
  simp only [uSeries, map_sub, map_one, map_mul, PowerSeries.map_C, PowerSeries.map_X,
    W.map_wSeries φ, WeierstrassCurve.map_a₁, WeierstrassCurve.map_a₃]
theorem map_thirdRootSeries :
    MvPowerSeries.map φ W.thirdRootSeries = (W.map φ).thirdRootSeries := by
  have hinv : MvPowerSeries.map φ (MvPowerSeries.invOfUnit
      (1 + MvPowerSeries.C W.a₂ * W.slopeSeries + MvPowerSeries.C W.a₄ * W.slopeSeries ^ 2 +
        MvPowerSeries.C W.a₆ * W.slopeSeries ^ 3) 1) =
      MvPowerSeries.invOfUnit
      (1 + MvPowerSeries.C (W.map φ).a₂ * (W.map φ).slopeSeries +
        MvPowerSeries.C (W.map φ).a₄ * (W.map φ).slopeSeries ^ 2 +
        MvPowerSeries.C (W.map φ).a₆ * (W.map φ).slopeSeries ^ 3) 1 := by
    have h := ringHom_invOfUnit (MvPowerSeries.map φ)
      (D := 1 + MvPowerSeries.C W.a₂ * W.slopeSeries + MvPowerSeries.C W.a₄ * W.slopeSeries ^ 2 +
        MvPowerSeries.C W.a₆ * W.slopeSeries ^ 3) (by simp) (by simp)
    rw [h]
    congr 1
    simp only [map_add, map_one, map_mul, map_pow, MvPowerSeries.map_C, W.map_slopeSeries φ,
      WeierstrassCurve.map_a₂, WeierstrassCurve.map_a₄, WeierstrassCurve.map_a₆]
  simp only [thirdRootSeries, map_sub, map_neg, map_add, map_mul, map_pow, map_ofNat,
    MvPowerSeries.map_X, MvPowerSeries.map_C, W.map_slopeSeries φ, W.map_interceptSeries φ,
    hinv, WeierstrassCurve.map_a₁, WeierstrassCurve.map_a₂, WeierstrassCurve.map_a₃,
    WeierstrassCurve.map_a₄, WeierstrassCurve.map_a₆]
theorem map_inverseSeries :
    PowerSeries.map φ W.inverseSeries = (W.map φ).inverseSeries := by
  simp only [inverseSeries, PowerSeries.invOfUnit]
  have hD' : MvPowerSeries.constantCoeff (PowerSeries.map φ W.uSeries) = 1 := by
    rw [show (PowerSeries.map φ W.uSeries : PowerSeries O') = (W.map φ).uSeries
      from W.map_uSeries φ]
    exact (W.map φ).constantCoeff_uSeries
  have h := ringHom_invOfUnit (PowerSeries.map φ) (σ' := Unit) (τ' := Unit) (D := W.uSeries)
    (by exact W.constantCoeff_uSeries) hD'
  rw [map_neg, map_mul, PowerSeries.map_X, h, W.map_uSeries φ]
theorem map_addSeries :
    MvPowerSeries.map φ W.addSeries = (W.map φ).addSeries := by
  rw [addSeries, MvPowerSeries.map_subst W.hasSubst_thirdRootSeries, addSeries]
  congr 1
  · funext u
    exact W.map_thirdRootSeries φ
  · exact W.map_inverseSeries φ
end Naturality
lemma hasSubst_assocLeftFam_addSeries :
    MvPowerSeries.HasSubst (assocLeftFam (fun _ : Unit ↦ W.addSeries)) := by
  refine MvPowerSeries.hasSubst_of_constantCoeff_zero ?_
  rintro (j | j)
  · exact MvPowerSeries.constantCoeff_subst_eq_zero (FormalGroupLaw.hasSubst_emb12 (O := O))
      (by rintro (j | j) <;> simp) W.constantCoeff_addSeries
  · simp [assocLeftFam]
lemma hasSubst_assocRightFam_addSeries :
    MvPowerSeries.HasSubst (assocRightFam (fun _ : Unit ↦ W.addSeries)) := by
  refine MvPowerSeries.hasSubst_of_constantCoeff_zero ?_
  rintro (j | j)
  · simp [assocRightFam]
  · exact MvPowerSeries.constantCoeff_subst_eq_zero (FormalGroupLaw.hasSubst_emb23 (O := O))
      (by rintro (j | j) <;> simp) W.constantCoeff_addSeries
section Naturality
variable {O' : Type*} [CommRing O'] (φ : O →+* O')
lemma map_assocLeftFam_addSeries :
    (fun s ↦ MvPowerSeries.map φ (assocLeftFam (fun _ : Unit ↦ W.addSeries) s)) =
      assocLeftFam (fun _ : Unit ↦ (W.map φ).addSeries) := by
  funext s
  match s with
  | .inl j =>
    simp only [assocLeftFam, Sum.elim_inl,
      MvPowerSeries.map_subst (FormalGroupLaw.hasSubst_emb12 (O := O)), W.map_addSeries φ]
    congr 1
    funext t
    rcases t with t | t <;> simp [MvPowerSeries.map_X]
  | .inr j => simp [assocLeftFam, MvPowerSeries.map_X]
lemma map_assocRightFam_addSeries :
    (fun s ↦ MvPowerSeries.map φ (assocRightFam (fun _ : Unit ↦ W.addSeries) s)) =
      assocRightFam (fun _ : Unit ↦ (W.map φ).addSeries) := by
  funext s
  match s with
  | .inl j => simp [assocRightFam, MvPowerSeries.map_X]
  | .inr j =>
    simp only [assocRightFam, Sum.elim_inr,
      MvPowerSeries.map_subst (FormalGroupLaw.hasSubst_emb23 (O := O)), W.map_addSeries φ]
    congr 1
    funext t
    rcases t with t | t <;> simp [MvPowerSeries.map_X]
end Naturality
end Chord
end wSeries
end WeierstrassCurve
end
end

/- EllipticCurves.WeierstrassFormalGroup.ThirdPoint -/
section
section
open ChabautyColeman PowerSeries IsDedekindDomain
namespace WeierstrassCurve
section wSeries
variable {O : Type*} [CommRing O] (W : WeierstrassCurve O)
section Chord
open MvPowerSeries
section FieldChord
variable {F : Type*} [Field F] (WF : WeierstrassCurve F)
lemma chord_x_ne {q₁ q₂ w₁ w₂ : F} (hw₁0 : w₁ ≠ 0) (hw₂0 : w₂ ≠ 0)
    (hx : q₁ * w₂ - q₂ * w₁ ≠ 0) : q₁ / w₁ ≠ q₂ / w₂ := by
  intro h
  apply hx
  field_simp at h
  linear_combination h

lemma chord_point_nonsingular {q w : F}
    (hw : w = q ^ 3 + WF.a₁ * q * w + WF.a₂ * q ^ 2 * w + WF.a₃ * w ^ 2 +
      WF.a₄ * q * w ^ 2 + WF.a₆ * w ^ 3)
    (hw0 : w ≠ 0) (hΔ : WF.Δ ≠ 0) :
    WF.toAffine.Nonsingular (q / w) (-1 / w) := by
  refine (WF.toAffine.equation_iff_nonsingular_of_Δ_ne_zero hΔ).mp ?_
  rw [Affine.equation_iff]
  field_simp
  linear_combination hw
variable [DecidableEq F]
lemma chord_addX_addY {q₁ q₂ w₁ w₂ Λ N T₃ wT : F}
    (hw₁ : w₁ = q₁ ^ 3 + WF.a₁ * q₁ * w₁ + WF.a₂ * q₁ ^ 2 * w₁ + WF.a₃ * w₁ ^ 2 +
      WF.a₄ * q₁ * w₁ ^ 2 + WF.a₆ * w₁ ^ 3)
    (hw₂ : w₂ = q₂ ^ 3 + WF.a₁ * q₂ * w₂ + WF.a₂ * q₂ ^ 2 * w₂ + WF.a₃ * w₂ ^ 2 +
      WF.a₄ * q₂ * w₂ ^ 2 + WF.a₆ * w₂ ^ 3)
    (hslope : Λ * (q₂ - q₁) = w₂ - w₁)
    (hN : N = w₁ - Λ * q₁)
    (hT₃ : (1 + WF.a₂ * Λ + WF.a₄ * Λ ^ 2 + WF.a₆ * Λ ^ 3) * (T₃ + q₁ + q₂) =
      -(WF.a₁ * Λ + WF.a₂ * N + WF.a₃ * Λ ^ 2 + 2 * WF.a₄ * Λ * N + 3 * WF.a₆ * Λ ^ 2 * N))
    (hwT : wT = Λ * T₃ + N)
    (hA : (1 + WF.a₂ * Λ + WF.a₄ * Λ ^ 2 + WF.a₆ * Λ ^ 3) ≠ 0)
    (hw₁0 : w₁ ≠ 0) (hw₂0 : w₂ ≠ 0) (hwT0 : wT ≠ 0)
    (hx : q₁ * w₂ - q₂ * w₁ ≠ 0) :
    T₃ / wT = WF.toAffine.addX (q₁ / w₁) (q₂ / w₂)
        (WF.toAffine.slope (q₁ / w₁) (q₂ / w₂) (-1 / w₁) (-1 / w₂)) ∧
      (1 - WF.a₁ * T₃ - WF.a₃ * wT) / wT =
        WF.toAffine.addY (q₁ / w₁) (q₂ / w₂) (-1 / w₁)
          (WF.toAffine.slope (q₁ / w₁) (q₂ / w₂) (-1 / w₁) (-1 / w₂)) := by
  have hxq := chord_x_ne hw₁0 hw₂0 hx
  have hne : q₁ / w₁ - q₂ / w₂ ≠ 0 := sub_ne_zero.mpr hxq
  have hline₁ : w₁ = Λ * q₁ + N := by linear_combination -hN
  have hline₂ : w₂ = Λ * q₂ + N := by linear_combination -hN - hslope
  have hqw : q₁ * w₂ - q₂ * w₁ = N * (q₁ - q₂) := by
    linear_combination q₁ * hline₂ - q₂ * hline₁
  have hN0 : N ≠ 0 := fun h ↦ hx (by rw [hqw, h, zero_mul])
  have hℓ : WF.toAffine.slope (q₁ / w₁) (q₂ / w₂) (-1 / w₁) (-1 / w₂) = Λ / N := by
    rw [Affine.slope_of_X_ne hxq, div_eq_div_iff (sub_ne_zero.mpr hxq) hN0]
    field_simp
    linear_combination (w₂ - Λ * q₂) * hline₁ - w₁ * hline₂ + Λ * q₂ * hline₁
  have hq12 : q₁ - q₂ ≠ 0 := by
    intro h
    apply hx
    rw [hqw, h, mul_zero]
  rw [hℓ]
  set AA := 1 + WF.a₂ * Λ + WF.a₄ * Λ ^ 2 + WF.a₆ * Λ ^ 3 with hAA2
  have hCub₁ : -N + AA*q₁^3 + WF.a₃*N^2 + WF.a₆*N^3 - Λ*q₁ + Λ*WF.a₁*q₁^2 + N*WF.a₁*q₁
    + N*WF.a₂*q₁^2 + WF.a₃*Λ^2*q₁^2 + WF.a₄*q₁*N^2 + 2*Λ*N*WF.a₃*q₁ + 2*Λ*N*WF.a₄*q₁^2
    + 3*Λ*WF.a₆*q₁*N^2 + 3*N*WF.a₆*Λ^2*q₁^2 = 0 := by
    linear_combination -hw₁ + (1 + w₁*(-WF.a₃ - N*WF.a₆ - WF.a₄*q₁ - Λ*WF.a₆*q₁) - N*WF.a₃
      - WF.a₁*q₁ - WF.a₂*q₁^2 - WF.a₆*N^2 - WF.a₆*w₁^2 - Λ*WF.a₃*q₁ - Λ*WF.a₄*q₁^2 - N*WF.a₄*q₁
      - WF.a₆*Λ^2*q₁^2 - 2*Λ*N*WF.a₆*q₁) * hline₁ + (q₁^3) * hAA2
  have hCub₂ : -N + AA*q₂^3 + WF.a₃*N^2 + WF.a₆*N^3 - Λ*q₂ + Λ*WF.a₁*q₂^2 + N*WF.a₁*q₂
    + N*WF.a₂*q₂^2 + WF.a₃*Λ^2*q₂^2 + WF.a₄*q₂*N^2 + 2*Λ*N*WF.a₃*q₂ + 2*Λ*N*WF.a₄*q₂^2
    + 3*Λ*WF.a₆*q₂*N^2 + 3*N*WF.a₆*Λ^2*q₂^2 = 0 := by
    linear_combination -hw₂ + (1 + w₂*(-WF.a₃ - N*WF.a₆ - WF.a₄*q₂ - Λ*WF.a₆*q₂) - N*WF.a₃
      - WF.a₁*q₂ - WF.a₂*q₂^2 - WF.a₆*N^2 - WF.a₆*w₂^2 - Λ*WF.a₃*q₂ - Λ*WF.a₄*q₂^2 - N*WF.a₄*q₂
      - WF.a₆*Λ^2*q₂^2 - 2*Λ*N*WF.a₆*q₂) * hline₂ + (q₂^3) * hAA2
  clear_value AA
  constructor
  · rw [Affine.addX]
    field_simp
    refine mul_left_cancel₀ (mul_ne_zero (pow_ne_zero 3 hA) hq12) ?_
    linear_combination (AA^3*(w₂*N^2*q₁^2 - w₁*N^2*q₂^2 + q₁*q₂*w₁*N^2 + q₂*w₁*w₂*Λ^2
      - q₁*q₂*w₂*N^2 - q₁*w₁*w₂*Λ^2 + WF.a₂*q₁*w₁*w₂*N^2 - WF.a₂*q₂*w₁*w₂*N^2
      + Λ*N*WF.a₁*q₂*w₁*w₂ - Λ*N*WF.a₁*q₁*w₁*w₂)) * hwT +
    (AA^3*(-N^3*q₂^2 + q₁*q₂*N^3 + N*q₂*w₂*Λ^2 + T₃*q₁*w₂*N^2 + T₃*q₂*w₂*Λ^3 + WF.a₂*q₁*w₂*N^3
      - Λ*T₃*N^2*q₂^2 - N*q₁*w₂*Λ^2 - T₃*q₁*w₂*Λ^3 - T₃*q₂*w₂*N^2 - WF.a₂*q₂*w₂*N^3
      + Λ*T₃*q₁*q₂*N^2 + Λ*WF.a₁*q₂*w₂*N^2 - Λ*WF.a₁*q₁*w₂*N^2 + Λ*T₃*WF.a₂*q₁*w₂*N^2
      + N*T₃*WF.a₁*q₂*w₂*Λ^2 - Λ*T₃*WF.a₂*q₂*w₂*N^2 - N*T₃*WF.a₁*q₁*w₂*Λ^2)) * hline₁ +
    (AA^3*(N^3*q₁^2 + T₃*q₁*N^3 + WF.a₂*q₁*N^4 + q₂*Λ^2*N^2 - N*Λ^3*q₁^2 - T₃*q₂*N^3
      - T₃*Λ^4*q₁^2 - WF.a₂*q₂*N^4 - q₁*q₂*N^3 - q₁*Λ^2*N^2 + Λ*WF.a₁*q₂*N^3 + Λ*WF.a₂*N^3*q₁^2
      + N*T₃*q₂*Λ^3 + N*q₁*q₂*Λ^3 + T₃*q₁*q₂*Λ^4 - Λ*WF.a₁*q₁*N^3 - N*T₃*q₁*Λ^3
      - WF.a₁*Λ^2*N^2*q₁^2 + 2*Λ*T₃*N^2*q₁^2 + Λ*T₃*WF.a₂*q₁*N^3 + T₃*WF.a₁*q₂*Λ^2*N^2
      + T₃*WF.a₂*Λ^2*N^2*q₁^2 + WF.a₁*q₁*q₂*Λ^2*N^2 - Λ*T₃*WF.a₂*q₂*N^3 - Λ*WF.a₂*q₁*q₂*N^3
      - N*T₃*WF.a₁*Λ^3*q₁^2 - T₃*WF.a₁*q₁*Λ^2*N^2 - 2*Λ*T₃*q₁*q₂*N^2 + N*T₃*WF.a₁*q₁*q₂*Λ^3
      - T₃*WF.a₂*q₁*q₂*Λ^2*N^2)) * hline₂ +
    (AA^2*(q₁*N^4 - q₂*N^4 + N*Λ^4*q₂^2 + q₁*Λ^5*q₂^2 + q₂*Λ^3*N^2 - N*Λ^4*q₁^2 - q₁*Λ^3*N^2
      - q₂*Λ^5*q₁^2 - 2*Λ*N^3*q₂^2 + 2*Λ*N^3*q₁^2 + Λ*WF.a₂*q₁*N^4 + WF.a₁*q₂*Λ^2*N^3
      + WF.a₁*Λ^3*N^2*q₂^2 + WF.a₂*Λ^2*N^3*q₁^2 - Λ*WF.a₂*q₂*N^4 - WF.a₁*q₁*Λ^2*N^3
      - WF.a₁*Λ^3*N^2*q₁^2 - WF.a₂*Λ^2*N^3*q₂^2 - 3*q₁*Λ^2*N^2*q₂^2 + 3*q₂*Λ^2*N^2*q₁^2
      + N*WF.a₁*q₁*Λ^4*q₂^2 + WF.a₂*q₂*Λ^3*N^2*q₁^2 - N*WF.a₁*q₂*Λ^4*q₁^2
      - WF.a₂*q₁*Λ^3*N^2*q₂^2)) * hT₃ +
    (AA*(AA*N*Λ^4 + AA*q₂*Λ^5 - 2*AA*Λ*N^3 + AA*WF.a₁*Λ^3*N^2 - AA*WF.a₂*Λ^2*N^3
      - 3*AA*q₂*Λ^2*N^2 + AA*N*WF.a₁*q₂*Λ^4 - AA*WF.a₂*q₂*Λ^3*N^2)) * hCub₁ +
    (-N*AA^2*Λ^4 - q₁*AA^2*Λ^5 + 2*Λ*AA^2*N^3 + WF.a₂*AA^2*Λ^2*N^3 - WF.a₁*AA^2*Λ^3*N^2
      + 3*q₁*AA^2*Λ^2*N^2 + WF.a₂*q₁*AA^2*Λ^3*N^2 - N*WF.a₁*q₁*AA^2*Λ^4) * hCub₂ +
    (AA^2*(WF.a₂*q₁*N^5 + q₂*Λ^2*N^3 - WF.a₂*q₂*N^5 - q₁*Λ^2*N^3 + Λ*WF.a₁*q₂*N^4
      - Λ*WF.a₁*q₁*N^4)) * hAA2
  · rw [Affine.addY, Affine.negAddY, Affine.addX, Affine.negY]
    field_simp
    refine mul_left_cancel₀ (mul_ne_zero (pow_ne_zero 3 hA) hq12) ?_
    linear_combination (AA^3*(q₂*w₂*N^3 - q₁*w₂*N^3 + Λ*w₁*N^2*q₂^2 + WF.a₁*w₁*N^3*q₂^2
      + q₁*w₁*w₂*Λ^3 - WF.a₁*w₂*N^3*q₁^2 - q₂*w₁*w₂*Λ^3 - 2*Λ*w₂*N^2*q₁^2 + WF.a₁*q₁*q₂*w₂*N^3
      - Λ*q₁*q₂*w₁*N^2 - WF.a₁*q₁*q₂*w₁*N^3 + 2*Λ*q₁*q₂*w₂*N^2 + Λ*WF.a₂*q₂*w₁*w₂*N^2
      + Λ*q₁*w₁*w₂*N^2*WF.a₁^2 + WF.a₁*WF.a₂*q₂*w₁*w₂*N^3 - Λ*WF.a₂*q₁*w₁*w₂*N^2
      - Λ*q₂*w₁*w₂*N^2*WF.a₁^2 - WF.a₁*WF.a₂*q₁*w₁*w₂*N^3 - 2*N*WF.a₁*q₂*w₁*w₂*Λ^2
      + 2*N*WF.a₁*q₁*w₁*w₂*Λ^2)) * hwT +
    (AA^3*(Λ*N^3*q₂^2 + WF.a₁*N^4*q₂^2 + q₁*w₂*N^3 - q₂*w₂*N^3 + N*q₁*w₂*Λ^3 + T₃*q₁*w₂*Λ^4
      + T₃*Λ^2*N^2*q₂^2 - Λ*q₁*q₂*N^3 - N*q₂*w₂*Λ^3 - T₃*q₂*w₂*Λ^4 - WF.a₁*q₁*q₂*N^4
      + Λ*T₃*WF.a₁*N^3*q₂^2 + Λ*WF.a₂*q₂*w₂*N^3 + Λ*q₁*w₂*N^3*WF.a₁^2 + T₃*WF.a₁*q₂*w₂*N^3
      + WF.a₁*WF.a₂*q₂*w₂*N^4 - Λ*WF.a₂*q₁*w₂*N^3 - Λ*q₂*w₂*N^3*WF.a₁^2 - T₃*WF.a₁*q₁*w₂*N^3
      - T₃*q₁*q₂*Λ^2*N^2 - WF.a₁*WF.a₂*q₁*w₂*N^4 - 2*WF.a₁*q₂*w₂*Λ^2*N^2 + 2*WF.a₁*q₁*w₂*Λ^2*N^2
      + T₃*WF.a₂*q₂*w₂*Λ^2*N^2 + T₃*q₁*w₂*Λ^2*N^2*WF.a₁^2 - Λ*T₃*WF.a₁*q₁*q₂*N^3
      - T₃*WF.a₂*q₁*w₂*Λ^2*N^2 - T₃*q₂*w₂*Λ^2*N^2*WF.a₁^2 - 2*N*T₃*WF.a₁*q₂*w₂*Λ^3
      + 2*N*T₃*WF.a₁*q₁*w₂*Λ^3 + Λ*T₃*WF.a₁*WF.a₂*q₂*w₂*N^3
      - Λ*T₃*WF.a₁*WF.a₂*q₁*w₂*N^3)) * hline₁ +
    (AA^3*(N*Λ^4*q₁^2 + T₃*Λ^5*q₁^2 + q₁*Λ^3*N^2 - Λ*N^3*q₁^2 - WF.a₁*N^4*q₁^2 - q₂*Λ^3*N^2
      + Λ*T₃*q₂*N^3 + Λ*WF.a₂*q₂*N^4 + Λ*q₁*q₂*N^3 + Λ*q₁*N^4*WF.a₁^2 + N*T₃*q₁*Λ^4
      + T₃*WF.a₁*q₂*N^4 + WF.a₁*WF.a₂*q₂*N^5 + WF.a₁*q₁*q₂*N^4 + Λ^2*N^3*WF.a₁^2*q₁^2
      - Λ*T₃*q₁*N^3 - Λ*WF.a₂*q₁*N^4 - Λ*q₂*N^4*WF.a₁^2 - N*T₃*q₂*Λ^4 - N*q₁*q₂*Λ^4
      - T₃*WF.a₁*q₁*N^4 - T₃*q₁*q₂*Λ^5 - WF.a₁*WF.a₂*q₁*N^5 - WF.a₂*Λ^2*N^3*q₁^2
      - 2*T₃*Λ^2*N^2*q₁^2 - 2*WF.a₁*q₂*Λ^2*N^3 + 2*WF.a₁*q₁*Λ^2*N^3 + 2*WF.a₁*Λ^3*N^2*q₁^2
      + T₃*WF.a₂*q₂*Λ^2*N^3 + T₃*q₁*Λ^2*N^3*WF.a₁^2 + T₃*Λ^3*N^2*WF.a₁^2*q₁^2
      + WF.a₂*q₁*q₂*Λ^2*N^3 - Λ*WF.a₁*WF.a₂*N^4*q₁^2 - T₃*WF.a₂*q₁*Λ^2*N^3
      - T₃*WF.a₂*Λ^3*N^2*q₁^2 - T₃*q₂*Λ^2*N^3*WF.a₁^2 - q₁*q₂*Λ^2*N^3*WF.a₁^2
      - 2*Λ*T₃*WF.a₁*N^3*q₁^2 - 2*T₃*WF.a₁*q₂*Λ^3*N^2 - 2*WF.a₁*q₁*q₂*Λ^3*N^2
      + 2*N*T₃*WF.a₁*Λ^4*q₁^2 + 2*T₃*WF.a₁*q₁*Λ^3*N^2 + 2*T₃*q₁*q₂*Λ^2*N^2
      + Λ*T₃*WF.a₁*WF.a₂*q₂*N^4 + Λ*WF.a₁*WF.a₂*q₁*q₂*N^4 + T₃*WF.a₂*q₁*q₂*Λ^3*N^2
      - Λ*T₃*WF.a₁*WF.a₂*q₁*N^4 - T₃*WF.a₁*WF.a₂*Λ^2*N^3*q₁^2 - T₃*q₁*q₂*Λ^3*N^2*WF.a₁^2
      - 2*N*T₃*WF.a₁*q₁*q₂*Λ^4 + 2*Λ*T₃*WF.a₁*q₁*q₂*N^3 + T₃*WF.a₁*WF.a₂*q₁*q₂*Λ^2*N^3)) * hline₂ +
    (AA^2*(Λ*q₂*N^4 + N*Λ^5*q₁^2 + WF.a₁*q₂*N^5 + q₁*Λ^4*N^2 + q₂*Λ^6*q₁^2 - Λ*q₁*N^4
      - N*Λ^5*q₂^2 - WF.a₁*q₁*N^5 - q₁*Λ^6*q₂^2 - q₂*Λ^4*N^2 - 2*Λ^2*N^3*q₁^2 + 2*Λ^2*N^3*q₂^2
      + WF.a₂*q₂*Λ^2*N^4 + WF.a₂*Λ^3*N^3*q₂^2 + q₁*Λ^2*N^4*WF.a₁^2 + Λ^3*N^3*WF.a₁^2*q₁^2
      - WF.a₂*q₁*Λ^2*N^4 - WF.a₂*Λ^3*N^3*q₁^2 - q₂*Λ^2*N^4*WF.a₁^2 - Λ^3*N^3*WF.a₁^2*q₂^2
      - 3*q₂*Λ^3*N^2*q₁^2 - 2*Λ*WF.a₁*N^4*q₁^2 - 2*WF.a₁*q₂*Λ^3*N^3 - 2*WF.a₁*Λ^4*N^2*q₂^2
      + 2*Λ*WF.a₁*N^4*q₂^2 + 2*WF.a₁*q₁*Λ^3*N^3 + 2*WF.a₁*Λ^4*N^2*q₁^2 + 3*q₁*Λ^3*N^2*q₂^2
      + Λ*WF.a₁*WF.a₂*q₂*N^5 + WF.a₁*WF.a₂*Λ^2*N^4*q₂^2 + WF.a₂*q₁*Λ^4*N^2*q₂^2
      + q₂*Λ^4*N^2*WF.a₁^2*q₁^2 - Λ*WF.a₁*WF.a₂*q₁*N^5 - WF.a₁*WF.a₂*Λ^2*N^4*q₁^2
      - WF.a₂*q₂*Λ^4*N^2*q₁^2 - q₁*Λ^4*N^2*WF.a₁^2*q₂^2 - 3*WF.a₁*q₂*Λ^2*N^3*q₁^2
      - 2*N*WF.a₁*q₁*Λ^5*q₂^2 + 2*N*WF.a₁*q₂*Λ^5*q₁^2 + 3*WF.a₁*q₁*Λ^2*N^3*q₂^2
      + WF.a₁*WF.a₂*q₁*Λ^3*N^3*q₂^2 - WF.a₁*WF.a₂*q₂*Λ^3*N^3*q₁^2)) * hT₃ +
    (AA*(-AA*N*Λ^5 - AA*q₂*Λ^6 + 2*AA*Λ^2*N^3 + AA*WF.a₂*Λ^3*N^3 - AA*Λ^3*N^3*WF.a₁^2
      - 2*AA*WF.a₁*Λ^4*N^2 + 2*AA*Λ*WF.a₁*N^4 + 3*AA*q₂*Λ^3*N^2 + AA*WF.a₁*WF.a₂*Λ^2*N^4
      + AA*WF.a₂*q₂*Λ^4*N^2 - AA*q₂*Λ^4*N^2*WF.a₁^2 - 2*AA*N*WF.a₁*q₂*Λ^5
      + 3*AA*WF.a₁*q₂*Λ^2*N^3 + AA*WF.a₁*WF.a₂*q₂*Λ^3*N^3)) * hCub₁ +
    (N*AA^2*Λ^5 + q₁*AA^2*Λ^6 - 2*AA^2*Λ^2*N^3 + AA^2*Λ^3*N^3*WF.a₁^2 - WF.a₂*AA^2*Λ^3*N^3
      - 3*q₁*AA^2*Λ^3*N^2 - 2*Λ*WF.a₁*AA^2*N^4 + 2*WF.a₁*AA^2*Λ^4*N^2 + q₁*AA^2*Λ^4*N^2*WF.a₁^2
      - WF.a₁*WF.a₂*AA^2*Λ^2*N^4 - WF.a₂*q₁*AA^2*Λ^4*N^2 - 3*WF.a₁*q₁*AA^2*Λ^2*N^3
      + 2*N*WF.a₁*q₁*AA^2*Λ^5 - WF.a₁*WF.a₂*q₁*AA^2*Λ^3*N^3) * hCub₂ +
    (AA^2*(q₁*Λ^3*N^3 - q₂*Λ^3*N^3 + Λ*WF.a₂*q₂*N^5 + Λ*q₁*N^5*WF.a₁^2 + WF.a₁*WF.a₂*q₂*N^6
      - Λ*WF.a₂*q₁*N^5 - Λ*q₂*N^5*WF.a₁^2 - WF.a₁*WF.a₂*q₁*N^6 - 2*WF.a₁*q₂*Λ^2*N^4
      + 2*WF.a₁*q₁*Λ^2*N^4)) * hAA2
 
lemma chord_point_add {q₁ q₂ w₁ w₂ Λ N T₃ wT : F}
    (hw₁ : w₁ = q₁ ^ 3 + WF.a₁ * q₁ * w₁ + WF.a₂ * q₁ ^ 2 * w₁ + WF.a₃ * w₁ ^ 2 +
      WF.a₄ * q₁ * w₁ ^ 2 + WF.a₆ * w₁ ^ 3)
    (hw₂ : w₂ = q₂ ^ 3 + WF.a₁ * q₂ * w₂ + WF.a₂ * q₂ ^ 2 * w₂ + WF.a₃ * w₂ ^ 2 +
      WF.a₄ * q₂ * w₂ ^ 2 + WF.a₆ * w₂ ^ 3)
    (hslope : Λ * (q₂ - q₁) = w₂ - w₁)
    (hN : N = w₁ - Λ * q₁)
    (hT₃ : (1 + WF.a₂ * Λ + WF.a₄ * Λ ^ 2 + WF.a₆ * Λ ^ 3) * (T₃ + q₁ + q₂) =
      -(WF.a₁ * Λ + WF.a₂ * N + WF.a₃ * Λ ^ 2 + 2 * WF.a₄ * Λ * N + 3 * WF.a₆ * Λ ^ 2 * N))
    (hwT : wT = Λ * T₃ + N)
    (hA : (1 + WF.a₂ * Λ + WF.a₄ * Λ ^ 2 + WF.a₆ * Λ ^ 3) ≠ 0)
    (hw₁0 : w₁ ≠ 0) (hw₂0 : w₂ ≠ 0) (hwT0 : wT ≠ 0)
    (hx : q₁ * w₂ - q₂ * w₁ ≠ 0)
    (h₁ : WF.toAffine.Nonsingular (q₁ / w₁) (-1 / w₁))
    (h₂ : WF.toAffine.Nonsingular (q₂ / w₂) (-1 / w₂)) :
    ∃ h₃ : WF.toAffine.Nonsingular (T₃ / wT) ((1 - WF.a₁ * T₃ - WF.a₃ * wT) / wT),
      Affine.Point.some _ _ h₁ + Affine.Point.some _ _ h₂ = Affine.Point.some _ _ h₃ := by
  obtain ⟨hX, hY⟩ := chord_addX_addY WF hw₁ hw₂ hslope hN hT₃ hwT hA hw₁0 hw₂0 hwT0 hx
  have hxq := chord_x_ne hw₁0 hw₂0 hx
  have hxy : ¬(q₁ / w₁ = q₂ / w₂ ∧ -1 / w₁ = WF.toAffine.negY (q₂ / w₂) (-1 / w₂)) :=
    fun h ↦ hxq h.1
  refine ⟨hX ▸ hY ▸ Affine.nonsingular_add h₁ h₂ hxy, ?_⟩
  rw [Affine.Point.add_some hxy]
  simp only [Affine.Point.some.injEq]
  exact ⟨hX.symm, hY.symm⟩
end FieldChord
section OnLine
def LowVanish {σ : Type*} (k : ℕ) (f : MvPowerSeries σ O) : Prop :=
  ∀ d : σ →₀ ℕ, Finsupp.degree d < k → MvPowerSeries.coeff d f = 0
lemma lowVanish_zero {σ : Type*} (f : MvPowerSeries σ O) : LowVanish 0 f :=
  fun _ hd ↦ absurd hd (by lia)
lemma LowVanish.of_eq {σ : Type*} {k l : ℕ} {f : MvPowerSeries σ O}
    (hf : LowVanish k f) (h : k = l) : LowVanish l f := h ▸ hf
lemma LowVanish.mono {σ : Type*} {k l : ℕ} {f : MvPowerSeries σ O}
    (hf : LowVanish l f) (h : k ≤ l) : LowVanish k f :=
  fun d hd ↦ hf d (lt_of_lt_of_le hd h)
lemma LowVanish.add {σ : Type*} {k : ℕ} {f g : MvPowerSeries σ O}
    (hf : LowVanish k f) (hg : LowVanish k g) : LowVanish k (f + g) := fun d hd ↦ by
  rw [map_add, hf d hd, hg d hd, add_zero]
lemma LowVanish.mul {σ : Type*} {k l : ℕ} {f g : MvPowerSeries σ O}
    (hf : LowVanish k f) (hg : LowVanish l g) : LowVanish (k + l) (f * g) := by
  intro d hd
  classical
  rw [MvPowerSeries.coeff_mul]
  refine Finset.sum_eq_zero fun p hp ↦ ?_
  rcases lt_or_ge (Finsupp.degree p.1) k with h1 | h1
  · rw [hf _ h1, zero_mul]
  · have hpd : p.1 + p.2 = d := by simpa using hp
    have hdeg : Finsupp.degree p.1 + Finsupp.degree p.2 = Finsupp.degree d := by
      rw [← hpd, map_add]
    rw [hg _ (by lia), mul_zero]
lemma lowVanish_one {σ : Type*} {f : MvPowerSeries σ O}
    (hf : MvPowerSeries.constantCoeff f = 0) : LowVanish 1 f := by
  intro d hd
  have hd0 : d = 0 := by
    ext s
    have := Finsupp.le_degree s d
    simp only [Finsupp.coe_zero, Pi.zero_apply]
    lia
  rw [hd0]
  exact hf
lemma eq_of_lowVanish {σ : Type*} {f g : MvPowerSeries σ O}
    (h : ∀ k, LowVanish k (f - g)) : f = g := by
  ext d
  have := h (Finsupp.degree d + 1) d (by lia)
  rwa [map_sub, sub_eq_zero] at this
variable {σ : Type*}

noncomputable def mvWStepAt (q v : MvPowerSeries σ O) : MvPowerSeries σ O :=
  q ^ 3 + MvPowerSeries.C W.a₁ * q * v + MvPowerSeries.C W.a₂ * q ^ 2 * v +
    MvPowerSeries.C W.a₃ * v ^ 2 + MvPowerSeries.C W.a₄ * q * v ^ 2 +
    MvPowerSeries.C W.a₆ * v ^ 3
lemma mvWStepAt_contract {q u v : MvPowerSeries σ O} (hq : LowVanish 1 q)
    (hu : LowVanish 1 u) (hv : LowVanish 1 v) {k : ℕ} (h : LowVanish k (u - v)) :
    LowVanish (k + 1) (W.mvWStepAt q u - W.mvWStepAt q v) := by
  have hC : ∀ a : O, LowVanish 0 (MvPowerSeries.C a : MvPowerSeries σ O) := fun a ↦
    lowVanish_zero _
  have h2 : LowVanish (k + 1) (u ^ 2 - v ^ 2) := by
    have he : u ^ 2 - v ^ 2 = (u + v) * (u - v) := by ring
    rw [he]
    exact ((hu.add hv).mul h).of_eq (by lia)
  have h3 : LowVanish (k + 1) (u ^ 3 - v ^ 3) := by
    have he : u ^ 3 - v ^ 3 = (u * u + u * v + v * v) * (u - v) := by ring
    rw [he]
    exact ((((hu.mul hu).mono one_le_two).add ((hu.mul hv).mono one_le_two)).add
      ((hv.mul hv).mono one_le_two)).mul h |>.of_eq (by lia)
  have hq1 : LowVanish (k + 1) (q * (u - v)) := (hq.mul h).of_eq (by lia)
  have hstep : W.mvWStepAt q u - W.mvWStepAt q v = MvPowerSeries.C W.a₁ * (q * (u - v)) +
      MvPowerSeries.C W.a₂ * q * (q * (u - v)) + MvPowerSeries.C W.a₃ * (u ^ 2 - v ^ 2) +
      MvPowerSeries.C W.a₄ * q * (u ^ 2 - v ^ 2) + MvPowerSeries.C W.a₆ * (u ^ 3 - v ^ 3) := by
    simp only [mvWStepAt]
    ring
  rw [hstep]
  refine ((((((hC W.a₁).mul hq1).of_eq (by lia)).add ?_).add ?_).add ?_).add ?_
  · exact (((hC W.a₂).mul hq).mul hq1).mono (by lia)
  · exact ((hC W.a₃).mul h2).of_eq (by lia)
  · exact (((hC W.a₄).mul hq).mul h2).mono (by lia)
  · exact ((hC W.a₆).mul h3).of_eq (by lia)
lemma eq_of_mvWStepAt_fixed {q v v' : MvPowerSeries σ O} (hq : LowVanish 1 q)
    (hv : LowVanish 1 v) (hv' : LowVanish 1 v') (h : v = W.mvWStepAt q v)
    (h' : v' = W.mvWStepAt q v') : v = v' := by
  refine eq_of_lowVanish fun k ↦ ?_
  induction k with
  | zero => exact lowVanish_zero _
  | succ k ih =>
    have := W.mvWStepAt_contract hq hv hv' ih
    rwa [← h, ← h'] at this
section Pair
variable {σ' : Type*} {q₁ q₂ : MvPowerSeries σ' O}
lemma hasSubst_pair (h₁ : MvPowerSeries.constantCoeff q₁ = 0)
    (h₂ : MvPowerSeries.constantCoeff q₂ = 0) :
    MvPowerSeries.HasSubst
      (Sum.elim (fun _ ↦ q₁) (fun _ ↦ q₂) : Unit ⊕ Unit → MvPowerSeries σ' O) :=
  MvPowerSeries.hasSubst_of_constantCoeff_zero (by rintro (j | j) <;> simpa)
lemma hasSubst_single {q : MvPowerSeries σ' O}
    (hq : MvPowerSeries.constantCoeff q = 0) :
    MvPowerSeries.HasSubst (fun _ : Unit ↦ q) :=
  MvPowerSeries.hasSubst_of_constantCoeff_zero fun _ ↦ hq
lemma subst_pair_rename (h₁ : MvPowerSeries.constantCoeff q₁ = 0)
    (h₂ : MvPowerSeries.constantCoeff q₂ = 0) (c : Unit → Unit ⊕ Unit) (f : PowerSeries O) :
    MvPowerSeries.subst (Sum.elim (fun _ ↦ q₁) (fun _ ↦ q₂)) (MvPowerSeries.rename c f) =
      MvPowerSeries.subst (fun _ : Unit ↦ Sum.elim (fun _ ↦ q₁) (fun _ ↦ q₂) (c ())) f := by
  rw [MvPowerSeries.rename_eq_subst,
    MvPowerSeries.subst_comp_subst_apply (MvPowerSeries.HasSubst.X_comp _)
      (hasSubst_pair h₁ h₂)]
  congr 1
  funext u
  rw [Function.comp_apply, MvPowerSeries.subst_X (hasSubst_pair h₁ h₂)]
 
lemma subst_wSeries_fix {q : MvPowerSeries σ' O}
    (hq : MvPowerSeries.constantCoeff q = 0) :
    MvPowerSeries.subst (fun _ : Unit ↦ q) W.wSeries =
      W.mvWStepAt q (MvPowerSeries.subst (fun _ : Unit ↦ q) W.wSeries) := by
  conv_lhs => rw [W.wSeries_eq_wStep]
  rw [show W.wStep W.wSeries = W.wStepAt X W.wSeries from rfl]
  rw [wStepAt, ← MvPowerSeries.coe_substAlgHom (hasSubst_single hq)]
  simp only [map_add, map_mul, map_pow]
  rw [MvPowerSeries.coe_substAlgHom (hasSubst_single hq)]
  simp only [show (PowerSeries.C : O →+* O⟦X⟧) = MvPowerSeries.C from rfl,
    show (PowerSeries.X : PowerSeries O) = MvPowerSeries.X () from rfl,
    MvPowerSeries.subst_C, MvPowerSeries.subst_X (hasSubst_single hq), mvWStepAt]
lemma pair_slope_identity (h₁ : MvPowerSeries.constantCoeff q₁ = 0)
    (h₂ : MvPowerSeries.constantCoeff q₂ = 0) :
    MvPowerSeries.subst (Sum.elim (fun _ ↦ q₁) (fun _ ↦ q₂)) W.slopeSeries * (q₂ - q₁) =
      MvPowerSeries.subst (fun _ : Unit ↦ q₂) W.wSeries -
        MvPowerSeries.subst (fun _ : Unit ↦ q₁) W.wSeries := by
  have h := congrArg (MvPowerSeries.substAlgHom (hasSubst_pair h₁ h₂)) W.slopeSeries_mul_sub
  simp only [map_mul, map_sub] at h
  simp only [MvPowerSeries.coe_substAlgHom (hasSubst_pair h₁ h₂),
    subst_pair_rename h₁ h₂, MvPowerSeries.subst_X (hasSubst_pair h₁ h₂),
    Sum.elim_inl, Sum.elim_inr] at h
  exact h
lemma pair_intercept_identity₁ (h₁ : MvPowerSeries.constantCoeff q₁ = 0)
    (h₂ : MvPowerSeries.constantCoeff q₂ = 0) :
    MvPowerSeries.subst (Sum.elim (fun _ ↦ q₁) (fun _ ↦ q₂)) W.interceptSeries =
      MvPowerSeries.subst (fun _ : Unit ↦ q₁) W.wSeries -
        MvPowerSeries.subst (Sum.elim (fun _ ↦ q₁) (fun _ ↦ q₂)) W.slopeSeries * q₁ := by
  have h := congrArg (MvPowerSeries.substAlgHom (hasSubst_pair h₁ h₂))
    (show W.interceptSeries = MvPowerSeries.rename (fun _ ↦ Sum.inl ()) W.wSeries -
      W.slopeSeries * MvPowerSeries.X (Sum.inl ()) from rfl)
  simp only [map_sub, map_mul] at h
  simp only [MvPowerSeries.coe_substAlgHom (hasSubst_pair h₁ h₂),
    subst_pair_rename h₁ h₂, MvPowerSeries.subst_X (hasSubst_pair h₁ h₂),
    Sum.elim_inl] at h
  exact h
lemma pair_intercept_identity₂ (h₁ : MvPowerSeries.constantCoeff q₁ = 0)
    (h₂ : MvPowerSeries.constantCoeff q₂ = 0) :
    MvPowerSeries.subst (Sum.elim (fun _ ↦ q₁) (fun _ ↦ q₂)) W.interceptSeries =
      MvPowerSeries.subst (fun _ : Unit ↦ q₂) W.wSeries -
        MvPowerSeries.subst (Sum.elim (fun _ ↦ q₁) (fun _ ↦ q₂)) W.slopeSeries * q₂ := by
  have h := congrArg (MvPowerSeries.substAlgHom (hasSubst_pair h₁ h₂)) W.interceptSeries_eq
  simp only [map_sub, map_mul] at h
  simp only [MvPowerSeries.coe_substAlgHom (hasSubst_pair h₁ h₂),
    subst_pair_rename h₁ h₂, MvPowerSeries.subst_X (hasSubst_pair h₁ h₂),
    Sum.elim_inr] at h
  exact h
lemma pair_thirdRoot_constantCoeff (h₁ : MvPowerSeries.constantCoeff q₁ = 0)
    (h₂ : MvPowerSeries.constantCoeff q₂ = 0) :
    MvPowerSeries.constantCoeff
      (MvPowerSeries.subst (Sum.elim (fun _ ↦ q₁) (fun _ ↦ q₂)) W.thirdRootSeries) = 0 :=
  MvPowerSeries.constantCoeff_subst_eq_zero (hasSubst_pair h₁ h₂)
    (by rintro (j | j) <;> simpa) W.constantCoeff_thirdRootSeries
lemma pair_F_comp (h₁ : MvPowerSeries.constantCoeff q₁ = 0)
    (h₂ : MvPowerSeries.constantCoeff q₂ = 0) :
    MvPowerSeries.subst (Sum.elim (fun _ ↦ q₁) (fun _ ↦ q₂)) W.addSeries =
      MvPowerSeries.subst (fun _ : Unit ↦
        MvPowerSeries.subst (Sum.elim (fun _ ↦ q₁) (fun _ ↦ q₂)) W.thirdRootSeries)
        W.inverseSeries := by
  rw [addSeries, MvPowerSeries.subst_comp_subst_apply W.hasSubst_thirdRootSeries
    (hasSubst_pair h₁ h₂)]
lemma pair_u_mul (h₁ : MvPowerSeries.constantCoeff q₁ = 0)
    (h₂ : MvPowerSeries.constantCoeff q₂ = 0) :
    MvPowerSeries.subst (fun _ : Unit ↦
        MvPowerSeries.subst (Sum.elim (fun _ ↦ q₁) (fun _ ↦ q₂)) W.thirdRootSeries)
        W.uSeries *
      MvPowerSeries.subst (fun _ : Unit ↦
        MvPowerSeries.subst (Sum.elim (fun _ ↦ q₁) (fun _ ↦ q₂)) W.thirdRootSeries)
        (PowerSeries.invOfUnit W.uSeries 1) = 1 := by
  have h := congrArg (MvPowerSeries.substAlgHom
    (hasSubst_single (W.pair_thirdRoot_constantCoeff h₁ h₂))) W.mul_invOfUnit_uSeries
  simp only [map_mul, map_one] at h
  simpa only [MvPowerSeries.coe_substAlgHom
    (hasSubst_single (W.pair_thirdRoot_constantCoeff h₁ h₂))] using h
lemma pair_F_eq (h₁ : MvPowerSeries.constantCoeff q₁ = 0)
    (h₂ : MvPowerSeries.constantCoeff q₂ = 0) :
    MvPowerSeries.subst (Sum.elim (fun _ ↦ q₁) (fun _ ↦ q₂)) W.addSeries =
      -(MvPowerSeries.subst (Sum.elim (fun _ ↦ q₁) (fun _ ↦ q₂)) W.thirdRootSeries *
        MvPowerSeries.subst (fun _ : Unit ↦
          MvPowerSeries.subst (Sum.elim (fun _ ↦ q₁) (fun _ ↦ q₂)) W.thirdRootSeries)
          (PowerSeries.invOfUnit W.uSeries 1)) := by
  rw [W.pair_F_comp h₁ h₂,
    show W.inverseSeries = -(PowerSeries.X * PowerSeries.invOfUnit W.uSeries 1) from rfl,
    ← MvPowerSeries.coe_substAlgHom (hasSubst_single (W.pair_thirdRoot_constantCoeff h₁ h₂))]
  simp only [map_neg, map_mul]
  rw [MvPowerSeries.coe_substAlgHom (hasSubst_single (W.pair_thirdRoot_constantCoeff h₁ h₂)),
    show (PowerSeries.X : PowerSeries O) = MvPowerSeries.X () from rfl,
    MvPowerSeries.subst_X (hasSubst_single (W.pair_thirdRoot_constantCoeff h₁ h₂))]
lemma pair_wF (h₁ : MvPowerSeries.constantCoeff q₁ = 0)
    (h₂ : MvPowerSeries.constantCoeff q₂ = 0) :
    MvPowerSeries.subst (fun _ : Unit ↦
        MvPowerSeries.subst (Sum.elim (fun _ ↦ q₁) (fun _ ↦ q₂)) W.addSeries) W.wSeries =
      -(MvPowerSeries.subst (fun _ : Unit ↦
          MvPowerSeries.subst (Sum.elim (fun _ ↦ q₁) (fun _ ↦ q₂)) W.thirdRootSeries)
          W.wSeries *
        MvPowerSeries.subst (fun _ : Unit ↦
          MvPowerSeries.subst (Sum.elim (fun _ ↦ q₁) (fun _ ↦ q₂)) W.thirdRootSeries)
          (PowerSeries.invOfUnit W.uSeries 1)) := by
  have hT := W.pair_thirdRoot_constantCoeff h₁ h₂
  have hcomp : MvPowerSeries.subst (fun _ : Unit ↦
      MvPowerSeries.subst (Sum.elim (fun _ ↦ q₁) (fun _ ↦ q₂)) W.addSeries) W.wSeries =
      MvPowerSeries.subst (fun _ : Unit ↦
        MvPowerSeries.subst (Sum.elim (fun _ ↦ q₁) (fun _ ↦ q₂)) W.thirdRootSeries)
        (MvPowerSeries.subst (fun _ : Unit ↦ W.inverseSeries) W.wSeries) := by
    rw [MvPowerSeries.subst_comp_subst_apply
      (hasSubst_single W.constantCoeff_inverseSeries) (hasSubst_single hT),
      show (fun _ : Unit ↦ MvPowerSeries.subst (Sum.elim (fun _ ↦ q₁) (fun _ ↦ q₂))
          W.addSeries) = fun _ : Unit ↦ MvPowerSeries.subst (fun _ : Unit ↦
          MvPowerSeries.subst (Sum.elim (fun _ ↦ q₁) (fun _ ↦ q₂)) W.thirdRootSeries)
          W.inverseSeries
        from funext fun _ ↦ W.pair_F_comp h₁ h₂]
  rw [hcomp, show MvPowerSeries.subst (fun _ : Unit ↦ W.inverseSeries) W.wSeries =
      PowerSeries.subst W.inverseSeries W.wSeries from rfl, W.subst_inverseSeries_wSeries,
    ← MvPowerSeries.coe_substAlgHom (hasSubst_single hT)]
  simp only [map_neg, map_mul]
lemma pair_u_eq (h₁ : MvPowerSeries.constantCoeff q₁ = 0)
    (h₂ : MvPowerSeries.constantCoeff q₂ = 0) :
    MvPowerSeries.subst (fun _ : Unit ↦
        MvPowerSeries.subst (Sum.elim (fun _ ↦ q₁) (fun _ ↦ q₂)) W.thirdRootSeries)
        W.uSeries =
      1 - MvPowerSeries.C W.a₁ *
          MvPowerSeries.subst (Sum.elim (fun _ ↦ q₁) (fun _ ↦ q₂)) W.thirdRootSeries -
        MvPowerSeries.C W.a₃ * MvPowerSeries.subst (fun _ : Unit ↦
          MvPowerSeries.subst (Sum.elim (fun _ ↦ q₁) (fun _ ↦ q₂)) W.thirdRootSeries)
          W.wSeries := by
  have hT := W.pair_thirdRoot_constantCoeff h₁ h₂
  rw [uSeries, ← MvPowerSeries.coe_substAlgHom (hasSubst_single hT)]
  simp only [map_sub, map_one, map_mul]
  rw [MvPowerSeries.coe_substAlgHom (hasSubst_single hT)]
  simp only [show (PowerSeries.C : O →+* O⟦X⟧) = MvPowerSeries.C from rfl,
    show (PowerSeries.X : PowerSeries O) = MvPowerSeries.X () from rfl,
    MvPowerSeries.subst_C, MvPowerSeries.subst_X (hasSubst_single hT)]
lemma pair_A_mul (h₁ : MvPowerSeries.constantCoeff q₁ = 0)
    (h₂ : MvPowerSeries.constantCoeff q₂ = 0) :
    (1 + MvPowerSeries.C W.a₂ *
        MvPowerSeries.subst (Sum.elim (fun _ ↦ q₁) (fun _ ↦ q₂)) W.slopeSeries +
      MvPowerSeries.C W.a₄ *
        MvPowerSeries.subst (Sum.elim (fun _ ↦ q₁) (fun _ ↦ q₂)) W.slopeSeries ^ 2 +
      MvPowerSeries.C W.a₆ *
        MvPowerSeries.subst (Sum.elim (fun _ ↦ q₁) (fun _ ↦ q₂)) W.slopeSeries ^ 3) *
      MvPowerSeries.subst (Sum.elim (fun _ ↦ q₁) (fun _ ↦ q₂))
        (MvPowerSeries.invOfUnit (1 + MvPowerSeries.C W.a₂ * W.slopeSeries +
          MvPowerSeries.C W.a₄ * W.slopeSeries ^ 2 +
          MvPowerSeries.C W.a₆ * W.slopeSeries ^ 3) 1) = 1 := by
  have h := congrArg (MvPowerSeries.substAlgHom (hasSubst_pair h₁ h₂))
    (MvPowerSeries.mul_invOfUnit (1 + MvPowerSeries.C W.a₂ * W.slopeSeries +
      MvPowerSeries.C W.a₄ * W.slopeSeries ^ 2 +
      MvPowerSeries.C W.a₆ * W.slopeSeries ^ 3) 1 (by simp))
  simp only [map_mul, map_add, map_one, map_pow] at h
  simp only [MvPowerSeries.coe_substAlgHom (hasSubst_pair h₁ h₂)] at h
  rwa [show MvPowerSeries.subst (Sum.elim (fun _ ↦ q₁) (fun _ ↦ q₂))
      ((MvPowerSeries.C W.a₂ : MvPowerSeries (Unit ⊕ Unit) O)) = MvPowerSeries.C W.a₂
      from MvPowerSeries.subst_C _,
    show MvPowerSeries.subst (Sum.elim (fun _ ↦ q₁) (fun _ ↦ q₂))
      ((MvPowerSeries.C W.a₄ : MvPowerSeries (Unit ⊕ Unit) O)) = MvPowerSeries.C W.a₄
      from MvPowerSeries.subst_C _,
    show MvPowerSeries.subst (Sum.elim (fun _ ↦ q₁) (fun _ ↦ q₂))
      ((MvPowerSeries.C W.a₆ : MvPowerSeries (Unit ⊕ Unit) O)) = MvPowerSeries.C W.a₆
      from MvPowerSeries.subst_C _] at h
 
lemma pair_T₃_relation (h₁ : MvPowerSeries.constantCoeff q₁ = 0)
    (h₂ : MvPowerSeries.constantCoeff q₂ = 0) :
    (1 + MvPowerSeries.C W.a₂ *
        MvPowerSeries.subst (Sum.elim (fun _ ↦ q₁) (fun _ ↦ q₂)) W.slopeSeries +
      MvPowerSeries.C W.a₄ *
        MvPowerSeries.subst (Sum.elim (fun _ ↦ q₁) (fun _ ↦ q₂)) W.slopeSeries ^ 2 +
      MvPowerSeries.C W.a₆ *
        MvPowerSeries.subst (Sum.elim (fun _ ↦ q₁) (fun _ ↦ q₂)) W.slopeSeries ^ 3) *
      (MvPowerSeries.subst (Sum.elim (fun _ ↦ q₁) (fun _ ↦ q₂)) W.thirdRootSeries + q₁ + q₂) =
      -(MvPowerSeries.C W.a₁ *
          MvPowerSeries.subst (Sum.elim (fun _ ↦ q₁) (fun _ ↦ q₂)) W.slopeSeries +
        MvPowerSeries.C W.a₂ *
          MvPowerSeries.subst (Sum.elim (fun _ ↦ q₁) (fun _ ↦ q₂)) W.interceptSeries +
        MvPowerSeries.C W.a₃ *
          MvPowerSeries.subst (Sum.elim (fun _ ↦ q₁) (fun _ ↦ q₂)) W.slopeSeries ^ 2 +
        2 * MvPowerSeries.C W.a₄ *
          MvPowerSeries.subst (Sum.elim (fun _ ↦ q₁) (fun _ ↦ q₂)) W.slopeSeries *
          MvPowerSeries.subst (Sum.elim (fun _ ↦ q₁) (fun _ ↦ q₂)) W.interceptSeries +
        3 * MvPowerSeries.C W.a₆ *
          MvPowerSeries.subst (Sum.elim (fun _ ↦ q₁) (fun _ ↦ q₂)) W.slopeSeries ^ 2 *
          MvPowerSeries.subst (Sum.elim (fun _ ↦ q₁) (fun _ ↦ q₂)) W.interceptSeries) := by
  have hexp := congrArg (MvPowerSeries.substAlgHom (hasSubst_pair h₁ h₂))
    (show W.thirdRootSeries = -MvPowerSeries.X (Sum.inl ()) - MvPowerSeries.X (Sum.inr ()) -
      (MvPowerSeries.C W.a₁ * W.slopeSeries + MvPowerSeries.C W.a₂ * W.interceptSeries +
        MvPowerSeries.C W.a₃ * W.slopeSeries ^ 2 +
        2 * MvPowerSeries.C W.a₄ * W.slopeSeries * W.interceptSeries +
        3 * MvPowerSeries.C W.a₆ * W.slopeSeries ^ 2 * W.interceptSeries) *
      MvPowerSeries.invOfUnit (1 + MvPowerSeries.C W.a₂ * W.slopeSeries +
        MvPowerSeries.C W.a₄ * W.slopeSeries ^ 2 +
        MvPowerSeries.C W.a₆ * W.slopeSeries ^ 3) 1 from rfl)
  simp only [map_sub, map_neg, map_mul, map_add, map_pow, map_ofNat] at hexp
  simp only [MvPowerSeries.coe_substAlgHom (hasSubst_pair h₁ h₂),
    MvPowerSeries.subst_X (hasSubst_pair h₁ h₂), MvPowerSeries.subst_C, Sum.elim_inl,
    Sum.elim_inr] at hexp
  have hAd := W.pair_A_mul h₁ h₂
  set Λp := MvPowerSeries.subst (Sum.elim (fun _ ↦ q₁) (fun _ ↦ q₂)) W.slopeSeries
  set Np := MvPowerSeries.subst (Sum.elim (fun _ ↦ q₁) (fun _ ↦ q₂)) W.interceptSeries
  set Tp := MvPowerSeries.subst (Sum.elim (fun _ ↦ q₁) (fun _ ↦ q₂)) W.thirdRootSeries
  set dp := MvPowerSeries.subst (Sum.elim (fun _ ↦ q₁) (fun _ ↦ q₂))
    (MvPowerSeries.invOfUnit (1 + MvPowerSeries.C W.a₂ * W.slopeSeries +
      MvPowerSeries.C W.a₄ * W.slopeSeries ^ 2 +
      MvPowerSeries.C W.a₆ * W.slopeSeries ^ 3) 1)
  clear_value Λp Np Tp dp
  linear_combination (1 + MvPowerSeries.C W.a₂ * Λp + MvPowerSeries.C W.a₄ * Λp ^ 2 +
      MvPowerSeries.C W.a₆ * Λp ^ 3) * hexp -
    (MvPowerSeries.C W.a₁ * Λp + MvPowerSeries.C W.a₂ * Np + MvPowerSeries.C W.a₃ * Λp ^ 2 +
      2 * MvPowerSeries.C W.a₄ * Λp * Np + 3 * MvPowerSeries.C W.a₆ * Λp ^ 2 * Np) * hAd
end Pair
section SingleIota
variable {σ' : Type*} {q : MvPowerSeries σ' O}
lemma single_u_mul (hq : MvPowerSeries.constantCoeff q = 0) :
    MvPowerSeries.subst (fun _ : Unit ↦ q) W.uSeries *
      MvPowerSeries.subst (fun _ : Unit ↦ q) (PowerSeries.invOfUnit W.uSeries 1) = 1 := by
  have h := congrArg (MvPowerSeries.substAlgHom (hasSubst_single hq)) W.mul_invOfUnit_uSeries
  simp only [map_mul, map_one] at h
  simpa only [MvPowerSeries.coe_substAlgHom (hasSubst_single hq)] using h
lemma single_u_eq (hq : MvPowerSeries.constantCoeff q = 0) :
    MvPowerSeries.subst (fun _ : Unit ↦ q) W.uSeries =
      1 - MvPowerSeries.C W.a₁ * q -
        MvPowerSeries.C W.a₃ * MvPowerSeries.subst (fun _ : Unit ↦ q) W.wSeries := by
  rw [uSeries, ← MvPowerSeries.coe_substAlgHom (hasSubst_single hq)]
  simp only [map_sub, map_one, map_mul]
  rw [MvPowerSeries.coe_substAlgHom (hasSubst_single hq)]
  simp only [show (PowerSeries.C : O →+* O⟦X⟧) = MvPowerSeries.C from rfl,
    show (PowerSeries.X : PowerSeries O) = MvPowerSeries.X () from rfl,
    MvPowerSeries.subst_C, MvPowerSeries.subst_X (hasSubst_single hq)]
lemma single_iota_eq (hq : MvPowerSeries.constantCoeff q = 0) :
    MvPowerSeries.subst (fun _ : Unit ↦ q) W.inverseSeries =
      -(q * MvPowerSeries.subst (fun _ : Unit ↦ q) (PowerSeries.invOfUnit W.uSeries 1)) := by
  rw [show W.inverseSeries = -(PowerSeries.X * PowerSeries.invOfUnit W.uSeries 1) from rfl,
    ← MvPowerSeries.coe_substAlgHom (hasSubst_single hq)]
  simp only [map_neg, map_mul]
  rw [MvPowerSeries.coe_substAlgHom (hasSubst_single hq),
    show (PowerSeries.X : PowerSeries O) = MvPowerSeries.X () from rfl,
    MvPowerSeries.subst_X (hasSubst_single hq)]
lemma single_wIota (hq : MvPowerSeries.constantCoeff q = 0) :
    MvPowerSeries.subst
      (fun _ : Unit ↦ MvPowerSeries.subst (fun _ : Unit ↦ q) W.inverseSeries) W.wSeries =
      -(MvPowerSeries.subst (fun _ : Unit ↦ q) W.wSeries *
        MvPowerSeries.subst (fun _ : Unit ↦ q) (PowerSeries.invOfUnit W.uSeries 1)) := by
  have hcomp : MvPowerSeries.subst
      (fun _ : Unit ↦ MvPowerSeries.subst (fun _ : Unit ↦ q) W.inverseSeries) W.wSeries =
      MvPowerSeries.subst (fun _ : Unit ↦ q)
        (MvPowerSeries.subst (fun _ : Unit ↦ W.inverseSeries) W.wSeries) := by
    rw [MvPowerSeries.subst_comp_subst_apply
      (hasSubst_single W.constantCoeff_inverseSeries) (hasSubst_single hq)]
  rw [hcomp, show MvPowerSeries.subst (fun _ : Unit ↦ W.inverseSeries) W.wSeries =
      PowerSeries.subst W.inverseSeries W.wSeries from rfl, W.subst_inverseSeries_wSeries,
    ← MvPowerSeries.coe_substAlgHom (hasSubst_single hq)]
  simp only [map_neg, map_mul]

lemma pair_X_inverse_intercept_mul :
    MvPowerSeries.subst
        (Sum.elim (fun _ ↦ (MvPowerSeries.X () : MvPowerSeries Unit O)) fun _ ↦ W.inverseSeries)
        W.interceptSeries * (W.inverseSeries - MvPowerSeries.X ()) = 0 := by
  have h₁ : MvPowerSeries.constantCoeff (MvPowerSeries.X () : MvPowerSeries Unit O) = 0 :=
    MvPowerSeries.constantCoeff_X ()
  have h₂ : MvPowerSeries.constantCoeff (W.inverseSeries : MvPowerSeries Unit O) = 0 :=
    W.constantCoeff_inverseSeries
  have hi₁ := W.pair_intercept_identity₁ h₁ h₂
  have hi₂ := W.pair_intercept_identity₂ h₁ h₂
  have hidw : MvPowerSeries.subst (fun _ : Unit ↦ (MvPowerSeries.X () : MvPowerSeries Unit O))
      W.wSeries = W.wSeries := congrFun MvPowerSeries.subst_self _
  have hw : MvPowerSeries.subst (fun _ : Unit ↦ (W.inverseSeries : MvPowerSeries Unit O))
      W.wSeries = -(W.wSeries * PowerSeries.invOfUnit W.uSeries 1) := by
    rw [show MvPowerSeries.subst (fun _ : Unit ↦ (W.inverseSeries : MvPowerSeries Unit O))
        W.wSeries = PowerSeries.subst W.inverseSeries W.wSeries from rfl,
      W.subst_inverseSeries_wSeries]
  have hd : W.inverseSeries =
      -(MvPowerSeries.X () * PowerSeries.invOfUnit W.uSeries 1) := rfl
  rw [hidw] at hi₁
  rw [hw] at hi₂
  linear_combination W.inverseSeries * hi₁ - MvPowerSeries.X () * hi₂ +
    (W.wSeries : MvPowerSeries Unit O) * hd
end SingleIota
lemma line_left :
    W.slopeSeries * MvPowerSeries.X (Sum.inl ()) + W.interceptSeries =
      MvPowerSeries.rename (fun _ ↦ Sum.inl ()) W.wSeries := by
  rw [interceptSeries]
  ring
lemma line_right :
    W.slopeSeries * MvPowerSeries.X (Sum.inr ()) + W.interceptSeries =
      MvPowerSeries.rename (fun _ ↦ Sum.inr ()) W.wSeries := by
  rw [interceptSeries_eq]
  ring
lemma wsAt_rename (c : Unit → Unit ⊕ Unit) :
    MvPowerSeries.rename c W.wSeries =
      W.mvWStepAt (MvPowerSeries.X (c ())) (MvPowerSeries.rename c W.wSeries) := by
  conv_lhs => rw [W.wSeries_eq_wStep]
  simp only [wStep, wStepAt, mvWStepAt, map_add, map_mul, map_pow,
    show (PowerSeries.C : O →+* O⟦X⟧) = MvPowerSeries.C from rfl, MvPowerSeries.rename_C,
    show MvPowerSeries.rename c (PowerSeries.X : PowerSeries O) =
      MvPowerSeries.X (c ()) from MvPowerSeries.rename_X c ()]
 
lemma subst_pair_X_eq_rename {σ' : Type*} (s₁ s₂ : σ')
    (f : MvPowerSeries (Unit ⊕ Unit) O) :
    MvPowerSeries.subst
      (Sum.elim (fun _ ↦ (MvPowerSeries.X s₁ : MvPowerSeries σ' O)) fun _ ↦ MvPowerSeries.X s₂)
      f = MvPowerSeries.rename (Sum.elim (fun _ ↦ s₁) fun _ ↦ s₂) f := by
  rw [MvPowerSeries.rename_eq_subst]
  congr 1
  funext s
  rcases s with u | u <;> rfl
end OnLine
end Chord
end wSeries
end WeierstrassCurve
end
end

/- EllipticCurves.WeierstrassFormalGroup.GroupLaw -/
section
section
open ChabautyColeman PowerSeries IsDedekindDomain
namespace WeierstrassCurve
section wSeries
variable {O : Type*} [CommRing O] (W : WeierstrassCurve O)
section Chord
open MvPowerSeries
section OnLine
variable {σ : Type*}
section Domain
variable [IsDomain O]
lemma X_inl_ne_X_inr :
    (MvPowerSeries.X (Sum.inl ()) : MvPowerSeries (Unit ⊕ Unit) O) ≠
      MvPowerSeries.X (Sum.inr ()) := by
  intro h
  have h1 := congrArg (MvPowerSeries.coeff (Finsupp.single (Sum.inl ()) 1)) h
  simp [MvPowerSeries.coeff_X, Finsupp.single_eq_single_iff] at h1
set_option maxRecDepth 4000 in
 
lemma line_at_thirdRoot :
    W.slopeSeries * W.thirdRootSeries + W.interceptSeries =
      W.mvWStepAt W.thirdRootSeries
        (W.slopeSeries * W.thirdRootSeries + W.interceptSeries) := by
  have hC1 : W.slopeSeries * MvPowerSeries.X (Sum.inl ()) + W.interceptSeries =
      W.mvWStepAt (MvPowerSeries.X (Sum.inl ()))
        (W.slopeSeries * MvPowerSeries.X (Sum.inl ()) + W.interceptSeries) := by
    rw [W.line_left]
    exact W.wsAt_rename _
  have hC2 : W.slopeSeries * MvPowerSeries.X (Sum.inr ()) + W.interceptSeries =
      W.mvWStepAt (MvPowerSeries.X (Sum.inr ()))
        (W.slopeSeries * MvPowerSeries.X (Sum.inr ()) + W.interceptSeries) := by
    rw [W.line_right]
    exact W.wsAt_rename _
  have hAd : (1 + MvPowerSeries.C W.a₂ * W.slopeSeries +
      MvPowerSeries.C W.a₄ * W.slopeSeries ^ 2 + MvPowerSeries.C W.a₆ * W.slopeSeries ^ 3) *
      MvPowerSeries.invOfUnit (1 + MvPowerSeries.C W.a₂ * W.slopeSeries +
        MvPowerSeries.C W.a₄ * W.slopeSeries ^ 2 +
        MvPowerSeries.C W.a₆ * W.slopeSeries ^ 3) 1 = 1 :=
    MvPowerSeries.mul_invOfUnit _ 1 (by simp)
  simp only [mvWStepAt, thirdRootSeries] at hC1 ⊢
  set Λ := W.slopeSeries
  set N := W.interceptSeries
  set t₁ := (MvPowerSeries.X (Sum.inl ()) : MvPowerSeries (Unit ⊕ Unit) O)
  set t₂ := (MvPowerSeries.X (Sum.inr ()) : MvPowerSeries (Unit ⊕ Unit) O)
  set d := MvPowerSeries.invOfUnit (1 + MvPowerSeries.C W.a₂ * Λ +
    MvPowerSeries.C W.a₄ * Λ ^ 2 + MvPowerSeries.C W.a₆ * Λ ^ 3) 1
  
  have hsub : (t₁ - t₂) * (-(1 + MvPowerSeries.C W.a₂ * Λ + MvPowerSeries.C W.a₄ * Λ ^ 2 +
      MvPowerSeries.C W.a₆ * Λ ^ 3) * (t₁ ^ 2 + t₁ * t₂ + t₂ ^ 2) -
      (MvPowerSeries.C W.a₁ * Λ + MvPowerSeries.C W.a₂ * N + MvPowerSeries.C W.a₃ * Λ ^ 2 +
        2 * MvPowerSeries.C W.a₄ * Λ * N + 3 * MvPowerSeries.C W.a₆ * Λ ^ 2 * N) *
        (t₁ + t₂) +
      (Λ - (MvPowerSeries.C W.a₁ * N + 2 * MvPowerSeries.C W.a₃ * Λ * N +
        MvPowerSeries.C W.a₄ * N ^ 2 + 3 * MvPowerSeries.C W.a₆ * Λ * N ^ 2))) = 0 := by
    simp only [mvWStepAt] at hC1 hC2
    linear_combination hC1 - hC2
  have hE1 := (mul_eq_zero.mp hsub).resolve_left (sub_ne_zero.mpr X_inl_ne_X_inr)
  clear_value Λ N t₁ t₂ d
  set B := MvPowerSeries.C W.a₁ * Λ + MvPowerSeries.C W.a₂ * N + MvPowerSeries.C W.a₃ * Λ ^ 2 +
    2 * MvPowerSeries.C W.a₄ * Λ * N + 3 * MvPowerSeries.C W.a₆ * Λ ^ 2 * N with hB
  set T := -t₁ - t₂ - B * d with hT
  clear_value B T
  linear_combination hC1 + (T - t₁) * hE1 + ((T - t₁) * (T - t₂) * B) * hAd -
    ((T - t₁) * (T - t₂) * (1 + MvPowerSeries.C W.a₂ * Λ + MvPowerSeries.C W.a₄ * Λ ^ 2 +
      MvPowerSeries.C W.a₆ * Λ ^ 3)) * hT + (T ^ 2 - t₁ ^ 2) * hB

theorem subst_thirdRootSeries_wSeries :
    MvPowerSeries.subst (fun _ : Unit ↦ W.thirdRootSeries) W.wSeries =
      W.slopeSeries * W.thirdRootSeries + W.interceptSeries := by
  have hfix : MvPowerSeries.subst (fun _ : Unit ↦ W.thirdRootSeries) W.wSeries =
      W.mvWStepAt W.thirdRootSeries
        (MvPowerSeries.subst (fun _ : Unit ↦ W.thirdRootSeries) W.wSeries) := by
    conv_lhs => rw [W.wSeries_eq_wStep]
    rw [show W.wStep W.wSeries = W.wStepAt X W.wSeries from rfl]
    rw [wStepAt, ← MvPowerSeries.coe_substAlgHom W.hasSubst_thirdRootSeries]
    simp only [map_add, map_mul, map_pow]
    rw [MvPowerSeries.coe_substAlgHom W.hasSubst_thirdRootSeries]
    simp only [show (PowerSeries.C : O →+* O⟦X⟧) = MvPowerSeries.C from rfl,
      show (PowerSeries.X : PowerSeries O) = MvPowerSeries.X () from rfl,
      MvPowerSeries.subst_C, MvPowerSeries.subst_X W.hasSubst_thirdRootSeries, mvWStepAt]
  refine W.eq_of_mvWStepAt_fixed (q := W.thirdRootSeries)
    (lowVanish_one W.constantCoeff_thirdRootSeries) ?_ ?_ hfix W.line_at_thirdRoot
  · exact lowVanish_one (MvPowerSeries.constantCoeff_subst_eq_zero W.hasSubst_thirdRootSeries
      (fun _ ↦ W.constantCoeff_thirdRootSeries) W.constantCoeff_wSeries)
  · exact lowVanish_one (by simp)
 
lemma pair_online {σ' : Type*} {q₁ q₂ : MvPowerSeries σ' O}
    (h₁ : MvPowerSeries.constantCoeff q₁ = 0) (h₂ : MvPowerSeries.constantCoeff q₂ = 0) :
    MvPowerSeries.subst (fun _ : Unit ↦
        MvPowerSeries.subst (Sum.elim (fun _ ↦ q₁) (fun _ ↦ q₂)) W.thirdRootSeries)
        W.wSeries =
      MvPowerSeries.subst (Sum.elim (fun _ ↦ q₁) (fun _ ↦ q₂)) W.slopeSeries *
        MvPowerSeries.subst (Sum.elim (fun _ ↦ q₁) (fun _ ↦ q₂)) W.thirdRootSeries +
        MvPowerSeries.subst (Sum.elim (fun _ ↦ q₁) (fun _ ↦ q₂)) W.interceptSeries := by
  have h := congrArg (MvPowerSeries.substAlgHom (hasSubst_pair h₁ h₂))
    W.subst_thirdRootSeries_wSeries
  simp only [map_add, map_mul] at h
  simp only [MvPowerSeries.coe_substAlgHom (hasSubst_pair h₁ h₂)] at h
  rwa [MvPowerSeries.subst_comp_subst_apply W.hasSubst_thirdRootSeries
    (hasSubst_pair h₁ h₂)] at h
variable {σ' : Type*}
 
lemma subst_wSeries_ne_zero {q : MvPowerSeries σ' O}
    (hq : MvPowerSeries.constantCoeff q = 0) (hq0 : q ≠ 0) :
    MvPowerSeries.subst (fun _ : Unit ↦ q) W.wSeries ≠ 0 := by
  have hs := hasSubst_single hq
  have hexp : MvPowerSeries.subst (fun _ : Unit ↦ q) W.wSeries =
      q ^ 3 * MvPowerSeries.subst (fun _ : Unit ↦ q) W.vSeries := by
    conv_lhs => rw [W.wSeries_eq_X_pow_three_mul]
    rw [← MvPowerSeries.coe_substAlgHom hs, map_mul, map_pow,
      MvPowerSeries.coe_substAlgHom hs,
      show (PowerSeries.X : PowerSeries O) = MvPowerSeries.X () from rfl,
      MvPowerSeries.subst_X hs]
  rw [hexp]
  refine mul_ne_zero (pow_ne_zero 3 hq0) fun h ↦ ?_
  have hc := congrArg MvPowerSeries.constantCoeff h
  rw [map_zero, MvPowerSeries.constantCoeff_subst hs, finsum_eq_single _ (0 : Unit →₀ ℕ)
    (fun d hd ↦ ?_)] at hc
  · rw [show MvPowerSeries.coeff (0 : Unit →₀ ℕ) W.vSeries =
      PowerSeries.constantCoeff W.vSeries from rfl, W.constantCoeff_vSeries] at hc
    simp at hc
  · rcases Finsupp.ne_iff.mp hd with ⟨u, hu⟩
    have hu' : d u ≠ 0 := by simpa using hu
    rw [smul_eq_mul, Finsupp.prod, map_prod]
    refine mul_eq_zero_of_right _ (Finset.prod_eq_zero (Finsupp.mem_support_iff.mpr hu') ?_)
    rw [map_pow, hq, zero_pow hu']
 
lemma interceptSeries_ne_zero : W.interceptSeries ≠ 0 := by
  intro h
  have h1 := congrArg (MvPowerSeries.coeff
    (Finsupp.single (Sum.inl ()) 2 + Finsupp.single (Sum.inr ()) 1)) h
  rw [map_zero, interceptSeries, map_sub, coeff_rename_single,
    if_neg (by rw [eq_single_iff']; simp),
    show (MvPowerSeries.X (Sum.inl ()) : MvPowerSeries (Unit ⊕ Unit) O) =
      MvPowerSeries.monomial (Finsupp.single (Sum.inl ()) 1) 1 from rfl,
    MvPowerSeries.coeff_mul_monomial, if_pos (by
      refine Finsupp.le_def.mpr fun s ↦ ?_
      rcases s with u | u <;> simp),
    W.coeff_slopeSeries] at h1
  have h2 : ((Finsupp.single (Sum.inl ()) 2 + Finsupp.single (Sum.inr ()) 1 -
      Finsupp.single (Sum.inl ()) 1 : Unit ⊕ Unit →₀ ℕ)) (Sum.inl ()) = 1 := by
    simp
  have h3 : ((Finsupp.single (Sum.inl ()) 2 + Finsupp.single (Sum.inr ()) 1 -
      Finsupp.single (Sum.inl ()) 1 : Unit ⊕ Unit →₀ ℕ)) (Sum.inr ()) = 1 := by
    simp
  rw [h2, h3, W.coeff_wSeries_three, mul_one] at h1
  simp at h1
lemma X_pair_intercept_ne_zero {σ' : Type*} {s₁ s₂ : σ'} (h : s₁ ≠ s₂) :
    MvPowerSeries.subst
      (Sum.elim (fun _ ↦ (MvPowerSeries.X s₁ : MvPowerSeries σ' O)) fun _ ↦ MvPowerSeries.X s₂)
      W.interceptSeries ≠ 0 := by
  rw [subst_pair_X_eq_rename]
  intro h0
  refine W.interceptSeries_ne_zero (MvPowerSeries.rename_injective
    (⟨Sum.elim (fun _ ↦ s₁) fun _ ↦ s₂, ?_⟩ : Unit ⊕ Unit ↪ σ') ?_)
  · rintro (⟨⟩ | ⟨⟩) (⟨⟩ | ⟨⟩) hv
    · rfl
    · exact absurd hv h
    · exact absurd hv.symm h
    · rfl
  · rw [map_zero]
    exact h0

lemma pair_X_inverse_intercept_eq_zero
    (hne : W.inverseSeries ≠ (MvPowerSeries.X () : MvPowerSeries Unit O)) :
    MvPowerSeries.subst
        (Sum.elim (fun _ ↦ (MvPowerSeries.X () : MvPowerSeries Unit O)) fun _ ↦ W.inverseSeries)
        W.interceptSeries = 0 :=
  (mul_eq_zero.mp W.pair_X_inverse_intercept_mul).resolve_right (sub_ne_zero.mpr hne)

lemma pair_X_inverse_thirdRoot_eq_zero
    (hne : W.inverseSeries ≠ (MvPowerSeries.X () : MvPowerSeries Unit O))
    (h2 : (2 : O) ≠ 0) :
    MvPowerSeries.subst
        (Sum.elim (fun _ ↦ (MvPowerSeries.X () : MvPowerSeries Unit O)) fun _ ↦ W.inverseSeries)
        W.thirdRootSeries = 0 := by
  have h₁ : MvPowerSeries.constantCoeff (MvPowerSeries.X () : MvPowerSeries Unit O) = 0 :=
    MvPowerSeries.constantCoeff_X ()
  have h₂ : MvPowerSeries.constantCoeff (W.inverseSeries : MvPowerSeries Unit O) = 0 :=
    W.constantCoeff_inverseSeries
  have hNp := W.pair_X_inverse_intercept_eq_zero hne
  have hOL := W.pair_online h₁ h₂
  have hTc := W.pair_thirdRoot_constantCoeff h₁ h₂
  have hfix := W.subst_wSeries_fix hTc
  have hrel := W.pair_T₃_relation h₁ h₂
  have hslope := W.pair_slope_identity h₁ h₂
  have hidw : MvPowerSeries.subst (fun _ : Unit ↦ (MvPowerSeries.X () : MvPowerSeries Unit O))
      W.wSeries = W.wSeries := congrFun MvPowerSeries.subst_self _
  have hw : MvPowerSeries.subst (fun _ : Unit ↦ (W.inverseSeries : MvPowerSeries Unit O))
      W.wSeries = -(W.wSeries * PowerSeries.invOfUnit W.uSeries 1) := by
    rw [show MvPowerSeries.subst (fun _ : Unit ↦ (W.inverseSeries : MvPowerSeries Unit O))
        W.wSeries = PowerSeries.subst W.inverseSeries W.wSeries from rfl,
      W.subst_inverseSeries_wSeries]
  rw [hidw, hw] at hslope
  simp only [mvWStepAt] at hfix
  set d := PowerSeries.invOfUnit W.uSeries 1 with hddef
  set Λp := MvPowerSeries.subst
    (Sum.elim (fun _ ↦ (MvPowerSeries.X () : MvPowerSeries Unit O)) fun _ ↦ W.inverseSeries)
    W.slopeSeries
  set Tp := MvPowerSeries.subst
    (Sum.elim (fun _ ↦ (MvPowerSeries.X () : MvPowerSeries Unit O)) fun _ ↦ W.inverseSeries)
    W.thirdRootSeries
  set wT := MvPowerSeries.subst (fun _ : Unit ↦ Tp) W.wSeries
  rw [hNp, add_zero] at hOL
  
  have hTP : Tp * (Λp - Tp ^ 2 - MvPowerSeries.C W.a₁ * Λp * Tp -
      MvPowerSeries.C W.a₂ * Λp * Tp ^ 2 - MvPowerSeries.C W.a₃ * Λp ^ 2 * Tp -
      MvPowerSeries.C W.a₄ * Λp ^ 2 * Tp ^ 2 - MvPowerSeries.C W.a₆ * Λp ^ 3 * Tp ^ 2) = 0 := by
    linear_combination hfix - (1 - MvPowerSeries.C W.a₁ * Tp - MvPowerSeries.C W.a₂ * Tp ^ 2 -
      MvPowerSeries.C W.a₃ * (Λp * Tp + wT) - MvPowerSeries.C W.a₄ * Tp * (Λp * Tp + wT) -
      MvPowerSeries.C W.a₆ * (Λp ^ 2 * Tp ^ 2 + Λp * Tp * wT + wT ^ 2)) * hOL
  refine (mul_eq_zero.mp hTP).resolve_right fun hbranch ↦ ?_
  
  rw [hNp] at hrel
  have hcontr : W.wSeries * (d + 1) =
      (1 + MvPowerSeries.C W.a₂ * Λp + MvPowerSeries.C W.a₄ * Λp ^ 2 +
        MvPowerSeries.C W.a₆ * Λp ^ 3) * Tp *
        (MvPowerSeries.X () + W.inverseSeries) * (W.inverseSeries - MvPowerSeries.X ()) := by
    linear_combination hslope - (W.inverseSeries - MvPowerSeries.X ()) * hbranch -
      (W.inverseSeries - MvPowerSeries.X ()) * Tp * hrel
  have hd : W.inverseSeries =
      -(MvPowerSeries.X () * d) := rfl
  have hdvd : (MvPowerSeries.X () : MvPowerSeries Unit O) ^ 4 ∣
      (1 + MvPowerSeries.C W.a₂ * Λp + MvPowerSeries.C W.a₄ * Λp ^ 2 +
        MvPowerSeries.C W.a₆ * Λp ^ 3) * Tp *
        (MvPowerSeries.X () + W.inverseSeries) * (W.inverseSeries - MvPowerSeries.X ()) := by
    have d1 : (MvPowerSeries.X () : MvPowerSeries Unit O) ∣ Tp :=
      PowerSeries.X_dvd_iff.mpr hTc
    have d2 : (MvPowerSeries.X () : MvPowerSeries Unit O) ^ 2 ∣
        (MvPowerSeries.X () + W.inverseSeries) := by
      have h1d : (MvPowerSeries.X () : MvPowerSeries Unit O) ∣ (1 - d) :=
        PowerSeries.X_dvd_iff.mpr (by simp [hddef])
      obtain ⟨c, hc⟩ := h1d
      exact ⟨c, by rw [hd]; linear_combination MvPowerSeries.X () * hc⟩
    have d3 : (MvPowerSeries.X () : MvPowerSeries Unit O) ∣
        (W.inverseSeries - MvPowerSeries.X ()) :=
      PowerSeries.X_dvd_iff.mpr
        (by simp [show (MvPowerSeries.X () : MvPowerSeries Unit O) = PowerSeries.X from rfl])
    rw [show (MvPowerSeries.X () : MvPowerSeries Unit O) ^ 4 =
      MvPowerSeries.X () * MvPowerSeries.X () ^ 2 * MvPowerSeries.X () by ring]
    exact mul_dvd_mul (mul_dvd_mul (Dvd.dvd.mul_left d1 _) d2) d3
  have h3 := congrArg (PowerSeries.coeff 3) hcontr
  rw [PowerSeries.X_pow_dvd_iff.mp hdvd 3 (by lia), W.wSeries_eq_X_pow_three_mul,
    mul_assoc, show (3 : ℕ) = 0 + 3 from rfl, PowerSeries.coeff_X_pow_mul] at h3
  rw [PowerSeries.coeff_zero_eq_constantCoeff_apply, map_mul, W.constantCoeff_vSeries,
    map_add, map_one, one_mul, hddef, PowerSeries.constantCoeff_invOfUnit] at h3
  simp only [inv_one, Units.val_one] at h3
  exact h2 (by linear_combination h3)

lemma pair_X_inverse_addSeries_eq_zero
    (hne : W.inverseSeries ≠ (MvPowerSeries.X () : MvPowerSeries Unit O))
    (h2 : (2 : O) ≠ 0) :
    MvPowerSeries.subst
        (Sum.elim (fun _ ↦ (MvPowerSeries.X () : MvPowerSeries Unit O)) fun _ ↦ W.inverseSeries)
        W.addSeries = 0 := by
  rw [W.pair_F_eq (MvPowerSeries.constantCoeff_X ()) W.constantCoeff_inverseSeries,
    W.pair_X_inverse_thirdRoot_eq_zero hne h2, zero_mul, neg_zero]
end Domain
section Assembly
variable {σ' : Type*} {KK : Type*} [Field KK] [Algebra (MvPowerSeries σ' O) KK]
 
noncomputable def fracCurve (W : WeierstrassCurve O) (σ' : Type*) (KK : Type*)
    [Field KK] [Algebra (MvPowerSeries σ' O) KK] : WeierstrassCurve KK :=
  W.map ((algebraMap (MvPowerSeries σ' O) KK).comp MvPowerSeries.C)
lemma rho_weierstrass {q : MvPowerSeries σ' O}
    (hq : MvPowerSeries.constantCoeff q = 0) :
    algebraMap (MvPowerSeries σ' O) KK
        (MvPowerSeries.subst (fun _ : Unit ↦ q) W.wSeries) =
      algebraMap (MvPowerSeries σ' O) KK q ^ 3 +
        (fracCurve W σ' KK).a₁ * algebraMap (MvPowerSeries σ' O) KK q *
          algebraMap (MvPowerSeries σ' O) KK
            (MvPowerSeries.subst (fun _ : Unit ↦ q) W.wSeries) +
        (fracCurve W σ' KK).a₂ * algebraMap (MvPowerSeries σ' O) KK q ^ 2 *
          algebraMap (MvPowerSeries σ' O) KK
            (MvPowerSeries.subst (fun _ : Unit ↦ q) W.wSeries) +
        (fracCurve W σ' KK).a₃ * algebraMap (MvPowerSeries σ' O) KK
            (MvPowerSeries.subst (fun _ : Unit ↦ q) W.wSeries) ^ 2 +
        (fracCurve W σ' KK).a₄ * algebraMap (MvPowerSeries σ' O) KK q *
          algebraMap (MvPowerSeries σ' O) KK
            (MvPowerSeries.subst (fun _ : Unit ↦ q) W.wSeries) ^ 2 +
        (fracCurve W σ' KK).a₆ * algebraMap (MvPowerSeries σ' O) KK
            (MvPowerSeries.subst (fun _ : Unit ↦ q) W.wSeries) ^ 3 := by
  have h := congrArg (algebraMap (MvPowerSeries σ' O) KK) (W.subst_wSeries_fix hq)
  simp only [mvWStepAt, map_add, map_mul, map_pow] at h
  exact h
variable [IsDomain O] [IsFractionRing (MvPowerSeries σ' O) KK]
 
noncomputable def thetaPoint
    (hΔ : (fracCurve W σ' KK).Δ ≠ 0) {q : MvPowerSeries σ' O}
    (hq : MvPowerSeries.constantCoeff q = 0) (hq0 : q ≠ 0) :
    (fracCurve W σ' KK).toAffine.Point :=
  Affine.Point.some _ _ (chord_point_nonsingular (fracCurve W σ' KK)
    (W.rho_weierstrass hq)
    (fun h ↦ W.subst_wSeries_ne_zero hq hq0 ((IsFractionRing.injective (MvPowerSeries σ' O) KK)
      (by rw [h, map_zero])))
    hΔ)
variable [DecidableEq KK] in
 
lemma thetaPoint_add (hΔ : (fracCurve W σ' KK).Δ ≠ 0)
    {q₁ q₂ : MvPowerSeries σ' O}
    (h₁ : MvPowerSeries.constantCoeff q₁ = 0) (h₂ : MvPowerSeries.constantCoeff q₂ = 0)
    (hq₁0 : q₁ ≠ 0) (hq₂0 : q₂ ≠ 0) (hq₁₂ : q₁ ≠ q₂)
    (hN : MvPowerSeries.subst (Sum.elim (fun _ ↦ q₁) (fun _ ↦ q₂)) W.interceptSeries ≠ 0)
    (hF : MvPowerSeries.constantCoeff
      (MvPowerSeries.subst (Sum.elim (fun _ ↦ q₁) (fun _ ↦ q₂)) W.addSeries) = 0)
    (hF0 : MvPowerSeries.subst (Sum.elim (fun _ ↦ q₁) (fun _ ↦ q₂)) W.addSeries ≠ 0) :
    W.thetaPoint hΔ h₁ hq₁0 + W.thetaPoint hΔ h₂ hq₂0 = W.thetaPoint hΔ hF hF0 := by
  classical
  set ρ := algebraMap (MvPowerSeries σ' O) KK with hρ
  have hinj : Function.Injective ρ := IsFractionRing.injective (MvPowerSeries σ' O) KK
  set Λp := MvPowerSeries.subst (Sum.elim (fun _ ↦ q₁) (fun _ ↦ q₂)) W.slopeSeries with hΛp
  set Np := MvPowerSeries.subst (Sum.elim (fun _ ↦ q₁) (fun _ ↦ q₂)) W.interceptSeries with hNp
  set Tp := MvPowerSeries.subst (Sum.elim (fun _ ↦ q₁) (fun _ ↦ q₂)) W.thirdRootSeries with hTp
  set w₁ := MvPowerSeries.subst (fun _ : Unit ↦ q₁) W.wSeries with hw₁'
  set w₂ := MvPowerSeries.subst (fun _ : Unit ↦ q₂) W.wSeries with hw₂'
  set wT := MvPowerSeries.subst (fun _ : Unit ↦ Tp) W.wSeries with hwT'
  
  have hslope : ρ Λp * (ρ q₂ - ρ q₁) = ρ w₂ - ρ w₁ := by
    rw [← map_sub, ← map_sub, ← map_mul]
    exact congrArg ρ (W.pair_slope_identity h₁ h₂)
  have hNint : ρ Np = ρ w₁ - ρ Λp * ρ q₁ := by
    rw [← map_mul, ← map_sub]
    exact congrArg ρ (W.pair_intercept_identity₁ h₁ h₂)
  have hT₃ : (1 + (fracCurve W σ' KK).a₂ * ρ Λp + (fracCurve W σ' KK).a₄ * ρ Λp ^ 2 +
      (fracCurve W σ' KK).a₆ * ρ Λp ^ 3) * (ρ Tp + ρ q₁ + ρ q₂) =
      -((fracCurve W σ' KK).a₁ * ρ Λp + (fracCurve W σ' KK).a₂ * ρ Np +
        (fracCurve W σ' KK).a₃ * ρ Λp ^ 2 +
        2 * (fracCurve W σ' KK).a₄ * ρ Λp * ρ Np +
        3 * (fracCurve W σ' KK).a₆ * ρ Λp ^ 2 * ρ Np) := by
    have h := congrArg ρ (W.pair_T₃_relation h₁ h₂)
    simp only [map_add, map_mul, map_neg, map_pow, map_one, map_ofNat] at h
    exact h
  have hwT : ρ wT = ρ Λp * ρ Tp + ρ Np := by
    have h := congrArg ρ (W.pair_online h₁ h₂)
    simp only [map_add, map_mul] at h
    exact h
  have hA : (1 + (fracCurve W σ' KK).a₂ * ρ Λp + (fracCurve W σ' KK).a₄ * ρ Λp ^ 2 +
      (fracCurve W σ' KK).a₆ * ρ Λp ^ 3) ≠ 0 := by
    intro h
    have h0 : ρ (1 + MvPowerSeries.C W.a₂ * Λp + MvPowerSeries.C W.a₄ * Λp ^ 2 +
        MvPowerSeries.C W.a₆ * Λp ^ 3) = 0 := by
      simp only [map_add, map_mul, map_pow, map_one]
      exact h
    have h1 : (1 : MvPowerSeries σ' O) + MvPowerSeries.C W.a₂ * Λp +
        MvPowerSeries.C W.a₄ * Λp ^ 2 + MvPowerSeries.C W.a₆ * Λp ^ 3 = 0 :=
      hinj (by rw [h0, map_zero])
    have h2 := congrArg MvPowerSeries.constantCoeff h1
    have hΛ0 : MvPowerSeries.constantCoeff Λp = 0 :=
      MvPowerSeries.constantCoeff_subst_eq_zero (hasSubst_pair h₁ h₂)
        (by rintro (j | j) <;> simpa) W.constantCoeff_slopeSeries
    simp [hΛ0] at h2
  have hTp0 : Tp ≠ 0 := by
    intro h
    apply hN
    have honline := W.pair_online h₁ h₂
    rw [← hTp, h] at honline
    rw [show (fun _ : Unit ↦ (0 : MvPowerSeries σ' O)) = 0 from rfl,
      MvPowerSeries.subst_zero_of_constantCoeff_zero W.constantCoeff_wSeries] at honline
    rw [← hNp, ← hΛp] at honline
    linear_combination -honline
  have hw₁0 : ρ w₁ ≠ 0 := fun h ↦ W.subst_wSeries_ne_zero h₁ hq₁0 (hinj (by rw [h, map_zero]))
  have hw₂0 : ρ w₂ ≠ 0 := fun h ↦ W.subst_wSeries_ne_zero h₂ hq₂0 (hinj (by rw [h, map_zero]))
  have hTc : MvPowerSeries.constantCoeff Tp = 0 := W.pair_thirdRoot_constantCoeff h₁ h₂
  have hwT0 : ρ wT ≠ 0 := fun h ↦ W.subst_wSeries_ne_zero hTc hTp0 (hinj (by rw [h, map_zero]))
  have hqw : q₁ * w₂ - q₂ * w₁ = Np * (q₁ - q₂) := by
    have i₁ := W.pair_intercept_identity₁ h₁ h₂
    have i₂ := W.pair_intercept_identity₂ h₁ h₂
    rw [← hNp, ← hΛp, ← hw₁'] at i₁
    rw [← hNp, ← hΛp, ← hw₂'] at i₂
    linear_combination q₂ * i₁ - q₁ * i₂
  have hx : ρ q₁ * ρ w₂ - ρ q₂ * ρ w₁ ≠ 0 := by
    rw [← map_mul, ← map_mul, ← map_sub]
    intro h
    have := hinj (by rw [h, map_zero] : ρ (q₁ * w₂ - q₂ * w₁) = ρ 0)
    rw [hqw] at this
    exact (mul_ne_zero hN (sub_ne_zero.mpr hq₁₂)) this
  
  have hwq₁ := W.rho_weierstrass (KK := KK) h₁
  have hwq₂ := W.rho_weierstrass (KK := KK) h₂
  
  obtain ⟨h₃, hadd⟩ := chord_point_add (fracCurve W σ' KK) hwq₁ hwq₂ hslope hNint hT₃ hwT hA
    hw₁0 hw₂0 hwT0 hx
    (chord_point_nonsingular (fracCurve W σ' KK) hwq₁ hw₁0 hΔ)
    (chord_point_nonsingular (fracCurve W σ' KK) hwq₂ hw₂0 hΔ)
  refine Eq.trans (show W.thetaPoint hΔ h₁ hq₁0 + W.thetaPoint hΔ h₂ hq₂0 =
    Affine.Point.some _ _ h₃ from hadd) ?_
  
  set sp := MvPowerSeries.subst (fun _ : Unit ↦ Tp)
    (PowerSeries.invOfUnit W.uSeries 1) with hsp'
  have hu : ρ (MvPowerSeries.subst (fun _ : Unit ↦ Tp) W.uSeries) * ρ sp = 1 := by
    rw [← map_mul, ← map_one ρ]
    exact congrArg ρ (W.pair_u_mul h₁ h₂)
  have hueq : ρ (MvPowerSeries.subst (fun _ : Unit ↦ Tp) W.uSeries) =
      1 - (fracCurve W σ' KK).a₁ * ρ Tp - (fracCurve W σ' KK).a₃ * ρ wT := by
    have h := congrArg ρ (W.pair_u_eq h₁ h₂)
    simp only [map_sub, map_mul, map_one] at h
    exact h
  have hsp0 : ρ sp ≠ 0 := by
    intro h
    rw [h, mul_zero] at hu
    exact one_ne_zero hu.symm
  have hFeq : ρ (MvPowerSeries.subst (Sum.elim (fun _ ↦ q₁) (fun _ ↦ q₂)) W.addSeries) =
      -(ρ Tp * ρ sp) := by
    have h := congrArg ρ (W.pair_F_eq h₁ h₂)
    simp only [map_neg, map_mul] at h
    exact h
  have hwFeq : ρ (MvPowerSeries.subst (fun _ : Unit ↦
      MvPowerSeries.subst (Sum.elim (fun _ ↦ q₁) (fun _ ↦ q₂)) W.addSeries) W.wSeries) =
      -(ρ wT * ρ sp) := by
    have h := congrArg ρ (W.pair_wF h₁ h₂)
    simp only [map_neg, map_mul] at h
    exact h
  rw [thetaPoint]
  simp only [Affine.Point.some.injEq]
  constructor
  · rw [hFeq, hwFeq]
    field_simp
  · rw [hwFeq, div_eq_div_iff hwT0 (neg_ne_zero.mpr (mul_ne_zero hwT0 hsp0))]
    linear_combination (-(ρ wT)) * hu + (ρ wT * ρ sp) * hueq
 
lemma thetaPoint_neg (hΔ : (fracCurve W σ' KK).Δ ≠ 0)
    {q : MvPowerSeries σ' O} (hq : MvPowerSeries.constantCoeff q = 0) (hq0 : q ≠ 0)
    (hi : MvPowerSeries.constantCoeff
      (MvPowerSeries.subst (fun _ : Unit ↦ q) W.inverseSeries) = 0)
    (hi0 : MvPowerSeries.subst (fun _ : Unit ↦ q) W.inverseSeries ≠ 0) :
    W.thetaPoint hΔ hi hi0 = -W.thetaPoint hΔ hq hq0 := by
  classical
  set ρ := algebraMap (MvPowerSeries σ' O) KK with hρ
  have hu : ρ (MvPowerSeries.subst (fun _ : Unit ↦ q) W.uSeries) *
      ρ (MvPowerSeries.subst (fun _ : Unit ↦ q) (PowerSeries.invOfUnit W.uSeries 1)) = 1 := by
    rw [← map_mul, ← map_one ρ]
    exact congrArg ρ (W.single_u_mul hq)
  have hsp0 : ρ (MvPowerSeries.subst (fun _ : Unit ↦ q)
      (PowerSeries.invOfUnit W.uSeries 1)) ≠ 0 := by
    intro h
    rw [h, mul_zero] at hu
    exact one_ne_zero hu.symm
  have hIeq : ρ (MvPowerSeries.subst (fun _ : Unit ↦ q) W.inverseSeries) =
      -(ρ q * ρ (MvPowerSeries.subst (fun _ : Unit ↦ q)
        (PowerSeries.invOfUnit W.uSeries 1))) := by
    have h := congrArg ρ (W.single_iota_eq hq)
    simpa only [map_neg, map_mul] using h
  have hwIeq : ρ (MvPowerSeries.subst (fun _ : Unit ↦
      MvPowerSeries.subst (fun _ : Unit ↦ q) W.inverseSeries) W.wSeries) =
      -(ρ (MvPowerSeries.subst (fun _ : Unit ↦ q) W.wSeries) *
        ρ (MvPowerSeries.subst (fun _ : Unit ↦ q)
          (PowerSeries.invOfUnit W.uSeries 1))) := by
    have h := congrArg ρ (W.single_wIota hq)
    simpa only [map_neg, map_mul] using h
  have hueq : ρ (MvPowerSeries.subst (fun _ : Unit ↦ q) W.uSeries) =
      1 - (fracCurve W σ' KK).a₁ * ρ q -
        (fracCurve W σ' KK).a₃ * ρ (MvPowerSeries.subst (fun _ : Unit ↦ q) W.wSeries) := by
    have h := congrArg ρ (W.single_u_eq hq)
    simp only [map_sub, map_mul, map_one] at h
    exact h
  have hw0 : ρ (MvPowerSeries.subst (fun _ : Unit ↦ q) W.wSeries) ≠ 0 := fun h ↦
    W.subst_wSeries_ne_zero hq hq0
      ((IsFractionRing.injective (MvPowerSeries σ' O) KK) (by rw [h, map_zero]))
  simp only [thetaPoint, Affine.Point.neg_some, Affine.Point.some.injEq]
  simp only [← hρ]
  constructor
  · rw [hIeq, hwIeq]
    field_simp
  · rw [hwIeq, Affine.negY]
    field_simp
    linear_combination
      ρ (MvPowerSeries.subst (fun _ : Unit ↦ q) (PowerSeries.invOfUnit W.uSeries 1)) * hueq -
      hu
 
lemma thetaPoint_inj (hΔ : (fracCurve W σ' KK).Δ ≠ 0)
    {q₁ q₂ : MvPowerSeries σ' O}
    (h₁ : MvPowerSeries.constantCoeff q₁ = 0) (h₂ : MvPowerSeries.constantCoeff q₂ = 0)
    (hq₁0 : q₁ ≠ 0) (hq₂0 : q₂ ≠ 0)
    (h : W.thetaPoint hΔ h₁ hq₁0 = W.thetaPoint hΔ h₂ hq₂0) : q₁ = q₂ := by
  classical
  set ρ := algebraMap (MvPowerSeries σ' O) KK with hρ
  have hinj : Function.Injective ρ := IsFractionRing.injective (MvPowerSeries σ' O) KK
  simp only [thetaPoint, Affine.Point.some.injEq] at h
  simp only [← hρ] at h
  have hw₁0 : ρ (MvPowerSeries.subst (fun _ : Unit ↦ q₁) W.wSeries) ≠ 0 := fun hh ↦
    W.subst_wSeries_ne_zero h₁ hq₁0 (hinj (by rw [hh, map_zero]))
  have hw₂0 : ρ (MvPowerSeries.subst (fun _ : Unit ↦ q₂) W.wSeries) ≠ 0 := fun hh ↦
    W.subst_wSeries_ne_zero h₂ hq₂0 (hinj (by rw [hh, map_zero]))
  have hw : ρ (MvPowerSeries.subst (fun _ : Unit ↦ q₁) W.wSeries) =
      ρ (MvPowerSeries.subst (fun _ : Unit ↦ q₂) W.wSeries) := by
    have h2 := h.2
    field_simp at h2
    linear_combination h2
  refine hinj ?_
  have h1 := h.1
  rw [div_eq_div_iff hw₁0 hw₂0, hw] at h1
  exact mul_right_cancel₀ hw₂0 h1

lemma pair_intercept_ne_zero_of_ne (hΔ : (fracCurve W σ' KK).Δ ≠ 0)
    {q₁ q₂ : MvPowerSeries σ' O}
    (h₁ : MvPowerSeries.constantCoeff q₁ = 0) (h₂ : MvPowerSeries.constantCoeff q₂ = 0)
    (hq₁0 : q₁ ≠ 0) (hq₂0 : q₂ ≠ 0) (hne₁ : q₁ ≠ q₂)
    (hne₂ : q₁ ≠ MvPowerSeries.subst (fun _ : Unit ↦ q₂) W.inverseSeries) :
    MvPowerSeries.subst (Sum.elim (fun _ ↦ q₁) (fun _ ↦ q₂)) W.interceptSeries ≠ 0 := by
  classical
  intro h0
  set ρ := algebraMap (MvPowerSeries σ' O) KK with hρ
  have hinj : Function.Injective ρ := IsFractionRing.injective (MvPowerSeries σ' O) KK
  
  have hqw : q₁ * MvPowerSeries.subst (fun _ : Unit ↦ q₂) W.wSeries -
      q₂ * MvPowerSeries.subst (fun _ : Unit ↦ q₁) W.wSeries = 0 := by
    have i₁ := W.pair_intercept_identity₁ h₁ h₂
    have i₂ := W.pair_intercept_identity₂ h₁ h₂
    rw [h0] at i₁ i₂
    linear_combination q₂ * i₁ - q₁ * i₂
  have hw₁0 : ρ (MvPowerSeries.subst (fun _ : Unit ↦ q₁) W.wSeries) ≠ 0 := fun hh ↦
    W.subst_wSeries_ne_zero h₁ hq₁0 (hinj (by rw [hh, map_zero]))
  have hw₂0 : ρ (MvPowerSeries.subst (fun _ : Unit ↦ q₂) W.wSeries) ≠ 0 := fun hh ↦
    W.subst_wSeries_ne_zero h₂ hq₂0 (hinj (by rw [hh, map_zero]))
  have hx : ρ q₁ / ρ (MvPowerSeries.subst (fun _ : Unit ↦ q₁) W.wSeries) =
      ρ q₂ / ρ (MvPowerSeries.subst (fun _ : Unit ↦ q₂) W.wSeries) := by
    rw [div_eq_div_iff hw₁0 hw₂0, ← map_mul, ← map_mul]
    exact congrArg ρ (by linear_combination hqw)
  
  have hcase := (Affine.Point.X_eq_iff
    (h₁ := (chord_point_nonsingular (fracCurve W σ' KK) (W.rho_weierstrass h₁) hw₁0 hΔ))
    (h₂ := (chord_point_nonsingular (fracCurve W σ' KK) (W.rho_weierstrass h₂) hw₂0 hΔ))).mp hx
  
  have hs0 : MvPowerSeries.subst (fun _ : Unit ↦ q₂)
      (PowerSeries.invOfUnit W.uSeries 1) ≠ 0 := by
    intro hh
    have := W.single_u_mul h₂
    rw [hh, mul_zero] at this
    exact one_ne_zero this.symm
  have hi : MvPowerSeries.constantCoeff
      (MvPowerSeries.subst (fun _ : Unit ↦ q₂) W.inverseSeries) = 0 :=
    MvPowerSeries.constantCoeff_subst_eq_zero (hasSubst_single h₂) (fun _ ↦ h₂)
      W.constantCoeff_inverseSeries
  have hi0 : MvPowerSeries.subst (fun _ : Unit ↦ q₂) W.inverseSeries ≠ 0 := by
    rw [W.single_iota_eq h₂]
    exact neg_ne_zero.mpr (mul_ne_zero hq₂0 hs0)
  rcases hcase with hc | hc
  · exact hne₁ (W.thetaPoint_inj hΔ h₁ h₂ hq₁0 hq₂0 hc)
  · have hc' : W.thetaPoint hΔ h₁ hq₁0 = -W.thetaPoint hΔ h₂ hq₂0 := hc
    rw [← W.thetaPoint_neg hΔ h₂ hq₂0 hi hi0] at hc'
    exact hne₂ (W.thetaPoint_inj hΔ h₁ hi hq₁0 hi0 hc')
end Assembly
section Universal
 
noncomputable def universal : WeierstrassCurve (MvPolynomial (Fin 5) ℤ) :=
  ⟨MvPolynomial.X 0, MvPolynomial.X 1, MvPolynomial.X 2, MvPolynomial.X 3, MvPolynomial.X 4⟩
 
theorem exists_map_universal (W : WeierstrassCurve O) :
    ∃ φ : MvPolynomial (Fin 5) ℤ →+* O, universal.map φ = W := by
  refine ⟨(MvPolynomial.aeval ![W.a₁, W.a₂, W.a₃, W.a₄, W.a₆]).toRingHom, ?_⟩
  ext <;> simp [universal, WeierstrassCurve.map]
lemma universal_Δ_ne_zero : universal.Δ ≠ 0 := by
  intro h
  have h2 := congrArg (MvPolynomial.aeval (R := ℤ) ![0, 0, 0, -1, 0]).toRingHom h
  rw [map_zero, ← WeierstrassCurve.map_Δ] at h2
  norm_num [WeierstrassCurve.Δ, WeierstrassCurve.b₂, WeierstrassCurve.b₄, WeierstrassCurve.b₆,
    WeierstrassCurve.b₈, universal, WeierstrassCurve.map] at h2
  revert h2
  decide

lemma X_ne_X {σ'' : Type*} {O' : Type*} [CommRing O'] [Nontrivial O'] {s t : σ''}
    (h : s ≠ t) : (MvPowerSeries.X s : MvPowerSeries σ'' O') ≠ MvPowerSeries.X t := by
  classical
  intro h0
  have h1 := congrArg (MvPowerSeries.coeff (Finsupp.single s 1)) h0
  simp [MvPowerSeries.coeff_X, Finsupp.single_eq_single_iff, h] at h1
lemma X_ne_zero' {σ'' : Type*} {O' : Type*} [CommRing O'] [Nontrivial O'] (s : σ'') :
    (MvPowerSeries.X s : MvPowerSeries σ'' O') ≠ 0 := by
  classical
  intro h0
  have h1 := congrArg (MvPowerSeries.coeff (Finsupp.single s 1)) h0
  simp [MvPowerSeries.coeff_X] at h1
theorem assoc_addSeries_universal :
    MvPowerSeries.subst (assocLeftFam (fun _ : Unit ↦ universal.addSeries))
      universal.addSeries =
    MvPowerSeries.subst (assocRightFam (fun _ : Unit ↦ universal.addSeries))
      universal.addSeries := by
  classical
  set KK := FractionRing (MvPowerSeries (Unit ⊕ Unit ⊕ Unit) (MvPolynomial (Fin 5) ℤ))
    with hKK
  
  have hΔ : (fracCurve universal (Unit ⊕ Unit ⊕ Unit) KK).Δ ≠ 0 := by
    rw [fracCurve, WeierstrassCurve.map_Δ]
    intro h
    exact universal_Δ_ne_zero (MvPowerSeries.C_injective
      (IsFractionRing.injective (MvPowerSeries (Unit ⊕ Unit ⊕ Unit) (MvPolynomial (Fin 5) ℤ))
        KK (by rw [RingHom.comp_apply] at h; simp [h])))
  
  have hc₁ : MvPowerSeries.constantCoeff (MvPowerSeries.X (Sum.inl ()) :
      MvPowerSeries (Unit ⊕ Unit ⊕ Unit) (MvPolynomial (Fin 5) ℤ)) = 0 :=
    MvPowerSeries.constantCoeff_X _
  have hc₂ : MvPowerSeries.constantCoeff (MvPowerSeries.X (Sum.inr (Sum.inl ())) :
      MvPowerSeries (Unit ⊕ Unit ⊕ Unit) (MvPolynomial (Fin 5) ℤ)) = 0 :=
    MvPowerSeries.constantCoeff_X _
  have hc₃ : MvPowerSeries.constantCoeff (MvPowerSeries.X (Sum.inr (Sum.inr ())) :
      MvPowerSeries (Unit ⊕ Unit ⊕ Unit) (MvPolynomial (Fin 5) ℤ)) = 0 :=
    MvPowerSeries.constantCoeff_X _
  have h10 := X_ne_zero' (O' := MvPolynomial (Fin 5) ℤ) (Sum.inl () : Unit ⊕ Unit ⊕ Unit)
  have h20 := X_ne_zero' (O' := MvPolynomial (Fin 5) ℤ)
    (Sum.inr (Sum.inl ()) : Unit ⊕ Unit ⊕ Unit)
  have h30 := X_ne_zero' (O' := MvPolynomial (Fin 5) ℤ)
    (Sum.inr (Sum.inr ()) : Unit ⊕ Unit ⊕ Unit)
  
  set F₁₂ := MvPowerSeries.subst (Sum.elim (fun _ ↦ (MvPowerSeries.X (Sum.inl ()) :
      MvPowerSeries (Unit ⊕ Unit ⊕ Unit) (MvPolynomial (Fin 5) ℤ)))
      (fun _ ↦ MvPowerSeries.X (Sum.inr (Sum.inl ())))) universal.addSeries with hF₁₂'
  set F₂₃ := MvPowerSeries.subst (Sum.elim (fun _ ↦ (MvPowerSeries.X (Sum.inr (Sum.inl ())) :
      MvPowerSeries (Unit ⊕ Unit ⊕ Unit) (MvPolynomial (Fin 5) ℤ)))
      (fun _ ↦ MvPowerSeries.X (Sum.inr (Sum.inr ())))) universal.addSeries with hF₂₃'
  have hF₁₂c : MvPowerSeries.constantCoeff F₁₂ = 0 :=
    MvPowerSeries.constantCoeff_subst_eq_zero (hasSubst_pair hc₁ hc₂)
      (by rintro (j | j) <;> simp [MvPowerSeries.constantCoeff_X])
      universal.constantCoeff_addSeries
  have hF₂₃c : MvPowerSeries.constantCoeff F₂₃ = 0 :=
    MvPowerSeries.constantCoeff_subst_eq_zero (hasSubst_pair hc₂ hc₃)
      (by rintro (j | j) <;> simp [MvPowerSeries.constantCoeff_X])
      universal.constantCoeff_addSeries
  
  have hχ : MvPowerSeries.HasSubst (Sum.elim (fun _ ↦ (PowerSeries.X : PowerSeries
      (MvPolynomial (Fin 5) ℤ))) (fun _ ↦ 0) : Unit ⊕ Unit ⊕ Unit →
      MvPowerSeries Unit (MvPolynomial (Fin 5) ℤ)) :=
    MvPowerSeries.hasSubst_of_constantCoeff_zero (by
      rintro (j | j)
      · exact PowerSeries.constantCoeff_X
      · simp)
  
  have hχF₁₂ : MvPowerSeries.subst (Sum.elim (fun _ ↦ (PowerSeries.X : PowerSeries
      (MvPolynomial (Fin 5) ℤ))) (fun _ ↦ 0)) F₁₂ = PowerSeries.X := by
    rw [hF₁₂', MvPowerSeries.subst_comp_subst_apply (hasSubst_pair hc₁ hc₂) hχ,
      show (fun s : Unit ⊕ Unit ↦ MvPowerSeries.subst (Sum.elim (fun _ ↦ (PowerSeries.X :
          PowerSeries (MvPolynomial (Fin 5) ℤ))) (fun _ ↦ 0))
          (Sum.elim (fun _ ↦ (MvPowerSeries.X (Sum.inl ()) :
            MvPowerSeries (Unit ⊕ Unit ⊕ Unit) (MvPolynomial (Fin 5) ℤ)))
            (fun _ ↦ MvPowerSeries.X (Sum.inr (Sum.inl ()))) s)) =
        (Sum.elim MvPowerSeries.X (fun _ ↦ 0) :
          Unit ⊕ Unit → MvPowerSeries Unit (MvPolynomial (Fin 5) ℤ)) from funext fun s ↦ by
        rcases s with u | u <;> simp only [Sum.elim_inl, Sum.elim_inr] <;>
          rw [MvPowerSeries.subst_X hχ] <;> rfl]
    exact universal.subst_unitR_addSeries
  have hχF₂₃ : MvPowerSeries.subst (Sum.elim (fun _ ↦ (PowerSeries.X : PowerSeries
      (MvPolynomial (Fin 5) ℤ))) (fun _ ↦ 0)) F₂₃ = 0 := by
    rw [hF₂₃', MvPowerSeries.subst_comp_subst_apply (hasSubst_pair hc₂ hc₃) hχ,
      show (fun s : Unit ⊕ Unit ↦ MvPowerSeries.subst (Sum.elim (fun _ ↦ (PowerSeries.X :
          PowerSeries (MvPolynomial (Fin 5) ℤ))) (fun _ ↦ 0))
          (Sum.elim (fun _ ↦ (MvPowerSeries.X (Sum.inr (Sum.inl ())) :
            MvPowerSeries (Unit ⊕ Unit ⊕ Unit) (MvPolynomial (Fin 5) ℤ)))
            (fun _ ↦ MvPowerSeries.X (Sum.inr (Sum.inr ()))) s)) =
        (0 : Unit ⊕ Unit → MvPowerSeries Unit (MvPolynomial (Fin 5) ℤ)) from funext fun s ↦ by
        rcases s with u | u <;> simp only [Sum.elim_inl, Sum.elim_inr] <;>
          rw [MvPowerSeries.subst_X hχ] <;> rfl]
    exact MvPowerSeries.subst_zero_of_constantCoeff_zero universal.constantCoeff_addSeries
  
  have hχι : ∀ q : MvPowerSeries (Unit ⊕ Unit ⊕ Unit) (MvPolynomial (Fin 5) ℤ),
      MvPowerSeries.constantCoeff q = 0 →
      MvPowerSeries.subst (Sum.elim (fun _ ↦ (PowerSeries.X : PowerSeries
        (MvPolynomial (Fin 5) ℤ))) (fun _ ↦ 0)) q = 0 →
      MvPowerSeries.subst (Sum.elim (fun _ ↦ (PowerSeries.X : PowerSeries
        (MvPolynomial (Fin 5) ℤ))) (fun _ ↦ 0))
        (MvPowerSeries.subst (fun _ : Unit ↦ q) universal.inverseSeries) = 0 := by
    intro q hqc hq0
    rw [MvPowerSeries.subst_comp_subst_apply (hasSubst_single hqc) hχ,
      show (fun _ : Unit ↦ MvPowerSeries.subst (Sum.elim (fun _ ↦ (PowerSeries.X :
          PowerSeries (MvPolynomial (Fin 5) ℤ))) (fun _ ↦ 0)) q) =
        (0 : Unit → MvPowerSeries Unit (MvPolynomial (Fin 5) ℤ)) from funext fun _ ↦ hq0]
    exact MvPowerSeries.subst_zero_of_constantCoeff_zero universal.constantCoeff_inverseSeries
  have hχu₃ : MvPowerSeries.subst (Sum.elim (fun _ ↦ (PowerSeries.X : PowerSeries
      (MvPolynomial (Fin 5) ℤ))) (fun _ ↦ 0))
      (MvPowerSeries.X (Sum.inr (Sum.inr ())) :
        MvPowerSeries (Unit ⊕ Unit ⊕ Unit) (MvPolynomial (Fin 5) ℤ)) = 0 := by
    rw [MvPowerSeries.subst_X hχ]
    rfl
  have hχu₁ : MvPowerSeries.subst (Sum.elim (fun _ ↦ (PowerSeries.X : PowerSeries
      (MvPolynomial (Fin 5) ℤ))) (fun _ ↦ 0))
      (MvPowerSeries.X (Sum.inl ()) :
        MvPowerSeries (Unit ⊕ Unit ⊕ Unit) (MvPolynomial (Fin 5) ℤ)) = PowerSeries.X := by
    rw [MvPowerSeries.subst_X hχ]
    rfl
  
  have hXPS : (PowerSeries.X : PowerSeries (MvPolynomial (Fin 5) ℤ)) ≠ 0 := by
    intro h
    have h1 := congrArg (PowerSeries.coeff 1) h
    simp at h1
  have hF₁₂0 : F₁₂ ≠ 0 := by
    intro h
    rw [h, ← MvPowerSeries.coe_substAlgHom hχ, map_zero] at hχF₁₂
    exact hXPS hχF₁₂.symm
  have hFne : universal.addSeries ≠ 0 := by
    intro h
    have h2 := universal.subst_unitR_addSeries
    rw [h, ← MvPowerSeries.coe_substAlgHom hasSubst_unitR, map_zero] at h2
    exact hXPS h2.symm
  have hF₂₃0 : F₂₃ ≠ 0 := by
    rw [hF₂₃', subst_pair_X_eq_rename]
    intro h
    refine hFne (MvPowerSeries.rename_injective (⟨Sum.elim (fun _ ↦ Sum.inr (Sum.inl ()))
      (fun _ ↦ Sum.inr (Sum.inr ())), ?_⟩ : Unit ⊕ Unit ↪ Unit ⊕ Unit ⊕ Unit) ?_)
    · rintro (⟨⟩ | ⟨⟩) (⟨⟩ | ⟨⟩) hv
      · rfl
      · exact absurd hv (by simp)
      · exact absurd hv (by simp)
      · rfl
    · rw [map_zero]
      exact h
  
  have hne_a : F₁₂ ≠ MvPowerSeries.X (Sum.inr (Sum.inr ())) := by
    intro h
    have h2 := congrArg (MvPowerSeries.subst (Sum.elim (fun _ ↦ (PowerSeries.X : PowerSeries
      (MvPolynomial (Fin 5) ℤ))) (fun _ ↦ 0))) h
    rw [hχF₁₂, hχu₃] at h2
    exact hXPS h2
  have hne_b : F₁₂ ≠ MvPowerSeries.subst (fun _ : Unit ↦ (MvPowerSeries.X (Sum.inr (Sum.inr ()))
      : MvPowerSeries (Unit ⊕ Unit ⊕ Unit) (MvPolynomial (Fin 5) ℤ)))
      universal.inverseSeries := by
    intro h
    have h2 := congrArg (MvPowerSeries.subst (Sum.elim (fun _ ↦ (PowerSeries.X : PowerSeries
      (MvPolynomial (Fin 5) ℤ))) (fun _ ↦ 0))) h
    rw [hχF₁₂, hχι _ hc₃ hχu₃] at h2
    exact hXPS h2
  have hne_c : MvPowerSeries.X (Sum.inl ()) ≠ F₂₃ := by
    intro h
    have h2 := congrArg (MvPowerSeries.subst (Sum.elim (fun _ ↦ (PowerSeries.X : PowerSeries
      (MvPolynomial (Fin 5) ℤ))) (fun _ ↦ 0))) h
    rw [hχu₁, hχF₂₃] at h2
    exact hXPS h2
  have hne_d : MvPowerSeries.X (Sum.inl ()) ≠ MvPowerSeries.subst (fun _ : Unit ↦ F₂₃)
      universal.inverseSeries := by
    intro h
    have h2 := congrArg (MvPowerSeries.subst (Sum.elim (fun _ ↦ (PowerSeries.X : PowerSeries
      (MvPolynomial (Fin 5) ℤ))) (fun _ ↦ 0))) h
    rw [hχu₁, hχι _ hF₂₃c hχF₂₃] at h2
    exact hXPS h2
  
  have hN₁₂ := universal.X_pair_intercept_ne_zero
    (s₁ := (Sum.inl () : Unit ⊕ Unit ⊕ Unit)) (s₂ := Sum.inr (Sum.inl ())) (by simp)
  have hN₂₃ := universal.X_pair_intercept_ne_zero
    (s₁ := (Sum.inr (Sum.inl ()) : Unit ⊕ Unit ⊕ Unit)) (s₂ := Sum.inr (Sum.inr ()))
    (by simp)
  have hNL := universal.pair_intercept_ne_zero_of_ne (KK := KK) hΔ hF₁₂c hc₃ hF₁₂0 h30
    hne_a hne_b
  have hNR := universal.pair_intercept_ne_zero_of_ne (KK := KK) hΔ hc₁ hF₂₃c h10 hF₂₃0
    hne_c hne_d
  
  have hLc : MvPowerSeries.constantCoeff (MvPowerSeries.subst
      (Sum.elim (fun _ ↦ F₁₂) (fun _ ↦ MvPowerSeries.X (Sum.inr (Sum.inr ()))))
      universal.addSeries) = 0 :=
    MvPowerSeries.constantCoeff_subst_eq_zero (hasSubst_pair hF₁₂c hc₃)
      (by rintro (j | j) <;> simp [hF₁₂c, MvPowerSeries.constantCoeff_X])
      universal.constantCoeff_addSeries
  have hRc : MvPowerSeries.constantCoeff (MvPowerSeries.subst
      (Sum.elim (fun _ ↦ MvPowerSeries.X (Sum.inl ())) (fun _ ↦ F₂₃))
      universal.addSeries) = 0 :=
    MvPowerSeries.constantCoeff_subst_eq_zero (hasSubst_pair hc₁ hF₂₃c)
      (by rintro (j | j) <;> simp [hF₂₃c, MvPowerSeries.constantCoeff_X])
      universal.constantCoeff_addSeries
  have hL0 : MvPowerSeries.subst
      (Sum.elim (fun _ ↦ F₁₂) (fun _ ↦ MvPowerSeries.X (Sum.inr (Sum.inr ()))))
      universal.addSeries ≠ 0 := by
    intro h
    have h2 := congrArg (MvPowerSeries.subst (Sum.elim (fun _ ↦ (PowerSeries.X : PowerSeries
      (MvPolynomial (Fin 5) ℤ))) (fun _ ↦ 0))) h
    rw [MvPowerSeries.subst_comp_subst_apply (hasSubst_pair hF₁₂c hc₃) hχ,
      show (fun s : Unit ⊕ Unit ↦ MvPowerSeries.subst (Sum.elim (fun _ ↦ (PowerSeries.X :
          PowerSeries (MvPolynomial (Fin 5) ℤ))) (fun _ ↦ 0))
          (Sum.elim (fun _ ↦ F₁₂) (fun _ ↦ MvPowerSeries.X (Sum.inr (Sum.inr ()))) s)) =
        (Sum.elim MvPowerSeries.X (fun _ ↦ 0) :
          Unit ⊕ Unit → MvPowerSeries Unit (MvPolynomial (Fin 5) ℤ)) from funext fun s ↦ by
        rcases s with u | u
        · simp only [Sum.elim_inl]
          exact hχF₁₂
        · simp only [Sum.elim_inr]
          exact hχu₃,
      universal.subst_unitR_addSeries, ← MvPowerSeries.coe_substAlgHom hχ, map_zero] at h2
    exact hXPS h2
  have hR0 : MvPowerSeries.subst
      (Sum.elim (fun _ ↦ MvPowerSeries.X (Sum.inl ())) (fun _ ↦ F₂₃))
      universal.addSeries ≠ 0 := by
    intro h
    have h2 := congrArg (MvPowerSeries.subst (Sum.elim (fun _ ↦ (PowerSeries.X : PowerSeries
      (MvPolynomial (Fin 5) ℤ))) (fun _ ↦ 0))) h
    rw [MvPowerSeries.subst_comp_subst_apply (hasSubst_pair hc₁ hF₂₃c) hχ,
      show (fun s : Unit ⊕ Unit ↦ MvPowerSeries.subst (Sum.elim (fun _ ↦ (PowerSeries.X :
          PowerSeries (MvPolynomial (Fin 5) ℤ))) (fun _ ↦ 0))
          (Sum.elim (fun _ ↦ MvPowerSeries.X (Sum.inl ())) (fun _ ↦ F₂₃) s)) =
        (Sum.elim MvPowerSeries.X (fun _ ↦ 0) :
          Unit ⊕ Unit → MvPowerSeries Unit (MvPolynomial (Fin 5) ℤ)) from funext fun s ↦ by
        rcases s with u | u
        · simp only [Sum.elim_inl]
          exact hχu₁
        · simp only [Sum.elim_inr]
          exact hχF₂₃,
      universal.subst_unitR_addSeries, ← MvPowerSeries.coe_substAlgHom hχ, map_zero] at h2
    exact hXPS h2
  
  have e₁₂ := universal.thetaPoint_add (KK := KK) hΔ hc₁ hc₂ h10 h20
    (X_ne_X (by simp)) hN₁₂ hF₁₂c hF₁₂0
  have e₂₃ := universal.thetaPoint_add (KK := KK) hΔ hc₂ hc₃ h20 h30
    (X_ne_X (by simp)) hN₂₃ hF₂₃c hF₂₃0
  have eL := universal.thetaPoint_add (KK := KK) hΔ hF₁₂c hc₃ hF₁₂0 h30 hne_a hNL hLc hL0
  have eR := universal.thetaPoint_add (KK := KK) hΔ hc₁ hF₂₃c h10 hF₂₃0 hne_c hNR hRc hR0
  have hpts : universal.thetaPoint hΔ hLc hL0 = universal.thetaPoint hΔ hRc hR0 := by
    rw [← eL, ← e₁₂, ← eR, ← e₂₃, add_assoc]
  have hkey := universal.thetaPoint_inj hΔ hLc hRc hL0 hR0 hpts
  exact hkey

theorem assoc_addSeries (W : WeierstrassCurve O) :
    MvPowerSeries.subst (assocLeftFam (fun _ : Unit ↦ W.addSeries)) W.addSeries =
      MvPowerSeries.subst (assocRightFam (fun _ : Unit ↦ W.addSeries)) W.addSeries := by
  obtain ⟨φ, rfl⟩ := exists_map_universal W
  have h := congrArg (MvPowerSeries.map φ) assoc_addSeries_universal
  rw [MvPowerSeries.map_subst universal.hasSubst_assocLeftFam_addSeries,
    MvPowerSeries.map_subst universal.hasSubst_assocRightFam_addSeries,
    universal.map_assocLeftFam_addSeries φ, universal.map_assocRightFam_addSeries φ,
    universal.map_addSeries φ] at h
  exact h
lemma universal_inverseSeries_ne_X :
    universal.inverseSeries ≠
      (MvPowerSeries.X () : MvPowerSeries Unit (MvPolynomial (Fin 5) ℤ)) := by
  intro h
  have h1 := congrArg (PowerSeries.coeff 1) h
  rw [show universal.inverseSeries =
      -(PowerSeries.X * PowerSeries.invOfUnit universal.uSeries 1) from rfl, map_neg,
    show (1 : ℕ) = 0 + 1 from rfl, PowerSeries.coeff_succ_X_mul,
    PowerSeries.coeff_zero_eq_constantCoeff_apply, PowerSeries.constantCoeff_invOfUnit,
    show (MvPowerSeries.X () : MvPowerSeries Unit (MvPolynomial (Fin 5) ℤ)) = PowerSeries.X
      from rfl, PowerSeries.coeff_one_X, inv_one, Units.val_one] at h1
  have h2 := congrArg (MvPolynomial.eval (0 : Fin 5 → ℤ)) h1
  rw [map_neg, map_one] at h2
  exact absurd h2 (by decide)

theorem subst_inverseSeries_addSeries (W : WeierstrassCurve O) :
    MvPowerSeries.subst
        (Sum.elim (fun _ ↦ (MvPowerSeries.X () : MvPowerSeries Unit O)) fun _ ↦ W.inverseSeries)
        W.addSeries = 0 := by
  obtain ⟨φ, rfl⟩ := exists_map_universal W
  have h := congrArg (MvPowerSeries.map φ) (universal.pair_X_inverse_addSeries_eq_zero
    universal_inverseSeries_ne_X (by norm_num))
  rw [map_zero, MvPowerSeries.map_subst (hasSubst_pair (MvPowerSeries.constantCoeff_X ())
    universal.constantCoeff_inverseSeries), universal.map_addSeries φ] at h
  rw [show (fun s ↦ MvPowerSeries.map φ ((Sum.elim (fun _ ↦ (MvPowerSeries.X () :
      MvPowerSeries Unit (MvPolynomial (Fin 5) ℤ))) fun _ ↦ universal.inverseSeries) s)) =
      Sum.elim (fun _ ↦ (MvPowerSeries.X () : MvPowerSeries Unit O))
        fun _ ↦ (universal.map φ).inverseSeries from funext fun s ↦ by
      rcases s with u | u
      · exact MvPowerSeries.map_X φ ()
      · exact universal.map_inverseSeries φ] at h
  exact h
end Universal
end OnLine
end Chord

noncomputable def formalGroupLaw (W : WeierstrassCurve O) : FormalGroupLaw O Unit where
  F := fun _ ↦ W.addSeries
  zero_constantCoeff := fun _ ↦ W.constantCoeff_addSeries
  add_zero' := fun _ ↦ W.subst_unitR_addSeries
  zero_add' := fun _ ↦ W.subst_unitL_addSeries
  assoc' := fun _ ↦ W.assoc_addSeries
  comm' := fun _ ↦ by
    rw [show (fun s : Unit ⊕ Unit ↦ (MvPowerSeries.X s.swap : MvPowerSeries (Unit ⊕ Unit) O))
        = (MvPowerSeries.X ∘ Sum.swap) from rfl, ← MvPowerSeries.rename_eq_subst]
    exact W.rename_swap_addSeries
end wSeries
end WeierstrassCurve
end
end

/- EllipticCurves.WeierstrassFormalGroup.Eval -/
section
section
open ChabautyColeman IsLocalRing MvPowerSeries
open scoped MvPowerSeries.WithPiTopology
namespace WeierstrassCurve
variable {O : Type*} [CommRing O] [IsLocalRing O]
 
theorem _root_.IsLocalRing.isUnit_of_sub_one_mem_maximalIdeal {u : O}
    (h : u - 1 ∈ maximalIdeal O) : IsUnit u :=
  sub_sub_cancel 1 u ▸ isUnit_one_sub_self_of_mem_nonunits _ (by simpa using neg_mem h)
variable (W : WeierstrassCurve O)

def wPoly (t r : O) : O :=
  t ^ 3 + W.a₁ * t * r + W.a₂ * t ^ 2 * r + W.a₃ * r ^ 2 + W.a₄ * t * r ^ 2 + W.a₆ * r ^ 3

theorem eq_of_wPoly_fixed {t r r' : O} (ht : t ∈ maximalIdeal O) (hr : r ∈ maximalIdeal O)
    (hr' : r' ∈ maximalIdeal O) (h : r = W.wPoly t r) (h' : r' = W.wPoly t r') : r = r' := by
  have hm : W.a₁ * t + W.a₂ * t ^ 2 + W.a₃ * (r + r') + W.a₄ * t * (r + r') +
      W.a₆ * (r ^ 2 + r * r' + r' ^ 2) ∈ maximalIdeal O := by
    refine add_mem (add_mem (add_mem (add_mem ?_ ?_) ?_) ?_) ?_
    · exact Ideal.mul_mem_left _ _ ht
    · exact Ideal.mul_mem_left _ _ (Ideal.pow_mem_of_mem _ ht 2 two_pos)
    · exact Ideal.mul_mem_left _ _ (add_mem hr hr')
    · exact Ideal.mul_mem_left _ _ (add_mem hr hr')
    · exact Ideal.mul_mem_left _ _ (add_mem (add_mem (Ideal.pow_mem_of_mem _ hr 2 two_pos)
        (Ideal.mul_mem_right _ _ hr)) (Ideal.pow_mem_of_mem _ hr' 2 two_pos))
  have hkey : (1 - (W.a₁ * t + W.a₂ * t ^ 2 + W.a₃ * (r + r') +
      W.a₄ * t * (r + r') + W.a₆ * (r ^ 2 + r * r' + r' ^ 2))) * (r - r') = 0 := by
    simp only [wPoly] at h h'
    linear_combination h - h'
  have hu : IsUnit (1 - (W.a₁ * t + W.a₂ * t ^ 2 + W.a₃ * (r + r') +
      W.a₄ * t * (r + r') + W.a₆ * (r ^ 2 + r * r' + r' ^ 2))) :=
    IsLocalRing.isUnit_of_sub_one_mem_maximalIdeal (by simpa using neg_mem hm)
  exact sub_eq_zero.mp (hu.mul_right_eq_zero.mp hkey)

lemma isUnit_chordCoeff {Λ : O} (hΛ : Λ ∈ maximalIdeal O) :
    IsUnit (1 + W.a₂ * Λ + W.a₄ * Λ ^ 2 + W.a₆ * Λ ^ 3) := by
  refine IsLocalRing.isUnit_of_sub_one_mem_maximalIdeal ?_
  rw [show 1 + W.a₂ * Λ + W.a₄ * Λ ^ 2 + W.a₆ * Λ ^ 3 - 1 =
    W.a₂ * Λ + W.a₄ * Λ ^ 2 + W.a₆ * Λ ^ 3 by ring]
  exact add_mem (add_mem (Ideal.mul_mem_left _ _ hΛ)
    (Ideal.mul_mem_left _ _ (Ideal.pow_mem_of_mem _ hΛ 2 two_pos)))
    (Ideal.mul_mem_left _ _ (Ideal.pow_mem_of_mem _ hΛ 3 (by lia)))
variable [UniformSpace O] [Fact (IsAdic (maximalIdeal O))]
omit W in
lemma hasEval_pairElim {t₁ t₂ : O} (h₁ : t₁ ∈ maximalIdeal O)
    (h₂ : t₂ ∈ maximalIdeal O) :
    MvPowerSeries.HasEval (Sum.elim (fun _ ↦ t₁) fun _ ↦ t₂ : Unit ⊕ Unit → O) :=
  MvPSeries.hasEval_of_mem (by rintro (j | j) <;> assumption)
variable [IsUniformAddGroup O] [CompleteSpace O] [T2Space O] [IsTopologicalRing O]
omit W in

theorem _root_.ChabautyColeman.MvPSeries.eval_mem_maximalIdeal_pow
    {σ : Type*} [Finite σ] {z₀ : σ → O} (hz₀ : MvPowerSeries.HasEval z₀) {k : ℕ}
    (hmem : ∀ i, z₀ i ∈ maximalIdeal O ^ k) (h : MvPowerSeries σ O)
    (hcc : MvPowerSeries.constantCoeff h ∈ maximalIdeal O ^ k) :
    MvPSeries.eval z₀ h ∈ maximalIdeal O ^ k := by
  classical
  have htot := MvPSeries.hasSum_eval hz₀ h
  have hval : ∀ d : σ →₀ ℕ,
      MvPowerSeries.coeff d h * d.prod (fun s e ↦ z₀ s ^ e) ∈ maximalIdeal O ^ k := by
    intro d
    rcases eq_or_ne d 0 with rfl | hd
    · simpa using hcc
    · obtain ⟨i, hi⟩ := Finsupp.support_nonempty_iff.mpr hd
      rw [Finsupp.prod, ← Finset.prod_erase_mul _ _ hi]
      exact Ideal.mul_mem_left _ _ (Ideal.mul_mem_left _ _
        (Ideal.pow_mem_of_mem _ (hmem i) _
          (Nat.pos_of_ne_zero (Finsupp.mem_support_iff.mp hi))))
  have hsum := tsum_mem (IsAdic.isClosed_pow (I := maximalIdeal O) Fact.out k) hval
  rwa [htot.tsum_eq] at hsum
omit W in

theorem _root_.ChabautyColeman.MvPSeries.eval_mem_maximalIdeal_pow_mul
    {σ : Type*} [Finite σ] {z₀ : σ → O} (hz₀ : MvPowerSeries.HasEval z₀) {j c : ℕ}
    (hmem : ∀ i, z₀ i ∈ maximalIdeal O ^ j) (h : MvPowerSeries σ O)
    (hcoeff : ∀ d : σ →₀ ℕ, d.degree < c → MvPowerSeries.coeff d h = 0) :
    MvPSeries.eval z₀ h ∈ maximalIdeal O ^ (c * j) := by
  classical
  have htot := MvPSeries.hasSum_eval hz₀ h
  have hval : ∀ d : σ →₀ ℕ,
      MvPowerSeries.coeff d h * d.prod (fun s e ↦ z₀ s ^ e) ∈ maximalIdeal O ^ (c * j) := by
    intro d
    rcases lt_or_ge d.degree c with hlt | hge
    · rw [hcoeff d hlt, zero_mul]
      exact zero_mem _
    
    have key : ∀ t : Finset σ, (∏ s ∈ t, z₀ s ^ d s) ∈ maximalIdeal O ^ (j * ∑ s ∈ t, d s) := by
      intro t
      induction t using Finset.induction with
      | empty => simp
      | insert s t hs ih =>
        rw [Finset.prod_insert hs, Finset.sum_insert hs, Nat.mul_add, pow_add]
        exact Ideal.mul_mem_mul (pow_mul (maximalIdeal O) j (d s) ▸
          Ideal.pow_mem_pow (hmem s) (d s)) ih
    refine Ideal.mul_mem_left _ _ (SetLike.le_def.mp
      (Ideal.pow_le_pow_right (by calc c * j ≤ d.degree * j := by gcongr
        _ = j * d.degree := mul_comm _ _)) ?_)
    have hdeg : d.degree = ∑ s ∈ d.support, d s := rfl
    rw [Finsupp.prod, hdeg]
    exact key d.support
  have hsum := tsum_mem (IsAdic.isClosed_pow (I := maximalIdeal O) Fact.out (c * j)) hval
  rwa [htot.tsum_eq] at hsum
 
noncomputable def wEval (t : O) : O := MvPSeries.eval (fun _ : Unit ↦ t) W.wSeries
 
noncomputable def vEval (t : O) : O := MvPSeries.eval (fun _ : Unit ↦ t) W.vSeries
variable {t : O} (ht : t ∈ maximalIdeal O)
include ht
theorem wEval_mem : W.wEval t ∈ maximalIdeal O :=
  MvPSeries.eval_mem_maximalIdeal (MvPSeries.hasEval_of_mem fun _ ↦ ht) (fun _ ↦ ht)
    W.wSeries (by rw [W.constantCoeff_wSeries_mv]; exact zero_mem _)
 
theorem wEval_eq : W.wEval t = W.wPoly t (W.wEval t) := by
  have hE : MvPowerSeries.HasEval fun _ : Unit ↦ t := MvPSeries.hasEval_of_mem fun _ ↦ ht
  have h := congrArg (MvPSeries.evalRingHom hE) W.wSeries_eq
  simp only [map_add, map_mul, map_pow, MvPSeries.evalRingHom_apply] at h
  rw [show (PowerSeries.C : O →+* PowerSeries O) = MvPowerSeries.C from rfl,
    show (PowerSeries.X : PowerSeries O) = MvPowerSeries.X () from rfl] at h
  simp only [MvPSeries.eval_C, MvPSeries.eval_X] at h
  exact h.trans (by rw [wPoly, wEval])
 
theorem wEval_eq_cube_mul : W.wEval t = t ^ 3 * W.vEval t := by
  have hE : MvPowerSeries.HasEval fun _ : Unit ↦ t := MvPSeries.hasEval_of_mem fun _ ↦ ht
  have h := congrArg (MvPSeries.evalRingHom hE) W.wSeries_eq_X_pow_three_mul
  simp only [map_mul, map_pow, MvPSeries.evalRingHom_apply,
    show (PowerSeries.X : PowerSeries O) = MvPowerSeries.X () from rfl,
    MvPSeries.eval_X] at h
  exact h
theorem vEval_sub_one_mem : W.vEval t - 1 ∈ maximalIdeal O := by
  have h := MvPSeries.eval_sub_constantCoeff_mem (MvPSeries.hasEval_of_mem fun _ ↦ ht)
    (fun _ ↦ ht) W.vSeries
  rwa [show MvPowerSeries.constantCoeff W.vSeries = PowerSeries.constantCoeff W.vSeries
    from rfl, W.constantCoeff_vSeries] at h
theorem isUnit_vEval : IsUnit (W.vEval t) :=
  IsLocalRing.isUnit_of_sub_one_mem_maximalIdeal (W.vEval_sub_one_mem ht)
omit ht in
theorem wEval_ne_zero [IsDomain O] (ht : t ∈ maximalIdeal O) (ht0 : t ≠ 0) :
    W.wEval t ≠ 0 := by
  rw [W.wEval_eq_cube_mul ht]
  exact mul_ne_zero (pow_ne_zero 3 ht0) (W.isUnit_vEval ht).ne_zero
omit ht
 
noncomputable def uEval (t : O) : O := MvPSeries.eval (fun _ : Unit ↦ t) W.uSeries
 
noncomputable def duEval (t : O) : O :=
  MvPSeries.eval (fun _ : Unit ↦ t) (PowerSeries.invOfUnit W.uSeries 1)
 
noncomputable def iotaEval (t : O) : O := MvPSeries.eval (fun _ : Unit ↦ t) W.inverseSeries
include ht
theorem uEval_eq : W.uEval t = 1 - W.a₁ * t - W.a₃ * W.wEval t := by
  have hE : MvPowerSeries.HasEval fun _ : Unit ↦ t := MvPSeries.hasEval_of_mem fun _ ↦ ht
  have h := congrArg (MvPSeries.evalRingHom hE) (show W.uSeries =
    1 - PowerSeries.C W.a₁ * PowerSeries.X - PowerSeries.C W.a₃ * W.wSeries from rfl)
  simp only [map_sub, map_one, map_mul, MvPSeries.evalRingHom_apply] at h
  rw [show (PowerSeries.C : O →+* PowerSeries O) = MvPowerSeries.C from rfl,
    show (PowerSeries.X : PowerSeries O) = MvPowerSeries.X () from rfl] at h
  simp only [MvPSeries.eval_C, MvPSeries.eval_X] at h
  exact h
theorem uEval_mul_duEval : W.uEval t * W.duEval t = 1 := by
  have hE : MvPowerSeries.HasEval fun _ : Unit ↦ t := MvPSeries.hasEval_of_mem fun _ ↦ ht
  have h := congrArg (MvPSeries.evalRingHom hE) W.mul_invOfUnit_uSeries
  simp only [map_mul, map_one, MvPSeries.evalRingHom_apply] at h
  exact h
theorem isUnit_duEval : IsUnit (W.duEval t) :=
  IsUnit.of_mul_eq_one _ (by rw [mul_comm]; exact W.uEval_mul_duEval ht)
theorem iotaEval_eq : W.iotaEval t = -(t * W.duEval t) := by
  have hE : MvPowerSeries.HasEval fun _ : Unit ↦ t := MvPSeries.hasEval_of_mem fun _ ↦ ht
  have h := congrArg (MvPSeries.evalRingHom hE) (show W.inverseSeries =
    -(PowerSeries.X * PowerSeries.invOfUnit W.uSeries 1) from rfl)
  simp only [map_neg, map_mul, MvPSeries.evalRingHom_apply] at h
  rw [show (PowerSeries.X : PowerSeries O) = MvPowerSeries.X () from rfl] at h
  simp only [MvPSeries.eval_X] at h
  exact h
theorem iotaEval_mem : W.iotaEval t ∈ maximalIdeal O :=
  MvPSeries.eval_mem_maximalIdeal (MvPSeries.hasEval_of_mem fun _ ↦ ht) (fun _ ↦ ht)
    W.inverseSeries (by
      rw [show MvPowerSeries.constantCoeff W.inverseSeries =
        PowerSeries.constantCoeff W.inverseSeries from rfl, W.constantCoeff_inverseSeries]
      exact zero_mem _)
theorem iotaEval_ne_zero [IsDomain O] (ht0 : t ≠ 0) : W.iotaEval t ≠ 0 := by
  rw [W.iotaEval_eq ht]
  exact neg_ne_zero.mpr (mul_ne_zero ht0 (W.isUnit_duEval ht).ne_zero)
 
theorem eq_two_of_iotaEval_self [NoZeroDivisors O] (ht0 : t ≠ 0) (h : t = W.iotaEval t) :
    W.a₁ * t + W.a₃ * W.wEval t = 2 := by
  have hd := W.iotaEval_eq ht
  rw [← h] at hd
  have hdu : W.duEval t = -1 := by
    have hkey : t * (1 + W.duEval t) = 0 := by linear_combination hd
    rcases mul_eq_zero.mp hkey with h' | h'
    · exact absurd h' ht0
    · linear_combination h'
  have hu1 : W.uEval t = -1 := by
    have h' := W.uEval_mul_duEval ht
    rw [hdu] at h'
    linear_combination -h'
  have h' := W.uEval_eq ht
  rw [hu1] at h'
  linear_combination h'
omit W in
 
theorem eval_subst_single {f : PowerSeries O} (hf : PowerSeries.constantCoeff f = 0)
    (g : PowerSeries O) :
    MvPSeries.eval (fun _ : Unit ↦ t) (PowerSeries.subst f g) =
      MvPSeries.eval (fun _ : Unit ↦ MvPSeries.eval (fun _ : Unit ↦ t) f) g :=
  MvPSeries.eval_subst (MvPSeries.hasEval_of_mem fun _ ↦ ht)
    (MvPowerSeries.hasSubst_of_constantCoeff_zero fun _ ↦ hf) g
theorem wEval_iotaEval : W.wEval (W.iotaEval t) = -(W.wEval t * W.duEval t) := by
  have hE : MvPowerSeries.HasEval fun _ : Unit ↦ t := MvPSeries.hasEval_of_mem fun _ ↦ ht
  have h := congrArg (MvPSeries.evalRingHom hE) W.subst_inverseSeries_wSeries
  rw [map_neg, map_mul] at h
  simp only [MvPSeries.evalRingHom_apply] at h
  rw [eval_subst_single ht W.constantCoeff_inverseSeries] at h
  exact h
theorem iotaEval_iotaEval : W.iotaEval (W.iotaEval t) = t := by
  have hE : MvPowerSeries.HasEval fun _ : Unit ↦ t := MvPSeries.hasEval_of_mem fun _ ↦ ht
  have h := congrArg (MvPSeries.evalRingHom hE) W.subst_inverseSeries_self
  simp only [MvPSeries.evalRingHom_apply] at h
  rw [eval_subst_single ht W.constantCoeff_inverseSeries] at h
  rw [show (PowerSeries.X : PowerSeries O) = MvPowerSeries.X () from rfl,
    MvPSeries.eval_X] at h
  exact h
omit ht
 
noncomputable def slopeEval (t₁ t₂ : O) : O :=
  MvPSeries.eval (Sum.elim (fun _ ↦ t₁) fun _ ↦ t₂) W.slopeSeries
 
noncomputable def interceptEval (t₁ t₂ : O) : O :=
  MvPSeries.eval (Sum.elim (fun _ ↦ t₁) fun _ ↦ t₂) W.interceptSeries
 
noncomputable def thirdRootEval (t₁ t₂ : O) : O :=
  MvPSeries.eval (Sum.elim (fun _ ↦ t₁) fun _ ↦ t₂) W.thirdRootSeries
 
noncomputable def addEval (t₁ t₂ : O) : O :=
  MvPSeries.eval (Sum.elim (fun _ ↦ t₁) fun _ ↦ t₂) W.addSeries
variable {t₁ t₂ : O} (h₁ : t₁ ∈ maximalIdeal O) (h₂ : t₂ ∈ maximalIdeal O)
include h₁ h₂
omit W in
 
lemma eval_pair_subst_single {q : MvPowerSeries (Unit ⊕ Unit) O}
    (hq : MvPowerSeries.constantCoeff q = 0) (g : PowerSeries O) :
    MvPSeries.eval (Sum.elim (fun _ ↦ t₁) fun _ ↦ t₂)
        (MvPowerSeries.subst (fun _ : Unit ↦ q) g) =
      MvPSeries.eval (fun _ : Unit ↦
        MvPSeries.eval (Sum.elim (fun _ ↦ t₁) fun _ ↦ t₂) q) g :=
  MvPSeries.eval_subst (hasEval_pairElim h₁ h₂)
    (MvPowerSeries.hasSubst_of_constantCoeff_zero fun _ ↦ hq) g
omit W in
 
lemma eval_pair_rename (c : Unit → Unit ⊕ Unit) (g : PowerSeries O) :
    MvPSeries.eval (Sum.elim (fun _ ↦ t₁) fun _ ↦ t₂) (MvPowerSeries.rename c g) =
      MvPSeries.eval (fun _ : Unit ↦ Sum.elim (fun _ ↦ t₁) (fun _ ↦ t₂) (c ())) g := by
  rw [MvPowerSeries.rename_eq_subst]
  rw [MvPSeries.eval_subst (hasEval_pairElim h₁ h₂) (MvPowerSeries.HasSubst.X_comp c) g]
  congr 1
  funext s
  rw [Function.comp_apply, MvPSeries.eval_X]
 
theorem slopeEval_mul_sub :
    W.slopeEval t₁ t₂ * (t₂ - t₁) = W.wEval t₂ - W.wEval t₁ := by
  have h := congrArg (MvPSeries.evalRingHom (hasEval_pairElim h₁ h₂)) W.slopeSeries_mul_sub
  simp only [map_mul, map_sub, MvPSeries.evalRingHom_apply, MvPSeries.eval_X] at h
  rw [eval_pair_rename h₁ h₂, eval_pair_rename h₁ h₂] at h
  simp only [Sum.elim_inl, Sum.elim_inr] at h
  exact h
 
theorem interceptEval_eq :
    W.interceptEval t₁ t₂ = W.wEval t₁ - W.slopeEval t₁ t₂ * t₁ := by
  have h := congrArg (MvPSeries.evalRingHom (hasEval_pairElim h₁ h₂))
    (show W.interceptSeries = MvPowerSeries.rename (fun _ ↦ Sum.inl ()) W.wSeries -
      W.slopeSeries * MvPowerSeries.X (Sum.inl ()) from rfl)
  simp only [map_sub, map_mul, MvPSeries.evalRingHom_apply, MvPSeries.eval_X] at h
  rw [eval_pair_rename h₁ h₂] at h
  simp only [Sum.elim_inl] at h
  exact h
theorem slopeEval_mem : W.slopeEval t₁ t₂ ∈ maximalIdeal O :=
  MvPSeries.eval_mem_maximalIdeal (hasEval_pairElim h₁ h₂)
    (by rintro (j | j) <;> assumption) W.slopeSeries
    (by rw [show MvPowerSeries.constantCoeff W.slopeSeries = 0 from
      W.constantCoeff_slopeSeries]; exact zero_mem _)
theorem thirdRootEval_mem : W.thirdRootEval t₁ t₂ ∈ maximalIdeal O :=
  MvPSeries.eval_mem_maximalIdeal (hasEval_pairElim h₁ h₂)
    (by rintro (j | j) <;> assumption) W.thirdRootSeries
    (by rw [W.constantCoeff_thirdRootSeries]; exact zero_mem _)

theorem thirdRootEval_relation :
    (1 + W.a₂ * W.slopeEval t₁ t₂ + W.a₄ * W.slopeEval t₁ t₂ ^ 2 +
        W.a₆ * W.slopeEval t₁ t₂ ^ 3) * (W.thirdRootEval t₁ t₂ + t₁ + t₂) =
      -(W.a₁ * W.slopeEval t₁ t₂ + W.a₂ * W.interceptEval t₁ t₂ +
        W.a₃ * W.slopeEval t₁ t₂ ^ 2 +
        2 * W.a₄ * W.slopeEval t₁ t₂ * W.interceptEval t₁ t₂ +
        3 * W.a₆ * W.slopeEval t₁ t₂ ^ 2 * W.interceptEval t₁ t₂) := by
  have hE := hasEval_pairElim (t₁ := t₁) (t₂ := t₂) h₁ h₂
  have hT := congrArg (MvPSeries.evalRingHom hE) (show W.thirdRootSeries =
    -MvPowerSeries.X (Sum.inl ()) - MvPowerSeries.X (Sum.inr ()) -
      (MvPowerSeries.C W.a₁ * W.slopeSeries + MvPowerSeries.C W.a₂ * W.interceptSeries +
        MvPowerSeries.C W.a₃ * W.slopeSeries ^ 2 +
        2 * MvPowerSeries.C W.a₄ * W.slopeSeries * W.interceptSeries +
        3 * MvPowerSeries.C W.a₆ * W.slopeSeries ^ 2 * W.interceptSeries) *
      MvPowerSeries.invOfUnit (1 + MvPowerSeries.C W.a₂ * W.slopeSeries +
        MvPowerSeries.C W.a₄ * W.slopeSeries ^ 2 +
        MvPowerSeries.C W.a₆ * W.slopeSeries ^ 3) 1 from rfl)
  have hD := congrArg (MvPSeries.evalRingHom hE)
    (MvPowerSeries.mul_invOfUnit (1 + MvPowerSeries.C W.a₂ * W.slopeSeries +
      MvPowerSeries.C W.a₄ * W.slopeSeries ^ 2 +
      MvPowerSeries.C W.a₆ * W.slopeSeries ^ 3) 1
      (by simp [show MvPowerSeries.constantCoeff W.slopeSeries = 0 from
        W.constantCoeff_slopeSeries]))
  simp only [map_sub, map_neg, map_add, map_mul, map_pow, map_one, map_ofNat,
    MvPSeries.evalRingHom_apply, MvPSeries.eval_X, MvPSeries.eval_C, Sum.elim_inl,
    Sum.elim_inr] at hT hD
  simp only [show MvPSeries.eval (Sum.elim (fun _ ↦ t₁) fun _ ↦ t₂) W.slopeSeries =
      W.slopeEval t₁ t₂ from rfl,
    show MvPSeries.eval (Sum.elim (fun _ ↦ t₁) fun _ ↦ t₂) W.interceptSeries =
      W.interceptEval t₁ t₂ from rfl,
    show MvPSeries.eval (Sum.elim (fun _ ↦ t₁) fun _ ↦ t₂) W.thirdRootSeries =
      W.thirdRootEval t₁ t₂ from rfl] at hT hD
  set Λ := W.slopeEval t₁ t₂
  set N := W.interceptEval t₁ t₂
  set T := W.thirdRootEval t₁ t₂
  set d := MvPSeries.eval (Sum.elim (fun _ ↦ t₁) fun _ ↦ t₂)
    (MvPowerSeries.invOfUnit (1 + MvPowerSeries.C W.a₂ * W.slopeSeries +
      MvPowerSeries.C W.a₄ * W.slopeSeries ^ 2 +
      MvPowerSeries.C W.a₆ * W.slopeSeries ^ 3) 1)
  clear_value Λ N T d
  linear_combination (1 + W.a₂ * Λ + W.a₄ * Λ ^ 2 + W.a₆ * Λ ^ 3) * hT -
    (W.a₁ * Λ + W.a₂ * N + W.a₃ * Λ ^ 2 + 2 * W.a₄ * Λ * N + 3 * W.a₆ * Λ ^ 2 * N) * hD
 
theorem wEval_thirdRootEval [IsDomain O] :
    W.wEval (W.thirdRootEval t₁ t₂) =
      W.slopeEval t₁ t₂ * W.thirdRootEval t₁ t₂ + W.interceptEval t₁ t₂ := by
  have h := congrArg (MvPSeries.evalRingHom (hasEval_pairElim h₁ h₂))
    W.subst_thirdRootSeries_wSeries
  simp only [map_add, map_mul, MvPSeries.evalRingHom_apply] at h
  rw [eval_pair_subst_single h₁ h₂ W.constantCoeff_thirdRootSeries] at h
  exact h
 
theorem addEval_eq : W.addEval t₁ t₂ = W.iotaEval (W.thirdRootEval t₁ t₂) := by
  have h := congrArg (MvPSeries.evalRingHom (hasEval_pairElim h₁ h₂))
    (show W.addSeries =
      MvPowerSeries.subst (fun _ : Unit ↦ W.thirdRootSeries) W.inverseSeries from rfl)
  simp only [MvPSeries.evalRingHom_apply] at h
  rw [eval_pair_subst_single h₁ h₂ W.constantCoeff_thirdRootSeries] at h
  exact h
omit h₁ h₂ in

theorem addEval_sub_add_mem {j : ℕ} (hj : j ≠ 0) (h₁ : t₁ ∈ maximalIdeal O ^ j)
    (h₂ : t₂ ∈ maximalIdeal O ^ j) :
    W.addEval t₁ t₂ - (t₁ + t₂) ∈ maximalIdeal O ^ (2 * j) := by
  have h₁' : t₁ ∈ maximalIdeal O := Ideal.pow_le_self hj h₁
  have h₂' : t₂ ∈ maximalIdeal O := Ideal.pow_le_self hj h₂
  have hE := hasEval_pairElim h₁' h₂'
  have heval : W.addEval t₁ t₂ - t₁ - t₂ =
      MvPSeries.eval (Sum.elim (fun _ ↦ t₁) fun _ ↦ t₂)
        (W.addSeries - MvPowerSeries.X (Sum.inl ()) - MvPowerSeries.X (Sum.inr ())) := by
    rw [MvPSeries.eval_sub hE, MvPSeries.eval_sub hE, MvPSeries.eval_X, MvPSeries.eval_X]
    rfl
  rw [show W.addEval t₁ t₂ - (t₁ + t₂) = W.addEval t₁ t₂ - t₁ - t₂ by ring, heval]
  exact MvPSeries.eval_mem_maximalIdeal_pow_mul hE (by rintro (u | u) <;> assumption) _
    (fun d hd ↦ W.coeff_addSeries_sub_of_degree_lt hd)
 
theorem interceptEval_eq' :
    W.interceptEval t₁ t₂ = W.wEval t₂ - W.slopeEval t₁ t₂ * t₂ := by
  have h := congrArg (MvPSeries.evalRingHom (hasEval_pairElim h₁ h₂)) W.interceptSeries_eq
  simp only [map_sub, map_mul, MvPSeries.evalRingHom_apply, MvPSeries.eval_X] at h
  rw [eval_pair_rename h₁ h₂] at h
  simp only [Sum.elim_inr] at h
  exact h
omit h₁ h₂ in
@[simp]
theorem wEval_zero : W.wEval 0 = 0 := by
  rw [W.wEval_eq_cube_mul (zero_mem _)]
  ring
omit h₁ h₂ in
@[simp]
theorem iotaEval_zero : W.iotaEval 0 = 0 := by
  rw [W.iotaEval_eq (zero_mem _)]
  ring

theorem thirdRootEval_ne_zero [IsDomain O] (hx : t₁ * W.wEval t₂ ≠ t₂ * W.wEval t₁) :
    W.thirdRootEval t₁ t₂ ≠ 0 := by
  intro h
  have honl := W.wEval_thirdRootEval h₁ h₂
  rw [h, mul_zero, zero_add, W.wEval_zero] at honl
  refine hx ?_
  have hν : W.interceptEval t₁ t₂ * (t₂ - t₁) = t₂ * W.wEval t₁ - t₁ * W.wEval t₂ := by
    linear_combination t₂ * W.interceptEval_eq h₁ h₂ - t₁ * W.interceptEval_eq' h₁ h₂
  rw [← honl, zero_mul] at hν
  linear_combination hν
omit h₂ in
 
theorem addEval_iotaEval : W.addEval t₁ (W.iotaEval t₁) = 0 := by
  have hE : MvPowerSeries.HasEval fun _ : Unit ↦ t₁ := MvPSeries.hasEval_of_mem fun _ ↦ h₁
  have h := congrArg (MvPSeries.evalRingHom hE) W.subst_inverseSeries_addSeries
  rw [map_zero] at h
  simp only [MvPSeries.evalRingHom_apply] at h
  rw [MvPSeries.eval_subst hE (MvPowerSeries.hasSubst_of_constantCoeff_zero (by
    rintro (j | j)
    · exact MvPowerSeries.constantCoeff_X ()
    · exact W.constantCoeff_inverseSeries))] at h
  rw [show (fun s ↦ MvPSeries.eval (fun _ : Unit ↦ t₁)
      ((Sum.elim (fun _ ↦ (MvPowerSeries.X () : MvPowerSeries Unit O))
        fun _ ↦ W.inverseSeries) s)) =
      (Sum.elim (fun _ ↦ t₁) fun _ ↦ W.iotaEval t₁) from funext fun s ↦ by
    rcases s with u | u
    · exact MvPSeries.eval_X _ _
    · rfl] at h
  exact h
omit h₁ h₂
 
noncomputable def negPoint (z : W.formalGroupLaw.Points) : W.formalGroupLaw.Points :=
  fun _ ↦ ⟨W.iotaEval (z ()), W.iotaEval_mem (z ()).2⟩
@[simp]
theorem negPoint_apply_coe (z : W.formalGroupLaw.Points) :
    ((W.negPoint z) () : O) = W.iotaEval (z ()) := rfl
 
theorem add_apply_coe_eq_addEval (z z' : W.formalGroupLaw.Points) :
    ((z + z') () : O) = W.addEval (z ()) (z' ()) := rfl

theorem nsmul_apply_coe_mem_and_sub_mem {z : W.formalGroupLaw.Points} {k : ℕ} (hk : k ≠ 0)
    (hz : (z () : O) ∈ maximalIdeal O ^ k) (m : ℕ) :
    ((m • z) () : O) ∈ maximalIdeal O ^ k ∧
      ((m • z) () : O) - m • (z () : O) ∈ maximalIdeal O ^ (2 * k) := by
  induction m with
  | zero => simp
  | succ m ih =>
    have h1 := W.addEval_sub_add_mem hk hz ih.1
    have hle : maximalIdeal O ^ (2 * k) ≤ maximalIdeal O ^ k :=
      Ideal.pow_le_pow_right (by lia)
    constructor
    · rw [succ_nsmul', add_apply_coe_eq_addEval]
      have h2 : W.addEval (z () : O) ((m • z) () : O) =
          ((z () : O) + ((m • z) () : O)) +
            (W.addEval (z () : O) ((m • z) () : O) - ((z () : O) + ((m • z) () : O))) := by
        ring
      rw [h2]
      exact add_mem (add_mem hz ih.1) (hle h1)
    · rw [succ_nsmul', add_apply_coe_eq_addEval, succ_nsmul']
      have h2 : W.addEval (z () : O) ((m • z) () : O) - ((z () : O) + m • (z () : O)) =
          (W.addEval (z () : O) ((m • z) () : O) - ((z () : O) + ((m • z) () : O))) +
            (((m • z) () : O) - m • (z () : O)) := by
        ring
      rw [h2]
      exact add_mem h1 ih.2
 
theorem add_negPoint (z : W.formalGroupLaw.Points) : z + W.negPoint z = 0 := by
  funext i
  refine Subtype.ext ?_
  rw [show ((z + W.negPoint z) i : O) = W.addEval (z ()) (W.iotaEval (z ())) from rfl,
    W.addEval_iotaEval (z ()).2]
  rfl
end WeierstrassCurve
end
end

/- EllipticCurves.WeierstrassFormalGroup.Foundations -/
section
section
open ChabautyColeman IsLocalRing MvPowerSeries
open scoped MvPowerSeries.WithPiTopology
namespace WeierstrassCurve.Affine
open IsDedekindDomain IsDedekindDomain.HeightOneSpectrum IsLocalRing WithZero
variable {R : Type*} [CommRing R] [IsDedekindDomain R]
  {K : Type*} [Field K] [Algebra R K] [IsFractionRing R K]
  {v : HeightOneSpectrum R} {W : Affine (v.adicCompletion K)}
  {W₀ : WeierstrassCurve (v.adicCompletionIntegers K)}
  (hW : W₀.map (algebraMap (v.adicCompletionIntegers K) (v.adicCompletion K)) = W)
  {t : v.adicCompletionIntegers K}
lemma algebraMap_eq_coe (x : v.adicCompletionIntegers K) :
    algebraMap (v.adicCompletionIntegers K) (v.adicCompletion K) x =
      (x : v.adicCompletion K) := rfl
lemma valued_coe_le_one (x : v.adicCompletionIntegers K) :
    Valued.v ((x : v.adicCompletionIntegers K) : v.adicCompletion K) ≤ 1 := x.2
 
lemma valued_coe_isUnit {a : v.adicCompletionIntegers K} (ha : IsUnit a) :
    Valued.v ((a : v.adicCompletionIntegers K) : v.adicCompletion K) = 1 :=
  (Valuation.integer.integers (Valued.v)).isUnit_iff_valuation_eq_one.mp ha
 
lemma mem_maximalIdeal_iff {x : v.adicCompletionIntegers K} :
    x ∈ maximalIdeal (v.adicCompletionIntegers K) ↔
      Valued.v ((x : v.adicCompletionIntegers K) : v.adicCompletion K) ≤ exp (-1 : ℤ) := by
  have h := mem_maximalIdeal_pow_iff (K := K) (x := x) (n := 1)
  rwa [pow_one] at h
 
lemma valued_le_one_of_sub {a b : v.adicCompletion K} {n : ℕ}
    (h : Valued.v (a - b) ≤ exp (-(n : ℤ))) (hb : Valued.v b ≤ 1) : Valued.v a ≤ 1 := by
  rw [show a = (a - b) + b by ring]
  refine le_trans (Valued.v.map_add _ _) (max_le (h.trans ?_) hb)
  rw [← exp_zero, exp_le_exp]
  lia
lemma coe_wEval_ne_zero {t : v.adicCompletionIntegers K}
    (hm : t ∈ maximalIdeal (v.adicCompletionIntegers K)) (h0 : t ≠ 0) :
    ((W₀.wEval t : v.adicCompletionIntegers K) : v.adicCompletion K) ≠ 0 := by
  simp only [ne_eq, ZeroMemClass.coe_eq_zero]
  exact W₀.wEval_ne_zero hm h0
lemma coe_duEval_ne_zero {t : v.adicCompletionIntegers K}
    (hm : t ∈ maximalIdeal (v.adicCompletionIntegers K)) :
    ((W₀.duEval t : v.adicCompletionIntegers K) : v.adicCompletion K) ≠ 0 := by
  simp only [ne_eq, ZeroMemClass.coe_eq_zero]
  exact (W₀.isUnit_duEval hm).ne_zero
lemma valued_lhs_eq_rhs {x y : v.adicCompletion K} (hxy : W.Equation x y) :
    Valued.v (y ^ 2 + (W.a₁ * x * y + W.a₃ * y)) =
      Valued.v (x ^ 3 + (W.a₂ * x ^ 2 + (W.a₄ * x + W.a₆))) :=
  congrArg Valued.v (by linear_combination (W.equation_iff x y).mp hxy)
lemma coe_iotaEval_eq {t : v.adicCompletionIntegers K}
    (hm : t ∈ maximalIdeal (v.adicCompletionIntegers K)) :
    ((W₀.iotaEval t : v.adicCompletionIntegers K) : v.adicCompletion K) =
      -((t : v.adicCompletion K) *
        ((W₀.duEval t : v.adicCompletionIntegers K) : v.adicCompletion K)) := by
  have h := congrArg (fun a : v.adicCompletionIntegers K ↦ (a : v.adicCompletion K))
    (W₀.iotaEval_eq hm)
  push_cast at h
  exact h
lemma coe_wEval_iotaEval {t : v.adicCompletionIntegers K}
    (hm : t ∈ maximalIdeal (v.adicCompletionIntegers K)) :
    ((W₀.wEval (W₀.iotaEval t) : v.adicCompletionIntegers K) : v.adicCompletion K) =
      -(((W₀.wEval t : v.adicCompletionIntegers K) : v.adicCompletion K) *
        ((W₀.duEval t : v.adicCompletionIntegers K) : v.adicCompletion K)) := by
  have h := congrArg (fun a : v.adicCompletionIntegers K ↦ (a : v.adicCompletion K))
    (W₀.wEval_iotaEval hm)
  push_cast at h
  exact h
lemma coe_uEval_mul_duEval {t : v.adicCompletionIntegers K}
    (hm : t ∈ maximalIdeal (v.adicCompletionIntegers K)) :
    ((W₀.uEval t : v.adicCompletionIntegers K) : v.adicCompletion K) *
      ((W₀.duEval t : v.adicCompletionIntegers K) : v.adicCompletion K) = 1 := by
  have h := congrArg (fun a : v.adicCompletionIntegers K ↦ (a : v.adicCompletion K))
    (W₀.uEval_mul_duEval hm)
  push_cast at h
  exact h
section
include hW
lemma coe_a₁ : ((W₀.a₁ : v.adicCompletionIntegers K) : v.adicCompletion K) = W.a₁ := by
  rw [← hW, WeierstrassCurve.map_a₁, algebraMap_eq_coe]
lemma coe_a₂ : ((W₀.a₂ : v.adicCompletionIntegers K) : v.adicCompletion K) = W.a₂ := by
  rw [← hW, WeierstrassCurve.map_a₂, algebraMap_eq_coe]
lemma coe_a₃ : ((W₀.a₃ : v.adicCompletionIntegers K) : v.adicCompletion K) = W.a₃ := by
  rw [← hW, WeierstrassCurve.map_a₃, algebraMap_eq_coe]
lemma coe_a₄ : ((W₀.a₄ : v.adicCompletionIntegers K) : v.adicCompletion K) = W.a₄ := by
  rw [← hW, WeierstrassCurve.map_a₄, algebraMap_eq_coe]
lemma coe_a₆ : ((W₀.a₆ : v.adicCompletionIntegers K) : v.adicCompletion K) = W.a₆ := by
  rw [← hW, WeierstrassCurve.map_a₆, algebraMap_eq_coe]
lemma valued_a₁ : Valued.v W.a₁ ≤ 1 := coe_a₁ hW ▸ valued_coe_le_one W₀.a₁
lemma valued_a₂ : Valued.v W.a₂ ≤ 1 := coe_a₂ hW ▸ valued_coe_le_one W₀.a₂
lemma valued_a₃ : Valued.v W.a₃ ≤ 1 := coe_a₃ hW ▸ valued_coe_le_one W₀.a₃
lemma valued_a₄ : Valued.v W.a₄ ≤ 1 := coe_a₄ hW ▸ valued_coe_le_one W₀.a₄
lemma valued_a₆ : Valued.v W.a₆ ≤ 1 := coe_a₆ hW ▸ valued_coe_le_one W₀.a₆
 
lemma valued_rhs_eq {x : v.adicCompletion K} (hA1 : 1 < Valued.v x) :
    Valued.v (x ^ 3 + (W.a₂ * x ^ 2 + (W.a₄ * x + W.a₆))) = Valued.v x ^ 3 := by
  set A := Valued.v x
  have h1 : Valued.v (W.a₂ * x ^ 2) ≤ A ^ 2 := by
    rw [map_mul, map_pow]
    exact (mul_le_mul' (valued_a₂ hW) le_rfl).trans_eq (one_mul _)
  have h2 : Valued.v (W.a₄ * x) ≤ A ^ 2 := by
    rw [map_mul]
    exact ((mul_le_mul' (valued_a₄ hW) le_rfl).trans_eq (one_mul _)).trans
      (le_self_pow hA1.le (by lia))
  have h3 : Valued.v W.a₆ ≤ A ^ 2 :=
    (valued_a₆ hW).trans (hA1.le.trans (le_self_pow hA1.le (by lia)))
  have hlow : Valued.v (W.a₂ * x ^ 2 + (W.a₄ * x + W.a₆)) < A ^ 3 :=
    lt_of_le_of_lt ((Valued.v.map_add _ _).trans
      (max_le h1 ((Valued.v.map_add _ _).trans (max_le h2 h3))))
      (pow_lt_pow_right₀ hA1 (by lia))
  rw [Valuation.map_add_eq_of_lt_left _ (by rw [map_pow]; exact hlow), map_pow]
 
lemma valued_rhs_le {x : v.adicCompletion K} (hA1 : Valued.v x ≤ 1) :
    Valued.v (x ^ 3 + (W.a₂ * x ^ 2 + (W.a₄ * x + W.a₆))) ≤ 1 := by
  refine le_trans (Valued.v.map_add _ _) (max_le ?_ (le_trans (Valued.v.map_add _ _)
    (max_le ?_ (le_trans (Valued.v.map_add _ _) (max_le ?_ (valued_a₆ hW))))))
  · rw [map_pow]
    exact pow_le_one' hA1 3
  · rw [map_mul, map_pow]
    exact mul_le_one' (valued_a₂ hW) (pow_le_one' hA1 2)
  · rw [map_mul]
    exact mul_le_one' (valued_a₄ hW) hA1

lemma valued_lhs_eq {x y : v.adicCompletion K} (hAB : Valued.v x < Valued.v y)
    (hB1 : 1 < Valued.v y) :
    Valued.v (y ^ 2 + (W.a₁ * x * y + W.a₃ * y)) = Valued.v y ^ 2 := by
  set B := Valued.v y
  have h2 : Valued.v (W.a₁ * x * y) < B ^ 2 := by
    rw [map_mul, map_mul]
    calc Valued.v W.a₁ * Valued.v x * B ≤ 1 * Valued.v x * B :=
        mul_le_mul' (mul_le_mul' (valued_a₁ hW) le_rfl) le_rfl
      _ = Valued.v x * B := by rw [one_mul]
      _ < B * B := mul_lt_mul_of_pos_right hAB (zero_lt_one.trans hB1)
      _ = B ^ 2 := (sq B).symm
  have h3 : Valued.v (W.a₃ * y) < B ^ 2 := by
    rw [map_mul]
    calc Valued.v W.a₃ * B ≤ 1 * B := mul_le_mul' (valued_a₃ hW) le_rfl
      _ = B ^ 1 := by rw [one_mul, pow_one]
      _ < B ^ 2 := pow_lt_pow_right₀ hB1 (by lia)
  rw [Valuation.map_add_eq_of_lt_left _
    (by rw [map_pow]; exact lt_of_le_of_lt (Valued.v.map_add _ _) (max_lt h2 h3)), map_pow]

lemma valued_lhs_le {x y : v.adicCompletion K} {C : ℤᵐ⁰} (hxC : Valued.v x ≤ C)
    (hyC : Valued.v y ≤ C) (h1C : 1 ≤ C) :
    Valued.v (y ^ 2 + (W.a₁ * x * y + W.a₃ * y)) ≤ C ^ 2 := by
  refine le_trans (Valued.v.map_add _ _) (max_le ?_ (le_trans (Valued.v.map_add _ _)
    (max_le ?_ ?_)))
  · rw [map_pow]
    exact pow_le_pow_left' hyC 2
  · rw [map_mul, map_mul]
    calc Valued.v W.a₁ * Valued.v x * Valued.v y ≤ 1 * C * C :=
        mul_le_mul' (mul_le_mul' (valued_a₁ hW) hxC) hyC
      _ = C ^ 2 := by rw [one_mul, sq]
  · rw [map_mul]
    calc Valued.v W.a₃ * Valued.v y ≤ 1 * C := mul_le_mul' (valued_a₃ hW) hyC
      _ = C := one_mul C
      _ ≤ C ^ 2 := le_self_pow h1C (by lia)
 
lemma valued_ne_exp_one {x y : v.adicCompletion K} (hxy : W.Equation x y) :
    Valued.v x ≠ exp (1 : ℤ) := by
  intro hA1
  have hval := valued_lhs_eq_rhs hxy
  have hRHS : Valued.v (x ^ 3 + (W.a₂ * x ^ 2 + (W.a₄ * x + W.a₆))) = exp (3 : ℤ) := by
    rw [valued_rhs_eq hW (by rw [hA1, ← exp_zero, exp_lt_exp]; lia), hA1, ← exp_nsmul,
      nsmul_eq_mul]
    norm_num
  rcases le_or_gt (Valued.v y) (exp 1) with hB1 | hB1
  · 
    have hle := valued_lhs_le hW hA1.le hB1 (by rw [← exp_zero, exp_le_exp]; lia)
    rw [hval, hRHS, show (exp 1 : ℤᵐ⁰) ^ 2 = exp (2 : ℤ) by
      rw [← exp_nsmul, nsmul_eq_mul]; norm_num, exp_le_exp] at hle
    lia
  · 
    have hB3 : Valued.v y ^ 2 = exp (3 : ℤ) := by
      rw [← valued_lhs_eq hW (hA1 ▸ hB1) ((by rw [← exp_zero, exp_lt_exp]; lia :
        (1 : ℤᵐ⁰) < exp (1 : ℤ)).trans hB1), hval, hRHS]
    obtain ⟨b, hb⟩ : ∃ b : ℤ, Valued.v y = exp b :=
      ⟨_, (exp_log (exp_pos.trans hB1).ne').symm⟩
    rw [hb, ← exp_nsmul, exp_inj, nsmul_eq_mul] at hB3
    push_cast at hB3
    lia

lemma valued_of_mem {x y : v.adicCompletion K} (hxy : W.Equation x y)
    (hx : exp (2 : ℤ) ≤ Valued.v x) :
    y ≠ 0 ∧ Valued.v (-x / y) ≤ exp (-1 : ℤ) ∧ Valued.v (-1 / y) ≤ exp (-1 : ℤ) := by
  have hA1 : (1 : ℤᵐ⁰) < Valued.v x :=
    lt_of_lt_of_le (by rw [← exp_zero]; exact exp_lt_exp.mpr (by lia)) hx
  have hval := valued_lhs_eq_rhs hxy
  have hRHS := valued_rhs_eq hW hA1
  
  have hBA : Valued.v x < Valued.v y := by
    by_contra hle
    push Not at hle
    have h := valued_lhs_le hW le_rfl hle hA1.le
    rw [hval, hRHS] at h
    exact absurd h (not_le.mpr (pow_lt_pow_right₀ hA1 (by lia)))
  have hB1 : (1 : ℤᵐ⁰) < Valued.v y := hA1.trans hBA
  have hy0 : y ≠ 0 := fun h ↦ by simp [h] at hB1
  have hBA3 : Valued.v y ^ 2 = Valued.v x ^ 3 := by
    rw [← valued_lhs_eq hW hBA hB1, hval, hRHS]
  
  obtain ⟨a, ha⟩ : ∃ a : ℤ, Valued.v x = exp a :=
    ⟨_, (exp_log (zero_lt_one.trans hA1).ne').symm⟩
  obtain ⟨b, hb⟩ : ∃ b : ℤ, Valued.v y = exp b :=
    ⟨_, (exp_log (zero_lt_one.trans hB1).ne').symm⟩
  have h2a : (2 : ℤ) ≤ a := by rwa [ha, exp_le_exp] at hx
  have h23 : 2 * b = 3 * a := by
    rw [ha, hb, ← exp_nsmul, ← exp_nsmul, exp_inj] at hBA3
    push_cast [nsmul_eq_mul] at hBA3
    exact hBA3
  refine ⟨hy0, ?_, ?_⟩
  · rw [map_div₀, Valuation.map_neg, ha, hb, ← exp_sub, exp_le_exp]
    lia
  · rw [map_div₀, Valuation.map_neg, map_one, hb, ← exp_zero, ← exp_sub, exp_le_exp]
    lia

lemma integral_of_not_mem {x y : v.adicCompletion K} (hxy : W.Equation x y)
    (hx : ¬ exp (2 : ℤ) ≤ Valued.v x) :
    Valued.v x ≤ 1 ∧ Valued.v y ≤ 1 := by
  have hA1 : Valued.v x ≤ 1 := by
    rcases eq_or_ne (Valued.v x) 0 with h0 | h0
    · exact h0 ▸ zero_le
    · obtain ⟨a, ha⟩ : ∃ a : ℤ, Valued.v x = exp a := ⟨_, (exp_log h0).symm⟩
      have ha1 : a ≤ 1 := by
        by_contra hlt
        exact hx (ha ▸ exp_le_exp.mpr (by lia))
      rcases eq_or_lt_of_le ha1 with h1 | h1
      · exact absurd (by rw [ha, h1]) (valued_ne_exp_one hW hxy)
      · rw [ha, ← exp_zero, exp_le_exp]
        lia
  refine ⟨hA1, ?_⟩
  by_contra hB1
  push Not at hB1
  have h := valued_rhs_le hW hA1
  rw [← valued_lhs_eq_rhs hxy, valued_lhs_eq hW (hA1.trans_lt hB1) hB1] at h
  exact absurd h (not_le.mpr (one_lt_pow₀ hB1 (by lia)))
 
lemma coe_wEval_eq {t : v.adicCompletionIntegers K}
    (hm : t ∈ maximalIdeal (v.adicCompletionIntegers K)) :
    ((W₀.wEval t : v.adicCompletionIntegers K) : v.adicCompletion K) =
      (t : v.adicCompletion K) ^ 3 +
        W.a₁ * t * ((W₀.wEval t : v.adicCompletionIntegers K) : v.adicCompletion K) +
        W.a₂ * (t : v.adicCompletion K) ^ 2 *
          ((W₀.wEval t : v.adicCompletionIntegers K) : v.adicCompletion K) +
        W.a₃ * ((W₀.wEval t : v.adicCompletionIntegers K) : v.adicCompletion K) ^ 2 +
        W.a₄ * t * ((W₀.wEval t : v.adicCompletionIntegers K) : v.adicCompletion K) ^ 2 +
        W.a₆ * ((W₀.wEval t : v.adicCompletionIntegers K) : v.adicCompletion K) ^ 3 := by
  have h := congrArg (fun a : v.adicCompletionIntegers K ↦ (a : v.adicCompletion K))
    (W₀.wEval_eq hm)
  rw [wPoly] at h
  push_cast at h
  rw [coe_a₁ hW, coe_a₂ hW, coe_a₃ hW, coe_a₄ hW, coe_a₆ hW] at h
  exact h
 
lemma coe_uEval_eq {t : v.adicCompletionIntegers K}
    (hm : t ∈ maximalIdeal (v.adicCompletionIntegers K)) :
    ((W₀.uEval t : v.adicCompletionIntegers K) : v.adicCompletion K) =
      1 - W.a₁ * t - W.a₃ *
        ((W₀.wEval t : v.adicCompletionIntegers K) : v.adicCompletion K) := by
  have h := congrArg (fun a : v.adicCompletionIntegers K ↦ (a : v.adicCompletion K))
    (W₀.uEval_eq hm)
  push_cast at h
  rw [coe_a₁ hW, coe_a₃ hW] at h
  exact h
 
lemma coe_chordCoeff_ne_zero {Λ : v.adicCompletionIntegers K}
    (hΛ : Λ ∈ maximalIdeal (v.adicCompletionIntegers K)) :
    (1 : v.adicCompletion K) +
      W.a₂ * ((Λ : v.adicCompletionIntegers K) : v.adicCompletion K) +
      W.a₄ * ((Λ : v.adicCompletionIntegers K) : v.adicCompletion K) ^ 2 +
      W.a₆ * ((Λ : v.adicCompletionIntegers K) : v.adicCompletion K) ^ 3 ≠ 0 := by
  intro hc
  apply (W₀.isUnit_chordCoeff hΛ).ne_zero
  refine Subtype.coe_injective ?_
  push_cast
  rw [coe_a₂ hW, coe_a₄ hW, coe_a₆ hW]
  exact hc

lemma valued_num_of_two_torsion {x₀ y₀ x y : v.adicCompletion K} {c : ℤ} {s : ℕ}
    (hx₀ : Valued.v x₀ ≤ 1)
    (hc : Valued.v (W.a₁ * y₀ - (3 * x₀ ^ 2 + 2 * W.a₂ * x₀ + W.a₄)) = exp c)
    (hsc : 1 - c ≤ (s : ℤ)) (hx : Valued.v (x - x₀) ≤ exp (-(s : ℤ)))
    (hy : Valued.v (y - y₀) ≤ exp (-(s : ℤ))) :
    Valued.v (x ^ 2 + x * x₀ + x₀ ^ 2 + W.a₂ * (x + x₀) + W.a₄ - W.a₁ * y) = exp c := by
  have hdiff : Valued.v ((x ^ 2 + x * x₀ + x₀ ^ 2 + W.a₂ * (x + x₀) + W.a₄ - W.a₁ * y) -
      -(W.a₁ * y₀ - (3 * x₀ ^ 2 + 2 * W.a₂ * x₀ + W.a₄))) ≤ exp (-(s : ℤ)) := by
    rw [show (x ^ 2 + x * x₀ + x₀ ^ 2 + W.a₂ * (x + x₀) + W.a₄ - W.a₁ * y) -
        -(W.a₁ * y₀ - (3 * x₀ ^ 2 + 2 * W.a₂ * x₀ + W.a₄)) =
        (x - x₀) * (x + 2 * x₀ + W.a₂) - W.a₁ * (y - y₀) by ring]
    refine le_trans (Valuation.map_sub _ _ _) (max_le ?_ ?_)
    · rw [map_mul]
      refine le_trans (mul_le_mul' hx ?_) (by rw [mul_one])
      refine le_trans (Valued.v.map_add _ _) (max_le (le_trans (Valued.v.map_add _ _)
        (max_le (valued_le_one_of_sub hx hx₀) ?_)) (valued_a₂ hW))
      calc Valued.v (2 * x₀) ≤ Valued.v 2 * Valued.v x₀ := le_of_eq (map_mul _ _ _)
        _ ≤ 1 * 1 := mul_le_mul' (valued_coe_le_one 2) hx₀
        _ = 1 := one_mul 1
    · rw [map_mul]
      exact le_trans (mul_le_mul' (valued_a₁ hW) hy) (by rw [one_mul])
  rw [show x ^ 2 + x * x₀ + x₀ ^ 2 + W.a₂ * (x + x₀) + W.a₄ - W.a₁ * y =
      -(W.a₁ * y₀ - (3 * x₀ ^ 2 + 2 * W.a₂ * x₀ + W.a₄)) +
      ((x ^ 2 + x * x₀ + x₀ ^ 2 + W.a₂ * (x + x₀) + W.a₄ - W.a₁ * y) -
        -(W.a₁ * y₀ - (3 * x₀ ^ 2 + 2 * W.a₂ * x₀ + W.a₄))) by ring,
    Valuation.map_add_eq_of_lt_left, Valuation.map_neg, hc]
  refine lt_of_le_of_lt hdiff ?_
  rw [Valuation.map_neg, hc, exp_lt_exp]
  lia
end

lemma exp_one_le_valued_slope {x₀ y₀ x y : v.adicCompletion K} {c : ℤ} {s : ℕ}
    (hxx : x ≠ x₀) (hsc : 1 - c ≤ (s : ℤ)) (hy : Valued.v (y - y₀) ≤ exp (-(s : ℤ)))
    (hprod : Valued.v (y - W.negY x₀ y₀) * Valued.v (y - y₀) = Valued.v (x - x₀) * exp c) :
    exp (1 : ℤ) ≤ Valued.v ((y - W.negY x₀ y₀) / (x - x₀)) := by
  obtain ⟨dx, hdx⟩ : ∃ dx : ℤ, Valued.v (x - x₀) = exp dx :=
    ⟨_, (exp_log (by simpa using sub_ne_zero.mpr hxx)).symm⟩
  obtain ⟨dy, hdy⟩ : ∃ dy : ℤ, Valued.v (y - y₀) = exp dy := by
    refine ⟨_, (exp_log fun h0 ↦ ?_).symm⟩
    rw [h0, mul_zero, hdx] at hprod
    exact mul_ne_zero exp_ne_zero exp_ne_zero hprod.symm
  obtain ⟨nv, hnv⟩ : ∃ nv : ℤ, Valued.v (y - W.negY x₀ y₀) = exp nv := by
    refine ⟨_, (exp_log fun h0 ↦ ?_).symm⟩
    rw [h0, zero_mul, hdx] at hprod
    exact mul_ne_zero exp_ne_zero exp_ne_zero hprod.symm
  rw [hnv, hdy, hdx, ← exp_add, ← exp_add, exp_inj] at hprod
  have hdy' : dy ≤ -(s : ℤ) := by rwa [hdy, exp_le_exp] at hy
  rw [map_div₀, hnv, hdx, ← exp_sub, exp_le_exp]
  lia
 
lemma valued_iotaEval {t : v.adicCompletionIntegers K}
    (hm : t ∈ maximalIdeal (v.adicCompletionIntegers K)) :
    Valued.v ((W₀.iotaEval t : v.adicCompletionIntegers K) : v.adicCompletion K) =
      Valued.v (t : v.adicCompletion K) := by
  rw [coe_iotaEval_eq hm, Valuation.map_neg, map_mul,
    valued_coe_isUnit (W₀.isUnit_duEval hm), mul_one]
 
lemma valued_coe_wEval {t : v.adicCompletionIntegers K}
    (hm : t ∈ maximalIdeal (v.adicCompletionIntegers K)) :
    Valued.v ((W₀.wEval t : v.adicCompletionIntegers K) : v.adicCompletion K) =
      Valued.v (t : v.adicCompletion K) ^ 3 := by
  have h := congrArg (fun a : v.adicCompletionIntegers K ↦ (a : v.adicCompletion K))
    (W₀.wEval_eq_cube_mul hm)
  push_cast at h
  rw [h, map_mul, map_pow, valued_coe_isUnit (W₀.isUnit_vEval hm), mul_one]
lemma ne_of_valued_lt {a b : v.adicCompletionIntegers K}
    (h : Valued.v (a : v.adicCompletion K) < Valued.v (b : v.adicCompletion K)) : a ≠ b :=
  fun he ↦ h.ne (by rw [he])
 
lemma ne_iotaEval_self {s : v.adicCompletionIntegers K}
    (hsm : s ∈ maximalIdeal (v.adicCompletionIntegers K)) (hs0 : s ≠ 0)
    (h2 : Valued.v (s : v.adicCompletion K) <
      Valued.v ((2 : v.adicCompletionIntegers K) : v.adicCompletion K)) :
    s ≠ W₀.iotaEval s := by
  intro h
  have hws_le : Valued.v ((W₀.wEval s : v.adicCompletionIntegers K) : v.adicCompletion K) ≤
      Valued.v (s : v.adicCompletion K) := by
    rw [valued_coe_wEval hsm]
    calc Valued.v (s : v.adicCompletion K) ^ 3
        = Valued.v (s : v.adicCompletion K) * Valued.v (s : v.adicCompletion K) ^ 2 :=
          pow_succ' _ 2
      _ ≤ Valued.v (s : v.adicCompletion K) * 1 :=
          mul_le_mul' le_rfl (pow_le_one' (valued_coe_le_one s) 2)
      _ = Valued.v (s : v.adicCompletion K) := mul_one _
  have hcoe2 := congrArg (fun a : v.adicCompletionIntegers K ↦ (a : v.adicCompletion K))
    (W₀.eq_two_of_iotaEval_self hsm hs0 h)
  push_cast at hcoe2
  have hval2 : Valued.v ((2 : v.adicCompletionIntegers K) : v.adicCompletion K) ≤
      Valued.v (s : v.adicCompletion K) := by
    rw [← hcoe2]
    refine le_trans (Valued.v.map_add _ _) (max_le ?_ ?_)
    · rw [map_mul]
      exact (mul_le_mul' (valued_coe_le_one _) le_rfl).trans_eq (one_mul _)
    · rw [map_mul]
      calc Valued.v (W₀.a₃ : v.adicCompletion K) *
            Valued.v ((W₀.wEval s : v.adicCompletionIntegers K) : v.adicCompletion K)
          ≤ 1 * Valued.v (s : v.adicCompletion K) :=
            mul_le_mul' (valued_coe_le_one _) hws_le
        _ = Valued.v (s : v.adicCompletion K) := one_mul _
  exact absurd (lt_of_le_of_lt hval2 h2) (lt_irrefl _)

lemma exists_aux_param [CharZero K] {t : v.adicCompletionIntegers K}
    (hm : t ∈ maximalIdeal (v.adicCompletionIntegers K)) (h0 : t ≠ 0) :
    ∃ s : v.adicCompletionIntegers K, s ∈ maximalIdeal (v.adicCompletionIntegers K) ∧
      s ≠ 0 ∧ s ≠ t ∧ s ≠ W₀.iotaEval t ∧ s ≠ W₀.iotaEval s := by
  have hchar : CharZero (v.adicCompletion K) :=
    charZero_of_injective_algebraMap (algebraMap K (v.adicCompletion K)).injective
  have h20 : ((2 : v.adicCompletionIntegers K) : v.adicCompletion K) ≠ 0 := by
    exact_mod_cast (two_ne_zero : (2 : v.adicCompletion K) ≠ 0)
  
  obtain ⟨π, hπ⟩ := IsDiscreteValuationRing.exists_irreducible (v.adicCompletionIntegers K)
  have hπv : Valued.v ((π : v.adicCompletionIntegers K) : v.adicCompletion K) = exp (-1) := by
    have h := v.valued_irreducible_adicCompletionIntegers hπ
    rwa [algebraMap_eq_coe] at h
  have ht0' : Valued.v (t : v.adicCompletion K) ≠ 0 := by
    simp only [ne_eq, _root_.map_eq_zero, ZeroMemClass.coe_eq_zero]
    exact h0
  obtain ⟨m, htv⟩ : ∃ m : ℤ, Valued.v (t :
      v.adicCompletion K) = exp m := ⟨_, (exp_log ht0').symm⟩
  have hm1 : m ≤ -1 := by
    have h := mem_maximalIdeal_iff.mp hm
    rwa [htv, exp_le_exp] at h
  obtain ⟨c, h2v⟩ : ∃ c : ℤ, Valued.v ((2 : v.adicCompletionIntegers K) :
      v.adicCompletion K) = exp c := ⟨_, (exp_log (by simp [h20])).symm⟩
  have hc0 : c ≤ 0 := by
    have h := valued_coe_le_one (2 : v.adicCompletionIntegers K)
    rwa [h2v, ← exp_zero, exp_le_exp] at h
  obtain ⟨k, hkdef⟩ : ∃ k : ℕ, (k : ℤ) = max (-m) (-c) + 1 :=
    ⟨(max (-m) (-c) + 1).toNat, Int.toNat_of_nonneg (by omega)⟩
  obtain ⟨s, hsdef⟩ : ∃ s : v.adicCompletionIntegers K, s = π ^ k := ⟨_, rfl⟩
  have hsv : Valued.v ((s : v.adicCompletionIntegers K) : v.adicCompletion K) =
      exp (-(k : ℤ)) := by
    rw [hsdef]
    push_cast
    rw [map_pow, hπv, ← exp_nsmul, nsmul_eq_mul]
    congr 1
    ring
  have hks : -(k : ℤ) < m := by omega
  have hkc : -(k : ℤ) < c := by omega
  have hsm : s ∈ maximalIdeal (v.adicCompletionIntegers K) :=
    mem_maximalIdeal_iff.mpr (by rw [hsv, exp_le_exp]; lia)
  have hs0 : s ≠ 0 := by
    rw [hsdef]
    exact pow_ne_zero _ hπ.ne_zero
  refine ⟨s, hsm, hs0, ?_, ?_, ?_⟩
  · exact ne_of_valued_lt (by rw [hsv, htv, exp_lt_exp]; exact hks)
  · refine ne_of_valued_lt ?_
    rw [valued_iotaEval hm, hsv, htv, exp_lt_exp]
    exact hks
  · exact ne_iotaEval_self hsm hs0 (by rw [hsv, h2v, exp_lt_exp]; exact hkc)
lemma ne_of_coe_ne {z z' : W₀.formalGroupLaw.Points}
    (h : (z () : v.adicCompletionIntegers K) ≠ (z' () : v.adicCompletionIntegers K)) :
    z ≠ z' :=
  fun h' ↦ h (congrArg (fun w ↦ (w () : v.adicCompletionIntegers K)) h')

lemma exists_aux_point [CharZero K] {z : W₀.formalGroupLaw.Points}
    (h0 : (z () : v.adicCompletionIntegers K) ≠ 0) :
    ∃ u : W₀.formalGroupLaw.Points, (u () : v.adicCompletionIntegers K) ≠ 0 ∧
      u ≠ z ∧ u ≠ W₀.negPoint z ∧ W₀.negPoint u ≠ z ∧ W₀.negPoint u ≠ W₀.negPoint z ∧
      (u () : v.adicCompletionIntegers K) ≠ W₀.iotaEval (u ()) := by
  obtain ⟨s, hsm, hs0, hst, hsιt, hsιs⟩ := exists_aux_param (z ()).2 h0

  set u : W₀.formalGroupLaw.Points := fun _ ↦ ⟨s, hsm⟩
  refine ⟨u, hs0, ne_of_coe_ne hst, ne_of_coe_ne ?_, ne_of_coe_ne ?_, ne_of_coe_ne ?_, hsιs⟩
  · rw [W₀.negPoint_apply_coe]
    exact hsιt
  · rw [W₀.negPoint_apply_coe]
    exact fun h ↦ hsιt ((W₀.iotaEval_iotaEval hsm).symm.trans (congrArg _ h))
  · rw [W₀.negPoint_apply_coe, W₀.negPoint_apply_coe]
    exact fun h ↦ hst (((W₀.iotaEval_iotaEval hsm).symm.trans (congrArg _ h)).trans
      (W₀.iotaEval_iotaEval (z ()).2))
 
theorem valued_formalPoint_x
    (ht : t ∈ maximalIdeal (v.adicCompletionIntegers K)) (ht0 : t ≠ 0) :
    Valued.v ((t : v.adicCompletion K) / (W₀.wEval t : v.adicCompletion K)) =
      (Valued.v (t : v.adicCompletion K))⁻¹ ^ 2 := by
  have hvE : Valued.v ((W₀.vEval t : v.adicCompletionIntegers K) : v.adicCompletion K) = 1 :=
    valued_coe_isUnit (W₀.isUnit_vEval ht)
  have hw : ((W₀.wEval t : v.adicCompletionIntegers K) : v.adicCompletion K) =
      (t : v.adicCompletion K) ^ 3 * ((W₀.vEval t : v.adicCompletionIntegers K) :
        v.adicCompletion K) := by
    rw [W₀.wEval_eq_cube_mul ht]
    push_cast
    rfl
  have ht0' : Valued.v (t : v.adicCompletion K) ≠ 0 := by
    simp only [ne_eq, _root_.map_eq_zero, ZeroMemClass.coe_eq_zero]
    exact ht0
  rw [map_div₀, hw, map_mul, map_pow, hvE, mul_one, inv_pow, pow_succ',
    div_mul_eq_div_div, div_self ht0', one_div]

lemma add_param_mem_pow {z z' : W₀.formalGroupLaw.Points} {n : ℕ}
    (hz : (z () : v.adicCompletionIntegers K) ∈
      maximalIdeal (v.adicCompletionIntegers K) ^ (n + 1))
    (hz' : (z' () : v.adicCompletionIntegers K) ∈
      maximalIdeal (v.adicCompletionIntegers K) ^ (n + 1)) :
    ((z + z') () : v.adicCompletionIntegers K) ∈
      maximalIdeal (v.adicCompletionIntegers K) ^ (n + 1) := by
  rw [W₀.add_apply_coe_eq_addEval]
  refine MvPSeries.eval_mem_maximalIdeal_pow (hasEval_pairElim (z ()).2 (z' ()).2)
    (by rintro (j | j) <;> assumption) W₀.addSeries ?_
  rw [W₀.constantCoeff_addSeries]
  exact zero_mem _
lemma param_pow_iff {t : v.adicCompletionIntegers K}
    (hm : t ∈ maximalIdeal (v.adicCompletionIntegers K)) (h0 : t ≠ 0) (n : ℕ) :
    t ∈ maximalIdeal (v.adicCompletionIntegers K) ^ (n + 1) ↔
      exp (2 * (n + 1) : ℤ) ≤ Valued.v ((t : v.adicCompletion K) /
        ((W₀.wEval t : v.adicCompletionIntegers K) : v.adicCompletion K)) := by
  rw [valued_formalPoint_x hm h0, mem_maximalIdeal_pow_iff]
  have ht0' : Valued.v (t : v.adicCompletion K) ≠ 0 := by
    simp only [ne_eq, _root_.map_eq_zero, ZeroMemClass.coe_eq_zero]
    exact h0
  obtain ⟨m, hmv⟩ : ∃ m : ℤ, Valued.v (t : v.adicCompletion K) = exp m :=
    ⟨_, (exp_log ht0').symm⟩
  rw [hmv, ← exp_neg, ← exp_nsmul, exp_le_exp, exp_le_exp, nsmul_eq_mul]
  push_cast
  constructor <;> intro h <;> lia
end WeierstrassCurve.Affine
end
end

/- EllipticCurves.WeierstrassFormalGroup.Filtration -/
section
section
open ChabautyColeman IsLocalRing MvPowerSeries
open scoped MvPowerSeries.WithPiTopology
namespace WeierstrassCurve.Affine
open IsDedekindDomain IsDedekindDomain.HeightOneSpectrum IsLocalRing WithZero
variable {R : Type*} [CommRing R] [IsDedekindDomain R]
  {K : Type*} [Field K] [Algebra R K] [IsFractionRing R K]
  {v : HeightOneSpectrum R} {W : Affine (v.adicCompletion K)}
  {W₀ : WeierstrassCurve (v.adicCompletionIntegers K)}
  (hW : W₀.map (algebraMap (v.adicCompletionIntegers K) (v.adicCompletion K)) = W)
  {t : v.adicCompletionIntegers K}
variable [W.IsElliptic]
include hW in

theorem formalPoint_nonsingular
    (ht : t ∈ maximalIdeal (v.adicCompletionIntegers K)) (ht0 : t ≠ 0) :
    W.Nonsingular ((t : v.adicCompletion K) / (W₀.wEval t : v.adicCompletion K))
      (-1 / (W₀.wEval t : v.adicCompletion K)) := by
  exact W.chord_point_nonsingular (coe_wEval_eq hW ht) (coe_wEval_ne_zero ht ht0)
    W.isUnit_Δ.ne_zero
variable [DecidableEq (v.adicCompletion K)]

noncomputable def formalPoint (z : W₀.formalGroupLaw.Points) : W.Point :=
  if h0 : (z () : v.adicCompletionIntegers K) = 0 then 0
  else .some _ _ (formalPoint_nonsingular hW (z ()).2 h0)
@[simp]
lemma formalPoint_of_param_eq_zero {z : W₀.formalGroupLaw.Points}
    (h0 : (z () : v.adicCompletionIntegers K) = 0) : formalPoint hW z = 0 :=
  dif_pos h0
lemma formalPoint_of_param_ne_zero {z : W₀.formalGroupLaw.Points}
    (h0 : (z () : v.adicCompletionIntegers K) ≠ 0) :
    formalPoint hW z = .some _ _ (formalPoint_nonsingular hW (z ()).2 h0) :=
  dif_neg h0
 
theorem formalPoint_injective : Function.Injective (formalPoint hW) := by
  intro z z' h
  have key : (z () : v.adicCompletionIntegers K) = z' () := by
    rcases eq_or_ne (z () : v.adicCompletionIntegers K) 0 with h0 | h0 <;>
      rcases eq_or_ne (z' () : v.adicCompletionIntegers K) 0 with h0' | h0'
    · rw [h0, h0']
    · rw [formalPoint_of_param_eq_zero hW h0, formalPoint_of_param_ne_zero hW h0'] at h
      exact absurd h.symm (by simp)
    · rw [formalPoint_of_param_ne_zero hW h0, formalPoint_of_param_eq_zero hW h0'] at h
      exact absurd h (by simp)
    · rw [formalPoint_of_param_ne_zero hW h0, formalPoint_of_param_ne_zero hW h0'] at h
      simp only [Point.some.injEq] at h
      obtain ⟨hX, hY⟩ := h
      have hw0 := coe_wEval_ne_zero (W₀ := W₀) (z ()).2 h0
      have hw0' := coe_wEval_ne_zero (W₀ := W₀) (z' ()).2 h0'
      have hw : ((W₀.wEval (z ()) : v.adicCompletionIntegers K) : v.adicCompletion K) =
          ((W₀.wEval (z' ()) : v.adicCompletionIntegers K) : v.adicCompletion K) := by
        field_simp at hY
        exact (neg_injective hY).symm
      rw [hw, div_eq_div_iff hw0' hw0'] at hX
      exact_mod_cast mul_right_cancel₀ hw0' hX
  funext i
  exact Subtype.ext key

theorem exists_formalPoint_eq_some {x y : v.adicCompletion K} (h : W.Nonsingular x y)
    (hx : exp (2 : ℤ) ≤ Valued.v x) :
    ∃ z : W₀.formalGroupLaw.Points, formalPoint hW z = .some x y h := by
  obtain ⟨hy0, hs, hr⟩ := valued_of_mem hW h.left hx
  have hexp1 : (exp (-1 : ℤ) : ℤᵐ⁰) ≤ 1 := by
    rw [← exp_zero, exp_le_exp]
    lia
  have hx0 : x ≠ 0 := by
    intro h0
    rw [h0, map_zero] at hx
    simp at hx
  set t : v.adicCompletionIntegers K :=
    ⟨-x / y, by rw [mem_adicCompletionIntegers]; exact hs.trans hexp1⟩ with htdef
  set r : v.adicCompletionIntegers K :=
    ⟨-1 / y, by rw [mem_adicCompletionIntegers]; exact hr.trans hexp1⟩ with hrdef
  have htm : t ∈ maximalIdeal (v.adicCompletionIntegers K) := mem_maximalIdeal_iff.mpr hs
  have hrm : r ∈ maximalIdeal (v.adicCompletionIntegers K) := mem_maximalIdeal_iff.mpr hr
  have ht0 : t ≠ 0 := by
    intro hteq
    have h0 : (-x / y : v.adicCompletion K) = 0 := congrArg Subtype.val hteq
    rw [div_eq_zero_iff, neg_eq_zero] at h0
    exact h0.elim hx0 hy0
  
  have hfixK : (-1 / y : v.adicCompletion K) =
      (-x / y) ^ 3 + W.a₁ * (-x / y) * (-1 / y) + W.a₂ * (-x / y) ^ 2 * (-1 / y) +
        W.a₃ * (-1 / y) ^ 2 + W.a₄ * (-x / y) * (-1 / y) ^ 2 + W.a₆ * (-1 / y) ^ 3 := by
    have heq := (W.equation_iff x y).mp h.left
    field_simp
    linear_combination -heq
  have hfixO : r = W₀.wPoly t r := by
    refine Subtype.coe_injective ?_
    rw [wPoly]
    push_cast
    rw [coe_a₁ hW, coe_a₂ hW, coe_a₃ hW, coe_a₄ hW, coe_a₆ hW]
    exact hfixK
  have huniq : W₀.wEval t = r :=
    W₀.eq_of_wPoly_fixed htm (W₀.wEval_mem htm) hrm (W₀.wEval_eq htm) hfixO

  set u : W₀.formalGroupLaw.Points := fun _ ↦ ⟨t, htm⟩
  refine ⟨u, ?_⟩
  rw [formalPoint_of_param_ne_zero hW ht0]
  simp only [Point.some.injEq]
  have hrcoe : ((W₀.wEval t : v.adicCompletionIntegers K) : v.adicCompletion K) = -1 / y := by
    rw [huniq]
  constructor
  · rw [hrcoe]
    show (-x / y) / (-1 / y) = x
    field_simp
  · rw [hrcoe]
    show -1 / (-1 / y) = y
    field_simp
include hW in
 
theorem formalPoint_negPoint (z : W₀.formalGroupLaw.Points) :
    formalPoint hW (W₀.negPoint z) = -formalPoint hW z := by
  rcases eq_or_ne ((z ()) : v.adicCompletionIntegers K) 0 with h0 | h0
  · rw [formalPoint_of_param_eq_zero hW h0, formalPoint_of_param_eq_zero hW
      (by rw [W₀.negPoint_apply_coe, h0, W₀.iotaEval_zero]), neg_zero]
  · have hm := (z ()).2
    have hι0 : W₀.iotaEval (z () : v.adicCompletionIntegers K) ≠ 0 :=
      W₀.iotaEval_ne_zero hm h0
    rw [formalPoint_of_param_ne_zero hW h0,
      formalPoint_of_param_ne_zero hW (by rw [W₀.negPoint_apply_coe]; exact hι0),
      Point.neg_some]
    simp only [Point.some.injEq, W₀.negPoint_apply_coe]
    have hWT0 := coe_wEval_ne_zero (W₀ := W₀) hm h0
    have hDU0 := coe_duEval_ne_zero (W₀ := W₀) hm
    constructor
    · rw [coe_iotaEval_eq hm, coe_wEval_iotaEval hm]
      field_simp
    · rw [coe_wEval_iotaEval hm, Affine.negY]
      field_simp
      linear_combination -coe_uEval_mul_duEval hm +
        ((W₀.duEval (z ()) : v.adicCompletionIntegers K) : v.adicCompletion K) *
          coe_uEval_eq hW hm
include hW in

lemma paramPoint_add {t₁ t₂ : v.adicCompletionIntegers K}
    (hm : t₁ ∈ maximalIdeal (v.adicCompletionIntegers K))
    (hm' : t₂ ∈ maximalIdeal (v.adicCompletionIntegers K))
    (h0 : t₁ ≠ 0) (h0' : t₂ ≠ 0)
    (hx : ((t₁ : v.adicCompletion K)) *
        ((W₀.wEval t₂ : v.adicCompletionIntegers K) : v.adicCompletion K) ≠
      ((t₂ : v.adicCompletion K)) *
        ((W₀.wEval t₁ : v.adicCompletionIntegers K) : v.adicCompletion K))
    (hT0 : W₀.thirdRootEval t₁ t₂ ≠ 0)
    (hιm : W₀.iotaEval (W₀.thirdRootEval t₁ t₂) ∈ maximalIdeal (v.adicCompletionIntegers K))
    (hι0 : W₀.iotaEval (W₀.thirdRootEval t₁ t₂) ≠ 0) :
    (.some _ _ (formalPoint_nonsingular hW hm h0) : W.Point) +
        .some _ _ (formalPoint_nonsingular hW hm' h0') =
      .some _ _ (formalPoint_nonsingular hW hιm hι0) := by
  have hTm : W₀.thirdRootEval t₁ t₂ ∈ maximalIdeal (v.adicCompletionIntegers K) :=
    W₀.thirdRootEval_mem hm hm'
  
  have hslope := congrArg (fun a : v.adicCompletionIntegers K ↦ (a : v.adicCompletion K))
    (W₀.slopeEval_mul_sub hm hm')
  have hNc := congrArg (fun a : v.adicCompletionIntegers K ↦ (a : v.adicCompletion K))
    (W₀.interceptEval_eq hm hm')
  have hT₃c := congrArg (fun a : v.adicCompletionIntegers K ↦ (a : v.adicCompletion K))
    (W₀.thirdRootEval_relation hm hm')
  have hwTc := congrArg (fun a : v.adicCompletionIntegers K ↦ (a : v.adicCompletion K))
    (W₀.wEval_thirdRootEval hm hm')
  push_cast at hslope hNc hT₃c hwTc
  rw [coe_a₁ hW, coe_a₂ hW, coe_a₃ hW, coe_a₄ hW, coe_a₆ hW] at hT₃c
  have hAc := coe_chordCoeff_ne_zero hW (W₀.slopeEval_mem hm hm')
  have hw₁0 := coe_wEval_ne_zero (W₀ := W₀) hm h0
  have hw₂0 := coe_wEval_ne_zero (W₀ := W₀) hm' h0'
  have hwT0 := coe_wEval_ne_zero (W₀ := W₀) hTm hT0
  obtain ⟨h₃, hsum⟩ := W.chord_point_add (coe_wEval_eq hW hm) (coe_wEval_eq hW hm')
    hslope hNc hT₃c hwTc hAc hw₁0 hw₂0 hwT0 (sub_ne_zero.mpr hx)
    (formalPoint_nonsingular hW hm h0) (formalPoint_nonsingular hW hm' h0')
  rw [hsum]
  simp only [Point.some.injEq]
  
  have hDU0 := coe_duEval_ne_zero (W₀ := W₀) hTm
  constructor
  · rw [coe_iotaEval_eq hTm, coe_wEval_iotaEval hTm]
    field_simp
  · rw [coe_wEval_iotaEval hTm]
    field_simp
    linear_combination coe_uEval_mul_duEval hTm -
      ((W₀.duEval (W₀.thirdRootEval t₁ t₂) : v.adicCompletionIntegers K) :
        v.adicCompletion K) * coe_uEval_eq hW hTm
include hW in

lemma formalPoint_add_of_x_ne {z z' : W₀.formalGroupLaw.Points}
    (h0 : (z () : v.adicCompletionIntegers K) ≠ 0)
    (h0' : (z' () : v.adicCompletionIntegers K) ≠ 0)
    (hx : ((z () : v.adicCompletionIntegers K) : v.adicCompletion K) *
        ((W₀.wEval (z' ()) : v.adicCompletionIntegers K) : v.adicCompletion K) ≠
      ((z' () : v.adicCompletionIntegers K) : v.adicCompletion K) *
        ((W₀.wEval (z ()) : v.adicCompletionIntegers K) : v.adicCompletion K)) :
    formalPoint hW (z + z') = formalPoint hW z + formalPoint hW z' := by
  have hm := (z ()).2
  have hm' := (z' ()).2
  
  have hT0 : W₀.thirdRootEval (z () : v.adicCompletionIntegers K)
      (z' () : v.adicCompletionIntegers K) ≠ 0 :=
    W₀.thirdRootEval_ne_zero hm hm' fun hc ↦ hx (by
      have := congrArg (fun a : v.adicCompletionIntegers K ↦ (a : v.adicCompletion K)) hc
      push_cast at this
      exact this)
  have hTm := W₀.thirdRootEval_mem hm hm'
  have hιm : W₀.iotaEval (W₀.thirdRootEval (z () : v.adicCompletionIntegers K)
      (z' () : v.adicCompletionIntegers K)) ∈ maximalIdeal (v.adicCompletionIntegers K) :=
    W₀.iotaEval_mem hTm
  have hι0 : W₀.iotaEval (W₀.thirdRootEval (z () : v.adicCompletionIntegers K)
      (z' () : v.adicCompletionIntegers K)) ≠ 0 := W₀.iotaEval_ne_zero hTm hT0
  have hpcoe : ((z + z') () : v.adicCompletionIntegers K) =
      W₀.iotaEval (W₀.thirdRootEval (z () : v.adicCompletionIntegers K)
        (z' () : v.adicCompletionIntegers K)) := by
    rw [W₀.add_apply_coe_eq_addEval, W₀.addEval_eq hm hm']
  have hp0 : ((z + z') () : v.adicCompletionIntegers K) ≠ 0 := by
    rw [hpcoe]
    exact hι0
  rw [formalPoint_of_param_ne_zero hW h0, formalPoint_of_param_ne_zero hW h0',
    formalPoint_of_param_ne_zero hW hp0,
    paramPoint_add hW hm hm' h0 h0' hx hT0 hιm hι0]
  simp only [hpcoe]
include hW in

lemma eq_or_eq_negPoint_of_x_cond {z z' : W₀.formalGroupLaw.Points}
    (h0 : (z () : v.adicCompletionIntegers K) ≠ 0)
    (h0' : (z' () : v.adicCompletionIntegers K) ≠ 0)
    (hx : ((z () : v.adicCompletionIntegers K) : v.adicCompletion K) *
        ((W₀.wEval (z' ()) : v.adicCompletionIntegers K) : v.adicCompletion K) =
      ((z' () : v.adicCompletionIntegers K) : v.adicCompletion K) *
        ((W₀.wEval (z ()) : v.adicCompletionIntegers K) : v.adicCompletion K)) :
    z' = z ∨ z' = W₀.negPoint z := by
  have hm := (z ()).2
  have hm' := (z' ()).2
  have hWT0 := coe_wEval_ne_zero (W₀ := W₀) hm h0
  have hWT0' := coe_wEval_ne_zero (W₀ := W₀) hm' h0'
  have hns := formalPoint_nonsingular hW hm h0
  have hns' := formalPoint_nonsingular hW hm' h0'
  have hxeq : ((z' () : v.adicCompletionIntegers K) : v.adicCompletion K) /
      ((W₀.wEval (z' ()) : v.adicCompletionIntegers K) : v.adicCompletion K) =
      ((z () : v.adicCompletionIntegers K) : v.adicCompletion K) /
        ((W₀.wEval (z ()) : v.adicCompletionIntegers K) : v.adicCompletion K) := by
    rw [div_eq_div_iff hWT0' hWT0]
    linear_combination -hx
  rcases W.Y_eq_of_X_eq hns'.left hns.left hxeq with hy | hy
  · left
    refine formalPoint_injective hW ?_
    rw [formalPoint_of_param_ne_zero hW h0', formalPoint_of_param_ne_zero hW h0]
    simp only [Point.some.injEq]
    exact ⟨hxeq, hy⟩
  · right
    refine formalPoint_injective hW ?_
    rw [formalPoint_negPoint hW, formalPoint_of_param_ne_zero hW h0',
      formalPoint_of_param_ne_zero hW h0, Point.neg_some]
    simp only [Point.some.injEq]
    exact ⟨hxeq, hy⟩
include hW in

lemma formalPoint_add_of_ne {z z' : W₀.formalGroupLaw.Points}
    (h0 : (z () : v.adicCompletionIntegers K) ≠ 0)
    (h0' : (z' () : v.adicCompletionIntegers K) ≠ 0)
    (hne : z' ≠ z) (hnneg : z' ≠ W₀.negPoint z) :
    formalPoint hW (z + z') = formalPoint hW z + formalPoint hW z' := by
  refine formalPoint_add_of_x_ne hW h0 h0' fun hx ↦ ?_
  rcases eq_or_eq_negPoint_of_x_cond hW h0 h0' hx with h | h
  · exact hne h
  · exact hnneg h
include hW in

lemma add_param_ne_zero {z w : W₀.formalGroupLaw.Points}
    (hc : formalPoint hW (z + w) = formalPoint hW z + formalPoint hW w)
    (hne : w ≠ W₀.negPoint z) :
    ((z + w) () : v.adicCompletionIntegers K) ≠ 0 := by
  intro h
  rw [formalPoint_of_param_eq_zero hW h] at hc
  refine hne (formalPoint_injective hW ?_)
  rw [formalPoint_negPoint hW]
  exact eq_neg_of_add_eq_zero_right hc.symm
variable [CharZero K]
include hW in

lemma formalPoint_add_self {z : W₀.formalGroupLaw.Points}
    (h0 : (z () : v.adicCompletionIntegers K) ≠ 0)
    (h2t : (z () : v.adicCompletionIntegers K) ≠ W₀.iotaEval (z ())) :
    formalPoint hW (z + z) = formalPoint hW z + formalPoint hW z := by
  obtain ⟨u, hu0, hune, hunneg, hnune, hnunneg, huιu⟩ := exists_aux_point h0
  have hnu0 : ((W₀.negPoint u) () : v.adicCompletionIntegers K) ≠ 0 := by
    rw [W₀.negPoint_apply_coe]
    exact W₀.iotaEval_ne_zero (u ()).2 hu0
  have c1 : formalPoint hW (z + u) = formalPoint hW z + formalPoint hW u :=
    formalPoint_add_of_ne hW h0 hu0 hune hunneg
  have c2 : formalPoint hW (z + W₀.negPoint u) =
      formalPoint hW z + formalPoint hW (W₀.negPoint u) :=
    formalPoint_add_of_ne hW h0 hnu0 hnune hnunneg
  have hcne : z + W₀.negPoint u ≠ z + u := by
    intro h
    have h' := congrArg (formalPoint hW) h
    rw [c1, c2] at h'
    have h3 := congrArg (fun w ↦ (w () : v.adicCompletionIntegers K))
      (formalPoint_injective hW (add_left_cancel h'))
    rw [W₀.negPoint_apply_coe] at h3
    exact huιu h3.symm
  have hcnneg : z + W₀.negPoint u ≠ W₀.negPoint (z + u) := by
    intro h
    have h' := congrArg (formalPoint hW) h
    simp only [c1, c2, formalPoint_negPoint hW, neg_add] at h'
    have h'' := add_right_cancel h'
    rw [← formalPoint_negPoint hW] at h''
    exact h2t (congrArg (fun w ↦ (w () : v.adicCompletionIntegers K))
      (formalPoint_injective hW h''))
  have c3 : formalPoint hW ((z + u) + (z + W₀.negPoint u)) =
      formalPoint hW (z + u) + formalPoint hW (z + W₀.negPoint u) :=
    formalPoint_add_of_ne hW (add_param_ne_zero hW c1 hunneg)
      (add_param_ne_zero hW c2 hnunneg) hcne hcnneg
  have hkey : (z + u) + (z + W₀.negPoint u) = z + z := by
    rw [add_add_add_comm, W₀.add_negPoint, add_zero]
  rw [← hkey, c3, c1, c2, formalPoint_negPoint hW]
  abel
include hW in
 
theorem formalPoint_add (z z' : W₀.formalGroupLaw.Points) :
    formalPoint hW (z + z') = formalPoint hW z + formalPoint hW z' := by
  rcases eq_or_ne (z () : v.adicCompletionIntegers K) 0 with h0 | h0
  · have hz : z = 0 := funext fun _ ↦ Subtype.ext h0
    rw [hz, zero_add, formalPoint_of_param_eq_zero hW (z := 0) (by rfl), zero_add]
  rcases eq_or_ne (z' () : v.adicCompletionIntegers K) 0 with h0' | h0'
  · have hz' : z' = 0 := funext fun _ ↦ Subtype.ext h0'
    rw [hz', add_zero, formalPoint_of_param_eq_zero hW (z := 0) (by rfl), add_zero]
  rcases eq_or_ne (z' () : v.adicCompletionIntegers K) (W₀.iotaEval (z ())) with hinv | hinv
  · have hz' : z' = W₀.negPoint z := funext fun _ ↦ Subtype.ext hinv
    rw [hz', W₀.add_negPoint, formalPoint_of_param_eq_zero hW (z := 0) (by rfl),
      formalPoint_negPoint hW, add_neg_cancel]
  rcases eq_or_ne (z' () : v.adicCompletionIntegers K) (z () : v.adicCompletionIntegers K)
    with heqp | hnep
  · have hz' : z' = z := funext fun _ ↦ Subtype.ext heqp
    rw [hz']
    exact formalPoint_add_self hW h0 fun h ↦ hinv (heqp.trans h)
  · exact formalPoint_add_of_ne hW h0 h0'
      (fun h ↦ hnep (congrArg (fun w ↦ (w () : v.adicCompletionIntegers K)) h))
      (fun h ↦ hinv (congrArg (fun w ↦ (w () : v.adicCompletionIntegers K)) h))

def filtration (hW : W₀.map (algebraMap (v.adicCompletionIntegers K)
    (v.adicCompletion K)) = W) (n : ℕ) : AddSubgroup W.Point where
  carrier := {P | match P with
    | .zero => True
    | .some x _ _ => exp (2 * (n + 1) : ℤ) ≤ Valued.v x}
  zero_mem' := trivial
  neg_mem' {P} hP := by
    match P with
    | .zero => exact hP
    | .some x y h => rw [Set.mem_ofPred_eq, Point.neg_some]; exact hP
  add_mem' {P Q} hP hQ := by
    match P, Q with
    | .zero, Q =>
      rw [show (Point.zero : W.Point) = 0 from rfl, zero_add]
      exact hQ
    | .some x₁ y₁ h₁, .zero =>
      rw [show (Point.zero : W.Point) = 0 from rfl, add_zero]
      exact hP
    | .some x₁ y₁ h₁, .some x₂ y₂ h₂ =>
      rw [Set.mem_ofPred_eq] at hP hQ
      obtain ⟨z, hz⟩ := exists_formalPoint_eq_some hW h₁
        (le_trans (exp_le_exp.mpr (by lia)) hP)
      obtain ⟨z', hz'⟩ := exists_formalPoint_eq_some hW h₂
        (le_trans (exp_le_exp.mpr (by lia)) hQ)
      have h0 : (z () : v.adicCompletionIntegers K) ≠ 0 := by
        intro h
        rw [formalPoint_of_param_eq_zero hW h] at hz
        exact absurd hz (by simp)
      have h0' : (z' () : v.adicCompletionIntegers K) ≠ 0 := by
        intro h
        rw [formalPoint_of_param_eq_zero hW h] at hz'
        exact absurd hz' (by simp)
      have hx₁ : ((z () : v.adicCompletionIntegers K) : v.adicCompletion K) /
          ((W₀.wEval (z ()) : v.adicCompletionIntegers K) : v.adicCompletion K) = x₁ := by
        have hz2 := hz
        rw [formalPoint_of_param_ne_zero hW h0] at hz2
        simp only [Point.some.injEq] at hz2
        exact hz2.1
      have hx₂ : ((z' () : v.adicCompletionIntegers K) : v.adicCompletion K) /
          ((W₀.wEval (z' ()) : v.adicCompletionIntegers K) : v.adicCompletion K) = x₂ := by
        have hz2 := hz'
        rw [formalPoint_of_param_ne_zero hW h0'] at hz2
        simp only [Point.some.injEq] at hz2
        exact hz2.1
      have hzm : (z () : v.adicCompletionIntegers K) ∈
          maximalIdeal (v.adicCompletionIntegers K) ^ (n + 1) :=
        (param_pow_iff (z ()).2 h0 n).mpr (by rw [hx₁]; exact hP)
      have hzm' : (z' () : v.adicCompletionIntegers K) ∈
          maximalIdeal (v.adicCompletionIntegers K) ^ (n + 1) :=
        (param_pow_iff (z' ()).2 h0' n).mpr (by rw [hx₂]; exact hQ)
      have hsum : Point.some x₁ y₁ h₁ + Point.some x₂ y₂ h₂ = formalPoint hW (z + z') := by
        rw [formalPoint_add hW, hz, hz']
      have hsm := add_param_mem_pow hzm hzm'
      rcases eq_or_ne (((z + z') ()) : v.adicCompletionIntegers K) 0 with hs0 | hs0
      · rw [Set.mem_ofPred_eq, hsum, formalPoint_of_param_eq_zero hW hs0]
        trivial
      · rw [Set.mem_ofPred_eq, hsum, formalPoint_of_param_ne_zero hW hs0]
        exact (param_pow_iff ((z + z') ()).2 hs0 n).mp hsm
variable {hW : W₀.map (algebraMap (v.adicCompletionIntegers K) (v.adicCompletion K)) = W}
  {n : ℕ}
@[simp]
lemma zero_mem_filtration : (0 : W.Point) ∈ filtration hW n := trivial
@[simp]
lemma some_mem_filtration {x y : v.adicCompletion K} {h : W.Nonsingular x y} :
    (.some x y h : W.Point) ∈ filtration hW n ↔ exp (2 * (n + 1) : ℤ) ≤ Valued.v x := Iff.rfl

theorem mem_pow_iff_formalPoint_mem_filtration (z : W₀.formalGroupLaw.Points) (n : ℕ) :
    (z () : v.adicCompletionIntegers K) ∈
        maximalIdeal (v.adicCompletionIntegers K) ^ (n + 1) ↔
      formalPoint hW z ∈ filtration hW n := by
  rcases eq_or_ne (z () : v.adicCompletionIntegers K) 0 with h0 | h0
  · simp [h0]
  · rw [formalPoint_of_param_ne_zero hW h0, some_mem_filtration]
    exact param_pow_iff (z ()).2 h0 n

theorem formalPoint_surjective {P : W.Point} (hP : P ∈ filtration hW 0) :
    ∃ z : W₀.formalGroupLaw.Points, formalPoint hW z = P := by
  match P with
  | .zero => exact ⟨0, formalPoint_of_param_eq_zero hW (z := 0) (by rfl)⟩
  | .some x y h =>
    rw [some_mem_filtration] at hP
    exact exists_formalPoint_eq_some hW h (le_trans (exp_le_exp.mpr (by lia)) hP)

lemma sub_mem_filtration_of_slope {x₀ y₀ x y : v.adicCompletion K}
    (h₀ : W.Nonsingular x₀ y₀) (h : W.Nonsingular x y) (hxx : x ≠ x₀)
    (hx₀ : Valued.v x₀ ≤ 1) (hxI : Valued.v x ≤ 1)
    (hs : exp (1 : ℤ) ≤ Valued.v ((y - W.negY x₀ y₀) / (x - x₀))) :
    (.some x y h : W.Point) - .some x₀ y₀ h₀ ∈ filtration hW 0 := by
  have ha₁ : Valued.v W.a₁ ≤ 1 := valued_a₁ hW
  have ha₂ : Valued.v W.a₂ ≤ 1 := valued_a₂ hW
  rw [sub_eq_add_neg, Point.neg_some,
    Point.add_some (fun hc ↦ hxx hc.1), some_mem_filtration]
  rw [Affine.slope_of_X_ne hxx, Affine.addX]
  set L : v.adicCompletion K := (y - W.negY x₀ y₀) / (x - x₀) with hL
  have hL1 : (1 : ℤᵐ⁰) < Valued.v L :=
    lt_of_lt_of_le (by rw [← exp_zero, exp_lt_exp]; lia) hs
  have hbig : ∀ c : ℤᵐ⁰, c ≤ 1 → c < Valued.v L ^ 2 := fun c hc ↦
    lt_of_le_of_lt hc (by
      calc (1 : ℤᵐ⁰) < Valued.v L := hL1
        _ = Valued.v L ^ 1 := (pow_one _).symm
        _ < Valued.v L ^ 2 := pow_lt_pow_right₀ hL1 (by lia))
  have hrest : Valued.v (W.a₁ * L - W.a₂ - x - x₀) < Valued.v L ^ 2 := by
    refine lt_of_le_of_lt (Valuation.map_sub _ _ _) (max_lt (lt_of_le_of_lt
      (Valuation.map_sub _ _ _) (max_lt (lt_of_le_of_lt (Valuation.map_sub _ _ _)
        (max_lt ?_ (hbig _ ha₂))) (hbig _ hxI))) (hbig _ hx₀))
    rw [map_mul]
    calc Valued.v W.a₁ * Valued.v L ≤ 1 * Valued.v L := mul_le_mul' ha₁ le_rfl
      _ = Valued.v L ^ 1 := by rw [one_mul, pow_one]
      _ < Valued.v L ^ 2 := pow_lt_pow_right₀ hL1 (by lia)
  rw [show L ^ 2 + W.a₁ * L - W.a₂ - x - x₀ = L ^ 2 + (W.a₁ * L - W.a₂ - x - x₀) by ring,
    Valuation.map_add_eq_of_lt_left _ (by rw [map_pow]; exact hrest), map_pow]
  refine le_trans (le_of_eq ?_) (pow_le_pow_left' hs 2)
  rw [← exp_nsmul, nsmul_eq_mul]
  norm_num
variable [Finite (R ⧸ v.asIdeal)]
end WeierstrassCurve.Affine
namespace WeierstrassCurve.Affine
open IsDedekindDomain IsDedekindDomain.HeightOneSpectrum WithZero
variable {R : Type*} [CommRing R] [IsDedekindDomain R]
  {K : Type*} [Field K] [Algebra R K] [IsFractionRing R K]
  (v : HeightOneSpectrum R) [DecidableEq (v.adicCompletion K)] [CharZero K]
  [Finite (R ⧸ v.asIdeal)] (W : Affine (v.adicCompletion K)) [W.IsElliptic]
end WeierstrassCurve.Affine
end
end

/- EllipticCurves.WeierstrassFormalGroup.Reduction -/
section
section
open IsLocalRing
namespace WeierstrassCurve.Affine
open IsDedekindDomain IsDedekindDomain.HeightOneSpectrum WithZero
variable {R : Type*} [CommRing R] [IsDedekindDomain R]
  {K : Type*} [Field K] [Algebra R K] [IsFractionRing R K]
  {v : HeightOneSpectrum R} {W : Affine (v.adicCompletion K)}
  {W₀ : WeierstrassCurve (v.adicCompletionIntegers K)}
  (hW : W₀.map (algebraMap (v.adicCompletionIntegers K) (v.adicCompletion K)) = W)

noncomputable abbrev adicRedCurve (W₀ : WeierstrassCurve (v.adicCompletionIntegers K)) :
    Affine (ResidueField (v.adicCompletionIntegers K)) :=
  (W₀.map (IsLocalRing.residue (v.adicCompletionIntegers K))).toAffine
include hW in
 
lemma equation_integral {x y : v.adicCompletion K} (h : W.Equation x y)
    (hx : Valued.v x ≤ 1) (hy : Valued.v y ≤ 1) :
    (W₀.toAffine).Equation (⟨x, hx⟩ : v.adicCompletionIntegers K) ⟨y, hy⟩ := by
  have hinj : Function.Injective
      (algebraMap (v.adicCompletionIntegers K) (v.adicCompletion K)) :=
    IsFractionRing.injective (v.adicCompletionIntegers K) (v.adicCompletion K)
  rw [← hW] at h
  exact ((W₀.toAffine).map_equation hinj (⟨x, hx⟩ : v.adicCompletionIntegers K) ⟨y, hy⟩).mp h
include hW in
 
lemma coe_negY {x y : v.adicCompletion K} (hx : Valued.v x ≤ 1) (hy : Valued.v y ≤ 1) :
    W.negY x y = ((W₀.toAffine).negY (⟨x, hx⟩ : v.adicCompletionIntegers K) ⟨y, hy⟩ :
      v.adicCompletion K) := by
  conv_lhs => rw [← hW]
  exact (W₀.toAffine).map_negY (algebraMap (v.adicCompletionIntegers K) (v.adicCompletion K))
    ⟨x, hx⟩ ⟨y, hy⟩
include hW in
 
lemma valued_negY_le {x y : v.adicCompletion K} (hx : Valued.v x ≤ 1)
    (hy : Valued.v y ≤ 1) : Valued.v (W.negY x y) ≤ 1 := by
  rw [coe_negY hW hx hy]; exact valued_coe_le_one _
include hW in
 
lemma redCoord_negY {x y : v.adicCompletion K} (hx : Valued.v x ≤ 1) (hy : Valued.v y ≤ 1)
    (hn : Valued.v (W.negY x y) ≤ 1) :
    IsLocalRing.residue _ ⟨W.negY x y, hn⟩
      = (adicRedCurve W₀).negY (IsLocalRing.residue _ ⟨x, hx⟩) (IsLocalRing.residue _ ⟨y, hy⟩) := by
  have hsub : (⟨W.negY x y, hn⟩ : v.adicCompletionIntegers K)
      = (W₀.toAffine).negY ⟨x, hx⟩ ⟨y, hy⟩ := Subtype.ext (coe_negY hW hx hy)
  rw [hsub]
  exact ((W₀.toAffine).map_negY (IsLocalRing.residue (v.adicCompletionIntegers K))
    ⟨x, hx⟩ ⟨y, hy⟩).symm
include hW in
 
lemma coe_addX {x₁ x₂ ℓ : v.adicCompletion K} (h₁ : Valued.v x₁ ≤ 1) (h₂ : Valued.v x₂ ≤ 1)
    (hℓ : Valued.v ℓ ≤ 1) :
    W.addX x₁ x₂ ℓ = ((W₀.toAffine).addX (⟨x₁, h₁⟩ : v.adicCompletionIntegers K) ⟨x₂, h₂⟩ ⟨ℓ, hℓ⟩ :
      v.adicCompletion K) := by
  conv_lhs => rw [← hW]
  exact (W₀.toAffine).map_addX (algebraMap (v.adicCompletionIntegers K) (v.adicCompletion K))
    ⟨x₁, h₁⟩ ⟨x₂, h₂⟩ ⟨ℓ, hℓ⟩
include hW in
 
lemma coe_addY {x₁ x₂ y₁ ℓ : v.adicCompletion K} (h₁ : Valued.v x₁ ≤ 1)
    (h₂ : Valued.v x₂ ≤ 1) (hy₁ : Valued.v y₁ ≤ 1) (hℓ : Valued.v ℓ ≤ 1) :
    W.addY x₁ x₂ y₁ ℓ = ((W₀.toAffine).addY (⟨x₁, h₁⟩ : v.adicCompletionIntegers K) ⟨x₂, h₂⟩
      ⟨y₁, hy₁⟩ ⟨ℓ, hℓ⟩ : v.adicCompletion K) := by
  conv_lhs => rw [← hW]
  exact (W₀.toAffine).map_addY (algebraMap (v.adicCompletionIntegers K) (v.adicCompletion K))
    ⟨x₁, h₁⟩ ⟨y₁, hy₁⟩ ⟨x₂, h₂⟩ ⟨ℓ, hℓ⟩
include hW in
 
lemma redCoord_addX {x₁ x₂ ℓ : v.adicCompletion K} (h₁ : Valued.v x₁ ≤ 1)
    (h₂ : Valued.v x₂ ≤ 1) (hℓ : Valued.v ℓ ≤ 1) (hs : Valued.v (W.addX x₁ x₂ ℓ) ≤ 1) :
    IsLocalRing.residue _ ⟨W.addX x₁ x₂ ℓ, hs⟩ = (adicRedCurve W₀).addX
      (IsLocalRing.residue _ ⟨x₁, h₁⟩) (IsLocalRing.residue _ ⟨x₂, h₂⟩)
      (IsLocalRing.residue _ ⟨ℓ, hℓ⟩) := by
  have hsub : (⟨W.addX x₁ x₂ ℓ, hs⟩ : v.adicCompletionIntegers K)
      = (W₀.toAffine).addX ⟨x₁, h₁⟩ ⟨x₂, h₂⟩ ⟨ℓ, hℓ⟩ := Subtype.ext (coe_addX hW h₁ h₂ hℓ)
  rw [hsub]
  exact ((W₀.toAffine).map_addX (IsLocalRing.residue (v.adicCompletionIntegers K))
    ⟨x₁, h₁⟩ ⟨x₂, h₂⟩ ⟨ℓ, hℓ⟩).symm
include hW in
 
lemma redCoord_addY {x₁ x₂ y₁ ℓ : v.adicCompletion K} (h₁ : Valued.v x₁ ≤ 1)
    (h₂ : Valued.v x₂ ≤ 1) (hy₁ : Valued.v y₁ ≤ 1) (hℓ : Valued.v ℓ ≤ 1)
    (hs : Valued.v (W.addY x₁ x₂ y₁ ℓ) ≤ 1) :
    IsLocalRing.residue _ ⟨W.addY x₁ x₂ y₁ ℓ, hs⟩ = (adicRedCurve W₀).addY
      (IsLocalRing.residue _ ⟨x₁, h₁⟩) (IsLocalRing.residue _ ⟨x₂, h₂⟩)
      (IsLocalRing.residue _ ⟨y₁, hy₁⟩) (IsLocalRing.residue _ ⟨ℓ, hℓ⟩) := by
  have hsub : (⟨W.addY x₁ x₂ y₁ ℓ, hs⟩ : v.adicCompletionIntegers K)
      = (W₀.toAffine).addY ⟨x₁, h₁⟩ ⟨x₂, h₂⟩ ⟨y₁, hy₁⟩ ⟨ℓ, hℓ⟩ :=
    Subtype.ext (coe_addY hW h₁ h₂ hy₁ hℓ)
  rw [hsub]
  exact ((W₀.toAffine).map_addY (IsLocalRing.residue (v.adicCompletionIntegers K))
    ⟨x₁, h₁⟩ ⟨y₁, hy₁⟩ ⟨x₂, h₂⟩ ⟨ℓ, hℓ⟩).symm
include hW in
lemma res_a₁ : IsLocalRing.residue _ ⟨W.a₁, valued_a₁ hW⟩ = (adicRedCurve W₀).a₁ := by
  rw [show (⟨W.a₁, valued_a₁ hW⟩ : v.adicCompletionIntegers K) = W₀.a₁ from
    Subtype.ext (coe_a₁ hW).symm]
  exact (W₀.map_a₁ (IsLocalRing.residue (v.adicCompletionIntegers K))).symm
include hW in
lemma res_a₂ : IsLocalRing.residue _ ⟨W.a₂, valued_a₂ hW⟩ = (adicRedCurve W₀).a₂ := by
  rw [show (⟨W.a₂, valued_a₂ hW⟩ : v.adicCompletionIntegers K) = W₀.a₂ from
    Subtype.ext (coe_a₂ hW).symm]
  exact (W₀.map_a₂ (IsLocalRing.residue (v.adicCompletionIntegers K))).symm
include hW in
lemma res_a₄ : IsLocalRing.residue _ ⟨W.a₄, valued_a₄ hW⟩ = (adicRedCurve W₀).a₄ := by
  rw [show (⟨W.a₄, valued_a₄ hW⟩ : v.adicCompletionIntegers K) = W₀.a₄ from
    Subtype.ext (coe_a₄ hW).symm]
  exact (W₀.map_a₄ (IsLocalRing.residue (v.adicCompletionIntegers K))).symm
lemma res_congr {a b : v.adicCompletion K} (ha : Valued.v a ≤ 1) (h : a = b) :
    (IsLocalRing.residue (v.adicCompletionIntegers K)) (⟨a, ha⟩ : v.adicCompletionIntegers K) = (IsLocalRing.residue (v.adicCompletionIntegers K)) ⟨b, (h ▸ ha : Valued.v b ≤ 1)⟩ :=
  congrArg _ (Subtype.ext h)
 
lemma res_sub {a b : v.adicCompletion K} (ha : Valued.v a ≤ 1) (hb : Valued.v b ≤ 1)
    (hab : Valued.v (a - b) ≤ 1) :
    (IsLocalRing.residue (v.adicCompletionIntegers K)) (⟨a - b, hab⟩ : v.adicCompletionIntegers K) = (IsLocalRing.residue (v.adicCompletionIntegers K)) ⟨a, ha⟩ - (IsLocalRing.residue (v.adicCompletionIntegers K)) ⟨b, hb⟩ := by
  rw [show (⟨a - b, hab⟩ : v.adicCompletionIntegers K) = ⟨a, ha⟩ - ⟨b, hb⟩ from
    Subtype.ext (by push_cast; ring), map_sub]
 
lemma residue_div' {p q : v.adicCompletion K} (hp : Valued.v p ≤ 1) (hq : Valued.v q ≤ 1)
    (hqu : (IsLocalRing.residue (v.adicCompletionIntegers K)) (⟨q, hq⟩ : v.adicCompletionIntegers K) ≠ 0) (hpq : Valued.v (p / q) ≤ 1) :
    (IsLocalRing.residue (v.adicCompletionIntegers K)) (⟨p / q, hpq⟩ : v.adicCompletionIntegers K) = (IsLocalRing.residue (v.adicCompletionIntegers K)) ⟨p, hp⟩ / (IsLocalRing.residue (v.adicCompletionIntegers K)) ⟨q, hq⟩ := by
  have hq0 : (q : v.adicCompletion K) ≠ 0 := fun h ↦ hqu <| by
    rw [show (⟨q, hq⟩ : v.adicCompletionIntegers K) = 0 from Subtype.ext (by push_cast; exact h),
      map_zero]
  rw [eq_div_iff hqu, ← map_mul]
  congr 1
  apply Subtype.ext
  push_cast
  field_simp
include hW in
 
lemma res_ficoNum {x₁ x₂ y₁ : v.adicCompletion K} (h₁ : Valued.v x₁ ≤ 1)
    (h₂ : Valued.v x₂ ≤ 1) (hy₁ : Valued.v y₁ ≤ 1)
    (hN : Valued.v (x₁ ^ 2 + x₁ * x₂ + x₂ ^ 2 + W.a₂ * (x₁ + x₂) + W.a₄ - W.a₁ * y₁) ≤ 1) :
    (IsLocalRing.residue (v.adicCompletionIntegers K)) (⟨x₁ ^ 2 + x₁ * x₂ + x₂ ^ 2 + W.a₂ * (x₁ + x₂) + W.a₄ - W.a₁ * y₁, hN⟩ :
        v.adicCompletionIntegers K)
      = (IsLocalRing.residue (v.adicCompletionIntegers K)) ⟨x₁, h₁⟩ ^ 2 + (IsLocalRing.residue (v.adicCompletionIntegers K)) ⟨x₁, h₁⟩ * (IsLocalRing.residue (v.adicCompletionIntegers K)) ⟨x₂, h₂⟩ + (IsLocalRing.residue (v.adicCompletionIntegers K)) ⟨x₂, h₂⟩ ^ 2
        + (adicRedCurve W₀).a₂ * ((IsLocalRing.residue (v.adicCompletionIntegers K)) ⟨x₁, h₁⟩ + (IsLocalRing.residue (v.adicCompletionIntegers K)) ⟨x₂, h₂⟩) + (adicRedCurve W₀).a₄
        - (adicRedCurve W₀).a₁ * (IsLocalRing.residue (v.adicCompletionIntegers K)) ⟨y₁, hy₁⟩ := by
  rw [← res_a₁ hW, ← res_a₂ hW, ← res_a₄ hW,
    show (⟨x₁ ^ 2 + x₁ * x₂ + x₂ ^ 2 + W.a₂ * (x₁ + x₂) + W.a₄ - W.a₁ * y₁, hN⟩ :
        v.adicCompletionIntegers K)
      = ⟨x₁, h₁⟩ ^ 2 + ⟨x₁, h₁⟩ * ⟨x₂, h₂⟩ + ⟨x₂, h₂⟩ ^ 2
        + ⟨W.a₂, valued_a₂ hW⟩ * (⟨x₁, h₁⟩ + ⟨x₂, h₂⟩) + ⟨W.a₄, valued_a₄ hW⟩
        - ⟨W.a₁, valued_a₁ hW⟩ * ⟨y₁, hy₁⟩ from Subtype.ext (by push_cast; ring)]
  simp only [map_add, map_sub, map_mul, map_pow]
 
lemma valued_sub_le {a b : v.adicCompletion K} (ha : Valued.v a ≤ 1)
    (hb : Valued.v b ≤ 1) : Valued.v (a - b) ≤ 1 :=
  (Valued.v.map_sub _ _).trans (max_le ha hb)
lemma not_exp_two_le_of_le_one {a : v.adicCompletion K} (ha : Valued.v a ≤ 1) :
    ¬ exp (2 : ℤ) ≤ Valued.v a := fun hc ↦
  absurd (hc.trans ha) (by rw [not_le, ← exp_zero]; exact exp_lt_exp.mpr (by lia))
include hW in
 
lemma valued_ficoNum_le {x₁ x₂ y₁ : v.adicCompletion K} (h₁ : Valued.v x₁ ≤ 1)
    (h₂ : Valued.v x₂ ≤ 1) (hy₁ : Valued.v y₁ ≤ 1) :
    Valued.v (x₁ ^ 2 + x₁ * x₂ + x₂ ^ 2 + W.a₂ * (x₁ + x₂) + W.a₄ - W.a₁ * y₁) ≤ 1 := by
  rw [show x₁ ^ 2 + x₁ * x₂ + x₂ ^ 2 + W.a₂ * (x₁ + x₂) + W.a₄ - W.a₁ * y₁
      = ((⟨x₁, h₁⟩ ^ 2 + ⟨x₁, h₁⟩ * ⟨x₂, h₂⟩ + ⟨x₂, h₂⟩ ^ 2
          + ⟨W.a₂, valued_a₂ hW⟩ * (⟨x₁, h₁⟩ + ⟨x₂, h₂⟩) + ⟨W.a₄, valued_a₄ hW⟩
          - ⟨W.a₁, valued_a₁ hW⟩ * ⟨y₁, hy₁⟩ : v.adicCompletionIntegers K) :
        v.adicCompletion K) from by push_cast; ring]
  exact valued_coe_le_one _

lemma nonsingular_deriv_disj {F : Type*} [Field F] {E' : Affine F} {a b : F}
    (h : E'.Nonsingular a b) :
    E'.a₁ * b - (3 * a ^ 2 + 2 * E'.a₂ * a + E'.a₄) ≠ 0 ∨ b - E'.negY a b ≠ 0 := by
  rcases ((E'.nonsingular_iff' a b).mp h).2 with h1 | h2
  · exact Or.inl h1
  · refine Or.inr fun hc ↦ h2 ?_
    rw [Affine.negY] at hc
    linear_combination hc
 
lemma valued_eq_one_of_residue_ne {a : v.adicCompletion K} (ha : Valued.v a ≤ 1)
    (h : (IsLocalRing.residue (v.adicCompletionIntegers K)) (⟨a, ha⟩ : v.adicCompletionIntegers K) ≠ 0) : Valued.v a = 1 :=
  valued_coe_isUnit (a := (⟨a, ha⟩ : v.adicCompletionIntegers K))
    ((residue_ne_zero_iff_isUnit (⟨a, ha⟩ : v.adicCompletionIntegers K)).mp h)
 
lemma ne_zero_of_residue_ne {a : v.adicCompletion K} (ha : Valued.v a ≤ 1)
    (h : (IsLocalRing.residue (v.adicCompletionIntegers K)) (⟨a, ha⟩ : v.adicCompletionIntegers K) ≠ 0) : a ≠ 0 := by
  rintro rfl; exact h (map_zero _)
include hW in
lemma residue_sub_negY_ne_zero {x₂ y₁ y₂ : v.adicCompletion K} (hx₂ : Valued.v x₂ ≤ 1)
    (hy₁ : Valued.v y₁ ≤ 1) (hy₂ : Valued.v y₂ ≤ 1)
    (hYne : (IsLocalRing.residue (v.adicCompletionIntegers K)) (⟨y₁, hy₁⟩ : v.adicCompletionIntegers K)
      ≠ (adicRedCurve W₀).negY ((IsLocalRing.residue (v.adicCompletionIntegers K)) ⟨x₂, hx₂⟩) ((IsLocalRing.residue (v.adicCompletionIntegers K)) ⟨y₂, hy₂⟩)) :
    (IsLocalRing.residue (v.adicCompletionIntegers K)) (⟨y₁ - W.negY x₂ y₂, valued_sub_le hy₁ (valued_negY_le hW hx₂ hy₂)⟩ :
      v.adicCompletionIntegers K) ≠ 0 := by
  rw [res_sub hy₁ (valued_negY_le hW hx₂ hy₂) _, redCoord_negY hW hx₂ hy₂ _]
  exact sub_ne_zero.mpr hYne
include hW in
lemma not_eq_and_eq_negY {x₁ x₂ y₁ y₂ : v.adicCompletion K} (hx₁ : Valued.v x₁ ≤ 1)
    (hx₂ : Valued.v x₂ ≤ 1) (hy₁ : Valued.v y₁ ≤ 1) (hy₂ : Valued.v y₂ ≤ 1)
    (hne : ¬ ((IsLocalRing.residue (v.adicCompletionIntegers K)) (⟨x₁, hx₁⟩ : v.adicCompletionIntegers K) = (IsLocalRing.residue (v.adicCompletionIntegers K)) ⟨x₂, hx₂⟩ ∧
      (IsLocalRing.residue (v.adicCompletionIntegers K)) ⟨y₁, hy₁⟩ = (adicRedCurve W₀).negY ((IsLocalRing.residue (v.adicCompletionIntegers K)) ⟨x₂, hx₂⟩) ((IsLocalRing.residue (v.adicCompletionIntegers K)) ⟨y₂, hy₂⟩))) :
    ¬ (x₁ = x₂ ∧ y₁ = W.negY x₂ y₂) := by
  intro ⟨ex, ey⟩
  refine hne ⟨congrArg (IsLocalRing.residue _) (Subtype.ext ex), ?_⟩
  rw [show (⟨y₁, hy₁⟩ : v.adicCompletionIntegers K)
      = ⟨W.negY x₂ y₂, valued_negY_le hW hx₂ hy₂⟩ from Subtype.ext ey,
    redCoord_negY hW hx₂ hy₂ _]
section
variable [DecidableEq (v.adicCompletion K)]

lemma slope_eq_div {x₁ x₂ y₁ y₂ : v.adicCompletion K} (hc₁ : W.Equation x₁ y₁)
    (hc₂ : W.Equation x₂ y₂) (hD0 : y₁ - W.negY x₂ y₂ ≠ 0) :
    W.slope x₁ x₂ y₁ y₂
      = (x₁ ^ 2 + x₁ * x₂ + x₂ ^ 2 + W.a₂ * (x₁ + x₂) + W.a₄ - W.a₁ * y₁)
        / (y₁ - W.negY x₂ y₂) := by
  by_cases hxx : x₁ = x₂
  · have hyne : y₁ ≠ W.negY x₂ y₂ := sub_ne_zero.mp hD0
    rw [W.slope_of_Y_ne hxx hyne, ← hxx,
      ← (W.Y_eq_of_X_eq hc₁ hc₂ hxx).resolve_right hyne]
    ring
  · rw [W.slope_of_X_ne hxx, div_eq_div_iff (sub_ne_zero.mpr hxx) hD0, Affine.negY]
    linear_combination (W.equation_iff x₁ y₁).mp hc₁ - (W.equation_iff x₂ y₂).mp hc₂
variable [DecidableEq (IsLocalRing.ResidueField (v.adicCompletionIntegers K))]
include hW in

lemma red_slope {x₁ x₂ y₁ y₂ : v.adicCompletion K} (hx₁ : Valued.v x₁ ≤ 1)
    (hx₂ : Valued.v x₂ ≤ 1) (hy₁ : Valued.v y₁ ≤ 1) (hy₂ : Valued.v y₂ ≤ 1)
    (hc₁ : W.Equation x₁ y₁) (hc₂ : W.Equation x₂ y₂) (hℓ : Valued.v (W.slope x₁ x₂ y₁ y₂) ≤ 1)
    (hne : ¬ ((IsLocalRing.residue (v.adicCompletionIntegers K)) (⟨x₁, hx₁⟩ : v.adicCompletionIntegers K) = (IsLocalRing.residue (v.adicCompletionIntegers K)) ⟨x₂, hx₂⟩ ∧
      (IsLocalRing.residue (v.adicCompletionIntegers K)) ⟨y₁, hy₁⟩ = (adicRedCurve W₀).negY ((IsLocalRing.residue (v.adicCompletionIntegers K)) ⟨x₂, hx₂⟩) ((IsLocalRing.residue (v.adicCompletionIntegers K)) ⟨y₂, hy₂⟩))) :
    (IsLocalRing.residue (v.adicCompletionIntegers K)) (⟨W.slope x₁ x₂ y₁ y₂, hℓ⟩ : v.adicCompletionIntegers K) = (adicRedCurve W₀).slope
      ((IsLocalRing.residue (v.adicCompletionIntegers K)) ⟨x₁, hx₁⟩) ((IsLocalRing.residue (v.adicCompletionIntegers K)) ⟨x₂, hx₂⟩) ((IsLocalRing.residue (v.adicCompletionIntegers K)) ⟨y₁, hy₁⟩) ((IsLocalRing.residue (v.adicCompletionIntegers K)) ⟨y₂, hy₂⟩) := by
  by_cases hXeq : (IsLocalRing.residue (v.adicCompletionIntegers K)) (⟨x₁, hx₁⟩ : v.adicCompletionIntegers K) = (IsLocalRing.residue (v.adicCompletionIntegers K)) ⟨x₂, hx₂⟩
  · 
    have hYne : (IsLocalRing.residue (v.adicCompletionIntegers K)) (⟨y₁, hy₁⟩ : v.adicCompletionIntegers K)
        ≠ (adicRedCurve W₀).negY ((IsLocalRing.residue (v.adicCompletionIntegers K)) ⟨x₂, hx₂⟩) ((IsLocalRing.residue (v.adicCompletionIntegers K)) ⟨y₂, hy₂⟩) := fun h ↦ hne ⟨hXeq, h⟩
    have hDu := residue_sub_negY_ne_zero hW hx₂ hy₁ hy₂ hYne
    have hD0 : y₁ - W.negY x₂ y₂ ≠ 0 := ne_zero_of_residue_ne _ hDu
    have hYeq : (IsLocalRing.residue (v.adicCompletionIntegers K)) (⟨y₁, hy₁⟩ : v.adicCompletionIntegers K) = (IsLocalRing.residue (v.adicCompletionIntegers K)) ⟨y₂, hy₂⟩ :=
      ((adicRedCurve W₀).Y_eq_of_X_eq (Equation.map _ (equation_integral hW hc₁ hx₁ hy₁))
        (Equation.map _ (equation_integral hW hc₂ hx₂ hy₂)) hXeq).resolve_right hYne
    rw [res_congr hℓ (W.slope_eq_div hc₁ hc₂ hD0),
      residue_div' (valued_ficoNum_le hW hx₁ hx₂ hy₁) _ hDu, res_ficoNum hW hx₁ hx₂ hy₁,
      res_sub hy₁ (valued_negY_le hW hx₂ hy₂) _, redCoord_negY hW hx₂ hy₂ _,
      (adicRedCurve W₀).slope_of_Y_ne hXeq hYne, ← hXeq, ← hYeq]
    ring
  · 
    have hxx : x₁ ≠ x₂ := fun h ↦ hXeq (congrArg (IsLocalRing.residue _) (Subtype.ext h))
    have hden : Valued.v (x₁ - x₂) ≤ 1 := valued_sub_le hx₁ hx₂
    have hnum : Valued.v (y₁ - y₂) ≤ 1 := valued_sub_le hy₁ hy₂
    have hdenu : (IsLocalRing.residue (v.adicCompletionIntegers K)) (⟨x₁ - x₂, hden⟩ : v.adicCompletionIntegers K) ≠ 0 := by
      rw [res_sub hx₁ hx₂ hden]; exact sub_ne_zero.mpr hXeq
    rw [res_congr hℓ (W.slope_of_X_ne hxx),
      residue_div' hnum hden hdenu, res_sub hx₁ hx₂ hden, res_sub hy₁ hy₂ hnum,
      (adicRedCurve W₀).slope_of_X_ne hXeq]
include hW in
 
lemma valued_slope_le {x₁ x₂ y₁ y₂ : v.adicCompletion K} (hx₁ : Valued.v x₁ ≤ 1)
    (hx₂ : Valued.v x₂ ≤ 1) (hy₁ : Valued.v y₁ ≤ 1) (hy₂ : Valued.v y₂ ≤ 1)
    (hc₁ : W.Equation x₁ y₁) (hc₂ : W.Equation x₂ y₂)
    (hne : ¬ ((IsLocalRing.residue (v.adicCompletionIntegers K)) (⟨x₁, hx₁⟩ : v.adicCompletionIntegers K) = (IsLocalRing.residue (v.adicCompletionIntegers K)) ⟨x₂, hx₂⟩ ∧
      (IsLocalRing.residue (v.adicCompletionIntegers K)) ⟨y₁, hy₁⟩ = (adicRedCurve W₀).negY ((IsLocalRing.residue (v.adicCompletionIntegers K)) ⟨x₂, hx₂⟩) ((IsLocalRing.residue (v.adicCompletionIntegers K)) ⟨y₂, hy₂⟩))) :
    Valued.v (W.slope x₁ x₂ y₁ y₂) ≤ 1 := by
  by_cases hXeq : (IsLocalRing.residue (v.adicCompletionIntegers K)) (⟨x₁, hx₁⟩ : v.adicCompletionIntegers K) = (IsLocalRing.residue (v.adicCompletionIntegers K)) ⟨x₂, hx₂⟩
  · have hDu := residue_sub_negY_ne_zero hW hx₂ hy₁ hy₂ (fun h ↦ hne ⟨hXeq, h⟩)
    rw [slope_eq_div hc₁ hc₂ (ne_zero_of_residue_ne _ hDu), map_div₀,
      valued_coe_isUnit ((residue_ne_zero_iff_isUnit _).mp hDu), div_one]
    exact valued_ficoNum_le hW hx₁ hx₂ hy₁
  · have hxx : x₁ ≠ x₂ := fun h ↦ hXeq (congrArg (IsLocalRing.residue _) (Subtype.ext h))
    have hdenu : (IsLocalRing.residue (v.adicCompletionIntegers K)) (⟨x₁ - x₂, valued_sub_le hx₁ hx₂⟩ : v.adicCompletionIntegers K) ≠ 0 := by
      rw [res_sub hx₁ hx₂ _]; exact sub_ne_zero.mpr hXeq
    rw [W.slope_of_X_ne hxx, map_div₀,
      valued_coe_isUnit ((residue_ne_zero_iff_isUnit _).mp hdenu), div_one]
    exact valued_sub_le hy₁ hy₂
end
section
variable [W.IsElliptic] [DecidableEq (v.adicCompletion K)] [CharZero K]
include hW in

lemma add_self_mem_filtration_of_slope {x₀ y₀ : v.adicCompletion K}
    (h₀ : W.Nonsingular x₀ y₀) (hx₀ : Valued.v x₀ ≤ 1) (hψ : y₀ ≠ W.negY x₀ y₀)
    (hs : exp (1 : ℤ) ≤ Valued.v (W.slope x₀ x₀ y₀ y₀)) :
    (.some x₀ y₀ h₀ : W.Point) + .some x₀ y₀ h₀ ∈ filtration hW 0 := by
  have ha₁ : Valued.v W.a₁ ≤ 1 := valued_a₁ hW
  have ha₂ : Valued.v W.a₂ ≤ 1 := valued_a₂ hW
  rw [Point.add_some (fun hc ↦ hψ hc.2), some_mem_filtration, Affine.addX]
  set L : v.adicCompletion K := W.slope x₀ x₀ y₀ y₀ with hL
  have hL1 : (1 : ℤᵐ⁰) < Valued.v L := lt_of_lt_of_le (by rw [← exp_zero, exp_lt_exp]; lia) hs
  have hbig : ∀ c : ℤᵐ⁰, c ≤ 1 → c < Valued.v L ^ 2 := fun c hc ↦
    lt_of_le_of_lt hc (by
      calc (1 : ℤᵐ⁰) < Valued.v L := hL1
        _ = Valued.v L ^ 1 := (pow_one _).symm
        _ < Valued.v L ^ 2 := pow_lt_pow_right₀ hL1 (by lia))
  have hrest : Valued.v (W.a₁ * L - W.a₂ - x₀ - x₀) < Valued.v L ^ 2 := by
    refine lt_of_le_of_lt (Valuation.map_sub _ _ _) (max_lt (lt_of_le_of_lt
      (Valuation.map_sub _ _ _) (max_lt (lt_of_le_of_lt (Valuation.map_sub _ _ _)
        (max_lt ?_ (hbig _ ha₂))) (hbig _ hx₀))) (hbig _ hx₀))
    rw [map_mul]
    calc Valued.v W.a₁ * Valued.v L ≤ 1 * Valued.v L := mul_le_mul' ha₁ le_rfl
      _ = Valued.v L ^ 1 := by rw [one_mul, pow_one]
      _ < Valued.v L ^ 2 := pow_lt_pow_right₀ hL1 (by lia)
  rw [show L ^ 2 + W.a₁ * L - W.a₂ - x₀ - x₀ = L ^ 2 + (W.a₁ * L - W.a₂ - x₀ - x₀) by ring,
    Valuation.map_add_eq_of_lt_left _ (by rw [map_pow]; exact hrest), map_pow]
  refine le_trans (le_of_eq ?_) (pow_le_pow_left' hs 2)
  rw [← exp_nsmul, nsmul_eq_mul]
  norm_num
include hW in

lemma sub_mem_filtration_of_eq {x y x₀ y₀ : v.adicCompletion K} (h : W.Nonsingular x y)
    (h₀ : W.Nonsingular x₀ y₀) (hx : x = x₀) (hy : y = y₀) :
    (.some x y h : W.Point) - .some x₀ y₀ h₀ ∈ filtration hW 0 := by
  rw [show (.some x y h : W.Point) = .some x₀ y₀ h₀ by subst hx hy; rfl, sub_self]
  exact zero_mem _
end
variable [W₀.IsElliptic]
include hW in
 
lemma adicRed_nonsingular {x y : v.adicCompletion K} (h : W.Equation x y)
    (hx : Valued.v x ≤ 1) (hy : Valued.v y ≤ 1) :
    (adicRedCurve W₀).Nonsingular (IsLocalRing.residue _ ⟨x, hx⟩)
      (IsLocalRing.residue _ ⟨y, hy⟩) := by
  rw [← equation_iff_nonsingular]
  exact Equation.map (IsLocalRing.residue (v.adicCompletionIntegers K))
    (equation_integral hW h hx hy)
include hW in

noncomputable def adicRed : W.Point → (adicRedCurve W₀).Point
  | .zero => 0
  | .some x y h =>
      if hx : exp (2 : ℤ) ≤ Valued.v x then 0
      else
        .some (IsLocalRing.residue _ ⟨x, (integral_of_not_mem hW h.left hx).1⟩)
              (IsLocalRing.residue _ ⟨y, (integral_of_not_mem hW h.left hx).2⟩)
              (adicRed_nonsingular hW h.left (integral_of_not_mem hW h.left hx).1
                (integral_of_not_mem hW h.left hx).2)
include hW in
 
lemma adicRed_some_of_mem {x y : v.adicCompletion K} {h : W.Nonsingular x y}
    (hx : exp (2 : ℤ) ≤ Valued.v x) : adicRed hW (.some x y h) = 0 :=
  dif_pos hx
include hW in
 
lemma adicRed_some_of_not_mem {x y : v.adicCompletion K} {h : W.Nonsingular x y}
    (hx : ¬ exp (2 : ℤ) ≤ Valued.v x) :
    adicRed hW (.some x y h)
      = .some (IsLocalRing.residue _ ⟨x, (integral_of_not_mem hW h.left hx).1⟩)
          (IsLocalRing.residue _ ⟨y, (integral_of_not_mem hW h.left hx).2⟩)
          (adicRed_nonsingular hW h.left (integral_of_not_mem hW h.left hx).1
            (integral_of_not_mem hW h.left hx).2) :=
  dif_neg hx
include hW in
 
lemma adicRed_neg (P : W.Point) : adicRed hW (-P) = - adicRed hW P := by
  match P with
  | .zero => rfl
  | .some x y h =>
      by_cases hx : exp (2 : ℤ) ≤ Valued.v x
      · rw [Point.neg_some, adicRed_some_of_mem hW hx, adicRed_some_of_mem hW hx]; simp
      · rw [Point.neg_some, adicRed_some_of_not_mem hW hx, adicRed_some_of_not_mem hW hx,
          Point.neg_some, Point.some.injEq]
        exact ⟨rfl, redCoord_negY hW _ _ _⟩
include hW in

lemma unit_deriv {x₀ y₀ : v.adicCompletion K} (h₀ : W.Nonsingular x₀ y₀)
    (hx₀ : Valued.v x₀ ≤ 1) (hy₀ : Valued.v y₀ ≤ 1) :
    Valued.v (y₀ - W.negY x₀ y₀) = 1 ∨
      Valued.v (W.a₁ * y₀ - (3 * x₀ ^ 2 + 2 * W.a₂ * x₀ + W.a₄)) = 1 := by
  have hnegYint : Valued.v (W.negY x₀ y₀) ≤ 1 := valued_negY_le hW hx₀ hy₀
  have hψint : Valued.v (y₀ - W.negY x₀ y₀) ≤ 1 := valued_sub_le hy₀ hnegYint
  
  set φ₀ : v.adicCompletionIntegers K :=
    ⟨W.a₁, valued_a₁ hW⟩ * ⟨y₀, hy₀⟩ - (⟨x₀, hx₀⟩ ^ 2 + ⟨x₀, hx₀⟩ ^ 2 + ⟨x₀, hx₀⟩ ^ 2
      + (⟨W.a₂, valued_a₂ hW⟩ * ⟨x₀, hx₀⟩ + ⟨W.a₂, valued_a₂ hW⟩ * ⟨x₀, hx₀⟩)
      + ⟨W.a₄, valued_a₄ hW⟩) with hφ₀
  have hφint : Valued.v (W.a₁ * y₀ - (3 * x₀ ^ 2 + 2 * W.a₂ * x₀ + W.a₄)) ≤ 1 := by
    rw [show W.a₁ * y₀ - (3 * x₀ ^ 2 + 2 * W.a₂ * x₀ + W.a₄) = (φ₀ : v.adicCompletion K)
      from by rw [hφ₀]; push_cast; ring]
    exact valued_coe_le_one _
  have hresψ : (IsLocalRing.residue (v.adicCompletionIntegers K)) (⟨y₀ - W.negY x₀ y₀, hψint⟩ : v.adicCompletionIntegers K)
      = (IsLocalRing.residue (v.adicCompletionIntegers K)) ⟨y₀, hy₀⟩ - (adicRedCurve W₀).negY ((IsLocalRing.residue (v.adicCompletionIntegers K)) ⟨x₀, hx₀⟩) ((IsLocalRing.residue (v.adicCompletionIntegers K)) ⟨y₀, hy₀⟩) := by
    rw [res_sub hy₀ hnegYint hψint, redCoord_negY hW hx₀ hy₀ hnegYint]
  have hresφ : (IsLocalRing.residue (v.adicCompletionIntegers K)) (⟨W.a₁ * y₀ - (3 * x₀ ^ 2 + 2 * W.a₂ * x₀ + W.a₄), hφint⟩ :
        v.adicCompletionIntegers K)
      = (adicRedCurve W₀).a₁ * (IsLocalRing.residue (v.adicCompletionIntegers K)) ⟨y₀, hy₀⟩
        - (3 * (IsLocalRing.residue (v.adicCompletionIntegers K)) ⟨x₀, hx₀⟩ ^ 2 + 2 * (adicRedCurve W₀).a₂ * (IsLocalRing.residue (v.adicCompletionIntegers K)) ⟨x₀, hx₀⟩
          + (adicRedCurve W₀).a₄) := by
    rw [← res_a₁ hW, ← res_a₂ hW, ← res_a₄ hW,
      show (⟨W.a₁ * y₀ - (3 * x₀ ^ 2 + 2 * W.a₂ * x₀ + W.a₄), hφint⟩ : v.adicCompletionIntegers K)
        = φ₀ from Subtype.ext (by rw [hφ₀]; push_cast; ring), hφ₀]
    simp only [map_sub, map_add, map_mul, map_pow]
    ring
  rcases nonsingular_deriv_disj (adicRed_nonsingular hW h₀.left hx₀ hy₀) with hφ | hψ
  · exact Or.inr (valued_eq_one_of_residue_ne hφint (fun h ↦ hφ (hresφ.symm.trans h)))
  · exact Or.inl (valued_eq_one_of_residue_ne hψint (fun h ↦ hψ (hresψ.symm.trans h)))
variable [W.IsElliptic] [DecidableEq (v.adicCompletion K)] [CharZero K]
include hW in
 
lemma adicRed_eq_zero_iff {P : W.Point} : adicRed hW P = 0 ↔ P ∈ filtration hW 0 := by
  match P with
  | .zero => exact iff_of_true rfl zero_mem_filtration
  | .some x y h =>
      rw [some_mem_filtration]
      by_cases hx : exp (2 : ℤ) ≤ Valued.v x
      · exact iff_of_true (adicRed_some_of_mem hW hx) (le_trans (exp_le_exp.mpr (by lia)) hx)
      · refine iff_of_false ?_ (fun hc ↦ hx (le_trans (exp_le_exp.mpr (by lia)) hc))
        rw [adicRed_some_of_not_mem hW hx]; exact Point.some_ne_zero _
include hW in
lemma add_self_mem_filtration_of_sub_negY_small {x₀ y₀ : v.adicCompletion K}
    (h₀ : W.Nonsingular x₀ y₀) (hx₀ : Valued.v x₀ ≤ 1) (hy₀ : Valued.v y₀ ≤ 1)
    (hψsmall : Valued.v (y₀ - W.negY x₀ y₀) ≤ exp (-1 : ℤ)) (hψ0 : y₀ - W.negY x₀ y₀ ≠ 0) :
    (.some x₀ y₀ h₀ : W.Point) + .some x₀ y₀ h₀ ∈ filtration hW 0 := by
  have hφ1 : Valued.v (W.a₁ * y₀ - (3 * x₀ ^ 2 + 2 * W.a₂ * x₀ + W.a₄)) = 1 := by
    rcases unit_deriv hW h₀ hx₀ hy₀ with hψ1 | hφ1
    · exact absurd hψsmall (by rw [hψ1, ← exp_zero, exp_le_exp]; lia)
    · exact hφ1
  have hψne : y₀ ≠ W.negY x₀ y₀ := fun hc ↦ hψ0 (sub_eq_zero.mpr hc)
  refine add_self_mem_filtration_of_slope hW h₀ hx₀ hψne ?_
  rw [W.slope_of_Y_ne rfl hψne, map_div₀]
  obtain ⟨dψ, hdψ⟩ : ∃ dψ : ℤ, Valued.v (y₀ - W.negY x₀ y₀) = exp dψ :=
    ⟨_, (exp_log (by simpa using hψ0)).symm⟩
  have hnumφ : Valued.v (3 * x₀ ^ 2 + 2 * W.a₂ * x₀ + W.a₄ - W.a₁ * y₀) = 1 := by
    rw [show 3 * x₀ ^ 2 + 2 * W.a₂ * x₀ + W.a₄ - W.a₁ * y₀
        = -(W.a₁ * y₀ - (3 * x₀ ^ 2 + 2 * W.a₂ * x₀ + W.a₄)) by ring, Valuation.map_neg, hφ1]
  have hdψ' : dψ ≤ -1 := by rwa [hdψ, exp_le_exp] at hψsmall
  rw [hnumφ, hdψ, ← exp_zero, ← exp_sub, exp_le_exp]
  lia
include hW in
lemma sub_mem_filtration_of_close_of_X_ne {x₀ y₀ : v.adicCompletion K}
    (h₀ : W.Nonsingular x₀ y₀) (hx₀ : Valued.v x₀ ≤ 1) (hy₀ : Valued.v y₀ ≤ 1)
    {x y : v.adicCompletion K} (h : W.Nonsingular x y) (hxx : x ≠ x₀)
    (hx : Valued.v (x - x₀) ≤ exp (-1 : ℤ)) (hy : Valued.v (y - y₀) ≤ exp (-1 : ℤ)) :
    (.some x y h : W.Point) - .some x₀ y₀ h₀ ∈ filtration hW 0 := by
  refine sub_mem_filtration_of_slope h₀ h hxx hx₀ (valued_le_one_of_sub hx hx₀) ?_
  rcases unit_deriv hW h₀ hx₀ hy₀ with hψ1 | hφ1
  · 
    have hnum : Valued.v (y - W.negY x₀ y₀) = 1 := by
      rw [show y - W.negY x₀ y₀ = (y₀ - W.negY x₀ y₀) + (y - y₀) by ring,
        Valuation.map_add_eq_of_lt_left, hψ1]
      refine lt_of_le_of_lt hy ?_
      rw [hψ1, ← exp_zero, exp_lt_exp]; lia
    obtain ⟨dx, hdx⟩ : ∃ dx : ℤ, Valued.v (x - x₀) = exp dx :=
      ⟨_, (exp_log (by simpa using sub_ne_zero.mpr hxx)).symm⟩
    have hdx' : dx ≤ -1 := by rwa [hdx, exp_le_exp] at hx
    rw [map_div₀, hnum, hdx, ← exp_zero, ← exp_sub, exp_le_exp]
    lia
  · 
    have hid : (y - W.negY x₀ y₀) * (y - y₀) = (x - x₀) *
        (x ^ 2 + x * x₀ + x₀ ^ 2 + W.a₂ * (x + x₀) + W.a₄ - W.a₁ * y) := by
      rw [Affine.negY]
      linear_combination (W.equation_iff x y).mp h.left - (W.equation_iff x₀ y₀).mp h₀.left
    have hval := congrArg Valued.v hid
    rw [map_mul, map_mul, valued_num_of_two_torsion hW hx₀ (hφ1.trans exp_zero.symm)
      (by norm_num) hx hy] at hval
    exact exp_one_le_valued_slope hxx (by norm_num) hy hval
include hW in

lemma exists_level_one_sub_mem {x₀ y₀ : v.adicCompletion K} (h₀ : W.Nonsingular x₀ y₀)
    (hx₀ : Valued.v x₀ ≤ 1) (hy₀ : Valued.v y₀ ≤ 1) {x y : v.adicCompletion K}
    (h : W.Nonsingular x y) (hx : Valued.v (x - x₀) ≤ exp (-1 : ℤ))
    (hy : Valued.v (y - y₀) ≤ exp (-1 : ℤ)) :
    (.some x y h : W.Point) - .some x₀ y₀ h₀ ∈ filtration hW 0 := by
  rcases eq_or_ne x x₀ with heq | hxx
  · 
    subst x
    rcases W.Y_eq_of_X_eq h.left h₀.left rfl with hy' | hy'
    · exact sub_mem_filtration_of_eq hW h h₀ rfl hy'
    · have hψsmall : Valued.v (y₀ - W.negY x₀ y₀) ≤ exp (-1 : ℤ) := by
        rw [show y₀ - W.negY x₀ y₀ = -(y - y₀) by rw [hy']; ring, Valuation.map_neg]; exact hy
      rcases eq_or_ne (y₀ - W.negY x₀ y₀) 0 with hψ0 | hψ0
      · refine sub_mem_filtration_of_eq hW h h₀ rfl ?_
        rw [hy', ← sub_eq_zero, show W.negY x₀ y₀ - y₀ = -(y₀ - W.negY x₀ y₀) by ring,
          hψ0, neg_zero]
      · 
        have hP : (.some x₀ y h : W.Point) = -.some x₀ y₀ h₀ := by
          rw [Point.neg_some]; subst hy'; rfl
        rw [hP, show -(.some x₀ y₀ h₀ : W.Point) - .some x₀ y₀ h₀
            = -(.some x₀ y₀ h₀ + .some x₀ y₀ h₀) by abel]
        exact neg_mem (add_self_mem_filtration_of_sub_negY_small hW h₀ hx₀ hy₀ hψsmall hψ0)
  · exact sub_mem_filtration_of_close_of_X_ne hW h₀ hx₀ hy₀ h hxx hx hy
include hW in

lemma sub_mem_filtration_of_red_eq {P Q : W.Point} (hPQ : adicRed hW P = adicRed hW Q) :
    P - Q ∈ filtration hW 0 := by
  by_cases hQ0 : Q ∈ filtration hW 0
  · exact AddSubgroup.sub_mem _
      ((adicRed_eq_zero_iff hW).mp (hPQ.trans ((adicRed_eq_zero_iff hW).mpr hQ0))) hQ0
  · have hP0 : P ∉ filtration hW 0 := fun h ↦ hQ0
      ((adicRed_eq_zero_iff hW).mp (hPQ.symm.trans ((adicRed_eq_zero_iff hW).mpr h)))
    rcases P with _ | ⟨x, y, hxy⟩
    · exact absurd zero_mem_filtration hP0
    rcases Q with _ | ⟨x₀, y₀, h₀⟩
    · exact absurd zero_mem_filtration hQ0
    have hPm : ¬ exp (2 : ℤ) ≤ Valued.v x := fun hc ↦ hP0 (some_mem_filtration.mpr hc)
    have hQm : ¬ exp (2 : ℤ) ≤ Valued.v x₀ := fun hc ↦ hQ0 (some_mem_filtration.mpr hc)
    obtain ⟨hxi, hyi⟩ := integral_of_not_mem hW hxy.left hPm
    obtain ⟨hxi₀, hyi₀⟩ := integral_of_not_mem hW h₀.left hQm
    rw [adicRed_some_of_not_mem hW hPm, adicRed_some_of_not_mem hW hQm, Point.some.injEq] at hPQ
    refine exists_level_one_sub_mem hW h₀ hxi₀ hyi₀ hxy ?_ ?_
    · refine mem_maximalIdeal_iff (x := ⟨x - x₀, valued_sub_le hxi hxi₀⟩) |>.mp
        (residue_eq_zero_iff _ |>.mp ?_)
      rw [res_sub hxi hxi₀ (valued_sub_le hxi hxi₀), hPQ.1, sub_self]
    · refine mem_maximalIdeal_iff (x := ⟨y - y₀, valued_sub_le hyi hyi₀⟩) |>.mp
        (residue_eq_zero_iff _ |>.mp ?_)
      rw [res_sub hyi hyi₀ (valued_sub_le hyi hyi₀), hPQ.2, sub_self]
variable [DecidableEq (IsLocalRing.ResidueField (v.adicCompletionIntegers K))]
include hW in

lemma adicRed_add_of_reduced_ne_neg {x₁ x₂ y₁ y₂ : v.adicCompletion K}
    (h₁ : W.Nonsingular x₁ y₁) (h₂ : W.Nonsingular x₂ y₂)
    (hP : ¬ exp (2 : ℤ) ≤ Valued.v x₁) (hQ : ¬ exp (2 : ℤ) ≤ Valued.v x₂)
    (hne : adicRed hW (.some x₁ y₁ h₁) ≠ - adicRed hW (.some x₂ y₂ h₂)) :
    ((.some x₁ y₁ h₁ : W.Point) + .some x₂ y₂ h₂ ∉ filtration hW 0) ∧
      adicRed hW (.some x₁ y₁ h₁ + .some x₂ y₂ h₂)
        = adicRed hW (.some x₁ y₁ h₁) + adicRed hW (.some x₂ y₂ h₂) := by
  obtain ⟨hx₁, hy₁⟩ := integral_of_not_mem hW h₁.left hP
  obtain ⟨hx₂, hy₂⟩ := integral_of_not_mem hW h₂.left hQ
  have hne_res : ¬ ((IsLocalRing.residue (v.adicCompletionIntegers K)) (⟨x₁, hx₁⟩ : v.adicCompletionIntegers K) = (IsLocalRing.residue (v.adicCompletionIntegers K)) ⟨x₂, hx₂⟩ ∧
      (IsLocalRing.residue (v.adicCompletionIntegers K)) ⟨y₁, hy₁⟩ = (adicRedCurve W₀).negY ((IsLocalRing.residue (v.adicCompletionIntegers K)) ⟨x₂, hx₂⟩) ((IsLocalRing.residue (v.adicCompletionIntegers K)) ⟨y₂, hy₂⟩)) := fun ⟨e1, e2⟩ ↦
    hne (by rw [adicRed_some_of_not_mem hW hP, adicRed_some_of_not_mem hW hQ, Point.neg_some,
      Point.some.injEq]; exact ⟨e1, e2⟩)
  have hxy : ¬ (x₁ = x₂ ∧ y₁ = W.negY x₂ y₂) := not_eq_and_eq_negY hW hx₁ hx₂ hy₁ hy₂ hne_res
  have hℓ : Valued.v (W.slope x₁ x₂ y₁ y₂) ≤ 1 :=
    valued_slope_le hW hx₁ hx₂ hy₁ hy₂ h₁.left h₂.left hne_res
  have haXint : Valued.v (W.addX x₁ x₂ (W.slope x₁ x₂ y₁ y₂)) ≤ 1 := by
    rw [coe_addX hW hx₁ hx₂ hℓ]; exact valued_coe_le_one _
  have haYint : Valued.v (W.addY x₁ x₂ y₁ (W.slope x₁ x₂ y₁ y₂)) ≤ 1 := by
    rw [coe_addY hW hx₁ hx₂ hy₁ hℓ]; exact valued_coe_le_one _
  have hsum : (.some x₁ y₁ h₁ : W.Point) + .some x₂ y₂ h₂
      = .some (W.addX x₁ x₂ (W.slope x₁ x₂ y₁ y₂)) (W.addY x₁ x₂ y₁ (W.slope x₁ x₂ y₁ y₂))
        (nonsingular_add h₁ h₂ hxy) := Point.add_some hxy
  have hslope := red_slope hW hx₁ hx₂ hy₁ hy₂ h₁.left h₂.left hℓ hne_res
  have hgate := not_exp_two_le_of_le_one haXint
  refine ⟨by rw [hsum, some_mem_filtration]; exact hgate, ?_⟩
  rw [hsum, adicRed_some_of_not_mem hW hgate, adicRed_some_of_not_mem hW hP,
    adicRed_some_of_not_mem hW hQ, Point.add_some hne_res, Point.some.injEq]
  exact ⟨(redCoord_addX hW hx₁ hx₂ hℓ haXint).trans (by rw [hslope]),
    (redCoord_addY hW hx₁ hx₂ hy₁ hℓ haYint).trans (by rw [hslope])⟩
include hW in

lemma adicRed_add_of_not_mem {P Q : W.Point} (hP : P ∉ filtration hW 0)
    (hQ : Q ∉ filtration hW 0) : adicRed hW (P + Q) = adicRed hW P + adicRed hW Q := by
  rcases P with _ | ⟨x₁, y₁, h₁⟩
  · exact absurd zero_mem_filtration hP
  rcases Q with _ | ⟨x₂, y₂, h₂⟩
  · exact absurd zero_mem_filtration hQ
  have hPm : ¬ exp (2 : ℤ) ≤ Valued.v x₁ := fun hc ↦ hP (some_mem_filtration.mpr hc)
  have hQm : ¬ exp (2 : ℤ) ≤ Valued.v x₂ := fun hc ↦ hQ (some_mem_filtration.mpr hc)
  by_cases hop : adicRed hW (.some x₁ y₁ h₁) = - adicRed hW (.some x₂ y₂ h₂)
  · rw [hop, neg_add_cancel, adicRed_eq_zero_iff hW, ← sub_neg_eq_add]
    exact sub_mem_filtration_of_red_eq hW (hop.trans (adicRed_neg hW _).symm)
  · exact (adicRed_add_of_reduced_ne_neg hW h₁ h₂ hPm hQm hop).2
include hW in
 
lemma adicRed_add_of_mem_left {P : W.Point} (hP : P ∈ filtration hW 0) (Q : W.Point) :
    adicRed hW (P + Q) = adicRed hW Q := by
  by_cases hQ : Q ∈ filtration hW 0
  · rw [(adicRed_eq_zero_iff hW).mpr (add_mem hP hQ), (adicRed_eq_zero_iff hW).mpr hQ]
  · have hPQ : P + Q ∉ filtration hW 0 := fun h ↦ hQ (by simpa using AddSubgroup.sub_mem _ h hP)
    have hnQ : -Q ∉ filtration hW 0 := fun h ↦ hQ (by simpa using neg_mem h)
    have key := adicRed_add_of_not_mem hW hPQ hnQ
    rwa [show P + Q + -Q = P from by abel, adicRed_neg, (adicRed_eq_zero_iff hW).mpr hP, eq_comm,
      add_neg_eq_zero] at key
include hW in
 
lemma adicRed_add (P Q : W.Point) : adicRed hW (P + Q) = adicRed hW P + adicRed hW Q := by
  by_cases hP : P ∈ filtration hW 0
  · rw [adicRed_add_of_mem_left hW hP, (adicRed_eq_zero_iff hW).mpr hP, zero_add]
  · by_cases hQ : Q ∈ filtration hW 0
    · rw [add_comm P Q, adicRed_add_of_mem_left hW hQ, (adicRed_eq_zero_iff hW).mpr hQ, add_zero]
    · exact adicRed_add_of_not_mem hW hP hQ
include hW in

noncomputable def adicRedHom : W.Point →+ (adicRedCurve W₀).Point :=
  AddMonoidHom.mk' (adicRed hW) (adicRed_add hW)
end WeierstrassCurve.Affine
end
end

/- TunnellCoates -/
section
namespace TunnellCoates
abbrev E {K : Type*} [CommRing K] (n : K) : WeierstrassCurve K := ⟨0,0,0,-n^2,0⟩
end TunnellCoates
end

/- TunnellLocalCM -/
section
namespace TunnellLocalCM
open TunnellCoates
open WeierstrassCurve WeierstrassCurve.Affine
variable {K : Type*} [Field K] [DecidableEq K] (n i : K) (hi : i^2 = -1) [(E n).IsElliptic]
include hi in
lemma inn : i≠0 := by
  intro h
  rw [h,zero_pow (by decide)] at hi
  simpa using hi
include hi in
lemma ini : i⁻¹ = -i := by
  apply inv_eq_of_mul_eq_one_right
  linear_combination -hi
noncomputable def cmI : (E n).toAffine.Point → (E n).toAffine.Point
  | .zero => .zero
  | .some x y H => Affine.Point.mk ((E_equation n (-x) (i*y)).mpr (by
      rw [mul_pow, hi, (E_equation n x y).mp H.1]
      ring))
lemma cm_negY (x y : K) : (E n).toAffine.negY x y = -y := by simp [E,Affine.negY]
include hi in
lemma cm_slope (x z y t : K) :
    (E n).toAffine.slope (-x) (-z) (i*y) (i*t) = -i*(E n).toAffine.slope x z y t := by
  by_cases h : x=z
  · subst z
    by_cases ht : y = -t
    · rw [Affine.slope_of_Y_eq rfl (by simp only [cm_negY,ht,mul_neg]), Affine.slope_of_Y_eq rfl (by simpa only [cm_negY] using ht)]
      simp
    · have ht' : i*y ≠ (E n).toAffine.negY (-x) (i*t) := by
        rw [cm_negY, ← mul_neg, ne_eq, mul_right_inj' (inn i hi)]
        exact ht
      rw [Affine.slope_of_Y_ne rfl ht', Affine.slope_of_Y_ne rfl (by simpa only [cm_negY] using ht)]
      simp only [cm_negY]
      simp only [E,mul_zero,zero_mul,sub_zero,add_zero,sub_neg_eq_add,neg_sq,
        ← mul_add,div_eq_mul_inv, mul_inv_rev, ini i hi]
      ring
  · rw [Affine.slope_of_X_ne (fun e => h (neg_inj.mp e)), Affine.slope_of_X_ne h]
    rw [← mul_sub, show -x - -z = -(x-z) by ring, div_neg]
    ring
include hi in
lemma cm_addX (x z s : K) :
    (E n).toAffine.addX (-x) (-z) (-i*s) = -(E n).toAffine.addX x z s := by
  simp [Affine.addX,E,mul_pow,hi]
  ring
include hi in
lemma cm_addY (x z y s : K) :
    (E n).toAffine.addY (-x) (-z) (i*y) (-i*s) = i*(E n).toAffine.addY x z y s := by
  simp only [Affine.addY,Affine.negAddY,cm_addX n i hi,cm_negY]
  ring
noncomputable def gaussianI : AddMonoid.End (E n).toAffine.Point where
  toFun := cmI n i hi
  map_zero' := rfl
  map_add' P Q := by
    cases P with
    | zero => simp [show Affine.Point.zero = (0:(E n).toAffine.Point) from rfl, cmI]
    | some x y H =>
      cases Q with
      | zero => simp [show Affine.Point.zero = (0:(E n).toAffine.Point) from rfl, cmI]
      | some z t H' =>
        by_cases h : x=z ∧ y=(E n).toAffine.negY z t
        · rw [Affine.Point.add_of_Y_eq h.1 h.2]
          change 0 = Affine.Point.some _ _ _ + Affine.Point.some _ _ _
          rw [Affine.Point.add_of_Y_eq (congrArg Neg.neg h.1) (by simp only [h.2,cm_negY,mul_neg])]
        · have ht : ¬ (-x = -z ∧ i*y = (E n).toAffine.negY (-z) (i*t)) := by
            simpa only [neg_inj, cm_negY, ← mul_neg, mul_right_inj' (inn i hi)] using h
          rw [Affine.Point.add_some h]
          change Affine.Point.some _ _ _ = Affine.Point.some _ _ _ + Affine.Point.some _ _ _
          rw [Affine.Point.add_some ht]
          simp only [Affine.Point.some.injEq,cm_slope n i hi,cm_addX n i hi,cm_addY n i hi,and_self]
lemma gaussianI_square (P : (E n).toAffine.Point) : gaussianI n i hi (gaussianI n i hi P) = -P := by
  cases P with
  | zero => rfl
  | some x y h =>
    change Affine.Point.some _ _ _ = -Affine.Point.some x y h
    rw [Affine.Point.neg_some]
    simp only [Affine.Point.some.injEq, neg_neg, ← mul_assoc,← sq,hi,neg_one_mul,cm_negY, and_self]
end TunnellLocalCM
end

/- TunnellKummer -/
section
namespace TunnellKummer
open WeierstrassCurve
variable {F L : Type*} [Field F] [Field L] [Algebra F L]
variable (W : WeierstrassCurve F)
abbrev CurvePoints (W : WeierstrassCurve F) (L : Type*) [Field L] [Algebra F L] := (W.baseChange L).toAffine.Point
variable [DecidableEq L]
noncomputable def act (σ : (L ≃ₐ[F] L)) : (CurvePoints W L) →+ (CurvePoints W L) := Affine.Point.map (W' := W.toAffine) σ.toAlgHom
variable (φ : (CurvePoints W L) →+ (CurvePoints W L)) (Q : (CurvePoints W L))
variable (hφ : ∀ (σ : (L ≃ₐ[F] L)) (T : (CurvePoints W L)), φ (act W σ T) = act W σ (φ T))
variable (hP : ∀ σ : (L ≃ₐ[F] L), act W σ (φ Q) = φ Q)
lemma autos_eq_of_generate {u v : L} (hgen : IntermediateField.adjoin F {u,v} = ⊤)
    (σ τ : (L ≃ₐ[F] L)) (hu : σ u=τ u) (hv : σ v=τ v) : σ=τ := by
  ext x
  have hx : x ∈ IntermediateField.adjoin F {u,v} := hgen ▸ trivial
  induction hx using IntermediateField.adjoin_induction with
  | mem y hy => rcases hy with (rfl|ht); exact hu; obtain rfl := Set.mem_singleton_iff.mp ht; exact hv
  | algebraMap y => simp
  | add _ _ _ _ h1 h2 => simp only [map_add,h1,h2]
  | inv _ _ hh => simp only [map_inv₀,hh]
  | mul _ _ _ _ h1 h2 => simp only [map_mul,h1,h2]
noncomputable def rationalPoints (K : IntermediateField F L) : AddSubgroup (CurvePoints W L) :=
  (Affine.Point.map (W' := W.toAffine) K.val).range
lemma rationalPoints_some {K : IntermediateField F L} {x y : L}
    (h : (W.baseChange L).toAffine.Nonsingular x y) :
    Affine.Point.some x y h ∈ rationalPoints W K ↔ x∈K ∧ y∈K := by
  constructor
  · rintro ⟨P,hP⟩
    cases P with
    | zero => cases hP
    | some a b hq =>
      change Affine.Point.some (a:L) (b:L) _ = _ at hP
      have hc := Affine.Point.some.inj hP
      exact ⟨hc.1 ▸ a.property, hc.2 ▸ b.property⟩
  · rintro ⟨hx,hy⟩
    let a : K := ⟨x,hx⟩
    let b : K := ⟨y,hy⟩
    have h' : (W.baseChange K).toAffine.Nonsingular a b :=
      (W.toAffine.baseChange_nonsingular K.val.injective a b).mp h
    exact ⟨Affine.Point.some a b h',rfl⟩
end TunnellKummer
end

/- TunnellGaussianEnd -/
section
namespace TunnellGaussianEnd
variable {A : Type*} [AddCommGroup A]
def endo (I : A→+A) (a b : ℤ) : A→+A := a • AddMonoidHom.id _ + b • I
lemma endo_apply (I : A→+A) (a b : ℤ) (x:A) : endo I a b x=a•x+b•I x := rfl
theorem gaussian_kernel_annihilated (I : A→+A) (hi : ∀ x, I (I x)= -x) (a b : ℤ)
    {p : ℕ} (hab : a^2+b^2=(p:ℤ)) (r : ℕ) (x : A) (hx : (endo I a b)^[r] x=0) :
    p^r • x=0 := by
  let f := endo I a b
  let g := endo I a (-b)
  have hgf (y:A) : g (f y) = p • y := by
    simp only [g,f,endo_apply,map_add,map_zsmul,hi]
    rw [← natCast_zsmul y p,←hab]; module
  have hpow (m:ℕ) (y:A) : g^[m] (f^[m] y)=p^m • y := by
    induction m generalizing y with
    | zero => simp
    | succ m ih =>
      rw [Function.iterate_succ_apply',Function.iterate_succ_apply,ih,map_nsmul,hgf,smul_smul,pow_succ]
  have h := hpow r x
  change f^[r] x=0 at hx
  rw [hx,Function.iterate_fixed (map_zero g) r] at h
  exact h.symm
end TunnellGaussianEnd
end

/- TunnellGaussianBase -/
section
namespace TunnellGaussianEnd
open TunnellCoates TunnellKummer WeierstrassCurve
variable {K : Type*} [Field K] [DecidableEq K]
def quarterFun {W : WeierstrassCurve K} [W.IsElliptic] {n : K} (hW : W=E n)
    (i:K) (hi : i^2= -1) : W.toAffine.Point → W.toAffine.Point
  | .zero => .zero
  | .some x y h => .some (-x) (i*y) (by
    subst W
    apply Affine.equation_iff_nonsingular.mp
    apply (E_equation _ _ _).mpr
    rw [mul_pow,hi,(E_equation _ _ _).mp h.1]; ring)
noncomputable def quarter {W : WeierstrassCurve K} [W.IsElliptic] {n : K} (hW : W=E n)
    (i:K) (hi:i^2 = -1) : W.toAffine.Point →+ W.toAffine.Point where
  toFun := quarterFun hW i hi
  map_zero' := rfl
  map_add' x y := by
    subst W
    have he : quarterFun (n:=n) rfl i hi = TunnellLocalCM.gaussianI n i hi := by funext P; cases P <;> rfl
    rw [he,map_add]
lemma quarter_sq {W : WeierstrassCurve K} [W.IsElliptic] {n:K} (hW : W=E n) (i:K) (hi:i^2= -1)
    (x : W.toAffine.Point) : quarter hW i hi (quarter hW i hi x)= -x := by
  subst W
  have he : quarter (n:=n) rfl i hi = TunnellLocalCM.gaussianI n i hi := by ext P; cases P <;> rfl
  rw [he]
  exact TunnellLocalCM.gaussianI_square n i hi x
variable {F L : Type*} [Field F] [Field L] [Algebra F L] [DecidableEq F] [DecidableEq L]
lemma base_E (n:F) : (E n).baseChange L=E (algebraMap F L n) := by
  ext <;> simp [WeierstrassCurve.baseChange,E]
noncomputable def baseI (n i:F) [(E n).IsElliptic] (hi:i^2= -1) :
    CurvePoints (E n) L →+ CurvePoints (E n) L := by
  letI : ((E n).baseChange L).IsElliptic := by change ((E n).map (algebraMap F L)).IsElliptic; infer_instance
  exact quarter (base_E (L:=L) n) (algebraMap F L i) (by simpa only [map_pow,map_neg,map_one] using congrArg (algebraMap F L) hi)
lemma act_baseI (n i:F) [(E n).IsElliptic] (hi:i^2= -1) (σ:L≃ₐ[F]L) (x:CurvePoints (E n) L) :
    baseI n i hi (act (E n) σ x)=act (E n) σ (baseI n i hi x) := by
  cases x with
  | zero => rfl
  | some x y h =>
    change Affine.Point.some _ _ _ = Affine.Point.some _ _ _
    rw [Affine.Point.some.injEq]
    constructor
    · exact (map_neg σ x).symm
    · change algebraMap F L i * σ y = σ ((algebraMap F L i)*y)
      rw [map_mul,σ.commutes]
end TunnellGaussianEnd
end

/- TunnellCMTorsionField -/
section
namespace TunnellCMTorsionField
open TunnellCoates TunnellGaussianEnd TunnellKummer WeierstrassCurve
open LSG.Weierstrass TunnellCMToricDivision TunnellCMLemniscate Complex
noncomputable section
variable {F L : Type*} [Field F] [Field L] [Algebra F L] [DecidableEq F] [DecidableEq L]
def cm (n i:F) [(E n).IsElliptic] (hi:i^2= -1) (a : GaussianInt) :
    AddMonoid.End (CurvePoints (E n) L) := endo (baseI n i hi) a.re a.im
lemma cm_apply (n i:F) [(E n).IsElliptic] (hi:i^2= -1) (a : GaussianInt) (P : CurvePoints (E n) L) :
    cm n i hi a P=a.re • P+a.im • baseI n i hi P := rfl
lemma cm_act (n i:F) [(E n).IsElliptic] (hi:i^2= -1) (a : GaussianInt)
    (σ : L ≃ₐ[F] L) (P : CurvePoints (E n) L) :
    cm n i hi a (act (E n) σ P)=act (E n) σ (cm n i hi a P) := by
  simp [cm_apply,map_add,map_zsmul,act_baseI]
end
end TunnellCMTorsionField
end

/- TunnellLocalCMCoordDegree -/
section
namespace TunnellLocalCMCoordDegree
open TunnellCoates TunnellKummer TunnellGaussianEnd TunnellCMTorsionField WeierstrassCurve
noncomputable section
variable {F L B:Type} [Field F] [Field L] [Field B] [Algebra F L] [Algebra F B]
    [DecidableEq F] [DecidableEq L] [DecidableEq B]
lemma endo_iterate {G:Type*} [AddCommGroup G] (I:G→+G) (hi:∀x,I (I x)= -x)
    (c:GaussianInt) (r:ℕ) (P:G) :
    (endo I c.re c.im)^[r] P=endo I (c^r).re (c^r).im P := by
  induction r with
  | zero => simp [endo_apply]
  | succ r ih =>
    rw [Function.iterate_succ_apply',ih,pow_succ]
    simp only [endo_apply,Zsqrtd.re_mul,Zsqrtd.im_mul,map_add,map_zsmul,hi]
    module
end
end TunnellLocalCMCoordDegree
end

/- TunnellCMChangeBaseField -/
section
namespace TunnellCMChangeBaseField
open WeierstrassCurve WeierstrassCurve.Affine TunnellCoates TunnellKummer TunnellGaussianEnd TunnellCMTorsionField
open scoped Classical
noncomputable section
variable {F K M:Type} [Field F] [Field K] [Field M] [Algebra F K] [Algebra K M] [Algebra F M] [IsScalarTower F K M]
variable (n:ℕ)
def rebase : CurvePoints (E (n:F)) M≃+CurvePoints (E (n:K)) M :=
  Point.equivOfEq (by ext <;> simp [E,WeierstrassCurve.baseChange,WeierstrassCurve.map])
@[simp] theorem rebase_some {x y:M} (h:((E (n:F)).baseChange M).toAffine.Nonsingular x y) :
    ∃ h',rebase (K:=K) n (.some x y h)=.some x y h' := ⟨_,Point.equivOfEq_some _ h⟩
variable [(E (n:F)).IsElliptic] [(E (n:K)).IsElliptic] (i:F) (j:K) (hi:i^2= -1) (hj:j^2= -1)
variable (hij:algebraMap F K i=j)
include hij hi in
theorem cm_rebase (a:GaussianInt) (P:CurvePoints (E (n:F)) M) :
    rebase (K:=K) n (cm (n:F) i hi a P)=cm (n:K) j hj a (rebase (K:=K) n P) := by
  have hJ:rebase (K:=K) n (baseI (n:F) i hi P)=baseI (n:K) j hj (rebase (K:=K) n P) := by
    cases P with
    | zero=>change rebase n (baseI _ _ _ 0)=baseI _ _ _ (rebase n 0); simp only [map_zero]
    | some x y hh=>
      obtain ⟨h₁,h₁'⟩:∃ h',baseI (n:F) i hi (.some x y hh)=.some (-x) (algebraMap F M i*y) h':=⟨_,rfl⟩
      obtain ⟨h₂,h₂'⟩:=rebase_some (K:=K) n hh
      obtain ⟨h₃,h₃'⟩:=rebase_some (K:=K) n h₁
      rw [h₁',h₃',h₂']
      change Point.some _ _ _=Point.some _ _ _
      exact (Point.some.injEq ..).mpr ⟨rfl,congrArg (·*y) (by rw [←hij,←IsScalarTower.algebraMap_apply])⟩
  rw [cm_apply,cm_apply,map_add,map_zsmul,map_zsmul,hJ]
end
end TunnellCMChangeBaseField
end

/- TunnellCMGlobalModelUnit -/
section
section
namespace TunnellCMGlobalModelUnit
open WeierstrassCurve WeierstrassCurve.Affine IsDedekindDomain IsDedekindDomain.HeightOneSpectrum
open IsLocalRing NumberField TunnellCMModelUnit TunnellCMUnitCriterion
open scoped NumberField
variable {F : Type*} [Field F] (W : WeierstrassCurve F) (L : Type*) [Field L] [Algebra F L]
  [DecidableEq F] [DecidableEq L]
theorem base_self : W.baseChange F = W := by
  change W.map (algebraMap F F) = W
  rw [Algebra.algebraMap_self,W.map_id]
noncomputable def pointMap : W.toAffine.Point →+ (W.baseChange L).toAffine.Point :=
  (Point.map (W' := W.toAffine) (Algebra.ofId F L)).comp
    (Point.equivOfEq (base_self W).symm).toAddMonoidHom
theorem pointMap_inj : Function.Injective (pointMap W L) :=
  (Point.map_injective _).comp (Point.equivOfEq _).injective
variable {K : Type*} [Field K] [NumberField K]
end TunnellCMGlobalModelUnit
end

/- TunnellCMIntegralInertia -/
section
namespace TunnellCMIntegralInertia
open IsDedekindDomain IsDedekindDomain.HeightOneSpectrum IsLocalRing NumberField
open scoped NumberField
variable {R K : Type*} [CommRing R] [IsDedekindDomain R] [Field K] [Algebra R K] [IsFractionRing R K]
  (v : HeightOneSpectrum R)
theorem local_fraction {x : K} (h : (v.valuation K) x≤1) :
    ∃ (a d : R), d∉v.asIdeal ∧ x*(algebraMap R K) d=(algebraMap R K) a := by
  obtain ⟨a,d,e⟩ := v.exists_primeCompl_mul_eq_of_integer x h
  exact ⟨a,d.val,d.property,e⟩
theorem integral_difference (σ : K →+* K) (hσ : ∀ a : R, (v.valuation K) (σ ((algebraMap R K) a)-(algebraMap R K) a)<1)
    {x : K} (hx : (v.valuation K) x≤1) : (v.valuation K) (σ x-x)<1 := by
  obtain ⟨a,d,hd,he⟩ := local_fraction v hx
  have dv : (v.valuation K) ((algebraMap R K) d)=1 := (v.valuation_eq_one_iff_notMem (K := K)).mpr hd
  have eqd : (v.valuation K) (σ ((algebraMap R K) d))=1 := by
    rw [← sub_add_cancel (σ ((algebraMap R K) d)) ((algebraMap R K) d),((v.valuation K)).map_add_eq_of_lt_right (dv ▸ hσ d),dv]
  have prod : (σ x-x)*σ ((algebraMap R K) d)=(σ ((algebraMap R K) a)-(algebraMap R K) a)-x*(σ ((algebraMap R K) d)-(algebraMap R K) d) := by
    have h := congrArg σ he
    rw [map_mul] at h
    linear_combination h - he
  have hl : (v.valuation K) (x*(σ ((algebraMap R K) d)-(algebraMap R K) d))<1 := by
    rw [map_mul]
    exact lt_of_le_of_lt (mul_le_of_le_one_left' hx) (hσ d)
  calc
    (v.valuation K) (σ x-x) = (v.valuation K) ((σ x-x)*σ ((algebraMap R K) d)) := by rw [map_mul,eqd,mul_one]
    _ = _ := congrArg (v.valuation K) prod
    _ < 1 := (((v.valuation K)).map_sub _ _).trans_lt (max_lt (hσ a) hl)
theorem image_integral (σ : K →+* K) (hσ : ∀ a : R, (v.valuation K) (σ ((algebraMap R K) a)-(algebraMap R K) a)<1)
    {x : K} (hx : (v.valuation K) x≤1) : (v.valuation K) (σ x)≤1 := by
  have he := integral_difference v σ hσ hx
  rw [← sub_add_cancel (σ x) x]
  exact (((v.valuation K)).map_add _ _).trans (max_le he.le hx)
variable {F N : Type*} [Field F] [Field N] [NumberField N] [Algebra F N]
theorem inertia_on_integers (w : HeightOneSpectrum (𝓞 N)) (σ : N ≃ₐ[F] N)
    (hσ : σ∈w.asIdeal.inertia (N ≃ₐ[F] N)) (a : 𝓞 N) :
    w.valuation N (σ (a:N)-(a:N))<1 := by
  have H : σ • a-a∈w.asIdeal := hσ a
  exact (w.valuation_lt_one_iff_mem (K := N) (σ • a-a)).mpr H
end TunnellCMIntegralInertia
end

/- TunnellCMInertiaAtGood -/
section
section
namespace TunnellCMInertiaAtGood
open IsLocalRing WeierstrassCurve WeierstrassCurve.Affine TunnellCMLocalUnit TunnellCMModelUnit
open IsDedekindDomain IsDedekindDomain.HeightOneSpectrum WithZero
variable {R K : Type*} [CommRing R] [IsDedekindDomain R] [Field K] [CharZero K]
  [Algebra R K] [IsFractionRing R K] {v : HeightOneSpectrum R}
variable {W : Affine (v.adicCompletion K)} {W₀ : WeierstrassCurve (v.adicCompletionIntegers K)}
  (hW : W₀.map (algebraMap (v.adicCompletionIntegers K) (v.adicCompletion K)) = W)
  [DecidableEq (v.adicCompletion K)] [DecidableEq (ResidueField (v.adicCompletionIntegers K))]
  [W.IsElliptic] [W₀.IsElliptic]
theorem reduction_of_integral_coordinates {x y x' y' : (v.adicCompletion K)} {H : W.Nonsingular x y} {H' : W.Nonsingular x' y'}
    (hv : Valued.v x'≤1 ↔ Valued.v x≤1)
    (hx : ∀ (h₁ : Valued.v x'≤1) (h₂ : Valued.v x≤1),
      residue (v.adicCompletionIntegers K) (⟨x',h₁⟩:(v.adicCompletionIntegers K))=residue (v.adicCompletionIntegers K) (⟨x,h₂⟩:(v.adicCompletionIntegers K)))
    (hy : ∀ (h₁ : Valued.v y'≤1) (h₂ : Valued.v y≤1),
      residue (v.adicCompletionIntegers K) (⟨y',h₁⟩:(v.adicCompletionIntegers K))=residue (v.adicCompletionIntegers K) (⟨y,h₂⟩:(v.adicCompletionIntegers K))) :
    adicRed hW (.some x' y' H')=adicRed hW (.some x y H) := by
  have gate {u b : (v.adicCompletion K)} (H : W.Nonsingular u b) : ¬ exp (2:ℤ)≤Valued.v u ↔ Valued.v u≤1 :=
    ⟨fun h => (integral_of_not_mem hW H.1 h).1,fun h => not_exp_two_le_of_le_one h⟩
  by_cases h : Valued.v x≤1
  · rw [adicRed_some_of_not_mem hW ((gate H).mpr h),adicRed_some_of_not_mem hW ((gate H').mpr (hv.mpr h)),Point.some.injEq]
    exact ⟨hx _ _,hy _ _⟩
  · rw [adicRed_some_of_mem hW (not_not.mp ((gate H).not.mpr h)),
      adicRed_some_of_mem hW (not_not.mp ((gate H').not.mpr (hv.not.mpr h)))]
end TunnellCMInertiaAtGood
end

/- TunnellCMGoodInertiaAction -/
section
namespace TunnellCMGoodInertiaAction
open IsDedekindDomain IsDedekindDomain.HeightOneSpectrum IsLocalRing NumberField
open WeierstrassCurve WeierstrassCurve.Affine TunnellKummer TunnellCMIntegralInertia
open TunnellCMInertiaAtGood TunnellCMGlobalModelUnit
open scoped NumberField
noncomputable section
variable {F N : Type*} [Field F] [Field N] [NumberField N] [Algebra F N] [DecidableEq N]
  (v : HeightOneSpectrum (𝓞 N))
lemma complete_value (x : N) : Valued.v ((algebraMap N (v.adicCompletion N)) x) = v.valuation N x :=
  v.valuedAdicCompletion_eq_valuation' x
lemma integral_iff (σ : N ≃ₐ[F] N) (hσ : σ∈v.asIdeal.inertia (N ≃ₐ[F] N)) (x : N) :
    Valued.v ((algebraMap N (v.adicCompletion N)) (σ x))≤1 ↔ Valued.v ((algebraMap N (v.adicCompletion N)) x)≤1 := by
  rw [complete_value,complete_value]
  refine ⟨fun h => ?_,image_integral v σ.toRingEquiv.toRingHom (inertia_on_integers v σ hσ)⟩
  have hinv := (v.asIdeal.inertia (N ≃ₐ[F] N)).inv_mem hσ
  exact (show (σ⁻¹ : N ≃ₐ[F] N) (σ x)=x from σ.symm_apply_apply x) ▸
    image_integral v (σ⁻¹).toRingEquiv.toRingHom (inertia_on_integers v _ hinv) h
lemma residue_fixed (σ : N ≃ₐ[F] N) (hσ : σ∈v.asIdeal.inertia (N ≃ₐ[F] N))
    (x : N) (h₁ : Valued.v ((algebraMap N (v.adicCompletion N)) (σ x))≤1) (h₂ : Valued.v ((algebraMap N (v.adicCompletion N)) x)≤1) :
    residue (v.adicCompletionIntegers N) (⟨(algebraMap N (v.adicCompletion N)) (σ x),h₁⟩:(v.adicCompletionIntegers N))=residue (v.adicCompletionIntegers N) (⟨(algebraMap N (v.adicCompletion N)) x,h₂⟩:(v.adicCompletionIntegers N)) := by
  apply sub_eq_zero.mp
  rw [← map_sub,residue_eq_zero_iff]
  apply Valuation.Integer.not_isUnit_iff_valuation_lt_one.mpr
  change Valued.v ((algebraMap N (v.adicCompletion N)) (σ x)-(algebraMap N (v.adicCompletion N)) x)<1
  rw [← map_sub,complete_value]
  exact integral_difference v σ.toRingEquiv.toRingHom (inertia_on_integers v σ hσ)
    ((complete_value v x) ▸ h₂)
theorem reduction_invariant (W : WeierstrassCurve F) (W₀ : WeierstrassCurve (v.adicCompletionIntegers N))
    (hW : W₀.map (algebraMap (v.adicCompletionIntegers N) (v.adicCompletion N))=(W.baseChange N).baseChange (v.adicCompletion N))
    [W₀.IsElliptic] [((W.baseChange N).baseChange (v.adicCompletion N)).IsElliptic]
    [DecidableEq (v.adicCompletion N)] [DecidableEq (ResidueField (v.adicCompletionIntegers N))]
    (σ : N ≃ₐ[F] N) (hσ : σ∈v.asIdeal.inertia (N ≃ₐ[F] N)) (P : CurvePoints W N) :
    adicRed hW (pointMap (W.baseChange N) (v.adicCompletion N) (act W σ P)) =
      adicRed hW (pointMap (W.baseChange N) (v.adicCompletion N) P) := by
  cases P with
  | zero => rfl
  | some x y hp =>
    simp only [act,pointMap,AddMonoidHom.comp_apply,AddEquiv.coe_toAddMonoidHom,Point.equivOfEq_some,Point.map_some]
    apply reduction_of_integral_coordinates hW (integral_iff v σ hσ x)
      (residue_fixed v σ hσ x) (residue_fixed v σ hσ y)
end
end TunnellCMGoodInertiaAction
end

/- TunnellCMGoodDivisionField -/
section
namespace TunnellCMGoodDivisionField
open WeierstrassCurve WeierstrassCurve.Affine IsDedekindDomain IsLocalRing NumberField
open TunnellCMGoodInertiaAction TunnellKummer
open scoped NumberField
noncomputable section
variable {F N : Type*} [Field F] [Field N] [NumberField N] [Algebra F N] [DecidableEq N]
  (v : HeightOneSpectrum (𝓞 N))
theorem unramified_of_trivial [NumberField F] [FiniteDimensional F N] [IsGalois F N]
    (u : HeightOneSpectrum (𝓞 F)) [v.asIdeal.LiesOver u.asIdeal]
    (h : v.asIdeal.inertia (N ≃ₐ[F] N)=⊥) : v.asIdeal.ramificationIdx (𝓞 F)=1 := by
  letI : IsGaloisGroup (N ≃ₐ[F] N) (𝓞 F) (𝓞 N) :=
    IsGaloisGroup.of_isFractionRing _ _ _ F N
  letI : Finite ((𝓞 F) ⧸ u.asIdeal) := Ring.HasFiniteQuotients.finiteQuotient u.ne_bot
  letI : PerfectField u.asIdeal.ResidueField := PerfectField.ofFinite
  rw [← Ideal.ramificationIdxIn_eq_ramificationIdx u.asIdeal v.asIdeal (N ≃ₐ[F] N),
      ← Ideal.card_inertia_eq_ramificationIdxIn (G := N ≃ₐ[F] N) u.asIdeal v.asIdeal]
  exact Subgroup.card_eq_one.mpr h
end
end TunnellCMGoodDivisionField
end

/- TunnellCMRebasedDivision -/
section
namespace TunnellCMRebasedDivision
open WeierstrassCurve WeierstrassCurve.Affine IsDedekindDomain IsDedekindDomain.HeightOneSpectrum
open TunnellCoates TunnellKummer TunnellCMChangeBaseField IntermediateField NumberField
open scoped Classical NumberField
noncomputable section
lemma base_fixed {D F M : Type} [Field D] [Field F] [Field M] [Algebra D F] [Algebra D M] [Algebra F M]
    [IsScalarTower D F M] (n : ℕ) (P : CurvePoints (E (n:D)) D) (φ : D →ₐ[D] M) (σ : M ≃ₐ[F] M) :
    act (E (n:F)) σ (rebase (K:=F) n (Point.map (W':=(E (n:D)).toAffine) φ P))=
      rebase (K:=F) n (Point.map (W':=(E (n:D)).toAffine) φ P) := by
  have fix (x : D) : σ (φ x)=φ x := by
    have he : φ x=algebraMap D M x := (φ.commutes x)
    rw [he,IsScalarTower.algebraMap_apply D F M,σ.commutes]
  cases P with
  | zero =>
    change act (E (n:F)) σ (rebase (K:=F) n (Point.map (W':=(E (n:D)).toAffine) φ (0:CurvePoints (E (n:D)) D)))=
      rebase (K:=F) n (Point.map (W':=(E (n:D)).toAffine) φ (0:CurvePoints (E (n:D)) D))
    rw [map_zero,map_zero,map_zero]
  | some x y h =>
    rw [Point.map_some,show rebase (K:=F) n (Point.some _ _ _) = _ from (rebase_some (K:=F) n _).choose_spec]
    exact Point.some_eq_some _ (fix x) (fix y)
variable {D F N M : Type} [Field D] [Field F] [Field N] [Field M]
  [dD : DecidableEq D] [dN : DecidableEq N]
  [NumberField D] [NumberField F] [NumberField N] [NumberField M]
  [Algebra D N] [Algebra D F] [Algebra D M] [Algebra N M] [Algebra F M]
  [IsScalarTower D F M] [IsScalarTower D N M] [FiniteDimensional D N] [FiniteDimensional D F] [FiniteDimensional F M]
  [IsGalois D N] [IsGalois F M]
end
end TunnellCMRebasedDivision
end

/- TunnellSah -/
section
namespace TunnellKummer
open WeierstrassCurve
variable {F L : Type*} [Field F] [Field L] [Algebra F L] [DecidableEq L]
variable (W : WeierstrassCurve F) (φ : CurvePoints W L →+ CurvePoints W L)
variable (hφ : ∀ (σ : L ≃ₐ[F] L) (P : CurvePoints W L), φ (act W σ P) = act W σ (φ P))
lemma point_rational_of_fixed [IsGalois F L] (Q : CurvePoints W L)
    (hQ : ∀ σ : L ≃ₐ[F] L, act W σ Q=Q) :
    Q ∈ rationalPoints W (⊥ : IntermediateField F L) := by
  cases Q with
  | zero => exact AddSubgroup.zero_mem _
  | some x y H =>
    apply (rationalPoints_some W H).mpr
    constructor
    · apply (InfiniteGalois.mem_bot_iff_fixed x).mpr
      exact fun σ => (Affine.Point.some.inj (hQ σ)).1
    · apply (InfiniteGalois.mem_bot_iff_fixed y).mpr
      exact fun σ => (Affine.Point.some.inj (hQ σ)).2
end TunnellKummer
end

/- TunnellRamifiedDivision -/
section
namespace TunnellKummer
open WeierstrassCurve
variable {F L : Type*} [Field F] [Field L] [Algebra F L] [DecidableEq F] [DecidableEq L]
variable (W : WeierstrassCurve F)
noncomputable abbrev changeBase := Affine.Point.baseChange (W':=W.toAffine) F L
lemma exists_point_of_rational (R : CurvePoints W L)
    (hR : R∈rationalPoints W (⊥ : IntermediateField F L)) :
    ∃ S : CurvePoints W F, changeBase W S=R := by
  cases R with
  | zero => exact ⟨0,rfl⟩
  | some x y h =>
    obtain ⟨hx,hy⟩ := (rationalPoints_some W h).mp hR
    obtain ⟨a,rfl⟩ := IntermediateField.mem_bot.mp hx
    obtain ⟨b,rfl⟩ := IntermediateField.mem_bot.mp hy
    have hab := (W.toAffine.baseChange_nonsingular (Algebra.ofId F L).injective a b).mp h
    exact ⟨.some a b hab,rfl⟩
end TunnellKummer
end

/- TunnellCMRationalMultiple -/
section
namespace TunnellCMRationalMultiple
open WeierstrassCurve WeierstrassCurve.Affine TunnellCoates TunnellKummer TunnellGaussianEnd
open TunnellCMTorsionField TunnellLocalCMCoordDegree
open scoped Classical
noncomputable section
variable {D M : Type} [Field D] [Field M] [Algebra D M] [IsGalois D M] [DecidableEq D] [DecidableEq M]
theorem rational (n : ℕ) [(E (n:D)).IsElliptic] (i : D) (hi : i^2= -1) (q : GaussianInt)
    {p : ℕ} (hq : q.re^2+q.im^2=(p:ℤ)) (r : ℕ) (Q : CurvePoints (E (n:D)) M)
    (h : ∀ σ : M ≃ₐ[D] M, act (E (n:D)) σ (cm (n:D) i hi (q^r) Q)=cm (n:D) i hi (q^r) Q) :
    ∃ P : CurvePoints (E (n:D)) D, p^r • Q=Point.map (W' := (E (n:D)).toAffine) (Algebra.ofId D M) P := by
  let W:=E (n:D)
  have hJ (x : CurvePoints W M) : baseI (n:D) i hi (baseI (n:D) i hi x)= -x := by
    letI : (W.baseChange M).IsElliptic := inferInstanceAs ((W.map (algebraMap D M)).IsElliptic)
    exact quarter_sq (base_E (n:D)) _ _ x
  have fix (σ : M ≃ₐ[D] M) : act W σ (p^r • Q)=p^r • Q := by
    let U:=act W σ Q-Q
    have h0 : cm (n:D) i hi (q^r) U=0 := by
      change cm _ _ _ _ (act W σ Q-Q)=0
      rw [map_sub,cm_act,h,sub_self]
    have e := gaussian_kernel_annihilated _ hJ _ _ hq r U ((endo_iterate _ hJ q r U).trans h0)
    change p^r • (act W σ Q-Q)=0 at e
    rw [map_nsmul]; exact sub_eq_zero.mp ((nsmul_sub _ _ _).symm.trans e)
  obtain ⟨P,hP⟩ := exists_point_of_rational W _ (point_rational_of_fixed W _ fix)
  exact ⟨P,hP.symm⟩
end
end TunnellCMRationalMultiple
end

/- TunnellCMKummerUnramified -/
section
namespace TunnellCMKummerUnramified
open WeierstrassCurve WeierstrassCurve.Affine IntermediateField IsDedekindDomain NumberField
open TunnellCoates TunnellKummer TunnellGaussianEnd TunnellCMTorsionField TunnellCMChangeBaseField
open TunnellCMRebasedDivision TunnellDivisionCoordinates TunnellCMGoodKummerBaseChange TunnellCMUniformGoodBase
open scoped Classical NumberField TunnellDivisionCoordinates
noncomputable section
lemma rational_rebase {F D M : Type} [Field F] [Field D] [Field M] [Algebra F D] [Algebra F M]
    [Algebra D M] [IsScalarTower F D M] [IsGalois D M] [dF : DecidableEq F] [dD : DecidableEq D]
    [dM : DecidableEq M] (n : ℕ) [(E (n:F)).IsElliptic] [(E (n:D)).IsElliptic]
    (i : F) (hi : i^2= -1) (j : D) (hj : j^2= -1) (hij : algebraMap F D i=j)
    (q : GaussianInt) {p : ℕ} (hnorm : q.re^2+q.im^2=(p:ℤ)) (r : ℕ)
    (P : CurvePoints (E (n:F)) F) (Q : CurvePoints (E (n:F)) M)
    (hP : cm (n:F) i hi (q^r) Q=Point.map (W':=(E (n:F)).toAffine) (Algebra.ofId F M) P) :
    ∃ P₀ : CurvePoints (E (n:D)) D, p^r • rebase (K:=D) n Q=
      Point.map (W':=(E (n:D)).toAffine) (Algebra.ofId D M) P₀ := by
  obtain rfl : dF=Classical.decEq F := Subsingleton.elim _ _
  obtain rfl : dD=Classical.decEq D := Subsingleton.elim _ _
  obtain rfl : dM=Classical.decEq M := Subsingleton.elim _ _
  let t:=rebase (F:=F) (K:=D) (M:=M) n
  apply TunnellCMRationalMultiple.rational n j hj q hnorm r (t Q)
  intro σ
  have he:=cm_rebase (M:=M) n i j hi hj hij (q^r) Q
  have eq : cm (n:D) j hj (q^r) (t Q)=t (Point.map (W':=(E (n:F)).toAffine) (Algebra.ofId F M) P) :=
    he.symm.trans (congrArg t hP)
  exact (congrArg (act (E (n:D)) σ) eq).trans ((base_fixed n P (Algebra.ofId F M) σ).trans eq.symm)
variable {B : Type} [Field B] [CharZero B] [IsAlgClosed B] [Algebra.IsAlgebraic ℚ B] [dB : DecidableEq B]
variable {K : Type} [Field K] [NumberField K] [Algebra K B] [Normal K B]
variable (n : ℕ) (hn : 0<n) [(E (n:K)).IsElliptic] (i : K) (hi : i^2= -1)
end
end TunnellCMKummerUnramified
end

/- TunnellFormalQuarter -/
section
namespace TunnellFormalQuarter
open IsLocalRing IsDedekindDomain IsDedekindDomain.HeightOneSpectrum WeierstrassCurve WeierstrassCurve.Affine
open TunnellCoates ChabautyColeman
section General
variable {O : Type*} [CommRing O] [IsLocalRing O] [UniformSpace O] [Fact (IsAdic (maximalIdeal O))]
    [IsUniformAddGroup O] [CompleteSpace O] [T2Space O] [IsTopologicalRing O]
lemma w_quarter (n i : O) (hi : i^2 = -1) (t : O) (ht : t∈maximalIdeal O) :
    (E n).wEval (i*t) = -i*(E n).wEval t := by
  let w := (E n).wEval t
  have h := (E n).wEval_eq ht
  change w=(E n).wPoly t w at h
  have hm := (maximalIdeal O).mul_mem_left i ht
  apply (E n).eq_of_wPoly_fixed hm ((E n).wEval_mem hm) ((maximalIdeal O).mul_mem_left (-i) ((E n).wEval_mem ht)) ((E n).wEval_eq hm)
  change -i*w=(E n).wPoly (i*t) (-i*w)
  simp only [WeierstrassCurve.wPoly,E,zero_mul,add_zero] at h ⊢
  linear_combination -i * h + (-i * t^3 + n^2*i*t*w^2) * hi
noncomputable def quarterParam (n i : O) (Z : (E n).formalGroupLaw.Points) : (E n).formalGroupLaw.Points :=
  fun _ => ⟨i*(Z ():O), (maximalIdeal O).mul_mem_left _ (Z ()).2⟩
end General
variable {R K:Type*} [CommRing R] [IsDedekindDomain R] [Field K] [CharZero K] [Algebra R K] [IsFractionRing R K]
    {v : HeightOneSpectrum R} [DecidableEq (v.adicCompletion K)]
lemma base_curve (n : (v.adicCompletionIntegers K)) : (E n).map (algebraMap (v.adicCompletionIntegers K) (v.adicCompletion K)) = E (n:(v.adicCompletion K)) := by
  ext <;> simp [E,WeierstrassCurve.map]
noncomputable def toPoint (n : (v.adicCompletionIntegers K)) [(E (n:(v.adicCompletion K))).IsElliptic] : (E n).formalGroupLaw.Points →+ (E (n:(v.adicCompletion K))).toAffine.Point where
  toFun := formalPoint (base_curve n)
  map_zero' := formalPoint_of_param_eq_zero (base_curve n) (z:=0) rfl
  map_add' := formalPoint_add (base_curve n)
lemma quarter_toPoint (n i : (v.adicCompletionIntegers K)) (hi : i^2= -1) [(E (n:(v.adicCompletion K))).IsElliptic] (Z : (E n).formalGroupLaw.Points) :
    toPoint n (quarterParam n i Z) = TunnellLocalCM.gaussianI (n:(v.adicCompletion K)) (i:(v.adicCompletion K)) (by exact_mod_cast hi) (toPoint n Z) := by
  let f := algebraMap (v.adicCompletionIntegers K) (v.adicCompletion K)
  have hiL : (i:(v.adicCompletion K))^2= -1 := by exact_mod_cast hi
  have hi₀ : i≠0 := by rintro rfl; simpa using hi
  have hi₁ : (i:(v.adicCompletion K))≠0 := by exact_mod_cast hi₀
  change formalPoint (base_curve n) _ = TunnellLocalCM.gaussianI _ _ _ (formalPoint (base_curve n) _)
  by_cases hz : (Z ():(v.adicCompletionIntegers K))=0
  · rw [formalPoint_of_param_eq_zero (base_curve n) hz, map_zero,
        formalPoint_of_param_eq_zero (base_curve n) (z:=quarterParam n i Z) (by change i*(Z ():(v.adicCompletionIntegers K))=0; rw [hz,mul_zero])]
  have hq : (quarterParam n i Z ():(v.adicCompletionIntegers K))≠0 := mul_ne_zero hi₀ hz
  rw [formalPoint_of_param_ne_zero (base_curve n) hz, formalPoint_of_param_ne_zero (base_curve n) hq]
  change Affine.Point.some _ _ _ = Affine.Point.some _ _ _
  rw [Affine.Point.some.injEq]
  change (↑(i*(Z ():(v.adicCompletionIntegers K))):(v.adicCompletion K))/((E n).wEval (i*(Z ():(v.adicCompletionIntegers K))):(v.adicCompletion K)) = -(((Z ():(v.adicCompletionIntegers K)):(v.adicCompletion K))/((E n).wEval (Z ():(v.adicCompletionIntegers K)):(v.adicCompletion K))) ∧
    -1/((E n).wEval (i*(Z ():(v.adicCompletionIntegers K))):(v.adicCompletion K))=(i:(v.adicCompletion K))*(-1/((E n).wEval (Z ():(v.adicCompletionIntegers K)):(v.adicCompletion K)))
  rw [w_quarter n i hi _ (Z ()).2]
  push_cast
  have hw : ((E n).wEval (Z ():(v.adicCompletionIntegers K)):(v.adicCompletion K))≠0 := by exact_mod_cast (E n).wEval_ne_zero (Z ()).2 hz
  constructor <;> field_simp <;> ring_nf <;> rw [hiL] <;> ring
end TunnellFormalQuarter
end

/- TunnellFormalPrimaryCM -/
section
namespace TunnellFormalPrimaryCM
open IsLocalRing IsDedekindDomain IsDedekindDomain.HeightOneSpectrum WeierstrassCurve WeierstrassCurve.Affine
open TunnellCoates ChabautyColeman TunnellFormalQuarter TunnellGaussianEnd WithZero
variable {R K:Type*} [CommRing R] [IsDedekindDomain R] [Field K] [CharZero K] [Algebra R K] [IsFractionRing R K]
    {v : HeightOneSpectrum R} [DecidableEq (v.adicCompletion K)]
lemma sum_congr (n i : (v.adicCompletionIntegers K)) (Z : (E n).formalGroupLaw.Points) {k : ℕ} (hk : k≠0)
    (ht:(Z ():(v.adicCompletionIntegers K))∈maximalIdeal (v.adicCompletionIntegers K)^k) (a b:ℕ) :
    (((a • Z + b • quarterParam n i Z) () : (v.adicCompletionIntegers K)) - ((a:(v.adicCompletionIntegers K))+(b:(v.adicCompletionIntegers K))*i)*(Z ():(v.adicCompletionIntegers K))) ∈ maximalIdeal (v.adicCompletionIntegers K)^(2*k) := by
  let J := maximalIdeal (v.adicCompletionIntegers K)^(2*k)
  let t : (v.adicCompletionIntegers K) := Z ()
  have hq : (quarterParam n i Z ():(v.adicCompletionIntegers K))∈maximalIdeal (v.adicCompletionIntegers K)^k := (maximalIdeal (v.adicCompletionIntegers K)^k).mul_mem_left i ht
  obtain ⟨ha,ha'⟩ := (E n).nsmul_apply_coe_mem_and_sub_mem hk ht a
  obtain ⟨hb,hb'⟩ := (E n).nsmul_apply_coe_mem_and_sub_mem hk hq b
  have herr := (E n).addEval_sub_add_mem hk ha hb
  rw [← (E n).add_apply_coe_eq_addEval] at herr
  have e := J.add_mem herr (J.add_mem ha' hb')
  simp only [nsmul_eq_mul] at e
  convert e using 1 <;> change _ = _ <;> dsimp [quarterParam] <;> ring
lemma zsmul_diff {G:Type*} [AddCommGroup G] (x:G) (a:ℤ) :
    a • x = a.toNat • x - (-a).toNat • x := by
  have ha : a=(a.toNat:ℤ)-((-a).toNat:ℤ) := by omega
  calc a • x = ((a.toNat:ℤ)-((-a).toNat:ℤ)) • x := congrArg (· • x) ha
       _ = _ := by rw [sub_zsmul,natCast_zsmul,natCast_zsmul,sub_eq_add_neg]
theorem unit_kernel (n i:(v.adicCompletionIntegers K)) (hi:i^2= -1) [(E (n:(v.adicCompletion K))).IsElliptic]
    (a b:ℤ) (hu : IsUnit ((a:(v.adicCompletionIntegers K))+(b:(v.adicCompletionIntegers K))*i)) (Z : (E n).formalGroupLaw.Points)
    (hz : endo (TunnellLocalCM.gaussianI (n:(v.adicCompletion K)) (i:(v.adicCompletion K)) (by exact_mod_cast hi)) a b (toPoint n Z)=0) : Z=0 := by
  by_contra hn
  have htn : (Z ():(v.adicCompletionIntegers K)) ≠ 0 := fun h => hn (funext fun u => by cases u; exact Subtype.ext h)
  obtain ⟨k,hk,hval⟩ := ChabautyColeman.exists_valued_eq_exp_neg (Z ()).2 htn
  have ht := (v.mem_maximalIdeal_pow_iff (K:=K)).mpr hval.le
  let J := maximalIdeal (v.adicCompletionIntegers K)^(2*k)
  have he : a.toNat • Z + b.toNat • quarterParam n i Z = (-a).toNat • Z + (-b).toNat • quarterParam n i Z := by
    apply formalPoint_injective (base_curve n)
    change (toPoint n) _ = (toPoint n) _
    rw [map_add,map_add,map_nsmul,map_nsmul,map_nsmul,map_nsmul,quarter_toPoint n i hi]
    change a • (toPoint n Z) + b • (TunnellLocalCM.gaussianI (n:(v.adicCompletion K)) (i:(v.adicCompletion K)) _ (toPoint n Z))=0 at hz
    rw [zsmul_diff _ a,zsmul_diff _ b] at hz
    apply sub_eq_zero.mp
    convert hz using 1 <;> abel
  have ha := sum_congr n i Z (by omega : k≠0) ht a.toNat b.toNat
  have hb := sum_congr n i Z (by omega : k≠0) ht (-a).toNat (-b).toNat
  rw [he] at ha
  have hab := J.sub_mem hb ha
  have ed (q:ℤ) : ((q.toNat:ℕ):(v.adicCompletionIntegers K))-(((-q).toNat:ℕ):(v.adicCompletionIntegers K))=(q:(v.adicCompletionIntegers K)) := by
    simpa only [Int.cast_sub,Int.cast_natCast] using congrArg (fun m:ℤ => (m:(v.adicCompletionIntegers K))) (show (q.toNat:ℤ)-((-q).toNat:ℤ)=q by omega)
  have hc : ((a:(v.adicCompletionIntegers K))+(b:(v.adicCompletionIntegers K))*i)*(Z ():(v.adicCompletionIntegers K))∈J := by
    convert hab using 1
    rw [←ed a,←ed b]
    ring
  obtain ⟨u,hu'⟩ := hu.exists_left_inv
  have ht2 : (Z ():(v.adicCompletionIntegers K))∈J := by simpa only [←mul_assoc,hu',one_mul] using J.mul_mem_left u hc
  have hh := (v.mem_maximalIdeal_pow_iff (K:=K)).mp ht2
  rw [hval,exp_le_exp] at hh
  push_cast at hh
  omega
end TunnellFormalPrimaryCM
end

/- TunnellGaussianDivisionField -/
section
namespace TunnellGaussianEnd
open TunnellCoates TunnellKummer WeierstrassCurve TunnellLocalCM TunnellLocalDivisibility
lemma iterate_compatible {A B : Type*} [AddCommGroup A] [AddCommGroup B]
    (f:A→+B) (I:A→+A) (J:B→+B) (h : ∀ x, J (f x)=f (I x)) (a b:ℤ) (r:ℕ) (x:A) :
    (endo J a b)^[r] (f x)=f ((endo I a b)^[r] x) := by
  induction r with
  | zero => rfl
  | succ r ih => rw [Function.iterate_succ_apply',Function.iterate_succ_apply',ih,endo_apply,endo_apply,h,map_add,map_zsmul,map_zsmul]
variable {F L : Type*} [Field F] [Field L] [Algebra F L] [DecidableEq F] [DecidableEq L]
  [FiniteDimensional F L]
end TunnellGaussianEnd
end

/- TunnellConjugateInertia -/
section
namespace TunnellConjugateInertia
open IsLocalRing IsDedekindDomain IsDedekindDomain.HeightOneSpectrum WeierstrassCurve WeierstrassCurve.Affine
open TunnellCoates TunnellGaussianEnd TunnellFormalQuarter TunnellKummer TunnellCMGlobalModelUnit
open scoped NumberField
noncomputable section
section Local
variable {R K:Type*} [CommRing R] [IsDedekindDomain R] [Field K] [CharZero K] [Algebra R K] [IsFractionRing R K]
    {v:HeightOneSpectrum R} [DecidableEq (v.adicCompletion K)] [DecidableEq (ResidueField (v.adicCompletionIntegers K))]
theorem kernel (n i:(v.adicCompletionIntegers K)) (hi:i^2= -1) {W:WeierstrassCurve (v.adicCompletion K)} [W.IsElliptic] [(E n).IsElliptic]
    (h:W=E (n:(v.adicCompletion K))) (a b:ℤ) (hu:IsUnit ((a:(v.adicCompletionIntegers K))+(b:(v.adicCompletionIntegers K))*i)) (r:ℕ) (P:W.toAffine.Point)
    (hred:adicRed ((base_curve n).trans h.symm) P=0)
    (hdiv:(endo (quarter h (i:(v.adicCompletion K)) (by exact_mod_cast hi)) a b)^[r] P=0) : P=0 := by
  subst W
  let I := TunnellLocalCM.gaussianI (n:(v.adicCompletion K)) (i:(v.adicCompletion K)) (by exact_mod_cast hi)
  let ψ := endo I a b
  let U := filtration (base_curve n) 0
  have he : quarter (n:=(n:(v.adicCompletion K))) rfl (i:(v.adicCompletion K)) (by exact_mod_cast hi)=I := by ext x; cases x <;> rfl
  rw [he] at hdiv
  have inside (z:(E n).formalGroupLaw.Points) : toPoint n z∈U :=
    (mem_pow_iff_formalPoint_mem_filtration (hW:=base_curve n) z 0).mp (by simpa using (z ()).2)
  have stable (T:(E (n:(v.adicCompletion K))).toAffine.Point) (ht:T∈U) : ψ T∈U := by
    obtain ⟨z,rfl⟩ := formalPoint_surjective (hW:=base_curve n) ht
    exact U.add_mem (U.zsmul_mem ht _) (U.zsmul_mem ((quarter_toPoint n i hi z) ▸ inside (quarterParam n i z)) _)
  have hk (T:(E (n:(v.adicCompletion K))).toAffine.Point) (ht:T∈U) (hz:ψ T=0) : T=0 := by
    obtain ⟨z,rfl⟩ := formalPoint_surjective (hW:=base_curve n) ht
    have hh := TunnellFormalPrimaryCM.unit_kernel n i hi a b hu z hz
    change toPoint n z=0
    rw [hh,map_zero]
  have ht : P∈U := (adicRed_eq_zero_iff (base_curve n)).mp hred
  change ψ^[r] P=0 at hdiv
  clear hred
  induction r generalizing P with
  | zero => exact hdiv
  | succ r ih =>
    rw [Function.iterate_succ_apply] at hdiv
    exact hk P ht (ih _ (stable P ht) hdiv)
theorem same (n i:(v.adicCompletionIntegers K)) (hi:i^2= -1) {W:WeierstrassCurve (v.adicCompletion K)} [W.IsElliptic] [(E n).IsElliptic]
    (h:W=E (n:(v.adicCompletion K))) (a b:ℤ) (hu:IsUnit ((a:(v.adicCompletionIntegers K))+(b:(v.adicCompletionIntegers K))*i)) (r:ℕ) (P Q:W.toAffine.Point)
    (hred:adicRed ((base_curve n).trans h.symm) P=adicRed ((base_curve n).trans h.symm) Q)
    (hdiv:(endo (quarter h (i:(v.adicCompletion K)) (by exact_mod_cast hi)) a b)^[r] P=
      (endo (quarter h (i:(v.adicCompletion K)) (by exact_mod_cast hi)) a b)^[r] Q) : P=Q := by
  apply sub_eq_zero.mp
  apply kernel n i hi h a b hu r
  · change adicRedHom ((base_curve n).trans h.symm) (P-Q)=0
    rw [map_sub,sub_eq_zero]; exact hred
  · let f:=endo (quarter h (i:(v.adicCompletion K)) (by exact_mod_cast hi)) a b
    have hh (s:ℕ) : f^[s] (P-Q)=f^[s] P-f^[s] Q := by
      induction s with
      | zero => rfl
      | succ s ih => rw [Function.iterate_succ_apply',Function.iterate_succ_apply',Function.iterate_succ_apply',ih,map_sub]
    exact (hh r).trans (sub_eq_zero.mpr hdiv)
end Local
variable {F N:Type*} [Field F] [Field N] [NumberField N] [Algebra F N] [DecidableEq N] [DecidableEq F]
    (v:HeightOneSpectrum (𝓞 N))
theorem inertia_fixes (n:ℕ) (i:F) [(E (n:F)).IsElliptic] (hi:i^2= -1)
    (j:(v.adicCompletionIntegers N)) (hj:j^2= -1) (hji:(j:(v.adicCompletion N))=algebraMap N (v.adicCompletion N) (algebraMap F N i))
    [DecidableEq (v.adicCompletion N)] [DecidableEq (ResidueField (v.adicCompletionIntegers N))] [(E (n:(v.adicCompletionIntegers N))).IsElliptic]
    (a b:ℤ) (hu:IsUnit ((a:(v.adicCompletionIntegers N))+(b:(v.adicCompletionIntegers N))*j)) (r:ℕ)
    (σ:Gal(N/F)) (hσ:σ∈v.asIdeal.inertia Gal(N/F)) (P:CurvePoints (E (n:F)) N)
    (hP:act (E (n:F)) σ ((endo (baseI (n:F) i hi) a b)^[r] P)=(endo (baseI (n:F) i hi) a b)^[r] P) :
    act (E (n:F)) σ P=P := by
  let W := E (n:F)
  let W' := W.baseChange N
  let W'' := W'.baseChange (v.adicCompletion N)
  letI : W'.IsElliptic := inferInstanceAs ((W.map (algebraMap F N)).IsElliptic)
  letI : W''.IsElliptic := inferInstanceAs ((W'.map (algebraMap N (v.adicCompletion N))).IsElliptic)
  have e : W''=E ((n:(v.adicCompletionIntegers N)):(v.adicCompletion N)) := by dsimp [W'',W',W]; rw [base_E,base_E,map_natCast,map_natCast]
  let M := pointMap W' (v.adicCompletion N)
  let I : AddMonoid.End (CurvePoints W N) := baseI (n:F) i hi
  let J := quarter e (j:(v.adicCompletion N)) (by exact_mod_cast hj)
  have compat (x:CurvePoints W N) : J (M x)=M (I x) := by
    cases x with
    | zero => rfl
    | some x y hh =>
      change Point.some _ _ _=Point.some _ _ _
      rw [Point.some.injEq]
      exact ⟨(map_neg _ _).symm,by change (j:(v.adicCompletion N))*algebraMap N (v.adicCompletion N) y=algebraMap N (v.adicCompletion N) (algebraMap F N i*y); rw [map_mul,hji]⟩
  have hp := iterate_compatible (act W σ) I I (act_baseI (n:F) i hi σ) a b r P
  apply pointMap_inj W' (v.adicCompletion N)
  apply same (n:(v.adicCompletionIntegers N)) j hj e a b hu r
  · exact TunnellCMGoodInertiaAction.reduction_invariant v W (E (n:(v.adicCompletionIntegers N))) _ σ hσ P
  · exact (iterate_compatible M I J compat a b r _).trans
      ((congrArg M (hp.trans hP)).trans (iterate_compatible M I J compat a b r _).symm)
end
end TunnellConjugateInertia
end

/- TunnellGaussianPrimeIdeal -/
section
namespace TunnellGaussianPrimeIdeal
open NumberField IsDedekindDomain IsDedekindDomain.HeightOneSpectrum IsLocalRing
open scoped Classical
noncomputable section
variable {F:Type} [Field F] [NumberField F]
def integralI (j:F) (hj:j^2= -1) : 𝓞 F:=⟨j,IsIntegral.of_pow (n:=2) (by decide) (by rw [hj]; exact isIntegral_one.neg)⟩
end
end TunnellGaussianPrimeIdeal
end

/- TunnellConjugatePrimeIndex -/
section
namespace TunnellConjugatePrimeIndex
open WeierstrassCurve WeierstrassCurve.Affine IsDedekindDomain IsDedekindDomain.HeightOneSpectrum NumberField IsLocalRing
open TunnellCoates TunnellKummer TunnellGaussianEnd TunnellGaussianPrimeIdeal
open scoped Classical
noncomputable section
variable {D N:Type} [Field D] [Field N] [NumberField D] [NumberField N] [Algebra D N]
variable (v:HeightOneSpectrum (𝓞 D)) (w:HeightOneSpectrum (𝓞 N)) [w.asIdeal.LiesOver v.asIdeal]
lemma unit_of_avoids (x:𝓞 N) (hx:x∉w.asIdeal) : IsUnit (algebraMap (𝓞 N) (adicCompletionIntegers N w) x) := by
  by_contra h
  have hv:=Valuation.Integer.not_isUnit_iff_valuation_lt_one.mp h
  have he:w.valuation N (x:N)=1:=w.valuation_eq_one_iff_notMem.mpr hx
  have he':Valued.v (algebraMap N (adicCompletion N w) (x:N))=1:=(w.valuedAdicCompletion_eq_valuation' _).trans he
  exact he'.not_lt hv
theorem good_at_p {p n:ℕ} (hp:p.Prime) (hn:¬p∣2*n) (hm:(p:𝓞 N)∈w.asIdeal) : (E (n:(adicCompletionIntegers N w))).IsElliptic := by
  have hv:= (w.valuation_lt_one_iff_mem (K:=N) (p:𝓞 N)).mpr hm
  have he:=w.valuedAdicCompletion_eq_valuation' (p:N)
  change Valued.v (algebraMap N (adicCompletion N w) (p:N))=_ at he
  rw [map_natCast] at he
  have hmem:(p:(adicCompletionIntegers N w))∈maximalIdeal (adicCompletionIntegers N w):=Valuation.Integer.not_isUnit_iff_valuation_lt_one.mpr (he ▸ hv)
  let k:=ResidueField (adicCompletionIntegers N w)
  haveI:CharP k p:=(CharP.charP_iff_prime_eq_zero hp).mpr (by simpa using (residue_eq_zero_iff _).mpr hmem)
  have hu (m:ℕ) (hm:¬p∣m) : IsUnit (m:(adicCompletionIntegers N w)) := by
    by_contra h
    have e:= (residue_eq_zero_iff _).mpr (show (m:(adicCompletionIntegers N w))∈maximalIdeal (adicCompletionIntegers N w) from h)
    rw [map_natCast] at e
    exact hm ((CharP.cast_eq_zero_iff k p m).mp e)
  constructor
  rw [TunnellCoates.E_discriminant,show (64:(adicCompletionIntegers N w))=(2:(adicCompletionIntegers N w))^6 by norm_num]
  exact ((hu 2 (fun h=>hn (dvd_mul_of_dvd_left h n))).pow 6).mul ((hu n (fun h=>hn (dvd_mul_of_dvd_right h 2))).pow 6)
theorem unramified [FiniteDimensional D N] [IsGalois D N] (n:ℕ) [(E (n:D)).IsElliptic]
    (j:𝓞 D) (hj:j^2= -1) (a b:ℤ) {p:ℕ} (hp:p.Prime) (hn:¬p∣2*n) (hm:(p:𝓞 D)∈v.asIdeal)
    (hunit:(a:𝓞 D)+(b:𝓞 D)*j∉v.asIdeal) (r:ℕ) {x y:N} (h:((E (n:D)).baseChange N).toAffine.Nonsingular x y)
    (hg:IntermediateField.adjoin D {x,y}=⊤)
    (hfixed:∀ σ:Gal(N/D),act (E (n:D)) σ ((endo (baseI (n:D) (j:D) (by exact_mod_cast hj)) a b)^[r] (.some x y h))=
      (endo (baseI (n:D) (j:D) (by exact_mod_cast hj)) a b)^[r] (.some x y h)) : w.asIdeal.ramificationIdx (𝓞 D)=1 := by
  let m:=algebraMap (𝓞 D) (𝓞 N)
  let f:=algebraMap (𝓞 N) (adicCompletionIntegers N w)
  let J:=f (m j)
  have hJ:J^2= -1:=by simp [J,←map_pow,hj]
  have hU:=unit_of_avoids w (m ((a:𝓞 D)+(b:𝓞 D)*j)) ((w.asIdeal.mem_of_liesOver v.asIdeal _).not.mp hunit)
  have hU':IsUnit ((a:(adicCompletionIntegers N w))+(b:(adicCompletionIntegers N w))*J):=by simpa [m,f,J] using hU
  have hp':(p:𝓞 N)∈w.asIdeal:=by simpa using (w.asIdeal.mem_of_liesOver v.asIdeal _).mp hm
  haveI: (E (n:(adicCompletionIntegers N w))).IsElliptic:=good_at_p w hp hn hp'
  apply TunnellCMGoodDivisionField.unramified_of_trivial w v
  apply le_antisymm _ bot_le
  intro σ hσ
  change σ=1
  have hS:=TunnellConjugateInertia.inertia_fixes w n (j:D) (by exact_mod_cast hj) J hJ rfl a b hU' r σ hσ (.some x y h) (hfixed σ)
  exact autos_eq_of_generate hg σ 1 (Point.some.inj hS).1 (Point.some.inj hS).2
end
end TunnellConjugatePrimeIndex
end

/- TunnellRelativeDivisionInertia -/
section
namespace TunnellRelativeDivisionInertia
open NumberField IsDedekindDomain IsDedekindDomain.HeightOneSpectrum WeierstrassCurve WeierstrassCurve.Affine
open TunnellCoates TunnellKummer TunnellCMTorsionField TunnellGaussianEnd TunnellGaussianPrimeIdeal
open scoped Classical
noncomputable section
variable {F D N:Type} [Field F] [Field D] [Field N] [NumberField F] [NumberField D] [NumberField N]
  [Algebra F D] [Algebra F N] [Algebra D N] [IsScalarTower F D N] [FiniteDimensional D N] [IsGalois D N]
variable (n:ℕ) [(E (n:F)).IsElliptic] [(E (n:D)).IsElliptic]
theorem unramified (i:F) (hi:i^2= -1) (a:GaussianInt) {p:ℕ} (hp:p.Prime) (hn:¬p∣2*n)
    (v:HeightOneSpectrum (𝓞 D)) (w:HeightOneSpectrum (𝓞 N)) [w.asIdeal.LiesOver v.asIdeal] (hm:(p:𝓞 D)∈v.asIdeal)
    (hunit:(a.re:𝓞 D)+(a.im:𝓞 D)*algebraMap (𝓞 F) (𝓞 D) (integralI i hi)∉v.asIdeal) (r:ℕ)
    {x y:N} (h:(((E (n:F))).baseChange N).toAffine.Nonsingular x y) (hg:IntermediateField.adjoin D {x,y}=⊤)
    (P:CurvePoints (E (n:F)) F) (hQ:cm (n:F) i hi (a^r) (.some x y h)=changeBase (E (n:F)) P) :
    w.asIdeal.ramificationIdx (𝓞 D)=1 := by
  let j:=algebraMap (𝓞 F) (𝓞 D) (integralI i hi)
  have hj:j^2= -1:=by
    have h':(integralI i hi)^2= -1:=Subtype.ext hi
    rw [show j=algebraMap (𝓞 F) (𝓞 D) (integralI i hi) from rfl,←map_pow,h',map_neg,map_one]
  have hji:algebraMap F D i=(j:D):=rfl
  obtain ⟨hq,eqQ⟩:=TunnellCMChangeBaseField.rebase_some (K:=D) n h
  apply TunnellConjugatePrimeIndex.unramified v w n j hj a.re a.im hp hn hm hunit r hq hg
  intro g
  have hsq(X:CurvePoints (E (n:D)) N):baseI (n:D) (j:D) (by exact_mod_cast hj) (baseI (n:D) (j:D) (by exact_mod_cast hj) X)= -X:=by
    haveI:(((E (n:D))).baseChange N).IsElliptic:=inferInstanceAs ((((E (n:D))).map (algebraMap D N)).IsElliptic)
    exact quarter_sq (base_E _) _ _ X
  rw [TunnellLocalCMCoordDegree.endo_iterate _ hsq a r]
  change act (E (n:D)) g (cm (n:D) (j:D) _ (a^r) (.some x y hq))=cm (n:D) (j:D) _ (a^r) (.some x y hq)
  rw [←eqQ,←TunnellCMChangeBaseField.cm_rebase n i (j:D) hi _ hji,hQ]
  cases P with
  | zero=>change act (E (n:D)) g (TunnellCMChangeBaseField.rebase n (changeBase (E (n:F)) 0))=TunnellCMChangeBaseField.rebase n (changeBase (E (n:F)) 0); simp only [map_zero]
  | some t z hh=>
    simp only [changeBase,Point.baseChange,Point.map_some,TunnellCMChangeBaseField.rebase,Point.equivOfEq_some]
    exact (Point.some.injEq ..).mpr ⟨(g.restrictScalars F).commutes t,(g.restrictScalars F).commutes z⟩
end
end TunnellRelativeDivisionInertia
end

/- TunnellPureOtherPrimes -/
section
namespace TunnellPureOtherPrimes
open NumberField IsDedekindDomain IsDedekindDomain.HeightOneSpectrum WeierstrassCurve WeierstrassCurve.Affine
open TunnellCoates TunnellKummer TunnellCMTorsionField TunnellGaussianEnd TunnellGaussianPrimeIdeal
open scoped Classical
noncomputable section
variable {F D N:Type} [Field F] [Field D] [Field N] [NumberField F] [NumberField D] [NumberField N]
  [Algebra F D] [Algebra F N] [Algebra D N] [IsScalarTower F D N] [FiniteDimensional D N] [IsGalois D N]
variable (n:ℕ) [(E (n:F)).IsElliptic] [(E (n:D)).IsElliptic]
theorem unramified [dF:DecidableEq F] [dN:DecidableEq N] (i:F) (hi:i^2= -1) (a:GaussianInt) {p:ℕ} (hp:p.Prime) (hn:¬p∣2*n)
    (v:HeightOneSpectrum (𝓞 D)) (w:HeightOneSpectrum (𝓞 N)) [w.asIdeal.LiesOver v.asIdeal] (hm:(p:𝓞 D)∈v.asIdeal)
    (hunit:(a.re:𝓞 D)+(a.im:𝓞 D)*algebraMap (𝓞 F) (𝓞 D) (integralI i hi)∉v.asIdeal) (r:ℕ)
    {x y:N} (h:(((E (n:F))).baseChange N).toAffine.Nonsingular x y) (hg:IntermediateField.adjoin D {x,y}=⊤)
    (P:CurvePoints (E (n:F)) F) (hQ:cm (n:F) i hi (a^r) (.some x y h)=changeBase (E (n:F)) P) :
    w.asIdeal.ramificationIdx (𝓞 D)=1 := by
  obtain rfl:dF=Classical.decEq F:=Subsingleton.elim _ _
  obtain rfl:dN=Classical.decEq N:=Subsingleton.elim _ _
  exact TunnellRelativeDivisionInertia.unramified n i hi a hp hn v w hm hunit r h hg P hQ
end
end TunnellPureOtherPrimes
end

/- TunnellIntrinsicGaussianLift -/
section
namespace TunnellIntrinsicGaussianLift
open WeierstrassCurve WeierstrassCurve.Affine NumberField IsDedekindDomain IntermediateField TunnellCoates TunnellKummer TunnellCMTorsionField TunnellGaussianEnd TunnellGaussianPrimeIdeal
open scoped Classical NumberField
noncomputable section
def Lift : Prop :=
  ∀(D N:Type)[Field D][Field N][NumberField D][NumberField N][Algebra D N][FiniteDimensional D N][IsGalois D N][DecidableEq D][DecidableEq N]
    (n p r:ℕ)(q:GaussianInt)(i:𝓞 D),p.Prime→¬p∣2*n→q.norm.natAbs=p→i^2= -1→
    let W:WeierstrassCurve D:=⟨0,0,0,-(n:D)^2,0⟩;let V:=(W.baseChange N).toAffine;let a:=q^r
    ∀(x y:N)(h:V.Nonsingular x y)(l:V.Nonsingular (-x) (algebraMap D N i*y))(P:(W.baseChange D).toAffine.Point),
    adjoin D {x,y}=⊤→a.re•(Point.some x y h)+a.im•(.some (-x) _ l)=Point.baseChange (W':=W.toAffine) D N P→
    (∃P':(W.baseChange D).toAffine.Point,p^r•(Point.some x y h)=Point.baseChange (W':=W.toAffine) D N P')∧
    ∀(v:HeightOneSpectrum (𝓞 D))(w:HeightOneSpectrum (𝓞 N)),(p:𝓞 D)∈v.asIdeal→(q.re:𝓞 D)+(q.im:𝓞 D)*i∉v.asIdeal→
      w.asIdeal.LiesOver v.asIdeal→w.asIdeal.ramificationIdx (𝓞 D)=1
theorem result : Lift := by
  intro D N _ _ _ _ _ _ _ dD dN n p r q i hp good hq hi W V a x y h l P gen eq
  obtain rfl:dD=Classical.decEq D:=Subsingleton.elim _ _
  obtain rfl:dN=Classical.decEq N:=Subsingleton.elim _ _
  have hn:n≠0:=by rintro rfl; simp at good
  haveI:(E (n:D)).IsElliptic:=E_elliptic (by norm_num) (by exact_mod_cast hn)
  have hs:(i:D)^2= -1:=by exact_mod_cast hi
  have hc:cm (n:D) (i:D) hs (q^r) (Point.some _ _ h)=changeBase (E (n:D)) P:=eq
  have hnorm:q.re^2+q.im^2=(p:ℤ):=by
    have e:q.norm=(p:ℤ):=(Int.natAbs_of_nonneg (GaussianInt.norm_nonneg _)).symm.trans (congrArg (fun x:ℕ=>(x:ℤ)) hq)
    simpa [Zsqrtd.norm,pow_two] using e
  constructor
  · obtain ⟨P₀,hr⟩:=TunnellCMKummerUnramified.rational_rebase (F:=D) (D:=D) n (i:D) hs (i:D) hs rfl q hnorm r P (Point.some _ _ h) hc
    have ee:TunnellCMChangeBaseField.rebase (F:=D) (K:=D) n (Point.some x y h)=Point.some x y h:=by
      obtain ⟨_,hh⟩:=TunnellCMChangeBaseField.rebase_some (F:=D) (K:=D) n h
      exact hh
    rw [ee] at hr
    exact ⟨P₀,hr⟩
  · intro v w hm hu hw
    letI:=hw
    have ee:integralI (i:D) hs=i:=Subtype.ext rfl
    have em:algebraMap (𝓞 D) (𝓞 D) i=i:=Subtype.ext rfl
    exact TunnellPureOtherPrimes.unramified (F:=D) n (i:D) hs q hp good v w hm (by exact hu) r h gen P hc
end
end TunnellIntrinsicGaussianLift
end

theorem OMA.solution : OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H2_R1_H1_R1.H2 := TunnellIntrinsicGaussianLift.result
