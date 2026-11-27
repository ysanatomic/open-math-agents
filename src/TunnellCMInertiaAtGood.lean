module
public import TunnellCMModelUnit
import all EllipticCurves.WeierstrassFormalGroup.Reduction
@[expose] public section

/-! Inertia cannot move a prime-to-residue-characteristic division point on a good model. -/
namespace TunnellCMInertiaAtGood
open IsLocalRing WeierstrassCurve WeierstrassCurve.Affine TunnellCMLocalUnit TunnellCMModelUnit
open IsDedekindDomain IsDedekindDomain.HeightOneSpectrum WithZero
variable {R K : Type*} [CommRing R] [IsDedekindDomain R] [Field K] [CharZero K]
  [Algebra R K] [IsFractionRing R K] {v : HeightOneSpectrum R}
local notation "O" => v.adicCompletionIntegers K
local notation "L" => v.adicCompletion K
variable {W : Affine (v.adicCompletion K)} {W₀ : WeierstrassCurve (v.adicCompletionIntegers K)}
  (hW : W₀.map (algebraMap (v.adicCompletionIntegers K) (v.adicCompletion K)) = W)
  [DecidableEq (v.adicCompletion K)] [DecidableEq (ResidueField (v.adicCompletionIntegers K))]
  [W.IsElliptic] [W₀.IsElliptic]

theorem power_kernel {l p : ℕ} (hl : l.Prime) (hp : p.Prime) (hne : p≠l)
    (hchar : (l:O)∈maximalIdeal O) (r : ℕ) {P : W.Point}
    (hP : p^r • P=0) (hred : adicRed hW P=0) : P=0 := by
  induction r generalizing P with
  | zero => simpa using hP
  | succ r ih =>
    have h : p • P=0 := ih (P := p • P) (by simpa only [pow_succ',mul_nsmul] using hP)
      (by change adicRedHom hW (p • P)=0; rw [map_nsmul,show adicRedHom hW P=0 from hred,nsmul_zero])
    exact tame_kernel hW hl hp hne hchar h hred

theorem reduction_fixed {x y x' y' : L} {H : W.Nonsingular x y} {H' : W.Nonsingular x' y'}
    (hv : Valued.v x'=Valued.v x)
    (hx : ∀ (h₁ : Valued.v x'≤1) (h₂ : Valued.v x≤1),
      residue O (⟨x',h₁⟩:O)=residue O (⟨x,h₂⟩:O))
    (hy : ∀ (h₁ : Valued.v y'≤1) (h₂ : Valued.v y≤1),
      residue O (⟨y',h₁⟩:O)=residue O (⟨y,h₂⟩:O)) :
    adicRed hW (.some x' y' H')=adicRed hW (.some x y H) := by
  by_cases h : exp (2:ℤ) ≤ Valued.v x
  · rw [adicRed_some_of_mem hW h,adicRed_some_of_mem hW (hv ▸ h)]
  · rw [adicRed_some_of_not_mem hW h,adicRed_some_of_not_mem hW (hv ▸ h),Point.some.injEq]
    exact ⟨hx _ _,hy _ _⟩

theorem same_division {l p : ℕ} (hl : l.Prime) (hp : p.Prime) (hne : p≠l)
    (hchar : (l:O)∈maximalIdeal O) (r : ℕ) (P Q : W.Point)
    (hdiv : p^r • Q=p^r • P) (hr : adicRed hW Q=adicRed hW P) : Q=P := by
  apply sub_eq_zero.mp
  apply power_kernel hW hl hp hne hchar r
  · rwa [smul_sub,sub_eq_zero]
  · change adicRedHom hW (Q-P)=0
    rw [map_sub,sub_eq_zero]; exact hr

theorem reduction_of_integral_coordinates {x y x' y' : L} {H : W.Nonsingular x y} {H' : W.Nonsingular x' y'}
    (hv : Valued.v x'≤1 ↔ Valued.v x≤1)
    (hx : ∀ (h₁ : Valued.v x'≤1) (h₂ : Valued.v x≤1),
      residue O (⟨x',h₁⟩:O)=residue O (⟨x,h₂⟩:O))
    (hy : ∀ (h₁ : Valued.v y'≤1) (h₂ : Valued.v y≤1),
      residue O (⟨y',h₁⟩:O)=residue O (⟨y,h₂⟩:O)) :
    adicRed hW (.some x' y' H')=adicRed hW (.some x y H) := by
  have gate {u b : L} (H : W.Nonsingular u b) : ¬ exp (2:ℤ)≤Valued.v u ↔ Valued.v u≤1 :=
    ⟨fun h => (integral_of_not_mem hW H.1 h).1,fun h => not_exp_two_le_of_le_one h⟩
  by_cases h : Valued.v x≤1
  · rw [adicRed_some_of_not_mem hW ((gate H).mpr h),adicRed_some_of_not_mem hW ((gate H').mpr (hv.mpr h)),Point.some.injEq]
    exact ⟨hx _ _,hy _ _⟩
  · rw [adicRed_some_of_mem hW (not_not.mp ((gate H).not.mpr h)),
      adicRed_some_of_mem hW (not_not.mp ((gate H').not.mpr (hv.not.mpr h)))]

end TunnellCMInertiaAtGood
#print axioms TunnellCMInertiaAtGood.same_division
