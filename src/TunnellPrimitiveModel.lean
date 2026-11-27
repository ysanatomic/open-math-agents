import TunnellPrimitiveCoordField

/-! # Primitive Gaussian division points on an arbitrary base change of the curve -/
namespace TunnellPrimitiveModel
open IsLocalRing IsDedekindDomain IsDedekindDomain.HeightOneSpectrum WeierstrassCurve WeierstrassCurve.Affine
open TunnellCoates TunnellKummer TunnellCMTorsionField TunnellFormalQuarter TunnellGaussianEnd
open scoped Polynomial
noncomputable section
variable {R K:Type} [CommRing R] [IsDedekindDomain R] [Field K] [CharZero K] [Algebra R K] [IsFractionRing R K]
    {v : HeightOneSpectrum R} [DecidableEq (v.adicCompletion K)]
local notation "O" => v.adicCompletionIntegers K
local notation "L" => v.adicCompletion K

theorem on_model (n i:O) (hi:i^2= -1) {p:ℕ} (a:GaussianInt) (hnorm:a.re^2+a.im^2=(p:ℤ))
    (hu:IsUnit ((a.re:O)-(a.im:O)*i)) (r:ℕ) (Z:(E n).formalGroupLaw.Points) (hz:addOrderOf Z=p^r)
    (W:WeierstrassCurve L) [W.IsElliptic] (hW:W=E (n:L)) :
    ∃ T : W.toAffine.Point,
      T=formalPoint ((base_curve n).trans hW.symm) Z ∧ addOrderOf T=p^r ∧
      endo (quarter hW (i:L) (by exact_mod_cast hi)) (a^r).re (a^r).im T=0 := by
  subst W
  have hk : p^r • Z=0 := hz ▸ addOrderOf_nsmul_eq_zero Z
  have he : quarter (n:=(n:L)) rfl (i:L) (by exact_mod_cast hi)=
      TunnellLocalCM.gaussianI (n:L) (i:L) (by exact_mod_cast hi) := by ext T; cases T <;> rfl
  let T := toPoint n Z
  have hI := TunnellLocalCM.gaussianI_square (n:L) (i:L) (by exact_mod_cast hi)
  refine ⟨T,rfl,(addOrderOf_injective (toPoint n) (formalPoint_injective (base_curve n)) Z).trans hz,?_⟩
  rw [he,← TunnellLocalCMCoordDegree.endo_iterate _ hI]
  exact TunnellFormalPrimaryCM.primary_of_nsmul n i hi a.re a.im hnorm hu r Z hk

theorem order_in_place {A:Type} [CommRing A] [IsLocalRing A] (f:A→+*O) (n:A) {p:ℕ} [Fact p.Prime]
    (hl:f (PowerSeries.coeff 1 ((E n).formalGroupLaw.mulSeries p))≠0)
    (r:ℕ) {P:A[X]} {U:PowerSeries A}
    (hfac:(TunnellFormalPrimitive.primitive ((E n).formalGroupLaw.mulSeries p) r).IsWeierstrassFactorization P U)
    {t:O} (ht:t∈maximalIdeal O) (hroot:P.eval₂ f t=0) :
    addOrderOf (show (E (f n)).formalGroupLaw.Points from fun _ => ⟨t,ht⟩)=p^(r+1) := by
  haveI : CharZero L := charZero_of_injective_algebraMap (algebraMap K L).injective
  haveI : CharZero O := (algebraMap O L).charZero
  have h := TunnellFormalPrimitivePoint.root_of_prepared f (E n) hl r hfac ht hroot
  have hW : (E n).map f=E (f n) := by ext <;> simp [E,WeierstrassCurve.map]
  rwa [hW] at h

#print axioms on_model
#print axioms order_in_place
end
end TunnellPrimitiveModel
