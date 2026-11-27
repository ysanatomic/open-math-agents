import TunnellEisensteinRoot
import EllipticCurves.Mathlib.Basic
import Mathlib.RingTheory.Polynomial.GaussLemma
import Mathlib.RingTheory.DedekindDomain.IntegralClosure

/-! # Realizing an integral polynomial root in an arithmetic completion -/
namespace TunnellPreparedRootPlace
open IsLocalRing IsDedekindDomain IsDedekindDomain.HeightOneSpectrum Polynomial
open scoped Polynomial

/-- A completion of an algebraic extension with a chosen integral division parameter. -/
structure RootPlace (A K : Type) [CommRing A] [Field K] [Algebra A K] (P:A[X]) where
  S : Type
  L : Type
  [sComm : CommRing S]
  [sDedekind : IsDedekindDomain S]
  [lField : Field L]
  [sAlg : Algebra S L]
  [sFrac : IsFractionRing S L]
  [lChar : CharZero L]
  v : HeightOneSpectrum S
  f : A →+* v.adicCompletionIntegers L
  [fLoc : IsLocalHom f]
  embed : K →+* v.adicCompletion L
  compat (x:A) : (f x:v.adicCompletion L) = embed (algebraMap A K x)
  t : v.adicCompletionIntegers L
  root : P.eval₂ f t = 0

attribute [instance] RootPlace.sComm RootPlace.sDedekind RootPlace.lField RootPlace.sAlg RootPlace.sFrac RootPlace.lChar RootPlace.fLoc

theorem exists_root_place {A K : Type} [CommRing A] [IsDomain A] [IsDiscreteValuationRing A]
    [Field K] [CharZero K] [Algebra A K] [IsFractionRing A K] {P:A[X]} (hm:P.Monic)
    (he : P.IsEisensteinAt (maximalIdeal A)) (hd : 0<P.natDegree) :
    Nonempty (RootPlace A K P) := by
  let q := P.map (algebraMap A K)
  have hq : Irreducible q := (hm.irreducible_iff_irreducible_map_fraction_map).mp (he.irreducible inferInstance hm.isPrimitive hd)
  letI : Fact (Irreducible q) := ⟨hq⟩
  let L := AdjoinRoot q
  let S := integralClosure A L
  haveI : FiniteDimensional K L := (hm.map (algebraMap A K)).finite_adjoinRoot
  haveI : CharZero L := charZero_of_injective_algebraMap (algebraMap K L).injective
  haveI : IsFractionRing S L := integralClosure.isFractionRing_of_finite_extension K L
  haveI : IsDedekindDomain S := integralClosure.isDedekindDomain A K L
  haveI : Algebra.IsIntegral A S := IsIntegralClosure.isIntegral_algebra A L
  haveI : FaithfulSMul A L := (faithfulSMul_iff_algebraMap_injective A L).mpr (by
    rw [IsScalarTower.algebraMap_eq A K L]
    exact (algebraMap K L).injective.comp (IsFractionRing.injective A K))
  haveI : FaithfulSMul A S := (FaithfulSMul.tower_bot A S L)
  obtain ⟨Q,hQ,hQA⟩ := Ideal.exists_maximal_ideal_liesOver_of_isIntegral (S:=S) (maximalIdeal A)
  have hdQ : Q ≠ ⊥ := by
    intro eq
    have h := hQA.over
    rw [eq, Ideal.under,←RingHom.ker_eq_comap_bot,(RingHom.injective_iff_ker_eq_bot _).mp (FaithfulSMul.algebraMap_injective A S)] at h
    exact IsDiscreteValuationRing.not_a_field A h
  let v : HeightOneSpectrum S := ⟨Q,hQ.isPrime,hdQ⟩
  let f := (algebraMap S (v.adicCompletionIntegers L)).comp (algebraMap A S)
  have hMax : (maximalIdeal (v.adicCompletionIntegers L)).comap f=maximalIdeal A := by
    rw [show f=(algebraMap S (v.adicCompletionIntegers L)).comp (algebraMap A S) from rfl,←Ideal.comap_comap, v.comap_maximalIdeal_adicCompletionIntegers]
    exact hQA.over.symm
  haveI : IsLocalHom f := ⟨fun a ha => by
    by_contra hn
    have hmem : a∈maximalIdeal A := hn
    rw [←hMax] at hmem
    exact hmem ha⟩
  have hx : P.eval₂ (algebraMap A L) (AdjoinRoot.root q)=0 := by
    rw [IsScalarTower.algebraMap_eq A K L,←eval₂_map]
    change aeval (AdjoinRoot.root q) q=0
    rw [AdjoinRoot.aeval_eq,AdjoinRoot.mk_self]
  let x:S := ⟨AdjoinRoot.root q,P,hm,hx⟩
  have hs : P.eval₂ (algebraMap A S) x=0 := by
    apply (IsFractionRing.injective S L)
    rw [map_zero,Polynomial.hom_eval₂,←IsScalarTower.algebraMap_eq]
    exact hx
  refine ⟨⟨S,L,v,f,(algebraMap L (v.adicCompletion L)).comp (algebraMap K L),?_,algebraMap S (v.adicCompletionIntegers L) x,?_⟩⟩
  · intro a
    change (algebraMap L (v.adicCompletion L)) ((algebraMap S L) ((algebraMap A S) a)) = _
    rw [←IsScalarTower.algebraMap_apply A S L,IsScalarTower.algebraMap_apply A K L]; rfl
  · rw [show f=(algebraMap S (v.adicCompletionIntegers L)).comp (algebraMap A S) from rfl,←Polynomial.hom_eval₂,hs,map_zero]

theorem root_minpoly {A K:Type} [CommRing A] [IsDomain A] [IsDiscreteValuationRing A]
    [Field K] [Algebra A K] [IsFractionRing A K] {P:A[X]} (hm:P.Monic)
    (he : P.IsEisensteinAt (maximalIdeal A)) (hd : 0<P.natDegree) (s:RootPlace A K P) :
    letI := s.embed.toAlgebra
    minpoly K (s.t : s.v.adicCompletion s.L) = P.map (algebraMap A K) := by
  letI := s.embed.toAlgebra
  apply Eq.symm
  apply minpoly.eq_of_irreducible_of_monic (hm.irreducible_iff_irreducible_map_fraction_map.mp (he.irreducible inferInstance hm.isPrimitive hd)) _ (hm.map _)
  rw [aeval_def,Polynomial.eval₂_map]
  have hh := congrArg (algebraMap (s.v.adicCompletionIntegers s.L) (s.v.adicCompletion s.L)) s.root
  rw [map_zero,Polynomial.hom_eval₂] at hh
  have hc : (algebraMap K (s.v.adicCompletion s.L)).comp (algebraMap A K)=
      (algebraMap (s.v.adicCompletionIntegers s.L) (s.v.adicCompletion s.L)).comp s.f :=
    RingHom.ext (fun x => (s.compat x).symm)
  rw [hc]; exact hh

theorem degree_lower {F K N D : Type*} [Field F] [Field K] [Field N] [Field D]
    [Algebra F K] [Algebra F D] [Algebra F N] [Algebra K N] [IsScalarTower F K N]
    [FiniteDimensional F D] (f:D→ₐ[F]N) (z:D) :
    (minpoly K (f z)).natDegree ≤ Module.finrank F D := by
  have hmap := minpoly.dvd_map_of_isScalarTower F K (f z)
  have hI : IsIntegral F z := IsIntegral.of_finite F z
  rw [minpoly.algHom_eq f f.injective] at hmap
  have hm := (minpoly.monic hI).map (algebraMap F K)
  have h₁ := Polynomial.natDegree_le_of_dvd hmap hm.ne_zero
  rw [(minpoly.monic hI).natDegree_map (algebraMap F K)] at h₁
  exact h₁.trans (minpoly.natDegree_le (A:=F) (x:=z))

#print axioms root_minpoly
#print axioms degree_lower
#print axioms exists_root_place
end TunnellPreparedRootPlace
