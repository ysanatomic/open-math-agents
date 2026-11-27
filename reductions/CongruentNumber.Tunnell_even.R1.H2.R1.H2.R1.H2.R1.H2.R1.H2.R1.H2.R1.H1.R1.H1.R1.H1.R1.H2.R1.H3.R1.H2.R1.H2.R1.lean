import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H2_R1_H3_R1_H2_R1
import Mathlib

/-! The cyclic norm index of a nonarchimedean local field and the real or complex norm at an infinite place supply the stabilizer factors. -/
namespace OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H2_R1_H3_R1_H2_R1_H2_R1
open NumberField IsDedekindDomain
open scoped NumberField TensorProduct Classical
noncomputable section

def H1 : Prop :=
  ∀(F:Type)[Field F][ValuativeRel F][TopologicalSpace F][IsNonarchimedeanLocalField F]
   (Y:Type)[Field Y][Algebra F Y][FiniteDimensional F Y][IsGalois F Y][IsCyclic Gal(Y/F)],
   (Units.map (Algebra.norm F (S:=Y))).range.index=Module.finrank F Y

def H2 : Prop :=
  (∀(F:Type)[Field F][ValuativeRel F][TopologicalSpace F][IsNonarchimedeanLocalField F]
   (Y:Type)[Field Y][Algebra F Y][FiniteDimensional F Y][IsGalois F Y][IsCyclic Gal(Y/F)],
   (Units.map (Algebra.norm F (S:=Y))).range.index=Module.finrank F Y) →
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
theorem main : H1 → H2 → OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H2_R1_H3_R1_H2_R1.H2 := by
  intro localDegree places
  exact places localDegree

end
end OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H2_R1_H3_R1_H2_R1_H2_R1
