import TunnellCMPrimaryOrientation
import TunnellCMCoefficientCompletion

namespace TunnellCMOrientedPlace
open TunnellCMCoefficientCompletion TunnellPadicDivisionSeries TunnellLocalDivisibility IsLocalRing
noncomputable section
set_option maxHeartbeats 600000
lemma root_in_integer_ring {F Γ : Type} [Field F] [LinearOrderedCommGroupWithZero Γ]
    [Valued F Γ] (x : F) (hx : x^2= -1) : Valued.v x ≤ 1 := by
  by_contra! h
  have hp:=one_lt_pow₀ h (by decide : 2≠0)
  rw [←map_pow,hx] at hp
  simpa using hp

lemma root_in_subring {F : Type} [Field F] (O : Subring F) (x : F) (h : x∈O) (hx : x^2= -1) :
    ∃ j : O, j^2= -1 ∧ x=(j:F) := ⟨⟨x,h⟩,Subtype.ext hx,rfl⟩

theorem root_at_place {F : Type} [Field F] (v : IsDedekindDomain.HeightOneSpectrum ℤ)
    (g : F →+* v.adicCompletion ℚ) (x : F) (hx : x^2= -1) :
    ∃ j : v.adicCompletionIntegers ℚ, j^2= -1 ∧ g x=(j:v.adicCompletion ℚ) := by
  have hy : (g x)^2= -1 := by rw [←map_pow,hx,map_neg,map_one]
  exact root_in_subring (v.adicCompletionIntegers ℚ).toSubring (g x) (root_in_integer_ring (g x) hy) hy

theorem integer_root {p : ℕ} [Fact p.Prime] (x : ℚ_[p]) (hx : x^2= -1) :
    ∃ j : IntegerRing p, j^2= -1 ∧ padicMap (p:=p) x=(j:Local p) :=
  root_at_place (place p) (padicMap (p:=p)) x hx

theorem base_place {K : Type} [Field K] [NumberField K] {p : ℕ} [Fact p.Prime] (g : K →+* Local p) :
    Nonempty (TunnellRestrictedPlaces.Restriction (B:=IntegerRing p) g) := by
  have h : (p:IntegerRing p)∈maximalIdeal _ := by rw [(base_uniformizer (p:=p)).1]; exact Ideal.mem_span_singleton_self _
  exact TunnellRestrictedPlaces.restrict g (Fact.out : p.Prime).ne_zero h

theorem of_embedding {K : Type} [Field K] [NumberField K] {p : ℕ} [Fact p.Prime] (hmod : p%4=1)
    (i : K) (hi : i^2= -1) (g : K →+* ℚ_[p]) :
      ∃ (v : TunnellRestrictedPlaces.Restriction (B:=IntegerRing p) ((padicMap (p:=p)).comp g))
          (j : IntegerRing p) (q : GaussianInt), j^2= -1 ∧ padicMap (p:=p) (g i)=(j:Local p) ∧
          TunnellGaussian.Primary q ∧ q.norm.natAbs=p ∧ q.re^2+q.im^2=(p:ℤ) ∧
          (q.re:IntegerRing p)+(q.im:IntegerRing p)*j∈maximalIdeal _ ∧ IsUnit ((q.re:IntegerRing p)-(q.im:IntegerRing p)*j) := by
  obtain ⟨j,hj,he⟩:=integer_root (g i) (by rw [←map_pow,hi,map_neg,map_one])
  obtain ⟨v⟩:=base_place ((padicMap (p:=p)).comp g)
  obtain ⟨q,hq⟩:=TunnellCMPrimaryOrientation.primary_factor j hj hmod
  exact ⟨v,j,q,hj,he,hq⟩
end
end TunnellCMOrientedPlace
#print axioms TunnellCMOrientedPlace.of_embedding
