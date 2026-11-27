import TunnellFormalJet
import EllipticCurves.Mathlib.AdicFormalGroupLog

/-! # The p-series jet of an integral one-dimensional formal group -/

namespace TunnellFormalGroupHeight

open ChabautyColeman MvPowerSeries IsLocalRing IsDedekindDomain
  IsDedekindDomain.HeightOneSpectrum
open scoped PowerSeries

variable {R K : Type*} [CommRing R] [IsDedekindDomain R]
  [Field K] [Algebra R K] [IsFractionRing R K] {v : HeightOneSpectrum R}
  [CharZero K]

private theorem derivative_identity {O k : Type*} [CommRing O] [Field k] [CharZero k]
    (f : O →+* k) (hf : Function.Injective f) (Φ : FormalGroupLaw O Unit) (p:ℕ) :
    MvPowerSeries.subst (fun _:Unit=>Φ.mulSeries p) (Φ.diffMatrix⁻¹ () ()) *
      pderiv O () (Φ.mulSeries p) = p • Φ.diffMatrix⁻¹ () () := by
  apply FormalGroupLaw.map_injective_of_injective hf
  rw [map_mul,map_subst (Φ.hasSubst_mulSeries p),map_pderiv,map_nsmul,
    show (fun _:Unit => MvPowerSeries.map f (Φ.mulSeries p)) =
      (fun _:Unit => (Φ.map f).mulSeries p) from funext fun _ => Φ.map_mulSeries f p,
    Φ.map_mulSeries f p,
    show MvPowerSeries.map f (Φ.diffMatrix⁻¹ () ()) = (Φ.map f).diffMatrix⁻¹ () () by
      rw [Φ.diffMatrixInv_map]; rfl]
  exact (Φ.map f).subst_mulSeries_diffInv_mul_pderiv p

/-- The reduction of the multiplication-by-p series vanishes below degree p.
Its degree-p coefficient is the degree-(p−1) coefficient of the actual invariant differential. -/
theorem prime_jet (Φ : FormalGroupLaw (v.adicCompletionIntegers K) Unit)
    {p : ℕ} (hp:p.Prime) (hmem : (p:v.adicCompletionIntegers K) ∈ maximalIdeal _) :
    let ρ := residue (v.adicCompletionIntegers K)
    (∀ j < p, ρ (PowerSeries.coeff j (Φ.mulSeries p)) = 0) ∧
      ρ (PowerSeries.coeff p (Φ.mulSeries p)) =
        ρ (PowerSeries.coeff (p-1) (Φ.diffMatrix⁻¹ () ())) := by
  let O := v.adicCompletionIntegers K
  let ρ := residue O
  haveI : CharZero (v.adicCompletion K) :=
    charZero_of_injective_algebraMap (algebraMap K (v.adicCompletion K)).injective
  have hinj : Function.Injective (algebraMap O (v.adicCompletion K)) :=
    fun _ _ h => Subtype.ext h
  haveI : CharZero O := (algebraMap O (v.adicCompletion K)).charZero
  have hbelow (j:ℕ) (hj:j<p) : ρ (PowerSeries.coeff j (Φ.mulSeries p))=0 := by
    rcases Nat.eq_zero_or_pos j with rfl | hpos
    · simp only [PowerSeries.coeff_zero_eq_constantCoeff_apply]
      change ρ (MvPowerSeries.constantCoeff _) = 0
      rw [Φ.constantCoeff_mulSeries,map_zero]
    · apply (residue_eq_zero_iff _).mpr
      have hm := ChabautyColeman.coeff_mulSeries_mem_span Φ hp hmem
        (d:=Finsupp.single () j) (by simpa using Nat.not_dvd_of_pos_of_lt hpos hj)
      exact ((Ideal.span_singleton_le_iff_mem _).mpr hmem) hm
  refine ⟨hbelow,?_⟩
  apply TunnellFormalJet.invariant_coefficient ρ hp.pos _ _ (Φ.constantCoeff_mulSeries p) _ hbelow
  · have h := derivative_identity (algebraMap O (v.adicCompletion K)) hinj Φ p
    simpa only [nsmul_eq_mul, map_natCast, PowerSeries.subst_def, PowerSeries.derivative] using h
  · have h := congrArg (fun M => M () ()) Φ.diffMatrixInv_map_constantCoeff
    rw [PowerSeries.constantCoeff_eq]
    simpa using h

#print axioms prime_jet
end TunnellFormalGroupHeight
