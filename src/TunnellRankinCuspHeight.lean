import TunnellRankinEisensteinGrowth
import TunnellEtaCongruence
import Mathlib.NumberTheory.ModularForms.Bounds

/-! Polynomial distortion at each cusp and rapid decay of the actual conductor-32 newform. -/
namespace TunnellRankinMajorant
open Complex Matrix MatrixGroups ModularGroup Filter Asymptotics Set ConjAct ModularForm
open UpperHalfPlane hiding I
open scoped Pointwise ModularForm
noncomputable section

lemma fd_geometry (z : ℍ) (hz : z∈fd) : 1/2≤z.im ∧ ‖(z:ℂ)‖≤1+z.im := by
  constructor
  · nlinarith [three_le_four_mul_im_sq_of_mem_fd hz,z.im_pos]
  · apply (norm_le_abs_re_add_abs_im _).trans
    change |z.re|+|z.im|≤1+z.im
    rw [abs_of_pos z.im_pos]
    linarith [hz.2]

lemma denom_bounds (g : SL(2,ℤ)) (z : ℍ) (hz : z∈fd) :
    1/2≤‖denom g z‖ ∧ ‖denom g z‖≤ (|(g 1 0:ℝ)|+|(g 1 1:ℝ)|)*(1+z.im) := by
  obtain ⟨hI,hz'⟩ := fd_geometry z hz
  rw [ModularGroup.denom_apply]
  constructor
  · by_cases h : g 1 0=0
    · have e := g.det_coe
      rw [Matrix.det_fin_two,h] at e
      have hd := Int.eq_one_or_neg_one_of_mul_eq_one' (by simpa using e : g 0 0*g 1 1=1)
      rcases hd with ⟨_,ee⟩|⟨_,ee⟩ <;> rw [h,ee] <;> norm_num
    · have H : 1≤|(g 1 0:ℝ)| := by exact_mod_cast (show 1≤|g 1 0| from abs_pos.mpr h)
      apply (hI.trans (le_mul_of_one_le_left z.im_pos.le H)).trans
      apply le_trans _ (abs_im_le_norm _)
      simp [Complex.mul_im,abs_mul,abs_of_pos z.im_pos]
  · apply (norm_add_le _ _).trans
    rw [norm_mul,Complex.norm_intCast,Complex.norm_intCast]
    nlinarith [mul_le_mul_of_nonneg_left hz' (abs_nonneg (g 1 0:ℝ)),mul_nonneg (abs_nonneg (g 1 1:ℝ)) z.im_pos.le]

theorem cusp_size (g : SL(2,ℤ)) :
    ∃ C : ℝ, 1≤C ∧ ∀ (z : ℍ), z∈fd → size (g • z)≤C*(1+z.im)^2 := by
  let A := |(g 0 0:ℝ)|+|(g 0 1:ℝ)|
  let B := |(g 1 0:ℝ)|+|(g 1 1:ℝ)|
  have hA : 0≤A := add_nonneg (abs_nonneg _) (abs_nonneg _)
  have hB : 0≤B := add_nonneg (abs_nonneg _) (abs_nonneg _)
  refine ⟨1+2*A+2*B^2,by nlinarith [sq_nonneg B],?_⟩
  intro z hz
  let H := 1+z.im
  let J := denom g z
  have hH : 1≤H := by dsimp [H]; linarith [z.im_pos]
  obtain ⟨hI,hz'⟩ := fd_geometry z hz
  obtain ⟨hJ,hβ⟩ := denom_bounds g z hz
  have hj : 0<‖J‖ := norm_pos_iff.mpr (denom_ne_zero _ _)
  have hJ' : ‖J‖≤B*H := hβ
  have hα : ‖(g 0 0:ℂ)*(z:ℂ)+(g 0 1:ℂ)‖≤A*H := by
    apply (norm_add_le _ _).trans
    simp only [norm_mul,Complex.norm_intCast]
    dsimp [A,H]
    nlinarith [mul_le_mul_of_nonneg_left hz' (abs_nonneg (g 0 0:ℝ)),mul_nonneg (abs_nonneg (g 0 1:ℝ)) z.im_pos.le]
  have hnorm : ‖((g • z:ℍ):ℂ)‖≤2*A*H := by
    rw [UpperHalfPlane.coe_specialLinearGroup_apply]
    change ‖((g 0 0:ℂ)*(z:ℂ)+(g 0 1:ℂ))/J‖≤_
    rw [norm_div,div_le_iff₀ hj]
    apply hα.trans
    change 1/2≤‖J‖ at hJ
    nlinarith [mul_nonneg (mul_nonneg hA (by linarith : 0≤H)) (sub_nonneg.mpr hJ)]
  have hinv : 1/(g • z).im≤2*B^2*H^2 := by
    rw [ModularGroup.im_smul_eq_div_normSq,Complex.normSq_eq_norm_sq,one_div,inv_div,div_le_iff₀ z.im_pos]
    have hsq := pow_le_pow_left₀ (norm_nonneg J) hJ' 2
    change ‖J‖^2≤_
    nlinarith [mul_nonneg (sq_nonneg (B*H)) (sub_nonneg.mpr hI)]
  unfold size
  change _ ≤ (1+2*A+2*B^2)*H^2
  nlinarith [mul_nonneg (sub_nonneg.mpr hH) (by linarith : 0≤H),mul_nonneg hA (mul_nonneg (sub_nonneg.mpr hH) (by linarith : 0≤H))]

theorem eta_rapid (g : SL(2,ℤ)) (P : ℕ) :
    ∃ C : ℝ, 0≤C ∧ ∀ (z : ℍ), z∈fd →
      ‖TunnellEtaValue.etaValue (g • z)‖*(1+z.im)^P≤C := by
  obtain ⟨Γ,hΓ,_,F,hF,_⟩ := TunnellEtaValue.actual_form
  letI : Γ.IsArithmetic := hΓ
  let J := (toConjAct (g:GL (Fin 2) ℝ)⁻¹) • Γ
  letI : J.IsArithmetic := by
    simpa [(show Rat.castHom ℝ = algebraMap ℚ ℝ by rfl),map_inv,SpecialLinearGroup.map_mapGL]
      using! Subgroup.IsArithmetic.conj Γ (SpecialLinearGroup.mapGL ℚ g)⁻¹
  let f : CuspForm J 2 := CuspForm.translate F g
  obtain ⟨c,hc,hO⟩ := CuspFormClass.exp_decay_atImInfty' f
  have ho : (fun z : ℍ => f z)=O[atImInfty] fun z => z.im^(-((P+2:ℕ):ℝ)) :=
    hO.trans ((isLittleO_exp_neg_mul_rpow_atTop hc _).isBigO.comp_tendsto tendsto_comap)
  obtain ⟨C,hC⟩ := exists_bound_fundamental_domain_of_isBigO (ModularFormClass.continuous f) ho
  let B := |(g 1 0:ℝ)|+|(g 1 1:ℝ)|
  refine ⟨max 0 C*B^2*3^(P+2),by positivity,?_⟩
  intro z hz
  obtain ⟨hI,hzn⟩ := fd_geometry z hz
  have hH : 1+z.im ≤ 3*z.im := by linarith
  have hB : 0≤B := add_nonneg (abs_nonneg _) (abs_nonneg _)
  have hj := (denom_bounds g z hz).2
  have he : TunnellEtaValue.etaValue (g • z)=f z*denom g z^2 := by
    change _=((F:ℍ→ℂ) ∣[(2:ℤ)] g) z*_
    rw [ModularForm.SL_slash_apply,TunnellEtaLevel.physical,←hF]
    rw [_root_.zpow_neg,zpow_ofNat]
    field_simp [denom_ne_zero g z]
  have hh (z : ℍ) (hz : z∈fd) : ‖f z‖*z.im^(P+2)≤ max 0 C := by
    have hu := hC z hz
    rw [Real.rpow_neg z.im_pos.le,Real.rpow_natCast,←div_eq_mul_inv,le_div_iff₀ (pow_pos z.im_pos _)] at hu
    exact hu.trans (le_max_right _ _)
  rw [he,norm_mul,norm_pow]
  calc
    _ ≤ ‖f z‖*(B*(1+z.im))^2*(1+z.im)^P := by gcongr
    _ = ‖f z‖*B^2*(1+z.im)^(P+2) := by rw [pow_add]; ring
    _ ≤ ‖f z‖*B^2*(3*z.im)^(P+2) := by gcongr
    _ = (‖f z‖*z.im^(P+2))*B^2*3^(P+2) := by rw [mul_pow]; ring
    _ ≤ _ := by gcongr; exact hh z hz
end
end TunnellRankinMajorant
#print axioms TunnellRankinMajorant.eta_rapid
