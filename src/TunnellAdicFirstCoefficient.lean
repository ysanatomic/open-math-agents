import TunnellFirstPlaceDetection
import TunnellOnePrimeCharacter
import TunnellAdicValuationExtension

/-! The first coefficient of a global norm in the tame torsion completion must vanish. -/
namespace TunnellAdicFirstCoefficient
open WeierstrassCurve WeierstrassCurve.Affine NumberField IsDedekindDomain IsDedekindDomain.HeightOneSpectrum
open IsLocalRing TunnellKummer TunnellTameParameter TunnellAdicLocalField LocalClassFieldTheory LocalFieldTheory
open LocalFieldTheory.IsNonarchimedeanLocalField
open scoped ValuativeRel Classical TunnellAdicLocalField
noncomputable section
variable {D:Type} [Field D] [NumberField D] (w:HeightOneSpectrum (𝓞 D))
local notation "M" => adicCompletion D w
local notation "O" => adicCompletionIntegers D w

private lemma parameter_eq_model {B:Type} [Field B] {W V:WeierstrassCurve B} (h:W=V) (P:W.toAffine.Point) :
    parameter (Point.equivOfEq h P)=parameter P := by cases h; rfl

theorem vanishes {F:Type} [Field F] [Algebra F M] [FiniteDimensional F M] (W:WeierstrassCurve F)
    {p:ℕ} [Fact p.Prime] (W₀:WeierstrassCurve O) (V:WeierstrassCurve M) (hV:W₀.map (algebraMap O M)=V) [V.IsElliptic]
    (H:W.baseChange M=V) (Z:W₀.formalGroupLaw.Points) (P:CurvePoints W M) (hZ:Point.equivOfEq H P=formalPoint hV Z)
    (ρ:ResidueField O≃+*ZMod p) (hspan:maximalIdeal O=Ideal.span {(Z ():O)})
    (hpow:∀ x:O,∃y:O,(1+(Z ():O)*y)^p=1+(Z ():O)^p*x)
    (d:Gal(M/F)) (hv:SemilinearValuationCompatible M M d.toRingEquiv) (k:ℕ) (q:(ZMod p)ˣ)
    (hq:orderOf q=p-1) (hk:(k:ZMod p)=q) (hact:act W d P=k • P)
    (b:Additive Mˣ→+ZMod p) (hb:∃ u:𝒪[M]ˣ,b (Additive.ofMul (integerUnitsToFieldUnits M u))≠0)
    (he:∀u:Mˣ,b (Additive.ofMul (Units.map d.toMonoidHom u))=(q:ZMod p)*b (Additive.ofMul u))
    {c:Oˣ} {l:O} (hc:(c:O)=1+(Z ():O)*l)
    (hn:b (Additive.ofMul (Units.map (algebraMap O M).toMonoidHom c))=0) : ρ (residue O l)=0 := by
  let e:O≃+*O:=RingEquiv.restrict d.toRingEquiv (adicCompletionIntegers D w).toSubring
    (adicCompletionIntegers D w).toSubring (fun x=>by
      change x∈O ↔ d x∈O
      rw [←mem_integers_iff w,←mem_integers_iff w]
      change ValuativeRel.valuation M x≤1 ↔ ValuativeRel.valuation M (d x)≤1
      rw [TunnellKummerArtinCharacter.stable_valuation d hv])
  let uMap:=Units.map (algebraMap O M).toMonoidHom
  let b':Additive Oˣ→+ZMod p:=b.comp uMap.toAdditive
  have hparam : parameter P=((Z ():O):M):=(parameter_eq_model H P).symm.trans ((congrArg parameter hZ).trans (parameter_formal hV Z))
  have hδ : ((e (Z ():O):O):M)=parameter (k • formalPoint hV Z) := by
    change d ((Z ():O):M)=_
    have hg : d (parameter P)=parameter (act W d P):=(parameter_map d.toAlgHom W P).symm
    rw [←hparam,hg,hact,←hZ,←map_nsmul,parameter_eq_model]
  apply TunnellFirstPlaceDetection.detects_at_point w hV Z ρ hspan hpow e k hδ q hq hk b' _ _ hc hn
  · obtain ⟨u,hu⟩:=hb
    exact ⟨Units.mapEquiv (integers w).toMulEquiv u,hu⟩
  · intro x
    exact he (uMap x)

#print axioms vanishes
end
end TunnellAdicFirstCoefficient
