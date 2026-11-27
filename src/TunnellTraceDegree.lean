import TunnellAnalyticLine

/-! The Fourier series of the analytic rectangular trace and its exact odd coefficients. -/
namespace TunnellTraceSeries
open TunnellIdealHNF TunnellUniformBasis TunnellRamifiedLines TunnellGluePacket TunnellIntegralPacket TunnellTraceChoices
open TunnellRectangularClasses TunnellRectangularNumerator TunnellIdealThetaExpansion TunnellClassThetaExpansion
open TunnellRectangularIdeal TunnellLineIntegral TunnellAnalyticLine TunnellLineCoefficient
open scoped Classical UpperHalfPlane
noncomputable section
variable {d : ℕ} {I J : Ideal (R (2*d))}

def degree (x : I×J) := (valence x.1+4*valence x.2)/d^2

lemma value_eq (hs : Squarefree d) (hn : Squarefree (2*d)) (h2 : (2*d)%4=2) (hI : I≠⊥) (hJ : J≠⊥)
    (U : TunnellUniformBasis.Basis d I) (V : TunnellUniformBasis.Basis d J) (r : Roots (parameter U.atPrime V.atPrime))
    (x : {x:I×J // condition U V r.val x}) : value x.val=(d:ℤ)^2*degree x.val := by
  have h := integral hs hn h2 hI hJ U V r x.property.1 x.property.2
  have hd : d^2∣valence x.val.1+4*valence x.val.2 := by unfold value at h; exact_mod_cast h
  change (valence x.val.1:ℤ)+4*valence x.val.2=_
  exact_mod_cast (Nat.mul_div_cancel' hd).symm

lemma q_degree (hs : Squarefree d) (hn : Squarefree (2*d)) (h2 : (2*d)%4=2) (hI : I≠⊥) (hJ : J≠⊥)
    (U : TunnellUniformBasis.Basis d I) (V : TunnellUniformBasis.Basis d J) (r : Roots (parameter U.atPrime V.atPrime))
    (x : {x:I×J // condition U V r.val x}) (z : ℂ) : elem z x.val=(Function.Periodic.qParam 1 z)^degree x.val := by
  unfold elem Function.Periodic.qParam; rw [value_eq hs hn h2 hI hJ U V r x,←Complex.exp_nat_mul]
  congr 1; push_cast
  have hd : (d:ℂ)≠0 := by exact_mod_cast hs.ne_zero
  field_simp <;> ring


end
end TunnellTraceSeries
#print axioms TunnellTraceSeries.q_degree
