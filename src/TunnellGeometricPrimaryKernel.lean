import TunnellLocalCMCoordDegree

/-! Any primitive primary division point generates the full primary kernel over every characteristic-zero extension. -/
namespace TunnellGeometricPrimaryKernel
open TunnellCoates TunnellKummer TunnellGaussianEnd TunnellCMTorsionField WeierstrassCurve
open scoped Classical
noncomputable section
variable {F M:Type} [Field F] [CharZero F] [Field M] [Algebra F M] [Algebra F ℂ]

private lemma same_cyclic {G:Type*} [AddCommGroup G] {X Y:G}
    (hy:Y∈AddSubgroup.zmultiples X) (he:addOrderOf X=addOrderOf Y) (hp:0<addOrderOf X) :
    AddSubgroup.zmultiples Y=AddSubgroup.zmultiples X := by
  haveI:Finite (AddSubgroup.zmultiples X):=Nat.finite_of_card_ne_zero (by rw [Nat.card_zmultiples]; exact hp.ne')
  apply AddSubgroup.eq_of_le_of_card_ge
  · rintro _ ⟨k,rfl⟩
    exact (AddSubgroup.zmultiples X).zsmul_mem hy k
  · rw [Nat.card_zmultiples,Nat.card_zmultiples,he]

theorem generates (n:ℕ) (hn:0<n) [(E (n:F)).IsElliptic] (j:F) (hj:j^2= -1) (hI:algebraMap F ℂ j=Complex.I)
    {p:ℕ} (hp:p.Prime) (h₂:p≠2) (a:GaussianInt) (ha:a.norm.natAbs=p) (hnorm:a.re^2+a.im^2=(p:ℤ)) (r:ℕ)
    (S:CurvePoints (E (n:F)) M) (hS:cm (n:F) j hj (a^r) S=0) (ho:addOrderOf S=p^r) :
    ∀ P:CurvePoints (E (n:F)) M,cm (n:F) j hj (a^r) P=0 → P∈AddSubgroup.zmultiples S := by
  classical
  let W:=E (n:F)
  let A:=algebraicClosure F M
  let A':=algebraicClosure F ℂ
  let toC:A→ₐ[F]ℂ:=IsAlgClosed.lift
  let toA:A→ₐ[F]A':=toC.codRestrict A'.toSubalgebra (fun z=>mem_algebraicClosure_iff.mpr
    ((isAlgebraic_algHom_iff toC toC.injective).mpr (Algebra.IsAlgebraic.isAlgebraic z)))
  let g:=Affine.Point.map (W':=W.toAffine) A.val
  let f:=Affine.Point.map (W':=W.toAffine) toA
  have gf:=Affine.Point.map_injective (W':=W.toAffine) A.val
  have ff:=Affine.Point.map_injective (W':=W.toAffine) toA
  have hJ (x:CurvePoints W M) : baseI (n:F) j hj (baseI (n:F) j hj x)= -x := by
    haveI:(W.baseChange M).IsElliptic:=inferInstanceAs ((W.map (algebraMap F M)).IsElliptic)
    exact quarter_sq (base_E (n:F)) _ _ x
  have lift (P:CurvePoints W M) (h:cm (n:F) j hj (a^r) P=0) : ∃ Q:CurvePoints W A,g Q=P := by
    have hiter:(endo (baseI (n:F) j hj) a.re a.im)^[r] P=0:=(TunnellLocalCMCoordDegree.endo_iterate _ hJ a r P).trans h
    have horder:=gaussian_kernel_annihilated _ hJ _ _ hnorm r P hiter
    let D:=coordField W P
    haveI : FiniteDimensional F D:=TunnellLocalCMCoordDegree.finite_coord n _ hn (pow_pos hp.pos r) P horder
    have hsub : D≤A := by
      intro z hz
      exact mem_algebraicClosure_iff.mpr ((isAlgebraic_algHom_iff D.val D.val.injective).mpr (Algebra.IsAlgebraic.isAlgebraic (⟨z,hz⟩:D)))
    obtain ⟨Q,hQ⟩:=point_rational W P
    refine ⟨Affine.Point.map (W':=W.toAffine) (IntermediateField.inclusion hsub) Q,?_⟩
    change Affine.Point.map (W':=W.toAffine) A.val (Affine.Point.map (W':=W.toAffine) (IntermediateField.inclusion hsub) Q)=P
    rw [←hQ]
    cases Q <;> rfl
  have kernel (P:CurvePoints W M) (Q:CurvePoints W A) (hQ:g Q=P) (hp':cm (n:F) j hj (a^r) P=0) :
      cm (n:F) j hj (a^r) (f Q)=0 := by
    have h0:cm (n:F) j hj (a^r) Q=0 := by
      apply gf
      rw [cm_map,show Affine.Point.map A.val Q=P from hQ,hp',map_zero]
    change cm _ _ _ _ (Affine.Point.map toA Q)=0
    rw [←cm_map,h0,map_zero]
  obtain ⟨Y,hY⟩:=lift S hS
  obtain ⟨T,_,hT,ht,_,_,_⟩:=TunnellCMTorsionDegree.split_field n hn j hj hI hp h₂ ha r
  obtain ⟨k,hk⟩:=ht _ (kernel S Y hY hS)
  have hYord : addOrderOf (f Y)=p^r:=by
    rw [addOrderOf_injective f ff,←addOrderOf_injective g gf Y,hY,ho]
  have hZ:=same_cyclic (AddSubgroup.mem_zmultiples_iff.mpr ⟨k,hk⟩) (hT.trans hYord.symm) (hT ▸ pow_pos hp.pos r)
  intro P hP
  obtain ⟨Q,hQ⟩:=lift P hP
  obtain ⟨k,hk⟩:=ht _ (kernel P Q hQ hP)
  have hm:f Q∈AddSubgroup.zmultiples (f Y):=hZ ▸ AddSubgroup.mem_zmultiples_iff.mpr ⟨k,hk⟩
  obtain ⟨m,hm⟩:=AddSubgroup.mem_zmultiples_iff.mp hm
  have hsource:m • Y=Q:=ff (by rw [map_zsmul,hm])
  exact AddSubgroup.mem_zmultiples_iff.mpr ⟨m,by rw [←hQ,←hY,←map_zsmul,hsource]⟩

theorem generates_with [dF:DecidableEq F] [dM:DecidableEq M] (n:ℕ) (hn:0<n) [(E (n:F)).IsElliptic] (j:F) (hj:j^2= -1) (hI:algebraMap F ℂ j=Complex.I)
    {p:ℕ} (hp:p.Prime) (h₂:p≠2) (a:GaussianInt) (ha:a.norm.natAbs=p) (hnorm:a.re^2+a.im^2=(p:ℤ)) (r:ℕ)
    (S:CurvePoints (E (n:F)) M) (hS:cm (n:F) j hj (a^r) S=0) (ho:addOrderOf S=p^r) :
    ∀ P:CurvePoints (E (n:F)) M,cm (n:F) j hj (a^r) P=0 → P∈AddSubgroup.zmultiples S := by
  have eF:dF=Classical.decEq F:=Subsingleton.elim _ _
  have eM:dM=Classical.decEq M:=Subsingleton.elim _ _
  subst dF
  subst dM
  exact generates n hn j hj hI hp h₂ a ha hnorm r S hS ho

#print axioms generates_with
#print axioms generates
end
end TunnellGeometricPrimaryKernel
