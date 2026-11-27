import TunnellPrimitiveModel
import TunnellPointTransport

/-! # Exact global degrees at every split ordinary Gaussian division level -/
namespace TunnellGloballyRealizedDivision
set_option maxHeartbeats 1000000
open IsLocalRing IsDedekindDomain IsDedekindDomain.HeightOneSpectrum WeierstrassCurve WeierstrassCurve.Affine
open TunnellCoates TunnellKummer TunnellCMTorsionField TunnellFormalQuarter TunnellGaussianEnd
open TunnellPadicDivisionSeries TunnellLocalDivisibility TunnellPreparedRootPlace
open scoped Polynomial
noncomputable section

variable {p:ℕ} [Fact p.Prime]
local notation "A" => IntegerRing p
local notation "K₀" => Local p

theorem split_point {F:Type} [Field F] [CharZero F] [Algebra F ℂ] [Algebra F K₀] [DecidableEq F]
    {n m:ℕ} (hn:0<n) (hp:p=4*m+1) (hgood:¬p∣n) [(E (n:F)).IsElliptic]
    (j:F) (hj:j^2= -1) (hIC:algebraMap F ℂ j=Complex.I)
    (i:A) (hi:i^2= -1) (hij:algebraMap F K₀ j=(i:K₀))
    (a:GaussianInt) (ha:a.norm.natAbs=p) (hnorm:a.re^2+a.im^2=(p:ℤ))
    (hu:IsUnit ((a.re:A)-(a.im:A)*i)) (r:ℕ) :
    ∃ T : CurvePoints (E (n:F)) (algebraicClosure F ℂ),
      cm (n:F) j hj (a^(r+1)) T=0 ∧ addOrderOf T=p^(r+1) ∧
      IsAbelianGalois F (coordField (E (n:F)) T) ∧
      Module.finrank F (coordField (E (n:F)) T)=Nat.totient (p^(r+1)) ∧
      ∃ (P:A[X]) (U:PowerSeries A),
        (TunnellFormalPrimitive.primitive ((E (n:A)).formalGroupLaw.mulSeries p) r).IsWeierstrassFactorization P U ∧
        P.natDegree=Nat.totient (p^(r+1)) ∧ P.IsEisensteinAt (maximalIdeal A) ∧
        residue A (PowerSeries.coeff p ((E (n:A)).formalGroupLaw.mulSeries p))≠1 ∧
        ∃ (s:RootPlace A K₀ P) (g:coordField (E (n:F)) T →+* s.v.adicCompletion s.L)
        (S:CurvePoints (E (n:F)) (coordField (E (n:F)) T)) (u:(s.v.adicCompletionIntegers s.L)ˣ),
        (∀x:F,g (algebraMap F _ x)=s.embed (algebraMap F K₀ x)) ∧
        coordField (E (n:F)) S=⊤ ∧ cm (n:F) j hj (a^(r+1)) S=0 ∧ addOrderOf S=p^(r+1) ∧
        TunnellPointTransport.above_origin g S ∧ g (TunnellTameParameter.parameter S)=(s.t:s.v.adicCompletion s.L) ∧ s.t^Nat.totient (p^(r+1))=(p:s.v.adicCompletionIntegers s.L)*u := by
  classical
  haveI : CharZero K₀ := charZero_of_injective_algebraMap (algebraMap ℚ K₀).injective
  obtain ⟨P,U,hfac,hd,he,hH⟩ := equations hp hgood r
  have hd₀ : 0<P.natDegree := by rw [hd]; exact Nat.totient_pos.mpr (pow_pos (Fact.out:p.Prime).pos _)
  obtain ⟨s⟩ := exists_root_place (K:=K₀) hfac.isDistinguishedAt.monic he hd₀
  let B := s.v.adicCompletionIntegers s.L
  let N := s.v.adicCompletion s.L
  letI : Algebra K₀ N := s.embed.toAlgebra
  letI : Algebra F N := (s.embed.comp (algebraMap F K₀)).toAlgebra
  letI : IsScalarTower F K₀ N := .of_algebraMap_eq' rfl
  haveI : CharZero N := charZero_of_injective_algebraMap s.embed.injective
  haveI : CharZero B := (algebraMap B N).charZero
  let nB := s.f (n:A)
  let iB := s.f i
  have hiB : iB^2= -1 := by simpa [iB] using congrArg s.f hi
  have hjN : algebraMap F N j=(iB:N) := by
    change s.embed (algebraMap F K₀ j)=_
    rw [hij, s.compat]; rfl
  obtain ⟨ht,_,u,_,hrelation,_⟩ := TunnellEisensteinRoot.root_relation s.f (base_uniformizer (p:=p)).1 hfac.isDistinguishedAt.monic he hd₀ s.t s.root
  let Z : (E nB).formalGroupLaw.Points := fun _ => ⟨s.t,ht⟩
  have hlin : s.f (PowerSeries.coeff 1 ((E (n:A)).formalGroupLaw.mulSeries p))≠0 := by
    have co : PowerSeries.coeff 1 ((E (n:A)).formalGroupLaw.mulSeries p)=(p:A) := ChabautyColeman.coeff_single_mulSeries _ _
    rw [co,map_natCast]
    exact Nat.cast_ne_zero.mpr (Fact.out:p.Prime).ne_zero
  have hz := TunnellPrimitiveModel.order_in_place s.f (n:A) hlin r hfac ht s.root
  change addOrderOf Z=p^(r+1) at hz
  let W := (E (n:F)).baseChange N
  have hW : W=E (nB:N) := by
    dsimp [W,nB]; rw [base_E,map_natCast,map_natCast]; congr 1
  haveI : W.IsElliptic := inferInstanceAs (((E (n:F)).map (algebraMap F N)).IsElliptic)
  have hunit : IsUnit ((a.re:B)-(a.im:B)*iB) := by simpa [iB] using hu.map s.f
  obtain ⟨Q,hQ,hQo,hQt⟩ := TunnellPrimitiveModel.on_model nB iB hiB a hnorm hunit (r+1) Z hz W hW
  have hmaps : baseI (L:=N) (n:F) j hj=quarter hW (iB:N) (by exact_mod_cast hiB) := by
    ext V; cases V with
    | zero => rfl
    | some x y h =>
      change Affine.Point.some _ _ _=Affine.Point.some _ _ _
      rw [Affine.Point.some.injEq]
      exact ⟨rfl,congrArg (·*y) hjN⟩
  have hcm : cm (n:F) j hj (a^(r+1)) Q=0 := by
    change endo (baseI (n:F) j hj) _ _ Q=0
    rw [hmaps]; exact hQt
  have hcoord : (s.t:N)∈coordField (E (n:F)) Q := by
    rw [hQ]
    exact TunnellPrimitiveCoordField.param_in_coordField (E (n:F)) (E nB) _ Z
  have hdeg : (minpoly K₀ (s.t:N)).natDegree=Nat.totient (p^(r+1)) := by
    rw [root_minpoly hfac.isDistinguishedAt.monic he hd₀ s,hfac.isDistinguishedAt.monic.natDegree_map,hd]
  obtain ⟨_,T,h₁,h₂,h₃,h₄,⟨e⟩⟩ := TunnellPrimitiveCoordField.equal_degrees n hn j hj hIC (Fact.out:p.Prime)
    (by omega) ha (r+1) Q hcm (hQo ▸ addOrderOf_nsmul_eq_zero Q) (s.t:N) hcoord hdeg
  let g := (coordField (E (n:F)) Q).val.comp e.symm.toAlgHom
  obtain ⟨S,hS,hSQ⟩:=TunnellPointTransport.generate (E (n:F)) Q e
  have hgQ : Affine.Point.map (W':=(E (n:F)).toAffine) g S=Q := hSQ
  have hgInj:=Affine.Point.map_injective (W':=(E (n:F)).toAffine) g
  refine ⟨T,h₁,h₂,h₃,h₄,P,U,hfac,hd,he,hH,s,g.toRingHom,S,u,?_,hS,?_,?_,?_,?_,?_⟩
  · exact g.commutes
  · apply hgInj
    rw [cm_map,hgQ,hcm,map_zero]
  · rw [←addOrderOf_injective (Affine.Point.map (W':=(E (n:F)).toAffine) g) hgInj,hgQ,hQo]
  · exact TunnellPointTransport.origin_of_formal (E (n:F)) (E nB) _ g S Z (hgQ.trans hQ)
  · change g (TunnellTameParameter.parameter S)=_
    rw [←TunnellTameParameter.parameter_map g (E (n:F)),hgQ,hQ,TunnellTameParameter.parameter_formal]
  · rw [←hd,hrelation,map_natCast]

theorem split_level {F:Type} [Field F] [CharZero F] [Algebra F ℂ] [Algebra F K₀] [DecidableEq F]
    {n m:ℕ} (hn:0<n) (hp:p=4*m+1) (hgood:¬p∣n) [(E (n:F)).IsElliptic]
    (j:F) (hj:j^2= -1) (hIC:algebraMap F ℂ j=Complex.I)
    (i:A) (hi:i^2= -1) (hij:algebraMap F K₀ j=(i:K₀))
    (a:GaussianInt) (ha:a.norm.natAbs=p) (hnorm:a.re^2+a.im^2=(p:ℤ))
    (hu:IsUnit ((a.re:A)-(a.im:A)*i)) (r:ℕ) :
    ∃ T : CurvePoints (E (n:F)) (algebraicClosure F ℂ),
      cm (n:F) j hj (a^(r+1)) T=0 ∧ addOrderOf T=p^(r+1) ∧
      IsAbelianGalois F (coordField (E (n:F)) T) ∧
      Module.finrank F (coordField (E (n:F)) T)=Nat.totient (p^(r+1)) ∧
      ∃ (P:A[X]) (s:RootPlace A K₀ P) (g:coordField (E (n:F)) T →+* s.v.adicCompletion s.L)
        (t:coordField (E (n:F)) T) (u:(s.v.adicCompletionIntegers s.L)ˣ),
        (∀x:F,g (algebraMap F _ x)=s.embed (algebraMap F K₀ x)) ∧
        g t=(s.t:s.v.adicCompletion s.L) ∧ s.t^Nat.totient (p^(r+1))=(p:s.v.adicCompletionIntegers s.L)*u := by
  obtain ⟨T,h₁,h₂,h₃,h₄,P,_,_,_,_,_,s,g,S,u,hg,_,_,_,_,ht,hrel⟩ :=
    split_point hn hp hgood j hj hIC i hi hij a ha hnorm hu r
  exact ⟨T,h₁,h₂,h₃,h₄,P,s,g,TunnellTameParameter.parameter S,u,hg,ht,hrel⟩

#print axioms split_point
#print axioms split_level
end
end TunnellGloballyRealizedDivision
