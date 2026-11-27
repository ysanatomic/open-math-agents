import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H2_R1
import Mathlib

/-! A sufficiently large set of primes represents all idèle classes. The norm and augmentation indices of its supported idèles are products of the local indices. -/
namespace OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H2_R1_H3_R1
open NumberField IsDedekindDomain
open scoped NumberField TensorProduct Classical
noncomputable section

def H1 : Prop :=
  ∀(D N:Type)[Field D][NumberField D][Field N][NumberField N][Algebra D N]
   [FiniteDimensional D N][IsGalois D N](g:Gal(N/D)),(∀s,s∈Subgroup.zpowers g) →
   let G:=Gal(N/D)
   let V:=HeightOneSpectrum (𝓞 D)
   let W:=HeightOneSpectrum (𝓞 N)
   let A:=AdeleRing (𝓞 D) D
   let T:=A⊗[D]N
   let o(v:V)(x:T):=∀(w:W),w.asIdeal.LiesOver v.asIdeal →
    ∀(m:v.adicCompletion D→+*w.adicCompletion N)(f:T→+*w.adicCompletion N),Continuous m →
    (∀d:D,m (algebraMap D _ d)=algebraMap N _ (algebraMap D N d)) →
    (∀a:A,∀b:N,f (a ⊗ₜ[D] b)=m (a.2 v)*algebraMap N _ b) → f x∈w.adicCompletionIntegers N
   let p(s:G):=HeightOneSpectrum.equivOfRingEquiv (RingOfIntegers.mapAlgEquiv s).toRingEquiv
   let l:=Units.map (Algebra.TensorProduct.includeRight (R:=D) (A:=A) (B:=N)).toMonoidHom
   ∃(R:Finset V)(S:Finset W)(J:Subgroup Tˣ),(∀w:W,w∈S ↔ ∃v∈R,w.asIdeal.LiesOver v.asIdeal) ∧
   (∀v:V,v∉R → ∀w:W,w.asIdeal.LiesOver v.asIdeal → w.asIdeal.ramificationIdx (𝓞 D)=1) ∧
   (∀x:Tˣ,x∈J ↔ ∀v:V,v∉R → o v x.val ∧ o v x.inv) ∧
   J⊔l.range=⊤ ∧ Function.Injective l ∧ J.comap l=(S:Set W).unit N ∧ (∀s w,w∈S ↔ p s w∈S) ∧
   let U:=(S:Set W).unit N
   ∃ u:MulDistribMulAction G U,letI:=u; ∀s:G,∀x:U,((s•x).val:N)=s (x.val:N)

def H2 : Prop :=
  ∀(D N:Type)[Field D][NumberField D][Field N][NumberField N][Algebra D N]
   [FiniteDimensional D N][IsGalois D N](g:Gal(N/D)),(∀s,s∈Subgroup.zpowers g) →
   let G:=Gal(N/D)
   let V:=HeightOneSpectrum (𝓞 D)
   let W:=HeightOneSpectrum (𝓞 N)
   let A:=AdeleRing (𝓞 D) D
   let T:=A⊗[D]N
   let o(v:V)(x:T):=∀(w:W),w.asIdeal.LiesOver v.asIdeal →
    ∀(m:v.adicCompletion D→+*w.adicCompletion N)(f:T→+*w.adicCompletion N),Continuous m →
    (∀d:D,m (algebraMap D _ d)=algebraMap N _ (algebraMap D N d)) →
    (∀a:A,∀b:N,f (a ⊗ₜ[D] b)=m (a.2 v)*algebraMap N _ b) → f x∈w.adicCompletionIntegers N
   let p(s:G):=HeightOneSpectrum.equivOfRingEquiv (RingOfIntegers.mapAlgEquiv s).toRingEquiv
   let a(s:G):=Units.mapEquiv (Algebra.TensorProduct.congr (AlgEquiv.refl (R:=A) (A₁:=A)) s).toMulEquiv
   ∀(R:Finset V)(S:Finset W)(J:Subgroup Tˣ),(∀w:W,w∈S ↔ ∃v∈R,w.asIdeal.LiesOver v.asIdeal) →
   (∀v:V,v∉R → ∀w:W,w.asIdeal.LiesOver v.asIdeal → w.asIdeal.ramificationIdx (𝓞 D)=1) →
   (∀x:Tˣ,x∈J ↔ ∀v:V,v∉R → o v x.val ∧ o v x.inv) →
   let X:=InfinitePlace N ⊕ ↥S
   ∃ z:MulAction G X, letI:=z; letI:Fintype (MulAction.orbitRel.Quotient G X):=Fintype.ofFinite _
   (∀s:G,∀w:InfinitePlace N,s•(Sum.inl w:X)=Sum.inl (s•w)) ∧
   (∀s:G,∀w:↥S,Sum.map id Subtype.val (s•(Sum.inr w:X))=Sum.inr (p s w.val)) ∧
   ∃ β:MulDistribMulAction G J,letI:=β; (∀s:G,∀x:J,(s•x).val=a s x.val) ∧
   let b(s:G):J→*J:=MulDistribMulAction.toMonoidEnd G J s
   let n:J→*J:=∏s:G,b s
   let d:=b g / MonoidHom.id J
   let h:=n.range.relIndex d.ker
   let k:=d.range.relIndex n.ker
   0<h ∧ 0<k ∧ h=k*∏t:MulAction.orbitRel.Quotient G X,Nat.card (MulAction.stabilizer G t.out)

set_option maxHeartbeats 2400000 in
theorem main : H1 → H2 → OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H2_R1.H3 := by
  intro support factors D N _ _ _ _ _ _ _ g gen
  dsimp only
  intro c compat
  let G:=Gal(N/D)
  let A:=AdeleRing (𝓞 D) D
  let T:=A⊗[D]N
  let l:=Units.map (Algebra.TensorProduct.includeRight (R:=D) (A:=A) (B:=N)).toMonoidHom
  let C:=Tˣ⧸l.range
  let q:=QuotientGroup.mk' l.range
  let a(s:G):=Units.mapEquiv (Algebra.TensorProduct.congr (AlgEquiv.refl (R:=A) (A₁:=A)) s).toMulEquiv
  letI : MulDistribMulAction G C:=c
  obtain ⟨R,S,J,above,ram,integral,hJ,hl,principal,stable,u,ua⟩ := support D N g gen
  obtain ⟨z,zinf,zfin,β,βa,h,k,e⟩:= factors D N g gen R S J above ram integral
  let U:=(S:Set (HeightOneSpectrum (𝓞 N))).unit N
  letI : MulDistribMulAction G U:=u
  letI : MulDistribMulAction G J:=β
  let i:U→*J := (l.comp U.subtype).codRestrict J (fun x => by
    change x.val ∈ J.comap l
    rw [principal]
    exact x.property)
  let j:J→*C:=q.comp J.subtype
  refine ⟨S,stable,u,ua,z,zinf,zfin,J,inferInstance,β,i,j,?_,?_,?_,?_,?_,h,k,e⟩
  · intro s x
    apply Subtype.ext
    change l (s • x).val = (s • i x).val
    rw [βa]
    apply Units.ext
    change (1:A) ⊗ₜ[D] ((s•x).val:N) = (Algebra.TensorProduct.congr (AlgEquiv.refl (R:=A) (A₁:=A)) s) ((1:A) ⊗ₜ[D] (x.val:N))
    rw [ua]
    rfl
  · intro s y
    change q (s•y).val=s • q y.val
    rw [βa,compat]
  · intro x y e
    exact Subtype.ext (hl (congrArg Subtype.val e))
  · intro x
    obtain ⟨y,rfl⟩:=QuotientGroup.mk'_surjective l.range x
    have hy : y∈J⊔l.range:=by rw [hJ]; trivial
    obtain ⟨t,ht,b,hb,rfl⟩:=Subgroup.mem_sup.mp hy
    refine ⟨⟨t,ht⟩,?_⟩
    change q t=q (t*b)
    have hq:q b=1:= (QuotientGroup.eq_one_iff b).2 hb
    rw [map_mul,hq]
    exact (mul_one (q t)).symm
  · ext x
    constructor
    · rintro ⟨y,rfl⟩
      exact (QuotientGroup.eq_one_iff _).mpr ⟨y.val,rfl⟩
    · intro hx
      change q x.val=1 at hx
      have hx' : x.val∈l.range := (QuotientGroup.eq_one_iff x.val).mp hx
      obtain ⟨y,hy⟩:=hx'
      have hyU:y∈U:=by
        change y∈(S:Set (HeightOneSpectrum (𝓞 N))).unit N
        rw [←principal]
        exact (show l y∈J from hy.symm ▸ x.property)
      exact ⟨⟨y,hyU⟩,Subtype.ext hy⟩

end
end OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H2_R1_H3_R1
