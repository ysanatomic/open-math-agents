import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1_H2_R1_H1_R1
import Mathlib

/-! The normalized order of a completion norm is multiplied by the residue degree. Portions of the proof are adapted from ClassFieldTheory, revision 2e6280f9d2579705a0cc6c76ec68c2b60f9c601a. -/
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
 
theorem denseRange_toCompletion
    {K : Type u} [Field K] (vK : AbsoluteValue K ℝ) :
    DenseRange (toCompletion vK) := by
  change DenseRange
    (UniformSpace.Completion.coe' ∘ WithAbs.toAbs vK)
  exact
    (@UniformSpace.Completion.denseRange_coe (WithAbs vK) inferInstance).comp
      (WithAbs.toAbs_surjective vK).denseRange
      (@UniformSpace.Completion.continuous_coe (WithAbs vK) inferInstance)
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
 
def AbsoluteValueExtensionConjugateOverCompletion
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ)
    (tau tau' : L →ₐ[K] absoluteValueExtension_algebraicCompletionClosure vK) : Prop :=
  ∃ sigma : absoluteValueExtension_algebraicCompletionClosure vK ≃ₐ[vK.Completion]
      absoluteValueExtension_algebraicCompletionClosure vK,
    ∀ x : L, tau' x = sigma (tau x)
 

theorem absoluteValueExtension_algebraicClosureAbsoluteValue_algEquiv
    {K : Type u} [Field K] (vK : AbsoluteValue K ℝ)
    (hvK : vK.IsNontrivial)
    (sigma : absoluteValueExtension_algebraicCompletionClosure vK
      ≃ₐ[vK.Completion] absoluteValueExtension_algebraicCompletionClosure vK)
    (x : absoluteValueExtension_algebraicCompletionClosure vK) :
    absoluteValueExtension_algebraicClosureAbsoluteValue vK hvK (sigma x) =
      absoluteValueExtension_algebraicClosureAbsoluteValue vK hvK x := by
  let R := AbsoluteValue.uniqueAlgebraicExtension
    (K := vK.Completion)
    (L := absoluteValueExtension_algebraicCompletionClosure vK)
    (AbsoluteValue.completionAbsoluteValue vK)
    (AbsoluteValue.completionAbsoluteValue_complete vK)
    (AbsoluteValue.completionAbsoluteValue_isNontrivial vK hvK)
  let a : AbsoluteValue (absoluteValueExtension_algebraicCompletionClosure vK) ℝ :=
    (absoluteValueExtension_algebraicClosureAbsoluteValue vK hvK).comp
      (f := sigma.toRingHom) sigma.injective
  have ha : a = absoluteValueExtension_algebraicClosureAbsoluteValue vK hvK := by
    change a = R.extension
    apply R.unique
    intro y
    change absoluteValueExtension_algebraicClosureAbsoluteValue vK hvK
      (sigma (algebraMap vK.Completion
        (absoluteValueExtension_algebraicCompletionClosure vK) y)) = _
    rw [sigma.commutes]
    exact absoluteValueExtension_algebraicClosureAbsoluteValue_algebraMap vK hvK y
  exact congrArg (fun b : AbsoluteValue _ ℝ => b x) ha
 
theorem absoluteValueExtension_pullback_eq_of_conjugate
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    {tau tau' : L →ₐ[K] absoluteValueExtension_algebraicCompletionClosure vK}
    (hconj : AbsoluteValueExtensionConjugateOverCompletion vK tau tau') :
    absoluteValueExtension_pullback vK hvK tau =
      absoluteValueExtension_pullback vK hvK tau' := by
  rcases hconj with ⟨sigma, hsigma⟩
  ext x
  change absoluteValueExtension_algebraicClosureAbsoluteValue vK hvK (tau x) =
    absoluteValueExtension_algebraicClosureAbsoluteValue vK hvK (tau' x)
  rw [hsigma x, absoluteValueExtension_algebraicClosureAbsoluteValue_algEquiv]
 
noncomputable def absoluteValueExtension_algebraicClosureToCompletionRingHom
    {K : Type u} [Field K] (vK : AbsoluteValue K ℝ)
    (hvK : vK.IsNontrivial) :
    absoluteValueExtension_algebraicCompletionClosure vK →+*
      (absoluteValueExtension_algebraicClosureAbsoluteValue vK hvK).Completion :=
  UniformSpace.Completion.coeRingHom.comp
    (WithAbs.equiv
      (absoluteValueExtension_algebraicClosureAbsoluteValue vK hvK)).symm.toRingHom
@[simp]
theorem absoluteValueExtension_algebraicClosureToCompletionRingHom_apply
    {K : Type u} [Field K] (vK : AbsoluteValue K ℝ)
    (hvK : vK.IsNontrivial)
    (x : absoluteValueExtension_algebraicCompletionClosure vK) :
    absoluteValueExtension_algebraicClosureToCompletionRingHom vK hvK x =
      ((WithAbs.equiv
        (absoluteValueExtension_algebraicClosureAbsoluteValue vK hvK)).symm x :
          (absoluteValueExtension_algebraicClosureAbsoluteValue vK hvK).Completion) :=
  rfl
 


noncomputable def absoluteValueExtension_algebraicClosureCompletionAlgebra
    {K : Type u} [Field K] (vK : AbsoluteValue K ℝ)
    (hvK : vK.IsNontrivial) :
    Algebra vK.Completion
      (absoluteValueExtension_algebraicClosureAbsoluteValue vK hvK).Completion :=
  ((absoluteValueExtension_algebraicClosureToCompletionRingHom vK hvK).comp
    (algebraMap vK.Completion
      (absoluteValueExtension_algebraicCompletionClosure vK))).toAlgebra
 
noncomputable def absoluteValueExtension_algebraicClosureToCompletionAlgHom
    {K : Type u} [Field K] (vK : AbsoluteValue K ℝ)
    (hvK : vK.IsNontrivial) :
    letI := absoluteValueExtension_algebraicClosureCompletionAlgebra vK hvK
    absoluteValueExtension_algebraicCompletionClosure vK →ₐ[vK.Completion]
      (absoluteValueExtension_algebraicClosureAbsoluteValue vK hvK).Completion := by
  letI := absoluteValueExtension_algebraicClosureCompletionAlgebra vK hvK
  exact
    { __ := absoluteValueExtension_algebraicClosureToCompletionRingHom vK hvK
      commutes' _ := rfl }
 

noncomputable def absoluteValueExtension_embeddingToAlgebraicClosureCompletionRingHom
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (w : AbsoluteValueExtension vK L)
    (tau : L →ₐ[K] absoluteValueExtension_algebraicCompletionClosure vK) :
    WithAbs w.1 →+*
      (absoluteValueExtension_algebraicClosureAbsoluteValue vK hvK).Completion :=
  (absoluteValueExtension_algebraicClosureToCompletionRingHom vK hvK).comp
    (tau.toRingHom.comp (WithAbs.equiv w.1).toRingHom)
theorem absoluteValueExtension_embeddingToAlgebraicClosureCompletion_norm
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (w : AbsoluteValueExtension vK L)
    (tau : L →ₐ[K] absoluteValueExtension_algebraicCompletionClosure vK)
    (htau : w.1 = absoluteValueExtension_pullback vK hvK tau)
    (x : WithAbs w.1) :
    ‖absoluteValueExtension_embeddingToAlgebraicClosureCompletionRingHom
        vK hvK w tau x‖ = ‖x‖ := by
  change ‖absoluteValueExtension_algebraicClosureToCompletionRingHom vK hvK
    (tau (WithAbs.equiv w.1 x))‖ = ‖x‖
  rw [absoluteValueExtension_algebraicClosureToCompletionRingHom_apply,
    UniformSpace.Completion.norm_coe, WithAbs.norm_eq_apply_ofAbs,
    WithAbs.norm_eq_apply_ofAbs]
  have h := congrArg (fun a : AbsoluteValue L ℝ =>
    a (WithAbs.equiv w.1 x)) htau
  exact h.symm
 

theorem absoluteValueExtension_embeddingToAlgebraicClosureCompletion_isometry
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (w : AbsoluteValueExtension vK L)
    (tau : L →ₐ[K] absoluteValueExtension_algebraicCompletionClosure vK)
    (htau : w.1 = absoluteValueExtension_pullback vK hvK tau) :
    Isometry (absoluteValueExtension_embeddingToAlgebraicClosureCompletionRingHom
      vK hvK w tau) :=
  AddMonoidHomClass.isometry_of_norm _
    (absoluteValueExtension_embeddingToAlgebraicClosureCompletion_norm
      vK hvK w tau htau)
 
noncomputable def absoluteValueExtension_embeddingCompletionMap
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (w : AbsoluteValueExtension vK L)
    (tau : L →ₐ[K] absoluteValueExtension_algebraicCompletionClosure vK)
    (htau : w.1 = absoluteValueExtension_pullback vK hvK tau) :
    w.1.Completion →+*
      (absoluteValueExtension_algebraicClosureAbsoluteValue vK hvK).Completion :=
  (absoluteValueExtension_embeddingToAlgebraicClosureCompletion_isometry
    vK hvK w tau htau).extensionHom
@[simp]
theorem absoluteValueExtension_embeddingCompletionMap_coe
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (w : AbsoluteValueExtension vK L)
    (tau : L →ₐ[K] absoluteValueExtension_algebraicCompletionClosure vK)
    (htau : w.1 = absoluteValueExtension_pullback vK hvK tau)
    (x : WithAbs w.1) :
    absoluteValueExtension_embeddingCompletionMap vK hvK w tau htau
        (x : w.1.Completion) =
      absoluteValueExtension_embeddingToAlgebraicClosureCompletionRingHom
        vK hvK w tau x :=
  (absoluteValueExtension_embeddingToAlgebraicClosureCompletion_isometry
    vK hvK w tau htau).extensionHom_coe x
 
theorem absoluteValueExtension_embeddingCompletionMap_isometry
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (w : AbsoluteValueExtension vK L)
    (tau : L →ₐ[K] absoluteValueExtension_algebraicCompletionClosure vK)
    (htau : w.1 = absoluteValueExtension_pullback vK hvK tau) :
    Isometry (absoluteValueExtension_embeddingCompletionMap vK hvK w tau htau) :=
  (absoluteValueExtension_embeddingToAlgebraicClosureCompletion_isometry
    vK hvK w tau htau).completion_extension
 

theorem absoluteValueExtension_completionToAlgebraicClosureCompletion_isometry
    {K : Type u} [Field K] (vK : AbsoluteValue K ℝ)
    (hvK : vK.IsNontrivial) :
    Isometry ((absoluteValueExtension_algebraicClosureToCompletionRingHom vK hvK).comp
      (algebraMap vK.Completion
        (absoluteValueExtension_algebraicCompletionClosure vK))) := by
  apply AddMonoidHomClass.isometry_of_norm
  intro x
  change ‖absoluteValueExtension_algebraicClosureToCompletionRingHom vK hvK
    (algebraMap vK.Completion
      (absoluteValueExtension_algebraicCompletionClosure vK) x)‖ = ‖x‖
  rw [absoluteValueExtension_algebraicClosureToCompletionRingHom_apply,
    UniformSpace.Completion.norm_coe, WithAbs.norm_eq_apply_ofAbs]
  change absoluteValueExtension_algebraicClosureAbsoluteValue vK hvK
    (algebraMap vK.Completion
      (absoluteValueExtension_algebraicCompletionClosure vK) x) = ‖x‖
  rw [absoluteValueExtension_algebraicClosureAbsoluteValue_algebraMap]
  rfl
 


theorem absoluteValueExtension_embeddingCompletionMap_completionMap
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (w : AbsoluteValueExtension vK L)
    (tau : L →ₐ[K] absoluteValueExtension_algebraicCompletionClosure vK)
    (htau : w.1 = absoluteValueExtension_pullback vK hvK tau)
    (x : vK.Completion) :
    absoluteValueExtension_embeddingCompletionMap vK hvK w tau htau
        (AbsoluteValue.completionMap vK w.1 w.2 x) =
      absoluteValueExtension_algebraicClosureToCompletionRingHom vK hvK
        (algebraMap vK.Completion
          (absoluteValueExtension_algebraicCompletionClosure vK) x) := by
  let f := (absoluteValueExtension_embeddingCompletionMap vK hvK w tau htau).comp
    (AbsoluteValue.completionMap vK w.1 w.2)
  let g := (absoluteValueExtension_algebraicClosureToCompletionRingHom vK hvK).comp
    (algebraMap vK.Completion
      (absoluteValueExtension_algebraicCompletionClosure vK))
  change f x = g x
  refine UniformSpace.Completion.induction_on (α := WithAbs vK) x ?_ ?_
  · exact isClosed_eq
      ((absoluteValueExtension_embeddingCompletionMap_isometry
          vK hvK w tau htau).continuous.comp
        (AbsoluteValue.completionMap_isometry vK w.1 w.2).continuous)
      (absoluteValueExtension_completionToAlgebraicClosureCompletion_isometry
        vK hvK).continuous
  · intro a
    dsimp [f, g]
    change absoluteValueExtension_embeddingCompletionMap vK hvK w tau htau
        (AbsoluteValue.completionMap vK w.1 w.2
          (algebraMap K vK.Completion (WithAbs.equiv vK a))) =
      absoluteValueExtension_algebraicClosureToCompletionRingHom vK hvK
        (algebraMap vK.Completion
          (absoluteValueExtension_algebraicCompletionClosure vK)
          (algebraMap K vK.Completion (WithAbs.equiv vK a)))
    rw [AbsoluteValue.completionMap_coe]
    change absoluteValueExtension_embeddingCompletionMap vK hvK w tau htau
        (((algebraMap (WithAbs vK) (WithAbs w.1)) a : WithAbs w.1) :
          w.1.Completion) =
      absoluteValueExtension_algebraicClosureToCompletionRingHom vK hvK
        (algebraMap vK.Completion
          (absoluteValueExtension_algebraicCompletionClosure vK)
            (a : vK.Completion))
    rw [absoluteValueExtension_embeddingCompletionMap_coe]
    change absoluteValueExtension_algebraicClosureToCompletionRingHom vK hvK
        (tau (algebraMap K L (WithAbs.equiv vK a))) =
      absoluteValueExtension_algebraicClosureToCompletionRingHom vK hvK
        (algebraMap vK.Completion
          (absoluteValueExtension_algebraicCompletionClosure vK)
            (algebraMap K vK.Completion (WithAbs.equiv vK a)))
    congr 1
    rw [tau.commutes,
      IsScalarTower.algebraMap_apply K vK.Completion
        (absoluteValueExtension_algebraicCompletionClosure vK)]
 
noncomputable def absoluteValueExtension_embeddingCompletionAlgHom
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (w : AbsoluteValueExtension vK L)
    (tau : L →ₐ[K] absoluteValueExtension_algebraicCompletionClosure vK)
    (htau : w.1 = absoluteValueExtension_pullback vK hvK tau) :
    letI := AbsoluteValue.completionAlgebra vK w.1 w.2
    letI := absoluteValueExtension_algebraicClosureCompletionAlgebra vK hvK
    w.1.Completion →ₐ[vK.Completion]
      (absoluteValueExtension_algebraicClosureAbsoluteValue vK hvK).Completion := by
  letI := AbsoluteValue.completionAlgebra vK w.1 w.2
  letI := absoluteValueExtension_algebraicClosureCompletionAlgebra vK hvK
  exact
    { __ := absoluteValueExtension_embeddingCompletionMap vK hvK w tau htau
      commutes' x :=
        absoluteValueExtension_embeddingCompletionMap_completionMap
          vK hvK w tau htau x }
 

theorem absoluteValueExtension_embeddingCompletionAlgHom_mem_range
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (w : AbsoluteValueExtension vK L)
    (tau : L →ₐ[K] absoluteValueExtension_algebraicCompletionClosure vK)
    (htau : w.1 = absoluteValueExtension_pullback vK hvK tau)
    (z : AbsoluteValue.algebraicLocalization vK w.1 w.2) :
    letI := absoluteValueExtension_algebraicClosureCompletionAlgebra vK hvK
    absoluteValueExtension_embeddingCompletionAlgHom vK hvK w tau htau (z : w.1.Completion)
      ∈ (absoluteValueExtension_algebraicClosureToCompletionAlgHom vK hvK).range := by
  let hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  let : SMul K w.1.Completion := hK.toSMul
  let := AbsoluteValue.completionAlgebra vK w.1 w.2
  let := absoluteValueExtension_algebraicClosureCompletionAlgebra vK hvK
  let E := AbsoluteValue.algebraicLocalization vK w.1 w.2
  let F := absoluteValueExtension_embeddingCompletionAlgHom vK hvK w tau htau
  let j := absoluteValueExtension_algebraicClosureToCompletionAlgHom vK hvK
  change F (z : w.1.Completion) ∈ j.range
  apply IntermediateField.adjoin_induction
      (F := vK.Completion)
      (s := Set.range (AbsoluteValue.toCompletion w.1))
      (p := fun x _ => F x ∈ j.range)
      (x := (z : w.1.Completion))
  · intro x hx
    rcases hx with ⟨y, rfl⟩
    refine ⟨tau y, ?_⟩
    symm
    change absoluteValueExtension_embeddingCompletionMap vK hvK w tau htau
      (AbsoluteValue.toCompletion w.1 y) =
        absoluteValueExtension_algebraicClosureToCompletionRingHom vK hvK (tau y)
    change absoluteValueExtension_embeddingCompletionMap vK hvK w tau htau
      (((WithAbs.equiv w.1).symm y : WithAbs w.1) : w.1.Completion) = _
    rw [absoluteValueExtension_embeddingCompletionMap_coe]
    rfl
  · intro x
    refine ⟨algebraMap vK.Completion
      (absoluteValueExtension_algebraicCompletionClosure vK) x, ?_⟩
    exact (absoluteValueExtension_embeddingCompletionMap_completionMap
      vK hvK w tau htau x).symm
  · intro x y _ _ hx hy
    simpa only [map_add] using j.range.add_mem hx hy
  · intro x _ hx
    rcases hx with ⟨a, ha⟩
    refine ⟨a⁻¹, ?_⟩
    simpa only [map_inv₀] using congrArg Inv.inv ha
  · intro x y _ _ hx hy
    simpa only [map_mul] using j.range.mul_mem hx hy
  · exact z.property
 



noncomputable def absoluteValueExtension_localizationEmbeddingOfPullback
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (w : AbsoluteValueExtension vK L)
    (tau : L →ₐ[K] absoluteValueExtension_algebraicCompletionClosure vK)
    (htau : w.1 = absoluteValueExtension_pullback vK hvK tau) :
    letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
    letI : SMul K w.1.Completion := hK.toSMul
    letI := AbsoluteValue.completionAlgebra vK w.1 w.2
    AbsoluteValue.algebraicLocalization vK w.1 w.2 →ₐ[vK.Completion]
      absoluteValueExtension_algebraicCompletionClosure vK := by
  letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  letI : SMul K w.1.Completion := hK.toSMul
  letI := AbsoluteValue.completionAlgebra vK w.1 w.2
  letI := absoluteValueExtension_algebraicClosureCompletionAlgebra vK hvK
  let E := AbsoluteValue.algebraicLocalization vK w.1 w.2
  let F := absoluteValueExtension_embeddingCompletionAlgHom vK hvK w tau htau
  let j := absoluteValueExtension_algebraicClosureToCompletionAlgHom vK hvK
  let f : E →ₐ[vK.Completion] j.range :=
    (F.comp E.val).codRestrict j.range
      (absoluteValueExtension_embeddingCompletionAlgHom_mem_range
        vK hvK w tau htau)
  exact (AlgEquiv.ofInjectiveField j).symm.toAlgHom.comp f
 

theorem absoluteValueExtension_localizationEmbeddingOfPullback_toLocalization
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (w : AbsoluteValueExtension vK L)
    (tau : L →ₐ[K] absoluteValueExtension_algebraicCompletionClosure vK)
    (htau : w.1 = absoluteValueExtension_pullback vK hvK tau)
    (x : L) :
    letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
    letI : SMul K w.1.Completion := hK.toSMul
    letI := AbsoluteValue.completionAlgebra vK w.1 w.2
    absoluteValueExtension_localizationEmbeddingOfPullback vK hvK w tau htau
        (AbsoluteValue.toAlgebraicLocalization vK w.1 w.2 x) = tau x := by
  let hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  let : SMul K w.1.Completion := hK.toSMul
  let := AbsoluteValue.completionAlgebra vK w.1 w.2
  let := absoluteValueExtension_algebraicClosureCompletionAlgebra vK hvK
  let E := AbsoluteValue.algebraicLocalization vK w.1 w.2
  let F := absoluteValueExtension_embeddingCompletionAlgHom vK hvK w tau htau
  let j := absoluteValueExtension_algebraicClosureToCompletionAlgHom vK hvK
  apply j.injective
  change j ((AlgEquiv.ofInjectiveField j).symm
      ⟨F (AbsoluteValue.toAlgebraicLocalization vK w.1 w.2 x),
        absoluteValueExtension_embeddingCompletionAlgHom_mem_range
          vK hvK w tau htau _⟩) = j (tau x)
  rw [show j ((AlgEquiv.ofInjectiveField j).symm
      ⟨F (AbsoluteValue.toAlgebraicLocalization vK w.1 w.2 x),
        absoluteValueExtension_embeddingCompletionAlgHom_mem_range
          vK hvK w tau htau _⟩) =
      F (AbsoluteValue.toAlgebraicLocalization vK w.1 w.2 x) by
        exact congrArg Subtype.val
          ((AlgEquiv.ofInjectiveField j).apply_symm_apply _)]
  change absoluteValueExtension_embeddingCompletionMap vK hvK w tau htau
      (AbsoluteValue.toCompletion w.1 x) =
    absoluteValueExtension_algebraicClosureToCompletionRingHom vK hvK (tau x)
  change absoluteValueExtension_embeddingCompletionMap vK hvK w tau htau
      (((WithAbs.equiv w.1).symm x : WithAbs w.1) : w.1.Completion) = _
  rw [absoluteValueExtension_embeddingCompletionMap_coe]
  rfl
 


theorem absoluteValueExtension_algHom_conjugate_in_algClosure
    {F E A : Type*} [Field F] [Field E] [Field A]
    [Algebra F E] [Algebra F A] [Algebra.IsAlgebraic F E]
    [IsAlgClosure F A]
    (phi phi' : E →ₐ[F] A) :
    ∃ sigma : A ≃ₐ[F] A, ∀ x : E, sigma (phi x) = phi' x := by
  let : IsAlgClosed A := IsAlgClosure.isAlgClosed F
  let : Algebra E A := phi.toRingHom.toAlgebra
  let : IsScalarTower F E A :=
    IsScalarTower.of_algebraMap_eq' phi.comp_algebraMap.symm
  let : Algebra.IsAlgebraic E A :=
    Algebra.IsAlgebraic.tower_top (K := F) E
  obtain ⟨psi, hpsi⟩ :=
    IsAlgClosed.surjective_domRestrict_of_isAlgebraic
      (K := F) (L := E) (M := A) (E := A) phi'
  let sigma : A ≃ₐ[F] A := AlgEquiv.ofBijective psi
    (Algebra.IsAlgebraic.algHom_bijective psi)
  refine ⟨sigma, fun x => ?_⟩
  have hx := DFunLike.congr_fun hpsi x
  change psi (phi x) = phi' x
  change psi (algebraMap E A x) = phi' x at hx
  rw [RingHom.algebraMap_toAlgebra] at hx
  have hphi : phi.toRingHom x = phi x :=
    congrFun (AlgHom.coe_toRingHom phi) x
  rw [hphi] at hx
  exact hx
 

theorem absoluteValueExtension_conjugate_of_pullback_eq
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    [Algebra.IsAlgebraic K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    {tau tau' : L →ₐ[K] absoluteValueExtension_algebraicCompletionClosure vK}
    (h : absoluteValueExtension_pullback vK hvK tau =
      absoluteValueExtension_pullback vK hvK tau') :
    AbsoluteValueExtensionConjugateOverCompletion vK tau tau' := by
  let w : AbsoluteValueExtension vK L :=
    ⟨absoluteValueExtension_pullback vK hvK tau,
      absoluteValueExtension_pullback_extends vK hvK tau⟩
  have htau : w.1 = absoluteValueExtension_pullback vK hvK tau := rfl
  have htau' : w.1 = absoluteValueExtension_pullback vK hvK tau' := h
  let hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  let : SMul K w.1.Completion := hK.toSMul
  let := AbsoluteValue.completionAlgebra vK w.1 w.2
  let phi := absoluteValueExtension_localizationEmbeddingOfPullback
    vK hvK w tau htau
  let phi' := absoluteValueExtension_localizationEmbeddingOfPullback
    vK hvK w tau' htau'
  let : Algebra.IsAlgebraic vK.Completion
      (AbsoluteValue.algebraicLocalization vK w.1 w.2) :=
    AbsoluteValue.algebraicLocalization_isAlgebraic vK w.1 w.2
  obtain ⟨sigma, hsigma⟩ :=
    absoluteValueExtension_algHom_conjugate_in_algClosure phi phi'
  refine ⟨sigma, fun x => ?_⟩
  rw [← absoluteValueExtension_localizationEmbeddingOfPullback_toLocalization
      vK hvK w tau htau x,
    ← absoluteValueExtension_localizationEmbeddingOfPullback_toLocalization
      vK hvK w tau' htau' x]
  exact (hsigma (AbsoluteValue.toAlgebraicLocalization vK w.1 w.2 x)).symm
 

theorem absoluteValueExtension_pullback_eq_iff_conjugate
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    [Algebra.IsAlgebraic K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (tau tau' : L →ₐ[K] absoluteValueExtension_algebraicCompletionClosure vK) :
    absoluteValueExtension_pullback vK hvK tau =
        absoluteValueExtension_pullback vK hvK tau' ↔
      AbsoluteValueExtensionConjugateOverCompletion vK tau tau' := by
  constructor
  · exact absoluteValueExtension_conjugate_of_pullback_eq vK hvK
  · exact absoluteValueExtension_pullback_eq_of_conjugate vK hvK
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
 
noncomputable def absoluteValueExtension_localizationTensorHom
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (w : AbsoluteValueExtension vK L) :
    letI := AbsoluteValue.completionAlgebra vK w.1 w.2
    vK.Completion ⊗[K] L →ₐ[vK.Completion] w.1.Completion := by
  letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  letI : SMul K w.1.Completion := hK.toSMul
  letI := AbsoluteValue.completionAlgebra vK w.1 w.2
  letI : IsScalarTower K vK.Completion w.1.Completion :=
    AbsoluteValue.completion_isScalarTower vK w.1 w.2
  exact Algebra.TensorProduct.lift
    (Algebra.ofId vK.Completion w.1.Completion)
    (AbsoluteValue.toCompletionAlgHom (K := K) w.1)
    (fun _ _ ↦ Commute.all _ _)
@[simp]
theorem absoluteValueExtension_localizationTensorHom_tmul
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (w : AbsoluteValueExtension vK L)
    (b : vK.Completion) (a : L) :
    letI := AbsoluteValue.completionAlgebra vK w.1 w.2
    absoluteValueExtension_localizationTensorHom vK w (b ⊗ₜ[K] a) =
      algebraMap vK.Completion w.1.Completion b *
        AbsoluteValue.toCompletionAlgHom (K := K) w.1 a := by
  let := AbsoluteValue.completionAlgebra vK w.1 w.2
  rfl
 

theorem absoluteValueExtension_localizationTensorHom_surjective
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    [FiniteDimensional K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (w : AbsoluteValueExtension vK L) :
    letI := AbsoluteValue.completionAlgebra vK w.1 w.2
    Function.Surjective (absoluteValueExtension_localizationTensorHom vK w) := by
  let hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  let : SMul K w.1.Completion := hK.toSMul
  let := AbsoluteValue.completionAlgebra vK w.1 w.2
  let : NontriviallyNormedField vK.Completion :=
    absoluteValueExtension_completionNontriviallyNormedField vK hvK
  let : NormedAlgebra vK.Completion w.1.Completion :=
    absoluteValueExtension_completionNormedAlgebra vK w
  let : Module.Finite vK.Completion (vK.Completion ⊗[K] L) :=
    inferInstance
  let f := absoluteValueExtension_localizationTensorHom vK w
  let : Module.Finite vK.Completion f.toLinearMap.range :=
    Module.Finite.range f.toLinearMap
  have hrangeClosed : IsClosed (f.toLinearMap.range : Set w.1.Completion) :=
    Submodule.closed_of_finiteDimensional
      (𝕜 := vK.Completion) f.toLinearMap.range
  have hdense : DenseRange
      (AbsoluteValue.toCompletion w.1) :=
    AbsoluteValue.denseRange_toCompletion w.1
  have hrange : Set.range
      (AbsoluteValue.toCompletion w.1) ⊆
      (f.toLinearMap.range : Set w.1.Completion) := by
    rintro _ ⟨x, rfl⟩
    refine ⟨1 ⊗ₜ[K] x, ?_⟩
    change f (1 ⊗ₜ[K] x) = _
    rw [absoluteValueExtension_localizationTensorHom_tmul]
    simp [AbsoluteValue.toCompletionAlgHom]
  change Function.Surjective f.toLinearMap
  rw [← f.toLinearMap.range_eq_top]
  apply top_unique
  intro x _
  have hx : x ∈ closure
      (Set.range (AbsoluteValue.toCompletion w.1)) := by
    rw [hdense.closure_range]
    trivial
  exact closure_minimal hrange hrangeClosed hx
 

theorem absoluteValueExtension_finiteLocalization_eq_top
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    [FiniteDimensional K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (w : AbsoluteValueExtension vK L) :
    letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
    letI : SMul K w.1.Completion := hK.toSMul
    letI := AbsoluteValue.completionAlgebra vK w.1 w.2
    AbsoluteValue.algebraicLocalization vK w.1 w.2 = ⊤ := by
  let hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  let : SMul K w.1.Completion := hK.toSMul
  let := AbsoluteValue.completionAlgebra vK w.1 w.2
  let E := AbsoluteValue.algebraicLocalization vK w.1 w.2
  apply top_unique
  intro y _
  obtain ⟨z, rfl⟩ :=
    absoluteValueExtension_localizationTensorHom_surjective vK hvK w y
  induction z using TensorProduct.induction_on with
  | zero => exact E.zero_mem
  | tmul b x =>
      rw [absoluteValueExtension_localizationTensorHom_tmul]
      exact E.mul_mem (E.algebraMap_mem b)
        (AbsoluteValue.toAlgebraicLocalization vK w.1 w.2 x).property
  | add x y hx hy =>
      simpa only [map_add] using E.add_mem (hx trivial) (hy trivial)
end Valuations
end AlgebraicNumberTheory
namespace AlgebraicNumberTheory
namespace Valuations
universe u v
open scoped TensorProduct
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
end Valuations
end AlgebraicNumberTheory
end
end

/- ValuedFieldTheory.Valuation.Completion.PolynomialFactors -/
section
noncomputable section
open Polynomial
open UniqueFactorizationMonoid
namespace ValuationTheory
namespace Completion
universe u v
 



noncomputable def polynomialNormalizedFactors
    {F : Type u} [Field F] (p : F[X]) : Multiset F[X] := by
  letI : DecidableEq F := Classical.decEq F
  letI : NormalizationMonoid F := inferInstance
  letI : NormalizationMonoid F[X] := Polynomial.instNormalizationMonoid
  exact normalizedFactors p
 

noncomputable def polynomialDistinctNormalizedFactors
    {F : Type u} [Field F] (p : F[X]) : Finset F[X] := by
  classical
  exact (polynomialNormalizedFactors p).toFinset
 
theorem polynomialNormalizedFactors_eq_of_associated
    {F : Type u} [Field F] {p q : F[X]} (h : Associated p q) :
    polynomialNormalizedFactors p = polynomialNormalizedFactors q := by
  classical
  dsimp [polynomialNormalizedFactors]
  exact h.normalizedFactors_eq
 
theorem polynomialDistinctNormalizedFactors_eq_of_associated
    {F : Type u} [Field F] {p q : F[X]} (h : Associated p q) :
    polynomialDistinctNormalizedFactors p =
      polynomialDistinctNormalizedFactors q := by
  classical
  dsimp [polynomialDistinctNormalizedFactors]
  rw [polynomialNormalizedFactors_eq_of_associated h]
 


abbrev DistinctNormalizedFactors
    {F : Type u} [Field F] (p : F[X]) :=
  {g : F[X] // g ∈ polynomialDistinctNormalizedFactors p}
 
abbrev PolynomialRootsIn
    {F : Type u} [Field F] (E : Type v) [Field E] [Algebra F E]
    (p : F[X]) :=
  {x : E // x ∈ p.rootSet E}
 
def rootMinpoly
    {F : Type u} [Field F] {E : Type v} [Field E] [Algebra F E]
    (p : F[X]) : PolynomialRootsIn E p → F[X] :=
  fun x => minpoly F (x : E)
 

abbrev rootMinpolySetoid
    {F : Type u} [Field F] {E : Type v} [Field E] [Algebra F E]
    (p : F[X]) : Setoid (PolynomialRootsIn E p) :=
  Setoid.ker (rootMinpoly p)
 
theorem rootMinpoly_mem_normalizedFactors
    {F : Type u} [Field F] {E : Type v} [Field E] [Algebra F E]
    [Algebra.IsAlgebraic F E] {p : F[X]} (hp : p ≠ 0)
    (x : PolynomialRootsIn E p) :
    rootMinpoly p x ∈ polynomialDistinctNormalizedFactors p := by
  classical
  dsimp [polynomialDistinctNormalizedFactors, polynomialNormalizedFactors]
  rw [Multiset.mem_toFinset, Polynomial.mem_normalizedFactors_iff hp]
  have hxint : IsIntegral F (x : E) :=
    (Algebra.IsAlgebraic.isAlgebraic (x : E)).isIntegral
  refine ⟨minpoly.irreducible hxint, minpoly.monic hxint, ?_⟩
  exact minpoly.dvd F (x : E) (Polynomial.mem_rootSet.mp x.2).2
 
theorem range_rootMinpoly_eq_distinctNormalizedFactors
    {F : Type u} [Field F] {E : Type v} [Field E] [Algebra F E]
    [Algebra.IsAlgebraic F E] [IsAlgClosed E]
    {p : F[X]} (hp : p ≠ 0) :
    Set.range (rootMinpoly p : PolynomialRootsIn E p → F[X]) =
      {g : F[X] | g ∈ polynomialDistinctNormalizedFactors p} := by
  classical
  ext g
  constructor
  · rintro ⟨x, rfl⟩
    exact rootMinpoly_mem_normalizedFactors hp x
  · intro hg
    have hg' : g ∈ normalizedFactors p := by
      simpa only [polynomialDistinctNormalizedFactors,
        polynomialNormalizedFactors, Multiset.mem_toFinset, Set.mem_ofPred_eq] using hg
    obtain ⟨hgirred, hgmonic, hgdvd⟩ :=
      (Polynomial.mem_normalizedFactors_iff hp).mp hg'
    have hgdegree : g.degree ≠ 0 :=
      (degree_pos_of_irreducible hgirred).ne'
    obtain ⟨x, hx⟩ := IsAlgClosed.exists_aeval_eq_zero E g hgdegree
    have hxp : Polynomial.aeval x p = 0 :=
      aeval_eq_zero_of_dvd_aeval_eq_zero hgdvd hx
    have hxroot : x ∈ p.rootSet E := by
      rw [Polynomial.mem_rootSet]
      exact ⟨hp, hxp⟩
    refine ⟨⟨x, hxroot⟩, ?_⟩
    exact (minpoly.eq_of_irreducible_of_monic hgirred hx hgmonic).symm
 

noncomputable def rootClassesEquivDistinctNormalizedFactors
    {F : Type u} [Field F] {E : Type v} [Field E] [Algebra F E]
    [Algebra.IsAlgebraic F E] [IsAlgClosed E]
    {p : F[X]} (hp : p ≠ 0) :
    Quotient (rootMinpolySetoid (E := E) p) ≃
      DistinctNormalizedFactors p :=
  (Setoid.quotientKerEquivRange (rootMinpoly p)).trans
    (Equiv.setCongr (range_rootMinpoly_eq_distinctNormalizedFactors hp))
 


noncomputable def simpleEmbeddingsEquivMappedMinpolyRoots
    {K : Type u} {L : Type v} {K' E : Type*}
    [Field K] [Field L] [Field K'] [Field E]
    [Algebra K L] [Algebra K K'] [Algebra K E] [Algebra K' E]
    [IsScalarTower K K' E]
    (α : L) (hα : IsIntegral K α)
    (hgen : Algebra.adjoin K ({α} : Set L) = ⊤) :
    (L →ₐ[K] E) ≃
      PolynomialRootsIn E
        ((minpoly K α).map (algebraMap K K')) := by
  let pb : PowerBasis K L := PowerBasis.ofAdjoinEqTop hα hgen
  let p : K'[X] := (minpoly K α).map (algebraMap K K')
  have hpbgen : pb.gen = α := by simp [pb]
  have hp : p ≠ 0 :=
    (Polynomial.map_ne_zero_iff (algebraMap K K').injective).2
      (minpoly.ne_zero hα)
  have hroot (τ : L →ₐ[K] E) : τ α ∈ p.rootSet E := by
    rw [Polynomial.mem_rootSet]
    refine ⟨hp, ?_⟩
    change Polynomial.aeval (τ α)
      ((minpoly K α).map (algebraMap K K')) = 0
    rw [aeval_map_algebraMap]
    rw [aeval_algHom_apply τ α (minpoly K α), minpoly.aeval, map_zero]
  have hbaseRoot (x : PolynomialRootsIn E p) :
      Polynomial.aeval (x : E) (minpoly K pb.gen) = 0 := by
    rw [hpbgen]
    exact (Polynomial.aeval_map_algebraMap K' (x : E) (minpoly K α)).symm.trans
      (Polynomial.mem_rootSet.mp x.2).2
  let toRoot : (L →ₐ[K] E) → PolynomialRootsIn E p :=
    fun τ => ⟨τ α, hroot τ⟩
  let fromRoot : PolynomialRootsIn E p → (L →ₐ[K] E) :=
    fun x => pb.lift (x : E) (hbaseRoot x)
  refine
    { toFun := toRoot
      invFun := fromRoot
      left_inv := ?_
      right_inv := ?_ }
  · intro τ
    apply pb.algHom_ext
    change pb.lift (τ α) _ pb.gen = τ pb.gen
    rw [pb.lift_gen, hpbgen]
  · intro x
    apply Subtype.ext
    change pb.lift (x : E) _ α = x
    calc
      pb.lift (x : E) _ α = pb.lift (x : E) _ pb.gen :=
        congrArg (pb.lift (x : E) (hbaseRoot x)) hpbgen.symm
      _ = x := pb.lift_gen (x : E) (hbaseRoot x)
end Completion
end ValuationTheory
end
end

/- ValuedFieldTheory.Valuation.Completion.ExtensionFactorClassification -/
section
noncomputable section
open Polynomial
open scoped Topology
open ValuationTheory.Completion
namespace AlgebraicNumberTheory
namespace Valuations
universe u v
 
abbrev completionExtensionFactor_completionPolynomial
    {K : Type u} [Field K] (vK : AbsoluteValue K ℝ) (f : K[X]) :
    vK.Completion[X] :=
  f.map (algebraMap K vK.Completion)
 

abbrev CompletionExtensionFactorCompletionFactors
    {K : Type u} [Field K] (vK : AbsoluteValue K ℝ) (f : K[X]) :=
  DistinctNormalizedFactors (completionExtensionFactor_completionPolynomial vK f)
 


theorem completionExtensionFactor_root_isIntegral
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    {α : L} {f : K[X]} (hf : Irreducible f)
    (hroot : Polynomial.aeval α f = 0) : IsIntegral K α :=
  (show IsAlgebraic K α from ⟨f, hf.ne_zero, hroot⟩).isIntegral
 

theorem completionExtensionFactor_definingPolynomial_associated_minpoly
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    {α : L} {f : K[X]} (hf : Irreducible f)
    (hroot : Polynomial.aeval α f = 0) :
    Associated f (minpoly K α) := by
  have hlead : f.leadingCoeff ≠ 0 := leadingCoeff_ne_zero.mpr hf.ne_zero
  have hunit : IsUnit (C f.leadingCoeff⁻¹ : K[X]) :=
    isUnit_C.mpr (IsUnit.mk0 f.leadingCoeff⁻¹ (inv_ne_zero hlead))
  exact (associated_mul_unit_right f (C f.leadingCoeff⁻¹) hunit).trans
    (Associated.of_eq (minpoly.eq_of_irreducible hf hroot))
 

theorem completionExtensionFactor_completionFactors_eq_minpolyFactors
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) {α : L} {f : K[X]}
    (hf : Irreducible f) (hroot : Polynomial.aeval α f = 0) :
    polynomialDistinctNormalizedFactors
        (completionExtensionFactor_completionPolynomial vK f) =
      polynomialDistinctNormalizedFactors
        ((minpoly K α).map (algebraMap K vK.Completion)) := by
  exact polynomialDistinctNormalizedFactors_eq_of_associated
    (Polynomial.associated_map_map (algebraMap K vK.Completion)
      (completionExtensionFactor_definingPolynomial_associated_minpoly hf hroot))
 

noncomputable def completionExtensionFactor_minpolyFactorsEquivCompletionFactors
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) {α : L} {f : K[X]}
    (hf : Irreducible f) (hroot : Polynomial.aeval α f = 0) :
    DistinctNormalizedFactors
        ((minpoly K α).map (algebraMap K vK.Completion)) ≃
      CompletionExtensionFactorCompletionFactors vK f :=
  Equiv.setCongr (by
    ext g
    exact Finset.ext_iff.mp
      (completionExtensionFactor_completionFactors_eq_minpolyFactors
        vK hf hroot).symm g)
 

abbrev CompletionExtensionFactorEmbeddingSetoid
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (α : L) (hα : IsIntegral K α)
    (hgen : Algebra.adjoin K ({α} : Set L) = ⊤) :
    Setoid (L →ₐ[K] absoluteValueExtension_algebraicCompletionClosure vK) :=
  Setoid.comap
    (simpleEmbeddingsEquivMappedMinpolyRoots
      (K' := vK.Completion)
      (E := absoluteValueExtension_algebraicCompletionClosure vK)
      α hα hgen)
    (rootMinpolySetoid
      ((minpoly K α).map (algebraMap K vK.Completion)))
 

noncomputable def completionExtensionFactor_embeddingClassesEquivMinpolyFactors
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (α : L) (hα : IsIntegral K α)
    (hgen : Algebra.adjoin K ({α} : Set L) = ⊤) :
    Quotient (CompletionExtensionFactorEmbeddingSetoid vK α hα hgen) ≃
      DistinctNormalizedFactors
        ((minpoly K α).map (algebraMap K vK.Completion)) :=
  let e := simpleEmbeddingsEquivMappedMinpolyRoots
    (K' := vK.Completion)
    (E := absoluteValueExtension_algebraicCompletionClosure vK)
    α hα hgen
  (Quotient.congr e (fun _ _ => Iff.rfl)).trans
    (rootClassesEquivDistinctNormalizedFactors
      (E := absoluteValueExtension_algebraicCompletionClosure vK)
      ((Polynomial.map_ne_zero_iff
        (algebraMap K vK.Completion).injective).2 (minpoly.ne_zero hα)))
 

theorem completionExtensionFactor_embeddingSetoid_rel_iff_conjugate
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (α : L) (hα : IsIntegral K α)
    (hgen : Algebra.adjoin K ({α} : Set L) = ⊤)
    (τ τ' : L →ₐ[K] absoluteValueExtension_algebraicCompletionClosure vK) :
    (CompletionExtensionFactorEmbeddingSetoid vK α hα hgen).r τ τ' ↔
      AbsoluteValueExtensionConjugateOverCompletion vK τ τ' := by
  let pb : PowerBasis K L := PowerBasis.ofAdjoinEqTop hα hgen
  have hpbgen : pb.gen = α := by simp [pb]
  change IsConjRoot vK.Completion (τ α) (τ' α) ↔ _
  constructor
  · intro hconj
    obtain ⟨σ, hσ⟩ := IsConjRoot.exists_algEquiv hconj.symm
    refine ⟨σ, ?_⟩
    let στ : L →ₐ[K] absoluteValueExtension_algebraicCompletionClosure vK :=
      (σ.toAlgHom.restrictScalars K).comp τ
    have heq : τ' = στ := by
      apply pb.algHom_ext
      rw [hpbgen]
      exact hσ.symm
    intro x
    exact DFunLike.congr_fun heq x
  · rintro ⟨σ, hσ⟩
    change minpoly vK.Completion (τ α) = minpoly vK.Completion (τ' α)
    rw [hσ α]
    exact (minpoly.algEquiv_eq σ (τ α)).symm
 


noncomputable def pullbackAbsoluteValueExtension
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (τ : L →ₐ[K] absoluteValueExtension_algebraicCompletionClosure vK) :
    AbsoluteValueExtension vK L :=
  ⟨absoluteValueExtension_pullback vK hvK τ,
    absoluteValueExtension_pullback_extends vK hvK τ⟩
 



theorem completionExtensionFactor_pullback_eq_iff_embeddingSetoid_rel
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (α : L) (hα : IsIntegral K α)
    (hgen : Algebra.adjoin K ({α} : Set L) = ⊤)
    (τ τ' : L →ₐ[K] absoluteValueExtension_algebraicCompletionClosure vK) :
    absoluteValueExtension_pullback vK hvK τ =
        absoluteValueExtension_pullback vK hvK τ' ↔
      (CompletionExtensionFactorEmbeddingSetoid vK α hα hgen).r τ τ' := by
  let pb : PowerBasis K L := PowerBasis.ofAdjoinEqTop hα hgen
  let : FiniteDimensional K L := pb.finite
  let : Algebra.IsAlgebraic K L := inferInstance
  rw [completionExtensionFactor_embeddingSetoid_rel_iff_conjugate
    vK α hα hgen τ τ']
  exact absoluteValueExtension_pullback_eq_iff_conjugate vK hvK τ τ'
 

theorem completionExtensionFactor_extension_eq_pullback_embeddingOfExtension
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    [Algebra.IsAlgebraic K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (w : AbsoluteValueExtension vK L) :
    w.1 = absoluteValueExtension_pullback vK hvK
      (absoluteValueExtension_embeddingOfExtension vK w) := by
  exact absoluteValueExtension_extension_eq_pullback_embeddingOfExtension vK hvK w
 

noncomputable def completionExtensionFactor_extensionsEquivEmbeddingClasses
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (α : L) (hα : IsIntegral K α)
    (hgen : Algebra.adjoin K ({α} : Set L) = ⊤) :
    AbsoluteValueExtension vK L ≃
      Quotient (CompletionExtensionFactorEmbeddingSetoid vK α hα hgen) := by
  let pb : PowerBasis K L := PowerBasis.ofAdjoinEqTop hα hgen
  letI : FiniteDimensional K L := pb.finite
  letI : Algebra.IsAlgebraic K L := inferInstance
  let fromClass :
      Quotient (CompletionExtensionFactorEmbeddingSetoid vK α hα hgen) →
        AbsoluteValueExtension vK L :=
    Quotient.lift
      (pullbackAbsoluteValueExtension vK hvK)
      (by
        intro τ τ' hrel
        apply Subtype.ext
        exact (completionExtensionFactor_pullback_eq_iff_embeddingSetoid_rel
          vK hvK α hα hgen τ τ').2 hrel)
  refine
    { toFun := fun w => Quotient.mk
        (CompletionExtensionFactorEmbeddingSetoid vK α hα hgen)
        (absoluteValueExtension_embeddingOfExtension vK w)
      invFun := fromClass
      left_inv := ?_
      right_inv := ?_ }
  · intro w
    apply Subtype.ext
    exact (completionExtensionFactor_extension_eq_pullback_embeddingOfExtension
      vK hvK w).symm
  · intro q
    induction q using Quotient.inductionOn with
    | _ τ =>
      apply Quotient.sound
      let wτ : AbsoluteValueExtension vK L :=
        pullbackAbsoluteValueExtension vK hvK τ
      apply (completionExtensionFactor_pullback_eq_iff_embeddingSetoid_rel
        vK hvK α hα hgen
        (absoluteValueExtension_embeddingOfExtension vK wτ) τ).1
      exact (completionExtensionFactor_extension_eq_pullback_embeddingOfExtension
        vK hvK wτ).symm
 

noncomputable def completionExtensionFactor_extensionsEquivMinpolyFactors
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (α : L) (hα : IsIntegral K α)
    (hgen : Algebra.adjoin K ({α} : Set L) = ⊤) :
    AbsoluteValueExtension vK L ≃
      DistinctNormalizedFactors
        ((minpoly K α).map (algebraMap K vK.Completion)) :=
  (completionExtensionFactor_extensionsEquivEmbeddingClasses
      vK hvK α hα hgen).trans
    (completionExtensionFactor_embeddingClassesEquivMinpolyFactors
      vK α hα hgen)
 

noncomputable def completionExtensionFactor_extensionsEquivCompletionFactorsAux
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    {α : L} {f : K[X]} (hf : Irreducible f)
    (hroot : Polynomial.aeval α f = 0)
    (hgen : Algebra.adjoin K ({α} : Set L) = ⊤) :
    AbsoluteValueExtension vK L ≃
      CompletionExtensionFactorCompletionFactors vK f :=
  let hα := completionExtensionFactor_root_isIntegral hf hroot
  (completionExtensionFactor_extensionsEquivMinpolyFactors
      vK hvK α hα hgen).trans
    (completionExtensionFactor_minpolyFactorsEquivCompletionFactors
      vK hf hroot)
 

noncomputable def completionExtensionFactor_extensionFactor
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (α : L)
    (w : AbsoluteValueExtension vK L) : vK.Completion[X] := by
  letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  letI : SMul K w.1.Completion := hK.toSMul
  letI := AbsoluteValue.completionAlgebra vK w.1 w.2
  exact minpoly vK.Completion
    (AbsoluteValue.toCompletionAlgHom (K := K) w.1 α)
 

theorem completionExtensionFactor_extensionFactor_mem
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) {α : L} {f : K[X]}
    (hf : Irreducible f) (hroot : Polynomial.aeval α f = 0)
    (w : AbsoluteValueExtension vK L) :
    completionExtensionFactor_extensionFactor vK α w ∈
      polynomialDistinctNormalizedFactors
        (completionExtensionFactor_completionPolynomial vK f) := by
  classical
  let hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  let : SMul K w.1.Completion := hK.toSMul
  let hKv := AbsoluteValue.completionAlgebra vK w.1 w.2
  let : IsScalarTower K vK.Completion w.1.Completion :=
    AbsoluteValue.completion_isScalarTower vK w.1 w.2
  let ι : L →ₐ[K] w.1.Completion :=
    AbsoluteValue.toCompletionAlgHom (K := K) w.1
  let a : w.1.Completion := ι α
  have hαalg : IsAlgebraic K α := ⟨f, hf.ne_zero, hroot⟩
  have hα : IsIntegral K α := hαalg.isIntegral
  have haK : IsIntegral K a := by
      exact IsIntegral.map_of_comp_eq (RingHom.id K) ι.toRingHom
        (by ext x; simp) hα
  have haKv : IsIntegral vK.Completion a :=
    IsIntegral.tower_top haK
  have hp0 : completionExtensionFactor_completionPolynomial vK f ≠ 0 :=
    (Polynomial.map_ne_zero_iff
      (algebraMap K vK.Completion).injective).2 hf.ne_zero
  have haf : Polynomial.aeval a
      (completionExtensionFactor_completionPolynomial vK f) = 0 := by
    change Polynomial.aeval (ι α)
      (f.map (algebraMap K vK.Completion)) = 0
    rw [Polynomial.aeval_map_algebraMap]
    rw [Polynomial.aeval_algHom_apply ι α f, hroot, map_zero]
  dsimp [completionExtensionFactor_extensionFactor,
    polynomialDistinctNormalizedFactors, polynomialNormalizedFactors]
  rw [Multiset.mem_toFinset, Polynomial.mem_normalizedFactors_iff hp0]
  exact ⟨minpoly.irreducible haKv, minpoly.monic haKv,
    minpoly.dvd vK.Completion a haf⟩
 
noncomputable def completionExtensionFactor_extensionToFactor
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) {α : L} {f : K[X]}
    (hf : Irreducible f) (hroot : Polynomial.aeval α f = 0) :
    AbsoluteValueExtension vK L →
      CompletionExtensionFactorCompletionFactors vK f :=
  fun w => ⟨completionExtensionFactor_extensionFactor vK α w,
    completionExtensionFactor_extensionFactor_mem vK hf hroot w⟩
 


theorem completionExtensionFactor_embeddingOfExtension_minpoly
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    [Algebra.IsAlgebraic K L]
    (vK : AbsoluteValue K ℝ) (α : L)
    (w : AbsoluteValueExtension vK L) :
    minpoly vK.Completion
        (absoluteValueExtension_embeddingOfExtension vK w α) =
      completionExtensionFactor_extensionFactor vK α w := by
  let hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  let : SMul K w.1.Completion := hK.toSMul
  let := AbsoluteValue.completionAlgebra vK w.1 w.2
  let a := AbsoluteValue.toAlgebraicLocalization vK w.1 w.2 α
  calc
    minpoly vK.Completion
        (absoluteValueExtension_embeddingOfExtension vK w α) =
        minpoly vK.Completion a :=
      minpoly.algHom_eq
        (absoluteValueExtension_localizationEmbedding vK w)
        (absoluteValueExtension_localizationEmbedding vK w).injective a
    _ = minpoly vK.Completion
        (AbsoluteValue.toCompletionAlgHom (K := K) w.1 α) := by
      rw [← minpoly.algHom_eq
        (AbsoluteValue.algebraicLocalization vK w.1 w.2).val
        (AbsoluteValue.algebraicLocalization vK w.1 w.2).val.injective a]
      rfl
    _ = completionExtensionFactor_extensionFactor vK α w := rfl
 


theorem completionExtensionFactor_completion_adjoin_eq_top
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (α : L) (hα : IsIntegral K α)
    (hgen : Algebra.adjoin K ({α} : Set L) = ⊤)
    (w : AbsoluteValueExtension vK L) :
    letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
    letI : SMul K w.1.Completion := hK.toSMul
    letI := AbsoluteValue.completionAlgebra vK w.1 w.2
    Algebra.adjoin vK.Completion
        ({AbsoluteValue.toCompletionAlgHom (K := K) w.1 α} :
          Set w.1.Completion) = ⊤ := by
  let pb : PowerBasis K L := PowerBasis.ofAdjoinEqTop hα hgen
  let : FiniteDimensional K L := pb.finite
  let : Algebra.IsAlgebraic K L := inferInstance
  let hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  let : SMul K w.1.Completion := hK.toSMul
  let := AbsoluteValue.completionAlgebra vK w.1 w.2
  let : IsScalarTower K vK.Completion w.1.Completion :=
    AbsoluteValue.completion_isScalarTower vK w.1 w.2
  let ι : L →ₐ[K] w.1.Completion :=
    AbsoluteValue.toCompletionAlgHom (K := K) w.1
  let a : w.1.Completion := ι α
  have haK : IsIntegral K a := by
      exact IsIntegral.map_of_comp_eq (RingHom.id K) ι.toRingHom
        (by ext x; simp) hα
  have haKv : IsIntegral vK.Completion a :=
    IsIntegral.tower_top haK
  have hrange : Set.range
      (AbsoluteValue.toCompletion w.1) ⊆
      (IntermediateField.adjoin vK.Completion ({a} : Set w.1.Completion) :
        Set w.1.Completion) := by
    rintro _ ⟨x, rfl⟩
    change ι x ∈ IntermediateField.adjoin vK.Completion ({a} : Set _)
    have hx : x ∈ Algebra.adjoin K ({α} : Set L) := by
      rw [hgen]
      trivial
    induction hx using Algebra.adjoin_induction with
    | mem x hx =>
        rw [Set.mem_singleton_iff.mp hx]
        exact IntermediateField.mem_adjoin_simple_self vK.Completion a
    | algebraMap x =>
        rw [ι.commutes,
          IsScalarTower.algebraMap_apply K vK.Completion w.1.Completion]
        exact (IntermediateField.adjoin vK.Completion ({a} : Set _)).algebraMap_mem _
    | add x y _ _ hx hy =>
        simpa only [map_add] using
          (IntermediateField.adjoin vK.Completion ({a} : Set _)).add_mem hx hy
    | mul x y _ _ hx hy =>
        simpa only [map_mul] using
          (IntermediateField.adjoin vK.Completion ({a} : Set _)).mul_mem hx hy
  have hloc_le : AbsoluteValue.algebraicLocalization vK w.1 w.2 ≤
      IntermediateField.adjoin vK.Completion ({a} : Set _) := by
    exact IntermediateField.adjoin_le_iff.mpr hrange
  have hsimple : IntermediateField.adjoin vK.Completion ({a} : Set _) = ⊤ := by
    apply top_unique
    rw [← absoluteValueExtension_finiteLocalization_eq_top vK hvK w]
    exact hloc_le
  rw [← IntermediateField.adjoin_simple_toSubalgebra_of_isAlgebraic
      haKv.isAlgebraic,
    hsimple, IntermediateField.top_toSubalgebra]
 

noncomputable def completionExtensionFactor_adjoinRootEquivCompletion
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (α : L) (hα : IsIntegral K α)
    (hgen : Algebra.adjoin K ({α} : Set L) = ⊤)
    (w : AbsoluteValueExtension vK L) :
    letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
    letI : SMul K w.1.Completion := hK.toSMul
    letI := AbsoluteValue.completionAlgebra vK w.1 w.2
    AdjoinRoot (completionExtensionFactor_extensionFactor vK α w) ≃ₐ[vK.Completion]
      w.1.Completion := by
  letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  letI : SMul K w.1.Completion := hK.toSMul
  letI := AbsoluteValue.completionAlgebra vK w.1 w.2
  letI : IsScalarTower K vK.Completion w.1.Completion :=
    AbsoluteValue.completion_isScalarTower vK w.1 w.2
  let ι : L →ₐ[K] w.1.Completion :=
    AbsoluteValue.toCompletionAlgHom (K := K) w.1
  let a : w.1.Completion := ι α
  have haK : IsIntegral K a := by
      exact IsIntegral.map_of_comp_eq (RingHom.id K) ι.toRingHom
        (by ext x; simp) hα
  have haKv : IsIntegral vK.Completion a :=
    IsIntegral.tower_top haK
  have htop : Algebra.adjoin vK.Completion ({a} : Set w.1.Completion) = ⊤ :=
    completionExtensionFactor_completion_adjoin_eq_top
      vK hvK α hα hgen w
  change AdjoinRoot (minpoly vK.Completion a) ≃ₐ[vK.Completion]
    w.1.Completion
  exact (@minpoly.equivAdjoin vK.Completion w.1.Completion _ _ _ _ _ _
    (Module.isTorsionFree_iff_algebraMap_injective.mpr
      (algebraMap vK.Completion w.1.Completion).injective) a haKv).trans
    ((Subalgebra.equivOfEq _ _ htop).trans Subalgebra.topEquiv)
 

@[simp]
theorem completionExtensionFactor_adjoinRootEquivCompletion_root
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (α : L) (hα : IsIntegral K α)
    (hgen : Algebra.adjoin K ({α} : Set L) = ⊤)
    (w : AbsoluteValueExtension vK L) :
    letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
    letI : SMul K w.1.Completion := hK.toSMul
    letI := AbsoluteValue.completionAlgebra vK w.1 w.2
    completionExtensionFactor_adjoinRootEquivCompletion vK hvK α hα hgen w
        (AdjoinRoot.root (completionExtensionFactor_extensionFactor vK α w)) =
      AbsoluteValue.toCompletionAlgHom (K := K) w.1 α := by
  let hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  let : SMul K w.1.Completion := hK.toSMul
  let := AbsoluteValue.completionAlgebra vK w.1 w.2
  let : IsScalarTower K vK.Completion w.1.Completion :=
    AbsoluteValue.completion_isScalarTower vK w.1 w.2
  let ι : L →ₐ[K] w.1.Completion :=
    AbsoluteValue.toCompletionAlgHom (K := K) w.1
  let a : w.1.Completion := ι α
  change ((AdjoinRoot.Minpoly.toAdjoin vK.Completion a)
      (AdjoinRoot.root (minpoly vK.Completion a)) : w.1.Completion) = a
  exact AdjoinRoot.Minpoly.coe_toAdjoin_mk_X
    (R := vK.Completion) (x := a)
 

theorem completionExtensionFactor_extensionsEquivCompletionFactorsAux_apply
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    {α : L} {f : K[X]} (hf : Irreducible f)
    (hroot : Polynomial.aeval α f = 0)
    (hgen : Algebra.adjoin K ({α} : Set L) = ⊤)
    (w : AbsoluteValueExtension vK L) :
    (completionExtensionFactor_extensionsEquivCompletionFactorsAux
        vK hvK hf hroot hgen w).1 =
      completionExtensionFactor_extensionFactor vK α w := by
  let hα := completionExtensionFactor_root_isIntegral hf hroot
  let pb : PowerBasis K L := PowerBasis.ofAdjoinEqTop hα hgen
  let : FiniteDimensional K L := pb.finite
  let : Algebra.IsAlgebraic K L := inferInstance
  change minpoly vK.Completion
      (absoluteValueExtension_embeddingOfExtension vK w α) =
    completionExtensionFactor_extensionFactor vK α w
  exact completionExtensionFactor_embeddingOfExtension_minpoly vK α w
 



noncomputable def completionExtensionFactor_extensionEquivFactors
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    {α : L} {f : K[X]} (hf : Irreducible f)
    (hroot : Polynomial.aeval α f = 0)
    (hgen : Algebra.adjoin K ({α} : Set L) = ⊤) :
    AbsoluteValueExtension vK L ≃
      CompletionExtensionFactorCompletionFactors vK f := by
  let e := completionExtensionFactor_extensionsEquivCompletionFactorsAux
    vK hvK hf hroot hgen
  apply Equiv.ofBijective
    (completionExtensionFactor_extensionToFactor vK hf hroot)
  have heq : completionExtensionFactor_extensionToFactor vK hf hroot = e := by
    funext w
    apply Subtype.ext
    exact (completionExtensionFactor_extensionsEquivCompletionFactorsAux_apply
      vK hvK hf hroot hgen w).symm
  rw [heq]
  exact e.bijective
end Valuations
end AlgebraicNumberTheory
end
end

/- ValuedFieldTheory.Valuation.Completion.SeparablePolynomialFactors -/
section
noncomputable section
open Polynomial UniqueFactorizationMonoid
open scoped BigOperators
namespace ValuationTheory
namespace Completion
universe u
 

theorem separable_monic_eq_prod_distinctNormalizedFactors
    {F : Type u} [Field F] (p : F[X])
    (hpmonic : p.Monic) (hpsep : p.Separable) :
    p = ∏ g : DistinctNormalizedFactors p, (g.1 : F[X]) := by
  classical
  let : NormalizationMonoid F := inferInstance
  let : NormalizationMonoid F[X] := Polynomial.instNormalizationMonoid
  have hp0 : p ≠ 0 := hpmonic.ne_zero
  have hnodup : (normalizedFactors p).Nodup :=
    (squarefree_iff_nodup_normalizedFactors hp0).1 hpsep.squarefree
  have hprod : (normalizedFactors p).prod = p := by
    simpa [hpmonic.leadingCoeff] using
      (Polynomial.leadingCoeff_mul_prod_normalizedFactors p)
  calc
    p = (normalizedFactors p).prod := hprod.symm
    _ = ∏ g : DistinctNormalizedFactors p, (g.1 : F[X]) := by
      change (normalizedFactors p).prod =
        ∏ g : {g : F[X] // g ∈ (normalizedFactors p).toFinset}, g.1
      rw [Finset.univ_eq_attach,
        Finset.prod_attach (f := fun x : F[X] ↦ x)]
      change (normalizedFactors p).prod =
        ((normalizedFactors p).toFinset.1.map id).prod
      rw [Multiset.toFinset_val, hnodup.dedup, Multiset.map_id]
 
theorem distinctNormalizedFactors_pairwise_coprime
    {F : Type u} [Field F] (p : F[X]) :
    ∀ i j : DistinctNormalizedFactors p, i ≠ j →
      IsCoprime (i.1 : F[X]) j.1 := by
  classical
  let : NormalizationMonoid F := inferInstance
  let : NormalizationMonoid F[X] := Polynomial.instNormalizationMonoid
  intro i j hij
  have hnorm : polynomialNormalizedFactors p = normalizedFactors p := by
    rfl
  have hi : i.1 ∈ normalizedFactors p := by
    rw [← hnorm]
    exact Multiset.mem_toFinset.mp i.2
  have hj : j.1 ∈ normalizedFactors p := by
    rw [← hnorm]
    exact Multiset.mem_toFinset.mp j.2
  rcases (prime_of_normalized_factor i.1 hi).irreducible.isCoprime_or_dvd j.1 with h | h
  · exact h
  · exfalso
    apply hij
    apply Subtype.ext
    exact normalizedFactors_eq_of_dvd p i.1 hi j.1 hj h
end Completion
end ValuationTheory
end
end

/- ValuedFieldTheory.Valuation.Completion.BaseChangeAdjoinRoot -/
section
noncomputable section
namespace ValuationTheory
namespace Completion
universe u v w
open scoped TensorProduct Polynomial
 
noncomputable def powerBasisBaseChange
    {K A L : Type*} [Field K] [Field A] [Field L]
    [Algebra K A] [Algebra K L]
    (pb : PowerBasis K L) : PowerBasis A (A ⊗[K] L) where
  gen := 1 ⊗ₜ[K] pb.gen
  dim := pb.dim
  basis := Algebra.TensorProduct.basis A pb.basis
  basis_eq_pow i := by
    rw [Algebra.TensorProduct.basis_apply, pb.basis_eq_pow]
    simp [Algebra.TensorProduct.tmul_pow]
 
@[simp]
theorem powerBasisBaseChange_gen
    {K A L : Type*} [Field K] [Field A] [Field L]
    [Algebra K A] [Algebra K L]
    (pb : PowerBasis K L) :
    (powerBasisBaseChange (A := A) pb).gen = 1 ⊗ₜ[K] pb.gen :=
  rfl
 
theorem minpoly_map_aeval_one_tmul
    {K A L : Type*} [Field K] [Field A] [Field L]
    [Algebra K A] [Algebra K L]
    (pb : PowerBasis K L) :
    Polynomial.aeval (1 ⊗ₜ[K] pb.gen : A ⊗[K] L)
      ((minpoly K pb.gen).map (algebraMap K A)) = 0 := by
  rw [Polynomial.aeval_map_algebraMap]
  show Polynomial.aeval
      ((Algebra.TensorProduct.includeRight : L →ₐ[K] A ⊗[K] L) pb.gen)
        (minpoly K pb.gen) = 0
  rw [Polynomial.aeval_algHom_apply, minpoly.aeval, map_zero]
 

noncomputable def adjoinRootToBaseChange
    {K A L : Type*} [Field K] [Field A] [Field L]
    [Algebra K A] [Algebra K L]
    (pb : PowerBasis K L) :
    AdjoinRoot ((minpoly K pb.gen).map (algebraMap K A)) →ₐ[A]
      A ⊗[K] L :=
  AdjoinRoot.liftAlgHom _ (Algebra.ofId A (A ⊗[K] L))
    (1 ⊗ₜ[K] pb.gen) (by
      change Polynomial.aeval (1 ⊗ₜ[K] pb.gen : A ⊗[K] L)
        ((minpoly K pb.gen).map (algebraMap K A)) = 0
      exact minpoly_map_aeval_one_tmul (A := A) pb)
 
@[simp]
theorem adjoinRootToBaseChange_root
    {K A L : Type*} [Field K] [Field A] [Field L]
    [Algebra K A] [Algebra K L]
    (pb : PowerBasis K L) :
    adjoinRootToBaseChange (A := A) pb
        (AdjoinRoot.root ((minpoly K pb.gen).map (algebraMap K A))) =
      1 ⊗ₜ[K] pb.gen := by
  simp [adjoinRootToBaseChange]
 
theorem adjoinRootToBaseChange_surjective
    {K A L : Type*} [Field K] [Field A] [Field L]
    [Algebra K A] [Algebra K L]
    (pb : PowerBasis K L) :
    Function.Surjective (adjoinRootToBaseChange (A := A) pb) := by
  let q := (minpoly K pb.gen).map (algebraMap K A)
  let e := adjoinRootToBaseChange (A := A) pb
  let b := (powerBasisBaseChange (A := A) pb).basis
  change Function.Surjective e.toLinearMap
  rw [← e.toLinearMap.range_eq_top]
  apply top_unique
  rw [← b.span_eq]
  apply Submodule.span_le.2
  rintro _ ⟨i, rfl⟩
  refine ⟨AdjoinRoot.root q ^ (i : ℕ), ?_⟩
  change e (AdjoinRoot.root q ^ (i : ℕ)) = b i
  rw [map_pow, (powerBasisBaseChange (A := A) pb).basis_eq_pow,
    adjoinRootToBaseChange_root]
  rw [powerBasisBaseChange_gen, Algebra.TensorProduct.tmul_pow, one_pow]
 
theorem adjoinRoot_baseChange_finrank_eq
    {K A L : Type*} [Field K] [Field A] [Field L]
    [Algebra K A] [Algebra K L]
    (pb : PowerBasis K L) :
    Module.finrank A
        (AdjoinRoot ((minpoly K pb.gen).map (algebraMap K A))) =
      Module.finrank A (A ⊗[K] L) := by
  let q := (minpoly K pb.gen).map (algebraMap K A)
  let hq : q.Monic :=
    (minpoly.monic pb.isIntegral_gen).map (algebraMap K A)
  let qpb : PowerBasis A (AdjoinRoot q) := AdjoinRoot.powerBasis' hq
  calc
    Module.finrank A (AdjoinRoot q) = q.natDegree := qpb.finrank
    _ = (minpoly K pb.gen).natDegree :=
      (minpoly.monic pb.isIntegral_gen).natDegree_map (algebraMap K A)
    _ = pb.dim := pb.natDegree_minpoly
    _ = Module.finrank A (A ⊗[K] L) :=
      (powerBasisBaseChange (A := A) pb).finrank.symm
 

noncomputable def adjoinRootEquivBaseChange
    {K A L : Type*} [Field K] [Field A] [Field L]
    [Algebra K A] [Algebra K L]
    (pb : PowerBasis K L) :
    AdjoinRoot ((minpoly K pb.gen).map (algebraMap K A)) ≃ₐ[A]
      A ⊗[K] L := by
  let q := (minpoly K pb.gen).map (algebraMap K A)
  let hq : q.Monic :=
    (minpoly.monic pb.isIntegral_gen).map (algebraMap K A)
  letI : Module.Finite A (AdjoinRoot q) := hq.finite_adjoinRoot
  letI : Module.Finite A (A ⊗[K] L) :=
    (powerBasisBaseChange (A := A) pb).finite
  exact AlgEquiv.ofBijective (adjoinRootToBaseChange (A := A) pb)
    ⟨(LinearMap.injective_iff_surjective_of_finrank_eq_finrank
        (adjoinRoot_baseChange_finrank_eq (A := A) pb)
        (f := (adjoinRootToBaseChange (A := A) pb).toLinearMap)).2
      (adjoinRootToBaseChange_surjective (A := A) pb),
      adjoinRootToBaseChange_surjective (A := A) pb⟩
 
@[simp]
theorem adjoinRootEquivBaseChange_root
    {K A L : Type*} [Field K] [Field A] [Field L]
    [Algebra K A] [Algebra K L]
    (pb : PowerBasis K L) :
    adjoinRootEquivBaseChange (A := A) pb
        (AdjoinRoot.root ((minpoly K pb.gen).map (algebraMap K A))) =
      1 ⊗ₜ[K] pb.gen := by
  change adjoinRootToBaseChange (A := A) pb
      (AdjoinRoot.root ((minpoly K pb.gen).map (algebraMap K A))) = _
  exact adjoinRootToBaseChange_root (A := A) pb
 
noncomputable def baseChangeEquivAdjoinRoot
    {K A L : Type*} [Field K] [Field A] [Field L]
    [Algebra K A] [Algebra K L]
    (pb : PowerBasis K L) :
    A ⊗[K] L ≃ₐ[A]
      AdjoinRoot ((minpoly K pb.gen).map (algebraMap K A)) :=
  (adjoinRootEquivBaseChange (A := A) pb).symm
 
@[simp]
theorem baseChangeEquivAdjoinRoot_one_tmul_gen
    {K A L : Type*} [Field K] [Field A] [Field L]
    [Algebra K A] [Algebra K L]
    (pb : PowerBasis K L) :
    baseChangeEquivAdjoinRoot (A := A) pb (1 ⊗ₜ[K] pb.gen) =
      AdjoinRoot.root ((minpoly K pb.gen).map (algebraMap K A)) := by
  change (adjoinRootEquivBaseChange (A := A) pb).symm
      (1 ⊗ₜ[K] pb.gen) = _
  rw [← adjoinRootEquivBaseChange_root]
  exact (adjoinRootEquivBaseChange (A := A) pb).symm_apply_apply _
end Completion
end ValuationTheory
end
end

/- ValuedFieldTheory.Valuation.Completion.PolynomialCRT -/
section
noncomputable section
namespace ValuationTheory
namespace Completion
universe u v
open scoped Polynomial
open Function
 

noncomputable def quotientInfAlgEquivPiQuotient
    {R A : Type*} [CommRing R] [CommRing A] [Algebra R A]
    {ι : Type*} [Finite ι]
    (I : ι → Ideal A) (hI : Pairwise (IsCoprime on I)) :
    (A ⧸ ⨅ i, I i) ≃ₐ[R] ∀ i, A ⧸ I i where
  __ := Ideal.quotientInfRingEquivPiQuotient I hI
  commutes' r := by
    ext i
    rfl
 


noncomputable def adjoinRootProdEquivPi
    {F : Type u} [Field F] {ι : Type v} [Fintype ι]
    (f : ι → F[X])
    (hf : ∀ i j, i ≠ j → IsCoprime (f i) (f j)) :
    AdjoinRoot (∏ i, f i) ≃ₐ[F] ∀ i, AdjoinRoot (f i) := by
  let I : ι → Ideal F[X] := fun i => Ideal.span ({f i} : Set F[X])
  have hI : Pairwise (IsCoprime on I) := by
    intro i j hij
    exact (Ideal.isCoprime_span_singleton_iff (f i) (f j)).2
      (hf i j hij)
  have hInf : Ideal.span ({∏ i, f i} : Set F[X]) = ⨅ i, I i := by
    symm
    exact Ideal.iInf_span_singleton hf
  exact
    (Ideal.quotientEquivAlgOfEq F hInf).trans
      (quotientInfAlgEquivPiQuotient I hI)
 

@[simp]
theorem adjoinRootProdEquivPi_mk
    {F : Type u} [Field F] {ι : Type v} [Fintype ι]
    (f : ι → F[X])
    (hf : ∀ i j, i ≠ j → IsCoprime (f i) (f j))
    (g : F[X]) (i : ι) :
    adjoinRootProdEquivPi f hf (AdjoinRoot.mk (∏ i, f i) g) i =
      AdjoinRoot.mk (f i) g := by
  change Ideal.Quotient.mk (Ideal.span ({f i} : Set F[X])) g =
    Ideal.Quotient.mk (Ideal.span ({f i} : Set F[X])) g
  rfl
end Completion
end ValuationTheory
end
end

/- ValuedFieldTheory.Valuation.Completion.CanonicalTensorMap -/
section
noncomputable section
namespace AlgebraicNumberTheory
namespace Valuations
universe u v
open scoped TensorProduct
 
noncomputable def completionTensorMap_leftCanonicalHom
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) :
    letI : ∀ w : AbsoluteValueExtension vK L,
        Algebra vK.Completion w.1.Completion :=
      fun w ↦ AbsoluteValue.completionAlgebra vK w.1 w.2
    vK.Completion ⊗[K] L →ₐ[vK.Completion]
      ∀ w : AbsoluteValueExtension vK L, w.1.Completion := by
  letI : ∀ w : AbsoluteValueExtension vK L,
      Algebra vK.Completion w.1.Completion :=
    fun w ↦ AbsoluteValue.completionAlgebra vK w.1 w.2
  exact AlgHom.pi fun w ↦
    absoluteValueExtension_localizationTensorHom vK w
@[simp]
theorem completionTensorMap_leftCanonicalHom_tmul_apply
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (b : vK.Completion) (a : L)
    (w : AbsoluteValueExtension vK L) :
    letI : ∀ w : AbsoluteValueExtension vK L,
        Algebra vK.Completion w.1.Completion :=
      fun w ↦ AbsoluteValue.completionAlgebra vK w.1 w.2
    completionTensorMap_leftCanonicalHom vK (b ⊗ₜ[K] a) w =
      algebraMap vK.Completion w.1.Completion b *
        AbsoluteValue.toCompletionAlgHom (K := K) w.1 a := by
  let : ∀ w : AbsoluteValueExtension vK L,
      Algebra vK.Completion w.1.Completion :=
    fun w ↦ AbsoluteValue.completionAlgebra vK w.1 w.2
  exact absoluteValueExtension_localizationTensorHom_tmul vK w b a
end Valuations
end AlgebraicNumberTheory
end
end

/- ValuedFieldTheory.Valuation.Completion.TensorProductDecomposition -/
section
noncomputable section
open Polynomial
open scoped BigOperators TensorProduct
open ValuationTheory.Completion
namespace AlgebraicNumberTheory
namespace Valuations
universe u v
 

noncomputable def completionTensorDecomposition_powerBasis
    (K : Type u) (L : Type v) [Field K] [Field L] [Algebra K L]
    [FiniteDimensional K L] [Algebra.IsSeparable K L] : PowerBasis K L :=
  Field.powerBasisOfFiniteOfSeparable K L
 
noncomputable abbrev completionTensorDecomposition_extensionFintype
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial) :
    Fintype (AbsoluteValueExtension vK L) := by
  let pb := completionTensorDecomposition_powerBasis K L
  let hf : Irreducible (minpoly K pb.gen) :=
    minpoly.irreducible pb.isIntegral_gen
  let e := completionExtensionFactor_extensionEquivFactors vK hvK hf
    (minpoly.aeval K pb.gen) pb.adjoin_gen_eq_top
  exact Fintype.ofEquiv _ e.symm
 

theorem completionTensorDecomposition_mapped_minpoly_eq_prod_extensionFactors
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial) :
    letI := completionTensorDecomposition_extensionFintype (K := K) (L := L) vK hvK
    (minpoly K (completionTensorDecomposition_powerBasis K L).gen).map
        (algebraMap K vK.Completion) =
      ∏ w : AbsoluteValueExtension vK L,
        completionExtensionFactor_extensionFactor vK
          (completionTensorDecomposition_powerBasis K L).gen w := by
  classical
  let := completionTensorDecomposition_extensionFintype (K := K) (L := L) vK hvK
  let pb := completionTensorDecomposition_powerBasis K L
  let p := (minpoly K pb.gen).map (algebraMap K vK.Completion)
  let hf : Irreducible (minpoly K pb.gen) :=
    minpoly.irreducible pb.isIntegral_gen
  let e := completionExtensionFactor_extensionEquivFactors vK hvK hf
    (minpoly.aeval K pb.gen) pb.adjoin_gen_eq_top
  have hpmonic : p.Monic :=
    (minpoly.monic pb.isIntegral_gen).map (algebraMap K vK.Completion)
  have hpsep : p.Separable :=
    Polynomial.Separable.map
      (Algebra.IsSeparable.isSeparable K (pb.gen : L))
  calc
    p = ∏ g : CompletionExtensionFactorCompletionFactors vK (minpoly K pb.gen),
        (g.1 : vK.Completion[X]) :=
      separable_monic_eq_prod_distinctNormalizedFactors p hpmonic hpsep
    _ = ∏ w : AbsoluteValueExtension vK L,
        completionExtensionFactor_extensionFactor vK pb.gen w := by
      symm
      exact Fintype.prod_equiv e _ _ (fun _ ↦ rfl)
 
theorem completionTensorDecomposition_extensionFactors_pairwise_coprime
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial) :
    letI := completionTensorDecomposition_extensionFintype (K := K) (L := L) vK hvK
    ∀ w w' : AbsoluteValueExtension vK L, w ≠ w' →
      IsCoprime
        (completionExtensionFactor_extensionFactor vK
          (completionTensorDecomposition_powerBasis K L).gen w)
        (completionExtensionFactor_extensionFactor vK
          (completionTensorDecomposition_powerBasis K L).gen w') := by
  classical
  let := completionTensorDecomposition_extensionFintype (K := K) (L := L) vK hvK
  let pb := completionTensorDecomposition_powerBasis K L
  let hf : Irreducible (minpoly K pb.gen) :=
    minpoly.irreducible pb.isIntegral_gen
  let e := completionExtensionFactor_extensionEquivFactors vK hvK hf
    (minpoly.aeval K pb.gen) pb.adjoin_gen_eq_top
  intro w w' hww'
  have he : e w ≠ e w' := fun h ↦ hww' (e.injective h)
  exact distinctNormalizedFactors_pairwise_coprime
    ((minpoly K pb.gen).map (algebraMap K vK.Completion))
    (e w) (e w') he
 

noncomputable def completionTensorDecomposition_factorEquiv
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial) :
    letI : ∀ w : AbsoluteValueExtension vK L,
        Algebra vK.Completion w.1.Completion :=
      fun w ↦ AbsoluteValue.completionAlgebra vK w.1 w.2
    vK.Completion ⊗[K] L ≃ₐ[vK.Completion]
      ∀ w : AbsoluteValueExtension vK L, w.1.Completion := by
  classical
  letI := completionTensorDecomposition_extensionFintype (K := K) (L := L) vK hvK
  let pb := completionTensorDecomposition_powerBasis K L
  let hα := pb.isIntegral_gen
  let hgen := pb.adjoin_gen_eq_top
  letI hK : ∀ w : AbsoluteValueExtension vK L,
      Algebra K w.1.Completion :=
    fun w ↦ AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  letI : ∀ w : AbsoluteValueExtension vK L, SMul K w.1.Completion :=
    fun w ↦ (hK w).toSMul
  letI : ∀ w : AbsoluteValueExtension vK L,
      Algebra vK.Completion w.1.Completion :=
    fun w ↦ AbsoluteValue.completionAlgebra vK w.1 w.2
  let ebase := baseChangeEquivAdjoinRoot (A := vK.Completion) pb
  let hprod := completionTensorDecomposition_mapped_minpoly_eq_prod_extensionFactors
    (K := K) (L := L) vK hvK
  let econgr := AdjoinRoot.algEquivOfEq vK.Completion _ _ hprod
  let ecrt := adjoinRootProdEquivPi
    (fun w : AbsoluteValueExtension vK L ↦
      completionExtensionFactor_extensionFactor vK pb.gen w)
    (completionTensorDecomposition_extensionFactors_pairwise_coprime
      (K := K) (L := L) vK hvK)
  let elocal := AlgEquiv.piCongrRight fun w ↦
    completionExtensionFactor_adjoinRootEquivCompletion
      vK hvK pb.gen hα hgen w
  exact ebase.trans (econgr.trans (ecrt.trans elocal))
 

@[simp]
theorem completionTensorDecomposition_factorEquiv_one_tmul_gen
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (w : AbsoluteValueExtension vK L) :
    letI : ∀ w : AbsoluteValueExtension vK L,
        Algebra vK.Completion w.1.Completion :=
      fun w ↦ AbsoluteValue.completionAlgebra vK w.1 w.2
    completionTensorDecomposition_factorEquiv (K := K) (L := L) vK hvK
        (1 ⊗ₜ[K] (completionTensorDecomposition_powerBasis K L).gen) w =
      AbsoluteValue.toCompletionAlgHom (K := K) w.1
        (completionTensorDecomposition_powerBasis K L).gen := by
  classical
  let := completionTensorDecomposition_extensionFintype (K := K) (L := L) vK hvK
  let pb := completionTensorDecomposition_powerBasis K L
  let hK : ∀ w : AbsoluteValueExtension vK L,
      Algebra K w.1.Completion :=
    fun w ↦ AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  let : ∀ w : AbsoluteValueExtension vK L, SMul K w.1.Completion :=
    fun w ↦ (hK w).toSMul
  let : ∀ w : AbsoluteValueExtension vK L,
      Algebra vK.Completion w.1.Completion :=
    fun w ↦ AbsoluteValue.completionAlgebra vK w.1 w.2
  let factors := fun w : AbsoluteValueExtension vK L ↦
    completionExtensionFactor_extensionFactor vK pb.gen w
  let hcop := completionTensorDecomposition_extensionFactors_pairwise_coprime
    (K := K) (L := L) vK hvK
  let ebase := baseChangeEquivAdjoinRoot (A := vK.Completion) pb
  let hprod := completionTensorDecomposition_mapped_minpoly_eq_prod_extensionFactors
    (K := K) (L := L) vK hvK
  let econgr := AdjoinRoot.algEquivOfEq vK.Completion _ _ hprod
  let ecrt := adjoinRootProdEquivPi factors hcop
  let elocal := AlgEquiv.piCongrRight fun w ↦
    completionExtensionFactor_adjoinRootEquivCompletion
      vK hvK pb.gen pb.isIntegral_gen pb.adjoin_gen_eq_top w
  change elocal (ecrt (econgr (ebase (1 ⊗ₜ[K] pb.gen)))) w = _
  rw [baseChangeEquivAdjoinRoot_one_tmul_gen,
    AdjoinRoot.algEquivOfEq_root]
  change
    (completionExtensionFactor_adjoinRootEquivCompletion
      vK hvK pb.gen pb.isIntegral_gen pb.adjoin_gen_eq_top w)
        (adjoinRootProdEquivPi factors hcop
          (AdjoinRoot.mk (∏ w, factors w) X) w) = _
  rw [adjoinRootProdEquivPi_mk]
  exact completionExtensionFactor_adjoinRootEquivCompletion_root
    vK hvK pb.gen pb.isIntegral_gen pb.adjoin_gen_eq_top w
 

theorem completionTensorDecomposition_factorEquiv_toAlgHom
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial) :
    letI : ∀ w : AbsoluteValueExtension vK L,
        Algebra vK.Completion w.1.Completion :=
      fun w ↦ AbsoluteValue.completionAlgebra vK w.1 w.2
    (completionTensorDecomposition_factorEquiv (K := K) (L := L) vK hvK).toAlgHom =
      completionTensorMap_leftCanonicalHom vK := by
  classical
  let := completionTensorDecomposition_extensionFintype (K := K) (L := L) vK hvK
  let pb := completionTensorDecomposition_powerBasis K L
  let hK : ∀ w : AbsoluteValueExtension vK L,
      Algebra K w.1.Completion :=
    fun w ↦ AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  let : ∀ w : AbsoluteValueExtension vK L, SMul K w.1.Completion :=
    fun w ↦ (hK w).toSMul
  let : ∀ w : AbsoluteValueExtension vK L,
      Algebra vK.Completion w.1.Completion :=
    fun w ↦ AbsoluteValue.completionAlgebra vK w.1 w.2
  apply (powerBasisBaseChange (A := vK.Completion) pb).algHom_ext
  funext w
  change
    completionTensorDecomposition_factorEquiv (K := K) (L := L) vK hvK
        (1 ⊗ₜ[K] (completionTensorDecomposition_powerBasis K L).gen) w =
      completionTensorMap_leftCanonicalHom (K := K) (L := L) vK
        (1 ⊗ₜ[K] (completionTensorDecomposition_powerBasis K L).gen) w
  rw [completionTensorDecomposition_factorEquiv_one_tmul_gen
      (K := K) (L := L) vK hvK w,
    completionTensorMap_leftCanonicalHom_tmul_apply]
  simp
 
theorem completionTensorDecomposition_leftCanonicalHom_bijective
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial) :
    letI : ∀ w : AbsoluteValueExtension vK L,
        Algebra vK.Completion w.1.Completion :=
      fun w ↦ AbsoluteValue.completionAlgebra vK w.1 w.2
    Function.Bijective
      (completionTensorMap_leftCanonicalHom (K := K) (L := L) vK) := by
  classical
  let : ∀ w : AbsoluteValueExtension vK L,
      Algebra vK.Completion w.1.Completion :=
    fun w ↦ AbsoluteValue.completionAlgebra vK w.1 w.2
  rw [← completionTensorDecomposition_factorEquiv_toAlgHom
    (K := K) (L := L) vK hvK]
  exact (completionTensorDecomposition_factorEquiv
    (K := K) (L := L) vK hvK).bijective
 

noncomputable def completionTensorDecomposition_left
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial) :
    letI : ∀ w : AbsoluteValueExtension vK L,
        Algebra vK.Completion w.1.Completion :=
      fun w ↦ AbsoluteValue.completionAlgebra vK w.1 w.2
    vK.Completion ⊗[K] L ≃ₐ[vK.Completion]
      ∀ w : AbsoluteValueExtension vK L, w.1.Completion := by
  letI : ∀ w : AbsoluteValueExtension vK L,
      Algebra vK.Completion w.1.Completion :=
    fun w ↦ AbsoluteValue.completionAlgebra vK w.1 w.2
  exact AlgEquiv.ofBijective
    (completionTensorMap_leftCanonicalHom (K := K) (L := L) vK)
    (completionTensorDecomposition_leftCanonicalHom_bijective
      (K := K) (L := L) vK hvK)
end Valuations
end AlgebraicNumberTheory
end
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
end UnitNorm
section Valuation
variable [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
variable [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
variable [Algebra K L]
end Valuation
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

/- ValuedFieldTheory.LocalField.NonarchimedeanLocalField.IdealQuotients -/
section
namespace LocalFieldTheory
noncomputable section
universe u
open scoped ValuativeRel
 

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
 


theorem v_integerRingUniformizerFieldUnit
    (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] :
    LocalFieldTheory.IsNonarchimedeanLocalField.v K
      (Additive.ofMul (integerRingUniformizerFieldUnit K)) = -1 := by
  exact v_integerRingIrreducibleFieldUnit K
    (chosenIntegerRingUniformizer K) (chosenIntegerRingUniformizer_irreducible K)
    (integerRingUniformizerFieldUnit K) rfl
 


theorem v_inverseIntegerRingUniformizerFieldUnit
    (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] :
    LocalFieldTheory.IsNonarchimedeanLocalField.v K
      (Additive.ofMul (inverseIntegerRingUniformizerFieldUnit K)) = 1 := by
  rw [inverseIntegerRingUniformizerFieldUnit]
  exact v_integerRingIrreducibleFieldUnit_inv K
    (chosenIntegerRingUniformizer K) (chosenIntegerRingUniformizer_irreducible K)
    (integerRingUniformizerFieldUnit K) rfl
 

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
 
theorem uniformizerUnitFactor_mul_uniformizer_zpow (K : Type u)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (ϖ : Kˣ) (hϖ : valuationMap K (Additive.ofMul ϖ) = 1) (x : Kˣ) :
    integerUnitsToFieldUnits K (uniformizerUnitFactor K ϖ hϖ x) *
        ϖ ^ valuationMap K (Additive.ofMul x) = x := by
  rw [integerUnitsToFieldUnits_uniformizerUnitFactor]
  simp [div_eq_mul_inv, mul_assoc]
end IsNonarchimedeanLocalField
end
end LocalFieldTheory
end

/- ValuedFieldTheory.Valuation.Completion.FiniteProductNormTrace -/
section
noncomputable section
namespace ValuationTheory
namespace Completion
universe u v w
open Module
 

theorem moduleFiniteOfPi
    {R : Type u} [Semiring R]
    {ι : Type v} (M : ι → Type w)
    [∀ i, AddCommMonoid (M i)] [∀ i, Module R (M i)]
    [Module.Finite R (∀ i, M i)] (i : ι) :
    Module.Finite R (M i) := by
  classical
  apply Module.Finite.of_surjective (LinearMap.proj i)
  intro x
  exact ⟨Pi.single i x, by simp⟩
end Completion
end ValuationTheory
end
end

/- ValuedFieldTheory.Valuation.Completion.DegreeNormTrace -/
section
noncomputable section
open scoped BigOperators TensorProduct
open ValuationTheory.Completion
namespace AlgebraicNumberTheory
namespace Valuations
universe u v
 

theorem completionModuleFinite
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (w : AbsoluteValueExtension vK L) :
    letI := AbsoluteValue.completionAlgebra vK w.1 w.2
    Module.Finite vK.Completion w.1.Completion := by
  let : ∀ w : AbsoluteValueExtension vK L,
      Algebra vK.Completion w.1.Completion :=
    fun w ↦ AbsoluteValue.completionAlgebra vK w.1 w.2
  let : Module.Finite vK.Completion (vK.Completion ⊗[K] L) :=
    inferInstance
  let : Module.Finite vK.Completion
      (∀ w : AbsoluteValueExtension vK L, w.1.Completion) :=
    Module.Finite.equiv (completionTensorDecomposition_left vK hvK).toLinearEquiv
  exact moduleFiniteOfPi
    (fun w : AbsoluteValueExtension vK L ↦ w.1.Completion) w
end Valuations
end AlgebraicNumberTheory
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.Idele.IdealMap -/
section
open scoped NumberField RestrictedProduct WithZero
open NumberField IsDedekindDomain
noncomputable section
variable {K : Type*} [Field K] [NumberField K]
namespace FiniteIdeleGroup
 

def localOrder (v : HeightOneSpectrum (𝓞 K)) :
    (v.adicCompletion K)ˣ →* Multiplicative ℤ :=
  MonoidHom.mk'
    (fun x => Multiplicative.ofAdd (-WithZero.log (Valued.v (x : v.adicCompletion K))))
    fun x y => by
      apply Multiplicative.ext
      simp [WithZero.log_mul, add_comm]
@[simp]
theorem localOrder_apply (v : HeightOneSpectrum (𝓞 K))
    (x : (v.adicCompletion K)ˣ) :
    (localOrder v x).toAdd =
      -WithZero.log (Valued.v (x : v.adicCompletion K)) :=
  rfl
end FiniteIdeleGroup
namespace FractionalIdealGroup
end FractionalIdealGroup
namespace FiniteIdeleGroup
end FiniteIdeleGroup
namespace IdeleGroup
end IdeleGroup
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.Idele.LocallyCompact -/
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

/- ValuedFieldTheory.LocalField.NonarchimedeanLocalField.SeparableNormValuation -/
section
namespace LocalClassFieldTheory

noncomputable section
universe u v w
open scoped BigOperators ValuativeRel
open LocalFieldTheory LocalFieldTheory.IsNonarchimedeanLocalField
local instance fractionScalar (R S : Type*) [CommRing R] [CommRing S] [IsDomain R] [IsDomain S]
    [Algebra R S] [Module.IsTorsionFree R S] : Algebra (FractionRing R) (FractionRing S) := FractionRing.liftAlgebra R _
section SeparableIdealNorm
variable (R : Type u) (S : Type v)
  [CommRing R] [IsDomain R] [CommRing S] [IsDomain S]
  [IsIntegrallyClosed R] [IsIntegrallyClosed S]
  [Algebra R S] [Module.Finite R S] [Module.IsTorsionFree R S]
 



private theorem intermediateNormalClosure_isSeparable_of_isSeparable
    (K : Type u) (L : Type v) (A : Type w)
    [Field K] [Field L] [Field A]
    [Algebra K L] [Algebra K A] [Algebra L A]
    [IsScalarTower K L A] [Algebra.IsSeparable K L] :
    Algebra.IsSeparable K (IntermediateField.normalClosure K L A) := by
  change Algebra.IsSeparable K ↥(⨆ f : L →ₐ[K] A, f.fieldRange)
  exact IntermediateField.isSeparable_iSup K A
    (h := fun f => AlgEquiv.Algebra.isSeparable (AlgEquiv.ofInjectiveField f))
 

private theorem intermediateNormalClosure_isGalois_of_isSeparable
    (K : Type u) (L : Type v) (A : Type w)
    [Field K] [Field L] [Field A]
    [Algebra K L] [Algebra K A] [Algebra L A]
    [IsScalarTower K L A] [FiniteDimensional K L]
    [Algebra.IsSeparable K L] [Normal K A] :
    IsGalois K (IntermediateField.normalClosure K L A) := by
  exact
    { to_isSeparable :=
        intermediateNormalClosure_isSeparable_of_isSeparable K L A
      to_normal := normalClosure.normal K L A }
 

private theorem intermediateNormalClosure_finiteDimensional_top
    (K : Type u) (L : Type v) (A : Type w)
    [Field K] [Field L] [Field A]
    [Algebra K L] [Algebra K A] [Algebra L A]
    [IsScalarTower K L A] [FiniteDimensional K L] :
    let E := IntermediateField.normalClosure K L A
    letI : Algebra L E := normalClosure.algebra K L A
    FiniteDimensional L E := by
  exact Module.Finite.right K L (IntermediateField.normalClosure K L A)
omit [IsIntegrallyClosed R] [IsIntegrallyClosed S] in
 

private theorem ringNormalClosure_isFractionRing :
    let K := FractionRing R
    let L := FractionRing S
    let A := AlgebraicClosure L
    let E := IntermediateField.normalClosure K L A
    let T := Ring.NormalClosure R S
    letI : Algebra L E := normalClosure.algebra K L A
    letI : Algebra S E := ((algebraMap L E).comp (algebraMap S L)).toAlgebra
    letI : Algebra T E := by
      change Algebra (integralClosure S E) E
      infer_instance
    IsFractionRing T E := by
  let K := FractionRing R
  let L := FractionRing S
  let A := AlgebraicClosure L
  let E := IntermediateField.normalClosure K L A
  let T := Ring.NormalClosure R S
  let : Algebra S E := ((algebraMap L E).comp (algebraMap S L)).toAlgebra
  let : IsScalarTower S L E := IsScalarTower.of_algebraMap_eq' rfl
  let : Algebra T E := by
    change Algebra (integralClosure S E) E
    infer_instance
  let : FiniteDimensional L E :=
    intermediateNormalClosure_finiteDimensional_top K L A
  change IsFractionRing (integralClosure S E) E
  exact integralClosure.isFractionRing_of_finite_extension L E
omit [IsIntegrallyClosed R] [IsIntegrallyClosed S] in
 

private theorem ringNormalClosure_isGalois_transport :
    let K := FractionRing R
    let L := FractionRing S
    let A := AlgebraicClosure L
    let E := IntermediateField.normalClosure K L A
    let T := Ring.NormalClosure R S
    letI : Algebra K E := SubalgebraClass.toAlgebra E
    letI : Algebra K (FractionRing T) :=
      FractionRing.liftAlgebra R (FractionRing T)
    IsGalois K E → IsGalois K (FractionRing T) := by
  simp only
  let K := FractionRing R
  let L := FractionRing S
  let A := AlgebraicClosure L
  let E := IntermediateField.normalClosure K L A
  let T := Ring.NormalClosure R S
  let : Algebra S E := ((algebraMap L E).comp (algebraMap S L)).toAlgebra
  let : IsScalarTower S L E := IsScalarTower.of_algebraMap_eq' rfl
  let : Algebra T E := by
    change Algebra (integralClosure S E) E
    infer_instance
  let : IsScalarTower S T E :=
    IsScalarTower.subalgebra' S E E (integralClosure S E)
  let : IsScalarTower R L E := IsScalarTower.to₁₃₄ R K L E
  let : IsScalarTower R S E := IsScalarTower.to₁₂₄ R S L E
  let : IsScalarTower R T E := IsScalarTower.to₁₃₄ R S T E
  let : IsFractionRing T E := ringNormalClosure_isFractionRing R S
  intro hGalois
  refine IsGalois.of_equiv_equiv (F := K) («E» := E)
    (f := (FractionRing.algEquiv R K).symm.toRingEquiv)
    (g := (FractionRing.algEquiv T E).symm.toRingEquiv) ?_
  ext
  simpa using IsFractionRing.algEquiv_commutes
    (FractionRing.algEquiv R K).symm
    (FractionRing.algEquiv T E).symm _
omit [IsIntegrallyClosed R] in
 

private theorem ringNormalClosure_moduleFinite_of_isSeparable
    [IsNoetherianRing S]
    [Algebra.IsSeparable (FractionRing R) (FractionRing S)] :
    Module.Finite S (Ring.NormalClosure R S) := by
  let K := FractionRing R
  let L := FractionRing S
  let A := AlgebraicClosure L
  let E := IntermediateField.normalClosure K L A
  let T := Ring.NormalClosure R S
  let : Algebra S E := ((algebraMap L E).comp (algebraMap S L)).toAlgebra
  let : IsScalarTower S L E := IsScalarTower.of_algebraMap_eq' rfl
  let : Algebra T E := by
    change Algebra (integralClosure S E) E
    infer_instance
  let : IsScalarTower S T E :=
    IsScalarTower.subalgebra' S E E (integralClosure S E)
  let : IsIntegralClosure T S E := integralClosure.isIntegralClosure S E
  let : FiniteDimensional L E :=
    intermediateNormalClosure_finiteDimensional_top K L A
  let : Algebra.IsSeparable K E :=
    intermediateNormalClosure_isSeparable_of_isSeparable K L A
  let : Algebra.IsSeparable L E :=
    Algebra.isSeparable_tower_top_of_isSeparable K L E
  change Module.Finite S (integralClosure S E)
  exact IsIntegralClosure.finite S L E (integralClosure S E)
end SeparableIdealNorm
section SeparableIdealNormDedekind
variable (R : Type u) (S : Type v)
  [CommRing R] [IsDomain R] [CommRing S] [IsDedekindDomain S]
  [Algebra R S] [Module.Finite R S] [Module.IsTorsionFree R S]
 

private theorem ringNormalClosure_isDedekindDomain_of_isSeparable
    [Algebra.IsSeparable (FractionRing R) (FractionRing S)] :
    IsDedekindDomain (Ring.NormalClosure R S) := by
  let K := FractionRing R
  let L := FractionRing S
  let A := AlgebraicClosure L
  let E := IntermediateField.normalClosure K L A
  let T := Ring.NormalClosure R S
  let : Algebra S E := ((algebraMap L E).comp (algebraMap S L)).toAlgebra
  let : IsScalarTower S L E := IsScalarTower.of_algebraMap_eq' rfl
  let : Algebra T E := by
    change Algebra (integralClosure S E) E
    infer_instance
  let : IsScalarTower S T E :=
    IsScalarTower.subalgebra' S E E (integralClosure S E)
  let : IsIntegralClosure T S E := integralClosure.isIntegralClosure S E
  let : FiniteDimensional L E :=
    intermediateNormalClosure_finiteDimensional_top K L A
  let : Algebra.IsSeparable K E :=
    intermediateNormalClosure_isSeparable_of_isSeparable K L A
  let : Algebra.IsSeparable L E :=
    Algebra.isSeparable_tower_top_of_isSeparable K L E
  change IsDedekindDomain (integralClosure S E)
  exact integralClosure.isDedekindDomain S L E
end SeparableIdealNormDedekind
section SeparableIdealNormGalois
variable (R : Type u) (S : Type v)
  [CommRing R] [IsDomain R] [CommRing S] [IsDomain S]
  [Algebra R S] [Module.Finite R S] [Module.IsTorsionFree R S]
 



theorem ringNormalClosure_isGalois_of_isSeparable
    [Algebra.IsSeparable (FractionRing R) (FractionRing S)] :
    IsGalois (FractionRing R)
      (FractionRing (Ring.NormalClosure R S)) := by
  let K := FractionRing R
  let L := FractionRing S
  let A := AlgebraicClosure L
  let E := IntermediateField.normalClosure K L A
  let T := Ring.NormalClosure R S
  exact ringNormalClosure_isGalois_transport R S
    (intermediateNormalClosure_isGalois_of_isSeparable K L A)
end SeparableIdealNormGalois
section SeparableIdealNormRelNorm
variable (R : Type u) (S : Type v)
  [CommRing R] [IsDedekindDomain R]
  [CommRing S] [IsDedekindDomain S]
  [Algebra R S] [Module.Finite R S] [Module.IsTorsionFree R S]
 


theorem relNorm_eq_pow_inertiaDeg_of_isSeparable
    [Algebra.IsSeparable (FractionRing R) (FractionRing S)]
    (P : Ideal S) (p : Ideal R) [P.LiesOver p]
    [P.IsMaximal] [p.IsMaximal] :
    Ideal.relNorm R P = p ^ P.inertiaDeg R := by
  let T := Ring.NormalClosure R S
  let : Module.Finite S T :=
    ringNormalClosure_moduleFinite_of_isSeparable R S
  let : Module.Finite R T := Module.Finite.trans S T
  let : IsDedekindDomain T :=
    ringNormalClosure_isDedekindDomain_of_isSeparable R S
  let : IsScalarTower R (FractionRing S) (FractionRing T) :=
    IsScalarTower.to₁₃₄ R S (FractionRing S) (FractionRing T)
  let : IsScalarTower (FractionRing R) (FractionRing S) (FractionRing T) :=
    IsScalarTower.of_algebraMap_eq' (by
      apply IsFractionRing.ringHom_ext (A := R)
      intro x
      rw [← IsScalarTower.algebraMap_apply R (FractionRing R) (FractionRing T)]
      change algebraMap R (FractionRing T) x =
        algebraMap (FractionRing S) (FractionRing T)
          (algebraMap (FractionRing R) (FractionRing S)
            (algebraMap R (FractionRing R) x))
      rw [← IsScalarTower.algebraMap_apply R (FractionRing R) (FractionRing S),
        ← IsScalarTower.algebraMap_apply R (FractionRing S) (FractionRing T)])
  let : IsGalois (FractionRing R) (FractionRing T) :=
    ringNormalClosure_isGalois_of_isSeparable R S
  let : IsGalois (FractionRing S) (FractionRing T) :=
    IsGalois.tower_top_of_isGalois
      (FractionRing R) (FractionRing S) (FractionRing T)
  obtain ⟨Q, hQm, hQP⟩ : ∃ Q : Ideal T, Q.IsMaximal ∧ Q.LiesOver P :=
    Ideal.exists_maximal_ideal_liesOver_of_isIntegral P
  let : Q.IsMaximal := hQm
  let : Q.LiesOver P := hQP
  let : Q.LiesOver p := Ideal.LiesOver.trans Q P p
  have h := Ideal.relNorm_eq_pow_of_isPrime_isGalois Q p
  rwa [← Ideal.relNorm_relNorm R S,
    Ideal.relNorm_eq_pow_of_isPrime_isGalois Q P, map_pow,
    Ideal.inertiaDeg_tower (R := R) P Q, pow_mul, pow_left_inj] at h
  exact Nat.ne_zero_iff_zero_lt.mpr (Ideal.inertiaDeg_pos Q S)
end SeparableIdealNormRelNorm
 

theorem fractionRing_integerRing_isSeparable
    (K : Type u) (L : Type v)
    [Field K] [ValuativeRel K]
    [Field L] [ValuativeRel L]
    [Algebra K L] [Algebra.IsSeparable K L]
    [Valuation.HasExtension (ValuativeRel.valuation K)
      (ValuativeRel.valuation L)] :
    Algebra.IsSeparable (FractionRing 𝒪[K]) (FractionRing 𝒪[L]) := by
  apply Algebra.IsSeparable.of_equiv_equiv
    (FractionRing.algEquiv 𝒪[K] K).symm.toRingEquiv
    (FractionRing.algEquiv 𝒪[L] L).symm.toRingEquiv
  ext x
  exact IsFractionRing.algEquiv_commutes
    (FractionRing.algEquiv 𝒪[K] K).symm
    (FractionRing.algEquiv 𝒪[L] L).symm x
 


theorem relNorm_maximalIdeal_eq_pow_residue_finrank
    (K : Type u) (L : Type v)
    [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L]
    [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L] [Algebra.IsSeparable K L]
    [Valuation.HasExtension (ValuativeRel.valuation K)
      (ValuativeRel.valuation L)]
    [Module.Finite 𝒪[K] 𝒪[L]] :
    Ideal.relNorm 𝒪[K] (𝓂[L] : Ideal 𝒪[L]) =
      (𝓂[K] : Ideal 𝒪[K]) ^ Module.finrank 𝓀[K] 𝓀[L] := by
  let : Algebra.IsSeparable (FractionRing 𝒪[K]) (FractionRing 𝒪[L]) :=
    fractionRing_integerRing_isSeparable K L
  have h := relNorm_eq_pow_inertiaDeg_of_isSeparable
    𝒪[K] 𝒪[L] (𝓂[L] : Ideal 𝒪[L]) (𝓂[K] : Ideal 𝒪[K])
  rw [← Ideal.inertiaDeg'_eq_inertiaDeg
      (𝓂[K] : Ideal 𝒪[K]) (𝓂[L] : Ideal 𝒪[L]),
    Ideal.inertiaDeg'_algebraMap] at h
  exact h
 


theorem v_normUnits_integerRingUniformizerFieldUnit_of_isSeparable
    (K : Type u) (L : Type v)
    [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L]
    [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L] [Algebra.IsSeparable K L]
    [Valuation.HasExtension (ValuativeRel.valuation K)
      (ValuativeRel.valuation L)]
    [IsIntegralClosure 𝒪[L] 𝒪[K] L] :
    v K (Additive.ofMul
        (normUnits K L (integerRingUniformizerFieldUnit L))) =
      -(Module.finrank 𝓀[K] 𝓀[L] : Int) := by
  let : Module.Finite 𝒪[K] 𝒪[L] :=
    IsIntegralClosure.finite 𝒪[K] K L 𝒪[L]
  let f : Nat := Module.finrank 𝓀[K] 𝓀[L]
  have hspan :
      Ideal.span
          ({Algebra.intNorm 𝒪[K] 𝒪[L]
            (chosenIntegerRingUniformizer L)} : Set 𝒪[K]) =
        Ideal.span ({chosenIntegerRingUniformizer K ^ f} : Set 𝒪[K]) := by
    calc
      Ideal.span
          ({Algebra.intNorm 𝒪[K] 𝒪[L]
            (chosenIntegerRingUniformizer L)} : Set 𝒪[K]) =
          Ideal.relNorm 𝒪[K]
            (Ideal.span ({chosenIntegerRingUniformizer L} : Set 𝒪[L])) := by
        exact (Ideal.spanNorm_singleton (R := 𝒪[K])
          (r := chosenIntegerRingUniformizer L)).symm
      _ = Ideal.relNorm 𝒪[K] (𝓂[L] : Ideal 𝒪[L]) := by
        rw [chosenIntegerRingUniformizer_maximalIdeal_eq L]
      _ = (𝓂[K] : Ideal 𝒪[K]) ^ f := by
        simpa [f] using relNorm_maximalIdeal_eq_pow_residue_finrank K L
      _ = Ideal.span ({chosenIntegerRingUniformizer K ^ f} : Set 𝒪[K]) :=
        maximalIdeal_pow_eq_span_uniformizer_pow K f
  obtain ⟨u, hu⟩ := Ideal.span_singleton_eq_span_singleton.mp hspan
  have hfieldUnits :
      normUnits K L (integerRingUniformizerFieldUnit L) *
        integerUnitsToFieldUnits K u =
      integerRingUniformizerFieldUnit K ^ f := by
    apply Units.ext
    have huField := congrArg (algebraMap 𝒪[K] K) hu
    rw [map_mul, Algebra.algebraMap_intNorm (K := K) (L := L)] at huField
    change
      Algebra.norm K (algebraMap 𝒪[L] L (chosenIntegerRingUniformizer L)) *
          algebraMap 𝒪[K] K (u : 𝒪[K]) =
        algebraMap 𝒪[K] K (chosenIntegerRingUniformizer K) ^ f
    exact huField
  have hvalue := congrArg
    (fun z : Kˣ => v K (Additive.ofMul z)) hfieldUnits
  change v K (Additive.ofMul
      (normUnits K L (integerRingUniformizerFieldUnit L) *
        integerUnitsToFieldUnits K u)) =
    v K (Additive.ofMul (integerRingUniformizerFieldUnit K ^ f)) at hvalue
  rw [v_mul, v_integerUnitsToFieldUnits, add_zero, v_pow,
    v_integerRingUniformizerFieldUnit] at hvalue
  simpa [f] using hvalue
 

theorem v_normUnits_inverseIntegerRingUniformizerFieldUnit_of_isSeparable
    (K : Type u) (L : Type v)
    [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L]
    [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L] [Algebra.IsSeparable K L]
    [Valuation.HasExtension (ValuativeRel.valuation K)
      (ValuativeRel.valuation L)]
    [IsIntegralClosure 𝒪[L] 𝒪[K] L] :
    v K (Additive.ofMul
        (normUnits K L (inverseIntegerRingUniformizerFieldUnit L))) =
      (Module.finrank 𝓀[K] 𝓀[L] : Int) := by
  rw [inverseIntegerRingUniformizerFieldUnit, map_inv, v_inv,
    v_normUnits_integerRingUniformizerFieldUnit_of_isSeparable]
  simp only [neg_neg]
 


theorem v_normUnits_eq_residue_finrank_mul_of_isSeparable
    (K : Type u) (L : Type v)
    [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K]
    [Field L] [ValuativeRel L] [TopologicalSpace L]
    [IsNonarchimedeanLocalField L]
    [Algebra K L] [FiniteDimensional K L] [Algebra.IsSeparable K L]
    [Valuation.HasExtension (ValuativeRel.valuation K)
      (ValuativeRel.valuation L)]
    [IsIntegralClosure 𝒪[L] 𝒪[K] L]
    (x : Lˣ) :
    v K (Additive.ofMul (normUnits K L x)) =
      (Module.finrank 𝓀[K] 𝓀[L] : Int) *
        v L (Additive.ofMul x) := by
  let ϖ : Lˣ := inverseIntegerRingUniformizerFieldUnit L
  have hϖ : v L (Additive.ofMul ϖ) = 1 :=
    v_inverseIntegerRingUniformizerFieldUnit L
  let n : Int := v L (Additive.ofMul x)
  let a : 𝒪[L]ˣ := uniformizerUnitFactor L ϖ hϖ x
  have haNorm :
      normUnits K L (integerUnitsToFieldUnits L a) =
        integerUnitsToFieldUnits K (normIntegerUnits K L a) := by
    apply Units.ext
    rfl
  have hx : integerUnitsToFieldUnits L a * ϖ ^ n = x := by
    exact uniformizerUnitFactor_mul_uniformizer_zpow L ϖ hϖ x
  have hxNorm :
      normUnits K L x =
        integerUnitsToFieldUnits K (normIntegerUnits K L a) *
          (normUnits K L ϖ) ^ n := by
    calc
      normUnits K L x =
          normUnits K L (integerUnitsToFieldUnits L a * ϖ ^ n) :=
        congrArg (normUnits K L) hx.symm
      _ = normUnits K L (integerUnitsToFieldUnits L a) *
          (normUnits K L ϖ) ^ n := by
        simp only [map_mul, map_zpow]
      _ = integerUnitsToFieldUnits K (normIntegerUnits K L a) *
          (normUnits K L ϖ) ^ n := by rw [haNorm]
  rw [hxNorm, v_mul, v_integerUnitsToFieldUnits, zero_add, v_zpow,
    v_normUnits_inverseIntegerRingUniformizerFieldUnit_of_isSeparable]
  simp only [n]
  ring
end
end LocalClassFieldTheory
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

/- ClassFieldTheory.AlgebraicNumberTheory.Adele.IntegralTensorSupport.FinitePlaceCompletion -/
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
 


noncomputable def relativeFinitePlaceCompletionBaseMap
    (w : HeightOneSpectrum (𝓞 K)) :
    WithAbs (NumberField.HeightOneSpectrum.adicAbv K w) →+*
      w.adicCompletion K :=
  (FinitePlace.embedding w).comp
    (WithAbs.equiv
      (NumberField.HeightOneSpectrum.adicAbv K w)).toRingHom
 

@[simp]
theorem relativeFinitePlaceCompletionBaseMap_apply
    (w : HeightOneSpectrum (𝓞 K))
    (x : WithAbs
      (NumberField.HeightOneSpectrum.adicAbv K w)) :
    relativeFinitePlaceCompletionBaseMap w x =
      FinitePlace.embedding w
        (WithAbs.equiv
          (NumberField.HeightOneSpectrum.adicAbv K w) x) :=
  rfl
 
theorem relativeFinitePlaceCompletionBaseMap_norm
    (w : HeightOneSpectrum (𝓞 K))
    (x : WithAbs
      (NumberField.HeightOneSpectrum.adicAbv K w)) :
    ‖relativeFinitePlaceCompletionBaseMap w x‖ = ‖x‖ := by
  rw [relativeFinitePlaceCompletionBaseMap_apply,
    FinitePlace.norm_embedding]
  rfl
 
theorem relativeFinitePlaceCompletionBaseMap_isometry
    (w : HeightOneSpectrum (𝓞 K)) :
    Isometry (relativeFinitePlaceCompletionBaseMap w) :=
  AddMonoidHomClass.isometry_of_norm _
    (relativeFinitePlaceCompletionBaseMap_norm w)
 
noncomputable def relativeFinitePlaceCompletionRingHom
    (w : HeightOneSpectrum (𝓞 K)) :
    (NumberField.HeightOneSpectrum.adicAbv K w).Completion →+*
      w.adicCompletion K :=
  (relativeFinitePlaceCompletionBaseMap_isometry w).extensionHom
 

@[simp]
theorem relativeFinitePlaceCompletionRingHom_coe
    (w : HeightOneSpectrum (𝓞 K))
    (x : WithAbs
      (NumberField.HeightOneSpectrum.adicAbv K w)) :
    relativeFinitePlaceCompletionRingHom w
        (x :
          (NumberField.HeightOneSpectrum.adicAbv K w).Completion) =
      relativeFinitePlaceCompletionBaseMap w x :=
  (relativeFinitePlaceCompletionBaseMap_isometry w).extensionHom_coe x
 
theorem relativeFinitePlaceCompletionRingHom_isometry
    (w : HeightOneSpectrum (𝓞 K)) :
    Isometry (relativeFinitePlaceCompletionRingHom w) :=
  (relativeFinitePlaceCompletionBaseMap_isometry w).completion_extension
 
theorem relativeFinitePlaceCompletionRingHom_surjective
    (w : HeightOneSpectrum (𝓞 K)) :
    Function.Surjective
      (relativeFinitePlaceCompletionRingHom w) := by
  let f := relativeFinitePlaceCompletionRingHom w
  have hrangeClosed : IsClosed (Set.range f) :=
    (relativeFinitePlaceCompletionRingHom_isometry w).isClosedEmbedding.isClosed_range
  have hdense :
      DenseRange (algebraMap K (w.adicCompletion K)) :=
    w.denseRange_algebraMap K
  have hrange :
      Set.range (algebraMap K (w.adicCompletion K)) ⊆
        Set.range f := by
    rintro _ ⟨x, rfl⟩
    let x' : WithAbs
        (NumberField.HeightOneSpectrum.adicAbv K w) :=
      (WithAbs.equiv
        (NumberField.HeightOneSpectrum.adicAbv K w)).symm x
    refine
      ⟨(x' :
          (NumberField.HeightOneSpectrum.adicAbv K w).Completion),
        ?_⟩
    rw [relativeFinitePlaceCompletionRingHom_coe]
    rfl
  intro x
  have hx :
      x ∈ closure
        (Set.range (algebraMap K (w.adicCompletion K))) := by
    rw [hdense.closure_range]
    trivial
  exact closure_minimal hrange hrangeClosed hx
 
noncomputable def relativeFinitePlaceCompletionRingEquiv
    (w : HeightOneSpectrum (𝓞 K)) :
    (NumberField.HeightOneSpectrum.adicAbv K w).Completion ≃+*
      w.adicCompletion K :=
  RingEquiv.ofBijective
    (relativeFinitePlaceCompletionRingHom w)
    ⟨(relativeFinitePlaceCompletionRingHom_isometry w).injective,
      relativeFinitePlaceCompletionRingHom_surjective w⟩
 
noncomputable def relativeFinitePlaceCompletionAlgEquiv
    (w : HeightOneSpectrum (𝓞 K)) :
    (NumberField.HeightOneSpectrum.adicAbv K w).Completion ≃ₐ[K]
      w.adicCompletion K where
  __ := relativeFinitePlaceCompletionRingEquiv w
  commutes' x := by
    change
      relativeFinitePlaceCompletionRingHom w
          (((WithAbs.equiv
            (NumberField.HeightOneSpectrum.adicAbv K w)).symm x :
              WithAbs
                (NumberField.HeightOneSpectrum.adicAbv K w)) :
            (NumberField.HeightOneSpectrum.adicAbv K w).Completion) =
        algebraMap K (w.adicCompletion K) x
    rw [relativeFinitePlaceCompletionRingHom_coe]
    rfl
 

theorem relativeFinitePlaceCompletionAlgEquiv_symm_norm
    (w : HeightOneSpectrum (𝓞 K))
    (x : w.adicCompletion K) :
    ‖(relativeFinitePlaceCompletionAlgEquiv w).symm x‖ =
      ‖x‖ := by
  let y :=
    (relativeFinitePlaceCompletionAlgEquiv w).symm x
  have h :=
    (relativeFinitePlaceCompletionRingHom_isometry w).norm_map_of_map_zero
      (map_zero
        (relativeFinitePlaceCompletionRingHom w)) y
  have hy :
      relativeFinitePlaceCompletionRingHom w y = x := by
    change
      relativeFinitePlaceCompletionAlgEquiv w y = x
    exact
      (relativeFinitePlaceCompletionAlgEquiv w).apply_symm_apply x
  rw [hy] at h
  exact h.symm
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
section FinitePlaceAction
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
 

theorem finitePlaceExtensionCentre_liesOver
    (v : HeightOneSpectrum (𝓞 K))
    (w : AbsoluteValueExtension
      (HeightOneSpectrum.adicAbv K v) L) :
    (finitePlaceExtensionCentre
      (K := K) (L := L) v w).asIdeal.LiesOver v.asIdeal := by
  constructor
  exact congrArg HeightOneSpectrum.asIdeal
    (finitePlaceBelow_finitePlaceExtensionCentre
      (K := K) (L := L) v w).symm
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
 

theorem finitePlaceAdicCompletionMap_isScalarTower
    (w : HeightOneSpectrum (𝓞 K))
    (W : {W : HeightOneSpectrum (𝓞 L) //
      finitePlaceBelow (K := K) W = w}) :
    letI : Algebra (w.adicCompletion K) (W.1.adicCompletion L) :=
      (finitePlaceAdicCompletionMap K L w W).toAlgebra
    IsScalarTower K (w.adicCompletion K) (W.1.adicCompletion L) := by
  let : Algebra (w.adicCompletion K) (W.1.adicCompletion L) :=
    (finitePlaceAdicCompletionMap K L w W).toAlgebra
  apply IsScalarTower.of_algebraMap_eq
  intro x
  change
    (algebraMap K (W.1.adicCompletion L)) x =
      finitePlaceAdicCompletionMap K L w W
        (x : w.adicCompletion K)
  rw [finitePlaceAdicCompletionMap_coe K L w W x]
  exact IsScalarTower.algebraMap_apply K L (W.1.adicCompletion L) x
 
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

/- ClassFieldTheory.AlgebraicNumberTheory.Completion.Comparison -/
section
open scoped NumberField Classical
open NumberField IsDedekindDomain
noncomputable section
open AlgebraicNumberTheory.Valuations
universe u v
variable
    {K : Type u} {L : Type v}
    [Field K] [NumberField K]
    [Field L] [NumberField L] [Algebra K L]
    [FiniteDimensional K L]
omit [FiniteDimensional K L] in
 

theorem finitePlaceExtension_adicAbv_valuationSubring
    (v : HeightOneSpectrum (𝓞 K))
    (w : AbsoluteValueExtension
      (HeightOneSpectrum.adicAbv K v) L) :
    absoluteValueValuationSubring
        (HeightOneSpectrum.adicAbv L
          (finitePlaceExtensionCentre
            (K := K) (L := L) v w))
        (finitePlaceExtension_nonarchimedean
          (K := L) (L := L)
          (finitePlaceExtensionCentre
            (K := K) (L := L) v w)
          ⟨HeightOneSpectrum.adicAbv L
              (finitePlaceExtensionCentre
                (K := K) (L := L) v w),
            fun _ => rfl⟩) =
      finitePlaceExtensionValuationSubring
        (K := K) (L := L) v w := by
  rw [finitePlaceExtensionValuationSubring_eq_localization,
    (finitePlaceExtensionCentre
      (K := K) (L := L) v w).valuationSubringAtPrime_eq_valuationSubring]
  ext x
  rw [mem_absoluteValueValuationSubring_iff]
  change
    HeightOneSpectrum.adicAbv L
        (finitePlaceExtensionCentre
          (K := K) (L := L) v w) x ≤ 1 ↔
      (finitePlaceExtensionCentre
        (K := K) (L := L) v w).valuation L x ≤ 1
  rw [HeightOneSpectrum.adicAbv_def]
  exact_mod_cast
    WithZeroMulInt.toNNReal_le_one_iff
      (HeightOneSpectrum.one_lt_absNorm_nnreal
        (finitePlaceExtensionCentre
          (K := K) (L := L) v w))
omit [FiniteDimensional K L] in
 

theorem finitePlaceExtension_isEquiv_adicAbv
    (v : HeightOneSpectrum (𝓞 K))
    (w : AbsoluteValueExtension
      (HeightOneSpectrum.adicAbv K v) L) :
    w.1.IsEquiv
      (HeightOneSpectrum.adicAbv L
        (finitePlaceExtensionCentre
          (K := K) (L := L) v w)) := by
  apply AbsoluteValue.isEquiv_iff_lt_one_iff.mpr
  intro x
  have hle (y : L) :
      w.1 y ≤ 1 ↔
        HeightOneSpectrum.adicAbv L
            (finitePlaceExtensionCentre
              (K := K) (L := L) v w) y ≤ 1 := by
    rw [← mem_absoluteValueValuationSubring_iff
        w.1 (finitePlaceExtension_nonarchimedean
          (K := K) (L := L) v w),
      ← mem_absoluteValueValuationSubring_iff
        (HeightOneSpectrum.adicAbv L
          (finitePlaceExtensionCentre
            (K := K) (L := L) v w))
        (finitePlaceExtension_nonarchimedean
          (K := L) (L := L)
          (finitePlaceExtensionCentre
            (K := K) (L := L) v w)
          ⟨HeightOneSpectrum.adicAbv L
              (finitePlaceExtensionCentre
                (K := K) (L := L) v w),
            fun _ => rfl⟩)]
    change
      y ∈ finitePlaceExtensionValuationSubring
          (K := K) (L := L) v w ↔
        y ∈ absoluteValueValuationSubring
          (HeightOneSpectrum.adicAbv L
            (finitePlaceExtensionCentre
              (K := K) (L := L) v w))
          (finitePlaceExtension_nonarchimedean
            (K := L) (L := L)
            (finitePlaceExtensionCentre
              (K := K) (L := L) v w)
            ⟨HeightOneSpectrum.adicAbv L
                (finitePlaceExtensionCentre
                  (K := K) (L := L) v w),
              fun _ => rfl⟩)
    rw [finitePlaceExtension_adicAbv_valuationSubring]
  by_cases hx : x = 0
  · subst x
    simp
  calc
    w.1 x < 1 ↔ 1 < (w.1 x)⁻¹ :=
      (one_lt_inv₀ (w.1.pos hx)).symm
    _ ↔ 1 < w.1 x⁻¹ := by rw [map_inv₀]
    _ ↔ ¬ w.1 x⁻¹ ≤ 1 := not_le.symm
    _ ↔ ¬ HeightOneSpectrum.adicAbv L
          (finitePlaceExtensionCentre
            (K := K) (L := L) v w) x⁻¹ ≤ 1 :=
      not_congr (hle x⁻¹)
    _ ↔ 1 < HeightOneSpectrum.adicAbv L
          (finitePlaceExtensionCentre
            (K := K) (L := L) v w) x⁻¹ := not_le
    _ ↔ 1 < (HeightOneSpectrum.adicAbv L
          (finitePlaceExtensionCentre
            (K := K) (L := L) v w) x)⁻¹ := by
      rw [map_inv₀]
    _ ↔ HeightOneSpectrum.adicAbv L
          (finitePlaceExtensionCentre
            (K := K) (L := L) v w) x < 1 :=
      one_lt_inv₀
        ((HeightOneSpectrum.adicAbv L
          (finitePlaceExtensionCentre
            (K := K) (L := L) v w)).pos hx)
 

noncomputable def finitePlaceExtensionExponent
    (v : HeightOneSpectrum (𝓞 K))
    (w : AbsoluteValueExtension
      (HeightOneSpectrum.adicAbv K v) L) : ℝ :=
  (AbsoluteValue.isEquiv_iff_exists_rpow_eq.mp
    (finitePlaceExtension_isEquiv_adicAbv
      (K := K) (L := L) v w)).choose
omit [FiniteDimensional K L] in
theorem finitePlaceExtensionExponent_pos
    (v : HeightOneSpectrum (𝓞 K))
    (w : AbsoluteValueExtension
      (HeightOneSpectrum.adicAbv K v) L) :
    0 < finitePlaceExtensionExponent
      (K := K) (L := L) v w :=
  (AbsoluteValue.isEquiv_iff_exists_rpow_eq.mp
    (finitePlaceExtension_isEquiv_adicAbv
      (K := K) (L := L) v w)).choose_spec.1
omit [FiniteDimensional K L] in
theorem finitePlaceExtension_adicAbv_eq_rpow
    (v : HeightOneSpectrum (𝓞 K))
    (w : AbsoluteValueExtension
      (HeightOneSpectrum.adicAbv K v) L)
    (x : L) :
    HeightOneSpectrum.adicAbv L
        (finitePlaceExtensionCentre
          (K := K) (L := L) v w) x =
      w.1 x ^ finitePlaceExtensionExponent
        (K := K) (L := L) v w :=
  (congrFun
    (AbsoluteValue.isEquiv_iff_exists_rpow_eq.mp
      (finitePlaceExtension_isEquiv_adicAbv
        (K := K) (L := L) v w)).choose_spec.2 x).symm
 

noncomputable def finitePlaceExtensionWithAbsRingEquiv
    (v : HeightOneSpectrum (𝓞 K))
    (w : AbsoluteValueExtension
      (HeightOneSpectrum.adicAbv K v) L) :
    WithAbs w.1 ≃+*
      WithAbs
        (HeightOneSpectrum.adicAbv L
          (finitePlaceExtensionCentre
            (K := K) (L := L) v w)) :=
  WithAbs.congr w.1
    (HeightOneSpectrum.adicAbv L
      (finitePlaceExtensionCentre
        (K := K) (L := L) v w))
    (RingEquiv.refl L)
omit [FiniteDimensional K L] in
theorem finitePlaceExtensionWithAbsRingEquiv_continuous
    (v : HeightOneSpectrum (𝓞 K))
    (w : AbsoluteValueExtension
      (HeightOneSpectrum.adicAbv K v) L) :
    Continuous
      (finitePlaceExtensionWithAbsRingEquiv
        (K := K) (L := L) v w) :=
  (AbsoluteValue.isEquiv_iff_isHomeomorph _ _).mp
    (finitePlaceExtension_isEquiv_adicAbv
      (K := K) (L := L) v w) |>.continuous
omit [FiniteDimensional K L] in
theorem finitePlaceExtensionWithAbsRingEquiv_symm_continuous
    (v : HeightOneSpectrum (𝓞 K))
    (w : AbsoluteValueExtension
      (HeightOneSpectrum.adicAbv K v) L) :
    Continuous
      (finitePlaceExtensionWithAbsRingEquiv
        (K := K) (L := L) v w).symm := by
  rw [finitePlaceExtensionWithAbsRingEquiv,
    WithAbs.congr_symm]
  exact
    ((AbsoluteValue.isEquiv_iff_isHomeomorph _ _).mp
      (finitePlaceExtension_isEquiv_adicAbv
        (K := K) (L := L) v w).symm).continuous
 
noncomputable def finitePlaceExtensionCompletionRingEquiv
    (v : HeightOneSpectrum (𝓞 K))
    (w : AbsoluteValueExtension
      (HeightOneSpectrum.adicAbv K v) L) :
    w.1.Completion ≃+*
      (HeightOneSpectrum.adicAbv L
        (finitePlaceExtensionCentre
          (K := K) (L := L) v w)).Completion :=
  UniformSpace.Completion.mapRingEquiv
    (finitePlaceExtensionWithAbsRingEquiv
      (K := K) (L := L) v w)
    (finitePlaceExtensionWithAbsRingEquiv_continuous
      (K := K) (L := L) v w)
    (finitePlaceExtensionWithAbsRingEquiv_symm_continuous
      (K := K) (L := L) v w)
omit [FiniteDimensional K L] in
@[simp]
theorem finitePlaceExtensionCompletionRingEquiv_toCompletion
    (v : HeightOneSpectrum (𝓞 K))
    (w : AbsoluteValueExtension
      (HeightOneSpectrum.adicAbv K v) L)
    (x : L) :
    finitePlaceExtensionCompletionRingEquiv
        (K := K) (L := L) v w
        (AbsoluteValue.toCompletion w.1 x) =
      AbsoluteValue.toCompletion
        (HeightOneSpectrum.adicAbv L
          (finitePlaceExtensionCentre
            (K := K) (L := L) v w)) x := by
  change
    UniformSpace.Completion.mapRingEquiv
        (finitePlaceExtensionWithAbsRingEquiv
          (K := K) (L := L) v w)
        (finitePlaceExtensionWithAbsRingEquiv_continuous
          (K := K) (L := L) v w)
        (finitePlaceExtensionWithAbsRingEquiv_symm_continuous
          (K := K) (L := L) v w)
      (((WithAbs.equiv w.1).symm x : WithAbs w.1) :
        w.1.Completion) = _
  rw [UniformSpace.Completion.mapRingEquiv_apply,
    UniformSpace.Completion.map_coe
      (uniformContinuous_addMonoidHom_of_continuous
        (finitePlaceExtensionWithAbsRingEquiv_continuous
          (K := K) (L := L) v w))]
  rfl
omit [FiniteDimensional K L] in
 
theorem finitePlaceExtensionCompletionRingEquiv_continuous
    (v : HeightOneSpectrum (𝓞 K))
    (w : AbsoluteValueExtension
      (HeightOneSpectrum.adicAbv K v) L) :
    Continuous
      (finitePlaceExtensionCompletionRingEquiv
        (K := K) (L := L) v w) :=
  UniformSpace.Completion.continuous_map
omit [FiniteDimensional K L] in
 

theorem finitePlaceExtensionCompletionRingEquiv_norm
    (v : HeightOneSpectrum (𝓞 K))
    (w : AbsoluteValueExtension
      (HeightOneSpectrum.adicAbv K v) L)
    (x : w.1.Completion) :
    ‖finitePlaceExtensionCompletionRingEquiv
        (K := K) (L := L) v w x‖ =
      ‖x‖ ^ finitePlaceExtensionExponent
        (K := K) (L := L) v w := by
  refine UniformSpace.Completion.induction_on
    (α := WithAbs w.1) x ?_ ?_
  · exact isClosed_eq
      (continuous_norm.comp
        (finitePlaceExtensionCompletionRingEquiv_continuous
          (K := K) (L := L) v w))
      (continuous_norm.rpow_const
        (fun _ => Or.inr
          (finitePlaceExtensionExponent_pos
            (K := K) (L := L) v w).le))
  · intro a
    change
      ‖UniformSpace.Completion.map
          (finitePlaceExtensionWithAbsRingEquiv
            (K := K) (L := L) v w)
          (a : w.1.Completion)‖ =
        ‖(a : w.1.Completion)‖ ^
          finitePlaceExtensionExponent
            (K := K) (L := L) v w
    rw [UniformSpace.Completion.map_coe
        (uniformContinuous_addMonoidHom_of_continuous
          (finitePlaceExtensionWithAbsRingEquiv_continuous
            (K := K) (L := L) v w)),
      UniformSpace.Completion.norm_coe,
      UniformSpace.Completion.norm_coe,
      WithAbs.norm_eq_apply_ofAbs,
      WithAbs.norm_eq_apply_ofAbs]
    exact finitePlaceExtension_adicAbv_eq_rpow
      (K := K) (L := L) v w (WithAbs.equiv w.1 a)
 

theorem relativeFinitePlaceCompletionRingEquiv_norm
    (W : HeightOneSpectrum (𝓞 L))
    (x : (HeightOneSpectrum.adicAbv L W).Completion) :
    ‖relativeFinitePlaceCompletionRingEquiv W x‖ = ‖x‖ := by
  change ‖relativeFinitePlaceCompletionRingHom W x‖ = ‖x‖
  exact
    (relativeFinitePlaceCompletionRingHom_isometry W).norm_map_of_map_zero
      (map_zero (relativeFinitePlaceCompletionRingHom W)) x
 

noncomputable def finitePlaceExtensionAdicCompletionRingEquiv
    (v : HeightOneSpectrum (𝓞 K))
    (w : AbsoluteValueExtension
      (HeightOneSpectrum.adicAbv K v) L) :
    w.1.Completion ≃+*
      (finitePlaceExtensionCentre
        (K := K) (L := L) v w).adicCompletion L :=
  (finitePlaceExtensionCompletionRingEquiv
    (K := K) (L := L) v w).trans
    (relativeFinitePlaceCompletionRingEquiv
      (finitePlaceExtensionCentre
        (K := K) (L := L) v w))
omit [FiniteDimensional K L] in
theorem finitePlaceExtensionAdicCompletionRingEquiv_norm
    (v : HeightOneSpectrum (𝓞 K))
    (w : AbsoluteValueExtension
      (HeightOneSpectrum.adicAbv K v) L)
    (x : w.1.Completion) :
    ‖finitePlaceExtensionAdicCompletionRingEquiv
        (K := K) (L := L) v w x‖ =
      ‖x‖ ^ finitePlaceExtensionExponent
        (K := K) (L := L) v w := by
  rw [finitePlaceExtensionAdicCompletionRingEquiv,
    RingEquiv.trans_apply,
    relativeFinitePlaceCompletionRingEquiv_norm,
    finitePlaceExtensionCompletionRingEquiv_norm]
omit [FiniteDimensional K L] in
@[simp]
theorem finitePlaceExtensionAdicCompletionRingEquiv_toCompletion
    (v : HeightOneSpectrum (𝓞 K))
    (w : AbsoluteValueExtension
      (HeightOneSpectrum.adicAbv K v) L)
    (x : L) :
    finitePlaceExtensionAdicCompletionRingEquiv
        (K := K) (L := L) v w
        (AbsoluteValue.toCompletion w.1 x) =
      FinitePlace.embedding
        (finitePlaceExtensionCentre
          (K := K) (L := L) v w) x := by
  rw [finitePlaceExtensionAdicCompletionRingEquiv,
    RingEquiv.trans_apply,
    finitePlaceExtensionCompletionRingEquiv_toCompletion]
  change
    relativeFinitePlaceCompletionRingHom
        (finitePlaceExtensionCentre
          (K := K) (L := L) v w)
        (((WithAbs.equiv
          (HeightOneSpectrum.adicAbv L
            (finitePlaceExtensionCentre
              (K := K) (L := L) v w))).symm x :
          WithAbs
            (HeightOneSpectrum.adicAbv L
              (finitePlaceExtensionCentre
                (K := K) (L := L) v w))) :
          (HeightOneSpectrum.adicAbv L
            (finitePlaceExtensionCentre
              (K := K) (L := L) v w)).Completion) = _
  rw [relativeFinitePlaceCompletionRingHom_coe]
  rfl
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.Completion.AdicCompletionComparison -/
section
open scoped NumberField TensorProduct
open NumberField IsDedekindDomain
noncomputable section
open AlgebraicNumberTheory.Valuations
universe u v
variable
    (K : Type u) (L : Type v)
    [Field K] [NumberField K]
    [Field L] [NumberField L] [Algebra K L]
 

noncomputable def finitePlaceExtensionAdicCompletionMap
    (w : HeightOneSpectrum (𝓞 K))
    (a : AbsoluteValueExtension
      (HeightOneSpectrum.adicAbv K w) L) :
    w.adicCompletion K →+*
      (finitePlaceExtensionCentre
        (K := K) (L := L) w a).adicCompletion L :=
  (finitePlaceExtensionAdicCompletionRingEquiv
      (K := K) (L := L) w a).toRingHom.comp
    ((AbsoluteValue.completionMap
      (HeightOneSpectrum.adicAbv K w) a.1 a.2).comp
      (relativeFinitePlaceCompletionAlgEquiv w).symm.toRingHom)
 

theorem finitePlaceExtensionAdicCompletionMap_coe
    (w : HeightOneSpectrum (𝓞 K))
    (a : AbsoluteValueExtension
      (HeightOneSpectrum.adicAbv K w) L)
    (x : K) :
    finitePlaceExtensionAdicCompletionMap K L w a
        (x : w.adicCompletion K) =
      (algebraMap K L x :
        (finitePlaceExtensionCentre
          (K := K) (L := L) w a).adicCompletion L) := by
  have hcomparison :
      (relativeFinitePlaceCompletionAlgEquiv w).symm
          (x : w.adicCompletion K) =
        algebraMap K
          (HeightOneSpectrum.adicAbv K w).Completion x := by
    change
      (relativeFinitePlaceCompletionAlgEquiv w).symm
          (algebraMap K (w.adicCompletion K) x) =
        algebraMap K
          (HeightOneSpectrum.adicAbv K w).Completion x
    exact (relativeFinitePlaceCompletionAlgEquiv w).symm.commutes x
  change
    finitePlaceExtensionAdicCompletionRingEquiv
        (K := K) (L := L) w a
        (AbsoluteValue.completionMap
          (HeightOneSpectrum.adicAbv K w) a.1 a.2
          ((relativeFinitePlaceCompletionAlgEquiv w).symm
            (x : w.adicCompletion K))) =
      _
  rw [hcomparison,
    AbsoluteValue.completionMap_coe,
    finitePlaceExtensionAdicCompletionRingEquiv_toCompletion]
  rfl
 

theorem finitePlaceExtensionAdicCompletionMap_continuous
    (w : HeightOneSpectrum (𝓞 K))
    (a : AbsoluteValueExtension
      (HeightOneSpectrum.adicAbv K w) L) :
    Continuous
      (finitePlaceExtensionAdicCompletionMap K L w a) := by
  have hrelative :
      Isometry (relativeFinitePlaceCompletionAlgEquiv w).symm :=
    AddMonoidHomClass.isometry_of_norm
      (relativeFinitePlaceCompletionAlgEquiv w).symm
      (relativeFinitePlaceCompletionAlgEquiv_symm_norm w)
  exact
    ((relativeFinitePlaceCompletionRingHom_isometry
      (finitePlaceExtensionCentre
        (K := K) (L := L) w a)).continuous.comp
      (finitePlaceExtensionCompletionRingEquiv_continuous
        (K := K) (L := L) w a)).comp
      ((AbsoluteValue.completionMap_isometry
        (HeightOneSpectrum.adicAbv K w) a.1 a.2).continuous.comp
        hrelative.continuous)
 


theorem finitePlaceExtensionAdicCompletionMap_eq_finitePlaceAdicCompletionMap
    (w : HeightOneSpectrum (𝓞 K))
    (a : AbsoluteValueExtension
      (HeightOneSpectrum.adicAbv K w) L)
    (x : w.adicCompletion K) :
    finitePlaceExtensionAdicCompletionMap K L w a x =
      finitePlaceAdicCompletionMap K L w
        (finitePlaceExtensionEquivAbove
          (K := K) (L := L) w a) x := by
  let P : (w.valuation K).Completion → Prop := fun y =>
    finitePlaceExtensionAdicCompletionMap K L w a
        (HeightOneSpectrum.adicCompletion.ofCompletion y) =
      finitePlaceAdicCompletionMap K L w
        (finitePlaceExtensionEquivAbove
          (K := K) (L := L) w a)
        (HeightOneSpectrum.adicCompletion.ofCompletion y)
  change P x.toCompletion
  refine UniformSpace.Completion.induction_on
    (α := WithVal (w.valuation K)) x.toCompletion ?_ ?_
  · change IsClosed
      {y | finitePlaceExtensionAdicCompletionMap K L w a
          (HeightOneSpectrum.adicCompletion.ofCompletion y) =
        finitePlaceAdicCompletionMap K L w
          (finitePlaceExtensionEquivAbove
            (K := K) (L := L) w a)
          (HeightOneSpectrum.adicCompletion.ofCompletion y)}
    exact isClosed_eq
      ((finitePlaceExtensionAdicCompletionMap_continuous K L w a).comp
        (HeightOneSpectrum.adicCompletion.continuous_ofCompletion K w))
      ((finitePlaceAdicCompletionMap_continuous K L w
        (finitePlaceExtensionEquivAbove
          (K := K) (L := L) w a)).comp
        (HeightOneSpectrum.adicCompletion.continuous_ofCompletion K w))
  · intro r
    let k : K := WithVal.equiv (w.valuation K) r
    change
      finitePlaceExtensionAdicCompletionMap K L w a
          (HeightOneSpectrum.adicCompletion.ofCompletion
            (r : (w.valuation K).Completion)) =
        finitePlaceAdicCompletionMap K L w
          (finitePlaceExtensionEquivAbove
            (K := K) (L := L) w a)
          (HeightOneSpectrum.adicCompletion.ofCompletion
            (r : (w.valuation K).Completion))
    change
      finitePlaceExtensionAdicCompletionMap K L w a
          (k : w.adicCompletion K) =
        finitePlaceAdicCompletionMap K L w
          (finitePlaceExtensionEquivAbove
            (K := K) (L := L) w a)
          (k : w.adicCompletion K)
    rw [finitePlaceExtensionAdicCompletionMap_coe,
      finitePlaceAdicCompletionMap_coe]
    change
      (algebraMap K L k :
        (finitePlaceExtensionCentre
          (K := K) (L := L) w a).adicCompletion L) =
      (algebraMap K L k :
        (finitePlaceExtensionCentre
          (K := K) (L := L) w a).adicCompletion L)
    rfl
 

theorem finitePlaceAdicCompletionMap_moduleFinite
    [FiniteDimensional K L]
    (w : HeightOneSpectrum (𝓞 K))
    (W : {W : HeightOneSpectrum (𝓞 L) //
      finitePlaceBelow (K := K) W = w}) :
    letI : Algebra (w.adicCompletion K) (W.1.adicCompletion L) :=
      (finitePlaceAdicCompletionMap K L w W).toAlgebra
    Module.Finite (w.adicCompletion K) (W.1.adicCompletion L) := by
  classical
  obtain ⟨a, rfl⟩ :=
    (finitePlaceExtensionEquivAbove
      (K := K) (L := L) w).surjective W
  let vK := HeightOneSpectrum.adicAbv K w
  let hvK : vK.IsNontrivial :=
    RayClass.adicAbv_isNontrivial w
  let : Algebra
      (w.adicCompletion K)
      ((finitePlaceExtensionEquivAbove
        (K := K) (L := L) w a).1.adicCompletion L) :=
    (finitePlaceAdicCompletionMap K L w
      (finitePlaceExtensionEquivAbove
        (K := K) (L := L) w a)).toAlgebra
  let : Module
      (w.adicCompletion K)
      ((finitePlaceExtensionEquivAbove
        (K := K) (L := L) w a).1.adicCompletion L) :=
    Algebra.toModule
  let : Algebra (w.adicCompletion K) vK.Completion :=
    (relativeFinitePlaceCompletionAlgEquiv w).symm.toRingHom.toAlgebra
  let : Algebra vK.Completion a.1.Completion :=
    AbsoluteValue.completionAlgebra vK a.1 a.2
  let : Algebra (w.adicCompletion K) a.1.Completion :=
    ((algebraMap vK.Completion a.1.Completion).comp
      (relativeFinitePlaceCompletionAlgEquiv w).symm.toRingHom).toAlgebra
  let : IsScalarTower
      (w.adicCompletion K) vK.Completion a.1.Completion :=
    IsScalarTower.of_algebraMap_eq' rfl
  let : Module.Finite (w.adicCompletion K) vK.Completion :=
    Module.Finite.of_surjective
      (Algebra.linearMap (w.adicCompletion K) vK.Completion)
      (relativeFinitePlaceCompletionAlgEquiv w).symm.surjective
  let : Module.Finite vK.Completion a.1.Completion :=
    completionModuleFinite vK hvK a
  let : Module.Finite (w.adicCompletion K) a.1.Completion :=
    Module.Finite.trans vK.Completion a.1.Completion
  let e :
      a.1.Completion ≃ₐ[w.adicCompletion K]
        (finitePlaceExtensionEquivAbove
          (K := K) (L := L) w a).1.adicCompletion L :=
    { __ :=
        finitePlaceExtensionAdicCompletionRingEquiv
          (K := K) (L := L) w a
      commutes' := fun x => by
        change
          finitePlaceExtensionAdicCompletionMap K L w a x =
            finitePlaceAdicCompletionMap K L w
              (finitePlaceExtensionEquivAbove
                (K := K) (L := L) w a) x
        exact
          finitePlaceExtensionAdicCompletionMap_eq_finitePlaceAdicCompletionMap
            K L w a x }
  exact Module.Finite.equiv e.toLinearEquiv
 

theorem finitePlaceExtensionAdicCompletionMap_norm
    (w : HeightOneSpectrum (𝓞 K))
    (a : AbsoluteValueExtension
      (HeightOneSpectrum.adicAbv K w) L)
    (x : w.adicCompletion K) :
    ‖finitePlaceExtensionAdicCompletionMap K L w a x‖ =
      ‖x‖ ^ finitePlaceExtensionExponent
        (K := K) (L := L) w a := by
  change
    ‖finitePlaceExtensionAdicCompletionRingEquiv
        (K := K) (L := L) w a
        (AbsoluteValue.completionMap
          (HeightOneSpectrum.adicAbv K w) a.1 a.2
          ((relativeFinitePlaceCompletionAlgEquiv w).symm x))‖ =
      _
  rw [
    finitePlaceExtensionAdicCompletionRingEquiv_norm,
    (AbsoluteValue.completionMap_isometry
      (HeightOneSpectrum.adicAbv K w) a.1 a.2).norm_map_of_map_zero
        (map_zero
          (AbsoluteValue.completionMap
            (HeightOneSpectrum.adicAbv K w) a.1 a.2)),
    relativeFinitePlaceCompletionAlgEquiv_symm_norm]
 


theorem finitePlaceExtensionAdicCompletionMap_valued
    (w : HeightOneSpectrum (𝓞 K))
    (a : AbsoluteValueExtension
      (HeightOneSpectrum.adicAbv K w) L)
    (x : w.adicCompletion K) :
    Valued.v (finitePlaceExtensionAdicCompletionMap K L w a x) =
      Valued.v x ^ w.asIdeal.ramificationIdx'
        (finitePlaceExtensionCentre
          (K := K) (L := L) w a).asIdeal := by
  let W :=
    finitePlaceExtensionCentre
      (K := K) (L := L) w a
  let : W.asIdeal.LiesOver w.asIdeal :=
    finitePlaceExtensionCentre_liesOver
      (K := K) (L := L) w a
  by_cases hx : x = 0
  · subst x
    have he :
        w.asIdeal.ramificationIdx' W.asIdeal ≠ 0 :=
      Ideal.IsDedekindDomain.ramificationIdx'_ne_zero_of_liesOver
        W.asIdeal w.ne_bot
    simp only [map_zero]
    exact (zero_pow he).symm
  obtain ⟨r, hr⟩ := Valued.exists_coe_eq_v x.toCompletion
  let k : K := WithVal.equiv (w.valuation K) r
  have hkval : w.valuation K k = Valued.v x := by
    change Valued.v r = Valued.v x
    rw [← HeightOneSpectrum.adicCompletion.valued_toCompletion]
    exact hr.symm
  have hk : k ≠ 0 := by
    intro hk
    have : Valued.v x = 0 := by
      rw [← hkval, hk, map_zero]
    apply hx
    simpa using this
  let z : w.adicCompletion K := x * (k : w.adicCompletion K)⁻¹
  have hzval : Valued.v z = 1 := by
    simp [z, hkval, hx]
  have hznorm : ‖z‖ = 1 := by
    simp [FinitePlace.norm_def, hzval]
  have hmapznorm :
      ‖finitePlaceExtensionAdicCompletionMap K L w a z‖ = 1 := by
    rw [finitePlaceExtensionAdicCompletionMap_norm, hznorm]
    simp
  have hmapzval :
      Valued.v
        (finitePlaceExtensionAdicCompletionMap K L w a z) = 1 := by
    rw [FinitePlace.norm_def] at hmapznorm
    exact
      (WithZeroMulInt.toNNReal_eq_one_iff
        (Valued.v
          (finitePlaceExtensionAdicCompletionMap K L w a z))
        (HeightOneSpectrum.absNorm_ne_zero W)
        (HeightOneSpectrum.one_lt_absNorm_nnreal W).ne').mp
        (NNReal.eq hmapznorm)
  have hkcoe :
      (k : w.adicCompletion K) ≠ 0 := by
    change algebraMap K (w.adicCompletion K) k ≠ 0
    exact (map_ne_zero
      (algebraMap K (w.adicCompletion K))).2 hk
  have hx_factor :
      x = z * (k : w.adicCompletion K) := by
    dsimp [z]
    rw [mul_assoc, inv_mul_cancel₀ hkcoe, mul_one]
  calc
    Valued.v
        (finitePlaceExtensionAdicCompletionMap K L w a x) =
        Valued.v
          (finitePlaceExtensionAdicCompletionMap K L w a
            (z * (k : w.adicCompletion K))) := by
          rw [← hx_factor]
    _ = Valued.v
          (finitePlaceExtensionAdicCompletionMap K L w a z) *
        Valued.v
          (finitePlaceExtensionAdicCompletionMap K L w a
            (k : w.adicCompletion K)) := by
          rw [map_mul, map_mul]
    _ = Valued.v
          (finitePlaceExtensionAdicCompletionMap K L w a
            (k : w.adicCompletion K)) := by
          rw [hmapzval, one_mul]
    _ = W.valuation L (algebraMap K L k) := by
          rw [finitePlaceExtensionAdicCompletionMap_coe,
            HeightOneSpectrum.valuedAdicCompletion_eq_valuation']
    _ = (w.valuation K k) ^
          w.asIdeal.ramificationIdx' W.asIdeal :=
      (HeightOneSpectrum.valuation_liesOver L w W k).symm
    _ = Valued.v x ^
          w.asIdeal.ramificationIdx' W.asIdeal := by
      rw [hkval]
 

theorem finitePlaceAdicCompletionMap_valued
    (w : HeightOneSpectrum (𝓞 K))
    (W : {W : HeightOneSpectrum (𝓞 L) //
      finitePlaceBelow (K := K) W = w})
    (x : w.adicCompletion K) :
    Valued.v (finitePlaceAdicCompletionMap K L w W x) =
      Valued.v x ^ w.asIdeal.ramificationIdx' W.1.asIdeal := by
  obtain ⟨a, rfl⟩ :=
    (finitePlaceExtensionEquivAbove
      (K := K) (L := L) w).surjective W
  rw [←
    finitePlaceExtensionAdicCompletionMap_eq_finitePlaceAdicCompletionMap]
  exact finitePlaceExtensionAdicCompletionMap_valued K L w a x
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.Idele.Extension.NormLocalOrder -/
section
open scoped NumberField ValuativeRel WithZero
open NumberField IsDedekindDomain
noncomputable section
namespace FiniteIdeleGroup
universe u v w
private lemma withZeroMultiplicativeInt_le_exp_neg_one_of_lt_one
    (γ : WithZero (Multiplicative ℤ)) (hγ : γ < 1) :
    γ ≤ WithZero.exp (-1 : ℤ) := by
  cases γ using WithZero.recZeroCoe with
  | zero =>
      exact bot_le
  | coe γ =>
      rw [WithZero.exp_eq_coe_ofAdd, WithZero.coe_le_coe]
      rw [← Multiplicative.toAdd_le]
      change Multiplicative.toAdd γ ≤ (-1 : ℤ)
      have hγ' : Multiplicative.toAdd γ < (0 : ℤ) := by
        have : γ < (1 : Multiplicative ℤ) := by
          simpa using hγ
        change
          Multiplicative.toAdd γ <
            Multiplicative.toAdd (1 : Multiplicative ℤ)
        exact Multiplicative.toAdd_lt.mpr this
      omega
 

private theorem normalizedValue_eq_withZeroLog_of_surjective
    (F : Type w)
    [Field F] [ValuativeRel F] [TopologicalSpace F]
    [IsNonarchimedeanLocalField F]
    (ν : Valuation F (WithZero (Multiplicative ℤ)))
    [ν.Compatible]
    (hν : Function.Surjective ν)
    (x : Fˣ) :
    LocalFieldTheory.IsNonarchimedeanLocalField.v F
        (Additive.ofMul x) =
      WithZero.log (ν (x : F)) := by
  let ν₀ := ValuativeRel.valuation F
  have hEquiv : ν₀.IsEquiv ν :=
    ValuativeRel.isEquiv ν₀ ν
  obtain ⟨π, hπ⟩ :=
    hν (WithZero.exp (-1 : ℤ))
  have hπ0 : π ≠ 0 := by
    intro h
    rw [h, map_zero] at hπ
    exact WithZero.exp_ne_zero hπ.symm
  let ϖ : Fˣ := Units.mk0 π hπ0
  have hπlt : ν π < 1 := by
    rw [hπ, ← WithZero.exp_zero, WithZero.exp_lt_exp]
    omega
  have hπIntrinsicLt : ν₀ π < 1 :=
    hEquiv.lt_one_iff_lt_one.mpr hπlt
  have hπIntrinsicMax :
      ∀ γ : ValuativeRel.ValueGroupWithZero F,
        γ < 1 → γ ≤ ν₀ π := by
    intro γ hγ
    obtain ⟨y, hy⟩ :=
      ValuativeRel.valuation_surjective γ
    have hylt : ν y < 1 := by
      apply hEquiv.lt_one_iff_lt_one.mp
      simpa [ν₀, hy]
    have hyle : ν y ≤ ν π := by
      rw [hπ]
      exact
        withZeroMultiplicativeInt_le_exp_neg_one_of_lt_one
          (ν y) hylt
    have hyle' : ν₀ y ≤ ν₀ π :=
      hEquiv.le_iff_le.mpr hyle
    simpa [ν₀, hy] using hyle'
  let φ :=
    _root_.IsNonarchimedeanLocalField.valueGroupWithZeroIsoInt F
  have hφπ :
      φ (ν₀ π) = WithZero.exp (-1 : ℤ) := by
    apply le_antisymm
    · exact
        withZeroMultiplicativeInt_le_exp_neg_one_of_lt_one
          (φ (ν₀ π)) (by
            have h := φ.strictMono hπIntrinsicLt
            simpa [φ] using h)
    · let γ : ValuativeRel.ValueGroupWithZero F :=
        φ.symm (WithZero.exp (-1 : ℤ))
      have hγlt : γ < 1 := by
        have hneg :
            WithZero.exp (-1 : ℤ) <
              (1 : WithZero (Multiplicative ℤ)) := by
          rw [← WithZero.exp_zero, WithZero.exp_lt_exp]
          omega
        have h := φ.symm.strictMono hneg
        simpa [γ, φ] using h
      have hγle := hπIntrinsicMax γ hγlt
      have hmap := φ.toOrderIso.monotone hγle
      rw [← φ.apply_symm_apply (WithZero.exp (-1 : ℤ))]
      exact hmap
  have hϖValue :
      LocalFieldTheory.IsNonarchimedeanLocalField.v F
          (Additive.ofMul ϖ) = -1 := by
    rw [LocalFieldTheory.IsNonarchimedeanLocalField.v_apply]
    apply (WithZero.toAdd_unzero_eq_iff _ (-1 : ℤ)).2
    change
      φ (ν₀ ((ϖ : Fˣ) : F)) =
        ((Multiplicative.ofAdd (-1 : ℤ) :
            Multiplicative ℤ) :
          WithZero (Multiplicative ℤ))
    change
      φ (ν₀ π) =
        ((Multiplicative.ofAdd (-1 : ℤ) :
            Multiplicative ℤ) :
          WithZero (Multiplicative ℤ))
    simpa only [WithZero.exp_eq_coe_ofAdd] using hφπ
  let n : ℤ := WithZero.log (ν (x : F))
  let y : Fˣ := x * ϖ ^ n
  have hxν0 : ν (x : F) ≠ 0 :=
    (Valuation.ne_zero_iff ν).2 x.ne_zero
  have hyν : ν (y : F) = 1 := by
    have hϖν : ν (ϖ : F) = WithZero.exp (-1 : ℤ) := by
      simpa [ϖ] using hπ
    calc
      ν (y : F) =
          ν (x : F) * ν (ϖ : F) ^ n := by
            simp [y]
      _ =
          WithZero.exp n * WithZero.exp (-1 : ℤ) ^ n := by
            rw [← WithZero.exp_log hxν0]
            rw [hϖν]
      _ =
          WithZero.exp n *
            WithZero.exp (n • (-1 : ℤ)) := by
              rw [WithZero.exp_zsmul]
      _ = WithZero.exp (n + n • (-1 : ℤ)) := by
            rw [WithZero.exp_add]
      _ = 1 := by
            simp
  have hyInvν : ν ((y⁻¹ : Fˣ) : F) = 1 := by
    rw [Units.val_inv_eq_inv_val, map_inv₀, hyν, inv_one]
  have hyMem : (y : F) ∈ 𝒪[F] := by
    change ν₀ (y : F) ≤ 1
    exact hEquiv.le_one_iff_le_one.mpr (by rw [hyν])
  have hyInvMem : ((y⁻¹ : Fˣ) : F) ∈ 𝒪[F] := by
    change ν₀ ((y⁻¹ : Fˣ) : F) ≤ 1
    exact hEquiv.le_one_iff_le_one.mpr (by rw [hyInvν])
  let yInteger : 𝒪[F]ˣ :=
    { val := ⟨(y : F), hyMem⟩
      inv := ⟨((y⁻¹ : Fˣ) : F), hyInvMem⟩
      val_inv := by
        apply Subtype.ext
        simp
      inv_val := by
        apply Subtype.ext
        simp }
  have hyField :
      LocalFieldTheory.IsNonarchimedeanLocalField.integerUnitsToFieldUnits
          F yInteger =
        y := by
    apply Units.ext
    rfl
  have hyValue :
      LocalFieldTheory.IsNonarchimedeanLocalField.v F
          (Additive.ofMul y) = 0 := by
    rw [← hyField]
    exact
      LocalFieldTheory.IsNonarchimedeanLocalField.v_integerUnitsToFieldUnits
        F yInteger
  have hdecomp : y * ϖ ^ (-n) = x := by
    rw [show y = x * ϖ ^ n by rfl, mul_assoc, zpow_neg,
      mul_inv_cancel, mul_one]
  have hdecompValue :=
    congrArg
      (fun z : Fˣ =>
        LocalFieldTheory.IsNonarchimedeanLocalField.v F
          (Additive.ofMul z))
      hdecomp
  rw [LocalFieldTheory.IsNonarchimedeanLocalField.v_mul,
    hyValue,
    LocalFieldTheory.IsNonarchimedeanLocalField.v_zpow,
    hϖValue] at hdecompValue
  dsimp [n] at hdecompValue ⊢
  linarith
 

private noncomputable def intrinsicIntegerEquivValuedInteger
    (F : Type w)
    [Field F] [ValuativeRel F]
    [Valued F (WithZero (Multiplicative ℤ))]
    [(Valued.v :
      Valuation F (WithZero (Multiplicative ℤ))).Compatible] :
    𝒪[F] ≃+* Valued.integer F := by
  apply RingEquiv.subringCongr
  exact congrArg ValuationSubring.toSubring <|
    (Valuation.isEquiv_iff_valuationSubring
      (ValuativeRel.valuation F)
      (Valued.v : Valuation F (WithZero (Multiplicative ℤ)))).mp <|
      ValuativeRel.isEquiv
        (ValuativeRel.valuation F)
        (Valued.v :
          Valuation F (WithZero (Multiplicative ℤ)))
 

private noncomputable def intrinsicResidueFieldEquivValuedResidueField
    (F : Type w)
    [Field F] [ValuativeRel F]
    [Valued F (WithZero (Multiplicative ℤ))]
    [(Valued.v :
      Valuation F (WithZero (Multiplicative ℤ))).Compatible] :
    𝓀[F] ≃+* Valued.ResidueField F :=
  IsLocalRing.ResidueField.mapEquiv
    (intrinsicIntegerEquivValuedInteger F)
private theorem absNorm_eq_card_intrinsicAdicResidueField
    (K : Type u) [Field K] [NumberField K]
    (v : HeightOneSpectrum (𝓞 K))
    [ValuativeRel (v.adicCompletion K)]
    [(Valued.v :
      Valuation (v.adicCompletion K)
        (WithZero (Multiplicative ℤ))).Compatible] :
    Ideal.absNorm v.asIdeal =
      Nat.card 𝓀[v.adicCompletion K] := by
  calc
    Ideal.absNorm v.asIdeal =
        Nat.card
          (Valued.ResidueField (v.adicCompletion K)) := by
      rw [Ideal.absNorm_apply]
      exact
        Nat.card_congr
          (GlobalClassFieldTheory.ClassFieldAxiom.ringOfIntegersQuotientEquivAdicResidueField
            (K := K) v).toEquiv
    _ = Nat.card 𝓀[v.adicCompletion K] := by
      exact
        (Nat.card_congr
          (intrinsicResidueFieldEquivValuedResidueField
            (v.adicCompletion K)).toEquiv).symm
variable
    (K : Type u) (L : Type v)
    [Field K] [NumberField K]
    [Field L] [NumberField L]
    [Algebra K L] [FiniteDimensional K L]
 

theorem localOrder_normUnits
    (v₀ : HeightOneSpectrum (𝓞 K))
    (W : {W : HeightOneSpectrum (𝓞 L) //
      _root_.finitePlaceBelow (K := K) W = v₀})
    (x : (W.1.adicCompletion L)ˣ) :
    letI : Algebra
        (v₀.adicCompletion K) (W.1.adicCompletion L) :=
      (finitePlaceAdicCompletionMap K L v₀ W).toAlgebra
    (localOrder v₀
      (LocalFieldTheory.normUnits
        (v₀.adicCompletion K) (W.1.adicCompletion L) x)).toAdd =
      (W.1.asIdeal.inertiaDeg (𝓞 K) : ℤ) *
        (localOrder W.1 x).toAdd := by
  classical
  let F := v₀.adicCompletion K
  let E := W.1.adicCompletion L
  let : Algebra F E :=
    (finitePlaceAdicCompletionMap K L v₀ W).toAlgebra
  let : IsScalarTower K F E :=
    finitePlaceAdicCompletionMap_isScalarTower K L v₀ W
  let : FiniteDimensional F E :=
    finitePlaceAdicCompletionMap_moduleFinite K L v₀ W
  let : CharZero F :=
    charZero_of_injective_algebraMap
      (algebraMap K F).injective
  let : Algebra.IsIntegral F E :=
    Algebra.IsIntegral.of_finite F E
  let : Algebra.IsSeparable F E :=
    Algebra.IsSeparable.of_integral F E
  let νF : Valuation F (WithZero (Multiplicative ℤ)) :=
    Valued.v
  let νE : Valuation E (WithZero (Multiplicative ℤ)) :=
    Valued.v
  have hνF : Function.Surjective νF := by
    simpa [F, νF] using
      v₀.valuedAdicCompletion_surjective K
  have hνE : Function.Surjective νE := by
    simpa [E, νE] using
      W.1.valuedAdicCompletion_surjective L
  let : ValuativeRel F :=
    ValuativeRel.ofValuation νF
  let : ValuativeRel E :=
    ValuativeRel.ofValuation νE
  let : νF.Compatible :=
    Valuation.Compatible.ofValuation νF
  let : νE.Compatible :=
    Valuation.Compatible.ofValuation νE
  let : νF.IsNontrivial := by
    obtain ⟨π, hπ⟩ :=
      hνF (WithZero.exp (-1 : ℤ))
    refine ⟨⟨π, ?_, ?_⟩⟩
    · rw [hπ]
      simp
    · rw [hπ]
      change
        WithZero.exp (-1 : ℤ) ≠
          WithZero.exp (0 : ℤ)
      simp
  let : νE.IsNontrivial := by
    obtain ⟨π, hπ⟩ :=
      hνE (WithZero.exp (-1 : ℤ))
    refine ⟨⟨π, ?_, ?_⟩⟩
    · rw [hπ]
      simp
    · rw [hπ]
      change
        WithZero.exp (-1 : ℤ) ≠
          WithZero.exp (0 : ℤ)
      simp
  let : ValuativeRel.IsNontrivial F :=
    (ValuativeRel.isNontrivial_iff_isNontrivial νF).2
      inferInstance
  let : ValuativeRel.IsNontrivial E :=
    (ValuativeRel.isNontrivial_iff_isNontrivial νE).2
      inferInstance
  let : IsValuativeTopology F :=
    LocalFieldTheory.isValuativeTopology_of_valued_ofValuation
      F (WithZero (Multiplicative ℤ))
  let : IsValuativeTopology E :=
    LocalFieldTheory.isValuativeTopology_of_valued_ofValuation
      E (WithZero (Multiplicative ℤ))
  let : IsNonarchimedeanLocalField F :=
    { toIsValuativeTopology := inferInstance
      toLocallyCompactSpace := inferInstance
      toIsNontrivial := inferInstance }
  let : IsNonarchimedeanLocalField E :=
    { toIsValuativeTopology := inferInstance
      toLocallyCompactSpace := inferInstance
      toIsNontrivial := inferInstance }
  let ν₀F := ValuativeRel.valuation F
  let ν₀E := ValuativeRel.valuation E
  let : W.1.asIdeal.LiesOver v₀.asIdeal := by
    constructor
    exact congrArg HeightOneSpectrum.asIdeal W.2.symm
  let : ν₀F.HasExtension ν₀E := by
    apply Valuation.HasExtension.ofComapInteger
    ext z
    change
      ν₀E (algebraMap F E z) ≤ 1 ↔
        ν₀F z ≤ 1
    rw [(ValuativeRel.isEquiv ν₀E νE).le_one_iff_le_one,
      (ValuativeRel.isEquiv ν₀F νF).le_one_iff_le_one]
    have hmap :
        νE (algebraMap F E z) =
          νF z ^
            W.1.asIdeal.ramificationIdx (𝓞 K) := by
      have h :=
        finitePlaceAdicCompletionMap_valued
          K L v₀ W z
      rw [Ideal.ramificationIdx'_eq_ramificationIdx
        v₀.asIdeal W.1.asIdeal v₀.ne_bot] at h
      exact h
    rw [hmap,
      pow_le_one_iff
        (W.1.asIdeal.ramificationIdx_pos
          (𝓞 K)).ne']
  let : Algebra 𝒪[F] E :=
    Algebra.ofSubsemiring 𝒪[F]
  let : IsIntegralClosure 𝒪[E] 𝒪[F] E :=
    LocalFieldTheory.localCompleteDVF_integerRing_isIntegralClosure F E
  have hNormValue :=
    LocalClassFieldTheory.v_normUnits_eq_residue_finrank_mul_of_isSeparable
      F E x
  rw [
    normalizedValue_eq_withZeroLog_of_surjective
      F νF hνF
        (LocalFieldTheory.normUnits F E x),
    normalizedValue_eq_withZeroLog_of_surjective
      E νE hνE x
  ] at hNormValue
  have hResidueDegree :
      Module.finrank 𝓀[F] 𝓀[E] =
        W.1.asIdeal.inertiaDeg (𝓞 K) := by
    apply
      Nat.pow_right_injective
        (Nat.succ_le_iff.mpr
          (HeightOneSpectrum.one_lt_absNorm v₀))
    calc
      Ideal.absNorm v₀.asIdeal ^
            Module.finrank 𝓀[F] 𝓀[E] =
          Nat.card 𝓀[F] ^
            Module.finrank 𝓀[F] 𝓀[E] := by
              rw [
                absNorm_eq_card_intrinsicAdicResidueField
                  K v₀
              ]
      _ = Nat.card 𝓀[E] :=
        Module.natCard_eq_pow_finrank.symm
      _ = Ideal.absNorm W.1.asIdeal := by
        rw [
          absNorm_eq_card_intrinsicAdicResidueField
            L W.1
        ]
      _ =
          Ideal.absNorm v₀.asIdeal ^
            W.1.asIdeal.inertiaDeg (𝓞 K) := by
        exact
          (Ideal.absNorm_pow_inertiaDeg
            v₀.asIdeal W.1.asIdeal).symm
  rw [hResidueDegree] at hNormValue
  rw [localOrder_apply, localOrder_apply]
  change
    -WithZero.log
        (νF
          (LocalFieldTheory.normUnits F E x : F)) =
      (W.1.asIdeal.inertiaDeg (𝓞 K) : ℤ) *
        -WithZero.log (νE (x : E))
  calc
    -WithZero.log
          (νF
            (LocalFieldTheory.normUnits F E x : F)) =
        -((W.1.asIdeal.inertiaDeg (𝓞 K) : ℤ) *
          WithZero.log (νE (x : E))) := by
            rw [hNormValue]
    _ =
        (W.1.asIdeal.inertiaDeg (𝓞 K) : ℤ) *
          -WithZero.log (νE (x : E)) := by
            ring
end FiniteIdeleGroup
end
end

namespace TunnellInjectionValuation
open NumberField IsDedekindDomain FiniteIdeleGroup
open scoped NumberField
noncomputable section

def Law : Prop :=
  ∀ (E : Type) [Field E] [NumberField E] (t : HeightOneSpectrum (𝓞 E)) (v : HeightOneSpectrum (𝓞 ℚ)),
    t.asIdeal.LiesOver v.asIdeal → ∀ (f : v.adicCompletion ℚ →+* t.adicCompletion E), Continuous f →
    letI : Algebra (v.adicCompletion ℚ) (t.adicCompletion E) := f.toAlgebra
    ∀ y : (t.adicCompletion E)ˣ, WithZero.log (Valued.v (Algebra.norm (v.adicCompletion ℚ) y.val)) =
      (t.asIdeal.inertiaDeg (𝓞 ℚ) : ℤ) * WithZero.log (Valued.v y.val)

theorem law : Law := by
  intro E _ _ t v ht f hf
  letI : t.asIdeal.LiesOver v.asIdeal := ht
  let W : {w : HeightOneSpectrum (𝓞 E) // finitePlaceBelow (K:=ℚ) w = v} :=
    ⟨t, HeightOneSpectrum.ext (t.asIdeal.over_def v.asIdeal).symm⟩
  have eq : f = finitePlaceAdicCompletionMap ℚ E v W := by
    apply RingHom.ext
    intro x
    have h := (HeightOneSpectrum.denseRange_algebraMap ℚ v).equalizer hf
      (finitePlaceAdicCompletionMap_continuous ℚ E v W) (funext fun r => by simp)
    exact congrFun h x
  subst f
  letI : Algebra (v.adicCompletion ℚ) (t.adicCompletion E) := (finitePlaceAdicCompletionMap ℚ E v W).toAlgebra
  intro y
  have h := localOrder_normUnits ℚ E v W y
  simp only [localOrder_apply] at h
  dsimp only [W] at h
  change -_ = _ * -_ at h
  simpa only [mul_neg,neg_inj,LocalFieldTheory.normUnits,Units.coe_map] using h
end
end TunnellInjectionValuation

theorem OMA.solution : OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1_H2_R1_H1_R1.H1 := TunnellInjectionValuation.law
