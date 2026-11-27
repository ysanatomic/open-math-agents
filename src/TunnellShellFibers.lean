import TunnellShell

/-! Weighted finite fibers on ternary quadratic shells and the resulting Hecke relation. -/

namespace TunnellShellFibers

open Finset TunnellShell

def divisible (p : ℕ) (v : Triple) : Prop := (p:ℤ) ∣ v.1 ∧ (p:ℤ) ∣ v.2.1 ∧ (p:ℤ) ∣ v.2.2
instance (p : ℕ) (v : Triple) : Decidable (divisible p v) := by unfold divisible; infer_instance

def divide (p : ℕ) (v : Triple) : Triple := (v.1/p, v.2.1/p, v.2.2/p)

lemma smul_divide (p : ℕ) (v : Triple) (h : divisible p v) : (p:ℤ) • divide p v = v := by
  obtain ⟨x,y,z⟩ := v
  obtain ⟨hx,hy,hz⟩ := h
  apply Prod.ext (Int.mul_ediv_cancel' hx)
  exact Prod.ext (Int.mul_ediv_cancel' hy) (Int.mul_ediv_cancel' hz)

lemma divide_smul {p : ℕ} (hp : p≠0) (v : Triple) : divide p ((p:ℤ) • v) = v := by
  rcases v with ⟨x,y,z⟩
  simp [divide, hp]

lemma divisible_smul (p : ℕ) (v : Triple) : divisible p ((p:ℤ) • v) := by
  obtain ⟨x,y,z⟩ := v
  simp [divisible]

lemma norm_smul (p : ℕ) (v : Triple) : normSq ((p:ℤ) • v) = (p:ℤ)^2*normSq v := by
  rcases v with ⟨x,y,z⟩
  simp [normSq]
  ring

lemma sum_scaled {p : ℕ} (hp : p ≠ 0) (N : ℕ) (f : Triple → ℤ) :
    (∑ w ∈ (shell (p^2*N)).filter (divisible p), f w) = ∑ v ∈ shell N, f ((p:ℤ) • v) := by
  apply sum_nbij' (divide p) (fun v => (p:ℤ) • v)
  · intro w hw
    obtain ⟨hwn,hdiv⟩ := mem_filter.mp hw
    have he := mem_shell.mp hwn
    rw [←smul_divide p w hdiv,norm_smul] at he
    push_cast at he
    exact mem_shell.mpr (mul_left_cancel₀ (pow_ne_zero 2 (by exact_mod_cast hp)) he)
  · intro v hv
    exact mem_filter.mpr ⟨mem_shell.mpr (by rw [norm_smul,mem_shell.mp hv]; push_cast; rfl),divisible_smul p v⟩
  · intro w hw
    exact smul_divide p w (mem_filter.mp hw).2
  · intro v _
    exact divide_smul hp v
  · intro w hw
    rw [smul_divide p w (mem_filter.mp hw).2]

lemma square_dvd_norm {N p : ℕ} {v : Triple} (hv : v∈shell N) (hd : divisible p v) : p^2 ∣ N := by
  have hi := mem_shell.mp hv
  rw [←smul_divide p v hd,norm_smul] at hi
  exact_mod_cast (show (p:ℤ)^2 ∣ (N:ℤ) from ⟨_,hi.symm⟩)

lemma sum_divisible {p : ℕ} (hp : p ≠ 0) (N : ℕ) (f : Triple → ℤ)
    (hf : ∀ v, f ((p:ℤ) • v) = f v) :
    (∑ v ∈ (shell N).filter (divisible p), f v) =
      if p^2∣N then ∑ w ∈ shell (N/p^2), f w else 0 := by
  split_ifs with h
  · conv_lhs => rw [← Nat.mul_div_cancel' h]
    simpa only [hf] using sum_scaled hp (N/p^2) f
  · apply sum_eq_zero
    intro w hw
    exact (h (square_dvd_norm (mem_filter.mp hw).1 (mem_filter.mp hw).2)).elim

lemma coordWeight_smul {p : ℤ} (hp : Odd p) (v : Triple) : coordWeight (p • v) = coordWeight v := by
  obtain ⟨x,y,z⟩ := v
  have hp' := Int.odd_iff.mp hp
  have h4 : (p*z)%4=0 ↔ z%4=0 := by
    rw [Int.mul_emod]
    have hp4 : p%4=1 ∨ p%4=3 := by omega
    rcases hp4 with h|h <;> rw [h] <;> omega
  have hcond : admissible (p • (x,y,z)) ↔ admissible (x,y,z) := by
    change (Odd (p*x) ∧ Odd (p*y) ∧ (p*z)%4=0) ↔ Odd x ∧ Odd y ∧ z%4=0
    simp [Int.odd_mul,hp,h4]
  unfold coordWeight
  rw [if_congr hcond rfl rfl]
  split_ifs with had
  · have hdiv : 4∣z := Int.dvd_of_emod_eq_zero had.2.2
    change ((p*z/4).negOnePow:ℤ)=((z/4).negOnePow:ℤ)
    rw [Int.mul_ediv_assoc p hdiv]
    apply congrArg Units.val
    apply (Int.negOnePow_eq_iff _ _).mpr
    rcases hp with ⟨k,hk⟩
    exact ⟨k*(z/4),by rw [hk]; ring⟩
  · rfl

lemma weight_smul {p : ℤ} (hp : Odd p) (v : Triple) : weight (p • v) = weight v := by
  change coordWeight (p • v) + coordWeight (p • rot v) + coordWeight (p • rot (rot v)) = _
  rw [coordWeight_smul hp,coordWeight_smul hp,coordWeight_smul hp]
  rfl

def count {α : Type*} (D : Finset α) (g : α → Triple) (w : Triple) : ℕ :=
  (D.filter (fun x => g x = w)).card

/-- Summing the two incidence multiplicities yields the ternary Hecke relation. -/
theorem raw_fiber_sum {α : Type*} {p N : ℕ} [Fact p.Prime]
    (D : Finset α) (g : α → Triple) (f : Triple → ℤ)
    (hg : ∀ x ∈ D, g x ∈ shell (p^2*N)) (hf : ∀ v, f ((p:ℤ) • v) = f v)
    (hprim : ∀ w ∈ shell (p^2*N), ¬divisible p w → count D g w = 8)
    (hscaled : ∀ v ∈ shell N, (count D g ((p:ℤ) • v) : ℤ) =
      8 * (if divisible p v then (p:ℤ)+1 else 1+quadraticChar (ZMod p) (-(N:ZMod p)))) :
    ∑ x ∈ D, f (g x) = 8 * ((∑ w ∈ shell (p^2*N), f w) +
      quadraticChar (ZMod p) (-(N:ZMod p)) * (∑ v ∈ shell N, f v) +
      (if p^2∣N then (p:ℤ) * ∑ u ∈ shell (N/p^2), f u else 0)) := by
  classical
  let χ : ℤ := quadraticChar (ZMod p) (-(N:ZMod p))
  let S := shell (p^2*N)
  let corr (w : Triple) : ℤ := ((count D g w:ℤ)-8)*f w
  have hp : p≠0 := (Fact.out : p.Prime).ne_zero
  have hc (v : Triple) (hv : v ∈ shell N) (hdiv : divisible p v) : χ = 0 := by
    have hd : p∣N := dvd_trans (by simp) (square_dvd_norm hv hdiv)
    simp [χ,(ZMod.natCast_eq_zero_iff N p).2 hd]
  have hcorr : (∑ w ∈ S, corr w) = ∑ v ∈ shell N, corr ((p:ℤ) • v) := by
    rw [←sum_scaled hp N corr]
    symm
    apply sum_subset (filter_subset _ _)
    intro w hw hn
    have hdiv : ¬divisible p w := fun h => hn (mem_filter.mpr ⟨hw,h⟩)
    simp [corr,hprim w hw hdiv]
  have hcor (v : Triple) (hv : v ∈ shell N) : corr ((p:ℤ) • v) =
      8*(χ*f v + (if divisible p v then (p:ℤ)*f v else 0)) := by
    dsimp only [corr]
    rw [hscaled v hv,hf]
    change (8*(if divisible p v then (p:ℤ)+1 else 1+χ)-8)*f v = _
    by_cases h : divisible p v
    · rw [if_pos h,if_pos h,hc v hv h]
      ring
    · rw [if_neg h,if_neg h]
      ring
  rw [←sum_fiberwise_of_maps_to' hg f]
  simp only [sum_const, nsmul_eq_mul]
  change ∑ w ∈ S, (count D g w:ℤ)*f w = _
  calc
    _ = ∑ w ∈ S, (8*f w+corr w) := sum_congr rfl (fun w _ => by dsimp [corr]; ring)
    _ = _ := by
      rw [sum_add_distrib,hcorr,sum_congr rfl hcor,←mul_sum,←mul_sum,sum_add_distrib,←mul_sum,
        ←sum_filter,←mul_sum,sum_divisible hp N f hf]
      dsimp [χ,S]
      split_ifs <;> ring

end TunnellShellFibers
