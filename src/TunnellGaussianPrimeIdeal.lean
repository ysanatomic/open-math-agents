import Mathlib.NumberTheory.NumberField.Ideal.Basic
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.LinearCombination
import Mathlib.NumberTheory.NumberField.InfinitePlace.Basic
import Mathlib.NumberTheory.NumberField.Norm
import Mathlib.RingTheory.Norm.Transitivity
import Mathlib.FieldTheory.Galois.Basic

/-! Uniqueness of the prime containing the selected Gaussian factor in a quadratic number field. -/
namespace TunnellGaussianPrimeIdeal
open NumberField IsDedekindDomain IsDedekindDomain.HeightOneSpectrum IsLocalRing
open scoped Classical
noncomputable section
variable {F:Type} [Field F] [NumberField F]
def integralI (j:F) (hj:j^2= -1) : 𝓞 F:=⟨j,IsIntegral.of_pow (n:=2) (by decide) (by rw [hj]; exact isIntegral_one.neg)⟩

theorem complex_places {D:Type} [Field D] [NumberField D] [Algebra F D] (i:F) (hi:i^2= -1) (v:InfinitePlace D) : v.IsComplex := by
  apply InfinitePlace.not_isReal_iff_isComplex.mp
  intro hR
  let f: F→+*ℝ := (InfinitePlace.embedding_of_isReal hR).comp (algebraMap F D)
  have he:=congrArg f hi
  simp only [map_pow,map_neg,map_one] at he
  nlinarith [sq_nonneg (f i)]

theorem norm_factor (hdeg:Module.finrank ℚ F=2) (j:F) (hj:j^2= -1) (a b:ℤ) :
    Algebra.norm ℚ ((a:F)+(b:F)*j)=(a:ℚ)^2+(b:ℚ)^2 := by
  letI:Algebra.IsQuadraticExtension ℚ F:=⟨hdeg⟩
  have hbot:j∉(⊥:IntermediateField ℚ F) := by
    rintro ⟨x,hx⟩
    change algebraMap ℚ F x=j at hx
    have hsq:x^2= -1:= (algebraMap ℚ F).injective (by rw [map_pow,hx,hj,map_neg,map_one])
    nlinarith [sq_nonneg x]
  have hnf:= (IsGalois.mem_bot_iff_fixed j).not.mp hbot
  obtain ⟨g,hg⟩:=not_forall.mp hnf
  have hgj:g j= -j:= (sq_eq_sq_iff_eq_or_eq_neg.mp (by rw [←map_pow,hj,map_neg,map_one])).resolve_left hg
  have hg₁:g≠1:=by rintro rfl; exact hg rfl
  have hcard:Fintype.card Gal(F/ℚ)=2:=(Nat.card_eq_fintype_card.symm.trans (IsGalois.card_aut_eq_finrank ℚ F)).trans hdeg
  have hs:({1,g}:Finset Gal(F/ℚ))=Finset.univ:=by
    apply Finset.eq_of_subset_of_card_le (Finset.subset_univ _)
    simp [hcard,hg₁.symm]
  apply (algebraMap ℚ F).injective
  rw [Algebra.norm_eq_prod_automorphisms,←hs,Finset.prod_insert (by simpa using hg₁.symm),Finset.prod_singleton]
  simp only [AlgEquiv.one_apply,map_add,map_pow,map_intCast,map_mul,hgj]
  linear_combination -(b:F)^2*hj

theorem absNorm_factor (hdeg:Module.finrank ℚ F=2) (j:F) (hj:j^2= -1) (a b:ℤ) {p:ℕ} (hn:a^2+b^2=(p:ℤ)) :
    Ideal.absNorm (Ideal.span ({(a:𝓞 F)+(b:𝓞 F)*integralI j hj}:Set (𝓞 F)))=p := by
  rw [Ideal.absNorm_span_singleton]
  have hh:Algebra.norm ℤ ((a:𝓞 F)+(b:𝓞 F)*integralI j hj)=(p:ℤ) := by
    apply (Int.cast_injective (α:=ℚ))
    rw [Algebra.coe_norm_int]
    change Algebra.norm ℚ ((a:F)+(b:F)*j)=((p:ℤ):ℚ)
    rw [norm_factor hdeg j hj]
    exact_mod_cast hn
  rw [hh,Int.natAbs_natCast]

theorem unique (hdeg:Module.finrank ℚ F=2) (j:F) (hj:j^2= -1) (a b:ℤ) {p:ℕ} (hp:p.Prime) (hn:a^2+b^2=(p:ℤ))
    (v:HeightOneSpectrum (𝓞 F)) (hv:(a:𝓞 F)+(b:𝓞 F)*integralI j hj∈v.asIdeal)
    (u:HeightOneSpectrum (𝓞 F)) (hu:u≠v) : (a:𝓞 F)+(b:𝓞 F)*integralI j hj∉u.asIdeal := by
  let I:=Ideal.span ({(a:𝓞 F)+(b:𝓞 F)*integralI j hj}:Set (𝓞 F))
  have hI:Ideal.absNorm I=p:=absNorm_factor hdeg j hj a b hn
  have hprime:I.IsPrime:=Ideal.isPrime_of_irreducible_absNorm (hI ▸ hp.prime.irreducible)
  have hmax:I.IsMaximal:=hprime.isMaximal (by intro hh; rw [hh,Ideal.absNorm_bot] at hI; exact hp.ne_zero hI.symm)
  intro hh
  exact hu (HeightOneSpectrum.ext ((hmax.eq_of_le u.isMaximal.ne_top ((Ideal.span_singleton_le_iff_mem _).mpr hh)).symm.trans
    (hmax.eq_of_le v.isMaximal.ne_top ((Ideal.span_singleton_le_iff_mem _).mpr hv))))

#print axioms norm_factor
#print axioms unique
end
end TunnellGaussianPrimeIdeal
