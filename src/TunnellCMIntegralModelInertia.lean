import TunnellCMChangedInertia

/-! Prime-to-residue-characteristic division over a field carrying the two global integral models. -/
namespace TunnellCMIntegralModelInertia
open WeierstrassCurve WeierstrassCurve.Affine IsDedekindDomain IsDedekindDomain.HeightOneSpectrum
open IsLocalRing NumberField TunnellKummer TunnellCMChangedInertia
open scoped NumberField
noncomputable section
variable {F N : Type*} [Field F] [Field N] [NumberField F] [NumberField N] [Algebra F N]
  [DecidableEq N] (v : HeightOneSpectrum (𝓞 N))
local notation "O" => v.adicCompletionIntegers N
local notation "L" => v.adicCompletion N

theorem fixed (W : WeierstrassCurve F) [W.IsElliptic] (A B : WeierstrassCurve (𝓞 F))
    (C D : VariableChange F) (hC : C • W=A.map (algebraMap (𝓞 F) F))
    (hD : D • W=B.map (algebraMap (𝓞 F) F)) (hab : IsCoprime A.Δ B.Δ)
    [DecidableEq L] [DecidableEq (ResidueField O)]
    (σ : N ≃ₐ[F] N) (hσ : σ∈v.asIdeal.inertia (N ≃ₐ[F] N))
    {l p : ℕ} (hl : l.Prime) (hp : p.Prime) (hne : p≠l) (hchar : (l:O)∈maximalIdeal O)
    (r : ℕ) (P : CurvePoints W N) (hP : act W σ (p^r • P)=p^r • P) : act W σ P=P := by
  let f := (algebraMap (𝓞 N) O).comp (algebraMap (𝓞 F) (𝓞 N))
  letI : IsScalarTower (𝓞 N) O L := adicCompletion.instIsScalarTower' (R := 𝓞 N) (K := N) (v := v)
  have comm : (algebraMap O L).comp f=((algebraMap N L).comp (algebraMap F N)).comp (algebraMap (𝓞 F) F) := by
    apply RingHom.ext
    intro z
    change algebraMap O L (algebraMap (𝓞 N) O (algebraMap (𝓞 F) (𝓞 N) z))=_
    rw [← IsScalarTower.algebraMap_apply (𝓞 N) O L,IsScalarTower.algebraMap_apply (𝓞 N) N L]
    rfl
  have build (V : WeierstrassCurve (𝓞 F)) (T : VariableChange F)
      (hV : T • W=V.map (algebraMap _ F)) (hΔ : IsUnit (f V.Δ)) : act W σ P=P := by
    let W₀ := V.map f
    letI : W₀.IsElliptic := ⟨by simpa [W₀] using hΔ⟩
    letI : ((T • W).baseChange N).IsElliptic := inferInstanceAs (((T • W).map (algebraMap F N)).IsElliptic)
    letI : (((T • W).baseChange N).baseChange L).IsElliptic :=
      inferInstanceAs ((((T • W).baseChange N).map (algebraMap N L)).IsElliptic)
    apply fixes_after_change W T v W₀ _ σ hσ hl hp hne hchar r P hP
    change (V.map f).map (algebraMap O L)=((T • W).map (algebraMap F N)).map (algebraMap N L)
    rw [hV,map_map,map_map,map_map,comm,RingHom.comp_assoc]
  obtain ⟨a,b,h⟩ := hab.map f
  exact (isUnit_or_isUnit_of_add_one h).elim (fun u => build A C hC (isUnit_of_mul_isUnit_right u))
    (fun u => build B D hD (isUnit_of_mul_isUnit_right u))

end
end TunnellCMIntegralModelInertia
#print axioms TunnellCMIntegralModelInertia.fixed
