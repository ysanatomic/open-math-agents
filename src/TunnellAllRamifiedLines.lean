import TunnellRamifiedLines

/-! The distinct integral gluings exhaust the two choices at every ramified prime. -/
namespace TunnellAllRamifiedLines
open TunnellRamifiedLines
noncomputable section

variable {d : ℕ}
private instance prime (p : P d) : Fact p.val.Prime := ⟨Nat.prime_of_mem_primeFactors p.property⟩

def signed (r : (p : P d) → ZMod p.val) (e : P d → Bool) (p : P d) := if e p then -(r p) else r p

theorem exhaustive (hs : Squarefree d) (hd : Odd d) (t : (p : P d) → ZMod p.val) (ht : ∀ p, t p≠0)
    (S : ↥d.divisors → AddSubgroup (Packet d)) (hi : Function.Injective S)
    (hQ : ∀ a x, x∈S a → ∀ p : P d, (x p).1^2=t p*(x p).2^2)
    (hS : ∀ a (p : P d), ∃ x∈S a, x p≠0) :
    ∃ r : (p : P d) → ZMod p.val, (∀ p, r p^2=t p) ∧
      ∃ E : ↥d.divisors ≃ (P d → Bool), ∀ a, S a=linePacket (signed r (E a)) := by
  classical
  choose f hf he using fun a => classification hd (S a) t (hQ a) (hS a)
  let one : ↥d.divisors := ⟨1,Nat.mem_divisors.mpr ⟨one_dvd _,hs.ne_zero⟩⟩
  let r := f one
  let g (a : ↥d.divisors) (p : P d) := decide (f a p≠r p)
  have hg (a : ↥d.divisors) : f a=signed r (g a) := by
    funext p
    have h : (f a p)^2=(r p)^2 := (hf a p).trans (hf one p).symm
    have e := sq_eq_sq_iff_eq_or_eq_neg.mp h
    rcases e with e|e
    · simp [signed,g,e]
    · by_cases h' : f a p=r p
      · simp [signed,g,h']
      · simp [signed,g,h',e]
  have H (a : ↥d.divisors) : S a=linePacket (signed r (g a)) := (he a).trans (congrArg linePacket (hg a))
  have hI : Function.Injective g := by intro a b e; apply hi; rw [H a,H b,e]
  have hc : Fintype.card ↥d.divisors=Fintype.card (P d→Bool) := by
    rw [Fintype.card_coe,TunnellPrincipalGenus.divisor_card hs,Fintype.card_fun,Fintype.card_bool,Fintype.card_coe]
  have hB := (Fintype.bijective_iff_injective_and_card g).mpr ⟨hI,hc⟩
  exact ⟨r,hf one,Equiv.ofBijective g hB,H⟩

theorem sum_all {M : Type*} [AddCommMonoid M] (hs : Squarefree d) (hd : Odd d) (t : (p : P d) → ZMod p.val)
    (ht : ∀ p, t p≠0) (S : ↥d.divisors → AddSubgroup (Packet d)) (hi : Function.Injective S)
    (hQ : ∀ a x, x∈S a → ∀ p : P d, (x p).1^2=t p*(x p).2^2)
    (hS : ∀ a (p : P d), ∃ x∈S a, x p≠0) (f : AddSubgroup (Packet d) → M) :
    ∃ r : (p : P d) → ZMod p.val, (∀ p, r p^2=t p) ∧
      ∑ a, f (S a)=∑ e, f (linePacket (signed r e)) := by
  obtain ⟨r,hr,E,he⟩ := exhaustive hs hd t ht S hi hQ hS
  exact ⟨r,hr,by simp_rw [he]; exact E.sum_comp (fun e => f (linePacket (signed r e)))⟩

end
end TunnellAllRamifiedLines
#print axioms TunnellAllRamifiedLines.sum_all

