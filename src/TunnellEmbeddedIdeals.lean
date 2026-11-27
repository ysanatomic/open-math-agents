import TunnellIdealInverse
import TunnellIdealTorsor

/-! The proper quadratic ideals of the toric period are the images of ordinary ring ideals. -/
namespace TunnellEmbeddedIdeals
open TunnellIdealHNF TunnellShell TunnellHurwitz TunnellToricClass
local notation "ι" => TunnellHurwitz.pure

def image {n : ℕ} {v : Triple} (hv : v∈shell n) (I : Ideal (TunnellIdealHNF.R n)) : Lattice :=
  I.toAddSubgroup.toIntSubmodule.map ((embed n v hv).toAddMonoidHom.toIntLinearMap)

lemma mem_image {n : ℕ} {v : Triple} (hv : v∈shell n) {I : Ideal (TunnellIdealHNF.R n)} {q : Q} :
    q∈image hv I ↔ ∃ z∈I, embed n v hv z=q := Iff.rfl

lemma embed_inj {n : ℕ} {v : Triple} (hn : Squarefree n) (hv : v∈shell n) : Function.Injective (embed n v hv) := by
  rintro ⟨a,b⟩ ⟨c,d⟩ h
  obtain ⟨x,y,z,he⟩ := primitive hn hv
  have e₁ := congrArg QuaternionAlgebra.re h
  have e₂ := congrArg QuaternionAlgebra.imI h
  have e₃ := congrArg QuaternionAlgebra.imJ h
  have e₄ := congrArg QuaternionAlgebra.imK h
  change (a:ℚ)=c at e₁
  change (b:ℚ)*v.1=d*v.1 at e₂
  change (b:ℚ)*v.2.1=d*v.2.1 at e₃
  change (b:ℚ)*v.2.2=d*v.2.2 at e₄
  apply Zsqrtd.ext (by exact_mod_cast e₁)
  have h' : (v.1:ℚ)*x+v.2.1*y+v.2.2*z=1 := by exact_mod_cast he
  have H : (b:ℚ)=d := by linear_combination x*e₂+y*e₃+z*e₄-(b-d)*h'
  exact_mod_cast H

lemma image_injective {n : ℕ} {v : Triple} (hn : Squarefree n) (hv : v∈shell n) : Function.Injective (image hv) := by
  intro I K he; ext z
  have h (J : Ideal _) : (embed n v hv z)∈image hv J ↔ z∈J := by
    constructor
    · rintro ⟨y,hy,ey⟩; exact embed_inj hn hv ey ▸ hy
    · intro hz; exact ⟨z,hz,rfl⟩
  rw [←h,he,h]

lemma image_order {n : ℕ} {v : Triple} (hn : Squarefree n) (h2 : n%4=2) (hv : v∈shell n) :
    image hv ⊤=J v v := by
  ext q
  constructor
  · rw [mem_image]; rintro ⟨z,_,rfl⟩
    exact ⟨embed_integral _ _ _ _,by rw [←embed_root n v hv,←map_mul,←map_mul,mul_comm]⟩
  · rintro ⟨hq,he⟩; obtain ⟨z,ez⟩ := integral_centralizer hn h2 hv hq he.symm
    exact ⟨z,Submodule.mem_top,ez.symm⟩

lemma image_mul {n : ℕ} {v : Triple} (hv : v∈shell n) (A B : Ideal (R n)) :
    image hv (A*B)=image hv A*image hv B := by
  apply le_antisymm
  · intro q hq; obtain ⟨z,hz,rfl⟩ := (mem_image _).mp hq
    apply Submodule.mul_induction_on (C := fun a => embed n v hv a ∈ image hv A*image hv B) hz
    · intro a ha b hb
      rw [map_mul]
      exact Submodule.mul_mem_mul ⟨a,ha,rfl⟩ ⟨b,hb,rfl⟩
    · intro a b ha hb
      rw [map_add]; exact add_mem ha hb
  · apply Submodule.mul_le.mpr
    intro x hx y hy
    obtain ⟨a,ha,rfl⟩ := (mem_image _).mp hx
    obtain ⟨b,hb,rfl⟩ := (mem_image _).mp hy
    exact ⟨a*b,Ideal.mul_mem_mul ha hb,map_mul (embed n v hv) a b⟩

lemma image_principal {n : ℕ} {v : Triple} (hn : Squarefree n) (h2 : n%4=2) (hv : v∈shell n) (a : R n) :
    image hv (Ideal.span {a})=line (embed n v hv a)*J v v := by
  rw [←image_order hn h2 hv]
  ext q
  constructor
  · rintro ⟨z,hz,rfl⟩; obtain ⟨b,rfl⟩ := Ideal.mem_span_singleton.mp hz
    exact Submodule.mem_span_singleton_mul.mpr ⟨_,⟨b,Submodule.mem_top,rfl⟩,(map_mul ..).symm⟩
  · intro h
    obtain ⟨t,ht,rfl⟩ := Submodule.mem_span_singleton_mul.mp h
    obtain ⟨b,_,rfl⟩ := (mem_image _).mp ht
    exact ⟨a*b,Ideal.mem_span_singleton.mpr (dvd_mul_right _ _),map_mul (embed n v hv) a b⟩

lemma center_image {n : ℕ} {v : Triple} (hv : v∈shell n) (I : Ideal (R n)) : image hv I≤C v := by
  intro q hq; obtain ⟨a,_,rfl⟩ := (mem_image _).mp hq; apply mem_C.mpr; rw [←embed_root n v hv,←map_mul,←map_mul,mul_comm]

lemma image_isIdeal {n : ℕ} {v : Triple} (hn : Squarefree n) (h2 : n%4=2) (hv : v∈shell n) (I : Ideal (R n)) (hI : I≠⊥) :
    isIdeal v (image hv I) := by
  obtain ⟨s,rfl⟩ := normal_form (show 0<n by omega) hI
  let N : Q := idx s
  have hN : N≠0 := by intro h; have H := congrArg QuaternionAlgebra.re h; change ((idx s:ℕ):ℚ)=0 at H; exact (show idx s≠0 from mul_ne_zero (pow_ne_zero _ s.pos_c.ne') s.pos_a.ne') (by exact_mod_cast H)
  have his : ∀ x : Q, x*N=N*x := fun x => (Nat.cast_comm (idx s) x).symm
  have hN' : N⁻¹∈C v := mem_C.mpr (show Commute (ι v) N from his _).inv_right₀
  let K := image hv (conjugate (ideal s))*line N⁻¹
  have hline : line N⁻¹ ≤ C v := Submodule.span_le.mpr (Set.singleton_subset_iff.mpr hN')
  have hK : K≤C v := (mul_le_mul' (center_image hv _) hline).trans (mul_C v)
  refine ⟨fun q hq => by obtain ⟨x,_,rfl⟩ := (mem_image _).mp hq; exact embed_integral _ _ _ _,center_image hv _,?_,K,hK,?_⟩
  · rw [←image_order hn h2 hv,←image_mul,Ideal.mul_top]
  · change image hv (ideal s)*(image hv (conjugate (ideal s))*line N⁻¹)=_
    rw [←mul_assoc,←image_mul,times_conj hn h2,image_principal hn h2 hv,map_natCast]
    change line N * J v v * line N⁻¹ = _
    rw [mul_assoc,ideals_comm hn hv (show J v v ≤ C v from fun _ h => mem_C.mpr h.2) hline,
      ←mul_assoc,line_mul,mul_inv_cancel₀ hN,line_one,one_mul]

def preimage {n : ℕ} {v : Triple} (hv : v∈shell n) (A : IntegralIdeal v) : Ideal (R n) where
  carrier := {x | embed n v hv x∈A.val}
  zero_mem' := by simp
  add_mem' := by intro x y hx hy; change embed n v hv (x+y)∈A.val; rw [map_add]; exact A.val.add_mem hx hy
  smul_mem' := by
    intro x y hy
    have hx : embed n v hv x∈J v v := ⟨embed_integral _ _ _ _,by rw [←embed_root n v hv,←map_mul,←map_mul,mul_comm]⟩
    change embed n v hv (x*y)∈A.val
    rw [mul_comm,map_mul,←A.property.2.2.1]
    exact Submodule.mul_mem_mul hy hx

lemma image_preimage {n : ℕ} {v : Triple} (hn : Squarefree n) (h2 : n%4=2) (hv : v∈shell n) (A : IntegralIdeal v) :
    image hv (preimage hv A)=A.val := by
  ext q; constructor
  · rintro ⟨a,ha,rfl⟩; exact ha
  · intro hq
    obtain ⟨z,he⟩ := integral_centralizer hn h2 hv (A.property.1 hq) (mem_C.mp (A.property.2.1 hq)).symm
    refine (mem_image _).mpr ⟨z,?_,he.symm⟩
    change embed n v hv z∈A.val; rwa [←he]

lemma preimage_ne_bot {n : ℕ} {v : Triple} (hn : Squarefree n) (h2 : n%4=2) (hv : v∈shell n) (A : IntegralIdeal v) :
    preimage hv A≠⊥ := by
  intro h
  have he := image_preimage hn h2 hv A
  rw [h] at he
  have hbot : image hv ⊥=⊥ := by apply le_antisymm _ bot_le; rintro _ ⟨x,hx,rfl⟩; rw [show x=0 from hx,map_zero]; exact Submodule.zero_mem _
  obtain ⟨B,_,hB⟩ := A.property.2.2.2
  rw [←he,hbot,Submodule.bot_mul] at hB
  have h₁ := one_J v; rw [←hB] at h₁
  exact one_ne_zero h₁

noncomputable def integralEquiv {n : ℕ} {v : Triple} (hn : Squarefree n) (h2 : n%4=2) (hv : v∈shell n) :
    {I : Ideal (R n) // I≠⊥} ≃ IntegralIdeal v where
  toFun I := ⟨image hv I.val,image_isIdeal hn h2 hv I.val I.property⟩
  invFun A := ⟨preimage hv A,preimage_ne_bot hn h2 hv A⟩
  left_inv I := Subtype.ext (image_injective hn hv (image_preimage hn h2 hv _))
  right_inv A := Subtype.ext (image_preimage hn h2 hv A)

#print axioms integralEquiv
end TunnellEmbeddedIdeals
