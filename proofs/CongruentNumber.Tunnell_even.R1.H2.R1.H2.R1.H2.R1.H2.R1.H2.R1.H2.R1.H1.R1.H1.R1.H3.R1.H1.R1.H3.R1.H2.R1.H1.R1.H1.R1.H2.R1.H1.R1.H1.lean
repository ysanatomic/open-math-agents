import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H3_R1_H1_R1_H3_R1_H2_R1_H1_R1_H1_R1_H2_R1_H1_R1
import Mathlib

/-! Removing finitely many prime factors preserves a positive linear counting asymptotic. -/
namespace TunnellPrimeMultisets
open Filter Topology
noncomputable section
open scoped Classical

variable {P : Type*}

def weight (w : P → ℕ) (m : Multiset P) : ℕ := (m.map w).prod
@[simp] theorem weight_cons (w : P → ℕ) (p : P) (m : Multiset P) :
    weight w (p ::ₘ m) = w p * weight w m := by simp [weight]
@[simp] theorem weight_add (w : P → ℕ) (m n : Multiset P) :
    weight w (m+n) = weight w m * weight w n := by simp [weight]

abbrev Good (s : Finset P) := {m : Multiset P // ∀ p ∈ s, p ∉ m}
abbrev Cut (w : P → ℕ) (s : Finset P) (x : ℝ) := {m : Good s // (weight w m.val : ℝ) ≤ x}
def count (w : P → ℕ) (s : Finset P) (x : ℝ) := (Nat.card (Cut w s x) : ℝ)

theorem cut_finite (w : P → ℕ) (hf : ∀ x, Finite (Cut w ∅ x)) (s : Finset P) (x : ℝ) :
    Finite (Cut w s x) := by
  haveI := hf x
  apply Finite.of_injective (β:=Cut w ∅ x) (fun m : Cut w s x => (⟨⟨m.val.val,by simp⟩,m.property⟩ : Cut w ∅ x))
  intro a b h
  exact Subtype.ext (Subtype.ext (congrArg (fun t : Cut w ∅ x => t.val.val) h))

def split (w : P → ℕ) (s : Finset P) (p : P) (hp : p ∉ s) (hw : 0 < w p) (x : ℝ) :
    Cut w s x ≃ Cut w (insert p s) x ⊕ Cut w s (x / w p) := by
  classical
  have hpos : (0:ℝ) < w p := by exact_mod_cast hw
  let keep (m : Cut w s x) (h : p ∉ m.val.val) : Cut w (insert p s) x :=
    ⟨⟨m.val.val, fun q hq => (Finset.mem_insert.mp hq).elim (fun e => e ▸ h) (m.val.property q)⟩,m.property⟩
  let erase (m : Cut w s x) (h : p ∈ m.val.val) : Cut w s (x / w p) :=
    ⟨⟨m.val.val.erase p,fun q hq hmem => m.val.property q hq (Multiset.mem_of_mem_erase hmem)⟩,by
      apply (le_div_iff₀ hpos).mpr
      have e := congrArg (weight w) (Multiset.cons_erase h)
      rw [weight_cons] at e
      simpa only [mul_comm, ← Nat.cast_mul, e] using m.property⟩
  let left (m : Cut w (insert p s) x) : Cut w s x :=
    ⟨⟨m.val.val,fun q hq => m.val.property q (Finset.mem_insert_of_mem hq)⟩,m.property⟩
  let right (m : Cut w s (x / w p)) : Cut w s x :=
    ⟨⟨p ::ₘ m.val.val,fun q hq hmem => (Multiset.mem_cons.mp hmem).elim
      (fun e => hp (e ▸ hq)) (m.val.property q hq)⟩,by
      rw [weight_cons,Nat.cast_mul,mul_comm]
      exact (le_div_iff₀ hpos).mp m.property⟩
  let go (m : Cut w s x) : Cut w (insert p s) x ⊕ Cut w s (x / w p) :=
    if h : p ∈ m.val.val then .inr (erase m h) else .inl (keep m h)
  have go_yes (m : Cut w s x) (h : p ∈ m.val.val) : go m = Sum.inr (erase m h) := dif_pos h
  have go_no (m : Cut w s x) (h : p ∉ m.val.val) : go m = Sum.inl (keep m h) := dif_neg h
  refine ⟨go,Sum.elim left right,?_,?_⟩
  · intro m
    by_cases h : p ∈ m.val.val
    · rw [go_yes m h,Sum.elim_inr]
      exact Subtype.ext (Subtype.ext (Multiset.cons_erase h))
    · exact congrArg (Sum.elim left right) (go_no m h)
  · rintro (m|m)
    · have h := m.val.property p (Finset.mem_insert_self _ _)
      exact go_no (left m) h
    · exact (go_yes (right m) (Multiset.mem_cons_self _ _)).trans (congrArg Sum.inr
        (Subtype.ext (Subtype.ext (Multiset.erase_cons_head _ _))))

theorem density (w : P → ℕ) (hw : ∀ p, 1 < w p) (hf : ∀ x, Finite (Cut w ∅ x))
    {c : ℝ} (hc : 0 < c) (h : Tendsto (fun x => count w ∅ x / x) atTop (𝓝 c)) (s : Finset P) :
    ∃ k > 0, Tendsto (fun x => count w s x / x) atTop (𝓝 k) := by
  classical
  induction s using Finset.induction_on with
  | empty => exact ⟨c,hc,h⟩
  | @insert p s hp ih =>
    obtain ⟨k,hk,ht⟩ := ih
    have hp1 : (1:ℝ) < w p := by exact_mod_cast hw p
    have hp0 : (0:ℝ) < w p := by linarith
    have hlim := (ht.comp (tendsto_id.atTop_div_const hp0)).div_const (w p : ℝ)
    have ht' : Tendsto (fun x : ℝ => count w s (x / w p) / x) atTop (𝓝 (k / w p)) := by
      apply hlim.congr
      intro x
      dsimp
      field_simp
    refine ⟨k-k/w p, sub_pos.mpr ((div_lt_iff₀ hp0).mpr <| by nlinarith), ?_⟩
    apply (ht.sub ht').congr
    intro x
    haveI := cut_finite w hf (insert p s) x
    haveI := cut_finite w hf s (x/w p)
    have he := Nat.card_congr (split w s p hp (Nat.zero_lt_of_lt (hw p)) x)
    rw [Nat.card_sum] at he
    have he' : count w s x = count w (insert p s) x + count w s (x/w p) := by
      unfold count
      exact_mod_cast he
    rw [← sub_div,he',add_sub_cancel_right]

end
end TunnellPrimeMultisets
/-! A positive linear counting asymptotic rules out a weight-multiplicative injection of pairs. -/
namespace TunnellIdealCountingBound
open Filter Topology
open scoped Classical
noncomputable section
variable {A B : Type*}

abbrev Cut (w : A → ℕ) (x : ℝ) := {a : A // (w a : ℝ) ≤ x}
def count (w : A → ℕ) (x : ℝ) := (Nat.card (Cut w x) : ℝ)

theorem weight_not_summable (w : A → ℕ) (hp : ∀ a, 0 < w a) (hf : ∀ x, Finite (Cut w x))
    {c : ℝ} (hc : 0 < c) (h : Tendsto (fun x => count w x / x) atTop (𝓝 c)) :
    ¬ Summable (fun a => (w a : ℝ)⁻¹) := by
  classical
  intro hs
  let f (x : ℝ) (a : A) := if (w a : ℝ) ≤ x then x⁻¹ else 0
  have hlim : ∀ a, Tendsto (fun x => f x a) atTop (𝓝 0) := by
    intro a
    apply tendsto_inv_atTop_zero.congr'
    filter_upwards [eventually_ge_atTop (w a:ℝ)] with x hx
    simp [f,hx]
  have hb : ∀ᶠ x : ℝ in atTop, ∀ a, ‖f x a‖ ≤ (w a : ℝ)⁻¹ := by
    filter_upwards [eventually_gt_atTop (0 : ℝ)] with x hx a
    by_cases ha : (w a : ℝ) ≤ x
    · simp only [f,ha,if_true,Real.norm_eq_abs,abs_inv,abs_of_pos hx]
      exact inv_anti₀ (by exact_mod_cast hp a) ha
    · simp [f,ha]
  have hz := tendsto_tsum_of_dominated_convergence hs hlim hb
  have he (x : ℝ) : ∑' a, f x a = count w x / x := by
    haveI := hf x
    letI : Fintype (Cut w x) := Fintype.ofFinite _
    rw [show (f x) = ({a : A | (w a : ℝ) ≤ x} : Set A).indicator (fun _ => x⁻¹) from rfl,
      ← tsum_subtype]
    change (∑' _ : Cut w x, x⁻¹) = _
    rw [tsum_fintype]
    simp [count,Nat.card_eq_fintype_card,div_eq_mul_inv]
  simp only [tsum_zero] at hz
  exact hc.ne' (tendsto_nhds_unique h (hz.congr he))

theorem impossible (w : A → ℕ) (W : B → ℕ) (hp : ∀ a, 0 < w a)
    (hf : ∀ x, Finite (Cut w x)) (hF : ∀ x, Finite (Cut W x)) {c C : ℝ} (hc : 0 < c)
    (h : Tendsto (fun x => count w x / x) atTop (𝓝 c))
    (H : Tendsto (fun x => count W x / x) atTop (𝓝 C))
    (e : A × A ↪ B) (he : ∀ a b, W (e (a,b)) = w a * w b) : False := by
  classical
  apply weight_not_summable w hp hf hc h
  apply summable_of_sum_le (c:=C/c) (fun a => by positivity)
  intro t
  have hpos (a : A) : (0:ℝ) < w a := by exact_mod_cast hp a
  have hcount (x : ℝ) : ∑ a ∈ t, count w (x / w a) ≤ count W x := by
    haveI := hF x
    letI (a : t) : Finite (Cut w (x / w a.val)) := hf _
    let g (v : Σ a : t, Cut w (x / w a.val)) : Cut W x :=
      ⟨e (v.2.val,v.1.val), by rw [he,Nat.cast_mul]; exact (le_div_iff₀ (hpos _)).mp v.2.property⟩
    have hg : Function.Injective g := by
      rintro ⟨a,b⟩ ⟨a',b'⟩ heq
      have hpair := e.injective (congrArg Subtype.val heq)
      have haa : a = a' := Subtype.ext (congrArg Prod.snd hpair)
      subst a'
      have hbb : b = b' := Subtype.ext (congrArg Prod.fst hpair)
      subst b'
      rfl
    have hn := Nat.card_le_card_of_injective g hg
    rw [Nat.card_sigma] at hn
    rw [← Finset.sum_coe_sort t (fun a => count w (x / w a))]
    unfold count
    exact_mod_cast hn
  have tend (a : A) : Tendsto (fun x : ℝ => count w (x/w a)/x) atTop (𝓝 (c/(w a))) := by
    apply (((h.comp (tendsto_id.atTop_div_const (hpos a))).div_const (w a : ℝ))).congr
    intro x
    dsimp
    field_simp [(hpos a).ne']
  have bound : ∑ a ∈ t, c / (w a:ℝ) ≤ C := by
    apply le_of_tendsto_of_tendsto (tendsto_finsetSum t (fun a _ => tend a)) H
    filter_upwards [eventually_ge_atTop (0:ℝ)] with x hx
    rw [← Finset.sum_div]
    exact div_le_div_of_nonneg_right (hcount x) hx
  apply (le_div_iff₀ hc).mpr
  rw [Finset.sum_mul]
  calc
    _ = ∑ a ∈ t, c / (w a : ℝ) := by
      apply Finset.sum_congr rfl
      intro a _
      rw [div_eq_mul_inv,mul_comm]
    _ ≤ _ := bound

end
end TunnellIdealCountingBound
/-! Integral ideals are multisets of prime ideals, with weight their absolute norm. -/
namespace TunnellIdealPrimeWords
open NumberField IsDedekindDomain UniqueFactorizationMonoid TunnellPrimeMultisets Filter Topology
open scoped NumberField nonZeroDivisors Classical
noncomputable section

variable (K : Type) [Field K] [NumberField K]
abbrev P := HeightOneSpectrum (𝓞 K)
abbrev U := (Ideal (𝓞 K))⁰
def wt (p : P K) := Ideal.absNorm p.asIdeal

def ideal (m : Multiset (P K)) : U K := ⟨(m.map HeightOneSpectrum.asIdeal).prod,by
  rw [mem_nonZeroDivisors_iff_ne_zero]
  apply Multiset.prod_ne_zero
  intro h
  obtain ⟨p,_,he⟩ := Multiset.mem_map.mp h
  exact p.ne_bot he⟩

def factors (b : U K) : Multiset (P K) :=
  (normalizedFactors b.val).attach.map (fun p => HeightOneSpectrum.ofPrime (prime_of_normalized_factor p.val p.property))

theorem factors_map (b : U K) :
    (factors K b).map HeightOneSpectrum.asIdeal = normalizedFactors b.val := by
  rw [factors,Multiset.map_map]
  exact Multiset.attach_map_val _

theorem ideal_factors (b : U K) : ideal K (factors K b) = b := by
  apply Subtype.ext
  change ((factors K b).map _).prod = _
  rw [factors_map, Ideal.prod_normalizedFactors_eq_self (nonZeroDivisors.ne_zero b.property)]

theorem factors_ideal (m : Multiset (P K)) : factors K (ideal K m) = m := by
  apply Multiset.map_injective HeightOneSpectrum.asIdeal_injective
  rw [factors_map]
  apply normalizedFactors_prod_of_prime
  rintro q h
  obtain ⟨p,_,rfl⟩ := Multiset.mem_map.mp h
  exact p.prime

theorem norm_ideal (m : Multiset (P K)) : Ideal.absNorm (ideal K m).val = weight (wt K) m := by
  change Ideal.absNorm (m.map HeightOneSpectrum.asIdeal).prod = weight (wt K) m
  induction m using Multiset.induction_on with
  | empty => simp [weight]
  | cons a m ih => simp [ih,wt]

def bounded (x : ℝ) : Cut (wt K) ∅ x ≃ {b : U K // (Ideal.absNorm b.val : ℝ) ≤ x} where
  toFun m := ⟨ideal K m.val.val, by rw [norm_ideal]; exact m.property⟩
  invFun b := ⟨⟨factors K b.val,by simp⟩,by rw [← norm_ideal,ideal_factors]; exact b.property⟩
  left_inv m := Subtype.ext (Subtype.ext (factors_ideal K _))
  right_inv b := Subtype.ext (ideal_factors K _)

theorem finite (x : ℝ) : Finite (Cut (wt K) ∅ x) := by
  haveI : Finite {b : U K // Ideal.absNorm b.val ≤ ⌈x⌉₊} := Ideal.finite_setOfPred_absNorm_le₀ _
  let f (a : Cut (wt K) ∅ x) : {b : U K // Ideal.absNorm b.val ≤ ⌈x⌉₊} :=
    ⟨(bounded K x a).val, by exact_mod_cast (bounded K x a).property.trans (Nat.le_ceil x)⟩
  exact Finite.of_injective f fun a b h =>
    (bounded K x).injective (Subtype.ext (congrArg (fun a : {b : U K // Ideal.absNorm b.val ≤ ⌈x⌉₊} => a.val) h))

theorem wt_gt_one (p : P K) : 1 < wt K p := by
  have hpos := Ideal.absNorm_pos_of_nonZeroDivisors (⟨p.asIdeal,mem_nonZeroDivisors_iff_ne_zero.mpr p.ne_bot⟩ : U K)
  have hne : Ideal.absNorm p.asIdeal ≠ 1 := fun h => p.isPrime.ne_top (Ideal.absNorm_eq_one_iff.mp h)
  change 1 < Ideal.absNorm p.asIdeal
  change 0 < Ideal.absNorm p.asIdeal at hpos
  omega

theorem density_good (s : Finset (P K)) :
    ∃ k > 0, Tendsto (fun x => count (wt K) s x / x) atTop (𝓝 k) := by
  apply density (wt K) (wt_gt_one K) (finite K) (dedekindZeta_residue_pos K) _ s
  apply (NumberField.Ideal.tendsto_norm_le_div_atTop₀ K).congr
  intro x
  unfold count
  rw [Nat.card_congr (bounded K x)]

end
end TunnellIdealPrimeWords
/-! Two disjoint selections of norm-preserving lifts of primes contradict linear ideal counts. -/
namespace TunnellSplitPrimePairs
open TunnellPrimeMultisets TunnellIdealPrimeWords NumberField IsDedekindDomain
open Filter Topology
open scoped Classical NumberField
noncomputable section
variable {P Q : Type*}
abbrev Allowed (s : Finset P) := {p : P // p ∉ s}

def tag {s : Finset P} (m : Good s) : Multiset (Allowed s) :=
  m.val.attach.map fun a => ⟨a.val,fun ha => m.property a.val ha a.property⟩

theorem untag {s : Finset P} (m : Good s) : (tag m).map Subtype.val = m.val := by
  rw [tag,Multiset.map_map]
  exact Multiset.attach_map_val _

theorem tag_injective {s : Finset P} : Function.Injective (tag (s:=s)) := by
  intro a b h
  exact Subtype.ext <| (untag a).symm.trans ((congrArg (Multiset.map Subtype.val) h).trans (untag b))

private theorem strip_left {A B : Type*} (a : Multiset A) (b : Multiset B) :
    (a.disjSum b).filterMap Sum.getLeft? = a := by
  simp only [Multiset.disjSum,Multiset.filterMap_add,Multiset.filterMap_map]
  change a.filterMap some + b.filterMap (fun _ => none) = a
  simp
  induction b using Multiset.induction_on with
  | empty => rfl
  | cons _ _ ih => simpa using ih

private theorem strip_right {A B : Type*} (a : Multiset A) (b : Multiset B) :
    (a.disjSum b).filterMap Sum.getRight? = b := by
  simp only [Multiset.disjSum,Multiset.filterMap_add,Multiset.filterMap_map]
  change a.filterMap (fun _ => none) + b.filterMap some = b
  simp
  induction a using Multiset.induction_on with
  | empty => rfl
  | cons _ _ ih => simpa using ih

def pair {s : Finset P} (l : Allowed s ⊕ Allowed s ↪ Q) : Good s × Good s ↪ Multiset Q where
  toFun a := ((tag a.1).disjSum (tag a.2)).map l
  inj' := by
    rintro ⟨a,b⟩ ⟨a',b'⟩ he
    have h := Multiset.map_injective l.injective he
    apply Prod.ext
    · apply tag_injective
      simpa only [strip_left] using congrArg (Multiset.filterMap Sum.getLeft?) h
    · apply tag_injective
      simpa only [strip_right] using congrArg (Multiset.filterMap Sum.getRight?) h

theorem weight_pair {s : Finset P} (w : P → ℕ) (W : Q → ℕ) (l : Allowed s ⊕ Allowed s ↪ Q)
    (hl : ∀ p, W (l (.inl p)) = w p.val) (hr : ∀ p, W (l (.inr p)) = w p.val) (a b : Good s) :
    weight W (pair l (a,b)) = weight w a.val * weight w b.val := by
  change weight W (((tag a).disjSum (tag b)).map _) = _
  rw [Multiset.map_disjSum, weight_add]
  unfold weight
  rw [Multiset.map_map, Multiset.map_map]
  simp only [Function.comp_def,hl,hr]
  rw [← untag a, ← untag b,Multiset.map_map,Multiset.map_map]
  rfl

theorem impossible {D N : Type} [Field D] [NumberField D] [Field N] [NumberField N]
    (s : Finset (TunnellIdealPrimeWords.P D)) (l : Allowed s ⊕ Allowed s ↪ TunnellIdealPrimeWords.P N)
    (hl : ∀ p, wt N (l (.inl p)) = wt D p.val) (hr : ∀ p, wt N (l (.inr p)) = wt D p.val) : False := by
  obtain ⟨c,hc,hd⟩ := density_good D s
  obtain ⟨C,_,hn⟩ := density_good N ∅
  let e : Good s × Good s ↪ Good (∅ : Finset (TunnellIdealPrimeWords.P N)) :=
    ⟨fun a => ⟨pair l a,by simp⟩,fun _ _ h => (pair l).injective (congrArg Subtype.val h)⟩
  apply TunnellIdealCountingBound.impossible
    (fun m : Good s => weight (wt D) m.val)
    (fun m : Good (∅ : Finset (TunnellIdealPrimeWords.P N)) => weight (wt N) m.val) _
    (cut_finite _ (finite D) s) (finite N) hc hd hn e (weight_pair _ _ l hl hr)
  intro a
  apply Multiset.prod_pos
  intro n h
  obtain ⟨p,_,rfl⟩ := Multiset.mem_map.mp h
  exact Nat.zero_lt_of_lt (wt_gt_one D p)

end
end TunnellSplitPrimePairs
/-! In a finite extension, infinitely many primes fail to have two distinct degree-one lifts. -/
namespace TunnellCofiniteSplitting
open NumberField IsDedekindDomain TunnellIdealPrimeWords TunnellSplitPrimePairs
open scoped Classical NumberField
noncomputable section
variable (D N : Type) [Field D] [NumberField D] [Field N] [NumberField N] [Algebra D N]

def two (v : P D) := ∃ l r : P N, l ≠ r ∧ l.asIdeal.LiesOver v.asIdeal ∧
  r.asIdeal.LiesOver v.asIdeal ∧ l.asIdeal.inertiaDeg (𝓞 D) = 1 ∧ r.asIdeal.inertiaDeg (𝓞 D) = 1

theorem infinite_not_two : {v : P D | ¬ two D N v}.Infinite := by
  classical
  intro hex
  let s := hex.toFinset
  have h (p : Allowed s) : two D N p.val := by
    by_contra h
    exact p.property (hex.mem_toFinset.mpr h)
  choose l r hne hl hr hld hrd using h
  let f : Allowed s ⊕ Allowed s → P N := Sum.elim l r
  let base : Allowed s ⊕ Allowed s → Allowed s := Sum.elim id id
  have comm (x : Allowed s ⊕ Allowed s) : (base x).val.asIdeal = (f x).asIdeal.under (𝓞 D) := by
    rcases x with p|p
    · exact (hl p).over
    · exact (hr p).over
  have hf : Function.Injective f := by
    intro x y he
    have hb : base x = base y := Subtype.ext (HeightOneSpectrum.ext
      ((comm x).trans ((congrArg (fun q : P N => q.asIdeal.under (𝓞 D)) he).trans (comm y).symm)))
    rcases x with p|p <;> rcases y with q|q <;> change p=q at hb <;> subst q
    · rfl
    · exact (hne p he).elim
    · exact (hne p he.symm).elim
    · rfl
  apply impossible s ⟨f,hf⟩
  · intro p
    haveI := hl p
    simpa [wt,hld p,f] using (Ideal.absNorm_pow_inertiaDeg p.val.asIdeal (l p).asIdeal).symm
  · intro p
    haveI := hr p
    simpa [wt,hrd p,f] using (Ideal.absNorm_pow_inertiaDeg p.val.asIdeal (r p).asIdeal).symm

end
end TunnellCofiniteSplitting
namespace TunnellCofiniteSplitDegree
open NumberField IsDedekindDomain TunnellIdealPrimeWords TunnellCofiniteSplitting
open scoped NumberField Classical
noncomputable section
variable (D N : Type) [Field D] [NumberField D] [Field N] [NumberField N] [Algebra D N]

theorem two_of_split (d : 1 < Module.finrank D N) (v : P D)
    (h : Nat.card (v.asIdeal.primesOver (𝓞 N)) = Module.finrank D N) : two D N v := by
  classical
  let Y := v.asIdeal.primesOver (𝓞 N)
  letI : Fintype Y := inferInstanceAs (Fintype (v.asIdeal.primesOver (𝓞 N)))
  let lift (q : Y) : P N := ⟨q.val,q.property.1,Ideal.ne_bot_of_mem_primesOver v.ne_bot q.property⟩
  let n (q : Y) := q.val.ramificationIdx (𝓞 D) * q.val.inertiaDeg (𝓞 D)
  have summ : ∑ q : Y, n q = Nat.card Y := by
    rw [h, IsFractionRing.finrank_eq (𝓞 D) D (𝓞 N) N]
    exact Ideal.sum_ramification_inertia_eq_finrank v.asIdeal (𝓞 N)
  have h1 (q : Y) : 0 < q.val.inertiaDeg (𝓞 D) := by
    haveI := q.property.1
    exact q.val.inertiaDeg_pos (𝓞 D)
  have h2 (q : Y) : 0 < q.val.ramificationIdx (𝓞 D) := by
    haveI := q.property.1
    exact q.val.ramificationIdx_pos (𝓞 D)
  have hn (q : Y) : 1 ≤ n q := Nat.mul_pos (h2 q) (h1 q)
  have hone (q : Y) : q.val.inertiaDeg (𝓞 D) = 1 := by
    by_contra ne
    have gt : 1 < n q := (Nat.one_lt_iff_ne_zero_and_ne_one.mpr ⟨(h1 q).ne',ne⟩).trans_le
      (Nat.le_mul_of_pos_left _ (h2 q))
    have H : (∑ _ : Y, 1) < ∑ i : Y, n i := Finset.sum_lt_sum (fun i _ => hn i) ⟨q,Finset.mem_univ _,gt⟩
    simp [summ,Nat.card_eq_fintype_card] at H
  have hc : 1 < Fintype.card Y := by rw [← Nat.card_eq_fintype_card,h]; exact d
  haveI : Nontrivial Y := Fintype.one_lt_card_iff_nontrivial.mp hc
  obtain ⟨p,q,hpq⟩ := exists_pair_ne Y
  refine ⟨lift p,lift q,fun eq => hpq (Subtype.ext (congrArg HeightOneSpectrum.asIdeal eq)),
    p.property.2,q.property.2,hone p,hone q⟩

theorem degree_one (h : {v : P D | Nat.card (v.asIdeal.primesOver (𝓞 N)) ≠ Module.finrank D N}.Finite) :
    Module.finrank D N = 1 := by
  by_contra hn
  have hd : 1 < Module.finrank D N := by have := Module.finrank_pos (R:=D) (M:=N); omega
  exact infinite_not_two D N (h.subset (fun v hbad he => hbad (two_of_split D N hd v he)))

end
end TunnellCofiniteSplitDegree

namespace TunnellPrimeInert
open NumberField IsDedekindDomain
open scoped NumberField Classical
theorem primes : OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H3_R1_H1_R1_H3_R1_H2_R1_H1_R1_H1_R1_H2_R1_H1_R1.H1 := by
  intro D N _ _ _ _ _ _ _ hp hf
  apply hp.ne_one
  apply TunnellCofiniteSplitDegree.degree_one D N
  apply hf.subset
  intro v hn
  have count:=Ideal.ncard_primesOver_mul_ramificationIdxIn_mul_inertiaDegIn v.asIdeal (𝓞 N) Gal(N/D)
  rw [IsGalois.card_aut_eq_finrank] at count
  have hdiv : Nat.card (v.asIdeal.primesOver (𝓞 N)) ∣ Module.finrank D N := ⟨_,count.symm⟩
  exact ((Nat.dvd_prime hp).mp hdiv).resolve_right hn
end TunnellPrimeInert

theorem OMA.solution : OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H3_R1_H1_R1_H3_R1_H2_R1_H1_R1_H1_R1_H2_R1_H1_R1.H1 := TunnellPrimeInert.primes
