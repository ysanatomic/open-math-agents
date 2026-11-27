module
public import TunnellCMUnitCriterion
public import EllipticCurves.VariableChange
public import Mathlib.NumberTheory.NumberField.Ideal.Basic
import all EllipticCurves.WeierstrassFormalGroup.Foundations

@[expose] public section

/-! Local valuation of the signed division product in arbitrary Weierstrass coordinates. -/
namespace TunnellCMModelUnit
set_option maxHeartbeats 1100000

open WeierstrassCurve WeierstrassCurve.Affine IsDedekindDomain IsDedekindDomain.HeightOneSpectrum
open IsLocalRing NumberField TunnellCMLocalUnit TunnellCMUnitCriterion
open scoped NumberField

variable {F : Type*} [Field F] {W : WeierstrassCurve F}

def X : W.toAffine.Point → F
  | .zero => 0
  | .some x _ _ => x

def Y : W.toAffine.Point → F
  | .zero => 0
  | .some _ y _ => y

theorem nonsingular (P : W.toAffine.Point) (h : P ≠ 0) : W.toAffine.Nonsingular (X P) (Y P) := by
  cases P with
  | zero => exact (h rfl).elim
  | some x y hp => exact hp

theorem coords (P : W.toAffine.Point) (h : P ≠ 0) :
    Point.some (X P) (Y P) (nonsingular P h) = P := by
  cases P with
  | zero => exact (h rfl).elim
  | some => rfl

theorem X_change [DecidableEq F] [W.IsElliptic] (C : VariableChange F)
    (P : (C • W).toAffine.Point) (h : P ≠ 0) :
    X (Point.equivVariableChange W C P) = (C.u : F)^2 * X P + C.r := by
  cases P with
  | zero => exact (h rfl).elim
  | some => rfl

variable {R K : Type*} [CommRing R] [IsDedekindDomain R] [Field K] [CharZero K]
  [Algebra R K] [IsFractionRing R K] {v : HeightOneSpectrum R}

theorem in_model (E : WeierstrassCurve (v.adicCompletion K)) [E.IsElliptic]
    (C : VariableChange (v.adicCompletion K)) (W₀ : WeierstrassCurve (v.adicCompletionIntegers K))
    (hW : W₀.map (algebraMap _ (v.adicCompletion K)) = C • E) [W₀.IsElliptic]
    [DecidableEq (v.adicCompletion K)] [DecidableEq (ResidueField (v.adicCompletionIntegers K))]
    {ι κ : Type*} [Fintype ι] [Fintype κ] (w : ι → ℤ) (hw : ∑ i, w i = 0)
    (U : ι → E.toAffine.Point) (V : E.toAffine.Point) (Q : κ → E.toAffine.Point)
    {l q f m a : ℕ} (hl : l.Prime) (hq : q.Prime) (hql : q ≠ l)
    (hlm : (l : v.adicCompletionIntegers K) ∈ maximalIdeal _)
    (hf : 0 < f) (hqf : q ∣ f) (hc : q.Coprime (a*m))
    (hU : ∀ i, addOrderOf (U i) = f) (hV : m • V = 0)
    (hQ : ∀ j, a • Q j = 0) (hQ0 : ∀ j, Q j ≠ 0) :
    Valued.v (∏ i, (∏ j, (X (U i + V) - X (Q j))) ^ w i) = 1 := by
  let e := Point.equivVariableChange E C
  let P i := e.symm (U i + V)
  let T j := e.symm (Q j)
  have hT0 j : T j ≠ 0 := fun h => hQ0 j (e.symm.injective (h.trans (map_zero e.symm).symm))
  have hT j : a • T j = 0 := by dsimp [T]; rw [← map_nsmul,hQ,map_zero]
  have hP i : a • adicRed hW (P i) ≠ 0 := by
    dsimp [P]
    rw [map_add]
    exact separated hW hl hq hql hlm hf hqf hc (e.symm (U i)) (e.symm V)
      ((addOrderOf_injective e.symm.toAddMonoidHom e.symm.injective (U i)).trans (hU i))
      (by rw [← map_nsmul,hV,map_zero])
  have hP0 i : P i ≠ 0 := by
    intro hh
    apply hP i
    rw [hh,show adicRed hW 0 = 0 from (adicRedHom hW).map_zero,nsmul_zero]
  have hx i j : X (U i + V)-X (Q j)=(C.u : v.adicCompletion K)^2*(X (P i)-X (T j)) := by
    have eP := X_change C (P i) (hP0 i)
    have eT := X_change C (T j) (hT0 j)
    change X (e (e.symm (U i + V))) = _ at eP
    change X (e (e.symm (Q j))) = _ at eT
    rw [e.apply_symm_apply] at eP eT
    rw [eP,eT]
    ring
  simp_rw [hx]
  apply valuation_one hW Finset.univ Finset.univ w hw
    (fun i => X (P i)) (fun i => Y (P i)) (fun j => X (T j)) (fun j => Y (T j)) _
    (pow_ne_zero _ C.u.ne_zero) (fun i => nonsingular _ (hP0 i)) (fun j => nonsingular _ (hT0 j)) a
  · intro j _; rw [coords _ (hT0 j)]; exact hT j
  · intro i _; rw [coords _ (hP0 i)]; exact hP i

theorem residue_prime (K : Type*) [Field K] [NumberField K] (v : HeightOneSpectrum (𝓞 K)) :
    ∃ l : ℕ, l.Prime ∧ (l : v.adicCompletionIntegers K) ∈ maximalIdeal _ := by
  let S := 𝓞 K ⧸ v.asIdeal
  let l := ringChar S
  have hl : (l : 𝓞 K) ∈ v.asIdeal := Ideal.Quotient.eq_zero_iff_mem.mp (by
    change Ideal.Quotient.mk v.asIdeal (l : 𝓞 K) = 0
    rw [map_natCast]
    exact CharP.cast_eq_zero S l)
  refine ⟨l,CharP.prime_ringChar S,?_⟩
  have hv := (v.valuation_lt_one_iff_mem (K := K) (l : 𝓞 K)).mpr hl
  have hx : Valued.v (l : v.adicCompletion K) < 1 := by
    have e := v.valuedAdicCompletion_eq_valuation' (l : K)
    change Valued.v (algebraMap K (v.adicCompletion K) (l : K)) = _ at e
    rw [map_natCast] at e
    rw [e]
    simpa using hv
  exact Valuation.Integer.not_isUnit_iff_valuation_lt_one.mpr hx

end TunnellCMModelUnit
#print axioms TunnellCMModelUnit.in_model
#print axioms TunnellCMModelUnit.residue_prime
