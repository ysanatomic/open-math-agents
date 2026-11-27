import TunnellRankinContinue
import TunnellSignedFinite

/-! The normalized Rankin central period and the exact finite winding-square problem. -/

namespace TunnellRankin
open TunnellCMLSeries TunnellFricke TunnellFiniteSymbols TunnellModularSymbol
open TunnellTwistCharacter ModularForm UpperHalfPlane Set MeasureTheory

lemma modular_on_right {H : Subgroup (GL (Fin 2) ℝ)} [H.IsArithmetic] (hw : H.strictWidthInfty=1)
    (F : CuspForm H 2) (n : ℕ) (hc : ∀ m : ℕ, (qExpansion 1 F).coeff m=gaussCoeff n m)
    (s : ℝ) (hs : 2<s) : ModularForm.L (by decide : (0:ℤ)<2) F (s:ℂ)=latticeValue n s := by
  have ha := CuspForm.hasSum_L (by decide : (0:ℤ)<2) F (s:=(s:ℂ)) (by norm_num; linarith)
  apply HasSum.unique _ (shell_expansion n s (by linarith))
  simpa only [hw,Complex.ofReal_one,Complex.one_cpow,one_mul,hc,gaussCoeff] using ha

lemma continued_halfplane {d : ℕ} (hd : d%4=1) {F L : ℂ→ℂ}
    (hF : AnalyticOnNhd ℂ F univ) (hL : AnalyticOnNhd ℂ L univ) :
    AnalyticOnNhd ℂ (continued d (by omega) F L) {z : ℂ | 1≤z.re} := by
  letI : NeZero (4*(2*d)) := ⟨by omega⟩
  have hχ : negCharacter d (by omega)≠1 := by
    intro hz
    have eq := negCharacter_odd hd
    rw [DirichletCharacter.Odd,hz,MulChar.one_apply (by simp)] at eq
    norm_num at eq
  have hG : DifferentiableOn ℂ Complex.Gamma {z : ℂ | 0<z.re} := by
    intro z hz
    apply (Complex.differentiableAt_Gamma z _).differentiableWithinAt
    intro n he
    change 0<z.re at hz
    rw [he,Complex.neg_re,Complex.natCast_re] at hz
    linarith [Nat.cast_nonneg (α:=ℝ) n]
  intro z hz
  change 1≤z.re at hz
  have hg := hG.analyticAt ((isOpen_lt continuous_const Complex.continuous_re).mem_nhds (by linarith : (0:ℝ)<z.re))
  unfold continued
  apply AnalyticAt.div
  · exact (hg.mul (hF z trivial)).mul (hL z trivial)
  · unfold negativeL
    apply ((DirichletCharacter.differentiable_LFunction hχ).analyticAt _).comp
    fun_prop
  · apply DirichletCharacter.LFunction_ne_zero_of_one_le_re _ (Or.inl hχ)
    norm_num [Complex.mul_re]
    linarith

/-- An explicit continuation of the strip Mellin transform through its central point.
Its value, including the quadratic L-factor and the base periods, is the signed finite winding sum. -/
theorem normalized_mellin (d : ℕ) (hs : Squarefree d) (hd : d%4=1) :
    ∃ M : ℂ→ℂ, AnalyticOnNhd ℂ M {z : ℂ | 1≤z.re} ∧
      (∀ s : ℝ, 5/2<s → M s=mellin (strip d) (s:ℂ)) ∧
      (Real.sqrt (8*d):ℂ)*negativeL d (by omega) 1*M 1 =
      (epsilon d (by omega)*winding (2*d) (by omega):ℤ)*baseConstant^2 := by
  obtain ⟨H,hH,hw,F,hF,hfc⟩ := TunnellEtaValue.actual_form
  letI : H.IsArithmetic := hH
  have hm (m : ℕ) := TunnellArithmetic.eta_eq_mass
    (TunnellTruncated.cubic_congruence (fun N => TunnellCubicFinite.cubic _ N))
    (TunnellTruncated.theta_congruence (fun _ N => TunnellBalanced.balanced _ N)) m
  have hf1 (m : ℕ) : (qExpansion 1 F).coeff m=gaussCoeff 1 m := by
    rw [hfc]
    by_cases ho : Odd m
    · simp [gaussCoeff,twistSign,ho,hm]
    · simp [gaussCoeff,twistSign,ho,TunnellInert.eta_zero_of_mod_four (by have := Nat.odd_iff.not.mp ho; omega : m%4≠1)]
  have hsd : Squarefree (2*d) := (Nat.squarefree_mul (Nat.odd_iff.mpr (by omega) : Odd d).coprime_two_left).mpr
    ⟨Nat.prime_two.squarefree,hs⟩
  obtain ⟨K,hK,kw,G,ht,_,_⟩ := jacobi_twist_integral (show (2*d)%8=2 by omega) hsd hw F
  letI : K.IsArithmetic := hK
  have hg1 (m : ℕ) : (qExpansion 1 G).coeff m=gaussCoeff (2*d) m := by
    rw [ht,hfc,hm]; rfl
  let L₁ := ModularForm.L (by decide : (0:ℤ)<2) F
  let L₂ := ModularForm.L (by decide : (0:ℤ)<2) G
  have hL₁ : AnalyticOnNhd ℂ L₁ univ := fun z _ => (CuspForm.differentiable_L (by decide : (0:ℤ)<2) F).analyticAt z
  have hL₂ : AnalyticOnNhd ℂ L₂ univ := fun z _ => (CuspForm.differentiable_L (by decide : (0:ℤ)<2) G).analyticAt z
  have hb : L₁ 1=baseConstant := by
    unfold L₁
    rw [←zero_symbol F hF,TunnellMellin.central_integral]
    simp [periodSymbol]
  have h := twist_sum (2*d) (by omega) hsd L₂ hL₂ (fun s hgt => by
    rw [show L₂ (s:ℂ)=latticeValue (2*d) s from modular_on_right kw G _ hg1 s hgt]
    exact lattice_euler (2*d) s (by linarith))
  rw [signed_root hs hd] at h
  obtain ⟨_,hv⟩ := continued_center hd (hL₁ 1 trivial) (hL₂ 1 trivial)
  refine ⟨continued d (by omega) L₁ L₂,continued_halfplane hd hL₁ hL₂,fun s hgt => continued_eq (by omega) _ _ s hgt
    (modular_on_right hw F _ hf1 s (by linarith)) (modular_on_right kw G _ hg1 s (by linarith)),?_⟩
  rw [hb] at hv
  rw [Int.cast_mul]
  by_cases e : epsilon d (by omega)=1
  · simp only [e,Int.cast_one,one_mul] at h ⊢
    linear_combination (Real.sqrt (8*d):ℂ)*hv+baseConstant*h
  · have en : epsilon d (by omega)= -1 := by unfold epsilon at e ⊢; split_ifs <;> simp_all
    simp only [en,Int.cast_neg,Int.cast_one,neg_one_mul,neg_mul] at h ⊢
    linear_combination (Real.sqrt (8*d):ℂ)*hv-baseConstant*h

end TunnellRankin
#print axioms TunnellRankin.normalized_mellin
