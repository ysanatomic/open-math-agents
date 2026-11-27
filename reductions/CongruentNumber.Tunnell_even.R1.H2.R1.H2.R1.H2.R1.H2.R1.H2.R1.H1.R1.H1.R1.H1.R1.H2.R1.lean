import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1
import Mathlib

/-! A cyclic Kummer extension has a tame Galois character at a distinguished prime. Global good reduction accounts for primes away from the residue characteristic. The finite Artin map and Hilbert 90 descend the character to the first division field. -/
namespace OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H2_R1
open Set hiding inclusion
open MeasureTheory Complex NumberField IsDedekindDomain IntermediateField IsLocalRing WeierstrassCurve.Affine
open scoped Classical NumberField

set_option maxHeartbeats 3000000 in
def H1 : Prop :=
  ∀n:ℕ,0<n→∀M:PeriodPair,M.ω₁=((∫x in Ioi (n:ℝ),(Real.sqrt (x^3-(n:ℝ)^2*x))⁻¹):ℝ)→M.ω₂=I*M.ω₁→
(∃P:(⟨0,0,0,-(n:ℚ)^2,0⟩:WeierstrassCurve ℚ).toAffine.Point,¬IsOfFinAddOrder P)→
∃B:ℕ,∀p>B,p.Prime→p%4=1→¬p∣2*n→∀q:GaussianInt,q.norm.natAbs=p→
let K:=ℚ⟮I⟯;let Ω:=algebraicClosure K ℂ;let A(r:ℕ):=(let s:=M.ω₁/(q:ℂ)^r;(adjoin K {M.weierstrassP s,M.derivWeierstrassP s/2}).comap Ω.val);let T:=A 1
∀[NumberField T](w:HeightOneSpectrum (𝓞 T))(z:𝓞 T),z∈w.asIdeal→(((z:T):Ω):ℂ)=(q:ℂ)→
∃(r:ℕ)(h:T≤A (r+1)),let D:=A (r+1);letI:Algebra T D:=(inclusion h).toAlgebra
∃hD:NumberField D,letI:=hD
∃(v:HeightOneSpectrum (𝓞 D))(N:IntermediateField D Ω)(hN:NumberField N),letI:=hN
IsAbelianGalois D N∧(∀i≠v,(p:𝓞 D)∈i.asIdeal→∀j:HeightOneSpectrum (𝓞 N),j.asIdeal.LiesOver i.asIdeal→j.asIdeal.ramificationIdx (𝓞 D)=1)∧
let W:WeierstrassCurve D:=⟨0,0,0,-(n:D)^2,0⟩
(∃(x y:N)(h:(W.baseChange N).toAffine.Nonsingular x y)(P:(W.baseChange D).toAffine.Point),adjoin D {x,y}=⊤∧p^(r+1)•(.some x y h)=Point.baseChange (W':=W.toAffine) D N P)∧Module.finrank D N∣p^(r+1)∧
let C:=v.adicCompletion D;let L:=w.adicCompletion T;let O:=w.adicCompletionIntegers T
∀j:HeightOneSpectrum (𝓞 N),j.asIdeal.LiesOver v.asIdeal→
let E:=j.adicCompletion N;∃(f:L→+*C)(g:C→+*E),letI:=f.toAlgebra;letI:=g.toAlgebra
Continuous g∧(∀z:D,g (z:C)=(algebraMap D N z:E))∧(∀z:D,Algebra.norm L (z:C)=(Algebra.norm T z:L))∧
FiniteDimensional L C∧IsAbelianGalois L C∧FiniteDimensional C E∧IsAbelianGalois C E∧
let m:=maximalIdeal O;let k₀:=ZMod p
∃(τ:O)(δ:O≃+*O)(d:L≃+*L)(μ:C≃+*C)(σ:Gal(C/L))(k:ℕ)(κ:Gal(E/C)→*Multiplicative k₀),m=Ideal.span {τ}∧δ τ-k*τ∈m^2∧orderOf (k:k₀)=p-1∧
(∀z:O,d z=(δ z:O))∧(∀z,Valued.v (d z)=Valued.v z)∧(∀b:K,d (algebraMap K T b:L)=algebraMap K T b)∧(∀z,μ (f z)=f (d z))∧(∀(b:Gal(C/L))z,μ (b z)=b (μ z))∧
(∀t:Gal(C/L),t∈Subgroup.zpowers σ)∧Function.Surjective κ∧
∀(a:C≃+*C)(l:k₀),(a=μ∧l=k∨a=σ.toRingEquiv∧l=1)→(∀z,Valued.v (a z)=Valued.v z)∧∃s:E≃+*E,(∀z,s (g z)=g (a z))∧∀b c:Gal(E/C),(∀z,s (b z)=c (s z))→(κ c).toAdd=l*(κ b).toAdd

open Complex
set_option maxHeartbeats 1500000 in
def H2 : Prop :=
  ∀(Ω:Type)[Field Ω][CharZero Ω][IsAlgClosed Ω][Algebra.IsAlgebraic ℚ Ω](K:Type)[Field K][NumberField K][Algebra K Ω](n:ℕ),0<n→
∃B:ℕ,∀p>B,p.Prime→∀(r:ℕ)(D:IntermediateField K Ω)[NumberField D](N:IntermediateField D Ω)[NumberField N][IsGalois D N][dD:DecidableEq D][dN:DecidableEq N],
Module.finrank D N∣p^r→let W:WeierstrassCurve D:=⟨0,0,0,-(n:D)^2,0⟩
∀(x y:N)(h:(W.baseChange N).toAffine.Nonsingular x y)(P:(W.baseChange D).toAffine.Point),
adjoin D {x,y}=⊤→p^r•(Point.some x y h)=Point.baseChange (W':=W.toAffine) D N P→
∀(v:HeightOneSpectrum (𝓞 D))(j:HeightOneSpectrum (𝓞 N)),(p:𝓞 D)∉v.asIdeal→j.asIdeal.LiesOver v.asIdeal→j.asIdeal.ramificationIdx (𝓞 D)=1

open IsDedekindDomain NumberField
open scoped Classical NumberField
private theorem descend {A B k:Type*} [AddCommGroup A] [AddCommGroup B] [Field k]
    (N:A→+B) (s d:A→+A) (D:B→+B) (q:k) (hq:q≠1)
    (hN:∀ x,N (d x)=D (N x))
    (h90:∀ x,N x=0 → ∃ y,x=y-s y)
    (hrange:∀ x,∃ y,N y=D x-x)
    (α:A→+k) (ha:Function.Surjective α) (hs:∀ x,α (s x)=α x) (hd:∀ x,α (d x)=q*α x) :
    ∃ β:B→+k,Function.Surjective β ∧ (∀ x,β (N x)=α x) ∧ ∀ x,β (D x)=q*β x := by
  have same (x y:A) (h:N x=N y) : α x=α y := by
    have hh : N (x-y)=0 := by rw [map_sub,h,sub_self]
    obtain ⟨t,ht⟩ := h90 _ hh
    apply sub_eq_zero.mp
    rw [←map_sub,ht,map_sub,hs,sub_self]
  let l (x:B) := (hrange x).choose
  have hl (x:B) : N (l x)=D x-x := (hrange x).choose_spec
  have hn : q-1≠0 := sub_ne_zero.mpr hq
  let β:B→+k := {
    toFun x := α (l x)/(q-1)
    map_zero' := by
      have h : α (l 0)=α 0 := same _ _ (by simp [hl])
      rw [h,map_zero,zero_div]
    map_add' x y := by
      have h : α (l (x+y))=α (l x+l y) :=
        same _ _ (by rw [hl,map_add,map_add,hl,hl]; abel)
      rw [h,map_add,add_div] }
  have hb (x:A) : β (N x)=α x := by
    have h : α (l (N x))=α (d x-x) := same _ _ (by rw [hl,map_sub,hN])
    change α (l (N x))/(q-1)=α x
    rw [h,map_sub,hd,div_eq_iff hn]; ring
  refine ⟨β,fun x => ?_,hb,fun x => ?_⟩
  · obtain ⟨y,hy⟩ := ha x
    exact ⟨N y,(hb y).trans hy⟩
  · have h : α (l (D x))=α (d (l x)) := same _ _ (by rw [hl,hN,hl,map_sub])
    change α (l (D x))/(q-1)=q*(α (l x)/(q-1))
    rw [h,hd,mul_div_assoc]

lemma norm_hilbert90 {F L : Type} [Field F] [Field L] [Algebra F L] [FiniteDimensional F L]
    [IsGalois F L] [IsCyclic (L≃ₐ[F]L)] (σ : L≃ₐ[F]L) (hσ : ∀ g, g∈Subgroup.zpowers σ)
    (x : Lˣ) (hx : Units.map (Algebra.norm F : L→*F) x=1) :
    ∃ y : Lˣ, x=y / Units.map σ.toMonoidHom y := by
  have hnorm : Algebra.norm F (x:L) = 1 := congrArg Units.val hx
  obtain ⟨y,hy⟩ := groupCohomology.exists_div_of_norm_eq_one hσ hnorm
  refine ⟨y,Units.ext ?_⟩
  rw [Units.val_div_eq_div_val,Units.coe_map]
  change (x:L)=(y:L)/σ (y:L)
  exact hy.symm

private lemma integral_displacement {T:Type} [Field T] [NumberField T] (w:HeightOneSpectrum (𝓞 T))
    (d:w.adicCompletion T≃+*w.adicCompletion T) (hd:∀z,Valued.v (d z)=Valued.v z) (x:(w.adicCompletion T)ˣ) :
    ∃u:(w.adicCompletionIntegers T)ˣ,Units.map (algebraMap (w.adicCompletionIntegers T) (w.adicCompletion T)).toMonoidHom u=Units.map d.toMonoidHom x/x := by
  let u:=Units.map d.toMonoidHom x/x
  have hu:Valued.v (u:w.adicCompletion T)=1:=by
    dsimp only [u]
    rw [Units.val_div_eq_div_val,Units.coe_map]
    change Valued.v (d x/x)=1
    rw [map_div₀,hd,div_self (by simpa using x.ne_zero)]
  let a:w.adicCompletionIntegers T:=⟨u,hu.le⟩
  let b:w.adicCompletionIntegers T:=⟨↑u⁻¹,by change Valued.v (↑u⁻¹:w.adicCompletion T)≤1; rw [Units.val_inv_eq_inv_val,map_inv₀,hu,inv_one]⟩
  exact ⟨⟨a,b,Subtype.ext u.val_inv,Subtype.ext u.inv_val⟩,Units.ext rfl⟩

set_option maxHeartbeats 1500000 in
theorem obtain_character
    {T D N:Type} [Field T] [NumberField T] [Field D] [NumberField D] [Field N] [NumberField N]
    (w:HeightOneSpectrum (𝓞 T)) (v:HeightOneSpectrum (𝓞 D)) (j:HeightOneSpectrum (𝓞 N)) {p:ℕ} [Fact p.Prime]
    (f:w.adicCompletion T→+*v.adicCompletion D) (g:v.adicCompletion D→+*j.adicCompletion N) :
    let L:=w.adicCompletion T;let C:=v.adicCompletion D;let E:=j.adicCompletion N;let O:=w.adicCompletionIntegers T
    letI:=f.toAlgebra;letI:=g.toAlgebra
    ∀[FiniteDimensional L C][IsAbelianGalois L C][FiniteDimensional C E][IsAbelianGalois C E]
    (R:Lˣ→*Gal(C/L))(S:Cˣ→*Gal(E/C)),R.ker=(Units.map (Algebra.norm L (S:=C))).range →
    Function.Surjective S → S.ker=(Units.map (Algebra.norm C (S:=E))).range →
    ∀(δ:O≃+*O)(d:L≃+*L)(μ:C≃+*C)(σ:Gal(C/L))(k:ZMod p)(κ:Gal(E/C)→*Multiplicative (ZMod p)),k≠1 →
    (∀z:O,d z=(δ z:O)) → (∀z,Valued.v (d z)=Valued.v z) → (∀z,μ (f z)=f (d z)) →
    (∀(b:Gal(C/L))z,μ (b z)=b (μ z)) → (∀(x:Lˣ)z,μ (R x z)=R (Units.map d.toMonoidHom x) (μ z)) →
    (∀t:Gal(C/L),t∈Subgroup.zpowers σ) → Function.Surjective κ →
    (∀(a:C≃+*C)(l:ZMod p),(a=μ∧l=k∨a=σ.toRingEquiv∧l=1) →
       ∀x:Cˣ,(κ (S (Units.map a.toMonoidHom x))).toAdd=l*(κ (S x)).toAdd) →
    ∀(y:Eˣ)(x₀:Lˣ)(u u₀:Oˣ),d (x₀:L)=x₀ →
     ((u:O):L)=Algebra.norm L (Algebra.norm C (y:E)) → ((u₀:O):L)=x₀ →
     ∃χ:Additive Oˣ→+ZMod p,(∃x:Oˣ,χ x≠0)∧(∀x:Oˣ,χ (Units.map δ.toMonoidHom x)=k*χ x)∧χ (u/u₀)=0 := by
  intro L C E O _ _ _ _ R S hR onto hS δ d μ σ k κ hk hd hv hc comm equiv gen surj eigen y x₀ u u₀ h₀ hu hu₀
  letI:Algebra L C:=f.toAlgebra
  letI:Algebra C E:=g.toAlgebra
  let F:=Units.map (algebraMap O L).toMonoidHom
  let Nc:=Units.map (Algebra.norm L (S:=C))
  let Ne:=Units.map (Algebra.norm C (S:=E))
  let α:Additive Cˣ→+ZMod p:=(κ.comp S).toAdditive
  let Dd:=(Units.map d.toMonoidHom).toAdditive
  let Ds:=(Units.map σ.toMonoidHom).toAdditive
  let Dμ:=(Units.map μ.toMonoidHom).toAdditive
  haveI:IsCyclic Gal(C/L):=⟨σ,gen⟩
  have hn(x:Additive Cˣ):Nc.toAdditive (Dμ x)=Dd (Nc.toAdditive x):=by
    apply Units.ext
    change Algebra.norm L (μ (x.toMul:C))=d (Algebra.norm L (x.toMul:C))
    have eq:(algebraMap L C).comp d.toRingHom=μ.toRingHom.comp (algebraMap L C):=RingHom.ext (fun z=>(hc z).symm)
    symm
    rw [Algebra.norm_eq_of_equiv_equiv d μ eq]
    exact d.apply_symm_apply _
  have nr(x:Additive Lˣ):∃z,Nc.toAdditive z=Dd x-x:=by
    have e:R (Units.map d.toMonoidHom x.toMul)=R x.toMul:=by
      apply AlgEquiv.ext
      intro z
      obtain ⟨z,rfl⟩:=μ.surjective z
      exact (equiv x.toMul z).symm.trans (comm _ _)
    have h:Units.map d.toMonoidHom x.toMul/x.toMul∈R.ker:=by
      apply MonoidHom.mem_ker.mpr
      rw [map_div,e,div_self']
    rw [hR] at h
    exact h
  have ha:Function.Surjective α:=surj.comp onto
  obtain ⟨β,hβ,nβ,dβ⟩:=descend Nc.toAdditive Ds Dμ Dd k hk hn
    (fun x hx=>norm_hilbert90 σ gen x.toMul hx) nr α ha
    (fun x=>by
      change (κ (S (Units.map σ.toRingEquiv.toMonoidHom x.toMul))).toAdd=(κ (S x.toMul)).toAdd
      rw [eigen σ.toRingEquiv 1 (Or.inr ⟨rfl,rfl⟩),one_mul])
    (fun x=>eigen μ k (Or.inl ⟨rfl,rfl⟩) x.toMul)
  let χ:=β.comp F.toAdditive
  refine ⟨χ,?_,?_,?_⟩
  · obtain ⟨x,hx⟩:=hβ 1
    obtain ⟨t,ht⟩:=integral_displacement w d hv x.toMul
    refine ⟨t,?_⟩
    change β (Additive.ofMul (F t))≠0
    rw [show F t=Units.map d.toMonoidHom x.toMul/x.toMul from ht]
    change β (Dd x-x)≠0
    rw [map_sub,dβ,hx,mul_one]
    exact sub_ne_zero.mpr hk
  · intro z
    have e:F (Units.map δ.toMonoidHom z)=Units.map d.toMonoidHom (F z):=Units.ext (hd z.val).symm
    change β (Additive.ofMul (F (Units.map δ.toMonoidHom z)))=k*β (Additive.ofMul (F z))
    rw [e]
    exact dβ _
  · have hN:Ne y∈S.ker:=by rw [hS]; exact ⟨y,rfl⟩
    have hN':S (Ne y)=1:=hN
    have hU:β (Additive.ofMul (F u))=0:=by
      rw [show F u=Nc (Ne y) from Units.ext hu]
      change β (Nc.toAdditive (Additive.ofMul (Ne y)))=0
      rw [nβ]
      change (κ (S (Ne y))).toAdd=0
      rw [hN',map_one]
      rfl
    have hfix:Dd (Additive.ofMul (F u₀))=Additive.ofMul (F u₀):=by
      apply Units.ext
      change d ((u₀:O):L)=((u₀:O):L)
      rw [hu₀,h₀]
    have ee:=dβ (Additive.ofMul (F u₀))
    rw [hfix] at ee
    have hbase:β (Additive.ofMul (F u₀))=0:=(mul_eq_zero.mp (show (k-1)*β (Additive.ofMul (F u₀))=0 by linear_combination -ee)).resolve_left (sub_ne_zero.mpr hk)
    change χ (Additive.ofMul u-Additive.ofMul u₀)=0
    rw [map_sub]
    exact (congrArg₂ (·-·) hU hbase).trans (sub_zero 0)

set_option maxHeartbeats 1400000 in
theorem finish (law:OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1.H1)
    {K T D N:Type} [Field K] [Field T] [NumberField T] [Field D] [NumberField D] [Field N] [NumberField N]
    [Algebra K T] [Algebra T D] [Algebra D N] (w:HeightOneSpectrum (𝓞 T)) (v:HeightOneSpectrum (𝓞 D))
    {p:ℕ} (hp:p.Prime) (hsplit:p%4=1)
    (localData : (by exact (
    let L:=w.adicCompletion T;let C:=v.adicCompletion D;let O:=w.adicCompletionIntegers T
∀j:HeightOneSpectrum (𝓞 N),j.asIdeal.LiesOver v.asIdeal→
let E:=j.adicCompletion N;∃(f:L→+*C)(g:C→+*E),letI:=f.toAlgebra;letI:=g.toAlgebra
Continuous g∧(∀z:D,g (z:C)=(algebraMap D N z:E))∧(∀z:D,Algebra.norm L (z:C)=(Algebra.norm T z:L))∧
FiniteDimensional L C∧IsAbelianGalois L C∧FiniteDimensional C E∧IsAbelianGalois C E∧
let m:=maximalIdeal O;let k₀:=ZMod p
∃(τ:O)(δ:O≃+*O)(d:L≃+*L)(μ:C≃+*C)(σ:Gal(C/L))(k:ℕ)(κ:Gal(E/C)→*Multiplicative k₀),m=Ideal.span {τ}∧δ τ-k*τ∈m^2∧orderOf (k:k₀)=p-1∧
(∀z:O,d z=(δ z:O))∧(∀z,Valued.v (d z)=Valued.v z)∧(∀b:K,d (algebraMap K T b:L)=algebraMap K T b)∧(∀z,μ (f z)=f (d z))∧(∀(b:Gal(C/L))z,μ (b z)=b (μ z))∧
(∀t:Gal(C/L),t∈Subgroup.zpowers σ)∧Function.Surjective κ∧
∀(a:C≃+*C)(l:k₀),(a=μ∧l=k∨a=σ.toRingEquiv∧l=1)→(∀z,Valued.v (a z)=Valued.v z)∧∃s:E≃+*E,(∀z,s (g z)=g (a z))∧∀b c:Gal(E/C),(∀z,s (b z)=c (s z))→(κ c).toAdd=l*(κ b).toAdd))) : (by exact (
    let L:=w.adicCompletion T;let C:=v.adicCompletion D;let O:=w.adicCompletionIntegers T
  ∀(x:(𝓞 D)ˣ)(b:K)(u u₀:Oˣ),((u:O):L)=(Algebra.norm T x.val.val:L) → ((u₀:O):L)=((algebraMap K T b:T):L) →
  let V:=v.adicCompletion D
  (∃t:HeightOneSpectrum (𝓞 N),t.asIdeal.LiesOver v.asIdeal ∧ ∃f:V→+*t.adicCompletion N,Continuous f ∧
    (∀c:D,f (c:V)=((algebraMap D N c:N):t.adicCompletion N)) ∧ letI:Algebra V (t.adicCompletion N):=f.toAlgebra
    ∃y:t.adicCompletion N,Algebra.norm V y=(x.val.val:V)) →
  ∃(τ:O)(δ:O≃+*O)(k:ℕ)(χ:Additive Oˣ→+ZMod p),maximalIdeal O=Ideal.span {τ} ∧ δ τ-k*τ∈maximalIdeal O^2 ∧ orderOf (k:ZMod p)=p-1 ∧
   (∃v:Oˣ,χ v≠0) ∧ (∀v:Oˣ,χ (Units.map δ.toMonoidHom v)=(k:ZMod p)*χ v) ∧ χ (u/u₀)=0)) := by

  let L:=w.adicCompletion T
  let C:=v.adicCompletion D
  let O:=w.adicCompletionIntegers T
  dsimp only
  intro x b u u₀ hu hu₀

  rintro ⟨j,hj,g',cg',coe',y,hy⟩

  obtain ⟨f,g,cg,coe,norm,fd₁,ab₁,fd₂,ab₂,τ,δ,d,μ,σ,k,κ,span,tangent,ord,hd,hv,ground,restrict,comm,gen,onto,actions⟩:=localData j hj

  let E:=j.adicCompletion N

  have eq:g'=g:=by
    apply DFunLike.coe_injective
    apply (v.denseRange_algebraMap D).equalizer cg' cg
    exact funext fun c=>(coe' c).trans (coe c).symm

  subst g'

  letI:Algebra L C:=f.toAlgebra

  letI:Algebra C E:=g.toAlgebra

  letI:FiniteDimensional L C:=fd₁

  letI:IsAbelianGalois L C:=ab₁

  letI:FiniteDimensional C E:=fd₂

  letI:IsAbelianGalois C E:=ab₂

  letI:Fact p.Prime:=⟨hp⟩

  obtain ⟨R,_,hR,fr⟩:=law T w C

  obtain ⟨S,hS,ker,fs⟩:=law D v E

  have hne:(k:ZMod p)≠1:=by
    intro e
    rw [e,orderOf_one] at ord
    have :=hp.two_le
    omega

  have yn:y≠0:=by
    rintro rfl
    rw [Algebra.norm_zero] at hy
    have h:(x.val.val:D)≠0:=fun ha=>x.ne_zero (Subtype.ext ha)
    exact h ((algebraMap D C).injective (hy.symm.trans (map_zero _).symm))

  let u₀':=Units.map (algebraMap O L).toMonoidHom u₀

  have hfix:d (u₀':L)=u₀':=by
    change d ((u₀:O):L)=((u₀:O):L)
    rw [hu₀,ground]

  obtain ⟨χ,hnz,eig,kill⟩:=obtain_character w v j f g R S hR hS ker δ d μ σ k κ hne hd hv restrict comm (fr d μ hv restrict)
    gen onto (fun a l ha x=>by
      obtain ⟨val,s,restr,cov⟩:=actions a l ha
      exact cov _ _ (fs a s val restr x)) (Units.mk0 y yn) u₀' u u₀ hfix
    (show ((u:O):L)=Algebra.norm L (Algebra.norm C y) by rw [hy,norm]; exact hu) rfl

  exact ⟨τ,δ,k,χ,span,tangent,ord,hnz,eig,kill⟩


set_option maxHeartbeats 1300000 in
theorem step (law:OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1.H1) {K Ω:Type}[Field K][NumberField K][Field Ω][Algebra K Ω] (A:ℕ→IntermediateField K Ω)
    (decD:∀r:ℕ,DecidableEq (A r))(decN:∀(r:ℕ)(N:IntermediateField (A r) Ω),DecidableEq N)
    {n p J:ℕ}(hp:p.Prime)(hsplit:p%4=1)(hlarge:J<p)
    (hJ:∀p>J,p.Prime→∀(r:ℕ)(D:IntermediateField K Ω)[NumberField D](N:IntermediateField D Ω)[NumberField N][IsGalois D N][dD:DecidableEq D][dN:DecidableEq N],
      Module.finrank D N∣p^r→let W:WeierstrassCurve D:=⟨0,0,0,-(n:D)^2,0⟩
      ∀(x y:N)(h:(W.baseChange N).toAffine.Nonsingular x y)(P:(W.baseChange D).toAffine.Point),
      adjoin D {x,y}=⊤→p^r•(Point.some x y h)=Point.baseChange (W':=W.toAffine) D N P→
      ∀(v:HeightOneSpectrum (𝓞 D))(j:HeightOneSpectrum (𝓞 N)),(p:𝓞 D)∉v.asIdeal→j.asIdeal.LiesOver v.asIdeal→j.asIdeal.ramificationIdx (𝓞 D)=1) [hT:NumberField (A 1)] (w:HeightOneSpectrum (𝓞 (A 1))) (geometry : (by exact (let T:=A 1
∃(r:ℕ)(h:T≤A (r+1)),let D:=A (r+1);letI:Algebra T D:=(inclusion h).toAlgebra
∃hD:NumberField D,letI:=hD
∃(v:HeightOneSpectrum (𝓞 D))(N:IntermediateField D Ω)(hN:NumberField N),letI:=hN
IsAbelianGalois D N∧(∀i≠v,(p:𝓞 D)∈i.asIdeal→∀j:HeightOneSpectrum (𝓞 N),j.asIdeal.LiesOver i.asIdeal→j.asIdeal.ramificationIdx (𝓞 D)=1)∧
letI:=decD (r+1);letI:=decN (r+1) N
let W:WeierstrassCurve D:=⟨0,0,0,-(n:D)^2,0⟩
(∃(x y:N)(h:(W.baseChange N).toAffine.Nonsingular x y)(P:(W.baseChange D).toAffine.Point),adjoin D {x,y}=⊤∧p^(r+1)•(.some x y h)=Point.baseChange (W':=W.toAffine) D N P)∧Module.finrank D N∣p^(r+1)∧
let C:=v.adicCompletion D;let L:=w.adicCompletion T;let O:=w.adicCompletionIntegers T
∀j:HeightOneSpectrum (𝓞 N),j.asIdeal.LiesOver v.asIdeal→
let E:=j.adicCompletion N;∃(f:L→+*C)(g:C→+*E),letI:=f.toAlgebra;letI:=g.toAlgebra
Continuous g∧(∀z:D,g (z:C)=(algebraMap D N z:E))∧(∀z:D,Algebra.norm L (z:C)=(Algebra.norm T z:L))∧
FiniteDimensional L C∧IsAbelianGalois L C∧FiniteDimensional C E∧IsAbelianGalois C E∧
let m:=maximalIdeal O;let k₀:=ZMod p
∃(τ:O)(δ:O≃+*O)(d:L≃+*L)(μ:C≃+*C)(σ:Gal(C/L))(k:ℕ)(κ:Gal(E/C)→*Multiplicative k₀),m=Ideal.span {τ}∧δ τ-k*τ∈m^2∧orderOf (k:k₀)=p-1∧
(∀z:O,d z=(δ z:O))∧(∀z,Valued.v (d z)=Valued.v z)∧(∀b:K,d (algebraMap K T b:L)=algebraMap K T b)∧(∀z,μ (f z)=f (d z))∧(∀(b:Gal(C/L))z,μ (b z)=b (μ z))∧
(∀t:Gal(C/L),t∈Subgroup.zpowers σ)∧Function.Surjective κ∧
∀(a:C≃+*C)(l:k₀),(a=μ∧l=k∨a=σ.toRingEquiv∧l=1)→(∀z,Valued.v (a z)=Valued.v z)∧∃s:E≃+*E,(∀z,s (g z)=g (a z))∧∀b c:Gal(E/C),(∀z,s (b z)=c (s z))→(κ c).toAdd=l*(κ b).toAdd))) : (by exact (let T:=A 1;let O:=w.adicCompletionIntegers T;let L:=w.adicCompletion T
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
   (∃v:Oˣ,χ v≠0) ∧ (∀v:Oˣ,χ (Units.map δ.toMonoidHom v)=(k:ZMod p)*χ v) ∧ χ (u/u₀)=0)) := by
  let T:=A 1
  let O:=w.adicCompletionIntegers T
  let L:=w.adicCompletion T
  rcases geometry with ⟨r,h,hD,v,N,hN,ab,unram,⟨x,y,xy,P,hgen,hmul⟩,deg,localData⟩
  let D:=A (r+1)
  letI:Algebra T D:=(inclusion h).toAlgebra
  letI:NumberField D:=hD
  letI:NumberField N:=hN
  letI:IsAbelianGalois D N:=ab
  letI:DecidableEq D:=decD (r+1)
  letI:DecidableEq N:=decN (r+1) N

  refine ⟨r,h,hD,v,N,hN,ab,?_,?_⟩
  · intro i hi j hj
    by_cases mem:(p:𝓞 D)∈i.asIdeal
    · exact unram i hi mem j hj
    · exact hJ p hlarge hp (r+1) D N deg x y xy P hgen hmul i j mem hj
  · exact finish (K:=K) (N:=N) law w v hp hsplit localData


set_option maxHeartbeats 4900000 in
theorem main : H1 → H2 → OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1.H2 := by
  intro geom away law n hn M h₁ h₂ nontorsion
  let K:=ℚ⟮I⟯
  let Ω:=algebraicClosure K ℂ
  have hI:IsIntegral ℚ I:=⟨Polynomial.X^2-Polynomial.C (-1),Polynomial.monic_X_pow_sub_C _ (by decide),by simp⟩
  letI:FiniteDimensional ℚ K:=IntermediateField.adjoin.finiteDimensional hI
  letI:NumberField K:=⟨⟩
  letI:IsAlgClosure K Ω:=algebraicClosure.isAlgClosure K ℂ
  letI:IsAlgClosed Ω:=IsAlgClosure.isAlgClosed K
  letI:Algebra.IsAlgebraic ℚ Ω:=Algebra.IsAlgebraic.trans ℚ K Ω
  obtain ⟨B,hB⟩:=geom n hn M h₁ h₂ nontorsion
  obtain ⟨J,hJ⟩:=away Ω K n hn
  refine ⟨max B J,?_⟩
  intro p hlarge hp hsplit hgood q hq
  intro K' Ω' A T hT
  letI:NumberField T:=hT
  intro w z hz hez
  exact step (K:=K) (Ω:=Ω) (n:=n) law A (fun r=>inferInstance) (fun r N=>inferInstance) hp hsplit ((le_max_right _ _).trans_lt hlarge) hJ w
    (@hB p ((le_max_left _ _).trans_lt hlarge) hp hsplit hgood q hq hT w z hz hez)

end OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H2_R1
