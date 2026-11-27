import TunnellRationalPrimaryFibre
namespace TunnellRelativePrimaryFibre
open Complex WeierstrassCurve WeierstrassCurve.Affine TunnellCoates TunnellKummer TunnellGaussianEnd TunnellCMTorsionField
open scoped Classical
noncomputable section
variable {F:Type} [Field F] [NumberField F] [Algebra F ℂ]
local notation "B" => algebraicClosure F ℂ
variable (n:ℕ) (hn:0<n) [(E (n:F)).IsElliptic] (i:F) (hi:i^2= -1) (hI:algebraMap F ℂ i=I)
variable {p:ℕ} (hp:p.Prime) (hp₂:p≠2) (a:GaussianInt) (ha:a.norm.natAbs=p) (hnorm:a.re^2+a.im^2=(p:ℤ)) (r:ℕ)
local notation "W" => E (n:F)
local notation "φ" => cm (L:=B) (n:F) i hi (a^r)

private lemma base_map {A C:Type} [Field A] [Field C] [Algebra F A] [Algebra F C]
    (e:A→ₐ[F]C) (P:CurvePoints W F) :
    Point.map (W':=(E (n:F)).toAffine) e (Point.map (W':=(E (n:F)).toAffine) (Algebra.ofId F A) P)=Point.map (W':=(E (n:F)).toAffine) (Algebra.ofId F C) P := by
  cases P with
  | zero=>rfl
  | some x y h=>exact (Point.some.injEq ..).mpr ⟨e.commutes x,e.commutes y⟩

include hn hI hp hp₂ ha hnorm in
theorem lift (P:CurvePoints W F) :
    ∃ Q:CurvePoints W B,φ Q=Point.map (W':=(E (n:F)).toAffine) (Algebra.ofId F B) P := by
  let e: B→ₐ[F]ℂ:= (algebraicClosure F ℂ).val
  let g:=Point.map (W':=(E (n:F)).toAffine) e
  have hJ:algebraMap F ℂ i=I:=hI
  obtain ⟨T,hT,hord,_⟩:=TunnellCMTorsionDegree.split_field n hn i hi hJ hp hp₂ ha r
  let A:=algebraicClosure F ℂ
  let f:=Point.map (W':=(E (n:F)).toAffine) A.val
  let S:=f T
  have hs : cm (n:F) i hi (a^r) S=0:=by dsimp [S,f]; rw [←cm_map,hT,map_zero]
  have ho:addOrderOf S=p^r:=(addOrderOf_injective f (Point.map_injective _) T).trans hord
  let u:=cm (L:=ℂ) (n:F) i hi (a^r)
  have hgen:=TunnellGeometricPrimaryKernel.generates n hn i hi hJ hp hp₂ a ha hnorm r S hs ho
  haveI:Finite (AddSubgroup.zmultiples S):=Nat.finite_of_card_ne_zero (by rw [Nat.card_zmultiples,ho]; exact pow_ne_zero _ hp.ne_zero)
  have hfin:Finite u.ker:=Finite.of_injective (fun x:u.ker=>(⟨x.1,hgen _ x.2⟩:AddSubgroup.zmultiples S)) (fun _ _ h=>Subtype.ext (congrArg (fun t:AddSubgroup.zmultiples S=>(t:CurvePoints W ℂ)) h))
  have h0:a≠0:=by rintro rfl; exact hp.ne_zero (by simpa using ha.symm)
  obtain ⟨Q,hQ⟩:=TunnellAlgebraicDivisionLift.complex_surjective n hn i hi hJ (a^r) (pow_ne_zero r h0)
    (Point.map (W':=(E (n:F)).toAffine) (Algebra.ofId F ℂ) P)
  have hQB:∃ Q':CurvePoints W B,g Q'=Q:=by
    cases Q with
    | zero=>exact ⟨0,rfl⟩
    | some x y h=>
      have hx:=TunnellAlgebraicDivisionLift.algebraic_preimage n i hi (a^r) P hfin h hQ
      have hx':x∈B:= mem_algebraicClosure_iff.mpr hx
      have hy:y∈B:=by
        apply mem_algebraicClosure_iff.mpr
        apply IsAlgebraic.of_pow (n:=2) (by decide)
        have e':=h.1
        rw [base_E,map_natCast] at e'
        rw [(E_equation _ _ _).mp e']
        exact mem_algebraicClosure_iff.mp ((B).sub_mem ((B).pow_mem hx' (3:ℕ)) ((B).mul_mem ((B).pow_mem ((B).natCast_mem n) (2:ℕ)) hx'))
      let X:B:=⟨x,hx'⟩
      let Y:B:=⟨y,hy⟩
      exact ⟨.some X Y (((E (n:F)).toAffine.baseChange_nonsingular e.injective X Y).mp h),rfl⟩
  obtain ⟨Q',he⟩:=hQB
  refine ⟨Q',Point.map_injective (W':=(E (n:F)).toAffine) e ?_⟩
  rw [cm_map,show Point.map e Q'=Q from he,hQ]
  exact (base_map n e P).symm

#print axioms lift
end
end TunnellRelativePrimaryFibre
