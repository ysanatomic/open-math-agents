import TunnellRankinCoeff
import TunnellRankinProduct

/-! The complete Rankin–Selberg Euler product for the base congruent-number form
and the trivial quadratic ideal-class character of discriminant −8d. -/

namespace TunnellRankin
open Finset TunnellGaussian TunnellCMLSeries
open OMA.R_CongruentNumber_Tunnell_even_R1

noncomputable def dir (f : ℕ→ℂ) (s : ℝ) (m : ℕ) : ℂ := f m/(m:ℂ)^(s:ℂ)
noncomputable def twistA (n : ℕ) := gaussCoeff n
noncomputable def rankinA (d m : ℕ) : ℂ := twistA 1 m*(idealCoeff d m:ℂ)
noncomputable def localSum (f : ℕ→ℂ) (s : ℝ) (p : Nat.Primes) : ℂ := ∑' k : ℕ, dir f s (p.val^k)

lemma twistA_one (n : ℕ) : twistA n 1=1 := by simp [twistA,gaussCoeff,mass_one,twistSign_one]
lemma twistA_mul (n : ℕ) {a b : ℕ} (h : a.Coprime b) : twistA n (a*b)=twistA n a*twistA n b := by
  simp only [twistA,gaussCoeff,twistSign_mul,coefficient_mul h,Int.cast_mul]
  ring

lemma euler {f : ℕ→ℂ} {s : ℝ} (hs : 0<s) (h1 : f 1=1)
    (hm : ∀ {a b : ℕ}, a.Coprime b → f (a*b)=f a*f b) (hf : Summable (dir f s)) :
    HasProd (localSum f s) (∑' k,dir f s k) := by
  apply EulerProduct.eulerProduct_hasProd
  · simp [dir,h1]
  · intro a b hc
    simp [dir,hm hc,Nat.cast_mul,Complex.natCast_mul_natCast_cpow,div_mul_div_comm]
  · exact hf.norm
  · simp [dir,Complex.zero_cpow (by exact_mod_cast hs.ne' : (s:ℂ)≠0)]

lemma summable_rankin (d : ℕ) (s : ℝ) (hs : 5/2<s) : Summable (dir (rankinA d) s) := by
  have hf := (shell_expansion 1 (s-1) (by linarith)).summable.norm
  apply Summable.of_norm
  apply hf.of_nonneg_of_le (fun _ => norm_nonneg _)
  intro m
  by_cases h : m=0
  · subst m
    rw [show dir (rankinA d) s 0=0 by simp [dir,Complex.zero_cpow (by exact_mod_cast (by linarith : s≠0) : (s:ℂ)≠0)],norm_zero]
    exact norm_nonneg _
  · have hp : (0:ℝ) < m := by exact_mod_cast Nat.pos_of_ne_zero h
    change ‖twistA 1 m*(idealCoeff d m:ℂ)/(m:ℂ)^(s:ℂ)‖≤ ‖twistA 1 m/(m:ℂ)^((s-1:ℝ):ℂ)‖
    simp only [norm_div,norm_mul,Complex.norm_natCast_cpow_of_pos (Nat.pos_of_ne_zero h),Complex.ofReal_re,
      Real.rpow_sub hp,Real.rpow_one]
    rw [div_div_eq_mul_div]
    exact div_le_div_of_nonneg_right (mul_le_mul_of_nonneg_left (norm_idealCoeff d m) (norm_nonneg _)) (Real.rpow_nonneg hp.le _)

lemma local_hasSum {f : ℕ→ℂ} {s : ℝ} (hf : Summable (dir f s)) (p : Nat.Primes) :
    HasSum (fun k : ℕ => f (p.val^k)*((p.val:ℂ)^(-(s:ℂ)))^k) (localSum f s p) := by
  have h : Summable (fun k : ℕ => dir f s (p.val^k)) :=
    hf.comp_injective (Nat.pow_right_injective p.property.one_lt)
  apply h.hasSum.congr_fun
  intro k
  exact (weight_prime_power p s k _).symm

private lemma single_at_zero {f : ℕ→ℂ} (h0 : f 0=1) (h : ∀ k, k≠0 → f k=0) : HasSum f 1 :=
  h0 ▸ hasSum_single 0 h

lemma local_rankin (d : ℕ) (s : ℝ) (hs : 5/2<s) (p : Nat.Primes) :
    localSum (rankinA d) s p =
      (1-(p.val:ℂ)*(negWeight d p.val:ℂ)*((p.val:ℂ)^(-(s:ℂ)))^2) *
        localSum (twistA 1) s p * localSum (twistA (2*d)) s p := by
  let T := (p.val:ℂ)^(-(s:ℂ))
  let u : ℂ := negWeight d p.val
  let b (k : ℕ) := twistA 1 (p.val^k)
  have hf := local_hasSum (f:=twistA 1) (s:=s) (shell_expansion 1 s (by linarith)).summable p
  have hg := local_hasSum (f:=twistA (2*d)) (s:=s) (shell_expansion (2*d) s (by linarith)).summable p
  have hz := local_hasSum (summable_rankin d s hs) p
  have hg' : HasSum (fun k => b k*(u*T)^k) (localSum (twistA (2*d)) s p) := by
    apply hg.congr_fun
    intro k
    simp only [b,twistA,twist_by_negative,negWeight_pow,Int.cast_pow,mul_pow,u,T]
    ring
  have hr : HasSum (fun k => b k*(∑ j∈range (k+1),u^j)*T^k) (localSum (rankinA d) s p) := by
    apply hz.congr_fun
    intro k
    simp only [rankinA,idealCoeff_prime_pow d _ _ p.property,Int.cast_sum,Int.cast_pow,u,b,T]
  by_cases hp : p.val=2
  · have hu : u=0 := by simp [u,hp,negWeight]
    have hb : ∀ k, 0<k → b k=0 := by
      intro k hk
      change (twistSign 1 (p.val^k):ℂ)*_=0
      rw [twistSign_pow,hp,show twistSign 1 2=0 by decide,zero_pow hk.ne',Int.cast_zero,zero_mul]
    have hb0 : b 0=1 := by simp [b,twistA_one]
    have f1 : localSum (twistA 1) s p=1 := by
      apply hf.unique
      change HasSum (fun k => b k*T^k) 1
      apply single_at_zero (by simp [hb0])
      exact fun k hk => by rw [hb k (Nat.pos_of_ne_zero hk),zero_mul]
    have g1 : localSum (twistA (2*d)) s p=1 := by
      apply hg'.unique
      apply single_at_zero (by simp [hb0])
      exact fun k hk => by rw [hb k (Nat.pos_of_ne_zero hk),zero_mul]
    have r1 : localSum (rankinA d) s p=1 := by
      apply hr.unique
      apply single_at_zero (by simp [hb0])
      exact fun k hk => by rw [hb k (Nat.pos_of_ne_zero hk),zero_mul,zero_mul]
    change _=(1-(p.val:ℂ)*u*T^2)*_*_
    simp [r1,f1,g1,hu]
  · have hpg : ¬p.val∣2*1 := by simpa [Nat.prime_dvd_prime_iff_eq p.property Nat.prime_two] using hp
    have hb0 : b 0=1 := by simp [b,twistA_one]
    have hrec (k : ℕ) : b (k+2)=b 1*b (k+1)-(p.val:ℂ)*b k := by
      simpa only [b,twistA,pow_one] using gaussCoeff_rec 1 p hpg k
    exact hr.unique (rankin_local_hasSum hb0 rfl hrec u T hf hg')

end TunnellRankin
#print axioms TunnellRankin.local_rankin
