import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H3_R1_H1_R1
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
theorem result (n:ℕ) (hn:n.Prime) (hmu:(primitiveRoots n K).Nonempty) (v:V (K:=K)):
    (powMonoidHom n:(W v)ˣ→*(W v)ˣ).range.index=n*(n*Ideal.absNorm (v.maxPowDividing (Ideal.span {(n:𝓞 K)}))) := by
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
  rw [hk,quot v n hn.ne_zero,mul_comm] at co
  haveI :=finiteQuot v (n:O v) (fun eq=> (Nat.cast_ne_zero.mpr hn.ne_zero : (n:W v)≠0) (congrArg Subtype.val eq))
  haveI : Finite ((O v)ˣ ⧸(powMonoidHom n:(O v)ˣ→*(O v)ˣ).range):=
    Nat.finite_of_card_ne_zero (by rw [←Subgroup.index_eq_card,co]; rw [←quot v n hn.ne_zero];exact Nat.mul_ne_zero hn.ne_zero Nat.card_pos.ne')
  obtain ⟨e⟩:=split v
  letI : NeZero n:=⟨hn.ne_zero⟩
  haveI:=finite_nthPowerQuotient_of_mulEquiv_units_prod_int (W v)ˣ (O v)ˣ e (n:=n)
  change Nat.card ((W v)ˣ ⧸ (powMonoidHom n:(W v)ˣ→*(W v)ˣ).range)=_
  rw [card_nthPowerQuotient_eq_mul_of_mulEquiv_units_prod_int (W v)ˣ (O v)ˣ hn.ne_zero e]
  exact congrArg (n * ·) co
end
end TunnellCompletedPower




/-! The supported idèle quotient is the product of the local power-class quotients. -/
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
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.RayClass.Basic -/
section
open scoped NumberField
open NumberField IsDedekindDomain
noncomputable section
variable {K : Type*} [Field K] [NumberField K]
namespace RayClass
 

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
 
def finiteIdeleOfFinset
    (S : Finset (HeightOneSpectrum (𝓞 K)))
    (a : ∀ v : ↥S, (v.1.adicCompletion K)ˣ) :
    FiniteIdeleGroup K := by
  let f : ∀ v : HeightOneSpectrum (𝓞 K),
      (v.adicCompletion K)ˣ :=
    fun v => if hv : v ∈ S then a ⟨v, hv⟩ else 1
  refine ⟨f, ?_⟩
  have haway :
      ∀ᶠ v : HeightOneSpectrum (𝓞 K) in Filter.cofinite,
        v ∉ S := by
    rw [Filter.eventually_cofinite]
    convert S.finite_toSet using 1
    ext v
    simp
  filter_upwards [haway] with v hv
  change f v ∈ (v.adicCompletionIntegers K).units
  simp [f, hv]
@[simp]
theorem finiteIdeleOfFinset_apply_mem
    (S : Finset (HeightOneSpectrum (𝓞 K)))
    (a : ∀ v : ↥S, (v.1.adicCompletion K)ˣ)
    (v : ↥S) :
    finiteIdeleOfFinset S a v.1 = a v := by
  classical
  change (if hv : v.1 ∈ S then a ⟨v.1, hv⟩ else 1) = a v
  exact dif_pos v.2
@[simp]
theorem finiteIdeleOfFinset_apply_notMem
    (S : Finset (HeightOneSpectrum (𝓞 K)))
    (a : ∀ v : ↥S, (v.1.adicCompletion K)ˣ)
    (v : HeightOneSpectrum (𝓞 K)) (hv : v ∉ S) :
    finiteIdeleOfFinset S a v = 1 := by
  classical
  change (if hmem : v ∈ S then a ⟨v, hmem⟩ else 1) =
    (1 : (v.adicCompletion K)ˣ)
  exact dif_neg hv
end IdeleGroup
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.Idele.NormApproximation.InfinitePlaces -/
section
open scoped NumberField TensorProduct
open NumberField IsDedekindDomain

noncomputable section

variable {K : Type} [Field K] [NumberField K]
omit [NumberField K] in
 


theorem exists_infinitePositiveSubgroup_nthRoot
    (v : InfinitePlace K)
    (n : ℕ) (hn : 0 < n)
    (x : v.Completionˣ)
    (hx : x ∈ RayClass.infinitePositiveSubgroup v) :
    ∃ y : v.Completionˣ, y ^ n = x := by
  by_cases hv : v.IsReal
  · let e : v.Completion ≃+* ℝ :=
      InfinitePlace.Completion.ringEquivRealOfIsReal hv
    let eu : v.Completionˣ ≃* ℝˣ :=
      Units.mapEquiv e.toMulEquiv
    have hxpos : 0 < ((eu x : ℝˣ) : ℝ) := by
      exact
        ((RayClass.mem_infinitePositiveSubgroup_iff v x).mp hx) hv
    let yr : ℝ :=
      ((eu x : ℝˣ) : ℝ) ^ ((n : ℝ)⁻¹)
    have hyrpow :
        yr ^ n = ((eu x : ℝˣ) : ℝ) := by
      exact Real.rpow_inv_natCast_pow hxpos.le hn.ne'
    have hyrne : yr ≠ 0 := by
      intro hyr
      rw [hyr, zero_pow hn.ne'] at hyrpow
      exact (eu x).ne_zero hyrpow.symm
    let yu : ℝˣ := Units.mk0 yr hyrne
    refine ⟨eu.symm yu, ?_⟩
    apply eu.injective
    simp only [map_pow, eu.apply_symm_apply]
    apply Units.ext
    exact hyrpow
  · have hvc : v.IsComplex :=
      InfinitePlace.not_isReal_iff_isComplex.mp hv
    let e : v.Completion ≃+* ℂ :=
      InfinitePlace.Completion.ringEquivComplexOfIsComplex hvc
    let eu : v.Completionˣ ≃* ℂˣ :=
      Units.mapEquiv e.toMulEquiv
    obtain ⟨z, hz⟩ :=
      IsAlgClosed.exists_pow_nat_eq
        ((eu x : ℂˣ) : ℂ) hn
    have hz0 : z ≠ 0 := by
      intro hzero
      rw [hzero, zero_pow hn.ne'] at hz
      exact (eu x).ne_zero hz.symm
    let zu : ℂˣ := Units.mk0 z hz0
    refine ⟨eu.symm zu, ?_⟩
    apply eu.injective
    simp only [map_pow, eu.apply_symm_apply]
    apply Units.ext
    exact hz
variable {L : Type} [Field L] [Algebra K L]
    [FiniteDimensional K L]
end
end

/- ClassFieldTheory.GlobalClassFieldTheory.ClassFieldAxiom.IdelePowerLocalUnitSubgroup -/
section
open scoped NumberField Classical NNReal IsMulCommutative
open NumberField IsDedekindDomain

noncomputable section
namespace GlobalClassFieldTheory.ClassFieldAxiom
variable {K : Type*} [Field K] [NumberField K]
 

def idelePowerLocalUnitSubgroup
    (n : ℕ+)
    (S T : Finset (HeightOneSpectrum (𝓞 K))) :
    Subgroup (IdeleGroup K) :=
  (⨅ w : InfinitePlace K,
      ((powMonoidHom (n : ℕ) :
        w.Completionˣ →* w.Completionˣ).range).comap
        (IdeleGroup.infiniteComponent w)) ⊓
    (⨅ v : HeightOneSpectrum (𝓞 K),
      ⨅ (_ : v ∈ S),
        (powMonoidHom (n : ℕ) :
          (v.adicCompletion K)ˣ →*
            (v.adicCompletion K)ˣ).range.comap
          (IdeleGroup.finiteComponent v)) ⊓
    (⨅ v : HeightOneSpectrum (𝓞 K),
      ⨅ (_ : v ∉ S ∪ T),
        (v.adicCompletionIntegers K).units.comap
          (IdeleGroup.finiteComponent v))
 
theorem mem_idelePowerLocalUnitSubgroup_iff
    (n : ℕ+)
    (S T : Finset (HeightOneSpectrum (𝓞 K)))
    (a : IdeleGroup K) :
    a ∈ idelePowerLocalUnitSubgroup (K := K) n S T ↔
      (∀ w : InfinitePlace K,
        IdeleGroup.infiniteComponent w a ∈
          (powMonoidHom (n : ℕ) :
            w.Completionˣ →* w.Completionˣ).range) ∧
      (∀ v : HeightOneSpectrum (𝓞 K), v ∈ S →
        IdeleGroup.finiteComponent v a ∈
          (powMonoidHom (n : ℕ) :
            (v.adicCompletion K)ˣ →*
              (v.adicCompletion K)ˣ).range) ∧
      (∀ v : HeightOneSpectrum (𝓞 K), v ∉ S ∪ T →
        IdeleGroup.finiteComponent v a ∈
          (v.adicCompletionIntegers K).units) := by
  simp only [idelePowerLocalUnitSubgroup, Subgroup.mem_inf,
    Subgroup.mem_iInf, Subgroup.mem_comap, and_assoc]
end GlobalClassFieldTheory.ClassFieldAxiom
end
end

/- ClassFieldTheory.GlobalClassFieldTheory.ClassFieldAxiom.IdeleClassPowerLocalUnitQuotient.ArchimedeanPowerIndex -/
section
open scoped NumberField Classical NNReal ValuativeRel TensorProduct
open NumberField IsDedekindDomain

noncomputable section
namespace GlobalClassFieldTheory.ClassFieldAxiom
variable {K : Type} [Field K] [NumberField K]
omit [NumberField K] in
 

theorem nthPowerSubgroup_le_infinitePositiveSubgroup
    (n : ℕ+)
    (w : InfinitePlace K)
    (harch : Even (n : ℕ) ∨ ¬ w.IsReal) :
    (powMonoidHom (n : ℕ) :
        w.Completionˣ →* w.Completionˣ).range ≤
      RayClass.infinitePositiveSubgroup w := by
  intro x hx
  obtain ⟨y, hy⟩ :=
    (MonoidHom.mem_range
      (G := w.Completionˣ)).mp hx
  rw [powMonoidHom_apply] at hy
  subst x
  rw [RayClass.mem_infinitePositiveSubgroup_iff]
  intro hw
  rcases harch with hnEven | hwNotReal
  · rcases hnEven with ⟨m, hm⟩
    let emb :=
      NumberField.InfinitePlace.Completion.extensionEmbeddingOfIsReal hw
    have hyne : emb (y : w.Completion) ≠ 0 := by
      intro hzero
      apply y.ne_zero
      apply emb.injective
      simp at hzero
    change 0 < emb (((y ^ (n : ℕ) : w.Completionˣ) : w.Completion))
    rw [Units.val_pow_eq_pow_val, map_pow, hm, pow_add, ← pow_two]
    exact sq_pos_of_ne_zero (pow_ne_zero m hyne)
  · exact False.elim (hwNotReal hw)
 
def realInfinitePlaceSignHom
    (w : InfinitePlace K)
    (hw : w.IsReal) :
    w.Completionˣ →* SignTypeˣ :=
  (Units.map
      (signHom : ℝ →*₀ SignType).toMonoidHom).comp
    (Units.mapEquiv
      (NumberField.InfinitePlace.Completion.ringEquivRealOfIsReal
        hw).toMulEquiv).toMonoidHom
omit [NumberField K] in
 

theorem realInfinitePlaceSignHom_ker
    (w : InfinitePlace K)
    (hw : w.IsReal) :
    (realInfinitePlaceSignHom w hw).ker =
      RayClass.infinitePositiveSubgroup w := by
  ext x
  change
    realInfinitePlaceSignHom w hw x = 1 ↔
      x ∈ RayClass.infinitePositiveSubgroup w
  rw [RayClass.mem_infinitePositiveSubgroup_iff]
  constructor
  · intro hx hw'
    have hxval := congrArg Units.val hx
    have hxsign :
        SignType.sign
          (NumberField.InfinitePlace.Completion.extensionEmbeddingOfIsReal
            hw (x : w.Completion)) =
          1 := by
      simpa [realInfinitePlaceSignHom] using hxval
    have hproof : hw' = hw := Subsingleton.elim _ _
    subst hproof
    exact sign_eq_one_iff.mp hxsign
  · intro hx
    have hxsign :
        SignType.sign
            (NumberField.InfinitePlace.Completion.extensionEmbeddingOfIsReal
              hw (x : w.Completion)) =
          1 :=
      sign_eq_one_iff.mpr (hx hw)
    apply Units.ext
    simpa [realInfinitePlaceSignHom] using hxsign
omit [NumberField K] in
 
theorem realInfinitePlaceSignHom_surjective
    (w : InfinitePlace K)
    (hw : w.IsReal) :
    Function.Surjective (realInfinitePlaceSignHom w hw) := by
  let eu : w.Completionˣ ≃* ℝˣ :=
    Units.mapEquiv
      (NumberField.InfinitePlace.Completion.ringEquivRealOfIsReal
        hw).toMulEquiv
  intro s
  cases hs : (s : SignType) with
  | zero =>
      exact False.elim (s.ne_zero hs)
  | neg =>
      refine ⟨eu.symm (-1), ?_⟩
      apply Units.ext
      simp [realInfinitePlaceSignHom, eu, hs]
  | pos =>
      refine ⟨eu.symm 1, ?_⟩
      apply Units.ext
      simp [realInfinitePlaceSignHom, eu, hs]
 

noncomputable def realInfinitePositiveQuotientEquivSign
    (w : InfinitePlace K)
    (hw : w.IsReal) :
    w.Completionˣ ⧸ RayClass.infinitePositiveSubgroup w ≃*
      SignTypeˣ := by
  rw [← realInfinitePlaceSignHom_ker w hw]
  exact
    QuotientGroup.quotientKerEquivOfSurjective
      (realInfinitePlaceSignHom w hw)
      (realInfinitePlaceSignHom_surjective w hw)
omit [NumberField K] in
 
theorem card_realInfinitePositiveQuotient
    (w : InfinitePlace K)
    (hw : w.IsReal) :
    Nat.card
        (w.Completionˣ ⧸
          RayClass.infinitePositiveSubgroup w) =
      2 := by
  calc
    Nat.card
        (w.Completionˣ ⧸
          RayClass.infinitePositiveSubgroup w) =
        Nat.card SignTypeˣ :=
      Nat.card_congr
        (realInfinitePositiveQuotientEquivSign w hw).toEquiv
    _ = 2 := by
      rw [Nat.card_eq_fintype_card]
      decide
omit [NumberField K] in
 

theorem nthPowerSubgroup_eq_infinitePositiveSubgroup
    (n : ℕ+)
    (w : InfinitePlace K)
    (harch : Even (n : ℕ) ∨ ¬ w.IsReal) :
    (powMonoidHom (n : ℕ) :
        w.Completionˣ →* w.Completionˣ).range =
      RayClass.infinitePositiveSubgroup w := by
  apply le_antisymm
  · exact
      nthPowerSubgroup_le_infinitePositiveSubgroup
        n w harch
  · intro x hx
    obtain ⟨y, hy⟩ :=
      _root_.exists_infinitePositiveSubgroup_nthRoot
        w (n : ℕ) n.pos x hx
    exact
      (MonoidHom.mem_range
        (G := w.Completionˣ)).mpr ⟨y, by
          rw [powMonoidHom_apply]
          exact hy⟩
omit [NumberField K] in
 
theorem nthPowerSubgroup_eq_top_of_real_odd
    (n : ℕ+)
    (w : InfinitePlace K)
    (hw : w.IsReal)
    (hn : Odd (n : ℕ)) :
    (powMonoidHom (n : ℕ) :
        w.Completionˣ →* w.Completionˣ).range =
      ⊤ := by
  apply top_unique
  intro x hx
  apply
    (MonoidHom.mem_range
      (G := w.Completionˣ)).mpr
  let emb :=
    NumberField.InfinitePlace.Completion.extensionEmbeddingOfIsReal hw
  have hx0 : emb (x : w.Completion) ≠ 0 := by
    intro hzero
    apply x.ne_zero
    simp at hzero
  by_cases hxpos : 0 < emb (x : w.Completion)
  · have hxPositive :
        x ∈ RayClass.infinitePositiveSubgroup w := by
      rw [RayClass.mem_infinitePositiveSubgroup_iff]
      intro hw'
      have hproof : hw' = hw := Subsingleton.elim _ _
      subst hproof
      exact hxpos
    obtain ⟨y, hy⟩ :=
      _root_.exists_infinitePositiveSubgroup_nthRoot
        w (n : ℕ) n.pos x hxPositive
    exact ⟨y, by
      rw [powMonoidHom_apply]
      exact hy⟩
  · have hxneg : emb (x : w.Completion) < 0 :=
      lt_of_le_of_ne (le_of_not_gt hxpos) hx0
    have hnegPositive :
        -x ∈ RayClass.infinitePositiveSubgroup w := by
      rw [RayClass.mem_infinitePositiveSubgroup_iff]
      intro hw'
      have hproof : hw' = hw := Subsingleton.elim _ _
      subst hproof
      change 0 < emb ((-x : w.Completionˣ) : w.Completion)
      simp [hxneg]
    obtain ⟨y, hy⟩ :=
      _root_.exists_infinitePositiveSubgroup_nthRoot
        w (n : ℕ) n.pos (-x) hnegPositive
    refine ⟨-y, ?_⟩
    rw [powMonoidHom_apply, hn.neg_pow, hy]
    simp
omit [NumberField K] in
 

theorem card_infinitePlace_nthPowerQuotient
    (n : ℕ+)
    (w : InfinitePlace K) :
    Nat.card
        (w.Completionˣ ⧸
          (powMonoidHom (n : ℕ) :
            w.Completionˣ →* w.Completionˣ).range) =
      if w.IsReal ∧ Even (n : ℕ) then 2 else 1 := by
  classical
  by_cases hw : w.IsReal
  · by_cases hn : Even (n : ℕ)
    · rw [
        nthPowerSubgroup_eq_infinitePositiveSubgroup
          n w (Or.inl hn)]
      simpa [hw, hn] using
        card_realInfinitePositiveQuotient w hw
    · have hodd : Odd (n : ℕ) :=
        (Nat.even_or_odd (n : ℕ)).resolve_left hn
      rw [nthPowerSubgroup_eq_top_of_real_odd n w hw hodd]
      let :
          Subsingleton
            (w.Completionˣ ⧸ (⊤ : Subgroup w.Completionˣ)) :=
        QuotientGroup.subsingleton_quotient_top
      simp [hw, hn]
  · have hpower :
        (powMonoidHom (n : ℕ) :
            w.Completionˣ →* w.Completionˣ).range =
          RayClass.infinitePositiveSubgroup w :=
      nthPowerSubgroup_eq_infinitePositiveSubgroup
        n w (Or.inr hw)
    have hpositive :
        RayClass.infinitePositiveSubgroup w = ⊤ := by
      ext x
      simp [RayClass.mem_infinitePositiveSubgroup_iff, hw]
    rw [hpower, hpositive]
    let :
        Subsingleton
          (w.Completionˣ ⧸ (⊤ : Subgroup w.Completionˣ)) :=
      QuotientGroup.subsingleton_quotient_top
    simp [hw]
end GlobalClassFieldTheory.ClassFieldAxiom
end
end

/- ClassFieldTheory.GlobalClassFieldTheory.ClassFieldAxiom.SupportedIdelePowerLocalUnitQuotient -/
section
open scoped NumberField Classical NNReal IsMulCommutative
open NumberField IsDedekindDomain

noncomputable section
namespace GlobalClassFieldTheory.ClassFieldAxiom
variable {K : Type*} [Field K] [NumberField K]
private noncomputable def quotientEquivOfSurjectiveWithKernel
    {G H : Type*} [Group G] [Group H]
    (f : G →* H)
    (N : Subgroup G) [N.Normal]
    (hf : Function.Surjective f)
    (hker : f.ker = N) :
    G ⧸ N ≃* H :=
  (QuotientGroup.quotientMulEquivOfEq hker.symm).trans
    (QuotientGroup.quotientKerEquivOfSurjective f hf)
 

def supportedIdelePowerLocalUnitSubgroup
    (n : ℕ+)
    (S T : Finset (HeightOneSpectrum (𝓞 K))) :
    Subgroup
      (IdeleGroup.supportedAt
        (K := K) (S ∪ T : Set (HeightOneSpectrum (𝓞 K)))) :=
  (idelePowerLocalUnitSubgroup (K := K) n S T).comap
    (IdeleGroup.supportedAt
      (K := K) (S ∪ T : Set (HeightOneSpectrum (𝓞 K)))).subtype
 


def supportedIdelePowerClassMap
    (n : ℕ+)
    (S T : Finset (HeightOneSpectrum (𝓞 K))) :
    IdeleGroup.supportedAt
        (K := K) (S ∪ T : Set (HeightOneSpectrum (𝓞 K))) →*
      ((
        ∀ w : InfinitePlace K,
          w.Completionˣ ⧸
            (powMonoidHom (n : ℕ) :
              w.Completionˣ →* w.Completionˣ).range) ×
        (∀ v : ↥S,
          (v.1.adicCompletion K)ˣ ⧸
            (powMonoidHom (n : ℕ) :
              (v.1.adicCompletion K)ˣ →*
                (v.1.adicCompletion K)ˣ).range)) where
  toFun a :=
    (fun w =>
      QuotientGroup.mk'
        (powMonoidHom (n : ℕ) :
          w.Completionˣ →* w.Completionˣ).range
        (IdeleGroup.infiniteComponent w a.1),
     fun v =>
      QuotientGroup.mk'
        (powMonoidHom (n : ℕ) :
          (v.1.adicCompletion K)ˣ →*
            (v.1.adicCompletion K)ˣ).range
        (IdeleGroup.finiteComponent v.1 a.1))
  map_one' := by
    apply Prod.ext
    · funext w
      apply (QuotientGroup.eq_one_iff _).mpr
      apply
        (MonoidHom.mem_range
          (G := w.Completionˣ)).mpr
      refine ⟨1, ?_⟩
      rw [powMonoidHom_apply, one_pow]
      exact (IdeleGroup.infiniteComponent w).map_one.symm
    · funext v
      simp
  map_mul' a b := by
    apply Prod.ext
    · funext w
      change
        QuotientGroup.mk'
            (powMonoidHom (n : ℕ) :
              w.Completionˣ →* w.Completionˣ).range
            (IdeleGroup.infiniteComponent w (a.1 * b.1)) =
          QuotientGroup.mk'
              (powMonoidHom (n : ℕ) :
                w.Completionˣ →* w.Completionˣ).range
              (IdeleGroup.infiniteComponent w a.1) *
            QuotientGroup.mk'
              (powMonoidHom (n : ℕ) :
                w.Completionˣ →* w.Completionˣ).range
              (IdeleGroup.infiniteComponent w b.1)
      rw [map_mul, map_mul]
    · funext v
      simp
 

theorem supportedIdelePowerClassMap_ker
    (n : ℕ+)
    (S T : Finset (HeightOneSpectrum (𝓞 K))) :
    (supportedIdelePowerClassMap (K := K) n S T).ker =
      supportedIdelePowerLocalUnitSubgroup (K := K) n S T := by
  ext a
  rw [MonoidHom.mem_ker]
  constructor
  · intro ha
    rw [supportedIdelePowerLocalUnitSubgroup,
      Subgroup.mem_comap,
      mem_idelePowerLocalUnitSubgroup_iff]
    refine ⟨?_, ?_, ?_⟩
    · intro w
      have hw := congrArg (fun q => q.1 w) ha
      rw [Prod.fst_one, Pi.one_apply] at hw
      exact (QuotientGroup.eq_one_iff _).mp hw
    · intro v hv
      let vS : ↥S := ⟨v, hv⟩
      have hvq := congrArg (fun q => q.2 vS) ha
      rw [Prod.snd_one, Pi.one_apply] at hvq
      exact (QuotientGroup.eq_one_iff _).mp hvq
    · intro v hv
      have hv' :
          v ∉ (S ∪ T : Set (HeightOneSpectrum (𝓞 K))) := by
        simpa using hv
      exact
        (IdeleGroup.mem_supportedAt_iff
          (K := K)
          (S ∪ T : Set (HeightOneSpectrum (𝓞 K))) a.1).mp
            a.2 v hv'
  · intro ha
    rw [supportedIdelePowerLocalUnitSubgroup,
      Subgroup.mem_comap,
      mem_idelePowerLocalUnitSubgroup_iff] at ha
    apply Prod.ext
    · funext w
      exact (QuotientGroup.eq_one_iff _).mpr (ha.1 w)
    · funext v
      exact (QuotientGroup.eq_one_iff _).mpr
        (ha.2.1 v.1 v.2)
 


theorem supportedIdelePowerClassMap_surjective
    (n : ℕ+)
    (S T : Finset (HeightOneSpectrum (𝓞 K))) :
    Function.Surjective
      (supportedIdelePowerClassMap (K := K) n S T) := by
  intro q
  choose aInf hInf using fun w : InfinitePlace K =>
    QuotientGroup.mk_surjective (q.1 w)
  choose aS hS using fun v : ↥S =>
    QuotientGroup.mk_surjective (q.2 v)
  let alpha : IdeleGroup K :=
    (ContinuousMulEquiv.piUnits.symm aInf,
      IdeleGroup.finiteIdeleOfFinset S aS)
  have hAlpha :
      alpha ∈
        IdeleGroup.supportedAt
          (K := K) (S ∪ T : Set (HeightOneSpectrum (𝓞 K))) := by
    rw [IdeleGroup.mem_supportedAt_iff]
    intro v hv
    have hvS : v ∉ S := by
      intro hvS
      apply hv
      exact Or.inl hvS
    change
      IdeleGroup.finiteIdeleOfFinset S aS v ∈
        (v.adicCompletionIntegers K).units
    rw [IdeleGroup.finiteIdeleOfFinset_apply_notMem S aS v hvS]
    exact Subgroup.one_mem _
  refine ⟨⟨alpha, hAlpha⟩, ?_⟩
  apply Prod.ext
  · funext w
    calc
      QuotientGroup.mk'
          (powMonoidHom (n : ℕ) :
            w.Completionˣ →* w.Completionˣ).range
          (IdeleGroup.infiniteComponent w alpha) =
          QuotientGroup.mk'
            (powMonoidHom (n : ℕ) :
              w.Completionˣ →* w.Completionˣ).range
            (aInf w) := by
        apply congrArg
        change
          ContinuousMulEquiv.piUnits
              (ContinuousMulEquiv.piUnits.symm aInf) w =
            aInf w
        exact congrFun
          (ContinuousMulEquiv.piUnits.apply_symm_apply aInf) w
      _ = q.1 w := hInf w
  · funext v
    calc
      QuotientGroup.mk'
          (powMonoidHom (n : ℕ) :
            (v.1.adicCompletion K)ˣ →*
              (v.1.adicCompletion K)ˣ).range
          (IdeleGroup.finiteComponent v.1 alpha) =
          QuotientGroup.mk'
            (powMonoidHom (n : ℕ) :
              (v.1.adicCompletion K)ˣ →*
                (v.1.adicCompletion K)ˣ).range
            (aS v) := by
        apply congrArg
        exact IdeleGroup.finiteIdeleOfFinset_apply_mem S aS v
      _ = q.2 v := hS v
 



noncomputable def supportedIdeleQuotientEquivLocalPowerClasses
    (n : ℕ+)
    (S T : Finset (HeightOneSpectrum (𝓞 K))) :
    IdeleGroup.supportedAt
          (K := K) (S ∪ T : Set (HeightOneSpectrum (𝓞 K))) ⧸
        supportedIdelePowerLocalUnitSubgroup (K := K) n S T ≃*
      ((
        ∀ w : InfinitePlace K,
          w.Completionˣ ⧸
            (powMonoidHom (n : ℕ) :
              w.Completionˣ →* w.Completionˣ).range) ×
        (∀ v : ↥S,
          (v.1.adicCompletion K)ˣ ⧸
            (powMonoidHom (n : ℕ) :
              (v.1.adicCompletion K)ˣ →*
                (v.1.adicCompletion K)ˣ).range)) :=
  quotientEquivOfSurjectiveWithKernel
    (H :=
      ((
        ∀ w : InfinitePlace K,
          w.Completionˣ ⧸
            (powMonoidHom (n : ℕ) :
              w.Completionˣ →* w.Completionˣ).range) ×
        (∀ v : ↥S,
          (v.1.adicCompletion K)ˣ ⧸
            (powMonoidHom (n : ℕ) :
              (v.1.adicCompletion K)ˣ →*
                (v.1.adicCompletion K)ˣ).range)))
    (supportedIdelePowerClassMap (K := K) n S T)
    (supportedIdelePowerLocalUnitSubgroup (K := K) n S T)
    (supportedIdelePowerClassMap_surjective (K := K) n S T)
    (supportedIdelePowerClassMap_ker (K := K) n S T)
 


theorem card_supportedIdeleQuotient_eq_localPowerClasses
    (n : ℕ+)
    (S T : Finset (HeightOneSpectrum (𝓞 K))) :
    Nat.card
        (IdeleGroup.supportedAt
              (K := K) (S ∪ T : Set (HeightOneSpectrum (𝓞 K))) ⧸
          supportedIdelePowerLocalUnitSubgroup (K := K) n S T) =
      Nat.card
        ((
          ∀ w : InfinitePlace K,
            w.Completionˣ ⧸
              (powMonoidHom (n : ℕ) :
                w.Completionˣ →* w.Completionˣ).range) ×
          (∀ v : ↥S,
            (v.1.adicCompletion K)ˣ ⧸
              (powMonoidHom (n : ℕ) :
                (v.1.adicCompletion K)ˣ →*
                  (v.1.adicCompletion K)ˣ).range)) :=
  Nat.card_congr
    (supportedIdeleQuotientEquivLocalPowerClasses
      (K := K) n S T).toEquiv
end GlobalClassFieldTheory.ClassFieldAxiom
end
end

namespace TunnellKummerSupportGroups
open NumberField IsDedekindDomain IdeleGroup GlobalClassFieldTheory.ClassFieldAxiom
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
theorem prescribed (n:ℕ+) (S T:Finset (V K)): U K n S T=(idelePowerLocalUnitSubgroup (K:=K) n S T).comap (e K).symm.toMonoidHom := by
  apply closure_of_carrier
  intro a
  change _ ↔ (e K).symm a∈idelePowerLocalUnitSubgroup n S T
  rw [mem_idelePowerLocalUnitSubgroup_iff,Set.mem_setOf_eq]
  apply and_congr (forall_congr' fun w=>(powers_mem n (infiniteComponent w ((e K).symm a))).symm)
  refine and_congr (forall_congr' fun v=>imp_congr_right fun _=>(powers_mem n (finiteComponent v ((e K).symm a))).symm) ?_
  exact forall_congr' fun v=>imp_congr_right fun _=>(units_mem (v.adicCompletionIntegers K) (finiteComponent v ((e K).symm a))).symm

theorem product (n:ℕ+) (S T:Finset (V K)):
    (U K n S T).relIndex (J K (S∪T))=
      (∏ w:InfinitePlace K,if w.IsReal ∧ Even (n:ℕ) then 2 else 1)*
      ∏ v:↥S,(powMonoidHom (n:ℕ):(v.val.adicCompletion K)ˣ→*(v.val.adicCompletion K)ˣ).range.index := by
  rw [prescribed,supported,Subgroup.relIndex_comap,Subgroup.map_comap_eq, MonoidHom.range_eq_top.mpr (e K).symm.surjective,top_inf_eq,Finset.coe_union]
  have eq:=card_supportedIdeleQuotient_eq_localPowerClasses (K:=K) n S T
  rw [Nat.card_prod,Nat.card_pi,Nat.card_pi] at eq
  rw [←Finset.prod_congr rfl (fun (w:InfinitePlace K) _=>card_infinitePlace_nthPowerQuotient (K:=K) n w)]
  exact eq
end
end TunnellKummerSupportGroups


namespace TunnellSupportedIndexEvaluation
open NumberField IsDedekindDomain
open scoped NumberField TensorProduct Classical
noncomputable section

variable {K:Type} [Field K] [NumberField K]
theorem prod_absNorm_maxPowDividing_natCast
    (n : ℕ+)
    (S : Finset (HeightOneSpectrum (𝓞 K)))
    (hS :
      ∀ v : HeightOneSpectrum (𝓞 K),
        v.asIdeal ∣ Ideal.span {((n : ℕ) : 𝓞 K)} →
          v ∈ S) :
    (∏ v : ↥S,
        Ideal.absNorm
          (v.1.maxPowDividing
            (Ideal.span {((n : ℕ) : 𝓞 K)}))) =
      (n : ℕ) ^ Module.finrank ℚ K := by
  classical
  let I : Ideal (𝓞 K) :=
    Ideal.span {((n : ℕ) : 𝓞 K)}
  have hI : I ≠ 0 := by
    simp [I, n.ne_zero]
  let f : HeightOneSpectrum (𝓞 K) → ℕ :=
    fun v => Ideal.absNorm (v.maxPowDividing I)
  have hsupport : Function.mulSupport f ⊆ (S : Set _) := by
    intro v hv
    apply hS v
    have hcount :
        (Associates.mk v.asIdeal).count
            (Associates.mk I).factors ≠ 0 := by
      intro hzero
      apply hv
      simp [f, IsDedekindDomain.HeightOneSpectrum.maxPowDividing,
        hzero]
    exact
      (Associates.count_ne_zero_iff_dvd
        hI v.irreducible).mp hcount
  have hmap :
      Ideal.absNorm
          (∏ᶠ v : HeightOneSpectrum (𝓞 K),
            v.maxPowDividing I) =
        ∏ᶠ v : HeightOneSpectrum (𝓞 K),
          Ideal.absNorm (v.maxPowDividing I) :=
    Ideal.absNorm.map_finprod
      (Ideal.hasFiniteMulSupport hI)
  calc
    (∏ v : ↥S,
        Ideal.absNorm
          (v.1.maxPowDividing
            (Ideal.span {((n : ℕ) : 𝓞 K)}))) =
        ∏ v ∈ S, f v := by
      simpa [f, I] using Finset.prod_coe_sort S f
    _ = ∏ᶠ v : HeightOneSpectrum (𝓞 K), f v :=
      (finprod_eq_prod_of_mulSupport_subset f hsupport).symm
    _ =
        Ideal.absNorm
          (∏ᶠ v : HeightOneSpectrum (𝓞 K),
            v.maxPowDividing I) := hmap.symm
    _ = Ideal.absNorm I := by
      rw [Ideal.finprod_heightOneSpectrum_factorization hI]
    _ = (n : ℕ) ^ Module.finrank ℚ K := by
      change
        Ideal.absNorm
            (Ideal.span {(((n : ℕ) : ℕ) : 𝓞 K)}) =
          (n : ℕ) ^ Module.finrank ℚ K
      rw [Ideal.absNorm_span_natCast,
        NumberField.RingOfIntegers.rank]


theorem prod_infinitePlace_nthPowerIndex
    (n : ℕ+) :
    (∏ w : InfinitePlace K,
        if w.IsReal ∧ Even (n : ℕ) then 2 else 1) =
      if Even (n : ℕ) then
        2 ^ InfinitePlace.nrRealPlaces K
      else 1 := by
  classical
  by_cases hn : Even (n : ℕ)
  · rw [if_pos hn]
    rw [InfinitePlace.prod_eq_prod_mul_prod]
    simp only [hn, and_true]
    have hr :
        (∏ w : {w : InfinitePlace K // w.IsReal},
            if w.1.IsReal then 2 else 1) =
          ∏ _w : {w : InfinitePlace K // w.IsReal}, 2 := by
      apply Finset.prod_congr rfl
      intro w _
      rw [if_pos w.2]
    have hc :
        (∏ w : {w : InfinitePlace K // w.IsComplex},
            if w.1.IsReal then 2 else 1) =
          ∏ _w : {w : InfinitePlace K // w.IsComplex}, 1 := by
      apply Finset.prod_congr rfl
      intro w _
      rw [if_neg
        (InfinitePlace.not_isReal_iff_isComplex.mpr w.2)]
    rw [hr, hc]
    simp [InfinitePlace.nrRealPlaces]
  · simp [hn]


theorem prod_infinitePlace_nthPowerIndex_mul_natDegree
    (n : ℕ+)
    (hmu : (primitiveRoots (n : ℕ) K).Nonempty) :
    (∏ w : InfinitePlace K,
        if w.IsReal ∧ Even (n : ℕ) then 2 else 1) *
        (n : ℕ) ^ Module.finrank ℚ K =
      (n : ℕ) ^
        (2 * Fintype.card (InfinitePlace K)) := by
  classical
  have harch :=
    prod_infinitePlace_nthPowerIndex (K := K) n
  obtain ⟨ζ, hζ⟩ := hmu
  have hζprim : IsPrimitiveRoot ζ (n : ℕ) :=
    (mem_primitiveRoots n.pos).mp hζ
  have hsignature :=
    InfinitePlace.card_add_two_mul_card_eq_rank K
  have hplaces :=
    InfinitePlace.card_eq_nrRealPlaces_add_nrComplexPlaces K
  by_cases hlarge : 2 < (n : ℕ)
  · have hreal :
        InfinitePlace.nrRealPlaces K = 0 :=
      InfinitePlace.IsPrimitiveRoot.nrRealPlaces_eq_zero_of_two_lt
        hlarge hζprim
    rw [hreal, zero_add] at hsignature hplaces
    have hdegree :
        Module.finrank ℚ K =
          2 * Fintype.card (InfinitePlace K) := by
      omega
    rw [harch, hreal, hdegree]
    simp
  · have hnle : (n : ℕ) ≤ 2 :=
      Nat.le_of_not_gt hlarge
    have hnpos : 0 < (n : ℕ) := n.pos
    have hone_or_two :
        (n : ℕ) = 1 ∨ (n : ℕ) = 2 := by
      omega
    rcases hone_or_two with hone | htwo
    · have hn : n = (1 : ℕ+) := Subtype.ext hone
      subst n
      rw [harch]
      simp
    · have hn : n = (2 : ℕ+) := Subtype.ext htwo
      subst n
      rw [harch]
      rw [if_pos (by decide :
        Even (((2 : ℕ+) : ℕ)))]
      change
        2 ^ InfinitePlace.nrRealPlaces K *
            2 ^ Module.finrank ℚ K =
          2 ^ (2 * Fintype.card (InfinitePlace K))
      rw [← pow_add]
      congr 1
      omega


theorem result : OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H3_R1_H1_R1.H1 := by
  intro K _ _ p hp hmu
  dsimp only
  intro S T hs
  change (TunnellKummerSupportGroups.U K p S T).relIndex (TunnellKummerSupportGroups.J K (S∪T))=_
  have groupEval:=TunnellKummerSupportGroups.product K ⟨p,hp.pos⟩ S T
  change (TunnellKummerSupportGroups.U K p S T).relIndex (TunnellKummerSupportGroups.J K (S∪T))= (∏ w:InfinitePlace K,if w.IsReal ∧ Even p then 2 else 1)*∏ v:↥S,(powMonoidHom p:(v.val.adicCompletion K)ˣ→*(v.val.adicCompletion K)ˣ).range.index at groupEval
  rw [groupEval]
  let n:ℕ+:=⟨p,hp.pos⟩
  have finiteNorm:(∏ v:↥S,Ideal.absNorm (v.val.maxPowDividing (Ideal.span {(p:𝓞 K)})))=p^Module.finrank ℚ K:=
    prod_absNorm_maxPowDividing_natCast (K:=K) n S hs
  have arch:(∏ w:InfinitePlace K,if w.IsReal ∧ Even p then 2 else 1)*p^Module.finrank ℚ K=p^(2*Fintype.card (InfinitePlace K)):=
    prod_infinitePlace_nthPowerIndex_mul_natDegree (K:=K) n hmu
  simp_rw [TunnellCompletedPower.result p hp hmu]
  simp_rw [←mul_assoc p p,←pow_two]
  rw [Finset.prod_mul_distrib,finiteNorm]
  simp only [Finset.prod_const,Finset.card_univ,Fintype.card_coe]
  rw [mul_left_comm,arch,←pow_mul,←pow_add,Nat.card_eq_fintype_card (α:=InfinitePlace K)]
  congr 1
  omega
end
end TunnellSupportedIndexEvaluation

theorem OMA.solution : OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H3_R1_H1_R1.H1 := TunnellSupportedIndexEvaluation.result
