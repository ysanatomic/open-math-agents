import TunnellCMResidues
import TunnellCMRegularized

/-! The critical CM L-value as a finite trace of multiplication-zeta values. -/

namespace TunnellCMCritical

open Complex Filter Set TunnellCMRegularized TunnellCMLSeries
open scoped Topology ComplexConjugate

noncomputable def periods (n : ℕ) (hn : 0<n) : PeriodPair where
  ω₁ := (4*n:ℕ)
  ω₂ := ((4*n:ℕ):ℂ)*I
  indep := by
    apply LinearIndependent.pair_iff.mpr
    intro x y he
    have hr := congrArg re he
    have hi := congrArg im he
    simp [Complex.mul_re,Complex.mul_im,hn.ne'] at hr hi
    exact ⟨hr,hi⟩

noncomputable def aux (n : ℕ) := 1+3*(4*n)

lemma aux_integral (n : ℕ) (hn : 0<n) (z : GaussianInt) :
    (((aux n:ℕ):ℂ)-1)*(z:ℂ) ∈ (periods n hn).lattice := by
  apply PeriodPair.mem_lattice.mpr
  refine ⟨3*z.re,3*z.im,?_⟩
  rw [GaussianInt.toComplex_def]
  simp [periods,aux]
  ring

lemma coe_sub_mem (n : ℕ) (hn : 0<n) {x y : GaussianInt} (he : residue n x=residue n y) :
    (x:ℂ)-(y:ℂ) ∈ (periods n hn).lattice := by
  have hx := (ZMod.intCast_eq_intCast_iff_dvd_sub y.re x.re (4*n)).mp (congrArg Prod.fst he.symm)
  have hy := (ZMod.intCast_eq_intCast_iff_dvd_sub y.im x.im (4*n)).mp (congrArg Prod.snd he.symm)
  obtain ⟨k,hk⟩ := hx
  obtain ⟨l,hl⟩ := hy
  refine PeriodPair.mem_lattice.mpr ⟨k,l,?_⟩
  have e₁ := congrArg (Int.cast : ℤ → ℂ) hk
  have e₂ := congrArg (Int.cast : ℤ → ℂ) hl
  simp only [Int.cast_sub,Int.cast_mul,Int.cast_natCast] at e₁ e₂
  change _ * (↑(4*n:ℕ):ℂ) + _ * ((↑(4*n:ℕ):ℂ)*I) = _
  rw [GaussianInt.toComplex_def,GaussianInt.toComplex_def]
  linear_combination -e₁-I*e₂

noncomputable def shiftMap (n : ℕ) (hn : 0<n) (r : Residues n)
    (x : {z : GaussianInt // residue n z=r}) : (periods n hn).lattice :=
  ⟨(x.val:ℂ)-(liftResidue r:ℂ), coe_sub_mem n hn (x.property.trans (residue_lift hn r).symm)⟩

lemma shift_bijective (n : ℕ) (hn : 0<n) (r : Residues n) : Function.Bijective (shiftMap n hn r) := by
  constructor
  · intro x y he
    have h := congrArg Subtype.val he
    apply Subtype.ext
    apply GaussianInt.toComplex_injective
    change (x.val:ℂ)-(liftResidue r:ℂ) = (y.val:ℂ)-(liftResidue r:ℂ) at h
    exact sub_left_inj.mp h
  · intro w
    obtain ⟨k,l,hw⟩ := PeriodPair.mem_lattice.mp w.property
    let y := liftResidue r
    let x : GaussianInt := ⟨y.re + (4*n:ℕ)*k, y.im + (4*n:ℕ)*l⟩
    have hx : residue n x=residue n y := by
      have hzero : ((↑(4*n:ℕ):ℤ) : ZMod (4*n)) = 0 := by simp only [Int.cast_natCast,ZMod.natCast_self]
      apply Prod.ext <;> simp only [residue,x,Int.cast_add,Int.cast_mul,hzero,zero_mul,add_zero]
    refine ⟨⟨x,hx.trans (residue_lift hn r)⟩,Subtype.ext ?_⟩
    change (x:ℂ)-(y:ℂ)=(w:ℂ)
    rw [← hw,GaussianInt.toComplex_def,GaussianInt.toComplex_def]
    change _ = (k:ℂ)*(↑(4*n:ℕ):ℂ)+(l:ℂ)*((↑(4*n:ℕ):ℂ)*I)
    simp only [x,Int.cast_add,Int.cast_mul,Int.cast_natCast]
    ring

lemma kernel_gaussian (s : ℝ) (z : GaussianInt) :
    kernel (s:ℂ) (z:ℂ) = gaussianTerm s z := by
  by_cases h : z=0
  · simp [h,kernel,gaussianTerm]
  have hp := norm_pos_iff.mpr (GaussianInt.toComplex_eq_zero.not.mpr h)
  rw [kernel,gaussianTerm,norm_sq_real,Real.rpow_def_of_pos (sq_pos_of_pos hp),Real.log_pow]
  have e : (-2:ℂ)*(s:ℂ)*(Real.log ‖(z:ℂ)‖ : ℂ) =
      -(↑((2:ℝ)*Real.log ‖(z:ℂ)‖*s):ℂ) := by push_cast; ring
  rw [e, Complex.exp_neg,← ofReal_exp,div_eq_mul_inv]
  norm_num

lemma shifted_residue (n : ℕ) (hn : 0<n) (r : Residues n) (s : ℝ) :
    (∑' w : (periods n hn).lattice, kernel (s:ℂ) (w+(liftResidue r:ℂ))) = residueSum n s r := by
  let e := Equiv.ofBijective _ (shift_bijective n hn r)
  rw [← e.tsum_eq (fun w : (periods n hn).lattice => kernel (s:ℂ) (w+(liftResidue r:ℂ)))]
  apply tsum_congr
  intro x
  change kernel (s:ℂ) (((x.val:ℂ)-(liftResidue r:ℂ))+(liftResidue r:ℂ)) = _
  rw [sub_add_cancel,kernel_gaussian]

noncomputable def traceSeries (n : ℕ) (hn : 0<n) (s : ℂ) : ℂ :=
  letI : NeZero (4*n) := ⟨by omega⟩
  ∑ r : Residues n, (charWeight n (liftResidue r):ℂ) *
    regularized (periods n hn) (aux n) (liftResidue r:ℂ) s

lemma traceSeries_large (n : ℕ) (hn : 0<n) (s : ℝ) (hs : 3/2<s) :
    traceSeries n hn s = ((aux n:ℂ)^2-(aux n:ℂ))*latticeValue n s := by
  letI : NeZero (4*n) := ⟨by omega⟩
  rw [traceSeries,lattice_by_residues n hn s hs,Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro r _
  rw [regularized_large _ _ _ _ (by simpa using hs) (aux_integral n hn (liftResidue r)),
    shifted_residue]
  ring

lemma traceSeries_analytic (n : ℕ) (hn : 0<n) : AnalyticOnNhd ℂ (traceSeries n hn) domain := by
  letI : NeZero (4*n) := ⟨by omega⟩
  apply DifferentiableOn.analyticOnNhd _ domain_open
  unfold traceSeries
  apply DifferentiableOn.fun_sum
  intro r _
  exact (regularized_holomorphic _ _ _).const_mul _

theorem central_trace (n : ℕ) (hn : 0<n) (L : ℂ → ℂ) (hL : AnalyticOnNhd ℂ L univ)
    (he : ∀ s : ℝ, 2<s → L s=latticeValue n s) :
    ((aux n:ℂ)^2-(aux n:ℂ))*L 1 =
        letI : NeZero (4*n) := ⟨by omega⟩
        ∑ r : Residues n, (charWeight n (liftResidue r):ℂ) *
          (-conj (TunnellEllipticZeta.multiplicationZeta (periods n hn) (aux n) (liftResidue r:ℂ))) := by
  letI : NeZero (4*n) := ⟨by omega⟩
  let G (s : ℂ) := ((aux n:ℂ)^2-(aux n:ℂ))*L s
  have hG : AnalyticOnNhd ℂ G domain := analyticOnNhd_const.mul (hL.mono (subset_univ _))
  have hm : Tendsto ((↑):ℝ → ℂ) (𝓝[≠] (3:ℝ)) (𝓝[≠] (3:ℂ)) := by
    apply continuous_ofReal.continuousWithinAt.tendsto_nhdsWithin
    intro x hx hy
    apply hx
    change (x:ℂ)=(3:ℂ) at hy
    exact_mod_cast hy
  have heq : EqOn G (traceSeries n hn) domain :=
    hG.eqOn_of_preconnected_of_frequently_eq (traceSeries_analytic n hn)
      (convex_halfSpace_re_gt _).isPreconnected (by norm_num [domain] : (3:ℂ)∈domain) <|
      hm.frequently <| Filter.Eventually.frequently <| by
        filter_upwards [(eventually_gt_nhds (show (2:ℝ)<3 by norm_num)).filter_mono nhdsWithin_le_nhds] with s hs
        dsimp [G]
        rw [he _ hs,traceSeries_large _ _ _ (by linarith)]
  calc
    _ = traceSeries n hn 1 := heq (by norm_num [domain] : (1:ℂ)∈domain)
    _ = _ := by simp only [traceSeries,regularized_critical]

end TunnellCMCritical

#print axioms TunnellCMCritical.central_trace
