import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1
import Mathlib

/-!
The primitive Gaussian division fields have the cyclotomic degrees. At the first level the local parameter of a primitive affine point generates the maximal ideal. The rational derivative selects large split primes where evaluation at such a point gives a unit with a nonzero first-order difference and a global norm from every higher level.
-/
namespace OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1
open Complex NumberField IsDedekindDomain IntermediateField IsLocalRing Set MeasureTheory
open scoped Classical NumberField

def H1 : Prop :=
  ∀ (n:ℕ),0<n → let ω:ℝ:=∫ x in Ioi (n:ℝ),(Real.sqrt (x^3-(n:ℝ)^2*x))⁻¹
  ∀ M:PeriodPair,M.ω₁=ω → M.ω₂=I*ω → ∀ p:ℕ,p.Prime → 3<p → p%4=1 → ¬p∣2*n → ∀ q:GaussianInt,q.norm.natAbs=p →
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

def H2 : Prop :=
  ∀ (n:ℕ) (hn:0<n),
  letI:NeZero (4*n):=⟨by omega⟩
  let ω:ℝ:=∫ x in Ioi (n:ℝ),(Real.sqrt (x^3-(n:ℝ)^2*x))⁻¹
  ∀ M:PeriodPair,M.ω₁=ω → M.ω₂=I*ω →
  let a:=1+3*(4*n)
  let b (v:ZMod (4*n)×ZMod (4*n)):GaussianInt:=⟨v.1.val,v.2.val⟩
  let χ (v:ZMod (4*n)×ZMod (4*n)):ℤ:=let m:=(b v).norm.natAbs
    if (⟨2,2⟩:GaussianInt)∣b v-1 then (if Odd m then jacobiSym n m else 0) else 0
  let t (j:Fin a×Fin a):ℂ:=(j.1.val*M.ω₁+j.2.val*M.ω₂)/a
  let D z:=∏ j ∈ Finset.univ.filter (fun j=>t j∉M.lattice),(M.weierstrassP z-M.weierstrassP (t j))
  let G z:=∏ v ∈ Finset.univ.filter (fun v=>χ v≠0),D (z+((ω/(4*n):ℝ):ℂ)*(b v:ℂ))^χ v
  n%8=2 → 2<n → (∀ (m:ℕ) (z:ℂ),0 < m → (4*n).Coprime (a*m) → (m:ℂ)*z∈M.lattice →
    ∃ u:(𝓞 (algebraicClosure ℚ ℂ))ˣ,(u.val.val.val:ℂ)=G z) → ∀ c:ℚ,c≠0 → logDeriv G 0=c → ∀ B:ℕ,
  ∃ p:ℕ,p.Prime ∧ B<p ∧ 3<p ∧ p%4=1 ∧ ¬p∣2*n ∧ ∃ q:GaussianInt,q.norm.natAbs=p ∧
  let K:=ℚ⟮I⟯
  let Ω:=algebraicClosure K ℂ
  let A (r:ℕ):=let t:=M.ω₁/(q:ℂ)^r
    (adjoin K {M.weierstrassP t,M.derivWeierstrassP t/2}).comap Ω.val
  let T:=A 1
  (∀ r:ℕ,@Module.finrank K (A (r+1)) _ _ (IntermediateField.module' (A (r+1)))=(p^(r+1)).totient) → ∀ hT:NumberField T,letI:=hT; ∀ (w:HeightOneSpectrum (𝓞 T)) (k:𝓞 T),k∈w.asIdeal → (((k:T):Ω):ℂ)=q →
  let O:=w.adicCompletionIntegers T
  let L:=w.adicCompletion T
  (let t:=M.ω₁/(q:ℂ)
  ∃ (x y:T) (f:T→ₐ[K]ℂ) (s h:O),f x=M.weierstrassP t ∧ f y=M.derivWeierstrassP t/2 ∧
    h-1∈maximalIdeal O ∧ maximalIdeal O=Ideal.span {s} ∧
    algebraMap T L x=1/((s:L)^2*h) ∧ algebraMap T L y= -1/((s:L)^3*h)) →
  ∃ (u:(𝓞 T)ˣ) (b:K) (v c:Oˣ),((v:O):L)=algebraMap T L u.val.val ∧
    ((c:O):L)=algebraMap T L (algebraMap K T b) ∧ maximalIdeal O=Ideal.span {(v:O)-(c:O)} ∧
    ∀ r:ℕ,∃ h:T≤A (r+1),letI:Algebra T (A (r+1)):=(IntermediateField.inclusion h).toAlgebra
      ∃ x:(𝓞 (A (r+1)))ˣ,Algebra.norm T x.val.val=u.val.val

theorem main : H1 → H2 → OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1.H2 := by
  intro geometry evaluate
  refine fun n hn M h₁ h₂ hmod hlarge integral c hc hc' B => ?_
  obtain ⟨p,hp,hB,h₃,h₄,good,q,hq,ev⟩ :=
    evaluate n hn M h₁ h₂ hmod hlarge (fun m z hm hcop h => integral m hm hcop z h) c hc hc' B
  obtain ⟨deg,hT,w,k,hk,eq,parameter⟩ := geometry n hn M h₁ h₂ p hp h₃ h₄ good q hq
  obtain ⟨u,b,v,d,hv,hd,htop,norms⟩:=ev deg hT w k hk eq parameter
  exact ⟨p,hp,hB,h₃,h₄,good,q,hq,hT,w,k,hk,eq,u,b,⟨v,d,hv,hd,htop⟩,norms⟩

end OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1
