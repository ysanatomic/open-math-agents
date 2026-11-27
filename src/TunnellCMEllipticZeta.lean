import Mathlib.Analysis.SpecialFunctions.Elliptic.Weierstrass
import Mathlib.Analysis.Normed.Module.Connected

/-! The regularized Weierstrass zeta function for constructing logarithmic derivatives of elliptic units. -/

namespace TunnellEllipticZeta

open Complex Filter Set
open scoped Topology PeriodPair

noncomputable def summand (w z : ℂ) := (z-w)⁻¹ + w⁻¹ + z/w^2
noncomputable def zeta (L : PeriodPair) (z : ℂ) := ∑' w : L.lattice, summand w z

lemma bound (r : ℝ) (hr : 0<r) (w z : ℂ) (hz : ‖z‖<r) (hw : 2*r≤‖w‖) :
    ‖summand w z‖ ≤ 2*r^2*‖w‖^(-3:ℝ) := by
  have hp : 0<‖w‖ := by linarith
  have hw0 := norm_pos_iff.mp hp
  have hzw : z-w≠0 := sub_ne_zero.mpr (fun e => by rw [e] at hz; linarith)
  have hdist : ‖w‖/2 ≤ ‖z-w‖ := by
    rw [norm_sub_rev]
    linarith [norm_sub_norm_le w z]
  have e : summand w z = z^2/(w^2*(z-w)) := by
    unfold summand
    field_simp
    ring
  rw [e,norm_div,norm_pow,norm_mul,norm_pow]
  calc
    _ ≤ r^2/(‖w‖^2*(‖w‖/2)) := by gcongr
    _ = 2*r^2*‖w‖^(-3:ℝ) := by
      rw [Real.rpow_neg hp.le, Real.rpow_ofNat]
      field_simp

theorem locally_uniform (L : PeriodPair) :
    HasSumLocallyUniformly (fun (w : L.lattice) z => summand w z) (zeta L) := by
  refine L.hasSumLocallyUniformly_aux _ (fun r w => 2*r^2*‖w‖^(-3:ℝ))
    (fun _ _ => (ZLattice.summable_norm_rpow _ _ (by simp; norm_num)).mul_left _) ?_
  intro r hr
  filter_upwards [eventually_ge_atTop (2*r)] with R hR
  rintro z hz w rfl
  exact bound r hr w z hz hR

lemma summand_deriv (w z : ℂ) (hz : z≠w) :
    HasDerivAt (summand w) (-(1/(z-w)^2-1/w^2)) z := by
  have h := ((((hasDerivAt_id z).sub_const w).inv (sub_ne_zero.mpr hz)).add_const w⁻¹).add
    ((hasDerivAt_id z).div_const (w^2))
  apply h.congr_deriv
  dsimp
  ring

theorem zeta_deriv (L : PeriodPair) (z : ℂ) (hz : z ∉ L.lattice) :
    HasDerivAt (zeta L) (-L.weierstrassP z) z := by
  let U := (L.lattice : Set ℂ)ᶜ
  have ho : IsOpen U := L.isClosed_lattice.isOpen_compl
  have hdiff (s : Finset L.lattice) : DifferentiableOn ℂ (fun u => ∑ w ∈ s, summand w u) U := by
    apply DifferentiableOn.fun_sum
    intro w _
    exact fun u hu => (summand_deriv w u (fun e => hu (e ▸ w.property))).differentiableAt.differentiableWithinAt
  have hfun := (locally_uniform L).tendstoLocallyUniformlyOn (s := U)
  have hd := (hfun.deriv (.of_forall hdiff) ho).tendsto_at hz
  have e : deriv (zeta L) z = -L.weierstrassP z := by
    apply tendsto_nhds_unique hd
    apply ((L.hasSum_weierstrassP z).neg).congr'
    apply Filter.Eventually.of_forall
    intro s
    simp only [Function.comp_def]
    rw [deriv_fun_sum (fun (w : L.lattice) _ => (summand_deriv w z (fun e => hz (e ▸ w.property))).differentiableAt)]
    apply Finset.sum_congr rfl
    intro w _
    exact (summand_deriv w z (fun e => hz (e ▸ w.property))).deriv.symm
  rw [← e]
  exact (hfun.differentiableOn (.of_forall hdiff) ho).differentiableAt (ho.mem_nhds hz) |>.hasDerivAt

lemma zeta_neg (L : PeriodPair) (z : ℂ) : zeta L (-z) = -zeta L z := by
  unfold zeta
  rw [← tsum_neg]
  convert (Equiv.neg L.lattice).tsum_eq (fun w : L.lattice => -summand w z) using 1
  apply tsum_congr
  intro w
  simp only [Equiv.neg_apply,Submodule.coe_neg,summand]
  rw [show -z-(w:ℂ) = -(z-(-w:ℂ)) by ring, inv_neg]
  simp only [inv_neg,neg_sq,neg_div]
  ring

lemma quasi_period (L : PeriodPair) (l : L.lattice) :
    ∃ A : ℂ, ∀ z ∉ L.lattice, zeta L (z+l)=zeta L z+A := by
  let U := (L.lattice : Set ℂ)ᶜ
  have hcnt : (L.lattice : Set ℂ).Countable := by
    let : Countable L.lattice := Countable.of_equiv _ L.latticeEquivProd.toEquiv.symm
    exact to_countable _
  have hr : 1 < Module.rank ℝ ℂ := by simp
  have hc : IsPreconnected U := (hcnt.isPathConnected_compl_of_one_lt_rank hr).isConnected.isPreconnected
  have ho : IsOpen U := L.isClosed_lattice.isOpen_compl
  have hu {z : ℂ} (hz : z∈U) : z+(l:ℂ)∈U := fun e => hz (by
    simpa using sub_mem e l.property)
  have da {z : ℂ} (hz : z∈U) : HasDerivAt (fun w : ℂ => zeta L (w+l)) (-L.weierstrassP z) z := by
    simpa only [L.weierstrassP_add_coe,mul_one,Function.comp_def,id_eq] using! (zeta_deriv L _ (hu hz)).comp z ((hasDerivAt_id z).add_const (l:ℂ))
  obtain ⟨A,hA⟩ := ho.exists_eq_add_of_deriv_eq hc
    (fun z hz => (da hz).differentiableAt.differentiableWithinAt)
    (fun z hz => (zeta_deriv L z hz).differentiableAt.differentiableWithinAt)
    (fun z hz => (da hz).deriv.trans (zeta_deriv L z hz).deriv.symm)
  exact ⟨A,fun z hz => hA hz⟩

private lemma translate_outside (L : PeriodPair) {z : ℂ} (hz : z ∉ L.lattice)
    (l : L.lattice) : z+(l:ℂ) ∉ L.lattice := fun e => hz (by simpa using sub_mem e l.property)

noncomputable def increment (L : PeriodPair) (l : L.lattice) : ℂ :=
  zeta L (L.ω₁/2 + l) - zeta L (L.ω₁/2)

lemma zeta_shift (L : PeriodPair) {z : ℂ} (hz : z ∉ L.lattice) (l : L.lattice) :
    zeta L (z+l) = zeta L z + increment L l := by
  obtain ⟨A, hA⟩ := quasi_period L l
  rw [increment, hA _ L.ω₁_div_two_notMem_lattice, hA _ hz]
  ring

noncomputable def quasiPeriods (L : PeriodPair) : L.lattice →+ ℂ where
  toFun := increment L
  map_zero' := by simp [increment]
  map_add' l k := by
    change zeta L (L.ω₁/2 + ((l+k : L.lattice):ℂ)) - _ = _
    rw [Submodule.coe_add, ← add_assoc,
      zeta_shift L (translate_outside L L.ω₁_div_two_notMem_lattice l) k,
      zeta_shift L L.ω₁_div_two_notMem_lattice l]
    ring

/-- The logarithmic derivative of the integer-multiplication elliptic unit. -/
noncomputable def multiplicationZeta (L : PeriodPair) (a : ℕ) (z : ℂ) : ℂ :=
  (a:ℂ) * zeta L ((a:ℂ)*z) - (a:ℂ)^2 * zeta L z

lemma multiplicationZeta_periodic (L : PeriodPair) (a : ℕ) (z : ℂ) (l : L.lattice)
    (hz : z ∉ L.lattice) (haz : (a:ℂ)*z ∉ L.lattice) :
    multiplicationZeta L a (z+l) = multiplicationZeta L a z := by
  have H : increment L (a • l) = (a:ℂ) * increment L l :=
    (map_nsmul (quasiPeriods L) a l).trans (nsmul_eq_mul a _)
  have e : (a:ℂ)*(l:ℂ) = ((a • l : L.lattice):ℂ) := by simp [nsmul_eq_mul]
  unfold multiplicationZeta
  rw [mul_add, e, zeta_shift L haz, zeta_shift L hz, H]
  ring

lemma multiplicationZeta_odd (L : PeriodPair) (a : ℕ) (z : ℂ) :
    multiplicationZeta L a (-z) = -multiplicationZeta L a z := by
  simp only [multiplicationZeta, mul_neg, zeta_neg]
  ring

end TunnellEllipticZeta
#print axioms TunnellEllipticZeta.quasi_period
