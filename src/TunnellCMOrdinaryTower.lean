import TunnellCMEllipticNormTower
import TunnellFullDivisionDegree

/-! The ordinary split-prime degree theorem supplies the exact degrees of the
coherent elliptic-unit tower, with its generators fixed by the complex uniformization. -/
namespace TunnellCMOrdinaryTower
open Complex WeierstrassCurve WeierstrassCurve.Affine TunnellCoates TunnellKummer
open TunnellCMCoherentPoints TunnellCMCoherentFields TunnellCMEllipticNormTower
open TunnellPadicDivisionSeries TunnellLocalDivisibility TunnellCMTorsionField
open scoped Classical NumberField
noncomputable section
local notation "AlgC" => algebraicClosure ℚ ℂ
variable {p : ℕ} [Fact p.Prime]
local notation "Op" => IntegerRing p
local notation "Kp" => Local p
variable (K : Type) [Field K] [CharZero K] [Algebra K AlgC] [Algebra K ℂ] [IsScalarTower K AlgC ℂ]
  [Algebra K (Local p)] [DecidableEq K]
variable (n : ℕ) (hn : 0<n) [(E (n:K)).IsElliptic] (q : GaussianInt) (hq : q.norm.natAbs=p)
local notation "hp" => (Fact.out : p.Prime)
local notation "W" => E (n:K)
local notation "A" => level K n hn hp q hq

theorem degrees {m : ℕ} (hmod : p=4*m+1) (hgood : ¬p∣n)
    (i : K) (hi : i^2= -1) (hiC : ((algebraMap K AlgC i:AlgC):ℂ)=I)
    (j : Op) (hj : j^2= -1) (hij : algebraMap K Kp i=(j:Kp)) (hN : q.re^2+q.im^2=(p:ℤ))
    (hu : IsUnit ((q.re:Op)-(q.im:Op)*j)) (r : ℕ) : Module.finrank K (A r)=(p^r).totient := by
  letI : IsAlgClosure K AlgC := closed_over K
  letI : IsAlgClosed AlgC := IsAlgClosure.isAlgClosed K
  have h2 : p≠2 := by omega
  cases r with
  | zero =>
    have ho := (generates K n hn hp q hq i hi hiC h2 0).2.1
    have ht := AddMonoid.addOrderOf_eq_one_iff.mp (by simpa only [pow_zero] using ho)
    change Module.finrank K (coordField W (primitive K n hn hp q hq 0))=_
    rw [ht]
    exact IntermediateField.finrank_bot.trans (by simp)
  | succ r =>
    have hIC : algebraMap K ℂ i=I := by
      rw [IsScalarTower.algebraMap_apply K AlgC ℂ]; exact hiC
    obtain ⟨P,hP,_,_,hd⟩ := TunnellFullDivisionDegree.split_level hn hmod hgood i hi hIC j hj hij q hq hN hu r
    let f : (algebraicClosure K ℂ) →ₐ[K] AlgC := IsAlgClosed.lift
    exact (field_degree K n hn hp q hq i hi hiC h2 (r+1) f P hP hd.ge).2.2

end
end TunnellCMOrdinaryTower
#print axioms TunnellCMOrdinaryTower.degrees
