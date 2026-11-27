import TunnellFrickePrimitive
import TunnellFrickeOrbit

/-! A reduction proof for Γ₀(2) in the coordinates (a,b,c,d) representing
the integer matrix with rows (a,b) and (2c,d). -/
namespace TunnellEtaLevel

lemma centered (b a : ℤ) (ha : a≠0) :
    ∃ n : ℤ, 2*(b+n*a).natAbs≤a.natAbs := by
  have pos : 0<a.natAbs := Int.natAbs_pos.mpr ha
  let r := b.bmod a.natAbs
  let q := b.bdiv a.natAbs
  have bound := (Int.bmod_eq_iff (a:=b) pos).mp (rfl : b.bmod a.natAbs=r)
  have he : r+(a.natAbs:ℤ)*q=b := by simpa [q,r,mul_comm] using Int.bmod_add_bdiv b a.natAbs
  by_cases h : 0≤a
  · have ee : (a.natAbs:ℤ)=a := by omega
    rw [ee] at he
    refine ⟨-q,?_⟩
    rw [show b+ -q*a=r by linear_combination -he]
    omega
  · have ee : (a.natAbs:ℤ)= -a := by omega
    rw [ee] at he
    refine ⟨q,?_⟩
    rw [show b+q*a=r by linear_combination -he]
    omega

theorem gamma_two_induction (P : ℤ→ℤ→ℤ→ℤ→Prop)
    (base : ∀ a b d, a*d=1 → P a b 0 d)
    (T : ∀ n a b c d, P (a+2*n*c) (b+n*d) c d → P a b c d)
    (U : ∀ n a b c d, P a b (c+n*a) (d+2*n*b) → P a b c d)
    {a b c d : ℤ} (det : a*d-2*b*c=1) : P a b c d := by
  suffices ∀ m : ℕ, ∀ a b c d : ℤ, a.natAbs=m → a*d-2*b*c=1 → P a b c d by exact this _ _ _ _ _ rfl det
  intro m
  induction m using Nat.strong_induction_on with
  | h m ih =>
    intro a b c d hm det
    have ha : a≠0 := by
      intro h
      have he : 2*(b*c) = -1 := by rw [h] at det; linear_combination -det
      omega
    obtain ⟨n,hn⟩ := centered c a ha
    let r := c+n*a
    let e := d+2*n*b
    apply U n
    change P a b r e
    have det' : a*e-2*b*r=1 := by dsimp [e,r]; linear_combination det
    by_cases hr : r=0
    · subst_vars; rw [hr]; apply base; simpa [hr] using det'
    · obtain ⟨j,hj⟩ := centered a (2*r) (mul_ne_zero (by decide) hr)
      apply T j
      let u := a+2*j*r
      have hu : u.natAbs < m := by
        change 2*r.natAbs≤a.natAbs at hn
        rw [show a+j*(2*r)=u by dsimp [u]; ring,Int.natAbs_mul] at hj
        norm_num at hj
        omega
      apply ih _ hu _ _ _ _ rfl
      linear_combination det'

end TunnellEtaLevel
#print axioms TunnellEtaLevel.gamma_two_induction
