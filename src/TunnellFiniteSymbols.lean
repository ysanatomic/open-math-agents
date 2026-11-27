import TunnellCuspEuclid
import TunnellTwistPeriodBridge

/-! Finite, explicitly computable normalized rational-cusp evaluations of the quadratic twists. -/

namespace TunnellFiniteSymbols
open TunnellFricke TunnellCuspEuclid TunnellTwistCharacter TunnellModularSymbol
open TunnellCMLSeries UpperHalfPlane Finset
open Set Filter
open scoped Topology

/-- The real Gaussian modular-symbol sum, with the conductor-32 winding symbol normalized to one. -/
def winding (n : ℕ) (hn : 0<n) : ℤ :=
  haveI : NeZero (4*n) := ⟨by omega⟩
  ∑ j : ZMod (4*n), weight n j.val * (symbol (j.val:ℤ) n).re

noncomputable def tau (n : ℕ) (hn : 0<n) : ℂ :=
  haveI : NeZero (4*n) := ⟨by omega⟩
  gaussSum (character n hn.ne') ZMod.stdAddChar

lemma paired {Γ : Subgroup (GL (Fin 2) ℝ)} [Γ.IsArithmetic] (hw : Γ.strictWidthInfty=1) (F : CuspForm Γ 2)
    (hF : ∀ z : ℍ, F z=h (4*(z:ℂ))) (n j : ℕ) (hn : 0<n) :
    periodSymbol F ((j:ℝ)/(4*n)) + periodSymbol F (-(j:ℝ)/(4*n)) =
      2*((symbol (j:ℤ) n).re:ℂ)*baseConstant := by
  obtain ⟨J,hJ,h0,hT,C,hW⟩ := primitive
  obtain ⟨hz,_,_,_⟩ := cusp_rules h0 hT hW
  have e0 := symbol_eq_boundary hw F hF 0 hJ h0 (A:=C) (by simpa [Bound] using hz)
  have hC : C=baseConstant := by simpa only [Rat.cast_zero,zero_symbol F hF] using e0.symm
  let r : ℚ := (j:ℚ)/(4*n)
  have he : 4*(r:ℝ)=((j:ℤ):ℝ)/n := by dsimp [r]; push_cast; field_simp
  obtain ⟨hp,hm⟩ := cusp_value h0 hT hW (j:ℤ) n hn
  have e1 := symbol_eq_boundary hw F hF r hJ h0 (A:=((symbol (j:ℤ) n:GaussianInt):ℂ)*C) (by
    simpa only [Bound,Rat.cast_div,Rat.cast_intCast,Rat.cast_natCast,he] using hp)
  have e2 := symbol_eq_boundary hw F hF (-r) hJ h0 (A:=((star (symbol (j:ℤ) n):GaussianInt):ℂ)*C) (by
    simpa only [Bound,Rat.cast_neg,Rat.cast_div,Rat.cast_intCast,Rat.cast_natCast,mul_neg,he] using hm)
  rw [hC] at e1 e2
  have hsum := congrArg₂ (·+·) e1 e2
  simp only [r,Rat.cast_neg,Rat.cast_div,Rat.cast_natCast,Rat.cast_mul,Rat.cast_ofNat,←neg_div,←add_mul] at hsum
  rw [hsum]
  congr 1
  simp [GaussianInt.toComplex_def]
  ring

lemma twist_sum (n : ℕ) (hn : n%8=2) (hs : Squarefree n) (L : ℂ → ℂ)
    (he : AnalyticOnNhd ℂ L univ) (hprod : ∀ s : ℝ, 2<s →
      HasProd (fun p : Nat.Primes => if p.val ∣ 2*n then (1:ℂ) else
        let T := (p.val:ℂ)^(-(s:ℂ))
        (1-(curveTrace n p:ℂ)*T+(p.val:ℂ)*T^2)⁻¹) (L s)) :
    tau n (by omega) * L 1 = (winding n (by omega):ℂ)*baseConstant := by
  obtain ⟨H,hH,hw,F,hF,hfc⟩ := TunnellEtaValue.actual_form
  letI : H.IsArithmetic := hH
  letI : NeZero (4*n) := ⟨by omega⟩
  obtain ⟨K,hK,kw,G,ht,hv,_⟩ := jacobi_twist_integral hn hs hw F
  letI : K.IsArithmetic := hK
  let M := ModularForm.L (by decide : (0:ℤ)<2) G
  have a (m : ℕ) : (qExpansion 1 G).coeff m = gaussCoeff n m := by
    rw [ht,hfc,TunnellArithmetic.eta_eq_mass
      (TunnellTruncated.cubic_congruence (fun N => TunnellCubicFinite.cubic (Polynomial.X^8) N))
      (TunnellTruncated.theta_congruence (fun d N => TunnellBalanced.balanced _ N))]
    rfl
  have hM : AnalyticOnNhd ℂ M univ := fun z _ => (CuspForm.differentiable_L (by decide : (0:ℤ)<2) G).analyticAt z
  have eqM := TunnellMellin.entire_unique he hM 2 (fun s hgt => by
    have hl := (hprod s hgt).unique (lattice_euler n s (by linarith))
    have hsum : HasSum (fun m : ℕ => gaussCoeff n m / (m:ℂ)^(s:ℂ)) (M s) := by
      have h := CuspForm.hasSum_L (by decide : (0:ℤ)<2) G (s:=(s:ℂ)) (by norm_num; linarith)
      simpa only [kw,Complex.ofReal_one,Complex.one_cpow,one_mul,a,M] using h
    exact hl.trans ((shell_expansion n s (by linarith)).unique hsum))
  rw [eqM]
  let χ := character n (by omega)
  let P (j : ZMod (4*n)) := periodSymbol F ((j.val:ℝ)/(4*n))
  let Q (j : ZMod (4*n)) := periodSymbol F (-(j.val:ℝ)/(4*n))
  have evenχ : χ.Even := by
    obtain ⟨d,hd⟩ : 2∣n := Nat.dvd_of_mod_eq_zero (by omega)
    subst n
    exact character_even (by omega)
  have hsym : ∑ j, χ j * P j = ∑ j, χ j * Q j := by
    apply Fintype.sum_equiv (Equiv.neg _)
    intro j
    rw [Equiv.neg_apply,evenχ.eval_neg]
    congr 1
    simpa only [P,Q,Nat.cast_mul,Nat.cast_ofNat] using (reflected_symbol F hw j).symm
  have sum2 : (2:ℂ)*(∑ j, χ j*P j) = 2*(winding n (by omega):ℂ)*baseConstant := by
    calc _ = (∑ j, χ j*P j) + ∑ j, χ j*Q j := by rw [←hsym,two_mul]
         _ = ∑ j, χ j*(P j+Q j) := by simp [mul_add,Finset.sum_add_distrib]
         _ = _ := by
           unfold winding
           simp only [P,Q,paired hw F hF n _ (by omega),Int.cast_sum,Int.cast_mul,Finset.mul_sum,Finset.sum_mul]
           apply Finset.sum_congr rfl
           intro j _
           change (weight n j.val:ℂ)*_=_
           ring
  change gaussSum χ ZMod.stdAddChar * M 1 = _
  change gaussSum χ ZMod.stdAddChar * M 1 = ∑ j, χ j*P j at hv
  linear_combination hv + sum2/2

end TunnellFiniteSymbols
#print axioms TunnellFiniteSymbols.twist_sum
