import TunnellFormalPrimaryCM
import TunnellGaussianDivisionField
import TunnellCMGoodInertiaAction

/-! Inertia at the conjugate ordinary prime fixes every Gaussian division lift. -/
namespace TunnellConjugateInertia
open IsLocalRing IsDedekindDomain IsDedekindDomain.HeightOneSpectrum WeierstrassCurve WeierstrassCurve.Affine
open TunnellCoates TunnellGaussianEnd TunnellFormalQuarter TunnellKummer TunnellCMGlobalModelUnit
open scoped NumberField
noncomputable section
section Local
variable {R K:Type*} [CommRing R] [IsDedekindDomain R] [Field K] [CharZero K] [Algebra R K] [IsFractionRing R K]
    {v:HeightOneSpectrum R} [DecidableEq (v.adicCompletion K)] [DecidableEq (ResidueField (v.adicCompletionIntegers K))]
local notation "O" => v.adicCompletionIntegers K
local notation "L" => v.adicCompletion K

theorem kernel (n i:O) (hi:i^2= -1) {W:WeierstrassCurve L} [W.IsElliptic] [(E n).IsElliptic]
    (h:W=E (n:L)) (a b:ℤ) (hu:IsUnit ((a:O)+(b:O)*i)) (r:ℕ) (P:W.toAffine.Point)
    (hred:adicRed ((base_curve n).trans h.symm) P=0)
    (hdiv:(endo (quarter h (i:L) (by exact_mod_cast hi)) a b)^[r] P=0) : P=0 := by
  subst W
  let I := TunnellLocalCM.gaussianI (n:L) (i:L) (by exact_mod_cast hi)
  let ψ := endo I a b
  let U := filtration (base_curve n) 0
  have he : quarter (n:=(n:L)) rfl (i:L) (by exact_mod_cast hi)=I := by ext x; cases x <;> rfl
  rw [he] at hdiv
  have inside (z:(E n).formalGroupLaw.Points) : toPoint n z∈U :=
    (mem_pow_iff_formalPoint_mem_filtration (hW:=base_curve n) z 0).mp (by simpa using (z ()).2)
  have stable (T:(E (n:L)).toAffine.Point) (ht:T∈U) : ψ T∈U := by
    obtain ⟨z,rfl⟩ := formalPoint_surjective (hW:=base_curve n) ht
    exact U.add_mem (U.zsmul_mem ht _) (U.zsmul_mem ((quarter_toPoint n i hi z) ▸ inside (quarterParam n i z)) _)
  have hk (T:(E (n:L)).toAffine.Point) (ht:T∈U) (hz:ψ T=0) : T=0 := by
    obtain ⟨z,rfl⟩ := formalPoint_surjective (hW:=base_curve n) ht
    have hh := TunnellFormalPrimaryCM.unit_kernel n i hi a b hu z hz
    change toPoint n z=0
    rw [hh,map_zero]
  have ht : P∈U := (adicRed_eq_zero_iff (base_curve n)).mp hred
  change ψ^[r] P=0 at hdiv
  clear hred
  induction r generalizing P with
  | zero => exact hdiv
  | succ r ih =>
    rw [Function.iterate_succ_apply] at hdiv
    exact hk P ht (ih _ (stable P ht) hdiv)

theorem same (n i:O) (hi:i^2= -1) {W:WeierstrassCurve L} [W.IsElliptic] [(E n).IsElliptic]
    (h:W=E (n:L)) (a b:ℤ) (hu:IsUnit ((a:O)+(b:O)*i)) (r:ℕ) (P Q:W.toAffine.Point)
    (hred:adicRed ((base_curve n).trans h.symm) P=adicRed ((base_curve n).trans h.symm) Q)
    (hdiv:(endo (quarter h (i:L) (by exact_mod_cast hi)) a b)^[r] P=
      (endo (quarter h (i:L) (by exact_mod_cast hi)) a b)^[r] Q) : P=Q := by
  apply sub_eq_zero.mp
  apply kernel n i hi h a b hu r
  · change adicRedHom ((base_curve n).trans h.symm) (P-Q)=0
    rw [map_sub,sub_eq_zero]; exact hred
  · let f:=endo (quarter h (i:L) (by exact_mod_cast hi)) a b
    have hh (s:ℕ) : f^[s] (P-Q)=f^[s] P-f^[s] Q := by
      induction s with
      | zero => rfl
      | succ s ih => rw [Function.iterate_succ_apply',Function.iterate_succ_apply',Function.iterate_succ_apply',ih,map_sub]
    exact (hh r).trans (sub_eq_zero.mpr hdiv)
end Local

variable {F N:Type*} [Field F] [Field N] [NumberField N] [Algebra F N] [DecidableEq N] [DecidableEq F]
    (v:HeightOneSpectrum (𝓞 N))
local notation "O" => v.adicCompletionIntegers N
local notation "L" => v.adicCompletion N
theorem inertia_fixes (n:ℕ) (i:F) [(E (n:F)).IsElliptic] (hi:i^2= -1)
    (j:O) (hj:j^2= -1) (hji:(j:L)=algebraMap N L (algebraMap F N i))
    [DecidableEq L] [DecidableEq (ResidueField O)] [(E (n:O)).IsElliptic]
    (a b:ℤ) (hu:IsUnit ((a:O)+(b:O)*j)) (r:ℕ)
    (σ:Gal(N/F)) (hσ:σ∈v.asIdeal.inertia Gal(N/F)) (P:CurvePoints (E (n:F)) N)
    (hP:act (E (n:F)) σ ((endo (baseI (n:F) i hi) a b)^[r] P)=(endo (baseI (n:F) i hi) a b)^[r] P) :
    act (E (n:F)) σ P=P := by
  let W := E (n:F)
  let W' := W.baseChange N
  let W'' := W'.baseChange L
  letI : W'.IsElliptic := inferInstanceAs ((W.map (algebraMap F N)).IsElliptic)
  letI : W''.IsElliptic := inferInstanceAs ((W'.map (algebraMap N L)).IsElliptic)
  have e : W''=E ((n:O):L) := by dsimp [W'',W',W]; rw [base_E,base_E,map_natCast,map_natCast]
  let M := pointMap W' L
  let I : AddMonoid.End (CurvePoints W N) := baseI (n:F) i hi
  let J := quarter e (j:L) (by exact_mod_cast hj)
  have compat (x:CurvePoints W N) : J (M x)=M (I x) := by
    cases x with
    | zero => rfl
    | some x y hh =>
      change Point.some _ _ _=Point.some _ _ _
      rw [Point.some.injEq]
      exact ⟨(map_neg _ _).symm,by change (j:L)*algebraMap N L y=algebraMap N L (algebraMap F N i*y); rw [map_mul,hji]⟩
  have hp := iterate_compatible (act W σ) I I (act_baseI (n:F) i hi σ) a b r P
  apply pointMap_inj W' L
  apply same (n:O) j hj e a b hu r
  · exact TunnellCMGoodInertiaAction.reduction_invariant v W (E (n:O)) _ σ hσ P
  · exact (iterate_compatible M I J compat a b r _).trans
      ((congrArg M (hp.trans hP)).trans (iterate_compatible M I J compat a b r _).symm)

#print axioms kernel
#print axioms inertia_fixes
end
end TunnellConjugateInertia
