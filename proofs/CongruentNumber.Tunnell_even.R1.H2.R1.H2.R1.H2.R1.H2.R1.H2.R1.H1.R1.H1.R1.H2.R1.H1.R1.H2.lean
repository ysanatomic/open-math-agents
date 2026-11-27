import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H2_R1_H1_R1
import Mathlib
namespace TunnellCMCoefficientCompletion
end TunnellCMCoefficientCompletion
namespace TunnellCMCoefficientNorm
end TunnellCMCoefficientNorm
namespace TunnellCMCritical
end TunnellCMCritical
namespace TunnellCMCriticalCoordinates
end TunnellCMCriticalCoordinates
namespace TunnellCMDivisor
end TunnellCMDivisor
namespace TunnellCMEllipticUnit
end TunnellCMEllipticUnit
namespace TunnellCMExplicitNormWitness
end TunnellCMExplicitNormWitness
namespace TunnellCMGoodDescent
end TunnellCMGoodDescent
namespace TunnellCMLSeries
end TunnellCMLSeries
namespace TunnellCMLocalUnit
end TunnellCMLocalUnit
namespace TunnellCMPrimeDifference
end TunnellCMPrimeDifference
namespace TunnellCMTraceDistribution
end TunnellCMTraceDistribution
namespace TunnellCMUnitCriterion
end TunnellCMUnitCriterion
namespace TunnellCMUnitDistribution
end TunnellCMUnitDistribution
namespace TunnellCMUnitTrace
end TunnellCMUnitTrace
namespace TunnellEllipticZeta
end TunnellEllipticZeta
namespace TunnellFormalQuarter
end TunnellFormalQuarter
namespace TunnellTameParameter
end TunnellTameParameter

/-
This source incorporates selected declarations from EllipticCurves, ClassFieldTheory, and the Weierstrass library of Waldschmidt's subgroup theorem. The Weierstrass sources carry the notice “Copyright (c) 2026. All rights reserved.” The declarations have been combined with their dependencies.
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
open NumberField IsDedekindDomain
open scoped NumberField Classical
universe u v
variable {K : Type u} {L : Type v} [Field K] [NumberField K] [Field L] [NumberField L] [Algebra K L]
noncomputable def finitePlaceBelow
    (W : HeightOneSpectrum (𝓞 L)) :
    HeightOneSpectrum (𝓞 K) where
  asIdeal := W.asIdeal.under (𝓞 K)
  isPrime := inferInstance
  ne_bot :=
    HilbertRamification.Dedekind.ringOfIntegers_under_ne_bot
      (E := K) (F := L) W.asIdeal
end

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

def comapOfNeBot (ψ : B →+* C) (w : HeightOneSpectrum C) (hne : w.asIdeal.comap ψ ≠ ⊥) :
    HeightOneSpectrum B where
  asIdeal := w.asIdeal.comap ψ
  isPrime := w.isPrime.comap ψ
  ne_bot := hne
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

theorem exists_valued_sub_lt_one (x : v.adicCompletionIntegers K) :
    ∃ a : R, Valued.v ((x : v.adicCompletion K) - algebraMap R (v.adicCompletion K) a) < 1 := by
  
  have hball : {y | Valued.v (y - (x : v.adicCompletion K)) < 1} ∈
      nhds (x : v.adicCompletion K) := by
    rw [Valued.mem_nhds]
    exact ⟨1, fun y hy ↦ by simpa using hy⟩
  obtain ⟨w, hwball, z, rfl⟩ :=
    mem_closure_iff_nhds.mp (denseRange_algebraMap (K := K) v _) _ hball
  rw [Set.mem_ofPred_eq] at hwball
  
  have hz1 : v.valuation K z ≤ 1 := by
    rw [show v.valuation K z = Valued.v (algebraMap K (v.adicCompletion K) z) from
      (v.valuedAdicCompletion_eq_valuation' z).symm]
    calc Valued.v (algebraMap K (v.adicCompletion K) z)
        = Valued.v (algebraMap K (v.adicCompletion K) z - (x : v.adicCompletion K)
            + (x : v.adicCompletion K)) := by ring_nf
      _ ≤ max (Valued.v (algebraMap K (v.adicCompletion K) z - (x : v.adicCompletion K)))
            (Valued.v (x : v.adicCompletion K)) := Valuation.map_add _ _ _
      _ ≤ 1 := max_le hwball.le x.2
  
  obtain ⟨a, ha⟩ := v.exists_valuation_sub_lt_of_integer hz1 1
  refine ⟨a, ?_⟩
  have ha' : Valued.v (algebraMap K (v.adicCompletion K) z -
      algebraMap R (v.adicCompletion K) a) < 1 := by
    rw [IsScalarTower.algebraMap_apply R K (v.adicCompletion K), ← map_sub,
      show Valued.v (algebraMap K (v.adicCompletion K) (z - algebraMap R K a)) =
        v.valuation K (z - algebraMap R K a) from v.valuedAdicCompletion_eq_valuation' _,
      Valuation.map_sub_swap]
    simpa using ha
  calc Valued.v ((x : v.adicCompletion K) - algebraMap R (v.adicCompletion K) a)
      = Valued.v (((x : v.adicCompletion K) - algebraMap K (v.adicCompletion K) z)
          + (algebraMap K (v.adicCompletion K) z - algebraMap R (v.adicCompletion K) a)) := by
        ring_nf
    _ ≤ max _ _ := Valuation.map_add _ _ _
    _ < 1 := max_lt (by rwa [Valuation.map_sub_swap] at hwball) ha'

noncomputable def residueFieldEquivAdicCompletionIntegers :
    (R ⧸ v.asIdeal) ≃+*
      (v.adicCompletionIntegers K ⧸ IsLocalRing.maximalIdeal (v.adicCompletionIntegers K)) := by
  refine RingEquiv.ofBijective (Ideal.quotientMap (IsLocalRing.maximalIdeal _)
    (algebraMap R (v.adicCompletionIntegers K))
    (le_of_eq (v.comap_maximalIdeal_adicCompletionIntegers (K := K)).symm)) ⟨?_, ?_⟩
  · exact Ideal.quotientMap_injective'
      (le_of_eq (v.comap_maximalIdeal_adicCompletionIntegers (K := K)))
  · intro y
    obtain ⟨x, rfl⟩ := Ideal.Quotient.mk_surjective y
    obtain ⟨a, ha⟩ := v.exists_valued_sub_lt_one (K := K) x
    refine ⟨Ideal.Quotient.mk _ a, ?_⟩
    rw [Ideal.quotientMap_mk]
    refine (Ideal.Quotient.eq).mpr ?_
    refine (Valuation.mem_maximalIdeal_iff (v := (Valued.v : Valuation (v.adicCompletion K)
      ℤᵐ⁰))).mpr ?_
    rw [show ((algebraMap R (v.adicCompletionIntegers K) a - x : v.adicCompletionIntegers K) :
      v.adicCompletion K) = algebraMap R (v.adicCompletion K) a - (x : v.adicCompletion K)
      from rfl, Valuation.map_sub_swap]
    exact ha

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
instance isAdicComplete_adicCompletionIntegers :
    IsAdicComplete (IsLocalRing.maximalIdeal (v.adicCompletionIntegers K))
      (v.adicCompletionIntegers K) :=
  (v.isAdic_maximalIdeal_adicCompletionIntegers (K := K)).isAdicComplete_iff.mpr
    ⟨inferInstance, inferInstance⟩
instance henselianLocalRing_adicCompletionIntegers :
    HenselianLocalRing (v.adicCompletionIntegers K) where
  is_henselian f hf a₀ h₁ h₂ :=
    (IsAdicComplete.henselianRing _
      (IsLocalRing.maximalIdeal (v.adicCompletionIntegers K))).is_henselian f hf a₀ h₁ (h₂.map _)
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

/- EllipticCurves.VariableChange -/
section
section
namespace WeierstrassCurve.Affine
variable {F : Type*} [Field F] (W : WeierstrassCurve F) (C : VariableChange F)
namespace Point
variable [W.IsElliptic]
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

/- LSG.LemniscateIndep.Integral -/
section
noncomputable section
open MeasureTheory Set Real
namespace LSG.LemniscateIndep
 
noncomputable def varpi : ℝ := Real.Gamma (1 / 4) ^ 2 / (2 * Real.sqrt (2 * π))
 
def lemInt (t : ℝ) : ℝ := 1 / Real.sqrt (1 - t ^ 4)
 
def betaInt (u : ℝ) : ℝ := u ^ (-(3 / 4 : ℝ)) * (1 - u) ^ (-(1 / 2 : ℝ))
lemma image_pow_four_Ioo : (fun t : ℝ => t ^ 4) '' Ioo 0 1 = Ioo 0 1 := by
  ext u
  constructor
  · rintro ⟨t, ht, rfl⟩
    exact ⟨pow_pos ht.1 4, pow_lt_one₀ ht.1.le ht.2 (by norm_num)⟩
  · intro hu
    refine ⟨u ^ (1 / 4 : ℝ), ⟨Real.rpow_pos_of_pos hu.1 _,
      Real.rpow_lt_one hu.1.le hu.2 (by norm_num)⟩, ?_⟩
    dsimp only
    rw [← Real.rpow_natCast, ← Real.rpow_mul hu.1.le]
    norm_num
 
lemma setIntegral_betaInt :
    ∫ u in Ioo (0 : ℝ) 1, betaInt u = 4 * ∫ t in Ioo (0 : ℝ) 1, lemInt t := by
  have hinj : InjOn (fun t : ℝ => t ^ 4) (Ioo 0 1) := fun a ha b hb h =>
    (pow_left_inj₀ ha.1.le hb.1.le (by norm_num)).mp h
  have h := integral_image_eq_integral_abs_deriv_smul measurableSet_Ioo
    (fun t _ => (hasDerivAt_pow 4 t).hasDerivWithinAt) hinj betaInt
  rw [image_pow_four_Ioo] at h
  rw [h, ← integral_const_mul]
  refine setIntegral_congr_fun measurableSet_Ioo (fun t ht => ?_)
  have ht0 : 0 < t := ht.1
  have h1 : 0 < 1 - t ^ 4 := sub_pos.2 (pow_lt_one₀ ht.1.le ht.2 (by norm_num))
  have hpow : (t ^ 4) ^ (-(3 / 4 : ℝ)) = (t ^ 3)⁻¹ := by
    rw [← Real.rpow_natCast t 4, ← Real.rpow_mul ht0.le,
      show ((4 : ℕ) : ℝ) * (-(3 / 4 : ℝ)) = -((3 : ℕ) : ℝ) by norm_num,
      Real.rpow_neg ht0.le, Real.rpow_natCast]
  have hsq : (1 - t ^ 4) ^ (-(1 / 2 : ℝ)) = (Real.sqrt (1 - t ^ 4))⁻¹ := by
    rw [Real.rpow_neg h1.le, Real.sqrt_eq_rpow]
  simp only [betaInt, smul_eq_mul, hpow, hsq, lemInt]
  rw [abs_of_pos (by positivity)]
  have : (t ^ 3) ≠ 0 := by positivity
  field_simp
  ring
 
lemma betaIntegral_quarter_half' :
    Complex.betaIntegral (1 / 4) (1 / 2) = ((∫ u in Ioo (0 : ℝ) 1, betaInt u : ℝ) : ℂ) := by
  rw [← integral_Ioc_eq_integral_Ioo, ← intervalIntegral.integral_of_le zero_le_one,
    ← intervalIntegral.integral_ofReal, Complex.betaIntegral]
  refine intervalIntegral.integral_congr (fun x hx => ?_)
  rw [uIcc_of_le zero_le_one] at hx
  simp only [betaInt, Complex.ofReal_mul]
  rw [Complex.ofReal_cpow hx.1, Complex.ofReal_cpow (sub_nonneg.2 hx.2)]
  push_cast
  norm_num
 
theorem varpi_eq_integral : varpi = 2 * ∫ t in (0 : ℝ)..1, lemInt t := by
  
  have hBG := Complex.Gamma_mul_Gamma_eq_betaIntegral
    (s := 1 / 4) (t := 1 / 2) (by norm_num) (by norm_num)
  rw [betaIntegral_quarter_half', setIntegral_betaInt] at hBG
  have hc : ∀ x : ℝ, Complex.Gamma (x : ℂ) = (Real.Gamma x : ℂ) := Complex.Gamma_ofReal
  have hBG' : Real.Gamma (1 / 4) * Real.Gamma (1 / 2) =
      Real.Gamma (3 / 4) * (4 * ∫ t in Ioo (0 : ℝ) 1, lemInt t) := by
    have e1 : (1 / 4 : ℂ) = ((1 / 4 : ℝ) : ℂ) := by push_cast; ring
    have e2 : (1 / 2 : ℂ) = ((1 / 2 : ℝ) : ℂ) := by push_cast; ring
    have e3 : (1 / 4 + 1 / 2 : ℂ) = ((3 / 4 : ℝ) : ℂ) := by push_cast; ring
    rw [e3, e1, e2, hc, hc, hc] at hBG
    exact_mod_cast hBG
  
  have hrefl := Real.Gamma_mul_Gamma_one_sub (1 / 4)
  rw [show (1 : ℝ) - 1 / 4 = 3 / 4 by norm_num, show π * (1 / 4) = π / 4 by ring,
    Real.sin_pi_div_four] at hrefl
  rw [Real.Gamma_one_half_eq] at hBG'
  have hI : ∫ t in (0 : ℝ)..1, lemInt t = ∫ t in Ioo (0 : ℝ) 1, lemInt t := by
    rw [intervalIntegral.integral_of_le zero_le_one, integral_Ioc_eq_integral_Ioo]
  set J := ∫ t in Ioo (0 : ℝ) 1, lemInt t
  set g1 := Real.Gamma (1 / 4)
  set g3 := Real.Gamma (3 / 4)
  have hs : 0 < √π := Real.sqrt_pos.2 Real.pi_pos
  have hq : 0 < √2 := by positivity
  have hq2 : √2 ^ 2 = 2 := Real.sq_sqrt (by norm_num)
  have hs2 : √π ^ 2 = π := Real.sq_sqrt Real.pi_pos.le
  have h2π : √(2 * π) = √2 * √π := Real.sqrt_mul (by norm_num) π
  have hg3 : 0 < g3 := Real.Gamma_pos_of_pos (by norm_num)
  unfold varpi
  rw [hI, h2π]
  have hrefl' : g1 * g3 * √2 = 2 * π := by
    rw [hrefl]; field_simp
  rw [← hs2] at hrefl'
  have key : 2 * J * (2 * √2 * √π) * g3 = g1 ^ 2 * g3 := by
    have h4 : 4 * g3 * J = g1 * √π := by linarith [hBG']
    have hL : 2 * J * (2 * √2 * √π) * g3 * √2 = 2 * g1 * √π ^ 2 := by
      calc _ = (4 * g3 * J) * √π * √2 ^ 2 := by ring
        _ = _ := by rw [h4, hq2]; ring
    have hR : g1 ^ 2 * g3 * √2 = 2 * g1 * √π ^ 2 := by
      calc _ = g1 * (g1 * g3 * √2) := by ring
        _ = _ := by rw [hrefl']; ring
    exact mul_right_cancel₀ hq.ne' (hL.trans hR.symm)
  have hJ : 2 * J * (2 * √2 * √π) = g1 ^ 2 := mul_right_cancel₀ hg3.ne' key
  field_simp
  linarith [hJ]
lemma varpi_pos : 0 < varpi := by
  unfold varpi
  have := Real.Gamma_pos_of_pos (show (0 : ℝ) < 1 / 4 by norm_num)
  positivity
 
lemma intervalIntegrable_lemInt : IntervalIntegrable lemInt volume 0 1 := by
  by_contra h
  have h0 := intervalIntegral.integral_undef h
  have := varpi_eq_integral
  rw [h0] at this
  linarith [varpi_pos]
 
def lemF (x : ℝ) : ℝ := ∫ t in (0 : ℝ)..x, lemInt t
lemma lemF_zero : lemF 0 = 0 := by simp [lemF]
lemma lemF_one : lemF 1 = varpi / 2 := by
  rw [lemF, varpi_eq_integral]; ring
lemma continuousOn_lemF : ContinuousOn lemF (Icc 0 1) := by
  have := intervalIntegral.continuousOn_primitive_interval' intervalIntegrable_lemInt
    (left_mem_uIcc (a := (0 : ℝ)) (b := 1))
  rwa [uIcc_of_le zero_le_one] at this
lemma continuousOn_lemInt : ContinuousOn lemInt (Ioo 0 1) := by
  refine continuousOn_const.div (by fun_prop) (fun t ht => ?_)
  have : t ^ 4 < 1 := pow_lt_one₀ ht.1.le ht.2 (by norm_num)
  exact (Real.sqrt_pos.2 (by linarith)).ne'
lemma hasDerivAt_lemF {x : ℝ} (hx : x ∈ Ioo (0 : ℝ) 1) : HasDerivAt lemF (lemInt x) x := by
  have hint : IntervalIntegrable lemInt volume 0 x :=
    intervalIntegrable_lemInt.mono_set (by
      rw [uIcc_of_le hx.1.le, uIcc_of_le zero_le_one]
      exact Icc_subset_Icc le_rfl hx.2.le)
  exact intervalIntegral.integral_hasDerivAt_right hint
    (continuousOn_lemInt.stronglyMeasurableAtFilter isOpen_Ioo x hx)
    (continuousOn_lemInt.continuousAt (isOpen_Ioo.mem_nhds hx))
end LSG.LemniscateIndep
end
end

/- LSG.Weierstrass.ZetaDef -/
section
open Module Filter
open scoped Topology
noncomputable section
namespace LSG.Weierstrass
open PeriodPair
variable (L : PeriodPair)

def zetaSummand (l z : ℂ) : ℂ := 1 / (z - l) + 1 / l + z / l ^ 2
lemma zetaSummand_eq (l z : ℂ) (hl : l ≠ 0) (hz : z ≠ l) :
    zetaSummand l z = z ^ 2 / (l ^ 2 * (z - l)) := by
  have : z - l ≠ 0 := sub_ne_zero.mpr hz
  unfold zetaSummand
  field_simp
  ring
 
lemma zetaSummand_bound (r : ℝ) (hr : 0 < r) (z : ℂ) (hz : ‖z‖ < r) (l : ℂ)
    (h : 2 * r ≤ ‖l‖) : ‖zetaSummand l z‖ ≤ 2 * r ^ 2 * ‖l‖ ^ (-3 : ℝ) := by
  have hl0 : 0 < ‖l‖ := by linarith
  have hl : l ≠ 0 := norm_pos_iff.mp hl0
  have hzl : z ≠ l := by rintro rfl; linarith
  have hzl' : ‖l‖ / 2 ≤ ‖z - l‖ := by
    rw [norm_sub_rev]
    have := norm_sub_norm_le l z
    linarith
  rw [zetaSummand_eq l z hl hzl, Real.rpow_neg hl0.le, norm_div, norm_mul, norm_pow, norm_pow]
  have h3 : ‖l‖ ^ (3 : ℝ) = ‖l‖ ^ 3 := by norm_cast
  rw [h3, div_le_iff₀ (mul_pos (by positivity) (by linarith))]
  have hz2 : ‖z‖ ^ 2 ≤ r ^ 2 := by gcongr
  calc ‖z‖ ^ 2 ≤ r ^ 2 := hz2
    _ = 2 * r ^ 2 * (‖l‖ ^ 3)⁻¹ * (‖l‖ ^ 2 * (‖l‖ / 2)) := by field_simp
    _ ≤ 2 * r ^ 2 * (‖l‖ ^ 3)⁻¹ * (‖l‖ ^ 2 * ‖z - l‖) := by gcongr
 
def zeta (z : ℂ) : ℂ := ∑' l : L.lattice, zetaSummand l z
lemma hasSumLocallyUniformly_zeta :
    HasSumLocallyUniformly (fun (l : L.lattice) (z : ℂ) ↦ zetaSummand l z) (zeta L) := by
  refine PeriodPair.hasSumLocallyUniformly_aux L (u := fun r l ↦ 2 * r ^ 2 * ‖(l : ℂ)‖ ^ (-3 : ℝ)) _
    (fun _ _ ↦ (ZLattice.summable_norm_rpow _ _ (by simp; norm_num)).mul_left _) fun r hr ↦
    Filter.eventually_atTop.mpr ⟨2 * r, ?_⟩
  rintro _ h s hs l rfl
  exact zetaSummand_bound r hr s hs l h
lemma hasSum_zeta (z : ℂ) : HasSum (fun l : L.lattice ↦ zetaSummand l z) (zeta L z) :=
  (hasSumLocallyUniformly_zeta L).hasSum
lemma summable_zetaSummand (z : ℂ) : Summable (fun l : L.lattice ↦ zetaSummand l z) :=
  (hasSum_zeta L z).summable
lemma isOpen_compl_coe_lattice : IsOpen (L.latticeᶜ : Set ℂ) :=
  L.isClosed_lattice.isOpen_compl
lemma hasDerivAt_zetaSummand (l x : ℂ) (hxl : x - l ≠ 0) :
    HasDerivAt (zetaSummand l) (-(1 / (x - l) ^ 2 - 1 / l ^ 2)) x := by
  have h1 : HasDerivAt (fun y : ℂ ↦ y - l) 1 x := (hasDerivAt_id x).sub_const _
  have h2 : HasDerivAt (fun y : ℂ ↦ 1 / (y - l)) (-(1 : ℂ) / (x - l) ^ 2) x := by
    simpa only [one_div] using! h1.inv hxl
  have h3 : HasDerivAt (fun y : ℂ ↦ y / l ^ 2) (1 / l ^ 2) x :=
    (hasDerivAt_id x).div_const _
  have h4 : HasDerivAt (fun y ↦ 1 / (y - l) + 1 / l + y / l ^ 2)
      (-(1 : ℂ) / (x - l) ^ 2 + 0 + 1 / l ^ 2) x :=
    (h2.add (hasDerivAt_const x (1 / l))).add h3
  have : zetaSummand l = fun y ↦ 1 / (y - l) + 1 / l + y / l ^ 2 := rfl
  rw [this]
  convert h4 using 1
  ring
lemma sub_coe_ne_zero {x : ℂ} (hx : x ∉ L.lattice) (l : L.lattice) : x - l ≠ 0 :=
  fun e ↦ hx (by rw [sub_eq_zero.mp e]; exact l.2)
lemma differentiableOn_zetaSummand (l : L.lattice) :
    DifferentiableOn ℂ (zetaSummand l) L.latticeᶜ := fun x hx ↦
  (hasDerivAt_zetaSummand l x (sub_coe_ne_zero L hx l)).differentiableAt.differentiableWithinAt
lemma deriv_zetaSummand (l : L.lattice) (x : ℂ) (hx : x ∉ L.lattice) :
    deriv (zetaSummand l) x = -(1 / (x - l) ^ 2 - 1 / (l : ℂ) ^ 2) :=
  (hasDerivAt_zetaSummand l x (sub_coe_ne_zero L hx l)).deriv
 
lemma differentiableOn_zeta : DifferentiableOn ℂ (zeta L) L.latticeᶜ := by
  refine (hasSumLocallyUniformly_zeta L).hasSumLocallyUniformlyOn.differentiableOn
    (.of_forall fun s ↦ .fun_sum fun i _ ↦ differentiableOn_zetaSummand L i)
    (isOpen_compl_coe_lattice L)
lemma hasSumLocallyUniformly_neg_weierstrassP :
    HasSumLocallyUniformly (fun (l : L.lattice) (z : ℂ) ↦ -(1 / (z - l) ^ 2 - 1 / (l : ℂ) ^ 2))
      (fun z ↦ -℘[L] z) := by
  have := PeriodPair.hasSumLocallyUniformly_aux L
    (fun (l : L.lattice) (z : ℂ) ↦ -(1 / (z - l) ^ 2 - 1 / (l : ℂ) ^ 2))
    (u := fun r l ↦ 10 * r * ‖(l : ℂ)‖ ^ (-3 : ℝ))
    (fun _ _ ↦ (ZLattice.summable_norm_rpow _ _ (by simp; norm_num)).mul_left _) fun r hr ↦
    Filter.eventually_atTop.mpr ⟨2 * r, by
      rintro _ h s hs l rfl
      rw [norm_neg]
      exact PeriodPair.weierstrassP_bound r hr s hs l h⟩
  convert this using 2 with z
  rw [tsum_neg, PeriodPair.weierstrassP]
 
lemma eqOn_deriv_zeta : Set.EqOn (deriv (zeta L)) (fun z ↦ -℘[L] z) L.latticeᶜ := by
  refine ((hasSumLocallyUniformly_zeta L).tendstoLocallyUniformlyOn.deriv
    (.of_forall fun s ↦ ?_) (isOpen_compl_coe_lattice L)).unique ?_
  · exact .fun_sum fun i _ ↦ differentiableOn_zetaSummand L i
  · have := (hasSumLocallyUniformly_neg_weierstrassP L).tendstoLocallyUniformlyOn
      (s := L.latticeᶜ)
    refine this.congr ?_
    intro s x hx
    simp only [Function.comp_apply]
    rw [deriv_fun_sum (fun i _ ↦ (differentiableOn_zetaSummand L i x hx).differentiableAt
      ((isOpen_compl_coe_lattice L).mem_nhds hx))]
    exact Finset.sum_congr rfl fun i _ ↦ (deriv_zetaSummand L i x hx).symm
 
lemma hasDerivAt_zeta {z : ℂ} (hz : z ∉ L.lattice) : HasDerivAt (zeta L) (-℘[L] z) z := by
  have hd : DifferentiableAt ℂ (zeta L) z :=
    (differentiableOn_zeta L z hz).differentiableAt ((isOpen_compl_coe_lattice L).mem_nhds hz)
  have := hd.hasDerivAt
  rwa [eqOn_deriv_zeta L hz] at this
end LSG.Weierstrass
end
end

/- LSG.Weierstrass.SigmaDef -/
section
open Module Filter Complex
open scoped Topology
noncomputable section
namespace LSG.Weierstrass
open PeriodPair
 
def weierstrassFactor (u : ℂ) : ℂ := (1 - u) * exp (u + u ^ 2 / 2)
@[simp] lemma weierstrassFactor_zero : weierstrassFactor 0 = 1 := by
  simp [weierstrassFactor]
@[simp] lemma weierstrassFactor_one : weierstrassFactor 1 = 0 := by
  simp [weierstrassFactor]
lemma weierstrassFactor_eq_zero_iff {u : ℂ} : weierstrassFactor u = 0 ↔ u = 1 := by
  rw [weierstrassFactor, mul_eq_zero, sub_eq_zero, or_iff_left (exp_ne_zero _), eq_comm]
lemma differentiable_weierstrassFactor : Differentiable ℂ weierstrassFactor := by
  unfold weierstrassFactor; fun_prop
 
lemma hasDerivAt_weierstrassFactor (u : ℂ) :
    HasDerivAt weierstrassFactor (-u ^ 2 * exp (u + u ^ 2 / 2)) u := by
  have h1 : HasDerivAt (fun v : ℂ ↦ v + v ^ 2 / 2) (1 + u) u :=
    ((hasDerivAt_id' u).add ((hasDerivAt_pow 2 u).div_const 2)).congr_deriv (by norm_num)
  have h2 : HasDerivAt (fun v : ℂ ↦ (1 - v) * exp (v + v ^ 2 / 2))
      ((0 - 1) * exp (u + u ^ 2 / 2) + (1 - u) * (exp (u + u ^ 2 / 2) * (1 + u))) u :=
    ((hasDerivAt_const u (1 : ℂ)).sub (hasDerivAt_id' u)).mul h1.cexp
  exact h2.congr_deriv (by ring)
lemma logTaylor_three (z : ℂ) : logTaylor 3 z = z - z ^ 2 / 2 := by
  simp [logTaylor, Finset.sum_range_succ]
  ring
 
lemma norm_weierstrassFactor_sub_one_le {u : ℂ} (hu : ‖u‖ ≤ 1 / 2) :
    ‖weierstrassFactor u - 1‖ ≤ 2 * ‖u‖ ^ 3 := by
  have hu1 : ‖-u‖ < 1 := by rw [norm_neg]; linarith
  have hne : (1 : ℂ) - u ≠ 0 := by
    intro h
    have : u = 1 := by linear_combination -h
    rw [this] at hu; norm_num at hu
  set w := log (1 + -u) - logTaylor (2 + 1) (-u) with hw
  have hwb := norm_log_sub_logTaylor_le 2 hu1
  rw [← hw, norm_neg] at hwb
  have hw' : w = log (1 - u) + (u + u ^ 2 / 2) := by
    rw [hw, show (2 + 1 : ℕ) = 3 from rfl, logTaylor_three, ← sub_eq_add_neg]; ring
  have hinv : (1 - ‖u‖)⁻¹ ≤ 2 := by
    rw [inv_le_comm₀ (by linarith) (by norm_num)]; linarith
  have hwle : ‖w‖ ≤ ‖u‖ ^ 3 := by
    calc ‖w‖ ≤ ‖u‖ ^ (2 + 1) * (1 - ‖u‖)⁻¹ / (2 + 1) := by exact_mod_cast hwb
      _ ≤ ‖u‖ ^ 3 * 2 / 3 := by
          norm_num
          gcongr
      _ ≤ ‖u‖ ^ 3 := by nlinarith [pow_nonneg (norm_nonneg u) 3]
  have hu3 : ‖u‖ ^ 3 ≤ 1 := by
    calc ‖u‖ ^ 3 ≤ (1 / 2) ^ 3 := by gcongr
      _ ≤ 1 := by norm_num
  have hexp : weierstrassFactor u = exp w := by
    rw [hw', exp_add, exp_log hne, weierstrassFactor]
  rw [hexp]
  calc ‖exp w - 1‖ ≤ 2 * ‖w‖ := norm_exp_sub_one_le (hwle.trans hu3)
    _ ≤ 2 * ‖u‖ ^ 3 := by gcongr
variable (L : PeriodPair)
 
lemma eventually_le_norm (R : ℝ) : ∀ᶠ l : L.lattice in cofinite, R ≤ ‖(l : ℂ)‖ := by
  rw [Filter.eventually_cofinite]
  refine (isCompact_iff_finite.mp (isCompact_closedBall (0 : L.lattice) R)).subset ?_
  intro l hl
  simp only [Set.mem_ofPred_eq, not_le] at hl
  simp only [Metric.mem_closedBall, dist_zero_right]
  exact hl.le
lemma summable_norm_rpow_neg_three :
    Summable (fun l : L.lattice ↦ ‖(l : ℂ)‖ ^ (-3 : ℝ)) :=
  ZLattice.summable_norm_rpow _ _ (by simp; norm_num)
 
lemma norm_weierstrassFactor_div_sub_one_le {r : ℝ} (hr : 0 < r) {z l : ℂ} (hz : ‖z‖ ≤ r)
    (hl : 2 * r ≤ ‖l‖) : ‖weierstrassFactor (z / l) - 1‖ ≤ 2 * r ^ 3 * ‖l‖ ^ (-3 : ℝ) := by
  have hl0 : 0 < ‖l‖ := by linarith
  have hzl : ‖z / l‖ ≤ r / ‖l‖ := by rw [norm_div]; gcongr
  have hrl : r / ‖l‖ ≤ 1 / 2 := by rw [div_le_iff₀ hl0]; linarith
  refine (norm_weierstrassFactor_sub_one_le (hzl.trans hrl)).trans ?_
  rw [Real.rpow_neg hl0.le, show ‖l‖ ^ (3 : ℝ) = ‖l‖ ^ 3 by norm_cast]
  calc 2 * ‖z / l‖ ^ 3 ≤ 2 * (r / ‖l‖) ^ 3 := by gcongr
    _ = 2 * r ^ 3 * (‖l‖ ^ 3)⁻¹ := by field_simp
lemma summable_norm_weierstrassFactor_div_sub_one (z : ℂ) :
    Summable (fun l : L.lattice ↦ ‖weierstrassFactor (z / l) - 1‖) := by
  set r := ‖z‖ + 1
  have hr : 0 < r := by positivity
  refine ((summable_norm_rpow_neg_three L).mul_left (2 * r ^ 3)).of_norm_bounded_eventually ?_
  filter_upwards [eventually_le_norm L (2 * r)] with l hl
  rw [norm_norm]
  exact norm_weierstrassFactor_div_sub_one_le hr (by simp [r]) hl
 
def sigmaProd (z : ℂ) : ℂ := ∏' l : L.lattice, weierstrassFactor (z / l)
 
def sigma (z : ℂ) : ℂ := z * sigmaProd L z
lemma hasProdLocallyUniformlyOn_sigmaProd :
    HasProdLocallyUniformlyOn (fun (l : L.lattice) (z : ℂ) ↦ weierstrassFactor (z / l))
      (sigmaProd L) Set.univ := by
  have key : HasProdLocallyUniformlyOn
      (fun (l : L.lattice) (z : ℂ) ↦ 1 + (weierstrassFactor (z / l) - 1))
      (fun z ↦ ∏' l : L.lattice, (1 + (weierstrassFactor (z / l) - 1))) Set.univ := by
    refine hasProdLocallyUniformlyOn_of_forall_compact isOpen_univ fun K _ hK ↦ ?_
    obtain ⟨r₀, hr₀⟩ := hK.isBounded.subset_closedBall 0
    set r := max r₀ 1
    have hr : 0 < r := lt_of_lt_of_le one_pos (le_max_right _ _)
    refine Summable.hasProdUniformlyOn_one_add hK
      ((summable_norm_rpow_neg_three L).mul_left (2 * r ^ 3)) ?_ fun l ↦ ?_
    · filter_upwards [eventually_le_norm L (2 * r)] with l hl x hx
      refine norm_weierstrassFactor_div_sub_one_le hr ?_ hl
      have := hr₀ hx
      rw [Metric.mem_closedBall, dist_zero_right] at this
      exact this.trans (le_max_left _ _)
    · exact ((differentiable_weierstrassFactor.comp (differentiable_id.div_const _)).sub_const
        _).continuous.continuousOn
  rw [show sigmaProd L = fun z ↦ ∏' l : L.lattice, weierstrassFactor (z / l) from rfl]
  simpa only [add_sub_cancel] using key
 
lemma differentiable_sigmaProd : Differentiable ℂ (sigmaProd L) := by
  have := (hasProdLocallyUniformlyOn_sigmaProd L).differentiableOn
    (.of_forall fun s ↦ ?_) isOpen_univ
  · exact fun x ↦ (this x (Set.mem_univ x)).differentiableAt (isOpen_univ.mem_nhds trivial)
  · simpa [Finset.prod_fn] using DifferentiableOn.finsetProd (fun i _ ↦
      (differentiable_weierstrassFactor.comp (differentiable_id.div_const _)).differentiableOn)
 
lemma differentiable_sigma : Differentiable ℂ (sigma L) :=
  differentiable_id.mul (differentiable_sigmaProd L)
lemma weierstrassFactor_div_ne_zero {z : ℂ} (hz : z ∉ L.lattice) (l : L.lattice) :
    weierstrassFactor (z / l) ≠ 0 := by
  rw [Ne, weierstrassFactor_eq_zero_iff]
  intro h
  have hl : (l : ℂ) ≠ 0 := by rintro h'; rw [h', div_zero] at h; exact zero_ne_one h
  rw [div_eq_one_iff_eq hl] at h
  exact hz (h ▸ l.2)
lemma sigmaProd_ne_zero {z : ℂ} (hz : z ∉ L.lattice) : sigmaProd L z ≠ 0 := by
  have := tprod_one_add_ne_zero_of_summable
    (f := fun l : L.lattice ↦ weierstrassFactor (z / l) - 1)
    (fun l ↦ by simpa using weierstrassFactor_div_ne_zero L hz l)
    (summable_norm_weierstrassFactor_div_sub_one L z)
  simpa only [add_sub_cancel, sigmaProd] using this
lemma sigmaProd_coe (l : L.lattice) (hl : (l : ℂ) ≠ 0) : sigmaProd L l = 0 :=
  tprod_of_exists_eq_zero ⟨l, by simp [div_self hl]⟩
@[simp] lemma sigmaProd_zero : sigmaProd L 0 = 1 := by
  simp [sigmaProd]
 
lemma sigma_eq_zero_iff {z : ℂ} : sigma L z = 0 ↔ z ∈ L.lattice := by
  constructor
  · intro h
    by_contra hz
    have hz0 : z ≠ 0 := fun h0 ↦ hz (h0 ▸ L.lattice.zero_mem)
    exact mul_ne_zero hz0 (sigmaProd_ne_zero L hz) h
  · intro hz
    by_cases hz0 : z = 0
    · simp [sigma, hz0]
    · simp [sigma, sigmaProd_coe L ⟨z, hz⟩ hz0]
lemma sigma_ne_zero {z : ℂ} (hz : z ∉ L.lattice) : sigma L z ≠ 0 :=
  fun h ↦ hz ((sigma_eq_zero_iff L).mp h)
@[simp] lemma sigma_zero : sigma L 0 = 0 := by simp [sigma]
lemma sigma_coe (l : L.lattice) : sigma L l = 0 := (sigma_eq_zero_iff L).mpr l.2
lemma sigmaProd_neg (z : ℂ) : sigmaProd L (-z) = sigmaProd L z := by
  unfold sigmaProd
  rw [← (Equiv.neg L.lattice).tprod_eq]
  congr 1 with l
  simp [neg_div, div_neg]
 
lemma sigma_neg (z : ℂ) : sigma L (-z) = -sigma L z := by
  simp [sigma, sigmaProd_neg]
 
lemma hasDerivAt_sigma_zero : HasDerivAt (sigma L) 1 0 := by
  have := (hasDerivAt_id' (0 : ℂ)).mul (differentiable_sigmaProd L 0).hasDerivAt
  simpa only [mul_one,one_mul,zero_mul,add_zero,sigmaProd_zero] using! this
lemma deriv_sigma_zero : deriv (sigma L) 0 = 1 := (hasDerivAt_sigma_zero L).deriv
lemma hasDerivAt_weierstrassFactor_div (l x : ℂ) :
    HasDerivAt (fun z ↦ weierstrassFactor (z / l))
      (-(x / l) ^ 2 * exp (x / l + (x / l) ^ 2 / 2) * (1 / l)) x := by
  have h := (hasDerivAt_weierstrassFactor (x / l)).comp x ((hasDerivAt_id' x).div_const l)
  exact h
lemma logDeriv_weierstrassFactor_div (l x : ℂ) (hx : x ≠ l) :
    logDeriv (fun z ↦ weierstrassFactor (z / l)) x = if l = 0 then 0 else zetaSummand l x := by
  rw [logDeriv_apply, (hasDerivAt_weierstrassFactor_div l x).deriv]
  split_ifs with hl
  · simp [hl]
  · rw [zetaSummand_eq l x hl hx, weierstrassFactor]
    have h1 : (1 : ℂ) - x / l ≠ 0 := by
      rw [sub_ne_zero, ne_eq, eq_div_iff hl, one_mul]; exact fun h ↦ hx h.symm
    have h2 : x - l ≠ 0 := sub_ne_zero.mpr hx
    have h3 : (1 : ℂ) - x / l = -(x - l) / l := by field_simp; ring
    rw [h3]
    field_simp
lemma summable_logDeriv_weierstrassFactor_div {x : ℂ} (hx : x ∉ L.lattice) :
    Summable fun l : L.lattice ↦ logDeriv (fun z ↦ weierstrassFactor (z / l)) x := by
  have hxl : ∀ l : L.lattice, x ≠ l := fun l h ↦ hx (h ▸ l.2)
  simp_rw [logDeriv_weierstrassFactor_div _ _ (hxl _)]
  refine (summable_zetaSummand L x).congr_cofinite ?_
  filter_upwards [eventually_le_norm L 1] with l hl
  have : (l : ℂ) ≠ 0 := by rintro h; rw [h, norm_zero] at hl; norm_num at hl
  simp [this]
lemma tsum_logDeriv_weierstrassFactor_div {x : ℂ} (hx : x ∉ L.lattice) :
    ∑' l : L.lattice, logDeriv (fun z ↦ weierstrassFactor (z / l)) x = zeta L x - 1 / x := by
  have hxl : ∀ l : L.lattice, x ≠ l := fun l h ↦ hx (h ▸ l.2)
  simp_rw [logDeriv_weierstrassFactor_div _ _ (hxl _)]
  have hs := summable_zetaSummand L x
  have e : ∀ l : L.lattice, (if (l : ℂ) = 0 then 0 else zetaSummand l x) =
      zetaSummand l x - if l = 0 then 1 / x else 0 := by
    intro l
    by_cases hl : l = 0
    · simp [hl, zetaSummand]
    · have : (l : ℂ) ≠ 0 := fun h ↦ hl (Subtype.ext h)
      simp [hl, this]
  simp_rw [e]
  rw [hs.tsum_sub (summable_of_hasFiniteSupport ((Set.finite_singleton 0).subset (by
    intro l hl; by_contra h; simp_all))), tsum_ite_eq]
  rfl
lemma logDeriv_sigmaProd {x : ℂ} (hx : x ∉ L.lattice) :
    logDeriv (sigmaProd L) x = zeta L x - 1 / x := by
  have h := logDeriv_tprod_eq_tsum (isOpen_compl_coe_lattice L) hx
    (f := fun (l : L.lattice) (z : ℂ) ↦ weierstrassFactor (z / l))
    (weierstrassFactor_div_ne_zero L hx)
    (fun l ↦
      (differentiable_weierstrassFactor.comp (differentiable_id.div_const _)).differentiableOn)
    (summable_logDeriv_weierstrassFactor_div L hx)
    ((hasProdLocallyUniformlyOn_sigmaProd L).multipliableLocallyUniformlyOn.mono
      (Set.subset_univ _))
    (sigmaProd_ne_zero L hx)
  rw [← tsum_logDeriv_weierstrassFactor_div L hx, ← h]
  rfl
 
lemma logDeriv_sigma {x : ℂ} (hx : x ∉ L.lattice) : logDeriv (sigma L) x = zeta L x := by
  have hx0 : x ≠ 0 := fun h ↦ hx (h ▸ L.lattice.zero_mem)
  have := logDeriv_mul (f := id) (g := sigmaProd L) x hx0 (sigmaProd_ne_zero L hx)
    differentiableAt_id (differentiable_sigmaProd L x)
  rw [show sigma L = (fun z => id z * sigmaProd L z) from rfl, this, logDeriv_id, logDeriv_sigmaProd L hx]
  ring
 
lemma deriv_sigma {x : ℂ} (hx : x ∉ L.lattice) : deriv (sigma L) x = zeta L x * sigma L x := by
  have := logDeriv_sigma L hx
  rw [logDeriv_apply, div_eq_iff (sigma_ne_zero L hx)] at this
  exact this
end LSG.Weierstrass
end
end

/- LSG.Weierstrass.SigmaQuasiPeriod -/
section
open Module Filter Complex
open scoped Topology
noncomputable section
namespace LSG.Weierstrass
open PeriodPair
variable (L : PeriodPair)
lemma countable_lattice : (L.lattice : Set ℂ).Countable := by
  have : Countable L.lattice := L.latticeEquivProd.injective.countable
  exact Set.countable_coe_iff.mp this
 
lemma isConnected_compl_lattice : IsConnected (L.lattice : Set ℂ)ᶜ :=
  Set.Countable.isConnected_compl_of_one_lt_rank (by rw [Complex.rank_real_complex]; norm_num)
    (countable_lattice L)
lemma add_notMem_lattice {z ω : ℂ} (hz : z ∉ L.lattice) (hω : ω ∈ L.lattice) :
    z + ω ∉ L.lattice := fun h ↦ hz ((Submodule.add_mem_iff_left _ hω).mp h)
 
lemma eq_of_hasDerivAt_zero {g : ℂ → ℂ} (hg : ∀ z ∉ L.lattice, HasDerivAt g 0 z) {z w : ℂ}
    (hz : z ∉ L.lattice) (hw : w ∉ L.lattice) : g z = g w :=
  (isOpen_compl_coe_lattice L).is_const_of_deriv_eq_zero
    (isConnected_compl_lattice L).isPreconnected
    (fun x hx ↦ (hg x hx).differentiableAt.differentiableWithinAt) (fun x hx ↦ (hg x hx).deriv)
    hz hw

def eta (ω : ℂ) : ℂ := zeta L (L.ω₁ / 2 + ω) - zeta L (L.ω₁ / 2)
lemma hasDerivAt_zeta_add_sub {ω : ℂ} (hω : ω ∈ L.lattice) {z : ℂ} (hz : z ∉ L.lattice) :
    HasDerivAt (fun z ↦ zeta L (z + ω) - zeta L z) 0 z := by
  have h1 := (hasDerivAt_zeta L (add_notMem_lattice L hz hω)).comp_add_const z ω
  have h2 : HasDerivAt (fun z ↦ zeta L (z + ω) - zeta L z) (-℘[L] (z + ω) - -℘[L] z) z :=
    h1.sub (hasDerivAt_zeta L hz)
  have hp : ℘[L] (z + ω) = ℘[L] z := L.weierstrassP_add_coe z ⟨ω, hω⟩
  rwa [hp, sub_self] at h2
 
lemma zeta_add_eta {ω : ℂ} (hω : ω ∈ L.lattice) {z : ℂ} (hz : z ∉ L.lattice) :
    zeta L (z + ω) = zeta L z + eta L ω := by
  have : zeta L (z + ω) - zeta L z = zeta L (L.ω₁ / 2 + ω) - zeta L (L.ω₁ / 2) :=
    eq_of_hasDerivAt_zero L (g := fun z ↦ zeta L (z + ω) - zeta L z)
      (fun x hx ↦ hasDerivAt_zeta_add_sub L hω hx) hz L.ω₁_div_two_notMem_lattice
  rw [eta]
  linear_combination this
@[simp] lemma eta_zero : eta L 0 = 0 := by simp [eta]
 
lemma eta_add {ω ω' : ℂ} (hω : ω ∈ L.lattice) (hω' : ω' ∈ L.lattice) :
    eta L (ω + ω') = eta L ω + eta L ω' := by
  have h0 := L.ω₁_div_two_notMem_lattice
  have h1 := zeta_add_eta L (add_mem hω hω') h0
  have h2 := zeta_add_eta L hω' (add_notMem_lattice L h0 hω)
  have h3 := zeta_add_eta L hω h0
  rw [← add_assoc, h2, h3] at h1
  linear_combination -h1
lemma hasDerivAt_sigma (z : ℂ) : HasDerivAt (sigma L) (deriv (sigma L) z) z :=
  (differentiable_sigma L z).hasDerivAt
 
lemma exists_sigma_add {ω : ℂ} (hω : ω ∈ L.lattice) :
    ∃ c : ℂ, ∀ z, sigma L (z + ω) = c * exp (eta L ω * z) * sigma L z := by
  let G : ℂ → ℂ := fun z ↦ sigma L (z + ω) * exp (-(eta L ω * z)) / sigma L z
  have hG : ∀ z ∉ L.lattice, HasDerivAt G 0 z := by
    intro z hz
    have hz' := add_notMem_lattice L hz hω
    have h1 := (hasDerivAt_sigma L (z + ω)).comp_add_const z ω
    have h2 : HasDerivAt (fun z ↦ exp (-(eta L ω * z))) (exp (-(eta L ω * z)) * -(eta L ω * 1))
        z := ((hasDerivAt_id' z).const_mul (eta L ω)).neg.cexp
    have h3 := (h1.mul h2).div (hasDerivAt_sigma L z) (sigma_ne_zero L hz)
    refine h3.congr_deriv ?_
    rw [deriv_sigma L hz', deriv_sigma L hz, zeta_add_eta L hω hz]
    simp only [Pi.mul_apply]
    ring
  refine ⟨G (L.ω₁ / 2), fun z ↦ ?_⟩
  by_cases hz : z ∈ L.lattice
  · rw [sigma_coe L ⟨z, hz⟩, sigma_coe L ⟨z + ω, add_mem hz hω⟩, mul_zero]
  · have := eq_of_hasDerivAt_zero L hG hz L.ω₁_div_two_notMem_lattice
    have h1 := sigma_ne_zero L hz
    have h2 : exp (-(eta L ω * z)) * exp (eta L ω * z) = 1 := by rw [← exp_add]; simp
    have h3 : sigma L (z + ω) * exp (-(eta L ω * z)) = G (L.ω₁ / 2) * sigma L z := by
      rw [← this]; simp only [G]; rw [div_mul_cancel₀ _ h1]
    calc sigma L (z + ω) = sigma L (z + ω) * (exp (-(eta L ω * z)) * exp (eta L ω * z)) := by
          rw [h2, mul_one]
      _ = (sigma L (z + ω) * exp (-(eta L ω * z))) * exp (eta L ω * z) := by ring
      _ = _ := by rw [h3]; ring
 
lemma sigma_add_of_half_notMem {ω : ℂ} (hω : ω ∈ L.lattice) (hω2 : ω / 2 ∉ L.lattice) (z : ℂ) :
    sigma L (z + ω) = -exp (eta L ω * (z + ω / 2)) * sigma L z := by
  obtain ⟨c, hc⟩ := exists_sigma_add L hω
  set e := eta L ω
  have hs := sigma_ne_zero L hω2
  have h := hc (-(ω / 2))
  rw [show -(ω / 2) + ω = ω / 2 by ring, sigma_neg] at h
  have he : exp (e * -(ω / 2)) * exp (e * (ω / 2)) = 1 := by rw [← exp_add]; ring_nf; simp
  have hce : c * exp (e * -(ω / 2)) = -1 := by
    have : sigma L (ω / 2) * (c * exp (e * -(ω / 2)) + 1) = 0 := by linear_combination h
    rcases mul_eq_zero.mp this with h' | h'
    · exact absurd h' hs
    · linear_combination h'
  have hc' : c = -exp (e * (ω / 2)) := by linear_combination exp (e * (ω / 2)) * hce - c * he
  rw [hc z, hc', mul_add, exp_add]
  ring
end LSG.Weierstrass
end
end

/- LSG.Weierstrass.ZetaQuasiPeriod -/
section
open Module Filter Complex
open scoped Topology
noncomputable section
namespace LSG.Weierstrass
open PeriodPair
variable (L : PeriodPair)
 
def zetaExcept (l₀ : L.lattice) (z : ℂ) : ℂ :=
  ∑' l : L.lattice, if l = l₀ then 0 else zetaSummand l z
lemma hasSumLocallyUniformly_zetaExcept (l₀ : L.lattice) :
    HasSumLocallyUniformly (fun (l : L.lattice) (z : ℂ) ↦ if l = l₀ then 0 else zetaSummand l z)
      (zetaExcept L l₀) := by
  refine PeriodPair.hasSumLocallyUniformly_aux L (u := fun r l ↦ 2 * r ^ 2 * ‖(l : ℂ)‖ ^ (-3 : ℝ))
    _ (fun _ _ ↦ (ZLattice.summable_norm_rpow _ _ (by simp; norm_num)).mul_left _) fun r hr ↦
    Filter.eventually_atTop.mpr ⟨2 * r, ?_⟩
  rintro _ h s hs l rfl
  split_ifs
  · rw [norm_zero]; positivity
  · exact zetaSummand_bound r hr s hs l h
lemma zeta_eq_zetaExcept_add (l₀ : L.lattice) (z : ℂ) :
    zeta L z = zetaExcept L l₀ z + zetaSummand l₀ z := by
  have h := ((hasSumLocallyUniformly_zetaExcept L l₀).hasSum (x := z)).add
    (hasSum_ite_eq l₀ (zetaSummand l₀ z))
  refine (hasSum_zeta L z).unique ?_
  convert h using 1
  funext l
  by_cases hl : l = l₀
  · simp [hl]
  · simp [hl]
lemma continuousAt_zetaExcept (l₀ : L.lattice) : ContinuousAt (zetaExcept L l₀) l₀ := by
  have hU : IsOpen (L.lattice \ {(l₀ : ℂ)} : Set ℂ)ᶜ := L.isOpen_compl_lattice_sdiff
  have hd : DifferentiableOn ℂ (zetaExcept L l₀) (L.lattice \ {(l₀ : ℂ)} : Set ℂ)ᶜ := by
    refine (hasSumLocallyUniformly_zetaExcept L l₀).tendstoLocallyUniformlyOn.differentiableOn
      (.of_forall fun s ↦ .fun_sum fun l _ ↦ ?_) hU
    intro x hx
    split_ifs with hl
    · exact differentiableWithinAt_const _
    · have hxl : x - l ≠ 0 := by
        intro e
        have hxe : x = l := sub_eq_zero.mp e
        apply hx
        refine ⟨hxe ▸ l.2, ?_⟩
        rw [Set.mem_singleton_iff, hxe]
        exact fun h' ↦ hl (Subtype.ext h')
      exact (hasDerivAt_zetaSummand l x hxl).differentiableAt.differentiableWithinAt
  exact ((hd _ (by simp)).differentiableAt (hU.mem_nhds (by simp))).continuousAt

theorem zeta_add {ω : ℂ} (hω : ω ∈ L.lattice) (z : ℂ) :
    zeta L (z + ω) = zeta L z + eta L ω := by
  by_cases hz : z ∉ L.lattice
  · exact zeta_add_eta L hω hz
  replace hz := not_not.mp hz
  set l₀ : L.lattice := ⟨z, hz⟩
  set l₁ : L.lattice := ⟨z + ω, add_mem hz hω⟩
  let G : ℂ → ℂ := fun w ↦ zetaExcept L l₁ (w + ω) - zetaExcept L l₀ w +
    (1 / (z + ω) + (w + ω) / (z + ω) ^ 2 - 1 / z - w / z ^ 2) - eta L ω
  have hG : ∀ w, zeta L (w + ω) - zeta L w - eta L ω = G w := by
    intro w
    rw [zeta_eq_zetaExcept_add L l₁ (w + ω), zeta_eq_zetaExcept_add L l₀ w]
    simp only [G, zetaSummand, l₀, l₁]
    rw [show w + ω - (z + ω) = w - z by ring]
    ring
  have hc : ContinuousAt G z := by
    have h1 : ContinuousAt (fun w ↦ zetaExcept L l₁ (w + ω)) z :=
      (continuousAt_zetaExcept L l₁).comp (f := fun w ↦ w + ω) (continuousAt_id.add_const ω)
    have h2 : ContinuousAt (zetaExcept L l₀) z := continuousAt_zetaExcept L l₀
    exact ((h1.sub h2).add (by fun_prop)).sub continuousAt_const
  have hev : G =ᶠ[𝓝[≠] z] fun _ ↦ 0 := by
    have := L.compl_lattice_sdiff_singleton_mem_nhds z
    filter_upwards [nhdsWithin_le_nhds this, self_mem_nhdsWithin] with w hw hwz
    have hw' : w ∉ L.lattice := fun h ↦ hw ⟨h, hwz⟩
    rw [← hG, zeta_add_eta L hω hw']
    ring
  have hlim : Tendsto G (𝓝[≠] z) (𝓝 (G z)) := hc.tendsto.mono_left nhdsWithin_le_nhds
  have h0 : G z = 0 := tendsto_nhds_unique hlim (tendsto_const_nhds.congr' hev.symm)
  have := hG z
  rw [h0] at this
  linear_combination this
end LSG.Weierstrass
end
end

/- LSG.Weierstrass.RectInv -/
section
open Complex MeasureTheory intervalIntegral Set
open scoped Real ComplexConjugate Interval
noncomputable section
namespace LSG.Weierstrass

def rectIntegral (F : ℂ → ℂ) (z w : ℂ) : ℂ :=
  (∫ x : ℝ in z.re..w.re, F (x + z.im * I)) - (∫ x : ℝ in z.re..w.re, F (x + w.im * I)) +
    I • (∫ y : ℝ in z.im..w.im, F (w.re + y * I)) - I • (∫ y : ℝ in z.im..w.im, F (z.re + y * I))
 
lemma rectIntegral_eq_zero {F : ℂ → ℂ} {z w : ℂ}
    (H : DifferentiableOn ℂ F ([[z.re, w.re]] ×ℂ [[z.im, w.im]])) : rectIntegral F z w = 0 :=
  Complex.integral_boundary_rect_eq_zero_of_differentiableOn F z w H
lemma intervalIntegrable_comp {F : ℂ → ℂ} {s t : ℝ} {g : ℝ → ℂ} (hg : Continuous g)
    (hF : ∀ x ∈ [[s, t]], ContinuousAt F (g x)) :
    IntervalIntegrable (fun x => F (g x)) volume s t :=
  ContinuousOn.intervalIntegrable fun x hx => ((hF x hx).comp hg.continuousAt).continuousWithinAt
 
lemma rectIntegral_add {F₁ F₂ : ℂ → ℂ} {z w : ℂ}
    (h₁ : ∀ p ∈ [[z.re, w.re]] ×ℂ [[z.im, w.im]],
      (p.re = z.re ∨ p.re = w.re ∨ p.im = z.im ∨ p.im = w.im) → ContinuousAt F₁ p)
    (h₂ : ∀ p ∈ [[z.re, w.re]] ×ℂ [[z.im, w.im]],
      (p.re = z.re ∨ p.re = w.re ∨ p.im = z.im ∨ p.im = w.im) → ContinuousAt F₂ p) :
    rectIntegral (fun p => F₁ p + F₂ p) z w = rectIntegral F₁ z w + rectIntegral F₂ z w := by
  have hz : z.im ∈ [[z.im, w.im]] := left_mem_uIcc
  have hw : w.im ∈ [[z.im, w.im]] := right_mem_uIcc
  have hz' : z.re ∈ [[z.re, w.re]] := left_mem_uIcc
  have hw' : w.re ∈ [[z.re, w.re]] := right_mem_uIcc
  have hor : ∀ (F : ℂ → ℂ), (∀ p ∈ [[z.re, w.re]] ×ℂ [[z.im, w.im]],
      (p.re = z.re ∨ p.re = w.re ∨ p.im = z.im ∨ p.im = w.im) → ContinuousAt F p) →
      ∀ c ∈ ({z.im, w.im} : Set ℝ),
      IntervalIntegrable (fun x : ℝ => F (x + c * I)) volume z.re w.re := by
    intro F hF c hc
    refine intervalIntegrable_comp (g := fun x : ℝ => (x : ℂ) + c * I) (by fun_prop) ?_
    intro x hx
    rcases hc with rfl | rfl
    · exact hF _ (by simp [mem_reProdIm, hx, hz]) (by simp)
    · exact hF _ (by simp [mem_reProdIm, hx, hw]) (by simp)
  have ver : ∀ (F : ℂ → ℂ), (∀ p ∈ [[z.re, w.re]] ×ℂ [[z.im, w.im]],
      (p.re = z.re ∨ p.re = w.re ∨ p.im = z.im ∨ p.im = w.im) → ContinuousAt F p) →
      ∀ c ∈ ({z.re, w.re} : Set ℝ),
      IntervalIntegrable (fun y : ℝ => F (c + y * I)) volume z.im w.im := by
    intro F hF c hc
    refine intervalIntegrable_comp (g := fun y : ℝ => (c : ℂ) + y * I) (by fun_prop) ?_
    intro y hy
    rcases hc with rfl | rfl
    · exact hF _ (by simp [mem_reProdIm, hy, hz']) (by simp)
    · exact hF _ (by simp [mem_reProdIm, hy, hw']) (by simp)
  unfold rectIntegral
  rw [integral_add (hor F₁ h₁ _ (by simp)) (hor F₂ h₂ _ (by simp)),
    integral_add (hor F₁ h₁ _ (by simp)) (hor F₂ h₂ _ (by simp)),
    integral_add (ver F₁ h₁ _ (by simp)) (ver F₂ h₂ _ (by simp)),
    integral_add (ver F₁ h₁ _ (by simp)) (ver F₂ h₂ _ (by simp))]
  simp only [smul_add]
  ring
lemma hasDerivAt_log_line {c d : ℂ} {x : ℝ} (h : c + x * d ∈ slitPlane) :
    HasDerivAt (fun t : ℝ => log (c + t * d)) ((c + x * d)⁻¹ * d) x := by
  have h1 : HasDerivAt (fun w : ℂ => log (c + w * d)) ((c + x * d)⁻¹ * d) (x : ℂ) := by
    have := (hasDerivAt_log h).comp (x : ℂ) (((hasDerivAt_id (x : ℂ)).mul_const d).const_add c)
    simpa [Function.comp_def] using this
  exact h1.comp_ofReal
lemma integral_inv_line {c d : ℂ} {s t : ℝ} (hd : d ≠ 0)
    (h : ∀ x ∈ [[s, t]], c + x * d ∈ slitPlane) :
    ∫ x : ℝ in s..t, (c + x * d)⁻¹ = d⁻¹ * (log (c + t * d) - log (c + s * d)) := by
  have hcont : ∀ x ∈ [[s, t]], c + x * d ≠ 0 := fun x hx => slitPlane_ne_zero (h x hx)
  have := integral_eq_sub_of_hasDerivAt (fun x hx => hasDerivAt_log_line (h x hx))
    (ContinuousOn.intervalIntegrable (u := fun x : ℝ => (c + x * d)⁻¹ * d) (by
      refine ContinuousOn.mul ?_ continuousOn_const
      exact ContinuousOn.inv₀ (by fun_prop) hcont))
  rw [intervalIntegral.integral_mul_const] at this
  rw [← this, mul_comm _ d, ← mul_assoc, inv_mul_cancel₀ hd, one_mul]
 
theorem rectIntegral_inv {a b : ℝ} (ha : 0 < a) (hb : 0 < b) :
    rectIntegral (fun z => z⁻¹) ⟨-a, -b⟩ ⟨a, b⟩ = 2 * π * I := by
  unfold rectIntegral
  simp only
  
  have hB : ∫ x : ℝ in (-a)..a, ((x : ℂ) + ((-b : ℝ) : ℂ) * I)⁻¹ =
      log (((-b : ℝ) : ℂ) * I + a) - log (((-b : ℝ) : ℂ) * I + (-a : ℝ)) := by
    have := integral_inv_line (c := ((-b : ℝ) : ℂ) * I) (d := 1) (s := -a) (t := a) one_ne_zero
      (fun x _ => by rw [mem_slitPlane_iff]; right; simp; linarith)
    simpa [add_comm] using this
  have hT : ∫ x : ℝ in (-a)..a, ((x : ℂ) + (b : ℂ) * I)⁻¹ =
      log ((b : ℂ) * I + a) - log ((b : ℂ) * I + (-a : ℝ)) := by
    have := integral_inv_line (c := (b : ℂ) * I) (d := 1) (s := -a) (t := a) one_ne_zero
      (fun x _ => by rw [mem_slitPlane_iff]; right; simp; linarith)
    simpa [add_comm] using this
  have hR : ∫ y : ℝ in (-b)..b, ((a : ℂ) + y * I)⁻¹ =
      I⁻¹ * (log ((a : ℂ) + b * I) - log ((a : ℂ) + (-b : ℝ) * I)) :=
    integral_inv_line I_ne_zero (fun x _ => by rw [mem_slitPlane_iff]; left; simpa using ha)
  have hL : ∫ y : ℝ in (-b)..b, (((-a : ℝ) : ℂ) + y * I)⁻¹ =
      I⁻¹ * (log ((a : ℂ) + (-b : ℝ) * I) - log ((a : ℂ) + b * I)) := by
    have := integral_inv_line (c := (a : ℂ)) (d := -I) (s := -b) (t := b) (neg_ne_zero.mpr I_ne_zero)
      (fun x _ => by rw [mem_slitPlane_iff]; left; simpa using ha)
    have e : ∀ y : ℝ, (((-a : ℝ) : ℂ) + y * I)⁻¹ = -((a : ℂ) + y * -I)⁻¹ := by
      intro y; rw [← inv_neg]; congr 1; push_cast; ring
    simp_rw [e, intervalIntegral.integral_neg, this]
    push_cast
    rw [inv_neg]
    ring_nf
  rw [hB, hT, hR, hL]
  
  set p : ℂ := (a : ℂ) + b * I with hp
  have hpre : p.re = a := by simp [hp]
  have hpim : p.im = b := by simp [hp]
  have e1 : ((-b : ℝ) : ℂ) * I + a = conj p := by
    apply Complex.ext <;> simp [hp]
  have e2 : ((-b : ℝ) : ℂ) * I + (-a : ℝ) = -p := by
    apply Complex.ext <;> simp [hp]
  have e3 : (b : ℂ) * I + a = p := by rw [hp]; ring
  have e4 : (b : ℂ) * I + (-a : ℝ) = -conj p := by
    apply Complex.ext <;> simp [hp]
  have e5 : (a : ℂ) + (-b : ℝ) * I = conj p := by
    apply Complex.ext <;> simp [hp]
  rw [e1, e2, e3, e4, e5]
  have hargp : arg p ≠ π := by
    intro h
    have := Complex.arg_eq_pi_iff.mp h
    linarith [this.2, hpim]
  have harg1 : arg (conj p) = -arg p := by rw [arg_conj, ite_eq_right_iff.mpr (fun h => absurd h hargp)]
  have harg2 : arg (-p) = arg p - π := arg_neg_eq_arg_sub_pi_of_im_pos (by rw [hpim]; exact hb)
  have harg3 : arg (-conj p) = -arg p + π := by
    rw [arg_neg_eq_arg_add_pi_of_im_neg (by simp [hpim, hb]), harg1]
  have hn1 : ‖conj p‖ = ‖p‖ := Complex.norm_conj p
  have hn2 : ‖-p‖ = ‖p‖ := norm_neg p
  have hn3 : ‖-conj p‖ = ‖p‖ := by rw [norm_neg, hn1]
  have key : log (-conj p) - log (-p) + log p - log (conj p) = 2 * π * I := by
    apply Complex.ext
    · simp only [sub_re, add_re, log_re, hn1, hn2, hn3]
      simp
    · simp only [sub_im, add_im, log_im, harg1, harg2, harg3]
      simp
      ring
  simp only [smul_eq_mul, ← mul_assoc, mul_inv_cancel₀ I_ne_zero, one_mul]
  linear_combination key
end LSG.Weierstrass
end
end

/- LSG.Weierstrass.Basic -/
section
open Complex Filter Topology PeriodPair Real
namespace LSG.Weierstrass
variable (L : PeriodPair)
lemma ω₁_ne_zero : L.ω₁ ≠ 0 := by simpa using L.indep.ne_zero 0
 
lemma int_coords_eq {a b c d : ℤ} (h : (a : ℂ) * L.ω₁ + b * L.ω₂ = c * L.ω₁ + d * L.ω₂) :
    a = c ∧ b = d := by
  have := LinearIndependent.pair_iff.mp L.indep ((a : ℝ) - c) ((b : ℝ) - d)
    (by simp only [Complex.real_smul]; push_cast; linear_combination h)
  constructor
  · have h1 := this.1; rw [sub_eq_zero] at h1; exact_mod_cast h1
  · have h2 := this.2; rw [sub_eq_zero] at h2; exact_mod_cast h2
lemma lattice_countable : (L.lattice : Set ℂ).Countable := by
  have : (L.lattice : Set ℂ) ⊆ Set.range (fun p : ℤ × ℤ => (p.1 : ℂ) * L.ω₁ + p.2 * L.ω₂) := by
    intro x hx
    obtain ⟨m, n, h⟩ := PeriodPair.mem_lattice.mp hx
    exact ⟨(m, n), h⟩
  exact (Set.countable_range _).mono this
lemma isPreconnected_compl_lattice : IsPreconnected (L.lattice : Set ℂ)ᶜ :=
  ((lattice_countable L).isConnected_compl_of_one_lt_rank
    (by rw [Complex.rank_real_complex]; norm_num)).isPreconnected
lemma isOpen_compl_lattice : IsOpen (L.lattice : Set ℂ)ᶜ := L.isClosed_lattice.isOpen_compl
 
lemma exists_norm_weierstrassP_gt (M : ℝ) : ∃ z, z ∉ L.lattice ∧ M < ‖℘[L] z‖ := by
  have hc : ContinuousAt (L.weierstrassPExcept 0) 0 :=
    (L.analyticAt_weierstrassPExcept 0).continuousAt
  obtain ⟨δ₁, hδ₁, hb⟩ := Metric.continuousAt_iff.mp hc 1 one_pos
  obtain ⟨δ₂, hδ₂, hball⟩ := Metric.mem_nhds_iff.mp (L.compl_lattice_sdiff_singleton_mem_nhds 0)
  set B := ‖(L.weierstrassPExcept 0) 0‖ + 1
  have hB : 0 ≤ B := by positivity
  set A := |M| + B + 2
  have hA : 2 ≤ A := by have := abs_nonneg M; linarith
  set t : ℝ := min (min δ₁ δ₂ / 2) (1 / A)
  have hδ : 0 < min δ₁ δ₂ := lt_min hδ₁ hδ₂
  have ht0 : 0 < t := lt_min (by positivity) (by positivity)
  have htδ : t < min δ₁ δ₂ := lt_of_le_of_lt (min_le_left _ _) (by linarith)
  have htA : t ≤ 1 / A := min_le_right _ _
  have htn : ‖(t : ℂ)‖ = t := by simp [abs_of_pos ht0]
  have ht1 : ‖(t : ℂ)‖ < δ₁ := by rw [htn]; exact lt_of_lt_of_le htδ (min_le_left _ _)
  have ht2 : ‖(t : ℂ)‖ < δ₂ := by rw [htn]; exact lt_of_lt_of_le htδ (min_le_right _ _)
  have hnot : (t : ℂ) ∉ L.lattice := by
    have := hball (show (t : ℂ) ∈ Metric.ball 0 δ₂ by
      rw [Metric.mem_ball, dist_zero_right]; exact ht2)
    simp only [Set.mem_compl_iff, Set.mem_sdiff, Set.mem_singleton_iff, not_and, not_not] at this
    intro hm
    have := this hm
    exact (ne_of_gt ht0) (by exact_mod_cast this)
  refine ⟨t, hnot, ?_⟩
  have hbd : ‖(L.weierstrassPExcept 0) t‖ ≤ B := by
    have := hb (x := (t : ℂ)) (by rw [dist_zero_right]; exact ht1)
    rw [dist_eq_norm] at this
    have := norm_le_norm_add_norm_sub' (L.weierstrassPExcept 0 t) (L.weierstrassPExcept 0 0)
    simp only [B]
    linarith
  have hdecomp : ℘[L] t = (L.weierstrassPExcept 0) t + 1 / (t : ℂ) ^ 2 := by
    rw [← L.weierstrassPExcept_add ⟨0, L.lattice.zero_mem⟩]; simp
  have hinv : A ≤ 1 / t ^ 2 := by
    have h1 : A * t ≤ 1 := by rw [le_div_iff₀ (by linarith)] at htA; linarith
    have ht1' : t ≤ 1 := by
      have : 1 / A ≤ 1 := by rw [div_le_one (by linarith)]; linarith
      linarith
    rw [le_div_iff₀ (by positivity)]
    nlinarith
  have hnorm : ‖1 / (t : ℂ) ^ 2‖ = 1 / t ^ 2 := by
    simp [norm_pow, abs_of_pos ht0]
  rw [hdecomp]
  have := norm_sub_norm_le (1 / (t : ℂ) ^ 2) (-(L.weierstrassPExcept 0) t)
  rw [sub_neg_eq_add, norm_neg, hnorm, add_comm] at this
  have hM := le_abs_self M
  linarith
lemma hasDerivAt_weierstrassP {z : ℂ} (hz : z ∉ L.lattice) :
    HasDerivAt ℘[L] (℘'[L] z) z := by
  have := (L.differentiableOn_weierstrassP.differentiableAt
    ((isOpen_compl_lattice L).mem_nhds hz)).hasDerivAt
  rwa [L.deriv_weierstrassP] at this
lemma differentiableAt_derivWeierstrassP {z : ℂ} (hz : z ∉ L.lattice) :
    DifferentiableAt ℂ ℘'[L] z :=
  L.differentiableOn_derivWeierstrassP.differentiableAt ((isOpen_compl_lattice L).mem_nhds hz)
 
lemma derivWeierstrassP_not_eventually_zero {z₀ : ℂ} (hz₀ : z₀ ∉ L.lattice) :
    ¬ (℘'[L] =ᶠ[𝓝 z₀] 0) := by
  intro h
  have hEq := L.analyticOnNhd_derivWeierstrassP.eqOn_zero_of_preconnected_of_eventuallyEq_zero
    (isPreconnected_compl_lattice L) hz₀ h
  have hconst : ∀ x ∈ (L.lattice : Set ℂ)ᶜ, ℘[L] x = ℘[L] z₀ := fun x hx =>
    (isOpen_compl_lattice L).is_const_of_deriv_eq_zero (isPreconnected_compl_lattice L)
      L.differentiableOn_weierstrassP (by intro y hy; simp [hEq hy]) hx hz₀
  obtain ⟨z, hz, hM⟩ := (exists_norm_weierstrassP_gt L) ‖℘[L] z₀‖
  rw [hconst z hz] at hM
  exact lt_irrefl _ hM
 
theorem hasDerivAt_derivWeierstrassP {z : ℂ} (hz : z ∉ L.lattice) :
    HasDerivAt ℘'[L] (6 * ℘[L] z ^ 2 - L.g₂ / 2) z := by
  
  have key : ∀ w, w ∉ L.lattice →
      ℘'[L] w * (deriv ℘'[L] w - (6 * ℘[L] w ^ 2 - L.g₂ / 2)) = 0 := by
    intro w hw
    have h1 : HasDerivAt (fun x => ℘'[L] x ^ 2) (↑2 * ℘'[L] w ^ (2 - 1) * deriv ℘'[L] w) w :=
      ((differentiableAt_derivWeierstrassP L) hw).hasDerivAt.pow 2
    have hP := (hasDerivAt_weierstrassP L) hw
    have h2 : HasDerivAt (fun x => 4 * ℘[L] x ^ 3 - L.g₂ * ℘[L] x - L.g₃)
        (4 * (↑3 * ℘[L] w ^ (3 - 1) * ℘'[L] w) - L.g₂ * ℘'[L] w) w :=
      (((hP.pow 3).const_mul 4).sub (hP.const_mul L.g₂)).sub_const L.g₃
    have hev : (fun x => ℘'[L] x ^ 2) =ᶠ[𝓝 w] (fun x => 4 * ℘[L] x ^ 3 - L.g₂ * ℘[L] x - L.g₃) := by
      filter_upwards [(isOpen_compl_lattice L).mem_nhds hw] with x hx
      exact L.derivWeierstrassP_sq x hx
    have := h1.unique (h2.congr_of_eventuallyEq hev)
    norm_num at this
    linear_combination this / 2
  set F : ℂ → ℂ := fun w => deriv ℘'[L] w - (6 * ℘[L] w ^ 2 - L.g₂ / 2) with hF
  have hFa : AnalyticAt ℂ F z := by
    have h1 := (L.analyticOnNhd_derivWeierstrassP z hz).deriv
    have h2 := L.analyticOnNhd_weierstrassP z hz
    exact h1.sub ((analyticAt_const.mul (h2.pow 2)).sub analyticAt_const)
  have hne : ∀ᶠ w in 𝓝[≠] z, ℘'[L] w ≠ 0 :=
    (L.analyticOnNhd_derivWeierstrassP z hz).eventually_eq_zero_or_eventually_ne_zero.resolve_left
      ((derivWeierstrassP_not_eventually_zero L) hz)
  have hU : ∀ᶠ w in 𝓝[≠] z, w ∉ L.lattice :=
    nhdsWithin_le_nhds ((isOpen_compl_lattice L).mem_nhds hz)
  have hfreq : ∃ᶠ w in 𝓝[≠] z, F w = 0 := by
    refine (hne.and hU).mono ?_ |>.frequently
    rintro w ⟨h1, h2⟩
    exact (mul_eq_zero.mp (key w h2)).resolve_left h1
  have hFz : F z = 0 := (hFa.frequently_zero_iff_eventually_zero.mp hfreq).self_of_nhds
  have hd := ((differentiableAt_derivWeierstrassP L) hz).hasDerivAt
  rwa [sub_eq_zero.mp hFz] at hd
 
lemma derivWeierstrassP_half {ω : ℂ} (hω : ω ∈ L.lattice) : ℘'[L] (ω / 2) = 0 := by
  have h1 : ℘'[L] (ω / 2) = ℘'[L] (-(ω / 2)) := by
    rw [← L.derivWeierstrassP_sub_coe (ω / 2) ⟨ω, hω⟩]
    congr 1; ring
  rw [L.derivWeierstrassP_neg] at h1
  linear_combination h1 / 2
 
lemma weierstrassP_half_cubic {ω : ℂ} (hω : ω ∈ L.lattice) (h2 : ω / 2 ∉ L.lattice) :
    4 * ℘[L] (ω / 2) ^ 3 - L.g₂ * ℘[L] (ω / 2) - L.g₃ = 0 := by
  have := L.derivWeierstrassP_sq (ω / 2) h2
  rw [(derivWeierstrassP_half L) hω] at this
  linear_combination -this
section AlgIndep
variable {K : Type*} [Field K] [Algebra K ℂ]
end AlgIndep
end LSG.Weierstrass
end

/- LSG.Weierstrass.Legendre -/
section
open Module Filter Complex MeasureTheory intervalIntegral Set
open scoped Topology Real Interval
noncomputable section
namespace LSG.Weierstrass
open PeriodPair
variable (L : PeriodPair)
lemma differentiableOn_zetaExcept (l₀ : L.lattice) :
    DifferentiableOn ℂ (zetaExcept L l₀) (L.lattice \ {(l₀ : ℂ)} : Set ℂ)ᶜ := by
  refine (hasSumLocallyUniformly_zetaExcept L l₀).tendstoLocallyUniformlyOn.differentiableOn
    (.of_forall fun s ↦ .fun_sum fun l _ ↦ ?_) L.isOpen_compl_lattice_sdiff
  intro x hx
  split_ifs with hl
  · exact differentiableWithinAt_const _
  · have hxl : x - l ≠ 0 := by
      intro e
      have hxe : x = l := sub_eq_zero.mp e
      apply hx
      refine ⟨hxe ▸ l.2, ?_⟩
      rw [Set.mem_singleton_iff, hxe]
      exact fun h' ↦ hl (Subtype.ext h')
    exact (hasDerivAt_zetaSummand l x hxl).differentiableAt.differentiableWithinAt
lemma differentiableAt_zetaExcept_zero {w : ℂ} (hw : w ∉ L.lattice ∨ w = 0) :
    DifferentiableAt ℂ (zetaExcept L 0) w := by
  refine (differentiableOn_zetaExcept L 0 w ?_).differentiableAt
    (L.isOpen_compl_lattice_sdiff.mem_nhds ?_) <;>
  · rintro ⟨h1, h2⟩
    rcases hw with hw | hw
    · exact hw h1
    · exact h2 (by simp [hw])
 
lemma zeta_eq_zetaExcept_zero_add (w : ℂ) : zeta L w = zetaExcept L 0 w + w⁻¹ := by
  rw [zeta_eq_zetaExcept_add L 0 w]
  simp [zetaSummand]
 
theorem legendre_of_basis {α β : ℂ} (hα : α ∈ L.lattice) (hβ : β ∈ L.lattice)
    (hspan : ∀ l ∈ L.lattice, ∃ m n : ℤ, l = m * α + n * β) (him : 0 < (β / α).im) :
    eta L α * β - eta L β * α = 2 * π * I := by
  have hα0 : α ≠ 0 := by rintro rfl; simp at him
  set τ := β / α with hτ
  set b := τ.im / 2 with hb_def
  have hb : 0 < b := by positivity
  have hατ : α * τ = β := by rw [hτ]; field_simp
  set c := α * eta L β - eta L α * β with hc
  set f : ℂ → ℂ := fun z => α * zeta L (α * z) - α * eta L α * z with hf
  set G : ℂ → ℂ := fun z => α * zetaExcept L 0 (α * z) - α * eta L α * z with hG
  have hfG : f = fun z => G z + z⁻¹ := by
    funext z
    simp only [hf, hG]
    rw [zeta_eq_zetaExcept_zero_add, mul_inv, mul_add, mul_inv_cancel_left₀ hα0]
    ring
  have hf1 : ∀ z, f (z + 1) = f z := by
    intro z
    simp only [hf]
    rw [mul_add, mul_one, zeta_add L hα]
    ring
  have hfτ : ∀ z, f (z + τ) = f z + c := by
    intro z
    simp only [hf, hc]
    rw [mul_add, hατ, zeta_add L hβ, mul_add (α * eta L α), ← hατ]
    ring
  
  have hmem : ∀ z : ℂ, α * z ∈ L.lattice → ∃ m n : ℤ, z = m + n * τ := by
    intro z hz
    obtain ⟨m, n, hmn⟩ := hspan _ hz
    refine ⟨m, n, ?_⟩
    rw [hτ]
    field_simp
    linear_combination hmn
  have hpole : ∀ z : ℂ, z.re ∈ Icc (-1/2 : ℝ) (1/2) → z.im ∈ Icc (-b) b →
      α * z ∈ L.lattice → z = 0 := by
    intro z hre him' hz
    obtain ⟨m, n, rfl⟩ := hmem z hz
    have hi : ((m : ℂ) + n * τ).im = n * (2 * b) := by
      simp only [add_im, intCast_im, mul_im, intCast_re, zero_mul, add_zero, zero_add]
      rw [hb_def]; ring
    rw [hi] at him'
    have hn : n = 0 := by
      have h1 : (n : ℝ) * (2 * b) ≤ b := him'.2
      have h2 : -b ≤ (n : ℝ) * (2 * b) := him'.1
      have h3 : (n : ℝ) < 1 := by nlinarith
      have h4 : (-1 : ℝ) < n := by nlinarith
      have : n < 1 := by exact_mod_cast h3
      have : -1 < n := by exact_mod_cast h4
      omega
    subst hn
    have hr : ((m : ℂ) + ((0 : ℤ) : ℂ) * τ).re = m := by simp
    rw [hr] at hre
    have hm : m = 0 := by
      have h3 : (m : ℝ) < 1 := by linarith [hre.2]
      have h4 : (-1 : ℝ) < m := by linarith [hre.1]
      have : m < 1 := by exact_mod_cast h3
      have : -1 < m := by exact_mod_cast h4
      omega
    subst hm
    simp
  
  have hline : ∀ z : ℂ, (z.im = -b ∨ z.im = b) → α * z ∉ L.lattice := by
    intro z hz hzm
    obtain ⟨m, n, rfl⟩ := hmem z hzm
    have hi : ((m : ℂ) + n * τ).im = n * (2 * b) := by
      simp only [add_im, intCast_im, mul_im, intCast_re, zero_mul, add_zero, zero_add]
      rw [hb_def]; ring
    rw [hi] at hz
    rcases hz with hz | hz
    · have : (n : ℝ) * 2 = -1 := by nlinarith
      have : n * 2 = -1 := by exact_mod_cast this
      omega
    · have : (n : ℝ) * 2 = 1 := by nlinarith
      have : n * 2 = 1 := by exact_mod_cast this
      omega
  have hfcont : ∀ z : ℂ, α * z ∉ L.lattice → ContinuousAt f z := by
    intro z hz
    have h1 : DifferentiableAt ℂ (zeta L) (α * z) :=
      (differentiableOn_zeta L _ hz).differentiableAt ((isOpen_compl_coe_lattice L).mem_nhds hz)
    have : DifferentiableAt ℂ f z := by
      simp only [hf]
      fun_prop
    exact this.continuousAt
  
  set z₀ : ℂ := ⟨-1/2, -b⟩
  set w₀ : ℂ := ⟨1/2, b⟩
  have hrect : ∀ p ∈ [[z₀.re, w₀.re]] ×ℂ [[z₀.im, w₀.im]],
      p.re ∈ Icc (-1/2 : ℝ) (1/2) ∧ p.im ∈ Icc (-b) b := by
    intro p hp
    rw [mem_reProdIm] at hp
    simp only [z₀, w₀] at hp
    rw [uIcc_of_le (by norm_num), uIcc_of_le (by linarith)] at hp
    exact hp
  have hGd : ∀ p ∈ [[z₀.re, w₀.re]] ×ℂ [[z₀.im, w₀.im]], DifferentiableAt ℂ G p := by
    intro p hp
    obtain ⟨h1, h2⟩ := hrect p hp
    have hz : α * p ∉ L.lattice ∨ α * p = 0 := by
      by_cases h : α * p ∈ L.lattice
      · right; rw [hpole p h1 h2 h, mul_zero]
      · left; exact h
    have := differentiableAt_zetaExcept_zero L hz
    simp only [hG]
    fun_prop
  have hGzero : rectIntegral G z₀ w₀ = 0 :=
    rectIntegral_eq_zero fun p hp => (hGd p hp).differentiableWithinAt
  
  have hinv : rectIntegral (fun z => z⁻¹) z₀ w₀ = 2 * π * I := by
    have := rectIntegral_inv (a := 1/2) (b := b) (by norm_num) hb
    convert this using 2
    simp [z₀]
    norm_num
  have hbd_ne : ∀ p ∈ [[z₀.re, w₀.re]] ×ℂ [[z₀.im, w₀.im]],
      (p.re = z₀.re ∨ p.re = w₀.re ∨ p.im = z₀.im ∨ p.im = w₀.im) → p ≠ 0 := by
    rintro p - h rfl
    simp only [zero_re, zero_im, z₀, w₀] at h
    rcases h with h | h | h | h <;> linarith
  have hsplit : rectIntegral f z₀ w₀ = 2 * π * I := by
    rw [hfG, rectIntegral_add (fun p hp _ => (hGd p hp).continuousAt)
      (fun p hp hb' => continuousAt_inv₀ (hbd_ne p hp hb')), hGzero, hinv, zero_add]
  
  have hver : (∫ y : ℝ in z₀.im..w₀.im, f (w₀.re + y * I)) =
      ∫ y : ℝ in z₀.im..w₀.im, f (z₀.re + y * I) := by
    refine integral_congr fun y _ => ?_
    rw [← hf1 ((z₀.re : ℂ) + y * I)]
    congr 1
    simp only [z₀, w₀]
    push_cast
    ring
  set g : ℝ → ℂ := fun x => f (x + z₀.im * I) with hg
  have hgper : Function.Periodic g 1 := by
    intro x
    simp only [hg]
    rw [← hf1 ((x : ℂ) + z₀.im * I)]
    congr 1
    push_cast
    ring
  have hgcont : Continuous g := by
    refine continuous_iff_continuousAt.mpr fun x => ?_
    have : ContinuousAt f ((x : ℂ) + z₀.im * I) :=
      hfcont _ (hline _ (Or.inl (by simp [z₀])))
    exact this.comp (g := f) (f := fun x : ℝ => (x : ℂ) + z₀.im * I) (by fun_prop)
  have htop : (∫ x : ℝ in z₀.re..w₀.re, f (x + w₀.im * I)) =
      (∫ x : ℝ in z₀.re..w₀.re, f (x + z₀.im * I)) + c := by
    have e : ∀ x : ℝ, f (x + w₀.im * I) = g (x - τ.re) + c := by
      intro x
      simp only [hg]
      rw [← hfτ]
      congr 1
      apply Complex.ext
      · simp [z₀, w₀, hb_def]
      · simp [z₀, w₀, hb_def]
        ring
    simp_rw [e]
    have hint : IntervalIntegrable (fun x => g (x - τ.re)) volume z₀.re w₀.re :=
      (hgcont.comp (continuous_sub_right τ.re)).intervalIntegrable _ _
    rw [integral_add hint _root_.intervalIntegrable_const, integral_comp_sub_right, intervalIntegral.integral_const]
    have hw : w₀.re - τ.re = (z₀.re - τ.re) + 1 := by simp [z₀, w₀]; ring
    have hw' : w₀.re = z₀.re + 1 := by simp [z₀, w₀]; norm_num
    rw [hw, hgper.intervalIntegral_add_eq (z₀.re - τ.re) z₀.re, ← hw']
    have h1 : w₀.re - z₀.re = 1 := by simp [z₀, w₀]; norm_num
    rw [h1, one_smul]
  have hper : rectIntegral f z₀ w₀ = -c := by
    unfold rectIntegral
    rw [hver, htop]
    ring
  rw [hper] at hsplit
  rw [hc] at hsplit
  linear_combination hsplit
lemma im_div_ne_zero : (L.ω₂ / L.ω₁).im ≠ 0 := by
  intro h
  have h1 := ω₁_ne_zero L
  set t := (L.ω₂ / L.ω₁).re
  have ht : L.ω₂ / L.ω₁ = (t : ℂ) := Complex.ext (by simp [t]) (by simp [h])
  have hω : L.ω₂ = t * L.ω₁ := by rw [← ht]; field_simp
  have := LinearIndependent.pair_iff.mp L.indep t (-1) (by
    simp only [Complex.real_smul, hω]; push_cast; ring)
  norm_num at this
 
theorem legendre_of_im_pos (h : 0 < (L.ω₂ / L.ω₁).im) :
    eta L L.ω₁ * L.ω₂ - eta L L.ω₂ * L.ω₁ = 2 * π * I :=
  legendre_of_basis L L.ω₁_mem_lattice L.ω₂_mem_lattice
    (fun l hl => by obtain ⟨m, n, h⟩ := mem_lattice.mp hl; exact ⟨m, n, h.symm⟩) h
 
theorem legendre_of_im_neg (h : (L.ω₂ / L.ω₁).im < 0) :
    eta L L.ω₁ * L.ω₂ - eta L L.ω₂ * L.ω₁ = -(2 * π * I) := by
  have h' : 0 < (L.ω₁ / L.ω₂).im := by
    have : L.ω₁ / L.ω₂ = (L.ω₂ / L.ω₁)⁻¹ := by rw [inv_div]
    rw [this, inv_im, neg_div]
    apply neg_pos.mpr
    apply div_neg_of_neg_of_pos h
    rw [normSq_pos]
    intro h0
    rw [h0] at h
    simp at h
  have := legendre_of_basis L L.ω₂_mem_lattice L.ω₁_mem_lattice
    (fun l hl => by
      obtain ⟨m, n, h⟩ := mem_lattice.mp hl
      exact ⟨n, m, by rw [← h]; ring⟩) h'
  linear_combination -this
 
theorem legendre :
    eta L L.ω₁ * L.ω₂ - eta L L.ω₂ * L.ω₁ =
      2 * π * I * (if 0 < (L.ω₂ / L.ω₁).im then 1 else -1) := by
  split_ifs with h
  · rw [mul_one]; exact legendre_of_im_pos L h
  · rw [legendre_of_im_neg L (lt_of_le_of_ne (not_lt.mp h) (im_div_ne_zero L))]
    ring
lemma legendre_ne_zero : eta L L.ω₁ * L.ω₂ - eta L L.ω₂ * L.ω₁ ≠ 0 := by
  rw [legendre]
  have hπ : (π : ℂ) ≠ 0 := ofReal_ne_zero.mpr Real.pi_ne_zero
  split_ifs <;> simp [hπ, I_ne_zero]
end LSG.Weierstrass
end
end

/- LSG.Weierstrass.Residue -/
section
open Module Filter Complex Set
open scoped Topology
noncomputable section
namespace LSG.Weierstrass
open PeriodPair
 
def LocBdd (f : ℂ → ℂ) (s : ℂ) : Prop := ∃ M : ℝ, ∀ᶠ u in 𝓝[≠] s, ‖f u‖ ≤ M
 
def Discr (S : Set ℂ) : Prop := ∀ x, ∀ᶠ y in 𝓝[≠] x, y ∉ S
section LocBdd
variable {f g : ℂ → ℂ} {s : ℂ}
lemma LocBdd.of_continuousAt (h : ContinuousAt f s) : LocBdd f s := by
  refine ⟨‖f s‖ + 1, nhdsWithin_le_nhds ?_⟩
  exact (h.norm.eventually (Iio_mem_nhds (lt_add_one _))).mono fun u hu => le_of_lt hu
lemma LocBdd.congr (h : LocBdd f s) (hfg : ∀ᶠ u in 𝓝[≠] s, f u = g u) : LocBdd g s := by
  obtain ⟨M, hM⟩ := h
  exact ⟨M, (hM.and hfg).mono fun u hu => hu.2 ▸ hu.1⟩
lemma LocBdd.sub (hf : LocBdd f s) (hg : LocBdd g s) : LocBdd (fun u => f u - g u) s := by
  obtain ⟨M, hM⟩ := hf
  obtain ⟨N, hN⟩ := hg
  exact ⟨M + N, (hM.and hN).mono fun u hu => (norm_sub_le _ _).trans (add_le_add hu.1 hu.2)⟩
lemma LocBdd.mul (hf : LocBdd f s) (hg : LocBdd g s) : LocBdd (fun u => f u * g u) s := by
  obtain ⟨M, hM⟩ := hf
  obtain ⟨N, hN⟩ := hg
  refine ⟨max M 0 * max N 0, (hM.and hN).mono fun u hu => ?_⟩
  rw [norm_mul]
  exact mul_le_mul (hu.1.trans (le_max_left _ _)) (hu.2.trans (le_max_left _ _)) (norm_nonneg _)
    (le_max_right _ _)
lemma tendsto_sub_nhdsNE (s ω : ℂ) : Tendsto (fun u => u - ω) (𝓝[≠] (s + ω)) (𝓝[≠] s) := by
  refine tendsto_nhdsWithin_of_tendsto_nhds_of_eventually_within _ ?_ ?_
  · have := (continuous_sub_right ω).tendsto (s + ω)
    simp only [add_sub_cancel_right] at this
    exact this.mono_left nhdsWithin_le_nhds
  · refine eventually_nhdsWithin_of_forall fun u hu => ?_
    simp only [mem_compl_iff, mem_singleton_iff] at hu ⊢
    intro h
    exact hu (by rw [← h]; ring)
lemma tendsto_neg_nhdsNE (s : ℂ) : Tendsto (fun u => -u) (𝓝[≠] (-s)) (𝓝[≠] s) := by
  refine tendsto_nhdsWithin_of_tendsto_nhds_of_eventually_within _ ?_ ?_
  · have := continuous_neg.tendsto (-s)
    simp only [neg_neg] at this
    exact this.mono_left nhdsWithin_le_nhds
  · refine eventually_nhdsWithin_of_forall fun u hu => ?_
    simp only [mem_compl_iff, mem_singleton_iff] at hu ⊢
    intro h
    exact hu (by rw [← h]; ring)
lemma LocBdd.of_periodic {ω : ℂ} (hper : ∀ u, f (u + ω) = f u) (h : LocBdd f s) :
    LocBdd f (s + ω) := by
  obtain ⟨M, hM⟩ := h
  refine ⟨M, ((tendsto_sub_nhdsNE s ω).eventually hM).mono fun u hu => ?_⟩
  have := hper (u - ω)
  rw [sub_add_cancel] at this
  rw [this]; exact hu
lemma LocBdd.of_even (heven : ∀ u, f (-u) = f u) (h : LocBdd f s) : LocBdd f (-s) := by
  obtain ⟨M, hM⟩ := h
  refine ⟨M, ((tendsto_neg_nhdsNE s).eventually hM).mono fun u hu => ?_⟩
  have := heven u
  rwa [this] at hu
end LocBdd
 
lemma eq_of_eventuallyEq_nhdsNE {F₁ F₂ : ℂ → ℂ} {u : ℂ} (h₁ : ContinuousAt F₁ u)
    (h₂ : ContinuousAt F₂ u) (h : ∀ᶠ v in 𝓝[≠] u, F₁ v = F₂ v) : F₁ u = F₂ u :=
  tendsto_nhds_unique ((h₁.tendsto.mono_left nhdsWithin_le_nhds).congr' h)
    (h₂.tendsto.mono_left nhdsWithin_le_nhds)
section Discr
variable (L : PeriodPair)
lemma Discr.union {S T : Set ℂ} (hS : Discr S) (hT : Discr T) : Discr (S ∪ T) := fun x =>
  ((hS x).and (hT x)).mono fun _ hy h => h.elim hy.1 hy.2
lemma Discr.eventually_nhds {S : Set ℂ} (hS : Discr S) {x : ℂ} (hx : x ∉ S) :
    ∀ᶠ y in 𝓝 x, y ∉ S := by
  have := hS x
  rw [eventually_nhdsWithin_iff] at this
  filter_upwards [this] with y hy
  by_cases h : y = x
  · rw [h]; exact hx
  · exact hy h
lemma Discr.exists_notMem {S : Set ℂ} (hS : Discr S) : ∃ u, u ∉ S := (hS 0).exists
 
lemma discr_affine {c : ℂ} (hc : c ≠ 0) (d : ℂ) : Discr {u | c * u + d ∈ L.lattice} := by
  intro x
  have h1 := L.compl_lattice_sdiff_singleton_mem_nhds (c * x + d)
  have h2 : Tendsto (fun u => c * u + d) (𝓝 x) (𝓝 (c * x + d)) :=
    ((continuous_const.mul continuous_id).add continuous_const).tendsto x
  filter_upwards [nhdsWithin_le_nhds (h2.eventually h1), self_mem_nhdsWithin] with u hu hux
  intro hmem
  apply hu
  refine ⟨hmem, fun h => hux ?_⟩
  simp only [mem_singleton_iff, add_left_inj] at h ⊢
  exact mul_left_cancel₀ hc h
lemma discr_sub (a : ℂ) : Discr {u | u - a ∈ L.lattice} := by
  have := discr_affine L one_ne_zero (-a)
  simpa [sub_eq_add_neg] using this
lemma discr_add (a : ℂ) : Discr {u | u + a ∈ L.lattice} := by
  have := discr_affine L one_ne_zero a
  simpa using this
end Discr

theorem exists_differentiable_extension {f : ℂ → ℂ} {S : Set ℂ} (hS : Discr S)
    (hd : ∀ x ∉ S, DifferentiableAt ℂ f x) (hb : ∀ s ∈ S, LocBdd f s) :
    ∃ F : ℂ → ℂ, Differentiable ℂ F ∧ ∀ x ∉ S, F x = f x := by
  classical
  set F : ℂ → ℂ := fun x => if x ∈ S then limUnder (𝓝[≠] x) f else f x with hF
  refine ⟨F, fun x => ?_, fun x hx => by simp [hF, hx]⟩
  by_cases hx : x ∈ S
  · obtain ⟨M, hM⟩ := hb x hx
    have h := (hS x).and hM
    rw [eventually_nhdsWithin_iff] at h
    set U := {y | y ≠ x → y ∉ S ∧ ‖f y‖ ≤ M}
    have hU : U ∈ 𝓝 x := h
    have hdU : DifferentiableOn ℂ f (U \ {x}) := fun y hy =>
      (hd y (hy.1 hy.2).1).differentiableWithinAt
    have hbU : BddAbove (norm ∘ f '' (U \ {x})) :=
      ⟨M, by rintro _ ⟨y, hy, rfl⟩; exact (hy.1 hy.2).2⟩
    have hD := (Complex.differentiableOn_update_limUnder_of_bddAbove hU hdU hbU).differentiableAt hU
    refine hD.congr_of_eventuallyEq ?_
    filter_upwards [hU] with y hy
    by_cases hyx : y = x
    · subst hyx; simp [hF, hx]
    · simp [hF, (hy hyx).1, Function.update_of_ne hyx]
  · refine (hd x hx).congr_of_eventuallyEq ?_
    filter_upwards [hS.eventually_nhds hx] with y hy
    simp [hF, hy]
variable (L : PeriodPair)
 
theorem eq_linear_of_add_sub_const {F : ℂ → ℂ} (hF : Differentiable ℂ F)
    (h : ∀ ω ∈ L.lattice, ∃ c, ∀ u, F (u + ω) = F u + c) :
    ∃ α β : ℂ, ∀ u, F u = α * u + β := by
  have hd : Differentiable ℂ (deriv F) := hF.deriv
  have hper : ∀ u ω, ω ∈ L.lattice → deriv F (u + ω) = deriv F u := by
    intro u ω hω
    obtain ⟨c, hc⟩ := h ω hω
    have e : (fun v => F (v + ω)) = fun v => F v + c := funext hc
    have h1 : deriv (fun v => F (v + ω)) u = deriv F (u + ω) := deriv_comp_add_const F ω u
    rw [← h1, e, deriv_add_const]
  have hc := IsZLattice.isCompact_range_of_periodic L.lattice _ hd.continuous
    (fun z w hw => hper z w hw)
  set α := deriv F 0
  have hconst : ∀ u, deriv F u = α := fun u => hd.apply_eq_apply_of_bounded hc.isBounded u 0
  refine ⟨α, F 0, fun u => ?_⟩
  have hG : Differentiable ℂ (fun v => F v - α * v) := hF.sub (differentiable_id.const_mul α)
  have hG' : ∀ v, deriv (fun v => F v - α * v) v = 0 := by
    intro v
    have : HasDerivAt (fun v => F v - α * v) (deriv F v - α * 1) v :=
      (hF v).hasDerivAt.sub ((hasDerivAt_id' v).const_mul α)
    rw [this.deriv, hconst v]
    ring
  have := is_const_of_deriv_eq_zero hG hG' u 0
  simp only [mul_zero, sub_zero] at this
  linear_combination this

theorem eq_const_of_simple_pole {f : ℂ → ℂ} {S : Set ℂ} (a : ℂ) (hS : Discr S)
    (hSinv : ∀ u ∈ S, ∀ ω ∈ L.lattice, u + ω ∈ S)
    (hper : ∀ u ∉ S, ∀ ω ∈ L.lattice, f (u + ω) = f u)
    (hd : ∀ x ∉ S, DifferentiableAt ℂ f x)
    (hb : ∀ s ∈ S, s - a ∉ L.lattice → LocBdd f s)
    (ha : LocBdd (fun u => (u - a) * f u) a) :
    ∃ C, ∀ u ∉ S, f u = C := by
  set A : Set ℂ := {u | u - a ∈ L.lattice} with hA_def
  set S' := S ∪ A with hS'_def
  have hS' : Discr S' := hS.union (discr_sub L a)
  have hS'inv : ∀ u ∉ S', ∀ ω ∈ L.lattice, u + ω ∉ S' := by
    intro u hu ω hω h
    apply hu
    rcases h with h | h
    · left
      have := hSinv _ h (-ω) (neg_mem hω)
      rwa [add_neg_cancel_right] at this
    · right
      change u + ω - a ∈ L.lattice at h
      change u - a ∈ L.lattice
      have := sub_mem h hω
      rwa [show u + ω - a - ω = u - a by ring] at this
  
  set h : ℂ → ℂ := fun u => (u - a) * f u with hh_def
  obtain ⟨M, hM⟩ := ha
  have hh := (hS a).and hM
  rw [eventually_nhdsWithin_iff] at hh
  set U := {y | y ≠ a → y ∉ S ∧ ‖h y‖ ≤ M}
  have hU : U ∈ 𝓝 a := hh
  have hdU : DifferentiableOn ℂ h (U \ {a}) := fun y hy =>
    ((differentiableAt_id.sub_const a).mul (hd y (hy.1 hy.2).1)).differentiableWithinAt
  have hbU : BddAbove (norm ∘ h '' (U \ {a})) :=
    ⟨M, by rintro _ ⟨y, hy, rfl⟩; exact (hy.1 hy.2).2⟩
  set r := limUnder (𝓝[≠] a) h
  set H := Function.update h a r with hH_def
  have hH : DifferentiableAt ℂ H a :=
    (Complex.differentiableOn_update_limUnder_of_bddAbove hU hdU hbU).differentiableAt hU
  have hdsl : ContinuousAt (dslope H a) a := continuousAt_dslope_same.mpr hH
  have hloc : ∀ u, u ≠ a → f u - r * (u - a)⁻¹ = dslope H a u := by
    intro u hu
    have hu' : u - a ≠ 0 := sub_ne_zero.mpr hu
    rw [dslope_of_ne _ hu, slope_def_field]
    simp only [hH_def, Function.update_of_ne hu, Function.update_self, hh_def]
    field_simp
  
  set g : ℂ → ℂ := fun u => f u - r * zeta L (u - a) with hg_def
  have hzc : ∀ x, x - a ∉ L.lattice → DifferentiableAt ℂ (fun u => zeta L (u - a)) x := by
    intro x hx
    have := (differentiableOn_zeta L _ hx).differentiableAt
      ((isOpen_compl_coe_lattice L).mem_nhds hx)
    exact this.comp x (differentiableAt_id.sub_const a)
  have hgd : ∀ x ∉ S', DifferentiableAt ℂ g x := by
    intro x hx
    have h1 : x ∉ S := fun h => hx (Or.inl h)
    have h2 : x - a ∉ L.lattice := fun h => hx (Or.inr h)
    exact (hd x h1).sub ((hzc x h2).const_mul r)
  have hgper : ∀ u ∉ S', ∀ ω ∈ L.lattice, g (u + ω) = g u + -(r * eta L ω) := by
    intro u hu ω hω
    have h1 : u ∉ S := fun h => hu (Or.inl h)
    simp only [hg_def]
    rw [hper u h1 ω hω, show u + ω - a = (u - a) + ω by ring, zeta_add L hω]
    ring
  have hga : LocBdd g a := by
    have hc : ContinuousAt (fun u => dslope H a u - r * zetaExcept L 0 (u - a)) a := by
      have h1 : ContinuousAt (fun u => zetaExcept L 0 (u - a)) a := by
        have := (differentiableAt_zetaExcept_zero L (w := a - a) (Or.inr (sub_self a))).continuousAt
        exact this.comp (f := fun u => u - a) (continuousAt_id.sub continuousAt_const)
      exact hdsl.sub (continuousAt_const.mul h1)
    refine (LocBdd.of_continuousAt hc).congr ?_
    filter_upwards [self_mem_nhdsWithin] with u hu
    rw [← hloc u hu]
    simp only [hg_def]
    rw [zeta_eq_zetaExcept_zero_add]
    ring
  have hgb : ∀ s ∈ S', LocBdd g s := by
    intro s hs
    by_cases hsa : s - a ∈ L.lattice
    · obtain ⟨M', hM'⟩ := hga
      refine ⟨M' + ‖r * eta L (s - a)‖, ?_⟩
      have h1 := (tendsto_sub_nhdsNE a (s - a)).eventually (hM'.and (hS' a))
      rw [show a + (s - a) = s by ring] at h1
      filter_upwards [h1] with u hu
      have := hgper (u - (s - a)) hu.2 (s - a) hsa
      rw [sub_add_cancel] at this
      rw [this]
      exact (norm_add_le _ _).trans (by rw [norm_neg]; linarith [hu.1])
    · have hsS : s ∈ S := hs.resolve_right hsa
      exact (hb s hsS hsa).sub
        (LocBdd.of_continuousAt (continuousAt_const.mul (hzc s hsa).continuousAt))
  obtain ⟨G, hGd, hGg⟩ := exists_differentiable_extension hS' hgd hgb
  have hGper : ∀ ω ∈ L.lattice, ∃ c, ∀ u, G (u + ω) = G u + c := by
    intro ω hω
    refine ⟨-(r * eta L ω), fun u => ?_⟩
    refine eq_of_eventuallyEq_nhdsNE (F₁ := fun u => G (u + ω)) (F₂ := fun u => G u + -(r * eta L ω))
      ((hGd _).continuousAt.comp (continuousAt_id.add continuousAt_const))
      ((hGd u).continuousAt.add continuousAt_const) ?_
    filter_upwards [hS' u] with v hv
    rw [hGg _ (hS'inv v hv ω hω), hGg v hv, hgper v hv ω hω]
  obtain ⟨α, β, hαβ⟩ := eq_linear_of_add_sub_const L hGd hGper
  obtain ⟨u₀, hu₀⟩ := hS'.exists_notMem
  have hαω : ∀ ω ∈ L.lattice, α * ω = -(r * eta L ω) := by
    intro ω hω
    have h1 := hgper u₀ hu₀ ω hω
    rw [← hGg _ (hS'inv u₀ hu₀ ω hω), ← hGg u₀ hu₀, hαβ, hαβ] at h1
    linear_combination h1
  have hr : r = 0 := by
    have h1 := hαω _ L.ω₁_mem_lattice
    have h2 := hαω _ L.ω₂_mem_lattice
    have hl := legendre_ne_zero L
    have : r * (eta L L.ω₁ * L.ω₂ - eta L L.ω₂ * L.ω₁) = 0 := by
      linear_combination L.ω₂ * h1 - L.ω₁ * h2
    exact (mul_eq_zero.mp this).resolve_right hl
  have hα : α = 0 := by
    have h1 := hαω _ L.ω₁_mem_lattice
    rw [hr, zero_mul, neg_zero] at h1
    exact (mul_eq_zero.mp h1).resolve_right (ω₁_ne_zero L)
  have hfG : ∀ v ∉ S', f v = β := by
    intro v hv
    have := hGg v hv
    rw [hαβ, hα, zero_mul, zero_add] at this
    simp only [hg_def, hr, zero_mul, sub_zero] at this
    exact this.symm
  refine ⟨β, fun u hu => ?_⟩
  by_cases hua : u - a ∈ L.lattice
  · refine eq_of_eventuallyEq_nhdsNE (F₂ := fun _ => β) (hd u hu).continuousAt continuousAt_const ?_
    filter_upwards [hS' u] with v hv
    exact hfG v hv
  · exact hfG u (fun h => h.elim hu hua)
end LSG.Weierstrass
end
end

/- LSG.Weierstrass.SigmaSign -/
section
open Module Filter Complex
open scoped Topology
noncomputable section
namespace LSG.Weierstrass
open PeriodPair
variable (L : PeriodPair)
open scoped Classical in
 
def sigmaSign (ω : ℂ) : ℂ := if ω / 2 ∈ L.lattice then 1 else -1
lemma sigmaSign_sq (ω : ℂ) : sigmaSign L ω ^ 2 = 1 := by
  unfold sigmaSign; split_ifs <;> norm_num
lemma sigmaSign_ne_zero (ω : ℂ) : sigmaSign L ω ≠ 0 := by
  unfold sigmaSign; split_ifs <;> norm_num
lemma sigmaSign_of_half_notMem {ω : ℂ} (h : ω / 2 ∉ L.lattice) : sigmaSign L ω = -1 := by
  simp [sigmaSign, h]
lemma sigmaSign_of_half_mem {ω : ℂ} (h : ω / 2 ∈ L.lattice) : sigmaSign L ω = 1 := by
  simp [sigmaSign, h]
 
lemma sigma_add_two_mul {ω' : ℂ} (hω' : ω' ∈ L.lattice)
    (ih : ∀ z, sigma L (z + ω') = sigmaSign L ω' * exp (eta L ω' * (z + ω' / 2)) * sigma L z)
    (z : ℂ) :
    sigma L (z + 2 * ω') = sigmaSign L (2 * ω') * exp (eta L (2 * ω') * (z + 2 * ω' / 2)) *
      sigma L z := by
  have h2 : (2 * ω') / 2 ∈ L.lattice := by simpa using hω'
  rw [sigmaSign_of_half_mem L h2, two_mul ω', eta_add L hω' hω',
    show z + (ω' + ω') = (z + ω') + ω' by ring, ih, ih]
  have hs := sigmaSign_sq L ω'
  have e : exp (eta L ω' * (z + ω' + ω' / 2)) * exp (eta L ω' * (z + ω' / 2)) =
      exp ((eta L ω' + eta L ω') * (z + (ω' + ω') / 2)) := by
    rw [← exp_add]; ring_nf
  linear_combination (exp (eta L ω' * (z + ω' + ω' / 2)) * exp (eta L ω' * (z + ω' / 2)) *
    sigma L z) * hs + sigma L z * e

theorem sigma_add {ω : ℂ} (hω : ω ∈ L.lattice) (z : ℂ) :
    sigma L (z + ω) = sigmaSign L ω * exp (eta L ω * (z + ω / 2)) * sigma L z := by
  obtain ⟨m, n, rfl⟩ := mem_lattice.mp hω
  revert z
  induction h : m.natAbs + n.natAbs using Nat.strong_induction_on generalizing m n with
  | _ N ih =>
  intro z
  by_cases h2 : ((m : ℂ) * L.ω₁ + n * L.ω₂) / 2 ∈ L.lattice
  · obtain ⟨m', n', hmn⟩ := mem_lattice.mp h2
    
    have hind := LinearIndependent.pair_iff.mp L.indep ((2 * m' - m : ℤ) : ℝ)
      ((2 * n' - n : ℤ) : ℝ) (by
        simp only [Complex.real_smul]
        push_cast
        linear_combination 2 * hmn)
    have hm : 2 * m' = m := by have := Int.cast_eq_zero.mp hind.1; omega
    have hn : 2 * n' = n := by have := Int.cast_eq_zero.mp hind.2; omega
    by_cases h0 : N = 0
    · have hm0 : m = 0 := by omega
      have hn0 : n = 0 := by omega
      subst hm0 hn0
      simp [sigmaSign]
    · have hlt : m'.natAbs + n'.natAbs < N := by omega
      have ih' := ih _ hlt m' n' (by rw [hmn]; exact h2) rfl
      have e : (m : ℂ) * L.ω₁ + n * L.ω₂ = 2 * ((m' : ℂ) * L.ω₁ + n' * L.ω₂) := by
        rw [← hm, ← hn]; push_cast; ring
      rw [e]
      exact sigma_add_two_mul L (by rw [hmn]; exact h2) ih' z
  · rw [sigmaSign_of_half_notMem L h2, sigma_add_of_half_notMem L hω h2 z]
    ring
end LSG.Weierstrass
end
end

/- LSG.Weierstrass.Degree -/
section
open Module Filter Complex Set
open scoped Topology
noncomputable section
namespace LSG.Weierstrass
open PeriodPair
variable (L : PeriodPair)
lemma sigma_eq_mul_sigmaProd (u : ℂ) : sigma L u = u * sigmaProd L u := rfl
lemma continuous_sigma : Continuous (sigma L) := (differentiable_sigma L).continuous
lemma continuous_sigmaProd : Continuous (sigmaProd L) := (differentiable_sigmaProd L).continuous
lemma differentiableAt_weierstrassP {z : ℂ} (hz : z ∉ L.lattice) :
    DifferentiableAt ℂ ℘[L] z :=
  L.differentiableOn_weierstrassP.differentiableAt ((isOpen_compl_lattice L).mem_nhds hz)
lemma continuousAt_weierstrassP {z : ℂ} (hz : z ∉ L.lattice) : ContinuousAt ℘[L] z :=
  (differentiableAt_weierstrassP L hz).continuousAt
lemma continuousAt_derivWeierstrassP {z : ℂ} (hz : z ∉ L.lattice) : ContinuousAt ℘'[L] z :=
  (differentiableAt_derivWeierstrassP L hz).continuousAt
lemma weierstrassP_add_mem (u : ℂ) {ω : ℂ} (hω : ω ∈ L.lattice) : ℘[L] (u + ω) = ℘[L] u :=
  L.weierstrassP_add_coe u ⟨ω, hω⟩
lemma derivWeierstrassP_add_mem (u : ℂ) {ω : ℂ} (hω : ω ∈ L.lattice) :
    ℘'[L] (u + ω) = ℘'[L] u :=
  L.derivWeierstrassP_add_coe u ⟨ω, hω⟩
 
lemma weierstrassP_eq_except_zero (u : ℂ) : ℘[L] u = L.weierstrassPExcept 0 u + 1 / u ^ 2 := by
  have := L.weierstrassPExcept_add ⟨0, L.lattice.zero_mem⟩ u
  simp only [sub_zero, div_zero, ne_eq, OfNat.ofNat_ne_zero, not_false_eq_true, zero_pow,
    sub_zero] at this
  rw [← this]
 
lemma derivWeierstrassP_eq_except_zero (u : ℂ) : ℘'[L] u = L.derivWeierstrassPExcept 0 u - 2 / u ^ 3 := by
  have := L.derivWeierstrassPExcept_def ⟨0, L.lattice.zero_mem⟩ u
  simp only [sub_zero] at this
  rw [this]
  ring
lemma continuousAt_weierstrassPExcept_zero : ContinuousAt (L.weierstrassPExcept 0) 0 :=
  (L.analyticAt_weierstrassPExcept 0).continuousAt
lemma continuousAt_derivWeierstrassPExcept_zero : ContinuousAt (L.derivWeierstrassPExcept 0) 0 :=
  (L.analyticAt_derivWeierstrassPExcept 0).continuousAt
 
lemma sigma_add' {ω : ℂ} (hω : ω ∈ L.lattice) (u : ℂ) :
    sigma L (u + ω) = (sigmaSign L ω * exp (eta L ω * (u + ω / 2))) * sigma L u :=
  sigma_add L hω u
lemma sigmaSign_mul_exp_ne_zero (ω v : ℂ) : sigmaSign L ω * exp v ≠ 0 :=
  mul_ne_zero (sigmaSign_ne_zero L ω) (exp_ne_zero v)
lemma exp_mul_exp_eq {e a b c : ℂ} (h : a + b = 2 * c) :
    exp (e * a) * exp (e * b) = exp (e * c) * exp (e * c) := by
  rw [← exp_add, ← exp_add]
  congr 1
  linear_combination e * h
 
lemma dslope_eq_div {f : ℂ → ℂ} {a u : ℂ} (hu : u ≠ a) :
    dslope f a u = (f u - f a) / (u - a) := by
  rw [dslope_of_ne _ hu, slope_def_field]
 
def degF (z u : ℂ) : ℂ :=
  (℘[L] u - ℘[L] z) * sigma L u ^ 2 / (sigma L (u - z) * sigma L (u + z))
lemma degF_add (z : ℂ) {ω : ℂ} (hω : ω ∈ L.lattice) (u : ℂ) :
    degF L z (u + ω) = degF L z u := by
  unfold degF
  rw [weierstrassP_add_mem L u hω, sigma_add' L hω u, show u + ω - z = (u - z) + ω by ring,
    sigma_add' L hω (u - z), show u + ω + z = (u + z) + ω by ring, sigma_add' L hω (u + z)]
  set s := sigmaSign L ω
  set e := eta L ω
  have hE := exp_mul_exp_eq (e := e) (a := u - z + ω / 2) (b := u + z + ω / 2) (c := u + ω / 2)
    (by ring)
  have hK : s * s * (exp (e * (u + ω / 2)) * exp (e * (u + ω / 2))) ≠ 0 :=
    mul_ne_zero (mul_ne_zero (sigmaSign_ne_zero L ω) (sigmaSign_ne_zero L ω))
      (mul_ne_zero (exp_ne_zero _) (exp_ne_zero _))
  rw [show s * exp (e * (u - z + ω / 2)) * sigma L (u - z) *
      (s * exp (e * (u + z + ω / 2)) * sigma L (u + z)) =
      sigma L (u - z) * sigma L (u + z) *
        (s * s * (exp (e * (u - z + ω / 2)) * exp (e * (u + z + ω / 2)))) by ring, hE,
    show (℘[L] u - ℘[L] z) * (s * exp (e * (u + ω / 2)) * sigma L u) ^ 2 =
      (℘[L] u - ℘[L] z) * sigma L u ^ 2 *
        (s * s * (exp (e * (u + ω / 2)) * exp (e * (u + ω / 2)))) by ring,
    mul_div_mul_right _ _ hK]
lemma degF_neg (z u : ℂ) : degF L z (-u) = degF L z u := by
  unfold degF
  rw [weierstrassP_neg, sigma_neg, show -u - z = -(u + z) by ring, sigma_neg,
    show -u + z = -(u - z) by ring, sigma_neg]
  ring
 
def degS (z : ℂ) : Set ℂ := {u | u ∈ L.lattice ∨ u - z ∈ L.lattice ∨ u + z ∈ L.lattice}
lemma discr_degS (z : ℂ) : Discr (degS L z) := by
  have h := ((discr_add L 0).union (discr_sub L z)).union (discr_add L z)
  convert h using 1
  ext u
  simp [degS, or_assoc]
lemma degS_add {z u ω : ℂ} (hu : u ∈ degS L z) (hω : ω ∈ L.lattice) : u + ω ∈ degS L z := by
  rcases hu with h | h | h
  · exact Or.inl (add_mem h hω)
  · right; left
    rw [show u + ω - z = (u - z) + ω by ring]; exact add_mem h hω
  · right; right
    rw [show u + ω + z = (u + z) + ω by ring]; exact add_mem h hω
lemma differentiableAt_degF {z x : ℂ} (hx : x ∉ degS L z) : DifferentiableAt ℂ (degF L z) x := by
  have h0 : x ∉ L.lattice := fun h => hx (Or.inl h)
  have h1 : x - z ∉ L.lattice := fun h => hx (Or.inr (Or.inl h))
  have h2 : x + z ∉ L.lattice := fun h => hx (Or.inr (Or.inr h))
  have hP := differentiableAt_weierstrassP L h0
  have hs := differentiable_sigma L
  unfold degF
  refine DifferentiableAt.div ?_ ?_ (mul_ne_zero (sigma_ne_zero L h1) (sigma_ne_zero L h2))
  · exact (hP.sub_const _).mul ((hs x).pow 2)
  · exact ((hs _).comp x (differentiableAt_id.sub_const z)).mul
      ((hs _).comp x (differentiableAt_id.add_const z))
 
lemma locBdd_degF_zero {z : ℂ} (hz : z ∉ L.lattice) : LocBdd (degF L z) 0 := by
  have hz' : -z ∉ L.lattice := fun h => hz (by simpa using neg_mem h)
  set g : ℂ → ℂ := fun u => (1 + u ^ 2 * L.weierstrassPExcept 0 u - u ^ 2 * ℘[L] z) * sigmaProd L u ^ 2 /
    (sigma L (u - z) * sigma L (u + z))
  have hc : ContinuousAt g 0 := by
    refine ContinuousAt.div ?_ ?_ ?_
    · exact ((continuousAt_const.add ((continuousAt_id.pow 2).mul
        (continuousAt_weierstrassPExcept_zero L))).sub ((continuousAt_id.pow 2).mul
        continuousAt_const)).mul ((continuous_sigmaProd L).continuousAt.pow 2)
    · exact ((continuous_sigma L).continuousAt.comp (continuousAt_id.sub continuousAt_const)).mul
        ((continuous_sigma L).continuousAt.comp (continuousAt_id.add continuousAt_const))
    · simp only [zero_sub, zero_add]
      exact mul_ne_zero (sigma_ne_zero L hz') (sigma_ne_zero L hz)
  refine (LocBdd.of_continuousAt hc).congr ?_
  filter_upwards [self_mem_nhdsWithin] with u hu
  have hu' : u ≠ 0 := hu
  simp only [g, degF, sigma_eq_mul_sigmaProd L u, weierstrassP_eq_except_zero L u]
  congr 1
  field_simp
  ring
 
lemma locBdd_degF_self {z : ℂ} (hz : z ∉ L.lattice) (h2 : 2 * z ∉ L.lattice) :
    LocBdd (degF L z) z := by
  set g : ℂ → ℂ := fun u => dslope ℘[L] z u * sigma L u ^ 2 /
    (sigmaProd L (u - z) * sigma L (u + z))
  have hc : ContinuousAt g z := by
    refine ContinuousAt.div ?_ ?_ ?_
    · exact (continuousAt_dslope_same.mpr (differentiableAt_weierstrassP L hz)).mul
        ((continuous_sigma L).continuousAt.pow 2)
    · exact ((continuous_sigmaProd L).continuousAt.comp (continuousAt_id.sub continuousAt_const)).mul
        ((continuous_sigma L).continuousAt.comp (continuousAt_id.add continuousAt_const))
    · simp only [sub_self, sigmaProd_zero, one_mul]
      exact sigma_ne_zero L (by rwa [← two_mul])
  refine (LocBdd.of_continuousAt hc).congr ?_
  filter_upwards [self_mem_nhdsWithin] with u hu
  have hu' : u - z ≠ 0 := sub_ne_zero.mpr hu
  simp only [g, degF, dslope_eq_div hu, sigma_eq_mul_sigmaProd L (u - z)]
  field_simp
 
lemma locBdd_mul_degF_self_of_two_mul_mem {z : ℂ} (hz : z ∉ L.lattice) (h2 : 2 * z ∈ L.lattice) :
    LocBdd (fun u => (u - z) * degF L z u) z := by
  set s := sigmaSign L (2 * z)
  set e := eta L (2 * z)
  set g : ℂ → ℂ := fun u => dslope ℘[L] z u * sigma L u ^ 2 /
    (sigmaProd L (u - z) ^ 2 * (s * exp (e * u)))
  have hc : ContinuousAt g z := by
    refine ContinuousAt.div ?_ ?_ ?_
    · exact (continuousAt_dslope_same.mpr (differentiableAt_weierstrassP L hz)).mul
        ((continuous_sigma L).continuousAt.pow 2)
    · exact (((continuous_sigmaProd L).continuousAt.comp
        (continuousAt_id.sub continuousAt_const)).pow 2).mul (by fun_prop)
    · simp only [sub_self, sigmaProd_zero, one_pow, one_mul]
      exact sigmaSign_mul_exp_ne_zero L _ _
  refine (LocBdd.of_continuousAt hc).congr ?_
  filter_upwards [self_mem_nhdsWithin] with u hu
  have hu' : u - z ≠ 0 := sub_ne_zero.mpr hu
  have hσ : sigma L (u + z) = s * exp (e * u) * sigma L (u - z) := by
    have := sigma_add L h2 (u - z)
    rw [show u - z + 2 * z = u + z by ring, show u - z + 2 * z / 2 = u by ring] at this
    exact this
  have hne := sigmaSign_mul_exp_ne_zero L (2 * z) (e * u)
  simp only [g, degF, dslope_eq_div hu, hσ, sigma_eq_mul_sigmaProd L (u - z)]
  field_simp

theorem sigma_identity {z : ℂ} (hz : z ∉ L.lattice) :
    ∃ C : ℂ, C ≠ 0 ∧ ∀ u ∉ L.lattice,
      (℘[L] u - ℘[L] z) * sigma L u ^ 2 = C * (sigma L (u - z) * sigma L (u + z)) := by
  have hb : ∀ s ∈ degS L z, s - z ∉ L.lattice → LocBdd (degF L z) s := by
    intro s hs hsz
    rcases hs with h | h | h
    · have := (locBdd_degF_zero L hz).of_periodic (ω := s) (fun u => degF_add L z h u)
      rwa [zero_add] at this
    · exact absurd h hsz
    · have h2 : 2 * z ∉ L.lattice := by
        intro h2
        apply hsz
        have := sub_mem h h2
        rwa [show s + z - 2 * z = s - z by ring] at this
      have h1 := ((locBdd_degF_self L hz h2).of_even (degF_neg L z)).of_periodic (ω := s + z)
        (fun u => degF_add L z h u)
      rwa [show -z + (s + z) = s by ring] at h1
  have ha : LocBdd (fun u => (u - z) * degF L z u) z := by
    by_cases h2 : 2 * z ∈ L.lattice
    · exact locBdd_mul_degF_self_of_two_mul_mem L hz h2
    · exact (LocBdd.of_continuousAt (f := fun u => u - z) (by fun_prop)).mul
        (locBdd_degF_self L hz h2)
  obtain ⟨C, hC⟩ := eq_const_of_simple_pole L z (discr_degS L z)
    (fun u hu ω hω => degS_add L hu hω) (fun u _ ω hω => degF_add L z hω u)
    (fun x hx => differentiableAt_degF L hx) hb ha
  have key : ∀ u ∉ L.lattice,
      (℘[L] u - ℘[L] z) * sigma L u ^ 2 = C * (sigma L (u - z) * sigma L (u + z)) := by
    intro u hu
    by_cases hS : u ∈ degS L z
    · rcases hS with h | h | h
      · exact absurd h hu
      · have hP : ℘[L] u = ℘[L] z := by
          have := weierstrassP_add_mem L z h
          rwa [show z + (u - z) = u by ring] at this
        rw [hP, (sigma_eq_zero_iff L).mpr h]
        ring
      · have hP : ℘[L] u = ℘[L] z := by
          have := weierstrassP_add_mem L (-z) h
          rwa [show -z + (u + z) = u by ring, weierstrassP_neg] at this
        rw [hP, (sigma_eq_zero_iff L).mpr h]
        ring
    · have h1 : u - z ∉ L.lattice := fun h => hS (Or.inr (Or.inl h))
      have h2 : u + z ∉ L.lattice := fun h => hS (Or.inr (Or.inr h))
      have := hC u hS
      unfold degF at this
      rw [div_eq_iff (mul_ne_zero (sigma_ne_zero L h1) (sigma_ne_zero L h2))] at this
      exact this
  refine ⟨C, fun hC0 => ?_, key⟩
  obtain ⟨u, hu, hM⟩ := exists_norm_weierstrassP_gt L ‖℘[L] z‖
  have := key u hu
  rw [hC0, zero_mul, mul_eq_zero] at this
  rcases this with h | h
  · rw [sub_eq_zero.mp h] at hM
    exact lt_irrefl _ hM
  · exact sigma_ne_zero L hu (pow_eq_zero_iff (by norm_num) |>.mp h)
 
theorem weierstrassP_eq_iff {z w : ℂ} (hz : z ∉ L.lattice) (hw : w ∉ L.lattice) :
    ℘[L] w = ℘[L] z ↔ w - z ∈ L.lattice ∨ w + z ∈ L.lattice := by
  constructor
  · intro h
    obtain ⟨C, hC, key⟩ := sigma_identity L hz
    have := key w hw
    rw [h, sub_self, zero_mul, eq_comm, mul_eq_zero, mul_eq_zero] at this
    rcases this with h0 | h0 | h0
    · exact absurd h0 hC
    · exact Or.inl ((sigma_eq_zero_iff L).mp h0)
    · exact Or.inr ((sigma_eq_zero_iff L).mp h0)
  · rintro (h | h)
    · have := weierstrassP_add_mem L z h
      rwa [show z + (w - z) = w by ring] at this
    · have := weierstrassP_add_mem L (-z) h
      rwa [show -z + (w + z) = w by ring, weierstrassP_neg] at this
 
theorem derivWeierstrassP_eq_zero_iff {z : ℂ} (hz : z ∉ L.lattice) :
    ℘'[L] z = 0 ↔ 2 * z ∈ L.lattice := by
  constructor
  · intro h
    obtain ⟨C, hC, key⟩ := sigma_identity L hz
    have hs := differentiable_sigma L
    have hL : HasDerivAt (fun u => (℘[L] u - ℘[L] z) * sigma L u ^ 2)
        (℘'[L] z * sigma L z ^ 2 + (℘[L] z - ℘[L] z) * (2 * sigma L z ^ 1 * deriv (sigma L) z))
        z := by
      have := ((hasDerivAt_weierstrassP L hz).sub_const (℘[L] z)).mul ((hs z).hasDerivAt.pow 2)
      simpa only [Pi.pow_apply, Pi.mul_apply, sub_self, zero_mul, add_zero] using! this
    have hR : HasDerivAt (fun u => C * (sigma L (u - z) * sigma L (u + z)))
        (C * (deriv (sigma L) (z - z) * 1 * sigma L (z + z) +
          sigma L (z - z) * (deriv (sigma L) (z + z) * 1))) z := by
      have h1 : HasDerivAt (fun u => sigma L (u - z)) (deriv (sigma L) (z - z) * 1) z :=
        (hs (z - z)).hasDerivAt.comp (h := fun u => u - z) z ((hasDerivAt_id' z).sub_const z)
      have h2 : HasDerivAt (fun u => sigma L (u + z)) (deriv (sigma L) (z + z) * 1) z :=
        (hs (z + z)).hasDerivAt.comp (h := fun u => u + z) z ((hasDerivAt_id' z).add_const z)
      exact (h1.mul h2).const_mul C
    have heq : (fun u => (℘[L] u - ℘[L] z) * sigma L u ^ 2) =ᶠ[𝓝 z]
        fun u => C * (sigma L (u - z) * sigma L (u + z)) := by
      filter_upwards [(isOpen_compl_lattice L).mem_nhds hz] with u hu
      exact key u hu
    have := hL.unique (hR.congr_of_eventuallyEq heq)
    rw [h, sub_self, sub_self, deriv_sigma_zero, sigma_zero] at this
    simp only [zero_mul, add_zero, mul_one, one_mul] at this
    have h0 : sigma L (z + z) = 0 := by
      rcases mul_eq_zero.mp this.symm with h' | h'
      · exact absurd h' hC
      · exact h'
    rw [← two_mul] at h0
    exact (sigma_eq_zero_iff L).mp h0
  · intro h
    have := derivWeierstrassP_half L h
    rwa [mul_div_cancel_left₀ _ two_ne_zero] at this
end LSG.Weierstrass
end
end

/- LSG.Weierstrass.Addition -/
section
open Module Filter Complex Set
open scoped Topology
noncomputable section
namespace LSG.Weierstrass
open PeriodPair
variable (L : PeriodPair)
 
lemma vieta_three {a b c x₁ x₂ x₃ : ℂ} (h₁ : 4 * x₁ ^ 3 + a * x₁ ^ 2 + b * x₁ + c = 0)
    (h₂ : 4 * x₂ ^ 3 + a * x₂ ^ 2 + b * x₂ + c = 0) (h₃ : 4 * x₃ ^ 3 + a * x₃ ^ 2 + b * x₃ + c = 0)
    (h12 : x₁ ≠ x₂) (h13 : x₁ ≠ x₃) (h23 : x₂ ≠ x₃) : x₁ + x₂ + x₃ = -a / 4 := by
  have q12 : 4 * (x₁ ^ 2 + x₁ * x₂ + x₂ ^ 2) + a * (x₁ + x₂) + b = 0 := by
    apply mul_left_cancel₀ (sub_ne_zero.mpr h12)
    linear_combination h₁ - h₂
  have q13 : 4 * (x₁ ^ 2 + x₁ * x₃ + x₃ ^ 2) + a * (x₁ + x₃) + b = 0 := by
    apply mul_left_cancel₀ (sub_ne_zero.mpr h13)
    linear_combination h₁ - h₃
  have : 4 * (x₁ + x₂ + x₃) + a = 0 := by
    apply mul_left_cancel₀ (sub_ne_zero.mpr h23)
    linear_combination q12 - q13
  linear_combination this / 4
section Generic
variable {z w : ℂ} (hz : z ∉ L.lattice) (hw : w ∉ L.lattice) (hzw : z + w ∉ L.lattice)
  (hd : z - w ∉ L.lattice) (h1 : 2 * z + w ∉ L.lattice) (h2 : z + 2 * w ∉ L.lattice)
 
def chordSlope (z w : ℂ) : ℂ := (℘'[L] z - ℘'[L] w) / (℘[L] z - ℘[L] w)
 
def chordFun (z w t : ℂ) : ℂ :=
  ℘'[L] t - chordSlope L z w * ℘[L] t - (℘'[L] z - chordSlope L z w * ℘[L] z)
 
def addF (z w t : ℂ) : ℂ :=
  chordFun L z w t * sigma L t ^ 3 /
    (sigma L (t - z) * sigma L (t - w) * sigma L (t + (z + w)))
 
def addS (z w : ℂ) : Set ℂ :=
  {t | t ∈ L.lattice ∨ t - z ∈ L.lattice ∨ t - w ∈ L.lattice ∨ t + (z + w) ∈ L.lattice}
lemma discr_addS (z w : ℂ) : Discr (addS L z w) := by
  have h := (((discr_add L 0).union (discr_sub L z)).union (discr_sub L w)).union
    (discr_add L (z + w))
  convert h using 1
  ext u
  simp [addS, or_assoc]
lemma addS_add {t ω : ℂ} (ht : t ∈ addS L z w) (hω : ω ∈ L.lattice) : t + ω ∈ addS L z w := by
  rcases ht with h | h | h | h
  · exact Or.inl (add_mem h hω)
  · right; left; rw [show t + ω - z = (t - z) + ω by ring]; exact add_mem h hω
  · right; right; left; rw [show t + ω - w = (t - w) + ω by ring]; exact add_mem h hω
  · right; right; right; rw [show t + ω + (z + w) = (t + (z + w)) + ω by ring]; exact add_mem h hω
lemma chordFun_add (z w t : ℂ) {ω : ℂ} (hω : ω ∈ L.lattice) :
    chordFun L z w (t + ω) = chordFun L z w t := by
  unfold chordFun
  rw [weierstrassP_add_mem L t hω, derivWeierstrassP_add_mem L t hω]
lemma addF_add (z w t : ℂ) {ω : ℂ} (hω : ω ∈ L.lattice) : addF L z w (t + ω) = addF L z w t := by
  unfold addF
  rw [chordFun_add L z w t hω, sigma_add' L hω t, show t + ω - z = (t - z) + ω by ring,
    sigma_add' L hω (t - z), show t + ω - w = (t - w) + ω by ring, sigma_add' L hω (t - w),
    show t + ω + (z + w) = (t + (z + w)) + ω by ring, sigma_add' L hω (t + (z + w))]
  set s := sigmaSign L ω
  set e := eta L ω
  have hE : exp (e * (t - z + ω / 2)) * exp (e * (t - w + ω / 2)) *
      exp (e * (t + (z + w) + ω / 2)) =
      exp (e * (t + ω / 2)) * exp (e * (t + ω / 2)) * exp (e * (t + ω / 2)) := by
    simp only [← exp_add]
    congr 1
    ring
  have hK : s * s * s * (exp (e * (t + ω / 2)) * exp (e * (t + ω / 2)) *
      exp (e * (t + ω / 2))) ≠ 0 :=
    mul_ne_zero (mul_ne_zero (mul_ne_zero (sigmaSign_ne_zero L ω) (sigmaSign_ne_zero L ω))
      (sigmaSign_ne_zero L ω)) (mul_ne_zero (mul_ne_zero (exp_ne_zero _) (exp_ne_zero _))
      (exp_ne_zero _))
  rw [show s * exp (e * (t - z + ω / 2)) * sigma L (t - z) *
      (s * exp (e * (t - w + ω / 2)) * sigma L (t - w)) *
      (s * exp (e * (t + (z + w) + ω / 2)) * sigma L (t + (z + w))) =
      sigma L (t - z) * sigma L (t - w) * sigma L (t + (z + w)) *
        (s * s * s * (exp (e * (t - z + ω / 2)) * exp (e * (t - w + ω / 2)) *
          exp (e * (t + (z + w) + ω / 2)))) by ring, hE,
    show chordFun L z w t * (s * exp (e * (t + ω / 2)) * sigma L t) ^ 3 =
      chordFun L z w t * sigma L t ^ 3 * (s * s * s * (exp (e * (t + ω / 2)) *
        exp (e * (t + ω / 2)) * exp (e * (t + ω / 2)))) by ring,
    mul_div_mul_right _ _ hK]
lemma differentiableAt_chordFun {t : ℂ} (ht : t ∉ L.lattice) :
    DifferentiableAt ℂ (chordFun L z w) t := by
  unfold chordFun
  exact ((differentiableAt_derivWeierstrassP L ht).sub
    ((differentiableAt_weierstrassP L ht).const_mul _)).sub_const _
lemma differentiableAt_addF {x : ℂ} (hx : x ∉ addS L z w) : DifferentiableAt ℂ (addF L z w) x := by
  have h0 : x ∉ L.lattice := fun h => hx (Or.inl h)
  have h1 : x - z ∉ L.lattice := fun h => hx (Or.inr (Or.inl h))
  have h2 : x - w ∉ L.lattice := fun h => hx (Or.inr (Or.inr (Or.inl h)))
  have h3 : x + (z + w) ∉ L.lattice := fun h => hx (Or.inr (Or.inr (Or.inr h)))
  have hs := differentiable_sigma L
  unfold addF
  refine DifferentiableAt.div ?_ ?_
    (mul_ne_zero (mul_ne_zero (sigma_ne_zero L h1) (sigma_ne_zero L h2)) (sigma_ne_zero L h3))
  · exact (differentiableAt_chordFun L h0).mul ((hs x).pow 3)
  · exact (((hs _).comp x (differentiableAt_id.sub_const z)).mul
      ((hs _).comp x (differentiableAt_id.sub_const w))).mul
      ((hs _).comp x (differentiableAt_id.add_const (z + w)))
include hz hw hzw hd in
lemma pdiff_ne : ℘[L] z - ℘[L] w ≠ 0 := by
  intro h
  rw [sub_eq_zero, eq_comm] at h
  rcases (weierstrassP_eq_iff L hz hw).mp h with h' | h'
  · exact hd (by simpa using neg_mem h')
  · exact hzw (by rwa [add_comm] at h')
lemma chordFun_self : chordFun L z w z = 0 := by unfold chordFun; ring
include hz hw hzw hd in
lemma chordFun_right : chordFun L z w w = 0 := by
  have := pdiff_ne L hz hw hzw hd
  unfold chordFun chordSlope
  field_simp
  ring
include hz hw hzw in
lemma locBdd_addF_zero : LocBdd (addF L z w) 0 := by
  set m := chordSlope L z w
  set ν := ℘'[L] z - m * ℘[L] z
  have hz' : -z ∉ L.lattice := fun h => hz (by simpa using neg_mem h)
  have hw' : -w ∉ L.lattice := fun h => hw (by simpa using neg_mem h)
  set g : ℂ → ℂ := fun t => (t ^ 3 * L.derivWeierstrassPExcept 0 t - 2 -
      m * (t ^ 3 * L.weierstrassPExcept 0 t + t) - ν * t ^ 3) * sigmaProd L t ^ 3 /
    (sigma L (t - z) * sigma L (t - w) * sigma L (t + (z + w)))
  have hc : ContinuousAt g 0 := by
    refine ContinuousAt.div ?_ ?_ ?_
    · refine ContinuousAt.mul ?_ ((continuous_sigmaProd L).continuousAt.pow 3)
      exact ((((continuousAt_id.pow 3).mul (continuousAt_derivWeierstrassPExcept_zero L)).sub
        continuousAt_const).sub (continuousAt_const.mul (((continuousAt_id.pow 3).mul
        (continuousAt_weierstrassPExcept_zero L)).add continuousAt_id))).sub
        (continuousAt_const.mul (continuousAt_id.pow 3))
    · exact (((continuous_sigma L).continuousAt.comp (continuousAt_id.sub continuousAt_const)).mul
        ((continuous_sigma L).continuousAt.comp (continuousAt_id.sub continuousAt_const))).mul
        ((continuous_sigma L).continuousAt.comp (continuousAt_id.add continuousAt_const))
    · simp only [zero_sub, zero_add]
      exact mul_ne_zero (mul_ne_zero (sigma_ne_zero L hz') (sigma_ne_zero L hw'))
        (sigma_ne_zero L hzw)
  refine (LocBdd.of_continuousAt hc).congr ?_
  filter_upwards [self_mem_nhdsWithin] with t ht
  have ht' : t ≠ 0 := ht
  simp only [g, addF, chordFun, sigma_eq_mul_sigmaProd L t, weierstrassP_eq_except_zero L t,
    derivWeierstrassP_eq_except_zero L t]
  congr 1
  field_simp
  ring
include hz hd h1 in
lemma locBdd_addF_left : LocBdd (addF L z w) z := by
  set g : ℂ → ℂ := fun t => dslope (chordFun L z w) z t * sigma L t ^ 3 /
    (sigmaProd L (t - z) * sigma L (t - w) * sigma L (t + (z + w)))
  have hc : ContinuousAt g z := by
    refine ContinuousAt.div ?_ ?_ ?_
    · exact (continuousAt_dslope_same.mpr (differentiableAt_chordFun L hz)).mul
        ((continuous_sigma L).continuousAt.pow 3)
    · exact (((continuous_sigmaProd L).continuousAt.comp
        (continuousAt_id.sub continuousAt_const)).mul
        ((continuous_sigma L).continuousAt.comp (continuousAt_id.sub continuousAt_const))).mul
        ((continuous_sigma L).continuousAt.comp (continuousAt_id.add continuousAt_const))
    · simp only [sub_self, sigmaProd_zero, one_mul]
      refine mul_ne_zero (sigma_ne_zero L hd) (sigma_ne_zero L ?_)
      rwa [show z + (z + w) = 2 * z + w by ring]
  refine (LocBdd.of_continuousAt hc).congr ?_
  filter_upwards [self_mem_nhdsWithin] with t ht
  have ht' : t - z ≠ 0 := sub_ne_zero.mpr ht
  simp only [g, addF, dslope_eq_div ht, chordFun_self, sub_zero, sigma_eq_mul_sigmaProd L (t - z)]
  field_simp
include hz hw hzw hd h2 in
lemma locBdd_addF_right : LocBdd (addF L z w) w := by
  set g : ℂ → ℂ := fun t => dslope (chordFun L z w) w t * sigma L t ^ 3 /
    (sigma L (t - z) * sigmaProd L (t - w) * sigma L (t + (z + w)))
  have hd' : w - z ∉ L.lattice := fun h => hd (by simpa using neg_mem h)
  have hc : ContinuousAt g w := by
    refine ContinuousAt.div ?_ ?_ ?_
    · exact (continuousAt_dslope_same.mpr (differentiableAt_chordFun L hw)).mul
        ((continuous_sigma L).continuousAt.pow 3)
    · exact (((continuous_sigma L).continuousAt.comp
        (continuousAt_id.sub continuousAt_const)).mul
        ((continuous_sigmaProd L).continuousAt.comp (continuousAt_id.sub continuousAt_const))).mul
        ((continuous_sigma L).continuousAt.comp (continuousAt_id.add continuousAt_const))
    · simp only [sub_self, sigmaProd_zero, mul_one]
      refine mul_ne_zero (sigma_ne_zero L hd') (sigma_ne_zero L ?_)
      rwa [show w + (z + w) = z + 2 * w by ring]
  refine (LocBdd.of_continuousAt hc).congr ?_
  filter_upwards [self_mem_nhdsWithin] with t ht
  have ht' : t - w ≠ 0 := sub_ne_zero.mpr ht
  simp only [g, addF, dslope_eq_div ht, chordFun_right L hz hw hzw hd, sub_zero,
    sigma_eq_mul_sigmaProd L (t - w)]
  field_simp
include hzw h1 h2 in
lemma locBdd_mul_addF_pole : LocBdd (fun t => (t - -(z + w)) * addF L z w t) (-(z + w)) := by
  have ha : -(z + w) ∉ L.lattice := fun h => hzw (by simpa using neg_mem h)
  set g : ℂ → ℂ := fun t => chordFun L z w t * sigma L t ^ 3 /
    (sigma L (t - z) * sigma L (t - w) * sigmaProd L (t + (z + w)))
  have hc : ContinuousAt g (-(z + w)) := by
    refine ContinuousAt.div ?_ ?_ ?_
    · exact (differentiableAt_chordFun L ha).continuousAt.mul
        ((continuous_sigma L).continuousAt.pow 3)
    · exact (((continuous_sigma L).continuousAt.comp
        (continuousAt_id.sub continuousAt_const)).mul
        ((continuous_sigma L).continuousAt.comp (continuousAt_id.sub continuousAt_const))).mul
        ((continuous_sigmaProd L).continuousAt.comp (continuousAt_id.add continuousAt_const))
    · simp only [neg_add_cancel, sigmaProd_zero, mul_one]
      refine mul_ne_zero (sigma_ne_zero L ?_) (sigma_ne_zero L ?_)
      · intro h; apply h1; have := neg_mem h; rwa [show -(-(z + w) - z) = 2 * z + w by ring] at this
      · intro h; apply h2; have := neg_mem h; rwa [show -(-(z + w) - w) = z + 2 * w by ring] at this
  refine (LocBdd.of_continuousAt hc).congr ?_
  filter_upwards [self_mem_nhdsWithin] with t ht
  have ht' : t + (z + w) ≠ 0 := by
    intro h; apply ht; simp only [mem_singleton_iff]; linear_combination h
  simp only [g, addF, sub_neg_eq_add, sigma_eq_mul_sigmaProd L (t + (z + w))]
  field_simp
include hz hw hzw hd h1 h2 in
 
lemma chordFun_neg_add : chordFun L z w (-(z + w)) = 0 := by
  have hb : ∀ s ∈ addS L z w, s - -(z + w) ∉ L.lattice → LocBdd (addF L z w) s := by
    intro s hs hsa
    rcases hs with h | h | h | h
    · have := (locBdd_addF_zero L hz hw hzw).of_periodic (ω := s) (fun t => addF_add L z w t h)
      rwa [zero_add] at this
    · have := (locBdd_addF_left L hz hd h1).of_periodic (ω := s - z)
        (fun t => addF_add L z w t h)
      rwa [show z + (s - z) = s by ring] at this
    · have := (locBdd_addF_right L hz hw hzw hd h2).of_periodic (ω := s - w)
        (fun t => addF_add L z w t h)
      rwa [show w + (s - w) = s by ring] at this
    · exact absurd (by rwa [sub_neg_eq_add]) hsa
  obtain ⟨C, hC⟩ := eq_const_of_simple_pole L (-(z + w)) (discr_addS L z w)
    (fun u hu ω hω => addS_add L hu hω) (fun u _ ω hω => addF_add L z w u hω)
    (fun x hx => differentiableAt_addF L hx) hb (locBdd_mul_addF_pole L hzw h1 h2)
  have ha : -(z + w) ∉ L.lattice := fun h => hzw (by simpa using neg_mem h)
  have hs := continuous_sigma L
  have key := eq_of_eventuallyEq_nhdsNE
    (F₁ := fun t => C * (sigma L (t - z) * sigma L (t - w) * sigma L (t + (z + w))))
    (F₂ := fun t => chordFun L z w t * sigma L t ^ 3) (u := -(z + w)) (by fun_prop)
    ((differentiableAt_chordFun L ha).continuousAt.mul (hs.continuousAt.pow 3)) (by
      filter_upwards [discr_addS L z w (-(z + w))] with t ht
      have h1 : t - z ∉ L.lattice := fun h => ht (Or.inr (Or.inl h))
      have h2 : t - w ∉ L.lattice := fun h => ht (Or.inr (Or.inr (Or.inl h)))
      have h3 : t + (z + w) ∉ L.lattice := fun h => ht (Or.inr (Or.inr (Or.inr h)))
      have := hC t ht
      unfold addF at this
      rw [div_eq_iff (mul_ne_zero (mul_ne_zero (sigma_ne_zero L h1) (sigma_ne_zero L h2))
        (sigma_ne_zero L h3))] at this
      exact this.symm)
  simp only [neg_add_cancel, sigma_zero, mul_zero] at key
  rcases mul_eq_zero.mp key.symm with h | h
  · exact h
  · exact absurd (pow_eq_zero_iff (by norm_num) |>.mp h) (sigma_ne_zero L ha)
include hz hw hzw hd h1 h2 in
 
lemma addition_generic :
    ℘[L] (z + w) = -℘[L] z - ℘[L] w + chordSlope L z w ^ 2 / 4 ∧
      ℘'[L] (z + w) = -chordSlope L z w * (℘[L] (z + w) - ℘[L] z) - ℘'[L] z := by
  have hφ := chordFun_neg_add L hz hw hzw hd h1 h2
  have hne := pdiff_ne L hz hw hzw hd
  set m := chordSlope L z w with hm
  set ν := ℘'[L] z - m * ℘[L] z with hν
  unfold chordFun at hφ
  rw [L.derivWeierstrassP_neg, L.weierstrassP_neg] at hφ
  rw [← hm] at hφ
  set x₁ := ℘[L] z
  set x₂ := ℘[L] w
  set x₃ := ℘[L] (z + w)
  have hy₃ : ℘'[L] (z + w) = -(m * x₃ + ν) := by linear_combination -hφ
  have hy₂ : ℘'[L] w = m * x₂ + ν := by
    have : m * (x₁ - x₂) = ℘'[L] z - ℘'[L] w := by
      rw [hm]
      show (℘'[L] z - ℘'[L] w) / (℘[L] z - ℘[L] w) * (℘[L] z - ℘[L] w) = _
      exact div_mul_cancel₀ _ hne
    linear_combination this
  have c₁ := L.derivWeierstrassP_sq z hz
  have c₂ := L.derivWeierstrassP_sq w hw
  have c₃ := L.derivWeierstrassP_sq (z + w) hzw
  have e₁ : 4 * x₁ ^ 3 + (-m ^ 2) * x₁ ^ 2 + (-(L.g₂ + 2 * m * ν)) * x₁ + (-(L.g₃ + ν ^ 2)) = 0 := by
    linear_combination -c₁
  have e₂ : 4 * x₂ ^ 3 + (-m ^ 2) * x₂ ^ 2 + (-(L.g₂ + 2 * m * ν)) * x₂ + (-(L.g₃ + ν ^ 2)) = 0 := by
    linear_combination -c₂ + (℘'[L] w + m * x₂ + ν) * hy₂
  have e₃ : 4 * x₃ ^ 3 + (-m ^ 2) * x₃ ^ 2 + (-(L.g₂ + 2 * m * ν)) * x₃ + (-(L.g₃ + ν ^ 2)) = 0 := by
    linear_combination -c₃ + (℘'[L] (z + w) - m * x₃ - ν) * hy₃
  have d₁₂ : x₁ ≠ x₂ := sub_ne_zero.mp hne
  have d₁₃ : x₁ ≠ x₃ := by
    intro h
    rcases (weierstrassP_eq_iff L hz hzw).mp h.symm with h' | h'
    · exact hw (by rwa [show z + w - z = w by ring] at h')
    · exact h1 (by rwa [show z + w + z = 2 * z + w by ring] at h')
  have d₂₃ : x₂ ≠ x₃ := by
    intro h
    rcases (weierstrassP_eq_iff L hw hzw).mp h.symm with h' | h'
    · exact hz (by rwa [show z + w - w = z by ring] at h')
    · exact h2 (by rwa [show z + w + w = z + 2 * w by ring] at h')
  have hsum := vieta_three e₁ e₂ e₃ d₁₂ d₁₃ d₂₃
  refine ⟨by linear_combination hsum, ?_⟩
  rw [hy₃, hν]
  ring
end Generic
 
lemma eventually_generic (z w₀ : ℂ) :
    ∀ᶠ w in 𝓝[≠] w₀, w ∉ L.lattice ∧ z + w ∉ L.lattice ∧ z - w ∉ L.lattice ∧
      2 * z + w ∉ L.lattice ∧ z + 2 * w ∉ L.lattice := by
  filter_upwards [discr_affine L one_ne_zero 0 w₀, discr_affine L one_ne_zero z w₀,
    discr_affine L (neg_ne_zero.mpr one_ne_zero) z w₀, discr_affine L one_ne_zero (2 * z) w₀,
    discr_affine L two_ne_zero z w₀] with w h₁ h₂ h₃ h₄ h₅
  simp only [one_mul, add_zero, neg_mul] at h₁ h₂ h₃ h₄ h₅
  refine ⟨h₁, by rwa [add_comm], by rwa [neg_add_eq_sub] at h₃, by rwa [add_comm],
    by rwa [add_comm]⟩
lemma continuousAt_chordSlope {z w : ℂ} (hw : w ∉ L.lattice) (hne : ℘[L] z - ℘[L] w ≠ 0) :
    ContinuousAt (fun v => chordSlope L z v) w := by
  unfold chordSlope
  exact (continuousAt_const.sub (continuousAt_derivWeierstrassP L hw)).div
    (continuousAt_const.sub (continuousAt_weierstrassP L hw)) hne
 
theorem weierstrassP_add {z w : ℂ} (hz : z ∉ L.lattice) (hw : w ∉ L.lattice)
    (hzw : z + w ∉ L.lattice) (hd : z - w ∉ L.lattice) :
    ℘[L] (z + w) = -℘[L] z - ℘[L] w + chordSlope L z w ^ 2 / 4 := by
  refine eq_of_eventuallyEq_nhdsNE (F₁ := fun v => ℘[L] (z + v))
    (F₂ := fun v => -℘[L] z - ℘[L] v + chordSlope L z v ^ 2 / 4)
    ((continuousAt_weierstrassP L hzw).comp (continuousAt_const.add continuousAt_id))
    ((continuousAt_const.sub (continuousAt_weierstrassP L hw)).add
      (((continuousAt_chordSlope L hw (pdiff_ne L hz hw hzw hd)).pow 2).div_const _)) ?_
  filter_upwards [eventually_generic L z w] with v ⟨h₁, h₂, h₃, h₄, h₅⟩
  exact (addition_generic L hz h₁ h₂ h₃ h₄ h₅).1
 
theorem derivWeierstrassP_add {z w : ℂ} (hz : z ∉ L.lattice) (hw : w ∉ L.lattice)
    (hzw : z + w ∉ L.lattice) (hd : z - w ∉ L.lattice) :
    ℘'[L] (z + w) = -chordSlope L z w * (℘[L] (z + w) - ℘[L] z) - ℘'[L] z := by
  refine eq_of_eventuallyEq_nhdsNE (F₁ := fun v => ℘'[L] (z + v))
    (F₂ := fun v => -chordSlope L z v * (℘[L] (z + v) - ℘[L] z) - ℘'[L] z)
    ((continuousAt_derivWeierstrassP L hzw).comp (continuousAt_const.add continuousAt_id))
    (((continuousAt_chordSlope L hw (pdiff_ne L hz hw hzw hd)).neg.mul
      (((continuousAt_weierstrassP L hzw).comp (continuousAt_const.add continuousAt_id)).sub
      continuousAt_const)).sub continuousAt_const) ?_
  filter_upwards [eventually_generic L z w] with v ⟨h₁, h₂, h₃, h₄, h₅⟩
  exact (addition_generic L hz h₁ h₂ h₃ h₄ h₅).2
 
def tangentSlope (z : ℂ) : ℂ := (6 * ℘[L] z ^ 2 - L.g₂ / 2) / ℘'[L] z
lemma notMem_of_two_mul_notMem {z : ℂ} (h2 : 2 * z ∉ L.lattice) : z ∉ L.lattice :=
  fun h => h2 (by simpa [two_mul] using add_mem h h)
lemma derivWeierstrassP_ne_zero {z : ℂ} (h2 : 2 * z ∉ L.lattice) : ℘'[L] z ≠ 0 := by
  rw [Ne, derivWeierstrassP_eq_zero_iff L (notMem_of_two_mul_notMem L h2)]
  exact h2
 
lemma chordSlope_eq_dslope {z v : ℂ} (hv : v ≠ z) (hne : ℘[L] z - ℘[L] v ≠ 0) :
    chordSlope L z v = dslope ℘'[L] z v / dslope ℘[L] z v := by
  rw [dslope_eq_div hv, dslope_eq_div hv]
  have hv' : v - z ≠ 0 := sub_ne_zero.mpr hv
  have hne' : ℘[L] v - ℘[L] z ≠ 0 := by
    intro h; apply hne; linear_combination -h
  unfold chordSlope
  field_simp
  ring
lemma continuousAt_slope_quot {z : ℂ} (h2 : 2 * z ∉ L.lattice) :
    ContinuousAt (fun v => dslope ℘'[L] z v / dslope ℘[L] z v) z := by
  have hz := notMem_of_two_mul_notMem L h2
  refine ContinuousAt.div (continuousAt_dslope_same.mpr (differentiableAt_derivWeierstrassP L hz))
    (continuousAt_dslope_same.mpr (differentiableAt_weierstrassP L hz)) ?_
  rw [dslope_same, L.deriv_weierstrassP]
  exact derivWeierstrassP_ne_zero L h2
lemma slope_quot_self {z : ℂ} (h2 : 2 * z ∉ L.lattice) :
    dslope ℘'[L] z z / dslope ℘[L] z z = tangentSlope L z := by
  have hz := notMem_of_two_mul_notMem L h2
  rw [dslope_same, dslope_same, L.deriv_weierstrassP, (hasDerivAt_derivWeierstrassP L hz).deriv]
  rfl
 
lemma eventually_near_self {z : ℂ} (h2 : 2 * z ∉ L.lattice) :
    ∀ᶠ v in 𝓝[≠] z, v ∉ L.lattice ∧ z + v ∉ L.lattice ∧ z - v ∉ L.lattice ∧ v ≠ z := by
  have hz := notMem_of_two_mul_notMem L h2
  have e1 : ∀ᶠ v in 𝓝 z, v ∉ L.lattice := (isOpen_compl_lattice L).mem_nhds hz
  have e2 : ∀ᶠ v in 𝓝 z, v ∉ {u | 1 * u + z ∈ L.lattice} :=
    (discr_affine L one_ne_zero z).eventually_nhds (by simpa [two_mul] using h2)
  filter_upwards [nhdsWithin_le_nhds e1, nhdsWithin_le_nhds e2,
    discr_affine L (neg_ne_zero.mpr one_ne_zero) z z, self_mem_nhdsWithin] with v h₁ h₂ h₃ h₄
  simp only [one_mul, neg_mul] at h₂ h₃
  exact ⟨h₁, by rwa [add_comm], by rwa [neg_add_eq_sub] at h₃, h₄⟩
 
theorem weierstrassP_two_mul {z : ℂ} (h2 : 2 * z ∉ L.lattice) :
    ℘[L] (2 * z) = -2 * ℘[L] z + tangentSlope L z ^ 2 / 4 := by
  have hz := notMem_of_two_mul_notMem L h2
  have h2' : z + z ∉ L.lattice := by rwa [← two_mul]
  have key := eq_of_eventuallyEq_nhdsNE (F₁ := fun v => ℘[L] (z + v))
    (F₂ := fun v => -℘[L] z - ℘[L] v + (dslope ℘'[L] z v / dslope ℘[L] z v) ^ 2 / 4) (u := z)
    ((continuousAt_weierstrassP L h2').comp (continuousAt_const.add continuousAt_id))
    ((continuousAt_const.sub (continuousAt_weierstrassP L hz)).add
      (((continuousAt_slope_quot L h2).pow 2).div_const _)) (by
      filter_upwards [eventually_near_self L h2] with v ⟨h₁, h₂, h₃, h₄⟩
      have hne := pdiff_ne L hz h₁ h₂ h₃
      rw [weierstrassP_add L hz h₁ h₂ h₃, chordSlope_eq_dslope L h₄ hne])
  simp only [slope_quot_self L h2] at key
  rw [two_mul, key]
  ring
 
theorem derivWeierstrassP_two_mul {z : ℂ} (h2 : 2 * z ∉ L.lattice) :
    ℘'[L] (2 * z) = -tangentSlope L z * (℘[L] (2 * z) - ℘[L] z) - ℘'[L] z := by
  have hz := notMem_of_two_mul_notMem L h2
  have h2' : z + z ∉ L.lattice := by rwa [← two_mul]
  have key := eq_of_eventuallyEq_nhdsNE (F₁ := fun v => ℘'[L] (z + v))
    (F₂ := fun v => -(dslope ℘'[L] z v / dslope ℘[L] z v) * (℘[L] (z + v) - ℘[L] z) - ℘'[L] z)
    (u := z)
    ((continuousAt_derivWeierstrassP L h2').comp (continuousAt_const.add continuousAt_id))
    ((((continuousAt_slope_quot L h2).neg.mul
      (((continuousAt_weierstrassP L h2').comp (continuousAt_const.add continuousAt_id)).sub
      continuousAt_const))).sub continuousAt_const) (by
      filter_upwards [eventually_near_self L h2] with v ⟨h₁, h₂, h₃, h₄⟩
      have hne := pdiff_ne L hz h₁ h₂ h₃
      rw [derivWeierstrassP_add L hz h₁ h₂ h₃, chordSlope_eq_dslope L h₄ hne])
  simp only [slope_quot_self L h2] at key
  rw [two_mul, key]
end LSG.Weierstrass
end
end

/- LSG.LemniscateIndep.Symm -/
section
noncomputable section
open Complex PeriodPair
namespace LSG.LemniscateIndep
variable {L : PeriodPair} {a : ℝ}
lemma mem_lattice_sq (h₁ : L.ω₁ = a) (h₂ : L.ω₂ = I * a) {z : ℂ} :
    z ∈ L.lattice ↔ ∃ m n : ℤ, (m : ℂ) * a + n * (I * a) = z := by
  rw [PeriodPair.mem_lattice, h₁, h₂]
lemma I_mul_mem (h₁ : L.ω₁ = a) (h₂ : L.ω₂ = I * a) {z : ℂ} (hz : z ∈ L.lattice) :
    I * z ∈ L.lattice := by
  obtain ⟨m, n, rfl⟩ := (mem_lattice_sq h₁ h₂).1 hz
  refine (mem_lattice_sq h₁ h₂).2 ⟨-n, m, ?_⟩
  push_cast
  linear_combination (-(n : ℂ) * a) * I_sq
lemma conj_mem (h₁ : L.ω₁ = a) (h₂ : L.ω₂ = I * a) {z : ℂ} (hz : z ∈ L.lattice) :
    (starRingEnd ℂ) z ∈ L.lattice := by
  obtain ⟨m, n, rfl⟩ := (mem_lattice_sq h₁ h₂).1 hz
  refine (mem_lattice_sq h₁ h₂).2 ⟨m, -n, ?_⟩
  simp only [map_add, map_mul, map_intCast, conj_ofReal, conj_I]
  push_cast
  ring
 
def mulIEquiv (h₁ : L.ω₁ = a) (h₂ : L.ω₂ = I * a) : L.lattice ≃ L.lattice where
  toFun l := ⟨I * l, I_mul_mem h₁ h₂ l.2⟩
  invFun l := ⟨I * (I * (I * l)), I_mul_mem h₁ h₂ (I_mul_mem h₁ h₂ (I_mul_mem h₁ h₂ l.2))⟩
  left_inv l := by
    ext; simp only
    linear_combination (I ^ 2 - 1) * (l : ℂ) * I_sq
  right_inv l := by
    ext; simp only
    linear_combination (I ^ 2 - 1) * (l : ℂ) * I_sq
 
def conjEquiv (h₁ : L.ω₁ = a) (h₂ : L.ω₂ = I * a) : L.lattice ≃ L.lattice where
  toFun l := ⟨(starRingEnd ℂ) l, conj_mem h₁ h₂ l.2⟩
  invFun l := ⟨(starRingEnd ℂ) l, conj_mem h₁ h₂ l.2⟩
  left_inv l := by ext; simp
  right_inv l := by ext; simp
lemma tsum_mulI (h₁ : L.ω₁ = a) (h₂ : L.ω₂ = I * a) (f : ℂ → ℂ) :
    ∑' l : L.lattice, f (I * l) = ∑' l : L.lattice, f l :=
  (mulIEquiv h₁ h₂).tsum_eq (fun l => f l)
lemma tsum_conj (h₁ : L.ω₁ = a) (h₂ : L.ω₂ = I * a) (f : ℂ → ℂ) :
    ∑' l : L.lattice, f ((starRingEnd ℂ) l) = ∑' l : L.lattice, f l :=
  (conjEquiv h₁ h₂).tsum_eq (fun l => f l)
 
lemma G_six_eq_zero (h₁ : L.ω₁ = a) (h₂ : L.ω₂ = I * a) : L.G 6 = 0 := by
  have h := tsum_mulI h₁ h₂ (fun z => (z ^ 6)⁻¹)
  have hI6 : I ^ 6 = -1 := by
    rw [show (6 : ℕ) = 2 * 3 by rfl, pow_mul, I_sq]; norm_num
  simp only [mul_pow, hI6, neg_one_mul, inv_neg, tsum_neg] at h
  have : L.G 6 = -L.G 6 := by rw [PeriodPair.G]; exact h.symm
  linear_combination this / 2
theorem g₃_eq_zero_of_square (h₁ : L.ω₁ = a) (h₂ : L.ω₂ = I * a) : L.g₃ = 0 := by
  rw [PeriodPair.g₃, G_six_eq_zero h₁ h₂, mul_zero]
 
lemma weierstrassP_I_mul (h₁ : L.ω₁ = a) (h₂ : L.ω₂ = I * a) (z : ℂ) :
    ℘[L] (I * z) = -℘[L] z := by
  have h := tsum_mulI h₁ h₂ (fun w => 1 / (I * z - w) ^ 2 - 1 / w ^ 2)
  have hpt : ∀ w : ℂ, 1 / (I * z - I * w) ^ 2 - 1 / (I * w) ^ 2 =
      -(1 / (z - w) ^ 2 - 1 / w ^ 2) := by
    intro w
    rw [← mul_sub, mul_pow, mul_pow, I_sq]
    simp only [neg_one_mul, one_div, inv_neg]
    ring
  simp only [hpt, tsum_neg] at h
  change ℘[L] (I * z) = -(∑' l : L.lattice, (1 / (z - l) ^ 2 - 1 / (l : ℂ) ^ 2))
  rw [h]
  rfl
 
lemma weierstrassP_conj (h₁ : L.ω₁ = a) (h₂ : L.ω₂ = I * a) (z : ℂ) :
    ℘[L] ((starRingEnd ℂ) z) = (starRingEnd ℂ) (℘[L] z) := by
  have h := tsum_conj h₁ h₂ (fun w => 1 / ((starRingEnd ℂ) z - w) ^ 2 - 1 / w ^ 2)
  change _ = (starRingEnd ℂ) (∑' l : L.lattice, (1 / (z - l) ^ 2 - 1 / (l : ℂ) ^ 2))
  rw [Complex.conj_tsum]
  simp only [map_sub, map_div₀, map_one, map_pow] at h ⊢
  rw [h]
  rfl
 
lemma derivWeierstrassP_conj (h₁ : L.ω₁ = a) (h₂ : L.ω₂ = I * a) (z : ℂ) :
    ℘'[L] ((starRingEnd ℂ) z) = (starRingEnd ℂ) (℘'[L] z) := by
  have h := tsum_conj h₁ h₂ (fun w => 2 / ((starRingEnd ℂ) z - w) ^ 3)
  change _ = (starRingEnd ℂ) (-∑' l : L.lattice, 2 / (z - l) ^ 3)
  rw [map_neg, Complex.conj_tsum]
  simp only [map_sub, map_div₀, map_ofNat, map_pow] at h ⊢
  rw [h]
  rfl
 
lemma weierstrassP_ofReal (h₁ : L.ω₁ = a) (h₂ : L.ω₂ = I * a) (t : ℝ) :
    ℘[L] (t : ℂ) = ((℘[L] (t : ℂ)).re : ℂ) := by
  have h := weierstrassP_conj h₁ h₂ (t : ℂ)
  rw [conj_ofReal] at h
  exact (Complex.conj_eq_iff_re.1 h.symm).symm
 
lemma derivWeierstrassP_ofReal (h₁ : L.ω₁ = a) (h₂ : L.ω₂ = I * a) (t : ℝ) :
    ℘'[L] (t : ℂ) = ((℘'[L] (t : ℂ)).re : ℂ) := by
  have h := derivWeierstrassP_conj h₁ h₂ (t : ℂ)
  rw [conj_ofReal] at h
  exact (Complex.conj_eq_iff_re.1 h.symm).symm
 
lemma ofReal_notMem (ha : 0 < a) (h₁ : L.ω₁ = a) (h₂ : L.ω₂ = I * a) {t : ℝ} (ht0 : 0 < t)
    (hta : t < a) : (t : ℂ) ∉ L.lattice := by
  intro hm
  obtain ⟨m, n, h⟩ := (mem_lattice_sq h₁ h₂).1 hm
  have hre := congrArg Complex.re h
  have him := congrArg Complex.im h
  simp only [add_re, mul_re, intCast_re, ofReal_re, intCast_im, ofReal_im, mul_zero, sub_zero,
    I_re, zero_mul, I_im, sub_self, mul_im, one_mul, zero_add, add_zero, add_im, mul_eq_zero,
    Int.cast_eq_zero] at hre him
  rcases him with hn | hn
  · subst hn
    have h1 : (0 : ℝ) < m := by
      by_contra hc; rw [not_lt] at hc; nlinarith
    have h2 : (m : ℝ) < 1 := by
      by_contra hc; rw [not_lt] at hc; nlinarith
    have h1' : (0 : ℤ) < m := by exact_mod_cast h1
    have h2' : m < (1 : ℤ) := by exact_mod_cast h2
    omega
  · exact absurd hn ha.ne'
end LSG.LemniscateIndep
end
end

/- LSG.LemniscateIndep.RealLine -/
section
noncomputable section
open Complex PeriodPair Filter Topology Set LSG.Weierstrass
namespace LSG.LemniscateIndep
 
structure Sq (L : PeriodPair) (a : ℝ) : Prop where
  pos : 0 < a
  h₁ : L.ω₁ = a
  h₂ : L.ω₂ = I * a
 
def rP (L : PeriodPair) (t : ℝ) : ℝ := (℘[L] (t : ℂ)).re
 
def rQ (L : PeriodPair) (t : ℝ) : ℝ := (℘'[L] (t : ℂ)).re
 
def rPhi (L : PeriodPair) (t : ℝ) : ℝ := t ^ 2 * (L.weierstrassPExcept 0 (t : ℂ)).re + 1
 
def tau (L : PeriodPair) (a t : ℝ) : ℝ := Real.sqrt (rP L (a / 2)) * t / Real.sqrt (rPhi L t)
variable {L : PeriodPair} {a : ℝ}
namespace Sq
variable (S : Sq L a)
include S
lemma notMem {t : ℝ} (ht0 : 0 < t) (hta : t < a) : (t : ℂ) ∉ L.lattice :=
  ofReal_notMem S.pos S.h₁ S.h₂ ht0 hta
lemma P_ofReal (t : ℝ) : ℘[L] (t : ℂ) = (rP L t : ℂ) := weierstrassP_ofReal S.h₁ S.h₂ t
lemma Q_ofReal (t : ℝ) : ℘'[L] (t : ℂ) = (rQ L t : ℂ) := derivWeierstrassP_ofReal S.h₁ S.h₂ t
lemma hasDerivAt_rP {t : ℝ} (ht0 : 0 < t) (hta : t < a) : HasDerivAt (rP L) (rQ L t) t :=
  (hasDerivAt_weierstrassP L (S.notMem ht0 hta)).real_of_complex
lemma half_eq : L.ω₁ / 2 = ((a / 2 : ℝ) : ℂ) := by rw [S.h₁]; push_cast; ring
lemma rP_half_ne_zero : rP L (a / 2) ≠ 0 := by
  intro he
  have hP : ℘[L] (L.ω₁ / 2) = 0 := by rw [S.half_eq, S.P_ofReal, he, ofReal_zero]
  have hI : ℘[L] (L.ω₂ / 2) = 0 := by
    rw [show L.ω₂ / 2 = I * (L.ω₁ / 2) by rw [S.h₁, S.h₂]; ring, weierstrassP_I_mul S.h₁ S.h₂,
      hP, neg_zero]
  rcases (weierstrassP_eq_iff L L.ω₁_div_two_notMem_lattice L.ω₂_div_two_notMem_lattice).1
    (hI.trans hP.symm) with h | h
  · have := (L.mul_ω₁_add_mul_ω₂_mem_lattice (α := -1 / 2) (β := 1 / 2)).1
      (by convert h using 1; push_cast; ring)
    exact absurd this.1 (by norm_num)
  · have := (L.mul_ω₁_add_mul_ω₂_mem_lattice (α := 1 / 2) (β := 1 / 2)).1
      (by convert h using 1; push_cast; ring)
    exact absurd this.1 (by norm_num)
 
lemma g₂_eq : L.g₂ = 4 * (rP L (a / 2) : ℂ) ^ 2 := by
  have hc := weierstrassP_half_cubic L L.ω₁_mem_lattice L.ω₁_div_two_notMem_lattice
  rw [g₃_eq_zero_of_square S.h₁ S.h₂, S.half_eq, S.P_ofReal] at hc
  have h0 : (rP L (a / 2) : ℂ) ≠ 0 := ofReal_ne_zero.2 S.rP_half_ne_zero
  have : (rP L (a / 2) : ℂ) * (4 * (rP L (a / 2) : ℂ) ^ 2 - L.g₂) = 0 := by
    linear_combination hc
  exact (sub_eq_zero.1 ((mul_eq_zero.1 this).resolve_left h0)).symm
lemma relation {t : ℝ} (ht0 : 0 < t) (hta : t < a) :
    rQ L t ^ 2 = 4 * rP L t ^ 3 - 4 * rP L (a / 2) ^ 2 * rP L t := by
  have h := L.derivWeierstrassP_sq (t : ℂ) (S.notMem ht0 hta)
  rw [S.P_ofReal, S.Q_ofReal, S.g₂_eq, g₃_eq_zero_of_square S.h₁ S.h₂, sub_zero] at h
  exact_mod_cast h
lemma rQ_ne_zero {t : ℝ} (ht0 : 0 < t) (hta : t < a / 2) : rQ L t ≠ 0 := by
  have h := derivWeierstrassP_ne_zero L (z := (t : ℂ)) (by
    rw [show (2 : ℂ) * t = ((2 * t : ℝ) : ℂ) by push_cast; ring]
    exact S.notMem (by linarith) (by linarith))
  rw [S.Q_ofReal] at h
  exact_mod_cast h
end Sq
lemma rPhi_eq {t : ℝ} (ht : t ≠ 0) : rPhi L t = t ^ 2 * rP L t := by
  have h := congrArg Complex.re (weierstrassP_eq_except_zero L (t : ℂ))
  rw [show (1 : ℂ) / (t : ℂ) ^ 2 = ((1 / t ^ 2 : ℝ) : ℂ) by push_cast; ring, add_re,
    ofReal_re] at h
  rw [rPhi, rP, h]
  field_simp
lemma continuousAt_rPhi {t : ℝ} (h : (t : ℂ) ∉ (L.lattice : Set ℂ) \ {0}) :
    ContinuousAt (rPhi L) t := by
  have hw : ContinuousAt (fun s : ℝ => L.weierstrassPExcept 0 (s : ℂ)) t :=
    (L.analyticOnNhd_weierstrassPExcept 0 _ h).continuousAt.comp continuous_ofReal.continuousAt
  exact ((continuousAt_id.pow 2).mul (continuous_re.continuousAt.comp hw)).add continuousAt_const
namespace Sq
variable (S : Sq L a)
include S
lemma exists_large : ∃ t₀ ∈ Ioo 0 (a / 2), |rP L (a / 2)| < rP L t₀ := by
  have h0 : rPhi L 0 = 1 := by simp [rPhi]
  have hφ : Tendsto (rPhi L) (𝓝[>] 0) (𝓝 1) := by
    have := (continuousAt_rPhi (L := L) (t := 0) (by simp)).tendsto
    rw [h0] at this
    exact this.mono_left nhdsWithin_le_nhds
  have hinv : Tendsto (fun t : ℝ => (t⁻¹) ^ 2) (𝓝[>] 0) atTop :=
    (tendsto_pow_atTop two_ne_zero).comp tendsto_inv_nhdsGT_zero
  have hprod := hφ.pos_mul_atTop one_pos hinv
  have hev1 : ∀ᶠ t in 𝓝[>] (0 : ℝ), t ∈ Ioo 0 (a / 2) := Ioo_mem_nhdsGT (half_pos S.pos)
  obtain ⟨t, ht, hgt⟩ := (hev1.and (hprod.eventually_gt_atTop |rP L (a / 2)|)).exists
  refine ⟨t, ht, ?_⟩
  rw [rPhi_eq ht.1.ne'] at hgt
  have : t ^ 2 * rP L t * (t⁻¹) ^ 2 = rP L t := by
    have := ht.1.ne'; field_simp
  linarith
lemma abs_lt_rP {t : ℝ} (ht : t ∈ Ioo 0 (a / 2)) : |rP L (a / 2)| < rP L t := by
  obtain ⟨t₀, ht₀, hgt⟩ := S.exists_large
  by_contra hle
  rw [not_lt] at hle
  have hsub : uIcc t t₀ ⊆ Ioo 0 (a / 2) := ordConnected_Ioo.uIcc_subset ht ht₀
  have hcont : ContinuousOn (rP L) (uIcc t t₀) := fun x hx =>
    (S.hasDerivAt_rP (hsub hx).1 (by linarith [(hsub hx).2, S.pos])).continuousAt.continuousWithinAt
  obtain ⟨c, hc, hPc⟩ := intermediate_value_uIcc hcont (mem_uIcc.2 (Or.inl ⟨hle, hgt.le⟩))
  have hrel := S.relation (hsub hc).1 (by linarith [(hsub hc).2, S.pos])
  rw [hPc] at hrel
  have h3 : |rP L (a / 2)| ^ 3 = |rP L (a / 2)| ^ 2 * |rP L (a / 2)| := pow_succ _ 2
  have : rQ L c ^ 2 = 0 := by rw [hrel, h3, sq_abs]; ring
  exact S.rQ_ne_zero (hsub hc).1 (hsub hc).2 (pow_eq_zero_iff two_ne_zero |>.1 this)
lemma rP_half_pos : 0 < rP L (a / 2) := by
  have hcont : ContinuousAt (rP L) (a / 2) :=
    (S.hasDerivAt_rP (half_pos S.pos) (half_lt_self S.pos)).continuousAt
  have hle : |rP L (a / 2)| ≤ rP L (a / 2) := by
    refine ge_of_tendsto (hcont.tendsto.mono_left (nhdsWithin_le_nhds (s := Iio (a / 2)))) ?_
    filter_upwards [Ioo_mem_nhdsLT (half_pos S.pos)] with t ht using (S.abs_lt_rP ht).le
  exact lt_of_le_of_ne ((abs_nonneg _).trans hle) (Ne.symm S.rP_half_ne_zero)
lemma lt_rP {t : ℝ} (ht : t ∈ Ioo 0 (a / 2)) : rP L (a / 2) < rP L t :=
  (le_abs_self _).trans_lt (S.abs_lt_rP ht)
lemma le_rP {t : ℝ} (ht : t ∈ Ioc 0 (a / 2)) : rP L (a / 2) ≤ rP L t := by
  rcases eq_or_lt_of_le ht.2 with h | h
  · rw [h]
  · exact (S.lt_rP ⟨ht.1, h⟩).le
lemma rPhi_pos {t : ℝ} (ht : t ∈ Icc 0 (a / 2)) : 0 < rPhi L t := by
  rcases eq_or_lt_of_le ht.1 with h | h
  · subst h; simp [rPhi]
  · rw [rPhi_eq h.ne']
    exact mul_pos (pow_pos h 2) (S.rP_half_pos.trans_le (S.le_rP ⟨h, ht.2⟩))
lemma tau_eq {t : ℝ} (ht : t ∈ Ioc 0 (a / 2)) :
    tau L a t = Real.sqrt (rP L (a / 2)) / Real.sqrt (rP L t) := by
  have hP : 0 < rP L t := S.rP_half_pos.trans_le (S.le_rP ht)
  rw [tau, rPhi_eq ht.1.ne', Real.sqrt_mul (sq_nonneg t), Real.sqrt_sq ht.1.le]
  have := Real.sqrt_pos.2 hP
  have := ht.1.ne'
  field_simp
omit S in
lemma tau_zero : tau L a 0 = 0 := by simp [tau]
lemma tau_half : tau L a (a / 2) = 1 := by
  rw [S.tau_eq ⟨half_pos S.pos, le_rfl⟩]
  exact div_self (Real.sqrt_pos.2 S.rP_half_pos).ne'
lemma tau_mem_Icc {t : ℝ} (ht : t ∈ Icc 0 (a / 2)) : tau L a t ∈ Icc 0 1 := by
  rcases eq_or_lt_of_le ht.1 with h | h
  · subst h; rw [tau_zero]; exact ⟨le_rfl, zero_le_one⟩
  · rw [S.tau_eq ⟨h, ht.2⟩]
    have hP : 0 < rP L t := S.rP_half_pos.trans_le (S.le_rP ⟨h, ht.2⟩)
    refine ⟨by positivity, ?_⟩
    rw [div_le_one (Real.sqrt_pos.2 hP)]
    exact Real.sqrt_le_sqrt (S.le_rP ⟨h, ht.2⟩)
lemma tau_mem_Ioo {t : ℝ} (ht : t ∈ Ioo 0 (a / 2)) : tau L a t ∈ Ioo 0 1 := by
  rw [S.tau_eq ⟨ht.1, ht.2.le⟩]
  have hP : 0 < rP L t := S.rP_half_pos.trans (S.lt_rP ht)
  refine ⟨div_pos (Real.sqrt_pos.2 S.rP_half_pos) (Real.sqrt_pos.2 hP), ?_⟩
  rw [div_lt_one (Real.sqrt_pos.2 hP)]
  exact Real.sqrt_lt_sqrt S.rP_half_pos.le (S.lt_rP ht)
lemma continuousOn_tau : ContinuousOn (tau L a) (Icc 0 (a / 2)) := by
  have hφ : ContinuousOn (rPhi L) (Icc 0 (a / 2)) := by
    intro t ht
    refine (continuousAt_rPhi ?_).continuousWithinAt
    rintro ⟨hm, hne⟩
    rcases eq_or_lt_of_le ht.1 with h | h
    · subst h; exact hne (by simp)
    · exact S.notMem h (by linarith [ht.2, S.pos]) hm
  exact (continuousOn_const.mul continuousOn_id).div hφ.sqrt
    (fun t ht => (Real.sqrt_pos.2 (S.rPhi_pos ht)).ne')
 
def dtau (L : PeriodPair) (a t : ℝ) : ℝ :=
  (0 * Real.sqrt (rP L t) - Real.sqrt (rP L (a / 2)) * (rQ L t / (2 * Real.sqrt (rP L t)))) /
    Real.sqrt (rP L t) ^ 2
lemma hasDerivAt_tau {t : ℝ} (ht : t ∈ Ioo 0 (a / 2)) : HasDerivAt (tau L a) (dtau L a t) t := by
  have hP : 0 < rP L t := S.rP_half_pos.trans (S.lt_rP ht)
  have hs := (S.hasDerivAt_rP ht.1 (by linarith [ht.2, S.pos])).sqrt hP.ne'
  have hd := (hasDerivAt_const t (Real.sqrt (rP L (a / 2)))).div hs (Real.sqrt_pos.2 hP).ne'
  refine hd.congr_of_eventuallyEq ?_
  filter_upwards [Ioo_mem_nhds ht.1 ht.2] with s hs using S.tau_eq ⟨hs.1, hs.2.le⟩
lemma deriv_sq {t : ℝ} (ht : t ∈ Ioo 0 (a / 2)) :
    (lemInt (tau L a t) * dtau L a t) ^ 2 = rP L (a / 2) := by
  have hP : 0 < rP L t := S.rP_half_pos.trans (S.lt_rP ht)
  have hτ := S.tau_mem_Ioo ht
  have hrel := S.relation ht.1 (by linarith [ht.2, S.pos])
  rw [S.tau_eq ⟨ht.1, ht.2.le⟩] at hτ ⊢
  set r := Real.sqrt (rP L (a / 2)) with hr
  set s := Real.sqrt (rP L t) with hs
  have hr0 : 0 < r := Real.sqrt_pos.2 S.rP_half_pos
  have hs0 : 0 < s := Real.sqrt_pos.2 hP
  have hr2 : r ^ 2 = rP L (a / 2) := Real.sq_sqrt S.rP_half_pos.le
  have hs2 : s ^ 2 = rP L t := Real.sq_sqrt hP.le
  have h4 : (r / s) ^ 4 < 1 := pow_lt_one₀ hτ.1.le hτ.2 (by norm_num)
  set u := Real.sqrt (1 - (r / s) ^ 4) with hu
  have hu0 : 0 < u := Real.sqrt_pos.2 (by linarith)
  have hu2 : u ^ 2 = 1 - (r / s) ^ 4 := Real.sq_sqrt (by linarith)
  have hQ : rQ L t ^ 2 = 4 * s ^ 6 - 4 * r ^ 4 * s ^ 2 := by
    rw [hrel, ← hs2, ← hr2]; ring
  have hX : (dtau L a t) ^ 2 = r ^ 2 * u ^ 2 := by
    rw [dtau, ← hr, ← hs, hu2, div_pow]
    field_simp
    linear_combination r ^ 2 * hQ
  rw [lemInt, ← hu, mul_pow, hX, ← hr2]
  field_simp
 
theorem rP_half_eq : rP L (a / 2) = (varpi / a) ^ 2 := by
  have ha := S.pos
  have hGc : ContinuousOn (fun t => lemF (tau L a t)) (Icc 0 (a / 2)) :=
    continuousOn_lemF.comp S.continuousOn_tau (fun t ht => S.tau_mem_Icc ht)
  have hGd : ∀ x ∈ Ioo 0 (a / 2),
      HasDerivAt (fun t => lemF (tau L a t)) (lemInt (tau L a x) * dtau L a x) x :=
    fun x hx => (hasDerivAt_lemF (S.tau_mem_Ioo hx)).comp x (S.hasDerivAt_tau hx)
  obtain ⟨c, hc, hcd⟩ := exists_hasDerivAt_eq_slope _ _ (half_pos ha) hGc hGd
  rw [S.tau_half, tau_zero, lemF_one, lemF_zero] at hcd
  have hsl : (varpi / 2 - 0) / (a / 2 - 0) = varpi / a := by
    rw [sub_zero, sub_zero]; field_simp
  rw [← S.deriv_sq hc, hcd, hsl]
 
theorem g₂_eq_of_square : L.g₂ = 4 * ((varpi / a : ℝ) : ℂ) ^ 4 := by
  rw [S.g₂_eq, S.rP_half_eq]; push_cast; ring
end Sq
end LSG.LemniscateIndep
end
end

/- LSG.Weierstrass.Dictionary -/
section
open Module Filter Complex Set WeierstrassCurve WeierstrassCurve.Affine
open scoped Topology
noncomputable section
namespace LSG.Weierstrass
open PeriodPair
variable (L : PeriodPair)
 
def curve : WeierstrassCurve ℂ :=
  { a₁ := 0, a₂ := 0, a₃ := 0, a₄ := -L.g₂ / 4, a₆ := -L.g₃ / 4 }
 
abbrev curveA : WeierstrassCurve.Affine ℂ := (curve L).toAffine
lemma curve_Δ : (curve L).Δ = L.g₂ ^ 3 - 27 * L.g₃ ^ 2 := by
  simp only [WeierstrassCurve.Δ, WeierstrassCurve.b₂, WeierstrassCurve.b₄, WeierstrassCurve.b₆,
    WeierstrassCurve.b₈, curve]
  ring
lemma half_comb_notMem {a b : ℤ} (h : ¬ ((2 : ℤ) ∣ a ∧ (2 : ℤ) ∣ b)) :
    ((a : ℂ) * L.ω₁ + b * L.ω₂) / 2 ∉ L.lattice := by
  intro hm
  obtain ⟨m, n, hmn⟩ := mem_lattice.mp hm
  have := int_coords_eq L (a := 2 * m) (b := 2 * n) (c := a) (d := b)
    (by push_cast; linear_combination 2 * hmn)
  exact h ⟨⟨m, by omega⟩, ⟨n, by omega⟩⟩
 
theorem discr_ne_zero : L.g₂ ^ 3 - 27 * L.g₃ ^ 2 ≠ 0 := by
  have hn : ∀ a b : ℤ, ¬ ((2 : ℤ) ∣ a ∧ (2 : ℤ) ∣ b) →
      ((a : ℂ) * L.ω₁ + b * L.ω₂) / 2 ∉ L.lattice := fun a b h => half_comb_notMem L h
  have h1 : L.ω₁ / 2 ∉ L.lattice := L.ω₁_div_two_notMem_lattice
  have h2 : L.ω₂ / 2 ∉ L.lattice := L.ω₂_div_two_notMem_lattice
  have h3 : (L.ω₁ + L.ω₂) / 2 ∉ L.lattice := by
    have := hn 1 1 (by omega); push_cast at this; simpa using this
  set e₁ := ℘[L] (L.ω₁ / 2)
  set e₂ := ℘[L] (L.ω₂ / 2)
  set e₃ := ℘[L] ((L.ω₁ + L.ω₂) / 2)
  have c₁ := weierstrassP_half_cubic L L.ω₁_mem_lattice h1
  have c₂ := weierstrassP_half_cubic L L.ω₂_mem_lattice h2
  have c₃ := weierstrassP_half_cubic L (add_mem L.ω₁_mem_lattice L.ω₂_mem_lattice) h3
  have d₁₂ : e₁ ≠ e₂ := by
    intro h
    rcases (weierstrassP_eq_iff L h2 h1).mp h with h' | h'
    · exact hn 1 (-1) (by omega) (by push_cast; rw [show (1 * L.ω₁ + -1 * L.ω₂) / 2 =
        L.ω₁ / 2 - L.ω₂ / 2 by ring]; exact h')
    · exact hn 1 1 (by omega) (by push_cast; rw [show (1 * L.ω₁ + 1 * L.ω₂) / 2 =
        L.ω₁ / 2 + L.ω₂ / 2 by ring]; exact h')
  have d₁₃ : e₁ ≠ e₃ := by
    intro h
    rcases (weierstrassP_eq_iff L h3 h1).mp h with h' | h'
    · exact hn 0 (-1) (by omega) (by push_cast; rw [show (0 * L.ω₁ + -1 * L.ω₂) / 2 =
        L.ω₁ / 2 - (L.ω₁ + L.ω₂) / 2 by ring]; exact h')
    · exact hn 2 1 (by omega) (by push_cast; rw [show (2 * L.ω₁ + 1 * L.ω₂) / 2 =
        L.ω₁ / 2 + (L.ω₁ + L.ω₂) / 2 by ring]; exact h')
  have d₂₃ : e₂ ≠ e₃ := by
    intro h
    rcases (weierstrassP_eq_iff L h3 h2).mp h with h' | h'
    · exact hn (-1) 0 (by omega) (by push_cast; rw [show (-1 * L.ω₁ + 0 * L.ω₂) / 2 =
        L.ω₂ / 2 - (L.ω₁ + L.ω₂) / 2 by ring]; exact h')
    · exact hn 1 2 (by omega) (by push_cast; rw [show (1 * L.ω₁ + 2 * L.ω₂) / 2 =
        L.ω₂ / 2 + (L.ω₁ + L.ω₂) / 2 by ring]; exact h')
  have hs := vieta_three (a := 0) (b := -L.g₂) (c := -L.g₃) (by linear_combination c₁)
    (by linear_combination c₂) (by linear_combination c₃) d₁₂ d₁₃ d₂₃
  have hg₂ : L.g₂ = 4 * (e₁ ^ 2 + e₁ * e₂ + e₂ ^ 2) := by
    have : (e₁ - e₂) * (4 * (e₁ ^ 2 + e₁ * e₂ + e₂ ^ 2) - L.g₂) = 0 := by
      linear_combination c₁ - c₂
    rcases mul_eq_zero.mp this with h | h
    · exact absurd (sub_eq_zero.mp h) d₁₂
    · linear_combination -h
  have hg₃ : L.g₃ = 4 * e₁ ^ 3 - L.g₂ * e₁ := by linear_combination -c₁
  have he₃ : e₃ = -e₁ - e₂ := by linear_combination hs
  have key : L.g₂ ^ 3 - 27 * L.g₃ ^ 2 =
      16 * ((e₁ - e₂) * (e₁ - e₃) * (e₂ - e₃)) ^ 2 := by
    rw [hg₃, hg₂, he₃]
    ring
  rw [key]
  have : (e₁ - e₂) * (e₁ - e₃) * (e₂ - e₃) ≠ 0 :=
    mul_ne_zero (mul_ne_zero (sub_ne_zero.mpr d₁₂) (sub_ne_zero.mpr d₁₃)) (sub_ne_zero.mpr d₂₃)
  exact mul_ne_zero (by norm_num) (pow_ne_zero 2 this)
lemma curve_Δ_ne_zero : (curveA L).Δ ≠ 0 := by
  rw [show (curveA L).Δ = (curve L).Δ from rfl, curve_Δ]
  exact discr_ne_zero L
lemma equation_weierstrassP {z : ℂ} (hz : z ∉ L.lattice) :
    (curveA L).Equation (℘[L] z) (℘'[L] z / 2) := by
  rw [equation_iff]
  have := L.derivWeierstrassP_sq z hz
  simp only [curveA, curve]
  linear_combination this / 4
lemma nonsingular_weierstrassP {z : ℂ} (hz : z ∉ L.lattice) :
    (curveA L).Nonsingular (℘[L] z) (℘'[L] z / 2) :=
  (equation_iff_nonsingular_of_Δ_ne_zero (curve_Δ_ne_zero L)).mp (equation_weierstrassP L hz)
open Classical in
 
def expE (z : ℂ) : (curveA L).Point :=
  if h : z ∈ L.lattice then 0 else .some _ _ (nonsingular_weierstrassP L h)
lemma expE_of_mem {z : ℂ} (h : z ∈ L.lattice) : expE L z = 0 := by
  simp [expE, h]
lemma expE_of_notMem {z : ℂ} (h : z ∉ L.lattice) :
    expE L z = .some _ _ (nonsingular_weierstrassP L h) := by
  simp [expE, h]
lemma some_eq_some {x y x' y' : ℂ} {h : (curveA L).Nonsingular x y}
    {h' : (curveA L).Nonsingular x' y'} (hx : x = x') (hy : y = y') :
    Point.some x y h = Point.some x' y' h' := by
  subst hx hy; rfl
lemma expE_zero : expE L 0 = 0 := expE_of_mem L L.lattice.zero_mem
 
lemma expE_add_mem (z : ℂ) {ω : ℂ} (hω : ω ∈ L.lattice) : expE L (z + ω) = expE L z := by
  by_cases hz : z ∈ L.lattice
  · rw [expE_of_mem L hz, expE_of_mem L (add_mem hz hω)]
  · have hz' : z + ω ∉ L.lattice := add_notMem_lattice L hz hω
    rw [expE_of_notMem L hz, expE_of_notMem L hz']
    exact some_eq_some L (weierstrassP_add_mem L z hω) (by rw [derivWeierstrassP_add_mem L z hω])
 
lemma expE_neg (z : ℂ) : expE L (-z) = -expE L z := by
  by_cases hz : z ∈ L.lattice
  · rw [expE_of_mem L hz, expE_of_mem L (neg_mem hz), Point.neg_zero]
  · have hz' : -z ∉ L.lattice := fun h => hz (by simpa using neg_mem h)
    rw [expE_of_notMem L hz, expE_of_notMem L hz', Point.neg_some]
    refine some_eq_some L (L.weierstrassP_neg z) ?_
    rw [L.derivWeierstrassP_neg, negY]
    simp [curveA, curve]
    ring
 
theorem expE_add (z w : ℂ) : expE L (z + w) = expE L z + expE L w := by
  by_cases hz : z ∈ L.lattice
  · rw [expE_of_mem L hz, zero_add, add_comm, expE_add_mem L w hz]
  by_cases hw : w ∈ L.lattice
  · rw [expE_of_mem L hw, add_zero, expE_add_mem L z hw]
  rw [expE_of_notMem L hz, expE_of_notMem L hw]
  by_cases hzw : z + w ∈ L.lattice
  · 
    rw [expE_of_mem L hzw]
    have hP : ℘[L] z = ℘[L] w := (weierstrassP_eq_iff L hw hz).mpr (Or.inr hzw)
    have hP' : ℘'[L] z = -℘'[L] w := by
      have := derivWeierstrassP_add_mem L (-w) hzw
      rw [show -w + (z + w) = z by ring, L.derivWeierstrassP_neg] at this
      exact this
    refine (Point.add_of_Y_eq hP ?_).symm
    rw [negY, hP']
    simp [curveA, curve]
    ring
  rw [expE_of_notMem L hzw]
  by_cases hd : z - w ∈ L.lattice
  · 
    have hP : ℘[L] z = ℘[L] w := (weierstrassP_eq_iff L hw hz).mpr (Or.inl hd)
    have hP' : ℘'[L] z = ℘'[L] w := by
      have := derivWeierstrassP_add_mem L w hd
      rwa [show w + (z - w) = z by ring] at this
    have h2 : 2 * z ∉ L.lattice := by
      intro h
      apply hzw
      have := sub_mem h hd
      rwa [show 2 * z - (z - w) = z + w by ring] at this
    have hne := derivWeierstrassP_ne_zero L h2
    have hy : ℘'[L] z / 2 ≠ (curveA L).negY (℘[L] w) (℘'[L] w / 2) := by
      rw [negY, ← hP']
      simp only [curveA, curve, zero_mul, sub_zero]
      intro h
      apply hne
      linear_combination h
    rw [Point.add_of_Y_ne hy]
    have hzw' : z + w = 2 * z + (w - z) := by ring
    have hwz : w - z ∈ L.lattice := by simpa using neg_mem hd
    have hsl : (curveA L).slope (℘[L] z) (℘[L] w) (℘'[L] z / 2) (℘'[L] w / 2) =
        tangentSlope L z / 2 := by
      rw [slope_of_Y_ne hP hy, negY]
      simp only [curveA, curve, zero_mul, sub_zero, mul_zero, add_zero]
      unfold tangentSlope
      field_simp
      ring
    have hx : ℘[L] (z + w) = ℘[L] (2 * z) := by rw [hzw', weierstrassP_add_mem L _ hwz]
    have hy' : ℘'[L] (z + w) = ℘'[L] (2 * z) := by rw [hzw', derivWeierstrassP_add_mem L _ hwz]
    have hdx := weierstrassP_two_mul L h2
    have hdy := derivWeierstrassP_two_mul L h2
    refine some_eq_some L ?_ ?_
    · rw [addX, hsl, hx, hdx, ← hP]
      simp only [curveA, curve]
      ring
    · rw [addY, negAddY, addX, negY, hsl, hy', hdy, hdx, ← hP]
      simp only [curveA, curve]
      ring
  · 
    have hdw : z - w ∉ L.lattice := hd
    have hne := pdiff_ne L hz hw hzw hdw
    have hx : ℘[L] z ≠ ℘[L] w := sub_ne_zero.mp hne
    rw [Point.add_of_X_ne hx]
    have hsl : (curveA L).slope (℘[L] z) (℘[L] w) (℘'[L] z / 2) (℘'[L] w / 2) =
        chordSlope L z w / 2 := by
      rw [slope_of_X_ne hx]
      unfold chordSlope
      field_simp
    have hax := weierstrassP_add L hz hw hzw hdw
    have hay := derivWeierstrassP_add L hz hw hzw hdw
    refine some_eq_some L ?_ ?_
    · rw [addX, hsl, hax]
      simp only [curveA, curve]
      ring
    · rw [addY, negAddY, addX, negY, hsl, hay, hax]
      simp only [curveA, curve]
      ring
 
def expHom : ℂ →+ (curveA L).Point where
  toFun := expE L
  map_zero' := expE_zero L
  map_add' := expE_add L
@[simp] lemma expHom_apply (z : ℂ) : expHom L z = expE L z := rfl
lemma expE_intCast_mul (n : ℤ) (z : ℂ) : expE L (n * z) = n • expE L z := by
  rw [← expHom_apply, ← zsmul_eq_mul, map_zsmul, expHom_apply]
section Rational
variable (K : Subfield ℂ) (h₂ : L.g₂ ∈ K)
end Rational
end LSG.Weierstrass
end
end

/- TunnellCMModelUnit -/
section
section
namespace TunnellCMModelUnit
open WeierstrassCurve WeierstrassCurve.Affine IsDedekindDomain IsDedekindDomain.HeightOneSpectrum
open IsLocalRing NumberField TunnellCMLocalUnit TunnellCMUnitCriterion
open scoped NumberField
variable {F : Type*} [Field F] {W : WeierstrassCurve F}
def X : W.toAffine.Point → F
  | .zero => 0
  | .some x _ _ => x
def Y : W.toAffine.Point → F
  | .zero => 0
  | .some _ y _ => y
variable {R K : Type*} [CommRing R] [IsDedekindDomain R] [Field K] [CharZero K]
  [Algebra R K] [IsFractionRing R K] {v : HeightOneSpectrum R}
end TunnellCMModelUnit
end
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
end

/- TunnellCoates -/
section
namespace TunnellCoates
abbrev E {K : Type*} [CommRing K] (n : K) : WeierstrassCurve K := ⟨0,0,0,-n^2,0⟩
end TunnellCoates
end

/- TunnellCMAbsoluteUnit -/
section
namespace TunnellCMAbsoluteUnit
open WeierstrassCurve WeierstrassCurve.Affine NumberField TunnellCoates
open TunnellCMModelUnit TunnellCMGlobalModelUnit TunnellCMGoodDescent
open scoped NumberField
noncomputable section
variable (F B : Type*) [Field F] [Field B] [Algebra F B] [DecidableEq F] [DecidableEq B]
lemma eq_E (n : ℕ) : (E (n:F)).baseChange B = E (n:B) := by
  ext <;> simp [WeierstrassCurve.baseChange,E]
def mapPoint (n : ℕ) : (E (n:F)).toAffine.Point →+ (E (n:B)).toAffine.Point :=
  (Point.equivOfEq (eq_E F B n)).toAddMonoidHom.comp (pointMap (E (n:F)) B)
lemma mapPoint_injective (n : ℕ) : Function.Injective (mapPoint F B n) :=
  (Point.equivOfEq _).injective.comp (pointMap_inj _ B)
lemma x_equality {W W' : WeierstrassCurve B} (h : W=W') (P : W.toAffine.Point) :
    X (Point.equivOfEq h P) = X P := by subst W'; rfl
variable {B} [CharZero B] (K : IntermediateField ℚ B) [DecidableEq K]
lemma lift_point (n : ℕ) (P : (E (n:B)).toAffine.Point) (hx : X P ∈ K) (hy : Y P ∈ K) :
    ∃ P' : (E (n:K)).toAffine.Point, mapPoint K B n P'=P := by
  cases P with
  | zero => exact ⟨0,map_zero _⟩
  | some x y hh =>
    let u : K := ⟨x,hx⟩
    let v : K := ⟨y,hy⟩
    have he := eq_E K B n
    have h : (E (n:K)).toAffine.Nonsingular u v := by
      apply ((E (n:K)).toAffine.map_nonsingular (f := algebraMap K B) (algebraMap K B).injective u v).mp
      change ((E (n:K)).baseChange B).toAffine.Nonsingular x y
      rw [he]; exact hh
    refine ⟨.some u v h,?_⟩
    simp only [mapPoint,pointMap,AddMonoidHom.comp_apply,AddEquiv.coe_toAddMonoidHom,
      Point.equivOfEq_some,Point.map_some]
    rfl
end
end TunnellCMAbsoluteUnit
end

/- TunnellGaussianHecke -/
section
namespace TunnellGaussian
open GaussianInt Finset
lemma norm_product (z : GaussianInt) : z * star z = (z.norm.natAbs : GaussianInt) := by
  rw [GaussianInt.natCast_natAbs_norm, Zsqrtd.norm_eq_mul_conj]
lemma unit_of_norm_one {z : GaussianInt} (h : z.norm.natAbs = 1) : IsUnit z := by
  apply (Zsqrtd.norm_eq_one_iff' (by decide : (-1 : ℤ) ≤ 0) z).mp
  have h' := GaussianInt.abs_natCast_norm z
  simpa [h] using h'.symm
lemma norm_prime {z : GaussianInt} {p : ℕ} (hp : p.Prime) (h : z.norm.natAbs = p) : Prime z := by
  apply Irreducible.prime
  constructor
  · intro hu
    have hn := (Zsqrtd.norm_eq_one_iff' (by decide : (-1 : ℤ) ≤ 0) z).mpr hu
    simp [hn] at h
    exact hp.ne_one h.symm
  · intro a b hab
    rw [hab, Zsqrtd.norm_mul, Int.natAbs_mul] at h
    rcases hp.eq_one_or_self_of_dvd _ (h ▸ dvd_mul_right _ _) with hh | hh
    · exact Or.inl (unit_of_norm_one hh)
    · exact Or.inr (unit_of_norm_one (Nat.eq_of_mul_eq_mul_left hp.pos (by simpa [hh] using h)))
end TunnellGaussian
end

/- TunnellCMDistribution -/
section
namespace TunnellCMDistribution
open Complex Filter Set
open scoped Topology PeriodPair
lemma hasDerivP (L : PeriodPair) {z : ℂ} (hz : z ∉ L.lattice) :
    HasDerivAt L.weierstrassP (L.derivWeierstrassP z) z := by
  simpa only [L.deriv_weierstrassP] using
    (L.differentiableOn_weierstrassP.differentiableAt (L.isClosed_lattice.isOpen_compl.mem_nhds hz)).hasDerivAt
open TunnellEllipticZeta
end TunnellCMDistribution
end

/- TunnellPeriod -/
section
namespace TunnellCoates
open MeasureTheory Set Filter
open scoped Topology
noncomputable def realPeriod (n : ℝ) : ℝ :=
  ∫ x in Ioi n, (Real.sqrt (x^3-n^2*x))⁻¹
end TunnellCoates
end

/- TunnellCMLemniscate -/
section
namespace TunnellCMLemniscate
open MeasureTheory Set Complex LSG.LemniscateIndep
open TunnellCoates
theorem period_one : realPeriod 1 = varpi := by
  let f (t : ℝ) := t⁻¹^2
  let D (t : ℝ) := -2/t^3
  have hd {t : ℝ} (ht : t∈Ioo (0:ℝ) 1) : HasDerivAt f (D t) t := by
    apply (((hasDerivAt_id' t).inv ht.1.ne').pow 2).congr_deriv
    dsimp [D]
    field_simp
    <;> ring
  have hi : StrictAntiOn f (Ioo 0 1) := by
    intro t ht v hv he
    exact pow_lt_pow_left₀ (inv_lt_inv₀ hv.1 ht.1 |>.mpr he) (inv_nonneg.mpr hv.1.le) (by decide)
  have him : f '' Ioo (0:ℝ) 1=Ioi 1 := by
    ext x
    constructor
    · rintro ⟨t,ht,rfl⟩
      have hp : 1<t⁻¹ := (one_lt_inv₀ ht.1).mpr ht.2
      change 1<t⁻¹^2
      nlinarith
    · intro hx
      change 1<x at hx
      have hp : 1<Real.sqrt x := by simpa using Real.sqrt_lt_sqrt (by norm_num : (0:ℝ)≤1) hx
      refine ⟨(Real.sqrt x)⁻¹,⟨inv_pos.mpr (by linarith),(inv_lt_one₀ (by linarith)).mpr hp⟩,?_⟩
      simp [f,Real.sq_sqrt (by linarith : 0≤x)]
  let g (x : ℝ) := (Real.sqrt (x^3-x))⁻¹
  have e := integral_image_eq_integral_abs_deriv_smul measurableSet_Ioo
    (fun t ht => (hd ht).hasDerivWithinAt) hi.injOn g
  rw [varpi_eq_integral,intervalIntegral.integral_of_le zero_le_one,integral_Ioc_eq_integral_Ioo,
    ← integral_const_mul]
  change (∫ x in Ioi 1, (Real.sqrt (x^3-(1:ℝ)^2*x))⁻¹)=_
  simp only [one_pow,one_mul]
  change (∫ x in Ioi 1, g x)=_
  rw [← him,e]
  apply setIntegral_congr_fun measurableSet_Ioo
  intro t ht
  have ht0 := ht.1
  have he : (t⁻¹^2)^3-t⁻¹^2=(1-t^4)/(t^3)^2 := by field_simp <;> ring
  have hv : 0≤1-t^4 := by nlinarith [pow_le_pow_left₀ ht.1.le ht.2.le 4]
  change |(-2/t^3)| * (Real.sqrt ((t⁻¹^2)^3-t⁻¹^2))⁻¹=2*(1 / Real.sqrt (1-t^4))
  rw [he,Real.sqrt_div hv,Real.sqrt_sq (by positivity),abs_of_neg (div_neg_of_neg_of_pos (by norm_num : (-2:ℝ)<0) (pow_pos ht0 3))]
  field_simp
noncomputable def twistPeriods (n : ℕ) (hn : 0<n) : PeriodPair where
  ω₁ := (realPeriod n:ℂ)
  ω₂ := I * (realPeriod n:ℂ)
  indep := by
    have h : realPeriod n ≠ 0 := (realPeriod_pos (show (0:ℝ)<n by exact_mod_cast hn)).ne'
    apply LinearIndependent.pair_iff.mpr
    intro x y he
    have hr := congrArg re he
    have hi := congrArg im he
    simp [Complex.mul_re,Complex.mul_im,h] at hr hi
    exact ⟨hr,hi⟩
theorem g₂_twist (n : ℕ) (hn : 0<n) : (twistPeriods n hn).g₂ = 4*(n:ℂ)^2 := by
  have hpos : (0:ℝ)<n := by exact_mod_cast hn
  rw [Sq.g₂_eq_of_square (L := twistPeriods n hn) (a := realPeriod n)
      ⟨realPeriod_pos hpos,rfl,rfl⟩,(show realPeriod n=realPeriod 1/Real.sqrt n from realPeriod_eq hpos),period_one]
  have he : varpi/(varpi/Real.sqrt n)=Real.sqrt n := by field_simp [varpi_pos.ne']
  rw [he]
  have e := congrArg ((↑):ℝ→ℂ) (Real.sq_sqrt hpos.le)
  push_cast at e
  linear_combination 4*((Real.sqrt n:ℂ)^2+(n:ℂ))*e
theorem curve_eq (n : ℕ) (hn : 0<n) :
    LSG.Weierstrass.curve (twistPeriods n hn) = (⟨0,0,0,-(n:ℂ)^2,0⟩ : WeierstrassCurve ℂ) := by
  have hg := g₃_eq_zero_of_square (L := twistPeriods n hn) (a := realPeriod n) rfl rfl
  unfold LSG.Weierstrass.curve
  rw [g₂_twist,hg]
  congr 1 <;> ring
end TunnellCMLemniscate
end

/- TunnellCMTranscendental -/
section
namespace TunnellCMTranscendental
open Polynomial Set Complex LSG.Weierstrass
abbrev F := RatFunc ℚ
abbrev K := AlgebraicClosure F
noncomputable section
local instance : DecidableEq K := Classical.decEq _
noncomputable def Xgeneric : K := algebraMap F K RatFunc.X
lemma specialize {x : ℂ} (hx : Transcendental ℚ x) : ∃ φ : K →ₐ[ℚ] ℂ, φ Xgeneric=x := by
  let h : F →ₐ[ℚ] ℂ := IsFractionRing.liftAlgHom (transcendental_iff_injective.mp hx)
  obtain ⟨φ,hφ⟩ := IsAlgClosed.surjective_domRestrict_of_isAlgebraic (K := ℚ) (L := F)
    (E := K) (M := ℂ) h
  refine ⟨φ,?_⟩
  change φ.domRestrict F RatFunc.X = x
  change φ.domRestrict F = h at hφ
  rw [hφ,← RatFunc.algebraMap_X]
  simp only [h,IsFractionRing.liftAlgHom_apply,IsFractionRing.lift_algebraMap]
  exact aeval_X x
lemma values_fiber_countable (M : PeriodPair) (x : ℂ) :
    {z : ℂ | z∉M.lattice ∧ M.weierstrassP z=x}.Countable := by
  by_cases h : ∃ b : ℂ, b∉M.lattice ∧ M.weierstrassP b=x
  · obtain ⟨b,hb,rfl⟩ := h
    have hc := lattice_countable M
    refine ((hc.image (fun l : ℂ => l+b)).union (hc.image (fun l : ℂ => l-b))).mono ?_
    rintro z ⟨hz,he⟩
    rcases (weierstrassP_eq_iff M hb hz).mp he with h|h
    · exact Or.inl ⟨z-b,h,sub_add_cancel _ _⟩
    · exact Or.inr ⟨z+b,h,add_sub_cancel_right _ _⟩
  · apply countable_empty.mono
    exact fun z hz => (h ⟨z,hz⟩).elim
lemma generic_analytic_point (M : PeriodPair) (a : ℕ) (ha : 0<a) :
    ∃ z : ℂ, z∉M.lattice ∧ (a:ℂ)*z∉M.lattice ∧ Transcendental ℚ (M.weierstrassP z) := by
  let bad := ⋃ x ∈ {x : ℂ | IsAlgebraic ℚ x}, {z : ℂ | z∉M.lattice ∧ M.weierstrassP z=x}
  have hc : bad.Countable := (Algebraic.countable ℚ ℂ).biUnion (fun x _ => values_fiber_countable M x)
  have hn : (a:ℂ)≠0 := by exact_mod_cast ha.ne'
  have hD := (lattice_countable M).preimage (mul_right_injective₀ hn)
  let B := (bad ∪ (M.lattice : Set ℂ)) ∪ (fun x : ℂ => (a:ℂ)*x) ⁻¹' (M.lattice : Set ℂ)
  let : Uncountable ℂ := Complex.ofReal_injective.uncountable
  have hb : B.Countable := (hc.union (lattice_countable M)).union hD
  obtain ⟨z,hz⟩ : ∃ z, z∉B := by
    by_contra! h
    exact not_countable_univ (α := ℂ) (hb.mono (fun z _ => h z))
  have h1 : z ∉ M.lattice := fun h => hz (Or.inl (Or.inr h))
  refine ⟨z,h1,fun h => hz (Or.inr h),fun he => hz (Or.inl (Or.inl ?_))⟩
  exact mem_iUnion₂.mpr ⟨_,he,h1,rfl⟩
noncomputable def E (n : ℕ) : WeierstrassCurve ℚ := ⟨0,0,0,-(n:ℚ)^2,0⟩
lemma model (n : ℕ) (k : Type*) [Field k] [CharZero k] :
    (E n).baseChange k = (⟨0,0,0,-(n:k)^2,0⟩ : WeierstrassCurve k) := by
  ext <;> simp [E,WeierstrassCurve.baseChange]
instance elliptic (n : ℕ) [NeZero n] : (E n).IsElliptic := by
  constructor
  have hn : (n:ℚ)≠0 := by exact_mod_cast NeZero.ne n
  have h : (E n).Δ=64*(n:ℚ)^6 := by
    simp [E,WeierstrassCurve.Δ,WeierstrassCurve.b₂,WeierstrassCurve.b₄,
      WeierstrassCurve.b₆,WeierstrassCurve.b₈]
    ring
  rw [h]
  exact isUnit_iff_ne_zero.mpr (mul_ne_zero (by norm_num) (pow_ne_zero _ hn))
noncomputable def Ygeneric (n : ℕ) : K :=
  (IsAlgClosed.exists_pow_nat_eq (Xgeneric^3-(n:K)^2*Xgeneric) zero_lt_two).choose
lemma generic_nonsingular (n : ℕ) [NeZero n] :
    ((E n).baseChange K).toAffine.Nonsingular Xgeneric (Ygeneric n) := by
  letI : ((E n).baseChange K).IsElliptic :=
    inferInstanceAs (((E n).map (algebraMap ℚ K)).IsElliptic)
  apply WeierstrassCurve.Affine.equation_iff_nonsingular.mp
  rw [WeierstrassCurve.Affine.equation_iff,model]
  have hY : Ygeneric n^2 = Xgeneric^3-(n:K)^2*Xgeneric :=
    (IsAlgClosed.exists_pow_nat_eq (Xgeneric^3-(n:K)^2*Xgeneric) zero_lt_two).choose_spec
  simpa only [zero_mul,zero_add,mul_zero,add_zero,neg_mul,sub_eq_add_neg] using hY
noncomputable def genericPoint (n : ℕ) [NeZero n] : ((E n).baseChange K).toAffine.Point :=
  .some _ _ (generic_nonsingular n)
open WeierstrassCurve.Affine (Point)
lemma generic_killed_iff (n a : ℕ) [NeZero n] {x y : ℂ} (hx : Transcendental ℚ x)
    (h : ((E n).baseChange ℂ).toAffine.Nonsingular x y) :
    a • genericPoint n = 0 ↔ a • (Point.some x y h) = 0 := by
  classical
  obtain ⟨φ,hφ⟩ := specialize hx
  let m := Point.map (W' := (E n).toAffine) φ
  have he : a • genericPoint n=0 ↔ a • m (genericPoint n)=0 := by
    rw [← map_nsmul,← map_zero m]
    exact (Point.map_injective (W' := (E n).toAffine) φ).eq_iff.symm
  rw [he]
  have e := (Point.X_eq_iff (h₁ := (((E n).toAffine.baseChange_nonsingular φ.injective ..).mpr
    (generic_nonsingular n))) (h₂ := h)).mp hφ
  change m (genericPoint n)=Point.some x y h ∨ m (genericPoint n)= -Point.some x y h at e
  rcases e with e|e
  · rw [e]
  · rw [e,smul_neg,neg_eq_zero]
noncomputable def killedAt (W : WeierstrassCurve ℂ) (a : ℕ) (x : ℂ) : Prop :=
  ∃ y, ∃ h : W.toAffine.Nonsingular x y, a • Point.some x y h=0
lemma uniform_killed (n a : ℕ) [NeZero n] {x : ℂ} (hx : Transcendental ℚ x)
    (h : killedAt ((E n).baseChange ℂ) a x) :
    ∀ {x' y' : ℂ}, Transcendental ℚ x' →
      ∀ h' : ((E n).baseChange ℂ).toAffine.Nonsingular x' y', a • Point.some x' y' h'=0 := by
  obtain ⟨y,h,he⟩ := h
  intro x' y' hx' h'
  exact (generic_killed_iff n a hx' h').mp ((generic_killed_iff n a hx h).mpr he)
lemma analytic_killed (M : PeriodPair) (a : ℕ) (z : ℂ) :
    a • expE M z = 0 ↔ (a:ℂ)*z ∈ M.lattice := by
  have e : expE M ((a:ℂ)*z) = a • expE M z := by
    simpa only [Int.cast_natCast,natCast_zsmul] using expE_intCast_mul M (a:ℤ) z
  rw [← e]
  by_cases h : (a:ℂ)*z∈M.lattice
  · simp [h,expE_of_mem M h]
  · rw [expE_of_notMem M h]
    simp [h]
theorem torsion_x_algebraic (n a : ℕ) (hn : 0<n) (ha : 0<a) {x : ℂ}
    (h : killedAt ((E n).baseChange ℂ) a x) : IsAlgebraic ℚ x := by
  classical
  by_contra hx
  letI : NeZero n := ⟨hn.ne'⟩
  let M := TunnellCMLemniscate.twistPeriods n hn
  have eqM : (E n).baseChange ℂ = curve M :=
    (model n ℂ).trans (TunnellCMLemniscate.curve_eq n hn).symm
  obtain ⟨v,hv,hav,hxv⟩ := generic_analytic_point M a ha
  have all := @uniform_killed n a _ x hx h
  rw [eqM] at all
  have hp := all hxv (nonsingular_weierstrassP M hv)
  rw [← expE_of_notMem M hv,analytic_killed] at hp
  exact hav hp
theorem division_x_algebraic (n a : ℕ) (hn : 0<n) (ha : 0<a) {z : ℂ}
    (hz : z∉(TunnellCMLemniscate.twistPeriods n hn).lattice)
    (haz : (a:ℂ)*z∈(TunnellCMLemniscate.twistPeriods n hn).lattice) :
    IsAlgebraic ℚ ((TunnellCMLemniscate.twistPeriods n hn).weierstrassP z) := by
  let M := TunnellCMLemniscate.twistPeriods n hn
  apply torsion_x_algebraic n a hn ha
  rw [(model n ℂ).trans (TunnellCMLemniscate.curve_eq n hn).symm]
  refine ⟨_,nonsingular_weierstrassP M hz,?_⟩
  rw [← expE_of_notMem M hz,analytic_killed]
  exact haz
end
end TunnellCMTranscendental
end

/- TunnellCMAlgebraicUnits -/
section
namespace TunnellCMAlgebraicUnits
open Complex LSG.Weierstrass TunnellCMLemniscate TunnellCMDistribution TunnellCMUnitTrace
open TunnellCMEllipticUnit TunnellCoates TunnellCMLSeries TunnellCMCritical
variable (n : ℕ) (hn : 0<n)
lemma wp_mem {z : ℂ} {m : ℕ} (hm : 0 < m) (h : (m:ℂ)*z∈((twistPeriods n hn)).lattice) :
    ((twistPeriods n hn)).weierstrassP z ∈ (algebraicClosure ℚ ℂ) := by
  by_cases hz : z∈((twistPeriods n hn)).lattice
  · rw [show ((twistPeriods n hn)).weierstrassP z=0 from ((twistPeriods n hn)).weierstrassP_coe ⟨z,hz⟩]
    exact ((algebraicClosure ℚ ℂ)).zero_mem
  exact mem_algebraicClosure_iff.mpr (TunnellCMTranscendental.division_x_algebraic n m hn hm hz h)
lemma y_mem {z : ℂ} {m : ℕ} (hm : 0 < m) (h : (m:ℂ)*z∈((twistPeriods n hn)).lattice) (hz : z∉((twistPeriods n hn)).lattice) :
    ((twistPeriods n hn)).derivWeierstrassP z/2 ∈ (algebraicClosure ℚ ℂ) := by
  have hX := wp_mem n hn hm h
  apply mem_algebraicClosure_iff.mpr
  apply IsAlgebraic.of_pow (n := 2) (by decide)
  have e := equation_weierstrassP (twistPeriods n hn) hz
  change (curve (twistPeriods n hn)).toAffine.Equation _ _ at e
  rw [curve_eq] at e
  rw [(TunnellCoates.E_equation (n:ℂ) _ _).mp e]
  exact mem_algebraicClosure_iff.mp (((algebraicClosure ℚ ℂ)).sub_mem (((algebraicClosure ℚ ℂ)).pow_mem hX (3:ℕ)) (((algebraicClosure ℚ ℂ)).mul_mem (((algebraicClosure ℚ ℂ)).pow_mem (((algebraicClosure ℚ ℂ)).natCast_mem n) 2) hX))
end TunnellCMAlgebraicUnits
end

/- TunnellCMTorus -/
section
namespace TunnellCMTorus
open Complex Filter Set LSG.Weierstrass
open scoped Topology PeriodPair
theorem exists_wp (M : PeriodPair) (x : ℂ) : ∃ z ∉ M.lattice, M.weierstrassP z=x := by
  classical
  by_contra! h
  let f (z : ℂ) := if z∈M.lattice then 0 else (M.weierstrassP z-x)⁻¹
  have hp (z : ℂ) (l : M.lattice) : f (z+l)=f z := by
    simp [f,M.weierstrassP_add_coe,M.lattice.add_mem_iff_left l.property]
  let g (z : ℂ) := z^2/(1+z^2*(M.weierstrassPExcept 0 z-x))
  have h₀ : DifferentiableAt ℂ g 0 := by
    have hD := (M.analyticAt_weierstrassPExcept 0).differentiableAt
    apply (differentiableAt_id.pow 2).div ((differentiableAt_const (c := (1:ℂ))).add
      ((differentiableAt_id.pow 2).mul (hD.sub_const x)))
    simp
  have he : f =ᶠ[𝓝 (0:ℂ)] g := by
    filter_upwards [M.compl_lattice_sdiff_singleton_mem_nhds 0] with z hz
    by_cases hzero : z=0
    · simp [hzero,f,g]
    have hz' : z∉M.lattice := fun hm => hz ⟨hm,by simpa using hzero⟩
    have e : M.weierstrassP z=M.weierstrassPExcept 0 z+1/z^2 := by
      rw [← M.weierstrassPExcept_add ⟨0,M.lattice.zero_mem⟩]
      simp
    simp only [f,if_neg hz',g,e]
    have hdiv : M.weierstrassPExcept 0 z+1/z^2-x=(1+z^2*(M.weierstrassPExcept 0 z-x))/z^2 := by
      field_simp
      <;> ring
    rw [hdiv,inv_div]
  have f0 := h₀.congr_of_eventuallyEq he
  have hd : Differentiable ℂ f := by
    intro w
    by_cases hw : w∈M.lattice
    · let l : M.lattice := ⟨w,hw⟩
      have f0' : DifferentiableAt ℂ f (w-w) := by simpa using f0
      have D := f0'.comp (f := fun z : ℂ => z-w) w (differentiableAt_id.sub_const w)
      apply D.congr_of_eventuallyEq
      filter_upwards with z
      simpa [Function.comp_def,l] using hp (z-w) l
    · apply ((M.differentiableOn_weierstrassP.differentiableAt
        (M.isClosed_lattice.isOpen_compl.mem_nhds hw)).sub_const x).inv (sub_ne_zero.mpr (h w hw)) |>.congr_of_eventuallyEq
      filter_upwards [M.isClosed_lattice.isOpen_compl.mem_nhds hw] with z hz using if_neg hz
  have hb := (IsZLattice.isCompact_range_of_periodic M.lattice _ hd.continuous
    (fun z w hw => hp z ⟨w,hw⟩)).isBounded
  have eq0 := hd.apply_eq_apply_of_bounded hb (M.ω₁/2) 0
  simp only [f,if_neg M.ω₁_div_two_notMem_lattice,Submodule.zero_mem,if_true,inv_eq_zero,sub_eq_zero] at eq0
  exact h _ M.ω₁_div_two_notMem_lattice eq0
theorem exp_surjective (M : PeriodPair) : Function.Surjective (expE M) := by
  intro P
  cases P with
  | zero => exact ⟨0,expE_zero M⟩
  | some x y hy =>
    obtain ⟨z,hz,hx⟩ := exists_wp M x
    have e := (WeierstrassCurve.Affine.Point.X_eq_iff (h₁ := nonsingular_weierstrassP M hz) (h₂ := hy)).mp hx
    rw [← expE_of_notMem M hz] at e
    rcases e with he|he
    · exact ⟨z,he⟩
    · exact ⟨-z,by rw [expE_neg,he,neg_neg]⟩
end TunnellCMTorus
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
lemma act_mul (σ τ : (L ≃ₐ[F] L)) (P : (CurvePoints W L)) : act W (σ*τ) P = act W σ (act W τ P) := by
  exact (Affine.Point.map_map τ.toAlgHom σ.toAlgHom P).symm
variable (φ : (CurvePoints W L) →+ (CurvePoints W L)) (Q : (CurvePoints W L))
variable (hφ : ∀ (σ : (L ≃ₐ[F] L)) (T : (CurvePoints W L)), φ (act W σ T) = act W σ (φ T))
variable (hP : ∀ σ : (L ≃ₐ[F] L), act W σ (φ Q) = φ Q)
include hφ hP in
lemma translation_mem (σ : (L ≃ₐ[F] L)) : act W σ Q - Q ∈ φ.ker := by
  change φ (act W σ Q - Q) = 0
  rw [map_sub,hφ,hP,sub_self]
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
include hφ in

theorem divisionField_normal [Normal F L] {u v : L}
    (hQ : (W.baseChange L).toAffine.Nonsingular u v)
    (hP' : ∀ σ : (L ≃ₐ[F] L), act W σ (φ (Affine.Point.some u v hQ)) = φ (Affine.Point.some u v hQ))
    (ht : φ.ker ≤ rationalPoints W (IntermediateField.adjoin F {u,v})) :
    Normal F (IntermediateField.adjoin F {u,v}) := by
  let K := IntermediateField.adjoin F {u,v}
  let S := rationalPoints W K
  let R := Affine.Point.some u v hQ
  have hR : R∈S := (rationalPoints_some W hQ).mpr
    ⟨IntermediateField.subset_adjoin F _ (by simp), IntermediateField.subset_adjoin F _ (by simp)⟩
  apply IntermediateField.normal_iff_forall_map_le'.mpr
  intro σ
  have hd := ht (translation_mem W φ R hφ hP' σ)
  have hσ : act W σ R ∈ S := by simpa using S.add_mem hd hR
  have he := (rationalPoints_some W _).mp hσ
  rw [IntermediateField.adjoin_map,IntermediateField.adjoin_le_iff]
  rintro x ⟨y,hy,rfl⟩
  rcases hy with (rfl|hy)
  · exact he.1
  · obtain rfl := Set.mem_singleton_iff.mp hy
    exact he.2
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

/- TunnellCMToricDivision -/
section
namespace TunnellCMToricDivision
open Complex LSG.Weierstrass LSG.LemniscateIndep TunnellCMLemniscate TunnellCMDistribution
open TunnellCoates TunnellGaussianEnd
noncomputable section
local instance (M : PeriodPair) : (curve M).IsElliptic := ⟨isUnit_iff_ne_zero.mpr (curve_Δ_ne_zero M)⟩
variable (n : ℕ) (hn : 0<n)
def rot := quarter (n := (n:ℂ)) (curve_eq n hn) I I_sq
lemma rot_exp (z : ℂ) : rot n hn (expE (twistPeriods n hn) z)=expE (twistPeriods n hn) (I*z) := by
  by_cases hz : z∈((twistPeriods n hn)).lattice
  · rw [expE_of_mem (twistPeriods n hn) hz,expE_of_mem (twistPeriods n hn) (I_mul_mem rfl rfl hz),map_zero]
  have hi : I*z ∉ ((twistPeriods n hn)).lattice := by
    intro h
    have e := I_mul_mem (a := realPeriod n) (L := (twistPeriods n hn)) rfl rfl h
    rw [← mul_assoc,I_mul_I,neg_one_mul] at e
    exact hz (neg_mem_iff.mp e)
  have hp := weierstrassP_I_mul (a := realPeriod n) (L := (twistPeriods n hn)) rfl rfl
  have d1 := (hasDerivP (twistPeriods n hn) hi).comp z ((hasDerivAt_id' z).const_mul I)
  have d2 := (hasDerivP (twistPeriods n hn) hz).neg
  have d2' : HasDerivAt (((twistPeriods n hn)).weierstrassP ∘ (fun w : ℂ => I*w)) (-((twistPeriods n hn)).derivWeierstrassP z) z := by
    apply d2.congr_of_eventuallyEq
    filter_upwards with w using hp w
  have ed := d1.unique d2'
  simp only [mul_one] at ed
  have ey : I*(((twistPeriods n hn)).derivWeierstrassP z/2)=((twistPeriods n hn)).derivWeierstrassP (I*z)/2 := by
    linear_combination I/2*ed - (((twistPeriods n hn)).derivWeierstrassP (I*z)/2)*I_sq
  rw [expE_of_notMem (twistPeriods n hn) hz,expE_of_notMem (twistPeriods n hn) hi]
  change WeierstrassCurve.Affine.Point.some _ _ _ = WeierstrassCurve.Affine.Point.some _ _ _
  exact some_eq_some (twistPeriods n hn) (hp z).symm ey
def action (a : GaussianInt) : AddMonoid.End (curveA (twistPeriods n hn)).Point :=
  a.re • AddMonoidHom.id _ + a.im • rot n hn
theorem action_exp (a : GaussianInt) (z : ℂ) :
    action n hn a (expE (twistPeriods n hn) z)=expE (twistPeriods n hn) ((a:ℂ)*z) := by
  change a.re • expE (twistPeriods n hn) z+a.im • rot n hn (expE (twistPeriods n hn) z)=_
  rw [rot_exp,← expE_intCast_mul,← expE_intCast_mul,← expE_add,GaussianInt.toComplex_def]
  congr 1
  ring
end
end TunnellCMToricDivision
end

/- TunnellCMGaussianCRT -/
section
namespace TunnellCMGaussianCRT
open TunnellGaussian
lemma coprime_conj {p : ℕ} (hp : p.Prime) (h2 : p≠2) {z : GaussianInt} (hn : z.norm.natAbs=p) :
    IsCoprime z (star z) := by
  apply (norm_prime hp hn).coprime_iff_not_dvd.mpr
  intro h
  have he : z+star z=((2*z.re:ℤ):GaussianInt) := by ext <;> simp [two_mul]
  have hd : z ∣ ((2*z.re:ℤ):GaussianInt) := he ▸ dvd_add (dvd_refl z) h
  obtain ⟨w,hw⟩ := hd
  have h := congrArg (fun a : GaussianInt => a.norm.natAbs) hw
  have e : (2*z.re.natAbs)^2=p*w.norm.natAbs := by
    have he : Zsqrtd.norm (2:GaussianInt)=4 := by decide
    simp [Zsqrtd.norm_intCast,Int.natAbs_mul,hn,he,sq] at h ⊢
    nlinarith
  have hpow := hp.dvd_of_dvd_pow (show p∣(2*z.re.natAbs)^2 from ⟨_,e⟩)
  have hdv : p∣z.re.natAbs := (hp.dvd_mul.mp hpow).resolve_left
    (fun h => h2 ((Nat.prime_dvd_prime_iff_eq hp Nat.prime_two).mp h))
  have hn' : z.re.natAbs^2+z.im.natAbs^2=p := by simpa [GaussianInt.natAbs_norm_eq,sq] using hn
  have hz : z.re.natAbs=0 := by
    by_contra hh
    have he := Nat.le_of_dvd (Nat.pos_of_ne_zero hh) hdv
    have hp2 := hp.two_le
    nlinarith [sq_nonneg (z.im.natAbs:ℤ),Nat.pow_le_pow_left he 2]
  rw [hz] at hn'
  simp at hn'
  exact Nat.Prime.not_prime_pow (by decide : 2≤2) (hn' ▸ hp)
lemma real_representative {a : GaussianInt} (hc : IsCoprime a (star a)) (b : GaussianInt) :
    ∃ k : ℤ, a∣(b-(k:GaussianInt)) := by
  obtain ⟨u,v,huv⟩ := hc
  let c := b*(v*star a)
  have hreal : ((2*c.re:ℤ):GaussianInt)=c+star c := by ext <;> simp [two_mul]
  refine ⟨2*c.re,?_⟩
  rw [hreal]
  have h1 : a∣(b-c) := by
    refine ⟨b*u,?_⟩
    dsimp [c]
    linear_combination -b*huv
  have h2 : a∣star c := by
    refine ⟨star v*star b,?_⟩
    simp [c,mul_comm,mul_left_comm,mul_assoc]
  simpa [sub_sub] using dvd_sub h1 h2
lemma int_annihilator {a : GaussianInt} (hc : IsCoprime a (star a)) (k : ℤ) :
    a∣(k:GaussianInt) ↔ a.norm∣k := by
  constructor
  · rintro ⟨v,hv⟩
    have hs : star a∣(k:GaussianInt) := ⟨star v,by simpa [mul_comm] using congrArg star hv⟩
    obtain ⟨w,hw⟩ := hc.mul_dvd ⟨v,hv⟩ hs
    rw [← Zsqrtd.norm_eq_mul_conj] at hw
    exact ⟨w.re,by simpa using congrArg Zsqrtd.re hw⟩
  · rintro ⟨l,rfl⟩
    rw [Int.cast_mul,Zsqrtd.norm_eq_mul_conj,mul_assoc]
    exact dvd_mul_right _ _
theorem prime_power_real {p : ℕ} (hp : p.Prime) (h2 : p≠2) {z : GaussianInt} (hn : z.norm.natAbs=p)
    (r : ℕ) : (∀ b : GaussianInt, ∃ k : ℤ, z^r ∣ b-k) ∧
      ∀ k : ℤ, z^r∣(k:GaussianInt) ↔ (p:ℤ)^r∣k := by
  have hc : IsCoprime (z^r) (star (z^r)) := by simpa using (coprime_conj hp h2 hn).pow (m := r) (n := r)
  refine ⟨real_representative hc,fun k => ?_⟩
  have en : (z^r).norm=z.norm^r := map_pow Zsqrtd.normMonoidHom z r
  rw [int_annihilator hc,en,← GaussianInt.abs_natCast_norm z,hn]
end TunnellCMGaussianCRT
end

/- TunnellCMTorsionOrder -/
section
namespace TunnellCMTorsionOrder
open Complex LSG.Weierstrass LSG.LemniscateIndep TunnellCMToricDivision TunnellCMLemniscate TunnellCoates
variable (n : ℕ) (hn : 0<n)
lemma zero_iff (z : ℂ) : expE (twistPeriods n hn) z=0 ↔ z∈((twistPeriods n hn)).lattice := by
  by_cases h : z∈((twistPeriods n hn)).lattice
  · simp [expE_of_mem (twistPeriods n hn) h,h]
  · simp [expE_of_notMem (twistPeriods n hn) h,h]
noncomputable def generator (a : GaussianInt) : (curveA (twistPeriods n hn)).Point := expE (twistPeriods n hn) ((realPeriod n:ℂ)/(a:ℂ))
lemma annihilator {a : GaussianInt} (ha : a≠0) (b : GaussianInt) :
    action n hn b (generator n hn a)=0 ↔ a∣b := by
  have ah : (a:ℂ)≠0 := fun e => ha (GaussianInt.toComplex_eq_zero.mp e)
  have oh : (realPeriod n:ℂ)≠0 := ofReal_ne_zero.mpr (realPeriod_pos (by exact_mod_cast hn)).ne'
  rw [generator,action_exp,zero_iff,mem_lattice_sq (a := realPeriod n) rfl rfl]
  constructor
  · rintro ⟨k,l,he⟩
    refine ⟨⟨k,l⟩,GaussianInt.toComplex_inj.mp ?_⟩
    rw [GaussianInt.toComplex_mul,GaussianInt.toComplex_def' k l]
    field_simp [ah] at he
    simpa only [mul_comm] using he.symm
  · rintro ⟨q,rfl⟩
    refine ⟨q.re,q.im,?_⟩
    rw [GaussianInt.toComplex_mul,GaussianInt.toComplex_def q]
    field_simp [ah]
    <;> ring
lemma add_action (b c : GaussianInt) (P : (curveA (twistPeriods n hn)).Point) :
    action n hn (b-c) P=action n hn b P-action n hn c P := by
  obtain ⟨z,rfl⟩ := TunnellCMTorus.exp_surjective (twistPeriods n hn) P
  rw [action_exp,action_exp,action_exp,GaussianInt.toComplex_sub,sub_mul,sub_eq_add_neg,expE_add,expE_neg]
  rfl
lemma int_action (k : ℤ) (P : (curveA (twistPeriods n hn)).Point) : action n hn (k:GaussianInt) P=k • P := by
  change ((k:GaussianInt).re) • P+((k:GaussianInt).im) • rot n hn P=k • P
  simp
lemma generator_orbit {a : GaussianInt} (ha : a≠0) (P : (curveA (twistPeriods n hn)).Point)
    (hp : action n hn a P=0) : ∃ b, action n hn b (generator n hn a)=P := by
  obtain ⟨z,rfl⟩ := TunnellCMTorus.exp_surjective (twistPeriods n hn) P
  rw [action_exp,zero_iff,mem_lattice_sq (a := realPeriod n) rfl rfl] at hp
  obtain ⟨k,l,h⟩ := hp
  refine ⟨⟨k,l⟩,?_⟩
  rw [generator,action_exp,GaussianInt.toComplex_def']
  congr 1
  have ah : (a:ℂ)≠0 := fun e => ha (GaussianInt.toComplex_eq_zero.mp e)
  field_simp [ah]
  linear_combination h
theorem split_generator {p : ℕ} (hp : p.Prime) (h2 : p≠2) {a : GaussianInt} (h : a.norm.natAbs=p)
    (r : ℕ) : ∃ T : (curveA (twistPeriods n hn)).Point, action n hn (a^r) T=0 ∧
      addOrderOf T=p^r ∧ ∀ P, action n hn (a^r) P=0 → ∃ k : ℤ, k • T=P := by
  have ha0 : a≠0 := by intro he; subst a; exact hp.ne_zero (by simpa using h.symm)
  have ha := pow_ne_zero r ha0
  let T := generator n hn (a^r)
  obtain ⟨hc,hd⟩ := TunnellCMGaussianCRT.prime_power_real hp h2 h r
  have hz (k : ℤ) : k • T=0 ↔ (p:ℤ)^r∣k := by rw [← int_action,annihilator n hn ha,hd]
  refine ⟨T,(annihilator n hn ha _).mpr dvd_rfl,?_,?_⟩
  · apply Nat.dvd_antisymm
    · rw [addOrderOf_dvd_iff_nsmul_eq_zero,← natCast_zsmul,hz,Nat.cast_pow]
    · have e := (hz (addOrderOf T)).mp (by simp)
      exact_mod_cast e
  · intro P hP
    obtain ⟨b,hb⟩ := generator_orbit n hn ha P hP
    obtain ⟨k,hk⟩ := hc b
    have he := (annihilator n hn ha _).mpr hk
    rw [add_action,sub_eq_zero,int_action] at he
    exact ⟨k,he.symm.trans hb⟩
end TunnellCMTorsionOrder
end

/- TunnellCMNormDistribution -/
section
namespace TunnellCMNormDistribution
open LSG.Weierstrass Complex Filter Set TunnellCMLemniscate TunnellCMDivisor
open TunnellCMToricDivision TunnellCMTorsionOrder TunnellCMEllipticUnit TunnellCMDistribution
noncomputable section
variable (n : ℕ) (hn : 0<n)
lemma cm_lattice (q:GaussianInt) {x:ℂ} (hx:x∈((twistPeriods n hn)).lattice) : (q:ℂ)*x∈((twistPeriods n hn)).lattice := by
  rw [← zero_iff,← action_exp,(zero_iff n hn x).mpr hx,map_zero]
end
end TunnellCMNormDistribution
end

/- TunnellCMCriticalTower -/
section
namespace TunnellCMCriticalTower
open Complex LSG.Weierstrass TunnellCMLemniscate TunnellCMNormDistribution TunnellCMDistribution
open TunnellCMCritical TunnellCMUnitTrace TunnellCMLSeries TunnellCMTraceDistribution TunnellCMUnitDistribution
noncomputable section
variable (n : ℕ) (hn : 0<n)
def parameter (q : GaussianInt) (r : ℕ) := ((twistPeriods n hn)).ω₁/(q : ℂ)^r
lemma parameter_torsion {p : ℕ} (q : GaussianInt) (h : q ≠ 0) (hq : q.norm.natAbs=p) (r : ℕ) :
    ((p^r : ℕ) : ℂ)*parameter n hn q r ∈ ((twistPeriods n hn)).lattice := by
  have h' := GaussianInt.toComplex_eq_zero.not.mpr h
  have e : (q : ℂ)*((star q : GaussianInt) : ℂ) = (p : ℂ) := by
    simpa only [map_mul,map_natCast,hq] using congrArg GaussianInt.toComplex (TunnellGaussian.norm_product q)
  have eqn : ((p^r : ℕ) : ℂ)*parameter n hn q r=(((star q)^r : GaussianInt) : ℂ)*((twistPeriods n hn)).ω₁ := by
    rw [parameter,map_pow,Nat.cast_pow,← e,mul_pow]
    field_simp
  rw [eqn]
  exact cm_lattice n hn _ ((twistPeriods n hn)).ω₁_mem_lattice
end
end TunnellCMCriticalTower
end

/- TunnellCMCriticalIntegers -/
section
namespace TunnellCMCriticalIntegers
open WeierstrassCurve WeierstrassCurve.Affine NumberField Complex LSG.Weierstrass
open TunnellCoates TunnellCMLemniscate TunnellCMDistribution TunnellCMEllipticUnit
open TunnellCMCritical TunnellCMUnitTrace TunnellCMLSeries TunnellCMModelUnit TunnellCMAbsoluteUnit
open TunnellCMNormDistribution TunnellCMAlgebraicUnits
open scoped NumberField
noncomputable section
variable (n : ℕ) (hn : 0<n)
lemma model_eq : curve (twistPeriods n hn) = E (n:ℂ) := curve_eq n hn
def uniformize : ℂ →+ (E (n:ℂ)).toAffine.Point :=
  (Point.equivOfEq (model_eq n hn)).toAddMonoidHom.comp (expHom (twistPeriods n hn))
lemma uniformize_apply (z : ℂ) : uniformize n hn z = Point.equivOfEq (model_eq n hn) (expE (twistPeriods n hn) z) := rfl
lemma x_uniformize (z : ℂ) : X (uniformize n hn z) = ((twistPeriods n hn)).weierstrassP z := by
  rw [uniformize_apply,x_equality]
  by_cases h : z ∈ ((twistPeriods n hn)).lattice
  · rw [expE_of_mem (twistPeriods n hn) h,((twistPeriods n hn)).weierstrassP_coe ⟨z,h⟩]; rfl
  · rw [expE_of_notMem (twistPeriods n hn) h]; rfl
lemma torsion_lift {z : ℂ} {m : ℕ} (hm : 0 < m) (h : (m:ℂ)*z ∈ ((twistPeriods n hn)).lattice) :
    ∃ P : (E (n:(algebraicClosure ℚ ℂ))).toAffine.Point, mapPoint (algebraicClosure ℚ ℂ) ℂ n P=uniformize n hn z := by
  apply lift_point
  · rw [x_uniformize]; exact wp_mem n hn hm h
  · by_cases h' : z ∈ ((twistPeriods n hn)).lattice
    · rw [uniformize_apply,expE_of_mem (twistPeriods n hn) h',map_zero]
      exact ((algebraicClosure ℚ ℂ)).zero_mem
    · rw [uniformize_apply,expE_of_notMem (twistPeriods n hn) h',Point.equivOfEq_some]
      exact y_mem n hn hm h h'
end
end TunnellCMCriticalIntegers
end

/- TunnellCMCriticalCoefficients -/
section
namespace TunnellCMCriticalCoefficients
open Complex LSG.Weierstrass WeierstrassCurve WeierstrassCurve.Affine NumberField
open TunnellCoates TunnellKummer TunnellCMDistribution TunnellCMLemniscate
open TunnellCMUnitTrace TunnellCMCritical TunnellCMLSeries TunnellCMCriticalCoordinates
open TunnellCMEllipticUnit TunnellCMCriticalIntegers TunnellCMModelUnit TunnellCMAbsoluteUnit
open TunnellCMAlgebraicUnits TunnellCMCoefficientNorm
open scoped Classical NumberField
noncomputable section
variable (K : Type*) [Field K] [CharZero K] [Algebra K (algebraicClosure ℚ ℂ)] [DecidableEq K]
variable (n : ℕ) (hn : 0<n)
def realize : CurvePoints (E (n:K)) (algebraicClosure ℚ ℂ) →+ (E (n:ℂ)).toAffine.Point :=
  (mapPoint (algebraicClosure ℚ ℂ) ℂ n).comp (Point.equivOfEq (eq_E K (algebraicClosure ℚ ℂ) n)).toAddMonoidHom
end
end TunnellCMCriticalCoefficients
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
lemma cm_comm (n i:F) [(E n).IsElliptic] (hi:i^2= -1) (a b : GaussianInt)
    (P : CurvePoints (E n) L) : cm n i hi a (cm n i hi b P) = cm n i hi b (cm n i hi a P) := by
  simp only [cm_apply,map_add,map_zsmul]
  module
lemma cm_act (n i:F) [(E n).IsElliptic] (hi:i^2= -1) (a : GaussianInt)
    (σ : L ≃ₐ[F] L) (P : CurvePoints (E n) L) :
    cm n i hi a (act (E n) σ P)=act (E n) σ (cm n i hi a P) := by
  simp [cm_apply,map_add,map_zsmul,act_baseI]
lemma cm_map {L' : Type*} [Field L'] [DecidableEq L'] [Algebra F L'] (f : L →ₐ[F] L')
    (n i : F) [(E n).IsElliptic] (hi:i^2= -1) (a : GaussianInt) (P : CurvePoints (E n) L) :
    (Affine.Point.map (W' := (E n).toAffine) f) (cm n i hi a P) =
    cm n i hi a (Affine.Point.map (W' := (E n).toAffine) f P) := by
  have ei : (Affine.Point.map (W' := (E n).toAffine) f) (baseI n i hi P) =
      baseI n i hi (Affine.Point.map (W' := (E n).toAffine) f P) := by
    cases P with
    | zero => rfl
    | some x y h =>
      change Affine.Point.some _ _ _ = Affine.Point.some _ _ _
      rw [Affine.Point.some.injEq]
      exact ⟨map_neg f _,by simp only [map_mul,f.commutes]⟩
  simp only [cm_apply,map_add,map_zsmul,ei]
def coordField (W : WeierstrassCurve F) : CurvePoints W L → IntermediateField F L
  | .zero => ⊥
  | .some x y _ => IntermediateField.adjoin F {x,y}
lemma point_rational (W : WeierstrassCurve F) (P : CurvePoints W L) :
    P ∈ rationalPoints W (coordField W P) := by
  cases P with
  | zero => exact (rationalPoints W _).zero_mem
  | some x y h =>
    exact (rationalPoints_some W h).mpr
      ⟨IntermediateField.subset_adjoin F _ (by simp),IntermediateField.subset_adjoin F _ (by simp)⟩
theorem abelian_of_cyclic [Normal F L] [CharZero F] (n i:F) [(E n).IsElliptic]
    (hi:i^2= -1) (a : GaussianInt) (T : CurvePoints (E n) L) (hT : cm n i hi a T=0)
    (hgen : ∀ P, cm n i hi a P=0 → ∃ b, cm n i hi b T=P) :
    IsAbelianGalois F (coordField (E n) T) := by
  let W := E n
  let K := coordField W T
  have ht : (cm n i hi a).ker ≤ rationalPoints W K := by
    intro P hp
    obtain ⟨b,rfl⟩ := hgen P hp
    obtain ⟨R,hR⟩ := point_rational W T
    exact ⟨cm n i hi b R,by rw [cm_map,hR]⟩
  have hn : Normal F K := by
    cases T with
    | zero => exact inferInstanceAs (Normal F (⊥ : IntermediateField F L))
    | some x y h =>
      apply divisionField_normal W (cm n i hi a) (cm_act n i hi a) h _ ht
      intro σ
      change act (E n) σ (cm n i hi a _) = cm n i hi a _
      rw [hT,map_zero]
  have hg : IsGalois F K := ⟨⟩
  have hfix (σ τ : Gal(L/F)) : act W (σ*τ) T=act W (τ*σ) T := by
    obtain ⟨b,hb⟩ := hgen (act W σ T) (by rw [cm_act,hT,map_zero])
    obtain ⟨c,hc⟩ := hgen (act W τ T) (by rw [cm_act,hT,map_zero])
    rw [act_mul,act_mul,← hc,← hb,← cm_act,← cm_act,← hc,← hb,cm_comm]
  refine { is_comm.comm := ?_ }
  intro σ τ
  obtain ⟨s,rfl⟩ := AlgEquiv.restrictNormalHom_surjective L σ
  obtain ⟨t,rfl⟩ := AlgEquiv.restrictNormalHom_surjective L τ
  rw [← map_mul,← map_mul]
  ext z
  rw [AlgEquiv.restrictNormalHom_apply,AlgEquiv.restrictNormalHom_apply]
  have hz := z.property
  change z.val∈coordField W T at hz
  have he := hfix s t
  cases T with
  | zero =>
    obtain ⟨k,hk⟩ := IntermediateField.mem_bot.mp hz
    rw [← hk]; simp
  | some x y h =>
    have hxy := Affine.Point.some.inj he
    change z.val∈IntermediateField.adjoin F {x,y} at hz
    generalize z.val = v at *
    induction hz using IntermediateField.adjoin_induction with
    | mem u hu =>
      rcases hu with (rfl|hu)
      · exact hxy.1
      · obtain rfl := Set.mem_singleton_iff.mp hu; exact hxy.2
    | algebraMap k => simp
    | add _ _ _ _ h1 h2 => simp only [map_add,h1,h2]
    | mul _ _ _ _ h1 h2 => simp only [map_mul,h1,h2]
    | inv _ _ hh => simp only [map_inv₀,hh]
end
end TunnellCMTorsionField
end

/- TunnellCMAlgebraicKernel -/
section
namespace TunnellCMAlgebraicKernel
open Complex LSG.Weierstrass WeierstrassCurve WeierstrassCurve.Affine
open TunnellCoates TunnellKummer TunnellCMCriticalCoefficients TunnellCMAbsoluteUnit
open TunnellCMCriticalIntegers TunnellCMLemniscate TunnellCMToricDivision
open TunnellCMNormDistribution TunnellCMTorsionField TunnellGaussianEnd
open scoped Classical
noncomputable section
variable (K : Type*) [Field K] [CharZero K] [Algebra K (algebraicClosure ℚ ℂ)] [DecidableEq K]
variable (n : ℕ) (hn : 0<n)
def toric : CurvePoints (E (n:K)) (algebraicClosure ℚ ℂ) →+ (curve (twistPeriods n hn)).toAffine.Point :=
  (Point.equivOfEq (model_eq n hn)).symm.toAddMonoidHom.comp (realize K n)
theorem toric_inj : Function.Injective (toric K n hn) :=
  (Point.equivOfEq _).symm.injective.comp ((mapPoint_injective (algebraicClosure ℚ ℂ) ℂ n).comp (Point.equivOfEq _).injective)
variable [(E (n:K)).IsElliptic] (i : K) (hi : i^2= -1) (hiC : ((algebraMap K (algebraicClosure ℚ ℂ) i:(algebraicClosure ℚ ℂ)):ℂ)=I)
lemma symm_curve {A : Type*} [Field A] [DecidableEq A] {V V' : WeierstrassCurve A} (h : V=V') :
    (Point.equivOfEq h).symm=Point.equivOfEq h.symm := by cases h; rfl
include hiC in
theorem toric_gaussian (q : GaussianInt) (P : CurvePoints (E (n:K)) (algebraicClosure ℚ ℂ)) :
    toric K n hn ((cm (L := (algebraicClosure ℚ ℂ)) (n:K) i hi) q P)=action n hn q (toric K n hn P) := by
  have eqI : toric K n hn (baseI (n:K) i hi P)=rot n hn (toric K n hn P) := by
    cases P with
    | zero =>
      change toric K n hn (baseI (n:K) i hi 0)=rot n hn (toric K n hn 0)
      simp only [map_zero]
    | some x y h =>
      obtain ⟨h',eh⟩ : ∃ h', baseI (n:K) i hi (Point.some x y h)=Point.some (-x) (algebraMap K (algebraicClosure ℚ ℂ) i*y) h' :=
        ⟨_,rfl⟩
      simp only [eh,toric,realize,mapPoint,TunnellCMGlobalModelUnit.pointMap,AddMonoidHom.comp_apply,
        AddEquiv.coe_toAddMonoidHom,symm_curve,Point.equivOfEq_some,Point.map_some]
      change Point.some ((-(x:(algebraicClosure ℚ ℂ)):(algebraicClosure ℚ ℂ)):ℂ) (((algebraMap K (algebraicClosure ℚ ℂ) i)*y:(algebraicClosure ℚ ℂ)):ℂ) _ =
        Point.some (-(x:ℂ)) (I*(y:ℂ)) _
      exact some_eq_some (twistPeriods n hn) rfl (congrArg (·*(y:ℂ)) hiC)
  rw [cm_apply,map_add,map_zsmul,map_zsmul,eqI]
  rfl
end
end TunnellCMAlgebraicKernel
end

/- TunnellLocalTorsionCoords -/
section
namespace TunnellLocalTorsionCoords
open TunnellCMTranscendental Polynomial
open WeierstrassCurve.Affine (Point)
open LSG.Weierstrass
noncomputable section
variable {C:Type} [Field C] [CharZero C] [IsAlgClosed C]
local instance : DecidableEq K := Classical.decEq _
local instance : DecidableEq C := Classical.decEq _
lemma specialize {x : C} (hx : Transcendental ℚ x) : ∃ φ : K →ₐ[ℚ] C, φ Xgeneric=x := by
  let h : F →ₐ[ℚ] C := IsFractionRing.liftAlgHom (transcendental_iff_injective.mp hx)
  obtain ⟨φ,hφ⟩ := IsAlgClosed.surjective_domRestrict_of_isAlgebraic (K := ℚ) (L := F)
    (E := K) (M := C) h
  refine ⟨φ,?_⟩
  change φ.domRestrict F RatFunc.X = x
  change φ.domRestrict F = h at hφ
  rw [hφ,← RatFunc.algebraMap_X]
  simp only [h,IsFractionRing.liftAlgHom_apply,IsFractionRing.lift_algebraMap]
  exact aeval_X x
lemma generic_killed_iff (n a : ℕ) [NeZero n] {x y : C} (hx : Transcendental ℚ x)
    (h : ((E n).baseChange C).toAffine.Nonsingular x y) :
    a • genericPoint n = 0 ↔ a • (Point.some x y h) = 0 := by
  classical
  obtain ⟨φ,hφ⟩ := specialize hx
  let m := Point.map (W' := (E n).toAffine) φ
  have he : a • genericPoint n=0 ↔ a • m (genericPoint n)=0 := by
    rw [← map_nsmul,← map_zero m]
    exact (Point.map_injective (W' := (E n).toAffine) φ).eq_iff.symm
  rw [he]
  have e := (Point.X_eq_iff (h₁ := (((E n).toAffine.baseChange_nonsingular φ.injective ..).mpr
    (generic_nonsingular n))) (h₂ := h)).mp hφ
  change m (genericPoint n)=Point.some x y h ∨ m (genericPoint n)= -Point.some x y h at e
  rcases e with e|e
  · rw [e]
  · rw [e,smul_neg,neg_eq_zero]
lemma generic_not_killed (n a:ℕ) (hn:0<n) (ha:0<a) [NeZero n] : a • genericPoint n≠0 := by
  classical
  let M := TunnellCMLemniscate.twistPeriods n hn
  have eqM : (E n).baseChange ℂ = curve M := (model n ℂ).trans (TunnellCMLemniscate.curve_eq n hn).symm
  obtain ⟨z,hz,haz,hx⟩ := generic_analytic_point M a ha
  intro he
  have h := @TunnellCMTranscendental.generic_killed_iff n a _
  rw [eqM] at h
  have hh := (h hx (nonsingular_weierstrassP M hz)).mp he
  rw [← expE_of_notMem M hz,analytic_killed] at hh
  exact haz hh
theorem algebraic_x {M:Type} [Field M] [CharZero M] [DecidableEq M] (n a:ℕ) (hn:0<n) (ha:0<a)
    {x y:M} (h:((E n).baseChange M).toAffine.Nonsingular x y) (ht:a • Point.some x y h=0) : IsAlgebraic ℚ x := by
  classical
  letI : NeZero n := ⟨hn.ne'⟩
  let B := AlgebraicClosure M
  let e := IsScalarTower.toAlgHom ℚ M B
  have hh := (((E n).toAffine.baseChange_nonsingular e.injective ..).mpr h)
  have hm : a • Point.some (e x) (e y) hh=0 := by
    have hmap := congrArg (Point.map (W':=(E n).toAffine) e) ht
    rwa [map_nsmul,map_zero] at hmap
  by_contra hx
  have hhx : Transcendental ℚ (e x) := fun he => hx ((isAlgebraic_algHom_iff e e.injective).mp he)
  exact generic_not_killed n a hn ha ((generic_killed_iff n a hhx hh).mpr hm)
end
end TunnellLocalTorsionCoords
end

/- TunnellCMDivisionExtension -/
section
namespace TunnellCMDivisionExtension
open Complex LSG.Weierstrass TunnellCMLemniscate TunnellCMToricDivision TunnellCMTorsionField
open WeierstrassCurve TunnellCoates TunnellKummer TunnellGaussianEnd
noncomputable section
variable {F : Type*} [Field F] [CharZero F] [DecidableEq F] [Algebra F ℂ]
lemma rational_kernel (n : ℕ) (hn : 0<n) [(E (n:F)).IsElliptic] (i : F) (hi : i^2 = -1)
    (a : GaussianInt) (ha : a≠0) (P : CurvePoints (E (n:F)) ℂ) (hp : cm (n:F) i hi a P=0) :
    P ∈ rationalPoints (E (n:F)) (algebraicClosure F ℂ) := by
  let m := a.re.natAbs^2+a.im.natAbs^2
  have hpos : 0 < m := by
    by_contra! h
    have h1 : a.re.natAbs^2=0 := by dsimp [m] at h; omega
    have h2 : a.im.natAbs^2=0 := by dsimp [m] at h; omega
    exact ha (Zsqrtd.ext (by simpa using h1) (by simpa using h2))
  let J := baseI (L := ℂ) (n:F) i hi
  have hJ : ∀ x, J (J x)= -x := by
    intro x
    letI : ((E (n:F)).baseChange ℂ).IsElliptic := inferInstanceAs (((E (n:F)).map (algebraMap F ℂ)).IsElliptic)
    exact quarter_sq (base_E (n:F)) _ _ x
  have hnorm : a.re^2+a.im^2=(m:ℤ) := by
    dsimp [m]
    push_cast
    simp [sq,Int.natAbs_mul_self']
  have h := gaussian_kernel_annihilated J hJ a.re a.im hnorm 1 P (by rw [Function.iterate_one]; exact hp)
  rw [pow_one] at h
  cases P with
  | zero => exact (rationalPoints _ _).zero_mem
  | some x y he =>
    apply (rationalPoints_some _ he).mpr
    have hw : (E (n:F)).baseChange ℂ=(TunnellCMTranscendental.E n).baseChange ℂ := by
      rw [base_E,map_natCast,TunnellCMTranscendental.model]
    have hx : IsAlgebraic ℚ x := by
      apply TunnellCMTranscendental.torsion_x_algebraic n m hn hpos
      rw [← hw]
      exact ⟨y,he,h⟩
    have hy : y^2=x^3-(n:ℂ)^2*x := by
      have hh := he.1
      rw [base_E,map_natCast] at hh
      exact (E_equation _ _ _).mp hh
    have hx' := mem_algebraicClosure_iff.mpr (hx.tower_top F)
    let B := algebraicClosure F ℂ
    refine ⟨hx', mem_algebraicClosure_iff.mpr (IsAlgebraic.of_pow (n := 2) (by decide) ?_)⟩
    rw [hy]
    exact mem_algebraicClosure_iff.mp (B.sub_mem (B.pow_mem hx' (3:ℕ)) (B.mul_mem (B.pow_mem (B.natCast_mem n) (2:ℕ)) hx'))
end
end TunnellCMDivisionExtension
end

/- TunnellCMTorsionDegree -/
section
namespace TunnellCMTorsionDegree
open TunnellCoates TunnellKummer TunnellGaussianEnd TunnellCMTorsionField TunnellCMDivisionExtension
open WeierstrassCurve Complex LSG.Weierstrass TunnellCMLemniscate TunnellCMToricDivision
noncomputable section
variable {F L : Type*} [Field F] [Field L] [Algebra F L] [DecidableEq F] [DecidableEq L]
lemma restrict_eq (W : WeierstrassCurve F) (T : CurvePoints W L) [Normal F (coordField W T)]
    (s t : Gal(L/F)) (h : act W s T=act W t T) :
    AlgEquiv.restrictNormalHom (coordField W T) s=AlgEquiv.restrictNormalHom (coordField W T) t := by
  ext z
  rw [AlgEquiv.restrictNormalHom_apply,AlgEquiv.restrictNormalHom_apply]
  have hz := z.property
  cases T with
  | zero =>
    obtain ⟨k,hk⟩ := IntermediateField.mem_bot.mp hz
    rw [← hk]; simp
  | some x y he =>
    have hxy := Affine.Point.some.inj h
    change z.val∈IntermediateField.adjoin F {x,y} at hz
    generalize z.val = v at *
    induction hz using IntermediateField.adjoin_induction with
    | mem u hu =>
      rcases hu with (rfl|hu)
      · exact hxy.1
      · obtain rfl := Set.mem_singleton_iff.mp hu; exact hxy.2
    | algebraMap k => simp
    | add _ _ _ _ h1 h2 => simp only [map_add,h1,h2]
    | mul _ _ _ _ h1 h2 => simp only [map_mul,h1,h2]
    | inv _ _ hh => simp only [map_inv₀,hh]
theorem degree_bound [Normal F L] (W : WeierstrassCurve F) (T : CurvePoints W L)
    [FiniteDimensional F (coordField W T)] [IsGalois F (coordField W T)]
    {m : ℕ} (hm : 0 < m) (hord : addOrderOf T=m)
    (h : ∀ σ : Gal(L/F), ∃ k : ℤ, k • T=act W σ T) :
    Module.finrank F (coordField W T) ≤ m.totient := by
  classical
  let K := coordField W T
  let H := AddSubgroup.zmultiples T
  have hcard : Nat.card H=m := (Nat.card_zmultiples T).trans hord
  letI : Finite H := Nat.finite_of_card_ne_zero (hcard.trans_ne hm.ne')
  letI : Fintype H := Fintype.ofFinite _
  let lift (σ : Gal(K/F)) := (AlgEquiv.restrictNormalHom_surjective L σ).choose
  have spec (σ : Gal(K/F)) : AlgEquiv.restrictNormalHom K (lift σ)=σ :=
    (AlgEquiv.restrictNormalHom_surjective L σ).choose_spec
  let eval (σ : Gal(K/F)) : H := ⟨act W (lift σ) T,AddSubgroup.mem_zmultiples_iff.mpr (h _)⟩
  have he (σ : Gal(K/F)) : addOrderOf (eval σ)=m := by
    have hie := Affine.Point.map_injective (W' := W.toAffine) (lift σ).toAlgHom
    rw [← addOrderOf_injective H.subtype Subtype.val_injective]
    change addOrderOf (act W (lift σ) T)=m
    exact (addOrderOf_injective (act W (lift σ)) hie T).trans hord
  let S := Finset.univ.filter (fun x : H => addOrderOf x=m)
  let f (σ : Gal(K/F)) : S := ⟨eval σ,Finset.mem_filter.mpr ⟨Finset.mem_univ _, he σ⟩⟩
  have hf : Function.Injective f := by
    intro s t hst
    have e := congrArg (fun x : S => x.val.val) hst
    exact (spec s).symm.trans ((restrict_eq W T _ _ e).trans (spec t))
  have hle := Nat.card_le_card_of_injective _ hf
  have hc : S.card=m.totient := IsAddCyclic.card_addOrderOf_eq_totient
    (show m∣Fintype.card H by rw [← Nat.card_eq_fintype_card,hcard])
  rw [← IsGalois.card_aut_eq_finrank F K]
  simpa only [Nat.card_eq_fintype_card (α := S),Fintype.card_coe,hc] using hle
lemma split_on_model {W : WeierstrassCurve ℂ} [W.IsElliptic] (n : ℕ) (hn : 0<n)
    (e : W=E (n:ℂ)) {p : ℕ} (hp : p.Prime) (h2 : p≠2) {a : GaussianInt}
    (ha : a.norm.natAbs=p) (r : ℕ) : ∃ T : W.toAffine.Point,
      endo (quarter e I I_sq) (a^r).re (a^r).im T=0 ∧ addOrderOf T=p^r ∧
      ∀ P, endo (quarter e I I_sq) (a^r).re (a^r).im P=0 → ∃ k : ℤ, k • T=P := by
  have e' : W=curve (twistPeriods n hn) := e.trans (curve_eq n hn).symm
  cases e'
  exact TunnellCMTorsionOrder.split_generator n hn hp h2 ha r
theorem split_field [CharZero F] [Algebra F ℂ] (n : ℕ) (hn : 0<n) [(E (n:F)).IsElliptic]
    (i : F) (hi : i^2= -1) (hI : algebraMap F ℂ i=I) {p : ℕ} (hp : p.Prime)
    (h2 : p≠2) {a : GaussianInt} (ha : a.norm.natAbs=p) (r : ℕ) :
    ∃ T : CurvePoints (E (n:F)) (algebraicClosure F ℂ),
      cm (n:F) i hi (a^r) T=0 ∧ addOrderOf T=p^r ∧
      (∀ P, cm (n:F) i hi (a^r) P=0 → ∃ k : ℤ, k • T=P) ∧
      IsAbelianGalois F (coordField (E (n:F)) T) ∧
      FiniteDimensional F (coordField (E (n:F)) T) ∧
      Module.finrank F (coordField (E (n:F)) T)≤(p^r).totient := by
  classical
  let A := algebraicClosure F ℂ
  let W := E (n:F)
  let f := Affine.Point.map (W' := W.toAffine) A.val
  have hf := Affine.Point.map_injective (W' := W.toAffine) A.val
  have hW : W.baseChange ℂ=E (n:ℂ) := by dsimp [W]; rw [base_E,map_natCast]
  letI : (W.baseChange ℂ).IsElliptic := inferInstanceAs ((W.map (algebraMap F ℂ)).IsElliptic)
  have he : baseI (L := ℂ) (n:F) i hi=quarter hW I I_sq := by
    ext P
    cases P with
    | zero => rfl
    | some x y hh =>
      change Affine.Point.some _ _ _=Affine.Point.some _ _ _
      rw [Affine.Point.some.injEq]
      exact ⟨rfl,congrArg (·*y) hI⟩
  obtain ⟨T,hT,ho,ht⟩ := split_on_model n hn hW hp h2 ha r
  rw [← he] at hT ht
  have ha0 : a≠0 := by intro h; subst a; exact hp.ne_zero (by simpa using ha.symm)
  obtain ⟨U,hU⟩ := rational_kernel n hn i hi (a^r) (pow_ne_zero r ha0) T hT
  have u0 : cm (n:F) i hi (a^r) U=0 := hf (by rw [cm_map,hU]; exact hT.trans (map_zero _).symm)
  have uo : addOrderOf U=p^r := by rw [← addOrderOf_injective _ hf U,hU,ho]
  have ug (P : CurvePoints W A) (hP : cm (n:F) i hi (a^r) P=0) : ∃ k : ℤ, k • U=P := by
    have hh : cm (n:F) i hi (a^r) (f P)=0 := by
      change cm (n:F) i hi (a^r) (Affine.Point.map A.val P)=0
      rw [← cm_map,hP,map_zero]
    obtain ⟨k,hk⟩ := ht (f P) hh
    refine ⟨k,hf ?_⟩
    rw [map_zsmul,hU]
    exact hk
  let K := coordField W U
  have hg : IsAbelianGalois F K := abelian_of_cyclic (n:F) i hi (a^r) U u0 (by
    intro P hP
    obtain ⟨k,rfl⟩ := ug P hP
    exact ⟨(k:GaussianInt),by simp only [cm_apply,Zsqrtd.re_intCast,Zsqrtd.im_intCast,zero_zsmul,add_zero]⟩)
  have hfin : FiniteDimensional F K := by
    cases U with
    | zero => exact inferInstanceAs (FiniteDimensional F (⊥ : IntermediateField F A))
    | some x y hh =>
      change FiniteDimensional F (IntermediateField.adjoin F ({x,y}:Set A))
      exact IntermediateField.finiteDimensional_adjoin (fun z _ => (Algebra.IsAlgebraic.isAlgebraic (R := F) z).isIntegral)
  refine ⟨U,u0,uo,ug,hg,hfin,degree_bound W U (pow_pos hp.pos r) uo ?_⟩
  intro σ
  apply ug
  rw [cm_act,u0,map_zero]
end
end TunnellCMTorsionDegree
end

/- TunnellLocalCMCoordDegree -/
section
namespace TunnellLocalCMCoordDegree
open TunnellCoates TunnellKummer TunnellGaussianEnd TunnellCMTorsionField WeierstrassCurve
noncomputable section
variable {F L B:Type} [Field F] [Field L] [Field B] [Algebra F L] [Algebra F B]
    [DecidableEq F] [DecidableEq L] [DecidableEq B]
lemma coord_map (W : WeierstrassCurve F) (e:L→ₐ[F]B) (P:CurvePoints W L) :
    (coordField W P).map e = coordField W (Affine.Point.map (W':=W.toAffine) e P) := by
  cases P with
  | zero => change (⊥:IntermediateField F L).map e=⊥; simp
  | some x y h =>
    change (IntermediateField.adjoin F {x,y}).map e=IntermediateField.adjoin F {e x,e y}
    rw [IntermediateField.adjoin_map,Set.image_insert_eq,Set.image_singleton]
lemma coord_le (W:WeierstrassCurve F) {P:CurvePoints W L} {A:IntermediateField F L}
    (hp:P∈rationalPoints W A) : coordField W P ≤ A := by
  cases P with
  | zero => exact bot_le
  | some x y h =>
    obtain ⟨hx,hy⟩ := (rationalPoints_some W h).mp hp
    apply IntermediateField.adjoin_le_iff.mpr
    rintro z (rfl|hh)
    · exact hx
    · exact (Set.mem_singleton_iff.mp hh) ▸ hy
lemma finite_coord [CharZero F] (n m : ℕ) (hn : 0 < n) (hm : 0 < m)
    (P:CurvePoints (E (n:F)) L) (ht:m • P=0) : FiniteDimensional F (coordField (E (n:F)) P) := by
  classical
  haveI : CharZero L := charZero_of_injective_algebraMap (algebraMap F L).injective
  cases P with
  | zero => exact inferInstanceAs (FiniteDimensional F (⊥:IntermediateField F L))
  | some x y h =>
    have hW : (E (n:F)).baseChange L=(TunnellCMTranscendental.E n).baseChange L := by
      rw [base_E,map_natCast,TunnellCMTranscendental.model]
    have hx : IsAlgebraic ℚ x := by
      have he : ∃ y, ∃ h' : ((E (n:F)).baseChange L).toAffine.Nonsingular x y, m • Affine.Point.some x y h'=0 := ⟨y,h,ht⟩
      rw [hW] at he
      obtain ⟨_,h',ht'⟩ := he
      exact TunnellLocalTorsionCoords.algebraic_x n m hn hm h' ht'
    have hy : y^2=x^3-(n:L)^2*x := by
      have e := h.1
      rw [base_E,map_natCast] at e
      exact (E_equation _ _ _).mp e
    let B := algebraicClosure F L
    have hx' : x∈B := mem_algebraicClosure_iff.mpr (hx.tower_top F)
    have hy' : IsAlgebraic F y := by
      apply IsAlgebraic.of_pow (n:=2) (by decide)
      rw [hy]
      exact mem_algebraicClosure_iff.mp (B.sub_mem (B.toSubalgebra.pow_mem hx' (3:ℕ)) (B.mul_mem (B.toSubalgebra.pow_mem (B.natCast_mem n) (2:ℕ)) hx'))
    change FiniteDimensional F (IntermediateField.adjoin F {x,y})
    apply IntermediateField.finiteDimensional_adjoin
    rintro z (rfl|h)
    · exact (hx.tower_top F).isIntegral
    · exact (Set.mem_singleton_iff.mp h) ▸ hy'.isIntegral
lemma endo_iterate {G:Type*} [AddCommGroup G] (I:G→+G) (hi:∀x,I (I x)= -x)
    (c:GaussianInt) (r:ℕ) (P:G) :
    (endo I c.re c.im)^[r] P=endo I (c^r).re (c^r).im P := by
  induction r with
  | zero => simp [endo_apply]
  | succ r ih =>
    rw [Function.iterate_succ_apply',ih,pow_succ]
    simp only [endo_apply,Zsqrtd.re_mul,Zsqrtd.im_mul,map_add,map_zsmul,hi]
    module
theorem embeds_division_field [CharZero F] [Algebra F ℂ] (n : ℕ) (hn : 0<n) [(E (n:F)).IsElliptic]
    (i:F) (hi:i^2= -1) (hI:algebraMap F ℂ i=Complex.I) {p : ℕ} (hp:p.Prime)
    (h2:p≠2) {a:GaussianInt} (ha:a.norm.natAbs=p) (r:ℕ)
    (P:CurvePoints (E (n:F)) L) (hk:cm (n:F) i hi (a^r) P=0)
    [FiniteDimensional F (coordField (E (n:F)) P)] :
    ∃ T : CurvePoints (E (n:F)) (algebraicClosure F ℂ),
      cm (n:F) i hi (a^r) T=0 ∧ addOrderOf T=p^r ∧
      IsAbelianGalois F (coordField (E (n:F)) T) ∧
      FiniteDimensional F (coordField (E (n:F)) T) ∧
      Module.finrank F (coordField (E (n:F)) T)≤(p^r).totient ∧
      Nonempty ((coordField (E (n:F)) P) →ₐ[F] (coordField (E (n:F)) T)) := by
  classical
  let W := E (n:F)
  let A := algebraicClosure F ℂ
  let D := coordField W P
  haveI : FiniteDimensional F D := inferInstanceAs (FiniteDimensional F (coordField (E (n:F)) P))
  let e : D→ₐ[F] ℂ := IsAlgClosed.lift
  let f : D→ₐ[F] A := e.codRestrict (algebraicClosure F ℂ).toSubalgebra (fun d =>
    mem_algebraicClosure_iff.mpr ((isAlgebraic_algHom_iff e e.injective).mpr (Algebra.IsAlgebraic.isAlgebraic d)))
  obtain ⟨Q,hQ⟩ := point_rational W P
  change (Affine.Point.map (W':=W.toAffine) D.val) Q=P at hQ
  have he : coordField W Q=⊤ := by
    apply IntermediateField.map_injective D.val
    rw [coord_map,hQ]
    rw [←AlgHom.fieldRange_eq_map,IntermediateField.fieldRange_val]
  let Q' := (Affine.Point.map (W':=W.toAffine) f) Q
  have hkQ : cm (n:F) i hi (a^r) Q=0 := by
    apply Affine.Point.map_injective (W':=W.toAffine) D.val
    rw [cm_map,hQ,hk,map_zero]
  have hk' : cm (n:F) i hi (a^r) Q'=0 := by dsimp [Q']; rw [←cm_map,hkQ,map_zero]
  obtain ⟨T,hT,ho,hgen,hg,hf,hd⟩ := TunnellCMTorsionDegree.split_field n hn i hi hI hp h2 ha r
  obtain ⟨z,hz⟩ := hgen Q' hk'
  have hsub : coordField W Q' ≤ coordField W T := coord_le W (hz ▸ (rationalPoints W _).zsmul_mem (point_rational W T) z)
  have htop : (⊤:IntermediateField F D).map f = coordField W Q' := by rw [←he,coord_map]
  have hfr : f.fieldRange ≤ coordField W T := (by rw [AlgHom.fieldRange_eq_map,htop]; exact hsub)
  exact ⟨T,hT,ho,hg,hf,hd,⟨f.codRestrict _ (fun d => hfr ⟨d,rfl⟩)⟩⟩
end
end TunnellLocalCMCoordDegree
end

/- TunnellCMCoherentPoints -/
section
namespace TunnellCMCoherentPoints
open Complex LSG.Weierstrass WeierstrassCurve WeierstrassCurve.Affine
open TunnellCoates TunnellKummer TunnellCMCriticalCoefficients TunnellCMAlgebraicKernel
open TunnellCMCriticalIntegers TunnellCMAbsoluteUnit TunnellCMLemniscate TunnellCMToricDivision
open TunnellCMNormDistribution TunnellCMTorsionOrder TunnellCMTorsionField TunnellGaussianEnd
open scoped Classical
noncomputable section
variable (K : Type*) [Field K] [CharZero K] [Algebra K (algebraicClosure ℚ ℂ)] [DecidableEq K]
variable (n : ℕ) (hn : 0<n)
variable {p : ℕ} (hp : p.Prime) (q : GaussianInt) (hq : q.norm.natAbs=p)
include hp hq in
lemma exists_point (r : ℕ) : ∃ P : CurvePoints (E (n:K)) (algebraicClosure ℚ ℂ),
    toric K n hn P=generator n hn (q^r) := by
  have hq0 : q≠0 := by rintro rfl; exact hp.ne_zero (by simpa using hq.symm)
  have ht := TunnellCMCriticalTower.parameter_torsion n hn q hq0 hq r
  obtain ⟨U,hU⟩ := torsion_lift n hn (pow_pos hp.pos r) ht
  let P := (Point.equivOfEq (eq_E K (algebraicClosure ℚ ℂ) n)).symm U
  refine ⟨P,?_⟩
  change (Point.equivOfEq _).symm (mapPoint (algebraicClosure ℚ ℂ) ℂ n ((Point.equivOfEq _) ((Point.equivOfEq _).symm U)))=_
  rw [AddEquiv.apply_symm_apply,hU,uniformize_apply,AddEquiv.symm_apply_apply]
  simp only [generator,TunnellCMCriticalTower.parameter,map_pow]
  rfl
def primitive (r : ℕ) := (exists_point K n hn hp q hq r).choose
lemma toric_primitive (r : ℕ) : toric K n hn (primitive K n hn hp q hq r)=generator n hn (q^r) :=
  (exists_point K n hn hp q hq r).choose_spec
variable [(E (n:K)).IsElliptic] (i : K) (hi : i^2= -1) (hiC : ((algebraMap K (algebraicClosure ℚ ℂ) i:(algebraicClosure ℚ ℂ)):ℂ)=I)
include hiC in
theorem generates (h2 : p≠2) (r : ℕ) : (cm (L := (algebraicClosure ℚ ℂ)) (n:K) i hi) (q^r) ((primitive K n hn hp q hq) r)=0 ∧ addOrderOf ((primitive K n hn hp q hq) r)=p^r ∧
      ∀ P : CurvePoints (E (n:K)) (algebraicClosure ℚ ℂ), (cm (L := (algebraicClosure ℚ ℂ)) (n:K) i hi) (q^r) P=0 → ∃ k : ℤ, k • (primitive K n hn hp q hq) r=P := by
  have q0 : q≠0 := by rintro rfl; exact hp.ne_zero (by simpa using hq.symm)
  have qr := pow_ne_zero r q0
  have hT := toric_primitive K n hn hp q hq r
  have hh (a : GaussianInt) (P : CurvePoints (E (n:K)) (algebraicClosure ℚ ℂ)) : (cm (L := (algebraicClosure ℚ ℂ)) (n:K) i hi) a P=0 ↔ action n hn a (toric K n hn P)=0 := by
    rw [← toric_gaussian K n hn i hi hiC,← map_zero (toric K n hn)]
    exact (toric_inj K n hn).eq_iff.symm
  obtain ⟨hc,hd⟩ := TunnellCMGaussianCRT.prime_power_real hp h2 hq r
  have hz (k : ℤ) : k • (primitive K n hn hp q hq) r=0 ↔ (p:ℤ)^r∣k := by
    rw [← (toric_inj K n hn).eq_iff,map_zsmul,map_zero,hT,← int_action,annihilator n hn qr,hd]
  refine ⟨(hh _ _).mpr (hT ▸ (annihilator n hn qr _).mpr dvd_rfl),Nat.dvd_antisymm ?_ ?_,?_⟩
  · rw [addOrderOf_dvd_iff_nsmul_eq_zero,← natCast_zsmul,hz,Nat.cast_pow]
  · exact_mod_cast (hz (addOrderOf ((primitive K n hn hp q hq) r))).mp (by simp)
  · intro P hP
    obtain ⟨b,hb⟩ := generator_orbit n hn qr _ ((hh _ _).mp hP)
    obtain ⟨k,hk⟩ := hc b
    have he := (annihilator n hn qr _).mpr hk
    rw [add_action,sub_eq_zero,int_action] at he
    exact ⟨k,toric_inj K n hn (by rw [map_zsmul,hT]; exact he.symm.trans hb)⟩
end
end TunnellCMCoherentPoints
end

/- TunnellCMCoherentFields -/
section
namespace TunnellCMCoherentFields
open WeierstrassCurve WeierstrassCurve.Affine TunnellCoates TunnellKummer TunnellCMTorsionField
open TunnellCMCoherentPoints TunnellLocalCMCoordDegree TunnellCMTorsionDegree
open scoped Classical
noncomputable section
variable (K : Type) [Field K] [CharZero K] [Algebra K (algebraicClosure ℚ ℂ)] [DecidableEq K]
variable (n : ℕ) (hn : 0<n) [(E (n:K)).IsElliptic]
variable {p : ℕ} (hp : p.Prime) (q : GaussianInt) (hq : q.norm.natAbs=p)
  (i : K) (hi : i^2= -1) (hiC : ((algebraMap K (algebraicClosure ℚ ℂ) i:(algebraicClosure ℚ ℂ)):ℂ)=Complex.I)
abbrev level (r : ℕ) := coordField (E (n:K)) ((primitive K n hn hp q hq) r)
end
end TunnellCMCoherentFields
end

/- TunnellGeometricPrimaryKernel -/
section
namespace TunnellGeometricPrimaryKernel
open TunnellCoates TunnellKummer TunnellGaussianEnd TunnellCMTorsionField WeierstrassCurve
open scoped Classical
noncomputable section
variable {F M:Type} [Field F] [CharZero F] [Field M] [Algebra F M] [Algebra F ℂ]
lemma same_cyclic {G:Type*} [AddCommGroup G] {X Y:G}
    (hy:Y∈AddSubgroup.zmultiples X) (he:addOrderOf X=addOrderOf Y) (hp:0<addOrderOf X) :
    AddSubgroup.zmultiples Y=AddSubgroup.zmultiples X := by
  haveI:Finite (AddSubgroup.zmultiples X):=Nat.finite_of_card_ne_zero (by rw [Nat.card_zmultiples]; exact hp.ne')
  apply AddSubgroup.eq_of_le_of_card_ge
  · rintro _ ⟨k,rfl⟩
    exact (AddSubgroup.zmultiples X).zsmul_mem hy k
  · rw [Nat.card_zmultiples,Nat.card_zmultiples,he]
theorem generates (n:ℕ) (hn:0<n) [(E (n:F)).IsElliptic] (j:F) (hj:j^2= -1) (hI:algebraMap F ℂ j=Complex.I)
    {p:ℕ} (hp:p.Prime) (h₂:p≠2) (a:GaussianInt) (ha:a.norm.natAbs=p) (hnorm:a.re^2+a.im^2=(p:ℤ)) (r:ℕ)
    (S:CurvePoints (E (n:F)) M) (hS:cm (n:F) j hj (a^r) S=0) (ho:addOrderOf S=p^r) :
    ∀ P:CurvePoints (E (n:F)) M,cm (n:F) j hj (a^r) P=0 → P∈AddSubgroup.zmultiples S := by
  classical
  let W:=E (n:F)
  let A:=algebraicClosure F M
  let A':=algebraicClosure F ℂ
  let toC:A→ₐ[F]ℂ:=IsAlgClosed.lift
  let toA:A→ₐ[F]A':=toC.codRestrict A'.toSubalgebra (fun z=>mem_algebraicClosure_iff.mpr
    ((isAlgebraic_algHom_iff toC toC.injective).mpr (Algebra.IsAlgebraic.isAlgebraic z)))
  let g:=Affine.Point.map (W':=W.toAffine) A.val
  let f:=Affine.Point.map (W':=W.toAffine) toA
  have gf:=Affine.Point.map_injective (W':=W.toAffine) A.val
  have ff:=Affine.Point.map_injective (W':=W.toAffine) toA
  have hJ (x:CurvePoints W M) : baseI (n:F) j hj (baseI (n:F) j hj x)= -x := by
    haveI:(W.baseChange M).IsElliptic:=inferInstanceAs ((W.map (algebraMap F M)).IsElliptic)
    exact quarter_sq (base_E (n:F)) _ _ x
  have lift (P:CurvePoints W M) (h:cm (n:F) j hj (a^r) P=0) : ∃ Q:CurvePoints W A,g Q=P := by
    have hiter:(endo (baseI (n:F) j hj) a.re a.im)^[r] P=0:=(TunnellLocalCMCoordDegree.endo_iterate _ hJ a r P).trans h
    have horder:=gaussian_kernel_annihilated _ hJ _ _ hnorm r P hiter
    let D:=coordField W P
    haveI : FiniteDimensional F D:=TunnellLocalCMCoordDegree.finite_coord n _ hn (pow_pos hp.pos r) P horder
    have hsub : D≤A := by
      intro z hz
      exact mem_algebraicClosure_iff.mpr ((isAlgebraic_algHom_iff D.val D.val.injective).mpr (Algebra.IsAlgebraic.isAlgebraic (⟨z,hz⟩:D)))
    obtain ⟨Q,hQ⟩:=point_rational W P
    refine ⟨Affine.Point.map (W':=W.toAffine) (IntermediateField.inclusion hsub) Q,?_⟩
    change Affine.Point.map (W':=W.toAffine) A.val (Affine.Point.map (W':=W.toAffine) (IntermediateField.inclusion hsub) Q)=P
    rw [←hQ]
    cases Q <;> rfl
  have kernel (P:CurvePoints W M) (Q:CurvePoints W A) (hQ:g Q=P) (hp':cm (n:F) j hj (a^r) P=0) :
      cm (n:F) j hj (a^r) (f Q)=0 := by
    have h0:cm (n:F) j hj (a^r) Q=0 := by
      apply gf
      rw [cm_map,show Affine.Point.map A.val Q=P from hQ,hp',map_zero]
    change cm _ _ _ _ (Affine.Point.map toA Q)=0
    rw [←cm_map,h0,map_zero]
  obtain ⟨Y,hY⟩:=lift S hS
  obtain ⟨T,_,hT,ht,_,_,_⟩:=TunnellCMTorsionDegree.split_field n hn j hj hI hp h₂ ha r
  obtain ⟨k,hk⟩:=ht _ (kernel S Y hY hS)
  have hYord : addOrderOf (f Y)=p^r:=by
    rw [addOrderOf_injective f ff,←addOrderOf_injective g gf Y,hY,ho]
  have hZ:=same_cyclic (AddSubgroup.mem_zmultiples_iff.mpr ⟨k,hk⟩) (hT.trans hYord.symm) (hT ▸ pow_pos hp.pos r)
  intro P hP
  obtain ⟨Q,hQ⟩:=lift P hP
  obtain ⟨k,hk⟩:=ht _ (kernel P Q hQ hP)
  have hm:f Q∈AddSubgroup.zmultiples (f Y):=hZ ▸ AddSubgroup.mem_zmultiples_iff.mpr ⟨k,hk⟩
  obtain ⟨m,hm⟩:=AddSubgroup.mem_zmultiples_iff.mp hm
  have hsource:m • Y=Q:=ff (by rw [map_zsmul,hm])
  exact AddSubgroup.mem_zmultiples_iff.mpr ⟨m,by rw [←hQ,←hY,←map_zsmul,hsource]⟩
theorem generates_with [dF:DecidableEq F] [dM:DecidableEq M] (n:ℕ) (hn:0<n) [(E (n:F)).IsElliptic] (j:F) (hj:j^2= -1) (hI:algebraMap F ℂ j=Complex.I)
    {p:ℕ} (hp:p.Prime) (h₂:p≠2) (a:GaussianInt) (ha:a.norm.natAbs=p) (hnorm:a.re^2+a.im^2=(p:ℤ)) (r:ℕ)
    (S:CurvePoints (E (n:F)) M) (hS:cm (n:F) j hj (a^r) S=0) (ho:addOrderOf S=p^r) :
    ∀ P:CurvePoints (E (n:F)) M,cm (n:F) j hj (a^r) P=0 → P∈AddSubgroup.zmultiples S := by
  have eF:dF=Classical.decEq F:=Subsingleton.elim _ _
  have eM:dM=Classical.decEq M:=Subsingleton.elim _ _
  subst dF
  subst dM
  exact generates n hn j hj hI hp h₂ a ha hnorm r S hS ho
end
end TunnellGeometricPrimaryKernel
end

/- TunnellCMAnalyticDivisionField -/
section
namespace TunnellCMAnalyticDivisionField
open Complex LSG.Weierstrass WeierstrassCurve WeierstrassCurve.Affine IntermediateField
open TunnellCoates TunnellKummer TunnellCMTorsionField TunnellCMAlgebraicKernel
open TunnellCMCoherentPoints TunnellCMCoherentFields TunnellCMLemniscate TunnellCMTorsionOrder
open TunnellCMAbsoluteUnit TunnellCMCriticalCoefficients
open scoped Classical
noncomputable section
def analyticLevel (K : Type) [Field K] [Algebra K ℂ] (M : PeriodPair) (q : GaussianInt) (r : ℕ) :
    IntermediateField K (algebraicClosure K ℂ) :=
  let z:=M.ω₁/(q:ℂ)^r
  (adjoin K {M.weierstrassP z,M.derivWeierstrassP z/2}).comap (algebraicClosure K ℂ).val
variable (K : Type) [Field K] [CharZero K] [Algebra K (algebraicClosure ℚ ℂ)] [DecidableEq K]
  [Algebra K ℂ] [IsScalarTower K (algebraicClosure ℚ ℂ) ℂ] (n : ℕ) (hn : 0<n)
theorem analytic_field (P : CurvePoints (E (n:K)) (algebraicClosure ℚ ℂ)) (z : ℂ)
    (h : toric K n hn P=expE (twistPeriods n hn) z) (hz : z∉((twistPeriods n hn)).lattice) :
    (coordField (E (n:K)) P).map (IsScalarTower.toAlgHom K (algebraicClosure ℚ ℂ) ℂ)=
      adjoin K {((twistPeriods n hn)).weierstrassP z, ((twistPeriods n hn)).derivWeierstrassP z/2} := by
  rw [expE_of_notMem (twistPeriods n hn) hz] at h
  cases P with
  | zero =>
    exact ((Point.some_ne_zero _ ) ((map_zero (toric K n hn)).symm.trans h).symm).elim
  | some x y hxy =>
    simp only [toric,realize,mapPoint,TunnellCMGlobalModelUnit.pointMap,AddMonoidHom.comp_apply,
      AddEquiv.coe_toAddMonoidHom,symm_curve,Point.equivOfEq_some,Point.map_some] at h
    have eq:= (Point.some.injEq ..).mp h
    change (adjoin K {x,y}).map _=_
    rw [adjoin_map,Set.image_insert_eq,Set.image_singleton]
    exact congrArg₂ (fun a b : ℂ => adjoin K {a,b}) eq.1 eq.2
variable [(E (n:K)).IsElliptic] (i : K) (hi : i^2= -1) (hiC : ((algebraMap K (algebraicClosure ℚ ℂ) i:(algebraicClosure ℚ ℂ)):ℂ)=I)
variable {p : ℕ} (hp : p.Prime) (h₂ : p≠2) (q : GaussianInt) (hq : q.norm.natAbs=p)
include hi hiC h₂ in
theorem level_field (r : ℕ) :
    let z:=(realPeriod n:ℂ)/(q:ℂ)^(r+1)
    (level K n hn hp q hq (r+1)).map (IsScalarTower.toAlgHom K (algebraicClosure ℚ ℂ) ℂ)=
      adjoin K {((twistPeriods n hn)).weierstrassP z,((twistPeriods n hn)).derivWeierstrassP z/2} := by
  let P:=primitive K n hn hp q hq (r+1)
  let z:=(realPeriod n:ℂ)/(q:ℂ)^(r+1)
  have he : toric K n hn P=expE (twistPeriods n hn) z := by
    simpa only [P,z,generator,map_pow] using toric_primitive K n hn hp q hq (r+1)
  apply analytic_field K n hn P z he
  intro hz
  rw [expE_of_mem (twistPeriods n hn) hz] at he
  have hzP : P=0:=toric_inj K n hn (he.trans (map_zero _).symm)
  have ho : addOrderOf P=p^(r+1):=(generates K n hn hp q hq i hi hiC h₂ (r+1)).2.1
  rw [hzP,addOrderOf_zero] at ho
  exact (one_lt_pow₀ hp.one_lt (Nat.succ_ne_zero r)).ne ho
include hn hi hiC hp h₂ hq in
theorem primitive_field {L : Type} [Field L] [Algebra K L] [DecidableEq L] (e : L →ₐ[K] ℂ)
    (hN : q.re^2+q.im^2=(p:ℤ)) (r : ℕ) (P : CurvePoints (E (n:K)) L)
    (hP : cm (n:K) i hi (q^(r+1)) P=0) (ho : addOrderOf P=p^(r+1)) :
    let z:=(realPeriod n:ℂ)/(q:ℂ)^(r+1)
    (coordField (E (n:K)) P).map e=adjoin K {((twistPeriods n hn)).weierstrassP z,((twistPeriods n hn)).derivWeierstrassP z/2} := by
  let Q:=primitive K n hn hp q hq (r+1)
  let g:=IsScalarTower.toAlgHom K (algebraicClosure ℚ ℂ) ℂ
  let X:=Point.map (W':=((E (n:K))).toAffine) e P
  let Y:=Point.map (W':=((E (n:K))).toAffine) g Q
  have hIC : algebraMap K ℂ i=I:=by rw [IsScalarTower.algebraMap_apply K (algebraicClosure ℚ ℂ) ℂ]; exact hiC
  obtain ⟨hQ,hQ',_⟩:=generates K n hn hp q hq i hi hiC h₂ (r+1)
  have hx : cm (n:K) i hi (q^(r+1)) X=0:=by
    dsimp only [X]; rw [←cm_map,hP,map_zero]
  have hy : cm (n:K) i hi (q^(r+1)) Y=0:=by
    dsimp only [Y,Q]; rw [←cm_map,hQ,map_zero]
  have hox : addOrderOf X=p^(r+1):=(addOrderOf_injective _ (Point.map_injective e) P).trans ho
  have hoy : addOrderOf Y=p^(r+1):=(addOrderOf_injective _ (Point.map_injective g) Q).trans hQ'
  have inc (S T : CurvePoints (E (n:K)) ℂ) (hS : cm (n:K) i hi (q^(r+1)) S=0)
      (hT : cm (n:K) i hi (q^(r+1)) T=0) (ord : addOrderOf T=p^(r+1)) :
      coordField (E (n:K)) S≤coordField (E (n:K)) T := by
    obtain ⟨k,hk⟩:=AddSubgroup.mem_zmultiples_iff.mp
      (TunnellGeometricPrimaryKernel.generates_with n hn i hi hIC hp h₂ q hq hN (r+1) T hT ord S hS)
    exact TunnellLocalCMCoordDegree.coord_le (E (n:K)) (hk ▸ (rationalPoints (E (n:K)) (coordField (E (n:K)) T)).zsmul_mem (point_rational (E (n:K)) T) k)
  exact (TunnellLocalCMCoordDegree.coord_map (E (n:K)) e P).trans
    ((le_antisymm (inc X Y hx hy hoy) (inc Y X hy hx hox)).trans
      ((TunnellLocalCMCoordDegree.coord_map (E (n:K)) g Q).symm.trans (level_field K n hn i hi hiC hp h₂ q hq r)))
include hi hiC hp h₂ hq in
theorem actual_level (hN : q.re^2+q.im^2=(p:ℤ)) (r : ℕ) (P : CurvePoints (E (n:K)) (algebraicClosure K ℂ))
    (hP : cm (n:K) i hi (q^(r+1)) P=0) (ho : addOrderOf P=p^(r+1)) :
    coordField (E (n:K)) P=analyticLevel K (twistPeriods n hn) q (r+1) := by
  have h:=primitive_field K n hn i hi hiC hp h₂ q hq (algebraicClosure K ℂ).val hN r P hP ho
  exact (IntermediateField.comap_map _ _).symm.trans (congrArg (comap (algebraicClosure K ℂ).val) h)
end
end TunnellCMAnalyticDivisionField
end

/- TunnellCMGaussianGround -/
section
namespace TunnellCMGaussianGround
open NumberField IntermediateField Polynomial Complex
open scoped Classical Polynomial NumberField
noncomputable section
def f : ℚ[X] := X^2-C (-1)
lemma monic_f : f.Monic := monic_X_pow_sub_C _ (by decide)
lemma irred_f : Irreducible f := X_pow_sub_C_irreducible_of_prime Nat.prime_two (fun y h => by nlinarith [sq_nonneg y])
lemma root_f : aeval I f=0 := by simp [f]
end
end TunnellCMGaussianGround
end

/- TunnellCMConcreteGaussian -/
section
namespace TunnellCMConcreteGaussian
open Complex Polynomial IntermediateField NumberField TunnellCMGaussianGround
open scoped Classical Polynomial NumberField
noncomputable section
abbrev K := ℚ⟮I⟯
def i : K := ⟨I,subset_adjoin ℚ _ (Set.mem_singleton _)⟩
lemma square : i^2= -1 := K.val.injective I_sq
instance : NumberField K := by
  letI : FiniteDimensional ℚ K := IntermediateField.adjoin.finiteDimensional (show IsIntegral ℚ I from ⟨f,monic_f,root_f⟩)
  exact ⟨⟩
lemma degree : Module.finrank ℚ K=2 := by
  have h:=minpoly.eq_of_irreducible_of_monic irred_f root_f monic_f
  rw [adjoin.finrank ⟨f,monic_f,root_f⟩,←h]
  exact natDegree_X_pow_sub_C
def inclusion : K →ₐ[ℚ] (algebraicClosure ℚ ℂ) :=
  K.val.codRestrict ((algebraicClosure ℚ ℂ)).toSubalgebra (fun x => mem_algebraicClosure_iff'.mpr <|
    (Algebra.IsIntegral.isIntegral (R:=ℚ) x).map K.val)
instance : Algebra K (algebraicClosure ℚ ℂ) := inclusion.toAlgebra
instance : IsScalarTower K (algebraicClosure ℚ ℂ) ℂ := .of_algebraMap_eq' rfl
lemma orientation : ((algebraMap K (algebraicClosure ℚ ℂ) i:(algebraicClosure ℚ ℂ)):ℂ)=I := rfl
end
end TunnellCMConcreteGaussian
end

/- TunnellSplitPadic -/
section
namespace TunnellLocalDivisibility
open Polynomial
theorem split_padic_root {p : ℕ} [Fact p.Prime] (hp : p%4=1) :
    ∃ z : ℤ_[p], z^2 = -1 := by
  have hprime : p.Prime := Fact.out
  obtain ⟨x,hx⟩ := (ZMod.exists_sq_eq_neg_one_iff (p:=p)).2 (by omega)
  have hn : (x.val:ZMod p)^2+1=0 := by rw [ZMod.natCast_zmod_val,sq,←hx]; ring
  have hdiv : p ∣ x.val^2+1 := (ZMod.natCast_eq_zero_iff _ _).mp (by push_cast; exact hn)
  have hxp : p.Coprime x.val := hprime.coprime_iff_not_dvd.mpr (by
    intro h
    have hzero := (ZMod.natCast_eq_zero_iff x.val p).mpr h
    rw [hzero] at hn
    simpa using hn)
  have h2p : p.Coprime 2 := hprime.coprime_iff_not_dvd.mpr (by
    intro h
    have := Nat.le_of_dvd (by decide : 0<2) h
    have := hprime.two_le
    omega)
  let f : Polynomial ℤ := X^2+1
  have hf (a : ℤ_[p]) : f.aeval a = a^2+1 := by simp [f]
  have hd (a : ℤ_[p]) : f.derivative.aeval a = 2*a := by simp [f,show (2 : Polynomial ℤ) = 1 + 1 by norm_num] <;> norm_num
  have hc : ‖f.aeval (x.val:ℤ_[p])‖ < ‖f.derivative.aeval (x.val:ℤ_[p])‖^2 := by
    rw [hf,hd,← Nat.cast_ofNat (R:=ℤ_[p]) (n:=2),← Nat.cast_mul,
      (PadicInt.norm_natCast_eq_one_iff.mpr (h2p.mul_right hxp)),one_pow]
    exact_mod_cast (PadicInt.norm_natCast_lt_one_iff.mpr hdiv)
  obtain ⟨z,hz,_⟩ := hensels_lemma hc
  exact ⟨z,eq_neg_of_add_eq_zero_left ((hf z).symm.trans hz)⟩
end TunnellLocalDivisibility
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
end TunnellPadicDivisionSeries
end

/- TunnellOrientedSplit -/
section
namespace TunnellOrientedSplit
open IsLocalRing TunnellLocalDivisibility TunnellPadicDivisionSeries TunnellCoates TunnellGaussianEnd
open WeierstrassCurve
variable {p:ℕ} [Fact p.Prime]
theorem choose_factor {S:Type*} [CommRing S] [IsLocalRing S] (i:S) (hi:i^2= -1)
    (hp:p%4=1) (hp₀:(p:S)∈maximalIdeal S) (hJ₂:(p:S)∉maximalIdeal S^2) :
    ∃ π:GaussianInt, π.norm.natAbs=p ∧ π.re^2+π.im^2=(p:ℤ) ∧
      (π.re:S)+(π.im:S)*i∈maximalIdeal S ∧ IsUnit ((π.re:S)-(π.im:S)*i) := by
  obtain ⟨a,b,hab⟩ := Nat.Prime.sq_add_sq (p:=p) (by omega)
  have hsum : (a:ℤ)^2+(b:ℤ)^2=(p:ℤ) := by exact_mod_cast hab
  have hf : ((a:S)+(b:S)*i)*((a:S)-(b:S)*i)=(p:S) := by
    have e : (a:S)^2+(b:S)^2=(p:S) := by simpa using congrArg (fun k:ℕ => (k:S)) hab
    linear_combination e - (b:S)^2*hi
  have hboth : ¬(((a:S)+(b:S)*i)∈maximalIdeal S ∧ (a:S)-(b:S)*i∈maximalIdeal S) := by
    rintro ⟨h₁,h₂⟩
    apply hJ₂
    rw [←hf,pow_two]
    exact Ideal.mul_mem_mul h₁ h₂
  have h₀ := (inferInstance : (maximalIdeal S).IsPrime).mem_or_mem (show ((a:S)+(b:S)*i)*((a:S)-(b:S)*i)∈ maximalIdeal S by rw [hf]; exact hp₀)
  rcases h₀ with h|h
  · let π : GaussianInt := ⟨a,b⟩
    refine ⟨π,?_,hsum,by simpa only [π,Int.cast_natCast] using h,?_⟩
    · have hh : π.norm=(p:ℤ) := by rw [Zsqrtd.norm_def]; change _=_; dsimp [π]; linear_combination hsum
      simp [hh]
    · by_contra h'
      exact hboth ⟨h,by change ¬ IsUnit _; simpa only [π,Int.cast_natCast] using h'⟩
  · let π : GaussianInt := ⟨a,-b⟩
    have hh : π.re^2+π.im^2=(p:ℤ) := by simpa [π] using hsum
    refine ⟨π,?_,hh,?_,?_⟩
    · have hx : π.norm=(p:ℤ) := by rw [Zsqrtd.norm_def]; dsimp [π]; linear_combination hsum
      simp [hx]
    · simpa [π,sub_eq_add_neg] using h
    · by_contra h'; exact hboth ⟨by simpa [π] using h',h⟩
theorem integral_root (hp:p%4=1) : ∃ i:(IntegerRing p), i^2= -1 := by
  obtain ⟨z,hz⟩ := split_padic_root hp
  let e := localIntegralEquiv p
  exact ⟨e.symm z, (map_pow e.symm z 2).symm.trans ((congrArg e.symm hz).trans
    ((map_neg e.symm 1).trans (congrArg Neg.neg (map_one e.symm))))⟩
theorem factor (hp : p%4=1) :
    ∃ (i:(IntegerRing p)) (π:GaussianInt), i^2= -1 ∧ π.norm.natAbs=p ∧
      π.re^2+π.im^2=(p:ℤ) ∧ (π.re:(IntegerRing p))+(π.im:(IntegerRing p))*i∈maximalIdeal (IntegerRing p) ∧ IsUnit ((π.re:(IntegerRing p))-(π.im:(IntegerRing p))*i) := by
  obtain ⟨i,hi⟩ := integral_root hp
  obtain ⟨hJ,hJ₂⟩ := base_uniformizer (p:=p)
  have hp₀ : (p:(IntegerRing p))∈maximalIdeal (IntegerRing p) := by rw [hJ]; exact Ideal.mem_span_singleton_self _
  obtain ⟨π,h₁,h₂,h₃,h₄⟩ := choose_factor i hi hp hp₀ hJ₂
  exact ⟨i,π,hi,h₁,h₂,h₃,h₄⟩
end TunnellOrientedSplit
end

/- TunnellPreparedRootPlace -/
section
namespace TunnellPreparedRootPlace
open IsLocalRing IsDedekindDomain IsDedekindDomain.HeightOneSpectrum Polynomial
open scoped Polynomial
theorem degree_lower {F K N D : Type*} [Field F] [Field K] [Field N] [Field D]
    [Algebra F K] [Algebra F D] [Algebra F N] [Algebra K N] [IsScalarTower F K N]
    [FiniteDimensional F D] (f:D→ₐ[F]N) (z:D) :
    (minpoly K (f z)).natDegree ≤ Module.finrank F D := by
  have hmap := minpoly.dvd_map_of_isScalarTower F K (f z)
  have hI : IsIntegral F z := IsIntegral.of_finite F z
  rw [minpoly.algHom_eq f f.injective] at hmap
  have hm := (minpoly.monic hI).map (algebraMap F K)
  have h₁ := Polynomial.natDegree_le_of_dvd hmap hm.ne_zero
  rw [(minpoly.monic hI).natDegree_map (algebraMap F K)] at h₁
  exact h₁.trans (minpoly.natDegree_le (A:=F) (x:=z))
end TunnellPreparedRootPlace
end

/- TunnellRestrictedPlaces -/
section
namespace TunnellRestrictedPlaces
open NumberField IsLocalRing IsDedekindDomain IsDedekindDomain.HeightOneSpectrum WithZero
open scoped NumberField
noncomputable section
variable {D B M:Type*} [Field D] [NumberField D] [CommRing B] [IsDomain B] [IsDiscreteValuationRing B]
    [Field M] [Algebra B M] [IsFractionRing B M]
theorem integral_lift (φ:D→+*M) :
    ∃ ψ:𝓞 D→+*B,∀ x:𝓞 D,algebraMap B M (ψ x)=φ (x:D) := by
  let g:=φ.comp (algebraMap (𝓞 D) D)
  have hl (x:𝓞 D) : ∃ y:B,algebraMap B M y=g x := by
    have h : IsIntegral ℤ (φ (x:D)) := x.property.map φ.toIntAlgHom
    exact IsIntegrallyClosed.isIntegral_iff.mp h.tower_top
  let l (x:𝓞 D) := (hl x).choose
  have e (x:𝓞 D) : algebraMap B M (l x)=g x := (hl x).choose_spec
  have inj := IsFractionRing.injective B M
  let ψ : 𝓞 D→+*B := {
    toFun := l
    map_one' := inj (by rw [map_one,e,map_one])
    map_zero' := inj (by rw [map_zero,e,map_zero])
    map_mul' x y := inj (by rw [map_mul,e,e,e,map_mul])
    map_add' x y := inj (by rw [map_add,e,e,e,map_add]) }
  exact ⟨ψ,e⟩
structure Restriction (φ:D→+*M) where
  v : HeightOneSpectrum (𝓞 D)
  ψ : 𝓞 D→+*B
  compat (x:𝓞 D) : algebraMap B M (ψ x)=φ (x:D)
  prime : v.asIdeal=(maximalIdeal B).comap ψ
  e : ℕ
  pos : 0<e
  valuation (x:D) : v.valuation D x^e=(IsDiscreteValuationRing.maximalIdeal B).valuation M (φ x)
theorem restrict (φ:D→+*M) {p:ℕ} (hp:p≠0) (hpm:(p:B)∈maximalIdeal B) : Nonempty (Restriction (B:=B) φ) := by
  obtain ⟨ψ,hψ⟩ := integral_lift (B:=B) φ
  let w:=IsDiscreteValuationRing.maximalIdeal B
  have hne : w.asIdeal.comap ψ≠⊥ := by
    intro e
    have hh : (p:𝓞 D)∈w.asIdeal.comap ψ := by change ψ (p:𝓞 D)∈maximalIdeal B; rw [map_natCast]; exact hpm
    rw [e,Ideal.mem_bot] at hh
    exact hp (Nat.cast_eq_zero.mp hh)
  let v:=comapOfNeBot ψ w hne
  letI : Algebra (𝓞 D) B := ψ.toAlgebra
  letI : Algebra D M := φ.toAlgebra
  letI : Algebra (𝓞 D) M := (φ.comp (algebraMap (𝓞 D) D)).toAlgebra
  haveI : IsScalarTower (𝓞 D) D M := .of_algebraMap_eq' rfl
  haveI : IsScalarTower (𝓞 D) B M := .of_algebraMap_eq (fun x => (hψ x).symm)
  have hψi : Function.Injective ψ := fun x y e => (IsFractionRing.injective (𝓞 D) D)
    (φ.injective ((hψ x).symm.trans ((congrArg (algebraMap B M) e).trans (hψ y))))
  haveI : Module.IsTorsionFree (𝓞 D) B := Module.isTorsionFree_iff_algebraMap_injective.mpr hψi
  haveI : w.asIdeal.LiesOver v.asIdeal := ⟨rfl⟩
  let e:=v.asIdeal.ramificationIdx' w.asIdeal
  have he (x:D):v.valuation D x^e=w.valuation M (φ x) := valuation_liesOver M v w x
  have hp₀ : 0<e := by
    apply Nat.pos_of_ne_zero
    intro hz
    have hh := he (p:D)
    rw [hz,pow_zero,map_natCast] at hh
    have hlt : w.valuation M (p:M)<1 := by
      rw [←map_natCast (algebraMap B M) p,valuation_of_algebraMap,intValuation_lt_one_iff_mem]
      exact hpm
    exact hlt.ne hh.symm
  exact ⟨⟨v,ψ,hψ,rfl,e,hp₀,he⟩⟩
theorem uniformizer_restriction (φ:D→+*M) (s:Restriction (B:=B) φ) {p:ℕ} (hp:p≠0)
    (hspan:maximalIdeal B=Ideal.span {(p:B)}) : s.v.valuation D (p:D)=exp (-1:ℤ) := by
  haveI : CharZero M := charZero_of_injective_ringHom φ.injective
  haveI : CharZero B := (algebraMap B M).charZero
  have h := s.valuation (p:D)
  rw [map_natCast φ p,←map_natCast (algebraMap B M) p,valuation_of_algebraMap,
    (IsDiscreteValuationRing.maximalIdeal B).intValuation_singleton (Nat.cast_ne_zero.mpr hp) hspan] at h
  have he := congrArg (WithZero.log : ℤᵐ⁰→ℤ) h
  rw [log_pow,log_exp,Int.nsmul_eq_mul] at he
  have hdiv : (s.e:ℤ)∣-1 := ⟨_,he.symm⟩
  have he₁ : s.e=1 := by
    have hnat := Int.natAbs_dvd_natAbs.mpr hdiv
    simpa using hnat
  rwa [he₁,pow_one] at h
theorem equal_values (φ:D→+*M) (s:Restriction (B:=B) φ) (t:D) (z:B)
    (hz:φ t=algebraMap B M z) {p d:ℕ} (u:Bˣ) (hr:z^d=(p:B)*u) :
    (s.v.valuation D t)^d=s.v.valuation D (p:D) := by
  let w:=IsDiscreteValuationRing.maximalIdeal B
  have hu : w.intValuation (u:B)=1 := by simp [w,IsDiscreteValuationRing.maximalIdeal]
  apply (pow_left_inj₀ zero_le zero_le s.pos.ne').mp
  rw [←pow_mul,Nat.mul_comm,pow_mul,s.valuation,s.valuation,hz,map_natCast φ p,←map_natCast (algebraMap B M) p]
  rw [valuation_of_algebraMap,valuation_of_algebraMap,←map_pow,hr,map_mul,hu,mul_one]
variable {F A K:Type*} [Field F] [NumberField F] [Algebra F D]
    [CommRing A] [IsDomain A] [IsDiscreteValuationRing A] [Field K] [Algebra A K] [IsFractionRing A K]
theorem restrict_liesOver (f:F→+*K) (g:D→+*M) (s:Restriction (B:=A) f) (t:Restriction (B:=B) g)
    (μ:K→+*M) (f₀:A→+*B) [IsLocalHom f₀]
    (hc:∀ x:A,algebraMap B M (f₀ x)=μ (algebraMap A K x))
    (he:∀ x:F,g (algebraMap F D x)=μ (f x)) :
    t.v.asIdeal.LiesOver s.v.asIdeal := by
  constructor
  ext x
  rw [s.prime,t.prime]
  change s.ψ x∈maximalIdeal A ↔ t.ψ (algebraMap (𝓞 F) (𝓞 D) x)∈maximalIdeal B
  have eq : t.ψ (algebraMap (𝓞 F) (𝓞 D) x)=f₀ (s.ψ x) := by
    apply IsFractionRing.injective B M
    rw [t.compat,hc,s.compat,←he]
    rfl
  rw [eq]
  change ¬IsUnit _ ↔ ¬IsUnit _
  rw [isUnit_map_iff f₀]
end
end TunnellRestrictedPlaces
end

/- TunnellCMOrientedPlace -/
section
namespace TunnellCMOrientedPlace
open TunnellCMCoefficientCompletion TunnellPadicDivisionSeries TunnellLocalDivisibility IsLocalRing
noncomputable section
theorem base_place {K : Type} [Field K] [NumberField K] {p : ℕ} [Fact p.Prime] (g : K →+* Local p) :
    Nonempty (TunnellRestrictedPlaces.Restriction (B:=IntegerRing p) g) := by
  have h : (p:IntegerRing p)∈maximalIdeal _ := by rw [(base_uniformizer (p:=p)).1]; exact Ideal.mem_span_singleton_self _
  exact TunnellRestrictedPlaces.restrict g (Fact.out : p.Prime).ne_zero h
end
end TunnellCMOrientedPlace
end

/- TunnellGaussianPrimeIdeal -/
section
namespace TunnellGaussianPrimeIdeal
open NumberField IsDedekindDomain IsDedekindDomain.HeightOneSpectrum IsLocalRing
open scoped Classical
noncomputable section
variable {F:Type} [Field F] [NumberField F]
def integralI (j:F) (hj:j^2= -1) : 𝓞 F:=⟨j,IsIntegral.of_pow (n:=2) (by decide) (by rw [hj]; exact isIntegral_one.neg)⟩
theorem norm_factor (hdeg:Module.finrank ℚ F=2) (j:F) (hj:j^2= -1) (a b:ℤ) :
    Algebra.norm ℚ ((a:F)+(b:F)*j)=(a:ℚ)^2+(b:ℚ)^2 := by
  letI:Algebra.IsQuadraticExtension ℚ F:=⟨hdeg⟩
  have hbot:j∉(⊥:IntermediateField ℚ F) := by
    rintro ⟨x,hx⟩
    change algebraMap ℚ F x=j at hx
    have hsq:x^2= -1:= (algebraMap ℚ F).injective (by rw [map_pow,hx,hj,map_neg,map_one])
    nlinarith [sq_nonneg x]
  have hnf:= (IsGalois.mem_bot_iff_fixed j).not.mp hbot
  obtain ⟨g,hg⟩:=not_forall.mp hnf
  have hgj:g j= -j:= (sq_eq_sq_iff_eq_or_eq_neg.mp (by rw [←map_pow,hj,map_neg,map_one])).resolve_left hg
  have hg₁:g≠1:=by rintro rfl; exact hg rfl
  have hcard:Fintype.card Gal(F/ℚ)=2:=(Nat.card_eq_fintype_card.symm.trans (IsGalois.card_aut_eq_finrank ℚ F)).trans hdeg
  have hs:({1,g}:Finset Gal(F/ℚ))=Finset.univ:=by
    apply Finset.eq_of_subset_of_card_le (Finset.subset_univ _)
    simp [hcard,hg₁.symm]
  apply (algebraMap ℚ F).injective
  rw [Algebra.norm_eq_prod_automorphisms,←hs,Finset.prod_insert (by simpa using hg₁.symm),Finset.prod_singleton]
  simp only [AlgEquiv.one_apply,map_add,map_pow,map_intCast,map_mul,hgj]
  linear_combination -(b:F)^2*hj
theorem absNorm_factor (hdeg:Module.finrank ℚ F=2) (j:F) (hj:j^2= -1) (a b:ℤ) {p:ℕ} (hn:a^2+b^2=(p:ℤ)) :
    Ideal.absNorm (Ideal.span ({(a:𝓞 F)+(b:𝓞 F)*integralI j hj}:Set (𝓞 F)))=p := by
  rw [Ideal.absNorm_span_singleton]
  have hh:Algebra.norm ℤ ((a:𝓞 F)+(b:𝓞 F)*integralI j hj)=(p:ℤ) := by
    apply (Int.cast_injective (α:=ℚ))
    rw [Algebra.coe_norm_int]
    change Algebra.norm ℚ ((a:F)+(b:F)*j)=((p:ℤ):ℚ)
    rw [norm_factor hdeg j hj]
    exact_mod_cast hn
  rw [hh,Int.natAbs_natCast]
theorem unique (hdeg:Module.finrank ℚ F=2) (j:F) (hj:j^2= -1) (a b:ℤ) {p:ℕ} (hp:p.Prime) (hn:a^2+b^2=(p:ℤ))
    (v:HeightOneSpectrum (𝓞 F)) (hv:(a:𝓞 F)+(b:𝓞 F)*integralI j hj∈v.asIdeal)
    (u:HeightOneSpectrum (𝓞 F)) (hu:u≠v) : (a:𝓞 F)+(b:𝓞 F)*integralI j hj∉u.asIdeal := by
  let I:=Ideal.span ({(a:𝓞 F)+(b:𝓞 F)*integralI j hj}:Set (𝓞 F))
  have hI:Ideal.absNorm I=p:=absNorm_factor hdeg j hj a b hn
  have hprime:I.IsPrime:=Ideal.isPrime_of_irreducible_absNorm (hI ▸ hp.prime.irreducible)
  have hmax:I.IsMaximal:=hprime.isMaximal (by intro hh; rw [hh,Ideal.absNorm_bot] at hI; exact hp.ne_zero hI.symm)
  intro hh
  exact hu (HeightOneSpectrum.ext ((hmax.eq_of_le u.isMaximal.ne_top ((Ideal.span_singleton_le_iff_mem _).mpr hh)).symm.trans
    (hmax.eq_of_le v.isMaximal.ne_top ((Ideal.span_singleton_le_iff_mem _).mpr hv))))
end
end TunnellGaussianPrimeIdeal
end

/- TunnellCMConcreteOrientation -/
section
namespace TunnellCMConcreteOrientation
open Complex NumberField IntermediateField IsDedekindDomain IsLocalRing Polynomial
open TunnellCMConcreteGaussian TunnellCoates TunnellLocalDivisibility TunnellPadicDivisionSeries TunnellGaussianPrimeIdeal
open scoped Classical NumberField
noncomputable section
variable {p : ℕ} [Fact p.Prime]
theorem embedding (j:IntegerRing p) (hj:j^2= -1) :
    ∃ g : K→+*Local p, g i=(j:Local p) := by
  haveI : CharZero (Local p):=charZero_of_injective_ringHom (algebraMap ℚ (Local p)).injective
  have hi : IsIntegral ℚ I:=⟨TunnellCMGaussianGround.f,TunnellCMGaussianGround.monic_f,TunnellCMGaussianGround.root_f⟩
  have hm:=minpoly.eq_of_irreducible_of_monic TunnellCMGaussianGround.irred_f TunnellCMGaussianGround.root_f TunnellCMGaussianGround.monic_f
  have hd : (j:(Local p))^2= -1:=congrArg Subtype.val hj
  let x : {z:(Local p) // z ∈ (minpoly ℚ I).aroots (Local p)}:=⟨j,by
    rw [mem_aroots]
    refine ⟨minpoly.ne_zero hi,?_⟩
    rw [←hm]
    simp [TunnellCMGaussianGround.f,hd]⟩
  exact ⟨((algHomAdjoinIntegralEquiv ℚ hi).symm x).toRingHom,
    algHomAdjoinIntegralEquiv_symm_apply_gen ℚ hi x⟩
theorem norm_equation (q:GaussianInt) (hn:q.norm.natAbs=p) : q.re^2+q.im^2=(p:ℤ) := by
  have e : q.norm=(p:ℤ):=(Int.natAbs_of_nonneg (GaussianInt.norm_nonneg _)).symm.trans (congrArg (fun x:ℕ=>(x:ℤ)) hn)
  simpa [Zsqrtd.norm,pow_two] using e
theorem oriented (hmod:p%4=1) (q:GaussianInt) (hn:q.re^2+q.im^2=(p:ℤ)) :
    ∃ (g : K →+* Local p) (v:TunnellRestrictedPlaces.Restriction (B:=IntegerRing p) g) (j:IntegerRing p),
      j^2= -1 ∧ g i=(j:Local p) ∧ (q.re:(IntegerRing p))+(q.im:(IntegerRing p))*j∈maximalIdeal (IntegerRing p) ∧ IsUnit ((q.re:(IntegerRing p))-(q.im:(IntegerRing p))*j) := by
  obtain ⟨j,_,hj,_,_,_,_⟩:=TunnellOrientedSplit.factor hmod
  have e : (q.re:(IntegerRing p))^2+(q.im:(IntegerRing p))^2=(p:(IntegerRing p)):=by simpa using congrArg (fun z:ℤ=>(z:(IntegerRing p))) hn
  obtain ⟨hJ,h₂⟩:=base_uniformizer (p:=p)
  have hpm : (p:(IntegerRing p))∈maximalIdeal (IntegerRing p):=by rw [hJ]; exact Ideal.mem_span_singleton_self _
  have hf : ((q.re:(IntegerRing p))+(q.im:(IntegerRing p))*j)*((q.re:(IntegerRing p))-(q.im:(IntegerRing p))*j)=(p:(IntegerRing p)):=by linear_combination e-(q.im:(IntegerRing p))^2*hj
  have hboth : ¬((q.re:(IntegerRing p))+(q.im:(IntegerRing p))*j∈maximalIdeal (IntegerRing p) ∧ (q.re:(IntegerRing p))-(q.im:(IntegerRing p))*j∈maximalIdeal (IntegerRing p)):=by
    rintro ⟨h₁,h₃⟩
    apply h₂
    rw [←hf,pow_two]
    exact Ideal.mul_mem_mul h₁ h₃
  have choose (y:(IntegerRing p)) (hy:y^2= -1) (h:(q.re:(IntegerRing p))+(q.im:(IntegerRing p))*y∈maximalIdeal (IntegerRing p)) (hu:IsUnit ((q.re:(IntegerRing p))-(q.im:(IntegerRing p))*y)) :
      ∃ (g : K →+* Local p) (v:TunnellRestrictedPlaces.Restriction (B:=IntegerRing p) g) (j:IntegerRing p),
        j^2= -1 ∧ g i=(j:Local p) ∧ (q.re:(IntegerRing p))+(q.im:(IntegerRing p))*j∈maximalIdeal (IntegerRing p) ∧ IsUnit ((q.re:(IntegerRing p))-(q.im:(IntegerRing p))*j) := by
    obtain ⟨g,hg⟩:=embedding y hy
    obtain ⟨v⟩:=TunnellCMOrientedPlace.base_place g
    exact ⟨g,v,y,hy,hg,h,hu⟩
  rcases (inferInstance : (maximalIdeal (IntegerRing p)).IsPrime).mem_or_mem (show ((q.re:(IntegerRing p))+(q.im:(IntegerRing p))*j)*((q.re:(IntegerRing p))-(q.im:(IntegerRing p))*j)∈maximalIdeal (IntegerRing p) by rw [hf]; exact hpm) with hp|hm
  · apply choose j hj hp
    by_contra hu
    exact hboth ⟨hp,hu⟩
  · apply choose (-j) (by simpa using hj) (by simpa [sub_eq_add_neg] using hm)
    by_contra hu
    exact hboth ⟨by simpa [sub_eq_add_neg] using hu,hm⟩
end
end TunnellCMConcreteOrientation
end

/- TunnellPrimitiveCoordField -/
section
namespace TunnellPrimitiveCoordField
open IsLocalRing IsDedekindDomain IsDedekindDomain.HeightOneSpectrum WeierstrassCurve WeierstrassCurve.Affine
open TunnellCoates TunnellKummer TunnellCMTorsionField TunnellFormalQuarter TunnellGaussianEnd
open scoped Polynomial
noncomputable section
theorem equal_degrees {F K M:Type} [Field F] [Field K] [Field M] [CharZero F] [Algebra F ℂ]
    [Algebra F K] [Algebra F M] [Algebra K M] [IsScalarTower F K M] [DecidableEq F] [DecidableEq M]
    (n:ℕ) (hn:0<n) [(E (n:F)).IsElliptic] (i:F) (hi:i^2= -1) (hI:algebraMap F ℂ i=Complex.I)
    {p:ℕ} (hp:p.Prime) (h₂:p≠2) {a:GaussianInt} (ha:a.norm.natAbs=p) (r:ℕ)
    (P:CurvePoints (E (n:F)) M) (hk:cm (n:F) i hi (a^r) P=0) (hord:p^r • P=0)
    (t:M) (ht:t∈coordField (E (n:F)) P) (hd:(minpoly K t).natDegree=(p^r).totient) :
    Module.finrank F (coordField (E (n:F)) P)=(p^r).totient ∧
    ∃ T : CurvePoints (E (n:F)) (algebraicClosure F ℂ),
      cm (n:F) i hi (a^r) T=0 ∧ addOrderOf T=p^r ∧
      IsAbelianGalois F (coordField (E (n:F)) T) ∧
      Module.finrank F (coordField (E (n:F)) T)=(p^r).totient ∧
      Nonempty (coordField (E (n:F)) P ≃ₐ[F] coordField (E (n:F)) T) := by
  classical
  have hfin := TunnellLocalCMCoordDegree.finite_coord n (p^r) hn (pow_pos hp.pos _) P hord
  obtain ⟨T,hT,ho,hg,hf,hd',⟨f⟩⟩ := TunnellLocalCMCoordDegree.embeds_division_field n hn i hi hI hp h₂ ha r P hk
  let D := coordField (E (n:F)) P
  let z:D := ⟨t,ht⟩
  have hle : (p^r).totient≤Module.finrank F D := by
    rw [←hd]
    exact TunnellPreparedRootPlace.degree_lower (K:=K) D.val z
  have htD := LinearMap.finrank_le_finrank_of_injective (f:=f.toLinearMap) f.injective
  have h1 := le_antisymm (htD.trans hd') hle
  have h2 := le_antisymm hd' (hle.trans htD)
  refine ⟨h1,T,hT,ho,hg,h2,⟨AlgEquiv.ofBijective f ⟨f.injective,?_⟩⟩⟩
  exact (LinearMap.injective_iff_surjective_of_finrank_eq_finrank (f:=f.toLinearMap) (h1.trans h2.symm)).mp f.injective
end
end TunnellPrimitiveCoordField
end

/- TunnellGlobalTotalRamification -/
section
namespace TunnellGlobalTotalRamification
open NumberField IsLocalRing IsDedekindDomain IsDedekindDomain.HeightOneSpectrum WithZero
open scoped NumberField
noncomputable section
variable {F D:Type*} [Field F] [NumberField F] [Field D] [NumberField D] [Algebra F D]
    [FiniteDimensional F D] [IsGalois F D]
theorem total (v:HeightOneSpectrum (𝓞 F)) (w:HeightOneSpectrum (𝓞 D))
    [w.asIdeal.LiesOver v.asIdeal] {p d:ℕ} (hbase:v.valuation F (p:F)=exp (-1:ℤ))
    (hd:Module.finrank F D=d) (t:D) (ht:(w.valuation D t)^d=w.valuation D (p:D)) :
    w.asIdeal.ramificationIdx (𝓞 F)=d ∧ w.asIdeal.inertiaDeg (𝓞 F)=1 ∧
      ∀ w':HeightOneSpectrum (𝓞 D),w'.asIdeal.LiesOver v.asIdeal → w'=w := by
  let G:=Gal(D/F)
  letI : IsGaloisGroup G (𝓞 F) (𝓞 D) := IsGaloisGroup.of_isFractionRing _ _ _ F D
  let e:=w.asIdeal.ramificationIdx (𝓞 F)
  have he : v.asIdeal.ramificationIdx' w.asIdeal=e := Ideal.ramificationIdx'_eq_ramificationIdx _ _ v.ne_bot
  have h:=valuation_liesOver D v w (p:F)
  rw [hbase,map_natCast (algebraMap F D) p,he,←ht] at h
  have hh:=congrArg (WithZero.log : ℤᵐ⁰→ℤ) h
  rw [log_pow,log_pow,log_exp,Int.nsmul_eq_mul,Int.nsmul_eq_mul] at hh
  have hdiv : d∣e := Int.natCast_dvd_natCast.mp ⟨-log (w.valuation D t),by linarith⟩
  have hcard:=Ideal.ncard_primesOver_mul_ramificationIdxIn_mul_inertiaDegIn v.asIdeal (𝓞 D) G
  rw [Ideal.ramificationIdxIn_eq_ramificationIdx v.asIdeal w.asIdeal G,Ideal.inertiaDegIn_eq_inertiaDeg v.asIdeal w.asIdeal G,
    show Nat.card G=Module.finrank F D from IsGalois.card_aut_eq_finrank F D,hd] at hcard
  change _*(e*_)=d at hcard
  have heq : e=d := Nat.dvd_antisymm (by rw [←hcard]; exact dvd_mul_of_dvd_right (dvd_mul_right _ _) _) hdiv
  rw [heq] at hcard
  have hd₀ : 0<d := hd ▸ Module.finrank_pos
  have hprod : (v.asIdeal.primesOver (𝓞 D)).ncard*w.asIdeal.inertiaDeg (𝓞 F)=1 := by
    apply Nat.eq_of_mul_eq_mul_left hd₀
    simpa only [mul_one,mul_left_comm,mul_assoc] using hcard
  have hc := Nat.eq_one_of_mul_eq_one_right hprod
  have hf := Nat.eq_one_of_mul_eq_one_left hprod
  obtain ⟨q,hq⟩ := Set.ncard_eq_one.mp hc
  have hmem : w.asIdeal∈v.asIdeal.primesOver (𝓞 D) := ⟨inferInstance,inferInstance⟩
  rw [hq,Set.mem_singleton_iff] at hmem
  refine ⟨heq,hf,fun w' h' => ?_⟩
  have hmem' : w'.asIdeal∈v.asIdeal.primesOver (𝓞 D) := ⟨inferInstance,h'⟩
  rw [hq,Set.mem_singleton_iff] at hmem'
  exact HeightOneSpectrum.ext (hmem'.trans hmem.symm)
end
end TunnellGlobalTotalRamification
end

/- TunnellCompletionUniformizer -/
section
namespace TunnellCompletionUniformizer
open IsLocalRing IsDedekindDomain IsDedekindDomain.HeightOneSpectrum WithZero NumberField
open scoped NumberField
noncomputable section
variable {F D R K:Type} [Field F] [NumberField F] [Field D] [NumberField D] [Algebra F D]
    [CommRing R] [IsDedekindDomain R] [Field K] [Algebra R K] [IsFractionRing R K]
theorem uniformizer (v:HeightOneSpectrum (𝓞 F)) (w:HeightOneSpectrum (𝓞 D))
    [w.asIdeal.LiesOver v.asIdeal] {p d:ℕ} (hbase:v.valuation F (p:F)=exp (-1:ℤ))
    (hd:w.asIdeal.ramificationIdx (𝓞 F)=d) (t:D) (ht:(w.valuation D t)^d=w.valuation D (p:D)) :
    ∃ z:w.adicCompletionIntegers D,(z:w.adicCompletion D)=algebraMap D _ t ∧
      maximalIdeal (w.adicCompletionIntegers D)=Ideal.span {z} ∧
      ∃ u:(w.adicCompletionIntegers D)ˣ,(u:w.adicCompletionIntegers D)*z^d=(p:w.adicCompletionIntegers D) := by
  let O:=w.adicCompletionIntegers D
  let M:=w.adicCompletion D
  have e:=valuation_liesOver D v w (p:F)
  rw [map_natCast (algebraMap F D) p,hbase,Ideal.ramificationIdx'_eq_ramificationIdx _ _ v.ne_bot,hd] at e
  have hd₀ : d≠0 := hd ▸ (w.asIdeal.ramificationIdx_pos (𝓞 F)).ne'
  have htv : w.valuation D t=exp (-1:ℤ) := (pow_left_inj₀ zero_le zero_le hd₀).mp (ht.trans e.symm)
  have htM : Valued.v (algebraMap D M t)=exp (-1:ℤ) := (w.valuedAdicCompletion_eq_valuation' t).trans htv
  let z:O:=⟨algebraMap D M t,by
    change Valued.v (algebraMap D M t)≤1
    rw [htM]; exact exp_le_exp.mpr (by decide : (-1:ℤ)≤0)⟩
  have hspan : Ideal.span {z}=maximalIdeal O := by
    simpa only [pow_one] using w.span_singleton_eq_maximalIdeal_pow (x:=z) (e:=1) htM
  let y:M:=(p:M)/(z:M)^d
  have hnon : (z:M)≠0 := (Valuation.ne_zero_iff _).mp (htM.trans_ne exp_ne_zero)
  have hpM : Valued.v (p:M)=Valued.v (z:M)^d := by
    rw [←map_natCast (algebraMap D M) p]
    exact (w.valuedAdicCompletion_eq_valuation' (p:D)).trans (ht.symm.trans (congrArg (·^d) (w.valuedAdicCompletion_eq_valuation' t).symm))
  have hy : Valued.v y=1 := by
    rw [show y=(p:M)/(z:M)^d from rfl,map_div₀,map_pow,hpM,div_self (pow_ne_zero _ ((Valuation.ne_zero_iff _).mpr hnon))]
  have hyn:y≠0 := fun h => by rw [h,map_zero] at hy; exact zero_ne_one hy
  let u:Oˣ :=
    { val:=⟨y,hy.le⟩
      inv:=⟨y⁻¹,by change Valued.v y⁻¹≤1; rw [map_inv₀,hy,inv_one]⟩
      val_inv:=Subtype.ext (mul_inv_cancel₀ hyn)
      inv_val:=Subtype.ext (inv_mul_cancel₀ hyn) }
  refine ⟨z,rfl,hspan.symm,u,Subtype.ext ?_⟩
  change (p:M)/(z:M)^d*(z:M)^d=_
  rw [div_mul_cancel₀ _ (pow_ne_zero _ hnon)]
  exact (map_natCast (algebraMap O M) p).symm
end
end TunnellCompletionUniformizer
end

/- TunnellResiduePrime -/
section
namespace TunnellResiduePrime
open NumberField IsLocalRing IsDedekindDomain IsDedekindDomain.HeightOneSpectrum
open TunnellPadicDivisionSeries TunnellLocalDivisibility
open scoped NumberField
noncomputable section
variable {F:Type} [Field F] [NumberField F] {p:ℕ} [Fact p.Prime]
theorem base (g:F→+*(Local p)) (s:TunnellRestrictedPlaces.Restriction (B:=(IntegerRing p)) g) :
    Nonempty ((𝓞 F ⧸ s.v.asIdeal)≃+*ZMod p) := by
  let e:ResidueField (IntegerRing p)≃+*ZMod p := (ResidueField.mapEquiv (localIntegralEquiv p)).trans PadicInt.residueField
  let f:𝓞 F ⧸ s.v.asIdeal →+* ResidueField (IntegerRing p) := Ideal.quotientMap (maximalIdeal (IntegerRing p)) s.ψ s.prime.le
  let h:=e.toRingHom.comp f
  have hi : Function.Injective h := e.injective.comp (Ideal.quotientMap_injective' s.prime.symm.le)
  have hs : Function.Surjective h := by
    intro x
    exact ⟨(x.val:𝓞 F ⧸ s.v.asIdeal),(map_natCast h _).trans (ZMod.natCast_zmod_val _)⟩
  exact ⟨RingEquiv.ofBijective h ⟨hi,hs⟩⟩
theorem above {D:Type} [Field D] [NumberField D] [Algebra F D] (v:HeightOneSpectrum (𝓞 F)) (w:HeightOneSpectrum (𝓞 D))
    [w.asIdeal.LiesOver v.asIdeal] (hf:w.asIdeal.inertiaDeg (𝓞 F)=1) (e:(𝓞 F ⧸ v.asIdeal)≃+*ZMod p) :
    Nonempty (ResidueField (w.adicCompletionIntegers D)≃+*ZMod p) := by
  let A₀:=𝓞 F ⧸ v.asIdeal
  let B:=𝓞 D ⧸ w.asIdeal
  letI : Field A₀:=Ideal.Quotient.field v.asIdeal
  letI : Field B:=Ideal.Quotient.field w.asIdeal
  have h : Module.finrank A₀ B=1 := (Ideal.inertiaDeg_eq_of_isMaximal v.asIdeal w.asIdeal).symm.trans hf
  let θ:=RingEquiv.ofBijective (algebraMap A₀ B) (Algebra.finrank_eq_one_iff_bijective_algebraMap.mp h)
  exact ⟨(w.residueFieldEquivAdicCompletionIntegers (K:=D)).symm.trans (θ.symm.trans e)⟩
end
end TunnellResiduePrime
end

/- TunnellCMSignedFirst -/
section
namespace TunnellCMSignedFirst
open NumberField IsLocalRing IsDedekindDomain IsDedekindDomain.HeightOneSpectrum WithZero
open WeierstrassCurve WeierstrassCurve.Affine TunnellCoates TunnellKummer TunnellGaussianEnd TunnellCMTorsionField
open TunnellLocalDivisibility TunnellPadicDivisionSeries TunnellPreparedRootPlace TunnellRestrictedPlaces TunnellTameParameter
open scoped NumberField Polynomial Classical
noncomputable section
variable {p:ℕ} [Fact p.Prime]
def Signed {D:Type} [Field D] [NumberField D] (w:HeightOneSpectrum (𝓞 D)) (p:ℕ) : Prop :=
  let O:=w.adicCompletionIntegers D
  Nonempty (ResidueField O≃+*ZMod p) ∧
    ∃ (t:O) (u:Oˣ),maximalIdeal O=Ideal.span {t} ∧ (u:O)*t^(p-1)=(p:O) ∧ residue O (u:O)≠ -1
end
end TunnellCMSignedFirst
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
theorem selected_mem {F:Type} [Field F] [NumberField F] {B M:Type} [CommRing B] [IsDomain B] [IsDiscreteValuationRing B] [Field M]
    [Algebra B M] [IsFractionRing B M] (e:F→+*M) (s:TunnellRestrictedPlaces.Restriction (B:=B) e)
    (j:F) (hj:j^2= -1) (i:B) (hi:e j=algebraMap B M i) (a b:ℤ) (hm:(a:B)+(b:B)*i∈maximalIdeal B) :
    (a:𝓞 F)+(b:𝓞 F)*integralI j hj∈s.v.asIdeal := by
  have h : s.ψ (integralI j hj)=i := IsFractionRing.injective B M ((s.compat _).trans hi)
  rw [s.prime]
  change s.ψ _∈maximalIdeal B
  rw [map_add,map_mul,map_intCast,map_intCast,h]
  exact hm
end
end TunnellConjugatePrimeIndex
end

/- TunnellSignedUnitRestriction -/
section
namespace TunnellSignedUnitRestriction
open NumberField IsDedekindDomain IsDedekindDomain.HeightOneSpectrum IsLocalRing WithZero
open TunnellRestrictedPlaces
open scoped Classical NumberField
noncomputable section
theorem sign {D N:Type} [Field D] [NumberField D] [Field N] (R:ValuationSubring N)
    [IsDiscreteValuationRing R] (g:D→+*N) (w:Restriction (B:=R) g) {p d:ℕ} (hp:p≠0)
    (t:D) (s:R) (u:Rˣ) (hg:g t=(s:N)) (hu:(u:R)*s^d=(p:R)) (hs:residue R (u:R)≠ -1)
    (z:w.v.adicCompletionIntegers D) (b:(w.v.adicCompletionIntegers D)ˣ)
    (hz:(z:w.v.adicCompletion D)=algebraMap D _ t) (hb:(b:w.v.adicCompletionIntegers D)*z^d=(p:w.v.adicCompletionIntegers D)) :
    residue _ (b:w.v.adicCompletionIntegers D)≠ -1 := by
  let O:=w.v.adicCompletionIntegers D
  let L:=w.v.adicCompletion D
  haveI:CharZero N:=charZero_of_injective_ringHom g.injective
  haveI:CharZero R:=(algebraMap R N).charZero
  have hn:s^d≠0:=by intro h; rw [h,mul_zero] at hu; exact (Nat.cast_ne_zero.mpr hp) hu.symm
  have hsn:(s:N)^d≠0:=by exact_mod_cast hn
  have htn:t^d≠0:=by intro e; apply hsn; rw [←hg,←map_pow,e,map_zero]
  have hzg:(z:L)^d≠0:=by rw [hz,←map_pow]; exact (map_ne_zero_iff _ (algebraMap D L).injective).mpr htn
  let a:D:=(p:D)/t^d
  have ha:g a=(u:N):=by
    change g ((p:D)/t^d)=(u:N)
    rw [map_div₀,map_natCast,map_pow,hg,div_eq_iff hsn]
    exact_mod_cast hu.symm
  have hb':algebraMap D L a=(b:L):=by
    change algebraMap D L ((p:D)/t^d)=(b:L)
    rw [map_div₀,map_natCast,map_pow,←hz,div_eq_iff hzg]
    exact_mod_cast hb.symm
  have unit:IsUnit ((u:R)+1):=(residue_ne_zero_iff_isUnit _).mp (by rw [map_add,map_one]; exact fun e=>hs (eq_neg_of_add_eq_zero_left e))
  let v:=IsDiscreteValuationRing.maximalIdeal R
  have h₁:v.valuation N (g (a+1))=1:=by
    rw [map_add,map_one,ha]
    change v.valuation N (algebraMap R N ((u:R)+1))=1
    rw [valuation_of_algebraMap]
    obtain ⟨c,hc⟩:=unit
    rw [←hc]
    simp [v,IsDiscreteValuationRing.maximalIdeal]
  have h₂:w.v.valuation D (a+1)=1:=by
    apply (pow_left_inj₀ zero_le zero_le w.pos.ne').mp
    rw [w.valuation,h₁,one_pow]
  have h₃:Valued.v (algebraMap D L (a+1))=1:=(w.v.valuedAdicCompletion_eq_valuation' _).trans h₂
  intro h
  have hm:(b:O)+1∈maximalIdeal O:=(residue_eq_zero_iff _).mp (by rw [map_add,map_one,h,neg_add_cancel])
  have hlt:=Valuation.Integer.not_isUnit_iff_valuation_lt_one.mp (show ¬IsUnit ((b:O)+1) from hm)
  rw [map_add,map_one,hb'] at h₃
  exact h₃.not_lt hlt
end
end TunnellSignedUnitRestriction
end

/- TunnellSignedFirstTransfer -/
section
namespace TunnellSignedFirstTransfer
open Complex NumberField IntermediateField IsDedekindDomain IsLocalRing WeierstrassCurve WeierstrassCurve.Affine
open TunnellCMConcreteGaussian TunnellCMConcreteOrientation TunnellCMAnalyticDivisionField TunnellCMPrimeDifference
open TunnellCoates TunnellKummer TunnellCMTorsionField TunnellGaussianPrimeIdeal TunnellPadicDivisionSeries TunnellLocalDivisibility
open TunnellCMExplicitNormWitness TunnellCMLemniscate
open TunnellRestrictedPlaces TunnellGaussianEnd
open scoped Classical NumberField
noncomputable section
variable (n:ℕ) (hn:0<n)
theorem lies_over (T:IntermediateField K (algebraicClosure K ℂ)) [NumberField T] (q:GaussianInt) {p:ℕ} (hp:p.Prime)
    (hnorm:q.re^2+q.im^2=(p:ℤ)) (v:HeightOneSpectrum (𝓞 K))
    (hv:(q.re:𝓞 K)+(q.im:𝓞 K)*integralI i square∈v.asIdeal)
    (w:HeightOneSpectrum (𝓞 T)) (z:𝓞 T) (hz:z∈w.asIdeal) (he:(((z:T):(algebraicClosure K ℂ)):ℂ)=(q:ℂ)) :
    w.asIdeal.LiesOver v.asIdeal := by
  let a:𝓞 K:=(q.re:𝓞 K)+(q.im:𝓞 K)*integralI i square
  have ea:algebraMap (𝓞 K) (𝓞 T) a=z:=by
    apply Subtype.ext
    apply T.val.injective
    apply (algebraicClosure K ℂ).val.injective
    change (algebraMap K ℂ) ((q.re:K)+(q.im:K)*i)=(((z:T):(algebraicClosure K ℂ)):ℂ)
    rw [he,GaussianInt.toComplex_def]
    simp only [map_add,map_mul,map_intCast]
    rfl
  let s:=finitePlaceBelow (K:=K) w
  have hs:a∈s.asIdeal:=by change algebraMap (𝓞 K) (𝓞 T) a∈w.asIdeal; rwa [ea]
  have es:s=v:=by by_contra h; exact unique degree i square _ _ hp hnorm v hv s h hs
  exact ⟨congrArg HeightOneSpectrum.asIdeal es.symm⟩
def FirstArithmetic (p:ℕ) (T:IntermediateField K (algebraicClosure K ℂ)) (q:GaussianInt) : Prop :=
  ∀ hT:NumberField T, letI:=hT
  ∀ (w:HeightOneSpectrum (𝓞 T)) (z:𝓞 T), z∈w.asIdeal → (((z:T):(algebraicClosure K ℂ)):ℂ)=(q:ℂ) →
    TunnellCMSignedFirst.Signed w p
set_option maxHeartbeats 1700000 in
def LocalData (p:ℕ) (hp:p.Prime) (q:GaussianInt) : Prop :=
  let v:HeightOneSpectrum ℤ:=Rat.HeightOneSpectrum.primesEquiv.symm ⟨p,hp⟩
  let Q:Type:=v.adicCompletion ℚ
  let Z:ValuationSubring (v.adicCompletion ℚ):=v.adicCompletionIntegers ℚ
  ∀ j:Z,j^2= -1 → IsUnit ((Int.castRingHom Z) q.re-(Int.castRingHom Z) q.im*j) →
  ∃ (N:Type) (fN:Field N),letI:=fN;
  ∃ R:ValuationSubring N,IsDiscreteValuationRing R ∧ ∃ (g:Q→+*N) (f:Z→+*R),IsLocalHom f ∧
    (∀ z:Z,(f z:N)=g z.val) ∧ ∃ (s:R) (u:Rˣ),s∈maximalIdeal R ∧
    (u:R)*s^(p-1)=(p:R) ∧ residue R (u:R)≠ -1 ∧
    (letI:Algebra Q N:=g.toAlgebra; (minpoly Q (s:N)).natDegree=p-1) ∧
    let E₀:WeierstrassCurve N:=⟨0,0,0,-(n:N)^2,0⟩
    ∃ (x y:N) (h:E₀.toAffine.Nonsingular x y) (l:E₀.toAffine.Nonsingular (-x) ((f j:N)*y)),
    let P:=WeierstrassCurve.Affine.Point.some x y h;
    -x/y=(s:N) ∧ addOrderOf P=p ∧ q.re • P+q.im • (.some (-x) ((f j:N)*y) l)=0
theorem transfer {p:ℕ} (hp:p.Prime) (hmod:p%4=1) (q:GaussianInt) (hq:q.norm.natAbs=p) (loc:LocalData n p hp q):
    FirstArithmetic p (analyticLevel K (twistPeriods n hn) q 1) q := by
  letI : (E (n:K)).IsElliptic:=E_elliptic (by norm_num) (by exact_mod_cast hn.ne')
  letI : Fact p.Prime:=⟨hp⟩
  have hnorm:=norm_equation q hq
  have h₂:p≠2:=by omega
  obtain ⟨g,v,j,hj,hij,hplus,hminus⟩:=oriented hmod q hnorm
  letI : Algebra K (Local p):=g.toAlgebra
  have hIC:algebraMap K ℂ i=I:=rfl
  obtain ⟨N,fN,R,hR,G,f,hf,hfg,s,u,hs,hu,hsig,hdeg,x,y,lh,li,hsxy,horder,hcm⟩:=loc j hj hminus
  letI : Field N := fN
  letI : IsDiscreteValuationRing R := hR
  letI : IsLocalHom f := hf
  letI : Algebra (Local p) N := G.toAlgebra
  letI : Algebra K N := (G.comp g).toAlgebra
  letI : IsScalarTower K (Local p) N := .of_algebraMap_eq' rfl
  haveI : CharZero N:=charZero_of_injective_ringHom (G.comp g).injective
  have H:((E (n:K))).baseChange N=E (n:N):=by rw [base_E,map_natCast]
  have hnons:(((E (n:K))).baseChange N).toAffine.Nonsingular x y:=H ▸ lh
  let L:=Point.some x y lh
  let Y:CurvePoints (E (n:K)) N:=Point.some x y hnons
  let φ:=Point.equivOfEq H
  have hY:φ Y=L:=by simp only [φ,Y,L,Point.equivOfEq_some]
  have hiN:algebraMap K N i=(f j:N):=by
    change G (g i)=(f j:N)
    rw [hij,←hfg]
  have hti:φ (baseI (n:K) i square Y)=Point.some (-x) ((f j:N)*y) li:=by
    obtain ⟨e,eq⟩:∃ e,baseI (n:K) i square Y=Point.some (-x) ((algebraMap K N i)*y) e:=⟨_,rfl⟩
    simp only [eq,φ,Point.equivOfEq_some,hiN]
  have hYcm:cm (n:K) i square (q^1) Y=0:=by
    apply φ.injective
    rw [pow_one]
    change φ (q.re • Y+q.im • baseI (n:K) i square Y)=φ 0
    rw [map_add,map_zsmul,map_zsmul,hY,hti,map_zero]
    exact hcm
  have hYo:addOrderOf Y=p:=((addOrderOf_injective φ.toAddMonoidHom φ.injective Y).symm.trans ((congrArg addOrderOf hY).trans horder))
  let D₀:=coordField (E (n:K)) Y
  have hmem:(s:N)∈D₀:=by
    rw [←hsxy]
    change -x/y∈adjoin K {x,y}
    exact (adjoin K {x,y}).div_mem ((adjoin K {x,y}).neg_mem (subset_adjoin K _ (by simp))) (subset_adjoin K _ (by simp))
  obtain ⟨_,U,hU,ho,hG,hd,⟨e⟩⟩:=TunnellPrimitiveCoordField.equal_degrees n hn i square hIC hp h₂ hq 1 Y hYcm
    (by rw [pow_one,←hYo,addOrderOf_nsmul_eq_zero]) (s:N) hmem (by simpa only [pow_one,Nat.totient_prime hp] using hdeg)
  let D:=coordField (E (n:K)) U
  have hd':Module.finrank K D=p-1:=by simpa [D,Nat.totient_prime hp] using hd
  haveI : FiniteDimensional K D:=FiniteDimensional.of_finrank_pos (hd'.trans_gt (by have:=hp.two_le;omega))
  letI : NumberField D:=NumberField.of_module_finite K D
  letI : IsAbelianGalois K D:=hG
  let b:D→ₐ[K]N:=D₀.val.comp e.symm.toAlgHom
  let t:D:=e ⟨(s:N),hmem⟩
  have hbt:b t=(s:N):=by simp [b,t]
  have hspan: maximalIdeal (IntegerRing p)=Ideal.span {(p:IntegerRing p)}:=(base_uniformizer (p:=p)).1
  have hpm:(p:IntegerRing p)∈maximalIdeal (IntegerRing p):=hspan ▸ Ideal.mem_span_singleton_self _
  have hpR:(p:R)∈maximalIdeal R:=by rw [←map_natCast f p]; exact map_nonunit f _ hpm
  obtain ⟨w⟩:=restrict b.toRingHom hp.ne_zero hpR
  haveI hw:=restrict_liesOver g b.toRingHom v w G f hfg b.commutes
  have hrel:s^(p-1)=(p:R)*(u⁻¹:Rˣ):=by rw [←hu,mul_right_comm]; simp
  have hv:=equal_values b.toRingHom w t s hbt u⁻¹ hrel
  have hbase:=uniformizer_restriction g v hp.ne_zero hspan
  obtain ⟨her,hef,uniq⟩:=TunnellGlobalTotalRamification.total v.v w.v hbase hd' t hv
  obtain ⟨z,hzt,hz,bu,hbu⟩:=TunnellCompletionUniformizer.uniformizer v.v w.v hbase her t hv
  have hbs:=TunnellSignedUnitRestriction.sign R b.toRingHom w hp.ne_zero t s u hbt hu hsig z bu hzt hbu
  obtain ⟨ρ₀⟩:=TunnellResiduePrime.base g v
  obtain ⟨ρ⟩:=TunnellResiduePrime.above v.v w.v hef ρ₀
  have eA : D=analyticLevel K (twistPeriods n hn) q 1:=TunnellCMAnalyticDivisionField.actual_level K n hn i square orientation hp h₂ q hq hnorm 0 U hU ho
  rw [←eA]
  intro hD w' a ha hea
  have hm:=TunnellConjugatePrimeIndex.selected_mem g v i square j hij q.re q.im hplus
  have eq:w'=w.v:=uniq w' (lies_over D q hp hnorm v.v hm w' a ha hea)
  subst w'
  exact ⟨⟨ρ⟩,z,bu,hz,hbu,hbs⟩
end
end TunnellSignedFirstTransfer
end

/- TunnellSignedTransferPublic -/
section
namespace TunnellSignedTransferPublic
open NumberField IntermediateField Complex TunnellCMLemniscate TunnellCoates
open scoped Classical
noncomputable section
set_option maxHeartbeats 1600000 in
theorem transfer : OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H2_R1_H1_R1.H2 := by
  refine fun n hn M hm₁ hm₂ p hp hmod good q hq localdata hT w z hz he => ?_
  have hm:M=twistPeriods n hn:=by
    obtain ⟨s,t,h⟩:=M
    change s=(realPeriod n:ℂ) at hm₁
    change t=I*(realPeriod n:ℂ) at hm₂
    subst s
    subst t
    rfl
  subst M
  have H:=TunnellSignedFirstTransfer.transfer n hn hp hmod q hq localdata hT w z hz he
  exact ⟨inferInstance,H⟩
end
end TunnellSignedTransferPublic
end

theorem OMA.solution : OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H2_R1_H1_R1.H2 := TunnellSignedTransferPublic.transfer
