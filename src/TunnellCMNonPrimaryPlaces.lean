import TunnellCMUnramifiedDescent
import TunnellCMGoodDivisionField

/-! Descent of unramifiedness at every residual characteristic different
from the primary division prime, using coordinates of the lift. -/
namespace TunnellCMNonPrimaryPlaces
open IsLocalRing IsDedekindDomain IsDedekindDomain.HeightOneSpectrum NumberField
open TunnellKummer TunnellCMUnramifiedDescent WeierstrassCurve WeierstrassCurve.Affine
open AlgebraicNumberTheory.Valuations
open scoped NumberField Classical
noncomputable section
variable {D N F M : Type} [Field D] [NumberField D] [Field N] [NumberField N] [Field F] [NumberField F]
  [Field M] [NumberField M] [Algebra D N] [Algebra D F] [Algebra N M] [Algebra F M] [Algebra D M]
  [IsScalarTower D F M] [IsScalarTower D N M] [FiniteDimensional D F] [FiniteDimensional D N]
  [FiniteDimensional F M] [IsGalois D N] [IsGalois F M]

lemma above (w : HeightOneSpectrum (𝓞 N)) : ∃ t : HeightOneSpectrum (𝓞 M), t.asIdeal.LiesOver w.asIdeal := by
  obtain ⟨q,hq,h⟩ := Ideal.exists_maximal_ideal_liesOver_of_isIntegral (S:=𝓞 M) w.asIdeal
  exact ⟨⟨q,hq.isPrime,Ring.ne_bot_of_isMaximal_of_not_isField hq (RingOfIntegers.not_isField M)⟩,h⟩

theorem unramified (W : WeierstrassCurve F) [W.IsElliptic] (A B : WeierstrassCurve (𝓞 F))
    (C E : VariableChange F) (hC : C • W=A.map (algebraMap (𝓞 F) F))
    (hE : E • W=B.map (algebraMap (𝓞 F) F)) (hab : IsCoprime A.Δ B.Δ)
    {p r k : ℕ} (hp : p.Prime) (hsmall : Module.finrank D F<p) (hd : Module.finrank D N∣p^k)
    {x y : M} (hxy : (W.baseChange M).toAffine.Nonsingular x y)
    (hgen : IntermediateField.adjoin F {x,y}=⊤)
    (hfix : ∀ σ : M ≃ₐ[F] M, act W σ (p^r • Point.some _ _ hxy)=p^r • Point.some _ _ hxy)
    (v : HeightOneSpectrum (𝓞 D)) (hv : (p:𝓞 D)∉v.asIdeal)
    (w : HeightOneSpectrum (𝓞 N)) [w.asIdeal.LiesOver v.asIdeal] :
    w.asIdeal.ramificationIdx (𝓞 D)=1 := by
  obtain ⟨t,ht⟩:=above (M:=M) w
  letI := ht
  let u:=finitePlaceBelow (K:=F) t
  letI : t.asIdeal.LiesOver u.asIdeal := (inferInstance : t.asIdeal.LiesOver (t.asIdeal.under (𝓞 F)))
  letI : t.asIdeal.LiesOver v.asIdeal := Ideal.LiesOver.trans t.asIdeal w.asIdeal v.asIdeal
  letI : u.asIdeal.LiesOver v.asIdeal := (inferInstance : (t.asIdeal.under (𝓞 F)).LiesOver v.asIdeal)
  apply descend v w u t hp hsmall hd
  apply TunnellCMGoodDivisionField.unramified_of_trivial t u
  apply le_antisymm _ bot_le
  intro σ hσ
  change σ=1
  obtain ⟨l,hl,hm⟩:=TunnellCMModelUnit.residue_prime M t
  have hne : p≠l := by
    rintro rfl
    apply hv
    apply (Ideal.mem_of_liesOver t.asIdeal v.asIdeal _).mpr
    rw [map_natCast,←t.comap_maximalIdeal_adicCompletionIntegers (K:=M),Ideal.mem_comap,map_natCast]
    exact hm
  have hs:=TunnellCMIntegralModelInertia.fixed t W A B C E hC hE hab σ hσ hl hp hne hm r _ (hfix σ)
  change Point.some (σ x) (σ y) _=Point.some x y _ at hs
  exact autos_eq_of_generate hgen σ 1 (Point.some.inj hs).1 (Point.some.inj hs).2

end
end TunnellCMNonPrimaryPlaces
#print axioms TunnellCMNonPrimaryPlaces.unramified
