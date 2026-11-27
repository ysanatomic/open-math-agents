import TunnellGloballyRealizedDivision
import TunnellGlobalTotalRamification

/-! A single chosen ordinary place is totally ramified in every full primary torsion field. -/
namespace TunnellPrimaryTorsionPlace
open IsLocalRing IsDedekindDomain IsDedekindDomain.HeightOneSpectrum WithZero
open TunnellCoates TunnellKummer TunnellCMTorsionField TunnellGaussianEnd TunnellLocalDivisibility TunnellPadicDivisionSeries
open TunnellRestrictedPlaces
open scoped NumberField
variable {p:ℕ} [Fact p.Prime]
local notation "A" => IntegerRing p
local notation "K" => Local p
noncomputable section

def TotallyRamifiedAt {F:Type} [Field F] [NumberField F] (D:Type) [Field D] [Algebra F D]
    (v:HeightOneSpectrum (𝓞 F)) (d:ℕ) : Prop :=
  ∃ h:NumberField D, letI := h
    ∃ w:HeightOneSpectrum (𝓞 D), w.asIdeal.LiesOver v.asIdeal ∧
      w.asIdeal.ramificationIdx (𝓞 F)=d ∧ w.asIdeal.inertiaDeg (𝓞 F)=1 ∧
      ∀ w':HeightOneSpectrum (𝓞 D),w'.asIdeal.LiesOver v.asIdeal → w'=w

theorem split_levels {F:Type} [Field F] [NumberField F] [Algebra F ℂ] [Algebra F K] [DecidableEq F]
    {n m:ℕ} (hn:0<n) (hp:p=4*m+1) (hgood:¬p∣n) [(E (n:F)).IsElliptic]
    (j:F) (hj:j^2= -1) (hIC:algebraMap F ℂ j=Complex.I) (i:A) (hi:i^2= -1)
    (hij:algebraMap F K j=(i:K)) (a:GaussianInt) (ha:a.norm.natAbs=p) (hnorm:a.re^2+a.im^2=(p:ℤ))
    (hu:IsUnit ((a.re:A)-(a.im:A)*i)) :
    ∃ v:HeightOneSpectrum (𝓞 F),v.valuation F (p:F)=exp (-1:ℤ) ∧
      ∀ r:ℕ,∃ T:CurvePoints (E (n:F)) (algebraicClosure F ℂ),
        cm (n:F) j hj (a^(r+1)) T=0 ∧ addOrderOf T=p^(r+1) ∧
        IsAbelianGalois F (coordField (E (n:F)) T) ∧
        Module.finrank F (coordField (E (n:F)) T)=Nat.totient (p^(r+1)) ∧
        TotallyRamifiedAt (coordField (E (n:F)) T) v (Nat.totient (p^(r+1))) := by
  classical
  have hspan := (base_uniformizer (p:=p)).1
  have hpm : (p:A)∈maximalIdeal A := by rw [hspan]; exact Ideal.mem_span_singleton_self _
  obtain ⟨v⟩ := restrict (algebraMap F K) (Fact.out:p.Prime).ne_zero hpm
  have hb := uniformizer_restriction (algebraMap F K) v (Fact.out:p.Prime).ne_zero hspan
  refine ⟨v.v,hb,fun r => ?_⟩
  obtain ⟨T,ht,ho,hg,hd,P,s,g,t,u,hgC,hz,hrel⟩ :=
    TunnellGloballyRealizedDivision.split_level hn hp hgood j hj hIC i hi hij a ha hnorm hu r
  let D:=coordField (E (n:F)) T
  let B:=s.v.adicCompletionIntegers s.L
  haveI : FiniteDimensional F D := TunnellLocalCMCoordDegree.finite_coord n (p^(r+1)) hn
    (pow_pos (Fact.out:p.Prime).pos _) T (ho ▸ addOrderOf_nsmul_eq_zero T)
  haveI : NumberField D := NumberField.of_module_finite F D
  haveI : IsAbelianGalois F D := hg
  have hB : (p:B)∈maximalIdeal B := by
    rw [←map_natCast s.f p]; exact map_nonunit s.f _ hpm
  obtain ⟨w⟩ := restrict g (Fact.out:p.Prime).ne_zero hB
  have hw := restrict_liesOver (algebraMap F K) g v w s.embed s.f s.compat hgC
  have hval := equal_values g w t s.t hz u hrel
  exact ⟨T,ht,ho,hg,hd,‹NumberField D›,w.v,hw,TunnellGlobalTotalRamification.total v.v w.v hb hd t hval⟩

#print axioms split_levels
end
end TunnellPrimaryTorsionPlace
