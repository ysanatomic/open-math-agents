import TunnellCMSpecializedJet
import TunnellCMEllipticNormTower

/-! The first jet of the arithmetic field elements obtained by evaluating the
global descended elliptic function at a primary torsion point and at zero. -/
namespace TunnellCMGlobalNormJet
open IntermediateField WeierstrassCurve WeierstrassCurve.Affine IsLocalRing IsDedekindDomain IsDedekindDomain.HeightOneSpectrum
open TunnellCoates TunnellKummer TunnellCMLemniscate TunnellCMCritical TunnellCMCriticalCoefficients
open TunnellCMIntegralSlope TunnellCMSpecializedJet TunnellCMCoefficientNorm TunnellFormalQuarter
open TunnellCMActualNormUnits TunnellCMEllipticNormTower
open scoped Classical NumberField
noncomputable section
local notation "B" => algebraicClosure ℚ ℂ
variable (K : Type) [Field K] [NumberField K] [Algebra K B] [DecidableEq K]
variable (n : ℕ) (hn : 0<n) {F : IntermediateField K B} (D : Data K n hn F) [FiniteDimensional K F]
local notation "W" => E (n:K)
local notation "N" => normalClosure K F B
local notation "G" => normFunction W D.u D.c (weights n hn)
variable {T : Type} [Field T] [NumberField T] [Algebra K T] [Algebra T B]
  [IsScalarTower K T B] [DecidableEq T]
variable (v : HeightOneSpectrum (𝓞 T))
local notation "O" => v.adicCompletionIntegers T
local notation "L" => v.adicCompletion T
local notation "ρ" => Ideal.Quotient.mk ((maximalIdeal O)^2)
variable [Algebra K (v.adicCompletion T)] [IsScalarTower K T (v.adicCompletion T)]

lemma formal_transport (S : CurvePoints W T)
    (hm : (E (n:O)).map (algebraMap O L)=((W).baseChange T).baseChange L)
    (he : (W).baseChange L=E ((n:O):L))
    [(E ((n:O):L)).IsElliptic] [(((W).baseChange T).baseChange L).IsElliptic]
    (Z : (E (n:O)).formalGroupLaw.Points) (hZ : (Z ():O)≠0)
    (hP : formalPoint hm Z=TunnellCMGlobalModelUnit.pointMap ((W).baseChange T) L S) :
    Point.equivOfEq he (Point.map (W' := (W).toAffine) (IsScalarTower.toAlgHom K T L) S)=toPoint (n:O) Z := by
  have eqn : ((W).baseChange T).baseChange L=E ((n:O):L) := hm.symm.trans (base_curve (n:O))
  have H := congrArg (Point.equivOfEq eqn) hP.symm
  rw [formalPoint_of_param_ne_zero hm hZ,Point.equivOfEq_some] at H
  change _=formalPoint (base_curve (n:O)) Z
  rw [formalPoint_of_param_ne_zero _ hZ,←H]
  cases S with
  | zero =>
    change Point.equivOfEq he (Point.map _ (0:CurvePoints W T))=Point.equivOfEq eqn (TunnellCMGlobalModelUnit.pointMap ((W).baseChange T) L 0)
    rw [map_zero,map_zero,map_zero,map_zero]
  | some x y h =>
    simp only [TunnellCMGlobalModelUnit.pointMap,AddMonoidHom.comp_apply,AddEquiv.coe_toAddMonoidHom,
      Point.equivOfEq_some,Point.map_some]
    rfl

theorem at_global_elements {p : ℕ} [Fact p.Prime] (e : N →ₐ[ℚ] ℚ_[p]) (C : Coordinates K n hn D p e)
    (f : ℚ_[p] →+* L) (h : ℤ_[p] →+* O) (hf : ∀ a : K, f (e (algebraMap K N a))=algebraMap K L a)
    (hc : ∀ z : ℤ_[p], (h z:L)=f z) (S : CurvePoints W T)
    (hm : (E (n:O)).map (algebraMap O L)=((W).baseChange T).baseChange L)
    [(E ((n:O):L)).IsElliptic] [(((W).baseChange T).baseChange L).IsElliptic]
    (Z : (E (n:O)).formalGroupLaw.Points) (hZ : (Z ():O)≠0)
    (hP : formalPoint hm Z=TunnellCMGlobalModelUnit.pointMap ((W).baseChange T) L S)
    (a a₀ : T) (ha : algebraMap T B a=G (Point.map (W' := (W).toAffine) (IsScalarTower.toAlgHom K T B) S))
    (h₀ : algebraMap T B a₀=G 0) :
    ∃ u u₀ : Oˣ, ((u:O):L)=algebraMap T L a ∧ ((u₀:O):L)=algebraMap T L a₀ ∧
      ρ ((u/u₀:Oˣ):O)=1+ρ (Z ():O)*ρ (h (firstCoefficient K n hn D C)) := by
  letI : IsAlgClosure T B := closed_over T
  letI : IsAlgClosed B := IsAlgClosure.isAlgClosed T
  have he : (W).baseChange L=E ((n:O):L) := by ext <;> simp [E,WeierstrassCurve.baseChange,WeierstrassCurve.map]
  let Q:=Point.map (W' := (W).toAffine) (IsScalarTower.toAlgHom K T L) S
  have H:=formal_transport K n v S hm he Z hZ hP
  obtain ⟨u,u₀,h₁,h₂,hj⟩:=expansion K n hn D v e C f h hf hc Z hZ Q he H
  let g:=embedding K e f hf
  have hi:=embedding_inj K e f hf
  have h₁' := TunnellCMLocalEvaluation.at_local_point W D.u D.c (weights n hn) g hi S a ha
  have h₂' := TunnellCMLocalEvaluation.at_local_point W D.u D.c (weights n hn) g hi (0:CurvePoints W T) a₀ (by simpa only [map_zero] using h₀)
  simp only [map_zero] at h₂'
  exact ⟨u,u₀,h₁.trans h₁'.symm,h₂.trans h₂'.symm,hj⟩

end
end TunnellCMGlobalNormJet
#print axioms TunnellCMGlobalNormJet.at_global_elements
