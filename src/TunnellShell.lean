import OMAReductions.R_CongruentNumber_Tunnell_even_R1
import TunnellCentralQExpansion

/-! # The ternary square shell for the weight-three-halves coefficients -/

namespace TunnellShell

open OMA.R_CongruentNumber_Tunnell_even_R1 CongruentNumber Finset
open scoped PowerSeries.WithPiTopology

abbrev Triple := ℤ × ℤ × ℤ

def normSq (v : Triple) : ℤ := v.1^2+v.2.1^2+v.2.2^2

def shell (N : ℕ) : Finset Triple :=
  let I := Finset.Icc (-(N:ℤ)-1) (N+1:ℤ)
  (I ×ˢ (I ×ˢ I)).filter (fun v => normSq v=N)

@[simp] lemma mem_shell {N : ℕ} {v : Triple} : v ∈ shell N ↔ normSq v=N := by
  obtain ⟨x,y,z⟩ := v
  simp only [shell,Finset.mem_filter,Finset.mem_product,Finset.mem_Icc]
  refine ⟨And.right,fun h => ⟨?_,h⟩⟩
  change x^2+y^2+z^2=(N:ℤ) at h
  have hbound (a:ℤ) (ha:a^2≤N) : -(N:ℤ)-1 ≤ a ∧ a ≤ N+1 :=
    ⟨by nlinarith [sq_nonneg (a+1)],by nlinarith [sq_nonneg (a-1)]⟩
  exact ⟨hbound x (by nlinarith [sq_nonneg y,sq_nonneg z]), hbound y (by nlinarith [sq_nonneg x,sq_nonneg z]),
    hbound z (by nlinarith [sq_nonneg x,sq_nonneg y])⟩

def admissible (v : Triple) : Prop := Odd v.1 ∧ Odd v.2.1 ∧ v.2.2%4=0
instance (v : Triple) : Decidable (admissible v) := by unfold admissible; infer_instance

def coordWeight (v : Triple) : ℤ := if admissible v then ((v.2.2/4).negOnePow : ℤ) else 0

def rot (v : Triple) : Triple := (v.2.1,v.2.2,v.1)

def weight (v : Triple) : ℤ := coordWeight v + coordWeight (rot v) + coordWeight (rot (rot v))

lemma rotation_sum (N : ℕ) (f : Triple → ℤ) :
    ∑ v ∈ shell N, f (rot v) = ∑ v ∈ shell N, f v := by
  apply sum_nbij' rot (fun v => rot (rot v))
  · rintro ⟨x,y,z⟩ h
    simp only [mem_shell,normSq,rot] at h ⊢
    linarith
  · rintro ⟨x,y,z⟩ h
    simp only [mem_shell,normSq,rot] at h ⊢
    linarith
  all_goals intro v _; rfl

lemma sum_weight (N : ℕ) : ∑ v ∈ shell N, weight v = 3*∑ v ∈ shell N, coordWeight v := by
  change ∑ v ∈ _, (coordWeight v+coordWeight (rot v)+coordWeight (rot (rot v))) = _
  simp only [sum_add_distrib]
  rw [rotation_sum N (fun v => coordWeight (rot v)),rotation_sum N coordWeight]
  ring

def slice (N : ℕ) (P : ℤ → Prop) : Set Triple :=
  {v | (v ∈ shell N ∧ admissible v) ∧ P (v.2.2/4)}

lemma sum_coordWeight (N : ℕ) : ∑ v ∈ shell N, coordWeight v =
    (slice N Even).ncard - ((slice N Odd).ncard : ℤ) := by
  calc
    _ = ∑ v ∈ shell N, if v∈shell N ∧ admissible v then ((v.2.2 / 4).negOnePow : ℤ) else 0 := by
      apply sum_congr rfl; intro v hv; simp [coordWeight,hv]
    _ = _ := sum_sign_eq_ncard (shell N) _ _ (fun _ h => h.1)

lemma slice_card {m : ℕ} (hm : m%4=1) (P : ℤ → Prop) :
    (slice (2*m) P).ncard = 2* {v ∈ D (2*m) | P v.2.2}.ncard := by
  let S := slice (2*m) P
  let good := {v ∈ S | v.1%4 = v.2.1%4}
  let bad := {v ∈ S | v.1%4 ≠ v.2.1%4}
  have hf : S.Finite := (shell (2*m)).finite_toSet.subset (fun _ h => h.1.1)
  have hsplit : S = good ∪ bad := by ext v; simp [good,bad]; tauto
  have hdis : Disjoint good bad := Set.disjoint_left.mpr (fun _ hu hv => hv.2 hu.2)
  have hpair : bad.ncard = good.ncard := by
    apply Set.ncard_congr (fun v _ => (-v.1,v.2.1,v.2.2))
    · rintro ⟨x,y,z⟩ ⟨⟨⟨hs,hx,hy,hz⟩,hp⟩,hne⟩
      have hx' := Int.odd_iff.mp hx
      have hy' := Int.odd_iff.mp hy
      exact ⟨⟨⟨by simpa [normSq] using hs,by simpa using hx,hy,hz⟩,hp⟩,by dsimp at hne hx' hy' ⊢; omega⟩
    · rintro ⟨x,y,z⟩ ⟨x',y',z'⟩ _ _ h; simpa using h
    · rintro ⟨x,y,z⟩ ⟨⟨⟨hs,hx,hy,hz⟩,hp⟩,he⟩
      have hx' := Int.odd_iff.mp hx
      exact ⟨(-x,y,z),⟨⟨⟨by simpa [normSq] using hs,by simpa using hx,hy,hz⟩,hp⟩,by dsimp at he hx' ⊢; omega⟩,by simp⟩
  have count : {v ∈ D (2*m) | P v.2.2}.ncard = good.ncard := by
    apply Set.ncard_congr (fun v _ => (v.2.1+2*v.1,v.2.1-2*v.1,4*v.2.2))
    · rintro ⟨r,a,t⟩ ⟨hd,hp⟩
      have ha := y_residues (n:=2*m) (by omega) hd
      have ha' : Odd a := Int.odd_iff.mpr (by omega)
      change ((2*m:ℕ):ℤ)=8*r^2+2*a^2+16*t^2 at hd
      refine ⟨⟨⟨mem_shell.mpr ?_,Int.odd_iff.mpr (by change (a+2*r)%2=1; omega),Int.odd_iff.mpr (by change (a-2*r)%2=1; omega),by dsimp; omega⟩,?_⟩,by dsimp; omega⟩
      · dsimp [normSq]; push_cast at hd; linear_combination -hd
      · simpa using hp
    · rintro ⟨r,a,t⟩ ⟨r',a',t'⟩ h h' he
      simp only [Prod.mk.injEq] at he ⊢
      exact ⟨by omega,by omega,by omega⟩
    · rintro ⟨x,y,z⟩ ⟨⟨⟨hs,hx,hy,hz⟩,hp⟩,he⟩
      have hx' := Int.odd_iff.mp hx
      have hy' := Int.odd_iff.mp hy
      change x%4=y%4 at he
      change z%4=0 at hz
      let r := (x-y)/4
      let a := (x+y)/2
      let t := z/4
      have h1 : a+2*r=x := by dsimp [a,r]; omega
      have h2 : a-2*r=y := by dsimp [a,r]; omega
      have h3 : 4*t=z := by dsimp [t]; omega
      refine ⟨(r,a,t),⟨?_,hp⟩,by simp [h1,h2,h3]⟩
      have hs' := mem_shell.mp hs
      change x^2+y^2+z^2=((2*m:ℕ):ℤ) at hs'
      rw [← h1,← h2,← h3] at hs'
      change ((2*m:ℕ):ℤ)=8*r^2+2*a^2+16*t^2
      linear_combination -hs'
  change S.ncard = _
  rw [hsplit,Set.ncard_union_eq hdis (hf.subset (Set.sep_subset _ _)) (hf.subset (Set.sep_subset _ _)), hpair, ←count]
  omega

noncomputable def b (m : ℕ) : ℤ :=
  let X : PowerSeries ℤ := PowerSeries.X
  PowerSeries.coeff m (X * (∏' k : ℕ, (1-X^(8*(k+1)))) * (∏' k : ℕ, (1-X^(16*(k+1)))) *
    (1+2*∑' k : ℕ, X^(4*(k+1)^2)))

lemma b_zero {m : ℕ} (hm : m%4≠1) : b m=0 := by
  have empty (P : ℤ→Prop) :
      {t : Triple | 1 + 8*pentagonal t.1 + 16*pentagonal t.2.1 + 4*t.2.2.natAbs^2=m ∧
        P (t.1+t.2.1)} = ∅ := by
    apply Set.eq_empty_iff_forall_notMem.mpr
    intro t ht
    have h := ht.1
    omega
  rw [b,← FourierSeries.finite_eq_infinite, coefficient_count,empty Even,empty Odd]
  simp

lemma odd_square_mod8 (x : ℤ) (hx : Odd x) : x^2%8=1 := by
  have h := Int.odd_iff.mp hx
  have h0 := Int.emod_nonneg x (by decide : (8:ℤ) ≠ 0)
  have h8 := Int.emod_lt_of_pos x (by decide : (0:ℤ) < 8)
  rw [sq,Int.mul_emod]
  interval_cases he : x%8 <;> omega

lemma admissible_residue {m : ℕ} {v : Triple} (hv : v∈shell (2*m)) (ha : admissible v) : m%4=1 := by
  rcases v with ⟨x,y,z⟩
  obtain ⟨hx,hy,hz⟩ := ha
  change z%4=0 at hz
  have h1 := odd_square_mod8 x hx
  have h2 := odd_square_mod8 y hy
  have hz' : z=4*(z/4) := by omega
  have h3 : z^2%8=0 := by
    rw [show z^2 = 8*(2*(z/4)^2) by nth_rw 1 [hz']; ring]
    simp
  have he := mem_shell.mp hv
  change x^2+y^2+z^2=((2*m:ℕ):ℤ) at he
  push_cast at he
  omega

theorem sum_weight_eq_twelve (m : ℕ) : (∑ v ∈ shell (2*m),weight v) = 12*b m := by
  rw [sum_weight]
  by_cases hm : m%4=1
  · rw [sum_coordWeight, slice_card hm Even, slice_card hm Odd]
    have hn : (2*m)%8=2 := by omega
    have hb := signed_theta_expansion (2*m) hn
    dsimp only at hb
    simp only [Nat.mul_div_cancel_left _ (by decide : 0<2)] at hb
    rw [FourierSeries.finite_eq_infinite] at hb
    change b m = _ at hb
    have hE := sign_pairing hn (finite_D (2*m)) Even
    have hO := sign_pairing hn (finite_D (2*m)) Odd
    omega
  · have hz : (∑ v ∈ shell (2*m), coordWeight v) = 0 := by
      apply sum_eq_zero
      intro v hv
      exact if_neg (fun ha => hm (admissible_residue hv ha))
    rw [hz,b_zero hm]
    ring

theorem sum_weight_eq_fourier (m : ℕ) :
    ((∑ v ∈ shell (2*m),weight v):ℂ) = 12*
      (UpperHalfPlane.qExpansion 1 (fun z : UpperHalfPlane =>
        ModularForm.eta (8*(z:ℂ))*ModularForm.eta (16*(z:ℂ))*jacobiTheta (8*(z:ℂ)))).coeff m := by
  rw [TunnellCentralSeries.qExpansion_theta_coefficient]
  exact_mod_cast sum_weight_eq_twelve m

#print axioms sum_weight_eq_twelve
#print axioms sum_weight_eq_fourier

end TunnellShell
