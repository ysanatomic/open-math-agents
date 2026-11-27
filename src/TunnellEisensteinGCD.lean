import TunnellEisensteinPrimitiveRows
import TunnellRankinNormalization
import Mathlib.NumberTheory.ModularForms.EisensteinSeries.Defs

/-! Primitive bottom-row unfolding of the weight-one Eisenstein series. -/
namespace TunnellRankinEisenstein
open Complex TunnellCMRegularized EisensteinSeries Set Finset
open UpperHalfPlane hiding I
open scoped Topology ComplexConjugate
noncomputable section

abbrev Primitives := gammaSet 1 1 0

lemma factor_gcd (F : (Fin 2→ℤ)→ℂ) (C : ℕ→ℂ) (hC : C 0=0)
    (hm : ∀ (g : ℕ) (v : Fin 2→ℤ), F ((g:ℤ) • v) = C g * F v) (hS : Summable F) :
    ∑' v,F v = (∑' g,C g)*(∑' v : Primitives,F v) := by
  have H : Summable (fun p : (Σ g : ℕ, gammaSet 1 g 0) => F (gammaSetDivGcdSigmaEquiv.symm p)) :=
    gammaSetDivGcdSigmaEquiv.symm.summable_iff.mpr hS
  rw [← gammaSetDivGcdSigmaEquiv.symm.tsum_eq F,H.tsum_sigma,←tsum_mul_right]
  apply tsum_congr
  intro g
  simp only [gammaSetDivGcdSigmaEquiv_symm_eq]
  by_cases hg : g=0
  · subst g
    simp only [hC,zero_mul]
    have hh (v : gammaSet 1 0 0) : F v=0 := by
      calc
        F v=F ((0:ℤ) • divIntMap 0 v) := congrArg F (gammaSet_eq_gcd_mul_divIntMap v.property)
        _ = C 0 * F (divIntMap 0 v) := hm 0 _
        _ = 0 := by rw [hC,zero_mul]
    simp only [hh,tsum_zero]
  · haveI : NeZero g := ⟨hg⟩
    rw [← (gammaSetDivGcdEquiv g).tsum_eq (fun v : Primitives => F v),← tsum_mul_left]
    apply tsum_congr
    intro v
    calc
      F v = F ((g:ℤ) • divIntMap g v) := congrArg F (gammaSet_eq_gcd_mul_divIntMap v.property)
      _ = C g * F (gammaSetDivGcdEquiv g v) := hm _ _

def nativeTerm {N k : ℕ} (χ : DirichletCharacter ℂ N) (z : ℍ) (s : ℂ) (v : Fin 2→ℤ) :=
    physicalTerm (k:=k) χ z s (v 0,v 1)

lemma primitive_factor {N k : ℕ} [NeZero N] [NeZero k] (χ : DirichletCharacter ℂ N) (z : ℍ) {s : ℂ}
    (hs : 3/2<s.re) : eisenstein (k:=k) χ z s =
    (z.im:ℂ)^(s-1) * χ.LFunction (2*s-1) * ∑' v : Primitives, nativeTerm (k:=k) χ z s v := by
  let C (g : ℕ) := χ g * kernel s (g:ℂ)
  let F := nativeTerm (k:=k) χ z s
  have H : HasSum F (kernel s (N:ℂ)*regular N k χ z s) :=
    (finTwoArrowEquiv ℤ).hasSum_iff.mpr (physical_lattice χ z hs)
  have hm (g : ℕ) (v : Fin 2→ℤ) : F ((g:ℤ) • v) = C g*F v := by
    have he (i : Fin 2) : ((g:ℤ) • v) i=(g:ℤ)*v i := by simp [Pi.smul_apply]
    simp only [F,nativeTerm,physicalTerm,he,Int.cast_mul,Int.cast_natCast,
      map_mul,C]
    rw [show (N:ℂ)*k*((g:ℂ)*(v 0:ℂ))*conj (z:ℂ)+(g:ℂ)*(v 1:ℂ) =
      (g:ℂ)*((N:ℂ)*k*(v 0:ℂ)*conj (z:ℂ)+(v 1:ℂ)) by ring,kernel_mul]
    ring
  have h0 : C 0=0 := by simp [C,kernel]
  have hs' : 1<(2*s-1).re := by simp [Complex.mul_re]; linarith
  have hD : χ.LFunction (2*s-1)=∑' g,C g := by
    rw [χ.LFunction_eq_LSeries hs',LSeries]
    apply tsum_congr
    intro g
    rw [LSeries.term_of_ne_zero' (by intro h; rw [h] at hs'; norm_num at hs')]
    by_cases hg : g=0
    · subst g
      simp [C,kernel,Complex.zero_cpow (show 2*s-1≠0 by intro h; rw [h] at hs'; norm_num at hs')]
    · have hp : 0<(g:ℝ) := Nat.cast_pos.mpr (Nat.pos_of_ne_zero hg)
      dsimp only [C]
      rw [←Complex.ofReal_natCast, kernel_real,
        sign_pos hp,SignType.coe_one,abs_of_pos hp,Complex.ofReal_natCast]
      ring
  rw [eisenstein,mul_assoc,←H.tsum_eq,factor_gcd F C h0 hm H.summable,←hD]
  dsimp [F]
  ring
end
end TunnellRankinEisenstein
#print axioms TunnellRankinEisenstein.primitive_factor
