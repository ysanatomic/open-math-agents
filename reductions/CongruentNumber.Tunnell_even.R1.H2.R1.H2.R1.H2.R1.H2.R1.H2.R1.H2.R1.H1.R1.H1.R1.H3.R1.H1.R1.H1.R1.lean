import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H3_R1_H1_R1
import Mathlib

/-! The index on supported idèles is the product of the power-class indices in the selected completions. The ideal norm product formula collects the finite-place defects. -/
namespace OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H3_R1_H1_R1_H1_R1
open NumberField IsDedekindDomain
open scoped NumberField TensorProduct Classical
noncomputable section

def H1 : Prop :=
  ∀(D:Type)[Field D][NumberField D](p:ℕ),p.Prime → (primitiveRoots p D).Nonempty →
   ∀ v:HeightOneSpectrum (𝓞 D),
    (powMonoidHom p:(v.adicCompletion D)ˣ→*(v.adicCompletion D)ˣ).range.index=
       p*(p*Ideal.absNorm (v.maxPowDividing (Ideal.span {(p:𝓞 D)})))

def H2 : Prop :=
  ∀(D:Type)[Field D][NumberField D](p:ℕ),p.Prime → (primitiveRoots p D).Nonempty →
   let V:=HeightOneSpectrum (𝓞 D)
   let A:=AdeleRing (𝓞 D) D
   let U(S T:Finset V):=Subgroup.closure {a:Aˣ |
     (∀ w:InfinitePlace D,∃ y:w.Completion,y^p=a.val.1 w) ∧
     (∀ v∈S,∃ y:v.adicCompletion D,y^p=a.val.2 v) ∧
     ∀ v:V,v∉S∪T → a.val.2 v∈v.adicCompletionIntegers D ∧ (a⁻¹).val.2 v∈v.adicCompletionIntegers D}
   let J(F:Finset V):=Subgroup.closure {a:Aˣ | ∀ v:V,v∉F → a.val.2 v∈v.adicCompletionIntegers D ∧ (a⁻¹).val.2 v∈v.adicCompletionIntegers D}
   ∀ S T:Finset V,(U S T).relIndex (J (S∪T))=
      (∏ w:InfinitePlace D,if w.IsReal ∧ Even p then 2 else 1)*
        ∏ v:↥S,(powMonoidHom p:(v.val.adicCompletion D)ˣ→*(v.val.adicCompletion D)ˣ).range.index

variable {K:Type} [Field K] [NumberField K]
theorem prod_absNorm_maxPowDividing_natCast
    (n : ℕ+)
    (S : Finset (HeightOneSpectrum (𝓞 K)))
    (hS :
      ∀ v : HeightOneSpectrum (𝓞 K),
        v.asIdeal ∣ Ideal.span {((n : ℕ) : 𝓞 K)} →
          v ∈ S) :
    (∏ v : ↥S,
        Ideal.absNorm
          (v.1.maxPowDividing
            (Ideal.span {((n : ℕ) : 𝓞 K)}))) =
      (n : ℕ) ^ Module.finrank ℚ K := by
  classical
  let I : Ideal (𝓞 K) :=
    Ideal.span {((n : ℕ) : 𝓞 K)}
  have hI : I ≠ 0 := by
    simp [I, n.ne_zero]
  let f : HeightOneSpectrum (𝓞 K) → ℕ :=
    fun v => Ideal.absNorm (v.maxPowDividing I)
  have hsupport : Function.mulSupport f ⊆ (S : Set _) := by
    intro v hv
    apply hS v
    have hcount :
        (Associates.mk v.asIdeal).count
            (Associates.mk I).factors ≠ 0 := by
      intro hzero
      apply hv
      simp [f, IsDedekindDomain.HeightOneSpectrum.maxPowDividing,
        hzero]
    exact
      (Associates.count_ne_zero_iff_dvd
        hI v.irreducible).mp hcount
  have hmap :
      Ideal.absNorm
          (∏ᶠ v : HeightOneSpectrum (𝓞 K),
            v.maxPowDividing I) =
        ∏ᶠ v : HeightOneSpectrum (𝓞 K),
          Ideal.absNorm (v.maxPowDividing I) :=
    Ideal.absNorm.map_finprod
      (Ideal.hasFiniteMulSupport hI)
  calc
    (∏ v : ↥S,
        Ideal.absNorm
          (v.1.maxPowDividing
            (Ideal.span {((n : ℕ) : 𝓞 K)}))) =
        ∏ v ∈ S, f v := by
      simpa [f, I] using Finset.prod_coe_sort S f
    _ = ∏ᶠ v : HeightOneSpectrum (𝓞 K), f v :=
      (finprod_eq_prod_of_mulSupport_subset f hsupport).symm
    _ =
        Ideal.absNorm
          (∏ᶠ v : HeightOneSpectrum (𝓞 K),
            v.maxPowDividing I) := hmap.symm
    _ = Ideal.absNorm I := by
      rw [Ideal.finprod_heightOneSpectrum_factorization hI]
    _ = (n : ℕ) ^ Module.finrank ℚ K := by
      change
        Ideal.absNorm
            (Ideal.span {(((n : ℕ) : ℕ) : 𝓞 K)}) =
          (n : ℕ) ^ Module.finrank ℚ K
      rw [Ideal.absNorm_span_natCast,
        NumberField.RingOfIntegers.rank]


theorem prod_infinitePlace_nthPowerIndex
    (n : ℕ+) :
    (∏ w : InfinitePlace K,
        if w.IsReal ∧ Even (n : ℕ) then 2 else 1) =
      if Even (n : ℕ) then
        2 ^ InfinitePlace.nrRealPlaces K
      else 1 := by
  classical
  by_cases hn : Even (n : ℕ)
  · rw [if_pos hn]
    rw [InfinitePlace.prod_eq_prod_mul_prod]
    simp only [hn, and_true]
    have hr :
        (∏ w : {w : InfinitePlace K // w.IsReal},
            if w.1.IsReal then 2 else 1) =
          ∏ _w : {w : InfinitePlace K // w.IsReal}, 2 := by
      apply Finset.prod_congr rfl
      intro w _
      rw [if_pos w.2]
    have hc :
        (∏ w : {w : InfinitePlace K // w.IsComplex},
            if w.1.IsReal then 2 else 1) =
          ∏ _w : {w : InfinitePlace K // w.IsComplex}, 1 := by
      apply Finset.prod_congr rfl
      intro w _
      rw [if_neg
        (InfinitePlace.not_isReal_iff_isComplex.mpr w.2)]
    rw [hr, hc]
    simp [InfinitePlace.nrRealPlaces]
  · simp [hn]


theorem prod_infinitePlace_nthPowerIndex_mul_natDegree
    (n : ℕ+)
    (hmu : (primitiveRoots (n : ℕ) K).Nonempty) :
    (∏ w : InfinitePlace K,
        if w.IsReal ∧ Even (n : ℕ) then 2 else 1) *
        (n : ℕ) ^ Module.finrank ℚ K =
      (n : ℕ) ^
        (2 * Fintype.card (InfinitePlace K)) := by
  classical
  have harch :=
    prod_infinitePlace_nthPowerIndex (K := K) n
  obtain ⟨ζ, hζ⟩ := hmu
  have hζprim : IsPrimitiveRoot ζ (n : ℕ) :=
    (mem_primitiveRoots n.pos).mp hζ
  have hsignature :=
    InfinitePlace.card_add_two_mul_card_eq_rank K
  have hplaces :=
    InfinitePlace.card_eq_nrRealPlaces_add_nrComplexPlaces K
  by_cases hlarge : 2 < (n : ℕ)
  · have hreal :
        InfinitePlace.nrRealPlaces K = 0 :=
      InfinitePlace.IsPrimitiveRoot.nrRealPlaces_eq_zero_of_two_lt
        hlarge hζprim
    rw [hreal, zero_add] at hsignature hplaces
    have hdegree :
        Module.finrank ℚ K =
          2 * Fintype.card (InfinitePlace K) := by
      omega
    rw [harch, hreal, hdegree]
    simp
  · have hnle : (n : ℕ) ≤ 2 :=
      Nat.le_of_not_gt hlarge
    have hnpos : 0 < (n : ℕ) := n.pos
    have hone_or_two :
        (n : ℕ) = 1 ∨ (n : ℕ) = 2 := by
      omega
    rcases hone_or_two with hone | htwo
    · have hn : n = (1 : ℕ+) := Subtype.ext hone
      subst n
      rw [harch]
      simp
    · have hn : n = (2 : ℕ+) := Subtype.ext htwo
      subst n
      rw [harch]
      rw [if_pos (by decide :
        Even (((2 : ℕ+) : ℕ)))]
      change
        2 ^ InfinitePlace.nrRealPlaces K *
            2 ^ Module.finrank ℚ K =
          2 ^ (2 * Fintype.card (InfinitePlace K))
      rw [← pow_add]
      congr 1
      omega


theorem main : H1 → H2 → OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H3_R1_H1_R1.H1 := by
  intro localIndex groupIndex K _ _ p hp hmu
  dsimp only
  intro S T hs
  rw [groupIndex K p hp hmu S T]
  let n:ℕ+:=⟨p,hp.pos⟩
  have finiteNorm:(∏ v:↥S,Ideal.absNorm (v.val.maxPowDividing (Ideal.span {(p:𝓞 K)})))=p^Module.finrank ℚ K:=
    prod_absNorm_maxPowDividing_natCast (K:=K) n S hs
  have arch:(∏ w:InfinitePlace K,if w.IsReal ∧ Even p then 2 else 1)*p^Module.finrank ℚ K=p^(2*Fintype.card (InfinitePlace K)):=
    prod_infinitePlace_nthPowerIndex_mul_natDegree (K:=K) n hmu
  simp_rw [localIndex K p hp hmu]
  simp_rw [←mul_assoc p p,←pow_two]
  rw [Finset.prod_mul_distrib,finiteNorm]
  simp only [Finset.prod_const,Finset.card_univ,Fintype.card_coe]
  rw [mul_left_comm,arch,←pow_mul,←pow_add,Nat.card_eq_fintype_card (α:=InfinitePlace K)]
  congr 1
  omega
end
end OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H3_R1_H1_R1_H1_R1
