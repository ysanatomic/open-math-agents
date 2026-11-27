import TunnellCMRelativeOrbitNorm
import Mathlib.RingTheory.Norm.Transitivity

/-! Signed one-step norm identities give universal norms from every division level. -/
namespace TunnellCMUniversalNorm
open TunnellCMRelativeOrbitNorm
noncomputable section
variable {K B : Type} [Field K] [Field B] [Algebra K B]
theorem transitive {L M H : IntermediateField K B} (a : L≤M) (b : M≤H) (x : H) :
    relativeNorm a (relativeNorm b x)=relativeNorm (a.trans b) x := by
  letI : Algebra L M := (IntermediateField.inclusion a).toAlgebra
  letI : Algebra M H := (IntermediateField.inclusion b).toAlgebra
  letI : Algebra L H := (IntermediateField.inclusion (a.trans b)).toAlgebra
  letI : IsScalarTower L M H := .of_algebraMap_eq' rfl
  exact Algebra.norm_norm

theorem norm_powers {L H : IntermediateField K B} (a : L≤H) [FiniteDimensional K H]
    (u : H) (k : ℤ) : relativeNorm a (u^k)=(relativeNorm a u)^k := by
  letI : Algebra L H := (IntermediateField.inclusion a).toAlgebra
  letI : IsScalarTower K L H := .of_algebraMap_eq' rfl
  letI : FiniteDimensional L H := Module.Finite.of_restrictScalars_finite K L H
  exact Algebra.norm_zpow u k

theorem self {L : IntermediateField K B} (x : L) : relativeNorm (le_refl L) x=x := by
  unfold relativeNorm
  have e : (IntermediateField.inclusion (le_refl L)).toAlgebra=Algebra.id L := by
    apply Algebra.algebra_ext; intro x; rfl
  change @Algebra.norm L L _ _ ((IntermediateField.inclusion (le_refl L)).toAlgebra) x=x
  rw [e,Algebra.norm_self]
  rfl

theorem all_levels (A : ℕ → IntermediateField K B) [∀ r, FiniteDimensional K (A r)] (inc : ∀ r, A r≤A (r+1))
    (u : (r : ℕ) → A r) (ε : ℤ) (hs : ε*ε=1)
    (H : ∀ r, 0<r → relativeNorm (inc r) (u (r+1))=u r^ε) (r : ℕ) :
    ∃ h : A 1≤A (r+1), relativeNorm h ((u (r+1))^(ε^r))=u 1 := by
  induction r with
  | zero =>
    refine ⟨le_rfl,?_⟩
    simp only [pow_zero,zpow_one]
    exact self _
  | succ r ih =>
    obtain ⟨h,hprev⟩:=ih
    refine ⟨h.trans (inc (r+1)),?_⟩
    rw [←transitive h (inc (r+1)),norm_powers,H _ (by omega),←zpow_mul]
    have hx : ε*(ε^(r+1))=ε^r := by rw [pow_succ',←mul_assoc,hs,one_mul]
    rw [hx,hprev]

end
end TunnellCMUniversalNorm
#print axioms TunnellCMUniversalNorm.all_levels
