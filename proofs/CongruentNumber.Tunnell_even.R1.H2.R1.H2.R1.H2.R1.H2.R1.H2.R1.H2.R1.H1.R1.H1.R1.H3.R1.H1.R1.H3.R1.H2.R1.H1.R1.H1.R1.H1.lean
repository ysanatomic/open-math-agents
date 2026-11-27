import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H3_R1_H1_R1_H3_R1_H2_R1_H1_R1_H1_R1
import Mathlib

/-! Generating the Kummer group of global S-units. Some declarations are adapted from ClassFieldTheory at revision 2e6280f9d2579705a0cc6c76ec68c2b60f9c601a, https://github.com/n-yamaguchi-0729/ClassFieldTheory. -/
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
 

@[simp]
theorem finiteComponent_principalIdele
    (x : Kˣ) (v : HeightOneSpectrum (𝓞 K)) :
    ((finiteComponent v (principalIdele K x) :
      (v.adicCompletion K)ˣ) : v.adicCompletion K) = (x : K) :=
  rfl
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

/- ClassFieldTheory.AlgebraicNumberTheory.SUnit.Rank -/
section
noncomputable section
open IsDedekindDomain
open scoped NumberField nonZeroDivisors
variable {K : Type*} [Field K] [NumberField K]
namespace SUnitGroup
 
noncomputable def emptyEquivNumberFieldUnits :
    ((∅ : Set (HeightOneSpectrum (𝓞 K))).unit K) ≃* (𝓞 K)ˣ :=
  let eInteger :
      ((∅ : Set (HeightOneSpectrum (𝓞 K))).integer K)ˣ ≃*
        (⊥ : Subalgebra (𝓞 K) K)ˣ :=
    Units.mapEquiv
      ((Subalgebra.equivOfEq
        ((∅ : Set (HeightOneSpectrum (𝓞 K))).integer K)
        (⊥ : Subalgebra (𝓞 K) K)
        (IsDedekindDomain.integer_empty (𝓞 K) K) : _ ≃ₐ[𝓞 K] _) : _ ≃* _)
  let eBot :
      (⊥ : Subalgebra (𝓞 K) K)ˣ ≃* (𝓞 K)ˣ :=
    Units.mapEquiv
      ((Algebra.botEquivOfInjective
        (IsFractionRing.injective (𝓞 K) K) : _ ≃ₐ[𝓞 K] _) : _ ≃* _)
  (Set.unitEquivUnitsInteger
    (∅ : Set (HeightOneSpectrum (𝓞 K))) K).trans
      (eInteger.trans eBot)
 
noncomputable def fromNumberFieldUnits
    (S : Finset (HeightOneSpectrum (𝓞 K))) :
    (𝓞 K)ˣ →* SUnitGroup (K := K) S where
  toFun u :=
    ⟨((emptyEquivNumberFieldUnits (K := K)).symm u : Kˣ),
      fun v _ =>
        Set.unit_valuation_eq_one
          (∅ : Set (HeightOneSpectrum (𝓞 K))) K
          ((emptyEquivNumberFieldUnits (K := K)).symm u) (by simp)⟩
  map_one' := by
    ext
    simp
  map_mul' u v := by
    ext
    simp
theorem fromNumberFieldUnits_injective
    (S : Finset (HeightOneSpectrum (𝓞 K))) :
    Function.Injective (fromNumberFieldUnits (K := K) S) := by
  intro u v huv
  apply (emptyEquivNumberFieldUnits (K := K)).symm.injective
  ext
  exact congrArg (fun x : SUnitGroup (K := K) S => ((x : Kˣ) : K)) huv
 

theorem torsion_eq_rootsOfUnity_range
    (S : Finset (HeightOneSpectrum (𝓞 K))) :
    CommGroup.torsion (SUnitGroup (K := K) S) =
      Subgroup.map (fromNumberFieldUnits (K := K) S)
        (NumberField.Units.torsion K) := by
  ext x
  constructor
  · intro hx
    have hxfin : IsOfFinOrder x :=
      (CommGroup.mem_torsion (G := SUnitGroup (K := K) S) x).mp hx
    obtain ⟨n, hnpos, hxpow⟩ := hxfin.exists_pow_eq_one
    have hxK : (((x : Kˣ) : K) ^ n) = 1 := by
      simpa using congrArg
        (fun y : SUnitGroup (K := K) S => ((y : Kˣ) : K)) hxpow
    let y : ((∅ : Set (HeightOneSpectrum (𝓞 K))).unit K) :=
      ⟨(x : Kˣ), fun v _ => by
        have hvpow :
            (v.valuation K ((x : Kˣ) : K)) ^ n = 1 := by
          rw [← map_pow, hxK, map_one]
        exact (pow_eq_one_iff_left
          (a := v.valuation K ((x : Kˣ) : K))
          (Nat.ne_of_gt hnpos)).mp hvpow⟩
    let u : (𝓞 K)ˣ := emptyEquivNumberFieldUnits y
    have hufin : IsOfFinOrder u := by
      exact (emptyEquivNumberFieldUnits (K := K)).toMonoidHom.isOfFinOrder
        ((show IsOfFinOrder y from by
          refine isOfFinOrder_iff_pow_eq_one.mpr ⟨n, hnpos, ?_⟩
          ext
          exact hxK))
    refine ⟨u, ?_, ?_⟩
    · exact (CommGroup.mem_torsion (G := (𝓞 K)ˣ) u).2 hufin
    · ext
      change
        (((emptyEquivNumberFieldUnits (K := K)).symm
          (emptyEquivNumberFieldUnits (K := K) y) : Kˣ) : K) =
            ((x : Kˣ) : K)
      rw [MulEquiv.symm_apply_apply]
  · rintro ⟨u, hu, rfl⟩
    exact (CommGroup.mem_torsion
      (G := SUnitGroup (K := K) S)
      (fromNumberFieldUnits (K := K) S u)).2
        ((fromNumberFieldUnits (K := K) S).isOfFinOrder
          ((CommGroup.mem_torsion (G := (𝓞 K)ˣ) u).1 hu))
section DivisorMap
variable (S : Finset (HeightOneSpectrum (𝓞 K)))
 

noncomputable def divisorCoordinate
    (x : SUnitGroup (K := K) S) (v : S) : ℤ :=
  FractionalIdeal.count K (v : HeightOneSpectrum (𝓞 K))
    (FractionalIdeal.spanSingleton (𝓞 K)⁰ ((x : Kˣ) : K))
 

theorem valuation_mk'_eq_exp_neg_count
    (v : HeightOneSpectrum (𝓞 K)) {n : 𝓞 K} (hn : n ≠ 0)
    (d : (𝓞 K)⁰) :
    v.valuation K (IsLocalization.mk' K n d) =
      WithZero.exp
        (-FractionalIdeal.count K v
          (FractionalIdeal.spanSingleton (𝓞 K)⁰
            (IsLocalization.mk' K n d))) := by
  classical
  have hI :
      FractionalIdeal.spanSingleton (𝓞 K)⁰ (IsLocalization.mk' K n d) =
        FractionalIdeal.spanSingleton (𝓞 K)⁰
            ((algebraMap (𝓞 K) K) (d : 𝓞 K))⁻¹ *
          ↑(Ideal.span {n} : Ideal (𝓞 K)) := by
    rw [FractionalIdeal.coeIdeal_span_singleton,
      FractionalIdeal.spanSingleton_mul_spanSingleton]
    apply congr_arg
    rw [IsFractionRing.mk'_eq_div, div_eq_mul_inv, mul_comm]
  have hx :
      FractionalIdeal.spanSingleton (𝓞 K)⁰
          (IsLocalization.mk' K n d) ≠ 0 := by
    rw [FractionalIdeal.spanSingleton_ne_zero_iff,
      IsFractionRing.mk'_eq_div, ne_eq, div_eq_zero_iff, not_or]
    exact
      ⟨(map_ne_zero_iff (algebraMap (𝓞 K) K)
          (IsFractionRing.injective (𝓞 K) K)).mpr hn,
        map_ne_zero_of_mem_nonZeroDivisors _
          (IsFractionRing.injective (𝓞 K) K) d.property⟩
  have hcount :
      FractionalIdeal.count K v
          (FractionalIdeal.spanSingleton (𝓞 K)⁰
            (IsLocalization.mk' K n d)) =
        ((Associates.mk v.asIdeal).count
            (Associates.mk (Ideal.span {n} : Ideal (𝓞 K))).factors -
          (Associates.mk v.asIdeal).count
            (Associates.mk
              (Ideal.span {(d : 𝓞 K)} : Ideal (𝓞 K))).factors : ℤ) := by
    exact FractionalIdeal.count_well_defined (K := K) v hx hI
  rw [v.valuation_of_mk', v.intValuation_if_neg hn,
    v.intValuation_if_neg (nonZeroDivisors.coe_ne_zero d), hcount]
  rw [div_eq_mul_inv, ← WithZero.exp_neg, ← WithZero.exp_add]
  congr
  simp [sub_eq_add_neg, add_comm]
 

theorem valuation_eq_exp_neg_count
    (x : Kˣ) (v : HeightOneSpectrum (𝓞 K)) :
    v.valuation K (x : K) =
      WithZero.exp
        (-FractionalIdeal.count K v
          (FractionalIdeal.spanSingleton (𝓞 K)⁰ (x : K))) := by
  obtain ⟨n, d, hnd⟩ :=
    IsLocalization.exists_mk'_eq (𝓞 K)⁰ (x : K)
  have hn : n ≠ 0 := by
    intro hn0
    apply Units.ne_zero x
    rw [← hnd, hn0, IsFractionRing.mk'_eq_div, map_zero, zero_div]
  rw [← hnd]
  exact valuation_mk'_eq_exp_neg_count (K := K) v hn d
 

theorem valuation_eq_one_iff_count_eq_zero
    (x : Kˣ) (v : HeightOneSpectrum (𝓞 K)) :
    v.valuation K (x : K) = 1 ↔
      FractionalIdeal.count K v
        (FractionalIdeal.spanSingleton (𝓞 K)⁰ (x : K)) = 0 := by
  rw [valuation_eq_exp_neg_count (K := K) x v]
  constructor
  · intro h
    exact neg_eq_zero.mp (WithZero.exp_eq_one.mp h)
  · intro h
    simp [h]
theorem divisorCoordinate_eq_zero_iff
    (x : SUnitGroup (K := K) S) (v : S) :
    divisorCoordinate (K := K) S x v = 0 ↔
      (v : HeightOneSpectrum (𝓞 K)).valuation K ((x : Kˣ) : K) = 1 := by
  exact (valuation_eq_one_iff_count_eq_zero
    (K := K) (x : Kˣ) (v : HeightOneSpectrum (𝓞 K))).symm
theorem divisorCoordinate_mul
    (x y : SUnitGroup (K := K) S) (v : S) :
    divisorCoordinate (K := K) S (x * y) v =
      divisorCoordinate (K := K) S x v +
        divisorCoordinate (K := K) S y v := by
  change
    FractionalIdeal.count K (v : HeightOneSpectrum (𝓞 K))
        (FractionalIdeal.spanSingleton (𝓞 K)⁰
          ((((x : Kˣ) : K) * ((y : Kˣ) : K)))) =
      FractionalIdeal.count K (v : HeightOneSpectrum (𝓞 K))
          (FractionalIdeal.spanSingleton (𝓞 K)⁰ ((x : Kˣ) : K)) +
        FractionalIdeal.count K (v : HeightOneSpectrum (𝓞 K))
          (FractionalIdeal.spanSingleton (𝓞 K)⁰ ((y : Kˣ) : K))
  rw [← FractionalIdeal.spanSingleton_mul_spanSingleton,
    FractionalIdeal.count_mul]
  · exact FractionalIdeal.spanSingleton_ne_zero_iff.mpr
      (Units.ne_zero (x : Kˣ))
  · exact FractionalIdeal.spanSingleton_ne_zero_iff.mpr
      (Units.ne_zero (y : Kˣ))
theorem divisorCoordinate_one (v : S) :
    divisorCoordinate (K := K) S 1 v = 0 := by
  simp [divisorCoordinate, FractionalIdeal.count_one]
 
noncomputable def divisor :
    Additive (SUnitGroup (K := K) S) →+
      (S → ℤ) where
  toFun x v := divisorCoordinate (K := K) S (Additive.toMul x) v
  map_zero' := by
    ext v
    exact divisorCoordinate_one (K := K) S v
  map_add' x y := by
    ext v
    exact divisorCoordinate_mul (K := K) S
      (Additive.toMul x) (Additive.toMul y) v
 
noncomputable def divisorLinearMap :
    Additive (SUnitGroup (K := K) S) →ₗ[ℤ] (S → ℤ) :=
  (divisor (K := K) S).toIntLinearMap
 
noncomputable def fromNumberFieldUnitsLinearMap :
    Additive (𝓞 K)ˣ →ₗ[ℤ]
      Additive (SUnitGroup (K := K) S) :=
  (MonoidHom.toAdditive
    (fromNumberFieldUnits (K := K) S)).toIntLinearMap
theorem fromNumberFieldUnitsLinearMap_injective :
    Function.Injective (fromNumberFieldUnitsLinearMap (K := K) S) := by
  intro x y hxy
  apply Additive.toMul.injective
  exact fromNumberFieldUnits_injective (K := K) S
    (congrArg Additive.toMul hxy)
 

theorem valuation_eq_one_of_mem_ker_divisorLinearMap
    {x : Additive (SUnitGroup (K := K) S)}
    (hx : x ∈ LinearMap.ker (divisorLinearMap (K := K) S))
    (v : HeightOneSpectrum (𝓞 K)) :
    v.valuation K
      ((((Additive.toMul x :
        SUnitGroup (K := K) S) : Kˣ) : K)) = 1 := by
  by_cases hv : v ∈ S
  · let vv : S := ⟨v, hv⟩
    apply (divisorCoordinate_eq_zero_iff (K := K) S
      (Additive.toMul x) vv).1
    have hxzero :
        divisorLinearMap (K := K) S x = 0 :=
      LinearMap.mem_ker.mp hx
    simpa [divisorLinearMap, divisor] using congrFun hxzero vv
  · exact (Additive.toMul x :
      SUnitGroup (K := K) S).property v hv
 

noncomputable def kerDivisorToEmptySUnits
    (x : LinearMap.ker (divisorLinearMap (K := K) S)) :
    ((∅ : Set (HeightOneSpectrum (𝓞 K))).unit K) :=
  ⟨((Additive.toMul (x : Additive (SUnitGroup (K := K) S)) :
      SUnitGroup (K := K) S) : Kˣ),
    fun v _ =>
      valuation_eq_one_of_mem_ker_divisorLinearMap
        (K := K) S x.property v⟩
 
theorem range_fromNumberFieldUnitsLinearMap_eq_ker_divisorLinearMap :
    LinearMap.range (fromNumberFieldUnitsLinearMap (K := K) S) =
      LinearMap.ker (divisorLinearMap (K := K) S) := by
  ext x
  constructor
  · rintro ⟨u, rfl⟩
    apply LinearMap.mem_ker.mpr
    ext v
    apply (divisorCoordinate_eq_zero_iff (K := K) S
      (fromNumberFieldUnits (K := K) S (Additive.toMul u)) v).2
    exact Set.unit_valuation_eq_one
      (∅ : Set (HeightOneSpectrum (𝓞 K))) K
      ((emptyEquivNumberFieldUnits (K := K)).symm (Additive.toMul u))
      (by simp)
  · intro hx
    let y := kerDivisorToEmptySUnits (K := K) S ⟨x, hx⟩
    let u : (𝓞 K)ˣ := emptyEquivNumberFieldUnits y
    refine ⟨Additive.ofMul u, ?_⟩
    apply Additive.toMul.injective
    change
      fromNumberFieldUnits (K := K) S u = Additive.toMul x
    apply Subtype.ext
    change
      ((emptyEquivNumberFieldUnits (K := K)).symm u : Kˣ) =
        ((Additive.toMul x : SUnitGroup (K := K) S) : Kˣ)
    dsimp [u]
    rw [MulEquiv.symm_apply_apply]
    rfl
end DivisorMap
section PrimePowerSources
variable (S : Finset (HeightOneSpectrum (𝓞 K)))
 
theorem primeIdealPower_classNumber_isPrincipal (v : S) :
    ((v : HeightOneSpectrum (𝓞 K)).asIdeal ^
      NumberField.classNumber K).IsPrincipal := by
  have hv0 :
      (v : HeightOneSpectrum (𝓞 K)).asIdeal ^
          NumberField.classNumber K ≠ 0 :=
    pow_ne_zero _ (v : HeightOneSpectrum (𝓞 K)).ne_bot
  apply (ClassGroup.mk0_eq_one_iff
    (mem_nonZeroDivisors_iff_ne_zero.mpr hv0)).mp
  have hpow :
      (ClassGroup.mk0
        ⟨(v : HeightOneSpectrum (𝓞 K)).asIdeal,
          mem_nonZeroDivisors_iff_ne_zero.mpr
            (v : HeightOneSpectrum (𝓞 K)).ne_bot⟩) ^
          Fintype.card (ClassGroup (𝓞 K)) = 1 :=
    pow_card_eq_one
      (x := ClassGroup.mk0
        ⟨(v : HeightOneSpectrum (𝓞 K)).asIdeal,
          mem_nonZeroDivisors_iff_ne_zero.mpr
            (v : HeightOneSpectrum (𝓞 K)).ne_bot⟩)
  let I : (Ideal (𝓞 K))⁰ :=
    ⟨(v : HeightOneSpectrum (𝓞 K)).asIdeal,
      mem_nonZeroDivisors_iff_ne_zero.mpr
        (v : HeightOneSpectrum (𝓞 K)).ne_bot⟩
  have hsub :
      (⟨(v : HeightOneSpectrum (𝓞 K)).asIdeal ^
          NumberField.classNumber K,
        mem_nonZeroDivisors_iff_ne_zero.mpr hv0⟩ :
          (Ideal (𝓞 K))⁰) =
        I ^ NumberField.classNumber K := by
    rfl
  rw [hsub, map_pow]
  exact hpow
 
private noncomputable def primePowerGenerator (v : S) : 𝓞 K :=
  let I :=
    (v : HeightOneSpectrum (𝓞 K)).asIdeal ^
      NumberField.classNumber K
  letI : I.IsPrincipal :=
    primeIdealPower_classNumber_isPrincipal (K := K) S v
  Submodule.IsPrincipal.generator I
private theorem span_primePowerGenerator (v : S) :
    Ideal.span {primePowerGenerator (K := K) S v} =
      (v : HeightOneSpectrum (𝓞 K)).asIdeal ^
        NumberField.classNumber K := by
  let I :=
    (v : HeightOneSpectrum (𝓞 K)).asIdeal ^
      NumberField.classNumber K
  let : I.IsPrincipal :=
    primeIdealPower_classNumber_isPrincipal (K := K) S v
  simp [primePowerGenerator]
private theorem primePowerGenerator_ne_zero (v : S) :
    primePowerGenerator (K := K) S v ≠ 0 := by
  intro hzero
  have hv0 :
      (v : HeightOneSpectrum (𝓞 K)).asIdeal ^
          NumberField.classNumber K ≠ 0 :=
    pow_ne_zero _ (v : HeightOneSpectrum (𝓞 K)).ne_bot
  apply hv0
  rw [← span_primePowerGenerator (K := K) S v, hzero]
  simp
private theorem spanSingleton_primePowerGenerator (v : S) :
    FractionalIdeal.spanSingleton (𝓞 K)⁰
        (algebraMap (𝓞 K) K (primePowerGenerator (K := K) S v)) =
      ((v : HeightOneSpectrum (𝓞 K)).asIdeal :
        FractionalIdeal (𝓞 K)⁰ K) ^ NumberField.classNumber K := by
  rw [← FractionalIdeal.coeIdeal_span_singleton,
    span_primePowerGenerator (K := K) S v,
    FractionalIdeal.coeIdeal_pow]
 

private noncomputable def primePowerSUnit (v : S) :
    SUnitGroup (K := K) S :=
  ⟨Units.mk0
      (algebraMap (𝓞 K) K (primePowerGenerator (K := K) S v))
      ((map_ne_zero_iff (algebraMap (𝓞 K) K)
        (IsFractionRing.injective (𝓞 K) K)).mpr
          (primePowerGenerator_ne_zero (K := K) S v)),
    fun w hw => by
      apply (valuation_eq_one_iff_count_eq_zero (K := K)
        (Units.mk0
          (algebraMap (𝓞 K) K (primePowerGenerator (K := K) S v))
          ((map_ne_zero_iff (algebraMap (𝓞 K) K)
            (IsFractionRing.injective (𝓞 K) K)).mpr
              (primePowerGenerator_ne_zero (K := K) S v))) w).2
      change
        FractionalIdeal.count K w
          (FractionalIdeal.spanSingleton (𝓞 K)⁰
            (algebraMap (𝓞 K) K
              (primePowerGenerator (K := K) S v))) = 0
      rw [spanSingleton_primePowerGenerator (K := K) S v,
        FractionalIdeal.count_pow]
      have hwv :
          (v : HeightOneSpectrum (𝓞 K)) ≠ w := by
        intro hvw
        exact hw (hvw ▸ v.property)
      rw [FractionalIdeal.count_maximal_coprime K w hwv]
      simp⟩
private noncomputable def classNumberBasisVector (v : S) : S → ℤ := by
  classical
  exact fun w =>
    if w = v then (NumberField.classNumber K : ℤ) else 0
private theorem divisorCoordinate_primePowerSUnit
    (v w : S) :
    divisorCoordinate (K := K) S (primePowerSUnit (K := K) S v) w =
      classNumberBasisVector (K := K) S v w := by
  classical
  change
    FractionalIdeal.count K (w : HeightOneSpectrum (𝓞 K))
        (FractionalIdeal.spanSingleton (𝓞 K)⁰
          (algebraMap (𝓞 K) K
            (primePowerGenerator (K := K) S v))) =
      classNumberBasisVector (K := K) S v w
  simp only [classNumberBasisVector]
  rw [spanSingleton_primePowerGenerator (K := K) S v]
  split_ifs with hwv
  · subst w
    simpa using
      FractionalIdeal.count_pow_self K
        (v : HeightOneSpectrum (𝓞 K))
        (NumberField.classNumber K)
  · rw [FractionalIdeal.count_pow]
    have hvw :
        (v : HeightOneSpectrum (𝓞 K)) ≠
          (w : HeightOneSpectrum (𝓞 K)) := by
      intro h
      exact hwv (Subtype.ext h.symm)
    rw [FractionalIdeal.count_maximal_coprime K
      (w : HeightOneSpectrum (𝓞 K)) hvw]
    simp
end PrimePowerSources
section Rank
variable (S : Finset (HeightOneSpectrum (𝓞 K)))
private noncomputable def divisorRangeVector (v : S) :
    LinearMap.range (divisorLinearMap (K := K) S) :=
  ⟨classNumberBasisVector (K := K) S v,
    ⟨Additive.ofMul (primePowerSUnit (K := K) S v), by
      ext w
      exact divisorCoordinate_primePowerSUnit (K := K) S v w⟩⟩
private theorem divisorRangeVector_linearIndependent :
    LinearIndependent ℤ (divisorRangeVector (K := K) S) := by
  classical
  rw [Fintype.linearIndependent_iff]
  intro g hg v
  have hv := congrArg
    (fun z : LinearMap.range (divisorLinearMap (K := K) S) =>
      ((z : S → ℤ) v)) hg
  simp [divisorRangeVector, classNumberBasisVector] at hv
  exact hv.resolve_right (NumberField.classNumber_ne_zero K)
 

theorem finrank_divisor_range :
    Module.finrank ℤ
        (LinearMap.range (divisorLinearMap (K := K) S)) =
      S.card := by
  let : Module.Finite ℤ (S → ℤ) := inferInstance
  let : Module.Finite ℤ
      (LinearMap.range (divisorLinearMap (K := K) S)) :=
    Module.Finite.of_fg
      (IsNoetherian.noetherian
        (LinearMap.range (divisorLinearMap (K := K) S)))
  apply le_antisymm
  · calc
      Module.finrank ℤ
          (LinearMap.range (divisorLinearMap (K := K) S)) ≤
          Module.finrank ℤ (S → ℤ) :=
        Submodule.finrank_le
          (LinearMap.range (divisorLinearMap (K := K) S))
      _ = S.card := by simp
  · simpa using
      (divisorRangeVector_linearIndependent (K := K) S).fintype_card_le_finrank
 
theorem moduleFinite :
    Module.Finite ℤ (Additive (SUnitGroup (K := K) S)) := by
  let : Module.Finite ℤ (S → ℤ) := inferInstance
  have : Module.Finite ℤ
      (LinearMap.range (divisorLinearMap (K := K) S)) :=
    Module.Finite.of_fg
      (IsNoetherian.noetherian
        (LinearMap.range (divisorLinearMap (K := K) S)))
  rw [Module.finite_def]
  refine Submodule.fg_of_fg_map_of_fg_inf_ker
    (divisorLinearMap (K := K) S) ?_ ?_
  · rw [Submodule.map_top]
    exact IsNoetherian.noetherian
      (LinearMap.range (divisorLinearMap (K := K) S))
  · rw [inf_of_le_right le_top,
      ← range_fromNumberFieldUnitsLinearMap_eq_ker_divisorLinearMap
        (K := K) S]
    exact Submodule.fg_range
      (fromNumberFieldUnitsLinearMap (K := K) S)
 
theorem finrank_divisor_ker :
    Module.finrank ℤ
        (LinearMap.ker (divisorLinearMap (K := K) S)) =
      NumberField.Units.rank K := by
  calc
    Module.finrank ℤ
        (LinearMap.ker (divisorLinearMap (K := K) S)) =
        Module.finrank ℤ
          (LinearMap.range
            (fromNumberFieldUnitsLinearMap (K := K) S)) :=
      (LinearEquiv.ofEq _ _
        (range_fromNumberFieldUnitsLinearMap_eq_ker_divisorLinearMap
          (K := K) S).symm).finrank_eq
    _ = Module.finrank ℤ (Additive (𝓞 K)ˣ) :=
      (LinearEquiv.ofInjective
        (fromNumberFieldUnitsLinearMap (K := K) S)
        (fromNumberFieldUnitsLinearMap_injective (K := K) S)).symm.finrank_eq
    _ = NumberField.Units.rank K :=
      NumberField.Units.finrank_eq K
 

theorem finrank :
    Module.finrank ℤ (Additive (SUnitGroup (K := K) S)) =
      NumberField.Units.rank K + S.card := by
  let : Module.Finite ℤ
      (Additive (SUnitGroup (K := K) S)) :=
    moduleFinite (K := K) S
  let : Module.Finite ℤ (S → ℤ) := inferInstance
  let : Module.Finite ℤ
      (LinearMap.range (divisorLinearMap (K := K) S)) :=
    Module.Finite.of_fg
      (IsNoetherian.noetherian
        (LinearMap.range (divisorLinearMap (K := K) S)))
  let : Module.Finite ℤ
      (LinearMap.ker (divisorLinearMap (K := K) S)) :=
    Module.Finite.of_fg
      (IsNoetherian.noetherian
        (LinearMap.ker (divisorLinearMap (K := K) S)))
  have hrank :
      Module.rank ℤ (Additive (SUnitGroup (K := K) S)) =
        Module.rank ℤ
            (LinearMap.range (divisorLinearMap (K := K) S)) +
          Module.rank ℤ
            (LinearMap.ker (divisorLinearMap (K := K) S)) := by
    have h :=
      LinearMap.rank_eq_of_surjective
        (f := (divisorLinearMap (K := K) S).rangeRestrict)
        (divisorLinearMap (K := K) S).surjective_rangeRestrict
    rw [LinearMap.ker_rangeRestrict] at h
    exact h
  have hcard :
      (Module.finrank ℤ
          (Additive (SUnitGroup (K := K) S)) : Cardinal) =
        (Module.finrank ℤ
            (LinearMap.range (divisorLinearMap (K := K) S)) : Cardinal) +
          (Module.finrank ℤ
            (LinearMap.ker (divisorLinearMap (K := K) S)) : Cardinal) := by
    rw [Module.finrank_eq_rank, Module.finrank_eq_rank,
      (LinearMap.ker (divisorLinearMap (K := K) S)).finrank_eq_rank]
    exact hrank
  rw [← Nat.cast_inj (R := Cardinal), Nat.cast_add]
  calc
    (Module.finrank ℤ
        (Additive (SUnitGroup (K := K) S)) : Cardinal) =
      (Module.finrank ℤ
          (LinearMap.range (divisorLinearMap (K := K) S)) : Cardinal) +
        (Module.finrank ℤ
          (LinearMap.ker (divisorLinearMap (K := K) S)) : Cardinal) :=
      hcard
    _ = (S.card : Cardinal) +
        (NumberField.Units.rank K : Cardinal) := by
      rw [finrank_divisor_range (K := K) S,
        finrank_divisor_ker (K := K) S]
    _ = (NumberField.Units.rank K : Cardinal) +
        (S.card : Cardinal) := by rw [add_comm]
end Rank
end SUnitGroup
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.SUnit.LogLattice -/
section
noncomputable section
open IsDedekindDomain Module
open scoped Classical NumberField nonZeroDivisors
variable {K : Type*} [Field K] [NumberField K]
namespace SUnitGroup
variable (S : Finset (HeightOneSpectrum (𝓞 K)))
 


abbrev ReducedLogSpace :=
  NumberField.Units.dirichletUnitTheorem.logSpace K × (S → ℝ)
 



noncomputable def reducedLog :
    Additive (SUnitGroup (K := K) S) →+
      ReducedLogSpace (K := K) S where
  toFun x :=
    (fun w =>
      w.1.mult *
        Real.log
          (w.1
            (((Additive.toMul x :
              SUnitGroup (K := K) S) : Kˣ) : K)),
      fun v =>
        (divisorCoordinate (K := K) S
          (Additive.toMul x) v : ℝ))
  map_zero' := by
    apply Prod.ext
    · ext w
      simp
    · ext v
      change
        (divisorCoordinate (K := K) S 1 v : ℝ) = 0
      exact_mod_cast divisorCoordinate_one (K := K) S v
  map_add' x y := by
    apply Prod.ext
    · ext w
      simp [Real.log_mul, mul_add]
    · ext v
      change
        (divisorCoordinate (K := K) S
          (Additive.toMul x * Additive.toMul y) v : ℝ) =
          (divisorCoordinate (K := K) S
            (Additive.toMul x) v : ℝ) +
          (divisorCoordinate (K := K) S
            (Additive.toMul y) v : ℝ)
      exact_mod_cast
        divisorCoordinate_mul (K := K) S
          (Additive.toMul x) (Additive.toMul y) v
 
noncomputable def reducedLogLinearMap :
    Additive (SUnitGroup (K := K) S) →ₗ[ℤ]
      ReducedLogSpace (K := K) S :=
  (reducedLog (K := K) S).toIntLinearMap
section FullLogarithmicSpace
end FullLogarithmicSpace
section Decomposition
 

def logRank : ℕ :=
  Fintype.card (NumberField.InfinitePlace K) + S.card - 1
 
abbrev RootsOfUnityAdditive :=
  (NumberField.Units.torsion K).toAddSubgroup.toIntSubmodule
 
abbrev TorsionAdditive :=
  Submodule.torsion ℤ
    (Additive (SUnitGroup (K := K) S))
theorem torsionAdditive_eq :
    TorsionAdditive (K := K) S =
      (AddCommGroup.torsion
        (Additive
          (SUnitGroup (K := K) S))).toIntSubmodule := by
  apply Submodule.toAddSubgroup_injective
  rw [Submodule.torsion_int,
    AddSubgroup.toIntSubmodule_toAddSubgroup]
 
abbrev FreeQuotient :=
  Additive (SUnitGroup (K := K) S) ⧸
    TorsionAdditive (K := K) S
local instance instModuleFinite_additiveSUnit :
    Module.Finite ℤ (Additive (SUnitGroup (K := K) S)) :=
  moduleFinite (K := K) S
local instance instModule_freeQuotient :
    Module ℤ (FreeQuotient (K := K) S) :=
  Submodule.Quotient.module
    (TorsionAdditive (K := K) S)
local instance instModuleFinite_freeQuotient :
    Module.Finite ℤ (FreeQuotient (K := K) S) :=
  Module.Finite.quotient ℤ
    (TorsionAdditive (K := K) S)
local instance instModuleFree_freeQuotient :
    Module.Free ℤ (FreeQuotient (K := K) S) :=
  Module.free_of_finite_type_torsion_free'
 

theorem finrank_freeQuotient :
    Module.finrank ℤ (FreeQuotient (K := K) S) =
      logRank (K := K) S := by
  calc
    Module.finrank ℤ (FreeQuotient (K := K) S) =
        Module.finrank ℤ
          (Additive (SUnitGroup (K := K) S)) := by
      exact finrank_quotient_eq_of_le_torsion le_rfl
    _ = NumberField.Units.rank K + S.card :=
      finrank (K := K) S
    _ = logRank (K := K) S := by
      rw [NumberField.Units.rank]
      dsimp [logRank]
      have hpos :
          0 <
            Fintype.card
              (NumberField.InfinitePlace K) :=
        Fintype.card_pos
      omega
 
noncomputable def basisFreeQuotient :
    Basis (Fin (logRank (K := K) S)) ℤ
      (FreeQuotient (K := K) S) :=
  Basis.reindex
    (Module.Free.chooseBasis ℤ
      (FreeQuotient (K := K) S))
    (Fintype.equivOfCardEq <| by
      rw [← Module.finrank_eq_card_chooseBasisIndex,
        finrank_freeQuotient (K := K) S,
        Fintype.card_fin])
 

noncomputable def rootsOfUnityEquivTorsion :
    RootsOfUnityAdditive (K := K) ≃ₗ[ℤ]
      TorsionAdditive (K := K) S := by
  let f :
      RootsOfUnityAdditive (K := K) →ₗ[ℤ]
        TorsionAdditive (K := K) S :=
    ((fromNumberFieldUnitsLinearMap (K := K) S).domRestrict
      (RootsOfUnityAdditive (K := K))).codRestrict
        (TorsionAdditive (K := K) S) fun u => by
          rw [torsionAdditive_eq (K := K) S]
          change
            Additive.toMul
                (fromNumberFieldUnitsLinearMap (K := K) S
                  (u :
                    Additive (𝓞 K)ˣ)) ∈
              CommGroup.torsion
                (SUnitGroup (K := K) S)
          rw [torsion_eq_rootsOfUnity_range (K := K) S]
          refine
            ⟨Additive.toMul
                (u : Additive (𝓞 K)ˣ), ?_, rfl⟩
          exact u.property
  apply LinearEquiv.ofBijective f
  constructor
  · intro x y hxy
    apply Subtype.ext
    apply fromNumberFieldUnitsLinearMap_injective
      (K := K) S
    exact congrArg Subtype.val hxy
  · intro y
    have hyadd :
        (y :
          Additive (SUnitGroup (K := K) S)) ∈
          AddCommGroup.torsion
            (Additive (SUnitGroup (K := K) S)) := by
      have hy' :
          (y :
            Additive (SUnitGroup (K := K) S)) ∈
            (AddCommGroup.torsion
              (Additive
                (SUnitGroup (K := K) S))).toIntSubmodule := by
        rw [← torsionAdditive_eq (K := K) S]
        exact y.property
      exact hy'
    have hy :
        Additive.toMul
            (y :
              Additive (SUnitGroup (K := K) S)) ∈
          CommGroup.torsion
            (SUnitGroup (K := K) S) :=
      hyadd
    rw [torsion_eq_rootsOfUnity_range (K := K) S] at hy
    obtain ⟨u, hu, huy⟩ := hy
    let x : RootsOfUnityAdditive (K := K) :=
      ⟨Additive.ofMul u, hu⟩
    refine ⟨x, ?_⟩
    apply Subtype.ext
    apply Additive.toMul.injective
    exact huy
 

private noncomputable def torsionQuotientSection :
    FreeQuotient (K := K) S →ₗ[ℤ]
      Additive (SUnitGroup (K := K) S) :=
  (Module.projective_lifting_property
    (TorsionAdditive (K := K) S).mkQ
    LinearMap.id
    (TorsionAdditive (K := K) S).mkQ_surjective).choose
private theorem torsionQuotientSection_spec :
    (TorsionAdditive (K := K) S).mkQ.comp
        (torsionQuotientSection (K := K) S) =
      LinearMap.id :=
  (Module.projective_lifting_property
    (TorsionAdditive (K := K) S).mkQ
    LinearMap.id
    (TorsionAdditive (K := K) S).mkQ_surjective).choose_spec
 

private noncomputable def torsionProdFreeQuotientEquiv :
    Additive (SUnitGroup (K := K) S) ≃ₗ[ℤ]
      TorsionAdditive (K := K) S ×
        FreeQuotient (K := K) S :=
  (lequivProdOfRightSplitExact
    (TorsionAdditive (K := K) S).injective_subtype
    (by
      rw [Submodule.range_subtype, Submodule.ker_mkQ])
    (torsionQuotientSection_spec (K := K) S)).symm
 


noncomputable def decompositionLinearEquiv :
    Additive (SUnitGroup (K := K) S) ≃ₗ[ℤ]
      RootsOfUnityAdditive (K := K) ×
        (Fin (logRank (K := K) S) →₀ ℤ) :=
  (torsionProdFreeQuotientEquiv (K := K) S).trans
    ((rootsOfUnityEquivTorsion (K := K) S).symm.prodCongr
      (basisFreeQuotient (K := K) S).repr)
 

noncomputable def multiplicativeRootsOfUnityEquiv :
    Multiplicative (RootsOfUnityAdditive (K := K)) ≃*
      NumberField.Units.torsion K where
  toFun x :=
    ⟨Additive.toMul
      ((Multiplicative.toAdd x :
        RootsOfUnityAdditive (K := K)) :
        Additive (𝓞 K)ˣ),
      (Multiplicative.toAdd x :
        RootsOfUnityAdditive (K := K)).property⟩
  invFun u :=
    Multiplicative.ofAdd
      (⟨Additive.ofMul (u : (𝓞 K)ˣ), u.property⟩ :
        RootsOfUnityAdditive (K := K))
  left_inv x := by
    rfl
  right_inv u := by
    rfl
  map_mul' x y := by
    rfl
 



noncomputable def decomposition :
    SUnitGroup (K := K) S ≃*
      NumberField.Units.torsion K ×
        Multiplicative
          (Fin (logRank (K := K) S) →₀ ℤ) :=
  (AddEquiv.toMultiplicativeRight
      (decompositionLinearEquiv
        (K := K) S).toAddEquiv).trans
    (((MulEquiv.prodMultiplicative
        (RootsOfUnityAdditive (K := K))
        (Fin (logRank (K := K) S) →₀ ℤ)) :
        Multiplicative
            (RootsOfUnityAdditive (K := K) ×
              (Fin (logRank (K := K) S) →₀ ℤ)) ≃*
          Multiplicative (RootsOfUnityAdditive (K := K)) ×
            Multiplicative
              (Fin (logRank (K := K) S) →₀ ℤ)).trans
      ((multiplicativeRootsOfUnityEquiv
        (K := K)).prodCongr
          (MulEquiv.refl
            (Multiplicative
              (Fin (logRank (K := K) S) →₀ ℤ)))))
end Decomposition
end SUnitGroup
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
 
def nthRootsSubgroup (n : ℕ) : Subgroup Lˣ where
  carrier := {u | u ^ n = 1}
  one_mem' := by
    simp
  mul_mem' := by
    intro u v hu hv
    change (u * v) ^ n = 1
    rw [mul_pow, hu, hv, one_mul]
  inv_mem' := by
    intro u hu
    change u⁻¹ ^ n = 1
    rw [inv_pow, hu, inv_one]
 
@[simp] theorem mem_nthRootsSubgroup_iff {n : ℕ} {u : Lˣ} :
    u ∈ nthRootsSubgroup L n ↔ u ^ n = 1 :=
  Iff.rfl
end TorsionSubgroups
section RootQuotients
variable {K L : Type*} [Field K] [Field L] [Algebra K L]
 
def rootQuotient (β : Lˣ) (σ : Gal(L/K)) : Lˣ :=
  σ • β / β
 
@[simp] theorem rootQuotient_one (β : Lˣ) :
    rootQuotient (K := K) (L := L) β 1 = 1 := by
  simp [rootQuotient]
 
@[simp] theorem rootQuotient_mul_right (β : Lˣ) (σ : Gal(L/K)) :
    rootQuotient (K := K) (L := L) β σ * β = σ • β := by
  simp [rootQuotient]
 
@[simp] theorem rootQuotient_algebraMap_unit (u : Kˣ) (σ : Gal(L/K)) :
    rootQuotient (K := K) (L := L) (Units.map (algebraMap K L).toMonoidHom u) σ = 1 := by
  unfold rootQuotient
  ext
  simp
 
theorem rootQuotient_mul_root (u v : Lˣ) (σ : Gal(L/K)) :
    rootQuotient (K := K) (L := L) (u * v) σ =
      rootQuotient (K := K) (L := L) u σ *
        rootQuotient (K := K) (L := L) v σ := by
  simp [rootQuotient, div_eq_mul_inv, mul_assoc, mul_left_comm, mul_comm]
 
theorem rootQuotient_eq_one_iff (β : Lˣ) (σ : Gal(L/K)) :
    rootQuotient (K := K) (L := L) β σ = 1 ↔ σ • β = β := by
  unfold rootQuotient
  exact div_eq_one
 
theorem rootQuotient_mul (β : Lˣ) (σ τ : Gal(L/K)) :
    rootQuotient (K := K) (L := L) β (σ * τ) =
      σ • rootQuotient (K := K) (L := L) β τ *
        rootQuotient (K := K) (L := L) β σ := by
  rw [rootQuotient]
  rw [mul_smul]
  simp [rootQuotient, div_eq_mul_inv, mul_assoc, mul_left_comm, mul_comm]
 
theorem rootQuotient_div (u v : Lˣ) (σ : Gal(L/K)) :
    rootQuotient (K := K) (L := L) (u / v) σ =
      rootQuotient (K := K) (L := L) u σ /
        rootQuotient (K := K) (L := L) v σ := by
  simp [rootQuotient, div_eq_mul_inv, mul_assoc, mul_left_comm, mul_comm]
 
theorem rootQuotient_changeRoot (u v : Lˣ) (σ : Gal(L/K)) :
    rootQuotient (K := K) (L := L) u σ /
        rootQuotient (K := K) (L := L) v σ =
      rootQuotient (K := K) (L := L) (u / v) σ := by
  exact (rootQuotient_div (K := K) (L := L) u v σ).symm
 
theorem rootQuotient_pow_eq_one_of_pow_fixed
    {n : ℕ} {β : Lˣ} (hβ : ∀ σ : Gal(L/K), σ • (β ^ n) = β ^ n)
    (σ : Gal(L/K)) :
    rootQuotient (K := K) (L := L) β σ ^ n = 1 := by
  unfold rootQuotient
  apply div_pow_eq_one_of_pow_eq_pow
  exact (map_pow (MulDistribMulAction.toMonoidHom Lˣ σ) β n).symm.trans (hβ σ)
end RootQuotients
section RadicalData
variable {K L : Type*} [Field K] [Field L] [Algebra K L]
 



structure RadicalDatum (n : ℕ+) where
   
  carrier : Subgroup Kˣ
   
  root : carrier → Lˣ
   
  root_pow_eq : ∀ a : carrier,
    root a ^ (n : ℕ) = Units.map (algebraMap K L).toMonoidHom a.1
namespace RadicalDatum
variable {n : ℕ+} (D : RadicalDatum (K := K) (L := L) n)
 
@[simp] theorem root_pow_eq_map (a : D.carrier) :
    D.root a ^ (n : ℕ) = Units.map (algebraMap K L).toMonoidHom a.1 :=
  D.root_pow_eq a
 
theorem div_pow_eq_one_of_same_image
    {u v : Lˣ} (a : D.carrier)
    (hu : u ^ (n : ℕ) = Units.map (algebraMap K L).toMonoidHom a.1)
    (hv : v ^ (n : ℕ) = Units.map (algebraMap K L).toMonoidHom a.1) :
    (u / v) ^ (n : ℕ) = 1 := by
  exact div_pow_eq_one_of_pow_eq_pow (n := (n : ℕ)) (hu.trans hv.symm)
 
def rootCocycle (a : D.carrier) (σ : Gal(L/K)) : Lˣ :=
  rootQuotient (K := K) (L := L) (D.root a) σ
 
@[simp] theorem rootCocycle_one (a : D.carrier) :
    D.rootCocycle a 1 = 1 := by
  simp [rootCocycle]
 
theorem rootCocycle_mul (a : D.carrier) (σ τ : Gal(L/K)) :
    D.rootCocycle a (σ * τ) =
      σ • D.rootCocycle a τ * D.rootCocycle a σ := by
  exact rootQuotient_mul (K := K) (L := L) (D.root a) σ τ
 
@[simp] theorem smul_algebraMap_unit (σ : Gal(L/K)) (u : Kˣ) :
    σ • Units.map (algebraMap K L).toMonoidHom u =
      Units.map (algebraMap K L).toMonoidHom u := by
  ext
  simp
 
theorem rootCocycle_pow_eq_one (a : D.carrier) (σ : Gal(L/K)) :
    D.rootCocycle a σ ^ (n : ℕ) = 1 := by
  refine rootQuotient_pow_eq_one_of_pow_fixed (K := K) (L := L)
      (β := D.root a) ?_ σ
  intro τ
  rw [D.root_pow_eq_map]
  exact smul_algebraMap_unit (K := K) (L := L) τ a.1
 
theorem rootQuotient_eq_rootCocycle_of_same_pow
    (hfixed : ∀ σ : Gal(L/K), ∀ u : Lˣ, u ^ (n : ℕ) = 1 → σ • u = u)
    {u : Lˣ} (a : D.carrier)
    (hu : u ^ (n : ℕ) = Units.map (algebraMap K L).toMonoidHom a.1)
    (σ : Gal(L/K)) :
    rootQuotient (K := K) (L := L) u σ = D.rootCocycle a σ := by
  have hpow : (u / D.root a) ^ (n : ℕ) = 1 := by
    exact D.div_pow_eq_one_of_same_image a hu (D.root_pow_eq_map a)
  have hfixed_delta : σ • (u / D.root a) = u / D.root a :=
    hfixed σ (u / D.root a) hpow
  have hquot_one : rootQuotient (K := K) (L := L) (u / D.root a) σ = 1 :=
    (rootQuotient_eq_one_iff (K := K) (L := L) (u / D.root a) σ).2 hfixed_delta
  have hdiv_one : rootQuotient (K := K) (L := L) u σ / D.rootCocycle a σ = 1 := by
    rw [rootCocycle, rootQuotient_changeRoot]
    exact hquot_one
  exact div_eq_one.mp hdiv_one
 
def rootCharacter (a : D.carrier)
    (hfixed : ∀ σ : Gal(L/K), ∀ u : Lˣ, u ^ (n : ℕ) = 1 → σ • u = u) :
    Gal(L/K) →* Lˣ where
  toFun := D.rootCocycle a
  map_one' := by
    exact D.rootCocycle_one a
  map_mul' := by
    intro σ τ
    rw [D.rootCocycle_mul]
    rw [hfixed σ (D.rootCocycle a τ) (D.rootCocycle_pow_eq_one a τ)]
    exact mul_comm _ _
 
@[simp] theorem rootCharacter_apply (a : D.carrier)
    (hfixed : ∀ σ : Gal(L/K), ∀ u : Lˣ, u ^ (n : ℕ) = 1 → σ • u = u)
    (σ : Gal(L/K)) :
    D.rootCharacter a hfixed σ = D.rootCocycle a σ :=
  rfl
 
theorem rootCharacter_eq_of_same_pow
    (hfixed : ∀ σ : Gal(L/K), ∀ u : Lˣ, u ^ (n : ℕ) = 1 → σ • u = u)
    {u : Lˣ} (a : D.carrier)
    (hu : u ^ (n : ℕ) = Units.map (algebraMap K L).toMonoidHom a.1)
    (σ : Gal(L/K)) :
    rootQuotient (K := K) (L := L) u σ = D.rootCharacter a hfixed σ := by
  rw [D.rootCharacter_apply]
  exact D.rootQuotient_eq_rootCocycle_of_same_pow hfixed a hu σ
 
theorem rootCharacter_pow_eq_one (a : D.carrier)
    (hfixed : ∀ σ : Gal(L/K), ∀ u : Lˣ, u ^ (n : ℕ) = 1 → σ • u = u)
    (σ : Gal(L/K)) :
    D.rootCharacter a hfixed σ ^ (n : ℕ) = 1 := by
  rw [D.rootCharacter_apply]
  exact D.rootCocycle_pow_eq_one a σ
 
theorem rootCharacter_mem_nthRootsSubgroup (a : D.carrier)
    (hfixed : ∀ σ : Gal(L/K), ∀ u : Lˣ, u ^ (n : ℕ) = 1 → σ • u = u)
    (σ : Gal(L/K)) :
    D.rootCharacter a hfixed σ ∈ nthRootsSubgroup L (n : ℕ) := by
  rw [mem_nthRootsSubgroup_iff]
  exact D.rootCharacter_pow_eq_one a hfixed σ
end RadicalDatum
end RadicalData
end KummerTheory
end

/- GaloisCohomology.Kummer.Concrete.RadicalQuotient -/
section
namespace KummerTheory
section RadicalQuotient
variable {K L : Type*} [Field K] [Field L] [Algebra K L]
namespace RadicalDatum
variable {n : ℕ+} (D : RadicalDatum (K := K) (L := L) n)
 
theorem rootCharacter_mul_withoutSection
    (hfixed : ∀ σ : Gal(L/K), ∀ u : Lˣ, u ^ (n : ℕ) = 1 → σ • u = u)
    (a b : D.carrier) :
    D.rootCharacter (a * b) hfixed =
      D.rootCharacter a hfixed * D.rootCharacter b hfixed := by
  apply MonoidHom.ext
  intro σ
  change D.rootCocycle (a * b) σ = D.rootCocycle a σ * D.rootCocycle b σ
  rw [← D.rootQuotient_eq_rootCocycle_of_same_pow hfixed (a * b) (u := D.root a * D.root b)]
  · exact rootQuotient_mul_root (K := K) (L := L) (D.root a) (D.root b) σ
  · rw [mul_pow, D.root_pow_eq_map, D.root_pow_eq_map]
    exact (map_mul (Units.map (algebraMap K L).toMonoidHom) a.1 b.1).symm
 
theorem rootCharacter_one_withoutSection
    (hfixed : ∀ σ : Gal(L/K), ∀ u : Lˣ, u ^ (n : ℕ) = 1 → σ • u = u) :
    D.rootCharacter 1 hfixed = 1 := by
  apply MonoidHom.ext
  intro σ
  rw [D.rootCharacter_apply]
  rw [← D.rootQuotient_eq_rootCocycle_of_same_pow hfixed (1 : D.carrier)
    (u := Units.map (algebraMap K L).toMonoidHom (1 : Kˣ))]
  · exact rootQuotient_algebraMap_unit (K := K) (L := L) 1 σ
  · simp
 
def rootCharacterToMuWithoutSection (a : D.carrier)
    (hfixed : ∀ σ : Gal(L/K), ∀ u : Lˣ, u ^ (n : ℕ) = 1 → σ • u = u) :
    Gal(L/K) →* nthRootsSubgroup L (n : ℕ) where
  toFun := fun σ =>
    ⟨D.rootCharacter a hfixed σ, D.rootCharacter_mem_nthRootsSubgroup a hfixed σ⟩
  map_one' := by
    apply Subtype.ext
    exact map_one (D.rootCharacter a hfixed)
  map_mul' := by
    intro σ τ
    apply Subtype.ext
    exact map_mul (D.rootCharacter a hfixed) σ τ
 

@[simp] theorem rootCharacterToMuWithoutSection_apply (a : D.carrier)
    (hfixed : ∀ σ : Gal(L/K), ∀ u : Lˣ, u ^ (n : ℕ) = 1 → σ • u = u)
    (σ : Gal(L/K)) :
    D.rootCharacterToMuWithoutSection a hfixed σ =
      ⟨D.rootCharacter a hfixed σ, D.rootCharacter_mem_nthRootsSubgroup a hfixed σ⟩ :=
  rfl
 
def kummerCharacterWithoutSection
    (hfixed : ∀ σ : Gal(L/K), ∀ u : Lˣ, u ^ (n : ℕ) = 1 → σ • u = u) :
    D.carrier →* (Gal(L/K) →* nthRootsSubgroup L (n : ℕ)) where
  toFun := fun a => D.rootCharacterToMuWithoutSection a hfixed
  map_one' := by
    apply MonoidHom.ext
    intro σ
    apply Subtype.ext
    exact congrArg (fun χ : Gal(L/K) →* Lˣ => χ σ)
      (D.rootCharacter_one_withoutSection hfixed)
  map_mul' := by
    intro a b
    apply MonoidHom.ext
    intro σ
    apply Subtype.ext
    exact congrArg (fun χ : Gal(L/K) →* Lˣ => χ σ)
      (D.rootCharacter_mul_withoutSection hfixed a b)
 
def ambientNthPowersSubgroup : Subgroup D.carrier :=
  (powMonoidHom (n : ℕ) : Kˣ →* Kˣ).range.comap D.carrier.subtype
 
theorem mem_ambientNthPowersSubgroup_iff {a : D.carrier} :
    a ∈ D.ambientNthPowersSubgroup ↔ ∃ b : Kˣ, b ^ (n : ℕ) = a.1 :=
  Iff.rfl
 
theorem rootCharacter_eq_one_of_mem_ambientNthPowers
    (hfixed : ∀ σ : Gal(L/K), ∀ u : Lˣ, u ^ (n : ℕ) = 1 → σ • u = u)
    {a : D.carrier} (ha : a ∈ D.ambientNthPowersSubgroup) :
    D.rootCharacter a hfixed = 1 := by
  obtain ⟨b, hb⟩ := (D.mem_ambientNthPowersSubgroup_iff).1 ha
  apply MonoidHom.ext
  intro σ
  rw [D.rootCharacter_apply]
  rw [← D.rootQuotient_eq_rootCocycle_of_same_pow hfixed a
    (u := Units.map (algebraMap K L).toMonoidHom b)]
  · exact rootQuotient_algebraMap_unit (K := K) (L := L) b σ
  · rw [← map_pow, hb]
 
theorem ambientNthPowersSubgroup_le_ker
    (hfixed : ∀ σ : Gal(L/K), ∀ u : Lˣ, u ^ (n : ℕ) = 1 → σ • u = u) :
    D.ambientNthPowersSubgroup ≤ MonoidHom.ker (D.kummerCharacterWithoutSection hfixed) := by
  intro a ha
  change D.kummerCharacterWithoutSection hfixed a = 1
  apply MonoidHom.ext
  intro σ
  apply Subtype.ext
  exact congrArg (fun χ : Gal(L/K) →* Lˣ => χ σ)
    (D.rootCharacter_eq_one_of_mem_ambientNthPowers hfixed ha)
 


theorem ker_kummerCharacterWithoutSection_eq_ambientNthPowers
    [IsGalois K L]
    (hfixed : ∀ σ : Gal(L/K), ∀ u : Lˣ, u ^ (n : ℕ) = 1 → σ • u = u) :
    MonoidHom.ker (D.kummerCharacterWithoutSection hfixed) =
      D.ambientNthPowersSubgroup := by
  apply le_antisymm
  · intro a ha
    have hroot : ∀ σ : Gal(L/K), σ • D.root a = D.root a := by
      intro σ
      have hvalue : D.rootCharacterToMuWithoutSection a hfixed σ = 1 := by
        have happ := congrArg
          (fun χ : Gal(L/K) →* nthRootsSubgroup L (n : ℕ) ↦ χ σ) ha
        simpa [kummerCharacterWithoutSection] using happ
      have hquot : rootQuotient (K := K) (L := L) (D.root a) σ = 1 := by
        exact congrArg Subtype.val hvalue
      exact (rootQuotient_eq_one_iff (K := K) (L := L) (D.root a) σ).1 hquot
    have hfixedVal : ∀ σ : Gal(L/K), σ (D.root a : L) = D.root a := by
      intro σ
      exact congrArg Units.val (hroot σ)
    obtain ⟨b, hb⟩ :=
      (InfiniteGalois.mem_range_algebraMap_iff_fixed (k := K) (K := L) (D.root a : L)).2
        hfixedVal
    have hb0 : b ≠ 0 := by
      intro hbzero
      have : (D.root a : L) = 0 := by simpa [hbzero] using hb.symm
      exact Units.ne_zero (D.root a) this
    refine (D.mem_ambientNthPowersSubgroup_iff).2 ⟨Units.mk0 b hb0, ?_⟩
    apply Units.ext
    calc
      ((Units.mk0 b hb0 : Kˣ) ^ (n : ℕ) : K) = b ^ (n : ℕ) := rfl
      _ = a.1 := by
        apply (algebraMap K L).injective
        calc
          algebraMap K L (b ^ (n : ℕ)) = (D.root a : L) ^ (n : ℕ) := by
            rw [map_pow, hb]
          _ = algebraMap K L (a.1 : K) := congrArg Units.val (D.root_pow_eq_map a)
  · exact D.ambientNthPowersSubgroup_le_ker hfixed
 
def RadicalQuotient : Type _ :=
  D.carrier ⧸ D.ambientNthPowersSubgroup
 

instance radicalQuotient_commGroupInstance : CommGroup D.RadicalQuotient := by
  change CommGroup (D.carrier ⧸ D.ambientNthPowersSubgroup)
  infer_instance
 

def radicalQuotientMulEquiv :
    D.RadicalQuotient ≃* (D.carrier ⧸ D.ambientNthPowersSubgroup) :=
  MulEquiv.refl _
 
def radicalQuotientMk : D.carrier →* D.RadicalQuotient :=
  QuotientGroup.mk' D.ambientNthPowersSubgroup
 

@[simp]
theorem radicalQuotientMk_eq_iff (a b : D.carrier) :
    D.radicalQuotientMk a = D.radicalQuotientMk b ↔
      a / b ∈ D.ambientNthPowersSubgroup := by
  change
    (QuotientGroup.mk' D.ambientNthPowersSubgroup) a =
        (QuotientGroup.mk' D.ambientNthPowersSubgroup) b ↔
      a / b ∈ D.ambientNthPowersSubgroup
  exact QuotientGroup.eq_iff_div_mem
 
theorem radicalQuotientMk_surjective :
    Function.Surjective D.radicalQuotientMk := by
  change Function.Surjective
    (QuotientGroup.mk' D.ambientNthPowersSubgroup)
  exact QuotientGroup.mk'_surjective D.ambientNthPowersSubgroup
 

protected theorem radicalQuotient_inductionOn
    {motive : D.RadicalQuotient → Prop} (q : D.RadicalQuotient)
    (mk : ∀ a : D.carrier, motive (D.radicalQuotientMk a)) :
    motive q := by
  exact QuotientGroup.induction_on' q mk
 
def radicalQuotientLift {M : Type*} [Group M]
    (f : D.carrier →* M)
    (hf : D.ambientNthPowersSubgroup ≤ MonoidHom.ker f) :
    D.RadicalQuotient →* M :=
  (QuotientGroup.lift D.ambientNthPowersSubgroup f hf).comp
    D.radicalQuotientMulEquiv.toMonoidHom
 
@[simp]
theorem radicalQuotientLift_mk {M : Type*} [Group M]
    (f : D.carrier →* M)
    (hf : D.ambientNthPowersSubgroup ≤ MonoidHom.ker f)
    (a : D.carrier) :
    D.radicalQuotientLift f hf (D.radicalQuotientMk a) = f a :=
  rfl
 
def quotientKummerCharacterWithoutSection
    (hfixed : ∀ σ : Gal(L/K), ∀ u : Lˣ, u ^ (n : ℕ) = 1 → σ • u = u) :
    D.RadicalQuotient →* (Gal(L/K) →* nthRootsSubgroup L (n : ℕ)) :=
  D.radicalQuotientLift (D.kummerCharacterWithoutSection hfixed)
    (D.ambientNthPowersSubgroup_le_ker hfixed)
 
@[simp] theorem quotientKummerCharacterWithoutSection_mk (a : D.carrier)
    (hfixed : ∀ σ : Gal(L/K), ∀ u : Lˣ, u ^ (n : ℕ) = 1 → σ • u = u) :
    D.quotientKummerCharacterWithoutSection hfixed
        (D.radicalQuotientMk a) =
      D.kummerCharacterWithoutSection hfixed a :=
  D.radicalQuotientLift_mk _ _ a
 

theorem quotientKummerCharacterWithoutSection_injective
    [IsGalois K L]
    (hfixed : ∀ σ : Gal(L/K), ∀ u : Lˣ, u ^ (n : ℕ) = 1 → σ • u = u) :
    Function.Injective (D.quotientKummerCharacterWithoutSection hfixed) := by
  intro q
  refine D.radicalQuotient_inductionOn
    (motive := fun q => ∀ r,
      D.quotientKummerCharacterWithoutSection hfixed q =
          D.quotientKummerCharacterWithoutSection hfixed r →
        q = r)
    q ?_
  intro a r
  refine D.radicalQuotient_inductionOn
    (motive := fun r =>
      D.quotientKummerCharacterWithoutSection hfixed
          (D.radicalQuotientMk a) =
          D.quotientKummerCharacterWithoutSection hfixed r →
        D.radicalQuotientMk a = r)
    r ?_
  intro b hab
  apply (D.radicalQuotientMk_eq_iff a b).2
  rw [← D.ker_kummerCharacterWithoutSection_eq_ambientNthPowers hfixed]
  have hab' : D.kummerCharacterWithoutSection hfixed a =
      D.kummerCharacterWithoutSection hfixed b := by
    simpa using hab
  rw [MonoidHom.mem_ker, map_div, hab']
  exact div_self' (D.kummerCharacterWithoutSection hfixed b)
end RadicalDatum
end RadicalQuotient
end KummerTheory
end

/- GaloisCohomology.Kummer.Concrete.FiniteCharacterEquiv -/
section
noncomputable section
namespace KummerTheory
section FiniteKummerCharacterIso
variable {K L : Type*} [Field K] [Field L] [Algebra K L]
 


def finiteKummerRadicalSubgroup (n : ℕ+) : Subgroup Kˣ where
  carrier := {a | ∃ β : Lˣ,
    β ^ (n : ℕ) = Units.map (algebraMap K L).toMonoidHom a}
  one_mem' := ⟨1, by simp⟩
  mul_mem' := by
    rintro a b ⟨α, hα⟩ ⟨β, hβ⟩
    refine ⟨α * β, ?_⟩
    rw [mul_pow, hα, hβ, map_mul]
  inv_mem' := by
    rintro a ⟨α, hα⟩
    refine ⟨α⁻¹, ?_⟩
    rw [inv_pow, hα, map_inv]
 

@[simp] theorem mem_finiteKummerRadicalSubgroup_iff
    (n : ℕ+) {a : Kˣ} :
    a ∈ finiteKummerRadicalSubgroup (K := K) (L := L) n ↔
      ∃ β : Lˣ, β ^ (n : ℕ) = Units.map (algebraMap K L).toMonoidHom a :=
  Iff.rfl
 

def chosenFiniteKummerRadicalDatum (n : ℕ+) : RadicalDatum (K := K) (L := L) n where
  carrier := finiteKummerRadicalSubgroup (K := K) (L := L) n
  root a := Classical.choose a.property
  root_pow_eq a := Classical.choose_spec a.property
 


def NthRootsOfUnityInBase (n : ℕ+) : Prop :=
  ∀ u : Lˣ, u ^ (n : ℕ) = 1 →
    ∃ zeta : Kˣ, Units.map (algebraMap K L).toMonoidHom zeta = u
 
theorem nthRootsOfUnity_fixed
    (n : ℕ+) (hmu : NthRootsOfUnityInBase (K := K) (L := L) n)
    (sigma : Gal(L/K)) (u : Lˣ) (hu : u ^ (n : ℕ) = 1) :
    sigma • u = u := by
  obtain ⟨zeta, rfl⟩ := hmu u hu
  exact RadicalDatum.smul_algebraMap_unit (K := K) (L := L) sigma zeta
 


theorem finiteKummerQuotientCharacter_surjective
    [FiniteDimensional K L] [IsGalois K L]
    (n : ℕ+) (hmu : NthRootsOfUnityInBase (K := K) (L := L) n) :
    Function.Surjective
      ((chosenFiniteKummerRadicalDatum (K := K) (L := L) n).quotientKummerCharacterWithoutSection
          (nthRootsOfUnity_fixed (K := K) (L := L) n hmu)) := by
  let D := chosenFiniteKummerRadicalDatum (K := K) (L := L) n
  let hfixed : ∀ sigma : Gal(L/K), ∀ u : Lˣ,
      u ^ (n : ℕ) = 1 → sigma • u = u :=
    nthRootsOfUnity_fixed (K := K) (L := L) n hmu
  intro chi
  let f : Gal(L/K) → Lˣ := fun sigma => (chi sigma).1
  have hf : groupCohomology.IsMulCocycle₁ f := by
    intro sigma tau
    change (chi (sigma * tau)).1 = sigma • (chi tau).1 * (chi sigma).1
    rw [map_mul, hfixed sigma (chi tau).1 (chi tau).2, mul_comm]
    rfl
  obtain ⟨beta, hbeta_div⟩ :=
    groupCohomology.isMulCoboundary₁_of_isMulCocycle₁_of_aut_to_units f hf
  have hbeta : ∀ sigma : Gal(L/K), sigma • beta = f sigma * beta := by
    intro sigma
    rw [← hbeta_div sigma]
    exact (div_mul_cancel (sigma • beta) beta).symm
  have hbeta_pow_fixed : ∀ sigma : Gal(L/K),
      sigma • (beta ^ (n : ℕ)) = beta ^ (n : ℕ) := by
    intro sigma
    calc
      sigma • (beta ^ (n : ℕ)) = (sigma • beta) ^ (n : ℕ) := by
        exact map_pow (MulDistribMulAction.toMonoidHom Lˣ sigma) beta (n : ℕ)
      _ = (f sigma * beta) ^ (n : ℕ) := by rw [hbeta sigma]
      _ = (f sigma) ^ (n : ℕ) * beta ^ (n : ℕ) := mul_pow _ _ _
      _ = beta ^ (n : ℕ) := by
        rw [show (f sigma) ^ (n : ℕ) = 1 from (chi sigma).2, one_mul]
  have hbeta_pow_range : ((beta ^ (n : ℕ) : Lˣ) : L) ∈
      Set.range (algebraMap K L) := by
    apply (IsGalois.mem_range_algebraMap_iff_fixed
      (((beta ^ (n : ℕ) : Lˣ) : L))).2
    intro sigma
    exact congrArg Units.val (hbeta_pow_fixed sigma)
  obtain ⟨a, ha⟩ := hbeta_pow_range
  have ha_ne : a ≠ 0 := by
    intro ha_zero
    have : (((beta ^ (n : ℕ) : Lˣ) : L)) = 0 := by
      simpa [ha_zero] using ha.symm
    exact (beta ^ (n : ℕ)).ne_zero this
  let aunit : Kˣ := Units.mk0 a ha_ne
  have hbeta_pow : beta ^ (n : ℕ) =
      Units.map (algebraMap K L).toMonoidHom aunit := by
    apply Units.ext
    exact ha.symm
  let delta : D.carrier := ⟨aunit, beta, hbeta_pow⟩
  refine ⟨D.radicalQuotientMk delta, ?_⟩
  rw [D.quotientKummerCharacterWithoutSection_mk]
  apply MonoidHom.ext
  intro sigma
  apply Subtype.ext
  change D.rootCharacter delta hfixed sigma = (chi sigma).1
  rw [← D.rootCharacter_eq_of_same_pow hfixed delta hbeta_pow sigma]
  simp [rootQuotient, hbeta sigma, f]
 


def finiteKummerCharacterEquiv
    [FiniteDimensional K L] [IsGalois K L]
    (n : ℕ+) (hmu : NthRootsOfUnityInBase (K := K) (L := L) n) :
    (chosenFiniteKummerRadicalDatum (K := K) (L := L) n).RadicalQuotient ≃*
      (Gal(L/K) →* nthRootsSubgroup L (n : ℕ)) :=
  MulEquiv.ofBijective
    ((chosenFiniteKummerRadicalDatum (K := K) (L := L) n).quotientKummerCharacterWithoutSection
        (nthRootsOfUnity_fixed (K := K) (L := L) n hmu))
    ⟨(chosenFiniteKummerRadicalDatum (K := K) (L := L) n).quotientKummerCharacterWithoutSection_injective
          (nthRootsOfUnity_fixed (K := K) (L := L) n hmu),
      finiteKummerQuotientCharacter_surjective (K := K) (L := L) n hmu⟩
end FiniteKummerCharacterIso
end KummerTheory
end
end

/- GaloisCohomology.Kummer.Concrete.FiniteGeneration -/
section
noncomputable section
namespace KummerTheory
open scoped IsMulCommutative
section FiniteKummerGeneration
variable {K L : Type*} [Field K] [Field L] [Algebra K L]
 
def finiteKummerRootSet (n : ℕ+) : Set L :=
  {beta | beta ≠ 0 ∧
    ∃ a : Kˣ, beta ^ (n : ℕ) = algebraMap K L (a : K)}
 

theorem nthRootsOfUnityInBase_of_primitiveRoots
    (n : ℕ+) (hmu : (primitiveRoots (n : ℕ) K).Nonempty) :
    NthRootsOfUnityInBase (K := K) (L := L) n := by
  let : NeZero (n : ℕ) := ⟨n.ne_zero⟩
  intro u hu
  let eta : rootsOfUnity (n : ℕ) L := ⟨u, hu⟩
  let e : rootsOfUnity (n : ℕ) K ≃* rootsOfUnity (n : ℕ) L :=
    rootsOfUnityEquivOfPrimitiveRoots (algebraMap K L).injective hmu
  refine ⟨(e.symm eta : rootsOfUnity (n : ℕ) K).1, ?_⟩
  apply Units.ext
  exact rootsOfUnityEquivOfPrimitiveRoots_symm_apply
    (algebraMap K L).injective hmu eta
 




theorem finiteKummerRootSet_adjoin_eq_top
    [FiniteDimensional K L] [IsGalois K L] [IsMulCommutative Gal(L/K)]
    (n : ℕ+) (hmu : (primitiveRoots (n : ℕ) K).Nonempty)
    (hexponent : ∀ sigma : Gal(L/K), sigma ^ (n : ℕ) = 1) :
    IntermediateField.adjoin K (finiteKummerRootSet (K := K) (L := L) n) = ⊤ := by
  let D := chosenFiniteKummerRadicalDatum (K := K) (L := L) n
  let hbase : NthRootsOfUnityInBase (K := K) (L := L) n :=
    nthRootsOfUnityInBase_of_primitiveRoots (K := K) (L := L) n hmu
  let hfixed : ∀ sigma : Gal(L/K), ∀ u : Lˣ,
      u ^ (n : ℕ) = 1 → sigma • u = u :=
    nthRootsOfUnity_fixed (K := K) (L := L) n hbase
  let E : IntermediateField K L :=
    IntermediateField.adjoin K (finiteKummerRootSet (K := K) (L := L) n)
  apply IsGalois.intermediateFieldEquivSubgroup.injective
  rw [map_top, eq_top_iff]
  intro sigma hsigma
  have hsigma_eq_one : sigma = 1 := by
    by_contra hsigma_ne
    let : NeZero (n : ℕ) := ⟨n.ne_zero⟩
    obtain ⟨zeta, hzeta⟩ := hmu
    have hzeta_primitive : IsPrimitiveRoot zeta (n : ℕ) :=
      (mem_primitiveRoots n.pos).1 hzeta
    let : HasEnoughRootsOfUnity K (n : ℕ) :=
      { prim := ⟨zeta, hzeta_primitive⟩
        cyc := rootsOfUnity.isCyclic K (n : ℕ) }
    have hexponent_dvd : Monoid.exponent Gal(L/K) ∣ (n : ℕ) :=
      Monoid.exponent_dvd_of_forall_pow_eq_one (fun tau => by
        simpa only using hexponent tau)
    let : HasEnoughRootsOfUnity K (Monoid.exponent Gal(L/K)) :=
      HasEnoughRootsOfUnity.of_dvd K hexponent_dvd
    obtain ⟨phi, hphi⟩ :=
      CommGroup.exists_apply_ne_one_of_hasEnoughRootsOfUnity Gal(L/K) K hsigma_ne
    let chi : Gal(L/K) →* nthRootsSubgroup L (n : ℕ) :=
      { toFun := fun tau =>
          ⟨Units.map (algebraMap K L).toMonoidHom (phi tau), by
            calc
              (Units.map (algebraMap K L).toMonoidHom (phi tau)) ^ (n : ℕ) =
                  Units.map (algebraMap K L).toMonoidHom ((phi tau) ^ (n : ℕ)) :=
                (map_pow (Units.map (algebraMap K L).toMonoidHom)
                  (phi tau) (n : ℕ)).symm
              _ = Units.map (algebraMap K L).toMonoidHom (phi (tau ^ (n : ℕ))) := by
                exact congrArg (Units.map (algebraMap K L).toMonoidHom)
                  (map_pow phi tau (n : ℕ)).symm
              _ = 1 := by rw [hexponent tau, map_one, map_one]⟩
        map_one' := by
          apply Subtype.ext
          simp
        map_mul' := by
          intro sigma tau
          apply Subtype.ext
          simp }
    have hchi_sigma : chi sigma ≠ 1 := by
      intro hchi
      have hmap : Units.map (algebraMap K L).toMonoidHom (phi sigma) = 1 := by
        simpa [chi] using congrArg Subtype.val hchi
      apply hphi
      apply (Units.map_injective (f := (algebraMap K L).toMonoidHom)
        (algebraMap K L).injective)
      simpa using hmap
    obtain ⟨q, hq⟩ :=
      finiteKummerQuotientCharacter_surjective (K := K) (L := L) n hbase chi
    obtain ⟨delta, rfl⟩ := D.radicalQuotientMk_surjective q
    have hroot_mem : (D.root delta : L) ∈
        finiteKummerRootSet (K := K) (L := L) n := by
      refine ⟨(D.root delta).ne_zero, delta.1, ?_⟩
      exact congrArg Units.val (D.root_pow_eq_map delta)
    have hroot_fixed_val : sigma (D.root delta : L) = D.root delta :=
      hsigma ⟨D.root delta,
        IntermediateField.subset_adjoin K
          (finiteKummerRootSet (K := K) (L := L) n) hroot_mem⟩
    have hroot_fixed : sigma • D.root delta = D.root delta := by
      apply Units.ext
      exact hroot_fixed_val
    have hkummer_sigma : D.kummerCharacterWithoutSection hfixed delta sigma = 1 := by
      apply Subtype.ext
      change D.rootCharacter delta hfixed sigma = 1
      rw [D.rootCharacter_apply]
      change rootQuotient (K := K) (L := L) (D.root delta) sigma = 1
      exact (rootQuotient_eq_one_iff (K := K) (L := L) (D.root delta) sigma).2
        hroot_fixed
    have hchi_eq : D.kummerCharacterWithoutSection hfixed delta = chi := by
      rw [← D.quotientKummerCharacterWithoutSection_mk delta hfixed]
      exact hq
    apply hchi_sigma
    rw [← hchi_eq]
    exact hkummer_sigma
  rw [hsigma_eq_one]
  exact one_mem _
end FiniteKummerGeneration
end KummerTheory
end
end

/- GaloisCohomology.Kummer.Concrete.InfiniteGeneration -/
section
noncomputable section
namespace KummerTheory
open scoped IsMulCommutative
variable {K Ω : Type*} [Field K] [Field Ω] [Algebra K Ω]
 




theorem kummerRootSet_adjoin_eq_top
    [IsGalois K Ω] [IsMulCommutative Gal(Ω/K)]
    (n : ℕ+) (hmu : (primitiveRoots (n : ℕ) K).Nonempty)
    (hexponent : ∀ σ : Gal(Ω/K), σ ^ (n : ℕ) = 1) :
    IntermediateField.adjoin K (finiteKummerRootSet (K := K) (L := Ω) n) = ⊤ := by
  let U : IntermediateField K Ω :=
    IntermediateField.adjoin K (finiteKummerRootSet (K := K) (L := Ω) n)
  apply top_unique
  intro x _
  let E : FiniteGaloisIntermediateField K Ω :=
    FiniteGaloisIntermediateField.adjoin K {x}
  let res : Gal(Ω/K) →* Gal(E/K) := AlgEquiv.restrictNormalHom E
  have hres_surjective : Function.Surjective res :=
    AlgEquiv.restrictNormalHom_surjective Ω
  let : IsMulCommutative Gal(E/K) :=
    { is_comm := ⟨fun σ τ => by
        obtain ⟨σ', rfl⟩ := hres_surjective σ
        obtain ⟨τ', rfl⟩ := hres_surjective τ
        rw [← map_mul, mul_comm σ' τ', map_mul]⟩ }
  have hE_exponent : ∀ σ : Gal(E/K), σ ^ (n : ℕ) = 1 := by
    intro σ
    obtain ⟨σ', rfl⟩ := hres_surjective σ
    rw [← map_pow, hexponent σ', map_one]
  have hE_generation :
      IntermediateField.adjoin K (finiteKummerRootSet (K := K) (L := E) n) = ⊤ :=
    finiteKummerRootSet_adjoin_eq_top
      (K := K) (L := E) n hmu hE_exponent
  have hroot_subset : finiteKummerRootSet (K := K) (L := E) n ⊆ U.comap E.val := by
    intro β hβ
    change (β : Ω) ∈ U
    apply IntermediateField.subset_adjoin K
      (finiteKummerRootSet (K := K) (L := Ω) n)
    refine ⟨?_, ?_⟩
    · exact (map_ne_zero E.val).2 hβ.1
    · obtain ⟨a, ha⟩ := hβ.2
      refine ⟨a, ?_⟩
      simpa using congrArg E.val ha
  have htop_le : (⊤ : IntermediateField K E) ≤ U.comap E.val := by
    rw [← hE_generation]
    exact IntermediateField.adjoin_le_iff.mpr hroot_subset
  let xE : E :=
    ⟨x, FiniteGaloisIntermediateField.subset_adjoin K {x} (Set.mem_singleton x)⟩
  have hxE : xE ∈ U.comap E.val := htop_le (Set.mem_univ xE)
  exact hxE
end KummerTheory
end
end

/- GaloisCohomology.Kummer.Concrete.RadicalExtension -/
section
noncomputable section
namespace KummerTheory
section RadicalExtension
open Polynomial
variable {K Omega : Type*} [Field K] [Field Omega] [Algebra K Omega]
 
def unitNthPowersSubgroup (K : Type*) [Field K] (n : ℕ+) : Subgroup Kˣ :=
  (powMonoidHom (n : ℕ) : Kˣ →* Kˣ).range
 
@[simp] theorem mem_unitNthPowersSubgroup_iff
    (n : ℕ+) {a : Kˣ} :
    a ∈ unitNthPowersSubgroup K n ↔ ∃ b : Kˣ, b ^ (n : ℕ) = a :=
  Iff.rfl
 

def KummerSubgroup (K : Type*) [Field K] (n : ℕ+) :=
  {Delta : Subgroup Kˣ // unitNthPowersSubgroup K n ≤ Delta}
 
def kummerRootSet (n : ℕ+) (Delta : Subgroup Kˣ) : Set Omega :=
  {beta | ∃ a : Delta,
    beta ^ (n : ℕ) = algebraMap K Omega (a.1 : K)}
 
def kummerRadicalExtension (n : ℕ+) (Delta : Subgroup Kˣ) :
    IntermediateField K Omega :=
  IntermediateField.adjoin K (kummerRootSet (K := K) (Omega := Omega) n Delta)
 

theorem exists_kummerRootSet
    [IsSepClosure K Omega]
    (n : ℕ+) (hn : ((n : ℕ) : K) ≠ 0) (Delta : Subgroup Kˣ) (a : Delta) :
    ∃ beta : Omega,
      beta ∈ kummerRootSet (K := K) (Omega := Omega) n Delta ∧
        beta ^ (n : ℕ) = algebraMap K Omega (a.1 : K) := by
  let aOmega : Omega := algebraMap K Omega (a.1 : K)
  have haOmega : aOmega ≠ 0 :=
    (_root_.map_ne_zero (algebraMap K Omega)).2 a.1.ne_zero
  have hnOmega : ((n : ℕ) : Omega) ≠ 0 := by
    rw [← map_natCast (algebraMap K Omega)]
    exact (_root_.map_ne_zero (algebraMap K Omega)).2 hn
  let : IsSepClosed Omega := IsSepClosure.sep_closed K
  obtain ⟨beta, hbeta⟩ := IsSepClosed.exists_root
    (X ^ (n : ℕ) - C aOmega)
    (by rw [degree_X_pow_sub_C n.pos]; exact_mod_cast n.ne_zero)
    (separable_X_pow_sub_C aOmega hnOmega haOmega)
  have hpow : beta ^ (n : ℕ) = aOmega := by
    apply sub_eq_zero.mp
    simpa [IsRoot.def, aOmega] using hbeta
  exact ⟨beta, ⟨a, hpow⟩, hpow⟩
 


theorem le_finiteKummerRadicalSubgroup_kummerRadicalExtension
    [IsSepClosure K Omega]
    (n : ℕ+) (hn : ((n : ℕ) : K) ≠ 0) (Delta : Subgroup Kˣ) :
    Delta ≤ finiteKummerRadicalSubgroup
      (K := K) (L := kummerRadicalExtension (K := K) (Omega := Omega) n Delta) n := by
  intro a ha
  let aDelta : Delta := ⟨a, ha⟩
  obtain ⟨beta, hbeta, hpow⟩ :=
    exists_kummerRootSet (K := K) (Omega := Omega) n hn Delta aDelta
  let E := kummerRadicalExtension (K := K) (Omega := Omega) n Delta
  letI : MulDistribMulAction Gal(E/K) Eˣ := AlgEquiv.instMulDistribMulActionUnits
  let betaE : E :=
    ⟨beta, IntermediateField.subset_adjoin K
      (kummerRootSet (K := K) (Omega := Omega) n Delta) hbeta⟩
  have hbetaE : betaE ≠ 0 := by
    intro hzero
    have hbeta_zero : beta = 0 := congrArg Subtype.val hzero
    have hmap_zero : algebraMap K Omega (a : K) = 0 := by
      rw [← hpow, hbeta_zero, zero_pow n.ne_zero]
    exact ((_root_.map_ne_zero (algebraMap K Omega)).2 a.ne_zero) hmap_zero
  refine ⟨Units.mk0 betaE hbetaE, ?_⟩
  apply Units.ext
  apply Subtype.ext
  exact hpow
 
theorem kummerRootSet_ne_zero
    (n : ℕ+) (Delta : Subgroup Kˣ) {beta : Omega}
    (hbeta : beta ∈ kummerRootSet (K := K) (Omega := Omega) n Delta) :
    beta ≠ 0 := by
  obtain ⟨a, ha⟩ := hbeta
  intro hzero
  have : algebraMap K Omega (a.1 : K) = 0 := by
    rw [← ha, hzero, zero_pow n.ne_zero]
  exact ((_root_.map_ne_zero (algebraMap K Omega)).2 a.1.ne_zero) this
 

theorem kummerRootSet_mapsTo
    (n : ℕ+) (Delta : Subgroup Kˣ) (sigma : Gal(Omega/K)) :
    Set.MapsTo sigma
      (kummerRootSet (K := K) (Omega := Omega) n Delta)
      (kummerRootSet (K := K) (Omega := Omega) n Delta) := by
  rintro beta ⟨a, hbeta⟩
  refine ⟨a, ?_⟩
  calc
    sigma beta ^ (n : ℕ) = sigma (beta ^ (n : ℕ)) :=
      (map_pow sigma beta (n : ℕ)).symm
    _ = sigma (algebraMap K Omega (a.1 : K)) := congrArg sigma hbeta
    _ = algebraMap K Omega (a.1 : K) := sigma.commutes (a.1 : K)
 

theorem kummerRootSet_image
    (n : ℕ+) (Delta : Subgroup Kˣ) (sigma : Gal(Omega/K)) :
    sigma '' kummerRootSet (K := K) (Omega := Omega) n Delta =
      kummerRootSet (K := K) (Omega := Omega) n Delta := by
  apply Set.Subset.antisymm
  · rintro _ ⟨beta, hbeta, rfl⟩
    exact kummerRootSet_mapsTo n Delta sigma hbeta
  · intro beta hbeta
    refine ⟨sigma.symm beta, kummerRootSet_mapsTo n Delta sigma.symm hbeta, ?_⟩
    exact sigma.apply_symm_apply beta
 

theorem kummerRadicalExtension_map
    (n : ℕ+) (Delta : Subgroup Kˣ) (sigma : Gal(Omega/K)) :
    (kummerRadicalExtension (K := K) (Omega := Omega) n Delta).map sigma =
      kummerRadicalExtension (K := K) (Omega := Omega) n Delta := by
  rw [kummerRadicalExtension, IntermediateField.adjoin_map]
  congr 1
  exact kummerRootSet_image n Delta sigma
 
theorem kummerRadicalExtension_normal
    [IsSepClosure K Omega]
    (n : ℕ+) (Delta : Subgroup Kˣ) :
    Normal K (kummerRadicalExtension (K := K) (Omega := Omega) n Delta) := by
  rw [IntermediateField.normal_iff_forall_map_eq']
  exact kummerRadicalExtension_map n Delta
 


theorem kummerRadicalExtension_isGalois
    [IsSepClosure K Omega]
    (n : ℕ+) (Delta : Subgroup Kˣ) :
    IsGalois K (kummerRadicalExtension (K := K) (Omega := Omega) n Delta) := by
  rw [isGalois_iff]
  exact ⟨inferInstance, kummerRadicalExtension_normal n Delta⟩
 


theorem kummerRadicalExtension_generator_commute
    [IsSepClosure K Omega]
    (n : ℕ+) (hmu : (primitiveRoots (n : ℕ) K).Nonempty)
    (Delta : Subgroup Kˣ)
    (sigma tau : Gal(kummerRadicalExtension (K := K) (Omega := Omega) n Delta/K))
    {beta : Omega}
    (hbeta : beta ∈ kummerRootSet (K := K) (Omega := Omega) n Delta) :
    (sigma * tau)
        ⟨beta, IntermediateField.subset_adjoin K
          (kummerRootSet (K := K) (Omega := Omega) n Delta) hbeta⟩ =
      (tau * sigma)
        ⟨beta, IntermediateField.subset_adjoin K
          (kummerRootSet (K := K) (Omega := Omega) n Delta) hbeta⟩ := by
  let E := kummerRadicalExtension (K := K) (Omega := Omega) n Delta
  letI : MulDistribMulAction Gal(E/K) Eˣ := AlgEquiv.instMulDistribMulActionUnits
  let betaE : E :=
    ⟨beta, IntermediateField.subset_adjoin K
      (kummerRootSet (K := K) (Omega := Omega) n Delta) hbeta⟩
  let betaUnit : Eˣ := Units.mk0 betaE (by
    intro hzero
    apply kummerRootSet_ne_zero n Delta hbeta
    exact congrArg Subtype.val hzero)
  obtain ⟨a, ha⟩ := hbeta
  have hpow : betaUnit ^ (n : ℕ) =
      Units.map (algebraMap K E).toMonoidHom a.1 := by
    apply Units.ext
    apply Subtype.ext
    exact ha
  have hpow_fixed : ∀ rho : Gal(E/K),
      Units.map rho.toMonoidHom (betaUnit ^ (n : ℕ)) = betaUnit ^ (n : ℕ) := by
    intro rho
    rw [hpow]
    exact RadicalDatum.smul_algebraMap_unit (K := K) (L := E) rho a.1
  let hbase : NthRootsOfUnityInBase (K := K) (L := E) n :=
    nthRootsOfUnityInBase_of_primitiveRoots (K := K) (L := E) n hmu
  have hquot_pow (rho : Gal(E/K)) :
      rootQuotient (K := K) (L := E) betaUnit rho ^ (n : ℕ) = 1 :=
    rootQuotient_pow_eq_one_of_pow_fixed (K := K) (L := E) hpow_fixed rho
  have hquot_fixed (rho eta : Gal(E/K)) :
      Units.map eta.toMonoidHom (rootQuotient (K := K) (L := E) betaUnit rho) =
        rootQuotient (K := K) (L := E) betaUnit rho :=
    nthRootsOfUnity_fixed (K := K) (L := E) n hbase eta _ (hquot_pow rho)
  have hquot_commute :
      rootQuotient (K := K) (L := E) betaUnit (sigma * tau) =
        rootQuotient (K := K) (L := E) betaUnit (tau * sigma) := by
    rw [rootQuotient_mul,rootQuotient_mul]
    exact (congrArg₂ (· * ·) (hquot_fixed tau sigma) rfl).trans
      ((mul_comm _ _).trans (congrArg₂ (· * ·) (hquot_fixed sigma tau).symm rfl))
  have hunit_commute := (rootQuotient_mul_right (K:=K) (L:=E) betaUnit (sigma*tau)).symm.trans
    ((congrArg (fun u:Eˣ=>u*betaUnit) hquot_commute).trans
      (rootQuotient_mul_right (K:=K) (L:=E) betaUnit (tau*sigma)))
  exact congrArg Units.val hunit_commute
 

theorem kummerRadicalExtension_isMulCommutative
    [IsSepClosure K Omega]
    (n : ℕ+) (hmu : (primitiveRoots (n : ℕ) K).Nonempty)
    (Delta : Subgroup Kˣ) :
    IsMulCommutative Gal(kummerRadicalExtension (K := K) (Omega := Omega) n Delta/K) := by
  refine ⟨⟨fun sigma tau => ?_⟩⟩
  apply AlgEquiv.coe_toAlgHom_injective
  apply IntermediateField.adjoin_algHom_ext K
  intro beta hbeta
  exact kummerRadicalExtension_generator_commute n hmu Delta sigma tau hbeta
 

theorem kummerRadicalExtension_generator_pow_eq_one
    [IsSepClosure K Omega]
    (n : ℕ+) (hmu : (primitiveRoots (n : ℕ) K).Nonempty)
    (Delta : Subgroup Kˣ)
    (sigma : Gal(kummerRadicalExtension (K := K) (Omega := Omega) n Delta/K))
    {beta : Omega}
    (hbeta : beta ∈ kummerRootSet (K := K) (Omega := Omega) n Delta) :
    (sigma ^ (n : ℕ))
        ⟨beta, IntermediateField.subset_adjoin K
          (kummerRootSet (K := K) (Omega := Omega) n Delta) hbeta⟩ =
      ⟨beta, IntermediateField.subset_adjoin K
        (kummerRootSet (K := K) (Omega := Omega) n Delta) hbeta⟩ := by
  let E := kummerRadicalExtension (K := K) (Omega := Omega) n Delta
  letI : MulDistribMulAction Gal(E/K) Eˣ := AlgEquiv.instMulDistribMulActionUnits
  let betaE : E :=
    ⟨beta, IntermediateField.subset_adjoin K
      (kummerRootSet (K := K) (Omega := Omega) n Delta) hbeta⟩
  let betaUnit : Eˣ := Units.mk0 betaE (by
    intro hzero
    apply kummerRootSet_ne_zero n Delta hbeta
    exact congrArg Subtype.val hzero)
  obtain ⟨a, ha⟩ := hbeta
  have hpow : betaUnit ^ (n : ℕ) =
      Units.map (algebraMap K E).toMonoidHom a.1 := by
    apply Units.ext
    apply Subtype.ext
    exact ha
  have hpow_fixed : ∀ rho : Gal(E/K),
      Units.map rho.toMonoidHom (betaUnit ^ (n : ℕ)) = betaUnit ^ (n : ℕ) := by
    intro rho
    rw [hpow]
    exact RadicalDatum.smul_algebraMap_unit (K := K) (L := E) rho a.1
  let hbase : NthRootsOfUnityInBase (K := K) (L := E) n :=
    nthRootsOfUnityInBase_of_primitiveRoots (K := K) (L := E) n hmu
  let q : Eˣ := rootQuotient (K := K) (L := E) betaUnit sigma
  have hq_pow : q ^ (n : ℕ) = 1 :=
    rootQuotient_pow_eq_one_of_pow_fixed (K := K) (L := E) hpow_fixed sigma
  have hq_fixed (rho : Gal(E/K)) : Units.map rho.toMonoidHom q = q :=
    nthRootsOfUnity_fixed (K := K) (L := E) n hbase rho q hq_pow
  have hquot_pow : ∀ m : ℕ,
      rootQuotient (K := K) (L := E) betaUnit (sigma ^ m) = q ^ m := by
    intro m
    induction m with
    | zero => simp [q]
    | succ m ih =>
        rw [pow_succ,rootQuotient_mul]
        exact (congrArg₂ (· * ·) (hq_fixed (sigma^m)) ih).trans (pow_succ' q m).symm
  have hquot_one :
      rootQuotient (K := K) (L := E) betaUnit (sigma ^ (n : ℕ)) = 1 := by
    rw [hquot_pow, hq_pow]
  have hunit_fixed :=
    (rootQuotient_eq_one_iff (K := K) (L := E) betaUnit
      (sigma ^ (n : ℕ))).1 hquot_one
  exact congrArg Units.val hunit_fixed
 
theorem kummerRadicalExtension_galois_pow_eq_one
    [IsSepClosure K Omega]
    (n : ℕ+) (hmu : (primitiveRoots (n : ℕ) K).Nonempty)
    (Delta : Subgroup Kˣ)
    (sigma : Gal(kummerRadicalExtension (K := K) (Omega := Omega) n Delta/K)) :
    sigma ^ (n : ℕ) = 1 := by
  apply AlgEquiv.coe_toAlgHom_injective
  apply IntermediateField.adjoin_algHom_ext K
  intro beta hbeta
  exact kummerRadicalExtension_generator_pow_eq_one n hmu Delta sigma hbeta
end RadicalExtension
end KummerTheory
end
end

/- GaloisCohomology.Kummer.Concrete.ExtensionRoundTrip -/
section
noncomputable section
namespace KummerTheory
variable {K Omega : Type*} [Field K] [Field Omega] [Algebra K Omega]
 


theorem kummerRootSet_finiteKummerRadicalSubgroup_le
    (E : IntermediateField K Omega) (n : ℕ+)
    (hmu : (primitiveRoots (n : ℕ) K).Nonempty) :
    kummerRootSet (K := K) (Omega := Omega) n
        (finiteKummerRadicalSubgroup (K := K) (L := E) n) ⊆ E := by
  intro beta hbeta
  have hbeta_ne : beta ≠ 0 :=
    kummerRootSet_ne_zero n
      (finiteKummerRadicalSubgroup (K := K) (L := E) n) hbeta
  obtain ⟨a, hbeta_pow⟩ := hbeta
  obtain ⟨gamma, hgamma_pow⟩ := a.property
  let gammaOmega : Omegaˣ := Units.map E.val.toMonoidHom gamma
  let betaUnit : Omegaˣ := Units.mk0 beta hbeta_ne
  have hbetaUnit_pow : betaUnit ^ (n : ℕ) =
      Units.map (algebraMap K Omega).toMonoidHom a.1 := by
    apply Units.ext
    exact hbeta_pow
  have hgammaOmega_pow : gammaOmega ^ (n : ℕ) =
      Units.map (algebraMap K Omega).toMonoidHom a.1 := by
    apply Units.ext
    exact congrArg E.val (congrArg Units.val hgamma_pow)
  have hratio_pow : (betaUnit / gammaOmega) ^ (n : ℕ) = 1 := by
    rw [div_pow, hbetaUnit_pow, hgammaOmega_pow]
    exact div_self' _
  let hbase : NthRootsOfUnityInBase (K := K) (L := Omega) n :=
    nthRootsOfUnityInBase_of_primitiveRoots
      (K := K) (L := Omega) n hmu
  obtain ⟨zeta, hzeta⟩ := hbase (betaUnit / gammaOmega) hratio_pow
  have hbeta_eq : betaUnit =
      Units.map (algebraMap K Omega).toMonoidHom zeta * gammaOmega := by
    rw [hzeta]
    exact (div_mul_cancel betaUnit gammaOmega).symm
  have hbeta_val := congrArg Units.val hbeta_eq
  change (betaUnit : Omega) ∈ E
  rw [hbeta_val]
  exact E.mul_mem (E.algebraMap_mem (zeta : K)) gamma.1.property
 

theorem kummerRadicalExtension_finiteKummerRadicalSubgroup_le
    (E : IntermediateField K Omega) (n : ℕ+)
    (hmu : (primitiveRoots (n : ℕ) K).Nonempty) :
    kummerRadicalExtension (K := K) (Omega := Omega) n
        (finiteKummerRadicalSubgroup (K := K) (L := E) n) ≤ E := by
  exact IntermediateField.adjoin_le_iff.mpr
    (kummerRootSet_finiteKummerRadicalSubgroup_le E n hmu)
 

theorem le_kummerRadicalExtension_finiteKummerRadicalSubgroup
    (E : IntermediateField K Omega)
    [IsGalois K E] [IsMulCommutative Gal(E/K)]
    (n : ℕ+) (hmu : (primitiveRoots (n : ℕ) K).Nonempty)
    (hexponent : ∀ sigma : Gal(E/K), sigma ^ (n : ℕ) = 1) :
    E ≤ kummerRadicalExtension (K := K) (Omega := Omega) n
      (finiteKummerRadicalSubgroup (K := K) (L := E) n) := by
  let R : IntermediateField K Omega :=
    kummerRadicalExtension (K := K) (Omega := Omega) n
      (finiteKummerRadicalSubgroup (K := K) (L := E) n)
  have hgeneration :
      IntermediateField.adjoin K
        (finiteKummerRootSet (K := K) (L := E) n) = ⊤ :=
    kummerRootSet_adjoin_eq_top
      (K := K) (Ω := E) n hmu hexponent
  have hroot_subset :
      finiteKummerRootSet (K := K) (L := E) n ⊆ R.comap E.val := by
    intro beta hbeta
    change (beta : Omega) ∈ R
    apply IntermediateField.subset_adjoin K
      (kummerRootSet (K := K) (Omega := Omega) n
        (finiteKummerRadicalSubgroup (K := K) (L := E) n))
    obtain ⟨hbeta_ne, a, hbeta_pow⟩ := hbeta
    let betaUnit : Eˣ := Units.mk0 beta hbeta_ne
    have ha : a ∈ finiteKummerRadicalSubgroup (K := K) (L := E) n := by
      refine ⟨betaUnit, ?_⟩
      apply Units.ext
      exact hbeta_pow
    refine ⟨⟨a, ha⟩, ?_⟩
    exact congrArg E.val hbeta_pow
  have htop_le : (⊤ : IntermediateField K E) ≤ R.comap E.val := by
    rw [← hgeneration]
    exact IntermediateField.adjoin_le_iff.mpr hroot_subset
  intro x hx
  let xE : E := ⟨x, hx⟩
  exact htop_le (Set.mem_univ xE)
 



theorem kummerRadicalExtension_finiteKummerRadicalSubgroup_eq
    (E : IntermediateField K Omega)
    [IsGalois K E] [IsMulCommutative Gal(E/K)]
    (n : ℕ+) (hmu : (primitiveRoots (n : ℕ) K).Nonempty)
    (hexponent : ∀ sigma : Gal(E/K), sigma ^ (n : ℕ) = 1) :
    kummerRadicalExtension (K := K) (Omega := Omega) n
        (finiteKummerRadicalSubgroup (K := K) (L := E) n) = E := by
  apply le_antisymm
  · exact kummerRadicalExtension_finiteKummerRadicalSubgroup_le E n hmu
  · exact le_kummerRadicalExtension_finiteKummerRadicalSubgroup
      E n hmu hexponent
end KummerTheory
end
end

/- GaloisCohomology.Kummer.Concrete.FiniteDualSeparation -/
section
noncomputable section
namespace KummerTheory
 

def characterToNthRoots
    {G K : Type*} [Group G] [Field K]
    (n : ℕ+) (hexponent : ∀ g : G, g ^ (n : ℕ) = 1)
    (φ : G →* Kˣ) : G →* nthRootsSubgroup K (n : ℕ) where
  toFun g :=
    ⟨φ g, by
      calc
        φ g ^ (n : ℕ) = φ (g ^ (n : ℕ)) := (map_pow φ g (n : ℕ)).symm
        _ = 1 := by rw [hexponent g, map_one]⟩
  map_one' := by
    apply Subtype.ext
    exact map_one φ
  map_mul' := by
    intro g h
    apply Subtype.ext
    exact map_mul φ g h
 

theorem exists_nthRoots_character_apply_ne_one
    {G K : Type*} [CommGroup G] [Finite G] [Field K]
    (n : ℕ+) (hmu : (primitiveRoots (n : ℕ) K).Nonempty)
    (hexponent : ∀ g : G, g ^ (n : ℕ) = 1)
    {g : G} (hg : g ≠ 1) :
    ∃ χ : G →* nthRootsSubgroup K (n : ℕ), χ g ≠ 1 := by
  let : NeZero (n : ℕ) := ⟨n.ne_zero⟩
  obtain ⟨zeta, hzeta⟩ := hmu
  have hzeta_primitive : IsPrimitiveRoot zeta (n : ℕ) :=
    (mem_primitiveRoots n.pos).1 hzeta
  let : HasEnoughRootsOfUnity K (n : ℕ) :=
    { prim := ⟨zeta, hzeta_primitive⟩
      cyc := rootsOfUnity.isCyclic K (n : ℕ) }
  have hexponent_dvd : Monoid.exponent G ∣ (n : ℕ) :=
    Monoid.exponent_dvd_of_forall_pow_eq_one (fun q => by
      simpa only using hexponent q)
  let : HasEnoughRootsOfUnity K (Monoid.exponent G) :=
    HasEnoughRootsOfUnity.of_dvd K hexponent_dvd
  obtain ⟨φ, hφ⟩ :=
    CommGroup.exists_apply_ne_one_of_hasEnoughRootsOfUnity G K hg
  refine ⟨characterToNthRoots n hexponent φ, ?_⟩
  intro h
  apply hφ
  exact congrArg Subtype.val h
 
def nthRootsSubgroupMap
    (K L : Type*) [Field K] [Field L] [Algebra K L] (n : ℕ) :
    nthRootsSubgroup K n →* nthRootsSubgroup L n where
  toFun z :=
    ⟨Units.map (algebraMap K L).toMonoidHom z.1, by
      calc
        Units.map (algebraMap K L).toMonoidHom z.1 ^ n =
            Units.map (algebraMap K L).toMonoidHom (z.1 ^ n) :=
          (map_pow (Units.map (algebraMap K L).toMonoidHom) z.1 n).symm
        _ = 1 := by rw [z.2, map_one]⟩
  map_one' := by
    apply Subtype.ext
    exact map_one (Units.map (algebraMap K L).toMonoidHom)
  map_mul' := by
    intro z w
    apply Subtype.ext
    exact map_mul (Units.map (algebraMap K L).toMonoidHom) z.1 w.1
 
theorem nthRootsSubgroupMap_injective
    (K L : Type*) [Field K] [Field L] [Algebra K L] (n : ℕ) :
    Function.Injective (nthRootsSubgroupMap K L n) := by
  intro z w h
  apply Subtype.ext
  apply (Units.map_injective (f := (algebraMap K L).toMonoidHom)
    (algebraMap K L).injective)
  exact congrArg Subtype.val h
 

def nthRootsSubgroupEquivRootsOfUnity
    (K : Type*) [Field K] (n : ℕ) :
    nthRootsSubgroup K n ≃* rootsOfUnity n K where
  toFun z := ⟨z.1, z.2⟩
  invFun z := ⟨z.1, z.2⟩
  left_inv _ := rfl
  right_inv _ := rfl
  map_mul' _ _ := rfl
 
noncomputable instance nthRootsSubgroupFintype
    (K : Type*) [Field K] (n : ℕ) [NeZero n] : Fintype (nthRootsSubgroup K n) :=
  letI : Fintype (rootsOfUnity n K) := Fintype.ofFinite _
  Fintype.ofEquiv (rootsOfUnity n K)
    (nthRootsSubgroupEquivRootsOfUnity K n).symm.toEquiv
 

def nthRootsSubgroupEquivOfPrimitiveRoots
    (K L : Type*) [Field K] [Field L] [Algebra K L]
    (n : ℕ+) (hmu : (primitiveRoots (n : ℕ) K).Nonempty) :
    nthRootsSubgroup K (n : ℕ) ≃* nthRootsSubgroup L (n : ℕ) :=
  MulEquiv.ofBijective (nthRootsSubgroupMap K L (n : ℕ))
    ⟨nthRootsSubgroupMap_injective K L (n : ℕ), by
      intro u
      obtain ⟨zeta, hzeta⟩ :=
        nthRootsOfUnityInBase_of_primitiveRoots
          (K := K) (L := L) n hmu u.1 u.2
      have hzeta_pow : zeta ^ (n : ℕ) = 1 := by
        apply (Units.map_injective (f := (algebraMap K L).toMonoidHom)
          (algebraMap K L).injective)
        calc
          Units.map (algebraMap K L).toMonoidHom (zeta ^ (n : ℕ)) =
              (Units.map (algebraMap K L).toMonoidHom zeta) ^ (n : ℕ) :=
            map_pow (Units.map (algebraMap K L).toMonoidHom) zeta (n : ℕ)
          _ = u.1 ^ (n : ℕ) := by rw [hzeta]
          _ = 1 := u.2
          _ = Units.map (algebraMap K L).toMonoidHom 1 :=
            (map_one (Units.map (algebraMap K L).toMonoidHom)).symm
      exact ⟨⟨zeta, hzeta_pow⟩, Subtype.ext hzeta⟩⟩
 

def unitCharactersEquivNthRoots
    {G K : Type*} [CommGroup G] [Field K]
    (n : ℕ+) (hexponent : ∀ g : G, g ^ (n : ℕ) = 1) :
    (G →* Kˣ) ≃* (G →* nthRootsSubgroup K (n : ℕ)) where
  toFun := characterToNthRoots n hexponent
  invFun χ := (nthRootsSubgroup K (n : ℕ)).subtype.comp χ
  left_inv φ := by
    apply MonoidHom.ext
    intro g
    rfl
  right_inv χ := by
    apply MonoidHom.ext
    intro g
    apply Subtype.ext
    rfl
  map_mul' φ ψ := by
    apply MonoidHom.ext
    intro g
    apply Subtype.ext
    rfl
 

theorem finiteNthRootsCharacterDuality
    {G K L : Type*} [CommGroup G] [Finite G]
    [Field K] [Field L] [Algebra K L]
    (n : ℕ+) (hmu : (primitiveRoots (n : ℕ) K).Nonempty)
    (hexponent : ∀ g : G, g ^ (n : ℕ) = 1) :
    Nonempty ((G →* nthRootsSubgroup L (n : ℕ)) ≃* G) := by
  let rootsEquiv := nthRootsSubgroupEquivOfPrimitiveRoots K L n hmu
  let : NeZero (n : ℕ) := ⟨n.ne_zero⟩
  obtain ⟨zeta, hzeta⟩ := hmu
  have hzeta_primitive : IsPrimitiveRoot zeta (n : ℕ) :=
    (mem_primitiveRoots n.pos).1 hzeta
  let : HasEnoughRootsOfUnity K (n : ℕ) :=
    { prim := ⟨zeta, hzeta_primitive⟩
      cyc := rootsOfUnity.isCyclic K (n : ℕ) }
  have hexponent_dvd : Monoid.exponent G ∣ (n : ℕ) :=
    Monoid.exponent_dvd_of_forall_pow_eq_one (fun g => by
      simpa only using hexponent g)
  let : HasEnoughRootsOfUnity K (Monoid.exponent G) :=
    HasEnoughRootsOfUnity.of_dvd K hexponent_dvd
  obtain ⟨dual⟩ := CommGroup.monoidHom_mulEquiv_of_hasEnoughRootsOfUnity G K
  exact ⟨(rootsEquiv.monoidHomCongrRight (M := G)).symm |>.trans
    (unitCharactersEquivNthRoots n hexponent).symm |>.trans dual⟩
 

theorem exists_nthRoots_character_apply_ne_one_in_extension
    {G K L : Type*} [CommGroup G] [Finite G]
    [Field K] [Field L] [Algebra K L]
    (n : ℕ+) (hmu : (primitiveRoots (n : ℕ) K).Nonempty)
    (hexponent : ∀ g : G, g ^ (n : ℕ) = 1)
    {g : G} (hg : g ≠ 1) :
    ∃ χ : G →* nthRootsSubgroup L (n : ℕ), χ g ≠ 1 := by
  obtain ⟨χ, hχ⟩ :=
    exists_nthRoots_character_apply_ne_one n hmu hexponent hg
  refine ⟨(nthRootsSubgroupMap K L (n : ℕ)).comp χ, ?_⟩
  intro h
  apply hχ
  apply nthRootsSubgroupMap_injective K L (n : ℕ)
  simpa using h
 
def transposeCharacterEquiv
    {G R M : Type*} [CommGroup G] [CommGroup R] [CommGroup M]
    (e : R ≃* (G →* M)) : G →* (R →* M) where
  toFun g :=
    { toFun := fun r => e r g
      map_one' := by simp
      map_mul' := by
        intro r s
        exact congrArg (fun χ : G →* M => χ g) (map_mul e r s) }
  map_one' := by
    apply MonoidHom.ext
    intro r
    exact map_one (e r)
  map_mul' := by
    intro g h
    apply MonoidHom.ext
    intro r
    exact map_mul (e r) g h
 


theorem transposeCharacterEquiv_injective
    {G R K L : Type*} [CommGroup G] [Finite G] [CommGroup R]
    [Field K] [Field L] [Algebra K L]
    (n : ℕ+) (hmu : (primitiveRoots (n : ℕ) K).Nonempty)
    (hexponent : ∀ g : G, g ^ (n : ℕ) = 1)
    (e : R ≃* (G →* nthRootsSubgroup L (n : ℕ))) :
    Function.Injective (transposeCharacterEquiv e) := by
  intro g h hgh
  apply div_eq_one.mp
  by_contra hdiv
  obtain ⟨χ, hχ⟩ :=
    exists_nthRoots_character_apply_ne_one_in_extension
      (G := G) (K := K) (L := L) n hmu hexponent hdiv
  obtain ⟨r, hr⟩ := e.surjective χ
  have hquotient : transposeCharacterEquiv e (g / h) = 1 := by
    rw [map_div, hgh]
    exact div_self' (transposeCharacterEquiv e h)
  have hvalue := congrArg
    (fun ψ : R →* nthRootsSubgroup L (n : ℕ) => ψ r) hquotient
  change e r (g / h) = 1 at hvalue
  apply hχ
  simpa only [hr] using hvalue
 


theorem transposeCharacterEquiv_surjective
    {G R K L : Type*} [CommGroup G] [Finite G] [CommGroup R]
    [Field K] [Field L] [Algebra K L]
    (n : ℕ+) (hmu : (primitiveRoots (n : ℕ) K).Nonempty)
    (hexponent : ∀ g : G, g ^ (n : ℕ) = 1)
    (e : R ≃* (G →* nthRootsSubgroup L (n : ℕ))) :
    Function.Surjective (transposeCharacterEquiv e) := by
  let : NeZero (n : ℕ) := ⟨n.ne_zero⟩
  let : Finite (G →* nthRootsSubgroup L (n : ℕ)) :=
    Finite.of_injective
      (fun χ : G →* nthRootsSubgroup L (n : ℕ) =>
        (χ : G → nthRootsSubgroup L (n : ℕ))) DFunLike.coe_injective
  let : Finite R := Finite.of_equiv
    (G →* nthRootsSubgroup L (n : ℕ)) e.symm.toEquiv
  have hRexponent : ∀ r : R, r ^ (n : ℕ) = 1 := by
    intro r
    apply e.injective
    rw [map_pow, map_one]
    apply MonoidHom.ext
    intro g
    apply Subtype.ext
    exact (e r g).2
  obtain ⟨dualR⟩ := finiteNthRootsCharacterDuality
    (G := R) (K := K) (L := L) n hmu hRexponent
  obtain ⟨dualG⟩ := finiteNthRootsCharacterDuality
    (G := G) (K := K) (L := L) n hmu hexponent
  let targetEquivG : (R →* nthRootsSubgroup L (n : ℕ)) ≃ G :=
    dualR.toEquiv.trans (e.toEquiv.trans dualG.toEquiv)
  exact (transposeCharacterEquiv_injective n hmu hexponent e).surjective_of_finite
    targetEquivG.symm
 


def transposeCharacterMulEquiv
    {G R K L : Type*} [CommGroup G] [Finite G] [CommGroup R]
    [Field K] [Field L] [Algebra K L]
    (n : ℕ+) (hmu : (primitiveRoots (n : ℕ) K).Nonempty)
    (hexponent : ∀ g : G, g ^ (n : ℕ) = 1)
    (e : R ≃* (G →* nthRootsSubgroup L (n : ℕ))) :
    G ≃* (R →* nthRootsSubgroup L (n : ℕ)) :=
  MulEquiv.ofBijective (transposeCharacterEquiv e)
    ⟨transposeCharacterEquiv_injective n hmu hexponent e,
      transposeCharacterEquiv_surjective n hmu hexponent e⟩
end KummerTheory
end
end

/- GaloisCohomology.Kummer.Concrete.RestrictedFinite -/
section
noncomputable section
namespace KummerTheory
section RestrictedFiniteKummer
variable {K L : Type*} [Field K] [Field L] [Algebra K L]
 
def restrictedNthPowersSubgroup
    (n : ℕ+) (Delta : KummerSubgroup K n) : Subgroup Delta.1 :=
  (unitNthPowersSubgroup K n).comap Delta.1.subtype
 

@[simp] theorem mem_restrictedNthPowersSubgroup_iff
    (n : ℕ+) (Delta : KummerSubgroup K n) {a : Delta.1} :
    a ∈ restrictedNthPowersSubgroup n Delta ↔
      ∃ b : Kˣ, b ^ (n : ℕ) = a.1 :=
  Iff.rfl
 
def RestrictedRadicalQuotient
    (n : ℕ+) (Delta : KummerSubgroup K n) :=
  Delta.1 ⧸ restrictedNthPowersSubgroup n Delta
 

instance restrictedRadicalQuotient_commGroupInstance
    (n : ℕ+) (Delta : KummerSubgroup K n) :
    CommGroup (RestrictedRadicalQuotient n Delta) := by
  change CommGroup (Delta.1 ⧸ restrictedNthPowersSubgroup n Delta)
  infer_instance
 

def restrictedRadicalQuotientMulEquiv
    (n : ℕ+) (Delta : KummerSubgroup K n) :
    RestrictedRadicalQuotient n Delta ≃*
      (Delta.1 ⧸ restrictedNthPowersSubgroup n Delta) :=
  MulEquiv.refl _
 
def restrictedRadicalQuotientMk
    (n : ℕ+) (Delta : KummerSubgroup K n) :
    Delta.1 →* RestrictedRadicalQuotient n Delta :=
  QuotientGroup.mk' (restrictedNthPowersSubgroup n Delta)
 

@[simp]
theorem restrictedRadicalQuotientMk_eq_one_iff
    (n : ℕ+) (Delta : KummerSubgroup K n) (a : Delta.1) :
    restrictedRadicalQuotientMk n Delta a = 1 ↔
      a ∈ restrictedNthPowersSubgroup n Delta := by
  change
    (QuotientGroup.mk' (restrictedNthPowersSubgroup n Delta)) a = 1 ↔ _
  exact QuotientGroup.eq_one_iff a
 
@[simp]
theorem restrictedRadicalQuotientMk_eq_iff
    (n : ℕ+) (Delta : KummerSubgroup K n) (a b : Delta.1) :
    restrictedRadicalQuotientMk n Delta a =
        restrictedRadicalQuotientMk n Delta b ↔
      a / b ∈ restrictedNthPowersSubgroup n Delta := by
  change
    (QuotientGroup.mk' (restrictedNthPowersSubgroup n Delta)) a =
        (QuotientGroup.mk' (restrictedNthPowersSubgroup n Delta)) b ↔ _
  exact QuotientGroup.eq_iff_div_mem
 
theorem restrictedRadicalQuotientMk_surjective
    (n : ℕ+) (Delta : KummerSubgroup K n) :
    Function.Surjective (restrictedRadicalQuotientMk n Delta) := by
  change Function.Surjective
    (QuotientGroup.mk' (restrictedNthPowersSubgroup n Delta))
  exact QuotientGroup.mk'_surjective _
 

theorem restrictedRadicalQuotient_inductionOn
    (n : ℕ+) (Delta : KummerSubgroup K n)
    {motive : RestrictedRadicalQuotient n Delta → Prop}
    (q : RestrictedRadicalQuotient n Delta)
    (mk : ∀ a : Delta.1,
      motive (restrictedRadicalQuotientMk n Delta a)) :
    motive q := by
  exact QuotientGroup.induction_on' q mk
 
def restrictedRadicalQuotientLift {M : Type*} [Group M]
    (n : ℕ+) (Delta : KummerSubgroup K n) (f : Delta.1 →* M)
    (hf : restrictedNthPowersSubgroup n Delta ≤ MonoidHom.ker f) :
    RestrictedRadicalQuotient n Delta →* M :=
  (QuotientGroup.lift (restrictedNthPowersSubgroup n Delta) f hf).comp
    (restrictedRadicalQuotientMulEquiv n Delta).toMonoidHom
 

theorem restrictedKummerFixed
    (n : ℕ+) (hmu : (primitiveRoots (n : ℕ) K).Nonempty) :
    ∀ sigma : Gal(L/K), ∀ u : Lˣ,
      u ^ (n : ℕ) = 1 → sigma • u = u :=
  nthRootsOfUnity_fixed (K := K) (L := L) n
    (nthRootsOfUnityInBase_of_primitiveRoots (K := K) (L := L) n hmu)
 

def restrictedRadicalInclusion
    (n : ℕ+) (Delta : KummerSubgroup K n)
    (hDelta : Delta.1 ≤ finiteKummerRadicalSubgroup (K := K) (L := L) n) :
    Delta.1 →* (chosenFiniteKummerRadicalDatum (K := K) (L := L) n).carrier :=
  Subgroup.inclusion hDelta
 

def restrictedSubgroupKummerCharacter
    (n : ℕ+) (hmu : (primitiveRoots (n : ℕ) K).Nonempty)
    (Delta : KummerSubgroup K n)
    (hDelta : Delta.1 ≤ finiteKummerRadicalSubgroup (K := K) (L := L) n) :
    Delta.1 →* (Gal(L/K) →* nthRootsSubgroup L (n : ℕ)) :=
  ((chosenFiniteKummerRadicalDatum (K := K) (L := L) n).kummerCharacterWithoutSection
    (restrictedKummerFixed n hmu)).comp
      (restrictedRadicalInclusion n Delta hDelta)
 


theorem ker_restrictedSubgroupKummerCharacter
    [IsGalois K L]
    (n : ℕ+) (hmu : (primitiveRoots (n : ℕ) K).Nonempty)
    (Delta : KummerSubgroup K n)
    (hDelta : Delta.1 ≤ finiteKummerRadicalSubgroup (K := K) (L := L) n) :
    MonoidHom.ker (restrictedSubgroupKummerCharacter n hmu Delta hDelta) =
      restrictedNthPowersSubgroup n Delta := by
  let D := chosenFiniteKummerRadicalDatum (K := K) (L := L) n
  let hfixed := restrictedKummerFixed (K := K) (L := L) n hmu
  apply le_antisymm
  · intro a ha
    have hinc : restrictedRadicalInclusion n Delta hDelta a ∈
        MonoidHom.ker (D.kummerCharacterWithoutSection hfixed) := by
      simpa [restrictedSubgroupKummerCharacter, D, hfixed] using ha
    have hpowers : restrictedRadicalInclusion n Delta hDelta a ∈
        D.ambientNthPowersSubgroup := by
      rw [← D.ker_kummerCharacterWithoutSection_eq_ambientNthPowers hfixed]
      exact hinc
    exact (mem_restrictedNthPowersSubgroup_iff n Delta).2
      ((D.mem_ambientNthPowersSubgroup_iff).1 hpowers)
  · intro a ha
    have hpowers : restrictedRadicalInclusion n Delta hDelta a ∈
        D.ambientNthPowersSubgroup :=
      (D.mem_ambientNthPowersSubgroup_iff).2
        ((mem_restrictedNthPowersSubgroup_iff n Delta).1 ha)
    have hker : restrictedRadicalInclusion n Delta hDelta a ∈
        MonoidHom.ker (D.kummerCharacterWithoutSection hfixed) := by
      rw [D.ker_kummerCharacterWithoutSection_eq_ambientNthPowers hfixed]
      exact hpowers
    simpa [restrictedSubgroupKummerCharacter, D, hfixed] using hker
 
def restrictedQuotientKummerCharacter
    [IsGalois K L]
    (n : ℕ+) (hmu : (primitiveRoots (n : ℕ) K).Nonempty)
    (Delta : KummerSubgroup K n)
    (hDelta : Delta.1 ≤ finiteKummerRadicalSubgroup (K := K) (L := L) n) :
    RestrictedRadicalQuotient n Delta →*
      (Gal(L/K) →* nthRootsSubgroup L (n : ℕ)) :=
  restrictedRadicalQuotientLift n Delta
    (restrictedSubgroupKummerCharacter n hmu Delta hDelta)
    (by rw [ker_restrictedSubgroupKummerCharacter n hmu Delta hDelta])
 

theorem restrictedQuotientKummerCharacter_injective
    [IsGalois K L]
    (n : ℕ+) (hmu : (primitiveRoots (n : ℕ) K).Nonempty)
    (Delta : KummerSubgroup K n)
    (hDelta : Delta.1 ≤ finiteKummerRadicalSubgroup (K := K) (L := L) n) :
    Function.Injective (restrictedQuotientKummerCharacter n hmu Delta hDelta) := by
  intro q r hqr
  revert hqr
  refine restrictedRadicalQuotient_inductionOn
    (motive := fun q =>
      restrictedQuotientKummerCharacter n hmu Delta hDelta q =
          restrictedQuotientKummerCharacter n hmu Delta hDelta r →
        q = r)
    n Delta q ?_
  intro a
  refine restrictedRadicalQuotient_inductionOn
    (motive := fun r =>
      restrictedQuotientKummerCharacter n hmu Delta hDelta
          (restrictedRadicalQuotientMk n Delta a) =
          restrictedQuotientKummerCharacter n hmu Delta hDelta r →
        restrictedRadicalQuotientMk n Delta a = r)
    n Delta r ?_
  intro b hab
  apply (restrictedRadicalQuotientMk_eq_iff n Delta a b).2
  rw [← ker_restrictedSubgroupKummerCharacter n hmu Delta hDelta]
  have hab' :
      restrictedSubgroupKummerCharacter n hmu Delta hDelta a =
        restrictedSubgroupKummerCharacter n hmu Delta hDelta b := by
    exact hab
  rw [MonoidHom.mem_ker, map_div, hab']
  exact div_self' (restrictedSubgroupKummerCharacter n hmu Delta hDelta b)
 
def restrictedKummerTranspose
    [IsGalois K L]
    (n : ℕ+) (hmu : (primitiveRoots (n : ℕ) K).Nonempty)
    (Delta : KummerSubgroup K n)
    (hDelta : Delta.1 ≤ finiteKummerRadicalSubgroup (K := K) (L := L) n) :
    Gal(L/K) →*
      (RestrictedRadicalQuotient n Delta →* nthRootsSubgroup L (n : ℕ)) where
  toFun sigma :=
    { toFun := fun q => restrictedQuotientKummerCharacter n hmu Delta hDelta q sigma
      map_one' := by simp
      map_mul' := by
        intro q r
        exact congrArg (fun chi : Gal(L/K) →* nthRootsSubgroup L (n : ℕ) => chi sigma)
          (map_mul (restrictedQuotientKummerCharacter n hmu Delta hDelta) q r) }
  map_one' := by
    apply MonoidHom.ext
    intro q
    exact map_one (restrictedQuotientKummerCharacter n hmu Delta hDelta q)
  map_mul' := by
    intro sigma tau
    apply MonoidHom.ext
    intro q
    exact map_mul (restrictedQuotientKummerCharacter n hmu Delta hDelta q) sigma tau
 


theorem restrictedKummerTranspose_fixes_root
    [IsGalois K L]
    (n : ℕ+) (hmu : (primitiveRoots (n : ℕ) K).Nonempty)
    (Delta : KummerSubgroup K n)
    (hDelta : Delta.1 ≤ finiteKummerRadicalSubgroup (K := K) (L := L) n)
    (sigma : Gal(L/K))
    (hsigma : restrictedKummerTranspose n hmu Delta hDelta sigma = 1)
    {beta : L}
    (hbeta : beta ∈ kummerRootSet (K := K) (Omega := L) n Delta.1) :
    sigma beta = beta := by
  let D := chosenFiniteKummerRadicalDatum (K := K) (L := L) n
  let hfixed := restrictedKummerFixed (K := K) (L := L) n hmu
  have hbetaNe : beta ≠ 0 := kummerRootSet_ne_zero n Delta.1 hbeta
  obtain ⟨a, ha⟩ := hbeta
  let aD : D.carrier := restrictedRadicalInclusion n Delta hDelta a
  let betaUnit : Lˣ := Units.mk0 beta hbetaNe
  have hbetaPow : betaUnit ^ (n : ℕ) =
      Units.map (algebraMap K L).toMonoidHom aD.1 := by
    apply Units.ext
    exact ha
  let q : RestrictedRadicalQuotient n Delta :=
    restrictedRadicalQuotientMk n Delta a
  have hvalue : restrictedQuotientKummerCharacter n hmu Delta hDelta q sigma = 1 := by
    have happ := congrArg
      (fun chi : RestrictedRadicalQuotient n Delta →* nthRootsSubgroup L (n : ℕ) =>
        chi q) hsigma
    exact happ
  have hraw : restrictedSubgroupKummerCharacter n hmu Delta hDelta a sigma = 1 := by
    exact hvalue
  have hchosen : D.rootCharacterToMuWithoutSection aD hfixed sigma = 1 := by
    change D.rootCharacterToMuWithoutSection aD hfixed sigma = 1 at hraw
    exact hraw
  have hchosenVal : D.rootCocycle aD sigma = 1 := by
    have hval := congrArg Subtype.val hchosen
    simpa [RadicalDatum.rootCharacterToMuWithoutSection_apply,
      RadicalDatum.rootCharacter_apply] using hval
  have hquotient : rootQuotient (K := K) (L := L) betaUnit sigma = 1 := by
    rw [D.rootQuotient_eq_rootCocycle_of_same_pow hfixed aD hbetaPow sigma]
    exact hchosenVal
  have hunit : sigma • betaUnit = betaUnit :=
    (rootQuotient_eq_one_iff (K := K) (L := L) betaUnit sigma).1 hquotient
  exact congrArg Units.val hunit
 

theorem restrictedKummerTranspose_injective_of_adjoin
    [IsGalois K L]
    (n : ℕ+) (hmu : (primitiveRoots (n : ℕ) K).Nonempty)
    (Delta : KummerSubgroup K n)
    (hDelta : Delta.1 ≤ finiteKummerRadicalSubgroup (K := K) (L := L) n)
    (hgenerate : IntermediateField.adjoin K
      (kummerRootSet (K := K) (Omega := L) n Delta.1) = ⊤) :
    Function.Injective (restrictedKummerTranspose n hmu Delta hDelta) := by
  intro sigma tau hsigmaTau
  apply div_eq_one.mp
  let rho : Gal(L/K) := sigma / tau
  have hrhoTranspose : restrictedKummerTranspose n hmu Delta hDelta rho = 1 := by
    rw [show rho = sigma / tau from rfl, map_div, hsigmaTau]
    exact div_self' (restrictedKummerTranspose n hmu Delta hDelta tau)
  have hrho : rho = 1 := by
    apply AlgEquiv.ext
    intro x
    change rho x = x
    have hx : x ∈ IntermediateField.adjoin K
        (kummerRootSet (K := K) (Omega := L) n Delta.1) := by
      rw [hgenerate]
      exact IntermediateField.mem_top
    induction hx using IntermediateField.adjoin_induction with
    | mem x hx =>
        exact restrictedKummerTranspose_fixes_root n hmu Delta hDelta rho
          hrhoTranspose hx
    | algebraMap x =>
        exact rho.commutes x
    | add x y hx hy ihx ihy =>
        rw [map_add, ihx, ihy]
    | inv x hx ihx =>
        rw [map_inv₀, ihx]
    | mul x y hx hy ihx ihy =>
        rw [map_mul, ihx, ihy]
  exact hrho
 
theorem restrictedRadicalQuotient_pow_eq_one
    (n : ℕ+) (Delta : KummerSubgroup K n)
    (q : RestrictedRadicalQuotient n Delta) :
    q ^ (n : ℕ) = 1 := by
  refine restrictedRadicalQuotient_inductionOn
    (motive := fun q => q ^ (n : ℕ) = 1) n Delta q ?_
  intro a
  rw [← map_pow]
  exact (restrictedRadicalQuotientMk_eq_one_iff
    n Delta (a ^ (n : ℕ))).2
      ((mem_restrictedNthPowersSubgroup_iff n Delta).2 ⟨a.1, rfl⟩)
 


theorem restrictedQuotientKummerCharacter_surjective_of_adjoin
    [FiniteDimensional K L] [IsGalois K L]
    (n : ℕ+) (hmu : (primitiveRoots (n : ℕ) K).Nonempty)
    (Delta : KummerSubgroup K n)
    (hDelta : Delta.1 ≤ finiteKummerRadicalSubgroup (K := K) (L := L) n)
    (hgenerate : IntermediateField.adjoin K
      (kummerRootSet (K := K) (Omega := L) n Delta.1) = ⊤) :
    Function.Surjective (restrictedQuotientKummerCharacter n hmu Delta hDelta) := by
  let G := Gal(L/K)
  let R := RestrictedRadicalQuotient n Delta
  let M := nthRootsSubgroup L (n : ℕ)
  let f : R →* (G →* M) := restrictedQuotientKummerCharacter n hmu Delta hDelta
  let t : G →* (R →* M) := restrictedKummerTranspose n hmu Delta hDelta
  have hf : Function.Injective f :=
    restrictedQuotientKummerCharacter_injective n hmu Delta hDelta
  have ht : Function.Injective t :=
    restrictedKummerTranspose_injective_of_adjoin n hmu Delta hDelta hgenerate
  let : IsMulCommutative G :=
    { is_comm := ⟨fun sigma tau => by
        apply ht
        rw [map_mul, map_mul]
        exact mul_comm (t sigma) (t tau)⟩ }
  let _ : CommGroup G :=
    CommGroup.mk (fun a b => IsMulCommutative.is_comm.comm a b)
  let : NeZero (n : ℕ) := ⟨n.ne_zero⟩
  let : Finite (G →* M) :=
    Finite.of_injective
      (fun chi : G →* M => (chi : G → M)) DFunLike.coe_injective
  let : Finite R := Finite.of_injective f hf
  let : Finite (R →* M) :=
    Finite.of_injective
      (fun chi : R →* M => (chi : R → M)) DFunLike.coe_injective
  have hRExponent : ∀ r : R, r ^ (n : ℕ) = 1 :=
    restrictedRadicalQuotient_pow_eq_one n Delta
  have hGExponent : ∀ sigma : G, sigma ^ (n : ℕ) = 1 := by
    intro sigma
    apply ht
    rw [map_pow, map_one]
    apply MonoidHom.ext
    intro r
    apply Subtype.ext
    exact (t sigma r).2
  obtain ⟨dualG⟩ := finiteNthRootsCharacterDuality
    (G := G) (K := K) (L := L) n hmu hGExponent
  obtain ⟨dualR⟩ := finiteNthRootsCharacterDuality
    (G := R) (K := K) (L := L) n hmu hRExponent
  let : Fintype G := Fintype.ofFinite G
  let : Fintype R := Fintype.ofFinite R
  let : Fintype (G →* M) := Fintype.ofFinite (G →* M)
  have hcardRG : Fintype.card R ≤ Fintype.card G :=
    Fintype.card_le_of_injective
      (fun r : R => dualG (f r)) (dualG.injective.comp hf)
  have hcardGR : Fintype.card G ≤ Fintype.card R :=
    Fintype.card_le_of_injective
      (fun sigma : G => dualR (t sigma)) (dualR.injective.comp ht)
  have hcardRHomG : Fintype.card R = Fintype.card (G →* M) := by
    calc
      Fintype.card R = Fintype.card G := Nat.le_antisymm hcardRG hcardGR
      _ = Fintype.card (G →* M) := (Fintype.card_congr dualG.toEquiv).symm
  exact hf.surjective_of_finite (Fintype.equivOfCardEq hcardRHomG)
 

def restrictedKummerCharacterMulEquivOfAdjoin
    [FiniteDimensional K L] [IsGalois K L]
    (n : ℕ+) (hmu : (primitiveRoots (n : ℕ) K).Nonempty)
    (Delta : KummerSubgroup K n)
    (hDelta : Delta.1 ≤ finiteKummerRadicalSubgroup (K := K) (L := L) n)
    (hgenerate : IntermediateField.adjoin K
      (kummerRootSet (K := K) (Omega := L) n Delta.1) = ⊤) :
    RestrictedRadicalQuotient n Delta ≃*
      (Gal(L/K) →* nthRootsSubgroup L (n : ℕ)) :=
  MulEquiv.ofBijective (restrictedQuotientKummerCharacter n hmu Delta hDelta)
    ⟨restrictedQuotientKummerCharacter_injective n hmu Delta hDelta,
      restrictedQuotientKummerCharacter_surjective_of_adjoin
        n hmu Delta hDelta hgenerate⟩
end RestrictedFiniteKummer
end KummerTheory
end
end

/- GaloisCohomology.Kummer.Concrete.InfiniteContinuity -/
section
noncomputable section
namespace KummerTheory
open scoped Topology
open Filter
 

def DiscreteNthRootsSubgroup (L : Type*) [Field L] (n : ℕ) :=
  nthRootsSubgroup L n
namespace DiscreteNthRootsSubgroup
variable (L : Type*) [Field L] (n : ℕ)
 
instance : CommGroup (DiscreteNthRootsSubgroup L n) :=
  inferInstanceAs (CommGroup (nthRootsSubgroup L n))
 
instance : TopologicalSpace (DiscreteNthRootsSubgroup L n) := ⊥
 
instance : DiscreteTopology (DiscreteNthRootsSubgroup L n) :=
  discreteTopology_bot _
end DiscreteNthRootsSubgroup
section InfiniteKummerContinuity
variable {K Ω : Type*} [Field K] [Field Ω] [Algebra K Ω]
 

def infiniteKummerRootCharacter
    (n : ℕ+) (hmu : NthRootsOfUnityInBase (K := K) (L := Ω) n)
    (a : (chosenFiniteKummerRadicalDatum (K := K) (L := Ω) n).carrier) :
    Gal(Ω/K) →* DiscreteNthRootsSubgroup Ω (n : ℕ) :=
  (chosenFiniteKummerRadicalDatum (K := K) (L := Ω) n).rootCharacterToMuWithoutSection
    a (nthRootsOfUnity_fixed (K := K) (L := Ω) n hmu)
variable [IsGalois K Ω]
 

theorem fixingSubgroup_adjoin_root_le_infiniteKummerRootCharacter_ker
    (n : ℕ+) (hmu : NthRootsOfUnityInBase (K := K) (L := Ω) n)
    (a : (chosenFiniteKummerRadicalDatum (K := K) (L := Ω) n).carrier) :
    (FiniteGaloisIntermediateField.adjoin K
      {((chosenFiniteKummerRadicalDatum (K := K) (L := Ω) n).root a : Ω)}).fixingSubgroup ≤
        MonoidHom.ker (infiniteKummerRootCharacter n hmu a) := by
  let D := chosenFiniteKummerRadicalDatum (K := K) (L := Ω) n
  let E := FiniteGaloisIntermediateField.adjoin K {(D.root a : Ω)}
  intro σ hσ
  rw [MonoidHom.mem_ker]
  apply Subtype.ext
  change D.rootCharacter a
      (nthRootsOfUnity_fixed (K := K) (L := Ω) n hmu) σ = 1
  rw [D.rootCharacter_apply]
  apply (rootQuotient_eq_one_iff (K := K) (L := Ω) (D.root a) σ).2
  apply Units.ext
  exact ((IntermediateField.mem_fixingSubgroup_iff E.toIntermediateField σ).mp hσ)
    (D.root a : Ω)
    (FiniteGaloisIntermediateField.subset_adjoin K {(D.root a : Ω)}
      (Set.mem_singleton (D.root a : Ω)))
 

theorem infiniteKummerRootCharacter_isOpen_ker
    (n : ℕ+) (hmu : NthRootsOfUnityInBase (K := K) (L := Ω) n)
    (a : (chosenFiniteKummerRadicalDatum (K := K) (L := Ω) n).carrier) :
    IsOpen (MonoidHom.ker (infiniteKummerRootCharacter n hmu a) :
      Set Gal(Ω/K)) := by
  exact Subgroup.isOpen_mono
    (fixingSubgroup_adjoin_root_le_infiniteKummerRootCharacter_ker n hmu a)
    (IntermediateField.fixingSubgroup_isOpen
      (FiniteGaloisIntermediateField.adjoin K
        {((chosenFiniteKummerRadicalDatum (K := K) (L := Ω) n).root a : Ω)}).toIntermediateField)
 

theorem infiniteKummerRootCharacter_continuous
    (n : ℕ+) (hmu : NthRootsOfUnityInBase (K := K) (L := Ω) n)
    (a : (chosenFiniteKummerRadicalDatum (K := K) (L := Ω) n).carrier) :
    Continuous (infiniteKummerRootCharacter n hmu a) := by
  apply continuous_of_continuousAt_one (infiniteKummerRootCharacter n hmu a)
  rw [ContinuousAt, map_one]
  rw [show (𝓝 : DiscreteNthRootsSubgroup Ω (n : ℕ) →
      Filter (DiscreteNthRootsSubgroup Ω (n : ℕ))) = pure from nhds_discrete _,
    tendsto_pure]
  exact (infiniteKummerRootCharacter_isOpen_ker n hmu a).mem_nhds (by simp)
end InfiniteKummerContinuity
end KummerTheory
end
end

/- GaloisCohomology.Kummer.Concrete.KummerCorrespondenceFormula -/
section
noncomputable section
namespace KummerTheory
open scoped IsMulCommutative
variable {K Omega : Type*} [Field K] [Field Omega] [Algebra K Omega]
 

theorem kummerRadicalExtension_internalRoots_adjoin_eq_top
    (n : ℕ+) (Delta : KummerSubgroup K n) :
    IntermediateField.adjoin K
      (kummerRootSet
        (K := K)
        (Omega := kummerRadicalExtension
          (K := K) (Omega := Omega) n Delta.1)
        n Delta.1) = ⊤ := by
  let E := kummerRadicalExtension
    (K := K) (Omega := Omega) n Delta.1
  let R : IntermediateField K E := IntermediateField.adjoin K
    (kummerRootSet (K := K) (Omega := E) n Delta.1)
  apply top_unique
  intro x _
  have hall : ∀ y : Omega, ∀ hy : y ∈ E, (⟨y, hy⟩ : E) ∈ R := by
    intro y hy
    change y ∈ IntermediateField.adjoin K
      (kummerRootSet (K := K) (Omega := Omega) n Delta.1) at hy
    induction hy using IntermediateField.adjoin_induction with
    | mem beta hbeta =>
        apply IntermediateField.subset_adjoin K
        obtain ⟨a, ha⟩ := hbeta
        refine ⟨a, ?_⟩
        apply Subtype.ext
        exact ha
    | algebraMap a => exact R.algebraMap_mem a
    | add x y hx hy ihx ihy => exact R.add_mem ihx ihy
    | inv x hx ihx => exact R.inv_mem ihx
    | mul x y hx hy ihx ihy => exact R.mul_mem ihx ihy
  exact hall x.1 x.property
 



def restrictedKummerTransposeMulEquivOfAdjoin
    {L : Type*} [Field L] [Algebra K L]
    [FiniteDimensional K L] [IsGalois K L]
    (n : ℕ+) (hmu : (primitiveRoots (n : ℕ) K).Nonempty)
    (Delta : KummerSubgroup K n)
    (hDelta : Delta.1 ≤
      finiteKummerRadicalSubgroup (K := K) (L := L) n)
    (hgenerate : IntermediateField.adjoin K
      (kummerRootSet (K := K) (Omega := L) n Delta.1) = ⊤) :
    Gal(L/K) ≃*
      (RestrictedRadicalQuotient n Delta →*
        nthRootsSubgroup L (n : ℕ)) := by
  let t₀ := restrictedKummerTranspose n hmu Delta hDelta
  have ht₀ : Function.Injective t₀ :=
    restrictedKummerTranspose_injective_of_adjoin
      n hmu Delta hDelta hgenerate
  have hcomm : ∀ sigma tau : Gal(L/K), sigma * tau = tau * sigma := by
    intro sigma tau
    apply ht₀
    rw [map_mul, map_mul, mul_comm]
  letI : IsMulCommutative Gal(L/K) :=
    { is_comm := ⟨hcomm⟩ }
  letI : CommGroup Gal(L/K) := by infer_instance
  let t := restrictedKummerTranspose n hmu Delta hDelta
  have ht : Function.Injective t :=
    restrictedKummerTranspose_injective_of_adjoin
      n hmu Delta hDelta hgenerate
  have hexponent : ∀ sigma : Gal(L/K), sigma ^ (n : ℕ) = 1 := by
    intro sigma
    apply ht
    rw [map_pow, map_one]
    apply MonoidHom.ext
    intro q
    apply Subtype.ext
    exact (t sigma q).2
  let e := restrictedKummerCharacterMulEquivOfAdjoin
    n hmu Delta hDelta hgenerate
  exact transposeCharacterMulEquiv
    (K := K) (L := L) (G := Gal(L/K))
    (R := RestrictedRadicalQuotient n Delta)
    n hmu hexponent e
 




theorem exists_pairing_element_matching_finset
    {G R L : Type*} [Field L] [Algebra K L]
    [CommGroup G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [CommGroup R]
    (n : ℕ+) (hmu : (primitiveRoots (n : ℕ) K).Nonempty)
    (hRexponent : ∀ r : R, r ^ (n : ℕ) = 1)
    (f : R →* (G →* DiscreteNthRootsSubgroup L (n : ℕ)))
    (t : G →* (R →* DiscreteNthRootsSubgroup L (n : ℕ)))
    (hpair : ∀ g r, t g r = f r g)
    (hf : Function.Injective f)
    (hcontinuous : ∀ r,
      Continuous (fun g : G => f r g))
    (S : Finset R)
    (chi : R →* DiscreteNthRootsSubgroup L (n : ℕ)) :
    ∃ g : G, ∀ r ∈ S, t g r = chi r := by
  let H : Subgroup G := ⨅ r : S, MonoidHom.ker (f r.1)
  have hHopen : IsOpen (H : Set G) := by
    dsimp only [H]
    rw [Subgroup.coe_iInf]
    change IsOpen (⋂ r : S, (MonoidHom.ker (f r.1) : Set G))
    apply isOpen_iInter_of_finite
    intro r
    rw [MonoidHom.coe_ker]
    exact (isOpen_discrete ({1} :
      Set (DiscreteNthRootsSubgroup L (n : ℕ)))).preimage
        (hcontinuous r.1)
  let : H.Normal := H.normal_of_isMulCommutative
  let Q := G ⧸ H
  let : Finite Q := H.quotient_finite_of_isOpen hHopen
  let R0 := Subgroup.closure (S : Set R)
  have hR0exponent : ∀ r : R0, r ^ (n : ℕ) = 1 := by
    intro r
    apply Subtype.ext
    exact hRexponent r.1
  let : Finite R0 := CommGroup.finite_of_fg_isMulTorsion (G := R0) (fun r =>
    isOfFinOrder_iff_pow_eq_one.mpr ⟨(n : ℕ), n.pos, hR0exponent r⟩)
  have hHker (r : R0) : H ≤ MonoidHom.ker (f r.1) := by
    intro g hg
    have hclosure : R0 ≤ MonoidHom.ker (t g) := by
      rw [Subgroup.closure_le]
      intro x hx
      change t g x = 1
      rw [hpair]
      exact (show g ∈ MonoidHom.ker (f x) from
        (iInf_le (fun r : S => MonoidHom.ker (f r.1)) ⟨x, hx⟩) hg)
    rw [MonoidHom.mem_ker, ← hpair]
    exact hclosure r.property
  let f0 : R0 →* (Q →* DiscreteNthRootsSubgroup L (n : ℕ)) :=
    { toFun := fun r => QuotientGroup.lift H (f r.1) (hHker r)
      map_one' := by
        apply MonoidHom.ext
        intro q
        obtain ⟨g, rfl⟩ := QuotientGroup.mk'_surjective H q
        simp
      map_mul' := by
        intro r s
        apply MonoidHom.ext
        intro q
        obtain ⟨g, rfl⟩ := QuotientGroup.mk'_surjective H q
        simp }
  have hf0 : Function.Injective f0 := by
    intro r s hrs
    apply Subtype.ext
    apply hf
    apply MonoidHom.ext
    intro g
    have hvalue := DFunLike.congr_fun hrs (QuotientGroup.mk' H g)
    exact hvalue
  let t0 : Q →* (R0 →* DiscreteNthRootsSubgroup L (n : ℕ)) :=
    { toFun := fun q =>
        { toFun := fun r => f0 r q
          map_one' := by simp
          map_mul' := by intro r s; exact DFunLike.congr_fun (map_mul f0 r s) q }
      map_one' := by
        apply MonoidHom.ext
        intro r
        exact map_one (f0 r)
      map_mul' := by
        intro q p
        apply MonoidHom.ext
        intro r
        exact map_mul (f0 r) q p }
  have ht0 : Function.Injective t0 := by
    intro q p hqp
    obtain ⟨g, rfl⟩ := QuotientGroup.mk'_surjective H q
    obtain ⟨h, rfl⟩ := QuotientGroup.mk'_surjective H p
    apply (QuotientGroup.eq_iff_div_mem).2
    dsimp only [H]
    rw [Subgroup.mem_iInf]
    intro r
    rw [MonoidHom.mem_ker, map_div]
    have hvalue := DFunLike.congr_fun hqp
      (⟨r.1, Subgroup.subset_closure r.2⟩ : R0)
    change f r.1 g = f r.1 h at hvalue
    rw [hvalue]
    exact div_self' _
  have hQexponent : ∀ q : Q, q ^ (n : ℕ) = 1 := by
    intro q
    apply ht0
    rw [map_pow, map_one]
    apply MonoidHom.ext
    intro r
    apply Subtype.ext
    exact (t0 q r).2
  obtain ⟨dualQ⟩ := finiteNthRootsCharacterDuality
    (G := Q) (K := K) (L := L) n hmu hQexponent
  obtain ⟨dualR0⟩ := finiteNthRootsCharacterDuality
    (G := R0) (K := K) (L := L) n hmu hR0exponent
  let : NeZero (n : ℕ) := ⟨n.ne_zero⟩
  let : Finite (DiscreteNthRootsSubgroup L (n : ℕ)) :=
    inferInstanceAs (Finite (nthRootsSubgroup L (n : ℕ)))
  let : Fintype Q := Fintype.ofFinite Q
  let : Fintype R0 := Fintype.ofFinite R0
  let : Finite (R0 →* DiscreteNthRootsSubgroup L (n : ℕ)) :=
    Finite.of_injective
      (fun psi : R0 →* DiscreteNthRootsSubgroup L (n : ℕ) =>
        (psi : R0 → DiscreteNthRootsSubgroup L (n : ℕ)))
      DFunLike.coe_injective
  let : Fintype (R0 →* DiscreteNthRootsSubgroup L (n : ℕ)) :=
    Fintype.ofFinite _
  have hcardR0Q : Fintype.card R0 ≤ Fintype.card Q :=
    Fintype.card_le_of_injective
      (fun r : R0 => dualQ (f0 r)) (dualQ.injective.comp hf0)
  have hcardQR0 : Fintype.card Q ≤ Fintype.card R0 :=
    Fintype.card_le_of_injective
      (fun q : Q => dualR0 (t0 q)) (dualR0.injective.comp ht0)
  have hcardQTarget :
      Fintype.card Q =
        Fintype.card (R0 →* DiscreteNthRootsSubgroup L (n : ℕ)) := by
    calc
      Fintype.card Q = Fintype.card R0 := Nat.le_antisymm hcardQR0 hcardR0Q
      _ = Fintype.card (R0 →* DiscreteNthRootsSubgroup L (n : ℕ)) :=
        Fintype.card_congr dualR0.symm.toEquiv
  have ht0surjective : Function.Surjective t0 :=
    ht0.surjective_of_finite (Fintype.equivOfCardEq hcardQTarget)
  obtain ⟨q, hq⟩ := ht0surjective (chi.comp R0.subtype)
  obtain ⟨g, rfl⟩ := QuotientGroup.mk'_surjective H q
  refine ⟨g, ?_⟩
  intro r hr
  have hvalue := DFunLike.congr_fun hq
    (⟨r, Subgroup.subset_closure hr⟩ : R0)
  change f r g = chi r at hvalue
  rw [hpair]
  exact hvalue
section RadicalExtensionPairing
variable [IsSepClosure K Omega]
 

def kummerRadicalExtensionRestrictedTranspose
    (n : ℕ+) (hn : ((n : ℕ) : K) ≠ 0)
    (hmu : (primitiveRoots (n : ℕ) K).Nonempty)
    (Delta : KummerSubgroup K n) :
    Gal(kummerRadicalExtension
        (K := K) (Omega := Omega) n Delta.1/K) →*
      (RestrictedRadicalQuotient n Delta →*
        nthRootsSubgroup
          (kummerRadicalExtension
            (K := K) (Omega := Omega) n Delta.1) (n : ℕ)) := by
  let E := kummerRadicalExtension
    (K := K) (Omega := Omega) n Delta.1
  letI : IsGalois K E := kummerRadicalExtension_isGalois n Delta.1
  exact restrictedKummerTranspose n hmu Delta
    (le_finiteKummerRadicalSubgroup_kummerRadicalExtension n hn Delta.1)
 


theorem kummerRadicalExtensionRestrictedTranspose_injective
    (n : ℕ+) (hn : ((n : ℕ) : K) ≠ 0)
    (hmu : (primitiveRoots (n : ℕ) K).Nonempty)
    (Delta : KummerSubgroup K n) :
    Function.Injective
      (kummerRadicalExtensionRestrictedTranspose
        (K := K) (Omega := Omega) n hn hmu Delta) := by
  let E := kummerRadicalExtension
    (K := K) (Omega := Omega) n Delta.1
  let : IsGalois K E := kummerRadicalExtension_isGalois n Delta.1
  exact restrictedKummerTranspose_injective_of_adjoin n hmu Delta
    (le_finiteKummerRadicalSubgroup_kummerRadicalExtension n hn Delta.1)
    (kummerRadicalExtension_internalRoots_adjoin_eq_top n Delta)
 



theorem restrictedKummerTranspose_evaluation_continuous
    {L : Type*} [Field L] [Algebra K L] [IsGalois K L]
    (n : ℕ+) (hmu : (primitiveRoots (n : ℕ) K).Nonempty)
    (Delta : KummerSubgroup K n)
    (hDelta : Delta.1 ≤
      finiteKummerRadicalSubgroup (K := K) (L := L) n)
    (q : RestrictedRadicalQuotient n Delta) :
    @Continuous (Gal(L/K)) (DiscreteNthRootsSubgroup L (n : ℕ))
      inferInstance
      (DiscreteNthRootsSubgroup.instTopologicalSpaceSubtypeUnitsMemSubgroup
        L (n : ℕ))
      (fun sigma => restrictedKummerTranspose n hmu Delta hDelta sigma q) := by
  let D := chosenFiniteKummerRadicalDatum (K := K) (L := L) n
  let hbase : NthRootsOfUnityInBase (K := K) (L := L) n :=
    nthRootsOfUnityInBase_of_primitiveRoots (K := K) (L := L) n hmu
  obtain ⟨a, rfl⟩ :=
    restrictedRadicalQuotientMk_surjective n Delta q
  let aD : D.carrier := restrictedRadicalInclusion n Delta hDelta a
  have hcontinuous := infiniteKummerRootCharacter_continuous n hbase aD
  exact hcontinuous.congr (fun _ => rfl)
 


def restrictedKummerEvaluationLocus
    {L : Type*} [Field L] [Algebra K L] [IsGalois K L]
    (n : ℕ+) (hmu : (primitiveRoots (n : ℕ) K).Nonempty)
    (Delta : KummerSubgroup K n)
    (hDelta : Delta.1 ≤
      finiteKummerRadicalSubgroup (K := K) (L := L) n)
    (chi : RestrictedRadicalQuotient n Delta →*
      nthRootsSubgroup L (n : ℕ))
    (q : RestrictedRadicalQuotient n Delta) : Set Gal(L/K) :=
  {sigma | restrictedKummerTranspose n hmu Delta hDelta sigma q = chi q}
 
theorem restrictedKummerEvaluationLocus_isClosed
    {L : Type*} [Field L] [Algebra K L] [IsGalois K L]
    (n : ℕ+) (hmu : (primitiveRoots (n : ℕ) K).Nonempty)
    (Delta : KummerSubgroup K n)
    (hDelta : Delta.1 ≤
      finiteKummerRadicalSubgroup (K := K) (L := L) n)
    (chi : RestrictedRadicalQuotient n Delta →*
      nthRootsSubgroup L (n : ℕ))
    (q : RestrictedRadicalQuotient n Delta) :
    IsClosed (restrictedKummerEvaluationLocus n hmu Delta hDelta chi q) := by
  let : TopologicalSpace (nthRootsSubgroup L (n : ℕ)) :=
    DiscreteNthRootsSubgroup.instTopologicalSpaceSubtypeUnitsMemSubgroup
      L (n : ℕ)
  let : DiscreteTopology (nthRootsSubgroup L (n : ℕ)) :=
    DiscreteNthRootsSubgroup.instDiscreteTopologySubtypeUnitsMemSubgroup
      L (n : ℕ)
  let : T2Space (nthRootsSubgroup L (n : ℕ)) :=
    @DiscreteTopology.toT2Space (nthRootsSubgroup L (n : ℕ))
      (DiscreteNthRootsSubgroup.instTopologicalSpaceSubtypeUnitsMemSubgroup L (n : ℕ))
      (DiscreteNthRootsSubgroup.instDiscreteTopologySubtypeUnitsMemSubgroup L (n : ℕ))
  exact isClosed_eq
    (restrictedKummerTranspose_evaluation_continuous n hmu Delta hDelta q)
    continuous_const
 


theorem mem_iInter_restrictedKummerEvaluationLocus_iff
    {L : Type*} [Field L] [Algebra K L] [IsGalois K L]
    (n : ℕ+) (hmu : (primitiveRoots (n : ℕ) K).Nonempty)
    (Delta : KummerSubgroup K n)
    (hDelta : Delta.1 ≤
      finiteKummerRadicalSubgroup (K := K) (L := L) n)
    (chi : RestrictedRadicalQuotient n Delta →*
      nthRootsSubgroup L (n : ℕ))
    (sigma : Gal(L/K)) :
    sigma ∈ ⋂ q, restrictedKummerEvaluationLocus
        n hmu Delta hDelta chi q ↔
      restrictedKummerTranspose n hmu Delta hDelta sigma = chi := by
  rw [Set.mem_iInter]
  constructor
  · intro h
    apply MonoidHom.ext
    exact h
  · intro h q
    exact DFunLike.congr_fun h q
 

theorem exists_kummerRadicalExtensionRestrictedTranspose_match_finset
    (n : ℕ+) (hn : ((n : ℕ) : K) ≠ 0)
    (hmu : (primitiveRoots (n : ℕ) K).Nonempty)
    (Delta : KummerSubgroup K n)
    (S : Finset (RestrictedRadicalQuotient n Delta))
    (chi : RestrictedRadicalQuotient n Delta →*
      nthRootsSubgroup
        (kummerRadicalExtension
          (K := K) (Omega := Omega) n Delta.1) (n : ℕ)) :
    ∃ sigma : Gal(kummerRadicalExtension
        (K := K) (Omega := Omega) n Delta.1/K),
      ∀ q ∈ S,
        kummerRadicalExtensionRestrictedTranspose
          n hn hmu Delta sigma q = chi q := by
  let E := kummerRadicalExtension
    (K := K) (Omega := Omega) n Delta.1
  let : IsGalois K E := kummerRadicalExtension_isGalois n Delta.1
  let : IsMulCommutative Gal(E/K) :=
    kummerRadicalExtension_isMulCommutative n hmu Delta.1
  let : CommGroup Gal(E/K) := by infer_instance
  let hDelta : Delta.1 ≤
      finiteKummerRadicalSubgroup (K := K) (L := E) n :=
    le_finiteKummerRadicalSubgroup_kummerRadicalExtension n hn Delta.1
  let f : RestrictedRadicalQuotient n Delta →*
      (Gal(E/K) →* DiscreteNthRootsSubgroup E (n : ℕ)) :=
    restrictedQuotientKummerCharacter n hmu Delta hDelta
  let t : Gal(E/K) →*
      (RestrictedRadicalQuotient n Delta →*
        DiscreteNthRootsSubgroup E (n : ℕ)) :=
    restrictedKummerTranspose n hmu Delta hDelta
  apply exists_pairing_element_matching_finset
    (K := K) n hmu
    (restrictedRadicalQuotient_pow_eq_one n Delta)
    f t (fun _ _ => rfl)
    (restrictedQuotientKummerCharacter_injective n hmu Delta hDelta)
    _ S chi
  intro q
  exact restrictedKummerTranspose_evaluation_continuous
    n hmu Delta hDelta q
 




theorem kummerRadicalExtensionRestrictedTranspose_surjective
    (n : ℕ+) (hn : ((n : ℕ) : K) ≠ 0)
    (hmu : (primitiveRoots (n : ℕ) K).Nonempty)
    (Delta : KummerSubgroup K n) :
    Function.Surjective
      (kummerRadicalExtensionRestrictedTranspose
        (K := K) (Omega := Omega) n hn hmu Delta) := by
  let E := kummerRadicalExtension
    (K := K) (Omega := Omega) n Delta.1
  let : IsGalois K E := kummerRadicalExtension_isGalois n Delta.1
  let hDelta : Delta.1 ≤
      finiteKummerRadicalSubgroup (K := K) (L := E) n :=
    le_finiteKummerRadicalSubgroup_kummerRadicalExtension n hn Delta.1
  intro chi
  have hintersection :
      (⋂ q, restrictedKummerEvaluationLocus
        n hmu Delta hDelta chi q).Nonempty := by
    apply CompactSpace.iInter_nonempty
    · intro q
      exact restrictedKummerEvaluationLocus_isClosed
        n hmu Delta hDelta chi q
    · intro S
      obtain ⟨sigma, hsigma⟩ :=
        exists_kummerRadicalExtensionRestrictedTranspose_match_finset
          (K := K) (Omega := Omega) n hn hmu Delta S chi
      refine ⟨sigma, ?_⟩
      rw [Set.mem_iInter₂]
      intro q hq
      exact hsigma q hq
  obtain ⟨sigma, hsigma⟩ := hintersection
  refine ⟨sigma, ?_⟩
  exact (mem_iInter_restrictedKummerEvaluationLocus_iff
    n hmu Delta hDelta chi sigma).1 hsigma
 


def kummerRadicalExtensionRestrictedTransposeMulEquiv
    (n : ℕ+) (hn : ((n : ℕ) : K) ≠ 0)
    (hmu : (primitiveRoots (n : ℕ) K).Nonempty)
    (Delta : KummerSubgroup K n) :
    Gal(kummerRadicalExtension
        (K := K) (Omega := Omega) n Delta.1/K) ≃*
      (RestrictedRadicalQuotient n Delta →*
        nthRootsSubgroup
          (kummerRadicalExtension
            (K := K) (Omega := Omega) n Delta.1) (n : ℕ)) :=
  MulEquiv.ofBijective
    (kummerRadicalExtensionRestrictedTranspose n hn hmu Delta)
    ⟨kummerRadicalExtensionRestrictedTranspose_injective n hn hmu Delta,
      kummerRadicalExtensionRestrictedTranspose_surjective n hn hmu Delta⟩
end RadicalExtensionPairing
end KummerTheory
end
end

/- ValuedFieldTheory.LocalField.GroupTheory.PowerIndex -/
section
noncomputable section
namespace LocalFieldTheory
open scoped Int
section NthPowers
universe uG uH uU
variable (G : Type uG) (H : Type uH) (U : Type uU)
variable [CommGroup G] [CommGroup H] [CommGroup U]
 

theorem powMonoidHom_range_map (n : ℕ) (e : G ≃* H) :
    ((powMonoidHom n : G →* G).range).map e.toMonoidHom = (powMonoidHom n : H →* H).range := by
  exact e.map_range_powMonoidHom n
 
def nthPowerQuotientEquivOfMulEquiv (n : ℕ) (e : G ≃* H) :
    G ⧸ (powMonoidHom n : G →* G).range ≃* H ⧸ (powMonoidHom n : H →* H).range :=
  QuotientGroup.congr ((powMonoidHom n : G →* G).range) ((powMonoidHom n : H →* H).range) e
    (powMonoidHom_range_map G H n e)
 

theorem finite_nthPowerQuotient_of_mulEquiv
    (n : ℕ) (e : G ≃* H)
    [Finite (H ⧸ (powMonoidHom n : H →* H).range)] :
    Finite (G ⧸ (powMonoidHom n : G →* G).range) :=
  Finite.of_equiv
    (H ⧸ (powMonoidHom n : H →* H).range)
    (nthPowerQuotientEquivOfMulEquiv G H n e).symm.toEquiv
 

def nthPowerProductQuotientHom (n : ℕ) :
    G × H →* (G ⧸ (powMonoidHom n : G →* G).range) × (H ⧸ (powMonoidHom n : H →* H).range) where
  toFun x :=
    (QuotientGroup.mk' ((powMonoidHom n : G →* G).range) x.1,
      QuotientGroup.mk' ((powMonoidHom n : H →* H).range) x.2)
  map_one' := rfl
  map_mul' _ _ := rfl
 
theorem nthPowerProductQuotientHom_surjective (n : ℕ) :
    Function.Surjective (nthPowerProductQuotientHom G H n) := by
  intro q
  rcases q with ⟨qG, qH⟩
  refine Quotient.inductionOn' qG ?_
  intro g
  refine Quotient.inductionOn' qH ?_
  intro h
  exact ⟨(g, h), rfl⟩
 
theorem nthPowerProductQuotientHom_ker (n : ℕ) :
    (nthPowerProductQuotientHom G H n).ker =
      (powMonoidHom n : (G × H) →* (G × H)).range := by
  ext x
  constructor
  · intro hx
    rw [MonoidHom.mem_ker] at hx
    change
      (QuotientGroup.mk' ((powMonoidHom n : G →* G).range) x.1,
        QuotientGroup.mk' ((powMonoidHom n : H →* H).range) x.2) = 1 at hx
    have hxG :
        QuotientGroup.mk' ((powMonoidHom n : G →* G).range) x.1 = 1 :=
      congrArg Prod.fst hx
    have hxH :
        QuotientGroup.mk' ((powMonoidHom n : H →* H).range) x.2 = 1 :=
      congrArg Prod.snd hx
    have hxGmem : x.1 ∈ (powMonoidHom n : G →* G).range :=
      (QuotientGroup.eq_one_iff x.1).1 hxG
    have hxHmem : x.2 ∈ (powMonoidHom n : H →* H).range :=
      (QuotientGroup.eq_one_iff x.2).1 hxH
    rw [MonoidHom.mem_range] at hxGmem hxHmem ⊢
    rcases hxGmem with ⟨g, hg⟩
    rcases hxHmem with ⟨h, hh⟩
    refine ⟨(g, h), ?_⟩
    ext
    · change g ^ n = x.1
      simpa only [powMonoidHom_apply] using hg
    · change h ^ n = x.2
      simpa only [powMonoidHom_apply] using hh
  · intro hx
    rw [MonoidHom.mem_ker]
    rw [MonoidHom.mem_range] at hx
    rcases hx with ⟨y, rfl⟩
    apply Prod.ext
    · exact (QuotientGroup.eq_one_iff ((y.1) ^ n)).2
        ((MonoidHom.mem_range (G := G)).2 ⟨y.1, rfl⟩)
    · exact (QuotientGroup.eq_one_iff ((y.2) ^ n)).2
        ((MonoidHom.mem_range (G := H)).2 ⟨y.2, rfl⟩)
 

def nthPowerProductQuotientEquiv (n : ℕ) :
    (G × H) ⧸ (powMonoidHom n : (G × H) →* (G × H)).range ≃*
      (G ⧸ (powMonoidHom n : G →* G).range) × (H ⧸ (powMonoidHom n : H →* H).range) :=
  (QuotientGroup.quotientMulEquivOfEq
      (nthPowerProductQuotientHom_ker G H n).symm).trans
    (QuotientGroup.quotientKerEquivOfSurjective
      (nthPowerProductQuotientHom G H n)
      (nthPowerProductQuotientHom_surjective G H n))
 

noncomputable instance finite_powMonoidHom_rangeQuotient_prod (n : ℕ)
    [Finite (G ⧸ (powMonoidHom n : G →* G).range)]
    [Finite (H ⧸ (powMonoidHom n : H →* H).range)] :
    Finite ((G × H) ⧸ (powMonoidHom n : (G × H) →* (G × H)).range) :=
  Finite.of_equiv
    ((G ⧸ (powMonoidHom n : G →* G).range) × (H ⧸ (powMonoidHom n : H →* H).range))
    (nthPowerProductQuotientEquiv G H n).symm.toEquiv
end NthPowers
section AdditivePowers
universe uA uB uG
variable (A : Type uA) [AddCommGroup A]
 
abbrev nsmulAddSubgroup (n : ℕ) : AddSubgroup A :=
  (nsmulAddMonoidHom n).range
 

@[simp]
theorem mem_nsmulAddSubgroup_iff {n : ℕ} {x : A} :
    x ∈ nsmulAddSubgroup A n ↔ ∃ y : A, n • y = x := by
  simp [nsmulAddSubgroup, AddMonoidHom.mem_range]
 

theorem powMonoidHom_range_multiplicative_eq_nsmulAddSubgroup_toSubgroup
    (n : ℕ) :
    (powMonoidHom n : (Multiplicative A) →* (Multiplicative A)).range =
      AddSubgroup.toSubgroup (nsmulAddSubgroup A n) := by
  ext x
  constructor
  · intro hx
    rw [MonoidHom.mem_range] at hx
    rcases hx with ⟨y, rfl⟩
    simp
  · intro hx
    rw [MonoidHom.mem_range]
    have hxadd : Multiplicative.toAdd x ∈ nsmulAddSubgroup A n := by
      simpa using hx
    rw [mem_nsmulAddSubgroup_iff] at hxadd
    rcases hxadd with ⟨y, hy⟩
    refine ⟨Multiplicative.ofAdd y, ?_⟩
    apply Multiplicative.toAdd.injective
    simp [hy]
 

def multiplicativeNthPowerQuotientEquivAdditive (n : ℕ) :
    (Multiplicative A ⧸ (powMonoidHom n : (Multiplicative A) →* (Multiplicative A)).range) ≃
      (A ⧸ nsmulAddSubgroup A n) := by
  rw [powMonoidHom_range_multiplicative_eq_nsmulAddSubgroup_toSubgroup]
  exact Equiv.refl _
 

noncomputable instance finite_multiplicative_nthPowerQuotient
    (n : ℕ) [Finite (A ⧸ nsmulAddSubgroup A n)] :
    Finite
      (Multiplicative A ⧸ (powMonoidHom n : (Multiplicative A) →* (Multiplicative A)).range) :=
  Finite.of_equiv (A ⧸ nsmulAddSubgroup A n)
    (multiplicativeNthPowerQuotientEquivAdditive A n).symm
 

theorem card_multiplicative_nthPowerQuotient_eq_nsmulAddSubgroup_index
    (n : ℕ)
    [Finite (Multiplicative A ⧸ (powMonoidHom n : (Multiplicative A) →* (Multiplicative A)).range)] :
    Nat.card (Multiplicative A ⧸ (powMonoidHom n : (Multiplicative A) →* (Multiplicative A)).range) =
      (nsmulAddSubgroup A n).index := by
  rw [← Subgroup.index_eq_card
    (H := (powMonoidHom n : (Multiplicative A) →* (Multiplicative A)).range)]
  rw [powMonoidHom_range_multiplicative_eq_nsmulAddSubgroup_toSubgroup]
  simp
 

theorem card_multiplicative_nthPowerQuotient_eq_additive_nsmulQuotient
    (n : ℕ)
    [Finite (Multiplicative A ⧸ (powMonoidHom n : (Multiplicative A) →* (Multiplicative A)).range)]
    [Finite (A ⧸ nsmulAddSubgroup A n)] :
    Nat.card (Multiplicative A ⧸ (powMonoidHom n : (Multiplicative A) →* (Multiplicative A)).range) =
      Nat.card (A ⧸ nsmulAddSubgroup A n) := by
  rw [card_multiplicative_nthPowerQuotient_eq_nsmulAddSubgroup_index]
  rw [AddSubgroup.index_eq_card]
section AdditiveProducts
variable (B : Type uB) [AddCommGroup B]
end AdditiveProducts
variable (G : Type uG) [CommGroup G]
end AdditivePowers
end LocalFieldTheory
end
end

/- ClassFieldTheory.KummerTheory.Concrete.SUnitPreparation.SUnitPowerQuotient -/
section
open scoped NumberField Classical IsMulCommutative NNReal ValuativeRel
open NumberField IsDedekindDomain
open LocalFieldTheory
noncomputable section
namespace KummerTheory
variable {K : Type*} [Field K]
    [numberFieldK : NumberField K]
 
def totalPlaceCard
    (S : Finset (HeightOneSpectrum (𝓞 K))) : ℕ :=
  Fintype.card (InfinitePlace K) + S.card
 
def finsuppModHom (d n : ℕ) :
    (Fin d →₀ ℤ) →+ (Fin d → ZMod n) where
  toFun x i := x i
  map_zero' := by
    ext i
    simp
  map_add' x y := by
    ext i
    simp
 
theorem finsuppModHom_surjective (d n : ℕ) :
    Function.Surjective (finsuppModHom d n) := by
  intro y
  choose x hx using fun i => ZMod.intCast_surjective (y i)
  let x' : Fin d →₀ ℤ :=
    (Finsupp.equivFunOnFinite).symm x
  refine ⟨x', ?_⟩
  ext i
  exact hx i
 

theorem finsuppModHom_ker (d n : ℕ) :
    (finsuppModHom d n).ker =
      LocalFieldTheory.nsmulAddSubgroup (Fin d →₀ ℤ) n := by
  ext x
  constructor
  · intro hx
    rw [AddMonoidHom.mem_ker] at hx
    rw [LocalFieldTheory.mem_nsmulAddSubgroup_iff]
    let y : Fin d → ℤ := fun i => (x i) / n
    let y' : Fin d →₀ ℤ :=
      (Finsupp.equivFunOnFinite).symm y
    refine ⟨y', ?_⟩
    ext i
    have hdiv : (n : ℤ) ∣ x i := by
      rw [← ZMod.intCast_zmod_eq_zero_iff_dvd]
      exact congrFun hx i
    change (n : ℤ) * (x i / n) = x i
    rw [mul_comm]
    exact Int.ediv_mul_cancel hdiv
  · intro hx
    rw [LocalFieldTheory.mem_nsmulAddSubgroup_iff] at hx
    obtain ⟨y, rfl⟩ := hx
    rw [AddMonoidHom.mem_ker]
    ext i
    simp [finsuppModHom]
 
noncomputable def finsuppNsmulQuotientEquivPiZMod
    (d n : ℕ) :
    (Fin d →₀ ℤ) ⧸
        LocalFieldTheory.nsmulAddSubgroup (Fin d →₀ ℤ) n ≃+
      (Fin d → ZMod n) := by
  rw [← finsuppModHom_ker d n]
  exact QuotientAddGroup.quotientKerEquivOfSurjective
    (finsuppModHom d n)
    (finsuppModHom_surjective d n)
 

noncomputable def multiplicativeFinsuppNthPowerQuotientEquivPiZMod
    (d n : ℕ) :
    Multiplicative (Fin d →₀ ℤ) ⧸
        (powMonoidHom n :
          Multiplicative (Fin d →₀ ℤ) →*
            Multiplicative (Fin d →₀ ℤ)).range ≃*
      Multiplicative (Fin d → ZMod n) := by
  rw [
    LocalFieldTheory.powMonoidHom_range_multiplicative_eq_nsmulAddSubgroup_toSubgroup]
  exact (finsuppNsmulQuotientEquivPiZMod d n).toMultiplicative
 

noncomputable instance finite_finsupp_nsmulQuotient
    (d : ℕ) (n : ℕ+) :
    Finite
      ((Fin d →₀ ℤ) ⧸
        LocalFieldTheory.nsmulAddSubgroup
          (Fin d →₀ ℤ) (n : ℕ)) := by
  let _ : NeZero (n : ℕ) := ⟨n.ne_zero⟩
  exact Finite.of_equiv
    (Fin d → ZMod (n : ℕ))
    (finsuppNsmulQuotientEquivPiZMod d n).symm
 
theorem card_finsupp_nsmulQuotient
    (d : ℕ) (n : ℕ+) :
    Nat.card
        ((Fin d →₀ ℤ) ⧸
          LocalFieldTheory.nsmulAddSubgroup
            (Fin d →₀ ℤ) (n : ℕ)) =
      (n : ℕ) ^ d := by
  let _ : NeZero (n : ℕ) := ⟨n.ne_zero⟩
  rw [Nat.card_congr
    (finsuppNsmulQuotientEquivPiZMod d n).toEquiv,
    Nat.card_pi]
  simp
omit [NumberField K] in
 

theorem n_dvd_numberField_torsionOrder
    (n : ℕ+)
    (hmu : (primitiveRoots (n : ℕ) K).Nonempty) :
    (n : ℕ) ∣ NumberField.Units.torsionOrder K := by
  let _ : NeZero (n : ℕ) := ⟨n.ne_zero⟩
  obtain ⟨ζ, hζ⟩ := hmu
  have hζprim : IsPrimitiveRoot ζ (n : ℕ) :=
    (mem_primitiveRoots n.pos).mp hζ
  let ζO : 𝓞 K := hζprim.toInteger
  have hζOprim : IsPrimitiveRoot ζO (n : ℕ) :=
    hζprim.toInteger_isPrimitiveRoot
  let hu : IsUnit ζO := hζOprim.isUnit n.ne_zero
  let u : (𝓞 K)ˣ := hu.unit
  have huval : (u : 𝓞 K) = ζO :=
    hu.unit_spec
  have huprim : IsPrimitiveRoot u (n : ℕ) := by
    rw [← IsPrimitiveRoot.coe_units_iff, huval]
    exact hζOprim
  have hutorsion : u ∈ NumberField.Units.torsion K := by
    rw [NumberField.Units.torsion,
      CommGroup.mem_torsion,
      isOfFinOrder_iff_pow_eq_one]
    exact ⟨n, n.pos, huprim.pow_eq_one⟩
  let ut : NumberField.Units.torsion K :=
    ⟨u, hutorsion⟩
  have hutprim : IsPrimitiveRoot ut (n : ℕ) := by
    rw [← IsPrimitiveRoot.coe_submonoidClass_iff]
    exact huprim
  rw [NumberField.Units.torsionOrder,
    hutprim.eq_orderOf]
  exact orderOf_dvd_natCard ut
include numberFieldK in
 

theorem card_numberField_torsion_nthPowerQuotient
    (n : ℕ+)
    (hmu : (primitiveRoots (n : ℕ) K).Nonempty) :
    Nat.card
        (NumberField.Units.torsion K ⧸
          (powMonoidHom (n : ℕ) :
            NumberField.Units.torsion K →*
              NumberField.Units.torsion K).range) =
      (n : ℕ) := by
  let T := NumberField.Units.torsion K
  let P :=
    (powMonoidHom (n : ℕ) : T →* T).range
  have hcardP :
      Nat.card P =
        Nat.card T / (Nat.card T).gcd (n : ℕ) := by
    exact IsCyclic.card_powMonoidHom_range T (n : ℕ)
  have hgcd_dvd : (Nat.card T).gcd (n : ℕ) ∣ Nat.card T :=
    Nat.gcd_dvd_left _ _
  have hcard_factor :
      (Nat.card T).gcd (n : ℕ) *
          (Nat.card T / (Nat.card T).gcd (n : ℕ)) =
        Nat.card T :=
    Nat.mul_div_cancel' hgcd_dvd
  have hquotient :
      Nat.card (T ⧸ P) *
          (Nat.card T / (Nat.card T).gcd (n : ℕ)) =
        Nat.card T := by
    rw [← hcardP]
    exact (Subgroup.card_eq_card_quotient_mul_card_subgroup P).symm
  have hfactor_pos :
      0 < Nat.card T / (Nat.card T).gcd (n : ℕ) := by
    rw [Nat.div_pos_iff]
    have hTpos : 0 < Nat.card T := Nat.card_pos
    exact ⟨Nat.gcd_pos_of_pos_left _ hTpos,
      Nat.gcd_le_left (m := Nat.card T) (n : ℕ) hTpos⟩
  have hcard :
      Nat.card (T ⧸ P) =
        (Nat.card T).gcd (n : ℕ) := by
    exact Nat.eq_of_mul_eq_mul_right hfactor_pos
      (hquotient.trans hcard_factor.symm)
  change Nat.card (T ⧸ P) = (n : ℕ)
  rw [hcard, Nat.gcd_eq_right]
  simpa [T, NumberField.Units.torsionOrder] using
    n_dvd_numberField_torsionOrder (K := K) n hmu
 

noncomputable def numberFieldTorsionNthPowerQuotientEquivZMod
    (n : ℕ+)
    (hmu : (primitiveRoots (n : ℕ) K).Nonempty) :
    NumberField.Units.torsion K ⧸
        (powMonoidHom (n : ℕ) :
          NumberField.Units.torsion K →*
            NumberField.Units.torsion K).range ≃*
      Multiplicative (ZMod (n : ℕ)) := by
  letI : IsCyclic
      (NumberField.Units.torsion K ⧸
        (powMonoidHom (n : ℕ) :
          NumberField.Units.torsion K →*
            NumberField.Units.torsion K).range) :=
    isCyclic_of_surjective
      (QuotientGroup.mk'
        (powMonoidHom (n : ℕ) :
          NumberField.Units.torsion K →*
            NumberField.Units.torsion K).range)
      (QuotientGroup.mk'_surjective _)
  apply mulEquivOfCyclicCardEq
  rw [card_numberField_torsion_nthPowerQuotient
    (K := K) n hmu]
  simp
 
noncomputable instance finite_sUnit_nthPowerQuotient
    (S : Finset (HeightOneSpectrum (𝓞 K))) (n : ℕ+) :
    Finite
      (SUnitGroup (K := K) S ⧸
        (powMonoidHom (n : ℕ) :
          SUnitGroup (K := K) S →*
            SUnitGroup (K := K) S).range) := by
  apply LocalFieldTheory.finite_nthPowerQuotient_of_mulEquiv
    (SUnitGroup (K := K) S)
    (NumberField.Units.torsion K ×
      Multiplicative
        (Fin (SUnitGroup.logRank (K := K) S) →₀ ℤ))
    (n : ℕ)
    (SUnitGroup.decomposition (K := K) S)
 



theorem card_sUnit_nthPowerQuotient
    (S : Finset (HeightOneSpectrum (𝓞 K)))
    (n : ℕ+)
    (hmu : (primitiveRoots (n : ℕ) K).Nonempty) :
    Nat.card
        (SUnitGroup (K := K) S ⧸
          (powMonoidHom (n : ℕ) :
            SUnitGroup (K := K) S →*
              SUnitGroup (K := K) S).range) =
      (n : ℕ) ^ totalPlaceCard (K := K) S := by
  let F :=
    Fin (SUnitGroup.logRank (K := K) S) →₀ ℤ
  let _ : NeZero (n : ℕ) := ⟨n.ne_zero⟩
  have hfree :
      Nat.card
          (Multiplicative F ⧸
            (powMonoidHom (n : ℕ) :
              Multiplicative F →* Multiplicative F).range) =
        (n : ℕ) ^ SUnitGroup.logRank (K := K) S := by
    have htransport :=
      LocalFieldTheory.card_multiplicative_nthPowerQuotient_eq_additive_nsmulQuotient
        F (n : ℕ)
    rw [htransport]
    exact card_finsupp_nsmulQuotient
      (SUnitGroup.logRank (K := K) S) n
  have hplace :
      totalPlaceCard (K := K) S =
        SUnitGroup.logRank (K := K) S + 1 := by
    unfold totalPlaceCard SUnitGroup.logRank
    have hinfinite :
        0 < Fintype.card (InfinitePlace K) :=
      Fintype.card_pos
    omega
  calc
    Nat.card
        (SUnitGroup (K := K) S ⧸
          (powMonoidHom (n : ℕ) :
            SUnitGroup (K := K) S →*
              SUnitGroup (K := K) S).range) =
        Nat.card
          ((NumberField.Units.torsion K × Multiplicative F) ⧸
            (powMonoidHom (n : ℕ) :
              NumberField.Units.torsion K × Multiplicative F →*
                NumberField.Units.torsion K ×
                  Multiplicative F).range) := by
      exact Nat.card_congr
        (LocalFieldTheory.nthPowerQuotientEquivOfMulEquiv
          (SUnitGroup (K := K) S)
          (NumberField.Units.torsion K × Multiplicative F)
          (n : ℕ)
          (SUnitGroup.decomposition (K := K) S)).toEquiv
    _ =
        Nat.card
          ((NumberField.Units.torsion K ⧸
              (powMonoidHom (n : ℕ) :
                NumberField.Units.torsion K →*
                  NumberField.Units.torsion K).range) ×
            (Multiplicative F ⧸
              (powMonoidHom (n : ℕ) :
                Multiplicative F →* Multiplicative F).range)) := by
      exact Nat.card_congr
        (LocalFieldTheory.nthPowerProductQuotientEquiv
          (NumberField.Units.torsion K) (Multiplicative F)
          (n : ℕ)).toEquiv
    _ =
        (n : ℕ) *
          (n : ℕ) ^ SUnitGroup.logRank (K := K) S := by
      rw [Nat.card_prod,
        card_numberField_torsion_nthPowerQuotient (K := K) n hmu,
        hfree]
    _ = (n : ℕ) ^ totalPlaceCard (K := K) S := by
      rw [hplace, pow_succ']
 

noncomputable def sUnitNthPowerQuotientCoordinates
    (S : Finset (HeightOneSpectrum (𝓞 K)))
    (n : ℕ+)
    (hmu : (primitiveRoots (n : ℕ) K).Nonempty) :
    SUnitGroup (K := K) S ⧸
        (powMonoidHom (n : ℕ) :
          SUnitGroup (K := K) S →*
            SUnitGroup (K := K) S).range ≃*
      Multiplicative (ZMod (n : ℕ)) ×
        Multiplicative
          (Fin (SUnitGroup.logRank (K := K) S) →
            ZMod (n : ℕ)) :=
  (LocalFieldTheory.nthPowerQuotientEquivOfMulEquiv
      (SUnitGroup (K := K) S)
      (NumberField.Units.torsion K ×
        Multiplicative
          (Fin (SUnitGroup.logRank (K := K) S) →₀ ℤ))
      (n : ℕ)
      (SUnitGroup.decomposition (K := K) S)).trans <|
    (LocalFieldTheory.nthPowerProductQuotientEquiv
      (NumberField.Units.torsion K)
      (Multiplicative
        (Fin (SUnitGroup.logRank (K := K) S) →₀ ℤ))
      (n : ℕ)).trans <|
      MulEquiv.prodCongr
        (numberFieldTorsionNthPowerQuotientEquivZMod
          (K := K) n hmu)
        (multiplicativeFinsuppNthPowerQuotientEquivPiZMod
          (SUnitGroup.logRank (K := K) S) (n : ℕ))
 


theorem mem_sUnitGroup_of_pow_mem
    (S : Finset (HeightOneSpectrum (𝓞 K)))
    (n : ℕ+) (x : Kˣ)
    (hx : x ^ (n : ℕ) ∈ SUnitGroup (K := K) S) :
    x ∈ SUnitGroup (K := K) S := by
  rw [mem_SUnitGroup_iff] at hx ⊢
  intro v hv
  have hpow := hx v hv
  change
    v.valuation K (((x : Kˣ) : K) ^ (n : ℕ)) = 1
      at hpow
  rw [map_pow] at hpow
  exact
    (pow_eq_one_iff_left
      (a := v.valuation K ((x : Kˣ) : K)) n.ne_zero).mp hpow
 




def fullSUnitKummerSubgroup
    (n : ℕ+)
    (S : Finset (HeightOneSpectrum (𝓞 K))) :
    KummerTheory.KummerSubgroup K n :=
  ⟨SUnitGroup (K := K) S ⊔
      KummerTheory.unitNthPowersSubgroup K n,
    le_sup_right⟩
 
def sUnitToFullSUnitKummerSubgroup
    (n : ℕ+)
    (S : Finset (HeightOneSpectrum (𝓞 K))) :
    SUnitGroup (K := K) S →*
      (fullSUnitKummerSubgroup (K := K) n S).1 :=
  Subgroup.inclusion le_sup_left
 

def sUnitToFullSUnitRadicalQuotient
    (n : ℕ+)
    (S : Finset (HeightOneSpectrum (𝓞 K))) :
    SUnitGroup (K := K) S →*
      KummerTheory.RestrictedRadicalQuotient
        n (fullSUnitKummerSubgroup (K := K) n S) :=
  (KummerTheory.restrictedRadicalQuotientMk
      n (fullSUnitKummerSubgroup (K := K) n S)).comp
    (sUnitToFullSUnitKummerSubgroup (K := K) n S)
 
theorem nthPowerSubgroup_le_ker_sUnitToFullSUnitRadicalQuotient
    (n : ℕ+)
    (S : Finset (HeightOneSpectrum (𝓞 K))) :
    (powMonoidHom (n : ℕ) :
        SUnitGroup (K := K) S →*
          SUnitGroup (K := K) S).range ≤
      MonoidHom.ker
        (sUnitToFullSUnitRadicalQuotient (K := K) n S) := by
  intro x hx
  obtain ⟨y, hy⟩ :=
    (MonoidHom.mem_range
      (G := SUnitGroup (K := K) S)).mp hx
  rw [powMonoidHom_apply] at hy
  subst x
  rw [MonoidHom.mem_ker, map_pow]
  apply
    (KummerTheory.restrictedRadicalQuotientMk_eq_one_iff
      n (fullSUnitKummerSubgroup (K := K) n S) _).2
  exact
    (KummerTheory.mem_restrictedNthPowersSubgroup_iff
      n (fullSUnitKummerSubgroup (K := K) n S)).2
      ⟨(y : Kˣ), rfl⟩
 


def sUnitNthPowerQuotientToFullSUnitRadicalQuotient
    (n : ℕ+)
    (S : Finset (HeightOneSpectrum (𝓞 K))) :
    SUnitGroup (K := K) S ⧸
        (powMonoidHom (n : ℕ) :
          SUnitGroup (K := K) S →*
            SUnitGroup (K := K) S).range →*
      KummerTheory.RestrictedRadicalQuotient
        n (fullSUnitKummerSubgroup (K := K) n S) :=
  QuotientGroup.lift
    (powMonoidHom (n : ℕ) :
      SUnitGroup (K := K) S →*
        SUnitGroup (K := K) S).range
    (sUnitToFullSUnitRadicalQuotient (K := K) n S)
    (nthPowerSubgroup_le_ker_sUnitToFullSUnitRadicalQuotient
      (K := K) n S)
 
theorem sUnitNthPowerQuotientToFullSUnitRadicalQuotient_surjective
    (n : ℕ+)
    (S : Finset (HeightOneSpectrum (𝓞 K))) :
    Function.Surjective
      (sUnitNthPowerQuotientToFullSUnitRadicalQuotient
        (K := K) n S) := by
  intro q
  obtain ⟨x, rfl⟩ :=
    KummerTheory.restrictedRadicalQuotientMk_surjective
      n (fullSUnitKummerSubgroup (K := K) n S) q
  obtain ⟨y, hy, z, hz, hyz⟩ :=
    Subgroup.mem_sup.1 x.property
  let yS : SUnitGroup (K := K) S := ⟨y, hy⟩
  refine
    ⟨QuotientGroup.mk'
        (powMonoidHom (n : ℕ) :
          SUnitGroup (K := K) S →*
            SUnitGroup (K := K) S).range yS, ?_⟩
  change
    KummerTheory.restrictedRadicalQuotientMk
        n (fullSUnitKummerSubgroup (K := K) n S)
        (sUnitToFullSUnitKummerSubgroup (K := K) n S yS) =
      KummerTheory.restrictedRadicalQuotientMk
        n (fullSUnitKummerSubgroup (K := K) n S) x
  apply
    (KummerTheory.restrictedRadicalQuotientMk_eq_iff
      n (fullSUnitKummerSubgroup (K := K) n S) _ _).2
  change y / x.1 ∈ KummerTheory.unitNthPowersSubgroup K n
  rw [← hyz]
  simpa using
    (KummerTheory.unitNthPowersSubgroup K n).inv_mem hz
 


theorem sUnitNthPowerQuotientToFullSUnitRadicalQuotient_injective
    (n : ℕ+)
    (S : Finset (HeightOneSpectrum (𝓞 K))) :
    Function.Injective
      (sUnitNthPowerQuotientToFullSUnitRadicalQuotient
        (K := K) n S) := by
  intro q r hqr
  induction q using QuotientGroup.induction_on' with
  | _ x =>
      induction r using QuotientGroup.induction_on' with
      | _ y =>
          apply (QuotientGroup.eq_iff_div_mem).2
          have hglobal :
              ((x : Kˣ) / (y : Kˣ)) ∈
                KummerTheory.unitNthPowersSubgroup K n := by
            have hrestricted :=
              (KummerTheory.restrictedRadicalQuotientMk_eq_iff
                n (fullSUnitKummerSubgroup (K := K) n S) _ _).1 hqr
            exact
              (KummerTheory.mem_restrictedNthPowersSubgroup_iff
                n (fullSUnitKummerSubgroup (K := K) n S)).1 hrestricted
          obtain ⟨z, hz⟩ :=
            (KummerTheory.mem_unitNthPowersSubgroup_iff n).mp hglobal
          have hzpow :
              z ^ (n : ℕ) ∈ SUnitGroup (K := K) S := by
            rw [hz]
            exact (SUnitGroup (K := K) S).div_mem x.property y.property
          let zS : SUnitGroup (K := K) S :=
            ⟨z, mem_sUnitGroup_of_pow_mem (K := K) S n z hzpow⟩
          apply
            (MonoidHom.mem_range
              (G := SUnitGroup (K := K) S)).2
          refine ⟨zS, ?_⟩
          rw [powMonoidHom_apply]
          apply Subtype.ext
          exact hz
 

noncomputable def sUnitNthPowerQuotientEquivFullSUnitRadicalQuotient
    (n : ℕ+)
    (S : Finset (HeightOneSpectrum (𝓞 K))) :
    SUnitGroup (K := K) S ⧸
        (powMonoidHom (n : ℕ) :
          SUnitGroup (K := K) S →*
            SUnitGroup (K := K) S).range ≃*
      KummerTheory.RestrictedRadicalQuotient
        n (fullSUnitKummerSubgroup (K := K) n S) :=
  MulEquiv.ofBijective
    (sUnitNthPowerQuotientToFullSUnitRadicalQuotient
      (K := K) n S)
    ⟨sUnitNthPowerQuotientToFullSUnitRadicalQuotient_injective
        (K := K) n S,
      sUnitNthPowerQuotientToFullSUnitRadicalQuotient_surjective
        (K := K) n S⟩
 
noncomputable instance finite_fullSUnitRadicalQuotient
    (n : ℕ+)
    (S : Finset (HeightOneSpectrum (𝓞 K))) :
    Finite
      (KummerTheory.RestrictedRadicalQuotient
        n (fullSUnitKummerSubgroup (K := K) n S)) :=
  Finite.of_equiv
    (SUnitGroup (K := K) S ⧸
      (powMonoidHom (n : ℕ) :
        SUnitGroup (K := K) S →*
          SUnitGroup (K := K) S).range)
    (sUnitNthPowerQuotientEquivFullSUnitRadicalQuotient
      (K := K) n S)
 
theorem card_fullSUnitRadicalQuotient
    (n : ℕ+)
    (S : Finset (HeightOneSpectrum (𝓞 K)))
    (hmu : (primitiveRoots (n : ℕ) K).Nonempty) :
    Nat.card
        (KummerTheory.RestrictedRadicalQuotient
          n (fullSUnitKummerSubgroup (K := K) n S)) =
      (n : ℕ) ^ totalPlaceCard (K := K) S := by
  rw [← card_sUnit_nthPowerQuotient (K := K) S n hmu]
  exact Nat.card_congr
    (sUnitNthPowerQuotientEquivFullSUnitRadicalQuotient
      (K := K) n S).symm.toEquiv
end KummerTheory
end
end

/- GaloisCohomology.Kummer.Concrete.SUnitPreparation.PrimePowerKernelCoordinates -/
section
open scoped Classical IsMulCommutative
noncomputable section
namespace KummerTheory
 


theorem zmodPrimePower_isLocalRing
    (p v : ℕ) (hp : p.Prime) (hv : 0 < v) :
    IsLocalRing (ZMod (p ^ v)) := by
  let : Fact (1 < p ^ v) := ⟨by
    calc
      1 < p := hp.one_lt
      _ = p ^ 1 := (pow_one p).symm
      _ ≤ p ^ v :=
        Nat.pow_le_pow_right hp.pos
          (Nat.succ_le_iff.mpr hv)⟩
  have hmodulus : p ∣ p ^ v := by
    exact dvd_pow_self p hv.ne'
  apply IsLocalRing.of_nonunits_add
  intro a b ha hb
  have hunit (x : ZMod (p ^ v)) :
      IsUnit x ↔ ¬ p ∣ x.val := by
    constructor
    · intro hx
      apply (ZMod.isUnit_natCast_iff_not_dvd_pow hp hv).1
      simpa only [ZMod.natCast_zmod_val] using hx
    · intro hx
      have hcast :=
        (ZMod.isUnit_natCast_iff_not_dvd_pow hp hv).2 hx
      simpa only [ZMod.natCast_zmod_val] using hcast
  have ha' : p ∣ a.val := by
    change ¬ IsUnit a at ha
    exact Classical.not_not.mp
      (mt (hunit a).2 ha)
  have hb' : p ∣ b.val := by
    change ¬ IsUnit b at hb
    exact Classical.not_not.mp
      (mt (hunit b).2 hb)
  have hsum : p ∣ a.val + b.val :=
    dvd_add ha' hb'
  have hmultiple :
      p ∣ p ^ v * ((a.val + b.val) / p ^ v) :=
    dvd_mul_of_dvd_left hmodulus _
  have hrem :
      p ∣ (a.val + b.val) % p ^ v := by
    apply (Nat.dvd_add_iff_left hmultiple).mpr
    simpa only [Nat.mod_add_div] using hsum
  change ¬ IsUnit (a + b)
  intro hab
  apply (hunit (a + b)).1 hab
  rw [ZMod.val_add]
  exact hrem
 


theorem free_ker_of_surjective_linearMap_of_isLocalRing
    {R M N : Type*} [CommRing R] [IsLocalRing R]
    [AddCommGroup M] [AddCommGroup N]
    [Module R M] [Module R N]
    [Module.Free R M] [Module.Free R N]
    [Finite M]
    (f : M →ₗ[R] N) (hf : Function.Surjective f) :
    Module.Free R (LinearMap.ker f) := by
  obtain ⟨sec, hsec⟩ :=
    Module.projective_lifting_property
      f LinearMap.id hf
  let q : M →ₗ[R] M :=
    LinearMap.id - sec.comp f
  have hq (x : M) : q x ∈ LinearMap.ker f := by
    rw [LinearMap.mem_ker]
    change f (x - sec (f x)) = 0
    rw [map_sub]
    have hsec_apply :
        f (sec (f x)) = f x := by
      have :=
        DFunLike.congr_fun hsec (f x)
      simpa using this
    rw [hsec_apply, sub_self]
  let projection : M →ₗ[R] LinearMap.ker f :=
    LinearMap.codRestrict (LinearMap.ker f) q hq
  have hprojection :
      projection.comp (LinearMap.ker f).subtype =
        LinearMap.id := by
    ext x
    change x.1 - sec (f x.1) = x.1
    rw [show f x.1 = 0 from x.2]
    simp
  let : Module.Projective R (LinearMap.ker f) :=
    Module.Projective.of_split
      (LinearMap.ker f).subtype projection hprojection
  let : Module.Finite R (LinearMap.ker f) :=
    Module.Finite.of_finite
  exact Module.free_of_flat_of_isLocalRing
 

theorem card_eq_card_pow_card_chooseBasisIndex
    {R M : Type*} [Semiring R]
    [AddCommMonoid M] [Module R M]
    [Module.Free R M] [Finite R] [Finite M] :
    Nat.card M =
      Nat.card R ^
        Fintype.card (Module.Free.ChooseBasisIndex R M) := by
  let : Fintype R :=
    Fintype.ofFinite R
  let : Fintype M :=
    Fintype.ofFinite M
  let : Module.Finite R M :=
    Module.Finite.of_finite
  rw [Nat.card_congr
    (Module.Free.chooseBasis R M).repr.toEquiv]
  simp only [Nat.card_eq_fintype_card,
    Fintype.card_finsupp]
 

noncomputable def additiveCoordinatesLinearEquiv
    {G A B : Type*} [CommGroup G] [AddCommGroup A]
    [AddCommGroup B] (n : ℕ)
    [Module (ZMod n) (Additive G)]
    [Module (ZMod n) A] [Module (ZMod n) B]
    (e : G ≃* Multiplicative A × Multiplicative B) :
    Additive G ≃ₗ[ZMod n] A × B := by
  let eAdd : Additive G ≃+ A × B :=
    MulEquiv.toAdditiveLeft e
  exact
  { eAdd with
    map_smul' := by
      simpa using ZMod.map_smul eAdd }
 

noncomputable abbrev additiveZModModuleOfPowEqOne
    {G : Type*} [CommGroup G] (n : ℕ)
    (h : ∀ g : G, g ^ n = 1) :
    Module (ZMod n) (Additive G) :=
  AddCommGroup.zmodModule <| by
    intro x
    apply Additive.toMul.injective
    simpa using h (Additive.toMul x)
 

noncomputable def additivePiLinearEquiv
    {G A : Type*} [CommGroup G] [AddCommGroup A]
    {ι : Type*} (n : ℕ)
    [Module (ZMod n) (Additive G)]
    [Module (ZMod n) A]
    (e : G ≃* (ι → Multiplicative A)) :
    Additive G ≃ₗ[ZMod n] (ι → A) := by
  let eAdd : Additive G ≃+ (ι → A) :=
    MulEquiv.toAdditiveLeft e
  exact
  { eAdd with
    map_smul' := by
      simpa using ZMod.map_smul eAdd }
 

noncomputable def monoidKerEquivMultiplicativeLinearKer
    {G H : Type*} [CommGroup G] [CommGroup H]
    (n : ℕ)
    [Module (ZMod n) (Additive G)]
    [Module (ZMod n) (Additive H)]
    (f : G →* H) :
    f.ker ≃*
      Multiplicative
        (LinearMap.ker
          (f.toAdditive.toZModLinearMap n)) where
  toFun x :=
    Multiplicative.ofAdd
      ⟨Additive.ofMul x.1, by
        rw [LinearMap.mem_ker]
        apply Additive.toMul.injective
        exact x.2⟩
  invFun x :=
    ⟨Additive.toMul (Multiplicative.toAdd x).1, by
      change f (Additive.toMul (Multiplicative.toAdd x).1) = 1
      have hx := (Multiplicative.toAdd x).2
      rw [LinearMap.mem_ker] at hx
      exact congrArg Additive.toMul hx⟩
  left_inv x := by
    apply Subtype.ext
    rfl
  right_inv x := by
    apply Multiplicative.toAdd.injective
    apply Subtype.ext
    rfl
  map_mul' x y := by
    apply Multiplicative.toAdd.injective
    apply Subtype.ext
    rfl
 


theorem exists_kernelMulEquiv_pi_zmod_of_primePower
    {G H : Type*} [CommGroup G] [CommGroup H]
    (n p v q : ℕ)
    (hp : p.Prime) (hv : 0 < v)
    (hn : n = p ^ v)
    [Module (ZMod n) (Additive G)]
    [Module (ZMod n) (Additive H)]
    (freeG : Module.Free (ZMod n) (Additive G))
    (freeH : Module.Free (ZMod n) (Additive H))
    [Finite G]
    (f : G →* H) (hf : Function.Surjective f)
    (hcard : Nat.card f.ker = n ^ q) :
    Nonempty
      (f.ker ≃*
        (Fin q → Multiplicative (ZMod n))) := by
  have hn_one : 1 < n := by
    rw [hn]
    calc
      1 < p := hp.one_lt
      _ = p ^ 1 := (pow_one p).symm
      _ ≤ p ^ v :=
        Nat.pow_le_pow_right hp.pos
          (Nat.succ_le_iff.mpr hv)
  let : Module.Free (ZMod n) (Additive G) :=
    freeG
  let : Module.Free (ZMod n) (Additive H) :=
    freeH
  let : NeZero n := ⟨by omega⟩
  let : IsLocalRing (ZMod n) := by
    rw [hn]
    exact zmodPrimePower_isLocalRing p v hp hv
  let fLinear :
      Additive G →ₗ[ZMod n] Additive H :=
    f.toAdditive.toZModLinearMap n
  have hfLinear :
      Function.Surjective fLinear := by
    intro y
    obtain ⟨x, hx⟩ := hf (Additive.toMul y)
    refine ⟨Additive.ofMul x, ?_⟩
    apply Additive.toMul.injective
    exact hx
  let : Module.Free (ZMod n)
      (LinearMap.ker fLinear) :=
    free_ker_of_surjective_linearMap_of_isLocalRing
      fLinear hfLinear
  let : Module.Finite (ZMod n)
      (LinearMap.ker fLinear) :=
    Module.Finite.of_finite
  let I :=
    Module.Free.ChooseBasisIndex
      (ZMod n) (LinearMap.ker fLinear)
  let b₀ :=
    Module.Free.chooseBasis
      (ZMod n) (LinearMap.ker fLinear)
  have hlinearCard :
      Nat.card (LinearMap.ker fLinear) = n ^ q := by
    calc
      Nat.card (LinearMap.ker fLinear) =
          Nat.card (Multiplicative
            (LinearMap.ker fLinear)) := rfl
      _ = Nat.card f.ker :=
        Nat.card_congr
          (monoidKerEquivMultiplicativeLinearKer
            n f).symm.toEquiv
      _ = n ^ q := hcard
  have hbasisCard :
      Nat.card (LinearMap.ker fLinear) =
        n ^ Fintype.card I := by
    simpa only [Nat.card_zmod] using
      (card_eq_card_pow_card_chooseBasisIndex
        (R := ZMod n)
        (M := LinearMap.ker fLinear))
  have hI : Fintype.card I = q := by
    apply Nat.pow_right_injective hn_one
    exact hbasisCard.symm.trans hlinearCard
  let eI : I ≃ Fin q :=
    (Fintype.equivFin I).trans (finCongr hI)
  let b := b₀.reindex eI
  exact ⟨
    (monoidKerEquivMultiplicativeLinearKer n f).trans <|
      b.repr.toAddEquiv.toMultiplicative |>.trans <|
        (Finsupp.addEquivFunOnFinite).toMultiplicative |>.trans
          (MulEquiv.refl _)⟩
 

local instance coordinateGaloisGroup {D M:Type*} [Field D] [Field M] [Algebra D M] : Group Gal(M/D) := AlgEquiv.aut

private theorem powEqOneOfZMod {G:Type*} [Group G] (n:ℕ+) (r:ℕ)
    (eG:G ≃* (Fin r → Multiplicative (ZMod (n:ℕ)))) (sigma:G) : sigma^(n:ℕ)=1 := by
  apply eG.injective
  rw [map_pow,map_one]
  ext i
  apply Multiplicative.toAdd.injective
  change (n:ℕ) • Multiplicative.toAdd (eG sigma i)=0
  simp

theorem galois_pow_eq_one_of_equiv_pi_zmod
    {K Omega : Type*} [Field K] [Field Omega] [Algebra K Omega]
    (E : IntermediateField K Omega)
    (n : ℕ+) (r : ℕ)
    (eG :
      (E ≃ₐ[K] E) ≃*
        (Fin r → Multiplicative (ZMod (n : ℕ))))
    (sigma : E ≃ₐ[K] E) :
    sigma ^ (n : ℕ) = AlgEquiv.refl := powEqOneOfZMod n r eG sigma
end KummerTheory
end
end

/- ClassFieldTheory.KummerTheory.Concrete.SUnitPreparation.FullSUnitKummerExtension -/
section
open scoped NumberField Classical IsMulCommutative NNReal ValuativeRel
open NumberField IsDedekindDomain
open LocalFieldTheory
noncomputable section
namespace KummerTheory
variable {K : Type*} [Field K]
    [numberFieldK : NumberField K]
 
def fullSUnitKummerExtension
    {Omega : Type*} [Field Omega] [Algebra K Omega]
    (n : ℕ+)
    (S : Finset (HeightOneSpectrum (𝓞 K))) :
    IntermediateField K Omega :=
  KummerTheory.kummerRadicalExtension
    (K := K) (Omega := Omega) n
    (fullSUnitKummerSubgroup (K := K) n S).1
 
theorem fullSUnitKummerExtension_isGalois
    {Omega : Type*} [Field Omega] [Algebra K Omega]
    [IsSepClosure K Omega]
    (n : ℕ+)
    (S : Finset (HeightOneSpectrum (𝓞 K))) :
    IsGalois K
      (fullSUnitKummerExtension (K := K) (Omega := Omega) n S) :=
  KummerTheory.kummerRadicalExtension_isGalois n
    (fullSUnitKummerSubgroup (K := K) n S).1
 
theorem finite_fullSUnitKummerExtension_galois
    {Omega : Type*} [Field Omega] [Algebra K Omega]
    [IsSepClosure K Omega]
    (n : ℕ+) (hn : ((n : ℕ) : K) ≠ 0)
    (hmu : (primitiveRoots (n : ℕ) K).Nonempty)
    (S : Finset (HeightOneSpectrum (𝓞 K))) :
    Finite
      Gal(fullSUnitKummerExtension
        (K := K) (Omega := Omega) n S/K) := by
  let _ : NeZero (n : ℕ) := ⟨n.ne_zero⟩
  let E :=
    fullSUnitKummerExtension (K := K) (Omega := Omega) n S
  let Q :=
    KummerTheory.RestrictedRadicalQuotient
      n (fullSUnitKummerSubgroup (K := K) n S)
  let _ : Finite Q :=
    finite_fullSUnitRadicalQuotient (K := K) n S
  let _ : Finite (Q →* KummerTheory.nthRootsSubgroup E (n : ℕ)) :=
    Finite.of_injective
      (fun chi : Q →* KummerTheory.nthRootsSubgroup E (n : ℕ) =>
        (chi : Q → KummerTheory.nthRootsSubgroup E (n : ℕ)))
      DFunLike.coe_injective
  let e :
      Gal(E/K) ≃*
        (Q →* KummerTheory.nthRootsSubgroup E (n : ℕ)) :=
    KummerTheory.kummerRadicalExtensionRestrictedTransposeMulEquiv
      n hn hmu (fullSUnitKummerSubgroup (K := K) n S)
  exact Finite.of_equiv
    (Q →* KummerTheory.nthRootsSubgroup E (n : ℕ))
    e.symm.toEquiv
 
theorem fullSUnitKummerExtension_finiteDimensional
    {Omega : Type*} [Field Omega] [Algebra K Omega]
    [IsSepClosure K Omega]
    (n : ℕ+) (hn : ((n : ℕ) : K) ≠ 0)
    (hmu : (primitiveRoots (n : ℕ) K).Nonempty)
    (S : Finset (HeightOneSpectrum (𝓞 K))) :
    FiniteDimensional K
      (fullSUnitKummerExtension
        (K := K) (Omega := Omega) n S) := by
  let E :=
    fullSUnitKummerExtension (K := K) (Omega := Omega) n S
  let _ : IsGalois K E :=
    fullSUnitKummerExtension_isGalois
      (K := K) (Omega := Omega) n S
  let _ : Finite Gal(E/K) :=
    finite_fullSUnitKummerExtension_galois
      (K := K) (Omega := Omega) n hn hmu S
  exact IsGalois.finiteDimensional_of_finite K E
 
theorem card_fullSUnitKummerExtension_galois
    {Omega : Type*} [Field Omega] [Algebra K Omega]
    [IsSepClosure K Omega]
    (n : ℕ+) (hn : ((n : ℕ) : K) ≠ 0)
    (hmu : (primitiveRoots (n : ℕ) K).Nonempty)
    (S : Finset (HeightOneSpectrum (𝓞 K))) :
    Nat.card
        Gal(fullSUnitKummerExtension
          (K := K) (Omega := Omega) n S/K) =
      (n : ℕ) ^ totalPlaceCard (K := K) S := by
  let _ : NeZero (n : ℕ) := ⟨n.ne_zero⟩
  let E :=
    fullSUnitKummerExtension (K := K) (Omega := Omega) n S
  let Q :=
    KummerTheory.RestrictedRadicalQuotient
      n (fullSUnitKummerSubgroup (K := K) n S)
  let e :
      Gal(E/K) ≃*
        (Q →* KummerTheory.nthRootsSubgroup E (n : ℕ)) :=
    KummerTheory.kummerRadicalExtensionRestrictedTransposeMulEquiv
      n hn hmu (fullSUnitKummerSubgroup (K := K) n S)
  obtain ⟨dual⟩ :=
    KummerTheory.finiteNthRootsCharacterDuality
      (G := Q) (K := K) (L := E) n hmu
      (KummerTheory.restrictedRadicalQuotient_pow_eq_one
        n (fullSUnitKummerSubgroup (K := K) n S))
  calc
    Nat.card Gal(E/K) =
        Nat.card (Q →* KummerTheory.nthRootsSubgroup E (n : ℕ)) :=
      Nat.card_congr e.toEquiv
    _ = Nat.card Q := Nat.card_congr dual.toEquiv
    _ = (n : ℕ) ^ totalPlaceCard (K := K) S :=
      card_fullSUnitRadicalQuotient (K := K) n S hmu
 

local instance coordinateFullGroup {D M:Type*} [Field D] [Field M] [Algebra D M] : Group Gal(M/D) := AlgEquiv.aut

theorem fullSUnitKummerExtension_galois_pow_eq_one
    {Omega : Type*} [Field Omega] [Algebra K Omega]
    [IsSepClosure K Omega]
    (n : ℕ+)
    (hmu : (primitiveRoots (n : ℕ) K).Nonempty)
    (S : Finset (HeightOneSpectrum (𝓞 K)))
    (sigma :
      Gal(fullSUnitKummerExtension
        (K := K) (Omega := Omega) n S/K)) :
    sigma ^ (n : ℕ) = AlgEquiv.refl :=
  KummerTheory.kummerRadicalExtension_galois_pow_eq_one
    n hmu (fullSUnitKummerSubgroup (K := K) n S).1 sigma
 

noncomputable def
    chosenFullSUnitKummerExtensionGaloisEquivSUnitQuotient
    {Omega : Type*} [Field Omega] [Algebra K Omega]
    [IsSepClosure K Omega]
    (n : ℕ+) (hn : ((n : ℕ) : K) ≠ 0)
    (hmu : (primitiveRoots (n : ℕ) K).Nonempty)
    (S : Finset (HeightOneSpectrum (𝓞 K))) :
    Gal(fullSUnitKummerExtension
        (K := K) (Omega := Omega) n S/K) ≃*
      SUnitGroup (K := K) S ⧸
        (powMonoidHom (n : ℕ) :
          SUnitGroup (K := K) S →*
            SUnitGroup (K := K) S).range := by
  let Q :=
    KummerTheory.RestrictedRadicalQuotient
      n (fullSUnitKummerSubgroup (K := K) n S)
  let E :=
    fullSUnitKummerExtension
      (K := K) (Omega := Omega) n S
  let e :
      Gal(E/K) ≃*
        (Q →* KummerTheory.nthRootsSubgroup E (n : ℕ)) :=
    KummerTheory.kummerRadicalExtensionRestrictedTransposeMulEquiv
      n hn hmu (fullSUnitKummerSubgroup (K := K) n S)
  let dual :
      (Q →* KummerTheory.nthRootsSubgroup E (n : ℕ)) ≃* Q :=
    Classical.choice <|
      KummerTheory.finiteNthRootsCharacterDuality
        (G := Q) (K := K) (L := E) n hmu
        (KummerTheory.restrictedRadicalQuotient_pow_eq_one
          n (fullSUnitKummerSubgroup (K := K) n S))
  exact (e.trans dual).trans
    (sUnitNthPowerQuotientEquivFullSUnitRadicalQuotient
      (K := K) n S).symm
 

noncomputable def fullSUnitKummerExtensionGaloisCoordinates
    {Omega : Type*} [Field Omega] [Algebra K Omega]
    [IsSepClosure K Omega]
    (n : ℕ+) (hn : ((n : ℕ) : K) ≠ 0)
    (hmu : (primitiveRoots (n : ℕ) K).Nonempty)
    (S : Finset (HeightOneSpectrum (𝓞 K))) :
    Gal(fullSUnitKummerExtension
        (K := K) (Omega := Omega) n S/K) ≃*
      Multiplicative (ZMod (n : ℕ)) ×
        Multiplicative
          (Fin (SUnitGroup.logRank (K := K) S) →
            ZMod (n : ℕ)) :=
  (chosenFullSUnitKummerExtensionGaloisEquivSUnitQuotient
    (K := K) (Omega := Omega) n hn hmu S).trans
      (sUnitNthPowerQuotientCoordinates
        (K := K) S n hmu)
 

theorem fullSUnitKummerExtension_galois_moduleFree
    {Omega : Type*} [Field Omega] [Algebra K Omega]
    [IsSepClosure K Omega]
    (n : ℕ+) (hn : ((n : ℕ) : K) ≠ 0)
    (hmu : (primitiveRoots (n : ℕ) K).Nonempty)
    (S : Finset (HeightOneSpectrum (𝓞 K))) :
    letI : IsMulCommutative
        Gal(fullSUnitKummerExtension
          (K := K) (Omega := Omega) n S/K) :=
      KummerTheory.kummerRadicalExtension_isMulCommutative
        n hmu (fullSUnitKummerSubgroup (K := K) n S).1
    letI : Module (ZMod (n : ℕ))
        (Additive
          Gal(fullSUnitKummerExtension
            (K := K) (Omega := Omega) n S/K)) :=
      additiveZModModuleOfPowEqOne (n : ℕ)
        (fullSUnitKummerExtension_galois_pow_eq_one
          (K := K) (Omega := Omega) n hmu S)
    Module.Free (ZMod (n : ℕ))
      (Additive
        Gal(fullSUnitKummerExtension
          (K := K) (Omega := Omega) n S/K)) := by
  let G :=
    Gal(fullSUnitKummerExtension
      (K := K) (Omega := Omega) n S/K)
  let _ : IsMulCommutative G :=
    KummerTheory.kummerRadicalExtension_isMulCommutative
      n hmu (fullSUnitKummerSubgroup (K := K) n S).1
  let _ : Module (ZMod (n : ℕ)) (Additive G) :=
    additiveZModModuleOfPowEqOne (n : ℕ)
      (fullSUnitKummerExtension_galois_pow_eq_one
        (K := K) (Omega := Omega) n hmu S)
  let e :
      Additive G ≃ₗ[ZMod (n : ℕ)]
        ZMod (n : ℕ) ×
          (Fin (SUnitGroup.logRank (K := K) S) →
            ZMod (n : ℕ)) :=
    additiveCoordinatesLinearEquiv (n : ℕ)
      (fullSUnitKummerExtensionGaloisCoordinates
        (K := K) (Omega := Omega) n hn hmu S)
  exact Module.Free.of_equiv e.symm
end KummerTheory
end
end

/- ClassFieldTheory.KummerTheory.Concrete.SUnitPreparation.FiniteRadicalSupport -/
section
open scoped NumberField Classical IsMulCommutative NNReal ValuativeRel
open NumberField IsDedekindDomain
open LocalFieldTheory
noncomputable section
namespace KummerTheory
variable {K : Type*} [Field K]
    [numberFieldK : NumberField K]
 

def sUnitFiniteKummerRadical
    {L : Type*} [Field L] [Algebra K L]
    (n : ℕ+)
    (S : Finset (HeightOneSpectrum (𝓞 K))) :
    Subgroup Kˣ :=
  SUnitGroup (K := K) S ⊓
    KummerTheory.finiteKummerRadicalSubgroup
      (K := K) (L := L) n
 

def sUnitKummerSubgroup
    {L : Type*} [Field L] [Algebra K L]
    (n : ℕ+)
    (S : Finset (HeightOneSpectrum (𝓞 K))) :
    KummerTheory.KummerSubgroup K n :=
  ⟨sUnitFiniteKummerRadical (K := K) (L := L) n S ⊔
      KummerTheory.unitNthPowersSubgroup K n,
    le_sup_right⟩
 
theorem sUnitKummerSubgroup_le_finiteKummerRadicalSubgroup
    {L : Type*} [Field L] [Algebra K L]
    (n : ℕ+)
    (S : Finset (HeightOneSpectrum (𝓞 K))) :
    (sUnitKummerSubgroup (K := K) (L := L) n S).1 ≤
      KummerTheory.finiteKummerRadicalSubgroup
        (K := K) (L := L) n := by
  apply sup_le
  · exact inf_le_right
  · intro x hx
    obtain ⟨y, rfl⟩ :=
      (KummerTheory.mem_unitNthPowersSubgroup_iff n).mp hx
    exact
      (KummerTheory.mem_finiteKummerRadicalSubgroup_iff n).mpr
        ⟨Units.map (algebraMap K L).toMonoidHom y, by simp⟩
 
theorem sUnitGroup_mono
    {S T : Finset (HeightOneSpectrum (𝓞 K))}
    (hST : S ⊆ T) :
    SUnitGroup (K := K) S ≤ SUnitGroup (K := K) T := by
  intro x hx
  rw [mem_SUnitGroup_iff] at hx ⊢
  intro v hvT
  exact hx v (fun hvS => hvT (hST hvS))
 

noncomputable def chosenUnitFiniteSupport (x : Kˣ) :
    Finset (HeightOneSpectrum (𝓞 K)) :=
  Classical.choose
    (IdeleGroup.exists_finset_supportedAt
      (IdeleGroup.principalIdele K x))
 
theorem mem_sUnitGroup_chosenUnitFiniteSupport (x : Kˣ) :
    x ∈ SUnitGroup (K := K) (chosenUnitFiniteSupport (K := K) x) := by
  rw [mem_SUnitGroup_iff]
  intro v hv
  have hsupported :=
    Classical.choose_spec
      (IdeleGroup.exists_finset_supportedAt
        (IdeleGroup.principalIdele K x))
  have hunit :=
    (IdeleGroup.mem_supportedAt_iff
      (K := K)
      (chosenUnitFiniteSupport (K := K) x : Set _)
      (IdeleGroup.principalIdele K x)).mp hsupported v
      (by simpa using hv)
  rw [
    HeightOneSpectrum.adicCompletionIntegers.mem_units_iff_valued_eq_one]
      at hunit
  change
    Valued.v
        (((IdeleGroup.finiteComponent v
          (IdeleGroup.principalIdele K x) :
            (v.adicCompletion K)ˣ) :
          v.adicCompletion K)) = 1 at hunit
  rw [IdeleGroup.finiteComponent_principalIdele,
    HeightOneSpectrum.valuedAdicCompletion_eq_valuation'] at hunit
  exact hunit
omit numberFieldK in
 


theorem finite_chosenFiniteKummerRadicalQuotient
    {L : Type*} [Field L] [Algebra K L]
    [FiniteDimensional K L] [IsGalois K L]
    (n : ℕ+)
    (hmu : (primitiveRoots (n : ℕ) K).Nonempty) :
    Finite
      ((KummerTheory.chosenFiniteKummerRadicalDatum
        (K := K) (L := L) n).RadicalQuotient) := by
  let : NeZero (n : ℕ) := ⟨n.ne_zero⟩
  let D :=
    KummerTheory.chosenFiniteKummerRadicalDatum
      (K := K) (L := L) n
  let H :=
    Gal(L/K) →* KummerTheory.nthRootsSubgroup L (n : ℕ)
  let : Finite H :=
    Finite.of_injective
      (fun chi : H =>
        (chi : Gal(L/K) →
          KummerTheory.nthRootsSubgroup L (n : ℕ)))
      DFunLike.coe_injective
  let hbase :
      KummerTheory.NthRootsOfUnityInBase
        (K := K) (L := L) n :=
    KummerTheory.nthRootsOfUnityInBase_of_primitiveRoots
      (K := K) (L := L) n hmu
  let e : D.RadicalQuotient ≃* H :=
    KummerTheory.finiteKummerCharacterEquiv n hbase
  exact Finite.of_equiv H e.symm.toEquiv
 

noncomputable def chosenFiniteKummerRadicalRepresentative
    {L : Type*} [Field L] [Algebra K L]
    (n : ℕ+)
    (q :
      (KummerTheory.chosenFiniteKummerRadicalDatum
        (K := K) (L := L) n).RadicalQuotient) :
    (KummerTheory.chosenFiniteKummerRadicalDatum
      (K := K) (L := L) n).carrier :=
  Classical.choose
    ((KummerTheory.chosenFiniteKummerRadicalDatum
      (K := K) (L := L) n).radicalQuotientMk_surjective q)
omit numberFieldK in
 
@[simp]
theorem chosenFiniteKummerRadicalRepresentative_spec
    {L : Type*} [Field L] [Algebra K L]
    (n : ℕ+)
    (q :
      (KummerTheory.chosenFiniteKummerRadicalDatum
        (K := K) (L := L) n).RadicalQuotient) :
    (KummerTheory.chosenFiniteKummerRadicalDatum
        (K := K) (L := L) n).radicalQuotientMk
      (chosenFiniteKummerRadicalRepresentative
        (K := K) (L := L) n q) = q :=
  Classical.choose_spec
    ((KummerTheory.chosenFiniteKummerRadicalDatum
      (K := K) (L := L) n).radicalQuotientMk_surjective q)
 

noncomputable def finiteKummerRadicalSupport
    {L : Type*} [Field L] [Algebra K L]
    [FiniteDimensional K L] [IsGalois K L]
    (n : ℕ+)
    (hmu : (primitiveRoots (n : ℕ) K).Nonempty) :
    Finset (HeightOneSpectrum (𝓞 K)) := by
  let D :=
    KummerTheory.chosenFiniteKummerRadicalDatum
      (K := K) (L := L) n
  letI : Finite D.RadicalQuotient :=
    finite_chosenFiniteKummerRadicalQuotient
      (K := K) (L := L) n hmu
  letI : Fintype D.RadicalQuotient :=
    Fintype.ofFinite D.RadicalQuotient
  exact
    Finset.univ.biUnion fun q =>
      chosenUnitFiniteSupport (K := K)
        (chosenFiniteKummerRadicalRepresentative
          (K := K) (L := L) n q).1
 

noncomputable def enlargeByFiniteKummerRadicalSupport
    {L : Type*} [Field L] [Algebra K L]
    [FiniteDimensional K L] [IsGalois K L]
    (n : ℕ+)
    (hmu : (primitiveRoots (n : ℕ) K).Nonempty)
    (S : Finset (HeightOneSpectrum (𝓞 K))) :
    Finset (HeightOneSpectrum (𝓞 K)) :=
  S ∪ finiteKummerRadicalSupport
    (K := K) (L := L) n hmu
 
theorem subset_enlargeByFiniteKummerRadicalSupport
    {L : Type*} [Field L] [Algebra K L]
    [FiniteDimensional K L] [IsGalois K L]
    (n : ℕ+)
    (hmu : (primitiveRoots (n : ℕ) K).Nonempty)
    (S : Finset (HeightOneSpectrum (𝓞 K))) :
    S ⊆ enlargeByFiniteKummerRadicalSupport
      (K := K) (L := L) n hmu S :=
  Finset.subset_union_left
 

theorem chosenFiniteKummerRadicalRepresentative_mem_enlargedSUnitGroup
    {L : Type*} [Field L] [Algebra K L]
    [FiniteDimensional K L] [IsGalois K L]
    (n : ℕ+)
    (hmu : (primitiveRoots (n : ℕ) K).Nonempty)
    (S : Finset (HeightOneSpectrum (𝓞 K)))
    (q :
      (KummerTheory.chosenFiniteKummerRadicalDatum
        (K := K) (L := L) n).RadicalQuotient) :
    (chosenFiniteKummerRadicalRepresentative
        (K := K) (L := L) n q).1 ∈
      SUnitGroup (K := K)
        (enlargeByFiniteKummerRadicalSupport
          (K := K) (L := L) n hmu S) := by
  apply sUnitGroup_mono
    (K := K)
    (S := chosenUnitFiniteSupport (K := K)
      (chosenFiniteKummerRadicalRepresentative
        (K := K) (L := L) n q).1)
    (T := enlargeByFiniteKummerRadicalSupport
      (K := K) (L := L) n hmu S)
  · intro v hv
    apply Finset.mem_union_right
    let D :=
      KummerTheory.chosenFiniteKummerRadicalDatum
        (K := K) (L := L) n
    let : Finite D.RadicalQuotient :=
      finite_chosenFiniteKummerRadicalQuotient
        (K := K) (L := L) n hmu
    let : Fintype D.RadicalQuotient :=
      Fintype.ofFinite D.RadicalQuotient
    exact Finset.mem_biUnion.mpr
      ⟨q, Finset.mem_univ q, hv⟩
  · exact mem_sUnitGroup_chosenUnitFiniteSupport
      (K := K)
      (chosenFiniteKummerRadicalRepresentative
        (K := K) (L := L) n q).1
 

theorem finiteKummerRadicalSubgroup_le_enlargedSUnitKummerSubgroup
    {L : Type*} [Field L] [Algebra K L]
    [FiniteDimensional K L] [IsGalois K L]
    (n : ℕ+)
    (hmu : (primitiveRoots (n : ℕ) K).Nonempty)
    (S : Finset (HeightOneSpectrum (𝓞 K))) :
    KummerTheory.finiteKummerRadicalSubgroup
        (K := K) (L := L) n ≤
      (sUnitKummerSubgroup
        (K := K) (L := L) n
        (enlargeByFiniteKummerRadicalSupport
          (K := K) (L := L) n hmu S)).1 := by
  intro a ha
  let D :=
    KummerTheory.chosenFiniteKummerRadicalDatum
      (K := K) (L := L) n
  let aD : D.carrier := ⟨a, ha⟩
  let q : D.RadicalQuotient := D.radicalQuotientMk aD
  let bD : D.carrier :=
    chosenFiniteKummerRadicalRepresentative
      (K := K) (L := L) n q
  have hbclass : D.radicalQuotientMk bD =
      D.radicalQuotientMk aD := by
    exact chosenFiniteKummerRadicalRepresentative_spec
      (K := K) (L := L) n q
  have habpower : aD / bD ∈ D.ambientNthPowersSubgroup := by
    exact (D.radicalQuotientMk_eq_iff aD bD).1 hbclass.symm
  obtain ⟨z, hz⟩ :=
    (D.mem_ambientNthPowersSubgroup_iff).1 habpower
  apply Subgroup.mem_sup.mpr
  refine
    ⟨bD.1,
      ⟨chosenFiniteKummerRadicalRepresentative_mem_enlargedSUnitGroup
          (K := K) (L := L) n hmu S q,
        bD.2⟩,
      z ^ (n : ℕ),
      (KummerTheory.mem_unitNthPowersSubgroup_iff n).2
        ⟨z, rfl⟩,
      ?_⟩
  change bD.1 * z ^ (n : ℕ) = aD.1
  rw [hz]
  change bD.1 * (aD.1 / bD.1) = aD.1
  simp [div_eq_mul_inv, mul_comm, mul_left_comm]
 
theorem enlargedSUnitKummerSubgroup_eq_finiteKummerRadicalSubgroup
    {L : Type*} [Field L] [Algebra K L]
    [FiniteDimensional K L] [IsGalois K L]
    (n : ℕ+)
    (hmu : (primitiveRoots (n : ℕ) K).Nonempty)
    (S : Finset (HeightOneSpectrum (𝓞 K))) :
    (sUnitKummerSubgroup
        (K := K) (L := L) n
        (enlargeByFiniteKummerRadicalSupport
          (K := K) (L := L) n hmu S)).1 =
      KummerTheory.finiteKummerRadicalSubgroup
        (K := K) (L := L) n :=
  le_antisymm
    (sUnitKummerSubgroup_le_finiteKummerRadicalSubgroup
      (K := K) (L := L) n
      (enlargeByFiniteKummerRadicalSupport
        (K := K) (L := L) n hmu S))
    (finiteKummerRadicalSubgroup_le_enlargedSUnitKummerSubgroup
      (K := K) (L := L) n hmu S)
 

theorem sUnitKummerSubgroup_le_fullSUnitKummerSubgroup
    {L : Type*} [Field L] [Algebra K L]
    (n : ℕ+)
    (S : Finset (HeightOneSpectrum (𝓞 K))) :
    (sUnitKummerSubgroup (K := K) (L := L) n S).1 ≤
      (fullSUnitKummerSubgroup (K := K) n S).1 := by
  apply sup_le
  · exact inf_le_left.trans le_sup_left
  · exact le_sup_right
omit numberFieldK in
 
theorem kummerRadicalExtension_mono
    {Omega : Type*} [Field Omega] [Algebra K Omega]
    (n : ℕ+)
    {Delta Gamma : Subgroup Kˣ}
    (h : Delta ≤ Gamma) :
    KummerTheory.kummerRadicalExtension
        (K := K) (Omega := Omega) n Delta ≤
      KummerTheory.kummerRadicalExtension
        (K := K) (Omega := Omega) n Gamma := by
  apply IntermediateField.adjoin_le_iff.mpr
  rintro beta ⟨a, ha⟩
  apply IntermediateField.subset_adjoin K
    (KummerTheory.kummerRootSet
      (K := K) (Omega := Omega) n Gamma)
  exact ⟨⟨a.1, h a.2⟩, ha⟩
 

theorem kummerRadicalExtension_enlargedSUnitKummerSubgroup_eq
    {Omega : Type*} [Field Omega] [Algebra K Omega]
    [IsSepClosure K Omega]
    (E : IntermediateField K Omega)
    [FiniteDimensional K E] [IsGalois K E]
    [IsMulCommutative Gal(E/K)]
    (n : ℕ+)
    (hmu : (primitiveRoots (n : ℕ) K).Nonempty)
    (hexponent : ∀ sigma : Gal(E/K), sigma ^ (n : ℕ) = 1)
    (S : Finset (HeightOneSpectrum (𝓞 K))) :
    KummerTheory.kummerRadicalExtension
        (K := K) (Omega := Omega) n
        (sUnitKummerSubgroup
          (K := K) (L := E) n
          (enlargeByFiniteKummerRadicalSupport
            (K := K) (L := E) n hmu S)).1 =
      E := by
  rw [
    enlargedSUnitKummerSubgroup_eq_finiteKummerRadicalSubgroup
      (K := K) (L := E) n hmu S]
  exact
    KummerTheory.kummerRadicalExtension_finiteKummerRadicalSubgroup_eq
      E n hmu hexponent
end KummerTheory
end
end

/- ClassFieldTheory.KummerTheory.Concrete.SUnitPreparation.EnlargedSUnitRestriction -/
section
open scoped NumberField Classical IsMulCommutative NNReal ValuativeRel
open NumberField IsDedekindDomain
open LocalFieldTheory
noncomputable section
namespace KummerTheory
variable {K : Type*} [Field K]
    [numberFieldK : NumberField K]
 

theorem le_fullSUnitKummerExtension_of_enlargedS
    {Omega : Type*} [Field Omega] [Algebra K Omega]
    [IsSepClosure K Omega]
    (E : IntermediateField K Omega)
    [FiniteDimensional K E] [IsGalois K E]
    [IsMulCommutative Gal(E/K)]
    (n : ℕ+)
    (hmu : (primitiveRoots (n : ℕ) K).Nonempty)
    (hexponent : ∀ sigma : Gal(E/K), sigma ^ (n : ℕ) = 1)
    (S : Finset (HeightOneSpectrum (𝓞 K))) :
    E ≤
      fullSUnitKummerExtension
        (K := K) (Omega := Omega) n
        (enlargeByFiniteKummerRadicalSupport
          (K := K) (L := E) n hmu S) := by
  have hgenerate :=
    kummerRadicalExtension_enlargedSUnitKummerSubgroup_eq
      (K := K) (Omega := Omega) E n hmu hexponent S
  have hmono := kummerRadicalExtension_mono
    (K := K) (Omega := Omega) n
    (sUnitKummerSubgroup_le_fullSUnitKummerSubgroup
      (K := K) (L := E) n
      (enlargeByFiniteKummerRadicalSupport
        (K := K) (L := E) n hmu S))
  intro x hx
  apply hmono
  rw [hgenerate]
  exact hx
 

noncomputable abbrev enlargedSUnitKummerAlgebra
    {Omega : Type*} [Field Omega] [Algebra K Omega]
    [IsSepClosure K Omega]
    (E : IntermediateField K Omega)
    [FiniteDimensional K E] [IsGalois K E]
    [IsMulCommutative Gal(E/K)]
    (n : ℕ+)
    (hmu : (primitiveRoots (n : ℕ) K).Nonempty)
    (hexponent : ∀ sigma : Gal(E/K), sigma ^ (n : ℕ) = 1)
    (S : Finset (HeightOneSpectrum (𝓞 K))) :
    Algebra E
      (fullSUnitKummerExtension
        (K := K) (Omega := Omega) n
        (enlargeByFiniteKummerRadicalSupport
          (K := K) (L := E) n hmu S)) :=
  (IntermediateField.inclusion
    (le_fullSUnitKummerExtension_of_enlargedS
      (K := K) (Omega := Omega) E n hmu hexponent S)).toAlgebra
 

noncomputable def enlargedSUnitKummerRestrictionHom
    {Omega : Type*} [Field Omega] [Algebra K Omega]
    [IsSepClosure K Omega]
    (E : IntermediateField K Omega)
    [FiniteDimensional K E] [IsGalois K E]
    [IsMulCommutative Gal(E/K)]
    (n : ℕ+)
    (hmu : (primitiveRoots (n : ℕ) K).Nonempty)
    (hexponent : ∀ sigma : Gal(E/K), sigma ^ (n : ℕ) = 1)
    (S : Finset (HeightOneSpectrum (𝓞 K))) :
    Gal(fullSUnitKummerExtension
          (K := K) (Omega := Omega) n
          (enlargeByFiniteKummerRadicalSupport
            (K := K) (L := E) n hmu S)/K) →*
      Gal(E/K) := by
  let N :=
    fullSUnitKummerExtension
      (K := K) (Omega := Omega) n
      (enlargeByFiniteKummerRadicalSupport
        (K := K) (L := E) n hmu S)
  let : Algebra E N :=
    enlargedSUnitKummerAlgebra
      (K := K) (Omega := Omega) E n hmu hexponent S
  letI : IsScalarTower K E N := by infer_instance
  exact
    AlgEquiv.restrictNormalHom
      (F := K) (K₁ := N) (E := E)
 
theorem enlargedSUnitKummerRestrictionHom_surjective
    {Omega : Type*} [Field Omega] [Algebra K Omega]
    [IsSepClosure K Omega]
    (E : IntermediateField K Omega)
    [FiniteDimensional K E] [IsGalois K E]
    [IsMulCommutative Gal(E/K)]
    (n : ℕ+)
    (hmu : (primitiveRoots (n : ℕ) K).Nonempty)
    (hexponent : ∀ sigma : Gal(E/K), sigma ^ (n : ℕ) = 1)
    (S : Finset (HeightOneSpectrum (𝓞 K))) :
    Function.Surjective
      (enlargedSUnitKummerRestrictionHom
        (K := K) (Omega := Omega) E n hmu hexponent S) := by
  let N :=
    fullSUnitKummerExtension
      (K := K) (Omega := Omega) n
      (enlargeByFiniteKummerRadicalSupport
        (K := K) (L := E) n hmu S)
  let _ : Algebra E N :=
    enlargedSUnitKummerAlgebra
      (K := K) (Omega := Omega) E n hmu hexponent S
  let : IsScalarTower K E N := by infer_instance
  let : IsGalois K N :=
    fullSUnitKummerExtension_isGalois
      (K := K) (Omega := Omega) n
      (enlargeByFiniteKummerRadicalSupport
        (K := K) (L := E) n hmu S)
  simpa [enlargedSUnitKummerRestrictionHom, N] using
    (AlgEquiv.restrictNormalHom_surjective
      (F := K) (K₁ := E) (E := N))
 

noncomputable def enlargedSUnitKummerEmbeddedExtension
    {Omega : Type*} [Field Omega] [Algebra K Omega]
    [IsSepClosure K Omega]
    (E : IntermediateField K Omega)
    [FiniteDimensional K E] [IsGalois K E]
    [IsMulCommutative Gal(E/K)]
    (n : ℕ+)
    (hmu : (primitiveRoots (n : ℕ) K).Nonempty)
    (hexponent : ∀ sigma : Gal(E/K), sigma ^ (n : ℕ) = 1)
    (S : Finset (HeightOneSpectrum (𝓞 K))) :
    IntermediateField K
      (fullSUnitKummerExtension
        (K := K) (Omega := Omega) n
        (enlargeByFiniteKummerRadicalSupport
          (K := K) (L := E) n hmu S)) := by
  let N :=
    fullSUnitKummerExtension
      (K := K) (Omega := Omega) n
      (enlargeByFiniteKummerRadicalSupport
        (K := K) (L := E) n hmu S)
  let : Algebra E N :=
    enlargedSUnitKummerAlgebra
      (K := K) (Omega := Omega) E n hmu hexponent S
  let : IsScalarTower K E N := by infer_instance
  exact (IsScalarTower.toAlgHom K E N).fieldRange
 

theorem enlargedSUnitKummerRestrictionHom_ker_eq_fixingSubgroup
    {Omega : Type*} [Field Omega] [Algebra K Omega]
    [IsSepClosure K Omega]
    (E : IntermediateField K Omega)
    [FiniteDimensional K E] [IsGalois K E]
    [IsMulCommutative Gal(E/K)]
    (n : ℕ+)
    (hmu : (primitiveRoots (n : ℕ) K).Nonempty)
    (hexponent : ∀ sigma : Gal(E/K), sigma ^ (n : ℕ) = 1)
    (S : Finset (HeightOneSpectrum (𝓞 K))) :
    (enlargedSUnitKummerRestrictionHom
      (K := K) (Omega := Omega) E n hmu hexponent S).ker =
      (enlargedSUnitKummerEmbeddedExtension
        (K := K) (Omega := Omega) E n hmu
        hexponent S).fixingSubgroup := by
  let S' :=
    enlargeByFiniteKummerRadicalSupport
      (K := K) (L := E) n hmu S
  let N :=
    fullSUnitKummerExtension
      (K := K) (Omega := Omega) n S'
  let _ : Algebra E N :=
    enlargedSUnitKummerAlgebra
      (K := K) (Omega := Omega) E n hmu hexponent S
  let _ : IsScalarTower K E N := by infer_instance
  let M : IntermediateField K N :=
    (IsScalarTower.toAlgHom K E N).fieldRange
  change
    (AlgEquiv.restrictNormalHom
      (F := K) (K₁ := N) (E := E)).ker =
        M.fixingSubgroup
  ext sigma
  rw [MonoidHom.mem_ker,
    IntermediateField.mem_fixingSubgroup_iff]
  constructor
  · intro hsigma y hy
    rcases hy with ⟨x, rfl⟩
    have hx :
        sigma.restrictNormal E x = x := by
      change
        (AlgEquiv.restrictNormalHom
          (F := K) (K₁ := N) (E := E) sigma) x =
            (1 : Gal(E/K)) x
      rw [hsigma]
    calc
      sigma (algebraMap E N x) =
          algebraMap E N (sigma.restrictNormal E x) :=
        (AlgEquiv.restrictNormal_commutes sigma E x).symm
      _ = algebraMap E N x :=
        congrArg (algebraMap E N) hx
  · intro hsigma
    apply AlgEquiv.ext
    intro x
    apply (algebraMap E N).injective
    change
      algebraMap E N (sigma.restrictNormal E x) =
        algebraMap E N x
    exact
      (AlgEquiv.restrictNormal_commutes sigma E x).trans
        (hsigma (algebraMap E N x) ⟨x, rfl⟩)
 

theorem fixedField_enlargedSUnitKummerRestrictionHom_ker
    {Omega : Type*} [Field Omega] [Algebra K Omega]
    [IsSepClosure K Omega]
    (E : IntermediateField K Omega)
    [FiniteDimensional K E] [IsGalois K E]
    [IsMulCommutative Gal(E/K)]
    (n : ℕ+)
    (hmu : (primitiveRoots (n : ℕ) K).Nonempty)
    (hexponent : ∀ sigma : Gal(E/K), sigma ^ (n : ℕ) = 1)
    (S : Finset (HeightOneSpectrum (𝓞 K))) :
    IntermediateField.fixedField
        (enlargedSUnitKummerRestrictionHom
          (K := K) (Omega := Omega) E n hmu
          hexponent S).ker =
      enlargedSUnitKummerEmbeddedExtension
        (K := K) (Omega := Omega) E n hmu
        hexponent S := by
  let S' :=
    enlargeByFiniteKummerRadicalSupport
      (K := K) (L := E) n hmu S
  let N :=
    fullSUnitKummerExtension
      (K := K) (Omega := Omega) n S'
  have hnK : ((n : ℕ) : K) ≠ 0 := by
    exact_mod_cast n.ne_zero
  let : IsGalois K N :=
    fullSUnitKummerExtension_isGalois
      (K := K) (Omega := Omega) n S'
  let : FiniteDimensional K N :=
    fullSUnitKummerExtension_finiteDimensional
      (K := K) (Omega := Omega) n hnK hmu S'
  rw [
    enlargedSUnitKummerRestrictionHom_ker_eq_fixingSubgroup
      (K := K) (Omega := Omega) E n hmu
      hexponent S]
  exact
    IsGalois.fixedField_fixingSubgroup
      (enlargedSUnitKummerEmbeddedExtension
        (K := K) (Omega := Omega) E n hmu
        hexponent S)
end KummerTheory
end
end

/- ClassFieldTheory.KummerTheory.Concrete.SUnitPreparation.Core -/
section
open scoped NumberField Classical IsMulCommutative NNReal ValuativeRel
open NumberField IsDedekindDomain
open LocalFieldTheory
noncomputable section
namespace KummerTheory
variable {K : Type*} [Field K]
    [numberFieldK : NumberField K]
 


theorem galoisRank_le_totalPlaceCard_enlargedS
    {Omega : Type*} [Field Omega] [Algebra K Omega]
    [IsSepClosure K Omega]
    (E : IntermediateField K Omega)
    [FiniteDimensional K E] [IsGalois K E]
    [IsMulCommutative Gal(E/K)]
    (n : ℕ+) (hn : 1 < (n : ℕ))
    (hmu : (primitiveRoots (n : ℕ) K).Nonempty)
    (r : ℕ)
    (eG :
      Gal(E/K) ≃*
        (Fin r → Multiplicative (ZMod (n : ℕ))))
    (S : Finset (HeightOneSpectrum (𝓞 K))) :
    r ≤
      totalPlaceCard (K := K)
        (enlargeByFiniteKummerRadicalSupport
          (K := K) (L := E) n hmu S) := by
  let S' :=
    enlargeByFiniteKummerRadicalSupport
      (K := K) (L := E) n hmu S
  let N :=
    fullSUnitKummerExtension
      (K := K) (Omega := Omega) n S'
  have hnK : ((n : ℕ) : K) ≠ 0 := by
    exact_mod_cast n.ne_zero
  let : IsGalois K N :=
    fullSUnitKummerExtension_isGalois
      (K := K) (Omega := Omega) n S'
  let : Finite Gal(N/K) :=
    finite_fullSUnitKummerExtension_galois
      (K := K) (Omega := Omega) n hnK hmu S'
  have hcardE :
      Nat.card Gal(E/K) = (n : ℕ) ^ r := by
    rw [Nat.card_congr eG.toEquiv, Nat.card_pi]
    simp
  have hcardN :
      Nat.card Gal(N/K) =
        (n : ℕ) ^ totalPlaceCard (K := K) S' :=
    card_fullSUnitKummerExtension_galois
      (K := K) (Omega := Omega) n hnK hmu S'
  have hexponentE :
      ∀ sigma : Gal(E/K), sigma ^ (n : ℕ) = 1 :=
    galois_pow_eq_one_of_equiv_pi_zmod E n r eG
  have hcardLe :
      Nat.card Gal(E/K) ≤ Nat.card Gal(N/K) :=
    Nat.card_le_card_of_surjective
      (enlargedSUnitKummerRestrictionHom
        (K := K) (Omega := Omega) E n hmu
        hexponentE S)
      (enlargedSUnitKummerRestrictionHom_surjective
        (K := K) (Omega := Omega) E n hmu
        hexponentE S)
  rw [hcardE, hcardN] at hcardLe
  exact (Nat.pow_le_pow_iff_right hn).mp hcardLe
 


theorem card_enlargedSUnitKummerRestrictionHom_ker
    {Omega : Type*} [Field Omega] [Algebra K Omega]
    [IsSepClosure K Omega]
    (E : IntermediateField K Omega)
    [FiniteDimensional K E] [IsGalois K E]
    [IsMulCommutative Gal(E/K)]
    (n : ℕ+) (hn : 1 < (n : ℕ))
    (hmu : (primitiveRoots (n : ℕ) K).Nonempty)
    (r : ℕ)
    (eG :
      Gal(E/K) ≃*
        (Fin r → Multiplicative (ZMod (n : ℕ))))
    (S : Finset (HeightOneSpectrum (𝓞 K))) :
    Nat.card
        (enlargedSUnitKummerRestrictionHom
          (K := K) (Omega := Omega) E n hmu
          (galois_pow_eq_one_of_equiv_pi_zmod E n r eG)
          S).ker =
      (n : ℕ) ^
        (totalPlaceCard (K := K)
            (enlargeByFiniteKummerRadicalSupport
              (K := K) (L := E) n hmu S) - r) := by
  let S' :=
    enlargeByFiniteKummerRadicalSupport
      (K := K) (L := E) n hmu S
  let N :=
    fullSUnitKummerExtension
      (K := K) (Omega := Omega) n S'
  have hnK : ((n : ℕ) : K) ≠ 0 := by
    exact_mod_cast n.ne_zero
  let : IsGalois K N :=
    fullSUnitKummerExtension_isGalois
      (K := K) (Omega := Omega) n S'
  let : Finite Gal(N/K) :=
    finite_fullSUnitKummerExtension_galois
      (K := K) (Omega := Omega) n hnK hmu S'
  have hexponentE :
      ∀ sigma : Gal(E/K), sigma ^ (n : ℕ) = 1 :=
    galois_pow_eq_one_of_equiv_pi_zmod E n r eG
  let f : Gal(N/K) →* Gal(E/K) :=
    enlargedSUnitKummerRestrictionHom
      (K := K) (Omega := Omega) E n hmu hexponentE S
  have hf :
      Function.Surjective f :=
    enlargedSUnitKummerRestrictionHom_surjective
      (K := K) (Omega := Omega) E n hmu hexponentE S
  have hcardE :
      Nat.card Gal(E/K) = (n : ℕ) ^ r := by
    rw [Nat.card_congr eG.toEquiv, Nat.card_pi]
    simp
  have hcardN :
      Nat.card Gal(N/K) =
        (n : ℕ) ^ totalPlaceCard (K := K) S' :=
    card_fullSUnitKummerExtension_galois
      (K := K) (Omega := Omega) n hnK hmu S'
  have hquotient :
      Nat.card (Gal(N/K) ⧸ f.ker) =
        Nat.card Gal(E/K) :=
    Nat.card_congr
      (QuotientGroup.quotientKerEquivOfSurjective
        f hf).toEquiv
  have hfactor :
      (n : ℕ) ^ totalPlaceCard (K := K) S' =
        (n : ℕ) ^ r * Nat.card f.ker := by
    rw [← hcardN, ← hcardE, ← hquotient]
    exact
      Subgroup.card_eq_card_quotient_mul_card_subgroup
        f.ker
  have hr :
      r ≤ totalPlaceCard (K := K) S' :=
    galoisRank_le_totalPlaceCard_enlargedS
      (K := K) (Omega := Omega) E n hn hmu r eG S
  have hsplit :
      (n : ℕ) ^ totalPlaceCard (K := K) S' =
        (n : ℕ) ^ r *
          (n : ℕ) ^
            (totalPlaceCard (K := K) S' - r) := by
    rw [← pow_add, Nat.add_sub_of_le hr]
  have hcancel :
      (n : ℕ) ^ r * Nat.card f.ker =
        (n : ℕ) ^ r *
          (n : ℕ) ^
            (totalPlaceCard (K := K) S' - r) :=
    hfactor.symm.trans hsplit
  exact Nat.eq_of_mul_eq_mul_left
    (pow_pos n.pos r) hcancel
 


theorem
    exists_enlargedSUnitKummerRestrictionKernelEquivPiZMod
    {Omega : Type*} [Field Omega] [Algebra K Omega]
    [IsSepClosure K Omega]
    (E : IntermediateField K Omega)
    [FiniteDimensional K E] [IsGalois K E]
    [IsMulCommutative Gal(E/K)]
    (n : ℕ+)
    (hmu : (primitiveRoots (n : ℕ) K).Nonempty)
    (p v : ℕ) (hp : p.Prime) (hv : 0 < v)
    (hn : (n : ℕ) = p ^ v)
    (r : ℕ)
    (eG :
      Gal(E/K) ≃*
        (Fin r → Multiplicative (ZMod (n : ℕ))))
    (S : Finset (HeightOneSpectrum (𝓞 K))) :
    Nonempty
      ((enlargedSUnitKummerRestrictionHom
          (K := K) (Omega := Omega) E n hmu
          (galois_pow_eq_one_of_equiv_pi_zmod E n r eG)
          S).ker ≃*
        (Fin
            (totalPlaceCard (K := K)
              (enlargeByFiniteKummerRadicalSupport
                (K := K) (L := E) n hmu S) - r) →
          Multiplicative (ZMod (n : ℕ)))) := by
  let S' :=
    enlargeByFiniteKummerRadicalSupport
      (K := K) (L := E) n hmu S
  let N :=
    fullSUnitKummerExtension
      (K := K) (Omega := Omega) n S'
  let G := Gal(N/K)
  let H := Gal(E/K)
  have hnK : ((n : ℕ) : K) ≠ 0 := by
    exact_mod_cast n.ne_zero
  have hnOne : 1 < (n : ℕ) := by
    rw [hn]
    calc
      1 < p := hp.one_lt
      _ = p ^ 1 := (pow_one p).symm
      _ ≤ p ^ v :=
        Nat.pow_le_pow_right hp.pos
          (Nat.succ_le_iff.mpr hv)
  have hexponentE :
      ∀ sigma : H, sigma ^ (n : ℕ) = 1 :=
    galois_pow_eq_one_of_equiv_pi_zmod E n r eG
  let : IsGalois K N :=
    fullSUnitKummerExtension_isGalois
      (K := K) (Omega := Omega) n S'
  let : Finite G :=
    finite_fullSUnitKummerExtension_galois
      (K := K) (Omega := Omega) n hnK hmu S'
  let : IsMulCommutative G :=
    KummerTheory.kummerRadicalExtension_isMulCommutative
      n hmu (fullSUnitKummerSubgroup (K := K) n S').1
  let : Module (ZMod (n : ℕ)) (Additive G) :=
    additiveZModModuleOfPowEqOne (n : ℕ)
      (fullSUnitKummerExtension_galois_pow_eq_one
        (K := K) (Omega := Omega) n hmu S')
  let : Module (ZMod (n : ℕ)) (Additive H) :=
    additiveZModModuleOfPowEqOne (n : ℕ) hexponentE
  have hfreeG : Module.Free (ZMod (n : ℕ)) (Additive G) :=
    fullSUnitKummerExtension_galois_moduleFree
      (K := K) (Omega := Omega) n hnK hmu S'
  let eH :
      Additive H ≃ₗ[ZMod (n : ℕ)]
        (Fin r → ZMod (n : ℕ)) :=
    additivePiLinearEquiv (n : ℕ) eG
  have hfreeH : Module.Free (ZMod (n : ℕ)) (Additive H) :=
    Module.Free.of_equiv eH.symm
  let f : G →* H :=
    enlargedSUnitKummerRestrictionHom
      (K := K) (Omega := Omega) E n hmu
        hexponentE S
  have hf : Function.Surjective f :=
    enlargedSUnitKummerRestrictionHom_surjective
      (K := K) (Omega := Omega) E n hmu
        hexponentE S
  have hcard :
      Nat.card f.ker =
        (n : ℕ) ^
          (totalPlaceCard (K := K) S' - r) :=
    card_enlargedSUnitKummerRestrictionHom_ker
      (K := K) (Omega := Omega) E n hnOne
        hmu r eG S
  exact
    exists_kernelMulEquiv_pi_zmod_of_primePower
      (G := G) (H := H)
      (n : ℕ) p v
      (totalPlaceCard (K := K) S' - r)
      hp hv hn hfreeG hfreeH f hf hcard
 

noncomputable def
    chosenEnlargedSUnitKummerRestrictionKernelEquivPiZMod
    {Omega : Type*} [Field Omega] [Algebra K Omega]
    [IsSepClosure K Omega]
    (E : IntermediateField K Omega)
    [FiniteDimensional K E] [IsGalois K E]
    [IsMulCommutative Gal(E/K)]
    (n : ℕ+)
    (hmu : (primitiveRoots (n : ℕ) K).Nonempty)
    (p v : ℕ) (hp : p.Prime) (hv : 0 < v)
    (hn : (n : ℕ) = p ^ v)
    (r : ℕ)
    (eG :
      Gal(E/K) ≃*
        (Fin r → Multiplicative (ZMod (n : ℕ))))
    (S : Finset (HeightOneSpectrum (𝓞 K))) :
    (enlargedSUnitKummerRestrictionHom
        (K := K) (Omega := Omega) E n hmu
        (galois_pow_eq_one_of_equiv_pi_zmod E n r eG)
        S).ker ≃*
      (Fin
          (totalPlaceCard (K := K)
            (enlargeByFiniteKummerRadicalSupport
              (K := K) (L := E) n hmu S) - r) →
        Multiplicative (ZMod (n : ℕ))) :=
  Classical.choice
    (exists_enlargedSUnitKummerRestrictionKernelEquivPiZMod
      (K := K) (Omega := Omega) E n hmu
      p v hp hv hn r eG S)
end KummerTheory
end
end

/- ClassFieldTheory.GlobalClassFieldTheory.ClassFieldAxiom.SUnitKummerPrimeSelection.RestrictionKernel -/
section
open scoped NumberField Classical IsMulCommutative
open NumberField IsDedekindDomain
open KummerTheory
noncomputable section
namespace GlobalClassFieldTheory.ClassFieldAxiom
section GeneralKummer
variable {K : Type*} [Field K]
    [NumberField K]
 

def sUnitKummerPrimeCount
    {Omega : Type*} [Field Omega] [Algebra K Omega]
    (E : IntermediateField K Omega)
    [FiniteDimensional K E] [IsGalois K E]
    (n : ℕ+)
    (hmu : (primitiveRoots (n : ℕ) K).Nonempty)
    (r : ℕ)
    (S : Finset (HeightOneSpectrum (𝓞 K))) : ℕ :=
  totalPlaceCard (K := K)
      (enlargeByFiniteKummerRadicalSupport
        (K := K) (L := E) n hmu S) - r
 

noncomputable def sUnitKummerKernelGenerator
    {Omega : Type*} [Field Omega] [Algebra K Omega]
    [IsSepClosure K Omega]
    (E : IntermediateField K Omega)
    [FiniteDimensional K E] [IsGalois K E]
    [IsMulCommutative Gal(E/K)]
    (n : ℕ+)
    (hmu : (primitiveRoots (n : ℕ) K).Nonempty)
    (p v : ℕ) (hp : p.Prime) (hv : 0 < v)
    (hn : (n : ℕ) = p ^ v)
    (r : ℕ)
    (eG :
      Gal(E/K) ≃*
        (Fin r → Multiplicative (ZMod (n : ℕ))))
    (S : Finset (HeightOneSpectrum (𝓞 K)))
    (i : Fin
      (sUnitKummerPrimeCount
        (K := K) E n hmu r S)) :=
  (chosenEnlargedSUnitKummerRestrictionKernelEquivPiZMod
    (K := K) (Omega := Omega) E n hmu
    p v hp hv hn r eG S).symm
      (Pi.mulSingle i
        (Multiplicative.ofAdd (1 : ZMod (n : ℕ))))
 

theorem iSup_zpowers_sUnitKummerKernelGenerator_eq_top
    {Omega : Type*} [Field Omega] [Algebra K Omega]
    [IsSepClosure K Omega]
    (E : IntermediateField K Omega)
    [FiniteDimensional K E] [IsGalois K E]
    [IsMulCommutative Gal(E/K)]
    (n : ℕ+)
    (hmu : (primitiveRoots (n : ℕ) K).Nonempty)
    (p v : ℕ) (hp : p.Prime) (hv : 0 < v)
    (hn : (n : ℕ) = p ^ v)
    (r : ℕ)
    (eG :
      Gal(E/K) ≃*
        (Fin r → Multiplicative (ZMod (n : ℕ))))
    (S : Finset (HeightOneSpectrum (𝓞 K))) :
    (⨆ i :
        Fin
          (sUnitKummerPrimeCount
            (K := K) E n hmu r S),
      Subgroup.zpowers
        (sUnitKummerKernelGenerator
          (K := K) (Omega := Omega) E n hmu
          p v hp hv hn r eG S i)) =
      ⊤ := by
  let e :=
    chosenEnlargedSUnitKummerRestrictionKernelEquivPiZMod
      (K := K) (Omega := Omega) E n hmu
      p v hp hv hn r eG S
  let P :
      Subgroup
        (enlargedSUnitKummerRestrictionHom
          (K := K) (Omega := Omega) E n hmu
          (galois_pow_eq_one_of_equiv_pi_zmod
            (K := K) E n r eG) S).ker :=
    ⨆ i,
      Subgroup.zpowers
        (sUnitKummerKernelGenerator
          (K := K) (Omega := Omega) E n hmu
          p v hp hv hn r eG S i)
  change P = ⊤
  apply top_unique
  intro sigma _
  have hsingle
      (i :
        Fin
          (sUnitKummerPrimeCount
            (K := K) E n hmu r S))
      (z : Multiplicative (ZMod (n : ℕ))) :
      e.symm (Pi.mulSingle i z) ∈ P := by
    obtain ⟨m, hm⟩ :=
      ZMod.natCast_zmod_surjective z.toAdd
    have hz :
        z =
          (Multiplicative.ofAdd
            (1 : ZMod (n : ℕ))) ^ m := by
      apply Multiplicative.toAdd.injective
      rw [toAdd_pow]
      simpa using hm.symm
    have hpower : e.symm (Pi.mulSingle i z) =
        (sUnitKummerKernelGenerator
          (K := K) (Omega := Omega) E n hmu
          p v hp hv hn r eG S i) ^ m :=
      (congrArg (fun t : Multiplicative (ZMod (n : ℕ)) =>
        e.symm (Pi.mulSingle i t)) hz).trans
        ((congrArg e.symm
          (Pi.mulSingle_pow i (Multiplicative.ofAdd (1 : ZMod (n : ℕ))) m)).trans
          (map_pow e.symm
            (Pi.mulSingle i (Multiplicative.ofAdd (1 : ZMod (n : ℕ)))) m))
    have hmem :=
      P.pow_mem
        ((le_iSup
          (fun i =>
            Subgroup.zpowers
              (sUnitKummerKernelGenerator
                (K := K) (Omega := Omega) E n hmu
                p v hp hv hn r eG S i)) i)
          (Subgroup.mem_zpowers
            (sUnitKummerKernelGenerator
              (K := K) (Omega := Omega) E n hmu
              p v hp hv hn r eG S i)))
        m
    exact hpower.symm ▸ hmem
  have hesigma :
      e sigma ∈ P.map e.toMonoidHom := by
    apply Subgroup.pi_mem_of_mulSingle_mem (e sigma)
    intro i
    refine
      ⟨e.symm (Pi.mulSingle i (e sigma i)),
        hsingle i (e sigma i), ?_⟩
    exact e.apply_symm_apply _
  obtain ⟨tau, htau, htauSigma⟩ := hesigma
  have htauEq : tau = sigma :=
    e.injective htauSigma
  exact show sigma ∈ (P : Set _) from htauEq ▸ htau
 
theorem orderOf_sUnitKummerKernelGenerator
    {Omega : Type*} [Field Omega] [Algebra K Omega]
    [IsSepClosure K Omega]
    (E : IntermediateField K Omega)
    [FiniteDimensional K E] [IsGalois K E]
    [IsMulCommutative Gal(E/K)]
    (n : ℕ+)
    (hmu : (primitiveRoots (n : ℕ) K).Nonempty)
    (p v : ℕ) (hp : p.Prime) (hv : 0 < v)
    (hn : (n : ℕ) = p ^ v)
    (r : ℕ)
    (eG :
      Gal(E/K) ≃*
        (Fin r → Multiplicative (ZMod (n : ℕ))))
    (S : Finset (HeightOneSpectrum (𝓞 K)))
    (i : Fin
      (sUnitKummerPrimeCount
        (K := K) E n hmu r S)) :
    orderOf
        (sUnitKummerKernelGenerator
          (K := K) (Omega := Omega) E n hmu
          p v hp hv hn r eG S i) =
      (n : ℕ) := by
  let e :=
    chosenEnlargedSUnitKummerRestrictionKernelEquivPiZMod
      (K := K) (Omega := Omega) E n hmu
      p v hp hv hn r eG S
  let I := Fin
    (totalPlaceCard (K := K)
      (enlargeByFiniteKummerRadicalSupport (K := K) (L := E) n hmu S) - r)
  let j : I := i
  let c : I → Multiplicative (ZMod (n : ℕ)) :=
    Pi.mulSingle j (Multiplicative.ofAdd (1 : ZMod (n : ℕ)))
  change orderOf (e.symm c) = (n : ℕ)
  have hone : orderOf (Multiplicative.ofAdd (1 : ZMod (n : ℕ))) = (n : ℕ) :=
    (orderOf_ofAdd_eq_addOrderOf (1 : ZMod (n : ℕ))).trans
      (ZMod.addOrderOf_one (n : ℕ))
  have hc : orderOf c = (n : ℕ) :=
    (orderOf_piMulSingle
      (M := fun _ : I => Multiplicative (ZMod (n : ℕ)))
      j (Multiplicative.ofAdd (1 : ZMod (n : ℕ)))).trans hone
  exact (e.symm.orderOf_eq c).trans hc
end GeneralKummer
end GlobalClassFieldTheory.ClassFieldAxiom
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
namespace TunnellAuxiliaryPlaceModel
open NumberField IsDedekindDomain
open scoped NumberField Classical TensorProduct

def Seed : Prop :=
  ∀(D:Type)[Field D][NumberField D](E:IntermediateField D (SeparableClosure D))
   [FiniteDimensional D E][IsGalois D E],
   let p:=Module.finrank D E
   p.Prime → (primitiveRoots p D).Nonempty →
   letI:NumberField E:=NumberField.of_module_finite D E
   let V:=HeightOneSpectrum (𝓞 D)
   let A:=AdeleRing (𝓞 D) D
   let unram(v:V):=∀ t:HeightOneSpectrum (𝓞 E),t.asIdeal.LiesOver v.asIdeal → Algebra.IsUnramifiedAt (𝓞 D) t.asIdeal
   let J(F:Finset V):=Subgroup.closure {a:Aˣ | ∀ v:V,v∉F → a.val.2 v∈v.adicCompletionIntegers D ∧ (a⁻¹).val.2 v∈v.adicCompletionIntegers D}
   let j:=Units.map (algebraMap D A).toMonoidHom
   ∃ B:Finset V,(∀ v:V,v∉B → unram v) ∧
     (∀ v:V,v.asIdeal ∣ Ideal.span {(p:𝓞 D)} → v∈B) ∧ j.range⊔J B=⊤

end TunnellAuxiliaryPlaceModel
namespace TunnellAuxiliarySeed
open NumberField IsDedekindDomain IdeleGroup TunnellKummerSupportGroups
open scoped NumberField TensorProduct Classical
noncomputable section
theorem seed : TunnellAuxiliaryPlaceModel.Seed := by
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

namespace TunnellCoordinateBasis
open NumberField IsDedekindDomain IdeleGroup TunnellKummerSupportGroups
open KummerTheory GlobalClassFieldTheory.ClassFieldAxiom
open scoped NumberField Classical IsMulCommutative
noncomputable section
set_option maxHeartbeats 1500000 in
theorem basis : OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H3_R1_H1_R1_H3_R1_H2_R1_H1_R1_H1_R1.H1 := by
  intro D _ _ E _ _
  dsimp only
  intro hp hmu
  letI : NumberField E:=NumberField.of_module_finite D E
  let p:=Module.finrank D E
  let n:ℕ+:=⟨p,hp.pos⟩
  letI : Fact p.Prime := ⟨hp⟩
  letI : IsCyclic Gal(E/D):=isCyclic_of_prime_card (IsGalois.card_aut_eq_finrank D E)
  let e0:Gal(E/D) ≃* Multiplicative (ZMod p):=mulEquivOfCyclicCardEq (by
    rw [IsGalois.card_aut_eq_finrank];change p=Nat.card (ZMod p);simp)
  let eG:=e0.trans (MulEquiv.piUnique (fun _:Fin 1=>Multiplicative (ZMod p))).symm
  have hnK:(p:D)≠0:=Nat.cast_ne_zero.mpr hp.ne_zero
  let u:Dˣ:=Units.mk0 (p:D) hnK
  intro B
  obtain ⟨B₁,_,hdiv,hclass⟩:=TunnellAuxiliarySeed.seed D E hp hmu
  let B₂:=B∪B₁
  let B₀:=(B₂∪sufficientlyLargeFiniteSet (K:=D))∪chosenUnitFiniteSupport (K:=D) u
  let S:=enlargeByFiniteKummerRadicalSupport (K:=D) (L:=E) n hmu B₀
  let N:=fullSUnitKummerExtension (K:=D) (Omega:=SeparableClosure D) n S
  let hx:=galois_pow_eq_one_of_equiv_pi_zmod (K:=D) E n 1 eG
  let R:Subgroup Gal(N/D):=(enlargedSUnitKummerRestrictionHom (K:=D) E n hmu hx B₀).ker
  let k:=sUnitKummerPrimeCount (K:=D) E n hmu 1 B₀
  let g (i:Fin k):R:=sUnitKummerKernelGenerator (K:=D) E n hmu p 1 hp (by decide) (pow_one p).symm 1 eG B₀ i
  letI : Algebra E N:=enlargedSUnitKummerAlgebra (K:=D) E n hmu hx B₀
  have sub:B₂⊆S:=fun _ hv=>subset_enlargeByFiniteKummerRadicalSupport (K:=D) (L:=E) n hmu B₀ (Finset.mem_union_left _ (Finset.mem_union_left _ hv))
  refine ⟨S,Finset.subset_union_left.trans sub,fun v hv=>sub (Finset.mem_union_right _ (hdiv v hv)),?_,k,?_,
    N,le_fullSUnitKummerExtension_of_enlargedS (K:=D) E n hmu hx B₀,
    fullSUnitKummerExtension_finiteDimensional (K:=D) n hnK hmu S,
    fullSUnitKummerExtension_isGalois (K:=D) n S,
    kummerRadicalExtension_isMulCommutative n hmu (fullSUnitKummerSubgroup (K:=D) n S).1,
    fullSUnitKummerExtension_galois_pow_eq_one (K:=D) n hmu S,?_,fun i=>(g i).val,?_,?_,?_⟩
  · let j:=Units.map (algebraMap D (A D)).toMonoidHom
    have hB:B₁⊆S:=Finset.subset_union_right.trans sub
    have mono:J D B₁≤J D S:=Subgroup.closure_mono fun a ha w hw=>ha w (fun h=>hw (hB h))
    exact top_unique (hclass ▸ (show j.range⊔J D B₁≤j.range⊔J D S from sup_le_sup_left mono _))
  · have pos:=galoisRank_le_totalPlaceCard_enlargedS (K:=D) E n hp.one_lt hmu 1 eG B₀
    change 1≤Fintype.card (InfinitePlace D)+S.card at pos
    rw [Nat.card_eq_fintype_card]
    change Fintype.card (InfinitePlace D)+S.card-1+1=_
    omega
  · intro x
    let a:=sUnitToFullSUnitKummerSubgroup (K:=D) n S x
    have hm:=le_finiteKummerRadicalSubgroup_kummerRadicalExtension (K:=D) (Omega:=SeparableClosure D) n hnK (fullSUnitKummerSubgroup (K:=D) n S).1 a.property
    obtain ⟨z,hz⟩:=(mem_finiteKummerRadicalSubgroup_iff (K:=D) (L:=N) n).mp hm
    exact ⟨z.val,congrArg Units.val hz⟩
  · intro i
    rw [Subgroup.orderOf_coe]
    exact orderOf_sUnitKummerKernelGenerator (K:=D) E n hmu p 1 hp (by decide) (pow_one p).symm 1 eG B₀ i
  · intro i x hm
    have hx':x ∈ enlargedSUnitKummerEmbeddedExtension (K:=D) E n hmu hx B₀ :=
      show x∈Set.range (algebraMap E N) from ⟨⟨x.val,hm⟩,rfl⟩
    rw [←fixedField_enlargedSUnitKummerRestrictionHom_ker (K:=D) E n hmu hx B₀] at hx'
    rw [IntermediateField.mem_fixedField_iff] at hx'
    exact hx' (g i).val (g i).property
  · intro x hfixed
    let H:=MulAction.stabilizer R x
    have top:H=⊤:=by
      apply top_unique
      rw [←iSup_zpowers_sUnitKummerKernelGenerator_eq_top (K:=D) E n hmu p 1 hp (by decide) (pow_one p).symm 1 eG B₀]
      exact iSup_le fun i=>Subgroup.zpowers_le.mpr (show g i∈H from hfixed i)
    have hx':x ∈ IntermediateField.fixedField R := by
      rw [IntermediateField.mem_fixedField_iff]
      intro a ha
      exact MulAction.mem_stabilizer_iff.mp (show (⟨a,ha⟩:R)∈H from top ▸ Subgroup.mem_top _)
    rw [show R=(enlargedSUnitKummerRestrictionHom (K:=D) E n hmu hx B₀).ker from rfl,
      fixedField_enlargedSUnitKummerRestrictionHom_ker (K:=D) E n hmu hx B₀] at hx'
    obtain ⟨y,hy⟩:=(show x∈Set.range (algebraMap E N) from hx')
    exact (congrArg (fun z:N=>z.val) hy) ▸ y.property
end
end TunnellCoordinateBasis

theorem OMA.solution : OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H3_R1_H1_R1_H3_R1_H2_R1_H1_R1_H1_R1.H1 := TunnellCoordinateBasis.basis
