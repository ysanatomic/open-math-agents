import TunnellRankinLatticeShape

/-! A uniform polynomial growth bound for the actual continued lattice sum (uniform on |s| ≤ 12). -/
namespace TunnellRankinMajorant
open Complex TunnellRankinEisenstein TunnellCMRegularized Filter Finset
open UpperHalfPlane hiding I
open scoped ComplexConjugate
noncomputable section

lemma period_vector (k : ℕ) [NeZero k] (z : ℍ) (p : ℤ×ℤ) :
    ((periods k z).latticeEquivProd.symm p:ℂ)=vector k z p := by
  rw [PeriodPair.latticeEquiv_symm_apply]
  simp [periods,vector]

lemma summable_fixed : Summable (fun p : ℤ×ℤ => (1+‖vector 1 UpperHalfPlane.I p‖)^(-(5/2):ℝ)) := by
  let L := periods 1 UpperHalfPlane.I
  have h := ZLattice.summable_norm_rpow L.lattice (-(5/2):ℝ) (by simp; norm_num)
  have h0 : Summable (fun w : L.lattice => if w=0 then (1:ℝ) else 0) := (hasSum_ite_eq 0 1).summable
  have ha : Summable (fun w : L.lattice => (1+‖(w:ℂ)‖)^(-(5/2):ℝ)) := by
    apply (h.add h0).of_nonneg_of_le (fun _ => by positivity)
    intro w
    by_cases e : w=0
    · subst w; norm_num
    · have hw : (w:ℂ)≠0 := fun hz => e (Subtype.ext hz)
      simpa [e] using Real.rpow_le_rpow_of_nonpos (norm_pos_iff.mpr hw) (show ‖(w:ℂ)‖≤1+‖(w:ℂ)‖ by linarith) (by norm_num : -(5/2:ℝ)≤0)
  have he := (L.latticeEquivProd.symm.toEquiv.summable_iff).mpr ha
  apply he.congr
  intro p
  change (1+‖((periods 1 UpperHalfPlane.I).latticeEquivProd.symm p:ℂ)‖)^(-(5/2):ℝ)=_
  rw [period_vector]

lemma periodized (k : ℕ) [NeZero k] (z : ℍ) (a : ℕ) (q s : ℂ) :
    regularized (periods k z) a q s=∑' p : ℤ×ℤ,difference a q (vector k z p) s := by
  unfold regularized
  rw [← (periods k z).latticeEquivProd.symm.toEquiv.tsum_eq (fun w : (periods k z).lattice => difference a q w s)]
  apply tsum_congr
  intro p
  rw [←period_vector]
  rfl

lemma shifted_bound (N k : ℕ) [NeZero N] [NeZero k] (a m : ℕ) :
    ∃ C : ℝ, 0≤C ∧ ∀ (z : ℍ) {s : ℂ}, ‖s‖≤12 → 3/4<s.re →
      ‖regularized (periods k z) a ((m:ℂ)/N) s‖≤C*(scale N k z)^27 := by
  obtain ⟨D,hD,h⟩ := summand_weight (K:=24) (show (0:ℝ)≤12 by norm_num) a ((m:ℂ)/N)
  let W (p : ℤ×ℤ) := (1+‖vector 1 UpperHalfPlane.I p‖)^(-(5/2):ℝ)
  refine ⟨D*(∑' p,W p),mul_nonneg hD (tsum_nonneg fun _ => by dsimp [W]; positivity),?_⟩
  intro z s hs hDmn
  have tpos := (scale_base N k z).1
  have e (p : ℤ×ℤ) : ‖difference a ((m:ℂ)/N) (vector k z p) s‖≤D*scale N k z^27*W p := by
    apply h tpos (norm_nonneg _) hs hDmn (by norm_num; linarith [Complex.re_le_norm s]) (distortion _ _ _ _)
    · simpa using grid N k z p 0
    · simpa using grid N k z p (m:ℤ)
    · simpa [mul_div_assoc] using grid N k z p ((a:ℤ)*m)
  have hsum : Summable (fun p => D*scale N k z^27*W p) := summable_fixed.mul_left _
  rw [periodized]
  apply (norm_tsum_le_tsum_norm (hsum.of_nonneg_of_le (fun _ => norm_nonneg _) e)).trans
  apply (Summable.tsum_le_tsum e (hsum.of_nonneg_of_le (fun _ => norm_nonneg _) e) hsum).trans
  rw [tsum_mul_left]
  exact le_of_eq (by ring)

theorem regular_bound (N k : ℕ) [NeZero N] [NeZero k] (χ : ZMod N→ℂ) :
    ∃ C : ℝ, 0≤C ∧ ∀ (z : ℍ) {s : ℂ}, ‖s‖≤12 → 3/4<s.re → ‖regular N k χ z s‖≤C*scale N k z^27 := by
  classical
  choose C hC hh using fun r : ZMod N => shifted_bound N k (aux N) r.val
  let A := ∑ r : ZMod N, ‖χ r‖*C r
  let B := ‖(aux N:ℂ)^2-(aux N:ℂ)‖
  have hA : 0≤A := sum_nonneg fun _ _ => mul_nonneg (norm_nonneg _) (hC _)
  have hB : 0<B := norm_pos_iff.mpr (aux_ne N)
  refine ⟨A/B,div_nonneg hA hB.le,?_⟩
  intro z s hs hs'
  change ‖(∑ r : ZMod N, χ r*regularized (periods k z) (aux N) ((r.val:ℂ)/N) s) / _‖≤_
  rw [norm_div]
  change _/B≤_
  rw [div_le_iff₀ hB]
  apply (norm_sum_le _ _).trans
  simp only [norm_mul]
  calc
    _ ≤ ∑ r : ZMod N, ‖χ r‖*(C r*scale N k z^27) :=
      sum_le_sum fun r _ => mul_le_mul_of_nonneg_left (hh r z hs hs') (norm_nonneg _)
    _ = A*scale N k z^27 := by simp [A,sum_mul,mul_assoc]
    _ = A/B*scale N k z^27*B := by field_simp
end
end TunnellRankinMajorant
#print axioms TunnellRankinMajorant.regular_bound
