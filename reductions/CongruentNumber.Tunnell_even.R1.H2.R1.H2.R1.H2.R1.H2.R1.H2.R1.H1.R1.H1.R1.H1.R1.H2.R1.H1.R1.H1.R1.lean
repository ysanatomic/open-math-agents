import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H2_R1_H1_R1
import Mathlib

/-! The coherent Gaussian division fields admit a cyclic Kummer quotient at the distinguished completion. The tame scalar acts on the affine uniformizer to first order, and uniqueness of the prime compares the local and global norms. -/
namespace OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H2_R1_H1_R1_H1_R1
open Module Function Subgroup
open Algebra (ofId)
open Set hiding inclusion
open Complex MeasureTheory NumberField IsDedekindDomain IsLocalRing IntermediateField WeierstrassCurve WeierstrassCurve.Affine
open scoped Classical NumberField

open Complex
set_option maxHeartbeats 3000000 in
def H1 : Prop :=
∀n:ℕ,0<n→∀M:PeriodPair,M.ω₁=((∫x in Ioi (n:ℝ),(Real.sqrt (x^3-(n:ℝ)^2*x))⁻¹):ℝ)→M.ω₂=I*M.ω₁→
(∃P:(⟨0,0,0,-(n:ℚ)^2,0⟩:WeierstrassCurve ℚ).toAffine.Point,¬IsOfFinAddOrder P)→
∀p:ℕ,p.Prime→p%4=1→¬p∣2*n→∀q:GaussianInt,q.norm.natAbs=p→
let K:=ℚ⟮I⟯;let Ω:=algebraicClosure K ℂ;let A(r:ℕ):=(let s:=M.ω₁/(q:ℂ)^r;(adjoin K {M.weierstrassP s,M.derivWeierstrassP s/2}).comap Ω.val);let T:=A 1
∃hK:NumberField K,letI:=hK
∀[NumberField T](w:HeightOneSpectrum (𝓞 T))(z:𝓞 T),z∈w.asIdeal→(((z:T):Ω):ℂ)=(q:ℂ)→
let W (B:Type)[Field B]:WeierstrassCurve B:=⟨0,0,0,-(n:B)^2,0⟩
∃(i:K)(a:HeightOneSpectrum (𝓞 K)),(i:ℂ)=I∧(∀s≠w,¬s.asIdeal.LiesOver a.asIdeal)∧
let cm (B F:Type)[Field B][Field F][Algebra B F](i:B)(m:ℕ)(a:GaussianInt)(x y:F):=let V:=((W B).baseChange F).toAffine;let pt:=@Point.some F _ V;fun P:V.Point=>∃h l,let Z:=pt x y h;(m=0∨addOrderOf Z=m)∧a.re•Z+a.im•pt (-x) (algebraMap B F i*y) l=P
∃x y:T,cm K T i p q x y 0∧
(let O:=w.adicCompletionIntegers T;let L:=w.adicCompletion T;∃τ:O,(τ:L)=(-x/y:T)∧maximalIdeal O=Ideal.span {τ}∧1<Valued.v (x:L))∧
∃(r:ℕ)(h:T≤A (r+1)),let D:=A (r+1);letI:Algebra T D:=(inclusion h).toAlgebra
∃hD:NumberField D,letI:=hD
∃(v:HeightOneSpectrum (𝓞 D))(N:IntermediateField D Ω)(hN:NumberField N),letI:=hN
∃al:Algebra K N,letI:=al;∃t:IsScalarTower K K N,letI:=t;IsScalarTower K D N∧IsAbelianGalois K D∧IsGalois K N∧IsAbelianGalois D N∧
(∀s≠v,¬s.asIdeal.LiesOver a.asIdeal)∧
let m:=r+1;
finrank K D=(p^m).totient∧finrank D N∣p^m∧
∃iD:𝓞 D,(iD:D)=algebraMap K D i∧(∀s≠v,(q.re:𝓞 D)+(q.im:𝓞 D)*iD∉s.asIdeal)∧
(∃s t:D,adjoin K {s,t}=⊤∧cm K D i (p^m) (q^m) s t 0)∧
(∃(u b:N)(P:((W K).baseChange K).toAffine.Point),adjoin D {u,b}=⊤∧cm K N i 0 (q^m) u b (Point.map (ofId K N) P)∧∃Q:((W D).baseChange D).toAffine.Point,cm D N (iD:D) 0 (q^m) u b (Point.map (ofId D N) Q))∧
∀j:HeightOneSpectrum (𝓞 N),j.asIdeal.LiesOver v.asIdeal→let k:=a.adicCompletion K;let E:=j.adicCompletion N
∀g:k→+*E,Continuous g→(∀z:K,g (z:k)=(algebraMap K N z:E))→letI:=g.toAlgebra;¬IsAbelianGalois k E

open Complex
set_option maxHeartbeats 3000000 in
def H2 : Prop :=
∀(n p r:ℕ)(q:GaussianInt),0<n→p.Prime→p≠2→ r≠0→q.norm.natAbs=p→
let K:=ℚ⟮I⟯;let Ω:=algebraicClosure K ℂ
∀[NumberField K](T D:IntermediateField K Ω)(h:T≤D),letI:Algebra T D:=(inclusion h).toAlgebra
∀[NumberField T][NumberField D](N:IntermediateField D Ω)[NumberField N][Algebra K N][IsScalarTower K D N][IsScalarTower K K N],IsAbelianGalois K D→IsGalois K N→IsAbelianGalois D N→
∀(a:HeightOneSpectrum (𝓞 K))(w:HeightOneSpectrum (𝓞 T))(v:HeightOneSpectrum (𝓞 D))(j:HeightOneSpectrum (𝓞 N)),(∀s≠w,¬s.asIdeal.LiesOver a.asIdeal)→(∀s≠v,¬s.asIdeal.LiesOver a.asIdeal)→j.asIdeal.LiesOver v.asIdeal→
let k:=a.adicCompletion K;let L:=w.adicCompletion T;let C:=v.adicCompletion D;let E:=j.adicCompletion N
let W:WeierstrassCurve K:=⟨0,0,0,-(n:K)^2,0⟩;∀i:K,(i:ℂ)=I→
let cm (F:Type)[Field F][Algebra K F](m:ℕ)(a:GaussianInt)(x y:F):=let V:=(W.baseChange F).toAffine;let pt:=@Point.some F _ V;fun P:V.Point=>∃h l,let Z:=pt x y h;(m=0∨addOrderOf Z=m)∧a.re•Z+a.im•pt (-x) (algebraMap K F i*y) l=P
∀(x y:T)(s t:D)(u b:N)(P:(W.baseChange K).toAffine.Point),cm T p q x y 0→cm D (p^r) (q^r) s t 0→cm N 0 (q^r) u b (Point.map (ofId K N) P)→adjoin K {s,t}=⊤→adjoin D {u,b}=⊤→finrank K D=(p^r).totient→
(∀g:k→+*E,Continuous g→(∀z:K,g (z:k)=(algebraMap K N z:E))→letI:=g.toAlgebra;¬IsAbelianGalois k E)→
∃(f:L→+*C)(g:C→+*E),letI:=f.toAlgebra;letI:=g.toAlgebra
Continuous g∧(∀z:D,g (z:C)=(algebraMap D N z:E))∧
Continuous f∧(∀z:T,f (z:L)=(algebraMap T D z:C))∧
let k₀:=ZMod p
∃(d:L≃+*L)(μ:C≃+*C)(σ:Gal(C/L))(k:ℕ)(κ:Gal(E/C)→*Multiplicative k₀),orderOf (k:k₀)=p-1∧
(∃h:(⟨0,0,0,-(n:L)^2,0⟩:WeierstrassCurve L).toAffine.Nonsingular (x:L) y,d (-(x:L)/y)=match k•(Point.some _ _ h) with | .zero=>0 | .some U V _=> -U/V)∧
(∀z,Valued.v (d z)=Valued.v z)∧(∀b:K,d (algebraMap K T b:L)=algebraMap K T b)∧(μ∘f=f∘d)∧(∀b:Gal(C/L),Commute μ b.toRingEquiv)∧
zpowers σ=⊤∧Surjective κ∧
∀(a:C≃+*C)(l:k₀),(a=μ∧l=k∨a=σ.toRingEquiv∧l=1)→(∀z,Valued.v (a z)=Valued.v z)∧∃s:E≃+*E,(s∘g=g∘a)∧∀b c:Gal(E/C),(s∘b=c∘s)→(κ c).toAdd=l*(κ b).toAdd

open Complex
set_option maxHeartbeats 3000000 in
def H3 : Prop :=
∀(D:Type)[Field D][NumberField D](w:HeightOneSpectrum (𝓞 D))(k:ℕ),
  let O:=w.adicCompletionIntegers D;let L:=w.adicCompletion D
  ∀[DecidableEq L](U:WeierstrassCurve O)(W:WeierstrassCurve L)[W.IsElliptic],
  U.map (algebraMap O L)=W → ∀(x y:L)(h:W.toAffine.Nonsingular x y)(t:O)(δ:O≃+*O),
  1<Valued.v x → (t:L)= -x/y → maximalIdeal O=Ideal.span {t} →
  let par (P:W.toAffine.Point):L:=match P with | .zero=>0 | .some a b _=> -a/b
  ((δ t:O):L)=par (k•(Point.some x y h)) → δ t-k*t∈maximalIdeal O^2

open Complex
set_option maxHeartbeats 3000000 in
def H4 : Prop :=
∀(T D:Type)[Field T][Field D][NumberField T][NumberField D][Algebra T D][IsAbelianGalois T D]
  (w:HeightOneSpectrum (𝓞 T))(v:HeightOneSpectrum (𝓞 D)),v.asIdeal.LiesOver w.asIdeal→
  let L:=w.adicCompletion T;let C:=v.adicCompletion D
  ∀f:L→+*C,Continuous f→(∀z:T,f (z:L)=(algebraMap T D z:C))→letI:=f.toAlgebra
  FiniteDimensional L C∧IsAbelianGalois L C∧((∀s≠v,¬s.asIdeal.LiesOver w.asIdeal)→∀z:D,Algebra.norm L (z:C)=(Algebra.norm T z:L))

theorem above {K L:Type}[Field K][Field L][NumberField K][NumberField L][Algebra K L]
    (v:HeightOneSpectrum (𝓞 K)) : ∃w:HeightOneSpectrum (𝓞 L),w.asIdeal.LiesOver v.asIdeal := by
  obtain ⟨q,hq,h⟩:=Ideal.exists_maximal_ideal_liesOver_of_isIntegral (S:=𝓞 L) v.asIdeal
  exact ⟨⟨q,hq.isPrime,Ring.ne_bot_of_isMaximal_of_not_isField hq (RingOfIntegers.not_isField L)⟩,h⟩
theorem between {K T D:Type}[Field K][Field T][Field D][NumberField K][NumberField T][NumberField D]
    [Algebra K T][Algebra K D][Algebra T D][IsScalarTower K T D] (a:HeightOneSpectrum (𝓞 K))
    (w:HeightOneSpectrum (𝓞 T))(v:HeightOneSpectrum (𝓞 D))
    (hw:∀s≠w,¬s.asIdeal.LiesOver a.asIdeal)(hv:∀s≠v,¬s.asIdeal.LiesOver a.asIdeal) :
    w.asIdeal.LiesOver a.asIdeal∧v.asIdeal.LiesOver w.asIdeal∧(∀s≠v,¬s.asIdeal.LiesOver w.asIdeal) := by
  obtain ⟨b,hb⟩:=above (L:=T) a
  obtain rfl:b=w:=by by_contra hh;exact hw b hh hb
  letI:=hb
  obtain ⟨c,hc⟩:=above (L:=D) b
  letI:=hc
  have hca:=Ideal.LiesOver.trans c.asIdeal b.asIdeal a.asIdeal
  obtain rfl:c=v:=by by_contra hh;exact hv c hh hca
  refine ⟨hb,hc,fun s hs hh=>?_⟩
  letI:=hh
  exact hv s hs (Ideal.LiesOver.trans s.asIdeal b.asIdeal a.asIdeal)

theorem transport {X:Type}[Field X]{V:WeierstrassCurve X} (d e:DecidableEq X) (a:GaussianInt)(Z Y P:V.toAffine.Point) :
    (letI:=d;a.re•Z+a.im•Y=P)→(letI:=e;a.re•Z+a.im•Y=P) := by
  cases Subsingleton.elim d e
  exact id
theorem coincide {F:Type}[Field F]{V:WeierstrassCurve F}{d e:DecidableEq F}{k:ℕ}{P A B:V.toAffine.Point}
    (a:(letI:=d;k•P)=A)(b:(letI:=e;k•P)=B) : A=B := by
  cases Subsingleton.elim d e
  exact a.symm.trans b

theorem detects (tangent:H3){T:Type}[Field T][NumberField T] (w:HeightOneSpectrum (𝓞 T))
    (n k:ℕ)(hn:0<n)(x y:T)(d:w.adicCompletion T≃+*w.adicCompletion T)
    (hv:∀z,Valued.v (d z)=Valued.v z) (τ:w.adicCompletionIntegers T)
    (et:(τ:w.adicCompletion T)=algebraMap T _ (-x/y))(span:maximalIdeal _=Ideal.span {τ})(hx:1<Valued.v (algebraMap T (w.adicCompletion T) x))
    (slope: (let L:=w.adicCompletion T;let W:WeierstrassCurve L:=⟨0,0,0,-(n:L)^2,0⟩
     ∃h:W.toAffine.Nonsingular (x:L) y,d (-(x:L)/y)=match k•(Point.some _ _ h) with | .zero=>0 | .some U V _=> -U/V)) :
    let O:=w.adicCompletionIntegers T;let L:=w.adicCompletion T
    ∃δ:O≃+*O,δ τ-k*τ∈maximalIdeal O^2∧∀z:O,d (z:L)=(δ z:O) := by
  let O:=w.adicCompletionIntegers T
  let L:=w.adicCompletion T
  let U:WeierstrassCurve O:=⟨0,0,0,-(n:O)^2,0⟩
  let W:WeierstrassCurve L:=⟨0,0,0,-(n:L)^2,0⟩
  let δ:O≃+*O:=RingEquiv.restrict d (w.adicCompletionIntegers T).toSubring (w.adicCompletionIntegers T).toSubring
    (fun z=>by change Valued.v z≤1 ↔ Valued.v (d z)≤1;rw [hv])
  have m:U.map (algebraMap O L)=W:=by ext <;> simp [U,W,WeierstrassCurve.map]
  haveI:CharZero L:=charZero_of_injective_algebraMap (algebraMap T L).injective
  haveI:NeZero (n:L):=⟨by exact_mod_cast hn.ne'⟩
  haveI:W.IsElliptic:=by
    have disc:W.Δ=(64:L)*(n:L)^6:=by simp [W,WeierstrassCurve.Δ,WeierstrassCurve.b₂,WeierstrassCurve.b₄,WeierstrassCurve.b₆,WeierstrassCurve.b₈];ring
    exact ⟨isUnit_iff_ne_zero.mpr (disc ▸ mul_ne_zero (by norm_num) (pow_ne_zero _ (NeZero.ne (n:L))))⟩
  have ht:(τ:L)= -(x:L)/y:=et.trans (by change algebraMap T L (-x/y)=_;rw [map_div₀,map_neg];rfl)
  obtain ⟨h,hs⟩:=slope
  refine ⟨δ,tangent T w k U W m (x:L) (y:L) h τ δ hx ht span ?_,fun _=>rfl⟩
  change d (τ:L)=_
  rw [ht]
  convert hs using 1
  all_goals cases k•(Point.some (x:L) (y:L) h) <;> rfl

set_option maxHeartbeats 1800000 in
theorem finish (tangent:H3)(norm:H4)
    {K T D N:Type}[Field K][Field T][Field D][Field N][NumberField T][NumberField D][NumberField N]
    [Algebra K T][Algebra T D][Algebra D N][IsAbelianGalois T D][IsAbelianGalois D N]
    (w:HeightOneSpectrum (𝓞 T))(v:HeightOneSpectrum (𝓞 D))(j:HeightOneSpectrum (𝓞 N))
    (vw:v.asIdeal.LiesOver w.asIdeal)(unique:∀s≠v,¬s.asIdeal.LiesOver w.asIdeal)(hj:j.asIdeal.LiesOver v.asIdeal)
    (n p:ℕ)(hn:0<n)(x y:T)(τ:w.adicCompletionIntegers T)(ht:(τ:w.adicCompletion T)=(-x/y:T))
    (span:maximalIdeal _=Ideal.span {τ})(hx:1<Valued.v (x:w.adicCompletion T))
    (data:(by exact (let L:=w.adicCompletion T;let C:=v.adicCompletion D;let E:=j.adicCompletion N
∃(f:L→+*C)(g:C→+*E),letI:=f.toAlgebra;letI:=g.toAlgebra
Continuous g∧(∀z:D,g (z:C)=(algebraMap D N z:E))∧
Continuous f∧(∀z:T,f (z:L)=(algebraMap T D z:C))∧
let k₀:=ZMod p
∃(d:L≃+*L)(μ:C≃+*C)(σ:Gal(C/L))(k:ℕ)(κ:Gal(E/C)→*Multiplicative k₀),orderOf (k:k₀)=p-1∧
(∃h:(⟨0,0,0,-(n:L)^2,0⟩:WeierstrassCurve L).toAffine.Nonsingular (x:L) y,d (-(x:L)/y)=match k•(Point.some _ _ h) with | .zero=>0 | .some U V _=> -U/V)∧
(∀z,Valued.v (d z)=Valued.v z)∧(∀b:K,d (algebraMap K T b:L)=algebraMap K T b)∧(μ∘f=f∘d)∧(∀b:Gal(C/L),Commute μ b.toRingEquiv)∧
zpowers σ=⊤∧Surjective κ∧
∀(a:C≃+*C)(l:k₀),(a=μ∧l=k∨a=σ.toRingEquiv∧l=1)→(∀z,Valued.v (a z)=Valued.v z)∧∃s:E≃+*E,(s∘g=g∘a)∧∀b c:Gal(E/C),(s∘b=c∘s)→(κ c).toAdd=l*(κ b).toAdd))) : (by exact (let L:=w.adicCompletion T;let C:=v.adicCompletion D;let E:=j.adicCompletion N;let O:=w.adicCompletionIntegers T
∃(f:L→+*C)(g:C→+*E),letI:=f.toAlgebra;letI:=g.toAlgebra
Continuous g∧(∀z:D,g (z:C)=(algebraMap D N z:E))∧(∀z:D,Algebra.norm L (z:C)=(Algebra.norm T z:L))∧
FiniteDimensional L C∧IsAbelianGalois L C∧FiniteDimensional C E∧IsAbelianGalois C E∧
let m:=maximalIdeal O;let k₀:=ZMod p
∃(τ:O)(δ:O≃+*O)(d:L≃+*L)(μ:C≃+*C)(σ:Gal(C/L))(k:ℕ)(κ:Gal(E/C)→*Multiplicative k₀),m=Ideal.span {τ}∧δ τ-k*τ∈m^2∧orderOf (k:k₀)=p-1∧
(∀z:O,d z=(δ z:O))∧(∀z,Valued.v (d z)=Valued.v z)∧(∀b:K,d (algebraMap K T b:L)=algebraMap K T b)∧(∀z,μ (f z)=f (d z))∧(∀(b:Gal(C/L))z,μ (b z)=b (μ z))∧
(∀t:Gal(C/L),t∈zpowers σ)∧Surjective κ∧
∀(a:C≃+*C)(l:k₀),(a=μ∧l=k∨a=σ.toRingEquiv∧l=1)→(∀z,Valued.v (a z)=Valued.v z)∧∃s:E≃+*E,(∀z,s (g z)=g (a z))∧∀b c:Gal(E/C),(∀z,s (b z)=c (s z))→(κ c).toAdd=l*(κ b).toAdd)) := by
  obtain ⟨f,g,cg,eg,cf,ef,d,μ,σ,k,κ,ord,param,vd,fix,res,com,zpow,surj,actions⟩:=data
  let L:=w.adicCompletion T
  let C:=v.adicCompletion D
  let E:=j.adicCompletion N
  letI:Algebra L C:=f.toAlgebra
  letI:Algebra C E:=g.toAlgebra
  obtain ⟨ft,ab₁,hnorm⟩:=norm T D w v vw f cf ef
  obtain ⟨fn,ab₂,_⟩:=norm D N v j hj g cg eg
  obtain ⟨kh,par⟩:=param
  obtain ⟨δ,ds,dr⟩:=detects tangent w n k hn x y d vd τ ht span hx (by
    refine ⟨kh,par.trans ?_⟩
    split <;> rename_i e₁
    all_goals first | rfl | (split <;> rename_i e₂ <;> cases coincide e₁ e₂ <;> rfl))
  refine ⟨f,g,cg,eg,hnorm unique,ft,ab₁,fn,ab₂,τ,δ,d,μ,σ,k,κ,span,ds,ord,dr,vd,fix,congrFun res,?_,?_,surj,?_⟩
  · intro b z
    exact congrArg (fun e:C≃+*C=>e z) (com b).eq
  · intro t
    rw [zpow] <;> trivial
  · intro b l ch
    obtain ⟨va,S,hS,action⟩:=actions b l ch
    exact ⟨va,S,congrFun hS,fun b c rest=>action b c (funext rest)⟩

set_option maxHeartbeats 11000000 in
theorem step (scalars:H2)(tangent:H3)(norm:H4)
    {n p:ℕ}(hn:0<n)(hp:p.Prime)(split:p%4=1)(q:GaussianInt)(hq:q.norm.natAbs=p) [hk:NumberField ℚ⟮I⟯]
    (A:ℕ→IntermediateField ℚ⟮I⟯ (algebraicClosure ℚ⟮I⟯ ℂ)) [hT:NumberField (A 1)]
    (w:HeightOneSpectrum (𝓞 (A 1))) (source:(by exact (let K:=ℚ⟮I⟯;let Ω:=algebraicClosure K ℂ;let T:=A 1
let W (B:Type)[Field B]:WeierstrassCurve B:=⟨0,0,0,-(n:B)^2,0⟩
∃(i:K)(a:HeightOneSpectrum (𝓞 K)),(i:ℂ)=I∧(∀s≠w,¬s.asIdeal.LiesOver a.asIdeal)∧
let cm (B F:Type)[Field B][Field F][Algebra B F](i:B)(m:ℕ)(a:GaussianInt)(x y:F):=let V:=((W B).baseChange F).toAffine;let pt:=@Point.some F _ V;fun P:V.Point=>∃h l,let Z:=pt x y h;(m=0∨addOrderOf Z=m)∧a.re•Z+a.im•pt (-x) (algebraMap B F i*y) l=P
∃x y:T,cm K T i p q x y 0∧
(let O:=w.adicCompletionIntegers T;let L:=w.adicCompletion T;∃τ:O,(τ:L)=(-x/y:T)∧maximalIdeal O=Ideal.span {τ}∧1<Valued.v (x:L))∧
∃(r:ℕ)(h:T≤A (r+1)),let D:=A (r+1);letI:Algebra T D:=(inclusion h).toAlgebra
∃hD:NumberField D,letI:=hD
∃(v:HeightOneSpectrum (𝓞 D))(N:IntermediateField D Ω)(hN:NumberField N),letI:=hN
∃al:Algebra K N,letI:=al;∃t:IsScalarTower K K N,letI:=t;IsScalarTower K D N∧IsAbelianGalois K D∧IsGalois K N∧IsAbelianGalois D N∧
(∀s≠v,¬s.asIdeal.LiesOver a.asIdeal)∧
let m:=r+1;
finrank K D=(p^m).totient∧finrank D N∣p^m∧
∃iD:𝓞 D,(iD:D)=algebraMap K D i∧(∀s≠v,(q.re:𝓞 D)+(q.im:𝓞 D)*iD∉s.asIdeal)∧
(∃s t:D,adjoin K {s,t}=⊤∧cm K D i (p^m) (q^m) s t 0)∧
(∃(u b:N)(P:((W K).baseChange K).toAffine.Point),adjoin D {u,b}=⊤∧cm K N i 0 (q^m) u b (Point.map (ofId K N) P)∧∃Q:((W D).baseChange D).toAffine.Point,cm D N (iD:D) 0 (q^m) u b (Point.map (ofId D N) Q))∧
∀j:HeightOneSpectrum (𝓞 N),j.asIdeal.LiesOver v.asIdeal→let k:=a.adicCompletion K;let E:=j.adicCompletion N
∀g:k→+*E,Continuous g→(∀z:K,g (z:k)=(algebraMap K N z:E))→letI:=g.toAlgebra;¬IsAbelianGalois k E
))) : (by exact (let K:=ℚ⟮I⟯;let Ω:=algebraicClosure K ℂ;let T:=A 1
∃(r:ℕ)(h:T≤A (r+1)),let D:=A (r+1);letI:Algebra T D:=(inclusion h).toAlgebra
∃hD:NumberField D,letI:=hD
∃(v:HeightOneSpectrum (𝓞 D))(N:IntermediateField D Ω)(hN:NumberField N),letI:=hN
IsAbelianGalois D N∧finrank D N∣p^(r+1)∧
∃i:𝓞 D,i^2= -1∧(∀j≠v,(q.re:𝓞 D)+(q.im:𝓞 D)*i∉j.asIdeal)∧
let W:WeierstrassCurve D:=⟨0,0,0,-(n:D)^2,0⟩;let V:=(W.baseChange N).toAffine;let a:=q^(r+1)
(∃(x y:N)(h:V.Nonsingular x y)(l:V.Nonsingular (-x) ((algebraMap D N i)*y))(P:(W.baseChange D).toAffine.Point),adjoin D {x,y}=⊤∧a.re•(.some x y h)+a.im•(.some (-x) _ l)=Point.baseChange (W':=W.toAffine) D N P)∧
let C:=v.adicCompletion D;let L:=w.adicCompletion T;let O:=w.adicCompletionIntegers T
∀j:HeightOneSpectrum (𝓞 N),j.asIdeal.LiesOver v.asIdeal→
let E:=j.adicCompletion N;∃(f:L→+*C)(g:C→+*E),letI:=f.toAlgebra;letI:=g.toAlgebra
Continuous g∧(∀z:D,g (z:C)=(algebraMap D N z:E))∧(∀z:D,Algebra.norm L (z:C)=(Algebra.norm T z:L))∧
FiniteDimensional L C∧IsAbelianGalois L C∧FiniteDimensional C E∧IsAbelianGalois C E∧
let m:=maximalIdeal O;let k₀:=ZMod p
∃(τ:O)(δ:O≃+*O)(d:L≃+*L)(μ:C≃+*C)(σ:Gal(C/L))(k:ℕ)(κ:Gal(E/C)→*Multiplicative k₀),m=Ideal.span {τ}∧δ τ-k*τ∈m^2∧orderOf (k:k₀)=p-1∧
(∀z:O,d z=(δ z:O))∧(∀z,Valued.v (d z)=Valued.v z)∧(∀b:K,d (algebraMap K T b:L)=algebraMap K T b)∧(∀z,μ (f z)=f (d z))∧(∀(b:Gal(C/L))z,μ (b z)=b (μ z))∧
(∀t:Gal(C/L),t∈zpowers σ)∧Surjective κ∧
∀(a:C≃+*C)(l:k₀),(a=μ∧l=k∨a=σ.toRingEquiv∧l=1)→(∀z,Valued.v (a z)=Valued.v z)∧∃s:E≃+*E,(∀z,s (g z)=g (a z))∧∀b c:Gal(E/C),(∀z,s (b z)=c (s z))→(κ c).toAdd=l*(κ b).toAdd)) := by
  let K:=ℚ⟮I⟯
  let Ω:=algebraicClosure K ℂ
  let T:=A 1
  obtain ⟨i,a,hi,hw,x,y,hZ,⟨τ,ht,span,hx⟩,r,h,hD,v,N,hN,al,t,st,abD,galN,abN,hv,degD,degN,iD,eiD,unit,⟨s,b,gs,hS⟩,⟨u,c,P,gu,hQ,Q,hQ'⟩,nonab⟩:=source
  let D:=A (r+1)
  letI alg:Algebra T D:=(inclusion h).toAlgebra
  letI modTD:Module T D:=@Algebra.toModule T D _ _ alg
  letI:NumberField D:=hD
  letI:NumberField N:=hN
  letI:Algebra K N:=al
  letI:IsScalarTower K K N:=t
  letI:IsScalarTower K D N:=st
  letI:SMul T D:=alg.toSMul
  letI:IsScalarTower K T D:=.of_algebraMap_eq' rfl
  letI:IsAbelianGalois K D:=abD
  letI:IsGalois K N:=galN
  letI:IsAbelianGalois D N:=abN
  letI:IsAbelianGalois T D:=IsAbelianGalois.tower_top K T D
  obtain ⟨wa,vw,unique⟩:=between a w v hw hv
  have hiSquare:i^2= -1:=K.val.injective (by change (i:ℂ)^2= -1;rw [hi,Complex.I_sq])
  have idSquare:iD^2= -1:=by
    apply Subtype.ext
    change (iD:D)^2= -1
    rw [eiD,←map_pow,hiSquare,map_neg,map_one]
  obtain ⟨hq₁,hq₂,_,sqQ⟩:=hQ'
  refine ⟨r,h,hD,v,N,hN,abN,degN,iD,idSquare,unit,⟨u,c,hq₁,hq₂,Q,gu,transport (Classical.decEq N) (inferInstance:DecidableEq N) _ _ _ _ sqQ⟩,?_⟩
  refine fun j hj=>?_
  obtain ⟨f,g,cg,eg,cf,ef,d,μ,σ,k,κ,ord,⟨kh,par⟩,vd,fix,res,com,zpow,surj,actions⟩:=
    scalars n p (r+1) q hn hp (by omega) (Nat.succ_ne_zero r) hq T D h N abD galN abN a w v j hw hv hj i hi x y s b u c P hZ hS hQ gs gu degD (nonab j hj)
  refine finish (K:=K) tangent norm w v j vw unique hj n p hn x y τ ht span hx ?_
  refine ⟨f,g,cg,eg,cf,ef,d,μ,σ,k,κ,ord,⟨kh,par.trans ?_⟩,vd,fix,res,com,zpow,surj,actions⟩
  split <;> rename_i e₁
  all_goals first | rfl | (split <;> rename_i e₂ <;> cases coincide e₁ e₂ <;> rfl)

set_option maxHeartbeats 3000000 in
theorem main : H1 → H2 → H3 → H4 → OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H2_R1_H1_R1.H1 := by
  intro tower scalars tangent norm
  refine fun n hn M h₁ h₂ hP p hp split good q hq hT w z hz he=>?_
  let K:=ℚ⟮I⟯
  let Ω:=algebraicClosure K ℂ
  let A(r:ℕ):=(let s:=M.ω₁/(q:ℂ)^r;(adjoin K {M.weierstrassP s,M.derivWeierstrassP s/2}).comap Ω.val)
  let T:=A 1
  letI:NumberField T:=hT
  obtain ⟨hK,choose⟩:=tower n hn M h₁ h₂ hP p hp split good q hq
  letI:NumberField K:=hK
  exact step scalars tangent norm hn hp split q hq A w (choose w z hz he)
end OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H2_R1_H1_R1_H1_R1
