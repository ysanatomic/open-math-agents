import TunnellRankinPlanarKernel

/-! Absolute integrability on the unfolded strip and its Mellin value in the convergence half-plane. -/
namespace TunnellRankinIntegral
open Complex Set TunnellRankin TunnellCMLSeries TunnellFullClassTheta TunnellShell
open TunnellEtaValue MeasureTheory
open UpperHalfPlane hiding I
open scoped ComplexConjugate
noncomputable section

lemma rpow_kernel {u : ℝ} (hu : -1<u) :
    IntegrableOn (fun y : ℝ => y^u*Real.exp (-Real.pi*y)) (Ioi 0) := by
  simpa using (integrableOn_rpow_mul_exp_neg_mul_rpow (p:=1) hu (by norm_num) Real.pi_pos)

lemma on_rect {f : ℝ→ℝ} (h : IntegrableOn f (Ioi 0)) : IntegrableOn (fun p : ℝ×ℝ => f p.1) rect := by
  unfold IntegrableOn rect
  rw [Measure.volume_eq_prod,←Measure.prod_restrict]
  exact h.comp_fst _

lemma strip_compare {s y A B H : ℝ} (hy : 0<y) :
    y^(s-1)*(A/y^5*Real.exp (-Real.pi*y)*(H+2*(B/y^3)))=
      A*H*(y^(s-6)*Real.exp (-Real.pi*y))+2*A*B*(y^(s-9)*Real.exp (-Real.pi*y)) := by
  have h5 : y^(s-6)=y^(s-1)/y^5 := by
    rw [show s-6=(s-1)-(5:ℕ) by push_cast; ring,Real.rpow_sub hy,Real.rpow_natCast]
  have h8 : y^(s-9)=y^(s-1)/(y^5*y^3) := by
    rw [show s-9=(s-1)-(8:ℕ) by push_cast; ring,Real.rpow_sub hy,Real.rpow_natCast]
    ring
  rw [h5,h8]
  ring

variable {d : ℕ} {b : Triple} (hq : Squarefree (2*d)) (hd : d%4=1) (hb : b∈shell (2*d))

theorem plane_integrable {s : ℝ} (hs : 8<s) :
    IntegrableOn (planeStrip (full hq (by omega) hb) s) rect := by
  letI := classFintype hq (by omega) hb
  let H : ℝ := Fintype.card (TunnellToricClass.ProperIdealClass b)
  obtain ⟨A,B,hA,hB,h⟩ := stripBounds d
  let F (y : ℝ) := A*H*(y^(s-6)*Real.exp (-Real.pi*y))+2*A*B*(y^(s-9)*Real.exp (-Real.pi*y))
  have hf : IntegrableOn F (Ioi 0) :=
    ((rpow_kernel (u:=s-6) (by linarith)).const_mul (A*H)).add
      ((rpow_kernel (u:=s-9) (by linarith)).const_mul (2*A*B))
  apply (on_rect hf).mono' (planeStrip_meas (full_meas hq hd hb) s).aestronglyMeasurable
  filter_upwards [ae_restrict_mem (measurableSet_Ioi.prod measurableSet_Ico : MeasurableSet rect)] with p hp
  rcases p with ⟨y,x⟩
  have hy : 0<y := hp.1
  obtain ⟨hf,ht⟩ := h hy x
  have exp_le : Real.exp (-Real.pi*y)≤1 := Real.exp_le_one_iff.mpr (by nlinarith [mul_pos Real.pi_pos hy])
  have Bbound : ‖theta d (atXY (y,x))‖≤B/y^3 := ht.trans (mul_le_of_le_one_right (by positivity) exp_le)
  have e : ‖full hq (by omega) hb (atXY (y,x))‖≤H+2*(B/y^3) := by
    rw [full_expansion]
    apply (norm_add_le _ _).trans
    simp only [norm_natCast,norm_mul,norm_ofNat,H]
    gcongr
  have normp : ‖((y^(s-1):ℝ):ℂ)‖=y^(s-1) := by rw [Complex.norm_real,Real.norm_eq_abs,abs_of_pos (Real.rpow_pos_of_pos hy _)]
  simp only [planeStrip,norm_mul,Complex.norm_conj,normp,F]
  rw [←strip_compare hy]
  gcongr

theorem strip_mellin {s : ℝ} (hs : 8<s) :
    (∫ z in stripSet, stripIntegrand (full hq (by omega) hb) (s:ℂ) z)=
      2*(4*(Real.pi:ℂ))^(-(s:ℂ))*mellin (strip d) (s:ℂ) := by
  let θ := full hq (by omega) hb
  rw [show stripIntegrand θ (s:ℂ)=fun z : ℍ => (z.im:ℂ)^2*planeStrip θ s (coords z) from funext (planeStrip_eq _ _)]
  rw [strip_fubini _ (plane_integrable hq hd hb hs)]
  have e (y : ℝ) (hy : 0<y) : (∫ x in Ico (0:ℝ) 1, planeStrip θ s (y,x)) =
      2*((y:ℂ)^((s:ℂ)-1)*strip d (4*Real.pi*y)) := by
    simp only [planeStrip,integral_const_mul,at_point hy]
    rw [integral_Ico_eq_integral_Ioc,←intervalIntegral.integral_of_le (zero_le_one' ℝ),
      horizontal_full hq hd hb,Complex.ofReal_cpow hy.le]
    push_cast
    ring
  rw [setIntegral_congr_fun measurableSet_Ioi e,integral_const_mul]
  have h := mellin_comp_mul_left (strip d) (s:ℂ) (show (0:ℝ)<4*Real.pi by positivity)
  simp only [mellin,smul_eq_mul] at h
  rw [h]
  push_cast
  simp only [mellin,smul_eq_mul]
  ring
end
end TunnellRankinIntegral
#print axioms TunnellRankinIntegral.strip_mellin
