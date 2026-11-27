import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H2_R1
import Mathlib

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
omit [NumberField L] [FiniteDimensional K L] in
@[simp]
theorem inclusion_principalIdele
    (x : Kˣ) :
    inclusion K L (IdeleGroup.principalIdele K x) =
      principalIdele K L
        (Units.map (algebraMap K L) x) := by
  apply Units.ext
  change
    (Algebra.TensorProduct.includeLeft
      (R := K) (S := K)
      (A := NumberField.AdeleRing (𝓞 K) K) (B := L))
        (algebraMap K
          (NumberField.AdeleRing (𝓞 K) K) (x : K)) =
      (Algebra.TensorProduct.includeRight
        (R := K) (A := NumberField.AdeleRing (𝓞 K) K)
        (B := L))
        (algebraMap K L (x : K))
  simp
 

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
 
def conjugation
    (σ : L ≃ₐ[K] L) :
    RelativeAdeleRing K L ≃ₐ[
      NumberField.AdeleRing (𝓞 K) K]
      RelativeAdeleRing K L :=
  Algebra.TensorProduct.congr AlgEquiv.refl σ
omit [NumberField L] [FiniteDimensional K L] in
@[simp]
theorem conjugation_tmul
    (σ : L ≃ₐ[K] L)
    (a : NumberField.AdeleRing (𝓞 K) K) (x : L) :
    conjugation K L σ (a ⊗ₜ[K] x) =
      a ⊗ₜ[K] σ x := by
  rfl
 
def conjugationIdele
    (σ : L ≃ₐ[K] L) :
    RelativeIdeleGroup K L ≃*
      RelativeIdeleGroup K L :=
  Units.mapEquiv (conjugation K L σ).toMulEquiv
omit [NumberField L] [FiniteDimensional K L] in
@[simp]
theorem conjugationIdele_coe
    (σ : L ≃ₐ[K] L) (a : RelativeIdeleGroup K L) :
    ((conjugationIdele K L σ a :
      RelativeIdeleGroup K L) : RelativeAdeleRing K L) =
      conjugation K L σ (a : RelativeAdeleRing K L) :=
  rfl
omit [NumberField L] [FiniteDimensional K L] in
theorem conjugation_one
    (a : RelativeAdeleRing K L) :
    conjugation K L (1 : L ≃ₐ[K] L) a = a := by
  change
    Algebra.TensorProduct.congr
        (AlgEquiv.refl :
          NumberField.AdeleRing (𝓞 K) K ≃ₐ[
            NumberField.AdeleRing (𝓞 K) K]
            NumberField.AdeleRing (𝓞 K) K)
        (AlgEquiv.refl : L ≃ₐ[K] L) a =
      a
  rw [Algebra.TensorProduct.congr_refl]
  rfl
omit [NumberField L] [FiniteDimensional K L] in
theorem conjugation_mul
    (σ τ : L ≃ₐ[K] L)
    (a : RelativeAdeleRing K L) :
    conjugation K L (σ * τ) a =
      conjugation K L σ (conjugation K L τ a) := by
  let e :
      NumberField.AdeleRing (𝓞 K) K ≃ₐ[
        NumberField.AdeleRing (𝓞 K) K]
        NumberField.AdeleRing (𝓞 K) K :=
    AlgEquiv.refl
  have he : e.trans e = e := by
    ext
    rfl
  have h :=
    Algebra.TensorProduct.congr_trans e e τ σ
  rw [he] at h
  change
    Algebra.TensorProduct.congr e (τ.trans σ) a =
      Algebra.TensorProduct.congr e σ
        (Algebra.TensorProduct.congr e τ a)
  exact congrArg
    (fun f :
      RelativeAdeleRing K L ≃ₐ[
        NumberField.AdeleRing (𝓞 K) K]
        RelativeAdeleRing K L ↦ f a) h
 
instance relativeIdeleMulAction :
    MulAction (L ≃ₐ[K] L) (RelativeIdeleGroup K L) where
  smul σ a := conjugationIdele K L σ a
  one_smul a := by
    apply Units.ext
    exact conjugation_one K L (a : RelativeAdeleRing K L)
  mul_smul σ τ a := by
    apply Units.ext
    change conjugation K L (σ * τ)
        (a : RelativeAdeleRing K L) =
      conjugation K L σ
        (conjugation K L τ (a : RelativeAdeleRing K L))
    exact conjugation_mul K L σ τ _
 

noncomputable abbrev relativeIdeleMulDistribMulAction :
    MulDistribMulAction (L ≃ₐ[K] L) (RelativeIdeleGroup K L) where
  __ := relativeIdeleMulAction K L
  smul_one σ := map_one (conjugationIdele K L σ)
  smul_mul σ a b := map_mul (conjugationIdele K L σ) a b
omit [NumberField L] [FiniteDimensional K L] in
@[simp]
theorem smul_def
    (σ : L ≃ₐ[K] L) (a : RelativeIdeleGroup K L) :
    σ • a = conjugationIdele K L σ a :=
  rfl
omit [NumberField L] [FiniteDimensional K L] in
@[simp]
theorem smul_inclusion
    (σ : L ≃ₐ[K] L) (a : IdeleGroup K) :
    σ • inclusion K L a = inclusion K L a := by
  apply Units.ext
  change conjugation K L σ
      (algebraMap
        (NumberField.AdeleRing (𝓞 K) K)
        (RelativeAdeleRing K L)
        ((IdeleGroup.equivAdeleRingUnits (K := K) a :
          (NumberField.AdeleRing (𝓞 K) K)ˣ) :
          NumberField.AdeleRing (𝓞 K) K)) =
    algebraMap
      (NumberField.AdeleRing (𝓞 K) K)
      (RelativeAdeleRing K L)
      ((IdeleGroup.equivAdeleRingUnits (K := K) a :
        (NumberField.AdeleRing (𝓞 K) K)ˣ) :
        NumberField.AdeleRing (𝓞 K) K)
  exact (conjugation K L σ).commutes _
omit [NumberField L] [FiniteDimensional K L] in
@[simp]
theorem smul_principalIdele
    (σ : L ≃ₐ[K] L) (x : Lˣ) :
    σ • principalIdele K L x =
      principalIdele K L (Units.map σ.toRingEquiv.toMonoidHom x) := by
  apply Units.ext
  change conjugation K L σ
      (Algebra.TensorProduct.includeRight (x : L)) =
    Algebra.TensorProduct.includeRight (σ (x : L))
  change conjugation K L σ (1 ⊗ₜ[K] (x : L)) =
    1 ⊗ₜ[K] σ (x : L)
  rw [conjugation_tmul]
 
def galoisAverage
    (z : RelativeAdeleRing K L) :
    RelativeAdeleRing K L :=
  ((Fintype.card (L ≃ₐ[K] L) : K)⁻¹) •
    ∑ σ : L ≃ₐ[K] L, conjugation K L σ z
omit [NumberField L] in
theorem galoisAverage_eq_of_fixed
    [IsGalois K L]
    (z : RelativeAdeleRing K L)
    (hz : ∀ σ : L ≃ₐ[K] L,
      conjugation K L σ z = z) :
    galoisAverage K L z = z := by
  rw [galoisAverage]
  simp_rw [hz]
  rw [Finset.sum_const, Finset.card_univ,
    ← Nat.cast_smul_eq_nsmul K, ← mul_smul,
    inv_mul_cancel₀
      (Nat.cast_ne_zero.mpr Fintype.card_ne_zero),
    one_smul]
omit [NumberField L] in
theorem galoisAverage_tmul
    [IsGalois K L]
    (a : NumberField.AdeleRing (𝓞 K) K) (x : L) :
    galoisAverage K L (a ⊗ₜ[K] x) =
      adeleInclusion K L
        (a * algebraMap K
          (NumberField.AdeleRing (𝓞 K) K)
          ((Fintype.card (L ≃ₐ[K] L) : K)⁻¹ *
            Algebra.trace K L x)) := by
  rw [galoisAverage]
  simp_rw [conjugation_tmul]
  rw [← TensorProduct.tmul_sum,
    ← trace_eq_sum_automorphisms x]
  change
    ((Fintype.card (L ≃ₐ[K] L) : K)⁻¹) •
        (a ⊗ₜ[K]
          algebraMap K L (Algebra.trace K L x)) =
      (a * algebraMap K
        (NumberField.AdeleRing (𝓞 K) K)
        ((Fintype.card (L ≃ₐ[K] L) : K)⁻¹ *
          Algebra.trace K L x)) ⊗ₜ[K] 1
  rw [TensorProduct.smul_tmul',
    Algebra.algebraMap_eq_smul_one]
  rw [← TensorProduct.smul_tmul]
  congr 1
  simp [Algebra.smul_def, map_mul, mul_assoc, mul_comm]
omit [NumberField L] in
theorem galoisAverage_mem_adeleInclusion_range
    [IsGalois K L]
    (z : RelativeAdeleRing K L) :
    ∃ a : NumberField.AdeleRing (𝓞 K) K,
      adeleInclusion K L a = galoisAverage K L z := by
  induction z using TensorProduct.induction_on with
  | zero =>
      refine ⟨0, ?_⟩
      simp [galoisAverage]
  | tmul a x =>
      refine ⟨a * algebraMap K
        (NumberField.AdeleRing (𝓞 K) K)
        ((Fintype.card (L ≃ₐ[K] L) : K)⁻¹ *
          Algebra.trace K L x), ?_⟩
      exact (galoisAverage_tmul K L a x).symm
  | add x y hx hy =>
      obtain ⟨a, ha⟩ := hx
      obtain ⟨b, hb⟩ := hy
      refine ⟨a + b, ?_⟩
      rw [map_add, ha, hb]
      simp [galoisAverage, Finset.sum_add_distrib,
        smul_add]
omit [NumberField L] in
theorem exists_adele_eq_of_galois_fixed
    [IsGalois K L]
    (z : RelativeAdeleRing K L)
    (hz : ∀ σ : L ≃ₐ[K] L,
      conjugation K L σ z = z) :
    ∃ a : NumberField.AdeleRing (𝓞 K) K,
      adeleInclusion K L a = z := by
  obtain ⟨a, ha⟩ :=
    galoisAverage_mem_adeleInclusion_range K L z
  exact ⟨a, ha.trans (galoisAverage_eq_of_fixed K L z hz)⟩
 
def galoisFixedSubgroup :
    Subgroup (RelativeIdeleGroup K L) := by
  letI := relativeIdeleMulDistribMulAction K L
  exact FixedPoints.subgroup (L ≃ₐ[K] L) (RelativeIdeleGroup K L)
omit [NumberField L] in
 

theorem inclusion_range_eq_galoisFixedSubgroup
    [IsGalois K L] :
    (inclusion K L).range =
      galoisFixedSubgroup K L := by
  ext u
  constructor
  · rintro ⟨a, rfl⟩ σ
    exact smul_inclusion K L σ a
  · intro hu
    have hfixed :
        ∀ σ : L ≃ₐ[K] L,
          conjugation K L σ
              (u : RelativeAdeleRing K L) =
            (u : RelativeAdeleRing K L) := by
      intro σ
      exact congrArg Units.val (hu σ)
    obtain ⟨a, ha⟩ :=
      exists_adele_eq_of_galois_fixed K L
        (u : RelativeAdeleRing K L) hfixed
    have hfixedInv :
        ∀ σ : L ≃ₐ[K] L,
          conjugation K L σ
              ((u⁻¹ : RelativeIdeleGroup K L) :
                RelativeAdeleRing K L) =
            ((u⁻¹ : RelativeIdeleGroup K L) :
              RelativeAdeleRing K L) := by
      intro σ
      have huσ : conjugationIdele K L σ u = u := by
        simpa only [smul_def] using hu σ
      exact congrArg Units.val (by
        change conjugationIdele K L σ u⁻¹ = u⁻¹
        rw [map_inv, huσ])
    obtain ⟨b, hb⟩ :=
      exists_adele_eq_of_galois_fixed K L
        ((u⁻¹ : RelativeIdeleGroup K L) :
          RelativeAdeleRing K L) hfixedInv
    unfold adeleInclusion at ha hb
    change
      (Algebra.TensorProduct.includeLeft
        (R := K) (S := K)
        (A := NumberField.AdeleRing (𝓞 K) K) (B := L)) a =
          (u : RelativeAdeleRing K L) at ha
    change
      (Algebra.TensorProduct.includeLeft
        (R := K) (S := K)
        (A := NumberField.AdeleRing (𝓞 K) K) (B := L)) b =
          ((u⁻¹ : RelativeIdeleGroup K L) :
            RelativeAdeleRing K L) at hb
    let q : (NumberField.AdeleRing (𝓞 K) K)ˣ :=
      { val := a
        inv := b
        val_inv := by
          apply
            (Algebra.TensorProduct.includeLeft_injective
              (R := K) (S := K)
              (A := NumberField.AdeleRing (𝓞 K) K) (B := L)
              (FaithfulSMul.algebraMap_injective K L))
          rw [map_mul, ha, hb]
          exact u.val_inv
        inv_val := by
          apply
            (Algebra.TensorProduct.includeLeft_injective
              (R := K) (S := K)
              (A := NumberField.AdeleRing (𝓞 K) K) (B := L)
              (FaithfulSMul.algebraMap_injective K L))
          rw [map_mul, hb, ha]
          exact u.inv_val }
    refine ⟨(IdeleGroup.equivAdeleRingUnits
      (K := K)).symm q, ?_⟩
    apply Units.ext
    change adeleInclusion K L (q :
      NumberField.AdeleRing (𝓞 K) K) =
        (u : RelativeAdeleRing K L)
    exact ha
end RelativeIdeleGroup
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.Idele.Extension.ClassGroup -/
section
open scoped NumberField TensorProduct
open NumberField
noncomputable section
variable
    (K L : Type*) [Field K] [NumberField K]
    [Field L] [NumberField L] [Algebra K L]
    [FiniteDimensional K L]
namespace RelativeIdeleGroup
omit [NumberField L] [FiniteDimensional K L] in
 

theorem exists_scalar_of_adeleInclusion_eq_fieldInclusion
    (a : NumberField.AdeleRing (𝓞 K) K) (x : L)
    (h : adeleInclusion K L a = fieldInclusion K L x) :
    ∃ k : K,
      a = algebraMap K (NumberField.AdeleRing (𝓞 K) K) k ∧
      x = algebraMap K L k := by
  let η :=
    Algebra.linearMap K
      (NumberField.AdeleRing (𝓞 K) K)
  have hη : LinearMap.ker η = ⊥ :=
    LinearMap.ker_eq_bot.mpr
      (NumberField.AdeleRing.algebraMap_injective
        (R := 𝓞 K) (K := K))
  let ε :
      NumberField.AdeleRing (𝓞 K) K →ₗ[K] K :=
    η.leftInverse
  have hε :
      ε (1 : NumberField.AdeleRing (𝓞 K) K) = 1 := by
    change ε (algebraMap K
      (NumberField.AdeleRing (𝓞 K) K) 1) = 1
    exact LinearMap.leftInverse_apply_of_inj hη 1
  let q :
      RelativeAdeleRing K L →ₗ[K] L :=
    (TensorProduct.lid K L).toLinearMap.comp
      (TensorProduct.map ε LinearMap.id)
  have hq := congrArg q h
  have hx : x = algebraMap K L (ε a) := by
    simpa [q, adeleInclusion, fieldInclusion, hε,
      Algebra.smul_def] using hq.symm
  refine ⟨ε a, ?_, hx⟩
  apply
    (Algebra.TensorProduct.includeLeft_injective
      (R := K) (S := K)
      (A := NumberField.AdeleRing (𝓞 K) K) (B := L)
      (FaithfulSMul.algebraMap_injective K L))
  change adeleInclusion K L a =
    adeleInclusion K L
      (algebraMap K
        (NumberField.AdeleRing (𝓞 K) K) (ε a))
  rw [h, hx]
  exact (Algebra.TensorProduct.tmul_one_eq_one_tmul
    (A := NumberField.AdeleRing (𝓞 K) K)
    (B := L) (ε a)).symm
 
def principalSubgroup :
    Subgroup (RelativeIdeleGroup K L) :=
  (principalIdele K L).range
 

abbrev ClassGroup :=
  RelativeIdeleGroup K L ⧸ principalSubgroup K L
omit [NumberField L] [FiniteDimensional K L] in
 

theorem comap_principalSubgroup :
    Subgroup.comap (inclusion K L)
        (principalSubgroup K L) =
      IdeleGroup.principalSubgroup K := by
  ext a
  constructor
  · rintro ⟨x, hx⟩
    have htensor :
        adeleInclusion K L
            ((IdeleGroup.equivAdeleRingUnits (K := K) a :
              (NumberField.AdeleRing (𝓞 K) K)ˣ) :
              NumberField.AdeleRing (𝓞 K) K) =
          fieldInclusion K L (x : L) := by
      exact congrArg Units.val hx.symm
    obtain ⟨k, hkA, hkL⟩ :=
      exists_scalar_of_adeleInclusion_eq_fieldInclusion
        K L _ _ htensor
    have hk : k ≠ 0 := by
      intro hk0
      have : (x : L) = 0 := by
        rw [hkL, hk0, map_zero]
      exact x.ne_zero this
    let y : Kˣ := Units.mk0 k hk
    refine ⟨y, ?_⟩
    apply (IdeleGroup.equivAdeleRingUnits (K := K)).injective
    apply Units.ext
    change
      algebraMap K
          (NumberField.AdeleRing (𝓞 K) K) k =
        ((IdeleGroup.equivAdeleRingUnits (K := K) a :
          (NumberField.AdeleRing (𝓞 K) K)ˣ) :
          NumberField.AdeleRing (𝓞 K) K)
    exact hkA.symm
  · rintro ⟨y, rfl⟩
    refine ⟨Units.map (algebraMap K L) y, ?_⟩
    exact (inclusion_principalIdele K L y).symm
 
def classInclusion :
    IdeleClassGroup K →* ClassGroup K L :=
  QuotientGroup.map
    (IdeleGroup.principalSubgroup K)
    (principalSubgroup K L)
    (inclusion K L)
    (by
      rw [← comap_principalSubgroup K L])
omit [NumberField L] [FiniteDimensional K L] in
@[simp]
theorem classInclusion_mk (a : IdeleGroup K) :
    classInclusion K L
        (QuotientGroup.mk' (IdeleGroup.principalSubgroup K) a) =
      QuotientGroup.mk' (principalSubgroup K L)
        (inclusion K L a) :=
  rfl
omit [NumberField L] [FiniteDimensional K L] in
 
theorem classInclusion_injective :
    Function.Injective (classInclusion K L) := by
  rw [← MonoidHom.ker_eq_bot_iff]
  unfold classInclusion
  rw [QuotientGroup.ker_map,
    comap_principalSubgroup K L]
  ext z
  constructor
  · rintro ⟨a, ha, rfl⟩
    exact (QuotientGroup.eq_one_iff a).2 ha
  · intro hz
    have hz1 : z = 1 := Subgroup.mem_bot.mp hz
    obtain ⟨a, rfl⟩ :=
      QuotientGroup.mk_surjective z
    exact ⟨a, (QuotientGroup.eq_one_iff a).1 hz1, rfl⟩
end RelativeIdeleGroup
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.Idele.Extension.GaloisDescent -/
section
open scoped NumberField
open NumberField
noncomputable section
variable
    (K L : Type*) [Field K] [NumberField K]
    [Field L] [NumberField L] [Algebra K L]
    [FiniteDimensional K L]
namespace RelativeIdeleGroup
omit [NumberField L] [FiniteDimensional K L] in
 
theorem principalIdele_injective :
    Function.Injective (principalIdele K L) := by
  exact Units.map_injective
    (Algebra.TensorProduct.includeRight_injective
      (B := L)
      (NumberField.AdeleRing.algebraMap_injective
        (R := 𝓞 K) (K := K)))
omit [NumberField L] [FiniteDimensional K L] in
 

instance principalQuotientAction :
    MulAction.QuotientAction (L ≃ₐ[K] L)
      (principalSubgroup K L) where
  inv_mul_mem σ {a a'} h := by
    rcases h with ⟨x, hx⟩
    refine
      ⟨Units.map σ.toRingEquiv.toMonoidHom x, ?_⟩
    rw [← smul_principalIdele K L σ x, hx]
    simp [smul_def]
omit [NumberField L] [FiniteDimensional K L] in
@[simp]
theorem smul_class_mk
    (σ : L ≃ₐ[K] L) (a : RelativeIdeleGroup K L) :
    σ •
        (QuotientGroup.mk'
          (principalSubgroup K L) a) =
      QuotientGroup.mk'
        (principalSubgroup K L) (σ • a) :=
  rfl
 

noncomputable abbrev relativeIdeleClassMulDistribMulAction :
    MulDistribMulAction (L ≃ₐ[K] L) (ClassGroup K L) := by
  letI := relativeIdeleMulDistribMulAction K L
  exact Function.Surjective.mulDistribMulAction
    (QuotientGroup.mk' (principalSubgroup K L))
    (QuotientGroup.mk'_surjective (principalSubgroup K L))
    (fun _ _ ↦ rfl)
 

def galoisFixedClassSubgroup :
    Subgroup (ClassGroup K L) := by
  letI := relativeIdeleClassMulDistribMulAction K L
  exact FixedPoints.subgroup (L ≃ₐ[K] L) (ClassGroup K L)
omit [NumberField L] [FiniteDimensional K L] in
 
theorem classInclusion_range_le_galoisFixed :
    (classInclusion K L).range ≤
      galoisFixedClassSubgroup K L := by
  rintro _ ⟨c, rfl⟩
  obtain ⟨a, rfl⟩ :=
    QuotientGroup.mk_surjective c
  intro σ
  change
    σ •
        QuotientGroup.mk'
          (principalSubgroup K L)
          (inclusion K L a) =
      QuotientGroup.mk'
        (principalSubgroup K L)
        (inclusion K L a)
  rw [smul_class_mk, smul_inclusion]
omit [NumberField L] in
 

theorem exists_fixed_representative_of_fixed_class
    [IsGalois K L]
    (a : RelativeIdeleGroup K L)
    (ha :
      ∀ σ : L ≃ₐ[K] L,
        σ •
            QuotientGroup.mk'
              (principalSubgroup K L) a =
          QuotientGroup.mk'
            (principalSubgroup K L) a) :
    ∃ a' : RelativeIdeleGroup K L,
      QuotientGroup.mk'
          (principalSubgroup K L) a' =
        QuotientGroup.mk'
          (principalSubgroup K L) a ∧
      ∀ σ : L ≃ₐ[K] L, σ • a' = a' := by
  classical
  let := relativeIdeleMulDistribMulAction K L
  have hex :
      ∀ σ : L ≃ₐ[K] L,
        ∃ x : Lˣ,
          principalIdele K L x =
            (σ • a) / a := by
    intro σ
    have hmem :
        (σ • a) / a ∈ principalSubgroup K L := by
      exact (QuotientGroup.eq_iff_div_mem).1 (ha σ)
    exact hmem
  let f : (L ≃ₐ[K] L) → Lˣ :=
    fun σ ↦ Classical.choose (hex σ)
  have hf_spec :
      ∀ σ : L ≃ₐ[K] L,
        principalIdele K L (f σ) =
          (σ • a) / a :=
    fun σ ↦ Classical.choose_spec (hex σ)
  have hf_cocycle :
      groupCohomology.IsMulCocycle₁ f := by
    intro σ τ
    apply principalIdele_injective K L
    have hsmul :
        principalIdele K L (σ • f τ) =
          σ • principalIdele K L (f τ) := by
      calc
        principalIdele K L (σ • f τ) =
            principalIdele K L
              (Units.map
                σ.toRingEquiv.toMonoidHom (f τ)) := by
          congr 1
        _ = σ • principalIdele K L (f τ) :=
          (smul_principalIdele K L σ (f τ)).symm
    rw [map_mul, hsmul,
      hf_spec (σ * τ), hf_spec τ, hf_spec σ,
      smul_div', ← mul_smul]
    exact (div_mul_div_cancel _ _ _).symm
  obtain ⟨β, hβ⟩ :=
    groupCohomology.isMulCoboundary₁_of_isMulCocycle₁_of_aut_to_units
      f hf_cocycle
  let a' : RelativeIdeleGroup K L :=
    a / principalIdele K L β
  have hratio :
      ∀ σ : L ≃ₐ[K] L,
        (σ • principalIdele K L β) /
            principalIdele K L β =
          (σ • a) / a := by
    intro σ
    have hβ' :
        Units.map σ.toRingEquiv.toMonoidHom β / β =
          f σ := by
      calc
        Units.map σ.toRingEquiv.toMonoidHom β / β =
            σ • β / β := by
          congr 2
        _ = f σ := hβ σ
    rw [smul_principalIdele,
      ← map_div, hβ', hf_spec σ]
  have ha'fixed :
      ∀ σ : L ≃ₐ[K] L, σ • a' = a' := by
    intro σ
    change
      σ • (a / principalIdele K L β) =
        a / principalIdele K L β
    rw [smul_div']
    calc
      (σ • a) / (σ • principalIdele K L β) =
          ((σ • a) / a) *
            (a / (σ • principalIdele K L β)) := by
        exact (div_mul_div_cancel _ _ _).symm
      _ = ((σ • principalIdele K L β) /
            principalIdele K L β) *
          (a / (σ • principalIdele K L β)) := by
        rw [← hratio σ]
      _ = a / principalIdele K L β := by
        exact div_mul_div_cancel' _ _ _
  refine ⟨a', ?_, ha'fixed⟩
  apply (QuotientGroup.eq_iff_div_mem).2
  refine ⟨β⁻¹, ?_⟩
  change
    (principalIdele K L β)⁻¹ =
      (a / principalIdele K L β) / a
  simpa only [div_mul_eq_div_div] using
    (div_mul_cancel_right a
      (principalIdele K L β)).symm
omit [NumberField L] in
 
theorem galoisFixed_le_classInclusion_range
    [IsGalois K L] :
    galoisFixedClassSubgroup K L ≤
      (classInclusion K L).range := by
  intro c hc
  obtain ⟨a, rfl⟩ :=
    QuotientGroup.mk_surjective c
  have ha :
      ∀ σ : L ≃ₐ[K] L,
        σ •
            QuotientGroup.mk'
              (principalSubgroup K L) a =
          QuotientGroup.mk'
            (principalSubgroup K L) a :=
    hc
  obtain ⟨a', ha'class, ha'fixed⟩ :=
    exists_fixed_representative_of_fixed_class
      K L a ha
  have ha'mem :
      a' ∈ galoisFixedSubgroup K L :=
    ha'fixed
  rw [← inclusion_range_eq_galoisFixedSubgroup
    K L] at ha'mem
  obtain ⟨b, hb⟩ := ha'mem
  refine
    ⟨QuotientGroup.mk'
      (IdeleGroup.principalSubgroup K) b, ?_⟩
  rw [classInclusion_mk, hb]
  exact ha'class
omit [NumberField L] in
 

theorem classInclusion_range_eq_galoisFixedClassSubgroup
    [IsGalois K L] :
    (classInclusion K L).range =
      galoisFixedClassSubgroup K L :=
  le_antisymm
    (classInclusion_range_le_galoisFixed K L)
    (galoisFixed_le_classInclusion_range K L)
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
@[simp]
theorem eval_normPolynomial
    {ι : Type w} [Fintype ι] [DecidableEq ι]
    (b : Module.Basis ι K L) (x : L) :
    MvPolynomial.eval (b.repr x) (normPolynomial b) =
      Algebra.norm K x := by
  rw [normPolynomial, map_mul, map_pow, map_neg, map_one,
    LinearMap.polyCharpoly_coeff_eval]
  exact ((Algebra.norm_apply K x).trans
    (LinearMap.det_eq_sign_charpoly_coeff
      ((Algebra.lmul K L) x))).symm
 

def conjugatePolynomial
    {ι : Type w} [Fintype ι] [DecidableEq ι]
    (b : Module.Basis ι K L) (σ : L ≃ₐ[K] L) :
    MvPolynomial ι L :=
  ∑ i, MvPolynomial.X i * MvPolynomial.C (σ (b i))
omit [FiniteDimensional K L] in
@[simp]
theorem eval_conjugatePolynomial
    {ι : Type w} [Fintype ι] [DecidableEq ι]
    (b : Module.Basis ι K L) (σ : L ≃ₐ[K] L) (x : L) :
    MvPolynomial.eval
        (fun i ↦ algebraMap K L (b.repr x i))
        (conjugatePolynomial b σ) =
      σ x := by
  rw [conjugatePolynomial, map_sum]
  simp only [map_mul, MvPolynomial.eval_X, MvPolynomial.eval_C]
  calc
    ∑ i, algebraMap K L (b.repr x i) * σ (b i) =
        ∑ i, σ ((b.repr x i) • b i) := by
      apply Finset.sum_congr rfl
      intro i hi
      simp [Algebra.smul_def]
    _ = σ (∑ i, (b.repr x i) • b i) := by
      rw [map_sum]
    _ = σ x := by rw [b.sum_repr]
 

def galoisProductPolynomial
    {ι : Type w} [Fintype ι] [DecidableEq ι]
    (b : Module.Basis ι K L) :
    MvPolynomial ι L :=
  ∏ σ : L ≃ₐ[K] L, conjugatePolynomial b σ
@[simp]
theorem eval_galoisProductPolynomial
    {ι : Type w} [Fintype ι] [DecidableEq ι]
    (b : Module.Basis ι K L) (x : L) :
    MvPolynomial.eval
        (fun i ↦ algebraMap K L (b.repr x i))
        (galoisProductPolynomial b) =
      ∏ σ : L ≃ₐ[K] L, σ x := by
  simp [galoisProductPolynomial]
 

theorem map_normPolynomial_eq_galoisProductPolynomial
    [IsGalois K L] [Infinite K]
    {ι : Type w} [Fintype ι] [DecidableEq ι]
    (b : Module.Basis ι K L) :
    MvPolynomial.map (algebraMap K L) (normPolynomial b) =
      galoisProductPolynomial b := by
  apply MvPolynomial.funext_set
    (fun _ : ι ↦ Set.range (algebraMap K L))
  · intro i
    exact Set.infinite_range_of_injective
      (algebraMap K L).injective
  · intro c hc
    choose d hd using fun i ↦ hc i (Set.mem_univ i)
    let x : L :=
      b.repr.symm (Finsupp.equivFunOnFinite.symm d)
    have hcoords :
        c = fun i ↦ algebraMap K L (b.repr x i) := by
      funext i
      calc
        c i = algebraMap K L (d i) := (hd i).symm
        _ = algebraMap K L (b.repr x i) := by simp [x]
    rw [hcoords, eval_galoisProductPolynomial]
    rw [MvPolynomial.eval_map]
    change MvPolynomial.eval₂ (algebraMap K L)
        ((algebraMap K L) ∘ fun i ↦ b.repr x i)
        (normPolynomial b) =
      _
    rw [← MvPolynomial.eval₂_comp]
    rw [eval_normPolynomial]
    exact Algebra.norm_eq_prod_automorphisms K x
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
 

def scalarConjugation
    (A : Type*) [CommRing A] [Algebra K A]
    (σ : L ≃ₐ[K] L) :
    A ⊗[K] L →ₐ[A] A ⊗[K] L :=
  Algebra.TensorProduct.map (AlgHom.id A A) σ.toAlgHom
omit [FiniteDimensional K L] in
 

theorem eval₂_conjugatePolynomial_baseChange
    (A : Type*) [CommRing A] [Algebra K A]
    {ι : Type w} [Fintype ι] [DecidableEq ι]
    (b : Module.Basis ι K L) (σ : L ≃ₐ[K] L)
    (z : A ⊗[K] L) :
    MvPolynomial.eval₂
        ((Algebra.TensorProduct.includeRight
          (R := K) (A := A) (B := L)).toRingHom)
        (fun i ↦ (Algebra.TensorProduct.includeLeft
          (R := K) (S := K) (A := A) (B := L))
          ((Algebra.TensorProduct.basis A b).repr z i))
        (conjugatePolynomial b σ) =
      scalarConjugation (K := K) (L := L) A σ z := by
  simp only [conjugatePolynomial, MvPolynomial.eval₂_sum,
    MvPolynomial.eval₂_mul, MvPolynomial.eval₂_X,
    MvPolynomial.eval₂_C]
  calc
    ∑ i, (Algebra.TensorProduct.includeLeft
          (R := K) (S := K) (A := A) (B := L))
          ((Algebra.TensorProduct.basis A b).repr z i) *
        (Algebra.TensorProduct.includeRight
          (R := K) (A := A) (B := L)) (σ (b i)) =
        ∑ i, scalarConjugation (K := K) (L := L) A σ
          (((Algebra.TensorProduct.basis A b).repr z i) •
            Algebra.TensorProduct.basis A b i) := by
      apply Finset.sum_congr rfl
      intro i hi
      simp [scalarConjugation, Algebra.TensorProduct.basis_apply,
        Algebra.TensorProduct.tmul_mul_tmul,
        Algebra.smul_def]
    _ = scalarConjugation (K := K) (L := L) A σ
          (∑ i, ((Algebra.TensorProduct.basis A b).repr z i) •
            Algebra.TensorProduct.basis A b i) := by
      rw [map_sum]
    _ = scalarConjugation (K := K) (L := L) A σ z := by
      rw [(Algebra.TensorProduct.basis A b).sum_repr]
 


theorem includeLeft_norm_eq_prod_scalarConjugations
    [IsGalois K L] [Infinite K]
    (A : Type*) [CommRing A] [Algebra K A] [Nontrivial A]
    (z : A ⊗[K] L) :
    (Algebra.TensorProduct.includeLeft
      (R := K) (S := K) (A := A) (B := L))
        (Algebra.norm A z) =
      ∏ σ : L ≃ₐ[K] L,
        scalarConjugation (K := K) (L := L) A σ z := by
  classical
  let b := Module.Free.chooseBasis K L
  let c : Module.Free.ChooseBasisIndex K L → A :=
    fun i ↦ (Algebra.TensorProduct.basis A b).repr z i
  let iL : A →+* A ⊗[K] L :=
    (Algebra.TensorProduct.includeLeft
      (R := K) (S := K) (A := A) (B := L)).toRingHom
  let iR : L →+* A ⊗[K] L :=
    (Algebra.TensorProduct.includeRight
      (R := K) (A := A) (B := L)).toRingHom
  have hmaps :
      iL.comp (algebraMap K A) =
        iR.comp (algebraMap K L) := by
    ext x
    simp [iL, iR]
  have hleft :
      MvPolynomial.eval₂ iR (fun i ↦ iL (c i))
          (MvPolynomial.map (algebraMap K L)
            (normPolynomial b)) =
        iL (Algebra.norm A z) := by
    rw [MvPolynomial.eval₂_map]
    rw [← hmaps]
    rw [← MvPolynomial.hom_eval₂]
    rw [eval₂_normPolynomial_baseChange]
  have hright :
      MvPolynomial.eval₂ iR (fun i ↦ iL (c i))
          (galoisProductPolynomial b) =
        ∏ σ : L ≃ₐ[K] L,
          scalarConjugation (K := K) (L := L) A σ z := by
    rw [galoisProductPolynomial,
      MvPolynomial.eval₂_prod]
    apply Finset.prod_congr rfl
    intro σ hσ
    exact eval₂_conjugatePolynomial_baseChange
      (K := K) (L := L) A b σ z
  change iL (Algebra.norm A z) =
    ∏ σ : L ≃ₐ[K] L,
      scalarConjugation (K := K) (L := L) A σ z
  rw [← hright, ← hleft,
    map_normPolynomial_eq_galoisProductPolynomial b]
omit [FiniteDimensional K L] in
@[simp]
theorem scalarConjugation_baseAdele_apply
    [NumberField K]
    (σ : L ≃ₐ[K] L) (z : RelativeAdeleRing K L) :
    scalarConjugation
        (NumberField.AdeleRing (𝓞 K) K) σ z =
      conjugation K L σ z :=
  rfl
 


theorem adeleInclusion_norm_eq_prod_conjugates
    [NumberField K] [IsGalois K L]
    (z : RelativeAdeleRing K L) :
    adeleInclusion K L
        (Algebra.norm
          (NumberField.AdeleRing (𝓞 K) K) z) =
      ∏ σ : L ≃ₐ[K] L, conjugation K L σ z := by
  change
    (Algebra.TensorProduct.includeLeft
      (R := K) (S := K)
      (A := NumberField.AdeleRing (𝓞 K) K) (B := L))
        (Algebra.norm
          (NumberField.AdeleRing (𝓞 K) K) z) =
      _
  simpa only [scalarConjugation_baseAdele_apply] using
    (includeLeft_norm_eq_prod_scalarConjugations
      (K := K) (L := L)
      (NumberField.AdeleRing (𝓞 K) K) z)
 


theorem inclusion_norm_eq_prod_conjugates
    [NumberField K] [IsGalois K L]
    (a : RelativeIdeleGroup K L) :
    inclusion K L (norm K L a) =
      ∏ σ : L ≃ₐ[K] L, σ • a := by
  apply Units.ext
  simp only [inclusion, norm, MonoidHom.comp_apply,
    Units.coe_map, Units.coe_prod,
    smul_def, conjugationIdele_coe]
  exact adeleInclusion_norm_eq_prod_conjugates
    (K := K) (L := L) (a : RelativeAdeleRing K L)
end RelativeIdeleGroup
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
end Herbrand
end ProfiniteCohomology
end
end CyclicCohomology
end

/- GaloisCohomology.Cyclic.Herbrand.Permutation.Module -/
section
open scoped BigOperators
noncomputable section
namespace CyclicCohomology
open CyclicCohomology.ProfiniteCohomology.Herbrand
universe uG uA uι
section TrivialInteger
variable {G : Type uG} [Group G] [Fintype G]
end TrivialInteger
section TransitivePermutationLattice
variable {G : Type uG} [Group G] [Fintype G]
end TransitivePermutationLattice
section PermutationLatticeOrbits
variable {G : Type uG} [Group G] [Fintype G]
variable {ι : Type uι} [Fintype ι]
end PermutationLatticeOrbits
section CanonicalPermutationFunctions
variable {G : Type uG} [Group G] [Fintype G]
variable {ι : Type uι} [Fintype ι] [MulAction G ι]
end CanonicalPermutationFunctions
section FiniteIndexStableSubgroup
variable {G : Type uG} {A : Type uA}
    [Group G] [CommGroup A]
    [MulDistribMulAction G A]
 
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
end FiniteIndexStableSubgroup
section FiniteIndexStableSubgroupFiniteness
variable {G A : Type}
    [Group G] [CommGroup A]
    [MulDistribMulAction G A]
variable [Fintype G]
end FiniteIndexStableSubgroupFiniteness
end CyclicCohomology
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.Idele.Cohomology.Herbrand -/
section
open scoped BigOperators NumberField
open NumberField
noncomputable section
open CyclicCohomology.ProfiniteCohomology.Herbrand
open CyclicCohomology
namespace RelativeIdeleGroup
namespace Cohomology
variable
    (K L : Type) [Field K] [NumberField K]
    [Field L] [NumberField L] [Algebra K L]
    [FiniteDimensional K L] [IsGalois K L]
 

noncomputable abbrev relativeIdeleMulDistribMulAction :
    MulDistribMulAction (L ≃ₐ[K] L)
      (RelativeIdeleGroup K L) where
  __ := RelativeIdeleGroup.relativeIdeleMulAction K L
  smul_one σ :=
    map_one (RelativeIdeleGroup.conjugationIdele K L σ)
  smul_mul σ a b :=
    map_mul
      (RelativeIdeleGroup.conjugationIdele K L σ) a b
omit [NumberField L] [FiniteDimensional K L] [IsGalois K L] in
theorem principalRelativeIdele_smul_mem
    (σ : L ≃ₐ[K] L)
    (a : RelativeIdeleGroup K L)
    (ha :
      a ∈ RelativeIdeleGroup.principalSubgroup K L) :
    σ • a ∈
      RelativeIdeleGroup.principalSubgroup K L := by
  rcases ha with ⟨x, rfl⟩
  refine
    ⟨Units.map σ.toRingEquiv.toMonoidHom x, ?_⟩
  exact
    (RelativeIdeleGroup.smul_principalIdele
      K L σ x).symm
 

noncomputable abbrev ideleClassMulDistribMulAction :
    MulDistribMulAction (L ≃ₐ[K] L)
      (RelativeIdeleGroup.ClassGroup K L) := by
  letI := relativeIdeleMulDistribMulAction K L
  exact
    stableQuotientMulDistribMulAction
      (RelativeIdeleGroup.principalSubgroup K L)
      (principalRelativeIdele_smul_mem K L)
 

noncomputable def ideleClassNorm :
    RelativeIdeleGroup.ClassGroup K L →*
      IdeleClassGroup K :=
  QuotientGroup.map
    (RelativeIdeleGroup.principalSubgroup K L)
    (IdeleGroup.principalSubgroup K)
    (RelativeIdeleGroup.norm K L)
    (by
      rintro _ ⟨x, rfl⟩
      refine
        ⟨Units.map (Algebra.norm K) x, ?_⟩
      exact
        (RelativeIdeleGroup.norm_principalIdele
          K L x).symm)
 
abbrev IdeleClassNormQuotient :=
  IdeleClassGroup K ⧸ (ideleClassNorm K L).range
section Actions
local instance :
    MulDistribMulAction (L ≃ₐ[K] L)
      (RelativeIdeleGroup.ClassGroup K L) :=
  ideleClassMulDistribMulAction K L
omit [NumberField L] in
 

theorem classInclusion_ideleClassNorm_eq_tateNorm
    (c : RelativeIdeleGroup.ClassGroup K L) :
    RelativeIdeleGroup.classInclusion K L
        (ideleClassNorm K L c) =
      tateNorm (L ≃ₐ[K] L)
        (RelativeIdeleGroup.ClassGroup K L) c := by
  refine QuotientGroup.induction_on c ?_
  intro a
  change
    QuotientGroup.mk'
        (RelativeIdeleGroup.principalSubgroup K L)
        (RelativeIdeleGroup.inclusion K L
          (RelativeIdeleGroup.norm K L a)) =
      ∏ σ : L ≃ₐ[K] L,
        QuotientGroup.mk'
          (RelativeIdeleGroup.principalSubgroup K L)
          (σ • a)
  rw [← map_prod]
  exact congrArg
    (QuotientGroup.mk'
      (RelativeIdeleGroup.principalSubgroup K L))
    (RelativeIdeleGroup.inclusion_norm_eq_prod_conjugates
      (K := K) (L := L) a)
omit [NumberField L] [FiniteDimensional K L] [IsGalois K L] in
 

theorem ideleClass_fixedSubgroup_eq_galoisFixed :
    fixedSubgroup (L ≃ₐ[K] L)
        (RelativeIdeleGroup.ClassGroup K L) =
      RelativeIdeleGroup.galoisFixedClassSubgroup K L := by
  ext c
  constructor
  · intro hc σ
    exact hc σ
  · intro hc σ
    exact hc σ
 

def baseIdeleClassToFixed :
    IdeleClassGroup K →*
      fixedSubgroup (L ≃ₐ[K] L)
        (RelativeIdeleGroup.ClassGroup K L) :=
  (RelativeIdeleGroup.classInclusion K L).codRestrict
    (fixedSubgroup (L ≃ₐ[K] L)
      (RelativeIdeleGroup.ClassGroup K L))
    (by
      intro c
      rw [ideleClass_fixedSubgroup_eq_galoisFixed K L]
      exact
        RelativeIdeleGroup.classInclusion_range_le_galoisFixed
          K L ⟨c, rfl⟩)
 

noncomputable def baseIdeleClassEquivFixed :
    IdeleClassGroup K ≃*
      fixedSubgroup (L ≃ₐ[K] L)
        (RelativeIdeleGroup.ClassGroup K L) :=
  MulEquiv.ofBijective
    (baseIdeleClassToFixed K L)
    ⟨by
      intro a b hab
      apply RelativeIdeleGroup.classInclusion_injective K L
      exact congrArg Subtype.val hab,
    by
      intro c
      have hc :
          (c : RelativeIdeleGroup.ClassGroup K L) ∈
            (RelativeIdeleGroup.classInclusion K L).range := by
        rw [
          RelativeIdeleGroup.classInclusion_range_eq_galoisFixedClassSubgroup
            K L,
          ← ideleClass_fixedSubgroup_eq_galoisFixed K L]
        exact c.property
      rcases hc with ⟨a, ha⟩
      exact ⟨a, Subtype.ext ha⟩⟩
omit [NumberField L] in
 

theorem ideleClassNorm_range_map_equivFixed :
    (ideleClassNorm K L).range.map
        (baseIdeleClassEquivFixed K L).toMonoidHom =
      (tateNormSubgroup (L ≃ₐ[K] L)
        (RelativeIdeleGroup.ClassGroup K L)).subgroupOf
          (fixedSubgroup (L ≃ₐ[K] L)
            (RelativeIdeleGroup.ClassGroup K L)) := by
  ext x
  constructor
  · rintro ⟨c, ⟨d, rfl⟩, rfl⟩
    change
      RelativeIdeleGroup.classInclusion K L
          (ideleClassNorm K L d) ∈
        tateNormSubgroup (L ≃ₐ[K] L)
          (RelativeIdeleGroup.ClassGroup K L)
    exact
      ⟨d,
        (classInclusion_ideleClassNorm_eq_tateNorm
          K L d).symm⟩
  · intro hx
    change
      (x : RelativeIdeleGroup.ClassGroup K L) ∈
        tateNormSubgroup (L ≃ₐ[K] L)
          (RelativeIdeleGroup.ClassGroup K L) at hx
    rcases hx with ⟨d, hd⟩
    refine
      ⟨ideleClassNorm K L d, ⟨d, rfl⟩, ?_⟩
    apply Subtype.ext
    exact
      (classInclusion_ideleClassNorm_eq_tateNorm
        K L d).trans hd
section NormQuotientIdentification
local instance ideleClassNormQuotient_baseIsMulCommutative :
    IsMulCommutative (IdeleClassGroup K) :=
  ⟨⟨fun a b => mul_comm a b⟩⟩
 

noncomputable def ideleClassHerbrandH0EquivNormQuotient :
    HerbrandH0 (L ≃ₐ[K] L)
        (RelativeIdeleGroup.ClassGroup K L) ≃*
      IdeleClassNormQuotient K L :=
  (HerbrandH0.equiv
    (G := L ≃ₐ[K] L)
    (A := RelativeIdeleGroup.ClassGroup K L)).trans
      (QuotientGroup.congr
        (ideleClassNorm K L).range
        ((tateNormSubgroup (L ≃ₐ[K] L)
          (RelativeIdeleGroup.ClassGroup K L)).subgroupOf
            (fixedSubgroup (L ≃ₐ[K] L)
              (RelativeIdeleGroup.ClassGroup K L)))
        (baseIdeleClassEquivFixed K L)
        (ideleClassNorm_range_map_equivFixed K L)).symm
omit [NumberField L] in
 


theorem ideleClassNorm_index_eq_herbrandH0_card :
    (ideleClassNorm K L).range.index =
      Nat.card
        (HerbrandH0 (L ≃ₐ[K] L)
          (RelativeIdeleGroup.ClassGroup K L)) := by
  rw [Subgroup.index_eq_card]
  exact
    (Nat.card_congr
      (ideleClassHerbrandH0EquivNormQuotient
        K L).toEquiv).symm
end NormQuotientIdentification
end Actions
end Cohomology
end RelativeIdeleGroup
end
end

namespace TunnellAdelicIndexData
open NumberField IsDedekindDomain
open scoped NumberField TensorProduct Classical
noncomputable section

variable (D N : Type) [Field D] [NumberField D] [Field N] [Algebra D N]
abbrev A := AdeleRing (𝓞 D) D
abbrev V (v : HeightOneSpectrum (𝓞 D)) := v.adicCompletion D
abbrev P := (Units.map (algebraMap D (A D)).toMonoidHom).range ⊔
  (Units.map (Algebra.norm (A D) : (A D ⊗[D] N) →* A D)).range

end
end TunnellAdelicIndexData
namespace TunnellCyclicAdelicIndex
open NumberField IsDedekindDomain TunnellAdelicIndexData
open scoped NumberField TensorProduct Classical IsMulCommutative
noncomputable section

variable (D N : Type) [Field D] [NumberField D] [Field N] [NumberField N] [Algebra D N]
  [FiniteDimensional D N] [IsGalois D N]

abbrev cls (D : Type) [Field D] [NumberField D] : (A D)ˣ →* IdeleClassGroup D :=
  (QuotientGroup.mk' (IdeleGroup.principalSubgroup D)).comp (IdeleGroup.equivAdeleRingUnits (K:=D)).symm.toMonoidHom

theorem cls_surjective : Function.Surjective (cls D) :=
  (QuotientGroup.mk'_surjective _).comp (IdeleGroup.equivAdeleRingUnits (K:=D)).symm.surjective

theorem cls_ker : (cls D).ker = (Units.map (algebraMap D (A D)).toMonoidHom).range := by
  ext a
  change QuotientGroup.mk' _ ((IdeleGroup.equivAdeleRingUnits (K:=D)).symm a)=1 ↔ _
  apply (QuotientGroup.eq_one_iff _).trans
  constructor
  · rintro ⟨z,hz⟩
    exact ⟨z, (IdeleGroup.equivAdeleRingUnits (K:=D)).symm.injective hz⟩
  · rintro ⟨z,rfl⟩
    exact ⟨z,rfl⟩

theorem norm_range :
    (RelativeIdeleGroup.Cohomology.ideleClassNorm D N).range =
      (Units.map (Algebra.norm (A D) : (A D ⊗[D] N) →* A D)).range.map (cls D) := by
  ext a
  constructor
  · rintro ⟨z,rfl⟩
    obtain ⟨y,rfl⟩ := QuotientGroup.mk'_surjective (RelativeIdeleGroup.principalSubgroup D N) z
    exact ⟨_,⟨y,rfl⟩,rfl⟩
  · rintro ⟨_,⟨z,rfl⟩,rfl⟩
    exact ⟨QuotientGroup.mk' (RelativeIdeleGroup.principalSubgroup D N) z,rfl⟩

theorem presentation :
    ((RelativeIdeleGroup.Cohomology.ideleClassNorm D N).range).comap (cls D) = P D N := by
  rw [norm_range,Subgroup.comap_map_eq,cls_ker,sup_comm]


end
end TunnellCyclicAdelicIndex
namespace TunnellGlobalFormationBridge
open NumberField IsDedekindDomain TunnellAdelicIndexData
open CyclicCohomology CyclicCohomology.ProfiniteCohomology.Herbrand
open RelativeIdeleGroup.Cohomology
open scoped NumberField TensorProduct Classical IsMulCommutative
noncomputable section
variable (D N : Type) [Field D] [NumberField D] [Field N] [NumberField N] [Algebra D N]
  [FiniteDimensional D N] [IsGalois D N]
abbrev G := Gal(N/D)
abbrev I := RelativeIdeleGroup D N
abbrev C := RelativeIdeleGroup.ClassGroup D N
abbrev q := QuotientGroup.mk' (RelativeIdeleGroup.principalSubgroup D N)
local instance : MulDistribMulAction (G D N) (C D N) := ideleClassMulDistribMulAction D N
local instance : IsMulCommutative (IdeleClassGroup D) := ⟨⟨fun a b => mul_comm a b⟩⟩

theorem lower_degree :
    Nat.card (HerbrandH0 (G D N) (C D N)) = (P D N).index := by
  rw [← RelativeIdeleGroup.Cohomology.ideleClassNorm_index_eq_herbrandH0_card D N,
    ← TunnellCyclicAdelicIndex.presentation D N,
    Subgroup.index_comap_of_surjective _ (TunnellCyclicAdelicIndex.cls_surjective D)]


end
end TunnellGlobalFormationBridge

namespace TunnellTateIndex
open CyclicCohomology CyclicCohomology.ProfiniteCohomology.Herbrand
open scoped Classical
noncomputable section
variable {G:Type} [Group G] [Fintype G] (M:Type) [CommGroup M] [MulDistribMulAction G M]
def op (s:G) : M →* M := MulDistribMulAction.toMonoidEnd G M s
def norm : M →* M := ∏ s:G, op M s
def cob (g:G) : M →* M := op M g / MonoidHom.id M
theorem norm_eq : norm (G:=G) M=tateNormHom (G:=G) (A:=M) := by
  apply MonoidHom.ext
  intro x
  exact MonoidHom.finsetProd_apply _ _ _
theorem cob_eq (g:G) : cob M g=sigmaMinusOneHom (G:=G) (A:=M) g := by
  apply MonoidHom.ext
  intro x
  exact div_eq_mul_inv _ _
theorem zero (g:G) (gen:∀ s:G,s∈Subgroup.zpowers g) :
    (norm (G:=G) M).range.relIndex (cob M g).ker=Nat.card (HerbrandH0 G M) := by
  rw [norm_eq,cob_eq,sigmaMinusOneHom_ker_eq_fixedSubgroup g gen]
  rfl
theorem minus_one (g:G) :
    (cob M g).range.relIndex (norm (G:=G) M).ker=Nat.card (HerbrandHMinusOne G M g) := by
  rw [norm_eq,cob_eq]
  rfl
end
end TunnellTateIndex

namespace TunnellClassFixedIndex
open NumberField IsDedekindDomain CyclicCohomology CyclicCohomology.ProfiniteCohomology.Herbrand
open RelativeIdeleGroup.Cohomology TunnellTateIndex
open scoped Classical NumberField TensorProduct
noncomputable section
theorem result : OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H2_R1.H2 := by
  intro D N _ _ _ _ _ _ _ g gen
  let G:=Gal(N/D)
  let C:=RelativeIdeleGroup.ClassGroup D N
  letI : MulDistribMulAction G C := ideleClassMulDistribMulAction D N
  refine ⟨ideleClassMulDistribMulAction D N,fun _ _ => rfl,?_⟩
  change (TunnellTateIndex.norm (G:=G) C).range.relIndex (cob C g).ker = _
  rw [TunnellTateIndex.zero C g gen]
  exact TunnellGlobalFormationBridge.lower_degree D N
end
end TunnellClassFixedIndex

theorem OMA.solution : OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H2_R1.H2 := TunnellClassFixedIndex.result
