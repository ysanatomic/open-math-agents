import TunnellToricIdealClass

/-! Optimal embeddings and proper invertible quadratic ideal classes. -/
namespace TunnellToricClass
open TunnellShell TunnellHurwitz TunnellToricLocal TunnellToric
open scoped Pointwise
local notation "ι" => TunnellHurwitz.pure

lemma line_O {q : Q} (hq : q∈O) (hq' : q⁻¹∈O) (h0 : q≠0) : line q*O=O := by
  apply le_antisymm
  · intro z hz; obtain ⟨x,hx,rfl⟩ := Submodule.mem_span_singleton_mul.mp hz
    exact order.mul_mem hq hx
  · intro x hx; exact Submodule.mem_span_singleton_mul.mpr ⟨q⁻¹*x,order.mul_mem hq' hx,by simp [h0]⟩

lemma line_O_equal {a b : Q} (_ha : a≠0) (hb : b≠0) (h : line a*O=line b*O) :
    ∃ q∈O, Quaternion.normSq q=1 ∧ a=b*q := by
  have owned (t : Q) : t∈line t*O := Submodule.mem_span_singleton_mul.mpr ⟨1,one_O,mul_one _⟩
  obtain ⟨q,hq,e₁⟩ := Submodule.mem_span_singleton_mul.mp (h ▸ owned a)
  obtain ⟨r,hr,e₂⟩ := Submodule.mem_span_singleton_mul.mp (h.symm ▸ owned b)
  have e : q*r=1 := mul_left_cancel₀ hb (by rw [←mul_assoc,e₁,e₂,mul_one])
  obtain ⟨N,hN⟩ := norm_int hq
  obtain ⟨M,hM⟩ := norm_int hr
  have hn := congrArg Quaternion.normSq e
  rw [map_mul,map_one,hN,hM] at hn
  have hnm : N*M=1 := by exact_mod_cast hn
  rw [Nat.eq_one_of_dvd_one (show N∣1 from ⟨M,hnm.symm⟩)] at hN
  exact ⟨q,hq,by simpa using hN,e₁.symm⟩

lemma inv_eq_star_of_unit {q : Q} (hq : Quaternion.normSq q=1) : q⁻¹=star q := by
  have hq0 : q≠0 := by intro h; simp [h] at hq
  apply mul_right_cancel₀ hq0
  rw [inv_mul_cancel₀ hq0,Quaternion.star_mul_self,hq,Quaternion.coe_one]

lemma unit_frame {n : ℕ} (hn : n%4=2) {v w : Triple} (hw : w∈shell n)
    {a : Q} (ha : a∈J w v) (h0 : a≠0) :
    ∃ z∈representatives n, ∃ b∈J z v, b≠0 ∧ line a*J v w=line b*J v z := by
  obtain ⟨z,hz,q,hq,hN,hact⟩ := rep_exists hn hw
  have hq0 : q≠0 := by intro h; simp [h] at hN
  have hi : q⁻¹∈O := inv_eq_star_of_unit hN ▸ star_order hq
  have he' : ι z=q*ι w*q⁻¹ := hact.symm.trans (by rw [inv_eq_star_of_unit hN]; rfl)
  have he : ι v*(a*q⁻¹)=(a*q⁻¹)*ι z := by
    rw [←mul_assoc,ha.2,he']; simp [mul_assoc,hq0]
  have hqO : line q⁻¹*O=O := line_O hi (by rw [inv_inv]; exact hq) (inv_ne_zero hq0)
  have heO : line (a*q⁻¹)*O=line a*O := by rw [←line_mul,mul_assoc,hqO]
  refine ⟨z,hz,a*q⁻¹,⟨order.mul_mem ha.1 hi,he⟩,mul_ne_zero h0 (inv_ne_zero hq0),?_⟩
  rw [←J_right h0 ha.2,←J_right (mul_ne_zero h0 (inv_ne_zero hq0)) he,heO]

lemma classify_rep {n : ℕ} (hs : Squarefree n) (hn : n%4=2) {v : Triple} (hv : v∈shell n)
    {A : Lattice} (h : isIdeal v A) :
    ∃ w∈representatives n, ∃ a∈J w v, a≠0 ∧ A=line a*J v w := by
  obtain ⟨ho,hA,hR,B,hB,hAB⟩ := h
  obtain ⟨w,hw,a,ha,h₀,e⟩ := classify_ideal hs hn hv ho hA hB hAB hR
  obtain ⟨z,hz,b,hb,hb0,hh⟩ := unit_frame hn hw ha h₀
  exact ⟨z,hz,b,hb,hb0,e.trans hh⟩

def homothetic (v : Triple) (A B : Lattice) : Prop := ∃ c∈C v, c≠0 ∧ line c*A=B

lemma frame_unique {n : ℕ} (hs : Squarefree n) (hn : n%4=2) {v w z : Triple} (hv : v∈shell n)
    (hw : w∈representatives n) (hz : z∈representatives n) {a b : Q} (ha : a∈J w v) (hb : b∈J z v)
    (ha0 : a≠0) (hb0 : b≠0) :
    homothetic v (line a*J v w) (line b*J v z) ↔ w=z := by
  classical
  constructor
  · rintro ⟨c,hc,hc0,he⟩
    have e := congrArg (fun I:Lattice => I*O) he
    change (line c*(line a*J v w))*O=(line b*J v z)*O at e
    rw [←mul_assoc (line c), line_mul] at e
    rw [mul_assoc,J_extends hs hn hv (Finset.mem_filter.mp hw).1,mul_assoc,J_extends hs hn hv (Finset.mem_filter.mp hz).1] at e
    obtain ⟨q,hq,hnq,e'⟩ := line_O_equal (mul_ne_zero hc0 ha0) hb0 e
    have hq0 : q≠0 := by intro h; simp [h] at hnq
    have ht : q*ι w=ι z*q := by
      apply mul_left_cancel₀ hb0
      calc b*(q*ι w)=(c*a)*ι w := by rw [←mul_assoc,←e']
           _=ι v*(c*a) := by rw [←mul_assoc (ι v),mem_C.mp hc,mul_assoc c (ι v),ha.2,mul_assoc]
           _=b*(ι z*q) := by rw [e',←mul_assoc,hb.2,mul_assoc]
    apply rep_unique hw hz
    refine ⟨q,hq,hnq,?_⟩
    change q*ι w*star q=ι z
    rw [ht,←inv_eq_star_of_unit hnq,mul_assoc,mul_inv_cancel₀ hq0,mul_one]
  · rintro rfl
    refine ⟨b*a⁻¹,mem_C.mpr ?_,mul_ne_zero hb0 (inv_ne_zero ha0),?_⟩
    · apply mul_right_cancel₀ ha0
      calc (ι v*(b*a⁻¹))*a=ι v*b := by simp [mul_assoc,ha0]
           _=b*ι w := hb.2
           _=(b*a⁻¹*ι v)*a := by rw [mul_assoc,ha.2]; simp [mul_assoc,ha0]
    · rw [←mul_assoc,line_mul,mul_assoc,inv_mul_cancel₀ ha0,mul_one]

abbrev IntegralIdeal (v : Triple) := {A : Lattice // isIdeal v A}

def idealSetoid (v : Triple) : Setoid (IntegralIdeal v) where
  r A B := homothetic v A.val B.val
  iseqv := {
    refl := fun _ => ⟨1,mem_C.mpr (by simp),one_ne_zero,by rw [line_one,one_mul]⟩
    symm := by
      rintro A B ⟨c,hc,h₀,he⟩
      refine ⟨c⁻¹,mem_C.mpr ((show Commute (ι v) c from mem_C.mp hc).inv_right₀),inv_ne_zero h₀,?_⟩
      rw [←he,←mul_assoc,two_sided_inverse h₀,one_mul]
    trans := by
      rintro A B D ⟨c,hc,hc₀,he⟩ ⟨d,hd,hd₀,he'⟩
      refine ⟨d*c,(mul_C v) (Submodule.mul_mem_mul hd hc),mul_ne_zero hd₀ hc₀,?_⟩
      rw [←line_mul,mul_assoc,he,he'] }

abbrev ProperIdealClass (v : Triple) := Quotient (idealSetoid v)

noncomputable def representative {n : ℕ} (hs : Squarefree n) (hn : n%4=2) {v : Triple}
    (hv : v∈shell n) (A : IntegralIdeal v) : ↥(representatives n) :=
  ⟨(classify_rep hs hn hv A.property).choose,(classify_rep hs hn hv A.property).choose_spec.1⟩

lemma representative_frame {n : ℕ} (hs : Squarefree n) (hn : n%4=2) {v : Triple}
    (hv : v∈shell n) (A : IntegralIdeal v) :
    ∃ a∈J (representative hs hn hv A).val v, a≠0 ∧ A.val=line a*J v (representative hs hn hv A).val :=
  (classify_rep hs hn hv A.property).choose_spec.2

lemma class_iff_same_rep {n : ℕ} (hs : Squarefree n) (hn : n%4=2) {v : Triple}
    (hv : v∈shell n) (A B : IntegralIdeal v) : homothetic v A B ↔ representative hs hn hv A=representative hs hn hv B := by
  obtain ⟨a,ha,h₀,he⟩ := representative_frame hs hn hv A
  obtain ⟨b,hb,h₁,he'⟩ := representative_frame hs hn hv B
  exact (show homothetic v A B ↔ (representative hs hn hv A).val=(representative hs hn hv B).val by
    conv_lhs => rw [he,he']
    exact frame_unique hs hn hv (representative hs hn hv A).property (representative hs hn hv B).property ha hb h₀ h₁).trans Subtype.ext_iff.symm

/-- Hurwitz embedding classes are parametrized by invertible quadratic ideals modulo field homotheties. -/
noncomputable def idealEquiv {n : ℕ} (hs : Squarefree n) (hn : n%4=2) {v : Triple}
    (hv : v∈shell n) : ProperIdealClass v ≃ ↥(representatives n) := by
  classical
  let f : ProperIdealClass v → ↥(representatives n) := Quotient.lift (representative hs hn hv)
    (fun a b h => (class_iff_same_rep hs hn hv a b).mp h)
  refine Equiv.ofBijective f ⟨?_,?_⟩
  · intro a b
    induction a using Quotient.inductionOn with | _ A =>
      induction b using Quotient.inductionOn with | _ B =>
        intro h
        exact Quotient.sound ((class_iff_same_rep hs hn hv A B).mpr h)
  · intro w
    have hw := (Finset.mem_filter.mp w.property).1
    obtain ⟨a,ha,ha0,he⟩ := intertwine w.val v hw hv
    have haJ : a∈J w.val v := ⟨ha,he⟩
    let A : IntegralIdeal v := ⟨line a*J v w.val,from_embedding hs hn hv hw haJ ha0⟩
    refine ⟨Quotient.mk (idealSetoid v) A,Subtype.ext ?_⟩
    obtain ⟨b,hb,hb0,he'⟩ := representative_frame hs hn hv A
    apply (frame_unique hs hn hv (representative hs hn hv A).property w.property hb haJ hb0 ha0).mp
    rw [←he']; exact (idealSetoid v).refl A

theorem sum_class_representatives {d : ℕ} {T : Type*} [Fintype T] (e : T ≃ ↥(representatives (2*d))) :
    (∑ c : T, test (e c).val)=TunnellShell.b d := by
  calc (∑ c : T, test (e c).val)=∑ w : ↥(representatives (2*d)),test w.val :=
         e.sum_comp (fun w : ↥(representatives (2*d)) => test w.val)
       _=∑ w ∈ representatives (2*d),test w := Finset.sum_coe_sort _ _
       _=TunnellShell.b d := signed_embedding_sum d

/-- The local signs in the Fourier coefficient are counted once per proper ideal class. -/
theorem class_period {d : ℕ} (hs : Squarefree (2*d)) (hn : (2*d)%4=2) {v : Triple}
    (hv : v∈shell (2*d)) : let e := idealEquiv hs hn hv
    letI := Fintype.ofEquiv ↥(representatives (2*d)) e.symm
    (∑ c : ProperIdealClass v, test (e c).val)=TunnellShell.b d :=
  let e := idealEquiv hs hn hv
  letI := Fintype.ofEquiv ↥(representatives (2*d)) e.symm
  sum_class_representatives (d:=d) e

#print axioms idealEquiv
#print axioms class_period
end TunnellToricClass
