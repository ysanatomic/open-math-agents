import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H3_R1_H1_R1_H3_R1_H2_R1_H1_R1
import Mathlib

/-! The local pth-power map has derivative p at 1. Its exact image on small balls, and the product formula for principal ideals, compute the index on supported idèles. -/


/-! The power map has derivative n at 1. On sufficiently small ultrametric balls it acts by exact dilation, and the valuation and residue arithmetic give the local norm defect. -/
/- EllipticCurves.Mathlib.Basic -/
section
section Group
variable {G H : Type*} [Group G] [Group H]
end Group
section Units
variable {α : Type*} [Monoid α]
end Units
section modPow
namespace Units.modPow
variable {α β : Type*} [CommMonoid α] [CommMonoid β] {a b c : α}
open QuotientGroup
end Units.modPow
end modPow
section Ideal
end Ideal
section LinearAlgebra
end LinearAlgebra
section Valuation
open Polynomial
variable {L Γ : Type*} [CommRing L] [LinearOrderedCommGroupWithZero Γ] (ν : Valuation L Γ)
  {t a b : L}
end Valuation
section DedekindDomain
open IsDedekindDomain
variable {R : Type*} [CommRing R] [IsDedekindDomain R]
  {K : Type*} [Field K] [Algebra R K] [IsFractionRing R K]
variable (R) (B : Type*) [CommRing B] [IsDedekindDomain B] [Algebra R B]
namespace IsDiscreteValuationRing
variable (A : Type*) [CommRing A] [IsDomain A] [IsDiscreteValuationRing A]
variable {A}
end IsDiscreteValuationRing
namespace IsDedekindDomain.HeightOneSpectrum
variable {B C : Type*} [CommRing B] [IsDedekindDomain B] [CommRing C] [IsDedekindDomain C]
variable {L N : Type*} [Field L] [Algebra B L] [IsFractionRing B L]
  [Field N] [Algebra C N] [IsFractionRing C N]
 

theorem comap_maximalIdeal_adicCompletionIntegers (v : HeightOneSpectrum R) :
    (IsLocalRing.maximalIdeal (v.adicCompletionIntegers K)).comap
      (algebraMap R (v.adicCompletionIntegers K)) = v.asIdeal := by
  ext x
  rw [Ideal.mem_comap, ← valuation_lt_one_iff_mem (K := K)]
  refine (Valuation.mem_maximalIdeal_iff (v := (Valued.v : Valuation (v.adicCompletion K)
    (WithZero (Multiplicative ℤ))))).trans ?_
  rw [show ((algebraMap R (v.adicCompletionIntegers K) x : v.adicCompletionIntegers K) :
    v.adicCompletion K) = ((algebraMap R K x : K) : v.adicCompletion K) from rfl,
    valuedAdicCompletion_eq_valuation']
end IsDedekindDomain.HeightOneSpectrum
end DedekindDomain
namespace Polynomial
variable {R : Type*} [CommRing R] {g : R[X]}
section
variable [Nontrivial R] {q : R[X]} {n : ℕ}
end
section Sylvester
open Module LinearMap LinearEquiv
variable [Nontrivial R] {p : R[X]} {n : ℕ}
end Sylvester
end Polynomial
open Polynomial LinearMap LinearEquiv
namespace AdjoinRoot
variable {R : Type*} [CommRing R] {g : R[X]} {n : ℕ}
section Map
variable {S : Type*} [CommRing S] (σ : R →+* S)
end Map
end AdjoinRoot
section EtaleDecomposition
open Polynomial UniqueFactorizationMonoid
namespace Polynomial
variable {K : Type*} [Field K] {f : K[X]}
namespace Factors
end Factors
end Polynomial
namespace AdjoinRoot
variable {K : Type*} [Field K] {f : K[X]}
end AdjoinRoot
end EtaleDecomposition
section NumberField
open NumberField
variable (K L : Type*) [Field K] [Field L] [Algebra K L]
variable [NumberField K] [FiniteDimensional K L]
end NumberField
section Discriminant
open NumberField Module
variable {K : Type*} [Field K] [NumberField K]
end Discriminant
end

/- EllipticCurves.Mathlib.AdicCompletionExtension -/
section
open Polynomial IsDedekindDomain WithZero
namespace IsDedekindDomain.HeightOneSpectrum
variable {R : Type*} [CommRing R] [IsDedekindDomain R]
  {K : Type*} [Field K] [Algebra R K] [IsFractionRing R K] (v : HeightOneSpectrum R)
 
theorem valued_irreducible_adicCompletionIntegers {π : v.adicCompletionIntegers K}
    (hπ : Irreducible π) :
    Valued.v (algebraMap (v.adicCompletionIntegers K) (v.adicCompletion K) π) = exp (-1) := by
  have hgen : IsLocalRing.maximalIdeal (Valued.v : Valuation (v.adicCompletion K)
      ℤᵐ⁰).valuationSubring = Ideal.span {π} := hπ.maximalIdeal_eq
  have huni := Valuation.isUniformizer_of_maximalIdeal_eq_span
    (v := (Valued.v : Valuation (v.adicCompletion K) ℤᵐ⁰)) hgen
  rwa [Valuation.IsUniformizer.iff,
    Valuation.IsRankOneDiscrete.generator_eq_exp_neg_one_of_surjective
      (v.valuedAdicCompletion_surjective K)] at huni
 

theorem span_singleton_eq_maximalIdeal_pow {x : v.adicCompletionIntegers K} {e : ℕ}
    (hx : Valued.v (algebraMap (v.adicCompletionIntegers K) (v.adicCompletion K) x) =
      exp (-(e : ℤ))) :
    Ideal.span {x} = IsLocalRing.maximalIdeal (v.adicCompletionIntegers K) ^ e := by
  have hx0 : x ≠ 0 := by
    rintro rfl
    rw [map_zero, map_zero] at hx
    exact absurd hx.symm exp_ne_zero
  obtain ⟨π, hπ⟩ := IsDiscreteValuationRing.exists_irreducible (v.adicCompletionIntegers K)
  obtain ⟨n, u, rfl⟩ := IsDiscreteValuationRing.eq_unit_mul_pow_irreducible hx0 hπ
  have hu2 : Valued.v (algebraMap (v.adicCompletionIntegers K) (v.adicCompletion K)
      (u : v.adicCompletionIntegers K)) = 1 :=
    (Valuation.valuationSubring.integers (v := Valued.v)).valuation_unit u
  have hval : Valued.v (algebraMap (v.adicCompletionIntegers K) (v.adicCompletion K)
      (↑u * π ^ n)) = exp (-(n : ℤ)) := by
    rw [map_mul, map_mul, hu2, one_mul, map_pow, map_pow,
      v.valued_irreducible_adicCompletionIntegers hπ, ← exp_nsmul]
    simp
  rw [hval, exp_inj, neg_inj, Int.natCast_inj] at hx
  subst hx
  rw [Ideal.span_singleton_eq_span_singleton.mpr (associated_unit_mul_left _ _ u.isUnit),
    ← Ideal.span_singleton_pow, hπ.maximalIdeal_eq]
 

theorem exists_valued_sub_lt_one (x : v.adicCompletionIntegers K) :
    ∃ a : R, Valued.v ((x : v.adicCompletion K) - algebraMap R (v.adicCompletion K) a) < 1 := by
  
  have hball : {y | Valued.v (y - (x : v.adicCompletion K)) < 1} ∈
      nhds (x : v.adicCompletion K) := by
    rw [Valued.mem_nhds]
    exact ⟨1, fun y hy ↦ by simpa using hy⟩
  obtain ⟨w, hwball, z, rfl⟩ :=
    mem_closure_iff_nhds.mp (denseRange_algebraMap (K := K) v _) _ hball
  rw [Set.mem_ofPred_eq] at hwball
  
  have hz1 : v.valuation K z ≤ 1 := by
    rw [show v.valuation K z = Valued.v (algebraMap K (v.adicCompletion K) z) from
      (v.valuedAdicCompletion_eq_valuation' z).symm]
    calc Valued.v (algebraMap K (v.adicCompletion K) z)
        = Valued.v (algebraMap K (v.adicCompletion K) z - (x : v.adicCompletion K)
            + (x : v.adicCompletion K)) := by ring_nf
      _ ≤ max (Valued.v (algebraMap K (v.adicCompletion K) z - (x : v.adicCompletion K)))
            (Valued.v (x : v.adicCompletion K)) := Valuation.map_add _ _ _
      _ ≤ 1 := max_le hwball.le x.2
  
  obtain ⟨a, ha⟩ := v.exists_valuation_sub_lt_of_integer hz1 1
  refine ⟨a, ?_⟩
  have ha' : Valued.v (algebraMap K (v.adicCompletion K) z -
      algebraMap R (v.adicCompletion K) a) < 1 := by
    rw [IsScalarTower.algebraMap_apply R K (v.adicCompletion K), ← map_sub,
      show Valued.v (algebraMap K (v.adicCompletion K) (z - algebraMap R K a)) =
        v.valuation K (z - algebraMap R K a) from v.valuedAdicCompletion_eq_valuation' _,
      Valuation.map_sub_swap]
    simpa using ha
  calc Valued.v ((x : v.adicCompletion K) - algebraMap R (v.adicCompletion K) a)
      = Valued.v (((x : v.adicCompletion K) - algebraMap K (v.adicCompletion K) z)
          + (algebraMap K (v.adicCompletion K) z - algebraMap R (v.adicCompletion K) a)) := by
        ring_nf
    _ ≤ max _ _ := Valuation.map_add _ _ _
    _ < 1 := max_lt (by rwa [Valuation.map_sub_swap] at hwball) ha'
 

noncomputable def residueFieldEquivAdicCompletionIntegers :
    (R ⧸ v.asIdeal) ≃+*
      (v.adicCompletionIntegers K ⧸ IsLocalRing.maximalIdeal (v.adicCompletionIntegers K)) := by
  refine RingEquiv.ofBijective (Ideal.quotientMap (IsLocalRing.maximalIdeal _)
    (algebraMap R (v.adicCompletionIntegers K))
    (le_of_eq (v.comap_maximalIdeal_adicCompletionIntegers (K := K)).symm)) ⟨?_, ?_⟩
  · exact Ideal.quotientMap_injective'
      (le_of_eq (v.comap_maximalIdeal_adicCompletionIntegers (K := K)))
  · intro y
    obtain ⟨x, rfl⟩ := Ideal.Quotient.mk_surjective y
    obtain ⟨a, ha⟩ := v.exists_valued_sub_lt_one (K := K) x
    refine ⟨Ideal.Quotient.mk _ a, ?_⟩
    rw [Ideal.quotientMap_mk]
    refine (Ideal.Quotient.eq).mpr ?_
    refine (Valuation.mem_maximalIdeal_iff (v := (Valued.v : Valuation (v.adicCompletion K)
      ℤᵐ⁰))).mpr ?_
    rw [show ((algebraMap R (v.adicCompletionIntegers K) a - x : v.adicCompletionIntegers K) :
      v.adicCompletion K) = algebraMap R (v.adicCompletion K) a - (x : v.adicCompletion K)
      from rfl, Valuation.map_sub_swap]
    exact ha
end IsDedekindDomain.HeightOneSpectrum
namespace IsDedekindDomain.HeightOneSpectrum
section Extension
variable {R : Type*} [CommRing R] [IsDedekindDomain R]
  {K : Type*} [Field K] [Algebra R K] [IsFractionRing R K]
  {B : Type*} [CommRing B] [IsDedekindDomain B] [Algebra R B] [Module.IsTorsionFree R B]
  {L : Type*} [Field L] [Algebra K L] [Algebra R L] [IsScalarTower R K L]
  [Algebra B L] [IsFractionRing B L] [IsScalarTower R B L]
  (v : HeightOneSpectrum R) (w : HeightOneSpectrum B) [w.asIdeal.LiesOver v.asIdeal]
variable (K L)
end Extension
end IsDedekindDomain.HeightOneSpectrum
end

/- ValuedFieldTheory.LocalField.GroupTheory.IntegerMultipleSubgroup -/
section
namespace LocalFieldTheory.DiscreteValuationField
 

def integerMultipleSubgroup (d : ℤ) : Subgroup (Multiplicative ℤ) where
  carrier := {n | d ∣ Multiplicative.toAdd n}
  one_mem' := by
    change d ∣ (0 : ℤ)
    exact dvd_zero d
  mul_mem' := by
    intro x y hx hy
    change d ∣ Multiplicative.toAdd (x * y)
    rw [toAdd_mul]
    exact dvd_add hx hy
  inv_mem' := by
    intro x hx
    change d ∣ Multiplicative.toAdd x⁻¹
    rw [toAdd_inv]
    exact dvd_neg.mpr hx
 
@[simp] theorem mem_integerMultipleSubgroup_iff
    (d : ℤ) (n : Multiplicative ℤ) :
    n ∈ integerMultipleSubgroup d ↔ d ∣ Multiplicative.toAdd n :=
  Iff.rfl
 

def multiplicativeIntToZModHom (d : ℤ) :
    Multiplicative ℤ →* Multiplicative (ZMod d.natAbs) :=
  AddMonoidHom.toMultiplicative (Int.castAddHom (ZMod d.natAbs))
 
theorem multiplicativeIntToZModHom_ker_eq_integerMultipleSubgroup (d : ℤ) :
    (multiplicativeIntToZModHom d).ker = integerMultipleSubgroup d := by
  ext n
  change ((n.toAdd : ZMod d.natAbs) = 0) ↔ d ∣ n.toAdd
  rw [ZMod.intCast_zmod_eq_zero_iff_dvd]
  exact Int.natAbs_dvd
 
theorem multiplicativeIntToZModHom_surjective (d : ℤ) :
    Function.Surjective (multiplicativeIntToZModHom d) := by
  intro q
  rcases ZMod.intCast_surjective q.toAdd with ⟨n, hn⟩
  refine ⟨Multiplicative.ofAdd n, ?_⟩
  change Multiplicative.ofAdd ((n : ZMod d.natAbs)) = q
  rw [hn]
  rfl
 

noncomputable def valueModIntegerMultipleSubgroupEquivZMod (d : ℤ) :
    Multiplicative ℤ ⧸ integerMultipleSubgroup d ≃*
      Multiplicative (ZMod d.natAbs) :=
  (QuotientGroup.quotientMulEquivOfEq
      (multiplicativeIntToZModHom_ker_eq_integerMultipleSubgroup d).symm).trans
    (QuotientGroup.quotientKerEquivOfSurjective
      (multiplicativeIntToZModHom d)
      (multiplicativeIntToZModHom_surjective d))
end LocalFieldTheory.DiscreteValuationField
end

/- ValuedFieldTheory.LocalField.GroupTheory.PowerIndex -/
section
noncomputable section
namespace LocalFieldTheory
open LocalFieldTheory.DiscreteValuationField
open scoped Int
section NthPowers
universe uG uH uU
variable (G : Type uG) (H : Type uH) (U : Type uU)
variable [CommGroup G] [CommGroup H] [CommGroup U]
 

theorem powMonoidHom_range_map (n : ℕ) (e : G ≃* H) :
    ((powMonoidHom n : G →* G).range).map e.toMonoidHom = (powMonoidHom n : H →* H).range := by
  exact e.map_range_powMonoidHom n
 

theorem powMonoidHom_ker_units_eq_rootsOfUnity
    (R : Type*) [CommRing R] (n : ℕ) :
    (powMonoidHom n : Rˣ →* Rˣ).ker = rootsOfUnity n R := by
  ext x
  exact MonoidHom.mem_ker
 
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
 

theorem card_nthPowerProductQuotient (n : ℕ)
    [Finite (G ⧸ (powMonoidHom n : G →* G).range)]
    [Finite (H ⧸ (powMonoidHom n : H →* H).range)] :
    Nat.card ((G × H) ⧸ (powMonoidHom n : (G × H) →* (G × H)).range) =
      Nat.card (G ⧸ (powMonoidHom n : G →* G).range) *
        Nat.card (H ⧸ (powMonoidHom n : H →* H).range) := by
  rw [Nat.card_congr (nthPowerProductQuotientEquiv G H n).toEquiv,
    Nat.card_prod]
 

theorem powMonoidHom_range_multiplicativeInt_eq_integerMultipleSubgroup
    (n : ℕ) :
    (powMonoidHom n : (Multiplicative ℤ) →* (Multiplicative ℤ)).range =
      integerMultipleSubgroup (n : ℤ) := by
  ext x
  constructor
  · intro hx
    rw [MonoidHom.mem_range] at hx
    rcases hx with ⟨y, rfl⟩
    rw [mem_integerMultipleSubgroup_iff, powMonoidHom_apply, Int.toAdd_pow]
    exact ⟨y.toAdd, by ring⟩
  · intro hx
    rw [mem_integerMultipleSubgroup_iff] at hx
    rcases hx with ⟨k, hk⟩
    rw [MonoidHom.mem_range]
    refine ⟨Multiplicative.ofAdd k, ?_⟩
    apply Multiplicative.toAdd.injective
    rw [powMonoidHom_apply, Int.toAdd_pow, toAdd_ofAdd, hk]
    ring
 
theorem finite_multiplicativeInt_nthPowerQuotient
    {n : ℕ} (hn : n ≠ 0) :
    Finite (Multiplicative ℤ ⧸ (powMonoidHom n : (Multiplicative ℤ) →* (Multiplicative ℤ)).range) := by
  rw [powMonoidHom_range_multiplicativeInt_eq_integerMultipleSubgroup]
  have hnabs : (n : ℤ).natAbs ≠ 0 := by simpa using hn
  let : NeZero (n : ℤ).natAbs := ⟨hnabs⟩
  exact Finite.of_equiv
    (Multiplicative (ZMod (n : ℤ).natAbs))
    (valueModIntegerMultipleSubgroupEquivZMod (n : ℤ)).symm.toEquiv
 



theorem finite_nthPowerQuotient_of_mulEquiv_units_prod_int
    {n : ℕ} [NeZero n] (e : G ≃* U × Multiplicative ℤ)
    [Finite (U ⧸ (powMonoidHom n : U →* U).range)] :
    Finite (G ⧸ (powMonoidHom n : G →* G).range) := by
  let : Finite
      (Multiplicative ℤ ⧸
        (powMonoidHom n : (Multiplicative ℤ) →* (Multiplicative ℤ)).range) :=
    finite_multiplicativeInt_nthPowerQuotient (NeZero.ne n)
  exact finite_nthPowerQuotient_of_mulEquiv
    G (U × Multiplicative ℤ) n e
 
theorem card_multiplicativeInt_nthPowerQuotient
    {n : ℕ} (hn : n ≠ 0)
    [Finite (Multiplicative ℤ ⧸ (powMonoidHom n : (Multiplicative ℤ) →* (Multiplicative ℤ)).range)] :
    Nat.card
        (Multiplicative ℤ ⧸ (powMonoidHom n : (Multiplicative ℤ) →* (Multiplicative ℤ)).range) = n := by
  rw [Nat.card_congr
    ((QuotientGroup.quotientMulEquivOfEq
      (powMonoidHom_range_multiplicativeInt_eq_integerMultipleSubgroup n)).trans
        (valueModIntegerMultipleSubgroupEquivZMod (n : ℤ))).toEquiv]
  rw [Nat.card_congr
    (Multiplicative.toAdd :
      Multiplicative (ZMod ((n : ℤ).natAbs)) ≃ ZMod ((n : ℤ).natAbs))]
  have hnabs : (n : ℤ).natAbs ≠ 0 := by simpa using hn
  let : NeZero (n : ℤ).natAbs := ⟨hnabs⟩
  have hcard : Nat.card (ZMod ((n : ℤ).natAbs)) = (n : ℤ).natAbs :=
    Nat.card_zmod ((n : ℤ).natAbs)
  simp at hcard ⊢
 

theorem card_nthPowerQuotient_eq_mul_of_mulEquiv_units_prod_int
    {n : ℕ} (hn : n ≠ 0) (e : G ≃* U × Multiplicative ℤ)
    [Finite (G ⧸ (powMonoidHom n : G →* G).range)]
    [Finite (U ⧸ (powMonoidHom n : U →* U).range)] :
    Nat.card (G ⧸ (powMonoidHom n : G →* G).range) =
      n * Nat.card (U ⧸ (powMonoidHom n : U →* U).range) := by
  let := finite_multiplicativeInt_nthPowerQuotient hn
  calc
    Nat.card (G ⧸ (powMonoidHom n : G →* G).range) =
        Nat.card ((U × Multiplicative ℤ) ⧸
          (powMonoidHom n : (U × Multiplicative ℤ) →* (U × Multiplicative ℤ)).range) := by
      rw [Nat.card_congr
        (nthPowerQuotientEquivOfMulEquiv G (U × Multiplicative ℤ) n e).toEquiv]
    _ =
        Nat.card (U ⧸ (powMonoidHom n : U →* U).range) *
          Nat.card (Multiplicative ℤ ⧸
            (powMonoidHom n : (Multiplicative ℤ) →* (Multiplicative ℤ)).range) :=
      card_nthPowerProductQuotient U (Multiplicative ℤ) n
    _ = Nat.card (U ⧸ (powMonoidHom n : U →* U).range) * n := by
      rw [card_multiplicativeInt_nthPowerQuotient hn]
    _ = n * Nat.card (U ⧸ (powMonoidHom n : U →* U).range) := by
      rw [Nat.mul_comm]
end NthPowers
section AdditivePowers
universe uA uB uG
variable (A : Type uA) [AddCommGroup A]
section AdditiveProducts
variable (B : Type uB) [AddCommGroup B]
end AdditiveProducts
variable (G : Type uG) [CommGroup G]
end AdditivePowers
end LocalFieldTheory
end
end

namespace TunnellPowerBall
open Filter Topology Set
variable {K:Type} [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
theorem linear_norm (n:ℕ) (hn:(n:K)≠0):
    ∀ᶠ x:K in 𝓝 1, ‖x^n-1‖=‖(n:K)‖*‖x-1‖ := by
  let s (x:K):=∑ i∈Finset.range n,x^i
  have hc:Continuous s:=by fun_prop
  have he:s 1=(n:K):=by simp [s]
  have hv:=hc.continuousAt.preimage_mem_nhds (Metric.ball_mem_nhds (s 1) (norm_pos_iff.mpr hn))
  filter_upwards [hv] with x hx
  change dist (s x) (s 1)<‖(n:K)‖ at hx
  rw [he,dist_eq_norm] at hx
  have eq:‖s x‖=‖(n:K)‖:=by
    have hh:=IsUltrametricDist.norm_add_eq_max_of_norm_ne_norm (x:=s x-(n:K)) (y:=(n:K)) hx.ne
    simpa only [sub_add_cancel,max_eq_right hx.le] using hh
  rw [←geom_sum_mul x n,norm_mul]
  exact congrArg (·*‖x-1‖) eq

theorem small_image (n:ℕ) (hn:(n:K)≠0) (c:ℝ) (hc:0<c) :
    ∃ r:K, 0<‖r‖ ∧ ‖r‖<c ∧
      (∀ x:K, ‖x-1‖≤‖r‖ → ‖x^n-1‖=‖(n:K)‖*‖x-1‖) ∧
      (fun x:K=>x^n) '' {x|‖x-1‖≤‖r‖}={y|‖y-1‖≤‖(n:K)‖*‖r‖} := by
  let f:K→K:=fun x=>x^n
  have df:HasStrictDerivAt f (n:K) 1:=by simpa [f] using hasStrictDerivAt_pow n (1:K)
  let B:Set K:={x|‖x^n-1‖=‖(n:K)‖*‖x-1‖}
  have hB:B∈𝓝 1:=linear_norm n hn
  have hF:f '' B∈𝓝 (1:K):=by
    have eq:Filter.map f (𝓝 1)=𝓝 (1:K):=by simpa [f] using df.map_nhds_eq hn
    rw [←eq];exact Filter.image_mem_map hB
  obtain ⟨a,ha,hba⟩:=Metric.mem_nhds_iff.mp hB
  obtain ⟨b,hb,hfb⟩:=Metric.mem_nhds_iff.mp hF
  have hp:=norm_pos_iff.mpr hn
  obtain ⟨r,hr,hr'⟩:=NormedField.exists_norm_lt K (lt_min hc (lt_min ha (div_pos hb hp)))
  have hrc:=lt_of_lt_of_le hr' (min_le_left _ _)
  have ht:=lt_of_lt_of_le hr' (min_le_right _ _)
  have hra:=lt_of_lt_of_le ht (min_le_left _ _)
  have hrb:=lt_of_lt_of_le ht (min_le_right _ _)
  have hlin(x:K)(hx:‖x-1‖≤‖r‖):x∈B:=hba (by simpa only [Metric.mem_ball,dist_eq_norm] using hx.trans_lt hra)
  refine ⟨r,hr,hrc,hlin,Set.Subset.antisymm ?_ ?_⟩
  · rintro _ ⟨x,hx,rfl⟩
    change ‖x^n-1‖≤_
    rw [hlin x hx]
    exact mul_le_mul_of_nonneg_left hx hp.le
  · intro y hy
    change ‖y-1‖≤‖(n:K)‖*‖r‖ at hy
    have hyt:‖y-1‖<b:=hy.trans_lt (by simpa only [mul_comm] using (lt_div_iff₀ hp).mp hrb)
    obtain ⟨x,hx,hfx⟩:=hfb (by simpa only [Metric.mem_ball,dist_eq_norm] using hyt)
    refine ⟨x,?_,hfx⟩
    change ‖x-1‖≤‖r‖
    change x^n=y at hfx
    change ‖x^n-1‖=‖(n:K)‖*‖x-1‖ at hx
    rw [←hfx,hx] at hy
    exact (mul_le_mul_iff_right₀ hp).mp hy
end TunnellPowerBall

namespace TunnellIndexAtIdentity
theorem factor {G:Type} [CommGroup G] (f:G→*G) (H:Subgroup G)
    (he:H.map f≤H) (hk:Disjoint H f.ker) (hH:H.index≠0) :
    f.range.index=(H.map f).relIndex H * Nat.card f.ker := by
  have hq:H.relIndex (H⊔f.ker)=Nat.card f.ker:=by
    rw [Subgroup.relIndex_sup_left,←Subgroup.inf_relIndex_right,hk.eq_bot,Subgroup.relIndex_bot_left]
  have hN : (H⊔f.ker).index≠0:=fun h=>hH (by
    rw [←Subgroup.relIndex_mul_index (show H≤H⊔f.ker from le_sup_left),h,mul_zero])
  have hr:=Subgroup.relIndex_mul_index he
  rw [Subgroup.index_map,←Subgroup.relIndex_mul_index (show H≤H⊔f.ker from le_sup_left),hq] at hr
  exact Nat.eq_of_mul_eq_mul_left (Nat.pos_of_ne_zero hN) (by simpa only [Nat.mul_assoc,Nat.mul_left_comm,Nat.mul_comm] using hr.symm)
end TunnellIndexAtIdentity

namespace TunnellUnitCongruence
open IsLocalRing
noncomputable section
variable {R:Type} [CommRing R] [IsDomain R]
def B (r:R):Subgroup Rˣ:=(Units.map (Ideal.Quotient.mk (Ideal.span {r})).toMonoidHom).ker
theorem mem (r:R) (x:Rˣ): x∈B r ↔ ∃ a:R,x.val=1+r*a := by
  change Units.map (Ideal.Quotient.mk (Ideal.span {r})).toMonoidHom x=1 ↔ _
  rw [Units.ext_iff]
  change Ideal.Quotient.mk (Ideal.span {r}) x.val=1 ↔ _
  rw [←map_one (Ideal.Quotient.mk (Ideal.span {r})),Ideal.Quotient.eq,Ideal.mem_span_singleton]
  constructor
  · rintro ⟨a,ha⟩;exact ⟨a,by linear_combination ha⟩
  · rintro ⟨a,ha⟩;exact ⟨a,by linear_combination ha⟩
theorem index (r n:R) (hr:r≠0) (hd:n∣r) (hu:∀ x:R,IsUnit (1+r*x)):
    (B (n*r)).relIndex (B r)=Nat.card (R⧸Ideal.span {n}) := by
  let c (x:B r):R:=Classical.choose ((mem r x.val).mp x.property)
  have hc(x:B r):x.val.val=1+r*c x:=Classical.choose_spec ((mem r x.val).mp x.property)
  have hmul(x y:B r): c (x*y)=c x+c y+r*c x*c y:=by
    apply mul_left_cancel₀ hr
    have h:(x.val.val*y.val.val)=1+r*c (x*y):=hc (x*y)
    rw [hc x,hc y] at h
    linear_combination -h
  have hone:c 1=0:=by
    apply mul_left_cancel₀ hr
    have h:1=1+r*c 1:=hc 1
    linear_combination -h
  let I:Ideal R:=Ideal.span {n}
  let F:B r→*Multiplicative (R⧸I):={
    toFun:=fun x=>Multiplicative.ofAdd (Ideal.Quotient.mk I (c x))
    map_one':=by change Ideal.Quotient.mk I (c 1)=0;rw [hone,map_zero]
    map_mul':=fun x y=>by
      change Ideal.Quotient.mk I (c (x*y))=Ideal.Quotient.mk I (c x)+Ideal.Quotient.mk I (c y)
      have hz:Ideal.Quotient.mk I r=0:=Ideal.Quotient.eq_zero_iff_mem.mpr (Ideal.mem_span_singleton.mpr hd)
      simp [hmul,hz] }
  have sur:Function.Surjective F:=by
    intro y
    obtain ⟨a,ha⟩:=Ideal.Quotient.mk_surjective y.toAdd
    let u: Rˣ:=(hu a).unit
    let z:B r:=⟨u,(mem r u).mpr ⟨a,(hu a).unit_spec⟩⟩
    have eq:c z=a:=by
      apply mul_left_cancel₀ hr
      have q:=hc z
      change u.val=1+r*c z at q
      rw [(hu a).unit_spec] at q
      linear_combination -q
    refine ⟨z,?_⟩
    change Ideal.Quotient.mk I (c z)=y.toAdd
    rwa [eq]
  have ker:F.ker=(B (n*r)).subgroupOf (B r):=by
    ext x
    change Ideal.Quotient.mk I (c x)=0 ↔ x.val∈B (n*r)
    rw [Ideal.Quotient.eq_zero_iff_mem,Ideal.mem_span_singleton,mem]
    constructor
    · rintro ⟨a,ha⟩
      exact ⟨a,by rw [hc,ha];ring⟩
    · rintro ⟨a,ha⟩
      refine ⟨a,mul_left_cancel₀ hr ?_⟩
      rw [hc] at ha
      linear_combination ha
  rw [Subgroup.relIndex,←ker,Subgroup.index_ker,F.range_eq_top.mpr sur,Nat.card_congr (Subgroup.topEquiv.toEquiv)]
  rfl
end
end TunnellUnitCongruence

namespace TunnellUnitPowerIndex
open TunnellUnitCongruence
open scoped Classical
noncomputable section
variable {K:Type} [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
variable (O:ValuationSubring K) (ball:∀ x:K,x∈O↔‖x‖≤1)
include ball
theorem unit_of_norm (x:K) (h:‖x‖=1) : ∃ a:Oˣ,(a.val:K)=x := by
  have hx:x≠0:=by rintro rfl;simpa using h
  have hxI:x⁻¹∈O:=(ball _).mpr (by simp [h])
  let u:Oˣ:={val:=⟨x,(ball _).mpr h.le⟩,inv:=⟨x⁻¹,hxI⟩,val_inv:=Subtype.ext (mul_inv_cancel₀ hx),inv_val:=Subtype.ext (inv_mul_cancel₀ hx)}
  exact ⟨u,rfl⟩
theorem unit_near (x:K) (h:‖x-1‖<1) : ∃ a:Oˣ,(a.val:K)=x := by
  apply unit_of_norm O ball
  have d:‖x-1‖<‖(1:K)‖:=by simpa using h
  simpa [max_eq_right h.le] using IsUltrametricDist.norm_add_eq_max_of_norm_ne_norm (x:=x-1) (y:=(1:K)) d.ne
theorem mem_ball (r:O) (hr:(r:K)≠0) (u:Oˣ):
    u∈B r ↔ ‖(u.val:K)-1‖≤‖(r:K)‖ := by
  rw [mem]
  constructor
  · rintro ⟨a,ha⟩
    have h : (u.val:K)=1+(r:K)*(a:K):=congrArg Subtype.val ha
    rw [h,add_sub_cancel_left,norm_mul]
    exact (mul_le_of_le_one_right (norm_nonneg _) ((ball _).mp a.property))
  · intro h
    have hi:((u.val:K)-1)/(r:K) ∈ O:=(ball _).mpr (by rwa [norm_div,div_le_one (norm_pos_iff.mpr hr)])
    refine ⟨⟨_,hi⟩,Subtype.ext ?_⟩
    change (u.val:K)=1+r*(((u.val:K)-1)/(r:K))
    field_simp;ring

theorem calculate (n:ℕ) (hn:(n:K)≠0) (finiteQ:∀ r:O,r≠0→Finite (O⧸Ideal.span {r})) :
    (powMonoidHom n:Oˣ→*Oˣ).range.index=
      Nat.card (O⧸Ideal.span {(n:O)})*Nat.card (powMonoidHom n:Oˣ→*Oˣ).ker := by
  have hnorm:=norm_pos_iff.mpr hn
  obtain ⟨r,hr,hr',linear,image⟩:=TunnellPowerBall.small_image n hn (min 1 ‖(n:K)‖) (lt_min one_pos hnorm)
  let t:O:=⟨r,(ball r).mpr ((lt_min_iff.mp hr').1.le)⟩
  have rt:(t:K)≠0:=norm_pos_iff.mp hr
  have nt:((n:O)*(t:O):O)≠0:=mul_ne_zero (by intro h;exact hn (congrArg Subtype.val h)) (fun h=>rt (congrArg Subtype.val h))
  have ntr:(((n:O)*t:O):K)≠0:=fun h=>nt (Subtype.ext h)
  let f:Oˣ→*Oˣ:=powMonoidHom n
  let H:=B t
  have hd:(n:O)∣t:=by
    have hx:r/(n:K)∈O:=(ball _).mpr (by rw [norm_div,div_le_one hnorm];exact (lt_min_iff.mp hr').2.le)
    refine ⟨⟨_,hx⟩,Subtype.ext ?_⟩
    change r=(n:K)*(r/(n:K))
    field_simp
  have hu(a:O):IsUnit (1+t*a):=by
    have h:‖(1+r*(a:K))-1‖<1:=by
      rw [add_sub_cancel_left,norm_mul]
      exact (mul_le_of_le_one_right hr.le ((ball _).mp a.property)).trans_lt (lt_min_iff.mp hr').1
    obtain ⟨u,eq⟩:=unit_near O ball _ h
    exact ⟨u,Subtype.ext eq⟩
  have hmap:H.map f=B ((n:O)*t):=by
    ext u
    rw [mem_ball O ball _ ntr]
    have lim : ‖(((n:O)*t:O):K)‖=‖(n:K)‖*‖r‖:=norm_mul _ _
    rw [lim]
    constructor
    · rintro ⟨a,ha,rfl⟩
      have ha':‖(a.val:K)-1‖≤‖r‖:=(mem_ball O ball t rt a).mp ha
      change ‖(a.val:K)^n-1‖≤_
      rw [linear _ ha']
      exact mul_le_mul_of_nonneg_left ha' hnorm.le
    · intro h
      have hmem:(u.val:K)∈(fun x:K=>x^n) '' {x|‖x-1‖≤‖r‖}:=by rw [image];exact h
      obtain ⟨x,hx,hxpow⟩:=hmem
      obtain ⟨a,ha⟩:=unit_near O ball x (lt_of_le_of_lt hx (lt_min_iff.mp hr').1)
      exact ⟨a,(mem_ball O ball t rt a).mpr (ha ▸ hx),Units.ext (Subtype.ext (by change (a.val:K)^n=(u.val:K);rwa [ha]))⟩
  have he:H.map f≤H:=by
    rintro _ ⟨x,hx,rfl⟩
    exact H.pow_mem hx n
  have hk:Disjoint H f.ker:=by
    rw [Subgroup.disjoint_def]
    intro a ha hf
    have ha':‖(a.val:K)-1‖≤‖r‖:=(mem_ball O ball t rt a).mp ha
    have e:(a.val:K)^n=1:=congrArg (fun y:Oˣ=>(y.val:K)) hf
    have eq:=linear (a.val:K) ha'
    rw [e,sub_self,norm_zero] at eq
    exact Units.ext (Subtype.ext (sub_eq_zero.mp (norm_eq_zero.mp ((mul_eq_zero.mp eq.symm).resolve_left (ne_of_gt hnorm)))))
  haveI : Finite (O⧸Ideal.span {t}):=finiteQ t (fun h=>rt (congrArg Subtype.val h))
  have hH:H.index≠0:=by
    change (Units.map (Ideal.Quotient.mk (Ideal.span {t})).toMonoidHom).ker.index≠0
    rw [Subgroup.index_ker];exact Nat.card_pos.ne'
  rw [TunnellIndexAtIdentity.factor f H he hk hH,hmap]
  exact congrArg (·*Nat.card f.ker) (TunnellUnitCongruence.index t (n:O) (fun h=>rt (congrArg Subtype.val h)) hd hu)
end
end TunnellUnitPowerIndex

namespace TunnellCompletedPower
open NumberField IsDedekindDomain LocalFieldTheory IsLocalRing
open scoped NumberField Classical WithZero
noncomputable section
variable {K:Type} [Field K] [NumberField K]
abbrev V:=HeightOneSpectrum (𝓞 K)
abbrev W(v:V (K:=K)):=v.adicCompletion K
abbrev O(v:V (K:=K)):=v.adicCompletionIntegers K
theorem split (v:V (K:=K)) : Nonempty ((W v)ˣ ≃* (O v)ˣ × Multiplicative ℤ) := by
  obtain ⟨π,hπ⟩:=IsDiscreteValuationRing.exists_irreducible (O v)
  let z:(W v)ˣ:=Units.mk0 (π:W v) (fun h=>hπ.ne_zero (Subtype.ext h))
  let j:=Units.map (algebraMap (O v) (W v)).toMonoidHom
  let f:(O v)ˣ × Multiplicative ℤ →* (W v)ˣ:={
    toFun:=fun x=>j x.1*z^x.2.toAdd
    map_one':=by simp
    map_mul':=by rintro ⟨a,k⟩ ⟨b,l⟩;simp [zpow_add];ac_rfl }
  refine ⟨(MulEquiv.ofBijective f ⟨?_,?_⟩).symm⟩
  · apply (injective_iff_map_eq_one f).mpr
    rintro ⟨u,k⟩ hu
    have h : (u.val:W v)*(π:W v)^k.toAdd=1:=by
      have eq:=congrArg Units.val hu
      simpa [f,j,z,Units.val_zpow_eq_zpow_val] using eq
    have hπval: Valued.v (π:W v)=WithZero.exp (-1):=v.valued_irreducible_adicCompletionIntegers (K:=K) hπ
    have huval:Valued.v (u.val:W v)=1:=(Valuation.valuationSubring.integers (v:=(Valued.v:Valuation (W v) ℤᵐ⁰))).valuation_unit u
    have hv:=congrArg (Valued.v:Valuation (W v) ℤᵐ⁰) h
    simp only [map_mul,map_zpow₀,huval,map_one,one_mul] at hv
    have hneq:Valued.v (π:W v)≠1:=by rw [hπval];decide
    have hk:k=1:=Multiplicative.toAdd.injective ((zpow_eq_one_iff_right₀ zero_le hneq).mp hv)
    subst k
    have h₁:(u.val:W v)=1:=by simpa using h
    exact Prod.ext (Units.ext (Subtype.ext h₁)) rfl
  · intro x
    obtain ⟨n,u,h⟩:=IsDiscreteValuationRing.exists_units_eq_smul_zpow_of_irreducible hπ x.ne_zero
    refine ⟨(u,Multiplicative.ofAdd n),Units.ext ?_⟩
    simpa [f,j,z,Units.val_zpow_eq_zpow_val,Units.smul_def,Algebra.smul_def] using h.symm

theorem res (v:V (K:=K)): Nat.card (IsLocalRing.ResidueField (O v))=Ideal.absNorm v.asIdeal:=
  Nat.card_congr (v.residueFieldEquivAdicCompletionIntegers (K:=K)).toEquiv.symm
theorem quot (v:V (K:=K)) (n:ℕ) (hn:n≠0):
    Nat.card (O v ⧸ Ideal.span {(n:O v)})=Ideal.absNorm (v.maxPowDividing (Ideal.span {(n:𝓞 K)})):=by
  let a:𝓞 K:=n
  have ha:a≠0:=Nat.cast_ne_zero.mpr hn
  let k:ℕ:=(Associates.mk v.asIdeal).count (Associates.mk (Ideal.span {a})).factors
  have hv:Valued.v (n:W v)=WithZero.exp (-(k:ℤ)):=by
    have eq:=v.valuedAdicCompletion_eq_valuation (K:=K) a
    rw [v.valuation_of_algebraMap,v.intValuation_if_neg ha] at eq
    simpa [a] using eq
  have he:Ideal.span {(n:O v)}=IsLocalRing.maximalIdeal (O v)^k:=
    v.span_singleton_eq_maximalIdeal_pow hv
  rw [he,←Submodule.cardQuot_apply,cardQuot_pow_of_prime (P:=IsLocalRing.maximalIdeal (O v)) ((IsDiscreteValuationRing.maximalIdeal (O v)).ne_bot),Submodule.cardQuot_apply]
  change Nat.card (IsLocalRing.ResidueField (O v))^k=_
  rw [res]
  change Ideal.absNorm v.asIdeal^k=Ideal.absNorm (v.asIdeal^k)
  rw [map_pow]
theorem finiteQuot (v:V (K:=K)) (r:O v) (hr:r≠0):Finite (O v⧸Ideal.span {r}) := by
  obtain ⟨π,hπ⟩:=IsDiscreteValuationRing.exists_irreducible (O v)
  obtain ⟨i,u,eq⟩:=IsDiscreteValuationRing.eq_unit_mul_pow_irreducible hr hπ
  have he:Ideal.span {r}=IsLocalRing.maximalIdeal (O v)^i:=by
    rw [eq,Ideal.span_singleton_eq_span_singleton.mpr (associated_unit_mul_left _ _ u.isUnit),←Ideal.span_singleton_pow,hπ.maximalIdeal_eq]
  apply Nat.finite_of_card_ne_zero
  rw [he,←Submodule.cardQuot_apply,cardQuot_pow_of_prime (P:=IsLocalRing.maximalIdeal (O v)) ((IsDiscreteValuationRing.maximalIdeal (O v)).ne_bot),Submodule.cardQuot_apply]
  change Nat.card (IsLocalRing.ResidueField (O v))^i≠0
  rw [res]
  exact pow_ne_zero _ (Ideal.absNorm_ne_zero_of_nonZeroDivisors ⟨v.asIdeal,mem_nonZeroDivisors_of_ne_zero v.ne_bot⟩)
end
end TunnellCompletedPower

/-! Counting the cyclic radical in the localization kernel. S-unit and normalized local-unit declarations are adapted from ClassFieldTheory at revision 2e6280f9d2579705a0cc6c76ec68c2b60f9c601a, https://github.com/n-yamaguchi-0729/ClassFieldTheory. -/
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

/- ClassFieldTheory.AlgebraicNumberTheory.RayClass.Basic -/
section
open scoped NumberField
open NumberField IsDedekindDomain
noncomputable section
variable {K : Type*} [Field K] [NumberField K]
namespace RayClass
 

abbrev FiniteModulus (K : Type*) [Field K] [NumberField K] :=
  HeightOneSpectrum (𝓞 K) →₀ ℕ
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
end Modulus
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
 
abbrev ApproximationPlace (m : Modulus K) :=
  (↥m.finitePart.support) ⊕ InfinitePlace K
 
abbrev approximationAbsoluteValue (m : Modulus K) :
    ApproximationPlace m → AbsoluteValue K ℝ
  | Sum.inl v => NumberField.HeightOneSpectrum.adicAbv K v.1
  | Sum.inr w => w.1
 
abbrev approximationCompletion (m : Modulus K) :
    ApproximationPlace m → Type _
  | Sum.inl v => v.1.adicCompletion K
  | Sum.inr w => w.Completion
 

def unitRatioSet
    {F : Type*} [Field F] (a : Fˣ) (U : Subgroup Fˣ) :
    Set F :=
  Units.val '' (fun y : Fˣ => a * y⁻¹) ⁻¹' (U : Set Fˣ)
end RayClass
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.RayClass.Approximation -/
section
open scoped NumberField Classical
open NumberField IsDedekindDomain
noncomputable section
variable {K : Type*} [Field K] [NumberField K]
namespace IdeleGroup
 


def openLocalCosetTarget
    (m : RayClass.Modulus K) (a : IdeleGroup K)
    (U : ∀ v : ↥m.finitePart.support,
      Subgroup (v.1.adicCompletion K)ˣ) :
    ∀ i : RayClass.ApproximationPlace m,
      Set (RayClass.approximationCompletion m i)
  | Sum.inl v => RayClass.unitRatioSet (a.2 v.1) (U v)
  | Sum.inr w =>
      RayClass.unitRatioSet
        (ContinuousMulEquiv.piUnits a.1 w) ⊤
 

def openAllLocalCosetTarget
    (m : RayClass.Modulus K) (a : IdeleGroup K)
    (U : ∀ v : ↥m.finitePart.support,
      Subgroup (v.1.adicCompletion K)ˣ)
    (V : ∀ w : InfinitePlace K,
      Subgroup w.Completionˣ) :
    ∀ i : RayClass.ApproximationPlace m,
      Set (RayClass.approximationCompletion m i)
  | Sum.inl v => RayClass.unitRatioSet (a.2 v.1) (U v)
  | Sum.inr w =>
      RayClass.unitRatioSet
        (IdeleGroup.infiniteComponent w a) (V w)
 

def principalLocalQuotientMap
    (S : Finset (HeightOneSpectrum (𝓞 K)))
    (U : ∀ v : ↥S, Subgroup (v.1.adicCompletion K)ˣ) :
    Kˣ →* (∀ v : ↥S, (v.1.adicCompletion K)ˣ ⧸ U v) :=
  MonoidHom.pi fun v =>
    (QuotientGroup.mk' (U v)).comp
      ((finiteComponent v.1).comp (principalIdele K))
end IdeleGroup
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

/- ClassFieldTheory.AlgebraicNumberTheory.Idele.Cohomology.SupportedBridge -/
section
open scoped Classical NumberField TensorProduct
open NumberField IsDedekindDomain
noncomputable section
variable
    {K L : Type}
    [Field K] [NumberField K]
    [Field L] [NumberField L] [Algebra K L]
    [FiniteDimensional K L] [IsGalois K L]
 

theorem principalIdele_mem_supportedAt_iff_sUnit
    (T : Finset (HeightOneSpectrum (𝓞 L)))
    (x : Lˣ) :
    IdeleGroup.principalIdele L x ∈
        IdeleGroup.supportedAt (K := L) (T : Set _) ↔
      x ∈ SUnitGroup (K := L) T := by
  rw [IdeleGroup.mem_supportedAt_iff, mem_SUnitGroup_iff]
  constructor
  · intro hx W hW
    have hunit := hx W (by simpa using hW)
    rw [
      HeightOneSpectrum.adicCompletionIntegers.mem_units_iff_valued_eq_one]
        at hunit
    change
      Valued.v
          (((IdeleGroup.finiteComponent W
            (IdeleGroup.principalIdele L x) :
              (W.adicCompletion L)ˣ) :
            W.adicCompletion L)) = 1 at hunit
    rw [IdeleGroup.finiteComponent_principalIdele,
      HeightOneSpectrum.valuedAdicCompletion_eq_valuation'] at hunit
    exact hunit
  · intro hx W hW
    rw [
      HeightOneSpectrum.adicCompletionIntegers.mem_units_iff_valued_eq_one]
    change
      Valued.v
          (((IdeleGroup.finiteComponent W
            (IdeleGroup.principalIdele L x) :
              (W.adicCompletion L)ˣ) :
            W.adicCompletion L)) = 1
    rw [IdeleGroup.finiteComponent_principalIdele,
      HeightOneSpectrum.valuedAdicCompletion_eq_valuation']
    exact hx W (by simpa using hW)
end
end

/- ValuedFieldTheory.LocalField.GroupTheory.PowerIndex -/
section
noncomputable section
namespace LocalFieldTheory
open LocalFieldTheory.DiscreteValuationField
open scoped Int
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
end KummerTheory
end
end

/- ClassFieldTheory.KummerTheory.Concrete.SUnitPreparation.SUnitLocalPowerKernel -/
section
open scoped NumberField Classical IsMulCommutative NNReal ValuativeRel
open NumberField IsDedekindDomain
open LocalFieldTheory
noncomputable section
namespace KummerTheory
variable {K : Type*} [Field K]
    [numberFieldK : NumberField K]
 

noncomputable def sUnitLocalPowerMap
    (n : ℕ+)
    (S T : Finset (HeightOneSpectrum (𝓞 K))) :
    SUnitGroup (K := K) S →*
      ∀ v : T,
        ((v : HeightOneSpectrum (𝓞 K)).adicCompletion K)ˣ ⧸
          (powMonoidHom (n : ℕ) :
            ((v : HeightOneSpectrum (𝓞 K)).adicCompletion K)ˣ →*
              ((v : HeightOneSpectrum (𝓞 K)).adicCompletion K)ˣ).range :=
  (IdeleGroup.principalLocalQuotientMap
      (K := K) T
      (fun v =>
        (powMonoidHom (n : ℕ) :
          (v.1.adicCompletion K)ˣ →*
            (v.1.adicCompletion K)ˣ).range)).comp
    (SUnitGroup (K := K) S).subtype
 

def sUnitLocalPowerKernel
    (n : ℕ+)
    (S T : Finset (HeightOneSpectrum (𝓞 K))) :
    Subgroup (SUnitGroup (K := K) S) :=
  MonoidHom.ker (sUnitLocalPowerMap (K := K) n S T)
 
theorem mem_sUnitLocalPowerKernel_iff
    (n : ℕ+)
    (S T : Finset (HeightOneSpectrum (𝓞 K)))
    (x : SUnitGroup (K := K) S) :
    x ∈ sUnitLocalPowerKernel (K := K) n S T ↔
      ∀ v : T,
        Units.map
            (algebraMap K
              ((v : HeightOneSpectrum (𝓞 K)).adicCompletion K)).toMonoidHom
            (x : Kˣ) ∈
          (powMonoidHom (n : ℕ) :
            ((v : HeightOneSpectrum (𝓞 K)).adicCompletion K)ˣ →*
              ((v : HeightOneSpectrum (𝓞 K)).adicCompletion K)ˣ).range := by
  rw [sUnitLocalPowerKernel, MonoidHom.mem_ker]
  constructor
  · intro hx v
    have hv := congrFun hx v
    rw [Pi.one_apply] at hv
    exact (QuotientGroup.eq_one_iff _).mp hv
  · intro hx
    funext v
    exact (QuotientGroup.eq_one_iff _).mpr (hx v)
end KummerTheory
end
end

/- ClassFieldTheory.GlobalClassFieldTheory.ClassFieldAxiom.SUnitLocalPowerMap -/
section
open scoped NumberField Classical NNReal IsMulCommutative
open NumberField IsDedekindDomain
open KummerTheory
open LocalFieldTheory
noncomputable section
namespace GlobalClassFieldTheory.ClassFieldAxiom
variable {K : Type} [Field K] [NumberField K]
 


def sUnitLocalUnitPowerMap
    (n : ℕ+)
    (S T : Finset (HeightOneSpectrum (𝓞 K)))
    (hST : Disjoint S T) :
    SUnitGroup (K := K) S →*
      ∀ v : T,
        (v.1.adicCompletionIntegers K)ˣ ⧸
          (powMonoidHom (n : ℕ) :
            (v.1.adicCompletionIntegers K)ˣ →*
              (v.1.adicCompletionIntegers K)ˣ).range :=
  MonoidHom.pi fun v =>
    let localPrincipal :
        SUnitGroup (K := K) S →* (v.1.adicCompletion K)ˣ :=
      ((IdeleGroup.finiteComponent v.1).comp
        (IdeleGroup.principalIdele K)).comp
          (SUnitGroup (K := K) S).subtype
    let localPrincipalUnit :
        SUnitGroup (K := K) S →*
          (v.1.adicCompletionIntegers K).units :=
      localPrincipal.codRestrict
        (v.1.adicCompletionIntegers K).units
        (fun x => by
          have hvS : v.1 ∉ S := by
            intro hvS
            exact (Finset.disjoint_left.mp hST) hvS v.2
          rw [
            HeightOneSpectrum.adicCompletionIntegers.mem_units_iff_valued_eq_one]
          change
            Valued.v
                (((IdeleGroup.finiteComponent v.1
                    (IdeleGroup.principalIdele K (x : Kˣ)) :
                      (v.1.adicCompletion K)ˣ) :
                  v.1.adicCompletion K)) =
              1
          rw [IdeleGroup.finiteComponent_principalIdele,
            HeightOneSpectrum.valuedAdicCompletion_eq_valuation']
          exact
            (mem_SUnitGroup_iff (K := K) S x).mp
              x.2 v.1 hvS)
    (QuotientGroup.mk'
        (powMonoidHom (n : ℕ) :
          (v.1.adicCompletionIntegers K)ˣ →*
            (v.1.adicCompletionIntegers K)ˣ).range).comp
      ((v.1.adicCompletionIntegers K).toSubmonoid.unitsEquivUnitsType.toMonoidHom.comp
        localPrincipalUnit)
 

theorem mem_powMonoidHom_range_adicCompletionIntegers_iff
    (v : HeightOneSpectrum (𝓞 K))
    (n : ℕ+)
    (x : (v.adicCompletionIntegers K)ˣ) :
    x ∈ (powMonoidHom (n : ℕ) :
          (v.adicCompletionIntegers K)ˣ →*
            (v.adicCompletionIntegers K)ˣ).range ↔
      Units.map
          (algebraMap (v.adicCompletionIntegers K)
            (v.adicCompletion K)).toMonoidHom x ∈
        (powMonoidHom (n : ℕ) :
          (v.adicCompletion K)ˣ →*
            (v.adicCompletion K)ˣ).range := by
  constructor
  · intro hx
    obtain ⟨y, hy⟩ :=
      (MonoidHom.mem_range
        (G := (v.adicCompletionIntegers K)ˣ)).mp hx
    apply
      (MonoidHom.mem_range
        (G := (v.adicCompletion K)ˣ)).mpr
    refine ⟨Units.map
      (algebraMap (v.adicCompletionIntegers K)
        (v.adicCompletion K)).toMonoidHom y, ?_⟩
    rw [powMonoidHom_apply] at hy ⊢
    rw [← map_pow, hy]
  · intro hx
    obtain ⟨y, hy⟩ :=
      (MonoidHom.mem_range
        (G := (v.adicCompletion K)ˣ)).mp hx
    rw [powMonoidHom_apply] at hy
    have hxVal :
        Valued.v
            (((Units.map
              (algebraMap (v.adicCompletionIntegers K)
                (v.adicCompletion K)).toMonoidHom x :
                  (v.adicCompletion K)ˣ) :
                v.adicCompletion K)) =
          1 :=
      (HeightOneSpectrum.adicCompletionIntegers.isUnit_iff_valued_eq_one
        (K := K) (v := v)).mp x.isUnit
    have hyValPow :
        Valued.v (((y ^ (n : ℕ) : (v.adicCompletion K)ˣ) :
          v.adicCompletion K)) = 1 := by
      rw [hy]
      exact hxVal
    have hyValPow' :
        Valued.v ((y : (v.adicCompletion K)ˣ) :
            v.adicCompletion K) ^ (n : ℕ) = 1 := by
      rw [Units.val_pow_eq_pow_val] at hyValPow
      rw [map_pow] at hyValPow
      exact hyValPow
    have hyVal :
        Valued.v ((y : (v.adicCompletion K)ˣ) :
            v.adicCompletion K) = 1 :=
      (pow_left_injective
        (M := WithZero (Multiplicative ℤ))
        (n := (n : ℕ)) n.ne_zero)
          (by simpa only [one_pow] using hyValPow')
    let yO : v.adicCompletionIntegers K :=
      ⟨(y : v.adicCompletion K), hyVal.le⟩
    have hyOUnit : IsUnit yO :=
      Valuation.Integers.isUnit_of_one'
        (HeightOneSpectrum.adicCompletionIntegers.integers K v) (by
          change
            Valued.v ((y : (v.adicCompletion K)ˣ) :
              v.adicCompletion K) = 1
          exact hyVal)
    obtain ⟨z, hz⟩ := hyOUnit
    have hzField :
        Units.map
            (algebraMap (v.adicCompletionIntegers K)
              (v.adicCompletion K)).toMonoidHom z =
          y := by
      apply Units.ext
      change ((z : v.adicCompletionIntegers K) :
        v.adicCompletion K) = (y : v.adicCompletion K)
      rw [hz]
    apply
      (MonoidHom.mem_range
        (G := (v.adicCompletionIntegers K)ˣ)).mpr
    refine ⟨z, ?_⟩
    rw [powMonoidHom_apply]
    apply Units.map_injective
      (f := (algebraMap (v.adicCompletionIntegers K)
        (v.adicCompletion K)).toMonoidHom)
      (FaithfulSMul.algebraMap_injective
        (v.adicCompletionIntegers K)
        (v.adicCompletion K))
    rw [map_pow, hzField, hy]
 

theorem sUnitLocalUnitPowerMap_ker
    (n : ℕ+)
    (S T : Finset (HeightOneSpectrum (𝓞 K)))
    (hST : Disjoint S T) :
    (sUnitLocalUnitPowerMap (K := K) n S T hST).ker =
      sUnitLocalPowerKernel (K := K) n S T := by
  ext x
  let localUnit (v : T) :
      (v.1.adicCompletionIntegers K)ˣ :=
    (v.1.adicCompletionIntegers K).toSubmonoid.unitsEquivUnitsType
      ⟨IdeleGroup.finiteComponent v.1
          (IdeleGroup.principalIdele K (x : Kˣ)), by
        have hvS : v.1 ∉ S := by
          intro hvS
          exact (Finset.disjoint_left.mp hST) hvS v.2
        rw [
          HeightOneSpectrum.adicCompletionIntegers.mem_units_iff_valued_eq_one]
        rw [IdeleGroup.finiteComponent_principalIdele,
          HeightOneSpectrum.valuedAdicCompletion_eq_valuation']
        exact
          (mem_SUnitGroup_iff (K := K) S x).mp
            x.2 v.1 hvS⟩
  have localUnit_toField (v : T) :
      Units.map
          (algebraMap (v.1.adicCompletionIntegers K)
            (v.1.adicCompletion K)).toMonoidHom (localUnit v) =
        Units.map
          (algebraMap K (v.1.adicCompletion K)).toMonoidHom
          (x : Kˣ) := by
    apply Units.ext
    rfl
  rw [mem_sUnitLocalPowerKernel_iff, MonoidHom.mem_ker]
  constructor
  · intro hx v
    have hv := congrFun hx v
    rw [Pi.one_apply] at hv
    change QuotientGroup.mk' _ (localUnit v) = 1 at hv
    have hvInteger :=
      (QuotientGroup.eq_one_iff (localUnit v)).mp hv
    have hvField :=
      (mem_powMonoidHom_range_adicCompletionIntegers_iff
        v.1 n (localUnit v)).mp hvInteger
    rw [localUnit_toField v] at hvField
    exact hvField
  · intro hx
    funext v
    rw [Pi.one_apply]
    change QuotientGroup.mk' _ (localUnit v) = 1
    apply (QuotientGroup.eq_one_iff (localUnit v)).mpr
    apply
      (mem_powMonoidHom_range_adicCompletionIntegers_iff
        v.1 n (localUnit v)).mpr
    rw [localUnit_toField v]
    exact hx v
end GlobalClassFieldTheory.ClassFieldAxiom
end
end

namespace TunnellKummerSupportGroups
open NumberField IsDedekindDomain
open scoped NumberField
variable (K:Type) [Field K] [NumberField K]
abbrev V:=HeightOneSpectrum (𝓞 K)
theorem powers_mem {W:Type} [Field W] (n:ℕ+) (x:Wˣ):
     x∈(powMonoidHom (n:ℕ):Wˣ→*Wˣ).range ↔ ∃ y:W,y^(n:ℕ)=x.val:=by
   constructor
   · rintro ⟨u,rfl⟩;exact ⟨u.val,rfl⟩
   · rintro ⟨y,hy⟩
     have h:y≠0:=by rintro rfl;rw [zero_pow n.ne_zero] at hy;exact x.ne_zero hy.symm
     exact ⟨Units.mk0 y h,Units.ext hy⟩
end TunnellKummerSupportGroups

namespace TunnellPrimeLocalUnits
open NumberField IsDedekindDomain LocalFieldTheory IsLocalRing TunnellCompletedPower
open scoped NumberField Classical WithZero
noncomputable section
variable {K:Type} [Field K] [NumberField K]
theorem card (n:ℕ) (hn:n.Prime) (hmu:(primitiveRoots n K).Nonempty) (v:HeightOneSpectrum (𝓞 K))
    (hdiv:¬v.asIdeal∣Ideal.span {(n:𝓞 K)}) :
    Nat.card ((O v)ˣ ⧸ (powMonoidHom n:(O v)ˣ→*(O v)ˣ).range) = n := by
  letI : NeZero n:=⟨hn.ne_zero⟩
  letI : CharZero (W v):=charZero_of_injective_algebraMap (algebraMap K (W v)).injective
  letI : NontriviallyNormedField (W v):=Valued.toNontriviallyNormedField (W v) ℤᵐ⁰
  letI : IsUltrametricDist (W v):=by infer_instance
  have ball(x:W v): x∈O v ↔ ‖x‖≤1:=by
    change (Valued.v:Valuation (W v) ℤᵐ⁰) x≤1 ↔ _
    exact (Valued.toNormedField.norm_le_one_iff (x:=x)).symm
  obtain ⟨ζ,hζ⟩:=hmu
  have hroot: IsPrimitiveRoot (algebraMap K (W v) ζ) n:=((mem_primitiveRoots hn.pos).mp hζ).map_of_injective (algebraMap K (W v)).injective
  have hz:‖algebraMap K (W v) ζ‖=1:=by
    have h:=congrArg norm hroot.pow_eq_one
    rw [norm_pow,norm_one] at h
    exact (pow_eq_one_iff_of_nonneg (norm_nonneg _) hn.ne_zero).mp h
  let t:O v:=⟨_,(ball _).mpr hz.le⟩
  have ht:IsPrimitiveRoot t n:=by
    exact IsPrimitiveRoot.of_map_of_injective (f:=(O v).subtype) (ζ:=t) hroot (O v).subtype_injective
  have hk:Nat.card (powMonoidHom n:(O v)ˣ→*(O v)ˣ).ker=n:=by
    rw [powMonoidHom_ker_units_eq_rootsOfUnity]
    exact ht.card_rootsOfUnity
  have co:=TunnellUnitPowerIndex.calculate (O v) ball n (Nat.cast_ne_zero.mpr hn.ne_zero) (finiteQuot v)
  have hval : v.valuation K ((n:𝓞 K):K)=1 := by
    apply le_antisymm (v.valuation_le_one (n:𝓞 K)) (not_lt.mp ?_)
    exact fun h=>hdiv ((HeightOneSpectrum.valuation_lt_one_iff_dvd (K:=K) v (n:𝓞 K)).mp h)
  have hu : IsUnit (n:O v) := by
    rw [HeightOneSpectrum.adicCompletionIntegers.isUnit_iff_valued_eq_one]
    have h := (v.valuedAdicCompletion_eq_valuation (K:=K) (n:𝓞 K)).trans hval
    simpa using h
  have ht:Ideal.span {(n:O v)}=⊤:=Ideal.span_singleton_eq_top.mpr hu
  rw [hk,ht] at co
  simpa [Subgroup.index_eq_card] using co
end
end TunnellPrimeLocalUnits

namespace TunnellCyclicRadicalCard
open scoped Classical
noncomputable section
theorem bound (D N:Type) [Field D] [Field N] [Algebra D N] [FiniteDimensional D N]
    [IsGalois D N] [IsCyclic Gal(N/D)] (p:ℕ) (hp:0<p) (U:Subgroup Dˣ)
    (sat:∀ a:Dˣ,a^p∈U → a∈U) (H:Subgroup U)
    (lift:∀ x:H,∃ z:Nˣ,z^p=Units.map (algebraMap D N).toMonoidHom x.val.val) :
    (powMonoidHom p:U→*U).range.relIndex H≤p := by
  letI : NeZero p:=⟨hp.ne'⟩
  let P:=(powMonoidHom p:U→*U).range
  let Q:=H ⧸ P.subgroupOf H
  choose r hr using (QuotientGroup.mk'_surjective (P.subgroupOf H))
  obtain ⟨g,hg⟩:=IsCyclic.exists_generator (α:=Gal(N/D))
  let j:=Units.map (algebraMap D N).toMonoidHom
  let a:=Units.map g.toRingHom.toMonoidHom
  choose z hz using fun q:Q=>lift (r q)
  let c (q:Q):Nˣ:=a (z q)/z q
  have cha (q:Q) : c q∈rootsOfUnity p N := by
    rw [mem_rootsOfUnity]
    dsimp only [c]
    rw [div_pow,←map_pow,hz]
    have hb (x:Dˣ):a (j x)=j x:=Units.ext (g.commutes x.val)
    rw [show Units.map (algebraMap D N).toMonoidHom _=j _ from rfl,hb,div_self']
  let f (q:Q) : rootsOfUnity p N:=⟨c q,cha q⟩
  have injective:Function.Injective f := by
    intro q r' h
    have eq:c q=c r':=congrArg Subtype.val h
    let t:=z q/z r'
    have gfix:a t=t := by
      rw [show t=z q/z r' from rfl,map_div]
      exact div_eq_div_iff_div_eq_div.mp eq
    have hmem:g∈MulAction.stabilizer Gal(N/D) (t:N):=congrArg Units.val gfix
    obtain ⟨b,hb⟩:= (IsGalois.mem_range_algebraMap_iff_fixed (F:=D) (t:N)).mpr fun σ=>
      (show Subgroup.zpowers g ≤ MulAction.stabilizer Gal(N/D) (t:N) from Subgroup.zpowers_le_of_mem hmem) (hg σ)
    have bne:b≠0:=by
      intro h
      apply t.ne_zero
      rw [←hb,h,map_zero]
    let b':Dˣ:=Units.mk0 b bne
    have ht:j b'=t:=Units.ext hb
    have hpow:b'^p=(r q).val.val/(r r').val.val:=by
      apply Units.map_injective (algebraMap D N).injective
      change j (b'^p)=j (_/_)
      rw [map_pow,ht,map_div,show t=z q/z r' from rfl,div_pow,hz,hz]
    have bU : b'∈U := sat b' (hpow ▸ U.div_mem (r q).val.property (r r').val.property)
    have hm:r q/r r'∈P.subgroupOf H:=by
      change (r q).val/(r r').val∈P
      exact ⟨⟨b',bU⟩,Subtype.ext hpow⟩
    rw [←hr q,←hr r']
    exact QuotientGroup.eq_iff_div_mem.mpr hm
  exact (Nat.card_le_card_of_injective f injective).trans (card_rootsOfUnity (R:=N) (k:=p))
end
end TunnellCyclicRadicalCard

namespace TunnellAuxiliaryResidues
open NumberField IsDedekindDomain IdeleGroup TunnellKummerSupportGroups
open GlobalClassFieldTheory.ClassFieldAxiom
open scoped NumberField Classical
noncomputable section
variable {D:Type} [Field D] [NumberField D]
  {S T:Finset (V D)} (hd:Disjoint S T)
def residueUnit (x:(S:Set (V D)).unit D) (v:T) : (v.val.adicCompletionIntegers D)ˣ :=
  (v.val.adicCompletionIntegers D).toSubmonoid.unitsEquivUnitsType
    ⟨finiteComponent v.val (principalIdele D x.val), by
      have hs := (principalIdele_mem_supportedAt_iff_sUnit S x.val).mpr x.property
      exact (IdeleGroup.mem_supportedAt_iff (K:=D) (S:Set (V D)) _).mp hs v.val (fun h=>(Finset.disjoint_left.mp hd h v.property).elim)⟩
def Approx (p:ℕ) (S T:Finset (V D)) : Prop :=
  ∀ u:(∀ v:T,(v.val.adicCompletionIntegers D)ˣ),∃ x:(S:Set (V D)).unit D,∀ v:T,
    ∃ y:(v.val.adicCompletionIntegers D)ˣ, ((y.val.val:v.val.adicCompletion D)^p)*(x.val.val:v.val.adicCompletion D)=(u v).val.val

theorem quotient (n:ℕ+) : Function.Surjective (sUnitLocalUnitPowerMap (K:=D) n S T hd) ↔ Approx (D:=D) n S T := by
  let P (v:T):=(powMonoidHom (n:ℕ):(v.val.adicCompletionIntegers D)ˣ→*(v.val.adicCompletionIntegers D)ˣ).range
  have eval (x:(S:Set (V D)).unit D) (v:T) :
      sUnitLocalUnitPowerMap n S T hd x v = QuotientGroup.mk' (P v) (residueUnit hd x v) := rfl
  constructor
  · intro sur u
    obtain ⟨x,hx⟩:=sur (fun v=>QuotientGroup.mk' (P v) (u v))
    refine ⟨x,fun v=>?_⟩
    have eq := (eval x v).symm.trans (congrFun hx v)
    obtain ⟨y,hy⟩:=QuotientGroup.eq_iff_div_mem.mp eq.symm
    have hg:y^(n:ℕ)*residueUnit hd x v=u v := (eq_div_iff_mul_eq').mp hy
    exact ⟨y,congrArg (fun z:(v.val.adicCompletionIntegers D)ˣ=>z.val.val) hg⟩
  · intro app u
    choose a ha using fun v=>QuotientGroup.mk'_surjective (P v) (u v)
    obtain ⟨x,hx⟩:=app a
    refine ⟨x,funext fun v=>?_⟩
    rw [eval,←ha v]
    symm
    apply QuotientGroup.eq_iff_div_mem.mpr
    obtain ⟨y,hy⟩:=hx v
    refine ⟨y,(eq_div_iff_mul_eq').mpr ?_⟩
    exact Units.ext (Subtype.ext hy)
end
end TunnellAuxiliaryResidues

namespace TunnellAuxiliaryKernelCount
open NumberField IsDedekindDomain IdeleGroup TunnellKummerSupportGroups
open KummerTheory GlobalClassFieldTheory.ClassFieldAxiom
open scoped NumberField Classical IsMulCommutative
noncomputable section
private theorem onto_of_card {U X:Type} [CommGroup U] [CommGroup X] [Finite X]
    (f:U→*X) (P:Subgroup U) (p k:ℕ) (hp:0<p) (hP:P≤f.ker)
    (bound:P.relIndex f.ker≤p) (index:P.index=p^(k+1)) (card:Nat.card X=p^k) :
    Function.Surjective f := by
  have ineq:p^k ≤ f.ker.index:=by
    apply Nat.le_of_mul_le_mul_left _ hp
    calc
      p*(p^k) = P.index := by rw [index,pow_succ,Nat.mul_comm]
      _ = P.relIndex f.ker*f.ker.index := (Subgroup.relIndex_mul_index hP).symm
      _ ≤ _ := Nat.mul_le_mul_right _ bound
  have hr:Nat.card f.range=f.ker.index:=(Nat.card_congr (QuotientGroup.quotientKerEquivRange f).toEquiv).symm
  apply MonoidHom.range_eq_top.mp
  apply Subgroup.eq_top_of_card_eq
  apply le_antisymm (Nat.card_le_card_of_injective _ f.range.subtype_injective)
  rwa [hr,card]

private theorem product_card {I:Type} [Fintype I] (X:I→Type) [∀i,Finite (X i)]
    (p:ℕ) (hp:∀i,Nat.card (X i)=p) : Nat.card (∀i,X i)=p^Fintype.card I := by
  rw [Nat.card_pi]
  simp only [hp,Finset.prod_const,Finset.card_univ]

set_option maxHeartbeats 1800000 in
theorem count : OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H3_R1_H1_R1_H3_R1_H2_R1_H1_R1.H2 := by
  intro D _ _ E _ _
  dsimp only
  intro hp hmu S T hd hcard hdiv roots
  let p:=Module.finrank D E
  let n:ℕ+:=⟨p,hp.pos⟩
  letI : Fact p.Prime:=⟨hp⟩
  letI : IsCyclic Gal(E/D):=isCyclic_of_prime_card (IsGalois.card_aut_eq_finrank D E)
  let U:=(S:Set (V D)).unit D
  let P:=(powMonoidHom p:U→*U).range
  let Target:=∀v:T,(v.val.adicCompletionIntegers D)ˣ ⧸ (powMonoidHom p:(v.val.adicCompletionIntegers D)ˣ→*(v.val.adicCompletionIntegers D)ˣ).range
  let X(v:T):=(v.val.adicCompletionIntegers D)ˣ ⧸ (powMonoidHom p:(v.val.adicCompletionIntegers D)ˣ→*(v.val.adicCompletionIntegers D)ˣ).range
  let f:U→*Target:=sUnitLocalUnitPowerMap n S T hd
  have kern:f.ker=sUnitLocalPowerKernel (K:=D) n S T:=sUnitLocalUnitPowerMap_ker n S T hd
  have sat (a:Dˣ) : a^p∈U → a∈U := mem_sUnitGroup_of_pow_mem (K:=D) S n a
  have hP:P≤f.ker:=by
    rintro x ⟨y,rfl⟩
    rw [kern]
    apply (mem_sUnitLocalPowerKernel_iff n S T _).mpr
    intro v
    refine ⟨Units.map (algebraMap D (v.val.adicCompletion D)).toMonoidHom y.val,?_⟩
    exact (map_pow _ _ _).symm
  have bound:P.relIndex f.ker≤p:=by
    apply TunnellCyclicRadicalCard.bound D E p hp.pos U sat f.ker
    intro x
    have hx:x.val∈sUnitLocalPowerKernel (K:=D) n S T:=kern ▸ x.property
    have hl:=(mem_sUnitLocalPowerKernel_iff n S T x.val).mp hx
    obtain ⟨z,hz⟩:=roots x.val fun v=>(powers_mem n _).mp (hl v)
    have hnz:z≠0:=by
      rintro rfl
      rw [zero_pow hp.ne_zero] at hz
      exact x.val.val.ne_zero ((algebraMap D E).injective (by rw [map_zero];exact hz.symm))
    exact ⟨Units.mk0 z hnz,Units.ext hz⟩
  have hcount:P.index=p^(Nat.card (InfinitePlace D)+S.card):=by
    have hc:=KummerTheory.card_sUnit_nthPowerQuotient (K:=D) S n hmu
    rw [Nat.card_eq_fintype_card (α:=InfinitePlace D)]
    exact hc
  have localCard (v:T) : Nat.card ((v.val.adicCompletionIntegers D)ˣ ⧸ (powMonoidHom p:(v.val.adicCompletionIntegers D)ˣ→*(v.val.adicCompletionIntegers D)ˣ).range)=p :=
    TunnellPrimeLocalUnits.card p hp hmu v.val (fun h=>Finset.disjoint_left.mp hd (hdiv _ h) v.property)
  haveI (v:T):Finite ((v.val.adicCompletionIntegers D)ˣ ⧸ (powMonoidHom p:(v.val.adicCompletionIntegers D)ˣ→*(v.val.adicCompletionIntegers D)ˣ).range):=Nat.finite_of_card_ne_zero ((localCard v).trans_ne hp.ne_zero)
  have targetCard:Nat.card Target=p^T.card:=by
    simpa only [Fintype.card_coe] using product_card (fun v:T=>(v.val.adicCompletionIntegers D)ˣ ⧸ (powMonoidHom p:(v.val.adicCompletionIntegers D)ˣ→*(v.val.adicCompletionIntegers D)ˣ).range) p localCard
  have index:P.index=p^(T.card+1):=by rw [hcard,hcount]
  letI : Finite Target:=Nat.finite_of_card_ne_zero (targetCard.trans_ne (pow_ne_zero _ hp.ne_zero))
  let commX (v:T):CommGroup (X v):=QuotientGroup.Quotient.commGroup _
  let commPi:CommGroup Target:=@Pi.commGroup _ X commX
  have sur := @onto_of_card U Target (Subgroup.toCommGroup U) commPi ‹Finite Target› f P p T.card hp.pos hP bound index targetCard
  exact (TunnellAuxiliaryResidues.quotient hd n).mp sur
end
end TunnellAuxiliaryKernelCount

theorem OMA.solution : OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H3_R1_H1_R1_H3_R1_H2_R1_H1_R1.H2 := TunnellAuxiliaryKernelCount.count
