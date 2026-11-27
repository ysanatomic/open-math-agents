import TunnellCMModelUnit
import TunnellCoates

/-! First-order evaluation of translated division products in the formal parameter t=-x/y. -/
namespace TunnellCMFirstJet
open WeierstrassCurve WeierstrassCurve.Affine TunnellCoates TunnellCMModelUnit
noncomputable section
variable {F : Type*} [Field F] [DecidableEq F]

theorem chord_x {n x y c d : F} (hp : (E n).toAffine.Nonsingular x y)
    (hu : (E n).toAffine.Nonsingular c d) (hx : x≠c) :
    X (Point.some x y hp + Point.some c d hu) =
      ((x*c-n^2)*(x+c)-2*y*d)/(x-c)^2 := by
  rw [Point.add_of_X_ne hx]
  change (E n).toAffine.addX x c ((E n).toAffine.slope x c y d) = _
  rw [slope_of_X_ne hx,addX]
  have H₁ := (E_equation n x y).mp hp.1
  have H₂ := (E_equation n c d).mp hu.1
  simp only [E,zero_mul,add_zero,sub_zero]
  field_simp [sub_ne_zero.mpr hx]
  linear_combination H₁+H₂

def numerator {R : Type*} [CommRing R] (n c d t h : R) :=
  c + 2*d*t*h + (c^2-n^2)*t^2*h - n^2*c*t^4*h^2

def denominator {R : Type*} [CommRing R] (c t h : R) := (1-c*t^2*h)^2

theorem chord_parameter {n t h c d : F} (ht : t≠0) (hh : h≠0)
    (hp : (E n).toAffine.Nonsingular (1/(t^2*h)) (-1/(t^3*h)))
    (hu : (E n).toAffine.Nonsingular c d) (hs : 1-c*t^2*h≠0) :
    X (Point.some _ _ hp + Point.some _ _ hu) = numerator n c d t h / denominator c t h := by
  have hu' := mul_ne_zero (pow_ne_zero 2 ht) hh
  have hx : 1/(t^2*h)≠c := fun e => hs (by have e' := (div_eq_iff hu').mp e; linear_combination e')
  rw [chord_x hp hu hx]
  have sub : 1/(t^2*h)-c=(1-c*t^2*h)/(t^2*h) := by field_simp
  rw [sub,numerator,denominator]
  field_simp
  <;> ring

variable {R : Type*} [CommRing R]

def firstLine (t : R) (ht : t^2=0) : R →+ Additive Rˣ where
  toFun x := Additive.ofMul ⟨1+t*x,1-t*x,
    by linear_combination -x^2*ht,by linear_combination -x^2*ht⟩
  map_zero' := by apply Additive.toMul.injective; apply Units.ext; simp
  map_add' x y := by
    apply Additive.toMul.injective
    apply Units.ext
    change 1+t*(x+y) = (1+t*x)*(1+t*y)
    linear_combination -x*y*ht

theorem linear_chord (n c d t h : R) (ht : t^2=0) (hh : t*(h-1)=0) :
    numerator n c d t h = c + 2*d*t ∧ denominator c t h=1 := by
  constructor
  · unfold numerator
    linear_combination 2*d*hh + ((c^2-n^2)*h - n^2*c*t^2*h^2)*ht
  · simp [denominator,ht]

theorem product_jet {ι κ : Type*} [Fintype ι] [Fintype κ] (t : R) (ht : t^2=0)
    (u b : ι → κ → Rˣ) (x : ι → κ → R) (w : ι → ℤ)
    (h : ∀ i j, (u i j : R) = (b i j : R)*(1+t*x i j)) :
    ((∏ i, (∏ j, u i j)^w i)/(∏ i, (∏ j, b i j)^w i) : Rˣ).val =
      1+t*∑ i, (w i : R)*∑ j, x i j := by
  let L := firstLine t ht
  have eqn (i : ι) (j : κ) : u i j = b i j * (L (x i j)).toMul := Units.ext (h i j)
  have sum (i : ι) : (∏ j, (L (x i j)).toMul) = (L (∑ j, x i j)).toMul := by
    rw [map_sum]
    exact (toMul_sum _ _).symm
  have tot : (∏ i, (L (∑ j, x i j)).toMul^w i) =
      (L (∑ i, (w i : R)*∑ j, x i j)).toMul := by
    simp only [← zsmul_eq_mul,map_sum,map_zsmul,toMul_sum,toMul_zsmul]
  simp_rw [eqn,Finset.prod_mul_distrib,sum,mul_zpow]
  rw [Finset.prod_mul_distrib,tot,mul_div_cancel_left]
  rfl

end
end TunnellCMFirstJet
#print axioms TunnellCMFirstJet.chord_parameter
#print axioms TunnellCMFirstJet.product_jet
