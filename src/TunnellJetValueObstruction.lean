import TunnellOnePrimeUnitValues
import TunnellCMFirstValues
import TunnellPointCompletionTower
import TunnellCompletionPoints

/-! The genuine elliptic jet and norm-compatible arithmetic unit exclude a nonabelian Kummer character. -/
namespace TunnellJetValueObstruction
open NumberField IsDedekindDomain IsDedekindDomain.HeightOneSpectrum IsLocalRing
open WeierstrassCurve WeierstrassCurve.Affine TunnellKummer TunnellCoates TunnellAdicLocalization
open LocalClassFieldTheory LocalFieldTheory LocalFieldTheory.IsNonarchimedeanLocalField
open scoped Classical ValuativeRel TunnellAdicLocalField
noncomputable section
variable {F T D N:Type} [Field F] [Field T] [Field D] [Field N] [NumberField F] [NumberField T] [NumberField D] [NumberField N]
    [Algebra F T] [Algebra T D] [Algebra D N] [FiniteDimensional F T] [FiniteDimensional T D] [FiniteDimensional D N]
    [IsGalois F T] [IsGalois T D] [IsAbelianGalois D N] [dT:DecidableEq T]
variable (v:HeightOneSpectrum (𝓞 F)) (w:Fibre (L:=T) v) (u:Fibre (L:=D) w.1)
local notation "t" => finitePlaceExtensionEquivAbove (K:=D) (L:=N) (Subtype.val u) (chosenFinitePlaceExtension (L:=N) (Subtype.val u))
local notation "K" => adicCompletion F v
local notation "M" => adicCompletion T (Subtype.val w)
local notation "L" => adicCompletion D (Subtype.val u)
local notation "A" => adicCompletion N (Subtype.val t)
local notation "O" => adicCompletionIntegers T (Subtype.val w)
local instance : Algebra K M := (finitePlaceAdicCompletionMap F T v w).toAlgebra
local instance : Algebra M L := (finitePlaceAdicCompletionMap T D w.1 u).toAlgebra
local instance : Algebra L A := (finitePlaceAdicCompletionMap D N u.1 t).toAlgebra
local instance : Algebra F M := TunnellPointCompletionTower.direct v w
local instance : IsScalarTower F T M := TunnellPointCompletionTower.globalTower v w
local instance : IsScalarTower F K M := TunnellPointCompletionTower.localTower v w

theorem excludes {p:ℕ} [Fact p.Prime] (h₂:p≠2) (n:ℕ) (S:CurvePoints (E (n:F)) T)
    (a:T) (a₀:F) (hJ:TunnellCMFirstValues.JetValues n p ((E (n:F)).baseChange T) S w.1 a (algebraMap F T a₀))
    (x:(𝓞 D)ˣ) (hx:Algebra.norm T x.val.val=a) (unique:∀ u':Fibre («L»:=D) w.1,u'=u)
    (hC:∀ z:InfinitePlace D,z.IsComplex)
    (hu:∀ s:HeightOneSpectrum (𝓞 D),s≠u.val → ∀ t':HeightOneSpectrum (𝓞 N),t'.asIdeal.LiesOver s.asIdeal → t'.asIdeal.ramificationIdx (𝓞 D)=1)
    (d:Gal(M/K)) (k:ℕ) (c:(ZMod p)ˣ) (b:Additive Mˣ→+ZMod p)
    (hc:orderOf c=p-1) (hk:(k:ZMod p)=c)
    (hact:act (E (n:K)) d (TunnellCompletionPoints.point («K»:=K) («M»:=M) n S)=k • TunnellCompletionPoints.point n S)
    (hb:∃ z:𝒪[M]ˣ,b (Additive.ofMul (integerUnitsToFieldUnits M z))≠0)
    (hn:∀ z:Aˣ,b (Additive.ofMul (normUnits M L (normUnits L A z)))=0)
    (he:∀ z:Mˣ,b (Additive.ofMul (Units.map d.toMonoidHom z))=(c:ZMod p)*b (Additive.ofMul z)) : False := by
  have eqdT:dT=Classical.decEq T:=Subsingleton.elim _ _
  subst dT
  obtain ⟨hm,hE,Z,ρ,hP,hspan,hpow,y,y₀,der,hy,hy₀,hd,hjet⟩:=hJ
  letI:=hE
  haveI:=finitePlaceAdicCompletionMap_moduleFinite F T v w
  haveI:=TunnellAdicValuationExtension.hasExtension v w
  haveI:=TunnellAdicValuationExtension.integralClosure v w
  let f:=Units.map (algebraMap O M).toMonoidHom
  have h₁:b (Additive.ofMul (f y))=0:=TunnellOnePrimeUnitValues.primitive_value («N»:=N) w.1 u unique hC hu b hn x a hx y hy
  have hbase:((y₀:O):M)=algebraMap K M (algebraMap F K a₀):=hy₀.trans (finitePlaceAdicCompletionMap_coe F T v w a₀).symm
  have hfix:d (f y₀:M)=f y₀:=by change d ((y₀:O):M)=((y₀:O):M); rw [hbase,d.commutes]
  have h₀:=TunnellOnePrimeUnitValues.fixed_value h₂ b d c hc he (f y₀) hfix
  let V:=((E (n:F)).baseChange T).baseChange M
  have H : (E (n:K)).baseChange M=V := by ext <;> simp [V,E,WeierstrassCurve.baseChange,WeierstrassCurve.map]
  let S':=TunnellCompletionPoints.point («K»:=K) («M»:=M) n S
  have hZ:Point.equivOfEq H S'=formalPoint hm Z:=(TunnellCompletionPoints.map_model n S H).trans hP.symm
  have hv:=TunnellNormDescent.galois_valuation_compatible K M d
  have hz:=TunnellOnePrimeUnitValues.jet w.1 (E (n:K)) (E (n:O)) V hm H Z S' hZ ρ hspan hpow d hv k c hc hk hact b hb he y y₀ der hjet h₁ h₀
  exact (hd.map (ρ.toRingHom.comp (residue O))).ne_zero hz

#print axioms excludes
end
end TunnellJetValueObstruction
