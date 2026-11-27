import Mathlib.RingTheory.DedekindDomain.AdicValuation
import Mathlib.NumberTheory.NumberField.Basic
import Mathlib.Tactic.LinearCombination

/-! Global inertia acts trivially on the residues of all coordinates integral at a selected place. -/
namespace TunnellCMIntegralInertia
open IsDedekindDomain IsDedekindDomain.HeightOneSpectrum IsLocalRing NumberField
open scoped NumberField
variable {R K : Type*} [CommRing R] [IsDedekindDomain R] [Field K] [Algebra R K] [IsFractionRing R K]
  (v : HeightOneSpectrum R)
local notation "ι" => algebraMap R K
local notation "V" => v.valuation K

theorem local_fraction {x : K} (h : V x≤1) :
    ∃ (a d : R), d∉v.asIdeal ∧ x*ι d=ι a := by
  obtain ⟨a,d,e⟩ := v.exists_primeCompl_mul_eq_of_integer x h
  exact ⟨a,d.val,d.property,e⟩

theorem integral_difference (σ : K →+* K) (hσ : ∀ a : R, V (σ (ι a)-ι a)<1)
    {x : K} (hx : V x≤1) : V (σ x-x)<1 := by
  obtain ⟨a,d,hd,he⟩ := local_fraction v hx
  have dv : V (ι d)=1 := (v.valuation_eq_one_iff_notMem (K := K)).mpr hd
  have eqd : V (σ (ι d))=1 := by
    rw [← sub_add_cancel (σ (ι d)) (ι d),(V).map_add_eq_of_lt_right (dv ▸ hσ d),dv]
  have prod : (σ x-x)*σ (ι d)=(σ (ι a)-ι a)-x*(σ (ι d)-ι d) := by
    have h := congrArg σ he
    rw [map_mul] at h
    linear_combination h - he
  have hl : V (x*(σ (ι d)-ι d))<1 := by
    rw [map_mul]
    exact lt_of_le_of_lt (mul_le_of_le_one_left' hx) (hσ d)
  calc
    V (σ x-x) = V ((σ x-x)*σ (ι d)) := by rw [map_mul,eqd,mul_one]
    _ = _ := congrArg V prod
    _ < 1 := ((V).map_sub _ _).trans_lt (max_lt (hσ a) hl)

theorem image_integral (σ : K →+* K) (hσ : ∀ a : R, V (σ (ι a)-ι a)<1)
    {x : K} (hx : V x≤1) : V (σ x)≤1 := by
  have he := integral_difference v σ hσ hx
  rw [← sub_add_cancel (σ x) x]
  exact ((V).map_add _ _).trans (max_le he.le hx)

variable {F N : Type*} [Field F] [Field N] [NumberField N] [Algebra F N]
theorem inertia_on_integers (w : HeightOneSpectrum (𝓞 N)) (σ : N ≃ₐ[F] N)
    (hσ : σ∈w.asIdeal.inertia (N ≃ₐ[F] N)) (a : 𝓞 N) :
    w.valuation N (σ (a:N)-(a:N))<1 := by
  have H : σ • a-a∈w.asIdeal := hσ a
  exact (w.valuation_lt_one_iff_mem (K := N) (σ • a-a)).mpr H

end TunnellCMIntegralInertia
#print axioms TunnellCMIntegralInertia.integral_difference
#print axioms TunnellCMIntegralInertia.inertia_on_integers
