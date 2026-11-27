import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1_H1_R1_H1_R1_H1_R1
import Mathlib
/-
The profinite integer model, the rational cyclotomic character, and finite ramification are adapted from ClassFieldTheory at revision 2e6280f9d2579705a0cc6c76ec68c2b60f9c601a.
https://github.com/n-yamaguchi-0729/ClassFieldTheory
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

/- ProfiniteIntegerCore -/
section
namespace ClassFormation

/-!
# Profinite completion of the integers

We construct `ℤ̂` as the topological closure of the diagonal image of `ℤ`
inside the product of all positive cyclic quotients `ZMod n`.  This realizes
the canonical reduction maps and the dense integer embedding directly in
Mathlib.
-/

open scoped Topology

private structure ZHatIndex where
  modulus : ℕ
  positive : 0 < modulus

private instance (i : ZHatIndex) : NeZero i.modulus :=
  ⟨Nat.ne_of_gt i.positive⟩

private def zHatIndex (n : ℕ) (hn : 0 < n) : ZHatIndex :=
  ⟨n, hn⟩

private abbrev ZHatAmbient : Type 0 :=
  ∀ i : ZHatIndex, ZMod i.modulus

private def zHatDiagonal : ℤ →+* ZHatAmbient where
  toFun a i := (a : ZMod i.modulus)
  map_zero' := by
    funext i
    exact Int.cast_zero
  map_one' := by
    funext i
    exact Int.cast_one
  map_add' a b := by
    funext i
    exact Int.cast_add a b
  map_mul' a b := by
    funext i
    exact Int.cast_mul a b

private def zHatIntegerSubring : Subring ZHatAmbient :=
  zHatDiagonal.range

private abbrev ZHatClosureModel : Type 0 :=
  zHatIntegerSubring.topologicalClosure

/-- The profinite completion `ℤ̂ = lim ℤ/nℤ` over all positive moduli.

This is deliberately a `def`, rather than an `abbrev`: clients use the
reduction maps and the representation equivalence below instead of depending
on the closure subtype. -/
def ZHat : Type 0 :=
  ZHatClosureModel

/-- The closure model equips `ZHat` with its canonical commutative ring structure. -/
instance : CommRing ZHat := by
  change CommRing ZHatClosureModel
  infer_instance

/-- The closure model equips `ZHat` with its subspace topology. -/
instance : TopologicalSpace ZHat := by
  change TopologicalSpace ZHatClosureModel
  infer_instance

/-- Ring operations on `ZHat` are continuous for the closure-model topology. -/
instance : IsTopologicalRing ZHat := by
  change IsTopologicalRing ZHatClosureModel
  infer_instance

/-- The closure-model topology on `ZHat` is Hausdorff. -/
instance : T2Space ZHat := by
  change T2Space ZHatClosureModel
  infer_instance

/-- The profinite integer model is totally disconnected. -/
instance : TotallyDisconnectedSpace ZHat := by
  change TotallyDisconnectedSpace ZHatClosureModel
  infer_instance

/-- The profinite integer closure model is compact. -/
instance : CompactSpace ZHat :=
  Topology.IsClosedEmbedding.compactSpace
    (Subring.isClosed_topologicalClosure zHatIntegerSubring).isClosedEmbedding_subtypeVal

/-- `ZHat` as Mathlib's bundled profinite additive group. -/
def zHatProfiniteAddGrp : ProfiniteAddGrp :=
  ProfiniteAddGrp.of ZHat

/-- The multiplicative presentation of `ZHat` remains totally disconnected. -/
instance : TotallyDisconnectedSpace (Multiplicative ZHat) := by
  change TotallyDisconnectedSpace ZHat
  infer_instance

/-- The multiplicative presentation of `ZHat` as Mathlib's bundled profinite
group.  Its multiplication is addition in `ZHat`. -/
def zHatMulProfiniteGrp : ProfiniteGrp :=
  ProfiniteGrp.of (Multiplicative ZHat)

/-- The canonical continuous reduction `ℤ̂ → ℤ/nℤ`. -/
def zHatReduction (n : ℕ) (hn : 0 < n) :
    ContinuousAddMonoidHom ZHat (ZMod n) where
  toFun x := (show ZHatClosureModel from x).1 (zHatIndex n hn)
  map_zero' := rfl
  map_add' _ _ := rfl
  continuous_toFun := by
    change Continuous
      (fun x : ZHatClosureModel => x.1 (zHatIndex n hn))
    exact (continuous_apply (zHatIndex n hn)).comp continuous_subtype_val

/-- Reduction agrees with the ordinary integer cast.  This is the public
computation rule; it does not expose the closure model used to construct
`ZHat`. -/
@[simp] theorem zHatReduction_intCast (n : ℕ) (hn : 0 < n) (a : ℤ) :
    zHatReduction n hn (a : ZHat) = (a : ZMod n) :=
  rfl

/-- Reduction modulo one sends every profinite integer to the unique residue class. -/
@[simp] theorem zHatReduction_one (n : ℕ) (hn : 0 < n) :
    zHatReduction n hn (1 : ZHat) = 1 := by
  simpa only [Int.cast_one] using zHatReduction_intCast n hn 1

namespace ZHat

/-- Profinite integers are determined by all positive-modulus reductions. -/
theorem ext {x y : ZHat}
    (h : ∀ n (hn : 0 < n), zHatReduction n hn x = zHatReduction n hn y) :
    x = y := by
  apply Subtype.ext
  funext i
  rcases i with ⟨n, hn⟩
  exact h n hn

end ZHat

/-- Reduction maps commute with reduction along a divisibility relation. -/
theorem zHatReduction_transition {m n : ℕ}
    (hm : 0 < m) (hn : 0 < n) (hmn : m ∣ n) (x : ZHat) :
    ZMod.castHom hmn (ZMod m) (zHatReduction n hn x) =
      zHatReduction m hm x := by
  let f : ZHatAmbient → ZMod m :=
    fun z => ZMod.castHom hmn (ZMod m) (z (zHatIndex n hn))
  let g : ZHatAmbient → ZMod m :=
    fun z => z (zHatIndex m hm)
  have hfg : Set.EqOn f g (zHatIntegerSubring : Set ZHatAmbient) := by
    rintro _ ⟨a, rfl⟩
    exact map_intCast (ZMod.castHom hmn (ZMod m)) a
  have hf : Continuous f :=
    continuous_of_discreteTopology.comp (continuous_apply (zHatIndex n hn))
  have hg : Continuous g :=
    continuous_apply (zHatIndex m hm)
  exact hfg.closure hf hg x.property

/-- The ordinary integers have dense image in their profinite completion. -/
theorem denseRange_intCast_zHat :
    DenseRange (Int.castRingHom ZHat) := by
  have hinclusion : DenseRange
      (Set.inclusion (Subring.le_topologicalClosure zHatIntegerSubring)) := by
    apply (denseRange_inclusion_iff
      (Subring.le_topologicalClosure zHatIntegerSubring)).2
    change closure (zHatIntegerSubring : Set ZHatAmbient) ⊆
      closure (zHatIntegerSubring : Set ZHatAmbient)
    exact Set.Subset.rfl
  have hdiagonal : DenseRange zHatDiagonal.rangeRestrict :=
    zHatDiagonal.rangeRestrict_surjective.denseRange
  have hcomp : DenseRange
      (Set.inclusion (Subring.le_topologicalClosure zHatIntegerSubring) ∘
        zHatDiagonal.rangeRestrict) :=
    hinclusion.comp hdiagonal
      (continuous_inclusion
        (Subring.le_topologicalClosure zHatIntegerSubring))
  have heq :
      Set.inclusion (Subring.le_topologicalClosure zHatIntegerSubring) ∘
          zHatDiagonal.rangeRestrict =
        (fun a : ℤ => Int.castRingHom ZHat a) := by
    funext a
    apply Subtype.ext
    funext i
    rfl
  rw [heq] at hcomp
  exact hcomp

end ClassFormation
end
/- ProfiniteInteger -/
section
namespace ClassFormation
open Set
noncomputable section
/-- Multiplication by `n` on the additive group of the profinite integers. -/
def zHatMulNat (n : ℕ) : ContinuousAddMonoidHom ZHat ZHat where
  toFun := fun x => n • x
  map_zero' := nsmul_zero n
  map_add' := fun x y => nsmul_add x y n
  continuous_toFun := continuous_nsmul n

/-- The defining evaluation formula for `zHatMulNat` is `zHatMulNat n x = n • x`. -/
@[simp]
theorem zHatMulNat_apply (n : ℕ) (x : ZHat) :
    zHatMulNat n x = n • x :=
  rfl

/-- The image `n ℤ̂` is closed. -/
theorem isClosed_zHatMulNat_range (n : ℕ) :
    IsClosed ((zHatMulNat n).toAddMonoidHom.range : Set ZHat) := by
  rw [AddMonoidHom.coe_range]
  exact (isCompact_range (map_continuous (zHatMulNat n))).isClosed

/-- Establishes the identity `zHatReduction n hn ((Int.castRingHom ZHat) a) = (a : ZMod n)`. -/
@[simp]
theorem zHatReduction_int (n : ℕ) (hn : 0 < n) (a : ℤ) :
    zHatReduction n hn
        ((Int.castRingHom ZHat) a) =
      (a : ZMod n) :=
  rfl

/-- Reduction modulo a positive integer is onto. -/
theorem zHatReduction_surjective (n : ℕ) (hn : 0 < n) :
    Function.Surjective (zHatReduction n hn) := by
  intro a
  rcases ZMod.intCast_surjective a with ⟨a, rfl⟩
  exact ⟨(Int.castRingHom ZHat) a, rfl⟩

/--
Establishes the identity `zHatMulNat n ((Int.castRingHom ZHat) a) = (Int.castRingHom ZHat) ((n :
ℤ) * a)`.
-/
@[simp]
theorem zHatMulNat_int (n : ℕ) (a : ℤ) :
    zHatMulNat n ((Int.castRingHom ZHat) a) =
      (Int.castRingHom ZHat) ((n : ℤ) * a) := by
  apply ZHat.ext
  intro m hm
  change n • (a : ZMod m) = (((n : ℤ) * a : ℤ) : ZMod m)
  simp [nsmul_eq_mul]

/-- The subgroup `n ℤ̂` is exactly the kernel of reduction modulo `n`. -/
theorem zHatMulNat_range_eq_ker_reduction (n : ℕ) (hn : 0 < n) :
    (zHatMulNat n).toAddMonoidHom.range =
      (zHatReduction n hn).toAddMonoidHom.ker := by
  apply AddSubgroup.ext
  intro y
  constructor
  · rintro ⟨x, rfl⟩
    change zHatReduction n hn (zHatMulNat n x) = 0
    change n • zHatReduction n hn x = 0
    simp [nsmul_eq_mul]
  · intro hy
    let K : Set ZHat :=
      ((zHatReduction n hn).toAddMonoidHom.ker : Set ZHat)
    let D : Set ZHat :=
      Set.range (Int.castRingHom ZHat)
    have hKopen : IsOpen K := by
      change IsOpen ((zHatReduction n hn) ⁻¹' ({0} : Set (ZMod n)))
      have hzeroOpen : IsOpen ({0} : Set (ZMod n)) := isOpen_discrete _
      exact hzeroOpen.preimage (map_continuous (zHatReduction n hn))
    have hDdense : Dense D := by
      exact denseRange_intCast_zHat
    have hKD : K ∩ D ⊆
        ((zHatMulNat n).toAddMonoidHom.range : Set ZHat) := by
      rintro _ ⟨hzK, a, rfl⟩
      have ha0 : (a : ZMod n) = 0 := by
        simpa [K] using hzK
      have hna : (n : ℤ) ∣ a :=
        (ZMod.intCast_zmod_eq_zero_iff_dvd a n).mp ha0
      rcases hna with ⟨b, rfl⟩
      refine ⟨(Int.castRingHom ZHat) b, ?_⟩
      exact zHatMulNat_int n b
    have hyClosure : y ∈ closure (K ∩ D) :=
      (hDdense.open_subset_closure_inter hKopen) hy
    exact (closure_minimal hKD (isClosed_zHatMulNat_range n)) hyClosure

end
end ClassFormation
end
/- ProfiniteIntegerPrimeProduct -/
section
/-!
# Prime decomposition of the profinite integers

This file constructs the canonical map
`ℤ̂ → ∏ p : Nat.Primes, ℤ_p` from the compatible finite reductions.
-/

open scoped Topology

noncomputable section

namespace ClassFormation

local instance profiniteIntegerPrimeProductFact (p : Nat.Primes) : Fact p.1.Prime :=
  ⟨p.2⟩

/-- The product of the additive rings of `p`-adic integers over all
rational primes. -/
abbrev ProfiniteIntegerPrimeProduct :=
  ∀ p : Nat.Primes, ℤ_[p.1]

/-- The ring form of the canonical reduction `ℤ̂ → ℤ/nℤ`. -/
def zHatReductionRingHom (n : ℕ) (hn : 0 < n) :
    ZHat →+* ZMod n where
  toFun := zHatReduction n hn
  map_zero' := rfl
  map_one' := rfl
  map_add' _ _ := rfl
  map_mul' _ _ := rfl

@[simp]
theorem zHatReductionRingHom_apply
    (n : ℕ) (hn : 0 < n) (z : ZHat) :
    zHatReductionRingHom n hn z = zHatReduction n hn z :=
  rfl

/-- The compatible `p`-power reductions of a profinite integer. -/
def zHatPadicReduction (p : Nat.Primes) (n : ℕ) :
    ZHat →+* ZMod (p.1 ^ n) :=
  zHatReductionRingHom (p.1 ^ n) (pow_pos p.2.pos n)

theorem zHatPadicReduction_compatible
    (p : Nat.Primes) (m n : ℕ) (hmn : m ≤ n) :
    (ZMod.castHom (pow_dvd_pow p.1 hmn) (ZMod (p.1 ^ m))).comp
        (zHatPadicReduction p n) =
      zHatPadicReduction p m := by
  ext z
  exact zHatReduction_transition
    (pow_pos p.2.pos m) (pow_pos p.2.pos n)
    (pow_dvd_pow p.1 hmn) z

/-- The `p`-adic coordinate of a profinite integer. -/
def zHatToPadicInt (p : Nat.Primes) :
    ZHat →+* ℤ_[p.1] :=
  PadicInt.lift (zHatPadicReduction_compatible p)

@[simp]
theorem toZModPow_zHatToPadicInt
    (p : Nat.Primes) (n : ℕ) :
    (PadicInt.toZModPow n).comp (zHatToPadicInt p) =
      zHatPadicReduction p n :=
  PadicInt.lift_spec (zHatPadicReduction_compatible p) n

/-- The canonical ring homomorphism `ℤ̂ → ∏ₚ ℤ_p`. -/
def zHatToProfiniteIntegerPrimeProduct :
    ZHat →+* ProfiniteIntegerPrimeProduct :=
  RingHom.pi zHatToPadicInt

@[simp]
theorem zHatToProfiniteIntegerPrimeProduct_apply
    (z : ZHat) (p : Nat.Primes) :
    zHatToProfiniteIntegerPrimeProduct z p =
      zHatToPadicInt p z :=
  rfl

/-- The prime-coordinate map separates profinite integers. -/
theorem zHatToProfiniteIntegerPrimeProduct_injective :
    Function.Injective zHatToProfiniteIntegerPrimeProduct := by
  intro x y hxy
  apply ZHat.ext
  intro n hn
  let e := ZMod.equivPi (n := n) hn.ne'
  apply e.injective
  funext p
  have hpPrime : p.1.Prime :=
    Nat.prime_of_mem_primeFactors p.2
  let p' : Nat.Primes := ⟨p.1, hpPrime⟩
  have hpCoord :=
    congrArg (fun z : ProfiniteIntegerPrimeProduct => z p') hxy
  have hpReduction :=
    congrArg (PadicInt.toZModPow (n.factorization p.1)) hpCoord
  change
    ((PadicInt.toZModPow (n.factorization p.1)).comp
        (zHatToPadicInt p')) x =
      ((PadicInt.toZModPow (n.factorization p.1)).comp
        (zHatToPadicInt p')) y at hpReduction
  rw [toZModPow_zHatToPadicInt] at hpReduction
  have hpReduction' :
      zHatReduction (p.1 ^ n.factorization p.1)
          (pow_pos hpPrime.pos _) x =
        zHatReduction (p.1 ^ n.factorization p.1)
          (pow_pos hpPrime.pos _) y := by
    exact hpReduction
  have hpowDvd :
      p.1 ^ n.factorization p.1 ∣ n :=
    (hpPrime.pow_dvd_iff_le_factorization hn.ne').2 le_rfl
  have hcast :
      ZMod.castHom hpowDvd
          (ZMod (p.1 ^ n.factorization p.1))
          (zHatReduction n hn x) =
        ZMod.castHom hpowDvd
          (ZMod (p.1 ^ n.factorization p.1))
          (zHatReduction n hn y) := by
    rw [zHatReduction_transition
        (pow_pos hpPrime.pos _) hn hpowDvd x,
      zHatReduction_transition
        (pow_pos hpPrime.pos _) hn hpowDvd y]
    exact hpReduction'
  have heval (z : ZMod n) :
      e z p =
        ZMod.castHom hpowDvd
          (ZMod (p.1 ^ n.factorization p.1)) z := by
    change
      ((Pi.evalRingHom
          (fun q : n.primeFactors =>
            ZMod (q.1 ^ n.factorization q.1)) p).comp
        e.toRingHom) z =
        ZMod.castHom hpowDvd
          (ZMod (p.1 ^ n.factorization p.1)) z
    exact RingHom.congr_fun (Subsingleton.elim _ _) z
  rw [heval, heval]
  exact hcast

/-- Each `p`-adic coordinate map is continuous. -/
theorem continuous_zHatToPadicInt (p : Nat.Primes) :
    Continuous (zHatToPadicInt p) := by
  apply continuous_of_continuousAt_zero
    (zHatToPadicInt p).toAddMonoidHom
  rw [ContinuousAt, Metric.nhds_basis_closedBall.tendsto_right_iff]
  intro ε hε
  obtain ⟨n, hn⟩ := PadicInt.exists_pow_neg_lt p.1 hε
  let K : Set ZHat :=
    (zHatPadicReduction p n).toAddMonoidHom.ker
  have hKopen : IsOpen K := by
    change IsOpen
      ((zHatReduction (p.1 ^ n) (pow_pos p.2.pos n)) ⁻¹'
        ({0} : Set (ZMod (p.1 ^ n))))
    exact (isOpen_discrete ({0} : Set (ZMod (p.1 ^ n)))).preimage
      (zHatReduction (p.1 ^ n) (pow_pos p.2.pos n)).continuous
  have hKzero : (0 : ZHat) ∈ K := by
    change zHatPadicReduction p n 0 = 0
    exact map_zero _
  apply Filter.mem_of_superset (hKopen.mem_nhds hKzero)
  intro z hz
  change zHatPadicReduction p n z = 0 at hz
  have hmod :
      PadicInt.toZModPow n (zHatToPadicInt p z) = 0 := by
    have hspec :=
      RingHom.congr_fun (toZModPow_zHatToPadicInt p n) z
    rw [RingHom.comp_apply] at hspec
    rw [hspec]
    exact hz
  have hmem :
      zHatToPadicInt p z ∈
        Ideal.span ({(p.1 : ℤ_[p.1]) ^ n} : Set ℤ_[p.1]) := by
    rw [← PadicInt.ker_toZModPow n, RingHom.mem_ker]
    exact hmod
  simp only [Set.mem_ofPred_eq, map_zero]
  change zHatToPadicInt p z ∈
    Metric.closedBall (0 : ℤ_[p.1]) ε
  rw [Metric.mem_closedBall, dist_zero_right]
  exact (PadicInt.norm_le_pow_iff_mem_span_pow
    (zHatToPadicInt p z) n).2 hmem |>.trans hn.le

/-- The canonical map to the full prime product is continuous. -/
theorem continuous_zHatToProfiniteIntegerPrimeProduct :
    Continuous zHatToProfiniteIntegerPrimeProduct :=
  continuous_pi continuous_zHatToPadicInt

/-- The diagonal copy of `ℤ` is dense in the product of all `ℤ_p`.
This is the topological form of the finite Chinese remainder theorem. -/
theorem denseRange_intCast_profiniteIntegerPrimeProduct :
    DenseRange
      (Int.castRingHom ProfiniteIntegerPrimeProduct) := by
  apply dense_iff_inter_open.mpr
  rintro U hU ⟨x, hx⟩
  obtain ⟨S, u, hu, hSu⟩ :=
    isOpen_pi_iff.mp hU x hx
  have hNhd (p : ↥S) :
      u p.1 ∈ 𝓝 (x p.1) :=
    (hu p.1 p.2).1.mem_nhds (hu p.1 p.2).2
  choose ε hε hεsub using fun p : ↥S =>
    Metric.nhds_basis_closedBall.mem_iff.mp (hNhd p)
  choose k hk using fun p : ↥S =>
    PadicInt.exists_pow_neg_lt p.1.1 (hε p)
  let modulus : ↥S → ℕ :=
    fun p => p.1.1 ^ k p
  have hcoprime :
      Pairwise (fun p q : ↥S =>
        Nat.Coprime (modulus p) (modulus q)) := by
    intro p q hpq
    apply Nat.coprime_pow_primes
      (k p) (k q) p.1.2 q.1.2
    intro hpval
    apply hpq
    apply Subtype.ext
    apply Nat.Primes.coe_nat_injective
    exact hpval
  let target : ∀ p : ↥S, ZMod (modulus p) :=
    fun p => PadicInt.toZModPow (k p) (x p.1)
  let crt :=
    ZMod.prodEquivPi modulus hcoprime
  obtain ⟨a, ha⟩ :=
    ZMod.intCast_surjective (crt.symm target)
  use Int.castRingHom ProfiniteIntegerPrimeProduct a
  refine ⟨hSu ?_, a, rfl⟩
  intro p hp
  let pS : ↥S := ⟨p, hp⟩
  apply hεsub pS
  rw [Metric.mem_closedBall, dist_eq_norm]
  have hres :
      PadicInt.toZModPow (k pS)
          ((a : ℤ_[p.1])) =
        PadicInt.toZModPow (k pS) (x p) := by
    have heval (z : ZMod (∏ q : ↥S, modulus q)) :
        crt z pS =
          ZMod.castHom
            (Finset.dvd_prod_of_mem modulus (Finset.mem_univ pS))
            (ZMod (modulus pS)) z := by
      change
        ((Pi.evalRingHom
            (fun q : ↥S => ZMod (modulus q)) pS).comp
          crt.toRingHom) z =
          ZMod.castHom
            (Finset.dvd_prod_of_mem modulus (Finset.mem_univ pS))
            (ZMod (modulus pS)) z
      exact RingHom.congr_fun (Subsingleton.elim _ _) z
    calc
      PadicInt.toZModPow (k pS) ((a : ℤ_[p.1])) =
          (a : ZMod (modulus pS)) := by
            simp [modulus, pS]
      _ =
          ZMod.castHom
            (Finset.dvd_prod_of_mem modulus (Finset.mem_univ pS))
            (ZMod (modulus pS))
            (a : ZMod (∏ q : ↥S, modulus q)) := by
              exact
                (map_intCast
                  (ZMod.castHom
                    (Finset.dvd_prod_of_mem modulus
                      (Finset.mem_univ pS))
                    (ZMod (modulus pS))) a).symm
      _ = crt (a : ZMod (∏ q : ↥S, modulus q)) pS :=
            (heval (a : ZMod (∏ q : ↥S, modulus q))).symm
      _ = crt (crt.symm target) pS := by rw [ha]
      _ = target pS := congrFun (crt.apply_symm_apply target) pS
      _ = PadicInt.toZModPow (k pS) (x p) := by
            rfl
  have hmem :
      (a : ℤ_[p.1]) - x p ∈
        Ideal.span
          ({(p.1 : ℤ_[p.1]) ^ k pS} : Set ℤ_[p.1]) := by
    rw [← PadicInt.ker_toZModPow (k pS), RingHom.mem_ker,
      map_sub, hres, sub_self]
  exact
    (PadicInt.norm_le_pow_iff_mem_span_pow
      ((a : ℤ_[p.1]) - x p) (k pS)).2 hmem |>.trans
      (hk pS).le

@[simp]
theorem zHatToPadicInt_intCast
    (p : Nat.Primes) (a : ℤ) :
    zHatToPadicInt p (a : ZHat) = (a : ℤ_[p.1]) :=
  map_intCast (zHatToPadicInt p) a

@[simp]
theorem zHatToProfiniteIntegerPrimeProduct_intCast
    (a : ℤ) :
    zHatToProfiniteIntegerPrimeProduct (a : ZHat) =
      Int.castRingHom ProfiniteIntegerPrimeProduct a := by
  funext p
  exact zHatToPadicInt_intCast p a

/-- The canonical map from the profinite integers to the product of all
`p`-adic integers is onto.  Compactness closes its range, while the finite
Chinese remainder theorem makes that range dense. -/
theorem zHatToProfiniteIntegerPrimeProduct_surjective :
    Function.Surjective zHatToProfiniteIntegerPrimeProduct := by
  have hsubset :
      Set.range (Int.castRingHom ProfiniteIntegerPrimeProduct) ⊆
        Set.range zHatToProfiniteIntegerPrimeProduct := by
    rintro y ⟨a, rfl⟩
    exact
      ⟨(a : ZHat),
        zHatToProfiniteIntegerPrimeProduct_intCast a⟩
  have hdense :
      Dense (Set.range zHatToProfiniteIntegerPrimeProduct) :=
    denseRange_intCast_profiniteIntegerPrimeProduct.mono hsubset
  have hclosed :
      IsClosed (Set.range zHatToProfiniteIntegerPrimeProduct) :=
    (isCompact_range
      continuous_zHatToProfiniteIntegerPrimeProduct).isClosed
  intro y
  have hy :
      y ∈ closure
        (Set.range zHatToProfiniteIntegerPrimeProduct) := by
    rw [hdense.closure_eq]
    trivial
  rwa [hclosed.closure_eq] at hy

/-- The Chinese-remainder ring equivalence
`ℤ̂ ≃ ∏ p : Nat.Primes, ℤ_p`. -/
noncomputable def zHatRingEquivProfiniteIntegerPrimeProduct :
    ZHat ≃+* ProfiniteIntegerPrimeProduct :=
  RingEquiv.ofBijective zHatToProfiniteIntegerPrimeProduct
    ⟨zHatToProfiniteIntegerPrimeProduct_injective,
      zHatToProfiniteIntegerPrimeProduct_surjective⟩

@[simp]
theorem zHatRingEquivProfiniteIntegerPrimeProduct_apply
    (z : ZHat) :
    zHatRingEquivProfiniteIntegerPrimeProduct z =
      zHatToProfiniteIntegerPrimeProduct z :=
  rfl

/-- The Chinese-remainder ring equivalence is a homeomorphism. -/
theorem isHomeomorph_zHatRingEquivProfiniteIntegerPrimeProduct :
    IsHomeomorph zHatRingEquivProfiniteIntegerPrimeProduct := by
  rw [isHomeomorph_iff_continuous_bijective]
  exact
    ⟨continuous_zHatToProfiniteIntegerPrimeProduct,
      (zHatRingEquivProfiniteIntegerPrimeProduct :
        ZHat ≃ ProfiniteIntegerPrimeProduct).bijective⟩

end ClassFormation

end
end
/- ProfiniteIntegerUnits -/
section
/-!
# Units of the profinite integers

This file upgrades the prime-product Chinese-remainder equivalence for
`ℤ̂` to topological additive, multiplicative, and unit-group equivalences.
-/

open scoped Topology

noncomputable section

namespace ClassFormation

/-- The Chinese-remainder isomorphism as a topological monoid equivalence. -/
noncomputable def zHatContinuousMulEquivPrimeProduct :
    ZHat ≃ₜ* ProfiniteIntegerPrimeProduct :=
  ContinuousMulEquiv.mk'
    (continuous_zHatToProfiniteIntegerPrimeProduct.homeoOfEquivCompactToT2
      (f := zHatRingEquivProfiniteIntegerPrimeProduct.toEquiv))
    zHatRingEquivProfiniteIntegerPrimeProduct.map_mul

/-- The additive form of the topological Chinese-remainder isomorphism. -/
noncomputable def zHatContinuousAddEquivPrimeProduct :
    ZHat ≃ₜ+ ProfiniteIntegerPrimeProduct :=
  { zHatRingEquivProfiniteIntegerPrimeProduct.toAddEquiv with
    continuous_toFun :=
      zHatContinuousMulEquivPrimeProduct.continuous_toFun
    continuous_invFun :=
      zHatContinuousMulEquivPrimeProduct.continuous_invFun }

local instance profiniteIntegerUnitsFact (p : Nat.Primes) : Fact p.1.Prime :=
  ⟨p.2⟩

/-- The canonical topological Chinese-remainder equivalence on unit
groups. -/
noncomputable def zHatUnitsContinuousMulEquivPrimeProduct :
    ZHatˣ ≃ₜ* ((p : Nat.Primes) → ℤ_[p.1]ˣ) :=
  (Units.mapContinuousMulEquiv
    zHatContinuousMulEquivPrimeProduct).trans
      ContinuousMulEquiv.piUnits

/-- On underlying ring elements, the unit-group Chinese-remainder
equivalence is the canonical `p`-adic coordinate map. -/
@[simp]
theorem zHatUnitsContinuousMulEquivPrimeProduct_coe_apply
    (u : ZHatˣ) (p : Nat.Primes) :
    (zHatUnitsContinuousMulEquivPrimeProduct u p : ℤ_[p.1]) =
      zHatToPadicInt p (u : ZHat) :=
  rfl

end ClassFormation

end
end
/- TunnellProfiniteCoordinate -/
section
/-! Transport between the coordinate presentation of the profinite integers and cyclotomic degree data. -/
namespace TunnellProfiniteCoordinate
open ClassFormation Topology Set
open scoped Classical
noncomputable section
abbrev R := ∀ n:ℕ+,ZMod (n:ℕ)
abbrev Z := (Int.castRingHom R).range.topologicalClosure
def evalHom : ZHat →+ R := AddMonoidHom.pi (fun n:ℕ+ => (zHatReduction n n.property).toAddMonoidHom)
theorem eval_cont : Continuous evalHom :=
  continuous_pi (fun n => (zHatReduction n n.property).continuous)
theorem eval_int (z:ℤ) : evalHom (z:ZHat) = (Int.castRingHom R) z := by ext n; exact zHatReduction_intCast n n.property z
theorem inRange (x:ZHat) : evalHom x ∈ Z := by
  have dense : DenseRange (Int.cast : ℤ → ZHat) := denseRange_intCast_zHat
  have h : Continuous fun y:ZHat=>evalHom y := eval_cont
  have closed : IsClosed ((evalHom : ZHat → R) ⁻¹' (Z : Set R)) := (isClosed_closure (s:=((Int.castRingHom R).range : Set R))).preimage h
  exact dense.induction_on x closed (fun z => eval_int z ▸ Subring.le_topologicalClosure _ ⟨z,rfl⟩)
def coords : ZHat →+ Z.toAddSubgroup := evalHom.codRestrict Z.toAddSubgroup inRange
theorem bijective : Function.Bijective coords := by
  constructor
  · intro a b h
    apply ZHat.ext
    intro n hn
    exact congrFun (congrArg Subtype.val h) ⟨n,hn⟩
  · intro x
    have closed : IsClosed (Set.range evalHom) := isCompact_range eval_cont |>.isClosed
    have contains : ((Int.castRingHom R).range : Set R) ⊆ Set.range evalHom := by
      rintro _ ⟨z,rfl⟩
      exact ⟨_,eval_int z⟩
    obtain ⟨y,hy⟩ := closure_minimal contains closed x.property
    exact ⟨y,Subtype.ext hy⟩
def equiv : ZHat ≃+ Z := AddEquiv.ofBijective coords bijective
theorem continuous_equiv : Continuous equiv := eval_cont.subtype_mk _
theorem continuous_inv : Continuous equiv.symm :=
  (Continuous.homeoOfEquivCompactToT2 continuous_equiv).symm.continuous
end
end TunnellProfiniteCoordinate
end

/- RationalCyclotomicField -/
section
/-!
# The rational cyclotomic closure

This file constructs the actual field `ℚ(μ∞)` inside `SeparableClosure ℚ`.
It uses mathlib's general `IsCyclotomicExtension` API, so the infinite
field and its finite cyclotomic levels are not replaced by abstract copies
of their expected Galois groups.

The finite levels form the divisibility-directed system whose supremum is
the whole cyclotomic field.  This supplies the field-theoretic source for
the rational cyclotomic calculation.
-/

noncomputable section

namespace KummerTheory

/-- The actual field `ℚ(μ∞)` in a fixed separable closure of `ℚ`. -/
def rationalCyclotomicField :
    IntermediateField ℚ (SeparableClosure ℚ) :=
  IntermediateField.adjoin ℚ
    {ζ : SeparableClosure ℚ |
      ∃ n ∈ (Set.univ : Set ℕ), n ≠ 0 ∧ ζ ^ n = 1}

/-- The field `ℚ(μ∞)` is the cyclotomic extension generated by roots of
unity of all positive orders. -/
noncomputable instance rationalCyclotomicField_isCyclotomicExtension :
    IsCyclotomicExtension (Set.univ : Set ℕ) ℚ
      rationalCyclotomicField := by
  exact
    IntermediateField.isCyclotomicExtension_adjoin_of_exists_isPrimitiveRoot
      (Set.univ : Set ℕ) ℚ (SeparableClosure ℚ)
      (fun n _hn hn0 =>
        IsCyclotomicExtension.exists_isPrimitiveRoot
          (S := (Set.univ : Set ℕ))
          (SeparableClosure ℚ) (SeparableClosure ℚ)
          (Set.mem_univ n) hn0)

/-- The actual infinite rational cyclotomic extension is abelian Galois. -/
noncomputable instance rationalCyclotomicField_isAbelianGalois :
    IsAbelianGalois ℚ rationalCyclotomicField :=
  IsCyclotomicExtension.isAbelianGalois
    (Set.univ : Set ℕ) ℚ rationalCyclotomicField

/-- The `n`-th finite cyclotomic level inside `ℚ(μ∞)`.  Positive naturals
are used so that the zero-order degeneracy cannot enter the directed
system. -/
def rationalCyclotomicLevel (n : ℕ+) :
    IntermediateField ℚ rationalCyclotomicField :=
  IntermediateField.adjoin ℚ
    {ζ : rationalCyclotomicField |
      ∃ m ∈ ({(n : ℕ)} : Set ℕ),
        m ≠ 0 ∧ ζ ^ m = 1}

/-- Each internal finite level is the standard singleton cyclotomic
extension. -/
noncomputable instance rationalCyclotomicLevel_isCyclotomicExtension
    (n : ℕ+) :
    IsCyclotomicExtension {(n : ℕ)} ℚ
      (rationalCyclotomicLevel n) := by
  exact
    IntermediateField.isCyclotomicExtension_adjoin_of_exists_isPrimitiveRoot
      {(n : ℕ)} ℚ rationalCyclotomicField
      (fun m _hm _hm0 =>
        IsCyclotomicExtension.exists_isPrimitiveRoot
          (S := (Set.univ : Set ℕ))
          ℚ rationalCyclotomicField
          (Set.mem_univ m) _hm0)

/-- Every finite internal cyclotomic level is Galois over `ℚ`. -/
noncomputable instance rationalCyclotomicLevel_isGalois
    (n : ℕ+) :
    IsGalois ℚ (rationalCyclotomicLevel n) :=
  IsCyclotomicExtension.isGalois
    {(n : ℕ)} ℚ (rationalCyclotomicLevel n)

/-- A finite level of `ℚ(μ∞)` carries mathlib's standard number-field
structure coming from its singleton cyclotomic presentation. -/
noncomputable instance rationalCyclotomicLevel_numberField
    (n : ℕ+) :
    NumberField (rationalCyclotomicLevel n) :=
  IsCyclotomicExtension.numberField
    {(n : ℕ)} ℚ (rationalCyclotomicLevel n)

/-- Divisibility of orders gives the canonical inclusion between internal
cyclotomic levels. -/
theorem rationalCyclotomicLevel_mono
    {m n : ℕ+}
    (h : (m : ℕ) ∣ (n : ℕ)) :
    rationalCyclotomicLevel m ≤
      rationalCyclotomicLevel n :=
  IntermediateField.isCyclotomicExtension_le_of_dvd
    ℚ rationalCyclotomicField (m : ℕ) (n : ℕ)
    (rationalCyclotomicLevel m)
    (rationalCyclotomicLevel n)
    (h₁ := rationalCyclotomicLevel_isCyclotomicExtension m)
    (h₂ := rationalCyclotomicLevel_isCyclotomicExtension n)
    h

/-- The internal finite cyclotomic levels exhaust `ℚ(μ∞)`. -/
theorem iSup_rationalCyclotomicLevel :
    (⨆ n : ℕ+, rationalCyclotomicLevel n) = ⊤ := by
  have htop :
      IntermediateField.adjoin ℚ
          {ζ : rationalCyclotomicField |
            ∃ n : ℕ, n ∈ (Set.univ : Set ℕ) ∧
              n ≠ 0 ∧ ζ ^ n = 1} =
        ⊤ :=
    IntermediateField.adjoin_eq_top_of_algebra ℚ _
      ((IsCyclotomicExtension.iff_adjoin_eq_top
        (Set.univ : Set ℕ) ℚ rationalCyclotomicField).1
          inferInstance).2
  apply le_antisymm le_top
  rw [← htop, IntermediateField.adjoin_le_iff]
  rintro ζ ⟨n, _hn, hn0, hpow⟩
  let npos : ℕ+ := ⟨n, Nat.pos_of_ne_zero hn0⟩
  exact
    (le_iSup
      (fun m : ℕ+ => rationalCyclotomicLevel m) npos)
      (IntermediateField.subset_adjoin ℚ
        {x : rationalCyclotomicField |
          ∃ m ∈ ({(npos : ℕ)} : Set ℕ),
            m ≠ 0 ∧ x ^ m = 1}
        (by
          refine
            ⟨(npos : ℕ), by simp, npos.ne_zero, ?_⟩
          change ζ ^ n = 1
          exact hpow))

end KummerTheory

end
end

/- RationalCyclotomicCharacter -/
section
/-!
# The cyclotomic character of the rational cyclotomic field

This file assembles mathlib's `p`-adic cyclotomic characters of the
actual extension `rationalCyclotomicField / ℚ`.  Their product takes
values in the canonical product of the local unit groups, and the
topological Chinese-remainder equivalence identifies that product with
`ZHatˣ`.

No abstract copy of either the Galois group or its expected target is
introduced here.
-/

noncomputable section

namespace KummerTheory

open ClassFormation

/-- The actual rational cyclotomic field contains primitive roots of
unity of every nonzero order. -/
noncomputable instance rationalCyclotomicField_hasEnoughRootsOfUnity
    (n : ℕ) [NeZero n] :
    HasEnoughRootsOfUnity rationalCyclotomicField n where
  prim :=
    IsCyclotomicExtension.exists_isPrimitiveRoot
      (S := (Set.univ : Set ℕ))
      ℚ rationalCyclotomicField (Set.mem_univ n) (NeZero.ne n)
  cyc := rootsOfUnity.isCyclic rationalCyclotomicField n

local instance rationalCyclotomicCharacterFact (p : Nat.Primes) : Fact p.1.Prime :=
  ⟨p.2⟩

/-- The product, over all rational primes, of mathlib's `p`-adic
cyclotomic characters of `Gal(rationalCyclotomicField / ℚ)`. -/
noncomputable def rationalCyclotomicCharacterPrimeProduct :
    (rationalCyclotomicField ≃ₐ[ℚ] rationalCyclotomicField) →ₜ*
      ((p : Nat.Primes) → ℤ_[p.1]ˣ) where
  toMonoidHom :=
    MonoidHom.pi fun p =>
      (cyclotomicCharacter rationalCyclotomicField p.1).comp
        (MulSemiringAction.toRingAut
          (rationalCyclotomicField ≃ₐ[ℚ] rationalCyclotomicField)
          rationalCyclotomicField)
  continuous_toFun :=
    continuous_pi fun p =>
      cyclotomicCharacter.continuous
        p.1 ℚ rationalCyclotomicField

/-- Evaluation at a prime is the corresponding mathlib cyclotomic
character. -/
@[simp]
theorem rationalCyclotomicCharacterPrimeProduct_apply
    (σ : rationalCyclotomicField ≃ₐ[ℚ] rationalCyclotomicField)
    (p : Nat.Primes) :
    rationalCyclotomicCharacterPrimeProduct σ p =
      cyclotomicCharacter rationalCyclotomicField p.1
        (MulSemiringAction.toRingAut
          (rationalCyclotomicField ≃ₐ[ℚ] rationalCyclotomicField)
          rationalCyclotomicField σ) :=
  rfl

section PrimePowerCharacter

-- Expose the exact prime-power index to Lean 4.33 instance matching. Both
-- proposition-valued instances are supplied by the existing canonical factories.
local instance primePowerLevelNumberField (p : Nat.Primes) (k : ℕ) :
    NumberField (rationalCyclotomicLevel ⟨p.1 ^ k, pow_pos p.2.pos k⟩) :=
  rationalCyclotomicLevel_numberField ⟨p.1 ^ k, pow_pos p.2.pos k⟩

local instance primePowerLevelIsGalois (p : Nat.Primes) (k : ℕ) :
    IsGalois ℚ (rationalCyclotomicLevel ⟨p.1 ^ k, pow_pos p.2.pos k⟩) :=
  rationalCyclotomicLevel_isGalois ⟨p.1 ^ k, pow_pos p.2.pos k⟩

/-- Reduction of the `p`-coordinate modulo `p ^ k` is the standard
mathlib character of the finite internal cyclotomic level. -/
theorem rationalCyclotomicCharacterPrimeProduct_toZModPow
    (σ : rationalCyclotomicField ≃ₐ[ℚ] rationalCyclotomicField)
    (p : Nat.Primes) (k : ℕ) :
    Units.map (PadicInt.toZModPow k).toMonoidHom
        (rationalCyclotomicCharacterPrimeProduct σ p) =
      IsCyclotomicExtension.Rat.galEquivZMod
        (p.1 ^ k)
        (rationalCyclotomicLevel
          ⟨p.1 ^ k, pow_pos p.2.pos k⟩)
        (hK :=
          rationalCyclotomicLevel_isCyclotomicExtension
            ⟨p.1 ^ k, pow_pos p.2.pos k⟩)
        (σ.restrictNormal
          (rationalCyclotomicLevel
            ⟨p.1 ^ k, pow_pos p.2.pos k⟩)) := by
  let n : ℕ+ := ⟨p.1 ^ k, pow_pos p.2.pos k⟩
  let F := rationalCyclotomicLevel n
  let : IsCyclotomicExtension {p.1 ^ k} ℚ F := by
    change IsCyclotomicExtension {(n : ℕ)} ℚ (rationalCyclotomicLevel n)
    exact rationalCyclotomicLevel_isCyclotomicExtension n
  let ζ : F :=
    IsCyclotomicExtension.zeta (p.1 ^ k) ℚ F
  have hζ : IsPrimitiveRoot ζ (p.1 ^ k) :=
    IsCyclotomicExtension.zeta_spec (p.1 ^ k) ℚ F
  let t : rationalCyclotomicField :=
    algebraMap F rationalCyclotomicField ζ
  have ht : t ^ (p.1 ^ k) = 1 := by
    dsimp only [t]
    rw [← map_pow, hζ.pow_eq_one, map_one]
  let g : rationalCyclotomicField ≃+* rationalCyclotomicField :=
    MulSemiringAction.toRingAut
      (rationalCyclotomicField ≃ₐ[ℚ] rationalCyclotomicField)
      rationalCyclotomicField σ
  have hinfinite :
      g t =
        t ^ ((cyclotomicCharacter
          rationalCyclotomicField p.1 g).val.toZModPow k).val :=
    cyclotomicCharacter.spec p.1 g t ht
  have hfinite :
      (σ.restrictNormal F) ζ =
        ζ ^ (IsCyclotomicExtension.Rat.galEquivZMod
          (p.1 ^ k) F (σ.restrictNormal F)).val.val :=
    IsCyclotomicExtension.Rat.galEquivZMod_apply_of_pow_eq
      (p.1 ^ k) F (σ.restrictNormal F) hζ.pow_eq_one
  have hζmap : IsPrimitiveRoot t (p.1 ^ k) := by
    exact hζ.map_of_injective
      (algebraMap F rationalCyclotomicField).injective
  change
    Units.map (PadicInt.toZModPow k).toMonoidHom
        (rationalCyclotomicCharacterPrimeProduct σ p) =
      IsCyclotomicExtension.Rat.galEquivZMod
        (p.1 ^ k) F (σ.restrictNormal F)
  apply Units.ext
  apply ZMod.val_injective
  apply hζmap.pow_inj (ZMod.val_lt _) (ZMod.val_lt _)
  calc
    t ^ ((PadicInt.toZModPow k)
        (rationalCyclotomicCharacterPrimeProduct σ p).val).val =
        g t := by
      rw [rationalCyclotomicCharacterPrimeProduct_apply]
      exact hinfinite.symm
    _ = σ t := rfl
    _ = algebraMap F rationalCyclotomicField
        ((σ.restrictNormal F) ζ) :=
      (AlgEquiv.restrictNormal_commutes σ F ζ).symm
    _ = algebraMap F rationalCyclotomicField
        (ζ ^ (IsCyclotomicExtension.Rat.galEquivZMod
          (p.1 ^ k) F (σ.restrictNormal F)).val.val) := by
      rw [hfinite]
    _ = t ^ (IsCyclotomicExtension.Rat.galEquivZMod
        (p.1 ^ k) F (σ.restrictNormal F)).val.val := by
      rw [map_pow]

end PrimePowerCharacter

/-- The rational cyclotomic character with its canonical profinite
integer-unit target. -/
noncomputable def rationalCyclotomicCharacter :
    (rationalCyclotomicField ≃ₐ[ℚ] rationalCyclotomicField) →ₜ* ZHatˣ :=
  (ContinuousMonoidHom.toContinuousMonoidHom
    zHatUnitsContinuousMulEquivPrimeProduct.symm).comp
      rationalCyclotomicCharacterPrimeProduct

end KummerTheory

end
end

/- RationalCyclotomicCharacterEquiv -/
section
/-!
# The rational cyclotomic character equivalence

Finite cyclotomic levels are detected by their prime-power reductions,
using mathlib's Chinese-remainder equivalence for `ZMod`.  Surjectivity
is obtained from the finite-intersection property for the closed fibers
of the restriction maps to those levels.
-/

noncomputable section

namespace KummerTheory

open ClassFormation

local instance rationalCyclotomicCharacterEquivFact (p : Nat.Primes) : Fact p.1.Prime :=
  ⟨p.2⟩

/-- The `p ^ k` reduction of the cyclotomic character can be read from
any finite cyclotomic level whose order is divisible by `p ^ k`. -/
theorem rationalCyclotomicCharacterPrimeProduct_toZModPow_of_dvd
    (σ : rationalCyclotomicField ≃ₐ[ℚ] rationalCyclotomicField)
    (p : Nat.Primes) (k : ℕ) (n : ℕ+)
    (h : p.1 ^ k ∣ (n : ℕ)) :
    Units.map (PadicInt.toZModPow k).toMonoidHom
        (rationalCyclotomicCharacterPrimeProduct σ p) =
      ZMod.unitsMap h
        (IsCyclotomicExtension.Rat.galEquivZMod
          (n : ℕ) (rationalCyclotomicLevel n)
          (σ.restrictNormal (rationalCyclotomicLevel n))) := by
  let m : ℕ+ := ⟨p.1 ^ k, pow_pos p.2.pos k⟩
  let F := rationalCyclotomicLevel m
  let K := rationalCyclotomicLevel n
  let : IsCyclotomicExtension {p.1 ^ k} ℚ F := by
    change IsCyclotomicExtension {(m : ℕ)} ℚ
      (rationalCyclotomicLevel m)
    exact rationalCyclotomicLevel_isCyclotomicExtension m
  have hFK : F ≤ K :=
    rationalCyclotomicLevel_mono h
  let ζ : F :=
    IsCyclotomicExtension.zeta (p.1 ^ k) ℚ F
  have hζ : IsPrimitiveRoot ζ (p.1 ^ k) :=
    IsCyclotomicExtension.zeta_spec (p.1 ^ k) ℚ F
  let x : rationalCyclotomicField :=
    algebraMap F rationalCyclotomicField ζ
  have hζx : IsPrimitiveRoot x (p.1 ^ k) :=
    hζ.map_of_injective
      (algebraMap F rationalCyclotomicField).injective
  let y : K :=
    IntermediateField.inclusion hFK ζ
  have hy : y ^ (n : ℕ) = 1 := by
    apply Subtype.ext
    change x ^ (n : ℕ) = 1
    exact (hζx.pow_eq_one_iff_dvd _).2 h
  let a :=
    IsCyclotomicExtension.Rat.galEquivZMod
      (p.1 ^ k) F (σ.restrictNormal F)
  let b :=
    IsCyclotomicExtension.Rat.galEquivZMod
      (n : ℕ) K (σ.restrictNormal K)
  have ha :
      (σ.restrictNormal F) ζ =
        ζ ^ a.val.val := by
    exact
      IsCyclotomicExtension.Rat.galEquivZMod_apply_of_pow_eq
        (p.1 ^ k) F (σ.restrictNormal F) hζ.pow_eq_one
  have hb :
      (σ.restrictNormal K) y =
        y ^ b.val.val := by
    exact
      IsCyclotomicExtension.Rat.galEquivZMod_apply_of_pow_eq
        (n : ℕ) K (σ.restrictNormal K) hy
  change
    Units.map (PadicInt.toZModPow k).toMonoidHom
        (rationalCyclotomicCharacterPrimeProduct σ p) =
      ZMod.unitsMap h b
  calc
    Units.map (PadicInt.toZModPow k).toMonoidHom
        (rationalCyclotomicCharacterPrimeProduct σ p) =
        a := by
      simpa only [a, F, m] using
        rationalCyclotomicCharacterPrimeProduct_toZModPow σ p k
    _ = ZMod.unitsMap h b := by
      suffices x ^ a.val.val = x ^ b.val.val by
        rw [(hζx.isOfFinOrder (NeZero.ne _)).pow_inj_mod,
          ← hζx.eq_orderOf,
          ← ZMod.natCast_eq_natCast_iff',
          ZMod.natCast_val, ZMod.natCast_val,
          ZMod.cast_id] at this
        rwa [Units.ext_iff]
      calc
        x ^ a.val.val =
            algebraMap F rationalCyclotomicField
              (ζ ^ a.val.val) := by
          rw [map_pow]
        _ = algebraMap F rationalCyclotomicField
              ((σ.restrictNormal F) ζ) := by
          rw [ha]
        _ = σ x :=
          AlgEquiv.restrictNormal_commutes σ F ζ
        _ = algebraMap K rationalCyclotomicField
              ((σ.restrictNormal K) y) :=
          (AlgEquiv.restrictNormal_commutes σ K y).symm
        _ = algebraMap K rationalCyclotomicField
              (y ^ b.val.val) := by
          rw [hb]
        _ = x ^ b.val.val := by
          rw [map_pow]
          congr 1

/-- The product of the `p`-adic cyclotomic characters separates
automorphisms of the actual rational cyclotomic field. -/
theorem rationalCyclotomicCharacterPrimeProduct_injective :
    Function.Injective rationalCyclotomicCharacterPrimeProduct := by
  intro σ τ hστ
  have hrestrict (n : ℕ+) :
      σ.restrictNormal (rationalCyclotomicLevel n) =
        τ.restrictNormal (rationalCyclotomicLevel n) := by
    let K := rationalCyclotomicLevel n
    apply
      (IsCyclotomicExtension.Rat.galEquivZMod
        (n : ℕ) K).injective
    apply Units.ext
    let e :=
      ZMod.equivPi (n := (n : ℕ)) n.2.ne'
    apply e.injective
    funext q
    have hqPrime : q.1.Prime :=
      Nat.prime_of_mem_primeFactors q.2
    let p : Nat.Primes := ⟨q.1, hqPrime⟩
    let k := (n : ℕ).factorization q.1
    have hpow :
        p.1 ^ k ∣ (n : ℕ) :=
      (hqPrime.pow_dvd_iff_le_factorization n.2.ne').2 le_rfl
    have hpCoordinate :=
      congrArg (fun z => z p) hστ
    have hpReduction :=
      congrArg (Units.map (PadicInt.toZModPow k).toMonoidHom)
        hpCoordinate
    rw [
      rationalCyclotomicCharacterPrimeProduct_toZModPow_of_dvd
        σ p k n hpow,
      rationalCyclotomicCharacterPrimeProduct_toZModPow_of_dvd
        τ p k n hpow] at hpReduction
    have heval (z : ZMod (n : ℕ)) :
        e z q =
          ZMod.castHom hpow (ZMod (p.1 ^ k)) z := by
      change
        ((Pi.evalRingHom
            (fun r : (n : ℕ).primeFactors =>
              ZMod (r.1 ^ (n : ℕ).factorization r.1)) q).comp
          e.toRingHom) z =
            ZMod.castHom hpow (ZMod (p.1 ^ k)) z
      exact RingHom.congr_fun (Subsingleton.elim _ _) z
    rw [heval, heval]
    simpa only [p, k, ZMod.unitsMap_val,
      ZMod.castHom_apply] using
      congrArg
        (fun u : (ZMod (p.1 ^ k))ˣ =>
          (u : ZMod (p.1 ^ k)))
        hpReduction
  let E : IntermediateField ℚ rationalCyclotomicField :=
    { AlgHom.equalizer σ.toAlgHom τ.toAlgHom with
      inv_mem' := by
        intro x hx
        change σ x = τ x at hx
        change σ x⁻¹ = τ x⁻¹
        simpa only [map_inv₀] using congrArg Inv.inv hx }
  have hlevel (n : ℕ+) :
      rationalCyclotomicLevel n ≤ E := by
    intro x hx
    change σ x = τ x
    let y : rationalCyclotomicLevel n := ⟨x, hx⟩
    calc
      σ x =
          algebraMap (rationalCyclotomicLevel n)
            rationalCyclotomicField
            ((σ.restrictNormal
              (rationalCyclotomicLevel n)) y) :=
        (AlgEquiv.restrictNormal_commutes σ
          (rationalCyclotomicLevel n) y).symm
      _ = algebraMap (rationalCyclotomicLevel n)
            rationalCyclotomicField
            ((τ.restrictNormal
              (rationalCyclotomicLevel n)) y) := by
        rw [hrestrict n]
      _ = τ x :=
        AlgEquiv.restrictNormal_commutes τ
          (rationalCyclotomicLevel n) y
  have hE : E = ⊤ := by
    apply top_unique
    rw [← iSup_rationalCyclotomicLevel]
    exact iSup_le hlevel
  apply AlgEquiv.ext
  intro x
  have hx : x ∈ E := by
    rw [hE]
    trivial
  change x ∈ AlgHom.equalizer σ.toAlgHom τ.toAlgHom at hx
  exact (AlgHom.mem_equalizer σ.toAlgHom τ.toAlgHom x).mp hx

/-- The canonical rational cyclotomic character is injective. -/
theorem rationalCyclotomicCharacter_injective :
    Function.Injective rationalCyclotomicCharacter := by
  intro σ τ hστ
  apply rationalCyclotomicCharacterPrimeProduct_injective
  have h :=
    congrArg
      (fun u : ZHatˣ =>
        zHatUnitsContinuousMulEquivPrimeProduct u)
      hστ
  simpa [rationalCyclotomicCharacter] using h

/-- The canonical rational cyclotomic character is surjective. -/
theorem rationalCyclotomicCharacter_surjective :
    Function.Surjective rationalCyclotomicCharacter := by
  intro u
  let τ (n : ℕ+) :
      rationalCyclotomicLevel n ≃ₐ[ℚ]
        rationalCyclotomicLevel n :=
    (IsCyclotomicExtension.Rat.galEquivZMod
      (n : ℕ) (rationalCyclotomicLevel n)).symm
        (Units.map
          (zHatReductionRingHom (n : ℕ) n.2) u)
  let C (n : ℕ+) :
      Set
        (rationalCyclotomicField ≃ₐ[ℚ]
          rationalCyclotomicField) :=
    {σ |
      σ.restrictNormal (rationalCyclotomicLevel n) = τ n}
  have hclosed (n : ℕ+) : IsClosed (C n) := by
    let : FiniteDimensional ℚ (rationalCyclotomicLevel n) :=
      IsCyclotomicExtension.finiteDimensional
        {(n : ℕ)} ℚ (rationalCyclotomicLevel n)
    change IsClosed
      {σ :
          rationalCyclotomicField ≃ₐ[ℚ]
            rationalCyclotomicField |
        σ.restrictNormal (rationalCyclotomicLevel n) = τ n}
    refine @isClosed_eq
      (rationalCyclotomicLevel n ≃ₐ[ℚ]
        rationalCyclotomicLevel n)
      (rationalCyclotomicField ≃ₐ[ℚ]
        rationalCyclotomicField)
      inferInstance inferInstance krullTopology_t2
      _ _ ?_ ?_
    · exact
        InfiniteGalois.restrictNormalHom_continuous
          (k := ℚ) (K := rationalCyclotomicField)
          (rationalCyclotomicLevel n)
    · exact continuous_const
  have hfip (s : Finset ℕ+) :
      (⋂ n ∈ s, C n).Nonempty := by
    let N : ℕ+ :=
      ⟨∏ n ∈ s, (n : ℕ),
        Finset.prod_pos fun n _ => n.2⟩
    obtain ⟨σ, hσN⟩ :=
      (AlgEquiv.restrictNormalHom_surjective
        (F := ℚ)
        (K₁ := rationalCyclotomicLevel N)
        (E := rationalCyclotomicField)) (τ N)
    refine ⟨σ, ?_⟩
    rw [Set.mem_iInter₂]
    intro n hn
    have hnN : (n : ℕ) ∣ (N : ℕ) := by
      change
        (n : ℕ) ∣
          ∏ m ∈ s, (m : ℕ)
      exact
        Finset.dvd_prod_of_mem
          (fun m : ℕ+ => (m : ℕ)) hn
    let F := rationalCyclotomicLevel n
    let K := rationalCyclotomicLevel N
    have hFK : F ≤ K :=
      rationalCyclotomicLevel_mono hnN
    let algFK : Algebra F K :=
      RingHom.toAlgebra
        (IntermediateField.inclusion hFK).toRingHom
    let : SMul F K :=
      @Algebra.toSMul F K _ _ algFK
    let : Algebra F K := algFK
    let : IsScalarTower ℚ F K :=
      IsScalarTower.of_algebraMap_eq' rfl
    let : IsScalarTower ℚ F rationalCyclotomicField :=
      IsScalarTower.of_algebraMap_eq' rfl
    let : IsScalarTower ℚ K rationalCyclotomicField :=
      IsScalarTower.of_algebraMap_eq' rfl
    let : IsScalarTower F K rationalCyclotomicField :=
      IsScalarTower.of_algebraMap_eq' rfl
    have hτ :
        (AlgEquiv.restrictNormalHom F) (τ N) = τ n := by
      apply
        (IsCyclotomicExtension.Rat.galEquivZMod
          (n : ℕ) F).injective
      change
        IsCyclotomicExtension.Rat.galEquivZMod
            (n : ℕ) F ((τ N).restrictNormal F) =
          IsCyclotomicExtension.Rat.galEquivZMod
            (n : ℕ) F (τ n)
      rw [
        IsCyclotomicExtension.Rat.galEquivZMod_restrictNormal_apply
          (N : ℕ) K F hnN (τ N)]
      simp only [K, F, τ, MulEquiv.apply_symm_apply]
      apply Units.ext
      change
        ZMod.castHom hnN (ZMod (n : ℕ))
            (zHatReduction (N : ℕ) N.2 (u : ZHat)) =
          zHatReduction (n : ℕ) n.2 (u : ZHat)
      exact
        zHatReduction_transition
          n.2 N.2 hnN (u : ZHat)
    change σ.restrictNormal F = τ n
    calc
      σ.restrictNormal F =
          (AlgEquiv.restrictNormalHom F)
            ((AlgEquiv.restrictNormalHom K) σ) :=
        IsScalarTower.AlgEquiv.restrictNormalHom_comp_apply F K σ
      _ = (AlgEquiv.restrictNormalHom F) (τ N) := by
        have hσN' :
            (AlgEquiv.restrictNormalHom K) σ = τ N := by
          simpa only [K] using hσN
        exact congrArg
          (AlgEquiv.restrictNormalHom F)
          hσN'
      _ = τ n := hτ
  obtain ⟨σ, hσ⟩ :=
    CompactSpace.iInter_nonempty hclosed hfip
  refine ⟨σ, ?_⟩
  apply zHatUnitsContinuousMulEquivPrimeProduct.injective
  change
    zHatUnitsContinuousMulEquivPrimeProduct
        (zHatUnitsContinuousMulEquivPrimeProduct.symm
          (rationalCyclotomicCharacterPrimeProduct σ)) =
      zHatUnitsContinuousMulEquivPrimeProduct u
  rw [
    zHatUnitsContinuousMulEquivPrimeProduct.apply_symm_apply]
  funext p
  apply Units.ext
  apply PadicInt.ext_of_toZModPow.mp
  intro k
  let n : ℕ+ :=
    ⟨p.1 ^ k, pow_pos p.2.pos k⟩
  have hσn : σ ∈ C n :=
    Set.mem_iInter.mp hσ n
  change
    σ.restrictNormal (rationalCyclotomicLevel n) =
      τ n at hσn
  have hleft :=
    rationalCyclotomicCharacterPrimeProduct_toZModPow
      σ p k
  rw [hσn] at hleft
  change
    Units.map (PadicInt.toZModPow k).toMonoidHom
        (rationalCyclotomicCharacterPrimeProduct σ p) =
      (IsCyclotomicExtension.Rat.galEquivZMod
        (n : ℕ) (rationalCyclotomicLevel n))
        ((IsCyclotomicExtension.Rat.galEquivZMod
          (n : ℕ) (rationalCyclotomicLevel n)).symm
          (Units.map
            (zHatReductionRingHom (n : ℕ) n.2).toMonoidHom u))
      at hleft
  rw [MulEquiv.apply_symm_apply] at hleft
  have hright :
      Units.map (PadicInt.toZModPow k).toMonoidHom
          (zHatUnitsContinuousMulEquivPrimeProduct u p) =
        Units.map
          (zHatReductionRingHom
            (p.1 ^ k) (pow_pos p.2.pos k)) u := by
    apply Units.ext
    change
      PadicInt.toZModPow k
          (zHatUnitsContinuousMulEquivPrimeProduct u p :
            ℤ_[p.1]) =
        zHatReduction (p.1 ^ k)
          (pow_pos p.2.pos k) (u : ZHat)
    rw [
      zHatUnitsContinuousMulEquivPrimeProduct_coe_apply]
    simpa only [RingHom.comp_apply, zHatPadicReduction,
      zHatReductionRingHom_apply] using
      RingHom.congr_fun
        (toZModPow_zHatToPadicInt p k) (u : ZHat)
  exact
    congrArg
      (fun z : (ZMod (p.1 ^ k))ˣ =>
        (z : ZMod (p.1 ^ k)))
      (hleft.trans hright.symm)

/-- The canonical topological equivalence
`Gal(ℚ(μ∞)/ℚ) ≃ ℤ̂ˣ`. -/
noncomputable def rationalCyclotomicCharacterContinuousMulEquiv :
    (rationalCyclotomicField ≃ₐ[ℚ]
      rationalCyclotomicField) ≃ₜ* ZHatˣ :=
  let e :=
    MulEquiv.ofBijective
      rationalCyclotomicCharacter.toMonoidHom
      ⟨rationalCyclotomicCharacter_injective,
        rationalCyclotomicCharacter_surjective⟩
  ContinuousMulEquiv.mk'
    (rationalCyclotomicCharacter.continuous_toFun.homeoOfEquivCompactToT2
      (f := e.toEquiv))
    e.map_mul

/-- Evaluating the actual profinite-unit cyclotomic character at a
prime recovers the corresponding genuine `p`-adic cyclotomic
character. -/
@[simp]
theorem
    zHatUnitsContinuousMulEquivPrimeProduct_rationalCyclotomicCharacter
    (σ :
      rationalCyclotomicField ≃ₐ[ℚ]
        rationalCyclotomicField)
    (p : Nat.Primes) :
    zHatUnitsContinuousMulEquivPrimeProduct
        (rationalCyclotomicCharacterContinuousMulEquiv σ) p =
      rationalCyclotomicCharacterPrimeProduct σ p := by
  change
    zHatUnitsContinuousMulEquivPrimeProduct
        (rationalCyclotomicCharacter σ) p =
      rationalCyclotomicCharacterPrimeProduct σ p
  have h :=
    zHatUnitsContinuousMulEquivPrimeProduct.apply_symm_apply
      (rationalCyclotomicCharacterPrimeProduct σ)
  exact congrFun h p

end KummerTheory

end
end

/- TunnellRationalDegreeCoordinates -/
section
/-! Construct the rational procyclic degree from the finite cyclotomic character and surjective local logarithms. -/

namespace TunnellRationalDegreeCoordinates
open ClassFormation KummerTheory
noncomputable section
local instance (p : Nat.Primes) : Fact p.val.Prime := ⟨p.property⟩
abbrev P := ProfiniteIntegerPrimeProduct
abbrev U := (p : Nat.Primes) → ℤ_[p.val]ˣ
abbrev Z := TunnellProfiniteCoordinate.Z
abbrev G := Gal(SeparableClosure ℚ/ℚ)

local instance : IsGalois ℚ (SeparableClosure ℚ) :=
  @IsSepClosure.isGalois ℚ _ (SeparableClosure ℚ) _
    ((separableClosure ℚ (AlgebraicClosure ℚ)).algebra)
    (separableClosure.isSepClosure ℚ (AlgebraicClosure ℚ))

def chi : G →* U :=
  zHatUnitsContinuousMulEquivPrimeProduct.toMulEquiv.toMonoidHom.comp
    (rationalCyclotomicCharacterContinuousMulEquiv.toMulEquiv.toMonoidHom.comp
      (AlgEquiv.restrictNormalHom (F:=ℚ) (K₁:=SeparableClosure ℚ) rationalCyclotomicField))

theorem chi_cont : Continuous chi := by
  letI : @Normal ℚ rationalCyclotomicField _ _ rationalCyclotomicField.algebra' := by
    rw [show rationalCyclotomicField.algebra' = (inferInstance : Algebra ℚ rationalCyclotomicField) from Subsingleton.elim _ _]
    exact rationalCyclotomicField_isAbelianGalois.toIsGalois.to_normal
  exact zHatUnitsContinuousMulEquivPrimeProduct.continuous.comp
    (rationalCyclotomicCharacterContinuousMulEquiv.continuous.comp
      (InfiniteGalois.restrictNormalHom_continuous rationalCyclotomicField))

theorem chi_surj : Function.Surjective chi := zHatUnitsContinuousMulEquivPrimeProduct.surjective.comp
  (rationalCyclotomicCharacterContinuousMulEquiv.surjective.comp
    (AlgEquiv.restrictNormalHom_surjective (F:=ℚ) (K₁:=rationalCyclotomicField) (E:=SeparableClosure ℚ)))

end
end TunnellRationalDegreeCoordinates
end

/- TunnellCyclotomicConductors -/
section
/-! Full finite cyclotomic conductors detect the closure of a group of local units. -/
namespace TunnellCyclotomicConductors
open Set ClassFormation TunnellRationalDegreeCoordinates
noncomputable section

def reduction (m : ℕ+) : U →* (ZMod m.val)ˣ :=
  (Units.map (zHatReductionRingHom m.val m.property).toMonoidHom).comp
    zHatUnitsContinuousMulEquivPrimeProduct.symm.toMulEquiv.toMonoidHom

theorem reduction_cont (m : ℕ+) : Continuous (reduction m) :=
  (continuous_of_discreteTopology (f:=id)).comp
    (((zHatReduction m.val m.property).continuous.units_map (zHatReductionRingHom m.val m.property).toMonoidHom).comp
    zHatUnitsContinuousMulEquivPrimeProduct.symm.continuous)

theorem reduce_dvd (m n : ℕ+) (hn : m.val ∣ n.val) (u : U) :
    ZMod.unitsMap hn (reduction n u) = reduction m u := by
  apply Units.ext
  exact zHatReduction_transition m.property n.property hn _

end
end TunnellCyclotomicConductors
end

/- TunnellRayCoordinateUnits -/
section
/-! The unit group of the integral-coordinate model carries the finite conductor projections. -/
namespace TunnellRayCoordinateUnits
open ClassFormation TunnellRationalDegreeCoordinates TunnellProfiniteCoordinate
noncomputable section
def ring : ZHat ≃+* TunnellProfiniteCoordinate.Z where
  __ := equiv
  map_mul' a b := Subtype.ext (funext (fun n => (zHatReductionRingHom n.val n.property).map_mul a b))

def E : U ≃* TunnellProfiniteCoordinate.Zˣ :=
  zHatUnitsContinuousMulEquivPrimeProduct.symm.toMulEquiv.trans (Units.mapEquiv ring.toMulEquiv)
theorem cont : Continuous E :=
  (continuous_equiv.units_map ring.toRingHom.toMonoidHom).comp zHatUnitsContinuousMulEquivPrimeProduct.symm.continuous
theorem inv_cont : Continuous E.symm :=
  zHatUnitsContinuousMulEquivPrimeProduct.continuous.comp (continuous_inv.units_map ring.symm.toRingHom.toMonoidHom)
def ev (m : ℕ+) : TunnellProfiniteCoordinate.Zˣ →* (ZMod m.val)ˣ :=
  Units.map (((Pi.evalRingHom (fun n : ℕ+ => ZMod n.val) m).comp TunnellProfiniteCoordinate.Z.subtype).toMonoidHom)
theorem ev_E (m : ℕ+) (u : U) : ev m (E u)=TunnellCyclotomicConductors.reduction m u := Units.ext rfl
end
end TunnellRayCoordinateUnits
end

/- TunnellCyclotomicDegreeLevels -/
section
/-! The finite reductions of the rational degree character act on primitive roots by their exponents. -/
namespace TunnellCyclotomicDegreeLevels
open ClassFormation KummerTheory TunnellRationalDegreeCoordinates TunnellCyclotomicConductors
noncomputable section
local instance (p : Nat.Primes) : Fact p.val.Prime := ⟨p.property⟩

theorem prime_projection (p : Nat.Primes) (k : ℕ) (u : U) :
    Units.map (PadicInt.toZModPow k).toMonoidHom (u p)=reduction ⟨p.val^k,pow_pos p.property.pos k⟩ u := by
  obtain ⟨x,rfl⟩ := zHatUnitsContinuousMulEquivPrimeProduct.surjective u
  apply Units.ext
  change PadicInt.toZModPow k (zHatToPadicInt p x.val) = zHatReductionRingHom _ _
    (zHatUnitsContinuousMulEquivPrimeProduct.symm (zHatUnitsContinuousMulEquivPrimeProduct x)).val
  rw [ContinuousMulEquiv.symm_apply_apply]
  exact RingHom.congr_fun (toZModPow_zHatToPadicInt p k) x.val

abbrev res (s : G) : Gal(rationalCyclotomicField/ℚ) :=
  (AlgEquiv.restrictNormalHom (F:=ℚ) (K₁:=SeparableClosure ℚ) rationalCyclotomicField) s

theorem finite_level (m : ℕ+) (s : G) :
    reduction m (chi s) = IsCyclotomicExtension.Rat.galEquivZMod m.val (rationalCyclotomicLevel m)
      ((res s).restrictNormal (rationalCyclotomicLevel m)) := by
  let r := IsCyclotomicExtension.Rat.galEquivZMod m.val (rationalCyclotomicLevel m) ((res s).restrictNormal _)
  let e := ZMod.equivPi (n:=m.val) m.property.ne'
  apply Units.ext
  apply e.injective
  funext i
  let p : Nat.Primes := ⟨i.val,Nat.prime_of_mem_primeFactors i.property⟩
  let k := m.val.factorization p.val
  have d : p.val^k ∣ m.val := (p.property.pow_dvd_iff_le_factorization m.property.ne').mpr le_rfl
  let n : ℕ+ := ⟨p.val^k,pow_pos p.property.pos k⟩
  have ev (t : ZMod m.val) : e t i = ZMod.castHom d (ZMod n.val) t := by
    exact RingHom.congr_fun (Subsingleton.elim
      ((Pi.evalRingHom (fun j : m.val.primeFactors => ZMod (j.val ^ m.val.factorization j.val)) i).comp e.toRingHom)
      (ZMod.castHom d (ZMod n.val))) t
  have coord : chi s p=rationalCyclotomicCharacterPrimeProduct (res s) p :=
    zHatUnitsContinuousMulEquivPrimeProduct_rationalCyclotomicCharacter (res s) p
  have eq : ZMod.unitsMap d (reduction m (chi s))=ZMod.unitsMap d r :=
    (reduce_dvd n m d (chi s)).trans ((prime_projection p k (chi s)).symm.trans
      ((congrArg (Units.map (PadicInt.toZModPow k).toMonoidHom) coord).trans
        (rationalCyclotomicCharacterPrimeProduct_toZModPow_of_dvd (res s) p k m d)))
  rw [ev,ev]
  exact congrArg Units.val eq

end
end TunnellCyclotomicDegreeLevels
end

/- TunnellFixedCyclotomicImage -/
section
/-! Restriction to a finite cyclotomic extension computes the image of the fixing subgroup on roots of unity. -/
namespace TunnellFixedCyclotomicImage
open NumberField IntermediateField TunnellRationalDegreeCoordinates
noncomputable section
variable {m : ℕ} [NeZero m]

theorem eq_exponents {E : Type*} [CommMonoid E] {z : E} (hz : IsPrimitiveRoot z m)
    {a b : (ZMod m)ˣ} (eq : z^(a.val.val)=z^(b.val.val)) : a=b := by
  rw [(hz.isOfFinOrder (NeZero.ne _)).pow_inj_mod,←hz.eq_orderOf] at eq
  apply Units.ext
  exact (ZMod.natCast_zmod_val a.val).symm.trans (((ZMod.natCast_eq_natCast_iff' _ _ _).mpr eq).trans (ZMod.natCast_zmod_val b.val))

abbrev Ω := SeparableClosure ℚ
theorem image (F : IntermediateField ℚ Ω) (E : IntermediateField F Ω) [Normal F E]
    {z : E} (h : IsPrimitiveRoot z m) (root : IsPrimitiveRoot (z : Ω) m) [Normal F Ω] :
    (h.autToPow F).range = F.fixingSubgroup.map (root.autToPow ℚ) := by
  let r : Gal(Ω/F) →* Gal(E/F) := AlgEquiv.restrictNormalHom E
  have comp (s : Gal(Ω/F)) : h.autToPow F (r s)=root.autToPow ℚ (s.restrictScalars ℚ) := by
    apply eq_exponents root
    calc
      (z : Ω)^_ = ((z^((h.autToPow F (r s)).val.val) : E) : Ω) := rfl
      _ = ((r s z : E) : Ω) := congrArg Subtype.val (h.autToPow_spec F (r s))
      _ = s (z : Ω) := AlgEquiv.restrictNormal_commutes s E z
      _ = (z:Ω)^_ := (root.autToPow_spec ℚ (s.restrictScalars ℚ)).symm
  ext x
  constructor
  · rintro ⟨t,rfl⟩
    obtain ⟨s,hs⟩ := (AlgEquiv.restrictNormalHom_surjective (F:=F) (K₁:=E) (E:=Ω)) t
    refine ⟨s.restrictScalars ℚ,(F.fixingSubgroupEquiv.symm s).property,?_⟩
    exact (comp s).symm.trans (congrArg (h.autToPow F) hs)
  · rintro ⟨s,hs,rfl⟩
    let t := F.fixingSubgroupEquiv ⟨s,hs⟩
    exact ⟨r t,comp t⟩

end
end TunnellFixedCyclotomicImage
end

/- TunnellCofiniteSplitPublic -/
section
/-! Removing finitely many prime factors preserves a positive linear counting asymptotic. -/
namespace TunnellPrimeMultisets
open Filter Topology
noncomputable section
open scoped Classical

variable {P : Type*}

def weight (w : P → ℕ) (m : Multiset P) : ℕ := (m.map w).prod
@[simp] theorem weight_cons (w : P → ℕ) (p : P) (m : Multiset P) :
    weight w (p ::ₘ m) = w p * weight w m := by simp [weight]
@[simp] theorem weight_add (w : P → ℕ) (m n : Multiset P) :
    weight w (m+n) = weight w m * weight w n := by simp [weight]

abbrev Good (s : Finset P) := {m : Multiset P // ∀ p ∈ s, p ∉ m}
abbrev Cut (w : P → ℕ) (s : Finset P) (x : ℝ) := {m : Good s // (weight w m.val : ℝ) ≤ x}
def count (w : P → ℕ) (s : Finset P) (x : ℝ) := (Nat.card (Cut w s x) : ℝ)

theorem cut_finite (w : P → ℕ) (hf : ∀ x, Finite (Cut w ∅ x)) (s : Finset P) (x : ℝ) :
    Finite (Cut w s x) := by
  haveI := hf x
  apply Finite.of_injective (β:=Cut w ∅ x) (fun m : Cut w s x => (⟨⟨m.val.val,by simp⟩,m.property⟩ : Cut w ∅ x))
  intro a b h
  exact Subtype.ext (Subtype.ext (congrArg (fun t : Cut w ∅ x => t.val.val) h))

def split (w : P → ℕ) (s : Finset P) (p : P) (hp : p ∉ s) (hw : 0 < w p) (x : ℝ) :
    Cut w s x ≃ Cut w (insert p s) x ⊕ Cut w s (x / w p) := by
  classical
  have hpos : (0:ℝ) < w p := by exact_mod_cast hw
  let keep (m : Cut w s x) (h : p ∉ m.val.val) : Cut w (insert p s) x :=
    ⟨⟨m.val.val, fun q hq => (Finset.mem_insert.mp hq).elim (fun e => e ▸ h) (m.val.property q)⟩,m.property⟩
  let erase (m : Cut w s x) (h : p ∈ m.val.val) : Cut w s (x / w p) :=
    ⟨⟨m.val.val.erase p,fun q hq hmem => m.val.property q hq (Multiset.mem_of_mem_erase hmem)⟩,by
      apply (le_div_iff₀ hpos).mpr
      have e := congrArg (weight w) (Multiset.cons_erase h)
      rw [weight_cons] at e
      simpa only [mul_comm, ← Nat.cast_mul, e] using m.property⟩
  let left (m : Cut w (insert p s) x) : Cut w s x :=
    ⟨⟨m.val.val,fun q hq => m.val.property q (Finset.mem_insert_of_mem hq)⟩,m.property⟩
  let right (m : Cut w s (x / w p)) : Cut w s x :=
    ⟨⟨p ::ₘ m.val.val,fun q hq hmem => (Multiset.mem_cons.mp hmem).elim
      (fun e => hp (e ▸ hq)) (m.val.property q hq)⟩,by
      rw [weight_cons,Nat.cast_mul,mul_comm]
      exact (le_div_iff₀ hpos).mp m.property⟩
  let go (m : Cut w s x) : Cut w (insert p s) x ⊕ Cut w s (x / w p) :=
    if h : p ∈ m.val.val then .inr (erase m h) else .inl (keep m h)
  have go_yes (m : Cut w s x) (h : p ∈ m.val.val) : go m = Sum.inr (erase m h) := dif_pos h
  have go_no (m : Cut w s x) (h : p ∉ m.val.val) : go m = Sum.inl (keep m h) := dif_neg h
  refine ⟨go,Sum.elim left right,?_,?_⟩
  · intro m
    by_cases h : p ∈ m.val.val
    · rw [go_yes m h,Sum.elim_inr]
      exact Subtype.ext (Subtype.ext (Multiset.cons_erase h))
    · exact congrArg (Sum.elim left right) (go_no m h)
  · rintro (m|m)
    · have h := m.val.property p (Finset.mem_insert_self _ _)
      exact go_no (left m) h
    · exact (go_yes (right m) (Multiset.mem_cons_self _ _)).trans (congrArg Sum.inr
        (Subtype.ext (Subtype.ext (Multiset.erase_cons_head _ _))))

theorem density (w : P → ℕ) (hw : ∀ p, 1 < w p) (hf : ∀ x, Finite (Cut w ∅ x))
    {c : ℝ} (hc : 0 < c) (h : Tendsto (fun x => count w ∅ x / x) atTop (𝓝 c)) (s : Finset P) :
    ∃ k > 0, Tendsto (fun x => count w s x / x) atTop (𝓝 k) := by
  classical
  induction s using Finset.induction_on with
  | empty => exact ⟨c,hc,h⟩
  | @insert p s hp ih =>
    obtain ⟨k,hk,ht⟩ := ih
    have hp1 : (1:ℝ) < w p := by exact_mod_cast hw p
    have hp0 : (0:ℝ) < w p := by linarith
    have hlim := (ht.comp (tendsto_id.atTop_div_const hp0)).div_const (w p : ℝ)
    have ht' : Tendsto (fun x : ℝ => count w s (x / w p) / x) atTop (𝓝 (k / w p)) := by
      apply hlim.congr
      intro x
      dsimp
      field_simp
    refine ⟨k-k/w p, sub_pos.mpr ((div_lt_iff₀ hp0).mpr <| by nlinarith), ?_⟩
    apply (ht.sub ht').congr
    intro x
    haveI := cut_finite w hf (insert p s) x
    haveI := cut_finite w hf s (x/w p)
    have he := Nat.card_congr (split w s p hp (Nat.zero_lt_of_lt (hw p)) x)
    rw [Nat.card_sum] at he
    have he' : count w s x = count w (insert p s) x + count w s (x/w p) := by
      unfold count
      exact_mod_cast he
    rw [← sub_div,he',add_sub_cancel_right]

end
end TunnellPrimeMultisets
/-! A positive linear counting asymptotic rules out a weight-multiplicative injection of pairs. -/
namespace TunnellIdealCountingBound
open Filter Topology
open scoped Classical
noncomputable section
variable {A B : Type*}

abbrev Cut (w : A → ℕ) (x : ℝ) := {a : A // (w a : ℝ) ≤ x}
def count (w : A → ℕ) (x : ℝ) := (Nat.card (Cut w x) : ℝ)

theorem weight_not_summable (w : A → ℕ) (hp : ∀ a, 0 < w a) (hf : ∀ x, Finite (Cut w x))
    {c : ℝ} (hc : 0 < c) (h : Tendsto (fun x => count w x / x) atTop (𝓝 c)) :
    ¬ Summable (fun a => (w a : ℝ)⁻¹) := by
  classical
  intro hs
  let f (x : ℝ) (a : A) := if (w a : ℝ) ≤ x then x⁻¹ else 0
  have hlim : ∀ a, Tendsto (fun x => f x a) atTop (𝓝 0) := by
    intro a
    apply tendsto_inv_atTop_zero.congr'
    filter_upwards [eventually_ge_atTop (w a:ℝ)] with x hx
    simp [f,hx]
  have hb : ∀ᶠ x : ℝ in atTop, ∀ a, ‖f x a‖ ≤ (w a : ℝ)⁻¹ := by
    filter_upwards [eventually_gt_atTop (0 : ℝ)] with x hx a
    by_cases ha : (w a : ℝ) ≤ x
    · simp only [f,ha,if_true,Real.norm_eq_abs,abs_inv,abs_of_pos hx]
      exact inv_anti₀ (by exact_mod_cast hp a) ha
    · simp [f,ha]
  have hz := tendsto_tsum_of_dominated_convergence hs hlim hb
  have he (x : ℝ) : ∑' a, f x a = count w x / x := by
    haveI := hf x
    letI : Fintype (Cut w x) := Fintype.ofFinite _
    rw [show (f x) = ({a : A | (w a : ℝ) ≤ x} : Set A).indicator (fun _ => x⁻¹) from rfl,
      ← tsum_subtype]
    change (∑' _ : Cut w x, x⁻¹) = _
    rw [tsum_fintype]
    simp [count,Nat.card_eq_fintype_card,div_eq_mul_inv]
  simp only [tsum_zero] at hz
  exact hc.ne' (tendsto_nhds_unique h (hz.congr he))

theorem impossible (w : A → ℕ) (W : B → ℕ) (hp : ∀ a, 0 < w a)
    (hf : ∀ x, Finite (Cut w x)) (hF : ∀ x, Finite (Cut W x)) {c C : ℝ} (hc : 0 < c)
    (h : Tendsto (fun x => count w x / x) atTop (𝓝 c))
    (H : Tendsto (fun x => count W x / x) atTop (𝓝 C))
    (e : A × A ↪ B) (he : ∀ a b, W (e (a,b)) = w a * w b) : False := by
  classical
  apply weight_not_summable w hp hf hc h
  apply summable_of_sum_le (c:=C/c) (fun a => by positivity)
  intro t
  have hpos (a : A) : (0:ℝ) < w a := by exact_mod_cast hp a
  have hcount (x : ℝ) : ∑ a ∈ t, count w (x / w a) ≤ count W x := by
    haveI := hF x
    letI (a : t) : Finite (Cut w (x / w a.val)) := hf _
    let g (v : Σ a : t, Cut w (x / w a.val)) : Cut W x :=
      ⟨e (v.2.val,v.1.val), by rw [he,Nat.cast_mul]; exact (le_div_iff₀ (hpos _)).mp v.2.property⟩
    have hg : Function.Injective g := by
      rintro ⟨a,b⟩ ⟨a',b'⟩ heq
      have hpair := e.injective (congrArg Subtype.val heq)
      have haa : a = a' := Subtype.ext (congrArg Prod.snd hpair)
      subst a'
      have hbb : b = b' := Subtype.ext (congrArg Prod.fst hpair)
      subst b'
      rfl
    have hn := Nat.card_le_card_of_injective g hg
    rw [Nat.card_sigma] at hn
    rw [← Finset.sum_coe_sort t (fun a => count w (x / w a))]
    unfold count
    exact_mod_cast hn
  have tend (a : A) : Tendsto (fun x : ℝ => count w (x/w a)/x) atTop (𝓝 (c/(w a))) := by
    apply (((h.comp (tendsto_id.atTop_div_const (hpos a))).div_const (w a : ℝ))).congr
    intro x
    dsimp
    field_simp [(hpos a).ne']
  have bound : ∑ a ∈ t, c / (w a:ℝ) ≤ C := by
    apply le_of_tendsto_of_tendsto (tendsto_finsetSum t (fun a _ => tend a)) H
    filter_upwards [eventually_ge_atTop (0:ℝ)] with x hx
    rw [← Finset.sum_div]
    exact div_le_div_of_nonneg_right (hcount x) hx
  apply (le_div_iff₀ hc).mpr
  rw [Finset.sum_mul]
  calc
    _ = ∑ a ∈ t, c / (w a : ℝ) := by
      apply Finset.sum_congr rfl
      intro a _
      rw [div_eq_mul_inv,mul_comm]
    _ ≤ _ := bound

end
end TunnellIdealCountingBound
/-! Integral ideals are multisets of prime ideals, with weight their absolute norm. -/
namespace TunnellIdealPrimeWords
open NumberField IsDedekindDomain UniqueFactorizationMonoid TunnellPrimeMultisets Filter Topology
open scoped NumberField nonZeroDivisors Classical
noncomputable section

variable (K : Type) [Field K] [NumberField K]
abbrev P := HeightOneSpectrum (𝓞 K)
abbrev U := (Ideal (𝓞 K))⁰
def wt (p : P K) := Ideal.absNorm p.asIdeal

def ideal (m : Multiset (P K)) : U K := ⟨(m.map HeightOneSpectrum.asIdeal).prod,by
  rw [mem_nonZeroDivisors_iff_ne_zero]
  apply Multiset.prod_ne_zero
  intro h
  obtain ⟨p,_,he⟩ := Multiset.mem_map.mp h
  exact p.ne_bot he⟩

def factors (b : U K) : Multiset (P K) :=
  (normalizedFactors b.val).attach.map (fun p => HeightOneSpectrum.ofPrime (prime_of_normalized_factor p.val p.property))

theorem factors_map (b : U K) :
    (factors K b).map HeightOneSpectrum.asIdeal = normalizedFactors b.val := by
  rw [factors,Multiset.map_map]
  exact Multiset.attach_map_val _

theorem ideal_factors (b : U K) : ideal K (factors K b) = b := by
  apply Subtype.ext
  change ((factors K b).map _).prod = _
  rw [factors_map, Ideal.prod_normalizedFactors_eq_self (nonZeroDivisors.ne_zero b.property)]

theorem factors_ideal (m : Multiset (P K)) : factors K (ideal K m) = m := by
  apply Multiset.map_injective HeightOneSpectrum.asIdeal_injective
  rw [factors_map]
  apply normalizedFactors_prod_of_prime
  rintro q h
  obtain ⟨p,_,rfl⟩ := Multiset.mem_map.mp h
  exact p.prime

theorem norm_ideal (m : Multiset (P K)) : Ideal.absNorm (ideal K m).val = weight (wt K) m := by
  change Ideal.absNorm (m.map HeightOneSpectrum.asIdeal).prod = weight (wt K) m
  induction m using Multiset.induction_on with
  | empty => simp [weight]
  | cons a m ih => simp [ih,wt]

def bounded (x : ℝ) : Cut (wt K) ∅ x ≃ {b : U K // (Ideal.absNorm b.val : ℝ) ≤ x} where
  toFun m := ⟨ideal K m.val.val, by rw [norm_ideal]; exact m.property⟩
  invFun b := ⟨⟨factors K b.val,by simp⟩,by rw [← norm_ideal,ideal_factors]; exact b.property⟩
  left_inv m := Subtype.ext (Subtype.ext (factors_ideal K _))
  right_inv b := Subtype.ext (ideal_factors K _)

theorem finite (x : ℝ) : Finite (Cut (wt K) ∅ x) := by
  haveI : Finite {b : U K // Ideal.absNorm b.val ≤ ⌈x⌉₊} := Ideal.finite_setOfPred_absNorm_le₀ _
  let f (a : Cut (wt K) ∅ x) : {b : U K // Ideal.absNorm b.val ≤ ⌈x⌉₊} :=
    ⟨(bounded K x a).val, by exact_mod_cast (bounded K x a).property.trans (Nat.le_ceil x)⟩
  exact Finite.of_injective f fun a b h =>
    (bounded K x).injective (Subtype.ext (congrArg (fun a : {b : U K // Ideal.absNorm b.val ≤ ⌈x⌉₊} => a.val) h))

theorem wt_gt_one (p : P K) : 1 < wt K p := by
  have hpos := Ideal.absNorm_pos_of_nonZeroDivisors (⟨p.asIdeal,mem_nonZeroDivisors_iff_ne_zero.mpr p.ne_bot⟩ : U K)
  have hne : Ideal.absNorm p.asIdeal ≠ 1 := fun h => p.isPrime.ne_top (Ideal.absNorm_eq_one_iff.mp h)
  change 1 < Ideal.absNorm p.asIdeal
  change 0 < Ideal.absNorm p.asIdeal at hpos
  omega

theorem density_good (s : Finset (P K)) :
    ∃ k > 0, Tendsto (fun x => count (wt K) s x / x) atTop (𝓝 k) := by
  apply density (wt K) (wt_gt_one K) (finite K) (dedekindZeta_residue_pos K) _ s
  apply (NumberField.Ideal.tendsto_norm_le_div_atTop₀ K).congr
  intro x
  unfold count
  rw [Nat.card_congr (bounded K x)]

end
end TunnellIdealPrimeWords
/-! Two disjoint selections of norm-preserving lifts of primes contradict linear ideal counts. -/
namespace TunnellSplitPrimePairs
open TunnellPrimeMultisets TunnellIdealPrimeWords NumberField IsDedekindDomain
open Filter Topology
open scoped Classical NumberField
noncomputable section
variable {P Q : Type*}
abbrev Allowed (s : Finset P) := {p : P // p ∉ s}

def tag {s : Finset P} (m : Good s) : Multiset (Allowed s) :=
  m.val.attach.map fun a => ⟨a.val,fun ha => m.property a.val ha a.property⟩

theorem untag {s : Finset P} (m : Good s) : (tag m).map Subtype.val = m.val := by
  rw [tag,Multiset.map_map]
  exact Multiset.attach_map_val _

theorem tag_injective {s : Finset P} : Function.Injective (tag (s:=s)) := by
  intro a b h
  exact Subtype.ext <| (untag a).symm.trans ((congrArg (Multiset.map Subtype.val) h).trans (untag b))

private theorem strip_left {A B : Type*} (a : Multiset A) (b : Multiset B) :
    (a.disjSum b).filterMap Sum.getLeft? = a := by
  simp only [Multiset.disjSum,Multiset.filterMap_add,Multiset.filterMap_map]
  change a.filterMap some + b.filterMap (fun _ => none) = a
  simp
  induction b using Multiset.induction_on with
  | empty => rfl
  | cons _ _ ih => simpa using ih

private theorem strip_right {A B : Type*} (a : Multiset A) (b : Multiset B) :
    (a.disjSum b).filterMap Sum.getRight? = b := by
  simp only [Multiset.disjSum,Multiset.filterMap_add,Multiset.filterMap_map]
  change a.filterMap (fun _ => none) + b.filterMap some = b
  simp
  induction a using Multiset.induction_on with
  | empty => rfl
  | cons _ _ ih => simpa using ih

def pair {s : Finset P} (l : Allowed s ⊕ Allowed s ↪ Q) : Good s × Good s ↪ Multiset Q where
  toFun a := ((tag a.1).disjSum (tag a.2)).map l
  inj' := by
    rintro ⟨a,b⟩ ⟨a',b'⟩ he
    have h := Multiset.map_injective l.injective he
    apply Prod.ext
    · apply tag_injective
      simpa only [strip_left] using congrArg (Multiset.filterMap Sum.getLeft?) h
    · apply tag_injective
      simpa only [strip_right] using congrArg (Multiset.filterMap Sum.getRight?) h

theorem weight_pair {s : Finset P} (w : P → ℕ) (W : Q → ℕ) (l : Allowed s ⊕ Allowed s ↪ Q)
    (hl : ∀ p, W (l (.inl p)) = w p.val) (hr : ∀ p, W (l (.inr p)) = w p.val) (a b : Good s) :
    weight W (pair l (a,b)) = weight w a.val * weight w b.val := by
  change weight W (((tag a).disjSum (tag b)).map _) = _
  rw [Multiset.map_disjSum, weight_add]
  unfold weight
  rw [Multiset.map_map, Multiset.map_map]
  simp only [Function.comp_def,hl,hr]
  rw [← untag a, ← untag b,Multiset.map_map,Multiset.map_map]
  rfl

theorem impossible {D N : Type} [Field D] [NumberField D] [Field N] [NumberField N]
    (s : Finset (TunnellIdealPrimeWords.P D)) (l : Allowed s ⊕ Allowed s ↪ TunnellIdealPrimeWords.P N)
    (hl : ∀ p, wt N (l (.inl p)) = wt D p.val) (hr : ∀ p, wt N (l (.inr p)) = wt D p.val) : False := by
  obtain ⟨c,hc,hd⟩ := density_good D s
  obtain ⟨C,_,hn⟩ := density_good N ∅
  let e : Good s × Good s ↪ Good (∅ : Finset (TunnellIdealPrimeWords.P N)) :=
    ⟨fun a => ⟨pair l a,by simp⟩,fun _ _ h => (pair l).injective (congrArg Subtype.val h)⟩
  apply TunnellIdealCountingBound.impossible
    (fun m : Good s => weight (wt D) m.val)
    (fun m : Good (∅ : Finset (TunnellIdealPrimeWords.P N)) => weight (wt N) m.val) _
    (cut_finite _ (finite D) s) (finite N) hc hd hn e (weight_pair _ _ l hl hr)
  intro a
  apply Multiset.prod_pos
  intro n h
  obtain ⟨p,_,rfl⟩ := Multiset.mem_map.mp h
  exact Nat.zero_lt_of_lt (wt_gt_one D p)

end
end TunnellSplitPrimePairs
/-! In a finite extension, infinitely many primes fail to have two distinct degree-one lifts. -/
namespace TunnellCofiniteSplitting
open NumberField IsDedekindDomain TunnellIdealPrimeWords TunnellSplitPrimePairs
open scoped Classical NumberField
noncomputable section
variable (D N : Type) [Field D] [NumberField D] [Field N] [NumberField N] [Algebra D N]

def two (v : P D) := ∃ l r : P N, l ≠ r ∧ l.asIdeal.LiesOver v.asIdeal ∧
  r.asIdeal.LiesOver v.asIdeal ∧ l.asIdeal.inertiaDeg (𝓞 D) = 1 ∧ r.asIdeal.inertiaDeg (𝓞 D) = 1

theorem infinite_not_two : {v : P D | ¬ two D N v}.Infinite := by
  classical
  intro hex
  let s := hex.toFinset
  have h (p : Allowed s) : two D N p.val := by
    by_contra h
    exact p.property (hex.mem_toFinset.mpr h)
  choose l r hne hl hr hld hrd using h
  let f : Allowed s ⊕ Allowed s → P N := Sum.elim l r
  let base : Allowed s ⊕ Allowed s → Allowed s := Sum.elim id id
  have comm (x : Allowed s ⊕ Allowed s) : (base x).val.asIdeal = (f x).asIdeal.under (𝓞 D) := by
    rcases x with p|p
    · exact (hl p).over
    · exact (hr p).over
  have hf : Function.Injective f := by
    intro x y he
    have hb : base x = base y := Subtype.ext (HeightOneSpectrum.ext
      ((comm x).trans ((congrArg (fun q : P N => q.asIdeal.under (𝓞 D)) he).trans (comm y).symm)))
    rcases x with p|p <;> rcases y with q|q <;> change p=q at hb <;> subst q
    · rfl
    · exact (hne p he).elim
    · exact (hne p he.symm).elim
    · rfl
  apply impossible s ⟨f,hf⟩
  · intro p
    haveI := hl p
    simpa [wt,hld p,f] using (Ideal.absNorm_pow_inertiaDeg p.val.asIdeal (l p).asIdeal).symm
  · intro p
    haveI := hr p
    simpa [wt,hrd p,f] using (Ideal.absNorm_pow_inertiaDeg p.val.asIdeal (r p).asIdeal).symm

end
end TunnellCofiniteSplitting
namespace TunnellCofiniteSplitDegree
open NumberField IsDedekindDomain TunnellIdealPrimeWords TunnellCofiniteSplitting
open scoped NumberField Classical
noncomputable section
variable (D N : Type) [Field D] [NumberField D] [Field N] [NumberField N] [Algebra D N]

theorem two_of_split (d : 1 < Module.finrank D N) (v : P D)
    (h : Nat.card (v.asIdeal.primesOver (𝓞 N)) = Module.finrank D N) : two D N v := by
  classical
  let Y := v.asIdeal.primesOver (𝓞 N)
  letI : Fintype Y := inferInstanceAs (Fintype (v.asIdeal.primesOver (𝓞 N)))
  let lift (q : Y) : P N := ⟨q.val,q.property.1,Ideal.ne_bot_of_mem_primesOver v.ne_bot q.property⟩
  let n (q : Y) := q.val.ramificationIdx (𝓞 D) * q.val.inertiaDeg (𝓞 D)
  have summ : ∑ q : Y, n q = Nat.card Y := by
    rw [h, IsFractionRing.finrank_eq (𝓞 D) D (𝓞 N) N]
    exact Ideal.sum_ramification_inertia_eq_finrank v.asIdeal (𝓞 N)
  have h1 (q : Y) : 0 < q.val.inertiaDeg (𝓞 D) := by
    haveI := q.property.1
    exact q.val.inertiaDeg_pos (𝓞 D)
  have h2 (q : Y) : 0 < q.val.ramificationIdx (𝓞 D) := by
    haveI := q.property.1
    exact q.val.ramificationIdx_pos (𝓞 D)
  have hn (q : Y) : 1 ≤ n q := Nat.mul_pos (h2 q) (h1 q)
  have hone (q : Y) : q.val.inertiaDeg (𝓞 D) = 1 := by
    by_contra ne
    have gt : 1 < n q := (Nat.one_lt_iff_ne_zero_and_ne_one.mpr ⟨(h1 q).ne',ne⟩).trans_le
      (Nat.le_mul_of_pos_left _ (h2 q))
    have H : (∑ _ : Y, 1) < ∑ i : Y, n i := Finset.sum_lt_sum (fun i _ => hn i) ⟨q,Finset.mem_univ _,gt⟩
    simp [summ,Nat.card_eq_fintype_card] at H
  have hc : 1 < Fintype.card Y := by rw [← Nat.card_eq_fintype_card,h]; exact d
  haveI : Nontrivial Y := Fintype.one_lt_card_iff_nontrivial.mp hc
  obtain ⟨p,q,hpq⟩ := exists_pair_ne Y
  refine ⟨lift p,lift q,fun eq => hpq (Subtype.ext (congrArg HeightOneSpectrum.asIdeal eq)),
    p.property.2,q.property.2,hone p,hone q⟩

theorem degree_one (h : {v : P D | Nat.card (v.asIdeal.primesOver (𝓞 N)) ≠ Module.finrank D N}.Finite) :
    Module.finrank D N = 1 := by
  by_contra hn
  have hd : 1 < Module.finrank D N := by have := Module.finrank_pos (R:=D) (M:=N); omega
  exact infinite_not_two D N (h.subset (fun v hbad he => hbad (two_of_split D N hd v he)))

end
end TunnellCofiniteSplitDegree
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

/- TunnellRationalNormFrobenius -/
section
/-! A Frobenius lift at a finite prime acts on the prime-to-characteristic roots of unity by the absolute norm of the prime. -/

namespace TunnellRationalNormFrobenius
open NumberField IsDedekindDomain MulAction
open scoped NumberField Pointwise
noncomputable local instance quotientField (R:Type*) [CommRing R] (I:Ideal R) [I.IsMaximal] : Field (R ⧸ I) := Ideal.Quotient.field I
variable (F E : Type) [Field F] [NumberField F] [Field E] [NumberField E]
  [Algebra F E] [FiniteDimensional F E] [IsGalois F E]

theorem residue_lift (v : HeightOneSpectrum (𝓞 F)) (w : HeightOneSpectrum (𝓞 E))
    [w.asIdeal.LiesOver v.asIdeal] :
    ∃ s : stabilizer Gal(E/F) w.asIdeal, ∀ x : 𝓞 E,
      Ideal.Quotient.mk w.asIdeal (s.val • x) = Ideal.Quotient.mk w.asIdeal x ^ v.asIdeal.absNorm := by
  let k := (𝓞 F) ⧸ v.asIdeal
  let l := (𝓞 E) ⧸ w.asIdeal
  letI : Finite k := Ring.HasFiniteQuotients.finiteQuotient v.ne_bot
  letI : Finite l := Ring.HasFiniteQuotients.finiteQuotient w.ne_bot
  letI : Fintype k := Fintype.ofFinite k
  let frob : Gal(l/k) := FiniteField.frobeniusAlgEquivOfAlgebraic k l
  obtain ⟨s,hs⟩ := IsFractionRing.stabilizerHom_surjective Gal(E/F) v.asIdeal w.asIdeal k l frob
  refine ⟨s,fun x => ?_⟩
  have h := IsFractionRing.stabilizerHom_apply_apply_mk Gal(E/F) v.asIdeal w.asIdeal k l s x
  rw [hs] at h
  dsimp only [l] at h
  simp only [Algebra.algebraMap_self, RingHom.id_apply] at h
  change (Ideal.Quotient.mk w.asIdeal x)^Fintype.card k = Ideal.Quotient.mk w.asIdeal (s.val • x) at h
  rw [← Nat.card_eq_fintype_card] at h
  exact h.symm

end TunnellRationalNormFrobenius
end

/- TunnellTrivialFrobenius -/
section
/-! Trivial Frobenius at all but finitely many places forces a finite Galois extension to have degree one. -/
namespace TunnellTrivialFrobenius
open NumberField IsDedekindDomain
open scoped NumberField
noncomputable local instance quotientField (R:Type*) [CommRing R] (I:Ideal R) [I.IsMaximal] : Field (R ⧸ I) := Ideal.Quotient.field I
noncomputable section
variable (D M : Type) [Field D] [NumberField D] [Field M] [NumberField M]
  [Algebra D M] [FiniteDimensional D M] [IsGalois D M]
abbrev P (F : Type) [Field F] [NumberField F] := HeightOneSpectrum (𝓞 F)

theorem inertia_one (v : P D) (w : P M) [w.asIdeal.LiesOver v.asIdeal]
    (fixed : ∀ y : (𝓞 M) ⧸ w.asIdeal, y ^ v.asIdeal.absNorm=y) :
    w.asIdeal.inertiaDeg (𝓞 D)=1 := by
  let k := (𝓞 D) ⧸ v.asIdeal
  let l := (𝓞 M) ⧸ w.asIdeal
  letI : Finite k := Ring.HasFiniteQuotients.finiteQuotient v.ne_bot
  letI : Finite l := Ring.HasFiniteQuotients.finiteQuotient w.ne_bot
  letI : Fintype k := Fintype.ofFinite k
  have hf : FiniteField.frobeniusAlgEquivOfAlgebraic k l = 1 := by
    ext y
    change y ^ Fintype.card k = y
    rw [← Nat.card_eq_fintype_card]
    exact fixed y
  rw [Ideal.inertiaDeg_eq_of_isMaximal v.asIdeal w.asIdeal,
    ←FiniteField.orderOf_frobeniusAlgEquivOfAlgebraic k l, hf, orderOf_one]

theorem degree_one (S : Finset (P D)) (h : ∀ v : P D, v ∉ S → ∀ w : P M, w.asIdeal.LiesOver v.asIdeal →
    ∀ y : (𝓞 M) ⧸ w.asIdeal, y ^ v.asIdeal.absNorm = y) : Module.finrank D M=1 := by
  classical
  apply TunnellCofiniteSplitDegree.degree_one
  let ram := AlgebraicNumberTheory.Ramification.finite_ramified_base_heightOne_primes (𝓞 D) (𝓞 M)
  apply (S.finite_toSet.union ram).subset
  intro v bad
  by_contra outside
  have hs : v ∉ S := fun hv => outside (Or.inl hv)
  obtain ⟨I,hI⟩ := (inferInstance : Nonempty (v.asIdeal.primesOver (𝓞 M))).some
  let w : P M := ⟨I, hI.1, Ideal.ne_bot_of_mem_primesOver v.ne_bot hI⟩
  letI : w.asIdeal.IsPrime := hI.1
  letI : w.asIdeal.LiesOver v.asIdeal := hI.2
  letI : Algebra.IsUnramifiedAt (𝓞 D) w.asIdeal := by
    by_contra hn
    exact outside (Or.inr ⟨w,hI.2,hn⟩)
  have count := Ideal.ncard_primesOver_mul_ramificationIdxIn_mul_inertiaDegIn v.asIdeal (𝓞 M) Gal(M/D)
  rw [Ideal.ramificationIdxIn_eq_ramificationIdx v.asIdeal w.asIdeal Gal(M/D), Ideal.ramificationIdx_eq_one_of_isUnramifiedAt,
    Ideal.inertiaDegIn_eq_inertiaDeg v.asIdeal w.asIdeal Gal(M/D), inertia_one D M v w (h v hs w hI.2),
    mul_one,mul_one,IsGalois.card_aut_eq_finrank] at count
  exact bad count

end
end TunnellTrivialFrobenius
end

/- TunnellCyclotomicFrobeniusGenerate -/
section
/-! Frobenius lifts away from any finite set generate a finite abelian Galois group. -/
namespace TunnellCyclotomicFrobeniusGenerate
open NumberField IsDedekindDomain MulAction TunnellTrivialFrobenius
open scoped NumberField Pointwise IsMulCommutative
noncomputable local instance quotientField (R:Type*) [CommRing R] (I:Ideal R) [I.IsMaximal] : Field (R ⧸ I) := Ideal.Quotient.field I
noncomputable section
variable (D E : Type) [Field D] [NumberField D] [Field E] [NumberField E]
  [Algebra D E] [FiniteDimensional D E] [IsAbelianGalois D E]

theorem generate (S : Finset (P D)) (H : Subgroup Gal(E/D))
    (has : ∀ v : P D, v ∉ S → ∀ w : P E, w.asIdeal.LiesOver v.asIdeal →
      ∃ s ∈ H, ∀ z : 𝓞 E, Ideal.Quotient.mk w.asIdeal (s • z) =
        Ideal.Quotient.mk w.asIdeal z ^ v.asIdeal.absNorm) : H=⊤ := by
  classical
  let M := IntermediateField.fixedField H
  letI : NumberField M := NumberField.of_module_finite D M
  have small : Module.finrank D M=1 := by
    apply degree_one D M S
    intro v hv t ht y
    obtain ⟨I,hI⟩ := (inferInstance : Nonempty (t.asIdeal.primesOver (𝓞 E))).some
    let w : P E := ⟨I,hI.1,Ideal.ne_bot_of_mem_primesOver t.ne_bot hI⟩
    letI : t.asIdeal.LiesOver v.asIdeal := ht
    letI : w.asIdeal.LiesOver t.asIdeal := hI.2
    letI : w.asIdeal.IsPrime := hI.1
    letI : w.asIdeal.IsMaximal := w.isMaximal
    obtain ⟨s,hs,act⟩ := has v hv w (Ideal.LiesOver.trans w.asIdeal t.asIdeal v.asIdeal)
    obtain ⟨a,rfl⟩ := Ideal.Quotient.mk_surjective y
    let b : 𝓞 E := algebraMap (𝓞 M) (𝓞 E) a
    have fix : s • b = b := by
      apply Subtype.ext
      exact (IntermediateField.mem_fixedField_iff H _).mp a.val.property s hs
    have modEq := act b
    rw [fix] at modEq
    let f := algebraMap ((𝓞 M) ⧸ t.asIdeal) ((𝓞 E) ⧸ w.asIdeal)
    apply f.injective
    rw [map_pow]
    exact modEq.symm
  have bot : M=⊥ := IntermediateField.finrank_eq_one_iff.mp small
  rw [←IntermediateField.fixingSubgroup_fixedField H, show IntermediateField.fixedField H = ⊥ from bot,
    IntermediateField.fixingSubgroup_bot]

end
end TunnellCyclotomicFrobeniusGenerate
end

/- TunnellFrobeniusRootExponent -/
section
/-! Read the action of an arithmetic Frobenius on a cyclotomic generator from its residue cardinality. -/
namespace TunnellFrobeniusRootExponent
open NumberField IsDedekindDomain
open scoped NumberField Pointwise
noncomputable local instance quotientField (R:Type*) [CommRing R] (I:Ideal R) [I.IsMaximal] : Field (R ⧸ I) := Ideal.Quotient.field I
noncomputable section
variable (D E : Type) [Field D] [NumberField D] [Field E] [NumberField E] [Algebra D E]
variable {m : ℕ} [NeZero m] {z : E} (prim : IsPrimitiveRoot z m)

theorem value (w : HeightOneSpectrum (𝓞 E)) (cop : w.asIdeal.absNorm.Coprime m)
    (s : Gal(E/D)) (q : ℕ) (act : ∀ a : 𝓞 E, Ideal.Quotient.mk w.asIdeal (s • a)=Ideal.Quotient.mk w.asIdeal a^q) :
    (prim.autToPow D s : ZMod m)=(q : ZMod m) := by
  let u := prim.autToPow D s
  let a := prim.toInteger
  have eq : a ^ (u.val.val)=s • a := by
    apply Subtype.ext
    exact prim.autToPow_spec D s
  have red : IsPrimitiveRoot (Ideal.Quotient.mk w.asIdeal a) m :=
    prim.toInteger_isPrimitiveRoot.idealQuotient_mk (by simpa using w.isPrime.ne_top) cop
  have he : (Ideal.Quotient.mk w.asIdeal a) ^ u.val.val = (Ideal.Quotient.mk w.asIdeal a)^q :=
    (map_pow (Ideal.Quotient.mk w.asIdeal) a u.val.val).symm.trans
      ((congrArg (Ideal.Quotient.mk w.asIdeal) eq).trans (act a))
  rw [(red.isOfFinOrder (NeZero.ne _)).pow_inj_mod,←red.eq_orderOf] at he
  exact (ZMod.natCast_zmod_val u.val).symm.trans ((ZMod.natCast_eq_natCast_iff' _ _ _).mpr he)

end
end TunnellFrobeniusRootExponent
end

/- TunnellRayPrimeNorm -/
section
namespace TunnellRayPrimeNorm
open NumberField IsDedekindDomain
open scoped NumberField
abbrev P (K : Type) [Field K] [NumberField K] := HeightOneSpectrum (𝓞 K)
end TunnellRayPrimeNorm
end

/- TunnellRayPrimeRange -/
section
/-! Prime-to-conductor ideal norms give all rational ray norm values. -/
namespace TunnellRayPrimeRange
open NumberField IsDedekindDomain TunnellRayPrimeNorm
open scoped NumberField
noncomputable section
variable (m : ℕ+) (F : Type) [Field F] [NumberField F]
def primes : Subgroup (ZMod m.val)ˣ :=
  Subgroup.closure {a | ∃ v : P F, (a : ZMod m.val)=(v.asIdeal.absNorm : ZMod m.val)}
end
end TunnellRayPrimeRange
end

/- TunnellCyclotomicPrimeRange -/
section
/-! The Galois action on a primitive root has the same explicitly generated finite group. -/
namespace TunnellCyclotomicPrimeRange
open NumberField IsDedekindDomain TunnellRayPrimeNorm TunnellRayPrimeRange
open scoped NumberField Pointwise
noncomputable section
variable (m : ℕ+) (F E : Type) [Field F] [NumberField F] [Field E] [NumberField E]
  [Algebra F E] [FiniteDimensional F E] [IsAbelianGalois F E] [NeZero m.val]
theorem coprime_outside : ∃ S : Finset (P F), ∀ v : P F, v∉S → v.asIdeal.absNorm.Coprime m.val := by
  classical
  let J := Ideal.span ({(m.val:𝓞 F)}:Set (𝓞 F))
  have nonzero:J≠0 := by
    change Ideal.span ({(m.val:𝓞 F)}:Set (𝓞 F))≠⊥
    rw [ne_eq,Ideal.span_singleton_eq_bot]
    exact Nat.cast_ne_zero.mpr m.property.ne'
  let finite := Ideal.finite_factors nonzero
  refine ⟨finite.toFinset,?_⟩
  intro v hv
  obtain ⟨p,i,_,contains,prime,eq⟩:=Ideal.exists_prime_and_absNorm_eq_pow v.asIdeal
  rw [eq]
  apply Nat.Coprime.pow_left
  apply prime.coprime_iff_not_dvd.mpr
  rintro ⟨t,ht⟩
  apply hv
  apply finite.mem_toFinset.mpr
  apply Ideal.dvd_iff_le.mpr
  apply (Ideal.span_singleton_le_iff_mem _).mpr
  rw [ht,Nat.cast_mul]
  exact v.asIdeal.mul_mem_right _ contains

theorem image {z : E} (root : IsPrimitiveRoot z m.val) : (root.autToPow F).range=primes m F := by
  have lift (v : P F) (cop : v.asIdeal.absNorm.Coprime m.val) (w : P E) [w.asIdeal.LiesOver v.asIdeal] :
      ∃ s : MulAction.stabilizer Gal(E/F) w.asIdeal, (root.autToPow F s.val : ZMod m.val)=v.asIdeal.absNorm ∧
        ∀ a : 𝓞 E, Ideal.Quotient.mk w.asIdeal (s.val • a)=Ideal.Quotient.mk w.asIdeal a^v.asIdeal.absNorm := by
    have up : w.asIdeal.absNorm.Coprime m.val := Ideal.absNorm_pow_inertiaDeg v.asIdeal w.asIdeal ▸ cop.pow_left _
    obtain ⟨s,hs⟩ := TunnellRationalNormFrobenius.residue_lift F E v w
    exact ⟨s,TunnellFrobeniusRootExponent.value F E root w up s.val _ hs,hs⟩
  apply le_antisymm
  · have ht : (primes m F).comap (root.autToPow F)=⊤ := by
      obtain ⟨S,away⟩:=coprime_outside m F
      apply TunnellCyclotomicFrobeniusGenerate.generate F E S
      intro v hv w lies
      letI : w.asIdeal.LiesOver v.asIdeal:=lies
      have cop := away v hv
      obtain ⟨s,e,hs⟩ := lift v cop w
      exact ⟨s.val,Subgroup.subset_closure (show ∃ v : P F, (_ : ZMod m.val)=v.asIdeal.absNorm from ⟨v,e⟩),hs⟩
    rintro _ ⟨s,rfl⟩
    exact (show s ∈ (primes m F).comap (root.autToPow F) from ht ▸ Subgroup.mem_top s)
  · rw [primes,Subgroup.closure_le]
    rintro a ⟨v,eq⟩
    obtain ⟨I,hI⟩ := (inferInstance : Nonempty (v.asIdeal.primesOver (𝓞 E))).some
    let w : P E := ⟨I,hI.1,Ideal.ne_bot_of_mem_primesOver v.ne_bot hI⟩
    letI : w.asIdeal.LiesOver v.asIdeal := hI.2
    have cop : v.asIdeal.absNorm.Coprime m.val := (ZMod.isUnit_iff_coprime _ _).mp (eq ▸ a.isUnit)
    obtain ⟨s,hs,_⟩ := lift v cop w
    exact ⟨s.val,Units.ext (hs.trans eq.symm)⟩
end
end TunnellCyclotomicPrimeRange
end

/- TunnellFinitePrimeGalois -/
section
/-! The image of a rational norm on each ray level is the restriction of the absolute cyclotomic character. -/
namespace TunnellFinitePrimeGalois
open NumberField KummerTheory TunnellRationalDegreeCoordinates
open TunnellCyclotomicConductors TunnellCyclotomicDegreeLevels
noncomputable section
abbrev Ω := SeparableClosure ℚ
local instance : IsGalois ℚ Ω :=
  @IsSepClosure.isGalois ℚ _ Ω _ ((separableClosure ℚ (AlgebraicClosure ℚ)).algebra)
    (separableClosure.isSepClosure ℚ (AlgebraicClosure ℚ))
variable (m : ℕ+)
local instance : NeZero m.val := ⟨m.property.ne'⟩
abbrev z := IsCyclotomicExtension.zeta m.val ℚ (rationalCyclotomicLevel m)
abbrev root : Ω := (((z m : rationalCyclotomicLevel m) : rationalCyclotomicField) : Ω)
theorem primitive : IsPrimitiveRoot (root m) m.val :=
  IsPrimitiveRoot.coe_submonoidClass_iff.mpr (IsPrimitiveRoot.coe_submonoidClass_iff.mpr
    (IsCyclotomicExtension.zeta_spec m.val ℚ (rationalCyclotomicLevel m)))

theorem level : (primitive m).autToPow ℚ = (reduction m).comp chi := by
  ext s : 1
  apply TunnellFixedCyclotomicImage.eq_exponents (primitive m)
  apply ((primitive m).autToPow_spec ℚ s).trans
  change s (root m) = (root m) ^ ((reduction m (chi s)).val.val)
  rw [finite_level m s]
  let t := res s
  let u := t.restrictNormal (rationalCyclotomicLevel m)
  have e := IsCyclotomicExtension.Rat.galEquivZMod_apply_of_pow_eq m.val _ u
    (IsCyclotomicExtension.zeta_spec m.val ℚ (rationalCyclotomicLevel m)).pow_eq_one
  calc
    s (root m) = ((t ((z m : rationalCyclotomicLevel m) : rationalCyclotomicField)) : Ω) :=
      (AlgEquiv.restrictNormal_commutes s rationalCyclotomicField _).symm
    _ = (((u (z m) : rationalCyclotomicLevel m) : rationalCyclotomicField) : Ω) :=
      congrArg Subtype.val (AlgEquiv.restrictNormal_commutes t (rationalCyclotomicLevel m) _).symm
    _ = _ := congrArg (fun a : rationalCyclotomicLevel m => ((a : rationalCyclotomicField) : Ω)) e

theorem finite (H : ClosedSubgroup G) [H.toSubgroup.FiniteIndex] :
    FiniteDimensional ℚ (IntermediateField.fixedField H.toSubgroup) := by
  apply (InfiniteGalois.isOpen_iff_finite _).mp
  change IsOpen (((IntermediateField.fixedField H.toSubgroup).fixingSubgroup : Subgroup G) : Set G)
  rw [InfiniteGalois.fixingSubgroup_fixedField H]
  exact H.toSubgroup.isOpen_of_isClosed_of_finiteIndex H.isClosed'

theorem image (F : IntermediateField ℚ Ω) [FiniteDimensional ℚ F] [NumberField F] :
    TunnellRayPrimeRange.primes m F = (F.fixingSubgroup.map chi).map (reduction m) := by
  letI : IsGalois F Ω := IsGalois.tower_top_of_isGalois ℚ F Ω
  let E := IntermediateField.adjoin F {root m}
  letI : IsCyclotomicExtension {m.val} F E := (primitive m).intermediateField_adjoin_isCyclotomicExtension F
  letI : IsAbelianGalois F E := IsCyclotomicExtension.isAbelianGalois {m.val} F E
  letI : FiniteDimensional F E := IsCyclotomicExtension.finiteDimensional {m.val} F E
  letI : FiniteDimensional ℚ E := Module.Finite.trans F E
  letI : NumberField E := NumberField.of_module_finite ℚ E
  let x : E := ⟨root m,IntermediateField.subset_adjoin F _ (Set.mem_singleton _)⟩
  have h : IsPrimitiveRoot x m.val := IsPrimitiveRoot.coe_submonoidClass_iff.mp (primitive m)
  exact (TunnellCyclotomicPrimeRange.image m F E h).symm.trans ((TunnellFixedCyclotomicImage.image F E h (primitive m)).trans
    ((congrArg F.fixingSubgroup.map (level m)).trans (Subgroup.map_map _ _ _).symm))
end
end TunnellFinitePrimeGalois
end

/- TunnellRationalPrimeGalois -/
section
namespace TunnellRationalPrimeGalois
open NumberField TunnellRationalDegreeCoordinates TunnellRayCoordinateUnits
open scoped NumberField
noncomputable section
local instance : IsGalois ℚ (SeparableClosure ℚ) :=
  @IsSepClosure.isGalois ℚ _ (SeparableClosure ℚ) _ ((separableClosure ℚ (AlgebraicClosure ℚ)).algebra)
    (separableClosure.isSepClosure ℚ (AlgebraicClosure ℚ))

theorem actual : OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1_H1_R1_H1_R1_H1_R1.H1 := by
  refine ⟨E.toMonoidHom.comp chi,cont.comp chi_cont,E.surjective.comp chi_surj,?_⟩
  intro H hi F _ m
  letI : H.toSubgroup.FiniteIndex := hi
  letI : FiniteDimensional ℚ F := TunnellFinitePrimeGalois.finite H
  change (H.toSubgroup.map (E.toMonoidHom.comp chi)).map (ev m)=TunnellRayPrimeRange.primes m F
  have he : (ev m).comp (E.toMonoidHom.comp chi)=(TunnellCyclotomicConductors.reduction m).comp chi :=
    MonoidHom.ext (fun t => ev_E m (chi t))
  have eq := (TunnellFinitePrimeGalois.image m F).symm
  have fixed : H.toSubgroup=F.fixingSubgroup := (InfiniteGalois.fixingSubgroup_fixedField H).symm
  calc
    _ = H.toSubgroup.map ((ev m).comp (E.toMonoidHom.comp chi)) := Subgroup.map_map _ _ _
    _ = H.toSubgroup.map ((TunnellCyclotomicConductors.reduction m).comp chi) := congrArg H.toSubgroup.map he
    _ = (H.toSubgroup.map chi).map (TunnellCyclotomicConductors.reduction m) := (Subgroup.map_map _ _ _).symm
    _ = (F.fixingSubgroup.map chi).map (TunnellCyclotomicConductors.reduction m) :=
      congrArg (fun S:Subgroup G => (S.map chi).map (TunnellCyclotomicConductors.reduction m)) fixed
    _ = _ := eq
end
end TunnellRationalPrimeGalois
end

theorem OMA.solution : OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1_H1_R1_H1_R1_H1_R1.H1 := TunnellRationalPrimeGalois.actual
