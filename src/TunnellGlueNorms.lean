import TunnellGlueIsometry

/-! The common quadratic form of each ramified gluing is the integral quaternion norm after framing. -/
namespace TunnellGlueNorms
open TunnellShell TunnellHurwitz TunnellToricClass TunnellToricLocal TunnellEmbeddedIdeals
open TunnellIdealHNF TunnellPairComponents TunnellCMGluing TunnellSwitchComponents TunnellIdealGluings TunnellBinaryPairModel
open TunnellFrameNorm TunnellIntertwinerTheta TunnellGlueIsometry TunnellGenusCharacter TunnellClassThetaCount TunnellIdealThetaExpansion
noncomputable section

variable {d : ℕ} {v : Triple} (hv : v∈shell (2*d))
local notation "Ord" => TunnellIdealHNF.R (2*d)
local notation "ι" => TunnellHurwitz.pure

lemma norm_plusI (hn : Squarefree (2*d)) (h2 : (2*d)%4=2) {A B : Ideal Ord} (hA : A≠⊥) (hB : B≠⊥) :
    normI (plusI B A)=normI B*normI A := by rw [plusI,normI_mul hn h2 hB (conj_ne_bot hA),conj_norm hn h2 hA]
lemma norm_minusI (hn : Squarefree (2*d)) (h2 : (2*d)%4=2) {A B C₀ : Ideal Ord} (hA : A≠⊥) (hB : B≠⊥) (hC : C₀≠⊥) :
    normI (minusI B A C₀)=normI B*normI C₀*normI A := by
  rw [minusI,normI_mul hn h2 (mul_ne_bot (by omega) (conj_ne_bot hB) hC) (conj_ne_bot hA),
    normI_mul hn h2 (conj_ne_bot hB) hC,conj_norm hn h2 hA,conj_norm hn h2 hB]

theorem eval_norm (hn : Squarefree (2*d)) (h2 : (2*d)%4=2) {A B C₀ : Ideal Ord} (hA : A≠⊥) (hB : B≠⊥) (hC : C₀≠⊥)
    {u : Q} (hu : u∈J (-v) v) (hu0 : u≠0) (ec : image hv C₀=line u*J v (-v)) (x : (plusI B A)×(minusI B A C₀)) :
    Quaternion.normSq (eval hv u _ _ x)=(normI B:ℚ)*normI A*(TunnellIntegralPacket.value x:ℤ) := by
  have nC := frame_norm hn h2 hv (shell_neg hv) hC hu ec
  have hc0 : (normI C₀:ℚ)≠0 := by exact_mod_cast (normI_positive (by omega) C₀ hC).ne'
  have hu' : ι v*u= -(u*ι v) := by simpa [pure_neg] using hu.2
  have hc (L : Ideal Ord) (y : L) : embed (2*d) v hv y.val∈C v := center_image hv L ⟨_,y.property,rfl⟩
  have hright := scale_anti hu' hu0 (hc _ x.2)
  have hright' : 2*(u⁻¹*embed (2*d) v hv x.2.val)∈anti v := by simpa only [zsmul_eq_mul,Int.cast_ofNat] using (anti v).smul_mem (2:ℤ) hright
  change Quaternion.normSq (embed _ _ hv x.1.val+2*(u⁻¹*embed _ _ hv x.2.val))=_
  have n2 : Quaternion.normSq (2:Q)=4 := by
    have e (k : ℕ) : Quaternion.normSq (k:Q)=(k:ℚ)^2 := by simpa only [Quaternion.coe_natCast] using Quaternion.normSq_coe (k:ℚ)
    exact (e 2).trans (by norm_num)
  have hI : plusI B A≠⊥ := mul_ne_bot (by omega) hB (conj_ne_bot hA)
  have hJ : minusI B A C₀≠⊥ := mul_ne_bot (by omega) (mul_ne_bot (by omega) (conj_ne_bot hB) hC) (conj_ne_bot hA)
  rw [orthogonal (by omega) hv (hc _ x.1) hright',map_mul,map_mul,map_inv₀,n2,nC,norm_embed,norm_embed,
    norm_valZ hn h2 hI,norm_valZ hn h2 hJ,norm_plusI hn h2 hA hB,norm_minusI hn h2 hA hB hC]
  unfold TunnellIntegralPacket.value; push_cast; field_simp <;> ring

lemma act_norm (b c : Q) (N : ℚ) (hn : Quaternion.normSq b*Quaternion.normSq c=N) (x : Q) :
    Quaternion.normSq (action b c x)=N*Quaternion.normSq x := by
  unfold action; rw [map_mul,map_mul,←hn]; ring


end
end TunnellGlueNorms
#print axioms TunnellGlueNorms.eval_norm

