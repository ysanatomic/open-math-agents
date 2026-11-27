import Mathlib.RingTheory.PowerSeries.Derivative
import Mathlib.RingTheory.PowerSeries.Inverse
import Mathlib.Tactic

/-! # The first nonzero coefficient of a height-one multiplication series -/

namespace TunnellFormalJet

open PowerSeries

variable {O k : Type*} [CommRing O] [IsDomain O] [CharZero O] [CommRing k]

/-- In residue characteristic p, the degree-p multiplication coefficient is
the degree-(p−1) coefficient of the normalized invariant differential.
The input equation is its exact change-of-variable equation. -/
theorem invariant_coefficient (ρ : O →+* k) {p : ℕ} (hp : 0 < p)
    (F D : O⟦X⟧) (hF : constantCoeff F = 0) (hD : constantCoeff D = 1)
    (hbelow : ∀ j < p, ρ (coeff j F) = 0)
    (heq : D.subst F * derivative O F = C (p : O) * D) :
    ρ (coeff p F) = ρ (coeff (p-1) D) := by
  have hsub : HasSubst F := .of_constantCoeff_zero' hF
  let B := (mk (fun j => coeff (j+1) D)).subst F
  have hsplit : D.subst F = F * B + 1 := by
    have hx := congrArg (subst (R := O) F) (eq_X_mul_shift_add_const D)
    rw [subst_add hsub, subst_mul hsub, subst_X hsub, subst_C, hD, map_one] at hx
    exact hx
  have hu : IsUnit (D.subst F : O⟦X⟧) := by
    rw [isUnit_iff_constantCoeff,hsplit,map_add,map_mul,hF]
    simp
  obtain ⟨V₀,hV₀⟩ := hu.exists_left_inv
  let V := V₀ * D
  have hder : derivative O F = C (p : O) * V := by
    calc
      _ = (V₀ * D.subst F) * derivative O F := by rw [hV₀,one_mul]
      _ = _ := by rw [mul_assoc,heq]; dsimp [V]; ring
  have hprod : D.subst F * V = D := by
    dsimp [V]
    rw [← mul_assoc,mul_comm (D.subst F),hV₀,one_mul]
  have hdiff : D - V = F * (B * V) := by rw [← hprod, hsplit]; ring
  have hdiv : X^p ∣ map ρ F :=
    X_pow_dvd_iff.mpr (by simpa only [coeff_map] using hbelow)
  have hdiv' : X^p ∣ map ρ (D - V) := by
    rw [hdiff,map_mul]
    exact dvd_mul_of_dvd_left hdiv _
  have hcoef := X_pow_dvd_iff.mp hdiv' (p-1) (by omega)
  simp only [map_sub, coeff_map, map_sub] at hcoef
  have hd' := congrArg (coeff (R := O) (p-1)) hder
  have hcancel : (coeff p F) * (p : O) = coeff (p-1) V * (p : O) := by
    rw [coeff_derivative, coeff_C_mul, ← Nat.cast_succ, show p-1+1=p by omega] at hd'
    rw [show (p-1).succ=p by omega] at hd'
    exact hd'.trans (mul_comm _ _)
  rw [mul_right_cancel₀ (Nat.cast_ne_zero.mpr hp.ne') hcancel]
  exact (sub_eq_zero.mp hcoef).symm

#print axioms invariant_coefficient
end TunnellFormalJet
