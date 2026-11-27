import TunnellCMNormDerivative
import TunnellPadicCoefficientBounds
import Mathlib.FieldTheory.Normal.Closure
import Mathlib.NumberTheory.LegendreSymbol.Basic

/-! One p-adic embedding of the normal closure specializes every conjugate
of the critical elliptic function with unit denominators. -/
namespace TunnellCMIntegralCoefficients
open Complex LSG.Weierstrass WeierstrassCurve WeierstrassCurve.Affine NumberField IntermediateField
open TunnellCoates TunnellKummer TunnellCMLemniscate TunnellCMCritical TunnellCMLSeries
open TunnellCMUnitTrace TunnellCMCriticalCoordinates TunnellCMCriticalIntegers
open TunnellCMCriticalCoefficients TunnellCMNormDerivative TunnellCMEllipticUnit
open TunnellCMDistribution TunnellCMModelUnit TunnellCMAbsoluteUnit TunnellPadicCoefficientBounds
open scoped Classical NumberField
noncomputable section
local notation "AlgC" => algebraicClosure ℚ ℂ
variable (K : Type*) [Field K] [NumberField K] [Algebra K AlgC] [DecidableEq K]
variable (n : ℕ) (hn : 0<n) {F : IntermediateField K AlgC} (D : Data K n hn F)
local notation "Lat" => twistPeriods n hn
local notation "Supp" => support n hn
local notation "J" => divisionGrid Lat (aux n)
local notation "W" => E (n:K)

lemma coords_distinct (i : Supp) (j : J) : X (D.u i)≠D.c j := by
  letI : NeZero (4*n) := ⟨by omega⟩
  letI : NeZero (aux n) := ⟨by unfold aux; omega⟩
  have hr := shift_regular n hn i.val ((Finset.mem_filter.mp i.property).2)
  have hd := Finset.prod_ne_zero_iff.mp (division_nonzero Lat (aux n) hr) j.val j.property
  intro eq
  apply hd
  apply sub_eq_zero.mpr
  have hu := congrArg X (D.shift_spec i)
  rw [realize_x,x_uniformize] at hu
  rw [← hu,← D.grid_spec j,← eq]
  exact congrArg (algebraMap AlgC ℂ) (coords K n hn D i).1.symm

lemma shift_nonzero (i : Supp) : D.u i≠0 := by
  letI : NeZero (4*n) := ⟨by omega⟩
  have hr := shift_regular n hn i.val ((Finset.mem_filter.mp i.property).2)
  intro eq
  have e := D.shift_spec i
  rw [eq,map_zero,map_zero,uniformize_apply] at e
  have hh := (Point.equivOfEq (model_eq n hn)).injective (e.symm.trans (map_zero _).symm)
  exact hr (mul_mem Lat _ ((TunnellCMTorsionOrder.zero_iff n hn _).mp hh))

def conjugate {F : IntermediateField K AlgC} (σ : F →ₐ[K] AlgC) : F →ₐ[K] normalClosure K F AlgC :=
  σ.codRestrict _ (fun x => σ.fieldRange_le_normalClosure ⟨x,rfl⟩)

lemma split_congr {p : ℕ} [Fact p.Prime] (hp : 2<p) {i : ℚ_[p]} (hi : i^2= -1) : p%4=1 := by
  have hsq := congrArg norm hi
  simp only [norm_pow,norm_neg,norm_one] at hsq
  let j : ℤ_[p] := ⟨i,by nlinarith [norm_nonneg i]⟩
  have hj : j^2= -1 := Subtype.ext hi
  have h := congrArg (PadicInt.toZMod (p := p)) hj
  simp only [map_pow,map_neg,map_one] at h
  have h₃ := ZMod.mod_four_ne_three_of_sq_eq_neg_one h
  have ho := (Fact.out : p.Prime).eq_two_or_odd.resolve_left (by omega)
  omega

variable [FiniteDimensional K F]
theorem specialize (iK : K) (hiK : iK^2= -1) (bound : ℕ) :
    ∃ p : ℕ, ∃ hp : p.Prime, bound<p ∧ p%4=1 ∧ ∃ e : normalClosure K F AlgC →ₐ[ℚ] @Padic p ⟨hp⟩,
      ∀ σ : F →ₐ[K] AlgC, (∀ i : Supp, ‖e (conjugate K σ (X (D.u i)))‖≤1 ∧
        ‖e (conjugate K σ (Y (D.u i)))‖≤1) ∧
        (∀ j : J, ‖e (conjugate K σ (D.c j))‖≤1) ∧
        (∀ (i : Supp) (j : J), ‖e (conjugate K σ (X (D.u i)-D.c j))‖=1) := by
  letI : FiniteDimensional ℚ F := Module.Finite.trans K F
  letI : NumberField F := ⟨⟩
  let N := normalClosure K F AlgC
  letI : FiniteDimensional ℚ N := Module.Finite.trans K N
  letI : NumberField N := ⟨⟩
  let S : Finset F := coordinateSet D.u ∪ Finset.univ.image D.c ∪
    Finset.univ.image (fun b : Supp × J => X (D.u b.1)-D.c b.2) ∪ Finset.univ.image
    (fun b : Supp × J => (X (D.u b.1)-D.c b.2)⁻¹)
  obtain ⟨b,hb⟩ := finite_bound S
  obtain ⟨p,hp,hpB,⟨e⟩⟩ := TunnellNumberFieldSplitPrimes.embeddings N (max (max bound 2) b)
  letI : Fact p.Prime := ⟨hp⟩
  have hi : e (algebraMap K N iK)^2= -1 := by rw [← map_pow,← map_pow,hiK]; simp
  refine ⟨p,hp,by omega,split_congr (by omega) hi,e,?_⟩
  intro σ
  let g := e.comp ((conjugate K σ).restrictScalars ℚ)
  have H := hb p (by omega) g
  have hx (i : Supp) : ‖g (X (D.u i))‖≤1 := H _ (by simp [S,TunnellCMAbsoluteUnit.coordinateSet])
  have hy (i : Supp) : ‖g (Y (D.u i))‖≤1 := H _ (by simp [S,TunnellCMAbsoluteUnit.coordinateSet])
  have hc (j : J) : ‖g (D.c j)‖≤1 := H _ (by simp [S])
  refine ⟨fun i => ⟨hx i,hy i⟩,hc,?_⟩
  intro i j
  change ‖g (X (D.u i)-D.c j)‖=1
  have hdiff := sub_ne_zero.mpr (coords_distinct K n hn D i j)
  have pos := norm_pos_iff.mpr ((map_ne_zero g).mpr hdiff)
  have hinv := H _ (Finset.mem_union_right _ (Finset.mem_image_of_mem _ (Finset.mem_univ ((i,j) : Supp × J))))
  rw [map_inv₀,norm_inv] at hinv
  apply le_antisymm _ ((inv_le_one₀ pos).mp hinv)
  exact H _ (Finset.mem_union_left _ (Finset.mem_union_right _
    (Finset.mem_image_of_mem _ (Finset.mem_univ ((i,j) : Supp × J)))))

end
end TunnellCMIntegralCoefficients
#print axioms TunnellCMIntegralCoefficients.specialize
