import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1_H2_R1_H1_R1
import Mathlib

/-! A prime-degree extension with a unique place above the given prime has a nontrivial one-place norm class. Portions of the proof are adapted from ClassFieldTheory, revision 2e6280f9d2579705a0cc6c76ec68c2b60f9c601a. -/
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
namespace TunnellSpectral
open Polynomial
theorem integral {K L:Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
    [NormedField L] [NormedAlgebra K L] [Algebra.IsAlgebraic K L]
    (V:ValuationSubring K) (hv:∀a:K, a∈V ↔ ‖a‖≤1) (x:L) (hx:‖x‖≤1) :
    letI : Algebra V L := Algebra.compHom L (algebraMap V K)
    IsIntegral V x := by
  classical
  letI : Algebra V L := Algebra.compHom L (algebraMap V K)
  letI : IsScalarTower V K L := .of_algebraMap_eq' rfl
  let p:=minpoly K x
  have hm : p.Monic := minpoly.monic (Algebra.IsIntegral.isIntegral x)
  have ht : ∀ i, p.coeff i∈V := by
    intro i
    apply (hv _).mpr
    rcases lt_trichotomy i p.natDegree with hi|hi|hi
    · have hval : spectralValueTerms p i ≤ 1 :=
        (le_ciSup (spectralValueTerms_bddAbove p) i).trans (show spectralNorm K L x≤1 by rw [←NormedAlgebra.norm_eq_spectralNorm K x];exact hx)
      rw [spectralValueTerms_of_lt_natDegree p hi] at hval
      by_contra! h
      exact (not_lt_of_ge hval) (Real.one_lt_rpow h (one_div_pos.mpr (sub_pos.mpr (by exact_mod_cast hi))))
    · rw [hi,hm.coeff_natDegree,norm_one]
    · rw [coeff_eq_zero_of_natDegree_lt hi,norm_zero];exact zero_le_one
  have hc : (p.coeffs : Set K) ⊆ V.toSubring := by
    intro y hy
    obtain ⟨i,_,rfl⟩ := Polynomial.mem_coeffs_iff.mp hy
    exact ht i
  let q : V[X] := p.toSubring V.toSubring hc
  have he : q.map (algebraMap V K) = p := Polynomial.map_toSubring _ _ _
  refine ⟨q,?_,?_⟩
  · exact (Polynomial.monic_toSubring _ _ _).mpr hm
  · change aeval x q=0
    rw [← Polynomial.aeval_map_algebraMap K x q,he]
    exact minpoly.aeval K x

end TunnellSpectral

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
 

theorem eventually_mem_localUnits (a : FiniteIdeleGroup K) :
    ∀ᶠ v in Filter.cofinite,
      a v ∈ (v.adicCompletionIntegers K).units :=
  a.2
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
 
def principalSubgroup : Subgroup (IdeleGroup K) :=
  (principalIdele K).range
end IdeleGroup
 
abbrev IdeleClassGroup :=
  IdeleGroup K ⧸ IdeleGroup.principalSubgroup K
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
 
def fieldInclusion :
    L →+* RelativeAdeleRing K L :=
  (Algebra.TensorProduct.includeRight
    (R := K) (A := NumberField.AdeleRing (𝓞 K) K)
    (B := L)).toRingHom
 
def inclusion :
    IdeleGroup K →* RelativeIdeleGroup K L :=
  (Units.map (adeleInclusion K L)).comp
    (IdeleGroup.equivAdeleRingUnits (K := K)).toMonoidHom
 
def principalIdele :
    Lˣ →* RelativeIdeleGroup K L :=
  Units.map (fieldInclusion K L)
 

def norm :
    RelativeIdeleGroup K L →* IdeleGroup K :=
  (IdeleGroup.equivAdeleRingUnits (K := K)).symm.toMonoidHom.comp
    (Units.map
      (Algebra.norm
        (NumberField.AdeleRing (𝓞 K) K)))
omit [NumberField L] in
 
theorem norm_fieldInclusion (x : L) :
    Algebra.norm (NumberField.AdeleRing (𝓞 K) K)
        (fieldInclusion K L x) =
      algebraMap K (NumberField.AdeleRing (𝓞 K) K)
        (Algebra.norm K x) := by
  classical
  let b := Module.Free.chooseBasis K L
  let bA := b.baseChange
    (NumberField.AdeleRing (𝓞 K) K)
  rw [Algebra.norm_eq_matrix_det bA,
    Algebra.norm_eq_matrix_det b,
    (algebraMap K
      (NumberField.AdeleRing (𝓞 K) K)).map_det]
  congr 1
  ext i j
  simp [bA, b, fieldInclusion,
    Algebra.smul_def,
    Algebra.leftMulMatrix_eq_repr_mul,
    Algebra.TensorProduct.tmul_mul_tmul]
omit [NumberField L] in
 

@[simp]
theorem norm_principalIdele (x : Lˣ) :
    norm K L (principalIdele K L x) =
      IdeleGroup.principalIdele K
        (Units.map (Algebra.norm K) x) := by
  apply (IdeleGroup.equivAdeleRingUnits (K := K)).injective
  apply Units.ext
  change
    Algebra.norm (NumberField.AdeleRing (𝓞 K) K)
        (fieldInclusion K L (x : L)) =
      algebraMap K (NumberField.AdeleRing (𝓞 K) K)
        (Algebra.norm K (x : L))
  exact norm_fieldInclusion K L (x : L)
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
omit [NumberField L] [FiniteDimensional K L] in
@[simp]
theorem RelativeIdeleGroup.finiteComponent_coe
    (v : HeightOneSpectrum (𝓞 K))
    (a : RelativeIdeleGroup K L) :
    ((RelativeIdeleGroup.finiteComponent
        (K := K) (L := L) v a :
        (v.adicCompletion K ⊗[K] L)ˣ) :
        v.adicCompletion K ⊗[K] L) =
      relativeAdeleFiniteComponent
        (K := K) (L := L) v
        (a : RelativeAdeleRing K L) :=
  rfl
 
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
 

def infiniteLocalFieldIdeleInclusion
    (v : InfinitePlace K) :
    Lˣ →* (v.Completion ⊗[K] L)ˣ :=
  Units.map
    (Algebra.TensorProduct.includeRight
      (R := K) (A := v.Completion)
      (B := L)).toRingHom
omit [NumberField L] [FiniteDimensional K L] in
 

@[simp]
theorem RelativeIdeleGroup.infiniteComponent_principalIdele
    (v : InfinitePlace K) (x : Lˣ) :
    RelativeIdeleGroup.infiniteComponent
        (K := K) (L := L) v
        (RelativeIdeleGroup.principalIdele K L x) =
      infiniteLocalFieldIdeleInclusion
        (K := K) (L := L) v x := by
  apply Units.ext
  rfl
 

def localFieldIdeleInclusion
    (v : HeightOneSpectrum (𝓞 K)) :
    Lˣ →* (v.adicCompletion K ⊗[K] L)ˣ :=
  Units.map
    (Algebra.TensorProduct.includeRight
      (R := K) (A := v.adicCompletion K)
      (B := L)).toRingHom
omit [NumberField L] [FiniteDimensional K L] in
 

@[simp]
theorem RelativeIdeleGroup.finiteComponent_principalIdele
    (v : HeightOneSpectrum (𝓞 K)) (x : Lˣ) :
    RelativeIdeleGroup.finiteComponent
        (K := K) (L := L) v
        (RelativeIdeleGroup.principalIdele K L x) =
      localFieldIdeleInclusion (K := K) (L := L) v x := by
  apply Units.ext
  rfl
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
 

theorem finite_adeleNonIntegralPlaces
    (a : NumberField.AdeleRing (𝓞 K) K) :
    {w : HeightOneSpectrum (𝓞 K) |
      a.2 w ∉ w.adicCompletionIntegers K}.Finite :=
  Filter.eventually_cofinite.mp a.2.2
 

noncomputable def adeleNonIntegralPlaces
    (a : NumberField.AdeleRing (𝓞 K) K) :
    Finset (HeightOneSpectrum (𝓞 K)) :=
  (finite_adeleNonIntegralPlaces (K := K) a).toFinset
@[simp]
theorem mem_adeleNonIntegralPlaces_iff
    (a : NumberField.AdeleRing (𝓞 K) K)
    (w : HeightOneSpectrum (𝓞 K)) :
    w ∈ adeleNonIntegralPlaces (K := K) a ↔
      a.2 w ∉ w.adicCompletionIntegers K := by
  exact
    Set.Finite.mem_toFinset
      (finite_adeleNonIntegralPlaces (K := K) a)
 

noncomputable def relativeAdeleCoefficientSupport
    (z : RelativeAdeleRing K L) :
    Finset (HeightOneSpectrum (𝓞 K)) := by
  classical
  exact Finset.univ.biUnion fun i =>
    adeleNonIntegralPlaces
      (K := K)
      (relativeAdeleCoefficient
        (K := K) (L := L) z i)
omit [NumberField L] in
@[simp]
theorem mem_relativeAdeleCoefficientSupport_iff
    (z : RelativeAdeleRing K L)
    (w : HeightOneSpectrum (𝓞 K)) :
    w ∈ relativeAdeleCoefficientSupport
        (K := K) (L := L) z ↔
      ∃ i : RelativeAdeleBasisIndex (K := K) (L := L),
        (relativeAdeleCoefficient
            (K := K) (L := L) z i).2 w ∉
          w.adicCompletionIntegers K := by
  classical
  simp [relativeAdeleCoefficientSupport]
 

noncomputable def relativeIdeleCoefficientSupport
    (z : RelativeIdeleGroup K L) :
    Finset (HeightOneSpectrum (𝓞 K)) := by
  classical
  exact
    relativeAdeleCoefficientSupport
        (K := K) (L := L)
        (z : RelativeAdeleRing K L) ∪
      relativeAdeleCoefficientSupport
        (K := K) (L := L)
        ((z⁻¹ : RelativeIdeleGroup K L) :
          RelativeAdeleRing K L)
omit [NumberField L] in
@[simp]
theorem mem_relativeIdeleCoefficientSupport_iff
    (z : RelativeIdeleGroup K L)
    (w : HeightOneSpectrum (𝓞 K)) :
    w ∈ relativeIdeleCoefficientSupport
        (K := K) (L := L) z ↔
      (∃ i : RelativeAdeleBasisIndex (K := K) (L := L),
        (relativeAdeleCoefficient
            (K := K) (L := L)
            (z : RelativeAdeleRing K L) i).2 w ∉
          w.adicCompletionIntegers K) ∨
      (∃ i : RelativeAdeleBasisIndex (K := K) (L := L),
        (relativeAdeleCoefficient
            (K := K) (L := L)
            ((z⁻¹ : RelativeIdeleGroup K L) :
              RelativeAdeleRing K L) i).2 w ∉
          w.adicCompletionIntegers K) := by
  classical
  simp [relativeIdeleCoefficientSupport]
omit [NumberField L] in
 


theorem relativeIdele_coefficients_integral_of_notMem
    (z : RelativeIdeleGroup K L)
    (w : HeightOneSpectrum (𝓞 K))
    (hw : w ∉ relativeIdeleCoefficientSupport
      (K := K) (L := L) z) :
    (∀ i : RelativeAdeleBasisIndex (K := K) (L := L),
      (relativeAdeleCoefficient
          (K := K) (L := L)
          (z : RelativeAdeleRing K L) i).2 w ∈
        w.adicCompletionIntegers K) ∧
    (∀ i : RelativeAdeleBasisIndex (K := K) (L := L),
      (relativeAdeleCoefficient
          (K := K) (L := L)
          ((z⁻¹ : RelativeIdeleGroup K L) :
            RelativeAdeleRing K L) i).2 w ∈
        w.adicCompletionIntegers K) := by
  constructor
  · intro i
    by_contra hi
    apply hw
    exact
      (mem_relativeIdeleCoefficientSupport_iff
        (K := K) (L := L) z w).2
        (Or.inl ⟨i, hi⟩)
  · intro i
    by_contra hi
    apply hw
    exact
      (mem_relativeIdeleCoefficientSupport_iff
        (K := K) (L := L) z w).2
        (Or.inr ⟨i, hi⟩)
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
omit [NumberField L] in
 

theorem relativeIdele_finiteComponent_eq_sum_tmul_coefficients
    (z : RelativeIdeleGroup K L)
    (w : HeightOneSpectrum (𝓞 K)) :
    ((RelativeIdeleGroup.finiteComponent
        (K := K) (L := L) w z :
        (w.adicCompletion K ⊗[K] L)ˣ) :
        w.adicCompletion K ⊗[K] L) =
      ∑ i : RelativeAdeleBasisIndex (K := K) (L := L),
        (relativeAdeleCoefficient
            (K := K) (L := L)
            (z : RelativeAdeleRing K L) i).2 w ⊗ₜ[K]
          relativeExtensionBasis (K := K) (L := L) i := by
  rw [RelativeIdeleGroup.finiteComponent_coe]
  exact
    relativeAdeleFiniteComponent_eq_sum_tmul_coefficients
      (K := K) (L := L)
      (z : RelativeAdeleRing K L) w
omit [NumberField L] in
 

theorem relativeIdele_finiteComponent_basisIntegral_of_notMem
    (z : RelativeIdeleGroup K L)
    (w : HeightOneSpectrum (𝓞 K))
    (hw : w ∉ relativeIdeleCoefficientSupport
      (K := K) (L := L) z) :
    RelativeBasisIntegralAt
      (K := K) (L := L) w
      ((RelativeIdeleGroup.finiteComponent
          (K := K) (L := L) w z :
          (w.adicCompletion K ⊗[K] L)ˣ) :
          w.adicCompletion K ⊗[K] L) := by
  let c :
      ∀ i : RelativeAdeleBasisIndex (K := K) (L := L),
        w.adicCompletionIntegers K :=
    fun i =>
      ⟨(relativeAdeleCoefficient
          (K := K) (L := L)
          (z : RelativeAdeleRing K L) i).2 w,
        (relativeIdele_coefficients_integral_of_notMem
          (K := K) (L := L) z w hw).1 i⟩
  refine ⟨c, ?_⟩
  simpa only [c, Subtype.coe_mk] using
    relativeIdele_finiteComponent_eq_sum_tmul_coefficients
      (K := K) (L := L) z w
omit [NumberField L] in
 

theorem relativeIdele_inverse_finiteComponent_basisIntegral_of_notMem
    (z : RelativeIdeleGroup K L)
    (w : HeightOneSpectrum (𝓞 K))
    (hw : w ∉ relativeIdeleCoefficientSupport
      (K := K) (L := L) z) :
    RelativeBasisIntegralAt
      (K := K) (L := L) w
      ((RelativeIdeleGroup.finiteComponent
          (K := K) (L := L) w
          (z⁻¹ : RelativeIdeleGroup K L) :
          (w.adicCompletion K ⊗[K] L)ˣ) :
          w.adicCompletion K ⊗[K] L) := by
  let c :
      ∀ i : RelativeAdeleBasisIndex (K := K) (L := L),
        w.adicCompletionIntegers K :=
    fun i =>
      ⟨(relativeAdeleCoefficient
          (K := K) (L := L)
          ((z⁻¹ : RelativeIdeleGroup K L) :
            RelativeAdeleRing K L) i).2 w,
        (relativeIdele_coefficients_integral_of_notMem
          (K := K) (L := L) z w hw).2 i⟩
  refine ⟨c, ?_⟩
  simpa only [c, Subtype.coe_mk] using
    relativeIdele_finiteComponent_eq_sum_tmul_coefficients
      (K := K) (L := L)
      (z⁻¹ : RelativeIdeleGroup K L) w
omit [NumberField L] in
 

theorem relativeIdele_finiteComponent_inv_basisIntegral_of_notMem
    (z : RelativeIdeleGroup K L)
    (w : HeightOneSpectrum (𝓞 K))
    (hw : w ∉ relativeIdeleCoefficientSupport
      (K := K) (L := L) z) :
    RelativeBasisIntegralAt
      (K := K) (L := L) w
      ((((RelativeIdeleGroup.finiteComponent
          (K := K) (L := L) w z)⁻¹ :
          (w.adicCompletion K ⊗[K] L)ˣ) :
          w.adicCompletion K ⊗[K] L)) := by
  simpa using
    relativeIdele_inverse_finiteComponent_basisIntegral_of_notMem
      (K := K) (L := L) z w hw
omit [NumberField L] in
 

theorem relativeIdele_finiteComponent_basisIntegralUnit_of_notMem
    (z : RelativeIdeleGroup K L)
    (w : HeightOneSpectrum (𝓞 K))
    (hw : w ∉ relativeIdeleCoefficientSupport
      (K := K) (L := L) z) :
    RelativeBasisIntegralUnitAt
      (K := K) (L := L) w
      (RelativeIdeleGroup.finiteComponent
        (K := K) (L := L) w z) :=
  ⟨relativeIdele_finiteComponent_basisIntegral_of_notMem
      (K := K) (L := L) z w hw,
    relativeIdele_finiteComponent_inv_basisIntegral_of_notMem
      (K := K) (L := L) z w hw⟩
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
theorem toCompletion_apply
    {K : Type u} [Field K] (vK : AbsoluteValue K ℝ) (x : K) :
    toCompletion vK x = ((WithAbs.equiv vK).symm x : vK.Completion) :=
  rfl
 
@[simp]
theorem toCompletion_eq_algebraMap
    {K : Type u} [Field K] (vK : AbsoluteValue K ℝ) (x : K) :
    toCompletion vK x = algebraMap K vK.Completion x :=
  rfl
 
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
 
theorem completionAbsoluteValue_isNonarchimedean
    {K : Type u} [Field K] (vK : AbsoluteValue K ℝ)
    (hvK : IsNonarchimedean (vK : K → ℝ)) :
    IsNonarchimedean
      (completionAbsoluteValue vK : vK.Completion → ℝ) := by
  rw [isNonarchimedean_iff_bounded_nat]
  refine ⟨1, fun n ↦ ?_⟩
  rw [← map_natCast (algebraMap K vK.Completion) n,
    ← toCompletion_eq_algebraMap vK (n : K)]
  change completionAbsoluteValue vK
    (((WithAbs.equiv vK).symm (n : K) : WithAbs vK) :
      vK.Completion) ≤ 1
  rw [completionAbsoluteValue_coe]
  exact hvK.apply_natCast_le_one
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
@[simp]
theorem completionTensorDecomposition_left_tmul_apply
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (b : vK.Completion) (a : L)
    (w : AbsoluteValueExtension vK L) :
    letI : ∀ w : AbsoluteValueExtension vK L,
        Algebra vK.Completion w.1.Completion :=
      fun w ↦ AbsoluteValue.completionAlgebra vK w.1 w.2
    completionTensorDecomposition_left (K := K) (L := L) vK hvK (b ⊗ₜ[K] a) w =
      algebraMap vK.Completion w.1.Completion b *
        AbsoluteValue.toCompletionAlgHom (K := K) w.1 a := by
  let : ∀ w : AbsoluteValueExtension vK L,
      Algebra vK.Completion w.1.Completion :=
    fun w ↦ AbsoluteValue.completionAlgebra vK w.1 w.2
  change completionTensorMap_leftCanonicalHom (K := K) (L := L) vK
    (b ⊗ₜ[K] a) w = _
  exact completionTensorMap_leftCanonicalHom_tmul_apply vK b a w
 

noncomputable def localTensorUnitsEquivCompletionProduct
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial) :
    letI : ∀ w' : AbsoluteValueExtension vK L,
        Algebra vK.Completion w'.1.Completion :=
      fun w' ↦ AbsoluteValue.completionAlgebra vK w'.1 w'.2
    (vK.Completion ⊗[K] L)ˣ ≃*
      (∀ w' : AbsoluteValueExtension vK L,
        w'.1.Completionˣ) := by
  letI : ∀ w' : AbsoluteValueExtension vK L,
      Algebra vK.Completion w'.1.Completion :=
    fun w' ↦ AbsoluteValue.completionAlgebra vK w'.1 w'.2
  exact
    (Units.mapEquiv
      (completionTensorDecomposition_left
        (K := K) (L := L) vK hvK).toMulEquiv).trans
      MulEquiv.piUnits
end Valuations
end AlgebraicNumberTheory
end
end

/- ClassFieldTheory.LocalClassFieldTheory.ClassFormation.LocalBlocks.Tensor -/
section
open scoped TensorProduct
noncomputable section
namespace LocalClassFieldTheory
open AlgebraicNumberTheory.Valuations


universe u v
variable {K : Type u} {L : Type v}
    [Field K] [Field L] [Algebra K L]
    [FiniteDimensional K L]
    [IsGalois K L]
 

abbrev LocalTensorAlgebra (vK : AbsoluteValue K ℝ) :=
  vK.Completion ⊗[K] L
section RightCosetCoordinates
universe uG uB
variable {G : Type uG} {B : Type uB}
    [Group G] [CommGroup B]
    (H : Subgroup G) [MulDistribMulAction H B]
end RightCosetCoordinates
section ExtensionOrbit
variable (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (w : AbsoluteValueExtension vK L)
end ExtensionOrbit
section ProductEquivalences
variable (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (w : AbsoluteValueExtension vK L)
end ProductEquivalences
end LocalClassFieldTheory
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

/- ValuedFieldTheory.Ramification.HilbertRamification.LocalizationDensity -/
section
noncomputable section
universe u v
namespace HilbertRamification

open AlgebraicNumberTheory.Valuations
variable {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
section AbsoluteValuePrincipalUnits
variable {F : Type*} [Field F]
end AbsoluteValuePrincipalUnits
namespace ValuationSubring
end ValuationSubring
section Localization
variable (vK : AbsoluteValue K ℝ)
variable (w : AbsoluteValueExtension vK L)
local instance completionAlgebra : Algebra vK.Completion w.1.Completion :=
  AbsoluteValue.completionAlgebra vK w.1 w.2
end Localization
end HilbertRamification
end
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
end FiniteIdeleGroup
namespace FractionalIdealGroup
end FractionalIdealGroup
namespace FiniteIdeleGroup
end FiniteIdeleGroup
namespace IdeleGroup
end IdeleGroup
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.Idele.ClassGroup.Tower -/
section
open scoped NumberField TensorProduct
open NumberField
noncomputable section
universe u
variable
    (K M L : Type u)
    [Field K] [NumberField K]
    [Field M] [NumberField M]
    [Field L] [NumberField L]
    [Algebra K M] [Algebra M L] [Algebra K L]
    [IsScalarTower K M L]
    [FiniteDimensional K M] [FiniteDimensional M L]
 

noncomputable instance (priority := 100)
    relativeAdeleRingIntermediateAlgebra :
    Algebra M (RelativeAdeleRing K M) :=
  Algebra.TensorProduct.rightAlgebra
 

abbrev TowerRelativeAdeleRing :=
  RelativeAdeleRing K M ⊗[M] L
 

noncomputable instance (priority := 100)
    relativeAdeleRingTopIntermediateAlgebra :
    Algebra M (RelativeAdeleRing K L) :=
  ((Algebra.TensorProduct.includeRight
      (R := K)
      (A := NumberField.AdeleRing (𝓞 K) K)
      (B := L)).toRingHom.comp
        (algebraMap M L)).toAlgebra
 
def intermediateAdeleInclusion :
    RelativeAdeleRing K M →ₐ[M]
      RelativeAdeleRing K L where
  __ :=
    (Algebra.TensorProduct.map
      (AlgHom.id
        (NumberField.AdeleRing (𝓞 K) K)
        (NumberField.AdeleRing (𝓞 K) K))
      (IsScalarTower.toAlgHom K M L)).toRingHom
  commutes' m := by
    change
      1 ⊗ₜ[K] algebraMap M L m =
        1 ⊗ₜ[K] algebraMap M L m
    rfl
omit [NumberField M] [NumberField L]
    [FiniteDimensional K M] [FiniteDimensional M L] in
@[simp]
theorem intermediateAdeleInclusion_tmul
    (a : NumberField.AdeleRing (𝓞 K) K)
    (m : M) :
    intermediateAdeleInclusion K M L (a ⊗ₜ[K] m) =
      a ⊗ₜ[K] algebraMap M L m :=
  rfl
 

def topFieldToOneStep :
    L →ₐ[M] RelativeAdeleRing K L where
  __ :=
    (Algebra.TensorProduct.includeRight
      (R := K)
      (A := NumberField.AdeleRing (𝓞 K) K)
      (B := L)).toRingHom
  commutes' _ := rfl
omit [NumberField M] [NumberField L] [Algebra K M]
    [IsScalarTower K M L]
    [FiniteDimensional K M] [FiniteDimensional M L] in
@[simp]
theorem topFieldToOneStep_apply
    (x : L) :
    topFieldToOneStep K M L x =
      (1 : NumberField.AdeleRing (𝓞 K) K) ⊗ₜ[K] x :=
  rfl
 





def towerRelativeAdeleRingEquiv :
    TowerRelativeAdeleRing K M L ≃+*
      RelativeAdeleRing K L := by
  letI : Algebra L (TowerRelativeAdeleRing K M L) :=
    Algebra.TensorProduct.rightAlgebra
  let e₁ :=
    (Algebra.TensorProduct.commRight
      M L (RelativeAdeleRing K M)).symm
  let e₂ :=
    Algebra.TensorProduct.congr
      (AlgEquiv.refl : L ≃ₐ[M] L)
      (Algebra.TensorProduct.commRight K M
        (NumberField.AdeleRing (𝓞 K) K)).symm
  let e₃ :=
    Algebra.TensorProduct.cancelBaseChange
      K M L L (NumberField.AdeleRing (𝓞 K) K)
  let e₄ :=
    Algebra.TensorProduct.commRight
      K L (NumberField.AdeleRing (𝓞 K) K)
  exact
    e₁.toRingEquiv.trans
      (e₂.toRingEquiv.trans
        (e₃.toRingEquiv.trans e₄.toRingEquiv))
 

def towerRelativeAdeleFlatten :
    TowerRelativeAdeleRing K M L →ₐ[M]
      RelativeAdeleRing K L :=
  { (towerRelativeAdeleRingEquiv K M L).toRingHom with
    commutes' := by
      intro m
      change _ =
        (1 : NumberField.AdeleRing (𝓞 K) K) ⊗ₜ[K]
          algebraMap M L m
      simp [towerRelativeAdeleRingEquiv,
        Algebra.TensorProduct.right_algebraMap_apply,
        Algebra.smul_def] }
omit [NumberField M] [NumberField L]
    [FiniteDimensional K M] [FiniteDimensional M L] in
@[simp]
theorem towerRelativeAdeleFlatten_tmul
    (b : RelativeAdeleRing K M)
    (x : L) :
    towerRelativeAdeleFlatten K M L (b ⊗ₜ[M] x) =
      intermediateAdeleInclusion K M L b *
        topFieldToOneStep K M L x := by
  induction b using TensorProduct.induction_on with
  | zero => simp
  | add b₁ b₂ hb₁ hb₂ =>
      simp only [TensorProduct.add_tmul, map_add,
        add_mul, hb₁, hb₂]
  | tmul a m =>
      simp [towerRelativeAdeleFlatten,
        towerRelativeAdeleRingEquiv,
        intermediateAdeleInclusion_tmul,
        topFieldToOneStep_apply,
        Algebra.TensorProduct.tmul_mul_tmul,
        Algebra.smul_def]
 
def bottomAdeleToTower :
    NumberField.AdeleRing (𝓞 K) K →ₐ[K]
      TowerRelativeAdeleRing K M L :=
  (Algebra.TensorProduct.includeLeft
      (R := M) (S := K)
      (A := RelativeAdeleRing K M) (B := L)).comp
    (Algebra.TensorProduct.includeLeft
      (R := K) (S := K)
      (A := NumberField.AdeleRing (𝓞 K) K) (B := M))
 
def towerRelativeAdeleUnflatten :
    RelativeAdeleRing K L →ₐ[K]
      TowerRelativeAdeleRing K M L :=
  { (towerRelativeAdeleRingEquiv K M L).symm.toRingHom with
    commutes' := by
      intro k
      simp [towerRelativeAdeleRingEquiv] }
 

def towerRelativeAdeleAlgEquiv :
    TowerRelativeAdeleRing K M L ≃ₐ[
      NumberField.AdeleRing (𝓞 K) K]
      RelativeAdeleRing K L :=
  { towerRelativeAdeleRingEquiv K M L with
    commutes' := by
      intro a
      change
        towerRelativeAdeleFlatten K M L
            ((a ⊗ₜ[K] (1 : M)) ⊗ₜ[M] (1 : L)) =
          a ⊗ₜ[K] (1 : L)
      simp }
namespace TowerRelativeIdeleGroup
end TowerRelativeIdeleGroup
section NormQuotientSequence
end NormQuotientSequence
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

/- ClassFieldTheory.AlgebraicNumberTheory.SeparableClosureEmbedding -/
section
noncomputable section
namespace AlgebraicNumberTheory
universe u v
variable (K : Type u) (L : Type v) [Field K] [Field L] [Algebra K L]
  [Algebra.IsSeparable K L]
 

noncomputable def separableEmbeddingIntoSeparableClosure :
    L →ₐ[K] SeparableClosure K :=
  IsSepClosed.lift
variable (K : Type*) [Field K] [NumberField K]
end AlgebraicNumberTheory
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
 

noncomputable def absoluteValueCompletionIntegers
    {F : Type*} [Field F]
    (vF : AbsoluteValue F ℝ)
    (hvF : IsNonarchimedean (vF : F → ℝ)) :
    ValuationSubring vF.Completion :=
  (realAbsoluteValueValuation
    (AbsoluteValue.completionAbsoluteValue vF)
    (AbsoluteValue.completionAbsoluteValue_isNonarchimedean
      vF hvF)).valuationSubring
 
@[simp]
theorem mem_absoluteValueCompletionIntegers_iff
    {F : Type*} [Field F]
    (vF : AbsoluteValue F ℝ)
    (hvF : IsNonarchimedean (vF : F → ℝ))
    (x : vF.Completion) :
    x ∈ absoluteValueCompletionIntegers vF hvF ↔
      ‖x‖ ≤ 1 :=
  Iff.rfl
omit [NumberField K] [NumberField L] in
 




theorem isIntegral_over_baseCompletionIntegers_of_mem
    [Algebra.IsSeparable K L]
    (vK : AbsoluteValue K ℝ)
    (hvK : IsNonarchimedean (vK : K → ℝ))
    (hvK0 : vK.IsNontrivial)
    (w : AbsoluteValueExtension vK L)
    {x : w.1.Completion}
    (hx : x ∈ absoluteValueCompletionIntegers w.1
      (absoluteValueExtension_isNonarchimedean vK hvK w)) :
    letI := AbsoluteValue.completionAlgebra vK w.1 w.2
    IsIntegral (absoluteValueCompletionIntegers vK hvK) x := by
  letI : Algebra vK.Completion w.1.Completion := AbsoluteValue.completionAlgebra vK w.1 w.2
  letI : Module.Finite vK.Completion w.1.Completion := completionModuleFinite vK hvK0 w
  letI : NontriviallyNormedField vK.Completion := absoluteValueExtension_completionNontriviallyNormedField vK hvK0
  letI : NormedAlgebra vK.Completion w.1.Completion := absoluteValueExtension_completionNormedAlgebra vK w
  letI : IsUltrametricDist vK.Completion :=
    IsUltrametricDist.isUltrametricDist_of_isNonarchimedean_norm
      (AbsoluteValue.completionAbsoluteValue_isNonarchimedean vK hvK)
  exact TunnellSpectral.integral (absoluteValueCompletionIntegers vK hvK)
    (fun _ => Iff.rfl) x hx
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.Adele.IntegralTensorSupport.Lattice -/
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
 

theorem exists_integral_relativeBasis_scale :
    ∃ d : ℤ, d ≠ 0 ∧
      ∀ i : RelativeAdeleBasisIndex (K := K) (L := L),
        IsIntegral ℤ
          (d • relativeExtensionBasis
            (K := K) (L := L) i) := by
  classical
  let : Algebra.IsAlgebraic ℤ L :=
    (IsFractionRing.isAlgebraic_iff' ℤ (𝓞 L) L).mp
      inferInstance
  let s : Finset L :=
    Finset.univ.image fun i :
      RelativeAdeleBasisIndex (K := K) (L := L) =>
        relativeExtensionBasis (K := K) (L := L) i
  obtain ⟨d, hd, hint⟩ :=
    Algebra.IsAlgebraic.exists_integral_multiples ℤ s
  refine ⟨d, hd, ?_⟩
  intro i
  exact
    hint
      (relativeExtensionBasis (K := K) (L := L) i)
      (Finset.mem_image.mpr
        ⟨i, Finset.mem_univ i, rfl⟩)
 
noncomputable def chosenRelativeBasisIntegralScale : ℤ :=
  Classical.choose
    (exists_integral_relativeBasis_scale
      (K := K) (L := L))
 
theorem chosenRelativeBasisIntegralScale_ne_zero :
    chosenRelativeBasisIntegralScale (K := K) (L := L) ≠ 0 :=
  (Classical.choose_spec
    (exists_integral_relativeBasis_scale
      (K := K) (L := L))).1
 
theorem chosenRelativeBasisIntegralScale_isIntegral
    (i : RelativeAdeleBasisIndex (K := K) (L := L)) :
    IsIntegral ℤ
      (chosenRelativeBasisIntegralScale (K := K) (L := L) •
        relativeExtensionBasis (K := K) (L := L) i) :=
  (Classical.choose_spec
    (exists_integral_relativeBasis_scale
      (K := K) (L := L))).2 i
 
noncomputable def relativeBasisIntegralScaleInK : K :=
  algebraMap ℤ K
    (chosenRelativeBasisIntegralScale (K := K) (L := L))
 
theorem relativeBasisIntegralScaleInK_ne_zero :
    relativeBasisIntegralScaleInK (K := K) (L := L) ≠ 0 := by
  intro h
  have hc :
      (chosenRelativeBasisIntegralScale
        (K := K) (L := L) : K) =
        ((0 : ℤ) : K) := by
    simpa [relativeBasisIntegralScaleInK] using h
  exact
    chosenRelativeBasisIntegralScale_ne_zero
      (K := K) (L := L)
      (Int.cast_injective hc)
 
noncomputable def relativeBasisIntegralScaleUnit : Kˣ :=
  Units.mk0
    (relativeBasisIntegralScaleInK (K := K) (L := L))
    (relativeBasisIntegralScaleInK_ne_zero
      (K := K) (L := L))
 

noncomputable def scaledRelativeExtensionBasis :
    Module.Basis
      (RelativeAdeleBasisIndex (K := K) (L := L)) K L :=
  (relativeExtensionBasis (K := K) (L := L)).unitsSMul
    fun _ => relativeBasisIntegralScaleUnit
      (K := K) (L := L)
 

@[simp]
theorem scaledRelativeExtensionBasis_apply
    (i : RelativeAdeleBasisIndex (K := K) (L := L)) :
    scaledRelativeExtensionBasis (K := K) (L := L) i =
      relativeBasisIntegralScaleInK
          (K := K) (L := L) •
        relativeExtensionBasis (K := K) (L := L) i := by
  rw [scaledRelativeExtensionBasis,
    Module.Basis.unitsSMul_apply]
  rfl
 
theorem scaledRelativeExtensionBasis_isIntegral
    (i : RelativeAdeleBasisIndex (K := K) (L := L)) :
    IsIntegral ℤ
      (scaledRelativeExtensionBasis
        (K := K) (L := L) i) := by
  simpa [scaledRelativeExtensionBasis_apply,
    relativeBasisIntegralScaleInK, Algebra.smul_def] using
      chosenRelativeBasisIntegralScale_isIntegral
        (K := K) (L := L) i
 

theorem scaledRelativeExtensionBasis_absoluteValue_le_one
    (vK : AbsoluteValue K ℝ)
    (hvK : IsNonarchimedean (vK : K → ℝ))
    (wL : AbsoluteValueExtension vK L)
    (i : RelativeAdeleBasisIndex (K := K) (L := L)) :
    wL.1
      (scaledRelativeExtensionBasis
        (K := K) (L := L) i) ≤ 1 :=
  absoluteValue_le_one_of_isIntegral
    wL.1
    (absoluteValueExtension_isNonarchimedean
      vK hvK wL)
    (scaledRelativeExtensionBasis_isIntegral
      (K := K) (L := L) i)
 
noncomputable def scaledRelativeExtensionInteger
    (i : RelativeAdeleBasisIndex (K := K) (L := L)) :
    𝓞 L :=
  ⟨scaledRelativeExtensionBasis (K := K) (L := L) i,
    scaledRelativeExtensionBasis_isIntegral
      (K := K) (L := L) i⟩
 
noncomputable def scaledRelativeIntegerLattice :
    Submodule (𝓞 K) (𝓞 L) :=
  Submodule.span (𝓞 K)
    (Set.range
      (scaledRelativeExtensionInteger
        (K := K) (L := L)))
 
noncomputable def scaledRelativeFieldLattice :
    Submodule (𝓞 K) L :=
  Submodule.span (𝓞 K)
    (Set.range
      (scaledRelativeExtensionBasis
        (K := K) (L := L)))
 
noncomputable def ringOfIntegersToFieldLinearMap :
    𝓞 L →ₗ[𝓞 K] L :=
  (IsScalarTower.toAlgHom (𝓞 K) (𝓞 L) L).toLinearMap
 

theorem scaledRelativeIntegerLattice_map_toField :
    (scaledRelativeIntegerLattice
      (K := K) (L := L)).map
        (ringOfIntegersToFieldLinearMap
          (K := K) (L := L)) =
      scaledRelativeFieldLattice
        (K := K) (L := L) := by
  rw [scaledRelativeIntegerLattice,
    scaledRelativeFieldLattice,
    Submodule.map_span]
  congr 1
  exact
    (Set.range_comp
      (ringOfIntegersToFieldLinearMap (K := K) (L := L))
      (scaledRelativeExtensionInteger (K := K) (L := L))).symm
omit [NumberField K] [NumberField L] [FiniteDimensional K L] in
 
theorem ringOfIntegersToFieldLinearMap_injective :
    Function.Injective
      (ringOfIntegersToFieldLinearMap
        (K := K) (L := L)) := by
  intro x y h
  exact NumberField.RingOfIntegers.ext h
 



theorem exists_nonZeroDivisor_smul_mem_scaledRelativeIntegerLattice
    (x : 𝓞 L) :
    ∃ d : nonZeroDivisors (𝓞 K),
      (d : 𝓞 K) • x ∈
        scaledRelativeIntegerLattice
          (K := K) (L := L) := by
  let s : Set L :=
    Set.range
      (scaledRelativeExtensionBasis
        (K := K) (L := L))
  have hx :
      (x : L) ∈ Submodule.span K s := by
    change
      (x : L) ∈
        Submodule.span K
          (Set.range
            (scaledRelativeExtensionBasis
              (K := K) (L := L)))
    rw [(scaledRelativeExtensionBasis
      (K := K) (L := L)).span_eq]
    exact Submodule.mem_top
  obtain ⟨d, hd⟩ :=
    multiple_mem_span_of_mem_localization_span
      (nonZeroDivisors (𝓞 K)) K s (x : L) hx
  refine ⟨d, ?_⟩
  have hdmap :
      d • (x : L) ∈
        (scaledRelativeIntegerLattice
          (K := K) (L := L)).map
            (ringOfIntegersToFieldLinearMap
              (K := K) (L := L)) := by
    rw [scaledRelativeIntegerLattice_map_toField
      (K := K) (L := L)]
    exact hd
  obtain ⟨y, hy, hyx⟩ := hdmap
  have hyx' : y = (d : 𝓞 K) • x := by
    apply ringOfIntegersToFieldLinearMap_injective
      (K := K) (L := L)
    simpa [ringOfIntegersToFieldLinearMap,
      Submonoid.smul_def] using hyx
  rw [← hyx']
  exact hy
 

abbrev ScaledRelativeIntegerLatticeQuotient :=
  (𝓞 L) ⧸
    scaledRelativeIntegerLattice
      (K := K) (L := L)
 
noncomputable instance
    scaledRelativeIntegerLatticeQuotientFinite :
    Module.Finite (𝓞 K)
      (ScaledRelativeIntegerLatticeQuotient
        (K := K) (L := L)) :=
  Module.Finite.quotient (𝓞 K)
    (scaledRelativeIntegerLattice
      (K := K) (L := L))
 
theorem scaledRelativeIntegerLatticeQuotient_isTorsion :
    Module.IsTorsion (𝓞 K)
      (ScaledRelativeIntegerLatticeQuotient
        (K := K) (L := L)) := by
  intro q
  refine
    Submodule.Quotient.induction_on
      (p := scaledRelativeIntegerLattice
        (K := K) (L := L)) q ?_
  intro x
  obtain ⟨d, hd⟩ :=
    exists_nonZeroDivisor_smul_mem_scaledRelativeIntegerLattice
      (K := K) (L := L) x
  refine ⟨d, ?_⟩
  rw [Submonoid.smul_def,
    ← Submodule.Quotient.mk_smul,
    Submodule.Quotient.mk_eq_zero]
  exact hd
 

noncomputable def chosenScaledRelativeIntegerLatticeAnnihilatorData :
    { r : 𝓞 K //
      r ∈
          (⊤ : Submodule (𝓞 K)
            (ScaledRelativeIntegerLatticeQuotient
              (K := K) (L := L))).annihilator ∧
        r ∈ nonZeroDivisors (𝓞 K) } := by
  let h :=
    Submodule.annihilator_top_inter_nonZeroDivisors
      (scaledRelativeIntegerLatticeQuotient_isTorsion
        (K := K) (L := L))
  exact
    ⟨Classical.choose h,
      (Classical.choose_spec h).1,
      (Classical.choose_spec h).2⟩
 
noncomputable def scaledRelativeIntegerLatticeAnnihilator :
    𝓞 K :=
  (chosenScaledRelativeIntegerLatticeAnnihilatorData
    (K := K) (L := L) : 𝓞 K)
 
theorem scaledRelativeIntegerLatticeAnnihilator_ne_zero :
    scaledRelativeIntegerLatticeAnnihilator
      (K := K) (L := L) ≠ 0 :=
  nonZeroDivisors.ne_zero
    (chosenScaledRelativeIntegerLatticeAnnihilatorData
      (K := K) (L := L)).2.2
 
noncomputable def relativeBasisIntegralScaleInRingOfIntegers :
    𝓞 K :=
  algebraMap ℤ (𝓞 K)
    (chosenRelativeBasisIntegralScale (K := K) (L := L))
 
theorem relativeBasisIntegralScaleInRingOfIntegers_ne_zero :
    relativeBasisIntegralScaleInRingOfIntegers
      (K := K) (L := L) ≠ 0 := by
  intro h
  have hc :
      (chosenRelativeBasisIntegralScale
        (K := K) (L := L) : 𝓞 K) =
        ((0 : ℤ) : 𝓞 K) := by
    simpa [relativeBasisIntegralScaleInRingOfIntegers] using h
  exact
    chosenRelativeBasisIntegralScale_ne_zero
      (K := K) (L := L)
      (Int.cast_injective hc)
 

noncomputable def integralTensorControlElement :
    𝓞 K :=
  relativeBasisIntegralScaleInRingOfIntegers
      (K := K) (L := L) *
    scaledRelativeIntegerLatticeAnnihilator
      (K := K) (L := L)
 
theorem integralTensorControlElement_ne_zero :
    integralTensorControlElement
      (K := K) (L := L) ≠ 0 :=
  mul_ne_zero
    (relativeBasisIntegralScaleInRingOfIntegers_ne_zero
      (K := K) (L := L))
    (scaledRelativeIntegerLatticeAnnihilator_ne_zero
      (K := K) (L := L))
 
noncomputable def integralTensorControlIdeal :
    Ideal (𝓞 K) :=
  Ideal.span
    ({integralTensorControlElement
      (K := K) (L := L)} : Set (𝓞 K))
 
theorem integralTensorControlIdeal_ne_bot :
    integralTensorControlIdeal
      (K := K) (L := L) ≠ ⊥ := by
  rw [integralTensorControlIdeal,
    ne_eq, Ideal.span_singleton_eq_bot]
  exact integralTensorControlElement_ne_zero
    (K := K) (L := L)
 

noncomputable def integralTensorBadPlaces :
    Finset (HeightOneSpectrum (𝓞 K)) :=
  (Ideal.finite_factors
    (integralTensorControlIdeal_ne_bot
      (K := K) (L := L))).toFinset
 

@[simp]
theorem mem_integralTensorBadPlaces_iff
    (w : HeightOneSpectrum (𝓞 K)) :
    w ∈ integralTensorBadPlaces
        (K := K) (L := L) ↔
      w.asIdeal ∣
        integralTensorControlIdeal
          (K := K) (L := L) :=
  Set.Finite.mem_toFinset
    (Ideal.finite_factors
      (integralTensorControlIdeal_ne_bot
        (K := K) (L := L)))
 

theorem integralTensorControlElement_not_mem_of_notMem
    (w : HeightOneSpectrum (𝓞 K))
    (hw : w ∉ integralTensorBadPlaces
      (K := K) (L := L)) :
    integralTensorControlElement
        (K := K) (L := L) ∉ w.asIdeal := by
  intro hmem
  apply hw
  rw [mem_integralTensorBadPlaces_iff,
    integralTensorControlIdeal,
    Ideal.dvd_span_singleton]
  exact hmem
 

theorem relativeBasisIntegralScale_not_mem_of_notMem
    (w : HeightOneSpectrum (𝓞 K))
    (hw : w ∉ integralTensorBadPlaces
      (K := K) (L := L)) :
    relativeBasisIntegralScaleInRingOfIntegers
        (K := K) (L := L) ∉ w.asIdeal := by
  intro hmem
  exact
    integralTensorControlElement_not_mem_of_notMem
      (K := K) (L := L) w hw
      (w.asIdeal.mul_mem_right
        (scaledRelativeIntegerLatticeAnnihilator
          (K := K) (L := L)) hmem)
 


theorem relativeExtensionBasis_absoluteValue_le_one_of_notMem
    (w : HeightOneSpectrum (𝓞 K))
    (hw : w ∉ integralTensorBadPlaces
      (K := K) (L := L))
    (wL : AbsoluteValueExtension
      (NumberField.HeightOneSpectrum.adicAbv K w) L)
    (i : RelativeAdeleBasisIndex (K := K) (L := L)) :
    wL.1
      (relativeExtensionBasis
        (K := K) (L := L) i) ≤ 1 := by
  let vK :=
    NumberField.HeightOneSpectrum.adicAbv K w
  have hdnot :
      relativeBasisIntegralScaleInRingOfIntegers
          (K := K) (L := L) ∉ w.asIdeal :=
    relativeBasisIntegralScale_not_mem_of_notMem
      (K := K) (L := L) w hw
  have hnorm :
      ‖FinitePlace.embedding w
        (algebraMap (𝓞 K) K
          (relativeBasisIntegralScaleInRingOfIntegers
            (K := K) (L := L)))‖ = 1 :=
    (FinitePlace.norm_eq_one_iff_notMem
      (R := 𝓞 K) K w
      (relativeBasisIntegralScaleInRingOfIntegers
        (K := K) (L := L))).2 hdnot
  have hvscaleInteger :
      vK
        (algebraMap (𝓞 K) K
          (relativeBasisIntegralScaleInRingOfIntegers
            (K := K) (L := L))) = 1 := by
    simpa [vK, FinitePlace.norm_embedding] using hnorm
  have hscaleField :
      relativeBasisIntegralScaleInK
          (K := K) (L := L) =
        algebraMap (𝓞 K) K
          (relativeBasisIntegralScaleInRingOfIntegers
            (K := K) (L := L)) := by
    simp [relativeBasisIntegralScaleInK,
      relativeBasisIntegralScaleInRingOfIntegers]
  have hvscale :
      vK
        (relativeBasisIntegralScaleInK
          (K := K) (L := L)) = 1 := by
    rw [hscaleField]
    exact hvscaleInteger
  have hwscale :
      wL.1
        (algebraMap K L
          (relativeBasisIntegralScaleInK
            (K := K) (L := L))) = 1 := by
    rw [wL.2]
    exact hvscale
  have hscaled :=
    scaledRelativeExtensionBasis_absoluteValue_le_one
      (K := K) (L := L) vK
      (NumberField.HeightOneSpectrum.isNonarchimedean_adicAbv
        K w) wL i
  rw [scaledRelativeExtensionBasis_apply,
    Algebra.smul_def, map_mul, hwscale, one_mul] at hscaled
  exact hscaled
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
 

noncomputable def relativeFinitePlaceLocalTensorAlgEquiv
    (w : HeightOneSpectrum (𝓞 K)) :
    (NumberField.HeightOneSpectrum.adicAbv K w).Completion ⊗[K] L
        ≃ₐ[K]
      w.adicCompletion K ⊗[K] L :=
  Algebra.TensorProduct.congr
    (relativeFinitePlaceCompletionAlgEquiv w)
    (AlgEquiv.refl : L ≃ₐ[K] L)
 

theorem norm_le_one_of_mem_adicCompletionIntegers
    (w : HeightOneSpectrum (𝓞 K))
    {x : w.adicCompletion K}
    (hx : x ∈ w.adicCompletionIntegers K) :
    ‖x‖ ≤ 1 := by
  rw [FinitePlace.norm_def]
  exact_mod_cast
    (WithZeroMulInt.toNNReal_le_one_iff
      (NumberField.HeightOneSpectrum.one_lt_absNorm_nnreal w)).2 hx
 

theorem mem_adicCompletionIntegers_of_norm_le_one
    (w : HeightOneSpectrum (𝓞 K))
    {x : w.adicCompletion K}
    (hx : ‖x‖ ≤ 1) :
    x ∈ w.adicCompletionIntegers K := by
  rw [FinitePlace.norm_def] at hx
  exact_mod_cast
    (WithZeroMulInt.toNNReal_le_one_iff
      (NumberField.HeightOneSpectrum.one_lt_absNorm_nnreal w)).1 hx
 

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
 


theorem basis_coord_isIntegral_of_integral_traces
    {R A B ι : Type*}
    [CommRing R] [Field A] [CommRing B]
    [Algebra R A] [Algebra A B]
    [Fintype ι] [DecidableEq ι]
    [Module.Free A B] [Module.Finite A B]
    (b : Module.Basis ι A B)
    {x : B}
    (hM : ∀ j k, IsIntegral R
      (Algebra.trace A B (b j * b k)))
    (ht : ∀ j, IsIntegral R
      (Algebra.trace A B (x * b j)))
    (hdiscInv : IsIntegral R (Algebra.discr A b)⁻¹)
    (hdiscne : Algebra.discr A b ≠ 0)
    (i : ι) :
    IsIntegral R (b.equivFun x i) := by
  let M : Matrix ι ι A := Algebra.traceMatrix A b
  let c : ι → A := b.equivFun x
  let t : ι → A := fun j => Algebra.trace A B (x * b j)
  have hM' : ∀ j k, IsIntegral R (M j k) := by
    intro j k
    exact hM j k
  have ht' : ∀ j, IsIntegral R (t j) := by
    intro j
    exact ht j
  have hcramer : IsIntegral R (M.cramer t i) := by
    rw [Matrix.cramer_apply]
    apply IsIntegral.det
    intro j k
    by_cases hki : k = i
    · simpa [Matrix.updateCol_apply, hki] using ht' j
    · simpa [Matrix.updateCol_apply, hki] using hM' j k
  have hmul : M.mulVec c = t :=
    Algebra.traceMatrix_of_basis_mulVec b x
  have hcramerEq : M.det • c = M.cramer t := by
    rw [Matrix.cramer_eq_adjugate_mulVec, ← hmul,
      Matrix.mulVec_mulVec, Matrix.adjugate_mul,
      Matrix.smul_mulVec, Matrix.one_mulVec]
  have hcoord :
      Algebra.discr A b * c i = M.cramer t i := by
    have hi := congrFun hcramerEq i
    simpa [M, Algebra.discr_def, Pi.smul_apply] using hi
  have hcEq :
      c i = (Algebra.discr A b)⁻¹ * M.cramer t i := by
    rw [← hcoord, ← mul_assoc, inv_mul_cancel₀ hdiscne, one_mul]
  change IsIntegral R (c i)
  rw [hcEq]
  exact hdiscInv.mul hcramer
omit [NumberField L] in
 

theorem trace_tensorProduct_basis_mul
    {ι : Type*} [Fintype ι]
    (b : Module.Basis ι K L)
    (A : Type*) [Field A] [Algebra K A]
    (i j : ι) :
    Algebra.trace A (A ⊗[K] L)
        ((Algebra.TensorProduct.basis A b i) *
          (Algebra.TensorProduct.basis A b j)) =
      algebraMap K A (Algebra.trace K L (b i * b j)) := by
  simp only [Algebra.TensorProduct.basis_apply,
    Algebra.TensorProduct.tmul_mul_tmul, one_mul]
  change LinearMap.trace A (A ⊗[K] L)
      (Algebra.lmul A (A ⊗[K] L) (1 ⊗ₜ[K] (b i * b j))) =
    _
  rw [← Algebra.baseChange_lmul]
  exact LinearMap.trace_baseChange (Algebra.lmul K L (b i * b j)) A
omit [NumberField L] in
 

theorem discr_tensorProduct_basis
    {ι : Type*} [Fintype ι] [DecidableEq ι]
    (b : Module.Basis ι K L)
    (A : Type*) [Field A] [Algebra K A] :
    Algebra.discr A (Algebra.TensorProduct.basis A b) =
      algebraMap K A (Algebra.discr K b) := by
  rw [Algebra.discr_def, Algebra.discr_def]
  rw [(algebraMap K A).map_det]
  congr 1
  ext i j
  exact trace_tensorProduct_basis_mul b A i j
omit [NumberField K] [NumberField L] in
 

theorem isIntegral_trace_tensor_of_components
    [Algebra.IsSeparable K L]
    (vK : AbsoluteValue K ℝ)
    (hvK : IsNonarchimedean (vK : K → ℝ))
    (hvK0 : vK.IsNontrivial)
    (x : vK.Completion ⊗[K] L)
    (hx : ∀ w : AbsoluteValueExtension vK L,
      completionTensorDecomposition_left
          (K := K) (L := L) vK hvK0 x w ∈
        absoluteValueCompletionIntegers w.1
          (absoluteValueExtension_isNonarchimedean vK hvK w)) :
    IsIntegral (absoluteValueCompletionIntegers vK hvK)
      (Algebra.trace vK.Completion
        (vK.Completion ⊗[K] L) x) := by
  classical
  let : Fintype (AbsoluteValueExtension vK L) :=
    completionTensorDecomposition_extensionFintype
      (K := K) (L := L) vK hvK0
  let : ∀ w : AbsoluteValueExtension vK L,
      Algebra vK.Completion w.1.Completion :=
    fun w => AbsoluteValue.completionAlgebra vK w.1 w.2
  let : ∀ w : AbsoluteValueExtension vK L,
      Module.Finite vK.Completion w.1.Completion :=
    fun w => completionModuleFinite vK hvK0 w
  let : ∀ w : AbsoluteValueExtension vK L,
      Module.Free vK.Completion w.1.Completion :=
    fun w => Module.Free.of_divisionRing
      vK.Completion w.1.Completion
  let y :
      ∀ w : AbsoluteValueExtension vK L, w.1.Completion :=
    completionTensorDecomposition_left
      (K := K) (L := L) vK hvK0 x
  have hy :
      ∀ w : AbsoluteValueExtension vK L,
        IsIntegral (absoluteValueCompletionIntegers vK hvK) (y w) := by
    intro w
    exact isIntegral_over_baseCompletionIntegers_of_mem
      (K := K) (L := L) vK hvK hvK0 w (hx w)
  have hsum :
      IsIntegral (absoluteValueCompletionIntegers vK hvK)
        (∑ w : AbsoluteValueExtension vK L,
          Algebra.trace vK.Completion w.1.Completion (y w)) := by
    apply IsIntegral.sum
    intro w _
    exact Algebra.isIntegral_trace (hy w)
  rw [← ValuationTheory.Completion.algebra_trace_pi_apply
    (fun w : AbsoluteValueExtension vK L => w.1.Completion) y] at hsum
  rw [Algebra.trace_eq_of_algEquiv
    (completionTensorDecomposition_left
      (K := K) (L := L) vK hvK0) x] at hsum
  exact hsum
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.Adele.IntegralTensorSupport.LocalTensorDecomposition -/
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
section LocalTensorDecompositionIntegralComparison
 

noncomputable def finitePlaceLocalTensorDecompositionComponent
    (w : HeightOneSpectrum (𝓞 K))
    (wL : AbsoluteValueExtension
      (NumberField.HeightOneSpectrum.adicAbv K w) L)
    (x : w.adicCompletion K ⊗[K] L) :
    wL.1.Completion := by
  let vK :=
    NumberField.HeightOneSpectrum.adicAbv K w
  let hvK : vK.IsNontrivial :=
    RayClass.adicAbv_isNontrivial w
  letI : ∀ u : AbsoluteValueExtension vK L,
      Algebra vK.Completion u.1.Completion :=
    fun u =>
      AbsoluteValue.completionAlgebra vK u.1 u.2
  exact
    completionTensorDecomposition_left
      (K := K) (L := L) vK hvK
      ((relativeFinitePlaceLocalTensorAlgEquiv
        (K := K) (L := L) w).symm x) wL
 

def RelativeLocalTensorDecompositionIntegralAt
    (w : HeightOneSpectrum (𝓞 K))
    (x : w.adicCompletion K ⊗[K] L) : Prop :=
  ∀ wL : AbsoluteValueExtension
      (NumberField.HeightOneSpectrum.adicAbv K w) L,
    finitePlaceLocalTensorDecompositionComponent
        (K := K) (L := L) w wL x ∈
      absoluteValueCompletionIntegers wL.1
        (absoluteValueExtension_isNonarchimedean
          (NumberField.HeightOneSpectrum.adicAbv K w)
          (NumberField.HeightOneSpectrum.isNonarchimedean_adicAbv
            K w) wL)
 


def RelativeLocalTensorDecompositionIntegralUnitAt
    (w : HeightOneSpectrum (𝓞 K))
    (x : (w.adicCompletion K ⊗[K] L)ˣ) : Prop :=
  RelativeLocalTensorDecompositionIntegralAt
      (K := K) (L := L) w
      (x : w.adicCompletion K ⊗[K] L) ∧
    RelativeLocalTensorDecompositionIntegralAt
      (K := K) (L := L) w
      ((x⁻¹ : (w.adicCompletion K ⊗[K] L)ˣ) :
        w.adicCompletion K ⊗[K] L)
 

noncomputable def scaledRelativeBasisDiscriminantInteger :
    𝓞 K :=
  ⟨Algebra.discr K
      (scaledRelativeExtensionBasis (K := K) (L := L)),
    Algebra.discr_isIntegral K fun i =>
      scaledRelativeExtensionBasis_isIntegral
        (K := K) (L := L) i⟩
 
theorem scaledRelativeBasisDiscriminantInteger_ne_zero :
    scaledRelativeBasisDiscriminantInteger
      (K := K) (L := L) ≠ 0 := by
  intro h
  apply Algebra.discr_not_zero_of_basis K
    (scaledRelativeExtensionBasis (K := K) (L := L))
  exact congrArg (fun x : 𝓞 K => (x : K)) h
 
noncomputable def scaledRelativeBasisDiscriminantIdeal :
    Ideal (𝓞 K) :=
  Ideal.span
    ({scaledRelativeBasisDiscriminantInteger
      (K := K) (L := L)} : Set (𝓞 K))
 
theorem scaledRelativeBasisDiscriminantIdeal_ne_bot :
    scaledRelativeBasisDiscriminantIdeal
      (K := K) (L := L) ≠ ⊥ := by
  rw [scaledRelativeBasisDiscriminantIdeal,
    ne_eq, Ideal.span_singleton_eq_bot]
  exact scaledRelativeBasisDiscriminantInteger_ne_zero
    (K := K) (L := L)
 

noncomputable def scaledRelativeBasisDiscriminantBadPlaces :
    Finset (HeightOneSpectrum (𝓞 K)) :=
  (Ideal.finite_factors
    (scaledRelativeBasisDiscriminantIdeal_ne_bot
      (K := K) (L := L))).toFinset
 

@[simp]
theorem mem_scaledRelativeBasisDiscriminantBadPlaces_iff
    (w : HeightOneSpectrum (𝓞 K)) :
    w ∈ scaledRelativeBasisDiscriminantBadPlaces
        (K := K) (L := L) ↔
      w.asIdeal ∣
        scaledRelativeBasisDiscriminantIdeal
          (K := K) (L := L) :=
  Set.Finite.mem_toFinset
    (Ideal.finite_factors
      (scaledRelativeBasisDiscriminantIdeal_ne_bot
        (K := K) (L := L)))
 
theorem scaledRelativeBasisDiscriminantInteger_not_mem_of_notMem
    (w : HeightOneSpectrum (𝓞 K))
    (hw : w ∉ scaledRelativeBasisDiscriminantBadPlaces
      (K := K) (L := L)) :
    scaledRelativeBasisDiscriminantInteger
        (K := K) (L := L) ∉ w.asIdeal := by
  intro hmem
  apply hw
  rw [mem_scaledRelativeBasisDiscriminantBadPlaces_iff,
    scaledRelativeBasisDiscriminantIdeal,
    Ideal.dvd_span_singleton]
  exact hmem
 
theorem adicAbv_scaledRelativeBasisDiscriminant_eq_one_of_notMem
    (w : HeightOneSpectrum (𝓞 K))
    (hw : w ∉ scaledRelativeBasisDiscriminantBadPlaces
      (K := K) (L := L)) :
    NumberField.HeightOneSpectrum.adicAbv K w
        (Algebra.discr K
          (scaledRelativeExtensionBasis (K := K) (L := L))) = 1 := by
  have hnorm :
      ‖FinitePlace.embedding (K := K) w
        (scaledRelativeBasisDiscriminantInteger
          (K := K) (L := L))‖ = 1 :=
    (FinitePlace.norm_eq_one_iff_notMem
      (R := 𝓞 K) K w
      (scaledRelativeBasisDiscriminantInteger
        (K := K) (L := L))).2
      (scaledRelativeBasisDiscriminantInteger_not_mem_of_notMem
        (K := K) (L := L) w hw)
  exact (FinitePlace.norm_embedding w
    (scaledRelativeBasisDiscriminantInteger (K := K) (L := L) : K)).symm.trans hnorm
 

noncomputable def integralTensorComparisonBadPlaces :
    Finset (HeightOneSpectrum (𝓞 K)) := by
  classical
  exact
    integralTensorBadPlaces (K := K) (L := L) ∪
      scaledRelativeBasisDiscriminantBadPlaces
        (K := K) (L := L)
omit [NumberField L] in
 
@[simp]
theorem finitePlaceLocalTensorDecompositionComponent_tmul
    (w : HeightOneSpectrum (𝓞 K))
    (wL : AbsoluteValueExtension
      (NumberField.HeightOneSpectrum.adicAbv K w) L)
    (a : w.adicCompletion K) (b : L) :
    finitePlaceLocalTensorDecompositionComponent
        (K := K) (L := L) w wL (a ⊗ₜ[K] b) =
      AbsoluteValue.completionMap
          (NumberField.HeightOneSpectrum.adicAbv K w)
          wL.1 wL.2
          ((relativeFinitePlaceCompletionAlgEquiv w).symm a) *
        AbsoluteValue.toCompletion wL.1 b := by
  simp [finitePlaceLocalTensorDecompositionComponent,
    relativeFinitePlaceLocalTensorAlgEquiv,
    completionTensorDecomposition_left_tmul_apply,
    AbsoluteValue.toCompletionAlgHom]
omit [NumberField L] [FiniteDimensional K L] in
 

theorem finitePlaceLocalTensorDecomposition_coefficient_mem_integers
    (w : HeightOneSpectrum (𝓞 K))
    (wL : AbsoluteValueExtension
      (NumberField.HeightOneSpectrum.adicAbv K w) L)
    (c : w.adicCompletionIntegers K) :
    AbsoluteValue.completionMap
        (NumberField.HeightOneSpectrum.adicAbv K w)
        wL.1 wL.2
        ((relativeFinitePlaceCompletionAlgEquiv w).symm
          (c : w.adicCompletion K)) ∈
      absoluteValueCompletionIntegers wL.1
        (absoluteValueExtension_isNonarchimedean
          (NumberField.HeightOneSpectrum.adicAbv K w)
          (NumberField.HeightOneSpectrum.isNonarchimedean_adicAbv
            K w) wL) := by
  rw [mem_absoluteValueCompletionIntegers_iff]
  calc
    ‖AbsoluteValue.completionMap
        (NumberField.HeightOneSpectrum.adicAbv K w)
        wL.1 wL.2
        ((relativeFinitePlaceCompletionAlgEquiv w).symm
          (c : w.adicCompletion K))‖ =
      ‖(relativeFinitePlaceCompletionAlgEquiv w).symm
          (c : w.adicCompletion K)‖ :=
        (AbsoluteValue.completionMap_isometry
          (NumberField.HeightOneSpectrum.adicAbv K w)
          wL.1 wL.2).norm_map_of_map_zero
            (map_zero
              (AbsoluteValue.completionMap
                (NumberField.HeightOneSpectrum.adicAbv K w)
                wL.1 wL.2)) _
    _ = ‖(c : w.adicCompletion K)‖ :=
      relativeFinitePlaceCompletionAlgEquiv_symm_norm
        (K := K) w (c : w.adicCompletion K)
    _ ≤ 1 :=
      norm_le_one_of_mem_adicCompletionIntegers
        (K := K) w c.property
 

theorem finitePlaceLocalTensorDecomposition_basis_mem_integers_of_notMem
    (w : HeightOneSpectrum (𝓞 K))
    (hw : w ∉ integralTensorBadPlaces
      (K := K) (L := L))
    (wL : AbsoluteValueExtension
      (NumberField.HeightOneSpectrum.adicAbv K w) L)
    (i : RelativeAdeleBasisIndex (K := K) (L := L)) :
    AbsoluteValue.toCompletion wL.1
        (relativeExtensionBasis
          (K := K) (L := L) i) ∈
      absoluteValueCompletionIntegers wL.1
        (absoluteValueExtension_isNonarchimedean
          (NumberField.HeightOneSpectrum.adicAbv K w)
          (NumberField.HeightOneSpectrum.isNonarchimedean_adicAbv
            K w) wL) := by
  rw [mem_absoluteValueCompletionIntegers_iff]
  simpa [AbsoluteValue.toCompletion_apply,
    WithAbs.norm_eq_apply_ofAbs] using
      relativeExtensionBasis_absoluteValue_le_one_of_notMem
        (K := K) (L := L) w hw wL i
 


theorem relativeBasisIntegralAt_imp_localTensorDecompositionIntegral_of_notMem
    (w : HeightOneSpectrum (𝓞 K))
    (hw : w ∉ integralTensorBadPlaces
      (K := K) (L := L))
    {x : w.adicCompletion K ⊗[K] L}
    (hx : RelativeBasisIntegralAt
      (K := K) (L := L) w x) :
    RelativeLocalTensorDecompositionIntegralAt
      (K := K) (L := L) w x := by
  obtain ⟨c, rfl⟩ := hx
  intro wL
  have hsum :
      finitePlaceLocalTensorDecompositionComponent
          (K := K) (L := L) w wL
          (∑ i : RelativeAdeleBasisIndex
              (K := K) (L := L),
            ((c i : w.adicCompletionIntegers K) :
                w.adicCompletion K) ⊗ₜ[K]
              relativeExtensionBasis
                (K := K) (L := L) i) =
        ∑ i : RelativeAdeleBasisIndex
            (K := K) (L := L),
          finitePlaceLocalTensorDecompositionComponent
            (K := K) (L := L) w wL
            (((c i : w.adicCompletionIntegers K) :
                w.adicCompletion K) ⊗ₜ[K]
              relativeExtensionBasis
                (K := K) (L := L) i) := by
    simp [finitePlaceLocalTensorDecompositionComponent]
  rw [hsum]
  apply Subring.sum_mem
  intro i hi
  rw [finitePlaceLocalTensorDecompositionComponent_tmul]
  apply
    (absoluteValueCompletionIntegers wL.1
      (absoluteValueExtension_isNonarchimedean
        (NumberField.HeightOneSpectrum.adicAbv K w)
        (NumberField.HeightOneSpectrum.isNonarchimedean_adicAbv
          K w) wL)).mul_mem
  · exact
      finitePlaceLocalTensorDecomposition_coefficient_mem_integers
        (K := K) (L := L) w wL (c i)
  · exact
      finitePlaceLocalTensorDecomposition_basis_mem_integers_of_notMem
        (K := K) (L := L) w hw wL i
 

theorem relativeBasisIntegralUnitAt_imp_localTensorDecompositionIntegralUnit_of_notMem
    (w : HeightOneSpectrum (𝓞 K))
    (hw : w ∉ integralTensorBadPlaces
      (K := K) (L := L))
    {x : (w.adicCompletion K ⊗[K] L)ˣ}
    (hx : RelativeBasisIntegralUnitAt
      (K := K) (L := L) w x) :
    RelativeLocalTensorDecompositionIntegralUnitAt
      (K := K) (L := L) w x :=
  ⟨relativeBasisIntegralAt_imp_localTensorDecompositionIntegral_of_notMem
      (K := K) (L := L) w hw hx.1,
    relativeBasisIntegralAt_imp_localTensorDecompositionIntegral_of_notMem
      (K := K) (L := L) w hw hx.2⟩
 


theorem scaledRelativeTensorCoordinates_isIntegral_of_localTensorDecompositionIntegral
    (w : HeightOneSpectrum (𝓞 K))
    (hw : w ∉ scaledRelativeBasisDiscriminantBadPlaces
      (K := K) (L := L))
    {x : w.adicCompletion K ⊗[K] L}
    (hx : RelativeLocalTensorDecompositionIntegralAt
      (K := K) (L := L) w x) :
    let vK := NumberField.HeightOneSpectrum.adicAbv K w
    let xA :=
      (relativeFinitePlaceLocalTensorAlgEquiv
        (K := K) (L := L) w).symm x
    let bA :=
      Algebra.TensorProduct.basis vK.Completion
        (scaledRelativeExtensionBasis (K := K) (L := L))
    ∀ i, IsIntegral (absoluteValueCompletionIntegers vK
        (NumberField.HeightOneSpectrum.isNonarchimedean_adicAbv K w))
      (bA.equivFun xA i) := by
  classical
  let vK := NumberField.HeightOneSpectrum.adicAbv K w
  let hvK : IsNonarchimedean (vK : K → ℝ) :=
    NumberField.HeightOneSpectrum.isNonarchimedean_adicAbv K w
  let hvK0 : vK.IsNontrivial :=
    RayClass.adicAbv_isNontrivial w
  let : Fintype (AbsoluteValueExtension vK L) :=
    completionTensorDecomposition_extensionFintype
      (K := K) (L := L) vK hvK0
  let : ∀ wL : AbsoluteValueExtension vK L,
      Algebra vK.Completion wL.1.Completion :=
    fun wL => AbsoluteValue.completionAlgebra vK wL.1 wL.2
  let : ∀ wL : AbsoluteValueExtension vK L,
      Module.Finite vK.Completion wL.1.Completion :=
    fun wL => completionModuleFinite vK hvK0 wL
  let : ∀ wL : AbsoluteValueExtension vK L,
      Module.Free vK.Completion wL.1.Completion :=
    fun wL => Module.Free.of_divisionRing
      vK.Completion wL.1.Completion
  let xA : vK.Completion ⊗[K] L :=
    (relativeFinitePlaceLocalTensorAlgEquiv
      (K := K) (L := L) w).symm x
  let bA :=
    Algebra.TensorProduct.basis vK.Completion
      (scaledRelativeExtensionBasis (K := K) (L := L))
  have hxA :
      ∀ wL : AbsoluteValueExtension vK L,
        completionTensorDecomposition_left
            (K := K) (L := L) vK hvK0 xA wL ∈
          absoluteValueCompletionIntegers wL.1
            (absoluteValueExtension_isNonarchimedean vK hvK wL) := by
    intro wL
    simpa [xA, vK, hvK, hvK0,
      finitePlaceLocalTensorDecompositionComponent] using hx wL
  have hbA :
      ∀ (i : RelativeAdeleBasisIndex (K := K) (L := L))
        (wL : AbsoluteValueExtension vK L),
        completionTensorDecomposition_left
            (K := K) (L := L) vK hvK0 (bA i) wL ∈
          absoluteValueCompletionIntegers wL.1
            (absoluteValueExtension_isNonarchimedean vK hvK wL) := by
    intro i wL
    have hbAi :
        bA i =
          1 ⊗ₜ[K]
            scaledRelativeExtensionBasis (K := K) (L := L) i := by
      simp [bA, Algebra.TensorProduct.basis_apply]
    rw [hbAi]
    rw [completionTensorDecomposition_left_tmul_apply]
    simp only [map_one, one_mul]
    rw [mem_absoluteValueCompletionIntegers_iff]
    simpa [AbsoluteValue.toCompletionAlgHom,
      AbsoluteValue.toCompletion_apply,
      WithAbs.norm_eq_apply_ofAbs] using
        scaledRelativeExtensionBasis_absoluteValue_le_one
          (K := K) (L := L) vK hvK wL i
  have hM :
      ∀ i j : RelativeAdeleBasisIndex (K := K) (L := L),
        IsIntegral (absoluteValueCompletionIntegers vK hvK)
          (Algebra.trace vK.Completion
            (vK.Completion ⊗[K] L) (bA i * bA j)) := by
    intro i j
    apply isIntegral_trace_tensor_of_components
      (K := K) (L := L) vK hvK hvK0
    intro wL
    rw [map_mul, Pi.mul_apply]
    change _ ∈
      (absoluteValueCompletionIntegers wL.1
        (absoluteValueExtension_isNonarchimedean
          vK hvK wL)).toSubring
    exact
      (absoluteValueCompletionIntegers wL.1
        (absoluteValueExtension_isNonarchimedean
          vK hvK wL)).toSubring.mul_mem (hbA i wL) (hbA j wL)
  have ht :
      ∀ i : RelativeAdeleBasisIndex (K := K) (L := L),
        IsIntegral (absoluteValueCompletionIntegers vK hvK)
          (Algebra.trace vK.Completion
            (vK.Completion ⊗[K] L) (xA * bA i)) := by
    intro i
    apply isIntegral_trace_tensor_of_components
      (K := K) (L := L) vK hvK hvK0
    intro wL
    rw [map_mul, Pi.mul_apply]
    change _ ∈
      (absoluteValueCompletionIntegers wL.1
        (absoluteValueExtension_isNonarchimedean
          vK hvK wL)).toSubring
    exact
      (absoluteValueCompletionIntegers wL.1
        (absoluteValueExtension_isNonarchimedean
          vK hvK wL)).toSubring.mul_mem (hxA wL) (hbA i wL)
  have hdiscInv :
      IsIntegral (absoluteValueCompletionIntegers vK hvK)
        (Algebra.discr vK.Completion bA)⁻¹ := by
    rw [discr_tensorProduct_basis]
    apply (IsIntegrallyClosedIn.isIntegral_iff).2
    refine ⟨⟨_, ?_⟩, rfl⟩
    rw [mem_absoluteValueCompletionIntegers_iff]
    have hdabs :=
      adicAbv_scaledRelativeBasisDiscriminant_eq_one_of_notMem
        (K := K) (L := L) w hw
    have hdnorm :
        ‖algebraMap K vK.Completion
          (Algebra.discr K
            (scaledRelativeExtensionBasis (K := K) (L := L)))‖ = 1 := by
      calc
        ‖algebraMap K vK.Completion
            (Algebra.discr K
              (scaledRelativeExtensionBasis (K := K) (L := L)))‖ =
            vK (Algebra.discr K
              (scaledRelativeExtensionBasis (K := K) (L := L))) := by
              exact AbsoluteValue.completionAbsoluteValue_coe _ _
        _ = 1 := hdabs
    change AbsoluteValue.completionAbsoluteValue vK
      ((algebraMap K vK.Completion
        (Algebra.discr K
          (scaledRelativeExtensionBasis (K := K) (L := L))))⁻¹) ≤ 1
    rw [map_inv₀]
    change
      ‖algebraMap K vK.Completion
        (Algebra.discr K
          (scaledRelativeExtensionBasis (K := K) (L := L)))‖⁻¹ ≤ 1
    rw [hdnorm, inv_one]
  have hdiscne :
      Algebra.discr vK.Completion bA ≠ 0 := by
    rw [discr_tensorProduct_basis]
    exact (algebraMap K vK.Completion).injective.ne
      (Algebra.discr_not_zero_of_basis K
        (scaledRelativeExtensionBasis (K := K) (L := L)))
  change ∀ i : RelativeAdeleBasisIndex (K := K) (L := L),
    IsIntegral (absoluteValueCompletionIntegers vK hvK)
      (bA.equivFun xA i)
  intro i
  exact basis_coord_isIntegral_of_integral_traces
    bA hM ht hdiscInv hdiscne i
 


theorem relativeFinitePlaceLocalTensorAlgEquiv_scaled_basis_smul
    (w : HeightOneSpectrum (𝓞 K))
    (a :
      (NumberField.HeightOneSpectrum.adicAbv K w).Completion)
    (i : RelativeAdeleBasisIndex (K := K) (L := L)) :
    relativeFinitePlaceLocalTensorAlgEquiv
        (K := K) (L := L) w
        (a •
          Algebra.TensorProduct.basis
            (NumberField.HeightOneSpectrum.adicAbv K w).Completion
            (scaledRelativeExtensionBasis (K := K) (L := L)) i) =
      relativeFinitePlaceCompletionAlgEquiv w
          (a * algebraMap K
            (NumberField.HeightOneSpectrum.adicAbv K w).Completion
            (relativeBasisIntegralScaleInK
              (K := K) (L := L))) ⊗ₜ[K]
        relativeExtensionBasis (K := K) (L := L) i := by
  simp [relativeFinitePlaceLocalTensorAlgEquiv,
    Algebra.TensorProduct.basis_apply,
    scaledRelativeExtensionBasis_apply,
    Algebra.smul_def, mul_comm]
  simpa [Algebra.smul_def] using
    (TensorProduct.smul_tmul
      (relativeBasisIntegralScaleInK (K := K) (L := L))
      (relativeFinitePlaceCompletionAlgEquiv w a)
      (relativeExtensionBasis (K := K) (L := L) i)).symm
 


theorem localTensorDecompositionIntegral_imp_relativeBasisIntegralAt_of_notMem
    (w : HeightOneSpectrum (𝓞 K))
    (hw : w ∉ integralTensorComparisonBadPlaces
      (K := K) (L := L))
    {x : w.adicCompletion K ⊗[K] L}
    (hx : RelativeLocalTensorDecompositionIntegralAt
      (K := K) (L := L) w x) :
    RelativeBasisIntegralAt (K := K) (L := L) w x := by
  classical
  have hwdisc :
      w ∉ scaledRelativeBasisDiscriminantBadPlaces
        (K := K) (L := L) := by
    intro hw'
    exact hw (by
      simp [integralTensorComparisonBadPlaces, hw'])
  let vK := NumberField.HeightOneSpectrum.adicAbv K w
  let hvK : IsNonarchimedean (vK : K → ℝ) :=
    NumberField.HeightOneSpectrum.isNonarchimedean_adicAbv K w
  let xA : vK.Completion ⊗[K] L :=
    (relativeFinitePlaceLocalTensorAlgEquiv
      (K := K) (L := L) w).symm x
  let bA :=
    Algebra.TensorProduct.basis vK.Completion
      (scaledRelativeExtensionBasis (K := K) (L := L))
  have hscaled :
      ∀ i : RelativeAdeleBasisIndex (K := K) (L := L),
        IsIntegral (absoluteValueCompletionIntegers vK hvK)
          (bA.equivFun xA i) := by
    simpa [vK, hvK, xA, bA] using
      scaledRelativeTensorCoordinates_isIntegral_of_localTensorDecompositionIntegral
        (K := K) (L := L) w hwdisc hx
  have hscaledNorm :
      ∀ i : RelativeAdeleBasisIndex (K := K) (L := L),
        ‖bA.equivFun xA i‖ ≤ 1 := by
    intro i
    obtain ⟨ci, hci⟩ :=
      (IsIntegrallyClosedIn.isIntegral_iff).1 (hscaled i)
    rw [← hci]
    exact ci.property
  have hscaleIntegral :
      IsIntegral ℤ
        (relativeBasisIntegralScaleInK
          (K := K) (L := L)) := by
    change IsIntegral ℤ
      (algebraMap ℤ K
        (chosenRelativeBasisIntegralScale (K := K) (L := L)))
    exact isIntegral_algebraMap
  have hscaleAbs :
      vK (relativeBasisIntegralScaleInK
        (K := K) (L := L)) ≤ 1 :=
    absoluteValue_le_one_of_isIntegral vK hvK hscaleIntegral
  have hscaleNorm :
      ‖algebraMap K vK.Completion
        (relativeBasisIntegralScaleInK
          (K := K) (L := L))‖ ≤ 1 := by
    calc
      ‖algebraMap K vK.Completion
          (relativeBasisIntegralScaleInK
            (K := K) (L := L))‖ =
          vK (relativeBasisIntegralScaleInK
            (K := K) (L := L)) :=
        AbsoluteValue.completionAbsoluteValue_coe _ _
      _ ≤ 1 := hscaleAbs
  let cA :
      RelativeAdeleBasisIndex (K := K) (L := L) →
        vK.Completion :=
    fun i =>
      bA.equivFun xA i *
        algebraMap K vK.Completion
          (relativeBasisIntegralScaleInK
            (K := K) (L := L))
  have hcANorm :
      ∀ i : RelativeAdeleBasisIndex (K := K) (L := L),
        ‖cA i‖ ≤ 1 := by
    intro i
    change ‖bA.equivFun xA i *
      algebraMap K vK.Completion
        (relativeBasisIntegralScaleInK
          (K := K) (L := L))‖ ≤ 1
    rw [norm_mul]
    calc
      ‖bA.equivFun xA i‖ *
          ‖algebraMap K vK.Completion
            (relativeBasisIntegralScaleInK
              (K := K) (L := L))‖ ≤
          1 * 1 :=
        mul_le_mul (hscaledNorm i) hscaleNorm
          (norm_nonneg _) (by positivity)
      _ = 1 := one_mul 1
  have hmapNorm (y : vK.Completion) :
      ‖relativeFinitePlaceCompletionAlgEquiv w y‖ = ‖y‖ := by
    change ‖relativeFinitePlaceCompletionRingHom w y‖ = ‖y‖
    exact
      (relativeFinitePlaceCompletionRingHom_isometry w).norm_map_of_map_zero
        (map_zero (relativeFinitePlaceCompletionRingHom w)) y
  let c :
      RelativeAdeleBasisIndex (K := K) (L := L) →
        w.adicCompletionIntegers K :=
    fun i =>
      ⟨relativeFinitePlaceCompletionAlgEquiv w (cA i),
        mem_adicCompletionIntegers_of_norm_le_one w
          (by rw [hmapNorm]; exact hcANorm i)⟩
  refine ⟨c, ?_⟩
  let e :=
    relativeFinitePlaceLocalTensorAlgEquiv
      (K := K) (L := L) w
  calc
    x = e xA := (e.apply_symm_apply x).symm
    _ = e (∑ i : RelativeAdeleBasisIndex (K := K) (L := L),
        (bA.equivFun xA i) • bA i) :=
      congrArg e (bA.sum_repr xA).symm
    _ = ∑ i : RelativeAdeleBasisIndex (K := K) (L := L),
        e ((bA.equivFun xA i) • bA i) := by
      rw [map_sum]
    _ = ∑ i : RelativeAdeleBasisIndex (K := K) (L := L),
        ((c i : w.adicCompletionIntegers K) :
            w.adicCompletion K) ⊗ₜ[K]
          relativeExtensionBasis (K := K) (L := L) i := by
      apply Finset.sum_congr rfl
      intro i _
      rw [relativeFinitePlaceLocalTensorAlgEquiv_scaled_basis_smul]
 

theorem localTensorDecompositionIntegralUnit_imp_relativeBasisIntegralUnitAt_of_notMem
    (w : HeightOneSpectrum (𝓞 K))
    (hw : w ∉ integralTensorComparisonBadPlaces
      (K := K) (L := L))
    {x : (w.adicCompletion K ⊗[K] L)ˣ}
    (hx : RelativeLocalTensorDecompositionIntegralUnitAt
      (K := K) (L := L) w x) :
    RelativeBasisIntegralUnitAt (K := K) (L := L) w x :=
  ⟨localTensorDecompositionIntegral_imp_relativeBasisIntegralAt_of_notMem
      (K := K) (L := L) w hw hx.1,
    localTensorDecompositionIntegral_imp_relativeBasisIntegralAt_of_notMem
      (K := K) (L := L) w hw hx.2⟩
 

theorem relativeBasisIntegralAt_iff_localTensorDecompositionIntegral_of_notMem
    (w : HeightOneSpectrum (𝓞 K))
    (hw : w ∉ integralTensorComparisonBadPlaces
      (K := K) (L := L))
    {x : w.adicCompletion K ⊗[K] L} :
    RelativeBasisIntegralAt (K := K) (L := L) w x ↔
      RelativeLocalTensorDecompositionIntegralAt (K := K) (L := L) w x := by
  have hwold : w ∉ integralTensorBadPlaces (K := K) (L := L) := by
    intro hw'
    exact hw (by
      simp [integralTensorComparisonBadPlaces, hw'])
  exact
    ⟨relativeBasisIntegralAt_imp_localTensorDecompositionIntegral_of_notMem
        (K := K) (L := L) w hwold,
      localTensorDecompositionIntegral_imp_relativeBasisIntegralAt_of_notMem
        (K := K) (L := L) w hw⟩
 
theorem relativeBasisIntegralUnitAt_iff_localTensorDecompositionIntegralUnit_of_notMem
    (w : HeightOneSpectrum (𝓞 K))
    (hw : w ∉ integralTensorComparisonBadPlaces
      (K := K) (L := L))
    {x : (w.adicCompletion K ⊗[K] L)ˣ} :
    RelativeBasisIntegralUnitAt (K := K) (L := L) w x ↔
      RelativeLocalTensorDecompositionIntegralUnitAt (K := K) (L := L) w x := by
  have hwold : w ∉ integralTensorBadPlaces (K := K) (L := L) := by
    intro hw'
    exact hw (by
      simp [integralTensorComparisonBadPlaces, hw'])
  exact
    ⟨relativeBasisIntegralUnitAt_imp_localTensorDecompositionIntegralUnit_of_notMem
        (K := K) (L := L) w hwold,
      localTensorDecompositionIntegralUnit_imp_relativeBasisIntegralUnitAt_of_notMem
        (K := K) (L := L) w hw⟩
end LocalTensorDecompositionIntegralComparison
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.Adele.IntegralTensorSupport.IdeleSupport -/
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
 

noncomputable def relativeIdeleLocalTensorDecompositionSupport
    (z : RelativeIdeleGroup K L) :
    Finset (HeightOneSpectrum (𝓞 K)) := by
  classical
  exact
    relativeIdeleCoefficientSupport
        (K := K) (L := L) z ∪
      integralTensorBadPlaces
        (K := K) (L := L)
 


theorem relativeIdele_finiteComponent_localTensorDecompositionIntegralUnit_of_notMem
    (z : RelativeIdeleGroup K L)
    (w : HeightOneSpectrum (𝓞 K))
    (hw : w ∉ relativeIdeleLocalTensorDecompositionSupport
      (K := K) (L := L) z) :
    RelativeLocalTensorDecompositionIntegralUnitAt
      (K := K) (L := L) w
      (RelativeIdeleGroup.finiteComponent
        (K := K) (L := L) w z) := by
  have hsep :
      w ∉ relativeIdeleCoefficientSupport
          (K := K) (L := L) z ∧
        w ∉ integralTensorBadPlaces
          (K := K) (L := L) := by
    simpa [relativeIdeleLocalTensorDecompositionSupport] using hw
  exact
    relativeBasisIntegralUnitAt_imp_localTensorDecompositionIntegralUnit_of_notMem
      (K := K) (L := L) w hsep.2
      (relativeIdele_finiteComponent_basisIntegralUnit_of_notMem
        (K := K) (L := L) z w hsep.1)
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
 

abbrev RelativeLocalTensorFamily :=
  (∀ w : InfinitePlace K,
      (w.Completion ⊗[K] L)ˣ) ×
    (∀ w : HeightOneSpectrum (𝓞 K),
      (w.adicCompletion K ⊗[K] L)ˣ)
 
def relativeIdeleLocalComponents :
    RelativeIdeleGroup K L →*
      RelativeLocalTensorFamily (K := K) (L := L) where
  toFun z :=
    ⟨fun w =>
        RelativeIdeleGroup.infiniteComponent
          (K := K) (L := L) w z,
      fun w =>
        RelativeIdeleGroup.finiteComponent
          (K := K) (L := L) w z⟩
  map_one' := by
    apply Prod.ext
    · funext w
      exact map_one
        (RelativeIdeleGroup.infiniteComponent
          (K := K) (L := L) w)
    · funext w
      exact map_one
        (RelativeIdeleGroup.finiteComponent
          (K := K) (L := L) w)
  map_mul' x y := by
    apply Prod.ext
    · funext w
      exact map_mul
        (RelativeIdeleGroup.infiniteComponent
          (K := K) (L := L) w) x y
    · funext w
      exact map_mul
        (RelativeIdeleGroup.finiteComponent
          (K := K) (L := L) w) x y
omit [NumberField L] in
 
theorem relativeIdeleLocalComponents_injective :
    Function.Injective
      (relativeIdeleLocalComponents
        (K := K) (L := L)) := by
  intro x y hxy
  apply Units.ext
  apply relativeAdele_ext_of_components
  · intro w
    have h := congrArg (fun z => z.1 w) hxy
    exact congrArg Units.val h
  · intro w
    have h := congrArg (fun z => z.2 w) hxy
    exact congrArg Units.val h
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
omit [NumberField L] in

theorem RelativeLocalIdeleData.ext
    {a b : RelativeLocalIdeleData (K := K) (L := L)}
    (hinfinite : a.infinite = b.infinite)
    (hfinite : a.finite = b.finite) :
    a = b := by
  cases a
  cases b
  simp_all
 
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
 

noncomputable def relativeIdeleToLocalData
    (z : RelativeIdeleGroup K L) :
    RelativeLocalIdeleData (K := K) (L := L) where
  infinite w :=
    RelativeIdeleGroup.infiniteComponent
      (K := K) (L := L) w z
  finite w :=
    RelativeIdeleGroup.finiteComponent
      (K := K) (L := L) w z
  eventually_integral i := by
    filter_upwards [
      (relativeAdeleCoefficient
        (K := K) (L := L)
      (z : RelativeAdeleRing K L) i).2.2] with w hw
    rw [RelativeIdeleGroup.finiteComponent_coe,
      relativeAdeleFiniteComponent_basis_repr]
    change
      (relativeAdeleCoefficient
        (K := K) (L := L)
        (z : RelativeAdeleRing K L) i).2.1 w ∈
          w.adicCompletionIntegers K at hw ⊢
    exact hw
  eventually_inverse_integral i := by
    filter_upwards [
      (relativeAdeleCoefficient
        (K := K) (L := L)
      ((z⁻¹ : RelativeIdeleGroup K L) :
          RelativeAdeleRing K L) i).2.2] with w hw
    rw [← map_inv
      (RelativeIdeleGroup.finiteComponent
        (K := K) (L := L) w) z,
      RelativeIdeleGroup.finiteComponent_coe,
      relativeAdeleFiniteComponent_basis_repr]
    change
      (relativeAdeleCoefficient
        (K := K) (L := L)
        ((z⁻¹ : RelativeIdeleGroup K L) :
          RelativeAdeleRing K L) i).2.1 w ∈
          w.adicCompletionIntegers K at hw ⊢
    exact hw
 
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
omit [NumberField L] in
@[simp]
theorem relativeIdeleOfLocalData_toLocalData
    (z : RelativeIdeleGroup K L) :
    relativeIdeleOfLocalData
        (K := K) (L := L)
        (relativeIdeleToLocalData
          (K := K) (L := L) z) =
      z := by
  apply relativeIdeleLocalComponents_injective
  apply Prod.ext
  · funext w
    change
      RelativeIdeleGroup.infiniteComponent
          (K := K) (L := L) w
          (relativeIdeleOfLocalData
            (K := K) (L := L)
            (relativeIdeleToLocalData
              (K := K) (L := L) z)) =
        RelativeIdeleGroup.infiniteComponent
          (K := K) (L := L) w z
    rw [relativeIdeleOfLocalData_infiniteComponent
      (K := K) (L := L)]
    rfl
  · funext w
    change
      RelativeIdeleGroup.finiteComponent
          (K := K) (L := L) w
          (relativeIdeleOfLocalData
            (K := K) (L := L)
            (relativeIdeleToLocalData
              (K := K) (L := L) z)) =
        RelativeIdeleGroup.finiteComponent
          (K := K) (L := L) w z
    rw [relativeIdeleOfLocalData_finiteComponent
      (K := K) (L := L)]
    rfl
omit [NumberField L] in
@[simp]
theorem relativeIdeleToLocalData_ofLocalData
    (a : RelativeLocalIdeleData (K := K) (L := L)) :
    relativeIdeleToLocalData
        (K := K) (L := L)
        (relativeIdeleOfLocalData
          (K := K) (L := L) a) =
      a := by
  apply RelativeLocalIdeleData.ext
  · funext w
    change
      RelativeIdeleGroup.infiniteComponent
          (K := K) (L := L) w
          (relativeIdeleOfLocalData
            (K := K) (L := L) a) =
        a.infinite w
    rw [relativeIdeleOfLocalData_infiniteComponent
      (K := K) (L := L)]
  · funext w
    change
      RelativeIdeleGroup.finiteComponent
          (K := K) (L := L) w
          (relativeIdeleOfLocalData
            (K := K) (L := L) a) =
        a.finite w
    rw [relativeIdeleOfLocalData_finiteComponent
      (K := K) (L := L)]
 

noncomputable def relativeIdeleEquivLocalData :
    RelativeIdeleGroup K L ≃
      RelativeLocalIdeleData (K := K) (L := L) where
  toFun :=
    relativeIdeleToLocalData (K := K) (L := L)
  invFun :=
    relativeIdeleOfLocalData (K := K) (L := L)
  left_inv :=
    relativeIdeleOfLocalData_toLocalData
      (K := K) (L := L)
  right_inv :=
    relativeIdeleToLocalData_ofLocalData
      (K := K) (L := L)
 

noncomputable instance relativeLocalIdeleDataGroup :
    Group
      (RelativeLocalIdeleData
        (K := K) (L := L)) :=
  (relativeIdeleEquivLocalData
    (K := K) (L := L)).symm.group
 

noncomputable def relativeIdeleMulEquivLocalData :
    RelativeIdeleGroup K L ≃*
      RelativeLocalIdeleData (K := K) (L := L) :=
  ((relativeIdeleEquivLocalData
    (K := K) (L := L)).symm.mulEquiv).symm
omit [NumberField L] in
@[simp]
theorem RelativeLocalIdeleData.infinite_mul
    (a b : RelativeLocalIdeleData (K := K) (L := L))
    (w : InfinitePlace K) :
    (a * b).infinite w =
      a.infinite w * b.infinite w := by
  change
    (relativeIdeleToLocalData
      (K := K) (L := L)
      (relativeIdeleOfLocalData
          (K := K) (L := L) a *
        relativeIdeleOfLocalData
          (K := K) (L := L) b)).infinite w =
      a.infinite w * b.infinite w
  change
    RelativeIdeleGroup.infiniteComponent
        (K := K) (L := L) w
        (relativeIdeleOfLocalData
            (K := K) (L := L) a *
          relativeIdeleOfLocalData
            (K := K) (L := L) b) =
      a.infinite w * b.infinite w
  rw [map_mul,
    relativeIdeleOfLocalData_infiniteComponent,
    relativeIdeleOfLocalData_infiniteComponent]
omit [NumberField L] in
@[simp]
theorem RelativeLocalIdeleData.finite_mul
    (a b : RelativeLocalIdeleData (K := K) (L := L))
    (w : HeightOneSpectrum (𝓞 K)) :
    (a * b).finite w =
      a.finite w * b.finite w := by
  change
    (relativeIdeleToLocalData
      (K := K) (L := L)
      (relativeIdeleOfLocalData
          (K := K) (L := L) a *
        relativeIdeleOfLocalData
          (K := K) (L := L) b)).finite w =
      a.finite w * b.finite w
  change
    RelativeIdeleGroup.finiteComponent
        (K := K) (L := L) w
        (relativeIdeleOfLocalData
            (K := K) (L := L) a *
          relativeIdeleOfLocalData
            (K := K) (L := L) b) =
      a.finite w * b.finite w
  rw [map_mul,
    relativeIdeleOfLocalData_finiteComponent,
    relativeIdeleOfLocalData_finiteComponent]
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.Adele.IntegralLocalFactor -/
section
open scoped NumberField TensorProduct
open NumberField IsDedekindDomain
noncomputable section
open AlgebraicNumberTheory.Valuations
open LocalClassFieldTheory
universe u v
variable
    {K : Type u} {L : Type v}
    [Field K] [NumberField K]
    [Field L] [NumberField L] [Algebra K L]
    [FiniteDimensional K L]
 

noncomputable def finitePlaceLocalTensorDecompositionComponentRingHom
    (w : HeightOneSpectrum (𝓞 K))
    (wL : AbsoluteValueExtension
      (HeightOneSpectrum.adicAbv K w) L) :
    (w.adicCompletion K ⊗[K] L) →+* wL.1.Completion := by
  let vK := HeightOneSpectrum.adicAbv K w
  let hvK : vK.IsNontrivial :=
    RayClass.adicAbv_isNontrivial w
  letI : ∀ u : AbsoluteValueExtension vK L,
      Algebra vK.Completion u.1.Completion :=
    fun u =>
      AbsoluteValue.completionAlgebra vK u.1 u.2
  exact
    (Pi.evalRingHom
      (fun u : AbsoluteValueExtension vK L =>
        u.1.Completion) wL).comp
      ((completionTensorDecomposition_left
        (K := K) (L := L) vK hvK).toRingEquiv.toRingHom.comp
        (relativeFinitePlaceLocalTensorAlgEquiv
          (K := K) (L := L) w).symm.toRingEquiv.toRingHom)
 
noncomputable def finitePlaceLocalTensorDecompositionUnitsComponent
    (w : HeightOneSpectrum (𝓞 K))
    (wL : AbsoluteValueExtension
      (HeightOneSpectrum.adicAbv K w) L) :
    (w.adicCompletion K ⊗[K] L)ˣ →*
      wL.1.Completionˣ :=
  Units.map
    (finitePlaceLocalTensorDecompositionComponentRingHom
      (K := K) (L := L) w wL)
 

noncomputable def finitePlaceLocalTensorDecompositionUnitsEquiv
    (w : HeightOneSpectrum (𝓞 K)) :
    (w.adicCompletion K ⊗[K] L)ˣ ≃*
      ∀ wL : AbsoluteValueExtension
          (HeightOneSpectrum.adicAbv K w) L,
        wL.1.Completionˣ := by
  let vK := HeightOneSpectrum.adicAbv K w
  let hvK : vK.IsNontrivial :=
    RayClass.adicAbv_isNontrivial w
  letI : ∀ u : AbsoluteValueExtension vK L,
      Algebra vK.Completion u.1.Completion :=
    fun u =>
      AbsoluteValue.completionAlgebra vK u.1 u.2
  exact
    (Units.mapEquiv
      (((relativeFinitePlaceLocalTensorAlgEquiv
            (K := K) (L := L) w).symm.toRingEquiv.trans
          (completionTensorDecomposition_left
            (K := K) (L := L) vK hvK).toRingEquiv).toMulEquiv)).trans
      MulEquiv.piUnits
omit [NumberField L] in
 

@[simp]
theorem finitePlaceLocalTensorDecompositionUnitsEquiv_apply
    (w : HeightOneSpectrum (𝓞 K))
    (x : (w.adicCompletion K ⊗[K] L)ˣ)
    (wL : AbsoluteValueExtension
      (HeightOneSpectrum.adicAbv K w) L) :
    finitePlaceLocalTensorDecompositionUnitsEquiv
        (K := K) (L := L) w x wL =
      finitePlaceLocalTensorDecompositionUnitsComponent
        (K := K) (L := L) w wL x :=
  rfl
omit [NumberField L] in
 

theorem relativeLocalTensorDecompositionIntegralUnitAt_iff
    (w : HeightOneSpectrum (𝓞 K))
    (x : (w.adicCompletion K ⊗[K] L)ˣ) :
    RelativeLocalTensorDecompositionIntegralUnitAt
        (K := K) (L := L) w x ↔
      ∀ wL : AbsoluteValueExtension
          (HeightOneSpectrum.adicAbv K w) L,
        finitePlaceLocalTensorDecompositionUnitsComponent
            (K := K) (L := L) w wL x ∈
          (absoluteValueCompletionIntegers wL.1
            (absoluteValueExtension_isNonarchimedean
              (HeightOneSpectrum.adicAbv K w)
              (HeightOneSpectrum.isNonarchimedean_adicAbv K w)
              wL)).units := by
  constructor
  · rintro ⟨hx, hxinv⟩ wL
    exact ⟨hx wL, by
      change
        finitePlaceLocalTensorDecompositionComponent
            (K := K) (L := L) w wL
            (↑(x⁻¹) :
              w.adicCompletion K ⊗[K] L) ∈
          absoluteValueCompletionIntegers wL.1
            (absoluteValueExtension_isNonarchimedean
              (HeightOneSpectrum.adicAbv K w)
              (HeightOneSpectrum.isNonarchimedean_adicAbv K w)
              wL)
      exact hxinv wL⟩
  · intro hx
    constructor
    · intro wL
      exact (hx wL).1
    · intro wL
      exact (hx wL).2
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
 
instance basePrime_liesOver
    (P : Ideal (𝓞 L)) :
    P.LiesOver (basePrime (K := K) P) where
  «over» := rfl
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
omit [FiniteDimensional K L] in
 

theorem finitePlaceExtensionAdicCompletionRingEquiv_mem_integers_iff
    (v : HeightOneSpectrum (𝓞 K))
    (w : AbsoluteValueExtension
      (HeightOneSpectrum.adicAbv K v) L)
    (x : w.1.Completion) :
    finitePlaceExtensionAdicCompletionRingEquiv
          (K := K) (L := L) v w x ∈
        (finitePlaceExtensionCentre
          (K := K) (L := L) v w).adicCompletionIntegers L ↔
      x ∈ absoluteValueCompletionIntegers w.1
        (absoluteValueExtension_isNonarchimedean
          (HeightOneSpectrum.adicAbv K v)
          (HeightOneSpectrum.isNonarchimedean_adicAbv K v) w) := by
  rw [mem_absoluteValueCompletionIntegers_iff]
  have hrpow :
      ‖x‖ ^ finitePlaceExtensionExponent
          (K := K) (L := L) v w ≤ 1 ↔
        ‖x‖ ≤ 1 := by
    simpa only [Real.one_rpow] using
      Real.rpow_le_rpow_iff (norm_nonneg x) zero_le_one
        (finitePlaceExtensionExponent_pos
          (K := K) (L := L) v w)
  constructor
  · intro hx
    have hnorm :=
      norm_le_one_of_mem_adicCompletionIntegers
        (finitePlaceExtensionCentre
          (K := K) (L := L) v w) hx
    rw [finitePlaceExtensionAdicCompletionRingEquiv_norm] at hnorm
    exact hrpow.mp hnorm
  · intro hx
    apply mem_adicCompletionIntegers_of_norm_le_one
      (finitePlaceExtensionCentre
        (K := K) (L := L) v w)
    rw [finitePlaceExtensionAdicCompletionRingEquiv_norm]
    exact hrpow.mpr hx
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.Idele.Relative.SPlaces -/
section
open scoped NumberField TensorProduct
open NumberField IsDedekindDomain
noncomputable section

open AlgebraicNumberTheory.Valuations
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

/- ClassFieldTheory.AlgebraicNumberTheory.Adele.FiniteRestrictedProductBaseChange -/
section
open scoped NumberField TensorProduct RestrictedProduct
open NumberField IsDedekindDomain
noncomputable section
open AlgebraicNumberTheory.Valuations
universe u v
variable
    {K : Type u} {L : Type v}
    [Field K] [NumberField K]
    [Field L] [NumberField L] [Algebra K L]
    [FiniteDimensional K L]
 

noncomputable def piCongrLeftMulEquiv
    {ι ι' : Type*} (M : ι' → Type*)
    [∀ i, Mul (M i)] (e : ι ≃ ι') :
    (∀ i, M (e i)) ≃* ∀ j, M j where
  toEquiv := Equiv.piCongrLeft M e
  map_mul' f g := by
    funext j
    obtain ⟨i, rfl⟩ := e.surjective j
    change
      Equiv.piCongrLeft M e (f * g) (e i) =
        Equiv.piCongrLeft M e f (e i) *
          Equiv.piCongrLeft M e g (e i)
    rw [Equiv.piCongrLeft_apply_apply,
      Equiv.piCongrLeft_apply_apply,
      Equiv.piCongrLeft_apply_apply]
    rfl
 


noncomputable def finitePlaceTensorUnitsEquivAboveAdic
    (w : HeightOneSpectrum (𝓞 K)) :
    (w.adicCompletion K ⊗[K] L)ˣ ≃*
      ∀ W : {W : HeightOneSpectrum (𝓞 L) //
          finitePlaceBelow (K := K) W = w},
        (W.1.adicCompletion L)ˣ :=
  (finitePlaceLocalTensorDecompositionUnitsEquiv
      (K := K) (L := L) w).trans
    ((MulEquiv.piCongrRight fun u :
        AbsoluteValueExtension
          (HeightOneSpectrum.adicAbv K w) L =>
      Units.mapEquiv
        (finitePlaceExtensionAdicCompletionRingEquiv
          (K := K) (L := L) w u).toMulEquiv).trans
      (piCongrLeftMulEquiv
        (fun W : {W : HeightOneSpectrum (𝓞 L) //
            finitePlaceBelow (K := K) W = w} =>
          (W.1.adicCompletion L)ˣ)
        (finitePlaceExtensionEquivAbove
          (K := K) (L := L) w)))
 

@[simp]
theorem finitePlaceTensorUnitsEquivAboveAdic_apply_extension
    (w : HeightOneSpectrum (𝓞 K))
    (x : (w.adicCompletion K ⊗[K] L)ˣ)
    (u : AbsoluteValueExtension
      (HeightOneSpectrum.adicAbv K w) L) :
    finitePlaceTensorUnitsEquivAboveAdic
        (K := K) (L := L) w x
        (finitePlaceExtensionEquivAbove
          (K := K) (L := L) w u) =
      Units.mapEquiv
          (finitePlaceExtensionAdicCompletionRingEquiv
            (K := K) (L := L) w u).toMulEquiv
        (finitePlaceLocalTensorDecompositionUnitsComponent
          (K := K) (L := L) w u x) := by
  let P :=
    fun W : {W : HeightOneSpectrum (𝓞 L) //
        finitePlaceBelow (K := K) W = w} =>
      (W.1.adicCompletion L)ˣ
  let e := finitePlaceExtensionEquivAbove (K := K) (L := L) w
  let f : ∀ a, P (e a) := fun a =>
    Units.mapEquiv
        (finitePlaceExtensionAdicCompletionRingEquiv
          (K := K) (L := L) w a).toMulEquiv
      (finitePlaceLocalTensorDecompositionUnitsEquiv
        (K := K) (L := L) w x a)
  exact
    (Equiv.piCongrLeft_apply_apply P e f u).trans
      (congrArg
        (Units.mapEquiv
          (finitePlaceExtensionAdicCompletionRingEquiv
            (K := K) (L := L) w u).toMulEquiv)
        (finitePlaceLocalTensorDecompositionUnitsEquiv_apply
          (K := K) (L := L) w x u))
 

theorem finitePlaceTensorUnitsEquivAboveAdic_localFieldIdeleInclusion
    (w : HeightOneSpectrum (𝓞 K))
    (W : {W : HeightOneSpectrum (𝓞 L) //
      finitePlaceBelow (K := K) W = w})
    (x : Lˣ) :
    finitePlaceTensorUnitsEquivAboveAdic
        (K := K) (L := L) w
        (localFieldIdeleInclusion
          (K := K) (L := L) w x) W =
      Units.map
        (FinitePlace.embedding (K := L) W.1)
        x := by
  obtain ⟨a, rfl⟩ :=
    (finitePlaceExtensionEquivAbove
      (K := K) (L := L) w).surjective W
  rw [finitePlaceTensorUnitsEquivAboveAdic_apply_extension]
  apply Units.ext
  simp only [Units.coe_map]
  change
    finitePlaceExtensionAdicCompletionRingEquiv
        (K := K) (L := L) w a
        (finitePlaceLocalTensorDecompositionComponent
          (K := K) (L := L) w a
          (1 ⊗ₜ[K] (x : L))) =
      FinitePlace.embedding
        (finitePlaceExtensionCentre
          (K := K) (L := L) w a)
        (x : L)
  rw [finitePlaceLocalTensorDecompositionComponent_tmul]
  simp only [map_one, one_mul,
    finitePlaceExtensionAdicCompletionRingEquiv_toCompletion]
 

noncomputable def finitePlaceAbovePiMulEquiv :
    (∀ w : HeightOneSpectrum (𝓞 K),
      ∀ W : {W : HeightOneSpectrum (𝓞 L) //
          finitePlaceBelow (K := K) W = w},
        (W.1.adicCompletion L)ˣ) ≃*
      ∀ W : HeightOneSpectrum (𝓞 L),
        (W.adicCompletion L)ˣ where
  toFun f W :=
    f (finitePlaceBelow (K := K) W) ⟨W, rfl⟩
  invFun f w W := f W.1
  left_inv f := by
    funext w W
    rcases W with ⟨W, hW⟩
    subst w
    rfl
  right_inv f := by
    funext W
    rfl
  map_mul' f g := by
    funext W
    rfl
 

noncomputable def relativeFiniteTensorPiMulEquiv :
    (∀ w : HeightOneSpectrum (𝓞 K),
      (w.adicCompletion K ⊗[K] L)ˣ) ≃*
      ∀ W : HeightOneSpectrum (𝓞 L),
        (W.adicCompletion L)ˣ :=
  (MulEquiv.piCongrRight fun w =>
      finitePlaceTensorUnitsEquivAboveAdic
        (K := K) (L := L) w).trans
    (finitePlaceAbovePiMulEquiv (K := K) (L := L))
 

@[simp]
theorem relativeFiniteTensorPiMulEquiv_apply
    (x : ∀ w : HeightOneSpectrum (𝓞 K),
      (w.adicCompletion K ⊗[K] L)ˣ)
    (W : HeightOneSpectrum (𝓞 L)) :
    relativeFiniteTensorPiMulEquiv
        (K := K) (L := L) x W =
      finitePlaceTensorUnitsEquivAboveAdic
        (K := K) (L := L)
        (finitePlaceBelow (K := K) W)
        (x (finitePlaceBelow (K := K) W)) ⟨W, rfl⟩ :=
  rfl
 

@[simp]
theorem relativeFiniteTensorPiMulEquiv_symm_apply
    (y : ∀ W : HeightOneSpectrum (𝓞 L),
      (W.adicCompletion L)ˣ)
    (w : HeightOneSpectrum (𝓞 K)) :
    (relativeFiniteTensorPiMulEquiv
        (K := K) (L := L)).symm y w =
      (finitePlaceTensorUnitsEquivAboveAdic
        (K := K) (L := L) w).symm
        (fun W => y W.1) :=
  rfl
 


theorem unitsMapEquiv_mem_units_iff
    {R S : Type*} [CommMonoid R] [CommMonoid S]
    (e : R ≃* S) (A : Submonoid R) (B : Submonoid S)
    (h : ∀ y : R, e y ∈ B ↔ y ∈ A)
    (x : Rˣ) :
    Units.mapEquiv e x ∈ B.units ↔ x ∈ A.units := by
  rw [Submonoid.mem_units_iff, Submonoid.mem_units_iff]
  constructor
  · rintro ⟨hval, hinv⟩
    constructor
    · exact (h (x : R)).mp (by simpa using hval)
    · apply (h ((x⁻¹ : Rˣ) : R)).mp
      rw [← (Units.mapEquiv e).map_inv x] at hinv
      exact hinv
  · rintro ⟨hval, hinv⟩
    constructor
    · simpa using (h (x : R)).mpr hval
    · rw [← (Units.mapEquiv e).map_inv x]
      exact (h ((x⁻¹ : Rˣ) : R)).mpr hinv
 


theorem relativeLocalTensorDecompositionIntegralUnitAt_iff_aboveAdic
    (w : HeightOneSpectrum (𝓞 K))
    (x : (w.adicCompletion K ⊗[K] L)ˣ) :
    RelativeLocalTensorDecompositionIntegralUnitAt
        (K := K) (L := L) w x ↔
      ∀ W : {W : HeightOneSpectrum (𝓞 L) //
          finitePlaceBelow (K := K) W = w},
        finitePlaceTensorUnitsEquivAboveAdic
            (K := K) (L := L) w x W ∈
          (W.1.adicCompletionIntegers L).units := by
  rw [relativeLocalTensorDecompositionIntegralUnitAt_iff]
  constructor
  · intro hx W
    let u :=
      (finitePlaceExtensionEquivAbove
        (K := K) (L := L) w).symm W
    have hW :
        finitePlaceExtensionEquivAbove
            (K := K) (L := L) w u = W :=
      (finitePlaceExtensionEquivAbove
        (K := K) (L := L) w).apply_symm_apply W
    rw [← hW]
    rw [finitePlaceTensorUnitsEquivAboveAdic_apply_extension]
    exact
      (unitsMapEquiv_mem_units_iff
        (finitePlaceExtensionAdicCompletionRingEquiv
          (K := K) (L := L) w u).toMulEquiv
        (absoluteValueCompletionIntegers u.1
          (absoluteValueExtension_isNonarchimedean
            (HeightOneSpectrum.adicAbv K w)
            (HeightOneSpectrum.isNonarchimedean_adicAbv K w) u)).toSubmonoid
        ((finitePlaceExtensionCentre
          (K := K) (L := L) w u).adicCompletionIntegers L).toSubmonoid
        (finitePlaceExtensionAdicCompletionRingEquiv_mem_integers_iff
          (K := K) (L := L) w u)
        (finitePlaceLocalTensorDecompositionUnitsComponent
          (K := K) (L := L) w u x)).2 (hx u)
  · intro hx u
    have h :=
      hx (finitePlaceExtensionEquivAbove
        (K := K) (L := L) w u)
    rw [finitePlaceTensorUnitsEquivAboveAdic_apply_extension] at h
    exact
      (unitsMapEquiv_mem_units_iff
        (finitePlaceExtensionAdicCompletionRingEquiv
          (K := K) (L := L) w u).toMulEquiv
        (absoluteValueCompletionIntegers u.1
          (absoluteValueExtension_isNonarchimedean
            (HeightOneSpectrum.adicAbv K w)
            (HeightOneSpectrum.isNonarchimedean_adicAbv K w) u)).toSubmonoid
        ((finitePlaceExtensionCentre
          (K := K) (L := L) w u).adicCompletionIntegers L).toSubmonoid
        (finitePlaceExtensionAdicCompletionRingEquiv_mem_integers_iff
          (K := K) (L := L) w u)
        (finitePlaceLocalTensorDecompositionUnitsComponent
          (K := K) (L := L) w u x)).1 h
 


theorem eventually_finitePlace_iff_eventually_all_above
    (P : ∀ _W : HeightOneSpectrum (𝓞 L), Prop) :
    (∀ᶠ W : HeightOneSpectrum (𝓞 L) in Filter.cofinite, P W) ↔
      ∀ᶠ w : HeightOneSpectrum (𝓞 K) in Filter.cofinite,
        ∀ W : {W : HeightOneSpectrum (𝓞 L) //
          finitePlaceBelow (K := K) W = w},
          P W.1 := by
  constructor
  · intro h
    have hbad :
        {W : HeightOneSpectrum (𝓞 L) | ¬ P W}.Finite :=
      Filter.eventually_cofinite.mp h
    have himage :
        (finitePlaceBelow (K := K) ''
          {W : HeightOneSpectrum (𝓞 L) | ¬ P W}).Finite :=
      hbad.image _
    apply Filter.eventually_cofinite.mpr
    apply himage.subset
    intro w hw
    simp only [Set.mem_ofPred_eq] at hw
    rw [Set.mem_image]
    push Not at hw
    rcases hw with ⟨W, hW⟩
    exact ⟨W.1, hW, W.2⟩
  · intro h
    have hfibre (w : HeightOneSpectrum (𝓞 K)) :
        Finite {W : HeightOneSpectrum (𝓞 L) //
          finitePlaceBelow (K := K) W = w} := by
      let : Fintype
          (AbsoluteValueExtension
            (HeightOneSpectrum.adicAbv K w) L) :=
        completionTensorDecomposition_extensionFintype
          (HeightOneSpectrum.adicAbv K w)
          (RayClass.adicAbv_isNontrivial w)
      exact
        Finite.of_equiv
          (AbsoluteValueExtension
            (HeightOneSpectrum.adicAbv K w) L)
          (finitePlaceExtensionEquivAbove
            (K := K) (L := L) w)
    have htendsto :
        Filter.Tendsto
          (finitePlaceBelow (K := K))
          Filter.cofinite Filter.cofinite :=
      Filter.Tendsto.cofinite_of_finite_preimage_singleton
        (f := finitePlaceBelow (K := K) (L := L))
        fun w => by
          change
            {W : HeightOneSpectrum (𝓞 L) |
              finitePlaceBelow (K := K) W = w}.Finite
          exact Set.finite_coe_iff.mp (hfibre w)
    filter_upwards [htendsto.eventually h] with W hW
    exact hW ⟨W, rfl⟩
 


structure RelativeFiniteIdeleData where
   
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
omit [NumberField L] in
 


theorem RelativeFiniteIdeleData.ext
    {a b : RelativeFiniteIdeleData (K := K) (L := L)}
    (hfinite : a.finite = b.finite) :
    a = b := by
  cases a
  cases b
  simp_all
 

noncomputable def RelativeFiniteIdeleData.toLocalData
    (a : RelativeFiniteIdeleData (K := K) (L := L)) :
    RelativeLocalIdeleData (K := K) (L := L) where
  infinite _ := 1
  finite := a.finite
  eventually_integral := a.eventually_integral
  eventually_inverse_integral := a.eventually_inverse_integral
 

theorem RelativeFiniteIdeleData.eventually_aboveAdicUnit
    (a : RelativeFiniteIdeleData (K := K) (L := L)) :
    ∀ᶠ w : HeightOneSpectrum (𝓞 K) in Filter.cofinite,
      ∀ W : {W : HeightOneSpectrum (𝓞 L) //
          finitePlaceBelow (K := K) W = w},
        finitePlaceTensorUnitsEquivAboveAdic
            (K := K) (L := L) w (a.finite w) W ∈
          (W.1.adicCompletionIntegers L).units := by
  let z : RelativeIdeleGroup K L :=
    relativeIdeleOfLocalData
      (K := K) (L := L) a.toLocalData
  filter_upwards [
    (relativeIdeleLocalTensorDecompositionSupport
      (K := K) (L := L) z).eventually_cofinite_notMem] with w hw
  apply
    (relativeLocalTensorDecompositionIntegralUnitAt_iff_aboveAdic
      (K := K) (L := L) w (a.finite w)).mp
  have hz :=
    relativeIdele_finiteComponent_localTensorDecompositionIntegralUnit_of_notMem
      (K := K) (L := L) z w hw
  simpa [z, RelativeFiniteIdeleData.toLocalData] using hz
 

noncomputable def relativeFiniteIdeleToFiniteIdele
    (a : RelativeFiniteIdeleData (K := K) (L := L)) :
    FiniteIdeleGroup L :=
  ⟨relativeFiniteTensorPiMulEquiv
      (K := K) (L := L) a.finite,
    (eventually_finitePlace_iff_eventually_all_above
      (K := K) (L := L)
      (fun W =>
        relativeFiniteTensorPiMulEquiv
            (K := K) (L := L) a.finite W ∈
          (W.adicCompletionIntegers L).units)).mpr <| by
      filter_upwards [a.eventually_aboveAdicUnit] with w hw
      intro W
      rcases W with ⟨W, hW⟩
      subst w
      exact hw ⟨W, rfl⟩⟩
 

@[simp]
theorem relativeFiniteIdeleToFiniteIdele_apply
    (a : RelativeFiniteIdeleData (K := K) (L := L))
    (W : HeightOneSpectrum (𝓞 L)) :
    relativeFiniteIdeleToFiniteIdele
        (K := K) (L := L) a W =
      relativeFiniteTensorPiMulEquiv
        (K := K) (L := L) a.finite W :=
  rfl
 

noncomputable def finiteIdeleRelativeTensorFamily
    (y : FiniteIdeleGroup L) :
    ∀ w : HeightOneSpectrum (𝓞 K),
      (w.adicCompletion K ⊗[K] L)ˣ :=
  (relativeFiniteTensorPiMulEquiv
    (K := K) (L := L)).symm (fun W => y W)
 

theorem finiteIdeleRelativeTensorFamily_eventually_basisIntegralUnit
    (y : FiniteIdeleGroup L) :
    ∀ᶠ w : HeightOneSpectrum (𝓞 K) in Filter.cofinite,
      RelativeBasisIntegralUnitAt
        (K := K) (L := L) w
        (finiteIdeleRelativeTensorFamily
          (K := K) (L := L) y w) := by
  have habove :
      ∀ᶠ w : HeightOneSpectrum (𝓞 K) in Filter.cofinite,
        ∀ W : {W : HeightOneSpectrum (𝓞 L) //
            finitePlaceBelow (K := K) W = w},
          y W.1 ∈ (W.1.adicCompletionIntegers L).units :=
    (eventually_finitePlace_iff_eventually_all_above
      (K := K) (L := L)
      (fun W => y W ∈
        (W.adicCompletionIntegers L).units)).mp
      (FiniteIdeleGroup.eventually_mem_localUnits y)
  filter_upwards [
    habove,
    (integralTensorComparisonBadPlaces
      (K := K) (L := L)).eventually_cofinite_notMem] with w hw hbad
  apply
    (relativeBasisIntegralUnitAt_iff_localTensorDecompositionIntegralUnit_of_notMem
      (K := K) (L := L) w hbad).mpr
  apply
    (relativeLocalTensorDecompositionIntegralUnitAt_iff_aboveAdic
      (K := K) (L := L) w
      (finiteIdeleRelativeTensorFamily
        (K := K) (L := L) y w)).mpr
  intro W
  have hcomponent :=
    congrFun
      ((finitePlaceTensorUnitsEquivAboveAdic
        (K := K) (L := L) w).apply_symm_apply
          (fun W => y W.1)) W
  rw [finiteIdeleRelativeTensorFamily,
    relativeFiniteTensorPiMulEquiv_symm_apply,
    hcomponent]
  exact hw W
 

noncomputable def finiteIdeleToRelativeFiniteIdeleData
    (y : FiniteIdeleGroup L) :
    RelativeFiniteIdeleData (K := K) (L := L) where
  finite :=
    finiteIdeleRelativeTensorFamily
      (K := K) (L := L) y
  eventually_integral i :=
    (finiteIdeleRelativeTensorFamily_eventually_basisIntegralUnit
      (K := K) (L := L) y).mono fun w hw =>
        relativeBasisIntegralAt_repr_mem
          (K := K) (L := L) w _ hw.1 i
  eventually_inverse_integral i :=
    (finiteIdeleRelativeTensorFamily_eventually_basisIntegralUnit
      (K := K) (L := L) y).mono fun w hw =>
        relativeBasisIntegralAt_repr_mem
          (K := K) (L := L) w _ hw.2 i
 

noncomputable def relativeFiniteIdeleEquiv :
    RelativeFiniteIdeleData (K := K) (L := L) ≃
      FiniteIdeleGroup L where
  toFun :=
    relativeFiniteIdeleToFiniteIdele
      (K := K) (L := L)
  invFun :=
    finiteIdeleToRelativeFiniteIdeleData
      (K := K) (L := L)
  left_inv a := by
    apply RelativeFiniteIdeleData.ext
    change
      (relativeFiniteTensorPiMulEquiv
        (K := K) (L := L)).symm
          (relativeFiniteTensorPiMulEquiv
            (K := K) (L := L) a.finite) =
        a.finite
    exact
      (relativeFiniteTensorPiMulEquiv
        (K := K) (L := L)).symm_apply_apply a.finite
  right_inv y := by
    apply Subtype.ext
    change
      relativeFiniteTensorPiMulEquiv
          (K := K) (L := L)
          ((relativeFiniteTensorPiMulEquiv
            (K := K) (L := L)).symm (fun W => y W)) =
        fun W => y W
    exact
      (relativeFiniteTensorPiMulEquiv
        (K := K) (L := L)).apply_symm_apply (fun W => y W)
 

noncomputable instance relativeFiniteIdeleDataGroup :
    Group (RelativeFiniteIdeleData (K := K) (L := L)) :=
  (relativeFiniteIdeleEquiv
    (K := K) (L := L)).group
 

noncomputable def relativeFiniteIdeleMulEquiv :
    RelativeFiniteIdeleData (K := K) (L := L) ≃*
      FiniteIdeleGroup L :=
  (relativeFiniteIdeleEquiv
    (K := K) (L := L)).mulEquiv
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.Adele.InfinitePlaceTensorBlock -/
section
open scoped NumberField TensorProduct NumberField.LiesOver
open NumberField
noncomputable section
open LocalClassFieldTheory
open AlgebraicNumberTheory.Valuations

universe u v
variable
    {K : Type u} {L : Type v}
    [Field K] [NumberField K]
    [Field L] [NumberField L] [Algebra K L]
    [FiniteDimensional K L]
 

def infinitePlaceCompletionAlgEquiv
    (w : InfinitePlace K) :
    w.Completion ≃ₐ[K] w.1.Completion where
  __ := InfinitePlace.Completion.equiv w
  commutes' _ := rfl
 

noncomputable def infinitePlaceLocalTensorAlgEquiv
    (w : InfinitePlace K) :
    w.Completion ⊗[K] L ≃ₐ[K]
      LocalTensorAlgebra (L := L) w.1 :=
  Algebra.TensorProduct.congr
    (infinitePlaceCompletionAlgEquiv w)
    (AlgEquiv.refl : L ≃ₐ[K] L)
 
noncomputable def infinitePlaceLocalTensorUnitsEquiv
    (w : InfinitePlace K) :
    (w.Completion ⊗[K] L)ˣ ≃*
      (LocalTensorAlgebra (L := L) w.1)ˣ :=
  Units.mapEquiv
    (infinitePlaceLocalTensorAlgEquiv
      (K := K) (L := L) w).toMulEquiv
section Galois
variable [IsGalois K L]
section Equivariance
variable
    (w : InfinitePlace K)
    (hw : w.1.IsNontrivial)
    (u : AbsoluteValueExtension w.1 L)
end Equivariance
end Galois
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.Idele.BaseChange -/
section
open scoped NumberField TensorProduct RestrictedProduct
open NumberField IsDedekindDomain
noncomputable section
open AlgebraicNumberTheory.Valuations
universe u v
variable
    {K : Type u} {L : Type v}
    [Field K] [NumberField K]
    [Field L] [NumberField L] [Algebra K L]
    [FiniteDimensional K L]
 
def infinitePlaceBelow
    (W : InfinitePlace L) : InfinitePlace K :=
  W.comap (algebraMap K L)
section InfinitePlaceTower
variable {M : Type*}
    [Field M] [NumberField M]
    [Algebra K M] [Algebra M L]
    [IsScalarTower K M L]
end InfinitePlaceTower
 

def infinitePlaceAboveToExtension
    (w : InfinitePlace K)
    (W : {W : InfinitePlace L //
      infinitePlaceBelow (K := K) W = w}) :
    AbsoluteValueExtension w.1 L := by
  refine ⟨W.1.1, ?_⟩
  intro x
  have h :=
    congrArg (fun v : InfinitePlace K => v x) W.2
  exact h
omit [NumberField K] [NumberField L] [FiniteDimensional K L] in
 


theorem
    infinitePlaceAboveToExtension_surjective_of_isGalois
    [IsGalois K L]
    (w : InfinitePlace K) :
    Function.Surjective
      (infinitePlaceAboveToExtension
        (K := K) (L := L) w) := by
  intro u
  obtain ⟨W₀, hW₀⟩ :=
    InfinitePlace.comap_surjective
      (k := K) (K := L) w
  let W₀' :
      {W : InfinitePlace L //
        infinitePlaceBelow (K := K) W = w} :=
    ⟨W₀, hW₀⟩
  let u₀ : AbsoluteValueExtension w.1 L :=
    infinitePlaceAboveToExtension
      (K := K) (L := L) w W₀'
  obtain ⟨σ, hσ⟩ :=
    absoluteValueConjugacy w.1 w.isNontrivial u₀ u
  let Wσ : InfinitePlace L :=
    W₀.comap σ.toRingEquiv.toRingHom
  have hWσ :
      infinitePlaceBelow (K := K) Wσ = w := by
    apply InfinitePlace.ext
    intro x
    change W₀ (σ (algebraMap K L x)) = w x
    rw [σ.commutes]
    exact congrArg (fun v : InfinitePlace K => v x) hW₀
  refine ⟨⟨Wσ, hWσ⟩, ?_⟩
  rw [hσ]
  apply Subtype.ext
  rfl
 

noncomputable def infinitePlaceAboveEquivExtension
    (w : InfinitePlace K) :
    {W : InfinitePlace L //
      infinitePlaceBelow (K := K) W = w} ≃
      AbsoluteValueExtension w.1 L := by
  apply Equiv.ofBijective
    (infinitePlaceAboveToExtension
      (K := K) (L := L) w)
  constructor
  · intro W W' h
    have habs : W.1.1 = W'.1.1 :=
      congrArg
        (fun u : AbsoluteValueExtension w.1 L => u.1) h
    apply Subtype.ext
    apply Subtype.ext
    exact habs
  · intro u
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
    let hu : u.1.IsNontrivial :=
      u.isNontrivial w.isNontrivial
    let uOverL : AbsoluteValueExtension u.1 M :=
      pullbackAbsoluteValueExtension
        u.1 hu IsAlgClosed.lift
    let uM : AbsoluteValueExtension w.1 M :=
      { val := uOverL.1
        property := by
          intro x
          rw [IsScalarTower.algebraMap_apply K L M,
            uOverL.2, u.2] }
    obtain ⟨WM, hWM⟩ :=
      infinitePlaceAboveToExtension_surjective_of_isGalois
        (K := K) (L := M) w uM
    let WL : InfinitePlace L :=
      WM.1.comap (algebraMap L M)
    have hWL :
        infinitePlaceBelow (K := K) WL = w := by
      apply InfinitePlace.ext
      intro x
      change
        WM.1
            (algebraMap L M
              (algebraMap K L x)) =
          w x
      rw [← IsScalarTower.algebraMap_apply K L M]
      exact congrArg (fun v : InfinitePlace K => v x) WM.2
    refine ⟨⟨WL, hWL⟩, ?_⟩
    apply Subtype.ext
    ext x
    have hWMval :
        WM.1.1 = uM.1 :=
      congrArg Subtype.val hWM
    change
      WM.1.1 (algebraMap L M x) = u.1 x
    rw [hWMval]
    exact uOverL.2 x
 

noncomputable def infiniteCompletionProductReindexAbove
    (w : InfinitePlace K) :
    (∀ u : AbsoluteValueExtension w.1 L,
      u.1.Completionˣ) ≃*
      ∀ W : {W : InfinitePlace L //
          infinitePlaceBelow (K := K) W = w},
        W.1.1.Completionˣ := by
  let e :=
    Equiv.piCongrLeft'
      (fun u : AbsoluteValueExtension w.1 L =>
        u.1.Completionˣ)
      (infinitePlaceAboveEquivExtension
        (K := K) (L := L) w).symm
  exact
    { e with
      map_mul' := by
        intro x y
        funext W
        rfl }
 

noncomputable def infiniteCompletionProductEquivAbove
    (w : InfinitePlace K) :
    (∀ u : AbsoluteValueExtension w.1 L,
      u.1.Completionˣ) ≃*
      ∀ W : {W : InfinitePlace L //
          infinitePlaceBelow (K := K) W = w},
        W.1.Completionˣ :=
  (infiniteCompletionProductReindexAbove
    (K := K) (L := L) w).trans
    (MulEquiv.piCongrRight fun W =>
      Units.mapEquiv
        (InfinitePlace.Completion.equiv W.1).symm.toMulEquiv)
 

noncomputable def infinitePlaceTensorUnitsEquivAbove
    (w : InfinitePlace K) :
    (w.Completion ⊗[K] L)ˣ ≃*
      ∀ W : {W : InfinitePlace L //
          infinitePlaceBelow (K := K) W = w},
        W.1.Completionˣ := by
  letI : ∀ u : AbsoluteValueExtension w.1 L,
      Algebra w.1.Completion u.1.Completion :=
    fun u =>
      AbsoluteValue.completionAlgebra w.1 u.1 u.2
  exact
    (infinitePlaceLocalTensorUnitsEquiv
      (K := K) (L := L) w).trans
      ((localTensorUnitsEquivCompletionProduct
        (K := K) (L := L) w.1 w.isNontrivial).trans
        (infiniteCompletionProductEquivAbove
          (K := K) (L := L) w))
 

@[simp]
theorem infinitePlaceTensorUnitsEquivAbove_apply
    (w : InfinitePlace K)
    (z : (w.Completion ⊗[K] L)ˣ)
    (W : {W : InfinitePlace L //
      infinitePlaceBelow (K := K) W = w}) :
    infinitePlaceTensorUnitsEquivAbove
        (K := K) (L := L) w z W =
      Units.mapEquiv
          (InfinitePlace.Completion.equiv W.1).symm.toMulEquiv
        (localTensorUnitsEquivCompletionProduct
          w.1 w.isNontrivial
          (infinitePlaceLocalTensorUnitsEquiv
            (K := K) (L := L) w z)
        (infinitePlaceAboveEquivExtension
          (K := K) (L := L) w W)) :=
  rfl
 

theorem infinitePlaceTensorUnitsEquivAbove_localFieldIdeleInclusion
    (w : InfinitePlace K)
    (W : {W : InfinitePlace L //
      infinitePlaceBelow (K := K) W = w})
    (x : Lˣ) :
    infinitePlaceTensorUnitsEquivAbove
        (K := K) (L := L) w
        (infiniteLocalFieldIdeleInclusion
          (K := K) (L := L) w x) W =
      Units.map
        (algebraMap L W.1.Completion)
        x := by
  rw [infinitePlaceTensorUnitsEquivAbove_apply]
  apply Units.ext
  simp only [Units.coe_map]
  change
    (InfinitePlace.Completion.equiv W.1).symm
        (completionTensorDecomposition_left
          w.1 w.isNontrivial
          (1 ⊗ₜ[K] (x : L))
          (infinitePlaceAboveEquivExtension
            (K := K) (L := L) w W)) =
      algebraMap L W.1.Completion (x : L)
  rw [completionTensorDecomposition_left_tmul_apply]
  simp only [map_one, one_mul]
  apply InfinitePlace.Completion.ext
  rfl
 

noncomputable def infinitePlaceAbovePiMulEquiv :
    (∀ w : InfinitePlace K,
      ∀ W : {W : InfinitePlace L //
          infinitePlaceBelow (K := K) W = w},
        W.1.Completionˣ) ≃*
      ∀ W : InfinitePlace L, W.Completionˣ where
  toFun f W :=
    f (infinitePlaceBelow (K := K) W) ⟨W, rfl⟩
  invFun f w W := f W.1
  left_inv f := by
    funext w W
    rcases W with ⟨W, hW⟩
    subst w
    rfl
  right_inv f := by
    funext W
    rfl
  map_mul' f g := by
    funext W
    rfl
 

noncomputable def relativeInfiniteTensorPiMulEquiv :
    (∀ w : InfinitePlace K,
      (w.Completion ⊗[K] L)ˣ) ≃*
      ∀ W : InfinitePlace L, W.Completionˣ :=
  (MulEquiv.piCongrRight fun w =>
    infinitePlaceTensorUnitsEquivAbove
      (K := K) (L := L) w).trans
    (infinitePlaceAbovePiMulEquiv
      (K := K) (L := L))
 

noncomputable def relativeInfiniteIdeleMulEquiv :
    (∀ w : InfinitePlace K,
      (w.Completion ⊗[K] L)ˣ) ≃*
      InfiniteIdeleGroup L :=
  (relativeInfiniteTensorPiMulEquiv
    (K := K) (L := L)).trans
    ContinuousMulEquiv.piUnits.symm.toMulEquiv
 

@[simp]
theorem RelativeFiniteIdeleData.finite_mul
    (a b : RelativeFiniteIdeleData (K := K) (L := L))
    (w : HeightOneSpectrum (𝓞 K)) :
    (a * b).finite w = a.finite w * b.finite w := by
  change
    (relativeFiniteTensorPiMulEquiv
      (K := K) (L := L)).symm
        (relativeFiniteTensorPiMulEquiv
            (K := K) (L := L) a.finite *
          relativeFiniteTensorPiMulEquiv
            (K := K) (L := L) b.finite) w =
      a.finite w * b.finite w
  rw [← map_mul,
    (relativeFiniteTensorPiMulEquiv
      (K := K) (L := L)).symm_apply_apply]
  rfl
 
noncomputable def RelativeLocalIdeleData.toFiniteData
    (a : RelativeLocalIdeleData (K := K) (L := L)) :
    RelativeFiniteIdeleData (K := K) (L := L) where
  finite := a.finite
  eventually_integral := a.eventually_integral
  eventually_inverse_integral :=
    a.eventually_inverse_integral
 

@[simp]
theorem RelativeLocalIdeleData.toFiniteData_mul
    (a b : RelativeLocalIdeleData (K := K) (L := L)) :
    (a * b).toFiniteData =
      a.toFiniteData * b.toFiniteData := by
  apply RelativeFiniteIdeleData.ext
  funext w
  rw [RelativeFiniteIdeleData.finite_mul]
  change (a * b).finite w = a.finite w * b.finite w
  exact RelativeLocalIdeleData.finite_mul
    (K := K) (L := L) a b w
 

noncomputable def relativeLocalIdeleDataSplitMulEquiv :
    RelativeLocalIdeleData (K := K) (L := L) ≃*
      ((∀ w : InfinitePlace K,
          (w.Completion ⊗[K] L)ˣ) ×
        RelativeFiniteIdeleData (K := K) (L := L)) where
  toFun a :=
    ⟨a.infinite, a.toFiniteData⟩
  invFun a :=
    { infinite := a.1
      finite := a.2.finite
      eventually_integral := a.2.eventually_integral
      eventually_inverse_integral :=
        a.2.eventually_inverse_integral }
  left_inv a := by
    apply RelativeLocalIdeleData.ext <;> rfl
  right_inv a := by
    rcases a with ⟨a, b⟩
    rfl
  map_mul' a b := by
    apply Prod.ext
    · funext w
      exact RelativeLocalIdeleData.infinite_mul
        (K := K) (L := L) a b w
    · exact RelativeLocalIdeleData.toFiniteData_mul
        (K := K) (L := L) a b
 

noncomputable def relativeIdeleBaseChangeMulEquiv :
    RelativeIdeleGroup K L ≃* IdeleGroup L :=
  (relativeIdeleMulEquivLocalData
    (K := K) (L := L)).trans
    ((relativeLocalIdeleDataSplitMulEquiv
      (K := K) (L := L)).trans
      ((relativeInfiniteIdeleMulEquiv
        (K := K) (L := L)).prodCongr
        (relativeFiniteIdeleMulEquiv
          (K := K) (L := L))))
 

@[simp]
theorem relativeIdeleBaseChangeMulEquiv_finite
    (z : RelativeIdeleGroup K L) :
    (relativeIdeleBaseChangeMulEquiv
      (K := K) (L := L) z).2 =
      relativeFiniteIdeleToFiniteIdele
        (K := K) (L := L)
        (relativeIdeleToLocalData
          (K := K) (L := L) z).toFiniteData :=
  rfl
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
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.AdeleBaseChange -/
section
open scoped NumberField TensorProduct RestrictedProduct
open NumberField IsDedekindDomain
noncomputable section
open AlgebraicNumberTheory.Valuations
universe u v
variable
    {K : Type u} {L : Type v}
    [Field K] [NumberField K]
    [Field L] [NumberField L] [Algebra K L]
    [FiniteDimensional K L]
 

noncomputable def finitePlaceTensorRingEquivAboveAdic
    (w : HeightOneSpectrum (𝓞 K)) :
    (w.adicCompletion K ⊗[K] L) ≃+*
      ∀ W : {W : HeightOneSpectrum (𝓞 L) //
          finitePlaceBelow (K := K) W = w},
        W.1.adicCompletion L := by
  let vK := HeightOneSpectrum.adicAbv K w
  let hvK : vK.IsNontrivial :=
    RayClass.adicAbv_isNontrivial w
  letI : ∀ u : AbsoluteValueExtension vK L,
      Algebra vK.Completion u.1.Completion :=
    fun u =>
      AbsoluteValue.completionAlgebra vK u.1 u.2
  let e₁ :
      (w.adicCompletion K ⊗[K] L) ≃+*
        (∀ u : AbsoluteValueExtension vK L,
          u.1.Completion) :=
    (relativeFinitePlaceLocalTensorAlgEquiv
      (K := K) (L := L) w).symm.toRingEquiv.trans
      (completionTensorDecomposition_left
        (K := K) (L := L) vK hvK).toRingEquiv
  let e₂ :
      (∀ u : AbsoluteValueExtension vK L,
          u.1.Completion) ≃+*
        (∀ u : AbsoluteValueExtension vK L,
          (finitePlaceExtensionCentre
            (K := K) (L := L) w u).adicCompletion L) :=
    RingEquiv.piCongrRight fun u =>
      finitePlaceExtensionAdicCompletionRingEquiv
        (K := K) (L := L) w u
  let e₃ :
      (∀ u : AbsoluteValueExtension vK L,
          (finitePlaceExtensionCentre
            (K := K) (L := L) w u).adicCompletion L) ≃+*
        (∀ W : {W : HeightOneSpectrum (𝓞 L) //
            finitePlaceBelow (K := K) W = w},
          W.1.adicCompletion L) :=
    RingEquiv.piCongrLeft
      (fun W : {W : HeightOneSpectrum (𝓞 L) //
          finitePlaceBelow (K := K) W = w} =>
        W.1.adicCompletion L)
      (finitePlaceExtensionEquivAbove
        (K := K) (L := L) w)
  exact e₁.trans (e₂.trans e₃)
 

@[simp]
theorem finitePlaceTensorRingEquivAboveAdic_apply_extension
    (w : HeightOneSpectrum (𝓞 K))
    (x : w.adicCompletion K ⊗[K] L)
    (u : AbsoluteValueExtension
      (HeightOneSpectrum.adicAbv K w) L) :
    finitePlaceTensorRingEquivAboveAdic
        (K := K) (L := L) w x
        (finitePlaceExtensionEquivAbove
          (K := K) (L := L) w u) =
      finitePlaceExtensionAdicCompletionRingEquiv
          (K := K) (L := L) w u
        (finitePlaceLocalTensorDecompositionComponent
          (K := K) (L := L) w u x) := by
  let P :=
    fun W : {W : HeightOneSpectrum (𝓞 L) //
        finitePlaceBelow (K := K) W = w} =>
      W.1.adicCompletion L
  let e := finitePlaceExtensionEquivAbove (K := K) (L := L) w
  let f : ∀ a, P (e a) := fun a =>
    finitePlaceExtensionAdicCompletionRingEquiv
        (K := K) (L := L) w a
      (finitePlaceLocalTensorDecompositionComponent
        (K := K) (L := L) w a x)
  exact Equiv.piCongrLeft_apply_apply P e f u
 


theorem finitePlaceTensorRingEquivAboveAdic_tmul
    (w : HeightOneSpectrum (𝓞 K))
    (W : {W : HeightOneSpectrum (𝓞 L) //
      finitePlaceBelow (K := K) W = w})
    (a : w.adicCompletion K)
    (x : L) :
    finitePlaceTensorRingEquivAboveAdic
        (K := K) (L := L) w
        (a ⊗ₜ[K] x) W =
      finitePlaceAdicCompletionMap K L w W a *
        algebraMap L (W.1.adicCompletion L) x := by
  obtain ⟨u, rfl⟩ :=
    (finitePlaceExtensionEquivAbove
      (K := K) (L := L) w).surjective W
  rw [finitePlaceTensorRingEquivAboveAdic_apply_extension,
    finitePlaceLocalTensorDecompositionComponent_tmul, map_mul]
  change
    finitePlaceExtensionAdicCompletionMap K L w u a *
        finitePlaceExtensionAdicCompletionRingEquiv
          (K := K) (L := L) w u
          (AbsoluteValue.toCompletion u.1 x) =
      _
  rw [
    finitePlaceExtensionAdicCompletionMap_eq_finitePlaceAdicCompletionMap,
    finitePlaceExtensionAdicCompletionRingEquiv_toCompletion]
  rfl
 

noncomputable def infiniteCompletionRingProductReindexAbove
    (w : InfinitePlace K) :
    (∀ u : AbsoluteValueExtension w.1 L,
      u.1.Completion) ≃+*
      ∀ W : {W : InfinitePlace L //
          infinitePlaceBelow (K := K) W = w},
        W.1.1.Completion := by
  let e :=
    Equiv.piCongrLeft'
      (fun u : AbsoluteValueExtension w.1 L =>
        u.1.Completion)
      (infinitePlaceAboveEquivExtension
        (K := K) (L := L) w).symm
  exact
    { e with
      map_add' := by
        intro x y
        funext W
        rfl
      map_mul' := by
        intro x y
        funext W
        rfl }
 

noncomputable def infinitePlaceTensorRingEquivAbove
    (w : InfinitePlace K) :
    (w.Completion ⊗[K] L) ≃+*
      ∀ W : {W : InfinitePlace L //
          infinitePlaceBelow (K := K) W = w},
        W.1.Completion := by
  letI : ∀ u : AbsoluteValueExtension w.1 L,
      Algebra w.1.Completion u.1.Completion :=
    fun u =>
      AbsoluteValue.completionAlgebra w.1 u.1 u.2
  exact
    (infinitePlaceLocalTensorAlgEquiv
      (K := K) (L := L) w).toRingEquiv.trans
    ((completionTensorDecomposition_left
        (K := K) (L := L) w.1
        w.isNontrivial).toRingEquiv.trans
      ((infiniteCompletionRingProductReindexAbove
          (K := K) (L := L) w).trans
        (RingEquiv.piCongrRight fun W =>
          (InfinitePlace.Completion.equiv W.1).symm)))
 

@[simp]
theorem infinitePlaceTensorRingEquivAbove_apply
    (w : InfinitePlace K)
    (z : w.Completion ⊗[K] L)
    (W : {W : InfinitePlace L //
      infinitePlaceBelow (K := K) W = w}) :
    infinitePlaceTensorRingEquivAbove
        (K := K) (L := L) w z W =
      (InfinitePlace.Completion.equiv W.1).symm
        (completionTensorDecomposition_left
          w.1 w.isNontrivial
          (infinitePlaceLocalTensorAlgEquiv
            (K := K) (L := L) w z)
          (infinitePlaceAboveEquivExtension
            (K := K) (L := L) w W)) :=
  rfl
 

noncomputable def finitePlaceAbovePiRingEquiv :
    (∀ w : HeightOneSpectrum (𝓞 K),
      ∀ W : {W : HeightOneSpectrum (𝓞 L) //
          finitePlaceBelow (K := K) W = w},
        W.1.adicCompletion L) ≃+*
      ∀ W : HeightOneSpectrum (𝓞 L),
        W.adicCompletion L where
  toFun f W :=
    f (finitePlaceBelow (K := K) W) ⟨W, rfl⟩
  invFun f w W := f W.1
  left_inv f := by
    funext w W
    rcases W with ⟨W, hW⟩
    subst w
    rfl
  right_inv f := by
    funext W
    rfl
  map_add' f g := by
    funext W
    rfl
  map_mul' f g := by
    funext W
    rfl
 

noncomputable def relativeFiniteTensorPiRingEquiv :
    (∀ w : HeightOneSpectrum (𝓞 K),
      w.adicCompletion K ⊗[K] L) ≃+*
      ∀ W : HeightOneSpectrum (𝓞 L),
        W.adicCompletion L :=
  (RingEquiv.piCongrRight fun w =>
      finitePlaceTensorRingEquivAboveAdic
        (K := K) (L := L) w).trans
    (finitePlaceAbovePiRingEquiv (K := K) (L := L))
 

@[simp]
theorem relativeFiniteTensorPiRingEquiv_apply
    (x : ∀ w : HeightOneSpectrum (𝓞 K),
      w.adicCompletion K ⊗[K] L)
    (W : HeightOneSpectrum (𝓞 L)) :
    relativeFiniteTensorPiRingEquiv
        (K := K) (L := L) x W =
      finitePlaceTensorRingEquivAboveAdic
        (K := K) (L := L)
        (finitePlaceBelow (K := K) W)
        (x (finitePlaceBelow (K := K) W)) ⟨W, rfl⟩ :=
  rfl
 

@[simp]
theorem relativeFiniteTensorPiRingEquiv_symm_apply
    (y : ∀ W : HeightOneSpectrum (𝓞 L),
      W.adicCompletion L)
    (w : HeightOneSpectrum (𝓞 K)) :
    (relativeFiniteTensorPiRingEquiv
        (K := K) (L := L)).symm y w =
      (finitePlaceTensorRingEquivAboveAdic
        (K := K) (L := L) w).symm
        (fun W => y W.1) :=
  rfl
 

noncomputable def infinitePlaceAbovePiRingEquiv :
    (∀ w : InfinitePlace K,
      ∀ W : {W : InfinitePlace L //
          infinitePlaceBelow (K := K) W = w},
        W.1.Completion) ≃+*
      ∀ W : InfinitePlace L, W.Completion where
  toFun f W :=
    f (infinitePlaceBelow (K := K) W) ⟨W, rfl⟩
  invFun f w W := f W.1
  left_inv f := by
    funext w W
    rcases W with ⟨W, hW⟩
    subst w
    rfl
  right_inv f := by
    funext W
    rfl
  map_add' f g := by
    funext W
    rfl
  map_mul' f g := by
    funext W
    rfl
 

noncomputable def relativeInfiniteTensorPiRingEquiv :
    (∀ w : InfinitePlace K,
      w.Completion ⊗[K] L) ≃+*
      ∀ W : InfinitePlace L, W.Completion :=
  (RingEquiv.piCongrRight fun w =>
      infinitePlaceTensorRingEquivAbove
        (K := K) (L := L) w).trans
    (infinitePlaceAbovePiRingEquiv (K := K) (L := L))
 

theorem relativeLocalTensorDecompositionIntegralAt_iff_aboveAdicRing
    (w : HeightOneSpectrum (𝓞 K))
    (x : w.adicCompletion K ⊗[K] L) :
    RelativeLocalTensorDecompositionIntegralAt
        (K := K) (L := L) w x ↔
      ∀ W : {W : HeightOneSpectrum (𝓞 L) //
          finitePlaceBelow (K := K) W = w},
        finitePlaceTensorRingEquivAboveAdic
            (K := K) (L := L) w x W ∈
          W.1.adicCompletionIntegers L := by
  constructor
  · intro hx W
    let u :=
      (finitePlaceExtensionEquivAbove
        (K := K) (L := L) w).symm W
    have hW :
        finitePlaceExtensionEquivAbove
            (K := K) (L := L) w u = W :=
      (finitePlaceExtensionEquivAbove
        (K := K) (L := L) w).apply_symm_apply W
    rw [← hW,
      finitePlaceTensorRingEquivAboveAdic_apply_extension]
    exact
      (finitePlaceExtensionAdicCompletionRingEquiv_mem_integers_iff
        (K := K) (L := L) w u _).2 (hx u)
  · intro hx u
    have h :=
      hx (finitePlaceExtensionEquivAbove
        (K := K) (L := L) w u)
    rw [finitePlaceTensorRingEquivAboveAdic_apply_extension] at h
    exact
      (finitePlaceExtensionAdicCompletionRingEquiv_mem_integers_iff
        (K := K) (L := L) w u _).1 h
omit [NumberField L] in
 

theorem relativeAdele_finiteComponent_basisIntegral_of_notMem
    (z : RelativeAdeleRing K L)
    (w : HeightOneSpectrum (𝓞 K))
    (hw : w ∉ relativeAdeleCoefficientSupport
      (K := K) (L := L) z) :
    RelativeBasisIntegralAt
      (K := K) (L := L) w
      (relativeAdeleFiniteComponent
        (K := K) (L := L) w z) := by
  let c :
      ∀ i : RelativeAdeleBasisIndex (K := K) (L := L),
        w.adicCompletionIntegers K :=
    fun i =>
      ⟨(relativeAdeleCoefficient
          (K := K) (L := L) z i).2 w, by
        by_contra hi
        apply hw
        exact
          (mem_relativeAdeleCoefficientSupport_iff
            (K := K) (L := L) z w).2 ⟨i, hi⟩⟩
  refine ⟨c, ?_⟩
  simpa only [c, Subtype.coe_mk] using
    relativeAdeleFiniteComponent_eq_sum_tmul_coefficients
      (K := K) (L := L) z w
 

theorem relativeAdele_eventually_aboveAdicIntegral
    (z : RelativeAdeleRing K L) :
    ∀ᶠ w : HeightOneSpectrum (𝓞 K) in Filter.cofinite,
      ∀ W : {W : HeightOneSpectrum (𝓞 L) //
          finitePlaceBelow (K := K) W = w},
        finitePlaceTensorRingEquivAboveAdic
            (K := K) (L := L) w
            (relativeAdeleFiniteComponent
              (K := K) (L := L) w z) W ∈
          W.1.adicCompletionIntegers L := by
  classical
  filter_upwards [
    (relativeAdeleCoefficientSupport
      (K := K) (L := L) z).eventually_cofinite_notMem,
    (integralTensorComparisonBadPlaces
      (K := K) (L := L)).eventually_cofinite_notMem] with w hs hbad
  apply
    (relativeLocalTensorDecompositionIntegralAt_iff_aboveAdicRing
      (K := K) (L := L) w _).1
  apply
    (relativeBasisIntegralAt_iff_localTensorDecompositionIntegral_of_notMem
      (K := K) (L := L) w hbad).1
  exact relativeAdele_finiteComponent_basisIntegral_of_notMem
    (K := K) (L := L) z w hs
 
noncomputable def relativeAdeleToAdele
    (z : RelativeAdeleRing K L) :
    NumberField.AdeleRing (𝓞 L) L :=
  ⟨relativeInfiniteTensorPiRingEquiv
      (K := K) (L := L)
      (fun w =>
        relativeAdeleInfiniteComponent
          (K := K) (L := L) w z),
    ⟨relativeFiniteTensorPiRingEquiv
        (K := K) (L := L)
        (fun w =>
          relativeAdeleFiniteComponent
            (K := K) (L := L) w z),
      (eventually_finitePlace_iff_eventually_all_above
        (K := K) (L := L)
        (fun W =>
          relativeFiniteTensorPiRingEquiv
              (K := K) (L := L)
              (fun w =>
                relativeAdeleFiniteComponent
                  (K := K) (L := L) w z) W ∈
            W.adicCompletionIntegers L)).2 <| by
        filter_upwards [
          relativeAdele_eventually_aboveAdicIntegral
            (K := K) (L := L) z] with w hw
        intro W
        rcases W with ⟨W, hW⟩
        subst w
        exact hw ⟨W, rfl⟩⟩⟩
 
@[simp]
theorem relativeAdeleToAdele_infinite
    (z : RelativeAdeleRing K L)
    (W : InfinitePlace L) :
    (relativeAdeleToAdele
      (K := K) (L := L) z).1 W =
      infinitePlaceTensorRingEquivAbove
        (K := K) (L := L)
        (infinitePlaceBelow (K := K) W)
        (relativeAdeleInfiniteComponent
          (K := K) (L := L)
          (infinitePlaceBelow (K := K) W) z) ⟨W, rfl⟩ :=
  rfl
 
@[simp]
theorem relativeAdeleToAdele_finite
    (z : RelativeAdeleRing K L)
    (W : HeightOneSpectrum (𝓞 L)) :
    (relativeAdeleToAdele
      (K := K) (L := L) z).2 W =
      finitePlaceTensorRingEquivAboveAdic
        (K := K) (L := L)
        (finitePlaceBelow (K := K) W)
        (relativeAdeleFiniteComponent
          (K := K) (L := L)
          (finitePlaceBelow (K := K) W) z) ⟨W, rfl⟩ :=
  rfl
 

noncomputable def finiteAdeleRelativeTensorFamily
    (y : IsDedekindDomain.FiniteAdeleRing (𝓞 L) L) :
    ∀ w : HeightOneSpectrum (𝓞 K),
      w.adicCompletion K ⊗[K] L :=
  (relativeFiniteTensorPiRingEquiv
    (K := K) (L := L)).symm (fun W => y W)
 

theorem finiteAdeleRelativeTensorFamily_eventually_basisIntegral
    (y : IsDedekindDomain.FiniteAdeleRing (𝓞 L) L) :
    ∀ᶠ w : HeightOneSpectrum (𝓞 K) in Filter.cofinite,
      RelativeBasisIntegralAt
        (K := K) (L := L) w
        (finiteAdeleRelativeTensorFamily
          (K := K) (L := L) y w) := by
  have habove :
      ∀ᶠ w : HeightOneSpectrum (𝓞 K) in Filter.cofinite,
        ∀ W : {W : HeightOneSpectrum (𝓞 L) //
            finitePlaceBelow (K := K) W = w},
          y W.1 ∈ W.1.adicCompletionIntegers L :=
    (eventually_finitePlace_iff_eventually_all_above
      (K := K) (L := L)
      (fun W => y W ∈ W.adicCompletionIntegers L)).1 y.2
  filter_upwards [
    habove,
    (integralTensorComparisonBadPlaces
      (K := K) (L := L)).eventually_cofinite_notMem] with w hw hbad
  apply
    (relativeBasisIntegralAt_iff_localTensorDecompositionIntegral_of_notMem
      (K := K) (L := L) w hbad).2
  apply
    (relativeLocalTensorDecompositionIntegralAt_iff_aboveAdicRing
      (K := K) (L := L) w _).2
  intro W
  have hcomponent :=
    congrFun
      ((finitePlaceTensorRingEquivAboveAdic
        (K := K) (L := L) w).apply_symm_apply
          (fun W => y W.1)) W
  rw [finiteAdeleRelativeTensorFamily,
    relativeFiniteTensorPiRingEquiv_symm_apply,
    hcomponent]
  exact hw W
 
noncomputable def adeleToRelativeLocalAdeleData
    (y : NumberField.AdeleRing (𝓞 L) L) :
    RelativeLocalAdeleData (K := K) (L := L) where
  infinite :=
    (relativeInfiniteTensorPiRingEquiv
      (K := K) (L := L)).symm (fun W => y.1 W)
  finite :=
    finiteAdeleRelativeTensorFamily
      (K := K) (L := L) y.2
  eventually_integral i :=
    (finiteAdeleRelativeTensorFamily_eventually_basisIntegral
      (K := K) (L := L) y.2).mono fun w hw =>
        relativeBasisIntegralAt_repr_mem
          (K := K) (L := L) w _ hw i
 
noncomputable def adeleToRelativeAdele
    (y : NumberField.AdeleRing (𝓞 L) L) :
    RelativeAdeleRing K L :=
  relativeAdeleOfLocalData
    (K := K) (L := L)
    (adeleToRelativeLocalAdeleData
      (K := K) (L := L) y)
 

@[simp]
theorem adeleToRelativeAdele_infiniteComponent
    (y : NumberField.AdeleRing (𝓞 L) L)
    (w : InfinitePlace K) :
    relativeAdeleInfiniteComponent
        (K := K) (L := L) w
        (adeleToRelativeAdele
          (K := K) (L := L) y) =
      (relativeInfiniteTensorPiRingEquiv
        (K := K) (L := L)).symm
        (fun W => y.1 W) w := by
  rw [adeleToRelativeAdele,
    relativeAdeleOfLocalData_infiniteComponent]
  rfl
 

@[simp]
theorem adeleToRelativeAdele_finiteComponent
    (y : NumberField.AdeleRing (𝓞 L) L)
    (w : HeightOneSpectrum (𝓞 K)) :
    relativeAdeleFiniteComponent
        (K := K) (L := L) w
        (adeleToRelativeAdele
          (K := K) (L := L) y) =
      (relativeFiniteTensorPiRingEquiv
        (K := K) (L := L)).symm
        (fun W => y.2 W) w := by
  rw [adeleToRelativeAdele,
    relativeAdeleOfLocalData_finiteComponent]
  rfl
 

noncomputable def relativeAdeleBaseChangeRingEquiv :
    RelativeAdeleRing K L ≃+*
      NumberField.AdeleRing (𝓞 L) L where
  toFun :=
    relativeAdeleToAdele (K := K) (L := L)
  invFun :=
    adeleToRelativeAdele (K := K) (L := L)
  left_inv z := by
    apply relativeAdele_ext_of_components
    · intro w
      rw [adeleToRelativeAdele_infiniteComponent]
      change
        (relativeInfiniteTensorPiRingEquiv
          (K := K) (L := L)).symm
            (relativeInfiniteTensorPiRingEquiv
              (K := K) (L := L)
              (fun w =>
                relativeAdeleInfiniteComponent
                  (K := K) (L := L) w z)) w =
          relativeAdeleInfiniteComponent
            (K := K) (L := L) w z
      rw [(relativeInfiniteTensorPiRingEquiv
        (K := K) (L := L)).symm_apply_apply]
    · intro w
      rw [adeleToRelativeAdele_finiteComponent]
      change
        (relativeFiniteTensorPiRingEquiv
          (K := K) (L := L)).symm
            (relativeFiniteTensorPiRingEquiv
              (K := K) (L := L)
              (fun w =>
                relativeAdeleFiniteComponent
                  (K := K) (L := L) w z)) w =
          relativeAdeleFiniteComponent
            (K := K) (L := L) w z
      rw [(relativeFiniteTensorPiRingEquiv
        (K := K) (L := L)).symm_apply_apply]
  right_inv y := by
    apply Prod.ext
    · funext W
      rw [relativeAdeleToAdele_infinite,
        adeleToRelativeAdele_infiniteComponent]
      change
        relativeInfiniteTensorPiRingEquiv
            (K := K) (L := L)
            ((relativeInfiniteTensorPiRingEquiv
              (K := K) (L := L)).symm
              (fun W => y.1 W)) W =
          y.1 W
      rw [(relativeInfiniteTensorPiRingEquiv
        (K := K) (L := L)).apply_symm_apply]
    · apply DFunLike.coe_injective
      funext W
      change
        relativeFiniteTensorPiRingEquiv
            (K := K) (L := L)
            (fun w =>
              relativeAdeleFiniteComponent
                (K := K) (L := L) w
                (adeleToRelativeAdele
                  (K := K) (L := L) y)) W =
          y.2 W
      rw [show
        (fun w =>
          relativeAdeleFiniteComponent
            (K := K) (L := L) w
            (adeleToRelativeAdele
              (K := K) (L := L) y)) =
          (relativeFiniteTensorPiRingEquiv
            (K := K) (L := L)).symm
            (fun W => y.2 W) by
          funext w
          exact adeleToRelativeAdele_finiteComponent
            (K := K) (L := L) y w]
      rw [(relativeFiniteTensorPiRingEquiv
        (K := K) (L := L)).apply_symm_apply]
  map_add' x y := by
    apply Prod.ext
    · funext W
      change
        relativeInfiniteTensorPiRingEquiv
            (K := K) (L := L)
            (fun w =>
              relativeAdeleInfiniteComponent
                (K := K) (L := L) w (x + y)) W =
          relativeInfiniteTensorPiRingEquiv
              (K := K) (L := L)
              (fun w =>
                relativeAdeleInfiniteComponent
                  (K := K) (L := L) w x) W +
            relativeInfiniteTensorPiRingEquiv
              (K := K) (L := L)
              (fun w =>
                relativeAdeleInfiniteComponent
                  (K := K) (L := L) w y) W
      rw [show
        (fun w =>
          relativeAdeleInfiniteComponent
            (K := K) (L := L) w (x + y)) =
          (fun w =>
            relativeAdeleInfiniteComponent
              (K := K) (L := L) w x) +
          (fun w =>
            relativeAdeleInfiniteComponent
              (K := K) (L := L) w y) by
          funext w
          exact map_add _ _ _,
        map_add]
      rfl
    · apply Subtype.ext
      funext W
      change
        relativeFiniteTensorPiRingEquiv
            (K := K) (L := L)
            (fun w =>
              relativeAdeleFiniteComponent
                (K := K) (L := L) w (x + y)) W =
          relativeFiniteTensorPiRingEquiv
              (K := K) (L := L)
              (fun w =>
                relativeAdeleFiniteComponent
                  (K := K) (L := L) w x) W +
            relativeFiniteTensorPiRingEquiv
              (K := K) (L := L)
              (fun w =>
                relativeAdeleFiniteComponent
                  (K := K) (L := L) w y) W
      rw [show
        (fun w =>
          relativeAdeleFiniteComponent
            (K := K) (L := L) w (x + y)) =
          (fun w =>
            relativeAdeleFiniteComponent
              (K := K) (L := L) w x) +
          (fun w =>
            relativeAdeleFiniteComponent
              (K := K) (L := L) w y) by
          funext w
          exact map_add _ _ _,
        map_add]
      rfl
  map_mul' x y := by
    apply Prod.ext
    · funext W
      change
        relativeInfiniteTensorPiRingEquiv
            (K := K) (L := L)
            (fun w =>
              relativeAdeleInfiniteComponent
                (K := K) (L := L) w (x * y)) W =
          relativeInfiniteTensorPiRingEquiv
              (K := K) (L := L)
              (fun w =>
                relativeAdeleInfiniteComponent
                  (K := K) (L := L) w x) W *
            relativeInfiniteTensorPiRingEquiv
              (K := K) (L := L)
              (fun w =>
                relativeAdeleInfiniteComponent
                  (K := K) (L := L) w y) W
      rw [show
        (fun w =>
          relativeAdeleInfiniteComponent
            (K := K) (L := L) w (x * y)) =
          (fun w =>
            relativeAdeleInfiniteComponent
              (K := K) (L := L) w x) *
          (fun w =>
            relativeAdeleInfiniteComponent
              (K := K) (L := L) w y) by
          funext w
          exact map_mul _ _ _,
        map_mul]
      rfl
    · apply Subtype.ext
      funext W
      change
        relativeFiniteTensorPiRingEquiv
            (K := K) (L := L)
            (fun w =>
              relativeAdeleFiniteComponent
                (K := K) (L := L) w (x * y)) W =
          relativeFiniteTensorPiRingEquiv
              (K := K) (L := L)
              (fun w =>
                relativeAdeleFiniteComponent
                  (K := K) (L := L) w x) W *
            relativeFiniteTensorPiRingEquiv
              (K := K) (L := L)
              (fun w =>
                relativeAdeleFiniteComponent
                  (K := K) (L := L) w y) W
      rw [show
        (fun w =>
          relativeAdeleFiniteComponent
            (K := K) (L := L) w (x * y)) =
          (fun w =>
            relativeAdeleFiniteComponent
              (K := K) (L := L) w x) *
          (fun w =>
            relativeAdeleFiniteComponent
              (K := K) (L := L) w y) by
          funext w
          exact map_mul _ _ _,
        map_mul]
      rfl
 

theorem finitePlaceTensorRingEquivAboveAdic_tmul_one
    (w : HeightOneSpectrum (𝓞 K))
    (W : {W : HeightOneSpectrum (𝓞 L) //
      finitePlaceBelow (K := K) W = w})
    (x : L) :
    finitePlaceTensorRingEquivAboveAdic
        (K := K) (L := L) w
        ((1 : w.adicCompletion K) ⊗ₜ[K] x) W =
      algebraMap L (W.1.adicCompletion L) x := by
  obtain ⟨u, rfl⟩ :=
    (finitePlaceExtensionEquivAbove
      (K := K) (L := L) w).surjective W
  rw [finitePlaceTensorRingEquivAboveAdic_apply_extension,
    finitePlaceLocalTensorDecompositionComponent_tmul]
  simp only [map_one, one_mul,
    finitePlaceExtensionAdicCompletionRingEquiv_toCompletion]
  rfl
 

theorem infinitePlaceTensorRingEquivAbove_tmul_one
    (w : InfinitePlace K)
    (W : {W : InfinitePlace L //
      infinitePlaceBelow (K := K) W = w})
    (x : L) :
    infinitePlaceTensorRingEquivAbove
        (K := K) (L := L) w
        ((1 : w.Completion) ⊗ₜ[K] x) W =
      algebraMap L W.1.Completion x := by
  rw [infinitePlaceTensorRingEquivAbove_apply]
  change
    (InfinitePlace.Completion.equiv W.1).symm
        (completionTensorDecomposition_left
          w.1 w.isNontrivial
          ((1 : w.1.Completion) ⊗ₜ[K] x)
          (infinitePlaceAboveEquivExtension
            (K := K) (L := L) w W)) =
      algebraMap L W.1.Completion x
  rw [completionTensorDecomposition_left_tmul_apply]
  simp only [map_one, one_mul]
  apply InfinitePlace.Completion.ext
  rfl
 

theorem relativeAdeleBaseChangeRingEquiv_fieldInclusion
    (x : L) :
    relativeAdeleBaseChangeRingEquiv
        (K := K) (L := L)
        ((1 : NumberField.AdeleRing (𝓞 K) K) ⊗ₜ[K] x) =
      algebraMap L (NumberField.AdeleRing (𝓞 L) L) x := by
  change
    relativeAdeleToAdele
        (K := K) (L := L)
        ((1 : NumberField.AdeleRing (𝓞 K) K) ⊗ₜ[K] x) =
      algebraMap L (NumberField.AdeleRing (𝓞 L) L) x
  apply Prod.ext
  · funext W
    rw [relativeAdeleToAdele_infinite]
    change
      infinitePlaceTensorRingEquivAbove
          (K := K) (L := L)
          (infinitePlaceBelow (K := K) W)
          ((1 :
            (infinitePlaceBelow
              (K := K) W).Completion) ⊗ₜ[K] x)
          ⟨W, rfl⟩ =
        algebraMap L W.Completion x
    exact infinitePlaceTensorRingEquivAbove_tmul_one
      (K := K) (L := L)
      (infinitePlaceBelow (K := K) W) ⟨W, rfl⟩ x
  · apply DFunLike.coe_injective
    funext W
    rw [relativeAdeleToAdele_finite]
    change
      finitePlaceTensorRingEquivAboveAdic
          (K := K) (L := L)
          (finitePlaceBelow (K := K) W)
          ((1 :
            (finitePlaceBelow
              (K := K) W).adicCompletion K) ⊗ₜ[K] x)
          ⟨W, rfl⟩ =
        algebraMap L (W.adicCompletion L) x
    exact finitePlaceTensorRingEquivAboveAdic_tmul_one
      (K := K) (L := L)
      (finitePlaceBelow (K := K) W) ⟨W, rfl⟩ x
 

theorem finitePlaceTensorUnitsEquivAboveAdic_coe
    (w : HeightOneSpectrum (𝓞 K))
    (x : (w.adicCompletion K ⊗[K] L)ˣ)
    (W : {W : HeightOneSpectrum (𝓞 L) //
      finitePlaceBelow (K := K) W = w}) :
    ((finitePlaceTensorUnitsEquivAboveAdic
        (K := K) (L := L) w x W :
        (W.1.adicCompletion L)ˣ) :
        W.1.adicCompletion L) =
      finitePlaceTensorRingEquivAboveAdic
        (K := K) (L := L) w
        (x : w.adicCompletion K ⊗[K] L) W := by
  obtain ⟨u, rfl⟩ :=
    (finitePlaceExtensionEquivAbove
      (K := K) (L := L) w).surjective W
  rw [finitePlaceTensorUnitsEquivAboveAdic_apply_extension,
    finitePlaceTensorRingEquivAboveAdic_apply_extension]
  rfl
 

theorem relativeFiniteTensorPiMulEquiv_coe
    (x : ∀ w : HeightOneSpectrum (𝓞 K),
      (w.adicCompletion K ⊗[K] L)ˣ)
    (W : HeightOneSpectrum (𝓞 L)) :
    ((relativeFiniteTensorPiMulEquiv
        (K := K) (L := L) x W :
        (W.adicCompletion L)ˣ) :
        W.adicCompletion L) =
      relativeFiniteTensorPiRingEquiv
        (K := K) (L := L)
        (fun w =>
          (x w : w.adicCompletion K ⊗[K] L)) W := by
  rw [relativeFiniteTensorPiMulEquiv_apply,
    relativeFiniteTensorPiRingEquiv_apply]
  exact finitePlaceTensorUnitsEquivAboveAdic_coe
    (K := K) (L := L)
    (finitePlaceBelow (K := K) W)
    (x (finitePlaceBelow (K := K) W)) ⟨W, rfl⟩
 

theorem relativeIdeleBaseChangeMulEquiv_eq_ringUnits
    (z : RelativeIdeleGroup K L) :
    IdeleGroup.equivAdeleRingUnits
        (relativeIdeleBaseChangeMulEquiv
          (K := K) (L := L) z) =
      Units.mapEquiv
        (relativeAdeleBaseChangeRingEquiv
          (K := K) (L := L)).toMulEquiv z := by
  apply Units.ext
  apply Prod.ext
  · funext W
    change
      ((IdeleGroup.infiniteComponent W
          (relativeIdeleBaseChangeMulEquiv
            (K := K) (L := L) z) :
          W.Completionˣ) : W.Completion) =
        (relativeAdeleToAdele
          (K := K) (L := L)
          (z : RelativeAdeleRing K L)).1 W
    rfl
  · apply DFunLike.coe_injective
    funext W
    change
      ((((relativeIdeleBaseChangeMulEquiv
          (K := K) (L := L) z).2 W :
          (W.adicCompletion L)ˣ)) :
          W.adicCompletion L) =
        relativeFiniteTensorPiRingEquiv
          (K := K) (L := L)
          (fun w =>
            relativeAdeleFiniteComponent
              (K := K) (L := L) w
              (z : RelativeAdeleRing K L)) W
    rw [relativeIdeleBaseChangeMulEquiv_finite,
      relativeFiniteIdeleToFiniteIdele_apply]
    exact relativeFiniteTensorPiMulEquiv_coe
      (K := K) (L := L)
      (fun w =>
        RelativeIdeleGroup.finiteComponent
          (K := K) (L := L) w z) W
 

@[simp]
theorem relativeIdeleBaseChangeMulEquiv_principalIdele
    (x : Lˣ) :
    relativeIdeleBaseChangeMulEquiv
        (K := K) (L := L)
        (RelativeIdeleGroup.principalIdele K L x) =
      IdeleGroup.principalIdele L x := by
  apply Prod.ext
  · apply Units.ext
    funext W
    change
      infinitePlaceTensorUnitsEquivAbove
          (K := K) (L := L)
          (infinitePlaceBelow (K := K) W)
          ((relativeIdeleToLocalData
            (K := K) (L := L)
            (RelativeIdeleGroup.principalIdele K L x)).infinite
              (infinitePlaceBelow (K := K) W))
          ⟨W, rfl⟩ =
        algebraMap L W.Completion (x : L)
    simp only [relativeIdeleToLocalData]
    rw [RelativeIdeleGroup.infiniteComponent_principalIdele,
      infinitePlaceTensorUnitsEquivAbove_localFieldIdeleInclusion]
    simp
  · rw [relativeIdeleBaseChangeMulEquiv_finite]
    apply RestrictedProduct.ext
    intro W
    rw [relativeFiniteIdeleToFiniteIdele_apply,
      relativeFiniteTensorPiMulEquiv_apply]
    change
      finitePlaceTensorUnitsEquivAboveAdic
          (K := K) (L := L)
          (finitePlaceBelow (K := K) W)
          ((relativeIdeleToLocalData
            (K := K) (L := L)
            (RelativeIdeleGroup.principalIdele K L x)).finite
              (finitePlaceBelow (K := K) W))
          ⟨W, rfl⟩ =
        Units.map (FinitePlace.embedding (K := L) W) x
    simp only [relativeIdeleToLocalData]
    rw [RelativeIdeleGroup.finiteComponent_principalIdele,
      finitePlaceTensorUnitsEquivAboveAdic_localFieldIdeleInclusion]
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.FiniteAbelianCompositum -/
section
noncomputable section
namespace AlgebraicNumberTheory
open scoped IsMulCommutative
universe u v
 
def finiteGaloisFieldRange
    (K L : Type) [Field K] [Field L] [Algebra K L]
    [FiniteDimensional K L] [IsGalois K L] :
    IntermediateField K (SeparableClosure K) :=
  AlgHom.fieldRange
    (AlgebraicNumberTheory.separableEmbeddingIntoSeparableClosure K L)
 
def finiteGaloisFieldRangeEquiv
    (K L : Type) [Field K] [Field L] [Algebra K L]
    [FiniteDimensional K L] [IsGalois K L] :
    L ≃ₐ[K] finiteGaloisFieldRange K L :=
  AlgEquiv.ofInjectiveField
    (AlgebraicNumberTheory.separableEmbeddingIntoSeparableClosure K L)
 
instance finiteGaloisFieldRange_finiteDimensional
    (K L : Type) [Field K] [Field L] [Algebra K L]
    [FiniteDimensional K L] [IsGalois K L] :
    FiniteDimensional K (finiteGaloisFieldRange K L) :=
  (finiteGaloisFieldRangeEquiv K L).toLinearEquiv.finiteDimensional
section AbelianCompositum
variable (K : Type u) [Field K]
variable {Omega : Type v} [Field Omega] [Algebra K Omega]
 

theorem isAbelianGalois_sup
    (A B : IntermediateField K Omega)
    [FiniteDimensional K A] [FiniteDimensional K B]
    [IsAbelianGalois K A] [IsAbelianGalois K B] :
    IsAbelianGalois K (A ⊔ B : IntermediateField K Omega) := by
  let M : IntermediateField K Omega := A ⊔ B
  let j : M →ₐ[K] Omega := M.val
  let A' : IntermediateField K M := A.comap j
  let B' : IntermediateField K M := B.comap j

  have hjrange : j.fieldRange = M :=
    IntermediateField.fieldRange_val M
  have hAmap : A'.map j = A := by
    apply IntermediateField.map_comap_eq_self
    rw [hjrange]
    exact le_sup_left
  have hBmap : B'.map j = B := by
    apply IntermediateField.map_comap_eq_self
    rw [hjrange]
    exact le_sup_right
  have hsup : A' ⊔ B' = ⊤ := by
    apply IntermediateField.map_injective j
    rw [IntermediateField.map_sup, hAmap, hBmap,
      ← AlgHom.fieldRange_eq_map, hjrange]

  let eA : A' →ₐ[K] A :=
    ((j.comp A'.val).codRestrict A.toSubalgebra fun x ↦ x.2)
  let eB : B' →ₐ[K] B :=
    ((j.comp B'.val).codRestrict B.toSubalgebra fun x ↦ x.2)
  let : IsAbelianGalois K A' := IsAbelianGalois.of_algHom eA
  let : IsAbelianGalois K B' := IsAbelianGalois.of_algHom eB
  let : IsGalois K M := inferInstance

  let rA : (M ≃ₐ[K] M) →* (A' ≃ₐ[K] A') :=
    AlgEquiv.restrictNormalHom A'
  let rB : (M ≃ₐ[K] M) →* (B' ≃ₐ[K] B') :=
    AlgEquiv.restrictNormalHom B'
  let r : (M ≃ₐ[K] M) →* (A' ≃ₐ[K] A') × (B' ≃ₐ[K] B') :=
    rA.prod rB
  have hr : Function.Injective r := by
    rw [injective_iff_map_eq_one]
    intro sigma hsigma
    have hAone : rA sigma = 1 := congrArg Prod.fst hsigma
    have hBone : rB sigma = 1 := congrArg Prod.snd hsigma
    have hmemA : sigma ∈ A'.fixingSubgroup := by
      rw [← IntermediateField.restrictNormalHom_ker]
      exact hAone
    have hmemB : sigma ∈ B'.fixingSubgroup := by
      rw [← IntermediateField.restrictNormalHom_ker]
      exact hBone
    have hmem : sigma ∈ (A' ⊔ B').fixingSubgroup := by
      rw [IntermediateField.fixingSubgroup_sup]
      exact ⟨hmemA, hmemB⟩
    simpa [hsup] using hmem

  exact
    { is_comm.comm := fun sigma tau ↦ by
        apply hr
        rw [map_mul, map_mul]
        apply Prod.ext
        · change rA sigma * rA tau = rA tau * rA sigma
          exact mul_comm (rA sigma) (rA tau)
        · change rB sigma * rB tau = rB tau * rB sigma
          exact mul_comm (rB sigma) (rB tau) }
end AbelianCompositum
section ConcreteAbelianCompositum
variable (K L E : Type)
variable [Field K]
variable [Field L] [Field E] [Algebra K L] [Algebra K E]
variable [FiniteDimensional K L] [FiniteDimensional K E]
variable [IsAbelianGalois K L] [IsAbelianGalois K E]
 

def finiteAbelianCompositumField :
    IntermediateField K (SeparableClosure K) :=
  finiteGaloisFieldRange K L ⊔ finiteGaloisFieldRange K E
 
instance finiteAbelianCompositumField_finiteDimensional :
    FiniteDimensional K (finiteAbelianCompositumField K L E) :=
  IntermediateField.finiteDimensional_sup
    (finiteGaloisFieldRange K L) (finiteGaloisFieldRange K E)
 
instance finiteAbelianCompositumField_isAbelianGalois :
    IsAbelianGalois K (finiteAbelianCompositumField K L E) := by
  let : IsAbelianGalois K (finiteGaloisFieldRange K L) :=
    IsAbelianGalois.of_algHom
      (finiteGaloisFieldRangeEquiv K L).symm.toAlgHom
  let : IsAbelianGalois K (finiteGaloisFieldRange K E) :=
    IsAbelianGalois.of_algHom
      (finiteGaloisFieldRangeEquiv K E).symm.toAlgHom
  exact isAbelianGalois_sup K
    (finiteGaloisFieldRange K L) (finiteGaloisFieldRange K E)
 
def finiteAbelianCompositumEmbeddingLeft :
    L →ₐ[K] finiteAbelianCompositumField K L E :=
  (IntermediateField.inclusion le_sup_left).comp
    (finiteGaloisFieldRangeEquiv K L).toAlgHom
 
def finiteAbelianCompositumEmbeddingRight :
    E →ₐ[K] finiteAbelianCompositumField K L E :=
  (IntermediateField.inclusion le_sup_right).comp
    (finiteGaloisFieldRangeEquiv K E).toAlgHom
 

theorem finiteAbelianCompositum_embeddingRanges_sup_eq_top :
    (finiteAbelianCompositumEmbeddingLeft K L E).fieldRange ⊔
        (finiteAbelianCompositumEmbeddingRight K L E).fieldRange = ⊤ := by
  let A₀ : IntermediateField K (SeparableClosure K) :=
    finiteGaloisFieldRange K L
  let B₀ : IntermediateField K (SeparableClosure K) :=
    finiteGaloisFieldRange K E
  let M : IntermediateField K (SeparableClosure K) :=
    finiteAbelianCompositumField K L E
  let j : M →ₐ[K] SeparableClosure K := M.val
  have hjrange : j.fieldRange = M :=
    IntermediateField.fieldRange_val M
  have hjleft :
      j.comp (finiteAbelianCompositumEmbeddingLeft K L E) =
        A₀.val.comp (finiteGaloisFieldRangeEquiv K L).toAlgHom := by
    ext x
    rfl
  have hjright :
      j.comp (finiteAbelianCompositumEmbeddingRight K L E) =
        B₀.val.comp (finiteGaloisFieldRangeEquiv K E).toAlgHom := by
    ext x
    rfl
  have heqLeft :
      (finiteGaloisFieldRangeEquiv K L).toAlgHom.fieldRange =
        (⊤ : IntermediateField K A₀) :=
    AlgHom.fieldRange_eq_top.mpr
      (finiteGaloisFieldRangeEquiv K L).surjective
  have heqRight :
      (finiteGaloisFieldRangeEquiv K E).toAlgHom.fieldRange =
        (⊤ : IntermediateField K B₀) :=
    AlgHom.fieldRange_eq_top.mpr
      (finiteGaloisFieldRangeEquiv K E).surjective
  have hleft :
      (finiteAbelianCompositumEmbeddingLeft K L E).fieldRange.map j = A₀ := by
    calc
      (finiteAbelianCompositumEmbeddingLeft K L E).fieldRange.map j =
          (j.comp (finiteAbelianCompositumEmbeddingLeft K L E)).fieldRange :=
        AlgHom.map_fieldRange _ _
      _ = (A₀.val.comp
          (finiteGaloisFieldRangeEquiv K L).toAlgHom).fieldRange :=
        congrArg AlgHom.fieldRange hjleft
      _ = (finiteGaloisFieldRangeEquiv K L).toAlgHom.fieldRange.map A₀.val :=
        (AlgHom.map_fieldRange _ _).symm
      _ = (⊤ : IntermediateField K A₀).map A₀.val := by
        rw [heqLeft]
      _ = A₀.val.fieldRange :=
        (AlgHom.fieldRange_eq_map A₀.val).symm
      _ = A₀ := IntermediateField.fieldRange_val A₀
  have hright :
      (finiteAbelianCompositumEmbeddingRight K L E).fieldRange.map j = B₀ := by
    calc
      (finiteAbelianCompositumEmbeddingRight K L E).fieldRange.map j =
          (j.comp (finiteAbelianCompositumEmbeddingRight K L E)).fieldRange :=
        AlgHom.map_fieldRange _ _
      _ = (B₀.val.comp
          (finiteGaloisFieldRangeEquiv K E).toAlgHom).fieldRange :=
        congrArg AlgHom.fieldRange hjright
      _ = (finiteGaloisFieldRangeEquiv K E).toAlgHom.fieldRange.map B₀.val :=
        (AlgHom.map_fieldRange _ _).symm
      _ = (⊤ : IntermediateField K B₀).map B₀.val := by
        rw [heqRight]
      _ = B₀.val.fieldRange :=
        (AlgHom.fieldRange_eq_map B₀.val).symm
      _ = B₀ := IntermediateField.fieldRange_val B₀
  apply IntermediateField.map_injective j
  calc
    ((finiteAbelianCompositumEmbeddingLeft K L E).fieldRange ⊔
        (finiteAbelianCompositumEmbeddingRight K L E).fieldRange).map j =
        A₀ ⊔ B₀ := by
      rw [IntermediateField.map_sup, hleft, hright]
    _ = M := rfl
    _ = j.fieldRange := hjrange.symm
    _ = (⊤ : IntermediateField K M).map j :=
      AlgHom.fieldRange_eq_map j
end ConcreteAbelianCompositum
end AlgebraicNumberTheory
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.Idele.Extension.IdeleNorm -/
section
open scoped NumberField
open NumberField
noncomputable section
namespace IdeleGroup
universe u v
variable
    (K : Type u) (L : Type v)
    [Field K] [NumberField K]
    [Field L] [NumberField L] [Algebra K L]
 

noncomputable def norm :
    IdeleGroup L →* IdeleGroup K :=
  (RelativeIdeleGroup.norm K L).comp
    (relativeIdeleBaseChangeMulEquiv
      (K := K) (L := L)).symm.toMonoidHom
@[simp]
theorem norm_relativeIdeleBaseChangeMulEquiv
    (z : RelativeIdeleGroup K L) :
    norm K L
        (relativeIdeleBaseChangeMulEquiv
          (K := K) (L := L) z) =
      RelativeIdeleGroup.norm K L z := by
  simp [norm]
 

@[simp]
theorem norm_principalIdele
    (x : Lˣ) :
    norm K L (principalIdele L x) =
      principalIdele K (Units.map (Algebra.norm K) x) := by
  rw [← relativeIdeleBaseChangeMulEquiv_principalIdele
    (K := K) (L := L) x]
  rw [norm_relativeIdeleBaseChangeMulEquiv,
    RelativeIdeleGroup.norm_principalIdele]
end IdeleGroup
universe u v
variable
    (K : Type u) (L : Type v)
    [Field K] [NumberField K]
    [Field L] [NumberField L] [Algebra K L]
 
noncomputable def ideleClassNorm :
    IdeleClassGroup L →* IdeleClassGroup K :=
  QuotientGroup.map
    (IdeleGroup.principalSubgroup L)
    (IdeleGroup.principalSubgroup K)
    (IdeleGroup.norm K L)
    (by
      rintro _ ⟨x, rfl⟩
      exact
        ⟨Units.map (Algebra.norm K) x,
          (IdeleGroup.norm_principalIdele K L x).symm⟩)
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.Idele.ClassGroup.TowerBaseChange -/
section
open scoped NumberField TensorProduct
open NumberField IsDedekindDomain
noncomputable section
open AlgebraicNumberTheory.Valuations
universe u
variable
    (K M L : Type u)
    [Field K] [NumberField K]
    [Field M] [NumberField M]
    [Field L] [NumberField L]
    [Algebra K M] [Algebra M L] [Algebra K L]
    [IsScalarTower K M L]
    [FiniteDimensional K M] [FiniteDimensional M L]
section RingComparison
 

noncomputable def intermediateRelativeAdeleBaseChangeAlgEquiv :
    RelativeAdeleRing K M ≃ₐ[M]
      NumberField.AdeleRing (𝓞 M) M :=
  AlgEquiv.ofRingEquiv
    (f := relativeAdeleBaseChangeRingEquiv
      (K := K) (L := M))
    (by
      intro m
      change
        relativeAdeleBaseChangeRingEquiv
            (K := K) (L := M)
            ((1 : NumberField.AdeleRing (𝓞 K) K) ⊗ₜ[K] m) =
          algebraMap M
            (NumberField.AdeleRing (𝓞 M) M) m
      exact relativeAdeleBaseChangeRingEquiv_fieldInclusion
        (K := K) (L := M) m)
 
noncomputable def towerActualRelativeAdeleRingEquiv :
    TowerRelativeAdeleRing K M L ≃+*
      RelativeAdeleRing M L :=
  (Algebra.TensorProduct.congr
    (intermediateRelativeAdeleBaseChangeAlgEquiv K M)
    (AlgEquiv.refl : L ≃ₐ[M] L)).toRingEquiv
end RingComparison
section IdeleComparison
section ViaOrdinary
end ViaOrdinary
end IdeleComparison
section NormComparison
end NormComparison
section ClassNormComparison
end ClassNormComparison
section OrdinaryNormTower
end OrdinaryNormTower
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.Idele.Cohomology.SPlaces.OutsideIntegralInduced.LocalInduction.Spine -/
section
open scoped NumberField TensorProduct ValuativeRel NNReal
open NumberField IsDedekindDomain
noncomputable section
open AlgebraicNumberTheory.Valuations

open LocalClassFieldTheory

variable
    {K : Type} {L : Type}
    [Field K] [NumberField K]
    [Field L] [NumberField L] [Algebra K L]
    [FiniteDimensional K L] [IsGalois K L]
namespace LocalInductionInternal
variable (vK : AbsoluteValue K ℝ)
    (w : AbsoluteValueExtension vK L)
 

noncomputable abbrev completionAlgebra :
    Algebra vK.Completion w.1.Completion :=
  AbsoluteValue.completionAlgebra vK w.1 w.2
end LocalInductionInternal
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
 

def infinitePlaceIdeleClass
    (v : InfinitePlace K) :
    v.Completionˣ →* IdeleClassGroup K :=
  (QuotientGroup.mk'
    (IdeleGroup.principalSubgroup K)).comp
      (infinitePlaceIdele v)
 
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
 
@[simp]
theorem finitePlaceIdele_infiniteComponent
    (v : HeightOneSpectrum (𝓞 K))
    (w : InfinitePlace K)
    (x : (v.adicCompletion K)ˣ) :
    IdeleGroup.infiniteComponent w
        (finitePlaceIdele v x) = 1 := by
  rfl
 

def finitePlaceIdeleClass
    (v : HeightOneSpectrum (𝓞 K)) :
    (v.adicCompletion K)ˣ →* IdeleClassGroup K :=
  (QuotientGroup.mk'
    (IdeleGroup.principalSubgroup K)).comp
      (finitePlaceIdele v)
end IdeleGroup
namespace RelativeIdeleGroup
section Relative
variable
    {K : Type*} [Field K] [NumberField K]
    {L : Type*} [Field L] [NumberField L] [Algebra K L]
    [FiniteDimensional K L]
 

private def relativeInfinitePlaceValue
    (v : InfinitePlace K)
    (z : (v.Completion ⊗[K] L)ˣ)
    (w : InfinitePlace K) :
    (w.Completion ⊗[K] L)ˣ :=
  if h : w = v then h.symm ▸ z else 1
 
private noncomputable def relativeInfinitePlaceData
    (v : InfinitePlace K)
    (z : (v.Completion ⊗[K] L)ˣ) :
    RelativeLocalIdeleData (K := K) (L := L) where
  infinite w := relativeInfinitePlaceValue (L := L) v z w
  finite _ := 1
  eventually_integral i := by
    have hBase :=
      (relativeIdeleToLocalData
        (K := K) (L := L)
        (1 : RelativeIdeleGroup K L)).eventually_integral i
    filter_upwards [hBase] with w hw
    have hOne :
        (relativeIdeleToLocalData
          (K := K) (L := L)
          (1 : RelativeIdeleGroup K L)).finite w = 1 := by
      change
        RelativeIdeleGroup.finiteComponent
            (K := K) (L := L) w
            (1 : RelativeIdeleGroup K L) = 1
      exact map_one _
    rw [hOne] at hw
    exact hw
  eventually_inverse_integral i := by
    have hBase :=
      (relativeIdeleToLocalData
        (K := K) (L := L)
        (1 : RelativeIdeleGroup K L)).eventually_inverse_integral i
    filter_upwards [hBase] with w hw
    have hOne :
        (relativeIdeleToLocalData
          (K := K) (L := L)
          (1 : RelativeIdeleGroup K L)).finite w = 1 := by
      change
        RelativeIdeleGroup.finiteComponent
            (K := K) (L := L) w
            (1 : RelativeIdeleGroup K L) = 1
      exact map_one _
    rw [hOne] at hw
    exact hw
 

private def relativeFinitePlaceValue
    (v : HeightOneSpectrum (𝓞 K))
    (z : (v.adicCompletion K ⊗[K] L)ˣ)
    (w : HeightOneSpectrum (𝓞 K)) :
    (w.adicCompletion K ⊗[K] L)ˣ :=
  if h : w = v then h.symm ▸ z else 1
omit [NumberField L] [FiniteDimensional K L] in
@[simp]
private theorem relativeFinitePlaceValue_same
    (v : HeightOneSpectrum (𝓞 K))
    (z : (v.adicCompletion K ⊗[K] L)ˣ) :
    relativeFinitePlaceValue (L := L) v z v = z := by
  simp [relativeFinitePlaceValue]
omit [NumberField L] [FiniteDimensional K L] in
@[simp]
private theorem relativeFinitePlaceValue_of_ne
    (v w : HeightOneSpectrum (𝓞 K))
    (z : (v.adicCompletion K ⊗[K] L)ˣ)
    (h : w ≠ v) :
    relativeFinitePlaceValue (L := L) v z w = 1 := by
  simp [relativeFinitePlaceValue, h]
 
private noncomputable def relativeFinitePlaceData
    (v : HeightOneSpectrum (𝓞 K))
    (z : (v.adicCompletion K ⊗[K] L)ˣ) :
    RelativeLocalIdeleData (K := K) (L := L) where
  infinite _ := 1
  finite w := relativeFinitePlaceValue (L := L) v z w
  eventually_integral i := by
    have hBase :=
      (relativeIdeleToLocalData
        (K := K) (L := L)
        (1 : RelativeIdeleGroup K L)).eventually_integral i
    have hAway :
        ∀ᶠ w : HeightOneSpectrum (𝓞 K) in Filter.cofinite,
          w ≠ v := by
      rw [Filter.eventually_cofinite]
      simp
    filter_upwards [hBase, hAway] with w hw hne
    have hOne :
        (relativeIdeleToLocalData
          (K := K) (L := L)
          (1 : RelativeIdeleGroup K L)).finite w = 1 := by
      change
        RelativeIdeleGroup.finiteComponent
            (K := K) (L := L) w
            (1 : RelativeIdeleGroup K L) = 1
      exact map_one _
    rw [hOne] at hw
    simpa [relativeFinitePlaceValue_of_ne
      (L := L) v w z hne] using hw
  eventually_inverse_integral i := by
    have hBase :=
      (relativeIdeleToLocalData
        (K := K) (L := L)
        (1 : RelativeIdeleGroup K L)).eventually_inverse_integral i
    have hAway :
        ∀ᶠ w : HeightOneSpectrum (𝓞 K) in Filter.cofinite,
          w ≠ v := by
      rw [Filter.eventually_cofinite]
      simp
    filter_upwards [hBase, hAway] with w hw hne
    have hOne :
        (relativeIdeleToLocalData
          (K := K) (L := L)
          (1 : RelativeIdeleGroup K L)).finite w = 1 := by
      change
        RelativeIdeleGroup.finiteComponent
            (K := K) (L := L) w
            (1 : RelativeIdeleGroup K L) = 1
      exact map_one _
    rw [hOne] at hw
    simpa [relativeFinitePlaceValue_of_ne
      (L := L) v w z hne] using hw
 
def relativeFinitePlaceIdele
    (v : HeightOneSpectrum (𝓞 K))
    (z : (v.adicCompletion K ⊗[K] L)ˣ) :
    RelativeIdeleGroup K L :=
  relativeIdeleOfLocalData
    (K := K) (L := L)
    (relativeFinitePlaceData (K := K) (L := L) v z)
omit [NumberField L] in
 

@[simp]
theorem relativeFinitePlaceIdele_finiteComponent_same
    (v : HeightOneSpectrum (𝓞 K))
    (z : (v.adicCompletion K ⊗[K] L)ˣ) :
    RelativeIdeleGroup.finiteComponent
        (K := K) (L := L) v
        (relativeFinitePlaceIdele (K := K) (L := L) v z) =
      z := by
  rw [relativeFinitePlaceIdele,
    relativeIdeleOfLocalData_finiteComponent]
  exact relativeFinitePlaceValue_same (L := L) v z
omit [NumberField L] in
 

@[simp]
theorem relativeFinitePlaceIdele_finiteComponent_of_ne
    (v w : HeightOneSpectrum (𝓞 K))
    (z : (v.adicCompletion K ⊗[K] L)ˣ)
    (h : w ≠ v) :
    RelativeIdeleGroup.finiteComponent
        (K := K) (L := L) w
        (relativeFinitePlaceIdele (K := K) (L := L) v z) =
      1 := by
  rw [relativeFinitePlaceIdele,
    relativeIdeleOfLocalData_finiteComponent]
  exact relativeFinitePlaceValue_of_ne (L := L) v w z h
omit [NumberField L] in
 

@[simp]
theorem relativeFinitePlaceIdele_infiniteComponent
    (v : HeightOneSpectrum (𝓞 K))
    (w : InfinitePlace K)
    (z : (v.adicCompletion K ⊗[K] L)ˣ) :
    RelativeIdeleGroup.infiniteComponent
        (K := K) (L := L) w
        (relativeFinitePlaceIdele (K := K) (L := L) v z) =
      1 := by
  rw [relativeFinitePlaceIdele,
    relativeIdeleOfLocalData_infiniteComponent]
  rfl
end Relative
end RelativeIdeleGroup
end
end

/- ClassFieldTheory.GlobalClassFieldTheory.Reciprocity.OnePlaceNormKernel -/
section
open scoped NumberField TensorProduct
open NumberField IsDedekindDomain
open IdeleGroup RelativeIdeleGroup
noncomputable section
namespace GlobalClassFieldTheory
namespace Reciprocity
variable
    {K L : Type}
    [Field K] [NumberField K]
    [Field L] [NumberField L] [Algebra K L]
    [FiniteDimensional K L] [IsGalois K L]
omit [NumberField L] [IsGalois K L] in
 

theorem norm_relativeFinitePlaceIdele
    (v : HeightOneSpectrum (𝓞 K))
    (z : (v.adicCompletion K ⊗[K] L)ˣ) :
    RelativeIdeleGroup.norm K L
        (relativeFinitePlaceIdele (K := K) (L := L) v z) =
      finitePlaceIdele v
        (localTensorNorm (K := K) (L := L) v z) := by
  apply Prod.ext
  · apply ContinuousMulEquiv.piUnits.injective
    funext w
    change
      IdeleGroup.infiniteComponent w
          (RelativeIdeleGroup.norm K L
            (relativeFinitePlaceIdele
              (K := K) (L := L) v z)) =
        IdeleGroup.infiniteComponent w
          (finitePlaceIdele v
            (localTensorNorm (K := K) (L := L) v z))
    rw [RelativeIdeleGroup.infiniteComponent_norm,
      relativeFinitePlaceIdele_infiniteComponent,
      map_one, finitePlaceIdele_infiniteComponent]
  · apply RestrictedProduct.ext
    intro w
    change
      IdeleGroup.finiteComponent w
          (RelativeIdeleGroup.norm K L
            (relativeFinitePlaceIdele
              (K := K) (L := L) v z)) =
        IdeleGroup.finiteComponent w
          (finitePlaceIdele v
            (localTensorNorm (K := K) (L := L) v z))
    by_cases hw : w = v
    · subst w
      rw [RelativeIdeleGroup.finiteComponent_norm,
        relativeFinitePlaceIdele_finiteComponent_same,
        finitePlaceIdele_finiteComponent_same]
    · rw [RelativeIdeleGroup.finiteComponent_norm,
        relativeFinitePlaceIdele_finiteComponent_of_ne v w z hw,
        map_one,
        finitePlaceIdele_finiteComponent_of_ne v w
          (localTensorNorm (K := K) (L := L) v z) hw]
end Reciprocity
end GlobalClassFieldTheory
end
end

/- TunnellGlobalNormLattice -/
section
namespace TunnellGlobalNormLattice
open NumberField
open scoped NumberField TensorProduct IsMulCommutative
noncomputable section
variable (D : Type) [Field D] [NumberField D]
abbrev A := AdeleRing (𝓞 D) D
abbrev P (B : Type) [Field B] [Algebra D B] :=
  (Units.map (algebraMap D (A D)).toMonoidHom).range ⊔
    (Units.map (Algebra.norm (A D) (S := A D ⊗[D] B))).range
variable (M : Type) [Field M] [NumberField M] [Algebra D M] [FiniteDimensional D M] [IsAbelianGalois D M]
end
end TunnellGlobalNormLattice
end

/- TunnellSupportedTensorNorm -/
section
namespace TunnellSupportedTensorNorm
open NumberField IsDedekindDomain IdeleGroup RelativeIdeleGroup
open scoped NumberField TensorProduct Classical
variable {D N : Type} [Field D] [NumberField D] [Field N] [Algebra D N] [FiniteDimensional D N]
abbrev A (D:Type) [Field D] [NumberField D] := AdeleRing (𝓞 D) D
noncomputable def single (v : HeightOneSpectrum (𝓞 D)) : (v.adicCompletion D)ˣ →* (A D)ˣ :=
  (equivAdeleRingUnits (K:=D)).toMonoidHom.comp (finitePlaceIdele v)
theorem norm_single (v : HeightOneSpectrum (𝓞 D)) (z : (v.adicCompletion D ⊗[D] N)ˣ) :
    Units.map (Algebra.norm (A D) : (A D ⊗[D] N) →* A D) (relativeFinitePlaceIdele (K:=D) (L:=N) v z) =
      single v (Units.map (Algebra.norm (v.adicCompletion D) : (v.adicCompletion D ⊗[D] N) →* v.adicCompletion D) z) := by
  apply (equivAdeleRingUnits (K:=D)).symm.injective
  rw [show ∀ x, (equivAdeleRingUnits (K:=D)).symm (single v x) = finitePlaceIdele v x from
    fun x => (equivAdeleRingUnits (K:=D)).symm_apply_apply _]
  exact GlobalClassFieldTheory.Reciprocity.norm_relativeFinitePlaceIdele v z
theorem unique_single (v : HeightOneSpectrum (𝓞 D)) (x : (v.adicCompletion D)ˣ) (a : (A D)ˣ)
    (ha : a.val.1=1) (hv : a.val.2 v=x.val)
    (hs : ∀ s : HeightOneSpectrum (𝓞 D), s≠v → a.val.2 s=1) : a=single v x := by
  apply Units.ext
  apply Prod.ext
  · exact ha
  · apply RestrictedProduct.ext
    intro s
    by_cases h:s=v
    · subst s
      exact hv.trans (congrArg Units.val (finitePlaceIdele_finiteComponent_same v x)).symm
    · exact (hs s h).trans (congrArg Units.val (finitePlaceIdele_finiteComponent_of_ne v s x h)).symm
end TunnellSupportedTensorNorm
end

/- «cyclic-injection».CompactBoth -/
section
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
end
end TunnellInjectionValuation
namespace TunnellTowerNormDetect
open scoped Classical
noncomputable section
theorem comap (A B:Type) [Group A] [Group B] (f:B→*A) (H:Subgroup B) (K:Subgroup A)
    (inc:H≤K.comap f) (sur:K≤f.range) (h0:H.index≠0) (e0:f.range.index≠0)
    (degree:K.index=H.index*f.range.index): K.comap f=H:=by
  have hidx:(K.comap f).index=H.index:=by
    rw [Subgroup.index_comap]
    exact Nat.eq_of_mul_eq_mul_right (Nat.pos_of_ne_zero e0) ((Subgroup.relIndex_mul_index sur).trans degree)
  have hrel:H.relIndex (K.comap f)=1:=by
    apply Nat.eq_of_mul_eq_mul_right (Nat.pos_of_ne_zero h0)
    rw [one_mul,←hidx,Subgroup.relIndex_mul_index inc,hidx]
  exact le_antisymm (Subgroup.relIndex_eq_one.mp hrel) inc
theorem crossed (A B:Type) [Group A] [Group B] (f:B→*A) (H:Subgroup B) (K N:Subgroup A)
    (inc:H≤K.comap f) (inter:K=N ⊓ f.range) (h0:H.index≠0) (e0:f.range.index≠0)
    (degree:K.index=H.index*f.range.index) (y:B) :f y∈N ↔ y∈H :=by
  have eq:=comap A B f H K inc (inter ▸ inf_le_right) h0 e0 degree
  rw [←eq,Subgroup.mem_comap,inter,Subgroup.mem_inf]
  exact ⟨fun h=>⟨h,⟨y,rfl⟩⟩,And.left⟩
end
end TunnellTowerNormDetect
namespace TunnellNativeClassLattice
open NumberField IdeleGroup
open scoped TensorProduct NumberField
noncomputable section
abbrev A (D : Type) [Field D] [NumberField D] := AdeleRing (𝓞 D) D
variable (D : Type) [Field D] [NumberField D]
def toClass : (A D)ˣ →* IdeleClassGroup D :=
  (QuotientGroup.mk' (IdeleGroup.principalSubgroup D)).comp
    (IdeleGroup.equivAdeleRingUnits (K:=D)).symm.toMonoidHom
theorem onto : Function.Surjective (toClass D) :=
  (QuotientGroup.mk'_surjective _).comp (IdeleGroup.equivAdeleRingUnits (K:=D)).symm.surjective
variable (N : Type) [Field N] [NumberField N] [Algebra D N] [FiniteDimensional D N]
theorem pull : (ideleClassNorm D N).range.comap (toClass D) = TunnellGlobalNormLattice.P D N := by
  let j := IdeleGroup.equivAdeleRingUnits (K:=D)
  let b := relativeIdeleBaseChangeMulEquiv (K:=D) (L:=N)
  let det := Units.map (Algebra.norm (A D) (S:=A D ⊗[D] N))
  let pr := Units.map (algebraMap D (A D)).toMonoidHom
  let mk := QuotientGroup.mk' (IdeleGroup.principalSubgroup D)
  have hdet (z : (A D ⊗[D] N)ˣ) : j.symm (det z) = IdeleGroup.norm D N (b z) := by
    rw [IdeleGroup.norm_relativeIdeleBaseChangeMulEquiv]
    rfl
  have hpr (x : Dˣ) : j.symm (pr x) = IdeleGroup.principalIdele D x := rfl
  apply le_antisymm
  · rintro x ⟨c,hc⟩
    obtain ⟨y,rfl⟩ := QuotientGroup.mk'_surjective (IdeleGroup.principalSubgroup N) c
    obtain ⟨z,rfl⟩ := b.surjective y
    have eq : mk (j.symm x) = mk (j.symm (det z)) := by rw [hdet]; exact hc.symm
    obtain ⟨a,ha⟩ := QuotientGroup.eq_iff_div_mem.mp eq
    have h : pr a = x / det z := by
      apply j.symm.injective
      rw [map_div,hpr]
      exact ha
    exact Subgroup.mem_sup.mpr ⟨_,⟨a,rfl⟩,_,⟨z,rfl⟩,by rw [h,div_mul_cancel]⟩
  · apply sup_le
    · rintro _ ⟨a,rfl⟩
      have h : toClass D (pr a) = 1 := (QuotientGroup.eq_one_iff _).mpr ⟨a,rfl⟩
      change toClass D (pr a) ∈ (ideleClassNorm D N).range
      rw [h]
      exact (ideleClassNorm D N).range.one_mem
    · rintro _ ⟨z,rfl⟩
      exact ⟨QuotientGroup.mk' _ (b z), congrArg mk (hdet z).symm⟩
theorem index : (ideleClassNorm D N).range.index = (TunnellGlobalNormLattice.P D N).index := by
  rw [← pull, Subgroup.index_comap_of_surjective _ (onto D)]
theorem inf (E F : IntermediateField D N) (h : TunnellGlobalNormLattice.P D N =
    TunnellGlobalNormLattice.P D E ⊓ TunnellGlobalNormLattice.P D F) :
    (ideleClassNorm D N).range = (ideleClassNorm D E).range ⊓ (ideleClassNorm D F).range := by
  ext c
  obtain ⟨x,rfl⟩ := onto D c
  change x ∈ (ideleClassNorm D N).range.comap (toClass D) ↔ x ∈
    (ideleClassNorm D E).range.comap (toClass D) ⊓ (ideleClassNorm D F).range.comap (toClass D)
  rw [pull, pull, pull, h]
end
end TunnellNativeClassLattice
namespace TunnellCompactNormRanges
open NumberField IdeleGroup TunnellNativeClassLattice
open scoped NumberField TensorProduct
noncomputable section
variable (K E M : Type) [Field K] [NumberField K] [Field E] [NumberField E] [Field M] [NumberField M]
  [Algebra K E] [Algebra E M] [Algebra K M] [IsScalarTower K E M]
theorem norm_class (u : (A K ⊗[K] E)ˣ) :
    ideleClassNorm K E (toClass E (Units.mapEquiv (relativeAdeleBaseChangeRingEquiv (K:=K) (L:=E)).toMulEquiv u)) =
    toClass K (Units.map (Algebra.norm (A K)) u) := by
  rw [←relativeIdeleBaseChangeMulEquiv_eq_ringUnits]
  let z := relativeIdeleBaseChangeMulEquiv (K:=K) (L:=E) u
  change QuotientGroup.mk' _ (IdeleGroup.norm K E ((equivAdeleRingUnits (K:=E)).symm (equivAdeleRingUnits z))) = _
  rw [MulEquiv.symm_apply_apply]
  change QuotientGroup.mk' _ (IdeleGroup.norm K E (relativeIdeleBaseChangeMulEquiv u)) = _
  rw [IdeleGroup.norm_relativeIdeleBaseChangeMulEquiv]
  rfl
theorem range_det : (ideleClassNorm K E).range =
    ((toClass K).comp (Units.map (Algebra.norm (A K) (S:=A K ⊗[K] E)))).range := by
  ext c
  constructor
  · rintro ⟨z,rfl⟩
    obtain ⟨y,rfl⟩ := onto E z
    obtain ⟨u,rfl⟩ := (Units.mapEquiv (relativeAdeleBaseChangeRingEquiv (K:=K) (L:=E)).toMulEquiv).surjective y
    exact ⟨u,(norm_class K E u).symm⟩
  · rintro ⟨u,rfl⟩
    exact ⟨_,norm_class K E u⟩
theorem composite : (ideleClassNorm E M).range.map (ideleClassNorm K E) = (ideleClassNorm K M).range := by
  letI : Algebra E (RelativeAdeleRing K E) := Algebra.TensorProduct.rightAlgebra
  let e₁ := relativeAdeleBaseChangeRingEquiv (K:=K) (L:=E)
  let e₂ := towerActualRelativeAdeleRingEquiv K E M
  let e₃ := towerRelativeAdeleAlgEquiv K E M
  let extend := Units.mapEquiv e₂.toMulEquiv
  let flatten := Units.mapEquiv e₃.toMulEquiv
  have hnorm (u : (TowerRelativeAdeleRing K E M)ˣ) :
      ideleClassNorm K E (toClass E (Units.map (Algebra.norm (A E)) (extend u))) =
      toClass K (Units.map (Algebra.norm (A K)) (flatten u)) := by
    have he : (algebraMap (A E) (RelativeAdeleRing E M)).comp e₁.toRingHom =
        e₂.toRingHom.comp (algebraMap (RelativeAdeleRing K E) (TowerRelativeAdeleRing K E M)) := by
      apply DFunLike.ext _ _
      intro b
      change e₁ b ⊗ₜ[E] (1:M) = e₂ (b ⊗ₜ[E] (1:M))
      rfl
    have transform : Units.map (Algebra.norm (A E)) (extend u) =
        Units.mapEquiv e₁.toMulEquiv (Units.map (Algebra.norm (RelativeAdeleRing K E)) u) := by
      apply Units.ext
      exact e₁.symm_apply_eq.mp (Algebra.norm_eq_of_equiv_equiv e₁ e₂ he u.val).symm
    rw [transform,norm_class K E]
    apply congrArg (toClass K)
    apply Units.ext
    change Algebra.norm (A K) (Algebra.norm (RelativeAdeleRing K E) u.val) = Algebra.norm (A K) (e₃ u.val)
    rw [Algebra.norm_norm]
    exact (Algebra.norm_eq_of_algEquiv e₃ u.val).symm
  rw [range_det E M,range_det K M]
  ext c
  constructor
  · rintro ⟨_,⟨z,rfl⟩,rfl⟩
    obtain ⟨u,rfl⟩ := extend.surjective z
    exact ⟨flatten u,(hnorm u).symm⟩
  · rintro ⟨z,rfl⟩
    obtain ⟨u,rfl⟩ := flatten.surjective z
    exact ⟨_,⟨extend u,rfl⟩,hnorm u⟩
end
end TunnellCompactNormRanges
namespace TunnellCompactOnePlace
open NumberField IsDedekindDomain IdeleGroup RelativeIdeleGroup
open scoped Classical TensorProduct NumberField BigOperators
noncomputable section
variable {D N : Type} [Field D] [NumberField D] [Field N] [NumberField N] [Algebra D N]
abbrev Fibre (v : HeightOneSpectrum (𝓞 D)) := {w : HeightOneSpectrum (𝓞 N) // finitePlaceBelow (K:=D) w = v}
theorem finite_beta (v : HeightOneSpectrum (𝓞 D)) (W : Fibre (N:=N) v) (z : RelativeIdeleGroup D N) :
    ((relativeAdeleBaseChangeRingEquiv (K:=D) (L:=N)) z.val).2 W.val =
    (finitePlaceTensorRingEquivAboveAdic (L:=N) v (RelativeIdeleGroup.finiteComponent (K:=D) (L:=N) v z).val) W := by
  obtain ⟨w,rfl⟩ := W
  rfl
theorem formula (v : HeightOneSpectrum (𝓞 D)) (W : Fibre (N:=N) v) (y : (W.val.adicCompletion N)ˣ) :
    letI : Algebra (v.adicCompletion D) (W.val.adicCompletion N) := (finitePlaceAdicCompletionMap D N v W).toAlgebra
    ideleClassNorm D N (finitePlaceIdeleClass W.val y) =
      finitePlaceIdeleClass v (LocalFieldTheory.normUnits (v.adicCompletion D) (W.val.adicCompletion N) y) := by
  classical
  let K := v.adicCompletion D
  let T := Fibre (N:=N) v
  let I : T → v.asIdeal.primesOver (𝓞 N) := fun w =>
    ⟨w.val.asIdeal,w.val.isPrime,⟨congrArg HeightOneSpectrum.asIdeal w.property.symm⟩⟩
  haveI : Finite T := Finite.of_injective I (fun a b h => Subtype.ext (HeightOneSpectrum.ext (congrArg Subtype.val h)))
  letI : Fintype T := Fintype.ofFinite T
  let Y (w:T) := w.val.adicCompletion N
  letI (w:T) : Algebra K (Y w) := (finitePlaceAdicCompletionMap D N v w).toAlgebra
  letI (w:T) : Module.Finite K (Y w) := finitePlaceAdicCompletionMap_moduleFinite D N v w
  let e : K⊗[D]N ≃ₐ[K] ((w:T)→Y w) := AlgEquiv.ofRingEquiv (f:=finitePlaceTensorRingEquivAboveAdic (L:=N) v) (by
    intro b
    funext w
    change finitePlaceTensorRingEquivAboveAdic (L:=N) v (b ⊗ₜ[D] (1:N)) w = finitePlaceAdicCompletionMap D N v w b
    rw [finitePlaceTensorRingEquivAboveAdic_tmul,map_one,mul_one])
  let unitAt := Pi.mulSingle (M:=fun w:T=>(Y w)ˣ) W y
  let u := (MulEquiv.piUnits (M:=Y)).symm unitAt
  let z := (Units.mapEquiv e.symm.toMulEquiv) u
  let a := relativeFinitePlaceIdele (K:=D) (L:=N) v z
  let b := Units.mapEquiv (relativeAdeleBaseChangeRingEquiv (K:=D) (L:=N)).toMulEquiv a
  have hb : b = TunnellSupportedTensorNorm.single W.val y := by
    apply TunnellSupportedTensorNorm.unique_single
    · funext w
      let r := infinitePlaceBelow (K:=D) w
      change infinitePlaceTensorRingEquivAbove (L:=N) r
        (RelativeIdeleGroup.infiniteComponent (K:=D) (L:=N) r a).val ⟨w,rfl⟩ = 1
      rw [relativeFinitePlaceIdele_infiniteComponent]
      simp
      exact (InfinitePlace.Completion.equiv w).symm.map_one
    · change ((relativeAdeleBaseChangeRingEquiv (K:=D) (L:=N)) a.val).2 W.val = y.val
      rw [finite_beta v W a,relativeFinitePlaceIdele_finiteComponent_same]
      change e (e.symm u.val) W = y.val
      rw [e.apply_symm_apply]
      exact congrArg Units.val (Pi.mulSingle_eq_same (M:=fun w:T => (Y w)ˣ) W y)
    · intro w hw
      let r:=finitePlaceBelow (K:=D) w
      by_cases h : r=v
      · let W' : T := ⟨w,h⟩
        change ((relativeAdeleBaseChangeRingEquiv (K:=D) (L:=N)) a.val).2 W'.val = 1
        rw [finite_beta v W' a,relativeFinitePlaceIdele_finiteComponent_same]
        change e (e.symm u.val) W' = 1
        rw [e.apply_symm_apply]
        exact congrArg Units.val (Pi.mulSingle_eq_of_ne (M:=fun w:T => (Y w)ˣ) (fun h' : W'=W => hw (congrArg Subtype.val h')) y)
      · let W' : Fibre (N:=N) r := ⟨w,rfl⟩
        change ((relativeAdeleBaseChangeRingEquiv (K:=D) (L:=N)) a.val).2 W'.val = 1
        rw [finite_beta r W' a,relativeFinitePlaceIdele_finiteComponent_of_ne _ _ _ h]
        simp
  have hn : Units.map (Algebra.norm K) z = LocalFieldTheory.normUnits K (Y W) y := by
    apply Units.ext
    change Algebra.norm K (e.symm u.val) = Algebra.norm K y.val
    rw [Algebra.norm_eq_of_algEquiv,ValuationTheory.Completion.algebra_norm_pi_apply Y]
    rw [Finset.prod_eq_single W]
    · exact congrArg (Algebra.norm K) (congrArg Units.val (Pi.mulSingle_eq_same (M:=fun w:T => (Y w)ˣ) W y))
    · intro w _ h
      have he : u.val w = 1 := congrArg Units.val (Pi.mulSingle_eq_of_ne (M:=fun w:T => (Y w)ˣ) h y)
      rw [he,map_one]
    · simp
  change ideleClassNorm D N (TunnellNativeClassLattice.toClass N (TunnellSupportedTensorNorm.single W.val y)) =
    TunnellNativeClassLattice.toClass D (TunnellSupportedTensorNorm.single v (LocalFieldTheory.normUnits K (Y W) y))
  rw [←hb,TunnellCompactNormRanges.norm_class D N a,TunnellSupportedTensorNorm.norm_single,hn]
end
end TunnellCompactOnePlace
namespace TunnellNormRanges
open NumberField IdeleGroup
noncomputable section
variable (K E M : Type) [Field K] [NumberField K] [Field E] [NumberField E] [Field M] [NumberField M]
  [Algebra K E] [Algebra E M] [Algebra K M] [IsScalarTower K E M]
theorem map_into : (ideleClassNorm E M).range ≤ (ideleClassNorm K M).range.comap (ideleClassNorm K E) :=
  Subgroup.map_le_iff_le_comap.mp (TunnellCompactNormRanges.composite K E M).le
theorem down : (ideleClassNorm K M).range ≤ (ideleClassNorm K E).range := by
  rw [← TunnellCompactNormRanges.composite K E M]
  exact Subgroup.map_le_range _ _
end
end TunnellNormRanges
namespace TunnellCrossedOnePlace
open NumberField IsDedekindDomain IdeleGroup FiniteIdeleGroup AlgebraicNumberTheory.Valuations
open scoped NumberField Classical
noncomputable section
variable {D E C M : Type} [Field D] [NumberField D] [Field E] [NumberField E]
  [Field M] [NumberField M] [Field C] [NumberField C]
theorem supported_norm [Algebra D E] (t : HeightOneSpectrum (𝓞 E)) :
    let v := finitePlaceBelow (K:=D) t
    ∃ x : (v.adicCompletion D)ˣ, ideleClassNorm D E (finitePlaceIdeleClass t (chosenLocalOrderSection t 1)) =
      finitePlaceIdeleClass v x := by
  dsimp only
  let v := finitePlaceBelow (K:=D) t
  let W : {w : HeightOneSpectrum (𝓞 E) // finitePlaceBelow (K:=D) w = v} := ⟨t,rfl⟩
  let y := chosenLocalOrderSection t 1
  letI : Algebra (v.adicCompletion D) (t.adicCompletion E) :=
    (finitePlaceAdicCompletionMap D E v W).toAlgebra
  exact ⟨LocalFieldTheory.normUnits (v.adicCompletion D) (t.adicCompletion E) y,
    TunnellCompactOnePlace.formula v W y⟩
theorem order_under_norm (val : TunnellInjectionValuation.Law) (t : HeightOneSpectrum (𝓞 E)) :
    let v := finitePlaceBelow (K:=ℚ) t
    ∃ x : (v.adicCompletion ℚ)ˣ, (localOrder v x).toAdd = (t.asIdeal.inertiaDeg (𝓞 ℚ) : ℤ) ∧
      ideleClassNorm ℚ E (finitePlaceIdeleClass t (chosenLocalOrderSection t 1)) =
      finitePlaceIdeleClass v x := by
  dsimp only
  let v := finitePlaceBelow (K:=ℚ) t
  let W : {w : HeightOneSpectrum (𝓞 E) // finitePlaceBelow (K:=ℚ) w = v} := ⟨t,rfl⟩
  let y := chosenLocalOrderSection t 1
  letI : Algebra (v.adicCompletion ℚ) (t.adicCompletion E) :=
    (finitePlaceAdicCompletionMap ℚ E v W).toAlgebra
  exact ⟨LocalFieldTheory.normUnits (v.adicCompletion ℚ) (t.adicCompletion E) y,
    by
      haveI : t.asIdeal.LiesOver v.asIdeal := by dsimp [v]; infer_instance
      have h := val E t v inferInstance (finitePlaceAdicCompletionMap ℚ E v W)
        (finitePlaceAdicCompletionMap_continuous ℚ E v W) y
      have one := localOrder_chosenLocalOrderSection t 1
      change -WithZero.log (Valued.v y.val) = 1 at one
      change -WithZero.log (Valued.v (Algebra.norm (v.adicCompletion ℚ) y.val)) = _
      rw [h]
      have e : WithZero.log (Valued.v y.val) = -1 := by omega
      rw [e,mul_neg_one,neg_neg],
    TunnellCompactOnePlace.formula v W y⟩
theorem rational_nontrivial (val : TunnellInjectionValuation.Law) [Algebra E M] [Algebra C M] (t : HeightOneSpectrum (𝓞 E))
    (m : ℕ) (obstruct : ¬ m ∣ t.asIdeal.absNorm - 1)
    (hcprime : (finitePlaceBelow (K:=ℚ) t).asIdeal.absNorm.Coprime m)
    (rational : ∀ (v : HeightOneSpectrum (𝓞 ℚ)) (n : ℕ) (x : (v.adicCompletion ℚ)ˣ),
      v.asIdeal.absNorm.Coprime m → (localOrder v x).toAdd = (n:ℤ) → finitePlaceIdeleClass v x ∈ (ideleClassNorm ℚ C).range →
      m ∣ v.asIdeal.absNorm ^ n - 1) :
    finitePlaceIdeleClass t (chosenLocalOrderSection t 1) ∉ (ideleClassNorm E M).range := by
  let v := finitePlaceBelow (K:=ℚ) t
  haveI : t.asIdeal.LiesOver v.asIdeal := by dsimp [v]; infer_instance
  obtain ⟨x,hx,hc⟩ := order_under_norm val t
  rintro ⟨z,hz⟩
  have hz' : finitePlaceIdeleClass v x ∈ (ideleClassNorm ℚ C).range := by
    apply TunnellNormRanges.down ℚ C M
    rw [← hc, ← hz]
    exact TunnellNormRanges.map_into ℚ E M ⟨z, rfl⟩
  have hr := rational v _ x hcprime hx hz'
  rw [Ideal.absNorm_pow_inertiaDeg v.asIdeal t.asIdeal] at hr
  exact obstruct hr
end
end TunnellCrossedOnePlace
namespace TunnellCrossedWitness
open NumberField IsDedekindDomain IdeleGroup FiniteIdeleGroup
open scoped NumberField Classical
noncomputable section
variable {D M : Type} [Field D] [NumberField D] [Field M] [NumberField M]
  [Algebra D M] [FiniteDimensional D M] [IsAbelianGalois D M]
theorem crossing (E N : IntermediateField D M)
    (inter : TunnellGlobalNormLattice.P D M = TunnellGlobalNormLattice.P D E ⊓ TunnellGlobalNormLattice.P D N)
    (indDM : (TunnellGlobalNormLattice.P D M).index = Module.finrank D M)
    (indDE : (TunnellGlobalNormLattice.P D E).index = Module.finrank D E)
    (indEM : (TunnellGlobalNormLattice.P E M).index = Module.finrank E M)
    (y : IdeleClassGroup E) :
    ideleClassNorm D E y ∈ (ideleClassNorm D N).range ↔ y ∈ (ideleClassNorm E M).range := by
  have h : (ideleClassNorm E M).range ≤ (ideleClassNorm D M).range.comap (ideleClassNorm D E) := TunnellNormRanges.map_into D E M
  apply TunnellTowerNormDetect.crossed _ _ _ _ _ _ h
  · exact (TunnellNativeClassLattice.inf D M E N inter).trans (inf_comm _ _)
  · rw [TunnellNativeClassLattice.index, indEM]; exact Module.finrank_pos.ne'
  · rw [TunnellNativeClassLattice.index, indDE]; exact Module.finrank_pos.ne'
  · rw [TunnellNativeClassLattice.index, TunnellNativeClassLattice.index,
      TunnellNativeClassLattice.index, indDM, indDE, indEM, Nat.mul_comm]
    exact (Module.finrank_mul_finrank D E M).symm
theorem witness (val : TunnellInjectionValuation.Law) (E N : IntermediateField D M) (C : IntermediateField ℚ M)
    (m : ℕ) (t : HeightOneSpectrum (𝓞 E))
    (inter : TunnellGlobalNormLattice.P D M = TunnellGlobalNormLattice.P D E ⊓ TunnellGlobalNormLattice.P D N)
    (indDM : (TunnellGlobalNormLattice.P D M).index = Module.finrank D M)
    (indDE : (TunnellGlobalNormLattice.P D E).index = Module.finrank D E)
    (indEM : (TunnellGlobalNormLattice.P E M).index = Module.finrank E M)
    (obstruct : ¬ m ∣ t.asIdeal.absNorm - 1)
    (hcprime : (finitePlaceBelow (K:=ℚ) t).asIdeal.absNorm.Coprime m)
    (rat : ∀ (v : HeightOneSpectrum (𝓞 ℚ)) (n : ℕ) (x : (v.adicCompletion ℚ)ˣ),
      v.asIdeal.absNorm.Coprime m → (localOrder v x).toAdd = (n:ℤ) → finitePlaceIdeleClass v x ∈ (ideleClassNorm ℚ C).range →
      m ∣ v.asIdeal.absNorm ^ n - 1) :
    let v := finitePlaceBelow (K:=D) t
    ∃ x : (v.adicCompletion D)ˣ, finitePlaceIdeleClass v x ∉ (ideleClassNorm D N).range := by
  obtain ⟨x,hx⟩ := TunnellCrossedOnePlace.supported_norm (D:=D) t
  refine ⟨x, ?_⟩
  rw [←hx, crossing E N inter indDM indDE indEM]
  exact TunnellCrossedOnePlace.rational_nontrivial (M:=M) val t m obstruct hcprime rat
end
end TunnellCrossedWitness
namespace TunnellCyclotomicEnvelope
open NumberField IsDedekindDomain IntermediateField AlgebraicNumberTheory
open scoped NumberField Classical
noncomputable section
variable (D N : Type) [Field D] [NumberField D] [Field N] [NumberField N]
  [Algebra D N] [FiniteDimensional D N] [IsAbelianGalois D N]
theorem envelope (m : ℕ) [NeZero m] :
  ∃ (M : Type) (_ : Field M) (_ : NumberField M) (_ : Algebra D M) (_ : FiniteDimensional D M)
      (_ : IsAbelianGalois D M) (j : N →ₐ[D] M) (ζ : 𝓞 M),
    IsPrimitiveRoot ζ m ∧ j.fieldRange ⊔ adjoin D {(ζ:M)} = ⊤ := by
  let C := CyclotomicField m D
  letI : IsAbelianGalois D C := IsCyclotomicExtension.isAbelianGalois {m} D C
  let M := finiteAbelianCompositumField D N C
  letI : NumberField M := NumberField.of_module_finite D M
  let j := finiteAbelianCompositumEmbeddingLeft D N C
  let k := finiteAbelianCompositumEmbeddingRight D N C
  let z := IsCyclotomicExtension.zeta m D C
  have hz : IsPrimitiveRoot z m := IsCyclotomicExtension.zeta_spec m D C
  have hzM := hz.map_of_injective k.injective
  refine ⟨M, inferInstance, inferInstance, inferInstance, inferInstance, inferInstance, j,
    hzM.toInteger, hzM.toInteger_isPrimitiveRoot, ?_⟩
  have hgen : adjoin D {z} = ⊤ :=
    IntermediateField.adjoin_eq_top_of_algebra D _ (IsCyclotomicExtension.adjoin_primitive_root_eq_top hz)
  have im : k.fieldRange = adjoin D {k z} := by
    rw [AlgHom.fieldRange_eq_map, ←hgen, adjoin_map]
    simp
  change j.fieldRange ⊔ adjoin D {k z} = ⊤
  rw [←im]
  exact finiteAbelianCompositum_embeddingRanges_sup_eq_top D N C
end
end TunnellCyclotomicEnvelope
namespace TunnellFrobeniusAuxiliary
open scoped Classical
noncomputable section
variable (k F : Type*) [Field k] [Fintype k] [Field F] [Finite F] [Algebra k F]
theorem pow_fix (p : ℕ) (u : F) (hu : u ^ (Fintype.card k ^ p) = u)
    (σ : Gal(F/k)) : (σ ^ p) u = u := by
  obtain ⟨n, rfl⟩ := (FiniteField.bijective_frobeniusAlgEquivOfAlgebraic_pow k F).surjective σ
  let φ := FiniteField.frobeniusAlgEquivOfAlgebraic k F
  have hf : (φ ^ p) u = u := by
    rw [AlgEquiv.coe_pow, FiniteField.coe_frobeniusAlgEquivOfAlgebraic_iterate]
    exact hu
  change ((φ ^ (n : ℕ)) ^ p) u = u
  rw [← pow_mul, Nat.mul_comm, pow_mul, AlgEquiv.coe_pow]
  exact Function.iterate_fixed hf n.val
theorem moves {m : ℕ} (u : Fˣ) (horder : orderOf u = m)
    (hm : ¬ m ∣ Fintype.card k - 1) :
    ∃ σ : Gal(F/k), σ (u : F) ≠ u := by
  refine ⟨FiniteField.frobeniusAlgEquivOfAlgebraic k F, ?_⟩
  rw [FiniteField.coe_frobeniusAlgEquivOfAlgebraic]
  intro h
  apply hm
  rw [← horder]
  apply orderOf_dvd_of_pow_eq_one
  have h' : u ^ Fintype.card k = u := Units.ext h
  obtain ⟨q, hq⟩ := Nat.exists_eq_succ_of_ne_zero (Fintype.card_ne_zero (α:=k))
  rw [hq, pow_succ] at h'
  rw [hq, Nat.succ_sub_one]
  exact mul_right_cancel (h'.trans (one_mul u).symm)
theorem no_moves {m : ℕ} (u : Fˣ) (hu : u ^ m = 1)
    (hm : m ∣ Fintype.card k - 1) (σ : Gal(F/k)) : σ (u : F) = u := by
  have hfix : u ^ (Fintype.card k - 1) = 1 := by
    obtain ⟨j,hj⟩ := hm
    rw [hj,pow_mul,hu,one_pow]
  have hj : u ^ Fintype.card k = u := by
    obtain ⟨q, hq⟩ := Nat.exists_eq_succ_of_ne_zero (Fintype.card_ne_zero (α:=k))
    rw [hq, Nat.succ_sub_one] at hfix
    rw [hq, pow_succ, hfix, one_mul]
  simpa using pow_fix k F 1 (u : F) (by simpa using congrArg Units.val hj) σ
end
end TunnellFrobeniusAuxiliary
namespace TunnellDiagonalField
open scoped Classical
open IntermediateField
noncomputable section
variable {D M : Type*} [Field D] [Field M] [Algebra D M] [FiniteDimensional D M] [IsGalois D M]
theorem prime_join {p : ℕ} (hp : p.Prime) (g : Gal(M/D)) (hg : orderOf g = p)
    (F : IntermediateField D M) (hf : g ∉ F.fixingSubgroup) :
    fixedField (Subgroup.zpowers g) ⊔ F = ⊤ := by
  let H := Subgroup.zpowers g
  have hc : Nat.card H = p := (Nat.card_zpowers g).trans hg
  have div : Nat.card (H ⊓ F.fixingSubgroup : Subgroup Gal(M/D)) ∣ p :=
    hc ▸ Subgroup.card_dvd_of_le (show H ⊓ F.fixingSubgroup ≤ H from inf_le_left)
  have eq : H ⊓ F.fixingSubgroup = ⊥ := by
    apply Subgroup.eq_bot_of_card_eq
    apply (hp.eq_one_or_self_of_dvd _ div).resolve_right
    intro h
    have h' : H ⊓ F.fixingSubgroup = H :=
      Subgroup.eq_of_le_of_card_ge inf_le_left (le_of_eq (hc.trans h.symm))
    exact hf ((show H ≤ F.fixingSubgroup from h' ▸ inf_le_right) (Subgroup.mem_zpowers g))
  rw [← IsGalois.fixedField_fixingSubgroup (fixedField H ⊔ F), fixingSubgroup_sup,
    fixingSubgroup_fixedField, eq, fixedField_bot]
theorem diagonal {p : ℕ} (hp : p.Prime) (S : Subgroup Gal(M/D))
    (N C : IntermediateField D M) (generate : N ⊔ C = ⊤)
    (hN : ¬ S ≤ N.fixingSubgroup) (hC : ¬ S ≤ C.fixingSubgroup)
    (pN : ∀ g ∈ S, g ^ p ∈ N.fixingSubgroup) (pC : ∀ g ∈ S, g ^ p ∈ C.fixingSubgroup) :
    ∃ g ∈ S, g ∉ N.fixingSubgroup ∧ g ∉ C.fixingSubgroup ∧ orderOf g = p ∧
      let E := fixedField (Subgroup.zpowers g)
      Module.finrank E M = p ∧ E ⊔ N = ⊤ ∧ E ⊔ C = ⊤ := by
  have non : ¬ (S : Set Gal(M/D)) ⊆ (N.fixingSubgroup : Set Gal(M/D)) ∪ C.fixingSubgroup := by
    simpa [SubgroupClass.subset_union, hN, hC]
  obtain ⟨g, hg, h⟩ := Set.not_subset.mp non
  have hn : g ∉ N.fixingSubgroup := fun hx => h (Or.inl hx)
  have hc : g ∉ C.fixingSubgroup := fun hx => h (Or.inr hx)
  have hpow : g ^ p = 1 := by
    rw [← Subgroup.mem_bot, ← fixingSubgroup_top, ← generate, fixingSubgroup_sup]
    exact ⟨pN _ hg, pC _ hg⟩
  letI : Fact p.Prime := ⟨hp⟩
  have ho := orderOf_eq_prime hpow (fun he => hn (he ▸ N.fixingSubgroup.one_mem))
  exact ⟨g, hg, hn, hc, ho, (finrank_fixedField_eq_card _).trans ((Nat.card_zpowers g).trans ho),
    prime_join hp g ho N hn, prime_join hp g ho C hc⟩
end
end TunnellDiagonalField
namespace TunnellDecompositionRoot
open NumberField IsDedekindDomain
open scoped NumberField Pointwise Classical
noncomputable section
variable {D M : Type} [Field D] [NumberField D] [Field M] [NumberField M] [Algebra D M]
  [FiniteDimensional D M] [IsGalois D M] (v : HeightOneSpectrum (𝓞 D))
  (w : HeightOneSpectrum (𝓞 M)) [w.asIdeal.LiesOver v.asIdeal]
theorem root_inj {m : ℕ} [NeZero m] {a b : 𝓞 M} (ha : a ^ m = 1) (hb : b ^ m = 1)
    (hcop : w.asIdeal.absNorm.Coprime m)
    (he : Ideal.Quotient.mk w.asIdeal a = Ideal.Quotient.mk w.asIdeal b) : a = b := by
  let x := rootsOfUnity.mkOfPowEq a ha
  let y := rootsOfUnity.mkOfPowEq b hb
  have eq : x = y := Ideal.rootsOfUnityMapQuot_injective m
    (by simpa [Ideal.absNorm_eq_one_iff] using (inferInstance : w.asIdeal.IsPrime).ne_top) hcop (Units.ext he)
  exact congrArg (fun z : rootsOfUnity m (𝓞 M) => ((z.val : (𝓞 M)ˣ) : 𝓞 M)) eq
theorem at_prime {m p : ℕ} [NeZero m] (ζ : 𝓞 M) (hz : IsPrimitiveRoot ζ m)
    (hcop : w.asIdeal.absNorm.Coprime m) (hm : ¬ m ∣ v.asIdeal.absNorm - 1)
    (hpow : v.asIdeal.absNorm ^ p = m + 1) :
    (∃ g : MulAction.stabilizer Gal(M/D) w.asIdeal, g.val • ζ ≠ ζ) ∧
      ∀ g : MulAction.stabilizer Gal(M/D) w.asIdeal, (g.val ^ p) • ζ = ζ := by
  classical
  let k := (𝓞 D) ⧸ v.asIdeal
  letI : Field k := Ideal.Quotient.field v.asIdeal
  let F := (𝓞 M) ⧸ w.asIdeal
  letI : Field F := Ideal.Quotient.field w.asIdeal
  letI : Finite k := v.asIdeal.finiteQuotientOfFreeOfNeBot v.ne_bot
  letI : Finite F := w.asIdeal.finiteQuotientOfFreeOfNeBot w.ne_bot
  letI : Fintype k := Fintype.ofFinite k
  let ρ := Ideal.Quotient.stabilizerHom w.asIdeal v.asIdeal Gal(M/D)
  let u := Ideal.Quotient.mk w.asIdeal ζ
  have hk : Fintype.card k = v.asIdeal.absNorm := by rw [← Nat.card_eq_fintype_card]; rfl
  have hu : IsPrimitiveRoot u m := hz.idealQuotient_mk
    (by simpa [Ideal.absNorm_eq_one_iff] using (inferInstance : w.asIdeal.IsPrime).ne_top) hcop
  let a := rootsOfUnity.mkOfPowEq u hu.pow_eq_one
  have ha : orderOf a.val = m := (IsPrimitiveRoot.coe_units_iff.mp hu).eq_orderOf.symm
  obtain ⟨σ, hσ⟩ := TunnellFrobeniusAuxiliary.moves k F a.val ha (hk ▸ hm)
  obtain ⟨g, rfl⟩ := Ideal.Quotient.stabilizerHom_surjective Gal(M/D) v.asIdeal w.asIdeal σ
  refine ⟨⟨g, fun hg => hσ (congrArg (Ideal.Quotient.mk w.asIdeal) hg)⟩, ?_⟩
  intro g
  apply root_inj w (a := (g.val ^ p) • ζ) (b := ζ) _ hz.pow_eq_one hcop
  · change ρ (g ^ p) u = u
    rw [map_pow]
    apply TunnellFrobeniusAuxiliary.pow_fix k F p u
    rw [hk, hpow, pow_succ, hu.pow_eq_one, one_mul]
  · rw [← smul_pow', hz.pow_eq_one, smul_one]
theorem obstruct {m : ℕ} [NeZero m] (ζ : 𝓞 M) (hz : ζ ^ m = 1)
    (hcop : w.asIdeal.absNorm.Coprime m) (s : MulAction.stabilizer Gal(M/D) w.asIdeal)
    (hs : s.val • ζ ≠ ζ) : ¬ m ∣ v.asIdeal.absNorm - 1 := by
  let k := (𝓞 D) ⧸ v.asIdeal
  letI : Field k := Ideal.Quotient.field v.asIdeal
  let F := (𝓞 M) ⧸ w.asIdeal
  letI : Field F := Ideal.Quotient.field w.asIdeal
  letI : Finite k := v.asIdeal.finiteQuotientOfFreeOfNeBot v.ne_bot
  letI : Finite F := w.asIdeal.finiteQuotientOfFreeOfNeBot w.ne_bot
  letI : Fintype k := Fintype.ofFinite k
  have hk : Fintype.card k = v.asIdeal.absNorm := by rw [← Nat.card_eq_fintype_card]; rfl
  let u := rootsOfUnity.mkOfPowEq (Ideal.Quotient.mk w.asIdeal ζ)
    (by rw [← map_pow, hz, map_one])
  intro h
  apply hs
  apply root_inj w (a:=s.val • ζ) (b:=ζ) _ hz hcop
  · exact TunnellFrobeniusAuxiliary.no_moves k F u.val u.property (hk ▸ h)
      (Ideal.Quotient.stabilizerHom w.asIdeal v.asIdeal Gal(M/D) s)
  · rw [← smul_pow', hz, smul_one]
end
end TunnellDecompositionRoot
namespace TunnellLiftStabilizer
open NumberField IsDedekindDomain IntermediateField
open scoped NumberField Pointwise Classical
noncomputable section
variable {D M : Type} [Field D] [NumberField D] [Field M] [NumberField M] [Algebra D M]
  [FiniteDimensional D M] [IsGalois D M] (v : HeightOneSpectrum (𝓞 D))
  (w : HeightOneSpectrum (𝓞 M)) [w.asIdeal.LiesOver v.asIdeal]
theorem lift (N : IntermediateField D M) [Normal D N] (g : Gal(M/D))
    (h : (g • w.asIdeal).under (𝓞 N) = w.asIdeal.under (𝓞 N)) :
    ∃ h ∈ MulAction.stabilizer Gal(M/D) w.asIdeal, ∀ x ∈ N, h x = g x := by
  classical
  haveI : (g • w.asIdeal).IsPrime := (inferInstance : w.asIdeal.IsPrime).smul g
  obtain ⟨t, ht⟩ := Algebra.IsInvariant.exists_smul_of_under_eq (𝓞 N) (𝓞 M) Gal(M/N)
    (g • w.asIdeal) w.asIdeal h
  let t' := t.restrictScalars D
  refine ⟨t' * g, ?_, ?_⟩
  · change (t' * g) • w.asIdeal = w.asIdeal
    rw [mul_smul]
    exact ht.symm
  · intro x hx
    change t (g x) = g x
    have hgx : g x ∈ N := (AlgEquiv.restrictNormal_commutes g N (⟨x,hx⟩ : N)) ▸ (g.restrictNormal N ⟨x,hx⟩).property
    exact t.commutes (⟨g x, hgx⟩ : N)
theorem nonsplit (N : IntermediateField D M) [Normal D N]
    (hN : N ≠ ⊥)
    (one : (v.asIdeal.primesOver (𝓞 N)).Subsingleton) :
    ¬ MulAction.stabilizer Gal(M/D) w.asIdeal ≤ N.fixingSubgroup := by
  classical
  have hproper : N.fixingSubgroup ≠ ⊤ := by
    intro h
    apply hN
    rw [← IsGalois.fixedField_fixingSubgroup N, h, IsGalois.fixedField_top]
  obtain ⟨g, hg⟩ := SetLike.exists_not_mem_of_ne_top N.fixingSubgroup hproper rfl
  have hmem (b : Gal(M/D)) : (b • w.asIdeal).under (𝓞 N) ∈ v.asIdeal.primesOver (𝓞 N) := by
    haveI : (b • w.asIdeal).IsPrime := (inferInstance : w.asIdeal.IsPrime).smul b
    exact ⟨inferInstance, Ideal.LiesOver.tower_bot (b • w.asIdeal) _ _⟩
  obtain ⟨t, ht, ht'⟩ := lift w N g (by simpa using one (hmem g) (hmem 1))
  intro le
  apply hg
  exact (N.mem_fixingSubgroup_iff g).mpr fun x hx =>
    (ht' x hx).symm.trans ((N.mem_fixingSubgroup_iff t).mp (le ht) x hx)
end
end TunnellLiftStabilizer
namespace TunnellChosenDiagonal
open NumberField IsDedekindDomain IntermediateField
open scoped NumberField Pointwise Classical
noncomputable section
variable {D M : Type} [Field D] [NumberField D] [Field M] [NumberField M] [Algebra D M]
  [FiniteDimensional D M] [IsGalois D M]
theorem fixes_generator (a : M) (g : Gal(M/D)) :
    g ∈ (adjoin D {a}).fixingSubgroup ↔ g a = a := by
  constructor
  · exact fun h => ((adjoin D {a}).mem_fixingSubgroup_iff g).mp h a (mem_adjoin_simple_self D a)
  · intro h
    let H := Subgroup.zpowers g
    refine (IntermediateField.le_iff_le H (adjoin D {a})).mp ?_ (Subgroup.mem_zpowers g)
    apply adjoin_simple_le_iff.mpr
    rw [mem_fixedField_iff]
    intro f hf
    exact (Subgroup.zpowers_le.mpr (show g ∈ MulAction.stabilizer Gal(M/D) a from h)) hf
theorem coprime (v : HeightOneSpectrum (𝓞 D)) (w : HeightOneSpectrum (𝓞 M))
    [w.asIdeal.LiesOver v.asIdeal] (p : ℕ) (hp : 0 < p) :
    w.asIdeal.absNorm.Coprime (v.asIdeal.absNorm ^ p - 1) := by
  let k := (𝓞 D) ⧸ v.asIdeal
  letI : Field k := Ideal.Quotient.field v.asIdeal
  let F := (𝓞 M) ⧸ w.asIdeal
  letI : Field F := Ideal.Quotient.field w.asIdeal
  letI : Finite k := v.asIdeal.finiteQuotientOfFreeOfNeBot v.ne_bot
  letI : Finite F := w.asIdeal.finiteQuotientOfFreeOfNeBot w.ne_bot
  letI : Fintype k := Fintype.ofFinite k
  letI : Fintype F := Fintype.ofFinite F
  have hk : Fintype.card k = v.asIdeal.absNorm := by rw [← Nat.card_eq_fintype_card]; rfl
  have hw : Fintype.card F = w.asIdeal.absNorm := by rw [← Nat.card_eq_fintype_card]; rfl
  rw [← hw, ← hk, Module.card_eq_pow_finrank (K:=k)]
  apply Nat.Coprime.pow_left
  apply Nat.Coprime.of_dvd_left (dvd_pow_self _ hp.ne')
  exact (Nat.coprime_self_sub_right (Nat.one_le_pow _ _ Fintype.card_pos)).mpr (Nat.coprime_one_right _)
theorem choose (v : HeightOneSpectrum (𝓞 D)) (w : HeightOneSpectrum (𝓞 M))
    [w.asIdeal.LiesOver v.asIdeal] (N : IntermediateField D M) [IsGalois D N]
    (p : ℕ) (hp : p.Prime) (degree : Module.finrank D N = p)
    (one : (v.asIdeal.primesOver (𝓞 N)).Subsingleton)
    (ζ : 𝓞 M) (hζ : IsPrimitiveRoot ζ (v.asIdeal.absNorm ^ p - 1))
    (gen : N ⊔ adjoin D {(ζ:M)} = ⊤) :
    ∃ g ∈ MulAction.stabilizer Gal(M/D) w.asIdeal, g (ζ:M) ≠ ζ ∧ orderOf g = p ∧
      let E := fixedField (Subgroup.zpowers g)
      Module.finrank E M = p ∧ E ⊔ N = ⊤ ∧ E ⊔ adjoin D {(ζ:M)} = ⊤ := by
  let m := v.asIdeal.absNorm ^ p - 1
  have hq : 1 < v.asIdeal.absNorm := by
    have hp0 : v.asIdeal.absNorm ≠ 0 := Ideal.absNorm_eq_zero_iff.not.mpr v.ne_bot
    have hp1 : v.asIdeal.absNorm ≠ 1 := Ideal.absNorm_eq_one_iff.not.mpr (inferInstance : v.asIdeal.IsPrime).ne_top
    omega
  have hlarge : v.asIdeal.absNorm < v.asIdeal.absNorm ^ p := by
    simpa using Nat.pow_lt_pow_right hq hp.one_lt
  haveI : NeZero m := ⟨by dsimp [m]; omega⟩
  have notdiv : ¬ m ∣ v.asIdeal.absNorm - 1 := fun hd =>
    (show v.asIdeal.absNorm - 1 < m by dsimp [m]; omega).not_ge (Nat.le_of_dvd (by omega) hd)
  obtain ⟨⟨r,hr⟩, hpow⟩ := TunnellDecompositionRoot.at_prime v w (m:=m) ζ hζ
    (coprime v w p hp.pos) notdiv (by dsimp [m]; omega : v.asIdeal.absNorm ^ p = m + 1)
  have rmove : r.val (ζ:M) ≠ ζ := fun he => hr (Subtype.ext he)
  have notbot : N ≠ ⊥ := by
    rintro rfl
    exact hp.ne_one (by simpa using degree.symm)
  let C := adjoin D {(ζ:M)}
  have hN := TunnellLiftStabilizer.nonsplit v w N notbot one
  have hC : ¬ MulAction.stabilizer Gal(M/D) w.asIdeal ≤ C.fixingSubgroup :=
    fun h => rmove ((fixes_generator _ r.val).mp (h r.property))
  have pN (g : Gal(M/D)) : g ^ p ∈ N.fixingSubgroup := by
    rw [← N.restrictNormalHom_ker, MonoidHom.mem_ker, map_pow]
    rw [← degree, ← IsGalois.card_aut_eq_finrank D N]
    exact pow_card_eq_one'
  obtain ⟨g,hg,_,hc,ho,hE⟩ := TunnellDiagonalField.diagonal hp
    (MulAction.stabilizer Gal(M/D) w.asIdeal) N C gen hN hC (fun g _ => pN g) (fun g hg =>
      (fixes_generator _ _).mpr (congrArg (fun z : 𝓞 M => (z:M)) (hpow ⟨g,hg⟩)))
  exact ⟨g,hg,fun he=>hc ((fixes_generator _ g).mpr he),ho,hE⟩
theorem obstruction (g : Gal(M/D)) (w : HeightOneSpectrum (𝓞 M))
    (hg : g ∈ MulAction.stabilizer Gal(M/D) w.asIdeal)
    (t : HeightOneSpectrum (𝓞 (fixedField (Subgroup.zpowers g))))
    [w.asIdeal.LiesOver t.asIdeal] {m : ℕ} [NeZero m] (ζ : 𝓞 M)
    (hz : ζ ^ m = 1) (hcop : w.asIdeal.absNorm.Coprime m) (hmove : g (ζ:M) ≠ ζ) :
    ¬ m ∣ t.asIdeal.absNorm - 1 := by
  let E := fixedField (Subgroup.zpowers g)
  have hgE : g ∈ E.fixingSubgroup := by
    rw [show E = fixedField (Subgroup.zpowers g) from rfl, fixingSubgroup_fixedField]
    exact Subgroup.mem_zpowers g
  let s := E.fixingSubgroupEquiv ⟨g,hgE⟩
  exact TunnellDecompositionRoot.obstruct t w ζ hz hcop ⟨s,hg⟩
    (fun e => hmove (congrArg (fun x : 𝓞 M => (x:M)) e))
end
end TunnellChosenDiagonal
namespace TunnellPrimeWitness
open NumberField IsDedekindDomain IntermediateField FiniteIdeleGroup IdeleGroup
open scoped Classical NumberField TensorProduct
noncomputable section
def Index : Prop := ∀ (D M : Type) [Field D] [NumberField D] [Field M] [NumberField M]
    [Algebra D M] [FiniteDimensional D M] [IsAbelianGalois D M],
    (TunnellGlobalNormLattice.P D M).index = Module.finrank D M
def Lattice : Prop := ∀ (D M : Type) [Field D] [NumberField D] [Field M] [NumberField M]
    [Algebra D M] [FiniteDimensional D M] [IsAbelianGalois D M] (E N : IntermediateField D M),
    E ⊔ N = ⊤ → TunnellGlobalNormLattice.P D M = TunnellGlobalNormLattice.P D E ⊓ TunnellGlobalNormLattice.P D N
def Rational : Prop := ∀ (m : ℕ), 2 < m → ∀ (C : Type) [Field C] [NumberField C]
    [IsCyclotomicExtension {m} ℚ C] (v : HeightOneSpectrum (𝓞 ℚ)) (n : ℕ) (x : (v.adicCompletion ℚ)ˣ),
    v.asIdeal.absNorm.Coprime m → (localOrder v x).toAdd = (n:ℤ) →
    finitePlaceIdeleClass v x ∈ (ideleClassNorm ℚ C).range → m ∣ v.asIdeal.absNorm ^ n - 1
variable {D N : Type} [Field D] [NumberField D] [Field N] [NumberField N]
    [Algebra D N] [FiniteDimensional D N] [IsAbelianGalois D N]
theorem range_eq {N' : Type} [Field N'] [NumberField N'] [Algebra D N']
    (e : N ≃ₐ[D] N') : (ideleClassNorm D N').range = (ideleClassNorm D N).range := by
  let q := TunnellNativeClassLattice.toClass D
  have eq : TunnellGlobalNormLattice.P D N' = TunnellGlobalNormLattice.P D N := by
    unfold TunnellGlobalNormLattice.P
    congr 1
    let A := TunnellGlobalNormLattice.A D
    let j : A ⊗[D] N ≃ₐ[A] A ⊗[D] N' := Algebra.TensorProduct.congr (.refl) e
    ext a
    constructor
    · rintro ⟨z,rfl⟩
      exact ⟨Units.mapEquiv j.symm.toMulEquiv z, Units.ext (Algebra.norm_eq_of_algEquiv j.symm z.val)⟩
    · rintro ⟨z,rfl⟩
      exact ⟨Units.mapEquiv j.toMulEquiv z, Units.ext (Algebra.norm_eq_of_algEquiv j z.val)⟩
  ext a
  obtain ⟨y,rfl⟩ := TunnellNativeClassLattice.onto D a
  change y ∈ (ideleClassNorm D N').range.comap q ↔ y ∈ (ideleClassNorm D N).range.comap q
  rw [TunnellNativeClassLattice.pull, TunnellNativeClassLattice.pull,eq]
theorem one_transport {N' : Type} [Field N'] [NumberField N'] [Algebra D N']
    (e : N ≃ₐ[D] N') (v : HeightOneSpectrum (𝓞 D))
    (h : (v.asIdeal.primesOver (𝓞 N)).Subsingleton) :
    (v.asIdeal.primesOver (𝓞 N')).Subsingleton := by
  let f : (𝓞 N) ≃ₐ[𝓞 D] (𝓞 N') := RingOfIntegers.mapAlgEquiv e
  intro P hP Q hQ
  haveI : P.LiesOver v.asIdeal := hP.2
  haveI : Q.LiesOver v.asIdeal := hQ.2
  haveI : P.IsPrime := hP.1
  haveI : Q.IsPrime := hQ.1
  exact Ideal.comap_injective_of_surjective f.toRingHom f.surjective
    (h (x:=(P.comap f.toRingHom)) ⟨inferInstance,Ideal.LiesOver.of_eq_comap _ f rfl⟩
       (y:=(Q.comap f.toRingHom)) ⟨inferInstance,Ideal.LiesOver.of_eq_comap _ f rfl⟩)
theorem witness (val : TunnellInjectionValuation.Law) (ind : Index) (lattice : Lattice) (rat : Rational)
    (v : HeightOneSpectrum (𝓞 D)) (hp : (Module.finrank D N).Prime)
    (one : (v.asIdeal.primesOver (𝓞 N)).Subsingleton) :
    ∃ x : (v.adicCompletion D)ˣ, finitePlaceIdeleClass v x ∉ (ideleClassNorm D N).range := by
  let p := Module.finrank D N
  let q := v.asIdeal.absNorm
  let m := q ^ p - 1
  have hq : 1 < q := by
    have h₀ := Ideal.absNorm_eq_zero_iff.not.mpr v.ne_bot
    have h₁ := Ideal.absNorm_eq_one_iff.not.mpr v.isPrime.ne_top
    dsimp [q]; omega
  have h2 : 2 < m := by
    have h : 4 ≤ q^2 := Nat.pow_le_pow_left (by omega : 2 ≤ q) 2
    have h' := Nat.pow_le_pow_right (by omega : q>0) hp.two_le
    dsimp [m,p] at *; omega
  haveI : NeZero m := ⟨by omega⟩
  obtain ⟨M,hM,hnM,hA,hD,hAb,j,ζ,hζ,hgen⟩ := TunnellCyclotomicEnvelope.envelope D N m
  let N' := j.fieldRange
  let e : N ≃ₐ[D] N' := AlgEquiv.ofInjectiveField j
  let T : v.asIdeal.primesOver (𝓞 M) := Classical.choice inferInstance
  letI : T.val.LiesOver v.asIdeal := T.property.2
  let w : HeightOneSpectrum (𝓞 M) := ⟨T.val,T.property.1,Ideal.ne_bot_of_liesOver_of_ne_bot v.ne_bot T.val⟩
  letI : w.asIdeal.LiesOver v.asIdeal := T.property.2
  obtain ⟨g,hg,hmove,ho,deg,joinN,joinC⟩ := TunnellChosenDiagonal.choose v w N' p hp
    e.toLinearEquiv.finrank_eq.symm (one_transport e v one) ζ hζ hgen
  let E := fixedField (Subgroup.zpowers g)
  let t := finitePlaceBelow (K:=E) w
  haveI : w.asIdeal.LiesOver t.asIdeal := by dsimp [t]; infer_instance
  haveI : t.asIdeal.LiesOver v.asIdeal := Ideal.LiesOver.tower_bot w.asIdeal _ _
  have below : finitePlaceBelow (K:=D) t = v := HeightOneSpectrum.ext (t.asIdeal.over_def v.asIdeal).symm
  have hcop := TunnellChosenDiagonal.coprime v w p hp.pos
  have obstruct := TunnellChosenDiagonal.obstruction g w hg t ζ hζ.pow_eq_one hcop hmove
  let r := finitePlaceBelow (K:=ℚ) t
  haveI : t.asIdeal.LiesOver r.asIdeal := by dsimp [r]; infer_instance
  haveI : w.asIdeal.LiesOver r.asIdeal := Ideal.LiesOver.trans w.asIdeal t.asIdeal _
  have hr : r.asIdeal.absNorm.Coprime m := by
    apply Nat.Coprime.of_dvd_left _ hcop
    rw [←Ideal.absNorm_pow_inertiaDeg r.asIdeal w.asIdeal]
    exact dvd_pow_self _ (w.asIdeal.inertiaDeg_pos (𝓞 ℚ)).ne'
  let C := adjoin ℚ {(ζ:M)}
  haveI : IsCyclotomicExtension {m} ℚ C :=
    (hζ.map_of_injective (RingOfIntegers.coe_injective (K:=M))).intermediateField_adjoin_isCyclotomicExtension ℚ
  have wt := TunnellCrossedWitness.witness val E N' C m t (lattice D M E N' joinN)
    (ind D M) (ind D E) (ind E M) obstruct hr (rat m h2 C)
  dsimp only at wt
  rw [below, range_eq e] at wt
  exact wt
end
end TunnellPrimeWitness
namespace TunnellCyclicInjectionReceiver
open NumberField IsDedekindDomain FiniteIdeleGroup IdeleGroup
open scoped NumberField TensorProduct Classical
noncomputable section
def Rational : Prop :=
  ∀ (m : ℕ), 2 < m → ∀ (v : HeightOneSpectrum (𝓞 ℚ)) (n : ℕ) (z : (AdeleRing (𝓞 ℚ) ℚ)ˣ),
    z.val.1 = 1 → (∀ w ≠ v, z.val.2 w = 1) → v.asIdeal.absNorm.Coprime m →
    -WithZero.log (Valued.v (z.val.2 v)) = (n:ℤ) → z ∈ TunnellGlobalNormLattice.P ℚ (CyclotomicField m ℚ) →
    m ∣ v.asIdeal.absNorm ^ n - 1
theorem convert (h : Rational) : TunnellPrimeWitness.Rational := by
  intro m hm C _ _ hc v n x hp ho hi
  haveI : NeZero m := ⟨by omega⟩
  haveI : NeZero (m:ℚ) := ⟨by exact_mod_cast (NeZero.ne m)⟩
  let C' := CyclotomicField m ℚ
  haveI : IsCyclotomicExtension {m} ℚ C' := CyclotomicField.isCyclotomicExtension m ℚ
  haveI : IsAbelianGalois ℚ C := IsCyclotomicExtension.isAbelianGalois {m} ℚ C
  have eq := TunnellPrimeWitness.range_eq (IsCyclotomicExtension.algEquiv {m} ℚ C C')
  let z := TunnellSupportedTensorNorm.single v x
  apply h m hm v n z rfl
  · intro w hw
    exact congrArg Units.val (finitePlaceIdele_finiteComponent_of_ne v w x hw)
  · exact hp
  · rw [show z.val.2 v = x.val from congrArg Units.val (finitePlaceIdele_finiteComponent_same v x)]
    exact ho
  · rw [← TunnellNativeClassLattice.pull]
    change finitePlaceIdeleClass v x ∈ (ideleClassNorm ℚ C').range
    rwa [eq]
end
end TunnellCyclicInjectionReceiver
namespace TunnellCandidatePrime
open NumberField IsDedekindDomain IdeleGroup
open scoped NumberField TensorProduct IsMulCommutative
theorem result : OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1_H2_R1_H1_R1.H2 := by
  intro lattice ray valuation D N _ _ _ _ _ _ _ v hp one
  obtain ⟨x,hx⟩ := TunnellPrimeWitness.witness (D:=D) (N:=N) valuation
    (fun F M _ _ _ _ _ _ _ => (lattice F M).1)
    (fun F M _ _ _ _ _ _ _ => (lattice F M).2)
    (TunnellCyclicInjectionReceiver.convert ray) v hp one
  let z := TunnellSupportedTensorNorm.single v x
  refine ⟨z,rfl,fun w hw => congrArg Units.val (finitePlaceIdele_finiteComponent_of_ne v w x hw),?_⟩
  change z ∉ TunnellGlobalNormLattice.P D N
  rw [←TunnellNativeClassLattice.pull]
  exact hx
end TunnellCandidatePrime
end

theorem OMA.solution : OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1_H2_R1_H1_R1.H2 := TunnellCandidatePrime.result
