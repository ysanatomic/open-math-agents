import TunnellRankinMajorant

/-! A single scale controls shortest shifted vectors and coordinate distortion on ℍ. -/
namespace TunnellRankinMajorant
open Complex TunnellRankinEisenstein TunnellCMRegularized
open UpperHalfPlane hiding I
open scoped ComplexConjugate
noncomputable section

def vector (k : ℕ) (z : ℍ) (p : ℤ×ℤ) : ℂ := (p.1:ℂ)+(p.2:ℂ)*((k:ℂ)*conj (z:ℂ))

def scale (N k : ℕ) (z : ℍ) := ((N:ℝ)+2+k*|z.re|)*(1+1/z.im)

lemma scale_base (N k : ℕ) (z : ℍ) : 1≤ scale N k z ∧ (N:ℝ)≤ scale N k z ∧ 1≤ scale N k z*z.im := by
  let A : ℝ := N+2+k*|z.re|
  have hA : 1≤A := by dsimp [A]; linarith [mul_nonneg (Nat.cast_nonneg (α:=ℝ) k) (abs_nonneg z.re), Nat.cast_nonneg (α:=ℝ) N]
  have hn : (N:ℝ)≤A := by dsimp [A]; linarith [mul_nonneg (Nat.cast_nonneg (α:=ℝ) k) (abs_nonneg z.re), Nat.cast_nonneg (α:=ℝ) N]
  have h1 : 1≤1+1/z.im := by linarith [one_div_pos.mpr z.im_pos]
  change 1≤A*(1+1/z.im) ∧ (N:ℝ)≤A*(1+1/z.im) ∧ 1≤A*(1+1/z.im)*z.im
  have he : (1+1/z.im)*z.im=z.im+1 := by field_simp [z.im_ne_zero]
  rw [mul_assoc,he]
  exact ⟨one_le_mul_of_one_le_of_one_le hA h1,hn.trans (le_mul_of_one_le_right (by linarith) h1),
    one_le_mul_of_one_le_of_one_le hA (by linarith [z.im_pos])⟩

lemma im_vector (k : ℕ) (z : ℍ) (p : ℤ×ℤ) :
    |(vector k z p).im|=|(p.2:ℝ)| *(k:ℝ)*z.im := by
  simp [vector,Complex.mul_im,Complex.mul_re,abs_mul,abs_of_pos z.im_pos,mul_assoc]

lemma re_vector (k : ℕ) (z : ℍ) (p : ℤ×ℤ) :
    (vector k z p).re=(p.1:ℝ)+(p.2:ℝ)*(k:ℝ)*z.re := by
  simp [vector,Complex.mul_re,mul_assoc]

lemma distortion (N k : ℕ) [NeZero k] (z : ℍ) (p : ℤ×ℤ) :
    1+‖vector 1 UpperHalfPlane.I p‖≤ scale N k z*(1+‖vector k z p‖) := by
  let W := vector k z p
  let B := (1+1/z.im)
  have hB : 1≤B := by dsimp [B]; linarith [one_div_pos.mpr z.im_pos]
  have hk : 1≤(k:ℝ) := by exact_mod_cast NeZero.pos k
  have hbi := (im_vector k z p) ▸ abs_im_le_norm W
  have hB' : 1≤B*z.im := by
    have he : B*z.im=z.im+1 := by dsimp [B]; field_simp [z.im_ne_zero]
    rw [he]; linarith [z.im_pos]
  have hl : |(p.2:ℝ)|≤B*‖W‖ := calc
    _ ≤ |(p.2:ℝ)| *(k*(B*z.im)) := le_mul_of_one_le_right (abs_nonneg _) (one_le_mul_of_one_le_of_one_le hk hB')
    _ = B*(|(p.2:ℝ)| *k*z.im) := by ring
    _ ≤ _ := mul_le_mul_of_nonneg_left hbi (by linarith)
  have hj : |(p.1:ℝ)|≤‖W‖+k*|z.re| *|(p.2:ℝ)| := by
    rw [show (p.1:ℝ)=W.re-(p.2:ℝ)*k*z.re by rw [re_vector]; ring]
    apply (show |W.re-(p.2:ℝ)*k*z.re|≤|W.re|+|(p.2:ℝ)*k*z.re| by simpa using abs_sub_le W.re 0 ((p.2:ℝ)*k*z.re)).trans
    rw [abs_mul,abs_mul,abs_of_nonneg (Nat.cast_nonneg (α:=ℝ) k)]
    linarith [abs_re_le_norm W,show |(p.2:ℝ)| *(k:ℝ)*|z.re|=k*|z.re| *|(p.2:ℝ)| by ring]
  have h0 : ‖vector 1 UpperHalfPlane.I p‖ ≤ |(p.1:ℝ)|+|(p.2:ℝ)| := by
    apply (norm_add_le _ _).trans
    simp [norm_mul,Complex.norm_intCast]
  have hm : k*|z.re| *|(p.2:ℝ)|≤k*|z.re| *(B*‖W‖) := mul_le_mul_of_nonneg_left hl (by positivity)
  have hS := (scale_base N k z).1
  change 1+_≤ scale N k z*(1+‖W‖)
  rw [mul_add,mul_one]
  apply add_le_add hS
  calc
    _ ≤ ‖W‖+k*|z.re| *(B*‖W‖)+B*‖W‖ := h0.trans (add_le_add (hj.trans (add_le_add le_rfl hm)) hl)
    _ ≤ _ := by
      change _≤((N:ℝ)+2+k*|z.re|)*B*‖W‖
      nlinarith [mul_nonneg (Nat.cast_nonneg (α:=ℝ) N) (mul_nonneg (by linarith : 0≤B) (norm_nonneg W)),
        mul_nonneg (sub_nonneg.mpr hB) (norm_nonneg W)]

lemma grid (N k : ℕ) [NeZero N] [NeZero k] (z : ℍ) (p : ℤ×ℤ) (m : ℤ)
    (hn : vector k z p+(m:ℂ)/N≠0) : (scale N k z)⁻¹≤‖vector k z p+(m:ℂ)/N‖ := by
  obtain ⟨h1,hN,hy⟩ := scale_base N k z
  have hp : 0<scale N k z := by linarith
  have npos : 0<(N:ℝ) := by exact_mod_cast NeZero.pos N
  have nC : (N:ℂ)≠0 := by exact_mod_cast (NeZero.ne N)
  by_cases h : p.2=0
  · let j := p.1*(N:ℤ)+m
    have he : vector k z p+(m:ℂ)/N=(j:ℂ)/N := by simp [vector,h,j,add_div,nC]
    have hj : j≠0 := by intro e; exact hn (by rw [he,e]; simp)
    have hJ : 1≤|(j:ℝ)| := by exact_mod_cast (show 1≤|j| from abs_pos.mpr hj)
    rw [he,norm_div,Complex.norm_intCast,Complex.norm_natCast,←one_div]
    exact div_le_div₀ (by positivity) hJ npos hN
  · have hz : (scale N k z)⁻¹≤z.im := by rw [←one_div,div_le_iff₀ hp]; linarith
    have hP : 1≤|(p.2:ℝ)| := by exact_mod_cast (show 1≤|p.2| from abs_pos.mpr h)
    have hk : 1≤(k:ℝ) := by exact_mod_cast NeZero.pos k
    have e : (vector k z p+(m:ℂ)/N).im=(vector k z p).im := by simp [Complex.div_im]
    apply hz.trans
    calc
      _ ≤ |(p.2:ℝ)| *(k:ℝ)*z.im := le_mul_of_one_le_left z.im_pos.le (one_le_mul_of_one_le_of_one_le hP hk)
      _ = |(vector k z p+(m:ℂ)/N).im| := by rw [e,im_vector]
      _ ≤ _ := abs_im_le_norm _
end
end TunnellRankinMajorant
#print axioms TunnellRankinMajorant.grid
