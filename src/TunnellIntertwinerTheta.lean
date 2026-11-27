import TunnellFullClassTheta
import TunnellFrameNorm

/-! The full class theta series is the sum of the unscaled norms of Hurwitz intertwiners. -/
namespace TunnellIntertwinerTheta
open TunnellIdealHNF TunnellHurwitz TunnellToricClass TunnellShell TunnellEmbeddedIdeals TunnellToricLocal
open TunnellClassThetaExpansion TunnellIdealThetaExpansion TunnellClassThetaCount TunnellToric TunnellFrameNorm
open scoped Classical UpperHalfPlane
noncomputable section

variable {n : ℕ} (hn : Squarefree n) (h2 : n%4=2) {v w : Triple} (hv : v∈shell n) (hw : w∈shell n)
  {I : Ideal (R n)} (hI : I≠⊥) {a : Q} (ha : a∈J w v) (h0 : a≠0) (e : image hv I=line a*J v w)

def frameEquiv : I ≃ J v w := by
  let f (x : I) : J v w := ⟨a⁻¹*(embed n v hv x.val),by
    have h : embed n v hv x.val∈line a*J v w := e ▸ ⟨_,x.property,rfl⟩
    obtain ⟨q,hq,he⟩ := Submodule.mem_span_singleton_mul.mp h
    rw [←he,←mul_assoc,inv_mul_cancel₀ h0,one_mul]; exact hq⟩
  apply Equiv.ofBijective f
  constructor
  · intro x y h
    exact Subtype.ext (embed_inj hn hv (mul_left_cancel₀ (inv_ne_zero h0) (congrArg Subtype.val h)))
  · rintro ⟨q,hq⟩
    obtain ⟨x,hx,ex⟩ := (mem_image hv).mp (e.symm ▸ Submodule.mem_span_singleton_mul.mpr ⟨q,hq,rfl⟩ : a*q∈image hv I)
    refine ⟨⟨x,hx⟩,Subtype.ext ?_⟩
    change a⁻¹*(embed n v hv x)=q; rw [ex,←mul_assoc,inv_mul_cancel₀ h0,one_mul]

def jterm (z : ℂ) (q : Q) := Complex.exp (2*Real.pi*Complex.I*z*((Quaternion.normSq q:ℚ):ℂ))
def jtheta (v w : Triple) (z : ℂ) := ∑' q : J v w, jterm z q.val

include hn hv h2 hw hI ha h0 e in
theorem frame_theta (z : ℂ) : thetaI I z=jtheta v w z := by
  have hN := frame_norm hn h2 hv hw hI ha e
  have hN' : (normI I:ℂ)≠0 := by exact_mod_cast (normI_positive (by omega) I hI).ne'
  let E := frameEquiv hn hv h0 e
  rw [jtheta,←E.tsum_eq (fun q => jterm z q.val),thetaI]
  apply tsum_congr
  intro x
  have he : a*(E x).val=embed n v hv x.val := by
    change a*(a⁻¹*_)=_; rw [←mul_assoc,mul_inv_cancel₀ h0,one_mul]
  have hnorm := congrArg Quaternion.normSq he
  rw [map_mul,norm_embed hv,hN] at hnorm
  have hh : (normI I:ℂ)*((Quaternion.normSq (E x).val:ℚ):ℂ)=(x.val.norm:ℂ) := by exact_mod_cast hnorm
  rw [normTerm,jterm,←hh]; congr 1; field_simp

lemma conj_norm {n : ℕ} (hn : Squarefree n) (h2 : n%4=2) {I : Ideal (R n)} (hI : I≠⊥) :
    normI (conjugate I)=normI I := by
  apply principal_injective_nat (n:=n)
  rw [←norm_conjugate hn h2 _ (conj_ne_bot hI),conj_invol, mul_comm, norm_conjugate hn h2 I hI]

def conjEquiv (I : Ideal (R n)) : (conjugate I) ≃ I where
  toFun x := ⟨star x.val,x.property⟩
  invFun x := ⟨star x.val,conj_mem _ x.property⟩
  left_inv x := Subtype.ext (star_star _)
  right_inv x := Subtype.ext (star_star _)

include hn h2 hI in
lemma conj_theta (z : ℂ) : thetaI (conjugate I) z=thetaI I z := by
  rw [thetaI,thetaI,←(conjEquiv I).tsum_eq (normTerm I z)]
  apply tsum_congr
  intro x
  simp only [normTerm,conj_norm hn h2 hI,conjEquiv,Equiv.coe_fn_mk,Zsqrtd.norm_conj]

theorem full_by_embeddings {d : ℕ} (hn : Squarefree (2*d)) (h2 : (2*d)%4=2) {v : Triple} (hv : v∈shell (2*d)) (z : ℍ) :
    TunnellFullClassTheta.full hn h2 hv z=∑ w : ↥(representatives (2*d)), jtheta v w.val z := by
  letI := TunnellFullClassTheta.classFintype hn h2 hv
  let E := idealEquiv hn h2 hv
  rw [TunnellFullClassTheta.full,← E.sum_comp (fun w => jtheta v w.val z)]
  apply Finset.sum_congr rfl
  intro c _
  have hc : E c=representative hn h2 hv c.out := by
    conv_lhs => rw [←Quotient.out_eq c]
    rfl
  rw [hc,liftClass,conj_theta hn h2 (preimage_ne_bot hn h2 hv c.out)]
  obtain ⟨a,ha,h0,e⟩ := representative_frame hn h2 hv c.out
  exact frame_theta hn h2 hv (Finset.mem_filter.mp (representative hn h2 hv c.out).property).1 (preimage_ne_bot hn h2 hv c.out) ha h0
    ((image_preimage hn h2 hv c.out).trans e) z

end
end TunnellIntertwinerTheta
#print axioms TunnellIntertwinerTheta.full_by_embeddings
