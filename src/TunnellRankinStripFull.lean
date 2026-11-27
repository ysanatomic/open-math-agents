import TunnellRankinCoordinates
import TunnellRankinUnfold

/-! The horizontal integral contains the full ideal class theta; its constant contributes zero. -/
namespace TunnellRankinIntegral
open Complex AddCircle Set Function ModularForm TunnellRankin TunnellCMLSeries TunnellClassThetaMellin
open TunnellFullClassTheta TunnellShell TunnellEtaValue MeasureTheory
open UpperHalfPlane hiding I
open scoped ComplexConjugate
noncomputable section

lemma circle_mean {a : ℕ→ℂ} (ha : Summable a) :
    (∫ x : AddCircle (1:ℝ),circleSeries a x ∂haarAddCircle)=a 0 := by
  let u (n : ℕ) : ℂ := if n=0 then 1 else 0
  have hu : Summable u := (hasSum_ite_eq 0 (1:ℂ)).summable
  have hS : circleSeries u=1 := by
    unfold circleSeries
    rw [tsum_eq_single 0]
    · ext x
      simp [u,fourier_zero]
    · intro j hj
      ext x
      simp [u,hj]
  have eq := (circle_parseval ha hu).tsum_eq
  rw [hS] at eq
  have hh (n : ℕ) : a n*conj (u n)=if n=0 then a 0 else 0 := by
    by_cases e : n=0 <;> simp [u,e]
  simpa [hh] using eq.symm

lemma horizontal_full {d : ℕ} {b : Triple} (hs : Squarefree (2*d)) (hd : d%4=1)
    (hb : b∈shell (2*d)) {t : ℝ} (ht : 0<t) :
    (∫ x : ℝ in 0..1, etaValue (point x t ht)*conj (full hs (by omega) hb (point x t ht)))=
      2*strip d t := by
  letI := classFintype hs (by omega) hb
  let A := circleSeries (mode (twistA 1) t)
  let B := circleSeries (mode (fun m => (idealCoeff d m:ℂ)) t)
  let H : ℂ := Fintype.card (TunnellToricClass.ProperIdealClass b)
  let F (x : AddCircle (1:ℝ)) := A x*conj (H+2*B x)
  have e := fourierCoeff_eq_intervalIntegral F 0 0
  simp only [fourierCoeff,neg_zero,fourier_zero,one_smul,div_one,zero_add] at e
  have eH (x : ℝ) : F (x : AddCircle (1:ℝ))=etaValue (point x t ht)*conj (full hs (by omega) hb (point x t ht)) := by
    rw [TunnellEtaLevel.physical,full_expansion]
    simp only [F,A,B,H,circle_eta x t ht,circle_theta d x t ht]
  rw [←intervalIntegral.integral_congr (fun x _ => eH x),←e]
  change (∫ x : AddCircle (1:ℝ),F x ∂haarAddCircle)=_
  have hmean : ∫ x : AddCircle (1:ℝ),A x ∂haarAddCircle=0 := by
    obtain ⟨C,hC⟩ := base_growth
    simpa [A,mode,twistA,gaussCoeff,twistSign] using circle_mean (summable_mode hC ht)
  have ef (x : AddCircle (1:ℝ)) : F x=conj H*A x + 2*(conj (B x)*A x) := by
    simp only [F,map_add,map_mul,map_ofNat]; ring
  simp_rw [ef]
  rw [integral_add,integral_const_mul,integral_const_mul,hmean,mul_zero,zero_add]
  · rfl
  · exact A.continuous.integrable_of_hasCompactSupport (HasCompactSupport.of_compactSpace _)
      |>.const_mul _
  · apply Integrable.const_mul
    apply Continuous.integrable_of_hasCompactSupport _ (HasCompactSupport.of_compactSpace _)
    exact (continuous_star.comp B.continuous).mul A.continuous
end
end TunnellRankinIntegral
#print axioms TunnellRankinIntegral.horizontal_full
