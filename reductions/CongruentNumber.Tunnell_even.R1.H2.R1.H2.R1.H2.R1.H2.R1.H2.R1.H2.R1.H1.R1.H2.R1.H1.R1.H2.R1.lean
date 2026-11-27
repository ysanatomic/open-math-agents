import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1_H1_R1
import Mathlib

/-! An idèle class representation, with its compatible trace witnesses, gives the norm quotients of all finite abelian extensions and their intersections. -/
namespace OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1_H1_R1_H2_R1
open NumberField
open scoped NumberField Classical TensorProduct IsMulCommutative

def H1 : Prop :=
  ∀ (G : ProfiniteGrp) (A : Rep ℤ G),
  let S:=ClosedSubgroup G
  let U:=fun H:S => H.toSubgroup
  let M:=fun H J:S => (U J).subgroupOf (U H)
  let T:S := ⟨⊤,isClosed_univ⟩
  letI : Module ℤ A.V := A.hV2
  let B:=fun H:S => (Representation.invariants (A.ρ.comp (U H).subtype)).toAddSubgroup
  let N:=fun (H J:S) (a:A.V) => ∃ b:B J, ∑ᶠ q:U H ⧸ M H J, A.ρ q.out.val b.val=a
  let Z:=(Int.castRingHom (∀ n:ℕ+,ZMod (n:ℕ))).range.topologicalClosure
  ∀ (d:G →* Multiplicative Z) (v:B T →+ Z), Continuous d → Function.Surjective d →
  (∀ m:ℤ,(m:Z)∈v.range) → (∀(n:ℕ+)(x:B T),(v x).val n=0 → ∃ y:B T,(n:ℕ) • v y=v x) →
  (∀(H:S)[(U H).FiniteIndex](z:Z),(∃ a:B T,N T H a ∧ v a=z) ↔ ∃ a,((U H).map d).index • v a=z) →
  (∀(H J:S)[(U H).FiniteIndex], J≤H → ∀[(M H J).Normal][Fintype (U H ⧸ M H J)][IsCyclic (U H ⧸ M H J)],
    let C:=(Rep.res (U H).subtype A).quotientToInvariants (M H J)
    Nat.card (tateCohomology C 0)=Nat.card (U H ⧸ M H J) ∧ Subsingleton (tateCohomology C (-1))) →
  ∀ (H J:S)[(U H).FiniteIndex], J≤H → ∀[(M H J).Normal][Fintype (U H ⧸ M H J)][IsMulCommutative (U H ⧸ M H J)],
    let W:=AddSubgroup.closure {a:B H | N H J a}
    Nonempty ((B H ⧸ W) ≃+ Additive (U H ⧸ M H J)) ∧
    ∀ a:B H, ∃ t:U H, ∀ L:S, J≤L → L≤H → ∀[(M H L).Normal][Fintype (U H ⧸ M H L)]
      [IsMulCommutative (U H ⧸ M H L)], (t.val∈L ↔ N H L a)

def H2 : Prop :=
  (∀(D N:Type)[Field D][NumberField D][Field N][NumberField N][Algebra D N]
   [FiniteDimensional D N][IsGalois D N](g:Gal(N/D)),(∀ s,s∈Subgroup.zpowers g) →
   let A:=AdeleRing (𝓞 D) D
   let T:=A⊗[D]N
   let P:=(Units.map (algebraMap D A).toMonoidHom).range ⊔ (Units.map (Algebra.norm A (S:=T))).range
   let q:=QuotientGroup.mk' (Units.map (Algebra.TensorProduct.includeRight (R:=D) (A:=A) (B:=N)).toMonoidHom).range
   let a(s:Gal(N/D)):=Units.mapEquiv (Algebra.TensorProduct.congr (AlgEquiv.refl (R:=A) (A₁:=A)) s).toMulEquiv
   P.index=Module.finrank D N ∧ ∀ z:Tˣ,(∏ s:Gal(N/D),q (a s z))=1 → ∃ y:Tˣ,q (a g y / y)=q z) →
  let Ω:=SeparableClosure ℚ
  let G:=Gal(Ω/ℚ)
  ∀ [IsGalois ℚ Ω], ∃ A:Rep ℤ G, letI : Module ℤ A.V:=A.hV2
    let S:=ClosedSubgroup G
    let U:=fun H:S => H.toSubgroup
    let M:=fun H J:S => (U J).subgroupOf (U H)
    let B:=fun H:S => (Representation.invariants (A.ρ.comp (U H).subtype)).toAddSubgroup
    let N:=fun (H J:S) (a:A.V) => ∃ b:B J, ∑ᶠ q:U H ⧸ M H J, A.ρ q.out.val b.val=a
    (∀(H J:S)[(U H).FiniteIndex], J≤H → ∀[(M H J).Normal][Fintype (U H ⧸ M H J)][IsCyclic (U H ⧸ M H J)],
      let C:=(Rep.res (U H).subtype A).quotientToInvariants (M H J)
      Nat.card (tateCohomology C 0)=Nat.card (U H ⧸ M H J) ∧ Subsingleton (tateCohomology C (-1))) ∧
    ∀ (D:Type)[Field D][NumberField D](j:D →ₐ[ℚ] Ω),
      let R:=AdeleRing (𝓞 D) D
      let H:S:=⟨j.fieldRange.fixingSubgroup,InfiniteGalois.fixingSubgroup_isClosed _⟩
      let P:=(Units.map (algebraMap D R).toMonoidHom).range
      ∃ i:Rˣ →* Multiplicative (B H), Function.Surjective i ∧ i.ker=P ∧
        ∀ (F:Type)[Field F][NumberField F][Algebra D F][FiniteDimensional D F](e:F →ₐ[ℚ] Ω),
          (∀ x:D,e (algebraMap D F x)=j x) → ∀ z:Rˣ,
          N H ⟨e.fieldRange.fixingSubgroup,InfiniteGalois.fixingSubgroup_isClosed _⟩ (i z).toAdd.val ↔
            z∈P ⊔ (Units.map (Algebra.norm R (S:=R⊗[D]F))).range

def H3 : Prop :=
  let Z:=(Int.castRingHom (∀ n:ℕ+,ZMod (n:ℕ))).range.topologicalClosure
  (∀(n:ℕ+)(x:Z),x.val n=0 → ∃ y:Z,(n:ℕ) • y=x) ∧
  ∀(K:Subgroup (Multiplicative Z))[K.FiniteIndex], K=(powMonoidHom K.index : Multiplicative Z →* Multiplicative Z).range

def H4 : Prop :=
  let Ω:=SeparableClosure ℚ
  ∀ [IsGalois ℚ Ω],
  (∀ (D F:Type)[Field D][NumberField D][Field F][NumberField F][Algebra D F]
    [FiniteDimensional D F][IsGalois D F](e:F →ₐ[ℚ] Ω),
    let H:=(e.comp (IsScalarTower.toAlgHom ℚ D F)).fieldRange.fixingSubgroup
    let J:=e.fieldRange.fixingSubgroup
    H.FiniteIndex ∧ J≤H ∧ ∃ h:(J.subgroupOf H).Normal, Nonempty ((H ⧸ J.subgroupOf H) ≃* Gal(F/D))) ∧
  ∀ (D M:Type)[Field D][NumberField D][Field M][NumberField M][Algebra D M] (e:M →ₐ[ℚ] Ω)
    (E F:IntermediateField D M), E⊔F=⊤ →
    e.fieldRange.fixingSubgroup =
      (e.comp (E.val.restrictScalars ℚ)).fieldRange.fixingSubgroup ⊓
      (e.comp (F.val.restrictScalars ℚ)).fieldRange.fixingSubgroup

theorem descend {X B Z:Type} [CommGroup X] [CommGroup B] [CommGroup Z]
    (i:X →* B) (si:Function.Surjective i) (v:X →* Z) (kv:i.ker≤v.ker) :
    ∃ w:B →* Z, ∀ x,w (i x)=v x := by
  let e:=QuotientGroup.quotientKerEquivOfSurjective i si
  let f:=QuotientGroup.lift i.ker v kv
  refine ⟨f.comp e.symm.toMonoidHom,?_⟩
  intro x
  have h : e ((QuotientGroup.mk' i.ker) x)=i x := rfl
  change f (e.symm (i x))=v x
  rw [←h,e.symm_apply_apply]
  rfl

theorem sup_image {Y Z:Type} [CommGroup Y] [CommGroup Z] (v:Y →* Z)
    (P N:Subgroup Y) (kill:P≤v.ker) : (P⊔N).map v=N.map v := by
  rw [Subgroup.map_sup,(P.map_eq_bot_iff).mpr kill,bot_sup_eq]

theorem induced_quotient {X B:Type} [CommGroup X] [AddCommGroup B]
    (i:X →* Multiplicative B) (si:Function.Surjective i) (P:Subgroup X)
    (N:B → Prop) (det:∀ x,N (i x).toAdd ↔ x∈P) :
    Nonempty ((X ⧸ P) ≃* Multiplicative (B ⧸ AddSubgroup.closure {a | N a})) := by
  let W:=AddSubgroup.closure {a | N a}
  let Q:=((QuotientAddGroup.mk' W).toMultiplicative).comp i
  have eq : W=(P.map i).toAddSubgroup := by
    apply le_antisymm
    · apply (AddSubgroup.closure_le _).mpr
      intro a ha
      obtain ⟨x,hx⟩:=si (Multiplicative.ofAdd a)
      refine ⟨x,(det x).mp ?_,hx⟩
      rw [hx]; exact ha
    · rintro a ⟨x,hx,hxa⟩
      apply AddSubgroup.subset_closure
      change N a
      have h : (i x).toAdd=a := congrArg Multiplicative.toAdd hxa
      exact h ▸ (det x).mpr hx
  have ker : Q.ker=P := by
    ext x
    change ((QuotientAddGroup.mk' W) (i x).toAdd=0) ↔ x∈P
    rw [QuotientAddGroup.mk'_apply,QuotientAddGroup.eq_zero_iff,eq]
    constructor
    · rintro ⟨y,hy,hyx⟩
      exact (det x).mp (hyx ▸ (det y).mpr hy)
    · exact fun hx => ⟨x,hx,rfl⟩
  have surj : Function.Surjective Q := by
    intro z
    obtain ⟨b,hb⟩:=QuotientAddGroup.mk'_surjective W z.toAdd
    obtain ⟨x,hx⟩:=si (Multiplicative.ofAdd b)
    exact ⟨x,by change Multiplicative.ofAdd ((QuotientAddGroup.mk' W) (i x).toAdd)=z; rw [hx]; exact congrArg Multiplicative.ofAdd hb⟩
  exact ⟨(QuotientGroup.quotientMulEquivOfEq ker.symm).trans (QuotientGroup.quotientKerEquivOfSurjective Q surj)⟩

theorem rational_norm_range {F R:Type} [Field F] [CommRing R] [Algebra ℚ R]
    (a b:Algebra ℚ F) :
    (letI := a; (Units.map (Algebra.norm R (S:=R⊗[ℚ]F))).range) =
    (letI := b; (Units.map (Algebra.norm R (S:=R⊗[ℚ]F))).range) := by
  cases Subsingleton.elim a b
  rfl

theorem image_range {X Y Z:Type} [Group X] [Group Y] [Group Z] (f:X →* Y) (v:Y →* Z) :
    f.range.map v=(v.comp f).range := by
  ext a
  exact ⟨fun ⟨_,⟨x,rfl⟩,h⟩ => ⟨x,h⟩,fun ⟨x,h⟩ => ⟨f x,⟨x,rfl⟩,h⟩⟩

set_option maxHeartbeats 750000 in
theorem from_law (geometry:H4) [IsGalois ℚ (SeparableClosure ℚ)] (A:Rep.{0} ℤ Gal(SeparableClosure ℚ/ℚ)) :
  let Ω:=SeparableClosure ℚ
  let G:=Gal(Ω/ℚ)
  letI : Module ℤ A.V:=A.hV2
  let S:=ClosedSubgroup G
  let U:=fun H:S => H.toSubgroup
  let B:=fun H:S => (Representation.invariants (A.ρ.comp (U H).subtype)).toAddSubgroup
  let M:=fun H J:S => (U J).subgroupOf (U H)
  let N:=fun (H J:S) (a:A.V) => ∃ b:B J, ∑ᶠ q:U H ⧸ M H J, A.ρ q.out.val b.val=a
  (∀ (H J:S)[(U H).FiniteIndex], J≤H → ∀[(M H J).Normal][Fintype (U H ⧸ M H J)][IsMulCommutative (U H ⧸ M H J)],
    let W:=AddSubgroup.closure {a:B H | N H J a}
    Nonempty ((B H ⧸ W) ≃+ Additive (U H ⧸ M H J)) ∧
    ∀ a:B H, ∃ t:U H, ∀ L:S, J≤L → L≤H → ∀[(M H L).Normal][Fintype (U H ⧸ M H L)]
      [IsMulCommutative (U H ⧸ M H L)], (t.val∈L ↔ N H L a)) →
  (∀ (D:Type)[Field D][NumberField D](j:D →ₐ[ℚ] Ω),
      let R:=AdeleRing (𝓞 D) D
      let H:S:=⟨j.fieldRange.fixingSubgroup,InfiniteGalois.fixingSubgroup_isClosed _⟩
      let P:=(Units.map (algebraMap D R).toMonoidHom).range
      ∃ i:Rˣ →* Multiplicative (B H), Function.Surjective i ∧ i.ker=P ∧
        ∀ (F:Type)[Field F][NumberField F][Algebra D F][FiniteDimensional D F](e:F →ₐ[ℚ] Ω),
          (∀ x:D,e (algebraMap D F x)=j x) → ∀ z:Rˣ,
          N H ⟨e.fieldRange.fixingSubgroup,InfiniteGalois.fixingSubgroup_isClosed _⟩ (i z).toAdd.val ↔
            z∈P ⊔ (Units.map (Algebra.norm R (S:=R⊗[D]F))).range) →
  ∀ (D M:Type)[Field D] [NumberField D] [Field M] [NumberField M] [Algebra D M]
  [FiniteDimensional D M] [IsAbelianGalois D M], let A:=AdeleRing (𝓞 D) D
  let P (B:Type) [Field B] [Algebra D B] := (Units.map (algebraMap D A).toMonoidHom).range ⊔
    (Units.map (Algebra.norm A (S:=A⊗[D]B))).range
  Nonempty ((Aˣ ⧸ P M) ≃* Gal(M/D)) ∧ (P M).index=Module.finrank D M ∧ ∀ E F:IntermediateField D M, E⊔F=⊤ → P M=P E ⊓ P F := by
  dsimp only
  intro law model
  let Ω:=SeparableClosure ℚ
  let G:=Gal(Ω/ℚ)
  letI : Module ℤ A.V:=A.hV2
  let S:=ClosedSubgroup G
  let U:=fun H:S => H.toSubgroup
  let B:=fun H:S => (Representation.invariants (A.ρ.comp (U H).subtype)).toAddSubgroup
  let M:=fun H J:S => (U J).subgroupOf (U H)
  let N:=fun (H J:S) (a:A.V) => ∃ b:B J, ∑ᶠ q:U H ⧸ M H J, A.ρ q.out.val b.val=a
  let fix {F:Type} [Field F] [Algebra ℚ F] (e:F →ₐ[ℚ] Ω) : S :=
    ⟨e.fieldRange.fixingSubgroup,InfiniteGalois.fixingSubgroup_isClosed _⟩
  intro D L _ _ _ _ _ _ _
  let R:=AdeleRing (𝓞 D) D
  let P (X:Type) [Field X][Algebra D X]:=(Units.map (algebraMap D R).toMonoidHom).range ⊔ (Units.map (Algebra.norm R (S:=R⊗[D]X))).range
  let e:L →ₐ[ℚ] Ω:=IsSepClosed.lift
  let jD:=e.comp (IsScalarTower.toAlgHom ℚ D L)
  let H:=fix jD
  let J:=fix e
  obtain ⟨idx,below,normal,⟨galois⟩⟩:=geometry.1 D L e
  letI : (U H).FiniteIndex := idx
  letI : (M H J).Normal := normal
  letI : Fintype (U H ⧸ M H J) := Fintype.ofEquiv Gal(L/D) galois.symm.toEquiv
  letI : IsMulCommutative (U H ⧸ M H J) := ⟨⟨fun a b => galois.injective (by rw [map_mul,map_mul,mul_comm])⟩⟩
  obtain ⟨iD,siD,_,normD⟩:=model D jD
  have nd (x:Rˣ) : N H J (iD x).toAdd.val ↔ x∈P L := normD L e (fun _ => rfl) x
  obtain ⟨⟨iso⟩,detect⟩:=law H J below
  obtain ⟨first⟩:=induced_quotient iD siD (P L) (fun a:B H=>N H J a.val) nd
  let f:=first.trans (iso.toMultiplicative.trans galois)
  refine ⟨⟨f⟩,(Nat.card_congr f.toEquiv).trans (IsGalois.card_aut_eq_finrank D L),?_⟩
  intro E F h
  ext x
  let sub (X:IntermediateField D L):= e.comp (X.val.restrictScalars ℚ)
  obtain ⟨t,wt⟩:=detect (iD x).toAdd
  have base_mem : t.val∈J ↔ x∈P L := (wt J le_rfl below).trans (nd x)
  have sub_mem (X:IntermediateField D L) : t.val∈fix (sub X) ↔ x∈P X := by
    let u:=sub X
    have base_eq : (u.comp (IsScalarTower.toAlgHom ℚ D X))=jD := by ext a; rfl
    have geom:=geometry.1 D X u
    dsimp only at geom
    rw [base_eq] at geom
    obtain ⟨_,hj,nn,⟨gg⟩⟩:=geom
    letI : (M H (fix u)).Normal := nn
    letI : Fintype (U H ⧸ M H (fix u)) := Fintype.ofEquiv Gal(X/D) gg.symm.toEquiv
    letI : IsMulCommutative (U H ⧸ M H (fix u)) := ⟨⟨fun a b => gg.injective (by rw [map_mul,map_mul,mul_comm])⟩⟩
    have lower : J≤fix u := by
      apply u.fieldRange.fixingSubgroup_le
      rintro _ ⟨a,rfl⟩
      exact ⟨a.val,rfl⟩
    exact (wt (fix u) lower hj).trans (normD X u (fun _ => rfl) x)
  change x∈P L ↔ x∈P E ∧ x∈P F
  rw [←base_mem,←sub_mem E,←sub_mem F]
  change t.val∈e.fieldRange.fixingSubgroup ↔ _
  rw [geometry.2 D L e E F h]
  rfl

set_option maxHeartbeats 2800000 in
theorem main : H1 → H2 → H3 → H4 → OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1_H1_R1.H2 := by
  intro core realization arithmetic geometry values classes
  obtain ⟨d,cd,sd,v,sv,kill,images⟩:=values
  let Ω:=SeparableClosure ℚ
  let G:=Gal(Ω/ℚ)
  letI : IsGalois ℚ Ω := @IsSepClosure.isGalois ℚ _ Ω _ ((separableClosure ℚ (AlgebraicClosure ℚ)).algebra)
    (separableClosure.isSepClosure ℚ (AlgebraicClosure ℚ))
  obtain ⟨A,tate,model⟩:=realization classes
  letI : Module ℤ A.V:=A.hV2
  let S:=ClosedSubgroup G
  let U:=fun H:S => H.toSubgroup
  let B:=fun H:S => (Representation.invariants (A.ρ.comp (U H).subtype)).toAddSubgroup
  let M:=fun H J:S => (U J).subgroupOf (U H)
  let N:=fun (H J:S) (a:A.V) => ∃ b:B J, ∑ᶠ q:U H ⧸ M H J, A.ρ q.out.val b.val=a
  let T:S:=⟨⊤,isClosed_univ⟩
  let fix {F:Type} [Field F] [Algebra ℚ F] (e:F →ₐ[ℚ] Ω) : S :=
    ⟨e.fieldRange.fixingSubgroup,InfiniteGalois.fixingSubgroup_isClosed _⟩
  let j:=Algebra.ofId ℚ Ω
  have ht : fix j=T := by
    apply SetLike.ext
    intro g
    change (g∈j.fieldRange.fixingSubgroup) ↔ g∈(⊤:Subgroup G)
    rw [IntermediateField.mem_fixingSubgroup_iff]
    exact ⟨fun _ => trivial,fun _ x ⟨y,hy⟩ => hy ▸ g.commutes y⟩
  let AQ:=AdeleRing (𝓞 ℚ) ℚ
  let Z:=(Int.castRingHom (∀ n:ℕ+,ZMod (n:ℕ))).range.topologicalClosure
  let principal:=Units.map (algebraMap ℚ AQ).toMonoidHom
  have base : ∃ i:AQˣ →* Multiplicative (B T), Function.Surjective i ∧ i.ker=principal.range ∧
      ∀(F:Type)[Field F][NumberField F](e:F →ₐ[ℚ] Ω),
        (∀ x:ℚ,e (algebraMap ℚ F x)=j x) → ∀ z:AQˣ,
        N T (fix e) (i z).toAdd.val ↔ z∈principal.range ⊔ (Units.map (Algebra.norm AQ (S:=AQ⊗[ℚ]F))).range := by
    rw [←ht]
    obtain ⟨ii,sii,kii,nii⟩:=model ℚ j
    refine ⟨ii,sii,kii,?_⟩
    intro F _ _ e h x
    exact nii F e h x
  obtain ⟨i,si,ki,ni⟩:=base
  obtain ⟨w,hw⟩:=descend i si v (by rw [ki]; rintro _ ⟨x,rfl⟩; exact kill x)
  let val:B T →+ Z:=AddMonoidHom.toMultiplicative.symm w
  have onto : Function.Surjective val := by
    intro z
    obtain ⟨x,hx⟩:=sv (Multiplicative.ofAdd z)
    exact ⟨(i x).toAdd, (hw x).trans hx⟩
  have hn (H:S) [(U H).FiniteIndex] (z:Z) :
      (∃ a:B T,N T H a ∧ val a=z) ↔ ∃ a:B T, ((U H).map d).index • val a=z := by
    let F:=IntermediateField.fixedField (U H)
    let a0 : Algebra ℚ F:=F.algebra
    let det₀:=letI:=a0; Units.map (Algebra.norm AQ (S:=AQ⊗[ℚ]F))
    have pre : (v.comp det₀).range=(U H).map d := images H (inferInstanceAs (U H).FiniteIndex)
    letI : FiniteDimensional ℚ F := (InfiniteGalois.isOpen_iff_finite F).mp (by
      change IsOpen (F.fixingSubgroup : Set G)
      rw [InfiniteGalois.fixingSubgroup_fixedField H]
      exact H.toSubgroup.isOpen_of_isClosed_of_finiteIndex H.isClosed')
    letI : NumberField F:=NumberField.of_module_finite ℚ F
    let a1 : Algebra ℚ F:=DivisionRing.toRatAlgebra
    let det:=letI:=a1; Units.map (Algebra.norm AQ (S:=AQ⊗[ℚ]F))
    let P:=principal.range ⊔ det.range
    let emb : @AlgHom ℚ F Ω _ _ _ a1 _ := F.val
    have hf : @fix F _ a1 emb=H := by
      have same : emb.fieldRange=F := by
        ext x
        change (∃ y:F, emb y=x) ↔ x∈F
        exact ⟨fun ⟨y,h⟩=>h ▸ y.property,fun hx=>⟨⟨x,hx⟩,rfl⟩⟩
      apply SetLike.coe_injective
      change (emb.fieldRange.fixingSubgroup : Set G)=(H:Set G)
      rw [same,InfiniteGalois.fixingSubgroup_fixedField H]
      rfl
    have nd (x:AQˣ) : N T H (i x).toAdd.val ↔ x∈P := by
      have nh:=ni F emb (fun _ => rfl) x
      change N T (@fix F _ a1 emb) (i x).toAdd.val ↔ x∈P at nh
      exact hf ▸ nh
    have en : det.range=det₀.range := rational_norm_range a1 a0
    have eq : P.map v=(U H).map d := by
      have kp : principal.range≤v.ker := by rintro _ ⟨x,rfl⟩; exact kill x
      calc P.map v=det.range.map v := sup_image v principal.range det.range kp
           _ = det₀.range.map v := congrArg (fun K:Subgroup AQˣ=>K.map v) en
           _ = (v.comp det₀).range := image_range det₀ v
           _ = _ := pre
    let K:=(U H).map d
    letI : K.FiniteIndex:=⟨ne_zero_of_dvd_ne_zero (Subgroup.FiniteIndex.index_ne_zero (H:=U H)) ((U H).index_map_dvd sd)⟩
    have mem : (∃ a:B T,N T H a ∧ val a=z) ↔ Multiplicative.ofAdd z ∈ K := by
      rw [show K=P.map v from eq.symm]
      constructor
      · rintro ⟨a,ha,hz⟩
        obtain ⟨x,hx⟩:=si (Multiplicative.ofAdd a)
        exact ⟨x,(nd x).mp (hx.symm ▸ ha),(hw x).symm.trans ((congrArg w hx).trans (congrArg Multiplicative.ofAdd hz))⟩
      · rintro ⟨x,hp,hx⟩
        exact ⟨(i x).toAdd,(nd x).mpr hp,(hw x).trans hx⟩
    rw [mem,arithmetic.2 K]
    constructor
    · rintro ⟨x,hx⟩
      obtain ⟨a,ha⟩:=onto x.toAdd
      exact ⟨a,by rw [ha]; exact hx⟩
    · rintro ⟨a,ha⟩
      exact ⟨Multiplicative.ofAdd (val a),ha⟩
  have law:=core (ProfiniteGrp.of G) A d val cd sd (fun n=>onto n) (fun n x hx => by
    obtain ⟨y,hy⟩:=arithmetic.1 n (val x) hx
    obtain ⟨b,hb⟩:=onto y
    exact ⟨b,hb ▸ hy⟩) hn tate
  exact from_law geometry A law model

end OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1_H1_R1_H2_R1
