import TunnellLocalElliptic
import TunnellAuxPrime
import EllipticCurves.WeierstrassFormalGroup.Reduction

/-! Torsion at a nonanomalous split rational prime of good reduction. -/

namespace TunnellLocalDivisibility

open WeierstrassCurve TunnellCoates IsDedekindDomain IsLocalRing

variable {p : ℕ} [Fact p.Prime]

/-- The maximal ideal at the rational prime p has absolute ramification index one. -/
lemma simple_ramification {O : Type*} [CommRing O] [IsLocalRing O] (e : O ≃+* ℤ_[p])
    (hp : 2<p) : (p:O)∈maximalIdeal O ∧ (p:O)∉maximalIdeal O^(p-1) := by
  constructor
  · apply (Ideal.apply_mem_of_equiv_iff (f:=e)).mp
    simp only [map_natCast,IsLocalRing.map_ringEquiv_maximalIdeal e,PadicInt.maximalIdeal_eq_span_p,
      Ideal.mem_span_singleton,dvd_refl]
  · intro h
    have he := Ideal.mem_map_of_mem e h
    rw [map_natCast,Ideal.map_pow,IsLocalRing.map_ringEquiv_maximalIdeal e,PadicInt.maximalIdeal_eq_span_p,
      Ideal.span_singleton_pow] at he
    have hv := (PadicInt.mem_span_pow_iff_le_valuation _ (show (p:ℤ_[p])≠0 by exact_mod_cast (Fact.out:p.Prime).ne_zero) _).mp he
    rw [PadicInt.valuation_p] at hv
    omega

open scoped Classical in
/-- Good reduction transfers absence of p-torsion on the reduction to the whole local curve. -/
theorem not_p_power_torsion {R K : Type*} [CommRing R] [IsDedekindDomain R] [Field K]
    [CharZero K] [Algebra R K] [IsFractionRing R K] {v : HeightOneSpectrum R}
    {W₀ : WeierstrassCurve (v.adicCompletionIntegers K)} [W₀.IsElliptic]
    {W : Affine (v.adicCompletion K)} [W.IsElliptic]
    (hW : W₀.map (algebraMap (v.adicCompletionIntegers K) (v.adicCompletion K))=W)
    (e : v.adicCompletionIntegers K ≃+* ℤ_[p]) (hp : 2<p)
    (hord : ¬p ∣ Nat.card (Affine.adicRedCurve W₀).Point)
    (r : ℕ) (P : W.Point) (hP : p^r • P=0) : P=0 := by
  have hfin : IsOfFinAddOrder P := isOfFinAddOrder_iff_nsmul_eq_zero.mpr
    ⟨p^r,pow_pos (Fact.out:p.Prime).pos _,hP⟩
  obtain ⟨hpm,hpa⟩ := simple_ramification e hp
  have h := Affine.addOrderOf_adicRed hW (Fact.out:p.Prime) hpm hpa hfin
  have hh := addOrderOf_dvd_natCard (Affine.adicRed hW P)
  rw [h] at hh
  have dd := Nat.dvd_gcd (addOrderOf_dvd_of_nsmul_eq_zero hP) hh
  rw [(((Fact.out:p.Prime).coprime_iff_not_dvd.mpr hord).pow_left r).gcd_eq_one,Nat.dvd_one,
    AddMonoid.addOrderOf_eq_one_iff] at dd
  exact dd

end TunnellLocalDivisibility
