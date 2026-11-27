import TunnellIdealGroupoid
import TunnellToricPeriod

/-! Extension and contraction of invertible imaginary-quadratic ideals in the Hurwitz order. -/
namespace TunnellToricClass
open TunnellShell TunnellHurwitz TunnellToricLocal
open scoped Pointwise
abbrev Lattice := Submodule ℤ Q
abbrev O : Lattice := order.toAddSubgroup.toIntSubmodule
abbrev J (v w : Triple) : Lattice := (intertwiner v w).toIntSubmodule
abbrev line (a : Q) : Lattice := Submodule.span ℤ {a}

def C (v : Triple) : Lattice := LinearMap.ker ((AddMonoidHom.mulLeft (TunnellHurwitz.pure v)).toIntLinearMap - (AddMonoidHom.mulRight (TunnellHurwitz.pure v)).toIntLinearMap)
lemma mem_C {v : Triple} {a : Q} : a∈C v ↔ TunnellHurwitz.pure v*a=a*TunnellHurwitz.pure v := sub_eq_zero
lemma mem_J {v w : Triple} {a : Q} : a∈J v w ↔ a∈O ∧ TunnellHurwitz.pure w*a=a*TunnellHurwitz.pure v := Iff.rfl
lemma order_commutant (v : Triple) : O ⊓ C v = J v v := by ext x; rw [Submodule.mem_inf,mem_C,mem_J]
lemma one_O : (1:Q)∈O := order.one_mem
lemma one_J (v : Triple) : (1:Q)∈J v v := ⟨one_O,by simp⟩
lemma mul_O : O*O=O := by
  apply le_antisymm (Submodule.mul_le.mpr fun _ ha _ hb => order.mul_mem ha hb)
  intro a ha; simpa using Submodule.mul_mem_mul ha one_O
lemma mul_C (v : Triple) : C v * C v ≤ C v := by
  apply Submodule.mul_le.mpr
  intro a ha b hb
  apply mem_C.mpr
  rw [←mul_assoc,mem_C.mp ha,mul_assoc,mem_C.mp hb,mul_assoc]
lemma central_comm {n : ℕ} (hn : Squarefree n) {v : Triple} (hv : v∈shell n) {a b : Q} (ha : a∈C v) (hb : b∈C v) : a*b=b*a := by
  obtain ⟨r,er⟩ := centralizer hn hv a (mem_C.mp ha).symm
  obtain ⟨s,es⟩ := centralizer hn hv b (mem_C.mp hb).symm
  conv_lhs => rw [er,es]
  conv_rhs => rw [es,er]
  apply QuaternionAlgebra.ext
  all_goals first | rw [Quaternion.re_mul,Quaternion.re_mul] | rw [Quaternion.imI_mul,Quaternion.imI_mul] | rw [Quaternion.imJ_mul,Quaternion.imJ_mul] | rw [Quaternion.imK_mul,Quaternion.imK_mul]
  all_goals dsimp only [evalRat]; ring
lemma ideals_comm {n : ℕ} (hn : Squarefree n) {v : Triple} (hv : v∈shell n) {A B : Lattice} (ha : A≤C v) (hb : B≤C v) : A*B=B*A := by
  apply le_antisymm <;> apply Submodule.mul_le.mpr
  · intro a h₁ b h₂; rw [central_comm hn hv (ha h₁) (hb h₂)]; exact Submodule.mul_mem_mul h₂ h₁
  · intro a h₁ b h₂; rw [central_comm hn hv (hb h₁) (ha h₂)]; exact Submodule.mul_mem_mul h₂ h₁
lemma J_comp {n : ℕ} (hn : Squarefree n) (h2 : n%4=2) {u v w : Triple} (hu : u∈shell n) (hv : v∈shell n) : J v w * J u v = J u w := by
  refine Eq.trans ?_ (compose_ideals hn h2 u v w hu hv)
  apply le_antisymm (Submodule.mul_le.mpr fun _ ha _ hb => idealProd_mem ha hb)
  apply Submodule.span_le.mpr
  rintro _ ⟨a,ha,b,hb,rfl⟩
  exact Submodule.mul_mem_mul ha hb
lemma J_extends {n : ℕ} (hn : Squarefree n) (h2 : n%4=2) {u v : Triple} (hu : u∈shell n) (hv : v∈shell n) : J u v*O=O := by
  have h₁ : 1 ≤ J u v*J v u := by rw [J_comp hn h2 hv hu]; exact Submodule.one_le.mpr (one_J v)
  have h₂ : 1 ≤ J u v*O := h₁.trans (mul_le_mul_right (show J v u ≤ O from fun _ h => h.1) _)
  apply le_antisymm
  · exact (mul_le_mul_left (show J u v ≤ O from fun _ h => h.1) _).trans mul_O.le
  · calc O = 1*O := (one_mul _).symm
         _ ≤ (J u v*O)*O := mul_le_mul_left h₂ _
         _ = _ := by rw [mul_assoc,mul_O]

/-- An invertible ideal is recovered by intersecting its extension with the quadratic field. -/
lemma contract {v : Triple} {A B : Lattice} (hA : A≤C v) (hB : B≤C v)
    (hAB : A*B=J v v) (hBA : B*A=J v v) (hR : A*J v v=A) : A*O ⊓ C v=A := by
  let D := A*O ⊓ C v
  have hBD : B*D ≤ J v v := by
    rw [←order_commutant]
    apply le_inf
    · calc B*D ≤ B*(A*O) := mul_le_mul_right inf_le_left _
           _ = J v v*O := by rw [←mul_assoc,hBA]
           _ ≤ O*O := mul_le_mul_left (show J v v ≤ O from fun _ h => h.1) _
           _ = O := mul_O
    · exact (mul_le_mul' hB (show D≤C v from inf_le_right)).trans (mul_C v)
  apply le_antisymm
  · calc D = 1*D := (one_mul _).symm
         _ ≤ J v v*D := mul_le_mul_left (Submodule.one_le.mpr (one_J v)) _
         _ = A*(B*D) := by rw [←mul_assoc,hAB]
         _ ≤ A*J v v := mul_le_mul_right hBD _
         _ = A := hR
  · apply le_inf _ hA
    intro a ha; simpa using Submodule.mul_mem_mul ha one_O

lemma principal_extension {A : Lattice} (ha : A≤O) (hne : A≠⊥) :
    ∃ a∈A*O, a≠0 ∧ A*O=line a*O := by
  let D := A*O
  have hm : D*O=D := by change (A*O)*O=A*O; rw [mul_assoc,mul_O]
  have hi : D≤O := (mul_le_mul_left ha _).trans mul_O.le
  obtain ⟨b,hb,hb0⟩ := Submodule.exists_mem_ne_zero_of_ne_bot hne
  obtain ⟨a,h₁,h₂,h₃⟩ := integral_class_number_one (D:Set Q) hi
    (fun x hx y hy => D.sub_mem hx hy)
    (fun x hx y hy => hm ▸ Submodule.mul_mem_mul hx (show y∈O from hy))
    ⟨b,by simpa using Submodule.mul_mem_mul hb one_O,hb0⟩
  refine ⟨a,h₁,h₂,?_⟩
  ext x
  change x∈(D:Set Q) ↔ _
  rw [h₃,Submodule.mem_span_singleton_mul]
  constructor <;> rintro ⟨z,hz,h⟩ <;> exact ⟨z,hz,h.symm⟩

lemma J_right {u v : Triple} {a : Q} (ha : a≠0) (he : TunnellHurwitz.pure v*a=a*TunnellHurwitz.pure u) :
    line a*O ⊓ C v = line a*J v u := by
  ext x
  simp only [Submodule.mem_inf,Submodule.mem_span_singleton_mul,mem_C]
  constructor
  · rintro ⟨⟨y,hy,rfl⟩,hh⟩
    refine ⟨y,⟨hy,mul_left_cancel₀ ha ?_⟩,rfl⟩
    rw [←mul_assoc,←he,mul_assoc,hh,mul_assoc]
  · rintro ⟨y,hy,rfl⟩
    refine ⟨⟨y,hy.1,rfl⟩,?_⟩
    rw [←mul_assoc,he,mul_assoc,hy.2,mul_assoc]

/-- Every invertible integral ideal in the quadratic field is a scalar multiple of the
intertwiner lattice for an optimal embedding of that field into the Hurwitz order. -/
lemma classify_ideal {n : ℕ} (hs : Squarefree n) (hn : n%4=2) {v : Triple} (hv : v∈shell n)
    {A B : Lattice} (ha : A≤O) (hA : A≤C v) (hB : B≤C v) (hAB : A*B=J v v) (hR : A*J v v=A) :
    ∃ w∈shell n, ∃ a∈J w v, a≠0 ∧ A=line a*J v w := by
  have hBA := (ideals_comm hs hv hB hA).trans hAB
  have hh := contract hA hB hAB hBA hR
  have hne : A≠⊥ := by
    rintro rfl; rw [Submodule.bot_mul] at hAB
    have h₁ := one_J v; rw [←hAB] at h₁; exact one_ne_zero h₁
  obtain ⟨a,haD,ha0,he⟩ := principal_extension ha hne
  have hO : a∈O := (mul_le_mul_left ha _).trans mul_O.le haD
  have hco : J v v ≤ C v := fun _ h => mem_C.mpr h.2
  have hra : J v v*A=A := (ideals_comm hs hv hco hA).trans hR
  have hp : TunnellHurwitz.pure v∈J v v := ⟨pure_mem _,rfl⟩
  have hm := Submodule.mul_mem_mul hp haD
  rw [←mul_assoc,hra,he,Submodule.mem_span_singleton_mul] at hm
  obtain ⟨t,ht,heq⟩ := hm
  have ht2 : t*t= -(n:Q) := by
    apply mul_left_cancel₀ ha0
    calc a*(t*t)=(TunnellHurwitz.pure v*TunnellHurwitz.pure v)*a := by rw [←mul_assoc,heq,mul_assoc,heq,←mul_assoc]
         _=a* -(n:Q) := by rw [pure_square hv,neg_mul,mul_neg,Nat.cast_comm]
  obtain ⟨hr,hN⟩ := negative_root (show 0<n by omega) t ht2
  obtain ⟨w,rfl⟩ := trace_zero_integral ht hr
  have hw : w∈shell n := by rw [mem_shell]; rw [pure_norm] at hN; exact_mod_cast hN
  exact ⟨w,hw,a,⟨hO,heq.symm⟩,ha0,by rw [←hh,he,J_right ha0 heq.symm]⟩

lemma line_mul (a b : Q) : line a * line b = line (a*b) := by rw [line,line,Submodule.span_mul_span,Set.singleton_mul_singleton]
lemma line_one : line 1=1 := (Submodule.one_eq_span).symm
lemma two_sided_inverse {a : Q} (ha : a≠0) : line a⁻¹*line a=1 := by rw [line_mul,inv_mul_cancel₀ ha,line_one]

/-- Invertible integral ideals in the centralizer order; the inverse may be fractional. -/
def isIdeal (v : Triple) (A : Lattice) : Prop :=
  A≤O ∧ A≤C v ∧ A*J v v=A ∧ ∃ B≤C v, A*B=J v v

lemma from_embedding {n : ℕ} (hs : Squarefree n) (hn : n%4=2) {v w : Triple}
    (hv : v∈shell n) (hw : w∈shell n) {a : Q} (ha : a∈J w v) (ha0 : a≠0) :
    isIdeal v (line a*J v w) := by
  let A := line a*J v w
  let B := J w v*line a⁻¹
  have hi : A ≤ O := by
    intro z hz; obtain ⟨q,hq,rfl⟩ := Submodule.mem_span_singleton_mul.mp hz
    exact order.mul_mem ha.1 hq.1
  have hA : A≤C v := by change line a*J v w≤_; rw [←J_right ha0 ha.2]; exact inf_le_right
  have hB : B≤C v := by
    intro z hz; obtain ⟨q,hq,rfl⟩ := Submodule.mem_mul_span_singleton.mp hz
    apply mem_C.mpr
    apply mul_right_cancel₀ ha0
    calc (TunnellHurwitz.pure v * (q*a⁻¹))*a = TunnellHurwitz.pure v*q := by simp [mul_assoc,ha0]
         _=q*TunnellHurwitz.pure w := hq.2
         _=(q*a⁻¹*TunnellHurwitz.pure v)*a := by rw [mul_assoc,ha.2]; simp [mul_assoc,ha0]
  have hBA : B*A=J v v := by
    change (J w v*line a⁻¹)*(line a*J v w)=_
    rw [mul_assoc,←mul_assoc (line a⁻¹),two_sided_inverse ha0,one_mul,J_comp hs hn hv hw]
  refine ⟨hi,hA,?_,B,hB,(ideals_comm hs hv hA hB).trans hBA⟩
  rw [mul_assoc,J_comp hs hn hv hv]

#print axioms from_embedding
end TunnellToricClass
