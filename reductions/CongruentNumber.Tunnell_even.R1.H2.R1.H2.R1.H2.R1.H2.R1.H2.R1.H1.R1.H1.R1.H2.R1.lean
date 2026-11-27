import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1
import Mathlib

/-!
# Hensel lifting at the first Gaussian division prime
Writing p=uτ^(p−1) converts the pth-power equation to a polynomial over the residue field. The signed residue condition makes its linear coefficient invertible and supplies a root mod τ which lifts. 
-/
namespace OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H2_R1
open Set MeasureTheory Complex NumberField IsDedekindDomain IntermediateField IsLocalRing
open scoped Classical NumberField

def H1 : Prop :=
  ∀ (n:ℕ),0<n → ∀ M:PeriodPair,
  let ω:ℝ:=∫ x in Ioi (n:ℝ), (Real.sqrt (x^3-(n:ℝ)^2*x))⁻¹
  M.ω₁=(ω:ℂ) → M.ω₂=I*(ω:ℂ) →
  ∀ p:ℕ,p.Prime → p%4=1 → ¬p∣2*n → ∀ q:GaussianInt,q.norm.natAbs=p →
  let K:=ℚ⟮I⟯
  let Ω:=algebraicClosure K ℂ
  let t:=M.ω₁/(q:ℂ)^1
  let T:=(adjoin K {M.weierstrassP t,M.derivWeierstrassP t/2}).comap (algebraicClosure K ℂ).val
  ∀ hT:NumberField T,letI:=hT
  ∀ (w:HeightOneSpectrum (𝓞 T)) (z:𝓞 T),z∈w.asIdeal → (((z:T):Ω):ℂ)=(q:ℂ) →
  let O:=w.adicCompletionIntegers T
  HenselianLocalRing O ∧ Nonempty (ResidueField O≃+*ZMod p) ∧
    ∃ (τ:O) (u:Oˣ),maximalIdeal O=Ideal.span {τ} ∧ (u:O)*τ^(p-1)=(p:O) ∧ residue O (u:O)≠ -1

def H2 : Prop :=
  ∀ (O:Type) [CommRing O] [IsDomain O] [HenselianLocalRing O] (p:ℕ),p.Prime →
  Nonempty (ResidueField O≃+*ZMod p) →
  ∀ (s:O) (u:Oˣ),maximalIdeal O=Ideal.span {s} → (u:O)*s^(p-1)=(p:O) → residue O (u:O)≠ -1 →
  ∀t:O,maximalIdeal O=Ideal.span {t} → ∀c:O,∃y:O,(1+t*y)^p=1+t^p*c

set_option maxHeartbeats 1600000 in
theorem main : H1 → H2 → OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1.H2 := by
  intro first lifting
  refine fun n hn M h₁ h₂ p hp hm good q hq hT w z hz he => ?_
  obtain ⟨hensel,ρ,s,u,hs,hu,hr⟩:=first n hn M h₁ h₂ p hp hm good q hq hT w z hz he
  letI:=hensel
  exact ⟨ρ,lifting _ p hp ρ s u hs hu hr⟩

end OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H2_R1
