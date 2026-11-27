import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H2_R1
import Mathlib

/-! A primitive local Gaussian division point has parameter of degree p−1 and signed Hasse unit different from −1 in the residue field. The global comparison transfers that sign and the valuation of the parameter to the first analytic division field. -/
namespace OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H2_R1_H1_R1
open Set MeasureTheory Complex NumberField IsDedekindDomain IntermediateField IsLocalRing
open scoped Classical NumberField
set_option maxHeartbeats 1700000 in
def H1 : Prop :=
  ∀ (n p:ℕ) (hp:p.Prime),0<n → p%4=1 → ¬p∣2*n → ∀ q:GaussianInt,q.norm.natAbs=p →
  let v:HeightOneSpectrum ℤ:=Rat.HeightOneSpectrum.primesEquiv.symm ⟨p,hp⟩
  let Q:Type:=v.adicCompletion ℚ
  let Z:ValuationSubring (v.adicCompletion ℚ):=v.adicCompletionIntegers ℚ
  ∀ j:Z,j^2= -1 → IsUnit ((Int.castRingHom Z) q.re-(Int.castRingHom Z) q.im*j) →
  ∃ (N:Type) (fN:Field N),letI:=fN;
  ∃ R:ValuationSubring N,IsDiscreteValuationRing R ∧ ∃ (g:Q→+*N) (f:Z→+*R),IsLocalHom f ∧
    (∀ z:Z,(f z:N)=g z.val) ∧ ∃ (s:R) (u:Rˣ),s∈maximalIdeal R ∧
    (u:R)*s^(p-1)=(p:R) ∧ residue R (u:R)≠ -1 ∧
    (letI:Algebra Q N:=g.toAlgebra; (minpoly Q (s:N)).natDegree=p-1) ∧
    let W:WeierstrassCurve N:=⟨0,0,0,-(n:N)^2,0⟩
    ∃ (x y:N) (h:W.toAffine.Nonsingular x y) (l:W.toAffine.Nonsingular (-x) ((f j:N)*y)),
    let P:=WeierstrassCurve.Affine.Point.some x y h;
    -x/y=(s:N) ∧ addOrderOf P=p ∧ q.re • P+q.im • (.some (-x) ((f j:N)*y) l)=0

open Complex
set_option maxHeartbeats 1700000 in
def H2 : Prop :=
  ∀ (n:ℕ),0<n → ∀ M:PeriodPair,
  let ω:ℝ:=∫ x in Ioi (n:ℝ), (Real.sqrt (x^3-(n:ℝ)^2*x))⁻¹
  M.ω₁=(ω:ℂ) → M.ω₂=I*(ω:ℂ) →
  ∀ (p:ℕ) (hp:p.Prime), p%4=1 → ¬p∣2*n → ∀ q:GaussianInt,q.norm.natAbs=p →
  (let v:HeightOneSpectrum ℤ:=Rat.HeightOneSpectrum.primesEquiv.symm ⟨p,hp⟩
  let Q:Type:=v.adicCompletion ℚ
  let Z:ValuationSubring (v.adicCompletion ℚ):=v.adicCompletionIntegers ℚ
  ∀ j:Z,j^2= -1 → IsUnit ((Int.castRingHom Z) q.re-(Int.castRingHom Z) q.im*j) →
  ∃ (N:Type) (fN:Field N),letI:=fN;
  ∃ R:ValuationSubring N,IsDiscreteValuationRing R ∧ ∃ (g:Q→+*N) (f:Z→+*R),IsLocalHom f ∧
    (∀ z:Z,(f z:N)=g z.val) ∧ ∃ (s:R) (u:Rˣ),s∈maximalIdeal R ∧
    (u:R)*s^(p-1)=(p:R) ∧ residue R (u:R)≠ -1 ∧
    (letI:Algebra Q N:=g.toAlgebra; (minpoly Q (s:N)).natDegree=p-1) ∧
    let W:WeierstrassCurve N:=⟨0,0,0,-(n:N)^2,0⟩
    ∃ (x y:N) (h:W.toAffine.Nonsingular x y) (l:W.toAffine.Nonsingular (-x) ((f j:N)*y)),
    let P:=WeierstrassCurve.Affine.Point.some x y h;
    -x/y=(s:N) ∧ addOrderOf P=p ∧ q.re • P+q.im • (.some (-x) ((f j:N)*y) l)=0) →
  let K:=ℚ⟮I⟯
  let Ω:=algebraicClosure K ℂ
  let t:=M.ω₁/(q:ℂ)^1
  let T:=(adjoin K {M.weierstrassP t,M.derivWeierstrassP t/2}).comap (algebraicClosure K ℂ).val
  ∀ hT:NumberField T,letI:=hT
  ∀ (w:HeightOneSpectrum (𝓞 T)) (z:𝓞 T),z∈w.asIdeal → (((z:T):Ω):ℂ)=(q:ℂ) →
  let O:=w.adicCompletionIntegers T
  HenselianLocalRing O ∧ Nonempty (ResidueField O≃+*ZMod p) ∧
    ∃ (τ:O) (u:Oˣ),maximalIdeal O=Ideal.span {τ} ∧ (u:O)*τ^(p-1)=(p:O) ∧ residue O (u:O)≠ -1

open Complex
set_option maxHeartbeats 1700000 in
theorem main : H1 → H2 → OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H2_R1.H1 := by
  intro primitive compare
  refine fun n hn M ht₁ ht₂ p hp hmod good q hq => ?_
  exact compare n hn M ht₁ ht₂ p hp hmod good q hq (primitive n p hp hn hmod good q hq)

end OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H2_R1_H1_R1
