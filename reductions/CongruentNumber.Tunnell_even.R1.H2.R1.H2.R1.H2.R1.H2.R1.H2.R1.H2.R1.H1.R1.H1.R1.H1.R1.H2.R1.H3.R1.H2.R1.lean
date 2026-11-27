import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H2_R1_H3_R1
import Mathlib

/-! The norm quotient of the restricted local product is the product of its unrestricted norm indices. Each such local index is its place stabilizer order. -/
namespace OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H2_R1_H3_R1_H2_R1
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
   let a(s:G):=Units.mapEquiv (Algebra.TensorProduct.congr (AlgEquiv.refl (R:=A) (A₁:=A)) s).toMulEquiv
   let d(F:Type)[Field F][Algebra D F]:=(Units.map (Algebra.norm F (S:=F⊗[D]N))).range.index
   ∀(R:Finset V)(J:Subgroup Tˣ),(∀v:V,v∉R → ∀w:W,w.asIdeal.LiesOver v.asIdeal → w.asIdeal.ramificationIdx (𝓞 D)=1) →
   (∀x:Tˣ,x∈J ↔ ∀v:V,v∉R → o v x.val ∧ o v x.inv) →
   ∃ β:MulDistribMulAction G J,letI:=β; (∀s:G,∀x:J,(s•x).val=a s x.val) ∧
   let b(s:G):J→*J:=MulDistribMulAction.toMonoidEnd G J s
   let n:J→*J:=∏s:G,b s
   let t:=b g / MonoidHom.id J
   t.range.relIndex n.ker=1 ∧ n.range.relIndex t.ker=(∏w:InfinitePlace D,d w.Completion)*∏v:↥R,d (v.val.adicCompletion D)

def H2 : Prop :=
  ∀(D N:Type)[Field D][NumberField D][Field N][NumberField N][Algebra D N]
   [FiniteDimensional D N][IsGalois D N](g:Gal(N/D)),(∀s,s∈Subgroup.zpowers g) →
   let G:=Gal(N/D)
   let V:=HeightOneSpectrum (𝓞 D)
   let W:=HeightOneSpectrum (𝓞 N)
   let p(s:G):=HeightOneSpectrum.equivOfRingEquiv (RingOfIntegers.mapAlgEquiv s).toRingEquiv
   let d(F:Type)[Field F][Algebra D F]:=(Units.map (Algebra.norm F (S:=F⊗[D]N))).range.index
   ∀(R:Finset V)(S:Finset W),(∀w:W,w∈S ↔ ∃v∈R,w.asIdeal.LiesOver v.asIdeal) →
   let X:=InfinitePlace N ⊕ ↥S
   ∃ z:MulAction G X, letI:=z; letI:Fintype (MulAction.orbitRel.Quotient G X):=Fintype.ofFinite _
   (∀s:G,∀w:InfinitePlace N,s•(Sum.inl w:X)=Sum.inl (s•w)) ∧
   (∀s:G,∀w:↥S,Sum.map id Subtype.val (s•(Sum.inr w:X))=Sum.inr (p s w.val)) ∧
   (∏w:InfinitePlace D,d w.Completion)*∏v:↥R,d (v.val.adicCompletion D)=∏t:MulAction.orbitRel.Quotient G X,Nat.card (MulAction.stabilizer G t.out)

set_option maxHeartbeats 2400000 in
theorem main : H1 → H2 → OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H2_R1_H3_R1.H2 := by
  intro supported places D N _ _ _ _ _ _ _ g gen
  dsimp only
  intro R S J above ram actual
  obtain ⟨j,ha,hb,hp⟩:=places D N g gen R S above
  obtain ⟨β,he,hm,hz⟩:=supported D N g gen R J ram actual
  refine ⟨j,ha,hb,β,he,?_,?_,?_⟩
  · rw [hz,hp]
    apply Finset.prod_pos
    intro t _
    exact Nat.card_pos
  · rw [hm]
    decide
  · rw [hm,one_mul]
    exact hz.trans hp

end
end OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H2_R1_H3_R1_H2_R1
