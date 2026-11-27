import TunnellCMIntegralCoefficients

/-! Arbitrarily large split primes at which the first coefficient of the descended
elliptic-unit expansion is itself an integral unit whenever the rational derivative is nonzero. -/
namespace TunnellCMIntegralSlope
open Complex LSG.Weierstrass WeierstrassCurve WeierstrassCurve.Affine IntermediateField NumberField
open TunnellCoates TunnellKummer TunnellCMLemniscate TunnellCMCritical TunnellCMLSeries
open TunnellCMUnitTrace TunnellCMCriticalCoordinates TunnellCMCriticalIntegers
open TunnellCMCriticalCoefficients TunnellCMNormDerivative TunnellCMEllipticUnit
open TunnellCMDistribution TunnellCMModelUnit TunnellCMIntegralCoefficients
open scoped Classical NumberField
noncomputable section
local notation "AlgC" => algebraicClosure ℚ ℂ
variable (K : Type*) [Field K] [NumberField K] [Algebra K AlgC] [DecidableEq K]
variable (n : ℕ) (hn : 0<n) {F : IntermediateField K AlgC} (D : Data K n hn F) [FiniteDimensional K F]
local notation "Lat" => twistPeriods n hn
local notation "I₀" => support n hn
local notation "J" => divisionGrid Lat (aux n)
local notation "Em" => F →ₐ[K] AlgC
local notation "N" => normalClosure K F AlgC

structure Coordinates (p : ℕ) [Fact p.Prime] (e : N →ₐ[ℚ] ℚ_[p]) where
  x : Em → I₀ → ℤ_[p]
  y : Em → I₀ → ℤ_[p]
  c : Em → J → ℤ_[p]
  b : Em → I₀ → J → ℤ_[p]ˣ
  hx : ∀ σ i, (x σ i : ℚ_[p])=e (conjugate K σ (X (D.u i)))
  hy : ∀ σ i, (y σ i : ℚ_[p])=e (conjugate K σ (Y (D.u i)))
  hc : ∀ σ j, (c σ j : ℚ_[p])=e (conjugate K σ (D.c j))
  hb : ∀ σ i j, (b σ i j:ℤ_[p])=x σ i-c σ j

variable {p : ℕ} [Fact p.Prime]

def firstCoefficient {e : (normalClosure K F AlgC) →ₐ[ℚ] ℚ_[p]} (coeff : Coordinates K n hn D p e) : PadicInt p :=
  ∑ σ : Em, ∑ i : I₀, (weight n i.val : PadicInt p) *
    ∑ j : J, (2 * coeff.y σ i) * ((coeff.b σ i j)⁻¹).val

theorem slope_eq {e : (normalClosure K F AlgC) →ₐ[ℚ] ℚ_[p]} (A : Coordinates K n hn D p e) (r : ℚ) (hr : logDeriv (traceUnit n hn) 0=(r:ℂ)) :
    (firstCoefficient K n hn D A:ℚ_[p])=(Fintype.card Em:ℚ_[p])*(r:ℚ_[p]) := by
  have hh : scalar K n hn D=(r:F) := by
    apply F.val.injective
    apply (algebraMap AlgC ℂ).injective
    exact (scalar_complex K n hn D).trans (hr.trans (by simp))
  let f (σ : Em) := e.comp ((conjugate K σ).restrictScalars ℚ)
  have hs (σ : Em) := congrArg (f σ) hh
  simp only [scalar,map_sum,map_mul,map_intCast,map_div₀,map_sub,map_ofNat,map_ratCast] at hs
  have hi (σ : Em) (i : I₀) (j : J) :
      ((((A.b σ i j)⁻¹).val:ℤ_[p]):ℚ_[p])=(f σ (X (D.u i))-f σ (D.c j))⁻¹ := by
    change ((Units.map (algebraMap ℤ_[p] ℚ_[p]).toMonoidHom ((A.b σ i j)⁻¹)):ℚ_[p]ˣ).val=_
    rw [map_inv,Units.val_inv_eq_inv_val]
    change ((A.b σ i j:ℤ_[p]):ℚ_[p])⁻¹=_
    rw [A.hb,PadicInt.coe_sub,A.hx,A.hc]
    rfl
  change algebraMap ℤ_[p] ℚ_[p] (∑ σ : Em, ∑ i : I₀, (weight n i.val:ℤ_[p])*∑ j : J, 2*A.y σ i*((A.b σ i j)⁻¹:ℤ_[p]ˣ).val)=_
  simp only [map_sum,map_mul,map_intCast,map_ofNat,PadicInt.algebraMap_apply,hi,A.hy]
  change (∑ σ : Em, ∑ i : I₀, (weight n i.val:ℚ_[p])*∑ j : J,
    (2*f σ (Y (D.u i)))*(f σ (X (D.u i))-f σ (D.c j))⁻¹)=_
  simp only [← div_eq_mul_inv,hs,Finset.sum_const,Finset.card_univ,nsmul_eq_mul]

theorem good_slope (iK : K) (hiK : iK^2= -1) (r : ℚ) (hr0 : r≠0)
    (hr : logDeriv (traceUnit n hn) 0=(r:ℂ)) (bound : ℕ) :
    ∃ p : ℕ, ∃ hp : p.Prime, bound<p ∧ p%4=1 ∧
      letI : Fact p.Prime := ⟨hp⟩
      ∃ (e : N →ₐ[ℚ] ℚ_[p]) (A : Coordinates K n hn D p e), IsUnit (firstCoefficient K n hn D A) := by
  let v : ℚ := Fintype.card Em*r
  have hv : v≠0 := mul_ne_zero (Nat.cast_ne_zero.mpr Fintype.card_ne_zero) hr0
  obtain ⟨B,hB⟩ := TunnellPadicCoefficientBounds.finite_bound ({v,v⁻¹}:Finset ℚ)
  obtain ⟨p,hp,hle,hmod,e,H⟩ := specialize K n hn D iK hiK (max B bound)
  letI : Fact p.Prime := ⟨hp⟩
  let x (σ : Em) (i : I₀) : ℤ_[p] := ⟨_,((H σ).1 i).1⟩
  let y (σ : Em) (i : I₀) : ℤ_[p] := ⟨_,((H σ).1 i).2⟩
  let c (σ : Em) (j : J) : ℤ_[p] := ⟨_,(H σ).2.1 j⟩
  have hb (σ : Em) (i : I₀) (j : J) : IsUnit (x σ i-c σ j) := by
    apply PadicInt.isUnit_iff.mpr
    change ‖e (conjugate K σ (X (D.u i)))-e (conjugate K σ (D.c j))‖=1
    simpa only [map_sub] using (H σ).2.2 i j
  let A : Coordinates K n hn D p e := ⟨x,y,c,fun σ i j => (hb σ i j).unit,
    fun _ _ => rfl,fun _ _ => rfl,fun _ _ => rfl,fun σ i j => (hb σ i j).unit_spec⟩
  refine ⟨p,hp,by omega,hmod,?_⟩
  exact ⟨e,A,PadicInt.isUnit_iff.mpr (by
    change ‖(firstCoefficient K n hn D A:ℚ_[p])‖=1
    have he : (firstCoefficient K n hn D A:ℚ_[p])=(v:ℚ_[p]) := by rw [slope_eq K n hn D A r hr]; simp [v]
    rw [he]
    let g := Algebra.ofId ℚ ℚ_[p]
    have h₀ : 0<‖g v‖ := norm_pos_iff.mpr ((map_ne_zero g).mpr hv)
    have h₁ := hB p (by omega) g v (by simp)
    have h₂ := hB p (by omega) g v⁻¹ (by simp)
    have ei : ‖g (v⁻¹)‖=‖g v‖⁻¹ := (congrArg norm (map_inv₀ g v)).trans (norm_inv _)
    exact le_antisymm h₁ ((inv_le_one₀ h₀).mp (ei.symm.le.trans h₂)))⟩

end
end TunnellCMIntegralSlope
#print axioms TunnellCMIntegralSlope.good_slope
