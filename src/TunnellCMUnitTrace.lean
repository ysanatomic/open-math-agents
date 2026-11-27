import TunnellCMCritical
import TunnellCMEllipticUnit
import TunnellCMScale
import TunnellCMLemniscate
import TunnellCMWeights

/-! The first logarithmic derivative at the origin of an explicit elliptic function,
with the real period and conductor factors of the congruent-number twist. -/
namespace TunnellCMUnitTrace

open Complex Finset TunnellCMLSeries TunnellCMCritical TunnellCMLemniscate
open TunnellCMEllipticUnit TunnellCMDistribution TunnellEllipticZeta TunnellCoates
open scoped ComplexConjugate

noncomputable def dilation (n : ℕ) : ℝ := realPeriod n / (4*n)

lemma dilation_ne (n : ℕ) (hn : 0<n) : (dilation n:ℂ)≠0 :=
  ofReal_ne_zero.mpr (div_ne_zero (realPeriod_pos (by exact_mod_cast hn)).ne' (by positivity))

lemma base_dilations (n : ℕ) (hn : 0<n) :
    (twistPeriods n hn).ω₁=(dilation n:ℂ)*(periods n hn).ω₁ ∧
    (twistPeriods n hn).ω₂=(dilation n:ℂ)*(periods n hn).ω₂ := by
  dsimp [twistPeriods,periods,dilation]
  push_cast
  have hn' : (n:ℂ)≠0 := by exact_mod_cast hn.ne'
  constructor <;> field_simp [hn'] <;> ring

noncomputable def point (n : ℕ) (r : Residues n) : ℂ := (dilation n:ℂ)*(liftResidue r:ℂ)

lemma shift_regular (n : ℕ) (hn : 0<n) (r : Residues n) (hr : charWeight n (liftResidue r)≠0) :
    point n r∈regular (twistPeriods n hn) (aux n) := by
  let x := liftResidue r
  have hpr : TunnellGaussian.Primary x := by
    classical by_contra h
    exact hr (by change charWeight n x=0; simp [charWeight,h])
  have hout : (x:ℂ) ∉ (periods n hn).lattice := by
    rintro hx
    obtain ⟨k,l,h⟩ := PeriodPair.mem_lattice.mp hx
    have hr := congrArg re h
    have hi := congrArg im h
    rw [GaussianInt.toComplex_def] at hr hi
    simp [periods,mul_re,mul_im] at hr hi
    have xr : (x:ℂ).re=(x.re:ℝ) := by rw [GaussianInt.toComplex_def₂]
    have xi : (x:ℂ).im=(x.im:ℝ) := by rw [GaussianInt.toComplex_def₂]
    rw [xr] at hr
    rw [xi] at hi
    have e₁ : k*(4*n)=x.re := by exact_mod_cast hr
    have e₂ : l*(4*n)=x.im := by exact_mod_cast hi
    have e := (TunnellGaussian.primary_iff _).mp hpr |>.2
    rw [← e₁,← e₂,show k*(4*(n:ℤ))+l*(4*n)=(k*n+l*n)*4 by ring] at e
    omega
  intro h
  change (aux n:ℂ)*((dilation n:ℂ)*(x:ℂ)) ∈ (twistPeriods n hn).lattice at h
  rw [mul_left_comm] at h
  obtain ⟨h1,h2⟩ := base_dilations n hn
  have h' := (TunnellCMScale.lattice_mem _ _ (dilation_ne n hn) h1 h2 _).mp h
  exact hout (by simpa [sub_mul] using sub_mem h' (aux_integral n hn x))

noncomputable def weight (n : ℕ) (r : Residues n) := charWeight n (liftResidue r)

noncomputable def traceUnit (n : ℕ) (hn : 0<n) (Z : ℂ) : ℂ := by
  classical
  letI : NeZero (4*n) := ⟨by omega⟩
  exact ∏ r ∈ univ.filter (fun r => weight n r ≠ 0),
    divisionProduct (twistPeriods n hn) (aux n) (Z+point n r) ^ weight n r

lemma division_nonzero (M : PeriodPair) (a : ℕ) [NeZero a] {z : ℂ} (hz : z∈regular M a) :
    divisionProduct M a z ≠ 0 := by
  classical
  apply Finset.prod_ne_zero_iff.mpr
  intro j hj
  have hs : z∉M.lattice := fun h => hz (mul_mem M a h)
  have ht : liftGrid M j∉M.lattice := (Finset.mem_filter.mp hj).2
  exact sub_ne_zero.mpr (fun h => ((LSG.Weierstrass.weierstrassP_eq_iff M ht hs).mp h).elim
    (sub_regular M hz j) (add_regular M hz j))

lemma division_diff (M : PeriodPair) (a : ℕ) [NeZero a] {z : ℂ} (hz : z∈regular M a) :
    DifferentiableAt ℂ (divisionProduct M a) z := by
  have hs : z∉M.lattice := fun h => hz (mul_mem M a h)
  exact .fun_finsetProd (fun j _ => ((hasDerivP M hs).sub_const _).differentiableAt)

theorem derivative_sum (n : ℕ) (hn : 0<n) :
    logDeriv (traceUnit n hn) 0 =
      letI : NeZero (4*n) := ⟨by omega⟩
      ∑ r : Residues n, (weight n r:ℂ)*
        (2*multiplicationZeta (twistPeriods n hn) (aux n) (point n r)) := by
  classical
  letI : NeZero (4*n) := ⟨by omega⟩
  letI : NeZero (aux n) := ⟨by unfold aux; omega⟩
  let M := twistPeriods n hn
  let f (r : Residues n) (Z : ℂ) := divisionProduct M (aux n) (Z+point n r)
  have he {r : Residues n} (hr : weight n r≠0) : (0:ℂ)+point n r ∈ regular M (aux n) := by
    simpa using shift_regular n hn r hr
  have hdiff {r : Residues n} (hr : weight n r≠0) : DifferentiableAt ℂ (f r) 0 := by
    change DifferentiableAt ℂ ((divisionProduct M (aux n)) ∘ (fun Z : ℂ => Z+point n r)) 0
    exact (division_diff M (aux n) (he hr)).comp 0 (differentiableAt_id.add_const _)
  have hnz {r : Residues n} (hr : weight n r≠0) : f r 0≠0 := division_nonzero M (aux n) (he hr)
  change logDeriv (fun Z => ∏ r ∈ univ.filter (fun r => weight n r≠0), f r Z ^ weight n r) 0 = _
  rw [logDeriv_prod (f := fun r Z => f r Z ^ weight n r) (s := univ.filter (fun r => weight n r≠0))
    (fun r hr => zpow_ne_zero _ (hnz (mem_filter.mp hr).2))
    (fun r hr => (hdiff (mem_filter.mp hr).2).zpow (.inl (hnz (mem_filter.mp hr).2)))]
  rw [← Finset.sum_filter_of_ne (p := fun r => weight n r≠0) (s := univ)
    (fun r _ h => by contrapose! h; simp [h])]
  apply Finset.sum_congr rfl
  intro r hr
  have h := (mem_filter.mp hr).2
  rw [logDeriv_fun_zpow (hdiff h)]
  congr 1
  change logDeriv ((divisionProduct M (aux n)) ∘ (fun Z : ℂ => Z+point n r)) 0 = _
  rw [logDeriv_comp (g := fun Z : ℂ => Z+point n r) (x := 0)
    (division_diff M (aux n) (he h)) (differentiableAt_id.add_const _),
    ((hasDerivAt_id' (0:ℂ)).add_const (point n r)).deriv,zero_add,mul_one,log_divisionProduct M _ (shift_regular n hn r h)]

theorem critical_unit (n : ℕ) (hn : 0<n) (L : ℂ→ℂ) (hL : AnalyticOnNhd ℂ L Set.univ)
    (he : ∀ s : ℝ, 2<s → HasProd (fun p : Nat.Primes => if p.val ∣ 2*n then (1:ℂ) else
      let T : ℂ := (p.val:ℂ)^(-(s:ℂ))
      (1-(curveTrace n p:ℂ)*T+(p.val:ℂ)*T^2)⁻¹) (L s))
    (r : ℚ) (hv : L 1=(r:ℂ)*(realPeriod n:ℂ)) :
    logDeriv (traceUnit n hn) 0 = -2*(4*n:ℂ)*((aux n:ℂ)^2-(aux n:ℂ))*(r:ℂ) := by
  classical
  letI : NeZero (4*n) := ⟨by omega⟩
  have eL := central_trace n hn L hL (fun s hs =>
    (he s hs).unique (lattice_euler n s (by linarith)))
  let Z (r : Residues n) := multiplicationZeta (periods n hn) (aux n) (liftResidue r:ℂ)
  have ce : ∑ v : Residues n, (weight n v:ℂ)*Z v =
      -(((aux n:ℂ)^2-(aux n:ℂ))*(r:ℂ)*(realPeriod n:ℂ)) := by
    have e := congrArg (fun y : ℂ => -conj y) eL.symm
    rw [hv] at e
    simpa only [weight,Z,map_mul,map_sub,map_pow,map_natCast,map_ratCast,Complex.conj_ofReal,
      map_sum,map_neg,map_intCast,Complex.conj_conj,mul_neg,Finset.sum_neg_distrib,neg_neg,mul_assoc] using e
  obtain ⟨h1,h2⟩ := base_dilations n hn
  have hZ (v : Residues n) : multiplicationZeta (twistPeriods n hn) (aux n) (point n v) =
      (dilation n:ℂ)⁻¹*Z v := TunnellCMScale.multiplication_scale _ _ (dilation_ne n hn) h1 h2 _ _
  rw [derivative_sum]
  calc
    _ = (2*(dilation n:ℂ)⁻¹) * ∑ v : Residues n, (weight n v:ℂ)*Z v := by
      rw [Finset.mul_sum]
      apply Finset.sum_congr rfl
      intro v _
      rw [hZ]
      ring
    _ = _ := by
      rw [ce,dilation]
      have hΩ : (realPeriod n:ℂ) ≠ 0 := Complex.ofReal_ne_zero.mpr (realPeriod_pos (by exact_mod_cast hn)).ne'
      push_cast
      field_simp [hΩ]
      <;> ring

end TunnellCMUnitTrace

#print axioms TunnellCMUnitTrace.critical_unit
