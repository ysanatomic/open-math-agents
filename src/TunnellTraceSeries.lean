import TunnellTraceDegree

/-! Fourier coefficients of the rectangular trace indexed by the ramified lines. -/
namespace TunnellTraceSeries
open TunnellIdealHNF TunnellUniformBasis TunnellRamifiedLines TunnellGluePacket TunnellIntegralPacket TunnellTraceChoices
open TunnellRectangularClasses TunnellRectangularNumerator TunnellIdealThetaExpansion TunnellClassThetaExpansion
open TunnellRectangularIdeal TunnellLineIntegral TunnellAnalyticLine TunnellLineCoefficient
open scoped Classical UpperHalfPlane
noncomputable section
variable {d : ℕ} {I J : Ideal (R (2*d))}

def shell_equiv (hs : Squarefree d) (hn : Squarefree (2*d)) (h2 : (2*d)%4=2) (hI : I≠⊥) (hJ : J≠⊥)
    (U : TunnellUniformBasis.Basis d I) (V : TunnellUniformBasis.Basis d J) (r : Roots (parameter U.atPrime V.atPrime)) (m : ℕ) :
    {x : {x : I×J // condition U V r.val x} // degree x.val=m} ≃ lineShell U.atPrime V.atPrime m r.val := by
  let X := {x : I×J // condition U V r.val x}
  let f (x : {x : X // degree x.val=m}) : lineShell U.atPrime V.atPrime m r.val :=
    ⟨x.val.val,x.val.property.1,x.val.property.2,(value_eq hs hn h2 hI hJ U V r x.val).trans (congrArg (fun k:ℕ => (d:ℤ)^2*k) x.property)⟩
  apply Equiv.ofBijective f
  constructor
  · intro x y h; apply Subtype.ext; apply Subtype.ext
    exact congrArg (fun z : lineShell U.atPrime V.atPrime m r.val => z.val) h
  · rintro ⟨x,hg,hl,he⟩
    let y : X := ⟨x,hg,hl⟩
    have h := (value_eq hs hn h2 hI hJ U V r y).symm.trans he
    have hd : (d:ℤ)^2≠0 := pow_ne_zero _ (by exact_mod_cast hs.ne_zero)
    exact ⟨⟨y,by exact_mod_cast mul_left_cancel₀ hd h⟩,rfl⟩

theorem line_expansion [NeZero d] (hs : Squarefree d) (hn : Squarefree (2*d)) (h2 : (2*d)%4=2) (hI : I≠⊥) (hJ : J≠⊥)
    (U : TunnellUniformBasis.Basis d I) (V : TunnellUniformBasis.Basis d J) (r : Roots (parameter U.atPrime V.atPrime)) {z : ℂ} (hz : 0<z.im) :
    HasSum (fun m : ℕ => (Nat.card (lineShell U.atPrime V.atPrime m r.val):ℂ)*(Function.Periodic.qParam 1 z)^m) (theta U V r.val z) := by
  classical
  let X := {x : I×J // condition U V r.val x}
  let g (x : X) := degree x.val
  let q := Function.Periodic.qParam 1 z
  have h : HasSum (fun x:X => elem z x.val) (theta U V r.val z) := by
    apply (hasSum_subtype_iff_indicator (f:=elem z) (s:={x:I×J | condition U V r.val x})).mpr
    exact line_sum hs hn h2 hI hJ U V r.val hz
  have H := ((Equiv.sigmaFiberEquiv g).hasSum_iff).mpr h
  apply H.sigma
  intro m
  let F := {x : X // g x=m}
  have hF (x:F) : elem z x.val.val=q^m := (q_degree hs hn h2 hI hJ U V r x.val z).trans (congrArg (q^·) x.property)
  have hf : Finite F := by
    have hconstant : Summable (fun _ : F => q^m) := (h.summable.comp_injective (i:=fun x:F => x.val) Subtype.val_injective).congr hF
    have hq : q≠0 := Complex.exp_ne_zero _
    exact Finite.of_summable_const (norm_pos_iff.mpr (pow_ne_zero m hq)) hconstant.norm
  letI := Fintype.ofFinite F
  have hfin := hasSum_fintype (fun _ : F => q^m)
  simp only [Finset.sum_const,Finset.card_univ,nsmul_eq_mul,←Nat.card_eq_fintype_card] at hfin
  rw [←Nat.card_congr (shell_equiv hs hn h2 hI hJ U V r m)]
  exact hfin.congr_fun hF

theorem trace_expansion [NeZero d] (hs : Squarefree d) (hn : Squarefree (2*d)) (h2 : (2*d)%4=2) (hI : I≠⊥) (hJ : J≠⊥)
    (U : TunnellUniformBasis.Basis d I) (V : TunnellUniformBasis.Basis d J) {z : ℂ} (hz : 0<z.im) :
    HasSum (fun m : ℕ => (weight U.atPrime V.atPrime m:ℂ)*(Function.Periodic.qParam 1 z)^m) (trace U V z) := by
  have H := hasSum_sum (s:=Finset.univ) fun (r : Roots (parameter U.atPrime V.atPrime)) _ => line_expansion hs hn h2 hI hJ U V r hz
  apply H.congr_fun
  intro m
  simp only [weight,Nat.cast_sum,Finset.sum_mul]

end
end TunnellTraceSeries
#print axioms TunnellTraceSeries.trace_expansion

