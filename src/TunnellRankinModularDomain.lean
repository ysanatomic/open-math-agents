import Mathlib.NumberTheory.Modular
import Mathlib.Analysis.Complex.UpperHalfPlane.Measure
import Mathlib.MeasureTheory.Measure.Lebesgue.Complex
import Mathlib.MeasureTheory.Group.FundamentalDomain

/-! The open modular polygon tiles almost every point exactly twice when indexed by SL₂(ℤ). -/
namespace TunnellRankinDomain
open Complex Matrix MatrixGroups ModularGroup UpperHalfPlane Set MeasureTheory Metric
open scoped Pointwise Modular
noncomputable section

lemma vertical_null (r : ℝ) : volume {z : ℂ | z.re=r}=0 := by
  let s := ({r}:Set ℝ) ×ˢ (univ:Set ℝ)
  have e : ({z : ℂ | z.re=r}:Set ℂ) = measurableEquivRealProd ⁻¹' s := by ext; simp [s]
  rw [e,volume_preserving_equiv_real_prod.measure_preimage_equiv,Measure.volume_eq_prod]
  simp [s]

lemma boundary_null : volume (fd\fdo)=0 := by
  have h : volume (UpperHalfPlane.coe '' (fd\fdo))=0 := by
    apply measure_mono_null (t:=(sphere (0:ℂ) 1 ∪ {z : ℂ | z.re=1/2}) ∪ {z : ℂ | z.re= -(1/2)})
    · rintro _ ⟨z,⟨hz,hn⟩,rfl⟩
      change 1≤normSq (z:ℂ) ∧ |z.re|≤1/2 at hz
      change ¬(1<normSq (z:ℂ) ∧ |z.re|<1/2) at hn
      by_cases eq : ‖(z:ℂ)‖=1
      · exact Or.inl (Or.inl (by simpa using eq))
      have hnorm : 1<normSq (z:ℂ) := by
        rw [normSq_eq_norm_sq] at hz ⊢
        apply (one_lt_sq_iff₀ (norm_nonneg _)).mpr
        exact lt_of_le_of_ne ((one_le_sq_iff₀ (norm_nonneg _)).mp hz.1) (Ne.symm eq)
      have ha : |z.re|=1/2 := le_antisymm hz.2 (le_of_not_gt fun hh => hn ⟨hnorm,hh⟩)
      rcases abs_choice z.re with h|h
      · exact Or.inl (Or.inr (by change z.re=1/2; linarith))
      · exact Or.inr (by change z.re= -(1/2); linarith)
    · exact measure_union_null (measure_union_null (Measure.addHaar_sphere volume (0:ℂ) 1) (vertical_null _)) (vertical_null _)
  rw [UpperHalfPlane.volume_eq_lintegral,Measure.restrict_eq_zero.mpr h,lintegral_zero_measure]

lemma smul_null (g : SL(2,ℤ)) (s : Set ℍ) (hs : volume s=0) :
    volume ((g • ·) ⁻¹' s) = 0 :=
  measure_preimage_smul_null hs (g:GL (Fin 2) ℝ)

theorem ae_pair : ∀ᵐ z : ℍ, ∃ g : SL(2,ℤ),
    ∀ h : SL(2,ℤ), h • z∈fdo ↔ h=g ∨ h= -g := by
  letI : Countable (Matrix (Fin 2) (Fin 2) ℤ) := inferInstanceAs (Countable (Fin 2→Fin 2→ℤ))
  letI : Countable (SL(2,ℤ)) := Function.Injective.countable (f:=fun g : SL(2,ℤ) => g.val) Subtype.val_injective
  have he : ∀ᵐ z : ℍ, ∀ g : SL(2,ℤ), g • z∉fd\fdo := by
    apply ae_all_iff.mpr
    intro g
    apply ae_iff.mpr
    convert smul_null g _ boundary_null using 2
    ext z
    simp
  filter_upwards [he] with z hz
  obtain ⟨g,hg⟩ := exists_smul_mem_fd z
  have hg' : g • z∈fdo := by by_contra e; exact hz g ⟨hg,e⟩
  refine ⟨g,fun h => ⟨fun hh => ?_,?_⟩⟩
  · have H : (h*g⁻¹) • (g • z)∈fdo := by simpa [mul_smul] using hh
    rcases eq_one_or_neg_one_of_mem_fdo_mem_fdo hg' H with eq|eq
    · left; exact mul_inv_eq_one.mp eq
    · right
      calc
        h=(h*g⁻¹)*g := by simp
        _= -g := by rw [eq]; simp
  · rintro (rfl|rfl) <;> simpa only [SL_neg_smul] using hg'

end
end TunnellRankinDomain
#print axioms TunnellRankinDomain.ae_pair
