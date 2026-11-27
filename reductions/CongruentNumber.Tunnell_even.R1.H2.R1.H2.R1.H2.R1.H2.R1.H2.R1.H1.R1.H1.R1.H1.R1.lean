import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1
import Mathlib

/-! The local Artin map identifies the norm quotient of a finite abelian extension with its Galois group and respects conjugation. The geometric argument applies that identification to the cyclic translation group of a division lift. -/
namespace OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1
open Set hiding inclusion
open MeasureTheory Complex NumberField IsDedekindDomain IntermediateField IsLocalRing
open scoped Classical NumberField

set_option maxHeartbeats 2200000 in
def H1 : Prop :=
  ∀(F:Type)[Field F][NumberField F](w:HeightOneSpectrum (𝓞 F)),let L:=w.adicCompletion F
  ∀(Y:Type)[Field Y][Algebra L Y][FiniteDimensional L Y][IsAbelianGalois L Y],
  ∃ f:Lˣ→*Gal(Y/L),Function.Surjective f ∧ f.ker=(Units.map (Algebra.norm L (S:=Y))).range ∧
  ∀(d:L≃+*L)(s:Y≃+*Y),(∀z,Valued.v (d z)=Valued.v z) → (∀z:L,s (algebraMap L Y z)=algebraMap L Y (d z)) →
  ∀(u:Lˣ)(z:Y),s (f u z)=f (Units.map d.toMonoidHom u) (s z)

open Complex
set_option maxHeartbeats 2200000 in
def H2 : Prop :=
  (∀(F:Type)[Field F][NumberField F](w:HeightOneSpectrum (𝓞 F)),let L:=w.adicCompletion F
  ∀(Y:Type)[Field Y][Algebra L Y][FiniteDimensional L Y][IsAbelianGalois L Y],
  ∃ f:Lˣ→*Gal(Y/L),Function.Surjective f ∧ f.ker=(Units.map (Algebra.norm L (S:=Y))).range ∧
  ∀(d:L≃+*L)(s:Y≃+*Y),(∀z,Valued.v (d z)=Valued.v z) → (∀z:L,s (algebraMap L Y z)=algebraMap L Y (d z)) →
  ∀(u:Lˣ)(z:Y),s (f u z)=f (Units.map d.toMonoidHom u) (s z)) →
  ∀ n:ℕ,0<n → ∀ M:PeriodPair,M.ω₁=((∫ x in Ioi (n:ℝ),(Real.sqrt (x^3-(n:ℝ)^2*x))⁻¹):ℝ) → M.ω₂=I*M.ω₁ →
  (∃ P:(⟨0,0,0,-(n:ℚ)^2,0⟩:WeierstrassCurve ℚ).toAffine.Point,¬IsOfFinAddOrder P) →
  ∃ B:ℕ,∀ p>B,p.Prime → p%4=1 → ¬p∣2*n → ∀ q:GaussianInt,q.norm.natAbs=p →
  let K:=ℚ⟮I⟯;let Ω:=algebraicClosure K ℂ
  let A(r:ℕ):=(let t:=M.ω₁/(q:ℂ)^r;(adjoin K {M.weierstrassP t,M.derivWeierstrassP t/2}).comap Ω.val)
  let T:=A 1;∀hT:NumberField T,letI:=hT
  ∀(w:HeightOneSpectrum (𝓞 T))(z:𝓞 T),z∈w.asIdeal → (((z:T):Ω):ℂ)=(q:ℂ) →
  let O:=w.adicCompletionIntegers T;let L:=w.adicCompletion T
  ∃(r:ℕ)(h:T≤A (r+1)),let D:=A (r+1);letI:Algebra T D:=(inclusion h).toAlgebra
  ∃ hD:NumberField D,letI:=hD
  ∃(v:HeightOneSpectrum (𝓞 D))(N:IntermediateField D Ω)(hN:NumberField N),letI:=hN
  IsAbelianGalois D N ∧
  (∀i:HeightOneSpectrum (𝓞 D),i≠v → ∀j:HeightOneSpectrum (𝓞 N),j.asIdeal.LiesOver i.asIdeal → j.asIdeal.ramificationIdx (𝓞 D)=1) ∧
  ∀(x:(𝓞 D)ˣ)(b:K)(u u₀:Oˣ),((u:O):L)=(Algebra.norm T x.val.val:L) → ((u₀:O):L)=((algebraMap K T b:T):L) →
  let V:=v.adicCompletion D
  (∃t:HeightOneSpectrum (𝓞 N),t.asIdeal.LiesOver v.asIdeal ∧ ∃f:V→+*t.adicCompletion N,Continuous f ∧
    (∀c:D,f (c:V)=((algebraMap D N c:N):t.adicCompletion N)) ∧ letI:Algebra V (t.adicCompletion N):=f.toAlgebra
    ∃y:t.adicCompletion N,Algebra.norm V y=(x.val.val:V)) →
  ∃(τ:O)(δ:O≃+*O)(k:ℕ)(χ:Additive Oˣ→+ZMod p),maximalIdeal O=Ideal.span {τ} ∧ δ τ-k*τ∈maximalIdeal O^2 ∧ orderOf (k:ZMod p)=p-1 ∧
   (∃v:Oˣ,χ v≠0) ∧ (∀v:Oˣ,χ (Units.map δ.toMonoidHom v)=(k:ZMod p)*χ v) ∧ χ (u/u₀)=0

open Complex
set_option maxHeartbeats 4600000 in
theorem main : H1 → H2 → OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1.H1 := by
  intro reciprocity geom
  refine fun n hn M h₁ h₂ P hP => ?_
  have hper:M.ω₂=I*M.ω₁:=h₂.trans (congrArg (fun z:ℂ=>I*z) h₁).symm
  obtain ⟨B,choose⟩:=geom reciprocity n hn M h₁ hper ⟨P,hP⟩
  refine ⟨B,fun p hp hB hs hg q hq hT w z hz he=>?_⟩
  obtain ⟨r,h,hD,v,N,hN,ab,un,detect⟩:=choose p hB hp hs hg q hq hT w z hz he
  let K:=ℚ⟮I⟯
  let Ω:=algebraicClosure K ℂ
  let A(r:ℕ):=(let t:=M.ω₁/(q:ℂ)^r;(adjoin K {M.weierstrassP t,M.derivWeierstrassP t/2}).comap Ω.val)
  let T:=A 1
  let D:=A (r+1)
  letI:NumberField D:=hD
  letI:NumberField N:=hN
  have fd:FiniteDimensional D N:=Module.Finite.of_restrictScalars_finite ℚ D N
  have pure (j:InfinitePlace D):j.IsComplex:=by
    let i:K:=⟨I,subset_adjoin ℚ _ (Set.mem_singleton _)⟩
    have hh : i^2= -1 := K.val.injective I_sq
    apply InfinitePlace.not_isReal_iff_isComplex.mp
    intro real
    let f:K→+*ℝ:=(InfinitePlace.embedding_of_isReal real).comp (algebraMap K D)
    have e:=congrArg f hh
    simp only [map_pow,map_neg,map_one] at e
    nlinarith [sq_nonneg (f i)]
  refine ⟨r,h,hD,v,N,inferInstance,hN,inferInstance,fd,ab,pure,un,?_⟩
  refine fun x b u u₀ he₁ he₀ hloc=>?_
  apply detect x b u u₀ he₁ he₀
  obtain ⟨t,hv,g,hg,hc,y,hy⟩:=hloc
  exact ⟨t,hv,g,hg,hc,(y:t.adicCompletion N),hy⟩

end OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1
