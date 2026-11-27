import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1_H2_R1
import Mathlib

/-! Determinant norms of tensors supported at one finite place. The idelic component formulas are adapted from ClassFieldTheory revision 2e6280f9d2579705a0cc6c76ec68c2b60f9c601a, https://github.com/n-yamaguchi-0729/ClassFieldTheory. -/
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
 
def inclusion :
    IdeleGroup K →* RelativeIdeleGroup K L :=
  (Units.map (adeleInclusion K L)).comp
    (IdeleGroup.equivAdeleRingUnits (K := K)).toMonoidHom
 

def norm :
    RelativeIdeleGroup K L →* IdeleGroup K :=
  (IdeleGroup.equivAdeleRingUnits (K := K)).symm.toMonoidHom.comp
    (Units.map
      (Algebra.norm
        (NumberField.AdeleRing (𝓞 K) K)))
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

/-! A determinant norm supported at one finite place is already a global adelic determinant norm. -/
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

theorem norm_le (v : HeightOneSpectrum (𝓞 D)) :
    (Units.map (Algebra.norm (v.adicCompletion D) : (v.adicCompletion D ⊗[D] N) →* v.adicCompletion D)).range ≤
      (Units.map (Algebra.norm (A D) : (A D ⊗[D] N) →* A D)).range.comap (single v) := by
  rintro x ⟨z,rfl⟩
  exact ⟨relativeFinitePlaceIdele (K:=D) (L:=N) v z, norm_single v z⟩

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

theorem supported (v : HeightOneSpectrum (𝓞 D)) (x : (v.adicCompletion D)ˣ) (a : (A D)ˣ)
    (ha : a.val.1=1) (hv : a.val.2 v=x.val)
    (hs : ∀ s : HeightOneSpectrum (𝓞 D), s≠v → a.val.2 s=1)
    (hn : x ∈ (Units.map (Algebra.norm (v.adicCompletion D) : (v.adicCompletion D ⊗[D] N) →* v.adicCompletion D)).range) :
    a ∈ (Units.map (Algebra.norm (A D) : (A D ⊗[D] N) →* A D)).range := by
  rw [unique_single v x a ha hv hs]
  exact norm_le v hn
end TunnellSupportedTensorNorm

noncomputable section

namespace ValuationTheory
namespace Completion

universe u v w

open Module

/-- A component of a module-valued product is finite whenever the whole
product is finite.  Evaluation is a surjective linear map. -/
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

/-- Multiplication on a binary product is the product of the two
multiplication endomorphisms. -/
theorem algebra_lmul_prod_eq_prodMap
    {R S T : Type*} [CommRing R] [CommRing S] [CommRing T]
    [Algebra R S] [Algebra R T] (x : S × T) :
    Algebra.lmul R (S × T) x =
      (Algebra.lmul R S x.1).prodMap (Algebra.lmul R T x.2) := by
  apply LinearMap.ext
  intro y
  rcases y with ⟨y, z⟩
  rfl

/-- The algebra norm on a binary product is the product of the component
norms. -/
theorem algebra_norm_prod_apply
    {R S T : Type*} [CommRing R] [CommRing S] [CommRing T]
    [Algebra R S] [Algebra R T]
    [Module.Free R S] [Module.Finite R S]
    [Module.Free R T] [Module.Finite R T]
    (x : S × T) :
    Algebra.norm R x = Algebra.norm R x.1 * Algebra.norm R x.2 := by
  rw [Algebra.norm_apply, algebra_lmul_prod_eq_prodMap,
    LinearMap.det_prodMap, ← Algebra.norm_apply, ← Algebra.norm_apply]

/-- Reindexing a dependent product is an algebra equivalence. -/
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

/-- Splitting the `none` coordinate from an `Option`-indexed dependent
product is an algebra equivalence. -/
noncomputable def piOptionEquivProdAlgEquiv
    {R : Type*} [CommSemiring R]
    {ι : Type*} (A : Option ι → Type*) [∀ i, Semiring (A i)]
    [∀ i, Algebra R (A i)] :
    ((i : Option ι) → A i) ≃ₐ[R] (A none × ((i : ι) → A (some i))) where
  __ := RingEquiv.piOptionEquivProd
  commutes' _ := rfl

/-- The algebra norm of an element of a finite dependent product is the
product of its component norms. -/
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

/-- The algebra trace of an element of a finite dependent product is the
sum of its component traces. -/
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

section
/-! After a base change, a finite Galois extension becomes a product of copies of each of its field factors. -/
namespace TunnellTensorFactors
open Polynomial TensorProduct
open scoped Classical TensorProduct NumberField WithZero

variable {D N K : Type} [Field D] [Field N] [Algebra D N] [FiniteDimensional D N] [IsGalois D N]
  [Field K] [Algebra D K]

theorem splits_factor (p : D[X]) [p.IsSplittingField D N] {Y : Type} [Field Y] [Algebra K Y]
    (e : K ⊗[D] N →ₐ[K] Y) (he : Function.Surjective e) :
    (p.map (algebraMap D K)).IsSplittingField K Y := by
  letI : Algebra D Y := ((algebraMap K Y).comp (algebraMap D K)).toAlgebra
  letI : IsScalarTower D K Y := IsScalarTower.of_algebraMap_eq fun _ => rfl
  let j : N →ₐ[D] Y := (e.restrictScalars D).comp Algebra.TensorProduct.includeRight
  let q := p.map (algebraMap D K)
  have hroot : q.rootSet Y = p.rootSet Y := by
    simp only [q, Polynomial.rootSet, Polynomial.aroots, Polynomial.map_map, ← IsScalarTower.algebraMap_eq]
  let E := Algebra.adjoin K (q.rootSet Y : Set Y)
  have hsub : j.range ≤ E.restrictScalars D := by
    rw [← Polynomial.IsSplittingField.adjoin_rootSet_eq_range N p j, Algebra.adjoin_le_iff]
    intro x hx
    change x ∈ Algebra.adjoin K (q.rootSet Y : Set Y)
    apply Algebra.subset_adjoin
    rwa [hroot]
  constructor
  · rw [Polynomial.map_map, ← IsScalarTower.algebraMap_eq]
    exact Polynomial.Splits.of_algHom (Polynomial.IsSplittingField.splits N p) j
  · apply top_unique
    intro x hx
    clear hx
    obtain ⟨z,rfl⟩ := he x
    change e z ∈ E
    induction z using TensorProduct.induction_on with
    | zero => simpa using E.zero_mem
    | tmul a b =>
      rw [TensorProduct.tmul_eq_smul_one_tmul, map_smul]
      exact E.toSubmodule.smul_mem a (hsub ⟨b,rfl⟩)
    | add a b ha hb =>
      rw [map_add]
      exact E.add_mem ha hb

theorem product {W : Type} [Field W] [Algebra K W] (f : K ⊗[D] N →ₐ[K] W)
    (hf : Function.Surjective f) :
    ∃ I : Type, Finite I ∧ Nonempty I ∧ Nonempty ((K ⊗[D] N) ≃ₐ[K] (I → W)) := by
  classical
  let T := K ⊗[D] N
  letI : Algebra.FormallyEtale D N := Algebra.FormallyEtale.of_isSeparable D N
  obtain ⟨I, hI, F, hF, hA, e, _⟩ := (Algebra.FormallyEtale.iff_exists_algEquiv_prod K T).mp inferInstance
  letI : Finite I := hI
  letI (i:I) : Field (F i) := hF i
  letI (i:I) : Algebra K (F i) := hA i
  obtain ⟨p, _, hsp⟩ := IsGalois.is_separable_splitting_field D N
  haveI hW := splits_factor p f hf
  let q := p.map (algebraMap D K)
  have hblocks (i:I) : q.IsSplittingField K (F i) :=
    splits_factor p ((Pi.evalAlgHom K F i).comp e.toAlgHom) ((Function.surjective_eval i).comp e.surjective)
  let z (i:I) : F i ≃ₐ[K] W := (Polynomial.IsSplittingField.algEquiv (F i) q).trans
    (Polynomial.IsSplittingField.algEquiv W q).symm
  have hn : Nonempty I := by
    by_contra h
    letI : IsEmpty I := not_nonempty_iff.mp h
    exact zero_ne_one (α:=T) (e.injective (Subsingleton.elim _ _))
  exact ⟨I,hI,hn,⟨e.trans (AlgEquiv.piCongrRight z)⟩⟩

open IsDedekindDomain NumberField

theorem actual_eval {D N : Type} [Field D] [NumberField D] [Field N] [NumberField N]
    [Algebra D N] [FiniteDimensional D N]
    (v : HeightOneSpectrum (𝓞 D)) (t : HeightOneSpectrum (𝓞 N))
    (f : v.adicCompletion D →+* t.adicCompletion N) (hf : Continuous f)
    (hc : ∀ c : D, f (algebraMap D _ c) = algebraMap N _ (algebraMap D N c)) :
    letI : Algebra (v.adicCompletion D) (t.adicCompletion N) := f.toAlgebra
    ∃ e : v.adicCompletion D ⊗[D] N →ₐ[v.adicCompletion D] t.adicCompletion N, Function.Surjective e := by
  let K := v.adicCompletion D
  let W := t.adicCompletion N
  letI : NontriviallyNormedField K := Valued.toNontriviallyNormedField K ℤᵐ⁰
  letI : Algebra K W := f.toAlgebra
  letI : Algebra D W := ((algebraMap N W).comp (algebraMap D N)).toAlgebra
  letI : IsScalarTower D K W := IsScalarTower.of_algebraMap_eq fun x => (hc x).symm
  letI : ContinuousSMul K W := continuousSMul_of_algebraMap K W hf
  let j : N →ₐ[D] W := ⟨algebraMap N W,fun _ => rfl⟩
  let e : K ⊗[D] N →ₐ[K] W := Algebra.TensorProduct.lift (Algebra.ofId K W) j (fun _ _ => Commute.all ..)
  refine ⟨e,fun y => ?_⟩
  haveI : FiniteDimensional K e.range := Module.Finite.of_surjective e.rangeRestrict.toLinearMap e.rangeRestrict_surjective
  have h : IsClosed (e.range : Set W) := e.range.toSubmodule.closed_of_finiteDimensional
  apply (t.denseRange_algebraMap N).induction_on (p:=fun y => y ∈ e.range) y h
  intro x
  refine ⟨1 ⊗ₜ[D] x,?_⟩
  simp [e, j]
  rfl

end TunnellTensorFactors

end

section
/-! Trace integrality and preimages of the determinant norm on a Galois base-change tensor. -/
namespace TunnellTensorIntegers
open Polynomial TunnellTensorFactors ValuationTheory.Completion
open scoped Classical TensorProduct

theorem integral_single {R W I : Type} [CommRing R] [CommRing W] [Algebra R W]
    [DecidableEq I] (i : I) (y : W) (hy : IsIntegral R y) :
    IsIntegral R (fun j : I => if j = i then y else 1) := by
  obtain ⟨p,hp,hpy⟩ := hy
  change aeval y p = 0 at hpy
  let u : I → W := fun j => if j = i then y else 1
  refine ⟨p * (X - C 1),hp.mul (monic_X_sub_C _),?_⟩
  funext j
  change Pi.evalAlgHom R (fun _ : I => W) j (aeval u (p * (X - C 1))) = 0
  rw [← aeval_algHom_apply]
  by_cases h : j = i
  · simp [u,h,hpy]
  · simp [u,h]

variable {D N K W : Type} [Field D] [Field N] [Algebra D N] [FiniteDimensional D N] [IsGalois D N]
  [Field K] [Algebra D K] [Field W] [Algebra K W] {O : ValuationSubring K} [Algebra O W] [hsW : IsScalarTower O K W]
scoped instance tensorIntegersAlg : Algebra O (K ⊗[D] N) := Algebra.compHom _ (algebraMap O K)
scoped instance tensorIntegersTower : IsScalarTower O K (K ⊗[D] N) := .of_algebraMap_eq' rfl
include hsW

omit hsW in
private theorem map_integral {A B : Type} [CommRing A] [CommRing B] [Algebra K A] [Algebra K B]
    [Algebra O A] [Algebra O B] (f : A →ₐ[K] B)
    (ha : ∀ c : O, algebraMap O A c = algebraMap K A c.val)
    (hb : ∀ c : O, algebraMap O B c = algebraMap K B c.val)
    (z : A) (hz : IsIntegral O z) : IsIntegral O (f z) := by
  apply IsIntegral.map_of_comp_eq (RingHom.id O) f.toRingHom _ hz
  ext c
  change algebraMap O B c = f (algebraMap O A c)
  rw [ha,hb,f.commutes]

theorem trace_integral (f : K ⊗[D] N →ₐ[K] W) (hf : Function.Surjective f) (z : K ⊗[D] N)
    (hz : IsIntegral O z) : IsIntegral O (Algebra.trace K (K ⊗[D] N) z) := by
  classical
  obtain ⟨I,hI,_,⟨e⟩⟩ := product f hf
  letI : Fintype I := Fintype.ofFinite I
  haveI : FiniteDimensional K W := Module.Finite.of_surjective f.toLinearMap hf
  rw [← Algebra.trace_eq_of_algEquiv e z, algebra_trace_pi_apply (fun _ : I => W)]
  apply IsIntegral.sum
  intro i _
  apply Algebra.isIntegral_trace
  exact map_integral ((Pi.evalAlgHom K (fun _ : I => W) i).comp e.toAlgHom)
    (fun _ => rfl) (IsScalarTower.algebraMap_apply O K W) z hz

theorem exists_tensor_integral_unit (f : K ⊗[D] N →ₐ[K] W) (hf : Function.Surjective f)
    (y : Wˣ) (hy : IsIntegral O (y : W)) (hyi : IsIntegral O (y⁻¹ : Wˣ).val) :
    ∃ z : (K ⊗[D] N)ˣ, Algebra.norm K z.val = Algebra.norm K y.val ∧
      IsIntegral O z.val ∧ IsIntegral O (z⁻¹ : (K ⊗[D] N)ˣ).val := by
  classical
  obtain ⟨I,hI,⟨o⟩,⟨e⟩⟩ := product f hf
  letI : Fintype I := Fintype.ofFinite I
  haveI : FiniteDimensional K W := Module.Finite.of_surjective f.toLinearMap hf
  let U : (I → W)ˣ :=
    { val := fun j => if j = o then y.val else 1
      inv := fun j => if j = o then (y⁻¹ : Wˣ).val else 1
      val_inv := by ext j; by_cases h : j = o <;> simp [h]
      inv_val := by ext j; by_cases h : j = o <;> simp [h] }
  let z := Units.mapEquiv e.symm.toMulEquiv U
  have h (c : O) : algebraMap O (I → W) c = algebraMap K (I → W) c.val :=
    funext fun _ => IsScalarTower.algebraMap_apply O K W c
  refine ⟨z,?_,map_integral e.symm.toAlgHom h (fun _ => rfl) _ (integral_single o (y : W) hy),
    map_integral e.symm.toAlgHom h (fun _ => rfl) _ (integral_single o ((y⁻¹ : Wˣ) : W) hyi)⟩
  change Algebra.norm K (e.symm (U.val)) = _
  rw [Algebra.norm_eq_of_algEquiv, algebra_norm_pi_apply (fun _ : I => W)]
  simp [U, apply_ite (Algebra.norm K)]

omit hsW in
theorem trace_integral_tensor (z : K ⊗[D] N) (hz : IsIntegral O z) :
    IsIntegral O (Algebra.trace K (K ⊗[D] N) z) := by
  classical
  let T := K ⊗[D] N
  letI : Algebra.FormallyEtale D N := Algebra.FormallyEtale.of_isSeparable D N
  obtain ⟨I, hI, F, hF, hA, e, _⟩ := (Algebra.FormallyEtale.iff_exists_algEquiv_prod K T).mp inferInstance
  letI : Fintype I := Fintype.ofFinite I
  letI (i:I) : Field (F i) := hF i
  letI (i:I) : Algebra K (F i) := hA i
  letI (i:I) : Algebra O (F i) := Algebra.compHom _ (algebraMap O K)
  letI (i:I) : IsScalarTower O K (F i) := .of_algebraMap_eq' rfl
  letI (i:I) : FiniteDimensional K (F i) := Module.Finite.of_surjective
    ((Pi.evalAlgHom K F i).comp e.toAlgHom).toLinearMap ((Function.surjective_eval i).comp e.surjective)
  rw [← Algebra.trace_eq_of_algEquiv e z, algebra_trace_pi_apply F]
  apply IsIntegral.sum
  intro i _
  apply Algebra.isIntegral_trace
  exact map_integral ((Pi.evalAlgHom K F i).comp e.toAlgHom) (fun _ => rfl) (fun _ => rfl) z hz

omit hsW in
theorem field_norm_of_tensor (f : K ⊗[D] N →ₐ[K] W) (hf : Function.Surjective f)
    (z : (K ⊗[D] N)ˣ) : ∃ y : Wˣ, Algebra.norm K (y : W) = Algebra.norm K z.val := by
  classical
  obtain ⟨I,hI,_,⟨e⟩⟩ := product f hf
  letI : Fintype I := Fintype.ofFinite I
  haveI : FiniteDimensional K W := Module.Finite.of_surjective f.toLinearMap hf
  let u := Units.mapEquiv e.toMulEquiv z
  refine ⟨∏ i, MulEquiv.piUnits u i, ?_⟩
  rw [Units.coe_prod, map_prod, ← Algebra.norm_eq_of_algEquiv e z.val, algebra_norm_pi_apply (fun _ : I => W)]
  rfl

end TunnellTensorIntegers

end

section
/-! A determinant norm on a single adelic tensor factor is a genuine norm in one completion above the prime. -/
namespace TunnellTensorCompletionNorm
open IsDedekindDomain IsDedekindDomain.HeightOneSpectrum NumberField
open scoped Classical TensorProduct

variable {D N : Type} [Field D] [NumberField D] [Field N] [NumberField N]
  [Algebra D N] [FiniteDimensional D N] [IsGalois D N]

theorem local_embedding (v : HeightOneSpectrum (𝓞 D)) :
    ∃ t : HeightOneSpectrum (𝓞 N), t.asIdeal.LiesOver v.asIdeal ∧
      ∃ f : v.adicCompletion D →+* t.adicCompletion N, Continuous f ∧
        ∀ c : D, f (algebraMap D _ c) = algebraMap N _ (algebraMap D N c) := by
  let q : v.asIdeal.primesOver (𝓞 N) := Classical.choice inferInstance
  letI : q.val.LiesOver v.asIdeal := q.property.2
  let t : HeightOneSpectrum (𝓞 N) := ⟨q.val, q.property.1, Ideal.ne_bot_of_liesOver_of_ne_bot v.ne_bot q.val⟩
  letI : t.asIdeal.LiesOver v.asIdeal := q.property.2
  let g := algebraMap (WithVal (v.valuation D)) (WithVal (t.valuation N))
  have hg : UniformContinuous g := uniformContinuous_algebraMap_liesOver (K:=D) (L:=N) v t
  let f := (adicCompletion.equiv N t).symm.toRingHom.comp
    ((UniformSpace.Completion.mapRingHom g hg.continuous).comp (adicCompletion.equiv D v).toRingHom)
  refine ⟨t, inferInstance, f,?_,?_⟩
  · exact (adicCompletion.continuous_ofCompletion N t).comp
      (UniformSpace.Completion.continuous_map.comp (adicCompletion.continuous_toCompletion D v))
  · intro c
    apply adicCompletion.ext
    change UniformSpace.Completion.mapRingHom g hg.continuous
      (((WithVal.equiv (v.valuation D)).symm c : WithVal _) : (v.valuation D).Completion) = _
    rw [UniformSpace.Completion.mapRingHom_coe]
    rfl

theorem realize (v : HeightOneSpectrum (𝓞 D)) :
    ∃ t : HeightOneSpectrum (𝓞 N), t.asIdeal.LiesOver v.asIdeal ∧
      ∃ f : v.adicCompletion D →+* t.adicCompletion N, Continuous f ∧
      (∀ c : D, f (algebraMap D _ c) = algebraMap N _ (algebraMap D N c)) ∧
      letI : Algebra (v.adicCompletion D) (t.adicCompletion N) := f.toAlgebra
      ∀ z : (v.adicCompletion D ⊗[D] N)ˣ, ∃ y : (t.adicCompletion N)ˣ,
        Algebra.norm (v.adicCompletion D) (y : t.adicCompletion N) =
          Algebra.norm (v.adicCompletion D) z.val := by
  obtain ⟨t,ht,f,hf,hc⟩ := local_embedding (N:=N) v
  refine ⟨t,ht,f,hf,hc,?_⟩
  letI : Algebra (v.adicCompletion D) (t.adicCompletion N) := f.toAlgebra
  obtain ⟨e,he⟩ := TunnellTensorFactors.actual_eval v t f hf hc
  exact TunnellTensorIntegers.field_norm_of_tensor e he

end TunnellTensorCompletionNorm

end


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

/-- The canonical right-factor `M`-algebra structure on
`𝔸_K ⊗[K] M`. -/
noncomputable instance (priority := 100)
    relativeAdeleRingIntermediateAlgebra :
    Algebra M (RelativeAdeleRing K M) :=
  Algebra.TensorProduct.rightAlgebra

/-- The relative adele algebra of `L`, presented over the intermediate
field while retaining the fixed bottom-field model of `𝔸_M`. -/
abbrev TowerRelativeAdeleRing :=
  RelativeAdeleRing K M ⊗[M] L

/-- The intermediate field acts on the one-step bottom-field model
`𝔸_K ⊗[K] L` through its embedding in `L`. -/
noncomputable instance (priority := 100)
    relativeAdeleRingTopIntermediateAlgebra :
    Algebra M (RelativeAdeleRing K L) :=
  ((Algebra.TensorProduct.includeRight
      (R := K)
      (A := NumberField.AdeleRing (𝓞 K) K)
      (B := L)).toRingHom.comp
        (algebraMap M L)).toAlgebra

/-- Extend the intermediate relative adele algebra along `M → L`. -/
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

/-- The copy of `L` in the one-step relative adele algebra, regarded
as an `M`-algebra map. -/
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

/-- Canonical ring equivalence
`(𝔸_K ⊗[K] M) ⊗[M] L ≃+* 𝔸_K ⊗[K] L`.

This is the standard tensor-product cancellation isomorphism: commute
the two outer factors, commute the inner scalar extension, cancel the
base change, and commute the remaining factors back. -/
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

/-- Flatten the iterated scalar extension
`(𝔸_K ⊗[K] M) ⊗[M] L` to `𝔸_K ⊗[K] L`. -/
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

/-- Embed the bottom adele algebra into the iterated tensor model. -/
def bottomAdeleToTower :
    NumberField.AdeleRing (𝓞 K) K →ₐ[K]
      TowerRelativeAdeleRing K M L :=
  (Algebra.TensorProduct.includeLeft
      (R := M) (S := K)
      (A := RelativeAdeleRing K M) (B := L)).comp
    (Algebra.TensorProduct.includeLeft
      (R := K) (S := K)
      (A := NumberField.AdeleRing (𝓞 K) K) (B := M))

omit [NumberField M] [NumberField L] [Algebra K L]
    [IsScalarTower K M L]
    [FiniteDimensional K M] [FiniteDimensional M L] in
@[simp]
theorem bottomAdeleToTower_apply
    (a : NumberField.AdeleRing (𝓞 K) K) :
    bottomAdeleToTower K M L a =
      (a ⊗ₜ[K] (1 : M)) ⊗ₜ[M] (1 : L) :=
  rfl

/-- Embed `L` into the iterated tensor model. -/
def topFieldToTower :
    L →ₐ[K] TowerRelativeAdeleRing K M L :=
  { (Algebra.TensorProduct.includeRight
      (R := M)
      (A := RelativeAdeleRing K M) (B := L)).toRingHom with
    commutes' := by
      intro k
      rw [IsScalarTower.algebraMap_apply K M L]
      change
        1 ⊗ₜ[M]
            algebraMap M L (algebraMap K M k) =
          algebraMap K
            (TowerRelativeAdeleRing K M L) k
      rw [← Algebra.TensorProduct.tmul_one_eq_one_tmul
        (R := M)
        (A := RelativeAdeleRing K M)
        (B := L)]
      change
        ((1 : NumberField.AdeleRing (𝓞 K) K) ⊗ₜ[K]
            algebraMap K M k) ⊗ₜ[M] (1 : L) =
          ((algebraMap K
              (NumberField.AdeleRing (𝓞 K) K) k) ⊗ₜ[K]
                (1 : M)) ⊗ₜ[M] (1 : L)
      rw [← Algebra.TensorProduct.tmul_one_eq_one_tmul
        (R := K)
        (A := NumberField.AdeleRing (𝓞 K) K)
        (B := M)]
      }

omit [NumberField M] [NumberField L]
    [FiniteDimensional K M] [FiniteDimensional M L] in
@[simp]
theorem topFieldToTower_apply
    (x : L) :
    topFieldToTower K M L x =
      (1 : RelativeAdeleRing K M) ⊗ₜ[M] x :=
  rfl

/-- Expand the one-step tensor model back to the iterated tower model. -/
def towerRelativeAdeleUnflatten :
    RelativeAdeleRing K L →ₐ[K]
      TowerRelativeAdeleRing K M L :=
  { (towerRelativeAdeleRingEquiv K M L).symm.toRingHom with
    commutes' := by
      intro k
      simp [towerRelativeAdeleRingEquiv] }

omit [NumberField M] [NumberField L]
    [FiniteDimensional K M] [FiniteDimensional M L] in
@[simp]
theorem towerRelativeAdeleUnflatten_tmul
    (a : NumberField.AdeleRing (𝓞 K) K)
    (x : L) :
    towerRelativeAdeleUnflatten K M L (a ⊗ₜ[K] x) =
      bottomAdeleToTower K M L a *
        topFieldToTower K M L x := by
  simp [towerRelativeAdeleUnflatten,
    towerRelativeAdeleRingEquiv,
    bottomAdeleToTower_apply,
    topFieldToTower_apply,
    Algebra.TensorProduct.tmul_mul_tmul]

/-- The flattening equivalence as an equivalence over the bottom adele
ring.  This is the form needed for invariance of determinant norms. -/
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


end
end

namespace TunnellKernelPieces
open NumberField IsDedekindDomain
open scoped Classical NumberField TensorProduct IsMulCommutative

def CyclicInjection : Prop :=
  ∀(D N:Type)[Field D][NumberField D][Field N][NumberField N][Algebra D N]
    [FiniteDimensional D N][IsGalois D N][IsCyclic Gal(N/D)](v:HeightOneSpectrum (𝓞 D)),
  let A:=AdeleRing (𝓞 D) D
  let P:=(Units.map (algebraMap D A).toMonoidHom).range ⊔ (Units.map (Algebra.norm A (S:=A⊗[D]N))).range
  let V:=v.adicCompletion D
  ∀(x:Vˣ)(z:Aˣ),z.val.1=1 → z.val.2 v=x.val → (∀ w:HeightOneSpectrum (𝓞 D),w≠v → z.val.2 w=1) →
    z∈P → x∈(Units.map (Algebra.norm V (S:=V⊗[D]N))).range

def CyclicDetection : Prop :=
  ∀(D N:Type)[Field D][NumberField D][Field N][NumberField N][Algebra D N]
    [FiniteDimensional D N][IsAbelianGalois D N](v:HeightOneSpectrum (𝓞 D)),
  let V:=v.adicCompletion D
  ∀ x:Vˣ,(∀ (E:IntermediateField D N),IsCyclic Gal(E/D) →
    x∈(Units.map (Algebra.norm V (S:=V⊗[D]E))).range) →
    x∈(Units.map (Algebra.norm V (S:=V⊗[D]N))).range

end TunnellKernelPieces


namespace TunnellProductPieces
open NumberField IsDedekindDomain
open scoped NumberField TensorProduct Classical IsMulCommutative

def QuotientGroupPresentation : Prop :=
  ∀ (D N:Type) [Field D] [NumberField D] [Field N] [NumberField N] [Algebra D N]
    [FiniteDimensional D N] [IsAbelianGalois D N],
  let A := AdeleRing (𝓞 D) D
  let P := (Units.map (algebraMap D A).toMonoidHom).range ⊔ (Units.map (Algebra.norm A (S:=A ⊗[D] N))).range
  Nonempty ((Aˣ ⧸ P) ≃* Gal(N/D))

def LocalKernel : Prop :=
  ∀ (D N:Type) [Field D] [NumberField D] [Field N] [NumberField N] [Algebra D N]
    [FiniteDimensional D N] [IsAbelianGalois D N] (v : HeightOneSpectrum (𝓞 D)),
  let A := AdeleRing (𝓞 D) D
  let P := (Units.map (algebraMap D A).toMonoidHom).range ⊔ (Units.map (Algebra.norm A (S:=A ⊗[D] N))).range
  let V := v.adicCompletion D
  ∃ t:HeightOneSpectrum (𝓞 N), t.asIdeal.LiesOver v.asIdeal ∧ ∃ f:V→+*t.adicCompletion N,
    Continuous f ∧ (∀ c:D,f (c:V)=((algebraMap D N c:N):t.adicCompletion N)) ∧
    letI : Algebra V (t.adicCompletion N):=f.toAlgebra
    ∀ (x:Vˣ) (z:Aˣ),z.val.1=1 → z.val.2 v=x.val →
      (∀ w:HeightOneSpectrum (𝓞 D),w≠v → z.val.2 w=1) →
      (z∈P ↔ ∃ y:(t.adicCompletion N)ˣ,Algebra.norm V (y:t.adicCompletion N)=x.val)

def PrincipalProduct : Prop :=
  ∀ (D N:Type) [Field D] [NumberField D] [Field N] [NumberField N] [Algebra D N]
    [FiniteDimensional D N] [IsAbelianGalois D N],(∀ i:InfinitePlace D,i.IsComplex) →
  let A := AdeleRing (𝓞 D) D
  let P := (Units.map (algebraMap D A).toMonoidHom).range ⊔ (Units.map (Algebra.norm A (S:=A ⊗[D] N))).range
  ∀ j : ∀ v:HeightOneSpectrum (𝓞 D),(v.adicCompletion D)ˣ →* Aˣ,
    (∀ v x,(j v x).val.1=1 ∧ (j v x).val.2 v=x.val ∧
      ∀ w:HeightOneSpectrum (𝓞 D), w≠v → (j v x).val.2 w=1) →
    ∀ x:Dˣ, ∏ᶠ v, QuotientGroup.mk' P (j v (Units.map (algebraMap D (v.adicCompletion D)).toMonoidHom x))=1

end TunnellProductPieces


namespace TunnellKernelJoin
open NumberField IsDedekindDomain
open scoped NumberField Classical TensorProduct IsMulCommutative
noncomputable section
abbrev A (D:Type) [Field D] [NumberField D] := AdeleRing (𝓞 D) D
abbrev pr (D:Type) [Field D] [NumberField D] := Units.map (algebraMap D (A D)).toMonoidHom
abbrev nm (D N:Type) [Field D] [NumberField D] [Field N] [Algebra D N] := Units.map (Algebra.norm (A D) (S:=A D ⊗[D] N))
abbrev rel (D N:Type) [Field D] [NumberField D] [Field N] [Algebra D N] := (pr D).range ⊔ (nm D N).range
abbrev ln (D N:Type) [Field D] [NumberField D] [Field N] [Algebra D N] (v:HeightOneSpectrum (𝓞 D)) :=
  (Units.map (Algebra.norm (v.adicCompletion D) (S:=v.adicCompletion D ⊗[D] N))).range

theorem down (D N:Type) [Field D] [NumberField D] [Field N] [NumberField N] [Algebra D N]
    [FiniteDimensional D N] (E:IntermediateField D N) : rel D N ≤ rel D E := by
  apply sup_le le_sup_left
  apply le_trans _ le_sup_right
  rintro x ⟨y,rfl⟩
  letI : Algebra E (RelativeAdeleRing D E) := Algebra.TensorProduct.rightAlgebra
  let u:=Units.mapEquiv (towerRelativeAdeleAlgEquiv D E N).symm.toMulEquiv y
  refine ⟨Units.map (Algebra.norm (RelativeAdeleRing D E)) u, Units.ext ?_⟩
  change Algebra.norm (A D) (Algebra.norm (RelativeAdeleRing D E) u.val) = Algebra.norm (A D) y.val
  rw [Algebra.norm_norm]
  exact Algebra.norm_eq_of_algEquiv (towerRelativeAdeleAlgEquiv D E N).symm y.val

theorem local_factors (D N:Type) [Field D] [NumberField D] [Field N] [NumberField N] [Algebra D N]
    [FiniteDimensional D N] [IsAbelianGalois D N] (v:HeightOneSpectrum (𝓞 D))
    (t:HeightOneSpectrum (𝓞 N)) (f:v.adicCompletion D→+*t.adicCompletion N)
    (hf:Continuous f) (hc:∀ c:D,f (c:v.adicCompletion D)=((algebraMap D N c:N):t.adicCompletion N)) :
    letI : Algebra (v.adicCompletion D) (t.adicCompletion N) := f.toAlgebra
    ∀ x:(v.adicCompletion D)ˣ,x∈ln D N v ↔ ∃ y:(t.adicCompletion N)ˣ,
      Algebra.norm (v.adicCompletion D) y.val=x.val := by
  let K:=v.adicCompletion D
  let W:=t.adicCompletion N
  letI : Algebra K W := f.toAlgebra
  obtain ⟨eval,he⟩:=TunnellTensorFactors.actual_eval v t f hf hc
  haveI : FiniteDimensional K W := Module.Finite.of_surjective eval.toLinearMap he
  obtain ⟨I,hI,⟨o⟩,⟨e⟩⟩:=TunnellTensorFactors.product eval he
  letI : Fintype I:=Fintype.ofFinite I
  intro x
  constructor
  · rintro ⟨z,rfl⟩
    exact TunnellTensorIntegers.field_norm_of_tensor eval he z
  · rintro ⟨y,hy⟩
    let unitAt (i:I):Wˣ := if i=o then y else 1
    let u:=(MulEquiv.piUnits (M:=fun _:I=>W)).symm unitAt
    refine ⟨Units.mapEquiv e.symm.toMulEquiv u,Units.ext ?_⟩
    change Algebra.norm K (e.symm u.val) = x.val
    rw [Algebra.norm_eq_of_algEquiv,ValuationTheory.Completion.algebra_norm_pi_apply (fun _:I=>W)]
    calc
      _ = Algebra.norm K (u.val o) := Finset.prod_eq_single o (by
        intro i _ hi
        change Algebra.norm K (unitAt i : W)=1
        simp [unitAt,hi]) (by simp)
      _ = x.val := by change Algebra.norm K (unitAt o : W)=_;simpa [unitAt] using hy

theorem kernel (cyc:TunnellKernelPieces.CyclicInjection) (detect:TunnellKernelPieces.CyclicDetection) :
    TunnellProductPieces.LocalKernel := by
  intro D N _ _ _ _ _ _ _ v
  obtain ⟨t,ht,f,hf,hc⟩:=TunnellTensorCompletionNorm.local_embedding (N:=N) v
  refine ⟨t,ht,f,hf,hc,?_⟩
  intro x z ha hx hs
  apply Iff.trans _ (local_factors D N v t f hf hc x)
  constructor
  · intro hz
    apply detect D N v x
    intro E hE
    letI:=hE
    letI : NumberField E := NumberField.of_module_finite D E
    exact cyc D E v x z ha hx hs (down D N E hz)
  · intro hn
    exact (show (nm D N).range ≤ rel D N from le_sup_right) (TunnellSupportedTensorNorm.supported (N:=N) v x z ha hx hs hn)

end
end TunnellKernelJoin


theorem OMA.solution : OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1_H2_R1.H3 := TunnellKernelJoin.kernel
