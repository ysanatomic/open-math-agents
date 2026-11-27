import TunnellFramedGlue
import TunnellIntegralPacket

/-! The filtered ideal gluing is an explicit scaled left-right translate of the norm-counting Hurwitz lattice. -/
namespace TunnellGlueIsometry
open TunnellHurwitz TunnellToricClass TunnellShell TunnellToricLocal TunnellPairComponents TunnellRamifiedSwitch
open TunnellIdealGluings TunnellSwitchComponents TunnellFilteredGlue TunnellGlueMaximal TunnellEmbeddedIdeals
open TunnellIdealHNF TunnellRamifiedClasses TunnellFramedGlue TunnellTwoProjection TunnellBinaryPairModel
open TunnellClassThetaCount TunnellFrameNorm TunnellIntertwinerTheta TunnellIdealThetaExpansion TunnellGenusCharacter
noncomputable section

def action (b c : Q) (x : Q) := b*x*c
def transport (b c : Q) (D : Lattice) := line b*D*line c
lemma mem_transport {b c x : Q} {D : Lattice} : x∈transport b c D ↔ ∃ y∈D, action b c y=x := by
  rw [transport,Submodule.mem_mul_span_singleton]
  constructor
  · rintro ⟨j,hj,rfl⟩; obtain ⟨y,hy,rfl⟩ := Submodule.mem_span_singleton_mul.mp hj; exact ⟨y,hy,rfl⟩
  · rintro ⟨y,hy,rfl⟩; exact ⟨_,Submodule.mem_span_singleton_mul.mpr ⟨_,hy,rfl⟩,rfl⟩

lemma action_inj {b c : Q} (hb : b≠0) (hc : c≠0) : Function.Injective (action b c) :=
  fun _ _ e => mul_left_cancel₀ hb (mul_right_cancel₀ hc e)
lemma action_mem {b c : Q} (hb : b≠0) (hc : c≠0) (D : Lattice) (x : Q) : action b c x∈transport b c D ↔ x∈D := by
  rw [mem_transport]; exact ⟨fun ⟨y,hy,e⟩ => (action_inj hb hc e) ▸ hy,fun h => ⟨_,h,rfl⟩⟩
lemma action_nat (b c : Q) (k : ℕ) (x : Q) : (k:Q)*action b c x=action b c ((k:Q)*x) := by
  unfold action; rw [←mul_assoc,←mul_assoc,Nat.cast_comm k b,mul_assoc b]
lemma transport_scale {a : ℕ} (b c : Q) (D : Lattice) : line (a:Q)⁻¹*transport b c D=transport ((a:Q)⁻¹*b) c D := by
  unfold transport; rw [←mul_assoc,←mul_assoc,line_mul]

lemma admits_mem (d : ℕ) (s t : Triple) (q : Q) : admits d s t q ↔ (d:Q)*q∈pairL s t := by
  constructor
  · rintro ⟨x,hx,y,hy,ha,e⟩
    rw [e]; exact Submodule.add_mem_sup hx (Submodule.mem_span_singleton_mul.mpr ⟨y,⟨hy,by simpa [pure_neg] using ha⟩,rfl⟩)
  · intro he; obtain ⟨x,hx,z,hz,e⟩ := Submodule.mem_sup.mp he
    obtain ⟨y,hy,rfl⟩ := Submodule.mem_span_singleton_mul.mp hz
    exact ⟨x,hx,y,hy.1,by simpa [pure_neg] using hy.2,e.symm⟩

variable {d : ℕ} {v : Triple} (hv : v∈shell (2*d))
local notation "Ord" => TunnellIdealHNF.R (2*d)
local notation "ι" => TunnellHurwitz.pure

def rep (hn : Squarefree (2*d)) (h2 : (2*d)%4=2) {I : Ideal Ord} (hI : I≠⊥) :=
  representative hn h2 hv ⟨image hv I,image_isIdeal hn h2 hv I hI⟩

theorem frames (hn : Squarefree (2*d)) (h2 : (2*d)%4=2) {A B : Ideal Ord} (hA : A≠⊥) (hB : B≠⊥)
    {r : ℕ} (hr : 0<r) (hd : r∣2*d) :
    let hA' := mul_ne_bot (by omega : 0<2*d) hA (ram_ne_bot (2*d) r)
    let hB' := mul_ne_bot (by omega : 0<2*d) hB (ram_ne_bot (2*d) r)
    let s := (rep hv hn h2 hA').val
    let t := (rep hv hn h2 hB').val
    ∃ b c : Q, b≠0 ∧ c≠0 ∧
      Quaternion.normSq b*Quaternion.normSq c=(normI B:ℚ)*normI A ∧
      sandwich hv B (conjugate A) (glue hv r)=transport b c O ∧
      sandwich hv B (conjugate A) (binary v)=transport b c (pairL s t) := by
  classical
  dsimp only
  let A' := A*ram (2*d) r; let B' := B*ram (2*d) r
  have ha0 : A'≠⊥ := mul_ne_bot (by omega) hA (ram_ne_bot _ _)
  have hb0 : B'≠⊥ := mul_ne_bot (by omega) hB (ram_ne_bot _ _)
  let s := rep hv hn h2 ha0; let t := rep hv hn h2 hb0
  have hs := (Finset.mem_filter.mp s.property).1; have ht := (Finset.mem_filter.mp t.property).1
  obtain ⟨c,hc,hc0,ec⟩ := representative_frame hn h2 hv ⟨image hv A',image_isIdeal hn h2 hv A' ha0⟩
  obtain ⟨b,hb,hb0',eb⟩ := representative_frame hn h2 hv ⟨image hv B',image_isIdeal hn h2 hv B' hb0⟩
  change image hv A'=line c*J v s.val at ec; change image hv B'=line b*J v t.val at eb
  have hfull := framed hn h2 hv hs ht eb ec
  have hL := frame hv hn h2 hs ec eb
  have ea := nat_nonzero hr.ne'
  have eC : star c≠0 := by simpa using hc0
  refine ⟨(r:Q)⁻¹*b,star c,mul_ne_zero (inv_ne_zero ea) hb0',eC,?_,?_,?_⟩
  · have nB := frame_norm hn h2 hv ht hb0 hb eb
    have nA := frame_norm hn h2 hv hs ha0 hc ec
    rw [show normI B'=normI B*r by dsimp only [B']; rw [normI_mul hn h2 hB (ram_ne_bot _ _),ram_norm hr hd]] at nB
    rw [show normI A'=normI A*r by dsimp only [A']; rw [normI_mul hn h2 hA (ram_ne_bot _ _),ram_norm hr hd]] at nA
    rw [map_mul,map_inv₀,Quaternion.normSq_star,nB,nA]
    have e : Quaternion.normSq (r:Q)=(r:ℚ)^2 := by simpa only [Quaternion.coe_natCast] using Quaternion.normSq_coe (r:ℚ)
    rw [e]; push_cast; field_simp
  · rw [ram_full hv hr hd B A,hfull,←transport_scale]; rfl
  · have h := ram_binary hv hn h2 hr hd B A
    change sandwich hv B' (conjugate A') (binary v)=_ at h
    have e : line (r:Q)⁻¹*(line (r:Q)*sandwich hv B (conjugate A) (binary v))=sandwich hv B (conjugate A) (binary v) := by
      rw [←mul_assoc,two_sided_inverse ea,one_mul]
    rw [←e,←h,hL]; exact transport_scale ..

theorem filtered (hn : Squarefree (2*d)) (h2 : (2*d)%4=2) {A B : Ideal Ord} (hA : A≠⊥) (hB : B≠⊥) (r : ℕ) (q : Q) :
    q∈sandwich hv B (conjugate A) (TunnellFilteredGlue.filt d v (glue hv r)) ↔
      q∈sandwich hv B (conjugate A) (glue hv r) ∧ (d:Q)*q∈sandwich hv B (conjugate A) (binary v) := by
  have hd : d≠0 := by omega
  have hw : bimod v (line (d:Q)⁻¹*binary v) := bimod_scalar (binary_stable hn h2 hv) _
    (fun q => (show Commute (d:Q) q from Nat.cast_comm d q).inv_left₀)
  rw [cutoff hd,inf_twist hv hn h2 hB (conj_ne_bot hA) (stable hn h2 hv) hw,
    scalar_twist hv _ _ _ (fun q => (show Commute (d:Q) q from Nat.cast_comm d q).inv_left₀),Submodule.mem_inf,Submodule.mem_span_singleton_mul]
  apply and_congr_right; intro _
  constructor
  · rintro ⟨y,hy,rfl⟩; rw [←mul_assoc,mul_inv_cancel₀ (nat_nonzero hd),one_mul]; exact hy
  · intro h; exact ⟨_,h,by rw [←mul_assoc,inv_mul_cancel₀ (nat_nonzero hd),one_mul]⟩

end
end TunnellGlueIsometry
#print axioms TunnellGlueIsometry.frames
#print axioms TunnellGlueIsometry.filtered

