import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H2_R1_H1_R1
import Mathlib
namespace TunnellCMTorsionField
end TunnellCMTorsionField
namespace TunnellKummer
end TunnellKummer
/-
Portions adapted from EllipticCurves. The original Apache License is included below.
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
/- EllipticCurves.Mathlib.Basic -/
section
section
section Group
variable {G H : Type*} [Group G] [Group H]
end Group
section Units
variable {α : Type*} [Monoid α]
end Units
section modPow
namespace Units.modPow
variable {α β : Type*} [CommMonoid α] [CommMonoid β] {a b c : α}
open QuotientGroup
end Units.modPow
end modPow
section Ideal
end Ideal
section LinearAlgebra
end LinearAlgebra
section Valuation
open Polynomial
variable {L Γ : Type*} [CommRing L] [LinearOrderedCommGroupWithZero Γ] (ν : Valuation L Γ)
  {t a b : L}
end Valuation
section DedekindDomain
open IsDedekindDomain
variable {R : Type*} [CommRing R] [IsDedekindDomain R]
  {K : Type*} [Field K] [Algebra R K] [IsFractionRing R K]
variable (R) (B : Type*) [CommRing B] [IsDedekindDomain B] [Algebra R B]
namespace IsDiscreteValuationRing
variable (A : Type*) [CommRing A] [IsDomain A] [IsDiscreteValuationRing A]
variable {A}
end IsDiscreteValuationRing
namespace IsDedekindDomain.HeightOneSpectrum
variable {B C : Type*} [CommRing B] [IsDedekindDomain B] [CommRing C] [IsDedekindDomain C]
variable {L N : Type*} [Field L] [Algebra B L] [IsFractionRing B L]
  [Field N] [Algebra C N] [IsFractionRing C N]

theorem comap_maximalIdeal_adicCompletionIntegers (v : HeightOneSpectrum R) :
    (IsLocalRing.maximalIdeal (v.adicCompletionIntegers K)).comap
      (algebraMap R (v.adicCompletionIntegers K)) = v.asIdeal := by
  ext x
  rw [Ideal.mem_comap, ← valuation_lt_one_iff_mem (K := K)]
  refine (Valuation.mem_maximalIdeal_iff (v := (Valued.v : Valuation (v.adicCompletion K)
    (WithZero (Multiplicative ℤ))))).trans ?_
  rw [show ((algebraMap R (v.adicCompletionIntegers K) x : v.adicCompletionIntegers K) :
    v.adicCompletion K) = ((algebraMap R K x : K) : v.adicCompletion K) from rfl,
    valuedAdicCompletion_eq_valuation']
end IsDedekindDomain.HeightOneSpectrum
end DedekindDomain
namespace Polynomial
variable {R : Type*} [CommRing R] {g : R[X]}
section
variable [Nontrivial R] {q : R[X]} {n : ℕ}
end
section Sylvester
open Module LinearMap LinearEquiv
variable [Nontrivial R] {p : R[X]} {n : ℕ}
end Sylvester
end Polynomial
open Polynomial LinearMap LinearEquiv
namespace AdjoinRoot
variable {R : Type*} [CommRing R] {g : R[X]} {n : ℕ}
section Map
variable {S : Type*} [CommRing S] (σ : R →+* S)
end Map
end AdjoinRoot
section EtaleDecomposition
open Polynomial UniqueFactorizationMonoid
namespace Polynomial
variable {K : Type*} [Field K] {f : K[X]}
namespace Factors
end Factors
end Polynomial
namespace AdjoinRoot
variable {K : Type*} [Field K] {f : K[X]}
end AdjoinRoot
end EtaleDecomposition
section NumberField
open NumberField
variable (K L : Type*) [Field K] [Field L] [Algebra K L]
variable [NumberField K] [FiniteDimensional K L]
end NumberField
section Discriminant
open NumberField Module
variable {K : Type*} [Field K] [NumberField K]
end Discriminant
end
end

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

theorem constantCoeff_subst_of_constantCoeff_zero {τ : Type*}
    {a : τ → MvPowerSeries σ R} (ha : HasSubst a)
    (ha' : ∀ s, constantCoeff (a s) = 0) (f : MvPowerSeries τ R) :
    constantCoeff (subst a f) = constantCoeff f := by
  classical
  rw [constantCoeff_subst ha, finsum_eq_single _ 0 ?_]
  · simp
  · intro d hd
    obtain ⟨s, hs⟩ := Finsupp.support_nonempty_iff.mpr hd
    rw [Finsupp.prod, map_prod, smul_eq_mul,
      Finset.prod_eq_zero hs (by
        rw [map_pow, ha' s, zero_pow (Nat.pos_of_ne_zero
          (Finsupp.mem_support_iff.mp hs)).ne']), mul_zero]

theorem continuous_pderiv [TopologicalSpace R] [IsTopologicalSemiring R] (s : σ) :
    Continuous (pderiv R s : MvPowerSeries σ R → MvPowerSeries σ R) := by
  refine continuous_pi fun d ↦ ?_
  change Continuous fun h : MvPowerSeries σ R ↦ coeff d (pderiv R s h)
  simp only [coeff_pderiv]
  exact (WithPiTopology.continuous_coeff R _).mul continuous_const
theorem pderiv_subst_coe {τ : Type*} [Fintype τ] {a : τ → MvPowerSeries σ R}
    (ha : HasSubst a) (s : σ) (p : MvPolynomial τ R) :
    pderiv R s (subst a (p : MvPowerSeries τ R))
      = ∑ t : τ, subst a (pderiv R t (p : MvPowerSeries τ R)) * pderiv R s (a t) := by
  classical
  induction p using MvPolynomial.induction_on with
  | C c =>
    have hCc : subst a (C c : MvPowerSeries τ R) = C c := by
      rw [← coe_substAlgHom ha]
      exact (substAlgHom ha).commutes c
    have h0 : subst a (0 : MvPowerSeries τ R) = 0 := by
      rw [← MvPowerSeries.coe_substAlgHom ha]
      exact map_zero _
    rw [MvPolynomial.coe_C, hCc, pderiv_C]
    symm
    refine Finset.sum_eq_zero fun t _ ↦ ?_
    rw [pderiv_C, h0, zero_mul]
  | add p q hp hq =>
    push_cast
    rw [MvPowerSeries.subst_add ha, map_add, hp, hq, ← Finset.sum_add_distrib]
    refine Finset.sum_congr rfl fun t _ ↦ ?_
    rw [map_add, MvPowerSeries.subst_add ha]
    ring
  | mul_X p i ih =>
    push_cast
    rw [MvPowerSeries.subst_mul ha, MvPowerSeries.subst_X ha, Derivation.leibniz, smul_eq_mul,
      smul_eq_mul, ih]
    have hexp (t : τ) : subst a (pderiv R t ((p : MvPowerSeries τ R) * X i))
        = (if i = t then subst a (p : MvPowerSeries τ R) else 0)
          + a i * subst a (pderiv R t (p : MvPowerSeries τ R)) := by
      rw [Derivation.leibniz, smul_eq_mul, smul_eq_mul, pderiv_X, Pi.single_apply,
        MvPowerSeries.subst_add ha, MvPowerSeries.subst_mul ha,
        MvPowerSeries.subst_mul ha, MvPowerSeries.subst_X ha]
      split
      · rw [← MvPowerSeries.coe_substAlgHom ha, map_one, mul_one]
      · rw [← MvPowerSeries.coe_substAlgHom ha, map_zero, mul_zero]
    simp only [hexp, add_mul, ite_mul, zero_mul, Finset.sum_add_distrib,
      Finset.sum_ite_eq, Finset.mem_univ, if_true, Finset.mul_sum]
    congr 1
    refine Finset.sum_congr rfl fun t _ ↦ ?_
    ring
 
theorem pderiv_subst {τ : Type*} [Fintype τ] {a : τ → MvPowerSeries σ R}
    (ha : HasSubst a) (s : σ) (f : MvPowerSeries τ R) :
    pderiv R s (subst a f) = ∑ t : τ, subst a (pderiv R t f) * pderiv R s (a t) := by
  let : UniformSpace R := ⊥
  let : DiscreteTopology R := ⟨rfl⟩
  have key := MvPowerSeries.WithPiTopology.denseRange_toMvPowerSeries (σ := τ) (R := R)
  have h1 : Continuous fun f : MvPowerSeries τ R ↦ pderiv R s (subst a f) :=
    (continuous_pderiv s).comp (continuous_subst' ha)
  have h2 : Continuous fun f : MvPowerSeries τ R ↦
      ∑ t : τ, subst a (pderiv R t f) * pderiv R s (a t) :=
    continuous_finsetSum _ fun t _ ↦
      ((continuous_subst' ha).comp (continuous_pderiv t)).mul_const _
  exact congrFun (key.equalizer h1 h2 (funext (pderiv_subst_coe ha s))) f
 
theorem pderiv_comm (s t : σ) (h : MvPowerSeries σ R) :
    pderiv R s (pderiv R t h) = pderiv R t (pderiv R s h) := by
  ext d
  rw [coeff_pderiv, coeff_pderiv, coeff_pderiv, coeff_pderiv,
    add_right_comm d (Finsupp.single s 1) (Finsupp.single t 1)]
  rcases eq_or_ne s t with rfl | hst
  · ring
  · have h1 : (d + Finsupp.single s 1 : σ →₀ ℕ) t = d t := by
      rw [Finsupp.add_apply, Finsupp.single_eq_of_ne (Ne.symm hst), add_zero]
    have h2 : (d + Finsupp.single t 1 : σ →₀ ℕ) s = d s := by
      rw [Finsupp.add_apply, Finsupp.single_eq_of_ne hst, add_zero]
    rw [h1, h2]
    ring
 
theorem pderiv_subst_eq_zero {τ : Type*} [Finite τ] {a : τ → MvPowerSeries σ R}
    (ha : HasSubst a) (s : σ) (hz : ∀ t, pderiv R s (a t) = 0) (f : MvPowerSeries τ R) :
    pderiv R s (subst a f) = 0 := by
  cases nonempty_fintype τ
  rw [pderiv_subst ha]
  exact Finset.sum_eq_zero fun t _ ↦ by rw [hz t, mul_zero]
theorem coeff_X_mul_pderiv (s : σ) (f : MvPowerSeries σ R) (d : σ →₀ ℕ) :
    coeff d (X s * pderiv R s f) = ((d s : ℕ) : R) * coeff d f := by
  classical
  rw [mul_comm, show (X s : MvPowerSeries σ R) = monomial (Finsupp.single s 1) 1 from rfl,
    coeff_mul_monomial]
  rcases eq_or_ne (d s) 0 with h0 | h0
  · rw [if_neg fun hle ↦ by simpa [h0] using Finsupp.single_le_iff.mp hle, h0]
    simp
  · have hle : Finsupp.single s 1 ≤ d :=
      Finsupp.single_le_iff.mpr (Nat.one_le_iff_ne_zero.mpr h0)
    rw [if_pos hle, mul_one, coeff_pderiv, tsub_add_cancel_of_le hle, Finsupp.tsub_apply,
      Finsupp.single_eq_same, Nat.cast_sub (Nat.one_le_iff_ne_zero.mpr h0)]
    ring

theorem coeff_sum_X_mul_pderiv [Fintype σ] (f : MvPowerSeries σ R) (d : σ →₀ ℕ) :
    coeff d (∑ s, X s * pderiv R s f) = ((d.degree : ℕ) : R) * coeff d f := by
  rw [map_sum, Finset.sum_congr rfl fun s _ ↦ coeff_X_mul_pderiv s f d, ← Finset.sum_mul,
    Finsupp.degree_eq_sum]
  push_cast
  rfl
theorem coeff_rename_equiv {τ : Type*} (e : σ ≃ τ) (f : MvPowerSeries σ R) (d : τ →₀ ℕ) :
    coeff d (rename (⇑e) f) = coeff (Finsupp.equivMapDomain e.symm d) f := by
  have hemb : Finsupp.embDomain e.toEmbedding = Finsupp.equivMapDomain (M := ℕ) e := by
    funext v
    rw [Finsupp.embDomain_eq_mapDomain, Finsupp.equivMapDomain_eq_mapDomain]
    rfl
  have hd : Finsupp.embDomain e.toEmbedding (Finsupp.equivMapDomain e.symm d) = d := by
    rw [hemb, ← Finsupp.equivMapDomain_trans, Equiv.symm_trans_self,
      Finsupp.equivMapDomain_refl]
  calc coeff d (rename (⇑e) f)
      = coeff (Finsupp.embDomain e.toEmbedding (Finsupp.equivMapDomain e.symm d))
          (rename (⇑e) f) := by rw [hd]
    _ = coeff (Finsupp.equivMapDomain e.symm d) f := coeff_embDomain_rename _ _ _
 
theorem rename_pderiv {τ : Type*} (e : σ ≃ τ) (s : σ) (f : MvPowerSeries σ R) :
    rename (⇑e) (pderiv R s f) = pderiv R (e s) (rename (⇑e) f) := by
  ext d
  rw [coeff_pderiv, coeff_rename_equiv, coeff_rename_equiv, coeff_pderiv]
  have h1 : Finsupp.equivMapDomain e.symm (d + Finsupp.single (e s) 1)
      = Finsupp.equivMapDomain e.symm d + Finsupp.single s 1 := by
    ext t
    classical
    simp [Finsupp.single_apply, e.injective.eq_iff]
  have h2 : Finsupp.equivMapDomain e.symm d s = d (e s) := by simp
  rw [h1, h2]
 
theorem map_pderiv {S : Type*} [CommRing S] (f : R →+* S) (s : σ) (g : MvPowerSeries σ R) :
    map f (pderiv R s g) = pderiv S s (map f g) := by
  ext d
  rw [coeff_map, coeff_pderiv, coeff_pderiv, coeff_map, map_mul, map_add, map_natCast, map_one]
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

noncomputable def eval (z₀ : O) (h : O⟦X⟧) : O :=
  PowerSeries.eval₂ (RingHom.id O) z₀ h
theorem eval_eq_eval₂ (z₀ : O) (h : O⟦X⟧) : eval z₀ h = PowerSeries.eval₂ (RingHom.id O) z₀ h :=
  rfl
@[simp]
theorem eval_coe (f : Polynomial O) (z₀ : O) : eval z₀ (f : O⟦X⟧) = f.eval z₀ := by
  rw [eval_eq_eval₂, eval₂_coe, Polynomial.eval₂_id]
@[simp]
theorem eval_C (r : O) (z₀ : O) : eval z₀ (C r) = r :=
  eval₂_C _ _ r
@[simp]
theorem eval_X (z₀ : O) : eval z₀ (X : O⟦X⟧) = z₀ :=
  eval₂_X _ _
variable [IsLocalRing O] [Fact (IsAdic (maximalIdeal O))]
instance instIsLinearTopology : IsLinearTopology O O :=
  (Fact.out : IsAdic (maximalIdeal O)).isLinearTopology
instance instNonarchimedeanRing : NonarchimedeanRing O :=
  (Fact.out : IsAdic (maximalIdeal O)).nonarchimedeanRing
theorem isClosed_maximalIdeal : IsClosed ((maximalIdeal O : Ideal O) : Set O) := by
  have := IsAdic.isClosed_pow (I := maximalIdeal O) Fact.out 1
  simpa using this
 
theorem hasEval_of_mem {z₀ : O} (hz₀ : z₀ ∈ maximalIdeal O) : PowerSeries.HasEval z₀ :=
  (Fact.out : IsAdic (maximalIdeal O)).isTopologicallyNilpotent_of_mem hz₀
variable [IsUniformAddGroup O] [CompleteSpace O]
variable [T2Space O]
variable [IsTopologicalRing O]
variable {z₀ : O} (hz₀ : z₀ ∈ maximalIdeal O)
 
noncomputable def evalRingHom (hz₀ : z₀ ∈ maximalIdeal O) : O⟦X⟧ →+* O :=
  PowerSeries.eval₂Hom (φ := RingHom.id O) continuous_id (hasEval_of_mem hz₀)
theorem coe_evalRingHom : ⇑(evalRingHom hz₀) = eval z₀ :=
  coe_eval₂Hom (φ := RingHom.id O) continuous_id (hasEval_of_mem hz₀)
@[simp]
theorem evalRingHom_apply (h : O⟦X⟧) : evalRingHom hz₀ h = eval z₀ h :=
  congrFun (coe_evalRingHom hz₀) h
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

noncomputable def diffMatrix : Matrix ι ι (MvPowerSeries ι O) :=
  Matrix.of fun i j ↦ MvPowerSeries.subst
    (Sum.elim MvPowerSeries.X fun _ ↦ 0 : ι ⊕ ι → MvPowerSeries ι O)
    (MvPowerSeries.pderiv O (Sum.inr j) (Φ.F i))
variable [DecidableEq ι]
 
theorem diffMatrix_map_constantCoeff [Finite ι] :
    Φ.diffMatrix.map (constantCoeff (R := O)) = 1 := by
  cases nonempty_fintype ι
  ext i j
  rw [Matrix.map_apply, Matrix.one_apply]
  have hch := MvPowerSeries.pderiv_subst (hasSubst_unitL (O := O) (ι := ι)) j (Φ.F i)
  rw [Φ.zero_add' i, MvPowerSeries.pderiv_X] at hch
  have hsum : ∑ t : ι ⊕ ι,
      MvPowerSeries.subst (Sum.elim (fun _ ↦ 0) MvPowerSeries.X : ι ⊕ ι → _)
        (MvPowerSeries.pderiv O t (Φ.F i))
      * MvPowerSeries.pderiv O j
        ((Sum.elim (fun _ ↦ 0) MvPowerSeries.X : ι ⊕ ι → MvPowerSeries ι O) t)
      = MvPowerSeries.subst (Sum.elim (fun _ ↦ 0) MvPowerSeries.X : ι ⊕ ι → _)
        (MvPowerSeries.pderiv O (Sum.inr j) (Φ.F i)) := by
    rw [Fintype.sum_sum_type]
    simp [MvPowerSeries.pderiv_X, Pi.single_apply, mul_ite, Finset.sum_ite_eq']
  rw [hsum] at hch
  have h1 : constantCoeff (Φ.diffMatrix i j)
      = constantCoeff (MvPowerSeries.pderiv O (Sum.inr j) (Φ.F i)) :=
    MvPowerSeries.constantCoeff_subst_of_constantCoeff_zero hasSubst_unitR
      (by rintro (a | a) <;> simp) _
  have h2 : constantCoeff (MvPowerSeries.subst
        (Sum.elim (fun _ ↦ 0) MvPowerSeries.X : ι ⊕ ι → MvPowerSeries ι O)
        (MvPowerSeries.pderiv O (Sum.inr j) (Φ.F i)))
      = constantCoeff (MvPowerSeries.pderiv O (Sum.inr j) (Φ.F i)) :=
    MvPowerSeries.constantCoeff_subst_of_constantCoeff_zero hasSubst_unitL
      (by rintro (a | a) <;> simp) _
  rw [h1, ← h2, ← hch]
  simp [Pi.single_apply]
 
theorem isUnit_diffMatrix [Fintype ι] : IsUnit Φ.diffMatrix := by
  rw [Matrix.isUnit_iff_isUnit_det]
  have hdet : constantCoeff Φ.diffMatrix.det = 1 := by
    rw [RingHom.map_det, RingHom.mapMatrix_apply, Φ.diffMatrix_map_constantCoeff,
      Matrix.det_one]
  rw [MvPowerSeries.isUnit_iff_constantCoeff, hdet]
  exact isUnit_one
 
theorem diffMatrixInv_map_constantCoeff [Fintype ι] :
    Φ.diffMatrix⁻¹.map (constantCoeff (R := O)) = 1 := by
  have hNM : Φ.diffMatrix⁻¹ * Φ.diffMatrix = 1 :=
    Matrix.nonsing_inv_mul _ ((Matrix.isUnit_iff_isUnit_det _).mp Φ.isUnit_diffMatrix)
  have hmap := congrArg
    (fun A : Matrix ι ι (MvPowerSeries ι O) ↦ A.map (constantCoeff (R := O))) hNM
  simp only [Matrix.map_mul, Matrix.map_one (constantCoeff (R := O)) (map_zero _)
    (map_one _)] at hmap
  rw [Φ.diffMatrix_map_constantCoeff, mul_one] at hmap
  exact hmap
end diffMatrix
section baseChange
variable {O' : Type*} [CommRing O'] [Finite ι]

noncomputable def map (f : O →+* O') (Φ : FormalGroupLaw O ι) : FormalGroupLaw O' ι where
  F i := MvPowerSeries.map f (Φ.F i)
  zero_constantCoeff i := by
    rw [← coeff_zero_eq_constantCoeff_apply, coeff_map, coeff_zero_eq_constantCoeff_apply,
      Φ.zero_constantCoeff i, map_zero]
  add_zero' i := by
    have h := congrArg (MvPowerSeries.map f) (Φ.add_zero' i)
    rw [MvPowerSeries.map_subst (hasSubst_unitR), MvPowerSeries.map_X] at h
    rw [← h]
    congr 1
    funext s
    rcases s with j | j <;> simp
  zero_add' i := by
    have h := congrArg (MvPowerSeries.map f) (Φ.zero_add' i)
    rw [MvPowerSeries.map_subst (hasSubst_unitL), MvPowerSeries.map_X] at h
    rw [← h]
    congr 1
    funext s
    rcases s with j | j <;> simp
  comm' i := by
    have h := congrArg (MvPowerSeries.map f) (Φ.comm' i)
    rw [MvPowerSeries.map_subst (hasSubst_swap)] at h
    rw [← h]
    congr 1
    funext s
    simp
  assoc' i := by
    have hL : (fun s ↦ MvPowerSeries.map f (assocLeftFam Φ.F s))
        = assocLeftFam (fun j ↦ MvPowerSeries.map f (Φ.F j)) := by
      funext s
      rcases s with j | j
      · change MvPowerSeries.map f (MvPowerSeries.subst _ (Φ.F j)) = _
        rw [MvPowerSeries.map_subst (hasSubst_emb12 (O := O) (ι := ι))]
        congr 1
        funext s'; rcases s' with a | b <;> simp
      · simp [assocLeftFam]
    have hR : (fun s ↦ MvPowerSeries.map f (assocRightFam Φ.F s))
        = assocRightFam (fun j ↦ MvPowerSeries.map f (Φ.F j)) := by
      funext s
      rcases s with j | j
      · simp [assocRightFam]
      · change MvPowerSeries.map f (MvPowerSeries.subst _ (Φ.F j)) = _
        rw [MvPowerSeries.map_subst (hasSubst_emb23 (O := O) (ι := ι))]
        congr 1
        funext s'; rcases s' with a | b <;> simp
    have h := congrArg (MvPowerSeries.map f) (Φ.assoc' i)
    rw [MvPowerSeries.map_subst (hasSubst_assocLeft Φ),
      MvPowerSeries.map_subst (hasSubst_assocRight Φ), hL, hR] at h
    exact h
 
theorem diffMatrix_map (f : O →+* O') :
    (Φ.map f).diffMatrix = Φ.diffMatrix.map (MvPowerSeries.map f) := by
  refine Matrix.ext fun i j ↦ ?_
  rw [Matrix.map_apply]
  have hfam : (fun s ↦ MvPowerSeries.map f ((Sum.elim MvPowerSeries.X (fun _ ↦ 0)
        : ι ⊕ ι → MvPowerSeries ι O) s))
      = (Sum.elim MvPowerSeries.X (fun _ ↦ 0) : ι ⊕ ι → MvPowerSeries ι O') := by
    funext s; rcases s with a | a <;> simp
  calc (Φ.map f).diffMatrix i j
      = MvPowerSeries.subst (Sum.elim MvPowerSeries.X (fun _ ↦ 0)
            : ι ⊕ ι → MvPowerSeries ι O')
          (MvPowerSeries.map f (pderiv O (Sum.inr j) (Φ.F i))) := by
        rw [MvPowerSeries.map_pderiv]; rfl
    _ = MvPowerSeries.map f (MvPowerSeries.subst
          (Sum.elim MvPowerSeries.X (fun _ ↦ 0) : ι ⊕ ι → MvPowerSeries ι O)
          (pderiv O (Sum.inr j) (Φ.F i))) := by
        rw [MvPowerSeries.map_subst hasSubst_unitR, hfam]
    _ = MvPowerSeries.map f (Φ.diffMatrix i j) := rfl
variable [Fintype ι] [DecidableEq ι]

theorem diffMatrixInv_map (f : O →+* O') :
    (Φ.map f).diffMatrix⁻¹ = Φ.diffMatrix⁻¹.map (MvPowerSeries.map f) := by
  have hunit := (Matrix.isUnit_iff_isUnit_det _).mp Φ.isUnit_diffMatrix
  refine Matrix.inv_eq_left_inv ?_
  rw [diffMatrix_map, ← RingHom.mapMatrix_apply, ← RingHom.mapMatrix_apply, ← map_mul,
    Matrix.nonsing_inv_mul _ hunit, map_one]
end baseChange
end FormalGroupLaw
end ChabautyColeman
end
end

/- EllipticCurves.Mathlib.Chabauty.FormalGroupLaw.Invariance -/
section
section
open MvPowerSeries IsLocalRing Filter Topology
open scoped MvPowerSeries.WithPiTopology
namespace ChabautyColeman
namespace FormalGroupLaw
variable {O : Type*} [CommRing O] {ι : Type*} (Φ : FormalGroupLaw O ι)
lemma eq_zero_of_transpose_mul_mul {R : Type*} [CommRing R] [Fintype ι]
    [DecidableEq ι] {M B : Matrix ι ι R} (hM : IsUnit M.det) (h : M.transpose * B * M = 0) :
    B = 0 := by
  calc B = M.transpose⁻¹ * M.transpose * B * (M * M⁻¹) := by
        rw [Matrix.nonsing_inv_mul _ (Matrix.isUnit_det_transpose _ hM),
          Matrix.mul_nonsing_inv _ hM, one_mul, mul_one]
    _ = M.transpose⁻¹ * (M.transpose * B * M) * M⁻¹ := by
        simp only [Matrix.mul_assoc]
    _ = 0 := by rw [h, mul_zero, zero_mul]
section invariance
open MvPowerSeries
lemma subst_zero' {τ : Type*} {a : τ → MvPowerSeries (ι ⊕ ι) O}
    (ha : MvPowerSeries.HasSubst a) :
    MvPowerSeries.subst a (0 : MvPowerSeries τ O) = 0 := by
  rw [← coe_substAlgHom ha]
  exact map_zero _
lemma subst_unitR_pderiv_F (a k : ι) :
    MvPowerSeries.subst (Sum.elim MvPowerSeries.X (fun _ ↦ 0) : ι ⊕ ι → MvPowerSeries ι O)
        (pderiv O (Sum.inr k) (Φ.F a))
      = Φ.diffMatrix a k := rfl
lemma rename_sumComm_F (j : ι) :
    rename (⇑(Equiv.sumComm ι ι)) (Φ.F j) = Φ.F j := by
  rw [rename_eq_subst]
  exact Φ.comm' j
variable [Finite ι]
lemma hasSubst_F : MvPowerSeries.HasSubst fun j : ι ↦ Φ.F j :=
  hasSubst_of_constantCoeff_zero fun j ↦ Φ.zero_constantCoeff j
lemma hasSubst_Yemb :
    MvPowerSeries.HasSubst fun s : ι ↦ (X (Sum.inr s) : MvPowerSeries (ι ⊕ ι) O) :=
  hasSubst_of_constantCoeff_zero fun s ↦ by simp
lemma hasSubst_C0 :
    MvPowerSeries.HasSubst
      (Sum.elim (fun a : ι ↦ X (Sum.inl a))
        (Sum.elim (fun b : ι ↦ X (Sum.inr b)) fun _ ↦ 0)
        : ι ⊕ ι ⊕ ι → MvPowerSeries (ι ⊕ ι) O) := by
  refine hasSubst_of_constantCoeff_zero ?_
  rintro (a | b | c) <;> simp
lemma subst_C0_assocLeft (h : MvPowerSeries (ι ⊕ ι) O) :
    MvPowerSeries.subst
        (Sum.elim (fun a : ι ↦ X (Sum.inl a))
          (Sum.elim (fun b : ι ↦ X (Sum.inr b)) fun _ ↦ 0))
        (MvPowerSeries.subst (assocLeftFam Φ.F) h)
      = MvPowerSeries.subst (Sum.elim (fun j : ι ↦ Φ.F j) fun _ ↦ 0) h := by
  rw [subst_comp_subst_apply (hasSubst_assocLeft Φ) hasSubst_C0]
  congr 1
  funext t
  rcases t with j | j
  · change MvPowerSeries.subst _ (MvPowerSeries.subst _ (Φ.F j)) = _
    rw [subst_comp_subst_apply hasSubst_emb12 hasSubst_C0]
    have hfam : (fun s : ι ⊕ ι ↦ MvPowerSeries.subst
          (Sum.elim (fun a : ι ↦ X (Sum.inl a))
            (Sum.elim (fun b : ι ↦ X (Sum.inr b)) fun _ ↦ 0))
          ((Sum.elim (fun a : ι ↦ X (Sum.inl a)) fun b : ι ↦ X (Sum.inr (Sum.inl b))
            : ι ⊕ ι → MvPowerSeries (ι ⊕ ι ⊕ ι) O) s))
        = fun s : ι ⊕ ι ↦ (X s : MvPowerSeries (ι ⊕ ι) O) := by
      funext s
      rcases s with a | b <;>
        simp [MvPowerSeries.subst_X hasSubst_C0]
    rw [hfam, subst_self]
    rfl
  · change MvPowerSeries.subst _ (X (Sum.inr (Sum.inr j)) : MvPowerSeries (ι ⊕ ι ⊕ ι) O) = _
    rw [MvPowerSeries.subst_X hasSubst_C0]
    rfl
lemma subst_F_diffMatrix (i k : ι) :
    MvPowerSeries.subst (fun j : ι ↦ Φ.F j) (Φ.diffMatrix i k)
      = MvPowerSeries.subst (Sum.elim (fun j : ι ↦ Φ.F j) fun _ ↦ 0)
          (pderiv O (Sum.inr k) (Φ.F i)) := by
  change MvPowerSeries.subst _ (MvPowerSeries.subst _ (pderiv O (Sum.inr k) (Φ.F i))) = _
  rw [subst_comp_subst_apply hasSubst_unitR (hasSubst_F Φ)]
  congr 1
  funext t
  rcases t with a | a
  · change MvPowerSeries.subst _ (X a : MvPowerSeries ι O) = _
    rw [MvPowerSeries.subst_X (hasSubst_F Φ)]
    rfl
  · change MvPowerSeries.subst _ (0 : MvPowerSeries ι O) = _
    rw [subst_zero' (hasSubst_F Φ)]
    rfl
lemma subst_F_Yzero (j : ι) :
    MvPowerSeries.subst
        (Sum.elim (fun a : ι ↦ (X (Sum.inr a) : MvPowerSeries (ι ⊕ ι) O)) fun _ ↦ 0)
        (Φ.F j)
      = X (Sum.inr j) := by
  have hax := congrArg
    (MvPowerSeries.subst fun s : ι ↦ (X (Sum.inr s) : MvPowerSeries (ι ⊕ ι) O))
    (Φ.add_zero' j)
  rw [MvPowerSeries.subst_X hasSubst_Yemb, subst_comp_subst_apply hasSubst_unitR hasSubst_Yemb]
    at hax
  rw [← hax]
  congr 1
  funext t
  rcases t with a | a <;>
    simp [MvPowerSeries.subst_X hasSubst_Yemb, subst_zero' hasSubst_Yemb]
lemma subst_C0_assocRight (h : MvPowerSeries (ι ⊕ ι) O) :
    MvPowerSeries.subst
        (Sum.elim (fun a : ι ↦ X (Sum.inl a))
          (Sum.elim (fun b : ι ↦ X (Sum.inr b)) fun _ ↦ 0))
        (MvPowerSeries.subst (assocRightFam Φ.F) h)
      = h := by
  rw [subst_comp_subst_apply (hasSubst_assocRight Φ) hasSubst_C0]
  have hfam : (fun t : ι ⊕ ι ↦ MvPowerSeries.subst
        (Sum.elim (fun a : ι ↦ X (Sum.inl a))
          (Sum.elim (fun b : ι ↦ X (Sum.inr b)) fun _ ↦ 0))
        (assocRightFam Φ.F t))
      = fun t : ι ⊕ ι ↦ (X t : MvPowerSeries (ι ⊕ ι) O) := by
    funext t
    rcases t with j | j
    · change MvPowerSeries.subst _ (X (Sum.inl j) : MvPowerSeries (ι ⊕ ι ⊕ ι) O) = _
      rw [MvPowerSeries.subst_X hasSubst_C0]
      rfl
    · change MvPowerSeries.subst _ (MvPowerSeries.subst _ (Φ.F j)) = _
      rw [subst_comp_subst_apply hasSubst_emb23 hasSubst_C0]
      have hfam2 : (fun s : ι ⊕ ι ↦ MvPowerSeries.subst
            (Sum.elim (fun a : ι ↦ X (Sum.inl a))
              (Sum.elim (fun b : ι ↦ X (Sum.inr b)) fun _ ↦ 0))
            ((Sum.elim (fun a : ι ↦ X (Sum.inr (Sum.inl a)))
              fun b : ι ↦ X (Sum.inr (Sum.inr b))
              : ι ⊕ ι → MvPowerSeries (ι ⊕ ι ⊕ ι) O) s))
          = (Sum.elim (fun a : ι ↦ (X (Sum.inr a) : MvPowerSeries (ι ⊕ ι) O)) fun _ ↦ 0) := by
        funext s
        rcases s with a | b <;> simp [MvPowerSeries.subst_X hasSubst_C0]
      rw [hfam2, subst_F_Yzero]
  rw [hfam, subst_self]
  rfl
lemma subst_C0_emb23_pderiv (j k : ι) :
    MvPowerSeries.subst
        (Sum.elim (fun a : ι ↦ X (Sum.inl a))
          (Sum.elim (fun b : ι ↦ X (Sum.inr b)) fun _ ↦ 0))
        (MvPowerSeries.subst
          (Sum.elim (fun a : ι ↦ X (Sum.inr (Sum.inl a))) fun b : ι ↦ X (Sum.inr (Sum.inr b))
            : ι ⊕ ι → MvPowerSeries (ι ⊕ ι ⊕ ι) O)
          (pderiv O (Sum.inr k) (Φ.F j)))
      = MvPowerSeries.subst (fun s : ι ↦ (X (Sum.inr s) : MvPowerSeries (ι ⊕ ι) O))
          (Φ.diffMatrix j k) := by
  rw [subst_comp_subst_apply hasSubst_emb23 hasSubst_C0]
  change _ = MvPowerSeries.subst _ (MvPowerSeries.subst _ (pderiv O (Sum.inr k) (Φ.F j)))
  rw [subst_comp_subst_apply hasSubst_unitR hasSubst_Yemb]
  congr 1
  funext t
  rcases t with a | a
  · change MvPowerSeries.subst _ (X (Sum.inr (Sum.inl a)) : MvPowerSeries (ι ⊕ ι ⊕ ι) O)
      = MvPowerSeries.subst _ (X a : MvPowerSeries ι O)
    rw [MvPowerSeries.subst_X hasSubst_C0, MvPowerSeries.subst_X hasSubst_Yemb]
    rfl
  · change MvPowerSeries.subst _ (X (Sum.inr (Sum.inr a)) : MvPowerSeries (ι ⊕ ι ⊕ ι) O)
      = MvPowerSeries.subst _ (0 : MvPowerSeries ι O)
    rw [MvPowerSeries.subst_X hasSubst_C0, subst_zero' hasSubst_Yemb]
    rfl
lemma subst_unitR_Yemb (h : MvPowerSeries ι O) :
    MvPowerSeries.subst (Sum.elim MvPowerSeries.X (fun _ ↦ 0) : ι ⊕ ι → MvPowerSeries ι O)
        (MvPowerSeries.subst (fun s : ι ↦ (X (Sum.inr s) : MvPowerSeries (ι ⊕ ι) O)) h)
      = C (constantCoeff h) := by
  rw [subst_comp_subst_apply (hasSubst_Yemb) (hasSubst_unitR)]
  have hfam : (fun s : ι ↦ MvPowerSeries.subst
        (Sum.elim MvPowerSeries.X (fun _ ↦ 0) : ι ⊕ ι → MvPowerSeries ι O)
        (X (Sum.inr s) : MvPowerSeries (ι ⊕ ι) O))
      = (0 : ι → MvPowerSeries ι O) := by
    funext s
    rw [MvPowerSeries.subst_X (hasSubst_unitR)]
    rfl
  rw [hfam, subst_zero_eq_C_constantCoeff]
  rw [Algebra.algebraMap_self, MvPowerSeries.map_id]
  rfl
lemma subst_unitR_F (h : MvPowerSeries ι O) :
    MvPowerSeries.subst (Sum.elim MvPowerSeries.X (fun _ ↦ 0) : ι ⊕ ι → MvPowerSeries ι O)
        (MvPowerSeries.subst (fun j : ι ↦ Φ.F j) h)
      = h := by
  rw [subst_comp_subst_apply (hasSubst_F Φ) (hasSubst_unitR)]
  have hfam : (fun j : ι ↦ MvPowerSeries.subst
        (Sum.elim MvPowerSeries.X (fun _ ↦ 0) : ι ⊕ ι → MvPowerSeries ι O) (Φ.F j))
      = MvPowerSeries.X :=
    funext fun j ↦ Φ.add_zero' j
  rw [hfam, subst_self]
  rfl
lemma coeff_F_symm (i k l : ι) :
    coeff (Finsupp.single (Sum.inl l) 1 + Finsupp.single (Sum.inr k) 1) (Φ.F i)
      = coeff (Finsupp.single (Sum.inl k) 1 + Finsupp.single (Sum.inr l) 1) (Φ.F i) := by
  have hren : rename (Sum.swap : ι ⊕ ι → ι ⊕ ι) (Φ.F i) = Φ.F i := by
    rw [rename_eq_subst]
    exact Φ.comm' i
  have hemb := coeff_embDomain_rename (⟨Sum.swap, Sum.swap_leftInverse.injective⟩ : ι ⊕ ι ↪ ι ⊕ ι)
    (Φ.F i) (Finsupp.single (Sum.inr l) 1 + Finsupp.single (Sum.inl k) 1)
  rw [Finsupp.embDomain_add, Finsupp.embDomain_single, Finsupp.embDomain_single] at hemb
  change coeff (Finsupp.single (Sum.inl l) 1 + Finsupp.single (Sum.inr k) 1)
    (rename Sum.swap (Φ.F i)) = _ at hemb
  rw [hren] at hemb
  rw [hemb, add_comm]
lemma pderiv_substLeft (i : ι) (k : ι) :
    pderiv O (Sum.inr (Sum.inr k)) (MvPowerSeries.subst (assocLeftFam Φ.F) (Φ.F i))
      = MvPowerSeries.subst (assocLeftFam Φ.F) (pderiv O (Sum.inr k) (Φ.F i)) := by
  classical
  cases nonempty_fintype ι
  rw [pderiv_subst (hasSubst_assocLeft Φ)]
  rw [Fintype.sum_sum_type]
  have hinl (j : ι) : pderiv O (Sum.inr (Sum.inr k)) (assocLeftFam Φ.F (Sum.inl j)) = 0 := by
    refine pderiv_subst_eq_zero hasSubst_emb12 _ ?_ _
    rintro (a | b) <;> simp
  have hinr (j : ι) : pderiv O (Sum.inr (Sum.inr k)) (assocLeftFam Φ.F (Sum.inr j))
      = if j = k then 1 else 0 := by
    change pderiv O (Sum.inr (Sum.inr k)) (X (Sum.inr (Sum.inr j))
      : MvPowerSeries (ι ⊕ ι ⊕ ι) O) = _
    simp [pderiv_X, Pi.single_apply]
  simp only [hinl, hinr, mul_zero, mul_ite, mul_one, Finset.sum_const_zero, zero_add]
  rw [Finset.sum_ite_eq' Finset.univ k
    fun j ↦ MvPowerSeries.subst (assocLeftFam Φ.F) (pderiv O (Sum.inr j) (Φ.F i)),
    if_pos (Finset.mem_univ k)]
lemma pderiv_emb23 (j k : ι) :
    pderiv O (Sum.inr (Sum.inr k)) (MvPowerSeries.subst
        (Sum.elim (fun a : ι ↦ X (Sum.inr (Sum.inl a))) fun b : ι ↦ X (Sum.inr (Sum.inr b))
          : ι ⊕ ι → MvPowerSeries (ι ⊕ ι ⊕ ι) O)
        (Φ.F j))
      = MvPowerSeries.subst
          (Sum.elim (fun a : ι ↦ X (Sum.inr (Sum.inl a))) fun b : ι ↦ X (Sum.inr (Sum.inr b))
            : ι ⊕ ι → MvPowerSeries (ι ⊕ ι ⊕ ι) O)
          (pderiv O (Sum.inr k) (Φ.F j)) := by
  classical
  cases nonempty_fintype ι
  rw [pderiv_subst hasSubst_emb23, Fintype.sum_sum_type]
  have hinl (a : ι) : pderiv O (Sum.inr (Sum.inr k))
      (X (Sum.inr (Sum.inl a)) : MvPowerSeries (ι ⊕ ι ⊕ ι) O) = 0 := by
    simp
  have hinr (b : ι) : pderiv O (Sum.inr (Sum.inr k))
      (X (Sum.inr (Sum.inr b)) : MvPowerSeries (ι ⊕ ι ⊕ ι) O) = if b = k then 1 else 0 := by
    simp [pderiv_X, Pi.single_apply]
  simp only [Sum.elim_inl, Sum.elim_inr, hinl, hinr, mul_zero, mul_ite, mul_one,
    Finset.sum_const_zero, zero_add]
  rw [Finset.sum_ite_eq' Finset.univ k
    fun b ↦ MvPowerSeries.subst
      (Sum.elim (fun a : ι ↦ X (Sum.inr (Sum.inl a))) fun b : ι ↦ X (Sum.inr (Sum.inr b))
        : ι ⊕ ι → MvPowerSeries (ι ⊕ ι ⊕ ι) O)
      (pderiv O (Sum.inr b) (Φ.F j)),
    if_pos (Finset.mem_univ k)]
lemma pderiv_Yemb (l : ι) (h : MvPowerSeries ι O) :
    pderiv O (Sum.inr l) (MvPowerSeries.subst
        (fun s : ι ↦ (X (Sum.inr s) : MvPowerSeries (ι ⊕ ι) O)) h)
      = MvPowerSeries.subst (fun s : ι ↦ (X (Sum.inr s) : MvPowerSeries (ι ⊕ ι) O))
          (pderiv O l h) := by
  classical
  cases nonempty_fintype ι
  rw [pderiv_subst (hasSubst_Yemb)]
  have hx (t : ι) : pderiv O (Sum.inr l) (X (Sum.inr t) : MvPowerSeries (ι ⊕ ι) O)
      = if t = l then 1 else 0 := by
    simp [pderiv_X, Pi.single_apply]
  simp only [hx, mul_ite, mul_one, mul_zero]
  rw [Finset.sum_ite_eq' Finset.univ l
    fun t ↦ MvPowerSeries.subst (fun s : ι ↦ (X (Sum.inr s) : MvPowerSeries (ι ⊕ ι) O))
      (pderiv O t h),
    if_pos (Finset.mem_univ l)]
lemma pderiv_unitR (l : ι) (h : MvPowerSeries (ι ⊕ ι) O) :
    pderiv O l (MvPowerSeries.subst
        (Sum.elim MvPowerSeries.X (fun _ ↦ 0) : ι ⊕ ι → MvPowerSeries ι O) h)
      = MvPowerSeries.subst (Sum.elim MvPowerSeries.X (fun _ ↦ 0) : ι ⊕ ι → MvPowerSeries ι O)
          (pderiv O (Sum.inl l) h) := by
  classical
  cases nonempty_fintype ι
  rw [pderiv_subst (hasSubst_unitR), Fintype.sum_sum_type]
  have hinl (a : ι) : pderiv O l ((Sum.elim MvPowerSeries.X (fun _ ↦ 0)
      : ι ⊕ ι → MvPowerSeries ι O) (Sum.inl a)) = if a = l then 1 else 0 := by
    change pderiv O l (MvPowerSeries.X a : MvPowerSeries ι O) = _
    simp [pderiv_X, Pi.single_apply]
  have hinr (b : ι) : pderiv O l ((Sum.elim MvPowerSeries.X (fun _ ↦ 0)
      : ι ⊕ ι → MvPowerSeries ι O) (Sum.inr b)) = 0 := by
    change pderiv O l (0 : MvPowerSeries ι O) = 0
    exact map_zero _
  simp only [hinl, hinr, mul_ite, mul_one, mul_zero, Finset.sum_const_zero, add_zero]
  rw [Finset.sum_ite_eq' Finset.univ l
    fun a ↦ MvPowerSeries.subst
      (Sum.elim MvPowerSeries.X (fun _ ↦ 0) : ι ⊕ ι → MvPowerSeries ι O)
      (pderiv O (Sum.inl a) h),
    if_pos (Finset.mem_univ l)]
lemma constantCoeff_pderiv_diffMatrix (i k l : ι) :
    constantCoeff (pderiv O l (Φ.diffMatrix i k))
      = coeff (Finsupp.single (Sum.inl l) 1 + Finsupp.single (Sum.inr k) 1) (Φ.F i) := by
  classical
  rw [show Φ.diffMatrix i k = MvPowerSeries.subst
      (Sum.elim MvPowerSeries.X (fun _ ↦ 0) : ι ⊕ ι → MvPowerSeries ι O)
      (pderiv O (Sum.inr k) (Φ.F i)) from rfl,
    pderiv_unitR,
    MvPowerSeries.constantCoeff_subst_of_constantCoeff_zero (hasSubst_unitR)
      (by rintro (a | a) <;> simp),
    ← coeff_zero_eq_constantCoeff_apply, coeff_pderiv, coeff_pderiv]
  simp
lemma hasSubst_Xemb :
    MvPowerSeries.HasSubst fun s : ι ↦ (X (Sum.inl s) : MvPowerSeries (ι ⊕ ι) O) :=
  hasSubst_of_constantCoeff_zero fun s ↦ by simp
lemma rename_sumComm_subst_F (h : MvPowerSeries ι O) :
    rename (⇑(Equiv.sumComm ι ι)) (MvPowerSeries.subst (fun j : ι ↦ Φ.F j) h)
      = MvPowerSeries.subst (fun j : ι ↦ Φ.F j) h := by
  rw [rename_eq_subst, subst_comp_subst_apply (hasSubst_F Φ) (HasSubst.X_comp _)]
  congr 1
  funext j
  exact (rename_eq_subst _ _).symm.trans (rename_sumComm_F Φ j)
lemma rename_sumComm_Yemb (h : MvPowerSeries ι O) :
    rename (⇑(Equiv.sumComm ι ι)) (MvPowerSeries.subst
        (fun s : ι ↦ (X (Sum.inr s) : MvPowerSeries (ι ⊕ ι) O)) h)
      = MvPowerSeries.subst (fun s : ι ↦ (X (Sum.inl s) : MvPowerSeries (ι ⊕ ι) O)) h := by
  rw [rename_eq_subst, subst_comp_subst_apply hasSubst_Yemb (HasSubst.X_comp _)]
  congr 1
  funext s
  rw [MvPowerSeries.subst_X (HasSubst.X_comp _)]
  rfl
lemma pderiv_Xemb (l : ι) (h : MvPowerSeries ι O) :
    pderiv O (Sum.inl l) (MvPowerSeries.subst
        (fun s : ι ↦ (X (Sum.inl s) : MvPowerSeries (ι ⊕ ι) O)) h)
      = MvPowerSeries.subst (fun s : ι ↦ (X (Sum.inl s) : MvPowerSeries (ι ⊕ ι) O))
          (pderiv O l h) := by
  classical
  cases nonempty_fintype ι
  rw [pderiv_subst (hasSubst_Xemb)]
  have hx (t : ι) : pderiv O (Sum.inl l) (X (Sum.inl t) : MvPowerSeries (ι ⊕ ι) O)
      = if t = l then 1 else 0 := by
    simp [pderiv_X, Pi.single_apply]
  simp only [hx, mul_ite, mul_one, mul_zero]
  rw [Finset.sum_ite_eq' Finset.univ l
    fun t ↦ MvPowerSeries.subst (fun s : ι ↦ (X (Sum.inl s) : MvPowerSeries (ι ⊕ ι) O))
      (pderiv O t h),
    if_pos (Finset.mem_univ l)]
variable [Fintype ι]
lemma pderiv_substRight (i k : ι) :
    pderiv O (Sum.inr (Sum.inr k)) (MvPowerSeries.subst (assocRightFam Φ.F) (Φ.F i))
      = ∑ j, MvPowerSeries.subst (assocRightFam Φ.F) (pderiv O (Sum.inr j) (Φ.F i))
          * MvPowerSeries.subst
              (Sum.elim (fun a : ι ↦ X (Sum.inr (Sum.inl a)))
                fun b : ι ↦ X (Sum.inr (Sum.inr b))
                : ι ⊕ ι → MvPowerSeries (ι ⊕ ι ⊕ ι) O)
              (pderiv O (Sum.inr k) (Φ.F j)) := by
  classical
  rw [pderiv_subst (hasSubst_assocRight Φ), Fintype.sum_sum_type]
  have hinl (j : ι) : pderiv O (Sum.inr (Sum.inr k)) (assocRightFam Φ.F (Sum.inl j)) = 0 := by
    change pderiv O (Sum.inr (Sum.inr k)) (X (Sum.inl j) : MvPowerSeries (ι ⊕ ι ⊕ ι) O) = 0
    simp
  simp only [hinl, mul_zero, Finset.sum_const_zero, zero_add]
  refine Finset.sum_congr rfl fun j _ ↦ ?_
  congr 1
  exact pderiv_emb23 Φ j k

theorem diffMatrix_subst_F (i k : ι) :
    MvPowerSeries.subst (fun j : ι ↦ Φ.F j) (Φ.diffMatrix i k)
      = ∑ j, pderiv O (Sum.inr j) (Φ.F i)
          * MvPowerSeries.subst (fun s : ι ↦ (X (Sum.inr s) : MvPowerSeries (ι ⊕ ι) O))
              (Φ.diffMatrix j k) := by
  have hax := congrArg
    (MvPowerSeries.subst
      (Sum.elim (fun a : ι ↦ X (Sum.inl a))
        (Sum.elim (fun b : ι ↦ X (Sum.inr b)) fun _ ↦ 0)
        : ι ⊕ ι ⊕ ι → MvPowerSeries (ι ⊕ ι) O))
    (congrArg (pderiv O (Sum.inr (Sum.inr k))) (Φ.assoc' i))
  rw [pderiv_substLeft, pderiv_substRight, subst_C0_assocLeft] at hax
  rw [← coe_substAlgHom hasSubst_C0, map_sum] at hax
  rw [subst_F_diffMatrix, hax]
  refine Finset.sum_congr rfl fun j _ ↦ ?_
  rw [map_mul, coe_substAlgHom hasSubst_C0, subst_C0_assocRight, subst_C0_emb23_pderiv]
variable [DecidableEq ι]

theorem diffMatrixInv_subst_F (i k : ι) :
    ∑ a, MvPowerSeries.subst (fun j : ι ↦ Φ.F j) (Φ.diffMatrix⁻¹ i a)
        * pderiv O (Sum.inr k) (Φ.F a)
      = MvPowerSeries.subst (fun s : ι ↦ (X (Sum.inr s) : MvPowerSeries (ι ⊕ ι) O))
          (Φ.diffMatrix⁻¹ i k) := by
  have hdet := (Matrix.isUnit_iff_isUnit_det _).mp Φ.isUnit_diffMatrix
  set SF := (substAlgHom (R := O) (hasSubst_F Φ)).mapMatrix (m := ι) with hSF
  set SY := (substAlgHom (R := O) (hasSubst_Yemb (O := O) (ι := ι))).mapMatrix (m := ι)
    with hSY
  set D : Matrix ι ι (MvPowerSeries (ι ⊕ ι) O) :=
    Matrix.of fun i j ↦ pderiv O (Sum.inr j) (Φ.F i) with hD
  have h1 : SF Φ.diffMatrix⁻¹ * SF Φ.diffMatrix = 1 := by
    rw [← map_mul, Matrix.nonsing_inv_mul _ hdet, map_one]
  have h2 : SY Φ.diffMatrix * SY Φ.diffMatrix⁻¹ = 1 := by
    rw [← map_mul, Matrix.mul_nonsing_inv _ hdet, map_one]
  have hMF : SF Φ.diffMatrix = D * SY Φ.diffMatrix := by
    refine Matrix.ext fun i k ↦ ?_
    simp only [hSF, hSY, hD, AlgHom.mapMatrix_apply, Matrix.map_apply, Matrix.mul_apply,
      Matrix.of_apply, coe_substAlgHom]
    exact Φ.diffMatrix_subst_F i k
  have key : SF Φ.diffMatrix⁻¹ * D = SY Φ.diffMatrix⁻¹ := by
    calc SF Φ.diffMatrix⁻¹ * D
        = SF Φ.diffMatrix⁻¹ * D * (SY Φ.diffMatrix * SY Φ.diffMatrix⁻¹) := by
          rw [h2, mul_one]
      _ = SF Φ.diffMatrix⁻¹ * (D * SY Φ.diffMatrix) * SY Φ.diffMatrix⁻¹ := by
          simp only [Matrix.mul_assoc]
      _ = SF Φ.diffMatrix⁻¹ * SF Φ.diffMatrix * SY Φ.diffMatrix⁻¹ := by rw [← hMF]
      _ = SY Φ.diffMatrix⁻¹ := by rw [h1, one_mul]
  have hik := congrFun (congrFun key i) k
  simpa only [hSF, hSY, hD, AlgHom.mapMatrix_apply, Matrix.map_apply, Matrix.mul_apply,
    Matrix.of_apply, coe_substAlgHom] using hik
lemma pderiv_inr_expand (i k l : ι) :
    pderiv O (Sum.inr l) (∑ a, MvPowerSeries.subst (fun j : ι ↦ Φ.F j) (Φ.diffMatrix⁻¹ i a)
        * pderiv O (Sum.inr k) (Φ.F a))
      = (∑ a, ∑ b, MvPowerSeries.subst (fun j : ι ↦ Φ.F j) (pderiv O b (Φ.diffMatrix⁻¹ i a))
            * pderiv O (Sum.inr l) (Φ.F b) * pderiv O (Sum.inr k) (Φ.F a))
        + ∑ a, MvPowerSeries.subst (fun j : ι ↦ Φ.F j) (Φ.diffMatrix⁻¹ i a)
            * pderiv O (Sum.inr l) (pderiv O (Sum.inr k) (Φ.F a)) := by
  rw [map_sum]
  have hterm (a : ι) : pderiv O (Sum.inr l)
      (MvPowerSeries.subst (fun j : ι ↦ Φ.F j) (Φ.diffMatrix⁻¹ i a)
        * pderiv O (Sum.inr k) (Φ.F a))
      = (∑ b, MvPowerSeries.subst (fun j : ι ↦ Φ.F j) (pderiv O b (Φ.diffMatrix⁻¹ i a))
            * pderiv O (Sum.inr l) (Φ.F b) * pderiv O (Sum.inr k) (Φ.F a))
        + MvPowerSeries.subst (fun j : ι ↦ Φ.F j) (Φ.diffMatrix⁻¹ i a)
            * pderiv O (Sum.inr l) (pderiv O (Sum.inr k) (Φ.F a)) := by
    rw [Derivation.leibniz, smul_eq_mul, smul_eq_mul,
      mul_comm (pderiv O (Sum.inr k) (Φ.F a)), pderiv_subst (hasSubst_F Φ),
      Finset.sum_mul, add_comm]
  rw [Finset.sum_congr rfl fun a _ ↦ hterm a, Finset.sum_add_distrib]
lemma subst_Yemb_pderiv_sub (i k l : ι) :
    MvPowerSeries.subst (fun s : ι ↦ (X (Sum.inr s) : MvPowerSeries (ι ⊕ ι) O))
        (pderiv O l (Φ.diffMatrix⁻¹ i k) - pderiv O k (Φ.diffMatrix⁻¹ i l))
      = ∑ a, ∑ b,
          MvPowerSeries.subst (fun j : ι ↦ Φ.F j)
              (pderiv O b (Φ.diffMatrix⁻¹ i a) - pderiv O a (Φ.diffMatrix⁻¹ i b))
            * pderiv O (Sum.inr k) (Φ.F a) * pderiv O (Sum.inr l) (Φ.F b) := by
  have hkl := congrArg (pderiv O (Sum.inr l)) (diffMatrixInv_subst_F Φ i k)
  have hlk := congrArg (pderiv O (Sum.inr k)) (diffMatrixInv_subst_F Φ i l)
  rw [pderiv_inr_expand, pderiv_Yemb] at hkl hlk
  rw [← coe_substAlgHom (hasSubst_Yemb), map_sub,
    coe_substAlgHom (hasSubst_Yemb), ← hkl, ← hlk]
  have hsecond : ∑ a, MvPowerSeries.subst (fun j : ι ↦ Φ.F j) (Φ.diffMatrix⁻¹ i a)
        * pderiv O (Sum.inr l) (pderiv O (Sum.inr k) (Φ.F a))
      = ∑ a, MvPowerSeries.subst (fun j : ι ↦ Φ.F j) (Φ.diffMatrix⁻¹ i a)
        * pderiv O (Sum.inr k) (pderiv O (Sum.inr l) (Φ.F a)) :=
    Finset.sum_congr rfl fun a _ ↦ by rw [pderiv_comm]
  rw [hsecond, add_sub_add_right_eq_sub]
  have hT2 : ∑ a, ∑ b, MvPowerSeries.subst (fun j : ι ↦ Φ.F j)
        (pderiv O b (Φ.diffMatrix⁻¹ i a))
        * pderiv O (Sum.inr k) (Φ.F b) * pderiv O (Sum.inr l) (Φ.F a)
      = ∑ a, ∑ b, MvPowerSeries.subst (fun j : ι ↦ Φ.F j)
        (pderiv O a (Φ.diffMatrix⁻¹ i b))
        * pderiv O (Sum.inr k) (Φ.F a) * pderiv O (Sum.inr l) (Φ.F b) :=
    Finset.sum_comm
  rw [hT2, ← Finset.sum_sub_distrib]
  refine Finset.sum_congr rfl fun a _ ↦ ?_
  rw [← Finset.sum_sub_distrib]
  refine Finset.sum_congr rfl fun b _ ↦ ?_
  have hS : MvPowerSeries.subst (fun j : ι ↦ Φ.F j)
      (pderiv O b (Φ.diffMatrix⁻¹ i a) - pderiv O a (Φ.diffMatrix⁻¹ i b))
      = MvPowerSeries.subst (fun j : ι ↦ Φ.F j) (pderiv O b (Φ.diffMatrix⁻¹ i a))
        - MvPowerSeries.subst (fun j : ι ↦ Φ.F j) (pderiv O a (Φ.diffMatrix⁻¹ i b)) := by
    rw [← coe_substAlgHom (hasSubst_F Φ), map_sub]
  rw [hS]
  ring
lemma closedness_C_eq (i k l : ι) :
    C (constantCoeff (pderiv O l (Φ.diffMatrix⁻¹ i k) - pderiv O k (Φ.diffMatrix⁻¹ i l)))
      = ∑ a, ∑ b, (pderiv O b (Φ.diffMatrix⁻¹ i a) - pderiv O a (Φ.diffMatrix⁻¹ i b))
          * Φ.diffMatrix a k * Φ.diffMatrix b l := by
  have h := congrArg (MvPowerSeries.subst
    (Sum.elim MvPowerSeries.X (fun _ ↦ 0) : ι ⊕ ι → MvPowerSeries ι O))
    (subst_Yemb_pderiv_sub Φ i k l)
  rw [subst_unitR_Yemb] at h
  rw [h, ← coe_substAlgHom (hasSubst_unitR), map_sum]
  refine Finset.sum_congr rfl fun a _ ↦ ?_
  rw [map_sum]
  refine Finset.sum_congr rfl fun b _ ↦ ?_
  rw [map_mul, map_mul, coe_substAlgHom (hasSubst_unitR), subst_unitR_F Φ,
    subst_unitR_pderiv_F Φ, subst_unitR_pderiv_F Φ]
lemma constantCoeff_pderiv_diffMatrixInv (i k l : ι) :
    constantCoeff (pderiv O l (Φ.diffMatrix⁻¹ i k))
      = - constantCoeff (pderiv O l (Φ.diffMatrix i k)) := by
  have hNM : Φ.diffMatrix⁻¹ * Φ.diffMatrix = 1 :=
    Matrix.nonsing_inv_mul _ ((Matrix.isUnit_iff_isUnit_det _).mp Φ.isUnit_diffMatrix)
  have hik := congrFun (congrFun hNM i) k
  rw [Matrix.mul_apply, Matrix.one_apply] at hik
  have h := congrArg (fun g ↦ constantCoeff (pderiv O l g)) hik
  have hN (j : ι) : constantCoeff (Φ.diffMatrix⁻¹ i j) = if i = j then 1 else 0 := by
    have hc := congrFun (congrFun (diffMatrixInv_map_constantCoeff Φ) i) j
    rwa [Matrix.map_apply, Matrix.one_apply] at hc
  have hM (j : ι) : constantCoeff (Φ.diffMatrix j k) = if j = k then 1 else 0 := by
    have hc := congrFun (congrFun Φ.diffMatrix_map_constantCoeff j) k
    rwa [Matrix.map_apply, Matrix.one_apply] at hc
  have hrhs : constantCoeff (pderiv O l (if i = k then (1 : MvPowerSeries ι O) else 0)) = 0 := by
    split <;> simp
  simp only [map_sum, Derivation.leibniz, smul_eq_mul, map_add, map_mul, hN, hM, hrhs, ite_mul,
    one_mul, zero_mul, Finset.sum_add_distrib, Finset.sum_ite_eq, Finset.sum_ite_eq',
    Finset.mem_univ, if_true] at h
  linear_combination h
lemma closedness_sum_eq_zero (i k l : ι) :
    ∑ a, ∑ b, (pderiv O b (Φ.diffMatrix⁻¹ i a) - pderiv O a (Φ.diffMatrix⁻¹ i b))
        * Φ.diffMatrix a k * Φ.diffMatrix b l
      = 0 := by
  rw [← closedness_C_eq Φ i k l, map_sub, constantCoeff_pderiv_diffMatrixInv Φ,
    constantCoeff_pderiv_diffMatrixInv Φ, constantCoeff_pderiv_diffMatrix Φ,
    constantCoeff_pderiv_diffMatrix Φ, coeff_F_symm Φ, neg_sub_neg, sub_self, map_zero]

theorem pderiv_diffMatrixInv_symm (i k l : ι) :
    pderiv O l (Φ.diffMatrix⁻¹ i k) = pderiv O k (Φ.diffMatrix⁻¹ i l) := by
  set A : Matrix ι ι (MvPowerSeries ι O) :=
    Matrix.of fun a b ↦ pderiv O b (Φ.diffMatrix⁻¹ i a) - pderiv O a (Φ.diffMatrix⁻¹ i b)
    with hA
  have hMAM : Φ.diffMatrix.transpose * A * Φ.diffMatrix = 0 := by
    refine Matrix.ext fun k l ↦ ?_
    calc (Φ.diffMatrix.transpose * A * Φ.diffMatrix) k l
        = ∑ a, ∑ b, A a b * Φ.diffMatrix a k * Φ.diffMatrix b l := by
          simp only [Matrix.mul_apply, Matrix.transpose_apply, Finset.sum_mul]
          rw [Finset.sum_comm]
          exact Finset.sum_congr rfl fun a _ ↦ Finset.sum_congr rfl fun b _ ↦ by ring
      _ = 0 := by
          simp only [hA, Matrix.of_apply]
          exact closedness_sum_eq_zero Φ i k l
  have h := congrFun (congrFun (eq_zero_of_transpose_mul_mul
    ((Matrix.isUnit_iff_isUnit_det _).mp Φ.isUnit_diffMatrix) hMAM) k) l
  simp only [hA, Matrix.of_apply, Matrix.zero_apply] at h
  exact sub_eq_zero.mp (by simpa using h)
lemma diffMatrixInv_subst_F_inl (i k : ι) :
    ∑ a, MvPowerSeries.subst (fun j : ι ↦ Φ.F j) (Φ.diffMatrix⁻¹ i a)
        * pderiv O (Sum.inl k) (Φ.F a)
      = MvPowerSeries.subst (fun s : ι ↦ (X (Sum.inl s) : MvPowerSeries (ι ⊕ ι) O))
          (Φ.diffMatrix⁻¹ i k) := by
  have h := congrArg (rename (⇑(Equiv.sumComm ι ι))) (diffMatrixInv_subst_F Φ i k)
  rw [map_sum, rename_sumComm_Yemb] at h
  rw [← h]
  refine Finset.sum_congr rfl fun a _ ↦ ?_
  rw [map_mul, rename_sumComm_subst_F, rename_pderiv, rename_sumComm_F]
  rfl
end invariance
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

/- EllipticCurves.Mathlib.Chabauty.LocalRing -/
section
section
open IsLocalRing

theorem isUnit_natCast_of_not_dvd {O : Type*} [CommRing O] [IsLocalRing O] {p : ℕ}
    (hp : p.Prime) (hpmem : (p : O) ∈ maximalIdeal O) {n : ℕ} (hn : ¬ p ∣ n) :
    IsUnit (n : O) := by
  by_contra hu
  have hmem : (n : O) ∈ maximalIdeal O := hu
  obtain ⟨a, b, hab⟩ := (hp.coprime_iff_not_dvd.mpr hn).symm.cast (R := O)
  have h1 : (1 : O) ∈ maximalIdeal O := by
    rw [← hab]
    exact Ideal.add_mem _ (Ideal.mul_mem_left _ _ hmem) (Ideal.mul_mem_left _ _ hpmem)
  exact (maximalIdeal.isMaximal O).ne_top (Ideal.eq_top_of_isUnit_mem _ h1 isUnit_one)
end
end

/- EllipticCurves.Mathlib.Chabauty.FormalGroupLaw.Log -/
section
section
open MvPowerSeries IsLocalRing Filter Topology
open scoped MvPowerSeries.WithPiTopology
namespace ChabautyColeman
section euler
variable {ι K : Type*} [Field K]

noncomputable def eulerAntideriv (g : MvPowerSeries ι K) : MvPowerSeries ι K :=
  fun d ↦ (d.degree : K)⁻¹ * MvPowerSeries.coeff d g
theorem coeff_eulerAntideriv (g : MvPowerSeries ι K) (d : ι →₀ ℕ) :
    MvPowerSeries.coeff d (eulerAntideriv g)
      = (d.degree : K)⁻¹ * MvPowerSeries.coeff d g := rfl
@[simp]
theorem constantCoeff_eulerAntideriv (g : MvPowerSeries ι K) :
    constantCoeff (eulerAntideriv g) = 0 := by
  rw [← coeff_zero_eq_constantCoeff_apply, coeff_eulerAntideriv]
  simp
end euler
namespace FormalGroupLaw
section log
variable {K : Type*} [Field K] {ι : Type*} [Fintype ι] [DecidableEq ι]
variable (Φ : FormalGroupLaw K ι)

noncomputable def log (i : ι) : MvPowerSeries ι K :=
  eulerAntideriv (∑ j, Φ.diffMatrix⁻¹ i j * MvPowerSeries.X j)
@[simp]
theorem constantCoeff_log (i : ι) : constantCoeff (Φ.log i) = 0 :=
  constantCoeff_eulerAntideriv _
lemma pderiv_log_row (i k : ι) :
    pderiv K k (∑ j, Φ.diffMatrix⁻¹ i j * MvPowerSeries.X j)
      = (∑ j, MvPowerSeries.X j * pderiv K j (Φ.diffMatrix⁻¹ i k)) + Φ.diffMatrix⁻¹ i k := by
  rw [map_sum]
  have hterm (j : ι) : pderiv K k (Φ.diffMatrix⁻¹ i j * MvPowerSeries.X j)
      = MvPowerSeries.X j * pderiv K j (Φ.diffMatrix⁻¹ i k)
        + if j = k then Φ.diffMatrix⁻¹ i j else 0 := by
    rw [Derivation.leibniz, smul_eq_mul, smul_eq_mul, pderiv_X,
      Φ.pderiv_diffMatrixInv_symm i j k, add_comm]
    simp only [Pi.single_apply, mul_ite, mul_one, mul_zero]
  rw [Finset.sum_congr rfl fun j _ ↦ hterm j, Finset.sum_add_distrib,
    Finset.sum_ite_eq' Finset.univ k fun j ↦ Φ.diffMatrix⁻¹ i j,
    if_pos (Finset.mem_univ k)]
variable [CharZero K]

theorem pderiv_log (i k : ι) :
    pderiv K k (Φ.log i) = Φ.diffMatrix⁻¹ i k := by
  ext d
  have hdeg : (d + Finsupp.single k 1).degree = d.degree + 1 := by
    rw [map_add, Finsupp.degree_single]
  have hn : ((d.degree + 1 : ℕ) : K) ≠ 0 := Nat.cast_ne_zero.mpr d.degree.succ_ne_zero
  have hkey := congrArg (coeff (R := K) d) (pderiv_log_row Φ i k)
  rw [map_add, coeff_pderiv, coeff_sum_X_mul_pderiv] at hkey
  rw [coeff_pderiv, log, coeff_eulerAntideriv, hdeg, mul_assoc, hkey,
    show ((d.degree : ℕ) : K) * coeff d (Φ.diffMatrix⁻¹ i k) + coeff d (Φ.diffMatrix⁻¹ i k)
        = ((d.degree + 1 : ℕ) : K) * coeff d (Φ.diffMatrix⁻¹ i k) by push_cast; ring,
    inv_mul_cancel_left₀ hn]
lemma pderiv_inr_log_subst (i k : ι) :
    pderiv K (Sum.inr k) (MvPowerSeries.subst (fun j : ι ↦ Φ.F j) (Φ.log i))
      = pderiv K (Sum.inr k)
          (MvPowerSeries.subst (fun s : ι ↦ (X (Sum.inl s) : MvPowerSeries (ι ⊕ ι) K))
              (Φ.log i)
            + MvPowerSeries.subst (fun s : ι ↦ (X (Sum.inr s) : MvPowerSeries (ι ⊕ ι) K))
              (Φ.log i)) := by
  have hsum : pderiv K (Sum.inr k) (MvPowerSeries.subst (fun j : ι ↦ Φ.F j) (Φ.log i))
      = ∑ a, MvPowerSeries.subst (fun j : ι ↦ Φ.F j) (Φ.diffMatrix⁻¹ i a)
          * pderiv K (Sum.inr k) (Φ.F a) := by
    rw [pderiv_subst (hasSubst_F Φ)]
    exact Finset.sum_congr rfl fun a _ ↦ by rw [Φ.pderiv_log i a]
  rw [map_add, hsum, diffMatrixInv_subst_F Φ i k, pderiv_Yemb, Φ.pderiv_log i k,
    pderiv_subst_eq_zero hasSubst_Xemb (Sum.inr k) (fun _ ↦ by simp) (Φ.log i), zero_add]
lemma pderiv_inl_log_subst (i k : ι) :
    pderiv K (Sum.inl k) (MvPowerSeries.subst (fun j : ι ↦ Φ.F j) (Φ.log i))
      = pderiv K (Sum.inl k)
          (MvPowerSeries.subst (fun s : ι ↦ (X (Sum.inl s) : MvPowerSeries (ι ⊕ ι) K))
              (Φ.log i)
            + MvPowerSeries.subst (fun s : ι ↦ (X (Sum.inr s) : MvPowerSeries (ι ⊕ ι) K))
              (Φ.log i)) := by
  have hsum : pderiv K (Sum.inl k) (MvPowerSeries.subst (fun j : ι ↦ Φ.F j) (Φ.log i))
      = ∑ a, MvPowerSeries.subst (fun j : ι ↦ Φ.F j) (Φ.diffMatrix⁻¹ i a)
          * pderiv K (Sum.inl k) (Φ.F a) := by
    rw [pderiv_subst (hasSubst_F Φ)]
    exact Finset.sum_congr rfl fun a _ ↦ by rw [Φ.pderiv_log i a]
  rw [map_add, hsum, diffMatrixInv_subst_F_inl Φ i k, pderiv_Xemb, Φ.pderiv_log i k,
    pderiv_subst_eq_zero hasSubst_Yemb (Sum.inl k) (fun _ ↦ by simp) (Φ.log i), add_zero]

theorem log_subst_F (i : ι) :
    MvPowerSeries.subst (fun j : ι ↦ Φ.F j) (Φ.log i)
      = MvPowerSeries.subst (fun s : ι ↦ (X (Sum.inl s) : MvPowerSeries (ι ⊕ ι) K))
          (Φ.log i)
        + MvPowerSeries.subst (fun s : ι ↦ (X (Sum.inr s) : MvPowerSeries (ι ⊕ ι) K))
          (Φ.log i) := by
  refine pderiv.ext (fun s ↦ ?_) ?_
  · rcases s with k | k
    · exact pderiv_inl_log_subst Φ i k
    · exact pderiv_inr_log_subst Φ i k
  · rw [map_add,
      MvPowerSeries.constantCoeff_subst_of_constantCoeff_zero (hasSubst_F Φ)
        (fun j ↦ Φ.zero_constantCoeff j),
      MvPowerSeries.constantCoeff_subst_of_constantCoeff_zero (hasSubst_Xemb)
        (fun s ↦ by simp),
      MvPowerSeries.constantCoeff_subst_of_constantCoeff_zero hasSubst_Yemb
        (fun s ↦ by simp),
      constantCoeff_log]
    ring
end log
section logBaseChange
variable {O K : Type*} [CommRing O] [Field K] {ι : Type*} [Fintype ι] [DecidableEq ι]
variable (Φ : FormalGroupLaw O ι)
variable [IsLocalRing O] {p : ℕ}
end logBaseChange
section logConvergence
variable {O K : Type*} [CommRing O] [IsLocalRing O] [UniformSpace O]
  [Fact (IsAdic (maximalIdeal O))] [Field K] {ι : Type*} [Fintype ι] [DecidableEq ι]
  (Φ : FormalGroupLaw O ι) {p : ℕ}
end logConvergence
end FormalGroupLaw
end ChabautyColeman
end
end

/- EllipticCurves.Mathlib.Chabauty.LogIso -/
section
section
open MvPowerSeries IsLocalRing Filter Topology ChabautyColeman.MvPSeries
namespace ChabautyColeman.FormalGroupLaw
section Helpers
variable {O : Type*} [CommRing O] {ι : Type*} {K : Type*} [CommRing K]
  {f : O →+* K} {p : ℕ}
theorem map_injective_of_injective (hf : Function.Injective f) :
    Function.Injective (MvPowerSeries.map (σ := ι) f) := fun φ ψ h ↦ by
  ext d; exact hf (by rw [← coeff_map, ← coeff_map, h])
end Helpers
variable {O : Type*} [CommRing O] [IsDomain O] [IsLocalRing O] [UniformSpace O]
  [Fact (IsAdic (maximalIdeal O))] [IsUniformAddGroup O] [CompleteSpace O] [T2Space O]
  [IsTopologicalRing O] {ι : Type*} [Fintype ι] [DecidableEq ι]
  {K : Type*} [Field K] [CharZero K] {f : O →+* K} {p : ℕ}
section ScaledF
variable {O : Type*} [CommRing O] {ι : Type*} (Φ : FormalGroupLaw O ι) (p : ℕ)
end ScaledF
section ScaledFTop
variable {O : Type*} [CommRing O] [IsLocalRing O] [UniformSpace O]
  [Fact (IsAdic (maximalIdeal O))] {ι : Type*} [Finite ι]
  (Φ : FormalGroupLaw O ι) {p : ℕ}
end ScaledFTop
section Descent
variable {O : Type*} [CommRing O] {ι : Type*} [Finite ι] {K : Type*} [Field K]
  {f : O →+* K} {p : ℕ} (Φ : FormalGroupLaw O ι)
end Descent
section DescentLog
variable {O : Type*} [CommRing O] {ι : Type*} [Fintype ι] [DecidableEq ι]
  {K : Type*} [Field K] {f : O →+* K} {p : ℕ} (Φ : FormalGroupLaw O ι)
variable [CharZero K]
end DescentLog
section AddHom
variable {O : Type*} [CommRing O] [IsDomain O] [IsLocalRing O] [UniformSpace O]
  [Fact (IsAdic (maximalIdeal O))] [IsUniformAddGroup O] [CompleteSpace O] [T2Space O]
  [IsTopologicalRing O] {ι : Type*} [Fintype ι] [DecidableEq ι]
  {K : Type*} [Field K] [CharZero K] {f : O →+* K} {p : ℕ}
end AddHom
section ScaledLogDef
variable {O : Type*} [CommRing O] [IsLocalRing O] [UniformSpace O]
  [Fact (IsAdic (maximalIdeal O))] {ι : Type*} [Fintype ι] [DecidableEq ι]
  {K : Type*} [Field K] {f : O →+* K} {p : ℕ} (Φ : FormalGroupLaw O ι)
end ScaledLogDef
section ScaledLogEval
variable {O : Type*} [CommRing O] [IsDomain O] [IsLocalRing O] [UniformSpace O]
  [Fact (IsAdic (maximalIdeal O))] [IsUniformAddGroup O] [CompleteSpace O] [T2Space O]
  [IsTopologicalRing O] {ι : Type*} [Fintype ι] [DecidableEq ι]
  {K : Type*} [Field K] [CharZero K] {f : O →+* K} {p : ℕ} (Φ : FormalGroupLaw O ι)
end ScaledLogEval
end ChabautyColeman.FormalGroupLaw
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

noncomputable def mulSeries : ℕ → MvPowerSeries Unit O
  | 0 => 0
  | m + 1 => MvPowerSeries.subst
      (Sum.elim (fun _ : Unit ↦ (X () : MvPowerSeries Unit O)) fun _ : Unit ↦ mulSeries m)
      (Φ.F ())
theorem mulSeries_zero : Φ.mulSeries 0 = 0 := rfl
theorem mulSeries_succ (m : ℕ) : Φ.mulSeries (m + 1) = MvPowerSeries.subst
    (Sum.elim (fun _ : Unit ↦ (X () : MvPowerSeries Unit O)) fun _ : Unit ↦ Φ.mulSeries m)
    (Φ.F ()) := rfl
theorem constantCoeff_mulSeries (m : ℕ) : constantCoeff (Φ.mulSeries m) = 0 := by
  induction m with
  | zero => rw [mulSeries_zero, map_zero]
  | succ m ih =>
    have h0 : ∀ i : Unit ⊕ Unit, constantCoeff (Sum.elim (fun _ : Unit ↦
        (X () : MvPowerSeries Unit O)) (fun _ : Unit ↦ Φ.mulSeries m) i) = 0 := by
      rintro (u | u)
      · exact constantCoeff_X ()
      · exact ih
    rw [mulSeries_succ]
    exact constantCoeff_subst_eq_zero (hasSubst_of_constantCoeff_zero h0) h0
      (Φ.zero_constantCoeff ())
theorem hasSubst_mulSeries_pair (m : ℕ) : MvPowerSeries.HasSubst
    (Sum.elim (fun _ : Unit ↦ (X () : MvPowerSeries Unit O)) fun _ : Unit ↦ Φ.mulSeries m) :=
  hasSubst_of_constantCoeff_zero (by
    rintro (u | u)
    · exact constantCoeff_X ()
    · exact Φ.constantCoeff_mulSeries m)
theorem hasSubst_mulSeries (m : ℕ) :
    MvPowerSeries.HasSubst (fun _ : Unit ↦ Φ.mulSeries m) :=
  hasSubst_of_constantCoeff_zero fun _ ↦ Φ.constantCoeff_mulSeries m
theorem map_mulSeries {O' : Type*} [CommRing O'] (f : O →+* O') (m : ℕ) :
    MvPowerSeries.map f (Φ.mulSeries m) = (Φ.map f).mulSeries m := by
  induction m with
  | zero => rw [mulSeries_zero, mulSeries_zero, map_zero]
  | succ m ih =>
    rw [mulSeries_succ, mulSeries_succ, map_subst (Φ.hasSubst_mulSeries_pair m)]
    congr 1
    funext i
    rcases i with u | u
    · exact MvPowerSeries.map_X f _
    · exact ih
end MulSeries
section LogMul
lemma subst_zero_fam {σ R : Type*} [Finite σ] [CommRing R] {f : MvPowerSeries σ R}
    (hf : constantCoeff f = 0) :
    MvPowerSeries.subst (fun _ : σ ↦ (0 : MvPowerSeries σ R)) f = 0 := by
  have h0 : MvPowerSeries.HasSubst (fun _ : σ ↦ (0 : MvPowerSeries σ R)) :=
    hasSubst_of_constantCoeff_zero fun _ ↦ map_zero _
  ext d
  rw [coeff_subst h0]
  refine (finsum_eq_zero_of_forall_eq_zero fun m ↦ ?_).trans (map_zero (coeff d)).symm
  rcases eq_or_ne m 0 with rfl | hm
  · rw [coeff_zero_eq_constantCoeff_apply, hf, zero_smul]
  · obtain ⟨i, hi⟩ := Finsupp.support_nonempty_iff.mpr hm
    rw [Finsupp.prod, Finset.prod_eq_zero hi
      (zero_pow (Finsupp.mem_support_iff.mp hi)), map_zero, smul_zero]
variable {K : Type*} [Field K] [CharZero K] (Φ : FormalGroupLaw K Unit)
 
theorem subst_mulSeries_log (m : ℕ) :
    MvPowerSeries.subst (fun _ : Unit ↦ Φ.mulSeries m) (Φ.log ()) = m • Φ.log () := by
  induction m with
  | zero => rw [mulSeries_zero, zero_smul, subst_zero_fam (Φ.constantCoeff_log ())]
  | succ m ih =>
    have hpair := Φ.hasSubst_mulSeries_pair m
    have hXfam : (fun s : Unit ↦ MvPowerSeries.subst (Sum.elim (fun _ : Unit ↦ X ())
        (fun _ : Unit ↦ Φ.mulSeries m)) (X (Sum.inl s) : MvPowerSeries (Unit ⊕ Unit) K))
        = (X ∘ id : Unit → MvPowerSeries Unit K) :=
      funext fun s ↦ by cases s; rw [subst_X hpair]; rfl
    have hψfam : (fun s : Unit ↦ MvPowerSeries.subst (Sum.elim (fun _ : Unit ↦ X ())
        (fun _ : Unit ↦ Φ.mulSeries m)) (X (Sum.inr s) : MvPowerSeries (Unit ⊕ Unit) K))
        = fun _ : Unit ↦ Φ.mulSeries m :=
      funext fun s ↦ by rw [subst_X hpair]; rfl
    have hinl : MvPowerSeries.HasSubst fun s : Unit ↦ (X (Sum.inl s) :
        MvPowerSeries (Unit ⊕ Unit) K) := hasSubst_of_constantCoeff_zero fun s ↦ by simp
    have hinr : MvPowerSeries.HasSubst fun s : Unit ↦ (X (Sum.inr s) :
        MvPowerSeries (Unit ⊕ Unit) K) := hasSubst_of_constantCoeff_zero fun s ↦ by simp
    calc MvPowerSeries.subst (fun _ : Unit ↦ Φ.mulSeries (m + 1)) (Φ.log ())
        = MvPowerSeries.subst (Sum.elim (fun _ : Unit ↦ X ()) fun _ : Unit ↦ Φ.mulSeries m)
            (MvPowerSeries.subst (fun j : Unit ↦ Φ.F j) (Φ.log ())) := by
          rw [show (fun _ : Unit ↦ Φ.mulSeries (m + 1)) = fun j : Unit ↦ MvPowerSeries.subst
            (Sum.elim (fun _ : Unit ↦ X ()) fun _ : Unit ↦ Φ.mulSeries m) (Φ.F j) from
              funext fun j ↦ by cases j; rw [mulSeries_succ],
            subst_comp_subst_apply (hasSubst_F Φ) hpair]
      _ = MvPowerSeries.subst (Sum.elim (fun _ : Unit ↦ X ()) fun _ : Unit ↦ Φ.mulSeries m)
            (MvPowerSeries.subst (fun s : Unit ↦ (X (Sum.inl s) :
                MvPowerSeries (Unit ⊕ Unit) K)) (Φ.log ()))
          + MvPowerSeries.subst (Sum.elim (fun _ : Unit ↦ X ()) fun _ : Unit ↦ Φ.mulSeries m)
              (MvPowerSeries.subst (fun s : Unit ↦ (X (Sum.inr s) :
                  MvPowerSeries (Unit ⊕ Unit) K)) (Φ.log ())) := by
          rw [Φ.log_subst_F (), ← coe_substAlgHom hpair, map_add, coe_substAlgHom hpair]
      _ = Φ.log () + m • Φ.log () := by
          rw [subst_comp_subst_apply hinl hpair, subst_comp_subst_apply hinr hpair,
            hXfam, hψfam, ← rename_eq_subst, rename_id, ih]
          rfl
      _ = (m + 1) • Φ.log () := (succ_nsmul' _ _).symm
 
theorem subst_mulSeries_diffInv_mul_pderiv (m : ℕ) :
    MvPowerSeries.subst (fun _ : Unit ↦ Φ.mulSeries m) (Φ.diffMatrix⁻¹ () ())
        * pderiv K () (Φ.mulSeries m)
      = m • Φ.diffMatrix⁻¹ () () := by
  have h := congrArg (pderiv K ()) (Φ.subst_mulSeries_log m)
  rw [map_nsmul, pderiv_subst (Φ.hasSubst_mulSeries m), Φ.pderiv_log] at h
  simp only [Finset.univ_unique, Finset.sum_singleton, Φ.pderiv_log] at h
  exact h
end LogMul
end FormalGroupLaw
section AdicScaledLog
open IsDedekindDomain IsDedekindDomain.HeightOneSpectrum WithZero
variable {R : Type*} [CommRing R] [IsDedekindDomain R]
  {K : Type*} [Field K] [Algebra R K] [IsFractionRing R K] {v : HeightOneSpectrum R}
lemma coe_injective :
    Function.Injective
      (algebraMap (v.adicCompletionIntegers K) (v.adicCompletion K)) :=
  fun _ _ h ↦ Subtype.ext h

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
lemma constantCoeff_diffInv :
    constantCoeff (Φ.diffMatrix⁻¹ () ()) = 1 := by
  have h := congrArg (fun A ↦ A () ()) Φ.diffMatrixInv_map_constantCoeff
  simpa using h
variable [CharZero K]
 
lemma subst_mulSeries_diffInv_mul_pderiv_int (m : ℕ) :
    MvPowerSeries.subst (fun _ : Unit ↦ Φ.mulSeries m) (Φ.diffMatrix⁻¹ () ())
        * pderiv (v.adicCompletionIntegers K) () (Φ.mulSeries m)
      = m • Φ.diffMatrix⁻¹ () () := by
  have hchar : CharZero (v.adicCompletion K) :=
    charZero_of_injective_algebraMap (algebraMap K (v.adicCompletion K)).injective
  apply map_injective_of_injective coe_injective
  rw [map_mul, map_subst (Φ.hasSubst_mulSeries m), map_pderiv, map_nsmul,
    show (fun i : Unit ↦ MvPowerSeries.map (algebraMap (v.adicCompletionIntegers K)
        (v.adicCompletion K)) (Φ.mulSeries m))
      = fun _ : Unit ↦ (Φ.map (algebraMap (v.adicCompletionIntegers K)
          (v.adicCompletion K))).mulSeries m from
      funext fun _ ↦ Φ.map_mulSeries _ m,
    Φ.map_mulSeries _ m,
    show MvPowerSeries.map (algebraMap (v.adicCompletionIntegers K) (v.adicCompletion K))
        (Φ.diffMatrix⁻¹ () ())
      = (Φ.map (algebraMap (v.adicCompletionIntegers K)
          (v.adicCompletion K))).diffMatrix⁻¹ () () from by
      rw [Φ.diffMatrixInv_map]
      rfl]
  exact (Φ.map _).subst_mulSeries_diffInv_mul_pderiv m
 
lemma coeff_pderiv_mulSeries_mem (m : ℕ) (e : Unit →₀ ℕ) :
    coeff e (pderiv (v.adicCompletionIntegers K) () (Φ.mulSeries m)) ∈
      Ideal.span {(m : v.adicCompletionIntegers K)} := by
  have hU : IsUnit (MvPowerSeries.subst (fun _ : Unit ↦ Φ.mulSeries m)
      (Φ.diffMatrix⁻¹ () ())) := by
    rw [MvPowerSeries.isUnit_iff_constantCoeff,
      constantCoeff_subst_of_constantCoeff_zero (Φ.hasSubst_mulSeries m)
        (fun _ ↦ Φ.constantCoeff_mulSeries m), constantCoeff_diffInv Φ]
    exact isUnit_one
  obtain ⟨Uinv, hUinv⟩ := hU.exists_left_inv
  have hψ : pderiv (v.adicCompletionIntegers K) () (Φ.mulSeries m)
      = Uinv * (m • Φ.diffMatrix⁻¹ () ()) := by
    rw [← subst_mulSeries_diffInv_mul_pderiv_int Φ m, ← mul_assoc, hUinv, one_mul]
  rw [hψ, MvPowerSeries.coeff_mul]
  refine Ideal.sum_mem _ fun x hx ↦ ?_
  rw [map_nsmul, nsmul_eq_mul]
  exact Ideal.mul_mem_left _ _ (Ideal.mul_mem_right _ _
    (Ideal.mem_span_singleton_self _))
 
theorem coeff_single_mulSeries (m : ℕ) :
    coeff (Finsupp.single () 1) (Φ.mulSeries m) = m := by
  have h := congrArg constantCoeff (subst_mulSeries_diffInv_mul_pderiv_int Φ m)
  rw [map_mul, constantCoeff_subst_of_constantCoeff_zero (Φ.hasSubst_mulSeries m)
      (fun _ ↦ Φ.constantCoeff_mulSeries m), constantCoeff_diffInv Φ, one_mul, map_nsmul,
    constantCoeff_diffInv, ← coeff_zero_eq_constantCoeff_apply, coeff_pderiv] at h
  simpa using h
 
theorem coeff_mulSeries_mem_span {p : ℕ} (hp : p.Prime)
    (hpmem : (p : v.adicCompletionIntegers K) ∈ maximalIdeal (v.adicCompletionIntegers K))
    {d : Unit →₀ ℕ} (hd : ¬ p ∣ d ()) :
    coeff d (Φ.mulSeries p) ∈ Ideal.span {(p : v.adicCompletionIntegers K)} := by
  have hne : d () ≠ 0 := fun h ↦ hd (h ▸ dvd_zero p)
  have hstep := coeff_pderiv_mulSeries_mem Φ p (d - Finsupp.single () 1)
  rw [coeff_pderiv] at hstep
  have hd1 : (d - Finsupp.single () 1) + Finsupp.single () 1 = d :=
    Finsupp.ext fun i ↦ by
      cases i
      simp [Nat.sub_add_cancel (Nat.one_le_iff_ne_zero.mpr hne)]
  have hd2 : ((d - Finsupp.single () 1 : Unit →₀ ℕ) () : v.adicCompletionIntegers K) + 1
      = (d () : v.adicCompletionIntegers K) := by
    rw [Finsupp.tsub_apply, Finsupp.single_eq_same,
      Nat.cast_sub (Nat.one_le_iff_ne_zero.mpr hne), Nat.cast_one, sub_add_cancel]
  rw [hd1, hd2] at hstep
  obtain ⟨u, hu⟩ := (isUnit_natCast_of_not_dvd hp hpmem hd).exists_left_inv
  rw [show coeff d (Φ.mulSeries p)
      = coeff d (Φ.mulSeries p) * (d () : v.adicCompletionIntegers K) * u by
    rw [mul_assoc, mul_comm _ u, hu, mul_one]]
  exact Ideal.mul_mem_right _ _ hstep
end AdicMulSeries
end ChabautyColeman
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

theorem nsmul_apply_coe_eq_eval (z : W.formalGroupLaw.Points) (m : ℕ) :
    ((m • z) () : O) = MvPSeries.eval (fun _ : Unit ↦ (z () : O))
      (W.formalGroupLaw.mulSeries m) := by
  induction m with
  | zero =>
    rw [zero_smul, FormalGroupLaw.mulSeries_zero, MvPSeries.eval_zero,
      FormalGroupLaw.zero_apply_coe]
  | succ m ih =>
    have hE : MvPowerSeries.HasEval (fun _ : Unit ↦ (z () : O)) :=
      MvPSeries.hasEval_of_mem fun _ ↦ (z ()).2
    rw [succ_nsmul', add_apply_coe_eq_addEval, ih, FormalGroupLaw.mulSeries_succ,
      MvPSeries.eval_subst hE (W.formalGroupLaw.hasSubst_mulSeries_pair m), addEval]
    congr 1
    funext i
    rcases i with u | u
    · rw [Sum.elim_inl, Sum.elim_inl, MvPSeries.eval_X]
    · rw [Sum.elim_inr, Sum.elim_inr]

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
end
 
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
    rw [hz, zero_add, formalPoint_of_param_eq_zero hW (z := 0) (by simp), zero_add]
  rcases eq_or_ne (z' () : v.adicCompletionIntegers K) 0 with h0' | h0'
  · have hz' : z' = 0 := funext fun _ ↦ Subtype.ext h0'
    rw [hz', add_zero, formalPoint_of_param_eq_zero hW (z := 0) (by simp), add_zero]
  rcases eq_or_ne (z' () : v.adicCompletionIntegers K) (W₀.iotaEval (z ())) with hinv | hinv
  · have hz' : z' = W₀.negPoint z := funext fun _ ↦ Subtype.ext hinv
    rw [hz', W₀.add_negPoint, formalPoint_of_param_eq_zero hW (z := 0) (by simp),
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
  | .zero => exact ⟨0, formalPoint_of_param_eq_zero hW (z := 0) (by simp)⟩
  | .some x y h =>
    rw [some_mem_filtration] at hP
    exact exists_formalPoint_eq_some hW h (le_trans (exp_le_exp.mpr (by lia)) hP)
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

/- TunnellCoates -/
section
namespace TunnellCoates
abbrev E {K : Type*} [CommRing K] (n : K) : WeierstrassCurve K := ⟨0,0,0,-n^2,0⟩
end TunnellCoates
end

/- TunnellChordDifferential -/
section
namespace TunnellChordDifferential
open MvPowerSeries ChabautyColeman
open scoped PowerSeries
variable {O : Type*} [CommRing O] [IsDomain O]
abbrev B (O : Type*) [CommRing O] := MvPowerSeries (Unit ⊕ Unit) O
noncomputable abbrev T : B O := X (Sum.inl ())
noncomputable abbrev Y : B O := X (Sum.inr ())
noncomputable def ev : B O →ₐ[O] O⟦X⟧ :=
  substAlgHom (FormalGroupLaw.hasSubst_unitR (ι:=Unit) (O:=O))
lemma ev_T : ev (T : B O) = PowerSeries.X :=
by rw [ev,coe_substAlgHom,subst_X FormalGroupLaw.hasSubst_unitR]; rfl
lemma ev_Y : ev (Y : B O) = 0 :=
by rw [ev,coe_substAlgHom,subst_X FormalGroupLaw.hasSubst_unitR]; rfl
lemma ev_C (a : O) : ev (MvPowerSeries.C a : B O) = PowerSeries.C a :=
  ev.commutes a
lemma ev_left (f:O⟦X⟧) :
    ev (rename (fun _:Unit=>Sum.inl ()) f) = f := by
  rw [ev,coe_substAlgHom]
  rw [rename_eq_subst,subst_comp_subst_apply (.X_comp _) FormalGroupLaw.hasSubst_unitR]
  have hh : (fun u:Unit => subst
      (Sum.elim MvPowerSeries.X (fun _=>0) : Unit ⊕ Unit → O⟦X⟧)
      ((MvPowerSeries.X ∘ fun _:Unit=>Sum.inl () : Unit → B O) u)) = MvPowerSeries.X := by
    funext u
    rw [Function.comp_apply, subst_X FormalGroupLaw.hasSubst_unitR]
    rfl
  rw [hh, ← map_algebraMap_eq_subst_X, Algebra.algebraMap_self, map_id]
  rfl
lemma chord_specialization (n:O) :
    let W := TunnellCoates.E n
    let L := ev W.slopeSeries
    let A := PowerSeries.C (-n^2)
    let M := W.formalGroupLaw.diffMatrix () ()
    L = PowerSeries.X^2*(1 + A*L^2) ∧
      M*(1 + A*L^2) = 1 - A*L^2 := by
  let W := TunnellCoates.E n
  let A : B O := C (-n^2)
  let Λ := W.slopeSeries
  let N := W.interceptSeries
  let F := W.addSeries
  let V := 1 + A*Λ^2
  let d := pderiv O (Sum.inr () : Unit ⊕ Unit)
  have hT : d (T : B O) = 0 := pderiv_X_of_ne (by decide)
  have hY : d (Y : B O) = 1 := pderiv_X_self
  have hA : d A = 0 := pderiv_C
  have heF : ev F = PowerSeries.X := by rw [ev,coe_substAlgHom]; exact W.subst_unitR_addSeries
  have hYw :
      rename (fun _:Unit => Sum.inr ()) W.wSeries =
        Y ^ 3 * rename (fun _:Unit => Sum.inr ()) W.vSeries := by
    rw [W.wSeries_eq_X_pow_three_mul, map_mul, map_pow]
    change _ = _
    rw [show (PowerSeries.X : O⟦X⟧) = MvPowerSeries.X () from rfl,rename_X]
  have hN : N = Y^3 * rename (fun _:Unit => Sum.inr ()) W.vSeries - Λ*Y :=
    W.interceptSeries_eq.trans (by rw [hYw])
  have heN : ev N = 0 := by simp [hN,ev_Y]
  have hdN : ev (d N) = -ev Λ := by
    rw [hN,map_sub,Derivation.leibniz,Derivation.leibniz,Derivation.leibniz_pow,
      hY]
    simp [ev_Y,smul_eq_mul]
  have hL : PowerSeries.X * ev Λ = W.wSeries := by
    have eqN : N = rename (fun _:Unit=>Sum.inl ()) W.wSeries - Λ*T := rfl
    have eq := congrArg ev eqN
    rw [heN,map_sub,map_mul,ev_left,ev_T] at eq
    linear_combination eq
  have hfix : ev Λ = PowerSeries.X^2*(1+PowerSeries.C (-n^2)*(ev Λ)^2) := by
    apply PowerSeries.X_mul_cancel
    rw [hL]
    conv_lhs => rw [W.wSeries_eq]
    rw [← hL]
    simp only [W,TunnellCoates.E,map_zero,zero_mul,zero_add,add_zero]
    ring
  have hu : W.uSeries = 1 := by simp [W,WeierstrassCurve.uSeries,TunnellCoates.E]
  have hi : W.inverseSeries = -PowerSeries.X := by
    have huu := W.mul_invOfUnit_uSeries
    rw [hu,one_mul] at huu
    simp [WeierstrassCurve.inverseSeries,hu,huu]
  have hF : F = -W.thirdRootSeries := by
    change MvPowerSeries.subst (fun _:Unit=> W.thirdRootSeries) W.inverseSeries = _
    rw [hi, ← coe_substAlgHom W.hasSubst_thirdRootSeries,map_neg]
    rw [coe_substAlgHom]
    change -MvPowerSeries.subst (fun _:Unit=>W.thirdRootSeries) (MvPowerSeries.X ()) = _
    rw [subst_X W.hasSubst_thirdRootSeries]
  have hV : V * invOfUnit V 1 = 1 := MvPowerSeries.mul_invOfUnit _ _ (by
    simp [V,A,Λ])
  have hFV : (F-T-Y)*V = 2*A*Λ*N := by
    rw [hF,WeierstrassCurve.thirdRootSeries]
    change _ = _
    simp only [W,TunnellCoates.E,map_zero,zero_mul,mul_zero,add_zero,zero_add] at *
    change (-(-T-Y-(2*A*Λ*N)*invOfUnit V 1)-T-Y)*V = _
    linear_combination 2*A*Λ*N*hV
  have htwo : d (2:B O) = 0 := d.map_natCast 2
  have hdFV := congrArg (fun z : B O => ev (d z)) hFV
  simp only [map_sub, Derivation.leibniz,  hA,hT,hY,
    htwo, smul_eq_mul,map_mul,map_add,map_zero,map_one,heF,ev_T,ev_Y,
    hdN,heN,sub_zero,sub_self,zero_mul,mul_zero,add_zero,zero_add] at hdFV
  have hM : W.formalGroupLaw.diffMatrix () () = ev (d F) := by rw [ev,coe_substAlgHom]; rfl
  refine ⟨hfix,?_⟩
  change W.formalGroupLaw.diffMatrix () () * (1+PowerSeries.C (-n^2)*(ev Λ)^2) = _
  rw [hM]
  have heV : ev V = 1 + PowerSeries.C (-n^2)*(ev Λ)^2 := by simp [V,A,ev_C]
  rw [heV, show ev A = PowerSeries.C (-n^2) from ev_C _] at hdFV
  rw [map_ofNat] at hdFV
  linear_combination hdFV

theorem differential_square (n:O) :
    let D := (TunnellCoates.E n).formalGroupLaw.diffMatrix⁻¹ () ()
    D^2 * (1 + PowerSeries.C (4*n^2) * PowerSeries.X^4) = 1 := by
  let W := TunnellCoates.E n
  let L := ev W.slopeSeries
  let A := PowerSeries.C (-n^2)
  let M := W.formalGroupLaw.diffMatrix () ()
  let D := W.formalGroupLaw.diffMatrix⁻¹ () ()
  let V := 1+A*L^2
  obtain ⟨hl,hm⟩ := chord_specialization n
  change L = PowerSeries.X^2 * V at hl
  change M*V = 1-A*L^2 at hm
  have hL0 : PowerSeries.constantCoeff L=0 := by
    simpa using congrArg PowerSeries.constantCoeff hl
  have hV0 : V ≠ 0 := by
    intro hz
    have hh := congrArg PowerSeries.constantCoeff hz
    simp [V,hL0] at hh
  have hM : M^2=1-4*A*PowerSeries.X^4 := by
    apply mul_right_cancel₀ (pow_ne_zero 2 hV0)
    calc
      M^2 * V^2 = (1-A*L^2)^2 := by rw [← mul_pow,hm]
      _ = V^2-4*A*L^2 := by dsimp [V]; ring
      _ = _ := by conv_lhs => arg 2; rw [hl]
                  ring
  have hMD : M*D=1 := by
    have hh := congrArg (fun m => m () ()) (Matrix.mul_nonsing_inv _
      ((Matrix.isUnit_iff_isUnit_det _).mp W.formalGroupLaw.isUnit_diffMatrix))
    simpa [M,D,Matrix.mul_apply] using hh
  have hA : -4*A=PowerSeries.C (4*n^2) := by simp [A,map_mul,map_ofNat]
  change D^2 * (1+PowerSeries.C (4*n^2)*PowerSeries.X^4)=1
  rw [←hA,show 1+(-4*A)*PowerSeries.X^4=1-4*A*PowerSeries.X^4 by ring, ←hM,
    ←mul_pow,mul_comm D M,hMD,one_pow]
end TunnellChordDifferential
end

/- TunnellEisensteinRoot -/
section
namespace TunnellEisensteinRoot
open Polynomial IsLocalRing Finset
variable {A B:Type*} [CommRing A] [IsLocalRing A] [CommRing B] [IsLocalRing B]

theorem root_relation (f:A→+*B) [IsLocalHom f] {π:A}
    (hπ : maximalIdeal A = Ideal.span {π}) {P:A[X]} (hm:P.Monic)
    (he : P.IsEisensteinAt (maximalIdeal A)) (hd:0<P.natDegree)
    (t:B) (ht:P.eval₂ f t=0) :
    t ∈ maximalIdeal B ∧ ∃ (a:Aˣ) (u:Bˣ), P.coeff 0=π*a ∧
      t^P.natDegree=f π*u ∧ residue B (u:B) = -residue B (f (a:A)) := by
  classical
  have hπmem : π ∈ maximalIdeal A := hπ ▸ Ideal.mem_span_singleton_self π
  have hcoeff : ∀ j < P.natDegree, π ∣ P.coeff j := by
    intro j hj
    apply Ideal.mem_span_singleton.mp
    rw [←hπ]; exact he.mem hj
  choose! q hq using hcoeff
  have hq0 : IsUnit (q 0) := by
    by_contra hnon
    have hm₀ : q 0 ∈ maximalIdeal A := hnon
    exact he.notMem (by rw [hq 0 hd,pow_two]; exact Ideal.mul_mem_mul hπmem hm₀)
  let v := -(∑ j ∈ range P.natDegree, f (q j)*t^j)
  have hr : t^P.natDegree = f π * v := by
    rw [eval₂_eq_sum_range,sum_range_succ,hm.coeff_natDegree,map_one,one_mul] at ht
    have hl : (∑ j ∈ range P.natDegree, f (P.coeff j)*t^j) =
        f π * (∑ j ∈ range P.natDegree, f (q j)*t^j) := by
      rw [mul_sum]
      apply sum_congr rfl
      intro j hj
      rw [hq j (mem_range.mp hj),map_mul,mul_assoc]
    rw [hl] at ht
    dsimp [v]
    linear_combination ht
  have htmem : t ∈ maximalIdeal B := by
    apply (inferInstance : (maximalIdeal B).IsPrime).mem_of_pow_mem P.natDegree
    rw [hr]
    exact Ideal.mul_mem_right _ _ (map_nonunit f π hπmem)
  have hr₀ : residue B v = -residue B (f (q 0)) := by
    dsimp [v]
    rw [map_neg,map_sum]
    congr 1
    rw [sum_eq_single 0]
    · simp
    · intro j hj hj₀
      rw [map_mul,map_pow,(residue_eq_zero_iff _).mpr htmem,zero_pow hj₀,mul_zero]
    · simp [hd]
  have hvunit : IsUnit v := by
    rw [← isUnit_map_iff (residue B) v, isUnit_iff_ne_zero,hr₀]
    exact neg_ne_zero.mpr (((hq0.map f).map (residue B)).ne_zero)
  exact ⟨htmem,hq0.unit,hvunit.unit,by simpa using hq 0 hd,by simpa using hr,
    by simpa using hr₀⟩
end TunnellEisensteinRoot
end

/- TunnellFormalEisenstein -/
section
namespace TunnellFormalEisenstein
open IsLocalRing
open scoped PowerSeries Polynomial
variable {O : Type*} [CommRing O] [IsLocalRing O]
  [IsAdicComplete (maximalIdeal O) O]

theorem prepare (g : O⟦X⟧) {d : ℕ}
    (h₀ : PowerSeries.constantCoeff g ∉ maximalIdeal O ^ 2)
    (hbelow : ∀ j < d, PowerSeries.coeff j g ∈ maximalIdeal O)
    (hd : PowerSeries.coeff d g ∉ maximalIdeal O) :
    ∃ (P : O[X]) (U : O⟦X⟧), g.IsWeierstrassFactorization P U ∧
      P.natDegree = d ∧ P.IsEisensteinAt (maximalIdeal O) := by
  have horder : (g.map (residue O)).order = d := by
    apply PowerSeries.order_eq_nat.mpr
    simpa only [Ne, PowerSeries.coeff_map, residue_eq_zero_iff] using And.intro hd hbelow
  have hne : g.map (residue O) ≠ 0 := by
    intro he
    simp [he] at horder
  obtain ⟨P,U,hPU⟩ := PowerSeries.exists_isWeierstrassFactorization hne
  refine ⟨P,U,hPU, by simp [hPU.natDegree_eq_toNat_order_map,horder], ?_⟩
  apply hPU.isDistinguishedAt.monic.isEisensteinAt_of_mem_of_notMem
    (Ideal.IsMaximal.ne_top inferInstance) hPU.isDistinguishedAt.mem
  intro h
  apply h₀
  rw [hPU.eq_mul,map_mul]
  exact Ideal.mul_mem_right _ _ (by simpa using h)
end TunnellFormalEisenstein
end

/- TunnellFormalJet -/
section
namespace TunnellFormalJet
open PowerSeries
variable {O k : Type*} [CommRing O] [IsDomain O] [CharZero O] [CommRing k]

theorem invariant_coefficient (ρ : O →+* k) {p : ℕ} (hp : 0 < p)
    (F D : O⟦X⟧) (hF : constantCoeff F = 0) (hD : constantCoeff D = 1)
    (hbelow : ∀ j < p, ρ (coeff j F) = 0)
    (heq : D.subst F * derivative O F = C (p : O) * D) :
    ρ (coeff p F) = ρ (coeff (p-1) D) := by
  have hsub : HasSubst F := .of_constantCoeff_zero' hF
  let B := (mk (fun j => coeff (j+1) D)).subst F
  have hsplit : D.subst F = F * B + 1 := by
    have hx := congrArg (subst (R := O) F) (eq_X_mul_shift_add_const D)
    rw [subst_add hsub, subst_mul hsub, subst_X hsub, subst_C, hD, map_one] at hx
    exact hx
  have hu : IsUnit (D.subst F : O⟦X⟧) := by
    rw [isUnit_iff_constantCoeff,hsplit,map_add,map_mul,hF]
    simp
  obtain ⟨V₀,hV₀⟩ := hu.exists_left_inv
  let V := V₀ * D
  have hder : derivative O F = C (p : O) * V := by
    calc
      _ = (V₀ * D.subst F) * derivative O F := by rw [hV₀,one_mul]
      _ = _ := by rw [mul_assoc,heq]; dsimp [V]; ring
  have hprod : D.subst F * V = D := by
    dsimp [V]
    rw [← mul_assoc,mul_comm (D.subst F),hV₀,one_mul]
  have hdiff : D - V = F * (B * V) := by rw [← hprod, hsplit]; ring
  have hdiv : X^p ∣ map ρ F :=
    X_pow_dvd_iff.mpr (by simpa only [coeff_map] using hbelow)
  have hdiv' : X^p ∣ map ρ (D - V) := by
    rw [hdiff,map_mul]
    exact dvd_mul_of_dvd_left hdiv _
  have hcoef := X_pow_dvd_iff.mp hdiv' (p-1) (by omega)
  simp only [map_sub, coeff_map, map_sub] at hcoef
  have hd' := congrArg (coeff (R := O) (p-1)) hder
  have hcancel : (coeff p F) * (p : O) = coeff (p-1) V * (p : O) := by
    rw [coeff_derivative, coeff_C_mul, ← Nat.cast_succ, show p-1+1=p by omega] at hd'
    rw [show (p-1).succ=p by omega] at hd'
    exact hd'.trans (mul_comm _ _)
  rw [mul_right_cancel₀ (Nat.cast_ne_zero.mpr hp.ne') hcancel]
  exact (sub_eq_zero.mp hcoef).symm
end TunnellFormalJet
end

/- TunnellFormalGroupHeight -/
section
namespace TunnellFormalGroupHeight
open ChabautyColeman MvPowerSeries IsLocalRing IsDedekindDomain
  IsDedekindDomain.HeightOneSpectrum
open scoped PowerSeries
variable {R K : Type*} [CommRing R] [IsDedekindDomain R]
  [Field K] [Algebra R K] [IsFractionRing R K] {v : HeightOneSpectrum R}
  [CharZero K]
theorem derivative_identity {O k : Type*} [CommRing O] [Field k] [CharZero k]
    (f : O →+* k) (hf : Function.Injective f) (Φ : FormalGroupLaw O Unit) (p:ℕ) :
    MvPowerSeries.subst (fun _:Unit=>Φ.mulSeries p) (Φ.diffMatrix⁻¹ () ()) *
      pderiv O () (Φ.mulSeries p) = p • Φ.diffMatrix⁻¹ () () := by
  apply FormalGroupLaw.map_injective_of_injective hf
  rw [map_mul,map_subst (Φ.hasSubst_mulSeries p),map_pderiv,map_nsmul,
    show (fun _:Unit => MvPowerSeries.map f (Φ.mulSeries p)) =
      (fun _:Unit => (Φ.map f).mulSeries p) from funext fun _ => Φ.map_mulSeries f p,
    Φ.map_mulSeries f p,
    show MvPowerSeries.map f (Φ.diffMatrix⁻¹ () ()) = (Φ.map f).diffMatrix⁻¹ () () by
      rw [Φ.diffMatrixInv_map]; rfl]
  exact (Φ.map f).subst_mulSeries_diffInv_mul_pderiv p

theorem prime_jet (Φ : FormalGroupLaw (v.adicCompletionIntegers K) Unit)
    {p : ℕ} (hp:p.Prime) (hmem : (p:v.adicCompletionIntegers K) ∈ maximalIdeal _) :
    let ρ := residue (v.adicCompletionIntegers K)
    (∀ j < p, ρ (PowerSeries.coeff j (Φ.mulSeries p)) = 0) ∧
      ρ (PowerSeries.coeff p (Φ.mulSeries p)) =
        ρ (PowerSeries.coeff (p-1) (Φ.diffMatrix⁻¹ () ())) := by
  let O := v.adicCompletionIntegers K
  let ρ := residue O
  haveI : CharZero (v.adicCompletion K) :=
    charZero_of_injective_algebraMap (algebraMap K (v.adicCompletion K)).injective
  have hinj : Function.Injective (algebraMap O (v.adicCompletion K)) :=
    fun _ _ h => Subtype.ext h
  haveI : CharZero O := (algebraMap O (v.adicCompletion K)).charZero
  have hbelow (j:ℕ) (hj:j<p) : ρ (PowerSeries.coeff j (Φ.mulSeries p))=0 := by
    rcases Nat.eq_zero_or_pos j with rfl | hpos
    · simp only [PowerSeries.coeff_zero_eq_constantCoeff_apply]
      change ρ (MvPowerSeries.constantCoeff _) = 0
      rw [Φ.constantCoeff_mulSeries,map_zero]
    · apply (residue_eq_zero_iff _).mpr
      have hm := ChabautyColeman.coeff_mulSeries_mem_span Φ hp hmem
        (d:=Finsupp.single () j) (by simpa using Nat.not_dvd_of_pos_of_lt hpos hj)
      exact ((Ideal.span_singleton_le_iff_mem _).mpr hmem) hm
  refine ⟨hbelow,?_⟩
  apply TunnellFormalJet.invariant_coefficient ρ hp.pos _ _ (Φ.constantCoeff_mulSeries p) _ hbelow
  · have h := derivative_identity (algebraMap O (v.adicCompletion K)) hinj Φ p
    simpa only [nsmul_eq_mul, map_natCast, PowerSeries.subst_def, PowerSeries.derivative] using h
  · have h := congrArg (fun M => M () ()) Φ.diffMatrixInv_map_constantCoeff
    rw [PowerSeries.constantCoeff_eq]
    simpa using h
end TunnellFormalGroupHeight
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

/- TunnellFormalPrimitive -/
section
namespace TunnellFormalPrimitive
open PowerSeries IsLocalRing
open scoped Polynomial
lemma const_subst {A:Type*} [CommRing A] (f g:A⟦X⟧)
    (hg:constantCoeff g=0) : constantCoeff (f.subst g) = constantCoeff f := by
  have hs : HasSubst g := .of_constantCoeff_zero' hg
  have h := congrArg (subst (R:=A) g) (eq_X_mul_shift_add_const f)
  rw [subst_add hs,subst_mul hs,subst_X hs,subst_C] at h
  rw [h,map_add,map_mul,hg,zero_mul,zero_add]
  exact MvPowerSeries.constantCoeff_C _
lemma subst_order {k:Type*} [Field k] (f g:k⟦X⟧) (hg:constantCoeff g=0)
    {a b:ℕ} (hf:f.order=a) (hor:g.order=b) :
    PowerSeries.order (f.subst g) = (a*b:ℕ) := by
  have hs : HasSubst g := .of_constantCoeff_zero' hg
  have hfac : X^a*f.divXPowOrder=f := by
    simpa [hf] using (X_pow_order_mul_divXPowOrder (f:=f))
  have hu : PowerSeries.order (f.divXPowOrder.subst g)=0 := by
    by_contra hh
    have hzero := order_ne_zero_iff_constCoeff_eq_zero.mp hh
    rw [const_subst _ _ hg,constantCoeff_divXPowOrder_eq_zero_iff] at hzero
    simp [hzero] at hf
  have h := congrArg (subst (R:=k) g) hfac
  rw [subst_mul hs,subst_pow hs,subst_X hs] at h
  rw [←h,order_mul,order_pow,hor,hu,add_zero,nsmul_eq_mul,Nat.cast_mul]
 
noncomputable def multiple {A:Type*} [CommRing A] (F:A⟦X⟧) : ℕ → A⟦X⟧
  | 0 => X
  | r+1 => F.subst (multiple F r)
lemma multiple_const {A:Type*} [CommRing A] (F:A⟦X⟧) (hz:constantCoeff F=0)
    (r:ℕ) : constantCoeff (multiple F r)=0 := by
  induction r with
  | zero => simp [multiple]
  | succ r ih => exact (const_subst F _ ih).trans hz
 
noncomputable def quotient {A:Type*} [CommRing A] (F:A⟦X⟧) : A⟦X⟧ :=
  mk (fun j => coeff (j+1) F)
 
noncomputable def primitive {A:Type*} [CommRing A] (F:A⟦X⟧) (r:ℕ) : A⟦X⟧ :=
  (quotient F).subst (multiple F r)
theorem factor_multiple {A:Type*} [CommRing A] (F:A⟦X⟧) (hz:constantCoeff F=0) (r:ℕ) :
    multiple F (r+1)=multiple F r * primitive F r := by
  have hF : F=X*quotient F := by simpa [hz,quotient] using eq_X_mul_shift_add_const F
  have hs : HasSubst (multiple F r) := .of_constantCoeff_zero' (multiple_const F hz r)
  change F.subst (multiple F r)=_
  exact (congrArg (subst (R:=A) (multiple F r)) hF).trans (by rw [subst_mul hs,subst_X hs]; rfl)
variable {O:Type*} [CommRing O] [IsLocalRing O] [IsAdicComplete (maximalIdeal O) O]

theorem primitive_eisenstein (F:O⟦X⟧) {p:ℕ} (hp:p.Prime)
    (hz:constantCoeff F=0) (hlin:coeff 1 F∉maximalIdeal O^2)
    (hbelow:∀ j<p,coeff j F∈maximalIdeal O) (hunit:coeff p F∉maximalIdeal O) (r:ℕ) :
    ∃ (P : O[X]) (U : O⟦X⟧), (primitive F r).IsWeierstrassFactorization P U ∧
      P.natDegree = Nat.totient (p^(r+1)) ∧ P.IsEisensteinAt (maximalIdeal O) := by
  let ρ := residue O
  have hF : (map ρ F).order=p := by
    apply order_eq_nat.mpr
    simpa only [ρ,Ne,coeff_map,residue_eq_zero_iff] using And.intro hunit hbelow
  have hG : (map ρ (quotient F)).order=p-1 := by
    apply order_eq_nat.mpr
    simp only [quotient,coeff_map,coeff_mk,ρ,Ne,residue_eq_zero_iff]
    exact ⟨by rwa [show p-1+1=p by have := hp.pos; omega],
      fun j hj => hbelow _ (by omega)⟩
  have hmapzero (j:ℕ) : constantCoeff (map ρ (multiple F j)) = 0 := by
    rw [← coeff_zero_eq_constantCoeff_apply,coeff_map,coeff_zero_eq_constantCoeff_apply,
      multiple_const F hz j,map_zero]
  have hR (j:ℕ) : (map ρ (multiple F j)).order = (p^j:ℕ) := by
    induction j with
    | zero => simp [multiple]
    | succ j ih =>
      change PowerSeries.order (map ρ (F.subst (multiple F j)))=_
      have hs : HasSubst (multiple F j) :=
        .of_constantCoeff_zero' (multiple_const F hz j)
      change PowerSeries.order (MvPowerSeries.map ρ _) = _
      rw [map_subst hs]
      simpa [pow_succ,mul_comm,PowerSeries.map] using subst_order (map ρ F) (map ρ (multiple F j))
        (hmapzero j) hF ih
  have hprim : (map ρ (primitive F r)).order = (Nat.totient (p^(r+1)) : ℕ) := by
    have hs : HasSubst (multiple F r) := .of_constantCoeff_zero' (multiple_const F hz r)
    change PowerSeries.order (MvPowerSeries.map ρ ((quotient F).subst (multiple F r))) = _
    rw [map_subst hs]
    simpa [Nat.totient_prime_pow_succ hp,mul_comm,PowerSeries.map] using subst_order
      (map ρ (quotient F)) (map ρ (multiple F r)) (hmapzero r) hG (hR r)
  obtain ⟨ha,hb⟩ := order_eq_nat.mp hprim
  apply TunnellFormalEisenstein.prepare
  · rw [primitive,const_subst _ _ (multiple_const F hz r)]
    simpa [quotient] using hlin
  · simpa only [coeff_map,ρ,residue_eq_zero_iff] using hb
  · simpa only [Ne,coeff_map,ρ,residue_eq_zero_iff] using ha
end TunnellFormalPrimitive
end

/- TunnellFormalPrimitivePoint -/
section
namespace TunnellFormalPrimitivePoint
open PowerSeries ChabautyColeman IsLocalRing TunnellFormalPrimitive
open scoped Polynomial
variable {O : Type*} [CommRing O] [IsLocalRing O] [UniformSpace O] [Fact (IsAdic (maximalIdeal O))]
    [IsUniformAddGroup O] [CompleteSpace O] [T2Space O] [IsTopologicalRing O]
lemma eval_at_zero (F:O⟦X⟧) : PSeries.eval 0 F=constantCoeff F := by
  let e := PSeries.evalRingHom ((maximalIdeal O).zero_mem)
  have h := congrArg e (eq_X_mul_shift_add_const F)
  simp [e,map_add,map_mul] at h
  exact h
lemma multiple_eval (W : WeierstrassCurve O) (p r:ℕ) (Z : W.formalGroupLaw.Points) :
    PSeries.eval (Z () : O) (multiple (W.formalGroupLaw.mulSeries p) r)=
      ((p^r • Z) () : O) := by
  let F : O⟦X⟧ := W.formalGroupLaw.mulSeries p
  induction r with
  | zero => simp [multiple]
  | succ r ih =>
    have hz : constantCoeff (multiple F r)=0 := multiple_const F (W.formalGroupLaw.constantCoeff_mulSeries _) r
    change MvPSeries.eval (fun _:Unit => (Z ():O)) (F.subst (multiple F r))=_
    rw [WeierstrassCurve.eval_subst_single (Z ()).property hz F]
    change PSeries.eval (PSeries.eval (Z ():O) (multiple F r)) F=_
    rw [ih]
    rw [pow_succ, mul_nsmul]
    exact (W.nsmul_apply_coe_eq_eval (p^r • Z) p).symm
theorem order_of_root (W : WeierstrassCurve O) {p : ℕ} [Fact p.Prime] [CharZero O]
    (hl : coeff 1 (W.formalGroupLaw.mulSeries p) ≠ 0)
    (r:ℕ) (Z : W.formalGroupLaw.Points)
    (hroot:PSeries.eval (Z ():O) (primitive (W.formalGroupLaw.mulSeries p) r)=0) :
    addOrderOf Z=p^(r+1) := by
  let F : O⟦X⟧ := W.formalGroupLaw.mulSeries p
  have hz : constantCoeff F=0 := W.formalGroupLaw.constantCoeff_mulSeries p
  have he (Q : W.formalGroupLaw.Points) : (Q ():O)=0 ↔ Q=0 := by
    constructor
    · intro e; funext i; cases i; exact Subtype.ext e
    · rintro rfl; rfl
  apply addOrderOf_eq_prime_pow
  · intro h
    have hr := (he _).mpr h
    change ((p^r • Z) () : O)=0 at hr
    rw [← multiple_eval] at hr
    change PSeries.eval (Z ():O) (multiple F r)=0 at hr
    have hcomp := WeierstrassCurve.eval_subst_single (Z ()).property (multiple_const F hz r) (quotient F)
    change PSeries.eval (Z ():O) (primitive F r) = PSeries.eval (PSeries.eval (Z ():O) (multiple F r)) (quotient F) at hcomp
    rw [hroot,hr,eval_at_zero] at hcomp
    have hcon : constantCoeff (quotient F)=coeff 1 F := by simp [quotient]
    rw [hcon] at hcomp
    exact hl hcomp.symm
  · apply (he _).mp
    rw [←multiple_eval]
    change PSeries.eval (Z ():O) (multiple F (r+1))=0
    rw [←PSeries.evalRingHom_apply (Z ()).property]
    rw [factor_multiple F hz r,map_mul]
    rw [PSeries.evalRingHom_apply (Z ()).property (primitive F r)]
    rw [hroot,mul_zero]
lemma primitive_map {A B:Type*} [CommRing A] [CommRing B] (f:A→+*B) (F:A⟦X⟧)
    (hz:constantCoeff F=0) (r:ℕ) :
    map f (primitive F r)=primitive (map f F) r := by
  have hm (j:ℕ) : map f (multiple F j)=multiple (map f F) j := by
    induction j with
    | zero => simp [multiple]
    | succ j ih =>
      change MvPowerSeries.map f (F.subst (multiple F j))=_
      rw [map_subst (HasSubst.of_constantCoeff_zero' (multiple_const F hz j))]
      change (map f F).subst (map f (multiple F j))=_
      rw [ih]; rfl
  have hq : map f (quotient F)=quotient (map f F) := by ext; simp [quotient]
  change MvPowerSeries.map f ((quotient F).subst (multiple F r))=_
  rw [map_subst (HasSubst.of_constantCoeff_zero' (multiple_const F hz r))]
  change (map f (quotient F)).subst (map f (multiple F r))=_
  rw [hm,hq]; rfl
lemma map_formal_series {A B:Type*} [CommRing A] [CommRing B] (f:A→+*B) (W : WeierstrassCurve A) (p:ℕ) :
    map f (W.formalGroupLaw.mulSeries p)= (W.map f).formalGroupLaw.mulSeries p := by
  have hm : W.formalGroupLaw.map f = (W.map f).formalGroupLaw := by
    have he : (W.formalGroupLaw.map f).F=(W.map f).formalGroupLaw.F := by
      funext i
      exact W.map_addSeries f
    generalize W.formalGroupLaw.map f = Φ at he ⊢
    generalize (W.map f).formalGroupLaw = Ψ at he ⊢
    cases Φ
    cases Ψ
    congr
  exact (W.formalGroupLaw.map_mulSeries f p).trans (congrArg (fun g : FormalGroupLaw B Unit => g.mulSeries p) hm)
theorem root_of_prepared {A:Type*} [CommRing A] [IsLocalRing A] (f:A→+*O)
    (W:WeierstrassCurve A) {p:ℕ} [Fact p.Prime] [CharZero O]
    (hlin : f (coeff 1 (W.formalGroupLaw.mulSeries p)) ≠ 0) (r:ℕ)
    {P:A[X]} {U:A⟦X⟧} (hfac : (primitive (W.formalGroupLaw.mulSeries p) r).IsWeierstrassFactorization P U)
    {t:O} (ht:t∈maximalIdeal O) (hroot:P.eval₂ f t=0) :
    addOrderOf (show (W.map f).formalGroupLaw.Points from fun _ => ⟨t,ht⟩) = p^(r+1) := by
  apply order_of_root
  · rw [←map_formal_series f W,coeff_map]
    exact hlin
  change PSeries.eval t (primitive ((W.map f).formalGroupLaw.mulSeries p) r)=0
  rw [←PSeries.evalRingHom_apply ht]
  change PSeries.evalRingHom ht (primitive ((W.map f).formalGroupLaw.mulSeries p) r)=0
  rw [← map_formal_series f W, ← primitive_map f _ (W.formalGroupLaw.constantCoeff_mulSeries _) r,hfac.eq_mul,map_mul,map_mul]
  have e : PSeries.evalRingHom ht (map f (P: A⟦X⟧))=0 := by
    rw [← Polynomial.polynomial_map_coe, PSeries.evalRingHom_apply,PSeries.eval_coe,Polynomial.eval_map,hroot]
  rw [e,zero_mul]
end TunnellFormalPrimitivePoint
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

/- TunnellGaussianEnd -/
section
namespace TunnellGaussianEnd
variable {A : Type*} [AddCommGroup A]
def endo (I : A→+A) (a b : ℤ) : A→+A := a • AddMonoidHom.id _ + b • I
lemma endo_apply (I : A→+A) (a b : ℤ) (x:A) : endo I a b x=a•x+b•I x := rfl
end TunnellGaussianEnd
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
 
theorem primary_of_nsmul (n i:(v.adicCompletionIntegers K)) (hi:i^2= -1) [(E (n:(v.adicCompletion K))).IsElliptic]
    (a b:ℤ) {p:ℕ} (hab : a^2+b^2=(p:ℤ)) (hu : IsUnit ((a:(v.adicCompletionIntegers K))-(b:(v.adicCompletionIntegers K))*i)) (r:ℕ)
    (Z : (E n).formalGroupLaw.Points) (hz : p^r • Z=0) :
    (endo (TunnellLocalCM.gaussianI (n:(v.adicCompletion K)) (i:(v.adicCompletion K)) (by exact_mod_cast hi)) a b)^[r] (toPoint n Z)=0 := by
  let I := TunnellLocalCM.gaussianI (n:(v.adicCompletion K)) (i:(v.adicCompletion K)) (by exact_mod_cast hi)
  let U := filtration (base_curve n) 0
  let f := endo I a b
  let g := endo I a (-b)
  have hI : ∀ T, I (I T) = -T := TunnellLocalCM.gaussianI_square _ _ _
  have inside (z : (E n).formalGroupLaw.Points) : toPoint n z∈U :=
    (mem_pow_iff_formalPoint_mem_filtration (hW:=base_curve n) z 0).mp (by simpa using (z ()).2)
  have stab (T : (E (n:(v.adicCompletion K))).toAffine.Point) (hT:T∈U) : I T∈U := by
    obtain ⟨z,rfl⟩ := formalPoint_surjective (hW:=base_curve n) hT
    exact (quarter_toPoint n i hi z) ▸ inside (quarterParam n i z)
  have stable (c:ℤ) (T : (E (n:(v.adicCompletion K))).toAffine.Point) (hT:T∈U) : endo I a c T∈U :=
    U.add_mem (U.zsmul_mem hT _) (U.zsmul_mem (stab T hT) _)
  have hg0 (T : (E (n:(v.adicCompletion K))).toAffine.Point) (hT:T∈U) (h:g T=0) : T=0 := by
    obtain ⟨z,rfl⟩ := formalPoint_surjective (hW:=base_curve n) hT
    have h₀ := unit_kernel n i hi a (-b) (by simpa [sub_eq_add_neg] using hu) z h
    rw [h₀]; exact map_zero (toPoint n)
  have stable_iter (k:ℕ) : f^[k] (toPoint n Z)∈U := by
    induction k with
    | zero => exact inside Z
    | succ k ih => rw [Function.iterate_succ_apply']; exact stable b _ ih
  have killed (k:ℕ) (T : (E (n:(v.adicCompletion K))).toAffine.Point) (hT:T∈U) (h:g^[k] T=0) : T=0 := by
    induction k generalizing T with
    | zero => exact h
    | succ k ih =>
      rw [Function.iterate_succ_apply] at h
      exact hg0 T hT (ih _ (stable (-b) T hT) h)
  have hgf (T : (E (n:(v.adicCompletion K))).toAffine.Point) : g (f T)=p • T := by
    change a • (a • T+b • I T) + (-b) • I (a • T+b • I T)=p • T
    rw [map_add,map_zsmul,map_zsmul,hI,← natCast_zsmul T p,←hab]
    module
  have norm (k:ℕ) (T : (E (n:(v.adicCompletion K))).toAffine.Point) : g^[k] (f^[k] T)=p^k • T := by
    induction k generalizing T with
    | zero => simp
    | succ k ih =>
      rw [Function.iterate_succ_apply',Function.iterate_succ_apply,ih,map_nsmul,hgf,smul_smul,pow_succ]
  apply killed r _ (stable_iter r)
  rw [norm,←map_nsmul,hz,map_zero]
end TunnellFormalPrimaryCM
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
variable {F L : Type*} [Field F] [Field L] [Algebra F L] [DecidableEq F] [DecidableEq L]
end TunnellGaussianEnd
end

/- TunnellHasseInvariant -/
section
namespace TunnellHasseInvariant
open Finset
lemma sum_power {p : ℕ} [Fact p.Prime] (k : ℕ) (hk : 0 < k) :
    ∑ x : ZMod p, x^k = if p-1 ∣ k then -1 else 0 := by
  classical
  let e : (ZMod p)ˣ ↪ ZMod p := ⟨(↑), Units.val_injective⟩
  have he : univ.map e = univ \ {(0 : ZMod p)} := by
    ext x
    simpa only [mem_map, mem_univ, Function.Embedding.coeFn_mk, true_and,
      mem_sdiff, mem_singleton, e] using! isUnit_iff_ne_zero
  calc
    _ = ∑ x ∈ univ \ {(0 : ZMod p)}, x^k := by
      rw [← sum_sdiff ({0} : Finset (ZMod p)).subset_univ, sum_singleton,
        zero_pow hk.ne', add_zero]
    _ = ∑ x : (ZMod p)ˣ, (x : ZMod p)^k := by simp [← he,e]
    _ = _ := by rw [FiniteField.sum_pow_units, ZMod.card]
lemma character_sum {p m : ℕ} [Fact p.Prime] (hp : p = 4*m+1) (n : ZMod p) :
    ∑ x : ZMod p, (quadraticChar (ZMod p) (x^3-n^2*x) : ZMod p) =
      - ((2*m).choose m : ZMod p) * (-n^2)^m := by
  have hprime : p.Prime := Fact.out
  have hm : 0 < m := by have := hprime.two_le; omega
  have hchar : ringChar (ZMod p) ≠ 2 := by rw [ZMod.ringChar_zmod_n]; omega
  let c (j : ℕ) : ZMod p := (-n^2)^(2*m-j) * ((2*m).choose j : ZMod p)
  have hex (x : ZMod p) :
      (quadraticChar (ZMod p) (x^3-n^2*x) : ZMod p) =
        ∑ j ∈ range (2*m+1), x^(2*m+2*j) * c j := by
    rw [quadraticChar_eq_pow_of_char_ne_two' hchar, ZMod.card,
      show p / 2 = 2*m by omega,
      show x^3-n^2*x = x*(x^2 + (-n^2)) by ring, mul_pow, add_pow,
      Finset.mul_sum]
    apply sum_congr rfl
    intro j _
    simp only [c, pow_add, pow_mul]
    ring
  simp_rw [hex]
  rw [sum_comm]
  have hs (j : ℕ) (hj : j ∈ range (2*m+1)) :
      ∑ x : ZMod p, x^(2*m+2*j) * c j = if j=m then - c m else 0 := by
    rw [← sum_mul, sum_power _ (by omega)]
    have hd : p-1 ∣ 2*m+2*j ↔ j=m := by
      constructor
      · rintro ⟨k,hk⟩
        have hj' := mem_range.mp hj
        have hpk : p-1 = 4*m := by omega
        rw [hpk] at hk
        have hkpos : k > 0 := by by_contra! h; simp [show k=0 by omega] at hk; omega
        have hklt : k < 2 := by
          by_contra! hg
          have hmul := Nat.mul_le_mul_left (4*m) hg
          omega
        have := show k=1 by omega
        simp [this] at hk
        omega
      · rintro rfl
        exact ⟨1,by omega⟩
    simp only [hd]
    split_ifs with h
    · subst j; ring
    · simp
  rw [sum_congr rfl hs]
  simp [c, show m < 2*m+1 by omega, show 2*m-m=m by omega]
  ring

theorem point_count {p m : ℕ} [Fact p.Prime] (hp : p = 4*m+1) (n : ZMod p) :
    let N := (univ.filter fun xy : ZMod p × ZMod p => xy.2^2 = xy.1^3-n^2*xy.1).card
    (N : ZMod p) = - ((2*m).choose m : ZMod p) * (-n^2)^m := by
  classical
  let f := fun x : ZMod p => x^3-n^2*x
  have hc : ringChar (ZMod p) ≠ 2 := by rw [ZMod.ringChar_zmod_n]; omega
  have hf (x : ZMod p) : ((univ.filter fun y : ZMod p => y^2=f x).card : ℤ) =
      quadraticChar (ZMod p) (f x) + 1 := by
    simpa using quadraticChar_card_sqrts hc (f x)
  have hcount : ((univ.filter fun xy : ZMod p × ZMod p => xy.2^2=f xy.1).card : ℤ)
      = (∑ x : ZMod p, quadraticChar (ZMod p) (f x)) + p := by
    rw [Finset.card_filter, Fintype.sum_prod_type]
    simp only [← Finset.card_filter, Nat.cast_sum, hf, Finset.sum_add_distrib]
    simp
  have hc' := congrArg (Int.castRingHom (ZMod p)) hcount
  push_cast at hc'
  exact (show _ = ∑ x : ZMod p, (quadraticChar (ZMod p) (f x) : ZMod p) by
    simpa [f] using hc').trans (character_sum hp n)
theorem hasse_ne_zero_one {p m : ℕ} [Fact p.Prime] (hp : p = 4*m+1)
    (n : ZMod p) (hn : n ≠ 0) :
    let H := ((2*m).choose m : ZMod p) * (-n^2)^m
    H ≠ 0 ∧ H ≠ 1 := by
  let N := (univ.filter fun xy : ZMod p × ZMod p => xy.2^2=xy.1^3-n^2*xy.1).card
  have hc : (N : ZMod p) = -(((2*m).choose m : ZMod p) * (-n^2)^m) := by
    simpa [N,neg_mul] using point_count hp n
  constructor
  · intro h
    change ((2*m).choose m : ZMod p) * (-n^2)^m = 0 at h
    have hd : p ∣ N := (ZMod.natCast_eq_zero_iff ..).mp (by simpa [h] using hc)
    have ho := TunnellCoates.ordinary_split_good_prime (show p%4=1 by omega) n hn
    apply ho
    exact dvd_sub (dvd_refl _) (by exact_mod_cast hd)
  · intro h
    change ((2*m).choose m : ZMod p) * (-n^2)^m = 1 at h
    apply TunnellCoates.non_anomalous_good_prime (by omega) n hn
    apply (ZMod.natCast_eq_zero_iff ..).mp
    change ((N+1:ℕ) : ZMod p)=0
    push_cast
    rw [hc,h]
    ring
end TunnellHasseInvariant
end

/- TunnellLemniscaticCoefficients -/
section
namespace TunnellLemniscaticCoefficients
open PowerSeries
variable {O:Type*} [CommRing O] [IsDomain O] [CharZero O]
lemma euler_coefficient (D:O⟦X⟧) (j:ℕ) :
    coeff j (X*derivative O D) = (j:O)*coeff j D := by
  cases j with
  | zero => simp
  | succ j => rw [coeff_succ_X_mul,coeff_derivative,Nat.cast_succ,mul_comm]
 
theorem quartic_coefficient (D:O⟦X⟧) (n:O) (hconst : constantCoeff D=1)
    (h : D^2*(1+C (4*n^2)*X^4)=1) (m:ℕ) :
    coeff (4*m) D = (m.centralBinom:O)*(-n^2)^m := by
  have hD : D≠0 := fun hh => by simp [hh] at hconst
  let Z : O⟦X⟧ := X*derivative O D
  have hdiff := congrArg (derivative O) h
  simp only [Derivation.leibniz, Derivation.leibniz_pow, map_add, derivative_C,
    derivative_one, derivative_X, smul_eq_mul, nsmul_eq_mul, zero_add, mul_zero,
    add_zero, mul_one, Nat.reduceSub, pow_one, Nat.cast_ofNat] at hdiff
  have he : Z + C (4*n^2)*(X^4*Z)+C (8*n^2)*(X^4*D)=0 := by
    apply (mul_eq_zero.mp (show (2*D)*(Z+C (4*n^2)*(X^4*Z)+C (8*n^2)*(X^4*D))=0 by
      dsimp [Z]
      simp only [map_mul,map_ofNat,map_pow] at hdiff ⊢
      linear_combination (X:O⟦X⟧)*hdiff)).resolve_left (mul_ne_zero (show (2:O⟦X⟧) ≠ 0 from fun he => by
        have he' := congrArg (constantCoeff (R:=O)) he
        simpa [map_ofNat] using he') hD)
  have hec (j:ℕ) := congrArg (coeff (R:=O) (4*j+4)) he
  simp only [map_add,coeff_C_mul,coeff_X_pow_mul,map_zero] at hec
  have hz (j:ℕ) : coeff j Z=(j:O)*coeff j D := euler_coefficient D j
  induction m with
  | zero => simpa [coeff_zero_eq_constantCoeff] using hconst
  | succ m ih =>
    have hnext := hec m
    rw [hz,hz,ih] at hnext
    rw [show 4*m+4=4*(m+1) by omega] at hnext
    have hbin : ((m:O)+1)*((m+1).centralBinom:O) =
        2*(2*(m:O)+1)*(m.centralBinom:O) := by
      exact_mod_cast Nat.succ_mul_centralBinom_succ m
    have hc : (4*((m:O)+1))≠0 :=
      mul_ne_zero (by norm_num) (by exact_mod_cast Nat.succ_ne_zero m)
    apply mul_left_cancel₀ hc
    rw [pow_succ]
    push_cast at hnext
    linear_combination hnext + 4*n^2*(-n^2)^m*hbin
end TunnellLemniscaticCoefficients
end

/- TunnellHeightOne -/
section
namespace TunnellHeightOne
open ChabautyColeman IsLocalRing IsDedekindDomain IsDedekindDomain.HeightOneSpectrum
open scoped PowerSeries
variable {R K:Type*} [CommRing R] [IsDedekindDomain R] [Field K]
  [Algebra R K] [IsFractionRing R K] [CharZero K] {v:HeightOneSpectrum R}

theorem split_prime_series {p m : ℕ} [Fact p.Prime] (hp:p=4*m+1)
    (ρ:ResidueField (v.adicCompletionIntegers K) ≃+* ZMod p)
    (n:v.adicCompletionIntegers K) (hn : ρ (residue _ n) ≠ 0) :
    let O := v.adicCompletionIntegers K
    let F := (TunnellCoates.E n).formalGroupLaw.mulSeries p
    let H := ρ (residue O (PowerSeries.coeff p F))
    PowerSeries.constantCoeff F = 0 ∧ PowerSeries.coeff 1 F = (p:O) ∧
      (∀ j < p, PowerSeries.coeff j F ∈ maximalIdeal O) ∧
      H = ((2*m).choose m : ZMod p)*(-(ρ (residue O n))^2)^m ∧ H ≠ 0 ∧ H ≠ 1 := by
  let O := v.adicCompletionIntegers K
  let Φ := (TunnellCoates.E n).formalGroupLaw
  have hco : CharZero (v.adicCompletion K) :=
    charZero_of_injective_algebraMap (algebraMap K (v.adicCompletion K)).injective
  have : CharZero O := (algebraMap O (v.adicCompletion K)).charZero
  have hmem : (p:O) ∈ maximalIdeal O := by
    apply (residue_eq_zero_iff _).mp
    apply ρ.injective
    simp
  obtain ⟨hbelow,hpF⟩ := TunnellFormalGroupHeight.prime_jet Φ (Fact.out:p.Prime) hmem
  have hD : PowerSeries.constantCoeff (Φ.diffMatrix⁻¹ () ())=1 := by
    rw [PowerSeries.constantCoeff_eq]
    simpa using congrArg (fun M => M () ()) Φ.diffMatrixInv_map_constantCoeff
  have hcoef := TunnellLemniscaticCoefficients.quartic_coefficient (Φ.diffMatrix⁻¹ () ()) n
    hD (TunnellChordDifferential.differential_square n) m
  have hval : ρ (residue O (PowerSeries.coeff p (Φ.mulSeries p))) =
      ((2*m).choose m : ZMod p)*(-(ρ (residue O n))^2)^m := by
    rw [hpF,show p-1=4*m by omega,hcoef]
    simp [Nat.centralBinom,O]
  have hneq := TunnellHasseInvariant.hasse_ne_zero_one hp _ hn
  refine ⟨Φ.constantCoeff_mulSeries _,ChabautyColeman.coeff_single_mulSeries Φ p,
    fun j hj => (residue_eq_zero_iff _).mp (hbelow j hj),hval,?_,?_⟩
  · rw [hval]; exact hneq.1
  · rw [hval]; exact hneq.2
end TunnellHeightOne
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

/- TunnellLocalElliptic -/
section
namespace TunnellLocalDivisibility
open IsDedekindDomain TunnellCoates WeierstrassCurve TunnellLocalCM
noncomputable abbrev place (p : ℕ) [Fact p.Prime] : HeightOneSpectrum ℤ :=
  Rat.HeightOneSpectrum.primesEquiv.symm ⟨p,Fact.out⟩
abbrev Local (p : ℕ) [Fact p.Prime] := (place p).adicCompletion ℚ
end TunnellLocalDivisibility
end

/- TunnellLocalGood -/
section
namespace TunnellLocalDivisibility
open WeierstrassCurve TunnellCoates IsLocalRing IsDedekindDomain
variable {p : ℕ} [Fact p.Prime]
noncomputable def localIntegralEquiv (p:ℕ) [Fact p.Prime] :
    (place p).adicCompletionIntegers ℚ ≃+* ℤ_[p] := by
  letI : Algebra ℤ ((place p).adicCompletionIntegers ℚ) := Ring.toIntAlgebra _
  exact (PadicInt.adicCompletionIntegersEquiv ℤ ⟨p,Fact.out⟩).toAlgEquiv.toRingEquiv.symm
end TunnellLocalDivisibility
end

/- TunnellPadicDivisionSeries -/
section
namespace TunnellPadicDivisionSeries
open TunnellLocalDivisibility TunnellCoates PowerSeries IsLocalRing
open scoped Polynomial
variable {p:ℕ} [Fact p.Prime]
noncomputable abbrev IntegerRing (l:ℕ) [Fact l.Prime] := (place l).adicCompletionIntegers ℚ
lemma base_uniformizer :
    maximalIdeal (IntegerRing p) = Ideal.span {(p:(IntegerRing p))} ∧ (p:(IntegerRing p)) ∉ maximalIdeal (IntegerRing p)^2 := by
  let e := localIntegralEquiv p
  constructor
  · ext x
    rw [← Ideal.apply_mem_of_equiv_iff (f:=e),← Ideal.apply_mem_of_equiv_iff (f:=e) (I:=Ideal.span {(p:(IntegerRing p))})]
    simp [IsLocalRing.map_ringEquiv_maximalIdeal,PadicInt.maximalIdeal_eq_span_p,Ideal.map_span]
  · intro h
    have he := Ideal.mem_map_of_mem e h
    rw [map_natCast,Ideal.map_pow,IsLocalRing.map_ringEquiv_maximalIdeal,PadicInt.maximalIdeal_eq_span_p,
      Ideal.span_singleton_pow] at he
    have hv := (PadicInt.mem_span_pow_iff_le_valuation _ (show (p:ℤ_[p])≠0 by exact_mod_cast (Fact.out:p.Prime).ne_zero) _).mp he
    rw [PadicInt.valuation_p] at hv
    omega
theorem equations {m n:ℕ} (hp:p=4*m+1) (hn:¬p∣n) (r:ℕ) :
    let F := (E (n:(IntegerRing p))).formalGroupLaw.mulSeries p
    ∃ (P : (IntegerRing p)[X]) (U : (IntegerRing p)⟦X⟧), (TunnellFormalPrimitive.primitive F r).IsWeierstrassFactorization P U ∧
      P.natDegree=Nat.totient (p^(r+1)) ∧ P.IsEisensteinAt (maximalIdeal (IntegerRing p)) ∧
      residue (IntegerRing p) (coeff p F) ≠ 1 := by
  let e := (ResidueField.mapEquiv (localIntegralEquiv p)).trans PadicInt.residueField
  have hnn : e (residue (IntegerRing p) (n:(IntegerRing p))) ≠ 0 := by simpa [ZMod.natCast_eq_zero_iff] using hn
  obtain ⟨h₀,h₁,hbelow,_,hH,hH₁⟩ := TunnellHeightOne.split_prime_series hp e (n:(IntegerRing p)) hnn
  have hcomp : IsAdicComplete (maximalIdeal (IntegerRing p)) (IntegerRing p) :=
    (Fact.out : IsAdic (maximalIdeal (IntegerRing p))).isAdicComplete_iff.mpr ⟨inferInstance,inferInstance⟩
  have hu : coeff p ((E (n:(IntegerRing p))).formalGroupLaw.mulSeries p) ∉ maximalIdeal (IntegerRing p) := by
    exact fun h => hH (by rw [(residue_eq_zero_iff _).mpr h,map_zero])
  have hl := (base_uniformizer (p:=p)).2
  obtain ⟨P,U,hf,hd,he⟩ := TunnellFormalPrimitive.primitive_eisenstein _ (Fact.out:p.Prime) h₀
    (h₁ ▸ hl) hbelow hu r
  exact ⟨P,U,hf,hd,he,fun h => hH₁ (by rw [h,map_one])⟩
end TunnellPadicDivisionSeries
end

/- TunnellPreparedRootPlace -/
section
namespace TunnellPreparedRootPlace
open IsLocalRing IsDedekindDomain IsDedekindDomain.HeightOneSpectrum Polynomial
open scoped Polynomial
 
structure RootPlace (A K : Type) [CommRing A] [Field K] [Algebra A K] (P:A[X]) where
  S : Type
  L : Type
  [sComm : CommRing S]
  [sDedekind : IsDedekindDomain S]
  [lField : Field L]
  [sAlg : Algebra S L]
  [sFrac : IsFractionRing S L]
  [lChar : CharZero L]
  v : HeightOneSpectrum S
  f : A →+* v.adicCompletionIntegers L
  [fLoc : IsLocalHom f]
  embed : K →+* v.adicCompletion L
  compat (x:A) : (f x:v.adicCompletion L) = embed (algebraMap A K x)
  t : v.adicCompletionIntegers L
  root : P.eval₂ f t = 0
instance sCommInst {A K : Type} [CommRing A] [Field K] [Algebra A K] {P:A[X]} (s:RootPlace A K P) : CommRing s.S := s.sComm
instance sDedekindInst {A K : Type} [CommRing A] [Field K] [Algebra A K] {P:A[X]} (s:RootPlace A K P) : IsDedekindDomain s.S := s.sDedekind
instance lFieldInst {A K : Type} [CommRing A] [Field K] [Algebra A K] {P:A[X]} (s:RootPlace A K P) : Field s.L := s.lField
instance sAlgInst {A K : Type} [CommRing A] [Field K] [Algebra A K] {P:A[X]} (s:RootPlace A K P) : Algebra s.S s.L := s.sAlg
instance sFracInst {A K : Type} [CommRing A] [Field K] [Algebra A K] {P:A[X]} (s:RootPlace A K P) : IsFractionRing s.S s.L := s.sFrac
instance lCharInst {A K : Type} [CommRing A] [Field K] [Algebra A K] {P:A[X]} (s:RootPlace A K P) : CharZero s.L := s.lChar
instance fLocInst {A K : Type} [CommRing A] [Field K] [Algebra A K] {P:A[X]} (s:RootPlace A K P) : IsLocalHom s.f := s.fLoc
theorem exists_root_place {A K : Type} [CommRing A] [IsDomain A] [IsDiscreteValuationRing A]
    [Field K] [CharZero K] [Algebra A K] [IsFractionRing A K] {P:A[X]} (hm:P.Monic)
    (he : P.IsEisensteinAt (maximalIdeal A)) (hd : 0<P.natDegree) :
    Nonempty (RootPlace A K P) := by
  let q := P.map (algebraMap A K)
  have hq : Irreducible q := (hm.irreducible_iff_irreducible_map_fraction_map).mp (he.irreducible inferInstance hm.isPrimitive hd)
  letI : Fact (Irreducible q) := ⟨hq⟩
  let L := AdjoinRoot q
  let S := integralClosure A L
  haveI : FiniteDimensional K L := (hm.map (algebraMap A K)).finite_adjoinRoot
  haveI : CharZero L := charZero_of_injective_algebraMap (algebraMap K L).injective
  haveI : IsFractionRing S L := integralClosure.isFractionRing_of_finite_extension K L
  haveI : IsDedekindDomain S := integralClosure.isDedekindDomain A K L
  haveI : Algebra.IsIntegral A S := IsIntegralClosure.isIntegral_algebra A L
  haveI : FaithfulSMul A L := (faithfulSMul_iff_algebraMap_injective A L).mpr (by
    rw [IsScalarTower.algebraMap_eq A K L]
    exact (algebraMap K L).injective.comp (IsFractionRing.injective A K))
  haveI : FaithfulSMul A S := (FaithfulSMul.tower_bot A S L)
  obtain ⟨Q,hQ,hQA⟩ := Ideal.exists_maximal_ideal_liesOver_of_isIntegral (S:=S) (maximalIdeal A)
  have hdQ : Q ≠ ⊥ := by
    intro eq
    have h := hQA.over
    rw [eq, Ideal.under,←RingHom.ker_eq_comap_bot,(RingHom.injective_iff_ker_eq_bot _).mp (FaithfulSMul.algebraMap_injective A S)] at h
    exact IsDiscreteValuationRing.not_a_field A h
  let v : HeightOneSpectrum S := ⟨Q,hQ.isPrime,hdQ⟩
  let f := (algebraMap S (v.adicCompletionIntegers L)).comp (algebraMap A S)
  have hMax : (maximalIdeal (v.adicCompletionIntegers L)).comap f=maximalIdeal A := by
    rw [show f=(algebraMap S (v.adicCompletionIntegers L)).comp (algebraMap A S) from rfl,←Ideal.comap_comap, v.comap_maximalIdeal_adicCompletionIntegers]
    exact hQA.over.symm
  haveI : IsLocalHom f := ⟨fun a ha => by
    by_contra hn
    have hmem : a∈maximalIdeal A := hn
    rw [←hMax] at hmem
    exact hmem ha⟩
  have hx : P.eval₂ (algebraMap A L) (AdjoinRoot.root q)=0 := by
    rw [IsScalarTower.algebraMap_eq A K L,←eval₂_map]
    change aeval (AdjoinRoot.root q) q=0
    rw [AdjoinRoot.aeval_eq,AdjoinRoot.mk_self]
  let x:S := ⟨AdjoinRoot.root q,P,hm,hx⟩
  have hs : P.eval₂ (algebraMap A S) x=0 := by
    apply (IsFractionRing.injective S L)
    rw [map_zero,Polynomial.hom_eval₂,←IsScalarTower.algebraMap_eq]
    exact hx
  refine ⟨⟨S,L,v,f,(algebraMap L (v.adicCompletion L)).comp (algebraMap K L),?_,algebraMap S (v.adicCompletionIntegers L) x,?_⟩⟩
  · intro a
    change (algebraMap L (v.adicCompletion L)) ((algebraMap S L) ((algebraMap A S) a)) = _
    rw [←IsScalarTower.algebraMap_apply A S L,IsScalarTower.algebraMap_apply A K L]; rfl
  · rw [show f=(algebraMap S (v.adicCompletionIntegers L)).comp (algebraMap A S) from rfl,←Polynomial.hom_eval₂,hs,map_zero]
theorem root_minpoly {A K:Type} [CommRing A] [IsDomain A] [IsDiscreteValuationRing A]
    [Field K] [Algebra A K] [IsFractionRing A K] {P:A[X]} (hm:P.Monic)
    (he : P.IsEisensteinAt (maximalIdeal A)) (hd : 0<P.natDegree) (s:RootPlace A K P) :
    letI := s.embed.toAlgebra
    minpoly K (s.t : s.v.adicCompletion s.L) = P.map (algebraMap A K) := by
  letI := s.embed.toAlgebra
  apply Eq.symm
  apply minpoly.eq_of_irreducible_of_monic (hm.irreducible_iff_irreducible_map_fraction_map.mp (he.irreducible inferInstance hm.isPrimitive hd)) _ (hm.map _)
  rw [aeval_def,Polynomial.eval₂_map]
  have hh := congrArg (algebraMap (s.v.adicCompletionIntegers s.L) (s.v.adicCompletion s.L)) s.root
  rw [map_zero,Polynomial.hom_eval₂] at hh
  have hc : (algebraMap K (s.v.adicCompletion s.L)).comp (algebraMap A K)=
      (algebraMap (s.v.adicCompletionIntegers s.L) (s.v.adicCompletion s.L)).comp s.f :=
    RingHom.ext (fun x => (s.compat x).symm)
  rw [hc]; exact hh
end TunnellPreparedRootPlace
end

/- TunnellPrimitiveModel -/
section
namespace TunnellPrimitiveModel
open IsLocalRing IsDedekindDomain IsDedekindDomain.HeightOneSpectrum WeierstrassCurve WeierstrassCurve.Affine
open TunnellCoates TunnellKummer TunnellCMTorsionField TunnellFormalQuarter TunnellGaussianEnd
open scoped Polynomial
noncomputable section
variable {R K:Type} [CommRing R] [IsDedekindDomain R] [Field K] [CharZero K] [Algebra R K] [IsFractionRing R K]
    {v : HeightOneSpectrum R} [DecidableEq (v.adicCompletion K)]
theorem on_model (n i:(v.adicCompletionIntegers K)) (hi:i^2= -1) {p:ℕ} (a:GaussianInt) (hnorm:a.re^2+a.im^2=(p:ℤ))
    (hu:IsUnit ((a.re:(v.adicCompletionIntegers K))-(a.im:(v.adicCompletionIntegers K))*i)) (r:ℕ) (Z:(E n).formalGroupLaw.Points) (hz:addOrderOf Z=p^r)
    (W:WeierstrassCurve (v.adicCompletion K)) [W.IsElliptic] (hW:W=E (n:(v.adicCompletion K))) :
    ∃ T : W.toAffine.Point,
      T=formalPoint ((base_curve n).trans hW.symm) Z ∧ addOrderOf T=p^r ∧
      endo (quarter hW (i:(v.adicCompletion K)) (by exact_mod_cast hi)) (a^r).re (a^r).im T=0 := by
  subst W
  have hk : p^r • Z=0 := hz ▸ addOrderOf_nsmul_eq_zero Z
  have he : quarter (n:=(n:(v.adicCompletion K))) rfl (i:(v.adicCompletion K)) (by exact_mod_cast hi)=
      TunnellLocalCM.gaussianI (n:(v.adicCompletion K)) (i:(v.adicCompletion K)) (by exact_mod_cast hi) := by ext T; cases T <;> rfl
  let T := toPoint n Z
  have hI := TunnellLocalCM.gaussianI_square (n:(v.adicCompletion K)) (i:(v.adicCompletion K)) (by exact_mod_cast hi)
  refine ⟨T,rfl,(addOrderOf_injective (toPoint n) (formalPoint_injective (base_curve n)) Z).trans hz,?_⟩
  rw [he,← TunnellLocalCMCoordDegree.endo_iterate _ hI]
  exact TunnellFormalPrimaryCM.primary_of_nsmul n i hi a.re a.im hnorm hu r Z hk
theorem order_in_place {A:Type} [CommRing A] [IsLocalRing A] (f:A→+*(v.adicCompletionIntegers K)) (n:A) {p:ℕ} [Fact p.Prime]
    (hl:f (PowerSeries.coeff 1 ((E n).formalGroupLaw.mulSeries p))≠0)
    (r:ℕ) {P:A[X]} {U:PowerSeries A}
    (hfac:(TunnellFormalPrimitive.primitive ((E n).formalGroupLaw.mulSeries p) r).IsWeierstrassFactorization P U)
    {t:(v.adicCompletionIntegers K)} (ht:t∈maximalIdeal (v.adicCompletionIntegers K)) (hroot:P.eval₂ f t=0) :
    addOrderOf (show (E (f n)).formalGroupLaw.Points from fun _ => ⟨t,ht⟩)=p^(r+1) := by
  haveI : CharZero (v.adicCompletion K) := charZero_of_injective_algebraMap (algebraMap K (v.adicCompletion K)).injective
  haveI : CharZero (v.adicCompletionIntegers K) := (algebraMap (v.adicCompletionIntegers K) (v.adicCompletion K)).charZero
  have h := TunnellFormalPrimitivePoint.root_of_prepared f (E n) hl r hfac ht hroot
  have hW : (E n).map f=E (f n) := by ext <;> simp [E,WeierstrassCurve.map]
  rwa [hW] at h
end
end TunnellPrimitiveModel
end


/- Signed Hasse invariant -/
section
namespace TunnellPreparedHasse

open PowerSeries IsLocalRing
open scoped Polynomial

variable {A : Type*} {B : Type} [CommRing A] [IsDomain A] [IsLocalRing A]
    [CommRing B] [IsLocalRing B]

private lemma top_coeff {g U : A⟦X⟧} {P : A[X]} (h : g.IsWeierstrassFactorization P U) :
    residue A (coeff P.natDegree g) = residue A (constantCoeff U) := by
  let ρ := residue A
  have hmap : map ρ g = X^P.natDegree * map ρ U := by
    rw [h.eq_mul, map_mul, ← Polynomial.polynomial_map_coe]
    have hρ : P.map ρ = Polynomial.X^P.natDegree := h.isDistinguishedAt.map_eq_X_pow
    rw [hρ]
    simp
  have hc := congrArg (coeff (0+P.natDegree)) hmap
  rw [coeff_X_pow_mul] at hc
  simpa [ρ] using hc

/-- If a height-one primitive polynomial has root t, the residue of π/t^d
equals minus the first nonzero coefficient of its reduced division series. -/
theorem signed_unit (f : A →+* B) [IsLocalHom f] {π : A} (hπ : maximalIdeal A = Ideal.span {π})
    (hπ₀ : π ≠ 0) {g U : A⟦X⟧} {P : A[X]} (h : g.IsWeierstrassFactorization P U)
    (he : P.IsEisensteinAt (maximalIdeal A)) (hd : 0 < P.natDegree)
    (hg : constantCoeff g = π) (t : B) (ht : P.eval₂ f t = 0) :
    t ∈ maximalIdeal B ∧ ∃ u : Bˣ, (u:B) * t^P.natDegree = f π ∧
        residue B (u:B) = -residue B (f (coeff P.natDegree g)) := by
  obtain ⟨hmem,a,v,h₀,hpow,hres⟩ := TunnellEisensteinRoot.root_relation f hπ h.isDistinguishedAt.monic he hd t ht
  have ha : (a:A)*constantCoeff U=1 := by
    apply mul_left_cancel₀ hπ₀
    rw [←mul_assoc,←h₀,mul_one,←hg,h.eq_mul,map_mul]
    simp
  have hprod : residue B (v:B) * (-residue B (f (coeff P.natDegree g)))=1 := by
    rw [hres,neg_mul_neg]
    have hcoe := congrArg (ResidueField.map f) (top_coeff h)
    simp only [ResidueField.map_residue] at hcoe
    rw [hcoe,←map_mul,←map_mul,ha,map_one,map_one]
  refine ⟨hmem,v⁻¹,?_,?_⟩
  · rw [hpow,mul_left_comm]
    simp
  · have hx := congrArg (fun b : ResidueField B => residue B ((v⁻¹:Bˣ):B) * b) hprod
    rw [←mul_assoc,←map_mul,Units.inv_mul, map_one, one_mul,mul_one] at hx
    exact hx.symm


end TunnellPreparedHasse
end

/- First division coefficient -/
section
namespace TunnellFirstPlacePowers
open IsLocalRing PowerSeries TunnellFormalPrimitive TunnellPadicDivisionSeries TunnellCoates
open scoped Polynomial
noncomputable section
variable {p:ℕ} [Fact p.Prime]


theorem first_data (n:ℕ) :
    let F:=((E (n:(IntegerRing p))).formalGroupLaw.mulSeries p)
    constantCoeff (primitive F 0)=(p:(IntegerRing p)) ∧ coeff (p-1) (primitive F 0)=coeff p F := by
  let F:=((E (n:(IntegerRing p))).formalGroupLaw.mulSeries p)
  have hr:primitive F 0=quotient F := by
    change (quotient F).subst (X:(IntegerRing p)⟦X⟧)=_
    rw [←map_algebraMap_eq_subst_X (S:=(IntegerRing p)),Algebra.algebraMap_self,map_id]; rfl
  change constantCoeff (primitive F 0)=(p:(IntegerRing p)) ∧ coeff (p-1) (primitive F 0)=coeff p F
  rw [hr]
  have hp:0<p := (Fact.out:p.Prime).pos
  constructor
  · simpa [quotient,F] using ChabautyColeman.coeff_single_mulSeries (E (n:(IntegerRing p))).formalGroupLaw p
  · simp [quotient,show p-1+1=p by omega]


end
end TunnellFirstPlacePowers
end

/- Formal parameter -/
section
namespace TunnellTameParameter
open IsLocalRing IsDedekindDomain IsDedekindDomain.HeightOneSpectrum WeierstrassCurve WeierstrassCurve.Affine
open TunnellKummer
noncomputable section

def parameter {K:Type*} [Field K] {W:WeierstrassCurve K} : W.toAffine.Point→K
  | .zero => 0
  | .some x y _ => -x/y

variable {R K:Type*} [CommRing R] [IsDedekindDomain R] [Field K] [Algebra R K] [IsFractionRing R K]
    {v:HeightOneSpectrum R} [DecidableEq (v.adicCompletion K)]
variable {W:WeierstrassCurve (v.adicCompletion K)} {W₀:WeierstrassCurve (v.adicCompletionIntegers K)}
    (hW:W₀.map (algebraMap (v.adicCompletionIntegers K) (v.adicCompletion K))=W) [W.IsElliptic]

theorem parameter_formal (Z:W₀.formalGroupLaw.Points) :
    parameter (formalPoint hW Z)=((Z ():(v.adicCompletionIntegers K)):(v.adicCompletion K)) := by
  by_cases hz:(Z ():(v.adicCompletionIntegers K))=0
  · rw [formalPoint_of_param_eq_zero hW hz,hz]; rfl
  rw [formalPoint_of_param_ne_zero hW hz]
  have hw : ((W₀.wEval (Z ():(v.adicCompletionIntegers K)):(v.adicCompletionIntegers K)):(v.adicCompletion K))≠0 := by exact_mod_cast W₀.wEval_ne_zero (Z ()).2 hz
  change -(↑(Z ():(v.adicCompletionIntegers K))/(W₀.wEval (Z ():(v.adicCompletionIntegers K)):(v.adicCompletion K)))/(-1/(W₀.wEval (Z ():(v.adicCompletionIntegers K)):(v.adicCompletion K)))=_
  field_simp


end
end TunnellTameParameter
end

/- Signed first division point -/
section
namespace TunnellSignedLocalAffine

open IsLocalRing IsDedekindDomain IsDedekindDomain.HeightOneSpectrum WeierstrassCurve WeierstrassCurve.Affine
open TunnellCoates TunnellKummer TunnellCMTorsionField TunnellFormalQuarter TunnellGaussianEnd
open TunnellPadicDivisionSeries TunnellLocalDivisibility TunnellPreparedRootPlace
open scoped Polynomial Classical

noncomputable section

set_option maxHeartbeats 1700000 in
def Certificate:Prop :=
  ∀ (n p:ℕ) (hp:p.Prime),0<n → p%4=1 → ¬p∣2*n → ∀ q:GaussianInt,q.norm.natAbs=p →
  let v:HeightOneSpectrum ℤ:=Rat.HeightOneSpectrum.primesEquiv.symm ⟨p,hp⟩
  let Q:Type:=v.adicCompletion ℚ
  let Z:ValuationSubring (v.adicCompletion ℚ):=v.adicCompletionIntegers ℚ
  ∀ j:Z,j^2= -1 → IsUnit ((Int.castRingHom Z) q.re-(Int.castRingHom Z) q.im*j) →
  ∃ (N:Type) (fN:Field N),letI:=fN;
  ∃ R:ValuationSubring N,IsDiscreteValuationRing R ∧ ∃ (g:Q→+*N) (f:Z→+*R),IsLocalHom f ∧
    (∀ z:Z,(f z:N)=g z.val) ∧ ∃ (s:R) (u:Rˣ),s∈maximalIdeal R ∧
    (u:R)*s^(p-1)=(p:R) ∧ residue R (u:R)≠ -1 ∧
    (letI:Algebra Q N:=g.toAlgebra; (minpoly Q (s:N)).natDegree=p-1) ∧
    let W:WeierstrassCurve N:=⟨0,0,0,-(n:N)^2,0⟩
    ∃ (x y:N) (h:W.toAffine.Nonsingular x y) (l:W.toAffine.Nonsingular (-x) ((f j:N)*y)),
    let P:=WeierstrassCurve.Affine.Point.some x y h;
    -x/y=(s:N) ∧ addOrderOf P=p ∧ q.re • P+q.im • (.some (-x) ((f j:N)*y) l)=0

set_option maxHeartbeats 1600000 in
theorem result : Certificate := by
  classical
  refine fun n p hp hn hmod hgood q hq j hj hu => ?_
  letI : Fact p.Prime := ⟨hp⟩
  let r:ℕ:=0
  let A := IntegerRing p
  let K := Local p
  haveI : CharZero K := charZero_of_injective_algebraMap (algebraMap ℚ K).injective
  have hsplit : p=4*(p/4)+1 := by omega
  obtain ⟨P,U,hfac,hd,he,hH⟩ := equations hsplit (fun h => hgood (dvd_mul_of_dvd_right h 2)) r
  have hd₀ : 0<P.natDegree := by rw [hd]; exact Nat.totient_pos.mpr (pow_pos hp.pos _)
  obtain ⟨s⟩ := exists_root_place (K:=K) hfac.isDistinguishedAt.monic he hd₀
  let B := s.v.adicCompletionIntegers s.L
  let N := s.v.adicCompletion s.L
  letI : Algebra K N := s.embed.toAlgebra
  haveI : CharZero N := charZero_of_injective_algebraMap s.embed.injective
  haveI : CharZero B := (algebraMap B N).charZero
  let nB := s.f (n:A)
  let iB := s.f j
  have hiB : iB^2= -1 := by simpa [iB] using congrArg s.f hj
  obtain ⟨ht,_,u,_,hrelation,_⟩ := TunnellEisensteinRoot.root_relation s.f (base_uniformizer (p:=p)).1
    hfac.isDistinguishedAt.monic he hd₀ s.t s.root
  let Z : (E nB).formalGroupLaw.Points := fun _ => ⟨s.t,ht⟩
  have hlin : s.f (PowerSeries.coeff 1 ((E (n:A)).formalGroupLaw.mulSeries p))≠0 := by
    have co : PowerSeries.coeff 1 ((E (n:A)).formalGroupLaw.mulSeries p)=(p:A) := ChabautyColeman.coeff_single_mulSeries _ _
    rw [co,map_natCast]
    exact Nat.cast_ne_zero.mpr hp.ne_zero
  have hz := TunnellPrimitiveModel.order_in_place s.f (n:A) hlin r hfac ht s.root
  change addOrderOf Z=p^(r+1) at hz
  let W := E (n:N)
  have hW : W=E (nB:N) := by simp [W,nB]
  haveI : W.IsElliptic := E_elliptic (by norm_num) (by exact_mod_cast hn.ne')
  have hunit : IsUnit ((q.re:B)-(q.im:B)*iB) := by simpa [iB] using hu.map s.f
  have hnorm : q.re^2+q.im^2=(p:ℤ) := by
    have en : q.norm=(p:ℤ) := (Int.natAbs_of_nonneg (GaussianInt.norm_nonneg _)).symm.trans
      (congrArg (fun x:ℕ => (x:ℤ)) hq)
    simpa [Zsqrtd.norm,pow_two] using en
  obtain ⟨Q,hQ,hQo,hQt⟩ := TunnellPrimitiveModel.on_model nB iB hiB q hnorm hunit (r+1) Z hz W hW
  have hdeg : (minpoly K (s.t:N)).natDegree=Nat.totient (p^(r+1)) := by
    rw [root_minpoly hfac.isDistinguishedAt.monic he hd₀ s,hfac.isDistinguishedAt.monic.natDegree_map,hd]
  have hd' : P.natDegree=p-1 :=by simpa [r,Nat.totient_prime hp] using hd
  haveI : CharZero A := (algebraMap A K).charZero
  obtain ⟨_,b,hb,hsig⟩ := TunnellPreparedHasse.signed_unit s.f (base_uniformizer (p:=p)).1
    (Nat.cast_ne_zero.mpr hp.ne_zero) hfac he hd₀ (TunnellFirstPlacePowers.first_data n).1 s.t s.root
  rw [hd',map_natCast] at hb
  have hsign:residue B (b:B)≠ -1:=by
    rw [hd',(TunnellFirstPlacePowers.first_data n).2] at hsig
    intro hbad
    rw [hbad,neg_inj] at hsig
    apply hH
    apply (ResidueField.map s.f).injective
    simpa only [ResidueField.map_residue,map_one] using hsig.symm
  refine ⟨N,inferInstance,B,inferInstance,s.embed,s.f,inferInstance,s.compat,s.t,b,ht,hb,hsign,?_,?_⟩
  · simpa [r,Nat.totient_prime hp] using hdeg
  have hpar:TunnellTameParameter.parameter Q=(s.t:N):=by
    rw [hQ,TunnellTameParameter.parameter_formal]
  have hoQ : addOrderOf Q=p := by simpa [r] using hQo
  have htQ : TunnellGaussianEnd.endo (TunnellGaussianEnd.quarter hW (iB:N) (by exact_mod_cast hiB)) q.re q.im Q=0 := by
    simpa [r] using hQt
  cases Q with
  | zero =>
    have e : (1:ℕ)=p := (addOrderOf_zero (G:=W.toAffine.Point)).symm.trans hoQ
    have := hp.one_lt
    omega
  | some x y k =>
    have l : W.toAffine.Nonsingular (-x) ((iB:N)*y) := by
      apply Affine.equation_iff_nonsingular.mp
      apply (E_equation _ _ _).mpr
      have hiN : (iB:N)^2= -1 := by exact_mod_cast hiB
      rw [mul_pow,hiN,(E_equation _ _ _).mp k.1]
      ring
    refine ⟨x,y,k,l,hpar,hoQ,?_⟩
    exact htQ

end
end TunnellSignedLocalAffine
end

theorem OMA.solution : OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H2_R1_H1_R1.H1 := TunnellSignedLocalAffine.result
