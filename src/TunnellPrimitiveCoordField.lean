import TunnellPadicPrimitiveFields
import TunnellLocalCMCoordDegree
import TunnellFormalQuarter
import TunnellFormalPrimaryCM

/-! # Comparing the degree of a primitive formal parameter and its global CM coordinate field -/
namespace TunnellPrimitiveCoordField
open IsLocalRing IsDedekindDomain IsDedekindDomain.HeightOneSpectrum WeierstrassCurve WeierstrassCurve.Affine
open TunnellCoates TunnellKummer TunnellCMTorsionField TunnellFormalQuarter TunnellGaussianEnd
open scoped Polynomial

noncomputable section

lemma param_in_coordField {R K F:Type} [CommRing R] [IsDedekindDomain R] [Field K] [Algebra R K] [IsFractionRing R K]
    {v:HeightOneSpectrum R} [Field F] [DecidableEq F] [Algebra F (v.adicCompletion K)] [DecidableEq (v.adicCompletion K)]
    (W:WeierstrassCurve F) [(W.baseChange (v.adicCompletion K)).IsElliptic]
    (W₀:WeierstrassCurve (v.adicCompletionIntegers K)) (hw:W₀.map (algebraMap _ _)=W.baseChange (v.adicCompletion K))
    (Z:W₀.formalGroupLaw.Points) :
    (((Z () : v.adicCompletionIntegers K) : v.adicCompletion K)) ∈ coordField W (formalPoint hw Z) := by
  let t : v.adicCompletionIntegers K := Z ()
  by_cases ht:t=0
  · change (t:v.adicCompletion K)∈_
    rw [ht]; exact (coordField W _).zero_mem
  rw [formalPoint_of_param_ne_zero hw ht]
  let w : v.adicCompletion K := W₀.wEval t
  have hw₀ : w≠0 := by dsimp [w]; exact_mod_cast W₀.wEval_ne_zero (Z ()).2 ht
  change (t:v.adicCompletion K)∈IntermediateField.adjoin F {↑t/w,-1/w}
  let A := IntermediateField.adjoin F {↑t/w,-1/w}
  have hX : (t:v.adicCompletion K)/w∈A := IntermediateField.subset_adjoin F _ (by simp)
  have hY : -1/w∈A := IntermediateField.subset_adjoin F _ (by simp)
  have he : (t:v.adicCompletion K) = -(↑t/w)/(-1/w) := by field_simp
  exact (congrArg (fun z : v.adicCompletion K => z∈A) he).mpr (A.div_mem (A.neg_mem hX) hY)

theorem equal_degrees {F K M:Type} [Field F] [Field K] [Field M] [CharZero F] [Algebra F ℂ]
    [Algebra F K] [Algebra F M] [Algebra K M] [IsScalarTower F K M] [DecidableEq F] [DecidableEq M]
    (n:ℕ) (hn:0<n) [(E (n:F)).IsElliptic] (i:F) (hi:i^2= -1) (hI:algebraMap F ℂ i=Complex.I)
    {p:ℕ} (hp:p.Prime) (h₂:p≠2) {a:GaussianInt} (ha:a.norm.natAbs=p) (r:ℕ)
    (P:CurvePoints (E (n:F)) M) (hk:cm (n:F) i hi (a^r) P=0) (hord:p^r • P=0)
    (t:M) (ht:t∈coordField (E (n:F)) P) (hd:(minpoly K t).natDegree=(p^r).totient) :
    Module.finrank F (coordField (E (n:F)) P)=(p^r).totient ∧
    ∃ T : CurvePoints (E (n:F)) (algebraicClosure F ℂ),
      cm (n:F) i hi (a^r) T=0 ∧ addOrderOf T=p^r ∧
      IsAbelianGalois F (coordField (E (n:F)) T) ∧
      Module.finrank F (coordField (E (n:F)) T)=(p^r).totient ∧
      Nonempty (coordField (E (n:F)) P ≃ₐ[F] coordField (E (n:F)) T) := by
  classical
  have hfin := TunnellLocalCMCoordDegree.finite_coord n (p^r) hn (pow_pos hp.pos _) P hord
  obtain ⟨T,hT,ho,hg,hf,hd',⟨f⟩⟩ := TunnellLocalCMCoordDegree.embeds_division_field n hn i hi hI hp h₂ ha r P hk
  let D := coordField (E (n:F)) P
  let z:D := ⟨t,ht⟩
  have hle : (p^r).totient≤Module.finrank F D := by
    rw [←hd]
    exact TunnellPreparedRootPlace.degree_lower (K:=K) D.val z
  have htD := LinearMap.finrank_le_finrank_of_injective (f:=f.toLinearMap) f.injective
  have h1 := le_antisymm (htD.trans hd') hle
  have h2 := le_antisymm hd' (hle.trans htD)
  refine ⟨h1,T,hT,ho,hg,h2,⟨AlgEquiv.ofBijective f ⟨f.injective,?_⟩⟩⟩
  exact (LinearMap.injective_iff_surjective_of_finrank_eq_finrank (f:=f.toLinearMap) (h1.trans h2.symm)).mp f.injective

#print axioms param_in_coordField
#print axioms equal_degrees
end
end TunnellPrimitiveCoordField
