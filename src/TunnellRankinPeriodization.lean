import TunnellRankinIntegrands

/-! The integrand is exactly the periodization of its strip kernel. -/
namespace TunnellRankinIntegral
open Complex Matrix MatrixGroups ModularGroup CongruenceSubgroup TunnellCMRegularized
open TunnellRankin TunnellRankinEisenstein TunnellEtaValue TunnellShell TunnellFullClassTheta
open UpperHalfPlane hiding I
open scoped ComplexConjugate
noncomputable section

def liftRow {L : ℕ} (r : Rows L) := (matrixRow_surjective L r).choose

lemma liftRow_spec {L : ℕ} (r : Rows L) : matrixRow (liftRow r)=r :=
  (matrixRow_surjective L r).choose_spec

theorem periodization {d : ℕ} {b : Triple} (hsq : Squarefree (2*d)) (hd : d%4=1) (hb : b∈shell (2*d))
    (z : ℍ) (s : ℂ) (hs : 3/2<s.re) :
    haveI : NeZero (4*(2*d)) := ⟨by omega⟩
    integrand (k:=4) (negCharacter d (by omega)) (full hsq (by omega) hb) s z =
      conj ((negCharacter d (by omega)).LFunction (2*conj s-1))*
      ∑' r : Rows (4*(2*d)*4),stripIntegrand (full hsq (by omega) hb) s ((liftRow r).val • z) := by
  letI : NeZero (4*(2*d)) := ⟨by omega⟩
  have e (r : Rows (4*(2*d)*4)) := strip_row hsq hd hb z (liftRow r) s
  simp only [liftRow_spec] at e
  rw [integrand,primitive_factor _ _ (by simpa using hs),
    rows_sum (dvd_mul_right 4 (2*d)),tsum_congr e,tsum_mul_left]
  simp only [stripIntegrand,map_mul,Complex.conj_tsum]
  ring
end
end TunnellRankinIntegral
#print axioms TunnellRankinIntegral.periodization
