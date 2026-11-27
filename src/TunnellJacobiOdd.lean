import TunnellQuaternionClasses

/-! The odd-prime recurrence for the number of representations by four squares. -/

namespace TunnellQuaternion

open Finset Quaternion
open scoped Classical

noncomputable section

lemma quat_left_cancel {q u v : QInt} (hq : normSq q≠0) (h : q*u=q*v) : u=v := by
  apply scalar_cancel (normSq q) hq
  have he := congrArg (star q * ·) h
  simpa only [←mul_assoc, star_mul_self,coe_mul_eq_smul] using he

lemma count_left_factors {α : Type*} [DecidableEq α] (D : Finset α) (q : α→QInt) {d : ℕ}
    (hd : d≠0) (hq : ∀ a ∈ D, normSq (q a)=d) (n : ℕ) :
    D.card*(quatShell n).card = ∑ w ∈ quatShell (d*n),
      (D.filter (fun a => ∃ u : QInt, w=q a*u)).card := by
  classical
  let S := D ×ˢ quatShell n
  let f (a : α × QInt) := q a.1 * a.2
  have h : (S:Set _).MapsTo f (quatShell (d*n)) := by
    rintro ⟨a,u⟩ h
    obtain ⟨ha,hu⟩ := mem_product.mp h
    exact mem_quatShell.mpr (by simp [f,hq a ha,mem_quatShell.mp hu])
  rw [←card_product,card_eq_sum_card_fiberwise h]
  apply sum_congr rfl
  intro w hw
  apply card_nbij Prod.fst
  · rintro ⟨a,u⟩ h
    obtain ⟨hu,hf⟩ := mem_filter.mp h
    exact mem_filter.mpr ⟨(mem_product.mp hu).1,u,hf.symm⟩
  · rintro ⟨a,u⟩ hu ⟨b,v⟩ hv he
    change a=b at he
    subst b
    obtain ⟨hau,hw'⟩ := mem_filter.mp hu
    have ha := (mem_product.mp hau).1
    exact Prod.ext rfl (quat_left_cancel (by rw [hq a ha]; exact_mod_cast hd) (hw'.trans (mem_filter.mp hv).2.symm))
  · intro a ha
    obtain ⟨ha',u,rfl⟩ := mem_filter.mp ha
    have hw' := mem_quatShell.mp hw
    rw [map_mul,hq a ha',Nat.cast_mul] at hw'
    have hu := mul_left_cancel₀ (by exact_mod_cast hd : (d:ℤ)≠0) hw'
    exact ⟨(a,u),mem_filter.mpr ⟨mem_product.mpr ⟨ha',mem_quatShell.mpr hu⟩,rfl⟩,rfl⟩

lemma quatShell_prime_card {p : ℕ} [Fact p.Prime] (hp : p≠2) : (quatShell p).card=8*(p+1) := by
  simpa using card_class_mem (localModel hp) hp univ

lemma odd_factors_card {p : ℕ} [Fact p.Prime] (hp : p≠2) (n : ℕ) (w : QInt)
    (hw : w∈quatShell (p*n)) :
    ((quatShell p).filter (fun q => ∃ u : QInt, w=q*u)).card =
      if red p w=0 then 8*(p+1) else 8 := by
  classical
  let M := localModel hp
  have hdet : (residue M w).det=0 := by
    rw [residue_det,mem_quatShell.mp hw]
    simp
  split_ifs with h
  · have hw0 := (residue_zero M w).mpr h
    have hall : ∀ q ∈ quatShell p, ∃ u : QInt, w=q*u := by
      intro q hq
      have hqn := mem_quatShell.mp hq
      apply divide_left M hqn ((class_eq_iff M hqn _).mp rfl)
      rw [hw0]
      cases classOf M q <;> simp [inLine]
    simpa [filter_eq_self.mpr hall] using quatShell_prime_card hp
  · obtain ⟨l,hl,hu⟩ := line_unique _ (fun he => h ((residue_zero M w).mp he)) hdet
    rw [←fiber_class_card M hp l]
    congr 1
    apply filter_congr
    intro q hq
    have hqn := mem_quatShell.mp hq
    constructor
    · rintro ⟨u,rfl⟩
      apply hu
      rw [map_mul]
      exact line_mul ((class_eq_iff M hqn _).mp rfl) _
    · intro hq'
      exact divide_left M hqn ((class_eq_iff M hqn l).mp hq') hl

lemma imprimitive_quat_card {p : ℕ} (hp : p≠0) (n : ℕ) :
    ((quatShell (p*n)).filter (fun w => red p w=0)).card =
      if p∣n then (quatShell (n/p)).card else 0 := by
  classical
  split_ifs with h
  · symm
    apply card_nbij (fun u => (p:ℤ) • u)
    · intro u hu
      apply mem_filter.mpr ⟨mem_quatShell.mpr ?_,by rw [red_smul]; simp⟩
      rw [norm_smul,mem_quatShell.mp hu,pow_two,mul_assoc,←Nat.cast_mul, Nat.mul_div_cancel' h]
      simp
    · intro u _ v _ huv
      exact scalar_cancel p (by exact_mod_cast hp) huv
    · intro w hw
      obtain ⟨hn,hred⟩ := mem_filter.mp hw
      obtain ⟨u,rfl⟩ := (div_iff p w).mp hred
      refine ⟨u, mem_quatShell.mpr ?_,rfl⟩
      have hh := mem_quatShell.mp hn
      rw [norm_smul,Nat.cast_mul,←Nat.mul_div_cancel' h] at hh
      simp only [Nat.cast_mul] at hh
      apply mul_left_cancel₀ (pow_ne_zero 2 (by exact_mod_cast hp : (p:ℤ)≠0))
      simpa [pow_two,mul_assoc] using hh
  · apply card_eq_zero.mpr
    apply eq_empty_iff_forall_notMem.mpr
    intro w hw
    obtain ⟨hn,hred⟩ := mem_filter.mp hw
    obtain ⟨u,rfl⟩ := (div_iff p w).mp hred
    have hh := mem_quatShell.mp hn
    rw [norm_smul,pow_two,mul_assoc,Nat.cast_mul] at hh
    have e := mul_left_cancel₀ (by exact_mod_cast hp : (p:ℤ)≠0) hh
    exact h (by exact_mod_cast (show (p:ℤ)∣(n:ℤ) from ⟨_, e.symm⟩))

theorem quatShell_odd_recurrence {p : ℕ} [Fact p.Prime] (hp : p≠2) (n : ℕ) :
    (p+1)*(quatShell n).card = (quatShell (p*n)).card +
      (if p∣n then p*(quatShell (n/p)).card else 0) := by
  classical
  have h := count_left_factors (quatShell p) id (Fact.out:p.Prime).ne_zero (fun q hq => mem_quatShell.mp hq) n
  change _ = ∑ w ∈ quatShell (p*n), ((quatShell p).filter (fun q => ∃ u : QInt, w=q*u)).card at h
  rw [sum_congr rfl (odd_factors_card hp n),quatShell_prime_card hp] at h
  have split (w : QInt) : (if red p w=0 then 8*(p+1) else 8) = 8 + (if red p w=0 then 8*p else 0) := by
    split_ifs <;> omega
  simp_rw [split] at h
  rw [sum_add_distrib,←sum_filter,sum_const,sum_const,imprimitive_quat_card (Fact.out:p.Prime).ne_zero] at h
  simp only [nsmul_eq_mul] at h
  split_ifs at h ⊢ <;> nlinarith

end
end TunnellQuaternion
