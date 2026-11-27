import TunnellRankinCosetTiles
import TunnellRankinTileIntegral

/-! Tonelli unfolding over the width-one horizontal strip; the signed rows count both central lifts. -/
namespace TunnellRankinIntegral
open Complex Matrix MatrixGroups ModularGroup CongruenceSubgroup TunnellRankinEisenstein
open TunnellRankinDomain UpperHalfPlane MeasureTheory Set
open scoped Pointwise ENNReal
noncomputable section

def stripSet : Set ℍ := (fun z : ℍ => z.re) ⁻¹' Ico 0 1

lemma meas_strip : MeasurableSet stripSet := measurableSet_Ico.preimage continuous_re.measurable

lemma strip_at (n : ℤ) (z : ℍ) : T^n • z∈stripSet ↔ n= -⌊z.re⌋ := by
  change (T^n • z).re∈Ico 0 1 ↔ _
  rw [re_T_zpow_smul,←Int.floor_eq_zero_iff,Int.floor_add_intCast]
  omega

lemma partition (f : ℍ→ℝ≥0∞) (hp : ∀ (n : ℤ) z, f (T^n • z)=f z) (z : ℍ) :
    (∑' n : ℤ,stripSet.indicator f (T^n • z))=f z := by
  classical
  simp only [Set.indicator_apply,strip_at,hp]
  simp

theorem unfold_nonneg (L : ℕ) {f : ℍ→ℝ≥0∞} (hf : Measurable f)
    (hp : ∀ (n : ℤ) z, f (T^n • z)=f z) :
    (∑' (q : Cosets L) (r : Rows L), ∫⁻ z in fdo, f (((liftRow r).val*rep q) • z))=
      2*∫⁻ z in stripSet, f z := by
  let u := stripSet.indicator f
  have hu : Measurable u := hf.indicator meas_strip
  have hm (g : SL(2,ℤ)) : Measurable (fun z : ℍ => u (g • z)) :=
    hu.comp (measurePreserving_smul (g:GL (Fin 2) ℝ) volume).measurable
  have e (q : Cosets L) (r : Rows L) :
      (∑' n : ℤ, ∫⁻ z in fdo,u ((tiles L (q,n,r)) • z))=
        ∫⁻ z in fdo,f (((liftRow r).val*rep q) • z) := by
    rw [←lintegral_tsum (fun n => (hm (tiles L (q,n,r))).aemeasurable)]
    apply lintegral_congr
    intro z
    simp only [tiles_apply,mul_assoc,mul_smul]
    exact partition f hp _
  calc
    _ = ∑' (q : Cosets L) (r : Rows L) (n : ℤ),∫⁻ z in fdo,u ((tiles L (q,n,r)) • z) := by simp_rw [e]
    _ = ∑' (q : Cosets L) (n : ℤ) (r : Rows L),∫⁻ z in fdo,u ((tiles L (q,n,r)) • z) :=
      tsum_congr fun q => ENNReal.tsum_comm
    _ = ∑' p : Cosets L × (ℤ×Rows L),∫⁻ z in fdo,u ((tiles L p) • z) := by
      rw [ENNReal.tsum_prod']
      apply tsum_congr
      intro q
      rw [ENNReal.tsum_prod']
    _ = ∑' g : SL(2,ℤ), ∫⁻ z in fdo, u (g • z) :=
      (tiles L).tsum_eq (fun g : SL(2,ℤ) => ∫⁻ z in fdo,u (g • z))
    _ = _ := by rw [tiles_integral hu,lintegral_indicator meas_strip]
end
end TunnellRankinIntegral
#print axioms TunnellRankinIntegral.unfold_nonneg
