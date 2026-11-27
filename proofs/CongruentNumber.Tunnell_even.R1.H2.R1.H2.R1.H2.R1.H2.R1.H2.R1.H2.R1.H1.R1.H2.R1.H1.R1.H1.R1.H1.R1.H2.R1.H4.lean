import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1_H1_R1_H1_R1_H1_R1_H2_R1
import Mathlib

/-! Local orders of determinants after tensoring at a finite prime. The maps to the local tensor products and their one-place inclusions are adapted from ClassFieldTheory, commit 2e6280f9d2579705a0cc6c76ec68c2b60f9c601a, https://github.com/n-yamaguchi-0729/ClassFieldTheory. -/
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
end TunnellSupportedTensorNorm
end

namespace TunnellRayTensorLocal
open NumberField IsDedekindDomain RelativeIdeleGroup IdeleGroup
open scoped NumberField TensorProduct
noncomputable section

def Projection : Prop :=
  ∀ (F : Type) [Field F] [NumberField F] (p : HeightOneSpectrum (𝓞 ℚ)),
  let K := p.adicCompletion ℚ
  let A := AdeleRing (𝓞 ℚ) ℚ
  let N := Units.map (Algebra.norm A (S := A ⊗[ℚ] F))
  (∀ y : (A ⊗[ℚ] F)ˣ, ∃ x : (K ⊗[ℚ] F)ˣ, (N y).val.2 p = Algebra.norm K x.val) ∧
  (∀ x : (K ⊗[ℚ] F)ˣ, ∃ y : (A ⊗[ℚ] F)ˣ, (N y).val.1 = 1 ∧
    (∀ w : HeightOneSpectrum (𝓞 ℚ), w ≠ p → (N y).val.2 w = 1) ∧ (N y).val.2 p = Algebra.norm K x.val)

theorem actual : Projection := by
  intro F _ _ p K A N
  constructor
  · intro y
    refine ⟨RelativeIdeleGroup.finiteComponent (K:=ℚ) (L:=F) p y,?_⟩
    exact congrArg Units.val (RelativeIdeleGroup.finiteComponent_norm (K:=ℚ) (L:=F) p y)
  · intro x
    let u := Units.map (Algebra.norm K (S:=K ⊗[ℚ] F)) x
    refine ⟨relativeFinitePlaceIdele (K:=ℚ) (L:=F) p x,?_⟩
    have h := TunnellSupportedTensorNorm.norm_single (D:=ℚ) (N:=F) p x
    change N (relativeFinitePlaceIdele (K:=ℚ) (L:=F) p x) = TunnellSupportedTensorNorm.single p u at h
    rw [h]
    refine ⟨rfl,fun w hw => congrArg Units.val (IdeleGroup.finitePlaceIdele_finiteComponent_of_ne p w u hw),?_⟩
    exact congrArg Units.val (IdeleGroup.finitePlaceIdele_finiteComponent_same p u)
end
end TunnellRayTensorLocal

theorem OMA.solution : OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1_H1_R1_H1_R1_H1_R1_H2_R1.H4 := TunnellRayTensorLocal.actual
