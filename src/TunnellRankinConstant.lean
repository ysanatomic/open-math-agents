import TunnellRankinHurwitz
import TunnellRankinCritical

/-! The exact Dirichlet L-value of the constant term of the Rankin Eisenstein family. -/
namespace TunnellRankinEisenstein
open Complex TunnellCMRegularized TunnellRankinCotangent HurwitzZeta Filter Set Finset
open scoped ComplexConjugate Topology

noncomputable section

lemma horizontal_large {a : ℕ} {x : ℝ} {m : ℤ} (hx : (a:ℝ)*x=x+(m:ℝ)) {s : ℂ} (hs : 1<s.re) :
    horizontal a x s=((a:ℂ)^2-(a:ℂ))*(2*hurwitzZetaOdd x (2*s-1)) := by
  have hh := shifted_hurwitz x hs
  have h0 : HasSum (fun j : ℤ => kernel s j) 0 := by
    have hz : hurwitzZetaOdd 0 (2*s-1)=0 := by
      have h := hurwitzZetaOdd_neg 0 (2*s-1)
      simp only [neg_zero] at h
      linear_combination h/2
    simpa [hz] using shifted_hurwitz 0 hs
  have hax : (a:ℂ)*(x:ℂ)=(x:ℂ)+(m:ℂ) := by exact_mod_cast hx
  have hh' := (Equiv.addRight m).hasSum_iff.mpr hh
  have hm : HasSum (fun j : ℤ => kernel s ((j:ℂ)+(a:ℂ)*(x:ℂ))) (2*hurwitzZetaOdd x (2*s-1)) := by
    apply hh'.congr_fun
    intro j
    rw [hax]
    simp [add_comm,add_assoc,add_left_comm]
  have H := (((hh.sub h0).mul_left ((a:ℂ)^2)).sub ((hm.sub h0).mul_left (a:ℂ))).tsum_eq
  unfold horizontal
  simpa only [difference,sub_zero,sub_mul] using H

lemma horizontal_eq {a : ℕ} {x : ℝ} {m : ℤ} (hx : (a:ℝ)*x=x+(m:ℝ)) :
    horizontal a x 1=((a:ℂ)^2-(a:ℂ))*(2*hurwitzZetaOdd x 1) := by
  let G (s : ℂ) := ((a:ℂ)^2-(a:ℂ))*(2*hurwitzZetaOdd x (2*s-1))
  have hG : AnalyticOnNhd ℂ G domain := by
    apply analyticOnNhd_const.mul
    apply analyticOnNhd_const.mul
    intro s _
    exact ((differentiable_hurwitzZetaOdd x).analyticAt _).comp (by fun_prop)
  have he : EqOn (horizontal a x) G domain :=
    (horizontal_analytic _ _).eqOn_of_preconnected_of_eventuallyEq hG
      (convex_halfSpace_re_gt _).isPreconnected (by norm_num [domain] : (2:ℂ)∈domain) (by
        filter_upwards [(isOpen_lt continuous_const Complex.continuous_re).mem_nhds
          (show (1:ℝ)<(2:ℂ).re by norm_num)] with s hs
        exact horizontal_large hx hs)
  convert he (by norm_num [domain] : (1:ℂ)∈domain) using 1
  dsimp [G]
  norm_num

lemma cot_offset {N : ℕ} [NeZero N] (r : ZMod N) :
    cotValue (offset r)=2*hurwitzZetaOdd (ZMod.toAddCircle r) 1 := by
  let x : ℝ := (r.val:ℝ)/N
  have hx : (aux N:ℝ)*x=x+(r.val:ℤ) := by
    have hN : (N:ℝ)≠0 := by exact_mod_cast NeZero.ne N
    dsimp [aux,x]
    push_cast
    field_simp
    ring
  have H := horizontal_eq hx
  have he : (x:ℂ)=offset r := by simp only [x,offset,Complex.ofReal_div,Complex.ofReal_natCast]
  rw [he] at H
  have t := critical_fiber_row (k:=1) UpperHalfPlane.I r 0
  have h (j : ℤ) : difference (aux N) (offset r) j 1=centralFiber (aux N) 0 (offset r) j := by
    simpa [centralIndex_val,coord] using difference_index (k:=1) UpperHalfPlane.I r (0,j)
  simp only [horizontal,h] at H
  have h0 : cotValue 0=0 := by simp [cotValue,Complex.cot]
  simp only [coord,Int.cast_zero,zero_mul,zero_add,h0,sub_zero] at t
  rw [t] at H
  rw [ZMod.toAddCircle_apply]
  exact mul_left_cancel₀ (aux_ne N) H

lemma constant_L {N : ℕ} [NeZero N] {χ : DirichletCharacter ℂ N} (ho : χ.Odd) :
    row χ 0=2*(N:ℂ)*χ.LFunction 1 := by
  have hN : (N:ℂ)≠0 := by exact_mod_cast NeZero.ne N
  change (∑ r,χ r*cotValue (0+offset r))=_
  simp only [zero_add,cot_offset,DirichletCharacter.LFunction,ZMod.LFunction_def_odd ho.to_fun,
    Complex.cpow_neg_one]
  simp_rw [show ∀ a b : ℂ,a*(2*b)=2*(a*b) by intros; ring,←mul_sum]
  field_simp

theorem regular_central {d k : ℕ} [NeZero k] (hd : d%4=1) (hs : Squarefree d) (z : UpperHalfPlane) :
    haveI : NeZero (4*(2*d)) := ⟨by omega⟩
    let χ := TunnellRankin.negCharacter d (by omega)
    regular (4*(2*d)) k χ z 1 =
      2*((4*(2*d):ℕ):ℂ)*χ.LFunction 1 +
      (-4*Real.pi*Complex.I*gaussSum χ ZMod.stdAddChar)*TunnellRankin.theta d (multiple ⟨k,NeZero.pos k⟩ z) := by
  letI : NeZero (4*(2*d)) := ⟨by omega⟩
  exact (regular_one hd hs z).trans (congrArg (·+_) (constant_L (TunnellRankin.negCharacter_odd hd)))

end
end TunnellRankinEisenstein
#print axioms TunnellRankinEisenstein.regular_central
