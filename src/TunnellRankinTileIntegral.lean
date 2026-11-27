import TunnellRankinModularDomain

/-! Change of variables over the modular polygon, with the factor of two from the center. -/
namespace TunnellRankinDomain
open Complex Matrix MatrixGroups ModularGroup UpperHalfPlane Set MeasureTheory
open scoped Pointwise ENNReal
noncomputable section

local instance : Countable (Matrix (Fin 2) (Fin 2) ℤ) := inferInstanceAs (Countable (Fin 2→Fin 2→ℤ))
local instance : Countable (SL(2,ℤ)) := Function.Injective.countable (f:=fun g : SL(2,ℤ) => g.val) Subtype.val_injective

def mark : ℍ→ℝ≥0∞ := fdo.indicator (fun _ => 1)

lemma mark_meas : Measurable mark := measurable_const.indicator isOpen_fdo.measurableSet

lemma neg_distinct (g : SL(2,ℤ)) : g≠ -g := by
  intro eq
  have e := congrArg (·*g⁻¹) eq
  have h : (1:SL(2,ℤ))= -1 := by simpa using e
  have := congrArg (fun m : SL(2,ℤ) => m.val 0 0) h
  norm_num at this

lemma ae_mark : ∀ᵐ z : ℍ, ∑' g : SL(2,ℤ), mark (g⁻¹ • z)=2 := by
  classical
  filter_upwards [ae_pair] with z hz
  obtain ⟨w,hw⟩ := hz
  change (∑' g : SL(2,ℤ),mark (((Equiv.inv _) g) • z))=2
  rw [(Equiv.inv (SL(2,ℤ))).tsum_eq (fun g => mark (g • z))]
  have e : ∀ g : SL(2,ℤ), mark (g • z) = if g=w ∨ g= -w then 1 else 0 := by
    intro g
    change (if g • z ∈ fdo then 1 else 0)=_
    rw [hw]
    split_ifs <;> rfl
  simp_rw [e]
  rw [tsum_eq_sum (s:={w,-w}) (fun x hx => if_neg (by simpa using hx))]
  rw [Finset.sum_insert (by simpa using neg_distinct w),Finset.sum_singleton]
  norm_num

def pull (g : SL(2,ℤ)) (f : ℍ→ℝ≥0∞) (z : ℍ) := mark (g⁻¹ • z)*f z

lemma pull_meas (g : SL(2,ℤ)) {f : ℍ→ℝ≥0∞} (hf : Measurable f) : Measurable (pull g f) :=
  (mark_meas.comp (measurePreserving_smul ((g⁻¹:SL(2,ℤ)):GL (Fin 2) ℝ) volume).measurable).mul hf

lemma pull_eq (g : SL(2,ℤ)) {f : ℍ→ℝ≥0∞} (hf : Measurable f) :
    ∫⁻ z in fdo, f (g • z)=∫⁻ z, pull g f z := by
  have h : MeasurePreserving (fun z : ℍ => g • z) := measurePreserving_smul (g:GL (Fin 2) ℝ) volume
  rw [←h.lintegral_comp (pull_meas g hf),←lintegral_indicator isOpen_fdo.measurableSet]
  apply lintegral_congr
  intro z
  by_cases hz : z∈fdo <;> simp [pull,mark,hz]

theorem tiles_integral {f : ℍ→ℝ≥0∞} (hf : Measurable f) :
    (∑' g : SL(2,ℤ),∫⁻ z in fdo,f (g • z))=2*∫⁻ z,f z := by
  simp_rw [pull_eq _ hf]
  rw [←lintegral_tsum (fun g => (pull_meas g hf).aemeasurable),←lintegral_const_mul _ hf]
  apply lintegral_congr_ae
  filter_upwards [ae_mark] with z hz
  change (∑' g : SL(2,ℤ),mark (g⁻¹ • z)*f z)=2*f z
  rw [ENNReal.tsum_mul_right,hz]
end
end TunnellRankinDomain
#print axioms TunnellRankinDomain.tiles_integral
