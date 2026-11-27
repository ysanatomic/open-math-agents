import TunnellAdicGlobalUnitNorm
import TunnellAdicNormComparison
import TunnellAdicFirstCoefficient
import TunnellCMJetDetection

/-! The primitive elliptic value and the base value are both annihilated by the first-place character. -/
namespace TunnellOnePrimeUnitValues
open WeierstrassCurve WeierstrassCurve.Affine NumberField IsDedekindDomain IsDedekindDomain.HeightOneSpectrum IsLocalRing
open AlgebraicNumberTheory.Valuations LocalFieldTheory LocalClassFieldTheory TunnellKummer TunnellAdicLocalization
open LocalFieldTheory.IsNonarchimedeanLocalField
open scoped ValuativeRel Classical TunnellAdicLocalField
noncomputable section
variable {T D N:Type} [Field T] [NumberField T] [Field D] [NumberField D] [Field N] [NumberField N]
  [Algebra T D] [FiniteDimensional T D] [IsGalois T D] [Algebra D N] [FiniteDimensional D N] [IsAbelianGalois D N]
variable (v:HeightOneSpectrum (𝓞 T)) (w:Fibre («L»:=D) v)
local notation "M" => adicCompletion T v
local notation "L" => adicCompletion D (Subtype.val w)
local notation "O" => adicCompletionIntegers T v
local notation "wN" => finitePlaceExtensionEquivAbove (K:=D) («L»:=N) (Subtype.val w) (chosenFinitePlaceExtension («L»:=N) (Subtype.val w))
local notation "A" => adicCompletion N (Subtype.val wN)
local instance : Algebra M L := (finitePlaceAdicCompletionMap T D v w).toAlgebra
local instance : Algebra L A := (finitePlaceAdicCompletionMap D N w.val wN).toAlgebra

theorem primitive_value {p:ℕ} [Fact p.Prime] (unique:∀ w':Fibre («L»:=D) v,w'=w)
    (hC:∀ z:InfinitePlace D,z.IsComplex)
    (hu:∀ s:HeightOneSpectrum (𝓞 D),s≠w.val → ∀ t:HeightOneSpectrum (𝓞 N),t.asIdeal.LiesOver s.asIdeal → t.asIdeal.ramificationIdx (𝓞 D)=1)
    (b:Additive Mˣ→+ZMod p) (hn:∀y:Aˣ,b (Additive.ofMul (normUnits M L (normUnits L A y)))=0)
    (u:(𝓞 D)ˣ) (x:T) (hx:Algebra.norm T (TunnellGlobalUnits.fieldUnit D u:D)=x) (c:Oˣ) (hc:((c:O):M)=algebraMap T M x) :
    b (Additive.ofMul (Units.map (algebraMap O M).toMonoidHom c))=0 := by
  obtain ⟨y,hy⟩:=TunnellAdicGlobalUnitNorm.norm_at («L»:=N) w.val hC hu u
  have hnorm:=TunnellAdicNormComparison.norm_unit v w unique (TunnellGlobalUnits.fieldUnit D u)
  have equ : normUnits M L (normUnits L A y)=Units.map (algebraMap O M).toMonoidHom c := by
    rw [hy,hnorm]
    apply Units.ext
    change algebraMap T M (Algebra.norm T (TunnellGlobalUnits.fieldUnit D u:D))=((c:O):M)
    rw [hx,hc]
  rw [←equ,hn]

theorem fixed_value {F C:Type} [Field F] [Field C] [Algebra F C] {p:ℕ} [Fact p.Prime] (h₂:p≠2)
    (b:Additive Cˣ→+ZMod p) (d:Gal(C/F)) (q:(ZMod p)ˣ) (hq:orderOf q=p-1)
    (he:∀u:Cˣ,b (Additive.ofMul (Units.map d.toMonoidHom u))=(q:ZMod p)*b (Additive.ofMul u))
    (u:Cˣ) (hu:d (u:C)=u) : b (Additive.ofMul u)=0 := by
  have hq₁:(q:ZMod p)≠1:=by
    intro h
    have h':q=1:=Units.ext h
    rw [h',orderOf_one] at hq
    have hp:=(Fact.out:p.Prime).two_le
    omega
  have hh:=he u
  rw [show Units.map d.toMonoidHom u=u from Units.ext hu] at hh
  exact (mul_eq_zero.mp (show ((q:ZMod p)-1)*b (Additive.ofMul u)=0 by linear_combination -hh)).resolve_left (sub_ne_zero.mpr hq₁)

theorem jet {F:Type} [Field F] [Algebra F M] [FiniteDimensional F M] (W:WeierstrassCurve F)
    {p:ℕ} [Fact p.Prime] (W₀:WeierstrassCurve O) (V:WeierstrassCurve M) (hV:W₀.map (algebraMap O M)=V) [V.IsElliptic]
    (H:W.baseChange M=V) (Z:W₀.formalGroupLaw.Points) (P:CurvePoints W M) (hZ:Point.equivOfEq H P=formalPoint hV Z)
    (ρ:ResidueField O≃+*ZMod p) (hspan:maximalIdeal O=Ideal.span {(Z ():O)})
    (hpow:∀ x:O,∃ y:O,(1+(Z ():O)*y)^p=1+(Z ():O)^p*x)
    (d:Gal(M/F)) (hv:SemilinearValuationCompatible M M d.toRingEquiv) (k:ℕ) (q:(ZMod p)ˣ)
    (hq:orderOf q=p-1) (hk:(k:ZMod p)=q) (hact:act W d P=k • P)
    (b:Additive Mˣ→+ZMod p) (hb:∃u:𝒪[M]ˣ,b (Additive.ofMul (integerUnitsToFieldUnits M u))≠0)
    (he:∀u:Mˣ,b (Additive.ofMul (Units.map d.toMonoidHom u))=(q:ZMod p)*b (Additive.ofMul u))
    (u u₀:Oˣ) (der:O) (hj:let f:=Ideal.Quotient.mk ((maximalIdeal O)^2); f ((u/u₀:Oˣ):O)=1+f (Z ():O)*f der)
    (hu:b (Additive.ofMul (Units.map (algebraMap O M).toMonoidHom u))=0)
    (h₀:b (Additive.ofMul (Units.map (algebraMap O M).toMonoidHom u₀))=0) : ρ (residue O der)=0 := by
  obtain ⟨l,hl,hres⟩:=TunnellCMJetDetection.lift_coefficient ((u/u₀:Oˣ):O) (Z ():O) der hspan hj
  have hratio : b (Additive.ofMul (Units.map (algebraMap O M).toMonoidHom (u/u₀)))=0 := by
    rw [map_div]
    let f:=Units.map (algebraMap O M).toMonoidHom
    change b (Additive.ofMul (f u)-Additive.ofMul (f u₀))=0
    rw [map_sub]
    exact (congrArg₂ (·-·) hu h₀).trans (sub_zero 0)
  rw [←hres]
  exact TunnellAdicFirstCoefficient.vanishes v W W₀ V hV H Z P hZ ρ hspan hpow d hv k q hq hk hact b hb he hl hratio

#print axioms jet
#print axioms primitive_value
#print axioms fixed_value
end
end TunnellOnePrimeUnitValues
