import TunnellTraceCosets

/-! One prime-supported integer translation for all the finitely many ideal bases. -/
namespace TunnellUniformTranslation
open Finset TunnellRamifiedLines
noncomputable section
variable {d : ℕ}
private instance pPrime (i : P d) : Fact i.val.Prime := ⟨Nat.prime_of_mem_primeFactors i.property⟩

theorem exists_translation (hs : Squarefree d) (hd : d%4=1) {α : Type*} [Fintype α]
    (a : α→ℕ) (ha : ∀ (i : P d) u,i.val.Coprime (a u)) :
    ∃ m : P d→ℤ, (∀ i,(m i:ZMod i.val)=1) ∧ (∀ i j : P d,i≠j → (m j:ZMod i.val)=0) ∧
      (∀ i,(32:ℤ)∣m i) ∧ (∀ i u,(32*(d/i.val)*(a u):ℕ)∣(m i).natAbs) := by
  classical
  let C (i : P d) := 32*(d/i.val)*∏ u,a u
  have cop (i : P d) : (C i).Coprime i.val := by
    have dvd := Nat.dvd_of_mem_primeFactors i.property
    have h2 : (2:ℕ).Coprime i.val := Nat.prime_two.coprime_iff_not_dvd.mpr (by intro h; have H := dvd_trans h dvd; omega)
    have h32 : (32:ℕ).Coprime i.val := by simpa using h2.pow_left 5
    have hdiv : (d/i.val).Coprime i.val := by
      simpa [Nat.gcd_eq_right dvd] using Nat.coprime_div_gcd_of_squarefree (n:=i.val) hs (pPrime i).out.ne_zero
    exact (h32.mul_left hdiv).mul_left (Nat.Coprime.prod_left fun u _ => (ha i u).symm)
  let b (i : P d) := (((ZMod.unitOfCoprime (C i) (cop i))⁻¹: (ZMod i.val)ˣ):ZMod i.val).val
  let m (i : P d) : ℕ := C i*b i
  refine ⟨fun i => (m i:ℤ),?_,?_,?_,?_⟩
  · intro i
    change (((m i:ℕ):ℤ):ZMod i.val)=1
    rw [Int.cast_natCast]
    simp only [m,b,Nat.cast_mul,ZMod.natCast_zmod_val]
    rw [←ZMod.coe_unitOfCoprime (C i) (cop i),Units.mul_inv]
  · intro i j hij
    have dvd := Nat.dvd_of_mem_primeFactors j.property
    have hi : i.val∣d/j.val := by
      have hh := dvd_trans (Nat.dvd_of_mem_primeFactors i.property) (dvd_of_eq (Nat.div_mul_cancel dvd).symm)
      apply ((pPrime i).out.dvd_mul.mp hh).resolve_right
      intro eq
      exact hij (Subtype.ext ((Nat.prime_dvd_prime_iff_eq (pPrime i).out (pPrime j).out).mp eq))
    change (((m j:ℕ):ℤ):ZMod i.val)=0
    rw [Int.cast_natCast]
    apply (ZMod.natCast_eq_zero_iff _ _).mpr
    exact dvd_trans hi (dvd_trans (dvd_mul_left _ _) (dvd_trans (dvd_mul_right _ _) (dvd_mul_right _ _)))
  · intro i
    change (32:ℤ)∣((m i:ℕ):ℤ)
    exact_mod_cast (dvd_trans (dvd_mul_right 32 _) (dvd_trans (dvd_mul_right _ _) (dvd_mul_right _ _)) : 32 ∣ m i)
  · intro i u
    change 32*(d/i.val)*(a u) ∣ m i
    apply dvd_trans _ (dvd_mul_right (C i) (b i))
    exact Nat.mul_dvd_mul_left _ (Finset.dvd_prod_of_mem a (mem_univ u))

end
end TunnellUniformTranslation
#print axioms TunnellUniformTranslation.exists_translation
