import TunnellCMTranscendental

/-! # Algebraicity of local torsion coordinates in characteristic zero -/
namespace TunnellLocalTorsionCoords
open TunnellCMTranscendental Polynomial
open WeierstrassCurve.Affine (Point)
open LSG.Weierstrass
noncomputable section
variable {C:Type} [Field C] [CharZero C] [IsAlgClosed C]
local instance : DecidableEq K := Classical.decEq _
local instance : DecidableEq C := Classical.decEq _

private lemma specialize {x : C} (hx : Transcendental ℚ x) : ∃ φ : K →ₐ[ℚ] C, φ Xgeneric=x := by
  let h : F →ₐ[ℚ] C := IsFractionRing.liftAlgHom (transcendental_iff_injective.mp hx)
  obtain ⟨φ,hφ⟩ := IsAlgClosed.surjective_domRestrict_of_isAlgebraic (K := ℚ) (L := F)
    (E := K) (M := C) h
  refine ⟨φ,?_⟩
  change φ.domRestrict F RatFunc.X = x
  change φ.domRestrict F = h at hφ
  rw [hφ,← RatFunc.algebraMap_X]
  simp only [h,IsFractionRing.liftAlgHom_apply,IsFractionRing.lift_algebraMap]
  exact aeval_X x

private lemma generic_killed_iff (n a : ℕ) [NeZero n] {x y : C} (hx : Transcendental ℚ x)
    (h : ((E n).baseChange C).toAffine.Nonsingular x y) :
    a • genericPoint n = 0 ↔ a • (Point.some x y h) = 0 := by
  classical
  obtain ⟨φ,hφ⟩ := specialize hx
  let m := Point.map (W' := (E n).toAffine) φ
  have he : a • genericPoint n=0 ↔ a • m (genericPoint n)=0 := by
    rw [← map_nsmul,← map_zero m]
    exact (Point.map_injective (W' := (E n).toAffine) φ).eq_iff.symm
  rw [he]
  have e := (Point.X_eq_iff (h₁ := (((E n).toAffine.baseChange_nonsingular φ.injective ..).mpr
    (generic_nonsingular n))) (h₂ := h)).mp hφ
  change m (genericPoint n)=Point.some x y h ∨ m (genericPoint n)= -Point.some x y h at e
  rcases e with e|e
  · rw [e]
  · rw [e,smul_neg,neg_eq_zero]


private lemma generic_not_killed (n a:ℕ) (hn:0<n) (ha:0<a) [NeZero n] : a • genericPoint n≠0 := by
  classical
  let M := TunnellCMLemniscate.twistPeriods n hn
  have eqM : (E n).baseChange ℂ = curve M := (model n ℂ).trans (TunnellCMLemniscate.curve_eq n hn).symm
  obtain ⟨z,hz,haz,hx⟩ := generic_analytic_point M a ha
  intro he
  have h := @TunnellCMTranscendental.generic_killed_iff n a _
  rw [eqM] at h
  have hh := (h hx (nonsingular_weierstrassP M hz)).mp he
  rw [← expE_of_notMem M hz,analytic_killed] at hh
  exact haz hh

theorem algebraic_x {M:Type} [Field M] [CharZero M] [DecidableEq M] (n a:ℕ) (hn:0<n) (ha:0<a)
    {x y:M} (h:((E n).baseChange M).toAffine.Nonsingular x y) (ht:a • Point.some x y h=0) : IsAlgebraic ℚ x := by
  classical
  letI : NeZero n := ⟨hn.ne'⟩
  let B := AlgebraicClosure M
  let e := IsScalarTower.toAlgHom ℚ M B
  have hh := (((E n).toAffine.baseChange_nonsingular e.injective ..).mpr h)
  have hm : a • Point.some (e x) (e y) hh=0 := by
    have hmap := congrArg (Point.map (W':=(E n).toAffine) e) ht
    rwa [map_nsmul,map_zero] at hmap
  by_contra hx
  have hhx : Transcendental ℚ (e x) := fun he => hx ((isAlgebraic_algHom_iff e e.injective).mp he)
  exact generic_not_killed n a hn ha ((generic_killed_iff n a hhx hh).mpr hm)

#print axioms algebraic_x
end
end TunnellLocalTorsionCoords
