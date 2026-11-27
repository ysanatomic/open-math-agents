import TunnellRankinStrip
import TunnellBaseActual

/-! Identification of the archimedean strip pairing with the eta newform and its binary theta partner. -/

namespace TunnellRankin
open Complex Set Function ModularForm TunnellCMLSeries MeasureTheory AddCircle
open UpperHalfPlane hiding I
open scoped ComplexConjugate

noncomputable def point (x t : ℝ) (ht : 0<t) : ℍ := ⟨(x:ℂ)+I*(t/(4*Real.pi):ℝ),by
  simp only [add_im,ofReal_im,I_mul_im,ofReal_re,zero_add]
  exact div_pos ht (by positivity)⟩

lemma mode_qParam (a : ℕ→ℂ) (x t : ℝ) (ht : 0<t) (m : ℕ) :
    mode a t m * fourier (T:=1) (m:ℤ) (x:AddCircle (1:ℝ)) =
      a m * Periodic.qParam 1 (point x t ht)^m := by
  rw [mode,fourier_coe_apply,Periodic.qParam,←exp_nat_mul,ofReal_exp,mul_assoc,←exp_add]
  congr 2
  change _ = (m:ℂ)*(2*↑Real.pi*I*((x:ℂ)+I*↑(t/(4*Real.pi):ℝ))/↑(1:ℝ))
  push_cast
  field_simp [Real.pi_ne_zero]
  ring_nf
  rw [I_sq]
  ring

lemma circle_eta (x t : ℝ) (ht : 0<t) :
    circleSeries (mode (twistA 1) t) (x : AddCircle (1:ℝ)) =
      TunnellFricke.h (4*(point x t ht:ℂ)) := by
  obtain ⟨H,hH,hw,F,hF,hfc⟩ := TunnellEtaValue.actual_form
  letI : H.IsArithmetic := hH
  have per : (1:ℝ)∈H.strictPeriods := hw ▸ H.strictWidthInfty_mem_strictPeriods
  have hb (m : ℕ) : (qExpansion 1 F).coeff m=twistA 1 m := by
    have he := TunnellArithmetic.eta_eq_mass
      (TunnellTruncated.cubic_congruence (fun N => TunnellCubicFinite.cubic _ N))
      (TunnellTruncated.theta_congruence (fun _ N => TunnellBalanced.balanced _ N)) m
    rw [hfc]
    by_cases ho : Odd m
    · simp [twistA,gaussCoeff,twistSign,ho,he]
    · have hmod : m%4 ≠ 1 := by have := Nat.odd_iff.not.mp ho; omega
      simp [twistA,gaussCoeff,twistSign,ho,TunnellInert.eta_zero_of_mod_four hmod]
  obtain ⟨C,hC⟩ := base_growth
  have ha := (circle_hasSum (summable_mode hC ht)).mapL (ContinuousMap.evalCLM ℂ (x:AddCircle (1:ℝ)))
  have hf := ModularForm.hasSum_qExpansion F one_pos per (point x t ht)
  simp only [hb,hF] at hf
  apply ha.unique
  apply hf.congr_fun
  intro m
  change mode (twistA 1) t m * fourier (T:=1) (m:ℤ) (x:AddCircle (1:ℝ)) = _
  exact mode_qParam _ _ _ _ _

noncomputable def theta (d : ℕ) (z : ℍ) : ℂ :=
  ∑' m : ℕ,(idealCoeff d m:ℂ)*Periodic.qParam 1 z^m

lemma circle_theta (d : ℕ) (x t : ℝ) (ht : 0<t) :
    circleSeries (mode (fun m => (idealCoeff d m:ℂ)) t) (x:AddCircle (1:ℝ))=theta d (point x t ht) := by
  have hc : Summable (mode (fun m => (idealCoeff d m:ℂ)) t) :=
    summable_mode (C:=1) (k:=1) (fun n => by simpa using norm_idealCoeff d n) ht
  have ha := (circle_hasSum hc).mapL (ContinuousMap.evalCLM ℂ (x:AddCircle (1:ℝ)))
  symm
  apply HasSum.tsum_eq
  apply ha.congr_fun
  intro m
  change (idealCoeff d m:ℂ)*Periodic.qParam 1 (point x t ht)^m =
    mode (fun m => (idealCoeff d m:ℂ)) t m*fourier (T:=1) (m:ℤ) (x:AddCircle (1:ℝ))
  exact (mode_qParam (fun j => (idealCoeff d j:ℂ)) x t ht m).symm

theorem strip_eta (d : ℕ) (t : ℝ) (ht : 0<t) : strip d t =
    ∫ x : ℝ in 0..1, conj (theta d (point x t ht))*TunnellFricke.h (4*(point x t ht:ℂ)) := by
  let f (x : AddCircle (1:ℝ)) := conj (circleSeries (mode (fun m => (idealCoeff d m:ℂ)) t) x)*
    circleSeries (mode (twistA 1) t) x
  have hh := fourierCoeff_eq_intervalIntegral f 0 0
  simp only [fourierCoeff,neg_zero,fourier_zero,one_smul,div_one,zero_add] at hh
  change (∫ x : AddCircle (1:ℝ),f x ∂haarAddCircle)=_
  rw [hh]
  simp only [f,circle_eta _ _ ht,circle_theta _ _ _ ht]

end TunnellRankin
#print axioms TunnellRankin.strip_eta
