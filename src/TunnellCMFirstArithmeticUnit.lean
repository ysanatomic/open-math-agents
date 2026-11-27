import TunnellCMFirstEmbedding
import TunnellCMAlignedNorm
import TunnellCMGlobalNormJet

/-! The two units in the first-place detection argument are the actual
arithmetic elliptic unit at the selected generator and the base-field value at zero. -/
namespace TunnellCMFirstArithmeticUnit
open WeierstrassCurve WeierstrassCurve.Affine NumberField IntermediateField IsLocalRing
open IsDedekindDomain IsDedekindDomain.HeightOneSpectrum
open TunnellCoates TunnellKummer TunnellCMLemniscate TunnellCMCritical TunnellCMCriticalCoefficients
open TunnellCMEllipticNormTower TunnellCMCoherentFields TunnellCMCoherentPoints TunnellCMActualNormUnits
open TunnellCMCoefficientNorm TunnellCMAlignedNorm TunnellCMIntegralSlope TunnellCMGlobalNormJet TunnellCMTorsionField
open scoped Classical NumberField
noncomputable section
local notation "B" => algebraicClosure ℚ ℂ
variable (K : Type) [Field K] [NumberField K] [Algebra K B] [DecidableEq K]
variable (n : ℕ) (hn : 0<n) [(E (n:K)).IsElliptic] {F : IntermediateField K B} (D : Data K n hn F) [FiniteDimensional K F]
local notation "W" => E (n:K)
local notation "G" => normFunction W D.u D.c (weights n hn)

theorem at_zero : ∃ a : K, algebraMap K B a=G 0 := by
  letI : IsAlgClosure K B := closed_over K
  letI : IsAlgClosed B := IsAlgClosure.isAlgClosed K
  have hh : G 0 ∈ (⊥ : IntermediateField K B) := by
    apply (InfiniteGalois.mem_bot_iff_fixed _).mpr
    intro σ
    exact (norm_covariant W D.u D.c (weights n hn) σ 0).trans (congrArg _ (map_zero _))
  exact IntermediateField.mem_bot.mp hh

variable (i : K) (hi : i^2= -1) (hiC : ((algebraMap K B i:B):ℂ)=Complex.I)
  {p : ℕ} (hp : p.Prime) (h₂ : p≠2) (q : GaussianInt) (hq : q.norm.natAbs=p)
local notation "A" => level K n hn hp q hq
local notation "U" => primitive K n hn hp q hq

include hiC h₂ in
theorem first {T : Type} [Field T] [Algebra K T] [FiniteDimensional K T] [DecidableEq T]
    (S : CurvePoints W T) (hS : cm (n:K) i hi q S=0) (ho : addOrderOf S=p) (hg : coordField W S=⊤)
    (hd : Module.finrank K T=p-1) (u : (𝓞 (A 1))ˣ) (hu : (u.val.val:B)=G (U 1)) :
    ∃ (e : T →ₐ[K] B) (ea : e.fieldRange=A 1) (a₀ : K),
      Point.map (W':=(W).toAffine) e S=U 1 ∧ e (pullUnit e ea u).val.val=G (Point.map (W':=(W).toAffine) e S) ∧
      algebraMap K B a₀=G 0 := by
  obtain ⟨e,he,ea⟩:=TunnellCMFirstEmbedding.prescribed K n hn i hi hiC hp h₂ q hq S hS ho hg hd
  obtain ⟨a₀,h₀⟩:=at_zero K n hn D
  exact ⟨e,ea,a₀,he,(pull_spec e ea u).trans (hu.trans (congrArg _ he).symm),h₀⟩

end
end TunnellCMFirstArithmeticUnit
#print axioms TunnellCMFirstArithmeticUnit.first
