import Mathlib.RingTheory.PowerSeries.WeierstrassPreparation
import Mathlib.RingTheory.Polynomial.Eisenstein.Basic
import Mathlib.Tactic

/-! # The Eisenstein equations for a height-one division series -/

namespace TunnellFormalEisenstein

open IsLocalRing
open scoped PowerSeries Polynomial

variable {O : Type*} [CommRing O] [IsLocalRing O]
  [IsAdicComplete (maximalIdeal O) O]

/-- If the constant coefficient has valuation one and the first unit coefficient
is in degree d, the prepared polynomial is Eisenstein of degree d. -/
theorem prepare (g : O⟦X⟧) {d : ℕ}
    (h₀ : PowerSeries.constantCoeff g ∉ maximalIdeal O ^ 2)
    (hbelow : ∀ j < d, PowerSeries.coeff j g ∈ maximalIdeal O)
    (hd : PowerSeries.coeff d g ∉ maximalIdeal O) :
    ∃ (P : O[X]) (U : O⟦X⟧), g.IsWeierstrassFactorization P U ∧
      P.natDegree = d ∧ P.IsEisensteinAt (maximalIdeal O) := by
  have horder : (g.map (residue O)).order = d := by
    apply PowerSeries.order_eq_nat.mpr
    simpa only [Ne, PowerSeries.coeff_map, residue_eq_zero_iff] using And.intro hd hbelow
  have hne : g.map (residue O) ≠ 0 := by
    intro he
    simp [he] at horder
  obtain ⟨P,U,hPU⟩ := PowerSeries.exists_isWeierstrassFactorization hne
  refine ⟨P,U,hPU, by simp [hPU.natDegree_eq_toNat_order_map,horder], ?_⟩
  apply hPU.isDistinguishedAt.monic.isEisensteinAt_of_mem_of_notMem
    (Ideal.IsMaximal.ne_top inferInstance) hPU.isDistinguishedAt.mem
  intro h
  apply h₀
  rw [hPU.eq_mul,map_mul]
  exact Ideal.mul_mem_right _ _ (by simpa using h)

/-- The first division level has degree p−1. A root of the prepared
polynomial is a nontrivial formal division parameter. -/
theorem first_level (F : O⟦X⟧) {d : ℕ}
    (hz : PowerSeries.constantCoeff F = 0)
    (hlinear : PowerSeries.coeff 1 F ∉ maximalIdeal O ^ 2)
    (hbelow : ∀ j < d, PowerSeries.coeff (j+1) F ∈ maximalIdeal O)
    (hd : PowerSeries.coeff (d+1) F ∉ maximalIdeal O) :
    ∃ (P : O[X]) (U : O⟦X⟧), F = PowerSeries.X * (P : O⟦X⟧) * U ∧
      IsUnit U ∧ P.Monic ∧ P.natDegree = d ∧ P.IsEisensteinAt (maximalIdeal O) := by
  let G := PowerSeries.mk (R := O) (fun k => PowerSeries.coeff (k+1) F)
  have hG : F = PowerSeries.X * G := by
    ext k
    cases k with
    | zero => simpa [PowerSeries.coeff_zero_eq_constantCoeff] using hz
    | succ k => simp [G, PowerSeries.coeff_succ_X_mul]
  obtain ⟨P,U,h,dP,eP⟩ := prepare G (d:=d) (by simpa [G] using hlinear)
    (by simpa [G] using hbelow) (by simpa [G] using hd)
  exact ⟨P,U,by rw [hG,h.eq_mul,mul_assoc],h.isUnit,h.isDistinguishedAt.monic,dP,eP⟩

/-- Over a previous level, translating the division series by a uniformizer
gives the Eisenstein degree p equation for the next level. -/
theorem next_level (F : O⟦X⟧) {d : ℕ} {t : O} (ht : t ∈ maximalIdeal O)
    (ht₂ : t ∉ maximalIdeal O ^ 2)
    (hz : PowerSeries.constantCoeff F = 0)
    (hbelow : ∀ j < d, PowerSeries.coeff j F ∈ maximalIdeal O)
    (hd : PowerSeries.coeff d F ∉ maximalIdeal O) :
    ∃ (P : O[X]) (U : O⟦X⟧), (F-PowerSeries.C t).IsWeierstrassFactorization P U ∧
      P.natDegree = d ∧ P.IsEisensteinAt (maximalIdeal O) := by
  apply prepare
  · simpa [hz] using ht₂
  · intro j hj
    rw [map_sub]
    exact (maximalIdeal O).sub_mem (hbelow j hj) (by by_cases h : j=0 <;>
      simp [PowerSeries.coeff_C,h,ht])
  · have hd₀ : d ≠ 0 := by
      intro he
      subst d
      exact hd (by simpa [PowerSeries.coeff_zero_eq_constantCoeff, hz])
    simpa [PowerSeries.coeff_C,hd₀] using hd

#print axioms first_level
#print axioms next_level

end TunnellFormalEisenstein
