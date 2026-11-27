import TunnellFullClassTheta
import TunnellRankinConstant

/-! The weak functional equation of the quadratic ideal-class theta on the imaginary axis. -/
namespace TunnellClassThetaMellin
open Complex TunnellRankin TunnellFullClassTheta TunnellShell TunnellToricClass TunnellToric
open Filter MeasureTheory Set Asymptotics
open scoped Topology UpperHalfPlane
noncomputable section

def term (d : ℕ) (u t : ℝ) (m : ℕ) : ℂ :=
  (idealCoeff d m:ℂ)*(Real.exp (-u*m*t):ℝ)

def radial (d : ℕ) (u t : ℝ) := ∑' m : ℕ, term d u t m

lemma comparison_summable {u : ℝ} (hu : 0<u) :
    Summable (fun m : ℕ => (m:ℝ)*Real.exp (-u*m)) := by
  simpa using Real.summable_pow_mul_exp_neg_nat_mul 1 hu

lemma norm_term (d m : ℕ) (u t : ℝ) :
    ‖term d u t m‖≤(m:ℝ)*Real.exp (-u*m*t) := by
  simp only [term,norm_mul,Complex.norm_real,Real.norm_eq_abs,abs_of_pos (Real.exp_pos _)]
  gcongr
  exact norm_idealCoeff d m

lemma summable_term (d : ℕ) {u t : ℝ} (hu : 0<u) (ht : 0<t) :
    Summable (term d u t) := by
  apply (comparison_summable (mul_pos hu ht)).of_norm_bounded
  intro m
  convert norm_term d m u t using 1
  congr 2
  ring

lemma continuous_radial (d : ℕ) {u : ℝ} (hu : 0<u) : ContinuousOn (radial d u) (Ioi 0) := by
  intro t ht
  have h : 0<t/2 := by have := ht; change 0<t at this; linarith
  have hs : ContinuousOn (radial d u) (Ioi (t/2)) := by
    apply continuousOn_tsum (u:=fun m : ℕ => (m:ℝ)*Real.exp (-(u*(t/2))*m))
    · intro m; unfold term; fun_prop
    · exact comparison_summable (mul_pos hu h)
    · intro m x hx
      apply (norm_term d m u x).trans
      apply mul_le_mul_of_nonneg_left (Real.exp_le_exp.mpr _) (Nat.cast_nonneg _)
      change t/2<x at hx
      nlinarith [mul_nonneg (mul_nonneg hu.le (Nat.cast_nonneg (α:=ℝ) m)) (sub_nonneg.mpr hx.le)]
  exact (hs.continuousAt (isOpen_Ioi.mem_nhds (show t∈Ioi (t/2) by change t/2<t; linarith))).continuousWithinAt

lemma radial_decay (d : ℕ) {u : ℝ} (hu : 0<u) (r : ℝ) :
    radial d u =O[atTop] (fun t : ℝ => t^r) := by
  have hu' : 0<u/2 := by linarith
  refine IsBigO.trans (g:=fun t : ℝ => Real.exp (-(u/2)*t)) ?_ (isLittleO_exp_neg_mul_rpow_atTop hu' r).isBigO
  apply IsBigO.of_bound (∑' m : ℕ,(m:ℝ)*Real.exp (-(u/2)*m))
  filter_upwards [eventually_ge_atTop (1:ℝ)] with t ht
  simp only [Real.norm_eq_abs,abs_of_pos (Real.exp_pos _),radial]
  rw [←tsum_mul_right]
  apply (norm_tsum_le_tsum_norm (summable_term d hu (by linarith : 0<t)).norm).trans
  apply Summable.tsum_le_tsum _ (summable_term d hu (by linarith : 0<t)).norm ((comparison_summable hu').mul_right _)
  intro m
  by_cases hm : m=0
  · subst m; simp [term,idealCoeff]
  · have hm' : 1≤(m:ℝ) := by exact_mod_cast Nat.one_le_iff_ne_zero.mpr hm
    rw [mul_assoc,←Real.exp_add]
    apply (norm_term d m u t).trans
    apply mul_le_mul_of_nonneg_left (Real.exp_le_exp.mpr _) (Nat.cast_nonneg _)
    nlinarith [mul_nonneg (sub_nonneg.mpr hm') (sub_nonneg.mpr ht),
       mul_nonneg hu.le (sub_nonneg.mpr (one_le_mul_of_one_le_of_one_le hm' ht)),
       mul_nonneg hu.le (mul_nonneg (sub_nonneg.mpr hm') (sub_nonneg.mpr ht))]

def axis (v t : ℝ) (hv : 0<v) (ht : 0<t) : ℍ :=
  ⟨Complex.I*(t/v:ℝ),by simpa using div_pos ht hv⟩

lemma theta_axis (d : ℕ) {v t : ℝ} (hv : 0<v) (ht : 0<t) :
    theta d (axis v t hv ht)=radial d (2*Real.pi/v) t := by
  unfold theta radial
  apply tsum_congr
  intro m
  unfold term
  congr 1
  simp only [Function.Periodic.qParam,axis,Complex.ofReal_one,div_one,←Complex.exp_nat_mul,Complex.ofReal_exp]
  congr 1
  push_cast
  ring_nf
  rw [Complex.I_sq]
  ring

variable {d : ℕ} {b : Triple} (hs : Squarefree (2*d)) (h2 : (2*d)%4=2) (hb : b∈shell (2*d))

def v (d : ℕ) : ℝ := 2*Real.sqrt (2*d:ℕ)

lemma v_pos (hd : 0<d) : 0<v d := by unfold v; positivity
lemma v_sq (d : ℕ) : v d^2=4*(2*d:ℕ) := by unfold v; rw [mul_pow,Real.sq_sqrt (by positivity)]; ring

def hclass : ℂ := (Nat.card (ProperIdealClass b):ℂ)

def classRadial (d : ℕ) (h : ℂ) (t : ℝ) := h+2*radial d (2*Real.pi/v d) t

lemma axial_expansion {t : ℝ} (ht : 0<t) :
    full hs h2 hb (axis (v d) t (v_pos (by omega)) ht)=classRadial d (hclass (b:=b)) t := by
  rw [full_expansion hs h2 hb,theta_axis,classRadial]
  congr 1
  letI := classFintype hs h2 hb
  simp [hclass,Nat.card_eq_fintype_card]

include hs h2 hb in
lemma classRadial_feq {t : ℝ} (ht : 0<t) : classRadial d (hclass (b:=b)) (1/t) =
    (t:ℂ)*classRadial d (hclass (b:=b)) t := by
  have hv := v_pos (show 0<d by omega)
  rw [←axial_expansion hs h2 hb (one_div_pos.mpr ht),←axial_expansion hs h2 hb ht]
  have he : axis (v d) (1/t) hv (one_div_pos.mpr ht)=inverted (2*d) (by omega) (axis (v d) t hv ht) := by
    ext1
    change Complex.I*((1/t)/v d:ℝ) = -1/(4*(2*d:ℕ)*(Complex.I*(t/v d:ℝ)))
    have hv' : (v d:ℂ)^2=4*((2*d:ℕ):ℂ) := by exact_mod_cast v_sq d
    rw [←hv']
    push_cast
    field_simp [Complex.I_ne_zero,hv.ne',ht.ne']
    ring_nf
    rw [Complex.I_sq]
  rw [he,full_fricke]
  congr 1
  rw [←show (v d:ℂ)=2*(Real.sqrt (2*d:ℕ):ℂ) by simp [v]]
  change (v d:ℂ)*(-Complex.I*(Complex.I*(t/v d:ℝ)))=t
  push_cast
  field_simp [hv.ne']
  ring_nf
  rw [Complex.I_sq]
  ring

include hs h2 hb in
def pair : WeakFEPair ℂ := by
  let h := hclass (b:=b)
  let u := 2*Real.pi/v d
  have hu : 0<u := div_pos (by positivity) (v_pos (by omega))
  have hc : ContinuousOn (classRadial d h) (Ioi 0) :=
    continuousOn_const.add (continuousOn_const.mul (continuous_radial _ hu))
  have hr (r : ℝ) : (fun t => classRadial d h t-h) =O[atTop] (fun t : ℝ => t^r) := by
    simpa only [classRadial,add_sub_cancel_left] using (radial_decay d hu r).const_mul_left (2:ℂ)
  exact ⟨classRadial d h,classRadial d h,1,1,h,h,hc.locallyIntegrableOn isOpen_Ioi.measurableSet,
    hc.locallyIntegrableOn isOpen_Ioi.measurableSet,one_pos,one_ne_zero,
    fun t ht => by simpa using classRadial_feq hs h2 hb ht,hr,hr⟩

end
end TunnellClassThetaMellin
#print axioms TunnellClassThetaMellin.pair
