import TunnellFiniteSymbols
import TunnellImagEta
import TunnellWaldspurgerLocal

/-! The square-value assertion as a finite winding-symbol identity for each squarefree d ≡ 1 mod 4. -/

namespace TunnellFiniteSymbols
open TunnellFricke TunnellModularSymbol TunnellWaldspurgerLocal TunnellTwistCharacter
open Set Filter MeasureTheory UpperHalfPlane
open scoped Topology

lemma base_ne_zero : baseConstant ≠ 0 := by
  rw [baseConstant_real,Complex.ofReal_ne_zero]
  apply (mul_pos (by positivity : 0<2*Real.pi) _).ne'
  obtain ⟨H,hH,hw,F,hF,_⟩ := TunnellEtaValue.actual_form
  letI : H.IsArithmetic := hH
  have hi : IntegrableOn imaginaryValue (Ioi (0:ℝ)) := by
    have hr := (integrable_vertical F).re
    apply hr.congr
    filter_upwards [ae_restrict_mem measurableSet_Ioi] with t ht
    change (F (ofComplex (Complex.I*t))).re = (h (4*(Complex.I*t))).re
    rw [hF,ofComplex_apply_of_im_pos (by simpa using (show 0<t from ht) : 0<(Complex.I*(t:ℂ)).im)]
  apply (setIntegral_pos_iff_support_of_nonneg_ae _ hi).mpr
  · have hs : Function.support imaginaryValue ∩ Ioi (0:ℝ) = Ioi 0 :=
      inter_eq_right.mpr (fun _ ht => (imaginary_cast ht).1.ne')
    rw [hs,Real.volume_Ioi]
    simp
  · filter_upwards [ae_restrict_mem measurableSet_Ioi] with t ht
    exact (imaginary_cast ht).1.le

/-- Both sides are finite sums. The Gauss sum fixes the sign using the standard additive character. -/
def FiniteSquare : Prop := ∀ d : ℕ, Squarefree d → (hd : d%4=1) →
  (winding (2*d) (by omega):ℂ)*(Real.sqrt (4*(2*d)):ℂ) =
    tau (2*d) (by omega)*(localPeriod d:ℂ)^2

lemma root_sq (d : ℕ) : ((d:ℂ)^(1/4:ℂ))^2 = (Real.sqrt d:ℂ) := by
  rw [←Complex.cpow_nat_mul,Real.sqrt_eq_rpow,Complex.ofReal_cpow (Nat.cast_nonneg d)]
  norm_num

/-- The finite equality gives the complete four-residue-class assertion of the frozen reduction. -/
theorem of_finite_square (h : FiniteSquare) : OMA.R_CongruentNumber_Tunnell_even_R1_H3_R1.H2 := by
  obtain ⟨K,hK⟩ := IsAlgClosed.exists_pow_nat_eq (baseConstant/(2*(Real.sqrt 2:ℂ))) (by decide : 0<2)
  have h2 : (Real.sqrt 2:ℂ)≠0 := Complex.ofReal_ne_zero.mpr (Real.sqrt_pos.mpr (by norm_num)).ne'
  have hKn : K≠0 := by
    intro hz
    rw [hz,zero_pow two_ne_zero] at hK
    exact (div_ne_zero base_ne_zero (mul_ne_zero (by norm_num) h2)) hK.symm
  apply of_period_square K hKn
  intro d hs hd L hL
  have hd0 : 0<d := by omega
  have hn : (2*d)%8=2 := by omega
  have ho : Odd d := Nat.odd_iff.mpr (by omega)
  have hsd : Squarefree (2*d) := (Nat.squarefree_mul ho.coprime_two_left).mpr ⟨Nat.prime_two.squarefree,hs⟩
  have he := twist_sum (2*d) hn hsd L hL.1 hL.2
  have hg := h d hs hd
  have ht : tau (2*d) (by omega)≠0 := by
    letI : NeZero (4*(2*d)) := ⟨by omega⟩
    have hh := gauss_sq (character_primitive hd hs) (character_quadratic (2*d) (by omega)) (character_even hd)
    change tau (2*d) (by omega)^2 = ((4*(2*d):ℕ):ℂ) at hh
    intro eq
    rw [eq,zero_pow two_ne_zero] at hh
    exact (Nat.cast_ne_zero.mpr (by omega : 4*(2*d)≠0)) hh.symm
  have hD : (Real.sqrt d:ℂ)≠0 := Complex.ofReal_ne_zero.mpr (Real.sqrt_pos.mpr (Nat.cast_pos.mpr hd0)).ne'
  have hroot : (Real.sqrt (4*(2*d)):ℂ) = 2*(Real.sqrt 2:ℂ)*(Real.sqrt d:ℂ) := by
    rw [Real.sqrt_mul (by norm_num : (0:ℝ)≤4),Real.sqrt_mul (by norm_num : (0:ℝ)≤2)]
    push_cast
    norm_num
    <;> ring
  rw [hroot] at hg
  rw [div_pow,mul_pow,hK,root_sq]
  apply (eq_div_iff hD).mpr
  field_simp [h2]
  apply (mul_left_cancel₀ ht)
  linear_combination (2*(Real.sqrt 2:ℂ)*(Real.sqrt d:ℂ))*he + baseConstant*hg

end TunnellFiniteSymbols
#print axioms TunnellFiniteSymbols.of_finite_square
