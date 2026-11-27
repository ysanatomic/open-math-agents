import TunnellPrimaryTorsionPlace
import TunnellFormalAtPlace
import TunnellCompletionUniformizer
import TunnellResiduePrime
import TunnellFirstPlacePowers

/-! First-level local data in the actual completion of the global primary torsion field. -/
namespace TunnellActualFirstPlace
set_option maxHeartbeats 1600000
open NumberField IsLocalRing IsDedekindDomain IsDedekindDomain.HeightOneSpectrum WithZero
open WeierstrassCurve WeierstrassCurve.Affine TunnellCoates TunnellKummer TunnellGaussianEnd TunnellCMTorsionField
open TunnellLocalDivisibility TunnellPadicDivisionSeries TunnellPreparedRootPlace TunnellRestrictedPlaces TunnellTameParameter
open scoped NumberField Polynomial Classical
noncomputable section
variable {p:ℕ} [Fact p.Prime]
local notation "A" => IntegerRing p
local notation "K₀" => Local p

private lemma model {F D O M:Type*} [Field F] [Field D] [CommRing O] [Field M]
    [Algebra F D] [Algebra D M] [Algebra O M] (n:ℕ) :
    (E (n:O)).map (algebraMap O M)=((E (n:F)).baseChange D).baseChange M := by
  ext <;> simp [E,WeierstrassCurve.map,WeierstrassCurve.baseChange]

def FirstLocalData {D:Type} [Field D] [NumberField D] [DecidableEq D] (n:ℕ) (W:WeierstrassCurve D)
    (S:W.toAffine.Point) (w:HeightOneSpectrum (𝓞 D)) (p:ℕ) : Prop :=
  let O:=w.adicCompletionIntegers D
  let M:=w.adicCompletion D
  ∃ (hW:(E (n:O)).map (algebraMap O M)=W.baseChange M) (he:(W.baseChange M).IsElliptic),
    letI:=he
    ∃ (Z:(E (n:O)).formalGroupLaw.Points) (ρ:ResidueField O≃+*ZMod p),
      formalPoint hW Z=TunnellCMGlobalModelUnit.pointMap W M S ∧
      ((Z ():O):M)=algebraMap D M (parameter S) ∧ maximalIdeal O=Ideal.span {(Z ():O)} ∧
      (∀ c:O,∃ y:O,(1+(Z ():O)*y)^p=1+(Z ():O)^p*c)

theorem first_level {F:Type} [Field F] [NumberField F] [DecidableEq F] [Algebra F ℂ] [Algebra F K₀]
    {n m:ℕ} (hn:0<n) (hp:p=4*m+1) (hgood:¬p∣n) [(E (n:F)).IsElliptic]
    (j:F) (hj:j^2= -1) (hIC:algebraMap F ℂ j=Complex.I)
    (i:A) (hi:i^2= -1) (hij:algebraMap F K₀ j=(i:K₀))
    (a:GaussianInt) (ha:a.norm.natAbs=p) (hnorm:a.re^2+a.im^2=(p:ℤ)) (hu:IsUnit ((a.re:A)-(a.im:A)*i))
    (v:Restriction (B:=A) (algebraMap F K₀)) :
    ∃ T:CurvePoints (E (n:F)) (algebraicClosure F ℂ),cm (n:F) j hj a T=0 ∧ addOrderOf T=p ∧
      let D:=coordField (E (n:F)) T
      IsAbelianGalois F D ∧ Module.finrank F D=p-1 ∧ ∃ hD:NumberField D,letI:=hD
        ∃ (S:CurvePoints (E (n:F)) D) (w:HeightOneSpectrum (𝓞 D)),
          coordField (E (n:F)) S=⊤ ∧ cm (n:F) j hj a S=0 ∧ addOrderOf S=p ∧ w.asIdeal.LiesOver v.v.asIdeal ∧
          w.asIdeal.ramificationIdx (𝓞 F)=p-1 ∧ w.asIdeal.inertiaDeg (𝓞 F)=1 ∧
          (∀ w':HeightOneSpectrum (𝓞 D),w'.asIdeal.LiesOver v.v.asIdeal → w'=w) ∧
          FirstLocalData n ((E (n:F)).baseChange D) S w p := by
  classical
  have hprime:= (Fact.out:p.Prime)
  have hpm : (p:A)∈maximalIdeal A := by rw [(base_uniformizer (p:=p)).1]; exact Ideal.mem_span_singleton_self _
  have hb:=uniformizer_restriction (algebraMap F K₀) v hprime.ne_zero (base_uniformizer (p:=p)).1
  obtain ⟨T,hT,ho,hg,hd,P,U,hfac,hdeg,heis,hH,s,g,S,u,hgC,hgen,hS,hord,hOrigin,ht,hrel⟩ :=
    TunnellGloballyRealizedDivision.split_point hn hp hgood j hj hIC i hi hij a ha hnorm hu 0
  simp only [Nat.zero_add,pow_one,Nat.totient_prime hprime] at hT ho hd hdeg hS hord hrel
  let D:=coordField (E (n:F)) T
  let B:=s.v.adicCompletionIntegers s.L
  let N:=s.v.adicCompletion s.L
  haveI : FiniteDimensional F D := TunnellLocalCMCoordDegree.finite_coord n p hn hprime.pos T (ho ▸ addOrderOf_nsmul_eq_zero T)
  haveI : NumberField D := NumberField.of_module_finite F D
  haveI : IsAbelianGalois F D := hg
  haveI : CharZero N := charZero_of_injective_ringHom g.injective
  haveI : CharZero B := (algebraMap B N).charZero
  have hB : (p:B)∈maximalIdeal B := by rw [←map_natCast s.f p]; exact map_nonunit s.f _ hpm
  obtain ⟨w⟩ := restrict g hprime.ne_zero hB
  haveI hw := restrict_liesOver (algebraMap F K₀) g v w s.embed s.f s.compat hgC
  have hv:=equal_values g w (parameter S) s.t ht u hrel
  obtain ⟨her,hf,huniq⟩:=TunnellGlobalTotalRamification.total v.v w.v hb hd (parameter S) hv
  obtain ⟨z,hz,hspan,u₀,hu₀⟩:=TunnellCompletionUniformizer.uniformizer v.v w.v hb her (parameter S) hv
  obtain ⟨ρ₀⟩:=TunnellResiduePrime.base (algebraMap F K₀) v
  obtain ⟨ρ⟩:=TunnellResiduePrime.above v.v w.v hf ρ₀
  obtain ⟨G,_,hG,hGv⟩:=TunnellCompletionRestriction.embedding s.v g w
  obtain ⟨H,hHloc,hHG⟩:=TunnellCompletionUniformizer.integral_embedding w.v s.v G w.pos hGv
  let O:=w.v.adicCompletionIntegers D
  let M:=w.v.adicCompletion D
  have hHz : H z=s.t := (IsFractionRing.injective B N) ((hHG z).trans ((congrArg G hz).trans ((hG (parameter S)).trans ht)))
  have hW : (E (n:O)).map (algebraMap O M)=((E (n:F)).baseChange D).baseChange M := model n
  let W:=(E (n:F)).baseChange D
  haveI : W.IsElliptic:=inferInstanceAs (((E (n:F)).map (algebraMap F D)).IsElliptic)
  haveI : (W.baseChange M).IsElliptic:=inferInstanceAs ((W.map (algebraMap D M)).IsElliptic)
  have hOrig:=TunnellFormalAtPlace.restrict_origin s.v g w W S hOrigin
  obtain ⟨Z,hZ,hZz⟩:=TunnellFormalAtPlace.parameter_at w.v W (E (n:O)) hW S hOrig z hz
  refine ⟨T,hT,ho,hg,hd,‹NumberField D›,S,w.v,hgen,hS,hord,hw,her,hf,huniq,hW,‹(W.baseChange M).IsElliptic›,Z,ρ,hZ,?_,?_,?_⟩
  · rw [hZz]; exact hz
  · rw [hZz]; exact hspan
  · rw [hZz]
    have hzt : z∈maximalIdeal O := hspan ▸ Ideal.mem_span_singleton_self _
    exact TunnellFirstPlacePowers.powers n s.f H ρ hfac heis hdeg hH z u₀ hu₀ hzt (hHz ▸ s.root)

#print axioms first_level
end
end TunnellActualFirstPlace
