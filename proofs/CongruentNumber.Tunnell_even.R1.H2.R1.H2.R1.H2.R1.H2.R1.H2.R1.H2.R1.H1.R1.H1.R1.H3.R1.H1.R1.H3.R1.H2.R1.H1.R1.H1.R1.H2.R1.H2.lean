import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H3_R1_H1_R1_H3_R1_H2_R1_H1_R1_H1_R1_H2_R1
import Mathlib

/-! Restriction to the splitting field and descent of a local Kummer radical. Some declarations are adapted from ClassFieldTheory at revision 2e6280f9d2579705a0cc6c76ec68c2b60f9c601a, https://github.com/n-yamaguchi-0729/ClassFieldTheory. -/
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

/- ValuedFieldTheory.Valuation.AbsoluteValue.Extension -/
section
namespace AbsoluteValue
 
def Extends {K L : Type*} [Field K] [Field L] [Algebra K L]
    (v : AbsoluteValue K ℝ) (w : AbsoluteValue L ℝ) : Prop :=
  ∀ x : K, w (algebraMap K L x) = v x
end AbsoluteValue
end

/- ValuedFieldTheory.Valuation.AbsoluteValue.Nonarchimedean -/
section
noncomputable section
open Filter
open scoped Topology
namespace AbsoluteValue
private theorem finset_sum_le
    {K : Type*} [Field K] (v : AbsoluteValue K ℝ)
    {ι : Type*} (s : Finset ι) (f : ι → K) :
    v (s.sum f) ≤ s.sum (fun i => v (f i)) := by
  classical
  refine Finset.induction_on s ?empty ?insert
  · simp
  · intro i s his ih
    rw [Finset.sum_insert his, Finset.sum_insert his]
    exact (v.add_le (f i) (s.sum f)).trans
      (by
        simpa [add_comm, add_left_comm, add_assoc] using
          add_le_add_left ih (v (f i)))
private theorem nat_bound_ge_one
    {K : Type*} [Field K] (v : AbsoluteValue K ℝ) {C : ℝ}
    (hC : ∀ n : ℕ, v (n : K) ≤ C) :
    1 ≤ C := by
  simpa using hC 1
 


private theorem add_pow_le_of_bounded_nat
    {K : Type*} [Field K] (v : AbsoluteValue K ℝ) {C : ℝ}
    (hC : ∀ n : ℕ, v (n : K) ≤ C) (x y : K) (n : ℕ) :
    v ((x + y) ^ n) ≤
      ((n + 1 : ℕ) : ℝ) * C * (max (v x) (v y)) ^ n := by
  classical
  let M : ℝ := max (v x) (v y)
  have hC_nonneg : 0 ≤ C :=
    (zero_le_one : (0 : ℝ) ≤ 1).trans
      (nat_bound_ge_one v hC)
  have hM_nonneg : 0 ≤ M :=
    (v.nonneg x).trans (le_max_left (v x) (v y))
  have hsum_le :
      v ((Finset.range (n + 1)).sum
          (fun m => x ^ m * y ^ (n - m) * (n.choose m : K))) ≤
        (Finset.range (n + 1)).sum
          (fun m => v (x ^ m * y ^ (n - m) * (n.choose m : K))) :=
    finset_sum_le v (Finset.range (n + 1))
      (fun m => x ^ m * y ^ (n - m) * (n.choose m : K))
  have hterm :
      ∀ m ∈ Finset.range (n + 1),
        v (x ^ m * y ^ (n - m) * (n.choose m : K)) ≤ C * M ^ n := by
    intro m hm
    have hmle : m ≤ n := Nat.lt_succ_iff.mp (Finset.mem_range.mp hm)
    have hxpow : v (x ^ m) ≤ M ^ m := by
      rw [map_pow]
      exact pow_le_pow_left₀ (v.nonneg x) (le_max_left (v x) (v y)) m
    have hypow : v (y ^ (n - m)) ≤ M ^ (n - m) := by
      rw [map_pow]
      exact pow_le_pow_left₀ (v.nonneg y) (le_max_right (v x) (v y)) (n - m)
    have hxy :
        v (x ^ m) * v (y ^ (n - m)) ≤ M ^ m * M ^ (n - m) :=
      mul_le_mul hxpow hypow (v.nonneg (y ^ (n - m))) (pow_nonneg hM_nonneg m)
    have hchoose : v ((n.choose m : ℕ) : K) ≤ C := hC (n.choose m)
    calc
      v (x ^ m * y ^ (n - m) * (n.choose m : K))
          = v (x ^ m) * v (y ^ (n - m)) * v ((n.choose m : ℕ) : K) := by
              rw [map_mul, map_mul]
      _ ≤ (M ^ m * M ^ (n - m)) * C := by
              exact mul_le_mul hxy hchoose
                (v.nonneg ((n.choose m : ℕ) : K))
                (mul_nonneg (pow_nonneg hM_nonneg m)
                  (pow_nonneg hM_nonneg (n - m)))
      _ = C * M ^ n := by
              rw [← pow_add, Nat.add_sub_of_le hmle]
              ring
  calc
    v ((x + y) ^ n)
        = v ((Finset.range (n + 1)).sum
            (fun m => x ^ m * y ^ (n - m) * (n.choose m : K))) := by
            rw [add_pow]
    _ ≤ (Finset.range (n + 1)).sum
          (fun m => v (x ^ m * y ^ (n - m) * (n.choose m : K))) := hsum_le
    _ ≤ (Finset.range (n + 1)).sum (fun _m => C * M ^ n) :=
          Finset.sum_le_sum hterm
    _ = ((n + 1 : ℕ) : ℝ) * C * M ^ n := by
          simp [Finset.sum_const, nsmul_eq_mul, mul_assoc]
 

private theorem tendsto_linear_bound_rpow_inv
    {C : ℝ} (hC : 0 < C) :
    Tendsto
      (fun n : ℕ => ((((n + 1 : ℕ) : ℝ) * C) ^ ((n : ℝ)⁻¹)))
      atTop (𝓝 1) := by
  have hCroot :
      Tendsto (fun n : ℕ => C ^ ((n : ℝ)⁻¹)) atTop (𝓝 1) := by
    have hcont : ContinuousAt (fun t : ℝ => C ^ t) 0 :=
      Real.continuousAt_const_rpow hC.ne'
    have hzero : Tendsto (fun n : ℕ => (n : ℝ)⁻¹) atTop (𝓝 0) :=
      tendsto_inv_atTop_zero.comp tendsto_natCast_atTop_atTop
    have hroot := hcont.tendsto.comp hzero
    change Tendsto (fun n : ℕ => C ^ ((n : ℝ)⁻¹)) atTop (𝓝 (C ^ (0 : ℝ))) at hroot
    simpa [Real.rpow_zero] using hroot
  have hshiftReal :
      Tendsto (fun x : ℝ => x ^ ((1 : ℝ) / (1 * x + (-1)))) atTop (𝓝 1) :=
    tendsto_rpow_div_mul_add 1 1 (-1) zero_ne_one
  have hshiftNat :
      Tendsto (fun n : ℕ => (((n + 1 : ℕ) : ℝ) ^ ((n : ℝ)⁻¹)))
        atTop (𝓝 1) := by
    have hnatshift : Tendsto (fun n : ℕ => (n : ℝ) + 1) atTop atTop :=
      tendsto_atTop_add_const_right atTop 1 tendsto_natCast_atTop_atTop
    refine (hshiftReal.comp hnatshift).congr' ?_
    exact Eventually.of_forall fun n => by
      simp [Nat.cast_add, Nat.cast_one, one_div, add_assoc]
  have htarget :
      Tendsto
        (fun n : ℕ => ((((n + 1 : ℕ) : ℝ) * C) ^ ((n : ℝ)⁻¹)))
        atTop (𝓝 (1 * 1)) := by
    refine (hshiftNat.mul hCroot).congr' ?_
    exact Eventually.of_forall fun n => by
      have hn_nonneg : 0 ≤ ((n + 1 : ℕ) : ℝ) := by positivity
      have hmul :=
        (Real.mul_rpow (z := ((n : ℝ)⁻¹)) hn_nonneg (le_of_lt hC)).symm
      simpa [mul_comm, mul_left_comm, mul_assoc] using hmul
  simpa using htarget
 
private theorem add_le_root_bound_of_bounded_nat
    {K : Type*} [Field K] (v : AbsoluteValue K ℝ) {C : ℝ}
    (hC : ∀ n : ℕ, v (n : K) ≤ C) (x y : K)
    {n : ℕ} (hn : n ≠ 0) :
    v (x + y) ≤
      ((((n + 1 : ℕ) : ℝ) * C) ^ ((n : ℝ)⁻¹)) *
        max (v x) (v y) := by
  classical
  let M : ℝ := max (v x) (v y)
  have hC_pos : 0 < C :=
    zero_lt_one.trans_le (nat_bound_ge_one v hC)
  have hM_nonneg : 0 ≤ M :=
    (v.nonneg x).trans (le_max_left (v x) (v y))
  by_cases hMzero : M = 0
  · have hx_le_zero : v x ≤ 0 := by
      simpa [M, hMzero] using (le_max_left (v x) (v y))
    have hy_le_zero : v y ≤ 0 := by
      simpa [M, hMzero] using (le_max_right (v x) (v y))
    have hxzero : x = 0 := (v.eq_zero).mp (le_antisymm hx_le_zero (v.nonneg x))
    have hyzero : y = 0 := (v.eq_zero).mp (le_antisymm hy_le_zero (v.nonneg y))
    simp [hxzero, hyzero]
  · have hpow :
        (v (x + y)) ^ n ≤ ((n + 1 : ℕ) : ℝ) * C * M ^ n := by
      simpa [map_pow, M] using
        add_pow_le_of_bounded_nat v hC x y n
    have hright_nonneg :
        0 ≤ ((n + 1 : ℕ) : ℝ) * C * M ^ n := by
      exact mul_nonneg
        (mul_nonneg (by positivity) (le_of_lt hC_pos))
        (pow_nonneg hM_nonneg n)
    have hn_pos : 0 < (n : ℝ) := Nat.cast_pos.mpr (Nat.pos_of_ne_zero hn)
    have hroot :
        v (x + y) ≤
          (((n + 1 : ℕ) : ℝ) * C * M ^ n) ^ ((n : ℝ)⁻¹) := by
      rw [Real.le_rpow_inv_iff_of_pos (v.nonneg (x + y)) hright_nonneg hn_pos]
      simpa [Real.rpow_natCast] using hpow
    calc
      v (x + y)
          ≤ (((n + 1 : ℕ) : ℝ) * C * M ^ n) ^ ((n : ℝ)⁻¹) := hroot
      _ = ((((n + 1 : ℕ) : ℝ) * C) ^ ((n : ℝ)⁻¹)) * M := by
            have hcoef_nonneg : 0 ≤ ((n + 1 : ℕ) : ℝ) * C :=
              mul_nonneg (by positivity) (le_of_lt hC_pos)
            rw [Real.mul_rpow hcoef_nonneg (pow_nonneg hM_nonneg n)]
            rw [Real.pow_rpow_inv_natCast hM_nonneg hn]
      _ = ((((n + 1 : ℕ) : ℝ) * C) ^ ((n : ℝ)⁻¹)) *
            max (v x) (v y) := by
            rfl
 
private theorem isNonarchimedean_of_bounded_nat
    {K : Type*} [Field K] (v : AbsoluteValue K ℝ)
    (hnonarch : ∃ C : ℝ, ∀ n : ℕ, v (n : K) ≤ C) :
    IsNonarchimedean (v : K → ℝ) := by
  rcases hnonarch with ⟨C, hC⟩
  have hC_pos : 0 < C :=
    zero_lt_one.trans_le (nat_bound_ge_one v hC)
  intro x y
  let M : ℝ := max (v x) (v y)
  have hlim :
      Tendsto
        (fun n : ℕ =>
          ((((n + 1 : ℕ) : ℝ) * C) ^ ((n : ℝ)⁻¹)) * M)
        atTop (𝓝 M) := by
    simpa using
      (tendsto_linear_bound_rpow_inv hC_pos).mul
        (tendsto_const_nhds (x := M))
  have heventually :
      ∀ᶠ n : ℕ in atTop,
        v (x + y) ≤
          ((((n + 1 : ℕ) : ℝ) * C) ^ ((n : ℝ)⁻¹)) * M := by
    refine eventually_atTop.2 ⟨1, ?_⟩
    intro n hn
    exact add_le_root_bound_of_bounded_nat
      (v := v) hC x y (n := n) (by omega)
  have hle :
      v (x + y) ≤ M :=
    le_of_tendsto_of_tendsto tendsto_const_nhds hlim heventually
  simpa [M] using hle
 

theorem isNonarchimedean_iff_bounded_nat
    {K : Type*} [Field K] (v : AbsoluteValue K ℝ) :
    IsNonarchimedean (v : K → ℝ) ↔
      ∃ C : ℝ, ∀ n : ℕ, v (n : K) ≤ C := by
  constructor
  · intro h
    exact ⟨1, fun n => h.apply_natCast_le_one⟩
  · exact isNonarchimedean_of_bounded_nat v
end AbsoluteValue
end
end

/- ValuedFieldTheory.Valuation.AbsoluteValue.Completion -/
section
noncomputable section
open scoped Topology
namespace AbsoluteValue
universe u v w
 
noncomputable def completionAbsoluteValue
    {K : Type u} [Field K] (vK : AbsoluteValue K ℝ) :
    AbsoluteValue vK.Completion ℝ :=
  NormedField.toAbsoluteValue vK.Completion
 

@[simp]
theorem completionAbsoluteValue_coe
    {K : Type u} [Field K] (vK : AbsoluteValue K ℝ) (x : K) :
    completionAbsoluteValue vK (x : vK.Completion) = vK x := by
  change ‖(x : vK.Completion)‖ = vK x
  rw [UniformSpace.Completion.norm_coe]
  rfl
 
theorem completionAbsoluteValue_complete
    {K : Type u} [Field K] (vK : AbsoluteValue K ℝ) :
    CompleteSpace (WithAbs (completionAbsoluteValue vK)) := by
  let e := WithAbs.equiv (completionAbsoluteValue vK)
  have he : Isometry e :=
    AddMonoidHomClass.isometry_of_norm e.toRingHom fun _ ↦ rfl
  exact (completeSpace_congr (e := e.toEquiv) he.isUniformEmbedding).2 inferInstance
 
theorem completionAbsoluteValue_isNontrivial
    {K : Type u} [Field K] (vK : AbsoluteValue K ℝ)
    (hvK : vK.IsNontrivial) :
    (completionAbsoluteValue vK).IsNontrivial := by
  rcases hvK with ⟨x, hx0, hx1⟩
  refine ⟨(x : vK.Completion), ?_, ?_⟩
  · intro hx
    have hx' : (WithAbs.equiv vK).symm x = 0 :=
      UniformSpace.Completion.coe_injective (α := WithAbs vK) hx
    exact hx0 (by simpa using congrArg (WithAbs.equiv vK) hx')
  · simpa using hx1
 
noncomputable def toCompletion
    {K : Type u} [Field K] (vK : AbsoluteValue K ℝ) :
    K →+* vK.Completion :=
  UniformSpace.Completion.coeRingHom.comp
    (WithAbs.equiv vK).symm.toRingHom
 
@[simp]
theorem toCompletion_eq_algebraMap
    {K : Type u} [Field K] (vK : AbsoluteValue K ℝ) (x : K) :
    toCompletion vK x = algebraMap K vK.Completion x :=
  rfl
private noncomputable def baseToExtensionCompletion
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (wL : AbsoluteValue L ℝ) :
    WithAbs vK →+* wL.Completion :=
  UniformSpace.Completion.coeRingHom.comp
    (algebraMap (WithAbs vK) (WithAbs wL))
private theorem baseToExtensionCompletion_norm
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (wL : AbsoluteValue L ℝ)
    (hw : Extends vK wL) (x : WithAbs vK) :
    ‖baseToExtensionCompletion vK wL x‖ = ‖x‖ := by
  change
    ‖((algebraMap (WithAbs vK) (WithAbs wL)) x : wL.Completion)‖ = ‖x‖
  rw [UniformSpace.Completion.norm_coe, WithAbs.norm_eq_apply_ofAbs,
    WithAbs.norm_eq_apply_ofAbs, WithAbs.ofAbs_algebraMap]
  exact hw x.ofAbs
private theorem baseToExtensionCompletion_isometry
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (wL : AbsoluteValue L ℝ)
    (hw : Extends vK wL) :
    Isometry (baseToExtensionCompletion vK wL) :=
  AddMonoidHomClass.isometry_of_norm _
    (baseToExtensionCompletion_norm vK wL hw)
 

noncomputable def completionMap
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (wL : AbsoluteValue L ℝ)
    (hw : Extends vK wL) :
    vK.Completion →+* wL.Completion :=
  (baseToExtensionCompletion_isometry vK wL hw).extensionHom
private theorem completionMap_withAbs_coe
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (wL : AbsoluteValue L ℝ)
    (hw : Extends vK wL) (x : WithAbs vK) :
    completionMap vK wL hw (x : vK.Completion) =
      baseToExtensionCompletion vK wL x :=
  (baseToExtensionCompletion_isometry vK wL hw).extensionHom_coe x
 

@[simp]
theorem completionMap_coe
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (wL : AbsoluteValue L ℝ)
    (hw : Extends vK wL) (x : K) :
    completionMap vK wL hw (algebraMap K vK.Completion x) =
      toCompletion wL (algebraMap K L x) := by
  change completionMap vK wL hw
      (((WithAbs.equiv vK).symm x : WithAbs vK) : vK.Completion) =
    (((WithAbs.equiv wL).symm (algebraMap K L x) : WithAbs wL) :
      wL.Completion)
  rw [completionMap_withAbs_coe]
  rfl
 
theorem completionMap_isometry
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (wL : AbsoluteValue L ℝ)
    (hw : Extends vK wL) :
    Isometry (completionMap vK wL hw) :=
  (baseToExtensionCompletion_isometry vK wL hw).completion_extension
 

noncomputable abbrev completionAlgebra
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (wL : AbsoluteValue L ℝ)
    (hw : Extends vK wL) :
    Algebra vK.Completion wL.Completion :=
  (completionMap vK wL hw).toAlgebra
 
@[simp]
theorem completionAlgebra_algebraMap
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (wL : AbsoluteValue L ℝ)
    (hw : Extends vK wL) (x : vK.Completion) :
    @algebraMap vK.Completion wL.Completion _ _
        (completionAlgebra vK wL hw) x = completionMap vK wL hw x :=
  rfl
 

noncomputable abbrev extensionCompletionAlgebra
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (wL : AbsoluteValue L ℝ) :
    Algebra K wL.Completion :=
  ((toCompletion wL).comp (algebraMap K L)).toAlgebra
 
noncomputable def toCompletionAlgHom
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (wL : AbsoluteValue L ℝ) :
    letI := extensionCompletionAlgebra (K := K) wL
    L →ₐ[K] wL.Completion := by
  letI := extensionCompletionAlgebra (K := K) wL
  exact
    { __ := toCompletion wL
      commutes' _ := rfl }
 
theorem completion_isScalarTower
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (wL : AbsoluteValue L ℝ)
    (hw : Extends vK wL) :
    letI hK := extensionCompletionAlgebra (K := K) wL
    letI : SMul K wL.Completion := hK.toSMul
    letI := completionAlgebra vK wL hw
    IsScalarTower K vK.Completion wL.Completion := by
  let hK := extensionCompletionAlgebra (K := K) wL
  let : SMul K wL.Completion := hK.toSMul
  let := completionAlgebra vK wL hw
  exact IsScalarTower.of_algebraMap_eq fun x ↦
    (completionMap_coe vK wL hw x).symm
section CompleteTarget
variable {K : Type u} {D : Type w} [Field K] [Field D]
end CompleteTarget
section CompleteTargetTower
variable {K : Type u} {L : Type v} {D : Type w}
variable [Field K] [Field L] [Field D] [Algebra K L]
end CompleteTargetTower
end AbsoluteValue
end
end

/- ValuedFieldTheory.Valuation.AbsoluteValue.AlgebraicLocalization -/
section
noncomputable section
namespace AbsoluteValue
universe u v
 


noncomputable def algebraicLocalization
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (wL : AbsoluteValue L ℝ)
    (hw : Extends vK wL) :
    letI := completionAlgebra vK wL hw
    IntermediateField vK.Completion wL.Completion := by
  let := completionAlgebra vK wL hw
  exact IntermediateField.adjoin vK.Completion
    (Set.range (toCompletion wL))
private theorem toCompletion_mem_algebraicLocalization
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (wL : AbsoluteValue L ℝ)
    (hw : Extends vK wL) (x : L) :
    letI := completionAlgebra vK wL hw
    toCompletion wL x ∈ algebraicLocalization vK wL hw := by
  let := completionAlgebra vK wL hw
  exact IntermediateField.subset_adjoin vK.Completion _ ⟨x, rfl⟩
 
noncomputable def toAlgebraicLocalization
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (wL : AbsoluteValue L ℝ)
    (hw : Extends vK wL) :
    letI := completionAlgebra vK wL hw
    L →+* algebraicLocalization vK wL hw := by
  letI := completionAlgebra vK wL hw
  exact RingHom.codRestrict (toCompletion wL)
    (algebraicLocalization vK wL hw)
    (toCompletion_mem_algebraicLocalization vK wL hw)
 

theorem algebraicLocalization_isAlgebraic
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    [Algebra.IsAlgebraic K L]
    (vK : AbsoluteValue K ℝ) (wL : AbsoluteValue L ℝ)
    (hw : Extends vK wL) :
    letI := completionAlgebra vK wL hw
    Algebra.IsAlgebraic vK.Completion
      (algebraicLocalization vK wL hw) := by
  let hK := extensionCompletionAlgebra (K := K) wL
  let : SMul K wL.Completion := hK.toSMul
  let := completionAlgebra vK wL hw
  let : IsScalarTower K vK.Completion wL.Completion :=
    completion_isScalarTower vK wL hw
  apply IntermediateField.isAlgebraic_adjoin
  intro z hz
  rcases hz with ⟨x, rfl⟩
  have hx : IsIntegral K x :=
    isAlgebraic_iff_isIntegral.mp (Algebra.IsAlgebraic.isAlgebraic x)
  let : IsScalarTower K K wL.Completion :=
    IsScalarTower.of_algebraMap_eq' rfl
  have hx' : IsIntegral K (toCompletion wL x) :=
    hx.map (toCompletionAlgHom (K := K) wL)
  exact IsIntegral.tower_top (A := vK.Completion) hx'
 

noncomputable def algebraicLocalizationAbsoluteValue
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (wL : AbsoluteValue L ℝ)
    (hw : Extends vK wL) :
    letI := completionAlgebra vK wL hw
    AbsoluteValue (algebraicLocalization vK wL hw) ℝ := by
  letI := completionAlgebra vK wL hw
  exact (completionAbsoluteValue wL).comp
    (algebraicLocalization vK wL hw).val.injective
 
theorem algebraicLocalizationAbsoluteValue_extends
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (wL : AbsoluteValue L ℝ)
    (hw : Extends vK wL) :
    letI := completionAlgebra vK wL hw
    Extends (completionAbsoluteValue vK)
      (algebraicLocalizationAbsoluteValue vK wL hw) := by
  let := completionAlgebra vK wL hw
  intro x
  change ‖completionMap vK wL hw x‖ = ‖x‖
  exact (completionMap_isometry vK wL hw).norm_map_of_map_zero
    (map_zero _) x
 
@[simp]
theorem algebraicLocalizationAbsoluteValue_toAlgebraicLocalization
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (wL : AbsoluteValue L ℝ)
    (hw : Extends vK wL) (x : L) :
    letI := completionAlgebra vK wL hw
    algebraicLocalizationAbsoluteValue vK wL hw
        (toAlgebraicLocalization vK wL hw x) = wL x := by
  let := completionAlgebra vK wL hw
  change ‖((WithAbs.equiv wL).symm x : wL.Completion)‖ = wL x
  rw [UniformSpace.Completion.norm_coe]
  rfl
 

@[simp]
theorem toAlgebraicLocalization_algebraMap
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (wL : AbsoluteValue L ℝ)
    (hw : Extends vK wL) (x : K) :
    letI := completionAlgebra vK wL hw
    toAlgebraicLocalization vK wL hw (algebraMap K L x) =
      algebraMap vK.Completion (algebraicLocalization vK wL hw)
        (algebraMap K vK.Completion x) := by
  let := completionAlgebra vK wL hw
  apply Subtype.ext
  exact (completionMap_coe vK wL hw x).symm
end AbsoluteValue
end
end

/- ValuedFieldTheory.Valuation.AbsoluteValue.Ostrowski -/
section
noncomputable section
open Filter
namespace AbsoluteValue
private theorem ostrowski_isNonarchimedean_of_charP_pos
    {K : Type*} [Field K] (v : AbsoluteValue K ℝ) {p : ℕ}
    [CharP K p] (hp : p ≠ 0) :
    IsNonarchimedean (v : K → ℝ) := by
  rw [isNonarchimedean_iff_bounded_nat]
  refine ⟨(p : ℝ), fun n => ?_⟩
  have hp_pos : 0 < p := Nat.pos_of_ne_zero hp
  calc
    v (n : K) = v ((n % p : ℕ) : K) := by
      congr 1
      exact CharP.natCast_eq_natCast_mod K p n
    _ ≤ ((n % p : ℕ) : ℝ) := v.apply_nat_le_self (n % p)
    _ ≤ (p : ℝ) := by
      exact_mod_cast (Nat.mod_lt n hp_pos).le
 


theorem charZero_of_not_isNonarchimedean
    {K : Type*} [Field K] (v : AbsoluteValue K ℝ)
    (harch : ¬ IsNonarchimedean (v : K → ℝ)) :
    CharZero K := by
  obtain ⟨p, hpchar⟩ := CharP.exists K
  have : CharP K p := hpchar
  rcases CharP.char_is_prime_or_zero K p with hprime | hp0
  · exact (harch
      (ostrowski_isNonarchimedean_of_charP_pos
        (K := K) v hprime.ne_zero)).elim
  · have : CharP K 0 := by
      simpa [hp0] using hpchar
    exact CharP.charP_to_charZero K
private instance ostrowski_withAbsCharZero
    {K : Type*} [Field K] [CharZero K] (v : AbsoluteValue K ℝ) :
    CharZero (WithAbs v) :=
  ((WithAbs.equiv v).toRingHom.charZero_iff
    (WithAbs.equiv v).injective).mpr inferInstance
 

private noncomputable def ostrowski_restrictRatAbsoluteValue
    {K : Type*} [Field K] [CharZero K] (v : AbsoluteValue K ℝ) :
    AbsoluteValue ℚ ℝ :=
  v.comp (f := Rat.castHom K) Rat.cast_injective
@[simp]
private theorem ostrowski_restrictRatAbsoluteValue_apply
    {K : Type*} [Field K] [CharZero K] (v : AbsoluteValue K ℝ) (q : ℚ) :
    ostrowski_restrictRatAbsoluteValue (K := K) v q = v (q : K) :=
  rfl
 

private theorem ostrowski_isNonarchimedean_of_restrictRat
    {K : Type*} [Field K] [CharZero K] (v : AbsoluteValue K ℝ)
    (h : IsNonarchimedean
      (ostrowski_restrictRatAbsoluteValue (K := K) v : ℚ → ℝ)) :
    IsNonarchimedean (v : K → ℝ) := by
  rw [isNonarchimedean_iff_bounded_nat] at h ⊢
  rcases h with ⟨C, hC⟩
  refine ⟨C, fun n => ?_⟩
  simpa using hC n
 

private theorem ostrowski_restrictRat_not_isNonarchimedean
    {K : Type*} [Field K] [CharZero K] (v : AbsoluteValue K ℝ)
    (harch : ¬ IsNonarchimedean (v : K → ℝ)) :
    ¬ IsNonarchimedean
      (ostrowski_restrictRatAbsoluteValue (K := K) v : ℚ → ℝ) := by
  intro hnonarch
  exact harch
    (ostrowski_isNonarchimedean_of_restrictRat
      (K := K) v hnonarch)
 
private theorem ostrowski_restrictRat_isEquiv_real_of_not_isNonarchimedean
    {K : Type*} [Field K] [CharZero K] (v : AbsoluteValue K ℝ)
    (harch : ¬ IsNonarchimedean (v : K → ℝ)) :
    (ostrowski_restrictRatAbsoluteValue (K := K) v).IsEquiv
      Rat.AbsoluteValue.real := by
  have harch_rat :=
    ostrowski_restrictRat_not_isNonarchimedean
      (K := K) v harch
  refine Rat.AbsoluteValue.equiv_real_of_unbounded ?_
  intro hbounded
  exact harch_rat ((isNonarchimedean_iff_bounded_nat _).2 ⟨1, hbounded⟩)
 


private theorem ostrowski_restrictRat_exists_rpow_eq_real_of_not_isNonarchimedean
    {K : Type*} [Field K] [CharZero K] (v : AbsoluteValue K ℝ)
    (harch : ¬ IsNonarchimedean (v : K → ℝ)) :
    ∃ c : ℝ, 0 < c ∧
      ∀ q : ℚ,
        (ostrowski_restrictRatAbsoluteValue (K := K) v q) ^ c =
          Rat.AbsoluteValue.real q := by
  rcases (AbsoluteValue.isEquiv_iff_exists_rpow_eq).mp
      (ostrowski_restrictRat_isEquiv_real_of_not_isNonarchimedean
        (K := K) v harch) with
    ⟨c, hc_pos, hc⟩
  refine ⟨c, hc_pos, fun q => ?_⟩
  exact congrFun hc q
 


private theorem ostrowski_restrictRat_exists_real_rpow_eq_of_not_isNonarchimedean
    {K : Type*} [Field K] [CharZero K] (v : AbsoluteValue K ℝ)
    (harch : ¬ IsNonarchimedean (v : K → ℝ)) :
    ∃ s : ℝ, 0 < s ∧ s ≤ 1 ∧
      ∀ q : ℚ,
        ostrowski_restrictRatAbsoluteValue (K := K) v q =
          Rat.AbsoluteValue.real q ^ s := by
  rcases ostrowski_restrictRat_exists_rpow_eq_real_of_not_isNonarchimedean
      (K := K) v harch with
    ⟨c, hc_pos, hc⟩
  refine ⟨c⁻¹, inv_pos.mpr hc_pos, ?_, fun q => ?_⟩
  · have htwo_le :
        (2 : ℝ) ^ c⁻¹ ≤ (2 : ℝ) ^ (1 : ℝ) := by
      have happly :
          ostrowski_restrictRatAbsoluteValue (K := K) v (2 : ℚ) ≤ (2 : ℝ) :=
        (ostrowski_restrictRatAbsoluteValue (K := K) v).apply_nat_le_self 2
      have hq :=
        (Real.rpow_inv_eq
          ((Rat.AbsoluteValue.real).nonneg (2 : ℚ))
          ((ostrowski_restrictRatAbsoluteValue (K := K) v).nonneg (2 : ℚ))
          hc_pos.ne').2 (hc (2 : ℚ)).symm
      rw [← hq] at happly
      simpa [Rat.AbsoluteValue.real_eq_abs, Real.rpow_one] using happly
    exact (Real.rpow_le_rpow_left_iff one_lt_two).mp htwo_le
  · have hq :=
      (Real.rpow_inv_eq
        ((Rat.AbsoluteValue.real).nonneg q)
        ((ostrowski_restrictRatAbsoluteValue (K := K) v).nonneg q)
        hc_pos.ne').2 (hc q).symm
    exact hq.symm
 
private theorem ostrowski_exists_rat_pos_rpow_lt
    {s ε : ℝ} (hs : 0 < s) (hε : 0 < ε) :
    ∃ δ : ℚ, (0 : ℚ) < δ ∧ ((δ : ℝ) ^ s < ε) := by
  let η : ℝ := ε ^ s⁻¹
  have hη_pos : 0 < η := Real.rpow_pos_of_pos hε s⁻¹
  obtain ⟨δ, hδ0, hδη⟩ := exists_rat_btwn hη_pos
  refine ⟨δ, ?_, ?_⟩
  · exact_mod_cast hδ0
  · have hδ_nonneg : 0 ≤ (δ : ℝ) := le_of_lt hδ0
    have hlt : ((δ : ℝ) ^ s) < η ^ s :=
      Real.rpow_lt_rpow hδ_nonneg hδη hs
    have hηpow : η ^ s = ε := by
      dsimp [η]
      rw [← Real.rpow_mul (le_of_lt hε)]
      rw [inv_mul_cancel₀ hs.ne', Real.rpow_one]
    simpa [hηpow] using hlt
 


private theorem ostrowski_ratCast_withAbs_norm_eq_of_real_rpow
    {K : Type*} [Field K] [CharZero K] (v : AbsoluteValue K ℝ)
    (s : ℝ)
    (hnorm : ∀ q : ℚ,
      ostrowski_restrictRatAbsoluteValue (K := K) v q =
        Rat.AbsoluteValue.real q ^ s)
    (q : ℚ) :
    ‖Rat.castHom (WithAbs v) q‖ = ‖(q : ℝ)‖ ^ s := by
  change v (q : K) = ‖(q : ℝ)‖ ^ s
  rw [← ostrowski_restrictRatAbsoluteValue_apply (K := K) v q, hnorm q]
  rw [Rat.AbsoluteValue.real_eq_abs, Real.norm_eq_abs, Rat.cast_abs]
 


private def ostrowski_ratCauSeqMapWithAbs_of_real_rpow
    {K : Type*} [Field K] [CharZero K] (v : AbsoluteValue K ℝ)
    (s : ℝ) (hs : 0 < s)
    (hnorm : ∀ q : ℚ,
      ostrowski_restrictRatAbsoluteValue (K := K) v q =
        Rat.AbsoluteValue.real q ^ s)
    (u : CauSeq ℚ (abs : ℚ → ℚ)) :
    CauSeq (WithAbs v) (norm : WithAbs v → ℝ) where
  val n := Rat.castHom (WithAbs v) (u n)
  property := by
    intro ε hε
    obtain ⟨δ, hδ0, hδε⟩ := ostrowski_exists_rat_pos_rpow_lt hs hε
    obtain ⟨N, hN⟩ := u.2 δ hδ0
    refine ⟨N, fun j hj => ?_⟩
    have hsource : abs (u j - u N) < δ := hN j hj
    have hsource_real : ((abs (u j - u N) : ℚ) : ℝ) < (δ : ℝ) := by
      exact_mod_cast hsource
    have hpow :
        ((abs (u j - u N) : ℚ) : ℝ) ^ s < (δ : ℝ) ^ s :=
      Real.rpow_lt_rpow (by positivity) hsource_real hs
    calc
      ‖Rat.castHom (WithAbs v) (u j) -
          Rat.castHom (WithAbs v) (u N)‖
          = ‖Rat.castHom (WithAbs v) (u j - u N)‖ := by
            rw [map_sub]
      _ = ‖((u j - u N : ℚ) : ℝ)‖ ^ s :=
          ostrowski_ratCast_withAbs_norm_eq_of_real_rpow
            (K := K) v s hnorm (u j - u N)
      _ = ((abs (u j - u N) : ℚ) : ℝ) ^ s := by
          rw [Real.norm_eq_abs, Rat.cast_abs]
      _ < ε := hpow.trans hδε
@[simp]
private theorem ostrowski_ratCauSeqMapWithAbs_zero_of_real_rpow
    {K : Type*} [Field K] [CharZero K] (v : AbsoluteValue K ℝ)
    (s : ℝ) (hs : 0 < s)
    (hnorm : ∀ q : ℚ,
      ostrowski_restrictRatAbsoluteValue (K := K) v q =
        Rat.AbsoluteValue.real q ^ s) :
    ostrowski_ratCauSeqMapWithAbs_of_real_rpow
      (K := K) v s hs hnorm (0 : CauSeq ℚ (abs : ℚ → ℚ)) = 0 := by
  ext n
  simp [ostrowski_ratCauSeqMapWithAbs_of_real_rpow]
@[simp]
private theorem ostrowski_ratCauSeqMapWithAbs_one_of_real_rpow
    {K : Type*} [Field K] [CharZero K] (v : AbsoluteValue K ℝ)
    (s : ℝ) (hs : 0 < s)
    (hnorm : ∀ q : ℚ,
      ostrowski_restrictRatAbsoluteValue (K := K) v q =
        Rat.AbsoluteValue.real q ^ s) :
    ostrowski_ratCauSeqMapWithAbs_of_real_rpow
      (K := K) v s hs hnorm (1 : CauSeq ℚ (abs : ℚ → ℚ)) = 1 := by
  ext n
  simp [ostrowski_ratCauSeqMapWithAbs_of_real_rpow]
@[simp]
private theorem ostrowski_ratCauSeqMapWithAbs_add_of_real_rpow
    {K : Type*} [Field K] [CharZero K] (v : AbsoluteValue K ℝ)
    (s : ℝ) (hs : 0 < s)
    (hnorm : ∀ q : ℚ,
      ostrowski_restrictRatAbsoluteValue (K := K) v q =
        Rat.AbsoluteValue.real q ^ s)
    (u t : CauSeq ℚ (abs : ℚ → ℚ)) :
    ostrowski_ratCauSeqMapWithAbs_of_real_rpow
      (K := K) v s hs hnorm (u + t) =
        ostrowski_ratCauSeqMapWithAbs_of_real_rpow
          (K := K) v s hs hnorm u +
        ostrowski_ratCauSeqMapWithAbs_of_real_rpow
          (K := K) v s hs hnorm t := by
  ext n
  change Rat.castHom (WithAbs v) (u n + t n) =
    Rat.castHom (WithAbs v) (u n) + Rat.castHom (WithAbs v) (t n)
  exact (Rat.castHom (WithAbs v)).map_add (u n) (t n)
@[simp]
private theorem ostrowski_ratCauSeqMapWithAbs_mul_of_real_rpow
    {K : Type*} [Field K] [CharZero K] (v : AbsoluteValue K ℝ)
    (s : ℝ) (hs : 0 < s)
    (hnorm : ∀ q : ℚ,
      ostrowski_restrictRatAbsoluteValue (K := K) v q =
        Rat.AbsoluteValue.real q ^ s)
    (u t : CauSeq ℚ (abs : ℚ → ℚ)) :
    ostrowski_ratCauSeqMapWithAbs_of_real_rpow
      (K := K) v s hs hnorm (u * t) =
        ostrowski_ratCauSeqMapWithAbs_of_real_rpow
          (K := K) v s hs hnorm u *
        ostrowski_ratCauSeqMapWithAbs_of_real_rpow
          (K := K) v s hs hnorm t := by
  ext n
  change Rat.castHom (WithAbs v) (u n * t n) =
    Rat.castHom (WithAbs v) (u n) * Rat.castHom (WithAbs v) (t n)
  exact (Rat.castHom (WithAbs v)).map_mul (u n) (t n)
private theorem ostrowski_ratCauSeqMapWithAbs_equiv_of_real_rpow
    {K : Type*} [Field K] [CharZero K] (v : AbsoluteValue K ℝ)
    (s : ℝ) (hs : 0 < s)
    (hnorm : ∀ q : ℚ,
      ostrowski_restrictRatAbsoluteValue (K := K) v q =
        Rat.AbsoluteValue.real q ^ s)
    {u t : CauSeq ℚ (abs : ℚ → ℚ)} (hut : u ≈ t) :
    ostrowski_ratCauSeqMapWithAbs_of_real_rpow
      (K := K) v s hs hnorm u ≈
        ostrowski_ratCauSeqMapWithAbs_of_real_rpow
          (K := K) v s hs hnorm t := by
  intro ε hε
  obtain ⟨δ, hδ0, hδε⟩ := ostrowski_exists_rat_pos_rpow_lt hs hε
  obtain ⟨N, hN⟩ := hut δ hδ0
  refine ⟨N, fun j hj => ?_⟩
  have hsource : abs ((u - t) j) < δ := hN j hj
  have hsource_real : ((abs ((u - t) j) : ℚ) : ℝ) < (δ : ℝ) := by
    exact_mod_cast hsource
  have hpow :
      ((abs ((u - t) j) : ℚ) : ℝ) ^ s < (δ : ℝ) ^ s :=
    Real.rpow_lt_rpow (by positivity) hsource_real hs
  calc
    ‖((ostrowski_ratCauSeqMapWithAbs_of_real_rpow
        (K := K) v s hs hnorm u -
      ostrowski_ratCauSeqMapWithAbs_of_real_rpow
        (K := K) v s hs hnorm t) j)‖
        = ‖Rat.castHom (WithAbs v) ((u - t) j)‖ := by
          change ‖Rat.castHom (WithAbs v) (u j) - Rat.castHom (WithAbs v) (t j)‖ =
            ‖Rat.castHom (WithAbs v) (u j - t j)‖
          exact (congrArg (fun z : WithAbs v => ‖z‖)
            ((Rat.castHom (WithAbs v)).map_sub (u j) (t j))).symm
    _ = ‖(((u - t) j : ℚ) : ℝ)‖ ^ s :=
        ostrowski_ratCast_withAbs_norm_eq_of_real_rpow
          (K := K) v s hnorm ((u - t) j)
    _ = ((abs ((u - t) j) : ℚ) : ℝ) ^ s := by
        rw [Real.norm_eq_abs, Rat.cast_abs]
    _ < ε := hpow.trans hδε
 
private theorem ostrowski_cauSeq_isComplete_withAbs_of_complete
    {K : Type*} [Field K] (v : AbsoluteValue K ℝ)
    (hcomplete : CompleteSpace (WithAbs v)) :
    CauSeq.IsComplete (WithAbs v) (norm : WithAbs v → ℝ) := by
  let : CompleteSpace (WithAbs v) :=
    hcomplete
  refine ⟨fun s => ?_⟩
  obtain ⟨a, ha⟩ := cauchySeq_tendsto_of_complete (CauSeq.cauchySeq s)
  refine ⟨a, ?_⟩
  rw [Metric.tendsto_atTop] at ha
  intro ε hε
  obtain ⟨N, hN⟩ := ha ε hε
  refine ⟨N, fun j hj => ?_⟩
  simpa [dist_eq_norm] using hN j hj
 


private theorem ostrowski_real_mk_tendsto_ratCauSeq
    (s : CauSeq ℚ (abs : ℚ → ℚ)) :
    Tendsto (fun n => (s n : ℝ)) atTop (nhds (Real.mk s)) := by
  rw [Metric.tendsto_atTop]
  intro ε hε
  obtain ⟨δ, hδ0, hδε⟩ := exists_rat_btwn hε
  have hδq : (0 : ℚ) < δ := by exact_mod_cast hδ0
  obtain ⟨N, hN⟩ := s.cauchy₂ hδq
  refine ⟨N, fun n hn => ?_⟩
  rw [Real.dist_eq, abs_sub_comm]
  have hnear :
      |Real.mk s - (s n : ℝ)| ≤ (δ : ℝ) :=
    Real.mk_near_of_forall_near
      (f := s) (x := (s n : ℝ)) (ε := (δ : ℝ))
      ⟨N, fun j hj => ?_⟩
  · exact hnear.trans_lt hδε
  · have hsource : abs (s j - s n) < δ := hN j hj n hn
    have hsource_real : ((abs (s j - s n) : ℚ) : ℝ) < (δ : ℝ) := by
      exact_mod_cast hsource
    rw [← Rat.cast_sub, ← Rat.cast_abs]
    exact hsource_real.le
 

private noncomputable def ostrowski_ratCauSeqCompletionEmbedding_of_real_rpow
    {K : Type*} [Field K] [CharZero K] (v : AbsoluteValue K ℝ)
    (hcomplete : CompleteSpace (WithAbs v))
    (s : ℝ) (hs : 0 < s)
    (hnorm : ∀ q : ℚ,
      ostrowski_restrictRatAbsoluteValue (K := K) v q =
        Rat.AbsoluteValue.real q ^ s) :
    CauSeq.Completion.Cauchy (abs : ℚ → ℚ) →+* WithAbs v := by
  letI : CauSeq.IsComplete (WithAbs v) (norm : WithAbs v → ℝ) :=
    ostrowski_cauSeq_isComplete_withAbs_of_complete v hcomplete
  exact
    { toFun := fun x =>
        Quotient.liftOn x
          (fun u =>
            CauSeq.lim
              (ostrowski_ratCauSeqMapWithAbs_of_real_rpow
                (K := K) v s hs hnorm u))
          (fun u t hut =>
            CauSeq.lim_eq_lim_of_equiv
              (ostrowski_ratCauSeqMapWithAbs_equiv_of_real_rpow
                (K := K) v s hs hnorm hut))
      map_zero' := by
        change CauSeq.lim
          (ostrowski_ratCauSeqMapWithAbs_of_real_rpow
            (K := K) v s hs hnorm (0 : CauSeq ℚ (abs : ℚ → ℚ))) = 0
        rw [ostrowski_ratCauSeqMapWithAbs_zero_of_real_rpow]
        change CauSeq.lim (CauSeq.const (norm : WithAbs v → ℝ) 0) = 0
        rw [CauSeq.lim_const]
      map_one' := by
        change CauSeq.lim
          (ostrowski_ratCauSeqMapWithAbs_of_real_rpow
            (K := K) v s hs hnorm (1 : CauSeq ℚ (abs : ℚ → ℚ))) = 1
        rw [ostrowski_ratCauSeqMapWithAbs_one_of_real_rpow]
        change CauSeq.lim (CauSeq.const (norm : WithAbs v → ℝ) 1) = 1
        rw [CauSeq.lim_const]
      map_add' := by
        intro x y
        refine Quotient.inductionOn₂ x y ?_
        intro u t
        change CauSeq.lim
          (ostrowski_ratCauSeqMapWithAbs_of_real_rpow
            (K := K) v s hs hnorm (u + t)) =
          CauSeq.lim
            (ostrowski_ratCauSeqMapWithAbs_of_real_rpow
              (K := K) v s hs hnorm u) +
          CauSeq.lim
            (ostrowski_ratCauSeqMapWithAbs_of_real_rpow
              (K := K) v s hs hnorm t)
        rw [ostrowski_ratCauSeqMapWithAbs_add_of_real_rpow,
          ← CauSeq.lim_add]
      map_mul' := by
        intro x y
        refine Quotient.inductionOn₂ x y ?_
        intro u t
        change CauSeq.lim
          (ostrowski_ratCauSeqMapWithAbs_of_real_rpow
            (K := K) v s hs hnorm (u * t)) =
          CauSeq.lim
            (ostrowski_ratCauSeqMapWithAbs_of_real_rpow
              (K := K) v s hs hnorm u) *
          CauSeq.lim
            (ostrowski_ratCauSeqMapWithAbs_of_real_rpow
              (K := K) v s hs hnorm t)
        rw [ostrowski_ratCauSeqMapWithAbs_mul_of_real_rpow,
          ← CauSeq.lim_mul_lim] }
 

private noncomputable def ostrowski_realEmbedding_of_real_rpow
    {K : Type*} [Field K] [CharZero K] (v : AbsoluteValue K ℝ)
    (hcomplete : CompleteSpace (WithAbs v))
    (s : ℝ) (hs : 0 < s)
    (hnorm : ∀ q : ℚ,
      ostrowski_restrictRatAbsoluteValue (K := K) v q =
        Rat.AbsoluteValue.real q ^ s) :
    ℝ →+* WithAbs v :=
  (ostrowski_ratCauSeqCompletionEmbedding_of_real_rpow
    (K := K) v hcomplete s hs hnorm).comp Real.ringEquivCauchy.toRingHom
@[simp]
private theorem ostrowski_ratCauSeqCompletionEmbedding_norm_mk_of_real_rpow
    {K : Type*} [Field K] [CharZero K] (v : AbsoluteValue K ℝ)
    (hcomplete : CompleteSpace (WithAbs v))
    (s : ℝ) (hs : 0 < s)
    (hnorm : ∀ q : ℚ,
      ostrowski_restrictRatAbsoluteValue (K := K) v q =
        Rat.AbsoluteValue.real q ^ s)
    (u : CauSeq ℚ (abs : ℚ → ℚ)) :
    ‖ostrowski_ratCauSeqCompletionEmbedding_of_real_rpow
      (K := K) v hcomplete s hs hnorm (CauSeq.Completion.mk u)‖ =
      ‖Real.mk u‖ ^ s := by
  let : CauSeq.IsComplete (WithAbs v) (norm : WithAbs v → ℝ) :=
    ostrowski_cauSeq_isComplete_withAbs_of_complete v hcomplete
  change ‖CauSeq.lim
      (ostrowski_ratCauSeqMapWithAbs_of_real_rpow
        (K := K) v s hs hnorm u)‖ = ‖Real.mk u‖ ^ s
  have hK :
      Tendsto
        (fun n =>
          ‖ostrowski_ratCauSeqMapWithAbs_of_real_rpow
            (K := K) v s hs hnorm u n‖)
        atTop
        (nhds ‖CauSeq.lim
          (ostrowski_ratCauSeqMapWithAbs_of_real_rpow
            (K := K) v s hs hnorm u)‖) :=
    tendsto_norm.comp
      (CauSeq.tendsto_limit
        (ostrowski_ratCauSeqMapWithAbs_of_real_rpow
          (K := K) v s hs hnorm u))
  have hK' :
      Tendsto (fun n => ‖(u n : ℝ)‖ ^ s) atTop
        (nhds ‖CauSeq.lim
          (ostrowski_ratCauSeqMapWithAbs_of_real_rpow
            (K := K) v s hs hnorm u)‖) := by
    convert hK using 1
    ext n
    change ‖(u n : ℝ)‖ ^ s = ‖Rat.castHom (WithAbs v) (u n)‖
    exact (ostrowski_ratCast_withAbs_norm_eq_of_real_rpow
      (K := K) v s hnorm (u n)).symm
  have hRnorm :
      Tendsto (fun n => ‖(u n : ℝ)‖) atTop (nhds ‖Real.mk u‖) :=
    tendsto_norm.comp (ostrowski_real_mk_tendsto_ratCauSeq u)
  have hR :
      Tendsto (fun n => ‖(u n : ℝ)‖ ^ s) atTop (nhds (‖Real.mk u‖ ^ s)) :=
    hRnorm.rpow_const (Or.inr hs.le)
  exact tendsto_nhds_unique hK' hR
private theorem ostrowski_realEmbedding_norm_eq_of_real_rpow
    {K : Type*} [Field K] [CharZero K] (v : AbsoluteValue K ℝ)
    (hcomplete : CompleteSpace (WithAbs v))
    (s : ℝ) (hs : 0 < s)
    (hnorm : ∀ q : ℚ,
      ostrowski_restrictRatAbsoluteValue (K := K) v q =
        Rat.AbsoluteValue.real q ^ s)
    (r : ℝ) :
    ‖ostrowski_realEmbedding_of_real_rpow
      (K := K) v hcomplete s hs hnorm r‖ = ‖r‖ ^ s := by
  induction r using Real.ind_mk with
  | h u =>
      change ‖ostrowski_ratCauSeqCompletionEmbedding_of_real_rpow
        (K := K) v hcomplete s hs hnorm (CauSeq.Completion.mk u)‖ =
        ‖Real.mk u‖ ^ s
      exact ostrowski_ratCauSeqCompletionEmbedding_norm_mk_of_real_rpow
        (K := K) v hcomplete s hs hnorm u
 



private noncomputable abbrev ostrowski_realAlgebra_of_real_rpow
    {K : Type*} [Field K] [CharZero K] (v : AbsoluteValue K ℝ)
    (hcomplete : CompleteSpace (WithAbs v))
    (s : ℝ) (hs : 0 < s)
    (hnorm : ∀ q : ℚ,
      ostrowski_restrictRatAbsoluteValue (K := K) v q =
        Rat.AbsoluteValue.real q ^ s) :
    Algebra ℝ (WithAbs v) :=
  (ostrowski_realEmbedding_of_real_rpow
    (K := K) v hcomplete s hs hnorm).toAlgebra
private theorem ostrowski_realAlgebra_norm_algebraMap_of_real_rpow
    {K : Type*} [Field K] [CharZero K] (v : AbsoluteValue K ℝ)
    (hcomplete : CompleteSpace (WithAbs v))
    (s : ℝ) (hs : 0 < s)
    (hnorm : ∀ q : ℚ,
      ostrowski_restrictRatAbsoluteValue (K := K) v q =
        Rat.AbsoluteValue.real q ^ s) :
    letI : Algebra ℝ (WithAbs v) :=
      ostrowski_realAlgebra_of_real_rpow (K := K) v hcomplete s hs hnorm
    ∀ r : ℝ, ‖algebraMap ℝ (WithAbs v) r‖ = ‖r‖ ^ s := by
  let : Algebra ℝ (WithAbs v) :=
    ostrowski_realAlgebra_of_real_rpow (K := K) v hcomplete s hs hnorm
  intro r
  change ‖ostrowski_realEmbedding_of_real_rpow
    (K := K) v hcomplete s hs hnorm r‖ = ‖r‖ ^ s
  exact ostrowski_realEmbedding_norm_eq_of_real_rpow
    (K := K) v hcomplete s hs hnorm r
section RealRpowGelfandMazur
open Polynomial
open Bornology Filter Set Topology
variable {F : Type*} [NormedField F] [Algebra ℝ F]
 


private theorem ostrowski_continuous_algebraMap_of_real_rpow
    {s : ℝ} (hs : 0 < s)
    (hnorm : ∀ r : ℝ, ‖algebraMap ℝ F r‖ = ‖r‖ ^ s) :
    Continuous (algebraMap ℝ F) := by
  rw [Metric.continuous_iff]
  intro r ε hε
  obtain ⟨δ, hδ0, hδε⟩ := ostrowski_exists_rat_pos_rpow_lt hs hε
  refine ⟨(δ : ℝ), by exact_mod_cast hδ0, fun y hy => ?_⟩
  have hdist : ‖y - r‖ < (δ : ℝ) := by
    simpa [Real.dist_eq, dist_eq_norm] using hy
  have hpow : ‖y - r‖ ^ s < (δ : ℝ) ^ s :=
    Real.rpow_lt_rpow (norm_nonneg _) hdist hs
  calc
    dist (algebraMap ℝ F y) (algebraMap ℝ F r)
        = ‖algebraMap ℝ F (y - r)‖ := by
          rw [dist_eq_norm, map_sub]
    _ = ‖y - r‖ ^ s := hnorm (y - r)
    _ < ε := hpow.trans hδε
private theorem ostrowski_tendsto_norm_rpow_cobounded_atTop
    {s : ℝ} (hs : 0 < s) :
    Tendsto (fun r : ℝ => ‖r‖ ^ s) (cobounded ℝ) atTop :=
  (tendsto_rpow_atTop hs).comp tendsto_norm_cobounded_atTop
private theorem ostrowski_tendsto_norm_rpow_fst_atTop
    {s : ℝ} (hs : 0 < s) :
    Tendsto (fun y : ℝ × ℝ => ‖y.1‖ ^ s) (cobounded ℝ ×ˢ ⊤) atTop :=
  (tendsto_rpow_atTop hs).comp
    (by
      rw [tendsto_norm_atTop_iff_cobounded]
      exact tendsto_fst)
private theorem ostrowski_tendsto_norm_rpow_snd_atTop
    {s : ℝ} (hs : 0 < s) (S : Set ℝ) :
    Tendsto (fun y : ℝ × ℝ => ‖y.2‖ ^ s) (𝓟 S ×ˢ cobounded ℝ) atTop :=
  (tendsto_rpow_atTop hs).comp
    (by
      rw [tendsto_norm_atTop_iff_cobounded]
      exact tendsto_snd)
 

private abbrev ostrowski_realRpowPhi (x : F) (u : ℝ × ℝ) : F :=
  x ^ 2 - algebraMap ℝ F u.1 * x + algebraMap ℝ F u.2
private theorem ostrowski_continuous_realRpowPhi
    {s : ℝ} (hs : 0 < s)
    (hnorm : ∀ r : ℝ, ‖algebraMap ℝ F r‖ = ‖r‖ ^ s)
    (x : F) :
    Continuous (ostrowski_realRpowPhi (F := F) x) := by
  have hcont_alg : Continuous (algebraMap ℝ F) :=
    ostrowski_continuous_algebraMap_of_real_rpow
      (F := F) hs hnorm
  exact ((continuous_const.pow 2).sub
    ((hcont_alg.comp continuous_fst).mul continuous_const)).add
      (hcont_alg.comp continuous_snd)
private theorem ostrowski_aeval_eq_realRpowPhi
    (x : F) (u : ℝ × ℝ) :
    aeval x (X ^ 2 - C u.1 * X + C u.2) =
      ostrowski_realRpowPhi (F := F) x u := by
  simp [ostrowski_realRpowPhi]
 
private theorem ostrowski_norm_eq_of_isMinOn_of_forall_le
    {X E : Type*} [TopologicalSpace X] [PreconnectedSpace X]
    [SeminormedAddCommGroup E] {f : X → E} {M : ℝ} {x : X}
    (hM : 0 < M) (hx : ‖f x‖ = M) (h : IsMinOn (‖f ·‖) univ x)
    (hf : Continuous f)
    (H : ∀ {y} z, ‖f y‖ = M →
      ∀ n > 0, ‖f z‖ ≤ M * (1 + (‖f z - f y‖ / M) ^ n))
    (y : X) :
    ‖f y‖ = M := by
  suffices {y | ‖f y‖ = M} = univ by
    simpa only [← this, hx] using! mem_univ y
  refine IsClopen.eq_univ ⟨isClosed_eq (by fun_prop) (by fun_prop), ?_⟩
    (nonempty_of_mem hx)
  rw [isOpen_iff_eventually]
  intro w hw
  filter_upwards [mem_map.mp <| hf.tendsto w (Metric.ball_mem_nhds (f w) hM)] with u hu
  simp only [mem_preimage, Metric.mem_ball, dist_eq_norm, ← div_lt_one₀ hM] at hu
  refine le_antisymm ?_ (hx ▸ isMinOn_univ_iff.mp h u)
  suffices Tendsto
      (fun n : ℕ => M * (1 + (‖f u - f w‖ / M) ^ n))
      atTop (𝓝 (M * (1 + 0))) by
    refine ge_of_tendsto (by simpa) ?_
    filter_upwards [Ioi_mem_atTop 0] with n hn
    exact H u hw n hn
  exact tendsto_pow_atTop_nhds_zero_of_lt_one (by positivity) hu
    |>.const_add 1 |>.const_mul M
 

private theorem ostrowski_le_aeval_of_isMonicOfDegree_real_rpow
    {x : F} {M : ℝ} (hM : 0 ≤ M)
    (h : ∀ z : ℝ × ℝ, M ≤ ‖ostrowski_realRpowPhi (F := F) x z‖)
    {p : ℝ[X]} {n : ℕ} (hp : IsMonicOfDegree p (2 * n)) :
    M ^ n ≤ ‖aeval x p‖ := by
  induction n generalizing p with
  | zero => simp_all
  | succ n ih =>
      rw [mul_add, mul_one] at hp
      obtain ⟨f₁, f₂, hf₁, hf₂, H⟩ :=
        hp.eq_isMonicOfDegree_two_mul_isMonicOfDegree
      obtain ⟨a, b, hab⟩ := isMonicOfDegree_two_iff'.mp hf₁
      rw [H, aeval_mul, norm_mul, mul_comm, pow_succ, hab,
        ostrowski_aeval_eq_realRpowPhi (F := F) x (a, b)]
      exact mul_le_mul (ih hf₂) (h (a, b)) hM (norm_nonneg _)
 


private theorem ostrowski_norm_realRpowPhi_eq_of_isMinOn
    {s : ℝ} (hs : 0 < s)
    (hnorm : ∀ r : ℝ, ‖algebraMap ℝ F r‖ = ‖r‖ ^ s)
    {x : F} {z : ℝ × ℝ}
    (h : IsMinOn (‖ostrowski_realRpowPhi (F := F) x ·‖) univ z)
    (H : ‖ostrowski_realRpowPhi (F := F) x z‖ ≠ 0)
    (w : ℝ × ℝ) :
    ‖ostrowski_realRpowPhi (F := F) x w‖ =
      ‖ostrowski_realRpowPhi (F := F) x z‖ := by
  set M : ℝ := ‖ostrowski_realRpowPhi (F := F) x z‖ with hM
  have hM₀ : 0 < M := by positivity
  refine ostrowski_norm_eq_of_isMinOn_of_forall_le
    hM₀ hM.symm h
    (ostrowski_continuous_realRpowPhi (F := F) hs hnorm x)
    (fun {w} u hw n hn => ?_) w
  have HH :
      M * (1 + (‖ostrowski_realRpowPhi (F := F) x u -
        ostrowski_realRpowPhi (F := F) x w‖ / M) ^ n) =
        (M ^ n + ‖ostrowski_realRpowPhi (F := F) x u -
          ostrowski_realRpowPhi (F := F) x w‖ ^ n) / M ^ (n - 1) := by
    simp only [field, div_pow, ← pow_succ', Nat.sub_add_cancel hn]
  rw [HH, le_div_iff₀ (by positivity)]
  clear HH
  let q (y : ℝ × ℝ) : ℝ[X] := X ^ 2 - C y.1 * X + C y.2
  have hq (y : ℝ × ℝ) : IsMonicOfDegree (q y) 2 :=
    isMonicOfDegree_sub_add_two ..
  have hsub : q w - q u = (C u.1 - C w.1) * X + C w.2 - C u.2 := by
    simp only [q]
    ring
  have hdvd : q u ∣ q w ^ n - (q w - q u) ^ n := by
    nth_rewrite 1 [← sub_sub_self (q w) (q u)]
    exact sub_dvd_pow_sub_pow ..
  have H' : ((q w - q u) ^ n).natDegree < 2 * n := by
    rw [hsub]
    compute_degree
    grind
  obtain ⟨p, hp, hrel⟩ :=
    ((hq w).pow n).of_dvd_sub (by grind) (hq u) H' hdvd
  clear H' hdvd hsub
  rw [show 2 * n - 2 = 2 * (n - 1) by grind] at hp
  grw [ostrowski_le_aeval_of_isMonicOfDegree_real_rpow
    (F := F) hM₀.le (isMinOn_univ_iff.mp h) hp]
  rw [← sub_eq_iff_eq_add, eq_comm, mul_comm] at hrel
  apply_fun (‖aeval x ·‖) at hrel
  rw [map_mul, norm_mul, map_sub,
    ostrowski_aeval_eq_realRpowPhi (F := F) x u] at hrel
  rw [hrel, norm_sub_rev (ostrowski_realRpowPhi (F := F) x u)]
  exact (norm_sub_le ..).trans <| by
    simp [q, ostrowski_aeval_eq_realRpowPhi, hw]
 

private theorem ostrowski_exists_isMinOn_norm_sub_algebraMap_of_real_rpow
    {s : ℝ} (hs : 0 < s)
    (hnorm : ∀ r : ℝ, ‖algebraMap ℝ F r‖ = ‖r‖ ^ s)
    (x : F) :
    ∃ z : ℝ, IsMinOn (fun r : ℝ => ‖x - algebraMap ℝ F r‖) univ z := by
  have hcont_alg : Continuous (algebraMap ℝ F) :=
    ostrowski_continuous_algebraMap_of_real_rpow
      (F := F) hs hnorm
  have htend :
      Tendsto (fun r : ℝ => ‖x - algebraMap ℝ F r‖)
        (cobounded ℝ) atTop := by
    have hbase :
        Tendsto (fun r : ℝ => ‖r‖ ^ s - ‖x‖)
          (cobounded ℝ) atTop :=
      tendsto_atTop_add_const_right _ _
        (ostrowski_tendsto_norm_rpow_cobounded_atTop hs)
    refine tendsto_atTop_mono' _ ?_ hbase
    filter_upwards with r
    calc
      ‖r‖ ^ s - ‖x‖ = ‖algebraMap ℝ F r‖ - ‖x‖ := by
        rw [hnorm r]
      _ ≤ ‖algebraMap ℝ F r - x‖ := norm_sub_norm_le _ _
      _ = ‖x - algebraMap ℝ F r‖ := by rw [norm_sub_rev]
  simp only [isMinOn_univ_iff]
  refine (show Continuous fun r : ℝ => ‖x - algebraMap ℝ F r‖ from
    (continuous_const.sub hcont_alg).norm).exists_forall_le_of_isBounded 0 ?_
  simpa [isBounded_def, compl_ofPred, Ioi]
    using htend (Ioi_mem_atTop ‖x - algebraMap ℝ F (0 : ℝ)‖)
 

private theorem ostrowski_tendsto_realRpowPhi_cobounded
    {s : ℝ} (hs : 0 < s)
    (hnorm : ∀ r : ℝ, ‖algebraMap ℝ F r‖ = ‖r‖ ^ s)
    {x : F} {c : ℝ} (hc₀ : 0 < c)
    (hbd : ∀ r : ℝ, c ≤ ‖x - algebraMap ℝ F r‖) :
    Tendsto (ostrowski_realRpowPhi (F := F) x ·)
      (cobounded (ℝ × ℝ)) (cobounded F) := by
  simp_rw [ostrowski_realRpowPhi, sub_add]
  refine tendsto_const_sub_cobounded _ |>.comp ?_
  rw [← tendsto_norm_atTop_iff_cobounded]
  refine Tendsto.coprod_of_prod_top_right (α := ℝ) (fun S hS => ?_) ?_
  · rw [← isCobounded_def, ← isBounded_compl_iff] at hS
    obtain ⟨M, hM_pos, hM⟩ : ∃ M > 0, ∀ y ∈ Sᶜ, ‖y‖ ≤ M :=
      hS.exists_pos_norm_le
    suffices Tendsto
        (fun y : ℝ × ℝ => ‖y.2‖ ^ s - M ^ s * ‖x‖)
        (𝓟 Sᶜ ×ˢ cobounded ℝ) atTop by
      refine tendsto_atTop_mono' _ ?_ this
      filter_upwards [prod_mem_prod (mem_principal_self Sᶜ) univ_mem] with y hy
      rw [norm_sub_rev]
      refine le_trans ?_ (norm_sub_norm_le ..)
      have hy₁_le : ‖y.1‖ ≤ M := hM _ (Set.mem_prod.mp hy).1
      have hy₁_pow : ‖y.1‖ ^ s ≤ M ^ s :=
        Real.rpow_le_rpow (norm_nonneg _) hy₁_le hs.le
      calc
        ‖algebraMap ℝ F y.2‖ - ‖algebraMap ℝ F y.1 * x‖
            = ‖y.2‖ ^ s - ‖y.1‖ ^ s * ‖x‖ := by
              rw [hnorm y.2, norm_mul, hnorm y.1]
        _ ≥ ‖y.2‖ ^ s - M ^ s * ‖x‖ := by
              gcongr
    exact tendsto_atTop_add_const_right _ _
      (ostrowski_tendsto_norm_rpow_snd_atTop hs Sᶜ)
  · suffices Tendsto (fun y : ℝ × ℝ => ‖y.1‖ ^ s * c)
        (cobounded ℝ ×ˢ ⊤) atTop by
      refine tendsto_atTop_mono' _ ?_ this
      filter_upwards [prod_mem_prod (isBounded_singleton (x := 0)) univ_mem] with y hy
      have hy₁_ne : y.1 ≠ 0 := by
        simpa using (Set.mem_prod.mp hy).1
      calc
        ‖y.1‖ ^ s * c
            ≤ ‖y.1‖ ^ s * ‖x - algebraMap ℝ F (y.1⁻¹ * y.2)‖ := by
              gcongr
              exact hbd _
        _ = ‖algebraMap ℝ F y.1‖ *
              ‖x - algebraMap ℝ F (y.1⁻¹ * y.2)‖ := by
              rw [hnorm y.1]
        _ = ‖algebraMap ℝ F y.1 *
              (x - algebraMap ℝ F (y.1⁻¹ * y.2))‖ := by
              rw [norm_mul]
        _ = ‖algebraMap ℝ F y.1 * x - algebraMap ℝ F y.2‖ := by
              congr 1
              rw [mul_sub, ← map_mul]
              have hmul : y.1 * (y.1⁻¹ * y.2) = y.2 := by
                field_simp [hy₁_ne]
              rw [hmul]
    simpa [mul_comm] using
      Tendsto.const_mul_atTop hc₀
        (ostrowski_tendsto_norm_rpow_fst_atTop hs)
 
private theorem ostrowski_exists_isMinOn_norm_realRpowPhi
    {s : ℝ} (hs : 0 < s)
    (hnorm : ∀ r : ℝ, ‖algebraMap ℝ F r‖ = ‖r‖ ^ s)
    (x : F) :
    ∃ z : ℝ × ℝ,
      IsMinOn (‖ostrowski_realRpowPhi (F := F) x ·‖) univ z := by
  obtain ⟨u, hu⟩ :=
    ostrowski_exists_isMinOn_norm_sub_algebraMap_of_real_rpow
      (F := F) hs hnorm x
  rcases eq_or_lt_of_le (norm_nonneg (x - algebraMap ℝ F u)) with hc₀ | hc₀
  · rw [eq_comm, norm_eq_zero, sub_eq_zero] at hc₀
    exact ⟨(u, 0), fun y => by
      simp [ostrowski_realRpowPhi, hc₀, sq]⟩
  · simp only [isMinOn_univ_iff] at hu ⊢
    refine (ostrowski_continuous_realRpowPhi (F := F) hs hnorm x).norm
      |>.exists_forall_le_of_isBounded (0, 0) ?_
    simpa [isBounded_def, compl_ofPred, Ioi]
      using tendsto_norm_cobounded_atTop.comp
        (ostrowski_tendsto_realRpowPhi_cobounded
          (F := F) hs hnorm hc₀ hu)
        (Ioi_mem_atTop ‖ostrowski_realRpowPhi (F := F) x (0, 0)‖)
 

private theorem ostrowski_exists_isMonicOfDegree_two_and_aeval_eq_zero_real_rpow
    {s : ℝ} (hs : 0 < s)
    (hnorm : ∀ r : ℝ, ‖algebraMap ℝ F r‖ = ‖r‖ ^ s)
    (x : F) :
    ∃ p : ℝ[X], IsMonicOfDegree p 2 ∧ aeval x p = 0 := by
  obtain ⟨z, h⟩ :=
    ostrowski_exists_isMinOn_norm_realRpowPhi (F := F) hs hnorm x
  suffices ostrowski_realRpowPhi (F := F) x z = 0 from
    ⟨_, isMonicOfDegree_sub_add_two z.1 z.2, by
      rwa [ostrowski_aeval_eq_realRpowPhi]⟩
  by_contra! H
  set M := ‖ostrowski_realRpowPhi (F := F) x z‖
  have h' (r : ℝ) : √M ≤ ‖x - algebraMap ℝ F r‖ := by
    rw [← sq_le_sq₀ M.sqrt_nonneg (norm_nonneg _),
      Real.sq_sqrt (norm_nonneg _), ← norm_pow,
      Commute.sub_sq <| (Algebra.commutes r x).symm]
    have hcomm : x * algebraMap ℝ F r = algebraMap ℝ F r * x :=
      (Algebra.commutes r x).symm
    convert! isMinOn_univ_iff.mp h (2 * r, r ^ 2) using 4 <;>
      simp [two_mul, add_mul, sq, hcomm]
  have htend := tendsto_norm_atTop_iff_cobounded.mpr <|
    ostrowski_tendsto_realRpowPhi_cobounded
      (F := F) hs hnorm (by positivity) h'
  simp only [ostrowski_norm_realRpowPhi_eq_of_isMinOn
    (F := F) hs hnorm h (norm_ne_zero_iff.mpr H)] at htend
  exact Filter.not_tendsto_const_atTop _ _ htend
 

private theorem ostrowski_gelfandMazur_of_real_rpow_scalar
    (F : Type*) [NormedField F] [Algebra ℝ F]
    {s : ℝ} (hs : 0 < s)
    (hnorm : ∀ r : ℝ, ‖algebraMap ℝ F r‖ = ‖r‖ ^ s) :
    Nonempty (F ≃ₐ[ℝ] ℝ) ∨ Nonempty (F ≃ₐ[ℝ] ℂ) := by
  have : Algebra.IsAlgebraic ℝ F := by
    refine ⟨fun x => ?_⟩
    obtain ⟨p, hp, hpx⟩ :=
      ostrowski_exists_isMonicOfDegree_two_and_aeval_eq_zero_real_rpow
        (F := F) hs hnorm x
    exact ⟨p, hp.ne_zero, hpx⟩
  exact _root_.Real.nonempty_algEquiv_or F
end RealRpowGelfandMazur
private theorem ostrowski_gelfandMazur_of_real_rpow
    {K : Type*} [Field K] [CharZero K] (v : AbsoluteValue K ℝ)
    (hcomplete : CompleteSpace (WithAbs v))
    (s : ℝ) (hs : 0 < s)
    (hnorm : ∀ q : ℚ,
      ostrowski_restrictRatAbsoluteValue (K := K) v q =
        Rat.AbsoluteValue.real q ^ s) :
    letI : Algebra ℝ (WithAbs v) :=
      ostrowski_realAlgebra_of_real_rpow (K := K) v hcomplete s hs hnorm
    Nonempty (WithAbs v ≃ₐ[ℝ] ℝ) ∨
      Nonempty (WithAbs v ≃ₐ[ℝ] ℂ) := by
  let : Algebra ℝ (WithAbs v) :=
    ostrowski_realAlgebra_of_real_rpow (K := K) v hcomplete s hs hnorm
  exact ostrowski_gelfandMazur_of_real_rpow_scalar (WithAbs v) hs
    (ostrowski_realAlgebra_norm_algebraMap_of_real_rpow
      (K := K) v hcomplete s hs hnorm)
private theorem ostrowski_realAlgEquiv_norm_eq_of_real_rpow
    {K : Type*} [Field K] [CharZero K] (v : AbsoluteValue K ℝ)
    (hcomplete : CompleteSpace (WithAbs v))
    (s : ℝ) (hs : 0 < s)
    (hnorm : ∀ q : ℚ,
      ostrowski_restrictRatAbsoluteValue (K := K) v q =
        Rat.AbsoluteValue.real q ^ s) :
    letI : Algebra ℝ (WithAbs v) :=
      ostrowski_realAlgebra_of_real_rpow (K := K) v hcomplete s hs hnorm
    ∀ (e : WithAbs v ≃ₐ[ℝ] ℝ) (x : WithAbs v),
      ‖x‖ = ‖e x‖ ^ s := by
  let : Algebra ℝ (WithAbs v) :=
    ostrowski_realAlgebra_of_real_rpow (K := K) v hcomplete s hs hnorm
  intro e x
  have hx : x = algebraMap ℝ (WithAbs v) (e x) := by
    calc
      x = e.symm (e x) := by simp
      _ = algebraMap ℝ (WithAbs v) (e x) := by
        simpa using (AlgEquiv.commutes e.symm (e x))
  rw [hx]
  simp only [AlgEquiv.commutes, Algebra.algebraMap_self_apply]
  exact ostrowski_realAlgebra_norm_algebraMap_of_real_rpow
    (K := K) v hcomplete s hs hnorm (e x)
private theorem ostrowski_realBranch_abs_eq_of_real_rpow
    {K : Type*} [Field K] [CharZero K] (v : AbsoluteValue K ℝ)
    (hcomplete : CompleteSpace (WithAbs v))
    (s : ℝ) (hs : 0 < s)
    (hnorm : ∀ q : ℚ,
      ostrowski_restrictRatAbsoluteValue (K := K) v q =
        Rat.AbsoluteValue.real q ^ s) :
    letI : Algebra ℝ (WithAbs v) :=
      ostrowski_realAlgebra_of_real_rpow (K := K) v hcomplete s hs hnorm
    ∀ (e : WithAbs v ≃ₐ[ℝ] ℝ) (x : K),
      v x = ‖e ((WithAbs.equiv v).symm x)‖ ^ s := by
  let : Algebra ℝ (WithAbs v) :=
    ostrowski_realAlgebra_of_real_rpow (K := K) v hcomplete s hs hnorm
  intro e x
  change ‖((WithAbs.equiv v).symm x : WithAbs v)‖ =
    ‖e ((WithAbs.equiv v).symm x)‖ ^ s
  exact ostrowski_realAlgEquiv_norm_eq_of_real_rpow
    (K := K) v hcomplete s hs hnorm e ((WithAbs.equiv v).symm x)
end AbsoluteValue
namespace AlgEquiv
private theorem norm_symm_I_eq_one
    {F : Type*} [NormedField F] [Algebra ℝ F]
    (e : F ≃ₐ[ℝ] ℂ) :
    ‖e.symm Complex.I‖ = 1 := by
  have hsq : (e.symm Complex.I : F) ^ 2 = -1 := by
    apply e.injective
    simp [Complex.I_sq]
  have hsqnorm : ‖e.symm Complex.I‖ ^ 2 = (1 : ℝ) := by
    calc
      ‖e.symm Complex.I‖ ^ 2 = ‖(e.symm Complex.I : F) ^ 2‖ := by simp
      _ = ‖(-1 : F)‖ := by rw [hsq]
      _ = 1 := by simp
  nlinarith [norm_nonneg (e.symm Complex.I),
    sq_nonneg (‖e.symm Complex.I‖ - 1), hsqnorm]
private theorem norm_symm_le_re_add_im_rpow
    {F : Type*} [NormedField F] [Algebra ℝ F]
    {s : ℝ}
    (hnorm : ∀ r : ℝ, ‖algebraMap ℝ F r‖ = ‖r‖ ^ s)
    (e : F ≃ₐ[ℝ] ℂ) (z : ℂ) :
    ‖e.symm z‖ ≤ ‖z.re‖ ^ s + ‖z.im‖ ^ s := by
  let j : F := e.symm Complex.I
  have hj : ‖j‖ = 1 :=
    norm_symm_I_eq_one e
  have hzdecomp :
      e.symm z = algebraMap ℝ F z.re + algebraMap ℝ F z.im * j := by
    apply e.injective
    simp [j, Complex.re_add_im]
  calc
    ‖e.symm z‖ =
        ‖algebraMap ℝ F z.re + algebraMap ℝ F z.im * j‖ := by
          rw [hzdecomp]
    _ ≤ ‖algebraMap ℝ F z.re‖ + ‖algebraMap ℝ F z.im * j‖ :=
        norm_add_le _ _
    _ = ‖z.re‖ ^ s + ‖z.im‖ ^ s := by
        rw [norm_mul, hnorm z.re, hnorm z.im, hj, mul_one]
private theorem norm_symm_le_one_of_norm_eq_one
    {F : Type*} [NormedField F] [Algebra ℝ F]
    {s : ℝ} (hs : 0 < s)
    (hnorm : ∀ r : ℝ, ‖algebraMap ℝ F r‖ = ‖r‖ ^ s)
    (e : F ≃ₐ[ℝ] ℂ) {z : ℂ} (hz : ‖z‖ = 1) :
    ‖e.symm z‖ ≤ 1 := by
  by_contra hnot
  have hlt : 1 < ‖e.symm z‖ := lt_of_not_ge hnot
  obtain ⟨n, hn⟩ := pow_unbounded_of_one_lt (2 : ℝ) hlt
  have hbound : ‖e.symm z‖ ^ n ≤ (2 : ℝ) := by
    calc
      ‖e.symm z‖ ^ n = ‖(e.symm z : F) ^ n‖ := by simp
      _ = ‖e.symm (z ^ n)‖ := by
          congr 1
          exact (map_pow e.symm z n).symm
      _ ≤ ‖(z ^ n).re‖ ^ s + ‖(z ^ n).im‖ ^ s :=
          norm_symm_le_re_add_im_rpow hnorm e (z ^ n)
      _ ≤ 1 + 1 := by
          have hzpow : ‖z ^ n‖ = (1 : ℝ) := by
            rw [norm_pow, hz, one_pow]
          have hre : ‖(z ^ n).re‖ ≤ (1 : ℝ) := by
            rw [Real.norm_eq_abs]
            exact (Complex.abs_re_le_norm (z ^ n)).trans_eq hzpow
          have him : ‖(z ^ n).im‖ ≤ (1 : ℝ) := by
            rw [Real.norm_eq_abs]
            exact (Complex.abs_im_le_norm (z ^ n)).trans_eq hzpow
          have hre_pow : ‖(z ^ n).re‖ ^ s ≤ (1 : ℝ) :=
            by simpa using
              Real.rpow_le_rpow (norm_nonneg _) hre hs.le
          have him_pow : ‖(z ^ n).im‖ ^ s ≤ (1 : ℝ) :=
            by simpa using
              Real.rpow_le_rpow (norm_nonneg _) him hs.le
          linarith
      _ = 2 := by norm_num
  exact not_lt_of_ge hbound hn
private theorem norm_symm_eq_one_of_norm_eq_one
    {F : Type*} [NormedField F] [Algebra ℝ F]
    {s : ℝ} (hs : 0 < s)
    (hnorm : ∀ r : ℝ, ‖algebraMap ℝ F r‖ = ‖r‖ ^ s)
    (e : F ≃ₐ[ℝ] ℂ) {z : ℂ} (hz : ‖z‖ = 1) :
    ‖e.symm z‖ = 1 := by
  have hle : ‖e.symm z‖ ≤ 1 :=
    norm_symm_le_one_of_norm_eq_one
      hs hnorm e hz
  have hz0 : z ≠ 0 := by
    intro h
    simp [h] at hz
  have hle_inv : ‖e.symm z⁻¹‖ ≤ 1 := by
    exact norm_symm_le_one_of_norm_eq_one
      hs hnorm e (by simp [norm_inv, hz])
  have hprod : ‖e.symm z‖ * ‖e.symm z⁻¹‖ = 1 := by
    calc
      ‖e.symm z‖ * ‖e.symm z⁻¹‖ =
          ‖(e.symm z : F) * e.symm z⁻¹‖ := by
            rw [norm_mul]
      _ = ‖(1 : F)‖ := by
          congr 1
          rw [← map_mul]
          simp [hz0]
      _ = 1 := by simp
  have hpos_inv : 0 < ‖e.symm z⁻¹‖ := norm_pos_iff.mpr (by
    intro h
    apply hz0
    simpa using congrArg e h)
  have hge : 1 ≤ ‖e.symm z‖ := by
    nlinarith [hprod, hle_inv, hpos_inv]
  exact le_antisymm hle hge
 
theorem norm_symm_apply_eq_norm_rpow
    {F : Type*} [NormedField F] [Algebra ℝ F]
    {s : ℝ} (hs : 0 < s)
    (hnorm : ∀ r : ℝ, ‖algebraMap ℝ F r‖ = ‖r‖ ^ s)
    (e : F ≃ₐ[ℝ] ℂ) (z : ℂ) :
    ‖e.symm z‖ = ‖z‖ ^ s := by
  by_cases hz0 : z = 0
  · simp [hz0, hs.ne']
  · let r : ℝ := ‖z‖
    have hr_pos : 0 < r := by
      simpa [r] using norm_pos_iff.mpr hz0
    let u : ℂ := (r⁻¹ : ℂ) * z
    have hu_norm : ‖u‖ = 1 := by
      simp [u, r, hr_pos.ne']
    have hz_decomp : z = (r : ℂ) * u := by
      simp [u, r, hr_pos.ne']
    calc
      ‖e.symm z‖ = ‖e.symm ((r : ℂ) * u)‖ := by rw [hz_decomp]
      _ = ‖algebraMap ℝ F r * e.symm u‖ := by
          congr 1
          rw [map_mul]
          congr 1
          exact AlgEquiv.commutes e.symm r
      _ = ‖z‖ ^ s := by
          rw [norm_mul, hnorm r,
            norm_symm_eq_one_of_norm_eq_one
              hs hnorm e hu_norm, mul_one]
          simp [r]
end AlgEquiv
namespace AbsoluteValue
private theorem ostrowski_complexAlgEquiv_norm_eq_of_real_rpow
    {K : Type*} [Field K] [CharZero K] (v : AbsoluteValue K ℝ)
    (hcomplete : CompleteSpace (WithAbs v))
    (s : ℝ) (hs : 0 < s)
    (hnorm : ∀ q : ℚ,
      ostrowski_restrictRatAbsoluteValue (K := K) v q =
        Rat.AbsoluteValue.real q ^ s) :
    letI : Algebra ℝ (WithAbs v) :=
      ostrowski_realAlgebra_of_real_rpow (K := K) v hcomplete s hs hnorm
    ∀ (e : WithAbs v ≃ₐ[ℝ] ℂ) (x : WithAbs v),
      ‖x‖ = ‖e x‖ ^ s := by
  let : Algebra ℝ (WithAbs v) :=
    ostrowski_realAlgebra_of_real_rpow (K := K) v hcomplete s hs hnorm
  intro e x
  calc
    ‖x‖ = ‖e.symm (e x)‖ := by simp
    _ = ‖e x‖ ^ s :=
        AlgEquiv.norm_symm_apply_eq_norm_rpow hs
          (ostrowski_realAlgebra_norm_algebraMap_of_real_rpow
            (K := K) v hcomplete s hs hnorm) e (e x)
private theorem ostrowski_complexBranch_abs_eq_of_real_rpow
    {K : Type*} [Field K] [CharZero K] (v : AbsoluteValue K ℝ)
    (hcomplete : CompleteSpace (WithAbs v))
    (s : ℝ) (hs : 0 < s)
    (hnorm : ∀ q : ℚ,
      ostrowski_restrictRatAbsoluteValue (K := K) v q =
        Rat.AbsoluteValue.real q ^ s) :
    letI : Algebra ℝ (WithAbs v) :=
      ostrowski_realAlgebra_of_real_rpow (K := K) v hcomplete s hs hnorm
    ∀ (e : WithAbs v ≃ₐ[ℝ] ℂ) (x : K),
      v x = ‖e ((WithAbs.equiv v).symm x)‖ ^ s := by
  let : Algebra ℝ (WithAbs v) :=
    ostrowski_realAlgebra_of_real_rpow (K := K) v hcomplete s hs hnorm
  intro e x
  change ‖((WithAbs.equiv v).symm x : WithAbs v)‖ =
    ‖e ((WithAbs.equiv v).symm x)‖ ^ s
  exact ostrowski_complexAlgEquiv_norm_eq_of_real_rpow
    (K := K) v hcomplete s hs hnorm e ((WithAbs.equiv v).symm x)
 



theorem ostrowski_of_complete
    {K : Type*} [Field K] (v : AbsoluteValue K ℝ)
    (hcomplete : CompleteSpace (WithAbs v))
    (harch : ¬ IsNonarchimedean (v : K → ℝ)) :
    letI : CharZero K := charZero_of_not_isNonarchimedean v harch
    ∃ s : ℝ, 0 < s ∧ s ≤ 1 ∧
      ((∃ σ : K ≃+* ℝ, ∀ a : K, v a = ‖σ a‖ ^ s) ∨
        (∃ σ : K ≃+* ℂ, ∀ a : K, v a = ‖σ a‖ ^ s)) := by
  let : CharZero K := charZero_of_not_isNonarchimedean v harch
  obtain ⟨s, hs, hs_le, hnorm⟩ :=
    ostrowski_restrictRat_exists_real_rpow_eq_of_not_isNonarchimedean
      (K := K) v harch
  refine ⟨s, hs, hs_le, ?_⟩
  let : Algebra ℝ (WithAbs v) :=
    ostrowski_realAlgebra_of_real_rpow (K := K) v hcomplete s hs hnorm
  rcases ostrowski_gelfandMazur_of_real_rpow
      (K := K) v hcomplete s hs hnorm with hreal | hcomplex
  · rcases hreal with ⟨e⟩
    left
    let σ : K ≃+* ℝ := (WithAbs.equiv v).symm.trans e.toRingEquiv
    refine ⟨σ, fun a => ?_⟩
    change v a = ‖e ((WithAbs.equiv v).symm a)‖ ^ s
    exact ostrowski_realBranch_abs_eq_of_real_rpow
      (K := K) v hcomplete s hs hnorm e a
  · rcases hcomplex with ⟨e⟩
    right
    let σ : K ≃+* ℂ := (WithAbs.equiv v).symm.trans e.toRingEquiv
    refine ⟨σ, fun a => ?_⟩
    change v a = ‖e ((WithAbs.equiv v).symm a)‖ ^ s
    exact ostrowski_complexBranch_abs_eq_of_real_rpow
      (K := K) v hcomplete s hs hnorm e a
end AbsoluteValue
end
end

/- ValuedFieldTheory.Valuation.AbsoluteValue.SpectralExtension -/
section
noncomputable section
namespace AbsoluteValue
private abbrev spectral_withAbsNontriviallyNormedField
    {K : Type*} [Field K] (v : AbsoluteValue K ℝ) (hv : v.IsNontrivial) :
    NontriviallyNormedField (WithAbs v) :=
  NontriviallyNormedField.ofNormNeOne
    (by
      rcases hv with ⟨x, hx0, hx1⟩
      refine ⟨WithAbs.toAbs v x, ?_, ?_⟩
      · intro hx
        apply hx0
        simpa using congrArg (WithAbs.equiv v) hx
      · simpa [WithAbs.norm_eq_apply_ofAbs] using hx1)
 

private instance withAbsAlgebra_isAlgebraic
    {K L : Type*} [Field K] [Field L] [Algebra K L]
    [Algebra.IsAlgebraic K L] (v : AbsoluteValue K ℝ) :
    Algebra.IsAlgebraic (WithAbs v) L := by
  exact Algebra.IsAlgebraic.tower_top
    (K := K) (L := WithAbs v) (A := L)
 
private theorem withAbs_isUltrametricDist
    {K : Type*} [Field K] (v : AbsoluteValue K ℝ)
    (hnonarch : IsNonarchimedean (v : K → ℝ)) :
    IsUltrametricDist (WithAbs v) := by
  refine IsUltrametricDist.isUltrametricDist_of_isNonarchimedean_norm ?_
  intro x y
  simpa [WithAbs.norm_eq_apply_ofAbs] using
    hnonarch (WithAbs.equiv v x) (WithAbs.equiv v y)
 

private theorem spectral_spectralNorm_extends_base
    {K L : Type*} [Field K] [Field L] [Algebra K L]
    [Algebra.IsAlgebraic K L]
    (v : AbsoluteValue K ℝ) (x : K) :
    _root_.spectralNorm (WithAbs v) L (algebraMap K L x) = v x := by
  let : Algebra.IsAlgebraic (WithAbs v) L :=
    withAbsAlgebra_isAlgebraic v
  simpa [WithAbs.algebraMap_left_apply, WithAbs.norm_eq_apply_ofAbs] using
    (_root_.spectralNorm_extends
      (K := WithAbs v) (L := L) ((WithAbs.equiv v).symm x))
 

private theorem spectral_spectralNorm_strong_triangle
    {K L : Type*} [Field K] [Field L] [Algebra K L]
    [Algebra.IsAlgebraic K L]
    (v : AbsoluteValue K ℝ)
    (hnonarch : IsNonarchimedean (v : K → ℝ)) (x y : L) :
    _root_.spectralNorm (WithAbs v) L (x + y) ≤
      max (_root_.spectralNorm (WithAbs v) L x)
        (_root_.spectralNorm (WithAbs v) L y) := by
  let : IsUltrametricDist (WithAbs v) :=
    withAbs_isUltrametricDist v hnonarch
  let : Algebra.IsAlgebraic (WithAbs v) L :=
    withAbsAlgebra_isAlgebraic v
  exact _root_.isNonarchimedean_spectralNorm
    (K := WithAbs v) (L := L) x y
 

private theorem spectral_spectralNorm_eq_zero_iff
    {K L : Type*} [Field K] [Field L] [Algebra K L]
    [Algebra.IsAlgebraic K L]
    (v : AbsoluteValue K ℝ) (x : L) :
    _root_.spectralNorm (WithAbs v) L x = 0 ↔ x = 0 := by
  let : Algebra.IsAlgebraic (WithAbs v) L :=
    withAbsAlgebra_isAlgebraic v
  constructor
  · intro hx
    exact _root_.eq_zero_of_map_spectralNorm_eq_zero
      (K := WithAbs v) (L := L) hx
      (Algebra.IsAlgebraic.isAlgebraic x)
  · intro hx
    rw [hx]
    exact _root_.spectralNorm_zero (K := WithAbs v) (L := L)
 

private theorem spectral_spectralNorm_mul
    {K L : Type*} [Field K] [Field L] [Algebra K L]
    [Algebra.IsAlgebraic K L]
    (v : AbsoluteValue K ℝ)
    (hcomplete : CompleteSpace (WithAbs v))
    (hnonarch : IsNonarchimedean (v : K → ℝ))
    (hv : v.IsNontrivial) (x y : L) :
    _root_.spectralNorm (WithAbs v) L (x * y) =
      _root_.spectralNorm (WithAbs v) L x *
        _root_.spectralNorm (WithAbs v) L y := by
  let : NontriviallyNormedField (WithAbs v) :=
    spectral_withAbsNontriviallyNormedField v hv
  let : Algebra (WithAbs v) L :=
    WithAbs.algebraLeft L v
  let : CompleteSpace (WithAbs v) :=
    hcomplete
  let : IsUltrametricDist (WithAbs v) :=
    withAbs_isUltrametricDist v hnonarch
  let : Algebra.IsAlgebraic (WithAbs v) L :=
    withAbsAlgebra_isAlgebraic v
  simpa [_root_.spectralAlgNorm_def] using
    (_root_.spectralAlgNorm_mul (K := WithAbs v) (L := L) x y)
 

noncomputable def spectralExtension
    {K L : Type*} [Field K] [Field L] [Algebra K L]
    [Algebra.IsAlgebraic K L]
    (v : AbsoluteValue K ℝ)
    (hcomplete : CompleteSpace (WithAbs v))
    (hnonarch : IsNonarchimedean (v : K → ℝ))
    (hv : v.IsNontrivial) : AbsoluteValue L ℝ where
  toFun := _root_.spectralNorm (WithAbs v) L
  map_mul' x y :=
    spectral_spectralNorm_mul (K := K) (L := L)
      v hcomplete hnonarch hv x y
  nonneg' x := _root_.spectralNorm_nonneg (K := WithAbs v) (L := L) x
  eq_zero' x := spectral_spectralNorm_eq_zero_iff (K := K) (L := L) v x
  add_le' x y := by
    have hstrong :=
      spectral_spectralNorm_strong_triangle v hnonarch x y
    have hx_nonneg :
        0 ≤ _root_.spectralNorm (WithAbs v) L x :=
      _root_.spectralNorm_nonneg (K := WithAbs v) (L := L) x
    have hy_nonneg :
        0 ≤ _root_.spectralNorm (WithAbs v) L y :=
      _root_.spectralNorm_nonneg (K := WithAbs v) (L := L) y
    exact hstrong.trans
      (max_le
        (le_add_of_nonneg_right hy_nonneg)
        (le_add_of_nonneg_left hx_nonneg))
 

theorem spectralExtension_extends
    {K L : Type*} [Field K] [Field L] [Algebra K L]
    [Algebra.IsAlgebraic K L]
    (v : AbsoluteValue K ℝ)
    (hcomplete : CompleteSpace (WithAbs v))
    (hnonarch : IsNonarchimedean (v : K → ℝ))
    (hv : v.IsNontrivial) :
    Extends v (spectralExtension (K := K) (L := L)
      v hcomplete hnonarch hv) :=
  spectral_spectralNorm_extends_base v
 
private theorem spectral_unique_spectralNorm
    {K L : Type*} [Field K] [Field L] [Algebra K L]
    [Algebra.IsAlgebraic K L]
    (v : AbsoluteValue K ℝ)
    (hcomplete : CompleteSpace (WithAbs v))
    (hnonarch : IsNonarchimedean (v : K → ℝ))
    (hv : v.IsNontrivial)
    (w : AbsoluteValue L ℝ)
    (hw_ext : Extends v w)
    (x : L) :
    w x = _root_.spectralNorm (WithAbs v) L x := by
  let : NontriviallyNormedField (WithAbs v) :=
    spectral_withAbsNontriviallyNormedField v hv
  let : Algebra (WithAbs v) L :=
    WithAbs.algebraLeft L v
  let : CompleteSpace (WithAbs v) :=
    hcomplete
  let : IsUltrametricDist (WithAbs v) :=
    withAbs_isUltrametricDist v hnonarch
  let : Algebra.IsAlgebraic (WithAbs v) L :=
    withAbsAlgebra_isAlgebraic v
  refine _root_.spectralNorm_unique_field_norm_ext
    (K := WithAbs v) (L := L) (f := w) ?_ x
  intro a
  rw [WithAbs.algebraMap_left_apply, hw_ext]
  exact (WithAbs.norm_eq_apply_ofAbs v a).symm
 

theorem eq_spectralExtension_of_extends
    {K L : Type*} [Field K] [Field L] [Algebra K L]
    [Algebra.IsAlgebraic K L]
    (v : AbsoluteValue K ℝ)
    (hcomplete : CompleteSpace (WithAbs v))
    (hnonarch : IsNonarchimedean (v : K → ℝ))
    (hv : v.IsNontrivial)
    (w : AbsoluteValue L ℝ)
    (hw_ext : Extends v w) :
    w = spectralExtension (K := K) (L := L)
      v hcomplete hnonarch hv := by
  ext x
  exact spectral_unique_spectralNorm
    v hcomplete hnonarch hv w hw_ext x
end AbsoluteValue
end
end

/- ValuedFieldTheory.Valuation.AbsoluteValue.Theory.AbsoluteValues -/
section
noncomputable section
open Filter
open scoped BigOperators Topology
namespace LubinTate
namespace Valuations
 
theorem absoluteValue_finset_sum_le
    {K : Type*} [Field K] (v : AbsoluteValue K ℝ)
    {ι : Type*} (s : Finset ι) (f : ι → K) :
    v (s.sum f) ≤ s.sum (fun i => v (f i)) := by
  classical
  refine Finset.induction_on s ?empty ?insert
  · simp
  · intro i s his ih
    rw [Finset.sum_insert his, Finset.sum_insert his]
    exact (v.add_le (f i) (s.sum f)).trans
      (by
        simpa [add_comm, add_left_comm, add_assoc] using
          add_le_add_left ih (v (f i)))
 

def EquivalentAbsoluteValues {K : Type*} [Field K]
    (v w : AbsoluteValue K ℝ) : Prop :=
  IsHomeomorph (WithAbs.congr v w (.refl K))
 

theorem equivalentAbsoluteValues_iff_isEquiv
    {K : Type*} [Field K] (v w : AbsoluteValue K ℝ) :
    EquivalentAbsoluteValues v w ↔ v.IsEquiv w :=
  (AbsoluteValue.isEquiv_iff_isHomeomorph v w).symm
 
theorem equivalentAbsoluteValues_of_isEquiv
    {K : Type*} [Field K] {v w : AbsoluteValue K ℝ}
    (h : v.IsEquiv w) :
    EquivalentAbsoluteValues v w :=
  (equivalentAbsoluteValues_iff_isEquiv v w).mpr h
 
theorem equivalentAbsoluteValues_refl
    {K : Type*} [Field K] (v : AbsoluteValue K ℝ) :
    EquivalentAbsoluteValues v v :=
  equivalentAbsoluteValues_of_isEquiv (AbsoluteValue.IsEquiv.rfl (v := v))
 

theorem equivalentAbsoluteValues_iff_exists_rpow_eq
    {K : Type*} [Field K] (v w : AbsoluteValue K ℝ) :
    EquivalentAbsoluteValues v w ↔ ∃ s : ℝ, 0 < s ∧ (v · ^ s) = w := by
  exact
    (equivalentAbsoluteValues_iff_isEquiv v w).trans
      (AbsoluteValue.isEquiv_iff_exists_rpow_eq (v := v) (w := w))
 

def NonarchimedeanAbsoluteValue {K : Type*} [Field K]
    (v : AbsoluteValue K ℝ) : Prop :=
  ∃ C : ℝ, ∀ n : ℕ, v (n : K) ≤ C
 
def StrongTriangle {K : Type*} [Field K] (v : AbsoluteValue K ℝ) : Prop :=
  ∀ x y : K, v (x + y) ≤ max (v x) (v y)
 

theorem nat_bound_ge_one
    {K : Type*} [Field K] (v : AbsoluteValue K ℝ) {C : ℝ}
    (hC : ∀ n : ℕ, v (n : K) ≤ C) :
    1 ≤ C := by
  simpa using hC 1
 


theorem add_pow_le_of_bounded_nat
    {K : Type*} [Field K] (v : AbsoluteValue K ℝ) {C : ℝ}
    (hC : ∀ n : ℕ, v (n : K) ≤ C) (x y : K) (n : ℕ) :
    v ((x + y) ^ n) ≤
      ((n + 1 : ℕ) : ℝ) * C * (max (v x) (v y)) ^ n := by
  classical
  let M : ℝ := max (v x) (v y)
  have hC_nonneg : 0 ≤ C :=
    (zero_le_one : (0 : ℝ) ≤ 1).trans
      (nat_bound_ge_one v hC)
  have hM_nonneg : 0 ≤ M :=
    (v.nonneg x).trans (le_max_left (v x) (v y))
  have hsum_le :
      v ((Finset.range (n + 1)).sum
          (fun m => x ^ m * y ^ (n - m) * (n.choose m : K))) ≤
        (Finset.range (n + 1)).sum
          (fun m => v (x ^ m * y ^ (n - m) * (n.choose m : K))) :=
    absoluteValue_finset_sum_le v (Finset.range (n + 1))
      (fun m => x ^ m * y ^ (n - m) * (n.choose m : K))
  have hterm :
      ∀ m ∈ Finset.range (n + 1),
        v (x ^ m * y ^ (n - m) * (n.choose m : K)) ≤ C * M ^ n := by
    intro m hm
    have hmle : m ≤ n := Nat.lt_succ_iff.mp (Finset.mem_range.mp hm)
    have hxpow : v (x ^ m) ≤ M ^ m := by
      rw [map_pow]
      exact pow_le_pow_left₀ (v.nonneg x) (le_max_left (v x) (v y)) m
    have hypow : v (y ^ (n - m)) ≤ M ^ (n - m) := by
      rw [map_pow]
      exact pow_le_pow_left₀ (v.nonneg y) (le_max_right (v x) (v y)) (n - m)
    have hxy :
        v (x ^ m) * v (y ^ (n - m)) ≤ M ^ m * M ^ (n - m) :=
      mul_le_mul hxpow hypow (v.nonneg (y ^ (n - m))) (pow_nonneg hM_nonneg m)
    have hchoose : v ((n.choose m : ℕ) : K) ≤ C := hC (n.choose m)
    calc
      v (x ^ m * y ^ (n - m) * (n.choose m : K))
          = v (x ^ m) * v (y ^ (n - m)) * v ((n.choose m : ℕ) : K) := by
              rw [map_mul, map_mul]
      _ ≤ (M ^ m * M ^ (n - m)) * C := by
              exact mul_le_mul hxy hchoose
                (v.nonneg ((n.choose m : ℕ) : K))
                (mul_nonneg (pow_nonneg hM_nonneg m)
                  (pow_nonneg hM_nonneg (n - m)))
      _ = C * M ^ n := by
              rw [← pow_add, Nat.add_sub_of_le hmle]
              ring
  calc
    v ((x + y) ^ n)
        = v ((Finset.range (n + 1)).sum
            (fun m => x ^ m * y ^ (n - m) * (n.choose m : K))) := by
            rw [add_pow]
    _ ≤ (Finset.range (n + 1)).sum
          (fun m => v (x ^ m * y ^ (n - m) * (n.choose m : K))) := hsum_le
    _ ≤ (Finset.range (n + 1)).sum (fun _m => C * M ^ n) :=
          Finset.sum_le_sum hterm
    _ = ((n + 1 : ℕ) : ℝ) * C * M ^ n := by
          simp [Finset.sum_const, nsmul_eq_mul, mul_assoc]
 

theorem tendsto_linear_bound_rpow_inv
    {C : ℝ} (hC : 0 < C) :
    Tendsto
      (fun n : ℕ => ((((n + 1 : ℕ) : ℝ) * C) ^ ((n : ℝ)⁻¹)))
      atTop (𝓝 1) := by
  have hCroot :
      Tendsto (fun n : ℕ => C ^ ((n : ℝ)⁻¹)) atTop (𝓝 1) := by
    have hcont : ContinuousAt (fun t : ℝ => C ^ t) 0 :=
      Real.continuousAt_const_rpow hC.ne'
    have hzero : Tendsto (fun n : ℕ => (n : ℝ)⁻¹) atTop (𝓝 0) :=
      tendsto_inv_atTop_zero.comp tendsto_natCast_atTop_atTop
    change Tendsto
      ((fun t : ℝ => C ^ t) ∘ fun n : ℕ => (n : ℝ)⁻¹) atTop (𝓝 1)
    simpa only [Real.rpow_zero] using hcont.tendsto.comp hzero
  have hshiftReal :
      Tendsto (fun x : ℝ => x ^ ((1 : ℝ) / (1 * x + (-1)))) atTop (𝓝 1) :=
    tendsto_rpow_div_mul_add 1 1 (-1) zero_ne_one
  have hshiftNat :
      Tendsto (fun n : ℕ => (((n + 1 : ℕ) : ℝ) ^ ((n : ℝ)⁻¹)))
        atTop (𝓝 1) := by
    have hnatshift : Tendsto (fun n : ℕ => (n : ℝ) + 1) atTop atTop :=
      tendsto_atTop_add_const_right atTop 1 tendsto_natCast_atTop_atTop
    refine (hshiftReal.comp hnatshift).congr' ?_
    exact Eventually.of_forall fun n => by
      simp [Nat.cast_add, Nat.cast_one, one_div, add_assoc]
  have htarget :
      Tendsto
        (fun n : ℕ => ((((n + 1 : ℕ) : ℝ) * C) ^ ((n : ℝ)⁻¹)))
        atTop (𝓝 (1 * 1)) := by
    refine (hshiftNat.mul hCroot).congr' ?_
    exact Eventually.of_forall fun n => by
      have hn_nonneg : 0 ≤ ((n + 1 : ℕ) : ℝ) := by positivity
      have hmul :=
        (Real.mul_rpow (z := ((n : ℝ)⁻¹)) hn_nonneg (le_of_lt hC)).symm
      simpa [mul_comm, mul_left_comm, mul_assoc] using hmul
  simpa using htarget
 
theorem add_le_root_bound_of_bounded_nat
    {K : Type*} [Field K] (v : AbsoluteValue K ℝ) {C : ℝ}
    (hC : ∀ n : ℕ, v (n : K) ≤ C) (x y : K)
    {n : ℕ} (hn : n ≠ 0) :
    v (x + y) ≤
      ((((n + 1 : ℕ) : ℝ) * C) ^ ((n : ℝ)⁻¹)) *
        max (v x) (v y) := by
  classical
  let M : ℝ := max (v x) (v y)
  have hC_pos : 0 < C :=
    zero_lt_one.trans_le (nat_bound_ge_one v hC)
  have hM_nonneg : 0 ≤ M :=
    (v.nonneg x).trans (le_max_left (v x) (v y))
  by_cases hMzero : M = 0
  · have hx_le_zero : v x ≤ 0 := by
      simpa [M, hMzero] using (le_max_left (v x) (v y))
    have hy_le_zero : v y ≤ 0 := by
      simpa [M, hMzero] using (le_max_right (v x) (v y))
    have hxzero : x = 0 := (v.eq_zero).mp (le_antisymm hx_le_zero (v.nonneg x))
    have hyzero : y = 0 := (v.eq_zero).mp (le_antisymm hy_le_zero (v.nonneg y))
    simp [hxzero, hyzero]
  · have hpow :
        (v (x + y)) ^ n ≤ ((n + 1 : ℕ) : ℝ) * C * M ^ n := by
      simpa [map_pow, M] using
        add_pow_le_of_bounded_nat v hC x y n
    have hright_nonneg :
        0 ≤ ((n + 1 : ℕ) : ℝ) * C * M ^ n := by
      exact mul_nonneg
        (mul_nonneg (by positivity) (le_of_lt hC_pos))
        (pow_nonneg hM_nonneg n)
    have hn_pos : 0 < (n : ℝ) := Nat.cast_pos.mpr (Nat.pos_of_ne_zero hn)
    have hroot :
        v (x + y) ≤
          (((n + 1 : ℕ) : ℝ) * C * M ^ n) ^ ((n : ℝ)⁻¹) := by
      rw [Real.le_rpow_inv_iff_of_pos (v.nonneg (x + y)) hright_nonneg hn_pos]
      simpa [Real.rpow_natCast] using hpow
    calc
      v (x + y)
          ≤ (((n + 1 : ℕ) : ℝ) * C * M ^ n) ^ ((n : ℝ)⁻¹) := hroot
      _ = ((((n + 1 : ℕ) : ℝ) * C) ^ ((n : ℝ)⁻¹)) * M := by
            have hcoef_nonneg : 0 ≤ ((n + 1 : ℕ) : ℝ) * C :=
              mul_nonneg (by positivity) (le_of_lt hC_pos)
            rw [Real.mul_rpow hcoef_nonneg (pow_nonneg hM_nonneg n)]
            rw [Real.pow_rpow_inv_natCast hM_nonneg hn]
      _ = ((((n + 1 : ℕ) : ℝ) * C) ^ ((n : ℝ)⁻¹)) *
            max (v x) (v y) := by
            rfl
 

theorem strong_triangle_of_nonarchimedean
    {K : Type*} [Field K] (v : AbsoluteValue K ℝ)
    (hnonarch : NonarchimedeanAbsoluteValue v) :
    StrongTriangle v := by
  rcases hnonarch with ⟨C, hC⟩
  have hC_pos : 0 < C :=
    zero_lt_one.trans_le (nat_bound_ge_one v hC)
  intro x y
  let M : ℝ := max (v x) (v y)
  have hlim :
      Tendsto
        (fun n : ℕ =>
          ((((n + 1 : ℕ) : ℝ) * C) ^ ((n : ℝ)⁻¹)) * M)
        atTop (𝓝 M) := by
    simpa using
      (tendsto_linear_bound_rpow_inv hC_pos).mul
        (tendsto_const_nhds (x := M))
  have heventually :
      ∀ᶠ n : ℕ in atTop,
        v (x + y) ≤
          ((((n + 1 : ℕ) : ℝ) * C) ^ ((n : ℝ)⁻¹)) * M := by
    refine eventually_atTop.2 ⟨1, ?_⟩
    intro n hn
    exact add_le_root_bound_of_bounded_nat
      (v := v) hC x y (n := n) (by omega)
  have hle :
      v (x + y) ≤ M :=
    le_of_tendsto_of_tendsto tendsto_const_nhds hlim heventually
  simpa [M, StrongTriangle] using hle
end Valuations
end LubinTate
end
end

/- ValuedFieldTheory.Valuation.AbsoluteValue.ValuationSubring -/
section
noncomputable section
open scoped Polynomial
namespace AlgebraicNumberTheory
namespace Valuations
 

def absoluteValueUnitBallSubring
    {K : Type*} [Field K] (v : AbsoluteValue K ℝ)
    (hnonarch : LubinTate.Valuations.NonarchimedeanAbsoluteValue v) : Subring K where
  carrier := {x | v x ≤ 1}
  zero_mem' := by simp
  one_mem' := by simp
  add_mem' := by
    intro x y hx hy
    exact (LubinTate.Valuations.strong_triangle_of_nonarchimedean
      v hnonarch x y).trans (max_le hx hy)
  neg_mem' := by
    intro x hx
    simpa using hx
  mul_mem' := by
    intro x y hx hy
    change v (x * y) ≤ 1
    rw [v.map_mul]
    exact mul_le_one₀ hx (v.nonneg y) hy
 

theorem mem_absoluteValueUnitBallSubring_iff
    {K : Type*} [Field K] (v : AbsoluteValue K ℝ)
    (hnonarch : LubinTate.Valuations.NonarchimedeanAbsoluteValue v) (x : K) :
    x ∈ absoluteValueUnitBallSubring v hnonarch ↔ v x ≤ 1 :=
  Iff.rfl
 

theorem absoluteValueUnitBallSubring_mem_or_inv_mem
    {K : Type*} [Field K] (v : AbsoluteValue K ℝ)
    (hnonarch : LubinTate.Valuations.NonarchimedeanAbsoluteValue v) (x : K) :
    x ∈ absoluteValueUnitBallSubring v hnonarch ∨
      x⁻¹ ∈ absoluteValueUnitBallSubring v hnonarch := by
  by_cases hx : v x ≤ 1
  · exact Or.inl ((mem_absoluteValueUnitBallSubring_iff
      v hnonarch x).2 hx)
  · right
    have hx_gt : 1 < v x := lt_of_not_ge hx
    rw [mem_absoluteValueUnitBallSubring_iff, map_inv₀]
    exact inv_le_one_of_one_le₀ hx_gt.le
 

def absoluteValueValuationSubring
    {K : Type*} [Field K] (v : AbsoluteValue K ℝ)
    (hnonarch : LubinTate.Valuations.NonarchimedeanAbsoluteValue v) :
    ValuationSubring K :=
  ValuationSubring.ofSubring
    (absoluteValueUnitBallSubring v hnonarch)
    (absoluteValueUnitBallSubring_mem_or_inv_mem v hnonarch)
 

theorem mem_absoluteValueValuationSubring_iff
    {K : Type*} [Field K] (v : AbsoluteValue K ℝ)
    (hnonarch : LubinTate.Valuations.NonarchimedeanAbsoluteValue v) (x : K) :
    x ∈ absoluteValueValuationSubring v hnonarch ↔
      v x ≤ 1 := by
  exact (ValuationSubring.mem_ofSubring
    (absoluteValueUnitBallSubring v hnonarch)
    (absoluteValueUnitBallSubring_mem_or_inv_mem v hnonarch) x).trans
    (mem_absoluteValueUnitBallSubring_iff v hnonarch x)
 


theorem isUnit_iff_abs_eq_one_of_mem_iff_le_one
    {K : Type*} [Field K] (v : AbsoluteValue K ℝ)
    {C : Type*} [SetLike C K] [SubmonoidClass C K]
    (S : C) (hS : ∀ x : K, x ∈ S ↔ v x ≤ 1) (x : S) :
    IsUnit x ↔ v (x : K) = 1 := by
  constructor
  · intro hx
    have hx_inv :=
      (Submonoid.isUnit_iff_and (S := S) (a := x)).mp hx
    have hx_le : v (x : K) ≤ 1 := (hS (x : K)).1 x.property
    have hinv_le : v ((x : K)⁻¹) ≤ 1 :=
      (hS ((x : K)⁻¹)).1 hx_inv.2
    have hmul : v (x : K) * v ((x : K)⁻¹) = 1 := by
      rw [← v.map_mul, mul_inv_cancel₀ hx_inv.1]
      simp
    have hge : 1 ≤ v (x : K) := by
      calc
        1 = v (x : K) * v ((x : K)⁻¹) := hmul.symm
        _ ≤ v (x : K) * 1 :=
          mul_le_mul_of_nonneg_left hinv_le (v.nonneg (x : K))
        _ = v (x : K) := by simp
    exact le_antisymm hx_le hge
  · intro hx
    rw [Submonoid.isUnit_iff_and (S := S) (a := x)]
    constructor
    · intro hx_zero
      have hzero_one : (0 : ℝ) = 1 := by
        simp [hx_zero] at hx
      exact zero_ne_one hzero_one
    · exact (hS ((x : K)⁻¹)).2 <| by
        rw [map_inv₀, hx]
        simp
 

theorem not_isUnit_iff_abs_lt_one_of_mem_iff_le_one
    {K : Type*} [Field K] (v : AbsoluteValue K ℝ)
    {C : Type*} [SetLike C K] [SubmonoidClass C K]
    (S : C) (hS : ∀ x : K, x ∈ S ↔ v x ≤ 1) (x : S) :
    ¬ IsUnit x ↔ v (x : K) < 1 := by
  have hx_le : v (x : K) ≤ 1 := (hS (x : K)).1 x.property
  rw [isUnit_iff_abs_eq_one_of_mem_iff_le_one v S hS]
  exact hx_le.lt_iff_ne.symm
end Valuations
end AlgebraicNumberTheory
end
end

/- ValuedFieldTheory.Valuation.AbsoluteValue.AlgebraicExtension.Core -/
section
noncomputable section
namespace AbsoluteValue
private abbrev algebraicExtension_standardRealAbsoluteValue : AbsoluteValue ℝ ℝ :=
  NormedField.toAbsoluteValue ℝ
 

private abbrev algebraicExtension_standardComplexAbsoluteValue : AbsoluteValue ℂ ℝ :=
  NormedField.toAbsoluteValue ℂ
 


noncomputable def rpow
    {F : Type*} [Field F] (v : AbsoluteValue F ℝ)
    (s : ℝ) (hs0 : 0 < s) (hs1 : s ≤ 1) : AbsoluteValue F ℝ where
  toFun x := v x ^ s
  map_mul' x y := by
    rw [v.map_mul, Real.mul_rpow (v.nonneg x) (v.nonneg y)]
  nonneg' x := Real.rpow_nonneg (v.nonneg x) s
  eq_zero' x := by
    rw [Real.rpow_eq_zero (v.nonneg x) hs0.ne']
    exact v.eq_zero
  add_le' x y := by
    calc
      v (x + y) ^ s ≤ (v x + v y) ^ s :=
        Real.rpow_le_rpow (v.nonneg _) (v.add_le x y) hs0.le
      _ ≤ v x ^ s + v y ^ s :=
        Real.rpow_add_le_add_rpow (v.nonneg x) (v.nonneg y) hs0.le hs1
 
@[simp]
theorem rpow_apply
    {F : Type*} [Field F] (v : AbsoluteValue F ℝ)
    (s : ℝ) (hs0 : 0 < s) (hs1 : s ≤ 1) (x : F) :
    rpow v s hs0 hs1 x = v x ^ s :=
  rfl
 
private theorem algebraicExtension_standardComplexAbsoluteValue_extends_standardReal
    (x : ℝ) :
    algebraicExtension_standardComplexAbsoluteValue (algebraMap ℝ ℂ x) =
      algebraicExtension_standardRealAbsoluteValue x := by
  change ‖(algebraMap ℝ ℂ x)‖ = ‖x‖
  simp
 


noncomputable def compAlgEquiv
    {K L E : Type*} [Field K] [Field L] [Field E]
    [Algebra K L] [Algebra K E] (e : L ≃ₐ[K] E)
    (w : AbsoluteValue E ℝ) : AbsoluteValue L ℝ :=
  w.comp (f := e.toRingHom) e.injective
 
@[simp]
theorem compAlgEquiv_extends_apply
    {K L E : Type*} [Field K] [Field L] [Field E]
    [Algebra K L] [Algebra K E] (e : L ≃ₐ[K] E)
    (w : AbsoluteValue E ℝ) (v : AbsoluteValue K ℝ)
    (hw : ∀ x : K, w (algebraMap K E x) = v x)
    (x : K) :
    compAlgEquiv e w (algebraMap K L x) =
      v x := by
  change w (e (algebraMap K L x)) = v x
  rw [AlgEquiv.commutes, hw]
private theorem algebraicExtension_real_algEquiv_real_unique_rpow_extension
    {L : Type*} [Field L] [Algebra ℝ L] (e : L ≃ₐ[ℝ] ℝ)
    (s : ℝ) (hs0 : 0 < s) (hs1 : s ≤ 1)
    (w : AbsoluteValue L ℝ)
    (hw : ∀ x : ℝ, w (algebraMap ℝ L x) =
      algebraicExtension_standardRealAbsoluteValue x ^ s) :
    w = rpow
      (compAlgEquiv
        e algebraicExtension_standardRealAbsoluteValue)
      s hs0 hs1 := by
  ext x
  have hx : x = algebraMap ℝ L (e x) := by
    calc
      x = e.symm (e x) := by simp
      _ = algebraMap ℝ L (e x) := by
        simpa using (AlgEquiv.commutes e.symm (e x))
  rw [hx, hw]
  exact congrArg (fun t : ℝ => t ^ s)
    (compAlgEquiv_extends_apply e
      algebraicExtension_standardRealAbsoluteValue algebraicExtension_standardRealAbsoluteValue
      (fun x => rfl) (e x)).symm
 


private theorem algebraicExtension_real_algEquiv_complex_unique_rpow_extension
    {L : Type*} [Field L] [Algebra ℝ L] (e : L ≃ₐ[ℝ] ℂ)
    (s : ℝ) (hs0 : 0 < s) (hs1 : s ≤ 1)
    (w : AbsoluteValue L ℝ)
    (hw : ∀ x : ℝ, w (algebraMap ℝ L x) =
      algebraicExtension_standardRealAbsoluteValue x ^ s) :
    w = rpow
      (compAlgEquiv
        e algebraicExtension_standardComplexAbsoluteValue)
      s hs0 hs1 := by
  let e' : WithAbs w ≃ₐ[ℝ] ℂ :=
    (WithAbs.algEquiv ℝ w).trans e
  have hnorm :
      ∀ r : ℝ, ‖algebraMap ℝ (WithAbs w) r‖ = ‖r‖ ^ s := by
    intro r
    rw [WithAbs.norm_eq_apply_ofAbs, WithAbs.algebraMap_right_apply]
    change w (algebraMap ℝ L r) =
      algebraicExtension_standardRealAbsoluteValue r ^ s
    exact hw r
  ext x
  let y : WithAbs w := WithAbs.toAbs w x
  change w x = ‖e x‖ ^ s
  calc
    w x = ‖y‖ := by
      simp [y, WithAbs.norm_eq_apply_ofAbs]
    _ = ‖e'.symm (e' y)‖ := by simp
    _ = ‖e' y‖ ^ s :=
      AlgEquiv.norm_symm_apply_eq_norm_rpow
        (F := WithAbs w) (s := s) hs0 hnorm e' (e' y)
    _ = ‖e x‖ ^ s := by simp [y, e']
 

private theorem algebraicExtension_complex_algEquiv_complex_unique_rpow_extension
    {L : Type*} [Field L] [Algebra ℂ L] (e : L ≃ₐ[ℂ] ℂ)
    (s : ℝ) (hs0 : 0 < s) (hs1 : s ≤ 1)
    (w : AbsoluteValue L ℝ)
    (hw : ∀ z : ℂ, w (algebraMap ℂ L z) =
      algebraicExtension_standardComplexAbsoluteValue z ^ s) :
    w = rpow
      (compAlgEquiv
        e algebraicExtension_standardComplexAbsoluteValue)
      s hs0 hs1 := by
  ext x
  have hx : x = algebraMap ℂ L (e x) := by
    calc
      x = e.symm (e x) := by simp
      _ = algebraMap ℂ L (e x) := by
        simpa using (AlgEquiv.commutes e.symm (e x))
  rw [hx, hw]
  exact congrArg (fun t : ℝ => t ^ s)
    (compAlgEquiv_extends_apply e
      algebraicExtension_standardComplexAbsoluteValue algebraicExtension_standardComplexAbsoluteValue
      (fun z => rfl) (e x)).symm
 
structure UniqueExtension
    {K L : Type*} [Field K] [Field L] [Algebra K L]
    (v : AbsoluteValue K ℝ) where
   
  extension : AbsoluteValue L ℝ
   
  isExtension : Extends v extension
   
  unique :
    ∀ w : AbsoluteValue L ℝ,
      Extends v w → w = extension
private noncomputable def algebraicExtension_realRpow
    {L : Type*} [Field L] [Algebra ℝ L] [Algebra.IsAlgebraic ℝ L]
    (s : ℝ) (hs0 : 0 < s) (hs1 : s ≤ 1) :
    UniqueExtension (K := ℝ) (L := L)
      (rpow
        algebraicExtension_standardRealAbsoluteValue s hs0 hs1) :=
  Classical.choice <| by
    rcases Real.nonempty_algEquiv_or L with hreal | hcomplex
    · rcases hreal with ⟨e⟩
      exact ⟨
        { extension :=
            rpow
              (compAlgEquiv
                e algebraicExtension_standardRealAbsoluteValue)
              s hs0 hs1
          isExtension := by
            intro x
            simp only [rpow_apply]
            rw [compAlgEquiv_extends_apply e
              algebraicExtension_standardRealAbsoluteValue
              algebraicExtension_standardRealAbsoluteValue (fun x => rfl) x]
          unique :=
            algebraicExtension_real_algEquiv_real_unique_rpow_extension
              e s hs0 hs1 }⟩
    · rcases hcomplex with ⟨e⟩
      exact ⟨
        { extension :=
            rpow
              (compAlgEquiv
                e algebraicExtension_standardComplexAbsoluteValue)
              s hs0 hs1
          isExtension := by
            intro x
            simp only [rpow_apply]
            rw [compAlgEquiv_extends_apply e
              algebraicExtension_standardComplexAbsoluteValue
              algebraicExtension_standardRealAbsoluteValue
              algebraicExtension_standardComplexAbsoluteValue_extends_standardReal x]
          unique :=
            algebraicExtension_real_algEquiv_complex_unique_rpow_extension
              e s hs0 hs1 }⟩
 


private noncomputable def algebraicExtension_complexRpow
    {L : Type*} [Field L] [Algebra ℂ L] [Algebra.IsAlgebraic ℂ L]
    (s : ℝ) (hs0 : 0 < s) (hs1 : s ≤ 1) :
    UniqueExtension (K := ℂ) (L := L)
      (rpow
        algebraicExtension_standardComplexAbsoluteValue s hs0 hs1) := by
  letI : Algebra.IsIntegral ℂ L := Algebra.IsAlgebraic.isIntegral
  let e0 : ℂ ≃ₐ[ℂ] L :=
    AlgEquiv.ofBijective (Algebra.ofId ℂ L)
      (IsAlgClosed.algebraMap_bijective_of_isIntegral (k := ℂ) (K := L))
  let e : L ≃ₐ[ℂ] ℂ := e0.symm
  exact
    { extension :=
        rpow
          (compAlgEquiv
            e algebraicExtension_standardComplexAbsoluteValue)
          s hs0 hs1
      isExtension := by
        intro z
        simp only [rpow_apply]
        rw [compAlgEquiv_extends_apply e
          algebraicExtension_standardComplexAbsoluteValue
          algebraicExtension_standardComplexAbsoluteValue (fun z => rfl) z]
      unique :=
        algebraicExtension_complex_algEquiv_complex_unique_rpow_extension
          e s hs0 hs1 }
 
private theorem algebraicExtension_isAlgebraic_of_base_ringEquiv
    {K E L : Type*} [Field K] [Field E] [Field L] [Algebra K L]
    [Algebra.IsAlgebraic K L] (σ : K ≃+* E) :
    letI : Algebra E K := RingHom.toAlgebra σ.symm.toRingHom
    letI : Algebra E L :=
      RingHom.toAlgebra ((algebraMap K L).comp σ.symm.toRingHom)
    Algebra.IsAlgebraic E L := by
  let : Algebra E K := RingHom.toAlgebra σ.symm.toRingHom
  let : Algebra E L :=
    RingHom.toAlgebra ((algebraMap K L).comp σ.symm.toRingHom)
  have : IsScalarTower E K L :=
    IsScalarTower.of_algebraMap_eq (fun r => by
      simp [RingHom.algebraMap_toAlgebra])
  let e : K ≃ₐ[E] E := AlgEquiv.ofRingEquiv (f := σ) (by
    intro r
    simp [RingHom.algebraMap_toAlgebra])
  have : Algebra.IsAlgebraic E K := e.symm.isAlgebraic
  exact Algebra.IsAlgebraic.trans E K L
 


private noncomputable def algebraicExtension_baseRingEquiv
    {K E L : Type*} [Field K] [Field E] [Field L] [Algebra K L]
    (σ : K ≃+* E) (vK : AbsoluteValue K ℝ) (vE : AbsoluteValue E ℝ)
    (hvσ : ∀ x : K, vE (σ x) = vK x)
    (R :
      letI : Algebra E L :=
        RingHom.toAlgebra ((algebraMap K L).comp σ.symm.toRingHom)
      UniqueExtension (K := E) (L := L) vE) :
    UniqueExtension (K := K) (L := L) vK := by
  letI : Algebra E L :=
    RingHom.toAlgebra ((algebraMap K L).comp σ.symm.toRingHom)
  exact
    { extension := R.extension
      isExtension := by
        intro x
        have hbase := R.isExtension (σ x)
        have hmap :
            algebraMap E L (σ x) = algebraMap K L x := by
          simp [RingHom.algebraMap_toAlgebra]
        calc
          R.extension (algebraMap K L x)
              = R.extension (algebraMap E L (σ x)) := by rw [hmap]
          _ = vE (σ x) := hbase
          _ = vK x := hvσ x
      unique := by
        intro w hw
        apply R.unique w
        intro z
        have hmap :
            algebraMap E L z = algebraMap K L (σ.symm z) := by
          simp [RingHom.algebraMap_toAlgebra]
        calc
          w (algebraMap E L z)
              = w (algebraMap K L (σ.symm z)) := by rw [hmap]
          _ = vK (σ.symm z) := hw (σ.symm z)
          _ = vE z := by
            simpa using (hvσ (σ.symm z)).symm }
 
private noncomputable def algebraicExtension_archimedean
    {K L : Type*} [Field K] [Field L] [Algebra K L]
    [Algebra.IsAlgebraic K L]
    (v : AbsoluteValue K ℝ)
    (hcomplete : CompleteSpace (WithAbs v))
    (harch : ¬ IsNonarchimedean (v : K → ℝ)) :
    UniqueExtension (K := K) (L := L) v :=
  Classical.choice <| by
  classical
  let : CharZero K := AbsoluteValue.charZero_of_not_isNonarchimedean v harch
  rcases AbsoluteValue.ostrowski_of_complete v hcomplete harch with
    ⟨s, hs0, hs1, hbranch⟩
  rcases hbranch with hreal | hcomplex
  · rcases hreal with ⟨σ, hσ⟩
    let : Algebra ℝ K := RingHom.toAlgebra σ.symm.toRingHom
    let : Algebra ℝ L :=
      RingHom.toAlgebra ((algebraMap K L).comp σ.symm.toRingHom)
    have : Algebra.IsAlgebraic ℝ L :=
      algebraicExtension_isAlgebraic_of_base_ringEquiv (K := K) (E := ℝ)
        (L := L) σ
    let R :=
      algebraicExtension_realRpow
        (L := L) s hs0 hs1
    exact ⟨
      algebraicExtension_baseRingEquiv
        (K := K) (E := ℝ) (L := L) σ v
        (rpow
          algebraicExtension_standardRealAbsoluteValue s hs0 hs1)
        (fun x => (hσ x).symm) R⟩
  · rcases hcomplex with ⟨σ, hσ⟩
    let : Algebra ℂ K := RingHom.toAlgebra σ.symm.toRingHom
    let : Algebra ℂ L :=
      RingHom.toAlgebra ((algebraMap K L).comp σ.symm.toRingHom)
    have : Algebra.IsAlgebraic ℂ L :=
      algebraicExtension_isAlgebraic_of_base_ringEquiv (K := K) (E := ℂ)
        (L := L) σ
    let R :=
      algebraicExtension_complexRpow
        (L := L) s hs0 hs1
    exact ⟨
      algebraicExtension_baseRingEquiv
        (K := K) (E := ℂ) (L := L) σ v
        (rpow
          algebraicExtension_standardComplexAbsoluteValue s hs0 hs1)
        (fun x => (hσ x).symm) R⟩
 

private noncomputable def algebraicExtension_nonarchimedean
    {K L : Type*} [Field K] [Field L] [Algebra K L]
    [Algebra.IsAlgebraic K L]
    (v : AbsoluteValue K ℝ)
    (hcomplete : CompleteSpace (WithAbs v))
    (hnonarch : IsNonarchimedean (v : K → ℝ))
    (hv : v.IsNontrivial) :
    UniqueExtension (K := K) (L := L) v where
  extension :=
    spectralExtension (K := K) (L := L)
      v hcomplete hnonarch hv
  isExtension :=
    spectralExtension_extends
      (K := K) (L := L) v hcomplete hnonarch hv
  unique :=
    eq_spectralExtension_of_extends
      (K := K) (L := L) v hcomplete hnonarch hv
 



noncomputable def uniqueAlgebraicExtension
    {K L : Type*} [Field K] [Field L] [Algebra K L]
    [Algebra.IsAlgebraic K L]
    (v : AbsoluteValue K ℝ)
    (hcomplete : CompleteSpace (WithAbs v))
    (hv : v.IsNontrivial) :
    UniqueExtension (K := K) (L := L) v := by
  by_cases hnonarch : IsNonarchimedean (v : K → ℝ)
  · exact algebraicExtension_nonarchimedean
      v hcomplete hnonarch hv
  · exact algebraicExtension_archimedean
      v hcomplete hnonarch
end AbsoluteValue
end
end

/- ValuedFieldTheory.Valuation.Completion.AbsoluteValueExtensions -/
section
noncomputable section
open scoped Topology
namespace AlgebraicNumberTheory
namespace Valuations
universe u v
 

abbrev AbsoluteValueExtension
    {K : Type u} [Field K] (vK : AbsoluteValue K ℝ)
    (L : Type v) [Field L] [Algebra K L] :=
  {w : AbsoluteValue L ℝ // AbsoluteValue.Extends vK w}
 
theorem AbsoluteValueExtension.isNontrivial
    {K : Type u} {L : Type v}
    [Field K] [Field L] [Algebra K L]
    {vK : AbsoluteValue K ℝ}
    (u : AbsoluteValueExtension vK L)
    (hvK : vK.IsNontrivial) :
    u.1.IsNontrivial := by
  rcases hvK with ⟨a, ha, hva⟩
  refine
    ⟨algebraMap K L a,
      (map_ne_zero (algebraMap K L)).2 ha, ?_⟩
  simpa only [u.2 a] using hva
 
abbrev absoluteValueExtension_algebraicCompletionClosure
    {K : Type u} [Field K] (vK : AbsoluteValue K ℝ) :=
  AlgebraicClosure vK.Completion
 

noncomputable def absoluteValueExtension_algebraicClosureAbsoluteValue
    {K : Type u} [Field K] (vK : AbsoluteValue K ℝ)
    (hvK : vK.IsNontrivial) :
    AbsoluteValue (absoluteValueExtension_algebraicCompletionClosure vK) ℝ :=
  (AbsoluteValue.uniqueAlgebraicExtension
    (AbsoluteValue.completionAbsoluteValue vK)
    (AbsoluteValue.completionAbsoluteValue_complete vK)
    (AbsoluteValue.completionAbsoluteValue_isNontrivial vK hvK)).extension
@[simp]
theorem absoluteValueExtension_algebraicClosureAbsoluteValue_algebraMap
    {K : Type u} [Field K] (vK : AbsoluteValue K ℝ)
    (hvK : vK.IsNontrivial) (x : vK.Completion) :
    absoluteValueExtension_algebraicClosureAbsoluteValue vK hvK
        (algebraMap vK.Completion
          (absoluteValueExtension_algebraicCompletionClosure vK) x) =
      AbsoluteValue.completionAbsoluteValue vK x := by
  exact
    (AbsoluteValue.uniqueAlgebraicExtension
      (AbsoluteValue.completionAbsoluteValue vK)
      (AbsoluteValue.completionAbsoluteValue_complete vK)
      (AbsoluteValue.completionAbsoluteValue_isNontrivial vK hvK)).isExtension x
 
noncomputable def absoluteValueExtension_localizationEmbedding
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    [Algebra.IsAlgebraic K L]
    (vK : AbsoluteValue K ℝ) (w : AbsoluteValueExtension vK L) :
    letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
    letI : SMul K w.1.Completion := hK.toSMul
    letI := AbsoluteValue.completionAlgebra vK w.1 w.2
    AbsoluteValue.algebraicLocalization vK w.1 w.2 →ₐ[vK.Completion]
      absoluteValueExtension_algebraicCompletionClosure vK := by
  letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  letI : SMul K w.1.Completion := hK.toSMul
  letI := AbsoluteValue.completionAlgebra vK w.1 w.2
  letI : Algebra.IsAlgebraic vK.Completion
      (AbsoluteValue.algebraicLocalization vK w.1 w.2) :=
    AbsoluteValue.algebraicLocalization_isAlgebraic vK w.1 w.2
  letI : Module.IsTorsionFree vK.Completion
      (AbsoluteValue.algebraicLocalization vK w.1 w.2) :=
    Module.isTorsionFree_iff_algebraMap_injective.mpr
      (algebraMap vK.Completion
        (AbsoluteValue.algebraicLocalization vK w.1 w.2)).injective
  letI : Module.IsTorsionFree vK.Completion
      (absoluteValueExtension_algebraicCompletionClosure vK) :=
    Module.isTorsionFree_iff_algebraMap_injective.mpr
      (algebraMap vK.Completion
        (absoluteValueExtension_algebraicCompletionClosure vK)).injective
  exact IsAlgClosed.lift
 

theorem absoluteValueExtension_localizationAbsoluteValue_eq_pullback
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    [Algebra.IsAlgebraic K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (w : AbsoluteValueExtension vK L) :
    letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
    letI : SMul K w.1.Completion := hK.toSMul
    letI := AbsoluteValue.completionAlgebra vK w.1 w.2
    AbsoluteValue.algebraicLocalizationAbsoluteValue vK w.1 w.2 =
      (absoluteValueExtension_algebraicClosureAbsoluteValue vK hvK).comp
        (absoluteValueExtension_localizationEmbedding vK w).injective := by
  let hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  let : SMul K w.1.Completion := hK.toSMul
  let := AbsoluteValue.completionAlgebra vK w.1 w.2
  let : Algebra.IsAlgebraic vK.Completion
      (AbsoluteValue.algebraicLocalization vK w.1 w.2) :=
    AbsoluteValue.algebraicLocalization_isAlgebraic vK w.1 w.2
  let R := AbsoluteValue.uniqueAlgebraicExtension
    (K := vK.Completion) (L := AbsoluteValue.algebraicLocalization vK w.1 w.2)
    (AbsoluteValue.completionAbsoluteValue vK)
    (AbsoluteValue.completionAbsoluteValue_complete vK)
    (AbsoluteValue.completionAbsoluteValue_isNontrivial vK hvK)
  have hleft : AbsoluteValue.algebraicLocalizationAbsoluteValue vK w.1 w.2 = R.extension :=
    R.unique _ (AbsoluteValue.algebraicLocalizationAbsoluteValue_extends vK w.1 w.2)
  have hright :
      (absoluteValueExtension_algebraicClosureAbsoluteValue vK hvK).comp
          (absoluteValueExtension_localizationEmbedding vK w).injective = R.extension := by
    apply R.unique
    intro x
    change absoluteValueExtension_algebraicClosureAbsoluteValue vK hvK
      (absoluteValueExtension_localizationEmbedding vK w
        (algebraMap vK.Completion (AbsoluteValue.algebraicLocalization vK w.1 w.2) x)) = _
    rw [(absoluteValueExtension_localizationEmbedding vK w).commutes]
    exact absoluteValueExtension_algebraicClosureAbsoluteValue_algebraMap vK hvK x
  exact hleft.trans hright.symm
 
noncomputable def absoluteValueExtension_pullback
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (tau : L →ₐ[K] absoluteValueExtension_algebraicCompletionClosure vK) :
    AbsoluteValue L ℝ :=
  (absoluteValueExtension_algebraicClosureAbsoluteValue vK hvK).comp tau.injective
 
theorem absoluteValueExtension_pullback_extends
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (tau : L →ₐ[K] absoluteValueExtension_algebraicCompletionClosure vK) :
    AbsoluteValue.Extends vK (absoluteValueExtension_pullback vK hvK tau) := by
  intro x
  change absoluteValueExtension_algebraicClosureAbsoluteValue vK hvK
    (tau (algebraMap K L x)) = vK x
  rw [tau.commutes,
    IsScalarTower.algebraMap_apply K vK.Completion
      (absoluteValueExtension_algebraicCompletionClosure vK),
    absoluteValueExtension_algebraicClosureAbsoluteValue_algebraMap]
  exact AbsoluteValue.completionAbsoluteValue_coe vK x
 
noncomputable def absoluteValueExtension_embeddingOfExtension
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    [Algebra.IsAlgebraic K L]
    (vK : AbsoluteValue K ℝ) (w : AbsoluteValueExtension vK L) :
    L →ₐ[K] absoluteValueExtension_algebraicCompletionClosure vK := by
  letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  letI : SMul K w.1.Completion := hK.toSMul
  letI := AbsoluteValue.completionAlgebra vK w.1 w.2
  let phi := absoluteValueExtension_localizationEmbedding vK w
  refine
    { __ := phi.toRingHom.comp (AbsoluteValue.toAlgebraicLocalization vK w.1 w.2)
      commutes' := ?_ }
  intro x
  change phi (AbsoluteValue.toAlgebraicLocalization vK w.1 w.2
    (algebraMap K L x)) = algebraMap K
      (absoluteValueExtension_algebraicCompletionClosure vK) x
  rw [AbsoluteValue.toAlgebraicLocalization_algebraMap,
    phi.commutes]
  rfl
 

theorem absoluteValueExtension_extension_eq_pullback_embeddingOfExtension
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    [Algebra.IsAlgebraic K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (w : AbsoluteValueExtension vK L) :
    w.1 = absoluteValueExtension_pullback vK hvK
      (absoluteValueExtension_embeddingOfExtension vK w) := by
  ext x
  let hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  let : SMul K w.1.Completion := hK.toSMul
  let := AbsoluteValue.completionAlgebra vK w.1 w.2
  have h := congrArg
    (fun a : AbsoluteValue (AbsoluteValue.algebraicLocalization vK w.1 w.2) ℝ =>
      a (AbsoluteValue.toAlgebraicLocalization vK w.1 w.2 x))
    (absoluteValueExtension_localizationAbsoluteValue_eq_pullback vK hvK w)
  calc
    w.1 x = AbsoluteValue.algebraicLocalizationAbsoluteValue vK w.1 w.2
        (AbsoluteValue.toAlgebraicLocalization vK w.1 w.2 x) :=
      (AbsoluteValue.algebraicLocalizationAbsoluteValue_toAlgebraicLocalization vK w.1 w.2 x).symm
    _ = absoluteValueExtension_pullback vK hvK
        (absoluteValueExtension_embeddingOfExtension vK w) x := by
      change AbsoluteValue.algebraicLocalizationAbsoluteValue vK w.1 w.2
          (AbsoluteValue.toAlgebraicLocalization vK w.1 w.2 x) =
        (absoluteValueExtension_algebraicClosureAbsoluteValue vK hvK).comp
          (absoluteValueExtension_localizationEmbedding vK w).injective
          (AbsoluteValue.toAlgebraicLocalization vK w.1 w.2 x)
      exact h
end Valuations
end AlgebraicNumberTheory
end
end

/- ValuedFieldTheory.Valuation.Completion.FiniteLocalization -/
section
noncomputable section
namespace AlgebraicNumberTheory
namespace Valuations
universe u v
open scoped TensorProduct
 

noncomputable abbrev absoluteValueExtension_completionNontriviallyNormedField
    {K : Type u} [Field K] (vK : AbsoluteValue K ℝ)
    (hvK : vK.IsNontrivial) :
    NontriviallyNormedField vK.Completion :=
  NontriviallyNormedField.ofNormNeOne (by
    rcases AbsoluteValue.completionAbsoluteValue_isNontrivial vK hvK with
      ⟨x, hx0, hx1⟩
    exact ⟨x, hx0, hx1⟩)
 

noncomputable abbrev absoluteValueExtension_completionNormedAlgebra
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (w : AbsoluteValueExtension vK L) :
    letI := AbsoluteValue.completionAlgebra vK w.1 w.2
    NormedAlgebra vK.Completion w.1.Completion := by
  letI := AbsoluteValue.completionAlgebra vK w.1 w.2
  refine
    { __ := AbsoluteValue.completionAlgebra vK w.1 w.2
      norm_smul_le := fun r x ↦ ?_ }
  rw [Algebra.smul_def, norm_mul,
    AbsoluteValue.completionAlgebra_algebraMap]
  rw [(AbsoluteValue.completionMap_isometry vK w.1 w.2).norm_map_of_map_zero
    (map_zero (AbsoluteValue.completionMap vK w.1 w.2))]
end Valuations
end AlgebraicNumberTheory
namespace AlgebraicNumberTheory
namespace Valuations
universe u v
open scoped TensorProduct
 

abbrev LocalizedCompletion
    {K : Type u} {L : Type v}
    [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ)
    (w : AbsoluteValueExtension vK L) :=
  AbsoluteValue.algebraicLocalization vK w.1 w.2
variable {K : Type u} {L : Type v}
    [Field K] [Field L] [Algebra K L] [FiniteDimensional K L]
end Valuations
end AlgebraicNumberTheory
end
end

/- ValuedFieldTheory.Ramification.HilbertRamification.AbsoluteValueConjugacy -/
section
noncomputable section
universe u v
namespace AlgebraicNumberTheory
namespace Valuations
 

def absoluteValueConjugate
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (w : AbsoluteValue L ℝ) (σ : L ≃ₐ[K] L) : AbsoluteValue L ℝ :=
  w.comp (f := σ.toRingEquiv.toRingHom) σ.injective
@[simp] theorem absoluteValueConjugate_apply
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (w : AbsoluteValue L ℝ) (σ : L ≃ₐ[K] L) (x : L) :
    absoluteValueConjugate w σ x = w (σ x) :=
  rfl
 

theorem absoluteValueConjugate_extends
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (w : AbsoluteValueExtension vK L)
    (σ : L ≃ₐ[K] L) :
    AbsoluteValue.Extends vK (absoluteValueConjugate w.1 σ) := by
  intro x
  rw [absoluteValueConjugate_apply, σ.commutes, w.2 x]
 
def absoluteValueExtensionConjugate
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (w : AbsoluteValueExtension vK L)
    (σ : L ≃ₐ[K] L) : AbsoluteValueExtension vK L :=
  ⟨absoluteValueConjugate w.1 σ,
    absoluteValueConjugate_extends vK w σ⟩
 


theorem equivalent_exactExtensions_eq
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (w w' : AbsoluteValueExtension vK L)
    (h : LubinTate.Valuations.EquivalentAbsoluteValues w.1 w'.1) :
    w = w' := by
  rcases (LubinTate.Valuations.equivalentAbsoluteValues_iff_exists_rpow_eq w.1 w'.1).mp h with
    ⟨s, hs, hpow⟩
  rcases hvK with ⟨a, ha, hva⟩
  have hbase : vK a ^ s = vK a := by
    have hpoint := congrFun hpow (algebraMap K L a)
    simpa [w.2 a, w'.2 a] using hpoint
  have hs_one : s = 1 :=
    (Real.rpow_right_inj (vK.pos ha) hva).mp (by simpa using hbase)
  apply Subtype.ext
  ext x
  have hpoint := congrFun hpow x
  simpa [hs_one] using hpoint
 


theorem absoluteValueConjugacy_exists_conjugatingAlgEquiv
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    [IsGalois K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (w w' : AbsoluteValueExtension vK L) :
    ∃ σ : L ≃ₐ[K] L, w'.1 = absoluteValueConjugate w.1 σ := by
  let A := absoluteValueExtension_algebraicCompletionClosure vK
  let τ : L →ₐ[K] A := absoluteValueExtension_embeddingOfExtension vK w
  let τ' : L →ₐ[K] A := absoluteValueExtension_embeddingOfExtension vK w'
  let : Algebra L A := τ.toRingHom.toAlgebra
  let : IsScalarTower K L A :=
    IsScalarTower.of_algebraMap_eq' τ.comp_algebraMap.symm
  let σ : L ≃ₐ[K] L := Normal.algHomEquivAut K A L τ'
  refine ⟨σ, ?_⟩
  rw [absoluteValueExtension_extension_eq_pullback_embeddingOfExtension vK hvK w',
    absoluteValueExtension_extension_eq_pullback_embeddingOfExtension vK hvK w]
  ext x
  change
    absoluteValueExtension_algebraicClosureAbsoluteValue vK hvK (τ' x) =
      absoluteValueExtension_algebraicClosureAbsoluteValue vK hvK (τ (σ x))
  congr 1
  simpa [σ, τ, AlgHom.restrictNormal', RingHom.algebraMap_toAlgebra] using
    (τ'.restrictNormal_commutes L x).symm
 



theorem absoluteValueConjugacy
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    [IsGalois K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (w w' : AbsoluteValueExtension vK L) :
    ∃ σ : L ≃ₐ[K] L,
      w' = absoluteValueExtensionConjugate vK w σ := by
  rcases absoluteValueConjugacy_exists_conjugatingAlgEquiv vK hvK w w' with
    ⟨σ, hσ⟩
  exact ⟨σ, Subtype.ext hσ⟩
end Valuations
end AlgebraicNumberTheory
end
end

/- ValuedFieldTheory.Ramification.HilbertRamification.DecompositionGroup -/
section
noncomputable section
universe u v w
namespace HilbertRamification
open AlgebraicNumberTheory.Valuations
variable (K : Type u) {L : Type w} [Field K] [Field L] [Algebra K L]
 



def absoluteValueDecompositionGroup (w : AbsoluteValue L ℝ) :
    Subgroup (L ≃ₐ[K] L) where
  carrier := { σ | ∀ x : L, w (σ x) < 1 ↔ w x < 1 }
  one_mem' := by
    intro x
    rfl
  mul_mem' := by
    intro σ τ hσ hτ x
    exact (hσ (τ x)).trans (hτ x)
  inv_mem' := by
    intro σ hσ x
    have h := hσ (σ⁻¹ x)
    simpa using h.symm
@[simp] theorem mem_absoluteValueDecompositionGroup_iff
    (w : AbsoluteValue L ℝ) (σ : L ≃ₐ[K] L) :
    σ ∈ absoluteValueDecompositionGroup K w ↔
      ∀ x : L, w (σ x) < 1 ↔ w x < 1 :=
  Iff.rfl
 

theorem mem_absoluteValueDecompositionGroup_iff_equivalent
    (w : AbsoluteValue L ℝ) (σ : L ≃ₐ[K] L) :
    σ ∈ absoluteValueDecompositionGroup K w ↔
      LubinTate.Valuations.EquivalentAbsoluteValues
        (w.comp (f := σ.toRingEquiv.toRingHom) σ.injective) w := by
  rw [LubinTate.Valuations.equivalentAbsoluteValues_iff_isEquiv,
    AbsoluteValue.isEquiv_iff_lt_one_iff]
  rfl
 


theorem mem_absoluteValueDecompositionGroup_iff_extensionConjugate_eq
    {K₀ : Type u} {L₀ : Type w} [Field K₀] [Field L₀] [Algebra K₀ L₀]
    (vK : AbsoluteValue K₀ ℝ) (hvK : vK.IsNontrivial)
    (vL : AbsoluteValueExtension vK L₀) (σ : L₀ ≃ₐ[K₀] L₀) :
    σ ∈ absoluteValueDecompositionGroup K₀ vL.1 ↔
      absoluteValueExtensionConjugate vK vL σ = vL := by
  rw [mem_absoluteValueDecompositionGroup_iff_equivalent]
  change
    LubinTate.Valuations.EquivalentAbsoluteValues
        (absoluteValueExtensionConjugate vK vL σ).1 vL.1 ↔ _
  constructor
  · exact equivalent_exactExtensions_eq vK hvK
      (absoluteValueExtensionConjugate vK vL σ) vL
  · intro h
    rw [h]
    exact LubinTate.Valuations.equivalentAbsoluteValues_refl vL.1
section IntermediateField
variable {M : Type v} [Field M] [Algebra K M] [Algebra M L]
  [IsScalarTower K M L]
end IntermediateField
namespace ValuationSubring
section NonarchimedeanIntermediateField
variable {M : Type v} [Field M] [Algebra K M] [Algebra M L]
  [IsScalarTower K M L]
end NonarchimedeanIntermediateField
end ValuationSubring
end HilbertRamification
end
end

/- ValuedFieldTheory.Ramification.HilbertRamification.AlgebraicLocalization -/
section
noncomputable section
universe u v
namespace HilbertRamification
open AlgebraicNumberTheory.Valuations
variable {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
section LocalizationLift
variable (vK : AbsoluteValue K ℝ) (w : AbsoluteValueExtension vK L)
 

def valuationPreservingWithAbsRingEquiv
    (σ : L ≃ₐ[K] L) : WithAbs w.1 ≃+* WithAbs w.1 :=
  (WithAbs.equiv w.1).trans
    (σ.toRingEquiv.trans (WithAbs.equiv w.1).symm)
theorem valuationPreservingWithAbsRingEquiv_isometry
    (σ : L ≃ₐ[K] L) (hσ : ∀ x : L, w.1 (σ x) = w.1 x) :
    Isometry (valuationPreservingWithAbsRingEquiv vK w σ) := by
  apply AddMonoidHomClass.isometry_of_norm
  intro x
  rw [WithAbs.norm_eq_apply_ofAbs, WithAbs.norm_eq_apply_ofAbs]
  exact hσ (WithAbs.equiv w.1 x)
theorem valuationPreservingWithAbsRingEquiv_symm_isometry
    (σ : L ≃ₐ[K] L) (hσ : ∀ x : L, w.1 (σ x) = w.1 x) :
    Isometry (valuationPreservingWithAbsRingEquiv vK w σ).symm := by
  apply AddMonoidHomClass.isometry_of_norm
  intro x
  rw [WithAbs.norm_eq_apply_ofAbs, WithAbs.norm_eq_apply_ofAbs]
  have h := hσ (σ⁻¹ (WithAbs.equiv w.1 x))
  simpa [valuationPreservingWithAbsRingEquiv] using h.symm
 

def valuationPreservingCompletionRingEquiv
    (σ : L ≃ₐ[K] L) (hσ : ∀ x : L, w.1 (σ x) = w.1 x) :
    w.1.Completion ≃+* w.1.Completion :=
  UniformSpace.Completion.mapRingEquiv
    (valuationPreservingWithAbsRingEquiv vK w σ)
    (valuationPreservingWithAbsRingEquiv_isometry vK w σ hσ).continuous
    (valuationPreservingWithAbsRingEquiv_symm_isometry vK w σ hσ).continuous
@[simp] theorem valuationPreservingCompletionRingEquiv_toCompletion
    (σ : L ≃ₐ[K] L) (hσ : ∀ x : L, w.1 (σ x) = w.1 x) (x : L) :
    valuationPreservingCompletionRingEquiv vK w σ hσ
        (AbsoluteValue.toCompletion w.1 x) =
      AbsoluteValue.toCompletion w.1 (σ x) := by
  change
    UniformSpace.Completion.mapRingEquiv
          (valuationPreservingWithAbsRingEquiv vK w σ)
          (valuationPreservingWithAbsRingEquiv_isometry vK w σ hσ).continuous
          (valuationPreservingWithAbsRingEquiv_symm_isometry vK w σ hσ).continuous
        (((WithAbs.equiv w.1).symm x : WithAbs w.1) : w.1.Completion) = _
  rw [UniformSpace.Completion.mapRingEquiv_apply,
    UniformSpace.Completion.map_coe
      (valuationPreservingWithAbsRingEquiv_isometry
        vK w σ hσ).uniformContinuous]
  rfl
 
theorem valuationPreservingCompletionRingEquiv_completionMap
    (σ : L ≃ₐ[K] L) (hσ : ∀ x : L, w.1 (σ x) = w.1 x)
    (x : vK.Completion) :
    valuationPreservingCompletionRingEquiv vK w σ hσ
        (AbsoluteValue.completionMap vK w.1 w.2 x) =
      AbsoluteValue.completionMap vK w.1 w.2 x := by
  have hfun :
      (fun y : vK.Completion =>
        valuationPreservingCompletionRingEquiv vK w σ hσ
          (AbsoluteValue.completionMap vK w.1 w.2 y)) =
        AbsoluteValue.completionMap vK w.1 w.2 := by
    apply UniformSpace.Completion.ext
    · exact UniformSpace.Completion.continuous_map.comp
        (AbsoluteValue.completionMap_isometry vK w.1 w.2).continuous
    · exact (AbsoluteValue.completionMap_isometry vK w.1 w.2).continuous
    · intro y
      have hy : (y : vK.Completion) =
          algebraMap K vK.Completion (WithAbs.equiv vK y) := by
        rw [← AbsoluteValue.toCompletion_eq_algebraMap]
        rfl
      rw [hy, AbsoluteValue.completionMap_coe]
      change
        valuationPreservingCompletionRingEquiv vK w σ hσ
            (AbsoluteValue.toCompletion w.1
              (algebraMap K L (WithAbs.equiv vK y))) =
          AbsoluteValue.toCompletion w.1
            (algebraMap K L (WithAbs.equiv vK y))
      rw [valuationPreservingCompletionRingEquiv_toCompletion, σ.commutes]
  exact congrFun hfun x
 
theorem valuationPreservingCompletionRingEquiv_mem_localization
    (σ : L ≃ₐ[K] L) (hσ : ∀ x : L, w.1 (σ x) = w.1 x)
    {z : w.1.Completion} (hz : z ∈ AbsoluteValue.algebraicLocalization vK w.1 w.2) :
    valuationPreservingCompletionRingEquiv vK w σ hσ z ∈
      AbsoluteValue.algebraicLocalization vK w.1 w.2 := by
  let hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  let : SMul K w.1.Completion := hK.toSMul
  let := AbsoluteValue.completionAlgebra vK w.1 w.2
  let E := AbsoluteValue.algebraicLocalization vK w.1 w.2
  apply IntermediateField.adjoin_induction
      (p := fun x (_ : x ∈ E) =>
        valuationPreservingCompletionRingEquiv vK w σ hσ x ∈ E)
      (s := Set.range (AbsoluteValue.toCompletion w.1))
  · intro x hx
    rcases hx with ⟨a, rfl⟩
    rw [valuationPreservingCompletionRingEquiv_toCompletion]
    exact IntermediateField.subset_adjoin vK.Completion _ ⟨σ a, rfl⟩
  · intro x
    change
      valuationPreservingCompletionRingEquiv vK w σ hσ
          (AbsoluteValue.completionMap vK w.1 w.2 x) ∈ E
    rw [valuationPreservingCompletionRingEquiv_completionMap]
    exact E.algebraMap_mem x
  · intro x y hx hy hx' hy'
    simpa only [map_add] using E.add_mem hx' hy'
  · intro x hx hx'
    simpa only [map_inv₀] using E.inv_mem hx'
  · intro x y hx hy hx' hy'
    simpa only [map_mul] using E.mul_mem hx' hy'
  · exact hz
 
theorem valuationPreservingCompletionRingEquiv_symm_mem_localization
    (σ : L ≃ₐ[K] L) (hσ : ∀ x : L, w.1 (σ x) = w.1 x)
    {z : w.1.Completion} (hz : z ∈ AbsoluteValue.algebraicLocalization vK w.1 w.2) :
    (valuationPreservingCompletionRingEquiv vK w σ hσ).symm z ∈
      AbsoluteValue.algebraicLocalization vK w.1 w.2 := by
  let hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  let : SMul K w.1.Completion := hK.toSMul
  let := AbsoluteValue.completionAlgebra vK w.1 w.2
  let E := AbsoluteValue.algebraicLocalization vK w.1 w.2
  apply IntermediateField.adjoin_induction
      (p := fun x (_ : x ∈ E) =>
        (valuationPreservingCompletionRingEquiv vK w σ hσ).symm x ∈ E)
      (s := Set.range (AbsoluteValue.toCompletion w.1))
  · intro x hx
    rcases hx with ⟨a, rfl⟩
    have hgen := valuationPreservingCompletionRingEquiv_toCompletion
      vK w σ hσ (σ⁻¹ a)
    have hsymm :
        (valuationPreservingCompletionRingEquiv vK w σ hσ).symm
            (AbsoluteValue.toCompletion w.1 a) =
          AbsoluteValue.toCompletion w.1 (σ⁻¹ a) := by
      rw [← (valuationPreservingCompletionRingEquiv vK w σ hσ).injective.eq_iff,
        (valuationPreservingCompletionRingEquiv vK w σ hσ).apply_symm_apply]
      simpa using hgen.symm
    rw [hsymm]
    exact IntermediateField.subset_adjoin vK.Completion _ ⟨σ⁻¹ a, rfl⟩
  · intro x
    have hbase := valuationPreservingCompletionRingEquiv_completionMap
      vK w σ hσ x
    have hsymm :
        (valuationPreservingCompletionRingEquiv vK w σ hσ).symm
            (AbsoluteValue.completionMap vK w.1 w.2 x) =
          AbsoluteValue.completionMap vK w.1 w.2 x := by
      rw [← (valuationPreservingCompletionRingEquiv vK w σ hσ).injective.eq_iff,
        (valuationPreservingCompletionRingEquiv vK w σ hσ).apply_symm_apply]
      exact hbase.symm
    change
      (valuationPreservingCompletionRingEquiv vK w σ hσ).symm
          (AbsoluteValue.completionMap vK w.1 w.2 x) ∈ E
    rw [hsymm]
    exact E.algebraMap_mem x
  · intro x y hx hy hx' hy'
    simpa only [map_add] using E.add_mem hx' hy'
  · intro x hx hx'
    simpa only [map_inv₀] using E.inv_mem hx'
  · intro x y hx hy hx' hy'
    simpa only [map_mul] using E.mul_mem hx' hy'
  · exact hz
 

def valuationPreservingLocalizationAlgEquiv
    (σ : L ≃ₐ[K] L) (hσ : ∀ x : L, w.1 (σ x) = w.1 x) :
    letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
    letI : SMul K w.1.Completion := hK.toSMul
    letI := AbsoluteValue.completionAlgebra vK w.1 w.2
    AbsoluteValue.algebraicLocalization vK w.1 w.2 ≃ₐ[vK.Completion]
      AbsoluteValue.algebraicLocalization vK w.1 w.2 := by
  letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  letI : SMul K w.1.Completion := hK.toSMul
  letI := AbsoluteValue.completionAlgebra vK w.1 w.2
  let E := AbsoluteValue.algebraicLocalization vK w.1 w.2
  let e := valuationPreservingCompletionRingEquiv vK w σ hσ
  exact
    { toFun := fun z =>
        ⟨e z, valuationPreservingCompletionRingEquiv_mem_localization
          vK w σ hσ z.property⟩
      invFun := fun z =>
        ⟨e.symm z,
          valuationPreservingCompletionRingEquiv_symm_mem_localization
            vK w σ hσ z.property⟩
      left_inv := fun z => by
        apply Subtype.ext
        exact e.symm_apply_apply z
      right_inv := fun z => by
        apply Subtype.ext
        exact e.apply_symm_apply z
      map_mul' := fun x y => by
        apply Subtype.ext
        exact e.map_mul x y
      map_add' := fun x y => by
        apply Subtype.ext
        exact e.map_add x y
      commutes' := fun x => by
        apply Subtype.ext
        exact valuationPreservingCompletionRingEquiv_completionMap
          vK w σ hσ x }
@[simp] theorem valuationPreservingLocalizationAlgEquiv_toLocalization
    (σ : L ≃ₐ[K] L) (hσ : ∀ x : L, w.1 (σ x) = w.1 x) (x : L) :
    letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
    letI : SMul K w.1.Completion := hK.toSMul
    letI := AbsoluteValue.completionAlgebra vK w.1 w.2
    valuationPreservingLocalizationAlgEquiv vK w σ hσ
        (AbsoluteValue.toAlgebraicLocalization vK w.1 w.2 x) =
      AbsoluteValue.toAlgebraicLocalization vK w.1 w.2 (σ x) := by
  let hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  let : SMul K w.1.Completion := hK.toSMul
  let := AbsoluteValue.completionAlgebra vK w.1 w.2
  apply Subtype.ext
  exact valuationPreservingCompletionRingEquiv_toCompletion vK w σ hσ x
end LocalizationLift
section DecompositionEquiv
variable (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
  (w : AbsoluteValueExtension vK L)
include hvK
 

theorem absoluteValueDecompositionGroup_preserves_absoluteValue
    (σ : absoluteValueDecompositionGroup K w.1) (x : L) :
    w.1 ((σ : L ≃ₐ[K] L) x) = w.1 x := by
  have hσ :=
    (mem_absoluteValueDecompositionGroup_iff_extensionConjugate_eq
      vK hvK w (σ : L ≃ₐ[K] L)).mp σ.property
  have hx := congrArg (fun q : AbsoluteValueExtension vK L => q.1 x) hσ
  simpa [absoluteValueExtensionConjugate,
    absoluteValueConjugate, AbsoluteValue.comp] using hx
omit hvK
variable [IsGalois K L]
include hvK
 

theorem localizationAbsoluteValue_algEquiv
    (τ :
      letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
      letI : SMul K w.1.Completion := hK.toSMul
      letI := AbsoluteValue.completionAlgebra vK w.1 w.2
      AbsoluteValue.algebraicLocalization vK w.1 w.2 ≃ₐ[vK.Completion]
        AbsoluteValue.algebraicLocalization vK w.1 w.2)
    (x :
      letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
      letI : SMul K w.1.Completion := hK.toSMul
      letI := AbsoluteValue.completionAlgebra vK w.1 w.2
      AbsoluteValue.algebraicLocalization vK w.1 w.2) :
    letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
    letI : SMul K w.1.Completion := hK.toSMul
    letI := AbsoluteValue.completionAlgebra vK w.1 w.2
    AbsoluteValue.algebraicLocalizationAbsoluteValue vK w.1 w.2 (τ x) =
      AbsoluteValue.algebraicLocalizationAbsoluteValue vK w.1 w.2 x := by
  let hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  let : SMul K w.1.Completion := hK.toSMul
  let := AbsoluteValue.completionAlgebra vK w.1 w.2
  let E := AbsoluteValue.algebraicLocalization vK w.1 w.2
  let vhat := AbsoluteValue.completionAbsoluteValue vK
  let wloc := AbsoluteValue.algebraicLocalizationAbsoluteValue vK w.1 w.2
  let : Algebra.IsAlgebraic vK.Completion E :=
    AbsoluteValue.algebraicLocalization_isAlgebraic vK w.1 w.2
  let R := AbsoluteValue.uniqueAlgebraicExtension
    (K := vK.Completion) (L := E) vhat
    (AbsoluteValue.completionAbsoluteValue_complete vK)
    (AbsoluteValue.completionAbsoluteValue_isNontrivial vK hvK)
  have hwloc : wloc = R.extension := by
    apply R.unique
    intro y
    exact AbsoluteValue.algebraicLocalizationAbsoluteValue_extends vK w.1 w.2 y
  let wconj : AbsoluteValue E ℝ :=
    wloc.comp (f := τ.toRingEquiv.toRingHom) τ.injective
  have hwconj : wconj = R.extension := by
    apply R.unique
    intro y
    change wloc (τ (algebraMap vK.Completion E y)) = vhat y
    rw [τ.commutes]
    exact AbsoluteValue.algebraicLocalizationAbsoluteValue_extends vK w.1 w.2 y
  have h := congrArg (fun q : AbsoluteValue E ℝ => q x)
    (hwconj.trans hwloc.symm)
  exact h
omit hvK
 

def localizationAlgEquivRestrict
    (τ :
      letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
      letI : SMul K w.1.Completion := hK.toSMul
      letI := AbsoluteValue.completionAlgebra vK w.1 w.2
      AbsoluteValue.algebraicLocalization vK w.1 w.2 ≃ₐ[vK.Completion]
        AbsoluteValue.algebraicLocalization vK w.1 w.2) : L ≃ₐ[K] L := by
  letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  letI : SMul K w.1.Completion := hK.toSMul
  letI := AbsoluteValue.completionAlgebra vK w.1 w.2
  let E := AbsoluteValue.algebraicLocalization vK w.1 w.2
  let i : L →+* E := AbsoluteValue.toAlgebraicLocalization vK w.1 w.2
  letI : Algebra K E := (i.comp (algebraMap K L)).toAlgebra
  let iAlg : L →ₐ[K] E :=
    { __ := i
      commutes' := fun x => by
        change i (algebraMap K L x) = (i.comp (algebraMap K L)) x
        rfl }
  letI : Algebra L E := i.toAlgebra
  letI : IsScalarTower K L E :=
    IsScalarTower.of_algebraMap_eq' rfl
  let τK : E ≃ₐ[K] E :=
    { __ := τ.toRingEquiv
      commutes' := fun x => by
        change τ (i (algebraMap K L x)) = i (algebraMap K L x)
        rw [AbsoluteValue.toAlgebraicLocalization_algebraMap, τ.commutes] }
  exact Normal.algHomEquivAut K E L (τK.toAlgHom.comp iAlg)
 

theorem localizationAlgEquivRestrict_toLocalization
    (τ :
      letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
      letI : SMul K w.1.Completion := hK.toSMul
      letI := AbsoluteValue.completionAlgebra vK w.1 w.2
      AbsoluteValue.algebraicLocalization vK w.1 w.2 ≃ₐ[vK.Completion]
        AbsoluteValue.algebraicLocalization vK w.1 w.2)
    (x : L) :
    letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
    letI : SMul K w.1.Completion := hK.toSMul
    letI := AbsoluteValue.completionAlgebra vK w.1 w.2
    AbsoluteValue.toAlgebraicLocalization vK w.1 w.2
        (localizationAlgEquivRestrict vK w τ x) =
      τ (AbsoluteValue.toAlgebraicLocalization vK w.1 w.2 x) := by
  let hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  let : SMul K w.1.Completion := hK.toSMul
  let := AbsoluteValue.completionAlgebra vK w.1 w.2
  let E := AbsoluteValue.algebraicLocalization vK w.1 w.2
  let i : L →+* E := AbsoluteValue.toAlgebraicLocalization vK w.1 w.2
  let : Algebra K E := (i.comp (algebraMap K L)).toAlgebra
  let iAlg : L →ₐ[K] E :=
    { __ := i
      commutes' := fun x => by
        change i (algebraMap K L x) = (i.comp (algebraMap K L)) x
        rfl }
  let : Algebra L E := i.toAlgebra
  let : IsScalarTower K L E :=
    IsScalarTower.of_algebraMap_eq' rfl
  let τK : E ≃ₐ[K] E :=
    { __ := τ.toRingEquiv
      commutes' := fun y => by
        change τ (i (algebraMap K L y)) = i (algebraMap K L y)
        rw [AbsoluteValue.toAlgebraicLocalization_algebraMap, τ.commutes] }
  change i (Normal.algHomEquivAut K E L (τK.toAlgHom.comp iAlg) x) =
    τ (i x)
  simpa [iAlg, τK, AlgHom.restrictNormal', RingHom.algebraMap_toAlgebra] using
    ((τK.toAlgHom.comp iAlg).restrictNormal_commutes L x)
 
def localizationToDecompositionGroup
    (τ :
      letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
      letI : SMul K w.1.Completion := hK.toSMul
      letI := AbsoluteValue.completionAlgebra vK w.1 w.2
      AbsoluteValue.algebraicLocalization vK w.1 w.2 ≃ₐ[vK.Completion]
        AbsoluteValue.algebraicLocalization vK w.1 w.2) :
    absoluteValueDecompositionGroup K w.1 := by
  letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  letI : SMul K w.1.Completion := hK.toSMul
  letI := AbsoluteValue.completionAlgebra vK w.1 w.2
  let σ := localizationAlgEquivRestrict vK w τ
  refine ⟨σ, ?_⟩
  intro x
  have habs : w.1 (σ x) = w.1 x := by
    calc
      w.1 (σ x) = AbsoluteValue.algebraicLocalizationAbsoluteValue vK w.1 w.2
          (AbsoluteValue.toAlgebraicLocalization vK w.1 w.2 (σ x)) :=
        (AbsoluteValue.algebraicLocalizationAbsoluteValue_toAlgebraicLocalization vK w.1 w.2 (σ x)).symm
      _ = AbsoluteValue.algebraicLocalizationAbsoluteValue vK w.1 w.2
          (τ (AbsoluteValue.toAlgebraicLocalization vK w.1 w.2 x)) := by
        rw [localizationAlgEquivRestrict_toLocalization]
      _ = AbsoluteValue.algebraicLocalizationAbsoluteValue vK w.1 w.2
          (AbsoluteValue.toAlgebraicLocalization vK w.1 w.2 x) :=
        localizationAbsoluteValue_algEquiv vK hvK w τ _
      _ = w.1 x :=
        AbsoluteValue.algebraicLocalizationAbsoluteValue_toAlgebraicLocalization vK w.1 w.2 x
  rw [habs]
include hvK
 

def decompositionGroupToLocalization
    (σ : absoluteValueDecompositionGroup K w.1) :
    letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
    letI : SMul K w.1.Completion := hK.toSMul
    letI := AbsoluteValue.completionAlgebra vK w.1 w.2
    AbsoluteValue.algebraicLocalization vK w.1 w.2 ≃ₐ[vK.Completion]
      AbsoluteValue.algebraicLocalization vK w.1 w.2 :=
  valuationPreservingLocalizationAlgEquiv vK w (σ : L ≃ₐ[K] L)
    (absoluteValueDecompositionGroup_preserves_absoluteValue vK hvK w σ)
omit [IsGalois K L] in
@[simp] theorem decompositionGroupToLocalization_toLocalization
    (σ : absoluteValueDecompositionGroup K w.1) (x : L) :
    letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
    letI : SMul K w.1.Completion := hK.toSMul
    letI := AbsoluteValue.completionAlgebra vK w.1 w.2
    decompositionGroupToLocalization vK hvK w σ
        (AbsoluteValue.toAlgebraicLocalization vK w.1 w.2 x) =
      AbsoluteValue.toAlgebraicLocalization vK w.1 w.2 ((σ : L ≃ₐ[K] L) x) :=
  valuationPreservingLocalizationAlgEquiv_toLocalization vK w
    (σ : L ≃ₐ[K] L)
    (absoluteValueDecompositionGroup_preserves_absoluteValue vK hvK w σ) x
omit hvK
include hvK
 

theorem localizationToDecompositionGroup_decompositionGroupToLocalization
    (σ : absoluteValueDecompositionGroup K w.1) :
    localizationToDecompositionGroup vK hvK w
        (decompositionGroupToLocalization vK hvK w σ) = σ := by
  apply Subtype.ext
  apply AlgEquiv.ext
  intro x
  let hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  let : SMul K w.1.Completion := hK.toSMul
  let := AbsoluteValue.completionAlgebra vK w.1 w.2
  let i := AbsoluteValue.toAlgebraicLocalization vK w.1 w.2
  apply i.injective
  calc
    i ((localizationToDecompositionGroup vK hvK w
          (decompositionGroupToLocalization vK hvK w σ) :
        L ≃ₐ[K] L) x) =
        decompositionGroupToLocalization vK hvK w σ (i x) :=
      localizationAlgEquivRestrict_toLocalization vK w
        (decompositionGroupToLocalization vK hvK w σ) x
    _ = i ((σ : L ≃ₐ[K] L) x) :=
      decompositionGroupToLocalization_toLocalization vK hvK w σ x
 
theorem decompositionGroupToLocalization_localizationToDecompositionGroup
    (τ :
      letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
      letI : SMul K w.1.Completion := hK.toSMul
      letI := AbsoluteValue.completionAlgebra vK w.1 w.2
      AbsoluteValue.algebraicLocalization vK w.1 w.2 ≃ₐ[vK.Completion]
        AbsoluteValue.algebraicLocalization vK w.1 w.2) :
    letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
    letI : SMul K w.1.Completion := hK.toSMul
    letI := AbsoluteValue.completionAlgebra vK w.1 w.2
    decompositionGroupToLocalization vK hvK w
        (localizationToDecompositionGroup vK hvK w τ) = τ := by
  let hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  let : SMul K w.1.Completion := hK.toSMul
  let := AbsoluteValue.completionAlgebra vK w.1 w.2
  let i := AbsoluteValue.toAlgebraicLocalization vK w.1 w.2
  let ρ := decompositionGroupToLocalization vK hvK w
    (localizationToDecompositionGroup vK hvK w τ)
  have hρ : ρ.toAlgHom = τ.toAlgHom := by
    apply IntermediateField.adjoin_algHom_ext
    intro z hz
    rcases hz with ⟨x, rfl⟩
    change ρ (i x) = τ (i x)
    rw [decompositionGroupToLocalization_toLocalization]
    change i (localizationAlgEquivRestrict vK w τ x) = τ (i x)
    exact localizationAlgEquivRestrict_toLocalization vK w τ x
  exact AlgEquiv.ext fun x => DFunLike.congr_fun hρ x
omit hvK
include hvK
omit [IsGalois K L] in
 
theorem decompositionGroupToLocalization_mul
    (σ τ : absoluteValueDecompositionGroup K w.1) :
    letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
    letI : SMul K w.1.Completion := hK.toSMul
    letI := AbsoluteValue.completionAlgebra vK w.1 w.2
    decompositionGroupToLocalization vK hvK w (σ * τ) =
      decompositionGroupToLocalization vK hvK w σ *
        decompositionGroupToLocalization vK hvK w τ := by
  let hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  let : SMul K w.1.Completion := hK.toSMul
  let := AbsoluteValue.completionAlgebra vK w.1 w.2
  let i := AbsoluteValue.toAlgebraicLocalization vK w.1 w.2
  let ρL := decompositionGroupToLocalization vK hvK w (σ * τ)
  let ρR := decompositionGroupToLocalization vK hvK w σ *
    decompositionGroupToLocalization vK hvK w τ
  have hρ : ρL.toAlgHom = ρR.toAlgHom := by
    apply IntermediateField.adjoin_algHom_ext
    intro z hz
    rcases hz with ⟨x, rfl⟩
    change ρL (i x) = ρR (i x)
    calc
      ρL (i x) = i (((σ * τ : absoluteValueDecompositionGroup K w.1) :
          L ≃ₐ[K] L) x) :=
        decompositionGroupToLocalization_toLocalization vK hvK w (σ * τ) x
      _ = i ((σ : L ≃ₐ[K] L) ((τ : L ≃ₐ[K] L) x)) := rfl
      _ = decompositionGroupToLocalization vK hvK w σ
          (i ((τ : L ≃ₐ[K] L) x)) :=
        (decompositionGroupToLocalization_toLocalization
          vK hvK w σ ((τ : L ≃ₐ[K] L) x)).symm
      _ = decompositionGroupToLocalization vK hvK w σ
          (decompositionGroupToLocalization vK hvK w τ (i x)) := by
        exact congrArg (decompositionGroupToLocalization vK hvK w σ)
          (decompositionGroupToLocalization_toLocalization
            vK hvK w τ x).symm
      _ = ρR (i x) := rfl
  exact AlgEquiv.ext fun x => DFunLike.congr_fun hρ x
omit hvK
include hvK
 


def decompositionGroupEquivAlgebraicLocalizationAut :
    absoluteValueDecompositionGroup K w.1 ≃*
      (letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
       letI : SMul K w.1.Completion := hK.toSMul
       letI := AbsoluteValue.completionAlgebra vK w.1 w.2
       AbsoluteValue.algebraicLocalization vK w.1 w.2 ≃ₐ[vK.Completion]
         AbsoluteValue.algebraicLocalization vK w.1 w.2) where
  toFun := decompositionGroupToLocalization vK hvK w
  invFun := localizationToDecompositionGroup vK hvK w
  left_inv := localizationToDecompositionGroup_decompositionGroupToLocalization
    vK hvK w
  right_inv :=
    decompositionGroupToLocalization_localizationToDecompositionGroup vK hvK w
  map_mul' := decompositionGroupToLocalization_mul vK hvK w
@[simp] theorem localizationRamificationGroups_decompositionGroupEquiv_toLocalization
    (σ : absoluteValueDecompositionGroup K w.1) (x : L) :
    letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
    letI : SMul K w.1.Completion := hK.toSMul
    letI := AbsoluteValue.completionAlgebra vK w.1 w.2
    decompositionGroupEquivAlgebraicLocalizationAut vK hvK w σ
        (AbsoluteValue.toAlgebraicLocalization vK w.1 w.2 x) =
      AbsoluteValue.toAlgebraicLocalization vK w.1 w.2 ((σ : L ≃ₐ[K] L) x) :=
  decompositionGroupToLocalization_toLocalization vK hvK w σ x
omit hvK
end DecompositionEquiv
end HilbertRamification
end
end

/- ValuedFieldTheory.Valuation.Completion.ExtensionFactorClassification -/
section
noncomputable section
open Polynomial
open scoped Topology
namespace AlgebraicNumberTheory
namespace Valuations
universe u v
 
abbrev completionExtensionFactor_completionPolynomial
    {K : Type u} [Field K] (vK : AbsoluteValue K ℝ) (f : K[X]) :
    vK.Completion[X] :=
  f.map (algebraMap K vK.Completion)
 


noncomputable def pullbackAbsoluteValueExtension
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (τ : L →ₐ[K] absoluteValueExtension_algebraicCompletionClosure vK) :
    AbsoluteValueExtension vK L :=
  ⟨absoluteValueExtension_pullback vK hvK τ,
    absoluteValueExtension_pullback_extends vK hvK τ⟩
end Valuations
end AlgebraicNumberTheory
end
end

/- ValuedFieldTheory.Ramification.HilbertRamification.DecompositionFieldLocalization -/
section
noncomputable section
universe u v
namespace HilbertRamification
open AlgebraicNumberTheory.Valuations
variable {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
section LocalizationGalois
variable [IsGalois K L]
variable (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
  (w : AbsoluteValueExtension vK L)
local instance proposition98CompletionBaseAlgebra : Algebra K w.1.Completion :=
  AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
local instance proposition98CompletionBaseSMul : SMul K w.1.Completion :=
  (AbsoluteValue.extensionCompletionAlgebra (K := K) w.1).toSMul
local instance proposition98CompletionAlgebra : Algebra vK.Completion w.1.Completion :=
  AbsoluteValue.completionAlgebra vK w.1 w.2
private abbrev localization : IntermediateField vK.Completion w.1.Completion :=
  AbsoluteValue.algebraicLocalization vK w.1 w.2
private abbrev toLocalization : L →+* localization vK w :=
  AbsoluteValue.toAlgebraicLocalization vK w.1 w.2
local instance proposition98LocalizationBaseAlgebra : Algebra K (localization vK w) :=
  ((algebraMap vK.Completion (localization vK w)).comp
    (algebraMap K vK.Completion)).toAlgebra
local instance proposition98LocalizationScalarTower :
    IsScalarTower K vK.Completion (localization vK w) :=
  IsScalarTower.of_algebraMap_eq' (by
    ext x
    rfl)
 

def decompositionField_toLocalizationAlgHom :
    L →ₐ[K] localization vK w where
  __ := toLocalization vK w
  commutes' x := AbsoluteValue.toAlgebraicLocalization_algebraMap vK w.1 w.2 x
omit [IsGalois K L] in
 

theorem decompositionField_localization_adjoin_range_eq_top :
    IntermediateField.adjoin vK.Completion
      (Set.range (toLocalization vK w)) = ⊤ := by
  let E := localization vK w
  apply IntermediateField.lift_injective E
  rw [IntermediateField.lift_adjoin, IntermediateField.lift_top]
  change IntermediateField.adjoin vK.Completion
      (Subtype.val '' Set.range (toLocalization vK w)) =
    AbsoluteValue.algebraicLocalization vK w.1 w.2
  congr 1
  ext z
  constructor
  · rintro ⟨_, ⟨x, rfl⟩, rfl⟩
    exact ⟨x, rfl⟩
  · rintro ⟨x, rfl⟩
    exact ⟨toLocalization vK w x, ⟨x, rfl⟩, rfl⟩
omit hvK in
 
theorem decompositionField_toLocalization_isSeparable (x : L) :
    IsSeparable vK.Completion (toLocalization vK w x) := by
  have hx : IsSeparable K
      (decompositionField_toLocalizationAlgHom vK w x) :=
    (Algebra.IsSeparable.isSeparable K x).map
      (decompositionField_toLocalizationAlgHom vK w)
      (decompositionField_toLocalizationAlgHom vK w).injective
  exact IsSeparable.tower_top vK.Completion hx
omit hvK in
 

theorem decompositionField_toLocalization_minpoly_splits (x : L) :
    ((minpoly vK.Completion (toLocalization vK w x)).map
      (algebraMap vK.Completion (localization vK w))).Splits := by
  let i := decompositionField_toLocalizationAlgHom vK w
  have hxint : IsIntegral K x := Algebra.IsIntegral.isIntegral x
  have hsK : ((minpoly K x).map
      (algebraMap K (localization vK w))).Splits := by
    have hi : i.toRingHom.comp (algebraMap K L) =
        algebraMap K (localization vK w) := i.comp_algebraMap
    have hs := (Normal.splits (F := K) (K := L) inferInstance x).map
      i.toRingHom
    simpa only [Polynomial.map_map, hi] using hs
  have hsTower : (((minpoly K x).map (algebraMap K vK.Completion)).map
      (algebraMap vK.Completion (localization vK w))).Splits := by
    simpa only [Polynomial.map_map,
      IsScalarTower.algebraMap_eq K vK.Completion (localization vK w)] using hsK
  have hdvd : minpoly vK.Completion (toLocalization vK w x) ∣
      (minpoly K x).map (algebraMap K vK.Completion) := by
    have h := minpoly.dvd_map_of_isScalarTower K vK.Completion
      (toLocalization vK w x)
    have hmin : minpoly K (toLocalization vK w x) = minpoly K x :=
      minpoly.algHom_eq i i.injective x
    rwa [hmin] at h
  exact hsTower.of_dvd
    (Polynomial.map_ne_zero
      (Polynomial.map_ne_zero (minpoly.ne_zero hxint)))
    ((Polynomial.map_dvd_map' _).mpr hdvd)
omit hvK in
 

theorem decompositionField_localization_normal :
    Normal vK.Completion (localization vK w) := by
  let : Algebra.IsAlgebraic vK.Completion (localization vK w) :=
    AbsoluteValue.algebraicLocalization_isAlgebraic vK w.1 w.2
  rw [normal_iff]
  intro z
  refine ⟨Algebra.IsIntegral.isIntegral z, ?_⟩
  apply IntermediateField.splits_of_mem_adjoin
      (F := vK.Completion) (K := localization vK w)
      (L := localization vK w)
      (S := Set.range (toLocalization vK w))
  · intro y hy
    rcases hy with ⟨x, rfl⟩
    exact ⟨(decompositionField_toLocalization_isSeparable vK w x).isIntegral,
      decompositionField_toLocalization_minpoly_splits vK w x⟩
  · rw [decompositionField_localization_adjoin_range_eq_top vK w]
    trivial
omit hvK in
 

theorem decompositionField_localization_separable :
    Algebra.IsSeparable vK.Completion (localization vK w) := by
  let S := Set.range (toLocalization vK w)
  have hS : Algebra.IsSeparable vK.Completion
      (IntermediateField.adjoin vK.Completion S) :=
    (IntermediateField.isSeparable_adjoin_iff_isSeparable
      (F := vK.Completion) (E := localization vK w)).mpr fun y hy => by
      rcases hy with ⟨x, rfl⟩
      exact decompositionField_toLocalization_isSeparable vK w x
  let : Algebra.IsSeparable vK.Completion
      (IntermediateField.adjoin vK.Completion S) := hS
  refine ⟨fun z => ?_⟩
  have hz : z ∈ IntermediateField.adjoin vK.Completion S := by
    rw [decompositionField_localization_adjoin_range_eq_top vK w]
    trivial
  exact IntermediateField.isSeparable_of_mem_isSeparable vK.Completion
    (localization vK w) hz
omit hvK in
 

theorem algebraicLocalization_isGalois :
    IsGalois vK.Completion (localization vK w) :=
  isGalois_iff.mpr
    ⟨decompositionField_localization_separable vK w,
      decompositionField_localization_normal vK w⟩
include hvK
omit hvK
include hvK
omit hvK
include hvK
omit hvK
end LocalizationGalois
end HilbertRamification
end
end

/- ClassFieldTheory.LocalClassFieldTheory.ClassFormation.LocalizedCompletionCohomology.Algebra -/
section
open AlgebraicNumberTheory.Valuations
open HilbertRamification
open scoped TensorProduct
noncomputable section
namespace LocalClassFieldTheory
universe u v
variable {K : Type u} {L : Type v}
    [Field K] [Field L] [Algebra K L]
 


noncomputable abbrev localizedCompletionBaseAlgebra
    (vK : AbsoluteValue K ℝ)
    (w : AbsoluteValueExtension vK L) :
    Algebra vK.Completion (LocalizedCompletion vK w) := by
  letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  letI : SMul K w.1.Completion := hK.toSMul
  letI : Algebra vK.Completion w.1.Completion :=
    AbsoluteValue.completionAlgebra vK w.1 w.2
  exact inferInstance
 

theorem localizedCompletionIsGalois
    [IsGalois K L]
    (vK : AbsoluteValue K ℝ)
    (w : AbsoluteValueExtension vK L) :
    letI : Algebra vK.Completion (LocalizedCompletion vK w) :=
      localizedCompletionBaseAlgebra vK w
    IsGalois vK.Completion (LocalizedCompletion vK w) := by
  let _ := localizedCompletionBaseAlgebra vK w
  exact HilbertRamification.algebraicLocalization_isGalois vK w
 

noncomputable abbrev localizedCompletionGlobalAlgebra
    (vK : AbsoluteValue K ℝ)
    (w : AbsoluteValueExtension vK L) :
    letI : Algebra vK.Completion (LocalizedCompletion vK w) :=
      localizedCompletionBaseAlgebra vK w
    Algebra K (LocalizedCompletion vK w) := by
  letI : Algebra vK.Completion (LocalizedCompletion vK w) :=
    localizedCompletionBaseAlgebra vK w
  exact
    ((algebraMap vK.Completion
        (LocalizedCompletion vK w)).comp
      (algebraMap K vK.Completion)).toAlgebra
theorem localizedCompletionIsScalarTower
    (vK : AbsoluteValue K ℝ)
    (w : AbsoluteValueExtension vK L) :
    letI : Algebra vK.Completion (LocalizedCompletion vK w) :=
      localizedCompletionBaseAlgebra vK w
    letI := localizedCompletionGlobalAlgebra vK w
    IsScalarTower K vK.Completion
      (LocalizedCompletion vK w) := by
  let _ : Algebra vK.Completion (LocalizedCompletion vK w) :=
    localizedCompletionBaseAlgebra vK w
  let _ := localizedCompletionGlobalAlgebra vK w
  exact IsScalarTower.of_algebraMap_eq' rfl
variable [IsGalois K L]
 


theorem localizedCompletion_baseField_comap_eq_fixedField_decompositionGroup
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (w : AbsoluteValueExtension vK L) :
    letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
    letI : SMul K w.1.Completion := hK.toSMul
    letI : Algebra vK.Completion w.1.Completion :=
      AbsoluteValue.completionAlgebra vK w.1 w.2
    letI := localizedCompletionGlobalAlgebra vK w
    letI := localizedCompletionIsScalarTower vK w
    ((algebraMap vK.Completion
        (LocalizedCompletion vK w)).fieldRange).comap
      (AbsoluteValue.toAlgebraicLocalization vK w.1 w.2) =
        (IntermediateField.fixedField
          (absoluteValueDecompositionGroup K w.1)).toSubfield := by
  let _ := localizedCompletionBaseAlgebra vK w
  let _ := localizedCompletionGlobalAlgebra vK w
  let _ := localizedCompletionIsScalarTower vK w
  let _ : IsGalois vK.Completion
      (LocalizedCompletion vK w) :=
    localizedCompletionIsGalois vK w
  ext x
  change
    AbsoluteValue.toAlgebraicLocalization vK w.1 w.2 x ∈
        Set.range
          (algebraMap vK.Completion
            (LocalizedCompletion vK w)) ↔
      x ∈ IntermediateField.fixedField
        (absoluteValueDecompositionGroup K w.1)
  rw [InfiniteGalois.mem_range_algebraMap_iff_fixed,
    IntermediateField.mem_fixedField_iff]
  constructor
  · intro hfixed σ hσ
    let δ : absoluteValueDecompositionGroup K w.1 := ⟨σ, hσ⟩
    apply
      (AbsoluteValue.toAlgebraicLocalization
        vK w.1 w.2).injective
    calc
      AbsoluteValue.toAlgebraicLocalization
          vK w.1 w.2 (σ x) =
        decompositionGroupEquivAlgebraicLocalizationAut
            vK hvK w δ
          (AbsoluteValue.toAlgebraicLocalization
            vK w.1 w.2 x) :=
        (localizationRamificationGroups_decompositionGroupEquiv_toLocalization
          vK hvK w δ x).symm
      _ = AbsoluteValue.toAlgebraicLocalization
            vK w.1 w.2 x :=
        hfixed _
  · intro hZ τ
    let δ : absoluteValueDecompositionGroup K w.1 :=
      (decompositionGroupEquivAlgebraicLocalizationAut
        vK hvK w).symm τ
    have hδ : ((δ : L ≃ₐ[K] L) x) = x :=
      hZ δ δ.property
    calc
      τ (AbsoluteValue.toAlgebraicLocalization
          vK w.1 w.2 x) =
        decompositionGroupEquivAlgebraicLocalizationAut
            vK hvK w δ
          (AbsoluteValue.toAlgebraicLocalization
            vK w.1 w.2 x) := by
        rw [MulEquiv.apply_symm_apply]
      _ = AbsoluteValue.toAlgebraicLocalization
            vK w.1 w.2 ((δ : L ≃ₐ[K] L) x) :=
        localizationRamificationGroups_decompositionGroupEquiv_toLocalization
          vK hvK w δ x
      _ = AbsoluteValue.toAlgebraicLocalization
            vK w.1 w.2 x :=
        congrArg
          (AbsoluteValue.toAlgebraicLocalization
            vK w.1 w.2) hδ
end LocalClassFieldTheory
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.RayClass.Ideal -/
section
open scoped NumberField WithZero Classical
open NumberField IsDedekindDomain
noncomputable section
variable {K : Type*} [Field K] [NumberField K]
namespace RayClass
theorem adicAbv_isNontrivial
    (v : HeightOneSpectrum (𝓞 K)) :
    (NumberField.HeightOneSpectrum.adicAbv K v).IsNontrivial := by
  obtain ⟨x, hxv, hx0⟩ :=
    Submodule.exists_mem_ne_zero_of_ne_bot v.ne_bot
  refine ⟨algebraMap (𝓞 K) K x, ?_, ?_⟩
  · exact (FaithfulSMul.algebraMap_eq_zero_iff (𝓞 K) K).not.mpr hx0
  · apply ne_of_lt
    rw [← FinitePlace.norm_embedding]
    exact (FinitePlace.norm_lt_one_iff_mem (K := K) v x).2 hxv
end RayClass
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.Idele.NormApproximation.FinitePlaces -/
section
open scoped NumberField Classical NNReal
open NumberField IsDedekindDomain
noncomputable section
open AlgebraicNumberTheory.Valuations
variable {K L : Type}
    [Field K] [NumberField K]
    [Field L] [Algebra K L]
    [FiniteDimensional K L] [IsGalois K L]
 

noncomputable def finitePlaceCompletionBaseMap
    (v : HeightOneSpectrum (𝓞 K)) :
    WithAbs (NumberField.HeightOneSpectrum.adicAbv K v) →+*
      v.adicCompletion K :=
  (FinitePlace.embedding v).comp
    (WithAbs.equiv
      (NumberField.HeightOneSpectrum.adicAbv K v)).toRingHom
@[simp]
theorem finitePlaceCompletionBaseMap_apply
    (v : HeightOneSpectrum (𝓞 K))
    (x : WithAbs
      (NumberField.HeightOneSpectrum.adicAbv K v)) :
    finitePlaceCompletionBaseMap v x =
      FinitePlace.embedding v
        (WithAbs.equiv
          (NumberField.HeightOneSpectrum.adicAbv K v) x) :=
  rfl
theorem finitePlaceCompletionBaseMap_norm
    (v : HeightOneSpectrum (𝓞 K))
    (x : WithAbs
      (NumberField.HeightOneSpectrum.adicAbv K v)) :
    ‖finitePlaceCompletionBaseMap v x‖ = ‖x‖ := by
  rw [finitePlaceCompletionBaseMap_apply,
    FinitePlace.norm_embedding]
  rfl
 
theorem finitePlaceCompletionBaseMap_isometry
    (v : HeightOneSpectrum (𝓞 K)) :
    Isometry (finitePlaceCompletionBaseMap v) :=
  AddMonoidHomClass.isometry_of_norm _
    (finitePlaceCompletionBaseMap_norm v)
 
noncomputable def finitePlaceCompletionRingHom
    (v : HeightOneSpectrum (𝓞 K)) :
    (NumberField.HeightOneSpectrum.adicAbv K v).Completion →+*
      v.adicCompletion K :=
  (finitePlaceCompletionBaseMap_isometry v).extensionHom
@[simp]
theorem finitePlaceCompletionRingHom_coe
    (v : HeightOneSpectrum (𝓞 K))
    (x : WithAbs
      (NumberField.HeightOneSpectrum.adicAbv K v)) :
    finitePlaceCompletionRingHom v
        (x :
          (NumberField.HeightOneSpectrum.adicAbv K v).Completion) =
      finitePlaceCompletionBaseMap v x :=
  (finitePlaceCompletionBaseMap_isometry v).extensionHom_coe x
theorem finitePlaceCompletionRingHom_isometry
    (v : HeightOneSpectrum (𝓞 K)) :
    Isometry (finitePlaceCompletionRingHom v) :=
  (finitePlaceCompletionBaseMap_isometry v).completion_extension
 

theorem finitePlaceCompletionRingHom_surjective
    (v : HeightOneSpectrum (𝓞 K)) :
    Function.Surjective (finitePlaceCompletionRingHom v) := by
  let f := finitePlaceCompletionRingHom v
  have hrangeClosed : IsClosed (Set.range f) :=
    (finitePlaceCompletionRingHom_isometry v).isClosedEmbedding.isClosed_range
  have hdense :
      DenseRange (algebraMap K (v.adicCompletion K)) :=
    v.denseRange_algebraMap K
  have hrange :
      Set.range (algebraMap K (v.adicCompletion K)) ⊆
        Set.range f := by
    rintro _ ⟨x, rfl⟩
    let x' : WithAbs
        (NumberField.HeightOneSpectrum.adicAbv K v) :=
      (WithAbs.equiv
        (NumberField.HeightOneSpectrum.adicAbv K v)).symm x
    refine
      ⟨(x' :
          (NumberField.HeightOneSpectrum.adicAbv K v).Completion),
        ?_⟩
    rw [finitePlaceCompletionRingHom_coe]
    rfl
  intro x
  have hx :
      x ∈ closure
        (Set.range (algebraMap K (v.adicCompletion K))) := by
    rw [hdense.closure_range]
    trivial
  exact closure_minimal hrange hrangeClosed hx
 
noncomputable def finitePlaceCompletionRingEquiv
    (v : HeightOneSpectrum (𝓞 K)) :
    (NumberField.HeightOneSpectrum.adicAbv K v).Completion ≃+*
      v.adicCompletion K :=
  RingEquiv.ofBijective (finitePlaceCompletionRingHom v)
    ⟨(finitePlaceCompletionRingHom_isometry v).injective,
      finitePlaceCompletionRingHom_surjective v⟩
 
noncomputable def finitePlaceCompletionContinuousMulEquiv
    (v : HeightOneSpectrum (𝓞 K)) :
    (NumberField.HeightOneSpectrum.adicAbv K v).Completion ≃ₜ*
      v.adicCompletion K where
  __ := (finitePlaceCompletionRingEquiv v).toMulEquiv
  continuous_toFun :=
    (finitePlaceCompletionRingHom_isometry v).continuous
  continuous_invFun :=
    ((finitePlaceCompletionRingHom_isometry v).right_inv
      (finitePlaceCompletionRingEquiv v).right_inv).continuous
 

noncomputable def finitePlaceCompletionUnitsContinuousMulEquiv
    (v : HeightOneSpectrum (𝓞 K)) :
    (NumberField.HeightOneSpectrum.adicAbv K v).Completionˣ ≃ₜ*
      (v.adicCompletion K)ˣ :=
  Units.mapContinuousMulEquiv
    (finitePlaceCompletionContinuousMulEquiv v)
 


noncomputable def chosenFinitePlaceExtension
    (v : HeightOneSpectrum (𝓞 K)) :
    AbsoluteValueExtension
      (NumberField.HeightOneSpectrum.adicAbv K v) L :=
  pullbackAbsoluteValueExtension
    (NumberField.HeightOneSpectrum.adicAbv K v)
    (RayClass.adicAbv_isNontrivial v)
    IsAlgClosed.lift
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.Adele.IntegralTensorSupport.AbsoluteValue -/
section
open scoped NumberField TensorProduct NNReal
open NumberField IsDedekindDomain
noncomputable section
open AlgebraicNumberTheory.Valuations
universe u v
variable
    {K : Type u} {L : Type v}
    [Field K] [NumberField K]
    [Field L] [NumberField L] [Algebra K L]
    [FiniteDimensional K L]
 

noncomputable def realAbsoluteValueValuation
    {F : Type*} [Field F]
    (vF : AbsoluteValue F ℝ)
    (hvF : IsNonarchimedean (vF : F → ℝ)) :
    Valuation F NNReal where
  toFun x := ⟨vF x, vF.nonneg x⟩
  map_one' := by
    ext
    exact vF.map_one
  map_zero' := by
    ext
    exact vF.map_zero
  map_mul' x y := by
    ext
    exact vF.map_mul x y
  map_add_le_max' x y := by
    change vF (x + y) ≤ max (vF x) (vF y)
    exact hvF x y
 


theorem absoluteValueExtension_isNonarchimedean
    {F E : Type*} [Field F] [Field E] [Algebra F E]
    (vF : AbsoluteValue F ℝ)
    (hvF : IsNonarchimedean (vF : F → ℝ))
    (w : AbsoluteValueExtension vF E) :
    IsNonarchimedean (w.1 : E → ℝ) := by
  rw [AbsoluteValue.isNonarchimedean_iff_bounded_nat]
  refine ⟨1, ?_⟩
  intro n
  calc
    w.1 (n : E) =
        w.1 (algebraMap F E (n : F)) := by simp
    _ = vF (n : F) := w.2 (n : F)
    _ ≤ 1 := hvF.apply_natCast_le_one
 

theorem absoluteValue_le_one_of_isIntegral
    {F : Type*} [Field F]
    (vF : AbsoluteValue F ℝ)
    (hvF : IsNonarchimedean (vF : F → ℝ))
    {x : F} (hx : IsIntegral ℤ x) :
    vF x ≤ 1 := by
  let ν : Valuation F NNReal :=
    realAbsoluteValueValuation vF hvF
  let V : ValuationSubring F := ν.valuationSubring
  let : IsIntegrallyClosedIn V F :=
    (isIntegrallyClosed_iff_isIntegrallyClosedIn F).1
      inferInstance
  let : IsScalarTower ℤ V F :=
    IsScalarTower.of_algebraMap_eq fun n => by
      simp
  have hxV : IsIntegral V x :=
    hx.tower_top
  obtain ⟨y, hy⟩ :=
    (IsIntegrallyClosedIn.isIntegral_iff).1 hxV
  have hν : x ∈ V := by
    rw [← hy, ValuationSubring.algebraMap_apply]
    exact y.property
  change
    realAbsoluteValueValuation vF hvF x ≤ 1 at hν
  exact_mod_cast hν
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.SUnit.GaloisAction -/
section
open scoped BigOperators Classical NumberField nonZeroDivisors
open IsDedekindDomain Module
noncomputable section
variable
    (K L : Type*) [Field K] [NumberField K]
    [Field L] [NumberField L] [Algebra K L]
 
noncomputable def finitePlaceEquiv
    (σ : L ≃ₐ[K] L) :
    HeightOneSpectrum (𝓞 L) ≃
      HeightOneSpectrum (𝓞 L) :=
  HeightOneSpectrum.equivOfRingEquiv
    (NumberField.RingOfIntegers.mapAlgEquiv σ).toRingEquiv
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
omit [NumberField K] [NumberField L] in
@[simp]
theorem finitePlaceEquiv_one
    (v : HeightOneSpectrum (𝓞 L)) :
    finitePlaceEquiv K L (1 : L ≃ₐ[K] L) v = v := by
  apply HeightOneSpectrum.ext
  ext x
  change
    NumberField.RingOfIntegers.mapRingHom (1 : L ≃ₐ[K] L).symm.toRingHom x ∈
        v.asIdeal ↔
      x ∈ v.asIdeal
  have hx :
      NumberField.RingOfIntegers.mapRingHom (1 : L ≃ₐ[K] L).symm.toRingHom x =
        x := by
    apply NumberField.RingOfIntegers.ext
    rfl
  rw [hx]
omit [NumberField K] [NumberField L] in
@[simp]
theorem finitePlaceEquiv_mul
    (σ τ : L ≃ₐ[K] L)
    (v : HeightOneSpectrum (𝓞 L)) :
    finitePlaceEquiv K L (σ * τ) v =
      finitePlaceEquiv K L σ
        (finitePlaceEquiv K L τ v) := by
  apply HeightOneSpectrum.ext
  ext x
  change
    NumberField.RingOfIntegers.mapRingHom (σ * τ).symm.toRingHom x ∈
        v.asIdeal ↔
      NumberField.RingOfIntegers.mapRingHom τ.symm.toRingHom
          (NumberField.RingOfIntegers.mapRingHom σ.symm.toRingHom x) ∈
        v.asIdeal
  have hx :
      NumberField.RingOfIntegers.mapRingHom (σ * τ).symm.toRingHom x =
        NumberField.RingOfIntegers.mapRingHom τ.symm.toRingHom
          (NumberField.RingOfIntegers.mapRingHom σ.symm.toRingHom x) := by
    apply NumberField.RingOfIntegers.ext
    rfl
  rw [hx]
 
noncomputable abbrev finitePlaceMulAction :
    MulAction (L ≃ₐ[K] L)
      (HeightOneSpectrum (𝓞 L)) where
  smul σ v := finitePlaceEquiv K L σ v
  one_smul := finitePlaceEquiv_one K L
  mul_smul := finitePlaceEquiv_mul K L
 
noncomputable abbrev fieldUnitsMulDistribMulAction :
    MulDistribMulAction (L ≃ₐ[K] L) Lˣ where
  smul σ x := Units.mapEquiv σ.toMulEquiv x
  one_smul x := by
    ext
    rfl
  mul_smul σ τ x := by
    ext
    rfl
  smul_one σ := map_one (Units.mapEquiv σ.toMulEquiv)
  smul_mul σ x y := map_mul (Units.mapEquiv σ.toMulEquiv) x y
section FinitePlaceAction
local instance :
    MulAction (L ≃ₐ[K] L)
      (HeightOneSpectrum (𝓞 L)) :=
  finitePlaceMulAction K L
local instance :
    MulDistribMulAction (L ≃ₐ[K] L) Lˣ :=
  fieldUnitsMulDistribMulAction K L
end FinitePlaceAction
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.NormalClosure -/
section
noncomputable section
universe u v
variable
    (K : Type u) (L : Type v)
    [Field K] [NumberField K]
    [Field L] [NumberField L] [Algebra K L]
 

abbrev finiteNormalClosure :=
  IntermediateField.normalClosure K L (AlgebraicClosure K)
noncomputable instance finiteNormalClosure_numberField :
    NumberField (finiteNormalClosure K L) :=
  NumberField.of_module_finite K (finiteNormalClosure K L)
noncomputable instance finiteNormalClosure_isGalois :
    IsGalois K (finiteNormalClosure K L) := by
  let f : L →ₐ[K] AlgebraicClosure K :=
    IsAlgClosed.lift
  let : Algebra L (AlgebraicClosure K) :=
    f.toRingHom.toAlgebra
  let : IsScalarTower K L (AlgebraicClosure K) :=
    IsScalarTower.of_algebraMap_eq'
      f.comp_algebraMap.symm
  infer_instance
 
noncomputable def finiteNormalClosureEmbedding :
    L →ₐ[K] finiteNormalClosure K L :=
  let f : L →ₐ[K] AlgebraicClosure K := IsAlgClosed.lift
  f.codRestrict
    (IntermediateField.normalClosure K L
      (AlgebraicClosure K)).toSubalgebra
    (fun x =>
      f.fieldRange_le_normalClosure
        (show f x ∈ f.fieldRange from ⟨x, rfl⟩))
end
end

/- ValuedFieldTheory.Ramification.HilbertRamification.Dedekind.Basic -/
section
noncomputable section
namespace HilbertRamification
namespace Dedekind
open scoped Pointwise
open Algebra Module
variable {A B : Type*} [CommRing A] [CommRing B] [Algebra A B]
 

theorem exists_smul_eq_of_isGaloisGroup
    (p : Ideal A) (P Q : Ideal B)
    [P.IsPrime] [P.LiesOver p] [Q.IsPrime] [Q.LiesOver p]
    (G : Type*) [Group G] [Finite G] [MulSemiringAction G B]
    [IsGaloisGroup G A B] :
    ∃ σ : G, σ • P = Q := by
  exact Ideal.exists_smul_eq_of_isGaloisGroup p P Q G
end Dedekind
end HilbertRamification
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
open AlgebraicNumberTheory.Valuations
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
@[simp]
theorem finitePlaceBelow_asIdeal
    (W : HeightOneSpectrum (𝓞 L)) :
    (finitePlaceBelow (K := K) W).asIdeal =
      W.asIdeal.under (𝓞 K) :=
  rfl
section Tower
variable {M : Type w}
    [Field M] [NumberField M]
    [Algebra K M] [Algebra M L]
    [IsScalarTower K M L]
end Tower
section Centre
variable [FiniteDimensional K L]
omit [NumberField L] [FiniteDimensional K L] in
 

theorem finitePlaceExtension_nonarchimedean
    (v : HeightOneSpectrum (𝓞 K))
    (w : AbsoluteValueExtension
      (HeightOneSpectrum.adicAbv K v) L) :
    LubinTate.Valuations.NonarchimedeanAbsoluteValue w.1 :=
  (AbsoluteValue.isNonarchimedean_iff_bounded_nat w.1).1
    (absoluteValueExtension_isNonarchimedean
      (HeightOneSpectrum.adicAbv K v)
      (HeightOneSpectrum.isNonarchimedean_adicAbv K v) w)
 

noncomputable def finitePlaceExtensionValuationSubring
    (v : HeightOneSpectrum (𝓞 K))
    (w : AbsoluteValueExtension
      (HeightOneSpectrum.adicAbv K v) L) :
    ValuationSubring L :=
  absoluteValueValuationSubring w.1
    (finitePlaceExtension_nonarchimedean
      (K := K) (L := L) v w)
omit [NumberField L] [FiniteDimensional K L] in
 

theorem ringOfIntegers_mem_finitePlaceExtensionValuationSubring
    (v : HeightOneSpectrum (𝓞 K))
    (w : AbsoluteValueExtension
      (HeightOneSpectrum.adicAbv K v) L)
    (x : 𝓞 L) :
    (x : L) ∈
      finitePlaceExtensionValuationSubring
        (K := K) (L := L) v w := by
  rw [finitePlaceExtensionValuationSubring,
    mem_absoluteValueValuationSubring_iff]
  exact
    absoluteValue_le_one_of_isIntegral w.1
      (absoluteValueExtension_isNonarchimedean
        (HeightOneSpectrum.adicAbv K v)
        (HeightOneSpectrum.isNonarchimedean_adicAbv K v) w)
      x.property
 

noncomputable def ringOfIntegersToFinitePlaceExtensionValuationSubring
    (v : HeightOneSpectrum (𝓞 K))
    (w : AbsoluteValueExtension
      (HeightOneSpectrum.adicAbv K v) L) :
    𝓞 L →+*
      finitePlaceExtensionValuationSubring
        (K := K) (L := L) v w :=
  RingHom.codRestrict (algebraMap (𝓞 L) L)
    (finitePlaceExtensionValuationSubring
      (K := K) (L := L) v w).toSubring
    (ringOfIntegers_mem_finitePlaceExtensionValuationSubring
      (K := K) (L := L) v w)
 

noncomputable def finitePlaceExtensionCentreIdeal
    (v : HeightOneSpectrum (𝓞 K))
    (w : AbsoluteValueExtension
      (HeightOneSpectrum.adicAbv K v) L) :
    Ideal (𝓞 L) :=
  (IsLocalRing.maximalIdeal
      (finitePlaceExtensionValuationSubring
        (K := K) (L := L) v w)).comap
    (ringOfIntegersToFinitePlaceExtensionValuationSubring
      (K := K) (L := L) v w)
omit [NumberField L] [FiniteDimensional K L] in
 
theorem mem_finitePlaceExtensionCentreIdeal_iff
    (v : HeightOneSpectrum (𝓞 K))
    (w : AbsoluteValueExtension
      (HeightOneSpectrum.adicAbv K v) L)
    (x : 𝓞 L) :
    x ∈ finitePlaceExtensionCentreIdeal
        (K := K) (L := L) v w ↔
      w.1 (x : L) < 1 := by
  let A :=
    finitePlaceExtensionValuationSubring
      (K := K) (L := L) v w
  let f :=
    ringOfIntegersToFinitePlaceExtensionValuationSubring
      (K := K) (L := L) v w
  change
    f x ∈ IsLocalRing.maximalIdeal A ↔
      w.1 (((f x : A) : L)) < 1
  rw [IsLocalRing.mem_maximalIdeal, mem_nonunits_iff]
  exact
    not_isUnit_iff_abs_lt_one_of_mem_iff_le_one
      w.1 A
      (fun y => by
        change
          y ∈ finitePlaceExtensionValuationSubring
              (K := K) (L := L) v w ↔
            w.1 y ≤ 1
        rw [finitePlaceExtensionValuationSubring,
          mem_absoluteValueValuationSubring_iff])
      (f x)
omit [NumberField L] [FiniteDimensional K L] in
theorem finitePlaceExtensionCentreIdeal_isPrime
    (v : HeightOneSpectrum (𝓞 K))
    (w : AbsoluteValueExtension
      (HeightOneSpectrum.adicAbv K v) L) :
    (finitePlaceExtensionCentreIdeal
      (K := K) (L := L) v w).IsPrime := by
  unfold finitePlaceExtensionCentreIdeal
  exact Ideal.comap_isPrime _ _
omit [NumberField L] [FiniteDimensional K L] in
 
theorem finitePlaceExtensionCentreIdeal_under
    (v : HeightOneSpectrum (𝓞 K))
    (w : AbsoluteValueExtension
      (HeightOneSpectrum.adicAbv K v) L) :
    (finitePlaceExtensionCentreIdeal
        (K := K) (L := L) v w).under (𝓞 K) =
      v.asIdeal := by
  ext x
  change
    algebraMap (𝓞 K) (𝓞 L) x ∈
        finitePlaceExtensionCentreIdeal
          (K := K) (L := L) v w ↔
      x ∈ v.asIdeal
  rw [mem_finitePlaceExtensionCentreIdeal_iff]
  have hcoe :
      ((algebraMap (𝓞 K) (𝓞 L) x : 𝓞 L) : L) =
        algebraMap K L (x : K) := by
    rfl
  rw [hcoe, w.2]
  rw [← FinitePlace.norm_embedding]
  exact FinitePlace.norm_lt_one_iff_mem (K := K) v x
omit [NumberField L] [FiniteDimensional K L] in
theorem finitePlaceExtensionCentreIdeal_ne_bot
    (v : HeightOneSpectrum (𝓞 K))
    (w : AbsoluteValueExtension
      (HeightOneSpectrum.adicAbv K v) L) :
    finitePlaceExtensionCentreIdeal
        (K := K) (L := L) v w ≠ ⊥ := by
  intro hbot
  apply v.ne_bot
  rw [← finitePlaceExtensionCentreIdeal_under
    (K := K) (L := L) v w, hbot]
  simp
 

noncomputable def finitePlaceExtensionCentre
    (v : HeightOneSpectrum (𝓞 K))
    (w : AbsoluteValueExtension
      (HeightOneSpectrum.adicAbv K v) L) :
    HeightOneSpectrum (𝓞 L) where
  asIdeal :=
    finitePlaceExtensionCentreIdeal
      (K := K) (L := L) v w
  isPrime :=
    finitePlaceExtensionCentreIdeal_isPrime
      (K := K) (L := L) v w
  ne_bot :=
    finitePlaceExtensionCentreIdeal_ne_bot
      (K := K) (L := L) v w
omit [NumberField L] [FiniteDimensional K L] in
@[simp]
theorem finitePlaceExtensionCentre_asIdeal
    (v : HeightOneSpectrum (𝓞 K))
    (w : AbsoluteValueExtension
      (HeightOneSpectrum.adicAbv K v) L) :
    (finitePlaceExtensionCentre
      (K := K) (L := L) v w).asIdeal =
      finitePlaceExtensionCentreIdeal
        (K := K) (L := L) v w :=
  rfl
omit [FiniteDimensional K L] in
@[simp]
theorem finitePlaceBelow_finitePlaceExtensionCentre
    (v : HeightOneSpectrum (𝓞 K))
    (w : AbsoluteValueExtension
      (HeightOneSpectrum.adicAbv K v) L) :
    finitePlaceBelow (K := K)
        (finitePlaceExtensionCentre
          (K := K) (L := L) v w) =
      v := by
  apply HeightOneSpectrum.ext
  exact
    finitePlaceExtensionCentreIdeal_under
      (K := K) (L := L) v w
omit [FiniteDimensional K L] in
 

theorem finitePlaceExtensionValuationSubring_eq_localization
    (v : HeightOneSpectrum (𝓞 K))
    (w : AbsoluteValueExtension
      (HeightOneSpectrum.adicAbv K v) L) :
    finitePlaceExtensionValuationSubring
        (K := K) (L := L) v w =
      (finitePlaceExtensionCentre
        (K := K) (L := L) v w).valuationSubringAtPrime L := by
  let P :=
    finitePlaceExtensionCentreIdeal
      (K := K) (L := L) v w
  let : P.IsPrime :=
    finitePlaceExtensionCentreIdeal_isPrime
      (K := K) (L := L) v w
  let W :=
    finitePlaceExtensionCentre
      (K := K) (L := L) v w
  let V := W.valuationSubringAtPrime L
  let A :=
    finitePlaceExtensionValuationSubring
      (K := K) (L := L) v w
  have hVA : V ≤ A := by
    rintro x ⟨a, s, hs, rfl⟩
    have haA : (a : L) ∈ A :=
      ringOfIntegers_mem_finitePlaceExtensionValuationSubring
        (K := K) (L := L) v w a
    have hsA : (s : L) ∈ A :=
      ringOfIntegers_mem_finitePlaceExtensionValuationSubring
        (K := K) (L := L) v w s
    have haLe : w.1 (a : L) ≤ 1 := by
      change (a : L) ∈
        finitePlaceExtensionValuationSubring
          (K := K) (L := L) v w at haA
      rw [finitePlaceExtensionValuationSubring,
        mem_absoluteValueValuationSubring_iff] at haA
      exact haA
    have hsLe : w.1 (s : L) ≤ 1 := by
      change (s : L) ∈
        finitePlaceExtensionValuationSubring
          (K := K) (L := L) v w at hsA
      rw [finitePlaceExtensionValuationSubring,
        mem_absoluteValueValuationSubring_iff] at hsA
      exact hsA
    have hsNotLt : ¬ w.1 (s : L) < 1 := by
      intro hlt
      apply hs
      exact
        (mem_finitePlaceExtensionCentreIdeal_iff
          (K := K) (L := L) v w s).2 hlt
    have hsEq : w.1 (s : L) = 1 :=
      le_antisymm hsLe (not_lt.mp hsNotLt)
    change
      (a : L) * (s : L)⁻¹ ∈
        finitePlaceExtensionValuationSubring
          (K := K) (L := L) v w
    rw [finitePlaceExtensionValuationSubring,
      mem_absoluteValueValuationSubring_iff,
      map_mul, map_inv₀, hsEq, inv_one, mul_one]
    exact haLe
  have hAne : A ≠ ⊤ := by
    intro htop
    obtain ⟨x, hx0, hx1⟩ :=
      RayClass.adicAbv_isNontrivial v
    let y : L := algebraMap K L x
    have hy0 : y ≠ 0 := by
      change algebraMap K L x ≠ 0
      simpa only [map_zero] using
        (algebraMap K L).injective.ne hx0
    have hy1 : w.1 y ≠ 1 := by
      change w.1 (algebraMap K L x) ≠ 1
      rw [w.2]
      exact hx1
    have hle (z : L) : w.1 z ≤ 1 := by
      have hzA : z ∈ A := by
        rw [htop]
        trivial
      change
        z ∈ finitePlaceExtensionValuationSubring
          (K := K) (L := L) v w at hzA
      rw [finitePlaceExtensionValuationSubring,
        mem_absoluteValueValuationSubring_iff] at hzA
      exact hzA
    have honeLe : 1 ≤ w.1 y := by
      calc
        1 = w.1 y * w.1 y⁻¹ := by
          rw [← map_mul, mul_inv_cancel₀ hy0, map_one]
        _ ≤ w.1 y * 1 :=
          mul_le_mul_of_nonneg_left (hle y⁻¹) (w.1.nonneg y)
        _ = w.1 y := mul_one _
    exact hy1 (le_antisymm (hle y) honeLe)
  exact (V.eq_of_le_of_ne_top hVA hAne).symm
section CrossBaseEquivalence
variable {F M : Type*}
    [Field F] [NumberField F]
    [Field M] [NumberField M]
    [Algebra F L] [Algebra M L]
omit [Algebra K L] [FiniteDimensional K L] in
 


theorem finitePlaceExtensions_isEquiv_of_centres_eq
    (vF : HeightOneSpectrum (𝓞 F))
    (vM : HeightOneSpectrum (𝓞 M))
    (wF :
      AbsoluteValueExtension
        (HeightOneSpectrum.adicAbv F vF) L)
    (wM :
      AbsoluteValueExtension
        (HeightOneSpectrum.adicAbv M vM) L)
    (hcentre :
      finitePlaceExtensionCentre
          (K := F) (L := L) vF wF =
        finitePlaceExtensionCentre
          (K := M) (L := L) vM wM) :
    wF.1.IsEquiv wM.1 := by
  have hsubring :
      finitePlaceExtensionValuationSubring
          (K := F) (L := L) vF wF =
        finitePlaceExtensionValuationSubring
          (K := M) (L := L) vM wM := by
    rw [finitePlaceExtensionValuationSubring_eq_localization,
      finitePlaceExtensionValuationSubring_eq_localization,
      hcentre]
  have hle (x : L) :
      wF.1 x ≤ 1 ↔ wM.1 x ≤ 1 := by
    change
      x ∈
          finitePlaceExtensionValuationSubring
            (K := F) (L := L) vF wF ↔
        x ∈
          finitePlaceExtensionValuationSubring
            (K := M) (L := L) vM wM
    rw [hsubring]
  apply AbsoluteValue.isEquiv_iff_lt_one_iff.mpr
  intro x
  by_cases hx : x = 0
  · subst x
    simp
  calc
    wF.1 x < 1 ↔ 1 < (wF.1 x)⁻¹ :=
      (one_lt_inv₀ (wF.1.pos hx)).symm
    _ ↔ 1 < wF.1 x⁻¹ := by
      rw [map_inv₀]
    _ ↔ ¬ wF.1 x⁻¹ ≤ 1 := not_le.symm
    _ ↔ ¬ wM.1 x⁻¹ ≤ 1 :=
      not_congr (hle x⁻¹)
    _ ↔ 1 < wM.1 x⁻¹ := not_le
    _ ↔ 1 < (wM.1 x)⁻¹ := by
      rw [map_inv₀]
    _ ↔ wM.1 x < 1 :=
      one_lt_inv₀ (wM.1.pos hx)
end CrossBaseEquivalence
omit [FiniteDimensional K L] in
 

theorem finitePlaceExtensionCentre_injective
    (v : HeightOneSpectrum (𝓞 K)) :
    Function.Injective
      (finitePlaceExtensionCentre
        (K := K) (L := L) v) := by
  intro w w' hcentre
  have hequiv : w.1.IsEquiv w'.1 :=
    finitePlaceExtensions_isEquiv_of_centres_eq
      (F := K) (M := K) v v w w' hcentre
  exact
    equivalent_exactExtensions_eq
      (HeightOneSpectrum.adicAbv K v)
      (RayClass.adicAbv_isNontrivial v) w w'
      ((LubinTate.Valuations.equivalentAbsoluteValues_iff_isEquiv
        w.1 w'.1).2 hequiv)
omit [NumberField L] [FiniteDimensional K L] in
 

theorem finitePlaceExtensionCentre_conjugate
    (v : HeightOneSpectrum (𝓞 K))
    (w : AbsoluteValueExtension
      (HeightOneSpectrum.adicAbv K v) L)
    (σ : L ≃ₐ[K] L) :
    finitePlaceExtensionCentre
        (K := K) (L := L) v
        (absoluteValueExtensionConjugate
          (HeightOneSpectrum.adicAbv K v) w σ) =
      finitePlaceEquiv K L σ⁻¹
        (finitePlaceExtensionCentre
          (K := K) (L := L) v w) := by
  apply HeightOneSpectrum.ext
  ext x
  change
    x ∈ finitePlaceExtensionCentreIdeal
        (K := K) (L := L) v
        (absoluteValueExtensionConjugate
          (HeightOneSpectrum.adicAbv K v) w σ) ↔
      NumberField.RingOfIntegers.mapRingHom
          σ.toRingHom x ∈
        finitePlaceExtensionCentreIdeal
          (K := K) (L := L) v w
  rw [mem_finitePlaceExtensionCentreIdeal_iff,
    mem_finitePlaceExtensionCentreIdeal_iff]
  rfl
 

noncomputable def finitePlaceExtensionCentreInFibre
    (v : HeightOneSpectrum (𝓞 K)) :
    AbsoluteValueExtension
        (HeightOneSpectrum.adicAbv K v) L →
      {W : HeightOneSpectrum (𝓞 L) //
        finitePlaceBelow (K := K) W = v} :=
  fun w =>
    ⟨finitePlaceExtensionCentre (K := K) (L := L) v w,
      finitePlaceBelow_finitePlaceExtensionCentre
        (K := K) (L := L) v w⟩
omit [FiniteDimensional K L] in
@[simp]
theorem finitePlaceExtensionCentreInFibre_coe
    (v : HeightOneSpectrum (𝓞 K))
    (w : AbsoluteValueExtension
      (HeightOneSpectrum.adicAbv K v) L) :
    (finitePlaceExtensionCentreInFibre
        (K := K) (L := L) v w :
      HeightOneSpectrum (𝓞 L)) =
      finitePlaceExtensionCentre (K := K) (L := L) v w :=
  rfl
omit [FiniteDimensional K L] in
theorem finitePlaceExtensionCentreInFibre_injective
    (v : HeightOneSpectrum (𝓞 K)) :
    Function.Injective
      (finitePlaceExtensionCentreInFibre
        (K := K) (L := L) v) := by
  intro w w' h
  apply finitePlaceExtensionCentre_injective
    (K := K) (L := L) v
  exact congrArg Subtype.val h
private theorem
    finitePlaceExtensionCentreInFibre_surjective_of_isGalois
    [IsGalois K L]
    (v : HeightOneSpectrum (𝓞 K)) :
    Function.Surjective
      (finitePlaceExtensionCentreInFibre
        (K := K) (L := L) v) := by
  let w₀ : AbsoluteValueExtension
      (HeightOneSpectrum.adicAbv K v) L :=
    pullbackAbsoluteValueExtension
      (HeightOneSpectrum.adicAbv K v)
      (RayClass.adicAbv_isNontrivial v)
      IsAlgClosed.lift
  let W₀ :=
    finitePlaceExtensionCentre (K := K) (L := L) v w₀
  let : Finite (L ≃ₐ[K] L) :=
    IsGaloisGroup.finite (L ≃ₐ[K] L) K L
  let :
      IsGaloisGroup (L ≃ₐ[K] L) (𝓞 K) (𝓞 L) :=
    IsGaloisGroup.of_isFractionRing
      (L ≃ₐ[K] L) (𝓞 K) (𝓞 L) K L
  intro W
  let : W₀.asIdeal.LiesOver v.asIdeal :=
    ⟨(finitePlaceExtensionCentreIdeal_under
      (K := K) (L := L) v w₀).symm⟩
  let : W.1.asIdeal.LiesOver v.asIdeal := ⟨by
    have h := congrArg HeightOneSpectrum.asIdeal W.2
    simpa only [finitePlaceBelow_asIdeal] using h.symm⟩
  obtain ⟨σ, hσ⟩ :=
    HilbertRamification.Dedekind.exists_smul_eq_of_isGaloisGroup
      v.asIdeal W₀.asIdeal W.1.asIdeal (L ≃ₐ[K] L)
  have hplace :
      finitePlaceEquiv K L σ W₀ = W.1 := by
    apply HeightOneSpectrum.ext
    rw [finitePlaceEquiv_asIdeal]
    exact hσ
  refine ⟨absoluteValueExtensionConjugate
      (HeightOneSpectrum.adicAbv K v) w₀ σ⁻¹, ?_⟩
  apply Subtype.ext
  rw [finitePlaceExtensionCentreInFibre_coe,
    finitePlaceExtensionCentre_conjugate]
  simpa only [inv_inv] using hplace
 

theorem finitePlaceExtensionCentreInFibre_surjective
    (v : HeightOneSpectrum (𝓞 K)) :
    Function.Surjective
      (finitePlaceExtensionCentreInFibre
        (K := K) (L := L) v) := by
  intro W
  let M := finiteNormalClosure K L
  let e : L →ₐ[K] M :=
    finiteNormalClosureEmbedding K L
  let : Algebra L M :=
    e.toRingHom.toAlgebra
  let : IsScalarTower K L M :=
    IsScalarTower.of_algebraMap_eq'
      e.comp_algebraMap.symm
  let : FiniteDimensional L M :=
    FiniteDimensional.right K L M
  obtain ⟨Q, hQmax, hQover⟩ :=
    Ideal.exists_maximal_ideal_liesOver_of_isIntegral
      (S := 𝓞 M) W.1.asIdeal
  let : Q.IsMaximal :=
    hQmax
  let U : HeightOneSpectrum (𝓞 M) :=
    { asIdeal := Q
      isPrime := hQmax.isPrime
      ne_bot :=
        Ideal.IsMaximal.ne_bot_of_isIntegral_int Q }
  have hUbelowL :
      finitePlaceBelow (K := L) U = W.1 := by
    apply HeightOneSpectrum.ext
    exact hQover.over.symm
  have hUbelowK :
      finitePlaceBelow (K := K) U = v := by
    have htrans :
        finitePlaceBelow (K := K)
            (finitePlaceBelow (K := L) U) =
          finitePlaceBelow (K := K) U := by
      apply HeightOneSpectrum.ext
      exact
        Ideal.under_under
          (A := 𝓞 K) (B := 𝓞 L) (C := 𝓞 M) Q
    rw [← htrans, hUbelowL, W.2]
  let Uv :
      {U : HeightOneSpectrum (𝓞 M) //
        finitePlaceBelow (K := K) U = v} :=
    ⟨U, hUbelowK⟩
  obtain ⟨uM, huM⟩ :=
    finitePlaceExtensionCentreInFibre_surjective_of_isGalois
      (K := K) (L := M) v Uv
  have hcentreM :
      finitePlaceExtensionCentre
          (K := K) (L := M) v uM = U :=
    congrArg Subtype.val huM
  have hcentreIdealM :
      finitePlaceExtensionCentreIdeal
          (K := K) (L := M) v uM = Q := by
    simpa only [finitePlaceExtensionCentre_asIdeal] using
      congrArg HeightOneSpectrum.asIdeal hcentreM
  let uL :
      AbsoluteValueExtension
        (HeightOneSpectrum.adicAbv K v) L :=
    { val :=
        uM.1.comp (f := algebraMap L M)
          (algebraMap L M).injective
      property := by
        intro x
        change
          uM.1
              (algebraMap L M
                (algebraMap K L x)) =
            HeightOneSpectrum.adicAbv K v x
        rw [← IsScalarTower.algebraMap_apply K L M]
        exact uM.2 x }
  refine ⟨uL, ?_⟩
  apply Subtype.ext
  apply HeightOneSpectrum.ext
  ext x
  change
    x ∈ finitePlaceExtensionCentreIdeal
        (K := K) (L := L) v uL ↔
      x ∈ W.1.asIdeal
  rw [mem_finitePlaceExtensionCentreIdeal_iff]
  change
    uM.1 (algebraMap L M (x : L)) < 1 ↔
      x ∈ W.1.asIdeal
  have hmap :
      ((algebraMap (𝓞 L) (𝓞 M) x : 𝓞 M) : M) =
        algebraMap L M (x : L) :=
    rfl
  rw [← hmap]
  rw [← mem_finitePlaceExtensionCentreIdeal_iff
      (K := K) (L := M) v uM
      (algebraMap (𝓞 L) (𝓞 M) x),
    hcentreIdealM, hQover.over]
  rfl
 

noncomputable def finitePlaceExtensionEquivAbove
    (v : HeightOneSpectrum (𝓞 K)) :
    AbsoluteValueExtension
        (HeightOneSpectrum.adicAbv K v) L ≃
      {W : HeightOneSpectrum (𝓞 L) //
        finitePlaceBelow (K := K) W = v} :=
  Equiv.ofBijective
    (finitePlaceExtensionCentreInFibre
      (K := K) (L := L) v)
    ⟨finitePlaceExtensionCentreInFibre_injective
        (K := K) (L := L) v,
      finitePlaceExtensionCentreInFibre_surjective
        (K := K) (L := L) v⟩
end Centre
end
end

/- GaloisCohomology.GroupTheory.Finite -/
section
noncomputable section
universe uG
section PrimePower
variable {G : Type uG} [Group G] [Finite G]
end PrimePower
section PrimeOrder
variable (G : Type uG) [Group G] [Finite G] [Nontrivial G]
end PrimeOrder
section DoubleCosets
variable {G : Type uG} [Group G]
 

def doubleCosetRightProjection
    (H D : Subgroup G) :
    DoubleCoset.Quotient
        (H : Set G) (⊥ : Subgroup G) →
      DoubleCoset.Quotient (H : Set G) D :=
  Quotient.map' id fun a b hab ↦ by
    rw [DoubleCoset.rel_iff] at hab ⊢
    obtain ⟨h, hh, k, hk, hab⟩ := hab
    have hkOne : k = 1 :=
      Subgroup.mem_bot.mp hk
    subst k
    exact
      ⟨h, hh, 1, D.one_mem, by simpa using hab⟩
@[simp]
theorem doubleCosetRightProjection_mk
    (H D : Subgroup G)
    (g : G) :
    doubleCosetRightProjection H D
        (DoubleCoset.mk H (⊥ : Subgroup G) g) =
      DoubleCoset.mk H D g :=
  Quotient.map'_mk'' _ _ _
 
theorem doubleCosetRightProjection_surjective
    (H D : Subgroup G) :
    Function.Surjective
      (doubleCosetRightProjection H D) := by
  intro q
  refine
    ⟨DoubleCoset.mk H (⊥ : Subgroup G) q.out, ?_⟩
  rw [doubleCosetRightProjection_mk]
  exact DoubleCoset.out_eq' H D q
 

theorem rightSubgroup_le_normalCore_of_doubleCoset_projection_injective
    (H D : Subgroup G)
    (hinj : Function.Injective
      (doubleCosetRightProjection H D)) :
    D ≤ H.normalCore := by
  intro d hd g
  have hdouble :
      DoubleCoset.mk H D g =
        DoubleCoset.mk H D (g * d) := by
    rw [DoubleCoset.eq]
    exact
      ⟨1, H.one_mem, d, hd, by simp⟩
  have hleft :
      DoubleCoset.mk H (⊥ : Subgroup G) g =
        DoubleCoset.mk H (⊥ : Subgroup G)
          (g * d) := by
    apply hinj
    simpa only
      [doubleCosetRightProjection_mk]
      using hdouble
  rw [DoubleCoset.eq] at hleft
  obtain ⟨h, hh, k, hk, heq⟩ := hleft
  have hkOne : k = 1 :=
    Subgroup.mem_bot.mp hk
  subst k
  simp only [mul_one] at heq
  have hconj : g * d * g⁻¹ = h := by
    calc
      g * d * g⁻¹ =
          (g * d) * g⁻¹ := rfl
      _ = (h * g) * g⁻¹ := by
        rw [heq]
      _ = h := by simp
  rw [hconj]
  exact hh
 

theorem rightSubgroup_le_normalCore_of_doubleCoset_card_eq
    [Finite G]
    (H D : Subgroup G)
    (hcard :
      Nat.card
          (DoubleCoset.Quotient (H : Set G) D) =
        Nat.card
          (DoubleCoset.Quotient (H : Set G)
            (⊥ : Subgroup G))) :
    D ≤ H.normalCore := by
  let :
      Finite
        (DoubleCoset.Quotient (H : Set G)
          (⊥ : Subgroup G)) :=
    Finite.of_surjective
      (DoubleCoset.mk H (⊥ : Subgroup G))
      (by
        intro q
        exact
          ⟨q.out,
            DoubleCoset.out_eq'
              H (⊥ : Subgroup G) q⟩)
  have hbij :
      Function.Bijective
        (doubleCosetRightProjection H D) :=
    Function.Surjective.bijective_of_nat_card_le
      (doubleCosetRightProjection_surjective H D)
      hcard.symm.le
  exact
    rightSubgroup_le_normalCore_of_doubleCoset_projection_injective
      H D hbij.injective
 



theorem doubleCoset_card_eq_leftCoset_iff_of_normalCore_eq_bot
    [Finite G]
    (H D : Subgroup G)
    (hcore : H.normalCore = ⊥) :
    Nat.card
          (DoubleCoset.Quotient (H : Set G) D) =
        Nat.card
          (DoubleCoset.Quotient (H : Set G)
            (⊥ : Subgroup G)) ↔
      D = ⊥ := by
  constructor
  · intro hcard
    apply le_bot_iff.mp
    rw [← hcore]
    exact
      rightSubgroup_le_normalCore_of_doubleCoset_card_eq
        H D hcard
  · rintro rfl
    rfl
end DoubleCosets
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.Ramification.Splitting.FinitePlace -/
section
open scoped NumberField Classical
open NumberField IsDedekindDomain
noncomputable section
open AlgebraicNumberTheory.Valuations
open HilbertRamification
variable {K L : Type}
    [Field K] [NumberField K]
    [Field L] [Algebra K L]
    [FiniteDimensional K L] [IsGalois K L]
 

noncomputable def finitePlaceDecompositionGroup
    (v : HeightOneSpectrum (𝓞 K)) :
    Subgroup (L ≃ₐ[K] L) :=
  absoluteValueDecompositionGroup K
    (chosenFinitePlaceExtension (L := L) v).1
 



def FinitePlaceSplitsCompletely
    (v : HeightOneSpectrum (𝓞 K)) : Prop :=
  finitePlaceDecompositionGroup
    (K := K) (L := L) v = ⊥
section IntermediateField
variable {M : Type}
    [Field M] [Algebra K M] [Algebra M L]
    [IsScalarTower K M L]
end IntermediateField
section Quotient
end Quotient
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.Galois.CyclicPrimeSubextension -/
section
open scoped NumberField Classical IsMulCommutative
open NumberField IsDedekindDomain
noncomputable section
open AlgebraicNumberTheory.Valuations
open HilbertRamification
section ValuationRestriction
variable {F E : Type}
    [Field F] [Field E] [Algebra F E]
 

def restrictAbsoluteValueExtensionToIntermediate
    (vF : AbsoluteValue F ℝ)
    (w : AbsoluteValueExtension vF E)
    (M : IntermediateField F E) :
    AbsoluteValueExtension vF M where
  val :=
    w.1.comp (f := M.val.toRingHom)
      M.val.injective
  property x := by
    change w.1 (algebraMap F E x) = vF x
    exact w.2 x
 

def absoluteValueExtensionOverIntermediate
    (vF : AbsoluteValue F ℝ)
    (w : AbsoluteValueExtension vF E)
    (M : IntermediateField F E) :
    AbsoluteValueExtension
      (restrictAbsoluteValueExtensionToIntermediate
        vF w M).1 E where
  val := w.1
  property _ := rfl
 






theorem absoluteValueDecompositionGroup_map_restrictNormalHom
    {M : Type*}
    [Field M] [Algebra F M] [Algebra M E]
    [IsScalarTower F M E]
    [IsGalois F E]
    [Normal F M]
    (vF : AbsoluteValue F ℝ)
    (hvF : vF.IsNontrivial)
    (w : AbsoluteValueExtension vF E) :
    (absoluteValueDecompositionGroup F w.1).map
        (AlgEquiv.restrictNormalHom
          (F := F) (K₁ := E) M) =
      absoluteValueDecompositionGroup F
        (w.1.comp (f := algebraMap M E)
          (algebraMap M E).injective) := by
  let : IsGalois M E :=
    IsGalois.tower_top_of_isGalois F M E
  let vM : AbsoluteValueExtension vF M :=
    { val :=
        w.1.comp (f := algebraMap M E)
          (algebraMap M E).injective
      property := by
        intro x
        change
          w.1 (algebraMap M E (algebraMap F M x)) =
            vF x
        rw [← IsScalarTower.algebraMap_apply F M E]
        exact w.2 x }
  let q :=
    AlgEquiv.restrictNormalHom
      (F := F) (K₁ := E) M
  ext τ
  constructor
  · rintro ⟨σ, hσ, rfl⟩
    change
      ∀ x : E,
        w.1 (σ x) < 1 ↔ w.1 x < 1
      at hσ
    change
      ∀ x : M,
        vM.1 ((q σ) x) < 1 ↔
          vM.1 x < 1
    intro x
    have hleft :
        vM.1 ((q σ) x) =
          w.1 (σ (algebraMap M E x)) := by
      change
        w.1 (algebraMap M E ((q σ) x)) =
          w.1 (σ (algebraMap M E x))
      exact congrArg w.1
        (AlgEquiv.restrictNormal_commutes
          σ M x)
    have hright :
        vM.1 x = w.1 (algebraMap M E x) :=
      rfl
    rw [hleft, hright]
    exact hσ (algebraMap M E x)
  · intro hτ
    obtain ⟨σ : E ≃ₐ[F] E, hσ⟩ :=
      (AlgEquiv.restrictNormalHom_surjective
        (F := F) (K₁ := M) (E := E)) τ
    have hτext :
        absoluteValueExtensionConjugate
            vF vM τ = vM :=
      (mem_absoluteValueDecompositionGroup_iff_extensionConjugate_eq
        vF hvF vM τ).mp hτ
    let wSigma :
        AbsoluteValueExtension vM.1 E :=
      { val :=
          absoluteValueConjugate w.1 σ
        property := by
          intro x
          calc
            w.1 (σ (algebraMap M E x)) =
                vM.1 ((q σ) x) := by
              change
                w.1 (σ (algebraMap M E x)) =
                  w.1 (algebraMap M E ((q σ) x))
              exact congrArg w.1
                (AlgEquiv.restrictNormal_commutes
                  σ M x).symm
            _ = vM.1 (τ x) := by
              rw [hσ]
            _ = vM.1 x := by
              have hx :=
                congrArg
                  (fun e :
                    AbsoluteValueExtension vF M =>
                      e.1 x)
                  hτext
              exact hx }
    let wOverM : AbsoluteValueExtension vM.1 E :=
      { val := w.1
        property := by
          intro x
          rfl }
    let hvM : vM.1.IsNontrivial := by
      rcases hvF with ⟨a, ha, hva⟩
      refine
        ⟨algebraMap F M a,
          (map_ne_zero (algebraMap F M)).2 ha, ?_⟩
      simpa only [vM.2 a] using hva
    obtain ⟨ηM, hηM⟩ :=
      absoluteValueConjugacy vM.1 hvM
        wOverM wSigma
    let η : E ≃ₐ[F] E :=
      ηM.restrictScalars F
    have hqη : q η = 1 := by
      apply AlgEquiv.ext
      intro x
      apply (algebraMap M E).injective
      calc
        algebraMap M E ((q η) x) =
            η (algebraMap M E x) :=
          AlgEquiv.restrictNormal_commutes
            η M x
        _ = algebraMap M E x :=
          ηM.commutes x
    let δ : E ≃ₐ[F] E :=
      σ * η⁻¹
    have hδ :
        δ ∈ absoluteValueDecompositionGroup F w.1 := by
      change
        ∀ x : E,
          w.1 (δ x) < 1 ↔
            w.1 x < 1
      intro x
      have hx :=
        congrArg
          (fun e : AbsoluteValueExtension vM.1 E =>
            e.1 (ηM⁻¹ x))
          hηM
      change
        w.1 (σ (ηM⁻¹ x)) =
          w.1 (ηM (ηM⁻¹ x))
        at hx
      have hvalue :
          w.1 (δ x) = w.1 x := by
        simpa [δ, η] using hx
      rw [hvalue]
    refine ⟨δ, hδ, ?_⟩
    change q δ = τ
    rw [show δ = σ * η⁻¹ from rfl,
      map_mul, map_inv, hqη, inv_one,
      mul_one, hσ]
end ValuationRestriction
section DecompositionGroupChoice
variable {F L : Type*}
    [Field F] [Field L] [Algebra F L]
end DecompositionGroupChoice
section ValuationRestriction
variable {F E : Type}
    [Field F] [Field E] [Algebra F E]
 

theorem absoluteValueDecompositionGroup_conjugate_eq_bot
    (vF : AbsoluteValue F ℝ)
    (w : AbsoluteValueExtension vF E)
    (ρ : E ≃ₐ[F] E)
    (hbot :
      absoluteValueDecompositionGroup F w.1 = ⊥) :
    absoluteValueDecompositionGroup F
        (absoluteValueExtensionConjugate
          vF w ρ).1 = ⊥ := by
  apply le_bot_iff.mp
  intro τ hτ
  rw [Subgroup.mem_bot]
  change
    ∀ x : E,
      w.1 (ρ (τ x)) < 1 ↔
        w.1 (ρ x) < 1
    at hτ
  let δ : E ≃ₐ[F] E :=
    ρ * τ * ρ⁻¹
  have hδ :
      δ ∈ absoluteValueDecompositionGroup F w.1 := by
    change
      ∀ x : E,
        w.1 (δ x) < 1 ↔
          w.1 x < 1
    intro x
    simpa [δ] using hτ (ρ⁻¹ x)
  have hδOne : δ = 1 :=
    Subgroup.mem_bot.mp (hbot ▸ hδ)
  have hconj :=
    congrArg (fun z : E ≃ₐ[F] E =>
      ρ⁻¹ * z * ρ) hδOne
  simpa [δ, mul_assoc] using hconj
 

theorem absoluteValueDecompositionGroup_eq_bot_independent_extension
    [IsGalois F E]
    (vF : AbsoluteValue F ℝ)
    (hvF : vF.IsNontrivial)
    (w w' : AbsoluteValueExtension vF E)
    (hbot :
      absoluteValueDecompositionGroup F w.1 = ⊥) :
    absoluteValueDecompositionGroup F w'.1 = ⊥ := by
  obtain ⟨ρ, hρ⟩ :=
    absoluteValueConjugacy vF hvF w w'
  rw [hρ]
  exact
    absoluteValueDecompositionGroup_conjugate_eq_bot
      vF w ρ hbot
end ValuationRestriction
variable {K L : Type}
    [Field K] [NumberField K]
    [Field L] [NumberField L]
    [Algebra K L]
    [FiniteDimensional K L] [IsGalois K L]
    [IsCyclic (L ≃ₐ[K] L)]
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.Ramification.Splitting.FinitePlaceIdeal -/
section
open scoped NumberField Classical
open NumberField IsDedekindDomain
noncomputable section
open AlgebraicNumberTheory.Valuations
open HilbertRamification
variable
    {K L : Type}
    [Field K] [NumberField K]
    [Field L] [NumberField L] [Algebra K L]
    [FiniteDimensional K L] [IsGalois K L]
omit [FiniteDimensional K L] [IsGalois K L] in
 

theorem absoluteValueDecompositionGroup_eq_finitePlaceStabilizer
    (v : HeightOneSpectrum (𝓞 K))
    (w : AbsoluteValueExtension
      (HeightOneSpectrum.adicAbv K v) L) :
    letI := finitePlaceMulAction K L
    absoluteValueDecompositionGroup K w.1 =
      MulAction.stabilizer (L ≃ₐ[K] L)
        (finitePlaceExtensionCentre (K := K) (L := L) v w) := by
  let := finitePlaceMulAction K L
  ext σ
  rw [mem_absoluteValueDecompositionGroup_iff_extensionConjugate_eq
      (HeightOneSpectrum.adicAbv K v)
      (RayClass.adicAbv_isNontrivial v) w σ]
  simp only [MulAction.mem_stabilizer_iff]
  change
    absoluteValueExtensionConjugate
        (HeightOneSpectrum.adicAbv K v) w σ = w ↔
      finitePlaceEquiv K L σ
          (finitePlaceExtensionCentre (K := K) (L := L) v w) =
        finitePlaceExtensionCentre (K := K) (L := L) v w
  constructor
  · intro h
    have hc := congrArg
      (finitePlaceExtensionCentre (K := K) (L := L) v) h
    rw [finitePlaceExtensionCentre_conjugate] at hc
    calc
      finitePlaceEquiv K L σ
          (finitePlaceExtensionCentre (K := K) (L := L) v w) =
          finitePlaceEquiv K L σ
            (finitePlaceEquiv K L σ⁻¹
              (finitePlaceExtensionCentre (K := K) (L := L) v w)) :=
        congrArg (finitePlaceEquiv K L σ) hc.symm
      _ = finitePlaceExtensionCentre (K := K) (L := L) v w := by
        rw [← finitePlaceEquiv_mul]
        simp
  · intro h
    apply finitePlaceExtensionCentre_injective
      (K := K) (L := L) v
    rw [finitePlaceExtensionCentre_conjugate]
    calc
      finitePlaceEquiv K L σ⁻¹
          (finitePlaceExtensionCentre (K := K) (L := L) v w) =
          finitePlaceEquiv K L σ⁻¹
            (finitePlaceEquiv K L σ
              (finitePlaceExtensionCentre (K := K) (L := L) v w)) :=
        congrArg (finitePlaceEquiv K L σ⁻¹) h.symm
      _ = finitePlaceExtensionCentre (K := K) (L := L) v w := by
        rw [← finitePlaceEquiv_mul]
        simp
 

theorem finitePlaceSplitsCompletely_iff_centre_stabilizer_eq_bot
    (v : HeightOneSpectrum (𝓞 K))
    (w : AbsoluteValueExtension
      (HeightOneSpectrum.adicAbv K v) L) :
    FinitePlaceSplitsCompletely (K := K) (L := L) v ↔
      letI := finitePlaceMulAction K L
      MulAction.stabilizer (L ≃ₐ[K] L)
        (finitePlaceExtensionCentre (K := K) (L := L) v w) = ⊥ := by
  let := finitePlaceMulAction K L
  unfold FinitePlaceSplitsCompletely finitePlaceDecompositionGroup
  constructor
  · intro h
    have hw :
        absoluteValueDecompositionGroup K w.1 = ⊥ :=
      absoluteValueDecompositionGroup_eq_bot_independent_extension
        (HeightOneSpectrum.adicAbv K v)
        (RayClass.adicAbv_isNontrivial v)
        (chosenFinitePlaceExtension (L := L) v) w h
    rwa [absoluteValueDecompositionGroup_eq_finitePlaceStabilizer
      (K := K) (L := L) v w] at hw
  · intro h
    have hw :
        absoluteValueDecompositionGroup K w.1 = ⊥ := by
      rwa [absoluteValueDecompositionGroup_eq_finitePlaceStabilizer
        (K := K) (L := L) v w]
    exact
      absoluteValueDecompositionGroup_eq_bot_independent_extension
        (HeightOneSpectrum.adicAbv K v)
        (RayClass.adicAbv_isNontrivial v)
        w (chosenFinitePlaceExtension (L := L) v) hw
 

theorem finitePlaceSplitsCompletely_iff_stabilizer_eq_bot
    (v : HeightOneSpectrum (𝓞 K))
    (W : HeightOneSpectrum (𝓞 L))
    (hW : finitePlaceBelow (K := K) W = v) :
    FinitePlaceSplitsCompletely (K := K) (L := L) v ↔
      letI := finitePlaceMulAction K L
      MulAction.stabilizer (L ≃ₐ[K] L) W = ⊥ := by
  let := finitePlaceMulAction K L
  let Wv :
      {W : HeightOneSpectrum (𝓞 L) //
        finitePlaceBelow (K := K) W = v} :=
    ⟨W, hW⟩
  let w :=
    (finitePlaceExtensionEquivAbove (K := K) (L := L) v).symm Wv
  have hw :
      finitePlaceExtensionCentre (K := K) (L := L) v w = W := by
    have happ :=
      (finitePlaceExtensionEquivAbove (K := K) (L := L) v).apply_symm_apply Wv
    exact congrArg Subtype.val happ
  rw [finitePlaceSplitsCompletely_iff_centre_stabilizer_eq_bot
    (K := K) (L := L) v w, hw]
section IntermediateField
variable {M : Type}
    [Field M] [NumberField M]
    [Algebra K M] [Algebra M L]
    [IsScalarTower K M L]
    [IsGalois M L]
end IntermediateField
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.Ramification.Splitting.NormalClosure -/
section
open scoped NumberField Classical
open NumberField IsDedekindDomain
noncomputable section
open AlgebraicNumberTheory.Valuations
open HilbertRamification
section AbsoluteValueExtensions
variable {K M : Type}
    [Field K] [Field M] [Algebra K M]
 


noncomputable def extendAbsoluteValueExtensionFromIntermediate
    [FiniteDimensional K M]
    (vK : AbsoluteValue K ℝ)
    (hvK : vK.IsNontrivial)
    (L : IntermediateField K M)
    (u : AbsoluteValueExtension vK L) :
    AbsoluteValueExtension vK M := by
  let : Module.IsTorsionFree L
      (absoluteValueExtension_algebraicCompletionClosure u.1) :=
    DivisionSemiring.to_moduleIsTorsionFree
  let hu : u.1.IsNontrivial :=
    u.isNontrivial hvK
  let wL : AbsoluteValueExtension u.1 M :=
    pullbackAbsoluteValueExtension
      u.1 hu IsAlgClosed.lift
  exact
    { val := wL.1
      property := by
        intro x
        rw [IsScalarTower.algebraMap_apply K L M,
          wL.2, u.2] }
@[simp]
theorem extendAbsoluteValueExtensionFromIntermediate_apply
    [FiniteDimensional K M]
    (vK : AbsoluteValue K ℝ)
    (hvK : vK.IsNontrivial)
    (L : IntermediateField K M)
    (u : AbsoluteValueExtension vK L)
    (x : L) :
    (extendAbsoluteValueExtensionFromIntermediate
      vK hvK L u).1 x = u.1 x := by
  let : Module.IsTorsionFree L
      (absoluteValueExtension_algebraicCompletionClosure u.1) :=
    DivisionSemiring.to_moduleIsTorsionFree
  change
    (pullbackAbsoluteValueExtension
      u.1 (u.isNontrivial hvK)
        IsAlgClosed.lift).1
      (algebraMap L M x) = u.1 x
  exact
    (pullbackAbsoluteValueExtension
      u.1 (u.isNontrivial hvK)
        IsAlgClosed.lift).2 x
variable (vK : AbsoluteValue K ℝ)
    (hvK : vK.IsNontrivial)
    (w : AbsoluteValueExtension vK M)
    (L : IntermediateField K M)
 


noncomputable def doubleCosetExtension :
    DoubleCoset.Quotient ((L.fixingSubgroup) : Set (M ≃ₐ[K] M)) (absoluteValueDecompositionGroup K w.val) →
      AbsoluteValueExtension vK L :=
  Quotient.lift
    (fun g : (M ≃ₐ[K] M) ↦
      restrictAbsoluteValueExtensionToIntermediate
        vK
        (absoluteValueExtensionConjugate
          vK w g⁻¹)
        L)
    (by
      intro g r hgr
      change
        DoubleCoset.setoid ((L.fixingSubgroup) : Set (M ≃ₐ[K] M)) ((absoluteValueDecompositionGroup K w.val) : Set (M ≃ₐ[K] M)) g r
        at hgr
      rw [DoubleCoset.rel_iff] at hgr
      obtain ⟨h, hh, d, hd, rfl⟩ := hgr
      apply Subtype.ext
      ext x
      change
        w.1 (g⁻¹ (x : M)) =
          w.1 (d⁻¹ (g⁻¹ (h⁻¹ (x : M))))
      have hhInv : h⁻¹ ∈ (L.fixingSubgroup) :=
        L.fixingSubgroup.inv_mem hh
      have hfix : h⁻¹ (x : M) = (x : M) :=
        hhInv x
      rw [hfix]
      have hdInv : d⁻¹ ∈ (absoluteValueDecompositionGroup K w.val) :=
        (absoluteValueDecompositionGroup K w.val).inv_mem hd
      have hdEq :=
        (mem_absoluteValueDecompositionGroup_iff_extensionConjugate_eq
          vK hvK w d⁻¹).mp hdInv
      have hvalue :=
        congrArg
          (fun z : AbsoluteValueExtension vK M ↦
            z.1 (g⁻¹ (x : M)))
          hdEq
      exact hvalue.symm)
@[simp]
theorem doubleCosetExtension_mk
    (g : (M ≃ₐ[K] M)) :
    doubleCosetExtension vK hvK w L
        (DoubleCoset.mk (L.fixingSubgroup) (absoluteValueDecompositionGroup K w.val) g) =
      restrictAbsoluteValueExtensionToIntermediate
        vK
        (absoluteValueExtensionConjugate
          vK w g⁻¹)
        L :=
  rfl
 

theorem doubleCosetExtension_surjective
    [FiniteDimensional K M] [IsGalois K M] :
    Function.Surjective
      (doubleCosetExtension vK hvK w L) := by
  intro u
  let w' : AbsoluteValueExtension vK M :=
    extendAbsoluteValueExtensionFromIntermediate
      vK hvK L u
  obtain ⟨g : (M ≃ₐ[K] M), hg⟩ :=
    absoluteValueConjugacy vK hvK w w'
  refine
    ⟨DoubleCoset.mk (L.fixingSubgroup) (absoluteValueDecompositionGroup K w.val) g⁻¹, ?_⟩
  rw [doubleCosetExtension_mk]
  apply Subtype.ext
  ext x
  change w.1 (g (x : M)) = u.1 x
  have hvalue :=
    congrArg
      (fun z : AbsoluteValueExtension vK M ↦
        z.1 (x : M))
      hg
  change w'.1 (x : M) = w.1 (g (x : M))
    at hvalue
  rw [← hvalue]
  exact
    extendAbsoluteValueExtensionFromIntermediate_apply
      vK hvK L u x
 



theorem doubleCosetExtension_injective
    [IsGalois K M] :
    Function.Injective
      (doubleCosetExtension vK hvK w L) := by
  intro q r hqr
  let g : (M ≃ₐ[K] M) := q.out
  let s : (M ≃ₐ[K] M) := r.out
  have hrestr :
      restrictAbsoluteValueExtensionToIntermediate
          vK
          (absoluteValueExtensionConjugate
            vK w g⁻¹)
          L =
        restrictAbsoluteValueExtensionToIntermediate
          vK
          (absoluteValueExtensionConjugate
            vK w s⁻¹)
          L := by
    calc
      _ = doubleCosetExtension vK hvK w L q := by
        rw [← DoubleCoset.out_eq' (L.fixingSubgroup) (absoluteValueDecompositionGroup K w.val) q]
        exact
          (doubleCosetExtension_mk
            vK hvK w L g).symm
      _ = doubleCosetExtension vK hvK w L r :=
        hqr
      _ = _ := by
        rw [← DoubleCoset.out_eq' (L.fixingSubgroup) (absoluteValueDecompositionGroup K w.val) r]
        exact
          doubleCosetExtension_mk
            vK hvK w L s
  let u :
      AbsoluteValueExtension vK L :=
    restrictAbsoluteValueExtensionToIntermediate
      vK
      (absoluteValueExtensionConjugate
        vK w g⁻¹)
      L
  let wG : AbsoluteValueExtension u.1 M :=
    absoluteValueExtensionOverIntermediate
      vK
      (absoluteValueExtensionConjugate
        vK w g⁻¹)
      L
  let wS : AbsoluteValueExtension u.1 M :=
    { val :=
        (absoluteValueExtensionConjugate
          vK w s⁻¹).1
      property := by
        intro x
        have hx :=
          congrArg
            (fun z : AbsoluteValueExtension vK L ↦
              z.1 x)
            hrestr
        change
          w.1 (s⁻¹ (x : M)) =
            w.1 (g⁻¹ (x : M))
        exact hx.symm }
  let hu : u.1.IsNontrivial :=
    u.isNontrivial hvK
  obtain ⟨η : M ≃ₐ[L] M, hη⟩ :=
    absoluteValueConjugacy u.1 hu wG wS
  let h : (M ≃ₐ[K] M) :=
    η.restrictScalars K
  have hh : h ∈ (L.fixingSubgroup) := by
    intro x
    exact η.commutes x
  let d : (M ≃ₐ[K] M) :=
    s⁻¹ * h⁻¹ * g
  have hdEq :
      absoluteValueExtensionConjugate
          vK w d = w := by
    apply Subtype.ext
    ext x
    have hx :=
      congrArg
        (fun z : AbsoluteValueExtension u.1 M ↦
          z.1 (η⁻¹ (g x)))
        hη
    change
      w.1 (s⁻¹ (η⁻¹ (g x))) =
        w.1 (g⁻¹ (η (η⁻¹ (g x))))
      at hx
    change
      w.1 (s⁻¹ (η⁻¹ (g x))) = w.1 x
    simpa using hx
  have hd : d ∈ (absoluteValueDecompositionGroup K w.val) :=
    (mem_absoluteValueDecompositionGroup_iff_extensionConjugate_eq
      vK hvK w d).mpr hdEq
  rw [← DoubleCoset.out_eq' (L.fixingSubgroup) (absoluteValueDecompositionGroup K w.val) q,
    ← DoubleCoset.out_eq' (L.fixingSubgroup) (absoluteValueDecompositionGroup K w.val) r,
    DoubleCoset.eq]
  refine
    ⟨h⁻¹, L.fixingSubgroup.inv_mem hh,
      d⁻¹,
      (absoluteValueDecompositionGroup K w.val).inv_mem hd,
      ?_⟩
  simp [d, g, s, mul_assoc]
 

noncomputable def doubleCosetExtensionEquiv
    [FiniteDimensional K M] [IsGalois K M] :
    DoubleCoset.Quotient ((L.fixingSubgroup) : Set (M ≃ₐ[K] M)) (absoluteValueDecompositionGroup K w.val) ≃
      AbsoluteValueExtension vK L :=
  Equiv.ofBijective
    (doubleCosetExtension vK hvK w L)
    ⟨doubleCosetExtension_injective
        vK hvK w L,
      doubleCosetExtension_surjective
        vK hvK w L⟩
end AbsoluteValueExtensions
section CompleteSplitting
variable {K E : Type}
    [Field K] [Field E] [Algebra K E]
    [FiniteDimensional K E]
 



def AbsoluteValueSplitsCompletelyInExtension
    (vK : AbsoluteValue K ℝ) : Prop :=
  Nat.card (AbsoluteValueExtension vK E) =
    Module.finrank K E
variable [NumberField K]
 

def FinitePlaceSplitsCompletelyInExtension
    (v : HeightOneSpectrum (𝓞 K)) : Prop :=
  AbsoluteValueSplitsCompletelyInExtension
    (E := E)
    (NumberField.HeightOneSpectrum.adicAbv K v)
end CompleteSplitting
section DoubleCosetCount
variable {K M : Type}
    [Field K] [Field M] [Algebra K M]
    [IsGalois K M]
 

theorem leftCosetDoubleCoset_card_eq_finrank
    (L : IntermediateField K M) :
    Nat.card
        (DoubleCoset.Quotient
          (L.fixingSubgroup : Set (M ≃ₐ[K] M))
          (⊥ : Subgroup (M ≃ₐ[K] M))) =
      Module.finrank K L := by
  calc
    Nat.card
        (DoubleCoset.Quotient
          (L.fixingSubgroup : Set (M ≃ₐ[K] M))
          (⊥ : Subgroup (M ≃ₐ[K] M))) =
        Nat.card
          (Quotient
            (QuotientGroup.rightRel
              L.fixingSubgroup)) := by
      rw [DoubleCoset.right_bot_eq_right_quot]
    _ = Nat.card ((M ≃ₐ[K] M) ⧸ L.fixingSubgroup) :=
      Nat.card_congr
        (QuotientGroup.quotientRightRelEquivQuotientLeftRel
          L.fixingSubgroup)
    _ = L.fixingSubgroup.index :=
      L.fixingSubgroup.index_eq_card.symm
    _ = Module.finrank K L :=
      (IntermediateField.finrank_eq_fixingSubgroup_index
        (F := K) (E' := M) L).symm
variable [FiniteDimensional K M]
variable (vK : AbsoluteValue K ℝ)
    (w : AbsoluteValueExtension vK M)
    (L : IntermediateField K M)
 


theorem absoluteValueSplitsCompletelyInExtension_iff_doubleCoset_card_eq
    (hvK : vK.IsNontrivial) :
    AbsoluteValueSplitsCompletelyInExtension
        (E := L) vK ↔
      Nat.card
          (DoubleCoset.Quotient
            (L.fixingSubgroup : Set (M ≃ₐ[K] M))
            (absoluteValueDecompositionGroup K w.1)) =
        Nat.card
          (DoubleCoset.Quotient
            (L.fixingSubgroup : Set (M ≃ₐ[K] M))
            (⊥ : Subgroup (M ≃ₐ[K] M))) := by
  unfold AbsoluteValueSplitsCompletelyInExtension
  rw [Nat.card_congr
      (doubleCosetExtensionEquiv
        vK hvK w L),
    leftCosetDoubleCoset_card_eq_finrank]
end DoubleCosetCount
section NormalClosure
variable {K M : Type}
    [Field K] [Field M] [Algebra K M]
    [FiniteDimensional K M] [IsGalois K M]
end NormalClosure
section FinitePlaces
variable {K M : Type}
    [Field K] [NumberField K]
    [Field M] [Algebra K M]
    [FiniteDimensional K M] [IsGalois K M]
 


theorem finitePlaceSplitsCompletelyInExtension_iff_doubleCoset_card_eq
    (L : IntermediateField K M)
    (v : HeightOneSpectrum (𝓞 K)) :
    FinitePlaceSplitsCompletelyInExtension
        (K := K) (E := L) v ↔
      Nat.card
          (DoubleCoset.Quotient
            (L.fixingSubgroup : Set (M ≃ₐ[K] M))
            (finitePlaceDecompositionGroup
              (K := K) (L := M) v)) =
        Nat.card
          (DoubleCoset.Quotient
            (L.fixingSubgroup : Set (M ≃ₐ[K] M))
            (⊥ : Subgroup (M ≃ₐ[K] M))) := by
  exact
    absoluteValueSplitsCompletelyInExtension_iff_doubleCoset_card_eq
      (NumberField.HeightOneSpectrum.adicAbv K v)
      (chosenFinitePlaceExtension (L := M) v)
      L
      (RayClass.adicAbv_isNontrivial v)
end FinitePlaces
section SplittingTransport
variable
    {K E E' : Type}
    [Field K]
    [Field E] [Algebra K E]
    [Field E'] [Algebra K E']
 

noncomputable def absoluteValueExtensionEquivOfAlgEquiv
    (v : AbsoluteValue K ℝ)
    (e : E ≃ₐ[K] E') :
    AbsoluteValueExtension v E ≃
      AbsoluteValueExtension v E' where
  toFun w :=
    { val :=
        w.1.comp (f := e.symm.toRingHom)
          e.symm.injective
      property := by
        intro x
        change w.1 (e.symm (algebraMap K E' x)) = v x
        rw [e.symm.commutes]
        exact w.2 x }
  invFun w :=
    { val :=
        w.1.comp (f := e.toRingHom)
          e.injective
      property := by
        intro x
        change w.1 (e (algebraMap K E x)) = v x
        rw [e.commutes]
        exact w.2 x }
  left_inv w := by
    apply Subtype.ext
    ext x
    change w.1 (e.symm (e x)) = w.1 x
    rw [e.symm_apply_apply]
  right_inv w := by
    apply Subtype.ext
    ext x
    change w.1 (e (e.symm x)) = w.1 x
    rw [e.apply_symm_apply]
variable [FiniteDimensional K E]
    [FiniteDimensional K E']
omit [FiniteDimensional K E] [FiniteDimensional K E'] in
 

theorem absoluteValueSplitsCompletelyInExtension_algEquiv
    (v : AbsoluteValue K ℝ)
    (e : E ≃ₐ[K] E') :
    AbsoluteValueSplitsCompletelyInExtension
        (E := E) v ↔
      AbsoluteValueSplitsCompletelyInExtension
        (E := E') v := by
  unfold AbsoluteValueSplitsCompletelyInExtension
  rw [Nat.card_congr
      (absoluteValueExtensionEquivOfAlgEquiv v e),
    e.toLinearEquiv.finrank_eq]
variable [NumberField K]
omit [FiniteDimensional K E] [FiniteDimensional K E'] in
 

theorem finitePlaceSplitsCompletelyInExtension_algEquiv
    (e : E ≃ₐ[K] E')
    (v : HeightOneSpectrum (𝓞 K)) :
    FinitePlaceSplitsCompletelyInExtension
        (K := K) (E := E) v ↔
      FinitePlaceSplitsCompletelyInExtension
        (K := K) (E := E') v :=
  absoluteValueSplitsCompletelyInExtension_algEquiv
    (NumberField.HeightOneSpectrum.adicAbv K v) e
end SplittingTransport
section GaloisSplittingBridge
variable
    {K E : Type}
    [Field K] [NumberField K]
    [Field E] [Algebra K E]
    [FiniteDimensional K E]
    [IsGalois K E]
 


theorem finitePlaceSplitsCompletely_iff_inExtension
    (v : HeightOneSpectrum (𝓞 K)) :
    FinitePlaceSplitsCompletely
        (K := K) (L := E) v ↔
      FinitePlaceSplitsCompletelyInExtension
        (K := K) (E := E) v := by
  let T : IntermediateField K E := ⊤
  let e : T ≃ₐ[K] E := by
    simpa only [T] using
      (IntermediateField.topEquiv :
        (⊤ : IntermediateField K E) ≃ₐ[K] E)
  have htransport :
      FinitePlaceSplitsCompletelyInExtension
          (K := K) (E := T) v ↔
        FinitePlaceSplitsCompletelyInExtension
          (K := K) (E := E) v :=
    finitePlaceSplitsCompletelyInExtension_algEquiv e v
  constructor
  · intro hsplit
    apply htransport.mp
    apply
      (finitePlaceSplitsCompletelyInExtension_iff_doubleCoset_card_eq
        (K := K) (M := E) T v).2
    rw [hsplit]
  · intro hsplit
    have hcard :=
      (finitePlaceSplitsCompletelyInExtension_iff_doubleCoset_card_eq
        (K := K) (M := E) T v).mp
        (htransport.mpr hsplit)
    change
      finitePlaceDecompositionGroup
          (K := K) (L := E) v =
        ⊥
    exact
      (doubleCoset_card_eq_leftCoset_iff_of_normalCore_eq_bot
        T.fixingSubgroup
        (finitePlaceDecompositionGroup
          (K := K) (L := E) v)
        (by
          simpa only
            [T, IntermediateField.fixingSubgroup_top]
            using
              (Subgroup.normalCore_eq_self
                (⊥ : Subgroup (E ≃ₐ[K] E))))).mp hcard
end GaloisSplittingBridge
section SplittingThroughRestriction
variable
    {K E N : Type}
    [Field K] [NumberField K]
    [Field E] [Algebra K E]
    [FiniteDimensional K E] [IsGalois K E]
    [Field N] [Algebra K N] [Algebra E N]
    [IsScalarTower K E N]
    [FiniteDimensional K N] [IsGalois K N]
 


theorem
    finitePlaceSplitsCompletely_of_decompositionGroup_le_restrictNormalHom_ker
    (v : HeightOneSpectrum (𝓞 K))
    (h :
      finitePlaceDecompositionGroup (K := K) (L := N) v ≤
        (AlgEquiv.restrictNormalHom
          (F := K) (K₁ := N) (E := E)).ker) :
    FinitePlaceSplitsCompletely (K := K) (L := E) v := by
  let M : IntermediateField K N :=
    (IsScalarTower.toAlgHom K E N).fieldRange
  let e : E ≃ₐ[K] M :=
    (IsScalarTower.toAlgHom K E N).equivFieldRange
  let : FiniteDimensional K M :=
    e.toLinearEquiv.finiteDimensional
  let : IsGalois K M :=
    IsGalois.of_algEquiv e
  let vK :=
    NumberField.HeightOneSpectrum.adicAbv K v
  let hvK : vK.IsNontrivial :=
    RayClass.adicAbv_isNontrivial v
  let wN :=
    chosenFinitePlaceExtension (L := N) v
  let wM :=
    restrictAbsoluteValueExtensionToIntermediate
      vK wN M
  have hFix :
      finitePlaceDecompositionGroup (K := K) (L := N) v ≤
        M.fixingSubgroup := by
    intro sigma hsigma
    rw [IntermediateField.mem_fixingSubgroup_iff]
    intro y hy
    rcases hy with ⟨x, rfl⟩
    have hsigmaKer :
        AlgEquiv.restrictNormalHom
            (F := K) (K₁ := N) (E := E) sigma =
          1 :=
      MonoidHom.mem_ker.mp (h hsigma)
    have hx :
        sigma.restrictNormal E x = x := by
      change
        (AlgEquiv.restrictNormalHom
          (F := K) (K₁ := N) (E := E) sigma) x =
            (1 : Gal(E/K)) x
      rw [hsigmaKer]
    calc
      sigma (algebraMap E N x) =
          algebraMap E N (sigma.restrictNormal E x) :=
        (AlgEquiv.restrictNormal_commutes sigma E x).symm
      _ = algebraMap E N x :=
        congrArg (algebraMap E N) hx
  have hMap :
      (finitePlaceDecompositionGroup
          (K := K) (L := N) v).map
          (AlgEquiv.restrictNormalHom
            (F := K) (K₁ := N) M) =
        ⊥ := by
    rw [Subgroup.map_eq_bot_iff,
      IntermediateField.restrictNormalHom_ker]
    exact hFix
  have hwMbot :
      absoluteValueDecompositionGroup K wM.1 = ⊥ := by
    change
      absoluteValueDecompositionGroup K
        (wN.1.comp (f := algebraMap M N)
          (algebraMap M N).injective) = ⊥
    rw [← absoluteValueDecompositionGroup_map_restrictNormalHom
      (M := M) vK hvK wN]
    exact hMap
  have hM :
      FinitePlaceSplitsCompletely
        (K := K) (L := M) v := by
    change
      absoluteValueDecompositionGroup K
          (chosenFinitePlaceExtension (L := M) v).1 =
        ⊥
    exact
      absoluteValueDecompositionGroup_eq_bot_independent_extension
        vK hvK wM
        (chosenFinitePlaceExtension (L := M) v)
        hwMbot
  have hMIntrinsic :
      FinitePlaceSplitsCompletelyInExtension
        (K := K) (E := M) v :=
    (finitePlaceSplitsCompletely_iff_inExtension
      (K := K) (E := M) v).mp hM
  have hEIntrinsic :
      FinitePlaceSplitsCompletelyInExtension
        (K := K) (E := E) v :=
    (finitePlaceSplitsCompletelyInExtension_algEquiv e v).mpr
      hMIntrinsic
  exact
    (finitePlaceSplitsCompletely_iff_inExtension
      (K := K) (E := E) v).mpr hEIntrinsic
end SplittingThroughRestriction
section FiniteNormalClosure
variable
    (K L : Type)
    [Field K] [NumberField K]
    [Field L] [NumberField L] [Algebra K L]
end FiniteNormalClosure
end
end

/- GaloisCohomology.Kummer.Concrete.RootCharacters -/
section
namespace KummerTheory
open groupCohomology
section RootQuotientPrelim
variable {L : Type*} [Field L]
 
theorem div_pow_eq_one_of_pow_eq_pow
    {n : ℕ} {u v : Lˣ} (h : u ^ n = v ^ n) :
    (u / v) ^ n = 1 := by
  rw [div_pow, h]
  exact div_self' (v ^ n)
end RootQuotientPrelim
section TorsionSubgroups
variable (L : Type*) [Field L]
end TorsionSubgroups
section RootQuotients
variable {K L : Type*} [Field K] [Field L] [Algebra K L]
end RootQuotients
section RadicalData
variable {K L : Type*} [Field K] [Field L] [Algebra K L]
namespace RadicalDatum
end RadicalDatum
end RadicalData
end KummerTheory
end

/- ClassFieldTheory.KummerTheory.Concrete.FinitePlaceDecomposition -/
section
open scoped NumberField Classical
open NumberField IsDedekindDomain
open AlgebraicNumberTheory.Valuations
open HilbertRamification
noncomputable section
namespace KummerTheory
variable {K L : Type}
    [Field K] [NumberField K]
    [Field L] [Algebra K L]
    [FiniteDimensional K L] [IsGalois K L]
omit [NumberField K] [FiniteDimensional K L] in
 



theorem
    kummerRadicand_root_mem_decompositionFixedField_of_mem_nthPowerSubgroup
    (vK : AbsoluteValue K ℝ)
    (hvK : vK.IsNontrivial)
    (w : AbsoluteValueExtension vK L)
    (n : ℕ+)
    (hmu : (primitiveRoots (n : ℕ) K).Nonempty)
    (a : Kˣ) (beta : Lˣ)
    (hbeta :
      beta ^ (n : ℕ) =
        Units.map (algebraMap K L).toMonoidHom a)
    (ha :
      Units.map
            (algebraMap K vK.Completion).toMonoidHom a ∈
        (powMonoidHom (n : ℕ) :
          vK.Completionˣ →* vK.Completionˣ).range) :
    (beta : L) ∈
      IntermediateField.fixedField
        (absoluteValueDecompositionGroup K w.1) := by
  let : NeZero (n : ℕ) := ⟨n.ne_zero⟩
  let hK :=
    AbsoluteValue.extensionCompletionAlgebra
      (K := K) w.1
  let : SMul K w.1.Completion := hK.toSMul
  let : Algebra vK.Completion w.1.Completion :=
    AbsoluteValue.completionAlgebra vK w.1 w.2
  let := LocalClassFieldTheory.localizedCompletionGlobalAlgebra vK w
  let := LocalClassFieldTheory.localizedCompletionIsScalarTower vK w
  let C := vK.Completion
  let E := LocalizedCompletion vK w
  let toE :=
    AbsoluteValue.toAlgebraicLocalization vK w.1 w.2
  let aC : Cˣ :=
    Units.map (algebraMap K C).toMonoidHom a
  have hbeta_val :
      (beta : L) ^ (n : ℕ) =
        algebraMap K L (a : K) := by
    simpa using congrArg Units.val hbeta
  obtain ⟨yC, hyC⟩ :=
    (MonoidHom.mem_range
      (G := Cˣ)).mp ha
  rw [powMonoidHom_apply] at hyC
  let betaE : Eˣ :=
    Units.map toE.toMonoidHom beta
  let yE : Eˣ :=
    Units.map (algebraMap C E).toMonoidHom yC
  have hbetaE :
      betaE ^ (n : ℕ) =
        Units.map (algebraMap C E).toMonoidHom aC := by
    apply Units.ext
    change
      toE (beta : L) ^ (n : ℕ) =
        algebraMap C E (algebraMap K C (a : K))
    calc
      toE (beta : L) ^ (n : ℕ) =
          toE ((beta : L) ^ (n : ℕ)) := by
        exact
          (map_pow toE (beta : L) (n : ℕ)).symm
      _ = toE (algebraMap K L (a : K)) := by
        rw [hbeta_val]
      _ = algebraMap C E (algebraMap K C (a : K)) :=
        AbsoluteValue.toAlgebraicLocalization_algebraMap
          vK w.1 w.2 (a : K)
  have hyE :
      yE ^ (n : ℕ) =
        Units.map (algebraMap C E).toMonoidHom aC := by
    calc
      yE ^ (n : ℕ) =
          Units.map (algebraMap C E).toMonoidHom
            (yC ^ (n : ℕ)) := by
        exact
          (map_pow
            (Units.map (algebraMap C E).toMonoidHom)
            yC (n : ℕ)).symm
      _ = Units.map (algebraMap C E).toMonoidHom aC := by
        rw [hyC]
  let q : Eˣ := betaE / yE
  have hq : q ^ (n : ℕ) = 1 :=
    KummerTheory.div_pow_eq_one_of_pow_eq_pow
      (hbetaE.trans hyE.symm)
  obtain ⟨zeta, hzeta_mem⟩ := hmu
  have hzeta :
      IsPrimitiveRoot zeta (n : ℕ) :=
    (mem_primitiveRoots n.pos).mp hzeta_mem
  have hzetaE :
      IsPrimitiveRoot
        (algebraMap C E (algebraMap K C zeta))
        (n : ℕ) :=
    (hzeta.map_of_injective
        (algebraMap K C).injective).map_of_injective
      (algebraMap C E).injective
  have hq_val :
      (q : E) ^ (n : ℕ) = 1 := by
    simpa using congrArg Units.val hq
  obtain ⟨i, _hi, hzetaq⟩ :=
    hzetaE.eq_pow_of_pow_eq_one hq_val
  have hbeta_base :
      toE (beta : L) ∈
        Set.range (algebraMap C E) := by
    refine
      ⟨(algebraMap K C zeta) ^ i * (yC : C), ?_⟩
    calc
      algebraMap C E
            ((algebraMap K C zeta) ^ i * (yC : C)) =
          (algebraMap C E (algebraMap K C zeta)) ^ i *
            algebraMap C E (yC : C) := by
        rw [map_mul, map_pow]
      _ = (q : E) * (yE : E) := by
        rw [hzetaq]
        rfl
      _ = toE (beta : L) := by
        simpa [betaE] using
          congrArg Units.val
            (show q * yE = betaE by simp [q])
  have hcomap :
      (beta : L) ∈
        ((algebraMap C E).fieldRange).comap toE :=
    hbeta_base
  rw [
    LocalClassFieldTheory.localizedCompletion_baseField_comap_eq_fixedField_decompositionGroup
      vK hvK w] at hcomap
  simpa [C, E, toE] using hcomap
 


theorem
    finitePlaceKummerRadicand_mem_nthPowerSubgroup_iff_root_mem_decompositionFixedField
    (v : HeightOneSpectrum (𝓞 K))
    (n : ℕ+)
    (hmu : (primitiveRoots (n : ℕ) K).Nonempty)
    (a : Kˣ) (beta : Lˣ)
    (hbeta :
      beta ^ (n : ℕ) =
        Units.map (algebraMap K L).toMonoidHom a) :
    Units.map
          (algebraMap K (v.adicCompletion K)).toMonoidHom a ∈
        (powMonoidHom (n : ℕ) :
          (v.adicCompletion K)ˣ →*
            (v.adicCompletion K)ˣ).range ↔
      (beta : L) ∈
        IntermediateField.fixedField
          (absoluteValueDecompositionGroup K
            (chosenFinitePlaceExtension (L := L) v).1) := by
  let : NeZero (n : ℕ) := ⟨n.ne_zero⟩
  let vK := HeightOneSpectrum.adicAbv K v
  let w := chosenFinitePlaceExtension (L := L) v
  let hvK : vK.IsNontrivial :=
    RayClass.adicAbv_isNontrivial v
  let hK :=
    AbsoluteValue.extensionCompletionAlgebra
      (K := K) w.1
  let : SMul K w.1.Completion := hK.toSMul
  let : Algebra vK.Completion w.1.Completion :=
    AbsoluteValue.completionAlgebra vK w.1 w.2
  let := LocalClassFieldTheory.localizedCompletionGlobalAlgebra vK w
  let := LocalClassFieldTheory.localizedCompletionIsScalarTower vK w
  let C := vK.Completion
  let E := LocalizedCompletion vK w
  let toE :=
    AbsoluteValue.toAlgebraicLocalization vK w.1 w.2
  let e :
      Cˣ ≃ₜ* (v.adicCompletion K)ˣ :=
    finitePlaceCompletionUnitsContinuousMulEquiv v
  let aC : Cˣ :=
    Units.map (algebraMap K C).toMonoidHom a
  have he_base (u : Kˣ) :
      e (Units.map (algebraMap K C).toMonoidHom u) =
        Units.map
          (algebraMap K (v.adicCompletion K)).toMonoidHom u := by
    apply Units.ext
    let x : WithAbs vK :=
      (WithAbs.equiv vK).symm (u : K)
    change
      finitePlaceCompletionRingHom v (x : C) =
        algebraMap K (v.adicCompletion K) (u : K)
    rw [finitePlaceCompletionRingHom_coe]
    rfl
  have hbeta_val :
      (beta : L) ^ (n : ℕ) =
        algebraMap K L (a : K) := by
    simpa using congrArg Units.val hbeta
  constructor
  · intro ha
    apply
      kummerRadicand_root_mem_decompositionFixedField_of_mem_nthPowerSubgroup
        (K := K) (L := L) vK hvK w n hmu a beta hbeta
    obtain ⟨y, hy⟩ :=
      (MonoidHom.mem_range
        (G := (v.adicCompletion K)ˣ)).mp ha
    rw [powMonoidHom_apply] at hy
    apply
      (MonoidHom.mem_range
        (G := Cˣ)).mpr
    refine ⟨e.symm y, ?_⟩
    rw [powMonoidHom_apply]
    apply e.injective
    calc
      e ((e.symm y) ^ (n : ℕ)) =
          (e (e.symm y)) ^ (n : ℕ) :=
        map_pow e (e.symm y) (n : ℕ)
      _ = y ^ (n : ℕ) := by
        rw [e.apply_symm_apply]
      _ =
          Units.map
            (algebraMap K
              (v.adicCompletion K)).toMonoidHom a := hy
      _ = e aC := (he_base a).symm
  · intro hfixed
    have hcomap :
        (beta : L) ∈
          ((algebraMap C E).fieldRange).comap toE := by
      rw [
        LocalClassFieldTheory.localizedCompletion_baseField_comap_eq_fixedField_decompositionGroup
          vK hvK w]
      simpa [vK, w] using hfixed
    change
      toE (beta : L) ∈ Set.range (algebraMap C E)
      at hcomap
    obtain ⟨y, hy⟩ := hcomap
    have hy_ne : y ≠ 0 := by
      intro hy_zero
      have hbeta_zero : (beta : L) = 0 := by
        apply toE.injective
        calc
          toE (beta : L) =
              algebraMap C E y := hy.symm
          _ = 0 := by rw [hy_zero, map_zero]
          _ = toE 0 := (map_zero toE).symm
      exact beta.ne_zero hbeta_zero
    let yC : Cˣ := Units.mk0 y hy_ne
    have hyC : yC ^ (n : ℕ) = aC := by
      apply Units.ext
      apply (algebraMap C E).injective
      change
        algebraMap C E (y ^ (n : ℕ)) =
          algebraMap C E (algebraMap K C (a : K))
      calc
        algebraMap C E (y ^ (n : ℕ)) =
            (algebraMap C E y) ^ (n : ℕ) := by
          exact
            map_pow (algebraMap C E) y (n : ℕ)
        _ = toE (beta : L) ^ (n : ℕ) := by
          rw [hy]
        _ = toE ((beta : L) ^ (n : ℕ)) := by
          exact
            (map_pow toE (beta : L) (n : ℕ)).symm
        _ = toE (algebraMap K L (a : K)) := by
          rw [hbeta_val]
        _ = algebraMap C E (algebraMap K C (a : K)) :=
          AbsoluteValue.toAlgebraicLocalization_algebraMap
            vK w.1 w.2 (a : K)
    apply
      (MonoidHom.mem_range
        (G := (v.adicCompletion K)ˣ)).mpr
    refine ⟨e yC, ?_⟩
    rw [powMonoidHom_apply]
    calc
      (e yC) ^ (n : ℕ) =
          e (yC ^ (n : ℕ)) := by
        exact
          (map_pow e yC (n : ℕ)).symm
      _ = e aC := by rw [hyC]
      _ =
          Units.map
            (algebraMap K
              (v.adicCompletion K)).toMonoidHom a :=
        he_base a
end KummerTheory
end
end

namespace TunnellKummerSupportGroups
theorem powers_mem {W:Type} [Field W] (n:ℕ+) (x:Wˣ):
     x∈(powMonoidHom (n:ℕ):Wˣ→*Wˣ).range ↔ ∃ y:W,y^(n:ℕ)=x.val:=by
   constructor
   · rintro ⟨u,rfl⟩;exact ⟨u.val,rfl⟩
   · rintro ⟨y,hy⟩
     have h:y≠0:=by rintro rfl;rw [zero_pow n.ne_zero] at hy;exact x.ne_zero hy.symm
     exact ⟨Units.mk0 y h,Units.ext hy⟩
end TunnellKummerSupportGroups

namespace TunnellFrobeniusTransfer
open NumberField IsDedekindDomain KummerTheory TunnellKummerSupportGroups
open AlgebraicNumberTheory.Valuations HilbertRamification
open scoped NumberField Classical IsMulCommutative
noncomputable section
theorem transfer : OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H3_R1_H1_R1_H3_R1_H2_R1_H1_R1_H1_R1_H2_R1.H2 := by
  intro D _ _ E N _ _ _ _
  dsimp only
  intro hp hmu hEN _ _ g _ fix v ht
  letI : NumberField E:=NumberField.of_module_finite D E
  letI : NumberField N:=NumberField.of_module_finite D N
  letI alg : Algebra E N:=(IntermediateField.inclusion hEN).toRingHom.toAlgebra
  letI : SMul E N:=@Algebra.toSMul _ _ _ _ alg
  letI : IsScalarTower D E N:=IsScalarTower.of_algebraMap_eq' (R:=D) (S:=E) (A:=N) rfl
  let p:=Module.finrank D E
  let n:ℕ+:=⟨p,hp.pos⟩
  let z:=chosenFinitePlaceExtension (L:=N) v
  let t:=finitePlaceExtensionCentre (K:=D) (L:=N) v z
  have below:finitePlaceBelow (K:=D) t=v := finitePlaceBelow_finitePlaceExtensionCentre v z
  have lie:t.asIdeal.LiesOver v.asIdeal:=⟨(congrArg HeightOneSpectrum.asIdeal below).symm⟩
  have group:finitePlaceDecompositionGroup (K:=D) (L:=N) v=Subgroup.zpowers g := by
    letI:=finitePlaceMulAction D N
    change absoluteValueDecompositionGroup D z.1=_
    rw [absoluteValueDecompositionGroup_eq_finitePlaceStabilizer]
    exact Subgroup.ext (fun a=>ht t lie a)
  constructor
  · intro t hlie a ha
    have restr:g ∈ (AlgEquiv.restrictNormalHom (F:=D) (K₁:=N) (E:=E)).ker := by
      change g.restrictNormal E=1
      apply AlgEquiv.ext
      intro y
      apply (algebraMap E N).injective
      exact (AlgEquiv.restrictNormal_commutes g E y).trans (fix _ y.property)
    have hs:=finitePlaceSplitsCompletely_of_decompositionGroup_le_restrictNormalHom_ker
      (K:=D) (E:=E) (N:=N) v (group ▸ Subgroup.zpowers_le.mpr restr)
    letI:=finitePlaceMulAction D E
    have bot:MulAction.stabilizer Gal(E/D) t=⊥:=(finitePlaceSplitsCompletely_iff_stabilizer_eq_bot v t (HeightOneSpectrum.ext hlie.over.symm)).mp hs
    exact Subgroup.mem_bot.mp (bot ▸ (show a∈MulAction.stabilizer Gal(E/D) t from ha))
  · intro x z hz hy
    have hn:z≠0 := by
      intro h;rw [h,zero_pow hp.ne_zero] at hz
      exact x.ne_zero ((algebraMap D N).injective (by rw [map_zero];exact hz.symm))
    let u:=Units.mk0 z hn
    have hu:u^p=Units.map (algebraMap D N).toMonoidHom x:=Units.ext hz
    have mem:=(finitePlaceKummerRadicand_mem_nthPowerSubgroup_iff_root_mem_decompositionFixedField
      (K:=D) (L:=N) v n hmu x u hu).mp ((powers_mem n _).mpr hy)
    rw [IntermediateField.mem_fixedField_iff] at mem
    exact mem g (show g∈finitePlaceDecompositionGroup (K:=D) (L:=N) v from group ▸ Subgroup.mem_zpowers g)
end
end TunnellFrobeniusTransfer

theorem OMA.solution : OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H3_R1_H1_R1_H3_R1_H2_R1_H1_R1_H1_R1_H2_R1.H2 := TunnellFrobeniusTransfer.transfer
