import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1
import Mathlib

/- ClassFieldTheory.AlgebraicNumberTheory.Idele.SPlaces -/
section
open scoped NumberField RestrictedProduct
open NumberField IsDedekindDomain
noncomputable section
variable {K : Type*} [Field K] [NumberField K]
namespace FiniteIdeleGroup
end FiniteIdeleGroup
namespace IdeleGroup
end IdeleGroup
 

abbrev SUnitGroup
    (S : Finset (HeightOneSpectrum (𝓞 K))) :=
  (S : Set (HeightOneSpectrum (𝓞 K))).unit K
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
 

theorem adicAbv_eq_zpow_neg_divisorCoordinate
    (x : SUnitGroup (K := K) S) (v : S) :
    NumberField.HeightOneSpectrum.adicAbv K
        (v : HeightOneSpectrum (𝓞 K)) (((x : Kˣ) : K)) =
      (Ideal.absNorm
        (v : HeightOneSpectrum (𝓞 K)).asIdeal : ℝ) ^
          (-divisorCoordinate (K := K) S x v) := by
  rw [NumberField.HeightOneSpectrum.adicAbv_def,
    valuation_eq_exp_neg_count (K := K)]
  rw [WithZeroMulInt.toNNReal_neg_apply]
  · norm_cast
  · simp
 

theorem log_adicAbv_eq_neg_divisorCoordinate_mul_log_absNorm
    (x : SUnitGroup (K := K) S) (v : S) :
    Real.log
        (NumberField.HeightOneSpectrum.adicAbv K
          (v : HeightOneSpectrum (𝓞 K)) (((x : Kˣ) : K))) =
      -(divisorCoordinate (K := K) S x v : ℝ) *
        Real.log
          (Ideal.absNorm
            (v : HeightOneSpectrum (𝓞 K)).asIdeal : ℝ) := by
  rw [adicAbv_eq_zpow_neg_divisorCoordinate (K := K) S,
    Real.log_zpow]
  push_cast
  ring
 
noncomputable def reducedLogLinearMap :
    Additive (SUnitGroup (K := K) S) →ₗ[ℤ]
      ReducedLogSpace (K := K) S :=
  (reducedLog (K := K) S).toIntLinearMap
@[simp]
theorem reducedLog_fst_fromNumberFieldUnits
    (u : (𝓞 K)ˣ) :
    (reducedLog (K := K) S
      (Additive.ofMul
        (fromNumberFieldUnits (K := K) S u))).1 =
      NumberField.Units.logEmbedding K (Additive.ofMul u) := by
  ext w
  rfl
@[simp]
theorem reducedLog_snd_fromNumberFieldUnits
    (u : (𝓞 K)ˣ) :
    (reducedLog (K := K) S
      (Additive.ofMul
        (fromNumberFieldUnits (K := K) S u))).2 = 0 := by
  ext v
  change
    (divisorCoordinate (K := K) S
      (fromNumberFieldUnits (K := K) S u) v : ℝ) = 0
  norm_cast
  have hrange :
      fromNumberFieldUnitsLinearMap (K := K) S
          (Additive.ofMul u) ∈
        LinearMap.range
          (fromNumberFieldUnitsLinearMap (K := K) S) :=
    LinearMap.mem_range_self _ _
  rw [range_fromNumberFieldUnitsLinearMap_eq_ker_divisorLinearMap
    (K := K) S] at hrange
  have hzero :=
    congrFun
      (LinearMap.mem_ker.mp hrange) v
  simpa [divisorLinearMap, divisor,
    fromNumberFieldUnitsLinearMap] using hzero
 
theorem reducedLog_eq_zero_iff
    (x : Additive (SUnitGroup (K := K) S)) :
    reducedLog (K := K) S x = 0 ↔
      x ∈ AddCommGroup.torsion
        (Additive (SUnitGroup (K := K) S)) := by
  constructor
  · intro hx
    have hxdiv :
        x ∈ LinearMap.ker
          (divisorLinearMap (K := K) S) := by
      apply LinearMap.mem_ker.mpr
      ext v
      have hv := congrFun (congrArg Prod.snd hx) v
      simpa [reducedLog, divisorLinearMap, divisor] using
        (show
          (divisorCoordinate (K := K) S
            (Additive.toMul x) v : ℝ) = 0 from hv)
    rw [← range_fromNumberFieldUnitsLinearMap_eq_ker_divisorLinearMap
      (K := K) S] at hxdiv
    obtain ⟨u, hu⟩ := hxdiv
    have hxu :
        x =
          fromNumberFieldUnitsLinearMap (K := K) S u :=
      hu.symm
    have hlog :
        NumberField.Units.logEmbedding K u = 0 := by
      have hfst := congrArg Prod.fst hx
      rw [hxu] at hfst
      simpa [fromNumberFieldUnitsLinearMap] using hfst
    have hutors :
        Additive.toMul u ∈ NumberField.Units.torsion K := by
      exact
        NumberField.Units.dirichletUnitTheorem.logEmbedding_eq_zero_iff.mp
          hlog
    change
      Additive.toMul x ∈
        CommGroup.torsion (SUnitGroup (K := K) S)
    rw [torsion_eq_rootsOfUnity_range (K := K) S]
    refine ⟨Additive.toMul u, hutors, ?_⟩
    exact (congrArg Additive.toMul hxu).symm
  · intro hx
    change
      Additive.toMul x ∈
        CommGroup.torsion (SUnitGroup (K := K) S) at hx
    rw [torsion_eq_rootsOfUnity_range (K := K) S] at hx
    obtain ⟨u, hu, hux⟩ := hx
    have hxadd :
        x =
          Additive.ofMul
            (fromNumberFieldUnits (K := K) S u) := by
      apply Additive.toMul.injective
      exact hux.symm
    rw [hxadd]
    apply Prod.ext
    ·
      simpa using
        (NumberField.Units.dirichletUnitTheorem.logEmbedding_eq_zero_iff.mpr
          hu)
    ·
      exact reducedLog_snd_fromNumberFieldUnits
        (K := K) S u
 

theorem reducedLogLinearMap_ker :
    LinearMap.ker (reducedLogLinearMap (K := K) S) =
      (AddCommGroup.torsion
        (Additive (SUnitGroup (K := K) S))).toIntSubmodule := by
  ext x
  rw [LinearMap.mem_ker]
  exact reducedLog_eq_zero_iff (K := K) S x
 
noncomputable def reducedLogLattice :
    Submodule ℤ (ReducedLogSpace (K := K) S) :=
  LinearMap.range (reducedLogLinearMap (K := K) S)
 

theorem norm_reducedLog_finite_lt_one_implies_zero
    {x : Additive (SUnitGroup (K := K) S)}
    (hx :
      ‖reducedLog (K := K) S x‖ < 1) :
    (reducedLog (K := K) S x).2 = 0 := by
  ext v
  have hv :
      ‖(reducedLog (K := K) S x).2 v‖ < 1 := by
    exact
      (norm_le_pi_norm _ v).trans_lt
        ((norm_snd_le
          (reducedLog (K := K) S x)).trans_lt hx)
  change
    (divisorCoordinate (K := K) S
      (Additive.toMul x) v : ℝ) = 0
  change
    |(divisorCoordinate (K := K) S
      (Additive.toMul x) v : ℝ)| < 1 at hv
  rw [← Int.cast_abs, ← Int.cast_one, Int.cast_lt] at hv
  exact_mod_cast Int.abs_lt_one_iff.mp hv
 


instance instDiscreteTopology_reducedLogLattice :
    DiscreteTopology (reducedLogLattice (K := K) S) := by
  classical
  let :
      DiscreteTopology
        {x :
          NumberField.Units.dirichletUnitTheorem.logSpace K //
          x ∈ NumberField.Units.unitLattice K} := by
    infer_instance
  obtain ⟨ε, hεpos, hε⟩ :=
    Metric.exists_ball_inter_eq_singleton_of_mem_discrete
      (s := (NumberField.Units.unitLattice K :
        Set
          (NumberField.Units.dirichletUnitTheorem.logSpace K)))
      DiscreteTopology.isDiscrete
      (show
        (0 :
          NumberField.Units.dirichletUnitTheorem.logSpace K) ∈
        NumberField.Units.unitLattice K by simp)
  let δ : ℝ := min ε 1
  have hδpos : 0 < δ := lt_min hεpos zero_lt_one
  refine discreteTopology_iff_isOpen_singleton_zero.mpr
    ⟨Metric.ball 0 δ, Metric.isOpen_ball, ?_⟩
  ext z
  constructor
  · intro hz
    have hzlt : ‖(z : ReducedLogSpace (K := K) S)‖ < δ := by
      simpa [Metric.mem_ball, dist_eq_norm] using hz
    obtain ⟨x, hx⟩ := z.property
    have hxlog :
        reducedLog (K := K) S x =
          (z : ReducedLogSpace (K := K) S) := hx
    have hfin :
        (reducedLog (K := K) S x).2 = 0 := by
      apply norm_reducedLog_finite_lt_one_implies_zero
        (K := K) S
      rw [hxlog]
      exact hzlt.trans_le (min_le_right _ _)
    have hxdiv :
        x ∈ LinearMap.ker
          (divisorLinearMap (K := K) S) := by
      apply LinearMap.mem_ker.mpr
      ext v
      have hv := congrFun hfin v
      change
        divisorCoordinate (K := K) S
          (Additive.toMul x) v = 0
      have hvreal :
          (divisorCoordinate (K := K) S
            (Additive.toMul x) v : ℝ) = 0 := by
        simpa [reducedLog] using hv
      exact_mod_cast hvreal
    rw [← range_fromNumberFieldUnitsLinearMap_eq_ker_divisorLinearMap
      (K := K) S] at hxdiv
    obtain ⟨u, hu⟩ := hxdiv
    have hinf :
        NumberField.Units.logEmbedding K u =
          (z : ReducedLogSpace (K := K) S).1 := by
      rw [← hxlog, ← hu]
      simp [fromNumberFieldUnitsLinearMap]
    have hunitmem :
        NumberField.Units.logEmbedding K u ∈
          NumberField.Units.unitLattice K := by
      exact ⟨u, trivial, rfl⟩
    have hunitball :
        NumberField.Units.logEmbedding K u ∈
          Metric.ball 0 ε := by
      rw [Metric.mem_ball, dist_zero_right]
      rw [hinf]
      exact
        (norm_fst_le
          (z : ReducedLogSpace (K := K) S)).trans_lt
            (hzlt.trans_le (min_le_left _ _))
    have hunitzero :
        NumberField.Units.logEmbedding K u = 0 := by
      have :
          NumberField.Units.logEmbedding K u ∈
            Metric.ball 0 ε ∩
              (NumberField.Units.unitLattice K :
                Set
                  (NumberField.Units.dirichletUnitTheorem.logSpace K)) :=
        ⟨hunitball, hunitmem⟩
      rw [hε] at this
      exact this
    apply Subtype.ext
    rw [← hxlog]
    apply Prod.ext
    · rw [← hu]
      simpa [fromNumberFieldUnitsLinearMap] using hunitzero
    · exact hfin
  · intro hz
    have hz0 : z = 0 := by
      simpa using hz
    subst z
    simp [Metric.mem_ball, hδpos]
 

theorem finrank_reducedLogLattice :
    Module.finrank ℤ (reducedLogLattice (K := K) S) =
      NumberField.Units.rank K + S.card := by
  let f := reducedLogLinearMap (K := K) S
  calc
    Module.finrank ℤ (reducedLogLattice (K := K) S) =
        Module.finrank ℤ
          (Additive (SUnitGroup (K := K) S) ⧸
            LinearMap.ker f) :=
      f.quotKerEquivRange.symm.finrank_eq
    _ = Module.finrank ℤ
          (Additive (SUnitGroup (K := K) S) ⧸
            (AddCommGroup.torsion
              (Additive
                (SUnitGroup (K := K) S))).toIntSubmodule) := by
      rw [show LinearMap.ker f =
        (AddCommGroup.torsion
          (Additive
            (SUnitGroup (K := K) S))).toIntSubmodule from
          reducedLogLinearMap_ker (K := K) S]
    _ = Module.finrank ℤ
          (Additive (SUnitGroup (K := K) S)) := by
      exact finrank_quotient_torsion_eq
    _ = NumberField.Units.rank K + S.card :=
      finrank (K := K) S
 

theorem finrank_reducedLogSpace :
    Module.finrank ℝ (ReducedLogSpace (K := K) S) =
      NumberField.Units.rank K + S.card := by
  classical
  simp [NumberField.Units.rank]
 

theorem reducedLogLattice_span_eq_top :
    Submodule.span ℝ
      (reducedLogLattice (K := K) S :
        Set (ReducedLogSpace (K := K) S)) = ⊤ := by
  classical
  let :
      DiscreteTopology
        (Submodule.span ℤ
          (reducedLogLattice (K := K) S :
            Set (ReducedLogSpace (K := K) S))) := by
    rw [Submodule.span_eq]
    infer_instance
  apply Submodule.eq_top_of_finrank_eq
  change
    Set.finrank ℝ
      (reducedLogLattice (K := K) S :
        Set (ReducedLogSpace (K := K) S)) =
      Module.finrank ℝ (ReducedLogSpace (K := K) S)
  calc
    Set.finrank ℝ
        (reducedLogLattice (K := K) S :
          Set (ReducedLogSpace (K := K) S)) =
        Set.finrank ℤ
          (reducedLogLattice (K := K) S :
            Set (ReducedLogSpace (K := K) S)) :=
      Real.finrank_eq_int_finrank_of_discrete inferInstance
    _ = Module.finrank ℤ
          (reducedLogLattice (K := K) S) := by
      rw [Set.finrank, Submodule.span_eq]
    _ = NumberField.Units.rank K + S.card :=
      finrank_reducedLogLattice (K := K) S
    _ = Module.finrank ℝ
          (ReducedLogSpace (K := K) S) :=
      (finrank_reducedLogSpace (K := K) S).symm
 

instance instIsZLattice_reducedLogLattice :
    IsZLattice ℝ (reducedLogLattice (K := K) S) where
  span_top := reducedLogLattice_span_eq_top (K := K) S
section FullLogarithmicSpace
 

abbrev LogPlace :=
  NumberField.InfinitePlace K ⊕ S
 

abbrev FullLogSpace :=
  LogPlace (K := K) S → ℝ
 
noncomputable def coordinateSum :
    FullLogSpace (K := K) S →ₗ[ℝ] ℝ where
  toFun z := ∑ p, z p
  map_add' x y := by
    simp [Finset.sum_add_distrib]
  map_smul' c x := by
    change
      (∑ p : LogPlace (K := K) S, c * x p) =
        c * ∑ p : LogPlace (K := K) S, x p
    rw [Finset.mul_sum]
 

abbrev LogHyperplane :=
  LinearMap.ker (coordinateSum (K := K) S)
 

noncomputable def fullLogAmbient :
    Additive (SUnitGroup (K := K) S) →+
      FullLogSpace (K := K) S where
  toFun x p :=
    match p with
    | Sum.inl w =>
        w.mult *
          Real.log
            (w
              (((Additive.toMul x :
                SUnitGroup (K := K) S) : Kˣ) : K))
    | Sum.inr v =>
        Real.log
          (NumberField.HeightOneSpectrum.adicAbv K
            (v : HeightOneSpectrum (𝓞 K))
            (((Additive.toMul x :
              SUnitGroup (K := K) S) : Kˣ) : K))
  map_zero' := by
    ext p
    cases p <;> simp
  map_add' x y := by
    ext p
    cases p <;> simp [Real.log_mul, mul_add]
 

theorem finprod_finitePlace_eq_prod_adicAbv
    (x : SUnitGroup (K := K) S) :
    (∏ᶠ w : NumberField.FinitePlace K,
        w (((x : Kˣ) : K))) =
      ∏ v : S,
        NumberField.HeightOneSpectrum.adicAbv K
          (v : HeightOneSpectrum (𝓞 K))
          (((x : Kˣ) : K)) := by
  rw [← finprod_comp_equiv
    NumberField.FinitePlace.equivHeightOneSpectrum.symm]
  simp_rw
    [NumberField.FinitePlace.equivHeightOneSpectrum_symm_apply,
      NumberField.FinitePlace.norm_embedding,
      NumberField.HeightOneSpectrum.adicAbv_def]
  rw [finprod_eq_prod_of_mulSupport_subset
    (s := S)]
  · exact
      (Finset.prod_coe_sort
        (s := S)
        (f := fun v : HeightOneSpectrum (𝓞 K) =>
          (NumberField.HeightOneSpectrum.adicAbv K v
            (((x : Kˣ) : K))))).symm
  · intro v hv
    by_contra hnot
    apply hv
    simp [x.property v hnot]
 

theorem sum_log_absoluteValues_eq_zero
    (x : SUnitGroup (K := K) S) :
    (∑ w : NumberField.InfinitePlace K,
        w.mult * Real.log (w (((x : Kˣ) : K)))) +
      ∑ v : S,
        Real.log
          (NumberField.HeightOneSpectrum.adicAbv K
            (v : HeightOneSpectrum (𝓞 K))
            (((x : Kˣ) : K))) = 0 := by
  have hx0 : (((x : Kˣ) : K)) ≠ 0 :=
    Units.ne_zero (x : Kˣ)
  have hprod := NumberField.prod_abs_eq_one hx0
  rw [finprod_finitePlace_eq_prod_adicAbv
    (K := K) S x] at hprod
  calc
    (∑ w : NumberField.InfinitePlace K,
        w.mult * Real.log (w (((x : Kˣ) : K)))) +
      ∑ v : S,
        Real.log
          (NumberField.HeightOneSpectrum.adicAbv K
            (v : HeightOneSpectrum (𝓞 K))
            (((x : Kˣ) : K))) =
        Real.log
            (∏ w : NumberField.InfinitePlace K,
              w (((x : Kˣ) : K)) ^ w.mult) +
          Real.log
            (∏ v : S,
              NumberField.HeightOneSpectrum.adicAbv K
                (v : HeightOneSpectrum (𝓞 K))
                (((x : Kˣ) : K))) := by
      congr 1
      · rw [Real.log_prod]
        · apply Finset.sum_congr rfl
          intro w _
          rw [Real.log_pow]
        · intro w _
          exact pow_ne_zero _ ((w.pos_iff.mpr hx0).ne')
      · rw [Real.log_prod]
        intro v _
        exact
          ((NumberField.HeightOneSpectrum.adicAbv K
            (v : HeightOneSpectrum (𝓞 K))).pos_iff.mpr hx0).ne'
    _ = Real.log
        ((∏ w : NumberField.InfinitePlace K,
            w (((x : Kˣ) : K)) ^ w.mult) *
          ∏ v : S,
            NumberField.HeightOneSpectrum.adicAbv K
              (v : HeightOneSpectrum (𝓞 K))
              (((x : Kˣ) : K))) := by
      rw [Real.log_mul]
      · exact Finset.prod_ne_zero_iff.mpr fun w _ ↦
          pow_ne_zero _ ((w.pos_iff.mpr hx0).ne')
      · exact Finset.prod_ne_zero_iff.mpr fun v _ ↦
          ((NumberField.HeightOneSpectrum.adicAbv K
            (v : HeightOneSpectrum (𝓞 K))).pos_iff.mpr hx0).ne'
    _ = 0 := by
      rw [hprod, Real.log_one]
theorem fullLogAmbient_mem_logHyperplane
    (x : Additive (SUnitGroup (K := K) S)) :
    fullLogAmbient (K := K) S x ∈
      LogHyperplane (K := K) S := by
  apply LinearMap.mem_ker.mpr
  change
    ∑ p : LogPlace (K := K) S,
      fullLogAmbient (K := K) S x p = 0
  rw [Fintype.sum_sum_type]
  exact
    sum_log_absoluteValues_eq_zero (K := K) S
      (Additive.toMul x)
 

noncomputable def fullLog :
    Additive (SUnitGroup (K := K) S) →+
      LogHyperplane (K := K) S :=
  (fullLogAmbient (K := K) S).codRestrict
    (LogHyperplane (K := K) S)
    (fullLogAmbient_mem_logHyperplane (K := K) S)
 

noncomputable def finiteLogWeight (v : S) : ℝ :=
  -Real.log
    (Ideal.absNorm
      (v : HeightOneSpectrum (𝓞 K)).asIdeal : ℝ)
theorem finiteLogWeight_ne_zero (v : S) :
    finiteLogWeight (K := K) S v ≠ 0 := by
  have hNv :
      (1 : ℝ) <
        (Ideal.absNorm
          (v : HeightOneSpectrum (𝓞 K)).asIdeal : ℝ) := by
    exact_mod_cast
      NumberField.HeightOneSpectrum.one_lt_absNorm
        (v : HeightOneSpectrum (𝓞 K))
  exact neg_ne_zero.mpr (ne_of_gt (Real.log_pos hNv))
 

noncomputable def forgetDistinguishedLog :
    LogHyperplane (K := K) S →ₗ[ℝ]
      ReducedLogSpace (K := K) S where
  toFun z :=
    (fun w => (z : FullLogSpace (K := K) S) (Sum.inl w.1),
      fun v =>
        (z : FullLogSpace (K := K) S) (Sum.inr v) /
          finiteLogWeight (K := K) S v)
  map_add' x y := by
    apply Prod.ext
    · ext w
      rfl
    · ext v
      simp [add_div]
  map_smul' c x := by
    apply Prod.ext
    · ext w
      rfl
    · ext v
      change
        (c *
            (x : FullLogSpace (K := K) S) (Sum.inr v)) /
            finiteLogWeight (K := K) S v =
          c *
            ((x : FullLogSpace (K := K) S) (Sum.inr v) /
              finiteLogWeight (K := K) S v)
      ring
 

theorem forgetDistinguishedLog_injective :
    Function.Injective (forgetDistinguishedLog (K := K) S) := by
  intro x y hxy
  have hinf :
      ∀ w :
          {w : NumberField.InfinitePlace K //
            w ≠
              NumberField.Units.dirichletUnitTheorem.w₀},
        (x : FullLogSpace (K := K) S) (Sum.inl w.1) =
          (y : FullLogSpace (K := K) S) (Sum.inl w.1) := by
    intro w
    exact congrFun (congrArg Prod.fst hxy) w
  have hfin :
      ∀ v : S,
        (x : FullLogSpace (K := K) S) (Sum.inr v) =
          (y : FullLogSpace (K := K) S) (Sum.inr v) := by
    intro v
    have hv := congrFun (congrArg Prod.snd hxy) v
    exact
      (div_left_inj'
        (finiteLogWeight_ne_zero (K := K) S v)).mp hv
  apply Subtype.ext
  funext p
  cases p with
  | inr v => exact hfin v
  | inl w =>
      by_cases hw :
          w =
            NumberField.Units.dirichletUnitTheorem.w₀
      · subst w
        have hxsum :
            (x : FullLogSpace (K := K) S)
                (Sum.inl
                  NumberField.Units.dirichletUnitTheorem.w₀) +
                (∑ v :
                    {w : NumberField.InfinitePlace K //
                      w ≠
                        NumberField.Units.dirichletUnitTheorem.w₀},
                  (x : FullLogSpace (K := K) S)
                    (Sum.inl v.1)) +
              ∑ v : S,
                (x : FullLogSpace (K := K) S)
                  (Sum.inr v) = 0 := by
          have hxker := LinearMap.mem_ker.mp x.property
          change
            ∑ p : LogPlace (K := K) S,
              (x : FullLogSpace (K := K) S) p = 0 at hxker
          rw [Fintype.sum_sum_type,
            Fintype.sum_eq_add_sum_subtype_ne _
              NumberField.Units.dirichletUnitTheorem.w₀] at hxker
          exact hxker
        have hysum :
            (y : FullLogSpace (K := K) S)
                (Sum.inl
                  NumberField.Units.dirichletUnitTheorem.w₀) +
                (∑ v :
                    {w : NumberField.InfinitePlace K //
                      w ≠
                        NumberField.Units.dirichletUnitTheorem.w₀},
                  (y : FullLogSpace (K := K) S)
                    (Sum.inl v.1)) +
              ∑ v : S,
                (y : FullLogSpace (K := K) S)
                  (Sum.inr v) = 0 := by
          have hyker := LinearMap.mem_ker.mp y.property
          change
            ∑ p : LogPlace (K := K) S,
              (y : FullLogSpace (K := K) S) p = 0 at hyker
          rw [Fintype.sum_sum_type,
            Fintype.sum_eq_add_sum_subtype_ne _
              NumberField.Units.dirichletUnitTheorem.w₀] at hyker
          exact hyker
        have hsuminf :
            (∑ v :
                {w : NumberField.InfinitePlace K //
                  w ≠
                    NumberField.Units.dirichletUnitTheorem.w₀},
              (x : FullLogSpace (K := K) S)
                (Sum.inl v.1)) =
              ∑ v :
                {w : NumberField.InfinitePlace K //
                  w ≠
                    NumberField.Units.dirichletUnitTheorem.w₀},
                (y : FullLogSpace (K := K) S)
                  (Sum.inl v.1) := by
          apply Finset.sum_congr rfl
          intro v _
          exact hinf v
        have hsumfin :
            (∑ v : S,
              (x : FullLogSpace (K := K) S)
                (Sum.inr v)) =
              ∑ v : S,
                (y : FullLogSpace (K := K) S)
                  (Sum.inr v) := by
          apply Finset.sum_congr rfl
          intro v _
          exact hfin v
        linarith
      · exact hinf ⟨w, hw⟩
 

theorem forgetDistinguishedLog_surjective :
    Function.Surjective (forgetDistinguishedLog (K := K) S) := by
  intro z
  let completed : FullLogSpace (K := K) S :=
    fun p =>
      match p with
      | Sum.inl w =>
          if hw :
              w =
                NumberField.Units.dirichletUnitTheorem.w₀ then
            -(∑ v :
                {w : NumberField.InfinitePlace K //
                  w ≠
                    NumberField.Units.dirichletUnitTheorem.w₀},
                z.1 v) -
              ∑ v : S,
                finiteLogWeight (K := K) S v * z.2 v
          else
            z.1 ⟨w, hw⟩
      | Sum.inr v =>
          finiteLogWeight (K := K) S v * z.2 v
  have hcompleted :
      completed ∈ LogHyperplane (K := K) S := by
    apply LinearMap.mem_ker.mpr
    change
      ∑ p : LogPlace (K := K) S, completed p = 0
    rw [Fintype.sum_sum_type,
      Fintype.sum_eq_add_sum_subtype_ne _
        NumberField.Units.dirichletUnitTheorem.w₀]
    have hw0 :
        completed
            (Sum.inl
              NumberField.Units.dirichletUnitTheorem.w₀) =
          -(∑ v :
              {w : NumberField.InfinitePlace K //
                w ≠
                  NumberField.Units.dirichletUnitTheorem.w₀},
              z.1 v) -
            ∑ v : S,
              finiteLogWeight (K := K) S v * z.2 v := by
      simp [completed]
    have hinf :
        (∑ v :
            {w : NumberField.InfinitePlace K //
              w ≠
                NumberField.Units.dirichletUnitTheorem.w₀},
          completed (Sum.inl v.1)) =
          ∑ v :
            {w : NumberField.InfinitePlace K //
              w ≠
                NumberField.Units.dirichletUnitTheorem.w₀},
            z.1 v := by
      apply Finset.sum_congr rfl
      intro v _
      simp [completed, v.property]
    have hfin :
        (∑ v : S, completed (Sum.inr v)) =
          ∑ v : S,
            finiteLogWeight (K := K) S v * z.2 v := by
      rfl
    rw [hw0, hinf, hfin]
    ring
  let y : LogHyperplane (K := K) S :=
    ⟨completed, hcompleted⟩
  refine ⟨y, ?_⟩
  apply Prod.ext
  · ext w
    simp [forgetDistinguishedLog, y, completed, w.property]
  · ext v
    simp [forgetDistinguishedLog, y, completed,
      finiteLogWeight_ne_zero (K := K) S v]
 

noncomputable def logHyperplaneEquivReduced :
    LogHyperplane (K := K) S ≃ₗ[ℝ]
      ReducedLogSpace (K := K) S :=
  LinearEquiv.ofBijective
    (forgetDistinguishedLog (K := K) S)
    ⟨forgetDistinguishedLog_injective (K := K) S,
      forgetDistinguishedLog_surjective (K := K) S⟩
 

theorem logHyperplaneEquivReduced_fullLog
    (x : Additive (SUnitGroup (K := K) S)) :
    logHyperplaneEquivReduced (K := K) S
        (fullLog (K := K) S x) =
      reducedLog (K := K) S x := by
  apply Prod.ext
  · ext w
    rfl
  · ext v
    have hlog :
        Real.log
          (Ideal.absNorm
            (v : HeightOneSpectrum (𝓞 K)).asIdeal : ℝ) ≠ 0 :=
      neg_ne_zero.mp
        (finiteLogWeight_ne_zero (K := K) S v)
    change
      Real.log
          (NumberField.HeightOneSpectrum.adicAbv K
            (v : HeightOneSpectrum (𝓞 K))
            (((Additive.toMul x :
              SUnitGroup (K := K) S) : Kˣ) : K)) /
          finiteLogWeight (K := K) S v =
        (divisorCoordinate (K := K) S
          (Additive.toMul x) v : ℝ)
    rw [log_adicAbv_eq_neg_divisorCoordinate_mul_log_absNorm
      (K := K) S]
    dsimp [finiteLogWeight]
    field_simp [hlog]
 

theorem fullLog_eq_zero_iff
    (x : Additive (SUnitGroup (K := K) S)) :
    fullLog (K := K) S x = 0 ↔
      x ∈ AddCommGroup.torsion
        (Additive (SUnitGroup (K := K) S)) := by
  rw [← reducedLog_eq_zero_iff (K := K) S]
  constructor
  · intro hx
    have := congrArg
      (logHyperplaneEquivReduced (K := K) S) hx
    simpa [logHyperplaneEquivReduced_fullLog] using this
  · intro hx
    apply (logHyperplaneEquivReduced (K := K) S).injective
    rw [logHyperplaneEquivReduced_fullLog, hx, map_zero]
 

noncomputable def logHyperplaneContinuousEquivReduced :
    LogHyperplane (K := K) S ≃L[ℝ]
      ReducedLogSpace (K := K) S :=
  (logHyperplaneEquivReduced (K := K) S).toContinuousLinearEquiv
 
noncomputable def fullLogLattice :
    Submodule ℤ (LogHyperplane (K := K) S) :=
  ZLattice.comap ℝ
    (reducedLogLattice (K := K) S)
    (logHyperplaneContinuousEquivReduced
      (K := K) S).toLinearMap
 

theorem fullLogLattice_eq_range :
    fullLogLattice (K := K) S =
      LinearMap.range
        (fullLog (K := K) S).toIntLinearMap := by
  ext z
  constructor
  · intro hz
    change
      logHyperplaneEquivReduced (K := K) S z ∈
        reducedLogLattice (K := K) S at hz
    obtain ⟨x, hx⟩ := hz
    refine ⟨x, ?_⟩
    apply (logHyperplaneEquivReduced (K := K) S).injective
    change
      logHyperplaneEquivReduced (K := K) S
          (fullLog (K := K) S x) =
        logHyperplaneEquivReduced (K := K) S z
    rw [logHyperplaneEquivReduced_fullLog]
    exact hx
  · rintro ⟨x, rfl⟩
    change
      logHyperplaneEquivReduced (K := K) S
          (fullLog (K := K) S x) ∈
        reducedLogLattice (K := K) S
    rw [logHyperplaneEquivReduced_fullLog]
    exact LinearMap.mem_range_self _ x
instance instDiscreteTopology_fullLogLattice :
    DiscreteTopology (fullLogLattice (K := K) S) :=
  by
    change
      DiscreteTopology
        (ZLattice.comap ℝ
          (reducedLogLattice (K := K) S)
          (logHyperplaneContinuousEquivReduced
            (K := K) S).toLinearMap)
    infer_instance
 

instance instIsZLattice_fullLogLattice :
    IsZLattice ℝ (fullLogLattice (K := K) S) :=
  by
    change
      IsZLattice ℝ
        (ZLattice.comap ℝ
          (reducedLogLattice (K := K) S)
          (logHyperplaneContinuousEquivReduced
            (K := K) S).toLinearMap)
    infer_instance
end FullLogarithmicSpace
section Decomposition
end Decomposition
end SUnitGroup
end
end

/- GaloisCohomology.Cyclic.Herbrand.Permutation.Lattice -/
section
noncomputable section
namespace CyclicCohomology
open Module Submodule
open scoped BigOperators
universe uG uι
variable {G : Type uG} {ι : Type uι}
 

def coordinatePermutation (σ : Equiv.Perm ι) :
    (ι → ℝ) ≃ₗ[ℝ] (ι → ℝ) where
  toFun x i := x (σ.symm i)
  invFun x i := x (σ i)
  left_inv x := by
    funext i
    simp
  right_inv x := by
    funext i
    simp
  map_add' _ _ := rfl
  map_smul' _ _ := rfl
@[simp]
theorem coordinatePermutation_apply
    (σ : Equiv.Perm ι) (x : ι → ℝ) (i : ι) :
    coordinatePermutation σ x i = x (σ.symm i) :=
  rfl
@[simp]
theorem coordinatePermutation_refl :
    coordinatePermutation (Equiv.refl ι) =
      LinearEquiv.refl ℝ (ι → ℝ) := by
  ext x i
  rfl
theorem coordinatePermutation_mul
    (σ τ : Equiv.Perm ι) :
    coordinatePermutation (σ * τ) =
      (coordinatePermutation τ).trans
        (coordinatePermutation σ) := by
  ext x i
  rfl
@[simp]
theorem coordinatePermutation_inv
    (σ : Equiv.Perm ι) :
    coordinatePermutation σ⁻¹ =
      (coordinatePermutation σ).symm := by
  rw [show σ⁻¹ = σ.symm from rfl]
  ext x i
  rfl
section Approximation
variable [Fintype ι]
 

def latticeApproximation
    (L : Submodule ℤ (ι → ℝ)) [DiscreteTopology L]
    [IsZLattice ℝ L] (x : ι → ℝ) : L := by
  let b : Basis ι ℤ L := IsZLattice.basis L
  let bℝ : Basis ι ℝ (ι → ℝ) := b.ofZLatticeBasis ℝ L
  refine ⟨ZSpan.floor bℝ x, ?_⟩
  let z : ι → ℝ := (ZSpan.floor bℝ x).1
  change z ∈ L
  rw [← b.ofZLatticeBasis_span ℝ]
  exact (ZSpan.floor bℝ x).property
 

def latticeApproximationRadius
    (L : Submodule ℤ (ι → ℝ)) [DiscreteTopology L]
    [IsZLattice ℝ L] : ℝ :=
  let b : Basis ι ℤ L := IsZLattice.basis L
  let bℝ : Basis ι ℝ (ι → ℝ) := b.ofZLatticeBasis ℝ L
  ∑ i, ‖bℝ i‖
theorem latticeApproximationRadius_nonneg
    (L : Submodule ℤ (ι → ℝ)) [DiscreteTopology L]
    [IsZLattice ℝ L] :
    0 ≤ latticeApproximationRadius L := by
  unfold latticeApproximationRadius
  exact Finset.sum_nonneg fun _ _ ↦ norm_nonneg _
theorem norm_sub_latticeApproximation_le
    (L : Submodule ℤ (ι → ℝ)) [DiscreteTopology L]
    [IsZLattice ℝ L] (x : ι → ℝ) :
    ‖x - (latticeApproximation L x : ι → ℝ)‖ ≤
      latticeApproximationRadius L := by
  let b : Basis ι ℤ L := IsZLattice.basis L
  let bℝ : Basis ι ℝ (ι → ℝ) := b.ofZLatticeBasis ℝ L
  simpa only [latticeApproximation, latticeApproximationRadius,
    ZSpan.fract] using ZSpan.norm_fract_le bℝ x
theorem abs_latticeApproximation_sub_apply_le
    (L : Submodule ℤ (ι → ℝ)) [DiscreteTopology L]
    [IsZLattice ℝ L] (x : ι → ℝ) (i : ι) :
    |(latticeApproximation L x : ι → ℝ) i - x i| ≤
      latticeApproximationRadius L := by
  have hcoord :
      ‖(x - (latticeApproximation L x : ι → ℝ)) i‖ ≤
        ‖x - (latticeApproximation L x : ι → ℝ)‖ :=
    norm_le_pi_norm (x - (latticeApproximation L x : ι → ℝ)) i
  rw [Pi.sub_apply, Real.norm_eq_abs, abs_sub_comm] at hcoord
  exact hcoord.trans (norm_sub_latticeApproximation_le L x)
end Approximation
section Averaging
variable [Fintype G] [Group G] [Fintype ι] [DecidableEq ι]
 

def permutationRepresentation
    (ρ : G →* Equiv.Perm ι) (g : G) :
    (ι → ℝ) ≃ₗ[ℝ] (ι → ℝ) :=
  coordinatePermutation (ρ g)
omit [Fintype G] [Fintype ι] [DecidableEq ι] in
@[simp]
theorem permutationRepresentation_one
    (ρ : G →* Equiv.Perm ι) :
    permutationRepresentation ρ 1 =
      LinearEquiv.refl ℝ (ι → ℝ) := by
  change coordinatePermutation (ρ 1) =
    LinearEquiv.refl ℝ (ι → ℝ)
  rw [map_one]
  exact coordinatePermutation_refl
omit [Fintype G] [Fintype ι] [DecidableEq ι] in
theorem permutationRepresentation_mul
    (ρ : G →* Equiv.Perm ι) (g h : G) :
    permutationRepresentation ρ (g * h) =
      (permutationRepresentation ρ h).trans
        (permutationRepresentation ρ g) := by
  simp only [permutationRepresentation, map_mul]
  exact coordinatePermutation_mul _ _
 
def permutationLatticeEquiv
    (ρ : G →* Equiv.Perm ι)
    (L : Submodule ℤ (ι → ℝ))
    (hL : ∀ (g : G) (x : ι → ℝ), x ∈ L →
      permutationRepresentation ρ g x ∈ L)
    (g : G) : L ≃ₗ[ℤ] L where
  toFun x :=
    ⟨permutationRepresentation ρ g x.1, hL g x.1 x.2⟩
  invFun x :=
    ⟨permutationRepresentation ρ g⁻¹ x.1,
      hL g⁻¹ x.1 x.2⟩
  left_inv x := by
    apply Subtype.ext
    change coordinatePermutation (ρ g⁻¹)
      (coordinatePermutation (ρ g) x.1) = x.1
    rw [map_inv,
      coordinatePermutation_inv]
    exact (coordinatePermutation (ρ g)).symm_apply_apply x.1
  right_inv x := by
    apply Subtype.ext
    change coordinatePermutation (ρ g)
      (coordinatePermutation (ρ g⁻¹) x.1) = x.1
    rw [map_inv,
      coordinatePermutation_inv]
    exact (coordinatePermutation (ρ g)).apply_symm_apply x.1
  map_add' x y := by
    apply Subtype.ext
    exact map_add _ _ _
  map_smul' n x := by
    apply Subtype.ext
    exact map_zsmul _ _ _
omit [Fintype G] [Fintype ι] [DecidableEq ι] in
@[simp]
theorem coe_permutationLatticeEquiv
    (ρ : G →* Equiv.Perm ι)
    (L : Submodule ℤ (ι → ℝ))
    (hL : ∀ (g : G) (x : ι → ℝ), x ∈ L →
      permutationRepresentation ρ g x ∈ L)
    (g : G) (x : L) :
    ((permutationLatticeEquiv ρ L hL g x : L) : ι → ℝ) =
      permutationRepresentation ρ g x :=
  rfl
 

def averagedLatticeVector
    (ρ : G →* Equiv.Perm ι)
    (L : Submodule ℤ (ι → ℝ)) [DiscreteTopology L]
    [IsZLattice ℝ L]
    (hL : ∀ (g : G) (x : ι → ℝ), x ∈ L →
      permutationRepresentation ρ g x ∈ L)
    (t : ℝ) (i : ι) : L :=
  ∑ g : G,
    permutationLatticeEquiv ρ L hL g
      (latticeApproximation L
        (t • Pi.single ((ρ g).symm i) (1 : ℝ)))
 

def permutationLatticeScale
    (L : Submodule ℤ (ι → ℝ)) [DiscreteTopology L]
    [IsZLattice ℝ L] : ℝ :=
  ((Fintype.card ι : ℝ) + 1) *
      latticeApproximationRadius L + 1
@[simp]
theorem averagedLatticeVector_apply
    (ρ : G →* Equiv.Perm ι)
    (L : Submodule ℤ (ι → ℝ)) [DiscreteTopology L]
    [IsZLattice ℝ L]
    (hL : ∀ (g : G) (x : ι → ℝ), x ∈ L →
      permutationRepresentation ρ g x ∈ L)
    (t : ℝ) (i j : ι) :
    (averagedLatticeVector ρ L hL t i : ι → ℝ) j =
      ∑ g : G,
        (latticeApproximation L
          (t • Pi.single ((ρ g).symm i) (1 : ℝ)) :
            ι → ℝ) ((ρ g).symm j) := by
  simp [averagedLatticeVector, permutationRepresentation]
omit [Fintype G] in
theorem averagingSummand_diagonal_bound
    (ρ : G →* Equiv.Perm ι)
    (L : Submodule ℤ (ι → ℝ)) [DiscreteTopology L]
    [IsZLattice ℝ L] (t : ℝ) (g : G) (i : ι) :
    |(latticeApproximation L
          (t • Pi.single ((ρ g).symm i) (1 : ℝ)) :
        ι → ℝ) ((ρ g).symm i) - t| ≤
      latticeApproximationRadius L := by
  have h :=
    abs_latticeApproximation_sub_apply_le L
      (t • Pi.single ((ρ g).symm i) (1 : ℝ))
      ((ρ g).symm i)
  simpa using h
omit [Fintype G] in
theorem averagingSummand_offDiagonal_bound
    (ρ : G →* Equiv.Perm ι)
    (L : Submodule ℤ (ι → ℝ)) [DiscreteTopology L]
    [IsZLattice ℝ L] (t : ℝ) (g : G) {i j : ι}
    (hji : j ≠ i) :
    |(latticeApproximation L
          (t • Pi.single ((ρ g).symm i) (1 : ℝ)) :
        ι → ℝ) ((ρ g).symm j)| ≤
      latticeApproximationRadius L := by
  have h :=
    abs_latticeApproximation_sub_apply_le L
      (t • Pi.single ((ρ g).symm i) (1 : ℝ))
      ((ρ g).symm j)
  have hne : (ρ g).symm j ≠ (ρ g).symm i :=
    (ρ g).symm.injective.ne hji
  simpa [hne] using h
theorem averagedLatticeVector_diagonal_bound
    (ρ : G →* Equiv.Perm ι)
    (L : Submodule ℤ (ι → ℝ)) [DiscreteTopology L]
    [IsZLattice ℝ L]
    (hL : ∀ (g : G) (x : ι → ℝ), x ∈ L →
      permutationRepresentation ρ g x ∈ L)
    (t : ℝ) (i : ι) :
    |(averagedLatticeVector ρ L hL t i : ι → ℝ) i -
        (Fintype.card G : ℝ) * t| ≤
      (Fintype.card G : ℝ) *
        latticeApproximationRadius L := by
  rw [averagedLatticeVector_apply]
  let a : G → ℝ := fun g ↦
    (latticeApproximation L
      (t • Pi.single ((ρ g).symm i) (1 : ℝ)) :
        ι → ℝ) ((ρ g).symm i)
  change |(∑ g : G, a g) -
    (Fintype.card G : ℝ) * t| ≤
      (Fintype.card G : ℝ) *
        latticeApproximationRadius L
  have ha (g : G) :
      |a g - t| ≤ latticeApproximationRadius L := by
    simpa only [a] using
      averagingSummand_diagonal_bound ρ L t g i
  have heq :
      (∑ g : G, a g) -
          (Fintype.card G : ℝ) * t =
        ∑ g : G, (a g - t) := by
    rw [Finset.sum_sub_distrib]
    simp
  rw [heq]
  calc
    |∑ g : G, (a g - t)| ≤
        ∑ g : G, |a g - t| :=
      Finset.abs_sum_le_sum_abs _ _
    _ ≤ ∑ _g : G, latticeApproximationRadius L :=
      Finset.sum_le_sum fun g _ ↦ ha g
    _ = (Fintype.card G : ℝ) *
        latticeApproximationRadius L := by simp
theorem averagedLatticeVector_offDiagonal_bound
    (ρ : G →* Equiv.Perm ι)
    (L : Submodule ℤ (ι → ℝ)) [DiscreteTopology L]
    [IsZLattice ℝ L]
    (hL : ∀ (g : G) (x : ι → ℝ), x ∈ L →
      permutationRepresentation ρ g x ∈ L)
    (t : ℝ) {i j : ι} (hji : j ≠ i) :
    |(averagedLatticeVector ρ L hL t i : ι → ℝ) j| ≤
      (Fintype.card G : ℝ) *
        latticeApproximationRadius L := by
  rw [averagedLatticeVector_apply]
  let a : G → ℝ := fun g ↦
    (latticeApproximation L
      (t • Pi.single ((ρ g).symm i) (1 : ℝ)) :
        ι → ℝ) ((ρ g).symm j)
  change |∑ g : G, a g| ≤
    (Fintype.card G : ℝ) *
      latticeApproximationRadius L
  have ha (g : G) :
      |a g| ≤ latticeApproximationRadius L := by
    simpa only [a] using
      averagingSummand_offDiagonal_bound
        ρ L t g hji
  calc
    |∑ g : G, a g| ≤ ∑ g : G, |a g| :=
      Finset.abs_sum_le_sum_abs _ _
    _ ≤ ∑ _g : G, latticeApproximationRadius L :=
      Finset.sum_le_sum fun g _ ↦ ha g
    _ = (Fintype.card G : ℝ) *
        latticeApproximationRadius L := by simp
 

def averagedLatticeMatrix
    (ρ : G →* Equiv.Perm ι)
    (L : Submodule ℤ (ι → ℝ)) [DiscreteTopology L]
    [IsZLattice ℝ L]
    (hL : ∀ (g : G) (x : ι → ℝ), x ∈ L →
      permutationRepresentation ρ g x ∈ L)
    (t : ℝ) : Matrix ι ι ℝ :=
  fun row column ↦
    (averagedLatticeVector ρ L hL t column :
      ι → ℝ) row
theorem averagedLatticeMatrix_sum_col_lt_diag
    (ρ : G →* Equiv.Perm ι)
    (L : Submodule ℤ (ι → ℝ)) [DiscreteTopology L]
    [IsZLattice ℝ L]
    (hL : ∀ (g : G) (x : ι → ℝ), x ∈ L →
      permutationRepresentation ρ g x ∈ L) :
    ∀ k : ι,
      ∑ j ∈ Finset.univ.erase k,
          ‖averagedLatticeMatrix ρ L hL
            (permutationLatticeScale L) j k‖ <
        ‖averagedLatticeMatrix ρ L hL
            (permutationLatticeScale L) k k‖ := by
  intro k
  let B : ℝ := latticeApproximationRadius L
  let n : ℝ := Fintype.card G
  let s : ℝ := Fintype.card ι
  let t : ℝ := permutationLatticeScale L
  let E : ℝ := n * B
  have hB : 0 ≤ B :=
    latticeApproximationRadius_nonneg L
  have hn : 0 < n := by
    dsimp only [n]
    exact_mod_cast (Fintype.card_pos : 0 < Fintype.card G)
  have hs : 0 ≤ s := by positivity
  have hE : 0 ≤ E := mul_nonneg hn.le hB
  have hoff (j : ι) (hjk : j ≠ k) :
      ‖averagedLatticeMatrix ρ L hL t j k‖ ≤ E := by
    change
      |(averagedLatticeVector ρ L hL t k :
        ι → ℝ) j| ≤ E
    exact averagedLatticeVector_offDiagonal_bound
      ρ L hL t hjk
  have hsum :
      ∑ j ∈ Finset.univ.erase k,
          ‖averagedLatticeMatrix ρ L hL t j k‖ ≤
        s * E := by
    calc
      ∑ j ∈ Finset.univ.erase k,
          ‖averagedLatticeMatrix ρ L hL t j k‖ ≤
          ∑ _j ∈ Finset.univ.erase k, E :=
        Finset.sum_le_sum fun j hj ↦
          hoff j (Finset.ne_of_mem_erase hj)
      _ ≤ ∑ _j : ι, E :=
        Finset.sum_le_sum_of_subset_of_nonneg
          (Finset.erase_subset k Finset.univ)
          (fun _ _ _ ↦ hE)
      _ = s * E := by simp [s]
  have hdiag :
      |(averagedLatticeMatrix ρ L hL t k k) -
          n * t| ≤ E := by
    exact averagedLatticeVector_diagonal_bound
      ρ L hL t k
  have hdiagLower :
      n * t - E ≤
        |averagedLatticeMatrix ρ L hL t k k| := by
    have hleft := (abs_le.mp hdiag).1
    have hself :
        averagedLatticeMatrix ρ L hL t k k ≤
          |averagedLatticeMatrix ρ L hL t k k| :=
      le_abs_self _
    nlinarith
  have hnumeric : s * E < n * t - E := by
    dsimp only [E, n, s, t, B]
    unfold permutationLatticeScale
    nlinarith
  calc
    ∑ j ∈ Finset.univ.erase k,
        ‖averagedLatticeMatrix ρ L hL
          (permutationLatticeScale L) j k‖ =
        ∑ j ∈ Finset.univ.erase k,
          ‖averagedLatticeMatrix ρ L hL t j k‖ := by rfl
    _ ≤ s * E := hsum
    _ < n * t - E := hnumeric
    _ ≤ |averagedLatticeMatrix ρ L hL t k k| :=
      hdiagLower
    _ = ‖averagedLatticeMatrix ρ L hL
        (permutationLatticeScale L) k k‖ := by
      rfl
theorem averagedLatticeMatrix_det_ne_zero
    (ρ : G →* Equiv.Perm ι)
    (L : Submodule ℤ (ι → ℝ)) [DiscreteTopology L]
    [IsZLattice ℝ L]
    (hL : ∀ (g : G) (x : ι → ℝ), x ∈ L →
      permutationRepresentation ρ g x ∈ L) :
    (averagedLatticeMatrix ρ L hL
      (permutationLatticeScale L)).det ≠ 0 :=
  det_ne_zero_of_sum_col_lt_diag
    (averagedLatticeMatrix_sum_col_lt_diag ρ L hL)
theorem averagedLatticeVector_linearIndependent
    (ρ : G →* Equiv.Perm ι)
    (L : Submodule ℤ (ι → ℝ)) [DiscreteTopology L]
    [IsZLattice ℝ L]
    (hL : ∀ (g : G) (x : ι → ℝ), x ∈ L →
      permutationRepresentation ρ g x ∈ L) :
    LinearIndependent ℝ
      (fun i ↦
        (averagedLatticeVector ρ L hL
          (permutationLatticeScale L) i :
            ι → ℝ)) := by
  have hcols :=
    Matrix.linearIndependent_cols_of_det_ne_zero
      (averagedLatticeMatrix_det_ne_zero ρ L hL)
  change LinearIndependent ℝ
    (fun i j ↦
      averagedLatticeMatrix ρ L hL
        (permutationLatticeScale L) j i) at hcols
  simpa only [averagedLatticeMatrix] using hcols
theorem averagedLatticeVector_equivariant
    (ρ : G →* Equiv.Perm ι)
    (L : Submodule ℤ (ι → ℝ)) [DiscreteTopology L]
    [IsZLattice ℝ L]
    (hL : ∀ (g : G) (x : ι → ℝ), x ∈ L →
      permutationRepresentation ρ g x ∈ L)
    (t : ℝ) (g : G) (i : ι) :
    permutationLatticeEquiv ρ L hL g
        (averagedLatticeVector ρ L hL t i) =
      averagedLatticeVector ρ L hL t (ρ g i) := by
  classical
  apply Subtype.ext
  ext j
  simp only [coe_permutationLatticeEquiv,
    permutationRepresentation, coordinatePermutation_apply,
    averagedLatticeVector_apply]
  let F : G → ℝ := fun h ↦
      (latticeApproximation L
        (t • Pi.single ((ρ h).symm i) (1 : ℝ)) :
          ι → ℝ) ((ρ h).symm ((ρ g).symm j))
  let H : G → ℝ := fun k ↦
      (latticeApproximation L
        (t • Pi.single ((ρ k).symm (ρ g i)) (1 : ℝ)) :
          ι → ℝ) ((ρ k).symm j)
  have hterm (h : G) : F h = H (g * h) := by
    dsimp only [F, H]
    have hindex :
        (ρ (g * h)).symm (ρ g i) = (ρ h).symm i := by
      rw [Equiv.symm_apply_eq]
      simp [map_mul]
    have hcoordinate :
        (ρ (g * h)).symm j =
          (ρ h).symm ((ρ g).symm j) := by
      rw [Equiv.symm_apply_eq]
      simp [map_mul]
    rw [hindex, hcoordinate]
  calc
    ∑ h : G, F h = ∑ h : G, H (g * h) := by
      exact Finset.sum_congr rfl fun h _ ↦ hterm h
    _ = ∑ k : G, H k := by
      exact Fintype.sum_bijective (g * ·)
        (Group.mulLeft_bijective g) (fun h ↦ H (g * h)) H
        fun _ ↦ rfl
 

def permutationSublattice
    (ρ : G →* Equiv.Perm ι)
    (L : Submodule ℤ (ι → ℝ)) [DiscreteTopology L]
    [IsZLattice ℝ L]
    (hL : ∀ (g : G) (x : ι → ℝ), x ∈ L →
      permutationRepresentation ρ g x ∈ L) :
    Submodule ℤ (ι → ℝ) :=
  Submodule.span ℤ
    (Set.range fun i ↦
      (averagedLatticeVector ρ L hL
        (permutationLatticeScale L) i : ι → ℝ))
theorem permutationSublattice_le
    (ρ : G →* Equiv.Perm ι)
    (L : Submodule ℤ (ι → ℝ)) [DiscreteTopology L]
    [IsZLattice ℝ L]
    (hL : ∀ (g : G) (x : ι → ℝ), x ∈ L →
      permutationRepresentation ρ g x ∈ L) :
    permutationSublattice ρ L hL ≤ L := by
  apply Submodule.span_le.mpr
  rintro _ ⟨i, rfl⟩
  exact (averagedLatticeVector ρ L hL
    (permutationLatticeScale L) i).property
instance permutationSublattice_discreteTopology
    (ρ : G →* Equiv.Perm ι)
    (L : Submodule ℤ (ι → ℝ)) [DiscreteTopology L]
    [IsZLattice ℝ L]
    (hL : ∀ (g : G) (x : ι → ℝ), x ∈ L →
      permutationRepresentation ρ g x ∈ L) :
    DiscreteTopology (permutationSublattice ρ L hL) := by
  let f : permutationSublattice ρ L hL → L :=
    fun x ↦ ⟨x.1, permutationSublattice_le ρ L hL x.2⟩
  refine DiscreteTopology.of_continuous_injective
    (f := f) ?_ ?_
  · exact Continuous.subtype_mk continuous_subtype_val _
  · intro x y hxy
    apply Subtype.ext
    exact congrArg (fun z : L ↦ (z : ι → ℝ)) hxy
theorem permutationSublattice_span_eq_top
    (ρ : G →* Equiv.Perm ι)
    (L : Submodule ℤ (ι → ℝ)) [DiscreteTopology L]
    [IsZLattice ℝ L]
    (hL : ∀ (g : G) (x : ι → ℝ), x ∈ L →
      permutationRepresentation ρ g x ∈ L) :
    Submodule.span ℝ
        (permutationSublattice ρ L hL :
          Set (ι → ℝ)) = ⊤ := by
  let w : ι → (ι → ℝ) := fun i ↦
    (averagedLatticeVector ρ L hL
      (permutationLatticeScale L) i : ι → ℝ)
  have hw :
      LinearIndependent ℝ w :=
    averagedLatticeVector_linearIndependent ρ L hL
  have hwspan :
      Submodule.span ℝ (Set.range w) = ⊤ :=
    hw.span_eq_top_of_card_eq_finrank'
      (Module.finrank_fintype_fun_eq_card ℝ).symm
  rw [eq_top_iff, ← hwspan]
  apply Submodule.span_mono (R := ℝ)
  rintro _ ⟨i, rfl⟩
  exact Submodule.subset_span ⟨i, rfl⟩
instance permutationSublattice_isZLattice
    (ρ : G →* Equiv.Perm ι)
    (L : Submodule ℤ (ι → ℝ)) [DiscreteTopology L]
    [IsZLattice ℝ L]
    (hL : ∀ (g : G) (x : ι → ℝ), x ∈ L →
      permutationRepresentation ρ g x ∈ L) :
    IsZLattice ℝ (permutationSublattice ρ L hL) where
  span_top := permutationSublattice_span_eq_top ρ L hL
 
def permutationSublatticeBasis
    (ρ : G →* Equiv.Perm ι)
    (L : Submodule ℤ (ι → ℝ)) [DiscreteTopology L]
    [IsZLattice ℝ L]
    (hL : ∀ (g : G) (x : ι → ℝ), x ∈ L →
      permutationRepresentation ρ g x ∈ L) :
    Basis ι ℤ (permutationSublattice ρ L hL) :=
  Basis.span
    ((averagedLatticeVector_linearIndependent ρ L hL).restrict_scalars' ℤ)
@[simp]
theorem permutationSublatticeBasis_apply_coe
    (ρ : G →* Equiv.Perm ι)
    (L : Submodule ℤ (ι → ℝ)) [DiscreteTopology L]
    [IsZLattice ℝ L]
    (hL : ∀ (g : G) (x : ι → ℝ), x ∈ L →
      permutationRepresentation ρ g x ∈ L)
    (i : ι) :
    ((permutationSublatticeBasis ρ L hL i :
        permutationSublattice ρ L hL) : ι → ℝ) =
      averagedLatticeVector ρ L hL
        (permutationLatticeScale L) i := by
  let hli :=
    (averagedLatticeVector_linearIndependent
      ρ L hL).restrict_scalars' ℤ
  change
    ((Basis.span hli i :
      permutationSublattice ρ L hL) : ι → ℝ) =
        (averagedLatticeVector ρ L hL
          (permutationLatticeScale L) i : ι → ℝ)
  exact Basis.coe_span_apply hli i
theorem permutationSublatticeBasis_permuted
    (ρ : G →* Equiv.Perm ι)
    (L : Submodule ℤ (ι → ℝ)) [DiscreteTopology L]
    [IsZLattice ℝ L]
    (hL : ∀ (g : G) (x : ι → ℝ), x ∈ L →
      permutationRepresentation ρ g x ∈ L)
    (g : G) (i : ι) :
    permutationRepresentation ρ g
        (permutationSublatticeBasis ρ L hL i :
          ι → ℝ) =
      (permutationSublatticeBasis ρ L hL (ρ g i) :
        ι → ℝ) := by
  have h :=
    congrArg (fun x : L ↦ (x : ι → ℝ))
      (averagedLatticeVector_equivariant
        ρ L hL (permutationLatticeScale L) g i)
  simpa only [coe_permutationLatticeEquiv,
    permutationSublatticeBasis_apply_coe] using h
end Averaging
section GeneralPermutationBasis
variable [Fintype G] [Group G] [Fintype ι] [DecidableEq ι]
variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
end GeneralPermutationBasis
section FiniteIndex
variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [FiniteDimensional ℝ E]
 


theorem finite_quotient_of_complete_sublattice
    (L L' : Submodule ℤ E)
    [DiscreteTopology L] [IsZLattice ℝ L]
    [DiscreteTopology L'] [IsZLattice ℝ L']
    (hL' : L' ≤ L) :
    Finite (L ⧸ L'.comap L.subtype) := by
  let N : Submodule ℤ L := L'.comap L.subtype
  let e : N ≃ₗ[ℤ] L' :=
    Submodule.comapSubtypeEquivOfLe hL'
  let : Module.Finite ℤ L :=
    ZLattice.module_finite ℝ L
  have hrank : Module.finrank ℤ N =
      Module.finrank ℤ L := by
    calc
      Module.finrank ℤ N =
          Module.finrank ℤ L' :=
        LinearEquiv.finrank_eq e
      _ = Module.finrank ℝ E :=
        ZLattice.rank ℝ L'
      _ = Module.finrank ℤ L :=
        (ZLattice.rank ℝ L).symm
  exact
    Submodule.finiteQuotientOfFreeOfRankEq
      (L'.comap L.subtype) hrank
end FiniteIndex
section PermutationFiniteIndex
variable [Fintype G] [Group G] [Fintype ι] [DecidableEq ι]
 

theorem permutationSublattice_finite_quotient
    (ρ : G →* Equiv.Perm ι)
    (L : Submodule ℤ (ι → ℝ)) [DiscreteTopology L]
    [IsZLattice ℝ L]
    (hL : ∀ (g : G) (x : ι → ℝ), x ∈ L →
      permutationRepresentation ρ g x ∈ L) :
    Finite
      (L ⧸
        (permutationSublattice ρ L hL).comap
          L.subtype) :=
  finite_quotient_of_complete_sublattice
    L (permutationSublattice ρ L hL)
      (permutationSublattice_le ρ L hL)
end PermutationFiniteIndex
end CyclicCohomology
end
end

/- GaloisCohomology.Cyclic.Herbrand.HerbrandLowDegree.Basic -/
section
namespace CyclicCohomology
noncomputable section
open scoped BigOperators
namespace ProfiniteCohomology
namespace Herbrand
universe uG uA uB uC
 

def tateNorm (G : Type uG) (A : Type uA) [Group G] [Fintype G] [CommGroup A]
    [MulDistribMulAction G A] (a : A) : A :=
  ∏ g : G, g • a
 
def sigmaMinusOne (G : Type uG) (A : Type uA) [Group G] [CommGroup A]
    [MulDistribMulAction G A] (σ : G) (a : A) : A :=
  σ • a * a⁻¹
 
def fixedSubgroup (G : Type uG) (A : Type uA) [Group G] [CommGroup A]
    [MulDistribMulAction G A] : Subgroup A where
  carrier := {a | ∀ g : G, g • a = a}
  one_mem' := by
    intro g
    exact MulDistribMulAction.smul_one g
  mul_mem' := by
    intro a b ha hb g
    rw [MulDistribMulAction.smul_mul, ha g, hb g]
  inv_mem' := by
    intro a ha g
    calc
      g • a⁻¹ = (g • a)⁻¹ := smul_inv' g a
      _ = a⁻¹ := by rw [ha g]
variable {G : Type uG} {A : Type uA} {B : Type uB} {C : Type uC}
variable [Group G] [Fintype G] [CommGroup A] [CommGroup B] [CommGroup C]
variable [MulDistribMulAction G A] [MulDistribMulAction G B] [MulDistribMulAction G C]
omit [Fintype G] [CommGroup B] [CommGroup C]
    [MulDistribMulAction G B] [MulDistribMulAction G C] in
 

theorem smul_eq_of_mem_zpowers_of_sigmaMinusOne_eq_one
    {σ g : G} {a : A} (hg : g ∈ Subgroup.zpowers σ)
    (hσ : sigmaMinusOne G A σ a = 1) :
    g • a = a := by
  have hσa : σ • a = a := by
    exact mul_inv_eq_one.mp (by simpa [sigmaMinusOne] using hσ)
  exact smul_eq_self_of_mem_zpowers hg hσa
omit [Fintype G] [CommGroup B] [CommGroup C]
    [MulDistribMulAction G B] [MulDistribMulAction G C] in
 

theorem fixed_of_forall_mem_zpowers_of_sigmaMinusOne_eq_one
    {σ : G} {a : A} (hgen : ∀ g : G, g ∈ Subgroup.zpowers σ)
    (hσ : sigmaMinusOne G A σ a = 1) :
    ∀ g : G, g • a = a := by
  intro g
  exact smul_eq_of_mem_zpowers_of_sigmaMinusOne_eq_one
    (G := G) (A := A) (g := g) (hg := hgen g) hσ
omit [Group G] [Fintype G] [CommGroup A] [CommGroup B] [CommGroup C]
    [MulDistribMulAction G A] [MulDistribMulAction G B]
    [MulDistribMulAction G C] in
 


theorem monoidHom_card_eq_card_ker_mul_card_range
    {X : Type uA} {Y : Type uB} [Group X] [Group Y] [Finite X] (f : X →* Y) :
    Nat.card X = Nat.card (MonoidHom.ker f) * Nat.card (MonoidHom.range f) := by
  rw [← (MonoidHom.ker f).card_mul_index,
    Subgroup.index_ker]
omit [Group G] [Fintype G] [CommGroup A] [CommGroup B] [CommGroup C]
    [MulDistribMulAction G A] [MulDistribMulAction G B]
    [MulDistribMulAction G C] in
 


theorem monoidHom_card_eq_card_range_mul_card_range_of_exact
    {X : Type uA} {Y : Type uB} {Z : Type uC} [Group X] [Group Y] [Group Z]
    [Finite Y]
    (f : X →* Y) (g : Y →* Z)
    (hexact : MonoidHom.range f = MonoidHom.ker g) :
    Nat.card Y = Nat.card (MonoidHom.range f) * Nat.card (MonoidHom.range g) := by
  rw [monoidHom_card_eq_card_ker_mul_card_range g, ← hexact]
omit [Group G] [Fintype G] [CommGroup A] [CommGroup B] [CommGroup C]
    [MulDistribMulAction G A] [MulDistribMulAction G B]
    [MulDistribMulAction G C] in
 

theorem card_subgroupOf_eq_card
    {X : Type uA} [Group X] [Finite X] {H K : Subgroup X} (hHK : H ≤ K) :
    Nat.card (H.subgroupOf K) = Nat.card H :=
  Nat.card_congr (Subgroup.subgroupOfEquivOfLe hHK).toEquiv
 
theorem map_tateNorm (f : A →* B)
    (hf : ∀ (g : G) (a : A), f (g • a) = g • f a) (a : A) :
    f (tateNorm G A a) = tateNorm G B (f a) := by
  simp only [tateNorm, map_prod]
  exact Finset.prod_congr rfl (fun g _hg => hf g a)
omit [CommGroup B] [CommGroup C]
    [MulDistribMulAction G B] [MulDistribMulAction G C] in
 
theorem tateNorm_mul (a b : A) :
    tateNorm G A (a * b) = tateNorm G A a * tateNorm G A b := by
  calc
    tateNorm G A (a * b) = ∏ g : G, (g • a) * (g • b) := by
      unfold tateNorm
      apply Finset.prod_congr rfl
      intro g _hg
      exact MulDistribMulAction.smul_mul g a b
    _ = tateNorm G A a * tateNorm G A b := by
      simp only [tateNorm, Finset.prod_mul_distrib]
omit [CommGroup B] [CommGroup C]
    [MulDistribMulAction G B] [MulDistribMulAction G C] in
 
@[simp]
theorem tateNorm_one : tateNorm G A 1 = 1 := by
  unfold tateNorm
  exact Finset.prod_eq_one (fun g _hg => MulDistribMulAction.smul_one g)
omit [CommGroup B] [CommGroup C]
    [MulDistribMulAction G B] [MulDistribMulAction G C] in
 
def tateNormHom : A →* A where
  toFun := tateNorm G A
  map_one' := tateNorm_one (G := G) (A := A)
  map_mul' := tateNorm_mul (G := G) (A := A)
omit [CommGroup B] [CommGroup C]
    [MulDistribMulAction G B] [MulDistribMulAction G C] in
 
@[simp]
theorem tateNormHom_apply (a : A) :
    tateNormHom (G := G) (A := A) a = tateNorm G A a :=
  rfl
omit [Fintype G] [CommGroup C] [MulDistribMulAction G C] in
 
theorem map_sigmaMinusOne (f : A →* B)
    (hf : ∀ (g : G) (a : A), f (g • a) = g • f a) (σ : G) (a : A) :
    f (sigmaMinusOne G A σ a) = sigmaMinusOne G B σ (f a) := by
  simp [sigmaMinusOne, hf σ a]
omit [Fintype G] [CommGroup B] [CommGroup C]
    [MulDistribMulAction G B] [MulDistribMulAction G C] in
 
theorem sigmaMinusOne_mul (σ : G) (a b : A) :
    sigmaMinusOne G A σ (a * b) = sigmaMinusOne G A σ a * sigmaMinusOne G A σ b := by
  simp [sigmaMinusOne, mul_comm, mul_left_comm, mul_assoc]
omit [Fintype G] [CommGroup B] [CommGroup C]
    [MulDistribMulAction G B] [MulDistribMulAction G C] in
 
def sigmaMinusOneHom (σ : G) : A →* A where
  toFun := sigmaMinusOne G A σ
  map_one' := by simp [sigmaMinusOne, MulDistribMulAction.smul_one]
  map_mul' := sigmaMinusOne_mul (G := G) (A := A) σ
omit [Fintype G] [CommGroup B] [CommGroup C]
    [MulDistribMulAction G B] [MulDistribMulAction G C] in
 
@[simp]
theorem sigmaMinusOneHom_apply (σ : G) (a : A) :
    sigmaMinusOneHom (G := G) (A := A) σ a = sigmaMinusOne G A σ a :=
  rfl
 
def tateNormSubgroup (G : Type uG) (A : Type uA) [Group G] [Fintype G] [CommGroup A]
    [MulDistribMulAction G A] : Subgroup A :=
  MonoidHom.range (tateNormHom (G := G) (A := A))
 
def normKernelSubgroup (G : Type uG) (A : Type uA) [Group G] [Fintype G] [CommGroup A]
    [MulDistribMulAction G A] : Subgroup A :=
  MonoidHom.ker (tateNormHom (G := G) (A := A))
 
def augmentationSubgroup (G : Type uG) (A : Type uA) [Group G] [CommGroup A]
    [MulDistribMulAction G A] (σ : G) : Subgroup A :=
  MonoidHom.range (sigmaMinusOneHom (G := G) (A := A) σ)
omit [Fintype G] [CommGroup B] [CommGroup C]
    [MulDistribMulAction G B] [MulDistribMulAction G C] in
 
theorem sigmaMinusOneHom_ker_eq_fixedSubgroup
    (σ : G) (hgen : ∀ g : G, g ∈ Subgroup.zpowers σ) :
    MonoidHom.ker (sigmaMinusOneHom (G := G) (A := A) σ) = fixedSubgroup G A := by
  ext a
  constructor
  · intro ha
    exact fixed_of_forall_mem_zpowers_of_sigmaMinusOne_eq_one
      (G := G) (A := A) (σ := σ) hgen (by simpa using ha)
  · intro ha
    change sigmaMinusOne G A σ a = 1
    simp [sigmaMinusOne, ha σ]
omit [CommGroup B] [CommGroup C]
    [MulDistribMulAction G B] [MulDistribMulAction G C] in
 

theorem card_eq_card_normKernelSubgroup_mul_card_tateNormSubgroup [Finite A] :
    Nat.card A = Nat.card (normKernelSubgroup G A) * Nat.card (tateNormSubgroup G A) := by
  simpa [normKernelSubgroup, tateNormSubgroup] using
    monoidHom_card_eq_card_ker_mul_card_range (tateNormHom (G := G) (A := A))
omit [Fintype G] [CommGroup B] [CommGroup C]
    [MulDistribMulAction G B] [MulDistribMulAction G C] in
 


theorem card_eq_card_fixedSubgroup_mul_card_augmentationSubgroup
    (σ : G) (hgen : ∀ g : G, g ∈ Subgroup.zpowers σ) [Finite A] :
    Nat.card A = Nat.card (fixedSubgroup G A) * Nat.card (augmentationSubgroup G A σ) := by
  simpa [sigmaMinusOneHom_ker_eq_fixedSubgroup (G := G) (A := A) σ hgen,
    augmentationSubgroup] using
    monoidHom_card_eq_card_ker_mul_card_range
      (sigmaMinusOneHom (G := G) (A := A) σ)
omit [CommGroup B] [CommGroup C]
    [MulDistribMulAction G B] [MulDistribMulAction G C] in
 

theorem herbrand_finite_module_cardinality_balance
    (σ : G) (hgen : ∀ g : G, g ∈ Subgroup.zpowers σ) [Finite A] :
    Nat.card (fixedSubgroup G A) * Nat.card (augmentationSubgroup G A σ) =
      Nat.card (normKernelSubgroup G A) * Nat.card (tateNormSubgroup G A) := by
  rw [← card_eq_card_fixedSubgroup_mul_card_augmentationSubgroup
      (G := G) (A := A) σ hgen,
    ← card_eq_card_normKernelSubgroup_mul_card_tateNormSubgroup (G := G) (A := A)]
 
def HerbrandH0 (G : Type uG) (A : Type uA) [Group G] [Fintype G] [CommGroup A]
    [MulDistribMulAction G A] : Type uA :=
  fixedSubgroup G A ⧸ (tateNormSubgroup G A).subgroupOf (fixedSubgroup G A)
 

def HerbrandHMinusOne (G : Type uG) (A : Type uA) [Group G] [Fintype G] [CommGroup A]
    [MulDistribMulAction G A] (σ : G) : Type uA :=
  normKernelSubgroup G A ⧸ (augmentationSubgroup G A σ).subgroupOf (normKernelSubgroup G A)
omit [CommGroup B] [CommGroup C]
    [MulDistribMulAction G B] [MulDistribMulAction G C] in
 
instance herbrandH0CommGroup : CommGroup (HerbrandH0 G A) := by
  unfold HerbrandH0
  infer_instance
omit [CommGroup B] [CommGroup C]
    [MulDistribMulAction G B] [MulDistribMulAction G C] in
 
instance herbrandHMinusOneCommGroup (σ : G) :
    CommGroup (HerbrandHMinusOne G A σ) := by
  unfold HerbrandHMinusOne
  infer_instance
omit [CommGroup B] [CommGroup C]
    [MulDistribMulAction G B] [MulDistribMulAction G C] in
 

def HerbrandH0.equiv :
    HerbrandH0 G A ≃*
      fixedSubgroup G A ⧸
        (tateNormSubgroup G A).subgroupOf (fixedSubgroup G A) := by
  change
    (fixedSubgroup G A ⧸
        (tateNormSubgroup G A).subgroupOf (fixedSubgroup G A)) ≃*
      fixedSubgroup G A ⧸
        (tateNormSubgroup G A).subgroupOf (fixedSubgroup G A)
  exact MulEquiv.refl _
omit [CommGroup B] [CommGroup C]
    [MulDistribMulAction G B] [MulDistribMulAction G C] in
 

def HerbrandHMinusOne.equiv (σ : G) :
    HerbrandHMinusOne G A σ ≃*
      normKernelSubgroup G A ⧸
        (augmentationSubgroup G A σ).subgroupOf (normKernelSubgroup G A) := by
  change
    (normKernelSubgroup G A ⧸
        (augmentationSubgroup G A σ).subgroupOf (normKernelSubgroup G A)) ≃*
      normKernelSubgroup G A ⧸
        (augmentationSubgroup G A σ).subgroupOf (normKernelSubgroup G A)
  exact MulEquiv.refl _
omit [CommGroup B] [CommGroup C]
    [MulDistribMulAction G B] [MulDistribMulAction G C] in
 
def HerbrandH0.mk : fixedSubgroup G A →* HerbrandH0 G A := by
  unfold HerbrandH0
  exact QuotientGroup.mk'
    ((tateNormSubgroup G A).subgroupOf (fixedSubgroup G A))
omit [CommGroup B] [CommGroup C]
    [MulDistribMulAction G B] [MulDistribMulAction G C] in
 
def HerbrandHMinusOne.mk (σ : G) :
    normKernelSubgroup G A →* HerbrandHMinusOne G A σ := by
  unfold HerbrandHMinusOne
  exact QuotientGroup.mk'
    ((augmentationSubgroup G A σ).subgroupOf (normKernelSubgroup G A))
omit [CommGroup B] [CommGroup C]
    [MulDistribMulAction G B] [MulDistribMulAction G C] in
 
@[simp]
theorem HerbrandH0.equiv_mk (a : fixedSubgroup G A) :
    HerbrandH0.equiv (G := G) (A := A) (HerbrandH0.mk a) =
      QuotientGroup.mk a := by
  rfl
omit [CommGroup B] [CommGroup C]
    [MulDistribMulAction G B] [MulDistribMulAction G C] in
 

@[simp]
theorem HerbrandHMinusOne.equiv_mk (σ : G) (a : normKernelSubgroup G A) :
    HerbrandHMinusOne.equiv (G := G) (A := A) σ
        (HerbrandHMinusOne.mk σ a) =
      QuotientGroup.mk a := by
  rfl
omit [CommGroup B] [CommGroup C]
    [MulDistribMulAction G B] [MulDistribMulAction G C] in
 
theorem HerbrandH0.mk_surjective :
    Function.Surjective (HerbrandH0.mk (G := G) (A := A)) := by
  intro q
  obtain ⟨a, ha⟩ := QuotientGroup.mk'_surjective
    ((tateNormSubgroup G A).subgroupOf (fixedSubgroup G A))
    (HerbrandH0.equiv (G := G) (A := A) q)
  refine ⟨a, (HerbrandH0.equiv (G := G) (A := A)).injective ?_⟩
  rw [HerbrandH0.equiv_mk]
  exact ha
omit [CommGroup B] [CommGroup C]
    [MulDistribMulAction G B] [MulDistribMulAction G C] in
 
theorem HerbrandHMinusOne.mk_surjective (σ : G) :
    Function.Surjective (HerbrandHMinusOne.mk (G := G) (A := A) σ) := by
  intro q
  obtain ⟨a, ha⟩ := QuotientGroup.mk'_surjective
    ((augmentationSubgroup G A σ).subgroupOf (normKernelSubgroup G A))
    (HerbrandHMinusOne.equiv (G := G) (A := A) σ q)
  refine ⟨a, (HerbrandHMinusOne.equiv (G := G) (A := A) σ).injective ?_⟩
  rw [HerbrandHMinusOne.equiv_mk]
  exact ha
omit [CommGroup B] [CommGroup C]
    [MulDistribMulAction G B] [MulDistribMulAction G C] in
 

@[simp]
theorem HerbrandH0.mk_eq_one_iff (a : fixedSubgroup G A) :
    HerbrandH0.mk a = 1 ↔ (a : A) ∈ tateNormSubgroup G A := by
  constructor
  · intro h
    have hraw :
        (QuotientGroup.mk a :
          fixedSubgroup G A ⧸
            (tateNormSubgroup G A).subgroupOf (fixedSubgroup G A)) = 1 := by
      simpa only [HerbrandH0.equiv_mk, map_one] using
        congrArg (HerbrandH0.equiv (G := G) (A := A)) h
    simpa only [Subgroup.mem_subgroupOf] using
      (QuotientGroup.eq_one_iff a).1 hraw
  · intro h
    apply (HerbrandH0.equiv (G := G) (A := A)).injective
    rw [HerbrandH0.equiv_mk, map_one]
    apply (QuotientGroup.eq_one_iff a).2
    simpa only [Subgroup.mem_subgroupOf] using h
omit [CommGroup B] [CommGroup C]
    [MulDistribMulAction G B] [MulDistribMulAction G C] in
 

@[simp]
theorem HerbrandHMinusOne.mk_eq_one_iff (σ : G)
    (a : normKernelSubgroup G A) :
    HerbrandHMinusOne.mk σ a = 1 ↔
      (a : A) ∈ augmentationSubgroup G A σ := by
  constructor
  · intro h
    have hraw :
        (QuotientGroup.mk a :
          normKernelSubgroup G A ⧸
            (augmentationSubgroup G A σ).subgroupOf (normKernelSubgroup G A)) = 1 := by
      simpa only [HerbrandHMinusOne.equiv_mk, map_one] using
        congrArg (HerbrandHMinusOne.equiv (G := G) (A := A) σ) h
    simpa only [Subgroup.mem_subgroupOf] using
      (QuotientGroup.eq_one_iff a).1 hraw
  · intro h
    apply (HerbrandHMinusOne.equiv (G := G) (A := A) σ).injective
    rw [HerbrandHMinusOne.equiv_mk, map_one]
    apply (QuotientGroup.eq_one_iff a).2
    simpa only [Subgroup.mem_subgroupOf] using h
omit [CommGroup B] [CommGroup C]
    [MulDistribMulAction G B] [MulDistribMulAction G C] in
 

protected theorem HerbrandHMinusOne.inductionOn (σ : G)
    {motive : HerbrandHMinusOne G A σ → Prop}
    (q : HerbrandHMinusOne G A σ)
    (h : ∀ a : normKernelSubgroup G A,
      motive (HerbrandHMinusOne.mk σ a)) : motive q := by
  obtain ⟨a, rfl⟩ :=
    HerbrandHMinusOne.mk_surjective (G := G) (A := A) σ q
  exact h a
omit [CommGroup B] [CommGroup C]
    [MulDistribMulAction G B] [MulDistribMulAction G C] in
 
noncomputable instance herbrandH0FiniteOfFinite [Finite A] :
    Finite (HerbrandH0 G A) := by
  exact Finite.of_equiv
    (fixedSubgroup G A ⧸
      (tateNormSubgroup G A).subgroupOf (fixedSubgroup G A))
    (HerbrandH0.equiv (G := G) (A := A)).symm.toEquiv
omit [CommGroup B] [CommGroup C]
    [MulDistribMulAction G B] [MulDistribMulAction G C] in
 
noncomputable instance herbrandHMinusOneFiniteOfFinite (σ : G) [Finite A] :
    Finite (HerbrandHMinusOne G A σ) := by
  exact Finite.of_equiv
    (normKernelSubgroup G A ⧸
      (augmentationSubgroup G A σ).subgroupOf (normKernelSubgroup G A))
    (HerbrandHMinusOne.equiv (G := G) (A := A) σ).symm.toEquiv
 

theorem tateNorm_sigmaMinusOne_eq_one (σ : G) (a : A) :
    tateNorm G A (sigmaMinusOne G A σ a) = 1 := by
  have hshift : (∏ g : G, (g * σ) • a) = ∏ g : G, g • a := by
    exact Fintype.prod_equiv (Equiv.mulRight σ)
      (fun g : G => (g * σ) • a) (fun g : G => g • a) (by intro g; rfl)
  calc
    tateNorm G A (sigmaMinusOne G A σ a) = ∏ g : G, ((g * σ) • a) * (g • a)⁻¹ := by
      unfold tateNorm sigmaMinusOne
      apply Finset.prod_congr rfl
      intro g _hg
      calc
        g • (σ • a * a⁻¹) = g • (σ • a) * g • a⁻¹ :=
          MulDistribMulAction.smul_mul g (σ • a) a⁻¹
        _ = (g * σ) • a * (g • a)⁻¹ := by
          rw [← SemigroupAction.mul_smul, smul_inv']
    _ = (∏ g : G, (g * σ) • a) * ∏ g : G, (g • a)⁻¹ := by
      exact Finset.prod_mul_distrib
    _ = 1 := by
      rw [hshift, Finset.prod_inv_distrib, mul_inv_cancel]
 
theorem augmentationSubgroup_le_normKernelSubgroup (σ : G) :
    augmentationSubgroup G A σ ≤ normKernelSubgroup G A := by
  intro a ha
  rcases ha with ⟨b, rfl⟩
  exact tateNorm_sigmaMinusOne_eq_one (G := G) (A := A) σ b
 

theorem smul_tateNorm_eq (h : G) (a : A) :
    h • tateNorm G A a = tateNorm G A a := by
  have hmap : h • (∏ g : G, g • a) = ∏ g : G, h • (g • a) := by
    exact map_prod (MulDistribMulAction.toMonoidHom A h) (fun g : G => g • a) Finset.univ
  have hshift : (∏ g : G, (h * g) • a) = ∏ g : G, g • a := by
    exact Fintype.prod_equiv (Equiv.mulLeft h)
      (fun g : G => (h * g) • a) (fun g : G => g • a) (by intro g; rfl)
  calc
    h • tateNorm G A a = ∏ g : G, h • (g • a) := by
      simpa [tateNorm] using hmap
    _ = ∏ g : G, (h * g) • a := by
      apply Finset.prod_congr rfl
      intro g _hg
      exact (SemigroupAction.mul_smul h g a).symm
    _ = tateNorm G A a := by
      simpa [tateNorm] using hshift
 
theorem tateNormSubgroup_le_fixedSubgroup :
    tateNormSubgroup G A ≤ fixedSubgroup G A := by
  intro a ha g
  rcases ha with ⟨b, rfl⟩
  exact smul_tateNorm_eq (G := G) (A := A) g b
omit [Fintype G] [CommGroup C] [MulDistribMulAction G C] in
 
theorem mulEquiv_symm_commutes_smul
    (e : A ≃* B)
    (he : ∀ (g : G) (a : A), e (g • a) = g • e a) :
    ∀ (g : G) (b : B), e.symm (g • b) = g • e.symm b := by
  intro g b
  apply e.injective
  calc
    e (e.symm (g • b)) = g • b := e.apply_symm_apply (g • b)
    _ = g • e (e.symm b) := by rw [e.apply_symm_apply]
    _ = e (g • e.symm b) := (he g (e.symm b)).symm
omit [CommGroup B] [CommGroup C]
    [MulDistribMulAction G B] [MulDistribMulAction G C] in
 
theorem card_fixedSubgroup_eq_card_herbrandH0_mul_card_tateNormSubgroup [Finite A] :
    Nat.card (fixedSubgroup G A) =
      Nat.card (HerbrandH0 G A) * Nat.card (tateNormSubgroup G A) := by
  simpa [HerbrandH0,
    card_subgroupOf_eq_card (tateNormSubgroup_le_fixedSubgroup (G := G) (A := A))] using
    (Subgroup.card_eq_card_quotient_mul_card_subgroup
      ((tateNormSubgroup G A).subgroupOf (fixedSubgroup G A)))
omit [CommGroup B] [CommGroup C]
    [MulDistribMulAction G B] [MulDistribMulAction G C] in
 

theorem card_normKernelSubgroup_eq_card_herbrandHMinusOne_mul_card_augmentationSubgroup
    (σ : G) [Finite A] :
    Nat.card (normKernelSubgroup G A) =
      Nat.card (HerbrandHMinusOne G A σ) *
        Nat.card (augmentationSubgroup G A σ) := by
  simpa [HerbrandHMinusOne,
    card_subgroupOf_eq_card (augmentationSubgroup_le_normKernelSubgroup (G := G) (A := A) σ)] using
    (Subgroup.card_eq_card_quotient_mul_card_subgroup
      ((augmentationSubgroup G A σ).subgroupOf (normKernelSubgroup G A)))
omit [CommGroup B] [CommGroup C]
    [MulDistribMulAction G B] [MulDistribMulAction G C] in
 

theorem herbrand_finite_module_card_eq
    (σ : G) (hgen : ∀ g : G, g ∈ Subgroup.zpowers σ) [Finite A] :
    Nat.card (HerbrandH0 G A) = Nat.card (HerbrandHMinusOne G A σ) := by
  have h0 := card_fixedSubgroup_eq_card_herbrandH0_mul_card_tateNormSubgroup
    (G := G) (A := A)
  have hm := card_normKernelSubgroup_eq_card_herbrandHMinusOne_mul_card_augmentationSubgroup
    (G := G) (A := A) σ
  have hbal := herbrand_finite_module_cardinality_balance
    (G := G) (A := A) σ hgen
  rw [h0, hm] at hbal
  have hfactor :
      Nat.card (HerbrandH0 G A) *
          (Nat.card (tateNormSubgroup G A) * Nat.card (augmentationSubgroup G A σ)) =
        Nat.card (HerbrandHMinusOne G A σ) *
          (Nat.card (tateNormSubgroup G A) * Nat.card (augmentationSubgroup G A σ)) := by
    calc
      Nat.card (HerbrandH0 G A) *
          (Nat.card (tateNormSubgroup G A) * Nat.card (augmentationSubgroup G A σ))
          =
          (Nat.card (HerbrandH0 G A) * Nat.card (tateNormSubgroup G A)) *
            Nat.card (augmentationSubgroup G A σ) := by
            ac_rfl
      _ = (Nat.card (HerbrandHMinusOne G A σ) *
            Nat.card (augmentationSubgroup G A σ)) *
            Nat.card (tateNormSubgroup G A) := hbal
      _ = Nat.card (HerbrandHMinusOne G A σ) *
          (Nat.card (tateNormSubgroup G A) * Nat.card (augmentationSubgroup G A σ)) := by
            ac_rfl
  have hNpos : 0 < Nat.card (tateNormSubgroup G A) :=
    Finite.card_pos (α := tateNormSubgroup G A)
  have hIpos : 0 < Nat.card (augmentationSubgroup G A σ) :=
    Finite.card_pos (α := augmentationSubgroup G A σ)
  exact Nat.mul_right_cancel (Nat.mul_pos hNpos hIpos) hfactor
end Herbrand
end ProfiniteCohomology
end
end CyclicCohomology
end

/- GaloisCohomology.Cyclic.TateComparison -/
section
noncomputable section
open CategoryTheory
namespace TateCohomology
universe u
 

def isoZeroBoundary {R G : Type u} [CommRing R] [Group G] [Fintype G]
    (A : Rep R G) :
    tateCohomology A 0 ≅
      (ShortComplex.mk A.norm.toModuleCatHom (groupCohomology.d₀₁ A)
        (Rep.norm_comp_d_eq_zero A)).homology := by
  let S : ShortComplex (ModuleCat R) :=
    .mk A.norm.toModuleCatHom (groupCohomology.d₀₁ A)
      (Rep.norm_comp_d_eq_zero A)
  let eS : (tateComplex A).sc 0 ≅ S :=
    (tateComplex A).isoSc' (-1) 0 1 (by simp) (by simp) ≪≫
      ShortComplex.isoMk
        (by exact groupHomology.chainsIso₀ A)
        (groupCohomology.cochainsIso₀ A)
        (groupCohomology.cochainsIso₁ A)
        (by
          change
            CategoryTheory.CategoryStruct.comp (groupHomology.chainsIso₀ A).hom A.norm.toModuleCatHom =
              CategoryTheory.CategoryStruct.comp A.tateNorm (groupCohomology.cochainsIso₀ A).hom
          rw [Rep.tateNorm]
          simp)
        (groupCohomology.comp_d₀₁_eq A)
  exact ShortComplex.homologyMapIso eS
 

def isoFiniteCyclicZero {R G : Type u} [CommRing R] [CommGroup G] [Fintype G]
    (A : Rep R G) (g : G) (hg : ∀ x, x ∈ Subgroup.zpowers g) :
    tateCohomology A 0 ≅
      (Rep.FiniteCyclicGroup.normHomCompSub A g).homology := by
  let S : ShortComplex (ModuleCat R) :=
    .mk A.norm.toModuleCatHom (groupCohomology.d₀₁ A)
      (Rep.norm_comp_d_eq_zero A)
  let T := Rep.FiniteCyclicGroup.normHomCompSub A g
  have hker : LinearMap.ker S.g.hom = LinearMap.ker T.g.hom := by
    dsimp [S, T]
    rw [groupCohomology.d₀₁_ker_eq_invariants]
    ext x
    simpa [Rep.sub_hom, sub_eq_zero] using
      Representation.mem_invariants_iff_of_forall_mem_zpowers A.ρ g hg x
  let eK : LinearMap.ker S.g.hom ≃ₗ[R] LinearMap.ker T.g.hom :=
    LinearEquiv.ofEq _ _ hker
  have hboundary :
      (LinearMap.range S.moduleCatToCycles).map eK.toLinearMap =
        LinearMap.range T.moduleCatToCycles := by
    ext x
    constructor
    · rintro ⟨y, ⟨z, rfl⟩, rfl⟩
      refine ⟨z, ?_⟩
      apply Subtype.ext
      rfl
    · rintro ⟨z, rfl⟩
      refine ⟨S.moduleCatToCycles z, ⟨z, rfl⟩, ?_⟩
      apply Subtype.ext
      rfl
  let eQ : S.moduleCatLeftHomologyData.H ≅ T.moduleCatLeftHomologyData.H :=
    (Submodule.Quotient.equiv _ _ eK hboundary).toModuleIso
  exact isoZeroBoundary A ≪≫
    S.moduleCatHomologyIso ≪≫ eQ ≪≫ T.moduleCatHomologyIso.symm
 

def isoFiniteCyclicNegOne {R G : Type u} [CommRing R] [CommGroup G] [Fintype G]
    (A : Rep R G) (g : G) (hg : ∀ x, x ∈ Subgroup.zpowers g) :
    tateCohomology A (-1) ≅
      (Rep.FiniteCyclicGroup.subCompNormHom A g).homology := by
  let S : ShortComplex (ModuleCat R) :=
    .mk (groupHomology.d₁₀ A) A.norm.toModuleCatHom (Rep.comp_eq_zero A)
  let eS : (tateComplex A).sc (-1) ≅ S :=
    (tateComplex A).isoSc' (-2) (-1) 0 (by simp) (by simp) ≪≫
      ShortComplex.isoMk
        (groupHomology.chainsIso₁ A)
        (groupHomology.chainsIso₀ A)
        (groupCohomology.cochainsIso₀ A)
        (groupHomology.comp_d₁₀_eq A)
        (by simp [S, tateComplex, Rep.tateNorm]; rfl)
  let T := Rep.FiniteCyclicGroup.subCompNormHom A g
  have hRange : LinearMap.range S.f.hom = LinearMap.range T.f.hom := by
    dsimp [S, T]
    rw [groupHomology.range_d₁₀_eq_coinvariantsKer]
    exact Representation.FiniteCyclicGroup.coinvariantsKer_eq_range A.ρ g hg
  let eK : LinearMap.ker S.g.hom ≃ₗ[R] LinearMap.ker T.g.hom :=
    LinearEquiv.ofEq _ _ rfl
  have hboundary :
      (LinearMap.range S.moduleCatToCycles).map eK.toLinearMap =
        LinearMap.range T.moduleCatToCycles := by
    ext x
    constructor
    · rintro ⟨y, ⟨z, rfl⟩, rfl⟩
      have hz : S.f z ∈ LinearMap.range T.f.hom := by
        rw [← hRange]
        exact ⟨z, rfl⟩
      rcases hz with ⟨w, hw⟩
      refine ⟨w, ?_⟩
      apply Subtype.ext
      exact hw
    · rintro ⟨w, rfl⟩
      have hw : T.f w ∈ LinearMap.range S.f.hom := by
        rw [hRange]
        exact ⟨w, rfl⟩
      rcases hw with ⟨z, hz⟩
      refine ⟨S.moduleCatToCycles z, ⟨z, rfl⟩, ?_⟩
      apply Subtype.ext
      exact hz
  let eQ : S.moduleCatLeftHomologyData.H ≅ T.moduleCatLeftHomologyData.H :=
    (Submodule.Quotient.equiv _ _ eK hboundary).toModuleIso
  exact ShortComplex.homologyMapIso eS ≪≫
    S.moduleCatHomologyIso ≪≫ eQ ≪≫ T.moduleCatHomologyIso.symm
end TateCohomology
end
end

/- GaloisCohomology.Cyclic.Herbrand.HerbrandLowDegree.TateComparison -/
section
open CategoryTheory
namespace CyclicCohomology.ProfiniteCohomology.Herbrand
noncomputable section
universe u w
private theorem repExact_of_hom_exact {k G : Type u} [CommRing k] [Group G]
    (S : ShortComplex (Rep.{w} k G))
    (h : ∀ b : S.X₂, S.g.hom b = 0 → ∃ a : S.X₁, S.f.hom a = b) :
    S.Exact :=
  (forget₂ (Rep.{w} k G) (ModuleCat.{w} k)).reflects_exact_of_faithful _ <|
    (ShortComplex.moduleCat_exact_iff _).2 h
variable {G A B C : Type}
variable [Group G] [Fintype G] [CommGroup A] [CommGroup B] [CommGroup C]
variable [MulDistribMulAction G A] [MulDistribMulAction G B]
  [MulDistribMulAction G C]
 

def equivariantRepHom (f : A →* B)
    (hf : ∀ (g : G) (a : A), f (g • a) = g • f a) :
    Rep.ofMulDistribMulAction G A ⟶ Rep.ofMulDistribMulAction G B :=
  Rep.ofHom <|
    (MonoidHom.toAdditive f).toIntLinearMap.intertwiningMap_of_isIntertwiningMap
      (Rep.ofMulDistribMulAction G A).ρ
      (Rep.ofMulDistribMulAction G B).ρ <| by
      intro g a
      apply Additive.ofMul.injective
      exact hf g a.toMul
 

def equivariantShortComplex
    (i : A →* B) (j : B →* C)
    (hi : ∀ (g : G) (a : A), i (g • a) = g • i a)
    (hj : ∀ (g : G) (b : B), j (g • b) = g • j b)
    (hker : ∀ b : B, j b = 1 ↔ ∃ a : A, i a = b) :
    ShortComplex (Rep ℤ G) :=
  ShortComplex.mk (equivariantRepHom i hi) (equivariantRepHom j hj) <| by
    apply Rep.hom_ext
    ext a
    change Additive.ofMul (j (i a.toMul)) = 0
    apply Additive.ofMul.injective
    exact (hker (i a.toMul)).2 ⟨a.toMul, rfl⟩
omit [Fintype G] in
theorem equivariantShortComplex_shortExact
    (i : A →* B) (j : B →* C)
    (hi : ∀ (g : G) (a : A), i (g • a) = g • i a)
    (hj : ∀ (g : G) (b : B), j (g • b) = g • j b)
    (hker : ∀ b : B, j b = 1 ↔ ∃ a : A, i a = b)
    (hinj : Function.Injective i) (hsurj : Function.Surjective j) :
    (equivariantShortComplex i j hi hj hker).ShortExact := by
  refine
    { exact := repExact_of_hom_exact _ ?_
      mono_f := (Rep.mono_iff_injective _).2 ?_
      epi_g := (Rep.epi_iff_surjective _).2 ?_ }
  · intro b hb
    change Additive.ofMul (j b.toMul) = 0 at hb
    have hb' : j b.toMul = 1 := Additive.ofMul.injective hb
    rcases (hker b.toMul).1 hb' with ⟨a, ha⟩
    refine ⟨Additive.ofMul a, ?_⟩
    change Additive.ofMul (i a) = b
    apply Additive.toMul.injective
    exact ha
  · intro a a' h
    change Additive.ofMul (i a.toMul) = Additive.ofMul (i a'.toMul) at h
    apply Additive.toMul.injective
    apply hinj
    exact Additive.ofMul.injective h
  · intro c
    rcases hsurj c.toMul with ⟨b, hb⟩
    refine ⟨Additive.ofMul b, ?_⟩
    change Additive.ofMul (j b) = c
    apply Additive.toMul.injective
    exact hb
private theorem repNorm_toMul (a : Additive A) :
    Additive.toMul
        ((Rep.ofMulDistribMulAction G A).ρ.norm a) =
      tateNorm G A a.toMul := by
  unfold Rep.ofMulDistribMulAction
  change Additive.toMul
      ((Representation.ofMulDistribMulAction G A).norm a) =
    ∏ g : G, g • a.toMul
  exact Representation.norm_ofMulDistribMulAction_eq a
private theorem repSigmaMinusOne_toMul
    {G A : Type} [CommGroup G] [CommGroup A]
    [MulDistribMulAction G A] (σ : G) (a : Additive A) :
    Additive.toMul
        ((Rep.toAdditive (M := G) (G := A))
          (((Rep.ofMulDistribMulAction G A).applyAsHom σ -
            𝟙 (Rep.ofMulDistribMulAction G A)).hom a)) =
      sigmaMinusOne G A σ a.toMul := by
  unfold Rep.toAdditive
  unfold Rep.ofMulDistribMulAction
  rw [Rep.sub_hom]
  rw [show
    (Rep.Hom.hom
        ((Rep.of (Representation.ofMulDistribMulAction G A)).applyAsHom σ) -
      Rep.Hom.hom
        (𝟙 (Rep.of (Representation.ofMulDistribMulAction G A)))) a =
        Rep.Hom.hom
            ((Rep.of (Representation.ofMulDistribMulAction G A)).applyAsHom σ) a -
          Rep.Hom.hom
            (𝟙 (Rep.of (Representation.ofMulDistribMulAction G A))) a by
    rfl]
  rw [Rep.applyAsHom_apply]
  rw [show
    Rep.Hom.hom
        (𝟙 (Rep.of (Representation.ofMulDistribMulAction G A))) a = a by
    rfl]
  unfold sigmaMinusOne
  rw [show
    ((Rep.of (Representation.ofMulDistribMulAction G A)).ρ σ) a =
      Additive.ofMul (σ • a.toMul) by
    rfl]
  change Additive.toMul
      (Additive.ofMul (σ • a.toMul) - a) =
    σ • a.toMul * (a.toMul)⁻¹
  rw [toMul_sub]
  exact div_eq_mul_inv _ _
private def fixedCyclesAddEquiv :
    LinearMap.ker
        (groupCohomology.d₀₁ (Rep.ofMulDistribMulAction G A)).hom ≃+
      Additive (fixedSubgroup G A) where
  toFun x :=
    Additive.ofMul
      ⟨x.1.toMul, by
        have hx : x.1 ∈ (Rep.ofMulDistribMulAction G A).ρ.invariants := by
          rw [← groupCohomology.d₀₁_ker_eq_invariants]
          exact x.2
        intro g
        apply Additive.ofMul.injective
        exact hx g⟩
  invFun x :=
    ⟨Additive.ofMul x.toMul.1, by
      rw [groupCohomology.d₀₁_ker_eq_invariants]
      intro g
      apply Additive.ofMul.injective
      exact x.toMul.2 g⟩
  left_inv x := by
    apply Subtype.ext
    rfl
  right_inv x := by
    apply Additive.ofMul.injective
    apply Subtype.ext
    rfl
  map_add' x y := by
    apply Additive.ofMul.injective
    apply Subtype.ext
    rfl
 

noncomputable def tateH0IsoHerbrandH0 :
    tateCohomology (Rep.ofMulDistribMulAction G A) 0 ≅
      ModuleCat.of ℤ (Additive (HerbrandH0 G A)) := by
  let M := Rep.ofMulDistribMulAction G A
  let S : ShortComplex (ModuleCat ℤ) :=
    ShortComplex.mk M.norm.toModuleCatHom (groupCohomology.d₀₁ M)
      (Rep.norm_comp_d_eq_zero M)
  let eKOwner :
      S.moduleCatLeftHomologyData.K ≅
        ModuleCat.of ℤ
          (LinearMap.ker
            (groupCohomology.d₀₁ (Rep.ofMulDistribMulAction G A)).hom) :=
    eqToIso (by rfl)
  let eK :=
    (eKOwner ≪≫
      ((fixedCyclesAddEquiv (G := G) (A := A)).toIntLinearEquiv
        (modM := inferInstance) (modM₂ := inferInstance)).toModuleIso).toLinearEquiv
  let q : Additive (fixedSubgroup G A) →+ Additive (HerbrandH0 G A) :=
    MonoidHom.toAdditive (HerbrandH0.mk (G := G) (A := A))
  have hboundary :
      (LinearMap.range S.moduleCatToCycles).map eK.toLinearMap =
        q.ker.toIntSubmodule := by
    ext x
    constructor
    · rintro ⟨y, ⟨a, ha⟩, rfl⟩
      subst y
      change Additive A at a
      change q (eK (S.moduleCatToCycles a)) = 0
      apply Additive.ofMul.injective
      change HerbrandH0.mk _ = 1
      apply (HerbrandH0.mk_eq_one_iff _).2
      refine ⟨a.toMul, ?_⟩
      dsimp [eK, fixedCyclesAddEquiv, S, M]
      exact (repNorm_toMul (G := G) (A := A) a).symm
    · intro hx
      change q x = 0 at hx
      have hx' : HerbrandH0.mk x.toMul = 1 := by
        apply Additive.ofMul.injective
        exact hx
      rcases (HerbrandH0.mk_eq_one_iff x.toMul).1 hx' with ⟨a, ha⟩
      refine ⟨eK.symm x, ?_, eK.apply_symm_apply x⟩
      refine ⟨Additive.ofMul a, ?_⟩
      apply eK.injective
      rw [eK.apply_symm_apply]
      apply Additive.toMul.injective
      apply Subtype.ext
      have hnorm :
          Additive.toMul
              ((Representation.ofMulDistribMulAction G A).norm
                (Additive.ofMul a)) =
            x.toMul.1 :=
        (Representation.norm_ofMulDistribMulAction_eq
          (G := G) (M := A) (Additive.ofMul a)).trans <| by
            rw [show Additive.toMul (Additive.ofMul a) = a by rfl]
            simpa only [tateNormHom_apply, tateNorm] using ha
      dsimp [eK, fixedCyclesAddEquiv, S, M]
      unfold Rep.ofMulDistribMulAction
      exact hnorm
  let eQ :=
    (Submodule.Quotient.equiv (LinearMap.range S.moduleCatToCycles)
      q.ker.toIntSubmodule eK hboundary).trans
      ((QuotientAddGroup.quotientKerEquivOfSurjective q
        (HerbrandH0.mk_surjective (G := G) (A := A))).toIntLinearEquiv
          (modM₂ := inferInstance))
  exact TateCohomology.isoZeroBoundary M ≪≫
    S.moduleCatHomologyIso ≪≫ eQ.toModuleIso
private def normKernelCyclesAddEquiv :
    LinearMap.ker
        (Rep.ofMulDistribMulAction G A).norm.toModuleCatHom.hom ≃+
      Additive (normKernelSubgroup G A) where
  toFun x :=
    let a : Additive A := x.1
    Additive.ofMul
      ⟨a.toMul, by
        change tateNorm G A a.toMul = 1
        have hx := x.2
        change (Rep.ofMulDistribMulAction G A).ρ.norm a = 0 at hx
        exact (repNorm_toMul (G := G) (A := A) a).symm.trans <| by
          rw [hx]
          rfl⟩
  invFun x :=
    let a : Additive A := Additive.ofMul x.toMul.1
    ⟨a, by
      have hx0 := x.toMul.2
      change tateNorm G A x.toMul.1 = 1 at hx0
      have hx : tateNorm G A a.toMul = 1 := hx0
      change (Rep.ofMulDistribMulAction G A).ρ.norm a = 0
      unfold Rep.ofMulDistribMulAction
      apply Additive.toMul.injective
      change Additive.toMul
          ((Representation.ofMulDistribMulAction G A).norm a) = (1 : A)
      exact
        (Representation.norm_ofMulDistribMulAction_eq
          (G := G) (M := A) a).trans <| by
            simpa [tateNorm] using hx⟩
  left_inv x := by
    apply Subtype.ext
    rfl
  right_inv x := by
    apply Additive.ofMul.injective
    apply Subtype.ext
    rfl
  map_add' x y := by
    apply Additive.ofMul.injective
    apply Subtype.ext
    rfl
private noncomputable def tateHMinusOneIsoHerbrandHMinusOne_of_commGroup
    {G A : Type} [CommGroup G] [Fintype G] [CommGroup A]
    [MulDistribMulAction G A]
    (σ : G) (hgen : ∀ g : G, g ∈ Subgroup.zpowers σ) :
    tateCohomology (Rep.ofMulDistribMulAction G A) (-1) ≅
      ModuleCat.of ℤ (Additive (HerbrandHMinusOne G A σ)) := by
  let M := Rep.ofMulDistribMulAction G A
  let S := Rep.FiniteCyclicGroup.subCompNormHom M σ
  let eKOwner :
      S.moduleCatLeftHomologyData.K ≅
        ModuleCat.of ℤ
          (LinearMap.ker
            (Rep.ofMulDistribMulAction G A).norm.toModuleCatHom.hom) :=
    eqToIso (by rfl)
  let eK :=
    (eKOwner ≪≫
      ((normKernelCyclesAddEquiv (G := G) (A := A)).toIntLinearEquiv
        (modM := inferInstance) (modM₂ := inferInstance)).toModuleIso).toLinearEquiv
  let q : Additive (normKernelSubgroup G A) →+
      Additive (HerbrandHMinusOne G A σ) :=
    MonoidHom.toAdditive (HerbrandHMinusOne.mk (G := G) (A := A) σ)
  have hboundary :
      (LinearMap.range S.moduleCatToCycles).map eK.toLinearMap =
        q.ker.toIntSubmodule := by
    ext x
    constructor
    · rintro ⟨y, ⟨a, ha⟩, rfl⟩
      subst y
      change Additive A at a
      change q (eK (S.moduleCatToCycles a)) = 0
      apply Additive.ofMul.injective
      change HerbrandHMinusOne.mk σ _ = 1
      apply (HerbrandHMinusOne.mk_eq_one_iff σ _).2
      refine ⟨a.toMul, ?_⟩
      dsimp [eK, normKernelCyclesAddEquiv, S, M]
      exact (repSigmaMinusOne_toMul
        (G := G) (A := A) σ a).symm
    · intro hx
      change q x = 0 at hx
      have hx' : HerbrandHMinusOne.mk σ x.toMul = 1 := by
        apply Additive.ofMul.injective
        exact hx
      rcases (HerbrandHMinusOne.mk_eq_one_iff σ x.toMul).1 hx' with ⟨a, ha⟩
      refine ⟨eK.symm x, ?_, eK.apply_symm_apply x⟩
      refine ⟨Additive.ofMul a, ?_⟩
      apply eK.injective
      rw [eK.apply_symm_apply]
      apply Additive.toMul.injective
      apply Subtype.ext
      dsimp [eK, normKernelCyclesAddEquiv, S, M]
      have hσ := repSigmaMinusOne_toMul
        (G := G) (A := A) σ (Additive.ofMul a)
      rw [show Additive.toMul (Additive.ofMul a) = a by rfl] at hσ
      exact hσ.trans ha
  let eQ :=
    (Submodule.Quotient.equiv (LinearMap.range S.moduleCatToCycles)
      q.ker.toIntSubmodule eK hboundary).trans
      ((QuotientAddGroup.quotientKerEquivOfSurjective q
        (HerbrandHMinusOne.mk_surjective (G := G) (A := A) σ)).toIntLinearEquiv
          (modM₂ := inferInstance))
  exact TateCohomology.isoFiniteCyclicNegOne M σ hgen ≪≫
    S.moduleCatHomologyIso ≪≫ eQ.toModuleIso
 

noncomputable def tateHMinusOneIsoHerbrandHMinusOne
    (σ : G) (hgen : ∀ g : G, g ∈ Subgroup.zpowers σ) :
    tateCohomology (Rep.ofMulDistribMulAction G A) (-1) ≅
      ModuleCat.of ℤ (Additive (HerbrandHMinusOne G A σ)) := by
  letI : IsCyclic G := ⟨⟨σ, hgen⟩⟩
  letI : CommGroup G := IsCyclic.commGroup
  exact tateHMinusOneIsoHerbrandHMinusOne_of_commGroup σ hgen
end
end CyclicCohomology.ProfiniteCohomology.Herbrand
end

/- GaloisCohomology.Cyclic.Herbrand.HerbrandLowDegree.Cardinality -/
section
namespace CyclicCohomology
noncomputable section
namespace ProfiniteCohomology
namespace Herbrand
open CategoryTheory
variable {G A B C : Type}
section
variable [CommGroup G] [Fintype G]
variable [CommGroup A] [CommGroup B] [CommGroup C]
variable [MulDistribMulAction G A] [MulDistribMulAction G B]
  [MulDistribMulAction G C]
private noncomputable def subCompNormMap
    (σ : G) (f : A →* B)
    (hf : ∀ (g : G) (a : A), f (g • a) = g • f a) :
    Rep.FiniteCyclicGroup.subCompNormHom
        (Rep.ofMulDistribMulAction G A) σ ⟶
      Rep.FiniteCyclicGroup.subCompNormHom
        (Rep.ofMulDistribMulAction G B) σ where
  τ₁ := (equivariantRepHom f hf).toModuleCatHom
  τ₂ := (equivariantRepHom f hf).toModuleCatHom
  τ₃ := (equivariantRepHom f hf).toModuleCatHom
  comm₁₂ := by
    ext a
    change Additive A at a
    change
      Additive.ofMul ((σ • f a.toMul) / f a.toMul) =
        Additive.ofMul (f ((σ • a.toMul) / a.toMul))
    exact congrArg Additive.ofMul (by rw [map_div, hf])
  comm₂₃ := by
    ext a
    apply Additive.ofMul.injective
    simp [Rep.FiniteCyclicGroup.subCompNormHom, Rep.norm,
      Representation.norm, Rep.hom_comm_apply]
private noncomputable def periodicChainMap
    (σ : G) (f : A →* B)
    (hf : ∀ (g : G) (a : A), f (g • a) = g • f a) :
    Rep.FiniteCyclicGroup.moduleCatChainComplex
        (Rep.ofMulDistribMulAction G A) σ ⟶
      Rep.FiniteCyclicGroup.moduleCatChainComplex
        (Rep.ofMulDistribMulAction G B) σ where
  f _ := (equivariantRepHom f hf).toModuleCatHom
  comm' := by
    rintro i j ⟨rfl⟩
    by_cases hj : Even (j + 1)
    · simp [Rep.FiniteCyclicGroup.moduleCatChainComplex,
        HomologicalComplex.alternatingConst, hj]
      exact (subCompNormMap σ f hf).comm₂₃
    · simp [Rep.FiniteCyclicGroup.moduleCatChainComplex,
        HomologicalComplex.alternatingConst, hj]
      exact (subCompNormMap σ f hf).comm₁₂
private noncomputable def periodicShortComplex
    (σ : G)
    (i : A →* B) (j : B →* C)
    (hi : ∀ (g : G) (a : A), i (g • a) = g • i a)
    (hj : ∀ (g : G) (b : B), j (g • b) = g • j b)
    (hker : ∀ b : B, j b = 1 ↔ ∃ a : A, i a = b) :
    ShortComplex (ChainComplex (ModuleCat ℤ) ℕ) :=
  ShortComplex.mk (periodicChainMap σ i hi) (periodicChainMap σ j hj) <| by
    apply HomologicalComplex.hom_ext
    intro n
    ext a
    change Additive.ofMul (j (i a.toMul)) = 0
    apply Additive.ofMul.injective
    exact (hker (i a.toMul)).2 ⟨a.toMul, rfl⟩
private theorem periodicShortComplex_shortExact
    (σ : G)
    (i : A →* B) (j : B →* C)
    (hi : ∀ (g : G) (a : A), i (g • a) = g • i a)
    (hj : ∀ (g : G) (b : B), j (g • b) = g • j b)
    (hker : ∀ b : B, j b = 1 ↔ ∃ a : A, i a = b)
    (hinj : Function.Injective i) (hsurj : Function.Surjective j) :
    (periodicShortComplex σ i j hi hj hker).ShortExact := by
  rw [HomologicalComplex.shortExact_iff_degreewise_shortExact]
  intro n
  refine
    { exact := ?_
      mono_f := (ModuleCat.mono_iff_injective _).2 ?_
      epi_g := (ModuleCat.epi_iff_surjective _).2 ?_ }
  · apply (ShortComplex.moduleCat_exact_iff _).2
    intro b hb
    change Additive.ofMul (j b.toMul) = 0 at hb
    have hb' : j b.toMul = 1 := Additive.ofMul.injective hb
    rcases (hker b.toMul).1 hb' with ⟨a, ha⟩
    refine ⟨Additive.ofMul a, ?_⟩
    apply Additive.toMul.injective
    exact ha
  · intro a a' ha
    apply Additive.toMul.injective
    apply hinj
    exact Additive.ofMul.injective ha
  · intro c
    rcases hsurj c.toMul with ⟨b, hb⟩
    refine ⟨Additive.ofMul b, ?_⟩
    apply Additive.toMul.injective
    exact hb
private noncomputable def periodicScIsoEven
    {R H : Type} [CommRing R] [CommGroup H] [Fintype H]
    (M : Rep R H) (τ : H)
    {n : ℕ} [h₀ : NeZero n] (hn : Even n) :
    (Rep.FiniteCyclicGroup.moduleCatChainComplex M τ).sc n ≅
      Rep.FiniteCyclicGroup.subCompNormHom M τ :=
  HomologicalComplex.alternatingConstScIsoEven
    (ModuleCat.of R M.V)
    (by ext; simp [Rep.sub_hom, Rep.applyAsHom, Rep.norm])
    (by ext; simp [Rep.sub_hom, Rep.applyAsHom, Rep.norm])
    (fun _ _ => ComplexShape.down_nat_odd_add)
    (by simp)
    (by
      induction n generalizing h₀ with
      | zero => exact (NeZero.ne 0 rfl).elim
      | succ n _ => simp)
    hn
private noncomputable def periodicScIsoOdd
    {R H : Type} [CommRing R] [CommGroup H] [Fintype H]
    (M : Rep R H) (τ : H) {n : ℕ} (hn : Odd n) :
    (Rep.FiniteCyclicGroup.moduleCatChainComplex M τ).sc n ≅
      Rep.FiniteCyclicGroup.normHomCompSub M τ :=
  HomologicalComplex.alternatingConstScIsoOdd
    (ModuleCat.of R M.V)
    (by ext; simp [Rep.sub_hom, Rep.applyAsHom, Rep.norm])
    (by ext; simp [Rep.sub_hom, Rep.applyAsHom, Rep.norm])
    (fun _ _ => ComplexShape.down_nat_odd_add)
    (by simp)
    (by rcases hn with ⟨m, rfl⟩; simp)
    hn
private noncomputable def periodicHomologyIsoEven
    {R H : Type} [CommRing R] [CommGroup H] [Fintype H]
    (M : Rep R H) (τ : H)
    {n : ℕ} [NeZero n] (hn : Even n) :
    (Rep.FiniteCyclicGroup.moduleCatChainComplex M τ).homology n ≅
      (Rep.FiniteCyclicGroup.subCompNormHom M τ).homology :=
  ShortComplex.homologyMapIso (periodicScIsoEven M τ hn)
private noncomputable def periodicHomologyIsoOdd
    {R H : Type} [CommRing R] [CommGroup H] [Fintype H]
    (M : Rep R H) (τ : H) {n : ℕ} (hn : Odd n) :
    (Rep.FiniteCyclicGroup.moduleCatChainComplex M τ).homology n ≅
      (Rep.FiniteCyclicGroup.normHomCompSub M τ).homology :=
  ShortComplex.homologyMapIso (periodicScIsoOdd M τ hn)
private noncomputable def periodicEvenHerbrandHMinusOneIso
    (σ : G) (hgen : ∀ g : G, g ∈ Subgroup.zpowers σ)
    {n : ℕ} [NeZero n] (hn : Even n) :
    (Rep.FiniteCyclicGroup.moduleCatChainComplex
        (Rep.ofMulDistribMulAction G A) σ).homology n ≅
      ModuleCat.of ℤ (Additive (HerbrandHMinusOne G A σ)) :=
  periodicHomologyIsoEven (Rep.ofMulDistribMulAction G A) σ hn ≪≫
    (TateCohomology.isoFiniteCyclicNegOne
      (Rep.ofMulDistribMulAction G A) σ hgen).symm ≪≫
    tateHMinusOneIsoHerbrandHMinusOne σ hgen
private noncomputable def periodicOddHerbrandHZeroIso
    (σ : G) (hgen : ∀ g : G, g ∈ Subgroup.zpowers σ)
    {n : ℕ} (hn : Odd n) :
    (Rep.FiniteCyclicGroup.moduleCatChainComplex
        (Rep.ofMulDistribMulAction G A) σ).homology n ≅
      ModuleCat.of ℤ (Additive (HerbrandH0 G A)) :=
  periodicHomologyIsoOdd (Rep.ofMulDistribMulAction G A) σ hn ≪≫
    (TateCohomology.isoFiniteCyclicZero
      (Rep.ofMulDistribMulAction G A) σ hgen).symm ≪≫
    tateH0IsoHerbrandH0
private theorem periodicScIsoEven_naturality
    (σ : G) {n : ℕ} [NeZero n] (hn : Even n)
    (f : A →* B)
    (hf : ∀ (g : G) (a : A), f (g • a) = g • f a) :
    CategoryTheory.CategoryStruct.comp (ShortComplex.homologyMap
          (periodicScIsoEven
            (Rep.ofMulDistribMulAction G A) σ hn).inv) (CategoryTheory.CategoryStruct.comp (ShortComplex.homologyMap
          ((HomologicalComplex.shortComplexFunctor
            (ModuleCat ℤ) (ComplexShape.down ℕ) n).map
              (periodicChainMap σ f hf))) (ShortComplex.homologyMap
          (periodicScIsoEven
            (Rep.ofMulDistribMulAction G B) σ hn).hom)) =
      ShortComplex.homologyMap (subCompNormMap σ f hf) := by
  rw [← ShortComplex.homologyMap_comp, ← ShortComplex.homologyMap_comp]
  congr 1
private theorem periodicHomologyIsoEven_naturality
    (σ : G) {n : ℕ} [NeZero n] (hn : Even n)
    (f : A →* B)
    (hf : ∀ (g : G) (a : A), f (g • a) = g • f a) :
    CategoryTheory.CategoryStruct.comp ((periodicHomologyIsoEven
      (Rep.ofMulDistribMulAction G A) σ hn).inv) (CategoryTheory.CategoryStruct.comp (HomologicalComplex.homologyMap (periodicChainMap σ f hf) n) ((periodicHomologyIsoEven
          (Rep.ofMulDistribMulAction G B) σ hn).hom)) =
      ShortComplex.homologyMap (subCompNormMap σ f hf) :=
  periodicScIsoEven_naturality σ hn f hf
 

noncomputable def moduleCatRangeEquivOfConjugate
    {X Y X' Y' : ModuleCat.{0} ℤ}
    (f : X ⟶ Y) (g : X' ⟶ Y')
    (eX : X ≅ X') (eY : Y ≅ Y')
    (h : CategoryTheory.CategoryStruct.comp eX.inv (CategoryTheory.CategoryStruct.comp f eY.hom) = g) :
    MonoidHom.range f.hom.toAddMonoidHom.toMultiplicative ≃
      MonoidHom.range g.hom.toAddMonoidHom.toMultiplicative := by
  have hnat : CategoryTheory.CategoryStruct.comp f eY.hom = CategoryTheory.CategoryStruct.comp eX.hom g := by
    rw [← cancel_epi eX.inv]
    simpa only [Category.assoc, eX.inv_hom_id_assoc] using h
  have hinv : CategoryTheory.CategoryStruct.comp eX.inv f = CategoryTheory.CategoryStruct.comp g eY.inv := by
    rw [← cancel_mono eY.hom]
    simpa only [Category.assoc, eY.inv_hom_id, Category.comp_id] using h
  refine
    { toFun := fun y => ⟨Multiplicative.ofAdd (eY.hom y.1.toAdd), ?_⟩
      invFun := fun y => ⟨Multiplicative.ofAdd (eY.inv y.1.toAdd), ?_⟩
      left_inv := ?_
      right_inv := ?_ }
  · rcases y.2 with ⟨x, hx⟩
    refine ⟨Multiplicative.ofAdd (eX.hom x.toAdd), ?_⟩
    apply Multiplicative.toAdd.injective
    change g (eX.hom x.toAdd) = eY.hom y.1.toAdd
    have hx' : f x.toAdd = y.1.toAdd :=
      congrArg Multiplicative.toAdd hx
    rw [← hx']
    exact (congrArg (fun k : X ⟶ Y' => k x.toAdd) hnat).symm
  · rcases y.2 with ⟨x, hx⟩
    refine ⟨Multiplicative.ofAdd (eX.inv x.toAdd), ?_⟩
    apply Multiplicative.toAdd.injective
    change f (eX.inv x.toAdd) = eY.inv y.1.toAdd
    have hx' : g x.toAdd = y.1.toAdd :=
      congrArg Multiplicative.toAdd hx
    rw [← hx']
    exact congrArg (fun k : X' ⟶ Y => k x.toAdd) hinv
  · intro y
    apply Subtype.ext
    apply Multiplicative.toAdd.injective
    exact eY.hom_inv_id_apply y.1.toAdd
  · intro y
    apply Subtype.ext
    apply Multiplicative.toAdd.injective
    exact eY.inv_hom_id_apply y.1.toAdd
 

theorem moduleCatRangeCard_eq_of_conjugate
    {X Y X' Y' : ModuleCat.{0} ℤ}
    (f : X ⟶ Y) (g : X' ⟶ Y')
    (eX : X ≅ X') (eY : Y ≅ Y')
    (h : CategoryTheory.CategoryStruct.comp eX.inv (CategoryTheory.CategoryStruct.comp f eY.hom) = g) :
    Nat.card (MonoidHom.range
        f.hom.toAddMonoidHom.toMultiplicative) =
      Nat.card (MonoidHom.range
        g.hom.toAddMonoidHom.toMultiplicative) :=
  Nat.card_congr (moduleCatRangeEquivOfConjugate f g eX eY h)
 

theorem mulExact_of_moduleCat_exact
    {X Y Z : ModuleCat.{0} ℤ} (f : X ⟶ Y) (g : Y ⟶ Z)
    (hexact : Function.Exact f g) :
    Function.MulExact
      f.hom.toAddMonoidHom.toMultiplicative
      g.hom.toAddMonoidHom.toMultiplicative := by
  intro y
  constructor
  · intro hy
    change g y.toAdd = 0 at hy
    rcases (hexact y.toAdd).1 hy with ⟨x, hx⟩
    refine ⟨Multiplicative.ofAdd x, ?_⟩
    apply Multiplicative.toAdd.injective
    exact hx
  · rintro ⟨x, rfl⟩
    change g (f x.toAdd) = 0
    exact (hexact (f x.toAdd)).2 ⟨x.toAdd, rfl⟩
 


theorem moduleCat_card_eq_card_range_mul_card_range_of_exact
    {X Y Z : ModuleCat.{0} ℤ} (f : X ⟶ Y) (g : Y ⟶ Z)
    (hexact : Function.Exact f g) [Finite Y] :
    Nat.card Y =
      Nat.card (MonoidHom.range
        f.hom.toAddMonoidHom.toMultiplicative) *
      Nat.card (MonoidHom.range
        g.hom.toAddMonoidHom.toMultiplicative) := by
  exact
    monoidHom_card_eq_card_range_mul_card_range_of_exact
      f.hom.toAddMonoidHom.toMultiplicative
      g.hom.toAddMonoidHom.toMultiplicative
      (mulExact_of_moduleCat_exact f g hexact).monoidHom_ker_eq.symm
 

theorem finite_source_of_moduleIso
    {X Y : ModuleCat.{0} ℤ} (e : X ≅ Y) [Finite Y] :
    Finite X := by
  let e' : X ≃ Y := ((forget (ModuleCat ℤ)).mapIso e).toEquiv
  exact Finite.of_injective e' e'.injective
 

theorem finite_target_of_moduleIso
    {X Y : ModuleCat.{0} ℤ} (e : X ≅ Y) [Finite X] :
    Finite Y := by
  let e' : Y ≃ X := ((forget (ModuleCat ℤ)).mapIso e.symm).toEquiv
  exact Finite.of_injective e' e'.injective
 

theorem moduleCat_card_eq_of_iso
    {X : ModuleCat.{0} ℤ} {T : Type} [CommGroup T]
    (e : X ≅ ModuleCat.of ℤ (Additive T)) :
    Nat.card X = Nat.card T :=
  Nat.card_congr ((forget (ModuleCat ℤ)).mapIso e).toEquiv
end
 

theorem herbrand_exact_cardinality_identity
    [Group G] [Fintype G]
    [CommGroup A] [CommGroup B] [CommGroup C]
    [MulDistribMulAction G A] [MulDistribMulAction G B]
    [MulDistribMulAction G C]
    (i : A →* B) (j : B →* C)
    (hi : ∀ (g : G) (a : A), i (g • a) = g • i a)
    (hj : ∀ (g : G) (b : B), j (g • b) = g • j b)
    (hker : ∀ b : B, j b = 1 ↔ ∃ a : A, i a = b)
    (hinj : Function.Injective i)
    (hsurj : ∀ c : C, ∃ b : B, j b = c)
    (σ : G) (hgen : ∀ g : G, g ∈ Subgroup.zpowers σ)
    [Finite (HerbrandH0 G A)] [Finite (HerbrandHMinusOne G A σ)]
    [Finite (HerbrandH0 G B)] [Finite (HerbrandHMinusOne G B σ)]
    [Finite (HerbrandH0 G C)] [Finite (HerbrandHMinusOne G C σ)] :
    Nat.card (HerbrandH0 G B) *
        Nat.card (HerbrandHMinusOne G A σ) *
        Nat.card (HerbrandHMinusOne G C σ) =
      Nat.card (HerbrandH0 G A) *
        Nat.card (HerbrandH0 G C) *
        Nat.card (HerbrandHMinusOne G B σ) := by
  let : IsCyclic G := ⟨⟨σ, hgen⟩⟩
  let : CommGroup G := IsCyclic.commGroup
  let S := periodicShortComplex σ i j hi hj hker
  have hS : S.ShortExact :=
    periodicShortComplex_shortExact σ i j hi hj hker hinj hsurj
  let eA4 : S.X₁.homology 4 ≅
      ModuleCat.of ℤ (Additive (HerbrandHMinusOne G A σ)) := by
    exact periodicEvenHerbrandHMinusOneIso
      (G := G) (A := A) (n := 4) σ hgen (⟨2, rfl⟩ : Even 4)
  let eB4 : S.X₂.homology 4 ≅
      ModuleCat.of ℤ (Additive (HerbrandHMinusOne G B σ)) := by
    exact periodicEvenHerbrandHMinusOneIso
      (G := G) (A := B) (n := 4) σ hgen (⟨2, rfl⟩ : Even 4)
  let eC4 : S.X₃.homology 4 ≅
      ModuleCat.of ℤ (Additive (HerbrandHMinusOne G C σ)) := by
    exact periodicEvenHerbrandHMinusOneIso
      (G := G) (A := C) (n := 4) σ hgen (⟨2, rfl⟩ : Even 4)
  let eA3 : S.X₁.homology 3 ≅
      ModuleCat.of ℤ (Additive (HerbrandH0 G A)) := by
    exact periodicOddHerbrandHZeroIso
      (G := G) (A := A) (n := 3) σ hgen (⟨1, rfl⟩ : Odd 3)
  let eB3 : S.X₂.homology 3 ≅
      ModuleCat.of ℤ (Additive (HerbrandH0 G B)) := by
    exact periodicOddHerbrandHZeroIso
      (G := G) (A := B) (n := 3) σ hgen (⟨1, rfl⟩ : Odd 3)
  let eC3 : S.X₃.homology 3 ≅
      ModuleCat.of ℤ (Additive (HerbrandH0 G C)) := by
    exact periodicOddHerbrandHZeroIso
      (G := G) (A := C) (n := 3) σ hgen (⟨1, rfl⟩ : Odd 3)
  let eA2 : S.X₁.homology 2 ≅
      ModuleCat.of ℤ (Additive (HerbrandHMinusOne G A σ)) := by
    exact periodicEvenHerbrandHMinusOneIso
      (G := G) (A := A) (n := 2) σ hgen (by simp : Even 2)
  let eB2 : S.X₂.homology 2 ≅
      ModuleCat.of ℤ (Additive (HerbrandHMinusOne G B σ)) := by
    exact periodicEvenHerbrandHMinusOneIso
      (G := G) (A := B) (n := 2) σ hgen (by simp : Even 2)
  let pA4 : S.X₁.homology 4 ≅
      (Rep.FiniteCyclicGroup.subCompNormHom
        (Rep.ofMulDistribMulAction G A) σ).homology := by
    exact periodicHomologyIsoEven
      (Rep.ofMulDistribMulAction G A) σ (⟨2, rfl⟩ : Even 4)
  let pB4 : S.X₂.homology 4 ≅
      (Rep.FiniteCyclicGroup.subCompNormHom
        (Rep.ofMulDistribMulAction G B) σ).homology := by
    exact periodicHomologyIsoEven
      (Rep.ofMulDistribMulAction G B) σ (⟨2, rfl⟩ : Even 4)
  let pA2 : S.X₁.homology 2 ≅
      (Rep.FiniteCyclicGroup.subCompNormHom
        (Rep.ofMulDistribMulAction G A) σ).homology := by
    exact periodicHomologyIsoEven
      (Rep.ofMulDistribMulAction G A) σ (by simp : Even 2)
  let pB2 : S.X₂.homology 2 ≅
      (Rep.FiniteCyclicGroup.subCompNormHom
        (Rep.ofMulDistribMulAction G B) σ).homology := by
    exact periodicHomologyIsoEven
      (Rep.ofMulDistribMulAction G B) σ (by simp : Even 2)
  let : Finite (S.X₁.homology 4) := finite_source_of_moduleIso eA4
  let : Finite (S.X₂.homology 4) := finite_source_of_moduleIso eB4
  let : Finite (S.X₃.homology 4) := finite_source_of_moduleIso eC4
  let : Finite (S.X₁.homology 3) := finite_source_of_moduleIso eA3
  let : Finite (S.X₂.homology 3) := finite_source_of_moduleIso eB3
  let : Finite (S.X₃.homology 3) := finite_source_of_moduleIso eC3
  let : Finite (S.X₁.homology 2) := finite_source_of_moduleIso eA2
  let f4 := HomologicalComplex.homologyMap S.f 4
  let g4 := HomologicalComplex.homologyMap S.g 4
  let δ43 := hS.δ 4 3 (by simp)
  let f3 := HomologicalComplex.homologyMap S.f 3
  let g3 := HomologicalComplex.homologyMap S.g 3
  let δ32 := hS.δ 3 2 (by simp)
  let f2 := HomologicalComplex.homologyMap S.f 2
  have hexactB4 : Function.Exact f4 g4 :=
    (ShortComplex.ShortExact.moduleCat_exact_iff_function_exact _).1
      (hS.homology_exact₂ 4)
  have hexactC4 : Function.Exact g4 δ43 :=
    (ShortComplex.ShortExact.moduleCat_exact_iff_function_exact _).1
      (hS.homology_exact₃ 4 3 (by simp))
  have hexactA3 : Function.Exact δ43 f3 :=
    (ShortComplex.ShortExact.moduleCat_exact_iff_function_exact _).1
      (hS.homology_exact₁ 4 3 (by simp))
  have hexactB3 : Function.Exact f3 g3 :=
    (ShortComplex.ShortExact.moduleCat_exact_iff_function_exact _).1
      (hS.homology_exact₂ 3)
  have hexactC3 : Function.Exact g3 δ32 :=
    (ShortComplex.ShortExact.moduleCat_exact_iff_function_exact _).1
      (hS.homology_exact₃ 3 2 (by simp))
  have hexactA2 : Function.Exact δ32 f2 :=
    (ShortComplex.ShortExact.moduleCat_exact_iff_function_exact _).1
      (hS.homology_exact₁ 3 2 (by simp))
  have hB4 :=
    moduleCat_card_eq_card_range_mul_card_range_of_exact f4 g4 hexactB4
  have hC4 :=
    moduleCat_card_eq_card_range_mul_card_range_of_exact g4 δ43 hexactC4
  have hA3 :=
    moduleCat_card_eq_card_range_mul_card_range_of_exact δ43 f3 hexactA3
  have hB3 :=
    moduleCat_card_eq_card_range_mul_card_range_of_exact f3 g3 hexactB3
  have hC3 :=
    moduleCat_card_eq_card_range_mul_card_range_of_exact g3 δ32 hexactC3
  have hA2 :=
    moduleCat_card_eq_card_range_mul_card_range_of_exact δ32 f2 hexactA2
  let q := ShortComplex.homologyMap (subCompNormMap σ i hi)
  have hf4q :
      Nat.card (MonoidHom.range
          f4.hom.toAddMonoidHom.toMultiplicative) =
        Nat.card (MonoidHom.range
          q.hom.toAddMonoidHom.toMultiplicative) := by
    apply moduleCatRangeCard_eq_of_conjugate f4 q pA4 pB4
    exact periodicHomologyIsoEven_naturality
      σ (⟨2, rfl⟩ : Even 4) i hi
  have hf2q :
      Nat.card (MonoidHom.range
          f2.hom.toAddMonoidHom.toMultiplicative) =
        Nat.card (MonoidHom.range
          q.hom.toAddMonoidHom.toMultiplicative) := by
    apply moduleCatRangeCard_eq_of_conjugate f2 q pA2 pB2
    exact periodicHomologyIsoEven_naturality σ (by simp : Even 2) i hi
  have hrange :
      Nat.card (MonoidHom.range
          f4.hom.toAddMonoidHom.toMultiplicative) =
        Nat.card (MonoidHom.range
          f2.hom.toAddMonoidHom.toMultiplicative) :=
    hf4q.trans hf2q.symm
  have hperiodic :
      Nat.card (S.X₂.homology 3) *
          Nat.card (S.X₁.homology 2) *
          Nat.card (S.X₃.homology 4) =
        Nat.card (S.X₁.homology 3) *
          Nat.card (S.X₃.homology 3) *
          Nat.card (S.X₂.homology 4) := by
    rw [hB3, hA2, hC4, hA3, hC3, hB4, ← hrange]
    ac_rfl
  have hcB4 := moduleCat_card_eq_of_iso eB4
  have hcC4 := moduleCat_card_eq_of_iso eC4
  have hcA3 := moduleCat_card_eq_of_iso eA3
  have hcB3 := moduleCat_card_eq_of_iso eB3
  have hcC3 := moduleCat_card_eq_of_iso eC3
  have hcA2 := moduleCat_card_eq_of_iso eA2
  calc
    _ = Nat.card (S.X₂.homology 3) *
          Nat.card (S.X₁.homology 2) *
          Nat.card (S.X₃.homology 4) := by
      rw [hcB3, hcA2, hcC4]
    _ = Nat.card (S.X₁.homology 3) *
          Nat.card (S.X₃.homology 3) *
          Nat.card (S.X₂.homology 4) :=
      hperiodic
    _ = _ := by
      rw [hcA3, hcC3, hcB4]
end Herbrand
end ProfiniteCohomology
end
end CyclicCohomology
end

/- GaloisCohomology.Cyclic.Herbrand.HerbrandLowDegree.Core -/
section
namespace CyclicCohomology
noncomputable section
open scoped BigOperators
namespace ProfiniteCohomology
namespace Herbrand
universe uG uA uB uC
variable {G : Type uG} {A : Type uA} {B : Type uB} {C : Type uC}
variable [Group G] [Fintype G] [CommGroup A] [CommGroup B] [CommGroup C]
variable [MulDistribMulAction G A] [MulDistribMulAction G B]
  [MulDistribMulAction G C]
 


noncomputable def herbrandQuotient (σ : G)
    [Finite (HerbrandH0 G A)] [Finite (HerbrandHMinusOne G A σ)] : ℚ :=
  (Nat.card (HerbrandH0 G A) : ℚ) / (Nat.card (HerbrandHMinusOne G A σ) : ℚ)
 
theorem herbrandQuotient_eq_card_ratio (σ : G)
    [Finite (HerbrandH0 G A)] [Finite (HerbrandHMinusOne G A σ)] :
    herbrandQuotient (G := G) (A := A) σ =
      (Nat.card (HerbrandH0 G A) : ℚ) /
        (Nat.card (HerbrandHMinusOne G A σ) : ℚ) :=
  rfl
 

theorem herbrandQuotient_eq_one_of_card_eq (σ : G)
    [Finite (HerbrandH0 G A)] [Finite (HerbrandHMinusOne G A σ)]
    (hcard : Nat.card (HerbrandH0 G A) = Nat.card (HerbrandHMinusOne G A σ)) :
    herbrandQuotient (G := G) (A := A) σ = 1 := by
  have hden : ((Nat.card (HerbrandHMinusOne G A σ) : ℚ) ≠ 0) :=
    Nat.cast_ne_zero.mpr (Finite.card_pos (α := HerbrandHMinusOne G A σ)).ne'
  unfold herbrandQuotient
  rw [hcard]
  exact div_self hden
 

theorem herbrandQuotient_finite_module_eq_one
    (σ : G) (hgen : ∀ g : G, g ∈ Subgroup.zpowers σ) [Finite A] :
    herbrandQuotient (G := G) (A := A) σ = 1 := by
  exact herbrandQuotient_eq_one_of_card_eq (G := G) (A := A) σ
    (herbrand_finite_module_card_eq (G := G) (A := A) σ hgen)
 



theorem herbrandQuotient_exact_multiplicative
    {G A B C : Type}
    [Group G] [Fintype G]
    [CommGroup A] [CommGroup B] [CommGroup C]
    [MulDistribMulAction G A] [MulDistribMulAction G B]
    [MulDistribMulAction G C]
    (i : A →* B) (j : B →* C)
    (hi : ∀ (g : G) (a : A), i (g • a) = g • i a)
    (hj : ∀ (g : G) (b : B), j (g • b) = g • j b)
    (hker : ∀ b : B, j b = 1 ↔ ∃ a : A, i a = b)
    (hinj : Function.Injective i)
    (hsurj : ∀ c : C, ∃ b : B, j b = c) (σ : G)
    (hgen : ∀ g : G, g ∈ Subgroup.zpowers σ)
    [Finite (HerbrandH0 G A)] [Finite (HerbrandHMinusOne G A σ)]
    [Finite (HerbrandH0 G B)] [Finite (HerbrandHMinusOne G B σ)]
    [Finite (HerbrandH0 G C)] [Finite (HerbrandHMinusOne G C σ)] :
    herbrandQuotient (G := G) (A := B) σ =
      herbrandQuotient (G := G) (A := A) σ *
        herbrandQuotient (G := G) (A := C) σ := by
  have hcard :=
    herbrand_exact_cardinality_identity
      (G := G) (A := A) (B := B) (C := C)
      i j hi hj hker hinj hsurj σ hgen
  have hA :
      ((Nat.card (HerbrandHMinusOne G A σ) : ℚ) ≠ 0) :=
    Nat.cast_ne_zero.mpr
      (Finite.card_pos (α := HerbrandHMinusOne G A σ)).ne'
  have hB :
      ((Nat.card (HerbrandHMinusOne G B σ) : ℚ) ≠ 0) :=
    Nat.cast_ne_zero.mpr
      (Finite.card_pos (α := HerbrandHMinusOne G B σ)).ne'
  have hC :
      ((Nat.card (HerbrandHMinusOne G C σ) : ℚ) ≠ 0) :=
    Nat.cast_ne_zero.mpr
      (Finite.card_pos (α := HerbrandHMinusOne G C σ)).ne'
  unfold herbrandQuotient
  field_simp [hA, hB, hC]
  have hcardQ :
      (Nat.card (HerbrandH0 G B) : ℚ) *
          Nat.card (HerbrandHMinusOne G A σ) *
          Nat.card (HerbrandHMinusOne G C σ) =
        Nat.card (HerbrandH0 G A) *
          Nat.card (HerbrandH0 G C) *
          Nat.card (HerbrandHMinusOne G B σ) := by
    exact_mod_cast hcard
  simpa [mul_assoc, mul_left_comm, mul_comm] using hcardQ
end Herbrand
end ProfiniteCohomology
end
end CyclicCohomology
end

/- GaloisCohomology.Cyclic.Herbrand.Induced -/
section
noncomputable section
namespace CyclicCohomology
open CyclicCohomology.ProfiniteCohomology.Herbrand
universe uG uB
variable {G : Type uG} {B : Type uB}
 

def twistedFinRotate {K C : Type*} [Group K] [CommGroup C]
    [MulDistribMulAction K C] {n : ℕ} [NeZero n]
    (τ : K) (v : Fin n → C) (i : Fin n) : C :=
  if finRotate n i = 0 then τ • v 0
  else v (finRotate n i)
 
theorem prod_twistedFinRotate_div
    {K C : Type*} [Group K] [CommGroup C]
    [MulDistribMulAction K C] {n : ℕ} [NeZero n]
    (τ : K) (v : Fin n → C) :
    (∏ i : Fin n, twistedFinRotate τ v i) *
        (∏ i : Fin n, v i)⁻¹ =
      τ • v 0 * (v 0)⁻¹ := by
  classical
  let u : Fin n → C :=
    fun j ↦ if j = 0 then τ • v 0 else v j
  have hrotate :
      (∏ i : Fin n, twistedFinRotate τ v i) =
        ∏ j : Fin n, u j := by
    exact Fintype.prod_equiv
      (finRotate n) (twistedFinRotate τ v) u
      (fun i ↦ rfl)
  let R : C :=
    ∏ j ∈ (Finset.univ.erase (0 : Fin n)), v j
  have hu :
      (∏ j : Fin n, u j) = (τ • v 0) * R := by
    rw [← Finset.mul_prod_erase Finset.univ u
      (Finset.mem_univ (0 : Fin n))]
    simp only [u, if_pos, R]
    congr 1
    apply Finset.prod_congr rfl
    intro j hj
    have hj0 : j ≠ 0 :=
      Finset.ne_of_mem_erase hj
    simp [hj0]
  have hv :
      (∏ j : Fin n, v j) = v 0 * R := by
    rw [← Finset.mul_prod_erase Finset.univ v
      (Finset.mem_univ (0 : Fin n))]
  rw [hrotate, hu, hv]
  simp only [mul_inv_rev]
  calc
    (τ • v 0) * R * (R⁻¹ * (v 0)⁻¹) =
        (τ • v 0) * (v 0)⁻¹ *
          (R * R⁻¹) := by ac_rfl
    _ = τ • v 0 * (v 0)⁻¹ := by simp
 

theorem pow_mul_eq_pow_finRotate
    {X : Type*} [Monoid X] {n : ℕ} [NeZero n]
    (a : X) (i : Fin n) :
    a ^ i.1 * a =
      if finRotate n i = 0 then a ^ n
      else a ^ (finRotate n i).1 := by
  cases n with
  | zero => exact Fin.elim0 i
  | succ n =>
      by_cases hi : i = Fin.last n
      · subst i
        simp [pow_succ]
      · have hil : i.1 < n :=
          Fin.val_lt_last hi
        rw [finRotate_of_lt hil]
        simp [pow_succ]
 
def finPartialProduct {C : Type*} [CommMonoid C]
    {n : ℕ} (v : Fin n → C) (k : ℕ) : C :=
  (Finset.range k).prod fun i ↦
    if hi : i < n then v ⟨i, hi⟩ else 1
@[simp]
theorem finPartialProduct_zero
    {C : Type*} [CommMonoid C] {n : ℕ}
    (v : Fin n → C) :
    finPartialProduct v 0 = 1 := by
  simp [finPartialProduct]
theorem finPartialProduct_succ
    {C : Type*} [CommMonoid C] {n : ℕ}
    (v : Fin n → C) (i : Fin n) :
    finPartialProduct v (i.1 + 1) =
      finPartialProduct v i.1 * v i := by
  simp [finPartialProduct,
    Finset.prod_range_succ, i.2]
theorem finPartialProduct_full
    {C : Type*} [CommMonoid C] {n : ℕ}
    (v : Fin n → C) :
    finPartialProduct v n = ∏ i : Fin n, v i := by
  simpa [finPartialProduct] using
    (Finset.prod_fin_eq_prod_range v).symm
 


noncomputable def quotientMulEquivOfSplit
    {X Y : Type*} [CommGroup X] [CommGroup Y]
    (N : Subgroup X) (M : Subgroup Y)
    (f : X →* Y) (s : Y →* X)
    (hfs : ∀ y : Y, f (s y) = y)
    (hfN : ∀ x : X, x ∈ N → f x ∈ M)
    (hsM : ∀ y : Y, y ∈ M → s y ∈ N)
    (hker : ∀ x : X, f x = 1 → x ∈ N) :
    X ⧸ N ≃* Y ⧸ M := by
  let qf : (X ⧸ N) →* (Y ⧸ M) :=
    QuotientGroup.map N M f (fun x hx ↦ hfN x hx)
  let qs : (Y ⧸ M) →* (X ⧸ N) :=
    QuotientGroup.map M N s (fun y hy ↦ hsM y hy)
  refine MonoidHom.toMulEquiv qf qs ?_ ?_
  · apply QuotientGroup.monoidHom_ext
    ext x
    apply QuotientGroup.eq_iff_div_mem.mpr
    apply hker
    simp [hfs]
  · apply QuotientGroup.monoidHom_ext
    ext y
    apply QuotientGroup.eq_iff_div_mem.mpr
    simp [hfs]
 


def inducedSubgroup [Group G] (H : Subgroup G) [CommGroup B]
    [MulDistribMulAction H B] : Subgroup (G → B) where
  carrier := {f | ∀ (h : H) (x : G), f (h.1 * x) = h • f x}
  one_mem' := by simp
  mul_mem' := by
    intro f k hf hk h x
    simp only [Pi.mul_apply, hf h x, hk h x]
    exact (MulDistribMulAction.smul_mul h (f x) (k x)).symm
  inv_mem' := by
    intro f hf h x
    simp only [Pi.inv_apply, hf h x]
    exact (map_inv (MulDistribMulAction.toMonoidHom B h) (f x)).symm
 
abbrev InducedModule [Group G] (H : Subgroup G) [CommGroup B]
    [MulDistribMulAction H B] :=
  inducedSubgroup (G := G) (B := B) H
 
instance inducedMulDistribMulAction [Group G] (H : Subgroup G) [CommGroup B]
    [MulDistribMulAction H B] :
    MulDistribMulAction G (InducedModule (B := B) H) where
  smul g f := ⟨fun x ↦ f.1 (x * g), by
    intro h x
    simpa only [mul_assoc] using f.2 h (x * g)⟩
  one_smul := by
    intro f
    apply Subtype.ext
    funext x
    change f.1 (x * 1) = f.1 x
    rw [mul_one]
  mul_smul := by
    intro g k f
    apply Subtype.ext
    funext x
    change f.1 (x * (g * k)) = f.1 ((x * g) * k)
    rw [mul_assoc]
  smul_mul := by
    intro g f k
    ext x
    rfl
  smul_one := by
    intro g
    ext x
    rfl
 

def inducedEvaluation [Group G] (H : Subgroup G) [CommGroup B]
    [MulDistribMulAction H B] :
    InducedModule (B := B) H →* B where
  toFun f := f.1 1
  map_one' := rfl
  map_mul' _ _ := rfl
 

noncomputable def inducedFixedEquiv [Group G] (H : Subgroup G)
    [CommGroup B] [MulDistribMulAction H B] :
    fixedSubgroup G (InducedModule (B := B) H) ≃*
      fixedSubgroup H B where
  toFun f := ⟨f.1.1 1, by
    intro h
    have hcov := f.1.2 h 1
    have hfix := congrArg
      (fun q : InducedModule (B := B) H ↦ q.1 1) (f.2 h.1)
    change f.1.1 (h.1 * 1) = h • f.1.1 1 at hcov
    change f.1.1 (1 * h.1) = f.1.1 1 at hfix
    have hcov' : h • f.1.1 1 = f.1.1 h.1 := by
      simpa using hcov.symm
    have hfix' : f.1.1 h.1 = f.1.1 1 := by
      simpa using hfix
    exact hcov'.trans hfix'⟩
  invFun b := ⟨⟨fun _ ↦ b.1, by
      intro h x
      exact (b.2 h).symm⟩,
    by
      intro g
      apply Subtype.ext
      funext x
      rfl⟩
  left_inv f := by
    apply Subtype.ext
    apply Subtype.ext
    funext x
    have hx := congrArg
      (fun q : InducedModule (B := B) H ↦ q.1 1) (f.2 x)
    change f.1.1 (1 * x) = f.1.1 1 at hx
    simpa using hx.symm
  right_inv b := by
    apply Subtype.ext
    rfl
  map_mul' _ _ := rfl
section CyclicCoordinates
variable [CommGroup G] [Fintype G]
omit [Fintype G] in
 

theorem quotientGenerator_generates (H : Subgroup G) (σ : G)
    (hgen : ∀ x : G, x ∈ Subgroup.zpowers σ) :
    ∀ q : G ⧸ H, q ∈
      Subgroup.zpowers (QuotientGroup.mk' H σ) := by
  intro q
  obtain ⟨x, rfl⟩ := QuotientGroup.mk'_surjective H q
  obtain ⟨k, hk⟩ := Subgroup.mem_zpowers_iff.mp (hgen x)
  refine Subgroup.mem_zpowers_iff.mpr ⟨k, ?_⟩
  rw [← map_zpow]
  exact congrArg (QuotientGroup.mk' H) hk
omit [Fintype G] in
 
theorem quotientGenerator_order (H : Subgroup G) (σ : G)
    (hgen : ∀ x : G, x ∈ Subgroup.zpowers σ) :
    orderOf (QuotientGroup.mk' H σ) = H.index := by
  rw [H.index_eq_card]
  exact orderOf_eq_card_of_forall_mem_zpowers
    (quotientGenerator_generates H σ hgen)
 

noncomputable def cyclicCosetEquiv (H : Subgroup G) (σ : G)
    (hgen : ∀ x : G, x ∈ Subgroup.zpowers σ) :
    H × Fin H.index ≃ G := by
  classical
  letI : Fintype (G ⧸ H) := Fintype.ofFinite (G ⧸ H)
  refine Equiv.ofBijective
    (fun p : H × Fin H.index ↦ p.1.1 * σ ^ p.2.1) ⟨?_, ?_⟩
  · intro p q hpq
    have hquot :
        (QuotientGroup.mk' H σ) ^ p.2.1 =
          (QuotientGroup.mk' H σ) ^ q.2.1 := by
      have hpone : QuotientGroup.mk' H p.1.1 = 1 :=
        (QuotientGroup.eq_one_iff p.1.1).mpr p.1.2
      have hqone : QuotientGroup.mk' H q.1.1 = 1 :=
        (QuotientGroup.eq_one_iff q.1.1).mpr q.1.2
      calc
        (QuotientGroup.mk' H σ) ^ p.2.1 =
            QuotientGroup.mk' H (p.1.1 * σ ^ p.2.1) := by
          rw [map_mul, map_pow, hpone, one_mul]
        _ = QuotientGroup.mk' H (q.1.1 * σ ^ q.2.1) :=
          congrArg (QuotientGroup.mk' H) hpq
        _ = (QuotientGroup.mk' H σ) ^ q.2.1 := by
          rw [map_mul, map_pow, hqone, one_mul]
    have hmod : p.2.1 ≡ q.2.1 [MOD H.index] := by
      have hm := (pow_eq_pow_iff_modEq
        (x := QuotientGroup.mk' H σ)).mp hquot
      rw [quotientGenerator_order H σ hgen] at hm
      exact hm
    have hij : p.2.1 = q.2.1 :=
      Nat.ModEq.eq_of_lt_of_lt hmod p.2.2 q.2.2
    have hfin : p.2 = q.2 := Fin.ext hij
    cases p with
    | mk ph pi =>
      cases q with
      | mk qh qi =>
        dsimp at hfin hpq ⊢
        subst qi
        apply congrArg (fun h : H ↦ (h, pi))
        apply Subtype.ext
        exact mul_right_cancel hpq
  · intro x
    have hcover := IsCyclic.image_range_card
      (a := QuotientGroup.mk' H σ)
      (quotientGenerator_generates H σ hgen)
    rw [← H.index_eq_card] at hcover
    have hxmem : QuotientGroup.mk' H x ∈
        Finset.image (fun i : ℕ ↦
          (QuotientGroup.mk' H σ) ^ i)
          (Finset.range H.index) := by
      rw [hcover]
      simp
    obtain ⟨i, hi, hqi⟩ := Finset.mem_image.mp hxmem
    have hdiv : x / σ ^ i ∈ H := by
      apply QuotientGroup.eq_iff_div_mem.mp
      simpa using hqi.symm
    refine
      ⟨(⟨x / σ ^ i, hdiv⟩,
        ⟨i, Finset.mem_range.mp hi⟩), ?_⟩
    exact div_mul_cancel x (σ ^ i)
@[simp]
theorem cyclicCosetEquiv_apply (H : Subgroup G) (σ : G)
    (hgen : ∀ x : G, x ∈ Subgroup.zpowers σ)
    (h : H) (i : Fin H.index) :
    cyclicCosetEquiv H σ hgen (h, i) =
      h.1 * σ ^ i.1 := by
  exact congrFun
    (Equiv.coe_ofBijective
      (fun p : H × Fin H.index => p.1.1 * σ ^ p.2.1)
      (cyclicCosetEquiv H σ hgen).bijective) (h, i)
omit [Fintype G] in
 
theorem cyclic_pow_index_mem (H : Subgroup G) (σ : G) :
    σ ^ H.index ∈ H :=
  H.pow_index_mem σ
 
def subgroupGenerator (H : Subgroup G) (σ : G) : H :=
  ⟨σ ^ H.index, cyclic_pow_index_mem H σ⟩
omit [Fintype G] in
@[simp]
theorem subgroupGenerator_coe (H : Subgroup G) (σ : G) :
    (subgroupGenerator H σ : G) = σ ^ H.index :=
  rfl
end CyclicCoordinates
section InducedCoordinates
variable [CommGroup G] [Fintype G] [CommGroup B]
variable (H : Subgroup G) [MulDistribMulAction H B]
 

noncomputable def inducedCoordinates (σ : G)
    (hgen : ∀ x : G, x ∈ Subgroup.zpowers σ) :
    InducedModule (B := B) H ≃*
      (Fin H.index → B) where
  toFun f i := f.1 (σ ^ i.1)
  invFun v := ⟨fun x ↦
      let p := (cyclicCosetEquiv H σ hgen).symm x
      p.1 • v p.2,
    by
      intro h x
      let e := cyclicCosetEquiv H σ hgen
      let p := e.symm x
      have hp : p.1.1 * σ ^ p.2.1 = x := by
        have hx := e.apply_symm_apply x
        change p.1.1 * σ ^ p.2.1 = x at hx
        exact hx
      have hsymm :
          e.symm (h.1 * x) = (h * p.1, p.2) := by
        apply e.injective
        rw [e.apply_symm_apply]
        change h.1 * x =
          (h * p.1).1 * σ ^ p.2.1
        rw [← hp]
        simp only [Subgroup.coe_mul]
        exact (mul_assoc h.1 p.1.1
          (σ ^ p.2.1)).symm
      change
        (e.symm (h.1 * x)).1 •
            v (e.symm (h.1 * x)).2 =
          h • p.1 • v p.2
      rw [hsymm]
      exact mul_smul h p.1 (v p.2)⟩
  left_inv f := by
    apply Subtype.ext
    funext x
    let e := cyclicCosetEquiv H σ hgen
    let p := e.symm x
    have hp : p.1.1 * σ ^ p.2.1 = x := by
      have hx := e.apply_symm_apply x
      change p.1.1 * σ ^ p.2.1 = x at hx
      exact hx
    change p.1 • f.1 (σ ^ p.2.1) = f.1 x
    rw [← hp]
    exact (f.2 p.1 (σ ^ p.2.1)).symm
  right_inv v := by
    funext i
    let e := cyclicCosetEquiv H σ hgen
    have hsymm : e.symm (σ ^ i.1) = (1, i) := by
      apply e.injective
      simp [e]
    change
      (e.symm (σ ^ i.1)).1 •
          v (e.symm (σ ^ i.1)).2 = v i
    rw [hsymm]
    exact one_smul H (v i)
  map_mul' f k := by
    funext i
    rfl
@[simp]
theorem inducedCoordinates_apply (σ : G)
    (hgen : ∀ x : G, x ∈ Subgroup.zpowers σ)
    (f : InducedModule (B := B) H)
    (i : Fin H.index) :
    inducedCoordinates H σ hgen f i =
      f.1 (σ ^ i.1) :=
  rfl
 

def inducedFirstCoordinateHom :
    B →* (Fin H.index → B) where
  toFun b i := if i.1 = 0 then b else 1
  map_one' := by
    funext i
    split <;> rfl
  map_mul' b c := by
    funext i
    by_cases hi : i.1 = 0 <;> simp [hi]
 
noncomputable def inducedSection (σ : G)
    (hgen : ∀ x : G, x ∈ Subgroup.zpowers σ) :
    B →* InducedModule (B := B) H :=
  (inducedCoordinates H σ hgen).symm.toMonoidHom.comp
    (inducedFirstCoordinateHom H)
@[simp]
theorem inducedSection_apply_one (σ : G)
    (hgen : ∀ x : G, x ∈ Subgroup.zpowers σ) (b : B) :
    (inducedSection H σ hgen b).1 1 = b := by
  have hn : 0 < H.index := by
    rw [H.index_eq_card]
    exact Nat.card_pos
  let i0 : Fin H.index := ⟨0, hn⟩
  have h :=
    (inducedCoordinates_apply H σ hgen
      ((inducedCoordinates H σ hgen).symm
        (inducedFirstCoordinateHom H b)) i0).symm.trans
      (congrFun
        ((inducedCoordinates H σ hgen).apply_symm_apply
          (inducedFirstCoordinateHom H b)) i0)
  change (inducedSection H σ hgen b).1 (σ ^ (0 : ℕ)) = b at h
  simpa only [pow_zero] using h
 
noncomputable def inducedCoordinateProduct (σ : G)
    (hgen : ∀ x : G, x ∈ Subgroup.zpowers σ) :
    InducedModule (B := B) H →* B where
  toFun f :=
    ∏ i : Fin H.index,
      inducedCoordinates H σ hgen f i
  map_one' := by simp
  map_mul' f k := by
    simp only [map_mul, Pi.mul_apply,
      Finset.prod_mul_distrib]
@[simp]
theorem inducedCoordinateProduct_apply (σ : G)
    (hgen : ∀ x : G, x ∈ Subgroup.zpowers σ)
    (f : InducedModule (B := B) H) :
    inducedCoordinateProduct H σ hgen f =
      ∏ i : Fin H.index, f.1 (σ ^ i.1) :=
  rfl
 

@[simp]
theorem inducedCoordinateProduct_section (σ : G)
    (hgen : ∀ x : G, x ∈ Subgroup.zpowers σ) (b : B) :
    inducedCoordinateProduct H σ hgen
        (inducedSection H σ hgen b) = b := by
  classical
  have hn : 0 < H.index := by
    rw [H.index_eq_card]
    exact Nat.card_pos
  let i0 : Fin H.index := ⟨0, hn⟩
  change (∏ i : Fin H.index,
    inducedCoordinates H σ hgen
      ((inducedCoordinates H σ hgen).symm
        (inducedFirstCoordinateHom H b)) i) = b
  rw [(inducedCoordinates H σ hgen).apply_symm_apply
    (inducedFirstCoordinateHom H b)]
  refine Finset.prod_eq_single i0 ?_ ?_
  · intro i _hi hne
    have hi0 : i.1 ≠ 0 := by
      intro hi
      apply hne
      exact Fin.ext hi
    simp [inducedFirstCoordinateHom, hi0]
  · intro hnot
    exact (hnot (Finset.mem_univ i0)).elim
end InducedCoordinates
section InducedHerbrandH0
variable [CommGroup G] [Fintype G] [CommGroup B]
variable (H : Subgroup G) [MulDistribMulAction H B]
local instance : Fintype H := Fintype.ofFinite H
 

theorem inducedEvaluation_tateNorm (σ : G)
    (hgen : ∀ x : G, x ∈ Subgroup.zpowers σ)
    (f : InducedModule (B := B) H) :
    inducedEvaluation H
        (tateNorm G (InducedModule (B := B) H) f) =
      tateNorm H B
        (inducedCoordinateProduct H σ hgen f) := by
  classical
  let e := cyclicCosetEquiv H σ hgen
  let ev : InducedModule (B := B) H →* B :=
    inducedEvaluation H
  calc
    inducedEvaluation H
          (tateNorm G (InducedModule (B := B) H) f) =
        ∏ g : G, f.1 g := by
      calc
        inducedEvaluation H
              (tateNorm G
                (InducedModule (B := B) H) f) =
            ∏ g : G, ev (g • f) := by
          simp only [tateNorm, ev, map_prod]
        _ = ∏ g : G, f.1 g := by
          apply Finset.prod_congr rfl
          intro g _hg
          change f.1 (1 * g) = f.1 g
          rw [one_mul]
    _ = ∏ p : H × Fin H.index, f.1 (e p) := by
      exact Fintype.prod_equiv e.symm
        (fun g : G ↦ f.1 g)
        (fun p : H × Fin H.index ↦ f.1 (e p))
        (fun g ↦ by
          rw [e.apply_symm_apply])
    _ = ∏ h : H, ∏ i : Fin H.index,
          h • f.1 (σ ^ i.1) := by
      rw [Fintype.prod_prod_type]
      apply Finset.prod_congr rfl
      intro h _hh
      apply Finset.prod_congr rfl
      intro i _hi
      change
        f.1 (h.1 * σ ^ i.1) =
          h • f.1 (σ ^ i.1)
      exact f.2 h (σ ^ i.1)
    _ = ∏ h : H,
          h • (∏ i : Fin H.index,
            f.1 (σ ^ i.1)) := by
      apply Finset.prod_congr rfl
      intro h _hh
      exact
        (map_prod
          (MulDistribMulAction.toMonoidHom B h)
          (fun i : Fin H.index ↦ f.1 (σ ^ i.1))
          Finset.univ).symm
    _ = tateNorm H B
          (inducedCoordinateProduct H σ hgen f) := by
      simp only [tateNorm,
        inducedCoordinateProduct_apply]
 

theorem inducedFixedEquiv_mem_tateNormSubgroup_iff
    (σ : G)
    (hgen : ∀ x : G, x ∈ Subgroup.zpowers σ)
    (x : fixedSubgroup G
      (InducedModule (B := B) H)) :
    x.1 ∈ tateNormSubgroup G
        (InducedModule (B := B) H) ↔
      (inducedFixedEquiv H x).1 ∈
        tateNormSubgroup H B := by
  constructor
  · rintro ⟨f, hf⟩
    refine
      ⟨inducedCoordinateProduct H σ hgen f, ?_⟩
    calc
      tateNorm H B
            (inducedCoordinateProduct H σ hgen f) =
          inducedEvaluation H
            (tateNorm G
              (InducedModule (B := B) H) f) :=
        (inducedEvaluation_tateNorm
          H σ hgen f).symm
      _ = inducedEvaluation H x.1 :=
        congrArg (inducedEvaluation H) hf
      _ = (inducedFixedEquiv H x).1 := rfl
  · rintro ⟨b, hb⟩
    refine ⟨inducedSection H σ hgen b, ?_⟩
    let y : fixedSubgroup G
        (InducedModule (B := B) H) :=
      ⟨tateNorm G (InducedModule (B := B) H)
          (inducedSection H σ hgen b),
        fun g ↦ smul_tateNorm_eq
          (G := G)
          (A := InducedModule (B := B) H) g _⟩
    have hy :
        inducedFixedEquiv H y =
          inducedFixedEquiv H x := by
      apply Subtype.ext
      change
        inducedEvaluation H y.1 =
          (inducedFixedEquiv H x).1
      calc
        inducedEvaluation H y.1 =
            tateNorm H B
              (inducedCoordinateProduct H σ hgen
                (inducedSection H σ hgen b)) :=
          inducedEvaluation_tateNorm H σ hgen
            (inducedSection H σ hgen b)
        _ = tateNorm H B b := by
          rw [inducedCoordinateProduct_section
            H σ hgen b]
        _ = (inducedFixedEquiv H x).1 := hb
    exact congrArg Subtype.val
      ((inducedFixedEquiv H).injective hy)
 
noncomputable def inducedHerbrandH0Equiv (σ : G)
    (hgen : ∀ x : G, x ∈ Subgroup.zpowers σ) :
    HerbrandH0 G (InducedModule (B := B) H) ≃*
      HerbrandH0 H B := by
  let e :
      fixedSubgroup G (InducedModule (B := B) H) ≃*
        fixedSubgroup H B :=
    inducedFixedEquiv H
  let NG :=
    (tateNormSubgroup G
      (InducedModule (B := B) H)).subgroupOf
      (fixedSubgroup G
        (InducedModule (B := B) H))
  let NH :=
    (tateNormSubgroup H B).subgroupOf
      (fixedSubgroup H B)
  exact quotientMulEquivOfSplit
    NG NH e.toMonoidHom e.symm.toMonoidHom
    (fun y ↦ e.apply_symm_apply y)
    (fun x hx ↦ by
      rw [Subgroup.mem_subgroupOf] at hx ⊢
      exact
        (inducedFixedEquiv_mem_tateNormSubgroup_iff
          H σ hgen x).mp hx)
    (fun y hy ↦ by
      rw [Subgroup.mem_subgroupOf] at hy ⊢
      have h :=
        (inducedFixedEquiv_mem_tateNormSubgroup_iff
          H σ hgen (e.symm y)).mpr
          (by simpa [e] using hy)
      simpa [e] using h)
    (fun x hx ↦ by
      have hx1 : x = 1 := by
        apply e.injective
        simpa [e] using hx
      rw [hx1]
      exact NG.one_mem)
end InducedHerbrandH0
section InducedHerbrandHMinusOne
variable [CommGroup G] [Fintype G] [CommGroup B]
variable (H : Subgroup G) [MulDistribMulAction H B]
local instance : Fintype H := Fintype.ofFinite H
local instance : NeZero H.index := ⟨by
  rw [H.index_eq_card]
  exact Nat.card_pos.ne'⟩
 

theorem inducedCoordinates_smul_generator (σ : G)
    (hgen : ∀ x : G, x ∈ Subgroup.zpowers σ)
    (f : InducedModule (B := B) H)
    (i : Fin H.index) :
    inducedCoordinates H σ hgen (σ • f) i =
      twistedFinRotate (subgroupGenerator H σ)
        (inducedCoordinates H σ hgen f) i := by
  unfold twistedFinRotate
  change
    f.1 (σ ^ i.1 * σ) =
      if finRotate H.index i = 0 then
        subgroupGenerator H σ •
          f.1 (σ ^ (0 : Fin H.index).1)
      else
        f.1 (σ ^ (finRotate H.index i).1)
  rw [pow_mul_eq_pow_finRotate]
  split_ifs with hi
  · have hcov :=
      f.2 (subgroupGenerator H σ) 1
    change
      f.1 (σ ^ H.index * 1) =
        subgroupGenerator H σ • f.1 1 at hcov
    simpa using hcov
  · rfl
 

theorem inducedCoordinateProduct_sigmaMinusOne
    (σ : G)
    (hgen : ∀ x : G, x ∈ Subgroup.zpowers σ)
    (f : InducedModule (B := B) H) :
    inducedCoordinateProduct H σ hgen
        (sigmaMinusOne G
          (InducedModule (B := B) H) σ f) =
      sigmaMinusOne H B
        (subgroupGenerator H σ) (f.1 1) := by
  let v : Fin H.index → B :=
    inducedCoordinates H σ hgen f
  rw [show
      sigmaMinusOne G
          (InducedModule (B := B) H) σ f =
        σ • f * f⁻¹ by rfl,
    map_mul, map_inv]
  change
    (∏ i : Fin H.index,
        inducedCoordinates H σ hgen (σ • f) i) *
        (∏ i : Fin H.index, v i)⁻¹ =
      sigmaMinusOne H B
        (subgroupGenerator H σ) (f.1 1)
  calc
    (∏ i : Fin H.index,
          inducedCoordinates H σ hgen (σ • f) i) *
          (∏ i : Fin H.index, v i)⁻¹ =
        (∏ i : Fin H.index,
          twistedFinRotate
            (subgroupGenerator H σ) v i) *
          (∏ i : Fin H.index, v i)⁻¹ := by
      congr 2
      funext i
      exact inducedCoordinates_smul_generator
        H σ hgen f i
    _ = subgroupGenerator H σ • v 0 *
          (v 0)⁻¹ :=
      prod_twistedFinRotate_div
        (subgroupGenerator H σ) v
    _ = sigmaMinusOne H B
          (subgroupGenerator H σ) (f.1 1) := by
      have hv0 : v 0 = f.1 1 := by
        simpa only [Fin.val_zero, pow_zero] using
          (inducedCoordinates_apply H σ hgen f (0 : Fin H.index))
      simpa only [sigmaMinusOne] using
        congrArg (fun b : B => subgroupGenerator H σ • b * b⁻¹) hv0
 

theorem inducedCoordinateProduct_eq_one_mem_augmentation
    (σ : G)
    (hgen : ∀ x : G, x ∈ Subgroup.zpowers σ)
    (f : InducedModule (B := B) H)
    (hf :
      inducedCoordinateProduct H σ hgen f = 1) :
    f ∈ augmentationSubgroup G
      (InducedModule (B := B) H) σ := by
  let e : InducedModule (B := B) H ≃*
      (Fin H.index → B) :=
    inducedCoordinates H σ hgen
  let v : Fin H.index → B := e f
  let p : Fin H.index → B :=
    fun i ↦ finPartialProduct v i.1
  let c : InducedModule (B := B) H :=
    e.symm p
  have hc : e c = p := e.apply_symm_apply p
  have hprod :
      (∏ i : Fin H.index, v i) = 1 := by
    change
      inducedCoordinateProduct H σ hgen f = 1 at hf
    exact hf
  have hfull :
      finPartialProduct v H.index = 1 := by
    rw [finPartialProduct_full]
    exact hprod
  refine ⟨c, ?_⟩
  apply e.injective
  funext i
  change
    c.1 (σ ^ i.1 * σ) *
        (c.1 (σ ^ i.1))⁻¹ = v i
  have hci :
      c.1 (σ ^ i.1) = p i :=
    congrFun hc i
  by_cases hi : i.1 + 1 < H.index
  · let j : Fin H.index := ⟨i.1 + 1, hi⟩
    have hcj :
        c.1 (σ ^ j.1) = p j :=
      congrFun hc j
    have hpow :
        σ ^ i.1 * σ = σ ^ j.1 :=
      (pow_succ σ i.1).symm
    rw [hpow, hcj, hci]
    change
      finPartialProduct v (i.1 + 1) *
          (finPartialProduct v i.1)⁻¹ = v i
    rw [finPartialProduct_succ v i]
    simp [mul_assoc]
  · have hle : i.1 + 1 ≤ H.index :=
      Nat.succ_le_iff.mpr i.2
    have heq : i.1 + 1 = H.index :=
      le_antisymm hle (Nat.le_of_not_gt hi)
    have hc0 : c.1 1 = 1 := by
      have h := congrFun hc (0 : Fin H.index)
      change
        c.1 (σ ^ (0 : Fin H.index).1) =
          p 0 at h
      simpa [p] using h
    have hcwrap :
        c.1 (σ ^ i.1 * σ) = 1 := by
      calc
        c.1 (σ ^ i.1 * σ) =
            c.1 (σ ^ (i.1 + 1)) := by
          rw [pow_succ]
        _ = c.1 (σ ^ H.index) := by
          rw [heq]
        _ = subgroupGenerator H σ • c.1 1 := by
          simpa only [subgroupGenerator_coe, mul_one] using
            c.2 (subgroupGenerator H σ) 1
        _ = 1 := by
          rw [hc0, MulDistribMulAction.smul_one]
    have hsucc :=
      finPartialProduct_succ v i
    rw [heq] at hsucc
    have hmul :
        finPartialProduct v i.1 * v i = 1 :=
      hsucc.symm.trans hfull
    rw [hcwrap, hci, one_mul]
    change
      (finPartialProduct v i.1)⁻¹ = v i
    exact (mul_eq_one_iff_inv_eq).mp hmul
 

theorem inducedCoordinateProduct_mem_normKernel
    (σ : G)
    (hgen : ∀ x : G, x ∈ Subgroup.zpowers σ)
    {f : InducedModule (B := B) H}
    (hf : f ∈ normKernelSubgroup G
      (InducedModule (B := B) H)) :
    inducedCoordinateProduct H σ hgen f ∈
      normKernelSubgroup H B := by
  change
    tateNorm G (InducedModule (B := B) H) f = 1 at hf
  change
    tateNorm H B
      (inducedCoordinateProduct H σ hgen f) = 1
  calc
    tateNorm H B
          (inducedCoordinateProduct H σ hgen f) =
        inducedEvaluation H
          (tateNorm G
            (InducedModule (B := B) H) f) :=
      (inducedEvaluation_tateNorm
        H σ hgen f).symm
    _ = inducedEvaluation H 1 :=
      congrArg (inducedEvaluation H) hf
    _ = 1 := rfl
 

theorem inducedSection_mem_normKernel (σ : G)
    (hgen : ∀ x : G, x ∈ Subgroup.zpowers σ)
    {b : B} (hb : b ∈ normKernelSubgroup H B) :
    inducedSection H σ hgen b ∈
      normKernelSubgroup G
        (InducedModule (B := B) H) := by
  change tateNorm H B b = 1 at hb
  let y : fixedSubgroup G
      (InducedModule (B := B) H) :=
    ⟨tateNorm G (InducedModule (B := B) H)
        (inducedSection H σ hgen b),
      fun g ↦ smul_tateNorm_eq
        (G := G)
        (A := InducedModule (B := B) H) g _⟩
  have hey : inducedFixedEquiv H y = 1 := by
    apply Subtype.ext
    change inducedEvaluation H y.1 = 1
    calc
      inducedEvaluation H y.1 =
          tateNorm H B
            (inducedCoordinateProduct H σ hgen
              (inducedSection H σ hgen b)) :=
        inducedEvaluation_tateNorm H σ hgen
          (inducedSection H σ hgen b)
      _ = tateNorm H B b := by
        rw [inducedCoordinateProduct_section
          H σ hgen b]
      _ = 1 := hb
  have hy : y = 1 :=
    (inducedFixedEquiv H).injective hey
  exact congrArg Subtype.val hy
 
theorem inducedCoordinateProduct_mem_augmentation
    (σ : G)
    (hgen : ∀ x : G, x ∈ Subgroup.zpowers σ)
    {f : InducedModule (B := B) H}
    (hf : f ∈ augmentationSubgroup G
      (InducedModule (B := B) H) σ) :
    inducedCoordinateProduct H σ hgen f ∈
      augmentationSubgroup H B
        (subgroupGenerator H σ) := by
  obtain ⟨c, rfl⟩ := hf
  refine ⟨c.1 1, ?_⟩
  exact
    (inducedCoordinateProduct_sigmaMinusOne
      H σ hgen c).symm
 

theorem inducedSection_mem_augmentation (σ : G)
    (hgen : ∀ x : G, x ∈ Subgroup.zpowers σ)
    {b : B}
    (hb : b ∈ augmentationSubgroup H B
      (subgroupGenerator H σ)) :
    inducedSection H σ hgen b ∈
      augmentationSubgroup G
        (InducedModule (B := B) H) σ := by
  obtain ⟨c, rfl⟩ := hb
  let a₁ : InducedModule (B := B) H :=
    inducedSection H σ hgen
      (sigmaMinusOne H B
        (subgroupGenerator H σ) c)
  let a₂ : InducedModule (B := B) H :=
    sigmaMinusOne G
      (InducedModule (B := B) H) σ
      (inducedSection H σ hgen c)
  have hnu₁ :
      inducedCoordinateProduct H σ hgen a₁ =
        sigmaMinusOne H B
          (subgroupGenerator H σ) c :=
    inducedCoordinateProduct_section H σ hgen _
  have hnu₂ :
      inducedCoordinateProduct H σ hgen a₂ =
        sigmaMinusOne H B
          (subgroupGenerator H σ) c := by
    calc
      inducedCoordinateProduct H σ hgen a₂ =
          sigmaMinusOne H B
            (subgroupGenerator H σ)
            ((inducedSection H σ hgen c).1 1) :=
        inducedCoordinateProduct_sigmaMinusOne
          H σ hgen
            (inducedSection H σ hgen c)
      _ = sigmaMinusOne H B
            (subgroupGenerator H σ) c := by
        rw [inducedSection_apply_one
          H σ hgen c]
  let d : InducedModule (B := B) H :=
    a₁ * a₂⁻¹
  have hnud :
      inducedCoordinateProduct H σ hgen d = 1 := by
    calc
      inducedCoordinateProduct H σ hgen d =
          inducedCoordinateProduct H σ hgen a₁ *
            (inducedCoordinateProduct
              H σ hgen a₂)⁻¹ := by
        simp only [d, map_mul, map_inv]
      _ = 1 := by
        rw [hnu₁, hnu₂, mul_inv_cancel]
  have hd :
      d ∈ augmentationSubgroup G
        (InducedModule (B := B) H) σ :=
    inducedCoordinateProduct_eq_one_mem_augmentation
      H σ hgen d hnud
  have ha₂ :
      a₂ ∈ augmentationSubgroup G
        (InducedModule (B := B) H) σ :=
    ⟨inducedSection H σ hgen c, rfl⟩
  have hmul :=
    (augmentationSubgroup G
      (InducedModule (B := B) H) σ).mul_mem
        hd ha₂
  have heq : d * a₂ = a₁ := by simp [d]
  rw [heq] at hmul
  exact hmul
 
noncomputable def inducedNormKernelProductHom (σ : G)
    (hgen : ∀ x : G, x ∈ Subgroup.zpowers σ) :
    normKernelSubgroup G
        (InducedModule (B := B) H) →*
      normKernelSubgroup H B where
  toFun f :=
    ⟨inducedCoordinateProduct H σ hgen f.1,
      inducedCoordinateProduct_mem_normKernel
        H σ hgen f.2⟩
  map_one' := by
    apply Subtype.ext
    exact map_one
      (inducedCoordinateProduct H σ hgen)
  map_mul' x y := by
    apply Subtype.ext
    exact map_mul
      (inducedCoordinateProduct H σ hgen)
        x.1 y.1
 
noncomputable def inducedNormKernelSectionHom (σ : G)
    (hgen : ∀ x : G, x ∈ Subgroup.zpowers σ) :
    normKernelSubgroup H B →*
      normKernelSubgroup G
        (InducedModule (B := B) H) where
  toFun b :=
    ⟨inducedSection H σ hgen b.1,
      inducedSection_mem_normKernel
        H σ hgen b.2⟩
  map_one' := by
    apply Subtype.ext
    exact map_one (inducedSection H σ hgen)
  map_mul' x y := by
    apply Subtype.ext
    exact map_mul (inducedSection H σ hgen)
      x.1 y.1
 
noncomputable def inducedHerbrandHMinusOneEquiv
    (σ : G)
    (hgen : ∀ x : G, x ∈ Subgroup.zpowers σ) :
    HerbrandHMinusOne G
        (InducedModule (B := B) H) σ ≃*
      HerbrandHMinusOne H B
        (subgroupGenerator H σ) := by
  let f :
      normKernelSubgroup G
          (InducedModule (B := B) H) →*
        normKernelSubgroup H B :=
    inducedNormKernelProductHom H σ hgen
  let s :
      normKernelSubgroup H B →*
        normKernelSubgroup G
          (InducedModule (B := B) H) :=
    inducedNormKernelSectionHom H σ hgen
  let IG :=
    (augmentationSubgroup G
      (InducedModule (B := B) H) σ).subgroupOf
        (normKernelSubgroup G
          (InducedModule (B := B) H))
  let IH :=
    (augmentationSubgroup H B
      (subgroupGenerator H σ)).subgroupOf
        (normKernelSubgroup H B)
  exact quotientMulEquivOfSplit
    IG IH f s
    (fun y ↦ by
      apply Subtype.ext
      exact inducedCoordinateProduct_section
        H σ hgen y.1)
    (fun x hx ↦ by
      rw [Subgroup.mem_subgroupOf] at hx ⊢
      exact inducedCoordinateProduct_mem_augmentation
        H σ hgen hx)
    (fun y hy ↦ by
      rw [Subgroup.mem_subgroupOf] at hy ⊢
      exact inducedSection_mem_augmentation
        H σ hgen hy)
    (fun x hx ↦ by
      rw [Subgroup.mem_subgroupOf]
      apply
        inducedCoordinateProduct_eq_one_mem_augmentation
          H σ hgen x.1
      exact congrArg Subtype.val hx)
end InducedHerbrandHMinusOne
section FiniteCyclicGroup
variable [Group G] [Fintype G] [CommGroup B]
variable (H : Subgroup G) [MulDistribMulAction H B]
 


noncomputable def subgroupGeneratorOfGenerator (σ : G)
    (hgen : ∀ x : G, x ∈ Subgroup.zpowers σ) : H := by
  letI : IsCyclic G := ⟨⟨σ, hgen⟩⟩
  letI : CommGroup G := IsCyclic.commGroup
  exact subgroupGenerator H σ
 

noncomputable def inducedHerbrandH0EquivOfFiniteCyclic
    (σ : G)
    (hgen : ∀ x : G, x ∈ Subgroup.zpowers σ) :
    letI : Fintype H := Fintype.ofFinite H
    HerbrandH0 G (InducedModule (B := B) H) ≃*
      HerbrandH0 H B := by
  letI : Fintype H := Fintype.ofFinite H
  letI : IsCyclic G := ⟨⟨σ, hgen⟩⟩
  letI : CommGroup G := IsCyclic.commGroup
  exact inducedHerbrandH0Equiv H σ hgen
 

noncomputable def inducedHerbrandHMinusOneEquivOfFiniteCyclic
    (σ : G)
    (hgen : ∀ x : G, x ∈ Subgroup.zpowers σ) :
    letI : Fintype H := Fintype.ofFinite H
    HerbrandHMinusOne G
        (InducedModule (B := B) H) σ ≃*
      HerbrandHMinusOne H B
        (subgroupGeneratorOfGenerator H σ hgen) := by
  letI : Fintype H := Fintype.ofFinite H
  letI : IsCyclic G := ⟨⟨σ, hgen⟩⟩
  letI : CommGroup G := IsCyclic.commGroup
  have hτ :
      subgroupGeneratorOfGenerator H σ hgen =
        subgroupGenerator H σ :=
    Subtype.ext (by rfl)
  rw [hτ]
  exact inducedHerbrandHMinusOneEquiv H σ hgen
end FiniteCyclicGroup
end CyclicCohomology
end
end

/- GaloisCohomology.Cyclic.Herbrand.HerbrandLowDegree.Product -/
section
noncomputable section
namespace CyclicCohomology
open CyclicCohomology.ProfiniteCohomology.Herbrand
universe uG uι uA
 
abbrev piMulDistribMulAction
    (G : Type uG) [Group G]
    {ι : Type uι} (A : ι → Type uA)
    [∀ i, CommGroup (A i)]
    [∀ i, MulDistribMulAction G (A i)] :
    MulDistribMulAction G (∀ i, A i) where
  smul g x i := g • x i
  one_smul x := by
    funext i
    exact one_smul G (x i)
  mul_smul g h x := by
    funext i
    exact mul_smul g h (x i)
  smul_one g := by
    funext i
    exact MulDistribMulAction.smul_one g
  smul_mul g x y := by
    funext i
    exact MulDistribMulAction.smul_mul g (x i) (y i)
 
def piSubgroup (ι : Type uι) (A : ι → Type uA)
    [∀ i, CommGroup (A i)]
    (N : ∀ i, Subgroup (A i)) :
    Subgroup (∀ i, A i) where
  carrier := {x | ∀ i, x i ∈ N i}
  one_mem' i := (N i).one_mem
  mul_mem' hx hy i := (N i).mul_mem (hx i) (hy i)
  inv_mem' hx i := (N i).inv_mem (hx i)
 
noncomputable def piQuotientMap
    (ι : Type uι) (A : ι → Type uA)
    [∀ i, CommGroup (A i)]
    (N : ∀ i, Subgroup (A i)) :
    (∀ i, A i) →* ∀ i, A i ⧸ N i where
  toFun x i := QuotientGroup.mk' (N i) (x i)
  map_one' := by
    ext i
    exact (QuotientGroup.mk' (N i)).map_one
  map_mul' x y := by
    ext i
    exact (QuotientGroup.mk' (N i)).map_mul
      (x i) (y i)
@[simp]
theorem piQuotientMap_apply
    (ι : Type uι) (A : ι → Type uA)
    [∀ i, CommGroup (A i)]
    (N : ∀ i, Subgroup (A i))
    (x : ∀ i, A i) (i : ι) :
    piQuotientMap ι A N x i =
      QuotientGroup.mk' (N i) (x i) :=
  rfl
theorem ker_piQuotientMap
    (ι : Type uι) (A : ι → Type uA)
    [∀ i, CommGroup (A i)]
    (N : ∀ i, Subgroup (A i)) :
    (piQuotientMap ι A N).ker =
      piSubgroup ι A N := by
  ext x
  constructor
  · intro hx i
    have hmap :
        piQuotientMap ι A N x = 1 :=
      MonoidHom.mem_ker.mp hx
    have hi : QuotientGroup.mk' (N i) (x i) = 1 :=
      (piQuotientMap_apply ι A N x i).symm.trans (congrFun hmap i)
    exact
      (QuotientGroup.eq_one_iff
        (N := N i) (x := x i)).mp hi
  · intro hx
    exact MonoidHom.mem_ker.mpr <| by
      ext i
      exact
        (QuotientGroup.eq_one_iff
          (N := N i) (x := x i)).mpr (hx i)
theorem piQuotientMap_surjective
    (ι : Type uι) (A : ι → Type uA)
    [∀ i, CommGroup (A i)]
    (N : ∀ i, Subgroup (A i)) :
    Function.Surjective (piQuotientMap ι A N) := by
  intro y
  choose x hx using fun i =>
    QuotientGroup.mk'_surjective (N i) (y i)
  refine ⟨x, ?_⟩
  ext i
  exact hx i
 

noncomputable def piQuotientEquiv
    (ι : Type uι) (A : ι → Type uA)
    [∀ i, CommGroup (A i)]
    (N : ∀ i, Subgroup (A i)) :
    (∀ i, A i) ⧸ piSubgroup ι A N ≃*
      ∀ i, A i ⧸ N i :=
  (QuotientGroup.quotientMulEquivOfEq
    (ker_piQuotientMap ι A N).symm).trans
    (QuotientGroup.quotientKerEquivOfSurjective
      (piQuotientMap ι A N)
      (piQuotientMap_surjective ι A N))
section TateProducts
variable {G : Type uG} [Group G] [Fintype G]
variable {ι : Type uι} (A : ι → Type uA)
variable [∀ i, CommGroup (A i)]
variable [∀ i, MulDistribMulAction G (A i)]
local instance :
    MulDistribMulAction G (∀ i, A i) :=
  piMulDistribMulAction G A
 
def fixedPiEquiv :
    fixedSubgroup G (∀ i, A i) ≃*
      ∀ i, fixedSubgroup G (A i) where
  toFun x i := ⟨x.1 i, fun g ↦ congrFun (x.2 g) i⟩
  invFun x := ⟨fun i ↦ (x i).1, fun g ↦ by
    funext i
    exact (x i).2 g⟩
  left_inv _ := rfl
  right_inv _ := rfl
  map_mul' _ _ := rfl
 
def normKernelPiEquiv :
    normKernelSubgroup G (∀ i, A i) ≃*
      ∀ i, normKernelSubgroup G (A i) where
  toFun x i := ⟨x.1 i, by
    change tateNorm G (A i) (x.1 i) = 1
    have hi := congrFun x.2 i
    simpa only [tateNormHom_apply, tateNorm, Finset.prod_apply,
      Pi.smul_apply, Pi.one_apply] using hi⟩
  invFun x := ⟨fun i ↦ (x i).1, by
    funext i
    change
      (tateNorm G (∀ i, A i)
        (fun i ↦ (x i).1)) i = 1
    have hi := (x i).2
    change tateNormHom (G := G) (A := A i) (x i).1 = 1 at hi
    rw [tateNormHom_apply] at hi
    simpa only [tateNorm, Finset.prod_apply,
      Pi.smul_apply] using hi⟩
  left_inv _ := rfl
  right_inv _ := rfl
  map_mul' _ _ := rfl
 
noncomputable def herbrandH0PiEquiv :
    HerbrandH0 G (∀ i, A i) ≃*
      ∀ i, HerbrandH0 G (A i) := by
  let e :
      fixedSubgroup G (∀ i, A i) ≃*
        ∀ i, fixedSubgroup G (A i) :=
    fixedPiEquiv (G := G) A
  let N :=
    (tateNormSubgroup G (∀ i, A i)).subgroupOf
      (fixedSubgroup G (∀ i, A i))
  let M :=
    piSubgroup ι
      (fun i ↦ fixedSubgroup G (A i))
      (fun i ↦
        (tateNormSubgroup G (A i)).subgroupOf
          (fixedSubgroup G (A i)))
  let q :
      fixedSubgroup G (∀ i, A i) ⧸ N ≃*
        (∀ i, fixedSubgroup G (A i)) ⧸ M :=
    quotientMulEquivOfSplit
      N M e.toMonoidHom e.symm.toMonoidHom
      (fun y ↦ e.apply_symm_apply y)
      (fun x hx ↦ by
        rw [Subgroup.mem_subgroupOf] at hx
        change ∀ i, _ at ⊢
        rcases hx with ⟨a, ha⟩
        intro i
        rw [Subgroup.mem_subgroupOf]
        refine ⟨a i, ?_⟩
        have hi := congrFun ha i
        simpa [tateNormHom_apply, tateNorm, e, fixedPiEquiv] using hi)
      (fun y hy ↦ by
        change ∀ i, _ at hy
        have hy' :
            ∀ i, ∃ a : A i,
              tateNorm G (A i) a = (y i).1 := by
          intro i
          have hyi :
              (y i : A i) ∈ tateNormSubgroup G (A i) := by
            simpa only [Subgroup.mem_subgroupOf] using hy i
          rcases hyi with ⟨a, ha⟩
          exact ⟨a, by simpa only [tateNormHom_apply] using ha⟩
        choose a ha using hy'
        rw [Subgroup.mem_subgroupOf]
        refine ⟨fun i ↦ a i, ?_⟩
        funext i
        have hi := ha i
        simpa [tateNormHom_apply, e, fixedPiEquiv, tateNorm] using hi)
      (fun x hx ↦ by
        have hx1 : x = 1 := by
          apply e.injective
          simpa [e] using hx
        rw [hx1]
        exact N.one_mem)
  exact q.trans
    (piQuotientEquiv ι
      (fun i ↦ fixedSubgroup G (A i))
      (fun i ↦
        (tateNormSubgroup G (A i)).subgroupOf
          (fixedSubgroup G (A i))))
 
noncomputable def herbrandHMinusOnePiEquiv (σ : G) :
    HerbrandHMinusOne G (∀ i, A i) σ ≃*
      ∀ i, HerbrandHMinusOne G (A i) σ := by
  let e :
      normKernelSubgroup G (∀ i, A i) ≃*
        ∀ i, normKernelSubgroup G (A i) :=
    normKernelPiEquiv (G := G) A
  let N :=
    (augmentationSubgroup G (∀ i, A i) σ).subgroupOf
      (normKernelSubgroup G (∀ i, A i))
  let M :=
    piSubgroup ι
      (fun i ↦ normKernelSubgroup G (A i))
      (fun i ↦
        (augmentationSubgroup G (A i) σ).subgroupOf
          (normKernelSubgroup G (A i)))
  let q :
      normKernelSubgroup G (∀ i, A i) ⧸ N ≃*
        (∀ i, normKernelSubgroup G (A i)) ⧸ M :=
    quotientMulEquivOfSplit
      N M e.toMonoidHom e.symm.toMonoidHom
      (fun y ↦ e.apply_symm_apply y)
      (fun x hx ↦ by
        rw [Subgroup.mem_subgroupOf] at hx
        change ∀ i, _ at ⊢
        rcases hx with ⟨a, ha⟩
        intro i
        rw [Subgroup.mem_subgroupOf]
        refine ⟨a i, ?_⟩
        have hi := congrFun ha i
        simpa [sigmaMinusOneHom_apply, sigmaMinusOne, e,
          normKernelPiEquiv] using hi)
      (fun y hy ↦ by
        change ∀ i, _ at hy
        have hy' :
            ∀ i, ∃ a : A i,
              sigmaMinusOne G (A i) σ a =
                (y i).1 := by
          intro i
          have hyi :
              (y i : A i) ∈ augmentationSubgroup G (A i) σ := by
            simpa only [Subgroup.mem_subgroupOf] using hy i
          rcases hyi with ⟨a, ha⟩
          exact ⟨a, by simpa only [sigmaMinusOneHom_apply] using ha⟩
        choose a ha using hy'
        rw [Subgroup.mem_subgroupOf]
        refine ⟨fun i ↦ a i, ?_⟩
        funext i
        have hi := ha i
        simpa [sigmaMinusOneHom_apply, e, normKernelPiEquiv,
          sigmaMinusOne] using hi)
      (fun x hx ↦ by
        have hx1 : x = 1 := by
          apply e.injective
          simpa [e] using hx
        rw [hx1]
        exact N.one_mem)
  exact q.trans
    (piQuotientEquiv ι
      (fun i ↦ normKernelSubgroup G (A i))
      (fun i ↦
        (augmentationSubgroup G (A i) σ).subgroupOf
          (normKernelSubgroup G (A i))))
end TateProducts
end CyclicCohomology
end
end

/- GaloisCohomology.Cyclic.Herbrand.Product -/
section
open scoped BigOperators
noncomputable section
namespace CyclicCohomology
open CyclicCohomology.ProfiniteCohomology.Herbrand
universe uG uι uA
variable {G : Type uG} [Group G] [Fintype G]
variable {ι : Type uι} [Fintype ι]
variable (A : ι → Type uA)
variable [∀ i, CommGroup (A i)]
variable [∀ i, MulDistribMulAction G (A i)]
local instance :
    MulDistribMulAction G (∀ i, A i) :=
  piMulDistribMulAction G A
 

theorem herbrandQuotient_pi
    (σ : G)
    [∀ i, Finite (HerbrandH0 G (A i))]
    [∀ i, Finite (HerbrandHMinusOne G (A i) σ)] :
    letI : Finite (HerbrandH0 G (∀ i, A i)) :=
      Finite.of_equiv
        (∀ i, HerbrandH0 G (A i))
        (herbrandH0PiEquiv (G := G) A).symm.toEquiv
    letI : Finite (HerbrandHMinusOne G (∀ i, A i) σ) :=
      Finite.of_equiv
        (∀ i, HerbrandHMinusOne G (A i) σ)
        (herbrandHMinusOnePiEquiv
          (G := G) A σ).symm.toEquiv
    herbrandQuotient (G := G) (A := ∀ i, A i) σ =
      ∏ i, herbrandQuotient (G := G) (A := A i) σ := by
  let : Finite (HerbrandH0 G (∀ i, A i)) :=
    Finite.of_equiv
      (∀ i, HerbrandH0 G (A i))
      (herbrandH0PiEquiv (G := G) A).symm.toEquiv
  let : Finite (HerbrandHMinusOne G (∀ i, A i) σ) :=
    Finite.of_equiv
      (∀ i, HerbrandHMinusOne G (A i) σ)
      (herbrandHMinusOnePiEquiv
        (G := G) A σ).symm.toEquiv
  unfold herbrandQuotient
  rw [Nat.card_congr
      (herbrandH0PiEquiv (G := G) A).toEquiv,
    Nat.card_congr
      (herbrandHMinusOnePiEquiv
        (G := G) A σ).toEquiv,
    Nat.card_pi, Nat.card_pi]
  simp only [Nat.cast_prod]
  simpa only [Finset.mem_univ, Finset.prod_const_one,
    Finset.prod_filter, true_and] using
    (Finset.prod_div_distrib
      (s := Finset.univ)
      (fun i : ι ↦
        (Nat.card (HerbrandH0 G (A i)) : ℚ))
      (fun i : ι ↦
        (Nat.card
          (HerbrandHMinusOne G (A i) σ) : ℚ))).symm
end CyclicCohomology
end
end

/- GaloisCohomology.Cyclic.Herbrand.HerbrandFiniteness -/
section
namespace CyclicCohomology
noncomputable section
namespace ProfiniteCohomology
namespace Herbrand
open CategoryTheory
universe uG uA
variable {G A B C : Type}
variable [Group G] [Fintype G] [CommGroup A] [CommGroup B] [CommGroup C]
variable [MulDistribMulAction G A] [MulDistribMulAction G B]
  [MulDistribMulAction G C]
 
def HerbrandQuotientDefined (G : Type uG) (A : Type uA)
    [Group G] [Fintype G] [CommGroup A] [MulDistribMulAction G A]
    (σ : G) : Prop :=
  Finite (HerbrandH0 G A) ∧ Finite (HerbrandHMinusOne G A σ)
 

private theorem finite_middle_of_exact
    {X Y Z : Type}
    [Group X] [Group Y] [Group Z]
    (f : X →* Y) (g : Y →* Z) (hexact : MonoidHom.range f = MonoidHom.ker g)
    [Finite X] [Finite Z] :
    Finite Y := by
  apply g.finite_iff_finite_ker_range.mpr
  constructor
  · let : Finite (MonoidHom.range f) :=
      Finite.of_surjective f.rangeRestrict f.rangeRestrict_surjective
    rw [← hexact]
    infer_instance
  · infer_instance
private theorem finite_middle_of_moduleCat_exact
    {X Y Z : ModuleCat.{0} ℤ} (f : X ⟶ Y) (g : Y ⟶ Z)
    (hexact : Function.Exact f g)
    [Finite X] [Finite Z] :
    Finite Y := by
  let fm : Multiplicative X →* Multiplicative Y :=
    f.hom.toAddMonoidHom.toMultiplicative
  let gm : Multiplicative Y →* Multiplicative Z :=
    g.hom.toAddMonoidHom.toMultiplicative
  exact finite_middle_of_exact
    (X := Multiplicative X) (Y := Multiplicative Y)
    (Z := Multiplicative Z) fm gm
    (mulExact_of_moduleCat_exact f g hexact).monoidHom_ker_eq.symm
private noncomputable def tateHOneIsoHerbrandHMinusOne
    (σ : G) (hgen : ∀ g : G, g ∈ Subgroup.zpowers σ) :
    tateCohomology (Rep.ofMulDistribMulAction G A) 1 ≅
      ModuleCat.of ℤ (Additive (HerbrandHMinusOne G A σ)) := by
  letI : IsCyclic G := ⟨⟨σ, hgen⟩⟩
  letI : CommGroup G := IsCyclic.commGroup
  let M := Rep.ofMulDistribMulAction G A
  exact
    (TateCohomology.isoGroupCohomology 1).app M ≪≫
      Rep.FiniteCyclicGroup.groupCohomologyIsoOdd
        M σ hgen 1 (by simp) ≪≫
      (TateCohomology.isoFiniteCyclicNegOne M σ hgen).symm ≪≫
      tateHMinusOneIsoHerbrandHMinusOne σ hgen
private noncomputable def tateHMinusTwoIsoHerbrandH0
    (σ : G) (hgen : ∀ g : G, g ∈ Subgroup.zpowers σ) :
    tateCohomology (Rep.ofMulDistribMulAction G A) (-2) ≅
      ModuleCat.of ℤ (Additive (HerbrandH0 G A)) := by
  classical
  letI : IsCyclic G := ⟨⟨σ, hgen⟩⟩
  letI : CommGroup G := IsCyclic.commGroup
  let M := Rep.ofMulDistribMulAction G A
  exact
    (TateCohomology.isoGroupHomology (-2) 1 (by norm_num)).app M ≪≫
      Rep.FiniteCyclicGroup.groupHomologyIsoOdd
        M σ hgen 1 (by simp) ≪≫
      (TateCohomology.isoFiniteCyclicZero M σ hgen).symm ≪≫
      tateH0IsoHerbrandH0
 

theorem herbrandQuotientDefined_middle_of_left_right
    (i : A →* B) (j : B →* C)
    (hi : ∀ (g : G) (a : A), i (g • a) = g • i a)
    (hj : ∀ (g : G) (b : B), j (g • b) = g • j b)
    (hker : ∀ b : B, j b = 1 ↔ ∃ a : A, i a = b)
    (hinj : Function.Injective i)
    (hsurj : ∀ c : C, ∃ b : B, j b = c)
    (σ : G) (hgen : ∀ g : G, g ∈ Subgroup.zpowers σ)
    (hA : HerbrandQuotientDefined G A σ)
    (hC : HerbrandQuotientDefined G C σ) :
    HerbrandQuotientDefined G B σ := by
  let : Finite (HerbrandH0 G A) := hA.1
  let : Finite (HerbrandHMinusOne G A σ) := hA.2
  let : Finite (HerbrandH0 G C) := hC.1
  let : Finite (HerbrandHMinusOne G C σ) := hC.2
  let S := equivariantShortComplex i j hi hj hker
  have hS : S.ShortExact :=
    equivariantShortComplex_shortExact
      i j hi hj hker hinj hsurj
  let : Finite (tateCohomology S.X₁ (-1)) :=
    finite_source_of_moduleIso
      (tateHMinusOneIsoHerbrandHMinusOne
        (G := G) (A := A) σ hgen)
  let : Finite (tateCohomology S.X₃ (-1)) :=
    finite_source_of_moduleIso
      (tateHMinusOneIsoHerbrandHMinusOne
        (G := G) (A := C) σ hgen)
  have hminusTate : Finite (tateCohomology S.X₂ (-1)) :=
    finite_middle_of_moduleCat_exact
      ((tateCohomologyFunctor (-1)).map S.f)
      ((tateCohomologyFunctor (-1)).map S.g)
      ((ShortComplex.ShortExact.moduleCat_exact_iff_function_exact _).1
        ((TateCohomology.map_tateComplexFunctor_shortExact hS)
          |>.homology_exact₂ (-1)))
  have hminus : Finite (HerbrandHMinusOne G B σ) := by
    let :
        Finite
          (tateCohomology
            (Rep.ofMulDistribMulAction G B) (-1)) := by
      change Finite (tateCohomology S.X₂ (-1))
      exact hminusTate
    exact finite_target_of_moduleIso
      (tateHMinusOneIsoHerbrandHMinusOne
        (G := G) (A := B) σ hgen)
  let : Finite (tateCohomology S.X₁ 0) :=
    finite_source_of_moduleIso
      (tateH0IsoHerbrandH0 (G := G) (A := A))
  let : Finite (tateCohomology S.X₃ 0) :=
    finite_source_of_moduleIso
      (tateH0IsoHerbrandH0 (G := G) (A := C))
  have hzeroTate : Finite (tateCohomology S.X₂ 0) :=
    finite_middle_of_moduleCat_exact
      ((tateCohomologyFunctor 0).map S.f)
      ((tateCohomologyFunctor 0).map S.g)
      ((ShortComplex.ShortExact.moduleCat_exact_iff_function_exact _).1
        ((TateCohomology.map_tateComplexFunctor_shortExact hS)
          |>.homology_exact₂ 0))
  have hzero : Finite (HerbrandH0 G B) := by
    let :
        Finite
          (tateCohomology
            (Rep.ofMulDistribMulAction G B) 0) := by
      change Finite (tateCohomology S.X₂ 0)
      exact hzeroTate
    exact finite_target_of_moduleIso
      (tateH0IsoHerbrandH0 (G := G) (A := B))
  exact ⟨hzero, hminus⟩
 

theorem herbrandQuotientDefined_left_of_middle_right
    (i : A →* B) (j : B →* C)
    (hi : ∀ (g : G) (a : A), i (g • a) = g • i a)
    (hj : ∀ (g : G) (b : B), j (g • b) = g • j b)
    (hker : ∀ b : B, j b = 1 ↔ ∃ a : A, i a = b)
    (hinj : Function.Injective i)
    (hsurj : ∀ c : C, ∃ b : B, j b = c)
    (σ : G) (hgen : ∀ g : G, g ∈ Subgroup.zpowers σ)
    (hB : HerbrandQuotientDefined G B σ)
    (hC : HerbrandQuotientDefined G C σ) :
    HerbrandQuotientDefined G A σ := by
  let : Finite (HerbrandH0 G B) := hB.1
  let : Finite (HerbrandHMinusOne G B σ) := hB.2
  let : Finite (HerbrandH0 G C) := hC.1
  let : Finite (HerbrandHMinusOne G C σ) := hC.2
  let S := equivariantShortComplex i j hi hj hker
  have hS : S.ShortExact :=
    equivariantShortComplex_shortExact
      i j hi hj hker hinj hsurj
  let : Finite (tateCohomology S.X₃ (-2)) :=
    finite_source_of_moduleIso
      (tateHMinusTwoIsoHerbrandH0
        (G := G) (A := C) σ hgen)
  have hBminus : Finite (tateCohomology S.X₂ (-1)) :=
    finite_source_of_moduleIso
      (tateHMinusOneIsoHerbrandHMinusOne
        (G := G) (A := B) σ hgen)
  let : Finite ((tateCohomologyFunctor ((-2) + 1)).obj S.X₂) := by
    norm_num
    exact hBminus
  have hminusTate :
      Finite (tateCohomology S.X₁ ((-2) + 1)) :=
    finite_middle_of_moduleCat_exact
      (TateCohomology.δ hS (-2))
      ((tateCohomologyFunctor ((-2) + 1)).map S.f)
      ((ShortComplex.ShortExact.moduleCat_exact_iff_function_exact _).1
        (TateCohomology.exact₁ hS (-2)))
  have hminus : Finite (HerbrandHMinusOne G A σ) := by
    let :
        Finite
          (tateCohomology
            (Rep.ofMulDistribMulAction G A) (-1)) := by
      norm_num at hminusTate ⊢
      exact hminusTate
    exact finite_target_of_moduleIso
      (tateHMinusOneIsoHerbrandHMinusOne
        (G := G) (A := A) σ hgen)
  let : Finite (tateCohomology S.X₃ (-1)) :=
    finite_source_of_moduleIso
      (tateHMinusOneIsoHerbrandHMinusOne
        (G := G) (A := C) σ hgen)
  let : Finite (tateCohomology S.X₂ 0) :=
    finite_source_of_moduleIso
      (tateH0IsoHerbrandH0 (G := G) (A := B))
  have hzeroTate : Finite (tateCohomology S.X₁ 0) :=
    finite_middle_of_moduleCat_exact
      (TateCohomology.δ hS (-1))
      ((tateCohomologyFunctor 0).map S.f)
      ((ShortComplex.ShortExact.moduleCat_exact_iff_function_exact _).1
        (TateCohomology.exact₁ hS (-1)))
  have hzero : Finite (HerbrandH0 G A) := by
    let :
        Finite
          (tateCohomology
            (Rep.ofMulDistribMulAction G A) 0) := by
      change Finite (tateCohomology S.X₁ 0)
      exact hzeroTate
    exact finite_target_of_moduleIso
      (tateH0IsoHerbrandH0 (G := G) (A := A))
  exact ⟨hzero, hminus⟩
 

theorem herbrandQuotient_multiplicative_of_shortExact
    (i : A →* B) (j : B →* C)
    (hi : ∀ (g : G) (a : A), i (g • a) = g • i a)
    (hj : ∀ (g : G) (b : B), j (g • b) = g • j b)
    (hker : ∀ b : B, j b = 1 ↔ ∃ a : A, i a = b)
    (hinj : Function.Injective i)
    (hsurj : ∀ c : C, ∃ b : B, j b = c)
    (σ : G) (hgen : ∀ g : G, g ∈ Subgroup.zpowers σ)
    [Finite (HerbrandH0 G A)] [Finite (HerbrandHMinusOne G A σ)]
    [Finite (HerbrandH0 G B)] [Finite (HerbrandHMinusOne G B σ)]
    [Finite (HerbrandH0 G C)] [Finite (HerbrandHMinusOne G C σ)] :
    herbrandQuotient (G := G) (A := B) σ =
      herbrandQuotient (G := G) (A := A) σ *
        herbrandQuotient (G := G) (A := C) σ :=
  herbrandQuotient_exact_multiplicative
    i j hi hj hker hinj hsurj σ hgen
 
theorem herbrandQuotient_eq_one_of_finite_module
    (σ : G) (hgen : ∀ g : G, g ∈ Subgroup.zpowers σ) [Finite A] :
    herbrandQuotient (G := G) (A := A) σ = 1 :=
  herbrandQuotient_finite_module_eq_one σ hgen
end Herbrand
end ProfiniteCohomology
end
end CyclicCohomology
end

/- GaloisCohomology.Cyclic.Herbrand.HerbrandLowDegree.EquivariantEquiv -/
section
noncomputable section
namespace CyclicCohomology
open CyclicCohomology.ProfiniteCohomology.Herbrand
universe uG uA uB
variable {G : Type uG} {A : Type uA} {B : Type uB}
    [Group G] [Fintype G]
    [CommGroup A] [CommGroup B]
    [MulDistribMulAction G A]
    [MulDistribMulAction G B]
 

theorem equivariantMulEquiv_map_tateNorm
    (e : A ≃* B)
    (he : ∀ (g : G) (a : A),
      e (g • a) = g • e a)
    (a : A) :
    e (tateNorm G A a) =
      tateNorm G B (e a) := by
  simpa using
    map_tateNorm
      (G := G) (A := A) (B := B)
      e.toMonoidHom
      (fun g x ↦ by simpa using he g x) a
omit [Fintype G] in
 

theorem equivariantMulEquiv_map_sigmaMinusOne
    (e : A ≃* B)
    (he : ∀ (g : G) (a : A),
      e (g • a) = g • e a)
    (σ : G) (a : A) :
    e (sigmaMinusOne G A σ a) =
      sigmaMinusOne G B σ (e a) := by
  simpa using
    map_sigmaMinusOne
      (G := G) (A := A) (B := B)
      e.toMonoidHom
      (fun g x ↦ by simpa using he g x) σ a
 

noncomputable def fixedSubgroupEquivariantMulEquiv
    (e : A ≃* B)
    (he : ∀ (g : G) (a : A),
      e (g • a) = g • e a) :
    fixedSubgroup G A ≃* fixedSubgroup G B where
  toFun a :=
    ⟨e a.1, fun g ↦ by
      rw [← he g a.1, a.2 g]⟩
  invFun b :=
    ⟨e.symm b.1, fun g ↦ by
      rw [← mulEquiv_symm_commutes_smul e he, b.2 g]⟩
  left_inv a := by
    apply Subtype.ext
    exact e.symm_apply_apply a.1
  right_inv b := by
    apply Subtype.ext
    exact e.apply_symm_apply b.1
  map_mul' _ _ := by
    apply Subtype.ext
    exact e.map_mul _ _
 

noncomputable def normKernelEquivariantMulEquiv
    (e : A ≃* B)
    (he : ∀ (g : G) (a : A),
      e (g • a) = g • e a) :
    normKernelSubgroup G A ≃*
      normKernelSubgroup G B where
  toFun a :=
    ⟨e a.1, by
      change tateNorm G B (e a.1) = 1
      calc
        tateNorm G B (e a.1) =
            e (tateNorm G A a.1) :=
          (equivariantMulEquiv_map_tateNorm
            e he a.1).symm
        _ = e 1 := congrArg e a.2
        _ = 1 := e.map_one⟩
  invFun b :=
    ⟨e.symm b.1, by
      change tateNorm G A (e.symm b.1) = 1
      apply e.injective
      calc
        e (tateNorm G A (e.symm b.1)) =
            tateNorm G B (e (e.symm b.1)) :=
          equivariantMulEquiv_map_tateNorm
            e he (e.symm b.1)
        _ = tateNorm G B b.1 := by
          rw [e.apply_symm_apply]
        _ = 1 := b.2
        _ = e 1 := e.map_one.symm⟩
  left_inv a := by
    apply Subtype.ext
    exact e.symm_apply_apply a.1
  right_inv b := by
    apply Subtype.ext
    exact e.apply_symm_apply b.1
  map_mul' _ _ := by
    apply Subtype.ext
    exact e.map_mul _ _
 

noncomputable def herbrandH0EquivariantMulEquiv
    (e : A ≃* B)
    (he : ∀ (g : G) (a : A),
      e (g • a) = g • e a) :
    HerbrandH0 G A ≃* HerbrandH0 G B := by
  let f := fixedSubgroupEquivariantMulEquiv e he
  let N :=
    (tateNormSubgroup G A).subgroupOf
      (fixedSubgroup G A)
  let M :=
    (tateNormSubgroup G B).subgroupOf
      (fixedSubgroup G B)
  exact quotientMulEquivOfSplit N M
    f.toMonoidHom f.symm.toMonoidHom
    (fun y ↦ f.apply_symm_apply y)
    (fun x hx ↦ by
      rw [Subgroup.mem_subgroupOf] at hx ⊢
      rcases hx with ⟨a, ha⟩
      refine ⟨e a, ?_⟩
      change tateNorm G B (e a) = e x.1
      calc
        tateNorm G B (e a) =
            e (tateNorm G A a) :=
          (equivariantMulEquiv_map_tateNorm
            e he a).symm
        _ = e x.1 := congrArg e ha)
    (fun y hy ↦ by
      rw [Subgroup.mem_subgroupOf] at hy ⊢
      rcases hy with ⟨b, hb⟩
      refine ⟨e.symm b, ?_⟩
      apply e.injective
      change
        e (tateNorm G A (e.symm b)) =
          e (e.symm y.1)
      calc
        e (tateNorm G A (e.symm b)) =
            tateNorm G B (e (e.symm b)) :=
          equivariantMulEquiv_map_tateNorm
            e he (e.symm b)
        _ = tateNorm G B b := by
          rw [e.apply_symm_apply]
        _ = y.1 := hb
        _ = e (e.symm y.1) :=
          (e.apply_symm_apply y.1).symm)
    (fun x hx ↦ by
      have hx1 : x = 1 := by
        apply f.injective
        simpa [f] using hx
      rw [hx1]
      exact N.one_mem)
 

noncomputable def herbrandHMinusOneEquivariantMulEquiv
    (e : A ≃* B)
    (he : ∀ (g : G) (a : A),
      e (g • a) = g • e a)
    (σ : G) :
    HerbrandHMinusOne G A σ ≃*
      HerbrandHMinusOne G B σ := by
  let f := normKernelEquivariantMulEquiv e he
  let N :=
    (augmentationSubgroup G A σ).subgroupOf
      (normKernelSubgroup G A)
  let M :=
    (augmentationSubgroup G B σ).subgroupOf
      (normKernelSubgroup G B)
  exact quotientMulEquivOfSplit N M
    f.toMonoidHom f.symm.toMonoidHom
    (fun y ↦ f.apply_symm_apply y)
    (fun x hx ↦ by
      rw [Subgroup.mem_subgroupOf] at hx ⊢
      rcases hx with ⟨a, ha⟩
      refine ⟨e a, ?_⟩
      change sigmaMinusOne G B σ (e a) = e x.1
      calc
        sigmaMinusOne G B σ (e a) =
            e (sigmaMinusOne G A σ a) :=
          (equivariantMulEquiv_map_sigmaMinusOne
            e he σ a).symm
        _ = e x.1 := congrArg e ha)
    (fun y hy ↦ by
      rw [Subgroup.mem_subgroupOf] at hy ⊢
      rcases hy with ⟨b, hb⟩
      refine ⟨e.symm b, ?_⟩
      apply e.injective
      change
        e (sigmaMinusOne G A σ (e.symm b)) =
          e (e.symm y.1)
      calc
        e (sigmaMinusOne G A σ (e.symm b)) =
            sigmaMinusOne G B σ (e (e.symm b)) :=
          equivariantMulEquiv_map_sigmaMinusOne
            e he σ (e.symm b)
        _ = sigmaMinusOne G B σ b := by
          rw [e.apply_symm_apply]
        _ = y.1 := hb
        _ = e (e.symm y.1) :=
          (e.apply_symm_apply y.1).symm)
    (fun x hx ↦ by
      have hx1 : x = 1 := by
        apply f.injective
        simpa [f] using hx
      rw [hx1]
      exact N.one_mem)
 

theorem herbrandH0Finite_of_equivariantMulEquiv
    (e : A ≃* B)
    (he : ∀ (g : G) (a : A),
      e (g • a) = g • e a)
    [Finite (HerbrandH0 G A)] :
    Finite (HerbrandH0 G B) :=
  Finite.of_equiv
    (HerbrandH0 G A)
    (herbrandH0EquivariantMulEquiv e he).toEquiv
 

theorem herbrandHMinusOneFinite_of_equivariantMulEquiv
    (e : A ≃* B)
    (he : ∀ (g : G) (a : A),
      e (g • a) = g • e a)
    (σ : G)
    [Finite (HerbrandHMinusOne G A σ)] :
    Finite (HerbrandHMinusOne G B σ) :=
  Finite.of_equiv
    (HerbrandHMinusOne G A σ)
    (herbrandHMinusOneEquivariantMulEquiv
      e he σ).toEquiv
 

theorem herbrandQuotient_eq_of_equivariantMulEquiv
    (e : A ≃* B)
    (he : ∀ (g : G) (a : A),
      e (g • a) = g • e a)
    (σ : G)
    [Finite (HerbrandH0 G A)]
    [Finite (HerbrandHMinusOne G A σ)] :
    letI _h0B : Finite (HerbrandH0 G B) :=
      herbrandH0Finite_of_equivariantMulEquiv e he
    letI _hMinusOneB :
        Finite (HerbrandHMinusOne G B σ) :=
      herbrandHMinusOneFinite_of_equivariantMulEquiv
        e he σ
    herbrandQuotient (G := G) (A := A) σ =
      herbrandQuotient (G := G) (A := B) σ := by
  let h0B : Finite (HerbrandH0 G B) :=
    herbrandH0Finite_of_equivariantMulEquiv e he
  let hMinusOneB :
      Finite (HerbrandHMinusOne G B σ) :=
    herbrandHMinusOneFinite_of_equivariantMulEquiv
      e he σ
  have h0Card :
      Nat.card (HerbrandH0 G A) =
        Nat.card (HerbrandH0 G B) := by
    exact Nat.card_congr
      (herbrandH0EquivariantMulEquiv e he).toEquiv
  have hMinusOneCard :
      Nat.card (HerbrandHMinusOne G A σ) =
        Nat.card
          (HerbrandHMinusOne G B σ) := by
    exact Nat.card_congr
      (herbrandHMinusOneEquivariantMulEquiv
        e he σ).toEquiv
  rw [herbrandQuotient_eq_card_ratio,
    herbrandQuotient_eq_card_ratio,
    h0Card, hMinusOneCard]
end CyclicCohomology
end
end

/- GaloisCohomology.Cyclic.Herbrand.Permutation.Module -/
section
open scoped BigOperators
noncomputable section
namespace CyclicCohomology
open CyclicCohomology.ProfiniteCohomology.Herbrand
universe uG uA uι
 

abbrev trivialIntMulDistribMulAction
    (G : Type uG) [Group G] :
    MulDistribMulAction G (Multiplicative ℤ) where
  smul _ a := a
  one_smul _ := rfl
  mul_smul _ _ _ := rfl
  smul_one _ := rfl
  smul_mul _ _ _ := rfl
section TrivialInteger
variable {G : Type uG} [Group G] [Fintype G]
 

theorem trivialInt_tateNorm_toAdd
    (a : Multiplicative ℤ) :
    letI := trivialIntMulDistribMulAction G
    Multiplicative.toAdd
        (tateNorm G (Multiplicative ℤ) a) =
      (Fintype.card G : ℤ) * Multiplicative.toAdd a := by
  let := trivialIntMulDistribMulAction G
  have hsmul (g : G) : g • a = a := rfl
  simp [tateNorm, hsmul]
 

def trivialIntFixedToZModHom :
    letI := trivialIntMulDistribMulAction G
    fixedSubgroup G (Multiplicative ℤ) →*
      Multiplicative (ZMod (Fintype.card G)) := by
  letI := trivialIntMulDistribMulAction G
  exact
    { toFun := fun x ↦ Multiplicative.ofAdd
        ((Multiplicative.toAdd
          (x : Multiplicative ℤ) : ℤ) :
            ZMod (Fintype.card G))
      map_one' := by simp
      map_mul' := by
        intro x y
        simp }
theorem trivialIntFixedToZModHom_surjective :
    letI := trivialIntMulDistribMulAction G
    Function.Surjective
      (trivialIntFixedToZModHom (G := G)) := by
  let := trivialIntMulDistribMulAction G
  intro y
  rcases ZMod.intCast_surjective
      (Multiplicative.toAdd y) with ⟨z, hz⟩
  let x : fixedSubgroup G (Multiplicative ℤ) :=
    ⟨Multiplicative.ofAdd z, by intro g; rfl⟩
  refine ⟨x, ?_⟩
  rw [show trivialIntFixedToZModHom
      (G := G) x =
        Multiplicative.ofAdd
          ((z : ℤ) : ZMod (Fintype.card G)) by rfl]
  exact congrArg Multiplicative.ofAdd hz
 
theorem trivialIntFixedToZModHom_ker :
    letI := trivialIntMulDistribMulAction G
    MonoidHom.ker
        (trivialIntFixedToZModHom (G := G)) =
      (tateNormSubgroup G
        (Multiplicative ℤ)).subgroupOf
          (fixedSubgroup G (Multiplicative ℤ)) := by
  let := trivialIntMulDistribMulAction G
  ext x
  rw [MonoidHom.mem_ker]
  constructor
  · intro hx
    have hx0 :
        ((Multiplicative.toAdd
          (x : Multiplicative ℤ) : ℤ) :
            ZMod (Fintype.card G)) = 0 := by
      exact congrArg Multiplicative.toAdd hx
    rcases
        (ZMod.intCast_zmod_eq_zero_iff_dvd _ _).1 hx0
      with ⟨z, hz⟩
    change (x : Multiplicative ℤ) ∈
      tateNormSubgroup G (Multiplicative ℤ)
    refine ⟨Multiplicative.ofAdd z, ?_⟩
    have htoAdd :
        Multiplicative.toAdd
            (tateNorm G (Multiplicative ℤ)
              (Multiplicative.ofAdd z)) =
          Multiplicative.toAdd
            (x : Multiplicative ℤ) := by
      rw [trivialInt_tateNorm_toAdd]
      exact hz.symm
    exact congrArg Multiplicative.ofAdd htoAdd
  · intro hx
    change (x : Multiplicative ℤ) ∈
      tateNormSubgroup G (Multiplicative ℤ) at hx
    rcases hx with ⟨z, hz⟩
    exact congrArg Multiplicative.ofAdd (by
      change
        ((Multiplicative.toAdd
          (x : Multiplicative ℤ) : ℤ) :
            ZMod (Fintype.card G)) = 0
      rw [← hz, tateNormHom_apply, trivialInt_tateNorm_toAdd]
      apply (ZMod.intCast_zmod_eq_zero_iff_dvd _ _).2
      exact ⟨Multiplicative.toAdd z, rfl⟩)
 

noncomputable def trivialIntHerbrandH0EquivZMod :
    letI := trivialIntMulDistribMulAction G
    HerbrandH0 G (Multiplicative ℤ) ≃*
      Multiplicative (ZMod (Fintype.card G)) := by
  letI := trivialIntMulDistribMulAction G
  exact
    (HerbrandH0.equiv
      (G := G) (A := Multiplicative ℤ)).trans
      ((QuotientGroup.quotientMulEquivOfEq
        (trivialIntFixedToZModHom_ker
          (G := G)).symm).trans
        (QuotientGroup.quotientKerEquivOfSurjective
          (trivialIntFixedToZModHom (G := G))
          (trivialIntFixedToZModHom_surjective
            (G := G))))
theorem trivialIntHerbrandH0Finite :
    letI := trivialIntMulDistribMulAction G
    Finite (HerbrandH0 G (Multiplicative ℤ)) := by
  let := trivialIntMulDistribMulAction G
  exact Finite.of_equiv
    (Multiplicative (ZMod (Fintype.card G)))
    (trivialIntHerbrandH0EquivZMod
      (G := G)).symm.toEquiv
theorem trivialInt_herbrandH0_card :
    letI := trivialIntMulDistribMulAction G
    letI := trivialIntHerbrandH0Finite (G := G)
    Nat.card
        (HerbrandH0 G (Multiplicative ℤ)) =
      Fintype.card G := by
  let := trivialIntMulDistribMulAction G
  let := trivialIntHerbrandH0Finite (G := G)
  rw [Nat.card_congr
      (trivialIntHerbrandH0EquivZMod
        (G := G)).toEquiv]
  simp
 

theorem trivialInt_normKernelSubgroup_eq_bot :
    letI := trivialIntMulDistribMulAction G
    normKernelSubgroup G (Multiplicative ℤ) = ⊥ := by
  let := trivialIntMulDistribMulAction G
  apply le_antisymm
  · intro x hx
    rw [Subgroup.mem_bot]
    exact congrArg Multiplicative.ofAdd (by
      change
        Multiplicative.toAdd
          (x : Multiplicative ℤ) = 0
      have hnorm :
          (Fintype.card G : ℤ) *
              Multiplicative.toAdd
                (x : Multiplicative ℤ) = 0 := by
        rw [← trivialInt_tateNorm_toAdd]
        exact congrArg Multiplicative.toAdd hx
      exact (mul_eq_zero.mp hnorm).resolve_left (by
        exact_mod_cast Fintype.card_ne_zero))
  · exact bot_le
theorem trivialIntHerbrandHMinusOneFinite
    (σ : G) :
    letI := trivialIntMulDistribMulAction G
    Finite
      (HerbrandHMinusOne G
        (Multiplicative ℤ) σ) := by
  let := trivialIntMulDistribMulAction G
  have : Subsingleton
      (normKernelSubgroup G
        (Multiplicative ℤ)) := by
    rw [trivialInt_normKernelSubgroup_eq_bot
      (G := G)]
    infer_instance
  let : Subsingleton
      (HerbrandHMinusOne G
        (Multiplicative ℤ) σ) :=
    ⟨fun q ↦
      HerbrandHMinusOne.inductionOn σ
        (motive := fun q ↦ ∀ r, q = r) q fun x r ↦
          HerbrandHMinusOne.inductionOn σ
            (motive := fun r ↦
              HerbrandHMinusOne.mk σ x = r)
            r fun y ↦
              congrArg
                (fun z ↦ HerbrandHMinusOne.mk σ z)
                (Subsingleton.elim x y)⟩
  exact Finite.of_injective
    (fun _ : HerbrandHMinusOne G
      (Multiplicative ℤ) σ ↦ false)
    (fun x y _ ↦ Subsingleton.elim x y)
theorem trivialInt_herbrandHMinusOne_card_eq_one
    (σ : G) :
    letI := trivialIntMulDistribMulAction G
    letI :=
      trivialIntHerbrandHMinusOneFinite
        (G := G) σ
    Nat.card
      (HerbrandHMinusOne G
        (Multiplicative ℤ) σ) = 1 := by
  let := trivialIntMulDistribMulAction G
  let :=
    trivialIntHerbrandHMinusOneFinite
      (G := G) σ
  have : Subsingleton
      (normKernelSubgroup G
        (Multiplicative ℤ)) := by
    rw [trivialInt_normKernelSubgroup_eq_bot
      (G := G)]
    infer_instance
  let : Subsingleton
      (HerbrandHMinusOne G
        (Multiplicative ℤ) σ) :=
    ⟨fun q ↦
      HerbrandHMinusOne.inductionOn σ
        (motive := fun q ↦ ∀ r, q = r) q fun x r ↦
          HerbrandHMinusOne.inductionOn σ
            (motive := fun r ↦
              HerbrandHMinusOne.mk σ x = r)
            r fun y ↦
              congrArg
                (fun z ↦ HerbrandHMinusOne.mk σ z)
                (Subsingleton.elim x y)⟩
  rw [Nat.card_eq_one_iff_unique]
  exact ⟨inferInstance, inferInstance⟩
 

theorem trivialInt_herbrandQuotient_eq_card
    (σ : G) :
    letI := trivialIntMulDistribMulAction G
    letI := trivialIntHerbrandH0Finite (G := G)
    letI :=
      trivialIntHerbrandHMinusOneFinite
        (G := G) σ
    herbrandQuotient
        (G := G) (A := Multiplicative ℤ) σ =
      (Fintype.card G : ℚ) := by
  let := trivialIntMulDistribMulAction G
  let := trivialIntHerbrandH0Finite (G := G)
  let :=
    trivialIntHerbrandHMinusOneFinite
      (G := G) σ
  rw [herbrandQuotient_eq_card_ratio,
    trivialInt_herbrandH0_card (G := G),
    trivialInt_herbrandHMinusOne_card_eq_one
      (G := G) σ]
  simp
end TrivialInteger
section TransitivePermutationLattice
variable {G : Type uG} [Group G] [Fintype G]
 


abbrev TransitivePermutationLattice
    (H : Subgroup G)
    [MulDistribMulAction H (Multiplicative ℤ)] :=
  InducedModule (G := G)
    (B := Multiplicative ℤ) H
theorem transitivePermutationLatticeHerbrandH0Finite
    (H : Subgroup G)
    (σ : G)
    (hgen : ∀ g : G,
      g ∈ Subgroup.zpowers σ) :
    letI _stabilizerAction :
        MulDistribMulAction H (Multiplicative ℤ) :=
      trivialIntMulDistribMulAction H
    letI _stabilizerFintype : Fintype H :=
      Fintype.ofFinite H
    Finite
      (HerbrandH0 G
        (TransitivePermutationLattice H)) := by
  let stabilizerAction :
      MulDistribMulAction H (Multiplicative ℤ) :=
    trivialIntMulDistribMulAction H
  let stabilizerFintype : Fintype H :=
    Fintype.ofFinite H
  let : Finite
      (HerbrandH0 H (Multiplicative ℤ)) :=
    trivialIntHerbrandH0Finite (G := H)
  exact Finite.of_equiv
    (HerbrandH0 H (Multiplicative ℤ))
    (inducedHerbrandH0EquivOfFiniteCyclic
      H σ hgen).symm.toEquiv
theorem transitivePermutationLatticeHerbrandHMinusOneFinite
    (H : Subgroup G)
    (σ : G)
    (hgen : ∀ g : G,
      g ∈ Subgroup.zpowers σ) :
    letI _stabilizerAction :
        MulDistribMulAction H (Multiplicative ℤ) :=
      trivialIntMulDistribMulAction H
    letI _stabilizerFintype : Fintype H :=
      Fintype.ofFinite H
    Finite
      (HerbrandHMinusOne G
        (TransitivePermutationLattice H) σ) := by
  let stabilizerAction :
      MulDistribMulAction H (Multiplicative ℤ) :=
    trivialIntMulDistribMulAction H
  let stabilizerFintype : Fintype H :=
    Fintype.ofFinite H
  let δ :=
    subgroupGeneratorOfGenerator H σ hgen
  let : Finite
      (HerbrandHMinusOne H
        (Multiplicative ℤ) δ) :=
    trivialIntHerbrandHMinusOneFinite
      (G := H) δ
  exact Finite.of_equiv
    (HerbrandHMinusOne H
      (Multiplicative ℤ) δ)
    (inducedHerbrandHMinusOneEquivOfFiniteCyclic
      H σ hgen).symm.toEquiv
 

theorem transitivePermutationLattice_herbrandQuotient_eq_stabilizerCard
    (H : Subgroup G)
    (σ : G)
    (hgen : ∀ g : G,
      g ∈ Subgroup.zpowers σ) :
    letI _stabilizerAction :
        MulDistribMulAction H (Multiplicative ℤ) :=
      trivialIntMulDistribMulAction H
    letI _stabilizerFintype : Fintype H :=
      Fintype.ofFinite H
    letI _h0Finite :
        Finite
          (HerbrandH0 G
            (TransitivePermutationLattice H)) :=
      transitivePermutationLatticeHerbrandH0Finite
        H σ hgen
    letI _hMinusOneFinite :
        Finite
          (HerbrandHMinusOne G
            (TransitivePermutationLattice H) σ) :=
      transitivePermutationLatticeHerbrandHMinusOneFinite
        H σ hgen
    herbrandQuotient
        (G := G)
        (A := TransitivePermutationLattice H) σ =
      (Fintype.card H : ℚ) := by
  let stabilizerAction :
      MulDistribMulAction H (Multiplicative ℤ) :=
    trivialIntMulDistribMulAction H
  let stabilizerFintype : Fintype H :=
    Fintype.ofFinite H
  let δ :=
    subgroupGeneratorOfGenerator H σ hgen
  let stabilizerH0Finite :
      Finite
        (HerbrandH0 H (Multiplicative ℤ)) :=
    trivialIntHerbrandH0Finite (G := H)
  let stabilizerHMinusOneFinite :
      Finite
        (HerbrandHMinusOne H
          (Multiplicative ℤ) δ) :=
    trivialIntHerbrandHMinusOneFinite
      (G := H) δ
  let h0Finite :
      Finite
        (HerbrandH0 G
          (TransitivePermutationLattice H)) :=
    transitivePermutationLatticeHerbrandH0Finite
      H σ hgen
  let hMinusOneFinite :
      Finite
        (HerbrandHMinusOne G
          (TransitivePermutationLattice H) σ) :=
    transitivePermutationLatticeHerbrandHMinusOneFinite
      H σ hgen
  have h0Card :
      Nat.card
          (HerbrandH0 G
            (TransitivePermutationLattice H)) =
        Fintype.card H := by
    calc
      Nat.card
          (HerbrandH0 G
            (TransitivePermutationLattice H)) =
        Nat.card
          (HerbrandH0 H
            (Multiplicative ℤ)) :=
        Nat.card_congr
          (inducedHerbrandH0EquivOfFiniteCyclic
            H σ hgen).toEquiv
      _ = Fintype.card H :=
        trivialInt_herbrandH0_card (G := H)
  have hMinusOneCard :
      Nat.card
          (HerbrandHMinusOne G
            (TransitivePermutationLattice H) σ) =
        1 := by
    calc
      Nat.card
          (HerbrandHMinusOne G
            (TransitivePermutationLattice H) σ) =
        Nat.card
          (HerbrandHMinusOne H
            (Multiplicative ℤ) δ) :=
        Nat.card_congr
          (inducedHerbrandHMinusOneEquivOfFiniteCyclic
            H σ hgen).toEquiv
      _ = 1 :=
        trivialInt_herbrandHMinusOne_card_eq_one
          (G := H) δ
  rw [herbrandQuotient_eq_card_ratio,
    h0Card, hMinusOneCard]
  simp
end TransitivePermutationLattice
section PermutationLatticeOrbits
variable {G : Type uG} [Group G] [Fintype G]
variable {ι : Type uι} [Fintype ι]
 

abbrev PermutationLatticeOrbitFamily
    (H : ι → Subgroup G)
    [∀ i,
      MulDistribMulAction (H i)
        (Multiplicative ℤ)] :=
  ∀ i, TransitivePermutationLattice (H i)
 


theorem permutationLattice_herbrandQuotient_eq_stabilizerProduct
    (H : ι → Subgroup G)
    (σ : G)
    (hgen : ∀ g : G,
      g ∈ Subgroup.zpowers σ) :
    letI _stabilizerAction : ∀ i,
        MulDistribMulAction (H i)
          (Multiplicative ℤ) :=
      fun i ↦ trivialIntMulDistribMulAction (H i)
    letI _stabilizerFintype : ∀ i,
        Fintype (H i) :=
      fun _ ↦ Fintype.ofFinite _
    letI _orbitAction : ∀ i,
        MulDistribMulAction G
          (TransitivePermutationLattice (H i)) :=
      fun i ↦ inducedMulDistribMulAction (H i)
    letI _familyAction :
        MulDistribMulAction G
          (PermutationLatticeOrbitFamily H) :=
      piMulDistribMulAction G
        (fun i ↦
          TransitivePermutationLattice (H i))
    letI _orbitH0Finite : ∀ i,
        Finite
          (HerbrandH0 G
            (TransitivePermutationLattice (H i))) :=
      fun i ↦
        transitivePermutationLatticeHerbrandH0Finite
          (H i) σ hgen
    letI _orbitHMinusOneFinite : ∀ i,
        Finite
          (HerbrandHMinusOne G
            (TransitivePermutationLattice (H i)) σ) :=
      fun i ↦
        transitivePermutationLatticeHerbrandHMinusOneFinite
          (H i) σ hgen
    letI _familyH0Finite :
        Finite
          (HerbrandH0 G
            (PermutationLatticeOrbitFamily H)) :=
      Finite.of_equiv
        (∀ i,
          HerbrandH0 G
            (TransitivePermutationLattice (H i)))
        (herbrandH0PiEquiv
          (G := G)
          (fun i ↦
            TransitivePermutationLattice
              (H i))).symm.toEquiv
    letI _familyHMinusOneFinite :
        Finite
          (HerbrandHMinusOne G
            (PermutationLatticeOrbitFamily H) σ) :=
      Finite.of_equiv
        (∀ i,
          HerbrandHMinusOne G
            (TransitivePermutationLattice (H i)) σ)
        (herbrandHMinusOnePiEquiv
          (G := G)
          (fun i ↦
            TransitivePermutationLattice
              (H i)) σ).symm.toEquiv
    herbrandQuotient
        (G := G)
        (A := PermutationLatticeOrbitFamily H) σ =
      ∏ i, (Fintype.card (H i) : ℚ) := by
  let stabilizerAction : ∀ i,
      MulDistribMulAction (H i)
        (Multiplicative ℤ) :=
    fun i ↦ trivialIntMulDistribMulAction (H i)
  let stabilizerFintype : ∀ i,
      Fintype (H i) :=
    fun _ ↦ Fintype.ofFinite _
  let orbitAction : ∀ i,
      MulDistribMulAction G
        (TransitivePermutationLattice (H i)) :=
    fun i ↦ inducedMulDistribMulAction (H i)
  let familyAction :
      MulDistribMulAction G
        (PermutationLatticeOrbitFamily H) :=
    piMulDistribMulAction G
      (fun i ↦
        TransitivePermutationLattice (H i))
  let orbitH0Finite : ∀ i,
      Finite
        (HerbrandH0 G
          (TransitivePermutationLattice (H i))) :=
    fun i ↦
      transitivePermutationLatticeHerbrandH0Finite
        (H i) σ hgen
  let orbitHMinusOneFinite : ∀ i,
      Finite
        (HerbrandHMinusOne G
          (TransitivePermutationLattice (H i)) σ) :=
    fun i ↦
      transitivePermutationLatticeHerbrandHMinusOneFinite
        (H i) σ hgen
  let familyH0Finite :
      Finite
        (HerbrandH0 G
          (PermutationLatticeOrbitFamily H)) :=
    Finite.of_equiv
      (∀ i,
        HerbrandH0 G
          (TransitivePermutationLattice (H i)))
      (herbrandH0PiEquiv
        (G := G)
        (fun i ↦
          TransitivePermutationLattice
            (H i))).symm.toEquiv
  let familyHMinusOneFinite :
      Finite
        (HerbrandHMinusOne G
          (PermutationLatticeOrbitFamily H) σ) :=
    Finite.of_equiv
      (∀ i,
        HerbrandHMinusOne G
          (TransitivePermutationLattice (H i)) σ)
      (herbrandHMinusOnePiEquiv
        (G := G)
        (fun i ↦
          TransitivePermutationLattice
            (H i)) σ).symm.toEquiv
  calc
    herbrandQuotient
        (G := G)
        (A := PermutationLatticeOrbitFamily H) σ =
        ∏ i, herbrandQuotient
          (G := G)
          (A := TransitivePermutationLattice
            (H i)) σ :=
      herbrandQuotient_pi
        (fun i ↦
          TransitivePermutationLattice
            (H i)) σ
    _ = ∏ i, (Fintype.card (H i) : ℚ) := by
      apply Finset.prod_congr rfl
      intro i _
      exact
        transitivePermutationLattice_herbrandQuotient_eq_stabilizerCard
          (H i) σ hgen
end PermutationLatticeOrbits
section CanonicalPermutationFunctions
variable {G : Type uG} [Group G] [Fintype G]
variable {ι : Type uι} [Fintype ι] [MulAction G ι]
 

abbrev permutationFunctionMulDistribMulAction :
    MulDistribMulAction G (ι → Multiplicative ℤ) where
  smul g f i := f (g⁻¹ • i)
  one_smul f := by
    funext i
    change f ((1 : G)⁻¹ • i) = f i
    rw [inv_one, one_smul]
  mul_smul g h f := by
    funext i
    change f ((g * h)⁻¹ • i) =
      f (h⁻¹ • (g⁻¹ • i))
    rw [mul_inv_rev, mul_smul]
  smul_one _ := rfl
  smul_mul _ _ _ := rfl
 
noncomputable def chosenPermutationOrbitRepresentative
    (i : ι) : ι :=
  Quotient.out
    (Quotient.mk'' i :
      MulAction.orbitRel.Quotient G ι)
omit [Fintype G] [Fintype ι] in
theorem chosenPermutationOrbitRepresentative_sameOrbit
    (i : ι) :
    i ∈ MulAction.orbit G
      (chosenPermutationOrbitRepresentative (G := G) i) := by
  rw [← MulAction.orbitRel_apply, ← Quotient.eq'']
  exact
    (Quotient.out_eq'
      (Quotient.mk'' i :
        MulAction.orbitRel.Quotient G ι)).symm
 

noncomputable def chosenPermutationOrbitTransport
    (i : ι) : G :=
  Classical.choose
    (chosenPermutationOrbitRepresentative_sameOrbit
      (G := G) i)
omit [Fintype G] [Fintype ι] in
theorem chosenPermutationOrbitTransport_smul
    (i : ι) :
    chosenPermutationOrbitTransport (G := G) i •
        chosenPermutationOrbitRepresentative (G := G) i = i :=
  Classical.choose_spec
    (chosenPermutationOrbitRepresentative_sameOrbit
      (G := G) i)
 
abbrev permutationOrbitStabilizer
    (ω : MulAction.orbitRel.Quotient G ι) :
    Subgroup G :=
  MulAction.stabilizer G ω.out
 

noncomputable def permutationFunctionOrbitEquiv :
    letI _stabilizerAction :
        ∀ ω : MulAction.orbitRel.Quotient G ι,
          MulDistribMulAction
            (permutationOrbitStabilizer ω)
            (Multiplicative ℤ) :=
      fun ω =>
        trivialIntMulDistribMulAction
          (permutationOrbitStabilizer ω)
    (ι → Multiplicative ℤ) ≃*
      PermutationLatticeOrbitFamily
        (fun ω : MulAction.orbitRel.Quotient G ι =>
          permutationOrbitStabilizer ω) := by
  letI stabilizerAction :
      ∀ ω : MulAction.orbitRel.Quotient G ι,
        MulDistribMulAction
          (permutationOrbitStabilizer ω)
          (Multiplicative ℤ) :=
    fun ω =>
      trivialIntMulDistribMulAction
        (permutationOrbitStabilizer ω)
  refine
    { toFun := fun f ω =>
        ⟨fun x => f (x⁻¹ • ω.out), ?_⟩
      invFun := fun F i =>
        (F (Quotient.mk'' i)).1
          ((chosenPermutationOrbitTransport
            (G := G) i)⁻¹)
      left_inv := ?_
      right_inv := ?_
      map_mul' := ?_ }
  · intro h x
    change
      f ((h.1 * x)⁻¹ • ω.out) =
        f (x⁻¹ • ω.out)
    have hhInv :
        h.1⁻¹ • ω.out = ω.out := by
      calc
        h.1⁻¹ • ω.out =
            h.1⁻¹ • (h.1 • ω.out) :=
          congrArg (fun y => h.1⁻¹ • y) h.2.symm
        _ = ω.out := inv_smul_smul h.1 ω.out
    rw [mul_inv_rev, mul_smul, hhInv]
  · intro f
    funext i
    change
      f (((chosenPermutationOrbitTransport
          (G := G) i)⁻¹)⁻¹ •
          chosenPermutationOrbitRepresentative
            (G := G) i) = f i
    rw [inv_inv, chosenPermutationOrbitTransport_smul]
  · intro F
    funext ω
    apply Subtype.ext
    funext x
    have hω :
        (Quotient.mk'' (x⁻¹ • ω.out) :
            MulAction.orbitRel.Quotient G ι) = ω := by
      calc
        (Quotient.mk'' (x⁻¹ • ω.out) :
            MulAction.orbitRel.Quotient G ι) =
            Quotient.mk'' ω.out := by
              exact Quotient.sound
                (MulAction.orbitRel_apply.mpr
                  ⟨x⁻¹, rfl⟩)
        _ = ω := Quotient.out_eq' ω
    let t : G :=
      chosenPermutationOrbitTransport
        (G := G) (x⁻¹ • ω.out)
    have ht :
        t • ω.out = x⁻¹ • ω.out := by
      have ht' :=
        chosenPermutationOrbitTransport_smul
          (G := G) (x⁻¹ • ω.out)
      simpa only [t, chosenPermutationOrbitRepresentative,
        hω] using ht'
    let h : permutationOrbitStabilizer ω :=
      ⟨t⁻¹ * x⁻¹, by
        change (t⁻¹ * x⁻¹) • ω.out = ω.out
        rw [mul_smul, ← ht, inv_smul_smul]⟩
    change
      (F (Quotient.mk'' (x⁻¹ • ω.out))).1
          ((chosenPermutationOrbitTransport
            (G := G) (x⁻¹ • ω.out))⁻¹) =
        (F ω).1 x
    rw [hω]
    change (F ω).1 t⁻¹ = (F ω).1 x
    have hcov := (F ω).2 h x
    change (F ω).1 (h.1 * x) = (F ω).1 x at hcov
    simpa [h, mul_assoc] using hcov
  · intro f k
    funext ω
    apply Subtype.ext
    funext x
    rfl
omit [Fintype G] [Fintype ι] in
 

theorem permutationFunctionOrbitEquiv_equivariant :
    letI _functionAction :
        MulDistribMulAction G (ι → Multiplicative ℤ) :=
      permutationFunctionMulDistribMulAction
    letI _stabilizerAction :
        ∀ ω : MulAction.orbitRel.Quotient G ι,
          MulDistribMulAction
            (permutationOrbitStabilizer ω)
            (Multiplicative ℤ) :=
      fun ω =>
        trivialIntMulDistribMulAction
          (permutationOrbitStabilizer ω)
    letI _orbitAction :
        ∀ ω : MulAction.orbitRel.Quotient G ι,
          MulDistribMulAction G
            (TransitivePermutationLattice
              (permutationOrbitStabilizer ω)) :=
      fun ω =>
        inducedMulDistribMulAction
          (permutationOrbitStabilizer ω)
    letI _familyAction :
        MulDistribMulAction G
          (PermutationLatticeOrbitFamily
            (fun ω : MulAction.orbitRel.Quotient G ι =>
              permutationOrbitStabilizer ω)) :=
      piMulDistribMulAction G
        (fun ω : MulAction.orbitRel.Quotient G ι =>
          TransitivePermutationLattice
            (permutationOrbitStabilizer ω))
    ∀ (g : G) (f : ι → Multiplicative ℤ),
      permutationFunctionOrbitEquiv (G := G) (ι := ι)
          (g • f) =
        g • permutationFunctionOrbitEquiv
          (G := G) (ι := ι) f := by
  let functionAction :
      MulDistribMulAction G (ι → Multiplicative ℤ) :=
    permutationFunctionMulDistribMulAction
  let stabilizerAction :
      ∀ ω : MulAction.orbitRel.Quotient G ι,
        MulDistribMulAction
          (permutationOrbitStabilizer ω)
          (Multiplicative ℤ) :=
    fun ω =>
      trivialIntMulDistribMulAction
        (permutationOrbitStabilizer ω)
  let orbitAction :
      ∀ ω : MulAction.orbitRel.Quotient G ι,
        MulDistribMulAction G
          (TransitivePermutationLattice
            (permutationOrbitStabilizer ω)) :=
    fun ω =>
      inducedMulDistribMulAction
        (permutationOrbitStabilizer ω)
  let familyAction :
      MulDistribMulAction G
        (PermutationLatticeOrbitFamily
          (fun ω : MulAction.orbitRel.Quotient G ι =>
            permutationOrbitStabilizer ω)) :=
    piMulDistribMulAction G
      (fun ω : MulAction.orbitRel.Quotient G ι =>
        TransitivePermutationLattice
          (permutationOrbitStabilizer ω))
  intro g f
  funext ω
  apply Subtype.ext
  funext x
  change
    f (g⁻¹ • (x⁻¹ • ω.out)) =
      f ((x * g)⁻¹ • ω.out)
  rw [mul_inv_rev, mul_smul]
 

theorem permutationFunctionHerbrandH0Finite
    (σ : G)
    (hgen : ∀ g : G,
      g ∈ Subgroup.zpowers σ) :
    letI _functionAction :
        MulDistribMulAction G (ι → Multiplicative ℤ) :=
      permutationFunctionMulDistribMulAction
    Finite
      (HerbrandH0 G (ι → Multiplicative ℤ)) := by
  let functionAction :
      MulDistribMulAction G (ι → Multiplicative ℤ) :=
    permutationFunctionMulDistribMulAction
  let stabilizerAction :
      ∀ ω : MulAction.orbitRel.Quotient G ι,
        MulDistribMulAction
          (permutationOrbitStabilizer ω)
          (Multiplicative ℤ) :=
    fun ω =>
      trivialIntMulDistribMulAction
        (permutationOrbitStabilizer ω)
  let stabilizerFintype :
      ∀ ω : MulAction.orbitRel.Quotient G ι,
        Fintype (permutationOrbitStabilizer ω) :=
    fun _ => Fintype.ofFinite _
  let orbitAction :
      ∀ ω : MulAction.orbitRel.Quotient G ι,
        MulDistribMulAction G
          (TransitivePermutationLattice
            (permutationOrbitStabilizer ω)) :=
    fun ω =>
      inducedMulDistribMulAction
        (permutationOrbitStabilizer ω)
  let familyAction :
      MulDistribMulAction G
        (PermutationLatticeOrbitFamily
          (fun ω : MulAction.orbitRel.Quotient G ι =>
            permutationOrbitStabilizer ω)) :=
    piMulDistribMulAction G
      (fun ω : MulAction.orbitRel.Quotient G ι =>
        TransitivePermutationLattice
          (permutationOrbitStabilizer ω))
  let orbitH0Finite :
      ∀ ω : MulAction.orbitRel.Quotient G ι,
        Finite
          (HerbrandH0 G
            (TransitivePermutationLattice
              (permutationOrbitStabilizer ω))) :=
    fun ω =>
      transitivePermutationLatticeHerbrandH0Finite
        (permutationOrbitStabilizer ω) σ hgen
  let familyH0Finite :
      Finite
        (HerbrandH0 G
          (PermutationLatticeOrbitFamily
            (fun ω : MulAction.orbitRel.Quotient G ι =>
              permutationOrbitStabilizer ω))) :=
    Finite.of_equiv
      (∀ ω : MulAction.orbitRel.Quotient G ι,
        HerbrandH0 G
          (TransitivePermutationLattice
            (permutationOrbitStabilizer ω)))
      (herbrandH0PiEquiv
        (G := G)
        (fun ω : MulAction.orbitRel.Quotient G ι =>
          TransitivePermutationLattice
            (permutationOrbitStabilizer ω))).symm.toEquiv
  let e :=
    permutationFunctionOrbitEquiv
      (G := G) (ι := ι)
  let he :=
    permutationFunctionOrbitEquiv_equivariant
      (G := G) (ι := ι)
  exact
    herbrandH0Finite_of_equivariantMulEquiv
      e.symm (mulEquiv_symm_commutes_smul e he)
 

theorem permutationFunctionHerbrandHMinusOneFinite
    (σ : G)
    (hgen : ∀ g : G,
      g ∈ Subgroup.zpowers σ) :
    letI _functionAction :
        MulDistribMulAction G (ι → Multiplicative ℤ) :=
      permutationFunctionMulDistribMulAction
    Finite
      (HerbrandHMinusOne G
        (ι → Multiplicative ℤ) σ) := by
  let functionAction :
      MulDistribMulAction G (ι → Multiplicative ℤ) :=
    permutationFunctionMulDistribMulAction
  let stabilizerAction :
      ∀ ω : MulAction.orbitRel.Quotient G ι,
        MulDistribMulAction
          (permutationOrbitStabilizer ω)
          (Multiplicative ℤ) :=
    fun ω =>
      trivialIntMulDistribMulAction
        (permutationOrbitStabilizer ω)
  let stabilizerFintype :
      ∀ ω : MulAction.orbitRel.Quotient G ι,
        Fintype (permutationOrbitStabilizer ω) :=
    fun _ => Fintype.ofFinite _
  let orbitAction :
      ∀ ω : MulAction.orbitRel.Quotient G ι,
        MulDistribMulAction G
          (TransitivePermutationLattice
            (permutationOrbitStabilizer ω)) :=
    fun ω =>
      inducedMulDistribMulAction
        (permutationOrbitStabilizer ω)
  let familyAction :
      MulDistribMulAction G
        (PermutationLatticeOrbitFamily
          (fun ω : MulAction.orbitRel.Quotient G ι =>
            permutationOrbitStabilizer ω)) :=
    piMulDistribMulAction G
      (fun ω : MulAction.orbitRel.Quotient G ι =>
        TransitivePermutationLattice
          (permutationOrbitStabilizer ω))
  let orbitHMinusOneFinite :
      ∀ ω : MulAction.orbitRel.Quotient G ι,
        Finite
          (HerbrandHMinusOne G
            (TransitivePermutationLattice
              (permutationOrbitStabilizer ω)) σ) :=
    fun ω =>
      transitivePermutationLatticeHerbrandHMinusOneFinite
        (permutationOrbitStabilizer ω) σ hgen
  let familyHMinusOneFinite :
      Finite
        (HerbrandHMinusOne G
          (PermutationLatticeOrbitFamily
            (fun ω : MulAction.orbitRel.Quotient G ι =>
              permutationOrbitStabilizer ω)) σ) :=
    Finite.of_equiv
      (∀ ω : MulAction.orbitRel.Quotient G ι,
        HerbrandHMinusOne G
          (TransitivePermutationLattice
            (permutationOrbitStabilizer ω)) σ)
      (herbrandHMinusOnePiEquiv
        (G := G)
        (fun ω : MulAction.orbitRel.Quotient G ι =>
          TransitivePermutationLattice
            (permutationOrbitStabilizer ω)) σ).symm.toEquiv
  let e :=
    permutationFunctionOrbitEquiv
      (G := G) (ι := ι)
  let he :=
    permutationFunctionOrbitEquiv_equivariant
      (G := G) (ι := ι)
  exact
    herbrandHMinusOneFinite_of_equivariantMulEquiv
      e.symm (mulEquiv_symm_commutes_smul e he) σ
 


theorem permutationFunction_herbrandQuotient_eq_stabilizerProduct
    (σ : G)
    (hgen : ∀ g : G,
      g ∈ Subgroup.zpowers σ) :
    letI _functionAction :
        MulDistribMulAction G (ι → Multiplicative ℤ) :=
      permutationFunctionMulDistribMulAction
    letI _orbitFintype :
        Fintype (MulAction.orbitRel.Quotient G ι) :=
      Fintype.ofFinite _
    letI _stabilizerFintype :
        ∀ ω : MulAction.orbitRel.Quotient G ι,
          Fintype (permutationOrbitStabilizer ω) :=
      fun _ => Fintype.ofFinite _
    letI _functionH0Finite :
        Finite
          (HerbrandH0 G
            (ι → Multiplicative ℤ)) :=
      permutationFunctionHerbrandH0Finite σ hgen
    letI _functionHMinusOneFinite :
        Finite
          (HerbrandHMinusOne G
            (ι → Multiplicative ℤ) σ) :=
      permutationFunctionHerbrandHMinusOneFinite σ hgen
    herbrandQuotient
        (G := G) (A := ι → Multiplicative ℤ) σ =
      ∏ ω : MulAction.orbitRel.Quotient G ι,
        (Fintype.card
          (permutationOrbitStabilizer ω) : ℚ) := by
  let functionAction :
      MulDistribMulAction G (ι → Multiplicative ℤ) :=
    permutationFunctionMulDistribMulAction
  let orbitFintype :
      Fintype (MulAction.orbitRel.Quotient G ι) :=
    Fintype.ofFinite _
  let stabilizerAction :
      ∀ ω : MulAction.orbitRel.Quotient G ι,
        MulDistribMulAction
          (permutationOrbitStabilizer ω)
          (Multiplicative ℤ) :=
    fun ω =>
      trivialIntMulDistribMulAction
        (permutationOrbitStabilizer ω)
  let stabilizerFintype :
      ∀ ω : MulAction.orbitRel.Quotient G ι,
        Fintype (permutationOrbitStabilizer ω) :=
    fun _ => Fintype.ofFinite _
  let orbitAction :
      ∀ ω : MulAction.orbitRel.Quotient G ι,
        MulDistribMulAction G
          (TransitivePermutationLattice
            (permutationOrbitStabilizer ω)) :=
    fun ω =>
      inducedMulDistribMulAction
        (permutationOrbitStabilizer ω)
  let familyAction :
      MulDistribMulAction G
        (PermutationLatticeOrbitFamily
          (fun ω : MulAction.orbitRel.Quotient G ι =>
            permutationOrbitStabilizer ω)) :=
    piMulDistribMulAction G
      (fun ω : MulAction.orbitRel.Quotient G ι =>
        TransitivePermutationLattice
          (permutationOrbitStabilizer ω))
  let orbitH0Finite :
      ∀ ω : MulAction.orbitRel.Quotient G ι,
        Finite
          (HerbrandH0 G
            (TransitivePermutationLattice
              (permutationOrbitStabilizer ω))) :=
    fun ω =>
      transitivePermutationLatticeHerbrandH0Finite
        (permutationOrbitStabilizer ω) σ hgen
  let orbitHMinusOneFinite :
      ∀ ω : MulAction.orbitRel.Quotient G ι,
        Finite
          (HerbrandHMinusOne G
            (TransitivePermutationLattice
              (permutationOrbitStabilizer ω)) σ) :=
    fun ω =>
      transitivePermutationLatticeHerbrandHMinusOneFinite
        (permutationOrbitStabilizer ω) σ hgen
  let familyH0Finite :
      Finite
        (HerbrandH0 G
          (PermutationLatticeOrbitFamily
            (fun ω : MulAction.orbitRel.Quotient G ι =>
              permutationOrbitStabilizer ω))) :=
    Finite.of_equiv
      (∀ ω : MulAction.orbitRel.Quotient G ι,
        HerbrandH0 G
          (TransitivePermutationLattice
            (permutationOrbitStabilizer ω)))
      (herbrandH0PiEquiv
        (G := G)
        (fun ω : MulAction.orbitRel.Quotient G ι =>
          TransitivePermutationLattice
            (permutationOrbitStabilizer ω))).symm.toEquiv
  let familyHMinusOneFinite :
      Finite
        (HerbrandHMinusOne G
          (PermutationLatticeOrbitFamily
            (fun ω : MulAction.orbitRel.Quotient G ι =>
              permutationOrbitStabilizer ω)) σ) :=
    Finite.of_equiv
      (∀ ω : MulAction.orbitRel.Quotient G ι,
        HerbrandHMinusOne G
          (TransitivePermutationLattice
            (permutationOrbitStabilizer ω)) σ)
      (herbrandHMinusOnePiEquiv
        (G := G)
        (fun ω : MulAction.orbitRel.Quotient G ι =>
          TransitivePermutationLattice
            (permutationOrbitStabilizer ω)) σ).symm.toEquiv
  let functionH0Finite :
      Finite
        (HerbrandH0 G
          (ι → Multiplicative ℤ)) :=
    permutationFunctionHerbrandH0Finite σ hgen
  let functionHMinusOneFinite :
      Finite
        (HerbrandHMinusOne G
          (ι → Multiplicative ℤ) σ) :=
    permutationFunctionHerbrandHMinusOneFinite σ hgen
  let e :=
    permutationFunctionOrbitEquiv
      (G := G) (ι := ι)
  let he :=
    permutationFunctionOrbitEquiv_equivariant
      (G := G) (ι := ι)
  calc
    herbrandQuotient
        (G := G) (A := ι → Multiplicative ℤ) σ =
        herbrandQuotient
          (G := G)
          (A := PermutationLatticeOrbitFamily
            (fun ω : MulAction.orbitRel.Quotient G ι =>
              permutationOrbitStabilizer ω)) σ := by
      simpa only [e, he] using
        (herbrandQuotient_eq_of_equivariantMulEquiv
          e he σ)
    _ = ∏ ω : MulAction.orbitRel.Quotient G ι,
          (Fintype.card
            (permutationOrbitStabilizer ω) : ℚ) :=
      permutationLattice_herbrandQuotient_eq_stabilizerProduct
        (fun ω : MulAction.orbitRel.Quotient G ι =>
          permutationOrbitStabilizer ω) σ hgen
end CanonicalPermutationFunctions
section FiniteIndexStableSubgroup
variable {G : Type uG} {A : Type uA}
    [Group G] [CommGroup A]
    [MulDistribMulAction G A]
 
abbrev stableSubgroupMulDistribMulAction
    (B : Subgroup A)
    (hstable : ∀ (g : G) (x : A),
      x ∈ B → g • x ∈ B) :
    MulDistribMulAction G B where
  smul g x := ⟨g • x.1, hstable g x.1 x.2⟩
  one_smul x := by
    apply Subtype.ext
    exact one_smul G x.1
  mul_smul g h x := by
    apply Subtype.ext
    exact mul_smul g h x.1
  smul_one g := by
    apply Subtype.ext
    exact MulDistribMulAction.smul_one g
  smul_mul g x y := by
    apply Subtype.ext
    exact MulDistribMulAction.smul_mul
      g x.1 y.1
 
abbrev stableQuotientMulDistribMulAction
    (B : Subgroup A)
    (hstable : ∀ (g : G) (x : A),
      x ∈ B → g • x ∈ B) :
    MulDistribMulAction G (A ⧸ B) where
  smul g q :=
    QuotientGroup.map B B
      (MulDistribMulAction.toMonoidHom A g)
      (fun _ hx ↦ hstable g _ hx) q
  one_smul q := by
    refine QuotientGroup.induction_on q ?_
    intro x
    change
      QuotientGroup.mk' B ((1 : G) • x) =
        QuotientGroup.mk' B x
    rw [one_smul]
  mul_smul g h q := by
    refine QuotientGroup.induction_on q ?_
    intro x
    change
      QuotientGroup.mk' B ((g * h) • x) =
        QuotientGroup.mk' B (g • h • x)
    rw [mul_smul]
  smul_one g :=
    map_one
      (QuotientGroup.map B B
        (MulDistribMulAction.toMonoidHom A g)
        (fun _ hx ↦ hstable g _ hx))
  smul_mul g q r :=
    map_mul
      (QuotientGroup.map B B
        (MulDistribMulAction.toMonoidHom A g)
        (fun _ hx ↦ hstable g _ hx))
      q r
 
theorem stableSubgroup_subtype_equivariant
    (B : Subgroup A)
    (hstable : ∀ (g : G) (x : A),
      x ∈ B → g • x ∈ B) :
    letI :=
      stableSubgroupMulDistribMulAction
        B hstable
    ∀ (g : G) (x : B),
      B.subtype (g • x) = g • B.subtype x := by
  let :=
    stableSubgroupMulDistribMulAction
      B hstable
  intro g x
  rfl
 
theorem stableSubgroup_quotientMap_equivariant
    (B : Subgroup A)
    (hstable : ∀ (g : G) (x : A),
      x ∈ B → g • x ∈ B) :
    letI :=
      stableQuotientMulDistribMulAction
        B hstable
    ∀ (g : G) (x : A),
      QuotientGroup.mk' B (g • x) =
        g • QuotientGroup.mk' B x := by
  let :=
    stableQuotientMulDistribMulAction
      B hstable
  intro g x
  rfl
 
theorem stableSubgroup_quotientMap_exact
    (B : Subgroup A) :
    ∀ x : A,
      QuotientGroup.mk' B x = 1 ↔
        ∃ b : B, B.subtype b = x := by
  intro x
  constructor
  · intro hx
    have hxB :
        x ∈ B :=
      (QuotientGroup.eq_one_iff x).mp hx
    exact ⟨⟨x, hxB⟩, rfl⟩
  · rintro ⟨b, rfl⟩
    exact
      (QuotientGroup.eq_one_iff b.1).mpr
        b.2
end FiniteIndexStableSubgroup
section FiniteIndexStableSubgroupFiniteness
variable {G A : Type}
    [Group G] [CommGroup A]
    [MulDistribMulAction G A]
variable [Fintype G]
 


theorem finiteIndexStableSubgroup_ambientHerbrandQuotientDefined
    (B : Subgroup A)
    (hstable : ∀ (g : G) (x : A),
      x ∈ B → g • x ∈ B)
    (σ : G)
    (hgen : ∀ g : G,
      g ∈ Subgroup.zpowers σ)
    (hB :
      letI :=
        stableSubgroupMulDistribMulAction
          B hstable
      HerbrandQuotientDefined G B σ)
    [Finite (A ⧸ B)] :
    letI _subgroupAction :=
      stableSubgroupMulDistribMulAction
        B hstable
    letI _quotientAction :=
      stableQuotientMulDistribMulAction
        B hstable
    HerbrandQuotientDefined G A σ := by
  let subgroupAction :=
    stableSubgroupMulDistribMulAction
      B hstable
  let quotientAction :=
    stableQuotientMulDistribMulAction
      B hstable
  let hQ :
      HerbrandQuotientDefined
        G (A ⧸ B) σ :=
    ⟨inferInstance, inferInstance⟩
  exact
    herbrandQuotientDefined_middle_of_left_right
      B.subtype (QuotientGroup.mk' B)
      (stableSubgroup_subtype_equivariant
        B hstable)
      (stableSubgroup_quotientMap_equivariant
        B hstable)
      (stableSubgroup_quotientMap_exact B)
      B.subtype_injective
      (QuotientGroup.mk'_surjective B)
      σ hgen hB hQ
 


theorem herbrandQuotient_eq_of_finiteIndex_stableSubgroup
    (B : Subgroup A)
    (hstable : ∀ (g : G) (x : A),
      x ∈ B → g • x ∈ B)
    (σ : G)
    (hgen : ∀ g : G,
      g ∈ Subgroup.zpowers σ)
    (hB :
      letI :=
        stableSubgroupMulDistribMulAction
          B hstable
      HerbrandQuotientDefined G B σ)
    [Finite (A ⧸ B)] :
    letI _subgroupAction :=
      stableSubgroupMulDistribMulAction
        B hstable
    letI _quotientAction :=
      stableQuotientMulDistribMulAction
        B hstable
    let hA :=
      finiteIndexStableSubgroup_ambientHerbrandQuotientDefined
        B hstable σ hgen hB
    @herbrandQuotient G A _ _ _ _
        σ hA.1 hA.2 =
      @herbrandQuotient G B _ _ _ _
        σ hB.1 hB.2 := by
  let subgroupAction :=
    stableSubgroupMulDistribMulAction
      B hstable
  let quotientAction :=
    stableQuotientMulDistribMulAction
      B hstable
  let hQ :
      HerbrandQuotientDefined
        G (A ⧸ B) σ :=
    ⟨inferInstance, inferInstance⟩
  let hA :=
    finiteIndexStableSubgroup_ambientHerbrandQuotientDefined
      B hstable σ hgen hB
  let : Finite
      (HerbrandH0 G B) := hB.1
  let : Finite
      (HerbrandHMinusOne G B σ) := hB.2
  let : Finite
      (HerbrandH0 G A) := hA.1
  let : Finite
      (HerbrandHMinusOne G A σ) := hA.2
  let : Finite
      (HerbrandH0 G (A ⧸ B)) := hQ.1
  let : Finite
      (HerbrandHMinusOne G (A ⧸ B) σ) :=
    hQ.2
  have hmult :
      herbrandQuotient
          (G := G) (A := A) σ =
        herbrandQuotient
            (G := G) (A := B) σ *
          herbrandQuotient
            (G := G) (A := A ⧸ B) σ :=
    herbrandQuotient_multiplicative_of_shortExact
      B.subtype (QuotientGroup.mk' B)
      (stableSubgroup_subtype_equivariant
        B hstable)
      (stableSubgroup_quotientMap_equivariant
        B hstable)
      (stableSubgroup_quotientMap_exact B)
      B.subtype_injective
      (QuotientGroup.mk'_surjective B)
      σ hgen
  have hquotient :
      herbrandQuotient
          (G := G) (A := A ⧸ B) σ = 1 :=
    herbrandQuotient_eq_one_of_finite_module
      (G := G) (A := A ⧸ B) σ hgen
  change
    @herbrandQuotient G A _ _ _ _
        σ hA.1 hA.2 =
      @herbrandQuotient G B _ _ _ _
        σ hB.1 hB.2
  calc
    @herbrandQuotient G A _ _ _ _
          σ hA.1 hA.2 =
        @herbrandQuotient G B _ _ _ _
            σ hB.1 hB.2 *
          @herbrandQuotient G (A ⧸ B)
            _ _ _ _ σ hQ.1 hQ.2 :=
      hmult
    _ = @herbrandQuotient G B _ _ _ _
          σ hB.1 hB.2 := by
      rw [hquotient, mul_one]
end FiniteIndexStableSubgroupFiniteness
end CyclicCohomology
end
end

/- GaloisCohomology.Cyclic.Herbrand.Permutation.LatticeHerbrand -/
section
open scoped BigOperators
noncomputable section
namespace CyclicCohomology
open Module Submodule
open CyclicCohomology.ProfiniteCohomology.Herbrand
universe uG uι
variable {G : Type uG} {ι : Type uι}
 

abbrev permutationMulAction
    [Group G] (ρ : G →* Equiv.Perm ι) :
    MulAction G ι where
  smul g i := ρ g i
  one_smul i := by
    change ρ 1 i = i
    rw [map_one]
    rfl
  mul_smul g h i := by
    change ρ (g * h) i = ρ g (ρ h i)
    rw [map_mul]
    rfl
 
def intCoordinatePermutation (σ : Equiv.Perm ι) :
    (ι → ℤ) ≃ₗ[ℤ] (ι → ℤ) where
  toFun x i := x (σ.symm i)
  invFun x i := x (σ i)
  left_inv x := by
    funext i
    simp
  right_inv x := by
    funext i
    simp
  map_add' _ _ := rfl
  map_smul' _ _ := rfl
section IntegralPermutationBasis
variable [Fintype G] [Group G] [Fintype ι] [DecidableEq ι]
variable {M : Type*} [AddCommGroup M] [Module ℤ M]
omit [Fintype G] in
 

theorem basisEquivFun_symm_intCoordinatePermutation
    (b : Basis ι ℤ M)
    (ρ : G →* Equiv.Perm ι)
    (α : G →* (M ≃ₗ[ℤ] M))
    (hb : ∀ (g : G) (i : ι),
      α g (b i) = b (ρ g i))
    (g : G) (x : ι → ℤ) :
    b.equivFun.symm
        (intCoordinatePermutation (ρ g) x) =
      α g (b.equivFun.symm x) := by
  have hmaps :
      b.equivFun.symm.toLinearMap.comp
          (intCoordinatePermutation (ρ g)).toLinearMap =
        (α g).toLinearMap.comp
          b.equivFun.symm.toLinearMap := by
    apply (Pi.basisFun ℤ ι).ext
    intro i
    simp only [LinearMap.comp_apply, Pi.basisFun_apply]
    have hsingle (j : ι) :
        b.equivFun.symm (Pi.single j 1) = b j := by
      exact _root_.Basis.equivFun_symm_single b j
    calc
      b.equivFun.symm
          (intCoordinatePermutation (ρ g)
            (Pi.single i 1)) =
          b.equivFun.symm
            (Pi.single (ρ g i) 1) := by
              congr 1
              ext j
              by_cases h : j = ρ g i
              · subst j
                simp [intCoordinatePermutation]
              · have h' : (ρ g).symm j ≠ i := by
                  intro hij
                  apply h
                  simpa using congrArg (ρ g) hij
                simp [intCoordinatePermutation, h, h']
      _ = b (ρ g i) := hsingle (ρ g i)
      _ = α g (b i) := (hb g i).symm
      _ = α g
          (b.equivFun.symm (Pi.single i 1)) := by
        rw [hsingle i]
  exact LinearMap.congr_fun hmaps x
end IntegralPermutationBasis
section StableSublattice
variable [Fintype G] [Group G] [Fintype ι] [DecidableEq ι]
 

theorem permutationSublattice_stable
    (ρ : G →* Equiv.Perm ι)
    (L : Submodule ℤ (ι → ℝ)) [DiscreteTopology L]
    [IsZLattice ℝ L]
    (hL : ∀ (g : G) (x : ι → ℝ), x ∈ L →
      permutationRepresentation ρ g x ∈ L) :
    ∀ (g : G) (x : ι → ℝ),
      x ∈ permutationSublattice ρ L hL →
        permutationRepresentation ρ g x ∈
          permutationSublattice ρ L hL := by
  intro g x hx
  rw [permutationSublattice] at hx ⊢
  refine Submodule.span_induction ?_ ?_ ?_ ?_ hx
  · rintro y ⟨i, rfl⟩
    have heq :
        permutationRepresentation ρ g
            (averagedLatticeVector ρ L hL
              (permutationLatticeScale L) i : ι → ℝ) =
          (averagedLatticeVector ρ L hL
            (permutationLatticeScale L) (ρ g i) :
              ι → ℝ) := by
      have h :=
        congrArg (fun q : L => (q : ι → ℝ))
          (averagedLatticeVector_equivariant
            ρ L hL (permutationLatticeScale L) g i)
      simpa only [coe_permutationLatticeEquiv] using h
    rw [heq]
    exact Submodule.subset_span ⟨ρ g i, rfl⟩
  · rw [map_zero]
    exact Submodule.zero_mem _
  · intro y z _ _ hy hz
    rw [map_add]
    exact Submodule.add_mem _ hy hz
  · intro n y _ hy
    rw [map_zsmul]
    exact Submodule.smul_mem _ n hy
 
abbrev permutationSublatticeDistribMulAction
    (ρ : G →* Equiv.Perm ι)
    (L : Submodule ℤ (ι → ℝ)) [DiscreteTopology L]
    [IsZLattice ℝ L]
    (hL : ∀ (g : G) (x : ι → ℝ), x ∈ L →
      permutationRepresentation ρ g x ∈ L) :
    DistribMulAction G (permutationSublattice ρ L hL) where
  smul g x :=
    ⟨permutationRepresentation ρ g x.1,
      permutationSublattice_stable ρ L hL g x.1 x.2⟩
  one_smul x := by
    apply Subtype.ext
    change permutationRepresentation ρ 1 x.1 = x.1
    rw [permutationRepresentation_one]
    rfl
  mul_smul g h x := by
    apply Subtype.ext
    change
      permutationRepresentation ρ (g * h) x.1 =
        permutationRepresentation ρ g
          (permutationRepresentation ρ h x.1)
    rw [permutationRepresentation_mul]
    rfl
  smul_zero g := by
    apply Subtype.ext
    exact map_zero (permutationRepresentation ρ g)
  smul_add g x y := by
    apply Subtype.ext
    exact map_add (permutationRepresentation ρ g) x.1 y.1
 
abbrev multiplicativeDistribMulAction
    {A : Type*} [AddCommGroup A]
    [DistribMulAction G A] :
    MulDistribMulAction G (Multiplicative A) where
  smul g x := Multiplicative.ofAdd (g • Multiplicative.toAdd x)
  one_smul x := congrArg Multiplicative.ofAdd
    (one_smul G (Multiplicative.toAdd x))
  mul_smul g h x := congrArg Multiplicative.ofAdd
    (mul_smul g h (Multiplicative.toAdd x))
  smul_one g := congrArg Multiplicative.ofAdd
    (DistribMulAction.smul_zero g)
  smul_mul g x y := congrArg Multiplicative.ofAdd
    (DistribMulAction.smul_add g
      (Multiplicative.toAdd x) (Multiplicative.toAdd y))
 

abbrev multiplicativeSubmoduleSubgroup
    {M : Type*} [AddCommGroup M] [Module ℤ M]
    (N : Submodule ℤ M) :
    Subgroup (Multiplicative M) :=
  N.toAddSubgroup.toSubgroup
 

def multiplicativeSubmoduleMulEquiv
    {M : Type*} [AddCommGroup M] [Module ℤ M]
    (N : Submodule ℤ M) :
    Multiplicative N ≃*
      multiplicativeSubmoduleSubgroup N where
  toFun x :=
    ⟨Multiplicative.ofAdd
        ((Multiplicative.toAdd x : N) : M),
      (Multiplicative.toAdd x : N).property⟩
  invFun x :=
    Multiplicative.ofAdd
      ⟨Multiplicative.toAdd x.1, x.2⟩
  left_inv _ := rfl
  right_inv _ := rfl
  map_mul' _ _ := rfl
 

theorem multiplicativeSubmoduleQuotientFinite
    {M : Type*} [AddCommGroup M] [Module ℤ M]
    (N : Submodule ℤ M)
    [Finite (M ⧸ N)] :
    Finite
      (Multiplicative M ⧸
        multiplicativeSubmoduleSubgroup N) := by
  let f :
      Multiplicative M →*
        Multiplicative (M ⧸ N) :=
    (QuotientAddGroup.mk'
      N.toAddSubgroup).toMultiplicative
  have hf : Function.Surjective f := by
    intro y
    obtain ⟨x, hx⟩ :=
      QuotientAddGroup.mk'_surjective
        N.toAddSubgroup
        (Multiplicative.toAdd y)
    exact
      ⟨Multiplicative.ofAdd x,
        congrArg Multiplicative.ofAdd hx⟩
  have hker :
      f.ker =
        multiplicativeSubmoduleSubgroup N := by
    change
      (QuotientAddGroup.mk'
          N.toAddSubgroup).ker.toSubgroup =
        N.toAddSubgroup.toSubgroup
    rw [QuotientAddGroup.ker_mk']
  let e :
      Multiplicative M ⧸
          multiplicativeSubmoduleSubgroup N ≃*
        Multiplicative (M ⧸ N) :=
    (QuotientGroup.quotientMulEquivOfEq hker).symm.trans
      (QuotientGroup.quotientKerEquivOfSurjective f hf)
  exact
    Finite.of_equiv
      (Multiplicative (M ⧸ N)) e.symm.toEquiv
 

abbrev completePermutationLatticeDistribMulAction
    (ρ : G →* Equiv.Perm ι)
    (L : Submodule ℤ (ι → ℝ)) [DiscreteTopology L]
    [IsZLattice ℝ L]
    (hL : ∀ (g : G) (x : ι → ℝ), x ∈ L →
      permutationRepresentation ρ g x ∈ L) :
    DistribMulAction G L where
  smul g x :=
    ⟨permutationRepresentation ρ g x.1,
      hL g x.1 x.2⟩
  one_smul x := by
    apply Subtype.ext
    change permutationRepresentation ρ 1 x.1 = x.1
    rw [permutationRepresentation_one]
    rfl
  mul_smul g h x := by
    apply Subtype.ext
    change
      permutationRepresentation ρ (g * h) x.1 =
        permutationRepresentation ρ g
          (permutationRepresentation ρ h x.1)
    rw [permutationRepresentation_mul]
    rfl
  smul_zero g := by
    apply Subtype.ext
    exact map_zero (permutationRepresentation ρ g)
  smul_add g x y := by
    apply Subtype.ext
    exact map_add (permutationRepresentation ρ g) x.1 y.1
 

noncomputable def permutationSublatticeMultiplicativeSubgroup
    (ρ : G →* Equiv.Perm ι)
    (L : Submodule ℤ (ι → ℝ)) [DiscreteTopology L]
    [IsZLattice ℝ L]
    (hL : ∀ (g : G) (x : ι → ℝ), x ∈ L →
      permutationRepresentation ρ g x ∈ L) :
    Subgroup (Multiplicative L) :=
  multiplicativeSubmoduleSubgroup
    ((permutationSublattice ρ L hL).comap L.subtype)
 

theorem
    permutationSublatticeMultiplicativeSubgroup_stable
    (ρ : G →* Equiv.Perm ι)
    (L : Submodule ℤ (ι → ℝ)) [DiscreteTopology L]
    [IsZLattice ℝ L]
    (hL : ∀ (g : G) (x : ι → ℝ), x ∈ L →
      permutationRepresentation ρ g x ∈ L) :
    letI _ambientAction :
        DistribMulAction G L :=
      completePermutationLatticeDistribMulAction
        ρ L hL
    letI _multiplicativeAction :
        MulDistribMulAction G
          (Multiplicative L) :=
      multiplicativeDistribMulAction
    ∀ (g : G) (x : Multiplicative L),
      x ∈
          permutationSublatticeMultiplicativeSubgroup
            ρ L hL →
        g • x ∈
          permutationSublatticeMultiplicativeSubgroup
            ρ L hL := by
  let ambientAction :
      DistribMulAction G L :=
    completePermutationLatticeDistribMulAction
      ρ L hL
  let multiplicativeAction :
      MulDistribMulAction G
        (Multiplicative L) :=
    multiplicativeDistribMulAction
  intro g x hx
  change
    permutationRepresentation ρ g
        ((Multiplicative.toAdd x : L) : ι → ℝ) ∈
      permutationSublattice ρ L hL
  change
    ((Multiplicative.toAdd x : L) : ι → ℝ) ∈
      permutationSublattice ρ L hL at hx
  exact
    permutationSublattice_stable
      ρ L hL g _ hx
 

theorem
    permutationSublatticeMultiplicativeSubgroup_finite_quotient
    (ρ : G →* Equiv.Perm ι)
    (L : Submodule ℤ (ι → ℝ)) [DiscreteTopology L]
    [IsZLattice ℝ L]
    (hL : ∀ (g : G) (x : ι → ℝ), x ∈ L →
      permutationRepresentation ρ g x ∈ L) :
    Finite
      (Multiplicative L ⧸
        permutationSublatticeMultiplicativeSubgroup
          ρ L hL) := by
  let N :
      Submodule ℤ L :=
    (permutationSublattice ρ L hL).comap
      L.subtype
  let quotientFinite : Finite (L ⧸ N) :=
    permutationSublattice_finite_quotient
      ρ L hL
  exact
    multiplicativeSubmoduleQuotientFinite N
 

noncomputable def
    permutationSublatticeSubgroupMulEquiv
    (ρ : G →* Equiv.Perm ι)
    (L : Submodule ℤ (ι → ℝ)) [DiscreteTopology L]
    [IsZLattice ℝ L]
    (hL : ∀ (g : G) (x : ι → ℝ), x ∈ L →
      permutationRepresentation ρ g x ∈ L) :
    permutationSublatticeMultiplicativeSubgroup
        ρ L hL ≃*
      Multiplicative
        (permutationSublattice ρ L hL) :=
  (multiplicativeSubmoduleMulEquiv
      ((permutationSublattice ρ L hL).comap
        L.subtype)).symm.trans
    (Submodule.comapSubtypeEquivOfLe
        (permutationSublattice_le ρ L hL)).toAddEquiv.toMultiplicative
 

theorem
    permutationSublatticeSubgroupMulEquiv_equivariant
    (ρ : G →* Equiv.Perm ι)
    (L : Submodule ℤ (ι → ℝ)) [DiscreteTopology L]
    [IsZLattice ℝ L]
    (hL : ∀ (g : G) (x : ι → ℝ), x ∈ L →
      permutationRepresentation ρ g x ∈ L) :
    letI _ambientAction :
        DistribMulAction G L :=
      completePermutationLatticeDistribMulAction
        ρ L hL
    letI _ambientMultiplicativeAction :
        MulDistribMulAction G
          (Multiplicative L) :=
      multiplicativeDistribMulAction
    letI _subgroupAction :
        MulDistribMulAction G
          (permutationSublatticeMultiplicativeSubgroup
            ρ L hL) :=
      stableSubgroupMulDistribMulAction
        (permutationSublatticeMultiplicativeSubgroup
          ρ L hL)
        (permutationSublatticeMultiplicativeSubgroup_stable
          ρ L hL)
    letI _sublatticeAction :
        DistribMulAction G
          (permutationSublattice ρ L hL) :=
      permutationSublatticeDistribMulAction ρ L hL
    letI _sublatticeMultiplicativeAction :
        MulDistribMulAction G
          (Multiplicative
            (permutationSublattice ρ L hL)) :=
      multiplicativeDistribMulAction
    ∀ (g : G)
      (x :
        permutationSublatticeMultiplicativeSubgroup
          ρ L hL),
      permutationSublatticeSubgroupMulEquiv
          ρ L hL (g • x) =
        g •
          permutationSublatticeSubgroupMulEquiv
            ρ L hL x := by
  let ambientAction :
      DistribMulAction G L :=
    completePermutationLatticeDistribMulAction
      ρ L hL
  let ambientMultiplicativeAction :
      MulDistribMulAction G
        (Multiplicative L) :=
    multiplicativeDistribMulAction
  let subgroupAction :
      MulDistribMulAction G
        (permutationSublatticeMultiplicativeSubgroup
          ρ L hL) :=
    stableSubgroupMulDistribMulAction
      (permutationSublatticeMultiplicativeSubgroup
        ρ L hL)
      (permutationSublatticeMultiplicativeSubgroup_stable
        ρ L hL)
  let sublatticeAction :
      DistribMulAction G
        (permutationSublattice ρ L hL) :=
    permutationSublatticeDistribMulAction ρ L hL
  let sublatticeMultiplicativeAction :
      MulDistribMulAction G
        (Multiplicative
          (permutationSublattice ρ L hL)) :=
    multiplicativeDistribMulAction
  intro g x
  rfl
 

noncomputable def permutationSublatticeModuleAut
    (ρ : G →* Equiv.Perm ι)
    (L : Submodule ℤ (ι → ℝ)) [DiscreteTopology L]
    [IsZLattice ℝ L]
    (hL : ∀ (g : G) (x : ι → ℝ), x ∈ L →
      permutationRepresentation ρ g x ∈ L) :
    G →* (permutationSublattice ρ L hL ≃ₗ[ℤ]
      permutationSublattice ρ L hL) := by
  letI :=
    permutationSublatticeDistribMulAction ρ L hL
  exact DistribMulAction.toModuleAut ℤ
    (permutationSublattice ρ L hL)
 

noncomputable def permutationSublatticeBasisMulEquivFunctions
    (ρ : G →* Equiv.Perm ι)
    (L : Submodule ℤ (ι → ℝ)) [DiscreteTopology L]
    [IsZLattice ℝ L]
    (hL : ∀ (g : G) (x : ι → ℝ), x ∈ L →
      permutationRepresentation ρ g x ∈ L) :
    Multiplicative (permutationSublattice ρ L hL) ≃*
      (ι → Multiplicative ℤ) :=
  (AddEquiv.toMultiplicative
      (permutationSublatticeBasis ρ L hL).equivFun.toAddEquiv).trans
    (MulEquiv.funMultiplicative ι ℤ)
@[simp]
theorem permutationSublatticeModuleAut_basis
    (ρ : G →* Equiv.Perm ι)
    (L : Submodule ℤ (ι → ℝ)) [DiscreteTopology L]
    [IsZLattice ℝ L]
    (hL : ∀ (g : G) (x : ι → ℝ), x ∈ L →
      permutationRepresentation ρ g x ∈ L)
    (g : G) (i : ι) :
    permutationSublatticeModuleAut ρ L hL g
        (permutationSublatticeBasis ρ L hL i) =
      permutationSublatticeBasis ρ L hL (ρ g i) := by
  apply Subtype.ext
  exact permutationSublatticeBasis_permuted
    ρ L hL g i
 

theorem permutationSublatticeBasisMulEquivFunctions_equivariant
    (ρ : G →* Equiv.Perm ι)
    (L : Submodule ℤ (ι → ℝ)) [DiscreteTopology L]
    [IsZLattice ℝ L]
    (hL : ∀ (g : G) (x : ι → ℝ), x ∈ L →
      permutationRepresentation ρ g x ∈ L) :
    letI _indexAction : MulAction G ι :=
      permutationMulAction ρ
    letI _sublatticeAction :
        DistribMulAction G
          (permutationSublattice ρ L hL) :=
      permutationSublatticeDistribMulAction ρ L hL
    letI _multiplicativeAction :
        MulDistribMulAction G
          (Multiplicative
            (permutationSublattice ρ L hL)) :=
      multiplicativeDistribMulAction
    letI _functionAction :
        MulDistribMulAction G
          (ι → Multiplicative ℤ) :=
      permutationFunctionMulDistribMulAction
    ∀ (g : G)
      (x : Multiplicative
        (permutationSublattice ρ L hL)),
      permutationSublatticeBasisMulEquivFunctions
          ρ L hL (g • x) =
        g • permutationSublatticeBasisMulEquivFunctions
          ρ L hL x := by
  let indexAction : MulAction G ι :=
    permutationMulAction ρ
  let sublatticeAction :
      DistribMulAction G
        (permutationSublattice ρ L hL) :=
    permutationSublatticeDistribMulAction ρ L hL
  let multiplicativeAction :
      MulDistribMulAction G
        (Multiplicative
          (permutationSublattice ρ L hL)) :=
    multiplicativeDistribMulAction
  let functionAction :
      MulDistribMulAction G
        (ι → Multiplicative ℤ) :=
    permutationFunctionMulDistribMulAction
  intro g x
  let b :=
    permutationSublatticeBasis ρ L hL
  ext i
  change
    b.equivFun (g • Multiplicative.toAdd x) i =
      b.equivFun (Multiplicative.toAdd x) (ρ g⁻¹ i)
  let α :=
    permutationSublatticeModuleAut ρ L hL
  have hinter :=
    basisEquivFun_symm_intCoordinatePermutation
      b ρ α
      (permutationSublatticeModuleAut_basis ρ L hL)
      g (b.equivFun (Multiplicative.toAdd x))
  have hcoord :=
    congrArg (fun y => b.equivFun y i) hinter
  have hα
      (y : permutationSublattice ρ L hL) :
      α g y = g • y :=
    rfl
  have hinv :
      ((ρ g)⁻¹ : Equiv.Perm ι) = (ρ g).symm :=
    rfl
  rw [map_inv, hinv]
  have hcoord' :
      (intCoordinatePermutation (ρ g)
        (b.equivFun (Multiplicative.toAdd x))) i =
        b.equivFun (g • Multiplicative.toAdd x) i := by
    simpa only [LinearEquiv.apply_symm_apply,
      LinearEquiv.symm_apply_apply, hα] using hcoord
  change
    b.equivFun (Multiplicative.toAdd x) ((ρ g).symm i) =
      b.equivFun (g • Multiplicative.toAdd x) i at hcoord'
  exact hcoord'.symm
 

theorem permutationSublatticeHerbrandH0Finite
    (ρ : G →* Equiv.Perm ι)
    (L : Submodule ℤ (ι → ℝ)) [DiscreteTopology L]
    [IsZLattice ℝ L]
    (hL : ∀ (g : G) (x : ι → ℝ), x ∈ L →
      permutationRepresentation ρ g x ∈ L)
    (σ : G)
    (hgen : ∀ g : G,
      g ∈ Subgroup.zpowers σ) :
    letI _indexAction : MulAction G ι :=
      permutationMulAction ρ
    letI _sublatticeAction :
        DistribMulAction G
          (permutationSublattice ρ L hL) :=
      permutationSublatticeDistribMulAction ρ L hL
    letI _multiplicativeAction :
        MulDistribMulAction G
          (Multiplicative
            (permutationSublattice ρ L hL)) :=
      multiplicativeDistribMulAction
    Finite
      (HerbrandH0 G
        (Multiplicative
          (permutationSublattice ρ L hL))) := by
  let indexAction : MulAction G ι :=
    permutationMulAction ρ
  let sublatticeAction :
      DistribMulAction G
        (permutationSublattice ρ L hL) :=
    permutationSublatticeDistribMulAction ρ L hL
  let multiplicativeAction :
      MulDistribMulAction G
        (Multiplicative
          (permutationSublattice ρ L hL)) :=
    multiplicativeDistribMulAction
  let functionAction :
      MulDistribMulAction G
        (ι → Multiplicative ℤ) :=
    permutationFunctionMulDistribMulAction
  let functionH0Finite :
      Finite
        (HerbrandH0 G
          (ι → Multiplicative ℤ)) :=
    permutationFunctionHerbrandH0Finite σ hgen
  let e :=
    permutationSublatticeBasisMulEquivFunctions
      ρ L hL
  let he :=
    permutationSublatticeBasisMulEquivFunctions_equivariant
      ρ L hL
  exact
    herbrandH0Finite_of_equivariantMulEquiv
      e.symm (mulEquiv_symm_commutes_smul e he)
 

theorem permutationSublatticeHerbrandHMinusOneFinite
    (ρ : G →* Equiv.Perm ι)
    (L : Submodule ℤ (ι → ℝ)) [DiscreteTopology L]
    [IsZLattice ℝ L]
    (hL : ∀ (g : G) (x : ι → ℝ), x ∈ L →
      permutationRepresentation ρ g x ∈ L)
    (σ : G)
    (hgen : ∀ g : G,
      g ∈ Subgroup.zpowers σ) :
    letI _indexAction : MulAction G ι :=
      permutationMulAction ρ
    letI _sublatticeAction :
        DistribMulAction G
          (permutationSublattice ρ L hL) :=
      permutationSublatticeDistribMulAction ρ L hL
    letI _multiplicativeAction :
        MulDistribMulAction G
          (Multiplicative
            (permutationSublattice ρ L hL)) :=
      multiplicativeDistribMulAction
    Finite
      (HerbrandHMinusOne G
        (Multiplicative
          (permutationSublattice ρ L hL)) σ) := by
  let indexAction : MulAction G ι :=
    permutationMulAction ρ
  let sublatticeAction :
      DistribMulAction G
        (permutationSublattice ρ L hL) :=
    permutationSublatticeDistribMulAction ρ L hL
  let multiplicativeAction :
      MulDistribMulAction G
        (Multiplicative
          (permutationSublattice ρ L hL)) :=
    multiplicativeDistribMulAction
  let functionAction :
      MulDistribMulAction G
        (ι → Multiplicative ℤ) :=
    permutationFunctionMulDistribMulAction
  let functionHMinusOneFinite :
      Finite
        (HerbrandHMinusOne G
          (ι → Multiplicative ℤ) σ) :=
    permutationFunctionHerbrandHMinusOneFinite σ hgen
  let e :=
    permutationSublatticeBasisMulEquivFunctions
      ρ L hL
  let he :=
    permutationSublatticeBasisMulEquivFunctions_equivariant
      ρ L hL
  exact
    herbrandHMinusOneFinite_of_equivariantMulEquiv
      e.symm (mulEquiv_symm_commutes_smul e he) σ
 


theorem
    permutationSublattice_herbrandQuotient_eq_stabilizerProduct
    (ρ : G →* Equiv.Perm ι)
    (L : Submodule ℤ (ι → ℝ)) [DiscreteTopology L]
    [IsZLattice ℝ L]
    (hL : ∀ (g : G) (x : ι → ℝ), x ∈ L →
      permutationRepresentation ρ g x ∈ L)
    (σ : G)
    (hgen : ∀ g : G,
      g ∈ Subgroup.zpowers σ) :
    letI _indexAction : MulAction G ι :=
      permutationMulAction ρ
    letI _sublatticeAction :
        DistribMulAction G
          (permutationSublattice ρ L hL) :=
      permutationSublatticeDistribMulAction ρ L hL
    letI _multiplicativeAction :
        MulDistribMulAction G
          (Multiplicative
            (permutationSublattice ρ L hL)) :=
      multiplicativeDistribMulAction
    letI _orbitFintype :
        Fintype (MulAction.orbitRel.Quotient G ι) :=
      Fintype.ofFinite _
    letI _stabilizerFintype :
        ∀ ω : MulAction.orbitRel.Quotient G ι,
          Fintype (permutationOrbitStabilizer ω) :=
      fun _ => Fintype.ofFinite _
    letI _sublatticeH0Finite :
        Finite
          (HerbrandH0 G
            (Multiplicative
              (permutationSublattice ρ L hL))) :=
      permutationSublatticeHerbrandH0Finite
        ρ L hL σ hgen
    letI _sublatticeHMinusOneFinite :
        Finite
          (HerbrandHMinusOne G
            (Multiplicative
              (permutationSublattice ρ L hL)) σ) :=
      permutationSublatticeHerbrandHMinusOneFinite
        ρ L hL σ hgen
    herbrandQuotient
        (G := G)
        (A := Multiplicative
          (permutationSublattice ρ L hL)) σ =
      ∏ ω : MulAction.orbitRel.Quotient G ι,
        (Fintype.card
          (permutationOrbitStabilizer ω) : ℚ) := by
  let indexAction : MulAction G ι :=
    permutationMulAction ρ
  let sublatticeAction :
      DistribMulAction G
        (permutationSublattice ρ L hL) :=
    permutationSublatticeDistribMulAction ρ L hL
  let multiplicativeAction :
      MulDistribMulAction G
        (Multiplicative
          (permutationSublattice ρ L hL)) :=
    multiplicativeDistribMulAction
  let functionAction :
      MulDistribMulAction G
        (ι → Multiplicative ℤ) :=
    permutationFunctionMulDistribMulAction
  let orbitFintype :
      Fintype (MulAction.orbitRel.Quotient G ι) :=
    Fintype.ofFinite _
  let stabilizerFintype :
      ∀ ω : MulAction.orbitRel.Quotient G ι,
        Fintype (permutationOrbitStabilizer ω) :=
    fun _ => Fintype.ofFinite _
  let sublatticeH0Finite :
      Finite
        (HerbrandH0 G
          (Multiplicative
            (permutationSublattice ρ L hL))) :=
    permutationSublatticeHerbrandH0Finite
      ρ L hL σ hgen
  let sublatticeHMinusOneFinite :
      Finite
        (HerbrandHMinusOne G
          (Multiplicative
            (permutationSublattice ρ L hL)) σ) :=
    permutationSublatticeHerbrandHMinusOneFinite
      ρ L hL σ hgen
  let functionH0Finite :
      Finite
        (HerbrandH0 G
          (ι → Multiplicative ℤ)) :=
    permutationFunctionHerbrandH0Finite σ hgen
  let functionHMinusOneFinite :
      Finite
        (HerbrandHMinusOne G
          (ι → Multiplicative ℤ) σ) :=
    permutationFunctionHerbrandHMinusOneFinite σ hgen
  let e :=
    permutationSublatticeBasisMulEquivFunctions
      ρ L hL
  let he :=
    permutationSublatticeBasisMulEquivFunctions_equivariant
      ρ L hL
  calc
    herbrandQuotient
        (G := G)
        (A := Multiplicative
          (permutationSublattice ρ L hL)) σ =
        herbrandQuotient
          (G := G) (A := ι → Multiplicative ℤ) σ := by
      simpa only [e, he] using
        (herbrandQuotient_eq_of_equivariantMulEquiv
          e he σ)
    _ = ∏ ω : MulAction.orbitRel.Quotient G ι,
          (Fintype.card
            (permutationOrbitStabilizer ω) : ℚ) :=
      permutationFunction_herbrandQuotient_eq_stabilizerProduct
        σ hgen
 



theorem
    completePermutationLattice_herbrandQuotient_eq_stabilizerProduct
    {G ι : Type}
    [Fintype G] [Group G] [Fintype ι] [DecidableEq ι]
    (ρ : G →* Equiv.Perm ι)
    (L : Submodule ℤ (ι → ℝ)) [DiscreteTopology L]
    [IsZLattice ℝ L]
    (hL : ∀ (g : G) (x : ι → ℝ), x ∈ L →
      permutationRepresentation ρ g x ∈ L)
    (σ : G)
    (hgen : ∀ g : G,
      g ∈ Subgroup.zpowers σ) :
    letI _indexAction : MulAction G ι :=
      permutationMulAction ρ
    letI _ambientAction :
        DistribMulAction G L :=
      completePermutationLatticeDistribMulAction
        ρ L hL
    letI _ambientMultiplicativeAction :
        MulDistribMulAction G
          (Multiplicative L) :=
      multiplicativeDistribMulAction
    letI _orbitFintype :
        Fintype (MulAction.orbitRel.Quotient G ι) :=
      Fintype.ofFinite _
    letI _stabilizerFintype :
        ∀ ω : MulAction.orbitRel.Quotient G ι,
          Fintype (permutationOrbitStabilizer ω) :=
      fun _ => Fintype.ofFinite _
    ∃ h :
        HerbrandQuotientDefined
          G (Multiplicative L) σ,
      @herbrandQuotient
          G (Multiplicative L) _ _ _ _
          σ h.1 h.2 =
        ∏ ω : MulAction.orbitRel.Quotient G ι,
          (Fintype.card
            (permutationOrbitStabilizer ω) : ℚ) := by
  let indexAction : MulAction G ι :=
    permutationMulAction ρ
  let ambientAction :
      DistribMulAction G L :=
    completePermutationLatticeDistribMulAction
      ρ L hL
  let ambientMultiplicativeAction :
      MulDistribMulAction G
        (Multiplicative L) :=
    multiplicativeDistribMulAction
  let orbitFintype :
      Fintype (MulAction.orbitRel.Quotient G ι) :=
    Fintype.ofFinite _
  let stabilizerFintype :
      ∀ ω : MulAction.orbitRel.Quotient G ι,
        Fintype (permutationOrbitStabilizer ω) :=
    fun _ => Fintype.ofFinite _
  let B :=
    permutationSublatticeMultiplicativeSubgroup
      ρ L hL
  have hstable :
      ∀ (g : G) (x : Multiplicative L),
        x ∈ B → g • x ∈ B := by
    simpa only [B] using
      (permutationSublatticeMultiplicativeSubgroup_stable
        ρ L hL)
  let subgroupAction :
      MulDistribMulAction G B :=
    stableSubgroupMulDistribMulAction
      B hstable
  let quotientAction :
      MulDistribMulAction G
        (Multiplicative L ⧸ B) :=
    stableQuotientMulDistribMulAction
      B hstable
  let quotientFinite :
      Finite (Multiplicative L ⧸ B) := by
    simpa only [B] using
      (permutationSublatticeMultiplicativeSubgroup_finite_quotient
        ρ L hL)
  let sublatticeAction :
      DistribMulAction G
        (permutationSublattice ρ L hL) :=
    permutationSublatticeDistribMulAction ρ L hL
  let sublatticeMultiplicativeAction :
      MulDistribMulAction G
        (Multiplicative
          (permutationSublattice ρ L hL)) :=
    multiplicativeDistribMulAction
  let sublatticeH0Finite :
      Finite
        (HerbrandH0 G
          (Multiplicative
            (permutationSublattice ρ L hL))) :=
    permutationSublatticeHerbrandH0Finite
      ρ L hL σ hgen
  let sublatticeHMinusOneFinite :
      Finite
        (HerbrandHMinusOne G
          (Multiplicative
            (permutationSublattice ρ L hL)) σ) :=
    permutationSublatticeHerbrandHMinusOneFinite
      ρ L hL σ hgen
  let e :=
    permutationSublatticeSubgroupMulEquiv
      ρ L hL
  have he :
      ∀ (g : G) (x : B),
        e (g • x) = g • e x := by
    intro g x
    exact
      permutationSublatticeSubgroupMulEquiv_equivariant
        ρ L hL g x
  let subgroupH0Finite :
      Finite (HerbrandH0 G B) :=
    herbrandH0Finite_of_equivariantMulEquiv
      e.symm
      (mulEquiv_symm_commutes_smul e he)
  let subgroupHMinusOneFinite :
      Finite (HerbrandHMinusOne G B σ) :=
    herbrandHMinusOneFinite_of_equivariantMulEquiv
      e.symm
      (mulEquiv_symm_commutes_smul e he) σ
  let hB :
      HerbrandQuotientDefined G B σ :=
    ⟨subgroupH0Finite,
      subgroupHMinusOneFinite⟩
  let hA :
      HerbrandQuotientDefined
        G (Multiplicative L) σ :=
    finiteIndexStableSubgroup_ambientHerbrandQuotientDefined
      B hstable σ hgen hB
  refine ⟨hA, ?_⟩
  let ambientH0Finite :
      Finite
        (HerbrandH0 G
          (Multiplicative L)) :=
    hA.1
  let ambientHMinusOneFinite :
      Finite
        (HerbrandHMinusOne G
          (Multiplicative L) σ) :=
    hA.2
  calc
    @herbrandQuotient
          G (Multiplicative L) _ _ _ _
          σ hA.1 hA.2 =
        @herbrandQuotient
          G B _ _ _ _
          σ hB.1 hB.2 := by
      simpa only [hA] using
        (herbrandQuotient_eq_of_finiteIndex_stableSubgroup
          B hstable σ hgen hB)
    _ =
        herbrandQuotient
          (G := G)
          (A := Multiplicative
            (permutationSublattice ρ L hL)) σ := by
      simpa only [e, he] using
        (herbrandQuotient_eq_of_equivariantMulEquiv
          e he σ)
    _ = ∏ ω : MulAction.orbitRel.Quotient G ι,
          (Fintype.card
            (permutationOrbitStabilizer ω) : ℚ) :=
      permutationSublattice_herbrandQuotient_eq_stabilizerProduct
        ρ L hL σ hgen
end StableSublattice
end CyclicCohomology
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.SUnit.GaloisAction -/
section
open scoped BigOperators Classical NumberField nonZeroDivisors
open IsDedekindDomain Module
open CyclicCohomology.ProfiniteCohomology.Herbrand
open CyclicCohomology
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
 

noncomputable def idealMapMulEquiv
    {R : Type*} [CommRing R]
    (e : R ≃+* R) : Ideal R ≃* Ideal R where
  toFun I := I.map e
  invFun I := I.map e.symm
  left_inv _ := Ideal.map_of_equiv e
  right_inv _ := Ideal.map_of_equiv e.symm
  map_mul' I J := Ideal.map_mul e I J
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
omit [NumberField K] [NumberField L] in
@[simp]
theorem finitePlaceEquiv_one
    (v : HeightOneSpectrum (𝓞 L)) :
    finitePlaceEquiv K L (1 : L ≃ₐ[K] L) v = v := by
  apply HeightOneSpectrum.ext
  ext x
  change
    NumberField.RingOfIntegers.mapRingHom (1 : L ≃ₐ[K] L).symm.toRingHom x ∈
        v.asIdeal ↔
      x ∈ v.asIdeal
  have hx :
      NumberField.RingOfIntegers.mapRingHom (1 : L ≃ₐ[K] L).symm.toRingHom x =
        x := by
    apply NumberField.RingOfIntegers.ext
    rfl
  rw [hx]
omit [NumberField K] [NumberField L] in
@[simp]
theorem finitePlaceEquiv_mul
    (σ τ : L ≃ₐ[K] L)
    (v : HeightOneSpectrum (𝓞 L)) :
    finitePlaceEquiv K L (σ * τ) v =
      finitePlaceEquiv K L σ
        (finitePlaceEquiv K L τ v) := by
  apply HeightOneSpectrum.ext
  ext x
  change
    NumberField.RingOfIntegers.mapRingHom (σ * τ).symm.toRingHom x ∈
        v.asIdeal ↔
      NumberField.RingOfIntegers.mapRingHom τ.symm.toRingHom
          (NumberField.RingOfIntegers.mapRingHom σ.symm.toRingHom x) ∈
        v.asIdeal
  have hx :
      NumberField.RingOfIntegers.mapRingHom (σ * τ).symm.toRingHom x =
        NumberField.RingOfIntegers.mapRingHom τ.symm.toRingHom
          (NumberField.RingOfIntegers.mapRingHom σ.symm.toRingHom x) := by
    apply NumberField.RingOfIntegers.ext
    rfl
  rw [hx]
omit [NumberField K] [NumberField L] in
@[simp]
theorem finitePlaceEquiv_inv_apply
    (σ : L ≃ₐ[K] L)
    (v : HeightOneSpectrum (𝓞 L)) :
    finitePlaceEquiv K L σ
        (finitePlaceEquiv K L σ⁻¹ v) = v := by
  rw [← finitePlaceEquiv_mul]
  simp
 
noncomputable abbrev finitePlaceMulAction :
    MulAction (L ≃ₐ[K] L)
      (HeightOneSpectrum (𝓞 L)) where
  smul σ v := finitePlaceEquiv K L σ v
  one_smul := finitePlaceEquiv_one K L
  mul_smul := finitePlaceEquiv_mul K L
omit [NumberField K] in
 

theorem intValuation_finitePlaceEquiv
    (σ : L ≃ₐ[K] L)
    (v : HeightOneSpectrum (𝓞 L))
    (r : 𝓞 L) :
    (finitePlaceEquiv K L σ v).intValuation
        (NumberField.RingOfIntegers.mapAlgEquiv σ r) =
      v.intValuation r := by
  let e := (NumberField.RingOfIntegers.mapAlgEquiv σ).toRingEquiv
  by_cases hr : r = 0
  · subst r
    simp
  change
    (finitePlaceEquiv K L σ v).intValuation (e r) =
      v.intValuation r
  have her : e r ≠ 0 := by
    simpa using e.injective.ne hr
  rw [HeightOneSpectrum.intValuation_eq_exp_neg_multiplicity
      (finitePlaceEquiv K L σ v) her,
    HeightOneSpectrum.intValuation_eq_exp_neg_multiplicity v hr]
  congr 2
  have hspan :
      Ideal.span ({e r} : Set (𝓞 L)) =
        idealMapMulEquiv e (Ideal.span ({r} : Set (𝓞 L))) := by
    simp [idealMapMulEquiv, Ideal.map_span]
  rw [finitePlaceEquiv_asIdeal, hspan]
  norm_cast
  exact multiplicity_map_eq (idealMapMulEquiv e)
    (a := v.asIdeal) (b := Ideal.span ({r} : Set (𝓞 L)))
omit [NumberField K] in
 

theorem valuation_finitePlaceEquiv
    (σ : L ≃ₐ[K] L)
    (v : HeightOneSpectrum (𝓞 L))
    (x : L) :
    (finitePlaceEquiv K L σ v).valuation L (σ x) =
      v.valuation L x := by
  obtain ⟨r, d, hrd⟩ :=
    IsLocalization.exists_mk'_eq (𝓞 L)⁰ x
  rw [← hrd, IsFractionRing.mk'_eq_div, map_div₀,
    map_div₀, map_div₀]
  have hσr :
      σ ((algebraMap (𝓞 L) L) r) =
        (algebraMap (𝓞 L) L)
          (NumberField.RingOfIntegers.mapAlgEquiv σ r) :=
    rfl
  have hσd :
      σ ((algebraMap (𝓞 L) L) (d : 𝓞 L)) =
        (algebraMap (𝓞 L) L)
          (NumberField.RingOfIntegers.mapAlgEquiv σ (d : 𝓞 L)) :=
    rfl
  rw [hσr, hσd]
  simp only [HeightOneSpectrum.valuation_of_algebraMap]
  rw [intValuation_finitePlaceEquiv, intValuation_finitePlaceEquiv]
 
theorem absNorm_map_ringEquiv
    {R : Type*} [CommRing R] [IsDedekindDomain R]
    [Module.Free ℤ R]
    (e : R ≃+* R) (I : Ideal R) :
    Ideal.absNorm (I.map e) = Ideal.absNorm I := by
  rw [Ideal.absNorm_apply, Ideal.absNorm_apply,
    Submodule.cardQuot_apply, Submodule.cardQuot_apply]
  exact Nat.card_congr
    (Ideal.quotientEquiv I (I.map e) e rfl).toEquiv.symm
private theorem toNNReal_apply_congr
    {e f : NNReal} (he : e ≠ 0) (hf : f ≠ 0)
    (hef : e = f) (q : WithZero (Multiplicative ℤ)) :
    ((WithZeroMulInt.toNNReal he q : NNReal) : ℝ) =
      ((WithZeroMulInt.toNNReal hf q : NNReal) : ℝ) := by
  subst f
  rfl
omit [NumberField K] in
 

theorem adicAbv_finitePlaceEquiv
    (σ : L ≃ₐ[K] L)
    (v : HeightOneSpectrum (𝓞 L))
    (x : L) :
    NumberField.HeightOneSpectrum.adicAbv L
        (finitePlaceEquiv K L σ v) (σ x) =
      NumberField.HeightOneSpectrum.adicAbv L v x := by
  rw [NumberField.HeightOneSpectrum.adicAbv_def,
    NumberField.HeightOneSpectrum.adicAbv_def,
    valuation_finitePlaceEquiv]
  have hnorm :
      Ideal.absNorm (finitePlaceEquiv K L σ v).asIdeal =
        Ideal.absNorm v.asIdeal := by
    rw [finitePlaceEquiv_asIdeal, absNorm_map_ringEquiv]
  have hnorm_nnreal :
      (Ideal.absNorm
          (finitePlaceEquiv K L σ v).asIdeal : NNReal) =
        (Ideal.absNorm v.asIdeal : NNReal) := by
    exact_mod_cast hnorm
  exact toNNReal_apply_congr
    (NumberField.HeightOneSpectrum.absNorm_ne_zero
      (finitePlaceEquiv K L σ v))
    (NumberField.HeightOneSpectrum.absNorm_ne_zero v)
    hnorm_nnreal (v.valuation L x)
omit [NumberField K] [NumberField L] in
 
@[simp]
theorem infinitePlace_mult_smul
    (σ : L ≃ₐ[K] L)
    (w : NumberField.InfinitePlace L) :
    (σ • w).mult = w.mult := by
  unfold NumberField.InfinitePlace.mult
  rw [NumberField.InfinitePlace.isReal_smul_iff]
 
noncomputable abbrev fieldUnitsMulDistribMulAction :
    MulDistribMulAction (L ≃ₐ[K] L) Lˣ where
  smul σ x := Units.mapEquiv σ.toMulEquiv x
  one_smul x := by
    ext
    rfl
  mul_smul σ τ x := by
    ext
    rfl
  smul_one σ := map_one (Units.mapEquiv σ.toMulEquiv)
  smul_mul σ x y := map_mul (Units.mapEquiv σ.toMulEquiv) x y
section FinitePlaceAction
local instance :
    MulAction (L ≃ₐ[K] L)
      (HeightOneSpectrum (𝓞 L)) :=
  finitePlaceMulAction K L
local instance :
    MulDistribMulAction (L ≃ₐ[K] L) Lˣ :=
  fieldUnitsMulDistribMulAction K L
 

def IsGaloisStableFinitePlaces
    (S : Finset (HeightOneSpectrum (𝓞 L))) : Prop :=
  ∀ (σ : L ≃ₐ[K] L)
    (v : HeightOneSpectrum (𝓞 L)),
      v ∈ S ↔ σ • v ∈ S
omit [NumberField K] [NumberField L] in
theorem IsGaloisStableFinitePlaces.smul_mem
    {S : Finset (HeightOneSpectrum (𝓞 L))}
    (hS : IsGaloisStableFinitePlaces K L S)
    (σ : L ≃ₐ[K] L) {v : HeightOneSpectrum (𝓞 L)}
    (hv : v ∈ S) :
    σ • v ∈ S :=
  (hS σ v).mp hv
omit [NumberField K] in
 

theorem sUnit_smul_mem
    {S : Finset (HeightOneSpectrum (𝓞 L))}
    (hS : IsGaloisStableFinitePlaces K L S)
    (σ : L ≃ₐ[K] L) (x : Lˣ)
    (hx : x ∈ SUnitGroup (K := L) S) :
    σ • x ∈ SUnitGroup (K := L) S := by
  intro v hv
  let w : HeightOneSpectrum (𝓞 L) := σ⁻¹ • v
  have hw : w ∉ S := by
    intro hwmem
    exact hv ((hS σ⁻¹ v).mpr hwmem)
  have hxw : w.valuation L (x : L) = 1 :=
    hx w hw
  have htransport :=
    valuation_finitePlaceEquiv K L σ w (x : L)
  have hvw : finitePlaceEquiv K L σ w = v := by
    change
      finitePlaceEquiv K L σ
          (finitePlaceEquiv K L σ⁻¹ v) = v
    rw [← finitePlaceEquiv_mul]
    simp
  rw [hvw] at htransport
  change v.valuation L (σ (x : L)) = 1
  exact htransport.trans hxw
 
noncomputable abbrev sUnitMulDistribMulAction
    (S : Finset (HeightOneSpectrum (𝓞 L)))
    (hS : IsGaloisStableFinitePlaces K L S) :
    MulDistribMulAction (L ≃ₐ[K] L)
      (SUnitGroup (K := L) S) :=
  stableSubgroupMulDistribMulAction
    (SUnitGroup (K := L) S)
    (sUnit_smul_mem K L hS)
 

noncomputable abbrev stableFinitePlaceMulAction
    (S : Finset (HeightOneSpectrum (𝓞 L)))
    (hS : IsGaloisStableFinitePlaces K L S) :
    MulAction (L ≃ₐ[K] L) S where
  smul σ v :=
    ⟨σ • (v : HeightOneSpectrum (𝓞 L)),
      IsGaloisStableFinitePlaces.smul_mem K L hS σ
        v.property⟩
  one_smul v := by
    apply Subtype.ext
    exact one_smul _ (v : HeightOneSpectrum (𝓞 L))
  mul_smul σ τ v := by
    apply Subtype.ext
    exact mul_smul σ τ (v : HeightOneSpectrum (𝓞 L))
 

noncomputable abbrev logPlaceMulAction
    (S : Finset (HeightOneSpectrum (𝓞 L)))
    (hS : IsGaloisStableFinitePlaces K L S) :
    MulAction (L ≃ₐ[K] L)
      (SUnitGroup.LogPlace (K := L) S) := by
  letI : MulAction (L ≃ₐ[K] L) S :=
    stableFinitePlaceMulAction K L S hS
  exact
    { smul := fun σ p =>
        match p with
        | Sum.inl w => Sum.inl (σ • w)
        | Sum.inr v => Sum.inr (σ • v)
      one_smul := by
        intro p
        cases p with
        | inl w =>
            change Sum.inl ((1 : L ≃ₐ[K] L) • w) =
              Sum.inl w
            rw [one_smul]
        | inr v =>
            change Sum.inr ((1 : L ≃ₐ[K] L) • v) =
              Sum.inr v
            rw [one_smul]
      mul_smul := by
        intro σ τ p
        cases p with
        | inl w =>
            change Sum.inl ((σ * τ) • w) =
              Sum.inl (σ • (τ • w))
            rw [mul_smul]
        | inr v =>
            change Sum.inr ((σ * τ) • v) =
              Sum.inr (σ • (τ • v))
            rw [mul_smul] }
 
noncomputable abbrev additiveSUnitDistribMulAction
    (S : Finset (HeightOneSpectrum (𝓞 L)))
    (hS : IsGaloisStableFinitePlaces K L S) :
    DistribMulAction (L ≃ₐ[K] L)
      (Additive (SUnitGroup (K := L) S)) := by
  letI := sUnitMulDistribMulAction K L S hS
  exact
    { smul := fun σ x =>
        Additive.ofMul
          (σ • (Additive.toMul x :
            SUnitGroup (K := L) S))
      one_smul := by
        intro x
        apply Additive.toMul.injective
        exact one_smul (L ≃ₐ[K] L) (Additive.toMul x :
          SUnitGroup (K := L) S)
      mul_smul := by
        intro σ τ x
        apply Additive.toMul.injective
        exact mul_smul σ τ (Additive.toMul x :
          SUnitGroup (K := L) S)
      smul_zero := by
        intro σ
        apply Additive.toMul.injective
        change σ • (1 : SUnitGroup (K := L) S) = 1
        exact MulDistribMulAction.smul_one σ
      smul_add := by
        intro σ x y
        apply Additive.toMul.injective
        exact MulDistribMulAction.smul_mul σ
          (Additive.toMul x : SUnitGroup (K := L) S)
          (Additive.toMul y : SUnitGroup (K := L) S) }
 

noncomputable abbrev fullLogSpaceDistribMulAction
    (S : Finset (HeightOneSpectrum (𝓞 L)))
    (hS : IsGaloisStableFinitePlaces K L S) :
    DistribMulAction (L ≃ₐ[K] L)
      (SUnitGroup.FullLogSpace (K := L) S) := by
  letI := logPlaceMulAction K L S hS
  exact
    { smul := fun σ z p => z (σ⁻¹ • p)
      one_smul := by
        intro z
        funext p
        change z ((1 : L ≃ₐ[K] L)⁻¹ • p) = z p
        rw [inv_one, one_smul]
      mul_smul := by
        intro σ τ z
        funext p
        change z ((σ * τ)⁻¹ • p) =
          z (τ⁻¹ • (σ⁻¹ • p))
        rw [mul_inv_rev, mul_smul]
      smul_zero := by
        intro σ
        rfl
      smul_add := by
        intro σ z z'
        rfl }
 
noncomputable def logPlacePermutationHom
    (S : Finset (HeightOneSpectrum (𝓞 L)))
    (hS : IsGaloisStableFinitePlaces K L S) :
    (L ≃ₐ[K] L) →*
      Equiv.Perm (SUnitGroup.LogPlace (K := L) S) := by
  letI := logPlaceMulAction K L S hS
  exact MulAction.toPermHom
    (L ≃ₐ[K] L) (SUnitGroup.LogPlace (K := L) S)
omit [NumberField K] [NumberField L] in
 

theorem permutationRepresentation_logPlace
    {S : Finset (HeightOneSpectrum (𝓞 L))}
    (hS : IsGaloisStableFinitePlaces K L S)
    (σ : L ≃ₐ[K] L)
    (z : SUnitGroup.FullLogSpace (K := L) S) :
    letI := logPlaceMulAction K L S hS
    letI := fullLogSpaceDistribMulAction K L S hS
    permutationRepresentation
        (logPlacePermutationHom K L S hS) σ z =
      σ • z := by
  let := logPlaceMulAction K L S hS
  let := fullLogSpaceDistribMulAction K L S hS
  ext p
  rfl
omit [NumberField K] in
 
theorem coordinateSum_smul
    {S : Finset (HeightOneSpectrum (𝓞 L))}
    (hS : IsGaloisStableFinitePlaces K L S)
    (σ : L ≃ₐ[K] L)
    (z : SUnitGroup.FullLogSpace (K := L) S) :
    letI := logPlaceMulAction K L S hS
    letI := fullLogSpaceDistribMulAction K L S hS
    SUnitGroup.coordinateSum (K := L) S (σ • z) =
      SUnitGroup.coordinateSum (K := L) S z := by
  let := logPlaceMulAction K L S hS
  let := fullLogSpaceDistribMulAction K L S hS
  change
    (∑ p : SUnitGroup.LogPlace (K := L) S,
      z (σ⁻¹ • p)) = ∑ p, z p
  exact
    Fintype.sum_equiv (MulAction.toPerm σ⁻¹)
      (fun p : SUnitGroup.LogPlace (K := L) S =>
        z (σ⁻¹ • p))
      z (fun _ => rfl)
 
noncomputable def normalizedLogDiagonal
    (S : Finset (HeightOneSpectrum (𝓞 L))) :
    SUnitGroup.FullLogSpace (K := L) S :=
  fun _ =>
    (Fintype.card
      (SUnitGroup.LogPlace (K := L) S) : ℝ)⁻¹
@[simp]
theorem coordinateSum_normalizedLogDiagonal
    (S : Finset (HeightOneSpectrum (𝓞 L))) :
    SUnitGroup.coordinateSum (K := L) S
        (normalizedLogDiagonal L S) = 1 := by
  change
    (∑ _ : SUnitGroup.LogPlace (K := L) S,
      (Fintype.card
        (SUnitGroup.LogPlace (K := L) S) : ℝ)⁻¹) = 1
  rw [Finset.sum_const, Finset.card_univ, nsmul_eq_mul]
  exact mul_inv_cancel₀
    (by exact_mod_cast
      (Fintype.card_ne_zero :
        Fintype.card (SUnitGroup.LogPlace (K := L) S) ≠ 0))
 

noncomputable def fullLogSpaceSplit
    (S : Finset (HeightOneSpectrum (𝓞 L))) :
    SUnitGroup.FullLogSpace (K := L) S →ₗ[ℝ]
      (SUnitGroup.LogHyperplane (K := L) S × ℝ) where
  toFun z :=
    (⟨z -
        SUnitGroup.coordinateSum (K := L) S z •
          normalizedLogDiagonal L S, by
      apply LinearMap.mem_ker.mpr
      rw [map_sub, map_smul,
        coordinateSum_normalizedLogDiagonal]
      simp⟩,
      SUnitGroup.coordinateSum (K := L) S z)
  map_add' z z' := by
    apply Prod.ext
    · ext p
      simp only [Pi.add_apply, Pi.sub_apply, Pi.smul_apply, map_add,
        Prod.fst_add, Submodule.coe_add]
      module
    · exact map_add
        (SUnitGroup.coordinateSum (K := L) S) z z'
  map_smul' c z := by
    apply Prod.ext
    · ext p
      simp only [Pi.smul_apply, Pi.sub_apply, map_smul,
        Prod.smul_fst, RingHom.id_apply, Submodule.coe_smul]
      module
    · exact map_smul
        (SUnitGroup.coordinateSum (K := L) S) c z
theorem fullLogSpaceSplit_injective
    (S : Finset (HeightOneSpectrum (𝓞 L))) :
    Function.Injective (fullLogSpaceSplit L S) := by
  intro z z' h
  have hfirst :
      z -
          SUnitGroup.coordinateSum (K := L) S z •
            normalizedLogDiagonal L S =
        z' -
          SUnitGroup.coordinateSum (K := L) S z' •
            normalizedLogDiagonal L S :=
    congrArg
      (fun q =>
        ((q.1 :
          SUnitGroup.LogHyperplane (K := L) S) :
            SUnitGroup.FullLogSpace (K := L) S)) h
  have hsecond :
      SUnitGroup.coordinateSum (K := L) S z =
        SUnitGroup.coordinateSum (K := L) S z' :=
    congrArg Prod.snd h
  calc
    z =
        (z -
            SUnitGroup.coordinateSum (K := L) S z •
              normalizedLogDiagonal L S) +
          SUnitGroup.coordinateSum (K := L) S z •
            normalizedLogDiagonal L S := by
              symm
              exact sub_add_cancel _ _
    _ =
        (z' -
            SUnitGroup.coordinateSum (K := L) S z' •
              normalizedLogDiagonal L S) +
          SUnitGroup.coordinateSum (K := L) S z' •
            normalizedLogDiagonal L S := by
              rw [hfirst, hsecond]
    _ = z' := sub_add_cancel _ _
theorem fullLogSpaceSplit_surjective
    (S : Finset (HeightOneSpectrum (𝓞 L))) :
    Function.Surjective (fullLogSpaceSplit L S) := by
  intro q
  let z : SUnitGroup.FullLogSpace (K := L) S :=
    (q.1 : SUnitGroup.FullLogSpace (K := L) S) +
      q.2 • normalizedLogDiagonal L S
  refine ⟨z, ?_⟩
  apply Prod.ext
  · apply Subtype.ext
    change
      z -
          SUnitGroup.coordinateSum (K := L) S z •
            normalizedLogDiagonal L S =
        (q.1 : SUnitGroup.FullLogSpace (K := L) S)
    have hq :
        SUnitGroup.coordinateSum (K := L) S
            (q.1 : SUnitGroup.FullLogSpace (K := L) S) = 0 :=
      LinearMap.mem_ker.mp q.1.property
    simp [z, hq, coordinateSum_normalizedLogDiagonal]
  · change
      SUnitGroup.coordinateSum (K := L) S z = q.2
    have hq :
        SUnitGroup.coordinateSum (K := L) S
            (q.1 : SUnitGroup.FullLogSpace (K := L) S) = 0 :=
      LinearMap.mem_ker.mp q.1.property
    simp [z, hq, coordinateSum_normalizedLogDiagonal]
 

noncomputable def fullLogSpaceEquivHyperplaneProd
    (S : Finset (HeightOneSpectrum (𝓞 L))) :
    SUnitGroup.FullLogSpace (K := L) S ≃ₗ[ℝ]
      (SUnitGroup.LogHyperplane (K := L) S × ℝ) :=
  LinearEquiv.ofBijective
    (fullLogSpaceSplit L S)
    ⟨fullLogSpaceSplit_injective L S,
      fullLogSpaceSplit_surjective L S⟩
 
noncomputable def fullLogSpaceContinuousEquivHyperplaneProd
    (S : Finset (HeightOneSpectrum (𝓞 L))) :
    SUnitGroup.FullLogSpace (K := L) S ≃L[ℝ]
      (SUnitGroup.LogHyperplane (K := L) S × ℝ) :=
  (fullLogSpaceEquivHyperplaneProd L S).toContinuousLinearEquiv
 

noncomputable def fullLogLatticeRealBasis
    (S : Finset (HeightOneSpectrum (𝓞 L))) :
    Basis
      (Module.Free.ChooseBasisIndex ℤ
        (SUnitGroup.fullLogLattice (K := L) S))
      ℝ (SUnitGroup.LogHyperplane (K := L) S) :=
  (Module.Free.chooseBasis ℤ
      (SUnitGroup.fullLogLattice (K := L) S)).ofZLatticeBasis
        ℝ (SUnitGroup.fullLogLattice (K := L) S)
 

noncomputable def fullLogHyperplaneDiagonalBasis
    (S : Finset (HeightOneSpectrum (𝓞 L))) :
    Basis
      (Module.Free.ChooseBasisIndex ℤ
          (SUnitGroup.fullLogLattice (K := L) S) ⊕ Unit)
      ℝ (SUnitGroup.LogHyperplane (K := L) S × ℝ) :=
  (fullLogLatticeRealBasis L S).prod (Basis.singleton Unit ℝ)
 

noncomputable def fullLogHyperplaneDiagonalLattice
    (S : Finset (HeightOneSpectrum (𝓞 L))) :
    Submodule ℤ
      (SUnitGroup.LogHyperplane (K := L) S × ℝ) :=
  Submodule.span ℤ
    (Set.range (fullLogHyperplaneDiagonalBasis L S))
 

noncomputable def extendedFullLogLattice
    (S : Finset (HeightOneSpectrum (𝓞 L))) :
    Submodule ℤ (SUnitGroup.FullLogSpace (K := L) S) :=
  ZLattice.comap ℝ
    (fullLogHyperplaneDiagonalLattice L S)
    (fullLogSpaceContinuousEquivHyperplaneProd L S).toLinearMap
instance instDiscreteTopology_extendedFullLogLattice
    (S : Finset (HeightOneSpectrum (𝓞 L))) :
    DiscreteTopology (extendedFullLogLattice L S) := by
  let : Module.Finite ℤ
      (SUnitGroup.fullLogLattice (K := L) S) :=
    ZLattice.module_finite ℝ
      (SUnitGroup.fullLogLattice (K := L) S)
  let : Module.Free ℤ
      (SUnitGroup.fullLogLattice (K := L) S) :=
    ZLattice.module_free ℝ
      (SUnitGroup.fullLogLattice (K := L) S)
  let :
      DiscreteTopology
        (fullLogHyperplaneDiagonalLattice L S) := by
    unfold fullLogHyperplaneDiagonalLattice
    infer_instance
  let e := fullLogSpaceContinuousEquivHyperplaneProd L S
  change
    DiscreteTopology
      (ZLattice.comap ℝ
        (fullLogHyperplaneDiagonalLattice L S)
        e.toLinearMap)
  exact
    ZLattice.comap_discreteTopology ℝ
      (fullLogHyperplaneDiagonalLattice L S)
      e.continuous e.injective
instance instIsZLattice_extendedFullLogLattice
    (S : Finset (HeightOneSpectrum (𝓞 L))) :
    IsZLattice ℝ (extendedFullLogLattice L S) := by
  let : Module.Finite ℤ
      (SUnitGroup.fullLogLattice (K := L) S) :=
    ZLattice.module_finite ℝ
      (SUnitGroup.fullLogLattice (K := L) S)
  let : Module.Free ℤ
      (SUnitGroup.fullLogLattice (K := L) S) :=
    ZLattice.module_free ℝ
      (SUnitGroup.fullLogLattice (K := L) S)
  let :
      DiscreteTopology
        (fullLogHyperplaneDiagonalLattice L S) := by
    unfold fullLogHyperplaneDiagonalLattice
    infer_instance
  let :
      IsZLattice ℝ
        (fullLogHyperplaneDiagonalLattice L S) := by
    unfold fullLogHyperplaneDiagonalLattice
    infer_instance
  let e := fullLogSpaceContinuousEquivHyperplaneProd L S
  change
    IsZLattice ℝ
      (ZLattice.comap ℝ
        (fullLogHyperplaneDiagonalLattice L S)
        e.toLinearMap)
  exact inferInstance
omit [NumberField K] in
 

theorem fullLogAmbient_smul
    {S : Finset (HeightOneSpectrum (𝓞 L))}
    (hS : IsGaloisStableFinitePlaces K L S)
    (σ : L ≃ₐ[K] L)
    (x : Additive (SUnitGroup (K := L) S)) :
    letI := sUnitMulDistribMulAction K L S hS
    letI := additiveSUnitDistribMulAction K L S hS
    letI := logPlaceMulAction K L S hS
    letI := fullLogSpaceDistribMulAction K L S hS
    SUnitGroup.fullLogAmbient (K := L) S (σ • x) =
      σ • SUnitGroup.fullLogAmbient (K := L) S x := by
  let := sUnitMulDistribMulAction K L S hS
  let := additiveSUnitDistribMulAction K L S hS
  let := logPlaceMulAction K L S hS
  let := fullLogSpaceDistribMulAction K L S hS
  let y : L :=
    (((Additive.toMul x :
      SUnitGroup (K := L) S) : Lˣ) : L)
  funext p
  cases p with
  | inl w =>
      change
        w.mult *
            Real.log (w (σ y)) =
          (σ⁻¹ • w).mult *
            Real.log ((σ⁻¹ • w) y)
      rw [infinitePlace_mult_smul]
      rfl
  | inr v =>
      change
        Real.log
            (NumberField.HeightOneSpectrum.adicAbv L
              (v : HeightOneSpectrum (𝓞 L))
              (σ y)) =
          Real.log
            (NumberField.HeightOneSpectrum.adicAbv L
              (finitePlaceEquiv K L σ⁻¹
                (v : HeightOneSpectrum (𝓞 L)))
              y)
      congr 1
      have h :=
        adicAbv_finitePlaceEquiv K L σ
          (finitePlaceEquiv K L σ⁻¹
            (v : HeightOneSpectrum (𝓞 L)))
          y
      simpa using h
 

noncomputable abbrev logHyperplaneDistribMulAction
    (S : Finset (HeightOneSpectrum (𝓞 L)))
    (hS : IsGaloisStableFinitePlaces K L S) :
    DistribMulAction (L ≃ₐ[K] L)
      (SUnitGroup.LogHyperplane (K := L) S) := by
  letI := logPlaceMulAction K L S hS
  letI := fullLogSpaceDistribMulAction K L S hS
  exact
    { smul := fun σ z =>
        ⟨σ • (z :
            SUnitGroup.FullLogSpace (K := L) S), by
          apply LinearMap.mem_ker.mpr
          rw [coordinateSum_smul K L hS]
          exact LinearMap.mem_ker.mp z.property⟩
      one_smul := by
        intro z
        apply Subtype.ext
        exact one_smul (L ≃ₐ[K] L)
          (z : SUnitGroup.FullLogSpace (K := L) S)
      mul_smul := by
        intro σ τ z
        apply Subtype.ext
        exact mul_smul σ τ
          (z : SUnitGroup.FullLogSpace (K := L) S)
      smul_zero := by
        intro σ
        apply Subtype.ext
        exact DistribMulAction.smul_zero σ
      smul_add := by
        intro σ z z'
        apply Subtype.ext
        exact DistribMulAction.smul_add σ
          (z : SUnitGroup.FullLogSpace (K := L) S)
          (z' : SUnitGroup.FullLogSpace (K := L) S) }
omit [NumberField K] in
 

theorem fullLog_smul
    {S : Finset (HeightOneSpectrum (𝓞 L))}
    (hS : IsGaloisStableFinitePlaces K L S)
    (σ : L ≃ₐ[K] L)
    (x : Additive (SUnitGroup (K := L) S)) :
    letI := sUnitMulDistribMulAction K L S hS
    letI := additiveSUnitDistribMulAction K L S hS
    letI := logPlaceMulAction K L S hS
    letI := fullLogSpaceDistribMulAction K L S hS
    letI := logHyperplaneDistribMulAction K L S hS
    SUnitGroup.fullLog (K := L) S (σ • x) =
      σ • SUnitGroup.fullLog (K := L) S x := by
  let := sUnitMulDistribMulAction K L S hS
  let := additiveSUnitDistribMulAction K L S hS
  let := logPlaceMulAction K L S hS
  let := fullLogSpaceDistribMulAction K L S hS
  let := logHyperplaneDistribMulAction K L S hS
  apply Subtype.ext
  exact fullLogAmbient_smul K L hS σ x
omit [NumberField K] in
 

theorem fullLogLattice_smul_mem
    {S : Finset (HeightOneSpectrum (𝓞 L))}
    (hS : IsGaloisStableFinitePlaces K L S)
    (σ : L ≃ₐ[K] L)
    (z : SUnitGroup.LogHyperplane (K := L) S)
    (hz : z ∈ SUnitGroup.fullLogLattice (K := L) S) :
    letI := sUnitMulDistribMulAction K L S hS
    letI := additiveSUnitDistribMulAction K L S hS
    letI := logPlaceMulAction K L S hS
    letI := fullLogSpaceDistribMulAction K L S hS
    letI := logHyperplaneDistribMulAction K L S hS
    σ • z ∈ SUnitGroup.fullLogLattice (K := L) S := by
  let := sUnitMulDistribMulAction K L S hS
  let := additiveSUnitDistribMulAction K L S hS
  let := logPlaceMulAction K L S hS
  let := fullLogSpaceDistribMulAction K L S hS
  let := logHyperplaneDistribMulAction K L S hS
  rw [SUnitGroup.fullLogLattice_eq_range] at hz ⊢
  obtain ⟨x, hx⟩ := hz
  change SUnitGroup.fullLog (K := L) S x = z at hx
  refine ⟨σ • x, ?_⟩
  change
    SUnitGroup.fullLog (K := L) S (σ • x) = σ • z
  rw [fullLog_smul K L hS, hx]
omit [NumberField K] in
 

theorem fullLogSpaceSplit_fst_smul
    {S : Finset (HeightOneSpectrum (𝓞 L))}
    (hS : IsGaloisStableFinitePlaces K L S)
    (σ : L ≃ₐ[K] L)
    (z : SUnitGroup.FullLogSpace (K := L) S) :
    letI := logPlaceMulAction K L S hS
    letI := fullLogSpaceDistribMulAction K L S hS
    letI := logHyperplaneDistribMulAction K L S hS
    (fullLogSpaceSplit L S (σ • z)).1 =
      σ • (fullLogSpaceSplit L S z).1 := by
  let := logPlaceMulAction K L S hS
  let := fullLogSpaceDistribMulAction K L S hS
  let := logHyperplaneDistribMulAction K L S hS
  apply Subtype.ext
  change
    σ • z -
        SUnitGroup.coordinateSum (K := L) S (σ • z) •
          normalizedLogDiagonal L S =
      σ •
        (z -
          SUnitGroup.coordinateSum (K := L) S z •
            normalizedLogDiagonal L S)
  rw [coordinateSum_smul K L hS]
  ext p
  rfl
omit [NumberField K] in
 

theorem fullLogSpaceSplit_snd_smul
    {S : Finset (HeightOneSpectrum (𝓞 L))}
    (hS : IsGaloisStableFinitePlaces K L S)
    (σ : L ≃ₐ[K] L)
    (z : SUnitGroup.FullLogSpace (K := L) S) :
    letI := logPlaceMulAction K L S hS
    letI := fullLogSpaceDistribMulAction K L S hS
    (fullLogSpaceSplit L S (σ • z)).2 =
      (fullLogSpaceSplit L S z).2 := by
  let := logPlaceMulAction K L S hS
  let := fullLogSpaceDistribMulAction K L S hS
  exact coordinateSum_smul K L hS σ z
omit [NumberField K] in
 

theorem extendedFullLogLattice_permutation_stable
    {S : Finset (HeightOneSpectrum (𝓞 L))}
    (hS : IsGaloisStableFinitePlaces K L S) :
    ∀ (σ : L ≃ₐ[K] L)
      (z : SUnitGroup.FullLogSpace (K := L) S),
      z ∈ extendedFullLogLattice L S →
        permutationRepresentation
            (logPlacePermutationHom K L S hS) σ z ∈
          extendedFullLogLattice L S := by
  let := sUnitMulDistribMulAction K L S hS
  let := additiveSUnitDistribMulAction K L S hS
  let := logPlaceMulAction K L S hS
  let := fullLogSpaceDistribMulAction K L S hS
  let := logHyperplaneDistribMulAction K L S hS
  intro σ z hz
  rw [permutationRepresentation_logPlace K L hS]
  change
    fullLogSpaceSplit L S z ∈
      fullLogHyperplaneDiagonalLattice L S at hz
  change
    fullLogSpaceSplit L S (σ • z) ∈
      fullLogHyperplaneDiagonalLattice L S
  let b :=
    fullLogHyperplaneDiagonalBasis L S
  have hzrepr :
      ∀ i, b.repr (fullLogSpaceSplit L S z) i ∈
        Set.range (algebraMap ℤ ℝ) := by
    apply (b.mem_span_iff_repr_mem ℤ _).mp
    exact hz
  apply (b.mem_span_iff_repr_mem ℤ _).mpr
  intro i
  cases i with
  | inl j =>
      have hzfirst :
          (fullLogSpaceSplit L S z).1 ∈
            SUnitGroup.fullLogLattice (K := L) S := by
        rw [←
          (Module.Free.chooseBasis ℤ
            (SUnitGroup.fullLogLattice
              (K := L) S)).ofZLatticeBasis_span ℝ]
        apply
          ((fullLogLatticeRealBasis L S).mem_span_iff_repr_mem
            ℤ _).mpr
        intro k
        simpa only [b, fullLogHyperplaneDiagonalBasis,
          Basis.prod_repr_inl] using hzrepr (Sum.inl k)
      have hstable :=
        fullLogLattice_smul_mem K L hS σ
          (fullLogSpaceSplit L S z).1 hzfirst
      have hspanstable :
          σ • (fullLogSpaceSplit L S z).1 ∈
            Submodule.span ℤ
              (Set.range (fullLogLatticeRealBasis L S)) := by
        simpa only [fullLogLatticeRealBasis,
          (Module.Free.chooseBasis ℤ
            (SUnitGroup.fullLogLattice
              (K := L) S)).ofZLatticeBasis_span ℝ] using hstable
      have hcoord :=
        ((fullLogLatticeRealBasis L S).mem_span_iff_repr_mem
          ℤ _).mp hspanstable j
      simpa only [b, fullLogHyperplaneDiagonalBasis,
        Basis.prod_repr_inl,
        fullLogSpaceSplit_fst_smul K L hS] using hcoord
  | inr j =>
      simpa only [b, fullLogHyperplaneDiagonalBasis,
        Basis.prod_repr_inr,
        fullLogSpaceSplit_snd_smul K L hS] using
        hzrepr (Sum.inr j)
 


theorem
    extendedFullLogLattice_herbrandQuotient_eq_stabilizerProduct
    (K L : Type) [Field K] [NumberField K]
    [Field L] [NumberField L] [Algebra K L]
    {S : Finset (HeightOneSpectrum (𝓞 L))}
    (hS : IsGaloisStableFinitePlaces K L S)
    (σ : L ≃ₐ[K] L)
    (hgen : ∀ τ : L ≃ₐ[K] L,
      τ ∈ Subgroup.zpowers σ) :
    let ρ :=
      logPlacePermutationHom K L S hS
    letI _indexAction :
        MulAction (L ≃ₐ[K] L)
          (SUnitGroup.LogPlace (K := L) S) :=
      permutationMulAction ρ
    letI _ambientAction :
        DistribMulAction (L ≃ₐ[K] L)
          (extendedFullLogLattice L S) :=
      completePermutationLatticeDistribMulAction
        ρ (extendedFullLogLattice L S)
        (extendedFullLogLattice_permutation_stable
          K L hS)
    letI _ambientMultiplicativeAction :
        MulDistribMulAction (L ≃ₐ[K] L)
          (Multiplicative
            (extendedFullLogLattice L S)) :=
      multiplicativeDistribMulAction
    letI _orbitFintype :
        Fintype
          (MulAction.orbitRel.Quotient
            (L ≃ₐ[K] L)
            (SUnitGroup.LogPlace (K := L) S)) :=
      Fintype.ofFinite _
    letI _stabilizerFintype :
        ∀ ω :
            MulAction.orbitRel.Quotient
              (L ≃ₐ[K] L)
              (SUnitGroup.LogPlace (K := L) S),
          Fintype (permutationOrbitStabilizer ω) :=
      fun _ => Fintype.ofFinite _
    ∃ h :
        HerbrandQuotientDefined
          (L ≃ₐ[K] L)
          (Multiplicative
            (extendedFullLogLattice L S)) σ,
      @herbrandQuotient
          (L ≃ₐ[K] L)
          (Multiplicative
            (extendedFullLogLattice L S))
          _ _ _ _ σ h.1 h.2 =
        ∏ ω :
            MulAction.orbitRel.Quotient
              (L ≃ₐ[K] L)
              (SUnitGroup.LogPlace (K := L) S),
          (Fintype.card
            (permutationOrbitStabilizer ω) : ℚ) := by
  let ρ :=
    logPlacePermutationHom K L S hS
  exact
    completePermutationLattice_herbrandQuotient_eq_stabilizerProduct
      (G := L ≃ₐ[K] L)
      (ι := SUnitGroup.LogPlace (K := L) S)
      ρ (extendedFullLogLattice L S)
      (extendedFullLogLattice_permutation_stable
        K L hS) σ hgen
end FinitePlaceAction
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.SUnit.Herbrand -/
section
open scoped BigOperators Classical NumberField nonZeroDivisors Pointwise
open IsDedekindDomain Module
noncomputable section
open CyclicCohomology.ProfiniteCohomology.Herbrand
open CyclicCohomology
variable
    (K L : Type*) [Field K] [NumberField K]
    [Field L] [NumberField L] [Algebra K L]
section LogarithmicQuotient
 

noncomputable abbrev fullLogLatticeDistribMulAction
    (S : Finset (HeightOneSpectrum (𝓞 L)))
    (hS : IsGaloisStableFinitePlaces K L S) :
    DistribMulAction (L ≃ₐ[K] L)
      (SUnitGroup.fullLogLattice (K := L) S) := by
  letI := sUnitMulDistribMulAction K L S hS
  letI := additiveSUnitDistribMulAction K L S hS
  letI := logPlaceMulAction K L S hS
  letI := fullLogSpaceDistribMulAction K L S hS
  letI := logHyperplaneDistribMulAction K L S hS
  exact
    { smul := fun σ z =>
        ⟨σ • (z :
            SUnitGroup.LogHyperplane (K := L) S),
          fullLogLattice_smul_mem K L hS
            σ z.1 z.2⟩
      one_smul := by
        intro z
        apply Subtype.ext
        exact one_smul (L ≃ₐ[K] L)
          (z : SUnitGroup.LogHyperplane (K := L) S)
      mul_smul := by
        intro σ τ z
        apply Subtype.ext
        exact mul_smul σ τ
          (z : SUnitGroup.LogHyperplane (K := L) S)
      smul_zero := by
        intro σ
        apply Subtype.ext
        exact DistribMulAction.smul_zero σ
      smul_add := by
        intro σ z z'
        apply Subtype.ext
        exact DistribMulAction.smul_add σ
          (z : SUnitGroup.LogHyperplane (K := L) S)
          (z' : SUnitGroup.LogHyperplane (K := L) S) }
 

noncomputable def sUnitFullLogMulHom
    (S : Finset (HeightOneSpectrum (𝓞 L))) :
    SUnitGroup (K := L) S →*
      Multiplicative
        (SUnitGroup.fullLogLattice (K := L) S) where
  toFun x :=
    Multiplicative.ofAdd
      ⟨SUnitGroup.fullLog (K := L) S
          (Additive.ofMul x), by
        rw [SUnitGroup.fullLogLattice_eq_range]
        exact ⟨Additive.ofMul x, rfl⟩⟩
  map_one' := by
    apply Multiplicative.toAdd.injective
    apply Subtype.ext
    exact map_zero
      (SUnitGroup.fullLog (K := L) S)
  map_mul' x y := by
    apply Multiplicative.toAdd.injective
    apply Subtype.ext
    exact map_add
      (SUnitGroup.fullLog (K := L) S)
      (Additive.ofMul x) (Additive.ofMul y)
 
theorem sUnitFullLogMulHom_surjective
    (S : Finset (HeightOneSpectrum (𝓞 L))) :
    Function.Surjective
      (sUnitFullLogMulHom L S) := by
  intro z
  have hz :
      (Multiplicative.toAdd z :
          SUnitGroup.fullLogLattice (K := L) S).1 ∈
        LinearMap.range
          (SUnitGroup.fullLog (K := L) S).toIntLinearMap := by
    rw [← SUnitGroup.fullLogLattice_eq_range]
    exact
      (Multiplicative.toAdd z :
        SUnitGroup.fullLogLattice (K := L) S).2
  obtain ⟨x, hx⟩ := hz
  refine ⟨Additive.toMul x, ?_⟩
  apply Multiplicative.toAdd.injective
  apply Subtype.ext
  change
    SUnitGroup.fullLog (K := L) S x =
      (Multiplicative.toAdd z :
        SUnitGroup.fullLogLattice (K := L) S).1
  exact hx
 

theorem sUnitFullLogMulHom_ker
    (S : Finset (HeightOneSpectrum (𝓞 L))) :
    (sUnitFullLogMulHom L S).ker =
      CommGroup.torsion
        (SUnitGroup (K := L) S) := by
  ext x
  rw [MonoidHom.mem_ker]
  constructor
  · intro hx
    have hxlog :
        SUnitGroup.fullLog (K := L) S
            (Additive.ofMul x) = 0 := by
      have hx' :=
        congrArg
          (fun z :
              Multiplicative
                (SUnitGroup.fullLogLattice
                  (K := L) S) =>
            ((Multiplicative.toAdd z :
                SUnitGroup.fullLogLattice
                  (K := L) S) :
              SUnitGroup.LogHyperplane (K := L) S))
          hx
      exact hx'
    have hxt :=
      (SUnitGroup.fullLog_eq_zero_iff
        (K := L) S (Additive.ofMul x)).mp hxlog
    change IsOfFinOrder x
    exact isOfFinAddOrder_ofMul_iff.mp hxt
  · intro hxt
    apply Multiplicative.toAdd.injective
    apply Subtype.ext
    apply
      (SUnitGroup.fullLog_eq_zero_iff
        (K := L) S (Additive.ofMul x)).mpr
    change IsOfFinAddOrder (Additive.ofMul x)
    exact isOfFinAddOrder_ofMul_iff.mpr hxt
omit [NumberField K] in
 

theorem sUnitFullLogMulHom_equivariant
    {S : Finset (HeightOneSpectrum (𝓞 L))}
    (hS : IsGaloisStableFinitePlaces K L S) :
    letI _sUnitAction :=
      sUnitMulDistribMulAction K L S hS
    letI _latticeAction :=
      fullLogLatticeDistribMulAction K L S hS
    letI _multiplicativeLatticeAction :
        MulDistribMulAction (L ≃ₐ[K] L)
          (Multiplicative
            (SUnitGroup.fullLogLattice (K := L) S)) :=
      multiplicativeDistribMulAction
    ∀ (σ : L ≃ₐ[K] L)
      (x : SUnitGroup (K := L) S),
      sUnitFullLogMulHom L S (σ • x) =
        σ • sUnitFullLogMulHom L S x := by
  let sUnitAction :=
    sUnitMulDistribMulAction K L S hS
  let additiveSUnitAction :=
    additiveSUnitDistribMulAction K L S hS
  let logPlaceAction :=
    logPlaceMulAction K L S hS
  let fullLogSpaceAction :=
    fullLogSpaceDistribMulAction K L S hS
  let logHyperplaneAction :=
    logHyperplaneDistribMulAction K L S hS
  let latticeAction :=
    fullLogLatticeDistribMulAction K L S hS
  let multiplicativeLatticeAction :
      MulDistribMulAction (L ≃ₐ[K] L)
        (Multiplicative
          (SUnitGroup.fullLogLattice (K := L) S)) :=
    multiplicativeDistribMulAction
  intro σ x
  apply Multiplicative.toAdd.injective
  apply Subtype.ext
  exact fullLog_smul K L hS σ (Additive.ofMul x)
 

noncomputable def rootsOfUnityEquivSUnitTorsion
    (S : Finset (HeightOneSpectrum (𝓞 L))) :
    NumberField.Units.torsion L ≃*
      CommGroup.torsion
        (SUnitGroup (K := L) S) :=
  ((NumberField.Units.torsion L).equivMapOfInjective
      (SUnitGroup.fromNumberFieldUnits (K := L) S)
      (SUnitGroup.fromNumberFieldUnits_injective
        (K := L) S)).trans
    (MulEquiv.subgroupCongr
      (SUnitGroup.torsion_eq_rootsOfUnity_range
        (K := L) S).symm)
 
theorem sUnitTorsionFinite
    (S : Finset (HeightOneSpectrum (𝓞 L))) :
    Finite
      (CommGroup.torsion
        (SUnitGroup (K := L) S)) :=
  Finite.of_equiv
    (NumberField.Units.torsion L)
    (rootsOfUnityEquivSUnitTorsion L S).toEquiv
omit [NumberField K] in
 
theorem sUnitTorsion_stable
    {S : Finset (HeightOneSpectrum (𝓞 L))}
    (hS : IsGaloisStableFinitePlaces K L S) :
    letI _sUnitAction :=
      sUnitMulDistribMulAction K L S hS
    ∀ (σ : L ≃ₐ[K] L)
      (x : SUnitGroup (K := L) S),
      x ∈ CommGroup.torsion
          (SUnitGroup (K := L) S) →
        σ • x ∈ CommGroup.torsion
          (SUnitGroup (K := L) S) := by
  let sUnitAction :=
    sUnitMulDistribMulAction K L S hS
  intro σ x hx
  exact
    CommGroup.le_comap_torsion
      (MulDistribMulAction.toMonoidHom
        (SUnitGroup (K := L) S) σ) hx
 
theorem sUnitTorsion_fullLog_exact
    (S : Finset (HeightOneSpectrum (𝓞 L))) :
    ∀ x : SUnitGroup (K := L) S,
      sUnitFullLogMulHom L S x = 1 ↔
        ∃ t :
            CommGroup.torsion
              (SUnitGroup (K := L) S),
          (CommGroup.torsion
            (SUnitGroup (K := L) S)).subtype t = x := by
  intro x
  constructor
  · intro hx
    have hxt :
        x ∈ CommGroup.torsion
          (SUnitGroup (K := L) S) := by
      rw [← sUnitFullLogMulHom_ker L S]
      exact hx
    exact ⟨⟨x, hxt⟩, rfl⟩
  · rintro ⟨t, rfl⟩
    have ht :
        ((t :
            CommGroup.torsion
              (SUnitGroup (K := L) S)) :
          SUnitGroup (K := L) S) ∈
            (sUnitFullLogMulHom L S).ker := by
      rw [sUnitFullLogMulHom_ker L S]
      exact t.2
    exact ht
end LogarithmicQuotient
section DiagonalExtension
 

theorem mem_fullLogHyperplaneDiagonalLattice_iff
    (S : Finset (HeightOneSpectrum (𝓞 L)))
    (z :
      SUnitGroup.LogHyperplane (K := L) S × ℝ) :
    z ∈ fullLogHyperplaneDiagonalLattice L S ↔
      z.1 ∈ SUnitGroup.fullLogLattice (K := L) S ∧
        ∃ n : ℤ, (n : ℝ) = z.2 := by
  let b :=
    fullLogHyperplaneDiagonalBasis L S
  constructor
  · intro hz
    have hzrepr :
        ∀ i, b.repr z i ∈
          Set.range (algebraMap ℤ ℝ) :=
      (b.mem_span_iff_repr_mem ℤ _).mp hz
    have hzfirst :
        z.1 ∈
          SUnitGroup.fullLogLattice (K := L) S := by
      rw [←
        (Module.Free.chooseBasis ℤ
          (SUnitGroup.fullLogLattice
            (K := L) S)).ofZLatticeBasis_span ℝ]
      apply
        ((fullLogLatticeRealBasis L S).mem_span_iff_repr_mem
          ℤ _).mpr
      intro j
      simpa only [b, fullLogHyperplaneDiagonalBasis,
        Basis.prod_repr_inl] using hzrepr (Sum.inl j)
    have hzsecond :=
      hzrepr (Sum.inr ())
    simp only [b, fullLogHyperplaneDiagonalBasis,
      Basis.prod_repr_inr, Basis.singleton_repr] at hzsecond
    exact ⟨hzfirst, hzsecond⟩
  · rintro ⟨hzfirst, ⟨n, hn⟩⟩
    apply (b.mem_span_iff_repr_mem ℤ _).mpr
    intro i
    cases i with
    | inl j =>
        have hzspan :
            z.1 ∈
              Submodule.span ℤ
                (Set.range (fullLogLatticeRealBasis L S)) := by
          simpa only [fullLogLatticeRealBasis,
            (Module.Free.chooseBasis ℤ
              (SUnitGroup.fullLogLattice
                (K := L) S)).ofZLatticeBasis_span ℝ] using
            hzfirst
        have hzcoord :=
          ((fullLogLatticeRealBasis L S).mem_span_iff_repr_mem
            ℤ _).mp hzspan j
        simpa only [b, fullLogHyperplaneDiagonalBasis,
          Basis.prod_repr_inl] using hzcoord
    | inr j =>
        refine ⟨n, ?_⟩
        simpa [b, fullLogHyperplaneDiagonalBasis,
          Basis.prod_repr_inr, Basis.singleton_repr,
          RingHom.id_apply] using hn
 


noncomputable def fullLogLatticeProdIntToExtended
    (S : Finset (HeightOneSpectrum (𝓞 L))) :
    (SUnitGroup.fullLogLattice (K := L) S × ℤ) →ₗ[ℤ]
      extendedFullLogLattice L S := by
  let e :=
    fullLogSpaceEquivHyperplaneProd L S
  refine
    { toFun := fun z =>
        ⟨e.symm
            (((z.1 :
                SUnitGroup.fullLogLattice
                  (K := L) S) :
              SUnitGroup.LogHyperplane (K := L) S),
              (z.2 : ℝ)), ?_⟩
      map_add' := ?_
      map_smul' := ?_ }
  · change
      fullLogSpaceSplit L S
          (e.symm
            (((z.1 :
                SUnitGroup.fullLogLattice
                  (K := L) S) :
              SUnitGroup.LogHyperplane (K := L) S),
              (z.2 : ℝ))) ∈
        fullLogHyperplaneDiagonalLattice L S
    rw [show
      fullLogSpaceSplit L S
          (e.symm
            (((z.1 :
                SUnitGroup.fullLogLattice
                  (K := L) S) :
              SUnitGroup.LogHyperplane (K := L) S),
              (z.2 : ℝ))) =
        (((z.1 :
            SUnitGroup.fullLogLattice
              (K := L) S) :
          SUnitGroup.LogHyperplane (K := L) S),
          (z.2 : ℝ)) by
      exact e.apply_symm_apply _]
    exact
      (mem_fullLogHyperplaneDiagonalLattice_iff
        L S _).mpr ⟨z.1.2, ⟨z.2, rfl⟩⟩
  · intro x y
    apply Subtype.ext
    change
      e.symm
          (((((x + y).1 :
              SUnitGroup.fullLogLattice
                (K := L) S) :
            SUnitGroup.LogHyperplane (K := L) S)),
            (((x + y).2 : ℤ) : ℝ)) =
        e.symm
            ((((x.1 :
                SUnitGroup.fullLogLattice
                  (K := L) S) :
              SUnitGroup.LogHyperplane (K := L) S),
              (x.2 : ℝ))) +
          e.symm
            ((((y.1 :
                SUnitGroup.fullLogLattice
                  (K := L) S) :
              SUnitGroup.LogHyperplane (K := L) S),
              (y.2 : ℝ)))
    rw [← e.symm.map_add]
    congr 1
    ext <;> simp
  · intro n x
    apply Subtype.ext
    change
      e.symm
          (((((n • x).1 :
              SUnitGroup.fullLogLattice
                (K := L) S) :
            SUnitGroup.LogHyperplane (K := L) S)),
            ((((n • x).2 : ℤ) : ℝ))) =
        n •
          e.symm
            ((((x.1 :
                SUnitGroup.fullLogLattice
                  (K := L) S) :
              SUnitGroup.LogHyperplane (K := L) S),
              (x.2 : ℝ)))
    rw [← map_zsmul]
    congr 1
    ext <;> simp
 
theorem fullLogLatticeProdIntToExtended_bijective
    (S : Finset (HeightOneSpectrum (𝓞 L))) :
    Function.Bijective
      (fullLogLatticeProdIntToExtended L S) := by
  let e :=
    fullLogSpaceEquivHyperplaneProd L S
  constructor
  · intro x y hxy
    have hxy' :=
      congrArg
        (fun z : extendedFullLogLattice L S =>
          e (z :
            SUnitGroup.FullLogSpace (K := L) S))
        hxy
    have hpairs :
        (((x.1 :
              SUnitGroup.fullLogLattice
                (K := L) S) :
            SUnitGroup.LogHyperplane (K := L) S),
            (x.2 : ℝ)) =
          (((y.1 :
              SUnitGroup.fullLogLattice
                (K := L) S) :
            SUnitGroup.LogHyperplane (K := L) S),
            (y.2 : ℝ)) := by
      change
        e (e.symm
            (((x.1 :
                SUnitGroup.fullLogLattice
                  (K := L) S) :
              SUnitGroup.LogHyperplane (K := L) S),
              (x.2 : ℝ))) =
          e (e.symm
            (((y.1 :
                SUnitGroup.fullLogLattice
                  (K := L) S) :
              SUnitGroup.LogHyperplane (K := L) S),
              (y.2 : ℝ))) at hxy'
      simpa only [e, LinearEquiv.apply_symm_apply] using hxy'
    apply Prod.ext
    · apply Subtype.ext
      exact congrArg Prod.fst hpairs
    · have hs :
          (x.2 : ℝ) = (y.2 : ℝ) :=
        congrArg Prod.snd hpairs
      exact Int.cast_injective hs
  · intro y
    have hy :
        fullLogSpaceSplit L S
            (y :
              SUnitGroup.FullLogSpace (K := L) S) ∈
          fullLogHyperplaneDiagonalLattice L S :=
      y.2
    obtain ⟨hyfirst, n, hn⟩ :=
      (mem_fullLogHyperplaneDiagonalLattice_iff
        L S _).mp hy
    let x :
        SUnitGroup.fullLogLattice (K := L) S × ℤ :=
      (⟨(fullLogSpaceSplit L S
          (y :
            SUnitGroup.FullLogSpace (K := L) S)).1,
        hyfirst⟩, n)
    refine ⟨x, ?_⟩
    apply Subtype.ext
    apply e.injective
    change
      e (e.symm
          (((x.1 :
              SUnitGroup.fullLogLattice
                (K := L) S) :
            SUnitGroup.LogHyperplane (K := L) S),
            (x.2 : ℝ))) =
        e (y :
          SUnitGroup.FullLogSpace (K := L) S)
    rw [e.apply_symm_apply]
    change
      ((fullLogSpaceSplit L S
          (y :
            SUnitGroup.FullLogSpace (K := L) S)).1,
        (n : ℝ)) =
      fullLogSpaceSplit L S
        (y :
          SUnitGroup.FullLogSpace (K := L) S)
    exact Prod.ext rfl hn
 

noncomputable def extendedFullLogLatticeEquivProdInt
    (S : Finset (HeightOneSpectrum (𝓞 L))) :
    extendedFullLogLattice L S ≃ₗ[ℤ]
      (SUnitGroup.fullLogLattice (K := L) S × ℤ) :=
  (LinearEquiv.ofBijective
    (fullLogLatticeProdIntToExtended L S)
    (fullLogLatticeProdIntToExtended_bijective L S)).symm
 

noncomputable abbrev fullLogLatticeProdIntDistribMulAction
    (S : Finset (HeightOneSpectrum (𝓞 L)))
    (hS : IsGaloisStableFinitePlaces K L S) :
    DistribMulAction (L ≃ₐ[K] L)
      (SUnitGroup.fullLogLattice (K := L) S × ℤ) := by
  letI :=
    fullLogLatticeDistribMulAction K L S hS
  exact
    { smul := fun σ z => (σ • z.1, z.2)
      one_smul := by
        intro z
        apply Prod.ext
        · exact one_smul (L ≃ₐ[K] L) z.1
        · rfl
      mul_smul := by
        intro σ τ z
        apply Prod.ext
        · exact mul_smul σ τ z.1
        · rfl
      smul_zero := by
        intro σ
        apply Prod.ext
        · exact DistribMulAction.smul_zero σ
        · rfl
      smul_add := by
        intro σ z z'
        apply Prod.ext
        · exact DistribMulAction.smul_add σ z.1 z'.1
        · rfl }
omit [NumberField K] in
 

theorem fullLogLatticeProdIntToExtended_equivariant
    {S : Finset (HeightOneSpectrum (𝓞 L))}
    (hS : IsGaloisStableFinitePlaces K L S) :
    let ρ :=
      logPlacePermutationHom K L S hS
    letI _indexAction :
        MulAction (L ≃ₐ[K] L)
          (SUnitGroup.LogPlace (K := L) S) :=
      permutationMulAction ρ
    letI _extendedAction :
        DistribMulAction (L ≃ₐ[K] L)
          (extendedFullLogLattice L S) :=
      completePermutationLatticeDistribMulAction
        ρ (extendedFullLogLattice L S)
        (extendedFullLogLattice_permutation_stable
          K L hS)
    letI _productAction :
        DistribMulAction (L ≃ₐ[K] L)
          (SUnitGroup.fullLogLattice (K := L) S × ℤ) :=
      fullLogLatticeProdIntDistribMulAction K L S hS
    ∀ (σ : L ≃ₐ[K] L)
      (z :
        SUnitGroup.fullLogLattice (K := L) S × ℤ),
      fullLogLatticeProdIntToExtended L S
          (_productAction.toMulAction.toSemigroupAction.toSMul.smul
            σ z) =
        _extendedAction.toMulAction.toSemigroupAction.toSMul.smul
          σ (fullLogLatticeProdIntToExtended L S z) := by
  dsimp only
  let ρ :=
    logPlacePermutationHom K L S hS
  let indexAction :
      MulAction (L ≃ₐ[K] L)
        (SUnitGroup.LogPlace (K := L) S) :=
    permutationMulAction ρ
  let sUnitAction :=
    sUnitMulDistribMulAction K L S hS
  let additiveSUnitAction :=
    additiveSUnitDistribMulAction K L S hS
  let logPlaceAction :=
    logPlaceMulAction K L S hS
  let fullLogSpaceAction :=
    fullLogSpaceDistribMulAction K L S hS
  let logHyperplaneAction :=
    logHyperplaneDistribMulAction K L S hS
  let fullLogLatticeAction :=
    fullLogLatticeDistribMulAction K L S hS
  let extendedAction :
      DistribMulAction (L ≃ₐ[K] L)
        (extendedFullLogLattice L S) :=
    completePermutationLatticeDistribMulAction
      ρ (extendedFullLogLattice L S)
      (extendedFullLogLattice_permutation_stable
        K L hS)
  let productAction :
      DistribMulAction (L ≃ₐ[K] L)
        (SUnitGroup.fullLogLattice (K := L) S × ℤ) :=
    fullLogLatticeProdIntDistribMulAction K L S hS
  intro σ z
  apply Subtype.ext
  apply fullLogSpaceSplit_injective L S
  apply Prod.ext
  · change
      (fullLogSpaceSplit L S
        ((fullLogSpaceEquivHyperplaneProd L S).symm
          (((σ • z.1 :
                SUnitGroup.fullLogLattice
                  (K := L) S) :
              SUnitGroup.LogHyperplane (K := L) S),
              (z.2 : ℝ)))).1 =
        (fullLogSpaceSplit L S
          (permutationRepresentation ρ σ
            ((fullLogSpaceEquivHyperplaneProd L S).symm
              (((z.1 :
                  SUnitGroup.fullLogLattice
                    (K := L) S) :
                SUnitGroup.LogHyperplane (K := L) S),
                (z.2 : ℝ))))).1
    rw [permutationRepresentation_logPlace K L hS,
      fullLogSpaceSplit_fst_smul K L hS]
    rw [show
      fullLogSpaceSplit L S
          ((fullLogSpaceEquivHyperplaneProd L S).symm
            (((σ • z.1 :
                  SUnitGroup.fullLogLattice
                    (K := L) S) :
                SUnitGroup.LogHyperplane (K := L) S),
              (z.2 : ℝ))) =
        (((σ • z.1 :
              SUnitGroup.fullLogLattice
                (K := L) S) :
            SUnitGroup.LogHyperplane (K := L) S),
          (z.2 : ℝ)) by
      exact
        (fullLogSpaceEquivHyperplaneProd L S).apply_symm_apply _]
    rw [show
      fullLogSpaceSplit L S
          ((fullLogSpaceEquivHyperplaneProd L S).symm
            (((z.1 :
                  SUnitGroup.fullLogLattice
                    (K := L) S) :
                SUnitGroup.LogHyperplane (K := L) S),
              (z.2 : ℝ))) =
        (((z.1 :
              SUnitGroup.fullLogLattice
                (K := L) S) :
            SUnitGroup.LogHyperplane (K := L) S),
          (z.2 : ℝ)) by
      exact
        (fullLogSpaceEquivHyperplaneProd L S).apply_symm_apply _]
    change
      σ • (z.1 :
          SUnitGroup.LogHyperplane (K := L) S) =
        σ • (z.1 :
          SUnitGroup.LogHyperplane (K := L) S)
    rfl
  · change
      (fullLogSpaceSplit L S
        ((fullLogSpaceEquivHyperplaneProd L S).symm
          (((σ • z.1 :
                SUnitGroup.fullLogLattice
                  (K := L) S) :
              SUnitGroup.LogHyperplane (K := L) S),
              (z.2 : ℝ)))).2 =
        (fullLogSpaceSplit L S
          (permutationRepresentation ρ σ
            ((fullLogSpaceEquivHyperplaneProd L S).symm
              (((z.1 :
                  SUnitGroup.fullLogLattice
                    (K := L) S) :
                SUnitGroup.LogHyperplane (K := L) S),
                (z.2 : ℝ))))).2
    rw [permutationRepresentation_logPlace K L hS,
      fullLogSpaceSplit_snd_smul K L hS]
    rw [show
      fullLogSpaceSplit L S
          ((fullLogSpaceEquivHyperplaneProd L S).symm
            (((σ • z.1 :
                  SUnitGroup.fullLogLattice
                    (K := L) S) :
                SUnitGroup.LogHyperplane (K := L) S),
              (z.2 : ℝ))) =
        (((σ • z.1 :
              SUnitGroup.fullLogLattice
                (K := L) S) :
            SUnitGroup.LogHyperplane (K := L) S),
          (z.2 : ℝ)) by
      exact
        (fullLogSpaceEquivHyperplaneProd L S).apply_symm_apply _]
    rw [show
      fullLogSpaceSplit L S
          ((fullLogSpaceEquivHyperplaneProd L S).symm
            (((z.1 :
                  SUnitGroup.fullLogLattice
                    (K := L) S) :
                SUnitGroup.LogHyperplane (K := L) S),
              (z.2 : ℝ))) =
        (((z.1 :
              SUnitGroup.fullLogLattice
                (K := L) S) :
            SUnitGroup.LogHyperplane (K := L) S),
          (z.2 : ℝ)) by
      exact
        (fullLogSpaceEquivHyperplaneProd L S).apply_symm_apply _]
omit [NumberField K] in
 
theorem extendedFullLogLatticeEquivProdInt_equivariant
    {S : Finset (HeightOneSpectrum (𝓞 L))}
    (hS : IsGaloisStableFinitePlaces K L S) :
    let ρ :=
      logPlacePermutationHom K L S hS
    letI _indexAction :
        MulAction (L ≃ₐ[K] L)
          (SUnitGroup.LogPlace (K := L) S) :=
      permutationMulAction ρ
    letI _extendedAction :
        DistribMulAction (L ≃ₐ[K] L)
          (extendedFullLogLattice L S) :=
      completePermutationLatticeDistribMulAction
        ρ (extendedFullLogLattice L S)
        (extendedFullLogLattice_permutation_stable
          K L hS)
    letI _productAction :
        DistribMulAction (L ≃ₐ[K] L)
          (SUnitGroup.fullLogLattice (K := L) S × ℤ) :=
      fullLogLatticeProdIntDistribMulAction K L S hS
    ∀ (σ : L ≃ₐ[K] L)
      (x : extendedFullLogLattice L S),
      extendedFullLogLatticeEquivProdInt L S
          (_extendedAction.toMulAction.toSemigroupAction.toSMul.smul
            σ x) =
        _productAction.toMulAction.toSemigroupAction.toSMul.smul
          σ (extendedFullLogLatticeEquivProdInt L S x) := by
  dsimp only
  let ρ :=
    logPlacePermutationHom K L S hS
  let indexAction :
      MulAction (L ≃ₐ[K] L)
        (SUnitGroup.LogPlace (K := L) S) :=
    permutationMulAction ρ
  let sUnitAction :=
    sUnitMulDistribMulAction K L S hS
  let additiveSUnitAction :=
    additiveSUnitDistribMulAction K L S hS
  let logPlaceAction :=
    logPlaceMulAction K L S hS
  let fullLogSpaceAction :=
    fullLogSpaceDistribMulAction K L S hS
  let logHyperplaneAction :=
    logHyperplaneDistribMulAction K L S hS
  let fullLogLatticeAction :=
    fullLogLatticeDistribMulAction K L S hS
  let extendedAction :
      DistribMulAction (L ≃ₐ[K] L)
        (extendedFullLogLattice L S) :=
    completePermutationLatticeDistribMulAction
      ρ (extendedFullLogLattice L S)
      (extendedFullLogLattice_permutation_stable
        K L hS)
  let productAction :
      DistribMulAction (L ≃ₐ[K] L)
        (SUnitGroup.fullLogLattice (K := L) S × ℤ) :=
    fullLogLatticeProdIntDistribMulAction K L S hS
  intro σ x
  let e :=
    extendedFullLogLatticeEquivProdInt L S
  apply e.symm.injective
  have hmap :=
    fullLogLatticeProdIntToExtended_equivariant
      K L hS σ (e x)
  change
    e.symm
        (productAction.toMulAction.toSemigroupAction.toSMul.smul
          σ (e x)) =
      extendedAction.toMulAction.toSemigroupAction.toSMul.smul
        σ (e.symm (e x)) at hmap
  rw [e.symm_apply_apply, hmap,
    e.symm_apply_apply]
end DiagonalExtension
section LogLatticeHerbrand
 

def fullLogLatticeProdIntIncl
    (S : Finset (HeightOneSpectrum (𝓞 L))) :
    Multiplicative
        (SUnitGroup.fullLogLattice (K := L) S) →*
      Multiplicative
        (SUnitGroup.fullLogLattice (K := L) S × ℤ) where
  toFun z :=
    Multiplicative.ofAdd
      (Multiplicative.toAdd z, 0)
  map_one' := rfl
  map_mul' _ _ := rfl
 

def fullLogLatticeProdIntProj
    (S : Finset (HeightOneSpectrum (𝓞 L))) :
    Multiplicative
        (SUnitGroup.fullLogLattice (K := L) S × ℤ) →*
      Multiplicative ℤ where
  toFun z :=
    Multiplicative.ofAdd
      (Multiplicative.toAdd z).2
  map_one' := rfl
  map_mul' _ _ := rfl
 

noncomputable def extendedFullLogLatticeMulEquivProdInt
    (S : Finset (HeightOneSpectrum (𝓞 L))) :
    Multiplicative (extendedFullLogLattice L S) ≃*
      Multiplicative
        (SUnitGroup.fullLogLattice (K := L) S × ℤ) :=
  (extendedFullLogLatticeEquivProdInt L S).toAddEquiv.toMultiplicative
omit [NumberField K] in
 

theorem extendedFullLogLatticeMulEquivProdInt_equivariant
    {S : Finset (HeightOneSpectrum (𝓞 L))}
    (hS : IsGaloisStableFinitePlaces K L S) :
    let ρ :=
      logPlacePermutationHom K L S hS
    letI _indexAction :
        MulAction (L ≃ₐ[K] L)
          (SUnitGroup.LogPlace (K := L) S) :=
      permutationMulAction ρ
    letI _extendedAction :
        DistribMulAction (L ≃ₐ[K] L)
          (extendedFullLogLattice L S) :=
      completePermutationLatticeDistribMulAction
        ρ (extendedFullLogLattice L S)
        (extendedFullLogLattice_permutation_stable
          K L hS)
    letI _extendedMultiplicativeAction :
        MulDistribMulAction (L ≃ₐ[K] L)
          (Multiplicative
            (extendedFullLogLattice L S)) :=
      multiplicativeDistribMulAction
    letI _productAction :
        DistribMulAction (L ≃ₐ[K] L)
          (SUnitGroup.fullLogLattice (K := L) S × ℤ) :=
      fullLogLatticeProdIntDistribMulAction K L S hS
    letI _productMultiplicativeAction :
        MulDistribMulAction (L ≃ₐ[K] L)
          (Multiplicative
            (SUnitGroup.fullLogLattice (K := L) S × ℤ)) :=
      multiplicativeDistribMulAction
    ∀ (σ : L ≃ₐ[K] L)
      (x : Multiplicative (extendedFullLogLattice L S)),
      extendedFullLogLatticeMulEquivProdInt L S
          (_extendedMultiplicativeAction.toMulAction.toSemigroupAction.toSMul.smul
            σ x) =
        _productMultiplicativeAction.toMulAction.toSemigroupAction.toSMul.smul
          σ (extendedFullLogLatticeMulEquivProdInt L S x) := by
  dsimp only
  let ρ :=
    logPlacePermutationHom K L S hS
  let indexAction :
      MulAction (L ≃ₐ[K] L)
        (SUnitGroup.LogPlace (K := L) S) :=
    permutationMulAction ρ
  let sUnitAction :=
    sUnitMulDistribMulAction K L S hS
  let additiveSUnitAction :=
    additiveSUnitDistribMulAction K L S hS
  let logPlaceAction :=
    logPlaceMulAction K L S hS
  let fullLogSpaceAction :=
    fullLogSpaceDistribMulAction K L S hS
  let logHyperplaneAction :=
    logHyperplaneDistribMulAction K L S hS
  let fullLogLatticeAction :=
    fullLogLatticeDistribMulAction K L S hS
  let extendedAction :
      DistribMulAction (L ≃ₐ[K] L)
        (extendedFullLogLattice L S) :=
    completePermutationLatticeDistribMulAction
      ρ (extendedFullLogLattice L S)
      (extendedFullLogLattice_permutation_stable
        K L hS)
  let extendedMultiplicativeAction :
      MulDistribMulAction (L ≃ₐ[K] L)
        (Multiplicative
          (extendedFullLogLattice L S)) :=
    multiplicativeDistribMulAction
  let productAction :
      DistribMulAction (L ≃ₐ[K] L)
        (SUnitGroup.fullLogLattice (K := L) S × ℤ) :=
    fullLogLatticeProdIntDistribMulAction K L S hS
  let productMultiplicativeAction :
      MulDistribMulAction (L ≃ₐ[K] L)
        (Multiplicative
          (SUnitGroup.fullLogLattice (K := L) S × ℤ)) :=
    multiplicativeDistribMulAction
  intro σ x
  apply Multiplicative.toAdd.injective
  change
    extendedFullLogLatticeEquivProdInt L S
        (extendedAction.toMulAction.toSemigroupAction.toSMul.smul
          σ (Multiplicative.toAdd x)) =
      productAction.toMulAction.toSemigroupAction.toSMul.smul
        σ
        (extendedFullLogLatticeEquivProdInt L S
          (Multiplicative.toAdd x))
  exact
    extendedFullLogLatticeEquivProdInt_equivariant
      K L hS σ (Multiplicative.toAdd x)
omit [NumberField K] in
 
theorem fullLogLatticeProdIntIncl_equivariant
    {S : Finset (HeightOneSpectrum (𝓞 L))}
    (hS : IsGaloisStableFinitePlaces K L S) :
    letI _latticeAction :
        DistribMulAction (L ≃ₐ[K] L)
          (SUnitGroup.fullLogLattice (K := L) S) :=
      fullLogLatticeDistribMulAction K L S hS
    letI _latticeMultiplicativeAction :
        MulDistribMulAction (L ≃ₐ[K] L)
          (Multiplicative
            (SUnitGroup.fullLogLattice (K := L) S)) :=
      multiplicativeDistribMulAction
    letI _productAction :
        DistribMulAction (L ≃ₐ[K] L)
          (SUnitGroup.fullLogLattice (K := L) S × ℤ) :=
      fullLogLatticeProdIntDistribMulAction K L S hS
    letI _productMultiplicativeAction :
        MulDistribMulAction (L ≃ₐ[K] L)
          (Multiplicative
            (SUnitGroup.fullLogLattice (K := L) S × ℤ)) :=
      multiplicativeDistribMulAction
    ∀ (σ : L ≃ₐ[K] L)
      (z :
        Multiplicative
          (SUnitGroup.fullLogLattice (K := L) S)),
      fullLogLatticeProdIntIncl L S (σ • z) =
        σ • fullLogLatticeProdIntIncl L S z := by
  let latticeAction :=
    fullLogLatticeDistribMulAction K L S hS
  let latticeMultiplicativeAction :
      MulDistribMulAction (L ≃ₐ[K] L)
        (Multiplicative
          (SUnitGroup.fullLogLattice (K := L) S)) :=
    multiplicativeDistribMulAction
  let productAction :
      DistribMulAction (L ≃ₐ[K] L)
        (SUnitGroup.fullLogLattice (K := L) S × ℤ) :=
    fullLogLatticeProdIntDistribMulAction K L S hS
  let productMultiplicativeAction :
      MulDistribMulAction (L ≃ₐ[K] L)
        (Multiplicative
          (SUnitGroup.fullLogLattice (K := L) S × ℤ)) :=
    multiplicativeDistribMulAction
  intro σ z
  rfl
omit [NumberField K] in
 

theorem fullLogLatticeProdIntProj_equivariant
    {S : Finset (HeightOneSpectrum (𝓞 L))}
    (hS : IsGaloisStableFinitePlaces K L S) :
    letI _latticeAction :
        DistribMulAction (L ≃ₐ[K] L)
          (SUnitGroup.fullLogLattice (K := L) S) :=
      fullLogLatticeDistribMulAction K L S hS
    letI _productAction :
        DistribMulAction (L ≃ₐ[K] L)
          (SUnitGroup.fullLogLattice (K := L) S × ℤ) :=
      fullLogLatticeProdIntDistribMulAction K L S hS
    letI _productMultiplicativeAction :
        MulDistribMulAction (L ≃ₐ[K] L)
          (Multiplicative
            (SUnitGroup.fullLogLattice (K := L) S × ℤ)) :=
      multiplicativeDistribMulAction
    letI _integerAction :
        MulDistribMulAction (L ≃ₐ[K] L)
          (Multiplicative ℤ) :=
      trivialIntMulDistribMulAction (L ≃ₐ[K] L)
    ∀ (σ : L ≃ₐ[K] L)
      (z :
        Multiplicative
          (SUnitGroup.fullLogLattice (K := L) S × ℤ)),
      fullLogLatticeProdIntProj L S (σ • z) =
        σ • fullLogLatticeProdIntProj L S z := by
  let latticeAction :=
    fullLogLatticeDistribMulAction K L S hS
  let productAction :
      DistribMulAction (L ≃ₐ[K] L)
        (SUnitGroup.fullLogLattice (K := L) S × ℤ) :=
    fullLogLatticeProdIntDistribMulAction K L S hS
  let productMultiplicativeAction :
      MulDistribMulAction (L ≃ₐ[K] L)
        (Multiplicative
          (SUnitGroup.fullLogLattice (K := L) S × ℤ)) :=
    multiplicativeDistribMulAction
  let integerAction :
      MulDistribMulAction (L ≃ₐ[K] L)
        (Multiplicative ℤ) :=
    trivialIntMulDistribMulAction (L ≃ₐ[K] L)
  intro σ z
  rfl
 

theorem fullLogLatticeProdInt_exact
    (S : Finset (HeightOneSpectrum (𝓞 L))) :
    ∀ z :
        Multiplicative
          (SUnitGroup.fullLogLattice (K := L) S × ℤ),
      fullLogLatticeProdIntProj L S z = 1 ↔
        ∃ x :
            Multiplicative
              (SUnitGroup.fullLogLattice (K := L) S),
          fullLogLatticeProdIntIncl L S x = z := by
  intro z
  constructor
  · intro hz
    refine
      ⟨Multiplicative.ofAdd
          (Multiplicative.toAdd z).1, ?_⟩
    apply Multiplicative.toAdd.injective
    apply Prod.ext
    · rfl
    · exact (congrArg Multiplicative.toAdd hz).symm
  · rintro ⟨x, rfl⟩
    rfl
 
theorem fullLogLatticeProdIntIncl_injective
    (S : Finset (HeightOneSpectrum (𝓞 L))) :
    Function.Injective
      (fullLogLatticeProdIntIncl L S) := by
  intro x y hxy
  apply Multiplicative.toAdd.injective
  exact
    congrArg
      (fun z :
          Multiplicative
            (SUnitGroup.fullLogLattice (K := L) S × ℤ) =>
        (Multiplicative.toAdd z).1) hxy
 
theorem fullLogLatticeProdIntProj_surjective
    (S : Finset (HeightOneSpectrum (𝓞 L))) :
    Function.Surjective
      (fullLogLatticeProdIntProj L S) := by
  intro z
  exact
    ⟨Multiplicative.ofAdd
        (0, Multiplicative.toAdd z), rfl⟩
 

theorem fullLogLattice_herbrandQuotient_eq_stabilizerProduct_div_card
    (K L : Type)
    [Field K] [NumberField K]
    [Field L] [NumberField L] [Algebra K L]
    {S : Finset (HeightOneSpectrum (𝓞 L))}
    (hS : IsGaloisStableFinitePlaces K L S)
    (σ : L ≃ₐ[K] L)
    (hgen : ∀ τ : L ≃ₐ[K] L,
      τ ∈ Subgroup.zpowers σ) :
    let ρ :=
      logPlacePermutationHom K L S hS
    letI _indexAction :
        MulAction (L ≃ₐ[K] L)
          (SUnitGroup.LogPlace (K := L) S) :=
      permutationMulAction ρ
    letI _latticeAction :
        DistribMulAction (L ≃ₐ[K] L)
          (SUnitGroup.fullLogLattice (K := L) S) :=
      fullLogLatticeDistribMulAction K L S hS
    letI _latticeMultiplicativeAction :
        MulDistribMulAction (L ≃ₐ[K] L)
          (Multiplicative
            (SUnitGroup.fullLogLattice (K := L) S)) :=
      multiplicativeDistribMulAction
    letI _orbitFintype :
        Fintype
          (MulAction.orbitRel.Quotient
            (L ≃ₐ[K] L)
            (SUnitGroup.LogPlace (K := L) S)) :=
      Fintype.ofFinite _
    letI _stabilizerFintype :
        ∀ ω :
            MulAction.orbitRel.Quotient
              (L ≃ₐ[K] L)
              (SUnitGroup.LogPlace (K := L) S),
          Fintype (permutationOrbitStabilizer ω) :=
      fun _ => Fintype.ofFinite _
    ∃ h :
        HerbrandQuotientDefined
          (L ≃ₐ[K] L)
          (Multiplicative
            (SUnitGroup.fullLogLattice (K := L) S)) σ,
      @herbrandQuotient
          (L ≃ₐ[K] L)
          (Multiplicative
            (SUnitGroup.fullLogLattice (K := L) S))
          _ _ _ _ σ h.1 h.2 =
        (∏ ω :
            MulAction.orbitRel.Quotient
              (L ≃ₐ[K] L)
              (SUnitGroup.LogPlace (K := L) S),
          (Fintype.card
            (permutationOrbitStabilizer ω) : ℚ)) /
          (Fintype.card (L ≃ₐ[K] L) : ℚ) := by
  dsimp only
  let ρ :=
    logPlacePermutationHom K L S hS
  let indexAction :
      MulAction (L ≃ₐ[K] L)
        (SUnitGroup.LogPlace (K := L) S) :=
    permutationMulAction ρ
  let latticeAction :
      DistribMulAction (L ≃ₐ[K] L)
        (SUnitGroup.fullLogLattice (K := L) S) :=
    fullLogLatticeDistribMulAction K L S hS
  let latticeMultiplicativeAction :
      MulDistribMulAction (L ≃ₐ[K] L)
        (Multiplicative
          (SUnitGroup.fullLogLattice (K := L) S)) :=
    multiplicativeDistribMulAction
  let productAction :
      DistribMulAction (L ≃ₐ[K] L)
        (SUnitGroup.fullLogLattice (K := L) S × ℤ) :=
    fullLogLatticeProdIntDistribMulAction K L S hS
  let productMultiplicativeAction :
      MulDistribMulAction (L ≃ₐ[K] L)
        (Multiplicative
          (SUnitGroup.fullLogLattice (K := L) S × ℤ)) :=
    multiplicativeDistribMulAction
  let integerAction :
      MulDistribMulAction (L ≃ₐ[K] L)
        (Multiplicative ℤ) :=
    trivialIntMulDistribMulAction (L ≃ₐ[K] L)
  let extendedAction :
      DistribMulAction (L ≃ₐ[K] L)
        (extendedFullLogLattice L S) :=
    completePermutationLatticeDistribMulAction
      ρ (extendedFullLogLattice L S)
      (extendedFullLogLattice_permutation_stable
        K L hS)
  let extendedMultiplicativeAction :
      MulDistribMulAction (L ≃ₐ[K] L)
        (Multiplicative
          (extendedFullLogLattice L S)) :=
    multiplicativeDistribMulAction
  let orbitFintype :
      Fintype
        (MulAction.orbitRel.Quotient
          (L ≃ₐ[K] L)
          (SUnitGroup.LogPlace (K := L) S)) :=
    Fintype.ofFinite _
  let stabilizerFintype :
      ∀ ω :
          MulAction.orbitRel.Quotient
            (L ≃ₐ[K] L)
            (SUnitGroup.LogPlace (K := L) S),
        Fintype (permutationOrbitStabilizer ω) :=
    fun _ => Fintype.ofFinite _
  obtain ⟨hExtended, hExtendedValue⟩ :=
    extendedFullLogLattice_herbrandQuotient_eq_stabilizerProduct
      K L hS σ hgen
  let extendedH0Finite :
      Finite
        (HerbrandH0
          (L ≃ₐ[K] L)
          (Multiplicative
            (extendedFullLogLattice L S))) :=
    hExtended.1
  let extendedHMinusOneFinite :
      Finite
        (HerbrandHMinusOne
          (L ≃ₐ[K] L)
          (Multiplicative
            (extendedFullLogLattice L S)) σ) :=
    hExtended.2
  let e :=
    extendedFullLogLatticeMulEquivProdInt L S
  have he :
      ∀ (τ : L ≃ₐ[K] L)
        (x : Multiplicative (extendedFullLogLattice L S)),
        e (τ • x) = τ • e x :=
    extendedFullLogLatticeMulEquivProdInt_equivariant
      K L hS
  let hProduct :
      HerbrandQuotientDefined
        (L ≃ₐ[K] L)
        (Multiplicative
          (SUnitGroup.fullLogLattice (K := L) S × ℤ)) σ :=
    ⟨herbrandH0Finite_of_equivariantMulEquiv e he,
      herbrandHMinusOneFinite_of_equivariantMulEquiv
        e he σ⟩
  let productH0Finite :
      Finite
        (HerbrandH0
          (L ≃ₐ[K] L)
          (Multiplicative
            (SUnitGroup.fullLogLattice (K := L) S × ℤ))) :=
    hProduct.1
  let productHMinusOneFinite :
      Finite
        (HerbrandHMinusOne
          (L ≃ₐ[K] L)
          (Multiplicative
            (SUnitGroup.fullLogLattice (K := L) S × ℤ)) σ) :=
    hProduct.2
  let hInteger :
      HerbrandQuotientDefined
        (L ≃ₐ[K] L) (Multiplicative ℤ) σ :=
    ⟨trivialIntHerbrandH0Finite,
      trivialIntHerbrandHMinusOneFinite σ⟩
  let integerH0Finite :
      Finite
        (HerbrandH0
          (L ≃ₐ[K] L) (Multiplicative ℤ)) :=
    hInteger.1
  let integerHMinusOneFinite :
      Finite
        (HerbrandHMinusOne
          (L ≃ₐ[K] L) (Multiplicative ℤ) σ) :=
    hInteger.2
  let hLattice :=
    herbrandQuotientDefined_left_of_middle_right
      (fullLogLatticeProdIntIncl L S)
      (fullLogLatticeProdIntProj L S)
      (fullLogLatticeProdIntIncl_equivariant K L hS)
      (fullLogLatticeProdIntProj_equivariant K L hS)
      (fullLogLatticeProdInt_exact L S)
      (fullLogLatticeProdIntIncl_injective L S)
      (fullLogLatticeProdIntProj_surjective L S)
      σ hgen hProduct hInteger
  let latticeH0Finite :
      Finite
        (HerbrandH0
          (L ≃ₐ[K] L)
          (Multiplicative
            (SUnitGroup.fullLogLattice (K := L) S))) :=
    hLattice.1
  let latticeHMinusOneFinite :
      Finite
        (HerbrandHMinusOne
          (L ≃ₐ[K] L)
          (Multiplicative
            (SUnitGroup.fullLogLattice (K := L) S)) σ) :=
    hLattice.2
  have hMultiplicative :
      herbrandQuotient
          (G := L ≃ₐ[K] L)
          (A := Multiplicative
            (SUnitGroup.fullLogLattice (K := L) S × ℤ)) σ =
        herbrandQuotient
            (G := L ≃ₐ[K] L)
            (A := Multiplicative
              (SUnitGroup.fullLogLattice (K := L) S)) σ *
          herbrandQuotient
            (G := L ≃ₐ[K] L)
            (A := Multiplicative ℤ) σ :=
    herbrandQuotient_multiplicative_of_shortExact
      (fullLogLatticeProdIntIncl L S)
      (fullLogLatticeProdIntProj L S)
      (fullLogLatticeProdIntIncl_equivariant K L hS)
      (fullLogLatticeProdIntProj_equivariant K L hS)
      (fullLogLatticeProdInt_exact L S)
      (fullLogLatticeProdIntIncl_injective L S)
      (fullLogLatticeProdIntProj_surjective L S)
      σ hgen
  have hIntegerValue :
      herbrandQuotient
          (G := L ≃ₐ[K] L)
          (A := Multiplicative ℤ) σ =
        (Fintype.card (L ≃ₐ[K] L) : ℚ) :=
    trivialInt_herbrandQuotient_eq_card σ
  have hExtendedProduct :
      herbrandQuotient
          (G := L ≃ₐ[K] L)
          (A := Multiplicative
            (extendedFullLogLattice L S)) σ =
        herbrandQuotient
          (G := L ≃ₐ[K] L)
          (A := Multiplicative
            (SUnitGroup.fullLogLattice (K := L) S × ℤ)) σ := by
    exact
      herbrandQuotient_eq_of_equivariantMulEquiv
        e he σ
  refine ⟨hLattice, ?_⟩
  have hcard :
      (Fintype.card (L ≃ₐ[K] L) : ℚ) ≠ 0 := by
    exact_mod_cast
      (Fintype.card_ne_zero :
        Fintype.card (L ≃ₐ[K] L) ≠ 0)
  rw [eq_div_iff hcard]
  calc
    @herbrandQuotient
          (L ≃ₐ[K] L)
          (Multiplicative
            (SUnitGroup.fullLogLattice (K := L) S))
          _ _ _ _ σ hLattice.1 hLattice.2 *
        (Fintype.card (L ≃ₐ[K] L) : ℚ) =
        @herbrandQuotient
          (L ≃ₐ[K] L)
          (Multiplicative
            (SUnitGroup.fullLogLattice (K := L) S × ℤ))
          _ _ _ _ σ hProduct.1 hProduct.2 := by
      rw [← hIntegerValue]
      exact hMultiplicative.symm
    _ =
        @herbrandQuotient
          (L ≃ₐ[K] L)
          (Multiplicative
            (extendedFullLogLattice L S))
          _ _ _ _ σ hExtended.1 hExtended.2 :=
      hExtendedProduct.symm
    _ =
        ∏ ω :
            MulAction.orbitRel.Quotient
              (L ≃ₐ[K] L)
              (SUnitGroup.LogPlace (K := L) S),
          (Fintype.card
            (permutationOrbitStabilizer ω) : ℚ) :=
      hExtendedValue
end LogLatticeHerbrand
section ActualSUnitHerbrand
 


theorem sUnit_herbrandQuotient_eq_stabilizerProduct_div_card
    (K L : Type)
    [Field K] [NumberField K]
    [Field L] [NumberField L] [Algebra K L]
    {S : Finset (HeightOneSpectrum (𝓞 L))}
    (hS : IsGaloisStableFinitePlaces K L S)
    (σ : L ≃ₐ[K] L)
    (hgen : ∀ τ : L ≃ₐ[K] L,
      τ ∈ Subgroup.zpowers σ) :
    let ρ :=
      logPlacePermutationHom K L S hS
    letI _indexAction :
        MulAction (L ≃ₐ[K] L)
          (SUnitGroup.LogPlace (K := L) S) :=
      permutationMulAction ρ
    letI _sUnitAction :
        MulDistribMulAction (L ≃ₐ[K] L)
          (SUnitGroup (K := L) S) :=
      sUnitMulDistribMulAction K L S hS
    letI _orbitFintype :
        Fintype
          (MulAction.orbitRel.Quotient
            (L ≃ₐ[K] L)
            (SUnitGroup.LogPlace (K := L) S)) :=
      Fintype.ofFinite _
    letI _stabilizerFintype :
        ∀ ω :
            MulAction.orbitRel.Quotient
              (L ≃ₐ[K] L)
              (SUnitGroup.LogPlace (K := L) S),
          Fintype (permutationOrbitStabilizer ω) :=
      fun _ => Fintype.ofFinite _
    ∃ h :
        HerbrandQuotientDefined
          (L ≃ₐ[K] L)
          (SUnitGroup (K := L) S) σ,
      @herbrandQuotient
          (L ≃ₐ[K] L)
          (SUnitGroup (K := L) S)
          _ _ _ _ σ h.1 h.2 =
        (∏ ω :
            MulAction.orbitRel.Quotient
              (L ≃ₐ[K] L)
              (SUnitGroup.LogPlace (K := L) S),
          (Fintype.card
            (permutationOrbitStabilizer ω) : ℚ)) /
          (Fintype.card (L ≃ₐ[K] L) : ℚ) := by
  dsimp only
  let ρ :=
    logPlacePermutationHom K L S hS
  let indexAction :
      MulAction (L ≃ₐ[K] L)
        (SUnitGroup.LogPlace (K := L) S) :=
    permutationMulAction ρ
  let sUnitAction :
      MulDistribMulAction (L ≃ₐ[K] L)
        (SUnitGroup (K := L) S) :=
    sUnitMulDistribMulAction K L S hS
  let latticeAction :
      DistribMulAction (L ≃ₐ[K] L)
        (SUnitGroup.fullLogLattice (K := L) S) :=
    fullLogLatticeDistribMulAction K L S hS
  let latticeMultiplicativeAction :
      MulDistribMulAction (L ≃ₐ[K] L)
        (Multiplicative
          (SUnitGroup.fullLogLattice (K := L) S)) :=
    multiplicativeDistribMulAction
  let orbitFintype :
      Fintype
        (MulAction.orbitRel.Quotient
          (L ≃ₐ[K] L)
          (SUnitGroup.LogPlace (K := L) S)) :=
    Fintype.ofFinite _
  let stabilizerFintype :
      ∀ ω :
          MulAction.orbitRel.Quotient
            (L ≃ₐ[K] L)
            (SUnitGroup.LogPlace (K := L) S),
        Fintype (permutationOrbitStabilizer ω) :=
    fun _ => Fintype.ofFinite _
  let torsionAction :
      MulDistribMulAction (L ≃ₐ[K] L)
        (CommGroup.torsion
          (SUnitGroup (K := L) S)) :=
    stableSubgroupMulDistribMulAction
      (CommGroup.torsion
        (SUnitGroup (K := L) S))
      (sUnitTorsion_stable K L hS)
  let torsionFinite :
      Finite
        (CommGroup.torsion
          (SUnitGroup (K := L) S)) :=
    sUnitTorsionFinite L S
  obtain ⟨hLattice, hLatticeValue⟩ :=
    fullLogLattice_herbrandQuotient_eq_stabilizerProduct_div_card
      K L hS σ hgen
  let latticeH0Finite :
      Finite
        (HerbrandH0
          (L ≃ₐ[K] L)
          (Multiplicative
            (SUnitGroup.fullLogLattice (K := L) S))) :=
    hLattice.1
  let latticeHMinusOneFinite :
      Finite
        (HerbrandHMinusOne
          (L ≃ₐ[K] L)
          (Multiplicative
            (SUnitGroup.fullLogLattice (K := L) S)) σ) :=
    hLattice.2
  let hTorsion :
      HerbrandQuotientDefined
        (L ≃ₐ[K] L)
        (CommGroup.torsion
          (SUnitGroup (K := L) S)) σ :=
    ⟨inferInstance, inferInstance⟩
  let torsionH0Finite :
      Finite
        (HerbrandH0
          (L ≃ₐ[K] L)
          (CommGroup.torsion
            (SUnitGroup (K := L) S))) :=
    hTorsion.1
  let torsionHMinusOneFinite :
      Finite
        (HerbrandHMinusOne
          (L ≃ₐ[K] L)
          (CommGroup.torsion
            (SUnitGroup (K := L) S)) σ) :=
    hTorsion.2
  let hSUnit :=
    herbrandQuotientDefined_middle_of_left_right
      (CommGroup.torsion
        (SUnitGroup (K := L) S)).subtype
      (sUnitFullLogMulHom L S)
      (stableSubgroup_subtype_equivariant
        (CommGroup.torsion
          (SUnitGroup (K := L) S))
        (sUnitTorsion_stable K L hS))
      (sUnitFullLogMulHom_equivariant K L hS)
      (sUnitTorsion_fullLog_exact L S)
      (CommGroup.torsion
        (SUnitGroup (K := L) S)).subtype_injective
      (sUnitFullLogMulHom_surjective L S)
      σ hgen hTorsion hLattice
  let sUnitH0Finite :
      Finite
        (HerbrandH0
          (L ≃ₐ[K] L)
          (SUnitGroup (K := L) S)) :=
    hSUnit.1
  let sUnitHMinusOneFinite :
      Finite
        (HerbrandHMinusOne
          (L ≃ₐ[K] L)
          (SUnitGroup (K := L) S) σ) :=
    hSUnit.2
  have hMultiplicative :
      herbrandQuotient
          (G := L ≃ₐ[K] L)
          (A := SUnitGroup (K := L) S) σ =
        herbrandQuotient
            (G := L ≃ₐ[K] L)
            (A := CommGroup.torsion
              (SUnitGroup (K := L) S)) σ *
          herbrandQuotient
            (G := L ≃ₐ[K] L)
            (A := Multiplicative
              (SUnitGroup.fullLogLattice (K := L) S)) σ :=
    herbrandQuotient_multiplicative_of_shortExact
      (CommGroup.torsion
        (SUnitGroup (K := L) S)).subtype
      (sUnitFullLogMulHom L S)
      (stableSubgroup_subtype_equivariant
        (CommGroup.torsion
          (SUnitGroup (K := L) S))
        (sUnitTorsion_stable K L hS))
      (sUnitFullLogMulHom_equivariant K L hS)
      (sUnitTorsion_fullLog_exact L S)
      (CommGroup.torsion
        (SUnitGroup (K := L) S)).subtype_injective
      (sUnitFullLogMulHom_surjective L S)
      σ hgen
  have hTorsionValue :
      herbrandQuotient
          (G := L ≃ₐ[K] L)
          (A := CommGroup.torsion
            (SUnitGroup (K := L) S)) σ = 1 :=
    herbrandQuotient_eq_one_of_finite_module
      σ hgen
  refine ⟨hSUnit, ?_⟩
  calc
    @herbrandQuotient
          (L ≃ₐ[K] L)
          (SUnitGroup (K := L) S)
          _ _ _ _ σ hSUnit.1 hSUnit.2 =
        @herbrandQuotient
            (L ≃ₐ[K] L)
            (CommGroup.torsion
              (SUnitGroup (K := L) S))
            _ _ _ _ σ hTorsion.1 hTorsion.2 *
          @herbrandQuotient
            (L ≃ₐ[K] L)
            (Multiplicative
              (SUnitGroup.fullLogLattice (K := L) S))
            _ _ _ _ σ hLattice.1 hLattice.2 :=
      hMultiplicative
    _ =
        @herbrandQuotient
          (L ≃ₐ[K] L)
          (Multiplicative
            (SUnitGroup.fullLogLattice (K := L) S))
          _ _ _ _ σ hLattice.1 hLattice.2 := by
      rw [hTorsionValue, one_mul]
    _ =
        (∏ ω :
            MulAction.orbitRel.Quotient
              (L ≃ₐ[K] L)
              (SUnitGroup.LogPlace (K := L) S),
          (Fintype.card
            (permutationOrbitStabilizer ω) : ℚ)) /
          (Fintype.card (L ≃ₐ[K] L) : ℚ) :=
      hLatticeValue
end ActualSUnitHerbrand
section LocalDegreeInterpretation
end LocalDegreeInterpretation
end
end

namespace TunnellSUnitHerbrand
open NumberField IsDedekindDomain CyclicCohomology
open CyclicCohomology.ProfiniteCohomology.Herbrand
open scoped Classical NumberField
noncomputable section

theorem result : OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1.H1 := by
  intro K L _ _ _ _ _ _ _
  dsimp only
  intro S σ gen hS
  let G := Gal(L/K)
  let U := SUnitGroup (K := L) S
  let P := SUnitGroup.LogPlace (K := L) S
  letI act : MulAction G P := permutationMulAction (logPlacePermutationHom K L S hS)
  letI : MulDistribMulAction G U := sUnitMulDistribMulAction K L S hS
  letI : Fintype (MulAction.orbitRel.Quotient G P) := Fintype.ofFinite _
  letI : ∀ i : MulAction.orbitRel.Quotient G P, Fintype (permutationOrbitStabilizer i) :=
    fun _ => Fintype.ofFinite _
  obtain ⟨fin, heq⟩ := sUnit_herbrandQuotient_eq_stabilizerProduct_div_card K L hS σ gen
  letI : Finite (HerbrandH0 G U) := fin.1
  letI : Finite (HerbrandHMinusOne G U σ) := fin.2
  let n := tateNormHom (G := G) (A := U)
  let b := sigmaMinusOneHom (G := G) (A := U) σ
  refine ⟨act, fun _ _ => rfl, fun _ _ => rfl, n,b, ?_, ?_, ?_⟩
  · intro x
    exact map_prod ((Units.coeHom L).comp (SUnitGroup (K := L) S).subtype) (fun g : G => g • x) _
  · intro x
    rw [div_eq_mul_inv]
    change σ (x.val:L) * ((x.val⁻¹:Lˣ):L) = _
    simp
  · have eq0 : n.range.relIndex b.ker = Nat.card (HerbrandH0 G U) := by
      change n.range.relIndex (sigmaMinusOneHom (G := G) (A := U) σ).ker = _
      rw [sigmaMinusOneHom_ker_eq_fixedSubgroup σ gen]
      rfl
    have eq1 : b.range.relIndex n.ker = Nat.card (HerbrandHMinusOne G U σ) := rfl
    rw [eq0,eq1]
    refine ⟨Nat.card_pos,Nat.card_pos,?_⟩
    rw [herbrandQuotient_eq_card_ratio] at heq
    have h₁ : (Nat.card (HerbrandHMinusOne G U σ):ℚ) ≠ 0 := Nat.cast_ne_zero.mpr Nat.card_pos.ne'
    have h₂ : (Fintype.card G:ℚ) ≠ 0 := Nat.cast_ne_zero.mpr Fintype.card_pos.ne'
    have H := (div_eq_div_iff h₁ h₂).mp heq
    rw [mul_comm _ (Nat.card (HerbrandHMinusOne G U σ):ℚ)] at H
    simp only [Nat.card_eq_fintype_card] 
    exact_mod_cast H

end
end TunnellSUnitHerbrand

theorem OMA.solution : OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1.H1 := TunnellSUnitHerbrand.result
