import TunnellDensityTrace

/-! Recovering the rectangular shift after adjoining orthogonal ramified packet coordinates. -/
namespace TunnellDensityTrace
open TunnellRamifiedLines TunnellRectangularClasses Finset
open scoped Classical
noncomputable section
variable {d : ℕ}
private instance prime (i : P d) : Fact i.val.Prime := ⟨Nat.prime_of_mem_primeFactors i.property⟩

def complementaryUnit (hs : Squarefree d) (i : P d) : (ZMod i.val)ˣ :=
  ZMod.unitOfCoprime (d/i.val) (Nat.coprime_of_squarefree_mul (by rwa [Nat.div_mul_cancel (Nat.dvd_of_mem_primeFactors i.property)]))

def assemble (x : (i : P d) → ZMod i.val) : ZMod d := ∑ i : P d, (((d/i.val)*(x i).val:ℕ):ZMod d)

lemma reduce_assemble (x : (i : P d) → ZMod i.val) (i : P d) :
    reduce i (assemble x)=((d/i.val:ℕ):ZMod i.val)*x i := by
  rw [assemble,map_sum,Finset.sum_eq_single i]
  · rw [map_natCast,Nat.cast_mul,ZMod.natCast_zmod_val]
  · intro j _ hj
    have hc : i.val.Coprime j.val := (Nat.coprime_primes (prime i).out (prime j).out).mpr (fun e => hj (Subtype.ext e.symm))
    have hj' := Nat.dvd_of_mem_primeFactors j.property
    have h : i.val ∣ d/j.val := Nat.dvd_div_of_mul_dvd (hc.symm.mul_dvd_of_dvd_of_dvd hj' (Nat.dvd_of_mem_primeFactors i.property))
    simp [map_natCast,(ZMod.natCast_eq_zero_iff _ _).mpr h]
  · simp

theorem shifts_eq (hs : Squarefree d) (x : Packet d) :
    shifts hs (complementaryUnit hs) x = (assemble (fun i => (x i).1),assemble (fun i => (x i).2)) := by
  apply Prod.ext
  · apply red_ext hs; intro i; rw [reduce_assemble]
    have h := congrArg Prod.fst (shifts_apply hs (complementaryUnit hs) x i)
    simpa [complementaryUnit] using h
  · apply red_ext hs; intro i; rw [reduce_assemble]
    have h := congrArg Prod.snd (shifts_apply hs (complementaryUnit hs) x i)
    simpa [complementaryUnit] using h

end
end TunnellDensityTrace
#print axioms TunnellDensityTrace.shifts_eq
