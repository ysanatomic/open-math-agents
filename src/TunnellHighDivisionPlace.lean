import TunnellActualFirstPlace
import TunnellGeometricPrimaryKernel

/-! The high field, its primitive point, and the specified lower place at every level. -/
namespace TunnellHighDivisionPlace
open NumberField IsLocalRing IsDedekindDomain IsDedekindDomain.HeightOneSpectrum WithZero
open WeierstrassCurve WeierstrassCurve.Affine TunnellCoates TunnellKummer TunnellGaussianEnd TunnellCMTorsionField
open TunnellLocalDivisibility TunnellPadicDivisionSeries TunnellPreparedRootPlace TunnellRestrictedPlaces TunnellTameParameter
open scoped NumberField Polynomial Classical
noncomputable section
variable {p:ℕ} [Fact p.Prime]
local notation "A" => IntegerRing p
local notation "K" => Local p
variable {F:Type} [Field F] [NumberField F] [DecidableEq F] [Algebra F ℂ] [Algebra F (Local p)]
variable {n m:ℕ} (hn:0<n) (hp:p=4*m+1) (hgood:¬p∣n) [(E (n:F)).IsElliptic]
variable (i:F) (hi:i^2= -1) (hI:algebraMap F ℂ i=Complex.I)
variable (j:IntegerRing p) (hj:j^2= -1) (hij:algebraMap F (Local p) i=(j:Local p))
variable (a:GaussianInt) (ha:a.norm.natAbs=p) (hnorm:a.re^2+a.im^2=(p:ℤ))
variable (hu:IsUnit ((a.re:IntegerRing p)-(a.im:IntegerRing p)*j)) (v:Restriction (B:=IntegerRing p) (algebraMap F (Local p)))
local notation "W" => E (n:F)

theorem coordinates {G H:Type} [Field G] [Field H] [Algebra G H] [DecidableEq H]
    (V:WeierstrassCurve G) (S:CurvePoints V H) (hS:S≠0) (h:coordField V S=⊤) :
    ∃ x y:H,∃ hh:(V.baseChange H).toAffine.Nonsingular x y,S=.some x y hh ∧ IntermediateField.adjoin G {x,y}=⊤ := by
  cases S with
  | zero=>exact (hS rfl).elim
  | some x y hh=>exact ⟨x,y,hh,rfl,h⟩

include hn hp hgood hI hj hij ha hnorm hu in
theorem high (r:ℕ) :
    ∃ T:CurvePoints W (algebraicClosure F ℂ),cm (n:F) i hi (a^(r+1)) T=0 ∧ addOrderOf T=p^(r+1) ∧
      let D:=coordField W T
      IsAbelianGalois F D ∧ Module.finrank F D=(p^(r+1)).totient ∧ ∃ hD:NumberField D,letI:=hD
        ∃ (S:CurvePoints W D) (w:HeightOneSpectrum (𝓞 D)),
          coordField W S=⊤ ∧ cm (n:F) i hi (a^(r+1)) S=0 ∧ addOrderOf S=p^(r+1) ∧ w.asIdeal.LiesOver v.v.asIdeal ∧
          w.asIdeal.ramificationIdx (𝓞 F)=(p^(r+1)).totient ∧ w.asIdeal.inertiaDeg (𝓞 F)=1 ∧
          (∀ w':HeightOneSpectrum (𝓞 D),w'.asIdeal.LiesOver v.v.asIdeal → w'=w) := by
  classical
  have hprime:= (Fact.out:p.Prime)
  have hpm : (p:A)∈maximalIdeal A := by rw [(base_uniformizer (p:=p)).1]; exact Ideal.mem_span_singleton_self _
  have hb:=uniformizer_restriction (algebraMap F K) v hprime.ne_zero (base_uniformizer (p:=p)).1
  obtain ⟨T,hT,ho,hg,hd,P,U,hfac,hdeg,heis,hH,s,g,S,u,hgC,hgen,hS,hord,hOrigin,ht,hrel⟩ :=
    TunnellGloballyRealizedDivision.split_point hn hp hgood i hi hI j hj hij a ha hnorm hu r
  let D:=coordField W T
  let B:=s.v.adicCompletionIntegers s.L
  let N:=s.v.adicCompletion s.L
  let d:=p^(r+1)
  haveI : FiniteDimensional F D := TunnellLocalCMCoordDegree.finite_coord n d hn (pow_pos hprime.pos _)
    T (by change (p^(r+1)) • T=0; rw [←ho]; exact addOrderOf_nsmul_eq_zero T)
  haveI : NumberField D := NumberField.of_module_finite F D
  haveI : IsAbelianGalois F D := hg
  have hB : (p:B)∈maximalIdeal B := by rw [←map_natCast s.f p]; exact map_nonunit s.f _ hpm
  obtain ⟨w⟩ := restrict g hprime.ne_zero hB
  haveI hw := restrict_liesOver (algebraMap F K) g v w s.embed s.f s.compat hgC
  have hv:=equal_values g w (parameter S) s.t ht u hrel
  exact ⟨T,hT,ho,hg,hd,‹NumberField D›,S,w.v,hgen,hS,hord,hw,TunnellGlobalTotalRamification.total v.v w.v hb hd (parameter S) hv⟩

include hn hI ha hnorm in
theorem nested (h₂:p≠2) (r:ℕ) (Z T:CurvePoints W (algebraicClosure F ℂ)) (hz:cm (n:F) i hi a Z=0)
    (ht:cm (n:F) i hi (a^(r+1)) T=0) (ho:addOrderOf T=p^(r+1)) : coordField W Z≤coordField W T := by
  have hs (X:CurvePoints W (algebraicClosure F ℂ)) : baseI (n:F) i hi (baseI (n:F) i hi X)= -X := by
    haveI:((W).baseChange (algebraicClosure F ℂ)).IsElliptic:=inferInstanceAs (((W).map (algebraMap F (algebraicClosure F ℂ))).IsElliptic)
    exact quarter_sq (base_E _) _ _ X
  have hz':cm (n:F) i hi (a^(r+1)) Z=0:=by
    rw [show cm (n:F) i hi (a^(r+1)) Z=(cm (n:F) i hi a)^[r+1] Z from (TunnellLocalCMCoordDegree.endo_iterate _ hs a _ Z).symm,
      Function.iterate_succ_apply,hz]
    exact Function.iterate_fixed (map_zero _) r
  obtain ⟨k,rfl⟩:=AddSubgroup.mem_zmultiples_iff.mp
    (TunnellGeometricPrimaryKernel.generates_with n hn i hi hI (Fact.out:p.Prime) h₂ a ha hnorm _ T ht ho Z hz')
  exact TunnellLocalCMCoordDegree.coord_le W ((rationalPoints W (coordField W T)).zsmul_mem (point_rational W T) k)

#print axioms high
#print axioms nested
end
end TunnellHighDivisionPlace
