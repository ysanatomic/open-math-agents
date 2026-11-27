import TunnellGeometricPrimaryKernel
import TunnellRamifiedDivision

/-! The ordinary p-power multiple of a primary division lift is rational over
the base whenever its Gaussian multiple is rational over the base. -/
namespace TunnellCMRationalMultiple
open WeierstrassCurve WeierstrassCurve.Affine TunnellCoates TunnellKummer TunnellGaussianEnd
open TunnellCMTorsionField TunnellLocalCMCoordDegree
open scoped Classical
noncomputable section
variable {D M : Type} [Field D] [Field M] [Algebra D M] [IsGalois D M] [DecidableEq D] [DecidableEq M]
theorem rational (n : ℕ) [(E (n:D)).IsElliptic] (i : D) (hi : i^2= -1) (q : GaussianInt)
    {p : ℕ} (hq : q.re^2+q.im^2=(p:ℤ)) (r : ℕ) (Q : CurvePoints (E (n:D)) M)
    (h : ∀ σ : M ≃ₐ[D] M, act (E (n:D)) σ (cm (n:D) i hi (q^r) Q)=cm (n:D) i hi (q^r) Q) :
    ∃ P : CurvePoints (E (n:D)) D, p^r • Q=Point.map (W' := (E (n:D)).toAffine) (Algebra.ofId D M) P := by
  let W:=E (n:D)
  have hJ (x : CurvePoints W M) : baseI (n:D) i hi (baseI (n:D) i hi x)= -x := by
    letI : (W.baseChange M).IsElliptic := inferInstanceAs ((W.map (algebraMap D M)).IsElliptic)
    exact quarter_sq (base_E (n:D)) _ _ x
  have fix (σ : M ≃ₐ[D] M) : act W σ (p^r • Q)=p^r • Q := by
    let U:=act W σ Q-Q
    have h0 : cm (n:D) i hi (q^r) U=0 := by
      change cm _ _ _ _ (act W σ Q-Q)=0
      rw [map_sub,cm_act,h,sub_self]
    have e := gaussian_kernel_annihilated _ hJ _ _ hq r U ((endo_iterate _ hJ q r U).trans h0)
    change p^r • (act W σ Q-Q)=0 at e
    rw [map_nsmul]; exact sub_eq_zero.mp ((nsmul_sub _ _ _).symm.trans e)
  obtain ⟨P,hP⟩ := exists_point_of_rational W _ (point_rational_of_fixed W _ fix)
  exact ⟨P,hP.symm⟩

end
end TunnellCMRationalMultiple
#print axioms TunnellCMRationalMultiple.rational
