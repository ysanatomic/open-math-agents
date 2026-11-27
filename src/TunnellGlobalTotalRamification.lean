import TunnellRestrictedPlaces
import Mathlib.NumberTheory.RamificationInertia.Galois
import TunnellCMGoodDivisionField

/-! A primitive formal parameter of full degree forces a unique prime above the chosen split place. -/
namespace TunnellGlobalTotalRamification
open NumberField IsLocalRing IsDedekindDomain IsDedekindDomain.HeightOneSpectrum WithZero
open scoped NumberField
noncomputable section
variable {F D:Type*} [Field F] [NumberField F] [Field D] [NumberField D] [Algebra F D]
    [FiniteDimensional F D] [IsGalois F D]

theorem total (v:HeightOneSpectrum (𝓞 F)) (w:HeightOneSpectrum (𝓞 D))
    [w.asIdeal.LiesOver v.asIdeal] {p d:ℕ} (hbase:v.valuation F (p:F)=exp (-1:ℤ))
    (hd:Module.finrank F D=d) (t:D) (ht:(w.valuation D t)^d=w.valuation D (p:D)) :
    w.asIdeal.ramificationIdx (𝓞 F)=d ∧ w.asIdeal.inertiaDeg (𝓞 F)=1 ∧
      ∀ w':HeightOneSpectrum (𝓞 D),w'.asIdeal.LiesOver v.asIdeal → w'=w := by
  let G:=Gal(D/F)
  letI : IsGaloisGroup G (𝓞 F) (𝓞 D) := IsGaloisGroup.of_isFractionRing _ _ _ F D
  let e:=w.asIdeal.ramificationIdx (𝓞 F)
  have he : v.asIdeal.ramificationIdx' w.asIdeal=e := Ideal.ramificationIdx'_eq_ramificationIdx _ _ v.ne_bot
  have h:=valuation_liesOver D v w (p:F)
  rw [hbase,map_natCast (algebraMap F D) p,he,←ht] at h
  have hh:=congrArg (WithZero.log : ℤᵐ⁰→ℤ) h
  rw [log_pow,log_pow,log_exp,Int.nsmul_eq_mul,Int.nsmul_eq_mul] at hh
  have hdiv : d∣e := Int.natCast_dvd_natCast.mp ⟨-log (w.valuation D t),by linarith⟩
  have hcard:=Ideal.ncard_primesOver_mul_ramificationIdxIn_mul_inertiaDegIn v.asIdeal (𝓞 D) G
  rw [Ideal.ramificationIdxIn_eq_ramificationIdx v.asIdeal w.asIdeal G,Ideal.inertiaDegIn_eq_inertiaDeg v.asIdeal w.asIdeal G,
    show Nat.card G=Module.finrank F D from IsGalois.card_aut_eq_finrank F D,hd] at hcard
  change _*(e*_)=d at hcard
  have heq : e=d := Nat.dvd_antisymm (by rw [←hcard]; exact dvd_mul_of_dvd_right (dvd_mul_right _ _) _) hdiv
  rw [heq] at hcard
  have hd₀ : 0<d := hd ▸ Module.finrank_pos
  have hprod : (v.asIdeal.primesOver (𝓞 D)).ncard*w.asIdeal.inertiaDeg (𝓞 F)=1 := by
    apply Nat.eq_of_mul_eq_mul_left hd₀
    simpa only [mul_one,mul_left_comm,mul_assoc] using hcard
  have hc := Nat.eq_one_of_mul_eq_one_right hprod
  have hf := Nat.eq_one_of_mul_eq_one_left hprod
  obtain ⟨q,hq⟩ := Set.ncard_eq_one.mp hc
  have hmem : w.asIdeal∈v.asIdeal.primesOver (𝓞 D) := ⟨inferInstance,inferInstance⟩
  rw [hq,Set.mem_singleton_iff] at hmem
  refine ⟨heq,hf,fun w' h' => ?_⟩
  have hmem' : w'.asIdeal∈v.asIdeal.primesOver (𝓞 D) := ⟨inferInstance,h'⟩
  rw [hq,Set.mem_singleton_iff] at hmem'
  exact HeightOneSpectrum.ext (hmem'.trans hmem.symm)

#print axioms total
end
end TunnellGlobalTotalRamification
