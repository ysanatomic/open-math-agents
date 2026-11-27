import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H1_R1
import TunnellMellin

/-! The central value of a twist as vertical integrals at rational cusps. -/

namespace TunnellModularSymbol

open OMA.R_CongruentNumber_Tunnell_even_R1_H1_R1 TunnellMellin
open MatrixGroups UpperHalfPlane MeasureTheory Set
open scoped ModularForm

lemma integrable_vertical {Γ : Subgroup (GL (Fin 2) ℝ)} [Γ.IsArithmetic] (F : CuspForm Γ 2) :
    IntegrableOn (fun t : ℝ => F (ofComplex (Complex.I*t))) (Ioi 0) := by
  have h := ((CuspForm.isStrongFEPair (by decide : (0:ℤ)<2) F).hasMellin 1).1
  simpa [MellinConvergent, ModularForm.weakFEPair] using h

lemma integrable_translate {Γ : Subgroup (GL (Fin 2) ℝ)} [Γ.IsArithmetic]
    (hw : Γ.strictWidthInfty = 1) (F : CuspForm Γ 2) (r : ℚ) :
    IntegrableOn (fun t : ℝ => F ((r:ℝ)+ᵥ ofComplex (Complex.I*t))) (Ioi 0) := by
  obtain ⟨H, hH, _, G, heq⟩ := TunnellTranslate.exists_sum_rational_translates hw F
    (fun _ : Unit => r) (fun _ => 1)
  letI := hH
  simpa [heq] using integrable_vertical G

theorem twist_central_integral {N : ℕ} [NeZero N] (w : ZMod N → ℂ)
    {Γ : Subgroup (GL (Fin 2) ℝ)} [Γ.IsArithmetic] (hw : Γ.strictWidthInfty = 1)
    (F : CuspForm Γ 2) :
    ∃ (H : Subgroup (GL (Fin 2) ℝ)) (hH : H.IsArithmetic) (_ : H.strictWidthInfty = 1)
      (G : CuspForm H 2),
      (∀ m : ℕ, (qExpansion 1 G).coeff m = w m * (qExpansion 1 F).coeff m) ∧
      ModularForm.L (by decide : (0:ℤ)<2) G 1 =
        ∑ j : ZMod N, ZMod.dft.symm w j *
          ((2*Real.pi:ℂ) * ∫ t in Ioi (0:ℝ), F ((-(j.val:ℝ)/N)+ᵥ ofComplex (Complex.I*t))) := by
  obtain ⟨H,hH,hW,G,he⟩ := TunnellTranslate.exists_sum_rational_translates hw F
    (fun j : ZMod N => -(j.val:ℚ)/N) (ZMod.dft.symm w)
  letI := hH
  have he' (z : ℍ) : G z = ∑ j : ZMod N, ZMod.dft.symm w j * F ((-(j.val:ℝ)/N)+ᵥ z) := by
    simpa only [Rat.cast_div,Rat.cast_natCast,Rat.cast_neg] using he z
  refine ⟨H,hH,hW,G,TunnellTwistFourier.twist_coefficients w hw hW F G he',?_⟩
  have hi (j : ZMod N) := (integrable_translate hw F (-(j.val:ℚ)/N)).const_mul (ZMod.dft.symm w j)
  rw [central_integral]
  simp_rw [he']
  rw [integral_finsetSum]
  · simp_rw [integral_const_mul]
    rw [Finset.mul_sum]
    exact Finset.sum_congr rfl (fun _ _ => by ring)
  · intro j _
    simpa only [Rat.cast_div,Rat.cast_natCast,Rat.cast_neg] using hi j

theorem gauss_sq {N : ℕ} [NeZero N] {χ : DirichletCharacter ℂ N}
    (hχ : χ.IsPrimitive) (hq : χ.IsQuadratic) (he : χ.Even) :
    gaussSum χ ZMod.stdAddChar ^ 2 = (N:ℂ) := by
  have h (k : ZMod N) := hχ.fourierTransform_eq_inv_mul_gaussSum k
  simp only [hq.inv,he.eval_neg] at h
  have h2 := congrFun (ZMod.dft_dft (χ : ZMod N → ℂ)) 1
  rw [funext h, ZMod.dft_mul_const] at h2
  dsimp only at h2
  rw [h] at h2
  simpa [pow_two,he.eval_neg] using h2

theorem primitive_weights {N : ℕ} [NeZero N] {χ : DirichletCharacter ℂ N}
    (hχ : χ.IsPrimitive) (hq : χ.IsQuadratic) (he : χ.Even) (j : ZMod N) :
    (gaussSum χ ZMod.stdAddChar) * ZMod.dft.symm (χ : ZMod N → ℂ) j = χ j := by
  rw [ZMod.invDFT_apply',hχ.fourierTransform_eq_inv_mul_gaussSum,neg_neg,hq.inv, smul_eq_mul]
  have h := gauss_sq hχ hq he
  field_simp [NeZero.ne (N:ℂ)]
  linear_combination χ j * h

end TunnellModularSymbol
