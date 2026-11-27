import TunnellShell

/-! Integral quaternion norm shells, rotations, and the weight on a coordinate. -/

namespace TunnellQuaternion

open Finset Quaternion TunnellShell


abbrev QInt := Quaternion ℤ

lemma normSq_mk (a b c d : ℤ) : Quaternion.normSq (⟨a,b,c,d⟩:QInt) = a^2+b^2+c^2+d^2 := Quaternion.normSq_def' _

lemma neg_mk (a b c d : ℤ) : -(⟨a,b,c,d⟩:QInt) = ⟨-a,-b,-c,-d⟩ := rfl

abbrev coordsEquiv := Quaternion.equivProd ℤ

def quatShell (N : ℕ) : Finset QInt :=
  let I := Icc (-(N:ℤ)) (N:ℤ)
  ((I ×ˢ (I ×ˢ (I ×ˢ I))).map coordsEquiv.symm.toEmbedding).filter (fun q => Quaternion.normSq q=N)

@[simp] lemma mem_quatShell {q : QInt} {N : ℕ} : q ∈ quatShell N ↔ Quaternion.normSq q=N := by
  simp only [quatShell,mem_filter,mem_map_equiv]
  refine ⟨And.right,fun hn => ⟨?_,hn⟩⟩
  rw [Quaternion.normSq_def'] at hn
  obtain ⟨a,b,c,d⟩ := q
  change a^2+b^2+c^2+d^2 = (N:ℤ) at hn
  simp only [mem_product,mem_Icc]
  change (- (N:ℤ) ≤ a ∧ a ≤ N) ∧ (- (N:ℤ) ≤ b ∧ b ≤ N) ∧
    (- (N:ℤ) ≤ c ∧ c ≤ N) ∧ - (N:ℤ) ≤ d ∧ d ≤ N
  have hb (x : ℤ) (h : x^2 ≤ N) : -(N:ℤ) ≤ x ∧ x ≤ N := by
    constructor <;> by_contra! he
    · have := mul_nonneg_of_nonpos_of_nonpos (by omega : x ≤ 0) (by omega : x+1 ≤ 0)
      nlinarith
    · have := mul_nonneg (by omega : 0 ≤ x) (by omega : 0 ≤ x-1)
      nlinarith
  exact ⟨hb _ (by nlinarith [sq_nonneg b,sq_nonneg c,sq_nonneg d]),
    hb _ (by nlinarith [sq_nonneg a,sq_nonneg c,sq_nonneg d]),
    hb _ (by nlinarith [sq_nonneg a,sq_nonneg b,sq_nonneg d]),
    hb _ (by nlinarith [sq_nonneg a,sq_nonneg b,sq_nonneg c])⟩

def pure (v : Triple) : QInt := ⟨0,v.1,v.2.1,v.2.2⟩
def vec (q : QInt) : Triple := (q.imI,q.imJ,q.imK)
def rotate (q : QInt) (v : Triple) : Triple := vec (q*pure v*star q)

lemma rotate_apply (a b c d x y z : ℤ) :
    rotate ⟨a,b,c,d⟩ (x,y,z) =
      ((a^2+b^2-c^2-d^2)*x+2*(b*c-a*d)*y+2*(b*d+a*c)*z,
       2*(b*c+a*d)*x+(a^2-b^2+c^2-d^2)*y+2*(c*d-a*b)*z,
       2*(b*d-a*c)*x+2*(c*d+a*b)*y+(a^2-b^2-c^2+d^2)*z) := by
  suffices h : ∀ (q : QInt) (v : Triple), rotate q v =
      ((q.re^2+q.imI^2-q.imJ^2-q.imK^2)*v.1+2*(q.imI*q.imJ-q.re*q.imK)*v.2.1+2*(q.imI*q.imK+q.re*q.imJ)*v.2.2,
       2*(q.imI*q.imJ+q.re*q.imK)*v.1+(q.re^2-q.imI^2+q.imJ^2-q.imK^2)*v.2.1+2*(q.imJ*q.imK-q.re*q.imI)*v.2.2,
       2*(q.imI*q.imK-q.re*q.imJ)*v.1+2*(q.imJ*q.imK+q.re*q.imI)*v.2.1+(q.re^2-q.imI^2-q.imJ^2+q.imK^2)*v.2.2) from h _ _
  intro q v
  ext <;> simp only [rotate,vec,Quaternion.re_mul, Quaternion.imI_mul, Quaternion.imJ_mul, Quaternion.imK_mul, Quaternion.re_star, Quaternion.imI_star, Quaternion.imJ_star, Quaternion.imK_star] <;> simp [pure] <;> ring

def lastWeight (z : ℤ) : ℤ := if z%8=0 then 1 else if z%8=4 then -1 else 0

lemma coordWeight_eq (x y z : ℤ) : coordWeight (x,y,z) =
    if Odd x ∧ Odd y then lastWeight z else 0 := by
  by_cases hx : Odd x <;> by_cases hy : Odd y <;> simp [coordWeight,admissible,hx,hy,lastWeight]
  split_ifs with h h' h''
  all_goals first
    | (rw [Int.negOnePow_even _ (Int.even_iff.mpr (by omega))]; rfl)
    | (rw [Int.negOnePow_odd _ (Int.odd_iff.mpr (by omega))]; rfl)
    | omega

lemma lastWeight_neg (z : ℤ) : lastWeight (-z) = lastWeight z := by
  unfold lastWeight
  split_ifs <;> omega

lemma lastWeight_congr {a b : ℤ} (h : a ≡ b [ZMOD 8]) : lastWeight a = lastWeight b := by
  simp only [lastWeight,show a%8=b%8 from h]

lemma lastWeight_add_four (z k : ℤ) : lastWeight (z+4*k) = (k.negOnePow:ℤ)*lastWeight z := by
  obtain ⟨r,hr|hr⟩ := Int.even_or_odd' k <;> subst k
  · rw [Int.negOnePow_two_mul]
    simp only [Units.val_one,one_mul]
    apply lastWeight_congr
    exact Int.modEq_iff_dvd.mpr ⟨-r,by ring⟩
  · rw [Int.negOnePow_two_mul_add_one]
    simp only [Units.val_neg,Units.val_one,neg_one_mul,lastWeight]
    split_ifs <;> omega

end TunnellQuaternion
