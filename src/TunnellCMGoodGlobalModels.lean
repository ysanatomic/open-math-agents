import TunnellCMGoodDescent

/-! Good equations and their coordinate changes are defined over a fixed number field. -/
namespace TunnellCMGoodGlobalModels
open WeierstrassCurve IsDedekindDomain NumberField TunnellCoates TunnellCMGoodDescent
open scoped NumberField
noncomputable section
theorem global_models (A : Type*) [Field A] [CharZero A] [IsAlgClosed A] (n : ℕ) (hn : 0<n) :
    ∃ S : Finset A, ∀ K : IntermediateField ℚ A, ∀ [NumberField K],
      (∀ x ∈ S, x ∈ K) → ∃ V W : WeierstrassCurve (𝓞 K), ∃ C D : VariableChange K,
        C • E (n:K)=V.map (algebraMap (𝓞 K) K) ∧ D • E (n:K)=W.map (algebraMap (𝓞 K) K) ∧ IsCoprime V.Δ W.Δ := by
  classical
  obtain ⟨W,V,⟨a,b,hab⟩,⟨C,hC⟩,⟨D,hD⟩⟩ := TunnellCMPotentialGood.two_models A (n : A) (by exact_mod_cast hn.ne')
  let S := modelSupport W ∪ modelSupport V ∪ changeSupport C ∪ changeSupport D ∪ {a.val,b.val}
  refine ⟨S,fun K _ h => ?_⟩
  have build (W : WeierstrassCurve (integralClosure ℤ A)) (C : VariableChange A)
      (h1 : ∀ x ∈ modelSupport W, x ∈ K) (h2 : ∀ x ∈ changeSupport C, x ∈ K)
      (hC : C • E (n:A) = W.map (integralClosure ℤ A).val) :
      ∃ W' : WeierstrassCurve (𝓞 K), ∃ C' : VariableChange K,
        C' • E (n:K) = W'.map (algebraMap (𝓞 K) K) ∧
        K.val (algebraMap (𝓞 K) K W'.Δ) = W.Δ.val := by
    obtain ⟨W',hW'⟩ := lift_model K W h1
    obtain ⟨C',hC'⟩ := lift_change K C h2
    refine ⟨W',C',(map_injective K.val.injective ?_),?_⟩
    · change (C' • E (n:K)).map K.val.toRingHom = (W'.map (algebraMap (𝓞 K) K)).map K.val.toRingHom
      rw [← map_variableChange,hC',hW']
      have eqn : (E (n:K)).map K.val.toRingHom = E (n:A) := by ext <;> simp [E]
      rw [eqn,hC]
      rfl
    · have hh := congrArg WeierstrassCurve.Δ hW'
      simp only [map_Δ] at hh
      exact hh
  obtain ⟨W',C',hW,hΔ⟩ := build W C (fun x hx => h x (by simp [S,hx])) (fun x hx => h x (by simp [S,hx])) hC
  obtain ⟨V',D',hV,hΔ'⟩ := build V D (fun x hx => h x (by simp [S,hx])) (fun x hx => h x (by simp [S,hx])) hD
  have ha := h a.val (by simp [S])
  have hb := h b.val (by simp [S])
  refine ⟨W',V',C',D',hW,hV,?_⟩
  refine ⟨liftInt K a ha,liftInt K b hb,?_⟩
  apply (K.val.injective.comp (FaithfulSMul.algebraMap_injective (𝓞 K) K))
  change K.val (algebraMap (𝓞 K) K (_ * _ + _ * _)) = K.val (algebraMap (𝓞 K) K 1)
  simp only [map_add,map_mul,map_one,hΔ,hΔ']
  exact congrArg Subtype.val hab

end
end TunnellCMGoodGlobalModels
#print axioms TunnellCMGoodGlobalModels.global_models
