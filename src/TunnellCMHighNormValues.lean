import TunnellCMHigherEmbedding
import TunnellCMFirstArithmeticUnit

/-! For any actual upper torsion field over the first field, the arithmetic
unit at its selected first generator is the field norm of an integral unit. -/
namespace TunnellCMHighNormValues
open WeierstrassCurve WeierstrassCurve.Affine NumberField IntermediateField
open TunnellCoates TunnellKummer TunnellCMTorsionField TunnellCMCoherentFields TunnellCMCoherentPoints
open TunnellCMEllipticNormTower TunnellCMAlignedNorm TunnellCMHigherEmbedding TunnellCMRelativeOrbitNorm
open TunnellCMUniversalNorm
open scoped Classical NumberField
noncomputable section
set_option maxHeartbeats 850000
local notation "B" => algebraicClosure ℚ ℂ
variable (K : Type) [Field K] [NumberField K] [Algebra K B] [DecidableEq K]
variable (n : ℕ) (hn : 0<n) [(E (n:K)).IsElliptic] (i : K) (hi : i^2= -1)
  (hiC : ((algebraMap K B i:B):ℂ)=Complex.I) {p : ℕ} (hp : p.Prime) (h₂ : p≠2) (q : GaussianInt) (hq : q.norm.natAbs=p)
local notation "W" => E (n:K)
local notation "A" => level K n hn hp q hq

include h₂ in
theorem upper {T D : Type} [Field T] [Field D] [Algebra K T] [Algebra K D] [Algebra T D] [IsScalarTower K T D]
    [FiniteDimensional T D] [FiniteDimensional K D] [DecidableEq D]
    (r : ℕ) (S : CurvePoints W D) (hS : cm (n:K) i hi (q^(r+1)) S=0)
    (hg : coordField W S=⊤) (hd : Module.finrank K D=(p^(r+1)).totient)
    (e : T →ₐ[K] B) (ea : e.fieldRange=A 1) (hdeg : ∀ k, Module.finrank K (A k)=(p^k).totient)
    (u : (k : ℕ) → (𝓞 (A k))ˣ) (ε : ℤ) (hs : ε*ε=1)
    (H : ∀ k, 0<k → relativeNorm (tower_le K n hn hp q hq i hi hiC k) (u (k+1)).val.val=(u k).val.val^ε) :
    ∃ v : (𝓞 D)ˣ, Algebra.norm T v.val.val=(pullUnit e ea (u 1)).val.val := by
  letI (k : ℕ) : FiniteDimensional K (A k) := FiniteDimensional.of_finrank_pos ((hdeg k).trans_gt (Nat.totient_pos.mpr (pow_pos hp.pos k)))
  obtain ⟨g,eg⟩:=extend_embedding K e (D:=D)
  obtain ⟨hle,hN⟩:=all_levels A (tower_le K n hn hp q hq i hi hiC) (fun k => (u k).val.val) ε hs H r
  have eu := image K n hn i hi hiC hp h₂ q hq (r+1) S hS hg hd (hdeg _) g
  let v : (𝓞 (A (r+1)))ˣ := (u (r+1))^(ε^r)
  refine ⟨pullUnit g eu v,transfer_norm K e g eg ea eu hle (u 1) v ?_⟩
  have hv : v.val.val=(u (r+1)).val.val^(ε^r) := by
    let φ:=Units.map (algebraMap (𝓞 (A (r+1))) (A (r+1))).toMonoidHom
    exact (congrArg Units.val (φ.map_zpow (u (r+1)) (ε^r))).trans (Units.val_zpow_eq_zpow_val _ _)
  rw [hv]; exact hN

end
end TunnellCMHighNormValues
#print axioms TunnellCMHighNormValues.upper
