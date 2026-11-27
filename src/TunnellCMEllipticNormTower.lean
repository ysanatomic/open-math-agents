import TunnellCMRelativeOrbitNorm
import TunnellCMNormDerivative

/-! The signed elliptic-unit distribution is a sequence of relative arithmetic field norms. -/
namespace TunnellCMEllipticNormTower
open Complex NumberField WeierstrassCurve WeierstrassCurve.Affine
open TunnellCoates TunnellKummer TunnellCMLemniscate TunnellCMCritical TunnellCMLSeries
open TunnellCMCriticalCoefficients TunnellCMCoherentPoints TunnellCMCoherentFields
open TunnellCMActualNormUnits TunnellCMCoefficientNorm TunnellCMRelativeOrbitNorm
open TunnellCMAlgebraicKernel TunnellCMNormDistribution TunnellCMTorsionField
open scoped Classical NumberField
noncomputable section
local notation "AlgC" => algebraicClosure ℚ ℂ

lemma closed_over (k : Type*) [Field k] [CharZero k] [Algebra k AlgC] : IsAlgClosure k AlgC := by
  letI : IsAlgClosure ℚ AlgC := algebraicClosure.isAlgClosure ℚ ℂ
  exact ⟨IsAlgClosure.isAlgClosed ℚ,Algebra.IsAlgebraic.tower_top (K := ℚ) k⟩

variable (K : Type) [Field K] [CharZero K] [Algebra K AlgC] [DecidableEq K]
variable (n : ℕ) (hn : 0<n) [(E (n:K)).IsElliptic] {F : IntermediateField K AlgC}
  (D : Data K n hn F) [Fintype (F →ₐ[K] AlgC)]
variable {p : ℕ} (hp : p.Prime) (h2 : p≠2) (q : GaussianInt) (hq : q.norm.natAbs=p)
  (i : K) (hi : i^2= -1) (hiC : ((algebraMap K AlgC i:AlgC):ℂ)=I)
local notation "W" => E (n:K)
local notation "φ" => cm (L := AlgC) (n:K) i hi
local notation "T" => primitive K n hn hp q hq
local notation "A" => level K n hn hp q hq
local notation "G" => normFunction W D.u D.c (weights n hn)

include h2 in
theorem norm_tower (hpr : TunnellGaussian.Primary q) (hf : p.Coprime (4*n)) (ha : p.Coprime (aux n))
    (hn8 : n%8=2) (hn2 : 2<n) (hdeg : ∀ r, Module.finrank K (A r)=(p^r).totient) :
    ∃ u : (r : ℕ) → (𝓞 (A r))ˣ, (∀ r, ((u r).val.val : AlgC)=G (T r)) ∧
    ∀ r, 0 < r → relativeNorm (tower_le K n hn hp q hq i hi hiC r) (u (r+1)).val.val =
      (u r).val.val^twistSign n p := by
  letI : IsAlgClosure K AlgC := closed_over K
  letI : IsAlgClosed AlgC := IsAlgClosure.isAlgClosed K
  letI (r : ℕ) : IsAlgClosure (A r) AlgC := closed_over (A r)
  have H (r : ℕ) := generates K n hn hp q hq i hi hiC h2 r
  have ht (r : ℕ) : p^r • T r=0 := by rw [← (H r).2.1]; exact addOrderOf_nsmul_eq_zero _
  have hfaux : (4*n).Coprime (aux n) := (Nat.coprime_add_mul_right_right (4*n) 1 3).mpr (Nat.coprime_one_right _)
  have cop (r : ℕ) := hfaux.mul_right (hf.symm.pow_right r)
  choose u hu using fun r : ℕ => in_division_field K n hn D (pow_pos hp.pos r) (cop r) hn8 hn2 (T r) (ht r)
  refine ⟨u,hu,?_⟩
  intro r hr
  let e := kernel_equiv K n hn i hi hiC hp q hq
  have hc : Nat.card (φ q).ker=p := (Nat.card_congr e).trans (gram_card n hn hp h2 hq)
  letI : Finite (φ q).ker := Nat.finite_of_card_ne_zero (hc.trans_ne hp.ne_zero)
  letI : Fintype (φ q).ker := Fintype.ofFinite _
  letI : FiniteDimensional K (coordField W (T (r+1))) :=
    TunnellLocalCMCoordDegree.finite_coord _ _ hn (pow_pos hp.pos _) _ (ht _)
  have hT : T (r+1)≠0 := by
    intro e
    have ho := (H (r+1)).2.1
    rw [e,addOrderOf_zero] at ho
    exact (one_lt_pow₀ hp.one_lt (Nat.succ_ne_zero _)).ne ho
  have step := compatible K n hn hp q hq i hi hiC r
  have hd : Module.finrank K (coordField W (T (r+1)))=Module.finrank K (A r)*Nat.card (φ q).ker := by
    change Module.finrank K (A (r+1))=_
    rw [hdeg,hdeg,hc]
    obtain ⟨s,rfl⟩ := Nat.exists_eq_succ_of_ne_zero hr.ne'
    rw [Nat.totient_prime_pow_succ hp,Nat.totient_prime_pow_succ hp,pow_succ]
    ring
  apply (A r).val.injective
  calc
    _ = ∏ j : (φ q).ker, G (T (r+1)+j.val) :=
      coordinate_norm W (φ q) (cm_act _ _ _ _) G (norm_covariant _ _ _ _) _ hT (A r)
        (tower_le K n hn hp q hq i hi hiC r) (fun τ => step ▸ fixed_at_coords W (T r) τ) hd _ (hu _)
    _ = G (φ q (T (r+1)))^twistSign n p :=
      norm_relation K n hn D i hi hiC hp h2 q hq hpr hf ha hn8 (cop _) _ (ht _)
    _ = _ := by rw [step,map_zpow₀]; exact congrArg (·^twistSign n p) (hu r).symm

end
end TunnellCMEllipticNormTower
#print axioms TunnellCMEllipticNormTower.norm_tower
