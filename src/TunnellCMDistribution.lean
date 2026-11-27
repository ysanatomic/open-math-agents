import TunnellCMEllipticZeta
import Mathlib.Logic.Equiv.Fin.Basic

/-! Distribution of logarithmic derivatives under integer multiplication on a complex torus. -/
namespace TunnellCMDistribution

open Complex Filter Set
open scoped Topology PeriodPair

abbrev Grid (a : ℕ) := Fin a × Fin a

noncomputable def liftGrid (L : PeriodPair) {a : ℕ} (j : Grid a) : ℂ :=
  ((j.1.val:ℂ)*L.ω₁+(j.2.val:ℂ)*L.ω₂)/(a:ℂ)

noncomputable def gridEquiv (L : PeriodPair) (a : ℕ) [NeZero a] :
    Grid a × L.lattice ≃ L.lattice :=
  (Equiv.prodComm _ _).trans <|
  (L.latticeEquivProd.toEquiv.prodCongr (Equiv.refl _)).trans <|
  (Equiv.prodProdProdComm ℤ ℤ (Fin a) (Fin a)).trans <|
  ((Int.divModEquiv a).symm.prodCongr (Int.divModEquiv a).symm).trans L.latticeEquivProd.symm.toEquiv

lemma coe_gridEquiv (L : PeriodPair) (a : ℕ) [NeZero a] (j : Grid a) (w : L.lattice) :
    (gridEquiv L a (j,w):ℂ) = (a:ℂ)*((w:ℂ)+liftGrid L j) := by
  obtain ⟨v,rfl⟩ := L.latticeEquivProd.symm.surjective w
  change (L.latticeEquivProd.symm
      ((Int.divModEquiv a).symm ((L.latticeEquivProd (L.latticeEquivProd.symm v)).1,j.1),
       (Int.divModEquiv a).symm ((L.latticeEquivProd (L.latticeEquivProd.symm v)).2,j.2)):ℂ) = _
  rw [LinearEquiv.apply_symm_apply,L.latticeEquiv_symm_apply,L.latticeEquiv_symm_apply]
  simp only [Int.divModEquiv_symm_apply,Int.cast_add,Int.cast_mul,Int.cast_natCast,liftGrid]
  have ha : (a:ℂ)≠0 := by exact_mod_cast NeZero.ne a
  field_simp
  <;> ring

theorem derivP_distribution (L : PeriodPair) (a : ℕ) [NeZero a] (z : ℂ) :
    (∑ j : Grid a, L.derivWeierstrassP (z-liftGrid L j)) =
      (a:ℂ)^3 * L.derivWeierstrassP ((a:ℂ)*z) := by
  have ha : (a:ℂ)≠0 := by exact_mod_cast NeZero.ne a
  let term (p : Grid a × L.lattice) := -2/(z-liftGrid L p.1-(p.2:ℂ))^3
  have h0 := ((L.hasSum_derivWeierstrassP ((a:ℂ)*z)).mul_left ((a:ℂ)^3))
  have heq : (fun p : Grid a × L.lattice => (a:ℂ)^3 *
      (-2/((a:ℂ)*z-(gridEquiv L a p:ℂ))^3))=term := by
    funext ⟨j,w⟩
    change (a:ℂ)^3 * (-2/((a:ℂ)*z-(gridEquiv L a (j,w):ℂ))^3) = _
    rw [coe_gridEquiv,← mul_sub,mul_pow,div_mul_eq_div_div]
    dsimp [term]
    rw [show z-((w:ℂ)+liftGrid L j) = z-liftGrid L j-w by ring]
    field_simp
  have h : HasSum term ((a:ℂ)^3*L.derivWeierstrassP ((a:ℂ)*z)) := by
    rw [← heq]
    exact ((gridEquiv L a).hasSum_iff (f := fun w : L.lattice =>
      (a:ℂ)^3 * (-2/((a:ℂ)*z-(w:ℂ))^3))).mpr h0
  rw [← h.tsum_eq,h.summable.tsum_prod,tsum_fintype]
  apply Finset.sum_congr rfl
  intro j _
  exact (L.hasSum_derivWeierstrassP (z-liftGrid L j)).tsum_eq.symm

def regular (L : PeriodPair) (a : ℕ) := {z : ℂ | (a:ℂ)*z ∉ L.lattice}

lemma regular_open (L : PeriodPair) (a : ℕ) : IsOpen (regular L a) :=
  L.isClosed_lattice.isOpen_compl.preimage (continuous_const.mul continuous_id)

lemma regular_connected (L : PeriodPair) (a : ℕ) [NeZero a] : IsPreconnected (regular L a) := by
  let : Countable L.lattice := Countable.of_equiv _ L.latticeEquivProd.toEquiv.symm
  have count : (L.lattice : Set ℂ).Countable := to_countable _
  have ha : (a:ℂ) ≠ 0 := by exact_mod_cast NeZero.ne a
  exact ((count.preimage (mul_right_injective₀ ha)).isPathConnected_compl_of_one_lt_rank
    (by simp : 1 < Module.rank ℝ ℂ)).isConnected.isPreconnected

lemma mul_lift (L : PeriodPair) {a : ℕ} [NeZero a] (j : Grid a) :
    (a:ℂ)*liftGrid L j ∈ L.lattice := by
  have ha : (a:ℂ)≠0 := by exact_mod_cast NeZero.ne a
  rw [liftGrid,← mul_div_assoc,mul_div_cancel_left₀ _ ha]
  exact PeriodPair.mem_lattice.mpr ⟨(j.1.val:ℤ),(j.2.val:ℤ),by simp⟩

lemma mul_mem (L : PeriodPair) (a : ℕ) {z : ℂ} (hz : z ∈ L.lattice) :
    (a:ℂ)*z ∈ L.lattice := by
  rw [← nsmul_eq_mul]
  exact L.lattice.nsmul_mem hz _

lemma sub_regular (L : PeriodPair) {a : ℕ} [NeZero a] {z : ℂ} (hz : z∈regular L a) (j : Grid a) :
    z-liftGrid L j ∉ L.lattice := fun h => hz (by simpa [mul_sub] using add_mem (mul_mem L a h) (mul_lift L j))

lemma add_regular (L : PeriodPair) {a : ℕ} [NeZero a] {z : ℂ} (hz : z∈regular L a) (j : Grid a) :
    z+liftGrid L j ∉ L.lattice := fun h => hz (by simpa [mul_add] using sub_mem (mul_mem L a h) (mul_lift L j))

lemma neg_regular (L : PeriodPair) {a : ℕ} {z : ℂ} (hz : z∈regular L a) : -z∈regular L a := by
  simpa [regular] using hz

lemma hasDerivP (L : PeriodPair) {z : ℂ} (hz : z ∉ L.lattice) :
    HasDerivAt L.weierstrassP (L.derivWeierstrassP z) z := by
  simpa only [L.deriv_weierstrassP] using
    (L.differentiableOn_weierstrassP.differentiableAt (L.isClosed_lattice.isOpen_compl.mem_nhds hz)).hasDerivAt

theorem traceP (L : PeriodPair) (a : ℕ) [NeZero a] :
    ∃ A : ℂ, ∀ z ∈ regular L a,
      (∑ j : Grid a, L.weierstrassP (z-liftGrid L j)) = (a:ℂ)^2*L.weierstrassP ((a:ℂ)*z)+A := by
  let f (z : ℂ) := ∑ j : Grid a, L.weierstrassP (z-liftGrid L j)
  let g (z : ℂ) := (a:ℂ)^2*L.weierstrassP ((a:ℂ)*z)
  have h1 {z : ℂ} (hz : z∈regular L a) : HasDerivAt f ((a:ℂ)^3*L.derivWeierstrassP ((a:ℂ)*z)) z := by
    rw [← derivP_distribution]
    apply HasDerivAt.fun_sum
    intro j _
    simpa only [mul_one] using! (hasDerivP L (sub_regular L hz j)).comp z ((hasDerivAt_id' z).sub_const (liftGrid L j))
  have h2 {z : ℂ} (hz : z∈regular L a) : HasDerivAt g ((a:ℂ)^3*L.derivWeierstrassP ((a:ℂ)*z)) z := by
    apply (((hasDerivP L hz).comp z ((hasDerivAt_id' z).const_mul (a:ℂ))).const_mul ((a:ℂ)^2)).congr_deriv
    ring
  exact (regular_open L a).exists_eq_add_of_deriv_eq (regular_connected L a)
    (fun _ hz => (h1 hz).differentiableAt.differentiableWithinAt)
    (fun _ hz => (h2 hz).differentiableAt.differentiableWithinAt)
    (fun _ hz => (h1 hz).deriv.trans (h2 hz).deriv.symm)

open TunnellEllipticZeta

noncomputable def zetaTrace (L : PeriodPair) (a : ℕ) (z : ℂ) :=
    (∑ j : Grid a, (zeta L (z-liftGrid L j)+zeta L (z+liftGrid L j))) - 2*(a:ℂ)*zeta L ((a:ℂ)*z)

lemma zetaTrace_neg (L : PeriodPair) (a : ℕ) (z : ℂ) : zetaTrace L a (-z) = -zetaTrace L a z := by
  have e (u : ℂ) : zeta L (-z-u)+zeta L (-z+u) = -(zeta L (z-u)+zeta L (z+u)) := by
    rw [show -z-u=-(z+u) by ring,show -z+u=-(z-u) by ring,zeta_neg,zeta_neg]
    ring
  simp only [zetaTrace,e,Finset.sum_neg_distrib,mul_neg,zeta_neg]
  ring

lemma zetaTrace_shift (L : PeriodPair) {a : ℕ} [NeZero a] {z : ℂ} (hz : z∈regular L a) (l : L.lattice) :
    zetaTrace L a (z+l) = zetaTrace L a z := by
  have hl : (a:ℂ)*(l:ℂ)=((a • l : L.lattice):ℂ) := by simp [nsmul_eq_mul]
  have hinc : increment L (a • l)=(a:ℂ)*increment L l :=
    (map_nsmul (quasiPeriods L) a l).trans (nsmul_eq_mul a _)
  have e (j : Grid a) :
      zeta L (z+l-liftGrid L j)+zeta L (z+l+liftGrid L j) =
        (zeta L (z-liftGrid L j)+zeta L (z+liftGrid L j)) + 2*increment L l := by
    rw [show z+l-liftGrid L j=z-liftGrid L j+l by ring,
      show z+l+liftGrid L j=z+liftGrid L j+l by ring,zeta_shift L (sub_regular L hz j),
      zeta_shift L (add_regular L hz j)]
    ring
  simp only [zetaTrace,e,Finset.sum_add_distrib,Finset.sum_const,Finset.card_univ,
    Grid,Fintype.card_prod,Fintype.card_fin,nsmul_eq_mul,Nat.cast_mul,mul_add,hl,zeta_shift L hz,hinc]
  ring

theorem zeta_distribution (L : PeriodPair) (a : ℕ) [NeZero a] {z : ℂ} (hz : z∈regular L a) :
    zetaTrace L a z = 0 := by
  obtain ⟨A,hA⟩ := traceP L a
  have plus (v : ℂ) (hv : v∈regular L a) : (∑ j : Grid a, L.weierstrassP (v+liftGrid L j)) =
      (a:ℂ)^2*L.weierstrassP ((a:ℂ)*v)+A := by
    have E (u : ℂ) : L.weierstrassP (-v-u)=L.weierstrassP (v+u) := by
      rw [show -v-u=-(v+u) by ring,L.weierstrassP_neg]
    simpa only [E,mul_neg,L.weierstrassP_neg] using hA (-v) (neg_regular L hv)
  have hD (v : ℂ) (hv : v∈regular L a) : HasDerivAt (zetaTrace L a) (-2*A) v := by
    have D₁ (j : Grid a) : HasDerivAt (fun w => zeta L (w-liftGrid L j)+zeta L (w+liftGrid L j))
        (-(L.weierstrassP (v-liftGrid L j))-L.weierstrassP (v+liftGrid L j)) v := by
      simpa only [mul_one,sub_eq_add_neg] using!
        ((zeta_deriv L _ (sub_regular L hv j)).comp v ((hasDerivAt_id' v).sub_const (liftGrid L j))).add
          ((zeta_deriv L _ (add_regular L hv j)).comp v ((hasDerivAt_id' v).add_const (liftGrid L j)))
    apply ((HasDerivAt.fun_sum (u := Finset.univ) (fun j _ => D₁ j)).sub
      (((zeta_deriv L _ hv).comp v ((hasDerivAt_id' v).const_mul (a:ℂ))).const_mul (2*(a:ℂ)))).congr_deriv
    rw [Finset.sum_sub_distrib,Finset.sum_neg_distrib,hA v hv,plus v hv]
    ring
  have lin (v : ℂ) : HasDerivAt (fun x : ℂ => (-2*A)*x) (-2*A) v := by
    simpa using (hasDerivAt_id' v).const_mul (-2*A)
  obtain ⟨B,hB⟩ := (regular_open L a).exists_eq_add_of_deriv_eq (regular_connected L a)
    (fun v hv => (hD v hv).differentiableAt.differentiableWithinAt)
    (fun v _ => (lin v).differentiableAt.differentiableWithinAt)
    (fun v hv => (hD v hv).deriv.trans (lin v).deriv.symm)
  let l : L.lattice := ⟨L.ω₁,L.ω₁_mem_lattice⟩
  have hp : z+(l:ℂ) ∈ regular L a := fun h => hz (by
    simpa only [mul_add,add_sub_cancel_right] using sub_mem h (mul_mem L a l.property))
  have hlin (v : ℂ) (hv : v∈regular L a) : zetaTrace L a v=(-2*A)*v+B := hB hv
  have d := zetaTrace_shift L hz l
  rw [hlin _ hp,hlin _ hz] at d
  have hzero : A*(l:ℂ)=0 := by linear_combination -d/2
  have he : (l:ℂ) ≠ 0 := L.indep.ne_zero (0 : Fin 2)
  have ha := (mul_eq_zero.mp hzero).resolve_right he
  have n := zetaTrace_neg L a z
  rw [hlin _ (neg_regular L hz),hlin _ hz,ha] at n
  rw [hlin _ hz,ha]
  linear_combination n/2

end TunnellCMDistribution

#print axioms TunnellCMDistribution.zeta_distribution
