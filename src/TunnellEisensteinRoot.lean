import Mathlib.RingTheory.Polynomial.Eisenstein.Basic
import Mathlib.RingTheory.LocalRing.ResidueField.Basic
import Mathlib.Tactic

/-! # A uniformizer relation at a root of an Eisenstein polynomial -/

namespace TunnellEisensteinRoot
open Polynomial IsLocalRing Finset

variable {A B:Type*} [CommRing A] [IsLocalRing A] [CommRing B] [IsLocalRing B]

/-- For an Eisenstein polynomial over a local ring with principal maximal
ideal, a root has d-th power associated to the base uniformizer. The residue
of the unit is the negative normalized constant coefficient. -/
theorem root_relation (f:A→+*B) [IsLocalHom f] {π:A}
    (hπ : maximalIdeal A = Ideal.span {π}) {P:A[X]} (hm:P.Monic)
    (he : P.IsEisensteinAt (maximalIdeal A)) (hd:0<P.natDegree)
    (t:B) (ht:P.eval₂ f t=0) :
    t ∈ maximalIdeal B ∧ ∃ (a:Aˣ) (u:Bˣ), P.coeff 0=π*a ∧
      t^P.natDegree=f π*u ∧ residue B (u:B) = -residue B (f (a:A)) := by
  classical
  have hπmem : π ∈ maximalIdeal A := hπ ▸ Ideal.mem_span_singleton_self π
  have hcoeff : ∀ j < P.natDegree, π ∣ P.coeff j := by
    intro j hj
    apply Ideal.mem_span_singleton.mp
    rw [←hπ]; exact he.mem hj
  choose! q hq using hcoeff
  have hq0 : IsUnit (q 0) := by
    by_contra hnon
    have hm₀ : q 0 ∈ maximalIdeal A := hnon
    exact he.notMem (by rw [hq 0 hd,pow_two]; exact Ideal.mul_mem_mul hπmem hm₀)
  let v := -(∑ j ∈ range P.natDegree, f (q j)*t^j)
  have hr : t^P.natDegree = f π * v := by
    rw [eval₂_eq_sum_range,sum_range_succ,hm.coeff_natDegree,map_one,one_mul] at ht
    have hl : (∑ j ∈ range P.natDegree, f (P.coeff j)*t^j) =
        f π * (∑ j ∈ range P.natDegree, f (q j)*t^j) := by
      rw [mul_sum]
      apply sum_congr rfl
      intro j hj
      rw [hq j (mem_range.mp hj),map_mul,mul_assoc]
    rw [hl] at ht
    dsimp [v]
    linear_combination ht
  have htmem : t ∈ maximalIdeal B := by
    apply (inferInstance : (maximalIdeal B).IsPrime).mem_of_pow_mem P.natDegree
    rw [hr]
    exact Ideal.mul_mem_right _ _ (map_nonunit f π hπmem)
  have hr₀ : residue B v = -residue B (f (q 0)) := by
    dsimp [v]
    rw [map_neg,map_sum]
    congr 1
    rw [sum_eq_single 0]
    · simp
    · intro j hj hj₀
      rw [map_mul,map_pow,(residue_eq_zero_iff _).mpr htmem,zero_pow hj₀,mul_zero]
    · simp [hd]
  have hvunit : IsUnit v := by
    rw [← isUnit_map_iff (residue B) v, isUnit_iff_ne_zero,hr₀]
    exact neg_ne_zero.mpr (((hq0.map f).map (residue B)).ne_zero)
  exact ⟨htmem,hq0.unit,hvunit.unit,by simpa using hq 0 hd,by simpa using hr,
    by simpa using hr₀⟩

#print axioms root_relation
end TunnellEisensteinRoot
