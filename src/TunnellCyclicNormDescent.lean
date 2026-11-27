import TunnellNormDescent
import TunnellKummerArtinCharacter

/-! Descent of a Kummer character to the first local division level. -/
namespace TunnellCyclicNormDescent
open LocalClassFieldTheory LocalFieldTheory LocalFieldTheory.IsNonarchimedeanLocalField
open scoped ValuativeRel

private theorem descend {A B k:Type*} [AddCommGroup A] [AddCommGroup B] [Field k]
    (N:A→+B) (s d:A→+A) (D:B→+B) (q:k) (hq:q≠1)
    (hN:∀ x,N (d x)=D (N x))
    (h90:∀ x,N x=0 → ∃ y,x=y-s y)
    (hrange:∀ x,∃ y,N y=D x-x)
    (α:A→+k) (ha:Function.Surjective α) (hs:∀ x,α (s x)=α x) (hd:∀ x,α (d x)=q*α x) :
    ∃ β:B→+k,Function.Surjective β ∧ (∀ x,β (N x)=α x) ∧ ∀ x,β (D x)=q*β x := by
  have same (x y:A) (h:N x=N y) : α x=α y := by
    have hh : N (x-y)=0 := by rw [map_sub,h,sub_self]
    obtain ⟨t,ht⟩ := h90 _ hh
    apply sub_eq_zero.mp
    rw [←map_sub,ht,map_sub,hs,sub_self]
  let l (x:B) := (hrange x).choose
  have hl (x:B) : N (l x)=D x-x := (hrange x).choose_spec
  have hn : q-1≠0 := sub_ne_zero.mpr hq
  let β:B→+k := {
    toFun x := α (l x)/(q-1)
    map_zero' := by
      have h : α (l 0)=α 0 := same _ _ (by simp [hl])
      rw [h,map_zero,zero_div]
    map_add' x y := by
      have h : α (l (x+y))=α (l x+l y) :=
        same _ _ (by rw [hl,map_add,map_add,hl,hl]; abel)
      rw [h,map_add,add_div] }
  have hb (x:A) : β (N x)=α x := by
    have h : α (l (N x))=α (d x-x) := same _ _ (by rw [hl,map_sub,hN])
    change α (l (N x))/(q-1)=α x
    rw [h,map_sub,hd,div_eq_iff hn]; ring
  refine ⟨β,fun x => ?_,hb,fun x => ?_⟩
  · obtain ⟨y,hy⟩ := ha x
    exact ⟨N y,(hb y).trans hy⟩
  · have h : α (l (D x))=α (d (l x)) := same _ _ (by rw [hl,hN,hl,map_sub])
    change α (l (D x))/(q-1)=q*(α (l x)/(q-1))
    rw [h,hd,mul_div_assoc]

variable {K T L:Type} [Field K] [ValuativeRel K] [Field T] [ValuativeRel T] [TopologicalSpace T]
    [IsNonarchimedeanLocalField T] [Field L] [Algebra K T]
    [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation T)] [IsIntegralClosure 𝒪[T] 𝒪[K] T]
    [Algebra T L] [Algebra K L] [IsScalarTower K T L] [FiniteDimensional T L] [IsAbelianGalois K L]

/-- The norm-compatible character is defined on the entire multiplicative group of
the first torsion field. Its restriction to integral units is nonzero. -/
theorem first_level [FiniteDimensional K T] [IsCyclic Gal(L/T)]
    (s:Gal(L/T)) (hs:∀ g,g∈Subgroup.zpowers s)
    (D:Gal(T/K)) (d:Gal(L/K)) (hc:∀x:T,d (algebraMap T L x)=algebraMap T L (D x))
    {p:ℕ} [Fact p.Prime] (q:ZMod p) (hq:q≠1)
    (α:Additive Lˣ→+ZMod p) (ha:Function.Surjective α)
    (hsα:∀x:Lˣ,α (Additive.ofMul (Units.map s.toMonoidHom x))=α (Additive.ofMul x))
    (hdα:∀x:Lˣ,α (Additive.ofMul (Units.map d.toMonoidHom x))=q*α (Additive.ofMul x)) :
    ∃ β:Additive Tˣ→+ZMod p, (∃ u:𝒪[T]ˣ,β (Additive.ofMul (integerUnitsToFieldUnits T u))≠0) ∧
      (∀ x:Lˣ,β (Additive.ofMul (normUnits T L x))=α (Additive.ofMul x)) ∧
      ∀ x:Tˣ,β (Additive.ofMul (Units.map D.toMonoidHom x))=q*β (Additive.ofMul x) := by
  haveI := IsAbelianGalois.tower_top K T L
  let N := (normUnits T L).toAdditive
  let sd := (Units.map s.toMonoidHom).toAdditive
  let dd := (Units.map d.toMonoidHom).toAdditive
  let DD := (Units.map D.toMonoidHom).toAdditive
  have hN (x:Additive Lˣ) : N (dd x)=DD (N x) := by
    apply Units.ext
    change Algebra.norm T (d (x.toMul:L))=D (Algebra.norm T (x.toMul:L))
    have e : (algebraMap T L).comp D.toRingHom=d.toRingHom.comp (algebraMap T L) :=
      RingHom.ext (fun x => (hc x).symm)
    symm
    rw [Algebra.norm_eq_of_equiv_equiv D.toRingEquiv d.toRingEquiv e]
    exact D.apply_symm_apply _
  obtain ⟨β,hβ,hNβ,hDβ⟩ := descend N sd dd DD q hq hN
    (fun x hx => TunnellNormDescent.norm_hilbert90 s hs x.toMul hx)
    (fun x => TunnellNormDescent.displacement_is_norm K T L D d hc x.toMul) α ha hsα hdα
  exact ⟨β,TunnellKummerArtinCharacter.nontrivial_on_units β hβ D
    (TunnellNormDescent.galois_valuation_compatible K T D) q hq hDβ,hNβ,hDβ⟩

#print axioms first_level
end TunnellCyclicNormDescent
