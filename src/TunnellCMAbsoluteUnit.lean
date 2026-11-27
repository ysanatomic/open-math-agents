import TunnellCMGoodDescent
import Mathlib.FieldTheory.IntermediateField.Adjoin.Basic

/-! Integrality of signed division products for all prime-to-conductor translates. -/
namespace TunnellCMAbsoluteUnit

open WeierstrassCurve WeierstrassCurve.Affine NumberField TunnellCoates
open TunnellCMModelUnit TunnellCMGlobalModelUnit TunnellCMGoodDescent
open scoped NumberField
set_option maxHeartbeats 1000000
noncomputable section
variable (F B : Type*) [Field F] [Field B] [Algebra F B] [DecidableEq F] [DecidableEq B]

lemma eq_E (n : ℕ) : (E (n:F)).baseChange B = E (n:B) := by
  ext <;> simp [WeierstrassCurve.baseChange,E]

def mapPoint (n : ℕ) : (E (n:F)).toAffine.Point →+ (E (n:B)).toAffine.Point :=
  (Point.equivOfEq (eq_E F B n)).toAddMonoidHom.comp (pointMap (E (n:F)) B)

lemma mapPoint_injective (n : ℕ) : Function.Injective (mapPoint F B n) :=
  (Point.equivOfEq _).injective.comp (pointMap_inj _ B)

lemma x_equality {W W' : WeierstrassCurve B} (h : W=W') (P : W.toAffine.Point) :
    X (Point.equivOfEq h P) = X P := by subst W'; rfl

lemma x_point (n : ℕ) (P : (E (n:F)).toAffine.Point) :
    X (mapPoint F B n P) = algebraMap F B (X P) := by
  exact (x_equality B _ _).trans (x_map _ B P)

variable {B} [CharZero B] (K : IntermediateField ℚ B) [DecidableEq K]

lemma lift_point (n : ℕ) (P : (E (n:B)).toAffine.Point) (hx : X P ∈ K) (hy : Y P ∈ K) :
    ∃ P' : (E (n:K)).toAffine.Point, mapPoint K B n P'=P := by
  cases P with
  | zero => exact ⟨0,map_zero _⟩
  | some x y hh =>
    let u : K := ⟨x,hx⟩
    let v : K := ⟨y,hy⟩
    have he := eq_E K B n
    have h : (E (n:K)).toAffine.Nonsingular u v := by
      apply ((E (n:K)).toAffine.map_nonsingular (f := algebraMap K B) (algebraMap K B).injective u v).mp
      change ((E (n:K)).baseChange B).toAffine.Nonsingular x y
      rw [he]; exact hh
    refine ⟨.some u v h,?_⟩
    simp only [mapPoint,pointMap,AddMonoidHom.comp_apply,AddEquiv.coe_toAddMonoidHom,
      Point.equivOfEq_some,Point.map_some]
    rfl

def coordinateSet {B : Type*} [Field B] [DecidableEq B] {W : WeierstrassCurve B} {ι : Type*}
    [Fintype ι] (P : ι → W.toAffine.Point) : Finset B :=
  Finset.univ.image (fun i => X (P i)) ∪ Finset.univ.image (fun i => Y (P i))

lemma lift_family {α : Type*} [Fintype α] {n : ℕ} (T : α → (E (n:B)).toAffine.Point)
    (h : ∀ z ∈ coordinateSet T, z ∈ K) : ∀ i, ∃ P', mapPoint K B n P'=T i := by
  intro i
  apply lift_point <;> apply h
  · exact Finset.mem_union_left _ (Finset.mem_image_of_mem _ (Finset.mem_univ i))
  · exact Finset.mem_union_right _ (Finset.mem_image_of_mem _ (Finset.mem_univ i))

theorem absolute_unit (A : Type*) [Field A] [CharZero A] [IsAlgClosed A] [Algebra.IsAlgebraic ℚ A]
    [DecidableEq A] {n m a : ℕ} (hn : n%8=2) (h2 : 2<n) {ι κ : Type*} [Fintype ι] [Fintype κ]
    (w : ι → ℤ) (hw : ∑ i, w i=0) (U : ι → (E (n:A)).toAffine.Point)
    (V : (E (n:A)).toAffine.Point) (Q : κ → (E (n:A)).toAffine.Point)
    (hc : (4*n).Coprime (a*m)) (hU : ∀ i, addOrderOf (U i)=4*n) (hV : m • V=0)
    (hQ : ∀ j, a • Q j=0) (hQ0 : ∀ j, Q j≠0)
    (hu : (∏ i, (∏ j, (X (U i+V)-X (Q j))) ^ w i) ≠ 0) :
    ∃ u : (𝓞 A)ˣ, (u.val : A) = ∏ i, (∏ j, (X (U i+V)-X (Q j))) ^ w i := by
  classical
  obtain ⟨S,hS⟩ := finite_models A n (by omega)
  let C := S ∪ coordinateSet U ∪ coordinateSet Q ∪ {X V,Y V}
  let K := IntermediateField.adjoin ℚ (C : Set A)
  letI : FiniteDimensional ℚ K := IntermediateField.finiteDimensional_adjoin (S := (C : Set A))
    (fun z _ => (Algebra.IsAlgebraic.isAlgebraic z).isIntegral)
  letI : NumberField K := ⟨⟩
  letI : (E (n:K)).IsElliptic := E_elliptic (by norm_num) (by exact_mod_cast (show n≠0 by omega))
  have mem {z : A} (h : z ∈ C) : z ∈ K := IntermediateField.subset_adjoin _ _ h
  choose U' hu' using lift_family K U (fun z h => mem (by simp [C,h]))
  choose Q' hq' using lift_family K Q (fun z h => mem (by simp [C,h]))
  obtain ⟨V',hv'⟩ := lift_point K n V (mem (by simp [C])) (mem (by simp [C]))
  let M := mapPoint K A n
  have hM := mapPoint_injective K A n
  have ev (i : ι) (j : κ) : algebraMap K A (X (U' i+V') - X (Q' j)) = X (U i+V)-X (Q j) := by
    rw [map_sub,← x_point,← x_point,map_add,hu',hv',hq']
  have eqn : algebraMap K A (∏ i, (∏ j, (X (U' i+V')-X (Q' j)))^w i) =
      ∏ i, (∏ j, (X (U i+V)-X (Q j)))^w i := by simp only [map_prod,map_zpow₀,ev]
  obtain ⟨u,eu⟩ := integral_unit (E (n:K)) (hS K (fun z h => mem (by simp [C,h])))
    w hw U' V' Q' hn h2 hc
    (fun i => by rw [← addOrderOf_injective M hM,show M (U' i)=U i from hu' i,hU])
    (hM (by rw [map_nsmul,show M V'=V from hv',hV,map_zero]))
    (fun j => hM (by rw [map_nsmul,show M (Q' j)=Q j from hq' j,hQ,map_zero]))
    (fun j h => hQ0 j (by rw [← hq' j,h,map_zero]))
    (fun h => hu (by rw [← eqn,h,map_zero]))
  refine ⟨Units.map (RingOfIntegers.mapRingHom K.val.toRingHom).toMonoidHom u,?_⟩
  exact (congrArg (algebraMap K A) eu).trans eqn

end
end TunnellCMAbsoluteUnit
#print axioms TunnellCMAbsoluteUnit.absolute_unit
