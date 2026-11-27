import Mathlib.NumberTheory.Padics.Hensel
import Mathlib.NumberTheory.LegendreSymbol.Basic
import Mathlib.Tactic

namespace TunnellLocalDivisibility

open Polynomial

theorem split_padic_root {p : ℕ} [Fact p.Prime] (hp : p%4=1) :
    ∃ z : ℤ_[p], z^2 = -1 := by
  have hprime : p.Prime := Fact.out
  obtain ⟨x,hx⟩ := (ZMod.exists_sq_eq_neg_one_iff (p:=p)).2 (by omega)
  have hn : (x.val:ZMod p)^2+1=0 := by rw [ZMod.natCast_zmod_val,sq,←hx]; ring
  have hdiv : p ∣ x.val^2+1 := (ZMod.natCast_eq_zero_iff _ _).mp (by push_cast; exact hn)
  have hxp : p.Coprime x.val := hprime.coprime_iff_not_dvd.mpr (by
    intro h
    have hzero := (ZMod.natCast_eq_zero_iff x.val p).mpr h
    rw [hzero] at hn
    simpa using hn)
  have h2p : p.Coprime 2 := hprime.coprime_iff_not_dvd.mpr (by
    intro h
    have := Nat.le_of_dvd (by decide : 0<2) h
    have := hprime.two_le
    omega)
  let f : Polynomial ℤ := X^2+1
  have hf (a : ℤ_[p]) : f.aeval a = a^2+1 := by simp [f]
  have hd (a : ℤ_[p]) : f.derivative.aeval a = 2*a := by simp [f,show (2 : Polynomial ℤ) = 1 + 1 by norm_num] <;> norm_num
  have hc : ‖f.aeval (x.val:ℤ_[p])‖ < ‖f.derivative.aeval (x.val:ℤ_[p])‖^2 := by
    rw [hf,hd,← Nat.cast_ofNat (R:=ℤ_[p]) (n:=2),← Nat.cast_mul,
      (PadicInt.norm_natCast_eq_one_iff.mpr (h2p.mul_right hxp)),one_pow]
    exact_mod_cast (PadicInt.norm_natCast_lt_one_iff.mpr hdiv)
  obtain ⟨z,hz,_⟩ := hensels_lemma hc
  exact ⟨z,eq_neg_of_add_eq_zero_left ((hf z).symm.trans hz)⟩

end TunnellLocalDivisibility
