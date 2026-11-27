import TunnellNormConjugation
import Mathlib.GroupTheory.SpecificGroups.Cyclic

/-! # The nontrivial residue-characteristic Kummer character of local units -/
namespace TunnellKummerArtinCharacter
open LocalClassFieldTheory LocalFieldTheory LocalFieldTheory.IsNonarchimedeanLocalField
open scoped ValuativeRel IsMulCommutative

private lemma periodic_not_lt {X Y:Type*} [Preorder Y] (f:X→X) (v:X→Y)
    (h:∀ x y,v x<v y → v (f x)<v (f y)) (x:X) {m:ℕ} (hm:0<m) (per:f^[m] x=x) : ¬v x<v (f x) := by
  intro hx
  have hs (n:ℕ) : v (f^[n] x)<v (f^[n+1] x) := by
    induction n with
    | zero => simpa using hx
    | succ n ih =>
      rw [Function.iterate_succ_apply' f (n+1),Function.iterate_succ_apply' f n]
      apply h
      simpa only [Function.iterate_succ_apply' f n] using ih
  have hh := (strictMono_nat_of_lt_succ hs) hm
  simpa [per] using hh

lemma stable_valuation {T K:Type} [Field T] [Field K] [Algebra K T] [FiniteDimensional K T]
    [ValuativeRel T] (δ:Gal(T/K)) (hc:SemilinearValuationCompatible T T δ.toRingEquiv) (x:T) :
    ValuativeRel.valuation T (δ x)=ValuativeRel.valuation T x := by
  let v := ValuativeRel.valuation T
  have hi (a b:T) : v a<v b → v (δ a)<v (δ b) := by
    letI : Algebra T T := δ.toRingEquiv.toRingHom.toAlgebra
    haveI : v.HasExtension v := hc
    exact (Valuation.HasExtension.val_map_lt_iff v v a b).mpr
  have per : (δ:T→T)^[orderOf δ] x=x := by
    rw [←AlgEquiv.coe_pow,pow_orderOf_eq_one]; rfl
  have p := orderOf_pos δ
  have hl := periodic_not_lt (δ:T→T) v hi x p per
  have hr := periodic_not_lt (Y:=(ValuativeRel.ValueGroupWithZero T)ᵒᵈ) (δ:T→T) v (fun _ _ h => hi _ _ h) x p per
  exact le_antisymm (le_of_not_gt hl) (le_of_not_gt hr)

lemma unit_displacement {T K:Type} [Field T] [Field K] [Algebra K T] [FiniteDimensional K T]
    [ValuativeRel T] (δ:Gal(T/K)) (hc:SemilinearValuationCompatible T T δ.toRingEquiv) (x:Tˣ) :
    ∃ u:𝒪[T]ˣ, integerUnitsToFieldUnits T u=Units.map δ.toRingEquiv.toMonoidHom x/x := by
  let y := Units.map δ.toRingEquiv.toMonoidHom x/x
  have hy : ValuativeRel.valuation T (y:T)=1 := by
    dsimp only [y]
    rw [Units.val_div_eq_div_val,Units.coe_map]
    change ValuativeRel.valuation T (δ (x:T)/(x:T))=1
    rw [map_div₀,stable_valuation δ hc,div_self ((map_ne_zero (ValuativeRel.valuation T)).mpr x.ne_zero)]
  let u : 𝒪[T]ˣ :=
    { val := ⟨(y:T),hy.le⟩
      inv := ⟨((y:T)⁻¹),by change ValuativeRel.valuation T ((y:T)⁻¹) ≤ 1; rw [map_inv₀,hy,inv_one]⟩
      val_inv := Subtype.ext (mul_inv_cancel₀ y.ne_zero)
      inv_val := Subtype.ext (inv_mul_cancel₀ y.ne_zero) }
  exact ⟨u,Units.ext rfl⟩

variable {T L:Type} [Field T] [ValuativeRel T] [TopologicalSpace T] [IsNonarchimedeanLocalField T]
    [Field L] [Algebra T L] [FiniteDimensional T L] [IsAbelianGalois T L]

/-- Artin reciprocity composed with the exponent-p quotient of a cyclic Kummer group.
Conjugation by a tame lift acts on the character by the same scalar as on translations. -/
theorem character {p:ℕ} [Fact p.Prime] [IsCyclic Gal(L/T)] (hp:p∣Nat.card Gal(L/T)) :
    ∃ α : Additive Tˣ →+ ZMod p, Function.Surjective α ∧
      (∀ y:Lˣ, α (Additive.ofMul (normUnits T L y))=0) ∧
      ∀ (δ:T≃+*T) (σ:L≃+*L) (h:∀x:T,σ (algebraMap T L x)=algebraMap T L (δ x))
        (hc:SemilinearValuationCompatible T T δ) (k:ℤ)
        (_:∀g:Gal(L/T),semilinearGaloisGroupCongr T T L L δ σ h g=g^k) (x:Tˣ),
        α (Additive.ofMul (Units.map δ.toMonoidHom x))=(k:ZMod p)*α (Additive.ofMul x) := by
  let G := Gal(L/T)
  let e := zmodAddCyclicAddEquiv (G:=Additive G) inferInstance
  let κ : Additive G→+ZMod p := (ZMod.castHom (show p∣Nat.card (Additive G) from hp) (ZMod p)).toAddMonoidHom.comp e.symm.toAddMonoidHom
  let Art := abelianLocalArtinMonoidHom T L
  let α := κ.comp Art.toAdditive
  have hκ : Function.Surjective κ := (ZMod.castHom_surjective hp).comp e.symm.surjective
  refine ⟨α,hκ.comp (abelianLocalArtinMonoidHom_surjective T L),?_,?_⟩
  · intro y
    have hmem : normUnits T L y∈Art.ker := by
      rw [show Art.ker=localNormSubgroup T L from abelianLocalArtinMonoidHom_ker T L]
      exact ⟨y,rfl⟩
    have he : Art (normUnits T L y)=1 := hmem
    change κ (Additive.ofMul (Art (normUnits T L y)))=0
    rw [he]; exact map_zero κ
  · intro δ σ h hc k hk x
    have hArt := abelianLocalArtinMonoidHom_semilinear_conjugation_apply T T L L δ σ h hc x
    rw [hk] at hArt
    change κ (Additive.ofMul (Art (Units.map δ.toMonoidHom x)))=(k:ZMod p)*κ (Additive.ofMul (Art x))
    rw [hArt.symm]
    change κ (k • Additive.ofMul (Art x))=_
    rw [map_zsmul,zsmul_eq_mul]

/-- On a nontrivial tame eigenspace, a surjective field character restricts nontrivially
to integer units. -/
theorem nontrivial_on_units {K:Type} [Field K] [Algebra K T] [FiniteDimensional K T] {p:ℕ} [Fact p.Prime]
    (α:Additive Tˣ→+ZMod p) (ha:Function.Surjective α) (δ:Gal(T/K)) (hc:SemilinearValuationCompatible T T δ.toRingEquiv)
    (k:ZMod p) (hk:k≠1) (he:∀x:Tˣ, α (Additive.ofMul (Units.map δ.toRingEquiv.toMonoidHom x))=k*α (Additive.ofMul x)) :
    ∃ u:𝒪[T]ˣ, α (Additive.ofMul (integerUnitsToFieldUnits T u))≠0 := by
  obtain ⟨x,hx⟩ := ha 1
  obtain ⟨u,hu⟩ := unit_displacement δ hc (Additive.toMul x)
  refine ⟨u,?_⟩
  rw [hu]
  change α (Additive.ofMul (Units.map δ.toRingEquiv.toMonoidHom (Additive.toMul x))-x)≠0
  rw [map_sub,he]
  change k*α x-α x≠0
  rw [hx,mul_one]
  exact sub_ne_zero.mpr hk

#print axioms character
#print axioms nontrivial_on_units
end TunnellKummerArtinCharacter
