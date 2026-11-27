import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H3_R1_H1_R1_H3_R1_H2_R1
import Mathlib

/-! Local roots determine a cyclic Kummer extension. Approximation by global S-units makes each idele class a norm in that extension. The first norm inequality forces degree one, and saturation descends the root to the S-unit group. -/
namespace OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H3_R1_H1_R1_H3_R1_H2_R1_H2_R1
open NumberField IsDedekindDomain
open scoped NumberField TensorProduct Classical

def H1 : Prop :=
  ∀(D:Type)[Field D][NumberField D](p:ℕ),p.Prime → (primitiveRoots p D).Nonempty →
   let V:=HeightOneSpectrum (𝓞 D)
   ∀ S T:Finset V,(∀v:V,v.asIdeal ∣ Ideal.span {(p:𝓞 D)} → v∈S) →
    ∀x:(↑(S∪T):Set V).unit D,(∀w:InfinitePlace D,∃ y:w.Completion,y^p=(x.val.val:w.Completion)) →
    (∀v∈S,∃y:v.adicCompletion D,y^p=(x.val.val:v.adicCompletion D)) →
    ∃ M:IntermediateField D (SeparableClosure D),FiniteDimensional D M ∧ IsGalois D M ∧ IsCyclic Gal(M/D) ∧
       (∃z:M,z^p=algebraMap D M x.val.val) ∧ let norm (F:Type) [Field F] [Algebra D F]:=(Units.map (Algebra.norm F (S:=F⊗[D]M))).range
    (∀w:InfinitePlace D,norm w.Completion=⊤) ∧ (∀v∈S,norm (v.adicCompletion D)=⊤) ∧
    (∀v∈T,(powMonoidHom p:(v.adicCompletion D)ˣ→*(v.adicCompletion D)ˣ).range≤norm (v.adicCompletion D)) ∧
    (∀v:V,v∉S∪T → (Units.map (v.adicCompletionIntegers D).subtype.toMonoidHom).range≤norm (v.adicCompletion D))

def H2 : Prop :=
  ∀(D M:Type)[Field D][NumberField D][Field M][Algebra D M][FiniteDimensional D M][IsGalois D M][IsCyclic Gal(M/D)]
    (p:ℕ),0<p → let V:=HeightOneSpectrum (𝓞 D)
    let A:=AdeleRing (𝓞 D) D
   let J(F:Finset V):=Subgroup.closure {a:Aˣ | ∀ v:V,v∉F → a.val.2 v∈v.adicCompletionIntegers D ∧ (a⁻¹).val.2 v∈v.adicCompletionIntegers D}
   let j:=Units.map (algebraMap D A).toMonoidHom
    ∀S T:Finset V,Disjoint S T → j.range⊔J S=⊤ → (∀ u:(∀ v:T,(v.val.adicCompletionIntegers D)ˣ),∃ x:(S:Set V).unit D,∀ v:T,
      ∃ y:(v.val.adicCompletionIntegers D)ˣ, ((y.val.val:v.val.adicCompletion D)^p)*(x.val.val:v.val.adicCompletion D)=(u v).val.val) →
    (let norm (F:Type) [Field F] [Algebra D F]:=(Units.map (Algebra.norm F (S:=F⊗[D]M))).range
    (∀w:InfinitePlace D,norm w.Completion=⊤) ∧ (∀v∈S,norm (v.adicCompletion D)=⊤) ∧
    (∀v∈T,(powMonoidHom p:(v.adicCompletion D)ˣ→*(v.adicCompletion D)ˣ).range≤norm (v.adicCompletion D)) ∧
    (∀v:V,v∉S∪T → (Units.map (v.adicCompletionIntegers D).subtype.toMonoidHom).range≤norm (v.adicCompletion D))) → j.range⊔(Units.map (Algebra.norm A (S:=A⊗[D]M))).range=⊤

theorem main : H1 → H2 → OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H3_R1_H1_R1_H3_R1_H2_R1.H2 := by
  intro build norms lower D _ _ p hp hmu
  dsimp only
  intro S T disj hS approx x hi hf
  obtain ⟨M,dim,gal,cyc,⟨z,hz⟩,loc⟩:=build D p hp hmu S T hS.1 x hi hf
  letI := dim
  letI := gal
  letI := cyc
  letI : NumberField M:=NumberField.of_module_finite D M
  have one:=lower D M (norms D M p hp.pos S T disj hS.2 approx loc)
  obtain ⟨y,hy⟩ := (Algebra.finrank_eq_one_iff_bijective_algebraMap.mp one).surjective z
  have pow:y^p=x.val.val:=(algebraMap D M).injective (by rw [map_pow,hy,hz])
  have nz:y≠0:=by rintro rfl;rw [zero_pow hp.ne_zero] at pow;exact x.val.ne_zero pow.symm
  let u:=Units.mk0 y nz
  have hu:u^p=x.val:=Units.ext pow
  have mem:u∈((S∪T:Finset (HeightOneSpectrum (𝓞 D))):Set (HeightOneSpectrum (𝓞 D))).unit D:=by
    have powmem:u^p∈((S∪T:Finset (HeightOneSpectrum (𝓞 D))):Set (HeightOneSpectrum (𝓞 D))).unit D:=hu ▸ x.property
    intro v hv
    have h:=powmem v hv
    change v.valuation D ((u.val:D)^p)=1 at h
    rw [map_pow] at h
    exact (pow_eq_one_iff_left hp.ne_zero).mp h
  exact ⟨⟨u,mem⟩,Subtype.ext hu⟩
end OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H3_R1_H1_R1_H3_R1_H2_R1_H2_R1
