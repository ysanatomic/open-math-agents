import TunnellCMTorus
import TunnellCMLemniscate
import TunnellGaussianBase

/-! Gaussian division points on the complex uniformization are cyclic over the Gaussian integers. -/
namespace TunnellCMToricDivision

open Complex LSG.Weierstrass LSG.LemniscateIndep TunnellCMLemniscate TunnellCMDistribution
open TunnellCoates TunnellGaussianEnd

noncomputable section

local instance (M : PeriodPair) : (curve M).IsElliptic := ⟨isUnit_iff_ne_zero.mpr (curve_Δ_ne_zero M)⟩

variable (n : ℕ) (hn : 0<n)
local notation "M" => twistPeriods n hn

def rot := quarter (n := (n:ℂ)) (curve_eq n hn) I I_sq

lemma rot_exp (z : ℂ) : rot n hn (expE M z)=expE M (I*z) := by
  by_cases hz : z∈(M).lattice
  · rw [expE_of_mem M hz,expE_of_mem M (I_mul_mem rfl rfl hz),map_zero]
  have hi : I*z ∉ (M).lattice := by
    intro h
    have e := I_mul_mem (a := realPeriod n) (L := M) rfl rfl h
    rw [← mul_assoc,I_mul_I,neg_one_mul] at e
    exact hz (neg_mem_iff.mp e)
  have hp := weierstrassP_I_mul (a := realPeriod n) (L := M) rfl rfl
  have d1 := (hasDerivP M hi).comp z ((hasDerivAt_id' z).const_mul I)
  have d2 := (hasDerivP M hz).neg
  have d2' : HasDerivAt ((M).weierstrassP ∘ (fun w : ℂ => I*w)) (-(M).derivWeierstrassP z) z := by
    apply d2.congr_of_eventuallyEq
    filter_upwards with w using hp w
  have ed := d1.unique d2'
  simp only [mul_one] at ed
  have ey : I*((M).derivWeierstrassP z/2)=(M).derivWeierstrassP (I*z)/2 := by
    linear_combination I/2*ed - ((M).derivWeierstrassP (I*z)/2)*I_sq
  rw [expE_of_notMem M hz,expE_of_notMem M hi]
  change WeierstrassCurve.Affine.Point.some _ _ _ = WeierstrassCurve.Affine.Point.some _ _ _
  exact some_eq_some M (hp z).symm ey

def action (a : GaussianInt) : AddMonoid.End (curveA M).Point :=
  a.re • AddMonoidHom.id _ + a.im • rot n hn

theorem action_exp (a : GaussianInt) (z : ℂ) :
    action n hn a (expE M z)=expE M ((a:ℂ)*z) := by
  change a.re • expE M z+a.im • rot n hn (expE M z)=_
  rw [rot_exp,← expE_intCast_mul,← expE_intCast_mul,← expE_add,GaussianInt.toComplex_def]
  congr 1
  ring

theorem action_mul (a b : GaussianInt) (P : (curveA M).Point) :
    action n hn a (action n hn b P)=action n hn (a*b) P := by
  obtain ⟨z,rfl⟩ := TunnellCMTorus.exp_surjective M P
  rw [action_exp,action_exp,action_exp,GaussianInt.toComplex_mul,mul_assoc]

theorem cyclic_kernel (a : GaussianInt) (ha : a≠0) :
    ∃ T : (curveA M).Point, action n hn a T=0 ∧
      ∀ P : (curveA M).Point, action n hn a P=0 ↔ ∃ b : GaussianInt, action n hn b T=P := by
  let ω : ℂ := realPeriod n
  have h : (a:ℂ)≠0 := fun e => ha (GaussianInt.toComplex_eq_zero.mp e)
  refine ⟨expE M (ω/(a:ℂ)),?_,?_⟩
  · rw [action_exp,mul_div_cancel₀ _ h]
    exact expE_of_mem M (M).ω₁_mem_lattice
  intro P
  obtain ⟨z,rfl⟩ := TunnellCMTorus.exp_surjective M P
  rw [action_exp]
  constructor
  · intro hP
    have hz : (a:ℂ)*z∈(M).lattice := by
      by_contra e
      rw [expE_of_notMem M e] at hP
      exact WeierstrassCurve.Affine.Point.some_ne_zero _ hP
    obtain ⟨k,l,he⟩ := (mem_lattice_sq (a := realPeriod n) rfl rfl).mp hz
    refine ⟨⟨k,l⟩,?_⟩
    rw [action_exp,GaussianInt.toComplex_def']
    congr 1
    change ((k:ℂ)+l*I)*(ω/(a:ℂ))=z
    field_simp [h]
    dsimp [ω]
    linear_combination he
  · rintro ⟨b,he⟩
    rw [← action_exp,← he,action_mul,mul_comm,← action_mul,action_exp,mul_div_cancel₀ _ h,
      expE_of_mem M (show ω∈(M).lattice from (M).ω₁_mem_lattice),map_zero]

end
end TunnellCMToricDivision

#print axioms TunnellCMToricDivision.cyclic_kernel
