import TunnellHurwitzFour

/-! The global Hurwitz order and its one-sided ideal class number. -/

namespace TunnellHurwitz
open TunnellHurwitzFour Quaternion
abbrev Q := Quaternion ℚ

def hamZ (x : H ℤ) : Q := ham ((x.1:ℚ),(x.2.1:ℚ),(x.2.2.1:ℚ),(x.2.2.2:ℚ))

lemma hamZ_mul (x y : H ℤ) : hamZ (prod x y) = hamZ x * hamZ y := by
  unfold hamZ
  rw [←ham_prod]
  congr 1
  rcases x with ⟨a,b,c,d⟩
  rcases y with ⟨e,f,g,h⟩
  simp [prod]

lemma hamZ_add (x y : H ℤ) : hamZ (x+y)=hamZ x+hamZ y := by
  apply QuaternionAlgebra.ext <;> simp only [Quaternion.re_add,Quaternion.imI_add,Quaternion.imJ_add,Quaternion.imK_add] <;> simp [hamZ,ham,add_div] <;> ring

lemma hamZ_neg (x : H ℤ) : hamZ (-x)=-(hamZ x) := by
  apply QuaternionAlgebra.ext <;> simp only [Quaternion.re_neg,Quaternion.imI_neg,Quaternion.imJ_neg,Quaternion.imK_neg] <;> simp [hamZ,ham] <;> ring

def order : Subring Q where
  carrier := Set.range hamZ
  zero_mem' := ⟨0,by apply QuaternionAlgebra.ext <;> norm_num [hamZ,ham]⟩
  one_mem' := ⟨(1,0,0,0),by apply QuaternionAlgebra.ext <;> norm_num [hamZ,ham]⟩
  add_mem' := by rintro _ _ ⟨a,rfl⟩ ⟨b,rfl⟩; exact ⟨a+b,hamZ_add a b⟩
  neg_mem' := by rintro _ ⟨a,rfl⟩; exact ⟨-a,hamZ_neg _⟩
  mul_mem' := by rintro _ _ ⟨a,rfl⟩ ⟨b,rfl⟩; exact ⟨prod a b,hamZ_mul _ _⟩

lemma integer_coords (a b c d : ℤ) : (⟨a,b,c,d⟩:Q)∈order := by
  refine ⟨(a-d,b-d,c-d,2*d),?_⟩
  apply QuaternionAlgebra.ext <;> dsimp [hamZ,ham] <;> push_cast <;> ring

lemma half_mem : (⟨1/2,1/2,1/2,1/2⟩:Q)∈order := by
  refine ⟨(0,0,0,1),?_⟩
  apply QuaternionAlgebra.ext <;> norm_num [hamZ,ham]

lemma norm_int {q : Q} (hq : q∈order) : ∃ n : ℕ, normSq q=n := by
  obtain ⟨⟨a,b,c,d⟩,rfl⟩ := hq
  let N := nr (a,b,c,d)
  have hh : normSq (hamZ (a,b,c,d))=(N:ℚ) := by simp [hamZ,ham_norm,N,nr]
  have hN : 0≤N := by exact_mod_cast (hh ▸ normSq_nonneg : 0≤(N:ℚ))
  refine ⟨N.toNat,hh.trans ?_⟩
  exact_mod_cast (Int.toNat_of_nonneg hN).symm

/-- Rounding into the Lipschitz suborder suffices unless all four entries are half-integers. -/
lemma approximate (q : Q) : ∃ r∈order, normSq (q-r)<1 := by
  let r : Q := ⟨round q.re,round q.imI,round q.imJ,round q.imK⟩
  have hr : r∈order := integer_coords _ _ _ _
  by_cases h : normSq (q-r)<1
  · exact ⟨r,hr,h⟩
  let err (t : ℚ) := t-round t
  have bound (t : ℚ) : err t ^ 2 ≤ 1/4 := by
    have hl := round_le_add_half t
    have hh := sub_half_lt_round t
    dsimp [err]
    nlinarith [mul_nonneg (show 0≤t-round t+1/2 by linarith) (show 0≤1/2-(t-round t) by linarith)]
  have eqn (t : ℚ) (ht : 1/4 ≤ err t^2) : err t = -1/2 := by
    have he := le_antisymm (bound t) ht
    have hlt : err t<1/2 := by dsimp [err]; linarith [sub_half_lt_round t]
    have hf : (err t-1/2)*(err t+1/2)=0 := by nlinarith
    rcases mul_eq_zero.mp hf with ha|ha <;> linarith
  have he : ¬err q.re^2+err q.imI^2+err q.imJ^2+err q.imK^2<1 := by
    rw [normSq_def'] at h
    exact h
  have a := eqn q.re (by linarith [bound q.imI,bound q.imJ,bound q.imK])
  have b := eqn q.imI (by linarith [bound q.re,bound q.imJ,bound q.imK])
  have c := eqn q.imJ (by linarith [bound q.re,bound q.imI,bound q.imK])
  have d := eqn q.imK (by linarith [bound q.re,bound q.imI,bound q.imJ])
  let u : Q := ⟨1/2,1/2,1/2,1/2⟩
  have heq : q=r-u := by
    dsimp only [err] at a b c d
    apply QuaternionAlgebra.ext
    · change q.re=(round q.re:ℚ)-1/2; linarith
    · change q.imI=(round q.imI:ℚ)-1/2; linarith
    · change q.imJ=(round q.imJ:ℚ)-1/2; linarith
    · change q.imK=(round q.imK:ℚ)-1/2; linarith
  refine ⟨q,?_,by simp⟩
  rw [heq]
  exact order.sub_mem hr half_mem

/-- Every nonzero integral right ideal of the maximal Hurwitz order is principal. -/
theorem integral_class_number_one (S : Set Q) (hin : S⊆order)
    (hsub : ∀ a∈S, ∀ b∈S, a-b∈S) (hmul : ∀ a∈S, ∀ b∈order, a*b∈S)
    (hne : ∃ a∈S, a≠0) :
    ∃ a∈S, a≠0 ∧ S={x | ∃ b∈order, x=a*b} := by
  classical
  let P (n : ℕ) := ∃ a∈S, a≠0 ∧ normSq a = n
  obtain ⟨q,hq,hq0⟩ := hne
  obtain ⟨n,hn⟩ := norm_int (hin hq)
  have hP : ∃ n, P n := ⟨n,q,hq,hq0,hn⟩
  obtain ⟨a,ha,ha0,han⟩ := Nat.find_spec hP
  refine ⟨a,ha,ha0,Set.ext fun x => ⟨?_,?_⟩⟩
  · intro hx
    obtain ⟨r,hr,ht⟩ := approximate (a⁻¹*x)
    have hv : x-a*r∈S := hsub x hx _ (hmul a ha r hr)
    have he : x-a*r=a*(a⁻¹*x-r) := by rw [mul_sub,←mul_assoc,mul_inv_cancel₀ ha0,one_mul]
    have ha' : 0<normSq a := lt_of_le_of_ne normSq_nonneg (normSq_ne_zero.mpr ha0).symm
    have hlt : normSq (x-a*r)<normSq a := by
      rw [he,map_mul]; simpa using mul_lt_mul_of_pos_left ht ha'
    have hzero : x-a*r=0 := by
      by_contra h0
      obtain ⟨k,hk⟩ := norm_int (hin hv)
      have hmin := Nat.find_min' hP (show P k from ⟨x-a*r,hv,h0,hk⟩)
      rw [hk,han] at hlt
      exact (not_lt_of_ge hmin) (by exact_mod_cast hlt)
    exact ⟨r,hr,sub_eq_zero.mp hzero⟩
  · rintro ⟨r,hr,rfl⟩; exact hmul a ha r hr

#print axioms integral_class_number_one

end TunnellHurwitz
