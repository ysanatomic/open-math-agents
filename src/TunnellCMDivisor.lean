import TunnellCMEllipticUnit
import TunnellCMTorus
import Mathlib.Analysis.Meromorphic.NormalForm

/-! Divisors of the finite multiplication products of Weierstrass coordinates. -/
namespace TunnellCMDivisor
open LSG.Weierstrass TunnellCMEllipticUnit TunnellCMDistribution Filter Set Complex
open scoped Topology

noncomputable section
open Classical in
def mult (L : PeriodPair) (z : ℂ) : ℤ := if z∈L.lattice then 1 else 0

lemma sigma_order (L : PeriodPair) (z : ℂ) : meromorphicOrderAt (sigma L) z=(mult L z:WithTop ℤ) := by
  classical
  have h := (differentiable_sigma L).analyticAt z
  rw [h.meromorphicOrderAt_eq]
  by_cases hz : z∈L.lattice
  · rw [h.analyticOrderAt_eq_one_of_zero_deriv_ne_zero ((sigma_eq_zero_iff L).mpr hz) (deriv_sigma_ne_zero_of_mem L hz)]
    simp [mult,hz]
  · rw [h.analyticOrderAt_eq_zero.mpr (sigma_ne_zero L hz)]
    simp [mult,hz]

theorem pair_order (L : PeriodPair) {u : ℂ} (hu : u∉L.lattice) (z : ℂ) :
    meromorphicOrderAt (fun w : ℂ => L.weierstrassP w-L.weierstrassP u) z =
    ((mult L (z-u)+mult L (z+u)-2*mult L z:ℤ):WithTop ℤ) := by
  obtain ⟨c,hc,he⟩ := sigma_identity L hu
  let f (x : ℂ) := c*(sigma L (x-u)*sigma L (x+u))/sigma L x^2
  have h : (fun w : ℂ => L.weierstrassP w-L.weierstrassP u) =ᶠ[𝓝[≠]z] f := by
    filter_upwards [self_mem_nhdsWithin,mem_nhdsWithin_of_mem_nhds (L.compl_lattice_sdiff_singleton_mem_nhds z)] with w hw hw'
    have e : w∉L.lattice := by simp_all
    exact (eq_div_iff (pow_ne_zero 2 (sigma_ne_zero L e))).mpr (he w e)
  have hS := (differentiable_sigma L).analyticAt
  have hm : MeromorphicAt (fun w : ℂ => sigma L (w-u)) z := ((hS (z-u)).comp (f := fun w : ℂ => w-u) (by fun_prop : AnalyticAt ℂ (fun w : ℂ => w-u) z)).meromorphicAt
  have hp : MeromorphicAt (fun w : ℂ => sigma L (w+u)) z := ((hS (z+u)).comp (f := fun w : ℂ => w+u) (by fun_prop : AnalyticAt ℂ (fun w : ℂ => w+u) z)).meromorphicAt
  rw [meromorphicOrderAt_congr h]
  change meromorphicOrderAt ((fun _ : ℂ => c)*((fun w : ℂ => sigma L (w-u))*(fun w : ℂ => sigma L (w+u)))/(sigma L)^2) z = _
  rw [meromorphicOrderAt_div ((MeromorphicAt.const _ _).mul (hm.mul hp)) ((hS _).meromorphicAt.pow _),
    meromorphicOrderAt_mul (MeromorphicAt.const _ _) (hm.mul hp),meromorphicOrderAt_mul hm hp,
    meromorphicOrderAt_pow (hS _).meromorphicAt,meromorphicOrderAt_const,if_neg hc,
    meromorphicOrderAt_fun_comp_sub_const_eq_meromorphicOrderAt,meromorphicOrderAt_fun_comp_add_const_eq_meromorphicOrderAt]
  simp only [sigma_order,zero_add]
  push_cast
  simp [two_mul,two_nsmul]

theorem product_order (L : PeriodPair) (a : ℕ) (z : ℂ) :
    meromorphicOrderAt (divisionProduct L a) z =
    ((∑ j ∈ divisionGrid L a, (mult L (z-liftGrid L j)+mult L (z+liftGrid L j)-2*mult L z):ℤ):WithTop ℤ) := by
  classical
  have h j (_ : j∈divisionGrid L a) : MeromorphicAt (fun w => L.weierstrassP w-L.weierstrassP (liftGrid L j)) z :=
    (L.meromorphic_weierstrassP z).sub (.const _ _)
  unfold divisionProduct
  rw [meromorphicOrderAt_fun_prod h]
  push_cast
  apply Finset.sum_congr rfl
  intro j hj
  exact pair_order L (Finset.mem_filter.mp hj).2 z

lemma mult_sub_period (L : PeriodPair) {w : ℂ} (hw : w∈L.lattice) (z : ℂ) : mult L (z-w)=mult L z := by
  classical
  simp [mult,L.lattice.sub_mem_iff_left hw]

lemma mult_neg (L : PeriodPair) (z : ℂ) : mult L (-z)=mult L z := by
  classical
  simp [mult,neg_mem_iff]

lemma grid_sum (L : PeriodPair) (a : ℕ) [NeZero a] (z : ℂ) :
    (∑ j : Grid a, mult L (z-liftGrid L j))=mult L ((a:ℂ)*z) := by
  classical
  by_cases hz : (a:ℂ)*z∈L.lattice
  · obtain ⟨⟨j,w⟩,he⟩ := (gridEquiv L a).surjective ⟨_,hz⟩
    have e := (coe_gridEquiv L a j w).symm.trans (congrArg Subtype.val he)
    have ha : (a:ℂ)≠0 := by exact_mod_cast NeZero.ne a
    have ew : (w:ℂ)+liftGrid L j=z := mul_left_cancel₀ ha e
    rw [Finset.sum_eq_single j]
    · have hj : z-liftGrid L j∈L.lattice := by rw [← ew,add_sub_cancel_right]; exact w.property
      simp [mult,hj,hz]
    · intro b _ hb
      have h' : z-liftGrid L b∉L.lattice := by
        intro hm
        let w' : L.lattice := ⟨z-liftGrid L b,hm⟩
        have hE : gridEquiv L a (b,w')=gridEquiv L a (j,w) := by
          apply Subtype.ext
          simp only [coe_gridEquiv,ew,w',sub_add_cancel]
        exact hb (congrArg Prod.fst ((gridEquiv L a).injective hE))
      simp [mult,h']
    · simp
  · rw [Finset.sum_eq_zero (fun j _ => ?_)]
    · simp [mult,hz]
    · simp [mult,sub_regular L (show z∈regular L a from hz) j]

theorem order_formula (L : PeriodPair) (a : ℕ) [NeZero a] (z : ℂ) :
    meromorphicOrderAt (divisionProduct L a) z =
      ((2*mult L ((a:ℂ)*z)-2*(a:ℤ)^2*mult L z:ℤ):WithTop ℤ) := by
  classical
  rw [product_order]
  apply congrArg ((↑) : ℤ→WithTop ℤ)
  let term (j: Grid a) := mult L (z-liftGrid L j)+mult L (z+liftGrid L j)-2*mult L z
  change ∑ j ∈ divisionGrid L a,term j=_
  rw [divisionGrid,Finset.sum_filter_of_ne (fun j _ e => ?_)]
  · simp only [term,Finset.sum_sub_distrib,Finset.sum_add_distrib,Finset.sum_const,Finset.card_univ,
      Fintype.card_prod,Fintype.card_fin,nsmul_eq_mul,Nat.cast_mul,grid_sum]
    have eq (j : Grid a) : mult L (z+liftGrid L j)=mult L (-z-liftGrid L j) := by
      rw [show -z-liftGrid L j= -(z+liftGrid L j) by ring,mult_neg]
    simp only [eq,grid_sum,mul_neg,mult_neg]
    ring
  · dsimp [term] at e
    by_contra! hm
    rw [mult_sub_period L hm,show z+liftGrid L j=z-(-liftGrid L j) by ring,
      mult_sub_period L (L.lattice.neg_mem hm)] at e
    exact e (by ring)

end
end TunnellCMDivisor

#print axioms TunnellCMDivisor.order_formula
