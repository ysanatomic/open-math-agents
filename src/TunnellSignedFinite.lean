import TunnellRootPolynomial
import TunnellFiniteWaldspurger

/-! An integer polynomial test for the Gauss sign and a finite modular-symbol square identity. -/

namespace TunnellFiniteSymbols
open Finset Polynomial TunnellRootPolynomial TunnellTwistCharacter TunnellWaldspurgerLocal

noncomputable def chiPoly (d : ℕ) (hd : 0<d) : ℤ[X] :=
  haveI : NeZero (4*(2*d)) := ⟨by omega⟩
  ∑ j : ZMod (4*(2*d)), C (weight (2*d) j.val)*X^(2*j.val)

lemma eval_chiPoly {d : ℕ} (hd : 0<d) : aeval (root d) (chiPoly d hd)=tau (2*d) (by omega) := by
  let : NeZero (4*(2*d)) := ⟨by omega⟩
  unfold chiPoly tau gaussSum
  simp only [map_sum,map_mul,aeval_C,map_pow,aeval_X]
  apply sum_congr rfl
  intro j _
  change (weight (2*d) j.val:ℂ)*_= (weight (2*d) j.val:ℂ)*_
  congr 1
  have h := ZMod.stdAddChar_coe (N:=4*(2*d)) (j.val:ℤ)
  rw [Int.cast_natCast,ZMod.natCast_zmod_val] at h
  rw [h,root_pow]
  congr 1
  simp only [angle,Nat.cast_mul,Nat.cast_ofNat,Complex.ofReal_div,Complex.ofReal_mul,
    Complex.ofReal_natCast,Complex.ofReal_ofNat,Int.cast_natCast]
  ring

/-- The sign of the real quadratic Gauss sum, using only division of integer polynomials. -/
noncomputable def epsilon (d : ℕ) (hd : 0<d) : ℤ :=
  if (chiPoly d hd-rootPoly d) %ₘ cyclotomic (16*d) ℤ = 0 then 1 else -1

lemma sign_iff {d : ℕ} (hd : 0<d) :
    (chiPoly d hd-rootPoly d) %ₘ cyclotomic (16*d) ℤ = 0 ↔
      tau (2*d) (by omega)=(Real.sqrt (8*d):ℂ) := by
  rw [modByMonic_eq_zero_iff_dvd (cyclotomic.monic _ _),
    cyclotomic_eq_minpoly (primitive hd) (by omega),
    ←minpoly.isIntegrallyClosed_dvd_iff ((primitive hd).isIntegral (by omega)),
    map_sub,eval_chiPoly hd,eval_rootPoly hd,sub_eq_zero]

lemma signed_root {d : ℕ} (hs : Squarefree d) (hd : d%4=1) :
    tau (2*d) (by omega)=(epsilon d (by omega):ℂ)*(Real.sqrt (8*d):ℂ) := by
  have hd' : 0<d := by omega
  let : NeZero (4*(2*d)) := ⟨by omega⟩
  have hh := TunnellModularSymbol.gauss_sq (character_primitive hd hs)
    (character_quadratic (2*d) (by omega)) (character_even hd)
  change tau (2*d) (by omega)^2=((4*(2*d):ℕ):ℂ) at hh
  have hsq : (Real.sqrt (8*d):ℂ)^2=((4*(2*d):ℕ):ℂ) := by
    rw [←Complex.ofReal_pow,Real.sq_sqrt (by positivity)]
    push_cast
    ring
  rcases sq_eq_sq_iff_eq_or_eq_neg.mp (hh.trans hsq.symm) with he|he
  · simp [epsilon,(sign_iff hd').mpr he,he]
  · by_cases h : (chiPoly d hd'-rootPoly d) %ₘ cyclotomic (16*d) ℤ = 0
    · simp [epsilon,h,(sign_iff hd').mp h]
    · simp [epsilon,h,he]

/-- Difference of two finite three-square counts, with explicit congruences for each lattice. -/
def shellPeriod (d : ℕ) : ℤ :=
  (((TunnellShell.shell (2*d)).filter (fun v => v.1%4=v.2.1%4 ∧ v.2.2%8=0)).card:ℤ)-
  ((TunnellShell.shell (2*d)).filter (fun v => v.1%4=v.2.1%4 ∧ v.2.2%4=0 ∧
    (v.1+v.2.1+2*(v.2.2/4))%4=0)).card

lemma shellPeriod_eq (d : ℕ) : shellPeriod d=localPeriod d := by
  classical
  simp only [shellPeriod,localPeriod,TunnellTestVector.first_iff,TunnellTestVector.second_iff]

theorem of_signed_square (h : ∀ d : ℕ, Squarefree d → (hd : d%4=1) →
    epsilon d (by omega)*winding (2*d) (by omega)=shellPeriod d^2) :
    OMA.R_CongruentNumber_Tunnell_even_R1_H3_R1.H2 := by
  apply of_finite_square
  intro d hs hd
  have he := congrArg ((↑) : ℤ→ℂ) (h d hs hd)
  simp only [Int.cast_mul,Int.cast_pow,shellPeriod_eq] at he
  rw [signed_root hs hd,show (4:ℝ)*(2*(d:ℝ))=8*d by ring,←he]
  have e : epsilon d (by omega)=1 ∨ epsilon d (by omega)= -1 := by
    unfold epsilon
    split_ifs <;> simp
  rcases e with e|e <;> simp [e,mul_comm]

end TunnellFiniteSymbols
#print axioms TunnellFiniteSymbols.of_signed_square
