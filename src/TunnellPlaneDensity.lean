import TunnellRamifiedPlane

/-! The product of local Weil trace densities equals the sum of line families over the squarefree modulus. -/
namespace TunnellLineDensity
open TunnellRamifiedPlane Finset
open scoped Classical
noncomputable section
variable {K : Type*} [Field K] [Fintype K] [DecidableEq K]
abbrev RootsAt (t : K) (x : K×K) := {r:K // r^2=t ∧ x.1=r*x.2}
def density (t : K) (x : K×K) := Nat.card (RootsAt t x)

lemma scale (t k : K) (hk : k≠0) (x : K×K) : density t (k*x.1,k*x.2)=density t x := by
  apply Nat.card_congr
  apply Equiv.subtypeEquivRight
  intro r; apply and_congr_right; intro _
  change k*x.1=r*(k*x.2) ↔ x.1=r*x.2
  rw [mul_left_comm,mul_right_inj' hk]

lemma roots_sum {p : ℕ} [Fact p.Prime] (hp : p≠2) {a t : ZMod p} (ha : a≠0) (ht : t≠0) (f : ZMod p×ZMod p→ℂ) :
    TunnellRamifiedPlane.trace a t f=∑ x, (density t x:ℂ)*f x := by
  classical
  by_cases h : IsSquare t
  · obtain ⟨r,hr⟩ := h
    have hrr : t=r^2 := by simpa [pow_two] using hr
    have hr0 : r≠0 := by intro hz; apply ht; rw [hrr,hz,zero_pow (by decide)]
    have h2 : (2:ZMod p)≠0 := fun e => hp ((Nat.prime_dvd_prime_iff_eq (Fact.out:p.Prime) Nat.prime_two).mp ((ZMod.natCast_eq_zero_iff 2 p).mp e))
    have he : r≠ -r := fun hh => hr0 ((mul_eq_zero.mp (show (2:ZMod p)*r=0 by rw [two_mul,add_eq_zero_iff_eq_neg]; exact hh)).resolve_left h2)
    rw [hrr,trace_split hp ha hr0,←filter_line,←filter_line,sum_filter,sum_filter,←sum_add_distrib]
    apply sum_congr rfl; intro x _
    have hh : density (r^2) x=(if x.1=r*x.2 then 1 else 0)+(if x.1= -r*x.2 then 1 else 0) := by
      let S : Finset (ZMod p) := {r,-r}
      have hset : univ.filter (fun v:ZMod p => v^2=r^2 ∧ x.1=v*x.2)=S.filter (fun v => x.1=v*x.2) := by
        ext v; simp [S,sq_eq_sq_iff_eq_or_eq_neg]
      have hc : density (r^2) x=(univ.filter (fun v:ZMod p => v^2=r^2 ∧ x.1=v*x.2)).card := by
        rw [density,Nat.card_eq_fintype_card]; exact Fintype.card_subtype _
      rw [hc,hset]; dsimp only [S]; rw [Finset.card_filter,Finset.sum_insert (by simpa using he),Finset.sum_singleton]
    rw [hh]; split_ifs <;> simp [two_mul]
  · rw [trace_anisotropic hp ha ht h]
    symm; apply sum_eq_zero; intro x _
    have hE : IsEmpty (RootsAt t x) := ⟨fun r => h ⟨r.val,by simpa only [pow_two] using r.property.1.symm⟩⟩
    letI := hE
    simp [density]


end
end TunnellLineDensity
#print axioms TunnellLineDensity.roots_sum
