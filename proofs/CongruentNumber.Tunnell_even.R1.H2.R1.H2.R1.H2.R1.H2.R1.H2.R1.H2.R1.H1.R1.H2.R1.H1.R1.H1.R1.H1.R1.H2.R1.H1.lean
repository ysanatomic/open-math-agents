import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1_H1_R1_H1_R1_H1_R1_H2_R1
import Mathlib

/-! A surjective rational ray character, calculated from signs and local valuations. The idèle and ray-class constructions are adapted from ClassFieldTheory at commit 2e6280f9d2579705a0cc6c76ec68c2b60f9c601a. -/
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
@[simp]
theorem finiteComponent_apply (a : IdeleGroup K)
    (v : HeightOneSpectrum (𝓞 K)) :
    finiteComponent v a = a.2 v :=
  rfl
 


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
 

@[simp]
theorem infiniteComponent_principalIdele
    (x : Kˣ) (w : InfinitePlace K) :
    ((infiniteComponent w (principalIdele K x) :
      w.Completionˣ) : w.Completion) = (x : K) :=
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
end IdeleGroup
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.Idele.Topology -/
section
open scoped NumberField
open NumberField IsDedekindDomain
noncomputable section
variable (K : Type*) [Field K] [NumberField K]
 

theorem isOpen_finiteLocalUnits (v : HeightOneSpectrum (𝓞 K)) :
    IsOpen
      ((v.adicCompletionIntegers K).units :
        Set (v.adicCompletion K)ˣ) :=
  Submonoid.isOpen_units (Valued.isOpen_valuationSubring _)
instance finiteLocalUnitsOpen :
    Fact (∀ v : HeightOneSpectrum (𝓞 K),
      IsOpen
        ((v.adicCompletionIntegers K).units :
          Set (v.adicCompletion K)ˣ)) :=
  ⟨isOpen_finiteLocalUnits K⟩
namespace IdeleGroup
variable {K}
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
 
theorem isCompact_finiteLocalUnits
    (v : HeightOneSpectrum (𝓞 K)) :
    IsCompact
      ((v.adicCompletionIntegers K).units :
        Set (v.adicCompletion K)ˣ) := by
  apply Submonoid.units_isCompact
  change IsCompact
    ((Valued.integer (v.adicCompletion K)) :
      Set (v.adicCompletion K))
  exact isCompact_iff_compactSpace.mpr
    (Valued.integer.properSpace_iff_compactSpace_integer.mp inferInstance)
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.Idele.NormOneCompact -/
section
open scoped Classical NumberField Pointwise RestrictedProduct NNReal
open NumberField IsDedekindDomain
open NumberField.Units.dirichletUnitTheorem
noncomputable section
variable {K : Type*} [Field K] [NumberField K]
namespace FiniteIdeleGroup
 

def integralStructureMap :
    (∀ v : HeightOneSpectrum (𝓞 K),
      (v.adicCompletionIntegers K).units) → FiniteIdeleGroup K :=
  RestrictedProduct.structureMap
    (fun v : HeightOneSpectrum (𝓞 K) ↦ (v.adicCompletion K)ˣ)
    (fun v : HeightOneSpectrum (𝓞 K) ↦
      (v.adicCompletionIntegers K).units)
    Filter.cofinite
theorem range_integralStructureMap :
    Set.range (integralStructureMap (K := K)) =
      (integralSubgroup (K := K) : Set (FiniteIdeleGroup K)) := by
  ext a
  constructor
  · rintro ⟨u, rfl⟩ v
    exact (u v).property
  · intro ha
    let u : ∀ v : HeightOneSpectrum (𝓞 K),
        (v.adicCompletionIntegers K).units :=
      fun v ↦ ⟨a v, ha v⟩
    exact ⟨u, rfl⟩
 
theorem isCompact_integralSubgroup :
    IsCompact
      ((integralSubgroup (K := K) :
        Subgroup (FiniteIdeleGroup K)) : Set (FiniteIdeleGroup K)) := by
  have hlocal :
      ∀ v : HeightOneSpectrum (𝓞 K),
        CompactSpace (v.adicCompletionIntegers K).units := by
    intro v
    exact isCompact_iff_compactSpace.mp
      (isCompact_finiteLocalUnits K v)
  let (v : HeightOneSpectrum (𝓞 K)) :
      CompactSpace (v.adicCompletionIntegers K).units :=
    hlocal v
  have hdomain :
      IsCompact
        (Set.univ : Set (∀ v : HeightOneSpectrum (𝓞 K),
          (v.adicCompletionIntegers K).units)) :=
    isCompact_univ
  rw [← range_integralStructureMap (K := K)]
  unfold integralStructureMap
  simpa only [Set.image_univ] using
    hdomain.image
      (RestrictedProduct.isEmbedding_structureMap.continuous :
        Continuous (integralStructureMap (K := K)))
end FiniteIdeleGroup
namespace InfiniteIdeleGroup
end InfiniteIdeleGroup
namespace IdeleGroup
end IdeleGroup
namespace IdeleClassGroup
end IdeleClassGroup
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.RayClass.Basic -/
section
open scoped NumberField
open NumberField IsDedekindDomain
noncomputable section
variable {K : Type*} [Field K] [NumberField K]
namespace RayClass
 

abbrev FiniteModulus (K : Type*) [Field K] [NumberField K] :=
  HeightOneSpectrum (𝓞 K) →₀ ℕ
 

def localHigherUnitMap
    (v : HeightOneSpectrum (𝓞 K)) (n : ℕ) :
    (v.adicCompletionIntegers K).units →*
      ((v.adicCompletionIntegers K) ⧸
        (IsLocalRing.maximalIdeal
          (v.adicCompletionIntegers K)) ^ n)ˣ :=
  (Units.map
      (Ideal.Quotient.mk
        ((IsLocalRing.maximalIdeal
          (v.adicCompletionIntegers K)) ^ n)).toMonoidHom).comp
    (v.adicCompletionIntegers K).toSubmonoid.unitsEquivUnitsType.toMonoidHom
 
def localHigherUnitGroup
    (v : HeightOneSpectrum (𝓞 K)) (n : ℕ) :
    Subgroup (v.adicCompletion K)ˣ :=
  Subgroup.map
    (v.adicCompletionIntegers K).units.subtype
    (localHigherUnitMap v n).ker
theorem mem_localHigherUnitGroup_iff
    (v : HeightOneSpectrum (𝓞 K)) (n : ℕ)
    (x : (v.adicCompletion K)ˣ) :
    x ∈ localHigherUnitGroup v n ↔
      ∃ y : (v.adicCompletionIntegers K).units,
        (y : (v.adicCompletion K)ˣ) = x ∧
        localHigherUnitMap v n y = 1 := by
  rw [localHigherUnitGroup, Subgroup.mem_map]
  constructor
  · rintro ⟨y, hy, rfl⟩
    exact ⟨y, rfl, MonoidHom.mem_ker.mp hy⟩
  · rintro ⟨y, rfl, hy⟩
    exact ⟨y, MonoidHom.mem_ker.mpr hy, rfl⟩
 

theorem localHigherUnitGroup_zero
    (v : HeightOneSpectrum (𝓞 K)) :
    localHigherUnitGroup v 0 =
      (v.adicCompletionIntegers K).units := by
  ext x
  rw [mem_localHigherUnitGroup_iff]
  constructor
  · rintro ⟨y, rfl, _hy⟩
    exact y.property
  · intro hx
    let y : (v.adicCompletionIntegers K).units := ⟨x, hx⟩
    refine ⟨y, rfl, ?_⟩
    change Units.map
      (Ideal.Quotient.mk
        ((IsLocalRing.maximalIdeal
          (v.adicCompletionIntegers K)) ^ 0)).toMonoidHom
        ((v.adicCompletionIntegers K).toSubmonoid.unitsEquivUnitsType y) =
      1
    let : Subsingleton
        ((v.adicCompletionIntegers K) ⧸
          (IsLocalRing.maximalIdeal
            (v.adicCompletionIntegers K)) ^ 0) :=
      Ideal.Quotient.subsingleton_iff.mpr (by simp)
    apply Units.ext
    exact Subsingleton.elim _ _
 

def infinitePositiveSubgroup (v : InfinitePlace K) :
    Subgroup v.Completionˣ where
  carrier := {x | ∀ hv : v.IsReal,
    0 < NumberField.InfinitePlace.Completion.extensionEmbeddingOfIsReal
      hv (x : v.Completion)}
  one_mem' hv := by simp
  mul_mem' {x y} hx hy hv := by
    change 0 <
      NumberField.InfinitePlace.Completion.extensionEmbeddingOfIsReal
        hv ((x : v.Completion) * (y : v.Completion))
    rw [map_mul]
    exact mul_pos (hx hv) (hy hv)
  inv_mem' {x} hx hv := by
    rw [Units.val_inv_eq_inv_val, map_inv₀]
    exact inv_pos.mpr (hx hv)
omit [NumberField K] in
@[simp]
theorem mem_infinitePositiveSubgroup_iff
    (v : InfinitePlace K) (x : v.Completionˣ) :
    x ∈ infinitePositiveSubgroup v ↔
      ∀ hv : v.IsReal,
        0 < NumberField.InfinitePlace.Completion.extensionEmbeddingOfIsReal
          hv (x : v.Completion) :=
  Iff.rfl
 
def finiteCongruenceSubgroup (m : FiniteModulus K) :
    Subgroup (FiniteIdeleGroup K) where
  carrier := {a | ∀ v, a v ∈ localHigherUnitGroup v (m v)}
  one_mem' v := (localHigherUnitGroup v (m v)).one_mem
  mul_mem' ha hb v :=
    (localHigherUnitGroup v (m v)).mul_mem (ha v) (hb v)
  inv_mem' ha v :=
    (localHigherUnitGroup v (m v)).inv_mem (ha v)
@[simp]
theorem mem_finiteCongruenceSubgroup_iff
    (m : FiniteModulus K) (a : FiniteIdeleGroup K) :
    a ∈ finiteCongruenceSubgroup m ↔
      ∀ v, a v ∈ localHigherUnitGroup v (m v) :=
  Iff.rfl
 
def narrowInfiniteCongruenceSubgroup :
    Subgroup (InfiniteIdeleGroup K) :=
  Subgroup.comap ContinuousMulEquiv.piUnits.toMonoidHom
    (Subgroup.pi Set.univ (fun v => infinitePositiveSubgroup v))
omit [NumberField K] in
@[simp]
theorem mem_narrowInfiniteCongruenceSubgroup_iff
    (a : InfiniteIdeleGroup K) :
    a ∈ narrowInfiniteCongruenceSubgroup (K := K) ↔
      ∀ v, ContinuousMulEquiv.piUnits a v ∈
        infinitePositiveSubgroup v := by
  change ContinuousMulEquiv.piUnits a ∈
      Subgroup.pi Set.univ (fun v => infinitePositiveSubgroup v) ↔ _
  rw [Subgroup.mem_pi]
  simp only [Set.mem_univ, true_implies]
end RayClass
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.RayClass.FullModulus -/
section
open scoped Classical NumberField
open NumberField IsDedekindDomain
noncomputable section
variable {K : Type*} [Field K] [NumberField K]
namespace RayClass
 
abbrev RealPlace (K : Type*) [Field K] [NumberField K] :=
  {v : InfinitePlace K // v.IsReal}
 

structure Modulus (K : Type*) [Field K] [NumberField K] where
   
  finitePart : FiniteModulus K
   
  infinitePart : Finset (RealPlace K)
namespace Modulus
 

noncomputable def narrowOfFinite (m : FiniteModulus K) : Modulus K where
  finitePart := m
  infinitePart := Finset.univ
@[simp]
theorem finitePart_narrowOfFinite (m : FiniteModulus K) :
    (narrowOfFinite m).finitePart = m :=
  rfl
@[simp]
theorem infinitePart_narrowOfFinite (m : FiniteModulus K) :
    (narrowOfFinite m).infinitePart = Finset.univ :=
  rfl
 


noncomputable def localInfiniteCongruenceSubgroup (m : Modulus K)
    (w : InfinitePlace K) : Subgroup w.Completionˣ := by
  classical
  exact if hw : w.IsReal then
    if hmem : (⟨w, hw⟩ : RealPlace K) ∈ m.infinitePart then
      infinitePositiveSubgroup w
    else ⊤
  else ⊤
@[simp]
theorem localInfiniteCongruenceSubgroup_of_mem
    (m : Modulus K) (v : RealPlace K) (hv : v ∈ m.infinitePart) :
    m.localInfiniteCongruenceSubgroup v.1 = infinitePositiveSubgroup v.1 := by
  simp [localInfiniteCongruenceSubgroup, v.property, hv]
 

def infiniteCongruenceSubgroup (m : Modulus K) :
    Subgroup (InfiniteIdeleGroup K) :=
  Subgroup.comap ContinuousMulEquiv.piUnits.toMonoidHom
    (Subgroup.pi Set.univ (fun w => m.localInfiniteCongruenceSubgroup w))
@[simp]
theorem mem_infiniteCongruenceSubgroup_iff_local
    (m : Modulus K) (a : InfiniteIdeleGroup K) :
    a ∈ m.infiniteCongruenceSubgroup ↔
      ∀ w, ContinuousMulEquiv.piUnits a w ∈ m.localInfiniteCongruenceSubgroup w := by
  change ContinuousMulEquiv.piUnits a ∈
      Subgroup.pi Set.univ (fun w => m.localInfiniteCongruenceSubgroup w) ↔ _
  rw [Subgroup.mem_pi]
  simp only [Set.mem_univ, true_implies]
@[simp]
theorem mem_infiniteCongruenceSubgroup_iff
    (m : Modulus K) (a : InfiniteIdeleGroup K) :
    a ∈ m.infiniteCongruenceSubgroup ↔
      ∀ v : RealPlace K, v ∈ m.infinitePart →
        ContinuousMulEquiv.piUnits a v.1 ∈ infinitePositiveSubgroup v.1 :=
  by
    rw [mem_infiniteCongruenceSubgroup_iff_local]
    constructor
    · intro ha v hv
      have hlocal := ha v.1
      rw [localInfiniteCongruenceSubgroup_of_mem m v hv] at hlocal
      exact hlocal
    · intro ha w
      by_cases hw : w.IsReal
      · by_cases hmem : (⟨w, hw⟩ : RealPlace K) ∈ m.infinitePart
        · simpa [localInfiniteCongruenceSubgroup, hw, hmem] using
            ha ⟨w, hw⟩ hmem
        · simp [localInfiniteCongruenceSubgroup, hw, hmem]
      · simp [localInfiniteCongruenceSubgroup, hw]
 

theorem infiniteCongruenceSubgroup_narrowOfFinite (f : FiniteModulus K) :
    (narrowOfFinite f).infiniteCongruenceSubgroup =
      narrowInfiniteCongruenceSubgroup (K := K) := by
  ext a
  rw [mem_infiniteCongruenceSubgroup_iff,
    mem_narrowInfiniteCongruenceSubgroup_iff]
  simp only [infinitePart_narrowOfFinite, Finset.mem_univ, true_implies]
  constructor
  · intro ha w
    by_cases hw : w.IsReal
    · exact ha ⟨w, hw⟩
    · rw [mem_infinitePositiveSubgroup_iff]
      exact fun hreal => (hw hreal).elim
  · intro ha v
    exact ha v.1
 
def ideleCongruenceSubgroup (m : Modulus K) :
    Subgroup (IdeleGroup K) :=
  m.infiniteCongruenceSubgroup.prod
    (finiteCongruenceSubgroup m.finitePart)
end Modulus
end RayClass
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.RayClass.Topology -/
section
open scoped Classical NumberField RestrictedProduct WithZero
open NumberField IsDedekindDomain
open Topology
noncomputable section
variable {K : Type*} [Field K] [NumberField K]
namespace RayClass
 
def localIntegralValue
    (v : HeightOneSpectrum (𝓞 K))
    (y : (v.adicCompletionIntegers K).units) :
    v.adicCompletionIntegers K :=
  ((v.adicCompletionIntegers K).toSubmonoid.unitsEquivUnitsType y :
    (v.adicCompletionIntegers K)ˣ).1
 

theorem localHigherUnitMap_eq_one_iff
    (v : HeightOneSpectrum (𝓞 K)) (n : ℕ)
    (y : (v.adicCompletionIntegers K).units) :
    localHigherUnitMap v n y = 1 ↔
      localIntegralValue v y - 1 ∈
          (IsLocalRing.maximalIdeal
            (v.adicCompletionIntegers K)) ^ n := by
  let I :=
    (IsLocalRing.maximalIdeal
      (v.adicCompletionIntegers K)) ^ n
  change
    Units.map (Ideal.Quotient.mk I).toMonoidHom
        ((v.adicCompletionIntegers K).toSubmonoid.unitsEquivUnitsType y) =
      1 ↔ _
  rw [Units.ext_iff]
  change Ideal.Quotient.mk I (localIntegralValue v y) =
      Ideal.Quotient.mk I 1 ↔ _
  exact Ideal.Quotient.mk_eq_mk_iff_sub_mem
    (I := I) (localIntegralValue v y)
      (1 : v.adicCompletionIntegers K)
 
theorem localHigherUnitGroup_antitone
    (v : HeightOneSpectrum (𝓞 K))
    {m n : ℕ} (hmn : m ≤ n) :
    localHigherUnitGroup v n ≤ localHigherUnitGroup v m := by
  intro x hx
  rw [mem_localHigherUnitGroup_iff] at hx ⊢
  obtain ⟨y, rfl, hy⟩ := hx
  refine ⟨y, rfl, ?_⟩
  rw [localHigherUnitMap_eq_one_iff] at hy ⊢
  exact Ideal.pow_le_pow_right hmn hy
 

theorem isOpen_localHigherUnitGroup
    (v : HeightOneSpectrum (𝓞 K)) (n : ℕ) :
    IsOpen
      ((localHigherUnitGroup v n :
        Subgroup (v.adicCompletion K)ˣ) :
          Set (v.adicCompletion K)ˣ) := by
  let D : Subgroup (v.adicCompletion K)ˣ :=
    (v.adicCompletionIntegers K).units
  let I : Ideal (v.adicCompletionIntegers K) :=
    (IsLocalRing.maximalIdeal
      (v.adicCompletionIntegers K)) ^ n
  let toInteger : D → v.adicCompletionIntegers K :=
    fun y ↦ localIntegralValue v y
  have htoInteger : Continuous toInteger := by
    apply continuous_induced_rng.mpr
    exact Units.continuous_val.comp continuous_subtype_val
  let W : Set D := {y | toInteger y - 1 ∈ I}
  have : CompactSpace (v.adicCompletionIntegers K) :=
    Valued.integer.properSpace_iff_compactSpace_integer.mp inferInstance
  have hIOpen : IsOpen (I : Set (v.adicCompletionIntegers K)) := by
    exact IsLocalRing.isOpen_maximalIdeal_pow
      (v.adicCompletionIntegers K) n
  have hWOpen : IsOpen W := by
    exact hIOpen.preimage (htoInteger.sub continuous_const)
  have hDOpen : IsOpen (D : Set (v.adicCompletion K)ˣ) := by
    exact isOpen_finiteLocalUnits K v
  have himageOpen :
      IsOpen (Subtype.val '' W : Set (v.adicCompletion K)ˣ) :=
    hDOpen.isOpenEmbedding_subtypeVal.isOpenMap W hWOpen
  have heq :
      (localHigherUnitGroup v n :
          Set (v.adicCompletion K)ˣ) =
        Subtype.val '' W := by
    ext x
    constructor
    · intro hx
      obtain ⟨y, rfl, hy⟩ :=
        (mem_localHigherUnitGroup_iff v n x).1 hx
      refine ⟨y, ?_, rfl⟩
      exact (localHigherUnitMap_eq_one_iff v n y).1 hy
    · rintro ⟨y, hyW, rfl⟩
      let y' : (v.adicCompletionIntegers K).units := y
      apply (mem_localHigherUnitGroup_iff v n y).2
      refine ⟨y', rfl, ?_⟩
      exact (localHigherUnitMap_eq_one_iff v n y').2 hyW
  rw [heq]
  exact himageOpen
 
theorem localHigherUnitGroup_le_finiteLocalUnits
    (v : HeightOneSpectrum (𝓞 K)) (n : ℕ) :
    localHigherUnitGroup v n ≤
      (v.adicCompletionIntegers K).units := by
  intro x hx
  rw [mem_localHigherUnitGroup_iff] at hx
  obtain ⟨y, rfl, _⟩ := hx
  exact y.property
 
theorem isOpen_finiteCongruenceSubgroup (m : FiniteModulus K) :
    IsOpen
      ((finiteCongruenceSubgroup m :
        Subgroup (FiniteIdeleGroup K)) :
          Set (FiniteIdeleGroup K)) := by
  let T := m.support
  let U : Set (FiniteIdeleGroup K) :=
    (FiniteIdeleGroup.integralSubgroup (K := K) :
      Set (FiniteIdeleGroup K)) ∩
    ⋂ v ∈ T,
      (fun a : FiniteIdeleGroup K ↦ a v) ⁻¹'
        (localHigherUnitGroup v (m v) :
          Set (v.adicCompletion K)ˣ)
  have hIntegralOpen :
      IsOpen
        ((FiniteIdeleGroup.integralSubgroup (K := K) :
          Subgroup (FiniteIdeleGroup K)) :
            Set (FiniteIdeleGroup K)) := by
    change IsOpen {a : FiniteIdeleGroup K |
      ∀ v, a v ∈ (v.adicCompletionIntegers K).units}
    exact RestrictedProduct.isOpen_forall_mem
      (fun v ↦ isOpen_finiteLocalUnits K v)
  have hUOpen : IsOpen U := by
    apply hIntegralOpen.inter
    apply isOpen_biInter_finset
    intro v hv
    exact (isOpen_localHigherUnitGroup v (m v)).preimage
      (RestrictedProduct.continuous_eval v)
  have heq :
      (finiteCongruenceSubgroup m : Set (FiniteIdeleGroup K)) = U := by
    ext a
    constructor
    · intro ha
      have ha' :=
        (mem_finiteCongruenceSubgroup_iff m a).1 ha
      constructor
      · exact fun v ↦
          localHigherUnitGroup_le_finiteLocalUnits v (m v) (ha' v)
      · apply Set.mem_iInter.mpr
        intro v
        apply Set.mem_iInter.mpr
        intro _hv
        exact ha' v
    · rintro ⟨haIntegral, haT⟩
      apply (mem_finiteCongruenceSubgroup_iff m a).2
      intro v
      by_cases hv : v ∈ T
      · have h₁ := Set.mem_iInter.mp haT v
        exact Set.mem_iInter.mp h₁ hv
      · have hmv : m v = 0 := by
          by_contra hne
          exact hv (Finsupp.mem_support_iff.mpr hne)
        rw [hmv, localHigherUnitGroup_zero]
        exact haIntegral v
  rw [heq]
  exact hUOpen
omit [NumberField K] in
 

theorem isOpen_infinitePositiveSubgroup (v : InfinitePlace K) :
    IsOpen
      ((infinitePositiveSubgroup v : Subgroup v.Completionˣ) :
        Set v.Completionˣ) := by
  by_cases hv : v.IsReal
  · rw [show
      (infinitePositiveSubgroup v : Set v.Completionˣ) =
        {x : v.Completionˣ |
          0 <
            InfinitePlace.Completion.extensionEmbeddingOfIsReal
              hv (x : v.Completion)} by
        ext x
        simp only [Set.mem_ofPred_eq]
        constructor
        · intro h
          exact h hv
        · intro h hv'
          simpa only [Subsingleton.elim hv' hv] using h]
    exact isOpen_Ioi.preimage
      ((InfinitePlace.Completion.isometry_extensionEmbeddingOfIsReal hv).continuous.comp
        Units.continuous_val)
  · have htop :
        infinitePositiveSubgroup v = ⊤ := by
      ext x
      simp [mem_infinitePositiveSubgroup_iff, hv]
    rw [htop]
    exact isOpen_univ
 
theorem isOpen_infiniteCongruenceSubgroup (m : Modulus K) :
    IsOpen
      ((m.infiniteCongruenceSubgroup :
        Subgroup (InfiniteIdeleGroup K)) :
          Set (InfiniteIdeleGroup K)) := by
  let U : Set (InfiniteIdeleGroup K) :=
    ⋂ v ∈ m.infinitePart,
      (fun a : InfiniteIdeleGroup K ↦ ContinuousMulEquiv.piUnits a v.1) ⁻¹'
        (infinitePositiveSubgroup v.1 : Set v.1.Completionˣ)
  have hUOpen : IsOpen U := by
    apply isOpen_biInter_finset
    intro v hv
    have hEval : Continuous
        (fun a : InfiniteIdeleGroup K ↦ ContinuousMulEquiv.piUnits a v.1) :=
      (continuous_apply v.1).comp ContinuousMulEquiv.piUnits.continuous
    exact (isOpen_infinitePositiveSubgroup v.1).preimage hEval
  have hU :
      (m.infiniteCongruenceSubgroup : Set (InfiniteIdeleGroup K)) = U := by
    ext a
    change a ∈ m.infiniteCongruenceSubgroup ↔ a ∈ U
    rw [Modulus.mem_infiniteCongruenceSubgroup_iff]
    constructor
    · intro ha
      apply Set.mem_iInter.mpr
      intro v
      apply Set.mem_iInter.mpr
      intro hv
      exact ha v hv
    · intro ha v hv
      exact Set.mem_iInter.mp (Set.mem_iInter.mp ha v) hv
  rw [hU]
  exact hUOpen
 
theorem isOpen_ideleCongruenceSubgroup (m : Modulus K) :
    IsOpen
      ((m.ideleCongruenceSubgroup :
        Subgroup (IdeleGroup K)) :
          Set (IdeleGroup K)) :=
  (isOpen_infiniteCongruenceSubgroup m).prod
    (isOpen_finiteCongruenceSubgroup m.finitePart)
end RayClass
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.RayClass.Ideal -/
section
open scoped NumberField WithZero Classical
open NumberField IsDedekindDomain
noncomputable section
variable {K : Type*} [Field K] [NumberField K]
namespace RayClass
 

def primeToModulusIdeals (m : Modulus K) :
    Subgroup (FractionalIdealGroup K) where
  carrier := {I | ∀ v, v ∈ m.finitePart.support →
    FractionalIdeal.count K v
      (I : FractionalIdeal (nonZeroDivisors (𝓞 K)) K) = 0}
  one_mem' v _ := FractionalIdeal.count_one K v
  mul_mem' {I J} hI hJ v hv := by
    rw [Units.val_mul,
      FractionalIdeal.count_mul K v (Units.ne_zero I) (Units.ne_zero J),
      hI v hv, hJ v hv, add_zero]
  inv_mem' {I} hI v hv := by
    rw [Units.val_inv_eq_inv_val, FractionalIdeal.count_inv K v,
      hI v hv, neg_zero]
 

def primeToModulusIdeal
    (m : Modulus K)
    (v : HeightOneSpectrum (𝓞 K))
    (hv : v ∉ m.finitePart.support) :
    primeToModulusIdeals m :=
  ⟨FractionalIdealGroup.prime v, by
    intro w hw
    have hwv : w ≠ v := by
      intro h
      exact hv (h ▸ hw)
    change
      FractionalIdeal.count K w
          (v.asIdeal :
            FractionalIdeal (nonZeroDivisors (𝓞 K)) K) =
        0
    exact
      FractionalIdeal.count_maximal_coprime
        K w hwv.symm⟩
 

def finitePrimeToModulusSubgroup (m : Modulus K) :
    Subgroup (FiniteIdeleGroup K) where
  carrier := {a | ∀ v, v ∈ m.finitePart.support →
    a v ∈ localHigherUnitGroup v (m.finitePart v)}
  one_mem' v _ := (localHigherUnitGroup v (m.finitePart v)).one_mem
  mul_mem' ha hb v hv :=
    (localHigherUnitGroup v (m.finitePart v)).mul_mem (ha v hv) (hb v hv)
  inv_mem' ha v hv :=
    (localHigherUnitGroup v (m.finitePart v)).inv_mem (ha v hv)
 

def idelePrimeToModulusSubgroup (m : Modulus K) :
    Subgroup (IdeleGroup K) :=
  m.infiniteCongruenceSubgroup.prod
    (finitePrimeToModulusSubgroup m)
theorem localHigherUnitGroup_le_integralUnits
    (v : HeightOneSpectrum (𝓞 K)) (n : ℕ) :
    localHigherUnitGroup v n ≤
      (v.adicCompletionIntegers K).units := by
  intro x hx
  rw [mem_localHigherUnitGroup_iff] at hx
  obtain ⟨y, rfl, _⟩ := hx
  exact y.property
theorem fractionalIdeal_mem_primeToModulusIdeals
    (m : Modulus K) (a : IdeleGroup K)
    (ha : a ∈ idelePrimeToModulusSubgroup m) :
    IdeleGroup.fractionalIdeal a ∈ primeToModulusIdeals m := by
  intro v hv
  change FractionalIdeal.count K v
      (((FractionalIdealGroup.factorization (K := K))
        (FiniteIdeleGroup.valuationVector a.2) :
          FractionalIdealGroup K) :
        FractionalIdeal (nonZeroDivisors (𝓞 K)) K) = 0
  rw [FractionalIdealGroup.count_factorization,
    FiniteIdeleGroup.valuationVector_apply]
  apply (FiniteIdeleGroup.localOrder_eq_zero_iff v (a.2 v)).2
  exact localHigherUnitGroup_le_integralUnits v (m.finitePart v) (ha.2 v hv)
 
def primeToIdealMap (m : Modulus K) :
    idelePrimeToModulusSubgroup m →*
      primeToModulusIdeals m where
  toFun a :=
    ⟨IdeleGroup.fractionalIdeal a,
      fractionalIdeal_mem_primeToModulusIdeals m a a.property⟩
  map_one' := by
    apply Subtype.ext
    exact map_one _
  map_mul' a b := by
    apply Subtype.ext
    exact map_mul _ _ _
 

def valuationVectorSectionPrimeTo
    (m : Modulus K)
  (e : HeightOneSpectrum (𝓞 K) →₀ ℤ) :
    FiniteIdeleGroup K :=
  ⟨fun v =>
      if v ∈ m.finitePart.support then 1
      else FiniteIdeleGroup.chosenLocalOrderSection v (e v), by
    filter_upwards
      [m.finitePart.support.eventually_cofinite_notMem,
        e.support.eventually_cofinite_notMem] with v hvm he
    simp only [hvm, ↓reduceIte]
    apply (FiniteIdeleGroup.localOrder_eq_zero_iff v _).1
    rw [FiniteIdeleGroup.localOrder_chosenLocalOrderSection,
      Finsupp.notMem_support_iff.mp he]⟩
theorem valuationVector_valuationVectorSectionPrimeTo
    (m : Modulus K)
    (e : HeightOneSpectrum (𝓞 K) →₀ ℤ)
    (he : ∀ v, v ∈ m.finitePart.support → e v = 0) :
    FiniteIdeleGroup.valuationVector
        (valuationVectorSectionPrimeTo m e) =
      Multiplicative.ofAdd e := by
  apply Multiplicative.ext
  ext v
  rw [FiniteIdeleGroup.valuationVector_apply]
  by_cases hv : v ∈ m.finitePart.support
  · change
      (FiniteIdeleGroup.localOrder v
        (if v ∈ m.finitePart.support then 1
          else FiniteIdeleGroup.chosenLocalOrderSection v (e v))).toAdd =
        e v
    rw [if_pos hv, map_one]
    exact (he v hv).symm
  · change
      (FiniteIdeleGroup.localOrder v
        (if v ∈ m.finitePart.support then 1
          else FiniteIdeleGroup.chosenLocalOrderSection v (e v))).toAdd =
        e v
    rw [if_neg hv,
      FiniteIdeleGroup.localOrder_chosenLocalOrderSection]
theorem primeToIdealMap_surjective (m : Modulus K) :
    Function.Surjective (primeToIdealMap m) := by
  intro I
  let e : HeightOneSpectrum (𝓞 K) →₀ ℤ :=
    FractionalIdealGroup.countVector (I : FractionalIdealGroup K)
  have he : ∀ v, v ∈ m.finitePart.support → e v = 0 := by
    intro v hv
    exact I.property v hv
  let a : IdeleGroup K :=
    (1, valuationVectorSectionPrimeTo m e)
  have ha : a ∈ idelePrimeToModulusSubgroup m := by
    constructor
    · exact m.infiniteCongruenceSubgroup.one_mem
    · intro v hv
      change
        (if v ∈ m.finitePart.support then 1
          else FiniteIdeleGroup.chosenLocalOrderSection v (e v)) ∈
            localHigherUnitGroup v (m.finitePart v)
      rw [if_pos hv]
      exact (localHigherUnitGroup v (m.finitePart v)).one_mem
  refine ⟨⟨a, ha⟩, ?_⟩
  apply Subtype.ext
  apply FractionalIdealGroup.ext_count
  intro v
  change FractionalIdeal.count K v
      (((FractionalIdealGroup.factorization (K := K))
        (FiniteIdeleGroup.valuationVector
          (valuationVectorSectionPrimeTo m e)) :
          FractionalIdealGroup K) :
        FractionalIdeal (nonZeroDivisors (𝓞 K)) K) =
      FractionalIdeal.count K v
        ((I : FractionalIdealGroup K) :
          FractionalIdeal (nonZeroDivisors (𝓞 K)) K)
  rw [valuationVector_valuationVectorSectionPrimeTo m e he,
    FractionalIdealGroup.count_factorization]
  exact FractionalIdealGroup.countVector_apply I v
theorem ideleCongruenceSubgroup_le_primeTo
    (m : Modulus K) :
    m.ideleCongruenceSubgroup ≤
      idelePrimeToModulusSubgroup m := by
  intro a ha
  exact ⟨ha.1, fun v _ => ha.2 v⟩
 

def congruenceSubgroupInPrimeTo (m : Modulus K) :
    Subgroup (idelePrimeToModulusSubgroup m) :=
  m.ideleCongruenceSubgroup.subgroupOf
    (idelePrimeToModulusSubgroup m)
theorem primeToIdealMap_ker (m : Modulus K) :
    (primeToIdealMap m).ker =
      congruenceSubgroupInPrimeTo m := by
  ext a
  constructor
  · intro ha
    have hintegral :
        (a : IdeleGroup K) ∈
          IdeleGroup.integralAtFinitePlaces (K := K) := by
      rw [← IdeleGroup.fractionalIdeal_ker,
        MonoidHom.mem_ker]
      exact congrArg Subtype.val
        (MonoidHom.mem_ker.mp ha)
    constructor
    · exact a.property.1
    · intro v
      by_cases hv : v ∈ m.finitePart.support
      · exact a.property.2 v hv
      · rw [Finsupp.notMem_support_iff.mp hv,
          localHigherUnitGroup_zero]
        exact hintegral v
  · intro ha
    apply MonoidHom.mem_ker.mpr
    apply Subtype.ext
    change IdeleGroup.fractionalIdeal (a : IdeleGroup K) = 1
    rw [← MonoidHom.mem_ker,
      IdeleGroup.fractionalIdeal_ker]
    intro v
    exact localHigherUnitGroup_le_integralUnits v (m.finitePart v) (ha.2 v)
 

def principalSubgroupInPrimeTo (m : Modulus K) :
    Subgroup (idelePrimeToModulusSubgroup m) :=
  Subgroup.comap (idelePrimeToModulusSubgroup m).subtype
    (IdeleGroup.principalSubgroup K)
 

def principalRayIdealSubgroup (m : Modulus K) :
    Subgroup (primeToModulusIdeals m) :=
  Subgroup.map (primeToIdealMap m)
    (principalSubgroupInPrimeTo m)
theorem mem_principalRayIdealSubgroup_iff
    (m : Modulus K) (I : primeToModulusIdeals m) :
    I ∈ principalRayIdealSubgroup m ↔
      ∃ x : Kˣ,
        ∃ _hx : IdeleGroup.principalIdele K x ∈
          idelePrimeToModulusSubgroup m,
        toPrincipalIdeal (𝓞 K) K x =
          (I : FractionalIdealGroup K) := by
  constructor
  · rintro ⟨a, ha, hmap⟩
    obtain ⟨x, hx⟩ := ha
    refine ⟨x, ?_, ?_⟩
    · rw [hx]
      exact a.property
    · have hval := congrArg Subtype.val hmap
      change IdeleGroup.fractionalIdeal (a : IdeleGroup K) =
        (I : FractionalIdealGroup K) at hval
      rw [← IdeleGroup.fractionalIdeal_principalIdele]
      exact (congrArg (IdeleGroup.fractionalIdeal (K := K)) hx).trans hval
  · rintro ⟨x, hx, hideal⟩
    let a : idelePrimeToModulusSubgroup m :=
      ⟨IdeleGroup.principalIdele K x, hx⟩
    have ha : a ∈ principalSubgroupInPrimeTo m := by
      change IdeleGroup.principalIdele K x ∈
        IdeleGroup.principalSubgroup K
      exact ⟨x, rfl⟩
    refine ⟨a, ha, ?_⟩
    apply Subtype.ext
    change IdeleGroup.fractionalIdeal
        (IdeleGroup.principalIdele K x) =
      (I : FractionalIdealGroup K)
    rw [IdeleGroup.fractionalIdeal_principalIdele, hideal]
 
abbrev IdealRayClassGroup (m : Modulus K) :=
  primeToModulusIdeals m ⧸ principalRayIdealSubgroup m
 

def idealRayProjection (m : Modulus K) :
    idelePrimeToModulusSubgroup m →*
      IdealRayClassGroup m :=
  (QuotientGroup.mk' (principalRayIdealSubgroup m)).comp
    (primeToIdealMap m)
 

def raySubgroupInPrimeTo (m : Modulus K) :
    Subgroup (idelePrimeToModulusSubgroup m) :=
  congruenceSubgroupInPrimeTo m ⊔
    principalSubgroupInPrimeTo m
theorem idealRayProjection_surjective (m : Modulus K) :
    Function.Surjective (idealRayProjection m) := by
  intro c
  obtain ⟨I, rfl⟩ :=
    QuotientGroup.mk'_surjective
      (principalRayIdealSubgroup m) c
  obtain ⟨a, rfl⟩ := primeToIdealMap_surjective m I
  exact ⟨a, rfl⟩
theorem idealRayProjection_ker (m : Modulus K) :
    (idealRayProjection m).ker =
      raySubgroupInPrimeTo m := by
  ext a
  constructor
  · intro ha
    change QuotientGroup.mk'
        (principalRayIdealSubgroup m)
        (primeToIdealMap m a) = 1 at ha
    rw [QuotientGroup.mk'_apply,
      QuotientGroup.eq_one_iff] at ha
    obtain ⟨p, hp, hpa⟩ := ha
    let n : idelePrimeToModulusSubgroup m := a * p⁻¹
    have hn : n ∈ congruenceSubgroupInPrimeTo m := by
      rw [← primeToIdealMap_ker m, MonoidHom.mem_ker]
      change primeToIdealMap m (a * p⁻¹) = 1
      rw [map_mul, map_inv, hpa]
      simp
    rw [raySubgroupInPrimeTo, Subgroup.mem_sup]
    refine ⟨n, hn, p, hp, ?_⟩
    dsimp [n]
    group
  · intro ha
    rw [raySubgroupInPrimeTo, Subgroup.mem_sup] at ha
    obtain ⟨n, hn, p, hp, rfl⟩ := ha
    change QuotientGroup.mk'
        (principalRayIdealSubgroup m)
        (primeToIdealMap m (n * p)) = 1
    rw [map_mul]
    have hn' : primeToIdealMap m n = 1 :=
      MonoidHom.mem_ker.mp
        ((primeToIdealMap_ker m).symm ▸ hn)
    rw [hn', one_mul]
    rw [QuotientGroup.mk'_apply,
      QuotientGroup.eq_one_iff]
    exact ⟨p, hp, rfl⟩
 

def quotientRaySubgroupEquivIdealRayClassGroup
    (m : Modulus K) :
    idelePrimeToModulusSubgroup m ⧸
        raySubgroupInPrimeTo m ≃*
      IdealRayClassGroup m :=
  (QuotientGroup.quotientMulEquivOfEq
      (idealRayProjection_ker m).symm).trans
    (QuotientGroup.quotientKerEquivOfSurjective
      (idealRayProjection m)
      (idealRayProjection_surjective m))
 

@[simp]
theorem quotientRaySubgroupEquivIdealRayClassGroup_mk
    (m : Modulus K) (a : idelePrimeToModulusSubgroup m) :
    quotientRaySubgroupEquivIdealRayClassGroup m
        (QuotientGroup.mk' (raySubgroupInPrimeTo m) a) =
      idealRayProjection m a := by
  rw [quotientRaySubgroupEquivIdealRayClassGroup,
    MulEquiv.trans_apply, QuotientGroup.mk'_apply,
    QuotientGroup.quotientMulEquivOfEq_mk]
  exact QuotientGroup.kerLift_mk (idealRayProjection m) a
 
abbrev ApproximationPlace (m : Modulus K) :=
  (↥m.finitePart.support) ⊕ InfinitePlace K
 
abbrev approximationAbsoluteValue (m : Modulus K) :
    ApproximationPlace m → AbsoluteValue K ℝ
  | Sum.inl v => NumberField.HeightOneSpectrum.adicAbv K v.1
  | Sum.inr w => w.1
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
theorem adicAbv_not_isEquiv_of_ne
    {v w : HeightOneSpectrum (𝓞 K)} (hvw : v ≠ w) :
    ¬ (NumberField.HeightOneSpectrum.adicAbv K v).IsEquiv
      (NumberField.HeightOneSpectrum.adicAbv K w) := by
  intro h
  have hnotle : ¬ v.asIdeal ≤ w.asIdeal := by
    intro hvw_le
    have htop_le : (⊤ : Ideal (𝓞 K)) ≤ w.asIdeal := by
      rw [← (v.isCoprime_of_ne w hvw).sup_eq]
      exact sup_le hvw_le le_rfl
    exact w.isPrime.ne_top (top_unique htop_le)
  obtain ⟨x, hxv, hxw⟩ := Set.not_subset.mp hnotle
  have hvlt :
      NumberField.HeightOneSpectrum.adicAbv K v
        (algebraMap (𝓞 K) K x) < 1 := by
    rw [← FinitePlace.norm_embedding]
    exact (FinitePlace.norm_lt_one_iff_mem (K := K) v x).2 hxv
  have hweq :
      NumberField.HeightOneSpectrum.adicAbv K w
        (algebraMap (𝓞 K) K x) = 1 := by
    rw [← FinitePlace.norm_embedding]
    exact (FinitePlace.norm_eq_one_iff_notMem (K := K) w x).2 hxw
  exact (ne_of_lt hvlt) (h.eq_one_iff.mpr hweq)
theorem adicAbv_not_isEquiv_infinitePlace
    (v : HeightOneSpectrum (𝓞 K)) (w : InfinitePlace K) :
    ¬ (NumberField.HeightOneSpectrum.adicAbv K v).IsEquiv w.1 := by
  intro h
  have hle :
      w.1 ((2 : ℕ) : K) ≤ 1 :=
    h.le_one_iff.mp
      (NumberField.HeightOneSpectrum.adicAbv_natCast_le_one K v 2)
  have hw :
      w.1 ((2 : ℕ) : K) = (2 : ℝ) :=
    NumberField.InfinitePlace.map_natCast w 2
  have hfalse : (2 : ℝ) ≤ 1 := hw ▸ hle
  norm_num at hfalse
theorem approximationAbsoluteValue_isNontrivial
    (m : Modulus K) :
    ∀ i, (approximationAbsoluteValue m i).IsNontrivial
  | Sum.inl v => by
      change
        (NumberField.HeightOneSpectrum.adicAbv K v.1).IsNontrivial
      exact adicAbv_isNontrivial v.1
  | Sum.inr w => by
      change w.1.IsNontrivial
      exact w.isNontrivial
theorem approximationAbsoluteValue_pairwise
    (m : Modulus K) :
    Pairwise fun i j =>
      ¬ (approximationAbsoluteValue m i).IsEquiv
        (approximationAbsoluteValue m j) := by
  intro i j hij
  cases i with
  | inl v =>
      cases j with
      | inl w =>
          apply adicAbv_not_isEquiv_of_ne
          intro hvw
          apply hij
          exact congrArg Sum.inl (Subtype.ext hvw)
      | inr w =>
          exact adicAbv_not_isEquiv_infinitePlace v.1 w
  | inr v =>
      cases j with
      | inl w =>
          exact fun h =>
            adicAbv_not_isEquiv_infinitePlace w.1 v h.symm
      | inr w =>
          intro h
          apply hij
          congr
          change v.1.IsEquiv w.1 at h
          exact
            (InfinitePlace.eq_iff_isEquiv (K := K)).mpr h
 
abbrev approximationCompletion (m : Modulus K) :
    ApproximationPlace m → Type _
  | Sum.inl v => v.1.adicCompletion K
  | Sum.inr w => w.Completion
noncomputable instance approximationCompletionTopologicalSpace
    (m : Modulus K) (i : ApproximationPlace m) :
    TopologicalSpace (approximationCompletion m i) := by
  cases i <;> simp only [approximationCompletion] <;> infer_instance
 
def approximationCompletionMap (m : Modulus K) :
    ∀ i : ApproximationPlace m,
      WithAbs (approximationAbsoluteValue m i) →
        approximationCompletion m i
  | Sum.inl v =>
      fun x =>
        FinitePlace.embedding v.1
          (WithAbs.equiv
            (NumberField.HeightOneSpectrum.adicAbv K v.1) x)
  | Sum.inr w => fun x => (x : w.Completion)
theorem denseRange_finiteApproximationCompletionMap
    (v : HeightOneSpectrum (𝓞 K)) :
    DenseRange
      (fun x :
          WithAbs (NumberField.HeightOneSpectrum.adicAbv K v) =>
        FinitePlace.embedding v
          (WithAbs.equiv
            (NumberField.HeightOneSpectrum.adicAbv K v) x)) := by
  have hrange :
      Set.range
          (fun x :
              WithAbs (NumberField.HeightOneSpectrum.adicAbv K v) =>
            FinitePlace.embedding v
              (WithAbs.equiv
                (NumberField.HeightOneSpectrum.adicAbv K v) x)) =
        Set.range (algebraMap K (v.adicCompletion K)) := by
    ext y
    constructor
    · rintro ⟨x, rfl⟩
      exact
        ⟨WithAbs.equiv
            (NumberField.HeightOneSpectrum.adicAbv K v) x, rfl⟩
    · rintro ⟨x, rfl⟩
      refine
        ⟨(WithAbs.equiv
            (NumberField.HeightOneSpectrum.adicAbv K v)).symm x, ?_⟩
      rfl
  rw [DenseRange, hrange]
  exact v.denseRange_algebraMap K
theorem continuous_finiteApproximationCompletionMap
    (v : HeightOneSpectrum (𝓞 K)) :
    Continuous
      (fun x :
          WithAbs (NumberField.HeightOneSpectrum.adicAbv K v) =>
        FinitePlace.embedding v
          (WithAbs.equiv
            (NumberField.HeightOneSpectrum.adicAbv K v) x)) := by
  apply Isometry.continuous
  apply Isometry.of_dist_eq
  intro x y
  rw [dist_eq_norm, dist_eq_norm, ← map_sub,
    FinitePlace.norm_embedding]
  rfl
theorem denseRange_approximationCompletionMap
    (m : Modulus K) :
    ∀ i, DenseRange (approximationCompletionMap m i)
  | Sum.inl v => denseRange_finiteApproximationCompletionMap v.1
  | Sum.inr w =>
      NumberField.InfinitePlace.Completion.denseRange_coe w
theorem continuous_approximationCompletionMap
    (m : Modulus K) :
    ∀ i, Continuous (approximationCompletionMap m i)
  | Sum.inl v => continuous_finiteApproximationCompletionMap v.1
  | Sum.inr w =>
      NumberField.InfinitePlace.Completion.continuous_coe w
 

def approximationEmbedding (m : Modulus K) :
    K → (i : ApproximationPlace m) → approximationCompletion m i :=
  (Pi.map (approximationCompletionMap m)) ∘
    algebraMap K
      ((i : ApproximationPlace m) →
        WithAbs (approximationAbsoluteValue m i))
theorem denseRange_approximationEmbedding (m : Modulus K) :
    DenseRange (approximationEmbedding m) := by
  exact
    (DenseRange.piMap
      (denseRange_approximationCompletionMap m)).comp
      (AbsoluteValue.denseRange_algebraMap_pi
        (approximationAbsoluteValue_isNontrivial m)
        (approximationAbsoluteValue_pairwise m))
      (.piMap (continuous_approximationCompletionMap m))
 

def unitRatioSet
    {F : Type*} [Field F] (a : Fˣ) (U : Subgroup Fˣ) :
    Set F :=
  Units.val '' (fun y : Fˣ => a * y⁻¹) ⁻¹' (U : Set Fˣ)
 
theorem isOpen_unitRatioSet
    {F : Type*} [Field F] [TopologicalSpace F]
    [IsTopologicalRing F] [ContinuousInv₀ F] [T1Space F]
    (a : Fˣ) (U : Subgroup Fˣ)
    (hU : IsOpen (U : Set Fˣ)) :
    IsOpen (unitRatioSet a U) := by
  apply IsOpenUnits.isOpenEmbedding_unitsVal.isOpenMap
  exact hU.preimage (continuous_const.mul continuous_inv)
 
theorem val_mem_unitRatioSet
    {F : Type*} [Field F] (a : Fˣ) (U : Subgroup Fˣ) :
    (a : F) ∈ unitRatioSet a U := by
  exact ⟨a, by simp, rfl⟩
 
def approximationTarget (m : Modulus K) (a : IdeleGroup K) :
    ∀ i : ApproximationPlace m, Set (approximationCompletion m i)
  | Sum.inl v =>
      unitRatioSet (a.2 v.1)
        (localHigherUnitGroup v.1 (m.finitePart v.1))
  | Sum.inr w =>
      unitRatioSet
        (ContinuousMulEquiv.piUnits a.1 w)
        (m.localInfiniteCongruenceSubgroup w)
theorem isOpen_approximationTarget
    (m : Modulus K) (a : IdeleGroup K) :
    ∀ i, IsOpen (approximationTarget m a i)
  | Sum.inl v => by
      change IsOpen
        (unitRatioSet (a.2 v.1)
          (localHigherUnitGroup v.1 (m.finitePart v.1)))
      exact isOpen_unitRatioSet _ _
        (isOpen_localHigherUnitGroup v.1 (m.finitePart v.1))
  | Sum.inr w => by
      change IsOpen
        (unitRatioSet
          (ContinuousMulEquiv.piUnits a.1 w)
          (m.localInfiniteCongruenceSubgroup w))
      apply isOpen_unitRatioSet _ _
      classical
      by_cases hw : w.IsReal
      · by_cases hmem : (⟨w, hw⟩ : RealPlace K) ∈ m.infinitePart
        · rw [Modulus.localInfiniteCongruenceSubgroup,
            dif_pos hw, dif_pos hmem]
          exact isOpen_infinitePositiveSubgroup w
        · rw [Modulus.localInfiniteCongruenceSubgroup,
            dif_pos hw, dif_neg hmem]
          exact isOpen_univ
      · rw [Modulus.localInfiniteCongruenceSubgroup, dif_neg hw]
        exact isOpen_univ
 

def approximationTargetPoint
    (m : Modulus K) (a : IdeleGroup K) :
    (i : ApproximationPlace m) → approximationCompletion m i
  | Sum.inl v => (a.2 v.1 : v.1.adicCompletion K)
  | Sum.inr w =>
      (ContinuousMulEquiv.piUnits a.1 w : w.Completion)
theorem approximationTargetPoint_mem
    (m : Modulus K) (a : IdeleGroup K) :
    approximationTargetPoint m a ∈
      Set.univ.pi (approximationTarget m a) := by
  intro i _hi
  cases i with
  | inl v =>
      exact val_mem_unitRatioSet _ _
  | inr w =>
      exact val_mem_unitRatioSet _ _
 

theorem exists_principal_quotient_mem_primeTo
    (m : Modulus K) (a : IdeleGroup K) :
    ∃ x : Kˣ,
      a * (IdeleGroup.principalIdele K x)⁻¹ ∈
        idelePrimeToModulusSubgroup m := by
  let U : Set
      ((i : ApproximationPlace m) → approximationCompletion m i) :=
    Set.univ.pi (approximationTarget m a)
  have hUOpen : IsOpen U := by
    exact isOpen_set_pi Set.finite_univ fun i _hi =>
      isOpen_approximationTarget m a i
  have hUNonempty : U.Nonempty :=
    ⟨approximationTargetPoint m a,
      approximationTargetPoint_mem m a⟩
  obtain ⟨x, hx⟩ :=
    (denseRange_approximationEmbedding m).exists_mem_open
      hUOpen hUNonempty
  let w₀ : InfinitePlace K := Classical.choice inferInstance
  have hxw₀ :=
    hx (Sum.inr w₀) (Set.mem_univ (Sum.inr w₀))
  change
    (x : w₀.Completion) ∈
      unitRatioSet
        (ContinuousMulEquiv.piUnits a.1 w₀)
        (m.localInfiniteCongruenceSubgroup w₀) at hxw₀
  obtain ⟨y₀, _hy₀, hy₀x⟩ := hxw₀
  have hx0 : x ≠ 0 := by
    intro hxzero
    apply Units.ne_zero y₀
    rw [hy₀x, hxzero,
      NumberField.InfinitePlace.Completion.coe_zero]
  let xu : Kˣ := Units.mk0 x hx0
  refine ⟨xu, ?_⟩
  constructor
  · apply
      (Modulus.mem_infiniteCongruenceSubgroup_iff_local m
        (a * (IdeleGroup.principalIdele K xu)⁻¹).1).2
    intro w
    have hw :=
      hx (Sum.inr w) (Set.mem_univ (Sum.inr w))
    change
      (x : w.Completion) ∈
        unitRatioSet
          (ContinuousMulEquiv.piUnits a.1 w)
          (m.localInfiniteCongruenceSubgroup w) at hw
    obtain ⟨y, hy, hyx⟩ := hw
    have hprincipal :
        ContinuousMulEquiv.piUnits
            (IdeleGroup.principalIdele K xu).1 w =
          y := by
      apply Units.ext
      calc
        ((ContinuousMulEquiv.piUnits
            (IdeleGroup.principalIdele K xu).1 w :
              w.Completionˣ) : w.Completion) =
            (xu : K) :=
          IdeleGroup.infiniteComponent_principalIdele xu w
        _ = (x : K) := rfl
        _ = (y : w.Completion) := hyx.symm
    change
      ContinuousMulEquiv.piUnits a.1 w *
          (ContinuousMulEquiv.piUnits
            (IdeleGroup.principalIdele K xu).1 w)⁻¹ ∈
        m.localInfiniteCongruenceSubgroup w
    rw [hprincipal]
    exact hy
  · intro v hv
    let vm : ↥m.finitePart.support := ⟨v, hv⟩
    have hvx :=
      hx (Sum.inl vm) (Set.mem_univ (Sum.inl vm))
    change
      FinitePlace.embedding v x ∈
        unitRatioSet (a.2 v)
          (localHigherUnitGroup v (m.finitePart v)) at hvx
    obtain ⟨y, hy, hyx⟩ := hvx
    have hprincipal :
        (IdeleGroup.principalIdele K xu).2 v = y := by
      apply Units.ext
      calc
        (((IdeleGroup.principalIdele K xu).2 v :
            (v.adicCompletion K)ˣ) : v.adicCompletion K) =
            (xu : K) :=
          IdeleGroup.finiteComponent_principalIdele xu v
        _ = (x : K) := rfl
        _ = (y : v.adicCompletion K) := hyx.symm
    change
      a.2 v *
          ((IdeleGroup.principalIdele K xu).2 v)⁻¹ ∈
        localHigherUnitGroup v (m.finitePart v)
    rw [hprincipal]
    exact hy
 

theorem idelePrimeToModulusSubgroup_sup_principalSubgroup
    (m : Modulus K) :
    idelePrimeToModulusSubgroup m ⊔
        IdeleGroup.principalSubgroup K =
      ⊤ := by
  apply top_unique
  intro a _ha
  obtain ⟨x, hx⟩ :=
    exists_principal_quotient_mem_primeTo m a
  rw [Subgroup.mem_sup]
  refine
    ⟨a * (IdeleGroup.principalIdele K x)⁻¹, hx,
      IdeleGroup.principalIdele K x, ⟨x, rfl⟩, ?_⟩
  group
 

def primeToRayClassProjection (m : Modulus K) :
    idelePrimeToModulusSubgroup m →*
      IdeleGroup K ⧸
        (m.ideleCongruenceSubgroup ⊔
          IdeleGroup.principalSubgroup K) :=
  (QuotientGroup.mk'
    (m.ideleCongruenceSubgroup ⊔
      IdeleGroup.principalSubgroup K)).comp
    (idelePrimeToModulusSubgroup m).subtype
theorem primeToRayClassProjection_ker (m : Modulus K) :
    (primeToRayClassProjection m).ker =
      raySubgroupInPrimeTo m := by
  ext a
  constructor
  · intro ha
    have hN :
        (a : IdeleGroup K) ∈
          m.ideleCongruenceSubgroup ⊔
            IdeleGroup.principalSubgroup K := by
      rw [← QuotientGroup.eq_one_iff]
      exact MonoidHom.mem_ker.mp ha
    rw [Subgroup.mem_sup] at hN
    obtain ⟨c, hc, p, hp, hcp⟩ := hN
    have hcA :
        c ∈ idelePrimeToModulusSubgroup m :=
      ideleCongruenceSubgroup_le_primeTo m hc
    have hpA :
        p ∈ idelePrimeToModulusSubgroup m := by
      have haA :
          (a : IdeleGroup K) ∈
            idelePrimeToModulusSubgroup m :=
        a.property
      have hmul :
          c⁻¹ * (a : IdeleGroup K) ∈
            idelePrimeToModulusSubgroup m :=
        (idelePrimeToModulusSubgroup m).mul_mem
          ((idelePrimeToModulusSubgroup m).inv_mem hcA) haA
      rw [← hcp] at hmul
      simpa using hmul
    rw [raySubgroupInPrimeTo, Subgroup.mem_sup]
    refine
      ⟨⟨c, hcA⟩, ?_, ⟨p, hpA⟩, ?_, ?_⟩
    · exact hc
    · exact hp
    · apply Subtype.ext
      exact hcp
  · intro ha
    apply MonoidHom.mem_ker.mpr
    change
      QuotientGroup.mk'
          (m.ideleCongruenceSubgroup ⊔
            IdeleGroup.principalSubgroup K)
          (a : IdeleGroup K) =
        1
    rw [QuotientGroup.mk'_apply,
      QuotientGroup.eq_one_iff]
    rw [raySubgroupInPrimeTo, Subgroup.mem_sup] at ha
    obtain ⟨c, hc, p, hp, rfl⟩ := ha
    apply
      (m.ideleCongruenceSubgroup ⊔
        IdeleGroup.principalSubgroup K).mul_mem
    · exact
        (show m.ideleCongruenceSubgroup ≤
            m.ideleCongruenceSubgroup ⊔
              IdeleGroup.principalSubgroup K from le_sup_left) hc
    · exact
      (show IdeleGroup.principalSubgroup K ≤
            m.ideleCongruenceSubgroup ⊔
              IdeleGroup.principalSubgroup K from le_sup_right) hp
theorem primeToRayClassProjection_surjective (m : Modulus K) :
    Function.Surjective (primeToRayClassProjection m) := by
  intro q
  refine q.inductionOn' ?_
  intro g
  have hg :
      g ∈ idelePrimeToModulusSubgroup m ⊔
        IdeleGroup.principalSubgroup K := by
    rw [idelePrimeToModulusSubgroup_sup_principalSubgroup m]
    exact Subgroup.mem_top g
  rw [Subgroup.mem_sup] at hg
  obtain ⟨a, ha, p, hp, hap⟩ := hg
  refine ⟨⟨a, ha⟩, ?_⟩
  change
    QuotientGroup.mk'
        (m.ideleCongruenceSubgroup ⊔
          IdeleGroup.principalSubgroup K) a =
      QuotientGroup.mk'
        (m.ideleCongruenceSubgroup ⊔
          IdeleGroup.principalSubgroup K) g
  rw [← hap, map_mul]
  have hpN :
      p ∈ m.ideleCongruenceSubgroup ⊔
        IdeleGroup.principalSubgroup K :=
    (show IdeleGroup.principalSubgroup K ≤
        m.ideleCongruenceSubgroup ⊔
          IdeleGroup.principalSubgroup K from le_sup_right) hp
  have hmkp :
      QuotientGroup.mk'
          (m.ideleCongruenceSubgroup ⊔
            IdeleGroup.principalSubgroup K) p =
        1 := by
    rw [QuotientGroup.mk'_apply,
      QuotientGroup.eq_one_iff]
    exact hpN
  rw [hmkp]
  exact
    (mul_one
      (QuotientGroup.mk'
        (m.ideleCongruenceSubgroup ⊔
          IdeleGroup.principalSubgroup K) a)).symm
 

def quotientRaySubgroupEquivIdeleRayQuotient
    (m : Modulus K) :
    idelePrimeToModulusSubgroup m ⧸
        raySubgroupInPrimeTo m ≃*
      IdeleGroup K ⧸
        (m.ideleCongruenceSubgroup ⊔
          IdeleGroup.principalSubgroup K) :=
  (QuotientGroup.quotientMulEquivOfEq
      (primeToRayClassProjection_ker m).symm).trans
    (QuotientGroup.quotientKerEquivOfSurjective
      (primeToRayClassProjection m)
      (primeToRayClassProjection_surjective m))
 

@[simp]
theorem quotientRaySubgroupEquivIdeleRayQuotient_mk
    (m : Modulus K) (a : idelePrimeToModulusSubgroup m) :
    quotientRaySubgroupEquivIdeleRayQuotient m
        (QuotientGroup.mk' (raySubgroupInPrimeTo m) a) =
      primeToRayClassProjection m a := by
  rw [quotientRaySubgroupEquivIdeleRayQuotient,
    MulEquiv.trans_apply, QuotientGroup.mk'_apply,
    QuotientGroup.quotientMulEquivOfEq_mk]
  exact QuotientGroup.kerLift_mk (primeToRayClassProjection m) a
end RayClass
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.RayClass.IdealNorm -/
section
open scoped BigOperators Classical NumberField Topology
open NumberField IsDedekindDomain
noncomputable section
namespace RayClass
variable
    {K L : Type}
    [Field K] [NumberField K]
    [Field L] [NumberField L] [Algebra K L]
    [FiniteDimensional K L]
 

@[simp]
theorem _root_.IdeleGroup.count_fractionalIdeal
    (a : IdeleGroup K)
    (v : HeightOneSpectrum (𝓞 K)) :
    FractionalIdeal.count K v
        (IdeleGroup.fractionalIdeal a :
          FractionalIdeal (nonZeroDivisors (𝓞 K)) K) =
      (FiniteIdeleGroup.localOrder v
        (IdeleGroup.finiteComponent v a)).toAdd := by
  change
    FractionalIdeal.count K v
        (((FractionalIdealGroup.factorization (K := K))
          (FiniteIdeleGroup.valuationVector a.2) :
            FractionalIdealGroup K) :
          FractionalIdeal (nonZeroDivisors (𝓞 K)) K) =
      _
  rw [FractionalIdealGroup.count_factorization]
  rfl
end RayClass
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.RayClass.Rational -/
section
open scoped NumberField Classical
open NumberField IsDedekindDomain
noncomputable section
namespace RayClass
local instance rationalRingOfIntegersIsPrincipalIdealRing :
    IsPrincipalIdealRing (𝓞 ℚ) :=
  IsPrincipalIdealRing.of_surjective
    Rat.ringOfIntegersEquiv.symm
    Rat.ringOfIntegersEquiv.symm.surjective
local instance rationalPrimesEquivPrimeFact
    (v : HeightOneSpectrum (𝓞 ℚ)) :
    Fact
      (Nat.Prime
        ((Rat.HeightOneSpectrum.primesEquiv
          (R := 𝓞 ℚ) v : Nat.Primes) : ℕ)) :=
  ⟨(Rat.HeightOneSpectrum.primesEquiv
    (R := 𝓞 ℚ) v).property⟩
 
noncomputable abbrev rationalPrime (p : Nat.Primes) :
    HeightOneSpectrum (𝓞 ℚ) :=
  (Rat.HeightOneSpectrum.primesEquiv (R := 𝓞 ℚ)).symm p
@[simp]
theorem natGenerator_rationalPrime (p : Nat.Primes) :
    Rat.HeightOneSpectrum.natGenerator (rationalPrime p) = p := by
  exact congrArg Subtype.val
    ((Rat.HeightOneSpectrum.primesEquiv (R := 𝓞 ℚ)).apply_symm_apply p)
theorem rational_natGenerator_injective :
    Function.Injective
      (Rat.HeightOneSpectrum.natGenerator :
        HeightOneSpectrum (𝓞 ℚ) → ℕ) := by
  intro v w hvw
  apply (Rat.HeightOneSpectrum.primesEquiv (R := 𝓞 ℚ)).injective
  exact Subtype.ext hvw
 



noncomputable def rationalFiniteModulus (m : ℕ) : FiniteModulus ℚ :=
  Finsupp.comapDomain
    Rat.HeightOneSpectrum.natGenerator
    m.factorization
    rational_natGenerator_injective.injOn
@[simp]
theorem rationalFiniteModulus_apply
    (m : ℕ) (v : HeightOneSpectrum (𝓞 ℚ)) :
    rationalFiniteModulus m v =
      m.factorization (Rat.HeightOneSpectrum.natGenerator v) := by
  rw [rationalFiniteModulus, Finsupp.comapDomain_apply]
 

noncomputable def rationalModulus (m : ℕ) : Modulus ℚ :=
  Modulus.narrowOfFinite (rationalFiniteModulus m)
@[simp]
theorem rationalModulus_finitePart_apply
    (m : ℕ) (v : HeightOneSpectrum (𝓞 ℚ)) :
    (rationalModulus m).finitePart v =
      m.factorization (Rat.HeightOneSpectrum.natGenerator v) := by
  rw [rationalModulus, Modulus.finitePart_narrowOfFinite,
    rationalFiniteModulus_apply]
theorem mem_rationalFiniteModulus_support_iff
    {m : ℕ} (hm : m ≠ 0) (v : HeightOneSpectrum (𝓞 ℚ)) :
    v ∈ (rationalFiniteModulus m).support ↔
      Rat.HeightOneSpectrum.natGenerator v ∣ m := by
  rw [Finsupp.mem_support_iff, rationalFiniteModulus_apply]
  simp [Nat.factorization_eq_zero_iff,
    Rat.HeightOneSpectrum.prime_natGenerator, hm]
 
abbrev rationalFractionalIdeal (I : FractionalIdealGroup ℚ) :
    FractionalIdeal (nonZeroDivisors (𝓞 ℚ)) ℚ :=
  I
 

private noncomputable def rawRationalIdealGenerator
    (I : FractionalIdealGroup ℚ) : ℚ :=
  Submodule.IsPrincipal.generator
    ((rationalFractionalIdeal I : FractionalIdeal
      (nonZeroDivisors (𝓞 ℚ)) ℚ) : Submodule (𝓞 ℚ) ℚ)
private theorem rawRationalIdealGenerator_ne_zero
    (I : FractionalIdealGroup ℚ) :
    rawRationalIdealGenerator I ≠ 0 := by
  apply mt
    (Submodule.IsPrincipal.eq_bot_iff_generator_eq_zero
      ((rationalFractionalIdeal I : FractionalIdeal
        (nonZeroDivisors (𝓞 ℚ)) ℚ) : Submodule (𝓞 ℚ) ℚ)).2
  exact FractionalIdeal.coeToSubmodule_ne_bot.mpr (Units.ne_zero I)
 
noncomputable def positiveRationalIdealGenerator
    (I : FractionalIdealGroup ℚ) : ℚ :=
  if 0 < rawRationalIdealGenerator I then
    rawRationalIdealGenerator I
  else
    -rawRationalIdealGenerator I
theorem positiveRationalIdealGenerator_pos
    (I : FractionalIdealGroup ℚ) :
    0 < positiveRationalIdealGenerator I := by
  rw [positiveRationalIdealGenerator]
  split_ifs with h
  · exact h
  · exact neg_pos.mpr
      (lt_of_le_of_ne (not_lt.mp h)
        (rawRationalIdealGenerator_ne_zero I))
theorem rationalFractionalIdeal_eq_span_positiveGenerator
    (I : FractionalIdealGroup ℚ) :
    rationalFractionalIdeal I =
      FractionalIdeal.spanSingleton (nonZeroDivisors (𝓞 ℚ))
        (positiveRationalIdealGenerator I) := by
  calc
    rationalFractionalIdeal I =
        FractionalIdeal.spanSingleton (nonZeroDivisors (𝓞 ℚ))
          (rawRationalIdealGenerator I) :=
      FractionalIdeal.eq_spanSingleton_of_principal _
    _ = FractionalIdeal.spanSingleton (nonZeroDivisors (𝓞 ℚ))
          (positiveRationalIdealGenerator I) := by
      rw [positiveRationalIdealGenerator]
      split_ifs with h
      · rfl
      · apply
          (FractionalIdeal.spanSingleton_eq_spanSingleton
            (S := nonZeroDivisors (𝓞 ℚ))).2
        refine ⟨-1, ?_⟩
        simp
 

theorem eq_of_spanSingleton_eq_of_pos
    {x y : ℚ} (hx : 0 < x) (hy : 0 < y)
    (h :
      FractionalIdeal.spanSingleton (nonZeroDivisors (𝓞 ℚ)) x =
        FractionalIdeal.spanSingleton (nonZeroDivisors (𝓞 ℚ)) y) :
    x = y := by
  obtain ⟨u, hu⟩ :=
    (FractionalIdeal.spanSingleton_eq_spanSingleton
      (S := nonZeroDivisors (𝓞 ℚ))).1 h
  rcases Rat.RingOfIntegers.isUnit_iff.mp u.isUnit with hu1 | hu1
  · simpa [Units.smul_def, Algebra.smul_def, hu1] using hu
  · have hxy : -x = y := by
      simpa [Units.smul_def, Algebra.smul_def, hu1] using hu
    linarith
@[simp]
theorem positiveRationalIdealGenerator_one :
    positiveRationalIdealGenerator (1 : FractionalIdealGroup ℚ) = 1 := by
  apply eq_of_spanSingleton_eq_of_pos
    (positiveRationalIdealGenerator_pos 1) zero_lt_one
  rw [← rationalFractionalIdeal_eq_span_positiveGenerator]
  exact FractionalIdeal.spanSingleton_one.symm
theorem positiveRationalIdealGenerator_mul
    (I J : FractionalIdealGroup ℚ) :
    positiveRationalIdealGenerator (I * J) =
      positiveRationalIdealGenerator I *
        positiveRationalIdealGenerator J := by
  apply eq_of_spanSingleton_eq_of_pos
    (positiveRationalIdealGenerator_pos (I * J))
    (mul_pos (positiveRationalIdealGenerator_pos I)
      (positiveRationalIdealGenerator_pos J))
  rw [← rationalFractionalIdeal_eq_span_positiveGenerator,
    ← FractionalIdeal.spanSingleton_mul_spanSingleton,
    ← rationalFractionalIdeal_eq_span_positiveGenerator,
    ← rationalFractionalIdeal_eq_span_positiveGenerator]
  rfl
 
noncomputable def positiveRationalIdealGeneratorUnit
    (I : FractionalIdealGroup ℚ) : ℚˣ :=
  Units.mk0 (positiveRationalIdealGenerator I)
    (ne_of_gt (positiveRationalIdealGenerator_pos I))
@[simp]
theorem positiveRationalIdealGeneratorUnit_val
    (I : FractionalIdealGroup ℚ) :
    (positiveRationalIdealGeneratorUnit I : ℚ) =
      positiveRationalIdealGenerator I :=
  rfl
theorem toPrincipalIdeal_positiveRationalIdealGeneratorUnit
    (I : FractionalIdealGroup ℚ) :
    toPrincipalIdeal (𝓞 ℚ) ℚ
        (positiveRationalIdealGeneratorUnit I) = I := by
  apply Units.ext
  rw [coe_toPrincipalIdeal]
  change
    FractionalIdeal.spanSingleton (nonZeroDivisors (𝓞 ℚ))
        (positiveRationalIdealGenerator I) =
      rationalFractionalIdeal I
  exact (rationalFractionalIdeal_eq_span_positiveGenerator I).symm
 

theorem withZero_eq_one_of_log_eq_zero
    {x : WithZero (Multiplicative ℤ)} (hx : x ≠ 0)
    (hlog : WithZero.log x = 0) :
    x = 1 := by
  calc
    x = WithZero.exp (WithZero.log x) :=
      (WithZero.exp_log hx).symm
    _ = WithZero.exp 0 := congrArg WithZero.exp hlog
    _ = 1 := rfl
 

theorem valuation_eq_one_of_principal_count_eq_zero
    (x : ℚˣ) (v : HeightOneSpectrum (𝓞 ℚ))
    (hcount :
      FractionalIdeal.count ℚ v
        (toPrincipalIdeal (𝓞 ℚ) ℚ x :
          FractionalIdeal (nonZeroDivisors (𝓞 ℚ)) ℚ) = 0) :
    v.valuation ℚ (x : ℚ) = 1 := by
  rw [IdeleGroup.count_toPrincipalIdeal] at hcount
  have hlog :
      WithZero.log (v.valuation ℚ (x : ℚ)) = 0 :=
    neg_eq_zero.mp hcount
  have hvne : v.valuation ℚ (x : ℚ) ≠ 0 :=
    (v.valuation ℚ).ne_zero_of_unit x
  exact withZero_eq_one_of_log_eq_zero hvne hlog
 

theorem not_dvd_den_of_principal_count_eq_zero
    (x : ℚˣ) (v : HeightOneSpectrum (𝓞 ℚ))
    (hcount :
      FractionalIdeal.count ℚ v
        (toPrincipalIdeal (𝓞 ℚ) ℚ x :
          FractionalIdeal (nonZeroDivisors (𝓞 ℚ)) ℚ) = 0) :
    ¬ Rat.HeightOneSpectrum.natGenerator v ∣ (x : ℚ).den := by
  let p := Rat.HeightOneSpectrum.natGenerator v
  let : Fact p.Prime :=
    ⟨Rat.HeightOneSpectrum.prime_natGenerator v⟩
  have hequiv :=
    Rat.HeightOneSpectrum.valuation_equiv_padicValuation v
  have hpval : Rat.padicValuation p (x : ℚ) = 1 :=
    hequiv.eq_one_iff_eq_one.mp
      (valuation_eq_one_of_principal_count_eq_zero x v hcount)
  apply Rat.padicValuation_le_one_iff.mp
  exact le_of_eq hpval
 

theorem not_dvd_num_of_principal_count_eq_zero
    (x : ℚˣ) (v : HeightOneSpectrum (𝓞 ℚ))
    (hcount :
      FractionalIdeal.count ℚ v
        (toPrincipalIdeal (𝓞 ℚ) ℚ x :
          FractionalIdeal (nonZeroDivisors (𝓞 ℚ)) ℚ) = 0) :
    ¬ Rat.HeightOneSpectrum.natGenerator v ∣ (x : ℚ).num.natAbs := by
  let p := Rat.HeightOneSpectrum.natGenerator v
  let : Fact p.Prime :=
    ⟨Rat.HeightOneSpectrum.prime_natGenerator v⟩
  have hpval :
      Rat.padicValuation p (x : ℚ) = 1 :=
    (Rat.HeightOneSpectrum.valuation_equiv_padicValuation v).eq_one_iff_eq_one.mp
      (valuation_eq_one_of_principal_count_eq_zero x v hcount)
  have hden : ¬ p ∣ (x : ℚ).den :=
    not_dvd_den_of_principal_count_eq_zero x v hcount
  have hdenval :
      Int.padicValuation p ((x : ℚ).den : ℤ) = 1 :=
    Int.padicValuation_eq_one_iff.mpr
      (by simpa only [Int.natCast_dvd_natCast] using hden)
  rw [← (x : ℚ).num_div_den, map_div₀,
    Rat.padicValuation_cast, ← Int.cast_natCast,
    Rat.padicValuation_cast, hdenval, div_one] at hpval
  exact fun hpdiv =>
    (Int.padicValuation_eq_one_iff.mp hpval)
      (Int.natCast_dvd.mpr hpdiv)
theorem positiveGenerator_den_coprime
    {m : ℕ} (hm : m ≠ 0)
    (I : primeToModulusIdeals (rationalModulus m)) :
    Nat.Coprime
      (positiveRationalIdealGenerator (I : FractionalIdealGroup ℚ)).den m := by
  rw [Nat.coprime_comm]
  by_contra hcop
  obtain ⟨p, hp, hpm, hpden⟩ :=
    Nat.Prime.not_coprime_iff_dvd.mp hcop
  let v := rationalPrime ⟨p, hp⟩
  have hvgen : Rat.HeightOneSpectrum.natGenerator v = p :=
    natGenerator_rationalPrime ⟨p, hp⟩
  have hv : v ∈ (rationalModulus m).finitePart.support := by
    rw [rationalModulus, Modulus.finitePart_narrowOfFinite]
    rw [mem_rationalFiniteModulus_support_iff hm]
    rw [hvgen]
    exact hpm
  have hcount := I.property v hv
  rw [← toPrincipalIdeal_positiveRationalIdealGeneratorUnit
    (I : FractionalIdealGroup ℚ)] at hcount
  exact
    (not_dvd_den_of_principal_count_eq_zero
      (positiveRationalIdealGeneratorUnit
        (I : FractionalIdealGroup ℚ)) v hcount)
      (by
        rw [hvgen]
        exact hpden)
theorem positiveGenerator_num_coprime
    {m : ℕ} (hm : m ≠ 0)
    (I : primeToModulusIdeals (rationalModulus m)) :
    Nat.Coprime
      (positiveRationalIdealGenerator
        (I : FractionalIdealGroup ℚ)).num.natAbs m := by
  rw [Nat.coprime_comm]
  by_contra hcop
  obtain ⟨p, hp, hpm, hpnum⟩ :=
    Nat.Prime.not_coprime_iff_dvd.mp hcop
  let v := rationalPrime ⟨p, hp⟩
  have hvgen : Rat.HeightOneSpectrum.natGenerator v = p :=
    natGenerator_rationalPrime ⟨p, hp⟩
  have hv : v ∈ (rationalModulus m).finitePart.support := by
    rw [rationalModulus, Modulus.finitePart_narrowOfFinite]
    rw [mem_rationalFiniteModulus_support_iff hm]
    rw [hvgen]
    exact hpm
  have hcount := I.property v hv
  rw [← toPrincipalIdeal_positiveRationalIdealGeneratorUnit
    (I : FractionalIdealGroup ℚ)] at hcount
  exact
    (not_dvd_num_of_principal_count_eq_zero
      (positiveRationalIdealGeneratorUnit
        (I : FractionalIdealGroup ℚ)) v hcount)
      (by
        rw [hvgen]
        exact hpnum)
 
def rationalNumeratorResidueUnit
    (m : ℕ) (q : ℚ) (hq : Nat.Coprime q.num.natAbs m) :
    (ZMod m)ˣ :=
  ZMod.unitOfIsCoprime q.num <| by
    simpa [Int.isCoprime_iff_nat_coprime] using hq
 
def rationalDenominatorResidueUnit
    (m : ℕ) (q : ℚ) (hq : Nat.Coprime q.den m) :
    (ZMod m)ˣ :=
  ZMod.unitOfIsCoprime (q.den : ℤ) <| by
    simpa [Int.isCoprime_iff_nat_coprime] using hq
 

def rationalResidueUnit
    (m : ℕ) (q : ℚ)
    (hnum : Nat.Coprime q.num.natAbs m)
    (hden : Nat.Coprime q.den m) :
    (ZMod m)ˣ :=
  rationalNumeratorResidueUnit m q hnum *
    (rationalDenominatorResidueUnit m q hden)⁻¹
 
theorem rationalResidueUnit_congr
    (m : ℕ) {q r : ℚ} (hqr : q = r)
    (hqnum : Nat.Coprime q.num.natAbs m)
    (hqden : Nat.Coprime q.den m)
    (hrnum : Nat.Coprime r.num.natAbs m)
    (hrden : Nat.Coprime r.den m) :
    rationalResidueUnit m q hqnum hqden =
      rationalResidueUnit m r hrnum hrden := by
  subst r
  rfl
 
theorem rationalResidueUnit_mul
    (m : ℕ) (q r : ℚ)
    (hqnum : Nat.Coprime q.num.natAbs m)
    (hqden : Nat.Coprime q.den m)
    (hrnum : Nat.Coprime r.num.natAbs m)
    (hrden : Nat.Coprime r.den m)
    (hqrnum : Nat.Coprime (q * r).num.natAbs m)
    (hqrden : Nat.Coprime (q * r).den m) :
    rationalResidueUnit m (q * r) hqrnum hqrden =
      rationalResidueUnit m q hqnum hqden *
        rationalResidueUnit m r hrnum hrden := by
  let Nq := rationalNumeratorResidueUnit m q hqnum
  let Dq := rationalDenominatorResidueUnit m q hqden
  let Nr := rationalNumeratorResidueUnit m r hrnum
  let Dr := rationalDenominatorResidueUnit m r hrden
  let Nqr := rationalNumeratorResidueUnit m (q * r) hqrnum
  let Dqr := rationalDenominatorResidueUnit m (q * r) hqrden
  have hcross : Nqr * Dq * Dr = Nq * Nr * Dqr := by
    apply Units.ext
    have h :=
      congrArg (Int.castRingHom (ZMod m)) (Rat.mul_num_den' q r)
    simpa [Nq, Dq, Nr, Dr, Nqr, Dqr,
      rationalNumeratorResidueUnit,
      rationalDenominatorResidueUnit, map_mul] using h
  change Nqr * Dqr⁻¹ = (Nq * Dq⁻¹) * (Nr * Dr⁻¹)
  calc
    Nqr * Dqr⁻¹ =
        (Nqr * Dq * Dr) * (Dq⁻¹ * Dr⁻¹ * Dqr⁻¹) := by
      simp [mul_comm, mul_left_comm, mul_assoc]
    _ = (Nq * Nr * Dqr) * (Dq⁻¹ * Dr⁻¹ * Dqr⁻¹) := by
      rw [hcross]
    _ = (Nq * Dq⁻¹) * (Nr * Dr⁻¹) := by
      simp [mul_comm, mul_left_comm, mul_assoc]
 
theorem rationalResidueUnit_one (m : ℕ) :
    rationalResidueUnit m 1 (by simp) (by simp) = 1 := by
  apply Units.ext
  simp [rationalResidueUnit, rationalNumeratorResidueUnit,
    rationalDenominatorResidueUnit]
 

theorem rationalResidueUnit_eq_one_iff_modEq
    (m : ℕ) (q : ℚ)
    (hnum : Nat.Coprime q.num.natAbs m)
    (hden : Nat.Coprime q.den m) :
    rationalResidueUnit m q hnum hden = 1 ↔
      q.num ≡ (q.den : ℤ) [ZMOD m] := by
  let N := rationalNumeratorResidueUnit m q hnum
  let D := rationalDenominatorResidueUnit m q hden
  rw [← ZMod.intCast_eq_intCast_iff]
  constructor
  · intro h
    have hND : N = D := by
      calc
        N = (N * D⁻¹) * D := by simp
        _ = (1 : (ZMod m)ˣ) * D := by
          rw [show N * D⁻¹ = 1 by
            simpa only [N, D, rationalResidueUnit] using h]
        _ = D := one_mul D
    exact congrArg Units.val hND
  · intro hND
    have hND' : N = D := by
      apply Units.ext
      exact hND
    change N * D⁻¹ = 1
    rw [hND']
    exact mul_inv_cancel D
 

noncomputable def primeToIdealResidueHom
    (m : ℕ) (hm : m ≠ 0) :
    primeToModulusIdeals (rationalModulus m) →* (ZMod m)ˣ where
  toFun I :=
    rationalResidueUnit m
      (positiveRationalIdealGenerator (I : FractionalIdealGroup ℚ))
      (positiveGenerator_num_coprime hm I)
      (positiveGenerator_den_coprime hm I)
  map_one' := by
    change rationalResidueUnit m
      (positiveRationalIdealGenerator
        (1 : FractionalIdealGroup ℚ)) _ _ = 1
    calc
      rationalResidueUnit m
          (positiveRationalIdealGenerator
            (1 : FractionalIdealGroup ℚ)) _ _ =
        rationalResidueUnit m 1 (by simp) (by simp) :=
          rationalResidueUnit_congr m
            positiveRationalIdealGenerator_one _ _ _ _
      _ = 1 := rationalResidueUnit_one m
  map_mul' I J := by
    let q :=
      positiveRationalIdealGenerator (I : FractionalIdealGroup ℚ)
    let r :=
      positiveRationalIdealGenerator (J : FractionalIdealGroup ℚ)
    have hprodnum : Nat.Coprime (q * r).num.natAbs m := by
      rw [← positiveRationalIdealGenerator_mul]
      exact positiveGenerator_num_coprime hm (I * J)
    have hprodden : Nat.Coprime (q * r).den m := by
      rw [← positiveRationalIdealGenerator_mul]
      exact positiveGenerator_den_coprime hm (I * J)
    change rationalResidueUnit m
        (positiveRationalIdealGenerator
          ((I : FractionalIdealGroup ℚ) *
            (J : FractionalIdealGroup ℚ))) _ _ =
      rationalResidueUnit m q _ _ * rationalResidueUnit m r _ _
    calc
      rationalResidueUnit m
          (positiveRationalIdealGenerator
            ((I : FractionalIdealGroup ℚ) *
              (J : FractionalIdealGroup ℚ))) _ _ =
        rationalResidueUnit m (q * r) hprodnum hprodden :=
          rationalResidueUnit_congr m
            (positiveRationalIdealGenerator_mul I J) _ _ _ _
      _ = rationalResidueUnit m q
              (positiveGenerator_num_coprime hm I)
              (positiveGenerator_den_coprime hm I) *
            rationalResidueUnit m r
              (positiveGenerator_num_coprime hm J)
              (positiveGenerator_den_coprime hm J) :=
        rationalResidueUnit_mul m q r
          (positiveGenerator_num_coprime hm I)
          (positiveGenerator_den_coprime hm I)
          (positiveGenerator_num_coprime hm J)
          (positiveGenerator_den_coprime hm J)
          hprodnum hprodden
@[simp]
theorem primeToIdealResidueHom_apply
    (m : ℕ) (hm : m ≠ 0)
    (I : primeToModulusIdeals (rationalModulus m)) :
    primeToIdealResidueHom m hm I =
      rationalResidueUnit m
        (positiveRationalIdealGenerator
          (I : FractionalIdealGroup ℚ))
        (positiveGenerator_num_coprime hm I)
        (positiveGenerator_den_coprime hm I) :=
  rfl
 

theorem principalNat_mem_primeToModulusIdeals
    {m a : ℕ} (hm : m ≠ 0) (ha : a ≠ 0)
    (hcop : Nat.Coprime a m) :
    toPrincipalIdeal (𝓞 ℚ) ℚ
        (Units.mk0 (a : ℚ) (by exact_mod_cast ha)) ∈
      primeToModulusIdeals (rationalModulus m) := by
  intro v hv
  let p := Rat.HeightOneSpectrum.natGenerator v
  have hp : p.Prime :=
    Rat.HeightOneSpectrum.prime_natGenerator v
  have hpm : p ∣ m :=
    (by
      rw [rationalModulus, Modulus.finitePart_narrowOfFinite] at hv
      exact (mem_rationalFiniteModulus_support_iff hm v).mp hv)
  have hpa : ¬ p ∣ a :=
    hp.coprime_iff_not_dvd.mp
      (hcop.coprime_dvd_right hpm).symm
  let : Fact p.Prime := ⟨hp⟩
  have hpval : Rat.padicValuation p (a : ℚ) = 1 := by
    rw [← Int.cast_natCast, Rat.padicValuation_cast]
    exact Int.padicValuation_eq_one_iff.mpr
      (by simpa only [Int.natCast_dvd_natCast] using hpa)
  have hequiv :=
    Rat.HeightOneSpectrum.valuation_equiv_padicValuation v
  have hvval : v.valuation ℚ (a : ℚ) = 1 :=
    hequiv.eq_one_iff_eq_one.mpr hpval
  rw [IdeleGroup.count_toPrincipalIdeal]
  change -WithZero.log (v.valuation ℚ (a : ℚ)) = 0
  rw [hvval]
  rfl
 

theorem positiveGenerator_toPrincipalIdeal_nat
    {a : ℕ} (ha : 0 < a) :
    positiveRationalIdealGenerator
        (toPrincipalIdeal (𝓞 ℚ) ℚ
          (Units.mk0 (a : ℚ) (by exact_mod_cast ha.ne'))) =
      (a : ℚ) := by
  let x : ℚˣ :=
    Units.mk0 (a : ℚ) (by exact_mod_cast ha.ne')
  apply eq_of_spanSingleton_eq_of_pos
    (positiveRationalIdealGenerator_pos _)
    (by exact_mod_cast ha)
  rw [← rationalFractionalIdeal_eq_span_positiveGenerator]
  calc
    rationalFractionalIdeal
        (toPrincipalIdeal (𝓞 ℚ) ℚ x) =
      FractionalIdeal.spanSingleton (nonZeroDivisors (𝓞 ℚ))
        (x : ℚ) := by
          simpa only [rationalFractionalIdeal] using
            (coe_toPrincipalIdeal (R := 𝓞 ℚ) (K := ℚ) x)
    _ = FractionalIdeal.spanSingleton
        (nonZeroDivisors (𝓞 ℚ)) (a : ℚ) := rfl
 

theorem rationalNumeratorResidueUnit_natCast
    (m a : ℕ) (hcop : Nat.Coprime a m) :
    (rationalNumeratorResidueUnit m (a : ℚ)
        (by simpa using hcop) : ZMod m) =
      (a : ZMod m) := by
  simp [rationalNumeratorResidueUnit]
 
theorem rationalDenominatorResidueUnit_natCast
    (m a : ℕ) (hden : Nat.Coprime ((a : ℚ).den) m) :
    rationalDenominatorResidueUnit m (a : ℚ) hden = 1 := by
  apply Units.ext
  simp [rationalDenominatorResidueUnit]
 

theorem rationalResidueUnit_natCast
    (m a : ℕ) (hcop : Nat.Coprime a m) :
    (rationalResidueUnit m (a : ℚ)
        (by simpa using hcop) (by simp) : ZMod m) =
      (a : ZMod m) := by
  have hden :
      rationalDenominatorResidueUnit m (a : ℚ) (by simp) = 1 :=
    rationalDenominatorResidueUnit_natCast m a (by simp)
  change
    (rationalNumeratorResidueUnit m (a : ℚ) _ *
      (rationalDenominatorResidueUnit m (a : ℚ) _)⁻¹ :
        (ZMod m)ˣ) =
      (a : ZMod m)
  rw [hden, inv_one, mul_one]
  exact rationalNumeratorResidueUnit_natCast m a hcop
theorem primeToIdealResidueHom_surjective
    (m : ℕ) (hm : m ≠ 0) :
    Function.Surjective (primeToIdealResidueHom m hm) := by
  intro u
  let a : ℕ := (u : ZMod m).val + m
  have ha : 0 < a :=
    Nat.add_pos_right _ (Nat.pos_of_ne_zero hm)
  have hcop : Nat.Coprime a m := by
    change Nat.Coprime ((u : ZMod m).val + m) m
    rw [Nat.coprime_add_self_left]
    exact ZMod.val_coe_unit_coprime u
  let x : ℚˣ :=
    Units.mk0 (a : ℚ) (by exact_mod_cast ha.ne')
  let I : primeToModulusIdeals (rationalModulus m) :=
    ⟨toPrincipalIdeal (𝓞 ℚ) ℚ x,
      principalNat_mem_primeToModulusIdeals hm ha.ne' hcop⟩
  refine ⟨I, ?_⟩
  have hgen :
      positiveRationalIdealGenerator
          (I : FractionalIdealGroup ℚ) = (a : ℚ) := by
    exact positiveGenerator_toPrincipalIdeal_nat ha
  have hanum :
      Nat.Coprime ((a : ℚ).num.natAbs) m := by
    simpa using hcop
  have haden : Nat.Coprime ((a : ℚ).den) m := by
    simp
  apply Units.ext
  change
    (rationalResidueUnit m
      (positiveRationalIdealGenerator
        (I : FractionalIdealGroup ℚ)) _ _ : ZMod m) =
      (u : ZMod m)
  calc
    (rationalResidueUnit m
        (positiveRationalIdealGenerator
          (I : FractionalIdealGroup ℚ)) _ _ : ZMod m) =
      (rationalResidueUnit m (a : ℚ) hanum haden : ZMod m) :=
        congrArg Units.val
          (rationalResidueUnit_congr m hgen _ _ hanum haden)
    _ = (a : ZMod m) := rationalResidueUnit_natCast m a hcop
    _ = (u : ZMod m) := by
      let : NeZero m := ⟨hm⟩
      change (((u : ZMod m).val + m : ℕ) : ZMod m) =
        (u : ZMod m)
      rw [Nat.cast_add, ZMod.natCast_self, add_zero,
        ZMod.natCast_zmod_val]
 

def principalLocalIntegralUnit
    (v : HeightOneSpectrum (𝓞 ℚ)) (x : ℚˣ)
    (hx : v.valuation ℚ (x : ℚ) = 1) :
    (v.adicCompletionIntegers ℚ).units :=
  ⟨(IdeleGroup.principalIdele ℚ x).2 v, by
    rw [HeightOneSpectrum.adicCompletionIntegers.mem_units_iff_valued_eq_one]
    have hcomp :=
      IdeleGroup.finiteComponent_principalIdele x v
    rw [IdeleGroup.finiteComponent_apply] at hcomp
    rw [hcomp]
    rw [HeightOneSpectrum.valuedAdicCompletion_eq_valuation', hx]⟩
 
def rationalLocalIntegralValue
    (v : HeightOneSpectrum (𝓞 ℚ))
    (y : (v.adicCompletionIntegers ℚ).units) :
    v.adicCompletionIntegers ℚ :=
  ((v.adicCompletionIntegers ℚ).toSubmonoid.unitsEquivUnitsType y :
    (v.adicCompletionIntegers ℚ)ˣ).1
 

theorem rationalLocalHigherUnitMap_eq_one_iff
    (v : HeightOneSpectrum (𝓞 ℚ)) (n : ℕ)
    (y : (v.adicCompletionIntegers ℚ).units) :
    localHigherUnitMap v n y = 1 ↔
      rationalLocalIntegralValue v y - 1 ∈
        (IsLocalRing.maximalIdeal
          (v.adicCompletionIntegers ℚ)) ^ n := by
  let M :=
    (IsLocalRing.maximalIdeal
      (v.adicCompletionIntegers ℚ)) ^ n
  change
    Units.map (Ideal.Quotient.mk M).toMonoidHom
        ((v.adicCompletionIntegers ℚ).toSubmonoid.unitsEquivUnitsType y) =
      1 ↔ _
  rw [Units.ext_iff]
  change
    Ideal.Quotient.mk M (rationalLocalIntegralValue v y) =
      Ideal.Quotient.mk M 1 ↔ _
  exact Ideal.Quotient.mk_eq_mk_iff_sub_mem
    (I := M) (rationalLocalIntegralValue v y) 1
 

theorem principalLocalIntegralValue_coe
    (v : HeightOneSpectrum (𝓞 ℚ)) (x : ℚˣ)
    (hx : v.valuation ℚ (x : ℚ) = 1) :
    (rationalLocalIntegralValue v
      (principalLocalIntegralUnit v x hx) :
        v.adicCompletion ℚ) =
      NumberField.FinitePlace.embedding v (x : ℚ) := by
  change
    ((((IdeleGroup.principalIdele ℚ x).2 v :
      (v.adicCompletion ℚ)ˣ) : v.adicCompletion ℚ)) =
      NumberField.FinitePlace.embedding v (x : ℚ)
  have hcomp :=
    IdeleGroup.finiteComponent_principalIdele x v
  rw [IdeleGroup.finiteComponent_apply] at hcomp
  exact hcomp
 

theorem map_maximalIdeal_pow_padicIntEquiv
    (v : HeightOneSpectrum (𝓞 ℚ)) (n : ℕ) :
    ((IsLocalRing.maximalIdeal
        (v.adicCompletionIntegers ℚ)) ^ n).map
        (Rat.HeightOneSpectrum.adicCompletionIntegers.padicIntEquiv v).toRingEquiv =
      Ideal.span
        {(((Rat.HeightOneSpectrum.primesEquiv
          (R := 𝓞 ℚ) v : Nat.Primes) : ℕ) :
          ℤ_[((Rat.HeightOneSpectrum.primesEquiv
            (R := 𝓞 ℚ) v : Nat.Primes) : ℕ)]) ^ n} := by
  rw [Ideal.map_pow, IsLocalRing.map_ringEquiv_maximalIdeal,
    PadicInt.maximalIdeal_eq_span_p, Ideal.span_singleton_pow]
 

theorem rationalLocalIntegralValue_sub_mem_iff
    (v : HeightOneSpectrum (𝓞 ℚ)) (n : ℕ)
    (z : v.adicCompletionIntegers ℚ) :
    z - 1 ∈
        (IsLocalRing.maximalIdeal
          (v.adicCompletionIntegers ℚ)) ^ n ↔
      PadicInt.toZModPow n
          (Rat.HeightOneSpectrum.adicCompletionIntegers.padicIntEquiv v z) =
        1 := by
  let e :=
    Rat.HeightOneSpectrum.adicCompletionIntegers.padicIntEquiv v
  let M :=
    (IsLocalRing.maximalIdeal
      (v.adicCompletionIntegers ℚ)) ^ n
  constructor
  · intro hz
    have hez : e (z - 1) ∈ M.map e.toRingEquiv :=
      (Ideal.apply_mem_of_equiv_iff
        (I := M) (f := e.toRingEquiv) (x := z - 1)).2 hz
    rw [map_maximalIdeal_pow_padicIntEquiv,
      ← PadicInt.ker_toZModPow n] at hez
    have hzero :
        PadicInt.toZModPow n (e (z - 1)) = 0 :=
      (RingHom.mem_ker).1 hez
    simpa only [map_sub, map_one, sub_eq_zero] using hzero
  · intro hz
    have hzero :
        PadicInt.toZModPow n (e (z - 1)) = 0 := by
      simpa only [map_sub, map_one, sub_eq_zero] using hz
    have hez :
        e (z - 1) ∈ RingHom.ker (PadicInt.toZModPow n) :=
      (RingHom.mem_ker).2 hzero
    rw [PadicInt.ker_toZModPow,
      ← map_maximalIdeal_pow_padicIntEquiv] at hez
    exact
      (Ideal.apply_mem_of_equiv_iff
        (I := M) (f := e.toRingEquiv) (x := z - 1)).1 hez
 

@[simp]
theorem primesEquiv_val_eq_natGenerator
    (v : HeightOneSpectrum (𝓞 ℚ)) :
    ((Rat.HeightOneSpectrum.primesEquiv
      (R := 𝓞 ℚ) v : Nat.Primes) : ℕ) =
      Rat.HeightOneSpectrum.natGenerator v :=
  rfl
 

theorem principalFiniteComponent_mem_localHigherUnitGroup_iff
    (v : HeightOneSpectrum (𝓞 ℚ)) (n : ℕ) (x : ℚˣ)
    (hx : v.valuation ℚ (x : ℚ) = 1) :
    (IdeleGroup.principalIdele ℚ x).2 v ∈
        localHigherUnitGroup v n ↔
      localHigherUnitMap v n
        (principalLocalIntegralUnit v x hx) = 1 := by
  rw [mem_localHigherUnitGroup_iff]
  constructor
  · rintro ⟨y, hy, hymap⟩
    have hy' :
        y = principalLocalIntegralUnit v x hx := by
      apply Subtype.ext
      exact hy
    simpa only [hy'] using hymap
  · intro hmap
    exact ⟨principalLocalIntegralUnit v x hx, rfl, hmap⟩
 
theorem rational_den_mul_self_eq_num (q : ℚ) :
    (q.den : ℚ) * q = q.num := by
  have hden : (q.den : ℚ) ≠ 0 := by
    exact_mod_cast q.den_ne_zero
  have h := (div_eq_iff hden).mp q.num_div_den
  simpa only [mul_comm] using h.symm
 

theorem principalLocalIntegralValue_den_mul
    (v : HeightOneSpectrum (𝓞 ℚ)) (x : ℚˣ)
    (hx : v.valuation ℚ (x : ℚ) = 1) :
    algebraMap ℤ (v.adicCompletionIntegers ℚ) (x : ℚ).den *
        rationalLocalIntegralValue v
          (principalLocalIntegralUnit v x hx) =
      algebraMap ℤ (v.adicCompletionIntegers ℚ) (x : ℚ).num := by
  apply Subtype.ext
  simp only [algebraMap_int_eq, map_natCast, MulMemClass.coe_mul,
    SubringClass.coe_natCast, principalLocalIntegralValue_coe,
    eq_ratCast, eq_intCast, SubringClass.coe_intCast]
  simpa only [map_mul, map_natCast, map_intCast,
    NumberField.FinitePlace.embedding_apply, eq_ratCast] using
    congrArg (NumberField.FinitePlace.embedding v)
      (rational_den_mul_self_eq_num (x : ℚ))
 
abbrev rationalPadicPrime
    (v : HeightOneSpectrum (𝓞 ℚ)) : ℕ :=
  ((Rat.HeightOneSpectrum.primesEquiv
    (R := 𝓞 ℚ) v : Nat.Primes) : ℕ)
 

theorem principalLocalResidue_den_mul
    (v : HeightOneSpectrum (𝓞 ℚ)) (n : ℕ) (x : ℚˣ)
    (hx : v.valuation ℚ (x : ℚ) = 1) :
    ((x : ℚ).den : ZMod (rationalPadicPrime v ^ n)) *
        PadicInt.toZModPow n
          (Rat.HeightOneSpectrum.adicCompletionIntegers.padicIntEquiv v
            (rationalLocalIntegralValue v
              (principalLocalIntegralUnit v x hx))) =
      ((x : ℚ).num : ZMod (rationalPadicPrime v ^ n)) := by
  let e :=
    Rat.HeightOneSpectrum.adicCompletionIntegers.padicIntEquiv v
  have he :=
    congrArg e
      (principalLocalIntegralValue_den_mul v x hx)
  have hden :
      e (algebraMap ℤ (v.adicCompletionIntegers ℚ)
          ((x : ℚ).den : ℤ)) =
        algebraMap ℤ _ ((x : ℚ).den : ℤ) := by
    change e.toAlgEquiv
        (algebraMap ℤ (v.adicCompletionIntegers ℚ)
          ((x : ℚ).den : ℤ)) =
      algebraMap ℤ _ ((x : ℚ).den : ℤ)
    exact e.commutes ((x : ℚ).den : ℤ)
  have hnum :
      e (algebraMap ℤ (v.adicCompletionIntegers ℚ)
          (x : ℚ).num) =
        algebraMap ℤ _ (x : ℚ).num := by
    change e.toAlgEquiv
        (algebraMap ℤ (v.adicCompletionIntegers ℚ)
          (x : ℚ).num) =
      algebraMap ℤ _ (x : ℚ).num
    exact e.commutes (x : ℚ).num
  have he' := he
  rw [map_mul, hden, hnum] at he'
  have hz :=
    congrArg (PadicInt.toZModPow n) he'
  have hnumZ :
      PadicInt.toZModPow n
          (algebraMap ℤ ℤ_[rationalPadicPrime v] (x : ℚ).num) =
        ((x : ℚ).num : ZMod (rationalPadicPrime v ^ n)) := by
    have hcomp :
        (PadicInt.toZModPow n).comp
            (algebraMap ℤ ℤ_[rationalPadicPrime v]) =
          algebraMap ℤ (ZMod (rationalPadicPrime v ^ n)) :=
      RingHom.ext_int _ _
    exact DFunLike.congr_fun hcomp (x : ℚ).num
  rw [hnumZ] at hz
  dsimp only [e] at hz
  simpa only [algebraMap_int_eq, map_mul, map_natCast, map_intCast,
    Int.cast_natCast] using hz
 

theorem not_dvd_den_of_valuation_eq_one
    (v : HeightOneSpectrum (𝓞 ℚ)) (x : ℚˣ)
    (hx : v.valuation ℚ (x : ℚ) = 1) :
    ¬ Rat.HeightOneSpectrum.natGenerator v ∣ (x : ℚ).den := by
  let p := Rat.HeightOneSpectrum.natGenerator v
  let : Fact p.Prime :=
    ⟨Rat.HeightOneSpectrum.prime_natGenerator v⟩
  have hpval : Rat.padicValuation p (x : ℚ) = 1 :=
    (Rat.HeightOneSpectrum.valuation_equiv_padicValuation v).eq_one_iff_eq_one.mp hx
  exact Rat.padicValuation_le_one_iff.mp (le_of_eq hpval)
 

theorem principalLocalHigherUnit_iff_modEq
    (v : HeightOneSpectrum (𝓞 ℚ)) (n : ℕ) (x : ℚˣ)
    (hx : v.valuation ℚ (x : ℚ) = 1) :
    (IdeleGroup.principalIdele ℚ x).2 v ∈
        localHigherUnitGroup v n ↔
      (x : ℚ).num ≡ ((x : ℚ).den : ℤ)
        [ZMOD (Rat.HeightOneSpectrum.natGenerator v) ^ n] := by
  rw [principalFiniteComponent_mem_localHigherUnitGroup_iff v n x hx,
    rationalLocalHigherUnitMap_eq_one_iff,
    rationalLocalIntegralValue_sub_mem_iff]
  have hp : Nat.Prime (rationalPadicPrime v) :=
    (Rat.HeightOneSpectrum.primesEquiv
      (R := 𝓞 ℚ) v).property
  have hnot :
      ¬ rationalPadicPrime v ∣ (x : ℚ).den := by
    simpa only [primesEquiv_val_eq_natGenerator] using
      not_dvd_den_of_valuation_eq_one v x hx
  have hcop :
      Nat.Coprime (x : ℚ).den (rationalPadicPrime v ^ n) :=
    Nat.Coprime.pow_right n
      (hp.coprime_iff_not_dvd.mpr hnot).symm
  have hunit :
      IsUnit
        ((x : ℚ).den :
          ZMod (rationalPadicPrime v ^ n)) :=
    (ZMod.isUnit_iff_coprime _ _).mpr hcop
  have hrel :=
    principalLocalResidue_den_mul v n x hx
  rw [← primesEquiv_val_eq_natGenerator v,
    ← Int.natCast_pow, ← ZMod.intCast_eq_intCast_iff]
  constructor
  · intro hw
    calc
      ((x : ℚ).num :
          ZMod (rationalPadicPrime v ^ n)) =
          ((x : ℚ).den :
            ZMod (rationalPadicPrime v ^ n)) := by
        rw [← hrel, hw, mul_one]
      _ = (((x : ℚ).den : ℤ) :
          ZMod (rationalPadicPrime v ^ n)) := by
        simp only [Int.cast_natCast]
  · intro hnd
    apply hunit.mul_left_cancel
    rw [hrel, mul_one]
    simpa only [Int.cast_natCast] using hnd
 

theorem intModEq_finset_prod_of_pairwise_coprime
    {ι : Type*} [DecidableEq ι]
    (s : Finset ι) (f : ι → ℕ)
    (hpair :
      ∀ i ∈ s, ∀ j ∈ s, i ≠ j →
        Nat.Coprime (f i) (f j))
    {a b : ℤ}
    (hmod : ∀ i ∈ s, a ≡ b [ZMOD f i]) :
    a ≡ b [ZMOD ∏ i ∈ s, f i] := by
  induction s using Finset.induction_on with
  | empty =>
      exact Int.modEq_of_dvd (one_dvd (b - a))
  | @insert i s hi ih =>
      have hcop :
          Nat.Coprime (f i) (∏ j ∈ s, f j) := by
        apply Nat.Coprime.prod_right
        intro j hj
        exact hpair i (Finset.mem_insert_self i s) j
          (Finset.mem_insert_of_mem hj)
          (fun hij => hi (hij ▸ hj))
      have hcopInt :
          ((f i : ℤ).natAbs).Coprime
            ((∏ j ∈ s, (f j : ℤ)).natAbs) := by
        rw [show (∏ j ∈ s, (f j : ℤ)) =
          ((∏ j ∈ s, f j : ℕ) : ℤ) by norm_cast]
        simpa only [Int.natAbs_natCast] using hcop
      rw [Finset.prod_insert hi]
      apply
        (Int.modEq_and_modEq_iff_modEq_mul hcopInt).mp
      constructor
      · exact hmod i (Finset.mem_insert_self i s)
      · apply ih
        · intro j hj k hk hjk
          exact hpair j (Finset.mem_insert_of_mem hj) k
            (Finset.mem_insert_of_mem hk) hjk
        · intro j hj
          exact hmod j (Finset.mem_insert_of_mem hj)
 

theorem intModEq_of_primePower_modEq
    {m : ℕ} (hm : m ≠ 0) {a b : ℤ}
    (h :
      ∀ p : m.primeFactors,
        a ≡ b [ZMOD (p : ℕ) ^ m.factorization p]) :
    a ≡ b [ZMOD m] := by
  let f : m.primeFactors → ℕ :=
    fun p => (p : ℕ) ^ m.factorization p
  have hprod :
      a ≡ b [ZMOD ∏ p : m.primeFactors, f p] := by
    apply intModEq_finset_prod_of_pairwise_coprime
      (Finset.univ : Finset m.primeFactors) f
    · intro p _ q _ hpq
      exact
        Nat.pairwise_coprime_pow_primeFactors_factorization hpq
    · intro p _
      exact h p
  have hmprod :
      (m : ℤ) = ∏ p : m.primeFactors, (f p : ℤ) := by
    exact_mod_cast
      Nat.prod_primeFactors_coe_pow_factorization hm
  rw [hmprod]
  exact hprod
 

theorem primePower_factorization_dvd
    {m p : ℕ} (hm : m ≠ 0) (hp : p.Prime) :
    p ^ m.factorization p ∣ m :=
  (hp.pow_dvd_iff_le_factorization hm).2 le_rfl
 

theorem principalIdele_infinite_mem_iff_pos
    (x : ℚˣ) :
    (IdeleGroup.principalIdele ℚ x).1 ∈
        narrowInfiniteCongruenceSubgroup (K := ℚ) ↔
      0 < (x : ℚ) := by
  rw [mem_narrowInfiniteCongruenceSubgroup_iff]
  constructor
  · intro hx
    have hpos :=
      (mem_infinitePositiveSubgroup_iff
        Rat.infinitePlace
        (ContinuousMulEquiv.piUnits
          (IdeleGroup.principalIdele ℚ x).1
          Rat.infinitePlace)).1
        (hx Rat.infinitePlace)
        Rat.isReal_infinitePlace
    change
      0 <
        NumberField.InfinitePlace.Completion.extensionEmbeddingOfIsReal
          Rat.isReal_infinitePlace
          ((WithAbs.toAbs Rat.infinitePlace.1 (x : ℚ) :
            WithAbs Rat.infinitePlace.1) :
              Rat.infinitePlace.Completion) at hpos
    rw [NumberField.InfinitePlace.Completion.extensionEmbeddingOfIsReal_coe]
      at hpos
    have hpos' : (0 : ℝ) < ((x : ℚ) : ℝ) := by
      simpa only [WithAbs.equiv_apply, WithAbs.ofAbs_toAbs,
        eq_ratCast] using hpos
    exact_mod_cast hpos'
  · intro hx v
    rw [mem_infinitePositiveSubgroup_iff]
    intro hv
    change
      0 <
        NumberField.InfinitePlace.Completion.extensionEmbeddingOfIsReal
          hv
          ((WithAbs.toAbs v.1 (x : ℚ) : WithAbs v.1) :
            v.Completion)
    rw [NumberField.InfinitePlace.Completion.extensionEmbeddingOfIsReal_coe]
    simpa only [WithAbs.equiv_apply, WithAbs.ofAbs_toAbs,
      eq_ratCast] using (show
      (0 : ℝ) < ((x : ℚ) : ℝ) by exact_mod_cast hx)
 


theorem principalIdele_positiveGenerator_mem_primeTo_iff_modEq
    {m : ℕ} (hm : m ≠ 0)
    (I : primeToModulusIdeals (rationalModulus m)) :
    IdeleGroup.principalIdele ℚ
        (positiveRationalIdealGeneratorUnit
          (I : FractionalIdealGroup ℚ)) ∈
        idelePrimeToModulusSubgroup (rationalModulus m) ↔
      (positiveRationalIdealGenerator
          (I : FractionalIdealGroup ℚ)).num ≡
        (positiveRationalIdealGenerator
          (I : FractionalIdealGroup ℚ)).den
        [ZMOD m] := by
  let x :=
    positiveRationalIdealGeneratorUnit
      (I : FractionalIdealGroup ℚ)
  constructor
  · intro hx
    apply intModEq_of_primePower_modEq hm
    intro p
    let v : HeightOneSpectrum (𝓞 ℚ) :=
      rationalPrime
        ⟨p, (Nat.mem_primeFactors.mp p.2).1⟩
    have hvgen : Rat.HeightOneSpectrum.natGenerator v = (p : ℕ) :=
      natGenerator_rationalPrime
        ⟨p, (Nat.mem_primeFactors.mp p.2).1⟩
    have hv : v ∈ (rationalModulus m).finitePart.support := by
      rw [rationalModulus, Modulus.finitePart_narrowOfFinite]
      rw [mem_rationalFiniteModulus_support_iff hm]
      rw [hvgen]
      exact (Nat.mem_primeFactors.mp p.2).2.1
    have hcount := I.property v hv
    rw [← toPrincipalIdeal_positiveRationalIdealGeneratorUnit
      (I : FractionalIdealGroup ℚ)] at hcount
    have hxval : v.valuation ℚ (x : ℚ) = 1 :=
      valuation_eq_one_of_principal_count_eq_zero x v hcount
    have hlocal :=
      (principalLocalHigherUnit_iff_modEq v
        ((rationalModulus m).finitePart v) x hxval).1
        (hx.2 v hv)
    rw [rationalModulus_finitePart_apply, hvgen] at hlocal
    simpa only [x, positiveRationalIdealGeneratorUnit_val] using hlocal
  · intro hmod
    constructor
    · change
        (IdeleGroup.principalIdele ℚ x).1 ∈
          (Modulus.narrowOfFinite
            (rationalFiniteModulus m)).infiniteCongruenceSubgroup
      rw [Modulus.infiniteCongruenceSubgroup_narrowOfFinite]
      exact
        (principalIdele_infinite_mem_iff_pos x).2
          (positiveRationalIdealGenerator_pos
            (I : FractionalIdealGroup ℚ))
    · intro v hv
      have hcount := I.property v hv
      rw [← toPrincipalIdeal_positiveRationalIdealGeneratorUnit
        (I : FractionalIdealGroup ℚ)] at hcount
      have hxval : v.valuation ℚ (x : ℚ) = 1 :=
        valuation_eq_one_of_principal_count_eq_zero x v hcount
      apply
        (principalLocalHigherUnit_iff_modEq v
          ((rationalModulus m).finitePart v) x hxval).2
      rw [rationalModulus_finitePart_apply]
      have hpow :
          Rat.HeightOneSpectrum.natGenerator v ^
              m.factorization
                (Rat.HeightOneSpectrum.natGenerator v) ∣
            m :=
        primePower_factorization_dvd hm
          (Rat.HeightOneSpectrum.prime_natGenerator v)
      simpa only [x, positiveRationalIdealGeneratorUnit_val,
        Int.natCast_pow] using
        hmod.of_dvd (Int.natCast_dvd_natCast.mpr hpow)
 

theorem mem_principalRayIdealSubgroup_iff_modEq
    {m : ℕ} (hm : m ≠ 0)
    (I : primeToModulusIdeals (rationalModulus m)) :
    I ∈ principalRayIdealSubgroup (rationalModulus m) ↔
      (positiveRationalIdealGenerator
          (I : FractionalIdealGroup ℚ)).num ≡
        (positiveRationalIdealGenerator
          (I : FractionalIdealGroup ℚ)).den
        [ZMOD m] := by
  constructor
  · intro hI
    obtain ⟨x, hx, hideal⟩ :=
      (mem_principalRayIdealSubgroup_iff
        (rationalModulus m) I).1 hI
    have hxinf :
        (IdeleGroup.principalIdele ℚ x).1 ∈
          narrowInfiniteCongruenceSubgroup (K := ℚ) := by
      have hxinf' := hx.1
      change
        (IdeleGroup.principalIdele ℚ x).1 ∈
          (Modulus.narrowOfFinite
            (rationalFiniteModulus m)).infiniteCongruenceSubgroup at hxinf'
      rw [Modulus.infiniteCongruenceSubgroup_narrowOfFinite] at hxinf'
      exact hxinf'
    have hxpos : 0 < (x : ℚ) :=
      (principalIdele_infinite_mem_iff_pos x).1 hxinf
    have hxgen :
        (x : ℚ) =
          positiveRationalIdealGenerator
            (I : FractionalIdealGroup ℚ) := by
      apply eq_of_spanSingleton_eq_of_pos hxpos
        (positiveRationalIdealGenerator_pos
          (I : FractionalIdealGroup ℚ))
      calc
        FractionalIdeal.spanSingleton
            (nonZeroDivisors (𝓞 ℚ)) (x : ℚ) =
          rationalFractionalIdeal
            (toPrincipalIdeal (𝓞 ℚ) ℚ x) := by
              exact
                (coe_toPrincipalIdeal
                  (R := 𝓞 ℚ) (K := ℚ) x).symm
        _ = rationalFractionalIdeal
            (I : FractionalIdealGroup ℚ) :=
          congrArg rationalFractionalIdeal hideal
        _ = FractionalIdeal.spanSingleton
            (nonZeroDivisors (𝓞 ℚ))
            (positiveRationalIdealGenerator
              (I : FractionalIdealGroup ℚ)) :=
          rationalFractionalIdeal_eq_span_positiveGenerator
            (I : FractionalIdealGroup ℚ)
    have hxu :
        x = positiveRationalIdealGeneratorUnit
          (I : FractionalIdealGroup ℚ) := by
      apply Units.ext
      exact hxgen
    apply
      (principalIdele_positiveGenerator_mem_primeTo_iff_modEq
        hm I).1
    simpa only [← hxu] using hx
  · intro hmod
    apply
      (mem_principalRayIdealSubgroup_iff
        (rationalModulus m) I).2
    exact
      ⟨positiveRationalIdealGeneratorUnit
          (I : FractionalIdealGroup ℚ),
        (principalIdele_positiveGenerator_mem_primeTo_iff_modEq
          hm I).2 hmod,
        toPrincipalIdeal_positiveRationalIdealGeneratorUnit
          (I : FractionalIdealGroup ℚ)⟩
 

theorem primeToIdealResidueHom_ker
    (m : ℕ) (hm : m ≠ 0) :
    (primeToIdealResidueHom m hm).ker =
      principalRayIdealSubgroup (rationalModulus m) := by
  ext I
  rw [MonoidHom.mem_ker,
    mem_principalRayIdealSubgroup_iff_modEq hm I,
    primeToIdealResidueHom_apply]
  exact
    rationalResidueUnit_eq_one_iff_modEq m
      (positiveRationalIdealGenerator
        (I : FractionalIdealGroup ℚ))
      (positiveGenerator_num_coprime hm I)
      (positiveGenerator_den_coprime hm I)
 

noncomputable def idealRayClassGroupEquivZModUnits
    (m : ℕ) (hm : m ≠ 0) :
    IdealRayClassGroup (rationalModulus m) ≃*
      (ZMod m)ˣ := by
  exact
    (QuotientGroup.quotientMulEquivOfEq
      (primeToIdealResidueHom_ker m hm).symm).trans
      (QuotientGroup.quotientKerEquivOfSurjective
        (primeToIdealResidueHom m hm)
        (primeToIdealResidueHom_surjective m hm))
end RayClass
end
end

/- GaloisCohomology.Kummer.Concrete.Cyclotomic.ProfiniteUnitDecomposition.Basic -/
section
open scoped Topology
noncomputable section
namespace KummerTheory
open ClassFormation


namespace ProfiniteUnitDecomposition.Internal
 

instance primeFact (p : Nat.Primes) : Fact p.1.Prime :=
  ⟨p.2⟩
end ProfiniteUnitDecomposition.Internal
end KummerTheory
end
end

/- TunnellRationalRayNormImage -/
section
namespace TunnellRationalRayNormImage
open NumberField RayClass 
open scoped NumberField
noncomputable section
variable (m : ℕ+) 
abbrev modQ := rationalModulus m.val
abbrev ideals := primeToModulusIdeals (modQ m)
abbrev primeIdele := idelePrimeToModulusSubgroup (modQ m)
abbrev principal := IdeleGroup.principalSubgroup ℚ
def symb : IdeleGroup ℚ →* (ZMod m.val)ˣ :=
  let M := modQ m
  let e := ((quotientRaySubgroupEquivIdeleRayQuotient M).symm.trans
    (quotientRaySubgroupEquivIdealRayClassGroup M)).trans (idealRayClassGroupEquivZModUnits m.val m.property.ne')
  e.toMonoidHom.comp (QuotientGroup.mk' (M.ideleCongruenceSubgroup ⊔ principal))
theorem kill (x : ℚˣ) : symb m (IdeleGroup.principalIdele ℚ x)=1 := by
  have h : QuotientGroup.mk' ((modQ m).ideleCongruenceSubgroup ⊔ principal) (IdeleGroup.principalIdele ℚ x)=1 :=
    (QuotientGroup.eq_one_iff _).mpr ((show principal ≤ (modQ m).ideleCongruenceSubgroup ⊔ principal from le_sup_right) ⟨x,rfl⟩)
  simp only [symb,MonoidHom.comp_apply,h,map_one]
private theorem quotient_eval {B C : Type*} [CommGroup B] [Group C] (f : B →* C)
    (surj : Function.Surjective f) {N : Subgroup B} (eq : N=f.ker) (b : B) :
    ((QuotientGroup.quotientMulEquivOfEq eq).trans (QuotientGroup.quotientKerEquivOfSurjective f surj))
      (QuotientGroup.mk' N b)=f b := by
  rw [MulEquiv.trans_apply,QuotientGroup.mk'_apply,QuotientGroup.quotientMulEquivOfEq_mk]
  exact QuotientGroup.kerLift_mk _ _
theorem ideal_eval (a : primeIdele m) : symb m a=(primeToIdealResidueHom m.val m.property.ne') (primeToIdealMap (modQ m) a) := by
  change idealRayClassGroupEquivZModUnits m.val m.property.ne' (quotientRaySubgroupEquivIdealRayClassGroup _
    ((quotientRaySubgroupEquivIdeleRayQuotient _).symm (primeToRayClassProjection _ a)))=_
  rw [←quotientRaySubgroupEquivIdeleRayQuotient_mk,MulEquiv.symm_apply_apply,quotientRaySubgroupEquivIdealRayClassGroup_mk]
  change idealRayClassGroupEquivZModUnits m.val m.property.ne' (QuotientGroup.mk' _ (primeToIdealMap _ a))=_
  exact quotient_eval (primeToIdealResidueHom m.val m.property.ne') (primeToIdealResidueHom_surjective _ _)
    (primeToIdealResidueHom_ker _ _).symm _
variable (F : Type) [Field F] [NumberField F]
end
end TunnellRationalRayNormImage
end

/- TunnellRationalIdeleCoordinates -/
section
namespace TunnellRationalIdeleCoordinates
open NumberField IsDedekindDomain RayClass IdeleGroup
open scoped NumberField Classical RestrictedProduct
noncomputable section
abbrev V := HeightOneSpectrum (𝓞 ℚ)
abbrev localIntegers (v : V) := v.adicCompletionIntegers ℚ
def scale : IdeleGroup ℚ →* ℚˣ :=
  (Units.map (FractionalIdeal.absNorm (R:=𝓞 ℚ) (K:=ℚ)).toMonoidHom).comp fractionalIdeal
theorem normalized_scale (b : IdeleGroup ℚ) :
    toPrincipalIdeal (𝓞 ℚ) ℚ (scale b) = fractionalIdeal b := by
  rw [← toPrincipalIdeal_positiveRationalIdealGeneratorUnit (fractionalIdeal b)]
  apply congrArg
  apply Units.ext
  change FractionalIdeal.absNorm (rationalFractionalIdeal (fractionalIdeal b)) =
    positiveRationalIdealGenerator (fractionalIdeal b)
  rw [rationalFractionalIdeal_eq_span_positiveGenerator, FractionalIdeal.absNorm_span_singleton,
    Algebra.norm_self, MonoidHom.id_apply, abs_of_pos (positiveRationalIdealGenerator_pos _)]
def normalized : IdeleGroup ℚ →* IdeleGroup ℚ :=
  (MonoidHom.id _) / ((principalIdele (K:=ℚ)).comp scale)
theorem integral (b : IdeleGroup ℚ) (v : V) :
    finiteComponent v (normalized b) ∈ (localIntegers v).units := by
  have eq : fractionalIdeal (normalized b) = 1 := by
    change fractionalIdeal (b / principalIdele ℚ (scale b)) = 1
    rw [map_div,fractionalIdeal_principalIdele,normalized_scale,div_self']
  have h : normalized b ∈ integralAtFinitePlaces := by
    rw [← fractionalIdeal_ker]
    exact eq
  exact h v
end
end TunnellRationalIdeleCoordinates
end

/- TunnellCompactRayRepresentatives -/
section
namespace TunnellCompactRayRepresentatives
open NumberField IsDedekindDomain RayClass IdeleGroup TunnellRationalIdeleCoordinates TunnellRationalRayNormImage
open scoped NumberField
noncomputable section
def K : Set (IdeleGroup ℚ) :=
  (fun b : FiniteIdeleGroup ℚ => ((1,b) : IdeleGroup ℚ)) ''
    (FiniteIdeleGroup.integralSubgroup (K:=ℚ) : Set (FiniteIdeleGroup ℚ))
theorem compact : IsCompact K := (FiniteIdeleGroup.isCompact_integralSubgroup (K:=ℚ)).image
  (continuous_const.prodMk continuous_id)
theorem cont (m : ℕ+) : Continuous (symb m) := by
  let N := (modQ m).ideleCongruenceSubgroup ⊔ principal
  letI : DiscreteTopology (IdeleGroup ℚ ⧸ N) :=
    QuotientGroup.discreteTopology (Subgroup.isOpen_mono (H₂:=N) le_sup_left (isOpen_ideleCongruenceSubgroup (modQ m)))
  exact (continuous_of_discreteTopology (f:=(((quotientRaySubgroupEquivIdeleRayQuotient (modQ m)).symm.trans
    (quotientRaySubgroupEquivIdealRayClassGroup (modQ m))).trans (idealRayClassGroupEquivZModUnits m.val m.property.ne')))).comp
      continuous_quot_mk
theorem ray_surj (m : ℕ+) (y : (ZMod m.val)ˣ) : ∃ a ∈ K, symb m a=y := by
  obtain ⟨I,hI⟩ := primeToIdealResidueHom_surjective m.val m.property.ne' y
  obtain ⟨b,hb⟩ := primeToIdealMap_surjective (modQ m) I
  let c := normalized b.val
  let a : IdeleGroup ℚ := (1,c.2)
  have hs : (0:ℚ)<scale b.val := by
    change 0 < FractionalIdeal.absNorm (rationalFractionalIdeal (fractionalIdeal b.val))
    rw [rationalFractionalIdeal_eq_span_positiveGenerator, FractionalIdeal.absNorm_span_singleton,
      Algebra.norm_self,MonoidHom.id_apply,abs_of_pos (positiveRationalIdealGenerator_pos _)]
    exact positiveRationalIdealGenerator_pos _
  have pos : c.1 ∈ (modQ m).infiniteCongruenceSubgroup := by
    apply (modQ m).infiniteCongruenceSubgroup.div_mem b.property.1
    change _ ∈ (Modulus.narrowOfFinite _).infiniteCongruenceSubgroup
    rw [Modulus.infiniteCongruenceSubgroup_narrowOfFinite]
    exact (principalIdele_infinite_mem_iff_pos _).mpr hs
  have h : c / a ∈ (modQ m).ideleCongruenceSubgroup := by
    constructor
    · simpa [a] using pos
    · simpa [a] using (modQ m).finitePart.finiteCongruenceSubgroup.one_mem
  have qa : symb m (c / a)=1 := by
    have z : QuotientGroup.mk' ((modQ m).ideleCongruenceSubgroup ⊔ principal) (c/a)=1 :=
      (QuotientGroup.eq_one_iff _).mpr ((show (modQ m).ideleCongruenceSubgroup ≤ (modQ m).ideleCongruenceSubgroup ⊔ principal from le_sup_left) h)
    simp only [symb,MonoidHom.comp_apply,z,map_one]
  refine ⟨a,⟨c.2,fun v => integral b.val v,rfl⟩,?_⟩
  rw [map_div,div_eq_one] at qa
  rw [←qa]
  change symb m (b.val / principalIdele ℚ (scale b.val))=y
  rw [map_div,kill,div_one,ideal_eval,hb,hI]
end
end TunnellCompactRayRepresentatives
end

/- TunnellRationalDegreeCoordinates -/
section
namespace TunnellRationalDegreeCoordinates
open ClassFormation 
noncomputable section
local instance (p : Nat.Primes) : Fact p.val.Prime := ⟨p.property⟩
abbrev U := (p : Nat.Primes) → ℤ_[p.val]ˣ
variable (L : (p : Nat.Primes) → ℤ_[p.val]ˣ →* Multiplicative ℤ_[p.val])
end
end TunnellRationalDegreeCoordinates
end

/- TunnellCyclotomicConductors -/
section
namespace TunnellCyclotomicConductors
open Set ClassFormation TunnellRationalDegreeCoordinates
noncomputable section
def reduction (m : ℕ+) : U →* (ZMod m.val)ˣ :=
  (Units.map (zHatReductionRingHom m.val m.property).toMonoidHom).comp
    zHatUnitsContinuousMulEquivPrimeProduct.symm.toMulEquiv.toMonoidHom
theorem reduce_dvd (m n : ℕ+) (hn : m.val ∣ n.val) (u : U) :
    ZMod.unitsMap hn (reduction n u) = reduction m u := by
  apply Units.ext
  exact zHatReduction_transition m.property n.property hn _
theorem joint : Function.Injective (fun u : U => fun m : ℕ+ => reduction m u) := by
  intro u v h
  apply zHatUnitsContinuousMulEquivPrimeProduct.symm.injective
  apply Units.ext
  apply ZHat.ext
  intro n hn
  exact congrArg Units.val (congrFun h ⟨n,hn⟩)
end
end TunnellCyclotomicConductors
end

/- TunnellIdeleClassPresentation -/
section
namespace TunnellIdeleClassPresentation
open NumberField 
open scoped NumberField TensorProduct IsMulCommutative
noncomputable section
variable (D N : Type) [Field D] [NumberField D] [Field N] [NumberField N]
  [Algebra D N] [FiniteDimensional D N] [IsAbelianGalois D N]
abbrev j := IdeleGroup.equivAdeleRingUnits (K:=D)
end
end TunnellIdeleClassPresentation
end

/- TunnellRayPrimeNorm -/
section
namespace TunnellRayPrimeNorm
open NumberField IsDedekindDomain RayClass
open scoped NumberField
noncomputable section
variable {F : Type} [Field F] [NumberField F]
abbrev P (K : Type) [Field K] [NumberField K] := HeightOneSpectrum (𝓞 K)
theorem positive_generator (I : FractionalIdealGroup ℚ) :
    positiveRationalIdealGenerator I = FractionalIdeal.absNorm (rationalFractionalIdeal I) := by
  rw [rationalFractionalIdeal_eq_span_positiveGenerator,FractionalIdeal.absNorm_span_singleton,Algebra.norm_self,
    MonoidHom.id_apply,abs_of_pos (positiveRationalIdealGenerator_pos _)]
end
end TunnellRayPrimeNorm
end

/- TunnellRationalOnePlaceRay -/
section
namespace TunnellRationalOnePlaceRay
open NumberField IsDedekindDomain RayClass TunnellRationalRayNormImage TunnellRayPrimeNorm
open scoped NumberField Classical TensorProduct
noncomputable section
abbrev A := AdeleRing (𝓞 ℚ) ℚ
theorem prime_norm (v : P ℚ) : v.asIdeal.absNorm = Rat.HeightOneSpectrum.natGenerator v := by
  let p := Rat.HeightOneSpectrum.natGenerator v
  let e := Ideal.quotientEquiv v.asIdeal (Ideal.span {(p : ℤ)}) (Rat.IsIntegralClosure.intEquiv (𝓞 ℚ))
    (Rat.HeightOneSpectrum.span_natGenerator v)
  calc
    v.asIdeal.absNorm = (Ideal.span {(p : ℤ)}).absNorm := Nat.card_congr e.toEquiv
    _ = p := by simp
theorem outside (m : ℕ+) (v : P ℚ) (cop : v.asIdeal.absNorm.Coprime m.val) :
    v ∉ (modQ m).finitePart.support := by
  intro hv
  rw [prime_norm] at cop
  exact (Rat.HeightOneSpectrum.prime_natGenerator v).coprime_iff_not_dvd.mp cop
    ((mem_rationalFiniteModulus_support_iff m.property.ne' v).mp hv)
theorem ideal_power (v : P ℚ) (n : ℕ) (a : IdeleGroup ℚ)
    (off : ∀ w : P ℚ, w ≠ v → IdeleGroup.finiteComponent w a = 1)
    (ord : (FiniteIdeleGroup.localOrder v (IdeleGroup.finiteComponent v a)).toAdd = n) :
    IdeleGroup.fractionalIdeal a = FractionalIdealGroup.prime v ^ n := by
  apply FractionalIdealGroup.ext_count
  intro w
  rw [IdeleGroup.count_fractionalIdeal]
  change _ = FractionalIdeal.count ℚ w ((v.asIdeal : FractionalIdeal (nonZeroDivisors (𝓞 ℚ)) ℚ) ^ n)
  by_cases h : w = v
  · subst w
    rw [FractionalIdeal.count_pow_self,ord]
  · rw [off w h,map_one,FractionalIdeal.count_pow,FractionalIdeal.count_maximal_coprime ℚ w (Ne.symm h),mul_zero] <;> rfl
theorem ray_value (m : ℕ+) (v : P ℚ) (n : ℕ) (z : Aˣ) (real : z.val.1 = 1)
    (away : ∀ w : P ℚ, w ≠ v → z.val.2 w = 1) (cop : v.asIdeal.absNorm.Coprime m.val)
    (ord : -WithZero.log (Valued.v (z.val.2 v)) = n) :
    (symb m ((TunnellIdeleClassPresentation.j ℚ).symm z) : ZMod m.val) = (v.asIdeal.absNorm : ZMod m.val)^n := by
  let a := (TunnellIdeleClassPresentation.j ℚ).symm z
  have inf : a.1 = 1 := Units.ext real
  have off (w : P ℚ) (h : w ≠ v) : IdeleGroup.finiteComponent w a = 1 := Units.ext (away w h)
  have good : a ∈ primeIdele m := by
    constructor
    · rw [inf]
      exact Subgroup.one_mem _
    · intro w hw
      have h : w ≠ v := fun e => outside m v cop (e ▸ hw)
      change IdeleGroup.finiteComponent w a ∈ _
      rw [off w h]
      exact Subgroup.one_mem _
  let b : primeIdele m := ⟨a,good⟩
  let I := primeToIdealMap (modQ m) b
  have f : I.val = FractionalIdealGroup.prime v ^ n := ideal_power v n a off ord
  have gen : positiveRationalIdealGenerator I.val = ((v.asIdeal.absNorm^n : ℕ) : ℚ) := by
    rw [positive_generator,f]
    change FractionalIdeal.absNorm ((v.asIdeal : FractionalIdeal (nonZeroDivisors (𝓞 ℚ)) ℚ)^n) = _
    rw [map_pow,FractionalIdeal.coeIdeal_absNorm,Nat.cast_pow]
  have e := ideal_eval m b
  change (symb m b.val : ZMod m.val) = _
  rw [e]
  exact (congrArg Units.val (rationalResidueUnit_congr m.val gen (positiveGenerator_num_coprime m.property.ne' I)
    (positiveGenerator_den_coprime m.property.ne' I) (by simpa using cop.pow_left n) (by simp))).trans
    ((rationalResidueUnit_natCast m.val _ (cop.pow_left n)).trans (Nat.cast_pow _ _))
end
end TunnellRationalOnePlaceRay
end

/- TunnellRationalRayTransition -/
section
namespace TunnellRationalRayTransition
open NumberField IsDedekindDomain RayClass TunnellRationalRayNormImage
open scoped NumberField
noncomputable section
theorem units (m n : ℕ+) (h : m.val ∣ n.val) (x : ℚ)
    (xm : x.num.natAbs.Coprime m.val) (dm : x.den.Coprime m.val)
    (xn : x.num.natAbs.Coprime n.val) (dn : x.den.Coprime n.val) :
    ZMod.unitsMap h (rationalResidueUnit n.val x xn dn) = rationalResidueUnit m.val x xm dm := by
  unfold rationalResidueUnit
  rw [map_mul,map_inv]
  congr 1
  · apply Units.ext
    exact map_intCast (ZMod.castHom h (ZMod m.val)) x.num
  · apply congrArg Inv.inv
    apply Units.ext
    exact map_intCast (ZMod.castHom h (ZMod m.val)) (x.den:ℤ)
theorem inclusion (m n : ℕ+) (h : m.val ∣ n.val) : idelePrimeToModulusSubgroup (modQ n) ≤ idelePrimeToModulusSubgroup (modQ m) := by
  intro x hx
  refine ⟨hx.1,?_⟩
  intro v hv
  have le : (modQ m).finitePart v ≤ (modQ n).finitePart v := by
    change (rationalModulus _).finitePart _ ≤ (rationalModulus _).finitePart _
    rw [rationalModulus_finitePart_apply,rationalModulus_finitePart_apply]
    exact (Nat.factorization_le_iff_dvd m.property.ne' n.property.ne').mpr h _
  apply localHigherUnitGroup_antitone v le
  apply hx.2 v
  exact Finsupp.mem_support_iff.mpr (Nat.ne_of_gt ((Nat.pos_of_ne_zero (Finsupp.mem_support_iff.mp hv)).trans_le le))
theorem compatible (m n : ℕ+) (h : m.val ∣ n.val) (b : IdeleGroup ℚ) :
    ZMod.unitsMap h (symb n b) = symb m b := by
  obtain ⟨x,hx⟩ := exists_principal_quotient_mem_primeTo (modQ n) b
  let y := b * (IdeleGroup.principalIdele ℚ x)⁻¹
  have normalize (k : ℕ+) : symb k y = symb k b := by
    simp only [y,map_mul,map_inv,kill,inv_one,mul_one]
  rw [←normalize n,←normalize m]
  change ZMod.unitsMap h (symb n ((⟨y,hx⟩ : primeIdele n):IdeleGroup ℚ)) =
    symb m ((⟨y,inclusion m n h hx⟩ : primeIdele m):IdeleGroup ℚ)
  rw [ideal_eval,ideal_eval]
  exact units m n h (positiveRationalIdealGenerator (IdeleGroup.fractionalIdeal y)) _ _ _ _
end
end TunnellRationalRayTransition
end

/- TunnellRayRegularModel -/
section
namespace TunnellRayRegularModel
open NumberField IsDedekindDomain
open scoped NumberField TensorProduct
noncomputable section
abbrev A := AdeleRing (𝓞 ℚ) ℚ
abbrev P := HeightOneSpectrum (𝓞 ℚ)
def Good (m : ℕ+) (a : Aˣ) : Prop :=
  (∀ (w:InfinitePlace ℚ) (h:w.IsReal), 0 < InfinitePlace.Completion.extensionEmbeddingOfIsReal h (a.val.1 w)) ∧
  ∀ p:P, let n:=m.val.factorization (Rat.HeightOneSpectrum.natGenerator p)
    n≠0 → ∃ u:(p.adicCompletionIntegers ℚ)ˣ, (u.val : p.adicCompletion ℚ)=a.val.2 p ∧
      (u.val-1)∈(IsLocalRing.maximalIdeal (p.adicCompletionIntegers ℚ))^n
end
end TunnellRayRegularModel
end

/- TunnellRayConductorAdjust -/
section
namespace TunnellRayConductorAdjust
open NumberField IsDedekindDomain RayClass TunnellRayRegularModel TunnellRationalRayNormImage

open scoped NumberField TensorProduct
noncomputable section
abbrev j := IdeleGroup.equivAdeleRingUnits (K:=ℚ)
theorem good (m : ℕ+) (b : Aˣ) : Good m b ↔ j.symm b ∈ idelePrimeToModulusSubgroup (modQ m) := by
  let y:=j.symm b
  have inf : y.1 ∈ (modQ m).infiniteCongruenceSubgroup ↔
      ∀ (w:InfinitePlace ℚ)(h:w.IsReal),0<InfinitePlace.Completion.extensionEmbeddingOfIsReal h (b.val.1 w) := by
    change y.1 ∈ (Modulus.narrowOfFinite _).infiniteCongruenceSubgroup ↔ _
    rw [Modulus.infiniteCongruenceSubgroup_narrowOfFinite,mem_narrowInfiniteCongruenceSubgroup_iff]
    rfl
  constructor
  · rintro ⟨arch,loc⟩
    refine ⟨inf.mpr arch,?_⟩
    intro p hp
    have nn := (rationalModulus_finitePart_apply m.val p)
    have nz := Finsupp.mem_support_iff.mp hp
    obtain ⟨u,hu,he⟩ := loc p (nn ▸ nz)
    let t := (p.adicCompletionIntegers ℚ).toSubmonoid.unitsEquivUnitsType.symm u
    apply (mem_localHigherUnitGroup_iff p _ _).mpr
    refine ⟨t,Units.ext hu,(localHigherUnitMap_eq_one_iff p _ t).mpr ?_⟩
    rw [nn]; exact he
  · rintro ⟨arch,loc⟩
    refine ⟨inf.mp arch,?_⟩
    intro p n hn
    have nn := rationalModulus_finitePart_apply m.val p
    have hp := Finsupp.mem_support_iff.mpr (show (modQ m).finitePart p≠0 from nn.trans_ne hn)
    obtain ⟨t,ht,he⟩ := (mem_localHigherUnitGroup_iff _ _ _).mp (loc p hp)
    let u := (p.adicCompletionIntegers ℚ).toSubmonoid.unitsEquivUnitsType t
    refine ⟨u,congrArg Units.val ht,?_⟩
    have h0 := (localHigherUnitMap_eq_one_iff _ _ t).mp he
    rw [nn] at h0
    exact h0
end
end TunnellRayConductorAdjust
end

/- TunnellRayCoordinateUnits -/
section
namespace TunnellRayCoordinateUnits
open ClassFormation TunnellRationalDegreeCoordinates TunnellProfiniteCoordinate
noncomputable section
def ring : ZHat ≃+* TunnellProfiniteCoordinate.Z where
  __ := equiv
  map_mul' a b := Subtype.ext (funext (fun n => (zHatReductionRingHom n.val n.property).map_mul a b))
def E : U ≃* TunnellProfiniteCoordinate.Zˣ :=
  zHatUnitsContinuousMulEquivPrimeProduct.symm.toMulEquiv.trans (Units.mapEquiv ring.toMulEquiv)
def ev (m : ℕ+) : TunnellProfiniteCoordinate.Zˣ →* (ZMod m.val)ˣ :=
  Units.map (((Pi.evalRingHom (fun n : ℕ+ => ZMod n.val) m).comp TunnellProfiniteCoordinate.Z.subtype).toMonoidHom)
theorem ev_E (m : ℕ+) (u : U) : ev m (E u)=TunnellCyclotomicConductors.reduction m u := Units.ext rfl
end
end TunnellRayCoordinateUnits
end

/- TunnellRayUnitLift -/
section
namespace TunnellRayUnitLift
open Set ClassFormation TunnellRationalDegreeCoordinates TunnellCyclotomicConductors
noncomputable section
private theorem realize (a : ∀ n : ℕ+, ZMod n.val)
    (h : ∀ m n : ℕ+, ∀ d : m.val ∣ n.val, ZMod.castHom d (ZMod m.val) (a n)=a m) :
    ∃ x : ZHat, ∀ n : ℕ+, zHatReduction n.val n.property x=a n := by
  let C (n : ℕ+) := {x : ZHat | zHatReduction n.val n.property x=a n}
  have closed (n : ℕ+) : IsClosed (C n) := isClosed_eq (zHatReduction n.val n.property).continuous continuous_const
  have finite (I : Finset ℕ+) : (univ ∩ ⋂ i ∈ I, C i).Nonempty := by
    let N : ℕ+ := I.prod id
    obtain ⟨x,hx⟩ := zHatReduction_surjective N.val N.property (a N)
    refine ⟨x,Set.mem_univ _,Set.mem_iInter₂.mpr ?_⟩
    intro i hi
    have d : i.val ∣ N.val := by
      obtain ⟨k,hk⟩ := Finset.dvd_prod_of_mem (fun j : ℕ+ => j) hi
      exact ⟨k.val,congrArg PNat.val hk⟩
    change zHatReduction i.val i.property x=a i
    exact (zHatReduction_transition i.property N.property d x).symm.trans
      ((congrArg (ZMod.castHom d (ZMod i.val)) hx).trans (h i N d))
  obtain ⟨x,_,all⟩ := (isCompact_univ : IsCompact (univ : Set ZHat)).inter_iInter_nonempty C closed finite
  exact ⟨x,fun n => mem_iInter.mp all n⟩
theorem unit (a : ∀ n : ℕ+, (ZMod n.val)ˣ)
    (h : ∀ m n : ℕ+, ∀ d : m.val ∣ n.val, ZMod.unitsMap d (a n)=a m) :
    ∃ u : U, ∀ n, reduction n u=a n := by
  obtain ⟨v,hv⟩ := realize (fun n => (a n).val) (fun m n d => congrArg Units.val (h m n d))
  obtain ⟨w,hw⟩ := realize (fun n => (a n).inv) (fun m n d => congrArg Units.inv (h m n d))
  have inv : v*w=1 := by
    apply ZHat.ext
    intro n hn
    change zHatReductionRingHom n hn (v*w) = zHatReductionRingHom n hn 1
    rw [map_mul,map_one]
    exact (congrArg₂ HMul.hMul (hv ⟨n,hn⟩) (hw ⟨n,hn⟩)).trans (a ⟨n,hn⟩).val_inv
  let z : ZHatˣ := ⟨v,w,inv,(mul_comm w v).trans inv⟩
  refine ⟨zHatUnitsContinuousMulEquivPrimeProduct z,fun n => ?_⟩
  change Units.map _ (zHatUnitsContinuousMulEquivPrimeProduct.symm (zHatUnitsContinuousMulEquivPrimeProduct z))=a n
  rw [ContinuousMulEquiv.symm_apply_apply]
  exact Units.ext (hv n)
theorem compact_surj {B : Type*} [TopologicalSpace B] (K : Set B) (hk : IsCompact K)
    (f : B → U) (cont : ∀ n : ℕ+, Continuous (fun b => reduction n (f b)))
    (onto : ∀ n : ℕ+, ∀ y : (ZMod n.val)ˣ, ∃ b ∈ K, reduction n (f b)=y) :
    Function.Surjective f := by
  intro y
  let C (n : ℕ+) := {b : B | reduction n (f b)=reduction n y}
  have closed (n : ℕ+) : IsClosed (C n) := isClosed_eq (cont n) continuous_const
  have finite (I : Finset ℕ+) : (K ∩ ⋂ i ∈ I, C i).Nonempty := by
    let N : ℕ+ := I.prod id
    obtain ⟨b,hb,eq⟩ := onto N (reduction N y)
    refine ⟨b,hb,Set.mem_iInter₂.mpr ?_⟩
    intro i hi
    have d : i.val ∣ N.val := by
      obtain ⟨k,hk⟩ := Finset.dvd_prod_of_mem (fun j : ℕ+ => j) hi
      exact ⟨k.val,congrArg PNat.val hk⟩
    exact (reduce_dvd i N d _).symm.trans ((congrArg (ZMod.unitsMap d) eq).trans (reduce_dvd i N d _))
  obtain ⟨b,_,eq⟩ := hk.inter_iInter_nonempty C closed finite
  exact ⟨b,joint (funext (fun n => mem_iInter.mp eq n))⟩
end
end TunnellRayUnitLift
end

/- TunnellSignedRayUnits -/
section
namespace TunnellSignedRayUnits
open NumberField TunnellRationalRayNormImage TunnellRationalDegreeCoordinates TunnellCyclotomicConductors
noncomputable section
private theorem lift (b : IdeleGroup ℚ) : ∃ u : U, ∀ n, reduction n u=symb n b := TunnellRayUnitLift.unit
  (fun m => symb m b) (fun m n d => TunnellRationalRayTransition.compatible m n d b)
def units : IdeleGroup ℚ →* U where
  toFun b := (lift b).choose
  map_one' := joint (funext fun n => ((lift 1).choose_spec n).trans ((symb n).map_one.trans (reduction n).map_one.symm))
  map_mul' a b := joint (funext fun n => by
    change reduction n (lift (a*b)).choose = reduction n ((lift a).choose*(lift b).choose)
    exact ((lift (a*b)).choose_spec n).trans (((symb n).map_mul a b).trans
      ((congrArg₂ HMul.hMul ((lift a).choose_spec n).symm ((lift b).choose_spec n).symm).trans
        ((reduction n).map_mul _ _).symm)))
theorem eval (n : ℕ+) (b : IdeleGroup ℚ) : reduction n (units b)=symb n b := (lift b).choose_spec n
theorem onto : Function.Surjective units := by
  apply TunnellRayUnitLift.compact_surj TunnellCompactRayRepresentatives.K TunnellCompactRayRepresentatives.compact
  · intro n
    simpa only [eval] using TunnellCompactRayRepresentatives.cont n
  · intro m y
    simpa only [eval] using TunnellCompactRayRepresentatives.ray_surj m y
theorem principal (x : ℚˣ) : units (IdeleGroup.principalIdele ℚ x)=1 :=
  joint (funext fun m => (eval m _).trans ((kill m x).trans (reduction m).map_one.symm))
end
end TunnellSignedRayUnits
end

/- TunnellSignedRayRegular -/
section
namespace TunnellSignedRayRegular
open NumberField IsDedekindDomain RayClass TunnellRationalRayNormImage TunnellRayRegularModel
open scoped NumberField Classical
noncomputable section
theorem prime (m : ℕ+) (p : P) (off : p ∉ (modQ m).finitePart.support) :
    (primeToIdealResidueHom m.val m.property.ne' (primeToModulusIdeal (modQ m) p off) : ZMod m.val)=p.asIdeal.absNorm := by
  let I:=primeToModulusIdeal (modQ m) p off
  have gen : positiveRationalIdealGenerator I.val = (p.asIdeal.absNorm : ℚ) := by
    rw [TunnellRayPrimeNorm.positive_generator]
    exact FractionalIdeal.coeIdeal_absNorm p.asIdeal
  have cop : p.asIdeal.absNorm.Coprime m.val := by
    have t:=positiveGenerator_num_coprime m.property.ne' I
    rw [gen] at t
    simp only [Rat.num_natCast,Int.natAbs_natCast] at t
    exact t
  exact (congrArg Units.val (rationalResidueUnit_congr m.val gen (positiveGenerator_num_coprime m.property.ne' I)
    (positiveGenerator_den_coprime m.property.ne' I) (by simpa using cop) (by simp))).trans
    (rationalResidueUnit_natCast m.val p.asIdeal.absNorm cop)
theorem regular (m : ℕ+) (z : Aˣ) (hz : Good m z) (C : Subgroup (ZMod m.val)ˣ)
    (factor : ∀ (p:P) (u:(ZMod m.val)ˣ), (u:ZMod m.val)=p.asIdeal.absNorm →
      u ^ (-WithZero.log (Valued.v (z.val.2 p))) ∈ C) :
    symb m (TunnellRayConductorAdjust.j.symm z) ∈ C := by
  let b : primeIdele m := ⟨_,(TunnellRayConductorAdjust.good m z).mp hz⟩
  let I:=primeToIdealMap (modQ m) b
  let e:=(FractionalIdealGroup.factorizationEquiv (K:=ℚ)).symm I.val
  have count (p:P) : e.toAdd p= -WithZero.log (Valued.v (z.val.2 p)) := by
    have h := FractionalIdealGroup.count_factorization e p
    rw [show FractionalIdealGroup.factorization e=I.val from (FractionalIdealGroup.factorizationEquiv (K:=ℚ)).apply_symm_apply _] at h
    exact h.symm.trans (IdeleGroup.count_fractionalIdeal b.val p)
  let lift (p:P) : ideals m := if h:p∉(modQ m).finitePart.support then primeToModulusIdeal (modQ m) p h else 1
  have lift_off (p:P) (h:p∉(modQ m).finitePart.support) : lift p=primeToModulusIdeal (modQ m) p h := dif_pos h
  have off {p:P} (hp:p∈e.toAdd.support) : p∉(modQ m).finitePart.support := by
    intro h
    apply Finsupp.mem_support_iff.mp hp
    rw [←FractionalIdealGroup.count_factorization e p, show FractionalIdealGroup.factorization e=I.val from
      (FractionalIdealGroup.factorizationEquiv (K:=ℚ)).apply_symm_apply _]
    exact I.property p h
  have eq : I = ∏ p ∈ e.toAdd.support, (lift p) ^ e.toAdd p := by
    apply Subtype.ext
    calc
      I.val = ∏ p ∈ e.toAdd.support,FractionalIdealGroup.prime p ^ e.toAdd p :=
        ((FractionalIdealGroup.factorizationEquiv (K:=ℚ)).apply_symm_apply I.val).symm
      _ = _ := by
        change _ = (ideals m).subtype (∏ p ∈ e.toAdd.support,(lift p)^e.toAdd p)
        rw [map_prod]
        apply Finset.prod_congr rfl
        intro p hp
        rw [map_zpow,lift_off p (off hp)]
        rfl
  change symb m b.val ∈ C
  rw [ideal_eval]
  change primeToIdealResidueHom m.val _ I ∈ C
  rw [eq,map_prod]
  apply C.prod_mem
  intro p hp
  rw [map_zpow,lift_off p (off hp)]
  rw [count]
  exact factor p _ (prime m p (off hp))
end
end TunnellSignedRayRegular
end

/- TunnellSignedRayRegularEndpoint -/
section
namespace TunnellSignedRayRegularEndpoint
open NumberField IsDedekindDomain TunnellRayRegularModel TunnellRayCoordinateUnits
open scoped NumberField
noncomputable section
abbrev J:=TunnellIdeleClassPresentation.j ℚ
abbrev v : Aˣ →* TunnellProfiniteCoordinate.Zˣ := E.toMonoidHom.comp (TunnellSignedRayUnits.units.comp J.symm.toMonoidHom)
theorem value (m:ℕ+) (z:Aˣ) : ev m (v z)=TunnellRationalRayNormImage.symb m (J.symm z) :=
  (ev_E m _).trans (TunnellSignedRayUnits.eval m _)
theorem actual :
  let Z := (Int.castRingHom (∀ n:ℕ+,ZMod (n:ℕ))).range.topologicalClosure
  let ev (m:ℕ+) := Units.map (((Pi.evalRingHom (fun i:ℕ+ => ZMod (i:ℕ)) m).comp Z.subtype).toMonoidHom)
  let A:=AdeleRing (𝓞 ℚ) ℚ
  ∃ v:Aˣ →* Zˣ, Function.Surjective v ∧ (∀ x:ℚˣ, v (Units.map (algebraMap ℚ A).toMonoidHom x)=1) ∧
  (∀ (m:ℕ+) (p:HeightOneSpectrum (𝓞 ℚ)) (n:ℕ) (z:Aˣ), z.val.1=1 →
    (∀ w:HeightOneSpectrum (𝓞 ℚ), w≠p → z.val.2 w=1) → p.asIdeal.absNorm.Coprime m.val →
    -WithZero.log (Valued.v (z.val.2 p))=(n:ℤ) → ((ev m (v z)).val:ZMod m.val)=(p.asIdeal.absNorm:ZMod m.val)^n) ∧
  ∀ (m:ℕ+) (z:Aˣ), (let P:=HeightOneSpectrum (𝓞 ℚ); (∀ (w:InfinitePlace ℚ) (h:w.IsReal), 0 < InfinitePlace.Completion.extensionEmbeddingOfIsReal h (z.val.1 w)) ∧
  ∀ p:P, let n:=m.val.factorization (Rat.HeightOneSpectrum.natGenerator p)
    n≠0 → ∃ u:(p.adicCompletionIntegers ℚ)ˣ, (u.val : p.adicCompletion ℚ)=z.val.2 p ∧
      (u.val-1)∈(IsLocalRing.maximalIdeal (p.adicCompletionIntegers ℚ))^n) →
    ∀ C:Subgroup (ZMod m.val)ˣ, (∀ (p:HeightOneSpectrum (𝓞 ℚ)) (u:(ZMod m.val)ˣ), (u:ZMod m.val)=p.asIdeal.absNorm →
      u ^ (-WithZero.log (Valued.v (z.val.2 p))) ∈ C) → ev m (v z) ∈ C := by
  refine ⟨v,E.surjective.comp (TunnellSignedRayUnits.onto.comp J.symm.surjective),?_,?_,?_⟩
  · intro x
    change E (TunnellSignedRayUnits.units (IdeleGroup.principalIdele ℚ x))=1
    rw [TunnellSignedRayUnits.principal,map_one]
  · intro m p n z real away cop ord
    exact (congrArg Units.val (value m z)).trans (TunnellRationalOnePlaceRay.ray_value m p n z real away cop ord)
  · intro m z hz C factor
    change ev m (v z) ∈ C
    rw [value]
    exact TunnellSignedRayRegular.regular m z hz C factor
end
end TunnellSignedRayRegularEndpoint
end

theorem OMA.solution : OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1_H1_R1_H1_R1_H1_R1_H2_R1.H1 := TunnellSignedRayRegularEndpoint.actual
