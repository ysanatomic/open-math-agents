import TunnellRankinFullGrowth

namespace TunnellRankinIntegral
open Complex Matrix MatrixGroups ModularGroup Set MeasureTheory TunnellRankin TunnellRankinEisenstein
open TunnellShell TunnellFullClassTheta TunnellEtaValue TunnellRankinMajorant TunnellRankinCotangent
open TunnellClassThetaMellin TunnellCMRegularized Metric
open UpperHalfPlane hiding I
open scoped ComplexConjugate
noncomputable section

lemma bounded_product {y t f g e D C X Y A : ℝ} (hy : 0≤y) (ht : 0≤t) (hf : 0≤f) (hg : 0≤g) (he : 0≤e)
    (hD : 0≤D) (hC : 0≤C) (hX : 0≤X)
    (hyd : y≤t) (hfd : g≤D*t^66) (hed : e≤C*t^66)
    (htd : t^134≤X^134*Y^268) (had : f*Y^268≤A) :
    y^2*f*g*e≤D*C*X^134*A := by
  calc
    _ ≤ t^2*f*(D*t^66)*(C*t^66) := by
      apply mul_le_mul _ hed he (mul_nonneg (mul_nonneg (sq_nonneg _) hf) (mul_nonneg hD (pow_nonneg ht _)))
      apply mul_le_mul _ hfd hg (mul_nonneg (sq_nonneg _) hf)
      exact mul_le_mul_of_nonneg_right (pow_le_pow_left₀ hy hyd 2) hf
    _ = D*C*f*t^134 := by ring
    _ ≤ D*C*f*(X^134*Y^268) := mul_le_mul_of_nonneg_left htd (by positivity)
    _ = D*C*X^134*(f*Y^268) := by ring
    _ ≤ _ := mul_le_mul_of_nonneg_left had (mul_nonneg (mul_nonneg hD hC) (pow_nonneg hX _))

variable {d : ℕ} {b : Triple} (hsq : Squarefree (2*d)) (hd : d%4=1) (hb : b∈shell (2*d))

lemma integrand_growth (g : SL(2,ℤ)) :
    haveI : NeZero (4*(2*d)) := ⟨by omega⟩
    ∃ M : ℝ, 0≤M ∧ ∀ z∈fdo, ∀ s∈window,
      ‖integrand (k:=4) (negCharacter d (by omega)) (full hsq (by omega) hb) s (g • z)‖≤M := by
  letI : NeZero (4*(2*d)) := ⟨by omega⟩
  obtain ⟨C,hC,hE⟩ := eisenstein_bound (k:=4) (negCharacter d (by omega))
  obtain ⟨D,hD,hF⟩ := full_growth hsq hd hb
  obtain ⟨T,hT,hG⟩ := cusp_size g
  obtain ⟨A,hA,hη⟩ := eta_rapid g 268
  have hT' : 0≤T := by linarith
  refine ⟨D*C*T^134*A,by positivity,?_⟩
  intro z hz s hs
  let w := g • z
  let Y := 1+z.im
  have hw := (size_one w)
  have hY : 0≤Y := by dsimp [Y]; linarith [z.im_pos]
  have hE' := hE w (s:=conj s) (by simpa using (mem_ball_zero_iff.mp hs.2).le) (by simpa using hs.1)
  have hF' := hF w
  have Tbound := pow_le_pow_left₀ (by linarith : 0≤ size w) (hG z (fdo_subset_fd hz)) 134
  change size w^134≤(T*Y^2)^134 at Tbound
  rw [mul_pow,←pow_mul] at Tbound
  have hb := hη z (fdo_subset_fd hz)
  change ‖etaValue w‖*Y^268≤A at hb
  simp only [integrand,norm_mul,Complex.norm_conj,norm_pow,Complex.norm_real,Real.norm_of_nonneg (g • z).im_pos.le]
  change w.im^2*‖etaValue w‖*_*_≤_
  exact bounded_product w.im_pos.le (by linarith) (norm_nonneg _) (norm_nonneg _) (norm_nonneg _)
    hD hC hT' (size_im w) hF' hE' Tbound hb

end
end TunnellRankinIntegral
#print axioms TunnellRankinIntegral.integrand_growth
