import TunnellCMDistribution
import LSG.Weierstrass.Dictionary
import LSG.LemniscateIndep.Symm

/-! The analytic uniformization is onto; division points and CM are represented on the torus. -/
namespace TunnellCMTorus

open Complex Filter Set LSG.Weierstrass
open scoped Topology PeriodPair

theorem exists_wp (M : PeriodPair) (x : ℂ) : ∃ z ∉ M.lattice, M.weierstrassP z=x := by
  classical
  by_contra! h
  let f (z : ℂ) := if z∈M.lattice then 0 else (M.weierstrassP z-x)⁻¹
  have hp (z : ℂ) (l : M.lattice) : f (z+l)=f z := by
    simp [f,M.weierstrassP_add_coe,M.lattice.add_mem_iff_left l.property]
  let g (z : ℂ) := z^2/(1+z^2*(M.weierstrassPExcept 0 z-x))
  have h₀ : DifferentiableAt ℂ g 0 := by
    have hD := (M.analyticAt_weierstrassPExcept 0).differentiableAt
    apply (differentiableAt_id.pow 2).div ((differentiableAt_const (c := (1:ℂ))).add
      ((differentiableAt_id.pow 2).mul (hD.sub_const x)))
    simp
  have he : f =ᶠ[𝓝 (0:ℂ)] g := by
    filter_upwards [M.compl_lattice_sdiff_singleton_mem_nhds 0] with z hz
    by_cases hzero : z=0
    · simp [hzero,f,g]
    have hz' : z∉M.lattice := fun hm => hz ⟨hm,by simpa using hzero⟩
    have e : M.weierstrassP z=M.weierstrassPExcept 0 z+1/z^2 := by
      rw [← M.weierstrassPExcept_add ⟨0,M.lattice.zero_mem⟩]
      simp
    simp only [f,if_neg hz',g,e]
    have hdiv : M.weierstrassPExcept 0 z+1/z^2-x=(1+z^2*(M.weierstrassPExcept 0 z-x))/z^2 := by
      field_simp
      <;> ring
    rw [hdiv,inv_div]
  have f0 := h₀.congr_of_eventuallyEq he
  have hd : Differentiable ℂ f := by
    intro w
    by_cases hw : w∈M.lattice
    · let l : M.lattice := ⟨w,hw⟩
      have f0' : DifferentiableAt ℂ f (w-w) := by simpa using f0
      have D := f0'.comp (f := fun z : ℂ => z-w) w (differentiableAt_id.sub_const w)
      apply D.congr_of_eventuallyEq
      filter_upwards with z
      simpa [Function.comp_def,l] using hp (z-w) l
    · apply ((M.differentiableOn_weierstrassP.differentiableAt
        (M.isClosed_lattice.isOpen_compl.mem_nhds hw)).sub_const x).inv (sub_ne_zero.mpr (h w hw)) |>.congr_of_eventuallyEq
      filter_upwards [M.isClosed_lattice.isOpen_compl.mem_nhds hw] with z hz using if_neg hz
  have hb := (IsZLattice.isCompact_range_of_periodic M.lattice _ hd.continuous
    (fun z w hw => hp z ⟨w,hw⟩)).isBounded
  have eq0 := hd.apply_eq_apply_of_bounded hb (M.ω₁/2) 0
  simp only [f,if_neg M.ω₁_div_two_notMem_lattice,Submodule.zero_mem,if_true,inv_eq_zero,sub_eq_zero] at eq0
  exact h _ M.ω₁_div_two_notMem_lattice eq0

theorem exp_surjective (M : PeriodPair) : Function.Surjective (expE M) := by
  intro P
  cases P with
  | zero => exact ⟨0,expE_zero M⟩
  | some x y hy =>
    obtain ⟨z,hz,hx⟩ := exists_wp M x
    have e := (WeierstrassCurve.Affine.Point.X_eq_iff (h₁ := nonsingular_weierstrassP M hz) (h₂ := hy)).mp hx
    rw [← expE_of_notMem M hz] at e
    rcases e with he|he
    · exact ⟨z,he⟩
    · exact ⟨-z,by rw [expE_neg,he,neg_neg]⟩

end TunnellCMTorus

#print axioms TunnellCMTorus.exp_surjective
