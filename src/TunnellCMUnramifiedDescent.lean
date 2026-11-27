import TunnellCMIntegralModelInertia
import ClassFieldTheory.AlgebraicNumberTheory.Completion.UnramifiedComparison.IdealToCompletion

/-! Descent of unramifiedness across a fixed extension of degree less than p. -/
namespace TunnellCMUnramifiedDescent
open IsDedekindDomain NumberField
open AlgebraicNumberTheory.Valuations
open scoped NumberField
noncomputable section
variable {D N : Type} [Field D] [Field N] [NumberField D] [NumberField N] [Algebra D N]

theorem index_dvd [FiniteDimensional D N] [IsGalois D N]
    (v : HeightOneSpectrum (𝓞 D)) (w : HeightOneSpectrum (𝓞 N)) [w.asIdeal.LiesOver v.asIdeal] :
    w.asIdeal.ramificationIdx (𝓞 D) ∣ Module.finrank D N := by
  letI : IsGaloisGroup (N ≃ₐ[D] N) (𝓞 D) (𝓞 N) := IsGaloisGroup.of_isFractionRing _ _ _ D N
  letI : Finite ((𝓞 D) ⧸ v.asIdeal) := Ring.HasFiniteQuotients.finiteQuotient v.ne_bot
  letI : PerfectField v.asIdeal.ResidueField := PerfectField.ofFinite
  rw [← Ideal.ramificationIdxIn_eq_ramificationIdx v.asIdeal w.asIdeal (N ≃ₐ[D] N),
    ← Ideal.card_inertia_eq_ramificationIdxIn (G := N ≃ₐ[D] N) v.asIdeal w.asIdeal,
    ← IsGalois.card_aut_eq_finrank D N]
  exact (w.asIdeal.inertia (N ≃ₐ[D] N)).card_subgroup_dvd_card

theorem index_le [FiniteDimensional D N] (v : HeightOneSpectrum (𝓞 D)) (w : HeightOneSpectrum (𝓞 N))
    [w.asIdeal.LiesOver v.asIdeal] : w.asIdeal.ramificationIdx (𝓞 D)≤Module.finrank D N := by
  classical
  letI : Fintype (v.asIdeal.primesOver (𝓞 N)) := (Algebra.QuasiFinite.finite_primesOver v.asIdeal).fintype
  let q : v.asIdeal.primesOver (𝓞 N) := ⟨w.asIdeal,inferInstance,inferInstance⟩
  calc
    _ ≤ w.asIdeal.ramificationIdx (𝓞 D)*w.asIdeal.inertiaDeg (𝓞 D) :=
      Nat.le_mul_of_pos_right _ (w.asIdeal.inertiaDeg_pos (𝓞 D))
    _ ≤ ∑ u : v.asIdeal.primesOver (𝓞 N), u.val.ramificationIdx (𝓞 D)*u.val.inertiaDeg (𝓞 D) :=
      Finset.single_le_sum (f := fun u : v.asIdeal.primesOver (𝓞 N) => u.val.ramificationIdx (𝓞 D)*u.val.inertiaDeg (𝓞 D))
        (fun _ _ => Nat.zero_le _) (Finset.mem_univ q)
    _ = Module.finrank D N :=
      (Ideal.sum_ramification_inertia_eq_finrank v.asIdeal (𝓞 N)).trans (IsFractionRing.finrank_eq (𝓞 D) D (𝓞 N) N).symm

theorem descend [FiniteDimensional D N] [IsGalois D N] {F M : Type} [Field F] [NumberField F]
    [Field M] [NumberField M] [Algebra D F] [Algebra N M] [Algebra F M] [Algebra D M]
    [IsScalarTower D F M] [IsScalarTower D N M] [FiniteDimensional D F]
    (v : HeightOneSpectrum (𝓞 D)) (w : HeightOneSpectrum (𝓞 N)) (u : HeightOneSpectrum (𝓞 F))
    (t : HeightOneSpectrum (𝓞 M)) [w.asIdeal.LiesOver v.asIdeal] [u.asIdeal.LiesOver v.asIdeal]
    [t.asIdeal.LiesOver w.asIdeal] [t.asIdeal.LiesOver u.asIdeal]
    {p r : ℕ} (hp : p.Prime) (hsmall : Module.finrank D F<p)
    (hpow : Module.finrank D N ∣ p^r) (hunram : t.asIdeal.ramificationIdx (𝓞 F)=1) :
    w.asIdeal.ramificationIdx (𝓞 D)=1 := by
  have ht := Ideal.ramificationIdx_tower (R := 𝓞 D) w.asIdeal t.asIdeal
  have ht' := Ideal.ramificationIdx_tower (R := 𝓞 D) u.asIdeal t.asIdeal
  rw [hunram,mul_one] at ht'
  have le' : w.asIdeal.ramificationIdx (𝓞 D)∣u.asIdeal.ramificationIdx (𝓞 D) := ⟨_,ht'.symm.trans ht⟩
  have hpos' := u.asIdeal.ramificationIdx_pos (𝓞 D)
  have ub := (Nat.le_of_dvd hpos' le').trans (index_le v u)
  have hw := (index_dvd v w).trans hpow
  by_contra h
  obtain ⟨q,hq,hd⟩ := Nat.exists_prime_and_dvd h
  have hqp := hq.dvd_of_dvd_pow (hd.trans hw)
  have eq := (Nat.prime_dvd_prime_iff_eq hq hp).mp hqp
  have hpos := Nat.pos_of_dvd_of_pos hw (pow_pos hp.pos r)
  exact (Nat.not_le_of_lt (ub.trans_lt hsmall)) (eq ▸ Nat.le_of_dvd hpos hd)

theorem chosen [FiniteDimensional D N] [IsGalois D N] (v : HeightOneSpectrum (𝓞 D))
    (h : ∀ w : HeightOneSpectrum (𝓞 N), w.asIdeal.LiesOver v.asIdeal → w.asIdeal.ramificationIdx (𝓞 D)=1) :
    ChosenFinitePlaceIsUnramified (K := D) (L := N) v := by
  apply chosenFinitePlaceIsUnramified_of_centre_ramificationIdx_eq_one
  let w := chosenFinitePlaceExtension (L := N) v
  let t := finitePlaceExtensionCentre (K := D) (L := N) v w
  letI : t.asIdeal.LiesOver v.asIdeal := finitePlaceExtensionCentre_liesOver v w
  rw [Ideal.ramificationIdx'_eq_ramificationIdx v.asIdeal t.asIdeal v.ne_bot]
  exact h t inferInstance

end
end TunnellCMUnramifiedDescent
#print axioms TunnellCMUnramifiedDescent.descend
#print axioms TunnellCMUnramifiedDescent.chosen
