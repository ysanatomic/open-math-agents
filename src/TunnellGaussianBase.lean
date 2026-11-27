import TunnellLocalCM
import TunnellKummer
import TunnellGaussianEnd

/-! The Gaussian endomorphisms on the congruent-number curves commute with base change
    and every automorphism of an extension field. -/
namespace TunnellGaussianEnd

open TunnellCoates TunnellKummer WeierstrassCurve

variable {K : Type*} [Field K] [DecidableEq K]

private def quarterFun {W : WeierstrassCurve K} [W.IsElliptic] {n : K} (hW : W=E n)
    (i:K) (hi : i^2= -1) : W.toAffine.Point → W.toAffine.Point
  | .zero => .zero
  | .some x y h => .some (-x) (i*y) (by
    subst W
    apply Affine.equation_iff_nonsingular.mp
    apply (E_equation _ _ _).mpr
    rw [mul_pow,hi,(E_equation _ _ _).mp h.1]; ring)

noncomputable def quarter {W : WeierstrassCurve K} [W.IsElliptic] {n : K} (hW : W=E n)
    (i:K) (hi:i^2 = -1) : W.toAffine.Point →+ W.toAffine.Point where
  toFun := quarterFun hW i hi
  map_zero' := rfl
  map_add' x y := by
    subst W
    have he : quarterFun (n:=n) rfl i hi = TunnellLocalCM.gaussianI n i hi := by funext P; cases P <;> rfl
    rw [he,map_add]

lemma quarter_sq {W : WeierstrassCurve K} [W.IsElliptic] {n:K} (hW : W=E n) (i:K) (hi:i^2= -1)
    (x : W.toAffine.Point) : quarter hW i hi (quarter hW i hi x)= -x := by
  subst W
  have he : quarter (n:=n) rfl i hi = TunnellLocalCM.gaussianI n i hi := by ext P; cases P <;> rfl
  rw [he]
  exact TunnellLocalCM.gaussianI_square n i hi x

variable {F L : Type*} [Field F] [Field L] [Algebra F L] [DecidableEq F] [DecidableEq L]

lemma base_E (n:F) : (E n).baseChange L=E (algebraMap F L n) := by
  ext <;> simp [WeierstrassCurve.baseChange,E]

noncomputable def baseI (n i:F) [(E n).IsElliptic] (hi:i^2= -1) :
    CurvePoints (E n) L →+ CurvePoints (E n) L := by
  letI : ((E n).baseChange L).IsElliptic := by change ((E n).map (algebraMap F L)).IsElliptic; infer_instance
  exact quarter (base_E (L:=L) n) (algebraMap F L i) (by simpa only [map_pow,map_neg,map_one] using congrArg (algebraMap F L) hi)

lemma act_baseI (n i:F) [(E n).IsElliptic] (hi:i^2= -1) (σ:L≃ₐ[F]L) (x:CurvePoints (E n) L) :
    baseI n i hi (act (E n) σ x)=act (E n) σ (baseI n i hi x) := by
  cases x with
  | zero => rfl
  | some x y h =>
    change Affine.Point.some _ _ _ = Affine.Point.some _ _ _
    rw [Affine.Point.some.injEq]
    constructor
    · exact (map_neg σ x).symm
    · change algebraMap F L i * σ y = σ ((algebraMap F L i)*y)
      rw [map_mul,σ.commutes]

lemma map_baseI (n i:F) [(E n).IsElliptic] (hi:i^2= -1) (x:CurvePoints (E n) F) :
    baseI n i hi (Affine.Point.baseChange (W':=(E n).toAffine) F L x)=
      Affine.Point.baseChange F L (baseI n i hi x) := by
  cases x with
  | zero => rfl
  | some x y h =>
    change Affine.Point.some _ _ _ = Affine.Point.some _ _ _
    rw [Affine.Point.some.injEq]
    constructor
    · exact (map_neg (algebraMap F L) x).symm
    · change algebraMap F L i * algebraMap F L y = algebraMap F L (i*y)
      rw [map_mul]

end TunnellGaussianEnd
