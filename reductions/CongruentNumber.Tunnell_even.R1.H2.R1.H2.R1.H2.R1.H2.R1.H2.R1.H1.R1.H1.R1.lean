import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1
import Mathlib

/-!
# The first Gaussian division completion
The residue of the first division completion is the prime field. At ramification degree p−1 the pth-power map on first principal units reaches the pth principal units. The remaining character construction supplies the tame action and the unit in its kernel.
-/
namespace OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1
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
      maximalIdeal O=Ideal.span {τ} ∧ δ τ-k*τ∈maximalIdeal O^2 ∧ orderOf (k:ZMod p)=p-1 ∧
      (∃ v:Oˣ,χ v≠0) ∧ (∀ v:Oˣ,χ (Units.map δ.toMonoidHom v)=(k:ZMod p)*χ v) ∧ χ (u/u₀)=0

def H2 : Prop :=
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
  Nonempty (ResidueField O≃+*ZMod p) ∧
    ∀τ:O,maximalIdeal O=Ideal.span {τ} → ∀c:O,∃y:O,(1+τ*y)^p=1+τ^p*c

set_option maxHeartbeats 5200000 in
theorem main : H1 → H2 → OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1.H1 := by
  intro character residue
  refine fun n hn M h₁ h₂ P hP => ?_
  obtain ⟨B,hB⟩:=character n hn M h₁ h₂ P hP
  refine ⟨B,?_⟩
  refine fun p hp hb hm hg q hq hT w z hz he => ?_
  obtain ⟨ρ,powers⟩:=residue n hn M h₁ h₂ p hp hm hg q hq hT w z hz he
  have data:=hB p hp hb hm hg q hq hT w z hz he
  obtain ⟨r,le,hd,v,N,field,hN,g,fd,ab,hC,hu,detect⟩:=data
  refine ⟨r,le,hd,v,N,field,hN,g,fd,ab,hC,hu,?_⟩
  refine fun x b u u₀ h h₀ norm => ?_
  obtain ⟨τ,δ,k,χ,m,tangent,ord,nonzero,eigen,kernel⟩:=detect x b u u₀ h h₀ norm
  exact ⟨τ,δ,k,χ,ρ,powers τ m,m,tangent,ord,nonzero,eigen,kernel⟩

end OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1
