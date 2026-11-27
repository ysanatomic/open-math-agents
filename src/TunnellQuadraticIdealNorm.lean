import TunnellIdealInverse

/-! Multiplicative norm on the integral ideals of a squarefree imaginary quadratic order. -/
namespace TunnellIdealHNF
noncomputable def normI {n : ℕ} (I : Ideal (R n)) := Nat.card (R n ⧸ I)
def principal {n : ℕ} (x : R n) := Ideal.span {x}

lemma normI_positive {n : ℕ} (hn : 0<n) (I : Ideal (R n)) (hI : I≠⊥) : 0<normI I := by
  obtain ⟨s,rfl⟩ := normal_form hn hI
  rw [normI,quotient_card]; exact mul_pos (pow_pos s.pos_c _) s.pos_a
lemma int_pos_mem {n : ℕ} (hn : 0<n) (I : Ideal (R n)) (hI : I≠⊥) : ∃ A : ℕ, 0<A ∧ (A:R n)∈I := by
  obtain ⟨s,rfl⟩ := normal_form hn hI
  exact ⟨s.c*s.a,mul_pos s.pos_c s.pos_a,by
    have he : ((s.c*s.a:ℕ):R n)=⟨(s.c:ℤ)*s.a,0⟩ := by
      change (⟨((s.c*s.a:ℕ):ℤ),0⟩ : R n)=_; rw [Nat.cast_mul]
    rw [he]; exact real_basis s⟩

lemma mul_ne_bot {n : ℕ} (hn : 0<n) {I J : Ideal (R n)} (hI : I≠⊥) (hJ : J≠⊥) : I*J≠⊥ := by
  obtain ⟨a,ha,hi⟩ := int_pos_mem hn I hI; obtain ⟨b,hb,hj⟩ := int_pos_mem hn J hJ
  intro h; have hh := Ideal.mul_mem_mul hi hj; rw [h,←Nat.cast_mul] at hh
  exact Nat.cast_ne_zero.mpr (mul_ne_zero ha.ne' hb.ne') (show ((a*b:ℕ):R n)=0 from hh)

lemma conj_mem {n : ℕ} (I : Ideal (R n)) {x : R n} (h : x∈I) : star x∈conjugate I := by simpa [mem_conjugate] using h

lemma conjugate_mul {n : ℕ} (I J : Ideal (R n)) : conjugate (I*J)=conjugate I*conjugate J := by
  apply le_antisymm
  · intro x hx
    change star x∈I*J at hx
    have h (y : R n) (hy : y∈I*J) : star y∈conjugate I*conjugate J := by
      apply Submodule.mul_induction_on (C := fun y => star y∈conjugate I*conjugate J) hy
      · intro a ha b hb; rw [star_mul']; exact Ideal.mul_mem_mul (conj_mem _ ha) (conj_mem _ hb)
      · intro a b ha hb; rw [star_add]; exact add_mem ha hb
    simpa using h (star x) hx
  · apply Ideal.mul_le.mpr
    intro a ha b hb; change star (a*b)∈I*J
    rw [star_mul']; exact Ideal.mul_mem_mul ha hb

lemma norm_conjugate {n : ℕ} (hn : Squarefree n) (h₂ : n%4=2) (I : Ideal (R n)) (hI : I≠⊥) :
    I*conjugate I=principal (normI I:R n) := by
  obtain ⟨s,rfl⟩ := normal_form (show 0<n by omega) hI
  rw [normI,quotient_card]; exact times_conj hn h₂ s

lemma principal_injective_nat {n a b : ℕ} (h : principal (a:R n)=principal b) : a=b := by
  have mono {x y : ℕ} (h : principal (x:R n) ≤ principal y) : y∣x := by
    obtain ⟨z,hz⟩ := Ideal.mem_span_singleton.mp (h (Ideal.mem_span_singleton_self _))
    have he := congrArg Zsqrtd.re hz
    change (x:ℤ)=y*z.re+ -(n:ℤ)*0*z.im at he
    exact Int.natCast_dvd_natCast.mp ⟨z.re,by simpa using he⟩
  exact Nat.dvd_antisymm (mono h.ge) (mono h.le)

lemma principal_mul {n : ℕ} (x y : R n) : principal (x*y)=principal x*principal y := (Ideal.span_singleton_mul_span_singleton x y).symm

lemma normI_mul {n : ℕ} (hn : Squarefree n) (h₂ : n%4=2) {I J : Ideal (R n)} (hI : I≠⊥) (hJ : J≠⊥) :
    normI (I*J)=normI I*normI J := by
  apply principal_injective_nat (n:=n)
  rw [←norm_conjugate hn h₂ _ (mul_ne_bot (by omega) hI hJ),Nat.cast_mul,principal_mul,←norm_conjugate hn h₂ _ hI,
    ←norm_conjugate hn h₂ _ hJ,conjugate_mul]; ac_rfl

lemma principal_star {n : ℕ} (x : R n) : conjugate (principal x)=principal (star x) := by
  ext y
  change star y∈Ideal.span {x} ↔ _
  change star y∈Ideal.span {x} ↔ y∈Ideal.span {star x}
  rw [Ideal.mem_span_singleton,Ideal.mem_span_singleton]
  constructor
  · rintro ⟨z,he⟩; exact ⟨star z,by rw [←star_mul',←he,star_star]⟩
  · rintro ⟨z,rfl⟩; exact ⟨star z,by rw [star_mul',star_star]⟩

lemma positive_norm {n : ℕ} (hn : 0<n) {z : R n} (hz : z≠0) : 0<z.norm := by
  change 0<z.re*z.re- -(n:ℤ)*z.im*z.im
  by_cases h : z.im=0
  · have he : z.re≠0 := fun he => hz (Zsqrtd.ext he h)
    rw [h]; simpa using mul_self_pos.mpr he
  · nlinarith [mul_self_nonneg z.re,mul_pos (show 0<(n:ℤ) by exact_mod_cast hn) (mul_self_pos.mpr h)]

lemma normI_principal {n : ℕ} (hn : Squarefree n) (h₂ : n%4=2) {x : R n} (hx : x≠0) :
    normI (principal x)=x.norm.toNat := by
  have hI : principal x≠⊥ := fun h => hx (by have H : x∈principal x := Ideal.mem_span_singleton_self x; rwa [h] at H)
  apply principal_injective_nat (n:=n)
  rw [←norm_conjugate hn h₂ _ hI,principal_star,←principal_mul,←Zsqrtd.norm_eq_mul_conj]
  congr 1
  rw [←Int.cast_natCast (R:=R n),Int.toNat_of_nonneg (positive_norm (by omega) hx).le]

#print axioms normI_mul
#print axioms normI_principal
end TunnellIdealHNF
