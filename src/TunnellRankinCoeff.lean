import TunnellCMLComplete

/-! The negative quadratic twist and the coefficients of the trivial class-character theta series. -/

namespace TunnellRankin
open Finset TunnellCMLSeries TunnellGaussian

def negWeight (d m : ℕ) : ℤ := if Odd m then jacobiSym (-((2*d:ℕ):ℤ)) m else 0

lemma negWeight_one (d : ℕ) : negWeight d 1=1 := by simp [negWeight]

lemma negWeight_mul (d a b : ℕ) : negWeight d (a*b)=negWeight d a*negWeight d b := by
  by_cases ha : Odd a <;> by_cases hb : Odd b <;> simp [negWeight,Nat.odd_mul,ha,hb]
  exact jacobiSym.mul_right' _ (fun h => by simp [h] at ha) (fun h => by simp [h] at hb)

lemma negWeight_pow (d a k : ℕ) : negWeight d (a^k)=(negWeight d a)^k := by
  induction k with
  | zero => simp [negWeight_one]
  | succ k ih => rw [pow_succ,negWeight_mul,ih,pow_succ]

lemma norm_weight (d m : ℕ) : ‖(negWeight d m:ℂ)‖≤1 := by
  unfold negWeight
  split
  · rcases jacobiSym.trichotomy (-((2*d:ℕ):ℤ)) m with h|h|h <;> rw [h] <;> norm_num
  · simp

lemma twist_by_negative (d m : ℕ) : gaussCoeff (2*d) m=(negWeight d m:ℂ)*gaussCoeff 1 m := by
  by_cases hm : Odd m
  · by_cases h : m%4=1
    · simp only [gaussCoeff,twistSign,negWeight,if_pos hm,Nat.cast_one,jacobiSym.one_left,
        Int.cast_one,one_mul]
      rw [show (-((2*d:ℕ):ℤ))=(-1)*((2*d:ℕ):ℤ) by ring,jacobiSym.mul_left,jacobiSym.at_neg_one hm,
        ZMod.χ₄_nat_one_mod_four h,one_mul]
    · have h3 : m%4=3 := by have := Nat.odd_iff.mp hm; omega
      simp [gaussCoeff,mass,TunnellSplitMass.shell_mod_four h3]
  · simp [gaussCoeff,twistSign,negWeight,hm]

def chi (d : ℕ) : ArithmeticFunction ℤ := ⟨negWeight d,by simp [negWeight]⟩

lemma chi_mult (d : ℕ) : (chi d).IsMultiplicative :=
  ⟨negWeight_one d,fun _ => negWeight_mul d _ _⟩

def idealCoeff (d m : ℕ) : ℤ := ∑ e∈m.divisors,negWeight d e

lemma idealCoeff_mul (d : ℕ) {a b : ℕ} (h : a.Coprime b) :
    idealCoeff d (a*b)=idealCoeff d a*idealCoeff d b := by
  let z := (ArithmeticFunction.zeta : ArithmeticFunction ℤ)
  have he (m : ℕ) : (chi d*z) m = idealCoeff d m := by
    rw [show z=(ArithmeticFunction.zeta : ArithmeticFunction ℤ) by rfl,ArithmeticFunction.coe_mul_zeta_apply]
    rfl
  rw [←he,←he,←he]
  exact ((chi_mult d).mul ArithmeticFunction.isMultiplicative_zeta.natCast).map_mul_of_coprime h

lemma idealCoeff_one (d : ℕ) : idealCoeff d 1=1 := by simp [idealCoeff,negWeight_one]

lemma idealCoeff_prime_pow (d p k : ℕ) (hp : p.Prime) :
    idealCoeff d (p^k)=∑ j∈range (k+1),(negWeight d p)^j := by
  rw [idealCoeff,Nat.sum_divisors_prime_pow hp]
  simp_rw [negWeight_pow]

lemma norm_idealCoeff (d m : ℕ) : ‖(idealCoeff d m:ℂ)‖≤(m:ℝ) := by
  rw [idealCoeff,Int.cast_sum]
  calc
    _ ≤ ∑ e∈m.divisors,‖(negWeight d e:ℂ)‖ := norm_sum_le _ _
    _ ≤ ∑ _e∈m.divisors,(1:ℝ) := sum_le_sum (fun e _ => norm_weight d e)
    _ = m.divisors.card := by simp
    _ ≤ m := by
      exact_mod_cast (show m.divisors.card ≤ m by
        have h : m.divisors ⊆ Icc 1 m := by
          intro e he
          obtain ⟨hdiv,hm⟩ := Nat.mem_divisors.mp he
          exact mem_Icc.mpr ⟨Nat.pos_of_dvd_of_pos hdiv (Nat.pos_of_ne_zero hm),
            Nat.le_of_dvd (Nat.pos_of_ne_zero hm) hdiv⟩
        simpa using card_le_card h)

end TunnellRankin
#print axioms TunnellRankin.twist_by_negative
#print axioms TunnellRankin.idealCoeff_mul
