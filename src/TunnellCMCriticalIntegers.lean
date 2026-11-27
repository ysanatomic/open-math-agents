import TunnellCMAbsoluteUnit
import TunnellCMCriticalTower
import Mathlib.Analysis.Complex.Polynomial.Basic

/-! The critical-value elliptic units are globally integral, with globally integral inverses. -/
namespace TunnellCMCriticalIntegers

open WeierstrassCurve WeierstrassCurve.Affine NumberField Complex LSG.Weierstrass
open TunnellCoates TunnellCMLemniscate TunnellCMDistribution TunnellCMEllipticUnit
open TunnellCMCritical TunnellCMUnitTrace TunnellCMLSeries TunnellCMModelUnit TunnellCMAbsoluteUnit
open TunnellCMNormDistribution TunnellCMAlgebraicUnits
open scoped NumberField
noncomputable section
variable (n : ℕ) (hn : 0<n)
local notation "L" => twistPeriods n hn
local notation "A" => algebraicClosure ℚ ℂ
lemma model_eq : curve L = E (n:ℂ) := curve_eq n hn

def uniformize : ℂ →+ (E (n:ℂ)).toAffine.Point :=
  (Point.equivOfEq (model_eq n hn)).toAddMonoidHom.comp (expHom L)

lemma uniformize_apply (z : ℂ) : uniformize n hn z = Point.equivOfEq (model_eq n hn) (expE L z) := rfl

lemma x_uniformize (z : ℂ) : X (uniformize n hn z) = (L).weierstrassP z := by
  rw [uniformize_apply,x_equality]
  by_cases h : z ∈ (L).lattice
  · rw [expE_of_mem L h,(L).weierstrassP_coe ⟨z,h⟩]; rfl
  · rw [expE_of_notMem L h]; rfl

lemma torsion_lift {z : ℂ} {m : ℕ} (hm : 0 < m) (h : (m:ℂ)*z ∈ (L).lattice) :
    ∃ P : (E (n:A)).toAffine.Point, mapPoint A ℂ n P=uniformize n hn z := by
  apply lift_point
  · rw [x_uniformize]; exact wp_mem n hn hm h
  · by_cases h' : z ∈ (L).lattice
    · rw [uniformize_apply,expE_of_mem L h',map_zero]
      exact (A).zero_mem
    · rw [uniformize_apply,expE_of_notMem L h',Point.equivOfEq_some]
      exact y_mem n hn hm h h'

lemma killed {m : ℕ} {z : ℂ} (h : (m:ℂ)*z ∈ (L).lattice) : m • uniformize n hn z=0 := by
  rw [← map_nsmul,nsmul_eq_mul,uniformize_apply,expE_of_mem L h,map_zero]

theorem value_unit {m : ℕ} (hm : 0 < m) (hn8 : n%8=2) (h2 : 2<n) (hc : (4*n).Coprime (aux n*m))
    {z : ℂ} (hz : (m:ℂ)*z ∈ (L).lattice) (hu : traceUnit n hn z ≠ 0) :
    ∃ u : (𝓞 A)ˣ, ((u.val : A) : ℂ) = traceUnit n hn z := by
  classical
  letI : IsAlgClosure ℚ A := algebraicClosure.isAlgClosure ℚ ℂ
  letI : IsAlgClosed A := IsAlgClosure.isAlgClosed ℚ
  letI : Algebra.IsAlgebraic ℚ A := algebraicClosure.isAlgebraic ℚ ℂ
  letI : NeZero (4*n) := ⟨by omega⟩
  letI : NeZero (aux n) := ⟨by unfold aux; omega⟩
  let s := Finset.univ.filter (fun i : Residues n => weight n i≠0)
  let t := divisionGrid L (aux n)
  let M := mapPoint A ℂ n
  have hM := mapPoint_injective A ℂ n
  choose U eu using fun i : s => torsion_lift n hn (by omega : 0<4*n) (conductor_point n hn i.val)
  choose Q eq using fun j : t => torsion_lift n hn (Nat.pos_of_ne_zero (NeZero.ne (aux n))) (mul_lift L j.val)
  obtain ⟨V,ev⟩ := torsion_lift n hn hm hz
  have hU (i : s) : addOrderOf (U i)=4*n := by
    rw [← addOrderOf_injective M hM,show M (U i)=_ from eu i]
    exact (addOrderOf_injective (Point.equivOfEq (model_eq n hn)).toAddMonoidHom (Point.equivOfEq _).injective _).trans
      (TunnellCMConductorOrder.conductor_order n hn i.val ((Finset.mem_filter.mp i.property).2))
  have hV : m • V=0 := hM (by rw [map_nsmul,show M V=_ from ev,killed n hn hz,map_zero])
  have hQ (j : t) : aux n • Q j=0 := hM (by rw [map_nsmul,show M (Q j)=_ from eq j,killed n hn (mul_lift L j.val),map_zero])
  have hQ0 (j : t) : Q j≠0 := by
    intro hh
    have e := (eq j).symm
    rw [hh,map_zero] at e
    have h := (Point.equivOfEq (model_eq n hn)).injective (e.trans (map_zero _).symm)
    exact (Finset.mem_filter.mp j.property).2 ((TunnellCMTorsionOrder.zero_iff n hn _).mp h)
  have term (i : s) (j : t) : algebraMap A ℂ (X (U i+V)-X (Q j)) =
      (L).weierstrassP (z+point n i.val) - (L).weierstrassP (liftGrid L j.val) := by
    change algebraMap A ℂ (X (U i+V)-X (Q j))=_
    rw [map_sub,← x_point,← x_point,map_add,eu,ev,eq,← map_add,add_comm (point n i.val) z,x_uniformize,x_uniformize]
  have he : algebraMap A ℂ (∏ i : s, (∏ j : t, (X (U i+V)-X (Q j)))^weight n i.val) =
      traceUnit n hn z := by
    simp only [map_prod,map_zpow₀,term]
    change (∏ i : s, (∏ j : t, ((L).weierstrassP (z+point n i.val) - (L).weierstrassP (liftGrid L j.val)))^weight n i.val) = _
    have pj (i : Residues n) : (∏ j : t, ((L).weierstrassP (z+point n i) - (L).weierstrassP (liftGrid L j.val))) =
        divisionProduct L (aux n) (z+point n i) :=
      Finset.prod_coe_sort t (fun j => (L).weierstrassP (z+point n i) - (L).weierstrassP (liftGrid L j))
    simp only [pj]
    exact Finset.prod_coe_sort s (fun i => divisionProduct L (aux n) (z+point n i)^weight n i)
  have hw : ∑ i : s, weight n i.val=0 := by
    rw [Finset.sum_coe_sort,Finset.sum_filter_ne_zero]
    exact TunnellCMWeights.weight_sum_zero n hn8
  obtain ⟨u,hu'⟩ := absolute_unit A hn8 h2 (fun i : s => weight n i.val) hw U V Q hc hU hV hQ hQ0
    (fun h => hu (by rw [← he,h,map_zero]))
  exact ⟨u,(congrArg (algebraMap A ℂ) hu').trans he⟩

end
end TunnellCMCriticalIntegers
#print axioms TunnellCMCriticalIntegers.value_unit
