import TunnellRankinPetersson

/-! Integration on the finite-index modular quotient and invariance under
replacement of its multiplicity-two fundamental-domain weight. -/
namespace TunnellPeterssonMask
open Complex Matrix MatrixGroups ModularGroup CongruenceSubgroup MeasureTheory Set
open TunnellRankinIntegral TunnellRankinDomain
open UpperHalfPlane hiding I
open scoped ENNReal Pointwise
noncomputable section
local instance : Countable (Matrix (Fin 2) (Fin 2) ℤ) := inferInstanceAs (Countable (Fin 2→Fin 2→ℤ))
local instance : Countable (SL(2,ℤ)) := Function.Injective.countable (f:=fun g : SL(2,ℤ) => g.val) Subtype.val_injective

local instance (L : ℕ) : Countable (Cosets L) := Function.Injective.countable (f:=fun q : Cosets L => q.out) Quotient.out_injective

def mask (L : ℕ) (z : ℍ) := ∑' q : Cosets L, mark ((rep q)⁻¹ • z)
def quotientMeasure (L : ℕ) : Measure ℍ := volume.withDensity (mask L)

lemma mask_meas (L : ℕ) : Measurable (mask L) := by
  apply Measurable.ennreal_tsum
  intro q
  exact mark_meas.comp (measurePreserving_smul (((rep q)⁻¹:SL(2,ℤ)):GL (Fin 2) ℝ) volume).measurable

lemma twice (L : ℕ) : ∀ᵐ z : ℍ, ∑' g : Gamma0 L, mask L (g.val⁻¹ • z)=2 := by
  filter_upwards [ae_mark] with z hz
  unfold mask
  rw [ENNReal.tsum_comm]
  let e := Equiv.ofBijective _ (cosetProd_bijective L)
  have h := e.tsum_eq (fun g : SL(2,ℤ) => mark (g⁻¹ • z))
  rw [←hz,←h,ENNReal.tsum_prod']
  apply tsum_congr; intro q; apply tsum_congr; intro g
  change _=mark ((g.val*rep q)⁻¹ • z)
  rw [_root_.mul_inv_rev,mul_smul]

lemma quotient_lintegral (L : ℕ) {f : ℍ→ℝ≥0∞} (hf : Measurable f) :
    ∫⁻ z, f z ∂quotientMeasure L=∑' q : Cosets L,∫⁻ z in fdo,f (rep q • z) := by
  rw [quotientMeasure,lintegral_withDensity_eq_lintegral_mul _ (mask_meas L) hf]
  simp_rw [pull_eq _ hf]
  rw [←lintegral_tsum (fun q : Cosets L => (pull_meas (rep q) hf).aemeasurable)]
  apply lintegral_congr; intro z
  exact (ENNReal.tsum_mul_right).symm

lemma replace_mask (L : ℕ) {a b f : ℍ→ℝ≥0∞} (ha : Measurable a) (hb : Measurable b) (hf : Measurable f)
    (A : ∀ᵐ z:ℍ, ∑' g : Gamma0 L, a (g.val⁻¹ • z)=2)
    (B : ∀ᵐ z:ℍ, ∑' g : Gamma0 L, b (g.val⁻¹ • z)=2)
    (inv : ∀ (g : Gamma0 L) z, f (g.val • z)=f z) :
    ∫⁻ z,a z*f z=∫⁻ z,b z*f z := by
  have mp (g : Gamma0 L) : MeasurePreserving (fun z : ℍ => g.val • z) :=
    measurePreserving_smul (g.val:GL (Fin 2) ℝ) volume
  have expand (a b : ℍ→ℝ≥0∞) (ha : Measurable a) (hb : Measurable b)
      (H : ∀ᵐ z:ℍ,∑' g : Gamma0 L,b (g.val⁻¹ • z)=2) :
      2*(∫⁻ z,a z*f z)=∑' g : Gamma0 L,∫⁻ z,b (g.val⁻¹ • z)*(a z*f z) := by
    rw [←lintegral_const_mul 2 (show Measurable (fun z => a z*f z) from ha.mul hf),←lintegral_tsum (fun (g : Gamma0 L) =>
      (show Measurable (fun z : ℍ => b (g.val⁻¹ • z)*(a z*f z)) from (hb.comp (mp g⁻¹).measurable).mul (ha.mul hf)).aemeasurable)]
    apply lintegral_congr_ae
    filter_upwards [H] with z hz
    rw [ENNReal.tsum_mul_right,hz]
  apply (ENNReal.mul_right_inj (by norm_num : (2:ℝ≥0∞)≠0) (by norm_num : (2:ℝ≥0∞)≠⊤)).mp
  rw [expand a b ha hb B,expand b a hb ha A,←(Equiv.inv (Gamma0 L)).tsum_eq (fun g : Gamma0 L => ∫⁻ z,a (g.val⁻¹ • z)*(b z*f z))]
  apply tsum_congr
  intro g
  rw [←(mp g).lintegral_comp (show Measurable (fun z : ℍ => b (g.val⁻¹ • z)*(a z*f z)) from (hb.comp (mp g⁻¹).measurable).mul (ha.mul hf))]
  apply lintegral_congr
  intro z
  simp [-ModularGroup.sl_moeb,inv,mul_left_comm]

end
end TunnellPeterssonMask
#print axioms TunnellPeterssonMask.replace_mask
