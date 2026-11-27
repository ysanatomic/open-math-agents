import TunnellEisensteinRoot
import TunnellFormalPrimitive
import TunnellPrincipalPowers

/-! # The signed Hasse invariant at a primitive first division parameter -/

namespace TunnellPreparedHasse

open PowerSeries IsLocalRing
open scoped Polynomial

variable {A : Type*} {B : Type} [CommRing A] [IsDomain A] [IsLocalRing A]
    [CommRing B] [IsLocalRing B]

private lemma top_coeff {g U : A⟦X⟧} {P : A[X]} (h : g.IsWeierstrassFactorization P U) :
    residue A (coeff P.natDegree g) = residue A (constantCoeff U) := by
  let ρ := residue A
  have hmap : map ρ g = X^P.natDegree * map ρ U := by
    rw [h.eq_mul, map_mul, ← Polynomial.polynomial_map_coe]
    have hρ : P.map ρ = Polynomial.X^P.natDegree := h.isDistinguishedAt.map_eq_X_pow
    rw [hρ]
    simp
  have hc := congrArg (coeff (0+P.natDegree)) hmap
  rw [coeff_X_pow_mul] at hc
  simpa [ρ] using hc

/-- If a height-one primitive polynomial has root t, the residue of π/t^d
equals minus the first nonzero coefficient of its reduced division series. -/
theorem signed_unit (f : A →+* B) [IsLocalHom f] {π : A} (hπ : maximalIdeal A = Ideal.span {π})
    (hπ₀ : π ≠ 0) {g U : A⟦X⟧} {P : A[X]} (h : g.IsWeierstrassFactorization P U)
    (he : P.IsEisensteinAt (maximalIdeal A)) (hd : 0 < P.natDegree)
    (hg : constantCoeff g = π) (t : B) (ht : P.eval₂ f t = 0) :
    t ∈ maximalIdeal B ∧ ∃ u : Bˣ, (u:B) * t^P.natDegree = f π ∧
        residue B (u:B) = -residue B (f (coeff P.natDegree g)) := by
  obtain ⟨hmem,a,v,h₀,hpow,hres⟩ := TunnellEisensteinRoot.root_relation f hπ h.isDistinguishedAt.monic he hd t ht
  have ha : (a:A)*constantCoeff U=1 := by
    apply mul_left_cancel₀ hπ₀
    rw [←mul_assoc,←h₀,mul_one,←hg,h.eq_mul,map_mul]
    simp
  have hprod : residue B (v:B) * (-residue B (f (coeff P.natDegree g)))=1 := by
    rw [hres,neg_mul_neg]
    have hcoe := congrArg (ResidueField.map f) (top_coeff h)
    simp only [ResidueField.map_residue] at hcoe
    rw [hcoe,←map_mul,←map_mul,ha,map_one,map_one]
  refine ⟨hmem,v⁻¹,?_,?_⟩
  · rw [hpow,mul_left_comm]
    simp
  · have hx := congrArg (fun b : ResidueField B => residue B ((v⁻¹:Bˣ):B) * b) hprod
    rw [←mul_assoc,←map_mul,Units.inv_mul, map_one, one_mul,mul_one] at hx
    exact hx.symm

/-- At a non-anomalous first level with residue F_p, all level-p principal units
are p-th powers. The Hasse hypotheses are checked in the base residue field. -/
theorem principal_powers {p : ℕ} [Fact p.Prime] [CharZero A] [HenselianLocalRing B]
    (f : A →+* B) [IsLocalHom f] (hπ : maximalIdeal A = Ideal.span {(p:A)})
    (ρ : ResidueField B ≃+* ZMod p) {g U : A⟦X⟧} {P : A[X]} (h : g.IsWeierstrassFactorization P U)
    (he : P.IsEisensteinAt (maximalIdeal A)) (hd : P.natDegree=p-1) (hg : constantCoeff g = (p:A))
    (hH : residue A (coeff P.natDegree g) ≠ 1) (t : B) (ht : P.eval₂ f t = 0) (c : B) :
    ∃ y : B, (1+t*y)^p=1+t^p*c := by
  have hp : p.Prime := Fact.out
  obtain ⟨hm,u,hu,hur⟩ := signed_unit f hπ (Nat.cast_ne_zero.mpr hp.ne_zero) h he
    (by rw [hd]; have := hp.two_le; omega) hg t ht
  let r := ρ.toRingHom.comp (residue B)
  refine TunnellPrincipalPowers.pth_root_principal_of_residue r (ρ.surjective.comp residue_surjective) t (u:B) ?_ ?_ ?_ ?_ c
  · simp [r,(residue_eq_zero_iff t).mpr hm]
  · simpa [hd] using hu
  · exact ((u.isUnit.map r).ne_zero)
  · change 1+ρ (residue B (u:B)) ≠ 0
    rw [hur,map_neg,←sub_eq_add_neg,sub_ne_zero]
    intro hfalse
    apply hH
    apply (ResidueField.map f).injective
    apply ρ.injective
    simpa [ResidueField.map_residue] using hfalse.symm

#print axioms principal_powers
end TunnellPreparedHasse
