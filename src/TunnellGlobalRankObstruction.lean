import TunnellAdicKummerCharacter
import TunnellGlobalKummerLift
import TunnellRelativePrimaryFibre
import TunnellGlobalPointBound
import TunnellHighDivisionPlace
import TunnellRelativeDivisionInertia

/-! A norm-compatible nonzero first coefficient excludes a nontorsion rational point on the CM curve. -/
namespace TunnellGlobalRankObstruction
open NumberField IsDedekindDomain IsDedekindDomain.HeightOneSpectrum IsLocalRing WeierstrassCurve WeierstrassCurve.Affine
open TunnellCoates TunnellKummer TunnellCMTorsionField TunnellGaussianEnd TunnellPadicDivisionSeries TunnellLocalDivisibility
open TunnellPointCompletionTower TunnellAdicLocalization TunnellDivisionCoordinates
open scoped Classical TunnellDivisionCoordinates
noncomputable section
set_option maxHeartbeats 4800000
set_option maxRecDepth 4000
variable {p n m:ℕ} [Fact p.Prime] {F:Type} [Field F] [NumberField F] [Algebra F ℂ] [dF:DecidableEq F]
local notation "O" => IntegerRing p
local notation "Kp" => Local p
variable [Algebra F (Local p)] (v:TunnellRestrictedPlaces.Restriction (B:=IntegerRing p) (algebraMap F (Local p)))
variable (hn:0<n) (hsplit:p=4*m+1) (good:¬p∣2*n) [(E (n:F)).IsElliptic]
variable (i:F) (hi:i^2= -1) (hI:algebraMap F ℂ i=Complex.I) (j:IntegerRing p) (hj:j^2= -1) (hij:algebraMap F (Local p) i=(j:Local p))
variable (q:GaussianInt) (habs:q.norm.natAbs=p) (hnorm:q.re^2+q.im^2=(p:ℤ))
  (hminus:IsUnit ((q.re:IntegerRing p)-(q.im:IntegerRing p)*j)) (hplus:(q.re:IntegerRing p)+(q.im:IntegerRing p)*j∈maximalIdeal (IntegerRing p))
local notation "C" => algebraicClosure F ℂ
local notation "W" => E (n:F)
variable (U:CurvePoints (E (n:F)) (algebraicClosure F ℂ))
local notation "T" => coordField W U
local notation "K" => adicCompletion F v.v

include hn hsplit good hI hj hij habs hnorm hminus hplus in
theorem finite_order (hdegF:Module.finrank ℚ F=2) (hfirst:cm (n:F) i hi q U=0)
    [NumberField T] [IsGalois F T] [FiniteDimensional F T] (w:HeightOneSpectrum (𝓞 T)) (hw:w.asIdeal.LiesOver v.v.asIdeal)
    (hwu:∀ s:HeightOneSpectrum (𝓞 T),s.asIdeal.LiesOver v.v.asIdeal → s=w)
    (Z:CurvePoints W T) (hZ:cm (n:F) i hi q Z=0) (hz:addOrderOf Z=p)
    (a:T) (a₀:F) (hJ:TunnellCMFirstValues.JetValues n p ((W).baseChange T) Z w a (algebraMap F T a₀))
    (upper:∀ (D:Type) [Field D] [Algebra F D] [Algebra T D] [IsScalarTower F T D] [FiniteDimensional T D] [FiniteDimensional F D] [DecidableEq D]
      (r:ℕ) (S:CurvePoints W D),cm (n:F) i hi (q^(r+1)) S=0 → coordField W S=⊤ →
      Module.finrank F D=(p^(r+1)).totient → ∃ x:(𝓞 D)ˣ,Algebra.norm T x.val.val=a)
    (away:∀ (D:IntermediateField F C) [NumberField D] [Normal F D] (x y:C)
      (hh:((W).baseChange C).toAffine.Nonsingular x y) (r:ℕ),
      let N:=field D x y
      ∀ [FiniteDimensional D N] [IsGalois D N],Module.finrank D N∣p^r →
      ∀ P:CurvePoints W F,cm (n:F) i hi (q^r) (point W D x y hh)=changeBase W P →
      ∀ (s:HeightOneSpectrum (𝓞 D)) (t:HeightOneSpectrum (𝓞 N)),t.asIdeal.LiesOver s.asIdeal →
        (p:𝓞 D)∉s.asIdeal → t.asIdeal.ramificationIdx (𝓞 D)=1) (P:CurvePoints W F) : IsOfFinAddOrder P := by
  have hdF:dF=Classical.decEq F:=Subsingleton.elim _ _
  subst dF
  by_contra hP
  let hp:= (Fact.out:p.Prime)
  have h₂:p≠2:=by omega
  haveI:CharZero K:=charZero_of_injective_algebraMap (algebraMap F K).injective
  haveI:(E (n:K)).IsElliptic:=E_elliptic (by norm_num) (by exact_mod_cast hn.ne')
  obtain ⟨b,hb⟩:=TunnellGlobalPointBound.bound (algebraMap F Kp) v good (by omega) i hi j hj hij q hnorm hplus P hP
  obtain ⟨Y,hY,hoY,hG,hd,hnum,S,s,hgen,hS,hord,hs,he,hf,hsu⟩:=
    TunnellHighDivisionPlace.high hn hsplit (fun h=>good (dvd_mul_of_dvd_right h 2)) i hi hI j hj hij q habs hnorm hminus v b
  let D:IntermediateField F C:=coordField W Y
  letI : NumberField D:=hnum
  letI : IsAbelianGalois F D:=hG
  letI : FiniteDimensional F D:=FiniteDimensional.of_finrank_pos (hd.trans_gt (Nat.totient_pos.mpr (pow_pos hp.pos _)))
  haveI : Algebra.IsAlgebraic D C:=Algebra.IsAlgebraic.tower_top («K»:=F) D
  have hle:T≤D:=TunnellHighDivisionPlace.nested hn i hi hI q habs hnorm h₂ b U Y hfirst hY hoY
  letI algTD:Algebra T D:=(IntermediateField.inclusion hle).toAlgebra
  letI modTD:Module T D:=@Algebra.toModule T D _ _ algTD
  letI:IsScalarTower F T D:=.of_algebraMap_eq' rfl
  haveI:FiniteDimensional T D:=Module.Finite.of_restrictScalars_finite F T D
  obtain ⟨xU,hU⟩:=upper D b S hS hgen hd
  let w':Fibre (L:=T) v.v:=fibre v.v w hw
  let s':Fibre (L:=D) v.v:=fibre v.v s hs
  have hsu':∀ l:Fibre (L:=D) v.v,l=s':=unique v.v s' hsu
  obtain ⟨u,hu,hunique⟩:=along_unique v.v w' s' (unique v.v w' hwu) hsu'
  have hcomp:comp v.v w' u=s':=Subtype.ext hu
  have huc:∀l:Fibre (L:=D) v.v,l=comp v.v w' u:=fun l=>(hsu' l).trans hcomp.symm
  have hP₀:P≠0:=by rintro rfl; exact hP (by simp)
  obtain ⟨R,hR⟩:=TunnellRelativePrimaryFibre.lift n hn i hi hI hp h₂ q habs hnorm (b+1) P
  obtain ⟨x,y,hh,_,hfd,hgal,hab,hdiv,hQ⟩:=TunnellGlobalKummerLift.points_of_lift n hn i hi hI hp h₂ q habs hnorm (b+1) D S hS hord P hP₀ R hR
  let N:=field D x y
  letI : FiniteDimensional D N:=hfd
  letI : NumberField N:=NumberField.of_module_finite D N
  letI : IsGalois F N:=hgal
  letI : IsAbelianGalois D N:=hab
  letI : FiniteDimensional F N:=Module.Finite.trans D N
  letI : (E (n:D)).IsElliptic:=E_elliptic (by norm_num) (by exact_mod_cast hn.ne')
  let Q:=point W D x y hh
  have hxy:((W).baseChange N).toAffine.Nonsingular (X D x y) (TunnellDivisionCoordinates.Y D x y):=((W).toAffine.baseChange_nonsingular (embed D x y).injective _ _).mp hh
  have hfixed:cm (n:F) i hi (q^(b+1)) (.some (X D x y) (TunnellDivisionCoordinates.Y D x y) hxy)=changeBase W P:=hQ
  have ha:=away D x y hh (b+1) hdiv P hQ
  have hm:=TunnellConjugatePrimeIndex.selected_mem (algebraMap F Kp) v i hi j hij q.re q.im hplus
  have hall:=TunnellRelativeDivisionInertia.all_other_with (F:=F) (D:=D) (N:=N) n i hi q hp good hdegF hnorm v.v hm s hsu (b+1) hxy (generated D x y) P hfixed ha
  have hS₀:S≠0:=by
    rintro rfl
    rw [addOrderOf_zero] at hord
    exact (one_lt_pow₀ hp.one_lt (Nat.succ_ne_zero b)).ne hord
  obtain ⟨sx,sy,sh,eqS,genS⟩:=TunnellHighDivisionPlace.coordinates W S hS₀ hgen
  let t:=finitePlaceExtensionEquivAbove («K»:=D) (L:=N) u.1 (chosenFinitePlaceExtension (L:=N) u.1)
  apply TunnellAdicKummerCharacter.obstruction v.v w' u t n hn i hi hI h₂ (Nat.succ_ne_zero b) q habs hnorm rfl huc hunique
    Z hZ hz S hS hord hd sh eqS genS Q hxy rfl (generated D x y) P hQ (hb _ (Nat.lt_succ_self _))
    a a₀ hJ xU hU (TunnellGaussianPrimeIdeal.complex_places i hi)
  rw [show u.val=s from hu]
  exact hall

#print axioms finite_order
end
end TunnellGlobalRankObstruction
