import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H3_R1_H1_R1_H1_R1
import Mathlib

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

theorem OMA.solution : OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H3_R1_H1_R1_H1_R1.H2 := by
  intro K _ _ p hp hmu
  dsimp only
  intro S T
  exact TunnellKummerSupportGroups.product K ⟨p,hp.pos⟩ S T
