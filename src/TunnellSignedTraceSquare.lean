import TunnellWindingTraceSource
import TunnellHalfPairing
import TunnellPeterssonNormalizer
import TunnellGaussCalibration

/-! Elimination of the divisor-series contribution by the discriminants eight and 136. -/
namespace TunnellWindingTrace
open TunnellShell TunnellHalfFourier TunnellHalfPairing TunnellHalfNormalizer TunnellRankinIntegral
open TunnellFiniteSymbols TunnellFricke TunnellRankinCalibration TunnellGaussCalibration TunnellToric
open scoped UpperHalfPlane
noncomputable section

lemma vanish {F : ℍ→ℂ} (hr : regular F) (he : ∀ z, F (U z)=F z) : petersson 32 (pair F)=0 := by
  have h := TunnellPeterssonMask.normalizer 32 U preserving conjugate intertwine hr.1
    (TunnellPeterssonMask.integrable_quotient 32 hr.1 hr.2.2) hr.2.1
  rw [anti he] at h
  simp only [petersson,MeasureTheory.integral_neg,tsum_neg] at h ⊢
  linear_combination -h/2

lemma mass_ne_zero {d : ℕ} {v : Triple} (h : normSq v=((2*d:ℕ):ℤ)) (hi : isRep v) : (mass d:ℂ)≠0 := by
  classical
  have hs : v∈shell (2*d) := (TunnellShell.mem_shell (N:=2*d) (v:=v)).mpr h
  have hr : v∈representatives (2*d) := by rw [representatives,Finset.mem_filter]; exact ⟨hs,hi⟩
  letI : Nonempty ↥(representatives (2*d)) := ⟨⟨v,hr⟩⟩
  exact_mod_cast (Fintype.card_pos (α:=↥(representatives (2*d)))).ne'

lemma mass17 : (mass 17:ℂ)≠0 :=
  mass_ne_zero (d:=17) (v:=(3,5,0)) (by decide) (by unfold isRep; decide)

theorem square_of_evidence {d : ℕ} (hd : d%4=1) (X : Evidence d hd)
    (Y : Evidence 1 (by decide)) (Z : Evidence 17 (by decide)) : signed d hd=shellPeriod d^2 := by
  let H (k : ℕ) := (mass k:ℝ)^2
  let B := (TunnellShell.b d:ℝ)^2
  let F := remainder (H 17:ℂ) ((H 17*B:ℝ):ℂ) ((H d-B*H 1:ℝ):ℂ) X.F Y.F Z.F
  have he (z : ℍ) : F (U z)=F z := by
    have h := combination (H:=(mass d:ℂ)^2) (H₁:=(mass 1:ℂ)^2) (H₁₇:=(mass 17:ℂ)^2)
      (B:=(TunnellShell.b d:ℂ)^2) X.expansion Y.expansion Z.expansion X.odd
      (fun m hm => by simpa only [b_one,Int.cast_one,one_pow,one_mul] using Y.odd m hm)
      (fun m hm => by simpa only [b_seventeen,Int.cast_zero,zero_pow (by decide : (2:ℕ)≠0),zero_mul,add_zero] using Z.odd m hm) z
    simpa only [F,H,B,Complex.ofReal_mul,Complex.ofReal_sub,Complex.ofReal_pow,Complex.ofReal_natCast,Complex.ofReal_intCast] using h
  have H0 := vanish (regular_sub (H 17) (H 17*B) (H d-B*H 1) X.reg Y.reg Z.reg) he
  rw [linear _ _ _ X.reg Y.reg Z.reg] at H0
  dsimp only [H,B] at H0
  push_cast at H0
  have c₁ := Y.central; have c₁₇ := Z.central
  have e₁ : signed 1 (by decide)=4 := by simp [signed,epsilon_one,winding_two]
  have e₁₇ : signed 17 (by decide)=0 := by simp [signed,winding_thirtyfour]
  rw [e₁] at c₁; rw [e₁₇] at c₁₇
  push_cast at c₁ c₁₇
  have e : ((mass 17:ℂ)^2*baseConstant^2)*((signed d hd:ℂ)-4*(TunnellShell.b d:ℂ)^2)=0 := by
    linear_combination (2*(Real.pi:ℂ)^2)*H0-(mass 17:ℂ)^2*X.central+
      (mass 17:ℂ)^2*(TunnellShell.b d:ℂ)^2*c₁+
      ((mass d:ℂ)^2-(TunnellShell.b d:ℂ)^2*(mass 1:ℂ)^2)*c₁₇
  have en := sub_eq_zero.mp ((mul_eq_zero.mp e).resolve_left (mul_ne_zero (pow_ne_zero 2 mass17) (pow_ne_zero 2 base_ne_zero)))
  have s : signed d hd=4*TunnellShell.b d^2 := by exact_mod_cast en
  rw [s,shellPeriod_eq,show TunnellWaldspurgerLocal.localPeriod d=2*TunnellShell.b d from
    TunnellTestVector.signed_shell d (Nat.odd_iff.mpr (by omega))]
  ring

theorem of_bridge (h : Bridge) : OMA.R_CongruentNumber_Tunnell_even_R1_H3_R1.H2 := by
  apply of_signed_square
  intro d hs hd
  exact square_of_evidence hd (evidence h hs hd).some (evidence h squarefree_one (by decide : 1%4=1)).some
    (evidence h (show Squarefree 17 from (by decide : Nat.Prime 17).squarefree) (by decide)).some

end
end TunnellWindingTrace
#print axioms TunnellWindingTrace.of_bridge
