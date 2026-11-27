import TunnellRankinStripFull
import TunnellRankinDecay

/-! Horizontal Fourier bounds and measurable planar strip kernel in actual hyperbolic coordinates. -/
namespace TunnellRankinIntegral
open Complex AddCircle Set Function TunnellRankin TunnellCMLSeries TunnellClassThetaMellin
open TunnellFullClassTheta TunnellShell TunnellEtaValue MeasureTheory
open UpperHalfPlane hiding I
open scoped ComplexConjugate
noncomputable section

def atXY (p : ℝ×ℝ) : ℍ := if hy : 0<p.1 then ⟨⟨p.2,p.1⟩,hy⟩ else UpperHalfPlane.I

lemma at_coords (z : ℍ) : atXY (coords z)=z := by
  ext; simp [atXY,coords,z.im_pos]; rfl

lemma at_point {y : ℝ} (hy : 0<y) (x : ℝ) : atXY (y,x)=point x (4*Real.pi*y) (by positivity) := by
  apply UpperHalfPlane.ext
  apply Complex.ext <;> simp [atXY,hy,point,Complex.mul_re,Complex.mul_im] <;> field_simp [Real.pi_ne_zero]

lemma atXY_meas : Measurable atXY := by
  apply UpperHalfPlane.measurableEmbedding_coe.measurable_comp_iff.mp
  let f (p : ℝ×ℝ) : ℂ := ⟨p.2,p.1⟩
  have hf : Measurable f := planeCoords.symm.measurable
  have eq : UpperHalfPlane.coe ∘ atXY = {p : ℝ×ℝ | 0<p.1}.piecewise f (fun _ => (UpperHalfPlane.I:ℂ)) := by
    funext p; by_cases hy : 0<p.1 <;> simp [atXY,hy,f,Set.piecewise,Function.comp_def]
  rw [eq]
  exact hf.piecewise ((isOpen_lt continuous_const continuous_fst).measurableSet) measurable_const

lemma theta_meas (d : ℕ) : Measurable (theta d) := by
  apply Measurable.tsum
  intro n
  apply Measurable.const_mul
  exact ((Periodic.continuous_qParam (h:=1)).comp UpperHalfPlane.continuous_coe).measurable.pow_const n

lemma full_meas {d : ℕ} {b : Triple} (hs : Squarefree (2*d)) (hd : d%4=1) (hb : b∈shell (2*d)) :
    Measurable (full hs (by omega) hb) := by
  letI := classFintype hs (by omega) hb
  have e := funext (full_expansion hs (by omega) hb)
  rw [e]
  exact measurable_const.add ((theta_meas d).const_mul _)

def planeStrip (θ : ℍ→ℂ) (s : ℝ) (p : ℝ×ℝ) :=
  ((p.1^(s-1):ℝ):ℂ)*(etaValue (atXY p)*conj (θ (atXY p)))

lemma planeStrip_meas {θ : ℍ→ℂ} (hθ : Measurable θ) (s : ℝ) : Measurable (planeStrip θ s) := by
  apply Measurable.mul
  · exact Complex.continuous_ofReal.measurable.comp (measurable_fst.pow measurable_const)
  · exact (etaValue_hol.continuous.measurable.comp atXY_meas).mul (Complex.continuous_conj.measurable.comp (hθ.comp atXY_meas))

lemma planeStrip_eq (θ : ℍ→ℂ) (s : ℝ) (z : ℍ) :
    stripIntegrand θ (s:ℂ) z = (z.im:ℂ)^2*planeStrip θ s (coords z) := by
  have e := ofReal_cpow z.im_pos.le (s-1)
  push_cast at e
  simp only [stripIntegrand,planeStrip,at_coords,Complex.conj_ofReal,←e]
  dsimp [coords]
  ring

lemma stripBounds (d : ℕ) :
    ∃ A B : ℝ, 0≤A ∧ 0≤B ∧ ∀ {y : ℝ}, 0<y → ∀ x : ℝ,
      ‖etaValue (atXY (y,x))‖ ≤ A/y^5*Real.exp (-Real.pi*y) ∧
      ‖theta d (atXY (y,x))‖ ≤ B/y^3*Real.exp (-Real.pi*y) := by
  obtain ⟨C,hC⟩ := base_growth
  have hC' : 0≤C := by have hh := hC 1; simpa using (norm_nonneg _).trans hh
  obtain ⟨A,hA,h₁⟩ := circle_bound hC' (by simp [twistA,gaussCoeff,twistSign]) hC
  obtain ⟨B,hB,h₂⟩ := circle_bound (a:=fun n => (idealCoeff d n:ℂ)) (k:=1) (C:=1) zero_le_one (by simp [idealCoeff])
    (fun n => by simpa using norm_idealCoeff d n)
  refine ⟨A,B,hA,hB,fun {y} hy x => ?_⟩
  have ht : 0<4*Real.pi*y := by positivity
  rw [at_point hy,TunnellEtaLevel.physical,←circle_eta x _ ht,←circle_theta d x _ ht]
  have hp : y≤Real.pi*y := by nlinarith [mul_nonneg (sub_nonneg.mpr Real.pi_gt_three.le) hy.le]
  have he (k : ℕ) (D : ℝ) (hD : 0≤D) :
      D/(Real.pi*y)^k*Real.exp (-(Real.pi*y))≤D/y^k*Real.exp (-Real.pi*y) := by
    rw [neg_mul]
    gcongr
  rw [mul_assoc]
  exact ⟨(h₁ (Real.pi*y) (by positivity) x).trans (he 5 A hA),
    (h₂ (Real.pi*y) (by positivity) x).trans (he 3 B hB)⟩
end
end TunnellRankinIntegral
#print axioms TunnellRankinIntegral.stripBounds
