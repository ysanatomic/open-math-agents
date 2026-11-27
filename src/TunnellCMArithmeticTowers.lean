import TunnellCMFirstValues
import TunnellCMHighNormValues
import TunnellCMOrdinaryTower

/-! A point in the actual first division field has a single arithmetic unit
which is a global norm from every higher primary division field and whose
local expansion differs from its ground-field value to first order. -/
namespace TunnellCMArithmeticTowers
open WeierstrassCurve WeierstrassCurve.Affine NumberField IntermediateField IsLocalRing
open IsDedekindDomain IsDedekindDomain.HeightOneSpectrum TunnellCoates TunnellKummer
open TunnellCMIntegralSlope TunnellCMCritical TunnellCMCriticalCoefficients TunnellCMCoefficientCompletion
open TunnellCMFirstArithmeticUnit TunnellCMCoherentFields TunnellCMCoherentPoints TunnellCMEllipticNormTower
open TunnellCMTorsionField TunnellCMAlignedNorm TunnellCMFirstValues TunnellCMLSeries
open TunnellRestrictedPlaces TunnellPadicDivisionSeries
open scoped NumberField Classical
noncomputable section
local notation "B" => algebraicClosure ℚ ℂ

def HigherNorm {K T : Type} [Field K] [Field T] [Algebra K T] [DecidableEq K] (n p : ℕ) [(E (n:K)).IsElliptic]
    (i : K) (hi : i^2= -1) (q : GaussianInt) (a : T) : Prop :=
  ∀ (D : Type) [Field D] [Algebra K D] [Algebra T D] [IsScalarTower K T D] [FiniteDimensional T D]
    [FiniteDimensional K D] [DecidableEq D] (r : ℕ) (S : CurvePoints (E (n:K)) D),
    cm (n:K) i hi (q^(r+1)) S=0 → coordField (E (n:K)) S=⊤ →
      Module.finrank K D=(p^(r+1)).totient → ∃ v : (𝓞 D)ˣ, Algebra.norm T v.val.val=a

variable (K : Type) [Field K] [NumberField K] [Algebra K B] [DecidableEq K]
variable (n : ℕ) (hn : 0<n) [(E (n:K)).IsElliptic] {F : IntermediateField K B} (D : Data K n hn F) [FiniteDimensional K F]
variable (i : K) (hi : i^2= -1) (hiC : ((algebraMap K B i:B):ℂ)=Complex.I)
  {p : ℕ} [Fact p.Prime] (h₂ : p≠2) (q : GaussianInt) (hq : q.norm.natAbs=p)
local notation "W" => E (n:K)
local notation "N" => normalClosure K F B
local notation "hp" => (Fact.out : p.Prime)
local notation "A" => level K n hn hp q hq

include h₂ in
lemma sign_square (hgood : ¬p∣n) : twistSign n p*twistSign n p=1 := by
  let P : Nat.Primes:=⟨p,hp⟩
  have h:=twistSign_prime n P h₂
  change twistSign n p=quadraticChar (ZMod p) (n:ZMod p) at h
  rw [h,←pow_two]
  exact quadraticChar_sq_one ((ZMod.natCast_eq_zero_iff n p).not.mpr hgood)

include hiC h₂ in
theorem first {T : Type} [Field T] [NumberField T] [Algebra K T] [FiniteDimensional K T] [DecidableEq T]
    (e : N →ₐ[ℚ] ℚ_[p]) (C : Coordinates K n hn D p e) (hs : IsUnit (firstCoefficient K n hn D C))
    (v : Restriction («B»:=IntegerRing p) (padicMap.comp (e.toRingHom.comp (algebraMap K N))))
    (w : HeightOneSpectrum (𝓞 T)) [w.asIdeal.LiesOver v.v.asIdeal] (S : CurvePoints W T)
    (hS : cm (n:K) i hi q S=0) (ho : addOrderOf S=p) (hg : coordField W S=⊤) (hd : Module.finrank K T=p-1)
    (hL : TunnellActualFirstPlace.FirstLocalData n ((W).baseChange T) S w p)
    (hpr : TunnellGaussian.Primary q) (hf : p.Coprime (4*n)) (ha : p.Coprime (TunnellCMCritical.aux n))
    (hn8 : n%8=2) (hn2 : 2<n) (hdeg : ∀ r, Module.finrank K (A r)=(p^r).totient) :
    ∃ (a : (𝓞 T)ˣ) (a₀ : K), JetValues n p ((W).baseChange T) S w a.val.val (algebraMap K T a₀) ∧
      HigherNorm n p i hi q a.val.val := by
  letI : IsAlgClosure K B:=closed_over K
  letI : IsAlgClosed B:=IsAlgClosure.isAlgClosed K
  obtain ⟨u,hu,huN⟩:=norm_tower K n hn D hp h₂ q hq i hi hiC hpr hf ha hn8 hn2 hdeg
  obtain ⟨f,ef,a₀,_,hz,h₀⟩:=TunnellCMFirstArithmeticUnit.first K n hn D i hi hiC hp h₂ q hq S hS ho hg hd (u 1) (hu 1)
  let a:=pullUnit f ef (u 1)
  letI : Algebra T B := f.toAlgebra
  letI : IsScalarTower K T B := .of_algebraMap_eq (fun x => (f.commutes x).symm)
  refine ⟨a,a₀,TunnellCMFirstValues.values K n hn D e C hs v w S hL a.val.val (algebraMap K T a₀) hz ?_,?_⟩
  · exact (f.commutes a₀).trans h₀
  · have hgood : ¬p∣n := (Fact.out : p.Prime).coprime_iff_not_dvd.mp (Nat.Coprime.of_dvd_right (dvd_mul_left n 4) hf)
    intro L _ _ _ _ _ _ _ r S' h' hg' hd'
    exact TunnellCMHighNormValues.upper K n hn i hi hiC hp h₂ q hq r S' h' hg' hd' f ef hdeg u _ (sign_square n h₂ hgood) huN

end
end TunnellCMArithmeticTowers
#print axioms TunnellCMArithmeticTowers.first
