import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1_H1_R1_H1_R1_H1_R1
import Mathlib

/-! A prime of a cyclotomic field away from the conductor has absolute norm congruent to one. A primitive root retains its order in the residue field. -/
namespace TunnellCyclotomicPrimeCongruence
open NumberField IsDedekindDomain
open scoped NumberField
noncomputable section

theorem norm_congruent (m : ℕ+) (F : Type) [Field F] [NumberField F] [IsCyclotomicExtension {m.val} ℚ F]
    (w : HeightOneSpectrum (𝓞 F)) (cop : w.asIdeal.absNorm.Coprime m.val) : (w.asIdeal.absNorm : ZMod m.val)=1 := by
  letI : NeZero m.val := ⟨m.property.ne'⟩
  letI : Field ((𝓞 F) ⧸ w.asIdeal) := Ideal.Quotient.field _
  let k := (𝓞 F) ⧸ w.asIdeal
  letI : Finite k := Ring.HasFiniteQuotients.finiteQuotient w.ne_bot
  letI : Fintype k := Fintype.ofFinite k
  have root := IsCyclotomicExtension.zeta_spec m.val ℚ F
  have red := root.toInteger_isPrimitiveRoot.idealQuotient_mk
    (I:=w.asIdeal) (by simpa using w.isPrime.ne_top) cop
  let z : k := Ideal.Quotient.mk w.asIdeal root.toInteger
  have hz : z ≠ 0 := (red.isUnit m.property.ne').ne_zero
  have order : m.val ∣ w.asIdeal.absNorm-1 := by
    apply (red.pow_eq_one_iff_dvd _).mp
    change z ^ (Nat.card k-1) = 1
    rw [Nat.card_eq_fintype_card]
    exact FiniteField.pow_card_sub_one_eq_one z hz
  have pos : 1 ≤ w.asIdeal.absNorm := Nat.pos_of_ne_zero (Ideal.absNorm_eq_zero_iff.not.mpr w.ne_bot)
  calc
    (w.asIdeal.absNorm : ZMod m.val) = ((w.asIdeal.absNorm-1 : ℕ) : ZMod m.val)+1 := by
      rw [←Nat.cast_one (R := ZMod m.val),←Nat.cast_add,Nat.sub_add_cancel pos]
    _ = 1 := by rw [(ZMod.natCast_eq_zero_iff _ _).mpr order,zero_add]

end
end TunnellCyclotomicPrimeCongruence

theorem OMA.solution : OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1_H1_R1_H1_R1_H1_R1.H4 := by
  intro m hm F p cop
  let M : ℕ+ := ⟨m,by omega⟩
  letI : NeZero m := ⟨by omega⟩
  letI : NeZero (m : ℚ) := ⟨by exact_mod_cast (NeZero.ne m)⟩
  letI : IsCyclotomicExtension {m} ℚ F := CyclotomicField.isCyclotomicExtension m ℚ
  letI : IsCyclotomicExtension {M.val} ℚ F := CyclotomicField.isCyclotomicExtension m ℚ
  exact TunnellCyclotomicPrimeCongruence.norm_congruent M F p cop
