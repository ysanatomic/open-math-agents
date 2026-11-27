import TunnellRankinFourier

/-! The archimedean unfolded Rankin period as a Mellin transform of the horizontal Fourier pairing. -/

namespace TunnellRankin
open Complex MeasureTheory Set AddCircle TunnellCMLSeries
open scoped ComplexConjugate

noncomputable def mode (a : ℕ→ℂ) (t : ℝ) (k : ℕ) : ℂ :=
  a k*(Real.exp (-(t/2)*k):ℝ)

lemma summable_mode {a : ℕ→ℂ} {C : ℝ} {k : ℕ} (h : ∀ m : ℕ, ‖a m‖≤C*(m:ℝ)^k)
    {t : ℝ} (ht : 0<t) : Summable (mode a t) := by
  apply ((Real.summable_pow_mul_exp_neg_nat_mul k (show 0<t/2 by linarith)).mul_left C).of_norm_bounded
  intro m
  rw [mode,norm_mul,Complex.norm_real,Real.norm_eq_abs,abs_of_pos (Real.exp_pos _),←mul_assoc]
  exact mul_le_mul_of_nonneg_right (h m) (Real.exp_pos _).le

lemma base_growth : ∃ C : ℝ, ∀ m : ℕ, ‖twistA 1 m‖≤C*(m:ℝ)^3 := by
  have hf : Summable (dir (twistA 1) 3) := (shell_expansion 1 3 (by norm_num)).summable
  refine ⟨∑' m,‖dir (twistA 1) 3 m‖,fun m => ?_⟩
  by_cases h : m=0
  · subst m
    simp [twistA,gaussCoeff,twistSign]
  · have hterm : ‖dir (twistA 1) 3 m‖≤∑' n, ‖dir (twistA 1) 3 n‖ :=
      hf.norm.le_tsum m (fun _ _ => norm_nonneg _)
    rw [dir,norm_div,Complex.norm_natCast_cpow_of_pos (Nat.pos_of_ne_zero h),Complex.ofReal_re,
      show (3:ℝ)=(3:ℕ) by norm_num,Real.rpow_natCast] at hterm
    exact (div_le_iff₀ (by positivity : 0<(m:ℝ)^3)).mp hterm

/-- The horizontal average at height t/(4π), with period one. -/
noncomputable def strip (d : ℕ) (t : ℝ) : ℂ :=
  ∫ x : AddCircle (1:ℝ), conj (circleSeries (mode (fun m => (idealCoeff d m:ℂ)) t) x)*
    circleSeries (mode (twistA 1) t) x ∂haarAddCircle

lemma strip_expansion (d : ℕ) {t : ℝ} (ht : 0<t) :
    HasSum (fun m : ℕ => rankinA d m*(Real.exp (-(m:ℝ)*t):ℝ)) (strip d t) := by
  obtain ⟨C,hC⟩ := base_growth
  have hc : Summable (mode (fun m => (idealCoeff d m:ℂ)) t) :=
    summable_mode (C:=1) (k:=1) (fun n => by simpa using norm_idealCoeff d n) ht
  apply (circle_parseval (summable_mode hC ht) hc).congr_fun
  intro m
  simp only [rankinA,mode,map_mul,Complex.conj_ofReal,map_intCast]
  rw [show -(m:ℝ)*t=-(t/2)*m+(-(t/2)*m) by ring,Real.exp_add,Complex.ofReal_mul]
  ring

theorem mellin_strip (d : ℕ) {s : ℝ} (hs : 5/2<s) :
    mellin (strip d) (s:ℂ) = Complex.Gamma s*∑' m, dir (rankinA d) s m := by
  have pos : ∀ m : ℕ, rankinA d m=0 ∨ 0<(m:ℝ) := by
    intro m
    by_cases h : m=0
    · subst m; simp [rankinA,idealCoeff]
    · exact Or.inr (Nat.cast_pos.mpr (Nat.pos_of_ne_zero h))
  have hsum : Summable (fun m : ℕ => ‖rankinA d m‖/(m:ℝ)^s) := by
    convert (summable_rankin d s hs).norm using 1
    ext m
    by_cases h : m=0
    · subst m; simp [dir,rankinA,idealCoeff]
    · rw [dir,norm_div,Complex.norm_natCast_cpow_of_pos (Nat.pos_of_ne_zero h),Complex.ofReal_re]
  have hm := hasSum_mellin (s:=(s:ℂ)) pos (by simpa using (show 0<s by linarith))
    (fun _ ht => strip_expansion d ht) (by simpa using hsum)
  have hv := (summable_rankin d s hs).hasSum.mul_left (Complex.Gamma s)
  apply hm.unique
  apply hv.congr_fun
  intro m
  simp only [dir,Complex.ofReal_natCast,mul_div_assoc]

end TunnellRankin
#print axioms TunnellRankin.mellin_strip
