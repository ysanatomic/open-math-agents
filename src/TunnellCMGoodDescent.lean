import TunnellCMGlobalModelUnit
import TunnellCMPotentialGood

/-! A fixed finite set of algebraic coefficients gives potential good reduction at every place. -/
namespace TunnellCMGoodDescent

open WeierstrassCurve IsDedekindDomain NumberField TunnellCoates TunnellCMGlobalModelUnit
open scoped NumberField
noncomputable section
variable {A : Type*} [Field A] [CharZero A] (K : IntermediateField ℚ A)

def liftInt (u : integralClosure ℤ A) (h : u.val ∈ K) : 𝓞 K :=
  ⟨⟨u.val,h⟩,(isIntegral_algHom_iff (K.val.restrictScalars ℤ) Subtype.val_injective).mp u.property⟩

def modelSupport [DecidableEq A] (W : WeierstrassCurve (integralClosure ℤ A)) : Finset A :=
  {W.a₁.val,W.a₂.val,W.a₃.val,W.a₄.val,W.a₆.val}

def changeSupport [DecidableEq A] (C : VariableChange A) : Finset A :=
  {C.u.val,C.r,C.s,C.t}

lemma lift_model [DecidableEq A] (W : WeierstrassCurve (integralClosure ℤ A))
    (h : ∀ x ∈ modelSupport W, x ∈ K) :
    ∃ W' : WeierstrassCurve (𝓞 K), (W'.map (algebraMap (𝓞 K) K)).map K.val.toRingHom =
      W.map (integralClosure ℤ A).val.toRingHom := by
  refine ⟨⟨liftInt K W.a₁ (h _ (by simp [modelSupport])),liftInt K W.a₂ (h _ (by simp [modelSupport])),
    liftInt K W.a₃ (h _ (by simp [modelSupport])),liftInt K W.a₄ (h _ (by simp [modelSupport])),
    liftInt K W.a₆ (h _ (by simp [modelSupport]))⟩,?_⟩
  rfl

lemma lift_change [DecidableEq A] (C : VariableChange A) (h : ∀ x ∈ changeSupport C, x ∈ K) :
    ∃ C' : VariableChange K, C'.map K.val.toRingHom = C := by
  let u : K := ⟨C.u.val,h _ (by simp [changeSupport])⟩
  have hu : u ≠ 0 := fun h => C.u.ne_zero (congrArg Subtype.val h)
  let r : K := ⟨C.r,h _ (by simp [changeSupport])⟩
  let s : K := ⟨C.s,h _ (by simp [changeSupport])⟩
  let t : K := ⟨C.t,h _ (by simp [changeSupport])⟩
  exact ⟨⟨Units.mk0 u hu,r,s,t⟩,by ext <;> rfl⟩

theorem finite_models (A : Type*) [Field A] [CharZero A] [IsAlgClosed A] (n : ℕ) (hn : 0<n) :
    ∃ S : Finset A, ∀ K : IntermediateField ℚ A, ∀ [NumberField K],
      (∀ x ∈ S, x ∈ K) → ∀ v : HeightOneSpectrum (𝓞 K), ModelAt (E (n:K)) v := by
  classical
  obtain ⟨W,V,⟨a,b,hab⟩,⟨C,hC⟩,⟨D,hD⟩⟩ := TunnellCMPotentialGood.two_models A (n : A) (by exact_mod_cast hn.ne')
  let S := modelSupport W ∪ modelSupport V ∪ changeSupport C ∪ changeSupport D ∪ {a.val,b.val}
  refine ⟨S,fun K _ h v => ?_⟩
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
  apply model_of_coprime _ W' V' C' D' hW hV _ v
  refine ⟨liftInt K a ha,liftInt K b hb,?_⟩
  apply (K.val.injective.comp (FaithfulSMul.algebraMap_injective (𝓞 K) K))
  change K.val (algebraMap (𝓞 K) K (_ * _ + _ * _)) = K.val (algebraMap (𝓞 K) K 1)
  simp only [map_add,map_mul,map_one,hΔ,hΔ']
  exact congrArg Subtype.val hab

end
end TunnellCMGoodDescent
#print axioms TunnellCMGoodDescent.finite_models
