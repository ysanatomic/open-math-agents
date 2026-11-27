import TunnellCMCoherentPoints
import TunnellCMDivisionNorm

/-! Exact relative degrees in the tower attached to compatible primitive points. -/
namespace TunnellCMCoherentFields
open WeierstrassCurve WeierstrassCurve.Affine TunnellCoates TunnellKummer TunnellCMTorsionField
open TunnellCMCoherentPoints TunnellLocalCMCoordDegree TunnellCMTorsionDegree
open scoped Classical
noncomputable section
local notation "AlgC" => algebraicClosure ℚ ℂ
variable (K : Type) [Field K] [CharZero K] [Algebra K AlgC] [DecidableEq K]
variable (n : ℕ) (hn : 0<n) [(E (n:K)).IsElliptic]
variable {p : ℕ} (hp : p.Prime) (q : GaussianInt) (hq : q.norm.natAbs=p)
  (i : K) (hi : i^2= -1) (hiC : ((algebraMap K AlgC i:AlgC):ℂ)=Complex.I)
local notation "W" => E (n:K)
local notation "T" => primitive K n hn hp q hq
local notation "φ" => cm (L := AlgC) (n:K) i hi
abbrev level (r : ℕ) := coordField W (T r)
local notation "A" => level K n hn hp q hq

include hi hiC in
theorem tower_le (r : ℕ) : A r ≤ A (r+1) := by
  apply coord_le
  obtain ⟨P,hP⟩ := point_rational W (T (r+1))
  exact ⟨cm (n:K) i hi q P,(cm_map _ _ _ _ _ _).trans
    ((congrArg (φ q) hP).trans (compatible K n hn hp q hq i hi hiC r))⟩

include hiC in
theorem field_degree [Normal K AlgC] (h2 : p≠2) (r : ℕ)
    {L : Type} [Field L] [DecidableEq L] [Algebra K L] (f : L →ₐ[K] AlgC)
    (P : CurvePoints W L) (hk : cm (n:K) i hi (q^r) P=0)
    (hbenchmark : (p^r).totient ≤ Module.finrank K (coordField W P)) :
    IsAbelianGalois K (A r) ∧ FiniteDimensional K (A r) ∧ Module.finrank K (A r)=(p^r).totient := by
  obtain ⟨hT,ho,hgen⟩ := generates K n hn hp q hq i hi hiC h2 r
  letI : FiniteDimensional K (A r) := finite_coord n (p^r) hn (pow_pos hp.pos r) _ (by
    rw [← ho]; exact addOrderOf_nsmul_eq_zero _)
  letI : IsAbelianGalois K (A r) := abelian_of_cyclic (n:K) i hi (q^r) (T r) hT (by
    intro Q hQ
    obtain ⟨k,rfl⟩ := hgen Q hQ
    exact ⟨(k:GaussianInt),by simp [cm_apply]⟩)
  refine ⟨inferInstance,inferInstance,Nat.le_antisymm (degree_bound W _ (pow_pos hp.pos r) ho ?_) ?_⟩
  · intro σ
    exact hgen _ (by rw [cm_act,hT,map_zero])
  · let Q := Point.map (W' := (W).toAffine) f P
    have hQ : φ (q^r) Q=0 := by rw [← cm_map,hk,map_zero]
    obtain ⟨k,hk'⟩ := hgen Q hQ
    have hle : coordField W Q≤A r := coord_le W (hk' ▸ (rationalPoints W (A r)).zsmul_mem (point_rational W (T r)) k)
    have hd := (IntermediateField.equivMap (coordField W P) f).toLinearEquiv.finrank_eq
    rw [coord_map] at hd
    exact hbenchmark.trans (hd.le.trans (IntermediateField.finrank_le_of_le_right hle))

include hp in
theorem relative_degree {D N : Type*} [Field D] [Field N] [Algebra K D] [Algebra K N] [Algebra D N]
    [IsScalarTower K D N] [FiniteDimensional K N] (r : ℕ) (hpos : 0 < r)
    (h0 : Module.finrank K D=(p^r).totient)
    (h1 : Module.finrank K N=(p^(r+1)).totient) : Module.finrank D N=p := by
  have e := Module.finrank_mul_finrank K D N
  rw [h0,h1] at e
  obtain ⟨s,rfl⟩ := Nat.exists_eq_succ_of_ne_zero hpos.ne'
  rw [Nat.totient_prime_pow_succ hp,Nat.totient_prime_pow_succ hp] at e
  apply Nat.eq_of_mul_eq_mul_left (Nat.mul_pos (pow_pos hp.pos s) (by have := hp.one_lt; omega : 0<p-1))
  convert e using 1 <;> ring

end
end TunnellCMCoherentFields
#print axioms TunnellCMCoherentFields.field_degree
#print axioms TunnellCMCoherentFields.relative_degree
