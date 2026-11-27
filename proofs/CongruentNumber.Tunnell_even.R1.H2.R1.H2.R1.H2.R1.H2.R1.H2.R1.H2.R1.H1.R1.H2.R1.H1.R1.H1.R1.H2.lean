import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1_H1_R1_H1_R1
import Mathlib
/-
The profinite integer model and its prime decomposition are adapted from ClassFieldTheory at revision 2e6280f9d2579705a0cc6c76ec68c2b60f9c601a.
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

/- TunnellCyclotomicFiniteLog -/
section
/-! Finite cyclic logarithms for the procyclic quotient of the rational cyclotomic character. -/

namespace TunnellCyclotomicFiniteLog
open Subgroup

variable {G : Type*} [CommGroup G]

private def generator (h : G) : zpowers h := ⟨h, mem_zpowers h⟩

private theorem generates (h : G) (x : zpowers h) : x ∈ zpowers (generator h) := by
  obtain ⟨a,ha⟩ := x.property
  exact ⟨a,Subtype.ext ha⟩

noncomputable def finiteLog (g : G) (a n : ℕ) (ord : orderOf (g ^ a) = n)
    (powers : ∀ x : G, x ^ a ∈ zpowers (g ^ a)) : G →* Multiplicative (ZMod n) :=
  let e := zmodMulEquivOfGenerator (generates (g ^ a)) ((Nat.card_zpowers _).trans ord)
  e.symm.toMonoidHom.comp ((powMonoidHom a : G →* G).codRestrict _ powers)

theorem finiteLog_generator (g : G) (a n : ℕ) (ord : orderOf (g ^ a) = n)
    (powers : ∀ x : G, x ^ a ∈ zpowers (g ^ a)) :
    finiteLog g a n ord powers g = Multiplicative.ofAdd (1 : ZMod n) := by
  let e := zmodMulEquivOfGenerator (generates (g ^ a)) ((Nat.card_zpowers _).trans ord)
  apply e.injective
  change e (e.symm _) = _
  rw [e.apply_symm_apply, zmodMulEquivOfGenerator_apply_ofAdd_one]
  rfl

theorem finiteLog_spec (g : G) (a n : ℕ) (ord : orderOf (g ^ a) = n)
    (powers : ∀ x : G, x ^ a ∈ zpowers (g ^ a)) (x : G) (i : ℤ)
    (hi : x ^ a = (g ^ a) ^ i) :
    finiteLog g a n ord powers x = Multiplicative.ofAdd (i : ZMod n) := by
  let e := zmodMulEquivOfGenerator (generates (g ^ a)) ((Nat.card_zpowers _).trans ord)
  apply e.injective
  change e (e.symm _) = _
  rw [e.apply_symm_apply, zmodMulEquivOfGenerator_apply_ofAdd_intCast]
  exact Subtype.ext hi

end TunnellCyclotomicFiniteLog
end

/- TunnellCyclotomicLogTransition -/
section
/-! The finite logarithms commute with reduction to a lower level. -/

namespace TunnellCyclotomicLogTransition
open Subgroup TunnellCyclotomicFiniteLog

theorem transition {G T : Type*} [CommGroup G] [CommGroup T] (f : T →* G)
    (g : G) (h : T) (fg : f h=g) (a n m : ℕ) (div : n ∣ m)
    (og : orderOf (g^a)=n) (oh : orderOf (h^a)=m)
    (pg : ∀ x : G, x^a ∈ zpowers (g^a)) (ph : ∀ x : T, x^a ∈ zpowers (h^a)) (x : T) :
    ZMod.castHom div (ZMod n) ((finiteLog h a m oh ph x).toAdd) =
      (finiteLog g a n og pg (f x)).toAdd := by
  obtain ⟨i,hi⟩ := ph x
  have hh : (f x)^a = (g^a)^i := by
    have eq := congrArg f hi
    simpa only [map_zpow, map_pow, fg] using eq.symm
  rw [finiteLog_spec _ _ _ _ _ _ _ hi.symm, finiteLog_spec _ _ _ _ _ _ _ hh]
  exact map_intCast _ i

end TunnellCyclotomicLogTransition
end

/- TunnellCyclotomicPadicLog -/
section
/-! Continuous, compatible discrete logarithms at prime-power levels give a surjective p-adic logarithm. -/

namespace TunnellCyclotomicPadicLog
open scoped Topology
variable (p : ℕ) [Fact p.Prime]

theorem reduce_cont (n : ℕ) : Continuous (PadicInt.toZModPow n : ℤ_[p] → ZMod (p^n)) := by
  have hp : (p:ℝ) ≠ 0 := by exact_mod_cast (Fact.out : Nat.Prime p).ne_zero
  have ball : IsOpen (Metric.closedBall (0:ℤ_[p]) ((p:ℝ)^(-n:ℤ))) :=
    IsUltrametricDist.isOpen_closedBall _ (zpow_ne_zero _ hp)
  have ker : IsOpen ((RingHom.ker (PadicInt.toZModPow n : ℤ_[p] →+* ZMod (p^n)) : Ideal ℤ_[p]) : Set ℤ_[p]) := by
    rw [PadicInt.ker_toZModPow]
    convert ball using 1
    ext x
    rw [Metric.mem_closedBall,dist_zero_right]
    exact (PadicInt.norm_le_pow_iff_mem_span_pow x n).symm
  apply continuous_of_continuousAt_zero (PadicInt.toZModPow n : ℤ_[p] →+* ZMod (p^n))
  rw [ContinuousAt, @nhds_discrete (ZMod (p ^ n)) _ _, map_zero, Filter.tendsto_pure]
  exact ker.mem_nhds (by simp)

private theorem realize (r : ∀ n, ZMod (p^n))
    (compatible : ∀ n, ZMod.castHom (pow_dvd_pow p (Nat.le_succ n)) (ZMod (p^n)) (r (n+1)) = r n) :
    ∃ y : ℤ_[p], ∀ n, PadicInt.toZModPow n y = r n := by
  let f (n:ℕ) : ℤ := (r n).val
  have hcast (n:ℕ) : (f n : ZMod (p^n)) = r n := by simp [f]
  have hd (n:ℕ) : (p:ℤ)^n ∣ f (n+1)-f n := by
    rw [← Nat.cast_pow, ← ZMod.intCast_zmod_eq_zero_iff_dvd, Int.cast_sub, sub_eq_zero, hcast]
    have h := congrArg (ZMod.castHom (pow_dvd_pow p (Nat.le_succ n)) (ZMod (p^n))) (hcast (n+1))
    simpa only [map_intCast,compatible] using h
  refine ⟨PadicInt.ofIntSeq _ (PadicInt.isCauSeq_padicNorm_of_pow_dvd_sub f p hd),?_⟩
  intro n
  exact (PadicInt.toZModPow_ofIntSeq_of_pow_dvd_sub f p hd n).trans (hcast n)

theorem assemble {X : Type*} [AddCommGroup X] [TopologicalSpace X] [CompactSpace X]
    (r : ∀ n, X →+ ZMod (p^n)) (cont : ∀ n, Continuous (r n))
    (compat : ∀ n x, ZMod.castHom (pow_dvd_pow p (Nat.le_succ n)) (ZMod (p^n)) (r (n+1) x)=r n x)
    (g : X) (one : ∀ n, r n g = 1) :
    ∃ f : X →+ ℤ_[p], Continuous f ∧ Function.Surjective f := by
  choose value coords using fun x ↦ realize p (fun n ↦ r n x) (fun n ↦ compat n x)
  let f : X →+ ℤ_[p] :=
    { toFun := value
      map_zero' := PadicInt.ext_of_toZModPow.mp (fun n => by rw [coords,map_zero,map_zero])
      map_add' := fun _ _ => PadicInt.ext_of_toZModPow.mp (fun n => by rw [coords,map_add,map_add,coords,coords]) }
  let ev (z:ℤ_[p]) : ∀ n, ZMod (p^n) := fun n ↦ PadicInt.toZModPow n z
  have he : Continuous ev := continuous_pi (reduce_cont p)
  have inj : Function.Injective ev := fun a b h => PadicInt.ext_of_toZModPow.mp (congrFun h)
  have cf : Continuous f := (he.isClosedEmbedding inj).isEmbedding.continuous_iff.mpr
    (continuous_pi (fun n => (cont n).congr fun x => (coords x n).symm))
  have step : f g = 1 := PadicInt.ext_of_toZModPow.mp (fun n => by
    change PadicInt.toZModPow n (value g) = _
    rw [coords,one,map_one])
  refine ⟨f,cf,fun y => ?_⟩
  have closed : IsClosed (Set.range f) := (isCompact_range cf).isClosed
  refine DenseRange.induction_on (PadicInt.denseRange_intCast (p:=p)) y (p:=fun z => z ∈ Set.range f) closed ?_
  intro a
  refine ⟨a • g,?_⟩
  rw [map_zsmul,step,zsmul_one]

end TunnellCyclotomicPadicLog
end

/- TunnellCyclotomicUnitPowers -/
section
/-! At each finite prime-power level, an explicit power of the local units generates its free cyclic factor. -/

namespace TunnellCyclotomicUnitPowers
open Subgroup

noncomputable def oddUnit (p n : ℕ) : (ZMod (p ^ (n + 1)))ˣ :=
  ZMod.unitOfCoprime (1+p) ((by simp : Nat.Coprime (1+p) p).pow_right _)

theorem oddPower {p : ℕ} (hp : p.Prime) (odd : p ≠ 2) (n : ℕ) :
    orderOf (oddUnit p n ^ (p-1)) = p^n ∧
    ∀ x : (ZMod (p^(n+1)))ˣ, x^(p-1) ∈ zpowers (oddUnit p n ^ (p-1)) := by
  letI : Fact p.Prime := ⟨hp⟩
  letI : IsCyclic (ZMod (p^(n+1)))ˣ := ZMod.isCyclic_units_of_prime_pow p hp odd _
  have orig : orderOf (oddUnit p n) = p^n := by
    rw [← orderOf_injective _ Units.coeHom_injective]
    simpa [oddUnit, ZMod.coe_unitOfCoprime] using ZMod.orderOf_one_add_prime hp odd n
  have cop : Nat.Coprime (p^n) (p-1) :=
    ((Nat.coprime_self_sub_right hp.one_le).mpr (Nat.coprime_one_right p)).pow_left _
  have ord : orderOf (oddUnit p n ^ (p-1)) = p^n := (orig ▸ cop).orderOf_pow.trans orig
  refine ⟨ord,?_⟩
  let P := (powMonoidHom (p-1) : (ZMod (p^(n+1)))ˣ →* _).range
  have le : zpowers (oddUnit p n ^ (p-1)) ≤ P := zpowers_le.mpr ⟨_,rfl⟩
  have hcard : Nat.card P = p^n := by
    have hpos : 0 < p-1 := by have :=hp.two_le; omega
    rw [IsCyclic.card_powMonoidHom_range, Nat.card_eq_fintype_card, ZMod.card_units_eq_totient,
      Nat.totient_prime_pow_succ hp, Nat.gcd_eq_right (dvd_mul_left _ _), Nat.mul_div_cancel _ hpos]
  have eq := Subgroup.eq_of_le_of_card_ge le (by rw [Nat.card_zpowers, ord, hcard])
  intro x
  exact eq ▸ (show x^(p-1) ∈ P from ⟨x,rfl⟩)

noncomputable def twoUnit (n : ℕ) : (ZMod (2 ^ (n + 3)))ˣ :=
  ZMod.unitOfCoprime 5 ((by decide : Nat.Coprime 5 2).pow_right _)

theorem twoPower (n : ℕ) : orderOf (twoUnit n ^ 2) = 2^n ∧
    ∀ x : (ZMod (2^(n+3)))ˣ, x^2 ∈ zpowers (twoUnit n ^ 2) := by
  have orig : orderOf (twoUnit n) = 2^(n+1) := by
    rw [← orderOf_injective _ Units.coeHom_injective]
    simpa [twoUnit] using ZMod.orderOf_five (n+1)
  have ord : orderOf (twoUnit n ^ 2) = 2^n := by
    rw [orderOf_pow, orig, pow_succ, Nat.gcd_eq_right (dvd_mul_left _ _), Nat.mul_div_cancel _ (by decide)]
  refine ⟨ord,?_⟩
  let f := ZMod.unitsMap (show 8 ∣ 2^(n+3) by rw [pow_add]; exact dvd_mul_left _ _)
  have small (u : (ZMod 8)ˣ) : u^2 = 1 := by decide +revert
  have kernel (u : (ZMod (2^(n+3)))ˣ) : u^2 ∈ f.ker := by
    change f (u^2)=1
    rw [map_pow,small]
  have card : Nat.card f.ker = 2^n := by
    have ind : f.ker.index = Nat.card (ZMod 8)ˣ := by
      change ((⊥ : Subgroup (ZMod 8)ˣ).comap f).index = _
      rw [Subgroup.index_comap_of_surjective _ (ZMod.unitsMap_surjective _),Subgroup.index_bot]
    have four : Nat.card (ZMod 8)ˣ = 4 := by
      rw [Nat.card_eq_fintype_card,ZMod.card_units_eq_totient]
      decide
    have total : Nat.card (ZMod (2^(n+3)))ˣ = 2^n * 4 := by
      rw [Nat.card_eq_fintype_card,ZMod.card_units_eq_totient,Nat.totient_prime_pow_succ Nat.prime_two]
      simp [pow_add]
    have eq := f.ker.card_mul_index
    rw [ind,four,total] at eq
    omega
  have eq := Subgroup.eq_of_le_of_card_ge (zpowers_le.mpr (kernel (twoUnit n))) (by rw [Nat.card_zpowers,ord,card])
  intro x
  rw [eq]
  exact kernel x

end TunnellCyclotomicUnitPowers
end

/- TunnellCyclotomicLocalCharacter -/
section
/-! The free p-adic unit character, including the square map on odd 2-adic units. -/

namespace TunnellCyclotomicLocalCharacter
open Subgroup TunnellCyclotomicFiniteLog TunnellCyclotomicLogTransition TunnellCyclotomicUnitPowers
noncomputable section
variable (p : ℕ) [Fact p.Prime]

def red (n : ℕ) : ℤ_[p]ˣ →* (ZMod (p^n))ˣ :=
  Units.map (PadicInt.toZModPow n).toMonoidHom

theorem red_cast {m n : ℕ} (le : m ≤ n) (u : ℤ_[p]ˣ) :
    ZMod.unitsMap (pow_dvd_pow p le) (red p n u) = red p m u := by
  apply Units.ext
  exact congrArg (fun f : ℤ_[p] →+* ZMod (p^m) => f u.val) (PadicInt.zmod_cast_comp_toZModPow m n le)

set_option maxHeartbeats 1200000 in
theorem log_of_levels (a c : ℕ) (g : ℤ_[p]ˣ)
    (gens : ∀ n, orderOf (red p (n+c) g ^ a) = p^n ∧
      ∀ x : (ZMod (p^(n+c)))ˣ, x^a ∈ zpowers (red p (n+c) g ^ a)) :
    ∃ L : ℤ_[p]ˣ →* Multiplicative ℤ_[p], Continuous L ∧ Function.Surjective L := by
  let f (n : ℕ) := finiteLog (red p (n+c) g) a (p^n) (gens n).1 (gens n).2
  let r (n : ℕ) := (f n).comp (red p (n+c))
  have cont (n : ℕ) : Continuous (r n) :=
    (continuous_of_discreteTopology (f:=f n)).comp ((TunnellCyclotomicPadicLog.reduce_cont p (n+c)).units_map _)
  have compat (n : ℕ) (u : ℤ_[p]ˣ) :
      ZMod.castHom (pow_dvd_pow p (Nat.le_succ n)) (ZMod (p^n)) ((r (n+1) u).toAdd) = (r n u).toAdd := by
    let le : n+c ≤ n+1+c := by omega
    have eq := transition (ZMod.unitsMap (pow_dvd_pow p le)) (red p (n+c) g) (red p (n+1+c) g)
      (red_cast p le g) a (p^n) (p^(n+1)) (pow_dvd_pow p (Nat.le_succ n)) (gens n).1 (gens (n+1)).1
      (gens n).2 (gens (n+1)).2 (red p (n+1+c) u)
    rw [red_cast p le u] at eq
    exact eq
  have one (n : ℕ) : (r n g).toAdd = 1 := by
    exact congrArg Multiplicative.toAdd (finiteLog_generator (red p (n+c) g) a (p^n) (gens n).1 (gens n).2)
  obtain ⟨l,cl,sl⟩ := TunnellCyclotomicPadicLog.assemble p (fun n => (r n).toAdditiveLeft)
    cont compat (Additive.ofMul g) one
  exact ⟨l.toMultiplicativeRight,cl,sl⟩

private theorem unit_one_add (t : ℤ_[p]) : IsUnit (1+t*p : ℤ_[p]) := by
  by_contra neg
  let I := IsLocalRing.maximalIdeal ℤ_[p]
  have hp : (p : ℤ_[p]) ∈ I := by
    rw [show I=Ideal.span {(p : ℤ_[p])} from PadicInt.maximalIdeal_eq_span_p]
    exact Ideal.subset_span (Set.mem_singleton _)
  have h : (1+t*p : ℤ_[p]) ∈ I := (IsLocalRing.mem_maximalIdeal _).mpr neg
  have hh := I.sub_mem h (I.mul_mem_left t hp)
  apply (IsLocalRing.maximalIdeal.isMaximal ℤ_[p]).ne_top
  exact I.eq_top_iff_one.mpr (by simpa using hh)

theorem exists_character : ∃ L : ℤ_[p]ˣ →* Multiplicative ℤ_[p], Continuous L ∧ Function.Surjective L := by
  by_cases two : p=2
  · subst p
    let g := (unit_one_add 2 (2:ℤ_[2])).unit
    apply log_of_levels 2 2 3 g
    intro n
    have eq : red 2 (n+3) g = twoUnit n := by
      apply Units.ext
      change PadicInt.toZModPow (n+3) ((1+(2:ℤ_[2])*2))=_
      rw [show 1+(2:ℤ_[2])*2 = (5:ℕ) by norm_num, map_natCast]
      rfl
    rw [eq]
    exact twoPower n
  · let g := (unit_one_add p (1:ℤ_[p])).unit
    apply log_of_levels p (p-1) 1 g
    intro n
    have eq : red p (n+1) g=oddUnit p n := by
      apply Units.ext
      change PadicInt.toZModPow (n+1) (1+(1:ℤ_[p])*(p:ℤ_[p]))=_
      simp [oddUnit, map_natCast]
    rw [eq]
    exact oddPower (Fact.out : p.Prime) two n

end
end TunnellCyclotomicLocalCharacter
end

/- TunnellRationalDegreeCoordinates -/
section
/-! Construct the rational procyclic degree from the finite cyclotomic character and surjective local logarithms. -/

namespace TunnellRationalDegreeCoordinates
open ClassFormation
noncomputable section
local instance (p : Nat.Primes) : Fact p.val.Prime := ⟨p.property⟩
abbrev P := ProfiniteIntegerPrimeProduct
abbrev U := (p : Nat.Primes) → ℤ_[p.val]ˣ
abbrev Z := TunnellProfiniteCoordinate.Z
variable (L : (p : Nat.Primes) → ℤ_[p.val]ˣ →* Multiplicative ℤ_[p.val])

def productLog : U →* Multiplicative P where
  toFun u := Multiplicative.ofAdd (fun p => (L p (u p)).toAdd)
  map_one' := congrArg Multiplicative.ofAdd (funext (fun p => congrArg Multiplicative.toAdd ((L p).map_one)))
  map_mul' u v := congrArg Multiplicative.ofAdd (funext (fun p =>
    congrArg Multiplicative.toAdd ((L p).map_mul (u p) (v p))))

def project : U →* Multiplicative Z :=
  (TunnellProfiniteCoordinate.equiv.toMultiplicative.toMonoidHom).comp
    (zHatContinuousAddEquivPrimeProduct.symm.toAddEquiv.toMultiplicative.toMonoidHom.comp (productLog L))

theorem project_cont (hL : ∀ p, Continuous (L p)) : Continuous (project L) :=
  TunnellProfiniteCoordinate.continuous_equiv.comp
    (zHatContinuousAddEquivPrimeProduct.symm.continuous.comp
      (continuous_pi fun p => (hL p).comp (continuous_apply p)))

theorem project_surj (hL : ∀ p, Function.Surjective (L p)) : Function.Surjective (project L) := by
  apply TunnellProfiniteCoordinate.equiv.toMultiplicative.surjective.comp
  apply zHatContinuousAddEquivPrimeProduct.symm.toAddEquiv.toMultiplicative.surjective.comp
  intro x
  choose u hu using fun p => hL p (Multiplicative.ofAdd (x.toAdd p))
  exact ⟨u,congrArg Multiplicative.ofAdd (funext (fun p => congrArg Multiplicative.toAdd (hu p)))⟩

end
end TunnellRationalDegreeCoordinates
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
end
end TunnellRayCoordinateUnits
end

/- TunnellProcyclicNormImages -/
section
/-! Passing from finite cyclotomic unit coordinates to exact images in a procyclic quotient. -/
namespace TunnellProcyclicNormImages
open Set NumberField ClassFormation
open scoped NumberField TensorProduct
noncomputable section
abbrev Z := Multiplicative TunnellProfiniteCoordinate.Z

theorem powers_open (n : ℕ) (hn : 0<n) : IsOpen ((powMonoidHom n : Z →* Z).range : Set Z) := by
  let e := TunnellProfiniteCoordinate.equiv.toMultiplicative
  let red := (zHatReduction n hn).toAddMonoidHom.toMultiplicative.comp e.symm.toMonoidHom
  have eq : (powMonoidHom n : Z →* Z).range=red.ker := by
    ext y
    change (∃ x : Z, x^n=y) ↔ zHatReduction n hn ((e.symm y).toAdd)=0
    change _ ↔ (e.symm y).toAdd ∈ (zHatReduction n hn).toAddMonoidHom.ker
    rw [←zHatMulNat_range_eq_ker_reduction]
    constructor
    · rintro ⟨x,rfl⟩
      exact ⟨(e.symm x).toAdd,congrArg Multiplicative.toAdd (map_pow e.symm x n).symm⟩
    · rintro ⟨x,hx⟩
      refine ⟨e (Multiplicative.ofAdd x), e.symm.injective ?_⟩
      rw [map_pow,MulEquiv.symm_apply_apply]
      exact congrArg Multiplicative.ofAdd hx
  rw [eq]
  change IsOpen (red ⁻¹' ({1} : Set (Multiplicative (ZMod n))))
  exact (isOpen_discrete _).preimage ((zHatReduction n hn).continuous.comp TunnellProfiniteCoordinate.continuous_inv)

end
end TunnellProcyclicNormImages
end

/- TunnellProcyclicProjection -/
section
namespace TunnellProcyclicProjection
open TunnellRationalDegreeCoordinates TunnellRayCoordinateUnits
open scoped NumberField
noncomputable section
local instance (p : Nat.Primes) : Fact p.val.Prime := ⟨p.property⟩

theorem actual :
    (∃ f : TunnellProfiniteCoordinate.Zˣ →* Multiplicative TunnellProfiniteCoordinate.Z,
      Continuous f ∧ Function.Surjective f) ∧ ∀ n : ℕ, 0<n →
      IsOpen ((powMonoidHom n : Multiplicative TunnellProfiniteCoordinate.Z →* _).range :
        Set (Multiplicative TunnellProfiniteCoordinate.Z)) := by
  choose L c sur using fun p : Nat.Primes => TunnellCyclotomicLocalCharacter.exists_character p.val
  exact ⟨⟨(project L).comp E.symm.toMonoidHom,(project_cont L c).comp inv_cont,
    (project_surj L sur).comp E.symm.surjective⟩,TunnellProcyclicNormImages.powers_open⟩
end
end TunnellProcyclicProjection
end

theorem OMA.solution : OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1_H1_R1_H1_R1.H2 := TunnellProcyclicProjection.actual
