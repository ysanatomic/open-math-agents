import TunnellThreeSquares
import Mathlib.Data.Nat.ChineseRemainder

/-! One split prime realizes any prescribed signs at the odd ramified primes. -/
namespace TunnellGenusPrimes
open Finset
noncomputable section

def eps (b : Bool) : ℤ := if b then -1 else 1

lemma local_value {p : ℕ} (hp : p.Prime) (h2 : p≠2) (b : Bool) :
    ∃ a : ℕ, ¬p∣a ∧ jacobiSym (a:ℤ) p=eps b := by
  letI : Fact p.Prime := ⟨hp⟩
  cases b
  · exact ⟨1,hp.not_dvd_one,by simp [eps]⟩
  · obtain ⟨u,hu⟩ := quadraticChar_exists_neg_one' (F:=ZMod p) (by simpa only [ZMod.ringChar_zmod_n] using h2)
    refine ⟨u.val.val,fun H => u.ne_zero ((ZMod.natCast_zmod_val u.val).symm.trans ((ZMod.natCast_eq_zero_iff _ p).mpr H)),?_⟩
    rw [←jacobiSym.legendreSym.to_jacobiSym p]
    change quadraticChar (ZMod p) (((u.val.val:ℤ):ZMod p))= -1
    simpa only [Int.cast_natCast,ZMod.natCast_zmod_val] using hu

lemma prescribe {d : ℕ} (hd : d%4=1) (f : ↥d.primeFactors→Bool) :
    ∃ a : ℕ, a.Coprime d ∧ ∀ p : ↥d.primeFactors, jacobiSym (a:ℤ) p.val=eps (f p) := by
  classical
  have prime (p : ↥d.primeFactors) := Nat.prime_of_mem_primeFactors p.property
  have odd (p : ↥d.primeFactors) : p.val≠2 := by intro h; have k:=Nat.dvd_of_mem_primeFactors p.property; rw [h] at k; omega
  choose r hr hs using fun p : ↥d.primeFactors => local_value (prime p) (odd p) (f p)
  let s (p : ↥d.primeFactors) := p.val
  have hpair : Set.Pairwise (univ : Finset ↥d.primeFactors) (fun a b => Nat.Coprime (s a) (s b)) := by
    intro i _ j _ e; exact (Nat.coprime_primes (prime i) (prime j)).mpr (fun h => e (Subtype.ext h))
  let A := Nat.chineseRemainderOfFinset r s univ (fun p _ => (prime p).ne_zero) hpair
  have he (p : ↥d.primeFactors) : A.val ≡ r p [MOD p.val] := A.property p (mem_univ _)
  refine ⟨A.val,?_ ,?_⟩
  · apply Nat.coprime_of_dvd
    intro p hp ha hd'
    let i : ↥d.primeFactors := ⟨p,Nat.mem_primeFactors.mpr ⟨hp,hd',by omega⟩⟩
    apply hr i
    exact Nat.modEq_zero_iff_dvd.mp ((he i).symm.trans (Nat.modEq_zero_iff_dvd.mpr ha))
  · intro p
    rw [←hs p]
    exact jacobiSym.mod_left' (by exact_mod_cast he p)

lemma gcd_congr {a b c : ℕ} (h : a≡b [MOD c]) : a.gcd c=b.gcd c := by
  rw [Nat.gcd_comm a c,Nat.gcd_comm b c,Nat.gcd_rec c a,Nat.gcd_rec c b,h]

theorem split_prime {d : ℕ} (hd : d%4=1) (f : ↥d.primeFactors→Bool) :
    ∃ q u : ℕ, q.Prime ∧ 2*d<q ∧ u<q ∧ (q:ℤ)∣(u:ℤ)^2+2*d ∧
      ∀ p : ↥d.primeFactors, jacobiSym (q:ℤ) p.val=eps (f p) := by
  obtain ⟨r,hr,hs⟩ := prescribe hd f
  let a : ℕ := if jacobiSym (r:ℤ) d=1 then 1 else 5
  have h8 : a.Coprime 8 := by dsimp [a]; split <;> decide
  have hd8 : Nat.Coprime 8 d := (Nat.coprime_two_left.mpr (Nat.odd_iff.mpr (by omega))).pow_left 3
  obtain ⟨A,hA8,hAd⟩ := Nat.chineseRemainder hd8 a r
  have hc8 : A.Coprime 8 := (gcd_congr hA8).trans h8
  have hcd : A.Coprime d := (gcd_congr hAd).trans hr
  have hc := hc8.mul_right hcd
  obtain ⟨q,hqgt,hq,hmod⟩ := Nat.forall_exists_prime_gt_and_zmodEq (2*d) (q:=8*d) (a:=(A:ℤ)) (by omega) (by exact_mod_cast hc.isCoprime)
  letI : Fact q.Prime := ⟨hq⟩
  have hqd : q ≡ r [MOD d] := (show q ≡ A [MOD d] by exact_mod_cast hmod.of_dvd (show (d:ℤ) ∣ ((8*d:ℕ):ℤ) by exact_mod_cast dvd_mul_left d 8)).trans hAd
  have hq8 : q ≡ a [MOD 8] := (show q ≡ A [MOD 8] by exact_mod_cast hmod.of_dvd (show (8:ℤ) ∣ ((8*d:ℕ):ℤ) by exact_mod_cast dvd_mul_right 8 d)).trans hA8
  have hmod8 : q%8=a := by change q%8=a%8 at hq8; rw [hq8]; dsimp [a]; split <;> decide
  have ho : Odd q := Nat.odd_iff.mpr (by dsimp [a] at hmod8; split at hmod8 <;> omega)
  have hnn : ((-2*(d:ℤ)):ZMod q)≠0 := by
    have he : ((2*d:ℕ):ZMod q)≠0 := by
      intro he; exact (not_le_of_gt hqgt) (Nat.le_of_dvd (by omega) ((ZMod.natCast_eq_zero_iff _ q).mp he))
    push_cast at he ⊢; simpa using he
  have jval := jacobiSym.eq_one_or_neg_one (a:=(r:ℤ)) (b:=d) (by simpa using hr.gcd_eq_one)
  have hj : legendreSym q (-2*d)=1 := by
    rw [jacobiSym.legendreSym.to_jacobiSym,jacobiSym.mul_left,jacobiSym.at_neg_two ho,ZMod.χ₈'_nat_eq_if_mod_eight,
      hmod8,jacobiSym.quadratic_reciprocity_one_mod_four hd ho,jacobiSym.mod_left' (show (q:ℤ)%d=r%d by exact_mod_cast hqd)]
    rcases jval with h|h <;> simp [a,h,Nat.odd_iff.mp ho]
  obtain ⟨u,hu⟩ := (legendreSym.eq_one_iff q (a:=-2*(d:ℤ)) (by simpa using hnn)).mp hj
  refine ⟨q,u.val,hq,hqgt,ZMod.val_lt _,?_,?_⟩
  · apply (ZMod.intCast_zmod_eq_zero_iff_dvd _ q).mp
    push_cast; rw [ZMod.natCast_zmod_val]; push_cast at hu; linear_combination -hu
  · intro p; rw [←hs p]
    exact jacobiSym.mod_left' (by exact_mod_cast hqd.of_dvd (Nat.dvd_of_mem_primeFactors p.property))

end
end TunnellGenusPrimes
#print axioms TunnellGenusPrimes.split_prime
