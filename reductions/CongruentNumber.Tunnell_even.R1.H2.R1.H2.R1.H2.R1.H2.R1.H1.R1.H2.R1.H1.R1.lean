import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1
import Mathlib

/-!
The ordinary formal division equation has a primitive root whose degree is φ(pʳ) and whose φ(pʳ)-th power is p times a unit. Its corresponding affine point has exact primary order. Comparing the local parameter degree and the global Gaussian division degree identifies the analytic fields and the uniformizer at the first place.
-/
namespace OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1_H1_R1
open Complex NumberField IsDedekindDomain IntermediateField IsLocalRing Set MeasureTheory
open scoped Classical NumberField

set_option maxHeartbeats 1400000 in
def H1 : Prop :=
  ∀ (n p:ℕ) (hp:p.Prime),0<n → 3<p → p%4=1 → ¬p∣2*n → ∀ q:GaussianInt,q.norm.natAbs=p →
  let v:HeightOneSpectrum ℤ:=Rat.HeightOneSpectrum.primesEquiv.symm ⟨p,hp⟩
  let Q:Type:=v.adicCompletion ℚ
  let Z:ValuationSubring (v.adicCompletion ℚ):=v.adicCompletionIntegers ℚ
  ∀ (j:Z),j^2= -1 → IsUnit ((Int.castRingHom (v.adicCompletionIntegers ℚ)) q.re-(Int.castRingHom (v.adicCompletionIntegers ℚ)) q.im*j) → ∀ r:ℕ,
  let a:=q^(r+1)
  let d:=(p^(r+1)).totient
  ∃ N:Type,∃ hN:Field N,letI:=hN;
  ∃ O:ValuationSubring N,IsDiscreteValuationRing O ∧ ∃ (g:(v.adicCompletion ℚ)→+*N) (f:(v.adicCompletionIntegers ℚ)→+*O),IsLocalHom (f:(v.adicCompletionIntegers ℚ)→+*O) ∧
    (∀ z:Z,(f z:N)=g z.val) ∧ ∃ (t h:O) (u:Oˣ),t∈maximalIdeal O ∧ h-1∈maximalIdeal O ∧
    t^d=(p:O)*u.val ∧ (letI:Algebra Q N:=g.toAlgebra; (minpoly Q (t:N)).natDegree=d) ∧
    let x:=1/((t:N)^2*h)
    let y:= -1/((t:N)^3*h)
    let W:WeierstrassCurve N:=⟨0,0,0,-(n:N)^2,0⟩
    ∃ (k:W.toAffine.Nonsingular x y) (l:W.toAffine.Nonsingular (-x) ((f j:N)*y)),
    let P:=WeierstrassCurve.Affine.Point.some x y k
    addOrderOf P=p^(r+1) ∧ a.re • P+a.im • (.some (-x) ((f j:N)*y) l)=0

open Complex
set_option maxHeartbeats 1400000 in
def H2 : Prop :=
  ∀ (n:ℕ),0<n → let ω:ℝ:=∫ x in Ioi (n:ℝ),(Real.sqrt (x^3-(n:ℝ)^2*x))⁻¹
  ∀ M:PeriodPair,M.ω₁=ω → M.ω₂=I*ω → ∀ (p:ℕ) (hp:p.Prime), 3<p → p%4=1 → ¬p∣2*n → ∀ q:GaussianInt,q.norm.natAbs=p →
  let v:HeightOneSpectrum ℤ:=Rat.HeightOneSpectrum.primesEquiv.symm ⟨p,hp⟩
  let Q:Type:=v.adicCompletion ℚ
  let Z:ValuationSubring (v.adicCompletion ℚ):=v.adicCompletionIntegers ℚ
  (∀ (j:Z),j^2= -1 → IsUnit ((Int.castRingHom (v.adicCompletionIntegers ℚ)) q.re-(Int.castRingHom (v.adicCompletionIntegers ℚ)) q.im*j) → ∀ r:ℕ,
  let a:=q^(r+1)
  let d:=(p^(r+1)).totient
  ∃ N:Type,∃ hN:Field N,letI:=hN;
  ∃ O:ValuationSubring N,IsDiscreteValuationRing O ∧ ∃ (g:(v.adicCompletion ℚ)→+*N) (f:(v.adicCompletionIntegers ℚ)→+*O),IsLocalHom (f:(v.adicCompletionIntegers ℚ)→+*O) ∧
    (∀ z:Z,(f z:N)=g z.val) ∧ ∃ (t h:O) (u:Oˣ),t∈maximalIdeal O ∧ h-1∈maximalIdeal O ∧
    t^d=(p:O)*u.val ∧ (letI:Algebra Q N:=g.toAlgebra; (minpoly Q (t:N)).natDegree=d) ∧
    let x:=1/((t:N)^2*h)
    let y:= -1/((t:N)^3*h)
    let W:WeierstrassCurve N:=⟨0,0,0,-(n:N)^2,0⟩
    ∃ (k:W.toAffine.Nonsingular x y) (l:W.toAffine.Nonsingular (-x) ((f j:N)*y)),
    let P:=WeierstrassCurve.Affine.Point.some x y k
    addOrderOf P=p^(r+1) ∧ a.re • P+a.im • (.some (-x) ((f j:N)*y) l)=0) →
  let K:=ℚ⟮I⟯
  let Ω:=algebraicClosure K ℂ
  let A (r:ℕ):=let t:=M.ω₁/(q:ℂ)^r
    (adjoin K {M.weierstrassP t,M.derivWeierstrassP t/2}).comap Ω.val
  let T:=A 1
  (∀ r:ℕ,@Module.finrank K (A (r+1)) _ _ (IntermediateField.module' (A (r+1)))=(p^(r+1)).totient) ∧ ∃ hT:NumberField T,letI:=hT; ∃ (w:HeightOneSpectrum (𝓞 T)) (k:𝓞 T),k∈w.asIdeal ∧ (((k:T):Ω):ℂ)=q ∧
  let O:=w.adicCompletionIntegers T
  let L:=w.adicCompletion T
  let t:=M.ω₁/(q:ℂ)
  ∃ (x y:T) (f:T→ₐ[K]ℂ) (s h:O),f x=M.weierstrassP t ∧ f y=M.derivWeierstrassP t/2 ∧
    h-1∈maximalIdeal O ∧ maximalIdeal O=Ideal.span {s} ∧
    algebraMap T L x=1/((s:L)^2*h) ∧ algebraMap T L y= -1/((s:L)^3*h)

open Complex
set_option maxHeartbeats 1400000 in
theorem main : H1 → H2 → OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1.H1 := by
  intro primitive compare
  refine fun n hn M h₁ h₂ p hp h₃ hmod good q hq => ?_
  exact compare n hn M h₁ h₂ p hp h₃ hmod good q hq (primitive n p hp hn h₃ hmod good q hq)

end OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1_H1_R1
