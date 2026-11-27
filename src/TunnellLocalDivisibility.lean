import Mathlib.NumberTheory.Padics.RingHoms
import Mathlib.GroupTheory.OrderOfElement
import Mathlib.Tactic

/-! The local nondivisibility needed for the Lang–Mazur proof of the ramification step. -/

namespace TunnellLocalDivisibility

variable {p : ℕ} [Fact p.Prime]

lemma padic_addHom_scalar (f : ℤ_[p] →+ ℤ_[p]) (x : ℤ_[p]) : f x = f 1 * x := by
  by_contra h
  have hn := sub_ne_zero.mpr h
  let r := (f x-f 1*x).valuation+1
  have hx := PadicInt.appr_spec r x
  rw [Ideal.mem_span_singleton] at hx
  obtain ⟨z,hz⟩ := hx
  have hf : f ((p:ℤ_[p])^r*z) = (p:ℤ_[p])^r*f z := by
    simpa only [nsmul_eq_mul,Nat.cast_pow] using f.map_nsmul (p^r) z
  have hm : f (x.appr r : ℤ_[p]) = (x.appr r:ℤ_[p])*f 1 := by
    simpa only [nsmul_eq_mul,mul_one] using f.map_nsmul (x.appr r) (1:ℤ_[p])
  have he := congrArg f hz
  rw [map_sub,hm,hf] at he
  have hdiv : (p:ℤ_[p])^r ∣ f x-f 1*x := ⟨f z-f 1*z,by linear_combination he - f 1*hz⟩
  have := (PadicInt.mem_span_pow_iff_le_valuation _ hn r).mp (Ideal.mem_span_singleton.mpr hdiv)
  omega

variable {A : Type*} [AddCommGroup A]

noncomputable def anchor (H : AddSubgroup A) : A →+ H where
  toFun a := ⟨H.index • a,H.nsmul_index_mem a⟩
  map_zero' := by ext; simp
  map_add' a b := by ext; simp

noncomputable def localLog (H : AddSubgroup A) (u : H ≃+ ℤ_[p]) : A→+ℤ_[p] :=
  u.toAddMonoidHom.comp (anchor H)

lemma localLog_nonzero (H : AddSubgroup A) [H.FiniteIndex] (u : H≃+ℤ_[p]) (a : A)
    (ha : ¬ IsOfFinAddOrder a) : localLog H u a ≠ 0 := by
  intro h
  apply ha
  apply isOfFinAddOrder_iff_nsmul_eq_zero.mpr
  refine ⟨H.index,Nat.pos_of_ne_zero (AddSubgroup.FiniteIndex.index_ne_zero (H:=H)),?_⟩
  have he : anchor H a=0 := u.injective (by change u (anchor H a)= u 0; rw [map_zero]; exact h)
  exact congrArg Subtype.val he

lemma localLog_on_H (H : AddSubgroup A) (u : H≃+ℤ_[p]) (a : H) :
    localLog H u a = (H.index:ℤ_[p])*u a := by
  change u (anchor H a) = _
  rw [show anchor H a=H.index • a by rfl,map_nsmul,nsmul_eq_mul]

/-- The action of the CM quarter-turn on a rank-one local logarithm is one of the two
    p-adic embeddings. No continuity assumption on this finite-index group isomorphism is needed. -/
lemma localLog_CM (H : AddSubgroup A) [H.FiniteIndex] (u : H≃+ℤ_[p]) (I : A→+A)
    (hi : ∀ x, I (I x) = -x) (z : ℤ_[p]) (hz : z^2 = -1) :
    ∃ t : ℤ_[p], t^2= -1 ∧ (t=z ∨ t= -z) ∧ ∀ a, localLog H u (I a)= t*localLog H u a := by
  let ℓ := localLog H u
  let d : ℤ_[p] := H.index
  let f : ℤ_[p]→+ℤ_[p] := ℓ.comp (I.comp (H.subtype.comp u.symm.toAddMonoidHom))
  let c := f 1
  have hd : d≠0 := by
    dsimp [d]
    exact_mod_cast (AddSubgroup.FiniteIndex.index_ne_zero (H:=H))
  have hc (a : A) : d*ℓ (I a)=c*ℓ a := by
    have hh := padic_addHom_scalar f (ℓ a)
    change ℓ (I ((u.symm (u (anchor H a)) : H):A)) = _ at hh
    rw [u.symm_apply_apply] at hh
    change ℓ (I (H.index • a)) = _ at hh
    rwa [map_nsmul,map_nsmul,nsmul_eq_mul] at hh
  let a₀ : A := u.symm 1
  have ha₀ : ℓ a₀ = d := by simpa [ℓ,a₀,d] using localLog_on_H H u (u.symm 1)
  have hc0 := hc a₀
  rw [ha₀,mul_comm c d] at hc0
  have haI := mul_left_cancel₀ hd hc0
  have h2 := hc (I a₀)
  rw [hi,map_neg,ha₀,haI] at h2
  have hid : (c-d*z)*(c+d*z)=0 := by linear_combination -h2-d^2*hz
  rcases mul_eq_zero.mp hid with e|e
  · refine ⟨z,hz,Or.inl rfl,fun a => mul_left_cancel₀ hd ?_⟩
    rw [hc,sub_eq_zero.mp e,mul_assoc]
  · refine ⟨-z,by simpa using hz,Or.inr rfl,fun a => mul_left_cancel₀ hd ?_⟩
    rw [hc,eq_neg_of_add_eq_zero_left e]
    change -(d*z)*ℓ a = d*(-z*ℓ a)
    ring

/-- A non-torsion local point has bounded divisibility by one of the primes above p. -/
theorem bounded_divisibility (H : AddSubgroup A) [H.FiniteIndex] (u : H≃+ℤ_[p])
    (I : A→+A) (hi : ∀ x, I (I x)= -x) (z : ℤ_[p]) (hz : z^2 = -1)
    (a b : ℤ) (hab : a^2+b^2=(p:ℤ)) (P : A) (hP : ¬IsOfFinAddOrder P) :
    ∃ B : ℕ, ∃ b' : ℤ, (b'=b ∨ b'= -b) ∧ ∀ r, B<r →
      ¬ ∃ Q : A, (fun x => a • x + b' • I x)^[r] Q=P := by
  obtain ⟨t,ht,_,htI⟩ := localLog_CM H u I hi z hz
  let ℓ := localLog H u
  have hℓ : ℓ P≠0 := localLog_nonzero H u P hP
  have hab' : (a:ℤ_[p])^2+(b:ℤ_[p])^2=(p:ℤ_[p]) := by exact_mod_cast hab
  have he : ((a:ℤ_[p])+b*t)*(a-b*t)=(p:ℤ_[p]) := by linear_combination hab'-(b:ℤ_[p])^2*ht
  have hs := PadicInt.irreducible_p.prime.dvd_mul.mp (show (p:ℤ_[p]) ∣ ((a:ℤ_[p])+b*t)*(a-b*t) by rw [he])
  obtain ⟨b',hb',hdiv⟩ : ∃ b' : ℤ, (b'=b ∨ b'= -b) ∧ (p:ℤ_[p]) ∣ ((a:ℤ_[p])+b'*t) := by
    rcases hs with h|h
    · exact ⟨b,Or.inl rfl,h⟩
    · exact ⟨-b,Or.inr rfl,by simpa [sub_eq_add_neg] using h⟩
  let T (x : A) := a • x + b' • I x
  let c : ℤ_[p] := a+b'*t
  have hT (x : A) : ℓ (T x) = c*ℓ x := by simp [T,c,ℓ,map_zsmul,zsmul_eq_mul,htI]; ring
  have hr (r : ℕ) (Q : A) : ℓ (T^[r] Q) = c^r*ℓ Q := by
    induction r with
    | zero => simp
    | succ r ih => rw [Function.iterate_succ_apply',hT,ih,pow_succ]; ring
  refine ⟨(ℓ P).valuation,b',hb',fun r hb ⟨Q,hQ⟩ => ?_⟩
  have hd : (p:ℤ_[p])^r ∣ ℓ P := by
    rw [←hQ,hr]
    exact dvd_mul_of_dvd_left (pow_dvd_pow_of_dvd hdiv r) _
  have hh := (PadicInt.mem_span_pow_iff_le_valuation _ hℓ r).mp (Ideal.mem_span_singleton.mpr hd)
  omega

end TunnellLocalDivisibility
