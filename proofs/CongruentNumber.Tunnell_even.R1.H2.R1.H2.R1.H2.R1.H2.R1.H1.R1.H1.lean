import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1
import Mathlib
/-
Portions adapted from EllipticCurves and the LSG Weierstrass library. LSG copyright (c) 2026. All rights reserved. Both libraries are licensed under the Apache License, Version 2.0, reproduced below.
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


namespace TunnellCMGoodDescent
end TunnellCMGoodDescent
namespace TunnellCMLocalUnit
end TunnellCMLocalUnit
namespace TunnellCMNormDistribution
end TunnellCMNormDistribution
namespace TunnellCMRegularized
end TunnellCMRegularized
namespace TunnellCMToricDivision
end TunnellCMToricDivision
namespace TunnellCMTraceDistribution
end TunnellCMTraceDistribution
namespace TunnellCMUnitCriterion
end TunnellCMUnitCriterion
namespace TunnellEllipticZeta
end TunnellEllipticZeta

/-!
A nonzero balanced product of torsion-coordinate differences on the congruent-number curve is an algebraic unit when the translation order is prime to the conductor. Complex uniformization realizes the indicated Weierstrass division product as exactly such a balanced product.
-/
namespace TunnellBalancedIntegrality
open Complex NumberField IsDedekindDomain IntermediateField IsLocalRing Set MeasureTheory
open scoped Classical NumberField

def H1 : Prop :=
  ∀ n m a:ℕ, n%8=2 → 2<n → (4*n).Coprime (a*m) →
  let A:=algebraicClosure ℚ ℂ
  let W:WeierstrassCurve A:=⟨0,0,0,-(n:A)^2,0⟩
  ∀ X:W.toAffine.Point→A, (X 0=0 ∧ ∀ x y (h:W.toAffine.Nonsingular x y), X (.some x y h)=x) → ∀ (ι κ:Type) [Fintype ι] [Fintype κ] (w:ι→ℤ)
    (U:ι→W.toAffine.Point) (V:W.toAffine.Point) (Q:κ→W.toAffine.Point),
  let H:=∏ i,(∏ j,(X (U i+V)-X (Q j)))^w i
  (∑ i,w i=0) → (∀ i,addOrderOf (U i)=4*n) → (m • V=0) → (∀ j,a • Q j=0) → (∀ j,Q j≠0) → (H≠0) →
    ∃ u:(𝓞 A)ˣ, u.val.val=H

def H2 : Prop :=
  ∀ (n : ℕ) (hn : 0<n),
  letI : NeZero (4*n) := ⟨Nat.ne_of_gt (Nat.mul_pos (by decide) hn)⟩
  let a := 1+3*(4*n)
  let ω : ℝ := (∫ x in Ioi (n:ℝ), (Real.sqrt (x^3-(n:ℝ)^2*x))⁻¹)
  let b (v : ZMod (4*n) × ZMod (4*n)) : GaussianInt := ⟨v.1.val,v.2.val⟩
  let χ (v : ZMod (4*n) × ZMod (4*n)) : ℤ :=
    let m := (b v).norm.natAbs
    if (⟨2,2⟩:GaussianInt) ∣ b v-1 then (if Odd m then jacobiSym n m else 0) else 0
  ∀ M : PeriodPair, M.ω₁=(ω:ℂ) → M.ω₂=Complex.I*(ω:ℂ) →
  let t (j : Fin a × Fin a) : ℂ := ((j.1.val:ℂ)*M.ω₁+(j.2.val:ℂ)*M.ω₂)/(a:ℂ)
  let D (z : ℂ) := ∏ j ∈ Finset.univ.filter (fun j => t j ∉ M.lattice),
    (M.weierstrassP z-M.weierstrassP (t j))
  let G (z : ℂ) := ∏ v ∈ Finset.univ.filter (fun v => χ v≠0),
    D (z+((ω/(4*n):ℝ):ℂ)*(b v:ℂ))^χ v
  n%8=2 → 2<n → ∀ m:ℕ, 0 < m → (4*n).Coprime (a*m) → ∀ z:ℂ, (m:ℂ)*z∈M.lattice →
  let A:=algebraicClosure ℚ ℂ
  let W:WeierstrassCurve A:=⟨0,0,0,-(n:A)^2,0⟩
  ∃ X:W.toAffine.Point→A, (X 0=0 ∧ ∀ x y (h:W.toAffine.Nonsingular x y), X (.some x y h)=x) ∧ ∃ (ι κ:Type) (hi:Fintype ι) (hk:Fintype κ), letI:=hi; letI:=hk;
    ∃ (w:ι→ℤ) (U:ι→W.toAffine.Point) (V:W.toAffine.Point) (Q:κ→W.toAffine.Point),
    let H:=∏ i,(∏ j,(X (U i+V)-X (Q j)))^w i
    (∑ i,w i=0) ∧ (∀ i,addOrderOf (U i)=4*n) ∧ (m • V=0) ∧ (∀ j,a • Q j=0) ∧ (∀ j,Q j≠0) ∧ (H≠0) ∧ (H:ℂ)=G z

theorem main : H1 → H2 → OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1.H1 := by
  intro arithmetic represent
  refine fun n hn M h₁ h₂ hmod hlarge m hm hcop z hz => ?_
  obtain ⟨X,hX,ι,κ,hi,hk,w,U,V,Q,hw,hU,hV,hQ,hQ₀,hH,e⟩ :=
    represent n hn M h₁ h₂ hmod hlarge m hm hcop z hz
  letI:=hi
  letI:=hk
  obtain ⟨u,hu⟩:=arithmetic n m _ hmod hlarge hcop X hX ι κ w U V Q hw hU hV hQ hQ₀ hH
  exact ⟨u,(congrArg (fun a:algebraicClosure ℚ ℂ => (a:ℂ)) hu).trans e⟩

end TunnellBalancedIntegrality


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
lemma variableChange_negY (x y : F) :
    W.toAffine.negY ((C.u : F) ^ 2 * x + C.r)
        ((C.u : F) ^ 3 * y + (C.u : F) ^ 2 * C.s * x + C.t)
      = (C.u : F) ^ 3 * (C • W).toAffine.negY x y + (C.u : F) ^ 2 * C.s * x + C.t := by
  simp [negY, variableChange_a₁, variableChange_a₃]
  field

lemma variableChange_negY_ne {x₁ x₂ y₁ y₂ : F}
    (hxy : ¬(x₁ = x₂ ∧ y₁ = (C • W).toAffine.negY x₂ y₂)) :
    ¬((C.u : F) ^ 2 * x₁ + C.r = (C.u : F) ^ 2 * x₂ + C.r ∧
      (C.u : F) ^ 3 * y₁ + (C.u : F) ^ 2 * C.s * x₁ + C.t = W.toAffine.negY
        ((C.u : F) ^ 2 * x₂ + C.r) ((C.u : F) ^ 3 * y₂ + (C.u : F) ^ 2 * C.s * x₂ + C.t)) := by
  have hu : (C.u : F) ≠ 0 := C.u.ne_zero
  intro ⟨hX, hY⟩
  have hx : x₁ = x₂ := mul_left_cancel₀ (pow_ne_zero 2 hu) (by linear_combination hX)
  subst hx
  rw [variableChange_negY] at hY
  exact hxy ⟨rfl, mul_left_cancel₀ (pow_ne_zero 3 hu) (by linear_combination hY)⟩
lemma variableChange_addX (x₁ x₂ ℓ : F) :
    W.toAffine.addX ((C.u : F) ^ 2 * x₁ + C.r) ((C.u : F) ^ 2 * x₂ + C.r) ((C.u : F) * ℓ + C.s)
      = (C.u : F) ^ 2 * (C • W).toAffine.addX x₁ x₂ ℓ + C.r := by
  simp [addX, variableChange_a₁, variableChange_a₂]
  field
lemma variableChange_negAddY (x₁ x₂ y₁ ℓ : F) :
    W.toAffine.negAddY ((C.u : F) ^ 2 * x₁ + C.r) ((C.u : F) ^ 2 * x₂ + C.r)
        ((C.u : F) ^ 3 * y₁ + (C.u : F) ^ 2 * C.s * x₁ + C.t) ((C.u : F) * ℓ + C.s)
      = (C.u : F) ^ 3 * (C • W).toAffine.negAddY x₁ x₂ y₁ ℓ
        + (C.u : F) ^ 2 * C.s * (C • W).toAffine.addX x₁ x₂ ℓ + C.t := by
  simp [negAddY, addX, variableChange_a₁, variableChange_a₂]
  field
lemma variableChange_addY (x₁ x₂ y₁ ℓ : F) :
    W.toAffine.addY ((C.u : F) ^ 2 * x₁ + C.r) ((C.u : F) ^ 2 * x₂ + C.r)
        ((C.u : F) ^ 3 * y₁ + (C.u : F) ^ 2 * C.s * x₁ + C.t) ((C.u : F) * ℓ + C.s)
      = (C.u : F) ^ 3 * (C • W).toAffine.addY x₁ x₂ y₁ ℓ
        + (C.u : F) ^ 2 * C.s * (C • W).toAffine.addX x₁ x₂ ℓ + C.t := by
  simp only [addY, variableChange_negAddY, variableChange_addX, variableChange_negY]
lemma variableChange_slope [DecidableEq F] {x₁ x₂ y₁ y₂ : F}
    (h₁ : (C • W).toAffine.Equation x₁ y₁) (h₂ : (C • W).toAffine.Equation x₂ y₂)
    (hxy : ¬(x₁ = x₂ ∧ y₁ = (C • W).toAffine.negY x₂ y₂)) :
    W.toAffine.slope ((C.u : F) ^ 2 * x₁ + C.r) ((C.u : F) ^ 2 * x₂ + C.r)
        ((C.u : F) ^ 3 * y₁ + (C.u : F) ^ 2 * C.s * x₁ + C.t)
        ((C.u : F) ^ 3 * y₂ + (C.u : F) ^ 2 * C.s * x₂ + C.t)
      = (C.u : F) * (C • W).toAffine.slope x₁ x₂ y₁ y₂ + C.s := by
  have hu : (C.u : F) ≠ 0 := C.u.ne_zero
  rcases eq_or_ne x₁ x₂ with rfl | hx
  · have hy : y₁ ≠ (C • W).toAffine.negY x₁ y₂ := fun h ↦ hxy ⟨rfl, h⟩
    obtain rfl := Y_eq_of_Y_ne h₁ h₂ rfl hy
    have hΦy : (C.u : F) ^ 3 * y₁ + (C.u : F) ^ 2 * C.s * x₁ + C.t
        ≠ W.toAffine.negY ((C.u : F) ^ 2 * x₁ + C.r)
            ((C.u : F) ^ 3 * y₁ + (C.u : F) ^ 2 * C.s * x₁ + C.t) := by
      rw [variableChange_negY]
      exact fun h ↦ hy (mul_left_cancel₀ (pow_ne_zero 3 hu) (by linear_combination h))
    rw [W.toAffine.slope_of_Y_ne rfl hΦy, (C • W).toAffine.slope_of_Y_ne rfl hy,
      ← mul_div_assoc, div_add' _ _ _ (sub_ne_zero.mpr hy),
      div_eq_div_iff (sub_ne_zero.mpr hΦy) (sub_ne_zero.mpr hy)]
    simp [negY, variableChange_a₁, variableChange_a₂, variableChange_a₃, variableChange_a₄]
    field
  · have hΦx : (C.u : F) ^ 2 * x₁ + C.r ≠ (C.u : F) ^ 2 * x₂ + C.r := by
      simpa [mul_right_inj' (pow_ne_zero 2 hu)] using hx
    rw [W.toAffine.slope_of_X_ne hΦx, (C • W).toAffine.slope_of_X_ne hx]
    have h1 := sub_ne_zero.mpr hΦx
    have h2 := sub_ne_zero.mpr hx
    field

lemma variableChange_equation (x y : F) :
    W.toAffine.Equation ((C.u : F) ^ 2 * x + C.r)
        ((C.u : F) ^ 3 * y + (C.u : F) ^ 2 * C.s * x + C.t)
      ↔ (C • W).toAffine.Equation x y := by
  have hu : (C.u : F) ≠ 0 := C.u.ne_zero
  simp only [equation_iff', variableChange_a₁, variableChange_a₂, variableChange_a₃,
    variableChange_a₄, variableChange_a₆, Units.val_inv_eq_inv_val, field]
  refine ⟨fun h ↦ ?_, fun h ↦ ?_⟩ <;> linear_combination h
namespace Point
variable [W.IsElliptic]

def mapVariableChangeFun : (C • W).toAffine.Point → W.toAffine.Point
  | .zero => .zero
  | .some x y h => .some ((C.u : F) ^ 2 * x + C.r)
      ((C.u : F) ^ 3 * y + (C.u : F) ^ 2 * C.s * x + C.t)
      (equation_iff_nonsingular.mp
        ((variableChange_equation W C x y).mpr (equation_iff_nonsingular.mpr h)))
@[simp] lemma mapVariableChangeFun_zero : mapVariableChangeFun W C 0 = 0 := rfl
lemma mapVariableChangeFun_some {x y : F} (h : (C • W).toAffine.Nonsingular x y) :
    mapVariableChangeFun W C (.some x y h)
      = .some ((C.u : F) ^ 2 * x + C.r) ((C.u : F) ^ 3 * y + (C.u : F) ^ 2 * C.s * x + C.t)
          (equation_iff_nonsingular.mp
            ((variableChange_equation W C x y).mpr (equation_iff_nonsingular.mpr h))) := rfl
lemma some_eq_some (W : WeierstrassCurve F) {x₁ x₂ y₁ y₂ : F} (hx : x₁ = x₂) (hy : y₁ = y₂)
    {h₁ : W.toAffine.Nonsingular x₁ y₁} {h₂ : W.toAffine.Nonsingular x₂ y₂} :
    (some x₁ y₁ h₁ : W.toAffine.Point) = some x₂ y₂ h₂ := by
  subst hx hy; rfl
lemma mapVariableChangeFun_injective :
    Function.Injective (mapVariableChangeFun W C) := by
  have hu : (C.u : F) ≠ 0 := C.u.ne_zero
  rintro (_ | ⟨x₁, y₁, h₁⟩) (_ | ⟨x₂, y₂, h₂⟩) h
  · rfl
  · simp [mapVariableChangeFun] at h
  · simp [mapVariableChangeFun] at h
  · rw [mapVariableChangeFun_some, mapVariableChangeFun_some] at h
    injection h with hX hY
    have hx : x₁ = x₂ := mul_left_cancel₀ (pow_ne_zero 2 hu) (by linear_combination hX)
    exact some_eq_some (C • W) hx
      (mul_left_cancel₀ (pow_ne_zero 3 hu) (by linear_combination hY - (C.u : F) ^ 2 * C.s * hx))
variable [DecidableEq F]
 
def equivOfEq {V V' : WeierstrassCurve F} (h : V = V') :
    V.toAffine.Point ≃+ V'.toAffine.Point := by
  subst h; exact AddEquiv.refl _
@[simp] lemma equivOfEq_some {V V' : WeierstrassCurve F} (h : V = V') {x y : F}
    (hns : V.toAffine.Nonsingular x y) :
    equivOfEq h (some x y hns) = some x y (h ▸ hns) := by
  subst h; rfl

def mapVariableChange : (C • W).toAffine.Point →+ W.toAffine.Point where
  toFun := mapVariableChangeFun W C
  map_zero' := rfl
  map_add' := by
    rintro (_ | ⟨x₁, y₁, h₁⟩) (_ | ⟨x₂, y₂, h₂⟩)
    any_goals rfl
    simp only [mapVariableChangeFun_some]
    have e₁ : (C • W).toAffine.Equation x₁ y₁ := equation_iff_nonsingular.mpr h₁
    have e₂ : (C • W).toAffine.Equation x₂ y₂ := equation_iff_nonsingular.mpr h₂
    by_cases hxy : x₁ = x₂ ∧ y₁ = (C • W).toAffine.negY x₂ y₂
    · rw [add_of_Y_eq hxy.1 hxy.2, mapVariableChangeFun_zero]
      refine (add_of_Y_eq ?_ ?_).symm
      · rw [hxy.1]
      · rw [variableChange_negY, hxy.2, hxy.1]
    · rw [add_some hxy, mapVariableChangeFun_some, add_some (variableChange_negY_ne W C hxy)]
      simp only [variableChange_slope W C e₁ e₂ hxy, variableChange_addX, variableChange_addY]

def equivVariableChange : (C • W).toAffine.Point ≃+ W.toAffine.Point :=
  have hright : ∀ P, mapVariableChangeFun W C
      (mapVariableChangeFun (C • W) C⁻¹ (equivOfEq (inv_smul_smul C W).symm P)) = P := by
    have hu : (C.u : F) ≠ 0 := C.u.ne_zero
    rintro (_ | ⟨X, Y, h⟩)
    · simp [← zero_def]
    · rw [equivOfEq_some, mapVariableChangeFun_some, mapVariableChangeFun_some]
      refine some_eq_some W ?_ ?_ <;>
        (simp only [VariableChange.inv_def, Units.val_inv_eq_inv_val]; field)
  { toFun := mapVariableChangeFun W C
    invFun := fun P ↦ mapVariableChangeFun (C • W) C⁻¹ (equivOfEq (inv_smul_smul C W).symm P)
    left_inv := Function.RightInverse.leftInverse_of_injective hright
      (mapVariableChangeFun_injective W C)
    right_inv := hright
    map_add' := (mapVariableChange W C).map_add' }
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
lemma points_ne_zero_param {z : W₀.formalGroupLaw.Points} (hz0 : z ≠ 0) :
    (z () : v.adicCompletionIntegers K) ≠ 0 :=
  fun h ↦ hz0 (funext fun i ↦ by cases i; exact Subtype.ext h)

lemma points_eq_zero_of_nsmul_prime_ne {p q : ℕ} (hp : p.Prime) (hq : q.Prime)
    (hpmem : (p : v.adicCompletionIntegers K) ∈ maximalIdeal (v.adicCompletionIntegers K))
    (hqp : q ≠ p) {z : W₀.formalGroupLaw.Points} (hz : q • z = 0) : z = 0 := by
  by_contra hz0
  obtain ⟨k, hk1, hkv⟩ := ChabautyColeman.exists_valued_eq_exp_neg (z ()).2
    (points_ne_zero_param hz0)
  have htk : (z () : v.adicCompletionIntegers K) ∈
      maximalIdeal (v.adicCompletionIntegers K) ^ k :=
    (v.mem_maximalIdeal_pow_iff (K := K)).mpr hkv.le
  have hcong := (W₀.nsmul_apply_coe_mem_and_sub_mem (Nat.one_le_iff_ne_zero.mp hk1) htk q).2
  rw [hz, FormalGroupLaw.zero_apply_coe, zero_sub, nsmul_eq_mul] at hcong
  obtain ⟨u, hu⟩ := (isUnit_natCast_of_not_dvd hp hpmem
    fun hdvd ↦ hqp ((Nat.prime_dvd_prime_iff_eq hp hq).mp hdvd).symm).exists_left_inv
  have ht2k : (z () : v.adicCompletionIntegers K) ∈
      maximalIdeal (v.adicCompletionIntegers K) ^ (2 * k) := by
    rw [show (z () : v.adicCompletionIntegers K) = u * ((q : v.adicCompletionIntegers K) *
      (z () : v.adicCompletionIntegers K)) by rw [← mul_assoc, hu, one_mul]]
    exact Ideal.mul_mem_left _ _ (by simpa using neg_mem hcong)
  have hle := (v.mem_maximalIdeal_pow_iff (K := K)).mp ht2k
  rw [hkv, exp_le_exp] at hle
  push_cast at hle
  lia
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
  | .zero => exact ⟨0, formalPoint_of_param_eq_zero hW (z := 0) (by simp)⟩
  | .some x y h =>
    rw [some_mem_filtration] at hP
    exact exists_formalPoint_eq_some hW h (le_trans (exp_le_exp.mpr (by lia)) hP)

theorem exists_points_equiv_filtration :
    ∃ θ : W₀.formalGroupLaw.Points ≃+ filtration hW 0,
      ∀ (z : W₀.formalGroupLaw.Points) (n : ℕ),
        ((z () : v.adicCompletionIntegers K) ∈
            maximalIdeal (v.adicCompletionIntegers K) ^ (n + 1) ↔
          ((θ z : filtration hW 0) : W.Point) ∈ filtration hW n) := by
  have hmap : ∀ z : W₀.formalGroupLaw.Points, formalPoint hW z ∈ filtration hW 0 :=
    fun z ↦ (mem_pow_iff_formalPoint_mem_filtration z 0).mp (by
      rw [pow_one]
      exact (z ()).2)
  let f : W₀.formalGroupLaw.Points →+ filtration hW 0 :=
    { toFun := fun z ↦ ⟨formalPoint hW z, hmap z⟩
      map_zero' := Subtype.ext (formalPoint_of_param_eq_zero hW (z := 0) (by simp))
      map_add' := fun z z' ↦ Subtype.ext (formalPoint_add hW z z') }
  refine ⟨AddEquiv.ofBijective f
    ⟨fun z z' h ↦ formalPoint_injective hW (congrArg Subtype.val h), fun P ↦ ?_⟩,
    fun z n ↦ ?_⟩
  · obtain ⟨z, hz⟩ := formalPoint_surjective P.2
    exact ⟨z, Subtype.ext hz⟩
  · exact mem_pow_iff_formalPoint_mem_filtration z n

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


/- TunnellCMLocalUnit -/
section
section
namespace TunnellCMLocalUnit
open WeierstrassCurve WeierstrassCurve.Affine IsDedekindDomain IsDedekindDomain.HeightOneSpectrum
open IsLocalRing WithZero
variable {R K : Type*} [CommRing R] [IsDedekindDomain R] [Field K] [CharZero K] [Algebra R K] [IsFractionRing R K]
  {v : HeightOneSpectrum R} {W : Affine (v.adicCompletion K)} {W₀ : WeierstrassCurve (v.adicCompletionIntegers K)}
  (hW : W₀.map (algebraMap (v.adicCompletionIntegers K) (v.adicCompletion K))=W)
  [DecidableEq (v.adicCompletion K)] [DecidableEq (ResidueField (v.adicCompletionIntegers K))]
  [W.IsElliptic] [W₀.IsElliptic]
lemma tame_kernel {l q : ℕ} (hl : l.Prime) (hq : q.Prime) (hql : q≠l)
    (hlm : (l:v.adicCompletionIntegers K)∈maximalIdeal (v.adicCompletionIntegers K))
    {P : W.Point} (hp : q • P=0) (hr : adicRed hW P=0) : P=0 := by
  have hf := (adicRed_eq_zero_iff hW).mp hr
  obtain ⟨θ,_⟩ := exists_points_equiv_filtration (hW := hW)
  let Q : filtration hW 0 := ⟨P,hf⟩
  have he : q • θ.symm Q=0 := by
    rw [← map_nsmul,show q • Q=0 from Subtype.ext hp,map_zero]
  have e := points_eq_zero_of_nsmul_prime_ne hl hq hlm hql he
  have eqQ : Q=0 := by simpa using congrArg θ e
  exact congrArg Subtype.val eqQ
lemma separated {l q f m a : ℕ} (hl : l.Prime) (hq : q.Prime) (hql : q≠l)
    (hlm : (l:v.adicCompletionIntegers K)∈maximalIdeal (v.adicCompletionIntegers K))
    (hf : 0 < f) (hqf : q∣f) (hc : q.Coprime (a*m))
    (U V : W.Point) (hu : addOrderOf U=f) (hv : m • V=0) : a • adicRed hW (U+V)≠0 := by
  intro he
  let B := (f/q) • U
  have hb : q • B=0 := by dsimp [B]; rw [← mul_nsmul,Nat.div_mul_cancel hqf,← hu,addOrderOf_nsmul_eq_zero]
  have hb' : B≠0 := by
    intro hh
    have hd := addOrderOf_dvd_iff_nsmul_eq_zero.mpr hh
    rw [hu] at hd
    exact (Nat.not_dvd_of_pos_of_lt (Nat.div_pos (Nat.le_of_dvd hf hqf) hq.pos) (Nat.div_lt_self hf hq.one_lt)) hd
  let ρ := adicRedHom hW
  change a • ρ (U+V)=0 at he
  have ha : (a*m) • ρ U=0 := by
    have e := congrArg (fun x : (adicRedCurve W₀).Point => m • x) he
    change m • (a • ρ (U+V))=m • (0:(adicRedCurve W₀).Point) at e
    rw [smul_comm m a,map_add,nsmul_add,← map_nsmul ρ m V,hv,map_zero,add_zero,nsmul_zero] at e
    rw [mul_nsmul,smul_comm]; exact e
  have heB : (a*m) • ρ B=0 := by
    dsimp [B]
    rw [map_nsmul,smul_comm,ha,nsmul_zero]
  have qB : q • ρ B=0 := by rw [← map_nsmul,hb,map_zero]
  have hdiv := Nat.dvd_gcd (addOrderOf_dvd_of_nsmul_eq_zero qB) (addOrderOf_dvd_of_nsmul_eq_zero heB)
  rw [hc.gcd_eq_one,Nat.dvd_one,AddMonoid.addOrderOf_eq_one_iff] at hdiv
  exact hb' (tame_kernel hW hl hq hql hlm hb hdiv)
set_option maxHeartbeats 3000000 in
theorem difference_value {x y u t : v.adicCompletion K} {hP : W.Nonsingular x y} {hQ : W.Nonsingular u t}
    (h0 : adicRed hW (.some x y hP)≠0)
    (h1 : adicRed hW (.some x y hP)≠adicRed hW (.some u t hQ))
    (h2 : adicRed hW (.some x y hP)≠ -adicRed hW (.some u t hQ)) :
    Valued.v (x-u)=max 1 (Valued.v u) := by
  have hx : ¬ exp (2:ℤ)≤Valued.v x := fun h => h0 (adicRed_some_of_mem hW h)
  have hxi := (integral_of_not_mem hW hP.1 hx).1
  by_cases hu : exp (2:ℤ)≤Valued.v u
  · have hu' : 1<Valued.v u := (show exp (0:ℤ)<exp (2:ℤ) from exp_lt_exp.mpr (by decide)).trans_le hu
    exact (Valued.v.map_sub_eq_of_lt_right (lt_of_le_of_lt hxi hu')).trans (max_eq_right hu'.le).symm
  have hui := (integral_of_not_mem hW hQ.1 hu).1
  rw [max_eq_left hui]
  have eP := adicRed_some_of_not_mem (h := hP) hW hx
  have eQ := adicRed_some_of_not_mem (h := hQ) hW hu
  have hne : residue _ (⟨x,hxi⟩ : v.adicCompletionIntegers K) ≠ residue _ (⟨u,hui⟩ : v.adicCompletionIntegers K) := by
    intro e
    have hP' := adicRed_nonsingular hW hP.1 hxi (integral_of_not_mem hW hP.1 hx).2
    have hQ' := adicRed_nonsingular hW hQ.1 hui (integral_of_not_mem hW hQ.1 hu).2
    rcases (Point.X_eq_iff (h₁ := hP') (h₂ := hQ')).mp e with he|he
    · exact h1 (eP.trans (he.trans eQ.symm))
    · exact h2 (eP.trans (he.trans (congrArg Neg.neg eQ.symm)))
  have hxu := valued_sub_le (v := v) hxi hui
  have hres : residue _ (⟨x-u,hxu⟩ : v.adicCompletionIntegers K)≠0 := by
    rw [res_sub hxi hui hxu]
    exact sub_ne_zero.mpr hne
  exact valued_eq_one_of_residue_ne (v := v) hxu hres
end TunnellCMLocalUnit
end


/- TunnellCMUnitCriterion -/
section
section
namespace TunnellCMUnitCriterion
open WeierstrassCurve WeierstrassCurve.Affine IsDedekindDomain IsDedekindDomain.HeightOneSpectrum
open IsLocalRing WithZero TunnellCMLocalUnit
lemma exists_divisor (n l : ℕ) (hn : n%8=2) (h2 : 2<n) : ∃ q : ℕ, q.Prime ∧ q∣4*n ∧ q≠l := by
  by_cases e : l=2
  · obtain ⟨q,hq,hd⟩ := Nat.exists_prime_and_dvd (n := n/2) (by omega)
    have hn2 : 2*(n/2)=n := by omega
    refine ⟨q,hq,hd.trans ((show n/2∣n from ⟨2,by omega⟩).trans (dvd_mul_left _ _)),?_⟩
    intro he
    rw [he,e] at hd
    omega
  · exact ⟨2,Nat.prime_two,dvd_mul_of_dvd_left (by decide) _,Ne.symm e⟩
lemma const_prod {G : Type*} [CommGroupWithZero G] {ι : Type*} (s:Finset ι) (w:ι→ℤ) {c:G} (hc:c≠0) :
    (∏ i ∈ s, c^(w i))=c^(∑ i ∈ s, w i) := by
  classical
  induction s using Finset.induction_on with
  | empty => simp
  | insert i s hi ih => simp [hi,ih,zpow_add₀ hc]
variable {R K : Type*} [CommRing R] [IsDedekindDomain R] [Field K] [CharZero K] [Algebra R K] [IsFractionRing R K]
  {v : HeightOneSpectrum R} {W : Affine (v.adicCompletion K)} {W₀ : WeierstrassCurve (v.adicCompletionIntegers K)}
  (hW : W₀.map (algebraMap (v.adicCompletionIntegers K) (v.adicCompletion K))=W)
  [DecidableEq (v.adicCompletion K)] [DecidableEq (ResidueField (v.adicCompletionIntegers K))]
  [W.IsElliptic] [W₀.IsElliptic]
theorem valuation_one {ι κ : Type*} (s:Finset ι) (t:Finset κ) (w : ι→ℤ) (hw : ∑ i ∈ s,w i=0)
    (x y : ι → v.adicCompletion K) (u v' : κ → v.adicCompletion K) (c : v.adicCompletion K) (hc : c≠0)
    (hp : ∀ i, W.Nonsingular (x i) (y i)) (hq : ∀ j, W.Nonsingular (u j) (v' j))
    (a : ℕ) (ht : ∀ j∈t, a • Point.some (u j) (v' j) (hq j)=0)
    (hP : ∀ i∈s, a • adicRed hW (Point.some (x i) (y i) (hp i))≠0) :
    Valued.v (∏ i ∈ s, (∏ j ∈ t,c*(x i-u j))^w i)=1 := by
  classical
  let D := ∏ j ∈ t, Valued.v c * max 1 (Valued.v (u j))
  have hD : D≠0 := Finset.prod_ne_zero_iff.mpr (fun j _ => mul_ne_zero ((Valuation.ne_zero_iff Valued.v).mpr hc) (ne_of_gt (lt_of_lt_of_le zero_lt_one (le_max_left _ _))))
  have hval (i) (hi:i∈s) (j) (hj:j∈t) : Valued.v (x i-u j)=max 1 (Valued.v (u j)) := by
    let P := Point.some (x i) (y i) (hp i)
    let Q := Point.some (u j) (v' j) (hq j)
    let ρ := adicRedHom hW
    have hQ : a • ρ Q=0 := by rw [← map_nsmul,ht _ hj,map_zero]
    have hP' : a • ρ P≠0 := hP _ hi
    apply difference_value (hP := hp i) (hQ := hq j) hW
    · intro h; exact hP' (by change a • adicRed hW P=0; rw [h,nsmul_zero])
    · intro h; exact hP' ((congrArg (a • ·) h).trans hQ)
    · intro h; exact hP' (by change a • adicRed hW P=0; rw [h]; change a • (-ρ Q)=0; exact (smul_neg a (ρ Q)).trans (neg_eq_zero.mpr hQ))
  have e (i) (hi:i∈s) : Valued.v (∏ j ∈ t,c*(x i-u j))=D := by
    rw [map_prod]
    apply Finset.prod_congr rfl
    intro j hj
    rw [map_mul,hval i hi j hj]
  rw [map_prod]
  calc
    _ = ∏ i ∈ s,D^w i := Finset.prod_congr rfl (fun i hi => by rw [map_zpow₀,e i hi])
    _ = 1 := by rw [const_prod s w hD,hw,zpow_zero]
theorem global_unit (u:K) (hu:u≠0) (h:∀ w:HeightOneSpectrum R,w.valuation K u=1) :
    ∃ z:Rˣ, algebraMap R K z=u := by
  obtain ⟨a,ha⟩ := mem_integers_of_valuation_le_one K u (fun w => (h w).le)
  obtain ⟨b,hb⟩ := mem_integers_of_valuation_le_one (R := R) K u⁻¹ (fun w => by simp [map_inv₀,h])
  have e : a*b=1 := (IsFractionRing.injective R K) (by rw [map_mul,ha,hb,mul_inv_cancel₀ hu,map_one])
  exact ⟨⟨a,b,e,mul_comm b a ▸ e⟩,ha⟩
end TunnellCMUnitCriterion
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
theorem nonsingular (P : W.toAffine.Point) (h : P ≠ 0) : W.toAffine.Nonsingular (X P) (Y P) := by
  cases P with
  | zero => exact (h rfl).elim
  | some x y hp => exact hp
theorem coords (P : W.toAffine.Point) (h : P ≠ 0) :
    Point.some (X P) (Y P) (nonsingular P h) = P := by
  cases P with
  | zero => exact (h rfl).elim
  | some => rfl
theorem X_change [DecidableEq F] [W.IsElliptic] (C : VariableChange F)
    (P : (C • W).toAffine.Point) (h : P ≠ 0) :
    X (Point.equivVariableChange W C P) = (C.u : F)^2 * X P + C.r := by
  cases P with
  | zero => exact (h rfl).elim
  | some => rfl
variable {R K : Type*} [CommRing R] [IsDedekindDomain R] [Field K] [CharZero K]
  [Algebra R K] [IsFractionRing R K] {v : HeightOneSpectrum R}
theorem in_model (E : WeierstrassCurve (v.adicCompletion K)) [E.IsElliptic]
    (C : VariableChange (v.adicCompletion K)) (W₀ : WeierstrassCurve (v.adicCompletionIntegers K))
    (hW : W₀.map (algebraMap _ (v.adicCompletion K)) = C • E) [W₀.IsElliptic]
    [DecidableEq (v.adicCompletion K)] [DecidableEq (ResidueField (v.adicCompletionIntegers K))]
    {ι κ : Type*} [Fintype ι] [Fintype κ] (w : ι → ℤ) (hw : ∑ i, w i = 0)
    (U : ι → E.toAffine.Point) (V : E.toAffine.Point) (Q : κ → E.toAffine.Point)
    {l q f m a : ℕ} (hl : l.Prime) (hq : q.Prime) (hql : q ≠ l)
    (hlm : (l : v.adicCompletionIntegers K) ∈ maximalIdeal _)
    (hf : 0 < f) (hqf : q ∣ f) (hc : q.Coprime (a*m))
    (hU : ∀ i, addOrderOf (U i) = f) (hV : m • V = 0)
    (hQ : ∀ j, a • Q j = 0) (hQ0 : ∀ j, Q j ≠ 0) :
    Valued.v (∏ i, (∏ j, (X (U i + V) - X (Q j))) ^ w i) = 1 := by
  let e := Point.equivVariableChange E C
  let P i := e.symm (U i + V)
  let T j := e.symm (Q j)
  have hT0 j : T j ≠ 0 := fun h => hQ0 j (e.symm.injective (h.trans (map_zero e.symm).symm))
  have hT j : a • T j = 0 := by dsimp [T]; rw [← map_nsmul,hQ,map_zero]
  have hP i : a • adicRed hW (P i) ≠ 0 := by
    dsimp [P]
    rw [map_add]
    exact separated hW hl hq hql hlm hf hqf hc (e.symm (U i)) (e.symm V)
      ((addOrderOf_injective e.symm.toAddMonoidHom e.symm.injective (U i)).trans (hU i))
      (by rw [← map_nsmul,hV,map_zero])
  have hP0 i : P i ≠ 0 := by
    intro hh
    apply hP i
    rw [hh,show adicRed hW 0 = 0 from (adicRedHom hW).map_zero,nsmul_zero]
  have hx i j : X (U i + V)-X (Q j)=(C.u : v.adicCompletion K)^2*(X (P i)-X (T j)) := by
    have eP := X_change C (P i) (hP0 i)
    have eT := X_change C (T j) (hT0 j)
    change X (e (e.symm (U i + V))) = _ at eP
    change X (e (e.symm (Q j))) = _ at eT
    rw [e.apply_symm_apply] at eP eT
    rw [eP,eT]
    ring
  simp_rw [hx]
  apply valuation_one hW Finset.univ Finset.univ w hw
    (fun i => X (P i)) (fun i => Y (P i)) (fun j => X (T j)) (fun j => Y (T j)) _
    (pow_ne_zero _ C.u.ne_zero) (fun i => nonsingular _ (hP0 i)) (fun j => nonsingular _ (hT0 j)) a
  · intro j _; rw [coords _ (hT0 j)]; exact hT j
  · intro i _; rw [coords _ (hP0 i)]; exact hP i
theorem residue_prime (K : Type*) [Field K] [NumberField K] (v : HeightOneSpectrum (𝓞 K)) :
    ∃ l : ℕ, l.Prime ∧ (l : v.adicCompletionIntegers K) ∈ maximalIdeal _ := by
  let S := 𝓞 K ⧸ v.asIdeal
  let l := ringChar S
  have hl : (l : 𝓞 K) ∈ v.asIdeal := Ideal.Quotient.eq_zero_iff_mem.mp (by
    change Ideal.Quotient.mk v.asIdeal (l : 𝓞 K) = 0
    rw [map_natCast]
    exact CharP.cast_eq_zero S l)
  refine ⟨l,CharP.prime_ringChar S,?_⟩
  have hv := (v.valuation_lt_one_iff_mem (K := K) (l : 𝓞 K)).mpr hl
  have hx : Valued.v (l : v.adicCompletion K) < 1 := by
    have e := v.valuedAdicCompletion_eq_valuation' (l : K)
    change Valued.v (algebraMap K (v.adicCompletion K) (l : K)) = _ at e
    rw [map_natCast] at e
    rw [e]
    simpa using hv
  exact Valuation.Integer.not_isUnit_iff_valuation_lt_one.mpr hx
end TunnellCMModelUnit
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
theorem x_map (P : W.toAffine.Point) :
    X (pointMap W L P) = algebraMap F L (X P) := by
  cases P with
  | zero => change X (pointMap W L 0) = algebraMap F L 0; rw [map_zero,map_zero]; rfl
  | some x y h =>
    simp only [pointMap,AddMonoidHom.comp_apply,AddEquiv.coe_toAddMonoidHom,Point.equivOfEq_some,Point.map_some]
    rfl
variable {K : Type*} [Field K] [NumberField K]
def ModelAt (E : WeierstrassCurve K) (v : HeightOneSpectrum (𝓞 K)) : Prop :=
  ∃ C : VariableChange (v.adicCompletion K), ∃ W₀ : WeierstrassCurve (v.adicCompletionIntegers K),
    W₀.IsElliptic ∧ W₀.map (algebraMap _ (v.adicCompletion K)) = C • E.baseChange (v.adicCompletion K)
theorem model_of_coprime (E : WeierstrassCurve K) (A B : WeierstrassCurve (𝓞 K))
    (C D : VariableChange K) (hC : C • E = A.map (algebraMap _ K))
    (hD : D • E = B.map (algebraMap _ K)) (hc : IsCoprime A.Δ B.Δ)
    (v : HeightOneSpectrum (𝓞 K)) : ModelAt E v := by
  let S := v.adicCompletionIntegers K
  let L := v.adicCompletion K
  let f := algebraMap (𝓞 K) S
  letI : IsScalarTower (𝓞 K) (↥S) L := adicCompletion.instIsScalarTower' (R := 𝓞 K) (K := K) (v := v)
  have build (W : WeierstrassCurve (𝓞 K)) (T : VariableChange K)
      (hT : T • E = W.map (algebraMap _ K)) (u : IsUnit (f W.Δ)) : ModelAt E v := by
    refine ⟨T.map (algebraMap K L),W.map f,⟨by simpa using u⟩,?_⟩
    change (W.map (algebraMap (𝓞 K) S)).map (algebraMap S L) = T.map (algebraMap K L) • E.map (algebraMap K L)
    rw [map_variableChange,hT,map_map,map_map]
    rw [← IsScalarTower.algebraMap_eq (𝓞 K) K L,← IsScalarTower.algebraMap_eq (𝓞 K) S L]
  obtain ⟨a,b,h⟩ := hc.map f
  exact (isUnit_or_isUnit_of_add_one h).elim
    (fun u => build A C hC (isUnit_of_mul_isUnit_right u))
    (fun u => build B D hD (isUnit_of_mul_isUnit_right u))
theorem integral_unit (E : WeierstrassCurve K) [E.IsElliptic] [DecidableEq K]
    (hg : ∀ v, ModelAt E v) {ι κ : Type*} [Fintype ι] [Fintype κ]
    (w : ι → ℤ) (hw : ∑ i, w i = 0) (U : ι → E.toAffine.Point) (V : E.toAffine.Point)
    (Q : κ → E.toAffine.Point) {n m a : ℕ} (hn : n%8=2) (h2 : 2<n)
    (hc : (4*n).Coprime (a*m)) (hU : ∀ i, addOrderOf (U i)=4*n) (hV : m • V=0)
    (hQ : ∀ j, a • Q j=0) (hQ0 : ∀ j, Q j≠0)
    (hu : (∏ i, (∏ j, (X (U i+V) - X (Q j))) ^ w i) ≠ 0) :
    ∃ u : (𝓞 K)ˣ, algebraMap (𝓞 K) K u = ∏ i, (∏ j, (X (U i+V) - X (Q j))) ^ w i := by
  apply global_unit _ hu
  intro v
  classical
  let L := v.adicCompletion K
  let E' := E.baseChange L
  letI : E'.IsElliptic := inferInstanceAs ((E.map (algebraMap K L)).IsElliptic)
  let M := pointMap E L
  have hM := pointMap_inj E L
  obtain ⟨l,hl,hlm⟩ := residue_prime K v
  obtain ⟨q,hq,hqf,hql⟩ := exists_divisor n l hn h2
  obtain ⟨C,W₀,h₀,hW⟩ := hg v
  letI := h₀
  have eqn := in_model E' C W₀ hW w hw (fun i => M (U i)) (M V) (fun j => M (Q j))
    hl hq hql hlm (by omega : 0<4*n) hqf (hc.coprime_dvd_left hqf)
    (fun i => (addOrderOf_injective M hM _).trans (hU i))
    (by rw [← map_nsmul,hV,map_zero]) (fun j => by rw [← map_nsmul,hQ,map_zero])
    (fun j hh => hQ0 j (hM (hh.trans (map_zero M).symm)))
  rw [← v.valuedAdicCompletion_eq_valuation']
  change Valued.v (algebraMap K L (∏ i, (∏ j, (X (U i+V) - X (Q j))) ^ w i)) = 1
  have term (i : ι) (j : κ) : X (M (U i)+M V)-X (M (Q j)) =
      algebraMap K L (X (U i+V)-X (Q j)) := by
    rw [← M.map_add,map_sub,x_map E L,x_map E L]
  change Valued.v (∏ i, (∏ j, (X (M (U i)+M V)-X (M (Q j))))^w i)=1 at eqn
  simp only [term,← map_prod,← map_zpow₀] at eqn
  exact eqn
end TunnellCMGlobalModelUnit
end


/- TunnellCMPotentialGood -/
section
namespace TunnellCoates
abbrev E {K : Type*} [CommRing K] (n : K) : WeierstrassCurve K := ⟨0,0,0,-n^2,0⟩
end TunnellCoates
namespace TunnellCMPotentialGood
open WeierstrassCurve TunnellCoates
def model {R : Type*} [CommRing R] (a:R) : WeierstrassCurve R := ⟨a,0,1,0,0⟩
lemma discr {R : Type*} [CommRing R] (a:R) : (model a).Δ=a^3-27 := by
  simp [model,Δ,b₂,b₄,b₆,b₈]
  ring
lemma vanishes_c6 {R : Type*} [CommRing R] (a:R) (ha : a^6-36*a^3+216=0) : (model a).c₆=0 := by
  simp [model,c₆,b₂,b₄,b₆]
  linear_combination -ha
lemma j_value {K : Type*} [Field K] (W : WeierstrassCurve K) [W.IsElliptic] (hW : W.c₆=0) :
    W.j=1728 := by
  have h := W.c_relation
  rw [hW,zero_pow (by decide : 2≠0),sub_zero] at h
  rw [j,Units.val_inv_eq_inv_val,coe_Δ',← h]
  field_simp [W.isUnit_Δ.ne_zero]
lemma short_c6 {R : Type*} [CommRing R] (n:R) : (E n).c₆=0 := by simp [E,c₆,b₂,b₄,b₆]
lemma parameter (K : Type*) [Field K] [CharZero K] [IsAlgClosed K] :
    ∃ a : integralClosure ℤ K, a^6-36*a^3+216=0 := by
  obtain ⟨d,hd⟩ := IsAlgClosed.exists_pow_nat_eq (3:K) (by decide : 0<2)
  obtain ⟨a,ha⟩ := IsAlgClosed.exists_pow_nat_eq (18+6*d) (by decide : 0<3)
  have hd' : IsIntegral ℤ d := IsIntegral.of_pow (n := 2) (by decide) (by rw [hd]; exact isIntegral_natCast (3:ℕ))
  have ha' : IsIntegral ℤ a := IsIntegral.of_pow (n := 3) (by decide) (by rw [ha]; exact (isIntegral_natCast (18:ℕ)).add ((isIntegral_natCast (6:ℕ)).mul hd'))
  refine ⟨⟨a,ha'⟩,Subtype.ext ?_⟩
  change a^6-36*a^3+216=0
  rw [show a^6=(a^3)^2 by ring,ha]
  linear_combination 36*hd
theorem two_models (K : Type*) [Field K] [CharZero K] [IsAlgClosed K] (n:K) (hn : n≠0) :
    ∃ W₁ W₂ : WeierstrassCurve (integralClosure ℤ K), IsCoprime W₁.Δ W₂.Δ ∧
      (∃ C : VariableChange K, C • E n=W₁.map (integralClosure ℤ K).val) ∧
      (∃ C : VariableChange K, C • E n=W₂.map (integralClosure ℤ K).val) := by
  obtain ⟨a,ha⟩ := parameter K
  have hΔ : (model a).Δ*((model a).Δ+18)=27 := by
    rw [discr]
    linear_combination ha
  refine ⟨E 1,model a,?_,?_,?_⟩
  · refine ⟨19,-45*((model a).Δ+18),?_⟩
    rw [E_discriminant,one_pow,mul_one]
    linear_combination -45*hΔ
  · have he : (E (1:integralClosure ℤ K)).map (integralClosure ℤ K).val=E (1:K) := by ext <;> simp [E]
    rw [he]
    letI : (E (1:K)).IsElliptic := E_elliptic (by norm_num) one_ne_zero
    letI : (E n).IsElliptic := E_elliptic (by norm_num) hn
    exact (E n).exists_variableChange_of_j_eq _ ((j_value _ (short_c6 n)).trans (j_value _ (short_c6 (1:K))).symm)
  · have he : (model a).map (integralClosure ℤ K).val=model (a:K) := by ext <;> simp [model]
    rw [he]
    have haK : (a:K)^6-36*(a:K)^3+216=0 := congrArg Subtype.val ha
    have hnK : (model (a:K)).Δ≠0 := by
      intro h
      have e := congrArg ((↑) : integralClosure ℤ K → K) hΔ
      change _= (27:K) at e
      have hdK : ((model (a:K)).Δ)*((model (a:K)).Δ+18)=(27:K) := by
        exact e
      rw [h,zero_mul] at hdK
      norm_num at hdK
    letI : (model (a:K)).IsElliptic := ⟨isUnit_iff_ne_zero.mpr hnK⟩
    letI : (E n).IsElliptic := E_elliptic (by norm_num) hn
    exact (E n).exists_variableChange_of_j_eq _ ((j_value _ (short_c6 n)).trans (j_value _ (vanishes_c6 _ haK)).symm)
end TunnellCMPotentialGood
end


/- TunnellCMGoodDescent -/
section
namespace TunnellCMGoodDescent
open WeierstrassCurve IsDedekindDomain NumberField TunnellCoates TunnellCMGlobalModelUnit
open scoped NumberField
noncomputable section
variable {A : Type*} [Field A] [CharZero A] (K : IntermediateField ℚ A)
def liftInt (u : integralClosure ℤ A) (h : u.val ∈ K) : 𝓞 K :=
  ⟨⟨u.val,h⟩,(isIntegral_algHom_iff (K.val.restrictScalars ℤ) Subtype.val_injective).mp u.property⟩
def modelSupport [DecidableEq A] (W : WeierstrassCurve (integralClosure ℤ A)) : Finset A :=
  {W.a₁.val,W.a₂.val,W.a₃.val,W.a₄.val,W.a₆.val}
def changeSupport [DecidableEq A] (C : VariableChange A) : Finset A :=
  {C.u.val,C.r,C.s,C.t}
lemma lift_model [DecidableEq A] (W : WeierstrassCurve (integralClosure ℤ A))
    (h : ∀ x ∈ modelSupport W, x ∈ K) :
    ∃ W' : WeierstrassCurve (𝓞 K), (W'.map (algebraMap (𝓞 K) K)).map K.val.toRingHom =
      W.map (integralClosure ℤ A).val.toRingHom := by
  refine ⟨⟨liftInt K W.a₁ (h _ (by simp [modelSupport])),liftInt K W.a₂ (h _ (by simp [modelSupport])),
    liftInt K W.a₃ (h _ (by simp [modelSupport])),liftInt K W.a₄ (h _ (by simp [modelSupport])),
    liftInt K W.a₆ (h _ (by simp [modelSupport]))⟩,?_⟩
  rfl
lemma lift_change [DecidableEq A] (C : VariableChange A) (h : ∀ x ∈ changeSupport C, x ∈ K) :
    ∃ C' : VariableChange K, C'.map K.val.toRingHom = C := by
  let u : K := ⟨C.u.val,h _ (by simp [changeSupport])⟩
  have hu : u ≠ 0 := fun h => C.u.ne_zero (congrArg Subtype.val h)
  let r : K := ⟨C.r,h _ (by simp [changeSupport])⟩
  let s : K := ⟨C.s,h _ (by simp [changeSupport])⟩
  let t : K := ⟨C.t,h _ (by simp [changeSupport])⟩
  exact ⟨⟨Units.mk0 u hu,r,s,t⟩,by ext <;> rfl⟩
theorem finite_models (A : Type*) [Field A] [CharZero A] [IsAlgClosed A] (n : ℕ) (hn : 0<n) :
    ∃ S : Finset A, ∀ K : IntermediateField ℚ A, ∀ [NumberField K],
      (∀ x ∈ S, x ∈ K) → ∀ v : HeightOneSpectrum (𝓞 K), ModelAt (E (n:K)) v := by
  classical
  obtain ⟨W,V,⟨a,b,hab⟩,⟨C,hC⟩,⟨D,hD⟩⟩ := TunnellCMPotentialGood.two_models A (n : A) (by exact_mod_cast hn.ne')
  let S := modelSupport W ∪ modelSupport V ∪ changeSupport C ∪ changeSupport D ∪ {a.val,b.val}
  refine ⟨S,fun K _ h v => ?_⟩
  have build (W : WeierstrassCurve (integralClosure ℤ A)) (C : VariableChange A)
      (h1 : ∀ x ∈ modelSupport W, x ∈ K) (h2 : ∀ x ∈ changeSupport C, x ∈ K)
      (hC : C • E (n:A) = W.map (integralClosure ℤ A).val) :
      ∃ W' : WeierstrassCurve (𝓞 K), ∃ C' : VariableChange K,
        C' • E (n:K) = W'.map (algebraMap (𝓞 K) K) ∧
        K.val (algebraMap (𝓞 K) K W'.Δ) = W.Δ.val := by
    obtain ⟨W',hW'⟩ := lift_model K W h1
    obtain ⟨C',hC'⟩ := lift_change K C h2
    refine ⟨W',C',(map_injective K.val.injective ?_),?_⟩
    · change (C' • E (n:K)).map K.val.toRingHom = (W'.map (algebraMap (𝓞 K) K)).map K.val.toRingHom
      rw [← map_variableChange,hC',hW']
      have eqn : (E (n:K)).map K.val.toRingHom = E (n:A) := by ext <;> simp [E]
      rw [eqn,hC]
      rfl
    · have hh := congrArg WeierstrassCurve.Δ hW'
      simp only [map_Δ] at hh
      exact hh
  obtain ⟨W',C',hW,hΔ⟩ := build W C (fun x hx => h x (by simp [S,hx])) (fun x hx => h x (by simp [S,hx])) hC
  obtain ⟨V',D',hV,hΔ'⟩ := build V D (fun x hx => h x (by simp [S,hx])) (fun x hx => h x (by simp [S,hx])) hD
  have ha := h a.val (by simp [S])
  have hb := h b.val (by simp [S])
  apply model_of_coprime _ W' V' C' D' hW hV _ v
  refine ⟨liftInt K a ha,liftInt K b hb,?_⟩
  apply (K.val.injective.comp (FaithfulSMul.algebraMap_injective (𝓞 K) K))
  change K.val (algebraMap (𝓞 K) K (_ * _ + _ * _)) = K.val (algebraMap (𝓞 K) K 1)
  simp only [map_add,map_mul,map_one,hΔ,hΔ']
  exact congrArg Subtype.val hab
end
end TunnellCMGoodDescent
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
lemma x_point (n : ℕ) (P : (E (n:F)).toAffine.Point) :
    X (mapPoint F B n P) = algebraMap F B (X P) := by
  exact (x_equality B _ _).trans (x_map _ B P)
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
def coordinateSet {B : Type*} [Field B] [DecidableEq B] {W : WeierstrassCurve B} {ι : Type*}
    [Fintype ι] (P : ι → W.toAffine.Point) : Finset B :=
  Finset.univ.image (fun i => X (P i)) ∪ Finset.univ.image (fun i => Y (P i))
lemma lift_family {α : Type*} [Fintype α] {n : ℕ} (T : α → (E (n:B)).toAffine.Point)
    (h : ∀ z ∈ coordinateSet T, z ∈ K) : ∀ i, ∃ P', mapPoint K B n P'=T i := by
  intro i
  apply lift_point <;> apply h
  · exact Finset.mem_union_left _ (Finset.mem_image_of_mem _ (Finset.mem_univ i))
  · exact Finset.mem_union_right _ (Finset.mem_image_of_mem _ (Finset.mem_univ i))
theorem absolute_unit (A : Type*) [Field A] [CharZero A] [IsAlgClosed A] [Algebra.IsAlgebraic ℚ A]
    [DecidableEq A] {n m a : ℕ} (hn : n%8=2) (h2 : 2<n) {ι κ : Type*} [Fintype ι] [Fintype κ]
    (w : ι → ℤ) (hw : ∑ i, w i=0) (U : ι → (E (n:A)).toAffine.Point)
    (V : (E (n:A)).toAffine.Point) (Q : κ → (E (n:A)).toAffine.Point)
    (hc : (4*n).Coprime (a*m)) (hU : ∀ i, addOrderOf (U i)=4*n) (hV : m • V=0)
    (hQ : ∀ j, a • Q j=0) (hQ0 : ∀ j, Q j≠0)
    (hu : (∏ i, (∏ j, (X (U i+V)-X (Q j))) ^ w i) ≠ 0) :
    ∃ u : (𝓞 A)ˣ, (u.val : A) = ∏ i, (∏ j, (X (U i+V)-X (Q j))) ^ w i := by
  classical
  obtain ⟨S,hS⟩ := finite_models A n (by omega)
  let C := S ∪ coordinateSet U ∪ coordinateSet Q ∪ {X V,Y V}
  let K := IntermediateField.adjoin ℚ (C : Set A)
  letI : FiniteDimensional ℚ K := IntermediateField.finiteDimensional_adjoin (S := (C : Set A))
    (fun z _ => (Algebra.IsAlgebraic.isAlgebraic z).isIntegral)
  letI : NumberField K := ⟨⟩
  letI : (E (n:K)).IsElliptic := E_elliptic (by norm_num) (by exact_mod_cast (show n≠0 by omega))
  have mem {z : A} (h : z ∈ C) : z ∈ K := IntermediateField.subset_adjoin _ _ h
  choose U' hu' using lift_family K U (fun z h => mem (by simp [C,h]))
  choose Q' hq' using lift_family K Q (fun z h => mem (by simp [C,h]))
  obtain ⟨V',hv'⟩ := lift_point K n V (mem (by simp [C])) (mem (by simp [C]))
  let M := mapPoint K A n
  have hM := mapPoint_injective K A n
  have ev (i : ι) (j : κ) : algebraMap K A (X (U' i+V') - X (Q' j)) = X (U i+V)-X (Q j) := by
    rw [map_sub,← x_point,← x_point,map_add,hu',hv',hq']
  have eqn : algebraMap K A (∏ i, (∏ j, (X (U' i+V')-X (Q' j)))^w i) =
      ∏ i, (∏ j, (X (U i+V)-X (Q j)))^w i := by simp only [map_prod,map_zpow₀,ev]
  obtain ⟨u,eu⟩ := integral_unit (E (n:K)) (hS K (fun z h => mem (by simp [C,h])))
    w hw U' V' Q' hn h2 hc
    (fun i => by rw [← addOrderOf_injective M hM,show M (U' i)=U i from hu' i,hU])
    (hM (by rw [map_nsmul,show M V'=V from hv',hV,map_zero]))
    (fun j => hM (by rw [map_nsmul,show M (Q' j)=Q j from hq' j,hQ,map_zero]))
    (fun j h => hQ0 j (by rw [← hq' j,h,map_zero]))
    (fun h => hu (by rw [← eqn,h,map_zero]))
  refine ⟨Units.map (RingOfIntegers.mapRingHom K.val.toRingHom).toMonoidHom u,?_⟩
  exact (congrArg (algebraMap K A) eu).trans eqn
end
end TunnellCMAbsoluteUnit
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


/- TunnellGaussian -/
section
namespace TunnellGaussian
open GaussianInt
def Primary (z : GaussianInt) : Prop := (⟨2,2⟩ : GaussianInt) ∣ z-1
lemma primary_iff (z : GaussianInt) :
    Primary z ↔ z.im % 2 = 0 ∧ (z.re + z.im) % 4 = 1 := by
  constructor
  · rintro ⟨⟨u,v⟩,h⟩
    have ha := congrArg Zsqrtd.re h
    have hb := congrArg Zsqrtd.im h
    change z.re - 1 = 2*u + -1*2*v at ha
    change z.im - 0 = 2*v + 2*u at hb
    omega
  · rintro ⟨h₁,h₂⟩
    refine ⟨⟨(z.re + z.im - 1)/4, (z.im - z.re + 1)/4⟩, ?_⟩
    ext
    · change z.re - 1 = 2*((z.re + z.im - 1)/4) + -1*2*((z.im - z.re + 1)/4)
      omega
    · change z.im - 0 = 2*((z.im - z.re + 1)/4) + 2*((z.re + z.im - 1)/4)
      omega
lemma primary_mul_iff {z w : GaussianInt} (hz : Primary z) : Primary (z*w) ↔ Primary w := by
  have h : (⟨2,2⟩ : GaussianInt) ∣ (z-1)*w := dvd_mul_of_dvd_left hz _
  unfold Primary
  rw [show z*w - 1 = (z-1)*w + (w-1) by ring, dvd_add_right h]
lemma norm_sq (z : GaussianInt) : z.norm = z.re^2 + z.im^2 := by rw [Zsqrtd.norm_def]; ring
end TunnellGaussian
end


/- TunnellCMLComplete -/
section
namespace TunnellSplit
open Finset
open scoped ComplexConjugate
variable {F : Type*} [Field F] [Fintype F] [DecidableEq F]
end TunnellSplit
namespace TunnellInert
open Finset Polynomial
end TunnellInert
namespace TunnellSplitMass
open Finset TunnellGaussian
end TunnellSplitMass
namespace TunnellJacobiFiniteBridge
open Polynomial Finset
end TunnellJacobiFiniteBridge
namespace TunnellEtaLattice
open Finset TunnellGaussian
end TunnellEtaLattice
namespace TunnellQBin
open Polynomial Finset
variable {R : Type*} [CommRing R]
end TunnellQBin
namespace TunnellBalanced
open Finset
variable {K : Type*} [Field K]
end TunnellBalanced
namespace TunnellCubicFinite
open Finset Polynomial TunnellQBin
open LaurentPolynomial hiding C
end TunnellCubicFinite
namespace TunnellCubicFinite
open Polynomial Finset TunnellQBin
end TunnellCubicFinite
namespace TunnellTruncated
open TunnellQBin Polynomial Finset
variable {R : Type*} [CommRing R]
end TunnellTruncated
namespace TunnellArithmetic
open Polynomial Finset TunnellGaussian TunnellEtaLattice
end TunnellArithmetic
namespace TunnellCMLSeries
open Finset TunnellGaussian
noncomputable def twistSign (n m : ℕ) : ℤ := if Odd m then jacobiSym n m else 0
end TunnellCMLSeries
namespace TunnellCMLSeries
open TunnellGaussian OMA.R_CongruentNumber_Tunnell_even_R1 Finset
lemma twistSign_mul (n a b : ℕ) : twistSign n (a*b) = twistSign n a * twistSign n b := by
  by_cases ha : Odd a <;> by_cases hb : Odd b <;> simp [twistSign, Nat.odd_mul, ha, hb]
  exact jacobiSym.mul_right' _ (fun e => by simp [e] at ha) (fun e => by simp [e] at hb)
end TunnellCMLSeries
end


/- TunnellCMResidues -/
section
namespace TunnellCMLSeries
open TunnellGaussian Finset
abbrev Residues (n : ℕ) := ZMod (4*n) × ZMod (4*n)
def residue (n : ℕ) (z : GaussianInt) : Residues n := (z.re, z.im)
def liftResidue {n : ℕ} (r : Residues n) : GaussianInt := ⟨r.1.val,r.2.val⟩
lemma residue_lift {n : ℕ} (hn : 0<n) (r : Residues n) : residue n (liftResidue r) = r := by
  letI : NeZero (4*n) := ⟨by omega⟩
  simp [liftResidue,residue]
noncomputable def charWeight (n : ℕ) (z : GaussianInt) : ℤ := by
  classical exact if Primary z then twistSign n z.norm.natAbs else 0
lemma twistSign_mod (n m : ℕ) : twistSign n (m % (4*n)) = twistSign n m := by
  have he : Even (4*n) := Even.mul_right (by decide) _
  have h : Odd (m % (4*n)) ↔ Odd m := by
    simp only [Nat.odd_iff, Nat.mod_mod_of_dvd _ he.two_dvd]
  by_cases hm : Odd m
  · simpa [twistSign, h, hm] using (jacobiSym.mod_right' n hm).symm
  · simp [twistSign, h, hm]
theorem charWeight_residue (n : ℕ) {z w : GaussianInt} (h : residue n z = residue n w) :
    charWeight n z = charWeight n w := by
  have ha := (ZMod.intCast_eq_intCast_iff _ _ _).mp (congrArg Prod.fst h)
  have hb := (ZMod.intCast_eq_intCast_iff _ _ _).mp (congrArg Prod.snd h)
  change z.re ≡ w.re [ZMOD ↑(4*n)] at ha
  change z.im ≡ w.im [ZMOD ↑(4*n)] at hb
  have h2 : (2:ℤ) ∣ (↑(4*n) : ℤ) := by exact_mod_cast (dvd_mul_of_dvd_left (by decide : 2∣4) n)
  have h4 : (4:ℤ) ∣ (↑(4*n) : ℤ) := by exact_mod_cast dvd_mul_right 4 n
  have hpr : Primary z ↔ Primary w := by
    rw [primary_iff,primary_iff,(hb.of_dvd h2).eq,((ha.add hb).of_dvd h4).eq]
  have hnorm : (z.norm.natAbs : ℕ) ≡ w.norm.natAbs [MOD 4*n] := by
    apply Int.natCast_modEq_iff.mp
    rw [GaussianInt.natCast_natAbs_norm,GaussianInt.natCast_natAbs_norm,norm_sq,norm_sq]
    exact (ha.pow 2).add (hb.pow 2)
  classical
  simp only [charWeight,hpr]
  have he := (twistSign_mod n z.norm.natAbs).symm.trans ((congrArg (twistSign n) hnorm).trans (twistSign_mod n w.norm.natAbs))
  rw [he]
end TunnellCMLSeries
end


/- TunnellCMCritical -/
section
namespace TunnellCMCritical
open Complex Filter Set TunnellCMRegularized TunnellCMLSeries
open scoped Topology ComplexConjugate
noncomputable def aux (n : ℕ) := 1+3*(4*n)
end TunnellCMCritical
end


/- TunnellCMDistribution -/
section
namespace TunnellCMDistribution
open Complex Filter Set
open scoped Topology PeriodPair
abbrev Grid (a : ℕ) := Fin a × Fin a
noncomputable def liftGrid (L : PeriodPair) {a : ℕ} (j : Grid a) : ℂ :=
  ((j.1.val:ℂ)*L.ω₁+(j.2.val:ℂ)*L.ω₂)/(a:ℂ)
def regular (L : PeriodPair) (a : ℕ) := {z : ℂ | (a:ℂ)*z ∉ L.lattice}
lemma mul_lift (L : PeriodPair) {a : ℕ} [NeZero a] (j : Grid a) :
    (a:ℂ)*liftGrid L j ∈ L.lattice := by
  have ha : (a:ℂ)≠0 := by exact_mod_cast NeZero.ne a
  rw [liftGrid,← mul_div_assoc,mul_div_cancel_left₀ _ ha]
  exact PeriodPair.mem_lattice.mpr ⟨(j.1.val:ℤ),(j.2.val:ℤ),by simp⟩
lemma mul_mem (L : PeriodPair) (a : ℕ) {z : ℂ} (hz : z ∈ L.lattice) :
    (a:ℂ)*z ∈ L.lattice := by
  rw [← nsmul_eq_mul]
  exact L.lattice.nsmul_mem hz _
lemma sub_regular (L : PeriodPair) {a : ℕ} [NeZero a] {z : ℂ} (hz : z∈regular L a) (j : Grid a) :
    z-liftGrid L j ∉ L.lattice := fun h => hz (by simpa [mul_sub] using add_mem (mul_mem L a h) (mul_lift L j))
lemma add_regular (L : PeriodPair) {a : ℕ} [NeZero a] {z : ℂ} (hz : z∈regular L a) (j : Grid a) :
    z+liftGrid L j ∉ L.lattice := fun h => hz (by simpa [mul_add] using sub_mem (mul_mem L a h) (mul_lift L j))
open TunnellEllipticZeta
end TunnellCMDistribution
end


/- TunnellCMEllipticUnit -/
section
namespace TunnellCMEllipticUnit
open Complex Set Filter TunnellEllipticZeta TunnellCMDistribution
open scoped Topology PeriodPair
open LSG.Weierstrass (sigma sigma_identity logDeriv_sigma weierstrassP_eq_iff)
noncomputable def divisionGrid (L : PeriodPair) (a : ℕ) : Finset (Grid a) := by
  classical exact Finset.univ.filter (fun j => liftGrid L j ∉ L.lattice)
noncomputable def divisionProduct (L : PeriodPair) (a : ℕ) (z : ℂ) :=
  ∏ j ∈ divisionGrid L a, (L.weierstrassP z - L.weierstrassP (liftGrid L j))
end TunnellCMEllipticUnit
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


/- TunnellCMWeights -/
section
namespace TunnellCMWeights
open TunnellCMLSeries TunnellGaussian
def mover (n : ℕ) : GaussianInt := ⟨1+n,n⟩
lemma mover_primary (n : ℕ) (hn : n%8=2) : Primary (mover n) := by
  rw [primary_iff]
  dsimp [mover]
  omega
lemma mover_norm (n : ℕ) : (mover n).norm.natAbs = 1 + 2*n + 2*n^2 := by
  rw [← Int.natCast_inj,GaussianInt.natCast_natAbs_norm,norm_sq]
  simp [mover]
  ring
lemma mover_sign (n : ℕ) (hn : n%8=2) : twistSign n (mover n).norm.natAbs = -1 := by
  let d := n/2
  have hd : d%4=1 := by dsimp [d]; omega
  have h₀ : n=2*d := by dsimp [d]; omega
  let m := 1 + 2*n + 2*n^2
  have hm8 : m%8=5 := by
    have e : n = 2+8*(n/8) := by omega
    dsimp [m]
    conv_lhs => rw [e]
    rw [show 1+2*(2+8*(n/8))+2*(2+8*(n/8))^2 =
        5+8*(1+10*(n/8)+16*(n/8)^2) by ring]
    simp
  have hm : Odd m := Nat.odd_iff.mpr (by omega)
  rw [mover_norm]
  change twistSign n m = -1
  rw [twistSign,if_pos hm,show (n:ℤ)=2*(d:ℤ) by exact_mod_cast h₀,
    jacobiSym.mul_left,jacobiSym.at_two hm,ZMod.χ₈_nat_mod_eight,hm8,
    jacobiSym.quadratic_reciprocity_one_mod_four hd hm]
  have he : (m:ℤ) % (d:ℤ) = 1 % (d:ℤ) := by
    dsimp [m]; rw [h₀]; push_cast
    rw [show (1+(2:ℤ)*(2*d)+2*(2*d)^2)=1+(4+8*d)*d by ring,Int.add_mul_emod_self_right]
  rw [jacobiSym.mod_left' he,jacobiSym.one_left]
  decide
lemma weight_move (n : ℕ) (hn : n%8=2) (x : GaussianInt) :
    charWeight n (mover n*x) = -charWeight n x := by
  classical
  simp only [charWeight,primary_mul_iff (mover_primary n hn),Zsqrtd.norm_mul,Int.natAbs_mul,
    twistSign_mul,mover_sign _ hn]
  split_ifs <;> ring
def forward (n : ℕ) (r : Residues n) : Residues n :=
  (r.1+n*(r.1-r.2), r.2+n*(r.1+r.2))
lemma forward_residue (n : ℕ) (x : GaussianInt) :
    residue n (mover n*x) = forward n (residue n x) := by
  ext <;> simp [residue,forward,mover] <;> ring
noncomputable def permutation (n : ℕ) (hn : n%8=2) : Equiv.Perm (Residues n) where
  toFun := forward n
  invFun := fun r => (r.1-n*(r.1-r.2), r.2-n*(r.1+r.2))
  left_inv := by
    have h : (2:ZMod (4*n))*n^2=0 := by
      have he : 2*n^2=(4*n)*(n/2) := by
        have e : n=2*(n/2) := by omega
        calc
          2*n^2 = 2*n*n := by ring
          _ = (4*n)*(n/2) := by nth_rw 2 [e]; ring
      exact_mod_cast (show ((2*n^2:ℕ):ZMod (4*n))=0 by rw [he,Nat.cast_mul,ZMod.natCast_self,zero_mul])
    intro r
    apply Prod.ext <;> dsimp [forward] <;>
      first | linear_combination r.2*h | linear_combination -r.1*h
  right_inv := by
    have h : (2:ZMod (4*n))*n^2=0 := by
      have he : 2*n^2=(4*n)*(n/2) := by
        have e : n=2*(n/2) := by omega
        calc
          2*n^2 = 2*n*n := by ring
          _ = (4*n)*(n/2) := by nth_rw 2 [e]; ring
      exact_mod_cast (show ((2*n^2:ℕ):ZMod (4*n))=0 by rw [he,Nat.cast_mul,ZMod.natCast_self,zero_mul])
    intro r
    apply Prod.ext <;> dsimp [forward] <;>
      first | linear_combination r.2*h | linear_combination -r.1*h
theorem weight_sum_zero (n : ℕ) (hn : n%8=2) :
    letI : NeZero (4*n) := ⟨by omega⟩
    ∑ r : Residues n, charWeight n (liftResidue r) = 0 := by
  letI : NeZero (4*n) := ⟨by omega⟩
  have hp : 0<n := by omega
  have e (r : Residues n) : charWeight n (liftResidue (permutation n hn r)) = -charWeight n (liftResidue r) := by
    rw [← weight_move n hn]
    apply charWeight_residue
    rw [residue_lift hp,forward_residue,residue_lift hp]
    rfl
  have h := Equiv.sum_comp (permutation n hn) (fun r => charWeight n (liftResidue r))
  simp only [e,Finset.sum_neg_distrib] at h
  omega
end TunnellCMWeights
end


/- TunnellCMUnitTrace -/
section
namespace TunnellCMUnitTrace
open Complex Finset TunnellCMLSeries TunnellCMCritical TunnellCMLemniscate
open TunnellCMEllipticUnit TunnellCMDistribution TunnellEllipticZeta TunnellCoates
open scoped ComplexConjugate
noncomputable def dilation (n : ℕ) : ℝ := realPeriod n / (4*n)
noncomputable def point (n : ℕ) (r : Residues n) : ℂ := (dilation n:ℂ)*(liftResidue r:ℂ)
noncomputable def weight (n : ℕ) (r : Residues n) := charWeight n (liftResidue r)
noncomputable def traceUnit (n : ℕ) (hn : 0<n) (Z : ℂ) : ℂ := by
  classical
  letI : NeZero (4*n) := ⟨by omega⟩
  exact ∏ r ∈ univ.filter (fun r => weight n r ≠ 0),
    divisionProduct (twistPeriods n hn) (aux n) (Z+point n r) ^ weight n r
lemma division_nonzero (M : PeriodPair) (a : ℕ) [NeZero a] {z : ℂ} (hz : z∈regular M a) :
    divisionProduct M a z ≠ 0 := by
  classical
  apply Finset.prod_ne_zero_iff.mpr
  intro j hj
  have hs : z∉M.lattice := fun h => hz (mul_mem M a h)
  have ht : liftGrid M j∉M.lattice := (Finset.mem_filter.mp hj).2
  exact sub_ne_zero.mpr (fun h => ((LSG.Weierstrass.weierstrassP_eq_iff M ht hs).mp h).elim
    (sub_regular M hz j) (add_regular M hz j))
end TunnellCMUnitTrace
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
lemma conductor_point (r : Residues n) : ((4*n:ℕ):ℂ)*point n r∈((twistPeriods n hn)).lattice := by
  apply PeriodPair.mem_lattice.mpr
  let g := liftResidue r
  refine ⟨g.re,g.im,?_⟩
  change (g.re:ℂ)*(realPeriod n:ℂ)+g.im*(I*(realPeriod n:ℂ))= ((4*n:ℕ):ℂ)*((dilation n:ℂ)*(g:ℂ))
  rw [GaussianInt.toComplex_def]
  dsimp [dilation]
  push_cast
  have hN : (n:ℂ)≠0 := by exact_mod_cast hn.ne'
  field_simp [hN]
  <;> ring
end TunnellCMAlgebraicUnits
end


/- TunnellCMConductorOrder -/
section
namespace TunnellCMConductorOrder
open Complex LSG.Weierstrass LSG.LemniscateIndep TunnellCMLemniscate TunnellCMDistribution
open TunnellCMUnitTrace TunnellCMLSeries TunnellCMCritical TunnellCoates TunnellGaussian
lemma weight_coprime {n : ℕ} (r : Residues n) (hr : weight n r≠0) :
    (liftResidue r).norm.natAbs.Coprime (4*n) := by
  classical
  let g := liftResidue r
  change charWeight n g≠0 at hr
  have hp : Primary g := by by_contra h; exact hr (by simp [charWeight,h])
  have ho : Odd g.norm.natAbs := by by_contra h; exact hr (by simp [charWeight,hp,twistSign,h])
  have hn : jacobiSym n g.norm.natAbs≠0 := by simpa [charWeight,hp,twistSign,ho] using hr
  have hg : g.norm.natAbs≠0 := by intro h; rw [h] at ho; simpa using ho
  letI : NeZero g.norm.natAbs := ⟨hg⟩
  have e : (n:ℤ).gcd g.norm.natAbs=1 := by by_contra hh; exact hn (jacobiSym.eq_zero_iff_not_coprime.mpr hh)
  have ec : n.Coprime g.norm.natAbs := by simpa [Int.gcd_eq_natAbs] using e
  exact Nat.coprime_mul_iff_right.mpr ⟨by simpa using ho.coprime_two_right.pow_right 2,ec.symm⟩
variable (n : ℕ) (hn : 0<n)
theorem conductor_order (r : Residues n) (hr : weight n r≠0) :
    addOrderOf (expE (twistPeriods n hn) (point n r))=4*n := by
  let g := liftResidue r
  let f := 4*n
  have hf : (f:ℂ)≠0 := by exact_mod_cast (show f≠0 by dsimp [f]; omega)
  have hω : (realPeriod n:ℂ)≠0 := ofReal_ne_zero.mpr (realPeriod_pos (by exact_mod_cast hn)).ne'
  have hpt : point n r=(realPeriod n:ℂ)*(g:ℂ)/(f:ℂ) := by
    dsimp [f,point,dilation,g]
    push_cast
    ring
  have hg : IsCoprime g (f:GaussianInt) := by
    have h := (weight_coprime r hr).isCoprime.map (Int.castRingHom GaussianInt)
    have hg0 : g∣(g.norm.natAbs:GaussianInt) := by
      rw [GaussianInt.natCast_natAbs_norm,Zsqrtd.norm_eq_mul_conj]
      exact dvd_mul_right _ _
    apply IsCoprime.of_isCoprime_of_dvd_left _ hg0
    simpa [g,f] using h
  apply Nat.dvd_antisymm
  · apply addOrderOf_dvd_of_nsmul_eq_zero
    apply (TunnellCMTranscendental.analytic_killed (twistPeriods n hn) _ _).mpr
    exact TunnellCMAlgebraicUnits.conductor_point n hn r
  · let k := addOrderOf (expE (twistPeriods n hn) (point n r))
    have e := (TunnellCMTranscendental.analytic_killed (twistPeriods n hn) k _).mp (addOrderOf_nsmul_eq_zero _)
    rw [hpt,mem_lattice_sq (a := realPeriod n) rfl rfl] at e
    obtain ⟨u,v,he⟩ := e
    let b : GaussianInt := ⟨u,v⟩
    have hd : (f:GaussianInt)∣(k:GaussianInt)*g := by
      refine ⟨b,GaussianInt.toComplex_inj.mp ?_⟩
      change GaussianInt.toComplex _=GaussianInt.toComplex _
      rw [map_mul,map_mul,map_natCast,map_natCast]
      change (k:ℂ)*(g:ℂ)=(f:ℂ)*(b:ℂ)
      rw [GaussianInt.toComplex_def' u v]
      field_simp [hf] at he
      simpa only [mul_comm] using he.symm
    have e' := hg.symm.dvd_of_dvd_mul_right hd
    obtain ⟨b,hb⟩ := e'
    have hh : (k:ℤ)=(f:ℤ)*b.re := by simpa using congrArg Zsqrtd.re hb
    exact_mod_cast (show (f:ℤ)∣(k:ℤ) from ⟨_,hh⟩)
end TunnellCMConductorOrder
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
end TunnellCMTorsionOrder
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
lemma killed {m : ℕ} {z : ℂ} (h : (m:ℂ)*z ∈ ((twistPeriods n hn)).lattice) : m • uniformize n hn z=0 := by
  rw [← map_nsmul,nsmul_eq_mul,uniformize_apply,expE_of_mem (twistPeriods n hn) h,map_zero]
end
end TunnellCMCriticalIntegers
end


/- TunnellCMPrimeToConductor -/
section
namespace TunnellCMPrimeToConductor
open Complex LSG.Weierstrass TunnellCMLemniscate TunnellCMDistribution TunnellCMEllipticUnit
open TunnellCMCritical TunnellCMLSeries TunnellCMUnitTrace TunnellCMNormDistribution
open TunnellCMTraceDistribution TunnellCMCriticalIntegers TunnellCMToricDivision
open scoped NumberField
noncomputable section
variable (n : ℕ) (hn : 0<n)
theorem translated_regular {m : ℕ} (hc : (4*n).Coprime (aux n*m))
    {z : ℂ} (hz : (m:ℂ)*z∈((twistPeriods n hn)).lattice) (i : Residues n) (hi : weight n i≠0) :
    z+point n i∈regular (twistPeriods n hn) (aux n) := by
  intro hbad
  have h := (TunnellCMTranscendental.analytic_killed (twistPeriods n hn) _ _).mpr hbad
  have h' := congrArg (m • ·) h
  have hZ := (TunnellCMTranscendental.analytic_killed (twistPeriods n hn) _ _).mpr hz
  have hz' : (aux n*m) • expE (twistPeriods n hn) z=0 := by rw [← smul_smul,hZ,nsmul_zero]
  have H : (aux n*m) • expE (twistPeriods n hn) (point n i)=0 := by
    simpa only [expE_add,← mul_nsmul,mul_comm m (aux n),nsmul_add,hz',zero_add,nsmul_zero] using h'
  have hd := addOrderOf_dvd_of_nsmul_eq_zero H
  rw [TunnellCMConductorOrder.conductor_order n hn i hi] at hd
  have he := hc.gcd_eq_one
  rw [Nat.gcd_eq_left hd] at he
  omega
end
end TunnellCMPrimeToConductor
end


/- TunnellPublicUnitRepresentation -/
section
namespace TunnellPublicUnitRepresentation
open WeierstrassCurve WeierstrassCurve.Affine NumberField Complex LSG.Weierstrass
open TunnellCoates TunnellCMLemniscate TunnellCMDistribution TunnellCMEllipticUnit
open TunnellCMCritical TunnellCMUnitTrace TunnellCMLSeries TunnellCMModelUnit TunnellCMAbsoluteUnit
open TunnellCMNormDistribution TunnellCMAlgebraicUnits TunnellCMCriticalIntegers
open scoped NumberField
noncomputable section
open Complex NumberField IsDedekindDomain IntermediateField IsLocalRing Set MeasureTheory
open scoped Classical NumberField
def Representation : Prop :=
  ∀ (n : ℕ) (hn : 0<n),
  letI : NeZero (4*n) := ⟨Nat.ne_of_gt (Nat.mul_pos (by decide) hn)⟩
  let a := 1+3*(4*n)
  let ω : ℝ := (∫ x in Ioi (n:ℝ), (Real.sqrt (x^3-(n:ℝ)^2*x))⁻¹)
  let b (v : ZMod (4*n) × ZMod (4*n)) : GaussianInt := ⟨v.1.val,v.2.val⟩
  let χ (v : ZMod (4*n) × ZMod (4*n)) : ℤ :=
    let m := (b v).norm.natAbs
    if (⟨2,2⟩:GaussianInt) ∣ b v-1 then (if Odd m then jacobiSym n m else 0) else 0
  ∀ M : PeriodPair, M.ω₁=(ω:ℂ) → M.ω₂=Complex.I*(ω:ℂ) →
  let t (j : Fin a × Fin a) : ℂ := ((j.1.val:ℂ)*M.ω₁+(j.2.val:ℂ)*M.ω₂)/(a:ℂ)
  let D (z : ℂ) := ∏ j ∈ Finset.univ.filter (fun j => t j ∉ M.lattice),
    (M.weierstrassP z-M.weierstrassP (t j))
  let G (z : ℂ) := ∏ v ∈ Finset.univ.filter (fun v => χ v≠0),
    D (z+((ω/(4*n):ℝ):ℂ)*(b v:ℂ))^χ v
  n%8=2 → 2<n → ∀ m:ℕ, 0 < m → (4*n).Coprime (a*m) → ∀ z:ℂ, (m:ℂ)*z∈M.lattice →
  let A:=algebraicClosure ℚ ℂ
  let W:WeierstrassCurve A:=⟨0,0,0,-(n:A)^2,0⟩
  ∃ X:W.toAffine.Point→A, (X 0=0 ∧ ∀ x y (h:W.toAffine.Nonsingular x y), X (.some x y h)=x) ∧ ∃ (ι κ:Type) (hi:Fintype ι) (hk:Fintype κ), letI:=hi; letI:=hk;
    ∃ (w:ι→ℤ) (U:ι→W.toAffine.Point) (V:W.toAffine.Point) (Q:κ→W.toAffine.Point),
    let H:=∏ i,(∏ j,(X (U i+V)-X (Q j)))^w i
    (∑ i,w i=0) ∧ (∀ i,addOrderOf (U i)=4*n) ∧ (m • V=0) ∧ (∀ j,a • Q j=0) ∧ (∀ j,Q j≠0) ∧ (H≠0) ∧ (H:ℂ)=G z
set_option maxHeartbeats 1200000 in
theorem result : Representation := by
  refine fun n hn M hx hy hn8 h2 m hm hc z hz => ?_
  have eM : M=twistPeriods n hn := by
    rcases M with ⟨x,y,h⟩
    change x=_ at hx
    change y=_ at hy
    subst x
    subst y
    rfl
  subst M
  classical
  letI : NeZero (aux n) := ⟨by unfold aux; omega⟩
  letI : NeZero (4*n) := ⟨by omega⟩
  have hu : traceUnit n hn z ≠ 0 := Finset.prod_ne_zero_iff.mpr fun i hi =>
    zpow_ne_zero _ (division_nonzero _ _ (TunnellCMPrimeToConductor.translated_regular n hn hc hz i (Finset.mem_filter.mp hi).2))
  classical
  letI : IsAlgClosure ℚ (algebraicClosure ℚ ℂ) := algebraicClosure.isAlgClosure ℚ ℂ
  letI : IsAlgClosed (algebraicClosure ℚ ℂ) := IsAlgClosure.isAlgClosed ℚ
  letI : Algebra.IsAlgebraic ℚ (algebraicClosure ℚ ℂ) := algebraicClosure.isAlgebraic ℚ ℂ
  letI : NeZero (4*n) := ⟨by omega⟩
  letI : NeZero (aux n) := ⟨by unfold aux; omega⟩
  let s := Finset.univ.filter (fun i : Residues n => weight n i≠0)
  let t := divisionGrid (twistPeriods n hn) (aux n)
  let M := mapPoint (algebraicClosure ℚ ℂ) ℂ n
  have hM := mapPoint_injective (algebraicClosure ℚ ℂ) ℂ n
  choose U eu using fun i : s => torsion_lift n hn (by omega : 0<4*n) (conductor_point n hn i.val)
  choose Q eq using fun j : t => torsion_lift n hn (Nat.pos_of_ne_zero (NeZero.ne (aux n))) (mul_lift (twistPeriods n hn) j.val)
  obtain ⟨V,ev⟩ := torsion_lift n hn hm hz
  have hU (i : s) : addOrderOf (U i)=4*n := by
    rw [← addOrderOf_injective M hM,show M (U i)=_ from eu i]
    exact (addOrderOf_injective (Point.equivOfEq (model_eq n hn)).toAddMonoidHom (Point.equivOfEq _).injective _).trans
      (TunnellCMConductorOrder.conductor_order n hn i.val ((Finset.mem_filter.mp i.property).2))
  have hV : m • V=0 := hM (by rw [map_nsmul,show M V=_ from ev,killed n hn hz,map_zero])
  have hQ (j : t) : aux n • Q j=0 := hM (by rw [map_nsmul,show M (Q j)=_ from eq j,killed n hn (mul_lift (twistPeriods n hn) j.val),map_zero])
  have hQ0 (j : t) : Q j≠0 := by
    intro hh
    have e := (eq j).symm
    rw [hh,map_zero] at e
    have h := (Point.equivOfEq (model_eq n hn)).injective (e.trans (map_zero _).symm)
    exact (Finset.mem_filter.mp j.property).2 ((TunnellCMTorsionOrder.zero_iff n hn _).mp h)
  have term (i : s) (j : t) : algebraMap (algebraicClosure ℚ ℂ) ℂ (X (U i+V)-X (Q j)) =
      (twistPeriods n hn).weierstrassP (z+point n i.val) - (twistPeriods n hn).weierstrassP (liftGrid (twistPeriods n hn) j.val) := by
    change algebraMap (algebraicClosure ℚ ℂ) ℂ (X (U i+V)-X (Q j))=_
    rw [map_sub,← x_point,← x_point,map_add,eu,ev,eq,← map_add,add_comm (point n i.val) z,x_uniformize,x_uniformize]
  have he : algebraMap (algebraicClosure ℚ ℂ) ℂ (∏ i : s, (∏ j : t, (X (U i+V)-X (Q j)))^weight n i.val) =
      traceUnit n hn z := by
    simp only [map_prod,map_zpow₀,term]
    change (∏ i : s, (∏ j : t, ((twistPeriods n hn).weierstrassP (z+point n i.val) - (twistPeriods n hn).weierstrassP (liftGrid (twistPeriods n hn) j.val)))^weight n i.val) = _
    have pj (i : Residues n) : (∏ j : t, ((twistPeriods n hn).weierstrassP (z+point n i) - (twistPeriods n hn).weierstrassP (liftGrid (twistPeriods n hn) j.val))) =
        divisionProduct (twistPeriods n hn) (aux n) (z+point n i) :=
      Finset.prod_coe_sort t (fun j => (twistPeriods n hn).weierstrassP (z+point n i) - (twistPeriods n hn).weierstrassP (liftGrid (twistPeriods n hn) j))
    simp only [pj]
    exact Finset.prod_coe_sort s (fun i => divisionProduct (twistPeriods n hn) (aux n) (z+point n i)^weight n i)
  have hw : ∑ i : s, weight n i.val=0 := by
    rw [Finset.sum_coe_sort,Finset.sum_filter_ne_zero]
    exact TunnellCMWeights.weight_sum_zero n hn8
  refine ⟨X,⟨rfl,fun _ _ _ => rfl⟩,s,t,inferInstance,inferInstance,fun i:s => weight n i.val,U,V,Q,hw,hU,hV,hQ,hQ0,?_⟩
  have nonzero (v : algebraicClosure ℚ ℂ) (g:ℂ) (h:(v:ℂ)=g) (hg:g≠0) : v≠0 ∧ (v:ℂ)=g := by
    refine ⟨?_,h⟩
    intro hv
    subst v
    exact hg h.symm
  exact nonzero _ _ he hu
end
end TunnellPublicUnitRepresentation
end


open NumberField
open scoped NumberField

theorem TunnellBalancedIntegrality.arithmetic : TunnellBalancedIntegrality.H1 := by
  classical
  intro n m a hn htwo hc A W
  letI : IsAlgClosure ℚ (↥A) := algebraicClosure.isAlgClosure ℚ ℂ
  letI : IsAlgClosed (↥A) := IsAlgClosure.isAlgClosed ℚ
  intro X hX ι κ _ _ w U V Q H hw hU hV hQ hQ₀ hu
  have e : X = TunnellCMModelUnit.X := by
    funext P
    cases P with
    | zero => exact hX.1
    | some x y h => exact hX.2 x y h
  subst X
  exact TunnellCMAbsoluteUnit.absolute_unit (↥A) hn htwo w hw U V Q hc hU hV hQ hQ₀ hu

theorem OMA.solution : OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1.H1 := TunnellBalancedIntegrality.main TunnellBalancedIntegrality.arithmetic TunnellPublicUnitRepresentation.result
