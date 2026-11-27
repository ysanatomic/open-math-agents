import TunnellIdealGluings
import TunnellIdealFormBasis

/-! Simultaneous norm-preserving coordinates on the commuting and anticommuting components. -/
namespace TunnellBinaryPairModel
open TunnellShell TunnellHurwitz TunnellToricClass TunnellToricLocal TunnellEmbeddedIdeals
open TunnellIdealHNF TunnellPairComponents TunnellCMGluing TunnellSwitchComponents TunnellIdealGluings
open TunnellFrameNorm TunnellIntertwinerTheta
noncomputable section
local notation "ι" => TunnellHurwitz.pure

lemma pure_nonzero {n : ℕ} (hn : n≠0) {v : Triple} (hv : v∈shell n) : ι v≠0 := by
  intro e; have h := pure_square hv; rw [e,zero_mul] at h
  exact TunnellRamifiedSwitch.nat_nonzero hn (neg_eq_zero.mp h.symm)

lemma re_comm (x y : Q) : (x*y).re=(y*x).re := by rw [Quaternion.re_mul,Quaternion.re_mul]; ring

lemma anti_re {n : ℕ} (hn : n≠0) {v : Triple} (hv : v∈shell n) {x : Q} (hx : x∈anti v) : x.re=0 := by
  have hu := pure_nonzero hn hv
  have H : ι v*x*(ι v)⁻¹= -x := by rw [mem_anti.mp hx,neg_mul,mul_assoc,mul_inv_cancel₀ hu,mul_one]
  have e := congrArg QuaternionAlgebra.re H
  rw [re_comm,←mul_assoc,inv_mul_cancel₀ hu,one_mul,Quaternion.re_neg] at e
  linarith

lemma anti_star {v : Triple} {y : Q} (hy : y∈anti v) : star y∈anti v := by
  have h := congrArg star (mem_anti.mp hy)
  simp only [star_mul,pure_star,star_neg,mul_neg,neg_mul,neg_neg] at h
  exact mem_anti.mpr h.symm

lemma orthogonal {n : ℕ} (hn : n≠0) {v : Triple} (hv : v∈shell n) {x y : Q} (hx : x∈C v) (hy : y∈anti v) :
    Quaternion.normSq (x+y)=Quaternion.normSq x+Quaternion.normSq y := by
  rw [Quaternion.normSq_add,anti_re hn hv ((C_anti v) (Submodule.mul_mem_mul hx (anti_star hy))),mul_zero,add_zero]

lemma disjoint {n : ℕ} (hn : n≠0) {v : Triple} (hv : v∈shell n) : Disjoint (C v) (anti v) := by
  rw [Submodule.disjoint_def]
  intro x hx hy
  have e := (mem_C.mp hx).symm.trans (mem_anti.mp hy)
  have e' : (2:Q)*(x*ι v)=0 := by rw [two_mul,add_eq_zero_iff_eq_neg]; exact e
  have h₂ : (2:Q)≠0 := TunnellRamifiedSwitch.nat_nonzero (a:=2) (by decide)
  exact (mul_eq_zero.mp ((mul_eq_zero.mp e').resolve_left h₂)).resolve_right (pure_nonzero hn hv)

variable {n : ℕ} {v : Triple} (hv : v∈shell n)
abbrev Ord := TunnellIdealHNF.R n
def plusI (B A : Ideal (TunnellIdealHNF.R n)) := B*conjugate A
def minusI (B A C₀ : Ideal (TunnellIdealHNF.R n)) := conjugate B*C₀*conjugate A
def eval (u : Q) (I J : Ideal (TunnellIdealHNF.R n)) : (I×J) →+ Q where
  toFun x := embed n v hv x.1.val+2*(u⁻¹*embed n v hv x.2.val)
  map_zero' := by simp
  map_add' x y := by change embed n v hv (_+_)+2*(u⁻¹*embed n v hv (_+_))=_; rw [map_add,map_add,mul_add,mul_add]; abel

lemma scale_anti {u : Q} (hu : ι v*u= -(u*ι v)) (hu0 : u≠0) {q : Q} (hq : q∈C v) :
    u⁻¹*q∈anti v := by
  apply mem_anti.mpr
  apply mul_left_cancel₀ hu0
  have he : u*ι v= -(ι v*u) := by rw [hu,neg_neg]
  rw [←mul_assoc u,he,neg_mul,mul_assoc (ι v),←mul_assoc u,mul_inv_cancel₀ hu0,one_mul,
    mul_neg,←mul_assoc u,←mul_assoc u,mul_inv_cancel₀ hu0,one_mul,mem_C.mp hq]

lemma injective (hn : Squarefree n) (h0 : n≠0) {u : Q} (hu : ι v*u= -(u*ι v)) (hu0 : u≠0) (I J : Ideal (TunnellIdealHNF.R n)) :
    Function.Injective (eval hv u I J) := by
  apply (AddMonoidHom.ker_eq_bot_iff _).mp
  apply le_antisymm _ bot_le
  intro x hx
  have he : embed n v hv x.1.val= -(2*(u⁻¹*embed n v hv x.2.val)) := add_eq_zero_iff_eq_neg.mp hx
  have hc (L : Ideal (TunnellIdealHNF.R n)) (w:L) : embed n v hv w.val∈C v := center_image hv L ⟨_,w.property,rfl⟩
  have hanti := scale_anti hu hu0 (hc J x.2)
  have hright : -(2*(u⁻¹*embed n v hv x.2.val))∈anti v := (anti v).neg_mem (by simpa only [zsmul_eq_mul,Int.cast_ofNat] using (anti v).smul_mem (2:ℤ) hanti)
  have z := (Submodule.disjoint_def.mp (disjoint h0 hv)) _ (hc I x.1) (he ▸ hright)
  have z₂ : embed n v hv x.2.val=0 := by
    rw [z,zero_eq_neg] at he
    exact (mul_eq_zero.mp ((mul_eq_zero.mp he).resolve_left (TunnellRamifiedSwitch.nat_nonzero (a:=2) (by decide)))).resolve_left (inv_ne_zero hu0)
  exact Prod.ext (Subtype.ext (embed_inj hn hv (z.trans (map_zero _).symm))) (Subtype.ext (embed_inj hn hv (z₂.trans (map_zero _).symm)))

lemma components (hn : Squarefree n) (h2 : n%4=2) {u : Q} (hu : ι v*u= -(u*ι v)) (hu0 : u≠0)
    {C₀ : Ideal (TunnellIdealHNF.R n)} (ec : image hv C₀=line u*J v (-v)) (B A : Ideal (TunnellIdealHNF.R n)) :
    sandwich hv B (conjugate A) (J v v)=image hv (plusI B A) ∧
    sandwich hv B (conjugate A) (J v (-v))=line u⁻¹*image hv (minusI B A C₀) := by
  have H : image hv B*J v v=image hv B := by rw [←image_order hn h2 hv,←image_mul,Ideal.mul_top]
  constructor
  · rw [plusI,image_mul,sandwich,H]
  · unfold minusI sandwich
    rw [image_mul,image_mul,ec,←mul_assoc (image hv (conjugate B)),←anti_scalar hv hu B]
    calc _=line u⁻¹*line u*(image hv B*J v (-v)*image hv (conjugate A)) := by rw [two_sided_inverse hu0,one_mul]
         _=_ := by simp only [mul_assoc]

theorem range_eq (hn : Squarefree n) (h2 : n%4=2) {u : Q} (hu : ι v*u= -(u*ι v)) (hu0 : u≠0)
    {C₀ : Ideal (TunnellIdealHNF.R n)} (ec : image hv C₀=line u*J v (-v)) (B A : Ideal (TunnellIdealHNF.R n)) :
    (eval hv u (plusI B A) (minusI B A C₀)).range.toIntSubmodule=sandwich hv B (conjugate A) (TunnellFilteredGlue.binary v) := by
  obtain ⟨e₁,e₂⟩ := components hv hn h2 hu hu0 ec B A
  have e₃ : sandwich hv B (conjugate A) (line 2*J v (-v))=line 2*sandwich hv B (conjugate A) (J v (-v)) := by
    unfold sandwich; rw [←mul_assoc (image hv B),←line_central (2:Q) (fun q => by noncomm_ring)]; simp only [mul_assoc]
  have e₄ : sandwich hv B (conjugate A) (TunnellFilteredGlue.binary v)=image hv (plusI B A) ⊔ line 2*(line u⁻¹*image hv (minusI B A C₀)) := by
    unfold TunnellFilteredGlue.binary sandwich at *; rw [Submodule.mul_sup,Submodule.sup_mul,e₁,e₃,e₂]
  rw [e₄]; ext q; constructor
  · rintro ⟨x,rfl⟩
    exact Submodule.add_mem_sup ⟨_,x.1.property,rfl⟩ (Submodule.mem_span_singleton_mul.mpr ⟨_,Submodule.mem_span_singleton_mul.mpr ⟨_,⟨_,x.2.property,rfl⟩,rfl⟩,rfl⟩)
  · intro h; obtain ⟨x,⟨j,hj,rfl⟩,y,hy,rfl⟩ := Submodule.mem_sup.mp h
    obtain ⟨w,hw,ew⟩ := Submodule.mem_span_singleton_mul.mp hy
    change w∈line u⁻¹*image hv (minusI B A C₀) at hw
    obtain ⟨z,hz,ez⟩ := Submodule.mem_span_singleton_mul.mp hw
    obtain ⟨k,hk,ek⟩ := (mem_image hv).mp hz
    refine ⟨(⟨j,hj⟩,⟨k,hk⟩),?_⟩
    change embed n v hv j+2*(u⁻¹*embed n v hv k)=_; rw [ek,ez,ew]; rfl

end
end TunnellBinaryPairModel
#print axioms TunnellBinaryPairModel.range_eq
#print axioms TunnellBinaryPairModel.injective

