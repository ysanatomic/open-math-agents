import TunnellCompletionRestriction
import TunnellLocalGood
import Mathlib.NumberTheory.Padics.HeightOneSpectrum

/-! Compatible maps of p-adic numbers and p-adic integers to the completion
of a division field above the prescribed split base place. -/
namespace TunnellCMCoefficientCompletion
open NumberField IsLocalRing IsDedekindDomain IsDedekindDomain.HeightOneSpectrum
open TunnellLocalDivisibility TunnellPadicDivisionSeries TunnellRestrictedPlaces
open scoped NumberField Classical
noncomputable section
variable {p : ℕ} [Fact p.Prime]
local notation "A" => IntegerRing p
local notation "Kp" => Local p
def padicMap : ℚ_[p] →+* Kp := (Padic.adicCompletionEquiv ℤ ⟨p,Fact.out⟩).toAlgEquiv.toRingHom

theorem extensions {F D : Type} [Field F] [NumberField F] [Field D] [NumberField D]
    [Algebra F D] (g : F →+* ℚ_[p])
    (v : Restriction (B:=A) ((padicMap (p:=p)).comp g)) (w : HeightOneSpectrum (𝓞 D))
    [w.asIdeal.LiesOver v.v.asIdeal] :
    ∃ (f : ℚ_[p] →+* w.adicCompletion D) (h : ℤ_[p] →+* w.adicCompletionIntegers D),
      (∀ x : F, f (g x)=algebraMap D _ (algebraMap F D x)) ∧
      ∀ z : ℤ_[p], (h z : w.adicCompletion D)=f z := by
  obtain ⟨e,_,he,hv⟩ := TunnellCompletionRestriction.base_completion _ v
  let l := (adicCompletionExtension F D v.v w).comp (e.symm.toRingHom.comp (padicMap (p:=p)))
  have hi (z : ℤ_[p]) : e.symm (padicMap (p:=p) z) ∈ v.v.adicCompletionIntegers F := by
    have h := hv (e.symm (padicMap (p:=p) z))
    rw [e.apply_symm_apply] at h
    have hz : padicMap (p:=p) z∈(place p).adicCompletionIntegers ℚ := by
      rw [show padicMap (p:=p) z=((PadicInt.adicCompletionIntegersEquiv ℤ ⟨p,Fact.out⟩ z:A):Kp) from
        (PadicInt.coe_adicCompletionIntegersEquiv_apply ℤ ⟨p,Fact.out⟩ z).symm]
      exact Subtype.property _
    change Valued.v (padicMap (p:=p) z)≤1 at hz
    change Valued.v (e.symm (padicMap (p:=p) z))≤1
    rw [h] at hz
    exact (pow_le_one_iff_of_nonneg zero_le v.pos.ne').mp hz
  let b := (e.symm.toRingHom.comp ((padicMap (p:=p)).comp (algebraMap ℤ_[p] ℚ_[p]))).codRestrict
    (v.v.adicCompletionIntegers F).toSubring hi
  refine ⟨l,(adicCompletionIntegersExtension F D v.v w).comp b,?_,fun _ => rfl⟩
  intro x
  change adicCompletionExtension F D v.v w (e.symm (((padicMap (p:=p)).comp g) x))=_
  rw [←he,e.symm_apply_apply]
  exact adicCompletionExtension_coe F D v.v w x

end
end TunnellCMCoefficientCompletion
#print axioms TunnellCMCoefficientCompletion.extensions
