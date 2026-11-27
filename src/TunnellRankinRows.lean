import TunnellRankinEisenstein
import TunnellRankinCotangent

/-! Evaluation of the horizontal fibers of the regularization at the critical point. -/
namespace TunnellRankinEisenstein
open Complex TunnellCMRegularized Finset Set TunnellRankinCotangent
open scoped ComplexConjugate Topology
noncomputable section

def cotValue (x : ℂ) : ℂ := Real.pi * cot (Real.pi * x)

lemma cotValue_add_nat (x : ℂ) (m : ℕ) : cotValue (x+m) = cotValue x := by
  have he (w : ℂ) : cot w = (tan w)⁻¹ := by simp [Complex.cot,Complex.tan]
  simp only [cotValue,he,show (Real.pi:ℂ)*(x+(m:ℂ))=Real.pi*x+(m:ℂ)*Real.pi by ring,
    Complex.tan_add_nat_mul_pi]

lemma cotPairs {x : ℂ} (hx : x=0 ∨ x∈integerComplement) :
    HasSum (fun n : ℕ+ => (x-(n.val:ℂ))⁻¹+(x+(n.val:ℂ))⁻¹) (cotValue x-x⁻¹) := by
  rcases hx with rfl | hx
  · simpa [cotValue,Complex.cot] using (hasSum_zero (ι:=ℕ+) (M:=ℂ))
  have hs : Summable (fun n : ℕ+ => (x-(n.val:ℂ))⁻¹+(x+(n.val:ℂ))⁻¹) := by
    rw [summable_pnat_iff_summable_succ (f:=fun n : ℕ => (x-(n:ℂ))⁻¹+(x+(n:ℂ))⁻¹)]
    simpa [cotTerm] using summable_cotTerm hx
  apply hs.hasSum_iff.mpr
  have h := cot_series_rep hx
  simp only [one_div] at h
  exact eq_sub_iff_add_eq.mpr (by simpa only [cotValue,add_comm] using h.symm)

def centralFiber (a : ℕ) (t x : ℂ) (j : ℤ) : ℂ :=
  (a:ℂ)^2 * ((t+x+j)⁻¹ - (t+j)⁻¹) -
    (a:ℂ) * ((t+(a:ℂ)*x+j)⁻¹ - (t+j)⁻¹)

lemma tsum_symmetric (F : ℤ→ℂ) (hF : Summable F) :
    ∑' j, F j = F 0 + ∑' n : ℕ+, (F (-(n.val:ℤ))+F (n.val:ℤ)) := by
  have hp : Summable (fun n : ℕ+ => F (n.val:ℤ)) := hF.comp_injective (Nat.cast_injective.comp PNat.coe_injective)
  have hn : Summable (fun n : ℕ+ => F (-(n.val:ℤ))) := hF.comp_injective (neg_injective.comp (Nat.cast_injective.comp PNat.coe_injective))
  rw [tsum_int_eq_zero_add_tsum_pnat hF, Summable.tsum_add hn hp]
  ring

lemma critical_fiber (a : ℕ) (t x : ℂ) (ht : t=0 ∨ t∈integerComplement)
    (hx : t+x=0 ∨ t+x∈integerComplement) (hax : t+(a:ℂ)*x=0 ∨ t+(a:ℂ)*x∈integerComplement)
    (hs : Summable (centralFiber a t x)) :
    ∑' j, centralFiber a t x j =
      (a:ℂ)^2*(cotValue (t+x)-cotValue t) -
        (a:ℂ)*(cotValue (t+(a:ℂ)*x)-cotValue t) := by
  have h := (((cotPairs hx).sub (cotPairs ht)).mul_left ((a:ℂ)^2)).sub
    (((cotPairs hax).sub (cotPairs ht)).mul_left (a:ℂ))
  rw [tsum_symmetric _ hs]
  have hh : (∑' n : ℕ+, (centralFiber a t x (-(n.val:ℤ))+centralFiber a t x (n.val:ℤ))) = _ :=
    (h.congr_fun (g:=fun n : ℕ+ => centralFiber a t x (-(n.val:ℤ))+centralFiber a t x (n.val:ℤ)) (by
      intro n
      simp only [centralFiber,Int.cast_neg,Int.cast_natCast,sub_eq_add_neg]
      <;> ring)).tsum_eq
  rw [hh]
  simp [centralFiber]
  ring

end
end TunnellRankinEisenstein
#print axioms TunnellRankinEisenstein.critical_fiber
