import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H1_R1

namespace TunnellEvenInputEta

/-!
# The base cusp form for the congruent-number curves

The twelfth power of the eta product is a product of two rational dilates of
the modular discriminant. Its multiplier therefore has finite image, and on
the kernel the eta product is a weight-two cusp form. Its period is one.
Uniform convergence of the truncated products on compact subsets of the disk
identifies the Fourier coefficients with the prescribed integer coefficients.
-/

namespace TunnellRoot

open Complex UpperHalfPlane Matrix MatrixGroups ModularForm
open scoped Manifold Topology

lemma pow_slash (f : ℍ → ℂ) (g : SL(2, ℤ)) (k n : ℕ) :
    (f ^ n) ∣[((n*k : ℕ) : ℤ)] g = (f ∣[(k:ℤ)] g) ^ n := by
  induction n with
  | zero =>
    ext z
    simp [SL_slash_apply]
  | succ n ih =>
    rw [pow_succ, Nat.succ_mul, Nat.cast_add, mul_slash_SL2, ih, pow_succ]

lemma zero_of_twelfth_power {f : ℍ → ℂ} (h : IsZeroAtImInfty (f ^ 12)) : IsZeroAtImInfty f := by
  rw [isZeroAtImInfty_iff] at h ⊢
  intro ε hε
  obtain ⟨b,hb⟩ := h (ε^12) (by positivity)
  refine ⟨b, fun z hz => ?_⟩
  have ht := hb z hz
  simp only [Pi.pow_apply, norm_pow] at ht
  exact le_of_pow_le_pow_left₀ (by decide : 12 ≠ 0) hε.le ht

lemma constant_of_twelfth_power (q : ℍ → ℂ) (hq : Continuous q) (hp : ∀ z, q z ^ 12 = 1)
    (x y : ℍ) : q x = q y := by
  let Z := Polynomial.nthRootsFinset 12 (1:ℂ)
  apply isPreconnected_univ.constant_of_mapsTo (T := (Z : Set ℂ)) Z.finite_toSet.isDiscrete
    hq.continuousOn _ (Set.mem_univ x) (Set.mem_univ y)
  exact fun z _ => (Polynomial.mem_nthRootsFinset (by decide : 0 < 12) 1).mpr (hp z)

theorem exists_cusp_root {Γ : Subgroup SL(2, ℤ)} [Γ.FiniteIndex] (hT : ModularGroup.T ∈ Γ)
    (f : ℍ → ℂ) (hhol : MDiff f) (hf : ∀ z, f z ≠ 0)
    (hperiod : f ∣[(2 : ℤ)] ModularGroup.T = f)
    (F : CuspForm (Γ : Subgroup (GL (Fin 2) ℝ)) 24) (hpow : ⇑F = f ^ 12) :
    ∃ H : Subgroup SL(2, ℤ), H.FiniteIndex ∧ ModularGroup.T ∈ H ∧
      ∃ G : CuspForm (H : Subgroup (GL (Fin 2) ℝ)) 2, ⇑G = f := by
  classical
  let base : ℍ := UpperHalfPlane.I
  let ratio (g : Γ) (z : ℍ) := (f ∣[(2 : ℤ)] (g.val)) z / f z
  have hpowg (g : Γ) : (f ∣[(2 : ℤ)] (g.val)) ^ 12 = f^12 := by
    have hh : (f^12) ∣[(24:ℤ)] g.val = (f∣[(2:ℤ)]g.val)^12 := pow_slash f g.val 2 12
    rw [← hh, ← hpow]
    exact F.slash_action_eq' _ ⟨g.val,g.property,rfl⟩
  have hrpow (g : Γ) (z : ℍ) : ratio g z ^ 12 = 1 := by
    have ht := congrFun (hpowg g) z
    change ((f ∣[(2 : ℤ)] (g.val)) z)^12 = f z ^12 at ht
    dsimp only [ratio]
    rw [div_pow, ht, div_self (pow_ne_zero _ (hf z))]
  have hrc (g : Γ) (z : ℍ) : ratio g z = ratio g base := by
    apply constant_of_twelfth_power _ _ (hrpow g)
    exact (hhol.slash 2 (g.val : GL (Fin 2) ℝ)).continuous.div hhol.continuous hf
  have hslash (g : Γ) : f ∣[(2 : ℤ)] g.val = ratio g base • f := by
    funext z
    exact (div_eq_iff (hf z)).mp (hrc g z)
  let χ : Γ →* ℂ := {
    toFun := fun g => ratio g base
    map_one' := by simp [ratio, hf]
    map_mul' := by
      intro g h
      have heq : (f ∣[(2 : ℤ)] ((g*h).val)) = (ratio g base * ratio h base) • f := by
        rw [Subgroup.coe_mul, SlashAction.slash_mul, hslash g, SL_slash,
          smul_slash, ← SL_slash, hslash h]
        simp [σ, smul_smul]
      exact (div_eq_iff (hf base)).mpr (congrFun heq base) }
  let χ' : Γ →* rootsOfUnity 12 ℂ := χ.toHomUnits.codRestrict _ (fun g => by
    change χ.toHomUnits g ^ 12 = 1
    ext
    exact hrpow g base)
  let H := χ'.ker.map Γ.subtype
  have hH : H.FiniteIndex := by
    constructor
    rw [Subgroup.index_map_subtype]
    exact Nat.mul_ne_zero (Subgroup.FiniteIndex.index_ne_zero (H := χ'.ker)) (Subgroup.FiniteIndex.index_ne_zero (H := Γ))
  have hker (g : Γ) : g ∈ χ'.ker ↔ ratio g base = 1 := by
    change χ' g = 1 ↔ _
    simp only [Subtype.ext_iff, Units.ext_iff]
    rfl
  have hsH (γ : SL(2, ℤ)) (hγ : γ ∈ H) : f ∣[(2 : ℤ)] γ = f := by
    obtain ⟨g,hg,rfl⟩ := hγ
    change f ∣[(2:ℤ)] g.val = f
    rw [hslash g, hker g |>.mp hg, one_smul]
  have hT' : ModularGroup.T ∈ H := by
    refine ⟨⟨_,hT⟩, (hker _).mpr ?_, rfl⟩
    simp [ratio, hperiod, hf]
  refine ⟨H,hH,hT', { toFun := f, slash_action_eq' := ?_, holo' := hhol, zero_at_cusps' := ?_ }, rfl⟩
  · rintro _ ⟨γ,hγ,rfl⟩
    exact hsH γ hγ
  · intro c hc
    have hsub : (H : Subgroup (GL (Fin 2) ℝ)) ≤ (Γ : Subgroup (GL (Fin 2) ℝ)) := by
      apply Subgroup.map_mono
      rintro γ ⟨g,-,rfl⟩
      exact g.property
    have hcSL : IsCusp c 𝒮ℒ := hc.mono (Subgroup.map_le_range _ _)
    apply (OnePoint.isZeroAt_iff_forall_SL2Z hcSL).mpr
    intro γ hγ
    apply zero_of_twelfth_power
    have hh : (f^12) ∣[(24:ℤ)] γ = (f∣[(2:ℤ)]γ)^12 := pow_slash f γ 2 12
    rw [← hh, ← hpow]
    exact ((OnePoint.isZeroAt_iff_forall_SL2Z hcSL).mp (F.zero_at_cusps' (hc.mono hsub))) γ hγ

end TunnellRoot

namespace TunnellRoot

open Complex UpperHalfPlane Matrix MatrixGroups ModularForm
open Matrix.GeneralLinearGroup Matrix.SpecialLinearGroup ConjAct Pointwise
open scoped Manifold

noncomputable def dilation (d : ℕ) (hd : 0 < d) : GL (Fin 2) ℚ :=
  mkOfDetNeZero !![(d:ℚ), 0; 0, 1] (by simp [Matrix.det_fin_two, hd.ne'])

noncomputable def dilR (d : ℕ) (hd : 0 < d) : GL (Fin 2) ℝ :=
  (dilation d hd).map (Rat.castHom ℝ)

lemma val_dilR (d : ℕ) (hd : 0 < d) : ((dilR d hd : GL (Fin 2) ℝ) : Matrix _ _ _) =
    !![(d:ℝ), 0; 0, 1] := by
  ext i j
  fin_cases i <;> fin_cases j <;> simp [dilR, dilation, mkOfDetNeZero]

lemma det_dilR (d : ℕ) (hd : 0 < d) : (dilR d hd).det.val = d := by
  rw [val_det_apply, val_dilR, Matrix.det_fin_two]
  simp

lemma delta_dilate_slash (d : ℕ) (hd : 0 < d) (τ : ℍ) :
    CuspForm.translate CuspForm.discriminant (dilR d hd) τ =
    ModularForm.eta ((d:ℂ) * (τ : ℂ)) ^ 24 * (d : ℂ)^11 := by
  let g := dilR d hd
  have hdet : g.det.val = (d : ℝ) := det_dilR d hd
  have hpos : 0 < g.det.val := hdet ▸ (by exact_mod_cast hd)
  have hz : ↑(g • τ) = (d : ℂ) * (τ : ℂ) := by
    simp [UpperHalfPlane.coe_smul_of_det_pos hpos, num, denom, g,
      val_dilR]
  change (⇑CuspForm.discriminant ∣[(12:ℤ)] g) τ = _
  simp only [slash_apply, σ, hdet,
    CuspForm.coe_discriminant, ModularForm.discriminant, hz]
  simp [denom, g, val_dilR]
  norm_num [hd]

noncomputable def dilConj (d : ℕ) (hd : 0 < d) : Subgroup (GL (Fin 2) ℝ) :=
  toConjAct (dilR d hd)⁻¹ • 𝒮ℒ

lemma arith_dilConj (d : ℕ) (hd : 0 < d) : (dilConj d hd).IsArithmetic := by
  simpa only [map_inv, dilConj, dilR] using Subgroup.IsArithmetic.conj 𝒮ℒ (dilation d hd)⁻¹

lemma T_mem_dilConj (d : ℕ) (hd : 0 < d) : mapGL ℝ ModularGroup.T ∈ dilConj d hd := by
  change _ ∈ toConjAct (dilR d hd)⁻¹ • 𝒮ℒ
  rw [map_inv, Subgroup.mem_inv_pointwise_smul_iff, toConjAct_smul]
  refine ⟨ModularGroup.T ^ (d:ℤ), ?_⟩
  apply (eq_mul_inv_iff_mul_eq).mpr
  apply Units.ext
  change (mapGL ℝ (ModularGroup.T ^ (d:ℤ))).val * (dilR d hd).val = (dilR d hd).val * (mapGL ℝ ModularGroup.T).val
  simp only [val_dilR, mapGL_coe_matrix, map_apply_coe, ModularGroup.coe_T_zpow, ModularGroup.coe_T]
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [Matrix.mul_apply, Fin.sum_univ_two]

private def restrictCusp {H Γ : Subgroup (GL (Fin 2) ℝ)} (h : H ≤ Γ) {k : ℤ}
    (F : CuspForm Γ k) : CuspForm H k where
  toFun := F
  slash_action_eq' g hg := F.slash_action_eq' g (h hg)
  holo' := F.holo'
  zero_at_cusps' hc := F.zero_at_cusps' (hc.mono h)

theorem exists_eta_base_cusp (f : ℍ → ℂ) (hhol : MDiff f) (hf : ∀ z, f z ≠ 0)
    (hperiod : f ∣[(2:ℤ)] ModularGroup.T = f)
    (hpow : ∀ z : ℍ, f z ^ 12 =
      ModularForm.eta (4 * (z : ℂ))^24 * ModularForm.eta (8 * (z : ℂ))^24) :
    ∃ H : Subgroup (GL (Fin 2) ℝ), H.IsArithmetic ∧ H.strictWidthInfty = 1 ∧
      ∃ G : CuspForm H 2, ⇑G = f := by
  let A := dilConj 4 (by decide)
  let B := dilConj 8 (by decide)
  have : A.IsArithmetic := arith_dilConj _ _
  have : B.IsArithmetic := arith_dilConj _ _
  let Γ := (A ⊓ B).comap (mapGL ℝ : SL(2, ℤ) →* GL (Fin 2) ℝ)
  have : Γ.FiniteIndex := Subgroup.IsArithmetic.finiteIndex_comap _
  have hT : ModularGroup.T ∈ Γ := ⟨T_mem_dilConj _ _, T_mem_dilConj _ _⟩
  have hsub : (Γ : Subgroup (GL (Fin 2) ℝ)) ≤ A ⊓ B := Subgroup.map_comap_le _ _
  let Fa := restrictCusp (hsub.trans inf_le_left)
    (CuspForm.translate CuspForm.discriminant (dilR 4 (by decide)))
  let Fb := restrictCusp (hsub.trans inf_le_right)
    (CuspForm.translate CuspForm.discriminant (dilR 8 (by decide)))
  let F : CuspForm (Γ : Subgroup (GL (Fin 2) ℝ)) 24 :=
    (((4:ℝ)^11 * 8^11)⁻¹) • Fa.mulModularForm (CuspForm.toModularFormₗ Fb)
  have hF : ⇑F = f^12 := by
    funext τ
    change (((4:ℝ)^11 * 8^11)⁻¹) •
      (CuspForm.translate CuspForm.discriminant (dilR 4 (by decide)) τ *
       CuspForm.translate CuspForm.discriminant (dilR 8 (by decide)) τ) = f τ ^ 12
    rw [delta_dilate_slash, delta_dilate_slash, hpow]
    norm_num [Complex.real_smul]
    ring
  obtain ⟨H,hH,hHT,G,hG⟩ := exists_cusp_root hT f hhol hf hperiod F hF
  let : H.FiniteIndex := hH
  exact ⟨H, inferInstance, Subgroup.strictWidthInfty_eq_one_of_T_mem hHT, G, hG⟩

end TunnellRoot

namespace TunnellEtaUniform

open Filter Finset Polynomial
open scoped Topology

lemma eval_base_partial (D : ℕ) (q : ℂ) :
    (X * ∏ k ∈ Icc 1 D, ((1 - (X : ℂ[X])^(4*k))^2 * (1-X^(8*k))^2)).eval q =
      q * (∏ k ∈ range D, (1-(q^4)^(k+1)))^2 * (∏ k ∈ range D, (1-(q^8)^(k+1)))^2 := by
  simp only [eval_mul, eval_X, eval_prod, eval_pow, eval_sub, eval_one]
  induction D with
  | zero => simp
  | succ d ih =>
    rw [prod_Icc_succ_top (by omega : 1 ≤ d+1), prod_range_succ, prod_range_succ,
      ← mul_assoc, ih]
    simp only [← pow_mul]
    ring

theorem base_locallyUniform :
    TendstoLocallyUniformlyOn
      (fun (D : ℕ) (q : ℂ) =>
        (X * ∏ k ∈ Icc 1 D, ((1 - (X : ℂ[X])^(4*k))^2 * (1-X^(8*k))^2)).eval q)
      (fun q => q * (∏' k : ℕ, (1 - (q^4)^(k+1)))^2 * (∏' k : ℕ, (1 - (q^8)^(k+1)))^2)
      atTop (Metric.ball 0 1) := by
  let U := Metric.ball (0 : ℂ) 1
  let E (a : ℕ) (q : ℂ) : ℂ := ∏' k : ℕ, (1 - (q^a)^(k+1))
  let P (a D : ℕ) (q : ℂ) : ℂ := ∏ k ∈ range D, (1 - (q^a)^(k+1))
  have maps (a : ℕ) (ha : 0 < a) : Set.MapsTo (fun q : ℂ => q^a) U U := by
    intro q hq
    simp only [U, Metric.mem_ball, dist_zero_right, norm_pow] at hq ⊢
    exact pow_lt_one₀ (norm_nonneg _) hq ha.ne'
  have h (a : ℕ) (ha : 0 < a) : TendstoLocallyUniformlyOn (P a) (E a) atTop U := by
    dsimp only [P, E]
    exact (ModularForm.multipliableLocallyUniformlyOn_one_sub_pow.comp _ (maps a ha)
      (by fun_prop)).hasProdLocallyUniformlyOn.tendstoLocallyUniformlyOn_finsetRange
  have hc (a : ℕ) (ha : 0 < a) : ContinuousOn (E a) U := by
    dsimp only [E]
    exact ModularForm.differentiableOn_tprod_one_sub_pow.continuousOn.comp (by fun_prop) (maps a ha)
  have hi : TendstoLocallyUniformlyOn (fun (_ : ℕ) (q : ℂ) => q) id atTop U := by
    intro u hu x _
    exact ⟨Set.univ, univ_mem, .of_forall fun _ y _ => refl_mem_uniformity hu⟩
  have hs (a : ℕ) (ha : 0 < a) := (h a ha).mul₀ (h a ha) (hc a ha) (hc a ha)
  have hu := (hi.mul₀ (hs 4 (by decide)) continuousOn_id ((hc 4 (by decide)).mul (hc 4 (by decide)))).mul₀
    (hs 8 (by decide)) (continuousOn_id.mul ((hc 4 (by decide)).mul (hc 4 (by decide))))
    ((hc 8 (by decide)).mul (hc 8 (by decide)))
  simp_rw [eval_base_partial]
  simp only [pow_two]
  exact hu

end TunnellEtaUniform

namespace TunnellTaylor

open Filter Polynomial Finset
open scoped Topology

lemma deriv_eval (p : ℂ[X]) :
    deriv (fun z => p.eval z) = fun z => p.derivative.eval z :=
  funext fun z => (p.hasDerivAt z).deriv

lemma taylor_of_convergent_polynomials (P : ℕ → ℂ[X]) (f : ℂ → ℂ)
    (h : TendstoLocallyUniformlyOn (fun D z => (P D).eval z) f atTop (Metric.ball 0 1))
    (m : ℕ) (b : ℂ) (hst : ∀ D ≥ m, (P D).coeff m = b) :
    (m.factorial : ℂ)⁻¹ * iteratedDeriv m f 0 = b := by
  have iter (j : ℕ) : TendstoLocallyUniformlyOn
      (fun D z => (derivative^[j] (P D)).eval z) (iteratedDeriv j f)
      atTop (Metric.ball 0 1) := by
    induction j with
    | zero => simpa using h
    | succ j ih =>
      have h' := ih.deriv (Eventually.of_forall fun D => (derivative^[j] (P D)).differentiableOn)
        Metric.isOpen_ball
      simpa only [iteratedDeriv_succ, Function.comp_def, deriv_eval, Function.iterate_succ_apply'] using h'
  have ht := (iter m).tendsto_at (show (0 : ℂ) ∈ Metric.ball 0 1 by simp)
  have hconst : ∀ᶠ D in atTop, (derivative^[m] (P D)).eval 0 = (m.factorial : ℂ) * b := by
    filter_upwards [eventually_ge_atTop m] with D hD
    rw [← coeff_zero_eq_eval_zero, coeff_iterate_derivative]
    simp [hst D hD, mul_comm, Nat.descFactorial_self]
  have hev : iteratedDeriv m f 0 = (m.factorial : ℂ) * b :=
    tendsto_nhds_unique ht (tendsto_nhds_of_eventually_eq hconst)
  rw [hev]
  rw [← mul_assoc, inv_mul_cancel₀ (by exact_mod_cast Nat.factorial_ne_zero m), one_mul]

lemma coeff_mul_one_sub_pow {R : Type*} [CommRing R] (p : R[X]) {m k : ℕ} (hk : m < k) :
    (p * (1 - X ^ k)).coeff m = p.coeff m := by
  simp only [mul_sub, mul_one, coeff_sub, coeff_mul_X_pow', if_neg (by omega : ¬k ≤ m), sub_zero]

lemma base_stable {R : Type*} [CommRing R] (m D : ℕ) (hD : m ≤ D) :
    (X * ∏ k ∈ Icc 1 D, ((1 - (X : R[X])^(4*k))^2 * (1-X^(8*k))^2)).coeff m =
    (X * ∏ k ∈ Icc 1 m, ((1 - (X : R[X])^(4*k))^2 * (1-X^(8*k))^2)).coeff m := by
  induction D, hD using Nat.le_induction with
  | base => rfl
  | succ D hD ih =>
    rw [Finset.prod_Icc_succ_top (by omega : 1 ≤ D+1)]
    simp only [pow_two, ← mul_assoc]
    rw [coeff_mul_one_sub_pow _ (by omega : m < 8*(D+1)),
      coeff_mul_one_sub_pow _ (by omega : m < 8*(D+1)),
      coeff_mul_one_sub_pow _ (by omega : m < 4*(D+1)),
      coeff_mul_one_sub_pow _ (by omega : m < 4*(D+1))]
    simpa only [pow_two, ← mul_assoc] using ih

lemma base_taylor (f : ℂ → ℂ)
    (h : TendstoLocallyUniformlyOn
      (fun (D : ℕ) (z : ℂ) => z * ∏ k ∈ Icc 1 D, ((1-z^(4*k))^2 * (1-z^(8*k))^2))
      f atTop (Metric.ball 0 1)) (m : ℕ) :
    (m.factorial : ℂ)⁻¹ * iteratedDeriv m f 0 =
      (((X * ∏ k ∈ Icc 1 m, ((1-(X : ℤ[X])^(4*k))^2 * (1-X^(8*k))^2)).coeff m : ℤ) : ℂ) := by
  let P (D : ℕ) : ℤ[X] := X * ∏ k ∈ Icc 1 D, ((1-X^(4*k))^2 * (1-X^(8*k))^2)
  apply taylor_of_convergent_polynomials (fun D => (P D).map (Int.castRingHom ℂ))
  · simpa only [P, Polynomial.map_mul, Polynomial.map_prod, Polynomial.map_sub,
      Polynomial.map_one, Polynomial.map_pow, Polynomial.map_X, Polynomial.eval_mul,
      Polynomial.eval_prod, Polynomial.eval_sub, Polynomial.eval_pow, Polynomial.eval_one,
      Polynomial.eval_X] using h
  · intro D hD
    rw [Polynomial.coeff_map]
    exact congrArg (fun z : ℤ => (z : ℂ)) (base_stable (R := ℤ) m D hD)

end TunnellTaylor

namespace TunnellEtaValue
open UpperHalfPlane Function MatrixGroups ModularForm
open scoped Manifold Real Topology

noncomputable def etaValue (z : ℍ) : ℂ :=
  eta (4*(z:ℂ))^2 * eta (8*(z:ℂ))^2

noncomputable def diskValue (q : ℂ) : ℂ :=
  q * (∏' k : ℕ, (1-(q^4)^(k+1)))^2 * (∏' k : ℕ, (1-(q^8)^(k+1)))^2

lemma etaValue_hol : MDiff etaValue := by
  have h (a : ℕ) (ha : 0 < a) : MDiff (fun z : ℍ => eta ((a:ℂ)*z)) := by
    intro z
    have hz : (a:ℂ)*(z:ℂ) ∈ upperHalfPlaneSet := by
      change 0 < ((a:ℂ)*(z:ℂ)).im
      simpa [Complex.mul_im] using mul_pos (Nat.cast_pos.mpr ha : 0 < (a : ℝ)) z.im_pos
    exact (differentiableAt_eta_of_mem_upperHalfPlaneSet hz).mdifferentiableAt.comp z
      (mdifferentiableAt_const.mul (UpperHalfPlane.mdifferentiable_coe z))
  exact ((h 4 (by decide)).pow 2).mul ((h 8 (by decide)).pow 2)

lemma etaValue_ne (z : ℍ) : etaValue z ≠ 0 := by
  have h (a : ℕ) (ha : 0 < a) : eta ((a:ℂ)*z) ≠ 0 := by
    apply eta_ne_zero
    change 0 < ((a:ℂ)*(z:ℂ)).im
    simpa [Complex.mul_im] using mul_pos (Nat.cast_pos.mpr ha : 0 < (a:ℝ)) z.im_pos
  exact mul_ne_zero (pow_ne_zero 2 (h 4 (by decide))) (pow_ne_zero 2 (h 8 (by decide)))

lemma etaValue_pow (z : ℍ) :
    etaValue z ^ 12 = eta (4*(z:ℂ)) ^ 24 * eta (8*(z:ℂ)) ^ 24 := by
  simp only [etaValue, mul_pow, ← pow_mul]

lemma qparam_dilate (a : ℕ) (z : ℂ) :
    Periodic.qParam 1 ((a:ℂ)*z) = (Periodic.qParam 1 z)^a := by
  simp only [Periodic.qParam, Complex.ofReal_one, div_one, ← Complex.exp_nat_mul]
  congr 1
  ring

lemma etaValue_eq (z : ℍ) : etaValue z = diskValue (Periodic.qParam 1 z) := by
  have hlead : Periodic.qParam 24 (4*(z:ℂ))^2 * Periodic.qParam 24 (8*(z:ℂ))^2 =
      Periodic.qParam 1 z := by
    simp only [Periodic.qParam, ← Complex.exp_nat_mul, ← Complex.exp_add]
    push_cast
    congr 1
    ring
  unfold etaValue diskValue eta eta_q
  rw [show (4:ℂ) = (4:ℕ) by norm_num, qparam_dilate,
    show (8:ℂ) = (8:ℕ) by norm_num, qparam_dilate]
  rw [mul_pow, mul_pow]
  linear_combination (∏' k : ℕ, (1-(Periodic.qParam 1 z ^ 4)^(k+1)))^2 *
    (∏' k : ℕ, (1-(Periodic.qParam 1 z ^ 8)^(k+1)))^2 * hlead

lemma etaValue_period : etaValue ∣[(2:ℤ)] ModularGroup.T = etaValue := by
  funext z
  have hd : denom (ModularGroup.T : GL (Fin 2) ℝ) z = 1 := by
    simp [denom, Matrix.SpecialLinearGroup.map_apply_coe, ModularGroup.coe_T]
  rw [SL_slash_apply, hd, one_zpow, mul_one, modular_T_smul]
  simp only [etaValue_eq]
  have h : Periodic.qParam 1 (1+(z:ℂ)) = Periodic.qParam 1 z := by
    simp only [Periodic.qParam, Complex.ofReal_one, div_one, mul_add, mul_one, Complex.exp_add]
    rw [show 2*(Real.pi:ℂ)*Complex.I = (2*Real.pi:ℝ)*Complex.I by push_cast; rfl]
    simp
  change diskValue (Periodic.qParam 1 (1+(z:ℂ))) = _
  rw [h]

lemma cusp_disk_near_zero {Γ : Subgroup (GL (Fin 2) ℝ)} [Γ.IsArithmetic]
    (hwidth : Γ.strictWidthInfty = 1) (G : CuspForm Γ 2) (hg : ⇑G = etaValue) :
    UpperHalfPlane.cuspFunction 1 G =ᶠ[𝓝 0] diskValue := by
  filter_upwards [Metric.ball_mem_nhds (0:ℂ) (by norm_num : 0 < (1:ℝ))] with q hq
  by_cases h0 : q=0
  · subst q
    rw [CuspFormClass.cuspFunction_apply_zero G one_pos (hwidth ▸ Γ.strictWidthInfty_mem_strictPeriods)]
    simp [diskValue]
  have him := Periodic.im_invQParam_pos_of_norm_lt_one one_pos (by simpa using hq : ‖q‖ < 1) h0
  let z : ℍ := ⟨Periodic.invQParam 1 q, him⟩
  have hqz : Periodic.qParam 1 (z:ℂ) = q := Periodic.qParam_right_inv one_ne_zero h0
  rw [← hqz, SlashInvariantFormClass.eq_cuspFunction G z
    (hwidth ▸ Γ.strictWidthInfty_mem_strictPeriods) one_ne_zero, hg, etaValue_eq]

end TunnellEtaValue

open UpperHalfPlane MatrixGroups
open TunnellEtaValue

theorem OMA.solution : OMA.R_CongruentNumber_Tunnell_even_R1_H1_R1.H1 := by
  obtain ⟨H, hH, hw, G, hg⟩ := TunnellRoot.exists_eta_base_cusp etaValue
    etaValue_hol etaValue_ne etaValue_period etaValue_pow
  let _ := hH
  refine ⟨H, hH, hw, G, ?_⟩
  intro m
  rw [qExpansion_coeff, (cusp_disk_near_zero hw G hg).iteratedDeriv_eq]
  apply TunnellTaylor.base_taylor
  unfold diskValue
  convert TunnellEtaUniform.base_locallyUniform using 1
  funext D z
  simp only [Polynomial.eval_mul, Polynomial.eval_prod, Polynomial.eval_sub,
    Polynomial.eval_pow, Polynomial.eval_one, Polynomial.eval_X]
end TunnellEvenInputEta
#print axioms TunnellEvenInputEta.OMA.solution
