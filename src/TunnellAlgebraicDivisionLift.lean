import TunnellGeometricPrimaryKernel
import Mathlib.FieldTheory.RatFunc.AsPolynomial

/-! Algebraicity of a point in a finite primary-division fibre over a rational point. -/
namespace TunnellAlgebraicDivisionLift
open Complex LSG.Weierstrass TunnellCMLemniscate TunnellCMToricDivision TunnellCMTorsionField
open WeierstrassCurve TunnellCoates TunnellKummer TunnellGaussianEnd IntermediateField
open scoped Classical IntermediateField
noncomputable section
variable {F:Type} [Field F] [CharZero F] [Algebra F ℂ]
variable (n:ℕ) (hn:0<n) [(E (n:F)).IsElliptic] (j:F) (hj:j^2= -1) (hI:algebraMap F ℂ j=I)

private lemma model_surjective {W:WeierstrassCurve ℂ} [W.IsElliptic] (n:ℕ) (hn:0<n) (e:W=E (n:ℂ))
    (a:GaussianInt) (ha:a≠0) : Function.Surjective (endo (quarter e I I_sq) a.re a.im) := by
  have eq:W=curve (twistPeriods n hn):=e.trans (curve_eq n hn).symm
  cases eq
  change Function.Surjective (action n hn a)
  intro P
  obtain ⟨z,rfl⟩:=TunnellCMTorus.exp_surjective (twistPeriods n hn) P
  refine ⟨expE _ (z/(a:ℂ)),?_⟩
  rw [action_exp,mul_div_cancel₀ _ (fun h=>ha (GaussianInt.toComplex_eq_zero.mp h))]

include hn hI in
theorem complex_surjective (a:GaussianInt) (ha:a≠0) : Function.Surjective (cm (L:=ℂ) (n:F) j hj a) := by
  have e:(E (n:F)).baseChange ℂ=E (n:ℂ):=by rw [base_E,map_natCast]
  letI:((E (n:F)).baseChange ℂ).IsElliptic:=inferInstanceAs (((E (n:F)).map (algebraMap F ℂ)).IsElliptic)
  have he:baseI (L:=ℂ) (n:F) j hj=quarter e I I_sq := by
    ext P
    cases P with
    | zero=>rfl
    | some x y h=>
      change Affine.Point.some _ _ _=Affine.Point.some _ _ _
      exact (Affine.Point.some.injEq ..).mpr ⟨rfl,congrArg (·*y) hI⟩
  exact (he ▸ model_surjective n hn e a ha : Function.Surjective (endo (baseI (L:=ℂ) (n:F) j hj) a.re a.im))

private lemma shifted_embeddings (x:ℂ) (h:Transcendental F x) (k:ℕ) :
    let B:=F⟮x⟯
    let A:=algebraicClosure B ℂ
    letI:Algebra F A:=((algebraMap B A).comp (algebraMap F B)).toAlgebra
    ∃ e:A→ₐ[F]ℂ,e (algebraMap B A (AdjoinSimple.gen F x))=x+k := by
  let B:=F⟮x⟯
  let A:=algebraicClosure B ℂ
  letI:Algebra F A:=((algebraMap B A).comp (algebraMap F B)).toAlgebra
  letI:IsScalarTower F B A:=IsScalarTower.of_algebraMap_eq' rfl
  have h':Transcendental F (x+(k:ℂ)) := by
    intro hk
    exact h (by simpa using (hk.isIntegral.sub (isIntegral_natCast (R:=F) (B:=ℂ) k)).isAlgebraic)
  let g:B→ₐ[F]ℂ:=(F⟮x+(k:ℂ)⟯).val.comp (((RatFunc.algEquivOfTranscendental x h).symm.trans
    (RatFunc.algEquivOfTranscendental (x+(k:ℂ)) h')).toAlgHom)
  obtain ⟨e,he⟩:=IsAlgClosed.surjective_domRestrict_of_isAlgebraic (K:=F) (L:=B) (E:=A) (M:=ℂ) g
  refine ⟨e,?_⟩
  change e.domRestrict B (AdjoinSimple.gen F x)=_
  change e.domRestrict B=g at he
  rw [he]
  change ((RatFunc.algEquivOfTranscendental (x+(k:ℂ)) h' ((RatFunc.algEquivOfTranscendental x h).symm (AdjoinSimple.gen F x))):ℂ)=_
  rw [RatFunc.algEquivOfTranscendental_symm_gen,RatFunc.algEquivOfTranscendental_X]

private lemma map_rational {R S:Type} [Field R] [Field S] [Algebra F R] [Algebra F S]
    (W:WeierstrassCurve F) (e:R→ₐ[F]S) (P:CurvePoints W F) :
    Affine.Point.map (W':=W.toAffine) e (Affine.Point.map (W':=W.toAffine) (Algebra.ofId F R) P)=
      Affine.Point.map (W':=W.toAffine) (Algebra.ofId F S) P := by
  cases P with
  | zero=>rfl
  | some x y h=>exact (Affine.Point.some.injEq ..).mpr ⟨e.commutes x,e.commutes y⟩

private def xcoord {W:WeierstrassCurve ℂ} : W.toAffine.Point→ℂ
  | .zero=>0
  | .some x _ _=>x

theorem algebraic_preimage (a:GaussianInt) (P:CurvePoints (E (n:F)) F)
    (hfin:Finite (cm (L:=ℂ) (n:F) j hj a).ker) {x y:ℂ}
    (h:((E (n:F)).baseChange ℂ).toAffine.Nonsingular x y)
    (hQ:cm (n:F) j hj a (.some x y h)=Affine.Point.map (W':=(E (n:F)).toAffine) (Algebra.ofId F ℂ) P) : IsAlgebraic F x := by
  by_contra ht
  let W:=E (n:F)
  let B:=F⟮x⟯
  let A:=algebraicClosure B ℂ
  letI:Algebra F A:=((algebraMap B A).comp (algebraMap F B)).toAlgebra
  letI:IsScalarTower F B A:=IsScalarTower.of_algebraMap_eq' rfl
  letI:IsScalarTower F F A:=IsScalarTower.of_algebraMap_eq (fun _=>rfl)
  letI:IsScalarTower F A ℂ:=IsScalarTower.of_algebraMap_eq' (by ext t; rfl)
  let iA:=IsScalarTower.toAlgHom F A ℂ
  let X:A:=algebraMap B A (AdjoinSimple.gen F x)
  have hY:y∈A := by
    apply mem_algebraicClosure_iff.mpr
    apply IsAlgebraic.of_pow (n:=2) (by decide)
    have he:=h.1
    rw [base_E,map_natCast] at he
    rw [(E_equation _ _ _).mp he]
    have hx:IsAlgebraic B x:=(isAlgebraic_algebraMap (R:=B) (A:=ℂ) (AdjoinSimple.gen F x))
    exact (hx.isIntegral.pow 3 |>.sub ((isIntegral_natCast (R:=B) (B:=ℂ) n).pow 2 |>.mul hx.isIntegral)).isAlgebraic
  let Y:A:=⟨y,hY⟩
  let Q:CurvePoints W A:=.some X Y ((W.toAffine.baseChange_nonsingular iA.injective X Y).mp h)
  let g:=Affine.Point.map (W':=W.toAffine) iA
  have hg:g Q=Affine.Point.some x y h:=rfl
  let f:=cm (L:=ℂ) (n:F) j hj a
  have eq:cm (n:F) j hj a Q=Affine.Point.map (W':=W.toAffine) (Algebra.ofId F A) P := by
    apply Affine.Point.map_injective (W':=W.toAffine) iA
    rw [cm_map,show Affine.Point.map iA Q=Affine.Point.some x y h from hg,hQ]
    exact (map_rational W iA P).symm
  choose s hs using shifted_embeddings x ht
  let D(k:ℕ):CurvePoints W ℂ:=Affine.Point.map (W':=W.toAffine) (s k) Q
  have hD(k:ℕ): f (D k)=f (g Q) := by
    change cm _ _ _ _ (Affine.Point.map (s k) Q)=_
    rw [←cm_map,eq,hg]
    exact (map_rational W (s k) P).trans hQ.symm
  let diff(k:ℕ):f.ker:=⟨D k-g Q,by change f (D k-g Q)=0; rw [map_sub,hD,sub_self]⟩
  have inj:Function.Injective diff:=by
    intro k l he
    have hd:D k=D l:=sub_left_inj.mp (congrArg Subtype.val he)
    have hx':s k X=s l X:=congrArg xcoord hd
    rw [show s k X=x+k from hs k,show s l X=x+l from hs l] at hx'
    exact_mod_cast add_left_cancel hx'
  haveI:Finite ℕ:=Finite.of_injective diff inj
  exact not_finite ℕ

#print axioms complex_surjective
#print axioms algebraic_preimage
end
end TunnellAlgebraicDivisionLift
