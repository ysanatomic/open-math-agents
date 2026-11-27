import TunnellLocalFourier

/-! The restrictions of Tunnell's three theta test functions to odd indices. -/

namespace TunnellLocalFourier
open Polynomial Finset UpperHalfPlane

noncomputable def core (m : ℕ) : ℤ[X] := X * ∏ k ∈ Icc 1 m, ((1-X^(8*k))*(1-X^(16*k)))
noncomputable def term (t m k : ℕ) : ℤ := (core m * X^(t*k^2)).coeff m
noncomputable def repr (t m : ℕ) : ℤ := (core m * (1+2*∑ k ∈ Icc 1 m, X^(t*k^2))).coeff m

noncomputable def b (t m : ℕ) : ℂ := (qExpansion 1 (fun z : UpperHalfPlane =>
    ModularForm.eta (8*(z:ℂ))*ModularForm.eta (16*(z:ℂ))*jacobiTheta ((2*t:ℂ)*(z:ℂ)))).coeff m

lemma b_eq (t : ℕ) (ht : 0<t) (m : ℕ) : b t m=(repr t m:ℂ) := qExpansion_local t ht m

lemma core_zero {m n : ℕ} (hn : n%8≠1) : (core m).coeff n=0 := by
  let Q : ℤ[X] := ∏ k ∈ Icc 1 m, ((1-X^k)*(1-X^(2*k)))
  have h : expand ℤ 8 Q = ∏ k ∈ Icc 1 m, ((1-X^(8*k))*(1-X^(16*k))) := by
    simp [Q,expand_X,←pow_mul,←Nat.mul_assoc]
  unfold core
  rw [←h]
  cases n with
  | zero => simp
  | succ n =>
    rw [coeff_X_mul,coeff_expand (by decide : 0<8)]
    exact if_neg (by omega)

lemma expansion (t m : ℕ) : repr t m=(core m).coeff m + 2*∑ k ∈ Icc 1 m,term t m k := by
  simp [repr,term,mul_add,mul_one,show ∀ a b : ℤ[X], a*(2*b)=2*(a*b) by intros; ring,
    mul_sum,coeff_sum, two_mul,add_mul,coeff_add]

lemma term_zero_of_large {t m k : ℕ} (h : m<t*k^2) : term t m k=0 := by
  simp [term,coeff_mul_X_pow',if_neg (by omega : ¬ t*k^2 ≤ m)]

lemma term_zero_of_residue {t m k : ℕ} (h : m%8≠(1+t*k^2)%8) : term t m k=0 := by
  unfold term
  rw [coeff_mul_X_pow']
  split_ifs with hk
  · apply core_zero
    omega
  · rfl

def inds (t m : ℕ) : Finset ℕ := (Icc 1 m).filter (fun k => t*k^2 ≤ m)

lemma expansion' (t m : ℕ) : repr t m=(core m).coeff m + 2*∑ k ∈ inds t m,term t m k := by
  rw [expansion,inds,sum_filter]
  congr 2
  apply sum_congr rfl
  intro k hk
  split_ifs with h
  · rfl
  · exact term_zero_of_large (by omega)

lemma dissection (t m : ℕ) (ht : 0<t) (odd_off : ∀ k, Odd k → m%8≠(1+t*k^2)%8) :
    repr t m=repr (4*t) m := by
  rw [expansion',expansion']
  congr 2
  calc
    _ = ∑ k ∈ (inds t m).filter Even, term t m k := by
      rw [sum_filter]
      apply sum_congr rfl
      intro k _
      split_ifs with he
      · rfl
      · exact term_zero_of_residue (odd_off k (Nat.not_even_iff_odd.mp he))
    _ = _ := by
      apply sum_nbij' (fun k:ℕ => k/2) (fun j:ℕ => 2*j)
      · intro k hk
        rcases mem_filter.mp hk with ⟨h,⟨j,hj⟩⟩
        obtain ⟨hi,hk⟩ := mem_filter.mp h
        obtain ⟨hpos,hmax⟩ := mem_Icc.mp hi
        have he : 4*t*(k/2)^2=t*k^2 := by rw [show k=2*j by omega,Nat.mul_div_cancel_left _ (by decide : 0<2)]; ring
        exact mem_filter.mpr ⟨mem_Icc.mpr ⟨by omega,by omega⟩,he ▸ hk⟩
      · intro j hj
        obtain ⟨hi,hj⟩ := mem_filter.mp hj
        have h : 2*j ≤ t*(2*j)^2 := by
          have hs := Nat.le_mul_self (2*j)
          have hT := Nat.mul_le_mul_right ((2*j)^2) (show 1≤t by omega)
          nlinarith
        have hd : t*(2*j)^2=4*t*j^2 := by ring
        rw [hd] at h
        exact mem_filter.mpr ⟨mem_filter.mpr ⟨mem_Icc.mpr ⟨by have := (mem_Icc.mp hi).1; omega,by omega⟩,hd ▸ hj⟩,even_two_mul _⟩
      · intro k hk
        obtain ⟨j,hj⟩ := (mem_filter.mp hk).2
        omega
      · intro j _; omega
      · intro k hk
        obtain ⟨j,hj⟩ := (mem_filter.mp hk).2
        have he : t*k^2=4*t*(k/2)^2 := by rw [show k=2*j by omega,Nat.mul_div_cancel_left _ (by decide : 0<2)]; ring
        simp only [term,he]

lemma one_eq_four {d : ℕ} (hd : Odd d) : b 1 d=b 4 d := by
  rw [b_eq 1 (by decide),b_eq 4 (by decide)]
  apply congrArg (fun n:ℤ => (n:ℂ))
  apply dissection 1 d (by decide)
  intro k hk
  have hodd := Nat.odd_iff.mp (hk.pow (n:=2))
  have hd' := Nat.odd_iff.mp hd
  simp only [one_mul]
  omega

lemma four_eq_sixteen {d : ℕ} (hd : d%8=1) : b 4 d=b 16 d := by
  rw [b_eq 4 (by decide),b_eq 16 (by decide)]
  apply congrArg (fun n:ℤ => (n:ℂ))
  apply dissection 4 d (by decide)
  intro k hk
  have hh := Nat.odd_iff.mp (hk.pow (n:=2))
  omega

lemma sixteen_zero {d : ℕ} (hd : d%8≠1) : b 16 d=0 := by
  rw [b_eq 16 (by decide),expansion,core_zero hd,sum_eq_zero (fun k _ => term_zero_of_residue (by omega : d%8≠(1+16*k^2)%8))]
  norm_num

lemma four_zero {d : ℕ} (hd : d%4≠1) : b 4 d=0 := by
  rw [b_eq 4 (by decide),expansion,core_zero (by omega),sum_eq_zero (fun k _ => term_zero_of_residue (by omega : d%8≠(1+4*k^2)%8))]
  norm_num

end TunnellLocalFourier
