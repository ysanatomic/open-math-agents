import TunnellShell
import TunnellFiniteSymbols
import Mathlib.Tactic.NormNum.LegendreSymbol

/-! Exact small-discriminant calibrations of the finite winding and shell coefficients. -/
namespace TunnellRankinCalibration
open TunnellShell TunnellFiniteSymbols TunnellCuspEuclid TunnellTwistCharacter Finset
set_option maxRecDepth 12000

private def smallShell (N R : ℕ) : Finset Triple :=
  let I := Finset.Icc (-(R:ℤ)) (R:ℤ)
  (I ×ˢ (I ×ˢ I)).filter (fun x => normSq x=N)

private lemma smallShell_eq (N R : ℕ) (h : (N:ℤ)<((R:ℤ)+1)^2) : smallShell N R=shell N := by
  apply Finset.ext
  rintro ⟨x,y,z⟩
  dsimp only [smallShell]
  rw [Finset.mem_filter,Finset.mem_product,Finset.mem_product,mem_shell]
  simp only [Finset.mem_Icc,normSq]
  refine ⟨And.right,fun H => ⟨?_,H⟩⟩
  have bd (a : ℤ) (ha : a^2≤N) : -(R:ℤ)≤a ∧ a≤R := by
    constructor
    · by_contra! H'
      have : 0 ≤ ((-a)-((R:ℤ)+1))*((-a)+((R:ℤ)+1)) := mul_nonneg (by omega) (by omega)
      nlinarith
    · by_contra! H'
      have : 0 ≤ (a-((R:ℤ)+1))*(a+((R:ℤ)+1)) := mul_nonneg (by omega) (by omega)
      nlinarith
  exact ⟨bd x (by nlinarith [sq_nonneg y,sq_nonneg z]),bd y (by nlinarith [sq_nonneg x,sq_nonneg z]),bd z (by nlinarith [sq_nonneg x,sq_nonneg y])⟩

lemma b_one : b 1=1 := by
  have h := sum_weight_eq_twelve 1
  change ∑ t ∈ shell 2, TunnellShell.weight t = 12*b 1 at h
  rw [← smallShell_eq 2 1 (by norm_num),show ∑ t ∈ smallShell 2 1,TunnellShell.weight t = 12 by decide] at h
  omega

lemma b_seventeen : b 17=0 := by
  have h := sum_weight_eq_twelve 17
  change ∑ t ∈ shell 34, TunnellShell.weight t = 12*b 17 at h
  rw [← smallShell_eq 34 5 (by norm_num),show ∑ t ∈ smallShell 34 5,TunnellShell.weight t = 0 by decide] at h
  omega


/-- The quadratic characters of conductor eight and seventeen on the finite ranges. -/
private def smallChar (n j : ℕ) : ℤ :=
  if j%2=0 then 0 else
  (if j%8=1 ∨ j%8=7 then 1 else -1) *
  (if n=2 then 1 else if j%17=0 then 0 else
    if j%17∈([1,2,4,8,9,13,15,16] : List ℕ) then 1 else -1)

private lemma tab_two (j : Fin 8) : TunnellTwistCharacter.weight 2 j.val = smallChar 2 j.val := by
  fin_cases j <;> norm_num [TunnellTwistCharacter.weight,Nat.odd_iff,smallChar,List.mem_cons]

set_option maxHeartbeats 4000000 in
private lemma tab_thirtyfour (j : Fin 136) : TunnellTwistCharacter.weight 34 j.val = smallChar 34 j.val := by
  fin_cases j <;> norm_num [TunnellTwistCharacter.weight,Nat.odd_iff,smallChar,List.mem_cons]

lemma winding_two : winding 2 (by decide) = 4 := by
  change (∑ j : Fin 8, TunnellTwistCharacter.weight 2 j.val*(symbol (j.val:ℤ) 2).re) = _
  simp_rw [tab_two]
  decide

set_option maxHeartbeats 4000000 in
lemma winding_thirtyfour : winding 34 (by decide) = 0 := by
  change (∑ j : Fin 136, TunnellTwistCharacter.weight 34 j.val*(symbol (j.val:ℤ) 34).re) = _
  simp_rw [tab_thirtyfour]
  decide

end TunnellRankinCalibration
#print axioms TunnellRankinCalibration.winding_two
#print axioms TunnellRankinCalibration.winding_thirtyfour
#print axioms TunnellRankinCalibration.b_seventeen
