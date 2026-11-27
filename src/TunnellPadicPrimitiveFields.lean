import TunnellPadicDivisionSeries
import TunnellEisensteinRamification
import TunnellPreparedRootPlace
import EllipticCurves.Mathlib.FormalGroup
import Mathlib.NumberTheory.RamificationInertia.Basic

/-! # The primitive root fields at all good split primes are totally ramified -/
namespace TunnellPadicPrimitiveFields
open IsLocalRing IsDedekindDomain IsDedekindDomain.HeightOneSpectrum Polynomial
open TunnellLocalDivisibility TunnellPadicDivisionSeries
open scoped Polynomial
variable {p:ℕ} [Fact p.Prime]
local notation "O" => IntegerRing p
local notation "K" => Local p

structure Level (p:ℕ) [Fact p.Prime] (d:ℕ) (P:O[X]) where
  L : Type
  [field : Field L]
  [kAlg : Algebra K L]
  [oAlg : Algebra O L]
  [tower : IsScalarTower O K L]
  [finite : FiniteDimensional K L]
  [loc : IsLocalRing (integralClosure O L)]
  t : integralClosure O L
  root : P.eval₂ (algebraMap O (integralClosure O L)) t=0
  degree : Module.finrank K L=d
  ramified : (maximalIdeal O).ramificationIdx' (maximalIdeal (integralClosure O L))=d
  residue_degree : (maximalIdeal O).inertiaDeg' (maximalIdeal (integralClosure O L))=1
  uniformizer : maximalIdeal (integralClosure O L)=Ideal.span {t}

theorem exists_level {P:O[X]} (hm:P.Monic) (he:P.IsEisensteinAt (maximalIdeal O))
    (hd:0<P.natDegree) : Nonempty (Level p P.natDegree P) := by
  let q := P.map (algebraMap O K)
  have hq : Irreducible q := (hm.irreducible_iff_irreducible_map_fraction_map).mp (he.irreducible inferInstance hm.isPrimitive hd)
  have : Fact (Irreducible q) := ⟨hq⟩
  let L := AdjoinRoot q
  let S := integralClosure O L
  haveI : FiniteDimensional K L := (hm.map (algebraMap O K)).finite_adjoinRoot
  haveI : CharZero K := charZero_of_injective_algebraMap (algebraMap ℚ K).injective
  haveI : IsDedekindDomain S := integralClosure.isDedekindDomain O K L
  haveI : IsFractionRing S L := integralClosure.isFractionRing_of_finite_extension K L
  have hx : P.eval₂ (algebraMap O L) (AdjoinRoot.root q)=0 := by
    rw [IsScalarTower.algebraMap_eq O K L,←eval₂_map]
    change aeval (AdjoinRoot.root q) q=0
    rw [AdjoinRoot.aeval_eq,AdjoinRoot.mk_self]
  let x:S := ⟨AdjoinRoot.root q,P,hm,hx⟩
  have hs : P.eval₂ (algebraMap O S) x=0 := by
    apply (IsFractionRing.injective S L)
    rw [map_zero,Polynomial.hom_eval₂,←IsScalarTower.algebraMap_eq]
    exact hx
  have hdeg : Module.finrank K L=P.natDegree := by
    change Module.finrank K (K[X] ⧸ Ideal.span {q})=_
    rw [finrank_quotient_span_eq_natDegree]
    exact hm.natDegree_map _
  have hef := Ideal.ramificationIdx_mul_inertiaDeg_of_isLocalRing S K L (IsDiscreteValuationRing.not_a_field O)
  obtain ⟨her,_,hfr,ht⟩ := TunnellEisensteinRamification.index_eq_degree (TunnellPadicDivisionSeries.base_uniformizer (p:=p)).1 hm he hd x hs (by rw [hdeg];exact hd) hef hdeg.le
  exact ⟨⟨L,x,hs,hdeg,her,hfr,ht⟩⟩

theorem primitive_fields {m n:ℕ} (hp:p=4*m+1) (hn:¬p∣n) (r:ℕ) :
    let F := (TunnellCoates.E (n:O)).formalGroupLaw.mulSeries p
    ∃ (P:O[X]) (U:PowerSeries O), (TunnellFormalPrimitive.primitive F r).IsWeierstrassFactorization P U ∧
      P.IsEisensteinAt (maximalIdeal O) ∧ Nonempty (Level p (Nat.totient (p^(r+1))) P) := by
  obtain ⟨P,U,hfac,hd,he,_⟩ := equations hp hn r
  refine ⟨P,U,hfac,he,?_⟩
  rw [←hd]
  exact exists_level hfac.isDistinguishedAt.monic he (by rw [hd]; exact Nat.totient_pos.mpr (pow_pos (Fact.out:p.Prime).pos _))

#print axioms primitive_fields
end TunnellPadicPrimitiveFields
