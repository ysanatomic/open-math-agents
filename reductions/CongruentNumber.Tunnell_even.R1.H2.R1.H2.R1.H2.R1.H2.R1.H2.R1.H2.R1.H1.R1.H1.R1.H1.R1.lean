import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1
import Mathlib

/-! The S-unit logarithmic lattice gives the quotient of its fixed-unit index by its norm-one index. The supported-idèle exact sequence and the finite and infinite local factors then compute the norm index for the cyclic idèle classes. -/
namespace OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1
open NumberField IsDedekindDomain
open scoped NumberField TensorProduct Classical
noncomputable section

def H1 : Prop :=
  ∀ (K L:Type) [Field K] [NumberField K] [Field L] [NumberField L] [Algebra K L] [FiniteDimensional K L] [IsGalois K L],
  let G:=Gal(L/K)
  ∀ (S:Finset (HeightOneSpectrum (𝓞 L))) (σ:G), (∀ g:G,g∈Subgroup.zpowers σ) →
  let p (g:G):=HeightOneSpectrum.equivOfRingEquiv (NumberField.RingOfIntegers.mapAlgEquiv g).toRingEquiv
  (∀ g w,w∈S ↔ p g w∈S) →
  let U:=(S:Set (HeightOneSpectrum (𝓞 L))).unit L
  let P:=InfinitePlace L ⊕ ↥S
  ∃ (j:MulAction G P),letI:=j; letI:Fintype (MulAction.orbitRel.Quotient G P):=Fintype.ofFinite _
    (∀ g:G,∀ i:InfinitePlace L,g • (Sum.inl i:P)=Sum.inl (g • i)) ∧
    (∀ g:G,∀ s:↥S,Sum.map id Subtype.val (g • (Sum.inr s:P))=Sum.inr (p g s.val)) ∧
    ∃ n b:U→*U,(∀ x:U,((n x).val:L)=∏ g:G,g (x.val:L)) ∧ (∀ x:U,((b x).val:L)=σ (x.val:L)/(x.val:L)) ∧
    let h:=n.range.relIndex b.ker
    let k:=b.range.relIndex n.ker
    0<h ∧ 0<k ∧ h*Nat.card G=k*∏ i:MulAction.orbitRel.Quotient G P,Nat.card (MulAction.stabilizer G i.out)

def H2 : Prop :=
  ∀(D N:Type)[Field D][NumberField D][Field N][NumberField N][Algebra D N]
   [FiniteDimensional D N][IsGalois D N](g:Gal(N/D)),(∀ s,s∈Subgroup.zpowers g) →
  (let G:=Gal(N/D)
  ∀ (S:Finset (HeightOneSpectrum (𝓞 N))) (σ:G), (∀ g:G,g∈Subgroup.zpowers σ) →
  let p (g:G):=HeightOneSpectrum.equivOfRingEquiv (NumberField.RingOfIntegers.mapAlgEquiv g).toRingEquiv
  (∀ g w,w∈S ↔ p g w∈S) →
  let U:=(S:Set (HeightOneSpectrum (𝓞 N))).unit N
  let P:=InfinitePlace N ⊕ ↥S
  ∃ (j:MulAction G P),letI:=j; letI:Fintype (MulAction.orbitRel.Quotient G P):=Fintype.ofFinite _
    (∀ g:G,∀ i:InfinitePlace N,g • (Sum.inl i:P)=Sum.inl (g • i)) ∧
    (∀ g:G,∀ s:↥S,Sum.map id Subtype.val (g • (Sum.inr s:P))=Sum.inr (p g s.val)) ∧
    ∃ n b:U→*U,(∀ x:U,((n x).val:N)=∏ g:G,g (x.val:N)) ∧ (∀ x:U,((b x).val:N)=σ (x.val:N)/(x.val:N)) ∧
    let h:=n.range.relIndex b.ker
    let k:=b.range.relIndex n.ker
    0<h ∧ 0<k ∧ h*Nat.card G=k*∏ i:MulAction.orbitRel.Quotient G P,Nat.card (MulAction.stabilizer G i.out)) →
   let A:=AdeleRing (𝓞 D) D
   let T:=A⊗[D]N
   let P:=(Units.map (algebraMap D A).toMonoidHom).range ⊔ (Units.map (Algebra.norm A (S:=T))).range
   let q:=QuotientGroup.mk' (Units.map (Algebra.TensorProduct.includeRight (R:=D) (A:=A) (B:=N)).toMonoidHom).range
   let a(s:Gal(N/D)):=Units.mapEquiv (Algebra.TensorProduct.congr (AlgEquiv.refl (R:=A) (A₁:=A)) s).toMulEquiv
   let n:=q.comp (∏ s:Gal(N/D),(a s).toMonoidHom)
   let b:=q.comp ((a g).toMonoidHom / MonoidHom.id Tˣ)
   let k:=b.range.relIndex (n.ker.map q)
   0<k ∧ P.index=Module.finrank D N*k

theorem main : H1 → H2 → OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1.H1 := by
  intro units supported D N _ _ _ _ _ _ _ g gen
  exact supported D N g gen (units D N)

end
end OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1
