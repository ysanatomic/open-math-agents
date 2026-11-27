import TunnellCMArithmeticTowers

/-! Realization of the first-level norm and jet in the same, totally
ramified division field over the chosen place of the Gaussian ground field. -/
namespace TunnellCMFirstTowerAt
open NumberField WeierstrassCurve WeierstrassCurve.Affine IntermediateField IsLocalRing
open IsDedekindDomain IsDedekindDomain.HeightOneSpectrum TunnellCoates TunnellKummer TunnellCMTorsionField
open TunnellCMIntegralSlope TunnellCMCritical TunnellCMCriticalCoefficients TunnellCMCoefficientCompletion
open TunnellCMArithmeticTowers TunnellCMFirstValues TunnellCMCoherentFields
open TunnellRestrictedPlaces TunnellPadicDivisionSeries TunnellLocalDivisibility
open scoped Classical NumberField
noncomputable section
local notation "B" => algebraicClosure ℚ ℂ
variable (K : Type) [Field K] [NumberField K] [DecidableEq K]
variable (n : ℕ) [(E (n:K)).IsElliptic] (i : K) (hi : i^2= -1)
local notation "W" => E (n:K)

def HasFirstTower [Algebra K ℂ] (p : ℕ) (q : GaussianInt) (v : HeightOneSpectrum (𝓞 K)) : Prop :=
  ∃ X : CurvePoints W (algebraicClosure K ℂ), cm (n:K) i hi q X=0 ∧ addOrderOf X=p ∧
    let T:=coordField W X
    IsAbelianGalois K T ∧ Module.finrank K T=p-1 ∧ ∃ hT : NumberField T, letI:=hT
      ∃ (S : CurvePoints W T) (w : HeightOneSpectrum (𝓞 T)), coordField W S=⊤ ∧
        cm (n:K) i hi q S=0 ∧ addOrderOf S=p ∧ w.asIdeal.LiesOver v.asIdeal ∧
        w.asIdeal.ramificationIdx (𝓞 K)=p-1 ∧ w.asIdeal.inertiaDeg (𝓞 K)=1 ∧
        (∀ w' : HeightOneSpectrum (𝓞 T), w'.asIdeal.LiesOver v.asIdeal → w'=w) ∧
        ∃ (a : (𝓞 T)ˣ) (a₀ : K), JetValues n p ((W).baseChange T) S w a.val.val (algebraMap K T a₀) ∧
          HigherNorm n p i hi q a.val.val

variable [Algebra K B] [Algebra K ℂ] [IsScalarTower K B ℂ] (hn : 0<n)
  {F : IntermediateField K B} (D : Data K n hn F) [FiniteDimensional K F]
local notation "N" => normalClosure K F B
variable {p : ℕ} [Fact p.Prime]

theorem realize (e : N →ₐ[ℚ] ℚ_[p]) (hiC : ((algebraMap K B i:B):ℂ)=Complex.I)
    (C : Coordinates K n hn D p e) (hs : IsUnit (firstCoefficient K n hn D C))
    (v : Restriction («B»:=IntegerRing p) (padicMap.comp (e.toRingHom.comp (algebraMap K N)))) (q : GaussianInt) (j : IntegerRing p)
    (hmod : p%4=1) (hj : j^2= -1) (hij : padicMap (p:=p) (e (algebraMap K N i))=(j:Local p)) (hq : q.norm.natAbs=p)
    (hN : q.re^2+q.im^2=(p:ℤ)) (hu : IsUnit ((q.re:IntegerRing p)-(q.im:IntegerRing p)*j))
    (hpr : TunnellGaussian.Primary q) (hf : p.Coprime (4*n)) (ha : p.Coprime (aux n))
    (hn8 : n%8=2) (hn2 : 2<n) : HasFirstTower K n i hi p q v.v := by
  let g:=padicMap.comp (e.toRingHom.comp (algebraMap K N))
  letI : Algebra K (Local p):=g.toAlgebra
  have hgood : ¬p∣n:=(Fact.out:p.Prime).coprime_iff_not_dvd.mp (Nat.Coprime.of_dvd_right (dvd_mul_left n 4) hf)
  have hm : p=4*(p/4)+1:=by omega
  have h₂ : p≠2:=by omega
  have hIC : algebraMap K ℂ i=Complex.I:=by rw [IsScalarTower.algebraMap_apply K B ℂ]; exact hiC
  have hdeg:=TunnellCMOrdinaryTower.degrees K n hn q hq hm hgood i hi hiC j hj hij hN hu
  obtain ⟨X,hX,ho,hG,hd,hT,S,w,hg,hS,ho',hw,he,hf',unique,hL⟩:=
    TunnellActualFirstPlace.first_level hn hm hgood i hi hIC j hj hij q hq hN hu v
  let T:=coordField W X
  letI : NumberField T:=hT
  letI : FiniteDimensional K T:=FiniteDimensional.of_finrank_pos (hd.trans_gt (by have hp:=(Fact.out:p.Prime).two_le; omega))
  letI : w.asIdeal.LiesOver v.v.asIdeal:=hw
  exact ⟨X,hX,ho,hG,hd,hT,S,w,hg,hS,ho',hw,he,hf',unique,
    TunnellCMArithmeticTowers.first K n hn D i hi hiC h₂ q hq e C hs v w S hS ho' hg hd hL hpr hf ha hn8 hn2 hdeg⟩

end
end TunnellCMFirstTowerAt
#print axioms TunnellCMFirstTowerAt.realize
