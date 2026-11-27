import TunnellNumberFieldSplitPrimes
import Mathlib.NumberTheory.Padics.RingHoms
import Mathlib.RingTheory.IntegralClosure.IntegrallyClosed

/-! The finitely many coordinates and inverse coordinate differences are integral
in every p-adic realization once p exceeds a fixed bound. -/
namespace TunnellPadicCoefficientBounds
open scoped nonZeroDivisors
noncomputable section
variable {F : Type*} [Field F] [NumberField F]

lemma integral_image {p : ℕ} [Fact p.Prime] (e : F →ₐ[ℚ] ℚ_[p]) {x : F} (hx : IsIntegral ℤ x) :
    ‖e x‖≤1 := by
  have hi : IsIntegral ℤ (e x) := hx.map (e.restrictScalars ℤ)
  obtain ⟨z,hz⟩ := (isIntegrallyClosed_iff ℚ_[p]).mp (inferInstance : IsIntegrallyClosed ℤ_[p])
    (hi.tower_top (A := ℤ_[p]))
  exact hz ▸ z.property

theorem bound (x : F) : ∃ B : ℕ, ∀ (p : ℕ) [Fact p.Prime], B<p →
    ∀ e : F →ₐ[ℚ] ℚ_[p], ‖e x‖≤1 := by
  obtain ⟨m,hm⟩ := IsIntegral.exists_multiple_integral_of_isLocalization ℤ⁰ x (Algebra.IsIntegral.isIntegral (R := ℚ) x)
  let d := m.val
  have hd0 : d≠0 := nonZeroDivisors.ne_zero m.property
  refine ⟨d.natAbs,?_⟩
  intro p hp hc e
  have hdiv : ¬p∣d.natAbs := fun h => (Nat.not_le_of_lt hc) (Nat.le_of_dvd (Int.natAbs_pos.mpr hd0) h)
  have hcop : IsCoprime d (p:ℤ) := Int.isCoprime_iff_nat_coprime.mpr (by simpa using ((Fact.out : p.Prime).coprime_iff_not_dvd.mpr hdiv).symm)
  have hh := integral_image e hm
  change ‖e (d • x)‖≤1 at hh
  rw [zsmul_eq_mul] at hh
  rw [map_mul,map_intCast,norm_mul,Padic.norm_intCast_eq_one_iff.mpr hcop,one_mul] at hh
  exact hh

theorem finite_bound (S : Finset F) : ∃ B : ℕ, ∀ (p : ℕ) [Fact p.Prime], B<p →
    ∀ e : F →ₐ[ℚ] ℚ_[p], ∀ x∈S, ‖e x‖≤1 := by
  choose b h using fun x : F => bound x
  exact ⟨S.sup b,fun p _ hp e x hx => h x p ((Finset.le_sup hx).trans_lt hp) e⟩

end
end TunnellPadicCoefficientBounds
#print axioms TunnellPadicCoefficientBounds.finite_bound
