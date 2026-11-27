import TunnellOddDiscriminant
import TunnellPrincipalGenus

/-! Isotropic subgroups in the product of the ramified discriminant planes factor into lines. -/
namespace TunnellRamifiedLines
open Finset
noncomputable section

variable {F : Type*} [Field F]
lemma unique_slope (h2 : (2:F)≠0) {t : F} {x : F×F} (hx : x≠0) (hQ : x.1^2=t*x.2^2) :
    let r := x.1/x.2
    r^2=t ∧ ∀ y : F×F, y.1^2=t*y.2^2 → (x.1+y.1)^2=t*(x.2+y.2)^2 → y.1=r*y.2 := by
  have h : x.2≠0 := by
    intro hz; rw [hz,zero_pow (by decide),mul_zero] at hQ
    exact hx (Prod.ext (sq_eq_zero_iff.mp hQ) hz)
  constructor
  · rw [div_pow,hQ,mul_div_cancel_right₀ _ (pow_ne_zero _ h)]
  · intro y hy hxy
    have e : (2:F)*(x.1*y.1-t*x.2*y.2)=0 := by linear_combination hxy - hQ - hy
    have ez := (mul_eq_zero.mp e).resolve_left h2
    field_simp
    apply sub_eq_zero.mp
    apply sq_eq_zero_iff.mp
    linear_combination x.2^2*hy + y.2^2*hQ - (2*x.2*y.2)*ez

variable {d : ℕ}
abbrev P (d : ℕ) := ↥d.primeFactors
abbrev Packet (d : ℕ) := (p : P d) → ZMod p.val × ZMod p.val
private instance prime (p : P d) : Fact p.val.Prime := ⟨Nat.prime_of_mem_primeFactors p.property⟩

lemma selector (r : (p : P d) → ZMod p.val) : ∃ a : ℕ, ∀ p : P d, (a:ZMod p.val)=r p := by
  classical
  have hpair : Set.Pairwise (univ : Finset (P d)) (fun a b : P d => Nat.Coprime a.val b.val) := by
    intro i _ j _ e; exact (Nat.coprime_primes (prime i).out (prime j).out).mpr (fun h => e (Subtype.ext h))
  let A := Nat.chineseRemainderOfFinset (fun p : P d => (r p).val) Subtype.val univ (fun p _ => (prime p).out.ne_zero) hpair
  refine ⟨A.val,fun p => ?_⟩
  have e := A.property p (mem_univ p)
  exact (ZMod.natCast_eq_natCast_iff _ _ _).mpr e |>.trans (ZMod.natCast_zmod_val _)

lemma independent (S : AddSubgroup (Packet d)) (x : Packet d)
    (hx : ∀ p : P d, ∃ y∈S, y p=x p) : x∈S := by
  classical
  choose y hy e using hx
  have he (p : P d) : ∃ a : ℕ, ∀ q : P d, (a:ZMod q.val)=if q=p then 1 else 0 :=
    selector (fun q => if q=p then 1 else 0)
  choose a ha using he
  have h : (∑ p, a p • y p)=x := by
    funext q; rw [Finset.sum_apply]; simp only [Pi.smul_apply]
    rw [Finset.sum_eq_single q]
    · apply Prod.ext <;> simp [nsmul_eq_mul,ha,e]
    · intro b _ hb; apply Prod.ext <;> simp [nsmul_eq_mul,ha,Ne.symm hb]
    · simp
  exact h ▸ S.sum_mem (fun p _ => S.nsmul_mem (hy p) _)

def linePacket (r : (p : P d) → ZMod p.val) : AddSubgroup (Packet d) where
  carrier := {x | ∀ p, (x p).1=r p*(x p).2}
  zero_mem' := by simp
  add_mem' := by intro x y hx hy p; change (x p).1+(y p).1=r p*((x p).2+(y p).2); rw [hx p,hy p,mul_add]
  neg_mem' := by intro x hx p; change -(x p).1=r p*(-(x p).2); rw [hx p,mul_neg]

theorem classification (hd : Odd d) (S : AddSubgroup (Packet d)) (t : (p : P d) → ZMod p.val)
    (hQ : ∀ x∈S, ∀ p : P d, (x p).1^2=t p*(x p).2^2)
    (hS : ∀ p : P d, ∃ x∈S, x p≠0) :
    ∃ r : (p : P d) → ZMod p.val, (∀ p, r p^2=t p) ∧ S=linePacket r := by
  classical
  choose u hu h0 using hS
  let r (p : P d) := (u p p).1/(u p p).2
  have h2 (p : P d) : (2:ZMod p.val)≠0 := by
    intro hh; have e := (Nat.prime_dvd_prime_iff_eq (prime p).out Nat.prime_two).mp ((ZMod.natCast_eq_zero_iff 2 p.val).mp hh)
    have hv := Nat.dvd_of_mem_primeFactors p.property; rw [e] at hv; exact (Nat.not_even_iff_odd.mpr hd) (even_iff_two_dvd.mpr hv)
  have hsl (p : P d) := unique_slope (h2 p) (h0 p) (hQ _ (hu p) p)
  have he (x : Packet d) (hx : x∈S) (p : P d) : (x p).1=r p*(x p).2 :=
    (hsl p).2 _ (hQ x hx p) (hQ (u p+x) (S.add_mem (hu p) hx) p)
  refine ⟨r,fun p => (hsl p).1,le_antisymm (fun x hx p => he x hx p) ?_⟩
  intro x hx; apply independent S x; intro p
  have h₂ : (u p p).2≠0 := by intro ez; apply h0 p; exact Prod.ext (by rw [he _ (hu p) p,ez,mul_zero]; rfl) ez
  let m := ((x p).2/(u p p).2).val
  refine ⟨m • u p,S.nsmul_mem (hu p) m,?_⟩
  have em : (m:ZMod p.val)=(x p).2/(u p p).2 := ZMod.natCast_zmod_val _
  apply Prod.ext
  · change m • (u p p).1=(x p).1; rw [nsmul_eq_mul,em,he _ (hu p) p,hx p]; field_simp
  · change m • (u p p).2=(x p).2; rw [nsmul_eq_mul,em,div_mul_cancel₀ _ h₂]

end
end TunnellRamifiedLines
#print axioms TunnellRamifiedLines.classification

