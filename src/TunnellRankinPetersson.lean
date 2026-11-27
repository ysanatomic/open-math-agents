import TunnellRankinStripMellin
import Mathlib.MeasureTheory.Integral.DominatedConvergence

/-! Unfolding the actual Petersson integral in the absolutely convergent right half-plane. -/
namespace TunnellRankinIntegral
open Complex Matrix MatrixGroups ModularGroup CongruenceSubgroup TunnellRankinEisenstein TunnellRankin
open TunnellShell TunnellFullClassTheta TunnellEtaValue Set MeasureTheory
open UpperHalfPlane hiding I
open scoped ComplexConjugate ENNReal
noncomputable section

lemma unfold_tsum (L : ℕ) {f : ℍ→ℂ} (hf : Measurable f)
    (hi : IntegrableOn f stripSet) (hp : ∀ (n : ℤ) z, f (T^n • z)=f z) :
    (∑' q : Cosets L,∫ z in fdo, ∑' r : Rows L,f (tileMatrix (q,r) • z))=
      2*∫ z in stripSet,f z := by
  letI : Countable (Rows L) := Function.Injective.countable (f:=fun r : Rows L => r.val) Subtype.val_injective
  have ha := unfold_complex L hf hi hp
  have en := unfold_nonneg L hf.enorm (fun n z => congrArg (‖·‖ₑ) (hp n z))
  have ht : (∑' (q : Cosets L) (r : Rows L), ∫⁻ z in fdo,‖f (tileMatrix (q,r) • z)‖ₑ)≠⊤ := by
    change (∑' (q : Cosets L) (r : Rows L), ∫⁻ z in fdo,‖f (((liftRow r).val*rep q) • z)‖ₑ)≠⊤
    rw [en]
    exact ENNReal.mul_ne_top (by norm_num) hi.2.ne
  have hh (q : Cosets L) : (∫ z in fdo, ∑' r : Rows L,f (tileMatrix (q,r) • z))=
      ∑' r : Rows L,∫ z in fdo,f (tileMatrix (q,r) • z) := by
    apply integral_tsum
    · intro r
      apply Measurable.aestronglyMeasurable
      exact hf.comp (measurePreserving_smul (tileMatrix (q,r):GL (Fin 2) ℝ) volume).measurable
    · exact ne_top_of_le_ne_top ht (ENNReal.le_tsum q)
  simp_rw [hh]
  rw [←ha.summable.tsum_prod]
  exact ha.tsum_eq

def petersson (L : ℕ) (F : ℍ→ℂ) : ℂ :=
  ∑' q : Cosets L, ∫ z in fdo,F (rep q • z)

variable {d : ℕ} {b : Triple} (hsq : Squarefree (2*d)) (hd : d%4=1) (hb : b∈shell (2*d))

lemma strip_trans (s : ℝ) (n : ℤ) (z : ℍ) :
    stripIntegrand (full hsq (by omega) hb) (s:ℂ) (T^n • z)=stripIntegrand (full hsq (by omega) hb) (s:ℂ) z := by
  have hg (L : ℕ) : (T^n:SL(2,ℤ))∈Gamma0 L := by rw [Gamma0_mem]; simp [coe_T_zpow]
  have hj : denom (T^n:SL(2,ℤ)) z=1 := by rw [ModularGroup.denom_apply]; simp [coe_T_zpow]
  have ht := full_action_one hsq hd hb z (T^n) (hg _)
  rw [hj] at ht
  have he : (T^n:SL(2,ℤ)) 1 1=1 := by simp [coe_T_zpow]
  rw [he,Int.cast_one,map_one,one_mul,one_mul] at ht
  simp only [stripIntegrand,im_T_zpow_smul,TunnellEtaLevel.eta_level _ (hg 32),hj,one_pow,one_mul,ht]

theorem petersson_large (s : ℝ) (hs : 8<s) :
    haveI : NeZero (4*(2*d)) := ⟨by omega⟩
    petersson (4*(2*d)*4) (integrand (k:=4) (negCharacter d (by omega)) (full hsq (by omega) hb) (s:ℂ))=
      4*conj ((negCharacter d (by omega)).LFunction (2*(s:ℂ)-1))*
        (4*(Real.pi:ℂ))^(-(s:ℂ))*mellin (strip d) (s:ℂ) := by
  letI : NeZero (4*(2*d)) := ⟨by omega⟩
  let θ := full hsq (by omega) hb
  let f := stripIntegrand θ (s:ℂ)
  have he : f=fun z : ℍ => (z.im:ℂ)^2*planeStrip θ s (coords z) := funext (planeStrip_eq _ _)
  have hf : Measurable f := by
    rw [he]
    exact ((Complex.continuous_ofReal.comp UpperHalfPlane.continuous_im).measurable.pow_const 2).mul
      ((planeStrip_meas (full_meas hsq hd hb) s).comp coords_embedding.measurable)
  have hi : IntegrableOn f stripSet := by rw [he,coords_integrable]; exact plane_integrable hsq hd hb hs
  have hright := unfold_tsum (4*(2*d)*4) hf hi (strip_trans hsq hd hb s)
  have ht := strip_mellin hsq hd hb hs
  change (∫ z in stripSet,f z)=_ at ht
  rw [ht] at hright
  have hp (q : Cosets (4*(2*d)*4)) (z : ℍ) :=
    periodization hsq hd hb (rep q • z) (s:ℂ) (by simpa using (show 3/2<s by linarith))
  simp only [Complex.conj_ofReal,←mul_smul] at hp
  unfold petersson
  simp_rw [hp,integral_const_mul]
  rw [tsum_mul_left]
  change _* (∑' q : Cosets (4*(2*d)*4),∫ z in fdo, ∑' r : Rows (4*(2*d)*4),f (tileMatrix (q,r) • z))=_
  rw [hright]
  ring
end
end TunnellRankinIntegral
#print axioms TunnellRankinIntegral.petersson_large
