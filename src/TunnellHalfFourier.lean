import TunnellHalfNormalizer
import TunnellTraceExpansion

/-! Even Fourier remainders and the odd coefficients used to eliminate the divisor series. -/
namespace TunnellHalfFourier
open TunnellHalfNormalizer
open UpperHalfPlane hiding I
noncomputable section

lemma half_q (z : ℍ) : q (U z)= -q z := by
  rw [q,q,U_coe]
  unfold Function.Periodic.qParam
  simp only [Complex.ofReal_one]
  rw [show 2*(Real.pi:ℂ)*Complex.I*((z:ℂ)+1/2)/1 =
    (2*(Real.pi:ℂ)*Complex.I*(z:ℂ)/1)+(Real.pi:ℂ)*Complex.I by ring,Complex.exp_add,Complex.exp_pi_mul_I]
  ring

theorem even_fixed {F : ℍ→ℂ} {a : ℕ→ℂ} (hF : Expansion F a) (hodd : ∀ m, Odd m → a m=0) (z : ℍ) :
    F (U z)=F z := by
  apply (hF (U z)).unique
  apply (hF z).congr_fun
  intro n
  rcases Nat.even_or_odd n with hn|hn
  · rw [half_q,hn.neg_pow]
  · rw [hodd n hn,zero_mul,zero_mul]

def remainder (u v w : ℂ) (F F₁ F₁₇ : ℍ→ℂ) (z : ℍ) := u*F z - v*F₁ z-w*F₁₇ z

theorem combination {F F₁ F₁₇ : ℍ→ℂ} {a b c D E : ℕ→ℂ} {H H₁ H₁₇ B : ℂ}
    (e : Expansion F a) (e₁ : Expansion F₁ b) (e₁₇ : Expansion F₁₇ c)
    (ha : ∀ n, Odd n → a n=H*D n+B*E n)
    (hb : ∀ n, Odd n → b n=H₁*D n+E n) (hc : ∀ n, Odd n → c n=H₁₇*D n) (z : ℍ) :
    remainder H₁₇ (H₁₇*B) (H-B*H₁) F F₁ F₁₇ (U z) =
      remainder H₁₇ (H₁₇*B) (H-B*H₁) F F₁ F₁₇ z := by
  apply even_fixed (a:=fun m => H₁₇*a m-H₁₇*B*b m-(H-B*H₁)*c m)
  · intro w
    apply (((e w).mul_left H₁₇).sub ((e₁ w).mul_left (H₁₇*B)) |>.sub ((e₁₇ w).mul_left (H-B*H₁))).congr_fun
    intro m; ring
  · intro m hm; rw [ha m hm,hb m hm,hc m hm]; ring

end
end TunnellHalfFourier
#print axioms TunnellHalfFourier.combination
