import TunnellRankinEisenstein

/-! Bounds for the regularized summand with a variable shortest-vector scale. -/
namespace TunnellRankinMajorant
open Complex TunnellCMRegularized
noncomputable section

lemma kernel_grid {K : ℕ} {s w : ℂ} {t : ℝ} (ht : 1≤t) (hs : 3/4<s.re)
    (hK : 2*s.re≤K) (hw : w≠0 → t⁻¹≤‖w‖) : ‖kernel s w‖≤t^K := by
  by_cases h0 : w=0
  · simp [h0,kernel,pow_nonneg (by linarith : 0≤t)]
  rw [norm_kernel _ _ h0]
  have hp := norm_pos_iff.mpr h0
  have ht' : 0<t := by linarith
  by_cases h : 1≤‖w‖
  · exact (Real.rpow_le_one_of_one_le_of_nonpos h (by linarith)).trans (one_le_pow₀ ht)
  · calc
      _ ≤ ‖w‖^(-(K:ℝ)) := Real.rpow_le_rpow_of_exponent_ge hp (le_of_not_ge h) (by linarith)
      _ ≤ (t⁻¹)^(-(K:ℝ)) := Real.rpow_le_rpow_of_nonpos (inv_pos.mpr ht') (hw h0) (neg_nonpos.mpr (Nat.cast_nonneg _))
      _ = _ := by rw [Real.rpow_neg (inv_nonneg.mpr ht'.le),Real.rpow_natCast,inv_pow,inv_inv]

lemma difference_grid {K : ℕ} {s w z : ℂ} {t : ℝ} (ht : 1≤t) (hs : 3/4<s.re)
    (hK : 2*s.re≤K) (a : ℕ)
    (h₀ : w≠0 → t⁻¹≤‖w‖) (h₁ : w+z≠0 → t⁻¹≤‖w+z‖)
    (h₂ : w+(a:ℂ)*z≠0 → t⁻¹≤‖w+(a:ℂ)*z‖) :
    ‖difference a z w s‖≤(2*(a:ℝ)^2+2*a)*t^K := by
  have ha (u : ℂ) (hu : u≠0 → t⁻¹≤‖u‖) := kernel_grid ht hs hK hu
  unfold difference
  apply (norm_sub_le _ _).trans
  simp only [norm_mul,norm_pow,Complex.norm_natCast]
  calc
    _ ≤ (a:ℝ)^2*(t^K+t^K)+a*(t^K+t^K) := by
      apply add_le_add <;> apply mul_le_mul_of_nonneg_left _ (by positivity)
      · exact (norm_sub_le _ _).trans (add_le_add (ha _ h₁) (ha _ h₀))
      · exact (norm_sub_le _ _).trans (add_le_add (ha _ h₂) (ha _ h₀))
    _ = _ := by ring

lemma difference_tail {R : ℝ} (hR : 0≤R) (a : ℕ) (z : ℂ) :
    ∃ A C : ℝ, 1≤A ∧ 0≤C ∧ ∀ s w : ℂ, ‖s‖≤R → 3/4<s.re → A≤‖w‖ →
      ‖difference a z w s‖*(1+‖w‖)^(5/2:ℝ)≤C := by
  let M := max 1 (a:ℝ)
  let A := max 1 (max (2*M*‖z‖) (3*R*M*‖z‖))
  let C := ((a:ℝ)^2+(a:ℝ)^3)*(9*R^2+8*R)*‖z‖^2
  have hC : 0≤C := by dsimp [C]; positivity
  have hM : 1≤M := le_max_left _ _
  have ha : (a:ℝ)≤M := le_max_right _ _
  refine ⟨A,C*2^(5/2:ℝ),le_max_left _ _,by positivity,?_⟩
  intro s w hsr hs hw
  have h1 : 1≤‖w‖ := (le_max_left _ _).trans hw
  have hp : 0<‖w‖ := by linarith
  have h2 : 2*M*‖z‖≤‖w‖ := (le_max_left _ _).trans ((le_max_right _ _).trans hw)
  have h3 : 3*R*M*‖z‖≤‖w‖ := (le_max_right _ _).trans ((le_max_right _ _).trans hw)
  have hzf (b : ℝ) (hb : 0≤b) (he : b≤M) : b*(‖z‖/‖w‖)≤1/2 ∧ 3*R*(b*(‖z‖/‖w‖))≤1 := by
    constructor
    · rw [←mul_div_assoc,div_le_iff₀ hp]
      nlinarith [mul_le_mul_of_nonneg_right he (norm_nonneg z)]
    · rw [←mul_assoc,←mul_div_assoc,div_le_iff₀ hp]
      nlinarith [mul_le_mul_of_nonneg_right he (mul_nonneg hR (norm_nonneg z))]
  obtain ⟨hu,hsu⟩ := hzf 1 zero_le_one hM
  obtain ⟨hv,hsv⟩ := hzf _ (Nat.cast_nonneg a) ha
  simp only [one_mul] at hu hsu
  have e := difference_bound (s:=s) (z:=z) (w:=w) (norm_pos_iff.mp hp) hsr a
    (by simpa [norm_div] using hu) (by simpa [norm_mul,norm_div] using hv)
    (by simpa [norm_div] using hsu) (by simpa [norm_mul,norm_div] using hsv)
  have he : ‖difference a z w s‖ ≤ C*‖w‖^(-(5/2):ℝ) :=
    e.trans (mul_le_mul_of_nonneg_left (Real.rpow_le_rpow_of_exponent_le h1 (by linarith)) hC)
  have hh : (1+‖w‖)^(5/2:ℝ)≤(2*‖w‖)^(5/2:ℝ) := by gcongr <;> linarith
  apply (mul_le_mul he hh (by positivity) (by positivity)).trans
  rw [Real.mul_rpow (by norm_num) hp.le,Real.rpow_neg hp.le]
  have hn := (Real.rpow_pos_of_pos hp (5/2)).ne'
  field_simp <;> exact le_rfl

lemma summand_weight {K : ℕ} {R : ℝ} (hR : 0≤R) (a : ℕ) (z : ℂ) :
    ∃ C : ℝ, 0≤C ∧ ∀ {s w : ℂ} {t u : ℝ}, 1≤t → 0≤u → ‖s‖≤R → 3/4<s.re → 2*s.re≤K →
      1+u≤t*(1+‖w‖) → (w≠0 → t⁻¹≤‖w‖) → (w+z≠0 → t⁻¹≤‖w+z‖) →
      (w+(a:ℂ)*z≠0 → t⁻¹≤‖w+(a:ℂ)*z‖) →
      ‖difference a z w s‖ ≤ C*t^(K+3)*(1+u)^(-(5/2):ℝ) := by
  obtain ⟨A,B,hA,hB,h⟩ := difference_tail hR a z
  let C := max B ((2*(a:ℝ)^2+2*a)*(1+A)^(5/2:ℝ))
  have hC : 0≤C := hB.trans (le_max_left _ _)
  refine ⟨C,hC,?_⟩
  intro s w t u ht hu hs hs' hK hw h₀ h₁ h₂
  have ht₀ : 0<t := by linarith
  have hm : ‖difference a z w s‖*(1+‖w‖)^(5/2:ℝ)≤C*t^K := by
    by_cases hw' : A≤‖w‖
    · exact (h _ _ hs hs' hw').trans ((le_max_left _ _).trans (le_mul_of_one_le_right hC (one_le_pow₀ ht)))
    · have e := difference_grid ht hs' hK a h₀ h₁ h₂
      have hh : (1+‖w‖)^(5/2:ℝ) ≤ (1+A)^(5/2:ℝ) := by gcongr; linarith
      calc
        _ ≤ ((2*(a:ℝ)^2+2*a)*t^K)*(1+A)^(5/2:ℝ) := mul_le_mul e hh (by positivity) (by positivity)
        _ = ((2*(a:ℝ)^2+2*a)*(1+A)^(5/2:ℝ))*t^K := by ring
        _ ≤ _ := mul_le_mul_of_nonneg_right (le_max_right _ _) (by positivity)
  have hcomp := Real.rpow_le_rpow (by positivity : 0≤1+u) hw (by norm_num : 0≤(5/2:ℝ))
  rw [Real.mul_rpow ht₀.le (by positivity)] at hcomp
  rw [Real.rpow_neg (by positivity : 0≤1+u),←div_eq_mul_inv,le_div_iff₀ (Real.rpow_pos_of_pos (by positivity) _)]
  calc
    _ ≤ ‖difference a z w s‖*(t^(5/2:ℝ)*(1+‖w‖)^(5/2:ℝ)) := mul_le_mul_of_nonneg_left hcomp (norm_nonneg _)
    _ = (‖difference a z w s‖*(1+‖w‖)^(5/2:ℝ))*t^(5/2:ℝ) := by ring
    _ ≤ C*t^K*t^3 := mul_le_mul hm (by exact_mod_cast Real.rpow_le_rpow_of_exponent_le ht (by norm_num : (5/2:ℝ)≤(3:ℕ))) (by positivity) (by positivity)
    _ = _ := by rw [pow_add]; ring
end
end TunnellRankinMajorant
#print axioms TunnellRankinMajorant.summand_weight
