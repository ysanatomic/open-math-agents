import TunnellCMLComplete
import TunnellBaseActual
import TunnellFrickeSymbols

/-! Algebraicity of every normalized positive even twist relative to one explicit eta integral. -/

namespace TunnellFricke

open MeasureTheory Set TunnellCMLSeries TunnellGaussian TunnellModularSymbol Finset
open UpperHalfPlane hiding I

noncomputable def baseConstant : ℂ :=
  (2*Real.pi:ℂ) * ∫ t in Ioi (0:ℝ), h (4*(Complex.I*t))

lemma zero_symbol {Γ : Subgroup (GL (Fin 2) ℝ)} (F : CuspForm Γ 2)
    (hF : ∀ z : ℍ, F z = h (4*(z:ℂ))) : periodSymbol F 0 = baseConstant := by
  unfold periodSymbol baseConstant
  congr 1
  apply setIntegral_congr_fun measurableSet_Ioi
  intro t ht
  simp only [zero_vadd,hF,ofComplex_apply_of_im_pos (by simpa using ht : 0<(Complex.I*(t:ℂ)).im)]

theorem normalized_twists (n : ℕ) (hn : n%8=2) (hs : Squarefree n) (L : ℂ → ℂ)
    (he : AnalyticOnNhd ℂ L univ) (hprod : ∀ s : ℝ, 2<s →
      HasProd (fun p : Nat.Primes => if p.val ∣ 2*n then (1:ℂ) else
        let T := (p.val:ℂ)^(-(s:ℂ))
        (1-(curveTrace n p:ℂ)*T+(p.val:ℂ)*T^2)⁻¹) (L s)) :
    ∃ c : ℚ, (Real.sqrt n:ℂ)*L 1 = c*baseConstant := by
  obtain ⟨H,hH,hw,F,hF,hfc⟩ := TunnellEtaValue.actual_form
  letI : H.IsArithmetic := hH
  have hper (r : ℚ) : ∃ c : ℚ, periodSymbol F (r:ℝ)+periodSymbol F (-(r:ℝ)) = c*baseConstant := by
    obtain ⟨m,hm⟩ := paired_symbols hw F hF r
    exact ⟨m,by simpa only [Rat.cast_intCast,zero_symbol F hF] using hm⟩
  obtain ⟨K,hK,kw,G,r,ht,hr⟩ := rational_period_of_paired_symbols hn hs hw F baseConstant hper
  letI : K.IsArithmetic := hK
  let M := ModularForm.L (by decide : (0:ℤ)<2) G
  have a (m : ℕ) : (qExpansion 1 G).coeff m = gaussCoeff n m := by
    rw [ht,hfc,TunnellArithmetic.eta_eq_mass
      (TunnellTruncated.cubic_congruence (fun N => TunnellCubicFinite.cubic (Polynomial.X^8) N))
      (TunnellTruncated.theta_congruence (fun d N =>
        TunnellBalanced.balanced (TunnellTruncated.trunc d (Polynomial.X^4)) N))]
    rfl
  have hM : AnalyticOnNhd ℂ M univ := fun z _ =>
    (CuspForm.differentiable_L (by decide : (0:ℤ)<2) G).analyticAt z
  have eqM := TunnellMellin.entire_unique he hM 2 (fun s hgt => by
    have hl := (hprod s hgt).unique (lattice_euler n s (by linarith))
    have hsum : HasSum (fun m : ℕ => gaussCoeff n m / (m:ℂ)^(s:ℂ)) (M s) := by
      have h := CuspForm.hasSum_L (by decide : (0:ℤ)<2) G (s:=(s:ℂ)) (by norm_num; linarith)
      simpa only [kw,Complex.ofReal_one,Complex.one_cpow,one_mul,a,M] using h
    exact hl.trans ((shell_expansion n s (by linarith)).unique hsum))
  exact ⟨r,eqM ▸ hr⟩

end TunnellFricke

#print axioms TunnellFricke.normalized_twists
