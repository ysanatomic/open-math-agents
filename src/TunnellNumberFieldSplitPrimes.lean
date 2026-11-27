import TunnellSimpleSplitPrimes
import Mathlib.FieldTheory.PrimitiveElement
import Mathlib.RingTheory.Localization.Integral
import Mathlib.RingTheory.Polynomial.Tower
import Mathlib.NumberTheory.NumberField.Basic

/-! Every number field embeds into the p-adic rationals for arbitrarily large primes. -/
namespace TunnellNumberFieldSplitPrimes
open Polynomial
open scoped Polynomial nonZeroDivisors
noncomputable section
theorem embeddings (F : Type*) [Field F] [NumberField F] (bound : ℕ) :
    ∃ p : ℕ, ∃ hp : p.Prime, bound < p ∧ Nonempty (F →ₐ[ℚ] @Padic p ⟨hp⟩) := by
  let b := Field.powerBasisOfFiniteOfSeparable ℚ F
  let f := minpoly ℚ b.gen
  let g := IsLocalization.integerNormalization ℤ⁰ f
  obtain ⟨d,hd,he⟩ := IsLocalization.integerNormalization_spec ℤ⁰ f
  have hd0 : (d:ℚ)≠0 := by exact_mod_cast nonZeroDivisors.ne_zero hd
  have hg : g.map (Int.castRingHom ℚ)=C (d:ℚ)*f := by
    change g.map (algebraMap ℤ ℚ)=_
    rw [he,← smul_eq_C_mul,Int.cast_smul_eq_zsmul]
  have positive : 0 < g.natDegree := by
    have inj : Function.Injective (Int.castRingHom ℚ) := Int.cast_injective
    rw [← natDegree_map_eq_of_injective (p := g) inj,hg,natDegree_C_mul hd0]
    exact minpoly.natDegree_pos (Algebra.IsIntegral.isIntegral b.gen)
  have sep : (g.map (Int.castRingHom ℚ)).Separable := by
    rw [hg,mul_comm]
    exact (Algebra.IsSeparable.isSeparable ℚ b.gen).mul_unit ((isUnit_iff_ne_zero.mpr hd0).map C)
  obtain ⟨p,hp,hle,z,hz⟩ := TunnellSimpleSplitPrimes.long_root g positive sep bound
  letI : Fact p.Prime := ⟨hp⟩
  let h := IsScalarTower.toAlgHom ℤ ℤ_[p] ℚ_[p]
  have heval : g.aeval (h z)=0 := (aeval_algHom_apply h z g).trans (hz ▸ h.map_zero)
  rw [← aeval_map_algebraMap ℚ] at heval
  change (g.map (Int.castRingHom ℚ)).aeval (h z)=0 at heval
  rw [hg,map_mul,aeval_C] at heval
  have root := (mul_eq_zero.mp heval).resolve_left ((algebraMap ℚ ℚ_[p]).injective.ne hd0)
  exact ⟨p,hp,hle,⟨b.lift (h z) root⟩⟩

end
end TunnellNumberFieldSplitPrimes
#print axioms TunnellNumberFieldSplitPrimes.embeddings
