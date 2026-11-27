module
public import TunnellCMModelUnit

@[expose] public section
/-! Passing the division-product calculation over each completion back to a global algebraic unit. -/
namespace TunnellCMGlobalModelUnit
open WeierstrassCurve WeierstrassCurve.Affine IsDedekindDomain IsDedekindDomain.HeightOneSpectrum
open IsLocalRing NumberField TunnellCMModelUnit TunnellCMUnitCriterion
open scoped NumberField
set_option maxHeartbeats 1100000

variable {F : Type*} [Field F] (W : WeierstrassCurve F) (L : Type*) [Field L] [Algebra F L]
  [DecidableEq F] [DecidableEq L]

theorem base_self : W.baseChange F = W := by
  change W.map (algebraMap F F) = W
  rw [Algebra.algebraMap_self,W.map_id]

noncomputable def pointMap : W.toAffine.Point →+ (W.baseChange L).toAffine.Point :=
  (Point.map (W' := W.toAffine) (Algebra.ofId F L)).comp
    (Point.equivOfEq (base_self W).symm).toAddMonoidHom

theorem pointMap_inj : Function.Injective (pointMap W L) :=
  (Point.map_injective _).comp (Point.equivOfEq _).injective

theorem x_map (P : W.toAffine.Point) :
    X (pointMap W L P) = algebraMap F L (X P) := by
  cases P with
  | zero => change X (pointMap W L 0) = algebraMap F L 0; rw [map_zero,map_zero]; rfl
  | some x y h =>
    simp only [pointMap,AddMonoidHom.comp_apply,AddEquiv.coe_toAddMonoidHom,Point.equivOfEq_some,Point.map_some]
    rfl

variable {K : Type*} [Field K] [NumberField K]

def ModelAt (E : WeierstrassCurve K) (v : HeightOneSpectrum (𝓞 K)) : Prop :=
  ∃ C : VariableChange (v.adicCompletion K), ∃ W₀ : WeierstrassCurve (v.adicCompletionIntegers K),
    W₀.IsElliptic ∧ W₀.map (algebraMap _ (v.adicCompletion K)) = C • E.baseChange (v.adicCompletion K)

theorem model_of_coprime (E : WeierstrassCurve K) (A B : WeierstrassCurve (𝓞 K))
    (C D : VariableChange K) (hC : C • E = A.map (algebraMap _ K))
    (hD : D • E = B.map (algebraMap _ K)) (hc : IsCoprime A.Δ B.Δ)
    (v : HeightOneSpectrum (𝓞 K)) : ModelAt E v := by
  let S := v.adicCompletionIntegers K
  let L := v.adicCompletion K
  let f := algebraMap (𝓞 K) S
  letI : IsScalarTower (𝓞 K) (↥S) L := adicCompletion.instIsScalarTower' (R := 𝓞 K) (K := K) (v := v)
  have build (W : WeierstrassCurve (𝓞 K)) (T : VariableChange K)
      (hT : T • E = W.map (algebraMap _ K)) (u : IsUnit (f W.Δ)) : ModelAt E v := by
    refine ⟨T.map (algebraMap K L),W.map f,⟨by simpa using u⟩,?_⟩
    change (W.map (algebraMap (𝓞 K) S)).map (algebraMap S L) = T.map (algebraMap K L) • E.map (algebraMap K L)
    rw [map_variableChange,hT,map_map,map_map]
    rw [← IsScalarTower.algebraMap_eq (𝓞 K) K L,← IsScalarTower.algebraMap_eq (𝓞 K) S L]
  obtain ⟨a,b,h⟩ := hc.map f
  exact (isUnit_or_isUnit_of_add_one h).elim
    (fun u => build A C hC (isUnit_of_mul_isUnit_right u))
    (fun u => build B D hD (isUnit_of_mul_isUnit_right u))

theorem integral_unit (E : WeierstrassCurve K) [E.IsElliptic] [DecidableEq K]
    (hg : ∀ v, ModelAt E v) {ι κ : Type*} [Fintype ι] [Fintype κ]
    (w : ι → ℤ) (hw : ∑ i, w i = 0) (U : ι → E.toAffine.Point) (V : E.toAffine.Point)
    (Q : κ → E.toAffine.Point) {n m a : ℕ} (hn : n%8=2) (h2 : 2<n)
    (hc : (4*n).Coprime (a*m)) (hU : ∀ i, addOrderOf (U i)=4*n) (hV : m • V=0)
    (hQ : ∀ j, a • Q j=0) (hQ0 : ∀ j, Q j≠0)
    (hu : (∏ i, (∏ j, (X (U i+V) - X (Q j))) ^ w i) ≠ 0) :
    ∃ u : (𝓞 K)ˣ, algebraMap (𝓞 K) K u = ∏ i, (∏ j, (X (U i+V) - X (Q j))) ^ w i := by
  apply global_unit _ hu
  intro v
  classical
  let L := v.adicCompletion K
  let E' := E.baseChange L
  letI : E'.IsElliptic := inferInstanceAs ((E.map (algebraMap K L)).IsElliptic)
  let M := pointMap E L
  have hM := pointMap_inj E L
  obtain ⟨l,hl,hlm⟩ := residue_prime K v
  obtain ⟨q,hq,hqf,hql⟩ := exists_divisor n l hn h2
  obtain ⟨C,W₀,h₀,hW⟩ := hg v
  letI := h₀
  have eqn := in_model E' C W₀ hW w hw (fun i => M (U i)) (M V) (fun j => M (Q j))
    hl hq hql hlm (by omega : 0<4*n) hqf (hc.coprime_dvd_left hqf)
    (fun i => (addOrderOf_injective M hM _).trans (hU i))
    (by rw [← map_nsmul,hV,map_zero]) (fun j => by rw [← map_nsmul,hQ,map_zero])
    (fun j hh => hQ0 j (hM (hh.trans (map_zero M).symm)))
  rw [← v.valuedAdicCompletion_eq_valuation']
  change Valued.v (algebraMap K L (∏ i, (∏ j, (X (U i+V) - X (Q j))) ^ w i)) = 1
  have term (i : ι) (j : κ) : X (M (U i)+M V)-X (M (Q j)) =
      algebraMap K L (X (U i+V)-X (Q j)) := by
    rw [← M.map_add,map_sub,x_map E L,x_map E L]
  change Valued.v (∏ i, (∏ j, (X (M (U i)+M V)-X (M (Q j))))^w i)=1 at eqn
  simp only [term,← map_prod,← map_zpow₀] at eqn
  exact eqn

end TunnellCMGlobalModelUnit
#print axioms TunnellCMGlobalModelUnit.integral_unit
