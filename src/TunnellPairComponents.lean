import TunnellIntertwinerTheta
import TunnellCMGluing
import TunnellPrincipalGenus

/-! The two binary lattices between a pair of optimal embeddings are products of their quadratic ideal classes. -/
namespace TunnellPairComponents
open TunnellShell TunnellHurwitz TunnellIdealHNF TunnellEmbeddedIdeals TunnellToricClass TunnellToricLocal
open TunnellClassThetaCount TunnellFrameNorm TunnellIntertwinerTheta TunnellIdealGenerators
noncomputable section
local notation "ι" => TunnellHurwitz.pure

lemma pure_neg (v : Triple) : ι (-v)= -ι v := by
  apply QuaternionAlgebra.ext <;> simp only [Quaternion.re_neg,Quaternion.imI_neg,Quaternion.imJ_neg,Quaternion.imK_neg] <;> simp [TunnellHurwitz.pure]

lemma J_neg (s t : Triple) : J (-s) (-t)=J s t := by
  ext q; simp only [mem_J,pure_neg,neg_mul,mul_neg,neg_inj]

lemma J_opposite (s t : Triple) : J (-s) t=J s (-t) := by rw [←J_neg (-s) t,neg_neg]

lemma shell_neg {n : ℕ} {v : Triple} (hv : v∈shell n) : -v∈shell n := by
  rw [mem_shell] at hv ⊢; simpa [TunnellShell.normSq] using hv

lemma embed_star {n : ℕ} {v : Triple} (hv : v∈shell n) (x : R n) :
    embed n v hv (star x)=star (embed n v hv x) := by
  apply QuaternionAlgebra.ext
  all_goals first | rw [Quaternion.re_star] | rw [Quaternion.imI_star] | rw [Quaternion.imJ_star] | rw [Quaternion.imK_star]
  all_goals change _=_
  · rfl
  all_goals change ((-x.im:ℤ):ℚ)*_= -((x.im:ℚ)*_); push_cast; ring

lemma image_conj_star {n : ℕ} {v : Triple} (hv : v∈shell n) (A : Ideal (R n)) (q : Q) :
    q∈image hv (conjugate A) ↔ star q∈image hv A := by
  constructor
  · rintro ⟨x,hx,rfl⟩; exact ⟨star x,hx,embed_star hv x⟩
  · rintro ⟨x,hx,e⟩; change embed n v hv x=star q at e
    exact ⟨star x,conj_mem A hx,by change embed n v hv (star x)=q; rw [embed_star,e,star_star]⟩

lemma conj_frame {n : ℕ} {v w : Triple} (hv : v∈shell n) {A : Ideal (R n)} {a : Q}
    (e : image hv A=line a*J v w) : image hv (conjugate A)=J w v*line (star a) := by
  ext q; rw [image_conj_star,e]
  constructor
  · intro h; obtain ⟨z,hz,he⟩ := Submodule.mem_span_singleton_mul.mp h
    exact Submodule.mem_mul_span_singleton.mpr ⟨star z,star_intertwines hz,by rw [←star_mul,he,star_star]⟩
  · intro h; obtain ⟨z,hz,rfl⟩ := Submodule.mem_mul_span_singleton.mp h
    exact Submodule.mem_span_singleton_mul.mpr ⟨star z,star_intertwines hz,by rw [star_mul,star_star]⟩

lemma embed_expand {n : ℕ} {v : Triple} (hv : v∈shell n) (x : R n) :
    embed n v hv x=(x.re:Q)+(x.im:Q)*ι v := by
  apply QuaternionAlgebra.ext
  all_goals simp only [Quaternion.re_add,Quaternion.imI_add,Quaternion.imJ_add,Quaternion.imK_add,
    Quaternion.re_mul,Quaternion.imI_mul,Quaternion.imJ_mul,Quaternion.imK_mul,Quaternion.re_intCast,Quaternion.imI_intCast,Quaternion.imJ_intCast,Quaternion.imK_intCast]
  all_goals change _=_; dsimp [TunnellHurwitz.pure]; simp <;> rfl

lemma anti_scalar {n : ℕ} {v : Triple} (hv : v∈shell n) {u : Q}
    (hu : ι v*u= -(u*ι v)) (B : Ideal (R n)) : line u*image hv B=image hv (conjugate B)*line u := by
  have he (x : R n) : u*(embed n v hv x)=embed n v hv (star x)*u := by
    rw [embed_expand hv,embed_expand hv,Zsqrtd.re_star,Zsqrtd.im_star,Int.cast_neg,mul_add,add_mul,←mul_assoc,
      ←Int.cast_comm x.re u,←Int.cast_comm x.im u,neg_mul,neg_mul]
    rw [mul_assoc (x.im:Q),mul_assoc (x.im:Q),hu,mul_neg,neg_neg]
  ext q
  constructor
  · intro h; obtain ⟨y,hy,rfl⟩ := Submodule.mem_span_singleton_mul.mp h; obtain ⟨x,hx,rfl⟩ := (mem_image _).mp hy
    exact Submodule.mem_mul_span_singleton.mpr ⟨_,⟨star x,conj_mem _ hx,rfl⟩,(he x).symm⟩
  · intro h; obtain ⟨y,hy,rfl⟩ := Submodule.mem_mul_span_singleton.mp h; obtain ⟨x,hx,rfl⟩ := (mem_image _).mp hy
    exact Submodule.mem_span_singleton_mul.mpr ⟨_,⟨star x,hx,rfl⟩,by change u*embed n v hv (star x)=embed n v hv x*u; rw [he,star_star]⟩

theorem plus_lattice {n : ℕ} (hn : Squarefree n) (h2 : n%4=2) {v s t : Triple}
    (hv : v∈shell n) (hs : s∈shell n) {A B : Ideal (R n)} {a b : Q}
    (eA : image hv A=line a*J v s) (eB : image hv B=line b*J v t) :
    image hv (B*conjugate A)=line b*J s t*line (star a) := by
  rw [image_mul,eB,conj_frame hv eA]
  calc _=line b*(J v t*J s v)*line (star a) := by simp only [mul_assoc]
       _=_ := by rw [J_comp hn h2 hs hv]

theorem minus_lattice {n : ℕ} (hn : Squarefree n) (h2 : n%4=2) {v s t : Triple}
    (hv : v∈shell n) (hs : s∈shell n) {A B C : Ideal (R n)} {a b u : Q}
    (eA : image hv A=line a*J v s) (eB : image hv B=line b*J v t) (hu : ι v*u= -(u*ι v))
    (eC : image hv C=line u*J v (-v)) :
    image hv (conjugate B*C*conjugate A)=line u*(line b*J (-s) t*line (star a)) := by
  rw [image_mul,image_mul,eC,←mul_assoc,←anti_scalar hv hu B,eB,conj_frame hv eA]
  have h₁ : J v t*J v (-v)=J (-v) t := by rw [←J_opposite,J_comp hn h2 (shell_neg hv) hv]
  have h₂ : J (-v) t*J s v=J (-s) t := by rw [←J_neg s v,J_comp hn h2 (shell_neg hs) (shell_neg hv)]
  calc _=line u*(line b*((J v t*J v (-v))*J s v)*line (star a)) := by simp only [mul_assoc]
       _=_ := by rw [h₁,h₂]

end
end TunnellPairComponents
#print axioms TunnellPairComponents.plus_lattice
#print axioms TunnellPairComponents.minus_lattice
