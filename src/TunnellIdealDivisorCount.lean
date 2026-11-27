import TunnellIdealHNF

/-! The Dirichlet coefficients enumerating integral quadratic ideals by norm. -/
namespace TunnellIdealHNF
open Finset
def roots (n a : ℕ) : Finset ℕ := (range a).filter (fun b => (a:ℤ)∣(b:ℤ)^2+n)
noncomputable def divisors (m : ℕ) : Finset ℕ := m.divisors.filter (fun a => IsSquare (m/a))
abbrev indexed (n m : ℕ) := {s : Data n // s.c^2*s.a=m}
abbrev finiteRoot (n m : ℕ) := ↥((divisors m).sigma (roots n))

lemma quotient_by_a {n m : ℕ} (s : indexed n m) : m/s.val.a=s.val.c^2 := by
  exact (congrArg (·/s.val.a) s.property.symm).trans (Nat.mul_div_cancel _ s.val.pos_a)

noncomputable def divisorEquiv {n m : ℕ} (hm : 0 < m) : indexed n m ≃ finiteRoot n m := by
  classical
  let f : indexed n m → finiteRoot n m := fun s => ⟨⟨s.val.a,s.val.b⟩,mem_sigma.mpr ⟨mem_filter.mpr
    ⟨Nat.mem_divisors.mpr ⟨⟨s.val.c^2,s.property.symm.trans (mul_comm _ _)⟩,hm.ne'⟩,
      ⟨s.val.c,by rw [quotient_by_a s,pow_two]⟩⟩,mem_filter.mpr ⟨mem_range.mpr s.val.lt_b,s.val.divides⟩⟩⟩
  refine Equiv.ofBijective f ⟨?_,?_⟩
  · intro s t h
    have ha : s.val.a=t.val.a := congrArg (fun x : finiteRoot n m => x.val.fst) h
    have hb : s.val.b=t.val.b := congrArg (fun x : finiteRoot n m => x.val.snd) h
    have hc : s.val.c^2=t.val.c^2 := by rw [←quotient_by_a s,←quotient_by_a t,ha]
    have hc' : s.val.c=t.val.c := by nlinarith
    apply Subtype.ext
    cases s with | mk S _ =>
      cases t with | mk T _ =>
        cases S; cases T; dsimp only at ha hb hc'; congr
  · rintro ⟨⟨a,b⟩,h⟩
    obtain ⟨ha,hb⟩ := mem_sigma.mp h
    obtain ⟨hdiv,c,hc⟩ := mem_filter.mp ha
    have ha0 : 0<a := Nat.pos_of_mem_divisors hdiv
    have hd : a∣m := Nat.dvd_of_mem_divisors hdiv
    have he : c^2*a=m := by rw [pow_two,←hc,Nat.div_mul_cancel hd]
    have hc0 : 0<c := by by_contra! h; have := Nat.eq_zero_of_le_zero h; simp [this] at he; omega
    obtain ⟨hb',hbn⟩ := mem_filter.mp hb
    exact ⟨⟨⟨c,a,b,hc0,ha0,mem_range.mp hb',hbn⟩,he⟩,rfl⟩

abbrev NormIdeals (n m : ℕ) := {I : Ideal (R n) // I≠⊥ ∧ Nat.card (R n ⧸ I)=m}

noncomputable def indexedEquiv {n m : ℕ} (hn : 0<n) : indexed n m ≃ NormIdeals n m := by
  let f : indexed n m → NormIdeals n m := fun s => ⟨ideal s.val,ideal_ne_bot _,(quotient_card _).trans s.property⟩
  refine Equiv.ofBijective f ⟨fun _ _ h => Subtype.ext (ideal_injective (congrArg Subtype.val h)),?_⟩
  rintro ⟨I,hI,hm⟩
  obtain ⟨s,rfl⟩ := normal_form hn hI
  exact ⟨⟨s,(quotient_card _).symm.trans hm⟩,rfl⟩

theorem ideal_count {n m : ℕ} (hn : 0<n) (hm : 0 < m) :
    Nat.card (NormIdeals n m)=∑ a∈divisors m,(roots n a).card := by
  classical
  have e : NormIdeals n m ≃ finiteRoot n m := (indexedEquiv hn).symm.trans (divisorEquiv hm)
  rw [Nat.card_congr e,Nat.card_eq_fintype_card,Fintype.card_coe,card_sigma]

/-- Reduction modulo a identifies the integral HNF roots with field-theoretic square roots. -/
theorem roots_zmod (n a : ℕ) (ha : 0<a) : letI : NeZero a := ⟨ha.ne'⟩
    (roots n a).card=((univ : Finset (ZMod a)).filter (fun x => x^2= -(n:ZMod a))).card := by
  letI : NeZero a := ⟨ha.ne'⟩
  apply card_nbij' (fun b:ℕ => (b:ZMod a)) (fun x:ZMod a => x.val)
  · intro b hb; obtain ⟨_,h⟩ := mem_filter.mp hb
    apply mem_filter.mpr; refine ⟨mem_univ _,?_⟩
    have e := (ZMod.intCast_zmod_eq_zero_iff_dvd _ a).mpr h
    push_cast at e; exact eq_neg_of_add_eq_zero_left e
  · intro z hz; refine mem_filter.mpr ⟨mem_range.mpr (ZMod.val_lt z),?_⟩
    apply (ZMod.intCast_zmod_eq_zero_iff_dvd _ a).mp
    push_cast; rw [ZMod.natCast_zmod_val,(mem_filter.mp hz).2,neg_add_cancel]
  · intro b hb; change (b:ZMod a).val=b; rw [ZMod.val_natCast,Nat.mod_eq_of_lt (mem_range.mp (mem_filter.mp hb).1)]
  · intro x _; exact ZMod.natCast_zmod_val _

#print axioms ideal_count
#print axioms roots_zmod
end TunnellIdealHNF
