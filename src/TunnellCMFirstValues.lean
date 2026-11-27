import TunnellActualFirstPlace
import TunnellCMGlobalNormJet
import TunnellCMCoefficientCompletion

/-! The two values of the global elliptic function in the actual first
completion, together with the nonzero linear term of their quotient. -/
namespace TunnellCMFirstValues
open NumberField WeierstrassCurve WeierstrassCurve.Affine IntermediateField IsLocalRing
open IsDedekindDomain IsDedekindDomain.HeightOneSpectrum TunnellCoates TunnellKummer
open TunnellCMIntegralSlope TunnellCMCriticalCoefficients TunnellCMCoefficientCompletion
open TunnellCMCoefficientNorm TunnellCMActualNormUnits TunnellCMLemniscate TunnellCMCritical
open TunnellRestrictedPlaces TunnellPadicDivisionSeries
open scoped Classical NumberField
noncomputable section
local notation "B" => algebraicClosure ℚ ℂ

def JetValues {T : Type} [Field T] [NumberField T] [DecidableEq T] (n p : ℕ) (W : WeierstrassCurve T)
    (S : W.toAffine.Point) (w : HeightOneSpectrum (𝓞 T)) (a a₀ : T) : Prop :=
  let O:=w.adicCompletionIntegers T
  let L:=w.adicCompletion T
  ∃ (hm : (E (n:O)).map (algebraMap O L)=W.baseChange L) (he : (W.baseChange L).IsElliptic),
    letI:=he
    ∃ (Z : (E (n:O)).formalGroupLaw.Points) (ρ : ResidueField O ≃+* ZMod p),
      formalPoint hm Z=TunnellCMGlobalModelUnit.pointMap W L S ∧
      maximalIdeal O=Ideal.span {(Z ():O)} ∧
      (∀ c:O,∃ y:O,(1+(Z ():O)*y)^p=1+(Z ():O)^p*c) ∧
      ∃ (u u₀ : Oˣ) (d : O), ((u:O):L)=algebraMap T L a ∧ ((u₀:O):L)=algebraMap T L a₀ ∧ IsUnit d ∧
        let f:=Ideal.Quotient.mk ((maximalIdeal O)^2)
        f ((u/u₀:Oˣ):O)=1+f (Z ():O)*f d

variable (K : Type) [Field K] [NumberField K] [Algebra K B] [DecidableEq K]
variable (n : ℕ) (hn : 0<n) {F : IntermediateField K B} (D : Data K n hn F) [FiniteDimensional K F]
local notation "W" => E (n:K)
local notation "N" => normalClosure K F B
local notation "G" => normFunction W D.u D.c (weights n hn)
variable {T : Type} [Field T] [NumberField T] [Algebra K T] [Algebra T B] [IsScalarTower K T B] [DecidableEq T]

theorem values {p : ℕ} [Fact p.Prime] (e : N →ₐ[ℚ] ℚ_[p]) (C : Coordinates K n hn D p e)
    (hs : IsUnit (firstCoefficient K n hn D C))
    (v : Restriction («B»:=IntegerRing p) (padicMap.comp (e.toRingHom.comp (algebraMap K N))))
    (w : HeightOneSpectrum (𝓞 T)) [w.asIdeal.LiesOver v.v.asIdeal] (S : CurvePoints W T)
    (hS : TunnellActualFirstPlace.FirstLocalData n ((W).baseChange T) S w p)
    (a a₀ : T)
    (ha : algebraMap T B a=G (Point.map (W':=(W).toAffine) (IsScalarTower.toAlgHom K T B) S))
    (h₀ : algebraMap T B a₀=G 0) : JetValues n p ((W).baseChange T) S w a a₀ := by
  let O:=w.adicCompletionIntegers T
  let L:=w.adicCompletion T
  letI : Algebra K L:=((algebraMap T L).comp (algebraMap K T)).toAlgebra
  letI : IsScalarTower K T L:=.of_algebraMap_eq' rfl
  obtain ⟨hm,he,Z,ρ,hP,_,ht,hpow⟩:=hS
  letI : (((W).baseChange T).baseChange L).IsElliptic:=he
  have eqc : (((W).baseChange T).baseChange L)=E ((n:O):L) := hm.symm.trans (TunnellFormalQuarter.base_curve (n:O))
  letI : (E ((n:O):L)).IsElliptic:=eqc ▸ he
  have hz : (Z ():O)≠0 := by
    intro h
    exact IsDiscreteValuationRing.not_a_field O (ht.trans (Ideal.span_singleton_eq_bot.mpr h))
  obtain ⟨f,h,hf,hc⟩:=extensions (e.toRingHom.comp (algebraMap K N)) v w
  obtain ⟨u,u₀,hu,h₀',hj⟩:=TunnellCMGlobalNormJet.at_global_elements K n hn D w e C f h hf hc S hm Z hz hP a a₀ ha h₀
  exact ⟨hm,he,Z,ρ,hP,ht,hpow,u,u₀,h _,hu,h₀',hs.map h,hj⟩

end
end TunnellCMFirstValues
#print axioms TunnellCMFirstValues.values
