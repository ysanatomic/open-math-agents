import TunnellCMGoodDivisionField
import TunnellCMGoodGlobalModels

/-! Equivariance under changes of model defined over the base field. -/
namespace TunnellCMChangedInertia
open WeierstrassCurve WeierstrassCurve.Affine TunnellKummer TunnellCMGoodInertiaAction
open IsDedekindDomain IsLocalRing NumberField
open scoped NumberField
noncomputable section
variable {F N : Type*} [Field F] [Field N] [Algebra F N] [DecidableEq N]
variable (W : WeierstrassCurve F) (C : VariableChange F) [W.IsElliptic]

def changed : CurvePoints (C • W) N ≃+ CurvePoints W N :=
  letI : (W.baseChange N).IsElliptic := inferInstanceAs ((W.map (algebraMap F N)).IsElliptic)
  (Point.equivOfEq (map_variableChange W C (algebraMap F N)).symm).trans
    (Point.equivVariableChange (W.baseChange N) (C.map (algebraMap F N)))

lemma changed_action (σ : N ≃ₐ[F] N) (P : CurvePoints (C • W) N) :
    changed W C (act (C • W) σ P)=act W σ (changed W C P) := by
  cases P with
  | zero =>
    change changed W C (act (C • W) σ 0)=act W σ (changed W C 0)
    simp only [map_zero]
  | some x y h =>
    have ex : ∀ {x y : N} (h : ((C • W).baseChange N).toAffine.Nonsingular x y),
        ∃ h', changed W C (Point.some x y h)=Point.some ((algebraMap F N C.u.val)^2*x+algebraMap F N C.r)
          ((algebraMap F N C.u.val)^3*y+(algebraMap F N C.u.val)^2*algebraMap F N C.s*x+algebraMap F N C.t) h' := by
      intro x y h
      letI : (W.baseChange N).IsElliptic := inferInstanceAs ((W.map (algebraMap F N)).IsElliptic)
      change ∃ h', Point.equivVariableChange (W.baseChange N) (C.map (algebraMap F N))
        (Point.equivOfEq (map_variableChange W C (algebraMap F N)).symm (.some x y h))=Point.some _ _ h'
      rw [Point.equivOfEq_some (map_variableChange W C (algebraMap F N)).symm h]
      exact ⟨_,rfl⟩
    obtain ⟨h',hh⟩ := ex h
    rw [hh]
    change changed W C (Point.some (σ x) (σ y) _) = Point.some _ _ _
    refine (ex (x := σ x) (y := σ y) _).choose_spec.trans ?_
    apply Point.some_eq_some
    · change _=σ ((algebraMap F N C.u.val)^2*x+algebraMap F N C.r)
      simp only [map_add,map_mul,map_pow,σ.commutes]
    · change _=σ ((algebraMap F N C.u.val)^3*y+(algebraMap F N C.u.val)^2*algebraMap F N C.s*x+algebraMap F N C.t)
      simp only [map_add,map_mul,map_pow,σ.commutes]

variable [NumberField N] (v : HeightOneSpectrum (𝓞 N))
local notation "O" => v.adicCompletionIntegers N
local notation "L" => v.adicCompletion N

theorem fixes_after_change (W₀ : WeierstrassCurve O)
    (hW : W₀.map (algebraMap O L)=((C • W).baseChange N).baseChange L)
    [W₀.IsElliptic] [(((C • W).baseChange N).baseChange L).IsElliptic]
    [DecidableEq L] [DecidableEq (ResidueField O)]
    (σ : N ≃ₐ[F] N) (hσ : σ∈v.asIdeal.inertia (N ≃ₐ[F] N))
    {l p : ℕ} (hl : l.Prime) (hp : p.Prime) (hne : p≠l) (hchar : (l:O)∈maximalIdeal O)
    (r : ℕ) (P : CurvePoints W N) (hP : act W σ (p^r • P)=p^r • P) :
    act W σ P=P := by
  let e := changed W C (N := N)
  have fixed : act (C • W) σ (p^r • e.symm P)=p^r • e.symm P := by
    apply e.injective
    rw [changed_action,map_nsmul,e.apply_symm_apply,hP]
  have hh := inertia_fixes_division v (C • W) W₀ hW σ hσ hl hp hne hchar r _ fixed
  have eq := congrArg e hh
  rw [changed_action,e.apply_symm_apply] at eq
  exact eq

end
end TunnellCMChangedInertia
#print axioms TunnellCMChangedInertia.fixes_after_change
