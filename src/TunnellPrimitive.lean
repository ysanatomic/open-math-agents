import TunnellTwistCharacter

/-! The Jacobi character of conductor 8d, for squarefree d congruent to one modulo four. -/

namespace TunnellTwistCharacter

lemma character_quadratic (n : ℕ) (hn : n ≠ 0) : (character n hn).IsQuadratic := by
  intro a
  change (weight n a.val : ℂ) = 0 ∨ (weight n a.val : ℂ) = 1 ∨ (weight n a.val : ℂ) = -1
  by_cases ha : Odd a.val
  · rw [weight, if_pos ha]
    exact_mod_cast jacobiSym.trichotomy n a.val
  · simp [weight,ha]

lemma weight_two_mul {d a : ℕ} (hd : d%4=1) (ha : Odd a) :
    weight (2*d) a = ZMod.χ₈ a * jacobiSym a d := by
  rw [weight,if_pos ha,Nat.cast_mul,Nat.cast_ofNat,jacobiSym.mul_left,jacobiSym.at_two ha,
    jacobiSym.quadratic_reciprocity_one_mod_four hd ha]

lemma character_even {d : ℕ} (hd : d%4=1) :
    (character (2*d) (by omega)).Even := by
  let a := 8*d - 1
  have hz : (-1 : ZMod (4*(2*d))) = (a : ℕ) := by
    dsimp [a]
    rw [Nat.cast_sub (by omega), show 8*d = 4*(2*d) by ring]
    simp
  change character (2*d) _ (-1) = 1
  rw [hz, character_apply_nat, weight_two_mul hd (Nat.odd_iff.mpr (by dsimp [a]; omega))]
  have hj : jacobiSym (a:ℤ) d = jacobiSym (-1) d := by
    apply jacobiSym.mod_left'
    dsimp [a]
    rw [Nat.cast_sub (by omega)]
    push_cast
    apply Int.modEq_iff_dvd.mpr
    exact ⟨-8,by ring⟩
  rw [hj,jacobiSym.at_neg_one (Nat.odd_iff.mpr (by omega)),ZMod.χ₄_nat_mod_four,hd,
    ZMod.χ₈_nat_mod_eight, show a%8 = 7 by dsimp [a]; omega]
  exact_mod_cast (by decide : ZMod.χ₈ (7:ℕ) * ZMod.χ₄ (1:ℕ) = 1)

lemma primitive_of_witness {N : ℕ} [NeZero N] (χ : DirichletCharacter ℂ N)
    (hw : ∀ p : ℕ, p.Prime → p ∣ N → ∃ a : ℕ, a ≡ 1 [MOD N/p] ∧ χ a = -1) :
    χ.IsPrimitive := by
  change χ.conductor = N
  by_contra h
  obtain ⟨q,heq⟩ := χ.conductor_dvd_level
  have hq : q ≠ 1 := by rintro rfl; simp_all
  obtain ⟨p,hp,r,hr⟩ := Nat.exists_prime_and_dvd hq
  have hn : N = (χ.conductor*r)*p := heq.trans (by rw [hr]; ring)
  have hdiv : N/p = χ.conductor*r := (congrArg (· / p) hn).trans (Nat.mul_div_cancel _ hp.pos)
  obtain ⟨a,ha,hval⟩ := hw p hp (hn ▸ dvd_mul_left _ _)
  have hunit : IsUnit (a : ZMod N) := by
    by_contra hu
    rw [χ.map_nonunit hu] at hval
    norm_num at hval
  have hsmall : (a : ZMod χ.conductor) = 1 := by
    have h := ha.of_dvd (show χ.conductor ∣ N/p by rw [hdiv]; exact dvd_mul_right _ _)
    simpa only [Nat.cast_one] using (ZMod.natCast_eq_natCast_iff _ _ _).mpr h
  have hc := ((ZMod.isUnit_iff_coprime a N).mp hunit).isCoprime
  have hv := DirichletCharacter.changeLevel_eq_cast_of_dvd' χ.primitiveCharacter χ.conductor_dvd_level hc
  rw [χ.changeLevel_primitiveCharacter] at hv
  simp only [Int.cast_natCast] at hv
  rw [hsmall,map_one,hval] at hv
  norm_num at hv

lemma jacobi_congr {a b d : ℕ} (h : a ≡ b [MOD d]) : jacobiSym a d = jacobiSym b d := by
  apply jacobiSym.mod_left'
  exact_mod_cast h

lemma primitive_witness {d : ℕ} (hd : d%4=1) (hs : Squarefree d)
    {p : ℕ} (hp : p.Prime) (hpN : p ∣ 4*(2*d)) :
    ∃ a : ℕ, a ≡ 1 [MOD 4*(2*d)/p] ∧ weight (2*d) a = -1 := by
  have hd0 : 0 < d := by omega
  by_cases ht : p = 2
  · subst p
    refine ⟨4*d+1, ?_, ?_⟩
    · rw [show 4*(2*d)/2 = 4*d by omega]
      simp [Nat.ModEq]
    · rw [weight_two_mul hd (Nat.odd_iff.mpr (by omega)),ZMod.χ₈_nat_mod_eight,
        show (4*d+1)%8=5 by omega, jacobi_congr (b:=1) (by simp [Nat.ModEq]),
        Nat.cast_one,jacobiSym.one_left,mul_one]
      decide
  have h8 : p.Coprime 8 := by
    have hc := hp.coprime_iff_not_dvd.mpr (fun h => ht ((Nat.prime_dvd_prime_iff_eq hp Nat.prime_two).mp h))
    exact hc.pow_right 3
  have hpd : p ∣ d := (hp.dvd_mul.mp (show p ∣ 8*d by rwa [show 8*d = 4*(2*d) by ring])).resolve_left
    (hp.coprime_iff_not_dvd.mp h8)
  obtain ⟨v,hv⟩ := hpd
  have hpv : p.Coprime v := Nat.coprime_of_squarefree_mul (hv ▸ hs)
  have hv0 : v ≠ 0 := by rintro rfl; simp_all
  letI : Fact p.Prime := ⟨hp⟩
  obtain ⟨b,hb⟩ := quadraticChar_exists_neg_one (F := ZMod p) (by simpa only [ZMod.ringChar_zmod_n] using ht)
  obtain ⟨a,hab,ha1⟩ := Nat.chineseRemainder (Nat.coprime_mul_iff_right.mpr ⟨h8,hpv⟩) b.val 1
  have ht8 : a ≡ 1 [MOD 8] := ha1.of_dvd (dvd_mul_right ..)
  have hv1 : a ≡ 1 [MOD v] := ha1.of_dvd (dvd_mul_left ..)
  have ha : Odd a := Nat.odd_iff.mpr (ht8.of_dvd (by decide : 2 ∣ 8))
  have hj : jacobiSym a p = -1 := by
    rw [←jacobiSym.legendreSym.to_jacobiSym,legendreSym]
    simpa only [ZMod.natCast_eq_natCast_iff, Int.cast_natCast,
      (ZMod.natCast_eq_natCast_iff _ _ _).mpr hab,ZMod.natCast_zmod_val] using hb
  refine ⟨a, ?_, ?_⟩
  · convert ha1 using 1
    rw [hv,show 4*(2*(p*v)) = (8*v)*p by ring, Nat.mul_div_cancel _ hp.pos]
  · rw [weight_two_mul hd ha,ZMod.χ₈_nat_mod_eight,show a%8=1 from ht8,hv,
      jacobiSym.mul_right' _ hp.ne_zero hv0,hj,jacobi_congr hv1]
    simp

theorem character_primitive {d : ℕ} (hd : d%4=1) (hs : Squarefree d) :
    (character (2*d) (by omega)).IsPrimitive := by
  letI : NeZero (4*(2*d)) := ⟨by omega⟩
  apply primitive_of_witness
  intro p hp hpn
  obtain ⟨a,ha,hw⟩ := primitive_witness hd hs hp hpn
  refine ⟨a,ha,?_⟩
  rw [character_apply_nat,hw]
  norm_num

#print axioms character_primitive

end TunnellTwistCharacter
