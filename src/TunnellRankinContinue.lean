import TunnellRankinUnfold
import TunnellPrimitive

/-! The distinguished continuation of the unfolded Rankin integral at its central point. -/

namespace TunnellRankin
open TunnellTwistCharacter TunnellCMLSeries Complex Set

lemma negWeight_decompose (d m : ℕ) : negWeight d m=ZMod.χ₄ m*weight (2*d) m := by
  by_cases h : Odd m
  · simp [negWeight,weight,h,jacobiSym.neg _ h]
  · simp [negWeight,weight,h]

lemma negWeight_mod (d m : ℕ) : negWeight d (m%(4*(2*d))) = negWeight d m := by
  rw [negWeight_decompose,negWeight_decompose,weight_mod,ZMod.χ₄_nat_mod_four (m%(4*(2*d))),
    Nat.mod_mod_of_dvd _ (dvd_mul_right _ _),←ZMod.χ₄_nat_mod_four]

noncomputable def negCharacter (d : ℕ) (hd : 0<d) : DirichletCharacter ℂ (4*(2*d)) where
  toFun z := (negWeight d z.val:ℂ)
  map_one' := by rw [ZMod.val_one_eq_one_mod,negWeight_mod,negWeight_one]; norm_num
  map_mul' a b := by rw [ZMod.val_mul,negWeight_mod,negWeight_mul]; push_cast; rfl
  map_nonunit' a ha := by
    letI : NeZero (4*(2*d)) := ⟨by omega⟩
    have h : ¬a.val.Coprime (4*(2*d)) := fun hc => ha (by
      simpa only [ZMod.natCast_zmod_val] using (ZMod.isUnit_iff_coprime _ _).mpr hc)
    simp [negWeight_decompose,weight_zero_of_not_coprime (2*d) a.val h]

lemma negCharacter_nat {d : ℕ} (hd : 0<d) (j : ℕ) :
    negCharacter d hd (j:ZMod (4*(2*d)))=(negWeight d j:ℂ) := by
  change (negWeight d (j:ZMod (4*(2*d))).val:ℂ)=_
  rw [ZMod.val_natCast,negWeight_mod]

lemma negCharacter_odd {d : ℕ} (hd : d%4=1) : (negCharacter d (by omega)).Odd := by
  letI : NeZero (4*(2*d)) := ⟨by omega⟩
  have he := character_even hd
  change (weight (2*d) (-1:ZMod (4*(2*d))).val:ℂ)=1 at he
  change (negWeight d (-1:ZMod (4*(2*d))).val:ℂ)= -1
  rw [negWeight_decompose,Int.cast_mul,he,mul_one]
  have hnat : (-1:ZMod (4*(2*d))).val%4=3 := by
    have hz : (-1:ZMod (4*(2*d)))=((4*(2*d)-1:ℕ):ZMod (4*(2*d))) := by rw [Nat.cast_sub (by omega)]; simp
    rw [hz,ZMod.val_natCast,Nat.mod_eq_of_lt (show 4*(2*d)-1<4*(2*d) by omega)]; omega
  rw [ZMod.χ₄_nat_three_mod_four hnat]; norm_num

noncomputable def negativeL (d : ℕ) (hd : 0<d) (s : ℂ) : ℂ :=
  haveI : NeZero (4*(2*d)) := ⟨by omega⟩
  DirichletCharacter.LFunction (negCharacter d hd) s

lemma negative_lseries (d : ℕ) (hd : 0<d) (s : ℝ) (hs : 1<s) :
    negativeL d hd (s:ℂ)=∑' m,dir (quadraticCoeff d) s m := by
  letI : NeZero (4*(2*d)) := ⟨by omega⟩
  rw [negativeL,DirichletCharacter.LFunction_eq_LSeries _ (by simpa using hs),LSeries]
  congr 1
  funext m
  rw [LSeries.term_of_ne_zero' (by exact_mod_cast (by linarith : s≠0) : (s:ℂ)≠0),negCharacter_nat]
  rfl

noncomputable def continued (d : ℕ) (hd : 0<d) (F L : ℂ→ℂ) (s : ℂ) : ℂ :=
  Gamma s*F s*L s / negativeL d hd (2*s-1)

lemma continued_eq {d : ℕ} (hd : 0<d) (F L : ℂ→ℂ) (s : ℝ) (hs : 5/2<s)
    (hF : F s=latticeValue 1 s) (hL : L s=latticeValue (2*d) s) :
    continued d hd F L s=mellin (strip d) (s:ℂ) := by
  letI : NeZero (4*(2*d)) := ⟨by omega⟩
  have hχ := negative_lseries d hd (2*s-1) (by linarith)
  have hne := DirichletCharacter.LFunction_ne_zero_of_one_le_re (negCharacter d hd)
    (s:=((2*s-1:ℝ):ℂ)) (Or.inr (by exact_mod_cast (by linarith : 2*s-1≠1))) (by simpa using (show 1≤2*s-1 by linarith))
  change negativeL d hd _ =
    ∑' m : ℕ, (negWeight d m:ℂ)/(m:ℂ)^((2*s-1:ℝ):ℂ) at hχ
  change negativeL d hd ((2*s-1:ℝ):ℂ)≠0 at hne
  unfold continued
  rw [hF,hL,show (2:ℂ)*(s:ℂ)-1=((2*s-1:ℝ):ℂ) by push_cast; rfl,mellin_strip d hs]
  apply (div_eq_iff hne).mpr
  rw [mul_assoc,rankin_factorization d s hs,←hχ]
  change _=Complex.Gamma s*(∑' m : ℕ,gaussCoeff 1 m*(idealCoeff d m:ℂ)/(m:ℂ)^(s:ℂ))*negativeL d hd _
  ring

lemma continued_center {d : ℕ} (hd : d%4=1) {F L : ℂ→ℂ}
    (hF : AnalyticAt ℂ F 1) (hL : AnalyticAt ℂ L 1) :
    AnalyticAt ℂ (continued d (by omega) F L) 1 ∧
      (continued d (by omega) F L 1)*negativeL d (by omega) 1 =
      F 1*L 1 := by
  letI : NeZero (4*(2*d)) := ⟨by omega⟩
  have hχ : negCharacter d (by omega)≠1 := by
    intro hz
    have eq := negCharacter_odd hd
    rw [DirichletCharacter.Odd,hz,MulChar.one_apply (by simp)] at eq
    norm_num at eq
  have hne := DirichletCharacter.LFunction_apply_one_ne_zero hχ
  change negativeL d (by omega) 1 ≠ 0 at hne
  have hg : AnalyticAt ℂ Complex.Gamma 1 := by
    let V := {s : ℂ | 0<s.re}
    have hV : DifferentiableOn ℂ Complex.Gamma V := by
      intro z hz
      apply (Complex.differentiableAt_Gamma z _).differentiableWithinAt
      intro n he
      change 0<z.re at hz
      rw [he,Complex.neg_re,Complex.natCast_re] at hz
      linarith [Nat.cast_nonneg (α:=ℝ) n]
    exact hV.analyticAt ((isOpen_lt continuous_const Complex.continuous_re).mem_nhds (by norm_num : (0:ℝ)<(1:ℂ).re))
  constructor
  · unfold continued
    apply AnalyticAt.div
    · exact (hg.mul hF).mul hL
    · unfold negativeL
      apply ((DirichletCharacter.differentiable_LFunction hχ).analyticAt _).comp
      fun_prop
    · simpa only [show (2:ℂ)*1-1=1 by norm_num] using hne
  · simp only [continued,show (2:ℂ)*1-1=1 by norm_num,Gamma_one,one_mul,div_mul_cancel₀ _ hne]

end TunnellRankin
#print axioms TunnellRankin.continued_center
