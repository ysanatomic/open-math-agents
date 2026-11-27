import TunnellPolynomialSplitPrimes
import Mathlib.RingTheory.Polynomial.Resultant.Basic
import Mathlib.NumberTheory.Padics.Hensel
import Mathlib.FieldTheory.Separable
import Mathlib.RingTheory.Int.Basic

/-! Arbitrarily large primes admitting a p-adic root of a separable integral polynomial. -/
namespace TunnellSimpleSplitPrimes
open Polynomial
open scoped Polynomial

theorem long_root (f : ℤ[X]) (hd : 0 < f.natDegree)
    (hs : (f.map (Int.castRingHom ℚ)).Separable) (B : ℕ) :
    ∃ p : ℕ, ∃ hp : p.Prime, B<p ∧ ∃ z : @PadicInt p ⟨hp⟩, f.aeval z=0 := by
  let d := f.resultant f.derivative f.natDegree f.derivative.natDegree
  have hd0 : d≠0 := by
    intro hh
    let F := Int.castRingHom ℚ
    have e : (f.map F).resultant (f.derivative.map F)=0 := by
      have hf : Function.Injective F := Int.cast_injective
      rw [natDegree_map_eq_of_injective hf,natDegree_map_eq_of_injective hf,resultant_map_map]
      exact (congrArg F hh).trans F.map_zero
    rw [← derivative_map] at e
    exact (resultant_eq_zero_iff.mp e).2 hs
  obtain ⟨u,v,_,_,he⟩ := exists_mul_add_mul_eq_C_resultant f f.derivative le_rfl le_rfl (Or.inl hd.ne')
  obtain ⟨p,hp,hpB,x,hx⟩ := TunnellPolynomialSplitPrimes.prime_dividing_value f hd (max B d.natAbs)
  letI : Fact p.Prime := ⟨hp⟩
  have hpD : ¬(p:ℤ)∣d := by
    intro h
    have hp' : p∣d.natAbs := by simpa using Int.natAbs_dvd_natAbs.mpr h
    have := Nat.le_of_dvd (Int.natAbs_pos.mpr hd0) hp'
    omega
  have hder : ¬(p:ℤ)∣f.derivative.eval x := by
    intro hh
    apply hpD
    have ee := congrArg (Polynomial.eval x) he
    simp only [eval_add,eval_mul,eval_C] at ee
    change _∣f.resultant f.derivative _ _
    rw [← ee]
    exact dvd_add (dvd_mul_of_dvd_left hx _) (dvd_mul_of_dvd_left hh _)
  have hcop : IsCoprime (f.derivative.eval x) (p:ℤ) := by
    apply Int.isCoprime_iff_nat_coprime.mpr
    simpa using (hp.coprime_iff_not_dvd.mpr (fun h => hder (Int.natAbs_dvd_natAbs.mp (by simpa using h)))).symm
  have ev (g : ℤ[X]) : g.aeval (x:ℤ_[p])=((g.eval x:ℤ):ℤ_[p]) :=
    Polynomial.eval₂_at_apply (Int.castRingHom ℤ_[p]) x
  have hh : ‖f.aeval (x:ℤ_[p])‖ < ‖f.derivative.aeval (x:ℤ_[p])‖^2 := by
    rw [ev,ev,PadicInt.norm_intCast_eq_one_iff.mpr hcop,one_pow]
    exact PadicInt.norm_intCast_lt_one_iff.mpr hx
  obtain ⟨z,hz,_⟩ := hensels_lemma hh
  exact ⟨p,hp,by omega,z,hz⟩

end TunnellSimpleSplitPrimes
#print axioms TunnellSimpleSplitPrimes.long_root
