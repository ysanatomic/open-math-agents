import TunnellGeometricPrimaryKernel
import TunnellDivisionCoordinates

/-! The finite, globally Galois field of a primary division lift and the order of its relative Galois group. -/
namespace TunnellGlobalKummerLift
open WeierstrassCurve WeierstrassCurve.Affine TunnellCoates TunnellKummer TunnellGaussianEnd TunnellCMTorsionField
open TunnellDivisionCoordinates
open scoped Classical TunnellDivisionCoordinates
noncomputable section
set_option maxHeartbeats 1100000
variable {F B:Type} [Field F] [Field B] [NumberField F] [Algebra F ℂ] [Algebra F B] [Normal F B]
  [DecidableEq F] [DecidableEq B]
variable (n:ℕ) (hn:0<n) [(E (n:F)).IsElliptic] (j:F) (hj:j^2= -1) (hI:algebraMap F ℂ j=Complex.I)
variable {p:ℕ} (hp:p.Prime) (h₂:p≠2) (a:GaussianInt) (ha:a.norm.natAbs=p) (hnorm:a.re^2+a.im^2=(p:ℤ)) (r:ℕ)
local notation "W" => E (n:F)
local notation "φ" => cm (n:F) j hj (a^r)

theorem map_base {A C:Type} [Field A] [Field C] [Algebra F A] [Algebra F C]
    (V:WeierstrassCurve F) (e:A→ₐ[F]C) (P:CurvePoints V F) :
    Point.map (W':=V.toAffine) e (Point.map (W':=V.toAffine) (Algebra.ofId F A) P)=Point.map (W':=V.toAffine) (Algebra.ofId F C) P := by
  cases P with
  | zero=>rfl
  | some x y h=>exact (Point.some.injEq ..).mpr ⟨e.commutes x,e.commutes y⟩

include hn hI hp h₂ ha hnorm in
theorem points_of_lift (D:IntermediateField F B) [FiniteDimensional F D] [Normal F D] [Algebra.IsAlgebraic D B]
    (S:CurvePoints W D) (hs:φ S=0) (ho:addOrderOf S=p^r) (P:CurvePoints W F) (hP:P≠0) (Q:CurvePoints W B)
    (hQ:φ Q=Point.map (W':=(E (n:F)).toAffine) (Algebra.ofId F B) P) :
    ∃ (x y:B) (hh:((E (n:F)).baseChange B).toAffine.Nonsingular x y),
      φ (.some x y hh)=Point.map (W':=(E (n:F)).toAffine) (Algebra.ofId F B) P ∧
      let N:=field D x y
      FiniteDimensional D N ∧ IsGalois F N ∧ IsAbelianGalois D N ∧ Module.finrank D N∣p^r ∧
      φ (point W D x y hh)=Point.map (W':=(E (n:F)).toAffine) (Algebra.ofId F N) P := by
  have hJ:=hI
  let f:=Point.map (W':=(E (n:F)).toAffine) D.val
  have hf:=Point.map_injective (W':=(E (n:F)).toAffine) D.val
  have hSB:φ (f S)=0 := by dsimp [f]; rw [←cm_map,hs,map_zero]
  have hoB:addOrderOf (f S)=p^r:=(addOrderOf_injective f hf S).trans ho
  have hgen:=TunnellGeometricPrimaryKernel.generates_with n hn j hj hJ hp h₂ a ha hnorm r (f S) hSB hoB
  have hker:(cm (L:=B) (n:F) j hj (a^r)).ker≤rationalPoints W D:=by
    intro U hU
    obtain ⟨k,rfl⟩:=AddSubgroup.mem_zmultiples_iff.mp (hgen U hU)
    exact (rationalPoints W D).zsmul_mem ⟨S,rfl⟩ k
  cases Q with
  | zero=>
    have hz:Point.map (W':=(E (n:F)).toAffine) (Algebra.ofId F B) P=0:=hQ.symm.trans (map_zero _)
    exact (hP (Point.map_injective (W':=(E (n:F)).toAffine) (Algebra.ofId F B) (hz.trans (map_zero _).symm))).elim
  | some x y hh=>
    let N:=field D x y
    let g:=embed D x y
    let V:=point W D x y hh
    let fD:=Point.map (W':=(E (n:F)).toAffine) (IsScalarTower.toAlgHom F D N)
    haveI:FiniteDimensional D N:=finite D x y
    have hFB (σ:Gal(B/F)) : act W σ (φ (.some x y hh))=φ (.some x y hh) :=
      (congrArg (act W σ) hQ).trans ((map_base W σ.toAlgHom P).trans hQ.symm)
    haveI:Normal F N:=TunnellDivisionCoordinates.normal W D x y hh φ (fun σ U=>cm_act _ _ _ _ _ U) hFB hker
    haveI:IsGalois F N:=⟨⟩
    have hv:φ V=Point.map (W':=(E (n:F)).toAffine) (Algebra.ofId F N) P := by
      apply Point.map_injective (W':=(E (n:F)).toAffine) g
      rw [cm_map,show Point.map g V=Point.some x y hh from rfl,hQ]
      exact (map_base W g P).symm
    have hfix(g':Gal(N/F)):act W g' (φ V)=φ V := by rw [hv]; exact map_base W g'.toAlgHom P
    have hSN:φ (fD S)=0:=by dsimp [fD]; rw [←cm_map,hs,map_zero]
    have horder:addOrderOf (fD S)=p^r:=(addOrderOf_injective fD (Point.map_injective _) S).trans ho
    have hgN:=TunnellGeometricPrimaryKernel.generates_with n hn j hj hJ hp h₂ a ha hnorm r (fD S) hSN horder
    have hV:((E (n:F)).baseChange N).toAffine.Nonsingular (X D x y) (Y D x y):=
      ((W).toAffine.baseChange_nonsingular (embed D x y).injective _ _).mp hh
    have eqV:V=.some (X D x y) (Y D x y) hV:=rfl
    have heq(σ:Gal(N/F)) (U:CurvePoints W N):φ (act W σ U)=act W σ (φ U):=cm_act _ _ _ _ σ U
    obtain ⟨hab,hdeg⟩:=TunnellKummerCompositum.relative_abelian (T:=D) W φ V (fD S)
      heq hfix hgN (fix_lift W D x y S) hV eqV (generated D x y)
    exact ⟨x,y,hh,hQ,‹FiniteDimensional D N›,‹IsGalois F N›,hab,horder ▸ hdeg,hv⟩

#print axioms points_of_lift
end
end TunnellGlobalKummerLift
