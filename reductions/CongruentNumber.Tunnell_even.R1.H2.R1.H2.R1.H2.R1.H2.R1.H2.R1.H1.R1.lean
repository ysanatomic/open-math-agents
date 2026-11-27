import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1
import Mathlib

/-!
# Detection on the first principal units
A sufficiently deep division field provides a tame eigencharacter on the integral units of the first completion. The filtration by powers of its maximal ideal detects a unit ratio with nonzero first coefficient.
-/
namespace OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1
open Set MeasureTheory Complex NumberField IsDedekindDomain IntermediateField IsLocalRing
open scoped Classical NumberField

set_option maxHeartbeats 1200000 in
def H1 : Prop :=
  ∀ (n : ℕ) (hn : 0<n), let ω : ℝ := ∫ x in Ioi (n:ℝ), (Real.sqrt (x^3-(n:ℝ)^2*x))⁻¹;
  ∀ M : PeriodPair, M.ω₁=(ω:ℂ) → M.ω₂=I*(ω:ℂ) →
  ∀ P : (⟨0,0,0,-(n:ℚ)^2,0⟩ : WeierstrassCurve ℚ).toAffine.Point, ¬IsOfFinAddOrder P →
  ∃ B : ℕ, ∀ p : ℕ, p.Prime → B<p → p%4=1 → ¬p∣2*n → ∀ q : GaussianInt, q.norm.natAbs=p →
  let K:=ℚ⟮I⟯;
  let Ω:=algebraicClosure K ℂ;
  let A (r : ℕ) := (let t:=M.ω₁/(q:ℂ)^r;
                    (adjoin K {M.weierstrassP t,M.derivWeierstrassP t/2}).comap (algebraicClosure K ℂ).val);
  let T:=A 1;
  ∀ hT:NumberField T, letI:=hT;
  ∀ (w:HeightOneSpectrum (𝓞 T)) (z:𝓞 T), z∈w.asIdeal → (((z:T):Ω):ℂ)=(q:ℂ) →
  let O:=w.adicCompletionIntegers T; let L:=w.adicCompletion T; let e (x:T):L:=x;
  ∃ (r:ℕ) (h:T≤A (r+1)), let D:=A (r+1);
    letI : Algebra T D:=(IntermediateField.inclusion h).toAlgebra;
    ∃ hd:NumberField D, letI:=hd;
    ∃ (v:HeightOneSpectrum (𝓞 D)) (N:Type) (hn:Field N), letI:=hn;
    ∃ hN:NumberField N, letI:=hN;
    ∃ g:Algebra D N, letI:=g;
    FiniteDimensional D N ∧ IsAbelianGalois D N ∧ (∀ i:InfinitePlace D,i.IsComplex) ∧
    (∀ s:HeightOneSpectrum (𝓞 D),s≠v → ∀ t:HeightOneSpectrum (𝓞 N),t.asIdeal.LiesOver s.asIdeal →
      t.asIdeal.ramificationIdx (𝓞 D)=1) ∧
    ∀ (x:(𝓞 D)ˣ) (b:K),
    ∀ u u₀:Oˣ, ((u:O):L)=e (Algebra.norm T x.val.val) →
      ((u₀:O):L)=e (algebraMap K T b) →
    let V:=v.adicCompletion D;
    (∃ t:HeightOneSpectrum (𝓞 N),t.asIdeal.LiesOver v.asIdeal ∧ ∃ f:V→+*t.adicCompletion N,
      Continuous f ∧ (∀ c:D,f (c:V)=((algebraMap D N c:N):t.adicCompletion N)) ∧
      letI:Algebra V (t.adicCompletion N):=f.toAlgebra;
      ∃ y:(t.adicCompletion N)ˣ,Algebra.norm V (y:t.adicCompletion N)=(x.val.val:V)) →
    ∃ (τ:O) (δ:O≃+*O) (k:ℕ) (χ:Additive Oˣ→+ZMod p),
      Nonempty (ResidueField O≃+*ZMod p) ∧ (∀c:O,∃y:O,(1+τ*y)^p=1+τ^p*c) ∧
      maximalIdeal O=Ideal.span {τ} ∧ δ τ-k*τ∈maximalIdeal O^2 ∧ orderOf (k:ZMod p)=p-1 ∧
      (∃ v:Oˣ,χ v≠0) ∧ (∀ v:Oˣ,χ (Units.map δ.toMonoidHom v)=(k:ZMod p)*χ v) ∧ χ (u/u₀)=0

def H2 : Prop :=
  ∀ (O:Type) [CommRing O] [IsDomain O] [IsLocalRing O] (p:ℕ),p.Prime → p≠2 →
  ∀ (τ:O) (δ:O≃+*O) (k:ℕ) (χ:Additive Oˣ→+ZMod p),
    Nonempty (ResidueField O≃+*ZMod p) → (∀c:O,∃y:O,(1+τ*y)^p=1+τ^p*c) →
    maximalIdeal O=Ideal.span {τ} → δ τ-k*τ∈maximalIdeal O^2 → orderOf (k:ZMod p)=p-1 →
    (∃v:Oˣ,χ v≠0) → (∀v:Oˣ,χ (Units.map δ.toMonoidHom v)=(k:ZMod p)*χ v) →
    ∀u u₀:Oˣ,maximalIdeal O=Ideal.span {(u:O)-(u₀:O)} → χ (u/u₀)≠0

set_option maxHeartbeats 1200000 in
theorem main : H1 → H2 → OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1.H1 := by
  intro geometry detection
  refine fun n hn M h₁ h₂ P hP => ?_
  obtain ⟨B,hB⟩:=geometry n hn M h₁ h₂ P hP
  refine ⟨B,?_⟩
  intro p hp hb hmod good q hq
  dsimp only
  intro hT w z hz he
  obtain ⟨r,le,hd,v,N,field,hN,g,fd,ab,hC,hu,detect⟩:=hB p hp hb hmod good q hq hT w z hz he
  refine ⟨r,le,hd,v,N,field,hN,g,fd,ab,hC,hu,?_⟩
  intro x b u u₀ h h₀ hspan localNorm
  obtain ⟨τ,δ,k,χ,ρ,power,uniformizer,tangent,ord,nonzero,eigen,kernel⟩:=detect x b u u₀ h h₀ localNorm
  exact detection _ p hp (by omega) τ δ k χ ρ power uniformizer tangent ord nonzero eigen u u₀ hspan kernel

end OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1
