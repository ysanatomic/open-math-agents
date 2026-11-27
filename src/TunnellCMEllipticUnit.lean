import TunnellCMDistribution
import LSG.Weierstrass.Degree

/-! Expression of the multiplication-zeta value as the logarithmic derivative of the
product over nonzero division points. -/

namespace TunnellCMEllipticUnit

open Complex Set Filter TunnellEllipticZeta TunnellCMDistribution
open scoped Topology PeriodPair
open LSG.Weierstrass (sigma sigma_identity logDeriv_sigma weierstrassP_eq_iff)

lemma same_zeta (L : PeriodPair) (z : ℂ) : LSG.Weierstrass.zeta L z=zeta L z := by
  simp only [LSG.Weierstrass.zeta,LSG.Weierstrass.zetaSummand,zeta,summand,one_div]

lemma log_pair (L : PeriodPair) {z u : ℂ} (hz : z∉L.lattice) (hu : u∉L.lattice)
    (hm : z-u∉L.lattice) (hp : z+u∉L.lattice) :
    logDeriv (fun w => L.weierstrassP w - L.weierstrassP u) z =
      zeta L (z-u)+zeta L (z+u)-2*zeta L z := by
  obtain ⟨c,hc,h⟩ := sigma_identity L hu
  have hP := hasDerivP L hz
  have hne : L.weierstrassP z - L.weierstrassP u ≠ 0 := sub_ne_zero.mpr (fun e =>
    ((weierstrassP_eq_iff L hu hz).mp e).elim hm hp)
  have hS := LSG.Weierstrass.differentiable_sigma L
  have hSn {v : ℂ} (hv : v∉L.lattice) : sigma L v≠0 := LSG.Weierstrass.sigma_ne_zero L hv
  have elm := (hasDerivAt_id' z).sub_const u
  have elp := (hasDerivAt_id' z).add_const u
  have hds : logDeriv (fun w : ℂ => sigma L (w-u)) z = zeta L (z-u) := by
    change logDeriv ((sigma L) ∘ (fun w : ℂ => w-u)) z = _
    rw [logDeriv_comp (hS _) elm.differentiableAt,elm.deriv,logDeriv_sigma L hm,same_zeta,mul_one]
  have hda : logDeriv (fun w : ℂ => sigma L (w+u)) z = zeta L (z+u) := by
    change logDeriv ((sigma L) ∘ (fun w : ℂ => w+u)) z = _
    rw [logDeriv_comp (hS _) elp.differentiableAt,elp.deriv,logDeriv_sigma L hp,same_zeta,mul_one]
  have ev : (fun w => (L.weierstrassP w-L.weierstrassP u)*sigma L w^2) =ᶠ[𝓝 z]
      fun w => c*(sigma L (w-u)*sigma L (w+u)) := by
    filter_upwards [L.isClosed_lattice.isOpen_compl.mem_nhds hz] with w hw using h w hw
  have he := (logDeriv_congr_nhds ev).self_of_nhds
  rw [logDeriv_mul (f := fun w => L.weierstrassP w-L.weierstrassP u) (g := fun w => sigma L w^2)
    z hne (pow_ne_zero 2 (hSn hz)) (hP.sub_const _).differentiableAt ((hS z).pow 2),
    logDeriv_fun_pow (hS z),logDeriv_sigma L hz,same_zeta,logDeriv_const_mul z c hc,
    logDeriv_mul (f := fun w => sigma L (w-u)) (g := fun w => sigma L (w+u)) z
      (hSn hm) (hSn hp) ((hS _).comp z elm.differentiableAt) ((hS _).comp z elp.differentiableAt),
    hds,hda] at he
  linear_combination he

noncomputable def divisionGrid (L : PeriodPair) (a : ℕ) : Finset (Grid a) := by
  classical exact Finset.univ.filter (fun j => liftGrid L j ∉ L.lattice)

noncomputable def divisionProduct (L : PeriodPair) (a : ℕ) (z : ℂ) :=
  ∏ j ∈ divisionGrid L a, (L.weierstrassP z - L.weierstrassP (liftGrid L j))

theorem log_divisionProduct (L : PeriodPair) (a : ℕ) [NeZero a] {z : ℂ} (hz : z∈regular L a) :
    logDeriv (divisionProduct L a) z = 2*multiplicationZeta L a z := by
  classical
  have hs : z ∉ L.lattice := fun h => hz (mul_mem L a h)
  let term (j : Grid a) := zeta L (z-liftGrid L j)+zeta L (z+liftGrid L j)-2*zeta L z
  have e (j : Grid a) (hj : j ∈ divisionGrid L a) : liftGrid L j ∉ L.lattice := (Finset.mem_filter.mp hj).2
  have hn (j : Grid a) (hj : j ∈ divisionGrid L a) :
      L.weierstrassP z-L.weierstrassP (liftGrid L j)≠0 :=
    sub_ne_zero.mpr (fun h => ((weierstrassP_eq_iff L (e j hj) hs).mp h).elim (sub_regular L hz j) (add_regular L hz j))
  have hg (j : Grid a) (hj : j ∉ divisionGrid L a) : term j=0 := by
    have hm : liftGrid L j ∈ L.lattice := by simpa [divisionGrid] using hj
    let l : L.lattice := ⟨liftGrid L j,hm⟩
    have hneg : increment L (-l) = -increment L l := map_neg (quasiPeriods L) l
    change zeta L (z-l)+zeta L (z+l)-2*zeta L z=0
    rw [show z-(l:ℂ)=z+((-l : L.lattice):ℂ) by simp [sub_eq_add_neg],
      zeta_shift L hs (-l),zeta_shift L hs l,hneg]
    ring
  have hlog : logDeriv (divisionProduct L a) z = ∑ j ∈ divisionGrid L a, term j := by
    unfold divisionProduct
    rw [logDeriv_prod hn (fun j _ => ((hasDerivP L hs).sub_const _).differentiableAt)]
    exact Finset.sum_congr rfl (fun j hj => log_pair L hs (e j hj) (sub_regular L hz j) (add_regular L hz j))
  rw [hlog,Finset.sum_subset (Finset.subset_univ _) (fun j _ hj => hg j hj)]
  dsimp only [term]
  rw [Finset.sum_sub_distrib,Finset.sum_const,Finset.card_univ]
  have h := zeta_distribution L a hz
  unfold zetaTrace at h
  simp only [Grid,Fintype.card_prod,Fintype.card_fin,nsmul_eq_mul,Nat.cast_mul,multiplicationZeta]
  linear_combination h

end TunnellCMEllipticUnit

#print axioms TunnellCMEllipticUnit.log_divisionProduct
