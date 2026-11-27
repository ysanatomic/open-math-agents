import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1_H2_R1_H2_R1
import Mathlib

/-! Cyclic subextensions detect tensor norms after scalar extension. The finite-product determinant formula and restriction of automorphisms are adapted from ClassFieldTheory, revision 2e6280f9d2579705a0cc6c76ec68c2b60f9c601a, https://github.com/n-yamaguchi-0729/ClassFieldTheory. Selected source declarations are combined below. -/
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

end Completion
end ValuationTheory
end
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


end TunnellTensorFactors

namespace TunnellTensorIntegers
open TunnellTensorFactors ValuationTheory.Completion
open scoped Classical TensorProduct
variable {D N K W : Type} [Field D] [Field N] [Algebra D N] [FiniteDimensional D N] [IsGalois D N]
  [Field K] [Algebra D K] [Field W] [Algebra K W]
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
namespace TunnellCyclicSubfields

open scoped IsMulCommutative

theorem separate {D N : Type*} [Field D] [Field N] [Algebra D N]
    [FiniteDimensional D N] [IsAbelianGalois D N] (g : Gal(N/D)) (hg : g ≠ 1) :
    ∃ E : IntermediateField D N, IsCyclic Gal(E/D) ∧ AlgEquiv.restrictNormalHom E g ≠ 1 := by
  classical
  obtain ⟨ι, _, m, _, ⟨e⟩⟩ := CommGroup.equiv_prod_multiplicative_zmod_of_finite Gal(N/D)
  have hex : ∃ i, e g i ≠ 1 := by
    by_contra! he
    apply hg
    apply e.injective
    ext i
    simpa using he i
  obtain ⟨i, hi⟩ := hex
  let f := (Pi.evalMonoidHom (fun j => Multiplicative (ZMod (m j))) i).comp e.toMonoidHom
  have hf : Function.Surjective f := (Function.surjective_eval i).comp e.surjective
  let E := IntermediateField.fixedField f.ker
  refine ⟨E, ?_, ?_⟩
  · have hq : IsCyclic (Gal(N/D) ⧸ f.ker) :=
      (QuotientGroup.quotientKerEquivOfSurjective f hf).isCyclic.mpr inferInstance
    exact (IsGalois.normalAutEquivQuotient f.ker).isCyclic.mp hq
  · intro h
    have hmem : g ∈ (AlgEquiv.restrictNormalHom E).ker := h
    rw [E.restrictNormalHom_ker, IntermediateField.fixingSubgroup_fixedField] at hmem
    exact hi hmem

theorem detect {D N : Type*} [Field D] [Field N] [Algebra D N]
    [FiniteDimensional D N] [IsAbelianGalois D N] (g : Gal(N/D)) :
    g = 1 ↔ ∀ E : IntermediateField D N, IsCyclic Gal(E/D) → AlgEquiv.restrictNormalHom E g = 1 := by
  constructor
  · rintro rfl E _
    exact map_one _
  · intro h
    by_contra hne
    obtain ⟨E,hE,hg⟩ := separate g hne
    exact hg (h E hE)

end TunnellCyclicSubfields
namespace TunnellCyclicBaseChange
open scoped TensorProduct IsMulCommutative
noncomputable section

variable {D N K C : Type} [Field D] [Field N] [Field K] [Field C] [Algebra D N]
  [Algebra D K] [Algebra K C] [Algebra D C] [IsScalarTower D K C]

abbrev block (K : Type) [Field K] [Algebra K C] (j : N →ₐ[D] C) :=
  IntermediateField.adjoin K (Set.range j)

def inside (j : N →ₐ[D] C) : N →ₐ[D] block K j where
  toFun a := ⟨j a, IntermediateField.subset_adjoin _ _ ⟨a,rfl⟩⟩
  map_one' := Subtype.ext j.map_one
  map_zero' := Subtype.ext j.map_zero
  map_add' a b := Subtype.ext (j.map_add a b)
  map_mul' a b := Subtype.ext (j.map_mul a b)
  commutes' a := Subtype.ext (j.commutes a)

def evaluation (j : N →ₐ[D] C) : K ⊗[D] N →ₐ[K] block K j :=
  AlgHom.liftEquiv D K N _ (inside (K:=K) j)

theorem eval_surj [Algebra.IsAlgebraic K C] (j : N →ₐ[D] C) :
    Function.Surjective (evaluation (K:=K) j) := by
  let f := evaluation (K:=K) j
  let incl := (block K j).val
  have hs : (block K j).toSubalgebra ≤ (incl.comp f).range := by
    rw [IntermediateField.adjoin_toSubalgebra, Algebra.adjoin_le_iff]
    rintro x ⟨a,rfl⟩
    refine ⟨1 ⊗ₜ[D] a,?_⟩
    change incl ((1 : K) • inside (K:=K) j a) = j a
    rw [one_smul]
    rfl
  intro x
  obtain ⟨t,ht⟩ := hs x.2
  exact ⟨t, Subtype.ext ht⟩

def descend [Normal D N] (j : N →ₐ[D] C) : Gal(block K j/K) →* Gal(N/D) := by
  let h := inside (K:=K) j
  letI : Algebra N (block K j) := h.toRingHom.toAlgebra
  letI : IsScalarTower D N (block K j) := .of_algebraMap_eq' h.comp_algebraMap.symm
  exact (AlgEquiv.restrictNormalHom N).comp (AlgEquiv.restrictScalarsHom D)

theorem descend_apply [Normal D N] (j : N →ₐ[D] C) (g : Gal(block K j/K)) (x : N) :
    inside (K:=K) j (descend j g x) = g (inside (K:=K) j x) := by
  let h := inside (K:=K) j
  letI : Algebra N (block K j) := h.toRingHom.toAlgebra
  letI : IsScalarTower D N (block K j) := .of_algebraMap_eq' h.comp_algebraMap.symm
  exact (g.restrictScalars D).restrictNormal_commutes N x

theorem descend_injective [Normal D N] (j : N →ₐ[D] C) :
    Function.Injective (descend (K:=K) j) := by
  intro g h e
  suffices hgh : g.toAlgHom = h.toAlgHom from AlgEquiv.ext fun x =>
    congrArg (fun t : block K j →ₐ[K] block K j => t x) hgh
  apply IntermediateField.adjoin_algHom_ext
  rintro _ ⟨x,rfl⟩
  exact (descend_apply j g x).symm.trans ((congrArg (fun t : Gal(N/D) => inside (K:=K) j (t x)) e).trans
    (descend_apply j h x))

instance blockFinite [FiniteDimensional D N] [Algebra.IsAlgebraic K C] (j : N →ₐ[D] C) :
    FiniteDimensional K (block K j) :=
  Module.Finite.of_surjective (evaluation j).toLinearMap (eval_surj j)

instance blockAbelian [FiniteDimensional D N] [IsAbelianGalois D N] [Algebra.IsAlgebraic K C]
    (j : N →ₐ[D] C) : IsAbelianGalois K (block K j) := by
  obtain ⟨p,hp,hs⟩ := IsGalois.is_separable_splitting_field D N
  haveI := TunnellTensorFactors.splits_factor p (evaluation (K:=K) j) (eval_surj j)
  haveI := IsGalois.of_separable_splitting_field (F:=K) (E:=block K j) (p:=p.map (algebraMap D K)) hp.map
  exact { is_comm.comm g h := descend_injective j (by rw [map_mul,map_mul,mul_comm]) }

theorem mono (j : N →ₐ[D] C) (E : IntermediateField D N) :
    block K (j.comp E.val) ≤ block K j := by
  apply IntermediateField.adjoin.mono
  rintro x ⟨a,rfl⟩
  exact ⟨a.val,rfl⟩

theorem restrict_descend [Normal D N] (j : N →ₐ[D] C)
    (E : IntermediateField D N) [Normal D E] (g : Gal(block K j/K)) (h : Gal(block K (j.comp E.val)/K))
    (hcomp : ∀ t : block K (j.comp E.val), (h t : C) =
      (g (IntermediateField.inclusion (mono (K:=K) j E) t) : C)) :
    AlgEquiv.restrictNormalHom E (descend j g) = descend (j.comp E.val) h := by
  ext a
  apply j.injective
  change j (AlgEquiv.restrictNormalHom E (descend j g) a : E) = _
  rw [AlgEquiv.restrictNormalHom_apply]
  exact (congrArg Subtype.val (descend_apply j g (a:N))).trans <|
    (hcomp (inside (K:=K) (j.comp E.val) a)).symm.trans
      (congrArg Subtype.val (descend_apply (j.comp E.val) h a)).symm

end
end TunnellCyclicBaseChange
noncomputable section

namespace RamificationTheory

universe u v

variable {K : Type u} {Omega : Type v}
  [Field K] [Field Omega] [Algebra K Omega]

/-- Restriction `Gal(F/K) → Gal(E/K)` for two intermediate fields `E ≤ F`
in one ambient extension. -/
noncomputable def intermediateFieldRestrictNormalHom
    (E F : IntermediateField K Omega) (hEF : E ≤ F) [Normal K E] :
    (F ≃ₐ[K] F) →* (E ≃ₐ[K] E) := by
  letI : Algebra E F :=
    RingHom.toAlgebra (IntermediateField.inclusion hEF).toRingHom
  letI : IsScalarTower K E F := IsScalarTower.of_algebraMap_eq' rfl
  exact AlgEquiv.restrictNormalHom E

/-- Evaluation of the canonical intermediate-field restriction after both
sides are included in the common ambient field. -/
theorem intermediateFieldRestrictNormalHom_apply_val
    (E F : IntermediateField K Omega) (hEF : E ≤ F) [Normal K E]
    (sigma : F ≃ₐ[K] F) (x : E) :
    E.val (intermediateFieldRestrictNormalHom E F hEF sigma x) =
      F.val (sigma (IntermediateField.inclusion hEF x)) := by
  let : Algebra E F :=
    RingHom.toAlgebra (IntermediateField.inclusion hEF).toRingHom
  let : IsScalarTower K E F := IsScalarTower.of_algebraMap_eq' rfl
  have h := AlgEquiv.restrictNormal_commutes sigma E x
  exact congrArg F.val h

end RamificationTheory

end
namespace TunnellCyclicLocalKernels
open TunnellCyclicBaseChange
open ValuationTheory.Completion
open scoped TensorProduct Classical
noncomputable section

variable {D N K : Type} [Field D] [Field N] [Field K] [Algebra D N] [Algebra D K]
  [FiniteDimensional D N] [IsAbelianGalois D N]

abbrev rangeNorm (D K N : Type) [Field D] [Field K] [Field N] [Algebra D K] [Algebra D N] :
    Subgroup Kˣ := (Units.map (Algebra.norm K : K ⊗[D] N →* K)).range

theorem tensor_field {C : Type} [Field C] [Algebra K C] [Algebra D C] [IsScalarTower D K C]
    [Algebra.IsAlgebraic K C] (j : N →ₐ[D] C) :
    rangeNorm D K N = (Units.map (Algebra.norm K (S := block K j))).range := by
  classical
  let W := block K j
  let f := evaluation (K:=K) j
  obtain ⟨I,hI,⟨o⟩,⟨e⟩⟩ := TunnellTensorFactors.product f (eval_surj j)
  letI : Fintype I := Fintype.ofFinite I
  ext x
  constructor
  · rintro ⟨z,rfl⟩
    obtain ⟨y,hy⟩ := TunnellTensorIntegers.field_norm_of_tensor f (eval_surj j) z
    exact ⟨y,Units.ext hy⟩
  · rintro ⟨y,rfl⟩
    let unitAt (i : I) : Wˣ := if i = o then y else 1
    let u := (MulEquiv.piUnits (M:=fun _ : I => W)).symm unitAt
    refine ⟨Units.mapEquiv e.symm.toMulEquiv u, Units.ext ?_⟩
    change Algebra.norm K (e.symm u.val) = Algebra.norm K y.val
    rw [Algebra.norm_eq_of_algEquiv, algebra_norm_pi_apply (fun _ : I => W)]
    calc
      _ = Algebra.norm K (u.val o) := Finset.prod_eq_single o (by
        intro i _ hi
        change Algebra.norm K (unitAt i : W) = 1
        simp [unitAt,hi]) (by simp)
      _ = _ := by
        change Algebra.norm K (unitAt o : W) = _
        simp [unitAt]


end
end TunnellCyclicLocalKernels
namespace TunnellCyclicNormReceiver
open NumberField IsDedekindDomain RamificationTheory TunnellCyclicBaseChange TunnellCyclicLocalKernels
open scoped NumberField TensorProduct

theorem algebraic : OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1_H2_R1_H2_R1.H2 := by
  intro D N K _ _ _ _ _ _ _ C x witness
  let : Algebra D C := ((algebraMap K C).comp (algebraMap D K)).toAlgebra
  let : IsScalarTower D K C := .of_algebraMap_eq' rfl
  let j : N →ₐ[D] C := IsSepClosed.lift
  let L := block K j
  obtain ⟨σ, hσ⟩ := witness L
  have trivial : σ = 1 ↔ x ∈ rangeNorm D K N := by
    rw [tensor_field j]
    change _ ↔ x ∈ (Units.map (Algebra.norm K (S := L))).range
    rw [← hσ L le_rfl]
    constructor
    · rintro rfl y
      rfl
    · intro h
      exact AlgEquiv.ext fun y => Subtype.ext (h y)
  change x ∈ rangeNorm D K N ↔ _
  rw [← trivial, ← (descend_injective (K:=K) j).eq_iff' (map_one _),
    TunnellCyclicSubfields.detect]
  apply forall_congr' fun E => forall_congr' fun _ => ?_
  let i := j.comp E.val
  let M := block K i
  let h : M ≤ L := mono j E
  let τ := intermediateFieldRestrictNormalHom M L h σ
  have compat : AlgEquiv.restrictNormalHom E (descend j σ) = descend i τ :=
    restrict_descend j E σ τ (intermediateFieldRestrictNormalHom_apply_val M L h σ)
  change _ ↔ x ∈ rangeNorm D K E
  rw [compat, (descend_injective (K:=K) i).eq_iff' (map_one _), tensor_field i]
  change τ = 1 ↔ x ∈ (Units.map (Algebra.norm K (S := M))).range
  rw [← hσ M h]
  constructor
  · intro trivial y
    have eq := intermediateFieldRestrictNormalHom_apply_val M L h σ y
    change (τ y : C) = _ at eq
    rw [trivial] at eq
    exact eq.symm
  · intro fix
    exact AlgEquiv.ext fun y => Subtype.ext <|
      (intermediateFieldRestrictNormalHom_apply_val M L h σ y).trans (fix y)

end TunnellCyclicNormReceiver

theorem OMA.solution : OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1_H2_R1_H2_R1.H2 := TunnellCyclicNormReceiver.algebraic
