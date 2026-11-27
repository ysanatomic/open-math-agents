import TunnellQuaternionOrbit

/-! The four coordinate sections of an odd quaternion norm shell. -/

namespace TunnellQuaternion

open TunnellShell Finset Quaternion


def leftUnit (j : Fin 4) (q : QInt) : QInt := ![q,
  ⟨-q.imI,q.re,-q.imK,q.imJ⟩,⟨-q.imJ,q.imK,q.re,-q.imI⟩,⟨-q.imK,-q.imJ,q.imI,q.re⟩] j

def unitEquiv (j : Fin 4) : QInt ≃ QInt where
  toFun := leftUnit j
  invFun q := if j=0 then q else -(leftUnit j q)
  left_inv q := by
    fin_cases j
    · rfl
    all_goals
      apply QuaternionAlgebra.ext
      all_goals exact neg_neg _
  right_inv q := by
    fin_cases j
    · rfl
    all_goals
      apply QuaternionAlgebra.ext
      all_goals exact neg_neg _

lemma norm_unit (j : Fin 4) (q : QInt) : Quaternion.normSq (leftUnit j q) = Quaternion.normSq q := by
  simp only [Quaternion.normSq_def']
  fin_cases j <;> simp [leftUnit] <;> ring

lemma sum_unit (p : ℕ) (j : Fin 4) (f : QInt → ℤ) :
    ∑ q ∈ quatShell p, f (leftUnit j q) = ∑ q ∈ quatShell p, f q := by
  apply sum_nbij' (unitEquiv j) (unitEquiv j).symm
  · intro x hx; simpa only [mem_quatShell,norm_unit,unitEquiv,Equiv.coe_fn_mk] using hx
  · intro x hx
    rw [mem_quatShell] at hx ⊢
    rw [←norm_unit j]
    exact (congrArg Quaternion.normSq ((unitEquiv j).apply_symm_apply x)).trans hx
  · exact fun x _ => (unitEquiv j).symm_apply_apply x
  · exact fun x _ => (unitEquiv j).apply_symm_apply x
  · exact fun _ _ => rfl

lemma coordWeight_unit (j : Fin 4) (q : QInt) (v : Triple) :
    coordWeight (rotate (leftUnit j q) v) = coordWeight (rotate q v) := by
  obtain ⟨a,b,c,d⟩ := q
  obtain ⟨x,y,z⟩ := v
  let R := rotate (⟨a,b,c,d⟩:QInt) (x,y,z)
  have co (u v w : ℤ) (e₁ e₂ e₃ : ℤ) (h₁ : e₁=1 ∨ e₁ = -1) (h₂ : e₂=1 ∨ e₂ = -1)
      (h₃ : e₃=1 ∨ e₃ = -1) :
      coordWeight (e₁*u,e₂*v,e₃*w) = coordWeight (u,v,w) := by
    rcases h₁ with rfl|rfl <;> rcases h₂ with rfl|rfl <;> rcases h₃ with rfl|rfl <;>
      simp [coordWeight_eq,lastWeight_neg]
  have hi : rotate (leftUnit j ⟨a,b,c,d⟩) (x,y,z) =
      (![1,1,-1,-1] j*R.1, ![1,-1,1,-1] j*R.2.1, ![1,-1,-1,1] j*R.2.2) := by
    fin_cases j <;> simp [leftUnit,R,rotate_apply] <;> ring_nf <;> simp
  rw [hi]
  apply co <;> fin_cases j <;> decide

lemma sq_mod_four (z : ℤ) : z^2 ≡ z%2 [ZMOD 4] := by
  obtain ⟨r,hr|hr⟩ := Int.even_or_odd' z <;> subst z
  · change _%4 = _%4
    ring_nf
    omega
  · change _%4 = _%4
    ring_nf
    omega

lemma parity_count (p : ℕ) (hp : Odd p) {q : QInt} (hq : q ∈ quatShell p) :
    q.re%2+q.imI%2+q.imJ%2+q.imK%2 = (p%4:ℕ) := by
  have h := (((sq_mod_four q.re).add (sq_mod_four q.imI)).add (sq_mod_four q.imJ)).add (sq_mod_four q.imK)
  rw [←Quaternion.normSq_def', mem_quatShell.mp hq] at h
  have hn := Nat.odd_iff.mp hp
  change (p:ℤ)%4 = _ %4 at h
  omega

theorem four_sections (p : ℕ) (hp : Odd p) (v : Triple) :
    ∑ q ∈ quatShell p, coordWeight (rotate q v) =
       4 * ∑ q ∈ quatShell p,
         if q.re%2 = (if p%4=1 then 1 else 0) then coordWeight (rotate q v) else 0 := by
  let e : ℤ := if p%4=1 then 1 else 0
  let F (q : QInt) := coordWeight (rotate q v)
  let w (q : QInt) := if q.re%2=e then F q else 0
  have hc (q : QInt) (hq : q ∈ quatShell p) : F q = ∑ i : Fin 4, w (leftUnit i q) := by
    simp only [w,F,coordWeight_unit]
    rw [Fin.sum_univ_four]
    simp [leftUnit,Int.neg_emod_two]
    have h := parity_count p hp hq
    have ho := Nat.odd_iff.mp hp
    simp only [e] at *
    split_ifs at * <;> omega
  change ∑ q ∈ quatShell p, F q = 4 * ∑ q ∈ quatShell p, w q
  rw [sum_congr rfl hc,sum_comm]
  simp only [sum_unit,Finset.sum_const,card_univ,Fintype.card_fin,nsmul_eq_mul, Nat.cast_ofNat]

end TunnellQuaternion
