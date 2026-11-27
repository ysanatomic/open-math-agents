import TunnellRankinContinue
import TunnellCMRegularized

/-! A weight-one Eisenstein lattice sum for the Rankin integral. Its auxiliary finite
difference removes the convergence restriction at the central point. -/

namespace TunnellRankinEisenstein

open Complex TunnellCMRegularized TunnellRankin TunnellTwistCharacter Set Finset
open UpperHalfPlane hiding I
open scoped ComplexConjugate Topology

lemma negative_quadratic {d : ℕ} (hd : 0<d) : (negCharacter d hd).IsQuadratic := by
  intro r
  change (negWeight d r.val : ℂ)=0 ∨ (negWeight d r.val : ℂ)=1 ∨ (negWeight d r.val : ℂ)= -1
  by_cases h : Odd r.val
  · simp only [negWeight,if_pos h]
    exact_mod_cast jacobiSym.trichotomy (-((2*d:ℕ):ℤ)) r.val
  · simp [negWeight,h]

lemma negative_primitive {d : ℕ} (hd : d%4=1) (hs : Squarefree d) :
    (negCharacter d (by omega)).IsPrimitive := by
  letI : NeZero (4*(2*d)) := ⟨by omega⟩
  apply primitive_of_witness
  intro p hp hpN
  obtain ⟨a,ha,he⟩ := primitive_witness hd hs hp hpN
  have hfour : 4∣4*(2*d)/p := by
    by_cases h : p=2
    · subst p; rw [show 4*(2*d)/2=4*d by omega]; exact dvd_mul_right _ _
    · have hnot : ¬p∣4 := by
        intro H
        have h' := hp.dvd_of_dvd_pow (n:=2) (by simpa using H : p∣2^2)
        exact h ((Nat.prime_dvd_prime_iff_eq hp Nat.prime_two).mp h')
      have hp' := (hp.dvd_mul.mp hpN).resolve_left hnot
      obtain ⟨t,ht⟩ := hp'
      rw [ht,←mul_assoc,mul_comm 4 p,mul_assoc,Nat.mul_div_cancel_left _ hp.pos]
      exact dvd_mul_right _ _
  refine ⟨a,ha,?_⟩
  rw [negCharacter_nat,negWeight_decompose,ZMod.χ₄_nat_one_mod_four (ha.of_dvd hfour),he]
  norm_num

/-- The physical lattice coordinates have horizontal period N and vertical period N·kz.
The conjugate periods allow the regularized holomorphic parameter s to retain the
denominator cz+t at s=1. -/
def periods (k : ℕ) [NeZero k] (z : ℍ) : PeriodPair where
  ω₁ := 1
  ω₂ := (k:ℂ)*conj (z:ℂ)
  indep := by
    apply LinearIndependent.pair_iff.mpr
    intro x y h
    have hi := congrArg Complex.im h
    have hr := congrArg Complex.re h
    have hk : (k:ℝ)≠0 := by exact_mod_cast NeZero.ne k
    simp [Complex.mul_im,Complex.mul_re,hk,z.im_pos.ne'] at hi
    simp_all

def aux (N : ℕ) := N+1

lemma aux_ne (N : ℕ) [NeZero N] : (aux N:ℂ)^2-(aux N:ℂ)≠0 := by
  have h : 0 < N := NeZero.pos N
  unfold aux
  push_cast
  have hn : (N:ℂ)≠0 := by exact_mod_cast h.ne'
  rw [show ((N:ℂ)+1)^2-((N:ℂ)+1)=(N:ℂ)*((N:ℂ)+1) by ring]
  exact mul_ne_zero hn (by exact_mod_cast Nat.succ_ne_zero N)

noncomputable def regular (N k : ℕ) [NeZero N] [NeZero k] (χ : ZMod N → ℂ) (z : ℍ) (s : ℂ) : ℂ :=
  (∑ r : ZMod N, χ r*regularized (periods k z) (aux N) ((r.val:ℂ)/N) s) /
    ((aux N:ℂ)^2-(aux N:ℂ))

theorem regular_analytic (N k : ℕ) [NeZero N] [NeZero k] (χ : ZMod N → ℂ) (z : ℍ) :
    AnalyticOnNhd ℂ (regular N k χ z) domain := by
  apply DifferentiableOn.analyticOnNhd _ domain_open
  apply DifferentiableOn.div_const
  apply DifferentiableOn.fun_sum
  intro r _
  exact (regularized_holomorphic _ _ _).const_mul _

theorem regular_large (N k : ℕ) [NeZero N] [NeZero k] (χ : ZMod N → ℂ) (z : ℍ)
    {s : ℂ} (hs : 3/2<s.re) :
    regular N k χ z s=∑ r : ZMod N, χ r * ∑' j:ℤ×ℤ,
      kernel s ((j.1:ℂ)+(j.2:ℂ)*((k:ℂ)*conj (z:ℂ))+(r.val:ℂ)/N) := by
  classical
  rw [regular,div_eq_iff (aux_ne N),sum_mul]
  apply sum_congr rfl
  intro r _
  have he : ((aux N:ℂ)-1)*((r.val:ℂ)/N)∈(periods k z).lattice := by
    apply PeriodPair.mem_lattice.mpr
    refine ⟨(r.val:ℤ),0,?_⟩
    simp only [periods,aux,Nat.cast_add,Nat.cast_one,add_sub_cancel_right,Int.cast_natCast,Int.cast_zero,zero_mul,mul_one,add_zero]
    have hN : (N:ℂ)≠0 := by exact_mod_cast NeZero.ne N
    field_simp [hN]
  rw [regularized_large _ _ _ _ hs he]
  have es := (periods k z).latticeEquivProd.symm.toEquiv.tsum_eq
    (fun w : (periods k z).lattice => kernel s ((w:ℂ)+(r.val:ℂ)/N))
  have eh (j : ℤ×ℤ) : ((periods k z).latticeEquivProd.symm.toEquiv j:ℂ)=
      (j.1:ℂ)+(j.2:ℂ)*((k:ℂ)*conj (z:ℂ)) := by
    change ((periods k z).latticeEquivProd.symm j:ℂ)=_
    rw [PeriodPair.latticeEquiv_symm_apply]
    simp [periods]
  rw [←es]
  simp only [eh]
  ring

end TunnellRankinEisenstein
#print axioms TunnellRankinEisenstein.regular_large
