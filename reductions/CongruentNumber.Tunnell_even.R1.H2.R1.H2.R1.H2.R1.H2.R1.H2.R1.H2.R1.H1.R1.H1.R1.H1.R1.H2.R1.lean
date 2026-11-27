import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1
import Mathlib

/-! The fixed idèle classes give the determinant norm index. The short exact sequence of S-units, supported idèles and idèle classes multiplies Herbrand quotients. -/
namespace OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H2_R1
open NumberField IsDedekindDomain
open scoped NumberField TensorProduct Classical
noncomputable section

def H1 : Prop :=
  ∀ (G U J C:Type)[Group G][Fintype G][CommGroup U][CommGroup J][CommGroup C]
    [MulDistribMulAction G U][MulDistribMulAction G J][MulDistribMulAction G C]
    (g:G), (∀ s,s∈Subgroup.zpowers g) → ∀ (i:U→*J)(j:J→*C),
    (∀ s:G,∀ x:U,i (s•x)=s•i x) → (∀ s:G,∀ x:J,j (s•x)=s•j x) →
    Function.Injective i → Function.Surjective j → i.range=j.ker →
    let idx(M:Type)[CommGroup M][MulDistribMulAction G M]:=
    let a(s:G):M→*M:=MulDistribMulAction.toMonoidEnd G M s
    let n:M→*M:=∏ s:G,a s
    let b:=a g / MonoidHom.id M
    (n.range.relIndex b.ker,b.range.relIndex n.ker)
    let u:=idx U
    let v:=idx J
    let w:=idx C
    0<u.1 → 0<u.2 → 0<v.1 → 0<v.2 → 0<w.1 ∧ 0<w.2 ∧ v.1*u.2*w.2=v.2*u.1*w.1

def H2 : Prop :=
  ∀(D N:Type)[Field D][NumberField D][Field N][NumberField N][Algebra D N]
   [FiniteDimensional D N][IsGalois D N](g:Gal(N/D)),(∀ s,s∈Subgroup.zpowers g) →
   let G:=Gal(N/D)
   let A:=AdeleRing (𝓞 D) D
   let T:=A⊗[D]N
   let I:=(Units.map (Algebra.TensorProduct.includeRight (R:=D) (A:=A) (B:=N)).toMonoidHom).range
   let C:=Tˣ⧸I
   let q:=QuotientGroup.mk' I
   let a(s:G):=Units.mapEquiv (Algebra.TensorProduct.congr (AlgEquiv.refl (R:=A) (A₁:=A)) s).toMulEquiv
   let P:=(Units.map (algebraMap D A).toMonoidHom).range ⊔ (Units.map (Algebra.norm A (S:=T))).range
   ∃ c:MulDistribMulAction G C,letI:=c; (∀ s:G,∀ z:Tˣ,s•q z=q (a s z)) ∧
   let idx(M:Type)[CommGroup M][MulDistribMulAction G M]:=
    let a(s:G):M→*M:=MulDistribMulAction.toMonoidEnd G M s
    let n:M→*M:=∏ s:G,a s
    let b:=a g / MonoidHom.id M
    (n.range.relIndex b.ker,b.range.relIndex n.ker)
   (idx C).1=P.index

def H3 : Prop :=
  ∀(D N:Type)[Field D][NumberField D][Field N][NumberField N][Algebra D N]
   [FiniteDimensional D N][IsGalois D N](g:Gal(N/D)),(∀ s,s∈Subgroup.zpowers g) →
   let G:=Gal(N/D)
   let A:=AdeleRing (𝓞 D) D
   let T:=A⊗[D]N
   let I:=(Units.map (Algebra.TensorProduct.includeRight (R:=D) (A:=A) (B:=N)).toMonoidHom).range
   let C:=Tˣ⧸I
   let q:=QuotientGroup.mk' I
   let a(s:G):=Units.mapEquiv (Algebra.TensorProduct.congr (AlgEquiv.refl (R:=A) (A₁:=A)) s).toMulEquiv
   ∀ c:MulDistribMulAction G C,letI:=c; (∀ s:G,∀ z:Tˣ,s•q z=q (a s z)) →
   let p(s:G):=HeightOneSpectrum.equivOfRingEquiv (RingOfIntegers.mapAlgEquiv s).toRingEquiv
   ∃ S:Finset (HeightOneSpectrum (𝓞 N)), (∀ s w,w∈S ↔ p s w∈S) ∧
   let U:=(S:Set (HeightOneSpectrum (𝓞 N))).unit N
   let X:=InfinitePlace N ⊕ ↥S
   ∃ u:MulDistribMulAction G U, letI:=u; (∀ s:G,∀ x:U,((s•x).val:N)=s (x.val:N)) ∧
   ∃ z:MulAction G X, letI:=z; letI:Fintype (MulAction.orbitRel.Quotient G X):=Fintype.ofFinite _
   (∀ s:G,∀ w:InfinitePlace N,s•(Sum.inl w:X)=Sum.inl (s•w)) ∧
   (∀ s:G,∀ w:↥S,Sum.map id Subtype.val (s•(Sum.inr w:X))=Sum.inr (p s w.val)) ∧
   ∃ (J:Type)(j₀:CommGroup J), letI:=j₀; ∃ β:MulDistribMulAction G J, letI:=β
   ∃ (i:U→*J)(j:J→*C),(∀ s:G,∀ x:U,i (s•x)=s•i x) ∧ (∀ s:G,∀ x:J,j (s•x)=s•j x) ∧
   Function.Injective i ∧ Function.Surjective j ∧ i.range=j.ker ∧
   let idx(M:Type)[CommGroup M][MulDistribMulAction G M]:=
    let a(s:G):M→*M:=MulDistribMulAction.toMonoidEnd G M s
    let n:M→*M:=∏ s:G,a s
    let b:=a g / MonoidHom.id M
    (n.range.relIndex b.ker,b.range.relIndex n.ker)
   let v:=idx J
   0<v.1 ∧ 0<v.2 ∧ v.1=v.2*∏ t:MulAction.orbitRel.Quotient G X,Nat.card (MulAction.stabilizer G t.out)

set_option maxHeartbeats 2400000 in
theorem main : H1 → H2 → H3 → OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1.H2 := by
  intro exactSeq classes geo D N _ _ _ _ _ _ _ g gen cut
  let G := Gal(N/D)
  let A := AdeleRing (𝓞 D) D
  let T := A ⊗[D] N
  let I := (Units.map (Algebra.TensorProduct.includeRight (R:=D) (A:=A) (B:=N)).toMonoidHom).range
  let C := Tˣ ⧸ I
  let q := QuotientGroup.mk' I
  let a (s:G) := Units.mapEquiv (Algebra.TensorProduct.congr (AlgEquiv.refl (R:=A) (A₁:=A)) s).toMulEquiv
  obtain ⟨c,compat,idx⟩ := classes D N g gen
  letI : MulDistribMulAction G C := c
  obtain ⟨S,stable,u,ua,z,pinf,pfin,J,group,action,i,j,hi,hj,hinj,hsur,hker,j0,j1,jprod⟩ :=
    geo D N g gen c compat
  letI : CommGroup J := group
  letI : MulDistribMulAction G J := action
  let U := (S:Set (HeightOneSpectrum (𝓞 N))).unit N
  letI : MulDistribMulAction G U := u
  let X := InfinitePlace N ⊕ ↥S
  letI : MulAction G X := z
  letI : Fintype (MulAction.orbitRel.Quotient G X) := Fintype.ofFinite _
  obtain ⟨z',pinf',pfin',nu,bu,hnu,hbu,hu,ku,units⟩ := cut S g gen stable
  have ez : z'=z := by
    apply MulAction.ext
    funext s x
    cases x with
    | inl w => exact (pinf' s w).trans (pinf s w).symm
    | inr w => exact (Function.injective_id.sumMap Subtype.val_injective) ((pfin' s w).trans (pfin s w).symm)
  subst z'
  let aut (M : Type) [CommGroup M] [MulDistribMulAction G M] (s:G) : M →* M := MulDistribMulAction.toMonoidEnd G M s
  let norm (M : Type) [CommGroup M] [MulDistribMulAction G M] : M →* M := ∏ s:G, aut M s
  have norm_apply (M:Type) [CommGroup M] [MulDistribMulAction G M] (x:M) : norm M x=∏ s:G,s • x :=
    MonoidHom.finsetProd_apply (aut M) Finset.univ x
  let cob (M : Type) [CommGroup M] [MulDistribMulAction G M] := aut M g / MonoidHom.id M
  let h (M : Type) [CommGroup M] [MulDistribMulAction G M] := (norm M).range.relIndex (cob M).ker
  let k (M : Type) [CommGroup M] [MulDistribMulAction G M] := (cob M).range.relIndex (norm M).ker
  have n_eq : nu=norm U := by
    ext x
    rw [hnu x]
    change _ = ((Units.coeHom N).comp U.subtype) ((∏ s:G,aut U s) x)
    rw [MonoidHom.finsetProd_apply,map_prod]
    exact Finset.prod_congr rfl (fun s _ => (ua s x).symm)
  have b_eq : bu=cob U := by
    apply MonoidHom.ext
    intro x
    apply Subtype.ext
    apply Units.ext
    rw [hbu x,←ua g x]
    exact (map_div ((Units.coeHom N).comp U.subtype) (g • x) x).symm
  subst nu
  subst bu
  let m := ∏ t:MulAction.orbitRel.Quotient G X,Nat.card (MulAction.stabilizer G t.out)
  change 0<h U at hu
  change 0<k U at ku
  change h U*Nat.card G=k U*m at units
  change h J=k J*m at jprod
  change 0<k J at j1
  obtain ⟨c0,c1,bal⟩ := exactSeq G U J C g gen i j hi hj hinj hsur hker hu ku j0 j1
  change h J*k U*k C=k J*h U*h C at bal
  have hc : h C=Nat.card G*k C := by
    apply Nat.eq_of_mul_eq_mul_left (Nat.mul_pos j1 hu)
    calc k J*h U*h C = h J*k U*k C := bal.symm
         _ = k J*(k U*m)*k C := by rw [jprod]; ac_rfl
         _ = k J*h U*(Nat.card G*k C) := by rw [←units]; ac_rfl
  let nn := q.comp (∏ s:G,(a s).toMonoidHom)
  let bb := q.comp ((a g).toMonoidHom / MonoidHom.id Tˣ)
  have nn_eq (w:Tˣ) : nn w=norm C (q w) := by
    calc nn w = ∏ s:G,q (a s w) := by simp only [nn,MonoidHom.comp_apply,MonoidHom.finsetProd_apply,map_prod,MulEquiv.toMonoidHom_eq_coe,MulEquiv.coe_toMonoidHom]; rfl
         _ = ∏ s:G,s • (q w:C) := Finset.prod_congr rfl (fun s _ => (compat s w).symm)
         _ = norm C (q w) := (norm_apply C (q w)).symm
  have bb_eq (w:Tˣ) : bb w=cob C (q w) := by
    change q (a g w / w) = (g • q w) / q w
    rw [map_div,compat]
  have kn : nn.ker.map q=(norm C).ker := by
    ext w
    constructor
    · rintro ⟨z,hz,rfl⟩
      exact (nn_eq z).symm.trans hz
    · intro hw
      obtain ⟨z,rfl⟩ := QuotientGroup.mk'_surjective I w
      exact ⟨z,(nn_eq z).trans hw,rfl⟩
  have rb : bb.range=(cob C).range := by
    ext w
    constructor
    · rintro ⟨z,rfl⟩
      exact ⟨q z,(bb_eq z).symm⟩
    · rintro ⟨w,rfl⟩
      obtain ⟨z,rfl⟩ := QuotientGroup.mk'_surjective I w
      exact ⟨z,bb_eq z⟩
  change 0<bb.range.relIndex (nn.ker.map q) ∧ _=Module.finrank D N*bb.range.relIndex (nn.ker.map q)
  rw [rb,kn,←idx,←IsGalois.card_aut_eq_finrank]
  exact ⟨c1,hc⟩

end
end OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H2_R1
