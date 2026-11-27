import TunnellCompletionRestriction
import Mathlib.RingTheory.RamificationInertia.Inertia

/-! The residue field at every chosen torsion level is the prime field. -/
namespace TunnellResiduePrime
open NumberField IsLocalRing IsDedekindDomain IsDedekindDomain.HeightOneSpectrum
open TunnellPadicDivisionSeries TunnellLocalDivisibility
open scoped NumberField
noncomputable section

variable {F:Type} [Field F] [NumberField F] {p:ℕ} [Fact p.Prime]
local notation "A" => IntegerRing p
local notation "K₀" => Local p

theorem base (g:F→+*K₀) (s:TunnellRestrictedPlaces.Restriction (B:=A) g) :
    Nonempty ((𝓞 F ⧸ s.v.asIdeal)≃+*ZMod p) := by
  let e:ResidueField A≃+*ZMod p := (ResidueField.mapEquiv (localIntegralEquiv p)).trans PadicInt.residueField
  let f:𝓞 F ⧸ s.v.asIdeal →+* ResidueField A := Ideal.quotientMap (maximalIdeal A) s.ψ s.prime.le
  let h:=e.toRingHom.comp f
  have hi : Function.Injective h := e.injective.comp (Ideal.quotientMap_injective' s.prime.symm.le)
  have hs : Function.Surjective h := by
    intro x
    exact ⟨(x.val:𝓞 F ⧸ s.v.asIdeal),(map_natCast h _).trans (ZMod.natCast_zmod_val _)⟩
  exact ⟨RingEquiv.ofBijective h ⟨hi,hs⟩⟩

theorem above {D:Type} [Field D] [NumberField D] [Algebra F D] (v:HeightOneSpectrum (𝓞 F)) (w:HeightOneSpectrum (𝓞 D))
    [w.asIdeal.LiesOver v.asIdeal] (hf:w.asIdeal.inertiaDeg (𝓞 F)=1) (e:(𝓞 F ⧸ v.asIdeal)≃+*ZMod p) :
    Nonempty (ResidueField (w.adicCompletionIntegers D)≃+*ZMod p) := by
  let A₀:=𝓞 F ⧸ v.asIdeal
  let B:=𝓞 D ⧸ w.asIdeal
  letI : Field A₀:=Ideal.Quotient.field v.asIdeal
  letI : Field B:=Ideal.Quotient.field w.asIdeal
  have h : Module.finrank A₀ B=1 := (Ideal.inertiaDeg_eq_of_isMaximal v.asIdeal w.asIdeal).symm.trans hf
  let θ:=RingEquiv.ofBijective (algebraMap A₀ B) (Algebra.finrank_eq_one_iff_bijective_algebraMap.mp h)
  exact ⟨(w.residueFieldEquivAdicCompletionIntegers (K:=D)).symm.trans (θ.symm.trans e)⟩

theorem fixed {O:Type*} [CommRing O] [IsLocalRing O] (e:ResidueField O≃+*ZMod p) (δ:O≃+*O) (x:O) :
    e (residue O (δ x))=e (residue O x) := by
  let a:=e.symm.trans ((ResidueField.mapEquiv δ).trans e)
  have ha (z:ZMod p) : a z=z := by
    rw [←ZMod.natCast_zmod_val z,map_natCast]
  have h:=ha (e (residue O x))
  simpa [a,ResidueField.mapEquiv,ResidueField.map_residue] using h

#print axioms above
#print axioms fixed
end
end TunnellResiduePrime
