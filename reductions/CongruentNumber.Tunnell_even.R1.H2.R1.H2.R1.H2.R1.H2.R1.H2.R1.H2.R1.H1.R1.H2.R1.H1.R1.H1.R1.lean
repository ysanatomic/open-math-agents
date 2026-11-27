import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1_H1_R1
import Mathlib

/-! Finite rational ray norm images and a continuous procyclic quotient give the rational value. A separate finite cyclotomic calculation detects a single supported prime. -/
namespace OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1_H1_R1_H1_R1
open NumberField IsDedekindDomain
open scoped NumberField Classical TensorProduct IsMulCommutative

open Set

private theorem same_subgroup {Z : Type*} [CommGroup Z] {S T Q : Subgroup Z}
    (hS : Q ≤ S) (hT : Q ≤ T)
    (h : S.map (QuotientGroup.mk' Q) = T.map (QuotientGroup.mk' Q)) : S = T := by
  have eq := congrArg (Subgroup.comap (QuotientGroup.mk' Q)) h
  simpa only [Subgroup.comap_map_eq, QuotientGroup.ker_mk', sup_eq_left.mpr hS,
    sup_eq_left.mpr hT] using eq

private theorem norm_images {G Z : Type*} [Group G] [CommGroup Z]
    (H : Subgroup G) [H.FiniteIndex] (d : G →* Z) (hd : Function.Surjective d)
    (F : Type) [Field F] [CharZero F] [FiniteDimensional ℚ F]
    (v : (AdeleRing (𝓞 ℚ) ℚ)ˣ →* Z) (hv : Function.Surjective v)
    (levels : ∀ m : ℕ, 0 < m →
      let A := AdeleRing (𝓞 ℚ) ℚ
      let q := QuotientGroup.mk' (powMonoidHom m : Z →* Z).range
      (v.comp (Units.map (Algebra.norm A (S := A ⊗[ℚ] F)))).range.map q = (H.map d).map q) :
    let A := AdeleRing (𝓞 ℚ) ℚ
    (v.comp (Units.map (Algebra.norm A (S := A ⊗[ℚ] F)))).range = H.map d := by
  let A := AdeleRing (𝓞 ℚ) ℚ
  letI : Nontrivial A := (AdeleRing.algebraMap_injective (𝓞 ℚ) ℚ).nontrivial
  let e := Module.finrank ℚ F
  let m := e * H.index
  have he : 0 < e := Module.finrank_pos
  have hm : 0 < m := Nat.mul_pos he (Nat.pos_of_ne_zero Subgroup.FiniteIndex.index_ne_zero)
  apply same_subgroup (Q := (powMonoidHom m : Z →* Z).range) _ _ (levels m hm)
  · rintro _ ⟨x,rfl⟩
    obtain ⟨a,rfl⟩ := hv x
    refine ⟨Units.map (algebraMap A (A ⊗[ℚ] F)).toMonoidHom (a ^ H.index),?_⟩
    change v _ = (v a) ^ m
    rw [← map_pow]
    apply congrArg v
    apply Units.ext
    change Algebra.norm A (algebraMap A (A ⊗[ℚ] F) (a.val ^ H.index)) = a.val ^ m
    rw [Algebra.norm_algebraMap, Module.finrank_baseChange, ← pow_mul, Nat.mul_comm]
  · rintro _ ⟨x,rfl⟩
    obtain ⟨t,ht⟩ := H.index_map_dvd hd
    have hin := (H.map d).pow_mem ((H.map d).pow_index_mem x) (t * e)
    change x ^ m ∈ H.map d
    rw [← pow_mul] at hin
    convert hin using 2 <;> dsimp only [m] <;> rw [ht] <;> ring

private theorem finite_test {Z : Type*} [CommGroup Z] [TopologicalSpace Z] [IsTopologicalGroup Z] {U : Type*} [CommGroup U] [TopologicalSpace U] (f : U →* Z)
    (cont : Continuous f) {S T : Subgroup U} (h : closure (S : Set U)=closure (T : Set U))
    (n : ℕ) (_hn : 0<n) (ho : IsOpen ((powMonoidHom n : Z →* Z).range : Set Z)) :
    let q := QuotientGroup.mk' (powMonoidHom n : Z →* Z).range
    (S.map f).map q=(T.map f).map q := by
  let N := (powMonoidHom n : Z →* Z).range
  letI : DiscreteTopology (Z ⧸ N) := QuotientGroup.discreteTopology ho
  let g := (QuotientGroup.mk' N).comp f
  have cg : Continuous g := continuous_quot_mk.comp cont
  have eq (B : Set U) : g '' closure B = g '' B := by
    apply le_antisymm _ (image_mono subset_closure)
    exact (image_closure_subset_closure_image cg).trans (closure_minimal (by rfl) (isClosed_discrete _))
  dsimp only
  rw [Subgroup.map_map,Subgroup.map_map]
  apply SetLike.coe_injective
  change g '' (S : Set U)=g '' (T : Set U)
  rw [←eq, h, eq]

def H1 : Prop :=
  (let R := ∀ n:ℕ+,ZMod (n:ℕ)
  let Z := (Int.castRingHom R).range.topologicalClosure
  let G := Gal(SeparableClosure ℚ/ℚ)
  let A := AdeleRing (𝓞 ℚ) ℚ
  ∃ d:G →* Zˣ, Continuous d ∧ Function.Surjective d ∧
  ∃ v:Aˣ →* Zˣ, Function.Surjective v ∧ (∀ x:ℚˣ, v (Units.map (algebraMap ℚ A).toMonoidHom x)=1) ∧
  ∀ H : ClosedSubgroup G, H.toSubgroup.FiniteIndex →
    let F:=IntermediateField.fixedField H.toSubgroup
    closure ((v.comp (Units.map (Algebra.norm A (S:=A⊗[ℚ]F)))).range : Set Zˣ)=closure (H.toSubgroup.map d : Set Zˣ)) ∧ (∀ (m : ℕ), (2 < m) → ∀ (v:HeightOneSpectrum (𝓞 ℚ)) (n:ℕ),
  let A:=AdeleRing (𝓞 ℚ) ℚ
  ∀ z:Aˣ, z.val.1=1 → (∀ w:HeightOneSpectrum (𝓞 ℚ), w≠v → z.val.2 w=1) →
  v.asIdeal.absNorm.Coprime m → -WithZero.log (Valued.v (z.val.2 v))=(n:ℤ) →
  z∈(Units.map (algebraMap ℚ A).toMonoidHom).range ⊔
    (Units.map (Algebra.norm A (S:=A⊗[ℚ]CyclotomicField m ℚ))).range →
  m ∣ v.asIdeal.absNorm ^ n - 1)


def H2 : Prop :=
  let R := ∀ n:ℕ+,ZMod (n:ℕ)
  let Z := (Int.castRingHom R).range.topologicalClosure
  (∃ f : Zˣ →* Multiplicative Z, Continuous f ∧ Function.Surjective f) ∧
    ∀ n:ℕ, 0<n → IsOpen ((powMonoidHom n : Multiplicative Z →* Multiplicative Z).range : Set (Multiplicative Z))


theorem main : H1 → H2 → OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1_H1_R1.H1 := by
  rintro ⟨⟨d,cd,sd,v,sv,kill,close⟩,obstruction⟩ ⟨⟨f,cf,sf⟩,powers⟩
  refine ⟨⟨f.comp d,cf.comp cd,sf.comp sd,f.comp v,sf.comp sv,?_,?_⟩,obstruction⟩
  · intro x
    exact (congrArg f (kill x)).trans f.map_one
  · intro H hi F
    letI := hi
    let Ω := SeparableClosure ℚ
    letI : IsGalois ℚ Ω := @IsSepClosure.isGalois ℚ _ Ω _ ((separableClosure ℚ (AlgebraicClosure ℚ)).algebra)
      (separableClosure.isSepClosure ℚ (AlgebraicClosure ℚ))
    letI : FiniteDimensional ℚ F := (InfiniteGalois.isOpen_iff_finite F).mp (by
      change IsOpen (((IntermediateField.fixedField H.toSubgroup).fixingSubgroup : Subgroup (Gal(SeparableClosure ℚ/ℚ))) : Set (Gal(SeparableClosure ℚ/ℚ)))
      rw [InfiniteGalois.fixingSubgroup_fixedField H]
      exact H.toSubgroup.isOpen_of_isClosed_of_finiteIndex H.isClosed')
    apply norm_images H.toSubgroup (f.comp d) (sf.comp sd) F (f.comp v) (sf.comp sv)
    intro n hn
    have eq := finite_test f cf (close H hi) n hn (powers n hn)
    simpa only [←MonoidHom.range_comp,Subgroup.map_map,MonoidHom.comp_assoc] using eq


end OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1_H1_R1_H1_R1
