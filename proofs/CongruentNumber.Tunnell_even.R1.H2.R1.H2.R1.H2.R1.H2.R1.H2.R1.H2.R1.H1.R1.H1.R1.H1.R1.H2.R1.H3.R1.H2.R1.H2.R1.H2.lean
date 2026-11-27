import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H2_R1_H3_R1_H2_R1_H2_R1
import Mathlib

/-! Local tensor determinants compute fixed-class indices. The place decomposition, the real and complex norm groups, and the supplied nonarchimedean local degree theorem identify these indices with the stabilizers. -/
namespace TunnellSpectral
open Polynomial
theorem integral {K L:Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
    [NormedField L] [NormedAlgebra K L] [Algebra.IsAlgebraic K L]
    (V:ValuationSubring K) (hv:∀a:K, a∈V ↔ ‖a‖≤1) (x:L) (hx:‖x‖≤1) :
    letI : Algebra V L := Algebra.compHom L (algebraMap V K)
    IsIntegral V x := by
  classical
  letI : Algebra V L := Algebra.compHom L (algebraMap V K)
  letI : IsScalarTower V K L := .of_algebraMap_eq' rfl
  let p:=minpoly K x
  have hm : p.Monic := minpoly.monic (Algebra.IsIntegral.isIntegral x)
  have ht : ∀ i, p.coeff i∈V := by
    intro i
    apply (hv _).mpr
    rcases lt_trichotomy i p.natDegree with hi|hi|hi
    · have hval : spectralValueTerms p i ≤ 1 :=
        (le_ciSup (spectralValueTerms_bddAbove p) i).trans (show spectralNorm K L x≤1 by rw [←NormedAlgebra.norm_eq_spectralNorm K x];exact hx)
      rw [spectralValueTerms_of_lt_natDegree p hi] at hval
      by_contra! h
      exact (not_lt_of_ge hval) (Real.one_lt_rpow h (one_div_pos.mpr (sub_pos.mpr (by exact_mod_cast hi))))
    · rw [hi,hm.coeff_natDegree,norm_one]
    · rw [coeff_eq_zero_of_natDegree_lt hi,norm_zero];exact zero_le_one
  have hc : (p.coeffs : Set K) ⊆ V.toSubring := by
    intro y hy
    obtain ⟨i,_,rfl⟩ := Polynomial.mem_coeffs_iff.mp hy
    exact ht i
  let q : V[X] := p.toSubring V.toSubring hc
  have he : q.map (algebraMap V K) = p := Polynomial.map_toSubring _ _ _
  refine ⟨q,?_,?_⟩
  · exact (Polynomial.monic_toSubring _ _ _).mpr hm
  · change aeval x q=0
    rw [← Polynomial.aeval_map_algebraMap K x q,he]
    exact minpoly.aeval K x

end TunnellSpectral

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
 
def tateNormSubgroup (G : Type uG) (A : Type uA) [Group G] [Fintype G] [CommGroup A]
    [MulDistribMulAction G A] : Subgroup A :=
  MonoidHom.range (tateNormHom (G := G) (A := A))
 
def HerbrandH0 (G : Type uG) (A : Type uA) [Group G] [Fintype G] [CommGroup A]
    [MulDistribMulAction G A] : Type uA :=
  fixedSubgroup G A ⧸ (tateNormSubgroup G A).subgroupOf (fixedSubgroup G A)
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
omit [CommGroup B] [CommGroup C]
    [MulDistribMulAction G B] [MulDistribMulAction G C] in
 
def HerbrandH0.mk : fixedSubgroup G A →* HerbrandH0 G A := by
  unfold HerbrandH0
  exact QuotientGroup.mk'
    ((tateNormSubgroup G A).subgroupOf (fixedSubgroup G A))
omit [CommGroup B] [CommGroup C]
    [MulDistribMulAction G B] [MulDistribMulAction G C] in
 
@[simp]
theorem HerbrandH0.equiv_mk (a : fixedSubgroup G A) :
    HerbrandH0.equiv (G := G) (A := A) (HerbrandH0.mk a) =
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
 

protected theorem HerbrandH0.inductionOn
    {motive : HerbrandH0 G A → Prop} (q : HerbrandH0 G A)
    (h : ∀ a : fixedSubgroup G A, motive (HerbrandH0.mk a)) : motive q := by
  obtain ⟨a, rfl⟩ := HerbrandH0.mk_surjective (G := G) (A := A) q
  exact h a
 

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
omit [CommGroup B] [CommGroup C]
    [MulDistribMulAction G B] [MulDistribMulAction G C] in
 

theorem herbrandH0_subsingleton_of_fixed_le_tateNormSubgroup
    (h : fixedSubgroup G A ≤ tateNormSubgroup G A) :
    Subsingleton (HerbrandH0 G A) := by
  refine ⟨fun q r => ?_⟩
  have hq : q = 1 := by
    refine HerbrandH0.inductionOn (motive := fun z => z = 1) q ?_
    intro a
    apply (HerbrandH0.mk_eq_one_iff (G := G) (A := A) a).2
    exact h a.2
  have hr : r = 1 := by
    refine HerbrandH0.inductionOn (motive := fun z => z = 1) r ?_
    intro a
    apply (HerbrandH0.mk_eq_one_iff (G := G) (A := A) a).2
    exact h a.2
  rw [hq, hr]
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
end TateCohomology
end
end

/- GaloisCohomology.Cyclic.Herbrand.Induced -/
section
noncomputable section
namespace CyclicCohomology
open CyclicCohomology.ProfiniteCohomology.Herbrand
universe uG uB
variable {G : Type uG} {B : Type uB}
 


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
 
theorem zpowers_pow_index_eq (H : Subgroup G) (σ : G)
    (hgen : ∀ x : G, x ∈ Subgroup.zpowers σ) :
    Subgroup.zpowers (σ ^ H.index) = H := by
  have hn0 : H.index ≠ 0 := by
    rw [H.index_eq_card]
    exact Nat.card_pos.ne'
  have horder : orderOf σ = Nat.card G :=
    orderOf_eq_card_of_forall_mem_zpowers hgen
  have hindex_dvd_order : H.index ∣ orderOf σ := by
    rw [horder]
    exact H.index_dvd_card
  have hpowOrder :
      orderOf (σ ^ H.index) = Nat.card H := by
    calc
      orderOf (σ ^ H.index) =
          orderOf σ / H.index :=
        orderOf_pow_of_dvd hn0 hindex_dvd_order
      _ = Nat.card G / H.index := by rw [horder]
      _ = Nat.card H := by
        rw [← H.index_mul_card]
        exact Nat.mul_div_cancel_left
          (Nat.card H) (Nat.pos_of_ne_zero hn0)
  apply Subgroup.eq_of_le_of_card_ge
  · exact Subgroup.zpowers_le.mpr
      (cyclic_pow_index_mem H σ)
  · rw [Nat.card_zpowers, hpowOrder]
 
def subgroupGenerator (H : Subgroup G) (σ : G) : H :=
  ⟨σ ^ H.index, cyclic_pow_index_mem H σ⟩
 
theorem subgroupGenerator_generates (H : Subgroup G) (σ : G)
    (hgen : ∀ x : G, x ∈ Subgroup.zpowers σ) :
    ∀ h : H, h ∈ Subgroup.zpowers (subgroupGenerator H σ) := by
  intro h
  have hh : h.1 ∈
      Subgroup.zpowers (σ ^ H.index) := by
    rw [zpowers_pow_index_eq H σ hgen]
    exact h.2
  obtain ⟨k, hk⟩ :=
    Subgroup.mem_zpowers_iff.mp hh
  refine Subgroup.mem_zpowers_iff.mpr ⟨k, ?_⟩
  apply Subtype.ext
  exact hk
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
end InducedHerbrandHMinusOne
section FiniteCyclicGroup
variable [Group G] [Fintype G] [CommGroup B]
variable (H : Subgroup G) [MulDistribMulAction H B]
 


noncomputable def subgroupGeneratorOfGenerator (σ : G)
    (hgen : ∀ x : G, x ∈ Subgroup.zpowers σ) : H := by
  letI : IsCyclic G := ⟨⟨σ, hgen⟩⟩
  letI : CommGroup G := IsCyclic.commGroup
  exact subgroupGenerator H σ
 
theorem subgroupGeneratorOfGenerator_generates (σ : G)
    (hgen : ∀ x : G, x ∈ Subgroup.zpowers σ) :
    ∀ h : H,
      h ∈ Subgroup.zpowers
        (subgroupGeneratorOfGenerator H σ hgen) := by
  let : IsCyclic G := ⟨⟨σ, hgen⟩⟩
  let : CommGroup G := IsCyclic.commGroup
  have hτ :
      subgroupGeneratorOfGenerator H σ hgen =
        subgroupGenerator H σ :=
    Subtype.ext (by rfl)
  rw [hτ]
  exact subgroupGenerator_generates H σ hgen
 

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
end FiniteCyclicGroup
end CyclicCohomology
end
end

/- ValuedFieldTheory.Valuation.AbsoluteValue.Extension -/
section
namespace AbsoluteValue
 
def Extends {K L : Type*} [Field K] [Field L] [Algebra K L]
    (v : AbsoluteValue K ℝ) (w : AbsoluteValue L ℝ) : Prop :=
  ∀ x : K, w (algebraMap K L x) = v x
end AbsoluteValue
end

/- ValuedFieldTheory.Valuation.AbsoluteValue.Nonarchimedean -/
section
noncomputable section
open Filter
open scoped Topology
namespace AbsoluteValue
private theorem finset_sum_le
    {K : Type*} [Field K] (v : AbsoluteValue K ℝ)
    {ι : Type*} (s : Finset ι) (f : ι → K) :
    v (s.sum f) ≤ s.sum (fun i => v (f i)) := by
  classical
  refine Finset.induction_on s ?empty ?insert
  · simp
  · intro i s his ih
    rw [Finset.sum_insert his, Finset.sum_insert his]
    exact (v.add_le (f i) (s.sum f)).trans
      (by
        simpa [add_comm, add_left_comm, add_assoc] using
          add_le_add_left ih (v (f i)))
private theorem nat_bound_ge_one
    {K : Type*} [Field K] (v : AbsoluteValue K ℝ) {C : ℝ}
    (hC : ∀ n : ℕ, v (n : K) ≤ C) :
    1 ≤ C := by
  simpa using hC 1
 


private theorem add_pow_le_of_bounded_nat
    {K : Type*} [Field K] (v : AbsoluteValue K ℝ) {C : ℝ}
    (hC : ∀ n : ℕ, v (n : K) ≤ C) (x y : K) (n : ℕ) :
    v ((x + y) ^ n) ≤
      ((n + 1 : ℕ) : ℝ) * C * (max (v x) (v y)) ^ n := by
  classical
  let M : ℝ := max (v x) (v y)
  have hC_nonneg : 0 ≤ C :=
    (zero_le_one : (0 : ℝ) ≤ 1).trans
      (nat_bound_ge_one v hC)
  have hM_nonneg : 0 ≤ M :=
    (v.nonneg x).trans (le_max_left (v x) (v y))
  have hsum_le :
      v ((Finset.range (n + 1)).sum
          (fun m => x ^ m * y ^ (n - m) * (n.choose m : K))) ≤
        (Finset.range (n + 1)).sum
          (fun m => v (x ^ m * y ^ (n - m) * (n.choose m : K))) :=
    finset_sum_le v (Finset.range (n + 1))
      (fun m => x ^ m * y ^ (n - m) * (n.choose m : K))
  have hterm :
      ∀ m ∈ Finset.range (n + 1),
        v (x ^ m * y ^ (n - m) * (n.choose m : K)) ≤ C * M ^ n := by
    intro m hm
    have hmle : m ≤ n := Nat.lt_succ_iff.mp (Finset.mem_range.mp hm)
    have hxpow : v (x ^ m) ≤ M ^ m := by
      rw [map_pow]
      exact pow_le_pow_left₀ (v.nonneg x) (le_max_left (v x) (v y)) m
    have hypow : v (y ^ (n - m)) ≤ M ^ (n - m) := by
      rw [map_pow]
      exact pow_le_pow_left₀ (v.nonneg y) (le_max_right (v x) (v y)) (n - m)
    have hxy :
        v (x ^ m) * v (y ^ (n - m)) ≤ M ^ m * M ^ (n - m) :=
      mul_le_mul hxpow hypow (v.nonneg (y ^ (n - m))) (pow_nonneg hM_nonneg m)
    have hchoose : v ((n.choose m : ℕ) : K) ≤ C := hC (n.choose m)
    calc
      v (x ^ m * y ^ (n - m) * (n.choose m : K))
          = v (x ^ m) * v (y ^ (n - m)) * v ((n.choose m : ℕ) : K) := by
              rw [map_mul, map_mul]
      _ ≤ (M ^ m * M ^ (n - m)) * C := by
              exact mul_le_mul hxy hchoose
                (v.nonneg ((n.choose m : ℕ) : K))
                (mul_nonneg (pow_nonneg hM_nonneg m)
                  (pow_nonneg hM_nonneg (n - m)))
      _ = C * M ^ n := by
              rw [← pow_add, Nat.add_sub_of_le hmle]
              ring
  calc
    v ((x + y) ^ n)
        = v ((Finset.range (n + 1)).sum
            (fun m => x ^ m * y ^ (n - m) * (n.choose m : K))) := by
            rw [add_pow]
    _ ≤ (Finset.range (n + 1)).sum
          (fun m => v (x ^ m * y ^ (n - m) * (n.choose m : K))) := hsum_le
    _ ≤ (Finset.range (n + 1)).sum (fun _m => C * M ^ n) :=
          Finset.sum_le_sum hterm
    _ = ((n + 1 : ℕ) : ℝ) * C * M ^ n := by
          simp [Finset.sum_const, nsmul_eq_mul, mul_assoc]
 

private theorem tendsto_linear_bound_rpow_inv
    {C : ℝ} (hC : 0 < C) :
    Tendsto
      (fun n : ℕ => ((((n + 1 : ℕ) : ℝ) * C) ^ ((n : ℝ)⁻¹)))
      atTop (𝓝 1) := by
  have hCroot :
      Tendsto (fun n : ℕ => C ^ ((n : ℝ)⁻¹)) atTop (𝓝 1) := by
    have hcont : ContinuousAt (fun t : ℝ => C ^ t) 0 :=
      Real.continuousAt_const_rpow hC.ne'
    have hzero : Tendsto (fun n : ℕ => (n : ℝ)⁻¹) atTop (𝓝 0) :=
      tendsto_inv_atTop_zero.comp tendsto_natCast_atTop_atTop
    have hroot := hcont.tendsto.comp hzero
    change Tendsto (fun n : ℕ => C ^ ((n : ℝ)⁻¹)) atTop (𝓝 (C ^ (0 : ℝ))) at hroot
    simpa [Real.rpow_zero] using hroot
  have hshiftReal :
      Tendsto (fun x : ℝ => x ^ ((1 : ℝ) / (1 * x + (-1)))) atTop (𝓝 1) :=
    tendsto_rpow_div_mul_add 1 1 (-1) zero_ne_one
  have hshiftNat :
      Tendsto (fun n : ℕ => (((n + 1 : ℕ) : ℝ) ^ ((n : ℝ)⁻¹)))
        atTop (𝓝 1) := by
    have hnatshift : Tendsto (fun n : ℕ => (n : ℝ) + 1) atTop atTop :=
      tendsto_atTop_add_const_right atTop 1 tendsto_natCast_atTop_atTop
    refine (hshiftReal.comp hnatshift).congr' ?_
    exact Eventually.of_forall fun n => by
      simp [Nat.cast_add, Nat.cast_one, one_div, add_assoc]
  have htarget :
      Tendsto
        (fun n : ℕ => ((((n + 1 : ℕ) : ℝ) * C) ^ ((n : ℝ)⁻¹)))
        atTop (𝓝 (1 * 1)) := by
    refine (hshiftNat.mul hCroot).congr' ?_
    exact Eventually.of_forall fun n => by
      have hn_nonneg : 0 ≤ ((n + 1 : ℕ) : ℝ) := by positivity
      have hmul :=
        (Real.mul_rpow (z := ((n : ℝ)⁻¹)) hn_nonneg (le_of_lt hC)).symm
      simpa [mul_comm, mul_left_comm, mul_assoc] using hmul
  simpa using htarget
 
private theorem add_le_root_bound_of_bounded_nat
    {K : Type*} [Field K] (v : AbsoluteValue K ℝ) {C : ℝ}
    (hC : ∀ n : ℕ, v (n : K) ≤ C) (x y : K)
    {n : ℕ} (hn : n ≠ 0) :
    v (x + y) ≤
      ((((n + 1 : ℕ) : ℝ) * C) ^ ((n : ℝ)⁻¹)) *
        max (v x) (v y) := by
  classical
  let M : ℝ := max (v x) (v y)
  have hC_pos : 0 < C :=
    zero_lt_one.trans_le (nat_bound_ge_one v hC)
  have hM_nonneg : 0 ≤ M :=
    (v.nonneg x).trans (le_max_left (v x) (v y))
  by_cases hMzero : M = 0
  · have hx_le_zero : v x ≤ 0 := by
      simpa [M, hMzero] using (le_max_left (v x) (v y))
    have hy_le_zero : v y ≤ 0 := by
      simpa [M, hMzero] using (le_max_right (v x) (v y))
    have hxzero : x = 0 := (v.eq_zero).mp (le_antisymm hx_le_zero (v.nonneg x))
    have hyzero : y = 0 := (v.eq_zero).mp (le_antisymm hy_le_zero (v.nonneg y))
    simp [hxzero, hyzero]
  · have hpow :
        (v (x + y)) ^ n ≤ ((n + 1 : ℕ) : ℝ) * C * M ^ n := by
      simpa [map_pow, M] using
        add_pow_le_of_bounded_nat v hC x y n
    have hright_nonneg :
        0 ≤ ((n + 1 : ℕ) : ℝ) * C * M ^ n := by
      exact mul_nonneg
        (mul_nonneg (by positivity) (le_of_lt hC_pos))
        (pow_nonneg hM_nonneg n)
    have hn_pos : 0 < (n : ℝ) := Nat.cast_pos.mpr (Nat.pos_of_ne_zero hn)
    have hroot :
        v (x + y) ≤
          (((n + 1 : ℕ) : ℝ) * C * M ^ n) ^ ((n : ℝ)⁻¹) := by
      rw [Real.le_rpow_inv_iff_of_pos (v.nonneg (x + y)) hright_nonneg hn_pos]
      simpa [Real.rpow_natCast] using hpow
    calc
      v (x + y)
          ≤ (((n + 1 : ℕ) : ℝ) * C * M ^ n) ^ ((n : ℝ)⁻¹) := hroot
      _ = ((((n + 1 : ℕ) : ℝ) * C) ^ ((n : ℝ)⁻¹)) * M := by
            have hcoef_nonneg : 0 ≤ ((n + 1 : ℕ) : ℝ) * C :=
              mul_nonneg (by positivity) (le_of_lt hC_pos)
            rw [Real.mul_rpow hcoef_nonneg (pow_nonneg hM_nonneg n)]
            rw [Real.pow_rpow_inv_natCast hM_nonneg hn]
      _ = ((((n + 1 : ℕ) : ℝ) * C) ^ ((n : ℝ)⁻¹)) *
            max (v x) (v y) := by
            rfl
 
private theorem isNonarchimedean_of_bounded_nat
    {K : Type*} [Field K] (v : AbsoluteValue K ℝ)
    (hnonarch : ∃ C : ℝ, ∀ n : ℕ, v (n : K) ≤ C) :
    IsNonarchimedean (v : K → ℝ) := by
  rcases hnonarch with ⟨C, hC⟩
  have hC_pos : 0 < C :=
    zero_lt_one.trans_le (nat_bound_ge_one v hC)
  intro x y
  let M : ℝ := max (v x) (v y)
  have hlim :
      Tendsto
        (fun n : ℕ =>
          ((((n + 1 : ℕ) : ℝ) * C) ^ ((n : ℝ)⁻¹)) * M)
        atTop (𝓝 M) := by
    simpa using
      (tendsto_linear_bound_rpow_inv hC_pos).mul
        (tendsto_const_nhds (x := M))
  have heventually :
      ∀ᶠ n : ℕ in atTop,
        v (x + y) ≤
          ((((n + 1 : ℕ) : ℝ) * C) ^ ((n : ℝ)⁻¹)) * M := by
    refine eventually_atTop.2 ⟨1, ?_⟩
    intro n hn
    exact add_le_root_bound_of_bounded_nat
      (v := v) hC x y (n := n) (by omega)
  have hle :
      v (x + y) ≤ M :=
    le_of_tendsto_of_tendsto tendsto_const_nhds hlim heventually
  simpa [M] using hle
 

theorem isNonarchimedean_iff_bounded_nat
    {K : Type*} [Field K] (v : AbsoluteValue K ℝ) :
    IsNonarchimedean (v : K → ℝ) ↔
      ∃ C : ℝ, ∀ n : ℕ, v (n : K) ≤ C := by
  constructor
  · intro h
    exact ⟨1, fun n => h.apply_natCast_le_one⟩
  · exact isNonarchimedean_of_bounded_nat v
end AbsoluteValue
end
end

/- ValuedFieldTheory.Valuation.AbsoluteValue.Completion -/
section
noncomputable section
open scoped Topology
namespace AbsoluteValue
universe u v w
 
noncomputable def completionAbsoluteValue
    {K : Type u} [Field K] (vK : AbsoluteValue K ℝ) :
    AbsoluteValue vK.Completion ℝ :=
  NormedField.toAbsoluteValue vK.Completion
 

@[simp]
theorem completionAbsoluteValue_coe
    {K : Type u} [Field K] (vK : AbsoluteValue K ℝ) (x : K) :
    completionAbsoluteValue vK (x : vK.Completion) = vK x := by
  change ‖(x : vK.Completion)‖ = vK x
  rw [UniformSpace.Completion.norm_coe]
  rfl
 
theorem completionAbsoluteValue_complete
    {K : Type u} [Field K] (vK : AbsoluteValue K ℝ) :
    CompleteSpace (WithAbs (completionAbsoluteValue vK)) := by
  let e := WithAbs.equiv (completionAbsoluteValue vK)
  have he : Isometry e :=
    AddMonoidHomClass.isometry_of_norm e.toRingHom fun _ ↦ rfl
  exact (completeSpace_congr (e := e.toEquiv) he.isUniformEmbedding).2 inferInstance
 
theorem completionAbsoluteValue_isNontrivial
    {K : Type u} [Field K] (vK : AbsoluteValue K ℝ)
    (hvK : vK.IsNontrivial) :
    (completionAbsoluteValue vK).IsNontrivial := by
  rcases hvK with ⟨x, hx0, hx1⟩
  refine ⟨(x : vK.Completion), ?_, ?_⟩
  · intro hx
    have hx' : (WithAbs.equiv vK).symm x = 0 :=
      UniformSpace.Completion.coe_injective (α := WithAbs vK) hx
    exact hx0 (by simpa using congrArg (WithAbs.equiv vK) hx')
  · simpa using hx1
 
noncomputable def toCompletion
    {K : Type u} [Field K] (vK : AbsoluteValue K ℝ) :
    K →+* vK.Completion :=
  UniformSpace.Completion.coeRingHom.comp
    (WithAbs.equiv vK).symm.toRingHom
 
@[simp]
theorem toCompletion_apply
    {K : Type u} [Field K] (vK : AbsoluteValue K ℝ) (x : K) :
    toCompletion vK x = ((WithAbs.equiv vK).symm x : vK.Completion) :=
  rfl
 
@[simp]
theorem toCompletion_eq_algebraMap
    {K : Type u} [Field K] (vK : AbsoluteValue K ℝ) (x : K) :
    toCompletion vK x = algebraMap K vK.Completion x :=
  rfl
 
theorem denseRange_toCompletion
    {K : Type u} [Field K] (vK : AbsoluteValue K ℝ) :
    DenseRange (toCompletion vK) := by
  change DenseRange
    (UniformSpace.Completion.coe' ∘ WithAbs.toAbs vK)
  exact
    (@UniformSpace.Completion.denseRange_coe (WithAbs vK) inferInstance).comp
      (WithAbs.toAbs_surjective vK).denseRange
      (@UniformSpace.Completion.continuous_coe (WithAbs vK) inferInstance)
private noncomputable def baseToExtensionCompletion
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (wL : AbsoluteValue L ℝ) :
    WithAbs vK →+* wL.Completion :=
  UniformSpace.Completion.coeRingHom.comp
    (algebraMap (WithAbs vK) (WithAbs wL))
private theorem baseToExtensionCompletion_norm
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (wL : AbsoluteValue L ℝ)
    (hw : Extends vK wL) (x : WithAbs vK) :
    ‖baseToExtensionCompletion vK wL x‖ = ‖x‖ := by
  change
    ‖((algebraMap (WithAbs vK) (WithAbs wL)) x : wL.Completion)‖ = ‖x‖
  rw [UniformSpace.Completion.norm_coe, WithAbs.norm_eq_apply_ofAbs,
    WithAbs.norm_eq_apply_ofAbs, WithAbs.ofAbs_algebraMap]
  exact hw x.ofAbs
private theorem baseToExtensionCompletion_isometry
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (wL : AbsoluteValue L ℝ)
    (hw : Extends vK wL) :
    Isometry (baseToExtensionCompletion vK wL) :=
  AddMonoidHomClass.isometry_of_norm _
    (baseToExtensionCompletion_norm vK wL hw)
 

noncomputable def completionMap
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (wL : AbsoluteValue L ℝ)
    (hw : Extends vK wL) :
    vK.Completion →+* wL.Completion :=
  (baseToExtensionCompletion_isometry vK wL hw).extensionHom
private theorem completionMap_withAbs_coe
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (wL : AbsoluteValue L ℝ)
    (hw : Extends vK wL) (x : WithAbs vK) :
    completionMap vK wL hw (x : vK.Completion) =
      baseToExtensionCompletion vK wL x :=
  (baseToExtensionCompletion_isometry vK wL hw).extensionHom_coe x
 

@[simp]
theorem completionMap_coe
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (wL : AbsoluteValue L ℝ)
    (hw : Extends vK wL) (x : K) :
    completionMap vK wL hw (algebraMap K vK.Completion x) =
      toCompletion wL (algebraMap K L x) := by
  change completionMap vK wL hw
      (((WithAbs.equiv vK).symm x : WithAbs vK) : vK.Completion) =
    (((WithAbs.equiv wL).symm (algebraMap K L x) : WithAbs wL) :
      wL.Completion)
  rw [completionMap_withAbs_coe]
  rfl
 
theorem completionMap_isometry
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (wL : AbsoluteValue L ℝ)
    (hw : Extends vK wL) :
    Isometry (completionMap vK wL hw) :=
  (baseToExtensionCompletion_isometry vK wL hw).completion_extension
 

noncomputable abbrev completionAlgebra
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (wL : AbsoluteValue L ℝ)
    (hw : Extends vK wL) :
    Algebra vK.Completion wL.Completion :=
  (completionMap vK wL hw).toAlgebra
 
@[simp]
theorem completionAlgebra_algebraMap
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (wL : AbsoluteValue L ℝ)
    (hw : Extends vK wL) (x : vK.Completion) :
    @algebraMap vK.Completion wL.Completion _ _
        (completionAlgebra vK wL hw) x = completionMap vK wL hw x :=
  rfl
 

noncomputable abbrev extensionCompletionAlgebra
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (wL : AbsoluteValue L ℝ) :
    Algebra K wL.Completion :=
  ((toCompletion wL).comp (algebraMap K L)).toAlgebra
 
noncomputable def toCompletionAlgHom
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (wL : AbsoluteValue L ℝ) :
    letI := extensionCompletionAlgebra (K := K) wL
    L →ₐ[K] wL.Completion := by
  letI := extensionCompletionAlgebra (K := K) wL
  exact
    { __ := toCompletion wL
      commutes' _ := rfl }
 
theorem completion_isScalarTower
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (wL : AbsoluteValue L ℝ)
    (hw : Extends vK wL) :
    letI hK := extensionCompletionAlgebra (K := K) wL
    letI : SMul K wL.Completion := hK.toSMul
    letI := completionAlgebra vK wL hw
    IsScalarTower K vK.Completion wL.Completion := by
  let hK := extensionCompletionAlgebra (K := K) wL
  let : SMul K wL.Completion := hK.toSMul
  let := completionAlgebra vK wL hw
  exact IsScalarTower.of_algebraMap_eq fun x ↦
    (completionMap_coe vK wL hw x).symm
 
theorem completionAbsoluteValue_isNonarchimedean
    {K : Type u} [Field K] (vK : AbsoluteValue K ℝ)
    (hvK : IsNonarchimedean (vK : K → ℝ)) :
    IsNonarchimedean
      (completionAbsoluteValue vK : vK.Completion → ℝ) := by
  rw [isNonarchimedean_iff_bounded_nat]
  refine ⟨1, fun n ↦ ?_⟩
  rw [← map_natCast (algebraMap K vK.Completion) n,
    ← toCompletion_eq_algebraMap vK (n : K)]
  change completionAbsoluteValue vK
    (((WithAbs.equiv vK).symm (n : K) : WithAbs vK) :
      vK.Completion) ≤ 1
  rw [completionAbsoluteValue_coe]
  exact hvK.apply_natCast_le_one
section CompleteTarget
variable {K : Type u} {D : Type w} [Field K] [Field D]
end CompleteTarget
section CompleteTargetTower
variable {K : Type u} {L : Type v} {D : Type w}
variable [Field K] [Field L] [Field D] [Algebra K L]
end CompleteTargetTower
end AbsoluteValue
end
end

/- ValuedFieldTheory.Valuation.AbsoluteValue.AlgebraicLocalization -/
section
noncomputable section
namespace AbsoluteValue
universe u v
 


noncomputable def algebraicLocalization
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (wL : AbsoluteValue L ℝ)
    (hw : Extends vK wL) :
    letI := completionAlgebra vK wL hw
    IntermediateField vK.Completion wL.Completion := by
  let := completionAlgebra vK wL hw
  exact IntermediateField.adjoin vK.Completion
    (Set.range (toCompletion wL))
private theorem toCompletion_mem_algebraicLocalization
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (wL : AbsoluteValue L ℝ)
    (hw : Extends vK wL) (x : L) :
    letI := completionAlgebra vK wL hw
    toCompletion wL x ∈ algebraicLocalization vK wL hw := by
  let := completionAlgebra vK wL hw
  exact IntermediateField.subset_adjoin vK.Completion _ ⟨x, rfl⟩
 
noncomputable def toAlgebraicLocalization
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (wL : AbsoluteValue L ℝ)
    (hw : Extends vK wL) :
    letI := completionAlgebra vK wL hw
    L →+* algebraicLocalization vK wL hw := by
  letI := completionAlgebra vK wL hw
  exact RingHom.codRestrict (toCompletion wL)
    (algebraicLocalization vK wL hw)
    (toCompletion_mem_algebraicLocalization vK wL hw)
 

theorem algebraicLocalization_isAlgebraic
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    [Algebra.IsAlgebraic K L]
    (vK : AbsoluteValue K ℝ) (wL : AbsoluteValue L ℝ)
    (hw : Extends vK wL) :
    letI := completionAlgebra vK wL hw
    Algebra.IsAlgebraic vK.Completion
      (algebraicLocalization vK wL hw) := by
  let hK := extensionCompletionAlgebra (K := K) wL
  let : SMul K wL.Completion := hK.toSMul
  let := completionAlgebra vK wL hw
  let : IsScalarTower K vK.Completion wL.Completion :=
    completion_isScalarTower vK wL hw
  apply IntermediateField.isAlgebraic_adjoin
  intro z hz
  rcases hz with ⟨x, rfl⟩
  have hx : IsIntegral K x :=
    isAlgebraic_iff_isIntegral.mp (Algebra.IsAlgebraic.isAlgebraic x)
  let : IsScalarTower K K wL.Completion :=
    IsScalarTower.of_algebraMap_eq' rfl
  have hx' : IsIntegral K (toCompletion wL x) :=
    hx.map (toCompletionAlgHom (K := K) wL)
  exact IsIntegral.tower_top (A := vK.Completion) hx'
 

noncomputable def algebraicLocalizationAbsoluteValue
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (wL : AbsoluteValue L ℝ)
    (hw : Extends vK wL) :
    letI := completionAlgebra vK wL hw
    AbsoluteValue (algebraicLocalization vK wL hw) ℝ := by
  letI := completionAlgebra vK wL hw
  exact (completionAbsoluteValue wL).comp
    (algebraicLocalization vK wL hw).val.injective
 
theorem algebraicLocalizationAbsoluteValue_extends
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (wL : AbsoluteValue L ℝ)
    (hw : Extends vK wL) :
    letI := completionAlgebra vK wL hw
    Extends (completionAbsoluteValue vK)
      (algebraicLocalizationAbsoluteValue vK wL hw) := by
  let := completionAlgebra vK wL hw
  intro x
  change ‖completionMap vK wL hw x‖ = ‖x‖
  exact (completionMap_isometry vK wL hw).norm_map_of_map_zero
    (map_zero _) x
 
@[simp]
theorem algebraicLocalizationAbsoluteValue_toAlgebraicLocalization
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (wL : AbsoluteValue L ℝ)
    (hw : Extends vK wL) (x : L) :
    letI := completionAlgebra vK wL hw
    algebraicLocalizationAbsoluteValue vK wL hw
        (toAlgebraicLocalization vK wL hw x) = wL x := by
  let := completionAlgebra vK wL hw
  change ‖((WithAbs.equiv wL).symm x : wL.Completion)‖ = wL x
  rw [UniformSpace.Completion.norm_coe]
  rfl
 

@[simp]
theorem toAlgebraicLocalization_algebraMap
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (wL : AbsoluteValue L ℝ)
    (hw : Extends vK wL) (x : K) :
    letI := completionAlgebra vK wL hw
    toAlgebraicLocalization vK wL hw (algebraMap K L x) =
      algebraMap vK.Completion (algebraicLocalization vK wL hw)
        (algebraMap K vK.Completion x) := by
  let := completionAlgebra vK wL hw
  apply Subtype.ext
  exact (completionMap_coe vK wL hw x).symm
end AbsoluteValue
end
end

/- ValuedFieldTheory.Valuation.AbsoluteValue.Ostrowski -/
section
noncomputable section
open Filter
namespace AbsoluteValue
private theorem ostrowski_isNonarchimedean_of_charP_pos
    {K : Type*} [Field K] (v : AbsoluteValue K ℝ) {p : ℕ}
    [CharP K p] (hp : p ≠ 0) :
    IsNonarchimedean (v : K → ℝ) := by
  rw [isNonarchimedean_iff_bounded_nat]
  refine ⟨(p : ℝ), fun n => ?_⟩
  have hp_pos : 0 < p := Nat.pos_of_ne_zero hp
  calc
    v (n : K) = v ((n % p : ℕ) : K) := by
      congr 1
      exact CharP.natCast_eq_natCast_mod K p n
    _ ≤ ((n % p : ℕ) : ℝ) := v.apply_nat_le_self (n % p)
    _ ≤ (p : ℝ) := by
      exact_mod_cast (Nat.mod_lt n hp_pos).le
 


theorem charZero_of_not_isNonarchimedean
    {K : Type*} [Field K] (v : AbsoluteValue K ℝ)
    (harch : ¬ IsNonarchimedean (v : K → ℝ)) :
    CharZero K := by
  obtain ⟨p, hpchar⟩ := CharP.exists K
  have : CharP K p := hpchar
  rcases CharP.char_is_prime_or_zero K p with hprime | hp0
  · exact (harch
      (ostrowski_isNonarchimedean_of_charP_pos
        (K := K) v hprime.ne_zero)).elim
  · have : CharP K 0 := by
      simpa [hp0] using hpchar
    exact CharP.charP_to_charZero K
private instance ostrowski_withAbsCharZero
    {K : Type*} [Field K] [CharZero K] (v : AbsoluteValue K ℝ) :
    CharZero (WithAbs v) :=
  ((WithAbs.equiv v).toRingHom.charZero_iff
    (WithAbs.equiv v).injective).mpr inferInstance
 

private noncomputable def ostrowski_restrictRatAbsoluteValue
    {K : Type*} [Field K] [CharZero K] (v : AbsoluteValue K ℝ) :
    AbsoluteValue ℚ ℝ :=
  v.comp (f := Rat.castHom K) Rat.cast_injective
@[simp]
private theorem ostrowski_restrictRatAbsoluteValue_apply
    {K : Type*} [Field K] [CharZero K] (v : AbsoluteValue K ℝ) (q : ℚ) :
    ostrowski_restrictRatAbsoluteValue (K := K) v q = v (q : K) :=
  rfl
 

private theorem ostrowski_isNonarchimedean_of_restrictRat
    {K : Type*} [Field K] [CharZero K] (v : AbsoluteValue K ℝ)
    (h : IsNonarchimedean
      (ostrowski_restrictRatAbsoluteValue (K := K) v : ℚ → ℝ)) :
    IsNonarchimedean (v : K → ℝ) := by
  rw [isNonarchimedean_iff_bounded_nat] at h ⊢
  rcases h with ⟨C, hC⟩
  refine ⟨C, fun n => ?_⟩
  simpa using hC n
 

private theorem ostrowski_restrictRat_not_isNonarchimedean
    {K : Type*} [Field K] [CharZero K] (v : AbsoluteValue K ℝ)
    (harch : ¬ IsNonarchimedean (v : K → ℝ)) :
    ¬ IsNonarchimedean
      (ostrowski_restrictRatAbsoluteValue (K := K) v : ℚ → ℝ) := by
  intro hnonarch
  exact harch
    (ostrowski_isNonarchimedean_of_restrictRat
      (K := K) v hnonarch)
 
private theorem ostrowski_restrictRat_isEquiv_real_of_not_isNonarchimedean
    {K : Type*} [Field K] [CharZero K] (v : AbsoluteValue K ℝ)
    (harch : ¬ IsNonarchimedean (v : K → ℝ)) :
    (ostrowski_restrictRatAbsoluteValue (K := K) v).IsEquiv
      Rat.AbsoluteValue.real := by
  have harch_rat :=
    ostrowski_restrictRat_not_isNonarchimedean
      (K := K) v harch
  refine Rat.AbsoluteValue.equiv_real_of_unbounded ?_
  intro hbounded
  exact harch_rat ((isNonarchimedean_iff_bounded_nat _).2 ⟨1, hbounded⟩)
 


private theorem ostrowski_restrictRat_exists_rpow_eq_real_of_not_isNonarchimedean
    {K : Type*} [Field K] [CharZero K] (v : AbsoluteValue K ℝ)
    (harch : ¬ IsNonarchimedean (v : K → ℝ)) :
    ∃ c : ℝ, 0 < c ∧
      ∀ q : ℚ,
        (ostrowski_restrictRatAbsoluteValue (K := K) v q) ^ c =
          Rat.AbsoluteValue.real q := by
  rcases (AbsoluteValue.isEquiv_iff_exists_rpow_eq).mp
      (ostrowski_restrictRat_isEquiv_real_of_not_isNonarchimedean
        (K := K) v harch) with
    ⟨c, hc_pos, hc⟩
  refine ⟨c, hc_pos, fun q => ?_⟩
  exact congrFun hc q
 


private theorem ostrowski_restrictRat_exists_real_rpow_eq_of_not_isNonarchimedean
    {K : Type*} [Field K] [CharZero K] (v : AbsoluteValue K ℝ)
    (harch : ¬ IsNonarchimedean (v : K → ℝ)) :
    ∃ s : ℝ, 0 < s ∧ s ≤ 1 ∧
      ∀ q : ℚ,
        ostrowski_restrictRatAbsoluteValue (K := K) v q =
          Rat.AbsoluteValue.real q ^ s := by
  rcases ostrowski_restrictRat_exists_rpow_eq_real_of_not_isNonarchimedean
      (K := K) v harch with
    ⟨c, hc_pos, hc⟩
  refine ⟨c⁻¹, inv_pos.mpr hc_pos, ?_, fun q => ?_⟩
  · have htwo_le :
        (2 : ℝ) ^ c⁻¹ ≤ (2 : ℝ) ^ (1 : ℝ) := by
      have happly :
          ostrowski_restrictRatAbsoluteValue (K := K) v (2 : ℚ) ≤ (2 : ℝ) :=
        (ostrowski_restrictRatAbsoluteValue (K := K) v).apply_nat_le_self 2
      have hq :=
        (Real.rpow_inv_eq
          ((Rat.AbsoluteValue.real).nonneg (2 : ℚ))
          ((ostrowski_restrictRatAbsoluteValue (K := K) v).nonneg (2 : ℚ))
          hc_pos.ne').2 (hc (2 : ℚ)).symm
      rw [← hq] at happly
      simpa [Rat.AbsoluteValue.real_eq_abs, Real.rpow_one] using happly
    exact (Real.rpow_le_rpow_left_iff one_lt_two).mp htwo_le
  · have hq :=
      (Real.rpow_inv_eq
        ((Rat.AbsoluteValue.real).nonneg q)
        ((ostrowski_restrictRatAbsoluteValue (K := K) v).nonneg q)
        hc_pos.ne').2 (hc q).symm
    exact hq.symm
 
private theorem ostrowski_exists_rat_pos_rpow_lt
    {s ε : ℝ} (hs : 0 < s) (hε : 0 < ε) :
    ∃ δ : ℚ, (0 : ℚ) < δ ∧ ((δ : ℝ) ^ s < ε) := by
  let η : ℝ := ε ^ s⁻¹
  have hη_pos : 0 < η := Real.rpow_pos_of_pos hε s⁻¹
  obtain ⟨δ, hδ0, hδη⟩ := exists_rat_btwn hη_pos
  refine ⟨δ, ?_, ?_⟩
  · exact_mod_cast hδ0
  · have hδ_nonneg : 0 ≤ (δ : ℝ) := le_of_lt hδ0
    have hlt : ((δ : ℝ) ^ s) < η ^ s :=
      Real.rpow_lt_rpow hδ_nonneg hδη hs
    have hηpow : η ^ s = ε := by
      dsimp [η]
      rw [← Real.rpow_mul (le_of_lt hε)]
      rw [inv_mul_cancel₀ hs.ne', Real.rpow_one]
    simpa [hηpow] using hlt
 


private theorem ostrowski_ratCast_withAbs_norm_eq_of_real_rpow
    {K : Type*} [Field K] [CharZero K] (v : AbsoluteValue K ℝ)
    (s : ℝ)
    (hnorm : ∀ q : ℚ,
      ostrowski_restrictRatAbsoluteValue (K := K) v q =
        Rat.AbsoluteValue.real q ^ s)
    (q : ℚ) :
    ‖Rat.castHom (WithAbs v) q‖ = ‖(q : ℝ)‖ ^ s := by
  change v (q : K) = ‖(q : ℝ)‖ ^ s
  rw [← ostrowski_restrictRatAbsoluteValue_apply (K := K) v q, hnorm q]
  rw [Rat.AbsoluteValue.real_eq_abs, Real.norm_eq_abs, Rat.cast_abs]
 


private def ostrowski_ratCauSeqMapWithAbs_of_real_rpow
    {K : Type*} [Field K] [CharZero K] (v : AbsoluteValue K ℝ)
    (s : ℝ) (hs : 0 < s)
    (hnorm : ∀ q : ℚ,
      ostrowski_restrictRatAbsoluteValue (K := K) v q =
        Rat.AbsoluteValue.real q ^ s)
    (u : CauSeq ℚ (abs : ℚ → ℚ)) :
    CauSeq (WithAbs v) (norm : WithAbs v → ℝ) where
  val n := Rat.castHom (WithAbs v) (u n)
  property := by
    intro ε hε
    obtain ⟨δ, hδ0, hδε⟩ := ostrowski_exists_rat_pos_rpow_lt hs hε
    obtain ⟨N, hN⟩ := u.2 δ hδ0
    refine ⟨N, fun j hj => ?_⟩
    have hsource : abs (u j - u N) < δ := hN j hj
    have hsource_real : ((abs (u j - u N) : ℚ) : ℝ) < (δ : ℝ) := by
      exact_mod_cast hsource
    have hpow :
        ((abs (u j - u N) : ℚ) : ℝ) ^ s < (δ : ℝ) ^ s :=
      Real.rpow_lt_rpow (by positivity) hsource_real hs
    calc
      ‖Rat.castHom (WithAbs v) (u j) -
          Rat.castHom (WithAbs v) (u N)‖
          = ‖Rat.castHom (WithAbs v) (u j - u N)‖ := by
            rw [map_sub]
      _ = ‖((u j - u N : ℚ) : ℝ)‖ ^ s :=
          ostrowski_ratCast_withAbs_norm_eq_of_real_rpow
            (K := K) v s hnorm (u j - u N)
      _ = ((abs (u j - u N) : ℚ) : ℝ) ^ s := by
          rw [Real.norm_eq_abs, Rat.cast_abs]
      _ < ε := hpow.trans hδε
@[simp]
private theorem ostrowski_ratCauSeqMapWithAbs_zero_of_real_rpow
    {K : Type*} [Field K] [CharZero K] (v : AbsoluteValue K ℝ)
    (s : ℝ) (hs : 0 < s)
    (hnorm : ∀ q : ℚ,
      ostrowski_restrictRatAbsoluteValue (K := K) v q =
        Rat.AbsoluteValue.real q ^ s) :
    ostrowski_ratCauSeqMapWithAbs_of_real_rpow
      (K := K) v s hs hnorm (0 : CauSeq ℚ (abs : ℚ → ℚ)) = 0 := by
  ext n
  simp [ostrowski_ratCauSeqMapWithAbs_of_real_rpow]
@[simp]
private theorem ostrowski_ratCauSeqMapWithAbs_one_of_real_rpow
    {K : Type*} [Field K] [CharZero K] (v : AbsoluteValue K ℝ)
    (s : ℝ) (hs : 0 < s)
    (hnorm : ∀ q : ℚ,
      ostrowski_restrictRatAbsoluteValue (K := K) v q =
        Rat.AbsoluteValue.real q ^ s) :
    ostrowski_ratCauSeqMapWithAbs_of_real_rpow
      (K := K) v s hs hnorm (1 : CauSeq ℚ (abs : ℚ → ℚ)) = 1 := by
  ext n
  simp [ostrowski_ratCauSeqMapWithAbs_of_real_rpow]
@[simp]
private theorem ostrowski_ratCauSeqMapWithAbs_add_of_real_rpow
    {K : Type*} [Field K] [CharZero K] (v : AbsoluteValue K ℝ)
    (s : ℝ) (hs : 0 < s)
    (hnorm : ∀ q : ℚ,
      ostrowski_restrictRatAbsoluteValue (K := K) v q =
        Rat.AbsoluteValue.real q ^ s)
    (u t : CauSeq ℚ (abs : ℚ → ℚ)) :
    ostrowski_ratCauSeqMapWithAbs_of_real_rpow
      (K := K) v s hs hnorm (u + t) =
        ostrowski_ratCauSeqMapWithAbs_of_real_rpow
          (K := K) v s hs hnorm u +
        ostrowski_ratCauSeqMapWithAbs_of_real_rpow
          (K := K) v s hs hnorm t := by
  ext n
  change Rat.castHom (WithAbs v) (u n + t n) =
    Rat.castHom (WithAbs v) (u n) + Rat.castHom (WithAbs v) (t n)
  exact (Rat.castHom (WithAbs v)).map_add (u n) (t n)
@[simp]
private theorem ostrowski_ratCauSeqMapWithAbs_mul_of_real_rpow
    {K : Type*} [Field K] [CharZero K] (v : AbsoluteValue K ℝ)
    (s : ℝ) (hs : 0 < s)
    (hnorm : ∀ q : ℚ,
      ostrowski_restrictRatAbsoluteValue (K := K) v q =
        Rat.AbsoluteValue.real q ^ s)
    (u t : CauSeq ℚ (abs : ℚ → ℚ)) :
    ostrowski_ratCauSeqMapWithAbs_of_real_rpow
      (K := K) v s hs hnorm (u * t) =
        ostrowski_ratCauSeqMapWithAbs_of_real_rpow
          (K := K) v s hs hnorm u *
        ostrowski_ratCauSeqMapWithAbs_of_real_rpow
          (K := K) v s hs hnorm t := by
  ext n
  change Rat.castHom (WithAbs v) (u n * t n) =
    Rat.castHom (WithAbs v) (u n) * Rat.castHom (WithAbs v) (t n)
  exact (Rat.castHom (WithAbs v)).map_mul (u n) (t n)
private theorem ostrowski_ratCauSeqMapWithAbs_equiv_of_real_rpow
    {K : Type*} [Field K] [CharZero K] (v : AbsoluteValue K ℝ)
    (s : ℝ) (hs : 0 < s)
    (hnorm : ∀ q : ℚ,
      ostrowski_restrictRatAbsoluteValue (K := K) v q =
        Rat.AbsoluteValue.real q ^ s)
    {u t : CauSeq ℚ (abs : ℚ → ℚ)} (hut : u ≈ t) :
    ostrowski_ratCauSeqMapWithAbs_of_real_rpow
      (K := K) v s hs hnorm u ≈
        ostrowski_ratCauSeqMapWithAbs_of_real_rpow
          (K := K) v s hs hnorm t := by
  intro ε hε
  obtain ⟨δ, hδ0, hδε⟩ := ostrowski_exists_rat_pos_rpow_lt hs hε
  obtain ⟨N, hN⟩ := hut δ hδ0
  refine ⟨N, fun j hj => ?_⟩
  have hsource : abs ((u - t) j) < δ := hN j hj
  have hsource_real : ((abs ((u - t) j) : ℚ) : ℝ) < (δ : ℝ) := by
    exact_mod_cast hsource
  have hpow :
      ((abs ((u - t) j) : ℚ) : ℝ) ^ s < (δ : ℝ) ^ s :=
    Real.rpow_lt_rpow (by positivity) hsource_real hs
  calc
    ‖((ostrowski_ratCauSeqMapWithAbs_of_real_rpow
        (K := K) v s hs hnorm u -
      ostrowski_ratCauSeqMapWithAbs_of_real_rpow
        (K := K) v s hs hnorm t) j)‖
        = ‖Rat.castHom (WithAbs v) ((u - t) j)‖ := by
          change ‖Rat.castHom (WithAbs v) (u j) - Rat.castHom (WithAbs v) (t j)‖ =
            ‖Rat.castHom (WithAbs v) (u j - t j)‖
          exact (congrArg (fun z : WithAbs v => ‖z‖)
            ((Rat.castHom (WithAbs v)).map_sub (u j) (t j))).symm
    _ = ‖(((u - t) j : ℚ) : ℝ)‖ ^ s :=
        ostrowski_ratCast_withAbs_norm_eq_of_real_rpow
          (K := K) v s hnorm ((u - t) j)
    _ = ((abs ((u - t) j) : ℚ) : ℝ) ^ s := by
        rw [Real.norm_eq_abs, Rat.cast_abs]
    _ < ε := hpow.trans hδε
 
private theorem ostrowski_cauSeq_isComplete_withAbs_of_complete
    {K : Type*} [Field K] (v : AbsoluteValue K ℝ)
    (hcomplete : CompleteSpace (WithAbs v)) :
    CauSeq.IsComplete (WithAbs v) (norm : WithAbs v → ℝ) := by
  let : CompleteSpace (WithAbs v) :=
    hcomplete
  refine ⟨fun s => ?_⟩
  obtain ⟨a, ha⟩ := cauchySeq_tendsto_of_complete (CauSeq.cauchySeq s)
  refine ⟨a, ?_⟩
  rw [Metric.tendsto_atTop] at ha
  intro ε hε
  obtain ⟨N, hN⟩ := ha ε hε
  refine ⟨N, fun j hj => ?_⟩
  simpa [dist_eq_norm] using hN j hj
 


private theorem ostrowski_real_mk_tendsto_ratCauSeq
    (s : CauSeq ℚ (abs : ℚ → ℚ)) :
    Tendsto (fun n => (s n : ℝ)) atTop (nhds (Real.mk s)) := by
  rw [Metric.tendsto_atTop]
  intro ε hε
  obtain ⟨δ, hδ0, hδε⟩ := exists_rat_btwn hε
  have hδq : (0 : ℚ) < δ := by exact_mod_cast hδ0
  obtain ⟨N, hN⟩ := s.cauchy₂ hδq
  refine ⟨N, fun n hn => ?_⟩
  rw [Real.dist_eq, abs_sub_comm]
  have hnear :
      |Real.mk s - (s n : ℝ)| ≤ (δ : ℝ) :=
    Real.mk_near_of_forall_near
      (f := s) (x := (s n : ℝ)) (ε := (δ : ℝ))
      ⟨N, fun j hj => ?_⟩
  · exact hnear.trans_lt hδε
  · have hsource : abs (s j - s n) < δ := hN j hj n hn
    have hsource_real : ((abs (s j - s n) : ℚ) : ℝ) < (δ : ℝ) := by
      exact_mod_cast hsource
    rw [← Rat.cast_sub, ← Rat.cast_abs]
    exact hsource_real.le
 

private noncomputable def ostrowski_ratCauSeqCompletionEmbedding_of_real_rpow
    {K : Type*} [Field K] [CharZero K] (v : AbsoluteValue K ℝ)
    (hcomplete : CompleteSpace (WithAbs v))
    (s : ℝ) (hs : 0 < s)
    (hnorm : ∀ q : ℚ,
      ostrowski_restrictRatAbsoluteValue (K := K) v q =
        Rat.AbsoluteValue.real q ^ s) :
    CauSeq.Completion.Cauchy (abs : ℚ → ℚ) →+* WithAbs v := by
  letI : CauSeq.IsComplete (WithAbs v) (norm : WithAbs v → ℝ) :=
    ostrowski_cauSeq_isComplete_withAbs_of_complete v hcomplete
  exact
    { toFun := fun x =>
        Quotient.liftOn x
          (fun u =>
            CauSeq.lim
              (ostrowski_ratCauSeqMapWithAbs_of_real_rpow
                (K := K) v s hs hnorm u))
          (fun u t hut =>
            CauSeq.lim_eq_lim_of_equiv
              (ostrowski_ratCauSeqMapWithAbs_equiv_of_real_rpow
                (K := K) v s hs hnorm hut))
      map_zero' := by
        change CauSeq.lim
          (ostrowski_ratCauSeqMapWithAbs_of_real_rpow
            (K := K) v s hs hnorm (0 : CauSeq ℚ (abs : ℚ → ℚ))) = 0
        rw [ostrowski_ratCauSeqMapWithAbs_zero_of_real_rpow]
        change CauSeq.lim (CauSeq.const (norm : WithAbs v → ℝ) 0) = 0
        rw [CauSeq.lim_const]
      map_one' := by
        change CauSeq.lim
          (ostrowski_ratCauSeqMapWithAbs_of_real_rpow
            (K := K) v s hs hnorm (1 : CauSeq ℚ (abs : ℚ → ℚ))) = 1
        rw [ostrowski_ratCauSeqMapWithAbs_one_of_real_rpow]
        change CauSeq.lim (CauSeq.const (norm : WithAbs v → ℝ) 1) = 1
        rw [CauSeq.lim_const]
      map_add' := by
        intro x y
        refine Quotient.inductionOn₂ x y ?_
        intro u t
        change CauSeq.lim
          (ostrowski_ratCauSeqMapWithAbs_of_real_rpow
            (K := K) v s hs hnorm (u + t)) =
          CauSeq.lim
            (ostrowski_ratCauSeqMapWithAbs_of_real_rpow
              (K := K) v s hs hnorm u) +
          CauSeq.lim
            (ostrowski_ratCauSeqMapWithAbs_of_real_rpow
              (K := K) v s hs hnorm t)
        rw [ostrowski_ratCauSeqMapWithAbs_add_of_real_rpow,
          ← CauSeq.lim_add]
      map_mul' := by
        intro x y
        refine Quotient.inductionOn₂ x y ?_
        intro u t
        change CauSeq.lim
          (ostrowski_ratCauSeqMapWithAbs_of_real_rpow
            (K := K) v s hs hnorm (u * t)) =
          CauSeq.lim
            (ostrowski_ratCauSeqMapWithAbs_of_real_rpow
              (K := K) v s hs hnorm u) *
          CauSeq.lim
            (ostrowski_ratCauSeqMapWithAbs_of_real_rpow
              (K := K) v s hs hnorm t)
        rw [ostrowski_ratCauSeqMapWithAbs_mul_of_real_rpow,
          ← CauSeq.lim_mul_lim] }
 

private noncomputable def ostrowski_realEmbedding_of_real_rpow
    {K : Type*} [Field K] [CharZero K] (v : AbsoluteValue K ℝ)
    (hcomplete : CompleteSpace (WithAbs v))
    (s : ℝ) (hs : 0 < s)
    (hnorm : ∀ q : ℚ,
      ostrowski_restrictRatAbsoluteValue (K := K) v q =
        Rat.AbsoluteValue.real q ^ s) :
    ℝ →+* WithAbs v :=
  (ostrowski_ratCauSeqCompletionEmbedding_of_real_rpow
    (K := K) v hcomplete s hs hnorm).comp Real.ringEquivCauchy.toRingHom
@[simp]
private theorem ostrowski_ratCauSeqCompletionEmbedding_norm_mk_of_real_rpow
    {K : Type*} [Field K] [CharZero K] (v : AbsoluteValue K ℝ)
    (hcomplete : CompleteSpace (WithAbs v))
    (s : ℝ) (hs : 0 < s)
    (hnorm : ∀ q : ℚ,
      ostrowski_restrictRatAbsoluteValue (K := K) v q =
        Rat.AbsoluteValue.real q ^ s)
    (u : CauSeq ℚ (abs : ℚ → ℚ)) :
    ‖ostrowski_ratCauSeqCompletionEmbedding_of_real_rpow
      (K := K) v hcomplete s hs hnorm (CauSeq.Completion.mk u)‖ =
      ‖Real.mk u‖ ^ s := by
  let : CauSeq.IsComplete (WithAbs v) (norm : WithAbs v → ℝ) :=
    ostrowski_cauSeq_isComplete_withAbs_of_complete v hcomplete
  change ‖CauSeq.lim
      (ostrowski_ratCauSeqMapWithAbs_of_real_rpow
        (K := K) v s hs hnorm u)‖ = ‖Real.mk u‖ ^ s
  have hK :
      Tendsto
        (fun n =>
          ‖ostrowski_ratCauSeqMapWithAbs_of_real_rpow
            (K := K) v s hs hnorm u n‖)
        atTop
        (nhds ‖CauSeq.lim
          (ostrowski_ratCauSeqMapWithAbs_of_real_rpow
            (K := K) v s hs hnorm u)‖) :=
    tendsto_norm.comp
      (CauSeq.tendsto_limit
        (ostrowski_ratCauSeqMapWithAbs_of_real_rpow
          (K := K) v s hs hnorm u))
  have hK' :
      Tendsto (fun n => ‖(u n : ℝ)‖ ^ s) atTop
        (nhds ‖CauSeq.lim
          (ostrowski_ratCauSeqMapWithAbs_of_real_rpow
            (K := K) v s hs hnorm u)‖) := by
    convert hK using 1
    ext n
    change ‖(u n : ℝ)‖ ^ s = ‖Rat.castHom (WithAbs v) (u n)‖
    exact (ostrowski_ratCast_withAbs_norm_eq_of_real_rpow
      (K := K) v s hnorm (u n)).symm
  have hRnorm :
      Tendsto (fun n => ‖(u n : ℝ)‖) atTop (nhds ‖Real.mk u‖) :=
    tendsto_norm.comp (ostrowski_real_mk_tendsto_ratCauSeq u)
  have hR :
      Tendsto (fun n => ‖(u n : ℝ)‖ ^ s) atTop (nhds (‖Real.mk u‖ ^ s)) :=
    hRnorm.rpow_const (Or.inr hs.le)
  exact tendsto_nhds_unique hK' hR
private theorem ostrowski_realEmbedding_norm_eq_of_real_rpow
    {K : Type*} [Field K] [CharZero K] (v : AbsoluteValue K ℝ)
    (hcomplete : CompleteSpace (WithAbs v))
    (s : ℝ) (hs : 0 < s)
    (hnorm : ∀ q : ℚ,
      ostrowski_restrictRatAbsoluteValue (K := K) v q =
        Rat.AbsoluteValue.real q ^ s)
    (r : ℝ) :
    ‖ostrowski_realEmbedding_of_real_rpow
      (K := K) v hcomplete s hs hnorm r‖ = ‖r‖ ^ s := by
  induction r using Real.ind_mk with
  | h u =>
      change ‖ostrowski_ratCauSeqCompletionEmbedding_of_real_rpow
        (K := K) v hcomplete s hs hnorm (CauSeq.Completion.mk u)‖ =
        ‖Real.mk u‖ ^ s
      exact ostrowski_ratCauSeqCompletionEmbedding_norm_mk_of_real_rpow
        (K := K) v hcomplete s hs hnorm u
 



private noncomputable abbrev ostrowski_realAlgebra_of_real_rpow
    {K : Type*} [Field K] [CharZero K] (v : AbsoluteValue K ℝ)
    (hcomplete : CompleteSpace (WithAbs v))
    (s : ℝ) (hs : 0 < s)
    (hnorm : ∀ q : ℚ,
      ostrowski_restrictRatAbsoluteValue (K := K) v q =
        Rat.AbsoluteValue.real q ^ s) :
    Algebra ℝ (WithAbs v) :=
  (ostrowski_realEmbedding_of_real_rpow
    (K := K) v hcomplete s hs hnorm).toAlgebra
private theorem ostrowski_realAlgebra_norm_algebraMap_of_real_rpow
    {K : Type*} [Field K] [CharZero K] (v : AbsoluteValue K ℝ)
    (hcomplete : CompleteSpace (WithAbs v))
    (s : ℝ) (hs : 0 < s)
    (hnorm : ∀ q : ℚ,
      ostrowski_restrictRatAbsoluteValue (K := K) v q =
        Rat.AbsoluteValue.real q ^ s) :
    letI : Algebra ℝ (WithAbs v) :=
      ostrowski_realAlgebra_of_real_rpow (K := K) v hcomplete s hs hnorm
    ∀ r : ℝ, ‖algebraMap ℝ (WithAbs v) r‖ = ‖r‖ ^ s := by
  let : Algebra ℝ (WithAbs v) :=
    ostrowski_realAlgebra_of_real_rpow (K := K) v hcomplete s hs hnorm
  intro r
  change ‖ostrowski_realEmbedding_of_real_rpow
    (K := K) v hcomplete s hs hnorm r‖ = ‖r‖ ^ s
  exact ostrowski_realEmbedding_norm_eq_of_real_rpow
    (K := K) v hcomplete s hs hnorm r
section RealRpowGelfandMazur
open Polynomial
open Bornology Filter Set Topology
variable {F : Type*} [NormedField F] [Algebra ℝ F]
 


private theorem ostrowski_continuous_algebraMap_of_real_rpow
    {s : ℝ} (hs : 0 < s)
    (hnorm : ∀ r : ℝ, ‖algebraMap ℝ F r‖ = ‖r‖ ^ s) :
    Continuous (algebraMap ℝ F) := by
  rw [Metric.continuous_iff]
  intro r ε hε
  obtain ⟨δ, hδ0, hδε⟩ := ostrowski_exists_rat_pos_rpow_lt hs hε
  refine ⟨(δ : ℝ), by exact_mod_cast hδ0, fun y hy => ?_⟩
  have hdist : ‖y - r‖ < (δ : ℝ) := by
    simpa [Real.dist_eq, dist_eq_norm] using hy
  have hpow : ‖y - r‖ ^ s < (δ : ℝ) ^ s :=
    Real.rpow_lt_rpow (norm_nonneg _) hdist hs
  calc
    dist (algebraMap ℝ F y) (algebraMap ℝ F r)
        = ‖algebraMap ℝ F (y - r)‖ := by
          rw [dist_eq_norm, map_sub]
    _ = ‖y - r‖ ^ s := hnorm (y - r)
    _ < ε := hpow.trans hδε
private theorem ostrowski_tendsto_norm_rpow_cobounded_atTop
    {s : ℝ} (hs : 0 < s) :
    Tendsto (fun r : ℝ => ‖r‖ ^ s) (cobounded ℝ) atTop :=
  (tendsto_rpow_atTop hs).comp tendsto_norm_cobounded_atTop
private theorem ostrowski_tendsto_norm_rpow_fst_atTop
    {s : ℝ} (hs : 0 < s) :
    Tendsto (fun y : ℝ × ℝ => ‖y.1‖ ^ s) (cobounded ℝ ×ˢ ⊤) atTop :=
  (tendsto_rpow_atTop hs).comp
    (by
      rw [tendsto_norm_atTop_iff_cobounded]
      exact tendsto_fst)
private theorem ostrowski_tendsto_norm_rpow_snd_atTop
    {s : ℝ} (hs : 0 < s) (S : Set ℝ) :
    Tendsto (fun y : ℝ × ℝ => ‖y.2‖ ^ s) (𝓟 S ×ˢ cobounded ℝ) atTop :=
  (tendsto_rpow_atTop hs).comp
    (by
      rw [tendsto_norm_atTop_iff_cobounded]
      exact tendsto_snd)
 

private abbrev ostrowski_realRpowPhi (x : F) (u : ℝ × ℝ) : F :=
  x ^ 2 - algebraMap ℝ F u.1 * x + algebraMap ℝ F u.2
private theorem ostrowski_continuous_realRpowPhi
    {s : ℝ} (hs : 0 < s)
    (hnorm : ∀ r : ℝ, ‖algebraMap ℝ F r‖ = ‖r‖ ^ s)
    (x : F) :
    Continuous (ostrowski_realRpowPhi (F := F) x) := by
  have hcont_alg : Continuous (algebraMap ℝ F) :=
    ostrowski_continuous_algebraMap_of_real_rpow
      (F := F) hs hnorm
  exact ((continuous_const.pow 2).sub
    ((hcont_alg.comp continuous_fst).mul continuous_const)).add
      (hcont_alg.comp continuous_snd)
private theorem ostrowski_aeval_eq_realRpowPhi
    (x : F) (u : ℝ × ℝ) :
    aeval x (X ^ 2 - C u.1 * X + C u.2) =
      ostrowski_realRpowPhi (F := F) x u := by
  simp [ostrowski_realRpowPhi]
 
private theorem ostrowski_norm_eq_of_isMinOn_of_forall_le
    {X E : Type*} [TopologicalSpace X] [PreconnectedSpace X]
    [SeminormedAddCommGroup E] {f : X → E} {M : ℝ} {x : X}
    (hM : 0 < M) (hx : ‖f x‖ = M) (h : IsMinOn (‖f ·‖) univ x)
    (hf : Continuous f)
    (H : ∀ {y} z, ‖f y‖ = M →
      ∀ n > 0, ‖f z‖ ≤ M * (1 + (‖f z - f y‖ / M) ^ n))
    (y : X) :
    ‖f y‖ = M := by
  suffices {y | ‖f y‖ = M} = univ by
    simpa only [← this, hx] using! mem_univ y
  refine IsClopen.eq_univ ⟨isClosed_eq (by fun_prop) (by fun_prop), ?_⟩
    (nonempty_of_mem hx)
  rw [isOpen_iff_eventually]
  intro w hw
  filter_upwards [mem_map.mp <| hf.tendsto w (Metric.ball_mem_nhds (f w) hM)] with u hu
  simp only [mem_preimage, Metric.mem_ball, dist_eq_norm, ← div_lt_one₀ hM] at hu
  refine le_antisymm ?_ (hx ▸ isMinOn_univ_iff.mp h u)
  suffices Tendsto
      (fun n : ℕ => M * (1 + (‖f u - f w‖ / M) ^ n))
      atTop (𝓝 (M * (1 + 0))) by
    refine ge_of_tendsto (by simpa) ?_
    filter_upwards [Ioi_mem_atTop 0] with n hn
    exact H u hw n hn
  exact tendsto_pow_atTop_nhds_zero_of_lt_one (by positivity) hu
    |>.const_add 1 |>.const_mul M
 

private theorem ostrowski_le_aeval_of_isMonicOfDegree_real_rpow
    {x : F} {M : ℝ} (hM : 0 ≤ M)
    (h : ∀ z : ℝ × ℝ, M ≤ ‖ostrowski_realRpowPhi (F := F) x z‖)
    {p : ℝ[X]} {n : ℕ} (hp : IsMonicOfDegree p (2 * n)) :
    M ^ n ≤ ‖aeval x p‖ := by
  induction n generalizing p with
  | zero => simp_all
  | succ n ih =>
      rw [mul_add, mul_one] at hp
      obtain ⟨f₁, f₂, hf₁, hf₂, H⟩ :=
        hp.eq_isMonicOfDegree_two_mul_isMonicOfDegree
      obtain ⟨a, b, hab⟩ := isMonicOfDegree_two_iff'.mp hf₁
      rw [H, aeval_mul, norm_mul, mul_comm, pow_succ, hab,
        ostrowski_aeval_eq_realRpowPhi (F := F) x (a, b)]
      exact mul_le_mul (ih hf₂) (h (a, b)) hM (norm_nonneg _)
 


private theorem ostrowski_norm_realRpowPhi_eq_of_isMinOn
    {s : ℝ} (hs : 0 < s)
    (hnorm : ∀ r : ℝ, ‖algebraMap ℝ F r‖ = ‖r‖ ^ s)
    {x : F} {z : ℝ × ℝ}
    (h : IsMinOn (‖ostrowski_realRpowPhi (F := F) x ·‖) univ z)
    (H : ‖ostrowski_realRpowPhi (F := F) x z‖ ≠ 0)
    (w : ℝ × ℝ) :
    ‖ostrowski_realRpowPhi (F := F) x w‖ =
      ‖ostrowski_realRpowPhi (F := F) x z‖ := by
  set M : ℝ := ‖ostrowski_realRpowPhi (F := F) x z‖ with hM
  have hM₀ : 0 < M := by positivity
  refine ostrowski_norm_eq_of_isMinOn_of_forall_le
    hM₀ hM.symm h
    (ostrowski_continuous_realRpowPhi (F := F) hs hnorm x)
    (fun {w} u hw n hn => ?_) w
  have HH :
      M * (1 + (‖ostrowski_realRpowPhi (F := F) x u -
        ostrowski_realRpowPhi (F := F) x w‖ / M) ^ n) =
        (M ^ n + ‖ostrowski_realRpowPhi (F := F) x u -
          ostrowski_realRpowPhi (F := F) x w‖ ^ n) / M ^ (n - 1) := by
    simp only [field, div_pow, ← pow_succ', Nat.sub_add_cancel hn]
  rw [HH, le_div_iff₀ (by positivity)]
  clear HH
  let q (y : ℝ × ℝ) : ℝ[X] := X ^ 2 - C y.1 * X + C y.2
  have hq (y : ℝ × ℝ) : IsMonicOfDegree (q y) 2 :=
    isMonicOfDegree_sub_add_two ..
  have hsub : q w - q u = (C u.1 - C w.1) * X + C w.2 - C u.2 := by
    simp only [q]
    ring
  have hdvd : q u ∣ q w ^ n - (q w - q u) ^ n := by
    nth_rewrite 1 [← sub_sub_self (q w) (q u)]
    exact sub_dvd_pow_sub_pow ..
  have H' : ((q w - q u) ^ n).natDegree < 2 * n := by
    rw [hsub]
    compute_degree
    grind
  obtain ⟨p, hp, hrel⟩ :=
    ((hq w).pow n).of_dvd_sub (by grind) (hq u) H' hdvd
  clear H' hdvd hsub
  rw [show 2 * n - 2 = 2 * (n - 1) by grind] at hp
  grw [ostrowski_le_aeval_of_isMonicOfDegree_real_rpow
    (F := F) hM₀.le (isMinOn_univ_iff.mp h) hp]
  rw [← sub_eq_iff_eq_add, eq_comm, mul_comm] at hrel
  apply_fun (‖aeval x ·‖) at hrel
  rw [map_mul, norm_mul, map_sub,
    ostrowski_aeval_eq_realRpowPhi (F := F) x u] at hrel
  rw [hrel, norm_sub_rev (ostrowski_realRpowPhi (F := F) x u)]
  exact (norm_sub_le ..).trans <| by
    simp [q, ostrowski_aeval_eq_realRpowPhi, hw]
 

private theorem ostrowski_exists_isMinOn_norm_sub_algebraMap_of_real_rpow
    {s : ℝ} (hs : 0 < s)
    (hnorm : ∀ r : ℝ, ‖algebraMap ℝ F r‖ = ‖r‖ ^ s)
    (x : F) :
    ∃ z : ℝ, IsMinOn (fun r : ℝ => ‖x - algebraMap ℝ F r‖) univ z := by
  have hcont_alg : Continuous (algebraMap ℝ F) :=
    ostrowski_continuous_algebraMap_of_real_rpow
      (F := F) hs hnorm
  have htend :
      Tendsto (fun r : ℝ => ‖x - algebraMap ℝ F r‖)
        (cobounded ℝ) atTop := by
    have hbase :
        Tendsto (fun r : ℝ => ‖r‖ ^ s - ‖x‖)
          (cobounded ℝ) atTop :=
      tendsto_atTop_add_const_right _ _
        (ostrowski_tendsto_norm_rpow_cobounded_atTop hs)
    refine tendsto_atTop_mono' _ ?_ hbase
    filter_upwards with r
    calc
      ‖r‖ ^ s - ‖x‖ = ‖algebraMap ℝ F r‖ - ‖x‖ := by
        rw [hnorm r]
      _ ≤ ‖algebraMap ℝ F r - x‖ := norm_sub_norm_le _ _
      _ = ‖x - algebraMap ℝ F r‖ := by rw [norm_sub_rev]
  simp only [isMinOn_univ_iff]
  refine (show Continuous fun r : ℝ => ‖x - algebraMap ℝ F r‖ from
    (continuous_const.sub hcont_alg).norm).exists_forall_le_of_isBounded 0 ?_
  simpa [isBounded_def, compl_ofPred, Ioi]
    using htend (Ioi_mem_atTop ‖x - algebraMap ℝ F (0 : ℝ)‖)
 

private theorem ostrowski_tendsto_realRpowPhi_cobounded
    {s : ℝ} (hs : 0 < s)
    (hnorm : ∀ r : ℝ, ‖algebraMap ℝ F r‖ = ‖r‖ ^ s)
    {x : F} {c : ℝ} (hc₀ : 0 < c)
    (hbd : ∀ r : ℝ, c ≤ ‖x - algebraMap ℝ F r‖) :
    Tendsto (ostrowski_realRpowPhi (F := F) x ·)
      (cobounded (ℝ × ℝ)) (cobounded F) := by
  simp_rw [ostrowski_realRpowPhi, sub_add]
  refine tendsto_const_sub_cobounded _ |>.comp ?_
  rw [← tendsto_norm_atTop_iff_cobounded]
  refine Tendsto.coprod_of_prod_top_right (α := ℝ) (fun S hS => ?_) ?_
  · rw [← isCobounded_def, ← isBounded_compl_iff] at hS
    obtain ⟨M, hM_pos, hM⟩ : ∃ M > 0, ∀ y ∈ Sᶜ, ‖y‖ ≤ M :=
      hS.exists_pos_norm_le
    suffices Tendsto
        (fun y : ℝ × ℝ => ‖y.2‖ ^ s - M ^ s * ‖x‖)
        (𝓟 Sᶜ ×ˢ cobounded ℝ) atTop by
      refine tendsto_atTop_mono' _ ?_ this
      filter_upwards [prod_mem_prod (mem_principal_self Sᶜ) univ_mem] with y hy
      rw [norm_sub_rev]
      refine le_trans ?_ (norm_sub_norm_le ..)
      have hy₁_le : ‖y.1‖ ≤ M := hM _ (Set.mem_prod.mp hy).1
      have hy₁_pow : ‖y.1‖ ^ s ≤ M ^ s :=
        Real.rpow_le_rpow (norm_nonneg _) hy₁_le hs.le
      calc
        ‖algebraMap ℝ F y.2‖ - ‖algebraMap ℝ F y.1 * x‖
            = ‖y.2‖ ^ s - ‖y.1‖ ^ s * ‖x‖ := by
              rw [hnorm y.2, norm_mul, hnorm y.1]
        _ ≥ ‖y.2‖ ^ s - M ^ s * ‖x‖ := by
              gcongr
    exact tendsto_atTop_add_const_right _ _
      (ostrowski_tendsto_norm_rpow_snd_atTop hs Sᶜ)
  · suffices Tendsto (fun y : ℝ × ℝ => ‖y.1‖ ^ s * c)
        (cobounded ℝ ×ˢ ⊤) atTop by
      refine tendsto_atTop_mono' _ ?_ this
      filter_upwards [prod_mem_prod (isBounded_singleton (x := 0)) univ_mem] with y hy
      have hy₁_ne : y.1 ≠ 0 := by
        simpa using (Set.mem_prod.mp hy).1
      calc
        ‖y.1‖ ^ s * c
            ≤ ‖y.1‖ ^ s * ‖x - algebraMap ℝ F (y.1⁻¹ * y.2)‖ := by
              gcongr
              exact hbd _
        _ = ‖algebraMap ℝ F y.1‖ *
              ‖x - algebraMap ℝ F (y.1⁻¹ * y.2)‖ := by
              rw [hnorm y.1]
        _ = ‖algebraMap ℝ F y.1 *
              (x - algebraMap ℝ F (y.1⁻¹ * y.2))‖ := by
              rw [norm_mul]
        _ = ‖algebraMap ℝ F y.1 * x - algebraMap ℝ F y.2‖ := by
              congr 1
              rw [mul_sub, ← map_mul]
              have hmul : y.1 * (y.1⁻¹ * y.2) = y.2 := by
                field_simp [hy₁_ne]
              rw [hmul]
    simpa [mul_comm] using
      Tendsto.const_mul_atTop hc₀
        (ostrowski_tendsto_norm_rpow_fst_atTop hs)
 
private theorem ostrowski_exists_isMinOn_norm_realRpowPhi
    {s : ℝ} (hs : 0 < s)
    (hnorm : ∀ r : ℝ, ‖algebraMap ℝ F r‖ = ‖r‖ ^ s)
    (x : F) :
    ∃ z : ℝ × ℝ,
      IsMinOn (‖ostrowski_realRpowPhi (F := F) x ·‖) univ z := by
  obtain ⟨u, hu⟩ :=
    ostrowski_exists_isMinOn_norm_sub_algebraMap_of_real_rpow
      (F := F) hs hnorm x
  rcases eq_or_lt_of_le (norm_nonneg (x - algebraMap ℝ F u)) with hc₀ | hc₀
  · rw [eq_comm, norm_eq_zero, sub_eq_zero] at hc₀
    exact ⟨(u, 0), fun y => by
      simp [ostrowski_realRpowPhi, hc₀, sq]⟩
  · simp only [isMinOn_univ_iff] at hu ⊢
    refine (ostrowski_continuous_realRpowPhi (F := F) hs hnorm x).norm
      |>.exists_forall_le_of_isBounded (0, 0) ?_
    simpa [isBounded_def, compl_ofPred, Ioi]
      using tendsto_norm_cobounded_atTop.comp
        (ostrowski_tendsto_realRpowPhi_cobounded
          (F := F) hs hnorm hc₀ hu)
        (Ioi_mem_atTop ‖ostrowski_realRpowPhi (F := F) x (0, 0)‖)
 

private theorem ostrowski_exists_isMonicOfDegree_two_and_aeval_eq_zero_real_rpow
    {s : ℝ} (hs : 0 < s)
    (hnorm : ∀ r : ℝ, ‖algebraMap ℝ F r‖ = ‖r‖ ^ s)
    (x : F) :
    ∃ p : ℝ[X], IsMonicOfDegree p 2 ∧ aeval x p = 0 := by
  obtain ⟨z, h⟩ :=
    ostrowski_exists_isMinOn_norm_realRpowPhi (F := F) hs hnorm x
  suffices ostrowski_realRpowPhi (F := F) x z = 0 from
    ⟨_, isMonicOfDegree_sub_add_two z.1 z.2, by
      rwa [ostrowski_aeval_eq_realRpowPhi]⟩
  by_contra! H
  set M := ‖ostrowski_realRpowPhi (F := F) x z‖
  have h' (r : ℝ) : √M ≤ ‖x - algebraMap ℝ F r‖ := by
    rw [← sq_le_sq₀ M.sqrt_nonneg (norm_nonneg _),
      Real.sq_sqrt (norm_nonneg _), ← norm_pow,
      Commute.sub_sq <| (Algebra.commutes r x).symm]
    have hcomm : x * algebraMap ℝ F r = algebraMap ℝ F r * x :=
      (Algebra.commutes r x).symm
    convert! isMinOn_univ_iff.mp h (2 * r, r ^ 2) using 4 <;>
      simp [two_mul, add_mul, sq, hcomm]
  have htend := tendsto_norm_atTop_iff_cobounded.mpr <|
    ostrowski_tendsto_realRpowPhi_cobounded
      (F := F) hs hnorm (by positivity) h'
  simp only [ostrowski_norm_realRpowPhi_eq_of_isMinOn
    (F := F) hs hnorm h (norm_ne_zero_iff.mpr H)] at htend
  exact Filter.not_tendsto_const_atTop _ _ htend
 

private theorem ostrowski_gelfandMazur_of_real_rpow_scalar
    (F : Type*) [NormedField F] [Algebra ℝ F]
    {s : ℝ} (hs : 0 < s)
    (hnorm : ∀ r : ℝ, ‖algebraMap ℝ F r‖ = ‖r‖ ^ s) :
    Nonempty (F ≃ₐ[ℝ] ℝ) ∨ Nonempty (F ≃ₐ[ℝ] ℂ) := by
  have : Algebra.IsAlgebraic ℝ F := by
    refine ⟨fun x => ?_⟩
    obtain ⟨p, hp, hpx⟩ :=
      ostrowski_exists_isMonicOfDegree_two_and_aeval_eq_zero_real_rpow
        (F := F) hs hnorm x
    exact ⟨p, hp.ne_zero, hpx⟩
  exact _root_.Real.nonempty_algEquiv_or F
end RealRpowGelfandMazur
private theorem ostrowski_gelfandMazur_of_real_rpow
    {K : Type*} [Field K] [CharZero K] (v : AbsoluteValue K ℝ)
    (hcomplete : CompleteSpace (WithAbs v))
    (s : ℝ) (hs : 0 < s)
    (hnorm : ∀ q : ℚ,
      ostrowski_restrictRatAbsoluteValue (K := K) v q =
        Rat.AbsoluteValue.real q ^ s) :
    letI : Algebra ℝ (WithAbs v) :=
      ostrowski_realAlgebra_of_real_rpow (K := K) v hcomplete s hs hnorm
    Nonempty (WithAbs v ≃ₐ[ℝ] ℝ) ∨
      Nonempty (WithAbs v ≃ₐ[ℝ] ℂ) := by
  let : Algebra ℝ (WithAbs v) :=
    ostrowski_realAlgebra_of_real_rpow (K := K) v hcomplete s hs hnorm
  exact ostrowski_gelfandMazur_of_real_rpow_scalar (WithAbs v) hs
    (ostrowski_realAlgebra_norm_algebraMap_of_real_rpow
      (K := K) v hcomplete s hs hnorm)
private theorem ostrowski_realAlgEquiv_norm_eq_of_real_rpow
    {K : Type*} [Field K] [CharZero K] (v : AbsoluteValue K ℝ)
    (hcomplete : CompleteSpace (WithAbs v))
    (s : ℝ) (hs : 0 < s)
    (hnorm : ∀ q : ℚ,
      ostrowski_restrictRatAbsoluteValue (K := K) v q =
        Rat.AbsoluteValue.real q ^ s) :
    letI : Algebra ℝ (WithAbs v) :=
      ostrowski_realAlgebra_of_real_rpow (K := K) v hcomplete s hs hnorm
    ∀ (e : WithAbs v ≃ₐ[ℝ] ℝ) (x : WithAbs v),
      ‖x‖ = ‖e x‖ ^ s := by
  let : Algebra ℝ (WithAbs v) :=
    ostrowski_realAlgebra_of_real_rpow (K := K) v hcomplete s hs hnorm
  intro e x
  have hx : x = algebraMap ℝ (WithAbs v) (e x) := by
    calc
      x = e.symm (e x) := by simp
      _ = algebraMap ℝ (WithAbs v) (e x) := by
        simpa using (AlgEquiv.commutes e.symm (e x))
  rw [hx]
  simp only [AlgEquiv.commutes, Algebra.algebraMap_self_apply]
  exact ostrowski_realAlgebra_norm_algebraMap_of_real_rpow
    (K := K) v hcomplete s hs hnorm (e x)
private theorem ostrowski_realBranch_abs_eq_of_real_rpow
    {K : Type*} [Field K] [CharZero K] (v : AbsoluteValue K ℝ)
    (hcomplete : CompleteSpace (WithAbs v))
    (s : ℝ) (hs : 0 < s)
    (hnorm : ∀ q : ℚ,
      ostrowski_restrictRatAbsoluteValue (K := K) v q =
        Rat.AbsoluteValue.real q ^ s) :
    letI : Algebra ℝ (WithAbs v) :=
      ostrowski_realAlgebra_of_real_rpow (K := K) v hcomplete s hs hnorm
    ∀ (e : WithAbs v ≃ₐ[ℝ] ℝ) (x : K),
      v x = ‖e ((WithAbs.equiv v).symm x)‖ ^ s := by
  let : Algebra ℝ (WithAbs v) :=
    ostrowski_realAlgebra_of_real_rpow (K := K) v hcomplete s hs hnorm
  intro e x
  change ‖((WithAbs.equiv v).symm x : WithAbs v)‖ =
    ‖e ((WithAbs.equiv v).symm x)‖ ^ s
  exact ostrowski_realAlgEquiv_norm_eq_of_real_rpow
    (K := K) v hcomplete s hs hnorm e ((WithAbs.equiv v).symm x)
end AbsoluteValue
namespace AlgEquiv
private theorem norm_symm_I_eq_one
    {F : Type*} [NormedField F] [Algebra ℝ F]
    (e : F ≃ₐ[ℝ] ℂ) :
    ‖e.symm Complex.I‖ = 1 := by
  have hsq : (e.symm Complex.I : F) ^ 2 = -1 := by
    apply e.injective
    simp [Complex.I_sq]
  have hsqnorm : ‖e.symm Complex.I‖ ^ 2 = (1 : ℝ) := by
    calc
      ‖e.symm Complex.I‖ ^ 2 = ‖(e.symm Complex.I : F) ^ 2‖ := by simp
      _ = ‖(-1 : F)‖ := by rw [hsq]
      _ = 1 := by simp
  nlinarith [norm_nonneg (e.symm Complex.I),
    sq_nonneg (‖e.symm Complex.I‖ - 1), hsqnorm]
private theorem norm_symm_le_re_add_im_rpow
    {F : Type*} [NormedField F] [Algebra ℝ F]
    {s : ℝ}
    (hnorm : ∀ r : ℝ, ‖algebraMap ℝ F r‖ = ‖r‖ ^ s)
    (e : F ≃ₐ[ℝ] ℂ) (z : ℂ) :
    ‖e.symm z‖ ≤ ‖z.re‖ ^ s + ‖z.im‖ ^ s := by
  let j : F := e.symm Complex.I
  have hj : ‖j‖ = 1 :=
    norm_symm_I_eq_one e
  have hzdecomp :
      e.symm z = algebraMap ℝ F z.re + algebraMap ℝ F z.im * j := by
    apply e.injective
    simp [j, Complex.re_add_im]
  calc
    ‖e.symm z‖ =
        ‖algebraMap ℝ F z.re + algebraMap ℝ F z.im * j‖ := by
          rw [hzdecomp]
    _ ≤ ‖algebraMap ℝ F z.re‖ + ‖algebraMap ℝ F z.im * j‖ :=
        norm_add_le _ _
    _ = ‖z.re‖ ^ s + ‖z.im‖ ^ s := by
        rw [norm_mul, hnorm z.re, hnorm z.im, hj, mul_one]
private theorem norm_symm_le_one_of_norm_eq_one
    {F : Type*} [NormedField F] [Algebra ℝ F]
    {s : ℝ} (hs : 0 < s)
    (hnorm : ∀ r : ℝ, ‖algebraMap ℝ F r‖ = ‖r‖ ^ s)
    (e : F ≃ₐ[ℝ] ℂ) {z : ℂ} (hz : ‖z‖ = 1) :
    ‖e.symm z‖ ≤ 1 := by
  by_contra hnot
  have hlt : 1 < ‖e.symm z‖ := lt_of_not_ge hnot
  obtain ⟨n, hn⟩ := pow_unbounded_of_one_lt (2 : ℝ) hlt
  have hbound : ‖e.symm z‖ ^ n ≤ (2 : ℝ) := by
    calc
      ‖e.symm z‖ ^ n = ‖(e.symm z : F) ^ n‖ := by simp
      _ = ‖e.symm (z ^ n)‖ := by
          congr 1
          exact (map_pow e.symm z n).symm
      _ ≤ ‖(z ^ n).re‖ ^ s + ‖(z ^ n).im‖ ^ s :=
          norm_symm_le_re_add_im_rpow hnorm e (z ^ n)
      _ ≤ 1 + 1 := by
          have hzpow : ‖z ^ n‖ = (1 : ℝ) := by
            rw [norm_pow, hz, one_pow]
          have hre : ‖(z ^ n).re‖ ≤ (1 : ℝ) := by
            rw [Real.norm_eq_abs]
            exact (Complex.abs_re_le_norm (z ^ n)).trans_eq hzpow
          have him : ‖(z ^ n).im‖ ≤ (1 : ℝ) := by
            rw [Real.norm_eq_abs]
            exact (Complex.abs_im_le_norm (z ^ n)).trans_eq hzpow
          have hre_pow : ‖(z ^ n).re‖ ^ s ≤ (1 : ℝ) :=
            by simpa using
              Real.rpow_le_rpow (norm_nonneg _) hre hs.le
          have him_pow : ‖(z ^ n).im‖ ^ s ≤ (1 : ℝ) :=
            by simpa using
              Real.rpow_le_rpow (norm_nonneg _) him hs.le
          linarith
      _ = 2 := by norm_num
  exact not_lt_of_ge hbound hn
private theorem norm_symm_eq_one_of_norm_eq_one
    {F : Type*} [NormedField F] [Algebra ℝ F]
    {s : ℝ} (hs : 0 < s)
    (hnorm : ∀ r : ℝ, ‖algebraMap ℝ F r‖ = ‖r‖ ^ s)
    (e : F ≃ₐ[ℝ] ℂ) {z : ℂ} (hz : ‖z‖ = 1) :
    ‖e.symm z‖ = 1 := by
  have hle : ‖e.symm z‖ ≤ 1 :=
    norm_symm_le_one_of_norm_eq_one
      hs hnorm e hz
  have hz0 : z ≠ 0 := by
    intro h
    simp [h] at hz
  have hle_inv : ‖e.symm z⁻¹‖ ≤ 1 := by
    exact norm_symm_le_one_of_norm_eq_one
      hs hnorm e (by simp [norm_inv, hz])
  have hprod : ‖e.symm z‖ * ‖e.symm z⁻¹‖ = 1 := by
    calc
      ‖e.symm z‖ * ‖e.symm z⁻¹‖ =
          ‖(e.symm z : F) * e.symm z⁻¹‖ := by
            rw [norm_mul]
      _ = ‖(1 : F)‖ := by
          congr 1
          rw [← map_mul]
          simp [hz0]
      _ = 1 := by simp
  have hpos_inv : 0 < ‖e.symm z⁻¹‖ := norm_pos_iff.mpr (by
    intro h
    apply hz0
    simpa using congrArg e h)
  have hge : 1 ≤ ‖e.symm z‖ := by
    nlinarith [hprod, hle_inv, hpos_inv]
  exact le_antisymm hle hge
 
theorem norm_symm_apply_eq_norm_rpow
    {F : Type*} [NormedField F] [Algebra ℝ F]
    {s : ℝ} (hs : 0 < s)
    (hnorm : ∀ r : ℝ, ‖algebraMap ℝ F r‖ = ‖r‖ ^ s)
    (e : F ≃ₐ[ℝ] ℂ) (z : ℂ) :
    ‖e.symm z‖ = ‖z‖ ^ s := by
  by_cases hz0 : z = 0
  · simp [hz0, hs.ne']
  · let r : ℝ := ‖z‖
    have hr_pos : 0 < r := by
      simpa [r] using norm_pos_iff.mpr hz0
    let u : ℂ := (r⁻¹ : ℂ) * z
    have hu_norm : ‖u‖ = 1 := by
      simp [u, r, hr_pos.ne']
    have hz_decomp : z = (r : ℂ) * u := by
      simp [u, r, hr_pos.ne']
    calc
      ‖e.symm z‖ = ‖e.symm ((r : ℂ) * u)‖ := by rw [hz_decomp]
      _ = ‖algebraMap ℝ F r * e.symm u‖ := by
          congr 1
          rw [map_mul]
          congr 1
          exact AlgEquiv.commutes e.symm r
      _ = ‖z‖ ^ s := by
          rw [norm_mul, hnorm r,
            norm_symm_eq_one_of_norm_eq_one
              hs hnorm e hu_norm, mul_one]
          simp [r]
end AlgEquiv
namespace AbsoluteValue
private theorem ostrowski_complexAlgEquiv_norm_eq_of_real_rpow
    {K : Type*} [Field K] [CharZero K] (v : AbsoluteValue K ℝ)
    (hcomplete : CompleteSpace (WithAbs v))
    (s : ℝ) (hs : 0 < s)
    (hnorm : ∀ q : ℚ,
      ostrowski_restrictRatAbsoluteValue (K := K) v q =
        Rat.AbsoluteValue.real q ^ s) :
    letI : Algebra ℝ (WithAbs v) :=
      ostrowski_realAlgebra_of_real_rpow (K := K) v hcomplete s hs hnorm
    ∀ (e : WithAbs v ≃ₐ[ℝ] ℂ) (x : WithAbs v),
      ‖x‖ = ‖e x‖ ^ s := by
  let : Algebra ℝ (WithAbs v) :=
    ostrowski_realAlgebra_of_real_rpow (K := K) v hcomplete s hs hnorm
  intro e x
  calc
    ‖x‖ = ‖e.symm (e x)‖ := by simp
    _ = ‖e x‖ ^ s :=
        AlgEquiv.norm_symm_apply_eq_norm_rpow hs
          (ostrowski_realAlgebra_norm_algebraMap_of_real_rpow
            (K := K) v hcomplete s hs hnorm) e (e x)
private theorem ostrowski_complexBranch_abs_eq_of_real_rpow
    {K : Type*} [Field K] [CharZero K] (v : AbsoluteValue K ℝ)
    (hcomplete : CompleteSpace (WithAbs v))
    (s : ℝ) (hs : 0 < s)
    (hnorm : ∀ q : ℚ,
      ostrowski_restrictRatAbsoluteValue (K := K) v q =
        Rat.AbsoluteValue.real q ^ s) :
    letI : Algebra ℝ (WithAbs v) :=
      ostrowski_realAlgebra_of_real_rpow (K := K) v hcomplete s hs hnorm
    ∀ (e : WithAbs v ≃ₐ[ℝ] ℂ) (x : K),
      v x = ‖e ((WithAbs.equiv v).symm x)‖ ^ s := by
  let : Algebra ℝ (WithAbs v) :=
    ostrowski_realAlgebra_of_real_rpow (K := K) v hcomplete s hs hnorm
  intro e x
  change ‖((WithAbs.equiv v).symm x : WithAbs v)‖ =
    ‖e ((WithAbs.equiv v).symm x)‖ ^ s
  exact ostrowski_complexAlgEquiv_norm_eq_of_real_rpow
    (K := K) v hcomplete s hs hnorm e ((WithAbs.equiv v).symm x)
 



theorem ostrowski_of_complete
    {K : Type*} [Field K] (v : AbsoluteValue K ℝ)
    (hcomplete : CompleteSpace (WithAbs v))
    (harch : ¬ IsNonarchimedean (v : K → ℝ)) :
    letI : CharZero K := charZero_of_not_isNonarchimedean v harch
    ∃ s : ℝ, 0 < s ∧ s ≤ 1 ∧
      ((∃ σ : K ≃+* ℝ, ∀ a : K, v a = ‖σ a‖ ^ s) ∨
        (∃ σ : K ≃+* ℂ, ∀ a : K, v a = ‖σ a‖ ^ s)) := by
  let : CharZero K := charZero_of_not_isNonarchimedean v harch
  obtain ⟨s, hs, hs_le, hnorm⟩ :=
    ostrowski_restrictRat_exists_real_rpow_eq_of_not_isNonarchimedean
      (K := K) v harch
  refine ⟨s, hs, hs_le, ?_⟩
  let : Algebra ℝ (WithAbs v) :=
    ostrowski_realAlgebra_of_real_rpow (K := K) v hcomplete s hs hnorm
  rcases ostrowski_gelfandMazur_of_real_rpow
      (K := K) v hcomplete s hs hnorm with hreal | hcomplex
  · rcases hreal with ⟨e⟩
    left
    let σ : K ≃+* ℝ := (WithAbs.equiv v).symm.trans e.toRingEquiv
    refine ⟨σ, fun a => ?_⟩
    change v a = ‖e ((WithAbs.equiv v).symm a)‖ ^ s
    exact ostrowski_realBranch_abs_eq_of_real_rpow
      (K := K) v hcomplete s hs hnorm e a
  · rcases hcomplex with ⟨e⟩
    right
    let σ : K ≃+* ℂ := (WithAbs.equiv v).symm.trans e.toRingEquiv
    refine ⟨σ, fun a => ?_⟩
    change v a = ‖e ((WithAbs.equiv v).symm a)‖ ^ s
    exact ostrowski_complexBranch_abs_eq_of_real_rpow
      (K := K) v hcomplete s hs hnorm e a
end AbsoluteValue
end
end

/- ValuedFieldTheory.Valuation.AbsoluteValue.SpectralExtension -/
section
noncomputable section
namespace AbsoluteValue
private abbrev spectral_withAbsNontriviallyNormedField
    {K : Type*} [Field K] (v : AbsoluteValue K ℝ) (hv : v.IsNontrivial) :
    NontriviallyNormedField (WithAbs v) :=
  NontriviallyNormedField.ofNormNeOne
    (by
      rcases hv with ⟨x, hx0, hx1⟩
      refine ⟨WithAbs.toAbs v x, ?_, ?_⟩
      · intro hx
        apply hx0
        simpa using congrArg (WithAbs.equiv v) hx
      · simpa [WithAbs.norm_eq_apply_ofAbs] using hx1)
 

private instance withAbsAlgebra_isAlgebraic
    {K L : Type*} [Field K] [Field L] [Algebra K L]
    [Algebra.IsAlgebraic K L] (v : AbsoluteValue K ℝ) :
    Algebra.IsAlgebraic (WithAbs v) L := by
  exact Algebra.IsAlgebraic.tower_top
    (K := K) (L := WithAbs v) (A := L)
 
private theorem withAbs_isUltrametricDist
    {K : Type*} [Field K] (v : AbsoluteValue K ℝ)
    (hnonarch : IsNonarchimedean (v : K → ℝ)) :
    IsUltrametricDist (WithAbs v) := by
  refine IsUltrametricDist.isUltrametricDist_of_isNonarchimedean_norm ?_
  intro x y
  simpa [WithAbs.norm_eq_apply_ofAbs] using
    hnonarch (WithAbs.equiv v x) (WithAbs.equiv v y)
 

private theorem spectral_spectralNorm_extends_base
    {K L : Type*} [Field K] [Field L] [Algebra K L]
    [Algebra.IsAlgebraic K L]
    (v : AbsoluteValue K ℝ) (x : K) :
    _root_.spectralNorm (WithAbs v) L (algebraMap K L x) = v x := by
  let : Algebra.IsAlgebraic (WithAbs v) L :=
    withAbsAlgebra_isAlgebraic v
  simpa [WithAbs.algebraMap_left_apply, WithAbs.norm_eq_apply_ofAbs] using
    (_root_.spectralNorm_extends
      (K := WithAbs v) (L := L) ((WithAbs.equiv v).symm x))
 

private theorem spectral_spectralNorm_strong_triangle
    {K L : Type*} [Field K] [Field L] [Algebra K L]
    [Algebra.IsAlgebraic K L]
    (v : AbsoluteValue K ℝ)
    (hnonarch : IsNonarchimedean (v : K → ℝ)) (x y : L) :
    _root_.spectralNorm (WithAbs v) L (x + y) ≤
      max (_root_.spectralNorm (WithAbs v) L x)
        (_root_.spectralNorm (WithAbs v) L y) := by
  let : IsUltrametricDist (WithAbs v) :=
    withAbs_isUltrametricDist v hnonarch
  let : Algebra.IsAlgebraic (WithAbs v) L :=
    withAbsAlgebra_isAlgebraic v
  exact _root_.isNonarchimedean_spectralNorm
    (K := WithAbs v) (L := L) x y
 

private theorem spectral_spectralNorm_eq_zero_iff
    {K L : Type*} [Field K] [Field L] [Algebra K L]
    [Algebra.IsAlgebraic K L]
    (v : AbsoluteValue K ℝ) (x : L) :
    _root_.spectralNorm (WithAbs v) L x = 0 ↔ x = 0 := by
  let : Algebra.IsAlgebraic (WithAbs v) L :=
    withAbsAlgebra_isAlgebraic v
  constructor
  · intro hx
    exact _root_.eq_zero_of_map_spectralNorm_eq_zero
      (K := WithAbs v) (L := L) hx
      (Algebra.IsAlgebraic.isAlgebraic x)
  · intro hx
    rw [hx]
    exact _root_.spectralNorm_zero (K := WithAbs v) (L := L)
 

private theorem spectral_spectralNorm_mul
    {K L : Type*} [Field K] [Field L] [Algebra K L]
    [Algebra.IsAlgebraic K L]
    (v : AbsoluteValue K ℝ)
    (hcomplete : CompleteSpace (WithAbs v))
    (hnonarch : IsNonarchimedean (v : K → ℝ))
    (hv : v.IsNontrivial) (x y : L) :
    _root_.spectralNorm (WithAbs v) L (x * y) =
      _root_.spectralNorm (WithAbs v) L x *
        _root_.spectralNorm (WithAbs v) L y := by
  let : NontriviallyNormedField (WithAbs v) :=
    spectral_withAbsNontriviallyNormedField v hv
  let : Algebra (WithAbs v) L :=
    WithAbs.algebraLeft L v
  let : CompleteSpace (WithAbs v) :=
    hcomplete
  let : IsUltrametricDist (WithAbs v) :=
    withAbs_isUltrametricDist v hnonarch
  let : Algebra.IsAlgebraic (WithAbs v) L :=
    withAbsAlgebra_isAlgebraic v
  simpa [_root_.spectralAlgNorm_def] using
    (_root_.spectralAlgNorm_mul (K := WithAbs v) (L := L) x y)
 

noncomputable def spectralExtension
    {K L : Type*} [Field K] [Field L] [Algebra K L]
    [Algebra.IsAlgebraic K L]
    (v : AbsoluteValue K ℝ)
    (hcomplete : CompleteSpace (WithAbs v))
    (hnonarch : IsNonarchimedean (v : K → ℝ))
    (hv : v.IsNontrivial) : AbsoluteValue L ℝ where
  toFun := _root_.spectralNorm (WithAbs v) L
  map_mul' x y :=
    spectral_spectralNorm_mul (K := K) (L := L)
      v hcomplete hnonarch hv x y
  nonneg' x := _root_.spectralNorm_nonneg (K := WithAbs v) (L := L) x
  eq_zero' x := spectral_spectralNorm_eq_zero_iff (K := K) (L := L) v x
  add_le' x y := by
    have hstrong :=
      spectral_spectralNorm_strong_triangle v hnonarch x y
    have hx_nonneg :
        0 ≤ _root_.spectralNorm (WithAbs v) L x :=
      _root_.spectralNorm_nonneg (K := WithAbs v) (L := L) x
    have hy_nonneg :
        0 ≤ _root_.spectralNorm (WithAbs v) L y :=
      _root_.spectralNorm_nonneg (K := WithAbs v) (L := L) y
    exact hstrong.trans
      (max_le
        (le_add_of_nonneg_right hy_nonneg)
        (le_add_of_nonneg_left hx_nonneg))
 

theorem spectralExtension_extends
    {K L : Type*} [Field K] [Field L] [Algebra K L]
    [Algebra.IsAlgebraic K L]
    (v : AbsoluteValue K ℝ)
    (hcomplete : CompleteSpace (WithAbs v))
    (hnonarch : IsNonarchimedean (v : K → ℝ))
    (hv : v.IsNontrivial) :
    Extends v (spectralExtension (K := K) (L := L)
      v hcomplete hnonarch hv) :=
  spectral_spectralNorm_extends_base v
 
private theorem spectral_unique_spectralNorm
    {K L : Type*} [Field K] [Field L] [Algebra K L]
    [Algebra.IsAlgebraic K L]
    (v : AbsoluteValue K ℝ)
    (hcomplete : CompleteSpace (WithAbs v))
    (hnonarch : IsNonarchimedean (v : K → ℝ))
    (hv : v.IsNontrivial)
    (w : AbsoluteValue L ℝ)
    (hw_ext : Extends v w)
    (x : L) :
    w x = _root_.spectralNorm (WithAbs v) L x := by
  let : NontriviallyNormedField (WithAbs v) :=
    spectral_withAbsNontriviallyNormedField v hv
  let : Algebra (WithAbs v) L :=
    WithAbs.algebraLeft L v
  let : CompleteSpace (WithAbs v) :=
    hcomplete
  let : IsUltrametricDist (WithAbs v) :=
    withAbs_isUltrametricDist v hnonarch
  let : Algebra.IsAlgebraic (WithAbs v) L :=
    withAbsAlgebra_isAlgebraic v
  refine _root_.spectralNorm_unique_field_norm_ext
    (K := WithAbs v) (L := L) (f := w) ?_ x
  intro a
  rw [WithAbs.algebraMap_left_apply, hw_ext]
  exact (WithAbs.norm_eq_apply_ofAbs v a).symm
 

theorem eq_spectralExtension_of_extends
    {K L : Type*} [Field K] [Field L] [Algebra K L]
    [Algebra.IsAlgebraic K L]
    (v : AbsoluteValue K ℝ)
    (hcomplete : CompleteSpace (WithAbs v))
    (hnonarch : IsNonarchimedean (v : K → ℝ))
    (hv : v.IsNontrivial)
    (w : AbsoluteValue L ℝ)
    (hw_ext : Extends v w) :
    w = spectralExtension (K := K) (L := L)
      v hcomplete hnonarch hv := by
  ext x
  exact spectral_unique_spectralNorm
    v hcomplete hnonarch hv w hw_ext x
end AbsoluteValue
end
end

/- ValuedFieldTheory.Valuation.AbsoluteValue.Theory.AbsoluteValues -/
section
noncomputable section
open Filter
open scoped BigOperators Topology
namespace LubinTate
namespace Valuations
 
theorem absoluteValue_finset_sum_le
    {K : Type*} [Field K] (v : AbsoluteValue K ℝ)
    {ι : Type*} (s : Finset ι) (f : ι → K) :
    v (s.sum f) ≤ s.sum (fun i => v (f i)) := by
  classical
  refine Finset.induction_on s ?empty ?insert
  · simp
  · intro i s his ih
    rw [Finset.sum_insert his, Finset.sum_insert his]
    exact (v.add_le (f i) (s.sum f)).trans
      (by
        simpa [add_comm, add_left_comm, add_assoc] using
          add_le_add_left ih (v (f i)))
 

def EquivalentAbsoluteValues {K : Type*} [Field K]
    (v w : AbsoluteValue K ℝ) : Prop :=
  IsHomeomorph (WithAbs.congr v w (.refl K))
 

theorem equivalentAbsoluteValues_iff_isEquiv
    {K : Type*} [Field K] (v w : AbsoluteValue K ℝ) :
    EquivalentAbsoluteValues v w ↔ v.IsEquiv w :=
  (AbsoluteValue.isEquiv_iff_isHomeomorph v w).symm
 
theorem equivalentAbsoluteValues_of_isEquiv
    {K : Type*} [Field K] {v w : AbsoluteValue K ℝ}
    (h : v.IsEquiv w) :
    EquivalentAbsoluteValues v w :=
  (equivalentAbsoluteValues_iff_isEquiv v w).mpr h
 
theorem equivalentAbsoluteValues_refl
    {K : Type*} [Field K] (v : AbsoluteValue K ℝ) :
    EquivalentAbsoluteValues v v :=
  equivalentAbsoluteValues_of_isEquiv (AbsoluteValue.IsEquiv.rfl (v := v))
 

theorem equivalentAbsoluteValues_iff_exists_rpow_eq
    {K : Type*} [Field K] (v w : AbsoluteValue K ℝ) :
    EquivalentAbsoluteValues v w ↔ ∃ s : ℝ, 0 < s ∧ (v · ^ s) = w := by
  exact
    (equivalentAbsoluteValues_iff_isEquiv v w).trans
      (AbsoluteValue.isEquiv_iff_exists_rpow_eq (v := v) (w := w))
 

def NonarchimedeanAbsoluteValue {K : Type*} [Field K]
    (v : AbsoluteValue K ℝ) : Prop :=
  ∃ C : ℝ, ∀ n : ℕ, v (n : K) ≤ C
 
def StrongTriangle {K : Type*} [Field K] (v : AbsoluteValue K ℝ) : Prop :=
  ∀ x y : K, v (x + y) ≤ max (v x) (v y)
 

theorem nat_bound_ge_one
    {K : Type*} [Field K] (v : AbsoluteValue K ℝ) {C : ℝ}
    (hC : ∀ n : ℕ, v (n : K) ≤ C) :
    1 ≤ C := by
  simpa using hC 1
 


theorem add_pow_le_of_bounded_nat
    {K : Type*} [Field K] (v : AbsoluteValue K ℝ) {C : ℝ}
    (hC : ∀ n : ℕ, v (n : K) ≤ C) (x y : K) (n : ℕ) :
    v ((x + y) ^ n) ≤
      ((n + 1 : ℕ) : ℝ) * C * (max (v x) (v y)) ^ n := by
  classical
  let M : ℝ := max (v x) (v y)
  have hC_nonneg : 0 ≤ C :=
    (zero_le_one : (0 : ℝ) ≤ 1).trans
      (nat_bound_ge_one v hC)
  have hM_nonneg : 0 ≤ M :=
    (v.nonneg x).trans (le_max_left (v x) (v y))
  have hsum_le :
      v ((Finset.range (n + 1)).sum
          (fun m => x ^ m * y ^ (n - m) * (n.choose m : K))) ≤
        (Finset.range (n + 1)).sum
          (fun m => v (x ^ m * y ^ (n - m) * (n.choose m : K))) :=
    absoluteValue_finset_sum_le v (Finset.range (n + 1))
      (fun m => x ^ m * y ^ (n - m) * (n.choose m : K))
  have hterm :
      ∀ m ∈ Finset.range (n + 1),
        v (x ^ m * y ^ (n - m) * (n.choose m : K)) ≤ C * M ^ n := by
    intro m hm
    have hmle : m ≤ n := Nat.lt_succ_iff.mp (Finset.mem_range.mp hm)
    have hxpow : v (x ^ m) ≤ M ^ m := by
      rw [map_pow]
      exact pow_le_pow_left₀ (v.nonneg x) (le_max_left (v x) (v y)) m
    have hypow : v (y ^ (n - m)) ≤ M ^ (n - m) := by
      rw [map_pow]
      exact pow_le_pow_left₀ (v.nonneg y) (le_max_right (v x) (v y)) (n - m)
    have hxy :
        v (x ^ m) * v (y ^ (n - m)) ≤ M ^ m * M ^ (n - m) :=
      mul_le_mul hxpow hypow (v.nonneg (y ^ (n - m))) (pow_nonneg hM_nonneg m)
    have hchoose : v ((n.choose m : ℕ) : K) ≤ C := hC (n.choose m)
    calc
      v (x ^ m * y ^ (n - m) * (n.choose m : K))
          = v (x ^ m) * v (y ^ (n - m)) * v ((n.choose m : ℕ) : K) := by
              rw [map_mul, map_mul]
      _ ≤ (M ^ m * M ^ (n - m)) * C := by
              exact mul_le_mul hxy hchoose
                (v.nonneg ((n.choose m : ℕ) : K))
                (mul_nonneg (pow_nonneg hM_nonneg m)
                  (pow_nonneg hM_nonneg (n - m)))
      _ = C * M ^ n := by
              rw [← pow_add, Nat.add_sub_of_le hmle]
              ring
  calc
    v ((x + y) ^ n)
        = v ((Finset.range (n + 1)).sum
            (fun m => x ^ m * y ^ (n - m) * (n.choose m : K))) := by
            rw [add_pow]
    _ ≤ (Finset.range (n + 1)).sum
          (fun m => v (x ^ m * y ^ (n - m) * (n.choose m : K))) := hsum_le
    _ ≤ (Finset.range (n + 1)).sum (fun _m => C * M ^ n) :=
          Finset.sum_le_sum hterm
    _ = ((n + 1 : ℕ) : ℝ) * C * M ^ n := by
          simp [Finset.sum_const, nsmul_eq_mul, mul_assoc]
 

theorem tendsto_linear_bound_rpow_inv
    {C : ℝ} (hC : 0 < C) :
    Tendsto
      (fun n : ℕ => ((((n + 1 : ℕ) : ℝ) * C) ^ ((n : ℝ)⁻¹)))
      atTop (𝓝 1) := by
  have hCroot :
      Tendsto (fun n : ℕ => C ^ ((n : ℝ)⁻¹)) atTop (𝓝 1) := by
    have hcont : ContinuousAt (fun t : ℝ => C ^ t) 0 :=
      Real.continuousAt_const_rpow hC.ne'
    have hzero : Tendsto (fun n : ℕ => (n : ℝ)⁻¹) atTop (𝓝 0) :=
      tendsto_inv_atTop_zero.comp tendsto_natCast_atTop_atTop
    change Tendsto
      ((fun t : ℝ => C ^ t) ∘ fun n : ℕ => (n : ℝ)⁻¹) atTop (𝓝 1)
    simpa only [Real.rpow_zero] using hcont.tendsto.comp hzero
  have hshiftReal :
      Tendsto (fun x : ℝ => x ^ ((1 : ℝ) / (1 * x + (-1)))) atTop (𝓝 1) :=
    tendsto_rpow_div_mul_add 1 1 (-1) zero_ne_one
  have hshiftNat :
      Tendsto (fun n : ℕ => (((n + 1 : ℕ) : ℝ) ^ ((n : ℝ)⁻¹)))
        atTop (𝓝 1) := by
    have hnatshift : Tendsto (fun n : ℕ => (n : ℝ) + 1) atTop atTop :=
      tendsto_atTop_add_const_right atTop 1 tendsto_natCast_atTop_atTop
    refine (hshiftReal.comp hnatshift).congr' ?_
    exact Eventually.of_forall fun n => by
      simp [Nat.cast_add, Nat.cast_one, one_div, add_assoc]
  have htarget :
      Tendsto
        (fun n : ℕ => ((((n + 1 : ℕ) : ℝ) * C) ^ ((n : ℝ)⁻¹)))
        atTop (𝓝 (1 * 1)) := by
    refine (hshiftNat.mul hCroot).congr' ?_
    exact Eventually.of_forall fun n => by
      have hn_nonneg : 0 ≤ ((n + 1 : ℕ) : ℝ) := by positivity
      have hmul :=
        (Real.mul_rpow (z := ((n : ℝ)⁻¹)) hn_nonneg (le_of_lt hC)).symm
      simpa [mul_comm, mul_left_comm, mul_assoc] using hmul
  simpa using htarget
 
theorem add_le_root_bound_of_bounded_nat
    {K : Type*} [Field K] (v : AbsoluteValue K ℝ) {C : ℝ}
    (hC : ∀ n : ℕ, v (n : K) ≤ C) (x y : K)
    {n : ℕ} (hn : n ≠ 0) :
    v (x + y) ≤
      ((((n + 1 : ℕ) : ℝ) * C) ^ ((n : ℝ)⁻¹)) *
        max (v x) (v y) := by
  classical
  let M : ℝ := max (v x) (v y)
  have hC_pos : 0 < C :=
    zero_lt_one.trans_le (nat_bound_ge_one v hC)
  have hM_nonneg : 0 ≤ M :=
    (v.nonneg x).trans (le_max_left (v x) (v y))
  by_cases hMzero : M = 0
  · have hx_le_zero : v x ≤ 0 := by
      simpa [M, hMzero] using (le_max_left (v x) (v y))
    have hy_le_zero : v y ≤ 0 := by
      simpa [M, hMzero] using (le_max_right (v x) (v y))
    have hxzero : x = 0 := (v.eq_zero).mp (le_antisymm hx_le_zero (v.nonneg x))
    have hyzero : y = 0 := (v.eq_zero).mp (le_antisymm hy_le_zero (v.nonneg y))
    simp [hxzero, hyzero]
  · have hpow :
        (v (x + y)) ^ n ≤ ((n + 1 : ℕ) : ℝ) * C * M ^ n := by
      simpa [map_pow, M] using
        add_pow_le_of_bounded_nat v hC x y n
    have hright_nonneg :
        0 ≤ ((n + 1 : ℕ) : ℝ) * C * M ^ n := by
      exact mul_nonneg
        (mul_nonneg (by positivity) (le_of_lt hC_pos))
        (pow_nonneg hM_nonneg n)
    have hn_pos : 0 < (n : ℝ) := Nat.cast_pos.mpr (Nat.pos_of_ne_zero hn)
    have hroot :
        v (x + y) ≤
          (((n + 1 : ℕ) : ℝ) * C * M ^ n) ^ ((n : ℝ)⁻¹) := by
      rw [Real.le_rpow_inv_iff_of_pos (v.nonneg (x + y)) hright_nonneg hn_pos]
      simpa [Real.rpow_natCast] using hpow
    calc
      v (x + y)
          ≤ (((n + 1 : ℕ) : ℝ) * C * M ^ n) ^ ((n : ℝ)⁻¹) := hroot
      _ = ((((n + 1 : ℕ) : ℝ) * C) ^ ((n : ℝ)⁻¹)) * M := by
            have hcoef_nonneg : 0 ≤ ((n + 1 : ℕ) : ℝ) * C :=
              mul_nonneg (by positivity) (le_of_lt hC_pos)
            rw [Real.mul_rpow hcoef_nonneg (pow_nonneg hM_nonneg n)]
            rw [Real.pow_rpow_inv_natCast hM_nonneg hn]
      _ = ((((n + 1 : ℕ) : ℝ) * C) ^ ((n : ℝ)⁻¹)) *
            max (v x) (v y) := by
            rfl
 

theorem strong_triangle_of_nonarchimedean
    {K : Type*} [Field K] (v : AbsoluteValue K ℝ)
    (hnonarch : NonarchimedeanAbsoluteValue v) :
    StrongTriangle v := by
  rcases hnonarch with ⟨C, hC⟩
  have hC_pos : 0 < C :=
    zero_lt_one.trans_le (nat_bound_ge_one v hC)
  intro x y
  let M : ℝ := max (v x) (v y)
  have hlim :
      Tendsto
        (fun n : ℕ =>
          ((((n + 1 : ℕ) : ℝ) * C) ^ ((n : ℝ)⁻¹)) * M)
        atTop (𝓝 M) := by
    simpa using
      (tendsto_linear_bound_rpow_inv hC_pos).mul
        (tendsto_const_nhds (x := M))
  have heventually :
      ∀ᶠ n : ℕ in atTop,
        v (x + y) ≤
          ((((n + 1 : ℕ) : ℝ) * C) ^ ((n : ℝ)⁻¹)) * M := by
    refine eventually_atTop.2 ⟨1, ?_⟩
    intro n hn
    exact add_le_root_bound_of_bounded_nat
      (v := v) hC x y (n := n) (by omega)
  have hle :
      v (x + y) ≤ M :=
    le_of_tendsto_of_tendsto tendsto_const_nhds hlim heventually
  simpa [M, StrongTriangle] using hle
end Valuations
end LubinTate
end
end

/- ValuedFieldTheory.Valuation.AbsoluteValue.ValuationSubring -/
section
noncomputable section
open scoped Polynomial
namespace AlgebraicNumberTheory
namespace Valuations
 

def absoluteValueUnitBallSubring
    {K : Type*} [Field K] (v : AbsoluteValue K ℝ)
    (hnonarch : LubinTate.Valuations.NonarchimedeanAbsoluteValue v) : Subring K where
  carrier := {x | v x ≤ 1}
  zero_mem' := by simp
  one_mem' := by simp
  add_mem' := by
    intro x y hx hy
    exact (LubinTate.Valuations.strong_triangle_of_nonarchimedean
      v hnonarch x y).trans (max_le hx hy)
  neg_mem' := by
    intro x hx
    simpa using hx
  mul_mem' := by
    intro x y hx hy
    change v (x * y) ≤ 1
    rw [v.map_mul]
    exact mul_le_one₀ hx (v.nonneg y) hy
 

theorem mem_absoluteValueUnitBallSubring_iff
    {K : Type*} [Field K] (v : AbsoluteValue K ℝ)
    (hnonarch : LubinTate.Valuations.NonarchimedeanAbsoluteValue v) (x : K) :
    x ∈ absoluteValueUnitBallSubring v hnonarch ↔ v x ≤ 1 :=
  Iff.rfl
 

theorem absoluteValueUnitBallSubring_mem_or_inv_mem
    {K : Type*} [Field K] (v : AbsoluteValue K ℝ)
    (hnonarch : LubinTate.Valuations.NonarchimedeanAbsoluteValue v) (x : K) :
    x ∈ absoluteValueUnitBallSubring v hnonarch ∨
      x⁻¹ ∈ absoluteValueUnitBallSubring v hnonarch := by
  by_cases hx : v x ≤ 1
  · exact Or.inl ((mem_absoluteValueUnitBallSubring_iff
      v hnonarch x).2 hx)
  · right
    have hx_gt : 1 < v x := lt_of_not_ge hx
    rw [mem_absoluteValueUnitBallSubring_iff, map_inv₀]
    exact inv_le_one_of_one_le₀ hx_gt.le
 

def absoluteValueValuationSubring
    {K : Type*} [Field K] (v : AbsoluteValue K ℝ)
    (hnonarch : LubinTate.Valuations.NonarchimedeanAbsoluteValue v) :
    ValuationSubring K :=
  ValuationSubring.ofSubring
    (absoluteValueUnitBallSubring v hnonarch)
    (absoluteValueUnitBallSubring_mem_or_inv_mem v hnonarch)
 

theorem mem_absoluteValueValuationSubring_iff
    {K : Type*} [Field K] (v : AbsoluteValue K ℝ)
    (hnonarch : LubinTate.Valuations.NonarchimedeanAbsoluteValue v) (x : K) :
    x ∈ absoluteValueValuationSubring v hnonarch ↔
      v x ≤ 1 := by
  exact (ValuationSubring.mem_ofSubring
    (absoluteValueUnitBallSubring v hnonarch)
    (absoluteValueUnitBallSubring_mem_or_inv_mem v hnonarch) x).trans
    (mem_absoluteValueUnitBallSubring_iff v hnonarch x)
 


theorem isUnit_iff_abs_eq_one_of_mem_iff_le_one
    {K : Type*} [Field K] (v : AbsoluteValue K ℝ)
    {C : Type*} [SetLike C K] [SubmonoidClass C K]
    (S : C) (hS : ∀ x : K, x ∈ S ↔ v x ≤ 1) (x : S) :
    IsUnit x ↔ v (x : K) = 1 := by
  constructor
  · intro hx
    have hx_inv :=
      (Submonoid.isUnit_iff_and (S := S) (a := x)).mp hx
    have hx_le : v (x : K) ≤ 1 := (hS (x : K)).1 x.property
    have hinv_le : v ((x : K)⁻¹) ≤ 1 :=
      (hS ((x : K)⁻¹)).1 hx_inv.2
    have hmul : v (x : K) * v ((x : K)⁻¹) = 1 := by
      rw [← v.map_mul, mul_inv_cancel₀ hx_inv.1]
      simp
    have hge : 1 ≤ v (x : K) := by
      calc
        1 = v (x : K) * v ((x : K)⁻¹) := hmul.symm
        _ ≤ v (x : K) * 1 :=
          mul_le_mul_of_nonneg_left hinv_le (v.nonneg (x : K))
        _ = v (x : K) := by simp
    exact le_antisymm hx_le hge
  · intro hx
    rw [Submonoid.isUnit_iff_and (S := S) (a := x)]
    constructor
    · intro hx_zero
      have hzero_one : (0 : ℝ) = 1 := by
        simp [hx_zero] at hx
      exact zero_ne_one hzero_one
    · exact (hS ((x : K)⁻¹)).2 <| by
        rw [map_inv₀, hx]
        simp
 

theorem not_isUnit_iff_abs_lt_one_of_mem_iff_le_one
    {K : Type*} [Field K] (v : AbsoluteValue K ℝ)
    {C : Type*} [SetLike C K] [SubmonoidClass C K]
    (S : C) (hS : ∀ x : K, x ∈ S ↔ v x ≤ 1) (x : S) :
    ¬ IsUnit x ↔ v (x : K) < 1 := by
  have hx_le : v (x : K) ≤ 1 := (hS (x : K)).1 x.property
  rw [isUnit_iff_abs_eq_one_of_mem_iff_le_one v S hS]
  exact hx_le.lt_iff_ne.symm
end Valuations
end AlgebraicNumberTheory
end
end

/- ValuedFieldTheory.Valuation.AbsoluteValue.AlgebraicExtension.Core -/
section
noncomputable section
namespace AbsoluteValue
private abbrev algebraicExtension_standardRealAbsoluteValue : AbsoluteValue ℝ ℝ :=
  NormedField.toAbsoluteValue ℝ
 

private abbrev algebraicExtension_standardComplexAbsoluteValue : AbsoluteValue ℂ ℝ :=
  NormedField.toAbsoluteValue ℂ
 


noncomputable def rpow
    {F : Type*} [Field F] (v : AbsoluteValue F ℝ)
    (s : ℝ) (hs0 : 0 < s) (hs1 : s ≤ 1) : AbsoluteValue F ℝ where
  toFun x := v x ^ s
  map_mul' x y := by
    rw [v.map_mul, Real.mul_rpow (v.nonneg x) (v.nonneg y)]
  nonneg' x := Real.rpow_nonneg (v.nonneg x) s
  eq_zero' x := by
    rw [Real.rpow_eq_zero (v.nonneg x) hs0.ne']
    exact v.eq_zero
  add_le' x y := by
    calc
      v (x + y) ^ s ≤ (v x + v y) ^ s :=
        Real.rpow_le_rpow (v.nonneg _) (v.add_le x y) hs0.le
      _ ≤ v x ^ s + v y ^ s :=
        Real.rpow_add_le_add_rpow (v.nonneg x) (v.nonneg y) hs0.le hs1
 
@[simp]
theorem rpow_apply
    {F : Type*} [Field F] (v : AbsoluteValue F ℝ)
    (s : ℝ) (hs0 : 0 < s) (hs1 : s ≤ 1) (x : F) :
    rpow v s hs0 hs1 x = v x ^ s :=
  rfl
 
private theorem algebraicExtension_standardComplexAbsoluteValue_extends_standardReal
    (x : ℝ) :
    algebraicExtension_standardComplexAbsoluteValue (algebraMap ℝ ℂ x) =
      algebraicExtension_standardRealAbsoluteValue x := by
  change ‖(algebraMap ℝ ℂ x)‖ = ‖x‖
  simp
 


noncomputable def compAlgEquiv
    {K L E : Type*} [Field K] [Field L] [Field E]
    [Algebra K L] [Algebra K E] (e : L ≃ₐ[K] E)
    (w : AbsoluteValue E ℝ) : AbsoluteValue L ℝ :=
  w.comp (f := e.toRingHom) e.injective
 
@[simp]
theorem compAlgEquiv_extends_apply
    {K L E : Type*} [Field K] [Field L] [Field E]
    [Algebra K L] [Algebra K E] (e : L ≃ₐ[K] E)
    (w : AbsoluteValue E ℝ) (v : AbsoluteValue K ℝ)
    (hw : ∀ x : K, w (algebraMap K E x) = v x)
    (x : K) :
    compAlgEquiv e w (algebraMap K L x) =
      v x := by
  change w (e (algebraMap K L x)) = v x
  rw [AlgEquiv.commutes, hw]
private theorem algebraicExtension_real_algEquiv_real_unique_rpow_extension
    {L : Type*} [Field L] [Algebra ℝ L] (e : L ≃ₐ[ℝ] ℝ)
    (s : ℝ) (hs0 : 0 < s) (hs1 : s ≤ 1)
    (w : AbsoluteValue L ℝ)
    (hw : ∀ x : ℝ, w (algebraMap ℝ L x) =
      algebraicExtension_standardRealAbsoluteValue x ^ s) :
    w = rpow
      (compAlgEquiv
        e algebraicExtension_standardRealAbsoluteValue)
      s hs0 hs1 := by
  ext x
  have hx : x = algebraMap ℝ L (e x) := by
    calc
      x = e.symm (e x) := by simp
      _ = algebraMap ℝ L (e x) := by
        simpa using (AlgEquiv.commutes e.symm (e x))
  rw [hx, hw]
  exact congrArg (fun t : ℝ => t ^ s)
    (compAlgEquiv_extends_apply e
      algebraicExtension_standardRealAbsoluteValue algebraicExtension_standardRealAbsoluteValue
      (fun x => rfl) (e x)).symm
 


private theorem algebraicExtension_real_algEquiv_complex_unique_rpow_extension
    {L : Type*} [Field L] [Algebra ℝ L] (e : L ≃ₐ[ℝ] ℂ)
    (s : ℝ) (hs0 : 0 < s) (hs1 : s ≤ 1)
    (w : AbsoluteValue L ℝ)
    (hw : ∀ x : ℝ, w (algebraMap ℝ L x) =
      algebraicExtension_standardRealAbsoluteValue x ^ s) :
    w = rpow
      (compAlgEquiv
        e algebraicExtension_standardComplexAbsoluteValue)
      s hs0 hs1 := by
  let e' : WithAbs w ≃ₐ[ℝ] ℂ :=
    (WithAbs.algEquiv ℝ w).trans e
  have hnorm :
      ∀ r : ℝ, ‖algebraMap ℝ (WithAbs w) r‖ = ‖r‖ ^ s := by
    intro r
    rw [WithAbs.norm_eq_apply_ofAbs, WithAbs.algebraMap_right_apply]
    change w (algebraMap ℝ L r) =
      algebraicExtension_standardRealAbsoluteValue r ^ s
    exact hw r
  ext x
  let y : WithAbs w := WithAbs.toAbs w x
  change w x = ‖e x‖ ^ s
  calc
    w x = ‖y‖ := by
      simp [y, WithAbs.norm_eq_apply_ofAbs]
    _ = ‖e'.symm (e' y)‖ := by simp
    _ = ‖e' y‖ ^ s :=
      AlgEquiv.norm_symm_apply_eq_norm_rpow
        (F := WithAbs w) (s := s) hs0 hnorm e' (e' y)
    _ = ‖e x‖ ^ s := by simp [y, e']
 

private theorem algebraicExtension_complex_algEquiv_complex_unique_rpow_extension
    {L : Type*} [Field L] [Algebra ℂ L] (e : L ≃ₐ[ℂ] ℂ)
    (s : ℝ) (hs0 : 0 < s) (hs1 : s ≤ 1)
    (w : AbsoluteValue L ℝ)
    (hw : ∀ z : ℂ, w (algebraMap ℂ L z) =
      algebraicExtension_standardComplexAbsoluteValue z ^ s) :
    w = rpow
      (compAlgEquiv
        e algebraicExtension_standardComplexAbsoluteValue)
      s hs0 hs1 := by
  ext x
  have hx : x = algebraMap ℂ L (e x) := by
    calc
      x = e.symm (e x) := by simp
      _ = algebraMap ℂ L (e x) := by
        simpa using (AlgEquiv.commutes e.symm (e x))
  rw [hx, hw]
  exact congrArg (fun t : ℝ => t ^ s)
    (compAlgEquiv_extends_apply e
      algebraicExtension_standardComplexAbsoluteValue algebraicExtension_standardComplexAbsoluteValue
      (fun z => rfl) (e x)).symm
 
structure UniqueExtension
    {K L : Type*} [Field K] [Field L] [Algebra K L]
    (v : AbsoluteValue K ℝ) where
   
  extension : AbsoluteValue L ℝ
   
  isExtension : Extends v extension
   
  unique :
    ∀ w : AbsoluteValue L ℝ,
      Extends v w → w = extension
private noncomputable def algebraicExtension_realRpow
    {L : Type*} [Field L] [Algebra ℝ L] [Algebra.IsAlgebraic ℝ L]
    (s : ℝ) (hs0 : 0 < s) (hs1 : s ≤ 1) :
    UniqueExtension (K := ℝ) (L := L)
      (rpow
        algebraicExtension_standardRealAbsoluteValue s hs0 hs1) :=
  Classical.choice <| by
    rcases Real.nonempty_algEquiv_or L with hreal | hcomplex
    · rcases hreal with ⟨e⟩
      exact ⟨
        { extension :=
            rpow
              (compAlgEquiv
                e algebraicExtension_standardRealAbsoluteValue)
              s hs0 hs1
          isExtension := by
            intro x
            simp only [rpow_apply]
            rw [compAlgEquiv_extends_apply e
              algebraicExtension_standardRealAbsoluteValue
              algebraicExtension_standardRealAbsoluteValue (fun x => rfl) x]
          unique :=
            algebraicExtension_real_algEquiv_real_unique_rpow_extension
              e s hs0 hs1 }⟩
    · rcases hcomplex with ⟨e⟩
      exact ⟨
        { extension :=
            rpow
              (compAlgEquiv
                e algebraicExtension_standardComplexAbsoluteValue)
              s hs0 hs1
          isExtension := by
            intro x
            simp only [rpow_apply]
            rw [compAlgEquiv_extends_apply e
              algebraicExtension_standardComplexAbsoluteValue
              algebraicExtension_standardRealAbsoluteValue
              algebraicExtension_standardComplexAbsoluteValue_extends_standardReal x]
          unique :=
            algebraicExtension_real_algEquiv_complex_unique_rpow_extension
              e s hs0 hs1 }⟩
 


private noncomputable def algebraicExtension_complexRpow
    {L : Type*} [Field L] [Algebra ℂ L] [Algebra.IsAlgebraic ℂ L]
    (s : ℝ) (hs0 : 0 < s) (hs1 : s ≤ 1) :
    UniqueExtension (K := ℂ) (L := L)
      (rpow
        algebraicExtension_standardComplexAbsoluteValue s hs0 hs1) := by
  letI : Algebra.IsIntegral ℂ L := Algebra.IsAlgebraic.isIntegral
  let e0 : ℂ ≃ₐ[ℂ] L :=
    AlgEquiv.ofBijective (Algebra.ofId ℂ L)
      (IsAlgClosed.algebraMap_bijective_of_isIntegral (k := ℂ) (K := L))
  let e : L ≃ₐ[ℂ] ℂ := e0.symm
  exact
    { extension :=
        rpow
          (compAlgEquiv
            e algebraicExtension_standardComplexAbsoluteValue)
          s hs0 hs1
      isExtension := by
        intro z
        simp only [rpow_apply]
        rw [compAlgEquiv_extends_apply e
          algebraicExtension_standardComplexAbsoluteValue
          algebraicExtension_standardComplexAbsoluteValue (fun z => rfl) z]
      unique :=
        algebraicExtension_complex_algEquiv_complex_unique_rpow_extension
          e s hs0 hs1 }
 
private theorem algebraicExtension_isAlgebraic_of_base_ringEquiv
    {K E L : Type*} [Field K] [Field E] [Field L] [Algebra K L]
    [Algebra.IsAlgebraic K L] (σ : K ≃+* E) :
    letI : Algebra E K := RingHom.toAlgebra σ.symm.toRingHom
    letI : Algebra E L :=
      RingHom.toAlgebra ((algebraMap K L).comp σ.symm.toRingHom)
    Algebra.IsAlgebraic E L := by
  let : Algebra E K := RingHom.toAlgebra σ.symm.toRingHom
  let : Algebra E L :=
    RingHom.toAlgebra ((algebraMap K L).comp σ.symm.toRingHom)
  have : IsScalarTower E K L :=
    IsScalarTower.of_algebraMap_eq (fun r => by
      simp [RingHom.algebraMap_toAlgebra])
  let e : K ≃ₐ[E] E := AlgEquiv.ofRingEquiv (f := σ) (by
    intro r
    simp [RingHom.algebraMap_toAlgebra])
  have : Algebra.IsAlgebraic E K := e.symm.isAlgebraic
  exact Algebra.IsAlgebraic.trans E K L
 


private noncomputable def algebraicExtension_baseRingEquiv
    {K E L : Type*} [Field K] [Field E] [Field L] [Algebra K L]
    (σ : K ≃+* E) (vK : AbsoluteValue K ℝ) (vE : AbsoluteValue E ℝ)
    (hvσ : ∀ x : K, vE (σ x) = vK x)
    (R :
      letI : Algebra E L :=
        RingHom.toAlgebra ((algebraMap K L).comp σ.symm.toRingHom)
      UniqueExtension (K := E) (L := L) vE) :
    UniqueExtension (K := K) (L := L) vK := by
  letI : Algebra E L :=
    RingHom.toAlgebra ((algebraMap K L).comp σ.symm.toRingHom)
  exact
    { extension := R.extension
      isExtension := by
        intro x
        have hbase := R.isExtension (σ x)
        have hmap :
            algebraMap E L (σ x) = algebraMap K L x := by
          simp [RingHom.algebraMap_toAlgebra]
        calc
          R.extension (algebraMap K L x)
              = R.extension (algebraMap E L (σ x)) := by rw [hmap]
          _ = vE (σ x) := hbase
          _ = vK x := hvσ x
      unique := by
        intro w hw
        apply R.unique w
        intro z
        have hmap :
            algebraMap E L z = algebraMap K L (σ.symm z) := by
          simp [RingHom.algebraMap_toAlgebra]
        calc
          w (algebraMap E L z)
              = w (algebraMap K L (σ.symm z)) := by rw [hmap]
          _ = vK (σ.symm z) := hw (σ.symm z)
          _ = vE z := by
            simpa using (hvσ (σ.symm z)).symm }
 
private noncomputable def algebraicExtension_archimedean
    {K L : Type*} [Field K] [Field L] [Algebra K L]
    [Algebra.IsAlgebraic K L]
    (v : AbsoluteValue K ℝ)
    (hcomplete : CompleteSpace (WithAbs v))
    (harch : ¬ IsNonarchimedean (v : K → ℝ)) :
    UniqueExtension (K := K) (L := L) v :=
  Classical.choice <| by
  classical
  let : CharZero K := AbsoluteValue.charZero_of_not_isNonarchimedean v harch
  rcases AbsoluteValue.ostrowski_of_complete v hcomplete harch with
    ⟨s, hs0, hs1, hbranch⟩
  rcases hbranch with hreal | hcomplex
  · rcases hreal with ⟨σ, hσ⟩
    let : Algebra ℝ K := RingHom.toAlgebra σ.symm.toRingHom
    let : Algebra ℝ L :=
      RingHom.toAlgebra ((algebraMap K L).comp σ.symm.toRingHom)
    have : Algebra.IsAlgebraic ℝ L :=
      algebraicExtension_isAlgebraic_of_base_ringEquiv (K := K) (E := ℝ)
        (L := L) σ
    let R :=
      algebraicExtension_realRpow
        (L := L) s hs0 hs1
    exact ⟨
      algebraicExtension_baseRingEquiv
        (K := K) (E := ℝ) (L := L) σ v
        (rpow
          algebraicExtension_standardRealAbsoluteValue s hs0 hs1)
        (fun x => (hσ x).symm) R⟩
  · rcases hcomplex with ⟨σ, hσ⟩
    let : Algebra ℂ K := RingHom.toAlgebra σ.symm.toRingHom
    let : Algebra ℂ L :=
      RingHom.toAlgebra ((algebraMap K L).comp σ.symm.toRingHom)
    have : Algebra.IsAlgebraic ℂ L :=
      algebraicExtension_isAlgebraic_of_base_ringEquiv (K := K) (E := ℂ)
        (L := L) σ
    let R :=
      algebraicExtension_complexRpow
        (L := L) s hs0 hs1
    exact ⟨
      algebraicExtension_baseRingEquiv
        (K := K) (E := ℂ) (L := L) σ v
        (rpow
          algebraicExtension_standardComplexAbsoluteValue s hs0 hs1)
        (fun x => (hσ x).symm) R⟩
 

private noncomputable def algebraicExtension_nonarchimedean
    {K L : Type*} [Field K] [Field L] [Algebra K L]
    [Algebra.IsAlgebraic K L]
    (v : AbsoluteValue K ℝ)
    (hcomplete : CompleteSpace (WithAbs v))
    (hnonarch : IsNonarchimedean (v : K → ℝ))
    (hv : v.IsNontrivial) :
    UniqueExtension (K := K) (L := L) v where
  extension :=
    spectralExtension (K := K) (L := L)
      v hcomplete hnonarch hv
  isExtension :=
    spectralExtension_extends
      (K := K) (L := L) v hcomplete hnonarch hv
  unique :=
    eq_spectralExtension_of_extends
      (K := K) (L := L) v hcomplete hnonarch hv
 



noncomputable def uniqueAlgebraicExtension
    {K L : Type*} [Field K] [Field L] [Algebra K L]
    [Algebra.IsAlgebraic K L]
    (v : AbsoluteValue K ℝ)
    (hcomplete : CompleteSpace (WithAbs v))
    (hv : v.IsNontrivial) :
    UniqueExtension (K := K) (L := L) v := by
  by_cases hnonarch : IsNonarchimedean (v : K → ℝ)
  · exact algebraicExtension_nonarchimedean
      v hcomplete hnonarch hv
  · exact algebraicExtension_archimedean
      v hcomplete hnonarch
end AbsoluteValue
end
end

/- ValuedFieldTheory.Valuation.Completion.AbsoluteValueExtensions -/
section
noncomputable section
open scoped Topology
namespace AlgebraicNumberTheory
namespace Valuations
universe u v
 

abbrev AbsoluteValueExtension
    {K : Type u} [Field K] (vK : AbsoluteValue K ℝ)
    (L : Type v) [Field L] [Algebra K L] :=
  {w : AbsoluteValue L ℝ // AbsoluteValue.Extends vK w}
 
abbrev absoluteValueExtension_algebraicCompletionClosure
    {K : Type u} [Field K] (vK : AbsoluteValue K ℝ) :=
  AlgebraicClosure vK.Completion
 

noncomputable def absoluteValueExtension_algebraicClosureAbsoluteValue
    {K : Type u} [Field K] (vK : AbsoluteValue K ℝ)
    (hvK : vK.IsNontrivial) :
    AbsoluteValue (absoluteValueExtension_algebraicCompletionClosure vK) ℝ :=
  (AbsoluteValue.uniqueAlgebraicExtension
    (AbsoluteValue.completionAbsoluteValue vK)
    (AbsoluteValue.completionAbsoluteValue_complete vK)
    (AbsoluteValue.completionAbsoluteValue_isNontrivial vK hvK)).extension
@[simp]
theorem absoluteValueExtension_algebraicClosureAbsoluteValue_algebraMap
    {K : Type u} [Field K] (vK : AbsoluteValue K ℝ)
    (hvK : vK.IsNontrivial) (x : vK.Completion) :
    absoluteValueExtension_algebraicClosureAbsoluteValue vK hvK
        (algebraMap vK.Completion
          (absoluteValueExtension_algebraicCompletionClosure vK) x) =
      AbsoluteValue.completionAbsoluteValue vK x := by
  exact
    (AbsoluteValue.uniqueAlgebraicExtension
      (AbsoluteValue.completionAbsoluteValue vK)
      (AbsoluteValue.completionAbsoluteValue_complete vK)
      (AbsoluteValue.completionAbsoluteValue_isNontrivial vK hvK)).isExtension x
 
noncomputable def absoluteValueExtension_localizationEmbedding
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    [Algebra.IsAlgebraic K L]
    (vK : AbsoluteValue K ℝ) (w : AbsoluteValueExtension vK L) :
    letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
    letI : SMul K w.1.Completion := hK.toSMul
    letI := AbsoluteValue.completionAlgebra vK w.1 w.2
    AbsoluteValue.algebraicLocalization vK w.1 w.2 →ₐ[vK.Completion]
      absoluteValueExtension_algebraicCompletionClosure vK := by
  letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  letI : SMul K w.1.Completion := hK.toSMul
  letI := AbsoluteValue.completionAlgebra vK w.1 w.2
  letI : Algebra.IsAlgebraic vK.Completion
      (AbsoluteValue.algebraicLocalization vK w.1 w.2) :=
    AbsoluteValue.algebraicLocalization_isAlgebraic vK w.1 w.2
  letI : Module.IsTorsionFree vK.Completion
      (AbsoluteValue.algebraicLocalization vK w.1 w.2) :=
    Module.isTorsionFree_iff_algebraMap_injective.mpr
      (algebraMap vK.Completion
        (AbsoluteValue.algebraicLocalization vK w.1 w.2)).injective
  letI : Module.IsTorsionFree vK.Completion
      (absoluteValueExtension_algebraicCompletionClosure vK) :=
    Module.isTorsionFree_iff_algebraMap_injective.mpr
      (algebraMap vK.Completion
        (absoluteValueExtension_algebraicCompletionClosure vK)).injective
  exact IsAlgClosed.lift
 

theorem absoluteValueExtension_localizationAbsoluteValue_eq_pullback
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    [Algebra.IsAlgebraic K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (w : AbsoluteValueExtension vK L) :
    letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
    letI : SMul K w.1.Completion := hK.toSMul
    letI := AbsoluteValue.completionAlgebra vK w.1 w.2
    AbsoluteValue.algebraicLocalizationAbsoluteValue vK w.1 w.2 =
      (absoluteValueExtension_algebraicClosureAbsoluteValue vK hvK).comp
        (absoluteValueExtension_localizationEmbedding vK w).injective := by
  let hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  let : SMul K w.1.Completion := hK.toSMul
  let := AbsoluteValue.completionAlgebra vK w.1 w.2
  let : Algebra.IsAlgebraic vK.Completion
      (AbsoluteValue.algebraicLocalization vK w.1 w.2) :=
    AbsoluteValue.algebraicLocalization_isAlgebraic vK w.1 w.2
  let R := AbsoluteValue.uniqueAlgebraicExtension
    (K := vK.Completion) (L := AbsoluteValue.algebraicLocalization vK w.1 w.2)
    (AbsoluteValue.completionAbsoluteValue vK)
    (AbsoluteValue.completionAbsoluteValue_complete vK)
    (AbsoluteValue.completionAbsoluteValue_isNontrivial vK hvK)
  have hleft : AbsoluteValue.algebraicLocalizationAbsoluteValue vK w.1 w.2 = R.extension :=
    R.unique _ (AbsoluteValue.algebraicLocalizationAbsoluteValue_extends vK w.1 w.2)
  have hright :
      (absoluteValueExtension_algebraicClosureAbsoluteValue vK hvK).comp
          (absoluteValueExtension_localizationEmbedding vK w).injective = R.extension := by
    apply R.unique
    intro x
    change absoluteValueExtension_algebraicClosureAbsoluteValue vK hvK
      (absoluteValueExtension_localizationEmbedding vK w
        (algebraMap vK.Completion (AbsoluteValue.algebraicLocalization vK w.1 w.2) x)) = _
    rw [(absoluteValueExtension_localizationEmbedding vK w).commutes]
    exact absoluteValueExtension_algebraicClosureAbsoluteValue_algebraMap vK hvK x
  exact hleft.trans hright.symm
 
noncomputable def absoluteValueExtension_pullback
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (tau : L →ₐ[K] absoluteValueExtension_algebraicCompletionClosure vK) :
    AbsoluteValue L ℝ :=
  (absoluteValueExtension_algebraicClosureAbsoluteValue vK hvK).comp tau.injective
 
theorem absoluteValueExtension_pullback_extends
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (tau : L →ₐ[K] absoluteValueExtension_algebraicCompletionClosure vK) :
    AbsoluteValue.Extends vK (absoluteValueExtension_pullback vK hvK tau) := by
  intro x
  change absoluteValueExtension_algebraicClosureAbsoluteValue vK hvK
    (tau (algebraMap K L x)) = vK x
  rw [tau.commutes,
    IsScalarTower.algebraMap_apply K vK.Completion
      (absoluteValueExtension_algebraicCompletionClosure vK),
    absoluteValueExtension_algebraicClosureAbsoluteValue_algebraMap]
  exact AbsoluteValue.completionAbsoluteValue_coe vK x
 
noncomputable def absoluteValueExtension_embeddingOfExtension
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    [Algebra.IsAlgebraic K L]
    (vK : AbsoluteValue K ℝ) (w : AbsoluteValueExtension vK L) :
    L →ₐ[K] absoluteValueExtension_algebraicCompletionClosure vK := by
  letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  letI : SMul K w.1.Completion := hK.toSMul
  letI := AbsoluteValue.completionAlgebra vK w.1 w.2
  let phi := absoluteValueExtension_localizationEmbedding vK w
  refine
    { __ := phi.toRingHom.comp (AbsoluteValue.toAlgebraicLocalization vK w.1 w.2)
      commutes' := ?_ }
  intro x
  change phi (AbsoluteValue.toAlgebraicLocalization vK w.1 w.2
    (algebraMap K L x)) = algebraMap K
      (absoluteValueExtension_algebraicCompletionClosure vK) x
  rw [AbsoluteValue.toAlgebraicLocalization_algebraMap,
    phi.commutes]
  rfl
 

theorem absoluteValueExtension_extension_eq_pullback_embeddingOfExtension
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    [Algebra.IsAlgebraic K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (w : AbsoluteValueExtension vK L) :
    w.1 = absoluteValueExtension_pullback vK hvK
      (absoluteValueExtension_embeddingOfExtension vK w) := by
  ext x
  let hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  let : SMul K w.1.Completion := hK.toSMul
  let := AbsoluteValue.completionAlgebra vK w.1 w.2
  have h := congrArg
    (fun a : AbsoluteValue (AbsoluteValue.algebraicLocalization vK w.1 w.2) ℝ =>
      a (AbsoluteValue.toAlgebraicLocalization vK w.1 w.2 x))
    (absoluteValueExtension_localizationAbsoluteValue_eq_pullback vK hvK w)
  calc
    w.1 x = AbsoluteValue.algebraicLocalizationAbsoluteValue vK w.1 w.2
        (AbsoluteValue.toAlgebraicLocalization vK w.1 w.2 x) :=
      (AbsoluteValue.algebraicLocalizationAbsoluteValue_toAlgebraicLocalization vK w.1 w.2 x).symm
    _ = absoluteValueExtension_pullback vK hvK
        (absoluteValueExtension_embeddingOfExtension vK w) x := by
      change AbsoluteValue.algebraicLocalizationAbsoluteValue vK w.1 w.2
          (AbsoluteValue.toAlgebraicLocalization vK w.1 w.2 x) =
        (absoluteValueExtension_algebraicClosureAbsoluteValue vK hvK).comp
          (absoluteValueExtension_localizationEmbedding vK w).injective
          (AbsoluteValue.toAlgebraicLocalization vK w.1 w.2 x)
      exact h
 
def AbsoluteValueExtensionConjugateOverCompletion
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ)
    (tau tau' : L →ₐ[K] absoluteValueExtension_algebraicCompletionClosure vK) : Prop :=
  ∃ sigma : absoluteValueExtension_algebraicCompletionClosure vK ≃ₐ[vK.Completion]
      absoluteValueExtension_algebraicCompletionClosure vK,
    ∀ x : L, tau' x = sigma (tau x)
 

theorem absoluteValueExtension_algebraicClosureAbsoluteValue_algEquiv
    {K : Type u} [Field K] (vK : AbsoluteValue K ℝ)
    (hvK : vK.IsNontrivial)
    (sigma : absoluteValueExtension_algebraicCompletionClosure vK
      ≃ₐ[vK.Completion] absoluteValueExtension_algebraicCompletionClosure vK)
    (x : absoluteValueExtension_algebraicCompletionClosure vK) :
    absoluteValueExtension_algebraicClosureAbsoluteValue vK hvK (sigma x) =
      absoluteValueExtension_algebraicClosureAbsoluteValue vK hvK x := by
  let R := AbsoluteValue.uniqueAlgebraicExtension
    (K := vK.Completion)
    (L := absoluteValueExtension_algebraicCompletionClosure vK)
    (AbsoluteValue.completionAbsoluteValue vK)
    (AbsoluteValue.completionAbsoluteValue_complete vK)
    (AbsoluteValue.completionAbsoluteValue_isNontrivial vK hvK)
  let a : AbsoluteValue (absoluteValueExtension_algebraicCompletionClosure vK) ℝ :=
    (absoluteValueExtension_algebraicClosureAbsoluteValue vK hvK).comp
      (f := sigma.toRingHom) sigma.injective
  have ha : a = absoluteValueExtension_algebraicClosureAbsoluteValue vK hvK := by
    change a = R.extension
    apply R.unique
    intro y
    change absoluteValueExtension_algebraicClosureAbsoluteValue vK hvK
      (sigma (algebraMap vK.Completion
        (absoluteValueExtension_algebraicCompletionClosure vK) y)) = _
    rw [sigma.commutes]
    exact absoluteValueExtension_algebraicClosureAbsoluteValue_algebraMap vK hvK y
  exact congrArg (fun b : AbsoluteValue _ ℝ => b x) ha
 
theorem absoluteValueExtension_pullback_eq_of_conjugate
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    {tau tau' : L →ₐ[K] absoluteValueExtension_algebraicCompletionClosure vK}
    (hconj : AbsoluteValueExtensionConjugateOverCompletion vK tau tau') :
    absoluteValueExtension_pullback vK hvK tau =
      absoluteValueExtension_pullback vK hvK tau' := by
  rcases hconj with ⟨sigma, hsigma⟩
  ext x
  change absoluteValueExtension_algebraicClosureAbsoluteValue vK hvK (tau x) =
    absoluteValueExtension_algebraicClosureAbsoluteValue vK hvK (tau' x)
  rw [hsigma x, absoluteValueExtension_algebraicClosureAbsoluteValue_algEquiv]
 
noncomputable def absoluteValueExtension_algebraicClosureToCompletionRingHom
    {K : Type u} [Field K] (vK : AbsoluteValue K ℝ)
    (hvK : vK.IsNontrivial) :
    absoluteValueExtension_algebraicCompletionClosure vK →+*
      (absoluteValueExtension_algebraicClosureAbsoluteValue vK hvK).Completion :=
  UniformSpace.Completion.coeRingHom.comp
    (WithAbs.equiv
      (absoluteValueExtension_algebraicClosureAbsoluteValue vK hvK)).symm.toRingHom
@[simp]
theorem absoluteValueExtension_algebraicClosureToCompletionRingHom_apply
    {K : Type u} [Field K] (vK : AbsoluteValue K ℝ)
    (hvK : vK.IsNontrivial)
    (x : absoluteValueExtension_algebraicCompletionClosure vK) :
    absoluteValueExtension_algebraicClosureToCompletionRingHom vK hvK x =
      ((WithAbs.equiv
        (absoluteValueExtension_algebraicClosureAbsoluteValue vK hvK)).symm x :
          (absoluteValueExtension_algebraicClosureAbsoluteValue vK hvK).Completion) :=
  rfl
 


noncomputable def absoluteValueExtension_algebraicClosureCompletionAlgebra
    {K : Type u} [Field K] (vK : AbsoluteValue K ℝ)
    (hvK : vK.IsNontrivial) :
    Algebra vK.Completion
      (absoluteValueExtension_algebraicClosureAbsoluteValue vK hvK).Completion :=
  ((absoluteValueExtension_algebraicClosureToCompletionRingHom vK hvK).comp
    (algebraMap vK.Completion
      (absoluteValueExtension_algebraicCompletionClosure vK))).toAlgebra
 
noncomputable def absoluteValueExtension_algebraicClosureToCompletionAlgHom
    {K : Type u} [Field K] (vK : AbsoluteValue K ℝ)
    (hvK : vK.IsNontrivial) :
    letI := absoluteValueExtension_algebraicClosureCompletionAlgebra vK hvK
    absoluteValueExtension_algebraicCompletionClosure vK →ₐ[vK.Completion]
      (absoluteValueExtension_algebraicClosureAbsoluteValue vK hvK).Completion := by
  letI := absoluteValueExtension_algebraicClosureCompletionAlgebra vK hvK
  exact
    { __ := absoluteValueExtension_algebraicClosureToCompletionRingHom vK hvK
      commutes' _ := rfl }
 

noncomputable def absoluteValueExtension_embeddingToAlgebraicClosureCompletionRingHom
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (w : AbsoluteValueExtension vK L)
    (tau : L →ₐ[K] absoluteValueExtension_algebraicCompletionClosure vK) :
    WithAbs w.1 →+*
      (absoluteValueExtension_algebraicClosureAbsoluteValue vK hvK).Completion :=
  (absoluteValueExtension_algebraicClosureToCompletionRingHom vK hvK).comp
    (tau.toRingHom.comp (WithAbs.equiv w.1).toRingHom)
theorem absoluteValueExtension_embeddingToAlgebraicClosureCompletion_norm
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (w : AbsoluteValueExtension vK L)
    (tau : L →ₐ[K] absoluteValueExtension_algebraicCompletionClosure vK)
    (htau : w.1 = absoluteValueExtension_pullback vK hvK tau)
    (x : WithAbs w.1) :
    ‖absoluteValueExtension_embeddingToAlgebraicClosureCompletionRingHom
        vK hvK w tau x‖ = ‖x‖ := by
  change ‖absoluteValueExtension_algebraicClosureToCompletionRingHom vK hvK
    (tau (WithAbs.equiv w.1 x))‖ = ‖x‖
  rw [absoluteValueExtension_algebraicClosureToCompletionRingHom_apply,
    UniformSpace.Completion.norm_coe, WithAbs.norm_eq_apply_ofAbs,
    WithAbs.norm_eq_apply_ofAbs]
  have h := congrArg (fun a : AbsoluteValue L ℝ =>
    a (WithAbs.equiv w.1 x)) htau
  exact h.symm
 

theorem absoluteValueExtension_embeddingToAlgebraicClosureCompletion_isometry
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (w : AbsoluteValueExtension vK L)
    (tau : L →ₐ[K] absoluteValueExtension_algebraicCompletionClosure vK)
    (htau : w.1 = absoluteValueExtension_pullback vK hvK tau) :
    Isometry (absoluteValueExtension_embeddingToAlgebraicClosureCompletionRingHom
      vK hvK w tau) :=
  AddMonoidHomClass.isometry_of_norm _
    (absoluteValueExtension_embeddingToAlgebraicClosureCompletion_norm
      vK hvK w tau htau)
 
noncomputable def absoluteValueExtension_embeddingCompletionMap
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (w : AbsoluteValueExtension vK L)
    (tau : L →ₐ[K] absoluteValueExtension_algebraicCompletionClosure vK)
    (htau : w.1 = absoluteValueExtension_pullback vK hvK tau) :
    w.1.Completion →+*
      (absoluteValueExtension_algebraicClosureAbsoluteValue vK hvK).Completion :=
  (absoluteValueExtension_embeddingToAlgebraicClosureCompletion_isometry
    vK hvK w tau htau).extensionHom
@[simp]
theorem absoluteValueExtension_embeddingCompletionMap_coe
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (w : AbsoluteValueExtension vK L)
    (tau : L →ₐ[K] absoluteValueExtension_algebraicCompletionClosure vK)
    (htau : w.1 = absoluteValueExtension_pullback vK hvK tau)
    (x : WithAbs w.1) :
    absoluteValueExtension_embeddingCompletionMap vK hvK w tau htau
        (x : w.1.Completion) =
      absoluteValueExtension_embeddingToAlgebraicClosureCompletionRingHom
        vK hvK w tau x :=
  (absoluteValueExtension_embeddingToAlgebraicClosureCompletion_isometry
    vK hvK w tau htau).extensionHom_coe x
 
theorem absoluteValueExtension_embeddingCompletionMap_isometry
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (w : AbsoluteValueExtension vK L)
    (tau : L →ₐ[K] absoluteValueExtension_algebraicCompletionClosure vK)
    (htau : w.1 = absoluteValueExtension_pullback vK hvK tau) :
    Isometry (absoluteValueExtension_embeddingCompletionMap vK hvK w tau htau) :=
  (absoluteValueExtension_embeddingToAlgebraicClosureCompletion_isometry
    vK hvK w tau htau).completion_extension
 

theorem absoluteValueExtension_completionToAlgebraicClosureCompletion_isometry
    {K : Type u} [Field K] (vK : AbsoluteValue K ℝ)
    (hvK : vK.IsNontrivial) :
    Isometry ((absoluteValueExtension_algebraicClosureToCompletionRingHom vK hvK).comp
      (algebraMap vK.Completion
        (absoluteValueExtension_algebraicCompletionClosure vK))) := by
  apply AddMonoidHomClass.isometry_of_norm
  intro x
  change ‖absoluteValueExtension_algebraicClosureToCompletionRingHom vK hvK
    (algebraMap vK.Completion
      (absoluteValueExtension_algebraicCompletionClosure vK) x)‖ = ‖x‖
  rw [absoluteValueExtension_algebraicClosureToCompletionRingHom_apply,
    UniformSpace.Completion.norm_coe, WithAbs.norm_eq_apply_ofAbs]
  change absoluteValueExtension_algebraicClosureAbsoluteValue vK hvK
    (algebraMap vK.Completion
      (absoluteValueExtension_algebraicCompletionClosure vK) x) = ‖x‖
  rw [absoluteValueExtension_algebraicClosureAbsoluteValue_algebraMap]
  rfl
 


theorem absoluteValueExtension_embeddingCompletionMap_completionMap
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (w : AbsoluteValueExtension vK L)
    (tau : L →ₐ[K] absoluteValueExtension_algebraicCompletionClosure vK)
    (htau : w.1 = absoluteValueExtension_pullback vK hvK tau)
    (x : vK.Completion) :
    absoluteValueExtension_embeddingCompletionMap vK hvK w tau htau
        (AbsoluteValue.completionMap vK w.1 w.2 x) =
      absoluteValueExtension_algebraicClosureToCompletionRingHom vK hvK
        (algebraMap vK.Completion
          (absoluteValueExtension_algebraicCompletionClosure vK) x) := by
  let f := (absoluteValueExtension_embeddingCompletionMap vK hvK w tau htau).comp
    (AbsoluteValue.completionMap vK w.1 w.2)
  let g := (absoluteValueExtension_algebraicClosureToCompletionRingHom vK hvK).comp
    (algebraMap vK.Completion
      (absoluteValueExtension_algebraicCompletionClosure vK))
  change f x = g x
  refine UniformSpace.Completion.induction_on (α := WithAbs vK) x ?_ ?_
  · exact isClosed_eq
      ((absoluteValueExtension_embeddingCompletionMap_isometry
          vK hvK w tau htau).continuous.comp
        (AbsoluteValue.completionMap_isometry vK w.1 w.2).continuous)
      (absoluteValueExtension_completionToAlgebraicClosureCompletion_isometry
        vK hvK).continuous
  · intro a
    dsimp [f, g]
    change absoluteValueExtension_embeddingCompletionMap vK hvK w tau htau
        (AbsoluteValue.completionMap vK w.1 w.2
          (algebraMap K vK.Completion (WithAbs.equiv vK a))) =
      absoluteValueExtension_algebraicClosureToCompletionRingHom vK hvK
        (algebraMap vK.Completion
          (absoluteValueExtension_algebraicCompletionClosure vK)
          (algebraMap K vK.Completion (WithAbs.equiv vK a)))
    rw [AbsoluteValue.completionMap_coe]
    change absoluteValueExtension_embeddingCompletionMap vK hvK w tau htau
        (((algebraMap (WithAbs vK) (WithAbs w.1)) a : WithAbs w.1) :
          w.1.Completion) =
      absoluteValueExtension_algebraicClosureToCompletionRingHom vK hvK
        (algebraMap vK.Completion
          (absoluteValueExtension_algebraicCompletionClosure vK)
            (a : vK.Completion))
    rw [absoluteValueExtension_embeddingCompletionMap_coe]
    change absoluteValueExtension_algebraicClosureToCompletionRingHom vK hvK
        (tau (algebraMap K L (WithAbs.equiv vK a))) =
      absoluteValueExtension_algebraicClosureToCompletionRingHom vK hvK
        (algebraMap vK.Completion
          (absoluteValueExtension_algebraicCompletionClosure vK)
            (algebraMap K vK.Completion (WithAbs.equiv vK a)))
    congr 1
    rw [tau.commutes,
      IsScalarTower.algebraMap_apply K vK.Completion
        (absoluteValueExtension_algebraicCompletionClosure vK)]
 
noncomputable def absoluteValueExtension_embeddingCompletionAlgHom
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (w : AbsoluteValueExtension vK L)
    (tau : L →ₐ[K] absoluteValueExtension_algebraicCompletionClosure vK)
    (htau : w.1 = absoluteValueExtension_pullback vK hvK tau) :
    letI := AbsoluteValue.completionAlgebra vK w.1 w.2
    letI := absoluteValueExtension_algebraicClosureCompletionAlgebra vK hvK
    w.1.Completion →ₐ[vK.Completion]
      (absoluteValueExtension_algebraicClosureAbsoluteValue vK hvK).Completion := by
  letI := AbsoluteValue.completionAlgebra vK w.1 w.2
  letI := absoluteValueExtension_algebraicClosureCompletionAlgebra vK hvK
  exact
    { __ := absoluteValueExtension_embeddingCompletionMap vK hvK w tau htau
      commutes' x :=
        absoluteValueExtension_embeddingCompletionMap_completionMap
          vK hvK w tau htau x }
 

theorem absoluteValueExtension_embeddingCompletionAlgHom_mem_range
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (w : AbsoluteValueExtension vK L)
    (tau : L →ₐ[K] absoluteValueExtension_algebraicCompletionClosure vK)
    (htau : w.1 = absoluteValueExtension_pullback vK hvK tau)
    (z : AbsoluteValue.algebraicLocalization vK w.1 w.2) :
    letI := absoluteValueExtension_algebraicClosureCompletionAlgebra vK hvK
    absoluteValueExtension_embeddingCompletionAlgHom vK hvK w tau htau (z : w.1.Completion)
      ∈ (absoluteValueExtension_algebraicClosureToCompletionAlgHom vK hvK).range := by
  let hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  let : SMul K w.1.Completion := hK.toSMul
  let := AbsoluteValue.completionAlgebra vK w.1 w.2
  let := absoluteValueExtension_algebraicClosureCompletionAlgebra vK hvK
  let E := AbsoluteValue.algebraicLocalization vK w.1 w.2
  let F := absoluteValueExtension_embeddingCompletionAlgHom vK hvK w tau htau
  let j := absoluteValueExtension_algebraicClosureToCompletionAlgHom vK hvK
  change F (z : w.1.Completion) ∈ j.range
  apply IntermediateField.adjoin_induction
      (F := vK.Completion)
      (s := Set.range (AbsoluteValue.toCompletion w.1))
      (p := fun x _ => F x ∈ j.range)
      (x := (z : w.1.Completion))
  · intro x hx
    rcases hx with ⟨y, rfl⟩
    refine ⟨tau y, ?_⟩
    symm
    change absoluteValueExtension_embeddingCompletionMap vK hvK w tau htau
      (AbsoluteValue.toCompletion w.1 y) =
        absoluteValueExtension_algebraicClosureToCompletionRingHom vK hvK (tau y)
    change absoluteValueExtension_embeddingCompletionMap vK hvK w tau htau
      (((WithAbs.equiv w.1).symm y : WithAbs w.1) : w.1.Completion) = _
    rw [absoluteValueExtension_embeddingCompletionMap_coe]
    rfl
  · intro x
    refine ⟨algebraMap vK.Completion
      (absoluteValueExtension_algebraicCompletionClosure vK) x, ?_⟩
    exact (absoluteValueExtension_embeddingCompletionMap_completionMap
      vK hvK w tau htau x).symm
  · intro x y _ _ hx hy
    simpa only [map_add] using j.range.add_mem hx hy
  · intro x _ hx
    rcases hx with ⟨a, ha⟩
    refine ⟨a⁻¹, ?_⟩
    simpa only [map_inv₀] using congrArg Inv.inv ha
  · intro x y _ _ hx hy
    simpa only [map_mul] using j.range.mul_mem hx hy
  · exact z.property
 



noncomputable def absoluteValueExtension_localizationEmbeddingOfPullback
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (w : AbsoluteValueExtension vK L)
    (tau : L →ₐ[K] absoluteValueExtension_algebraicCompletionClosure vK)
    (htau : w.1 = absoluteValueExtension_pullback vK hvK tau) :
    letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
    letI : SMul K w.1.Completion := hK.toSMul
    letI := AbsoluteValue.completionAlgebra vK w.1 w.2
    AbsoluteValue.algebraicLocalization vK w.1 w.2 →ₐ[vK.Completion]
      absoluteValueExtension_algebraicCompletionClosure vK := by
  letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  letI : SMul K w.1.Completion := hK.toSMul
  letI := AbsoluteValue.completionAlgebra vK w.1 w.2
  letI := absoluteValueExtension_algebraicClosureCompletionAlgebra vK hvK
  let E := AbsoluteValue.algebraicLocalization vK w.1 w.2
  let F := absoluteValueExtension_embeddingCompletionAlgHom vK hvK w tau htau
  let j := absoluteValueExtension_algebraicClosureToCompletionAlgHom vK hvK
  let f : E →ₐ[vK.Completion] j.range :=
    (F.comp E.val).codRestrict j.range
      (absoluteValueExtension_embeddingCompletionAlgHom_mem_range
        vK hvK w tau htau)
  exact (AlgEquiv.ofInjectiveField j).symm.toAlgHom.comp f
 

theorem absoluteValueExtension_localizationEmbeddingOfPullback_toLocalization
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (w : AbsoluteValueExtension vK L)
    (tau : L →ₐ[K] absoluteValueExtension_algebraicCompletionClosure vK)
    (htau : w.1 = absoluteValueExtension_pullback vK hvK tau)
    (x : L) :
    letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
    letI : SMul K w.1.Completion := hK.toSMul
    letI := AbsoluteValue.completionAlgebra vK w.1 w.2
    absoluteValueExtension_localizationEmbeddingOfPullback vK hvK w tau htau
        (AbsoluteValue.toAlgebraicLocalization vK w.1 w.2 x) = tau x := by
  let hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  let : SMul K w.1.Completion := hK.toSMul
  let := AbsoluteValue.completionAlgebra vK w.1 w.2
  let := absoluteValueExtension_algebraicClosureCompletionAlgebra vK hvK
  let E := AbsoluteValue.algebraicLocalization vK w.1 w.2
  let F := absoluteValueExtension_embeddingCompletionAlgHom vK hvK w tau htau
  let j := absoluteValueExtension_algebraicClosureToCompletionAlgHom vK hvK
  apply j.injective
  change j ((AlgEquiv.ofInjectiveField j).symm
      ⟨F (AbsoluteValue.toAlgebraicLocalization vK w.1 w.2 x),
        absoluteValueExtension_embeddingCompletionAlgHom_mem_range
          vK hvK w tau htau _⟩) = j (tau x)
  rw [show j ((AlgEquiv.ofInjectiveField j).symm
      ⟨F (AbsoluteValue.toAlgebraicLocalization vK w.1 w.2 x),
        absoluteValueExtension_embeddingCompletionAlgHom_mem_range
          vK hvK w tau htau _⟩) =
      F (AbsoluteValue.toAlgebraicLocalization vK w.1 w.2 x) by
        exact congrArg Subtype.val
          ((AlgEquiv.ofInjectiveField j).apply_symm_apply _)]
  change absoluteValueExtension_embeddingCompletionMap vK hvK w tau htau
      (AbsoluteValue.toCompletion w.1 x) =
    absoluteValueExtension_algebraicClosureToCompletionRingHom vK hvK (tau x)
  change absoluteValueExtension_embeddingCompletionMap vK hvK w tau htau
      (((WithAbs.equiv w.1).symm x : WithAbs w.1) : w.1.Completion) = _
  rw [absoluteValueExtension_embeddingCompletionMap_coe]
  rfl
 


theorem absoluteValueExtension_algHom_conjugate_in_algClosure
    {F E A : Type*} [Field F] [Field E] [Field A]
    [Algebra F E] [Algebra F A] [Algebra.IsAlgebraic F E]
    [IsAlgClosure F A]
    (phi phi' : E →ₐ[F] A) :
    ∃ sigma : A ≃ₐ[F] A, ∀ x : E, sigma (phi x) = phi' x := by
  let : IsAlgClosed A := IsAlgClosure.isAlgClosed F
  let : Algebra E A := phi.toRingHom.toAlgebra
  let : IsScalarTower F E A :=
    IsScalarTower.of_algebraMap_eq' phi.comp_algebraMap.symm
  let : Algebra.IsAlgebraic E A :=
    Algebra.IsAlgebraic.tower_top (K := F) E
  obtain ⟨psi, hpsi⟩ :=
    IsAlgClosed.surjective_domRestrict_of_isAlgebraic
      (K := F) (L := E) (M := A) (E := A) phi'
  let sigma : A ≃ₐ[F] A := AlgEquiv.ofBijective psi
    (Algebra.IsAlgebraic.algHom_bijective psi)
  refine ⟨sigma, fun x => ?_⟩
  have hx := DFunLike.congr_fun hpsi x
  change psi (phi x) = phi' x
  change psi (algebraMap E A x) = phi' x at hx
  rw [RingHom.algebraMap_toAlgebra] at hx
  have hphi : phi.toRingHom x = phi x :=
    congrFun (AlgHom.coe_toRingHom phi) x
  rw [hphi] at hx
  exact hx
 

theorem absoluteValueExtension_conjugate_of_pullback_eq
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    [Algebra.IsAlgebraic K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    {tau tau' : L →ₐ[K] absoluteValueExtension_algebraicCompletionClosure vK}
    (h : absoluteValueExtension_pullback vK hvK tau =
      absoluteValueExtension_pullback vK hvK tau') :
    AbsoluteValueExtensionConjugateOverCompletion vK tau tau' := by
  let w : AbsoluteValueExtension vK L :=
    ⟨absoluteValueExtension_pullback vK hvK tau,
      absoluteValueExtension_pullback_extends vK hvK tau⟩
  have htau : w.1 = absoluteValueExtension_pullback vK hvK tau := rfl
  have htau' : w.1 = absoluteValueExtension_pullback vK hvK tau' := h
  let hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  let : SMul K w.1.Completion := hK.toSMul
  let := AbsoluteValue.completionAlgebra vK w.1 w.2
  let phi := absoluteValueExtension_localizationEmbeddingOfPullback
    vK hvK w tau htau
  let phi' := absoluteValueExtension_localizationEmbeddingOfPullback
    vK hvK w tau' htau'
  let : Algebra.IsAlgebraic vK.Completion
      (AbsoluteValue.algebraicLocalization vK w.1 w.2) :=
    AbsoluteValue.algebraicLocalization_isAlgebraic vK w.1 w.2
  obtain ⟨sigma, hsigma⟩ :=
    absoluteValueExtension_algHom_conjugate_in_algClosure phi phi'
  refine ⟨sigma, fun x => ?_⟩
  rw [← absoluteValueExtension_localizationEmbeddingOfPullback_toLocalization
      vK hvK w tau htau x,
    ← absoluteValueExtension_localizationEmbeddingOfPullback_toLocalization
      vK hvK w tau' htau' x]
  exact (hsigma (AbsoluteValue.toAlgebraicLocalization vK w.1 w.2 x)).symm
 

theorem absoluteValueExtension_pullback_eq_iff_conjugate
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    [Algebra.IsAlgebraic K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (tau tau' : L →ₐ[K] absoluteValueExtension_algebraicCompletionClosure vK) :
    absoluteValueExtension_pullback vK hvK tau =
        absoluteValueExtension_pullback vK hvK tau' ↔
      AbsoluteValueExtensionConjugateOverCompletion vK tau tau' := by
  constructor
  · exact absoluteValueExtension_conjugate_of_pullback_eq vK hvK
  · exact absoluteValueExtension_pullback_eq_of_conjugate vK hvK
end Valuations
end AlgebraicNumberTheory
end
end

/- ValuedFieldTheory.Valuation.Completion.FiniteLocalization -/
section
noncomputable section
namespace AlgebraicNumberTheory
namespace Valuations
universe u v
open scoped TensorProduct
 

noncomputable abbrev absoluteValueExtension_completionNontriviallyNormedField
    {K : Type u} [Field K] (vK : AbsoluteValue K ℝ)
    (hvK : vK.IsNontrivial) :
    NontriviallyNormedField vK.Completion :=
  NontriviallyNormedField.ofNormNeOne (by
    rcases AbsoluteValue.completionAbsoluteValue_isNontrivial vK hvK with
      ⟨x, hx0, hx1⟩
    exact ⟨x, hx0, hx1⟩)
 

noncomputable abbrev absoluteValueExtension_completionNormedAlgebra
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (w : AbsoluteValueExtension vK L) :
    letI := AbsoluteValue.completionAlgebra vK w.1 w.2
    NormedAlgebra vK.Completion w.1.Completion := by
  letI := AbsoluteValue.completionAlgebra vK w.1 w.2
  refine
    { __ := AbsoluteValue.completionAlgebra vK w.1 w.2
      norm_smul_le := fun r x ↦ ?_ }
  rw [Algebra.smul_def, norm_mul,
    AbsoluteValue.completionAlgebra_algebraMap]
  rw [(AbsoluteValue.completionMap_isometry vK w.1 w.2).norm_map_of_map_zero
    (map_zero (AbsoluteValue.completionMap vK w.1 w.2))]
 
noncomputable def absoluteValueExtension_localizationTensorHom
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (w : AbsoluteValueExtension vK L) :
    letI := AbsoluteValue.completionAlgebra vK w.1 w.2
    vK.Completion ⊗[K] L →ₐ[vK.Completion] w.1.Completion := by
  letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  letI : SMul K w.1.Completion := hK.toSMul
  letI := AbsoluteValue.completionAlgebra vK w.1 w.2
  letI : IsScalarTower K vK.Completion w.1.Completion :=
    AbsoluteValue.completion_isScalarTower vK w.1 w.2
  exact Algebra.TensorProduct.lift
    (Algebra.ofId vK.Completion w.1.Completion)
    (AbsoluteValue.toCompletionAlgHom (K := K) w.1)
    (fun _ _ ↦ Commute.all _ _)
@[simp]
theorem absoluteValueExtension_localizationTensorHom_tmul
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (w : AbsoluteValueExtension vK L)
    (b : vK.Completion) (a : L) :
    letI := AbsoluteValue.completionAlgebra vK w.1 w.2
    absoluteValueExtension_localizationTensorHom vK w (b ⊗ₜ[K] a) =
      algebraMap vK.Completion w.1.Completion b *
        AbsoluteValue.toCompletionAlgHom (K := K) w.1 a := by
  let := AbsoluteValue.completionAlgebra vK w.1 w.2
  rfl
 

theorem absoluteValueExtension_localizationTensorHom_surjective
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    [FiniteDimensional K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (w : AbsoluteValueExtension vK L) :
    letI := AbsoluteValue.completionAlgebra vK w.1 w.2
    Function.Surjective (absoluteValueExtension_localizationTensorHom vK w) := by
  let hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  let : SMul K w.1.Completion := hK.toSMul
  let := AbsoluteValue.completionAlgebra vK w.1 w.2
  let : NontriviallyNormedField vK.Completion :=
    absoluteValueExtension_completionNontriviallyNormedField vK hvK
  let : NormedAlgebra vK.Completion w.1.Completion :=
    absoluteValueExtension_completionNormedAlgebra vK w
  let : Module.Finite vK.Completion (vK.Completion ⊗[K] L) :=
    inferInstance
  let f := absoluteValueExtension_localizationTensorHom vK w
  let : Module.Finite vK.Completion f.toLinearMap.range :=
    Module.Finite.range f.toLinearMap
  have hrangeClosed : IsClosed (f.toLinearMap.range : Set w.1.Completion) :=
    Submodule.closed_of_finiteDimensional
      (𝕜 := vK.Completion) f.toLinearMap.range
  have hdense : DenseRange
      (AbsoluteValue.toCompletion w.1) :=
    AbsoluteValue.denseRange_toCompletion w.1
  have hrange : Set.range
      (AbsoluteValue.toCompletion w.1) ⊆
      (f.toLinearMap.range : Set w.1.Completion) := by
    rintro _ ⟨x, rfl⟩
    refine ⟨1 ⊗ₜ[K] x, ?_⟩
    change f (1 ⊗ₜ[K] x) = _
    rw [absoluteValueExtension_localizationTensorHom_tmul]
    simp [AbsoluteValue.toCompletionAlgHom]
  change Function.Surjective f.toLinearMap
  rw [← f.toLinearMap.range_eq_top]
  apply top_unique
  intro x _
  have hx : x ∈ closure
      (Set.range (AbsoluteValue.toCompletion w.1)) := by
    rw [hdense.closure_range]
    trivial
  exact closure_minimal hrange hrangeClosed hx
 

theorem absoluteValueExtension_finiteLocalization_eq_top
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    [FiniteDimensional K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (w : AbsoluteValueExtension vK L) :
    letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
    letI : SMul K w.1.Completion := hK.toSMul
    letI := AbsoluteValue.completionAlgebra vK w.1 w.2
    AbsoluteValue.algebraicLocalization vK w.1 w.2 = ⊤ := by
  let hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  let : SMul K w.1.Completion := hK.toSMul
  let := AbsoluteValue.completionAlgebra vK w.1 w.2
  let E := AbsoluteValue.algebraicLocalization vK w.1 w.2
  apply top_unique
  intro y _
  obtain ⟨z, rfl⟩ :=
    absoluteValueExtension_localizationTensorHom_surjective vK hvK w y
  induction z using TensorProduct.induction_on with
  | zero => exact E.zero_mem
  | tmul b x =>
      rw [absoluteValueExtension_localizationTensorHom_tmul]
      exact E.mul_mem (E.algebraMap_mem b)
        (AbsoluteValue.toAlgebraicLocalization vK w.1 w.2 x).property
  | add x y hx hy =>
      simpa only [map_add] using E.add_mem (hx trivial) (hy trivial)
end Valuations
end AlgebraicNumberTheory
namespace AlgebraicNumberTheory
namespace Valuations
universe u v
open scoped TensorProduct
 

abbrev LocalizedCompletion
    {K : Type u} {L : Type v}
    [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ)
    (w : AbsoluteValueExtension vK L) :=
  AbsoluteValue.algebraicLocalization vK w.1 w.2
variable {K : Type u} {L : Type v}
    [Field K] [Field L] [Algebra K L] [FiniteDimensional K L]
 

theorem localizedCompletionModuleFinite
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (w : AbsoluteValueExtension vK L) :
    letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
    letI : SMul K w.1.Completion := hK.toSMul
    letI : Algebra vK.Completion w.1.Completion :=
      AbsoluteValue.completionAlgebra vK w.1 w.2
    Module.Finite vK.Completion
      (AbsoluteValue.algebraicLocalization vK w.1 w.2) := by
  let hK :=
    AbsoluteValue.extensionCompletionAlgebra
      (K := K) w.1
  let : SMul K w.1.Completion := hK.toSMul
  let : Algebra vK.Completion w.1.Completion :=
    AbsoluteValue.completionAlgebra vK w.1 w.2
  let : Module.Finite vK.Completion
      (vK.Completion ⊗[K] L) :=
    inferInstance
  let f :=
    absoluteValueExtension_localizationTensorHom vK w
  let : Module.Finite vK.Completion
      w.1.Completion :=
    Module.Finite.of_surjective f.toLinearMap
      (absoluteValueExtension_localizationTensorHom_surjective
        vK hvK w)
  exact FiniteDimensional.of_injective
    (AbsoluteValue.algebraicLocalization vK w.1 w.2).val.toLinearMap
    (AbsoluteValue.algebraicLocalization vK w.1 w.2).val.injective
 

noncomputable def localizedCompletionEquivCompletion
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (w : AbsoluteValueExtension vK L) :
    letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
    letI : SMul K w.1.Completion := hK.toSMul
    letI := AbsoluteValue.completionAlgebra vK w.1 w.2
    AbsoluteValue.algebraicLocalization vK w.1 w.2 ≃ₐ[vK.Completion]
      w.1.Completion := by
  letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  letI : SMul K w.1.Completion := hK.toSMul
  letI := AbsoluteValue.completionAlgebra vK w.1 w.2
  exact
    (IntermediateField.equivOfEq
      (absoluteValueExtension_finiteLocalization_eq_top vK hvK w)).trans
      IntermediateField.topEquiv
end Valuations
end AlgebraicNumberTheory
end
end

/- ValuedFieldTheory.Ramification.HilbertRamification.AbsoluteValueConjugacy -/
section
noncomputable section
universe u v
namespace AlgebraicNumberTheory
namespace Valuations
 

def absoluteValueConjugate
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (w : AbsoluteValue L ℝ) (σ : L ≃ₐ[K] L) : AbsoluteValue L ℝ :=
  w.comp (f := σ.toRingEquiv.toRingHom) σ.injective
@[simp] theorem absoluteValueConjugate_apply
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (w : AbsoluteValue L ℝ) (σ : L ≃ₐ[K] L) (x : L) :
    absoluteValueConjugate w σ x = w (σ x) :=
  rfl
 

theorem absoluteValueConjugate_extends
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (w : AbsoluteValueExtension vK L)
    (σ : L ≃ₐ[K] L) :
    AbsoluteValue.Extends vK (absoluteValueConjugate w.1 σ) := by
  intro x
  rw [absoluteValueConjugate_apply, σ.commutes, w.2 x]
 
def absoluteValueExtensionConjugate
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (w : AbsoluteValueExtension vK L)
    (σ : L ≃ₐ[K] L) : AbsoluteValueExtension vK L :=
  ⟨absoluteValueConjugate w.1 σ,
    absoluteValueConjugate_extends vK w σ⟩
 


theorem equivalent_exactExtensions_eq
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (w w' : AbsoluteValueExtension vK L)
    (h : LubinTate.Valuations.EquivalentAbsoluteValues w.1 w'.1) :
    w = w' := by
  rcases (LubinTate.Valuations.equivalentAbsoluteValues_iff_exists_rpow_eq w.1 w'.1).mp h with
    ⟨s, hs, hpow⟩
  rcases hvK with ⟨a, ha, hva⟩
  have hbase : vK a ^ s = vK a := by
    have hpoint := congrFun hpow (algebraMap K L a)
    simpa [w.2 a, w'.2 a] using hpoint
  have hs_one : s = 1 :=
    (Real.rpow_right_inj (vK.pos ha) hva).mp (by simpa using hbase)
  apply Subtype.ext
  ext x
  have hpoint := congrFun hpow x
  simpa [hs_one] using hpoint
 


theorem absoluteValueConjugacy_exists_conjugatingAlgEquiv
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    [IsGalois K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (w w' : AbsoluteValueExtension vK L) :
    ∃ σ : L ≃ₐ[K] L, w'.1 = absoluteValueConjugate w.1 σ := by
  let A := absoluteValueExtension_algebraicCompletionClosure vK
  let τ : L →ₐ[K] A := absoluteValueExtension_embeddingOfExtension vK w
  let τ' : L →ₐ[K] A := absoluteValueExtension_embeddingOfExtension vK w'
  let : Algebra L A := τ.toRingHom.toAlgebra
  let : IsScalarTower K L A :=
    IsScalarTower.of_algebraMap_eq' τ.comp_algebraMap.symm
  let σ : L ≃ₐ[K] L := Normal.algHomEquivAut K A L τ'
  refine ⟨σ, ?_⟩
  rw [absoluteValueExtension_extension_eq_pullback_embeddingOfExtension vK hvK w',
    absoluteValueExtension_extension_eq_pullback_embeddingOfExtension vK hvK w]
  ext x
  change
    absoluteValueExtension_algebraicClosureAbsoluteValue vK hvK (τ' x) =
      absoluteValueExtension_algebraicClosureAbsoluteValue vK hvK (τ (σ x))
  congr 1
  simpa [σ, τ, AlgHom.restrictNormal', RingHom.algebraMap_toAlgebra] using
    (τ'.restrictNormal_commutes L x).symm
 



theorem absoluteValueConjugacy
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    [IsGalois K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (w w' : AbsoluteValueExtension vK L) :
    ∃ σ : L ≃ₐ[K] L,
      w' = absoluteValueExtensionConjugate vK w σ := by
  rcases absoluteValueConjugacy_exists_conjugatingAlgEquiv vK hvK w w' with
    ⟨σ, hσ⟩
  exact ⟨σ, Subtype.ext hσ⟩
end Valuations
end AlgebraicNumberTheory
end
end

/- ValuedFieldTheory.Ramification.HilbertRamification.DecompositionGroup -/
section
noncomputable section
universe u v w
namespace HilbertRamification
open AlgebraicNumberTheory.Valuations

variable (K : Type u) {L : Type w} [Field K] [Field L] [Algebra K L]
 



def absoluteValueDecompositionGroup (w : AbsoluteValue L ℝ) :
    Subgroup (L ≃ₐ[K] L) where
  carrier := { σ | ∀ x : L, w (σ x) < 1 ↔ w x < 1 }
  one_mem' := by
    intro x
    rfl
  mul_mem' := by
    intro σ τ hσ hτ x
    exact (hσ (τ x)).trans (hτ x)
  inv_mem' := by
    intro σ hσ x
    have h := hσ (σ⁻¹ x)
    simpa using h.symm
@[simp] theorem mem_absoluteValueDecompositionGroup_iff
    (w : AbsoluteValue L ℝ) (σ : L ≃ₐ[K] L) :
    σ ∈ absoluteValueDecompositionGroup K w ↔
      ∀ x : L, w (σ x) < 1 ↔ w x < 1 :=
  Iff.rfl
 

theorem mem_absoluteValueDecompositionGroup_iff_equivalent
    (w : AbsoluteValue L ℝ) (σ : L ≃ₐ[K] L) :
    σ ∈ absoluteValueDecompositionGroup K w ↔
      LubinTate.Valuations.EquivalentAbsoluteValues
        (w.comp (f := σ.toRingEquiv.toRingHom) σ.injective) w := by
  rw [LubinTate.Valuations.equivalentAbsoluteValues_iff_isEquiv,
    AbsoluteValue.isEquiv_iff_lt_one_iff]
  rfl
 


theorem mem_absoluteValueDecompositionGroup_iff_extensionConjugate_eq
    {K₀ : Type u} {L₀ : Type w} [Field K₀] [Field L₀] [Algebra K₀ L₀]
    (vK : AbsoluteValue K₀ ℝ) (hvK : vK.IsNontrivial)
    (vL : AbsoluteValueExtension vK L₀) (σ : L₀ ≃ₐ[K₀] L₀) :
    σ ∈ absoluteValueDecompositionGroup K₀ vL.1 ↔
      absoluteValueExtensionConjugate vK vL σ = vL := by
  rw [mem_absoluteValueDecompositionGroup_iff_equivalent]
  change
    LubinTate.Valuations.EquivalentAbsoluteValues
        (absoluteValueExtensionConjugate vK vL σ).1 vL.1 ↔ _
  constructor
  · exact equivalent_exactExtensions_eq vK hvK
      (absoluteValueExtensionConjugate vK vL σ) vL
  · intro h
    rw [h]
    exact LubinTate.Valuations.equivalentAbsoluteValues_refl vL.1
section IntermediateField
variable {M : Type v} [Field M] [Algebra K M] [Algebra M L]
  [IsScalarTower K M L]
end IntermediateField
namespace ValuationSubring
section NonarchimedeanIntermediateField
variable {M : Type v} [Field M] [Algebra K M] [Algebra M L]
  [IsScalarTower K M L]
end NonarchimedeanIntermediateField
end ValuationSubring
end HilbertRamification
end
end

/- ValuedFieldTheory.Ramification.HilbertRamification.AlgebraicLocalization -/
section
noncomputable section
universe u v
namespace HilbertRamification
open AlgebraicNumberTheory.Valuations
variable {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
section LocalizationLift
variable (vK : AbsoluteValue K ℝ) (w : AbsoluteValueExtension vK L)
 

def valuationPreservingWithAbsRingEquiv
    (σ : L ≃ₐ[K] L) : WithAbs w.1 ≃+* WithAbs w.1 :=
  (WithAbs.equiv w.1).trans
    (σ.toRingEquiv.trans (WithAbs.equiv w.1).symm)
theorem valuationPreservingWithAbsRingEquiv_isometry
    (σ : L ≃ₐ[K] L) (hσ : ∀ x : L, w.1 (σ x) = w.1 x) :
    Isometry (valuationPreservingWithAbsRingEquiv vK w σ) := by
  apply AddMonoidHomClass.isometry_of_norm
  intro x
  rw [WithAbs.norm_eq_apply_ofAbs, WithAbs.norm_eq_apply_ofAbs]
  exact hσ (WithAbs.equiv w.1 x)
theorem valuationPreservingWithAbsRingEquiv_symm_isometry
    (σ : L ≃ₐ[K] L) (hσ : ∀ x : L, w.1 (σ x) = w.1 x) :
    Isometry (valuationPreservingWithAbsRingEquiv vK w σ).symm := by
  apply AddMonoidHomClass.isometry_of_norm
  intro x
  rw [WithAbs.norm_eq_apply_ofAbs, WithAbs.norm_eq_apply_ofAbs]
  have h := hσ (σ⁻¹ (WithAbs.equiv w.1 x))
  simpa [valuationPreservingWithAbsRingEquiv] using h.symm
 

def valuationPreservingCompletionRingEquiv
    (σ : L ≃ₐ[K] L) (hσ : ∀ x : L, w.1 (σ x) = w.1 x) :
    w.1.Completion ≃+* w.1.Completion :=
  UniformSpace.Completion.mapRingEquiv
    (valuationPreservingWithAbsRingEquiv vK w σ)
    (valuationPreservingWithAbsRingEquiv_isometry vK w σ hσ).continuous
    (valuationPreservingWithAbsRingEquiv_symm_isometry vK w σ hσ).continuous
@[simp] theorem valuationPreservingCompletionRingEquiv_toCompletion
    (σ : L ≃ₐ[K] L) (hσ : ∀ x : L, w.1 (σ x) = w.1 x) (x : L) :
    valuationPreservingCompletionRingEquiv vK w σ hσ
        (AbsoluteValue.toCompletion w.1 x) =
      AbsoluteValue.toCompletion w.1 (σ x) := by
  change
    UniformSpace.Completion.mapRingEquiv
          (valuationPreservingWithAbsRingEquiv vK w σ)
          (valuationPreservingWithAbsRingEquiv_isometry vK w σ hσ).continuous
          (valuationPreservingWithAbsRingEquiv_symm_isometry vK w σ hσ).continuous
        (((WithAbs.equiv w.1).symm x : WithAbs w.1) : w.1.Completion) = _
  rw [UniformSpace.Completion.mapRingEquiv_apply,
    UniformSpace.Completion.map_coe
      (valuationPreservingWithAbsRingEquiv_isometry
        vK w σ hσ).uniformContinuous]
  rfl
 
theorem valuationPreservingCompletionRingEquiv_completionMap
    (σ : L ≃ₐ[K] L) (hσ : ∀ x : L, w.1 (σ x) = w.1 x)
    (x : vK.Completion) :
    valuationPreservingCompletionRingEquiv vK w σ hσ
        (AbsoluteValue.completionMap vK w.1 w.2 x) =
      AbsoluteValue.completionMap vK w.1 w.2 x := by
  have hfun :
      (fun y : vK.Completion =>
        valuationPreservingCompletionRingEquiv vK w σ hσ
          (AbsoluteValue.completionMap vK w.1 w.2 y)) =
        AbsoluteValue.completionMap vK w.1 w.2 := by
    apply UniformSpace.Completion.ext
    · exact UniformSpace.Completion.continuous_map.comp
        (AbsoluteValue.completionMap_isometry vK w.1 w.2).continuous
    · exact (AbsoluteValue.completionMap_isometry vK w.1 w.2).continuous
    · intro y
      have hy : (y : vK.Completion) =
          algebraMap K vK.Completion (WithAbs.equiv vK y) := by
        rw [← AbsoluteValue.toCompletion_eq_algebraMap]
        simp
      rw [hy, AbsoluteValue.completionMap_coe]
      change
        valuationPreservingCompletionRingEquiv vK w σ hσ
            (AbsoluteValue.toCompletion w.1
              (algebraMap K L (WithAbs.equiv vK y))) =
          AbsoluteValue.toCompletion w.1
            (algebraMap K L (WithAbs.equiv vK y))
      rw [valuationPreservingCompletionRingEquiv_toCompletion, σ.commutes]
  exact congrFun hfun x
 
theorem valuationPreservingCompletionRingEquiv_mem_localization
    (σ : L ≃ₐ[K] L) (hσ : ∀ x : L, w.1 (σ x) = w.1 x)
    {z : w.1.Completion} (hz : z ∈ AbsoluteValue.algebraicLocalization vK w.1 w.2) :
    valuationPreservingCompletionRingEquiv vK w σ hσ z ∈
      AbsoluteValue.algebraicLocalization vK w.1 w.2 := by
  let hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  let : SMul K w.1.Completion := hK.toSMul
  let := AbsoluteValue.completionAlgebra vK w.1 w.2
  let E := AbsoluteValue.algebraicLocalization vK w.1 w.2
  apply IntermediateField.adjoin_induction
      (p := fun x (_ : x ∈ E) =>
        valuationPreservingCompletionRingEquiv vK w σ hσ x ∈ E)
      (s := Set.range (AbsoluteValue.toCompletion w.1))
  · intro x hx
    rcases hx with ⟨a, rfl⟩
    rw [valuationPreservingCompletionRingEquiv_toCompletion]
    exact IntermediateField.subset_adjoin vK.Completion _ ⟨σ a, rfl⟩
  · intro x
    change
      valuationPreservingCompletionRingEquiv vK w σ hσ
          (AbsoluteValue.completionMap vK w.1 w.2 x) ∈ E
    rw [valuationPreservingCompletionRingEquiv_completionMap]
    exact E.algebraMap_mem x
  · intro x y hx hy hx' hy'
    simpa only [map_add] using E.add_mem hx' hy'
  · intro x hx hx'
    simpa only [map_inv₀] using E.inv_mem hx'
  · intro x y hx hy hx' hy'
    simpa only [map_mul] using E.mul_mem hx' hy'
  · exact hz
 
theorem valuationPreservingCompletionRingEquiv_symm_mem_localization
    (σ : L ≃ₐ[K] L) (hσ : ∀ x : L, w.1 (σ x) = w.1 x)
    {z : w.1.Completion} (hz : z ∈ AbsoluteValue.algebraicLocalization vK w.1 w.2) :
    (valuationPreservingCompletionRingEquiv vK w σ hσ).symm z ∈
      AbsoluteValue.algebraicLocalization vK w.1 w.2 := by
  let hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  let : SMul K w.1.Completion := hK.toSMul
  let := AbsoluteValue.completionAlgebra vK w.1 w.2
  let E := AbsoluteValue.algebraicLocalization vK w.1 w.2
  apply IntermediateField.adjoin_induction
      (p := fun x (_ : x ∈ E) =>
        (valuationPreservingCompletionRingEquiv vK w σ hσ).symm x ∈ E)
      (s := Set.range (AbsoluteValue.toCompletion w.1))
  · intro x hx
    rcases hx with ⟨a, rfl⟩
    have hgen := valuationPreservingCompletionRingEquiv_toCompletion
      vK w σ hσ (σ⁻¹ a)
    have hsymm :
        (valuationPreservingCompletionRingEquiv vK w σ hσ).symm
            (AbsoluteValue.toCompletion w.1 a) =
          AbsoluteValue.toCompletion w.1 (σ⁻¹ a) := by
      rw [← (valuationPreservingCompletionRingEquiv vK w σ hσ).injective.eq_iff,
        (valuationPreservingCompletionRingEquiv vK w σ hσ).apply_symm_apply]
      simpa using hgen.symm
    rw [hsymm]
    exact IntermediateField.subset_adjoin vK.Completion _ ⟨σ⁻¹ a, rfl⟩
  · intro x
    have hbase := valuationPreservingCompletionRingEquiv_completionMap
      vK w σ hσ x
    have hsymm :
        (valuationPreservingCompletionRingEquiv vK w σ hσ).symm
            (AbsoluteValue.completionMap vK w.1 w.2 x) =
          AbsoluteValue.completionMap vK w.1 w.2 x := by
      rw [← (valuationPreservingCompletionRingEquiv vK w σ hσ).injective.eq_iff,
        (valuationPreservingCompletionRingEquiv vK w σ hσ).apply_symm_apply]
      exact hbase.symm
    change
      (valuationPreservingCompletionRingEquiv vK w σ hσ).symm
          (AbsoluteValue.completionMap vK w.1 w.2 x) ∈ E
    rw [hsymm]
    exact E.algebraMap_mem x
  · intro x y hx hy hx' hy'
    simpa only [map_add] using E.add_mem hx' hy'
  · intro x hx hx'
    simpa only [map_inv₀] using E.inv_mem hx'
  · intro x y hx hy hx' hy'
    simpa only [map_mul] using E.mul_mem hx' hy'
  · exact hz
 

def valuationPreservingLocalizationAlgEquiv
    (σ : L ≃ₐ[K] L) (hσ : ∀ x : L, w.1 (σ x) = w.1 x) :
    letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
    letI : SMul K w.1.Completion := hK.toSMul
    letI := AbsoluteValue.completionAlgebra vK w.1 w.2
    AbsoluteValue.algebraicLocalization vK w.1 w.2 ≃ₐ[vK.Completion]
      AbsoluteValue.algebraicLocalization vK w.1 w.2 := by
  letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  letI : SMul K w.1.Completion := hK.toSMul
  letI := AbsoluteValue.completionAlgebra vK w.1 w.2
  let E := AbsoluteValue.algebraicLocalization vK w.1 w.2
  let e := valuationPreservingCompletionRingEquiv vK w σ hσ
  exact
    { toFun := fun z =>
        ⟨e z, valuationPreservingCompletionRingEquiv_mem_localization
          vK w σ hσ z.property⟩
      invFun := fun z =>
        ⟨e.symm z,
          valuationPreservingCompletionRingEquiv_symm_mem_localization
            vK w σ hσ z.property⟩
      left_inv := fun z => by
        apply Subtype.ext
        exact e.symm_apply_apply z
      right_inv := fun z => by
        apply Subtype.ext
        exact e.apply_symm_apply z
      map_mul' := fun x y => by
        apply Subtype.ext
        exact e.map_mul x y
      map_add' := fun x y => by
        apply Subtype.ext
        exact e.map_add x y
      commutes' := fun x => by
        apply Subtype.ext
        exact valuationPreservingCompletionRingEquiv_completionMap
          vK w σ hσ x }
@[simp] theorem valuationPreservingLocalizationAlgEquiv_toLocalization
    (σ : L ≃ₐ[K] L) (hσ : ∀ x : L, w.1 (σ x) = w.1 x) (x : L) :
    letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
    letI : SMul K w.1.Completion := hK.toSMul
    letI := AbsoluteValue.completionAlgebra vK w.1 w.2
    valuationPreservingLocalizationAlgEquiv vK w σ hσ
        (AbsoluteValue.toAlgebraicLocalization vK w.1 w.2 x) =
      AbsoluteValue.toAlgebraicLocalization vK w.1 w.2 (σ x) := by
  let hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  let : SMul K w.1.Completion := hK.toSMul
  let := AbsoluteValue.completionAlgebra vK w.1 w.2
  apply Subtype.ext
  exact valuationPreservingCompletionRingEquiv_toCompletion vK w σ hσ x
end LocalizationLift
section DecompositionEquiv
variable (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
  (w : AbsoluteValueExtension vK L)
include hvK
 

theorem absoluteValueDecompositionGroup_preserves_absoluteValue
    (σ : absoluteValueDecompositionGroup K w.1) (x : L) :
    w.1 ((σ : L ≃ₐ[K] L) x) = w.1 x := by
  have hσ :=
    (mem_absoluteValueDecompositionGroup_iff_extensionConjugate_eq
      vK hvK w (σ : L ≃ₐ[K] L)).mp σ.property
  have hx := congrArg (fun q : AbsoluteValueExtension vK L => q.1 x) hσ
  simpa [absoluteValueExtensionConjugate,
    absoluteValueConjugate, AbsoluteValue.comp] using hx
omit hvK
variable [IsGalois K L]
include hvK
 

theorem localizationAbsoluteValue_algEquiv
    (τ :
      letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
      letI : SMul K w.1.Completion := hK.toSMul
      letI := AbsoluteValue.completionAlgebra vK w.1 w.2
      AbsoluteValue.algebraicLocalization vK w.1 w.2 ≃ₐ[vK.Completion]
        AbsoluteValue.algebraicLocalization vK w.1 w.2)
    (x :
      letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
      letI : SMul K w.1.Completion := hK.toSMul
      letI := AbsoluteValue.completionAlgebra vK w.1 w.2
      AbsoluteValue.algebraicLocalization vK w.1 w.2) :
    letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
    letI : SMul K w.1.Completion := hK.toSMul
    letI := AbsoluteValue.completionAlgebra vK w.1 w.2
    AbsoluteValue.algebraicLocalizationAbsoluteValue vK w.1 w.2 (τ x) =
      AbsoluteValue.algebraicLocalizationAbsoluteValue vK w.1 w.2 x := by
  let hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  let : SMul K w.1.Completion := hK.toSMul
  let := AbsoluteValue.completionAlgebra vK w.1 w.2
  let E := AbsoluteValue.algebraicLocalization vK w.1 w.2
  let vhat := AbsoluteValue.completionAbsoluteValue vK
  let wloc := AbsoluteValue.algebraicLocalizationAbsoluteValue vK w.1 w.2
  let : Algebra.IsAlgebraic vK.Completion E :=
    AbsoluteValue.algebraicLocalization_isAlgebraic vK w.1 w.2
  let R := AbsoluteValue.uniqueAlgebraicExtension
    (K := vK.Completion) (L := E) vhat
    (AbsoluteValue.completionAbsoluteValue_complete vK)
    (AbsoluteValue.completionAbsoluteValue_isNontrivial vK hvK)
  have hwloc : wloc = R.extension := by
    apply R.unique
    intro y
    exact AbsoluteValue.algebraicLocalizationAbsoluteValue_extends vK w.1 w.2 y
  let wconj : AbsoluteValue E ℝ :=
    wloc.comp (f := τ.toRingEquiv.toRingHom) τ.injective
  have hwconj : wconj = R.extension := by
    apply R.unique
    intro y
    change wloc (τ (algebraMap vK.Completion E y)) = vhat y
    rw [τ.commutes]
    exact AbsoluteValue.algebraicLocalizationAbsoluteValue_extends vK w.1 w.2 y
  have h := congrArg (fun q : AbsoluteValue E ℝ => q x)
    (hwconj.trans hwloc.symm)
  exact h
omit hvK
 

def localizationAlgEquivRestrict
    (τ :
      letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
      letI : SMul K w.1.Completion := hK.toSMul
      letI := AbsoluteValue.completionAlgebra vK w.1 w.2
      AbsoluteValue.algebraicLocalization vK w.1 w.2 ≃ₐ[vK.Completion]
        AbsoluteValue.algebraicLocalization vK w.1 w.2) : L ≃ₐ[K] L := by
  letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  letI : SMul K w.1.Completion := hK.toSMul
  letI := AbsoluteValue.completionAlgebra vK w.1 w.2
  let E := AbsoluteValue.algebraicLocalization vK w.1 w.2
  let i : L →+* E := AbsoluteValue.toAlgebraicLocalization vK w.1 w.2
  letI : Algebra K E := (i.comp (algebraMap K L)).toAlgebra
  let iAlg : L →ₐ[K] E :=
    { __ := i
      commutes' := fun x => by
        change i (algebraMap K L x) = (i.comp (algebraMap K L)) x
        rfl }
  letI : Algebra L E := i.toAlgebra
  letI : IsScalarTower K L E :=
    IsScalarTower.of_algebraMap_eq' rfl
  let τK : E ≃ₐ[K] E :=
    { __ := τ.toRingEquiv
      commutes' := fun x => by
        change τ (i (algebraMap K L x)) = i (algebraMap K L x)
        rw [AbsoluteValue.toAlgebraicLocalization_algebraMap, τ.commutes] }
  exact Normal.algHomEquivAut K E L (τK.toAlgHom.comp iAlg)
 

theorem localizationAlgEquivRestrict_toLocalization
    (τ :
      letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
      letI : SMul K w.1.Completion := hK.toSMul
      letI := AbsoluteValue.completionAlgebra vK w.1 w.2
      AbsoluteValue.algebraicLocalization vK w.1 w.2 ≃ₐ[vK.Completion]
        AbsoluteValue.algebraicLocalization vK w.1 w.2)
    (x : L) :
    letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
    letI : SMul K w.1.Completion := hK.toSMul
    letI := AbsoluteValue.completionAlgebra vK w.1 w.2
    AbsoluteValue.toAlgebraicLocalization vK w.1 w.2
        (localizationAlgEquivRestrict vK w τ x) =
      τ (AbsoluteValue.toAlgebraicLocalization vK w.1 w.2 x) := by
  let hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  let : SMul K w.1.Completion := hK.toSMul
  let := AbsoluteValue.completionAlgebra vK w.1 w.2
  let E := AbsoluteValue.algebraicLocalization vK w.1 w.2
  let i : L →+* E := AbsoluteValue.toAlgebraicLocalization vK w.1 w.2
  let : Algebra K E := (i.comp (algebraMap K L)).toAlgebra
  let iAlg : L →ₐ[K] E :=
    { __ := i
      commutes' := fun x => by
        change i (algebraMap K L x) = (i.comp (algebraMap K L)) x
        rfl }
  let : Algebra L E := i.toAlgebra
  let : IsScalarTower K L E :=
    IsScalarTower.of_algebraMap_eq' rfl
  let τK : E ≃ₐ[K] E :=
    { __ := τ.toRingEquiv
      commutes' := fun y => by
        change τ (i (algebraMap K L y)) = i (algebraMap K L y)
        rw [AbsoluteValue.toAlgebraicLocalization_algebraMap, τ.commutes] }
  change i (Normal.algHomEquivAut K E L (τK.toAlgHom.comp iAlg) x) =
    τ (i x)
  simpa [iAlg, τK, AlgHom.restrictNormal', RingHom.algebraMap_toAlgebra] using
    ((τK.toAlgHom.comp iAlg).restrictNormal_commutes L x)
 
def localizationToDecompositionGroup
    (τ :
      letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
      letI : SMul K w.1.Completion := hK.toSMul
      letI := AbsoluteValue.completionAlgebra vK w.1 w.2
      AbsoluteValue.algebraicLocalization vK w.1 w.2 ≃ₐ[vK.Completion]
        AbsoluteValue.algebraicLocalization vK w.1 w.2) :
    absoluteValueDecompositionGroup K w.1 := by
  letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  letI : SMul K w.1.Completion := hK.toSMul
  letI := AbsoluteValue.completionAlgebra vK w.1 w.2
  let σ := localizationAlgEquivRestrict vK w τ
  refine ⟨σ, ?_⟩
  intro x
  have habs : w.1 (σ x) = w.1 x := by
    calc
      w.1 (σ x) = AbsoluteValue.algebraicLocalizationAbsoluteValue vK w.1 w.2
          (AbsoluteValue.toAlgebraicLocalization vK w.1 w.2 (σ x)) :=
        (AbsoluteValue.algebraicLocalizationAbsoluteValue_toAlgebraicLocalization vK w.1 w.2 (σ x)).symm
      _ = AbsoluteValue.algebraicLocalizationAbsoluteValue vK w.1 w.2
          (τ (AbsoluteValue.toAlgebraicLocalization vK w.1 w.2 x)) := by
        rw [localizationAlgEquivRestrict_toLocalization]
      _ = AbsoluteValue.algebraicLocalizationAbsoluteValue vK w.1 w.2
          (AbsoluteValue.toAlgebraicLocalization vK w.1 w.2 x) :=
        localizationAbsoluteValue_algEquiv vK hvK w τ _
      _ = w.1 x :=
        AbsoluteValue.algebraicLocalizationAbsoluteValue_toAlgebraicLocalization vK w.1 w.2 x
  rw [habs]
include hvK
 

def decompositionGroupToLocalization
    (σ : absoluteValueDecompositionGroup K w.1) :
    letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
    letI : SMul K w.1.Completion := hK.toSMul
    letI := AbsoluteValue.completionAlgebra vK w.1 w.2
    AbsoluteValue.algebraicLocalization vK w.1 w.2 ≃ₐ[vK.Completion]
      AbsoluteValue.algebraicLocalization vK w.1 w.2 :=
  valuationPreservingLocalizationAlgEquiv vK w (σ : L ≃ₐ[K] L)
    (absoluteValueDecompositionGroup_preserves_absoluteValue vK hvK w σ)
omit [IsGalois K L] in
@[simp] theorem decompositionGroupToLocalization_toLocalization
    (σ : absoluteValueDecompositionGroup K w.1) (x : L) :
    letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
    letI : SMul K w.1.Completion := hK.toSMul
    letI := AbsoluteValue.completionAlgebra vK w.1 w.2
    decompositionGroupToLocalization vK hvK w σ
        (AbsoluteValue.toAlgebraicLocalization vK w.1 w.2 x) =
      AbsoluteValue.toAlgebraicLocalization vK w.1 w.2 ((σ : L ≃ₐ[K] L) x) :=
  valuationPreservingLocalizationAlgEquiv_toLocalization vK w
    (σ : L ≃ₐ[K] L)
    (absoluteValueDecompositionGroup_preserves_absoluteValue vK hvK w σ) x
omit hvK
include hvK
 

theorem localizationToDecompositionGroup_decompositionGroupToLocalization
    (σ : absoluteValueDecompositionGroup K w.1) :
    localizationToDecompositionGroup vK hvK w
        (decompositionGroupToLocalization vK hvK w σ) = σ := by
  apply Subtype.ext
  apply AlgEquiv.ext
  intro x
  let hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  let : SMul K w.1.Completion := hK.toSMul
  let := AbsoluteValue.completionAlgebra vK w.1 w.2
  let i := AbsoluteValue.toAlgebraicLocalization vK w.1 w.2
  apply i.injective
  calc
    i ((localizationToDecompositionGroup vK hvK w
          (decompositionGroupToLocalization vK hvK w σ) :
        L ≃ₐ[K] L) x) =
        decompositionGroupToLocalization vK hvK w σ (i x) :=
      localizationAlgEquivRestrict_toLocalization vK w
        (decompositionGroupToLocalization vK hvK w σ) x
    _ = i ((σ : L ≃ₐ[K] L) x) :=
      decompositionGroupToLocalization_toLocalization vK hvK w σ x
 
theorem decompositionGroupToLocalization_localizationToDecompositionGroup
    (τ :
      letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
      letI : SMul K w.1.Completion := hK.toSMul
      letI := AbsoluteValue.completionAlgebra vK w.1 w.2
      AbsoluteValue.algebraicLocalization vK w.1 w.2 ≃ₐ[vK.Completion]
        AbsoluteValue.algebraicLocalization vK w.1 w.2) :
    letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
    letI : SMul K w.1.Completion := hK.toSMul
    letI := AbsoluteValue.completionAlgebra vK w.1 w.2
    decompositionGroupToLocalization vK hvK w
        (localizationToDecompositionGroup vK hvK w τ) = τ := by
  let hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  let : SMul K w.1.Completion := hK.toSMul
  let := AbsoluteValue.completionAlgebra vK w.1 w.2
  let i := AbsoluteValue.toAlgebraicLocalization vK w.1 w.2
  let ρ := decompositionGroupToLocalization vK hvK w
    (localizationToDecompositionGroup vK hvK w τ)
  have hρ : ρ.toAlgHom = τ.toAlgHom := by
    apply IntermediateField.adjoin_algHom_ext
    intro z hz
    rcases hz with ⟨x, rfl⟩
    change ρ (i x) = τ (i x)
    rw [decompositionGroupToLocalization_toLocalization]
    change i (localizationAlgEquivRestrict vK w τ x) = τ (i x)
    exact localizationAlgEquivRestrict_toLocalization vK w τ x
  exact AlgEquiv.ext fun x => DFunLike.congr_fun hρ x
omit hvK
include hvK
omit [IsGalois K L] in
 
theorem decompositionGroupToLocalization_mul
    (σ τ : absoluteValueDecompositionGroup K w.1) :
    letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
    letI : SMul K w.1.Completion := hK.toSMul
    letI := AbsoluteValue.completionAlgebra vK w.1 w.2
    decompositionGroupToLocalization vK hvK w (σ * τ) =
      decompositionGroupToLocalization vK hvK w σ *
        decompositionGroupToLocalization vK hvK w τ := by
  let hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  let : SMul K w.1.Completion := hK.toSMul
  let := AbsoluteValue.completionAlgebra vK w.1 w.2
  let i := AbsoluteValue.toAlgebraicLocalization vK w.1 w.2
  let ρL := decompositionGroupToLocalization vK hvK w (σ * τ)
  let ρR := decompositionGroupToLocalization vK hvK w σ *
    decompositionGroupToLocalization vK hvK w τ
  have hρ : ρL.toAlgHom = ρR.toAlgHom := by
    apply IntermediateField.adjoin_algHom_ext
    intro z hz
    rcases hz with ⟨x, rfl⟩
    change ρL (i x) = ρR (i x)
    calc
      ρL (i x) = i (((σ * τ : absoluteValueDecompositionGroup K w.1) :
          L ≃ₐ[K] L) x) :=
        decompositionGroupToLocalization_toLocalization vK hvK w (σ * τ) x
      _ = i ((σ : L ≃ₐ[K] L) ((τ : L ≃ₐ[K] L) x)) := rfl
      _ = decompositionGroupToLocalization vK hvK w σ
          (i ((τ : L ≃ₐ[K] L) x)) :=
        (decompositionGroupToLocalization_toLocalization
          vK hvK w σ ((τ : L ≃ₐ[K] L) x)).symm
      _ = decompositionGroupToLocalization vK hvK w σ
          (decompositionGroupToLocalization vK hvK w τ (i x)) := by
        exact congrArg (decompositionGroupToLocalization vK hvK w σ)
          (decompositionGroupToLocalization_toLocalization
            vK hvK w τ x).symm
      _ = ρR (i x) := rfl
  exact AlgEquiv.ext fun x => DFunLike.congr_fun hρ x
omit hvK
include hvK
 


def decompositionGroupEquivAlgebraicLocalizationAut :
    absoluteValueDecompositionGroup K w.1 ≃*
      (letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
       letI : SMul K w.1.Completion := hK.toSMul
       letI := AbsoluteValue.completionAlgebra vK w.1 w.2
       AbsoluteValue.algebraicLocalization vK w.1 w.2 ≃ₐ[vK.Completion]
         AbsoluteValue.algebraicLocalization vK w.1 w.2) where
  toFun := decompositionGroupToLocalization vK hvK w
  invFun := localizationToDecompositionGroup vK hvK w
  left_inv := localizationToDecompositionGroup_decompositionGroupToLocalization
    vK hvK w
  right_inv :=
    decompositionGroupToLocalization_localizationToDecompositionGroup vK hvK w
  map_mul' := decompositionGroupToLocalization_mul vK hvK w
@[simp] theorem localizationRamificationGroups_decompositionGroupEquiv_toLocalization
    (σ : absoluteValueDecompositionGroup K w.1) (x : L) :
    letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
    letI : SMul K w.1.Completion := hK.toSMul
    letI := AbsoluteValue.completionAlgebra vK w.1 w.2
    decompositionGroupEquivAlgebraicLocalizationAut vK hvK w σ
        (AbsoluteValue.toAlgebraicLocalization vK w.1 w.2 x) =
      AbsoluteValue.toAlgebraicLocalization vK w.1 w.2 ((σ : L ≃ₐ[K] L) x) :=
  decompositionGroupToLocalization_toLocalization vK hvK w σ x
omit hvK
end DecompositionEquiv
end HilbertRamification
end
end

/- ClassFieldTheory.LocalClassFieldTheory.ClassFormation.LocalBlocks.Induced -/
section
open scoped TensorProduct
noncomputable section
namespace LocalClassFieldTheory
open AlgebraicNumberTheory.Valuations
open HilbertRamification
open CyclicCohomology.ProfiniteCohomology.Herbrand
open CyclicCohomology
universe u v
variable {K : Type u} {L : Type v}
    [Field K] [Field L] [Algebra K L]
    [FiniteDimensional K L]
    [IsGalois K L]
 

noncomputable abbrev decompositionGroupLocalUnitsAction
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (w : AbsoluteValueExtension vK L) :
    MulDistribMulAction
      (absoluteValueDecompositionGroup K w.1)
      (LocalizedCompletion vK w)ˣ :=
  MulDistribMulAction.compHom
    (LocalizedCompletion vK w)ˣ
    (decompositionGroupEquivAlgebraicLocalizationAut
      vK hvK w).toMonoidHom
 


abbrev LocalPlaceBlock
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (w : AbsoluteValueExtension vK L) :=
  @InducedModule
    (G := L ≃ₐ[K] L)
    (B := (LocalizedCompletion vK w)ˣ)
    inferInstance
    (absoluteValueDecompositionGroup K w.1)
    inferInstance
    (decompositionGroupLocalUnitsAction vK hvK w)
 
noncomputable def localPlaceBlockHerbrandH0Equiv
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (w : AbsoluteValueExtension vK L)
    (σ : L ≃ₐ[K] L)
    (hgen : ∀ τ : L ≃ₐ[K] L,
      τ ∈ Subgroup.zpowers σ) :
    letI :=
      decompositionGroupLocalUnitsAction vK hvK w
    letI : Fintype (absoluteValueDecompositionGroup K w.1) :=
      Fintype.ofFinite _
    HerbrandH0 (L ≃ₐ[K] L)
        (LocalPlaceBlock vK hvK w) ≃*
      HerbrandH0 (absoluteValueDecompositionGroup K w.1)
        (LocalizedCompletion vK w)ˣ :=
  by
    letI :=
      decompositionGroupLocalUnitsAction vK hvK w
    letI : Fintype (absoluteValueDecompositionGroup K w.1) :=
      Fintype.ofFinite _
    exact inducedHerbrandH0EquivOfFiniteCyclic
      (absoluteValueDecompositionGroup K w.1) σ hgen
end LocalClassFieldTheory
end
end

/- ValuedFieldTheory.Valuation.Completion.PolynomialFactors -/
section
noncomputable section
open Polynomial
open UniqueFactorizationMonoid
namespace ValuationTheory
namespace Completion
universe u v
 



noncomputable def polynomialNormalizedFactors
    {F : Type u} [Field F] (p : F[X]) : Multiset F[X] := by
  letI : DecidableEq F := Classical.decEq F
  letI : NormalizationMonoid F := inferInstance
  letI : NormalizationMonoid F[X] := Polynomial.instNormalizationMonoid
  exact normalizedFactors p
 

noncomputable def polynomialDistinctNormalizedFactors
    {F : Type u} [Field F] (p : F[X]) : Finset F[X] := by
  classical
  exact (polynomialNormalizedFactors p).toFinset
 
theorem polynomialNormalizedFactors_eq_of_associated
    {F : Type u} [Field F] {p q : F[X]} (h : Associated p q) :
    polynomialNormalizedFactors p = polynomialNormalizedFactors q := by
  classical
  dsimp [polynomialNormalizedFactors]
  exact h.normalizedFactors_eq
 
theorem polynomialDistinctNormalizedFactors_eq_of_associated
    {F : Type u} [Field F] {p q : F[X]} (h : Associated p q) :
    polynomialDistinctNormalizedFactors p =
      polynomialDistinctNormalizedFactors q := by
  classical
  dsimp [polynomialDistinctNormalizedFactors]
  rw [polynomialNormalizedFactors_eq_of_associated h]
 


abbrev DistinctNormalizedFactors
    {F : Type u} [Field F] (p : F[X]) :=
  {g : F[X] // g ∈ polynomialDistinctNormalizedFactors p}
 
abbrev PolynomialRootsIn
    {F : Type u} [Field F] (E : Type v) [Field E] [Algebra F E]
    (p : F[X]) :=
  {x : E // x ∈ p.rootSet E}
 
def rootMinpoly
    {F : Type u} [Field F] {E : Type v} [Field E] [Algebra F E]
    (p : F[X]) : PolynomialRootsIn E p → F[X] :=
  fun x => minpoly F (x : E)
 

abbrev rootMinpolySetoid
    {F : Type u} [Field F] {E : Type v} [Field E] [Algebra F E]
    (p : F[X]) : Setoid (PolynomialRootsIn E p) :=
  Setoid.ker (rootMinpoly p)
 
theorem rootMinpoly_mem_normalizedFactors
    {F : Type u} [Field F] {E : Type v} [Field E] [Algebra F E]
    [Algebra.IsAlgebraic F E] {p : F[X]} (hp : p ≠ 0)
    (x : PolynomialRootsIn E p) :
    rootMinpoly p x ∈ polynomialDistinctNormalizedFactors p := by
  classical
  dsimp [polynomialDistinctNormalizedFactors, polynomialNormalizedFactors]
  rw [Multiset.mem_toFinset, Polynomial.mem_normalizedFactors_iff hp]
  have hxint : IsIntegral F (x : E) :=
    (Algebra.IsAlgebraic.isAlgebraic (x : E)).isIntegral
  refine ⟨minpoly.irreducible hxint, minpoly.monic hxint, ?_⟩
  exact minpoly.dvd F (x : E) (Polynomial.mem_rootSet.mp x.2).2
 
theorem range_rootMinpoly_eq_distinctNormalizedFactors
    {F : Type u} [Field F] {E : Type v} [Field E] [Algebra F E]
    [Algebra.IsAlgebraic F E] [IsAlgClosed E]
    {p : F[X]} (hp : p ≠ 0) :
    Set.range (rootMinpoly p : PolynomialRootsIn E p → F[X]) =
      {g : F[X] | g ∈ polynomialDistinctNormalizedFactors p} := by
  classical
  ext g
  constructor
  · rintro ⟨x, rfl⟩
    exact rootMinpoly_mem_normalizedFactors hp x
  · intro hg
    have hg' : g ∈ normalizedFactors p := by
      simpa only [polynomialDistinctNormalizedFactors,
        polynomialNormalizedFactors, Multiset.mem_toFinset, Set.mem_ofPred_eq] using hg
    obtain ⟨hgirred, hgmonic, hgdvd⟩ :=
      (Polynomial.mem_normalizedFactors_iff hp).mp hg'
    have hgdegree : g.degree ≠ 0 :=
      (degree_pos_of_irreducible hgirred).ne'
    obtain ⟨x, hx⟩ := IsAlgClosed.exists_aeval_eq_zero E g hgdegree
    have hxp : Polynomial.aeval x p = 0 :=
      aeval_eq_zero_of_dvd_aeval_eq_zero hgdvd hx
    have hxroot : x ∈ p.rootSet E := by
      rw [Polynomial.mem_rootSet]
      exact ⟨hp, hxp⟩
    refine ⟨⟨x, hxroot⟩, ?_⟩
    exact (minpoly.eq_of_irreducible_of_monic hgirred hx hgmonic).symm
 

noncomputable def rootClassesEquivDistinctNormalizedFactors
    {F : Type u} [Field F] {E : Type v} [Field E] [Algebra F E]
    [Algebra.IsAlgebraic F E] [IsAlgClosed E]
    {p : F[X]} (hp : p ≠ 0) :
    Quotient (rootMinpolySetoid (E := E) p) ≃
      DistinctNormalizedFactors p :=
  (Setoid.quotientKerEquivRange (rootMinpoly p)).trans
    (Equiv.setCongr (range_rootMinpoly_eq_distinctNormalizedFactors hp))
 


noncomputable def simpleEmbeddingsEquivMappedMinpolyRoots
    {K : Type u} {L : Type v} {K' E : Type*}
    [Field K] [Field L] [Field K'] [Field E]
    [Algebra K L] [Algebra K K'] [Algebra K E] [Algebra K' E]
    [IsScalarTower K K' E]
    (α : L) (hα : IsIntegral K α)
    (hgen : Algebra.adjoin K ({α} : Set L) = ⊤) :
    (L →ₐ[K] E) ≃
      PolynomialRootsIn E
        ((minpoly K α).map (algebraMap K K')) := by
  let pb : PowerBasis K L := PowerBasis.ofAdjoinEqTop hα hgen
  let p : K'[X] := (minpoly K α).map (algebraMap K K')
  have hpbgen : pb.gen = α := by simp [pb]
  have hp : p ≠ 0 :=
    (Polynomial.map_ne_zero_iff (algebraMap K K').injective).2
      (minpoly.ne_zero hα)
  have hroot (τ : L →ₐ[K] E) : τ α ∈ p.rootSet E := by
    rw [Polynomial.mem_rootSet]
    refine ⟨hp, ?_⟩
    change Polynomial.aeval (τ α)
      ((minpoly K α).map (algebraMap K K')) = 0
    rw [aeval_map_algebraMap]
    rw [aeval_algHom_apply τ α (minpoly K α), minpoly.aeval, map_zero]
  have hbaseRoot (x : PolynomialRootsIn E p) :
      Polynomial.aeval (x : E) (minpoly K pb.gen) = 0 := by
    rw [hpbgen]
    exact (Polynomial.aeval_map_algebraMap K' (x : E) (minpoly K α)).symm.trans
      (Polynomial.mem_rootSet.mp x.2).2
  let toRoot : (L →ₐ[K] E) → PolynomialRootsIn E p :=
    fun τ => ⟨τ α, hroot τ⟩
  let fromRoot : PolynomialRootsIn E p → (L →ₐ[K] E) :=
    fun x => pb.lift (x : E) (hbaseRoot x)
  refine
    { toFun := toRoot
      invFun := fromRoot
      left_inv := ?_
      right_inv := ?_ }
  · intro τ
    apply pb.algHom_ext
    change pb.lift (τ α) _ pb.gen = τ pb.gen
    rw [pb.lift_gen, hpbgen]
  · intro x
    apply Subtype.ext
    change pb.lift (x : E) _ α = x
    calc
      pb.lift (x : E) _ α = pb.lift (x : E) _ pb.gen :=
        congrArg (pb.lift (x : E) (hbaseRoot x)) hpbgen.symm
      _ = x := pb.lift_gen (x : E) (hbaseRoot x)
end Completion
end ValuationTheory
end
end

/- ValuedFieldTheory.Valuation.Completion.ExtensionFactorClassification -/
section
noncomputable section
open Polynomial
open scoped Topology
open ValuationTheory.Completion
namespace AlgebraicNumberTheory
namespace Valuations
universe u v
 
abbrev completionExtensionFactor_completionPolynomial
    {K : Type u} [Field K] (vK : AbsoluteValue K ℝ) (f : K[X]) :
    vK.Completion[X] :=
  f.map (algebraMap K vK.Completion)
 

abbrev CompletionExtensionFactorCompletionFactors
    {K : Type u} [Field K] (vK : AbsoluteValue K ℝ) (f : K[X]) :=
  DistinctNormalizedFactors (completionExtensionFactor_completionPolynomial vK f)
 


theorem completionExtensionFactor_root_isIntegral
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    {α : L} {f : K[X]} (hf : Irreducible f)
    (hroot : Polynomial.aeval α f = 0) : IsIntegral K α :=
  (show IsAlgebraic K α from ⟨f, hf.ne_zero, hroot⟩).isIntegral
 

theorem completionExtensionFactor_definingPolynomial_associated_minpoly
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    {α : L} {f : K[X]} (hf : Irreducible f)
    (hroot : Polynomial.aeval α f = 0) :
    Associated f (minpoly K α) := by
  have hlead : f.leadingCoeff ≠ 0 := leadingCoeff_ne_zero.mpr hf.ne_zero
  have hunit : IsUnit (C f.leadingCoeff⁻¹ : K[X]) :=
    isUnit_C.mpr (IsUnit.mk0 f.leadingCoeff⁻¹ (inv_ne_zero hlead))
  exact (associated_mul_unit_right f (C f.leadingCoeff⁻¹) hunit).trans
    (Associated.of_eq (minpoly.eq_of_irreducible hf hroot))
 

theorem completionExtensionFactor_completionFactors_eq_minpolyFactors
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) {α : L} {f : K[X]}
    (hf : Irreducible f) (hroot : Polynomial.aeval α f = 0) :
    polynomialDistinctNormalizedFactors
        (completionExtensionFactor_completionPolynomial vK f) =
      polynomialDistinctNormalizedFactors
        ((minpoly K α).map (algebraMap K vK.Completion)) := by
  exact polynomialDistinctNormalizedFactors_eq_of_associated
    (Polynomial.associated_map_map (algebraMap K vK.Completion)
      (completionExtensionFactor_definingPolynomial_associated_minpoly hf hroot))
 

noncomputable def completionExtensionFactor_minpolyFactorsEquivCompletionFactors
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) {α : L} {f : K[X]}
    (hf : Irreducible f) (hroot : Polynomial.aeval α f = 0) :
    DistinctNormalizedFactors
        ((minpoly K α).map (algebraMap K vK.Completion)) ≃
      CompletionExtensionFactorCompletionFactors vK f :=
  Equiv.setCongr (by
    ext g
    exact Finset.ext_iff.mp
      (completionExtensionFactor_completionFactors_eq_minpolyFactors
        vK hf hroot).symm g)
 

abbrev CompletionExtensionFactorEmbeddingSetoid
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (α : L) (hα : IsIntegral K α)
    (hgen : Algebra.adjoin K ({α} : Set L) = ⊤) :
    Setoid (L →ₐ[K] absoluteValueExtension_algebraicCompletionClosure vK) :=
  Setoid.comap
    (simpleEmbeddingsEquivMappedMinpolyRoots
      (K' := vK.Completion)
      (E := absoluteValueExtension_algebraicCompletionClosure vK)
      α hα hgen)
    (rootMinpolySetoid
      ((minpoly K α).map (algebraMap K vK.Completion)))
 

noncomputable def completionExtensionFactor_embeddingClassesEquivMinpolyFactors
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (α : L) (hα : IsIntegral K α)
    (hgen : Algebra.adjoin K ({α} : Set L) = ⊤) :
    Quotient (CompletionExtensionFactorEmbeddingSetoid vK α hα hgen) ≃
      DistinctNormalizedFactors
        ((minpoly K α).map (algebraMap K vK.Completion)) :=
  let e := simpleEmbeddingsEquivMappedMinpolyRoots
    (K' := vK.Completion)
    (E := absoluteValueExtension_algebraicCompletionClosure vK)
    α hα hgen
  (Quotient.congr e (fun _ _ => Iff.rfl)).trans
    (rootClassesEquivDistinctNormalizedFactors
      (E := absoluteValueExtension_algebraicCompletionClosure vK)
      ((Polynomial.map_ne_zero_iff
        (algebraMap K vK.Completion).injective).2 (minpoly.ne_zero hα)))
 

theorem completionExtensionFactor_embeddingSetoid_rel_iff_conjugate
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (α : L) (hα : IsIntegral K α)
    (hgen : Algebra.adjoin K ({α} : Set L) = ⊤)
    (τ τ' : L →ₐ[K] absoluteValueExtension_algebraicCompletionClosure vK) :
    (CompletionExtensionFactorEmbeddingSetoid vK α hα hgen).r τ τ' ↔
      AbsoluteValueExtensionConjugateOverCompletion vK τ τ' := by
  let pb : PowerBasis K L := PowerBasis.ofAdjoinEqTop hα hgen
  have hpbgen : pb.gen = α := by simp [pb]
  change IsConjRoot vK.Completion (τ α) (τ' α) ↔ _
  constructor
  · intro hconj
    obtain ⟨σ, hσ⟩ := IsConjRoot.exists_algEquiv hconj.symm
    refine ⟨σ, ?_⟩
    let στ : L →ₐ[K] absoluteValueExtension_algebraicCompletionClosure vK :=
      (σ.toAlgHom.restrictScalars K).comp τ
    have heq : τ' = στ := by
      apply pb.algHom_ext
      rw [hpbgen]
      exact hσ.symm
    intro x
    exact DFunLike.congr_fun heq x
  · rintro ⟨σ, hσ⟩
    change minpoly vK.Completion (τ α) = minpoly vK.Completion (τ' α)
    rw [hσ α]
    exact (minpoly.algEquiv_eq σ (τ α)).symm
 


noncomputable def pullbackAbsoluteValueExtension
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (τ : L →ₐ[K] absoluteValueExtension_algebraicCompletionClosure vK) :
    AbsoluteValueExtension vK L :=
  ⟨absoluteValueExtension_pullback vK hvK τ,
    absoluteValueExtension_pullback_extends vK hvK τ⟩
 



theorem completionExtensionFactor_pullback_eq_iff_embeddingSetoid_rel
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (α : L) (hα : IsIntegral K α)
    (hgen : Algebra.adjoin K ({α} : Set L) = ⊤)
    (τ τ' : L →ₐ[K] absoluteValueExtension_algebraicCompletionClosure vK) :
    absoluteValueExtension_pullback vK hvK τ =
        absoluteValueExtension_pullback vK hvK τ' ↔
      (CompletionExtensionFactorEmbeddingSetoid vK α hα hgen).r τ τ' := by
  let pb : PowerBasis K L := PowerBasis.ofAdjoinEqTop hα hgen
  let : FiniteDimensional K L := pb.finite
  let : Algebra.IsAlgebraic K L := inferInstance
  rw [completionExtensionFactor_embeddingSetoid_rel_iff_conjugate
    vK α hα hgen τ τ']
  exact absoluteValueExtension_pullback_eq_iff_conjugate vK hvK τ τ'
 

theorem completionExtensionFactor_extension_eq_pullback_embeddingOfExtension
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    [Algebra.IsAlgebraic K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (w : AbsoluteValueExtension vK L) :
    w.1 = absoluteValueExtension_pullback vK hvK
      (absoluteValueExtension_embeddingOfExtension vK w) := by
  exact absoluteValueExtension_extension_eq_pullback_embeddingOfExtension vK hvK w
 

noncomputable def completionExtensionFactor_extensionsEquivEmbeddingClasses
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (α : L) (hα : IsIntegral K α)
    (hgen : Algebra.adjoin K ({α} : Set L) = ⊤) :
    AbsoluteValueExtension vK L ≃
      Quotient (CompletionExtensionFactorEmbeddingSetoid vK α hα hgen) := by
  let pb : PowerBasis K L := PowerBasis.ofAdjoinEqTop hα hgen
  letI : FiniteDimensional K L := pb.finite
  letI : Algebra.IsAlgebraic K L := inferInstance
  let fromClass :
      Quotient (CompletionExtensionFactorEmbeddingSetoid vK α hα hgen) →
        AbsoluteValueExtension vK L :=
    Quotient.lift
      (pullbackAbsoluteValueExtension vK hvK)
      (by
        intro τ τ' hrel
        apply Subtype.ext
        exact (completionExtensionFactor_pullback_eq_iff_embeddingSetoid_rel
          vK hvK α hα hgen τ τ').2 hrel)
  refine
    { toFun := fun w => Quotient.mk
        (CompletionExtensionFactorEmbeddingSetoid vK α hα hgen)
        (absoluteValueExtension_embeddingOfExtension vK w)
      invFun := fromClass
      left_inv := ?_
      right_inv := ?_ }
  · intro w
    apply Subtype.ext
    exact (completionExtensionFactor_extension_eq_pullback_embeddingOfExtension
      vK hvK w).symm
  · intro q
    induction q using Quotient.inductionOn with
    | _ τ =>
      apply Quotient.sound
      let wτ : AbsoluteValueExtension vK L :=
        pullbackAbsoluteValueExtension vK hvK τ
      apply (completionExtensionFactor_pullback_eq_iff_embeddingSetoid_rel
        vK hvK α hα hgen
        (absoluteValueExtension_embeddingOfExtension vK wτ) τ).1
      exact (completionExtensionFactor_extension_eq_pullback_embeddingOfExtension
        vK hvK wτ).symm
 

noncomputable def completionExtensionFactor_extensionsEquivMinpolyFactors
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (α : L) (hα : IsIntegral K α)
    (hgen : Algebra.adjoin K ({α} : Set L) = ⊤) :
    AbsoluteValueExtension vK L ≃
      DistinctNormalizedFactors
        ((minpoly K α).map (algebraMap K vK.Completion)) :=
  (completionExtensionFactor_extensionsEquivEmbeddingClasses
      vK hvK α hα hgen).trans
    (completionExtensionFactor_embeddingClassesEquivMinpolyFactors
      vK α hα hgen)
 

noncomputable def completionExtensionFactor_extensionsEquivCompletionFactorsAux
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    {α : L} {f : K[X]} (hf : Irreducible f)
    (hroot : Polynomial.aeval α f = 0)
    (hgen : Algebra.adjoin K ({α} : Set L) = ⊤) :
    AbsoluteValueExtension vK L ≃
      CompletionExtensionFactorCompletionFactors vK f :=
  let hα := completionExtensionFactor_root_isIntegral hf hroot
  (completionExtensionFactor_extensionsEquivMinpolyFactors
      vK hvK α hα hgen).trans
    (completionExtensionFactor_minpolyFactorsEquivCompletionFactors
      vK hf hroot)
 

noncomputable def completionExtensionFactor_extensionFactor
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (α : L)
    (w : AbsoluteValueExtension vK L) : vK.Completion[X] := by
  letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  letI : SMul K w.1.Completion := hK.toSMul
  letI := AbsoluteValue.completionAlgebra vK w.1 w.2
  exact minpoly vK.Completion
    (AbsoluteValue.toCompletionAlgHom (K := K) w.1 α)
 

theorem completionExtensionFactor_extensionFactor_mem
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) {α : L} {f : K[X]}
    (hf : Irreducible f) (hroot : Polynomial.aeval α f = 0)
    (w : AbsoluteValueExtension vK L) :
    completionExtensionFactor_extensionFactor vK α w ∈
      polynomialDistinctNormalizedFactors
        (completionExtensionFactor_completionPolynomial vK f) := by
  classical
  let hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  let : SMul K w.1.Completion := hK.toSMul
  let hKv := AbsoluteValue.completionAlgebra vK w.1 w.2
  let : IsScalarTower K vK.Completion w.1.Completion :=
    AbsoluteValue.completion_isScalarTower vK w.1 w.2
  let ι : L →ₐ[K] w.1.Completion :=
    AbsoluteValue.toCompletionAlgHom (K := K) w.1
  let a : w.1.Completion := ι α
  have hαalg : IsAlgebraic K α := ⟨f, hf.ne_zero, hroot⟩
  have hα : IsIntegral K α := hαalg.isIntegral
  have haK : IsIntegral K a := by
      exact IsIntegral.map_of_comp_eq (RingHom.id K) ι.toRingHom
        (by ext x; simp) hα
  have haKv : IsIntegral vK.Completion a :=
    IsIntegral.tower_top haK
  have hp0 : completionExtensionFactor_completionPolynomial vK f ≠ 0 :=
    (Polynomial.map_ne_zero_iff
      (algebraMap K vK.Completion).injective).2 hf.ne_zero
  have haf : Polynomial.aeval a
      (completionExtensionFactor_completionPolynomial vK f) = 0 := by
    change Polynomial.aeval (ι α)
      (f.map (algebraMap K vK.Completion)) = 0
    rw [Polynomial.aeval_map_algebraMap]
    rw [Polynomial.aeval_algHom_apply ι α f, hroot, map_zero]
  dsimp [completionExtensionFactor_extensionFactor,
    polynomialDistinctNormalizedFactors, polynomialNormalizedFactors]
  rw [Multiset.mem_toFinset, Polynomial.mem_normalizedFactors_iff hp0]
  exact ⟨minpoly.irreducible haKv, minpoly.monic haKv,
    minpoly.dvd vK.Completion a haf⟩
 
noncomputable def completionExtensionFactor_extensionToFactor
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) {α : L} {f : K[X]}
    (hf : Irreducible f) (hroot : Polynomial.aeval α f = 0) :
    AbsoluteValueExtension vK L →
      CompletionExtensionFactorCompletionFactors vK f :=
  fun w => ⟨completionExtensionFactor_extensionFactor vK α w,
    completionExtensionFactor_extensionFactor_mem vK hf hroot w⟩
 


theorem completionExtensionFactor_embeddingOfExtension_minpoly
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    [Algebra.IsAlgebraic K L]
    (vK : AbsoluteValue K ℝ) (α : L)
    (w : AbsoluteValueExtension vK L) :
    minpoly vK.Completion
        (absoluteValueExtension_embeddingOfExtension vK w α) =
      completionExtensionFactor_extensionFactor vK α w := by
  let hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  let : SMul K w.1.Completion := hK.toSMul
  let := AbsoluteValue.completionAlgebra vK w.1 w.2
  let a := AbsoluteValue.toAlgebraicLocalization vK w.1 w.2 α
  calc
    minpoly vK.Completion
        (absoluteValueExtension_embeddingOfExtension vK w α) =
        minpoly vK.Completion a :=
      minpoly.algHom_eq
        (absoluteValueExtension_localizationEmbedding vK w)
        (absoluteValueExtension_localizationEmbedding vK w).injective a
    _ = minpoly vK.Completion
        (AbsoluteValue.toCompletionAlgHom (K := K) w.1 α) := by
      rw [← minpoly.algHom_eq
        (AbsoluteValue.algebraicLocalization vK w.1 w.2).val
        (AbsoluteValue.algebraicLocalization vK w.1 w.2).val.injective a]
      rfl
    _ = completionExtensionFactor_extensionFactor vK α w := rfl
 


theorem completionExtensionFactor_completion_adjoin_eq_top
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (α : L) (hα : IsIntegral K α)
    (hgen : Algebra.adjoin K ({α} : Set L) = ⊤)
    (w : AbsoluteValueExtension vK L) :
    letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
    letI : SMul K w.1.Completion := hK.toSMul
    letI := AbsoluteValue.completionAlgebra vK w.1 w.2
    Algebra.adjoin vK.Completion
        ({AbsoluteValue.toCompletionAlgHom (K := K) w.1 α} :
          Set w.1.Completion) = ⊤ := by
  let pb : PowerBasis K L := PowerBasis.ofAdjoinEqTop hα hgen
  let : FiniteDimensional K L := pb.finite
  let : Algebra.IsAlgebraic K L := inferInstance
  let hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  let : SMul K w.1.Completion := hK.toSMul
  let := AbsoluteValue.completionAlgebra vK w.1 w.2
  let : IsScalarTower K vK.Completion w.1.Completion :=
    AbsoluteValue.completion_isScalarTower vK w.1 w.2
  let ι : L →ₐ[K] w.1.Completion :=
    AbsoluteValue.toCompletionAlgHom (K := K) w.1
  let a : w.1.Completion := ι α
  have haK : IsIntegral K a := by
      exact IsIntegral.map_of_comp_eq (RingHom.id K) ι.toRingHom
        (by ext x; simp) hα
  have haKv : IsIntegral vK.Completion a :=
    IsIntegral.tower_top haK
  have hrange : Set.range
      (AbsoluteValue.toCompletion w.1) ⊆
      (IntermediateField.adjoin vK.Completion ({a} : Set w.1.Completion) :
        Set w.1.Completion) := by
    rintro _ ⟨x, rfl⟩
    change ι x ∈ IntermediateField.adjoin vK.Completion ({a} : Set _)
    have hx : x ∈ Algebra.adjoin K ({α} : Set L) := by
      rw [hgen]
      trivial
    induction hx using Algebra.adjoin_induction with
    | mem x hx =>
        rw [Set.mem_singleton_iff.mp hx]
        exact IntermediateField.mem_adjoin_simple_self vK.Completion a
    | algebraMap x =>
        rw [ι.commutes,
          IsScalarTower.algebraMap_apply K vK.Completion w.1.Completion]
        exact (IntermediateField.adjoin vK.Completion ({a} : Set _)).algebraMap_mem _
    | add x y _ _ hx hy =>
        simpa only [map_add] using
          (IntermediateField.adjoin vK.Completion ({a} : Set _)).add_mem hx hy
    | mul x y _ _ hx hy =>
        simpa only [map_mul] using
          (IntermediateField.adjoin vK.Completion ({a} : Set _)).mul_mem hx hy
  have hloc_le : AbsoluteValue.algebraicLocalization vK w.1 w.2 ≤
      IntermediateField.adjoin vK.Completion ({a} : Set _) := by
    exact IntermediateField.adjoin_le_iff.mpr hrange
  have hsimple : IntermediateField.adjoin vK.Completion ({a} : Set _) = ⊤ := by
    apply top_unique
    rw [← absoluteValueExtension_finiteLocalization_eq_top vK hvK w]
    exact hloc_le
  rw [← IntermediateField.adjoin_simple_toSubalgebra_of_isAlgebraic
      haKv.isAlgebraic,
    hsimple, IntermediateField.top_toSubalgebra]
 

noncomputable def completionExtensionFactor_adjoinRootEquivCompletion
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (α : L) (hα : IsIntegral K α)
    (hgen : Algebra.adjoin K ({α} : Set L) = ⊤)
    (w : AbsoluteValueExtension vK L) :
    letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
    letI : SMul K w.1.Completion := hK.toSMul
    letI := AbsoluteValue.completionAlgebra vK w.1 w.2
    AdjoinRoot (completionExtensionFactor_extensionFactor vK α w) ≃ₐ[vK.Completion]
      w.1.Completion := by
  letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  letI : SMul K w.1.Completion := hK.toSMul
  letI := AbsoluteValue.completionAlgebra vK w.1 w.2
  letI : IsScalarTower K vK.Completion w.1.Completion :=
    AbsoluteValue.completion_isScalarTower vK w.1 w.2
  let ι : L →ₐ[K] w.1.Completion :=
    AbsoluteValue.toCompletionAlgHom (K := K) w.1
  let a : w.1.Completion := ι α
  have haK : IsIntegral K a := by
      exact IsIntegral.map_of_comp_eq (RingHom.id K) ι.toRingHom
        (by ext x; simp) hα
  have haKv : IsIntegral vK.Completion a :=
    IsIntegral.tower_top haK
  have htop : Algebra.adjoin vK.Completion ({a} : Set w.1.Completion) = ⊤ :=
    completionExtensionFactor_completion_adjoin_eq_top
      vK hvK α hα hgen w
  change AdjoinRoot (minpoly vK.Completion a) ≃ₐ[vK.Completion]
    w.1.Completion
  exact (@minpoly.equivAdjoin vK.Completion w.1.Completion _ _ _ _ _ _
    (Module.isTorsionFree_iff_algebraMap_injective.mpr
      (algebraMap vK.Completion w.1.Completion).injective) a haKv).trans
    ((Subalgebra.equivOfEq _ _ htop).trans Subalgebra.topEquiv)
 

@[simp]
theorem completionExtensionFactor_adjoinRootEquivCompletion_root
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (α : L) (hα : IsIntegral K α)
    (hgen : Algebra.adjoin K ({α} : Set L) = ⊤)
    (w : AbsoluteValueExtension vK L) :
    letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
    letI : SMul K w.1.Completion := hK.toSMul
    letI := AbsoluteValue.completionAlgebra vK w.1 w.2
    completionExtensionFactor_adjoinRootEquivCompletion vK hvK α hα hgen w
        (AdjoinRoot.root (completionExtensionFactor_extensionFactor vK α w)) =
      AbsoluteValue.toCompletionAlgHom (K := K) w.1 α := by
  let hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  let : SMul K w.1.Completion := hK.toSMul
  let := AbsoluteValue.completionAlgebra vK w.1 w.2
  let : IsScalarTower K vK.Completion w.1.Completion :=
    AbsoluteValue.completion_isScalarTower vK w.1 w.2
  let ι : L →ₐ[K] w.1.Completion :=
    AbsoluteValue.toCompletionAlgHom (K := K) w.1
  let a : w.1.Completion := ι α
  change ((AdjoinRoot.Minpoly.toAdjoin vK.Completion a)
      (AdjoinRoot.root (minpoly vK.Completion a)) : w.1.Completion) = a
  exact AdjoinRoot.Minpoly.coe_toAdjoin_mk_X
    (R := vK.Completion) (x := a)
 

theorem completionExtensionFactor_extensionsEquivCompletionFactorsAux_apply
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    {α : L} {f : K[X]} (hf : Irreducible f)
    (hroot : Polynomial.aeval α f = 0)
    (hgen : Algebra.adjoin K ({α} : Set L) = ⊤)
    (w : AbsoluteValueExtension vK L) :
    (completionExtensionFactor_extensionsEquivCompletionFactorsAux
        vK hvK hf hroot hgen w).1 =
      completionExtensionFactor_extensionFactor vK α w := by
  let hα := completionExtensionFactor_root_isIntegral hf hroot
  let pb : PowerBasis K L := PowerBasis.ofAdjoinEqTop hα hgen
  let : FiniteDimensional K L := pb.finite
  let : Algebra.IsAlgebraic K L := inferInstance
  change minpoly vK.Completion
      (absoluteValueExtension_embeddingOfExtension vK w α) =
    completionExtensionFactor_extensionFactor vK α w
  exact completionExtensionFactor_embeddingOfExtension_minpoly vK α w
 



noncomputable def completionExtensionFactor_extensionEquivFactors
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    {α : L} {f : K[X]} (hf : Irreducible f)
    (hroot : Polynomial.aeval α f = 0)
    (hgen : Algebra.adjoin K ({α} : Set L) = ⊤) :
    AbsoluteValueExtension vK L ≃
      CompletionExtensionFactorCompletionFactors vK f := by
  let e := completionExtensionFactor_extensionsEquivCompletionFactorsAux
    vK hvK hf hroot hgen
  apply Equiv.ofBijective
    (completionExtensionFactor_extensionToFactor vK hf hroot)
  have heq : completionExtensionFactor_extensionToFactor vK hf hroot = e := by
    funext w
    apply Subtype.ext
    exact (completionExtensionFactor_extensionsEquivCompletionFactorsAux_apply
      vK hvK hf hroot hgen w).symm
  rw [heq]
  exact e.bijective
end Valuations
end AlgebraicNumberTheory
end
end

/- ValuedFieldTheory.Valuation.Completion.SeparablePolynomialFactors -/
section
noncomputable section
open Polynomial UniqueFactorizationMonoid
open scoped BigOperators
namespace ValuationTheory
namespace Completion
universe u
 

theorem separable_monic_eq_prod_distinctNormalizedFactors
    {F : Type u} [Field F] (p : F[X])
    (hpmonic : p.Monic) (hpsep : p.Separable) :
    p = ∏ g : DistinctNormalizedFactors p, (g.1 : F[X]) := by
  classical
  let : NormalizationMonoid F := inferInstance
  let : NormalizationMonoid F[X] := Polynomial.instNormalizationMonoid
  have hp0 : p ≠ 0 := hpmonic.ne_zero
  have hnodup : (normalizedFactors p).Nodup :=
    (squarefree_iff_nodup_normalizedFactors hp0).1 hpsep.squarefree
  have hprod : (normalizedFactors p).prod = p := by
    simpa [hpmonic.leadingCoeff] using
      (Polynomial.leadingCoeff_mul_prod_normalizedFactors p)
  calc
    p = (normalizedFactors p).prod := hprod.symm
    _ = ∏ g : DistinctNormalizedFactors p, (g.1 : F[X]) := by
      change (normalizedFactors p).prod =
        ∏ g : {g : F[X] // g ∈ (normalizedFactors p).toFinset}, g.1
      rw [Finset.univ_eq_attach,
        Finset.prod_attach (f := fun x : F[X] ↦ x)]
      change (normalizedFactors p).prod =
        ((normalizedFactors p).toFinset.1.map id).prod
      rw [Multiset.toFinset_val, hnodup.dedup, Multiset.map_id]
 
theorem distinctNormalizedFactors_pairwise_coprime
    {F : Type u} [Field F] (p : F[X]) :
    ∀ i j : DistinctNormalizedFactors p, i ≠ j →
      IsCoprime (i.1 : F[X]) j.1 := by
  classical
  let : NormalizationMonoid F := inferInstance
  let : NormalizationMonoid F[X] := Polynomial.instNormalizationMonoid
  intro i j hij
  have hnorm : polynomialNormalizedFactors p = normalizedFactors p := by
    rfl
  have hi : i.1 ∈ normalizedFactors p := by
    rw [← hnorm]
    exact Multiset.mem_toFinset.mp i.2
  have hj : j.1 ∈ normalizedFactors p := by
    rw [← hnorm]
    exact Multiset.mem_toFinset.mp j.2
  rcases (prime_of_normalized_factor i.1 hi).irreducible.isCoprime_or_dvd j.1 with h | h
  · exact h
  · exfalso
    apply hij
    apply Subtype.ext
    exact normalizedFactors_eq_of_dvd p i.1 hi j.1 hj h
end Completion
end ValuationTheory
end
end

/- ValuedFieldTheory.Valuation.Completion.BaseChangeAdjoinRoot -/
section
noncomputable section
namespace ValuationTheory
namespace Completion
universe u v w
open scoped TensorProduct Polynomial
 
noncomputable def powerBasisBaseChange
    {K A L : Type*} [Field K] [Field A] [Field L]
    [Algebra K A] [Algebra K L]
    (pb : PowerBasis K L) : PowerBasis A (A ⊗[K] L) where
  gen := 1 ⊗ₜ[K] pb.gen
  dim := pb.dim
  basis := Algebra.TensorProduct.basis A pb.basis
  basis_eq_pow i := by
    rw [Algebra.TensorProduct.basis_apply, pb.basis_eq_pow]
    simp [Algebra.TensorProduct.tmul_pow]
 
@[simp]
theorem powerBasisBaseChange_gen
    {K A L : Type*} [Field K] [Field A] [Field L]
    [Algebra K A] [Algebra K L]
    (pb : PowerBasis K L) :
    (powerBasisBaseChange (A := A) pb).gen = 1 ⊗ₜ[K] pb.gen :=
  rfl
 
theorem minpoly_map_aeval_one_tmul
    {K A L : Type*} [Field K] [Field A] [Field L]
    [Algebra K A] [Algebra K L]
    (pb : PowerBasis K L) :
    Polynomial.aeval (1 ⊗ₜ[K] pb.gen : A ⊗[K] L)
      ((minpoly K pb.gen).map (algebraMap K A)) = 0 := by
  rw [Polynomial.aeval_map_algebraMap]
  show Polynomial.aeval
      ((Algebra.TensorProduct.includeRight : L →ₐ[K] A ⊗[K] L) pb.gen)
        (minpoly K pb.gen) = 0
  rw [Polynomial.aeval_algHom_apply, minpoly.aeval, map_zero]
 

noncomputable def adjoinRootToBaseChange
    {K A L : Type*} [Field K] [Field A] [Field L]
    [Algebra K A] [Algebra K L]
    (pb : PowerBasis K L) :
    AdjoinRoot ((minpoly K pb.gen).map (algebraMap K A)) →ₐ[A]
      A ⊗[K] L :=
  AdjoinRoot.liftAlgHom _ (Algebra.ofId A (A ⊗[K] L))
    (1 ⊗ₜ[K] pb.gen) (by
      change Polynomial.aeval (1 ⊗ₜ[K] pb.gen : A ⊗[K] L)
        ((minpoly K pb.gen).map (algebraMap K A)) = 0
      exact minpoly_map_aeval_one_tmul (A := A) pb)
 
@[simp]
theorem adjoinRootToBaseChange_root
    {K A L : Type*} [Field K] [Field A] [Field L]
    [Algebra K A] [Algebra K L]
    (pb : PowerBasis K L) :
    adjoinRootToBaseChange (A := A) pb
        (AdjoinRoot.root ((minpoly K pb.gen).map (algebraMap K A))) =
      1 ⊗ₜ[K] pb.gen := by
  simp [adjoinRootToBaseChange]
 
theorem adjoinRootToBaseChange_surjective
    {K A L : Type*} [Field K] [Field A] [Field L]
    [Algebra K A] [Algebra K L]
    (pb : PowerBasis K L) :
    Function.Surjective (adjoinRootToBaseChange (A := A) pb) := by
  let q := (minpoly K pb.gen).map (algebraMap K A)
  let e := adjoinRootToBaseChange (A := A) pb
  let b := (powerBasisBaseChange (A := A) pb).basis
  change Function.Surjective e.toLinearMap
  rw [← e.toLinearMap.range_eq_top]
  apply top_unique
  rw [← b.span_eq]
  apply Submodule.span_le.2
  rintro _ ⟨i, rfl⟩
  refine ⟨AdjoinRoot.root q ^ (i : ℕ), ?_⟩
  change e (AdjoinRoot.root q ^ (i : ℕ)) = b i
  rw [map_pow, (powerBasisBaseChange (A := A) pb).basis_eq_pow,
    adjoinRootToBaseChange_root]
  rw [powerBasisBaseChange_gen, Algebra.TensorProduct.tmul_pow, one_pow]
 
theorem adjoinRoot_baseChange_finrank_eq
    {K A L : Type*} [Field K] [Field A] [Field L]
    [Algebra K A] [Algebra K L]
    (pb : PowerBasis K L) :
    Module.finrank A
        (AdjoinRoot ((minpoly K pb.gen).map (algebraMap K A))) =
      Module.finrank A (A ⊗[K] L) := by
  let q := (minpoly K pb.gen).map (algebraMap K A)
  let hq : q.Monic :=
    (minpoly.monic pb.isIntegral_gen).map (algebraMap K A)
  let qpb : PowerBasis A (AdjoinRoot q) := AdjoinRoot.powerBasis' hq
  calc
    Module.finrank A (AdjoinRoot q) = q.natDegree := qpb.finrank
    _ = (minpoly K pb.gen).natDegree :=
      (minpoly.monic pb.isIntegral_gen).natDegree_map (algebraMap K A)
    _ = pb.dim := pb.natDegree_minpoly
    _ = Module.finrank A (A ⊗[K] L) :=
      (powerBasisBaseChange (A := A) pb).finrank.symm
 

noncomputable def adjoinRootEquivBaseChange
    {K A L : Type*} [Field K] [Field A] [Field L]
    [Algebra K A] [Algebra K L]
    (pb : PowerBasis K L) :
    AdjoinRoot ((minpoly K pb.gen).map (algebraMap K A)) ≃ₐ[A]
      A ⊗[K] L := by
  let q := (minpoly K pb.gen).map (algebraMap K A)
  let hq : q.Monic :=
    (minpoly.monic pb.isIntegral_gen).map (algebraMap K A)
  letI : Module.Finite A (AdjoinRoot q) := hq.finite_adjoinRoot
  letI : Module.Finite A (A ⊗[K] L) :=
    (powerBasisBaseChange (A := A) pb).finite
  exact AlgEquiv.ofBijective (adjoinRootToBaseChange (A := A) pb)
    ⟨(LinearMap.injective_iff_surjective_of_finrank_eq_finrank
        (adjoinRoot_baseChange_finrank_eq (A := A) pb)
        (f := (adjoinRootToBaseChange (A := A) pb).toLinearMap)).2
      (adjoinRootToBaseChange_surjective (A := A) pb),
      adjoinRootToBaseChange_surjective (A := A) pb⟩
 
@[simp]
theorem adjoinRootEquivBaseChange_root
    {K A L : Type*} [Field K] [Field A] [Field L]
    [Algebra K A] [Algebra K L]
    (pb : PowerBasis K L) :
    adjoinRootEquivBaseChange (A := A) pb
        (AdjoinRoot.root ((minpoly K pb.gen).map (algebraMap K A))) =
      1 ⊗ₜ[K] pb.gen := by
  change adjoinRootToBaseChange (A := A) pb
      (AdjoinRoot.root ((minpoly K pb.gen).map (algebraMap K A))) = _
  exact adjoinRootToBaseChange_root (A := A) pb
 
noncomputable def baseChangeEquivAdjoinRoot
    {K A L : Type*} [Field K] [Field A] [Field L]
    [Algebra K A] [Algebra K L]
    (pb : PowerBasis K L) :
    A ⊗[K] L ≃ₐ[A]
      AdjoinRoot ((minpoly K pb.gen).map (algebraMap K A)) :=
  (adjoinRootEquivBaseChange (A := A) pb).symm
 
@[simp]
theorem baseChangeEquivAdjoinRoot_one_tmul_gen
    {K A L : Type*} [Field K] [Field A] [Field L]
    [Algebra K A] [Algebra K L]
    (pb : PowerBasis K L) :
    baseChangeEquivAdjoinRoot (A := A) pb (1 ⊗ₜ[K] pb.gen) =
      AdjoinRoot.root ((minpoly K pb.gen).map (algebraMap K A)) := by
  change (adjoinRootEquivBaseChange (A := A) pb).symm
      (1 ⊗ₜ[K] pb.gen) = _
  rw [← adjoinRootEquivBaseChange_root]
  exact (adjoinRootEquivBaseChange (A := A) pb).symm_apply_apply _
end Completion
end ValuationTheory
end
end

/- ValuedFieldTheory.Valuation.Completion.PolynomialCRT -/
section
noncomputable section
namespace ValuationTheory
namespace Completion
universe u v
open scoped Polynomial
open Function
 

noncomputable def quotientInfAlgEquivPiQuotient
    {R A : Type*} [CommRing R] [CommRing A] [Algebra R A]
    {ι : Type*} [Finite ι]
    (I : ι → Ideal A) (hI : Pairwise (IsCoprime on I)) :
    (A ⧸ ⨅ i, I i) ≃ₐ[R] ∀ i, A ⧸ I i where
  __ := Ideal.quotientInfRingEquivPiQuotient I hI
  commutes' r := by
    ext i
    rfl
 


noncomputable def adjoinRootProdEquivPi
    {F : Type u} [Field F] {ι : Type v} [Fintype ι]
    (f : ι → F[X])
    (hf : ∀ i j, i ≠ j → IsCoprime (f i) (f j)) :
    AdjoinRoot (∏ i, f i) ≃ₐ[F] ∀ i, AdjoinRoot (f i) := by
  let I : ι → Ideal F[X] := fun i => Ideal.span ({f i} : Set F[X])
  have hI : Pairwise (IsCoprime on I) := by
    intro i j hij
    exact (Ideal.isCoprime_span_singleton_iff (f i) (f j)).2
      (hf i j hij)
  have hInf : Ideal.span ({∏ i, f i} : Set F[X]) = ⨅ i, I i := by
    symm
    exact Ideal.iInf_span_singleton hf
  exact
    (Ideal.quotientEquivAlgOfEq F hInf).trans
      (quotientInfAlgEquivPiQuotient I hI)
 

@[simp]
theorem adjoinRootProdEquivPi_mk
    {F : Type u} [Field F] {ι : Type v} [Fintype ι]
    (f : ι → F[X])
    (hf : ∀ i j, i ≠ j → IsCoprime (f i) (f j))
    (g : F[X]) (i : ι) :
    adjoinRootProdEquivPi f hf (AdjoinRoot.mk (∏ i, f i) g) i =
      AdjoinRoot.mk (f i) g := by
  change Ideal.Quotient.mk (Ideal.span ({f i} : Set F[X])) g =
    Ideal.Quotient.mk (Ideal.span ({f i} : Set F[X])) g
  rfl
end Completion
end ValuationTheory
end
end

/- ValuedFieldTheory.Valuation.Completion.CanonicalTensorMap -/
section
noncomputable section
namespace AlgebraicNumberTheory
namespace Valuations
universe u v
open scoped TensorProduct
 
noncomputable def completionTensorMap_leftCanonicalHom
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) :
    letI : ∀ w : AbsoluteValueExtension vK L,
        Algebra vK.Completion w.1.Completion :=
      fun w ↦ AbsoluteValue.completionAlgebra vK w.1 w.2
    vK.Completion ⊗[K] L →ₐ[vK.Completion]
      ∀ w : AbsoluteValueExtension vK L, w.1.Completion := by
  letI : ∀ w : AbsoluteValueExtension vK L,
      Algebra vK.Completion w.1.Completion :=
    fun w ↦ AbsoluteValue.completionAlgebra vK w.1 w.2
  exact AlgHom.pi fun w ↦
    absoluteValueExtension_localizationTensorHom vK w
@[simp]
theorem completionTensorMap_leftCanonicalHom_tmul_apply
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (vK : AbsoluteValue K ℝ) (b : vK.Completion) (a : L)
    (w : AbsoluteValueExtension vK L) :
    letI : ∀ w : AbsoluteValueExtension vK L,
        Algebra vK.Completion w.1.Completion :=
      fun w ↦ AbsoluteValue.completionAlgebra vK w.1 w.2
    completionTensorMap_leftCanonicalHom vK (b ⊗ₜ[K] a) w =
      algebraMap vK.Completion w.1.Completion b *
        AbsoluteValue.toCompletionAlgHom (K := K) w.1 a := by
  let : ∀ w : AbsoluteValueExtension vK L,
      Algebra vK.Completion w.1.Completion :=
    fun w ↦ AbsoluteValue.completionAlgebra vK w.1 w.2
  exact absoluteValueExtension_localizationTensorHom_tmul vK w b a
end Valuations
end AlgebraicNumberTheory
end
end

/- ValuedFieldTheory.Valuation.Completion.TensorProductDecomposition -/
section
noncomputable section
open Polynomial
open scoped BigOperators TensorProduct
open ValuationTheory.Completion
namespace AlgebraicNumberTheory
namespace Valuations
universe u v
 

noncomputable def completionTensorDecomposition_powerBasis
    (K : Type u) (L : Type v) [Field K] [Field L] [Algebra K L]
    [FiniteDimensional K L] [Algebra.IsSeparable K L] : PowerBasis K L :=
  Field.powerBasisOfFiniteOfSeparable K L
 
noncomputable abbrev completionTensorDecomposition_extensionFintype
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial) :
    Fintype (AbsoluteValueExtension vK L) := by
  let pb := completionTensorDecomposition_powerBasis K L
  let hf : Irreducible (minpoly K pb.gen) :=
    minpoly.irreducible pb.isIntegral_gen
  let e := completionExtensionFactor_extensionEquivFactors vK hvK hf
    (minpoly.aeval K pb.gen) pb.adjoin_gen_eq_top
  exact Fintype.ofEquiv _ e.symm
 

theorem completionTensorDecomposition_mapped_minpoly_eq_prod_extensionFactors
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial) :
    letI := completionTensorDecomposition_extensionFintype (K := K) (L := L) vK hvK
    (minpoly K (completionTensorDecomposition_powerBasis K L).gen).map
        (algebraMap K vK.Completion) =
      ∏ w : AbsoluteValueExtension vK L,
        completionExtensionFactor_extensionFactor vK
          (completionTensorDecomposition_powerBasis K L).gen w := by
  classical
  let := completionTensorDecomposition_extensionFintype (K := K) (L := L) vK hvK
  let pb := completionTensorDecomposition_powerBasis K L
  let p := (minpoly K pb.gen).map (algebraMap K vK.Completion)
  let hf : Irreducible (minpoly K pb.gen) :=
    minpoly.irreducible pb.isIntegral_gen
  let e := completionExtensionFactor_extensionEquivFactors vK hvK hf
    (minpoly.aeval K pb.gen) pb.adjoin_gen_eq_top
  have hpmonic : p.Monic :=
    (minpoly.monic pb.isIntegral_gen).map (algebraMap K vK.Completion)
  have hpsep : p.Separable :=
    Polynomial.Separable.map
      (Algebra.IsSeparable.isSeparable K (pb.gen : L))
  calc
    p = ∏ g : CompletionExtensionFactorCompletionFactors vK (minpoly K pb.gen),
        (g.1 : vK.Completion[X]) :=
      separable_monic_eq_prod_distinctNormalizedFactors p hpmonic hpsep
    _ = ∏ w : AbsoluteValueExtension vK L,
        completionExtensionFactor_extensionFactor vK pb.gen w := by
      symm
      exact Fintype.prod_equiv e _ _ (fun _ ↦ rfl)
 
theorem completionTensorDecomposition_extensionFactors_pairwise_coprime
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial) :
    letI := completionTensorDecomposition_extensionFintype (K := K) (L := L) vK hvK
    ∀ w w' : AbsoluteValueExtension vK L, w ≠ w' →
      IsCoprime
        (completionExtensionFactor_extensionFactor vK
          (completionTensorDecomposition_powerBasis K L).gen w)
        (completionExtensionFactor_extensionFactor vK
          (completionTensorDecomposition_powerBasis K L).gen w') := by
  classical
  let := completionTensorDecomposition_extensionFintype (K := K) (L := L) vK hvK
  let pb := completionTensorDecomposition_powerBasis K L
  let hf : Irreducible (minpoly K pb.gen) :=
    minpoly.irreducible pb.isIntegral_gen
  let e := completionExtensionFactor_extensionEquivFactors vK hvK hf
    (minpoly.aeval K pb.gen) pb.adjoin_gen_eq_top
  intro w w' hww'
  have he : e w ≠ e w' := fun h ↦ hww' (e.injective h)
  exact distinctNormalizedFactors_pairwise_coprime
    ((minpoly K pb.gen).map (algebraMap K vK.Completion))
    (e w) (e w') he
 

noncomputable def completionTensorDecomposition_factorEquiv
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial) :
    letI : ∀ w : AbsoluteValueExtension vK L,
        Algebra vK.Completion w.1.Completion :=
      fun w ↦ AbsoluteValue.completionAlgebra vK w.1 w.2
    vK.Completion ⊗[K] L ≃ₐ[vK.Completion]
      ∀ w : AbsoluteValueExtension vK L, w.1.Completion := by
  classical
  letI := completionTensorDecomposition_extensionFintype (K := K) (L := L) vK hvK
  let pb := completionTensorDecomposition_powerBasis K L
  let hα := pb.isIntegral_gen
  let hgen := pb.adjoin_gen_eq_top
  letI hK : ∀ w : AbsoluteValueExtension vK L,
      Algebra K w.1.Completion :=
    fun w ↦ AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  letI : ∀ w : AbsoluteValueExtension vK L, SMul K w.1.Completion :=
    fun w ↦ (hK w).toSMul
  letI : ∀ w : AbsoluteValueExtension vK L,
      Algebra vK.Completion w.1.Completion :=
    fun w ↦ AbsoluteValue.completionAlgebra vK w.1 w.2
  let ebase := baseChangeEquivAdjoinRoot (A := vK.Completion) pb
  let hprod := completionTensorDecomposition_mapped_minpoly_eq_prod_extensionFactors
    (K := K) (L := L) vK hvK
  let econgr := AdjoinRoot.algEquivOfEq vK.Completion _ _ hprod
  let ecrt := adjoinRootProdEquivPi
    (fun w : AbsoluteValueExtension vK L ↦
      completionExtensionFactor_extensionFactor vK pb.gen w)
    (completionTensorDecomposition_extensionFactors_pairwise_coprime
      (K := K) (L := L) vK hvK)
  let elocal := AlgEquiv.piCongrRight fun w ↦
    completionExtensionFactor_adjoinRootEquivCompletion
      vK hvK pb.gen hα hgen w
  exact ebase.trans (econgr.trans (ecrt.trans elocal))
 

@[simp]
theorem completionTensorDecomposition_factorEquiv_one_tmul_gen
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (w : AbsoluteValueExtension vK L) :
    letI : ∀ w : AbsoluteValueExtension vK L,
        Algebra vK.Completion w.1.Completion :=
      fun w ↦ AbsoluteValue.completionAlgebra vK w.1 w.2
    completionTensorDecomposition_factorEquiv (K := K) (L := L) vK hvK
        (1 ⊗ₜ[K] (completionTensorDecomposition_powerBasis K L).gen) w =
      AbsoluteValue.toCompletionAlgHom (K := K) w.1
        (completionTensorDecomposition_powerBasis K L).gen := by
  classical
  let := completionTensorDecomposition_extensionFintype (K := K) (L := L) vK hvK
  let pb := completionTensorDecomposition_powerBasis K L
  let hK : ∀ w : AbsoluteValueExtension vK L,
      Algebra K w.1.Completion :=
    fun w ↦ AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  let : ∀ w : AbsoluteValueExtension vK L, SMul K w.1.Completion :=
    fun w ↦ (hK w).toSMul
  let : ∀ w : AbsoluteValueExtension vK L,
      Algebra vK.Completion w.1.Completion :=
    fun w ↦ AbsoluteValue.completionAlgebra vK w.1 w.2
  let factors := fun w : AbsoluteValueExtension vK L ↦
    completionExtensionFactor_extensionFactor vK pb.gen w
  let hcop := completionTensorDecomposition_extensionFactors_pairwise_coprime
    (K := K) (L := L) vK hvK
  let ebase := baseChangeEquivAdjoinRoot (A := vK.Completion) pb
  let hprod := completionTensorDecomposition_mapped_minpoly_eq_prod_extensionFactors
    (K := K) (L := L) vK hvK
  let econgr := AdjoinRoot.algEquivOfEq vK.Completion _ _ hprod
  let ecrt := adjoinRootProdEquivPi factors hcop
  let elocal := AlgEquiv.piCongrRight fun w ↦
    completionExtensionFactor_adjoinRootEquivCompletion
      vK hvK pb.gen pb.isIntegral_gen pb.adjoin_gen_eq_top w
  change elocal (ecrt (econgr (ebase (1 ⊗ₜ[K] pb.gen)))) w = _
  rw [baseChangeEquivAdjoinRoot_one_tmul_gen,
    AdjoinRoot.algEquivOfEq_root]
  change
    (completionExtensionFactor_adjoinRootEquivCompletion
      vK hvK pb.gen pb.isIntegral_gen pb.adjoin_gen_eq_top w)
        (adjoinRootProdEquivPi factors hcop
          (AdjoinRoot.mk (∏ w, factors w) X) w) = _
  rw [adjoinRootProdEquivPi_mk]
  exact completionExtensionFactor_adjoinRootEquivCompletion_root
    vK hvK pb.gen pb.isIntegral_gen pb.adjoin_gen_eq_top w
 

theorem completionTensorDecomposition_factorEquiv_toAlgHom
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial) :
    letI : ∀ w : AbsoluteValueExtension vK L,
        Algebra vK.Completion w.1.Completion :=
      fun w ↦ AbsoluteValue.completionAlgebra vK w.1 w.2
    (completionTensorDecomposition_factorEquiv (K := K) (L := L) vK hvK).toAlgHom =
      completionTensorMap_leftCanonicalHom vK := by
  classical
  let := completionTensorDecomposition_extensionFintype (K := K) (L := L) vK hvK
  let pb := completionTensorDecomposition_powerBasis K L
  let hK : ∀ w : AbsoluteValueExtension vK L,
      Algebra K w.1.Completion :=
    fun w ↦ AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  let : ∀ w : AbsoluteValueExtension vK L, SMul K w.1.Completion :=
    fun w ↦ (hK w).toSMul
  let : ∀ w : AbsoluteValueExtension vK L,
      Algebra vK.Completion w.1.Completion :=
    fun w ↦ AbsoluteValue.completionAlgebra vK w.1 w.2
  apply (powerBasisBaseChange (A := vK.Completion) pb).algHom_ext
  funext w
  change
    completionTensorDecomposition_factorEquiv (K := K) (L := L) vK hvK
        (1 ⊗ₜ[K] (completionTensorDecomposition_powerBasis K L).gen) w =
      completionTensorMap_leftCanonicalHom (K := K) (L := L) vK
        (1 ⊗ₜ[K] (completionTensorDecomposition_powerBasis K L).gen) w
  rw [completionTensorDecomposition_factorEquiv_one_tmul_gen
      (K := K) (L := L) vK hvK w,
    completionTensorMap_leftCanonicalHom_tmul_apply]
  simp
 
theorem completionTensorDecomposition_leftCanonicalHom_bijective
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial) :
    letI : ∀ w : AbsoluteValueExtension vK L,
        Algebra vK.Completion w.1.Completion :=
      fun w ↦ AbsoluteValue.completionAlgebra vK w.1 w.2
    Function.Bijective
      (completionTensorMap_leftCanonicalHom (K := K) (L := L) vK) := by
  classical
  let : ∀ w : AbsoluteValueExtension vK L,
      Algebra vK.Completion w.1.Completion :=
    fun w ↦ AbsoluteValue.completionAlgebra vK w.1 w.2
  rw [← completionTensorDecomposition_factorEquiv_toAlgHom
    (K := K) (L := L) vK hvK]
  exact (completionTensorDecomposition_factorEquiv
    (K := K) (L := L) vK hvK).bijective
 

noncomputable def completionTensorDecomposition_left
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial) :
    letI : ∀ w : AbsoluteValueExtension vK L,
        Algebra vK.Completion w.1.Completion :=
      fun w ↦ AbsoluteValue.completionAlgebra vK w.1 w.2
    vK.Completion ⊗[K] L ≃ₐ[vK.Completion]
      ∀ w : AbsoluteValueExtension vK L, w.1.Completion := by
  letI : ∀ w : AbsoluteValueExtension vK L,
      Algebra vK.Completion w.1.Completion :=
    fun w ↦ AbsoluteValue.completionAlgebra vK w.1 w.2
  exact AlgEquiv.ofBijective
    (completionTensorMap_leftCanonicalHom (K := K) (L := L) vK)
    (completionTensorDecomposition_leftCanonicalHom_bijective
      (K := K) (L := L) vK hvK)
@[simp]
theorem completionTensorDecomposition_left_tmul_apply
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (b : vK.Completion) (a : L)
    (w : AbsoluteValueExtension vK L) :
    letI : ∀ w : AbsoluteValueExtension vK L,
        Algebra vK.Completion w.1.Completion :=
      fun w ↦ AbsoluteValue.completionAlgebra vK w.1 w.2
    completionTensorDecomposition_left (K := K) (L := L) vK hvK (b ⊗ₜ[K] a) w =
      algebraMap vK.Completion w.1.Completion b *
        AbsoluteValue.toCompletionAlgHom (K := K) w.1 a := by
  let : ∀ w : AbsoluteValueExtension vK L,
      Algebra vK.Completion w.1.Completion :=
    fun w ↦ AbsoluteValue.completionAlgebra vK w.1 w.2
  change completionTensorMap_leftCanonicalHom (K := K) (L := L) vK
    (b ⊗ₜ[K] a) w = _
  exact completionTensorMap_leftCanonicalHom_tmul_apply vK b a w
 

noncomputable def localTensorUnitsEquivCompletionProduct
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial) :
    letI : ∀ w' : AbsoluteValueExtension vK L,
        Algebra vK.Completion w'.1.Completion :=
      fun w' ↦ AbsoluteValue.completionAlgebra vK w'.1 w'.2
    (vK.Completion ⊗[K] L)ˣ ≃*
      (∀ w' : AbsoluteValueExtension vK L,
        w'.1.Completionˣ) := by
  letI : ∀ w' : AbsoluteValueExtension vK L,
      Algebra vK.Completion w'.1.Completion :=
    fun w' ↦ AbsoluteValue.completionAlgebra vK w'.1 w'.2
  exact
    (Units.mapEquiv
      (completionTensorDecomposition_left
        (K := K) (L := L) vK hvK).toMulEquiv).trans
      MulEquiv.piUnits
 

@[simp]
theorem localTensorUnitsEquivCompletionProduct_apply_coe
    {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (z : (vK.Completion ⊗[K] L)ˣ)
    (w' : AbsoluteValueExtension vK L) :
    letI : ∀ u : AbsoluteValueExtension vK L,
        Algebra vK.Completion u.1.Completion :=
      fun u ↦ AbsoluteValue.completionAlgebra vK u.1 u.2
    (((localTensorUnitsEquivCompletionProduct vK hvK z) w' :
        w'.1.Completionˣ) : w'.1.Completion) =
      completionTensorDecomposition_left (K := K) (L := L) vK hvK
        (z : vK.Completion ⊗[K] L) w' :=
  rfl
end Valuations
end AlgebraicNumberTheory
end
end

/- ClassFieldTheory.LocalClassFieldTheory.ClassFormation.LocalBlocks.Tensor -/
section
open scoped TensorProduct
noncomputable section
namespace LocalClassFieldTheory
open AlgebraicNumberTheory.Valuations
open HilbertRamification
open CyclicCohomology
universe u v
variable {K : Type u} {L : Type v}
    [Field K] [Field L] [Algebra K L]
    [FiniteDimensional K L]
    [IsGalois K L]
 

abbrev LocalTensorAlgebra (vK : AbsoluteValue K ℝ) :=
  vK.Completion ⊗[K] L
 
noncomputable def localTensorConjugation
    (vK : AbsoluteValue K ℝ) (σ : L ≃ₐ[K] L) :
    LocalTensorAlgebra (L := L) vK ≃ₐ[vK.Completion]
      LocalTensorAlgebra (L := L) vK := by
  let f :
      LocalTensorAlgebra (L := L) vK →ₐ[vK.Completion]
        LocalTensorAlgebra (L := L) vK :=
    Algebra.TensorProduct.map
      (AlgHom.id vK.Completion vK.Completion) σ.toAlgHom
  let g :
      LocalTensorAlgebra (L := L) vK →ₐ[vK.Completion]
        LocalTensorAlgebra (L := L) vK :=
    Algebra.TensorProduct.map
      (AlgHom.id vK.Completion vK.Completion) σ.symm.toAlgHom
  exact AlgEquiv.ofAlgHom f g
    (by ext x; simp [f, g])
    (by ext x; simp [f, g])
omit [FiniteDimensional K L] [IsGalois K L] in
@[simp]
theorem localTensorConjugation_tmul
    (vK : AbsoluteValue K ℝ) (σ : L ≃ₐ[K] L)
    (b : vK.Completion) (x : L) :
    localTensorConjugation vK σ (b ⊗ₜ[K] x) =
      b ⊗ₜ[K] σ x :=
  rfl
omit [FiniteDimensional K L] [IsGalois K L] in
theorem localTensorConjugation_one
    (vK : AbsoluteValue K ℝ)
    (z : LocalTensorAlgebra (L := L) vK) :
    localTensorConjugation vK (1 : L ≃ₐ[K] L) z = z := by
  induction z using TensorProduct.induction_on with
  | zero => simp
  | tmul b x => simp
  | add x y hx hy => simp [hx, hy]
omit [FiniteDimensional K L] [IsGalois K L] in
theorem localTensorConjugation_mul
    (vK : AbsoluteValue K ℝ) (σ τ : L ≃ₐ[K] L)
    (z : LocalTensorAlgebra (L := L) vK) :
    localTensorConjugation vK (σ * τ) z =
      localTensorConjugation vK σ
        (localTensorConjugation vK τ z) := by
  induction z using TensorProduct.induction_on with
  | zero => simp
  | tmul b x => simp
  | add x y hx hy => simp [hx, hy]
 

noncomputable abbrev localTensorUnitsAction
    (vK : AbsoluteValue K ℝ) :
    MulDistribMulAction
      (L ≃ₐ[K] L) (LocalTensorAlgebra (L := L) vK)ˣ where
  smul σ z :=
    Units.mapEquiv (localTensorConjugation vK σ).toMulEquiv z
  one_smul z := by
    apply Units.ext
    exact localTensorConjugation_one vK
      (z : LocalTensorAlgebra (L := L) vK)
  mul_smul σ τ z := by
    apply Units.ext
    exact localTensorConjugation_mul vK σ τ
      (z : LocalTensorAlgebra (L := L) vK)
  smul_mul σ x y := by
    apply Units.ext
    exact (localTensorConjugation vK σ).map_mul
      (x : LocalTensorAlgebra (L := L) vK)
      (y : LocalTensorAlgebra (L := L) vK)
  smul_one σ := by
    apply Units.ext
    exact (localTensorConjugation vK σ).map_one
 

noncomputable def conjugateWithAbsRingEquiv
    (w : AbsoluteValue L ℝ) (σ : L ≃ₐ[K] L) :
    WithAbs (absoluteValueConjugate w σ) ≃+* WithAbs w :=
  WithAbs.congr
    (absoluteValueConjugate w σ) w σ.toRingEquiv
omit [FiniteDimensional K L] [IsGalois K L] in
theorem conjugateWithAbsRingEquiv_isometry
    (w : AbsoluteValue L ℝ) (σ : L ≃ₐ[K] L) :
    Isometry (conjugateWithAbsRingEquiv w σ) := by
  apply AddMonoidHomClass.isometry_of_norm
  intro x
  rw [WithAbs.norm_eq_apply_ofAbs, WithAbs.norm_eq_apply_ofAbs]
  rfl
omit [FiniteDimensional K L] [IsGalois K L] in
theorem conjugateWithAbsRingEquiv_symm_isometry
    (w : AbsoluteValue L ℝ) (σ : L ≃ₐ[K] L) :
    Isometry (conjugateWithAbsRingEquiv w σ).symm := by
  apply AddMonoidHomClass.isometry_of_norm
  intro x
  rw [WithAbs.norm_eq_apply_ofAbs, WithAbs.norm_eq_apply_ofAbs]
  change w (σ (σ⁻¹ x.ofAbs)) = w x.ofAbs
  exact congrArg w (σ.apply_symm_apply x.ofAbs)
 

noncomputable def conjugateCompletionRingEquiv
    (w : AbsoluteValue L ℝ) (σ : L ≃ₐ[K] L) :
    (absoluteValueConjugate w σ).Completion ≃+*
      w.Completion :=
  UniformSpace.Completion.mapRingEquiv
    (conjugateWithAbsRingEquiv w σ)
    (conjugateWithAbsRingEquiv_isometry w σ).continuous
    (conjugateWithAbsRingEquiv_symm_isometry w σ).continuous
omit [FiniteDimensional K L] [IsGalois K L] in
@[simp]
theorem conjugateCompletionRingEquiv_toCompletion
    (w : AbsoluteValue L ℝ) (σ : L ≃ₐ[K] L) (x : L) :
    conjugateCompletionRingEquiv w σ
        (AbsoluteValue.toCompletion
          (absoluteValueConjugate w σ) x) =
      AbsoluteValue.toCompletion w (σ x) := by
  change
    UniformSpace.Completion.mapRingEquiv
        (conjugateWithAbsRingEquiv w σ)
        (conjugateWithAbsRingEquiv_isometry w σ).continuous
        (conjugateWithAbsRingEquiv_symm_isometry w σ).continuous
      (((WithAbs.equiv
        (absoluteValueConjugate w σ)).symm x :
          WithAbs (absoluteValueConjugate w σ)) :
        (absoluteValueConjugate w σ).Completion) = _
  rw [UniformSpace.Completion.mapRingEquiv_apply,
    UniformSpace.Completion.map_coe
      (conjugateWithAbsRingEquiv_isometry w σ).uniformContinuous]
  rfl
omit [FiniteDimensional K L] [IsGalois K L] in
 
theorem conjugateCompletionRingEquiv_completionMap
    (vK : AbsoluteValue K ℝ)
    (w : AbsoluteValueExtension vK L)
    (σ : L ≃ₐ[K] L) (b : vK.Completion) :
    conjugateCompletionRingEquiv w.1 σ
        (AbsoluteValue.completionMap vK
          (absoluteValueConjugate w.1 σ)
          (absoluteValueConjugate_extends vK w σ) b) =
      AbsoluteValue.completionMap vK w.1 w.2 b := by
  refine UniformSpace.Completion.ext'
    (UniformSpace.Completion.continuous_map.comp
      (AbsoluteValue.completionMap_isometry
        vK
        (absoluteValueConjugate w.1 σ)
        (absoluteValueConjugate_extends vK w σ)).continuous)
    (AbsoluteValue.completionMap_isometry
      vK w.1 w.2).continuous ?_ b
  intro x
  have hx : (x : vK.Completion) =
      algebraMap K vK.Completion (WithAbs.equiv vK x) := by
    rw [← AbsoluteValue.toCompletion_eq_algebraMap]
    simp
  rw [hx]
  simp only [Function.comp_apply]
  rw [AbsoluteValue.completionMap_coe,
    AbsoluteValue.completionMap_coe]
  change
    conjugateCompletionRingEquiv w.1 σ
        (AbsoluteValue.toCompletion
          (absoluteValueConjugate w.1 σ)
          (algebraMap K L (WithAbs.equiv vK x))) =
      AbsoluteValue.toCompletion w.1
        (algebraMap K L (WithAbs.equiv vK x))
  rw [conjugateCompletionRingEquiv_toCompletion, σ.commutes]
omit [FiniteDimensional K L] [IsGalois K L] in
theorem conjugateCompletionRingEquiv_algebraMap
    (vK : AbsoluteValue K ℝ)
    (w : AbsoluteValueExtension vK L)
    (σ : L ≃ₐ[K] L) (b : vK.Completion) :
    letI :
        Algebra vK.Completion
          (absoluteValueConjugate w.1 σ).Completion :=
      AbsoluteValue.completionAlgebra vK
        (absoluteValueConjugate w.1 σ)
        (absoluteValueConjugate_extends vK w σ)
    letI : Algebra vK.Completion w.1.Completion :=
      AbsoluteValue.completionAlgebra vK w.1 w.2
    conjugateCompletionRingEquiv w.1 σ
        (algebraMap vK.Completion
          (absoluteValueConjugate w.1 σ).Completion b) =
      algebraMap vK.Completion w.1.Completion b :=
  conjugateCompletionRingEquiv_completionMap vK w σ b
 


noncomputable def conjugateExtensionCompletionRingEquiv
    (vK : AbsoluteValue K ℝ)
    (w : AbsoluteValueExtension vK L)
    (σ : L ≃ₐ[K] L) :
    (absoluteValueExtensionConjugate vK w σ).1.Completion ≃+*
      w.1.Completion := by
  change
    (absoluteValueConjugate w.1 σ).Completion ≃+*
      w.1.Completion
  exact conjugateCompletionRingEquiv w.1 σ
omit [FiniteDimensional K L] [IsGalois K L] in
@[simp]
theorem conjugateExtensionCompletionRingEquiv_toCompletion
    (vK : AbsoluteValue K ℝ)
    (w : AbsoluteValueExtension vK L)
    (σ : L ≃ₐ[K] L) (x : L) :
    conjugateExtensionCompletionRingEquiv vK w σ
        (AbsoluteValue.toCompletion
          (absoluteValueExtensionConjugate vK w σ).1 x) =
      AbsoluteValue.toCompletion w.1 (σ x) := by
  change
    conjugateCompletionRingEquiv w.1 σ
        (AbsoluteValue.toCompletion
          (absoluteValueConjugate w.1 σ) x) =
      AbsoluteValue.toCompletion w.1 (σ x)
  exact conjugateCompletionRingEquiv_toCompletion w.1 σ x
omit [FiniteDimensional K L] [IsGalois K L] in
theorem conjugateExtensionCompletionRingEquiv_algebraMap
    (vK : AbsoluteValue K ℝ)
    (w : AbsoluteValueExtension vK L)
    (σ : L ≃ₐ[K] L) (b : vK.Completion) :
    letI :
        Algebra vK.Completion
          (absoluteValueExtensionConjugate vK w σ).1.Completion :=
      AbsoluteValue.completionAlgebra vK
        (absoluteValueExtensionConjugate vK w σ).1
        (absoluteValueExtensionConjugate vK w σ).2
    letI : Algebra vK.Completion w.1.Completion :=
      AbsoluteValue.completionAlgebra vK w.1 w.2
    conjugateExtensionCompletionRingEquiv vK w σ
        (algebraMap vK.Completion
          (absoluteValueExtensionConjugate vK w σ).1.Completion b) =
      algebraMap vK.Completion w.1.Completion b := by
  let _ :
      Algebra vK.Completion
        (absoluteValueConjugate w.1 σ).Completion :=
    AbsoluteValue.completionAlgebra vK
      (absoluteValueConjugate w.1 σ)
      (absoluteValueConjugate_extends vK w σ)
  let _ : Algebra vK.Completion w.1.Completion :=
    AbsoluteValue.completionAlgebra vK w.1 w.2
  change
    conjugateCompletionRingEquiv w.1 σ
        (algebraMap vK.Completion
          (absoluteValueConjugate w.1 σ).Completion b) =
      algebraMap vK.Completion w.1.Completion b
  exact conjugateCompletionRingEquiv_algebraMap vK w σ b
 


noncomputable def localTensorEvaluation
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (w : AbsoluteValueExtension vK L) :
    letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
    letI : SMul K w.1.Completion := hK.toSMul
    letI := AbsoluteValue.completionAlgebra vK w.1 w.2
    LocalTensorAlgebra (L := L) vK →ₐ[vK.Completion]
      LocalizedCompletion vK w := by
  letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  letI : SMul K w.1.Completion := hK.toSMul
  letI := AbsoluteValue.completionAlgebra vK w.1 w.2
  exact
    (localizedCompletionEquivCompletion vK hvK w).symm.toAlgHom.comp
      (absoluteValueExtension_localizationTensorHom vK w)
omit [IsGalois K L] in
@[simp]
theorem localTensorEvaluation_tmul
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (w : AbsoluteValueExtension vK L)
    (b : vK.Completion) (x : L) :
    letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
    letI : SMul K w.1.Completion := hK.toSMul
    letI := AbsoluteValue.completionAlgebra vK w.1 w.2
    localTensorEvaluation vK hvK w (b ⊗ₜ[K] x) =
      algebraMap vK.Completion (LocalizedCompletion vK w) b *
        AbsoluteValue.toAlgebraicLocalization
          vK w.1 w.2 x := by
  let hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  let _ : SMul K w.1.Completion := hK.toSMul
  let _ := AbsoluteValue.completionAlgebra vK w.1 w.2
  apply (localizedCompletionEquivCompletion vK hvK w).injective
  rw [map_mul]
  simp only [localTensorEvaluation, AlgHom.coe_comp, Function.comp_apply,
    absoluteValueExtension_localizationTensorHom_tmul]
  rfl
 



theorem localTensorEvaluation_conjugation_decomposition
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (w : AbsoluteValueExtension vK L)
    (h : absoluteValueDecompositionGroup K w.1)
    (g : L ≃ₐ[K] L)
    (z : LocalTensorAlgebra (L := L) vK) :
    letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
    letI : SMul K w.1.Completion := hK.toSMul
    letI := AbsoluteValue.completionAlgebra vK w.1 w.2
    localTensorEvaluation vK hvK w
        (localTensorConjugation vK (h.1 * g) z) =
      decompositionGroupEquivAlgebraicLocalizationAut
        vK hvK w h
        (localTensorEvaluation vK hvK w
          (localTensorConjugation vK g z)) := by
  let hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  let _ : SMul K w.1.Completion := hK.toSMul
  let _ := AbsoluteValue.completionAlgebra vK w.1 w.2
  induction z using TensorProduct.induction_on with
  | zero =>
      simp
  | add x y hx hy =>
      simpa only [map_add] using congrArg₂ (· + ·) hx hy
  | tmul b x =>
      rw [localTensorConjugation_tmul,
        localTensorConjugation_tmul,
        localTensorEvaluation_tmul,
        localTensorEvaluation_tmul,
        map_mul,
        (decompositionGroupEquivAlgebraicLocalizationAut
          vK hvK w h).commutes,
        localizationRamificationGroups_decompositionGroupEquiv_toLocalization]
      rfl
 


noncomputable def localTensorOrbitHom
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (w : AbsoluteValueExtension vK L) :
    letI :=
      decompositionGroupLocalUnitsAction vK hvK w
    letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
    letI : SMul K w.1.Completion := hK.toSMul
    letI := AbsoluteValue.completionAlgebra vK w.1 w.2
    (LocalTensorAlgebra (L := L) vK)ˣ →*
      LocalPlaceBlock vK hvK w := by
  letI :=
    decompositionGroupLocalUnitsAction vK hvK w
  letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  letI : SMul K w.1.Completion := hK.toSMul
  letI := AbsoluteValue.completionAlgebra vK w.1 w.2
  exact
    { toFun := fun z =>
        ⟨fun g =>
          Units.map
            (localTensorEvaluation vK hvK w).toMonoidHom
            (Units.map
              (localTensorConjugation vK g).toMonoidHom z),
          by
            intro h g
            apply Units.ext
            change
              localTensorEvaluation vK hvK w
                    (localTensorConjugation vK (h.1 * g)
                      (z : LocalTensorAlgebra (L := L) vK)) =
                decompositionGroupEquivAlgebraicLocalizationAut
                  vK hvK w h
                  (localTensorEvaluation vK hvK w
                    (localTensorConjugation vK g
                      (z : LocalTensorAlgebra (L := L) vK)))
            exact
              localTensorEvaluation_conjugation_decomposition
                vK hvK w h g z⟩
      map_one' := by
        apply Subtype.ext
        funext g
        apply Units.ext
        simp
      map_mul' := by
        intro x y
        apply Subtype.ext
        funext g
        apply Units.ext
        simp }
 

theorem localTensorOrbitHom_smul
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (w : AbsoluteValueExtension vK L)
    (τ : L ≃ₐ[K] L)
    (z : (LocalTensorAlgebra (L := L) vK)ˣ) :
    letI :=
      decompositionGroupLocalUnitsAction vK hvK w
    letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
    letI : SMul K w.1.Completion := hK.toSMul
    letI := AbsoluteValue.completionAlgebra vK w.1 w.2
    letI := localTensorUnitsAction (K := K) (L := L) vK
    localTensorOrbitHom vK hvK w (τ • z) =
      τ • localTensorOrbitHom vK hvK w z := by
  let _ :=
    decompositionGroupLocalUnitsAction vK hvK w
  let hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  let _ : SMul K w.1.Completion := hK.toSMul
  let _ := AbsoluteValue.completionAlgebra vK w.1 w.2
  let _ := localTensorUnitsAction (K := K) (L := L) vK
  apply Subtype.ext
  funext g
  apply Units.ext
  change
    localTensorEvaluation vK hvK w
        (localTensorConjugation vK g
          (localTensorConjugation vK τ
            (z : LocalTensorAlgebra (L := L) vK))) =
      localTensorEvaluation vK hvK w
        (localTensorConjugation vK (g * τ)
          (z : LocalTensorAlgebra (L := L) vK))
  rw [localTensorConjugation_mul]
 


theorem conjugateExtensionCompletionRingEquiv_completionTensorDecomposition_left
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (w : AbsoluteValueExtension vK L)
    (g : L ≃ₐ[K] L)
    (z : LocalTensorAlgebra (L := L) vK) :
    letI : ∀ w' : AbsoluteValueExtension vK L,
        Algebra vK.Completion w'.1.Completion :=
      fun w' ↦ AbsoluteValue.completionAlgebra vK w'.1 w'.2
    conjugateExtensionCompletionRingEquiv vK w g
        (completionTensorDecomposition_left (K := K) (L := L) vK hvK z
          (absoluteValueExtensionConjugate vK w g)) =
      absoluteValueExtension_localizationTensorHom vK w
        (localTensorConjugation vK g z) := by
  let _ : ∀ w' : AbsoluteValueExtension vK L,
      Algebra vK.Completion w'.1.Completion :=
    fun w' ↦ AbsoluteValue.completionAlgebra vK w'.1 w'.2
  induction z using TensorProduct.induction_on with
  | zero =>
      simp only [map_zero, Pi.zero_apply]
  | add x y hx hy =>
      simpa only [map_add, Pi.add_apply] using
        congrArg₂ (· + ·) hx hy
  | tmul b x =>
      rw [completionTensorDecomposition_left_tmul_apply,
        map_mul,
        conjugateExtensionCompletionRingEquiv_algebraMap]
      change
        algebraMap vK.Completion w.1.Completion b *
            conjugateExtensionCompletionRingEquiv vK w g
              (AbsoluteValue.toCompletion
                (absoluteValueExtensionConjugate vK w g).1 x) =
          absoluteValueExtension_localizationTensorHom vK w
            (localTensorConjugation vK g (b ⊗ₜ[K] x))
      rw [conjugateExtensionCompletionRingEquiv_toCompletion,
        localTensorConjugation_tmul,
        absoluteValueExtension_localizationTensorHom_tmul]
      change
        algebraMap vK.Completion w.1.Completion b *
            AbsoluteValue.toCompletion w.1 (g x) =
          algebraMap vK.Completion w.1.Completion b *
            AbsoluteValue.toCompletion w.1 (g x)
      rfl
section RightCosetCoordinates
universe uG uB
variable {G : Type uG} {B : Type uB}
    [Group G] [CommGroup B]
    (H : Subgroup G) [MulDistribMulAction H B]
 

abbrev InducedRightCosets :=
  Quotient (QuotientGroup.rightRel H)
 

noncomputable def rightCosetCoefficient (g : G) : H := by
  let q : InducedRightCosets H := Quotient.mk'' g
  refine ⟨g * (Quotient.out q)⁻¹, ?_⟩
  exact QuotientGroup.rightRel_apply.mp
    (Quotient.exact' (Quotient.out_eq' q))
@[simp]
theorem rightCosetCoefficient_mul_out (g : G) :
    (rightCosetCoefficient H g : G) *
        Quotient.out (Quotient.mk'' g :
          InducedRightCosets H) = g := by
  simp [rightCosetCoefficient]
theorem rightCoset_mk_mul_left
    (h : H) (g : G) :
    (Quotient.mk'' (h.1 * g) : InducedRightCosets H) =
      Quotient.mk'' g := by
  apply Quotient.sound'
  rw [QuotientGroup.rightRel_apply]
  simpa only [mul_inv_rev, mul_assoc, mul_inv_cancel_left,
    one_mul] using H.inv_mem h.2
theorem rightCosetCoefficient_mul_left
    (h : H) (g : G) :
    rightCosetCoefficient H (h.1 * g) =
      h * rightCosetCoefficient H g := by
  apply Subtype.ext
  simp only [rightCosetCoefficient, Subgroup.coe_mul]
  rw [rightCoset_mk_mul_left H h g]
  simp only [mul_assoc]
 


noncomputable def inducedRightCosetCoordinates :
    InducedModule (B := B) H ≃*
      (InducedRightCosets H → B) where
  toFun f q := f.1 (Quotient.out q)
  invFun b := ⟨fun g =>
      rightCosetCoefficient H g •
        b (Quotient.mk'' g), by
    intro h g
    change
      rightCosetCoefficient H (h.1 * g) •
          b (Quotient.mk'' (h.1 * g)) =
        h •
          (rightCosetCoefficient H g •
            b (Quotient.mk'' g))
    rw [rightCosetCoefficient_mul_left H h g,
      rightCoset_mk_mul_left H h g, mul_smul]⟩
  left_inv f := by
    apply Subtype.ext
    funext g
    change
      rightCosetCoefficient H g •
          f.1 (Quotient.out
            (Quotient.mk'' g : InducedRightCosets H)) =
        f.1 g
    calc
      rightCosetCoefficient H g •
          f.1 (Quotient.out
            (Quotient.mk'' g : InducedRightCosets H)) =
          f.1 ((rightCosetCoefficient H g : G) *
            Quotient.out
              (Quotient.mk'' g : InducedRightCosets H)) :=
        (f.2 (rightCosetCoefficient H g)
          (Quotient.out
            (Quotient.mk'' g : InducedRightCosets H))).symm
      _ = f.1 g := congrArg f.1
        (rightCosetCoefficient_mul_out H g)
  right_inv b := by
    funext q
    change
      rightCosetCoefficient H (Quotient.out q) •
          b (Quotient.mk'' (Quotient.out q)) =
        b q
    have hq :
        (Quotient.mk'' (Quotient.out q) :
          InducedRightCosets H) = q :=
      Quotient.out_eq' q
    rw [hq]
    have hc :
        rightCosetCoefficient H (Quotient.out q) = 1 := by
      apply Subtype.ext
      simp [rightCosetCoefficient, hq]
    rw [hc, one_smul]
  map_mul' f g := by
    funext q
    rfl
end RightCosetCoordinates
section ExtensionOrbit
variable (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (w : AbsoluteValueExtension vK L)
 

noncomputable def rightCosetExtension
    (q : InducedRightCosets
      (absoluteValueDecompositionGroup K w.1)) :
    AbsoluteValueExtension vK L :=
  absoluteValueExtensionConjugate vK w (Quotient.out q)
omit [FiniteDimensional K L] [IsGalois K L] in
include hvK in
theorem rightCosetExtension_eq_of_mk
    (g : (L ≃ₐ[K] L)) :
    rightCosetExtension vK w
        (Quotient.mk'' g : InducedRightCosets
          (absoluteValueDecompositionGroup K w.1)) =
      absoluteValueExtensionConjugate vK w g := by
  let q : InducedRightCosets
      (absoluteValueDecompositionGroup K w.1) := Quotient.mk'' g
  let h : absoluteValueDecompositionGroup K w.1 :=
    rightCosetCoefficient (absoluteValueDecompositionGroup K w.1) g
  have hfix :
      absoluteValueExtensionConjugate vK w h.1 = w :=
    (mem_absoluteValueDecompositionGroup_iff_extensionConjugate_eq
      vK hvK w h.1).mp h.2
  have hg :
      h.1 * Quotient.out q = g :=
    rightCosetCoefficient_mul_out
      (absoluteValueDecompositionGroup K w.1) g
  apply Subtype.ext
  ext x
  change w.1 (Quotient.out q x) = w.1 (g x)
  rw [← hg]
  change w.1 (Quotient.out q x) =
    w.1 (h.1 (Quotient.out q x))
  have hp :
      w.1 (h.1 (Quotient.out q x)) =
        w.1 (Quotient.out q x) := by
    have hp' := congrArg
      (fun z : AbsoluteValueExtension vK L =>
        z.1 (Quotient.out q x)) hfix
    change
      w.1 (h.1 (Quotient.out q x)) =
        w.1 (Quotient.out q x) at hp'
    exact hp'
  exact hp.symm
 

noncomputable def rightCosetExtensionEquiv :
    InducedRightCosets (absoluteValueDecompositionGroup K w.1) ≃
      AbsoluteValueExtension vK L := by
  apply Equiv.ofBijective (rightCosetExtension vK w)
  constructor
  · intro q r hqr
    have hmem :
        Quotient.out r * (Quotient.out q)⁻¹ ∈
          absoluteValueDecompositionGroup K w.1 := by
      rw [mem_absoluteValueDecompositionGroup_iff_extensionConjugate_eq
        vK hvK w]
      apply Subtype.ext
      ext x
      change
        w.1 (Quotient.out r ((Quotient.out q)⁻¹ x)) =
          w.1 x
      have hp :
          w.1 (Quotient.out q ((Quotient.out q)⁻¹ x)) =
            w.1 (Quotient.out r ((Quotient.out q)⁻¹ x)) := by
        have hp' := congrArg
          (fun z : AbsoluteValueExtension vK L =>
            z.1 ((Quotient.out q)⁻¹ x)) hqr
        change
          w.1 (Quotient.out q ((Quotient.out q)⁻¹ x)) =
            w.1 (Quotient.out r ((Quotient.out q)⁻¹ x))
          at hp'
        exact hp'
      simpa using hp.symm
    have hout :
        (Quotient.mk'' (Quotient.out q) :
          InducedRightCosets
            (absoluteValueDecompositionGroup K w.1)) =
          Quotient.mk'' (Quotient.out r) := by
      apply Quotient.sound'
      exact QuotientGroup.rightRel_apply.mpr hmem
    calc
      q = Quotient.mk'' (Quotient.out q) :=
        (Quotient.out_eq' q).symm
      _ = Quotient.mk'' (Quotient.out r) := hout
      _ = r := Quotient.out_eq' r
  · intro w'
    obtain ⟨g, hg⟩ := absoluteValueConjugacy vK hvK w w'
    refine ⟨Quotient.mk'' g, ?_⟩
    exact (rightCosetExtension_eq_of_mk vK hvK w g).trans hg.symm
end ExtensionOrbit
section ProductEquivalences
variable (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (w : AbsoluteValueExtension vK L)
 

noncomputable def completionProductReindexRightCosets :
    (∀ w' : AbsoluteValueExtension vK L, w'.1.Completionˣ) ≃*
      (∀ q : InducedRightCosets
          (absoluteValueDecompositionGroup K w.1),
        ((rightCosetExtensionEquiv vK hvK w q).1.Completion)ˣ) := by
  let e :=
    Equiv.piCongrLeft'
      (fun w' : AbsoluteValueExtension vK L =>
        w'.1.Completionˣ)
      (rightCosetExtensionEquiv vK hvK w).symm
  exact
    { e with
      map_mul' := by
        intro x y
        funext q
        rfl }
 

noncomputable def rightCosetCompletionUnitsEquiv
    (q : InducedRightCosets
      (absoluteValueDecompositionGroup K w.1)) :
    ((rightCosetExtensionEquiv vK hvK w q).1.Completion)ˣ ≃*
      w.1.Completionˣ := by
  exact Units.mapEquiv
    (conjugateExtensionCompletionRingEquiv
      vK w (Quotient.out q)).toMulEquiv
 

noncomputable def completionProductUnitsEquivRightCosets :
    letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
    letI : SMul K w.1.Completion := hK.toSMul
    letI := AbsoluteValue.completionAlgebra vK w.1 w.2
    (∀ w' : AbsoluteValueExtension vK L, w'.1.Completionˣ) ≃*
      (InducedRightCosets
          (absoluteValueDecompositionGroup K w.1) →
        (LocalizedCompletion vK w)ˣ) := by
  letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  letI : SMul K w.1.Completion := hK.toSMul
  letI := AbsoluteValue.completionAlgebra vK w.1 w.2
  exact
    (completionProductReindexRightCosets vK hvK w).trans
      ((MulEquiv.piCongrRight fun q : InducedRightCosets
          (absoluteValueDecompositionGroup K w.1) =>
        rightCosetCompletionUnitsEquiv vK hvK w q).trans
        (MulEquiv.piCongrRight fun _ : InducedRightCosets
            (absoluteValueDecompositionGroup K w.1) =>
          (Units.mapEquiv
            (localizedCompletionEquivCompletion
              vK hvK w).toMulEquiv).symm))
@[simp]
theorem completionProductUnitsEquivRightCosets_apply_coe
    (p : ∀ w' : AbsoluteValueExtension vK L,
      w'.1.Completionˣ)
    (q : InducedRightCosets
      (absoluteValueDecompositionGroup K w.1)) :
    letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
    letI : SMul K w.1.Completion := hK.toSMul
    letI := AbsoluteValue.completionAlgebra vK w.1 w.2
    ((completionProductUnitsEquivRightCosets vK hvK w p q :
        (LocalizedCompletion vK w)ˣ) :
      LocalizedCompletion vK w) =
      (localizedCompletionEquivCompletion vK hvK w).symm
        (conjugateExtensionCompletionRingEquiv
          vK w (Quotient.out q)
          ((p (rightCosetExtensionEquiv vK hvK w q) :
              (rightCosetExtensionEquiv vK hvK w q).1.Completionˣ) :
            (rightCosetExtensionEquiv vK hvK w q).1.Completion)) := by
  rfl
 


noncomputable def completionProductUnitsEquivLocalPlaceBlock :
    letI :=
      decompositionGroupLocalUnitsAction vK hvK w
    letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
    letI : SMul K w.1.Completion := hK.toSMul
    letI := AbsoluteValue.completionAlgebra vK w.1 w.2
    (∀ w' : AbsoluteValueExtension vK L, w'.1.Completionˣ) ≃*
      LocalPlaceBlock vK hvK w := by
  letI :=
    decompositionGroupLocalUnitsAction vK hvK w
  letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  letI : SMul K w.1.Completion := hK.toSMul
  letI := AbsoluteValue.completionAlgebra vK w.1 w.2
  exact
    (completionProductUnitsEquivRightCosets vK hvK w).trans
      (inducedRightCosetCoordinates
        (absoluteValueDecompositionGroup K w.1)).symm
 


noncomputable def localTensorUnitsEquivLocalPlaceBlock :
    letI :=
      decompositionGroupLocalUnitsAction vK hvK w
    letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
    letI : SMul K w.1.Completion := hK.toSMul
    letI := AbsoluteValue.completionAlgebra vK w.1 w.2
    letI : ∀ w' : AbsoluteValueExtension vK L,
        Algebra vK.Completion w'.1.Completion :=
      fun w' ↦ AbsoluteValue.completionAlgebra vK w'.1 w'.2
    (LocalTensorAlgebra (L := L) vK)ˣ ≃*
      LocalPlaceBlock vK hvK w := by
  letI :=
    decompositionGroupLocalUnitsAction vK hvK w
  letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  letI : SMul K w.1.Completion := hK.toSMul
  letI := AbsoluteValue.completionAlgebra vK w.1 w.2
  letI : ∀ w' : AbsoluteValueExtension vK L,
      Algebra vK.Completion w'.1.Completion :=
    fun w' ↦ AbsoluteValue.completionAlgebra vK w'.1 w'.2
  exact
    (localTensorUnitsEquivCompletionProduct vK hvK).trans
      (completionProductUnitsEquivLocalPlaceBlock vK hvK w)
 

theorem localTensorUnitsEquivLocalPlaceBlock_apply_out_coe
    (z : (LocalTensorAlgebra (L := L) vK)ˣ)
    (q : InducedRightCosets
      (absoluteValueDecompositionGroup K w.1)) :
    letI :=
      decompositionGroupLocalUnitsAction vK hvK w
    letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
    letI : SMul K w.1.Completion := hK.toSMul
    letI := AbsoluteValue.completionAlgebra vK w.1 w.2
    letI : ∀ w' : AbsoluteValueExtension vK L,
        Algebra vK.Completion w'.1.Completion :=
      fun w' ↦ AbsoluteValue.completionAlgebra vK w'.1 w'.2
    (((localTensorUnitsEquivLocalPlaceBlock vK hvK w z).1
        (Quotient.out q) :
          (LocalizedCompletion vK w)ˣ) :
      LocalizedCompletion vK w) =
      localTensorEvaluation vK hvK w
        (localTensorConjugation vK (Quotient.out q)
          (z : LocalTensorAlgebra (L := L) vK)) := by
  let _ :=
    decompositionGroupLocalUnitsAction vK hvK w
  let hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  let _ : SMul K w.1.Completion := hK.toSMul
  let _ := AbsoluteValue.completionAlgebra vK w.1 w.2
  let _ : ∀ w' : AbsoluteValueExtension vK L,
      Algebra vK.Completion w'.1.Completion :=
    fun w' ↦ AbsoluteValue.completionAlgebra vK w'.1 w'.2
  have hcoord :
      inducedRightCosetCoordinates
          (absoluteValueDecompositionGroup K w.1)
          (localTensorUnitsEquivLocalPlaceBlock vK hvK w z) q =
        completionProductUnitsEquivRightCosets vK hvK w
          (localTensorUnitsEquivCompletionProduct vK hvK z) q := by
    change
      inducedRightCosetCoordinates
          (absoluteValueDecompositionGroup K w.1)
          ((inducedRightCosetCoordinates
            (absoluteValueDecompositionGroup K w.1)).symm
            (completionProductUnitsEquivRightCosets vK hvK w
              (localTensorUnitsEquivCompletionProduct vK hvK z))) q =
        completionProductUnitsEquivRightCosets vK hvK w
          (localTensorUnitsEquivCompletionProduct vK hvK z) q
    rw [MulEquiv.apply_symm_apply]
  have hval := congrArg
    (fun u : (LocalizedCompletion vK w)ˣ =>
      (u : LocalizedCompletion vK w)) hcoord
  change
    (((localTensorUnitsEquivLocalPlaceBlock vK hvK w z).1
        (Quotient.out q) :
          (LocalizedCompletion vK w)ˣ) :
      LocalizedCompletion vK w) =
      ((completionProductUnitsEquivRightCosets vK hvK w
          (localTensorUnitsEquivCompletionProduct vK hvK z) q :
            (LocalizedCompletion vK w)ˣ) :
        LocalizedCompletion vK w) at hval
  rw [hval,
    completionProductUnitsEquivRightCosets_apply_coe,
    localTensorUnitsEquivCompletionProduct_apply_coe]
  change
    (localizedCompletionEquivCompletion vK hvK w).symm
        (conjugateExtensionCompletionRingEquiv
          vK w (Quotient.out q)
          (completionTensorDecomposition_left (K := K) (L := L) vK hvK
            (z : LocalTensorAlgebra (L := L) vK)
            (absoluteValueExtensionConjugate
              vK w (Quotient.out q)))) =
      localTensorEvaluation vK hvK w
        (localTensorConjugation vK (Quotient.out q)
          (z : LocalTensorAlgebra (L := L) vK))
  rw [conjugateExtensionCompletionRingEquiv_completionTensorDecomposition_left]
  rfl
 

theorem localTensorUnitsEquivLocalPlaceBlock_eq_orbitHom_apply
    (z : (LocalTensorAlgebra (L := L) vK)ˣ) :
    letI :=
      decompositionGroupLocalUnitsAction vK hvK w
    letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
    letI : SMul K w.1.Completion := hK.toSMul
    letI := AbsoluteValue.completionAlgebra vK w.1 w.2
    letI : ∀ w' : AbsoluteValueExtension vK L,
        Algebra vK.Completion w'.1.Completion :=
      fun w' ↦ AbsoluteValue.completionAlgebra vK w'.1 w'.2
    localTensorUnitsEquivLocalPlaceBlock vK hvK w z =
      localTensorOrbitHom vK hvK w z := by
  let _ :=
    decompositionGroupLocalUnitsAction vK hvK w
  let hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  let _ : SMul K w.1.Completion := hK.toSMul
  let _ := AbsoluteValue.completionAlgebra vK w.1 w.2
  let _ : ∀ w' : AbsoluteValueExtension vK L,
      Algebra vK.Completion w'.1.Completion :=
    fun w' ↦ AbsoluteValue.completionAlgebra vK w'.1 w'.2
  apply
    (inducedRightCosetCoordinates
      (absoluteValueDecompositionGroup K w.1)).injective
  funext q
  apply Units.ext
  change
    (((localTensorUnitsEquivLocalPlaceBlock vK hvK w z).1
        (Quotient.out q) :
          (LocalizedCompletion vK w)ˣ) :
      LocalizedCompletion vK w) =
      localTensorEvaluation vK hvK w
        (localTensorConjugation vK (Quotient.out q)
          (z : LocalTensorAlgebra (L := L) vK))
  exact
    localTensorUnitsEquivLocalPlaceBlock_apply_out_coe
      vK hvK w z q
 


theorem localTensorUnitsEquivLocalPlaceBlock_smul
    (τ : L ≃ₐ[K] L)
    (z : (LocalTensorAlgebra (L := L) vK)ˣ) :
    letI :=
      decompositionGroupLocalUnitsAction vK hvK w
    letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
    letI : SMul K w.1.Completion := hK.toSMul
    letI := AbsoluteValue.completionAlgebra vK w.1 w.2
    letI : ∀ w' : AbsoluteValueExtension vK L,
        Algebra vK.Completion w'.1.Completion :=
      fun w' ↦ AbsoluteValue.completionAlgebra vK w'.1 w'.2
    letI := localTensorUnitsAction (K := K) (L := L) vK
    localTensorUnitsEquivLocalPlaceBlock vK hvK w (τ • z) =
      τ • localTensorUnitsEquivLocalPlaceBlock vK hvK w z := by
  let _ :=
    decompositionGroupLocalUnitsAction vK hvK w
  let hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  let _ : SMul K w.1.Completion := hK.toSMul
  let _ := AbsoluteValue.completionAlgebra vK w.1 w.2
  let _ : ∀ w' : AbsoluteValueExtension vK L,
      Algebra vK.Completion w'.1.Completion :=
    fun w' ↦ AbsoluteValue.completionAlgebra vK w'.1 w'.2
  let _ := localTensorUnitsAction (K := K) (L := L) vK
  rw [localTensorUnitsEquivLocalPlaceBlock_eq_orbitHom_apply,
    localTensorUnitsEquivLocalPlaceBlock_eq_orbitHom_apply]
  exact localTensorOrbitHom_smul vK hvK w τ z
end ProductEquivalences
end LocalClassFieldTheory
end
end

/- GaloisCohomology.Cyclic.TateH0.Invariants -/
section
namespace CyclicCohomology
noncomputable section
 
def unitsInvariantSubmodule (K L : Type) [Field K] [Field L] [Algebra K L] :
    Submodule ℤ (Additive Lˣ) :=
  (Rep.ofAlgebraAutOnUnits K L).ρ.invariants
private noncomputable def invariantUnitToBaseUnit (K L : Type)
    [Field K] [Field L] [Algebra K L] [IsGalois K L] [FiniteDimensional K L]
    (x : unitsInvariantSubmodule K L) : Kˣ := by
  classical
  let y : Lˣ := Additive.toMul (x : Additive Lˣ)
  have hfixed : ∀ σ : Gal(L/K), σ (y : L) = (y : L) := by
    intro σ
    have h :=
      congrArg (fun z : Additive Lˣ => ((Additive.toMul z : Lˣ) : L)) (x.property σ)
    have hρ :
        (Rep.ofAlgebraAutOnUnits K L).ρ σ (x : Additive Lˣ) =
          Additive.ofMul
            (Units.mapEquiv σ.toMulEquiv (Additive.toMul (x : Additive Lˣ))) :=
      rfl
    rw [hρ] at h
    simpa [y] using h
  have hmem : (y : L) ∈ Set.range (algebraMap K L) :=
    (IsGalois.mem_range_algebraMap_iff_fixed (F := K) (E := L) (y : L)).2 hfixed
  let a : K := Classical.choose hmem
  have ha : algebraMap K L a = (y : L) := Classical.choose_spec hmem
  have ha0 : a ≠ 0 := by
    intro hzero
    exact y.ne_zero (by rw [← ha, hzero, map_zero])
  exact ⟨a, a⁻¹, by simp [ha0], by simp [ha0]⟩
private lemma invariantUnitToBaseUnit_spec (K L : Type)
    [Field K] [Field L] [Algebra K L] [IsGalois K L] [FiniteDimensional K L]
    (x : unitsInvariantSubmodule K L) :
    algebraMap K L (invariantUnitToBaseUnit K L x : K) =
      ((Additive.toMul (x : Additive Lˣ) : Lˣ) : L) := by
  classical
  let y : Lˣ := Additive.toMul (x : Additive Lˣ)
  have hfixed : ∀ σ : Gal(L/K), σ (y : L) = (y : L) := by
    intro σ
    have h :=
      congrArg (fun z : Additive Lˣ => ((Additive.toMul z : Lˣ) : L)) (x.property σ)
    have hρ :
        (Rep.ofAlgebraAutOnUnits K L).ρ σ (x : Additive Lˣ) =
          Additive.ofMul
            (Units.mapEquiv σ.toMulEquiv (Additive.toMul (x : Additive Lˣ))) :=
      rfl
    rw [hρ] at h
    simpa [y] using h
  have hmem : (y : L) ∈ Set.range (algebraMap K L) :=
    (IsGalois.mem_range_algebraMap_iff_fixed (F := K) (E := L) (y : L)).2 hfixed
  change algebraMap K L (Classical.choose hmem) = (y : L)
  exact Classical.choose_spec hmem
private noncomputable def baseUnitToInvariantUnit (K L : Type)
    [Field K] [Field L] [Algebra K L] (x : Kˣ) : unitsInvariantSubmodule K L where
  val := Additive.ofMul (Units.map (algebraMap K L).toMonoidHom x)
  property := by
    intro σ
    change
      Additive.ofMul
          (Units.mapEquiv σ.toMulEquiv (Units.map (algebraMap K L).toMonoidHom x)) =
        Additive.ofMul (Units.map (algebraMap K L).toMonoidHom x)
    apply Additive.ofMul.injective
    ext
    simp
private lemma invariantUnitToBaseUnit_baseUnitToInvariantUnit (K L : Type)
    [Field K] [Field L] [Algebra K L] [IsGalois K L] [FiniteDimensional K L]
    (x : Kˣ) :
    invariantUnitToBaseUnit K L (baseUnitToInvariantUnit K L x) = x := by
  ext
  apply FaithfulSMul.algebraMap_injective K L
  rw [invariantUnitToBaseUnit_spec]
  rfl
private lemma baseUnitToInvariantUnit_invariantUnitToBaseUnit (K L : Type)
    [Field K] [Field L] [Algebra K L] [IsGalois K L] [FiniteDimensional K L]
    (x : unitsInvariantSubmodule K L) :
    baseUnitToInvariantUnit K L (invariantUnitToBaseUnit K L x) = x := by
  apply Subtype.ext
  apply Additive.ofMul.injective
  ext
  exact invariantUnitToBaseUnit_spec K L x
 
noncomputable def invariantsUnitsAddEquivBaseUnits (K L : Type)
    [Field K] [Field L] [Algebra K L] [IsGalois K L] [FiniteDimensional K L] :
    unitsInvariantSubmodule K L ≃+ Additive Kˣ where
  toFun := fun x => Additive.ofMul (invariantUnitToBaseUnit K L x)
  invFun := fun x => baseUnitToInvariantUnit K L (Additive.toMul x)
  left_inv := baseUnitToInvariantUnit_invariantUnitToBaseUnit K L
  right_inv := by
    intro x
    apply Additive.ofMul.injective
    exact invariantUnitToBaseUnit_baseUnitToInvariantUnit K L (Additive.toMul x)
  map_add' := by
    intro x y
    apply Additive.ofMul.injective
    change
      invariantUnitToBaseUnit K L (x + y) =
        invariantUnitToBaseUnit K L x * invariantUnitToBaseUnit K L y
    ext
    apply FaithfulSMul.algebraMap_injective K L
    change
      algebraMap K L (invariantUnitToBaseUnit K L (x + y) : K) =
        algebraMap K L
          ((invariantUnitToBaseUnit K L x : K) *
            (invariantUnitToBaseUnit K L y : K))
    rw [map_mul, invariantUnitToBaseUnit_spec,
      invariantUnitToBaseUnit_spec, invariantUnitToBaseUnit_spec]
    rfl
 
noncomputable def invariantsUnitsEquivBaseUnits (K L : Type)
    [Field K] [Field L] [Algebra K L] [IsGalois K L] [FiniteDimensional K L] :
    unitsInvariantSubmodule K L ≃ₗ[ℤ] Additive Kˣ :=
  (invariantsUnitsAddEquivBaseUnits K L).toIntLinearEquiv
 

lemma invariantsUnitsAddEquivBaseUnits_spec (K L : Type)
    [Field K] [Field L] [Algebra K L] [IsGalois K L] [FiniteDimensional K L]
    (x : unitsInvariantSubmodule K L) :
    algebraMap K L
        ((Additive.toMul (invariantsUnitsAddEquivBaseUnits K L x) : Kˣ) : K) =
      ((Additive.toMul (x : Additive Lˣ) : Lˣ) : L) := by
  exact invariantUnitToBaseUnit_spec K L x
end
end CyclicCohomology
end

/- ValuedFieldTheory.LocalField.NormUnits -/
section
namespace LocalFieldTheory
noncomputable section
universe u v w
variable (K : Type u) (L : Type v)
variable [Field K] [Field L] [Algebra K L]
 
def normUnits : Lˣ →* Kˣ :=
  Units.map (Algebra.norm K)
end
end LocalFieldTheory
end

/- ValuedFieldTheory.LocalField.NonarchimedeanLocalField.NormQuotient -/
section
namespace LocalFieldTheory
noncomputable section
universe u v
 
def localNormSubgroup (K L : Type u) [Field K] [Field L] [Algebra K L] : Subgroup Kˣ :=
  (normUnits K L).range
 
def NormQuotient (K L : Type u) [Field K] [Field L] [Algebra K L] : Type u :=
  Kˣ ⧸ localNormSubgroup K L
 
instance normQuotientCommGroup (K L : Type u) [Field K] [Field L] [Algebra K L] :
    CommGroup (NormQuotient K L) := by
  change CommGroup (Kˣ ⧸ localNormSubgroup K L)
  infer_instance
 


def normQuotientConcreteEquiv
    (K L : Type u) [Field K] [Field L] [Algebra K L] :
    NormQuotient K L ≃* Kˣ ⧸ localNormSubgroup K L := by
  change (Kˣ ⧸ localNormSubgroup K L) ≃* Kˣ ⧸ localNormSubgroup K L
  exact MulEquiv.refl _
 
def normClass (K L : Type u) [Field K] [Field L] [Algebra K L] :
    Kˣ →* NormQuotient K L := by
  change Kˣ →* Kˣ ⧸ localNormSubgroup K L
  let N := localNormSubgroup K L
  exact QuotientGroup.mk' N
 

def normQuotientLift {K L : Type u} {M : Type v} [Field K] [Field L] [Algebra K L]
    [Group M] (f : Kˣ →* M) (h : localNormSubgroup K L ≤ f.ker) :
    NormQuotient K L →* M := by
  change (Kˣ ⧸ localNormSubgroup K L) →* M
  let N := localNormSubgroup K L
  exact QuotientGroup.lift N f h
 

@[simp]
theorem normQuotientLift_normClass {K L : Type u} {M : Type v} [Field K] [Field L]
    [Algebra K L] [Group M] (f : Kˣ →* M)
    (h : localNormSubgroup K L ≤ f.ker) (x : Kˣ) :
    normQuotientLift f h (normClass K L x) = f x := by
  rfl
 
def normQuotientEquivOfSurjective
    {K L : Type u} {M : Type v} [Field K] [Field L] [Algebra K L]
    [Group M] (f : Kˣ →* M) (hf : Function.Surjective f)
    (hker : f.ker = localNormSubgroup K L) : NormQuotient K L ≃* M := by
  change (Kˣ ⧸ localNormSubgroup K L) ≃* M
  exact (QuotientGroup.quotientMulEquivOfEq hker.symm).trans
    (QuotientGroup.quotientKerEquivOfSurjective f hf)
 

protected theorem NormQuotient.inductionOn {K L : Type u} [Field K] [Field L]
    [Algebra K L] {motive : NormQuotient K L → Prop}
    (q : NormQuotient K L)
    (h : ∀ x : Kˣ, motive (normClass K L x)) : motive q := by
  change motive (show Kˣ ⧸ localNormSubgroup K L from q)
  refine QuotientGroup.induction_on q ?_
  intro x
  exact h x
 
theorem mk_normUnits_eq_one (K L : Type u) [Field K] [Field L] [Algebra K L] (x : Lˣ) :
    normClass K L (normUnits K L x) = 1 := by
  exact (QuotientGroup.eq_one_iff (normUnits K L x)).2 ⟨x, rfl⟩
 
theorem normClass_eq_one_iff (K L : Type u) [Field K] [Field L]
    [Algebra K L] (x : Kˣ) :
    normClass K L x = 1 ↔ ∃ y : Lˣ, normUnits K L y = x := by
  rw [← MonoidHom.mem_range]
  exact QuotientGroup.eq_one_iff x
end
end LocalFieldTheory
end

/- GaloisCohomology.Cyclic.TateH0.NormImage -/
section
namespace CyclicCohomology
open LocalFieldTheory
open CategoryTheory
noncomputable section
universe u
 
def unitsNormLinearMap (K L : Type) [Field K] [Field L] [Algebra K L]
    [Fintype Gal(L/K)] : Additive Lˣ →ₗ[ℤ] Additive Lˣ :=
  (Rep.ofAlgebraAutOnUnits K L).norm.hom.toLinearMap
 
lemma unitsNorm_mem_invariants (K L : Type) [Field K] [Field L] [Algebra K L]
    [Fintype Gal(L/K)] (x : Additive Lˣ) :
    unitsNormLinearMap K L x ∈ unitsInvariantSubmodule K L := by
  intro σ
  exact Representation.self_norm_apply (Rep.ofAlgebraAutOnUnits K L).ρ σ x
 
def unitsNormToInvariantsLinearMap (K L : Type) [Field K] [Field L] [Algebra K L]
    [Fintype Gal(L/K)] : Additive Lˣ →ₗ[ℤ] unitsInvariantSubmodule K L :=
  (unitsNormLinearMap K L).codRestrict (unitsInvariantSubmodule K L)
    (unitsNorm_mem_invariants K L)
 
def unitsTateH0NormSubmodule (K L : Type) [Field K] [Field L] [Algebra K L]
    [Fintype Gal(L/K)] : Submodule ℤ (unitsInvariantSubmodule K L) :=
  LinearMap.range (unitsNormToInvariantsLinearMap K L)
 

def tateUnitsH0IsoInvariantsQuotient (K L : Type)
    [Field K] [Field L] [Algebra K L] [Fintype Gal(L/K)] :
    tateCohomology (Rep.ofAlgebraAutOnUnits K L) 0 ≅
      ModuleCat.of ℤ
        (unitsInvariantSubmodule K L ⧸ unitsTateH0NormSubmodule K L) := by
  let A := Rep.ofAlgebraAutOnUnits K L
  let S : ShortComplex (ModuleCat ℤ) :=
    .mk A.norm.toModuleCatHom (groupCohomology.d₀₁ A)
      (Rep.norm_comp_d_eq_zero A)
  have hker :
      LinearMap.ker S.g.hom = unitsInvariantSubmodule K L := by
    exact groupCohomology.d₀₁_ker_eq_invariants A
  let eK : LinearMap.ker S.g.hom ≃ₗ[ℤ] unitsInvariantSubmodule K L :=
    LinearEquiv.ofEq _ _ hker
  have hboundary :
      (LinearMap.range S.moduleCatToCycles).map eK.toLinearMap =
        unitsTateH0NormSubmodule K L := by
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
  let eQ :
      S.moduleCatLeftHomologyData.H ≅
        ModuleCat.of ℤ
          (unitsInvariantSubmodule K L ⧸ unitsTateH0NormSubmodule K L) :=
    (Submodule.Quotient.equiv _ _ eK hboundary).toModuleIso
  exact TateCohomology.isoZeroBoundary A ≪≫
    S.moduleCatHomologyIso ≪≫ eQ
 
theorem unitsNormLinearMap_apply_val (K L : Type) [Field K] [Field L] [Algebra K L]
    [FiniteDimensional K L] [IsGalois K L] (x : Lˣ) :
    (letI := AlgEquiv.fintype K L
     (Additive.toMul (unitsNormLinearMap K L (Additive.ofMul x)) : Lˣ).1) =
      algebraMap K L (Algebra.norm K (x : L)) := by
  let := AlgEquiv.fintype K L
  dsimp only [unitsNormLinearMap]
  change ((Additive.toMul
    ((Rep.ofAlgebraAutOnUnits K L).norm.hom (Additive.ofMul x)) : Lˣ).1) =
      algebraMap K L (Algebra.norm K (x : L))
  rw [← groupCohomology.norm_ofAlgebraAutOnUnits_eq (K := K) (L := L) x]
  rfl
 
@[simp]
lemma additive_toMul_finset_sum_units {ι : Type*} (L : Type*) [Field L]
    (s : Finset ι) (f : ι → Additive Lˣ) :
    Additive.toMul (Finset.sum s f) =
      Finset.prod s (fun i => Additive.toMul (f i)) := by
  classical
  refine Finset.induction_on s ?h0 ?hstep
  · simp
  · intro a s ha hs
    simp [Finset.sum_insert, Finset.prod_insert, ha, hs]
 
def additiveNormSubgroup (K L : Type u) [Field K] [Field L] [Algebra K L] :
    AddSubgroup (Additive Kˣ) :=
  (localNormSubgroup K L).toAddSubgroup
 
lemma additiveNormSubgroup_eq_ker_quotient_map (K L : Type u)
    [Field K] [Field L] [Algebra K L] :
    additiveNormSubgroup K L =
      (MonoidHom.toAdditive (normClass K L)).ker := by
  ext x
  change Additive.toMul x ∈ localNormSubgroup K L ↔
    Additive.ofMul (normClass K L (Additive.toMul x)) = 0
  constructor
  · intro hx
    exact congrArg Additive.ofMul
      ((normClass_eq_one_iff K L (Additive.toMul x)).mpr
        (MonoidHom.mem_range.mp hx))
  · intro hx
    exact MonoidHom.mem_range.mpr
      ((normClass_eq_one_iff K L (Additive.toMul x)).mp
        (Additive.ofMul.injective hx))
 
lemma invariantsUnitsAddEquivBaseUnits_unitsNorm_apply (K L : Type)
    [Field K] [Field L] [Algebra K L] [FiniteDimensional K L] [IsGalois K L]
    (x : Lˣ) :
    (letI := AlgEquiv.fintype K L
     invariantsUnitsAddEquivBaseUnits K L
        (unitsNormToInvariantsLinearMap K L (Additive.ofMul x))) =
      Additive.ofMul (normUnits K L x) := by
  let := AlgEquiv.fintype K L
  apply Additive.toMul.injective
  ext
  apply FaithfulSMul.algebraMap_injective K L
  rw [invariantsUnitsAddEquivBaseUnits_spec]
  exact (unitsNormLinearMap_apply_val K L x).trans (by rfl)
 
lemma invariantsUnitsAddEquivBaseUnits_map_tateNormSubgroup (K L : Type)
    [Field K] [Field L] [Algebra K L] [FiniteDimensional K L] [IsGalois K L] :
    (letI := AlgEquiv.fintype K L
     (unitsTateH0NormSubmodule K L).toAddSubgroup.map
        (invariantsUnitsAddEquivBaseUnits K L).toAddMonoidHom) =
      additiveNormSubgroup K L := by
  let := AlgEquiv.fintype K L
  ext y
  constructor
  · rintro ⟨x, hx, rfl⟩
    rcases hx with ⟨z, rfl⟩
    change Additive.toMul
        (invariantsUnitsAddEquivBaseUnits K L
          (unitsNormToInvariantsLinearMap K L z)) ∈ localNormSubgroup K L
    let a : Lˣ := Additive.toMul z
    rw [show z = Additive.ofMul a by cases z; rfl]
    have hmap :=
      congrArg Additive.toMul
        (invariantsUnitsAddEquivBaseUnits_unitsNorm_apply K L a)
    rw [hmap]
    exact ⟨a, rfl⟩
  · intro hy
    change Additive.toMul y ∈ localNormSubgroup K L at hy
    rcases hy with ⟨x, hx⟩
    refine ⟨unitsNormToInvariantsLinearMap K L (Additive.ofMul x), ⟨Additive.ofMul x, rfl⟩, ?_⟩
    change
      invariantsUnitsAddEquivBaseUnits K L
          (unitsNormToInvariantsLinearMap K L (Additive.ofMul x)) = y
    calc
      invariantsUnitsAddEquivBaseUnits K L
          (unitsNormToInvariantsLinearMap K L (Additive.ofMul x))
          = Additive.ofMul (normUnits K L x) :=
            invariantsUnitsAddEquivBaseUnits_unitsNorm_apply K L x
      _ = Additive.ofMul (Additive.toMul y) := congrArg Additive.ofMul hx
      _ = y := by cases y; rfl
 
lemma invariantsUnitsEquivBaseUnits_map_tateNormSubmodule (K L : Type)
    [Field K] [Field L] [Algebra K L] [FiniteDimensional K L] [IsGalois K L] :
    (letI := AlgEquiv.fintype K L
     (unitsTateH0NormSubmodule K L).map
        (invariantsUnitsEquivBaseUnits K L : unitsInvariantSubmodule K L →ₗ[ℤ] Additive Kˣ)) =
      (additiveNormSubgroup K L).toIntSubmodule := by
  let := AlgEquiv.fintype K L
  apply Submodule.toAddSubgroup_injective
  rw [Submodule.map_toAddSubgroup]
  exact invariantsUnitsAddEquivBaseUnits_map_tateNormSubgroup K L
end
end CyclicCohomology
end

/- GaloisCohomology.Cyclic.TateH0.Main -/
section
namespace CyclicCohomology
open LocalFieldTheory
noncomputable section
 


def H0TateUnitsIsoNormQuotient (K L : Type)
    [Field K] [Field L] [Algebra K L] [FiniteDimensional K L] [IsGalois K L] :
    CategoryTheory.Iso (tateCohomology (Rep.ofAlgebraAutOnUnits K L) 0)
      (ModuleCat.of Int (Additive (NormQuotient K L))) := by
  letI := AlgEquiv.fintype K L
  let eInv :
      (unitsInvariantSubmodule K L ⧸ unitsTateH0NormSubmodule K L) ≃ₗ[Int]
        (Additive Kˣ ⧸ (additiveNormSubgroup K L).toIntSubmodule) :=
    Submodule.Quotient.equiv
      (unitsTateH0NormSubmodule K L)
      ((additiveNormSubgroup K L).toIntSubmodule)
      (invariantsUnitsEquivBaseUnits K L)
      (invariantsUnitsEquivBaseUnits_map_tateNormSubmodule K L)
  let eNorm :
      (Additive Kˣ ⧸ (additiveNormSubgroup K L).toIntSubmodule) ≃+
        Additive (NormQuotient K L) :=
    (QuotientAddGroup.quotientAddEquivOfEq
        (additiveNormSubgroup_eq_ker_quotient_map K L)).trans
      (QuotientAddGroup.quotientKerEquivOfSurjective
        (MonoidHom.toAdditive (normClass K L)) (by
          change Function.Surjective
            (QuotientGroup.mk' (localNormSubgroup K L))
          exact QuotientGroup.mk'_surjective _))
  exact tateUnitsH0IsoInvariantsQuotient K L ≪≫
    eInv.toModuleIso ≪≫ eNorm.toIntLinearEquiv.toModuleIso
end
end CyclicCohomology
end

/- ValuedFieldTheory.LocalField.NonarchimedeanLocalField.ValuedTopology -/
section
noncomputable section
namespace LocalFieldTheory
open scoped ValuativeRel
universe u v
 

theorem isValuativeTopology_of_valued_ofValuation
    (F : Type u) (Γ : Type v)
    [Field F] [LinearOrderedCommGroupWithZero Γ]
    [MulArchimedean Γ] [Valued F Γ]
    [Valuation.IsNontrivial (Valued.v : Valuation F Γ)] :
    letI := ValuativeRel.ofValuation (Valued.v : Valuation F Γ)
    IsValuativeTopology F := by
  let v : Valuation F Γ := Valued.v
  let : ValuativeRel F := ValuativeRel.ofValuation v
  let : v.Compatible := Valuation.Compatible.ofValuation v
  let : ValuativeRel.IsNontrivial F :=
    (ValuativeRel.isNontrivial_iff_isNontrivial v).2 inferInstance
  apply IsValuativeTopology.of_zero
  intro s
  rw [Valued.mem_nhds_zero]
  constructor
  · rintro ⟨δ, hδ⟩
    refine
      ⟨δ.mapEquiv
          (ValuativeRel.ValueGroupWithZero.orderMonoidIso v).symm, ?_⟩
    intro z hz
    apply hδ
    exact
      (ValuativeRel.valuation_lt_symm_orderMonoidIso
        v (δ : MonoidWithZeroHom.ValueGroup₀ (.ofClass v)) z).1
        (by simpa using hz)
  · rintro ⟨γ, hγ⟩
    refine
      ⟨γ.mapEquiv
          (ValuativeRel.ValueGroupWithZero.orderMonoidIso v), ?_⟩
    intro z hz
    apply hγ
    have hz' :
        v.restrict z <
          (ValuativeRel.ValueGroupWithZero.orderMonoidIso v)
            (γ : ValuativeRel.ValueGroupWithZero F) := by
      exact hz
    exact
      (ValuativeRel.restrict_lt_orderMonoidIso
        v (γ : ValuativeRel.ValueGroupWithZero F) z).1 hz'
end LocalFieldTheory
end
end

/- ClassFieldTheory.LocalClassFieldTheory.ClassFormation.CohomologyBridge -/
section
namespace LocalClassFieldTheory
open CyclicCohomology
noncomputable section
open scoped BigOperators
open CyclicCohomology.ProfiniteCohomology.Herbrand
open CategoryTheory
variable (K L : Type) [Field K] [Field L] [Algebra K L]
 

theorem unitsNormLinearMap_toMul_eq_tateNorm
    [Fintype (Gal(L / K))] (x : Lˣ) :
    Additive.toMul (unitsNormLinearMap K L (Additive.ofMul x)) =
      tateNorm (Gal(L / K)) Lˣ x := by
  have hnorm :
      unitsNormLinearMap K L (Additive.ofMul x) =
        ∑ σ : Gal(L / K), (Rep.ofAlgebraAutOnUnits K L).ρ σ (Additive.ofMul x) := by
    exact LinearMap.sum_apply Finset.univ
      (fun σ : Gal(L / K) => (Rep.ofAlgebraAutOnUnits K L).ρ σ)
      (Additive.ofMul x : Additive Lˣ)
  rw [hnorm]
  calc
    (Additive.toMul
        ((∑ σ : Gal(L / K), (Rep.ofAlgebraAutOnUnits K L).ρ σ (Additive.ofMul x)) :
          Additive Lˣ) : Lˣ) =
        ∏ σ : Gal(L / K),
          (Additive.toMul
            ((Rep.ofAlgebraAutOnUnits K L).ρ σ (Additive.ofMul x) : Additive Lˣ) : Lˣ) := by
      simpa only using additive_toMul_finset_sum_units L Finset.univ
        (fun σ : Gal(L / K) => (Rep.ofAlgebraAutOnUnits K L).ρ σ (Additive.ofMul x))
    _ = tateNorm (Gal(L / K)) Lˣ x := by
      rfl
 

def additiveFixedUnitsEquivInvariants :
    Additive (fixedSubgroup (Gal(L / K)) Lˣ) ≃+
      unitsInvariantSubmodule K L where
  toFun x := ⟨Additive.ofMul ((Additive.toMul x : fixedSubgroup (Gal(L / K)) Lˣ) : Lˣ), by
    intro σ
    exact congrArg Additive.ofMul ((Additive.toMul x).property σ)⟩
  invFun x := Additive.ofMul ⟨Additive.toMul (x : Additive Lˣ), by
    intro σ
    exact Additive.ofMul.injective (x.property σ)⟩
  left_inv x := rfl
  right_inv x := rfl
  map_add' x y := rfl
 




private def additiveEquivToQuotientHom
    {A M : Type} [AddCommGroup A] [AddCommGroup M]
    (e : A ≃+ M) (N : Submodule ℤ M) : A →+ M ⧸ N :=
  N.mkQ.toAddMonoidHom.comp e.toAddMonoidHom
 

private def additiveHomToMultiplicativeHom
    {G B : Type} [Group G] [AddCommGroup B]
    (f : Additive G →+ B) : G →* Multiplicative B :=
  AddMonoidHom.toMultiplicativeRight f
 



private def multiplicativeQuotientGroup
    {M : Type} [AddCommGroup M] (N : Submodule ℤ M) :
    Group (Multiplicative (M ⧸ N)) :=
  Multiplicative.group
 

private def kernelOfAdditiveQuotientHom
    {G M : Type} [Group G] [AddCommGroup M]
    (N : Submodule ℤ M) (f : G →* Multiplicative (M ⧸ N)) : Subgroup G :=
  @MonoidHom.ker G inferInstance (Multiplicative (M ⧸ N))
    (multiplicativeQuotientGroup N).toMulOneClass f
 

private def quotientMulEquivOfSurjectiveAdditiveQuotient
    {G M : Type} [CommGroup G] [AddCommGroup M]
    (N : Submodule ℤ M) (S : Subgroup G)
    (f : G →* Multiplicative (M ⧸ N))
    (hker : kernelOfAdditiveQuotientHom N f = S)
    (hsurj : Function.Surjective f) :
    G ⧸ S ≃* Multiplicative (M ⧸ N) := by
  letI : Group (Multiplicative (M ⧸ N)) := multiplicativeQuotientGroup N
  exact
    (QuotientGroup.quotientMulEquivOfEq hker.symm).trans
      (QuotientGroup.quotientKerEquivOfSurjective f hsurj)
 
def additiveFixedUnitToInvariantsNormQuotientHom
    [Fintype (Gal(L / K))] :
    Additive (fixedSubgroup (Gal(L / K)) Lˣ) →+
      (unitsInvariantSubmodule K L ⧸ unitsTateH0NormSubmodule K L) :=
  additiveEquivToQuotientHom (additiveFixedUnitsEquivInvariants K L)
    (unitsTateH0NormSubmodule K L)
 
def fixedUnitToInvariantsNormQuotientMonoidHom
    [Fintype (Gal(L / K))] :
    fixedSubgroup (Gal(L / K)) Lˣ →*
      Multiplicative
        (unitsInvariantSubmodule K L ⧸ unitsTateH0NormSubmodule K L) :=
  additiveHomToMultiplicativeHom
    (additiveFixedUnitToInvariantsNormQuotientHom K L)
 

theorem fixedUnitToInvariantsNormQuotientMonoidHom_ker
    [Fintype (Gal(L / K))] :
    kernelOfAdditiveQuotientHom (unitsTateH0NormSubmodule K L)
        (fixedUnitToInvariantsNormQuotientMonoidHom K L) =
      (tateNormSubgroup (Gal(L / K)) Lˣ).subgroupOf
        (fixedSubgroup (Gal(L / K)) Lˣ) := by
  ext x
  constructor
  · intro hx
    have hx0 := congrArg Multiplicative.toAdd hx
    change
      (unitsTateH0NormSubmodule K L).mkQ
        (additiveFixedUnitsEquivInvariants K L (Additive.ofMul x)) = 0 at hx0
    have hxmem :
        additiveFixedUnitsEquivInvariants K L (Additive.ofMul x) ∈
          unitsTateH0NormSubmodule K L :=
      (Submodule.Quotient.mk_eq_zero (unitsTateH0NormSubmodule K L)).1 hx0
    rcases hxmem with ⟨y, hy⟩
    change (x : Lˣ) ∈ tateNormSubgroup (Gal(L / K)) Lˣ
    refine ⟨Additive.toMul y, ?_⟩
    have hy' := congrArg
      (fun z : unitsInvariantSubmodule K L =>
        Additive.toMul (z : Additive Lˣ)) hy
    change Additive.toMul (unitsNormLinearMap K L y) = (x : Lˣ) at hy'
    rw [tateNormHom_apply,
      ← unitsNormLinearMap_toMul_eq_tateNorm K L (Additive.toMul y)]
    simpa using hy'
  · intro hx
    change (x : Lˣ) ∈ tateNormSubgroup (Gal(L / K)) Lˣ at hx
    rcases hx with ⟨y, hy⟩
    apply Multiplicative.toAdd.injective
    change
      (unitsTateH0NormSubmodule K L).mkQ
        (additiveFixedUnitsEquivInvariants K L (Additive.ofMul x)) = 0
    apply (Submodule.Quotient.mk_eq_zero (unitsTateH0NormSubmodule K L)).2
    change additiveFixedUnitsEquivInvariants K L (Additive.ofMul x) ∈
      LinearMap.range (unitsNormToInvariantsLinearMap K L)
    refine ⟨Additive.ofMul y, ?_⟩
    apply Subtype.ext
    apply Additive.toMul.injective
    change Additive.toMul
      (unitsNormLinearMap K L (Additive.ofMul y)) = (x : Lˣ)
    rw [unitsNormLinearMap_toMul_eq_tateNorm K L y]
    exact hy
 
theorem fixedUnitToInvariantsNormQuotientMonoidHom_surjective
    [Fintype (Gal(L / K))] :
    Function.Surjective (fixedUnitToInvariantsNormQuotientMonoidHom K L) := by
  intro q
  rcases Submodule.mkQ_surjective (unitsTateH0NormSubmodule K L)
      (Multiplicative.toAdd q) with ⟨z, hz⟩
  let x : fixedSubgroup (Gal(L / K)) Lˣ :=
    Additive.toMul ((additiveFixedUnitsEquivInvariants K L).symm z)
  refine ⟨x, ?_⟩
  apply Multiplicative.toAdd.injective
  change
    (unitsTateH0NormSubmodule K L).mkQ
      (additiveFixedUnitsEquivInvariants K L (Additive.ofMul x)) =
        Multiplicative.toAdd q
  calc
    _ = (unitsTateH0NormSubmodule K L).mkQ z := by
      apply congrArg (unitsTateH0NormSubmodule K L).mkQ
      change additiveFixedUnitsEquivInvariants K L
        ((additiveFixedUnitsEquivInvariants K L).symm z) = z
      exact (additiveFixedUnitsEquivInvariants K L).apply_symm_apply z
    _ = Multiplicative.toAdd q := hz
 
def herbrandH0MulEquivInvariantsNormQuotient
    [Fintype (Gal(L / K))] :=
  quotientMulEquivOfSurjectiveAdditiveQuotient
    (unitsTateH0NormSubmodule K L)
    ((tateNormSubgroup (Gal(L / K)) Lˣ).subgroupOf
      (fixedSubgroup (Gal(L / K)) Lˣ))
    (fixedUnitToInvariantsNormQuotientMonoidHom K L)
    (fixedUnitToInvariantsNormQuotientMonoidHom_ker K L)
    (fixedUnitToInvariantsNormQuotientMonoidHom_surjective K L)
end
end LocalClassFieldTheory
end

/- ClassFieldTheory.LocalClassFieldTheory.ClassFormation.Valuation -/
section
namespace LocalClassFieldTheory
open LocalFieldTheory
noncomputable section
universe u
open scoped ValuativeRel
open IsNonarchimedeanLocalField
 


def galoisGroupFieldUnitsMulDistribMulAction
    (K L : Type u) [Field K] [Field L] [Algebra K L] :
    MulDistribMulAction (Gal(L / K)) Lˣ where
  smul σ x := Units.mapEquiv σ.toMulEquiv x
  one_smul := by
    intro x
    ext
    rfl
  mul_smul := by
    intro σ τ x
    ext
    rfl
  smul_mul := by
    intro σ x y
    exact map_mul (Units.mapEquiv σ.toMulEquiv) x y
  smul_one := by
    intro σ
    exact map_one (Units.mapEquiv σ.toMulEquiv)
end
end LocalClassFieldTheory
end

/- ValuedFieldTheory.Ramification.HilbertRamification.DecompositionFieldLocalization -/
section
noncomputable section
universe u v
namespace HilbertRamification
open AlgebraicNumberTheory.Valuations
variable {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
section LocalizationGalois
variable [IsGalois K L]
variable (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
  (w : AbsoluteValueExtension vK L)
local instance proposition98CompletionBaseSMul : SMul K w.1.Completion :=
  (AbsoluteValue.extensionCompletionAlgebra (K := K) w.1).toSMul
local instance proposition98CompletionAlgebra : Algebra vK.Completion w.1.Completion :=
  AbsoluteValue.completionAlgebra vK w.1 w.2
private abbrev localization : IntermediateField vK.Completion w.1.Completion :=
  AbsoluteValue.algebraicLocalization vK w.1 w.2
private abbrev toLocalization : L →+* localization vK w :=
  AbsoluteValue.toAlgebraicLocalization vK w.1 w.2
local instance proposition98LocalizationBaseAlgebra : Algebra K (localization vK w) :=
  ((algebraMap vK.Completion (localization vK w)).comp
    (algebraMap K vK.Completion)).toAlgebra
local instance proposition98LocalizationScalarTower :
    IsScalarTower K vK.Completion (localization vK w) :=
  IsScalarTower.of_algebraMap_eq' (by
    ext x
    rfl)
 

def decompositionField_toLocalizationAlgHom :
    L →ₐ[K] localization vK w where
  __ := toLocalization vK w
  commutes' x := AbsoluteValue.toAlgebraicLocalization_algebraMap vK w.1 w.2 x
omit [IsGalois K L] in
 

theorem decompositionField_localization_adjoin_range_eq_top :
    IntermediateField.adjoin vK.Completion
      (Set.range (toLocalization vK w)) = ⊤ := by
  let E := localization vK w
  apply IntermediateField.lift_injective E
  rw [IntermediateField.lift_adjoin, IntermediateField.lift_top]
  change IntermediateField.adjoin vK.Completion
      (Subtype.val '' Set.range (toLocalization vK w)) =
    AbsoluteValue.algebraicLocalization vK w.1 w.2
  congr 1
  ext z
  constructor
  · rintro ⟨_, ⟨x, rfl⟩, rfl⟩
    exact ⟨x, rfl⟩
  · rintro ⟨x, rfl⟩
    exact ⟨toLocalization vK w x, ⟨x, rfl⟩, rfl⟩
omit hvK in
 
theorem decompositionField_toLocalization_isSeparable (x : L) :
    IsSeparable vK.Completion (toLocalization vK w x) := by
  have hx : IsSeparable K
      (decompositionField_toLocalizationAlgHom vK w x) :=
    (Algebra.IsSeparable.isSeparable K x).map
      (decompositionField_toLocalizationAlgHom vK w)
      (decompositionField_toLocalizationAlgHom vK w).injective
  exact IsSeparable.tower_top vK.Completion hx
omit hvK in
 

theorem decompositionField_toLocalization_minpoly_splits (x : L) :
    ((minpoly vK.Completion (toLocalization vK w x)).map
      (algebraMap vK.Completion (localization vK w))).Splits := by
  let i := decompositionField_toLocalizationAlgHom vK w
  have hxint : IsIntegral K x := Algebra.IsIntegral.isIntegral x
  have hsK : ((minpoly K x).map
      (algebraMap K (localization vK w))).Splits := by
    have hi : i.toRingHom.comp (algebraMap K L) =
        algebraMap K (localization vK w) := i.comp_algebraMap
    have hs := (Normal.splits (F := K) (K := L) inferInstance x).map
      i.toRingHom
    simpa only [Polynomial.map_map, hi] using hs
  have hsTower : (((minpoly K x).map (algebraMap K vK.Completion)).map
      (algebraMap vK.Completion (localization vK w))).Splits := by
    simpa only [Polynomial.map_map,
      IsScalarTower.algebraMap_eq K vK.Completion (localization vK w)] using hsK
  have hdvd : minpoly vK.Completion (toLocalization vK w x) ∣
      (minpoly K x).map (algebraMap K vK.Completion) := by
    have h := minpoly.dvd_map_of_isScalarTower K vK.Completion
      (toLocalization vK w x)
    have hmin : minpoly K (toLocalization vK w x) = minpoly K x :=
      minpoly.algHom_eq i i.injective x
    rwa [hmin] at h
  exact hsTower.of_dvd
    (Polynomial.map_ne_zero
      (Polynomial.map_ne_zero (minpoly.ne_zero hxint)))
    ((Polynomial.map_dvd_map' _).mpr hdvd)
omit hvK in
 

theorem decompositionField_localization_normal :
    Normal vK.Completion (localization vK w) := by
  let : Algebra.IsAlgebraic vK.Completion (localization vK w) :=
    AbsoluteValue.algebraicLocalization_isAlgebraic vK w.1 w.2
  rw [normal_iff]
  intro z
  refine ⟨Algebra.IsIntegral.isIntegral z, ?_⟩
  apply IntermediateField.splits_of_mem_adjoin
      (F := vK.Completion) (K := localization vK w)
      (L := localization vK w)
      (S := Set.range (toLocalization vK w))
  · intro y hy
    rcases hy with ⟨x, rfl⟩
    exact ⟨(decompositionField_toLocalization_isSeparable vK w x).isIntegral,
      decompositionField_toLocalization_minpoly_splits vK w x⟩
  · rw [decompositionField_localization_adjoin_range_eq_top vK w]
    trivial
omit hvK in
 

theorem decompositionField_localization_separable :
    Algebra.IsSeparable vK.Completion (localization vK w) := by
  let S := Set.range (toLocalization vK w)
  have hS : Algebra.IsSeparable vK.Completion
      (IntermediateField.adjoin vK.Completion S) :=
    (IntermediateField.isSeparable_adjoin_iff_isSeparable
      (F := vK.Completion) (E := localization vK w)).mpr fun y hy => by
      rcases hy with ⟨x, rfl⟩
      exact decompositionField_toLocalization_isSeparable vK w x
  let : Algebra.IsSeparable vK.Completion
      (IntermediateField.adjoin vK.Completion S) := hS
  refine ⟨fun z => ?_⟩
  have hz : z ∈ IntermediateField.adjoin vK.Completion S := by
    rw [decompositionField_localization_adjoin_range_eq_top vK w]
    trivial
  exact IntermediateField.isSeparable_of_mem_isSeparable vK.Completion
    (localization vK w) hz
omit hvK in
 

theorem algebraicLocalization_isGalois :
    IsGalois vK.Completion (localization vK w) :=
  isGalois_iff.mpr
    ⟨decompositionField_localization_separable vK w,
      decompositionField_localization_normal vK w⟩
include hvK
omit hvK
include hvK
omit hvK
include hvK
omit hvK
end LocalizationGalois
end HilbertRamification
end
end

/- ClassFieldTheory.LocalClassFieldTheory.ClassFormation.LocalizedCompletionCohomology.CompMulEquiv -/
section
open AlgebraicNumberTheory.Valuations
open HilbertRamification
open LocalClassFieldTheory
open LocalFieldTheory
open CyclicCohomology
open CyclicCohomology.ProfiniteCohomology.Herbrand
open scoped TensorProduct
noncomputable section
namespace LocalClassFieldTheory
universe uH uG uA
variable {H : Type uH} {G : Type uG} {A : Type uA}
    [Group H] [Fintype H] [Group G] [Fintype G]
    [CommGroup A] [MulDistribMulAction G A]
theorem tateNorm_compMulEquiv (e : H ≃* G) (a : A) :
    letI := MulDistribMulAction.compHom A e.toMonoidHom
    tateNorm H A a = tateNorm G A a := by
  let := MulDistribMulAction.compHom A e.toMonoidHom
  change (∏ h : H, e h • a) = ∏ g : G, g • a
  exact e.toEquiv.prod_comp fun g ↦ g • a
 
noncomputable def fixedSubgroupCompMulEquiv (e : H ≃* G) :
    letI := MulDistribMulAction.compHom A e.toMonoidHom
    fixedSubgroup H A ≃* fixedSubgroup G A := by
  letI := MulDistribMulAction.compHom A e.toMonoidHom
  exact
    { toFun := fun x ↦ ⟨x.1, fun g ↦ by
          have hx := x.2 (e.symm g)
          change e (e.symm g) • x.1 = x.1 at hx
          simpa using hx⟩
      invFun := fun x ↦ ⟨x.1, fun h ↦ x.2 (e h)⟩
      left_inv := fun _ ↦ rfl
      right_inv := fun _ ↦ rfl
      map_mul' := fun _ _ ↦ rfl }
 

noncomputable def herbrandH0CompMulEquiv (e : H ≃* G) :
    letI := MulDistribMulAction.compHom A e.toMonoidHom
    HerbrandH0 H A ≃* HerbrandH0 G A := by
  letI := MulDistribMulAction.compHom A e.toMonoidHom
  let f := fixedSubgroupCompMulEquiv (A := A) e
  let N :=
    (tateNormSubgroup H A).subgroupOf (fixedSubgroup H A)
  let M :=
    (tateNormSubgroup G A).subgroupOf (fixedSubgroup G A)
  exact quotientMulEquivOfSplit N M
    f.toMonoidHom f.symm.toMonoidHom
    (fun y ↦ f.apply_symm_apply y)
    (fun x hx ↦ by
      rw [Subgroup.mem_subgroupOf] at hx ⊢
      rcases hx with ⟨a, ha⟩
      refine ⟨a, ?_⟩
      change tateNorm G A a = x.1
      rw [← tateNorm_compMulEquiv e]
      exact ha)
    (fun y hy ↦ by
      rw [Subgroup.mem_subgroupOf] at hy ⊢
      rcases hy with ⟨a, ha⟩
      refine ⟨a, ?_⟩
      change tateNorm H A a = y.1
      rw [tateNorm_compMulEquiv e]
      exact ha)
    (fun x hx ↦ by
      have hx1 : x = 1 := by
        apply f.injective
        simpa [f] using hx
      rw [hx1]
      exact N.one_mem)
end LocalClassFieldTheory
end
end

/- ClassFieldTheory.LocalClassFieldTheory.ClassFormation.LocalizedCompletionCohomology.Algebra -/
section
open AlgebraicNumberTheory.Valuations
open HilbertRamification
open LocalClassFieldTheory
open LocalFieldTheory
open CyclicCohomology
open CyclicCohomology.ProfiniteCohomology.Herbrand
open scoped TensorProduct
noncomputable section
namespace LocalClassFieldTheory
universe u v
variable {K : Type u} {L : Type v}
    [Field K] [Field L] [Algebra K L]
 


noncomputable abbrev localizedCompletionBaseAlgebra
    (vK : AbsoluteValue K ℝ)
    (w : AbsoluteValueExtension vK L) :
    Algebra vK.Completion (LocalizedCompletion vK w) := by
  letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
  letI : SMul K w.1.Completion := hK.toSMul
  letI : Algebra vK.Completion w.1.Completion :=
    AbsoluteValue.completionAlgebra vK w.1 w.2
  exact inferInstance
 

theorem localizedCompletionFiniteDimensional
    [FiniteDimensional K L]
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (w : AbsoluteValueExtension vK L) :
    letI : Algebra vK.Completion (LocalizedCompletion vK w) :=
      localizedCompletionBaseAlgebra vK w
    FiniteDimensional vK.Completion (LocalizedCompletion vK w) := by
  let _ := localizedCompletionBaseAlgebra vK w
  exact localizedCompletionModuleFinite vK hvK w
 

theorem localizedCompletionIsGalois
    [IsGalois K L]
    (vK : AbsoluteValue K ℝ)
    (w : AbsoluteValueExtension vK L) :
    letI : Algebra vK.Completion (LocalizedCompletion vK w) :=
      localizedCompletionBaseAlgebra vK w
    IsGalois vK.Completion (LocalizedCompletion vK w) := by
  let _ := localizedCompletionBaseAlgebra vK w
  exact HilbertRamification.algebraicLocalization_isGalois vK w
 

noncomputable abbrev localizedCompletionGlobalAlgebra
    (vK : AbsoluteValue K ℝ)
    (w : AbsoluteValueExtension vK L) :
    letI : Algebra vK.Completion (LocalizedCompletion vK w) :=
      localizedCompletionBaseAlgebra vK w
    Algebra K (LocalizedCompletion vK w) := by
  letI : Algebra vK.Completion (LocalizedCompletion vK w) :=
    localizedCompletionBaseAlgebra vK w
  exact
    ((algebraMap vK.Completion
        (LocalizedCompletion vK w)).comp
      (algebraMap K vK.Completion)).toAlgebra
theorem localizedCompletionIsScalarTower
    (vK : AbsoluteValue K ℝ)
    (w : AbsoluteValueExtension vK L) :
    letI : Algebra vK.Completion (LocalizedCompletion vK w) :=
      localizedCompletionBaseAlgebra vK w
    letI := localizedCompletionGlobalAlgebra vK w
    IsScalarTower K vK.Completion
      (LocalizedCompletion vK w) := by
  let _ : Algebra vK.Completion (LocalizedCompletion vK w) :=
    localizedCompletionBaseAlgebra vK w
  let _ := localizedCompletionGlobalAlgebra vK w
  exact IsScalarTower.of_algebraMap_eq' rfl
variable [IsGalois K L]
end LocalClassFieldTheory
end
end

/- ClassFieldTheory.LocalClassFieldTheory.ClassFormation.LocalizedCompletionCohomology.Generator -/
section
open AlgebraicNumberTheory.Valuations
open HilbertRamification
open LocalClassFieldTheory
open LocalFieldTheory
open CyclicCohomology
open CyclicCohomology.ProfiniteCohomology.Herbrand
open scoped TensorProduct
noncomputable section
namespace LocalClassFieldTheory
universe u v
variable {K : Type u} {L : Type v}
    [Field K] [Field L] [Algebra K L]
    [IsGalois K L] [FiniteDimensional K L]
 

noncomputable abbrev localizedCompletionDecompositionGroupFintype
    (vK : AbsoluteValue K ℝ)
    (w : AbsoluteValueExtension vK L) :
    Fintype (absoluteValueDecompositionGroup K w.1) :=
  Fintype.ofFinite _
 

noncomputable def localizedCompletionGaloisGenerator
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (w : AbsoluteValueExtension vK L)
    (σ : L ≃ₐ[K] L)
    (hgen : ∀ τ : L ≃ₐ[K] L,
      τ ∈ Subgroup.zpowers σ) :
    letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
    letI : SMul K w.1.Completion := hK.toSMul
    letI : Algebra vK.Completion w.1.Completion :=
      AbsoluteValue.completionAlgebra vK w.1 w.2
    LocalizedCompletion vK w ≃ₐ[vK.Completion]
      LocalizedCompletion vK w :=
  (decompositionGroupEquivAlgebraicLocalizationAut
    vK hvK w)
      (subgroupGeneratorOfGenerator
        (absoluteValueDecompositionGroup K w.1) σ hgen)
theorem localizedCompletionGaloisGenerator_generates
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (w : AbsoluteValueExtension vK L)
    (σ : L ≃ₐ[K] L)
    (hgen : ∀ τ : L ≃ₐ[K] L,
      τ ∈ Subgroup.zpowers σ) :
    letI hK := AbsoluteValue.extensionCompletionAlgebra (K := K) w.1
    letI : SMul K w.1.Completion := hK.toSMul
    letI : Algebra vK.Completion w.1.Completion :=
      AbsoluteValue.completionAlgebra vK w.1 w.2
    ∀ τ : LocalizedCompletion vK w ≃ₐ[vK.Completion]
        LocalizedCompletion vK w,
      τ ∈ Subgroup.zpowers
        (localizedCompletionGaloisGenerator
          vK hvK w σ hgen) := by
  let := localizedCompletionBaseAlgebra vK w
  let H := absoluteValueDecompositionGroup K w.1
  let e :=
    decompositionGroupEquivAlgebraicLocalizationAut
      vK hvK w
  let δ :=
    subgroupGeneratorOfGenerator H σ hgen
  intro τ
  rw [show localizedCompletionGaloisGenerator
      vK hvK w σ hgen = e δ from rfl]
  change τ ∈ Subgroup.zpowers (e.toMonoidHom δ)
  rw [← MonoidHom.map_zpowers e.toMonoidHom δ]
  refine ⟨e.symm τ, ?_, e.apply_symm_apply τ⟩
  exact subgroupGeneratorOfGenerator_generates
    H σ hgen (e.symm τ)
end LocalClassFieldTheory
end
end

/- ClassFieldTheory.LocalClassFieldTheory.ClassFormation.LocalizedCompletionCohomology.HerbrandEquiv -/
section
open AlgebraicNumberTheory.Valuations
open HilbertRamification
open LocalClassFieldTheory
open LocalFieldTheory
open CyclicCohomology
open CyclicCohomology.ProfiniteCohomology.Herbrand
open scoped TensorProduct
noncomputable section
namespace LocalClassFieldTheory
section LocalTateComparison
variable {k ell : Type}
    [Field k] [Field ell] [Algebra k ell]
    [FiniteDimensional k ell] [IsGalois k ell]
 

noncomputable def localHerbrandH0EquivUnitsTateH0
    (vK : AbsoluteValue k ℝ) (hvK : vK.IsNontrivial)
    (w : AbsoluteValueExtension vK ell) :
    letI hK :=
      AbsoluteValue.extensionCompletionAlgebra
        (K := k) w.1
    letI : SMul k w.1.Completion := hK.toSMul
    letI : Algebra vK.Completion w.1.Completion :=
      AbsoluteValue.completionAlgebra vK w.1 w.2
    letI := localizedCompletionGlobalAlgebra vK w
    letI := localizedCompletionIsScalarTower vK w
    letI : FiniteDimensional vK.Completion
        (LocalizedCompletion vK w) :=
      localizedCompletionModuleFinite vK hvK w
    letI : IsGalois vK.Completion
        (LocalizedCompletion vK w) :=
      HilbertRamification.algebraicLocalization_isGalois vK w
    letI : Fintype (absoluteValueDecompositionGroup k w.1) :=
      Fintype.ofFinite _
    letI :=
      decompositionGroupLocalUnitsAction vK hvK w
    HerbrandH0 (absoluteValueDecompositionGroup k w.1)
        (LocalizedCompletion vK w)ˣ ≃*
      Multiplicative
        (tateCohomology
          (Rep.ofAlgebraAutOnUnits vK.Completion
            (LocalizedCompletion vK w)) 0) := by
  letI := localizedCompletionBaseAlgebra vK w
  letI := localizedCompletionGlobalAlgebra vK w
  letI := localizedCompletionIsScalarTower vK w
  letI : FiniteDimensional vK.Completion
      (LocalizedCompletion vK w) :=
    localizedCompletionFiniteDimensional vK hvK w
  letI : IsGalois vK.Completion
      (LocalizedCompletion vK w) :=
    localizedCompletionIsGalois vK w
  letI := localizedCompletionDecompositionGroupFintype vK w
  letI :
      MulDistribMulAction
        (LocalizedCompletion vK w ≃ₐ[vK.Completion]
          LocalizedCompletion vK w)
        (LocalizedCompletion vK w)ˣ :=
    galoisGroupFieldUnitsMulDistribMulAction
      vK.Completion (LocalizedCompletion vK w)
  let e :=
    decompositionGroupEquivAlgebraicLocalizationAut
      vK hvK w
  let eTate :
      (unitsInvariantSubmodule vK.Completion
          (LocalizedCompletion vK w) ⧸
        unitsTateH0NormSubmodule vK.Completion
          (LocalizedCompletion vK w)) ≃+
        tateCohomology
          (Rep.ofAlgebraAutOnUnits vK.Completion
            (LocalizedCompletion vK w)) 0 :=
    (tateUnitsH0IsoInvariantsQuotient
      vK.Completion
      (LocalizedCompletion vK w)).symm.toLinearEquiv.toAddEquiv
  exact
    (herbrandH0CompMulEquiv
      (A := (LocalizedCompletion vK w)ˣ) e).trans
      ((herbrandH0MulEquivInvariantsNormQuotient
        vK.Completion (LocalizedCompletion vK w)).trans
          eTate.toMultiplicative)
 

noncomputable def localHerbrandH0EquivNormQuotient
    (vK : AbsoluteValue k ℝ) (hvK : vK.IsNontrivial)
    (w : AbsoluteValueExtension vK ell) :
    letI hK :=
      AbsoluteValue.extensionCompletionAlgebra
        (K := k) w.1
    letI : SMul k w.1.Completion := hK.toSMul
    letI : Algebra vK.Completion w.1.Completion :=
      AbsoluteValue.completionAlgebra vK w.1 w.2
    letI := localizedCompletionGlobalAlgebra vK w
    letI := localizedCompletionIsScalarTower vK w
    letI : FiniteDimensional vK.Completion
        (LocalizedCompletion vK w) :=
      localizedCompletionModuleFinite vK hvK w
    letI : IsGalois vK.Completion
        (LocalizedCompletion vK w) :=
      HilbertRamification.algebraicLocalization_isGalois vK w
    letI : Fintype (absoluteValueDecompositionGroup k w.1) :=
      Fintype.ofFinite _
    letI :=
      decompositionGroupLocalUnitsAction vK hvK w
    HerbrandH0 (absoluteValueDecompositionGroup k w.1)
        (LocalizedCompletion vK w)ˣ ≃*
      NormQuotient vK.Completion
        (LocalizedCompletion vK w) := by
  letI := localizedCompletionBaseAlgebra vK w
  letI := localizedCompletionGlobalAlgebra vK w
  letI := localizedCompletionIsScalarTower vK w
  letI : FiniteDimensional vK.Completion
      (LocalizedCompletion vK w) :=
    localizedCompletionFiniteDimensional vK hvK w
  letI : IsGalois vK.Completion
      (LocalizedCompletion vK w) :=
    localizedCompletionIsGalois vK w
  letI := localizedCompletionDecompositionGroupFintype vK w
  let e0 :=
    localHerbrandH0EquivUnitsTateH0 vK hvK w
  let eAdd :
      tateCohomology
          (Rep.ofAlgebraAutOnUnits vK.Completion
            (LocalizedCompletion vK w)) 0 ≃+
        Additive
          (NormQuotient vK.Completion
            (LocalizedCompletion vK w)) :=
    (H0TateUnitsIsoNormQuotient
      vK.Completion
      (LocalizedCompletion vK w)).toLinearEquiv.toAddEquiv
  exact e0.trans <|
    eAdd.toMultiplicative.trans <|
      MulEquiv.multiplicativeAdditive
        (NormQuotient vK.Completion
          (LocalizedCompletion vK w))
end LocalTateComparison
end LocalClassFieldTheory
end
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
end CyclicCohomology
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
end RelativeIdeleGroup
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
end TateProducts
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
 
abbrev permutationOrbitStabilizer
    (ω : MulAction.orbitRel.Quotient G ι) :
    Subgroup G :=
  MulAction.stabilizer G ω.out
end CanonicalPermutationFunctions
section FiniteIndexStableSubgroup
variable {G : Type uG} {A : Type uA}
    [Group G] [CommGroup A]
    [MulDistribMulAction G A]
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
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.RayClass.Ideal -/
section
open scoped NumberField WithZero Classical
open NumberField IsDedekindDomain
noncomputable section
variable {K : Type*} [Field K] [NumberField K]
namespace RayClass
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
end RayClass
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.Idele.NormApproximation.FinitePlaces -/
section
open scoped NumberField Classical NNReal
open NumberField IsDedekindDomain
noncomputable section
open LocalClassFieldTheory
open AlgebraicNumberTheory.Valuations
open LocalClassFieldTheory
open LocalFieldTheory
variable {K L : Type}
    [Field K] [NumberField K]
    [Field L] [Algebra K L]
    [FiniteDimensional K L] [IsGalois K L]
 

noncomputable def finitePlaceCompletionBaseMap
    (v : HeightOneSpectrum (𝓞 K)) :
    WithAbs (NumberField.HeightOneSpectrum.adicAbv K v) →+*
      v.adicCompletion K :=
  (FinitePlace.embedding v).comp
    (WithAbs.equiv
      (NumberField.HeightOneSpectrum.adicAbv K v)).toRingHom
@[simp]
theorem finitePlaceCompletionBaseMap_apply
    (v : HeightOneSpectrum (𝓞 K))
    (x : WithAbs
      (NumberField.HeightOneSpectrum.adicAbv K v)) :
    finitePlaceCompletionBaseMap v x =
      FinitePlace.embedding v
        (WithAbs.equiv
          (NumberField.HeightOneSpectrum.adicAbv K v) x) :=
  rfl
theorem finitePlaceCompletionBaseMap_norm
    (v : HeightOneSpectrum (𝓞 K))
    (x : WithAbs
      (NumberField.HeightOneSpectrum.adicAbv K v)) :
    ‖finitePlaceCompletionBaseMap v x‖ = ‖x‖ := by
  rw [finitePlaceCompletionBaseMap_apply,
    FinitePlace.norm_embedding]
  rfl
 
theorem finitePlaceCompletionBaseMap_isometry
    (v : HeightOneSpectrum (𝓞 K)) :
    Isometry (finitePlaceCompletionBaseMap v) :=
  AddMonoidHomClass.isometry_of_norm _
    (finitePlaceCompletionBaseMap_norm v)
 
noncomputable def finitePlaceCompletionRingHom
    (v : HeightOneSpectrum (𝓞 K)) :
    (NumberField.HeightOneSpectrum.adicAbv K v).Completion →+*
      v.adicCompletion K :=
  (finitePlaceCompletionBaseMap_isometry v).extensionHom
@[simp]
theorem finitePlaceCompletionRingHom_coe
    (v : HeightOneSpectrum (𝓞 K))
    (x : WithAbs
      (NumberField.HeightOneSpectrum.adicAbv K v)) :
    finitePlaceCompletionRingHom v
        (x :
          (NumberField.HeightOneSpectrum.adicAbv K v).Completion) =
      finitePlaceCompletionBaseMap v x :=
  (finitePlaceCompletionBaseMap_isometry v).extensionHom_coe x
theorem finitePlaceCompletionRingHom_isometry
    (v : HeightOneSpectrum (𝓞 K)) :
    Isometry (finitePlaceCompletionRingHom v) :=
  (finitePlaceCompletionBaseMap_isometry v).completion_extension
 

theorem finitePlaceCompletionRingHom_surjective
    (v : HeightOneSpectrum (𝓞 K)) :
    Function.Surjective (finitePlaceCompletionRingHom v) := by
  let f := finitePlaceCompletionRingHom v
  have hrangeClosed : IsClosed (Set.range f) :=
    (finitePlaceCompletionRingHom_isometry v).isClosedEmbedding.isClosed_range
  have hdense :
      DenseRange (algebraMap K (v.adicCompletion K)) :=
    v.denseRange_algebraMap K
  have hrange :
      Set.range (algebraMap K (v.adicCompletion K)) ⊆
        Set.range f := by
    rintro _ ⟨x, rfl⟩
    let x' : WithAbs
        (NumberField.HeightOneSpectrum.adicAbv K v) :=
      (WithAbs.equiv
        (NumberField.HeightOneSpectrum.adicAbv K v)).symm x
    refine
      ⟨(x' :
          (NumberField.HeightOneSpectrum.adicAbv K v).Completion),
        ?_⟩
    rw [finitePlaceCompletionRingHom_coe]
    rfl
  intro x
  have hx :
      x ∈ closure
        (Set.range (algebraMap K (v.adicCompletion K))) := by
    rw [hdense.closure_range]
    trivial
  exact closure_minimal hrange hrangeClosed hx
 
noncomputable def finitePlaceCompletionRingEquiv
    (v : HeightOneSpectrum (𝓞 K)) :
    (NumberField.HeightOneSpectrum.adicAbv K v).Completion ≃+*
      v.adicCompletion K :=
  RingEquiv.ofBijective (finitePlaceCompletionRingHom v)
    ⟨(finitePlaceCompletionRingHom_isometry v).injective,
      finitePlaceCompletionRingHom_surjective v⟩
 


noncomputable def chosenFinitePlaceExtension
    (v : HeightOneSpectrum (𝓞 K)) :
    AbsoluteValueExtension
      (NumberField.HeightOneSpectrum.adicAbv K v) L :=
  pullbackAbsoluteValueExtension
    (NumberField.HeightOneSpectrum.adicAbv K v)
    (RayClass.adicAbv_isNontrivial v)
    IsAlgClosed.lift
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.Idele.Relative.FinitePlaceTensorNorm -/
section
open scoped NumberField TensorProduct
open NumberField IsDedekindDomain
noncomputable section
open LocalClassFieldTheory
open AlgebraicNumberTheory.Valuations
open LocalFieldTheory
variable {K L : Type}
    [Field K] [NumberField K]
    [Field L] [NumberField L] [Algebra K L]
    [FiniteDimensional K L] [IsGalois K L]
 

noncomputable def finitePlaceCompletionAlgEquiv
    (v : HeightOneSpectrum (𝓞 K)) :
    (NumberField.HeightOneSpectrum.adicAbv K v).Completion ≃ₐ[K]
      v.adicCompletion K where
  __ := finitePlaceCompletionRingEquiv v
  commutes' x := by
    change
      finitePlaceCompletionRingHom v
          (((WithAbs.equiv
            (NumberField.HeightOneSpectrum.adicAbv K v)).symm x :
              WithAbs
                (NumberField.HeightOneSpectrum.adicAbv K v)) :
            (NumberField.HeightOneSpectrum.adicAbv K v).Completion) =
        algebraMap K (v.adicCompletion K) x
    rw [finitePlaceCompletionRingHom_coe]
    rfl
 

noncomputable def finitePlaceLocalTensorAlgEquiv
    (v : HeightOneSpectrum (𝓞 K)) :
    LocalTensorAlgebra (L := L)
        (NumberField.HeightOneSpectrum.adicAbv K v) ≃ₐ[K]
      v.adicCompletion K ⊗[K] L :=
  Algebra.TensorProduct.congr
    (finitePlaceCompletionAlgEquiv v)
    (AlgEquiv.refl : L ≃ₐ[K] L)
 
noncomputable def finitePlaceLocalTensorUnitsEquiv
    (v : HeightOneSpectrum (𝓞 K)) :
    (LocalTensorAlgebra (L := L)
      (NumberField.HeightOneSpectrum.adicAbv K v))ˣ ≃*
      (v.adicCompletion K ⊗[K] L)ˣ :=
  Units.mapEquiv
    (finitePlaceLocalTensorAlgEquiv
      (K := K) (L := L) v).toMulEquiv
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.Adele.RestrictedAction -/
section
open scoped NumberField TensorProduct
open NumberField IsDedekindDomain
noncomputable section
universe u v w
variable
    {K : Type u} {L : Type v}
    [Field K] [NumberField K]
    [Field L] [NumberField L] [Algebra K L]
    [FiniteDimensional K L]
section ScalarTensor
variable
    {A : Type w} [CommRing A] [Algebra K A]
 

noncomputable def scalarTensorConjugation
    (σ : L ≃ₐ[K] L) :
    A ⊗[K] L ≃ₐ[A] A ⊗[K] L := by
  let f : A ⊗[K] L →ₐ[A] A ⊗[K] L :=
    Algebra.TensorProduct.map
      (AlgHom.id A A) σ.toAlgHom
  let g : A ⊗[K] L →ₐ[A] A ⊗[K] L :=
    Algebra.TensorProduct.map
      (AlgHom.id A A) σ.symm.toAlgHom
  exact AlgEquiv.ofAlgHom f g
    (by ext x; simp [f, g])
    (by ext x; simp [f, g])
omit [NumberField K] [NumberField L]
    [FiniteDimensional K L] in
@[simp]
theorem scalarTensorConjugation_tmul
    (σ : L ≃ₐ[K] L) (a : A) (x : L) :
    scalarTensorConjugation
        (K := K) (L := L) (A := A) σ
        (a ⊗ₜ[K] x) =
      a ⊗ₜ[K] σ x :=
  rfl
omit [NumberField K] [NumberField L]
    [FiniteDimensional K L] in
theorem scalarTensorConjugation_one
    (z : A ⊗[K] L) :
    scalarTensorConjugation
        (K := K) (L := L) (A := A)
        (1 : L ≃ₐ[K] L) z = z := by
  induction z using TensorProduct.induction_on with
  | zero => simp
  | tmul a x => simp
  | add x y hx hy => simp [hx, hy]
omit [NumberField K] [NumberField L]
    [FiniteDimensional K L] in
theorem scalarTensorConjugation_mul
    (σ τ : L ≃ₐ[K] L)
    (z : A ⊗[K] L) :
    scalarTensorConjugation
        (K := K) (L := L) (A := A) (σ * τ) z =
      scalarTensorConjugation
        (K := K) (L := L) (A := A) σ
        (scalarTensorConjugation
          (K := K) (L := L) (A := A) τ z) := by
  induction z using TensorProduct.induction_on with
  | zero => simp
  | tmul a x => simp
  | add x y hx hy => simp [hx, hy]
 
noncomputable abbrev scalarTensorUnitsAction :
    MulDistribMulAction
      (L ≃ₐ[K] L) (A ⊗[K] L)ˣ where
  smul σ z :=
    Units.mapEquiv
      (scalarTensorConjugation
        (K := K) (L := L) (A := A) σ).toMulEquiv z
  one_smul z := by
    apply Units.ext
    exact scalarTensorConjugation_one
      (K := K) (L := L) (A := A)
      (z : A ⊗[K] L)
  mul_smul σ τ z := by
    apply Units.ext
    exact scalarTensorConjugation_mul
      (K := K) (L := L) (A := A)
      σ τ (z : A ⊗[K] L)
  smul_one σ := by
    apply Units.ext
    exact
      (scalarTensorConjugation
        (K := K) (L := L) (A := A) σ).map_one
  smul_mul σ x y := by
    apply Units.ext
    exact
      (scalarTensorConjugation
        (K := K) (L := L) (A := A) σ).map_mul
        (x : A ⊗[K] L) (y : A ⊗[K] L)
end ScalarTensor
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.Adele.FinitePlaceTensorBlock -/
section
open scoped NumberField TensorProduct
open NumberField IsDedekindDomain
noncomputable section
open LocalClassFieldTheory
open AlgebraicNumberTheory.Valuations
open HilbertRamification
variable {K L : Type}
    [Field K] [NumberField K]
    [Field L] [NumberField L] [Algebra K L]
    [FiniteDimensional K L] [IsGalois K L]
omit [NumberField L] [FiniteDimensional K L] [IsGalois K L] in
 

theorem finitePlaceLocalTensorAlgEquiv_conjugation
    (v : HeightOneSpectrum (𝓞 K))
    (σ : L ≃ₐ[K] L)
    (z :
      LocalTensorAlgebra (L := L)
        (HeightOneSpectrum.adicAbv K v)) :
    finitePlaceLocalTensorAlgEquiv
        (K := K) (L := L) v
        (localTensorConjugation
          (K := K) (L := L)
          (HeightOneSpectrum.adicAbv K v) σ z) =
      scalarTensorConjugation
        (K := K) (L := L)
        (A := v.adicCompletion K) σ
        (finitePlaceLocalTensorAlgEquiv
          (K := K) (L := L) v z) := by
  induction z using TensorProduct.induction_on with
  | zero => simp
  | tmul a x => rfl
  | add x y hx hy => simp [hx, hy]
omit [NumberField L] [FiniteDimensional K L] [IsGalois K L] in
 
theorem finitePlaceLocalTensorUnitsEquiv_smul
    (v : HeightOneSpectrum (𝓞 K))
    (σ : L ≃ₐ[K] L)
    (z :
      (LocalTensorAlgebra (L := L)
        (HeightOneSpectrum.adicAbv K v))ˣ) :
    letI :=
      localTensorUnitsAction
        (K := K) (L := L)
        (HeightOneSpectrum.adicAbv K v)
    letI :=
      scalarTensorUnitsAction
        (K := K) (L := L)
        (A := v.adicCompletion K)
    finitePlaceLocalTensorUnitsEquiv
        (K := K) (L := L) v (σ • z) =
      σ • finitePlaceLocalTensorUnitsEquiv
        (K := K) (L := L) v z := by
  let :=
    localTensorUnitsAction
      (K := K) (L := L)
      (HeightOneSpectrum.adicAbv K v)
  let :=
    scalarTensorUnitsAction
      (K := K) (L := L)
      (A := v.adicCompletion K)
  apply Units.ext
  exact finitePlaceLocalTensorAlgEquiv_conjugation
    (K := K) (L := L) v σ
      (z :
        LocalTensorAlgebra (L := L)
          (HeightOneSpectrum.adicAbv K v))
omit [NumberField L] [FiniteDimensional K L] [IsGalois K L] in
 
theorem finitePlaceLocalTensorUnitsEquiv_symm_smul
    (v : HeightOneSpectrum (𝓞 K))
    (σ : L ≃ₐ[K] L)
    (z : (v.adicCompletion K ⊗[K] L)ˣ) :
    letI :=
      localTensorUnitsAction
        (K := K) (L := L)
        (HeightOneSpectrum.adicAbv K v)
    letI :=
      scalarTensorUnitsAction
        (K := K) (L := L)
        (A := v.adicCompletion K)
    (finitePlaceLocalTensorUnitsEquiv
        (K := K) (L := L) v).symm (σ • z) =
      σ •
        (finitePlaceLocalTensorUnitsEquiv
          (K := K) (L := L) v).symm z := by
  let :=
    localTensorUnitsAction
      (K := K) (L := L)
      (HeightOneSpectrum.adicAbv K v)
  let :=
    scalarTensorUnitsAction
      (K := K) (L := L)
      (A := v.adicCompletion K)
  apply
    (finitePlaceLocalTensorUnitsEquiv
      (K := K) (L := L) v).injective
  rw [MulEquiv.apply_symm_apply,
    finitePlaceLocalTensorUnitsEquiv_smul,
    MulEquiv.apply_symm_apply]
 

noncomputable def finitePlaceTensorUnitsEquivLocalPlaceBlock
    (v : HeightOneSpectrum (𝓞 K))
    (w : AbsoluteValueExtension
      (HeightOneSpectrum.adicAbv K v) L) :
    letI :=
      decompositionGroupLocalUnitsAction
        (HeightOneSpectrum.adicAbv K v)
        (RayClass.adicAbv_isNontrivial v) w
    letI hK :=
      AbsoluteValue.extensionCompletionAlgebra
        (K := K) w.1
    letI : SMul K w.1.Completion := hK.toSMul
    letI :=
      AbsoluteValue.completionAlgebra
        (HeightOneSpectrum.adicAbv K v) w.1 w.2
    letI : ∀ w' : AbsoluteValueExtension
        (HeightOneSpectrum.adicAbv K v) L,
      Algebra
        (HeightOneSpectrum.adicAbv K v).Completion
        w'.1.Completion :=
      fun w' =>
        AbsoluteValue.completionAlgebra
          (HeightOneSpectrum.adicAbv K v)
          w'.1 w'.2
    (v.adicCompletion K ⊗[K] L)ˣ ≃*
      LocalPlaceBlock
        (HeightOneSpectrum.adicAbv K v)
        (RayClass.adicAbv_isNontrivial v) w :=
  (finitePlaceLocalTensorUnitsEquiv
      (K := K) (L := L) v).symm.trans
    (localTensorUnitsEquivLocalPlaceBlock
      (HeightOneSpectrum.adicAbv K v)
      (RayClass.adicAbv_isNontrivial v) w)
section Equivariance
variable
    (v : HeightOneSpectrum (𝓞 K))
    (w : AbsoluteValueExtension
      (HeightOneSpectrum.adicAbv K v) L)
local instance finitePlaceScalarTensorUnitsAction :
    MulDistribMulAction
      (L ≃ₐ[K] L)
      (v.adicCompletion K ⊗[K] L)ˣ :=
  scalarTensorUnitsAction
    (K := K) (L := L) (A := v.adicCompletion K)
local instance finitePlaceLocalTensorUnitsAction :
    MulDistribMulAction
      (L ≃ₐ[K] L)
      (LocalTensorAlgebra (L := L)
        (HeightOneSpectrum.adicAbv K v))ˣ :=
  localTensorUnitsAction
    (K := K) (L := L)
    (HeightOneSpectrum.adicAbv K v)
omit [NumberField L] in
 

theorem finitePlaceTensorUnitsEquivLocalPlaceBlock_smul
    (σ : L ≃ₐ[K] L)
    (z : (v.adicCompletion K ⊗[K] L)ˣ) :
    finitePlaceTensorUnitsEquivLocalPlaceBlock
        (K := K) (L := L) v w (σ • z) =
      σ •
        finitePlaceTensorUnitsEquivLocalPlaceBlock
          (K := K) (L := L) v w z := by
  have hsource :
      (finitePlaceLocalTensorUnitsEquiv
          (K := K) (L := L) v).symm (σ • z) =
        σ •
          (finitePlaceLocalTensorUnitsEquiv
            (K := K) (L := L) v).symm z :=
    finitePlaceLocalTensorUnitsEquiv_symm_smul
      (K := K) (L := L) v σ z
  calc
    finitePlaceTensorUnitsEquivLocalPlaceBlock
        (K := K) (L := L) v w (σ • z) =
      localTensorUnitsEquivLocalPlaceBlock
        (HeightOneSpectrum.adicAbv K v)
        (RayClass.adicAbv_isNontrivial v) w
        (σ •
          (finitePlaceLocalTensorUnitsEquiv
            (K := K) (L := L) v).symm z) :=
      congrArg
        (localTensorUnitsEquivLocalPlaceBlock
          (HeightOneSpectrum.adicAbv K v)
          (RayClass.adicAbv_isNontrivial v) w)
        hsource
    _ =
      σ •
        finitePlaceTensorUnitsEquivLocalPlaceBlock
          (K := K) (L := L) v w z :=
      localTensorUnitsEquivLocalPlaceBlock_smul
        (HeightOneSpectrum.adicAbv K v)
        (RayClass.adicAbv_isNontrivial v) w σ
        ((finitePlaceLocalTensorUnitsEquiv
          (K := K) (L := L) v).symm z)
end Equivariance
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.Adele.InfinitePlaceTensorBlock -/
section
open scoped NumberField TensorProduct NumberField.LiesOver
open NumberField
noncomputable section
open LocalClassFieldTheory
open AlgebraicNumberTheory.Valuations
open HilbertRamification
universe u v
variable
    {K : Type u} {L : Type v}
    [Field K] [NumberField K]
    [Field L] [NumberField L] [Algebra K L]
    [FiniteDimensional K L]
 

def infinitePlaceCompletionAlgEquiv
    (w : InfinitePlace K) :
    w.Completion ≃ₐ[K] w.1.Completion where
  __ := InfinitePlace.Completion.equiv w
  commutes' _ := rfl
 

noncomputable def infinitePlaceLocalTensorAlgEquiv
    (w : InfinitePlace K) :
    w.Completion ⊗[K] L ≃ₐ[K]
      LocalTensorAlgebra (L := L) w.1 :=
  Algebra.TensorProduct.congr
    (infinitePlaceCompletionAlgEquiv w)
    (AlgEquiv.refl : L ≃ₐ[K] L)
 
noncomputable def infinitePlaceLocalTensorUnitsEquiv
    (w : InfinitePlace K) :
    (w.Completion ⊗[K] L)ˣ ≃*
      (LocalTensorAlgebra (L := L) w.1)ˣ :=
  Units.mapEquiv
    (infinitePlaceLocalTensorAlgEquiv
      (K := K) (L := L) w).toMulEquiv
omit [NumberField K] [NumberField L] [FiniteDimensional K L] in
 

theorem infinitePlaceLocalTensorAlgEquiv_conjugation
    (w : InfinitePlace K)
    (σ : L ≃ₐ[K] L)
    (z : w.Completion ⊗[K] L) :
    infinitePlaceLocalTensorAlgEquiv
        (K := K) (L := L) w
        (scalarTensorConjugation
          (K := K) (L := L)
          (A := w.Completion) σ z) =
      localTensorConjugation
        (K := K) (L := L) w.1 σ
        (infinitePlaceLocalTensorAlgEquiv
          (K := K) (L := L) w z) := by
  induction z using TensorProduct.induction_on with
  | zero => simp
  | tmul a x => rfl
  | add x y hx hy => simp [hx, hy]
omit [NumberField K] [NumberField L] [FiniteDimensional K L] in
 
theorem infinitePlaceLocalTensorUnitsEquiv_smul
    (w : InfinitePlace K)
    (σ : L ≃ₐ[K] L)
    (z : (w.Completion ⊗[K] L)ˣ) :
    letI := scalarTensorUnitsAction
      (K := K) (L := L) (A := w.Completion)
    letI := localTensorUnitsAction
      (K := K) (L := L) w.1
    infinitePlaceLocalTensorUnitsEquiv
        (K := K) (L := L) w (σ • z) =
      σ • infinitePlaceLocalTensorUnitsEquiv
        (K := K) (L := L) w z := by
  let := scalarTensorUnitsAction
    (K := K) (L := L) (A := w.Completion)
  let := localTensorUnitsAction
    (K := K) (L := L) w.1
  apply Units.ext
  exact infinitePlaceLocalTensorAlgEquiv_conjugation
    (K := K) (L := L) w σ
      (z : w.Completion ⊗[K] L)
section Galois
variable [IsGalois K L]
 

noncomputable def
    infinitePlaceTensorUnitsEquivLocalPlaceBlock
    (w : InfinitePlace K)
    (hw : w.1.IsNontrivial)
    (u : AbsoluteValueExtension w.1 L) :
    letI :=
      decompositionGroupLocalUnitsAction w.1 hw u
    letI hK :=
      AbsoluteValue.extensionCompletionAlgebra
        (K := K) u.1
    letI : SMul K u.1.Completion := hK.toSMul
    letI :=
      AbsoluteValue.completionAlgebra
        w.1 u.1 u.2
    letI : ∀ u' : AbsoluteValueExtension w.1 L,
        Algebra w.1.Completion u'.1.Completion :=
      fun u' =>
        AbsoluteValue.completionAlgebra
          w.1 u'.1 u'.2
    (w.Completion ⊗[K] L)ˣ ≃*
      LocalPlaceBlock w.1 hw u := by
  letI :=
    decompositionGroupLocalUnitsAction w.1 hw u
  letI hK :=
    AbsoluteValue.extensionCompletionAlgebra
      (K := K) u.1
  letI : SMul K u.1.Completion := hK.toSMul
  letI :=
    AbsoluteValue.completionAlgebra
      w.1 u.1 u.2
  letI : ∀ u' : AbsoluteValueExtension w.1 L,
      Algebra w.1.Completion u'.1.Completion :=
    fun u' =>
      AbsoluteValue.completionAlgebra
        w.1 u'.1 u'.2
  exact
    (infinitePlaceLocalTensorUnitsEquiv
      (K := K) (L := L) w).trans
      (localTensorUnitsEquivLocalPlaceBlock
        w.1 hw u)
section Equivariance
variable
    (w : InfinitePlace K)
    (hw : w.1.IsNontrivial)
    (u : AbsoluteValueExtension w.1 L)
local instance infinitePlaceScalarTensorUnitsAction :
    MulDistribMulAction (L ≃ₐ[K] L) (w.Completion ⊗[K] L)ˣ :=
  scalarTensorUnitsAction (K := K) (L := L) (A := w.Completion)
local instance infinitePlaceLocalTensorUnitsAction :
    MulDistribMulAction
      (L ≃ₐ[K] L)
      (LocalTensorAlgebra (L := L) w.1)ˣ :=
  localTensorUnitsAction (K := K) (L := L) w.1
omit [NumberField K] [NumberField L] in
 

theorem
    infinitePlaceTensorUnitsEquivLocalPlaceBlock_smul
    (σ : L ≃ₐ[K] L)
    (z : (w.Completion ⊗[K] L)ˣ) :
    letI :=
      decompositionGroupLocalUnitsAction w.1 hw u
    infinitePlaceTensorUnitsEquivLocalPlaceBlock
        (K := K) (L := L) w hw u (σ • z) =
      σ •
        infinitePlaceTensorUnitsEquivLocalPlaceBlock
          (K := K) (L := L) w hw u z := by
  let :=
    decompositionGroupLocalUnitsAction w.1 hw u
  have hsource :
      infinitePlaceLocalTensorUnitsEquiv
          (K := K) (L := L) w (σ • z) =
        σ • infinitePlaceLocalTensorUnitsEquiv
          (K := K) (L := L) w z :=
    infinitePlaceLocalTensorUnitsEquiv_smul
      (K := K) (L := L) w σ z
  calc
    infinitePlaceTensorUnitsEquivLocalPlaceBlock
        (K := K) (L := L) w hw u (σ • z) =
      localTensorUnitsEquivLocalPlaceBlock w.1 hw u
        (σ • infinitePlaceLocalTensorUnitsEquiv
          (K := K) (L := L) w z) :=
      congrArg
        (localTensorUnitsEquivLocalPlaceBlock w.1 hw u)
        hsource
    _ =
      σ • infinitePlaceTensorUnitsEquivLocalPlaceBlock
        (K := K) (L := L) w hw u z :=
      localTensorUnitsEquivLocalPlaceBlock_smul
        w.1 hw u σ
        (infinitePlaceLocalTensorUnitsEquiv
          (K := K) (L := L) w z)
end Equivariance
end Galois
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.Adele.IntegralTensorSupport.AbsoluteValue -/
section
open scoped NumberField TensorProduct NNReal
open NumberField IsDedekindDomain
noncomputable section
open AlgebraicNumberTheory.Valuations
universe u v
variable
    {K : Type u} {L : Type v}
    [Field K] [NumberField K]
    [Field L] [NumberField L] [Algebra K L]
    [FiniteDimensional K L]
 

noncomputable def realAbsoluteValueValuation
    {F : Type*} [Field F]
    (vF : AbsoluteValue F ℝ)
    (hvF : IsNonarchimedean (vF : F → ℝ)) :
    Valuation F NNReal where
  toFun x := ⟨vF x, vF.nonneg x⟩
  map_one' := by
    ext
    exact vF.map_one
  map_zero' := by
    ext
    exact vF.map_zero
  map_mul' x y := by
    ext
    exact vF.map_mul x y
  map_add_le_max' x y := by
    change vF (x + y) ≤ max (vF x) (vF y)
    exact hvF x y
 


theorem absoluteValueExtension_isNonarchimedean
    {F E : Type*} [Field F] [Field E] [Algebra F E]
    (vF : AbsoluteValue F ℝ)
    (hvF : IsNonarchimedean (vF : F → ℝ))
    (w : AbsoluteValueExtension vF E) :
    IsNonarchimedean (w.1 : E → ℝ) := by
  rw [AbsoluteValue.isNonarchimedean_iff_bounded_nat]
  refine ⟨1, ?_⟩
  intro n
  calc
    w.1 (n : E) =
        w.1 (algebraMap F E (n : F)) := by simp
    _ = vF (n : F) := w.2 (n : F)
    _ ≤ 1 := hvF.apply_natCast_le_one
 

theorem absoluteValue_le_one_of_isIntegral
    {F : Type*} [Field F]
    (vF : AbsoluteValue F ℝ)
    (hvF : IsNonarchimedean (vF : F → ℝ))
    {x : F} (hx : IsIntegral ℤ x) :
    vF x ≤ 1 := by
  let ν : Valuation F NNReal :=
    realAbsoluteValueValuation vF hvF
  let V : ValuationSubring F := ν.valuationSubring
  let : IsIntegrallyClosedIn V F :=
    (isIntegrallyClosed_iff_isIntegrallyClosedIn F).1
      inferInstance
  let : IsScalarTower ℤ V F :=
    IsScalarTower.of_algebraMap_eq fun n => by
      simp
  have hxV : IsIntegral V x :=
    hx.tower_top
  obtain ⟨y, hy⟩ :=
    (IsIntegrallyClosedIn.isIntegral_iff).1 hxV
  have hν : x ∈ V := by
    rw [← hy, ValuationSubring.algebraMap_apply]
    exact y.property
  change
    realAbsoluteValueValuation vF hvF x ≤ 1 at hν
  exact_mod_cast hν
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.Completion.LocalizedValuation -/
section
open scoped NumberField TensorProduct ValuativeRel NNReal
open NumberField IsDedekindDomain
noncomputable section
open AlgebraicNumberTheory.Valuations
open HilbertRamification
open LocalClassFieldTheory
open LocalFieldTheory
variable
    {K : Type} {L : Type}
    [Field K] [NumberField K]
    [Field L] [NumberField L] [Algebra K L]
    [FiniteDimensional K L] [IsGalois K L]
section LocalValuation
variable (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (w : AbsoluteValueExtension vK L)
omit [NumberField K] in
 

theorem completionIsUltrametricDist
    (hvKna : IsNonarchimedean (vK : K → ℝ)) :
    IsUltrametricDist vK.Completion :=
  IsUltrametricDist.isUltrametricDist_of_isNonarchimedean_norm
    (AbsoluteValue.completionAbsoluteValue_isNonarchimedean
      vK hvKna)
 
noncomputable abbrev finitePlaceCompletionValued
    (hvKna : IsNonarchimedean (vK : K → ℝ)) :
    Valued vK.Completion ℝ≥0 :=
  letI : IsUltrametricDist vK.Completion :=
    completionIsUltrametricDist vK hvKna
  NormedField.toValued
 

noncomputable abbrev finitePlaceCompletionValuativeRel
    (hvKna : IsNonarchimedean (vK : K → ℝ)) :
    ValuativeRel vK.Completion := by
  letI : Valued vK.Completion ℝ≥0 :=
    finitePlaceCompletionValued vK hvKna
  exact ValuativeRel.ofValuation
    (Valued.v : Valuation vK.Completion ℝ≥0)
end LocalValuation
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.Completion.ChosenLocalization -/
section
open scoped NumberField Classical ValuativeRel NNReal
open NumberField IsDedekindDomain
noncomputable section
open AlgebraicNumberTheory.Valuations
open LocalFieldTheory
variable
    {K L : Type}
    [Field K] [NumberField K]
    [Field L] [Algebra K L]
    [FiniteDimensional K L] [IsGalois K L]
 
abbrev ChosenFinitePlaceBaseCompletion
    (w₀ : HeightOneSpectrum (𝓞 K)) :=
  (HeightOneSpectrum.adicAbv K w₀).Completion
noncomputable instance chosenFinitePlaceBaseValued
    (w₀ : HeightOneSpectrum (𝓞 K)) :
    Valued
      (ChosenFinitePlaceBaseCompletion (K := K) w₀) ℝ≥0 :=
  finitePlaceCompletionValued
    (HeightOneSpectrum.adicAbv K w₀)
    (HeightOneSpectrum.isNonarchimedean_adicAbv K w₀)
noncomputable instance chosenFinitePlaceBaseValuativeRel
    (w₀ : HeightOneSpectrum (𝓞 K)) :
    ValuativeRel
      (ChosenFinitePlaceBaseCompletion (K := K) w₀) :=
  finitePlaceCompletionValuativeRel
    (HeightOneSpectrum.adicAbv K w₀)
    (HeightOneSpectrum.isNonarchimedean_adicAbv K w₀)
noncomputable instance
    chosenFinitePlaceBaseNontriviallyNormedField
    (w₀ : HeightOneSpectrum (𝓞 K)) :
    NontriviallyNormedField
      (ChosenFinitePlaceBaseCompletion (K := K) w₀) :=
  absoluteValueExtension_completionNontriviallyNormedField
    (HeightOneSpectrum.adicAbv K w₀)
    (RayClass.adicAbv_isNontrivial w₀)
noncomputable instance chosenFinitePlaceBaseLocallyCompactSpace
    (w₀ : HeightOneSpectrum (𝓞 K)) :
    LocallyCompactSpace
      (ChosenFinitePlaceBaseCompletion (K := K) w₀) :=
  AbsoluteValue.Completion.locallyCompactSpace
    (finitePlaceCompletionBaseMap_isometry w₀)
noncomputable instance chosenFinitePlaceBaseIsUltrametricDist
    (w₀ : HeightOneSpectrum (𝓞 K)) :
    IsUltrametricDist
      (ChosenFinitePlaceBaseCompletion (K := K) w₀) :=
  completionIsUltrametricDist
    (HeightOneSpectrum.adicAbv K w₀)
    (HeightOneSpectrum.isNonarchimedean_adicAbv K w₀)
noncomputable instance
    chosenFinitePlaceBaseValuationIsNontrivial
    (w₀ : HeightOneSpectrum (𝓞 K)) :
    (Valued.v :
      Valuation
        (ChosenFinitePlaceBaseCompletion (K := K) w₀)
        ℝ≥0).IsNontrivial :=
  (inferInstance :
    (NormedField.valuation
      (K := ChosenFinitePlaceBaseCompletion (K := K) w₀)).IsNontrivial)
noncomputable instance chosenFinitePlaceBaseValuationCompatible
    (w₀ : HeightOneSpectrum (𝓞 K)) :
    (Valued.v :
      Valuation
        (ChosenFinitePlaceBaseCompletion (K := K) w₀)
        ℝ≥0).Compatible :=
  Valuation.Compatible.ofValuation _
noncomputable instance
    chosenFinitePlaceBaseValuativeRelIsNontrivial
    (w₀ : HeightOneSpectrum (𝓞 K)) :
    ValuativeRel.IsNontrivial
      (ChosenFinitePlaceBaseCompletion (K := K) w₀) :=
  (ValuativeRel.isNontrivial_iff_isNontrivial
    (Valued.v :
      Valuation
        (ChosenFinitePlaceBaseCompletion (K := K) w₀)
        ℝ≥0)).2 inferInstance
noncomputable instance chosenFinitePlaceBaseIsValuativeTopology
    (w₀ : HeightOneSpectrum (𝓞 K)) :
    IsValuativeTopology
      (ChosenFinitePlaceBaseCompletion (K := K) w₀) :=
  isValuativeTopology_of_valued_ofValuation
    (ChosenFinitePlaceBaseCompletion (K := K) w₀) ℝ≥0
noncomputable instance
    chosenFinitePlaceBaseIsNonarchimedeanLocalField
    (w₀ : HeightOneSpectrum (𝓞 K)) :
    IsNonarchimedeanLocalField
      (ChosenFinitePlaceBaseCompletion (K := K) w₀) :=
  { toIsValuativeTopology := inferInstance
    toLocallyCompactSpace := inferInstance
    toIsNontrivial := inferInstance }
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
section FullLogarithmicSpace
 

abbrev LogPlace :=
  NumberField.InfinitePlace K ⊕ S
end FullLogarithmicSpace
section Decomposition
end Decomposition
end SUnitGroup
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
section IntegralPermutationBasis
variable [Fintype G] [Group G] [Fintype ι] [DecidableEq ι]
variable {M : Type*} [AddCommGroup M] [Module ℤ M]
end IntegralPermutationBasis
section StableSublattice
variable [Fintype G] [Group G] [Fintype ι] [DecidableEq ι]
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
 
noncomputable abbrev finitePlaceMulAction :
    MulAction (L ≃ₐ[K] L)
      (HeightOneSpectrum (𝓞 L)) where
  smul σ v := finitePlaceEquiv K L σ v
  one_smul := finitePlaceEquiv_one K L
  mul_smul := finitePlaceEquiv_mul K L
section FinitePlaceAction
local instance :
    MulAction (L ≃ₐ[K] L)
      (HeightOneSpectrum (𝓞 L)) :=
  finitePlaceMulAction K L
 

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
 
noncomputable def logPlacePermutationHom
    (S : Finset (HeightOneSpectrum (𝓞 L)))
    (hS : IsGaloisStableFinitePlaces K L S) :
    (L ≃ₐ[K] L) →*
      Equiv.Perm (SUnitGroup.LogPlace (K := L) S) := by
  letI := logPlaceMulAction K L S hS
  exact MulAction.toPermHom
    (L ≃ₐ[K] L) (SUnitGroup.LogPlace (K := L) S)
omit [NumberField K] [NumberField L] in
@[simp]
theorem logPlacePermutationHom_apply
    {S : Finset (HeightOneSpectrum (𝓞 L))}
    (hS : IsGaloisStableFinitePlaces K L S)
    (σ : L ≃ₐ[K] L)
    (p : SUnitGroup.LogPlace (K := L) S) :
    letI := logPlaceMulAction K L S hS
    logPlacePermutationHom K L S hS σ p = σ • p :=
  rfl
end FinitePlaceAction
end
end

/- ValuedFieldTheory.Ramification.HilbertRamification.Dedekind.Basic -/
section
noncomputable section
namespace HilbertRamification
namespace Dedekind
open scoped Pointwise
open Algebra Module
variable {A B : Type*} [CommRing A] [CommRing B] [Algebra A B]
 

theorem exists_smul_eq_of_isGaloisGroup
    (p : Ideal A) (P Q : Ideal B)
    [P.IsPrime] [P.LiesOver p] [Q.IsPrime] [Q.LiesOver p]
    (G : Type*) [Group G] [Finite G] [MulSemiringAction G B]
    [IsGaloisGroup G A B] :
    ∃ σ : G, σ • P = Q := by
  exact Ideal.exists_smul_eq_of_isGaloisGroup p P Q G
end Dedekind
end HilbertRamification
end
end

/- ValuedFieldTheory.Ramification.HilbertRamification.Dedekind.PrimeContractions -/
section
noncomputable section
namespace HilbertRamification
namespace Dedekind
open Algebra NumberField
open scoped Pointwise
variable {K L : Type*}
variable [Field K] [Field L] [NumberField K] [NumberField L] [Algebra K L]
variable (G : Type*) [Group G] [MulSemiringAction G L] [SMulCommClass G K L]
 

theorem ringOfIntegers_under_ne_bot
    {E F : Type*} [Field E] [Field F] [NumberField E] [NumberField F]
    [Algebra E F] (P : Ideal (𝓞 F)) [P.IsMaximal] :
    P.under (𝓞 E) ≠ ⊥ := by
  exact
    Ring.ne_bot_of_isMaximal_of_not_isField
      (M := P.under (𝓞 E)) inferInstance
      (RingOfIntegers.not_isField E)
 

abbrev basePrime
    (P : Ideal (𝓞 L)) :
    Ideal (𝓞 K) :=
  P.under (𝓞 K)
 
instance basePrime_isPrime
    (P : Ideal (𝓞 L)) [P.IsPrime] :
    (basePrime (K := K) P).IsPrime :=
  inferInstance
end Dedekind
end HilbertRamification
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.Completion.ExtensionIndex -/
section
open scoped NumberField Classical
open NumberField IsDedekindDomain
noncomputable section
open AlgebraicNumberTheory.Valuations
universe u v w
variable
    {K : Type u} {L : Type v}
    [Field K] [NumberField K]
    [Field L] [NumberField L] [Algebra K L]
 
noncomputable def finitePlaceBelow
    (W : HeightOneSpectrum (𝓞 L)) :
    HeightOneSpectrum (𝓞 K) where
  asIdeal := W.asIdeal.under (𝓞 K)
  isPrime := inferInstance
  ne_bot :=
    HilbertRamification.Dedekind.ringOfIntegers_under_ne_bot
      (E := K) (F := L) W.asIdeal
@[simp]
theorem finitePlaceBelow_asIdeal
    (W : HeightOneSpectrum (𝓞 L)) :
    (finitePlaceBelow (K := K) W).asIdeal =
      W.asIdeal.under (𝓞 K) :=
  rfl
section Tower
variable {M : Type w}
    [Field M] [NumberField M]
    [Algebra K M] [Algebra M L]
    [IsScalarTower K M L]
end Tower
section Centre
variable [FiniteDimensional K L]
omit [NumberField L] [FiniteDimensional K L] in
 

theorem finitePlaceExtension_nonarchimedean
    (v : HeightOneSpectrum (𝓞 K))
    (w : AbsoluteValueExtension
      (HeightOneSpectrum.adicAbv K v) L) :
    LubinTate.Valuations.NonarchimedeanAbsoluteValue w.1 :=
  (AbsoluteValue.isNonarchimedean_iff_bounded_nat w.1).1
    (absoluteValueExtension_isNonarchimedean
      (HeightOneSpectrum.adicAbv K v)
      (HeightOneSpectrum.isNonarchimedean_adicAbv K v) w)
 

noncomputable def finitePlaceExtensionValuationSubring
    (v : HeightOneSpectrum (𝓞 K))
    (w : AbsoluteValueExtension
      (HeightOneSpectrum.adicAbv K v) L) :
    ValuationSubring L :=
  absoluteValueValuationSubring w.1
    (finitePlaceExtension_nonarchimedean
      (K := K) (L := L) v w)
omit [NumberField L] [FiniteDimensional K L] in
 

theorem ringOfIntegers_mem_finitePlaceExtensionValuationSubring
    (v : HeightOneSpectrum (𝓞 K))
    (w : AbsoluteValueExtension
      (HeightOneSpectrum.adicAbv K v) L)
    (x : 𝓞 L) :
    (x : L) ∈
      finitePlaceExtensionValuationSubring
        (K := K) (L := L) v w := by
  rw [finitePlaceExtensionValuationSubring,
    mem_absoluteValueValuationSubring_iff]
  exact
    absoluteValue_le_one_of_isIntegral w.1
      (absoluteValueExtension_isNonarchimedean
        (HeightOneSpectrum.adicAbv K v)
        (HeightOneSpectrum.isNonarchimedean_adicAbv K v) w)
      x.property
 

noncomputable def ringOfIntegersToFinitePlaceExtensionValuationSubring
    (v : HeightOneSpectrum (𝓞 K))
    (w : AbsoluteValueExtension
      (HeightOneSpectrum.adicAbv K v) L) :
    𝓞 L →+*
      finitePlaceExtensionValuationSubring
        (K := K) (L := L) v w :=
  RingHom.codRestrict (algebraMap (𝓞 L) L)
    (finitePlaceExtensionValuationSubring
      (K := K) (L := L) v w).toSubring
    (ringOfIntegers_mem_finitePlaceExtensionValuationSubring
      (K := K) (L := L) v w)
 

noncomputable def finitePlaceExtensionCentreIdeal
    (v : HeightOneSpectrum (𝓞 K))
    (w : AbsoluteValueExtension
      (HeightOneSpectrum.adicAbv K v) L) :
    Ideal (𝓞 L) :=
  (IsLocalRing.maximalIdeal
      (finitePlaceExtensionValuationSubring
        (K := K) (L := L) v w)).comap
    (ringOfIntegersToFinitePlaceExtensionValuationSubring
      (K := K) (L := L) v w)
omit [NumberField L] [FiniteDimensional K L] in
 
theorem mem_finitePlaceExtensionCentreIdeal_iff
    (v : HeightOneSpectrum (𝓞 K))
    (w : AbsoluteValueExtension
      (HeightOneSpectrum.adicAbv K v) L)
    (x : 𝓞 L) :
    x ∈ finitePlaceExtensionCentreIdeal
        (K := K) (L := L) v w ↔
      w.1 (x : L) < 1 := by
  let A :=
    finitePlaceExtensionValuationSubring
      (K := K) (L := L) v w
  let f :=
    ringOfIntegersToFinitePlaceExtensionValuationSubring
      (K := K) (L := L) v w
  change
    f x ∈ IsLocalRing.maximalIdeal A ↔
      w.1 (((f x : A) : L)) < 1
  rw [IsLocalRing.mem_maximalIdeal, mem_nonunits_iff]
  exact
    not_isUnit_iff_abs_lt_one_of_mem_iff_le_one
      w.1 A
      (fun y => by
        change
          y ∈ finitePlaceExtensionValuationSubring
              (K := K) (L := L) v w ↔
            w.1 y ≤ 1
        rw [finitePlaceExtensionValuationSubring,
          mem_absoluteValueValuationSubring_iff])
      (f x)
omit [NumberField L] [FiniteDimensional K L] in
theorem finitePlaceExtensionCentreIdeal_isPrime
    (v : HeightOneSpectrum (𝓞 K))
    (w : AbsoluteValueExtension
      (HeightOneSpectrum.adicAbv K v) L) :
    (finitePlaceExtensionCentreIdeal
      (K := K) (L := L) v w).IsPrime := by
  unfold finitePlaceExtensionCentreIdeal
  exact Ideal.comap_isPrime _ _
omit [NumberField L] [FiniteDimensional K L] in
 
theorem finitePlaceExtensionCentreIdeal_under
    (v : HeightOneSpectrum (𝓞 K))
    (w : AbsoluteValueExtension
      (HeightOneSpectrum.adicAbv K v) L) :
    (finitePlaceExtensionCentreIdeal
        (K := K) (L := L) v w).under (𝓞 K) =
      v.asIdeal := by
  ext x
  change
    algebraMap (𝓞 K) (𝓞 L) x ∈
        finitePlaceExtensionCentreIdeal
          (K := K) (L := L) v w ↔
      x ∈ v.asIdeal
  rw [mem_finitePlaceExtensionCentreIdeal_iff]
  have hcoe :
      ((algebraMap (𝓞 K) (𝓞 L) x : 𝓞 L) : L) =
        algebraMap K L (x : K) := by
    rfl
  rw [hcoe, w.2]
  rw [← FinitePlace.norm_embedding]
  exact FinitePlace.norm_lt_one_iff_mem (K := K) v x
omit [NumberField L] [FiniteDimensional K L] in
theorem finitePlaceExtensionCentreIdeal_ne_bot
    (v : HeightOneSpectrum (𝓞 K))
    (w : AbsoluteValueExtension
      (HeightOneSpectrum.adicAbv K v) L) :
    finitePlaceExtensionCentreIdeal
        (K := K) (L := L) v w ≠ ⊥ := by
  intro hbot
  apply v.ne_bot
  rw [← finitePlaceExtensionCentreIdeal_under
    (K := K) (L := L) v w, hbot]
  simp
 

noncomputable def finitePlaceExtensionCentre
    (v : HeightOneSpectrum (𝓞 K))
    (w : AbsoluteValueExtension
      (HeightOneSpectrum.adicAbv K v) L) :
    HeightOneSpectrum (𝓞 L) where
  asIdeal :=
    finitePlaceExtensionCentreIdeal
      (K := K) (L := L) v w
  isPrime :=
    finitePlaceExtensionCentreIdeal_isPrime
      (K := K) (L := L) v w
  ne_bot :=
    finitePlaceExtensionCentreIdeal_ne_bot
      (K := K) (L := L) v w
omit [NumberField L] [FiniteDimensional K L] in
@[simp]
theorem finitePlaceExtensionCentre_asIdeal
    (v : HeightOneSpectrum (𝓞 K))
    (w : AbsoluteValueExtension
      (HeightOneSpectrum.adicAbv K v) L) :
    (finitePlaceExtensionCentre
      (K := K) (L := L) v w).asIdeal =
      finitePlaceExtensionCentreIdeal
        (K := K) (L := L) v w :=
  rfl
omit [FiniteDimensional K L] in
@[simp]
theorem finitePlaceBelow_finitePlaceExtensionCentre
    (v : HeightOneSpectrum (𝓞 K))
    (w : AbsoluteValueExtension
      (HeightOneSpectrum.adicAbv K v) L) :
    finitePlaceBelow (K := K)
        (finitePlaceExtensionCentre
          (K := K) (L := L) v w) =
      v := by
  apply HeightOneSpectrum.ext
  exact
    finitePlaceExtensionCentreIdeal_under
      (K := K) (L := L) v w
omit [FiniteDimensional K L] in
 

theorem finitePlaceExtensionValuationSubring_eq_localization
    (v : HeightOneSpectrum (𝓞 K))
    (w : AbsoluteValueExtension
      (HeightOneSpectrum.adicAbv K v) L) :
    finitePlaceExtensionValuationSubring
        (K := K) (L := L) v w =
      (finitePlaceExtensionCentre
        (K := K) (L := L) v w).valuationSubringAtPrime L := by
  let P :=
    finitePlaceExtensionCentreIdeal
      (K := K) (L := L) v w
  let : P.IsPrime :=
    finitePlaceExtensionCentreIdeal_isPrime
      (K := K) (L := L) v w
  let W :=
    finitePlaceExtensionCentre
      (K := K) (L := L) v w
  let V := W.valuationSubringAtPrime L
  let A :=
    finitePlaceExtensionValuationSubring
      (K := K) (L := L) v w
  have hVA : V ≤ A := by
    rintro x ⟨a, s, hs, rfl⟩
    have haA : (a : L) ∈ A :=
      ringOfIntegers_mem_finitePlaceExtensionValuationSubring
        (K := K) (L := L) v w a
    have hsA : (s : L) ∈ A :=
      ringOfIntegers_mem_finitePlaceExtensionValuationSubring
        (K := K) (L := L) v w s
    have haLe : w.1 (a : L) ≤ 1 := by
      change (a : L) ∈
        finitePlaceExtensionValuationSubring
          (K := K) (L := L) v w at haA
      rw [finitePlaceExtensionValuationSubring,
        mem_absoluteValueValuationSubring_iff] at haA
      exact haA
    have hsLe : w.1 (s : L) ≤ 1 := by
      change (s : L) ∈
        finitePlaceExtensionValuationSubring
          (K := K) (L := L) v w at hsA
      rw [finitePlaceExtensionValuationSubring,
        mem_absoluteValueValuationSubring_iff] at hsA
      exact hsA
    have hsNotLt : ¬ w.1 (s : L) < 1 := by
      intro hlt
      apply hs
      exact
        (mem_finitePlaceExtensionCentreIdeal_iff
          (K := K) (L := L) v w s).2 hlt
    have hsEq : w.1 (s : L) = 1 :=
      le_antisymm hsLe (not_lt.mp hsNotLt)
    change
      (a : L) * (s : L)⁻¹ ∈
        finitePlaceExtensionValuationSubring
          (K := K) (L := L) v w
    rw [finitePlaceExtensionValuationSubring,
      mem_absoluteValueValuationSubring_iff,
      map_mul, map_inv₀, hsEq, inv_one, mul_one]
    exact haLe
  have hAne : A ≠ ⊤ := by
    intro htop
    obtain ⟨x, hx0, hx1⟩ :=
      RayClass.adicAbv_isNontrivial v
    let y : L := algebraMap K L x
    have hy0 : y ≠ 0 := by
      change algebraMap K L x ≠ 0
      simpa only [map_zero] using
        (algebraMap K L).injective.ne hx0
    have hy1 : w.1 y ≠ 1 := by
      change w.1 (algebraMap K L x) ≠ 1
      rw [w.2]
      exact hx1
    have hle (z : L) : w.1 z ≤ 1 := by
      have hzA : z ∈ A := by
        rw [htop]
        trivial
      change
        z ∈ finitePlaceExtensionValuationSubring
          (K := K) (L := L) v w at hzA
      rw [finitePlaceExtensionValuationSubring,
        mem_absoluteValueValuationSubring_iff] at hzA
      exact hzA
    have honeLe : 1 ≤ w.1 y := by
      calc
        1 = w.1 y * w.1 y⁻¹ := by
          rw [← map_mul, mul_inv_cancel₀ hy0, map_one]
        _ ≤ w.1 y * 1 :=
          mul_le_mul_of_nonneg_left (hle y⁻¹) (w.1.nonneg y)
        _ = w.1 y := mul_one _
    exact hy1 (le_antisymm (hle y) honeLe)
  exact (V.eq_of_le_of_ne_top hVA hAne).symm
section CrossBaseEquivalence
variable {F M : Type*}
    [Field F] [NumberField F]
    [Field M] [NumberField M]
    [Algebra F L] [Algebra M L]
omit [Algebra K L] [FiniteDimensional K L] in
 


theorem finitePlaceExtensions_isEquiv_of_centres_eq
    (vF : HeightOneSpectrum (𝓞 F))
    (vM : HeightOneSpectrum (𝓞 M))
    (wF :
      AbsoluteValueExtension
        (HeightOneSpectrum.adicAbv F vF) L)
    (wM :
      AbsoluteValueExtension
        (HeightOneSpectrum.adicAbv M vM) L)
    (hcentre :
      finitePlaceExtensionCentre
          (K := F) (L := L) vF wF =
        finitePlaceExtensionCentre
          (K := M) (L := L) vM wM) :
    wF.1.IsEquiv wM.1 := by
  have hsubring :
      finitePlaceExtensionValuationSubring
          (K := F) (L := L) vF wF =
        finitePlaceExtensionValuationSubring
          (K := M) (L := L) vM wM := by
    rw [finitePlaceExtensionValuationSubring_eq_localization,
      finitePlaceExtensionValuationSubring_eq_localization,
      hcentre]
  have hle (x : L) :
      wF.1 x ≤ 1 ↔ wM.1 x ≤ 1 := by
    change
      x ∈
          finitePlaceExtensionValuationSubring
            (K := F) (L := L) vF wF ↔
        x ∈
          finitePlaceExtensionValuationSubring
            (K := M) (L := L) vM wM
    rw [hsubring]
  apply AbsoluteValue.isEquiv_iff_lt_one_iff.mpr
  intro x
  by_cases hx : x = 0
  · subst x
    simp
  calc
    wF.1 x < 1 ↔ 1 < (wF.1 x)⁻¹ :=
      (one_lt_inv₀ (wF.1.pos hx)).symm
    _ ↔ 1 < wF.1 x⁻¹ := by
      rw [map_inv₀]
    _ ↔ ¬ wF.1 x⁻¹ ≤ 1 := not_le.symm
    _ ↔ ¬ wM.1 x⁻¹ ≤ 1 :=
      not_congr (hle x⁻¹)
    _ ↔ 1 < wM.1 x⁻¹ := not_le
    _ ↔ 1 < (wM.1 x)⁻¹ := by
      rw [map_inv₀]
    _ ↔ wM.1 x < 1 :=
      one_lt_inv₀ (wM.1.pos hx)
end CrossBaseEquivalence
omit [FiniteDimensional K L] in
 

theorem finitePlaceExtensionCentre_injective
    (v : HeightOneSpectrum (𝓞 K)) :
    Function.Injective
      (finitePlaceExtensionCentre
        (K := K) (L := L) v) := by
  intro w w' hcentre
  have hequiv : w.1.IsEquiv w'.1 :=
    finitePlaceExtensions_isEquiv_of_centres_eq
      (F := K) (M := K) v v w w' hcentre
  exact
    equivalent_exactExtensions_eq
      (HeightOneSpectrum.adicAbv K v)
      (RayClass.adicAbv_isNontrivial v) w w'
      ((LubinTate.Valuations.equivalentAbsoluteValues_iff_isEquiv
        w.1 w'.1).2 hequiv)
omit [NumberField L] [FiniteDimensional K L] in
 

theorem finitePlaceExtensionCentre_conjugate
    (v : HeightOneSpectrum (𝓞 K))
    (w : AbsoluteValueExtension
      (HeightOneSpectrum.adicAbv K v) L)
    (σ : L ≃ₐ[K] L) :
    finitePlaceExtensionCentre
        (K := K) (L := L) v
        (absoluteValueExtensionConjugate
          (HeightOneSpectrum.adicAbv K v) w σ) =
      finitePlaceEquiv K L σ⁻¹
        (finitePlaceExtensionCentre
          (K := K) (L := L) v w) := by
  apply HeightOneSpectrum.ext
  ext x
  change
    x ∈ finitePlaceExtensionCentreIdeal
        (K := K) (L := L) v
        (absoluteValueExtensionConjugate
          (HeightOneSpectrum.adicAbv K v) w σ) ↔
      NumberField.RingOfIntegers.mapRingHom
          σ.toRingHom x ∈
        finitePlaceExtensionCentreIdeal
          (K := K) (L := L) v w
  rw [mem_finitePlaceExtensionCentreIdeal_iff,
    mem_finitePlaceExtensionCentreIdeal_iff]
  rfl
end Centre
end
end

/- ClassFieldTheory.LocalClassFieldTheory.ClassFormation.LocalBlocks.Family.Instances -/
section
noncomputable section
namespace LocalClassFieldTheory
open AlgebraicNumberTheory.Valuations
open HilbertRamification
open CyclicCohomology.ProfiniteCohomology.Herbrand
open CyclicCohomology
universe u v w
variable (K : Type u) (L : Type v)
    [Field K] [Field L] [Algebra K L]
    [FiniteDimensional K L] [IsGalois K L]
 

structure LocalPlaceDatum where
   
  base : AbsoluteValue K ℝ
   
  base_isNontrivial : base.IsNontrivial
   
  extension : AbsoluteValueExtension base L
variable {K L}
 
abbrev LocalBlockFamily {ι : Type w}
    (d : ι → LocalPlaceDatum K L) :=
  ∀ i, LocalPlaceBlock
    (d i).base (d i).base_isNontrivial
    (d i).extension
 

noncomputable abbrev localBlockFamilyLocalAction
    {ι : Type w} (d : ι → LocalPlaceDatum K L) :
    ∀ i, MulDistribMulAction
      (absoluteValueDecompositionGroup K (d i).extension.1)
      (LocalizedCompletion
        (d i).base (d i).extension)ˣ :=
  fun i =>
    decompositionGroupLocalUnitsAction
      (d i).base (d i).base_isNontrivial
      (d i).extension
 
noncomputable abbrev localBlockFamilyBlockAction
    {ι : Type w} (d : ι → LocalPlaceDatum K L) :
    ∀ i, MulDistribMulAction (L ≃ₐ[K] L)
      (LocalPlaceBlock
        (d i).base (d i).base_isNontrivial
        (d i).extension) := by
  letI := localBlockFamilyLocalAction d
  exact fun i =>
    inducedMulDistribMulAction
      (absoluteValueDecompositionGroup K
        (d i).extension.1)
 
noncomputable abbrev localBlockFamilyCohomologyAction
    {ι : Type w} (d : ι → LocalPlaceDatum K L) :
    MulDistribMulAction (L ≃ₐ[K] L)
      (LocalBlockFamily d) := by
  letI := localBlockFamilyLocalAction d
  letI := localBlockFamilyBlockAction d
  exact
    piMulDistribMulAction (L ≃ₐ[K] L)
      (fun i ↦ LocalPlaceBlock
        (d i).base (d i).base_isNontrivial
        (d i).extension)
 

noncomputable abbrev localBlockFamilyDecompositionFintype
    {ι : Type w} (d : ι → LocalPlaceDatum K L) :
    ∀ i, Fintype
      (absoluteValueDecompositionGroup K
        (d i).extension.1) :=
  fun _ => Fintype.ofFinite _
end LocalClassFieldTheory
end
end

/- ClassFieldTheory.LocalClassFieldTheory.ClassFormation.LocalBlocks.Family.H0 -/
section
noncomputable section
namespace LocalClassFieldTheory
open AlgebraicNumberTheory.Valuations
open HilbertRamification
open CyclicCohomology.ProfiniteCohomology.Herbrand
open CyclicCohomology
universe u v w
variable {K : Type u} {L : Type v}
    [Field K] [Field L] [Algebra K L]
    [FiniteDimensional K L] [IsGalois K L]
 
noncomputable def localBlockFamilyHerbrandH0Equiv
    {ι : Type w} [Fintype ι]
    (d : ι → LocalPlaceDatum K L)
    (σ : L ≃ₐ[K] L)
    (hgen : ∀ τ : L ≃ₐ[K] L,
      τ ∈ Subgroup.zpowers σ) :
    letI _localAction : ∀ i,
        MulDistribMulAction
          (absoluteValueDecompositionGroup K (d i).extension.1)
          (LocalizedCompletion
            (d i).base (d i).extension)ˣ :=
      fun i ↦ decompositionGroupLocalUnitsAction
        (d i).base (d i).base_isNontrivial
        (d i).extension
    letI _blockAction : ∀ i,
        MulDistribMulAction (L ≃ₐ[K] L)
          (LocalPlaceBlock
            (d i).base (d i).base_isNontrivial
            (d i).extension) :=
      fun i ↦ inducedMulDistribMulAction
        (absoluteValueDecompositionGroup K (d i).extension.1)
    letI _familyAction :
        MulDistribMulAction (L ≃ₐ[K] L)
          (LocalBlockFamily d) :=
      piMulDistribMulAction (L ≃ₐ[K] L)
        (fun i ↦ LocalPlaceBlock
          (d i).base (d i).base_isNontrivial
          (d i).extension)
    letI _decompositionFintype : ∀ i,
        Fintype
          (absoluteValueDecompositionGroup K
            (d i).extension.1) :=
      fun _ ↦ Fintype.ofFinite _
    HerbrandH0 (L ≃ₐ[K] L)
        (LocalBlockFamily d) ≃*
      ∀ i,
        HerbrandH0
          (absoluteValueDecompositionGroup K
            (d i).extension.1)
          (LocalizedCompletion
            (d i).base (d i).extension)ˣ := by
  letI localAction := localBlockFamilyLocalAction d
  letI blockAction := localBlockFamilyBlockAction d
  letI familyAction := localBlockFamilyCohomologyAction d
  letI decompositionFintype :=
    localBlockFamilyDecompositionFintype d
  exact
    (herbrandH0PiEquiv
      (G := L ≃ₐ[K] L)
      (fun i ↦ LocalPlaceBlock
        (d i).base (d i).base_isNontrivial
        (d i).extension)).trans
      (MulEquiv.piCongrRight fun i ↦
        localPlaceBlockHerbrandH0Equiv
          (d i).base (d i).base_isNontrivial
          (d i).extension σ hgen)
end LocalClassFieldTheory
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.Idele.Cohomology.Decomposition -/
section
open scoped NumberField RestrictedProduct ValuativeRel
open NumberField IsDedekindDomain
noncomputable section
open LocalClassFieldTheory
open AlgebraicNumberTheory.Valuations
open HilbertRamification
open LocalClassFieldTheory
open LocalFieldTheory
open CyclicCohomology.ProfiniteCohomology.Herbrand
open CyclicCohomology
universe u
variable {F : Type u} [Field F] [NumberField F]
section FiniteTensorFamily
universe uK uL uι
variable {K : Type uK} {L : Type uL}
    [Field K] [Field L] [Algebra K L]
    [FiniteDimensional K L] [IsGalois K L]
 

abbrev LocalTensorFamily {ι : Type uι}
    (d : ι → LocalPlaceDatum K L) :=
  ∀ i, (LocalTensorAlgebra (L := L) (d i).base)ˣ
 
noncomputable abbrev localBlockFamilyAction {ι : Type uι}
    (d : ι → LocalPlaceDatum K L) :
    MulDistribMulAction (L ≃ₐ[K] L)
      (LocalBlockFamily d) := by
  letI : ∀ i, MulDistribMulAction
      (absoluteValueDecompositionGroup K (d i).extension.1)
      (LocalizedCompletion
        (d i).base (d i).extension)ˣ :=
    fun i ↦ decompositionGroupLocalUnitsAction
      (d i).base (d i).base_isNontrivial
      (d i).extension
  letI : ∀ i, MulDistribMulAction (L ≃ₐ[K] L)
      (LocalPlaceBlock
        (d i).base (d i).base_isNontrivial
        (d i).extension) :=
    fun i ↦ inducedMulDistribMulAction
      (absoluteValueDecompositionGroup K (d i).extension.1)
  exact piMulDistribMulAction (L ≃ₐ[K] L)
    (fun i ↦ LocalPlaceBlock
      (d i).base (d i).base_isNontrivial
      (d i).extension)
end FiniteTensorFamily
section UnramifiedLocalUnits
section InducedOutsideSBlock
universe uG
variable {G : Type uG} [Group G] [Fintype G]
end InducedOutsideSBlock
end UnramifiedLocalUnits
end
end

/- ClassFieldTheory.LocalClassFieldTheory.ClassFormation.ArchimedeanNormQuotient -/
section
open LocalFieldTheory
open CyclicCohomology.ProfiniteCohomology.Herbrand
open CyclicCohomology
noncomputable section
namespace LocalClassFieldTheory
universe u v w z
open AlgebraicNumberTheory.Valuations
open HilbertRamification
open NumberField
open scoped Classical NumberField.LiesOver
variable
    {K L : Type}
    [Field K] [NumberField K]
    [Field L] [NumberField L] [Algebra K L]
    [FiniteDimensional K L] [IsGalois K L]
 

def infinitePlaceAbsoluteValueExtension
    (v : InfinitePlace K) (w : InfinitePlace L)
    (hw : w.comap (algebraMap K L) = v) :
    AbsoluteValueExtension v.1 L :=
  ⟨w.1, fun x =>
    congrArg
      (fun q : InfinitePlace K => q.1 x) hw⟩
 

def absoluteCompletionRingEquivReal
    (v : InfinitePlace K) (hv : v.IsReal) :
    v.1.Completion ≃+* ℝ :=
  (InfinitePlace.Completion.equiv v).symm.trans
    (InfinitePlace.Completion.ringEquivRealOfIsReal hv)
 

def absoluteCompletionRingEquivComplex
    (v : InfinitePlace K) (hv : v.IsComplex) :
    v.1.Completion ≃+* ℂ :=
  (InfinitePlace.Completion.equiv v).symm.trans
    (InfinitePlace.Completion.ringEquivComplexOfIsComplex hv)
omit [NumberField K] [NumberField L] [FiniteDimensional K L]
    [IsGalois K L] in
 

theorem absoluteValueDecompositionGroup_eq_infinitePlaceStabilizer
    (w : InfinitePlace L) :
    absoluteValueDecompositionGroup K w.1 =
      MulAction.stabilizer (L ≃ₐ[K] L) w := by
  ext σ
  constructor
  · intro hσ
    have hσi :
        σ⁻¹ ∈ absoluteValueDecompositionGroup K w.1 :=
      (absoluteValueDecompositionGroup K w.1).inv_mem hσ
    rw [mem_absoluteValueDecompositionGroup_iff_equivalent,
      LubinTate.Valuations.equivalentAbsoluteValues_iff_isEquiv] at hσi
    rw [MulAction.mem_stabilizer_iff]
    apply
      (InfinitePlace.eq_iff_isEquiv
        (w := σ • w) (v := w)).2
    exact hσi
  · intro hσ
    rw [MulAction.mem_stabilizer_iff] at hσ
    have hσi :
        σ⁻¹ ∈ absoluteValueDecompositionGroup K w.1 := by
      rw [mem_absoluteValueDecompositionGroup_iff_equivalent,
        LubinTate.Valuations.equivalentAbsoluteValues_iff_isEquiv]
      exact
        (InfinitePlace.eq_iff_isEquiv
          (w := σ • w) (v := w)).1 hσ
    simpa using
      (absoluteValueDecompositionGroup K w.1).inv_mem hσi
 

theorem normUnits_map_ringEquiv
    {K : Type u} {L : Type v} {K' : Type w} {L' : Type z}
    [Field K] [Field L] [Field K'] [Field L']
    [Algebra K L] [Algebra K' L']
    (eK : K ≃+* K') (eL : L ≃+* L')
    (he :
      RingHom.comp (algebraMap K' L') eK =
        RingHom.comp eL (algebraMap K L))
    (x : Lˣ) :
    Units.mapEquiv eK.toMulEquiv (normUnits K L x) =
      normUnits K' L'
        (Units.mapEquiv eL.toMulEquiv x) := by
  apply Units.ext
  change
    eK (Algebra.norm K (x : L)) =
      Algebra.norm K' (eL (x : L))
  rw [Algebra.norm_eq_of_equiv_equiv eK eL he]
  exact eK.apply_symm_apply _
 
theorem ringEquiv_compat_symm
    {K : Type u} {L : Type v} {K' : Type w} {L' : Type z}
    [Field K] [Field L] [Field K'] [Field L']
    [Algebra K L] [Algebra K' L']
    (eK : K ≃+* K') (eL : L ≃+* L')
    (he :
      RingHom.comp (algebraMap K' L') eK =
        RingHom.comp eL (algebraMap K L)) :
    RingHom.comp (algebraMap K L) eK.symm =
      RingHom.comp eL.symm (algebraMap K' L') := by
  ext x
  apply eL.injective
  have hx := DFunLike.congr_fun he (eK.symm x)
  simpa using hx.symm
 

def normQuotientMapOfRingEquiv
    {K L K' L' : Type}
    [Field K] [Field L] [Field K'] [Field L']
    [Algebra K L] [Algebra K' L']
    (eK : K ≃+* K') (eL : L ≃+* L')
    (he :
      RingHom.comp (algebraMap K' L') eK =
        RingHom.comp eL (algebraMap K L)) :
    NormQuotient K L →* NormQuotient K' L' :=
  normQuotientLift
    ((normClass K' L').comp
      (Units.mapEquiv eK.toMulEquiv).toMonoidHom)
    (by
      rintro x ⟨y, rfl⟩
      rw [MonoidHom.mem_ker]
      change
        normClass K' L'
          (Units.mapEquiv eK.toMulEquiv
            (normUnits K L y)) = 1
      rw [normUnits_map_ringEquiv eK eL he]
      exact mk_normUnits_eq_one K' L'
        (Units.mapEquiv eL.toMulEquiv y))
 

@[simp]
theorem normQuotientMapOfRingEquiv_normClass
    {K L K' L' : Type}
    [Field K] [Field L] [Field K'] [Field L']
    [Algebra K L] [Algebra K' L']
    (eK : K ≃+* K') (eL : L ≃+* L')
    (he :
      RingHom.comp (algebraMap K' L') eK =
        RingHom.comp eL (algebraMap K L))
    (x : Kˣ) :
    normQuotientMapOfRingEquiv eK eL he
        (normClass K L x) =
      normClass K' L'
        (Units.mapEquiv eK.toMulEquiv x) :=
  normQuotientLift_normClass _ _ x
 

def normQuotientEquivOfRingEquiv
    {K L K' L' : Type}
    [Field K] [Field L] [Field K'] [Field L']
    [Algebra K L] [Algebra K' L']
    (eK : K ≃+* K') (eL : L ≃+* L')
    (he :
      RingHom.comp (algebraMap K' L') eK =
        RingHom.comp eL (algebraMap K L)) :
    NormQuotient K L ≃* NormQuotient K' L' where
  toFun := normQuotientMapOfRingEquiv eK eL he
  invFun :=
    normQuotientMapOfRingEquiv eK.symm eL.symm
      (ringEquiv_compat_symm eK eL he)
  left_inv q := by
    refine NormQuotient.inductionOn
      (motive := fun q =>
        normQuotientMapOfRingEquiv eK.symm eL.symm
            (ringEquiv_compat_symm eK eL he)
            (normQuotientMapOfRingEquiv eK eL he q) =
          q)
      q ?_
    intro x
    rw [normQuotientMapOfRingEquiv_normClass,
      normQuotientMapOfRingEquiv_normClass]
    congr 1
    exact (Units.mapEquiv eK.toMulEquiv).symm_apply_apply x
  right_inv q := by
    refine NormQuotient.inductionOn
      (motive := fun q =>
        normQuotientMapOfRingEquiv eK eL he
            (normQuotientMapOfRingEquiv eK.symm eL.symm
              (ringEquiv_compat_symm eK eL he) q) =
          q)
      q ?_
    intro x
    rw [normQuotientMapOfRingEquiv_normClass,
      normQuotientMapOfRingEquiv_normClass]
    congr 1
    exact (Units.mapEquiv eK.toMulEquiv).apply_symm_apply x
  map_mul' := fun x y =>
    map_mul (normQuotientMapOfRingEquiv eK eL he) x y
 

theorem herbrandH0_card_eq_one_of_group_card_eq_one
    {G A : Type*}
    [Group G] [Fintype G]
    [CommGroup A] [MulDistribMulAction G A]
    (hG : Nat.card G = 1) :
    Nat.card (HerbrandH0 G A) = 1 := by
  let : Subsingleton G :=
    (Nat.card_eq_one_iff_unique.mp hG).1
  let : Subsingleton (HerbrandH0 G A) :=
    herbrandH0_subsingleton_of_fixed_le_tateNormSubgroup
      (G := G) (A := A) (by
        intro a ha
        refine ⟨a, ?_⟩
        rw [tateNormHom_apply]
        unfold tateNorm
        classical
        have huniv : (Finset.univ : Finset G) = {1} := by
          ext g
          simp [Subsingleton.elim g 1]
        rw [huniv]
        simp)
  exact Nat.card_unique
 


def localizedCompletionNormQuotientEquivAbsoluteCompletions
    (v : InfinitePlace K) (w : InfinitePlace L)
    (hw : w.comap (algebraMap K L) = v) :
    let u :=
      infinitePlaceAbsoluteValueExtension v w hw
    letI hL :=
      AbsoluteValue.extensionCompletionAlgebra
        (K := K) u.1
    letI : SMul K u.1.Completion := hL.toSMul
    letI : Algebra v.1.Completion u.1.Completion :=
      AbsoluteValue.completionAlgebra v.1 u.1 u.2
    letI : Algebra v.1.Completion w.1.Completion :=
      AbsoluteValue.completionAlgebra v.1 w.1
        (infinitePlaceAbsoluteValueExtension v w hw).2
    NormQuotient v.1.Completion
        (LocalizedCompletion v.1 u) ≃*
      NormQuotient v.1.Completion w.1.Completion := by
  let u :=
    infinitePlaceAbsoluteValueExtension v w hw
  letI hL :=
    AbsoluteValue.extensionCompletionAlgebra
      (K := K) u.1
  letI : SMul K u.1.Completion := hL.toSMul
  letI : Algebra v.1.Completion u.1.Completion :=
    AbsoluteValue.completionAlgebra v.1 u.1 u.2
  letI : Algebra v.1.Completion w.1.Completion :=
    AbsoluteValue.completionAlgebra v.1 w.1
      (infinitePlaceAbsoluteValueExtension v w hw).2
  let eLAlg :
      LocalizedCompletion v.1 u ≃ₐ[v.1.Completion]
        w.1.Completion :=
    localizedCompletionEquivCompletion
      v.1 v.isNontrivial u
  let eL : LocalizedCompletion v.1 u ≃+* w.1.Completion :=
    eLAlg.toRingEquiv
  exact
    normQuotientEquivOfRingEquiv
      (RingEquiv.refl v.1.Completion) eL
      (by
        ext x
        exact eLAlg.commutes x)
 


def absoluteCompletionNormQuotientEquivRealComplex
    (v : InfinitePlace K) (w : InfinitePlace L)
    (hw : w.comap (algebraMap K L) = v)
    (hv : v.IsReal) (hwc : w.IsComplex) :
    let u :=
      infinitePlaceAbsoluteValueExtension v w hw
    letI hL :=
      AbsoluteValue.extensionCompletionAlgebra
        (K := K) u.1
    letI : SMul K u.1.Completion := hL.toSMul
    letI : Algebra v.1.Completion u.1.Completion :=
      AbsoluteValue.completionAlgebra v.1 u.1 u.2
    letI : Algebra v.1.Completion w.1.Completion :=
      AbsoluteValue.completionAlgebra v.1 w.1
        (infinitePlaceAbsoluteValueExtension v w hw).2
    NormQuotient v.1.Completion w.1.Completion ≃*
      NormQuotient ℝ ℂ := by
  let u :=
    infinitePlaceAbsoluteValueExtension v w hw
  letI hL :=
    AbsoluteValue.extensionCompletionAlgebra
      (K := K) u.1
  letI : SMul K u.1.Completion := hL.toSMul
  letI : Algebra v.1.Completion u.1.Completion :=
    AbsoluteValue.completionAlgebra v.1 u.1 u.2
  letI : Algebra v.1.Completion w.1.Completion :=
    AbsoluteValue.completionAlgebra v.1 w.1
      (infinitePlaceAbsoluteValueExtension v w hw).2
  letI : w.1.LiesOver v.1 :=
    ⟨congrArg (fun q : InfinitePlace K => q.1) hw⟩
  have hEmbedding :
      w.embedding.comp (algebraMap K L) =
        v.embedding :=
    (InfinitePlace.LiesOver.embedding_liesOver_of_isReal
      w hv).over
  have hCompletionEmbedding :
      ∀ x : v.1.Completion,
        InfinitePlace.Completion.extensionEmbedding w
            ((InfinitePlace.Completion.equiv w).symm
              (AbsoluteValue.completionMap
                v.1 w.1
                (infinitePlaceAbsoluteValueExtension
                  v w hw).2 x)) =
          InfinitePlace.Completion.extensionEmbedding v
            ((InfinitePlace.Completion.equiv v).symm x) := by
    intro x
    refine
      UniformSpace.Completion.induction_on
        (α := WithAbs v.1) x ?_ ?_
    · exact
        isClosed_eq
          ((InfinitePlace.Completion.isometry_extensionEmbedding
              w).continuous.comp
            ((InfinitePlace.Completion.continuous_ofCompletion
              w).comp
              (AbsoluteValue.completionMap_isometry
                v.1 w.1
                (infinitePlaceAbsoluteValueExtension
                  v w hw).2).continuous))
          ((InfinitePlace.Completion.isometry_extensionEmbedding
              v).continuous.comp
            (InfinitePlace.Completion.continuous_ofCompletion v))
    · intro y
      have hy :
          (y : v.1.Completion) =
            algebraMap K v.1.Completion
              (WithAbs.equiv v.1 y) := by
        rw [← AbsoluteValue.toCompletion_eq_algebraMap]
        simp
      have hmap :
          AbsoluteValue.completionMap v.1 w.1
              (infinitePlaceAbsoluteValueExtension v w hw).2
              (y : v.1.Completion) =
            AbsoluteValue.toCompletion w.1
              (algebraMap K L (WithAbs.equiv v.1 y)) :=
        (congrArg
          (AbsoluteValue.completionMap v.1 w.1
            (infinitePlaceAbsoluteValueExtension v w hw).2) hy).trans
          (AbsoluteValue.completionMap_coe v.1 w.1
            (infinitePlaceAbsoluteValueExtension v w hw).2
            (WithAbs.equiv v.1 y))
      have hwEmbedding :
          InfinitePlace.Completion.extensionEmbedding w
              ((InfinitePlace.Completion.equiv w).symm
                (AbsoluteValue.toCompletion w.1
                  (algebraMap K L (WithAbs.equiv v.1 y)))) =
            w.embedding (algebraMap K L (WithAbs.equiv v.1 y)) :=
        (InfinitePlace.Completion.extensionEmbedding_coe w
          ((WithAbs.equiv w.1).symm
            (algebraMap K L (WithAbs.equiv v.1 y)))).trans
          (congrArg w.embedding
            ((WithAbs.equiv w.1).apply_symm_apply
              (algebraMap K L (WithAbs.equiv v.1 y))))
      exact
        (congrArg (fun z : w.1.Completion =>
          InfinitePlace.Completion.extensionEmbedding w
            ((InfinitePlace.Completion.equiv w).symm z)) hmap).trans
          (hwEmbedding.trans
            ((DFunLike.congr_fun hEmbedding (WithAbs.equiv v.1 y)).trans
              (InfinitePlace.Completion.extensionEmbedding_coe v y).symm))
  exact
    normQuotientEquivOfRingEquiv
      (absoluteCompletionRingEquivReal v hv)
      (absoluteCompletionRingEquivComplex w hwc)
      (by
        ext x
        exact
          (InfinitePlace.Completion.extensionEmbeddingOfIsReal_apply hv
            ((InfinitePlace.Completion.equiv v).symm x)).trans
            (hCompletionEmbedding x).symm)
 
def realUnitsSign : ℝˣ →* ℤˣ :=
  Units.map
    ((SignType.castHom (α := ℤ)).comp
      (signHom (α := ℝ)))
 

@[simp]
theorem realUnitsSign_coe (x : ℝˣ) :
    ((realUnitsSign x : ℤˣ) : ℤ) =
      (SignType.sign (x : ℝ) : ℤ) :=
  rfl
 
theorem realUnitsSign_surjective :
    Function.Surjective realUnitsSign := by
  intro u
  rcases Int.units_eq_one_or u with rfl | rfl
  · exact ⟨1, by simp [realUnitsSign]⟩
  · exact ⟨-1, by
      apply Units.ext
      simp [realUnitsSign]⟩
 
@[simp]
theorem mem_realUnitsSign_ker_iff (x : ℝˣ) :
    x ∈ realUnitsSign.ker ↔ 0 < (x : ℝ) := by
  rw [MonoidHom.mem_ker]
  constructor
  · intro hx
    have hxv := congrArg Units.val hx
    have hs : SignType.sign (x : ℝ) = 1 := by
      cases hsign : SignType.sign (x : ℝ) <;>
        simp [realUnitsSign_coe, hsign] at hxv ⊢
    exact sign_eq_one_iff.mp hs
  · intro hx
    apply Units.ext
    simp [realUnitsSign, sign_pos hx]
 
theorem realUnitsSign_ker_eq_complexNormSubgroup :
    realUnitsSign.ker = localNormSubgroup ℝ ℂ := by
  ext x
  rw [mem_realUnitsSign_ker_iff]
  change 0 < (x : ℝ) ↔
    ∃ u : ℂˣ, normUnits ℝ ℂ u = x
  constructor
  · intro hx
    let z : ℂ :=
      (Real.sqrt (x : ℝ) : ℝ)
    have hz : z ≠ 0 := by
      exact Complex.ofReal_ne_zero.mpr
        (ne_of_gt (Real.sqrt_pos.2 hx))
    let u : ℂˣ := Units.mk0 z hz
    refine ⟨u, ?_⟩
    apply Units.ext
    change Algebra.norm ℝ (u : ℂ) = (x : ℝ)
    rw [Algebra.norm_complex_apply]
    simpa [u, z, Complex.normSq_ofReal] using
      Real.mul_self_sqrt hx.le
  · rintro ⟨u, rfl⟩
    change 0 < Algebra.norm ℝ (u : ℂ)
    rw [Algebra.norm_complex_apply, Complex.normSq_pos]
    exact Units.ne_zero u
 
def realComplexNormQuotientEquivSign :
    NormQuotient ℝ ℂ ≃* ℤˣ :=
  normQuotientEquivOfSurjective
    realUnitsSign
    realUnitsSign_surjective
    realUnitsSign_ker_eq_complexNormSubgroup
 
theorem realComplexNormQuotient_card_eq_two :
    Nat.card (NormQuotient ℝ ℂ) = 2 := by
  rw [Nat.card_congr realComplexNormQuotientEquivSign.toEquiv,
    Nat.card_eq_fintype_card, Fintype.card_units_int]
omit [NumberField K] [NumberField L] in
 


theorem infinitePlaceLocalHerbrandH0_card_eq_localDegree
    (v : InfinitePlace K) (w : InfinitePlace L)
    (hw : w.comap (algebraMap K L) = v) :
    let u :=
      infinitePlaceAbsoluteValueExtension v w hw
    letI hL :=
      AbsoluteValue.extensionCompletionAlgebra
        (K := K) u.1
    letI : SMul K u.1.Completion := hL.toSMul
    letI : Algebra v.1.Completion u.1.Completion :=
      AbsoluteValue.completionAlgebra v.1 u.1 u.2
    letI := localizedCompletionGlobalAlgebra v.1 u
    letI := localizedCompletionIsScalarTower v.1 u
    letI : FiniteDimensional v.1.Completion
        (LocalizedCompletion v.1 u) :=
      localizedCompletionModuleFinite v.1 v.isNontrivial u
    letI : IsGalois v.1.Completion
        (LocalizedCompletion v.1 u) :=
      HilbertRamification.algebraicLocalization_isGalois v.1 u
    letI : Fintype (absoluteValueDecompositionGroup K w.1) :=
      Fintype.ofFinite _
    letI : MulDistribMulAction
        (absoluteValueDecompositionGroup K w.1)
        (LocalizedCompletion v.1 u)ˣ :=
      decompositionGroupLocalUnitsAction
        v.1 v.isNontrivial u
    Nat.card
        (HerbrandH0
          (absoluteValueDecompositionGroup K w.1)
          (LocalizedCompletion v.1 u)ˣ) =
      if w.IsUnramified K then 1 else 2 := by
  let u :=
    infinitePlaceAbsoluteValueExtension v w hw
  let hL :=
    AbsoluteValue.extensionCompletionAlgebra
      (K := K) u.1
  let : SMul K u.1.Completion := hL.toSMul
  let : Algebra v.1.Completion u.1.Completion :=
    AbsoluteValue.completionAlgebra v.1 u.1 u.2
  let := localizedCompletionGlobalAlgebra v.1 u
  let := localizedCompletionIsScalarTower v.1 u
  let : FiniteDimensional v.1.Completion
      (LocalizedCompletion v.1 u) :=
    localizedCompletionModuleFinite v.1 v.isNontrivial u
  let : IsGalois v.1.Completion
      (LocalizedCompletion v.1 u) :=
    HilbertRamification.algebraicLocalization_isGalois v.1 u
  let : Fintype (absoluteValueDecompositionGroup K w.1) :=
    Fintype.ofFinite _
  let : MulDistribMulAction
      (absoluteValueDecompositionGroup K w.1)
      (LocalizedCompletion v.1 u)ˣ :=
    decompositionGroupLocalUnitsAction
      v.1 v.isNontrivial u
  by_cases hUnramified : w.IsUnramified K
  · rw [if_pos hUnramified]
    apply herbrandH0_card_eq_one_of_group_card_eq_one
    rw [absoluteValueDecompositionGroup_eq_infinitePlaceStabilizer w,
      InfinitePlace.card_stabilizer, if_pos hUnramified]
  · rw [if_neg hUnramified]
    have hRamified : w.IsRamified K := hUnramified
    have hvReal : v.IsReal := by
      rw [← hw]
      exact hRamified.isReal
    have hwComplex : w.IsComplex :=
      hRamified.isComplex
    let eH0 :=
      localHerbrandH0EquivNormQuotient
        v.1 v.isNontrivial u
    let eCompletion :=
      localizedCompletionNormQuotientEquivAbsoluteCompletions
        v w hw
    let eRealComplex :=
      absoluteCompletionNormQuotientEquivRealComplex
        v w hw hvReal hwComplex
    calc
      Nat.card
          (HerbrandH0
            (absoluteValueDecompositionGroup K w.1)
            (LocalizedCompletion v.1 u)ˣ) =
          Nat.card (NormQuotient ℝ ℂ) :=
        Nat.card_congr
          (eH0.trans
            (eCompletion.trans eRealComplex)).toEquiv
      _ = 2 := realComplexNormQuotient_card_eq_two
end LocalClassFieldTheory
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.Idele.Cohomology.SPlaces.LocalBlocks -/
section
open scoped NumberField TensorProduct
open NumberField IsDedekindDomain
noncomputable section
open LocalClassFieldTheory
open AlgebraicNumberTheory.Valuations
open CyclicCohomology
open HilbertRamification
variable {K L : Type}
    [Field K] [NumberField K]
    [Field L] [NumberField L] [Algebra K L]
    [FiniteDimensional K L] [IsGalois K L]
 

noncomputable def chosenInfinitePlaceAbove
    (v : InfinitePlace K) : InfinitePlace L :=
  Classical.choose
    (InfinitePlace.comap_surjective (K := L) v)
omit [NumberField K] [NumberField L] [FiniteDimensional K L] in
 
@[simp]
theorem chosenInfinitePlaceAbove_comap
    (v : InfinitePlace K) :
    (chosenInfinitePlaceAbove (L := L) v).comap
        (algebraMap K L) = v :=
  Classical.choose_spec
    (InfinitePlace.comap_surjective (K := L) v)
 

abbrev RelativeUnrestrictedSPlaceIndex
    (S : Finset (HeightOneSpectrum (𝓞 K))) :=
  Sum (InfinitePlace K)
    {v : HeightOneSpectrum (𝓞 K) // v ∈ S}
 
noncomputable def relativeUnrestrictedSPlaceDatum
    (S : Finset (HeightOneSpectrum (𝓞 K))) :
    RelativeUnrestrictedSPlaceIndex (K := K) S →
      LocalPlaceDatum K L
  | Sum.inl v =>
      { base := v.1
        base_isNontrivial := v.isNontrivial
        extension :=
          infinitePlaceAbsoluteValueExtension
            v (chosenInfinitePlaceAbove (L := L) v)
            (chosenInfinitePlaceAbove_comap
              (L := L) v) }
  | Sum.inr v =>
      { base := HeightOneSpectrum.adicAbv K v.1
        base_isNontrivial :=
          RayClass.adicAbv_isNontrivial v.1
        extension :=
          chosenFinitePlaceExtension
            (L := L) v.1 }
 
abbrev RelativeUnrestrictedSPlaceFactor
    (S : Finset (HeightOneSpectrum (𝓞 K))) :
    RelativeUnrestrictedSPlaceIndex (K := K) S → Type
  | Sum.inl v => (v.Completion ⊗[K] L)ˣ
  | Sum.inr v => (v.1.adicCompletion K ⊗[K] L)ˣ
 
noncomputable instance relativeUnrestrictedSPlaceFactorCommGroup
    (S : Finset (HeightOneSpectrum (𝓞 K)))
    (i : RelativeUnrestrictedSPlaceIndex (K := K) S) :
    CommGroup
      (RelativeUnrestrictedSPlaceFactor
        (K := K) (L := L) S i) := by
  cases i <;> infer_instance
 
abbrev RelativeUnrestrictedSPlaceFactors
    (S : Finset (HeightOneSpectrum (𝓞 K))) :=
  ∀ i : RelativeUnrestrictedSPlaceIndex (K := K) S,
    RelativeUnrestrictedSPlaceFactor
      (K := K) (L := L) S i
 

noncomputable abbrev relativeUnrestrictedSPlaceFactorsAction
    (S : Finset (HeightOneSpectrum (𝓞 K))) :
    MulDistribMulAction (L ≃ₐ[K] L)
      (RelativeUnrestrictedSPlaceFactors
        (K := K) (L := L) S) := by
  letI : ∀ i :
      RelativeUnrestrictedSPlaceIndex (K := K) S,
      MulDistribMulAction (L ≃ₐ[K] L)
        (RelativeUnrestrictedSPlaceFactor
          (K := K) (L := L) S i) :=
    fun i => by
      cases i with
      | inl v =>
          exact
            scalarTensorUnitsAction
              (K := K) (L := L)
              (A := v.Completion)
      | inr v =>
          exact
            scalarTensorUnitsAction
              (K := K) (L := L)
              (A := v.1.adicCompletion K)
  exact
    piMulDistribMulAction (L ≃ₐ[K] L)
      (RelativeUnrestrictedSPlaceFactor
        (K := K) (L := L) S)
 
noncomputable def
    relativeUnrestrictedSPlaceFactorsEquivLocalBlockFamily
    (S : Finset (HeightOneSpectrum (𝓞 K))) :
    RelativeUnrestrictedSPlaceFactors
        (K := K) (L := L) S ≃*
      LocalBlockFamily
        (relativeUnrestrictedSPlaceDatum
          (K := K) (L := L) S) :=
  MulEquiv.piCongrRight fun i => by
    cases i with
    | inl v =>
        exact
          infinitePlaceTensorUnitsEquivLocalPlaceBlock
            (K := K) (L := L) v v.isNontrivial
            (infinitePlaceAbsoluteValueExtension
              v (chosenInfinitePlaceAbove (L := L) v)
              (chosenInfinitePlaceAbove_comap
                (L := L) v))
    | inr v =>
        exact
          finitePlaceTensorUnitsEquivLocalPlaceBlock
            (K := K) (L := L) v.1
            (chosenFinitePlaceExtension
              (L := L) v.1)
omit [NumberField L] in
 

theorem
    relativeUnrestrictedSPlaceFactorsEquivLocalBlockFamily_smul
    (S : Finset (HeightOneSpectrum (𝓞 K)))
    (σ : L ≃ₐ[K] L)
    (z : RelativeUnrestrictedSPlaceFactors
      (K := K) (L := L) S) :
    relativeUnrestrictedSPlaceFactorsEquivLocalBlockFamily
        (K := K) (L := L) S
        ((relativeUnrestrictedSPlaceFactorsAction
          (K := K) (L := L) S).smul σ z) =
      (localBlockFamilyAction
          (relativeUnrestrictedSPlaceDatum
            (K := K) (L := L) S)).smul σ
        (relativeUnrestrictedSPlaceFactorsEquivLocalBlockFamily
          (K := K) (L := L) S z) := by
  funext i
  cases i with
  | inl v =>
      let u :=
        infinitePlaceAbsoluteValueExtension
          v (chosenInfinitePlaceAbove (L := L) v)
          (chosenInfinitePlaceAbove_comap (L := L) v)
      let :=
        scalarTensorUnitsAction
          (K := K) (L := L) (A := v.Completion)
      let :=
        decompositionGroupLocalUnitsAction
          v.1 v.isNontrivial u
      let : MulDistribMulAction (L ≃ₐ[K] L)
          (LocalPlaceBlock v.1 v.isNontrivial u) :=
        inducedMulDistribMulAction
          (absoluteValueDecompositionGroup K u.1)
      change
        infinitePlaceTensorUnitsEquivLocalPlaceBlock
            (K := K) (L := L) v v.isNontrivial u
            (σ • z (Sum.inl v)) =
          σ •
            infinitePlaceTensorUnitsEquivLocalPlaceBlock
              (K := K) (L := L) v v.isNontrivial u
              (z (Sum.inl v))
      exact
        infinitePlaceTensorUnitsEquivLocalPlaceBlock_smul
          (K := K) (L := L) v v.isNontrivial u
          σ (z (Sum.inl v))
  | inr v =>
      let u := chosenFinitePlaceExtension (L := L) v.1
      let :=
        scalarTensorUnitsAction
          (K := K) (L := L) (A := v.1.adicCompletion K)
      let :=
        decompositionGroupLocalUnitsAction
          (HeightOneSpectrum.adicAbv K v.1)
          (RayClass.adicAbv_isNontrivial v.1) u
      let : MulDistribMulAction (L ≃ₐ[K] L)
          (LocalPlaceBlock
            (HeightOneSpectrum.adicAbv K v.1)
            (RayClass.adicAbv_isNontrivial v.1) u) :=
        inducedMulDistribMulAction
          (absoluteValueDecompositionGroup K u.1)
      change
        finitePlaceTensorUnitsEquivLocalPlaceBlock
            (K := K) (L := L) v.1 u
            (σ • z (Sum.inr v)) =
          σ •
            finitePlaceTensorUnitsEquivLocalPlaceBlock
              (K := K) (L := L) v.1 u
              (z (Sum.inr v))
      exact
        finitePlaceTensorUnitsEquivLocalPlaceBlock_smul
          (K := K) (L := L) v.1 u
          σ (z (Sum.inr v))
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.Idele.Cohomology.SPlaces.Herbrand.Local -/
section
open scoped NumberField BigOperators ValuativeRel Classical NNReal
open NumberField IsDedekindDomain
noncomputable section
open AlgebraicNumberTheory.Valuations
open CyclicCohomology.ProfiniteCohomology.Herbrand
open CyclicCohomology
open HilbertRamification
open LocalClassFieldTheory
open LocalFieldTheory
variable {K L : Type}
    [Field K] [NumberField K]
    [Field L] [NumberField L] [Algebra K L]
    [FiniteDimensional K L] [IsGalois K L]
 


noncomputable def relativeUnrestrictedSPlaceLocalDegree
    (S : Finset (HeightOneSpectrum (𝓞 K))) :
    RelativeUnrestrictedSPlaceIndex (K := K) S → ℕ :=
  fun i =>
    Nat.card
      (absoluteValueDecompositionGroup K
        ((relativeUnrestrictedSPlaceDatum
          (K := K) (L := L) S i).extension.1))
omit [NumberField K] [NumberField L] in
 

theorem absoluteValueDecompositionGroup_card_eq_localizedDegree
    (vK : AbsoluteValue K ℝ) (hvK : vK.IsNontrivial)
    (w : AbsoluteValueExtension vK L) :
    letI hK :=
      AbsoluteValue.extensionCompletionAlgebra
        (K := K) w.1
    letI : SMul K w.1.Completion := hK.toSMul
    letI : Algebra vK.Completion w.1.Completion :=
      AbsoluteValue.completionAlgebra vK w.1 w.2
    letI := localizedCompletionGlobalAlgebra vK w
    letI := localizedCompletionIsScalarTower vK w
    letI : FiniteDimensional vK.Completion
        (LocalizedCompletion vK w) :=
      localizedCompletionModuleFinite vK hvK w
    letI : IsGalois vK.Completion
        (LocalizedCompletion vK w) :=
      HilbertRamification.algebraicLocalization_isGalois vK w
    Nat.card (absoluteValueDecompositionGroup K w.1) =
      Module.finrank vK.Completion
        (LocalizedCompletion vK w) := by
  let hK :=
    AbsoluteValue.extensionCompletionAlgebra
      (K := K) w.1
  let : SMul K w.1.Completion := hK.toSMul
  let : Algebra vK.Completion w.1.Completion :=
    AbsoluteValue.completionAlgebra vK w.1 w.2
  let := localizedCompletionGlobalAlgebra vK w
  let := localizedCompletionIsScalarTower vK w
  let : FiniteDimensional vK.Completion
      (LocalizedCompletion vK w) :=
    localizedCompletionModuleFinite vK hvK w
  let : IsGalois vK.Completion
      (LocalizedCompletion vK w) :=
    HilbertRamification.algebraicLocalization_isGalois vK w
  calc
    Nat.card (absoluteValueDecompositionGroup K w.1) =
        Nat.card
          (LocalizedCompletion vK w ≃ₐ[vK.Completion]
            LocalizedCompletion vK w) :=
      Nat.card_congr
        (decompositionGroupEquivAlgebraicLocalizationAut
          vK hvK w).toEquiv
    _ = Module.finrank vK.Completion
        (LocalizedCompletion vK w) :=
      IsGalois.card_aut_eq_finrank
        vK.Completion (LocalizedCompletion vK w)
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.Idele.Cohomology.SPlaces.Herbrand.Factors -/
section
open scoped NumberField BigOperators ValuativeRel Classical NNReal
open NumberField IsDedekindDomain
noncomputable section
open AlgebraicNumberTheory.Valuations
open CyclicCohomology.ProfiniteCohomology.Herbrand
open CyclicCohomology
open HilbertRamification
open LocalClassFieldTheory
open LocalFieldTheory
variable {K L : Type}
    [Field K] [NumberField K]
    [Field L] [NumberField L] [Algebra K L]
    [FiniteDimensional K L] [IsGalois K L]
omit [NumberField L] in
private noncomputable abbrev
    relativeUnrestrictedSPlaceFactorsActionProvider
    (S : Finset (HeightOneSpectrum (𝓞 K))) :
    MulDistribMulAction (L ≃ₐ[K] L)
      (RelativeUnrestrictedSPlaceFactors
        (K := K) (L := L) S) :=
  relativeUnrestrictedSPlaceFactorsAction
    (K := K) (L := L) S
omit [NumberField L] in
private noncomputable abbrev
    relativeUnrestrictedSPlaceLocalBlockFamilyActionProvider
    (S : Finset (HeightOneSpectrum (𝓞 K))) :
    MulDistribMulAction (L ≃ₐ[K] L)
      (LocalBlockFamily
        (relativeUnrestrictedSPlaceDatum
          (K := K) (L := L) S)) :=
  localBlockFamilyAction
    (relativeUnrestrictedSPlaceDatum
      (K := K) (L := L) S)
omit [NumberField L] in
 


noncomputable def
    relativeUnrestrictedSPlaceFactorsHerbrandH0EquivLocalBlockFamily
    (S : Finset (HeightOneSpectrum (𝓞 K))) :
    @HerbrandH0 (L ≃ₐ[K] L)
        (RelativeUnrestrictedSPlaceFactors
          (K := K) (L := L) S)
        _ _ _
        (relativeUnrestrictedSPlaceFactorsAction
          (K := K) (L := L) S) ≃*
      @HerbrandH0 (L ≃ₐ[K] L)
        (LocalBlockFamily
          (relativeUnrestrictedSPlaceDatum
            (K := K) (L := L) S))
        _ _ _
        (localBlockFamilyAction
          (relativeUnrestrictedSPlaceDatum
            (K := K) (L := L) S)) := by
  let d :=
    relativeUnrestrictedSPlaceDatum
      (K := K) (L := L) S
  letI sourceAction :=
    relativeUnrestrictedSPlaceFactorsActionProvider
      (K := K) (L := L) S
  letI targetAction :=
    relativeUnrestrictedSPlaceLocalBlockFamilyActionProvider
      (K := K) (L := L) S
  exact
    herbrandH0EquivariantMulEquiv
      (relativeUnrestrictedSPlaceFactorsEquivLocalBlockFamily
        (K := K) (L := L) S)
      (relativeUnrestrictedSPlaceFactorsEquivLocalBlockFamily_smul
        (K := K) (L := L) S)
end
end

/- ClassFieldTheory.AlgebraicNumberTheory.Ramification.Splitting.FinitePlaceIdeal -/
section
open scoped NumberField Classical
open NumberField IsDedekindDomain
noncomputable section
open AlgebraicNumberTheory.Valuations
open HilbertRamification
variable
    {K L : Type}
    [Field K] [NumberField K]
    [Field L] [NumberField L] [Algebra K L]
    [FiniteDimensional K L] [IsGalois K L]
omit [FiniteDimensional K L] [IsGalois K L] in
 

theorem absoluteValueDecompositionGroup_eq_finitePlaceStabilizer
    (v : HeightOneSpectrum (𝓞 K))
    (w : AbsoluteValueExtension
      (HeightOneSpectrum.adicAbv K v) L) :
    letI := finitePlaceMulAction K L
    absoluteValueDecompositionGroup K w.1 =
      MulAction.stabilizer (L ≃ₐ[K] L)
        (finitePlaceExtensionCentre (K := K) (L := L) v w) := by
  let := finitePlaceMulAction K L
  ext σ
  rw [mem_absoluteValueDecompositionGroup_iff_extensionConjugate_eq
      (HeightOneSpectrum.adicAbv K v)
      (RayClass.adicAbv_isNontrivial v) w σ]
  simp only [MulAction.mem_stabilizer_iff]
  change
    absoluteValueExtensionConjugate
        (HeightOneSpectrum.adicAbv K v) w σ = w ↔
      finitePlaceEquiv K L σ
          (finitePlaceExtensionCentre (K := K) (L := L) v w) =
        finitePlaceExtensionCentre (K := K) (L := L) v w
  constructor
  · intro h
    have hc := congrArg
      (finitePlaceExtensionCentre (K := K) (L := L) v) h
    rw [finitePlaceExtensionCentre_conjugate] at hc
    calc
      finitePlaceEquiv K L σ
          (finitePlaceExtensionCentre (K := K) (L := L) v w) =
          finitePlaceEquiv K L σ
            (finitePlaceEquiv K L σ⁻¹
              (finitePlaceExtensionCentre (K := K) (L := L) v w)) :=
        congrArg (finitePlaceEquiv K L σ) hc.symm
      _ = finitePlaceExtensionCentre (K := K) (L := L) v w := by
        rw [← finitePlaceEquiv_mul]
        simp
  · intro h
    apply finitePlaceExtensionCentre_injective
      (K := K) (L := L) v
    rw [finitePlaceExtensionCentre_conjugate]
    calc
      finitePlaceEquiv K L σ⁻¹
          (finitePlaceExtensionCentre (K := K) (L := L) v w) =
          finitePlaceEquiv K L σ⁻¹
            (finitePlaceEquiv K L σ
              (finitePlaceExtensionCentre (K := K) (L := L) v w)) :=
        congrArg (finitePlaceEquiv K L σ⁻¹) h.symm
      _ = finitePlaceExtensionCentre (K := K) (L := L) v w := by
        rw [← finitePlaceEquiv_mul]
        simp
omit [FiniteDimensional K L] [IsGalois K L] in
 

theorem finite_finitePlaceBelow_fibre
    (v : HeightOneSpectrum (𝓞 K)) :
    Set.Finite
      {W : HeightOneSpectrum (𝓞 L) |
        finitePlaceBelow (K := K) W = v} := by
  apply Set.Finite.of_finite_image
  · apply
      (Algebra.QuasiFinite.finite_primesOver
        (R := 𝓞 K) (S := 𝓞 L) v.asIdeal).subset
    rintro I ⟨W, hW, rfl⟩
    exact
      ⟨W.isPrime, ⟨(congrArg HeightOneSpectrum.asIdeal hW).symm⟩⟩
  · intro W₁ _ W₂ _ h
    apply HeightOneSpectrum.ext
    exact h
omit [FiniteDimensional K L] [IsGalois K L] in
 

theorem Set.Finite.preimage_finitePlaceBelow
    {S : Set (HeightOneSpectrum (𝓞 K))}
    (hS : S.Finite) :
    {W : HeightOneSpectrum (𝓞 L) |
      finitePlaceBelow (K := K) W ∈ S}.Finite := by
  show
    ((finitePlaceBelow (K := K)) ⁻¹' S).Finite
  exact hS.preimage'
    (fun v _ => finite_finitePlaceBelow_fibre
      (K := K) (L := L) v)
section IntermediateField
variable {M : Type}
    [Field M] [NumberField M]
    [Algebra K M] [Algebra M L]
    [IsScalarTower K M L]
    [IsGalois M L]
end IntermediateField
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
 

noncomputable def finitePlacesAbove
    (S : Finset (HeightOneSpectrum (𝓞 K))) :
    Finset (HeightOneSpectrum (𝓞 L)) :=
  (Set.Finite.preimage_finitePlaceBelow
    (K := K) (L := L) S.finite_toSet).toFinset
omit [FiniteDimensional K L] [IsGalois K L] in
@[simp]
theorem mem_finitePlacesAbove_iff
    (S : Finset (HeightOneSpectrum (𝓞 K)))
    (W : HeightOneSpectrum (𝓞 L)) :
    W ∈ finitePlacesAbove (K := K) (L := L) S ↔
      finitePlaceBelow (K := K) W ∈ S := by
  simp [finitePlacesAbove]
omit [FiniteDimensional K L] [IsGalois K L] in
 

@[simp]
theorem finitePlaceBelow_finitePlaceEquiv
    (σ : L ≃ₐ[K] L)
    (W : HeightOneSpectrum (𝓞 L)) :
    finitePlaceBelow (K := K) (finitePlaceEquiv K L σ W) =
      finitePlaceBelow (K := K) W := by
  apply HeightOneSpectrum.ext
  rw [finitePlaceBelow_asIdeal, finitePlaceBelow_asIdeal,
    finitePlaceEquiv_asIdeal]
  ext x
  rw [Ideal.mem_under, Ideal.mem_under]
  have hfix :
      NumberField.RingOfIntegers.mapAlgEquiv σ
          (algebraMap (𝓞 K) (𝓞 L) x) =
        algebraMap (𝓞 K) (𝓞 L) x := by
    apply NumberField.RingOfIntegers.ext
    exact σ.commutes (x : K)
  conv_lhs => rw [← hfix]
  exact
    (Ideal.apply_mem_of_equiv_iff
      (I := W.asIdeal)
      (f :=
        (NumberField.RingOfIntegers.mapAlgEquiv σ).toRingEquiv)
      (x := algebraMap (𝓞 K) (𝓞 L) x))
omit [FiniteDimensional K L] [IsGalois K L] in
 

theorem finitePlacesAbove_isGaloisStable
    (S : Finset (HeightOneSpectrum (𝓞 K))) :
    IsGaloisStableFinitePlaces K L
      (finitePlacesAbove (K := K) (L := L) S) := by
  intro σ W
  simp only [mem_finitePlacesAbove_iff]
  change
    finitePlaceBelow (K := K) W ∈ S ↔
      finitePlaceBelow (K := K)
        (finitePlaceEquiv K L σ W) ∈ S
  rw [finitePlaceBelow_finitePlaceEquiv]
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
end LogarithmicQuotient
section DiagonalExtension
end DiagonalExtension
section LogLatticeHerbrand
end LogLatticeHerbrand
section ActualSUnitHerbrand
end ActualSUnitHerbrand
section LocalDegreeInterpretation
omit [NumberField K] [NumberField L] in
 

theorem finitePlace_stabilizer_eq_idealStabilizer
    (P : HeightOneSpectrum (𝓞 L)) :
    letI _finitePlaceAction :=
      finitePlaceMulAction K L
    MulAction.stabilizer (L ≃ₐ[K] L) P =
      MulAction.stabilizer (L ≃ₐ[K] L) P.asIdeal := by
  let finitePlaceAction :=
    finitePlaceMulAction K L
  ext σ
  simp only [MulAction.mem_stabilizer_iff]
  change
    finitePlaceEquiv K L σ P = P ↔
      σ • P.asIdeal = P.asIdeal
  rw [HeightOneSpectrum.ext_iff,
    finitePlaceEquiv_asIdeal,
    Ideal.pointwise_smul_def]
  change
    Ideal.map
          (NumberField.RingOfIntegers.mapAlgEquiv
            σ).toRingEquiv.toRingHom P.asIdeal =
        P.asIdeal ↔
      Ideal.map
          (MulSemiringAction.toRingHom
            (L ≃ₐ[K] L) (𝓞 L) σ) P.asIdeal =
        P.asIdeal
  have hhom :
      (NumberField.RingOfIntegers.mapAlgEquiv
          σ).toRingEquiv.toRingHom =
        MulSemiringAction.toRingHom
          (L ≃ₐ[K] L) (𝓞 L) σ := by
    ext x
    rfl
  rw [hhom]
 


noncomputable def finiteLogPlaceLocalDegree
    (P : HeightOneSpectrum (𝓞 L)) : ℕ :=
  let p := P.asIdeal.under (𝓞 K)
  p.ramificationIdxIn (𝓞 L) *
    p.inertiaDegIn (𝓞 L)
 

theorem finitePlace_stabilizer_card_eq_localDegree
    [IsGalois K L]
    (P : HeightOneSpectrum (𝓞 L)) :
    letI _finitePlaceAction :=
      finitePlaceMulAction K L
    Nat.card
        (MulAction.stabilizer (L ≃ₐ[K] L) P) =
      finiteLogPlaceLocalDegree K L P := by
  let finitePlaceAction :=
    finitePlaceMulAction K L
  rw [finitePlace_stabilizer_eq_idealStabilizer K L P]
  unfold finiteLogPlaceLocalDegree
  let p := P.asIdeal.under (𝓞 K)
  have hp : p ≠ ⊥ :=
    Ideal.under_ne_bot (𝓞 K) P.ne_bot
  let quotientFinite : Finite ((𝓞 K) ⧸ p) :=
    Ring.HasFiniteQuotients.finiteQuotient hp
  let residueFinite : Finite p.ResidueField :=
    inferInstance
  let residuePerfect : PerfectField p.ResidueField :=
    inferInstance
  exact
    Ideal.card_stabilizer_eq p P.asIdeal
 

theorem stableFinitePlace_stabilizer_card_eq_localDegree
    [IsGalois K L]
    {S : Finset (HeightOneSpectrum (𝓞 L))}
    (hS : IsGaloisStableFinitePlaces K L S)
    (v : S) :
    letI _stableAction :=
      stableFinitePlaceMulAction K L S hS
    Nat.card
        (MulAction.stabilizer (L ≃ₐ[K] L) v) =
      finiteLogPlaceLocalDegree K L v := by
  let stableAction :=
    stableFinitePlaceMulAction K L S hS
  let finitePlaceAction :=
    finitePlaceMulAction K L
  rw [show
    MulAction.stabilizer (L ≃ₐ[K] L) v =
        MulAction.stabilizer
          (L ≃ₐ[K] L)
          (v : HeightOneSpectrum (𝓞 L)) by
      ext σ
      simp only [MulAction.mem_stabilizer_iff]
      change
        (⟨finitePlaceEquiv K L σ v, _⟩ : S) = v ↔
          finitePlaceEquiv K L σ v = v
      exact Subtype.ext_iff]
  exact
    finitePlace_stabilizer_card_eq_localDegree
      K L v
 


noncomputable def logPlaceLocalDegree
    (S : Finset (HeightOneSpectrum (𝓞 L)))
    (q : SUnitGroup.LogPlace (K := L) S) : ℕ :=
  match q with
  | Sum.inl w =>
      if NumberField.InfinitePlace.IsUnramified K w
      then 1 else 2
  | Sum.inr v =>
      finiteLogPlaceLocalDegree K L v
 

theorem logPlace_stabilizer_card_eq_localDegree
    [IsGalois K L]
    {S : Finset (HeightOneSpectrum (𝓞 L))}
    (hS : IsGaloisStableFinitePlaces K L S)
    (q : SUnitGroup.LogPlace (K := L) S) :
    letI _logPlaceAction :=
      logPlaceMulAction K L S hS
    Nat.card
        (MulAction.stabilizer (L ≃ₐ[K] L) q) =
      logPlaceLocalDegree K L S q := by
  let stableAction :=
    stableFinitePlaceMulAction K L S hS
  let logPlaceAction :=
    logPlaceMulAction K L S hS
  cases q with
  | inl w =>
      unfold logPlaceLocalDegree
      rw [show
        MulAction.stabilizer
              (L ≃ₐ[K] L)
              (Sum.inl w :
                SUnitGroup.LogPlace (K := L) S) =
            MulAction.stabilizer (L ≃ₐ[K] L) w by
          ext σ
          simp only [MulAction.mem_stabilizer_iff]
          change Sum.inl (σ • w) = Sum.inl w ↔
            σ • w = w
          simp]
      exact
        NumberField.InfinitePlace.card_stabilizer
  | inr v =>
      unfold logPlaceLocalDegree
      rw [show
        MulAction.stabilizer
              (L ≃ₐ[K] L)
              (Sum.inr v :
                SUnitGroup.LogPlace (K := L) S) =
            MulAction.stabilizer (L ≃ₐ[K] L) v by
          ext σ
          simp only [MulAction.mem_stabilizer_iff]
          change Sum.inr (σ • v) = Sum.inr v ↔
            σ • v = v
          simp]
      exact
        stableFinitePlace_stabilizer_card_eq_localDegree
          K L hS v
 

theorem permutationOrbitStabilizer_card_eq_logPlaceLocalDegree
    [IsGalois K L]
    {S : Finset (HeightOneSpectrum (𝓞 L))}
    (hS : IsGaloisStableFinitePlaces K L S) :
    let ρ :=
      logPlacePermutationHom K L S hS
    letI _indexAction :
        MulAction (L ≃ₐ[K] L)
          (SUnitGroup.LogPlace (K := L) S) :=
      permutationMulAction ρ
    ∀ ω :
        MulAction.orbitRel.Quotient
          (L ≃ₐ[K] L)
          (SUnitGroup.LogPlace (K := L) S),
      Nat.card (permutationOrbitStabilizer ω) =
        logPlaceLocalDegree K L S ω.out := by
  dsimp only
  intro ω
  exact
    logPlace_stabilizer_card_eq_localDegree
      K L hS ω.out
end LocalDegreeInterpretation
end
end

/- ClassFieldTheory.GlobalClassFieldTheory.Cohomology.IdeleClassHerbrandSupportedFinal -/
section
open scoped Classical NumberField TensorProduct
open NumberField IsDedekindDomain
noncomputable section
namespace GlobalClassFieldTheory
namespace Cohomology
open CyclicCohomology.ProfiniteCohomology.Herbrand
open CyclicCohomology
open AlgebraicNumberTheory.Valuations
open HilbertRamification
open LocalClassFieldTheory
variable
    {K L : Type}
    [Field K] [NumberField K]
    [Field L] [NumberField L] [Algebra K L]
    [FiniteDimensional K L] [IsGalois K L]
 


noncomputable abbrev aboveSLogPlaceMulAction
    (S : Finset (HeightOneSpectrum (𝓞 K))) :
    MulAction (L ≃ₐ[K] L)
      (SUnitGroup.LogPlace
        (K := L)
        (finitePlacesAbove (K := K) (L := L) S)) :=
  permutationMulAction
    (logPlacePermutationHom K L
      (finitePlacesAbove (K := K) (L := L) S)
      (finitePlacesAbove_isGaloisStable
        (K := K) (L := L) S))
 

noncomputable def logPlaceBelowRelativeUnrestrictedIndex
    (S : Finset (HeightOneSpectrum (𝓞 K))) :
    SUnitGroup.LogPlace
        (K := L)
        (finitePlacesAbove (K := K) (L := L) S) →
      RelativeUnrestrictedSPlaceIndex (K := K) S
  | Sum.inl W =>
      Sum.inl (W.comap (algebraMap K L))
  | Sum.inr W =>
      Sum.inr
        ⟨finitePlaceBelow (K := K) W.1,
          (mem_finitePlacesAbove_iff
            (K := K) (L := L) S W.1).1 W.2⟩
omit [FiniteDimensional K L] [IsGalois K L] in
 

theorem logPlaceBelowRelativeUnrestrictedIndex_smul
    (S : Finset (HeightOneSpectrum (𝓞 K)))
    (σ : L ≃ₐ[K] L)
    (q :
      SUnitGroup.LogPlace
        (K := L)
        (finitePlacesAbove (K := K) (L := L) S)) :
    letI :=
      aboveSLogPlaceMulAction
        (K := K) (L := L) S
    logPlaceBelowRelativeUnrestrictedIndex
        (K := K) (L := L) S (σ • q) =
      logPlaceBelowRelativeUnrestrictedIndex
        (K := K) (L := L) S q := by
  let logAction :=
    aboveSLogPlaceMulAction
      (K := K) (L := L) S
  cases q with
  | inl W =>
      change
        logPlaceBelowRelativeUnrestrictedIndex
            (K := K) (L := L) S
            (logPlacePermutationHom K L
              (finitePlacesAbove (K := K) (L := L) S)
              (finitePlacesAbove_isGaloisStable
                (K := K) (L := L) S) σ (Sum.inl W)) =
          logPlaceBelowRelativeUnrestrictedIndex
            (K := K) (L := L) S (Sum.inl W)
      rw [logPlacePermutationHom_apply]
      change
        Sum.inl ((σ • W).comap (algebraMap K L)) =
          Sum.inl (W.comap (algebraMap K L))
      congr 1
      rw [NumberField.InfinitePlace.comap_smul]
      congr 1
      ext x
      exact σ.symm.commutes x
  | inr W =>
      change
        logPlaceBelowRelativeUnrestrictedIndex
            (K := K) (L := L) S
            (logPlacePermutationHom K L
              (finitePlacesAbove (K := K) (L := L) S)
              (finitePlacesAbove_isGaloisStable
                (K := K) (L := L) S) σ (Sum.inr W)) =
          logPlaceBelowRelativeUnrestrictedIndex
            (K := K) (L := L) S (Sum.inr W)
      rw [logPlacePermutationHom_apply]
      change
        Sum.inr
            (⟨finitePlaceBelow (K := K)
                (finitePlaceEquiv K L σ W.1), _⟩ :
              {v : HeightOneSpectrum (𝓞 K) // v ∈ S}) =
          Sum.inr
            (⟨finitePlaceBelow (K := K) W.1, _⟩ :
              {v : HeightOneSpectrum (𝓞 K) // v ∈ S})
      congr 1
      apply Subtype.ext
      exact
        finitePlaceBelow_finitePlaceEquiv
          (K := K) (L := L) σ W.1
 
noncomputable def logPlaceOrbitBelowRelativeUnrestrictedIndex
    (S : Finset (HeightOneSpectrum (𝓞 K))) :
    letI :=
      aboveSLogPlaceMulAction
        (K := K) (L := L) S
    MulAction.orbitRel.Quotient
        (L ≃ₐ[K] L)
        (SUnitGroup.LogPlace
          (K := L)
          (finitePlacesAbove (K := K) (L := L) S)) →
      RelativeUnrestrictedSPlaceIndex (K := K) S := by
  letI logAction :=
    aboveSLogPlaceMulAction
      (K := K) (L := L) S
  exact
    Quotient.lift
      (logPlaceBelowRelativeUnrestrictedIndex
        (K := K) (L := L) S)
      (by
        intro a b hab
        rcases hab with ⟨σ, hσ⟩
        rw [← hσ]
        exact
          logPlaceBelowRelativeUnrestrictedIndex_smul
            (K := K) (L := L) S σ b)
 


noncomputable def
    logPlaceOrbitEquivRelativeUnrestrictedSPlaceIndex
    (S : Finset (HeightOneSpectrum (𝓞 K))) :
    letI :=
      aboveSLogPlaceMulAction
        (K := K) (L := L) S
    MulAction.orbitRel.Quotient
        (L ≃ₐ[K] L)
        (SUnitGroup.LogPlace
          (K := L)
          (finitePlacesAbove (K := K) (L := L) S)) ≃
      RelativeUnrestrictedSPlaceIndex (K := K) S := by
  letI stableFiniteAction :=
    stableFinitePlaceMulAction K L
      (finitePlacesAbove (K := K) (L := L) S)
      (finitePlacesAbove_isGaloisStable
        (K := K) (L := L) S)
  letI logAction :=
    aboveSLogPlaceMulAction
      (K := K) (L := L) S
  let f :=
    logPlaceOrbitBelowRelativeUnrestrictedIndex
      (K := K) (L := L) S
  apply Equiv.ofBijective f
  constructor
  · intro x y hxy
    induction x using Quotient.inductionOn' with
    | _ a =>
      induction y using Quotient.inductionOn' with
      | _ b =>
        apply @Quotient.sound _ (MulAction.orbitRel (L ≃ₐ[K] L) _) a b
        apply (MulAction.orbitRel_apply (G:=L ≃ₐ[K] L)).mpr
        cases a with
        | inl W₁ =>
            cases b with
            | inl W₂ =>
                have hbelow :
                    W₁.comap (algebraMap K L) =
                      W₂.comap (algebraMap K L) := by
                  exact Sum.inl.inj hxy
                obtain ⟨σ, hσ⟩ :=
                  NumberField.InfinitePlace.exists_smul_eq_of_comap_eq
                    hbelow
                refine ⟨σ⁻¹, ?_⟩
                change
                  logPlacePermutationHom K L
                      (finitePlacesAbove (K := K) (L := L) S)
                      (finitePlacesAbove_isGaloisStable
                        (K := K) (L := L) S) σ⁻¹
                      (Sum.inl W₂) =
                    Sum.inl W₁
                rw [logPlacePermutationHom_apply]
                change Sum.inl (σ⁻¹ • W₂) = Sum.inl W₁
                rw [← hσ, inv_smul_smul]
            | inr W₂ =>
                change
                  Sum.inl (W₁.comap (algebraMap K L)) =
                    Sum.inr
                      (⟨finitePlaceBelow (K := K) W₂.1, _⟩ :
                        {v : HeightOneSpectrum (𝓞 K) // v ∈ S})
                  at hxy
                exact (Sum.inl_ne_inr hxy).elim
        | inr W₁ =>
            cases b with
            | inl W₂ =>
                change
                  Sum.inr
                      (⟨finitePlaceBelow (K := K) W₁.1, _⟩ :
                        {v : HeightOneSpectrum (𝓞 K) // v ∈ S}) =
                    Sum.inl (W₂.comap (algebraMap K L))
                  at hxy
                exact (Sum.inr_ne_inl hxy).elim
            | inr W₂ =>
                have hbelow :
                    finitePlaceBelow (K := K) W₁.1 =
                      finitePlaceBelow (K := K) W₂.1 := by
                  exact congrArg Subtype.val (Sum.inr.inj hxy)
                let v :=
                  finitePlaceBelow (K := K) W₁.1
                let : Finite (L ≃ₐ[K] L) :=
                  IsGaloisGroup.finite (L ≃ₐ[K] L) K L
                let :
                    IsGaloisGroup
                      (L ≃ₐ[K] L) (𝓞 K) (𝓞 L) :=
                  IsGaloisGroup.of_isFractionRing
                    (L ≃ₐ[K] L) (𝓞 K) (𝓞 L) K L
                let : W₁.1.asIdeal.LiesOver v.asIdeal :=
                  ⟨by
                    simp only [v, finitePlaceBelow_asIdeal]⟩
                let : W₂.1.asIdeal.LiesOver v.asIdeal :=
                  ⟨by
                    have h :=
                      congrArg HeightOneSpectrum.asIdeal hbelow
                    simpa only [v, finitePlaceBelow_asIdeal]
                      using h⟩
                obtain ⟨σ, hσ⟩ :=
                  HilbertRamification.Dedekind.exists_smul_eq_of_isGaloisGroup
                    v.asIdeal W₁.1.asIdeal W₂.1.asIdeal
                    (L ≃ₐ[K] L)
                have hplace :
                    finitePlaceEquiv K L σ W₁.1 = W₂.1 := by
                  apply HeightOneSpectrum.ext
                  rw [finitePlaceEquiv_asIdeal]
                  exact hσ
                have hsubtype : σ • W₁ = W₂ := by
                  apply Subtype.ext
                  exact hplace
                refine ⟨σ⁻¹, ?_⟩
                change
                  logPlacePermutationHom K L
                      (finitePlacesAbove (K := K) (L := L) S)
                      (finitePlacesAbove_isGaloisStable
                        (K := K) (L := L) S) σ⁻¹
                      (Sum.inr W₂) =
                    Sum.inr W₁
                rw [logPlacePermutationHom_apply]
                change Sum.inr (σ⁻¹ • W₂) = Sum.inr W₁
                rw [← hsubtype, inv_smul_smul]
  · intro i
    cases i with
    | inl v =>
        refine
          ⟨Quotient.mk''
              (Sum.inl
                (chosenInfinitePlaceAbove (L := L) v)), ?_⟩
        exact
          congrArg Sum.inl
            (chosenInfinitePlaceAbove_comap
              (L := L) v)
    | inr v =>
        let w :=
          chosenFinitePlaceExtension (L := L) v.1
        let W :=
          finitePlaceExtensionCentre
            (K := K) (L := L) v.1 w
        have hWbelow :
            finitePlaceBelow (K := K) W = v.1 :=
          finitePlaceBelow_finitePlaceExtensionCentre
            (K := K) (L := L) v.1 w
        have hWmem :
            W ∈ finitePlacesAbove
              (K := K) (L := L) S :=
          (mem_finitePlacesAbove_iff
            (K := K) (L := L) S W).2
            (hWbelow ▸ v.2)
        refine
          ⟨Quotient.mk''
              (Sum.inr
                (⟨W, hWmem⟩ :
                  finitePlacesAbove
                    (K := K) (L := L) S)), ?_⟩
        apply congrArg Sum.inr
        apply Subtype.ext
        exact hWbelow
 

theorem
    relativeUnrestrictedSPlaceLocalDegree_logPlaceBelow
    (S : Finset (HeightOneSpectrum (𝓞 K)))
    (q :
      SUnitGroup.LogPlace
        (K := L)
        (finitePlacesAbove (K := K) (L := L) S)) :
    relativeUnrestrictedSPlaceLocalDegree
        (K := K) (L := L) S
        (logPlaceBelowRelativeUnrestrictedIndex
          (K := K) (L := L) S q) =
      logPlaceLocalDegree K L
        (finitePlacesAbove (K := K) (L := L) S) q := by
  cases q with
  | inl W =>
      let W₀ :=
        chosenInfinitePlaceAbove
          (L := L) (W.comap (algebraMap K L))
      change
        Nat.card (absoluteValueDecompositionGroup K W₀.1) =
          if NumberField.InfinitePlace.IsUnramified K W
          then 1 else 2
      rw [
        absoluteValueDecompositionGroup_eq_infinitePlaceStabilizer W₀,
        NumberField.InfinitePlace.card_stabilizer]
      have hcomap :
          W₀.comap (algebraMap K L) =
            W.comap (algebraMap K L) :=
        chosenInfinitePlaceAbove_comap
          (L := L) (W.comap (algebraMap K L))
      obtain ⟨τ, hτ⟩ :=
        NumberField.InfinitePlace.exists_smul_eq_of_comap_eq
          hcomap
      rw [← hτ,
        NumberField.InfinitePlace.isUnramified_smul_iff]
  | inr W =>
      let v :=
        finitePlaceBelow (K := K) W.1
      let w :=
        chosenFinitePlaceExtension (L := L) v
      let W₀ :=
        finitePlaceExtensionCentre
          (K := K) (L := L) v w
      let finiteAction := finitePlaceMulAction K L
      let : Finite (L ≃ₐ[K] L) :=
        IsGaloisGroup.finite (L ≃ₐ[K] L) K L
      let :
          IsGaloisGroup
            (L ≃ₐ[K] L) (𝓞 K) (𝓞 L) :=
        IsGaloisGroup.of_isFractionRing
          (L ≃ₐ[K] L) (𝓞 K) (𝓞 L) K L
      let : W₀.asIdeal.LiesOver v.asIdeal :=
        ⟨(finitePlaceExtensionCentreIdeal_under
          (K := K) (L := L) v w).symm⟩
      let : W.1.asIdeal.LiesOver v.asIdeal :=
        ⟨by
          simp only [v, finitePlaceBelow_asIdeal]⟩
      obtain ⟨τ, hτ⟩ :=
        HilbertRamification.Dedekind.exists_smul_eq_of_isGaloisGroup
          v.asIdeal W₀.asIdeal W.1.asIdeal
          (L ≃ₐ[K] L)
      have hplace :
          finitePlaceEquiv K L τ W₀ = W.1 := by
        apply HeightOneSpectrum.ext
        rw [finitePlaceEquiv_asIdeal]
        exact hτ
      have hcard :
          Nat.card
              (MulAction.stabilizer (L ≃ₐ[K] L) W₀) =
            Nat.card
              (MulAction.stabilizer (L ≃ₐ[K] L) W.1) :=
        Nat.card_congr
          (MulAction.stabilizerEquivStabilizer
            hplace.symm).toEquiv
      change
        Nat.card (absoluteValueDecompositionGroup K w.1) =
          finiteLogPlaceLocalDegree K L W.1
      rw [
        absoluteValueDecompositionGroup_eq_finitePlaceStabilizer
          (K := K) (L := L) v w]
      exact
        hcard.trans
          (finitePlace_stabilizer_card_eq_localDegree
            K L W.1)
 


theorem
    relativeUnrestrictedSPlaceLocalDegree_product_eq_logPlaceOrbitProduct
    (S : Finset (HeightOneSpectrum (𝓞 K))) :
    letI :=
      aboveSLogPlaceMulAction
        (K := K) (L := L) S
    letI :
        Fintype
          (MulAction.orbitRel.Quotient
            (L ≃ₐ[K] L)
            (SUnitGroup.LogPlace
              (K := L)
              (finitePlacesAbove
                (K := K) (L := L) S))) :=
      Fintype.ofFinite _
    (∏ i,
        (relativeUnrestrictedSPlaceLocalDegree
          (K := K) (L := L) S i : ℚ)) =
      ∏ ω :
          MulAction.orbitRel.Quotient
            (L ≃ₐ[K] L)
            (SUnitGroup.LogPlace
              (K := L)
              (finitePlacesAbove
                (K := K) (L := L) S)),
        (logPlaceLocalDegree K L
          (finitePlacesAbove (K := K) (L := L) S)
          ω.out : ℚ) := by
  let logAction :=
    aboveSLogPlaceMulAction
      (K := K) (L := L) S
  let orbitFintype :
      Fintype
        (MulAction.orbitRel.Quotient
          (L ≃ₐ[K] L)
          (SUnitGroup.LogPlace
            (K := L)
            (finitePlacesAbove
              (K := K) (L := L) S))) :=
    Fintype.ofFinite _
  let e :=
    logPlaceOrbitEquivRelativeUnrestrictedSPlaceIndex
      (K := K) (L := L) S
  calc
    (∏ i,
        (relativeUnrestrictedSPlaceLocalDegree
          (K := K) (L := L) S i : ℚ)) =
        ∏ ω,
          (relativeUnrestrictedSPlaceLocalDegree
            (K := K) (L := L) S (e ω) : ℚ) :=
      (e.prod_comp
        (fun i =>
          (relativeUnrestrictedSPlaceLocalDegree
            (K := K) (L := L) S i : ℚ))).symm
    _ =
        ∏ ω :
          MulAction.orbitRel.Quotient
            (L ≃ₐ[K] L)
            (SUnitGroup.LogPlace
              (K := L)
              (finitePlacesAbove
                (K := K) (L := L) S)),
          (logPlaceLocalDegree K L
            (finitePlacesAbove (K := K) (L := L) S)
            ω.out : ℚ) := by
      apply Finset.prod_congr rfl
      intro ω hω
      have he :
          e ω =
            logPlaceBelowRelativeUnrestrictedIndex
              (K := K) (L := L) S ω.out := by
        calc
          e ω = e (Quotient.mk'' ω.out) :=
            congrArg e (Quotient.out_eq' ω).symm
          _ =
              logPlaceBelowRelativeUnrestrictedIndex
                (K := K) (L := L) S ω.out := rfl
      rw [he]
      exact_mod_cast
        relativeUnrestrictedSPlaceLocalDegree_logPlaceBelow
          (K := K) (L := L) S ω.out
end Cohomology
end GlobalClassFieldTheory
end
end

namespace TunnellFiniteSupport
open NumberField IsDedekindDomain
open scoped NumberField TensorProduct Classical
noncomputable section
variable {D N:Type} [Field D] [NumberField D] [Field N] [NumberField N] [Algebra D N] [FiniteDimensional D N] [IsGalois D N]
abbrev V (D:Type) [Field D] [NumberField D] :=HeightOneSpectrum (𝓞 D)
abbrev A (D:Type) [Field D] [NumberField D] :=AdeleRing (𝓞 D) D
abbrev below (w:V N) := finitePlaceBelow (K:=D) w
theorem above {v:V D} {w:V N} : w.asIdeal.LiesOver v.asIdeal ↔ below (D:=D) w=v := by
  constructor
  · rintro ⟨h⟩
    exact HeightOneSpectrum.ext h.symm
  · intro h
    exact ⟨(congrArg HeightOneSpectrum.asIdeal h).symm⟩
end
end TunnellFiniteSupport

namespace TunnellTensorFixed
open NumberField CyclicCohomology CyclicCohomology.ProfiniteCohomology.Herbrand
open scoped TensorProduct Classical
noncomputable section
variable (K L F:Type) [Field K] [NumberField K] [Field L] [Algebra K L] [FiniteDimensional K L] [Field F] [Algebra K F]
def galoisAverage
    (z : (F⊗[K]L)) :
    (F⊗[K]L) :=
  ((Fintype.card (L ≃ₐ[K] L) : K)⁻¹) •
    ∑ σ : L ≃ₐ[K] L, (scalarTensorConjugation (K:=K) (L:=L) (A:=F)) σ z

theorem galoisAverage_eq_of_fixed
    [IsGalois K L]
    (z : (F⊗[K]L))
    (hz : ∀ σ : L ≃ₐ[K] L,
      (scalarTensorConjugation (K:=K) (L:=L) (A:=F)) σ z = z) :
    galoisAverage K L F z = z := by
  rw [galoisAverage]
  simp_rw [hz]
  rw [Finset.sum_const, Finset.card_univ,
    ← Nat.cast_smul_eq_nsmul K, ← mul_smul,
    inv_mul_cancel₀
      (Nat.cast_ne_zero.mpr Fintype.card_ne_zero),
    one_smul]

theorem galoisAverage_tmul
    [IsGalois K L]
    (a : F) (x : L) :
    galoisAverage K L F (a ⊗ₜ[K] x) =
      (algebraMap F (F⊗[K]L))
        (a * algebraMap K
          (F)
          ((Fintype.card (L ≃ₐ[K] L) : K)⁻¹ *
            Algebra.trace K L x)) := by
  rw [galoisAverage]
  simp_rw [scalarTensorConjugation_tmul]
  rw [← TensorProduct.tmul_sum,
    ← trace_eq_sum_automorphisms x]
  change
    ((Fintype.card (L ≃ₐ[K] L) : K)⁻¹) •
        (a ⊗ₜ[K]
          algebraMap K L (Algebra.trace K L x)) =
      (a * algebraMap K
        (F)
        ((Fintype.card (L ≃ₐ[K] L) : K)⁻¹ *
          Algebra.trace K L x)) ⊗ₜ[K] 1
  rw [TensorProduct.smul_tmul',
    Algebra.algebraMap_eq_smul_one]
  rw [← TensorProduct.smul_tmul]
  congr 1
  simp [Algebra.smul_def, map_mul, mul_assoc, mul_comm]

theorem galoisAverage_mem_adeleInclusion_range
    [IsGalois K L]
    (z : (F⊗[K]L)) :
    ∃ a : F,
      (algebraMap F (F⊗[K]L)) a = galoisAverage K L F z := by
  induction z using TensorProduct.induction_on with
  | zero =>
      refine ⟨0, ?_⟩
      simp [galoisAverage]
  | tmul a x =>
      refine ⟨a * algebraMap K
        (F)
        ((Fintype.card (L ≃ₐ[K] L) : K)⁻¹ *
          Algebra.trace K L x), ?_⟩
      exact (galoisAverage_tmul K L F a x).symm
  | add x y hx hy =>
      obtain ⟨a, ha⟩ := hx
      obtain ⟨b, hb⟩ := hy
      refine ⟨a + b, ?_⟩
      rw [map_add, ha, hb]
      simp [galoisAverage, Finset.sum_add_distrib,
        smul_add]

theorem exists_adele_eq_of_galois_fixed
    [IsGalois K L]
    (z : (F⊗[K]L))
    (hz : ∀ σ : L ≃ₐ[K] L,
      (scalarTensorConjugation (K:=K) (L:=L) (A:=F)) σ z = z) :
    ∃ a : F,
      (algebraMap F (F⊗[K]L)) a = z := by
  obtain ⟨a, ha⟩ :=
    galoisAverage_mem_adeleInclusion_range K L F z
  exact ⟨a, ha.trans (galoisAverage_eq_of_fixed K L F z hz)⟩

variable [IsGalois K L]
local instance : MulDistribMulAction Gal(L/K) (F⊗[K]L)ˣ := scalarTensorUnitsAction
theorem fixed_range :
    (Units.map (algebraMap F (F⊗[K]L)).toMonoidHom).range = fixedSubgroup Gal(L/K) (F⊗[K]L)ˣ := by
  let e:=algebraMap F (F⊗[K]L)
  have he:=e.injective
  ext x
  constructor
  · rintro ⟨u,rfl⟩ s
    apply Units.ext
    exact (scalarTensorConjugation (K:=K) (L:=L) (A:=F) s).commutes u.val
  · intro hx
    obtain ⟨b,hb⟩:=exists_adele_eq_of_galois_fixed K L F (x:F⊗[K]L)
      (fun s=>congrArg Units.val (hx s))
    have h0:b≠0:=by intro h; rw [h,map_zero] at hb; exact x.ne_zero hb.symm
    exact ⟨Units.mk0 b h0,Units.ext hb⟩
theorem tensor_norm (z:(F⊗[K]L)ˣ) :
    Units.map (algebraMap F (F⊗[K]L)).toMonoidHom (Units.map (Algebra.norm F (S:=F⊗[K]L)) z) =
      tateNormHom (G:=Gal(L/K)) (A:=(F⊗[K]L)ˣ) z := by
  apply Units.ext
  change algebraMap F (F⊗[K]L) (Algebra.norm F z.val)=
    Units.coeHom (F⊗[K]L) (∏s:Gal(L/K),s • z)
  rw [map_prod]
  apply (RelativeIdeleGroup.includeLeft_norm_eq_prod_scalarConjugations F z.val).trans
  apply Finset.prod_congr rfl
  intro s _
  have eq : RelativeIdeleGroup.scalarConjugation F s = scalarTensorConjugation (A:=F) s :=by
    apply AlgHom.ext
    intro x
    induction x using TensorProduct.induction_on with
    | zero => simp
    | tmul a b => rfl
    | add x y hx hy => simp [hx,hy]
  exact congrArg (fun e=>e z.val) eq
theorem index :
    Nat.card (HerbrandH0 Gal(L/K) (F⊗[K]L)ˣ) = (Units.map (Algebra.norm F (S:=F⊗[K]L))).range.index :=by
  let ι:=Units.map (algebraMap F (F⊗[K]L)).toMonoidHom
  let n:=Units.map (Algebra.norm F (S:=F⊗[K]L))
  have hi:Function.Injective ι:=Units.map_injective (algebraMap F (F⊗[K]L)).injective
  have hom:ι.comp n=tateNormHom (G:=Gal(L/K)) (A:=(F⊗[K]L)ˣ):=MonoidHom.ext (tensor_norm K L F)
  change (tateNormHom (G:=Gal(L/K)) (A:=(F⊗[K]L)ˣ)).range.relIndex (fixedSubgroup Gal(L/K) (F⊗[K]L)ˣ)=_
  rw [←hom,MonoidHom.range_comp,←fixed_range]
  change (n.range.map ι).relIndex ι.range=_
  rw [MonoidHom.range_eq_map ι,Subgroup.relIndex_map_map_of_injective _ _ hi,Subgroup.relIndex_top_right]
end
end TunnellTensorFixed

namespace TunnellLocalDetProduct
open CyclicCohomology CyclicCohomology.ProfiniteCohomology.Herbrand
open GlobalClassFieldTheory.Cohomology
open NumberField IsDedekindDomain
open scoped Classical NumberField TensorProduct
noncomputable section
variable {D N:Type} [Field D] [NumberField D] [Field N] [NumberField N] [Algebra D N] [FiniteDimensional D N] [IsGalois D N]
abbrev determinant (D N F:Type) [Field D] [Field N] [Algebra D N] [Field F] [Algebra D F] :=
  (Units.map (Algebra.norm F (S:=F⊗[D]N))).range.index
theorem product (R:Finset (HeightOneSpectrum (𝓞 D))) :
    letI:=relativeUnrestrictedSPlaceFactorsAction (K:=D) (L:=N) R
    Nat.card (HerbrandH0 Gal(N/D) (RelativeUnrestrictedSPlaceFactors (K:=D) (L:=N) R)) =
      (∏w:InfinitePlace D,determinant D N w.Completion)*∏v:↥R,determinant D N (v.val.adicCompletion D) :=by
  let G:=Gal(N/D)
  let I:=RelativeUnrestrictedSPlaceIndex (K:=D) R
  let M:=RelativeUnrestrictedSPlaceFactor (K:=D) (L:=N) R
  letI acts : ∀i:I,MulDistribMulAction G (M i) := fun i=>by
    cases i with
    | inl w=>exact scalarTensorUnitsAction (K:=D) (L:=N) (A:=w.Completion)
    | inr v=>exact scalarTensorUnitsAction (K:=D) (L:=N) (A:=v.val.adicCompletion D)
  rw [Nat.card_congr (herbrandH0PiEquiv (G:=G) M).toEquiv,Nat.card_pi,Fintype.prod_sum_type]
  congr 1
  · apply Finset.prod_congr rfl
    intro w _
    exact TunnellTensorFixed.index D N w.Completion
  · apply Finset.prod_congr rfl
    intro v _
    exact TunnellTensorFixed.index D N (v.val.adicCompletion D)
end
end TunnellLocalDetProduct

namespace TunnellFieldNormPlaces
open NumberField IsDedekindDomain TunnellLocalDetProduct
open CyclicCohomology CyclicCohomology.ProfiniteCohomology.Herbrand
open GlobalClassFieldTheory.Cohomology LocalClassFieldTheory
open AlgebraicNumberTheory.Valuations ValuationTheory.Completion HilbertRamification LocalFieldTheory
open scoped Classical NumberField TensorProduct ValuativeRel NNReal
noncomputable section
variable {k ell : Type} [Field k] [Field ell] [Algebra k ell] [FiniteDimensional k ell] [IsGalois k ell]
set_option maxHeartbeats 1200000 in
theorem local_card (hyp:OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H2_R1_H3_R1_H2_R1_H2_R1.H1)
    (vK : AbsoluteValue k ℝ) (hvK : vK.IsNontrivial)
    (w : AbsoluteValueExtension vK ell)
    (σ : ell ≃ₐ[k] ell)
    (hgen : ∀ τ : ell ≃ₐ[k] ell,
      τ ∈ Subgroup.zpowers σ)
    [ValuativeRel vK.Completion]
    [IsNonarchimedeanLocalField vK.Completion] :
    letI hK :=
      AbsoluteValue.extensionCompletionAlgebra
        (K := k) w.1
    letI : SMul k w.1.Completion := hK.toSMul
    letI : Algebra vK.Completion w.1.Completion :=
      AbsoluteValue.completionAlgebra vK w.1 w.2
    letI := localizedCompletionGlobalAlgebra vK w
    letI := localizedCompletionIsScalarTower vK w
    letI : FiniteDimensional vK.Completion
        (LocalizedCompletion vK w) :=
      localizedCompletionModuleFinite vK hvK w
    letI : IsGalois vK.Completion
        (LocalizedCompletion vK w) :=
      HilbertRamification.algebraicLocalization_isGalois vK w
    letI : Fintype (absoluteValueDecompositionGroup k w.1) :=
      Fintype.ofFinite _
    letI :=
      decompositionGroupLocalUnitsAction vK hvK w
    Nat.card
        (HerbrandH0
          (absoluteValueDecompositionGroup k w.1)
          (LocalizedCompletion vK w)ˣ) =
      Module.finrank vK.Completion
        (LocalizedCompletion vK w) := by
  letI := localizedCompletionBaseAlgebra vK w
  letI := localizedCompletionGlobalAlgebra vK w
  letI := localizedCompletionIsScalarTower vK w
  letI : FiniteDimensional vK.Completion (LocalizedCompletion vK w):=localizedCompletionFiniteDimensional vK hvK w
  letI : IsGalois vK.Completion (LocalizedCompletion vK w):=localizedCompletionIsGalois vK w
  letI : IsCyclic Gal((LocalizedCompletion vK w)/vK.Completion):=⟨⟨_,localizedCompletionGaloisGenerator_generates vK hvK w σ hgen⟩⟩
  let e:=localHerbrandH0EquivNormQuotient vK hvK w
  exact (Nat.card_congr e.toEquiv).trans (hyp vK.Completion (LocalizedCompletion vK w))

variable {K L : Type} [Field K] [NumberField K] [Field L] [NumberField L] [Algebra K L] [FiniteDimensional K L] [IsGalois K L]
set_option maxHeartbeats 1200000 in
theorem component (hyp:OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H2_R1_H3_R1_H2_R1_H2_R1.H1)
    (S : Finset (HeightOneSpectrum (𝓞 K)))
    (i : RelativeUnrestrictedSPlaceIndex (K := K) S)
    (σ : L ≃ₐ[K] L)
    (hgen : ∀ τ : L ≃ₐ[K] L,
      τ ∈ Subgroup.zpowers σ) :
    let d :=
      relativeUnrestrictedSPlaceDatum
        (K := K) (L := L) S
    letI : Fintype
        (absoluteValueDecompositionGroup K (d i).extension.1) :=
      Fintype.ofFinite _
    letI : MulDistribMulAction
        (absoluteValueDecompositionGroup K (d i).extension.1)
        (LocalizedCompletion
          (d i).base (d i).extension)ˣ :=
      decompositionGroupLocalUnitsAction
        (d i).base (d i).base_isNontrivial
        (d i).extension
    Nat.card
        (HerbrandH0
          (absoluteValueDecompositionGroup K
            (d i).extension.1)
          (LocalizedCompletion
            (d i).base (d i).extension)ˣ) =
      relativeUnrestrictedSPlaceLocalDegree
        (K := K) (L := L) S i := by
  cases i with
  | inl v =>
      dsimp only [relativeUnrestrictedSPlaceDatum,
        relativeUnrestrictedSPlaceLocalDegree]
      let w := chosenInfinitePlaceAbove (L := L) v
      let hw := chosenInfinitePlaceAbove_comap
        (L := L) v
      have hcard :=
        infinitePlaceLocalHerbrandH0_card_eq_localDegree
          v (chosenInfinitePlaceAbove (L := L) v)
          (chosenInfinitePlaceAbove_comap
            (L := L) v)
      have hgroup :
          Nat.card (absoluteValueDecompositionGroup K w.1) =
            if w.IsUnramified K then 1 else 2 := by
        rw [absoluteValueDecompositionGroup_eq_infinitePlaceStabilizer w,
          InfinitePlace.card_stabilizer]
      exact hcard.trans hgroup.symm
  | inr v =>
      let vK := HeightOneSpectrum.adicAbv K v.1
      let hvK := RayClass.adicAbv_isNontrivial v.1
      dsimp only [relativeUnrestrictedSPlaceDatum,
        relativeUnrestrictedSPlaceLocalDegree]
      exact
        (local_card hyp
          vK hvK
          (chosenFinitePlaceExtension
            (L := L) v.1)
          σ hgen).trans
        (absoluteValueDecompositionGroup_card_eq_localizedDegree
          (K := K) (L := L)
          vK hvK
          (chosenFinitePlaceExtension
            (L := L) v.1)).symm

set_option maxHeartbeats 1200000 in
theorem actual (hyp:OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H2_R1_H3_R1_H2_R1_H2_R1.H1) (R:Finset (HeightOneSpectrum (𝓞 K))) (g:Gal(L/K)) (gen:∀s,s∈Subgroup.zpowers g) :
    (∏w:InfinitePlace K,determinant K L w.Completion)*(∏v:↥R,determinant K L (v.val.adicCompletion K)) =
    ∏i,relativeUnrestrictedSPlaceLocalDegree (K:=K) (L:=L) R i := by
  let I:=RelativeUnrestrictedSPlaceIndex (K:=K) R
  let d:=relativeUnrestrictedSPlaceDatum (K:=K) (L:=L) R
  letI : ∀ i:I,Fintype (absoluteValueDecompositionGroup K (d i).extension.1):=fun _=>Fintype.ofFinite _
  letI : ∀i:I,MulDistribMulAction (absoluteValueDecompositionGroup K (d i).extension.1) (LocalizedCompletion (d i).base (d i).extension)ˣ :=fun i=>decompositionGroupLocalUnitsAction (d i).base (d i).base_isNontrivial (d i).extension
  let e:=relativeUnrestrictedSPlaceFactorsHerbrandH0EquivLocalBlockFamily (K:=K) (L:=L) R
  apply (product R).symm.trans
  apply (Nat.card_congr e.toEquiv).trans
  apply (Nat.card_congr (localBlockFamilyHerbrandH0Equiv d g gen).toEquiv).trans
  rw [Nat.card_pi]
  exact Finset.prod_congr rfl (fun i _ => component hyp R i g gen)
set_option maxHeartbeats 1200000 in
theorem places : OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H2_R1_H3_R1_H2_R1_H2_R1.H2 := by
  intro hyp D N _ _ _ _ _ _ _ g gen
  dsimp only
  intro R S hS
  have eS:S=finitePlacesAbove (K:=D) (L:=N) R:=by
    ext w
    rw [hS,mem_finitePlacesAbove_iff]
    exact ⟨fun ⟨v,hv,hw⟩=>by change TunnellFiniteSupport.below w∈R; rw [TunnellFiniteSupport.above.mp hw];exact hv,
      fun h=>⟨_,h,TunnellFiniteSupport.above.mpr rfl⟩⟩
  subst S
  let G:=Gal(N/D)
  let S:=finitePlacesAbove (K:=D) (L:=N) R
  let X:=SUnitGroup.LogPlace (K:=N) S
  letI z:MulAction G X:=aboveSLogPlaceMulAction (K:=D) (L:=N) R
  letI : Fintype (MulAction.orbitRel.Quotient G X):=Fintype.ofFinite _
  have hs:=finitePlacesAbove_isGaloisStable (K:=D) (L:=N) R
  refine ⟨z,fun _ _=>rfl,fun _ _=>rfl,?_⟩
  apply (actual hyp R g gen).trans
  have eq:=relativeUnrestrictedSPlaceLocalDegree_product_eq_logPlaceOrbitProduct (K:=D) (L:=N) R
  have e':(∏ i,relativeUnrestrictedSPlaceLocalDegree (K:=D) (L:=N) R i)=
      ∏ t:MulAction.orbitRel.Quotient G X,logPlaceLocalDegree D N S t.out:=by exact_mod_cast eq
  apply e'.trans
  apply Finset.prod_congr rfl
  intro t _
  exact (permutationOrbitStabilizer_card_eq_logPlaceLocalDegree D N hs t).symm
end
end TunnellFieldNormPlaces

theorem OMA.solution : OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H2_R1_H3_R1_H2_R1_H2_R1.H2 := TunnellFieldNormPlaces.places
