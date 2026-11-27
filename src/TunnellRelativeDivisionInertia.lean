import TunnellConjugatePrimeIndex
import TunnellCMChangeBaseField
import TunnellLocalCMCoordDegree

/-! Unramifiedness at the other p-adic places directly from the defining primary division equation. -/
namespace TunnellRelativeDivisionInertia
open NumberField IsDedekindDomain IsDedekindDomain.HeightOneSpectrum WeierstrassCurve WeierstrassCurve.Affine
open TunnellCoates TunnellKummer TunnellCMTorsionField TunnellGaussianEnd TunnellGaussianPrimeIdeal
open scoped Classical
noncomputable section
variable {F D N:Type} [Field F] [Field D] [Field N] [NumberField F] [NumberField D] [NumberField N]
  [Algebra F D] [Algebra F N] [Algebra D N] [IsScalarTower F D N] [FiniteDimensional D N] [IsGalois D N]
variable (n:ℕ) [(E (n:F)).IsElliptic] [(E (n:D)).IsElliptic]
local notation "W" => E (n:F)
local notation "V" => E (n:D)

theorem unramified (i:F) (hi:i^2= -1) (a:GaussianInt) {p:ℕ} (hp:p.Prime) (hn:¬p∣2*n)
    (v:HeightOneSpectrum (𝓞 D)) (w:HeightOneSpectrum (𝓞 N)) [w.asIdeal.LiesOver v.asIdeal] (hm:(p:𝓞 D)∈v.asIdeal)
    (hunit:(a.re:𝓞 D)+(a.im:𝓞 D)*algebraMap (𝓞 F) (𝓞 D) (integralI i hi)∉v.asIdeal) (r:ℕ)
    {x y:N} (h:((W).baseChange N).toAffine.Nonsingular x y) (hg:IntermediateField.adjoin D {x,y}=⊤)
    (P:CurvePoints W F) (hQ:cm (n:F) i hi (a^r) (.some x y h)=changeBase W P) :
    w.asIdeal.ramificationIdx (𝓞 D)=1 := by
  let j:=algebraMap (𝓞 F) (𝓞 D) (integralI i hi)
  have hj:j^2= -1:=by
    have h':(integralI i hi)^2= -1:=Subtype.ext hi
    rw [show j=algebraMap (𝓞 F) (𝓞 D) (integralI i hi) from rfl,←map_pow,h',map_neg,map_one]
  have hji:algebraMap F D i=(j:D):=rfl
  obtain ⟨hq,eqQ⟩:=TunnellCMChangeBaseField.rebase_some (K:=D) n h
  apply TunnellConjugatePrimeIndex.unramified v w n j hj a.re a.im hp hn hm hunit r hq hg
  intro g
  have hsq(X:CurvePoints V N):baseI (n:D) (j:D) (by exact_mod_cast hj) (baseI (n:D) (j:D) (by exact_mod_cast hj) X)= -X:=by
    haveI:((V).baseChange N).IsElliptic:=inferInstanceAs (((V).map (algebraMap D N)).IsElliptic)
    exact quarter_sq (base_E _) _ _ X
  rw [TunnellLocalCMCoordDegree.endo_iterate _ hsq a r]
  change act V g (cm (n:D) (j:D) _ (a^r) (.some x y hq))=cm (n:D) (j:D) _ (a^r) (.some x y hq)
  rw [←eqQ,←TunnellCMChangeBaseField.cm_rebase n i (j:D) hi _ hji,hQ]
  cases P with
  | zero=>change act V g (TunnellCMChangeBaseField.rebase n (changeBase W 0))=TunnellCMChangeBaseField.rebase n (changeBase W 0); simp only [map_zero]
  | some t z hh=>
    simp only [changeBase,Point.baseChange,Point.map_some,TunnellCMChangeBaseField.rebase,Point.equivOfEq_some]
    exact (Point.some.injEq ..).mpr ⟨(g.restrictScalars F).commutes t,(g.restrictScalars F).commutes z⟩

theorem all_other (i:F) (hi:i^2= -1) (a:GaussianInt) {p:ℕ} (hp:p.Prime) (hn:¬p∣2*n)
    (hdeg:Module.finrank ℚ F=2) (hnorm:a.re^2+a.im^2=(p:ℤ)) (v₀:HeightOneSpectrum (𝓞 F))
    (hv:(a.re:𝓞 F)+(a.im:𝓞 F)*integralI i hi∈v₀.asIdeal) (w₀:HeightOneSpectrum (𝓞 D))
    (hu:∀u:HeightOneSpectrum (𝓞 D),u.asIdeal.LiesOver v₀.asIdeal → u=w₀) (r:ℕ)
    {x y:N} (h:((W).baseChange N).toAffine.Nonsingular x y) (hg:IntermediateField.adjoin D {x,y}=⊤)
    (P:CurvePoints W F) (hQ:cm (n:F) i hi (a^r) (.some x y h)=changeBase W P)
    (away:∀(v:HeightOneSpectrum (𝓞 D)) (w:HeightOneSpectrum (𝓞 N)),w.asIdeal.LiesOver v.asIdeal →
      (p:𝓞 D)∉v.asIdeal → w.asIdeal.ramificationIdx (𝓞 D)=1) :
    ∀ v:HeightOneSpectrum (𝓞 D),v≠w₀ → ∀w:HeightOneSpectrum (𝓞 N),w.asIdeal.LiesOver v.asIdeal →
      w.asIdeal.ramificationIdx (𝓞 D)=1 := by
  intro v hne w hw
  letI:=hw
  by_cases hm:(p:𝓞 D)∈v.asIdeal
  · exact unramified n i hi a hp hn v w hm
      (TunnellConjugatePrimeIndex.complement v hdeg i hi a.re a.im hp hnorm v₀ hv w₀ hu hne) r h hg P hQ
  · exact away v w hw hm

theorem all_other_with [dF:DecidableEq F] [dN:DecidableEq N] (i:F) (hi:i^2= -1) (a:GaussianInt) {p:ℕ} (hp:p.Prime) (hn:¬p∣2*n)
    (hdeg:Module.finrank ℚ F=2) (hnorm:a.re^2+a.im^2=(p:ℤ)) (v₀:HeightOneSpectrum (𝓞 F))
    (hv:(a.re:𝓞 F)+(a.im:𝓞 F)*integralI i hi∈v₀.asIdeal) (w₀:HeightOneSpectrum (𝓞 D))
    (hu:∀u:HeightOneSpectrum (𝓞 D),u.asIdeal.LiesOver v₀.asIdeal → u=w₀) (r:ℕ)
    {x y:N} (h:((W).baseChange N).toAffine.Nonsingular x y) (hg:IntermediateField.adjoin D {x,y}=⊤)
    (P:CurvePoints W F) (hQ:cm (n:F) i hi (a^r) (.some x y h)=changeBase W P)
    (away:∀(v:HeightOneSpectrum (𝓞 D)) (w:HeightOneSpectrum (𝓞 N)),w.asIdeal.LiesOver v.asIdeal →
      (p:𝓞 D)∉v.asIdeal → w.asIdeal.ramificationIdx (𝓞 D)=1) :
    ∀ v:HeightOneSpectrum (𝓞 D),v≠w₀ → ∀w:HeightOneSpectrum (𝓞 N),w.asIdeal.LiesOver v.asIdeal →
      w.asIdeal.ramificationIdx (𝓞 D)=1 := by
  have hf:dF=Classical.decEq F:=Subsingleton.elim _ _
  subst dF
  have hn':dN=Classical.decEq N:=Subsingleton.elim _ _
  subst dN
  exact all_other n i hi a hp hn hdeg hnorm v₀ hv w₀ hu r h hg P hQ away

#print axioms all_other_with
#print axioms all_other
#print axioms unramified
end
end TunnellRelativeDivisionInertia
