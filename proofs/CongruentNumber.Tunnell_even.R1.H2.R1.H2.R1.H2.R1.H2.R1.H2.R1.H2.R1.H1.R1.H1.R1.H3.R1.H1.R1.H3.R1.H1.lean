import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H3_R1_H1_R1_H3_R1
import Mathlib

/-! Auxiliary support in the Kummer norm-index formula. The ordinary idele definitions and ideal-class results are adapted from ClassFieldTheory at revision 2e6280f9d2579705a0cc6c76ec68c2b60f9c601a, https://github.com/n-yamaguchi-0729/ClassFieldTheory. -/
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
@[simp]
theorem localOrder_eq_zero_iff (v : HeightOneSpectrum (𝓞 K))
    (x : (v.adicCompletion K)ˣ) :
    (localOrder v x).toAdd = 0 ↔
      x ∈ (v.adicCompletionIntegers K).units := by
  rw [localOrder_apply]
  rw [HeightOneSpectrum.adicCompletionIntegers.mem_units_iff_valued_eq_one]
  change -WithZero.log (Valued.v (x : v.adicCompletion K)) = 0 ↔
    Valued.v (x : v.adicCompletion K) = 1
  rw [neg_eq_zero]
  let z : ℤᵐ⁰ := Valued.v (x : v.adicCompletion K)
  have hz : z ≠ 0 := by
    dsimp [z]
    simp
  constructor
  · intro h
    have h' :
        WithZero.logEquiv (Units.mk0 z hz) =
          WithZero.logEquiv (1 : (ℤᵐ⁰)ˣ) := by
      simpa [WithZero.logEquiv_apply] using h
    have hu := (WithZero.logEquiv (G := ℤ)).injective h'
    simpa [z] using congrArg Units.val hu
  · intro h
    rw [h]
    rfl
 

theorem finite_nonLocalUnits (a : FiniteIdeleGroup K) :
    {v : HeightOneSpectrum (𝓞 K) |
      a v ∉ (v.adicCompletionIntegers K).units}.Finite :=
  Filter.eventually_cofinite.mp a.2
 

def valuationVectorAdd (a : FiniteIdeleGroup K) :
    HeightOneSpectrum (𝓞 K) →₀ ℤ :=
  Finsupp.onFinset (finite_nonLocalUnits a).toFinset
    (fun v => (localOrder v (a v)).toAdd) (fun v hv => by
      rw [Set.Finite.mem_toFinset]
      intro hmem
      exact hv ((localOrder_eq_zero_iff v (a v)).2 hmem))
 

def valuationVector :
    FiniteIdeleGroup K →* Multiplicative
      (HeightOneSpectrum (𝓞 K) →₀ ℤ) :=
  MonoidHom.mk' (fun a => Multiplicative.ofAdd (valuationVectorAdd a))
    fun a b => by
      apply Multiplicative.ext
      ext v
      exact congrArg Multiplicative.toAdd
        (map_mul (localOrder v) (a v) (b v))
@[simp]
theorem valuationVector_apply (a : FiniteIdeleGroup K)
    (v : HeightOneSpectrum (𝓞 K)) :
    (valuationVector a).toAdd v =
      (localOrder v (a v)).toAdd :=
  rfl
 
def chosenLocalOrderSection (v : HeightOneSpectrum (𝓞 K)) (n : ℤ) :
    (v.adicCompletion K)ˣ :=
  let x := Classical.choose
    (HeightOneSpectrum.valuedAdicCompletion_surjective K v
      (WithZero.exp (-n)))
  Units.mk0 x (by
    intro hx
    have hval := Classical.choose_spec
      (HeightOneSpectrum.valuedAdicCompletion_surjective K v
        (WithZero.exp (-n)))
    change Valued.v x = WithZero.exp (-n) at hval
    rw [hx, map_zero] at hval
    exact WithZero.exp_ne_zero hval.symm)
@[simp]
theorem localOrder_chosenLocalOrderSection
    (v : HeightOneSpectrum (𝓞 K)) (n : ℤ) :
    (localOrder v (chosenLocalOrderSection v n)).toAdd = n := by
  rw [localOrder_apply]
  change -WithZero.log
    (Valued.v (Classical.choose
      (HeightOneSpectrum.valuedAdicCompletion_surjective K v
        (WithZero.exp (-n))))) = n
  rw [Classical.choose_spec
    (HeightOneSpectrum.valuedAdicCompletion_surjective K v
      (WithZero.exp (-n)))]
  simp
 
def valuationVectorSection
    (e : HeightOneSpectrum (𝓞 K) →₀ ℤ) :
    FiniteIdeleGroup K :=
  ⟨fun v => chosenLocalOrderSection v (e v), by
    filter_upwards [e.support.eventually_cofinite_notMem] with v hv
    apply (localOrder_eq_zero_iff v _).1
    rw [localOrder_chosenLocalOrderSection, Finsupp.notMem_support_iff.mp hv]⟩
@[simp]
theorem valuationVector_valuationVectorSection
    (e : HeightOneSpectrum (𝓞 K) →₀ ℤ) :
    valuationVector (valuationVectorSection e) =
      Multiplicative.ofAdd e := by
  apply Multiplicative.ext
  ext v
  rw [valuationVector_apply]
  change (localOrder v (chosenLocalOrderSection v (e v))).toAdd = e v
  rw [localOrder_chosenLocalOrderSection]
theorem valuationVector_surjective :
    Function.Surjective (valuationVector (K := K)) := by
  intro e
  refine ⟨valuationVectorSection e.toAdd, ?_⟩
  exact valuationVector_valuationVectorSection e.toAdd
end FiniteIdeleGroup
 
abbrev FractionalIdealGroup (K : Type*) [Field K] [NumberField K] :=
  (FractionalIdeal (nonZeroDivisors (𝓞 K)) K)ˣ
namespace FractionalIdealGroup
 
def prime (v : HeightOneSpectrum (𝓞 K)) :
    FractionalIdealGroup K :=
  Units.mk0 (v.asIdeal : FractionalIdeal (nonZeroDivisors (𝓞 K)) K)
    (FractionalIdeal.coeIdeal_ne_zero.mpr v.ne_bot)
 

def primePowerHom (v : HeightOneSpectrum (𝓞 K)) :
    Multiplicative ℤ →* FractionalIdealGroup K :=
  MonoidHom.mk' (fun n => prime v ^ n.toAdd) fun m n => by
    simp [zpow_add]
 

def factorization :
    Multiplicative (HeightOneSpectrum (𝓞 K) →₀ ℤ) →*
      FractionalIdealGroup K :=
  MonoidHom.mk' (fun exps =>
      exps.toAdd.prod fun v n => primePowerHom v (Multiplicative.ofAdd n))
    fun a b => by
      exact Finsupp.prod_hom_add_index (fun v => primePowerHom v)
@[simp]
theorem factorization_val (exps :
    Multiplicative (HeightOneSpectrum (𝓞 K) →₀ ℤ)) :
    ((factorization exps : FractionalIdealGroup K) :
      FractionalIdeal (nonZeroDivisors (𝓞 K)) K) =
      exps.toAdd.prod fun v n =>
        (v.asIdeal : FractionalIdeal (nonZeroDivisors (𝓞 K)) K) ^ n := by
  classical
  simp [factorization, primePowerHom, prime, Finsupp.prod]
theorem finite_count_support (I : FractionalIdealGroup K) :
    {v : HeightOneSpectrum (𝓞 K) |
      FractionalIdeal.count K v
        (I : FractionalIdeal (nonZeroDivisors (𝓞 K)) K) ≠ 0}.Finite :=
  Filter.eventually_cofinite.mp
    (FractionalIdeal.finite_factors
      (I : FractionalIdeal (nonZeroDivisors (𝓞 K)) K))
 

def countVector (I : FractionalIdealGroup K) :
    HeightOneSpectrum (𝓞 K) →₀ ℤ :=
  Finsupp.onFinset (finite_count_support I).toFinset
    (fun v => FractionalIdeal.count K v
      (I : FractionalIdeal (nonZeroDivisors (𝓞 K)) K))
    (fun v hv => by
      rw [Set.Finite.mem_toFinset]
      exact hv)
@[simp]
theorem countVector_apply (I : FractionalIdealGroup K)
    (v : HeightOneSpectrum (𝓞 K)) :
    countVector I v =
      FractionalIdeal.count K v
        (I : FractionalIdeal (nonZeroDivisors (𝓞 K)) K) :=
  rfl
@[simp]
theorem count_factorization (exps :
    Multiplicative (HeightOneSpectrum (𝓞 K) →₀ ℤ))
    (v : HeightOneSpectrum (𝓞 K)) :
    FractionalIdeal.count K v
      ((factorization exps : FractionalIdealGroup K) :
        FractionalIdeal (nonZeroDivisors (𝓞 K)) K) =
      exps.toAdd v := by
  rw [factorization_val]
  exact FractionalIdeal.count_finsuppProd K v exps.toAdd
theorem ext_count {I J : FractionalIdealGroup K}
    (h : ∀ v : HeightOneSpectrum (𝓞 K),
      FractionalIdeal.count K v
        (I : FractionalIdeal (nonZeroDivisors (𝓞 K)) K) =
      FractionalIdeal.count K v
        (J : FractionalIdeal (nonZeroDivisors (𝓞 K)) K)) :
    I = J := by
  apply Units.ext
  rw [← FractionalIdeal.finprod_heightOneSpectrum_factorization'
      K (Units.ne_zero I),
    ← FractionalIdeal.finprod_heightOneSpectrum_factorization'
      K (Units.ne_zero J)]
  exact finprod_congr fun v => congrArg
    (fun n : ℤ =>
      (v.asIdeal : FractionalIdeal (nonZeroDivisors (𝓞 K)) K) ^ n) (h v)
theorem factorization_injective :
    Function.Injective (factorization (K := K)) := by
  intro a b hab
  apply Multiplicative.ext
  ext v
  rw [← count_factorization a v, ← count_factorization b v, hab]
theorem factorization_surjective :
    Function.Surjective (factorization (K := K)) := by
  intro I
  refine ⟨Multiplicative.ofAdd (countVector I), ?_⟩
  apply ext_count
  intro v
  rw [count_factorization]
  change countVector I v =
    FractionalIdeal.count K v
      (I : FractionalIdeal (nonZeroDivisors (𝓞 K)) K)
  exact countVector_apply I v
 

def factorizationEquiv :
    Multiplicative (HeightOneSpectrum (𝓞 K) →₀ ℤ) ≃*
      FractionalIdealGroup K :=
  MulEquiv.ofBijective (factorization (K := K))
    ⟨factorization_injective, factorization_surjective⟩
end FractionalIdealGroup
namespace FiniteIdeleGroup
 
def fractionalIdeal :
    FiniteIdeleGroup K →* FractionalIdealGroup K :=
  (FractionalIdealGroup.factorizationEquiv (K := K)).toMonoidHom.comp
    (valuationVector (K := K))
theorem fractionalIdeal_surjective :
    Function.Surjective (fractionalIdeal (K := K)) :=
  (FractionalIdealGroup.factorizationEquiv (K := K)).surjective.comp
    valuationVector_surjective
 
def integralSubgroup : Subgroup (FiniteIdeleGroup K) where
  carrier := {a | ∀ v : HeightOneSpectrum (𝓞 K),
    a v ∈ (v.adicCompletionIntegers K).units}
  one_mem' v := (v.adicCompletionIntegers K).units.one_mem
  mul_mem' ha hb v :=
    (v.adicCompletionIntegers K).units.mul_mem (ha v) (hb v)
  inv_mem' ha v :=
    (v.adicCompletionIntegers K).units.inv_mem (ha v)
theorem fractionalIdeal_ker :
    (fractionalIdeal (K := K)).ker = integralSubgroup := by
  ext a
  constructor
  · intro ha v
    have hv :
        valuationVector a =
          (1 : Multiplicative
            (HeightOneSpectrum (𝓞 K) →₀ ℤ)) := by
      apply (FractionalIdealGroup.factorizationEquiv
        (K := K)).injective
      simpa [fractionalIdeal] using ha
    apply (localOrder_eq_zero_iff v (a v)).1
    rw [← valuationVector_apply a v, hv]
    rfl
  · intro ha
    have hv :
        valuationVector a =
          (1 : Multiplicative
            (HeightOneSpectrum (𝓞 K) →₀ ℤ)) := by
      apply Multiplicative.ext
      ext v
      rw [valuationVector_apply]
      exact (localOrder_eq_zero_iff v (a v)).2 (ha v)
    simp [fractionalIdeal, hv]
end FiniteIdeleGroup
namespace IdeleGroup
 

def fractionalIdeal :
    IdeleGroup K →* FractionalIdealGroup K :=
  (FiniteIdeleGroup.fractionalIdeal (K := K)).comp
    (MonoidHom.snd _ _)
theorem fractionalIdeal_surjective :
    Function.Surjective (fractionalIdeal (K := K)) := by
  intro I
  obtain ⟨a, rfl⟩ :=
    FiniteIdeleGroup.fractionalIdeal_surjective (K := K) I
  exact ⟨(1, a), rfl⟩
 

def integralAtFinitePlaces : Subgroup (IdeleGroup K) :=
  Subgroup.comap (MonoidHom.snd _ _)
    (FiniteIdeleGroup.integralSubgroup (K := K))
theorem fractionalIdeal_ker :
    (fractionalIdeal (K := K)).ker = integralAtFinitePlaces := by
  ext a
  change FiniteIdeleGroup.fractionalIdeal a.2 = 1 ↔
    a.2 ∈ FiniteIdeleGroup.integralSubgroup
  rw [← MonoidHom.mem_ker,
    FiniteIdeleGroup.fractionalIdeal_ker]
 

def idealClass :
    IdeleGroup K →* ClassGroup (𝓞 K) :=
  (ClassGroup.mk K).comp (fractionalIdeal (K := K))
theorem idealClass_surjective :
    Function.Surjective (idealClass (K := K)) := by
  intro c
  induction c using ClassGroup.induction (R := 𝓞 K) K with
  | h I =>
      obtain ⟨a, ha⟩ := fractionalIdeal_surjective (K := K) I
      exact ⟨a, by simp [idealClass, ha]⟩
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
 
def principalSubgroup : Subgroup (IdeleGroup K) :=
  (principalIdele K).range
end IdeleGroup
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.Idele.ClassGroup.Core -/
section
open scoped NumberField RestrictedProduct WithZero
open NumberField IsDedekindDomain
noncomputable section
variable {K : Type*} [Field K] [NumberField K]
namespace IdeleGroup
 

theorem count_toPrincipalIdeal (x : Kˣ)
    (v : HeightOneSpectrum (𝓞 K)) :
    FractionalIdeal.count K v
        ((toPrincipalIdeal (𝓞 K) K x : FractionalIdealGroup K) :
          FractionalIdeal (nonZeroDivisors (𝓞 K)) K) =
      -WithZero.log (v.valuation K (x : K)) := by
  obtain ⟨⟨n, d, hd⟩, hnd⟩ :=
    IsLocalization.surj (nonZeroDivisors (𝓞 K)) (x : K)
  let d' : nonZeroDivisors (𝓞 K) := ⟨d, hd⟩
  have hx :
      (x : K) = IsLocalization.mk' K n d' :=
    IsLocalization.eq_mk'_iff_mul_eq.mpr hnd
  have hn : n ≠ 0 := by
    intro hn
    have : (x : K) = 0 := by
      rw [hx, hn, IsFractionRing.mk'_eq_div, map_zero, zero_div]
    exact x.ne_zero this
  have hspan :
      (toPrincipalIdeal (𝓞 K) K x :
          FractionalIdeal (nonZeroDivisors (𝓞 K)) K) =
        FractionalIdeal.spanSingleton (nonZeroDivisors (𝓞 K))
            ((algebraMap (𝓞 K) K) d)⁻¹ *
          (Ideal.span {n} :
            FractionalIdeal (nonZeroDivisors (𝓞 K)) K) := by
    rw [coe_toPrincipalIdeal, hx,
      FractionalIdeal.coeIdeal_span_singleton,
      FractionalIdeal.spanSingleton_mul_spanSingleton,
      IsFractionRing.mk'_eq_div, div_eq_mul_inv, mul_comm]
  rw [FractionalIdeal.count_well_defined K v
      (Units.ne_zero (toPrincipalIdeal (𝓞 K) K x)) hspan,
    hx, v.valuation_of_mk']
  rw [v.intValuation_if_neg hn,
    v.intValuation_if_neg (nonZeroDivisors.coe_ne_zero d')]
  simp [d', sub_eq_add_neg, add_comm]
 

@[simp]
theorem fractionalIdeal_principalIdele (x : Kˣ) :
    fractionalIdeal (principalIdele K x) =
      toPrincipalIdeal (𝓞 K) K x := by
  apply FractionalIdealGroup.ext_count
  intro v
  rw [count_toPrincipalIdeal]
  change FractionalIdeal.count K v
      (((FractionalIdealGroup.factorization (K := K))
        (FiniteIdeleGroup.valuationVector
          (principalIdele K x).2) : FractionalIdealGroup K) :
        FractionalIdeal (nonZeroDivisors (𝓞 K)) K) =
      -WithZero.log (v.valuation K (x : K))
  rw [FractionalIdealGroup.count_factorization]
  change -WithZero.log
      (Valued.v (((principalIdele K x).2 v :
        (v.adicCompletion K)ˣ) : v.adicCompletion K)) =
      -WithZero.log (v.valuation K (x : K))
  rw [show ((((principalIdele K x).2 v :
      (v.adicCompletion K)ˣ) : v.adicCompletion K)) = (x : K) from rfl,
    HeightOneSpectrum.valuedAdicCompletion_eq_valuation']
theorem classGroup_mk_eq_one_iff
    (I : FractionalIdealGroup K) :
    ClassGroup.mk K I = 1 ↔
      I ∈ (toPrincipalIdeal (𝓞 K) K).range := by
  constructor
  · intro h
    have h' := congrArg (ClassGroup.equiv K) h
    simpa using h'
  · intro h
    apply (ClassGroup.equiv K).injective
    simpa using h
@[simp]
theorem idealClass_principalIdele (x : Kˣ) :
    idealClass (principalIdele K x) = 1 := by
  change ClassGroup.mk K
      (fractionalIdeal (principalIdele K x)) = 1
  rw [fractionalIdeal_principalIdele,
    classGroup_mk_eq_one_iff]
  exact ⟨x, rfl⟩
 
def ordinaryIdealClassSubgroup : Subgroup (IdeleGroup K) :=
  integralAtFinitePlaces (K := K) ⊔ principalSubgroup K
 

theorem ordinaryIdealClassSubgroup_eq_ker :
    ordinaryIdealClassSubgroup (K := K) =
      (idealClass (K := K)).ker := by
  ext a
  constructor
  · intro ha
    rw [ordinaryIdealClassSubgroup, Subgroup.mem_sup] at ha
    obtain ⟨u, hu, p, hp, rfl⟩ := ha
    obtain ⟨x, rfl⟩ := hp
    have hu' : fractionalIdeal u = 1 := by
      rw [← MonoidHom.mem_ker,
        fractionalIdeal_ker]
      exact hu
    change idealClass (u * principalIdele K x) = 1
    rw [map_mul, idealClass_principalIdele, mul_one]
    change ClassGroup.mk K (fractionalIdeal u) = 1
    rw [hu', map_one]
  · intro ha
    change ClassGroup.mk K (fractionalIdeal a) = 1 at ha
    rw [classGroup_mk_eq_one_iff] at ha
    obtain ⟨x, hx⟩ := ha
    let u : IdeleGroup K := a * (principalIdele K x)⁻¹
    have hu : u ∈ integralAtFinitePlaces (K := K) := by
      rw [← fractionalIdeal_ker, MonoidHom.mem_ker]
      change fractionalIdeal
          (a * (principalIdele K x)⁻¹) = 1
      rw [map_mul, map_inv, fractionalIdeal_principalIdele,
        ← hx, mul_inv_cancel]
    rw [ordinaryIdealClassSubgroup, Subgroup.mem_sup]
    refine ⟨u, hu, principalIdele K x, ⟨x, rfl⟩, ?_⟩
    dsimp [u]
    group
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
theorem supportedAt_mono {S T : Set (HeightOneSpectrum (𝓞 K))}
    (hST : S ⊆ T) :
    supportedAt (K := K) S ≤ supportedAt (K := K) T := by
  intro a ha v hv
  exact ha v (fun h => hv (hST h))
theorem mem_supportedAt_nonLocalUnits
    (a : FiniteIdeleGroup K) :
    a ∈ supportedAt (K := K)
      {v | a v ∉ (v.adicCompletionIntegers K).units} := by
  intro v hv
  simpa using hv
 
theorem exists_finset_supportedAt (a : FiniteIdeleGroup K) :
    ∃ S : Finset (HeightOneSpectrum (𝓞 K)),
      a ∈ supportedAt (K := K) (S : Set _) := by
  let T : Set (HeightOneSpectrum (𝓞 K)) :=
    {v | a v ∉ (v.adicCompletionIntegers K).units}
  have hT : T.Finite := Filter.eventually_cofinite.mp a.2
  exact ⟨hT.toFinset, by
    rw [Set.Finite.coe_toFinset]
    exact mem_supportedAt_nonLocalUnits a⟩
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
theorem supportedAt_mono {S T : Set (HeightOneSpectrum (𝓞 K))}
    (hST : S ⊆ T) :
    supportedAt (K := K) S ≤ supportedAt (K := K) T :=
  Subgroup.comap_mono
    (FiniteIdeleGroup.supportedAt_mono hST)
 
theorem exists_finset_supportedAt (a : IdeleGroup K) :
    ∃ S : Finset (HeightOneSpectrum (𝓞 K)),
      a ∈ supportedAt (K := K) (S : Set _) :=
  FiniteIdeleGroup.exists_finset_supportedAt a.2
theorem supportedAt_empty :
    supportedAt (K := K)
      (∅ : Set (HeightOneSpectrum (𝓞 K))) =
      integralAtFinitePlaces (K := K) :=
  by
    ext a
    simp only [mem_supportedAt_iff, Set.mem_empty_iff_false,
      not_false_eq_true, forall_const]
    rfl
end IdeleGroup
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.Idele.SufficientlyLarge -/
section
open scoped NumberField
open NumberField IsDedekindDomain
noncomputable section
variable {K : Type*} [Field K] [NumberField K]
namespace IdeleGroup
 
private def classRepresentative (c : ClassGroup (𝓞 K)) :
    IdeleGroup K :=
  Classical.choose (idealClass_surjective (K := K) c)
@[simp]
private theorem idealClass_classRepresentative
    (c : ClassGroup (𝓞 K)) :
    idealClass (classRepresentative (K := K) c) = c :=
  Classical.choose_spec (idealClass_surjective (K := K) c)
 

private def classRepresentativeSupport (c : ClassGroup (𝓞 K)) :
    Finset (HeightOneSpectrum (𝓞 K)) :=
  Classical.choose
    (exists_finset_supportedAt
      (classRepresentative (K := K) c))
private theorem classRepresentative_mem_support
    (c : ClassGroup (𝓞 K)) :
    classRepresentative (K := K) c ∈
      supportedAt (K := K)
        (classRepresentativeSupport (K := K) c : Set _) :=
  Classical.choose_spec
    (exists_finset_supportedAt
      (classRepresentative (K := K) c))
 

def sufficientlyLargeFiniteSet :
    Finset (HeightOneSpectrum (𝓞 K)) := by
  classical
  exact Finset.univ.biUnion (classRepresentativeSupport (K := K))
private theorem classRepresentative_mem_sufficientlyLarge
    (c : ClassGroup (𝓞 K)) :
    classRepresentative (K := K) c ∈
      supportedAt (K := K)
        (sufficientlyLargeFiniteSet (K := K) : Set _) := by
  classical
  apply supportedAt_mono
    (S := (classRepresentativeSupport (K := K) c : Set _))
  · intro v hv
    exact Finset.mem_biUnion.mpr
      ⟨c, Finset.mem_univ c, hv⟩
  · exact classRepresentative_mem_support (K := K) c
 

theorem idealClass_surjective_on_sufficientlyLarge :
    ∀ c : ClassGroup (𝓞 K),
      ∃ a ∈ supportedAt (K := K)
          (sufficientlyLargeFiniteSet (K := K) : Set _),
        idealClass a = c := by
  intro c
  exact ⟨classRepresentative (K := K) c,
    classRepresentative_mem_sufficientlyLarge (K := K) c,
    idealClass_classRepresentative (K := K) c⟩
 


theorem supportedAt_sup_principalSubgroup_eq_top :
    supportedAt (K := K)
        (sufficientlyLargeFiniteSet (K := K) : Set _) ⊔
      principalSubgroup K = ⊤ := by
  let S : Set (HeightOneSpectrum (𝓞 K)) :=
    (sufficientlyLargeFiniteSet (K := K) : Set _)
  have hintegral :
      integralAtFinitePlaces (K := K) ≤ supportedAt (K := K) S := by
    rw [← supportedAt_empty (K := K)]
    exact supportedAt_mono (K := K) (Set.empty_subset S)
  have hkernel :
      (idealClass (K := K)).ker ≤
        supportedAt (K := K) S ⊔ principalSubgroup K := by
    rw [← ordinaryIdealClassSubgroup_eq_ker (K := K)]
    exact sup_le
      (hintegral.trans le_sup_left)
      le_sup_right
  apply top_unique
  intro a _
  obtain ⟨r, hrS, hr⟩ :=
    idealClass_surjective_on_sufficientlyLarge
      (K := K) (idealClass a)
  have hquot : a * r⁻¹ ∈ (idealClass (K := K)).ker := by
    rw [MonoidHom.mem_ker, map_mul, map_inv, hr]
    simp
  have hquot' :
      a * r⁻¹ ∈ supportedAt (K := K) S ⊔ principalSubgroup K :=
    hkernel hquot
  have hr' :
      r ∈ supportedAt (K := K) S ⊔ principalSubgroup K :=
    Subgroup.mem_sup_left hrS
  convert Subgroup.mul_mem _ hquot' hr' using 1
  group
end IdeleGroup
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.Ramification.FiniteRamifiedPrimes -/
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

namespace TunnellKummerSupportGroups
open NumberField IsDedekindDomain IdeleGroup
open scoped NumberField Classical
noncomputable section
variable (K:Type) [Field K] [NumberField K]
abbrev V:=HeightOneSpectrum (𝓞 K)
abbrev A:=AdeleRing (𝓞 K) K
def U (n:ℕ) (S T : Finset (V K)):Subgroup (A K)ˣ:=Subgroup.closure {a:(A K)ˣ |
    (∀ w:InfinitePlace K,∃ y:w.Completion,y^n=a.val.1 w) ∧
    (∀ v∈S,∃ y:v.adicCompletion K,y^n=a.val.2 v) ∧
    ∀ v:V K,v∉S∪T → a.val.2 v∈v.adicCompletionIntegers K ∧ (a⁻¹).val.2 v∈v.adicCompletionIntegers K}
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

namespace TunnellAuxiliarySeed
open NumberField IsDedekindDomain IdeleGroup TunnellKummerSupportGroups
open scoped NumberField TensorProduct Classical
noncomputable section
theorem seed : OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H3_R1_H1_R1_H3_R1.H1 := by
  intro D _ _ E _ _
  dsimp only
  intro hp _
  letI : NumberField E := NumberField.of_module_finite D E
  let p:=Module.finrank D E
  let j:=Units.map (algebraMap D (A D)).toMonoidHom
  let ram:=AlgebraicNumberTheory.Ramification.finite_ramified_base_heightOne_primes (𝓞 D) (𝓞 E)
  have hn : Ideal.span {(p:𝓞 D)} ≠ ⊥ := by simp [p, hp.ne_zero]
  let divis:=Ideal.finite_factors (R:=𝓞 D) (I:=Ideal.span {(p:𝓞 D)}) hn
  let initial:=sufficientlyLargeFiniteSet (K:=D)
  let B:=ram.toFinset ∪ divis.toFinset ∪ initial
  refine ⟨B,?_,?_,?_⟩
  · intro v hv t ht
    by_contra h
    exact hv (Finset.mem_union_left _ (Finset.mem_union_left _ (ram.mem_toFinset.mpr ⟨t,ht,h⟩)))
  · intro v hv
    exact Finset.mem_union_left _ (Finset.mem_union_right _ (divis.mem_toFinset.mpr hv))
  · change j.range ⊔ J D B = ⊤
    apply top_unique
    intro a _
    have ha : (e D).symm a ∈ supportedAt (K:=D) (initial:Set _) ⊔ principalSubgroup D := by
      rw [supportedAt_sup_principalSubgroup_eq_top]
      exact Subgroup.mem_top _
    obtain ⟨b,hb,c,⟨x,rfl⟩,he⟩:=Subgroup.mem_sup.mp ha
    have hB: (e D) b ∈ J D B := by
      rw [supported]
      change (e D).symm ((e D) b) ∈ supportedAt (K:=D) (B:Set _)
      rw [MulEquiv.symm_apply_apply]
      exact supportedAt_mono (K:=D) (fun v hv=>Finset.mem_union_right _ hv) hb
    have prod : (e D) b * j x=a := by
      have h:=congrArg (e D) he
      simpa [principalIdele,j,e] using h
    rw [←prod]
    exact (j.range ⊔ J D B).mul_mem ((show J D B ≤ j.range ⊔ J D B from le_sup_right) hB) ((show j.range ≤ j.range ⊔ J D B from le_sup_left) ⟨x,rfl⟩)
end
end TunnellAuxiliarySeed

theorem OMA.solution : OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H3_R1_H1_R1_H3_R1.H1 := TunnellAuxiliarySeed.seed
