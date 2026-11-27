import TunnellPrimitiveModel

/-! # Exact global degrees at every split ordinary Gaussian division level -/
namespace TunnellFullDivisionDegree
open IsLocalRing IsDedekindDomain IsDedekindDomain.HeightOneSpectrum WeierstrassCurve WeierstrassCurve.Affine
open TunnellCoates TunnellKummer TunnellCMTorsionField TunnellFormalQuarter TunnellGaussianEnd
open TunnellPadicDivisionSeries TunnellLocalDivisibility TunnellPreparedRootPlace
open scoped Polynomial
noncomputable section

variable {p:ℕ} [Fact p.Prime]
local notation "A" => IntegerRing p
local notation "K₀" => Local p

theorem split_level {F:Type} [Field F] [CharZero F] [Algebra F ℂ] [Algebra F K₀] [DecidableEq F]
    {n m:ℕ} (hn:0<n) (hp:p=4*m+1) (hgood:¬p∣n) [(E (n:F)).IsElliptic]
    (j:F) (hj:j^2= -1) (hIC:algebraMap F ℂ j=Complex.I)
    (i:A) (hi:i^2= -1) (hij:algebraMap F K₀ j=(i:K₀))
    (a:GaussianInt) (ha:a.norm.natAbs=p) (hnorm:a.re^2+a.im^2=(p:ℤ))
    (hu:IsUnit ((a.re:A)-(a.im:A)*i)) (r:ℕ) :
    ∃ T : CurvePoints (E (n:F)) (algebraicClosure F ℂ),
      cm (n:F) j hj (a^(r+1)) T=0 ∧ addOrderOf T=p^(r+1) ∧
      IsAbelianGalois F (coordField (E (n:F)) T) ∧
      Module.finrank F (coordField (E (n:F)) T)=Nat.totient (p^(r+1)) := by
  classical
  haveI : CharZero K₀ := charZero_of_injective_algebraMap (algebraMap ℚ K₀).injective
  obtain ⟨P,U,hfac,hd,he,_⟩ := equations hp hgood r
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
  obtain ⟨ht,_⟩ := TunnellEisensteinRoot.root_relation s.f (base_uniformizer (p:=p)).1 hfac.isDistinguishedAt.monic he hd₀ s.t s.root
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
  obtain ⟨_,T,h₁,h₂,h₃,h₄,_⟩ := TunnellPrimitiveCoordField.equal_degrees n hn j hj hIC (Fact.out:p.Prime)
    (by omega) ha (r+1) Q hcm (hQo ▸ addOrderOf_nsmul_eq_zero Q) (s.t:N) hcoord hdeg
  exact ⟨T,h₁,h₂,h₃,h₄⟩

#print axioms split_level
end
end TunnellFullDivisionDegree
