import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H2_R1_H1_R1_H1_R1
import Mathlib

/-! A primitive local Gaussian division point determines its global analytic division field. A sufficiently deep lift of a nontorsion point has a nonabelian completion in its relative Kummer extension. -/
namespace OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H2_R1_H1_R1_H1_R1_H1_R1
open Set hiding inclusion
open Module Function Complex NumberField IsDedekindDomain IsLocalRing IntermediateField MeasureTheory WeierstrassCurve WeierstrassCurve.Affine
open scoped Classical NumberField

set_option maxHeartbeats 2700000 in
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

set_option maxHeartbeats 2700000 in
def H2 : Prop :=
∀(n p:ℕ)(hp:p.Prime),0<n→p%4=1→¬p∣2*n→∀(M:PeriodPair),M.ω₁=((∫x in Ioi (n:ℝ),(Real.sqrt (x^3-(n:ℝ)^2*x))⁻¹):ℝ)→M.ω₂=I*M.ω₁→∀q:GaussianInt,q.norm.natAbs=p→
let b:HeightOneSpectrum ℤ:=Rat.HeightOneSpectrum.primesEquiv.symm ⟨p,hp⟩;let Q:Type:=b.adicCompletion ℚ;let Z:ValuationSubring (b.adicCompletion ℚ):=b.adicCompletionIntegers ℚ
(∀j:Z,j^2= -1→IsUnit ((Int.castRingHom (b.adicCompletionIntegers ℚ)) q.re-(Int.castRingHom (b.adicCompletionIntegers ℚ)) q.im*j)→∀r:ℕ,let a:=q^(r+1);let d:=(p^(r+1)).totient
∃(N:Type)(hN:Field N),letI:=hN;∃O:ValuationSubring N,IsDiscreteValuationRing O∧∃(g:b.adicCompletion ℚ→+*N)(f:b.adicCompletionIntegers ℚ→+*O),IsLocalHom (f:b.adicCompletionIntegers ℚ→+*O)∧(∀z:Z,(f z:N)=g z.val)∧∃(t h:O)(u:Oˣ),t∈maximalIdeal O∧h-1∈maximalIdeal O∧t^d=(p:O)*u.val∧(letI:Algebra Q N:=g.toAlgebra;(minpoly Q (t:N)).natDegree=d)∧
let x:=1/((t:N)^2*h);let y:= -1/((t:N)^3*h);let V:=(⟨0,0,0,-(n:N)^2,0⟩:WeierstrassCurve N).toAffine
∃(k:V.Nonsingular x y)(l:V.Nonsingular (-x) ((f j:N)*y)),let P:=Point.some x y k;addOrderOf P=p^(r+1)∧a.re•P+a.im•Point.some (-x) _ l=0)→
let K:=ℚ⟮I⟯;let Ω:=algebraicClosure K ℂ;let A(r:ℕ):=(let t:=M.ω₁/(q:ℂ)^r;(adjoin K {M.weierstrassP t,M.derivWeierstrassP t/2}).comap Ω.val)
∃hK:NumberField K,letI:=hK;∃(i:K)(v:HeightOneSpectrum (𝓞 K))(z:𝓞 K),(i:ℂ)=I∧z∈v.asIdeal∧(z:K)=q.re+q.im*i∧(∀a≠v,z∉a.asIdeal)∧
∀r:ℕ,let m:=p^(r+1);let a:=q^(r+1);let D:=A (r+1)
A 1≤D∧∃hD:NumberField D,letI:=hD;IsAbelianGalois K D∧finrank K D=m.totient∧
∃(s:HeightOneSpectrum (𝓞 D))(iD:𝓞 D),(iD:D)=algebraMap K D i∧s.asIdeal.LiesOver v.asIdeal∧(∀j≠s,¬j.asIdeal.LiesOver v.asIdeal)∧(∀j≠s,(q.re:𝓞 D)+(q.im:𝓞 D)*iD∉j.asIdeal)∧
let V:=((⟨0,0,0,-(n:K)^2,0⟩:WeierstrassCurve K).baseChange D).toAffine
∃(x y:D)(k:V.Nonsingular x y)(l:V.Nonsingular (-x) ((iD:D)*y)),let P:=Point.some x y k
adjoin K {x,y}=⊤∧addOrderOf P=m∧a.re•P+a.im•Point.some (-x) _ l=0∧let O:=s.adicCompletionIntegers D;let L:=s.adicCompletion D
∃τ:O,(τ:L)=(-x/y:D)∧maximalIdeal O=Ideal.span {τ}∧1<Valued.v (x:L)

def H3 : Prop :=
∀(n p:ℕ),0<n→p.Prime→p%4=1→¬p∣2*n→∀q:GaussianInt,q.norm.natAbs=p→
  let K:=ℚ⟮I⟯;∀[NumberField K](i:K),(i:ℂ)=I→∀(v:HeightOneSpectrum (𝓞 K))(z:𝓞 K),z∈v.asIdeal→(z:K)=q.re+q.im*i→
  (∃P:(⟨0,0,0,-(n:ℚ)^2,0⟩:WeierstrassCurve ℚ).toAffine.Point,¬IsOfFinAddOrder P)→
  let W:WeierstrassCurve K:=⟨0,0,0,-(n:K)^2,0⟩;∃P:(W.baseChange K).toAffine.Point,P≠0∧∃B:ℕ,∀r>B,∀(N:Type)[Field N][NumberField N][Algebra K N][IsScalarTower K K N][IsGalois K N]
    (j:HeightOneSpectrum (𝓞 N)),j.asIdeal.LiesOver v.asIdeal→let V:=(W.baseChange N).toAffine
  ∀(x y:N)(h:V.Nonsingular x y)(l:V.Nonsingular (-x) (algebraMap K N i*y)),let a:=q^r
  a.re•Point.some x y h+a.im•Point.some (-x) _ l=Point.map (Algebra.ofId K N) P→
  let k:=v.adicCompletion K;let E:=j.adicCompletion N
  ∀g:k→+*E,Continuous g→(∀b:K,g (b:k)=(algebraMap K N b:E))→letI:=g.toAlgebra;¬IsAbelianGalois k E

set_option maxHeartbeats 2700000 in
def H4 : Prop :=
∀(n p r:ℕ),0<n→p.Prime→p≠2→∀q:GaussianInt,q.norm.natAbs=p→
  let K:=ℚ⟮I⟯;let Ω:=algebraicClosure K ℂ;∀[NumberField K](D:IntermediateField K Ω)[NumberField D],IsAbelianGalois K D→∀i:K,(i:ℂ)=I→
  let W (B:Type)[Field B]:WeierstrassCurve B:=⟨0,0,0,-(n:B)^2,0⟩
  let cm (B F:Type)[Field B][Field F][Algebra B F](j:B)(x y:F):=let V:=((W B).baseChange F).toAffine;let pt:=@Point.some F _ V
    fun P:V.Point=>∃h l,let Z:=pt x y h;(q^r).re•Z+(q^r).im•pt (-x) (algebraMap B F j*y) l=P
  ∀(s t:D)(k:((W K).baseChange D).toAffine.Nonsingular s t),cm K D i s t 0→addOrderOf (Point.some s t k)=p^r→
  ∀P:((W K).baseChange K).toAffine.Point,P≠0→
  ∃(N:IntermediateField D Ω)(hN:NumberField N),letI:=hN;∃al:Algebra K N,letI:=al;∃tt:IsScalarTower K K N,letI:=tt
  IsScalarTower K D N∧IsGalois K N∧IsAbelianGalois D N∧Module.finrank D N∣p^r∧
  ∃u b:N,adjoin D {u,b}=⊤∧cm K N i u b (Point.map (Algebra.ofId K N) P)∧
    ∃Q:((W D).baseChange D).toAffine.Point,cm D N (algebraMap K D i) u b (Point.map (Algebra.ofId D N) Q)

theorem specified {K T:Type}[Field K][Field T][NumberField K][NumberField T][Algebra K T]
    (v:HeightOneSpectrum (𝓞 K))(w:HeightOneSpectrum (𝓞 T))(z:𝓞 K)
    (unique:∀b≠v,z∉b.asIdeal)(mem:algebraMap (𝓞 K) (𝓞 T) z∈w.asIdeal) : w.asIdeal.LiesOver v.asIdeal := by
  let b:HeightOneSpectrum (𝓞 K):=⟨w.asIdeal.under (𝓞 K),inferInstance,
    Ring.ne_bot_of_isMaximal_of_not_isField (M:=w.asIdeal.under (𝓞 K)) inferInstance (RingOfIntegers.not_isField K)⟩
  have e:b=v:=by by_contra hh;exact unique b hh mem
  exact ⟨congrArg HeightOneSpectrum.asIdeal e.symm⟩

theorem changeOrder {F:Type}[Field F]{V:WeierstrassCurve F}(d e:DecidableEq F)(Z:V.toAffine.Point)(m:ℕ) :
    (letI:=d;addOrderOf Z=m)→(letI:=e;addOrderOf Z=m) := by
  cases Subsingleton.elim d e
  exact id
theorem changeRelation {F:Type}[Field F]{V:WeierstrassCurve F}(d e:DecidableEq F)(q:GaussianInt)(Z Y P:V.toAffine.Point) :
    (letI:=d;q.re•Z+q.im•Y=P)→(letI:=e;q.re•Z+q.im•Y=P) := by
  cases Subsingleton.elim d e
  exact id
theorem relationAtOne {F:Type}[Field F]{V:WeierstrassCurve F}[d:DecidableEq F](q:GaussianInt)(Z Y P:V.toAffine.Point) :
    (q^(0+1)).re•Z+(q^(0+1)).im•Y=P→q.re•Z+q.im•Y=P := by
  rw [show q^(0+1)=q from pow_one q]
  exact id
theorem changeMap {B F:Type}[Field B][Field F][Algebra B F][IsScalarTower B B F](V:WeierstrassCurve B)(P:(V.baseChange B).toAffine.Point)
    (dB eB:DecidableEq B)(dF eF:DecidableEq F) :
    (letI:=dB;letI:=dF;Point.map (W':=V.toAffine) (Algebra.ofId B F) P) =
    (letI:=eB;letI:=eF;Point.map (W':=V.toAffine) (Algebra.ofId B F) P) := by
  cases Subsingleton.elim dB eB
  cases Subsingleton.elim dF eF
  rfl

set_option maxHeartbeats 8500000 in
theorem main : H1 → H2 → H3 → H4 → OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H2_R1_H1_R1_H1_R1.H1 := by
  intro primitive ordinary depth lift
  refine fun n hn M m₁ m₂ nt p hp split good q hq=>?_
  let K:=ℚ⟮I⟯
  let Ω:=algebraicClosure K ℂ
  let A(r:ℕ):=(let t:=M.ω₁/(q:ℂ)^r;(adjoin K {M.weierstrassP t,M.derivWeierstrassP t/2}).comap Ω.val)
  let T:=A 1
  let W (F:Type)[Field F]:WeierstrassCurve F:=⟨0,0,0,-(n:F)^2,0⟩
  obtain ⟨hK,i,a,z,hi,za,ez,ua,layers⟩:=ordinary n p hp hn split good M m₁ m₂ q hq
    (primitive n p hp hn (by have := hp.two_le;omega) split good q hq)
  letI:NumberField K:=hK
  obtain ⟨P,pne,B,nonab⟩:=depth n p hn hp split good q hq i hi a z za ez nt
  refine ⟨hK,?_⟩
  refine fun w zT zw eT=>?_
  have mapz:algebraMap (𝓞 K) (𝓞 T) z=zT:=by
    apply Subtype.ext
    apply T.val.injective
    apply (algebraicClosure K ℂ).val.injective
    change (algebraMap K ℂ) (z:K)=(((zT:T):Ω):ℂ)
    rw [ez,eT,GaussianInt.toComplex_def]
    simp only [map_add,map_mul,map_intCast]
    rw [show algebraMap K ℂ i=I from hi]
  have wa:=specified a w z ua (by rwa [mapz])
  obtain ⟨_,hT',_,_,w',iT,eiT,_,uw,_,x,y,h,lh,g,order,kill,τ,ht,span,hx⟩:=layers 0
  obtain rfl:w=w':=by by_contra ne;exact uw w ne wa
  refine ⟨i,a,hi,uw,x,y,?_,⟨τ,ht,span,hx⟩,?_⟩
  · dsimp only
    rw [←eiT]
    refine ⟨h,lh,Or.inr ?_,?_⟩
    · apply changeOrder (V:=(W K).baseChange T) (inferInstance:DecidableEq T) (Classical.decEq T) (Point.some x y h) p
      exact order.trans (pow_one p)
    · apply changeRelation (V:=(W K).baseChange T) (inferInstance:DecidableEq T) (Classical.decEq T) q (Point.some x y h) (Point.some (-x) _ lh) 0
      exact relationAtOne (V:=(W K).baseChange T) (d:=inferInstance) q _ _ _ kill
  let r:=B+1
  let D:=A r
  obtain ⟨le,hD,ab,deg,v,iD,eiD,va,uv,away,s,t,hs,ls,gen,ord,ks,_⟩:=layers B
  letI alg:Algebra T D:=(inclusion le).toAlgebra
  letI:NumberField D:=hD
  letI:IsAbelianGalois K D:=ab
  have cm0 (F:Type)[Field F][Algebra K F](j:F)(u b:F)(h':((W K).baseChange F).toAffine.Nonsingular u b)(l':((W K).baseChange F).toAffine.Nonsingular (-u) (j*b))
      (e:j=algebraMap K F i)(kill:(q^r).re•Point.some u b h'+(q^r).im•Point.some (-u) _ l'=0):
      ∃(H:((W K).baseChange F).toAffine.Nonsingular u b)(L:((W K).baseChange F).toAffine.Nonsingular (-u) (algebraMap K F i*b)),(q^r).re•Point.some u b H+(q^r).im•Point.some (-u) _ L=0:=by
    subst j
    exact ⟨h',l',kill⟩
  have ks' := changeRelation (V:=(W K).baseChange D) (inferInstance:DecidableEq D) (Classical.decEq D) (q^r) (Point.some s t hs) (Point.some (-s) _ ls) 0 ks
  have ord' := changeOrder (V:=(W K).baseChange D) (inferInstance:DecidableEq D) (Classical.decEq D) (Point.some s t hs) (p^r) ord
  have killed:=cm0 D iD s t hs ls eiD ks'
  obtain ⟨N,hN,al,st,tower,gal,rel,nd,u,b,gn,⟨hu,lu,ku⟩,Q,⟨hq',lq,kq⟩⟩:=lift n p r hn hp (by omega) q hq D ab i hi s t hs killed ord P pne
  letI:NumberField N:=hN
  letI:Algebra K N:=al
  letI:IsScalarTower K K N:=st
  letI:IsScalarTower K D N:=tower
  letI:IsGalois K N:=gal
  refine ⟨B,le,hD,v,N,hN,al,st,tower,ab,gal,rel,uv,deg,nd,iD,eiD,away,?_,?_,?_⟩
  · refine ⟨s,t,gen,?_⟩
    dsimp only
    rw [←eiD]
    exact ⟨hs,ls,Or.inr ord',ks'⟩
  · refine ⟨u,b,P,gn,⟨hu,lu,Or.inl rfl,ku⟩,Q,?_⟩
    dsimp only
    rw [eiD]
    exact ⟨hq',lq,Or.inl rfl,kq⟩
  · refine fun j hj=>?_
    letI:=hj
    letI:=va
    apply nonab r (Nat.lt_succ_self B) N j (Ideal.LiesOver.trans j.asIdeal v.asIdeal a.asIdeal) u b hu lu
    exact ku.trans (changeMap (W K) P (inferInstance:DecidableEq K) (inferInstance:DecidableEq K) (inferInstance:DecidableEq N) (Classical.decEq N))
end OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H2_R1_H1_R1_H1_R1_H1_R1
