import TunnellCMFormalUnitJet

/-! The first formal coefficient of the full product over conjugate embeddings. -/
namespace TunnellCMFormalNormJet
open IsLocalRing WeierstrassCurve WeierstrassCurve.Affine TunnellCoates TunnellCMModelUnit
open TunnellCMFirstJet TunnellCMFormalUnitJet TunnellFormalQuarter
open IsDedekindDomain IsDedekindDomain.HeightOneSpectrum
noncomputable section
variable {R K : Type*} [CommRing R] [IsDedekindDomain R] [Field K] [CharZero K]
  [Algebra R K] [IsFractionRing R K] {v : HeightOneSpectrum R} [DecidableEq (v.adicCompletion K)]
local notation "O" => v.adicCompletionIntegers K
local notation "L" => v.adicCompletion K
local notation "J" => (maximalIdeal O)^2
local notation "ρ" => Ideal.Quotient.mk J
variable {ι κ σ : Type*} [Fintype ι] [Fintype κ] [Fintype σ]

theorem norm_jet (n : O) [(E (n:L)).IsElliptic] (Z : (E n).formalGroupLaw.Points) (hZ : (Z () : O)≠0)
    (x y : σ → ι → O) (c : σ → κ → O)
    (hU : ∀ s i, (E (n:L)).toAffine.Nonsingular (x s i:L) (y s i:L))
    (b : σ → ι → κ → Oˣ) (hb : ∀ s i j, (b s i j:O)=x s i-c s j) (w : ι → ℤ) :
    ∃ u : Oˣ, ((u:O):L)=∏ s, ∏ i, (∏ j, (X (toPoint n Z + Point.some _ _ (hU s i))-(c s j:L)))^w i ∧
      ρ (((u/(∏ s, ∏ i, (∏ j, b s i j)^w i)):Oˣ):O) =
        1+ρ (Z ():O)*ρ (∑ s, ∑ i, (w i : O)*∑ j, (2*y s i*↑(b s i j)⁻¹)) := by
  choose us hu hj using fun s => unit_jet n Z hZ (x s) (y s) (c s) (hU s) (b s) (hb s) w
  refine ⟨∏ s, us s,?_,?_⟩
  · change ((Units.map (algebraMap O L).toMonoidHom (∏ s, us s)):Lˣ).val=_
    simp only [map_prod,Units.coe_prod,Units.coe_map]
    exact Finset.prod_congr rfl (fun s _ => hu s)
  · let B (s : σ) := ∏ i, (∏ j, b s i j)^w i
    let d (s : σ) := ∑ i, (w i:O)*∑ j, 2*y s i*↑(b s i j)⁻¹
    let t := ρ (Z ():O)
    have ht : t^2=0 := by
      rw [show t^2=ρ ((Z ():O)^2) from (map_pow _ _ _).symm,Ideal.Quotient.eq_zero_iff_mem]
      exact Ideal.pow_mem_pow (Z ()).2 _
    let χ := Units.map (ρ).toMonoidHom
    let a := firstLine t ht
    have eh (s : σ) : χ (us s/B s)=(a (ρ (d s))).toMul := by
      apply Units.ext
      change ρ ((us s/B s:Oˣ):O)=1+t*ρ (d s)
      simpa only [B,t,d,map_sum,map_mul,map_intCast,map_ofNat] using hj s
    have total : χ ((∏ s, us s)/(∏ s, B s)) = (a (ρ (∑ s, d s))).toMul := by
      rw [← Finset.prod_div_distrib,map_prod]
      simp only [eh,map_sum,toMul_sum]
    exact congrArg Units.val total

end
end TunnellCMFormalNormJet
#print axioms TunnellCMFormalNormJet.norm_jet
