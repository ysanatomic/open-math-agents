import TunnellCompletionPoints
import TunnellCompletedKummerObstruction
import TunnellCompletionRestriction

/-! A single depth bound for the completions of all division lifts of a global point. -/
namespace TunnellGlobalPointBound
open WeierstrassCurve WeierstrassCurve.Affine NumberField IsDedekindDomain IsLocalRing
open TunnellCoates TunnellKummer TunnellCMTorsionField TunnellGaussianEnd TunnellPadicDivisionSeries TunnellLocalDivisibility
open scoped Classical
noncomputable section
variable {p n:ℕ} [Fact p.Prime] {F:Type} [Field F] [NumberField F]
local notation "O" => IntegerRing p
local notation "Kp" => Local p
variable (g:F→+*Local p) (v:TunnellRestrictedPlaces.Restriction (B:=IntegerRing p) g)
local notation "K" => v.v.adicCompletion F
local notation "W" => E (n:F)
local notation "V" => E (n:v.v.adicCompletion F)

theorem bound (hn:¬p∣2*n) (hp:p%4=1) [(E (n:F)).IsElliptic] [(E (n:v.v.adicCompletion F)).IsElliptic]
    (i:F) (hi:i^2= -1) (j:O) (hj:j^2= -1) (he:g i=(j:Kp))
    (a:GaussianInt) (hnorm:a.re^2+a.im^2=(p:ℤ)) (hm:(a.re:O)+(a.im:O)*j∈maximalIdeal O)
    (P:CurvePoints W F) (hP:¬IsOfFinAddOrder P) :
    ∃ B:ℕ,∀r,B<r → ∀(N:Type) [Field N] [Algebra K N] [FiniteDimensional K N] (Q:CurvePoints V N),
      cm (n:K) (algebraMap F K i) (by rw [←map_pow,hi,map_neg,map_one]) (a^r) Q=
      changeBase V (TunnellCompletionPoints.point (D:=F) («K»:=K) (M:=K) n P) → ¬IsAbelianGalois K N := by
  obtain ⟨e,_,hbase,_⟩:=TunnellCompletionRestriction.base_completion g v
  let f:=TunnellCompletionPoints.point (F:=F) (D:=F) («K»:=K) (M:=K) n
  have hf:=TunnellCompletionPoints.injective (F:=F) (D:=F) («K»:=K) (M:=K) n
  have hnont:¬IsOfFinAddOrder (f P):=fun h=>hP (by
    rw [isOfFinAddOrder_iff_nsmul_eq_zero] at h ⊢
    obtain ⟨m,hm,hh⟩:=h
    exact ⟨m,hm,hf (by change f (m • P)=f 0; rw [map_nsmul,hh,map_zero])⟩)
  exact TunnellCompletedKummerObstruction.with_embedding e.toRingHom hn hp (algebraMap F K i) _ j hj
    ((hbase i).trans he) a hnorm hm (f P) hnont

#print axioms bound
end
end TunnellGlobalPointBound
