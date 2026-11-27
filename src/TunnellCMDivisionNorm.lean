import TunnellCMGaloisDistribution
import Mathlib.FieldTheory.PrimitiveElement

/-! Turning a product over a complete division fibre into the relative field norm. -/
namespace TunnellCMDivisionNorm
open WeierstrassCurve WeierstrassCurve.Affine TunnellKummer TunnellCMGaloisDistribution
noncomputable section
variable {K D N B : Type*} [Field K] [Field D] [Field N] [Field B]
  [Algebra K D] [Algebra K N] [Algebra K B] [Algebra D N] [Algebra D B] [Algebra N B]
  [IsScalarTower K D N] [IsScalarTower K D B] [IsScalarTower K N B] [IsScalarTower D N B]
  [DecidableEq N] [DecidableEq B] [FiniteDimensional D N] [Algebra.IsSeparable D N]
  [Normal D B] [IsAlgClosed B]
variable (W : WeierstrassCurve K)
local notation "inc" => IsScalarTower.toAlgHom K N B

lemma point_conjugate (τ : B ≃ₐ[D] B) (P : CurvePoints W N) :
    act W (τ.restrictScalars K) (Point.map (W' := W.toAffine) inc P)=
      Point.map (W' := W.toAffine) ((τ.toAlgHom.comp (IsScalarTower.toAlgHom D N B)).restrictScalars K) P := by
  cases P <;> rfl

lemma embeddings_separate {x y : N} (hgen : IntermediateField.adjoin D {x,y}=⊤)
    {s t : N →ₐ[D] B} (hx : s x=t x) (hy : s y=t y) : s=t := by
  ext u
  have hu : u∈IntermediateField.adjoin D {x,y} := hgen ▸ trivial
  induction hu using IntermediateField.adjoin_induction with
  | mem v hv => rcases hv with (rfl|h); exact hx; obtain rfl := Set.mem_singleton_iff.mp h; exact hy
  | algebraMap => simp
  | add _ _ _ _ e f => simp only [map_add,e,f]
  | mul _ _ _ _ e f => simp only [map_mul,e,f]
  | inv _ _ e => simp only [map_inv₀,e]

theorem field_norm (φ : CurvePoints W B →+ CurvePoints W B) [Fintype φ.ker]
    (hφ : ∀ τ : B ≃ₐ[K] B, ∀ P, φ (act W τ P)=act W τ (φ P))
    (g : CurvePoints W B → B) (hg : ∀ τ : B ≃ₐ[K] B, ∀ P, τ (g P)=g (act W τ P))
    {x y : N} (h : (W.baseChange N).toAffine.Nonsingular x y)
    (hgen : IntermediateField.adjoin D {x,y}=⊤) (hdegree : Module.finrank D N=Nat.card φ.ker)
    (u : N) (P : CurvePoints W B) (hP : P=Point.map (W' := W.toAffine) inc (Point.some x y h))
    (hu : algebraMap N B u=g P) (hfixed : ∀ τ : B ≃ₐ[D] B, act W (τ.restrictScalars K) (φ P)=φ P) :
    algebraMap D B (Algebra.norm D u)=∏ j : φ.ker, g (P+j.val) := by
  classical
  let Q (σ : N →ₐ[D] B) := Point.map (W' := W.toAffine) (σ.restrictScalars K) (Point.some x y h)
  have conj (σ : N →ₐ[D] B) : ∃ τ : B ≃ₐ[D] B, Q σ=act W (τ.restrictScalars K) P ∧ σ u=τ (algebraMap N B u) := by
    obtain ⟨τ,hτ⟩ := lift_embedding σ
    refine ⟨τ,?_,?_⟩
    · rw [hP,point_conjugate,hτ]
    · exact (DFunLike.congr_fun hτ u).symm
  have diff (σ : N →ₐ[D] B) : φ (Q σ-P)=0 := by
    obtain ⟨τ,hτ,_⟩ := conj σ
    rw [map_sub,hτ,hφ,hfixed,sub_self]
  let f (σ : N →ₐ[D] B) : φ.ker := ⟨Q σ-P,diff σ⟩
  have fi : Function.Injective f := by
    intro s t eq
    have hh : Q s-P=Q t-P := congrArg Subtype.val eq
    have eq' : Q s=Q t := sub_left_inj.mp hh
    have xy := Point.some.inj eq'
    exact embeddings_separate hgen xy.1 xy.2
  have cc : Fintype.card (N →ₐ[D] B)=Fintype.card φ.ker := by
    rw [AlgHom.card D N B,hdegree,Nat.card_eq_fintype_card]
  let e := Equiv.ofBijective f ((Fintype.bijective_iff_injective_and_card f).mpr ⟨fi,cc⟩)
  rw [Algebra.norm_eq_prod_embeddings D B u,← Equiv.prod_comp e (fun j : φ.ker => g (P+j.val))]
  apply Finset.prod_congr rfl
  intro σ _
  obtain ⟨τ,hτ,hs⟩ := conj σ
  change σ u=g (P+(Q σ-P))
  rw [add_sub_cancel,hs,hu,hτ]
  exact hg (τ.restrictScalars K) P

end
end TunnellCMDivisionNorm
#print axioms TunnellCMDivisionNorm.field_norm
