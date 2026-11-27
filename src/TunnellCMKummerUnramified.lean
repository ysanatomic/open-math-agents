import TunnellCMGoodKummerBaseChange
import TunnellCMRationalMultiple
import TunnellGlobalKummerLift

/-! A single bound depending on the congruent-number curve suffices for every
primary Kummer lift and every non-primary prime of each torsion field. -/
namespace TunnellCMKummerUnramified
open WeierstrassCurve WeierstrassCurve.Affine IntermediateField IsDedekindDomain NumberField
open TunnellCoates TunnellKummer TunnellGaussianEnd TunnellCMTorsionField TunnellCMChangeBaseField
open TunnellCMRebasedDivision TunnellDivisionCoordinates TunnellCMGoodKummerBaseChange TunnellCMUniformGoodBase
open scoped Classical NumberField TunnellDivisionCoordinates
noncomputable section
set_option maxHeartbeats 1000000

lemma rational_rebase {F D M : Type} [Field F] [Field D] [Field M] [Algebra F D] [Algebra F M]
    [Algebra D M] [IsScalarTower F D M] [IsGalois D M] [dF : DecidableEq F] [dD : DecidableEq D]
    [dM : DecidableEq M] (n : ℕ) [(E (n:F)).IsElliptic] [(E (n:D)).IsElliptic]
    (i : F) (hi : i^2= -1) (j : D) (hj : j^2= -1) (hij : algebraMap F D i=j)
    (q : GaussianInt) {p : ℕ} (hnorm : q.re^2+q.im^2=(p:ℤ)) (r : ℕ)
    (P : CurvePoints (E (n:F)) F) (Q : CurvePoints (E (n:F)) M)
    (hP : cm (n:F) i hi (q^r) Q=Point.map (W':=(E (n:F)).toAffine) (Algebra.ofId F M) P) :
    ∃ P₀ : CurvePoints (E (n:D)) D, p^r • rebase (K:=D) n Q=
      Point.map (W':=(E (n:D)).toAffine) (Algebra.ofId D M) P₀ := by
  obtain rfl : dF=Classical.decEq F := Subsingleton.elim _ _
  obtain rfl : dD=Classical.decEq D := Subsingleton.elim _ _
  obtain rfl : dM=Classical.decEq M := Subsingleton.elim _ _
  let t:=rebase (F:=F) (K:=D) (M:=M) n
  apply TunnellCMRationalMultiple.rational n j hj q hnorm r (t Q)
  intro σ
  have he:=cm_rebase (M:=M) n i j hi hj hij (q^r) Q
  have eq : cm (n:D) j hj (q^r) (t Q)=t (Point.map (W':=(E (n:F)).toAffine) (Algebra.ofId F M) P) :=
    he.symm.trans (congrArg t hP)
  exact (congrArg (act (E (n:D)) σ) eq).trans ((base_fixed n P (Algebra.ofId F M) σ).trans eq.symm)

variable {B : Type} [Field B] [CharZero B] [IsAlgClosed B] [Algebra.IsAlgebraic ℚ B] [dB : DecidableEq B]
variable {K : Type} [Field K] [NumberField K] [Algebra K B] [Normal K B]
variable (n : ℕ) (hn : 0<n) [(E (n:K)).IsElliptic] (i : K) (hi : i^2= -1)
local notation "W" => E (n:K)

include hn in
theorem uniform :
    ∃ c : ℕ, ∀ (D : IntermediateField K B) [NumberField D] [Normal K D] (x y : B)
      (hh : ((W).baseChange B).toAffine.Nonsingular x y) (p r : ℕ) (q : GaussianInt) (hp : p.Prime),
      c<p → q.re^2+q.im^2=(p:ℤ) →
      let N:=field D x y
      ∀ [FiniteDimensional D N] [IsGalois D N], Module.finrank D N∣p^r →
      ∀ P : CurvePoints W K, cm (n:K) i hi (q^r) (point W D x y hh)=Point.map (W':=(W).toAffine) (Algebra.ofId K N) P →
      ∀ (v : HeightOneSpectrum (𝓞 D)) (w : HeightOneSpectrum (𝓞 N)), w.asIdeal.LiesOver v.asIdeal →
        (p:𝓞 D)∉v.asIdeal → w.asIdeal.ramificationIdx (𝓞 D)=1 := by
  obtain rfl : dB=Classical.decEq B := Subsingleton.elim _ _
  obtain ⟨c,hc⟩:=good_extension_in B n hn
  refine ⟨c,?_⟩
  intro D hD hD' x y hh p r q hp hlarge hnorm N hfd hg hd P hP v w hw hv
  letI : w.asIdeal.LiesOver v.asIdeal:=hw
  letI : NumberField (D.restrictScalars ℚ) := (inferInstance : NumberField D)
  have good : ∃ F : IntermediateField D B, ∃ hF : FiniteDimensional D F,
      letI : NumberField F:=NumberField.of_module_finite D F
      Module.finrank D F≤c ∧ ∃ A A' : WeierstrassCurve (𝓞 F), ∃ C C' : VariableChange F,
        C • E (n:F)=A.map (algebraMap (𝓞 F) F) ∧ C' • E (n:F)=A'.map (algebraMap (𝓞 F) F) ∧
          IsCoprime A.Δ A'.Δ := hc (D.restrictScalars ℚ)
  obtain ⟨F,hF,hsmall,A,A',C,C',hC,hC',hcA⟩:=good
  letI : FiniteDimensional D F:=hF
  letI : (E (n:D)).IsElliptic:=E_elliptic (by norm_num) (by exact_mod_cast hn.ne')
  let j:=algebraMap K D i
  have hj : j^2= -1 := by change (algebraMap K D i)^2= -1; rw [←map_pow,hi,map_neg,map_one]
  let Q:=point W D x y hh
  let t:=rebase (F:=K) (K:=D) (M:=N) n
  obtain ⟨P₀,h₀⟩:=rational_rebase n i hi j hj rfl q hnorm r P Q hP
  obtain ⟨hxy,hQ⟩:=rebase_some (F:=K) (K:=D) (M:=N) n
    (show ((W).baseChange N).toAffine.Nonsingular (X D x y) (Y D x y) from ((W).toAffine.baseChange_nonsingular (embed D x y).injective _ _).mp hh)
  have he : rebase (K:=D) n Q=Point.some _ _ hxy:=hQ
  rw [he] at h₀
  exact base_change (D:=(↥D)) (field D x y) F n hn hp (hsmall.trans_lt hlarge) hd A A' C C' hC hC' hcA hxy
    (generated D x y) P₀ h₀ v hv w

end
end TunnellCMKummerUnramified
#print axioms TunnellCMKummerUnramified.uniform
