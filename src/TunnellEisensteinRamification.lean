import TunnellEisensteinRoot
import Mathlib.NumberTheory.RamificationInertia.Ramification
import Mathlib.RingTheory.DiscreteValuationRing.Basic
import ValuedFieldTheory.LocalField.NonarchimedeanLocalField.ResidueExtension

/-! The ramification index of a local field containing a primitive Eisenstein parameter. -/
namespace TunnellEisensteinRamification

open IsLocalRing Polynomial
open scoped NumberField

private theorem power_bound {A B:Type*} [CommRing A] [CommRing B] [Algebra A B]
    {M:Ideal A} {N:Ideal B} (hne : M.ramificationIdx' N ≠ 0) {d:ℕ}
    (hle : Ideal.map (algebraMap A B) M ≤ N^d) : d ≤ M.ramificationIdx' N := by
  classical
  let S : Set ℕ := {k | Ideal.map (algebraMap A B) M ≤ N^k}
  change d ≤ sSup S
  apply le_csSup _ hle
  by_contra h
  exact hne (by change sSup S=0; simp [csSup_of_not_bddAbove h])

theorem index_eq_degree {A B:Type*} [CommRing A] [IsLocalRing A]
    [CommRing B] [IsDomain B] [IsDiscreteValuationRing B] [Algebra A B] [IsLocalHom (algebraMap A B)]
    {π:A} (hπ : maximalIdeal A=Ideal.span {π}) {P:A[X]} (hm:P.Monic)
    (he:P.IsEisensteinAt (maximalIdeal A)) (hd:0<P.natDegree)
    (t:B) (ht:P.eval₂ (algebraMap A B) t=0)
    {D f:ℕ} (hD:0<D) (hef:(maximalIdeal A).ramificationIdx' (maximalIdeal B)*f=D)
    (hmax:D≤P.natDegree) :
    (maximalIdeal A).ramificationIdx' (maximalIdeal B)=P.natDegree ∧
    D=P.natDegree ∧ f=1 ∧ maximalIdeal B=Ideal.span {t} := by
  let e := (maximalIdeal A).ramificationIdx' (maximalIdeal B)
  have hprod : e*f=D := hef
  have he0 : e≠0 := by intro h; rw [h,zero_mul] at hprod; omega
  have hf0 : f≠0 := by intro h; rw [h,mul_zero] at hprod; omega
  obtain ⟨htm,a,u,_,hpow,_⟩ := TunnellEisensteinRoot.root_relation _ hπ hm he hd t ht
  have hspan : Ideal.map (algebraMap A B) (maximalIdeal A)=Ideal.span {t^P.natDegree} := by
    rw [hπ,Ideal.map_span,Set.image_singleton,Ideal.span_singleton_eq_span_singleton]
    exact ⟨u,hpow.symm⟩
  have hl (k:ℕ) (htk:t∈maximalIdeal B^k) : k*P.natDegree≤e := by
    apply power_bound he0
    rw [hspan,Ideal.span_singleton_le_iff_mem,pow_mul]
    exact Ideal.pow_mem_pow htk P.natDegree
  have hle : P.natDegree≤e := by simpa using hl 1 (by simpa using htm)
  have heD : e≤D := by rw [←hprod]; exact Nat.le_mul_of_pos_right _ (Nat.pos_of_ne_zero hf0)
  have heq : e=P.natDegree := le_antisymm (heD.trans hmax) hle
  refine ⟨heq,le_antisymm hmax (hle.trans heD),?_,?_⟩
  · apply Nat.eq_of_mul_eq_mul_left (Nat.pos_of_ne_zero he0)
    rw [hprod,mul_one]; omega
  · apply (IsDiscreteValuationRing.irreducible_iff_uniformizer t).mp
    refine ⟨htm,?_⟩
    intro x y h
    by_contra! hxy
    have hsq : t∈maximalIdeal B^2 := by rw [h,pow_two]; exact Ideal.mul_mem_mul hxy.1 hxy.2
    have h2 := hl 2 hsq
    omega

#print axioms index_eq_degree
end TunnellEisensteinRamification
