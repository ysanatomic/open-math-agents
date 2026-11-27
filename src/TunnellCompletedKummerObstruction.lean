import TunnellLocalCMCoordDegree
import TunnellOrientedKummer
import EllipticCurves.VariableChange

/-! Nonabelianity in the actual number-field completion at the selected embedding into the p-adics. -/
namespace TunnellCompletedKummerObstruction
open WeierstrassCurve WeierstrassCurve.Affine IsLocalRing TunnellLocalDivisibility TunnellPadicDivisionSeries
open TunnellCoates TunnellKummer TunnellGaussianEnd TunnellCMTorsionField
open scoped Classical
noncomputable section
variable {p n:ℕ} [Fact p.Prime]
local notation "O" => IntegerRing p
local notation "Kp" => Local p

private theorem bounded (n i:O) (q:Kp) (eq:(n:Kp)=q) [(E q).IsElliptic] (hi:i^2= -1) (a b:ℤ)
    (hm:(a:O)+(b:O)*i∈maximalIdeal O) (P:(E q).toAffine.Point) (hP:¬IsOfFinAddOrder P) :
    ∃ B:ℕ,∀r,B<r → ¬∃Q,(endo (TunnellLocalCM.gaussianI q (i:Kp) (by exact_mod_cast hi)) a b)^[r] Q=P := by
  subst q
  letI:Finite (ℤ ⧸ (place p).asIdeal):=Ring.HasFiniteQuotients.finiteQuotient (place p).ne_bot
  exact TunnellOrientedNondivisibility.bounded n i hi a b hm P hP

theorem with_embedding {F:Type} [Field F] (e:F→+*Kp) (hn:¬p∣2*n) (hp:p%4=1)
    [(E (n:F)).IsElliptic] (j:F) (hj:j^2= -1) (i:O) (hi:i^2= -1) (he:e j=(i:Kp))
    (a:GaussianInt) (hnorm:a.re^2+a.im^2=(p:ℤ)) (hm:(a.re:O)+(a.im:O)*i∈maximalIdeal O)
    (P:CurvePoints (E (n:F)) F) (hP:¬IsOfFinAddOrder P) :
    ∃ B:ℕ,∀r,B<r → ∀(N:Type) [Field N] [Algebra F N] [FiniteDimensional F N]
      (Q:CurvePoints (E (n:F)) N),cm (n:F) j hj (a^r) Q=changeBase (E (n:F)) P → ¬IsAbelianGalois F N := by
  letI:Algebra F Kp:=e.toAlgebra
  haveI:CharZero Kp:=charZero_of_injective_algebraMap (algebraMap ℚ Kp).injective
  have hn0:n≠0:=by rintro rfl; simp at hn
  haveI:(E (n:Kp)).IsElliptic:=E_elliptic (by norm_num) (by exact_mod_cast hn0)
  let eq:(E (n:F)).baseChange Kp=E (n:Kp):=by rw [base_E,map_natCast]
  let f:CurvePoints (E (n:F)) F→+(E (n:Kp)).toAffine.Point:=(Point.equivOfEq eq).toAddMonoidHom.comp
    (Point.map (W':=(E (n:F)).toAffine) (Algebra.ofId F Kp))
  have hf:Function.Injective f:=(Point.equivOfEq eq).injective.comp (Point.map_injective _)
  have hnont:¬IsOfFinAddOrder (f P):=fun h=>hP (by
    rw [isOfFinAddOrder_iff_nsmul_eq_zero] at h ⊢
    obtain ⟨m,hm,hh⟩:=h
    exact ⟨m,hm,hf (by rw [map_nsmul,hh,map_zero])⟩)
  let J:=TunnellLocalCM.gaussianI (n:Kp) (i:Kp) (by exact_mod_cast hi)
  have hJ (X:CurvePoints (E (n:F)) F) : J (f X)=f (baseI (n:F) j hj X) := by
    cases X with
    | zero=>change J (f 0)=f (baseI (n:F) j hj 0); simp only [map_zero]
    | some x y hh=>
      obtain ⟨hh',ee⟩:∃ h',baseI (n:F) j hj (.some x y hh)=.some (-x) (j*y) h':=⟨_,rfl⟩
      simp only [ee,f,AddMonoidHom.comp_apply,AddEquiv.coe_toAddMonoidHom,Point.map_some,Point.equivOfEq_some]
      change Point.some (-e x) ((i:Kp)*e y) _=Point.some (e (-x)) (e (j*y)) _
      exact (Point.some.injEq ..).mpr ⟨(map_neg e x).symm,by rw [map_mul,he]⟩
  obtain ⟨B,hB⟩:=bounded (n:O) i (n:Kp) (map_natCast (algebraMap O Kp) n) hi a.re a.im hm (f P) hnont
  refine ⟨B,fun r hr N _ _ _ Q hQ=>?_⟩
  refine gaussian_division_nonabelian (n:F) j hj a.re a.im (r:=r) hnorm P ?_ ?_ Q ?_
  · intro X hX
    apply hf
    rw [map_zero]
    exact local_no_primary_torsion (by have := (Fact.out:p.Prime).two_le; omega) hn r (f X)
      (by rw [←map_nsmul,hX,map_zero])
  · rintro ⟨X,hX⟩
    exact hB r hr ⟨f X,(iterate_compatible f _ J hJ _ _ r X).trans (congrArg f hX)⟩
  · have hsq (X:CurvePoints (E (n:F)) N) : baseI (n:F) j hj (baseI (n:F) j hj X)= -X := by
      haveI:((E (n:F)).baseChange N).IsElliptic:=inferInstanceAs (((E (n:F)).map (algebraMap F N)).IsElliptic)
      exact quarter_sq (base_E _) _ _ X
    exact (TunnellLocalCMCoordDegree.endo_iterate _ hsq a r Q).trans hQ

#print axioms with_embedding
end
end TunnellCompletedKummerObstruction
