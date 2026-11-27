import TunnellCMTorsionField
import Mathlib.FieldTheory.AlgebraicClosure

/-! The finite abelian field of Gaussian division coordinates in the complex uniformization. -/
namespace TunnellCMDivisionExtension

open Complex LSG.Weierstrass TunnellCMLemniscate TunnellCMToricDivision TunnellCMTorsionField
open WeierstrassCurve TunnellCoates TunnellKummer TunnellGaussianEnd

noncomputable section

lemma model_cyclic {W : WeierstrassCurve ℂ} [W.IsElliptic] (n : ℕ) (hn : 0<n) (e : W=E (n:ℂ))
    (a : GaussianInt) (ha : a≠0) : ∃ T : W.toAffine.Point,
    endo (quarter e I I_sq) a.re a.im T=0 ∧
    ∀ P, endo (quarter e I I_sq) a.re a.im P=0 ↔ ∃ b : GaussianInt, endo (quarter e I I_sq) b.re b.im T=P := by
  have e' : W=curve (twistPeriods n hn) := e.trans (curve_eq n hn).symm
  cases e'
  exact cyclic_kernel n hn a ha

variable {F : Type*} [Field F] [CharZero F] [DecidableEq F] [Algebra F ℂ]

lemma complex_cyclic (n : ℕ) (hn : 0<n) [(E (n:F)).IsElliptic] (i : F) (hi : i^2 = -1)
    (hI : algebraMap F ℂ i=I) (a : GaussianInt) (ha : a≠0) :
    ∃ T : CurvePoints (E (n:F)) ℂ, cm (n:F) i hi a T=0 ∧
      ∀ P, cm (n:F) i hi a P=0 ↔ ∃ b, cm (n:F) i hi b T=P := by
  have hW : (E (n:F)).baseChange ℂ=E (n:ℂ) := by rw [base_E,map_natCast]
  letI : ((E (n:F)).baseChange ℂ).IsElliptic := inferInstanceAs (((E (n:F)).map (algebraMap F ℂ)).IsElliptic)
  have he : baseI (L := ℂ) (n:F) i hi=quarter hW I I_sq := by
    ext P
    cases P with
    | zero => rfl
    | some x y hh =>
      change Affine.Point.some _ _ _=Affine.Point.some _ _ _
      rw [Affine.Point.some.injEq]
      exact ⟨rfl,congrArg (·*y) hI⟩
  simp only [cm,he]
  exact model_cyclic n hn hW a ha

lemma rational_kernel (n : ℕ) (hn : 0<n) [(E (n:F)).IsElliptic] (i : F) (hi : i^2 = -1)
    (a : GaussianInt) (ha : a≠0) (P : CurvePoints (E (n:F)) ℂ) (hp : cm (n:F) i hi a P=0) :
    P ∈ rationalPoints (E (n:F)) (algebraicClosure F ℂ) := by
  let m := a.re.natAbs^2+a.im.natAbs^2
  have hpos : 0 < m := by
    by_contra! h
    have h1 : a.re.natAbs^2=0 := by dsimp [m] at h; omega
    have h2 : a.im.natAbs^2=0 := by dsimp [m] at h; omega
    exact ha (Zsqrtd.ext (by simpa using h1) (by simpa using h2))
  let J := baseI (L := ℂ) (n:F) i hi
  have hJ : ∀ x, J (J x)= -x := by
    intro x
    letI : ((E (n:F)).baseChange ℂ).IsElliptic := inferInstanceAs (((E (n:F)).map (algebraMap F ℂ)).IsElliptic)
    exact quarter_sq (base_E (n:F)) _ _ x
  have hnorm : a.re^2+a.im^2=(m:ℤ) := by
    dsimp [m]
    push_cast
    simp [sq,Int.natAbs_mul_self']
  have h := gaussian_kernel_annihilated J hJ a.re a.im hnorm 1 P (by rw [Function.iterate_one]; exact hp)
  rw [pow_one] at h
  cases P with
  | zero => exact (rationalPoints _ _).zero_mem
  | some x y he =>
    apply (rationalPoints_some _ he).mpr
    have hw : (E (n:F)).baseChange ℂ=(TunnellCMTranscendental.E n).baseChange ℂ := by
      rw [base_E,map_natCast,TunnellCMTranscendental.model]; rfl
    have hx : IsAlgebraic ℚ x := by
      apply TunnellCMTranscendental.torsion_x_algebraic n m hn hpos
      rw [← hw]
      exact ⟨y,he,h⟩
    have hy : y^2=x^3-(n:ℂ)^2*x := by
      have hh := he.1
      rw [base_E,map_natCast] at hh
      exact (E_equation _ _ _).mp hh
    have hx' := mem_algebraicClosure_iff.mpr (hx.tower_top F)
    let B := algebraicClosure F ℂ
    refine ⟨hx', mem_algebraicClosure_iff.mpr (IsAlgebraic.of_pow (n := 2) (by decide) ?_)⟩
    rw [hy]
    exact mem_algebraicClosure_iff.mp (B.sub_mem (B.pow_mem hx' (3:ℕ)) (B.mul_mem (B.pow_mem (B.natCast_mem n) (2:ℕ)) hx'))

theorem division_extension (n : ℕ) (hn : 0<n) [(E (n:F)).IsElliptic] (i : F) (hi : i^2= -1)
    (hI : algebraMap F ℂ i=I) (a : GaussianInt) (ha : a≠0) :
    ∃ T : CurvePoints (E (n:F)) (algebraicClosure F ℂ),
      cm (n:F) i hi a T=0 ∧ (∀ P, cm (n:F) i hi a P=0 ↔ ∃ b, cm (n:F) i hi b T=P) ∧
      IsAbelianGalois F (coordField (E (n:F)) T) ∧ FiniteDimensional F (coordField (E (n:F)) T) := by
  classical
  let A := algebraicClosure F ℂ
  let W := E (n:F)
  let f := Affine.Point.map (W' := W.toAffine) A.val
  have hf := Affine.Point.map_injective (W' := W.toAffine) A.val
  obtain ⟨T,hT,ht⟩ := complex_cyclic n hn i hi hI a ha
  obtain ⟨U,hU⟩ := rational_kernel n hn i hi a ha T hT
  have u0 : cm (n:F) i hi a U=0 := hf (by rw [cm_map,hU,hT,map_zero])
  have ug (P : CurvePoints W A) : cm (n:F) i hi a P=0 ↔ ∃ b, cm (n:F) i hi b U=P := by
    constructor
    · intro hp
      obtain ⟨b,hb⟩ := (ht (f P)).mp (by change cm (n:F) i hi a (Affine.Point.map A.val P)=0; rw [← cm_map,hp,map_zero])
      refine ⟨b,hf ?_⟩
      rw [cm_map,hU]
      exact hb
    · rintro ⟨b,rfl⟩
      rw [cm_comm (n:F) i hi a b,u0,map_zero]
  refine ⟨U,u0,ug,abelian_of_cyclic (n:F) i hi a U u0 (fun P hp => (ug P).mp hp),?_⟩
  cases U with
  | zero => exact inferInstanceAs (FiniteDimensional F (⊥ : IntermediateField F A))
  | some x y he =>
    change FiniteDimensional F (IntermediateField.adjoin F ({x,y}:Set A))
    apply IntermediateField.finiteDimensional_adjoin
    intro z hz
    exact (Algebra.IsAlgebraic.isAlgebraic (R := F) z).isIntegral

end
end TunnellCMDivisionExtension

#print axioms TunnellCMDivisionExtension.division_extension
