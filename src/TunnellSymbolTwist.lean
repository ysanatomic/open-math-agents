import TunnellModularSymbol
import TunnellPrimitive

/-! Normalize the modular-symbol formula for the primitive positive even quadratic twists. -/

namespace TunnellModularSymbol

open MatrixGroups UpperHalfPlane MeasureTheory Set TunnellTwistCharacter
open scoped ModularForm

noncomputable def periodSymbol {Γ : Subgroup (GL (Fin 2) ℝ)} (F : CuspForm Γ 2) (r : ℝ) : ℂ :=
  (2*Real.pi:ℂ) * ∫ t in Ioi (0:ℝ), F (r +ᵥ ofComplex (Complex.I*t))

lemma reflected_symbol {Γ : Subgroup (GL (Fin 2) ℝ)} (F : CuspForm Γ 2)
    (hw : Γ.strictWidthInfty = 1) {N : ℕ} [NeZero N] (a : ZMod N) :
    periodSymbol F (-((-a).val:ℝ)/N) = periodSymbol F ((a.val:ℝ)/N) := by
  by_cases ha : a=0
  · simp [ha]
  have hN : (N:ℝ) ≠ 0 := NeZero.ne _
  have he : -((-a).val:ℝ)/N = -1 + (a.val:ℝ)/N := by
    rw [ZMod.neg_val,if_neg ha,Nat.cast_sub (ZMod.val_lt _).le]
    field_simp
    ring
  have hper : (-1:ℝ) ∈ Γ.strictPeriods :=
    Γ.strictPeriods.neg_mem (hw ▸ Γ.strictWidthInfty_mem_strictPeriods)
  simp only [he,periodSymbol, add_vadd, SlashInvariantForm.vAdd_apply_of_mem_strictPeriods F _ hper]

theorem scaled_twist_integral {N : ℕ} [NeZero N] {χ : DirichletCharacter ℂ N}
    (hχ : χ.IsPrimitive) (hq : χ.IsQuadratic) (he : χ.Even)
    {Γ : Subgroup (GL (Fin 2) ℝ)} [Γ.IsArithmetic] (hw : Γ.strictWidthInfty = 1)
    (F : CuspForm Γ 2) :
    ∃ (H : Subgroup (GL (Fin 2) ℝ)) (hH : H.IsArithmetic) (_ : H.strictWidthInfty = 1)
      (G : CuspForm H 2),
      (∀ m : ℕ, (qExpansion 1 G).coeff m = χ m * (qExpansion 1 F).coeff m) ∧
      gaussSum χ ZMod.stdAddChar * ModularForm.L (by decide : (0:ℤ)<2) G 1 =
        ∑ j : ZMod N, χ j * periodSymbol F ((j.val:ℝ)/N) := by
  obtain ⟨H,hH,hW,G,hcf,hV⟩ := twist_central_integral (χ : ZMod N → ℂ) hw F
  refine ⟨H,hH,hW,G,hcf,?_⟩
  rw [hV,Finset.mul_sum]
  simp_rw [←mul_assoc,primitive_weights hχ hq he]
  exact Fintype.sum_equiv (Equiv.neg _) _ _ (fun j => by
    simp only [Equiv.neg_apply,he.eval_neg]
    simpa only [neg_neg,periodSymbol,mul_assoc] using congrArg (χ j * ·) (reflected_symbol F hw (-j)))

theorem gauss_sign {N : ℕ} [NeZero N] {χ : DirichletCharacter ℂ N}
    (hχ : χ.IsPrimitive) (hq : χ.IsQuadratic) (he : χ.Even) :
    ∃ ε : ℤ, (ε=1 ∨ ε = -1) ∧ (Real.sqrt N:ℂ) = ε * gaussSum χ ZMod.stdAddChar := by
  have h := gauss_sq hχ hq he
  have hsq : (Real.sqrt N:ℂ)^2 = (N:ℂ) := by exact_mod_cast Real.sq_sqrt (Nat.cast_nonneg N : (0:ℝ) ≤ N)
  rcases sq_eq_sq_iff_eq_or_eq_neg.mp (hsq.trans h.symm) with e|e
  · exact ⟨1,Or.inl rfl,by simpa using e⟩
  · exact ⟨-1,Or.inr rfl,by simpa using e⟩

theorem jacobi_twist_integral {n : ℕ} (hn : n%8=2) (hs : Squarefree n)
    {Γ : Subgroup (GL (Fin 2) ℝ)} [Γ.IsArithmetic] (hw : Γ.strictWidthInfty = 1)
    (F : CuspForm Γ 2) :
    haveI : NeZero (4*n) := ⟨by omega⟩
    let χ := character n (by omega)
    ∃ (H : Subgroup (GL (Fin 2) ℝ)) (hH : H.IsArithmetic) (_ : H.strictWidthInfty = 1)
      (G : CuspForm H 2),
      (∀ m : ℕ, (qExpansion 1 G).coeff m = (weight n m:ℂ) * (qExpansion 1 F).coeff m) ∧
      gaussSum χ ZMod.stdAddChar * ModularForm.L (by decide : (0:ℤ)<2) G 1 =
        ∑ j : ZMod (4*n), (weight n j.val:ℂ) * periodSymbol F ((j.val:ℝ)/(4*n)) ∧
      gaussSum χ ZMod.stdAddChar ^ 2 = (4*n:ℂ) := by
  obtain ⟨d,hd⟩ : 2 ∣ n := by exact Nat.dvd_of_mod_eq_zero (by omega)
  subst n
  have hd4 : d%4=1 := by omega
  have hsd := hs.squarefree_of_dvd (dvd_mul_left d 2)
  letI : NeZero (4*(2*d)) := ⟨by omega⟩
  let χ := character (2*d) (by omega)
  let hh := character_primitive hd4 hsd
  let hq := character_quadratic (2*d) (by omega)
  let he := character_even hd4
  obtain ⟨H,hH,hW,G,hcf,hV⟩ := scaled_twist_integral hh hq he hw F
  refine ⟨H,hH,hW,G,fun m => ?_,?_,?_⟩
  · simpa only [character_apply_nat] using hcf m
  · have hc (j : ZMod (4*(2*d))) : character (2*d) (by omega) j = (weight (2*d) j.val:ℂ) := rfl
    simpa only [Nat.cast_mul,Nat.cast_ofNat,hc] using hV
  · simpa only [Nat.cast_mul,Nat.cast_ofNat] using gauss_sq hh hq he

theorem rational_period_of_paired_symbols {n : ℕ} (hn : n%8=2) (hs : Squarefree n)
    {Γ : Subgroup (GL (Fin 2) ℝ)} [Γ.IsArithmetic] (hw : Γ.strictWidthInfty=1)
    (F : CuspForm Γ 2) (Ω : ℂ)
    (hper : ∀ r : ℚ, ∃ c : ℚ, periodSymbol F (r:ℝ) + periodSymbol F (-(r:ℝ)) = c*Ω) :
    ∃ (H : Subgroup (GL (Fin 2) ℝ)) (hH : H.IsArithmetic) (_ : H.strictWidthInfty=1)
      (G : CuspForm H 2) (c : ℚ),
      (∀ m : ℕ, (qExpansion 1 G).coeff m = (weight n m:ℂ) * (qExpansion 1 F).coeff m) ∧
      (Real.sqrt n:ℂ)*ModularForm.L (by decide : (0:ℤ)<2) G 1 = c*Ω := by
  classical
  obtain ⟨d,hd⟩ : 2 ∣ n := by exact Nat.dvd_of_mod_eq_zero (by omega)
  subst n
  have hd4 : d%4=1 := by omega
  have hsd := hs.squarefree_of_dvd (dvd_mul_left d 2)
  let n := 2*d
  let χ := character n (by dsimp [n]; omega)
  letI : NeZero (4*n) := ⟨by dsimp [n]; omega⟩
  have he : χ.Even := character_even hd4
  obtain ⟨ε,hε,hg⟩ := gauss_sign (character_primitive hd4 hsd) (character_quadratic n _) he
  obtain ⟨H,hH,hW,G,hcf,hV,_⟩ := jacobi_twist_integral hn hs hw F
  let P (j : ZMod (4*n)) := periodSymbol F ((j.val:ℝ)/(4*n))
  let M (j : ZMod (4*n)) := periodSymbol F (-(j.val:ℝ)/(4*n))
  have hsym : ∑ j, χ j * P j = ∑ j, χ j * M j := by
    apply Fintype.sum_equiv (Equiv.neg _)
    intro j
    rw [Equiv.neg_apply,he.eval_neg]
    congr 1
    simpa only [P,M,Nat.cast_mul,Nat.cast_ofNat] using (reflected_symbol F hw j).symm
  choose c hc using hper
  let r (j : ZMod (4*n)) : ℚ := (j.val:ℚ)/(4*n)
  let C : ℚ := ∑ j : ZMod (4*n), (weight n j.val:ℚ)*c (r j)
  have hc' (j : ZMod (4*n)) : P j + M j = (c (r j):ℂ)*Ω := by
    simpa only [P,M,r,Rat.cast_div,Rat.cast_natCast,Rat.cast_mul,Rat.cast_ofNat,neg_div]
      using hc (r j)
  have hC : (2:ℂ) * (∑ j, χ j*P j) = C*Ω := by
    calc _ = (∑ j, χ j*P j) + ∑ j, χ j*M j := by rw [←hsym,two_mul]
         _ = ∑ j, χ j*(P j+M j) := by simp [mul_add,Finset.sum_add_distrib]
         _ = _ := by
           simp only [hc',C,Rat.cast_sum,Rat.cast_mul,Rat.cast_intCast,Finset.sum_mul,mul_assoc]
           rfl
  have hv : gaussSum χ ZMod.stdAddChar * ModularForm.L (by decide : (0:ℤ)<2) G 1 = ∑ j, χ j*P j := hV
  have hgs : (2:ℂ)*(Real.sqrt n:ℂ) = ε * gaussSum χ ZMod.stdAddChar := by
    have heq : (Real.sqrt (((4*n:ℕ):ℝ)):ℂ) = 2*(Real.sqrt n:ℂ) := by
      rw [Nat.cast_mul,Nat.cast_ofNat,Real.sqrt_mul (by norm_num : (0:ℝ) ≤ 4), Complex.ofReal_mul]
      norm_num
    rw [←heq]
    exact hg
  refine ⟨H,hH,hW,G,((ε:ℚ)*C/4),hcf,?_⟩
  change (Real.sqrt n:ℂ) * _ = _
  push_cast
  linear_combination (ModularForm.L (by decide : (0:ℤ)<2) G 1 / 2)*hgs +
    (ε:ℂ)/2*hv + (ε:ℂ)/4*hC

#print axioms jacobi_twist_integral
#print axioms rational_period_of_paired_symbols

end TunnellModularSymbol
