import TunnellLocalKummerCharacter
import TunnellPointCompletionTower
import TunnellCompletionPoints
import TunnellJetValueObstruction

/-! A nonzero tame local character of the actual first torsion completion for a global division lift. -/
namespace TunnellAdicKummerCharacter
open NumberField IsDedekindDomain IsDedekindDomain.HeightOneSpectrum WeierstrassCurve WeierstrassCurve.Affine
open TunnellAdicLocalization TunnellCoates TunnellKummer TunnellCMTorsionField TunnellGaussianEnd
open LocalClassFieldTheory LocalFieldTheory LocalFieldTheory.IsNonarchimedeanLocalField
open scoped Classical ValuativeRel TunnellAdicLocalField
noncomputable section
private theorem mapped_sq {U V:Type} [Field U] [Field V] (f:U→+*V) (i:U) (hi:i^2= -1) : (f i)^2= -1 := by
  rw [←map_pow,hi,map_neg,map_one]
variable {F T D N:Type} [Field F] [Field T] [Field D] [Field N] [NumberField F] [NumberField T] [NumberField D] [NumberField N]
  [Algebra F T] [Algebra F D] [Algebra F N] [Algebra T D] [Algebra D N] [IsScalarTower F T D] [IsScalarTower F D N]
  [FiniteDimensional F T] [FiniteDimensional F D] [FiniteDimensional F N] [FiniteDimensional T D] [FiniteDimensional D N]
  [IsGalois F T] [IsAbelianGalois F D] [IsGalois F N] [Algebra F ℂ]
  [dF:DecidableEq F] [dT:DecidableEq T] [dD:DecidableEq D] [dN:DecidableEq N]
variable (v:HeightOneSpectrum (𝓞 F)) (w:Fibre (L:=T) v) (u:Fibre (L:=D) w.1) (t:Fibre (L:=N) u.1)
local notation "ud" => TunnellPointCompletionTower.comp v w u
local notation "td" => TunnellPointCompletionTower.comp v (TunnellPointCompletionTower.comp v w u) t
local notation "K" => adicCompletion F v
local notation "M" => adicCompletion T (Subtype.val w)
local notation "L" => adicCompletion D (Subtype.val u)
local notation "A" => adicCompletion N (Subtype.val t)
local instance : Algebra K M := (finitePlaceAdicCompletionMap F T v w).toAlgebra
local instance : Algebra K L := (finitePlaceAdicCompletionMap F D v ud).toAlgebra
local instance : Algebra K A := (finitePlaceAdicCompletionMap F N v td).toAlgebra
local instance : Algebra M L := (finitePlaceAdicCompletionMap T D w.1 u).toAlgebra
local instance : Algebra L A := (finitePlaceAdicCompletionMap D N u.1 t).toAlgebra
local instance : IsScalarTower K M L := TunnellAdicGenerators.tower v w u
local instance : IsScalarTower K L A := TunnellAdicGenerators.tower v ud t
local instance : Algebra F M := TunnellPointCompletionTower.direct v w
local instance : Algebra F L := TunnellPointCompletionTower.direct v ud
local instance : Algebra F A := TunnellPointCompletionTower.direct v td
local instance : IsScalarTower F T M := TunnellPointCompletionTower.globalTower v w
local instance : IsScalarTower F D L := TunnellPointCompletionTower.globalTower v ud
local instance : IsScalarTower F N A := TunnellPointCompletionTower.globalTower v td
local instance : IsScalarTower F K M := TunnellPointCompletionTower.localTower v w
local instance : IsScalarTower F K L := TunnellPointCompletionTower.localTower v ud
local instance : IsScalarTower F K A := TunnellPointCompletionTower.localTower v td

variable (n:ℕ) (hn:0<n) [(E (n:F)).IsElliptic] [(E (n:adicCompletion F v)).IsElliptic]
  (i:F) (hi:i^2= -1) (hI:algebraMap F ℂ i=Complex.I)
  {p r:ℕ} [Fact p.Prime] (h₂:p≠2) (hr:r≠0) (a:GaussianInt) (ha:a.norm.natAbs=p) (hnorm:a.re^2+a.im^2=(p:ℤ))
local notation "W" => E (n:F)
local notation "V" => E (n:K)
local notation "iK" => algebraMap F K i
local notation "iKsq" => mapped_sq (algebraMap F K) i hi
local notation "φ" => cm (n:F) i hi (a^r)
local notation "φK" => cm (n:K) iK iKsq (a^r)

include hn hI h₂ hr ha hnorm in
theorem character (uniq:∀ u':Fibre («L»:=D) v,u'=ud)
    (Z:CurvePoints W T) (hZ:cm (n:F) i hi a Z=0) (hz:addOrderOf Z=p)
    (S:CurvePoints W D) (hS:φ S=0) (ho:addOrderOf S=p^r) (hd:Module.finrank F D=(p^r).totient)
    {s z:D} (h:((W).baseChange D).toAffine.Nonsingular s z) (eqS:S=.some s z h) (hD:IntermediateField.adjoin F {s,z}=⊤)
    (Q:CurvePoints W N) {x y:N} (hh:((W).baseChange N).toAffine.Nonsingular x y) (eqQ:Q=.some x y hh)
    (hN:IntermediateField.adjoin D {x,y}=⊤) (P:CurvePoints W F) (hQ:φ Q=changeBase W P) (hnon:¬IsAbelianGalois K A) :
    ∃ (d:Gal(M/K)) (k:ℕ) (c:(ZMod p)ˣ) (b:Additive Mˣ→+ZMod p),
      orderOf c=p-1 ∧ (k:ZMod p)=c ∧ act V d (TunnellCompletionPoints.point («K»:=K) («M»:=M) n Z)=k • TunnellCompletionPoints.point n Z ∧
      (∃ z:𝒪[M]ˣ,b (Additive.ofMul (integerUnitsToFieldUnits M z))≠0) ∧
      (∀ z:Aˣ,b (Additive.ofMul (normUnits M L (normUnits L A z)))=0) ∧
      (∀ z:Mˣ,b (Additive.ofMul (Units.map d.toMonoidHom z))=(c:ZMod p)*b (Additive.ofMul z)) := by
  have eqdF:dF=Classical.decEq F:=Subsingleton.elim _ _
  subst dF
  have eqdT:dT=Classical.decEq T:=Subsingleton.elim _ _
  subst dT
  have eqdD:dD=Classical.decEq D:=Subsingleton.elim _ _
  subst dD
  have eqdN:dN=Classical.decEq N:=Subsingleton.elim _ _
  subst dN
  letI:IsGalois D N:=IsGalois.tower_top_of_isGalois F D N
  letI:IsGalois T D:=IsGalois.tower_top_of_isGalois F T D
  haveI : IsGalois K M := TunnellAdicLocalization.galois v w
  haveI : IsAbelianGalois K L := TunnellAdicGenerators.abelian v ud
  haveI : IsGalois K A := TunnellAdicLocalization.galois v td
  haveI : FiniteDimensional K M := finitePlaceAdicCompletionMap_moduleFinite F T v w
  haveI : FiniteDimensional K L := finitePlaceAdicCompletionMap_moduleFinite F D v ud
  haveI : FiniteDimensional M L := finitePlaceAdicCompletionMap_moduleFinite T D w.1 u
  haveI : FiniteDimensional L A := finitePlaceAdicCompletionMap_moduleFinite D N u.1 t
  haveI : Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation M) := TunnellAdicValuationExtension.hasExtension v w
  haveI : Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation L) := TunnellAdicValuationExtension.hasExtension v ud
  haveI : IsIntegralClosure 𝒪[M] 𝒪[K] M := TunnellAdicValuationExtension.integralClosure v w
  haveI : IsIntegralClosure 𝒪[L] 𝒪[K] L := TunnellAdicValuationExtension.integralClosure v ud
  let fZ:=TunnellCompletionPoints.point (F:=F) (D:=T) («K»:=K) («M»:=M) n
  let fS:=TunnellCompletionPoints.point (F:=F) (D:=D) («K»:=K) («M»:=L) n
  let fQ:=TunnellCompletionPoints.point (F:=F) (D:=N) («K»:=K) («M»:=A) n
  have hz':cm (n:K) iK iKsq a (fZ Z)=0:=by dsimp [fZ]; rw [←TunnellCompletionPoints.cm_point n i iK hi iKsq rfl,hZ,map_zero]
  have hs':φK (fS S)=0:=by dsimp [fS]; rw [←TunnellCompletionPoints.cm_point n i iK hi iKsq rfl,hS,map_zero]
  have hq':φK (fQ Q)=changeBase V (TunnellCompletionPoints.point n P):=by
    dsimp [fQ]; rw [←TunnellCompletionPoints.cm_point n i iK hi iKsq rfl,hQ,TunnellCompletionPoints.base_point]
  obtain ⟨_,_,hd'⟩:=TunnellAdicDecomposition.unique_action v ud uniq
  obtain ⟨h₁,e₁⟩:=TunnellCompletionPoints.some («K»:=K) («M»:=L) n h
  obtain ⟨h₂',e₂⟩:=TunnellCompletionPoints.some («K»:=K) («M»:=A) n hh
  exact TunnellLocalKummerCharacter.character n hn i iK hi iKsq rfl hI h₂ hr a ha hnorm (fZ Z) hz'
    ((addOrderOf_injective fZ (TunnellCompletionPoints.injective n) _).trans hz) (fS S) hs'
    ((addOrderOf_injective fS (TunnellCompletionPoints.injective n) _).trans ho) (hd'.trans hd) h₁ ((congrArg fS eqS).trans e₁)
    (TunnellAdicGenerators.generate v ud hD) (fQ Q) h₂' ((congrArg fQ eqQ).trans e₂) (TunnellAdicGenerators.generate u.1 t hN) _ hq' hnon

include hn hI h₂ hr ha hnorm in
theorem obstruction [IsAbelianGalois D N]
    (ht:t=finitePlaceExtensionEquivAbove («K»:=D) («L»:=N) u.val (chosenFinitePlaceExtension («L»:=N) u.val))
    (uniq:∀ u':Fibre («L»:=D) v,u'=ud) (unique:∀ u':Fibre («L»:=D) w.1,u'=u)
    (Z:CurvePoints W T) (hZ:cm (n:F) i hi a Z=0) (hz:addOrderOf Z=p)
    (S:CurvePoints W D) (hS:φ S=0) (ho:addOrderOf S=p^r) (hd:Module.finrank F D=(p^r).totient)
    {s z:D} (h:((W).baseChange D).toAffine.Nonsingular s z) (eqS:S=.some s z h) (hD:IntermediateField.adjoin F {s,z}=⊤)
    (Q:CurvePoints W N) {x y:N} (hh:((W).baseChange N).toAffine.Nonsingular x y) (eqQ:Q=.some x y hh)
    (hN:IntermediateField.adjoin D {x,y}=⊤) (P:CurvePoints W F) (hQ:φ Q=changeBase W P)
    (hbound:∀(Y:Type) [Field Y] [Algebra K Y] [FiniteDimensional K Y] (R:CurvePoints V Y),
      φK R=changeBase V (TunnellCompletionPoints.point (D:=F) («K»:=K) («M»:=K) n P) → ¬IsAbelianGalois K Y)
    (a₁:T) (a₀:F) (hJ:TunnellCMFirstValues.JetValues n p ((W).baseChange T) Z w.1 a₁ (algebraMap F T a₀))
    (U:(𝓞 D)ˣ) (hU:Algebra.norm T U.val.val=a₁) (hC:∀z:InfinitePlace D,z.IsComplex)
    (hu:∀ v':HeightOneSpectrum (𝓞 D),v'≠u.val → ∀ w':HeightOneSpectrum (𝓞 N),w'.asIdeal.LiesOver v'.asIdeal → w'.asIdeal.ramificationIdx (𝓞 D)=1) : False := by
  have eqdF:dF=Classical.decEq F:=Subsingleton.elim _ _
  subst dF
  have eqdT:dT=Classical.decEq T:=Subsingleton.elim _ _
  subst dT
  have eqdD:dD=Classical.decEq D:=Subsingleton.elim _ _
  subst dD
  have eqdN:dN=Classical.decEq N:=Subsingleton.elim _ _
  subst dN
  haveI : FiniteDimensional K A := finitePlaceAdicCompletionMap_moduleFinite F N v td
  let f:=TunnellCompletionPoints.point (F:=F) (D:=N) («K»:=K) («M»:=A) n
  have hq':φK (f Q)=changeBase V (TunnellCompletionPoints.point n P):=by
    dsimp [f]; rw [←TunnellCompletionPoints.cm_point n i iK hi iKsq rfl,hQ,TunnellCompletionPoints.base_point]
  have hnon:=hbound A (f Q) hq'
  subst t
  letI:IsGalois T D:=IsGalois.tower_top_of_isGalois F T D
  obtain ⟨d,k,c,b,hc,hk,hact,hb,hN',he⟩:=character v w u _ n hn i hi hI h₂ hr a ha hnorm uniq
    Z hZ hz S hS ho hd h eqS hD Q hh eqQ hN P hQ hnon
  exact TunnellJetValueObstruction.excludes v w u h₂ n Z a₁ a₀ hJ U hU unique hC hu d k c b hc hk hact hb hN' he

#print axioms obstruction
#print axioms character
end
end TunnellAdicKummerCharacter
