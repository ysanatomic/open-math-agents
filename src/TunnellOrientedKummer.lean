import TunnellOrientedSplit

/-! The same ordinary Gaussian prime controls the full division fields and the
nonabelian extensions obtained by dividing a fixed point. -/
namespace TunnellOrientedKummer
open IsLocalRing TunnellLocalDivisibility TunnellPadicDivisionSeries TunnellCoates TunnellGaussianEnd TunnellKummer
open scoped Classical
variable {p n:ℕ} [Fact p.Prime]
local notation "O" => IntegerRing p
local notation "K" => Local p

private theorem bounded_cast (n i:O) (q:K) (e:(n:K)=q) [(E q).IsElliptic] (hi:i^2= -1) (a b:ℤ)
    (hm : (a:O)+(b:O)*i∈maximalIdeal O) (P:(E q).toAffine.Point) (hP:¬IsOfFinAddOrder P) :
    ∃ B:ℕ,∀ r,B<r → ¬∃ Q,(endo (TunnellLocalCM.gaussianI q (i:K) (by exact_mod_cast hi)) a b)^[r] Q=P := by
  subst q
  letI : Finite (ℤ ⧸ (place p).asIdeal) := Ring.HasFiniteQuotients.finiteQuotient (place p).ne_bot
  exact TunnellOrientedNondivisibility.bounded n i hi a b hm P hP

theorem eventually_nonabelian (hp:p%4=1) (hn:¬p∣2*n)
    (P:(E (n:K)).toAffine.Point) (hP:¬IsOfFinAddOrder P) :
    ∃ (i:O) (hi:i^2= -1) (a:GaussianInt), a.norm.natAbs=p ∧ a.re^2+a.im^2=(p:ℤ) ∧
      (a.re:O)+(a.im:O)*i∈maximalIdeal O ∧ IsUnit ((a.re:O)-(a.im:O)*i) ∧
      ∃ B:ℕ,∀ r,B<r → ∀ (L:Type) [Field L] [Algebra K L] [FiniteDimensional K L]
        (Q:CurvePoints (E (n:K)) L),
        (letI : (E (n:K)).IsElliptic := by
           haveI : CharZero K := charZero_of_injective_algebraMap (algebraMap ℚ K).injective
           apply E_elliptic (by norm_num); exact_mod_cast (show n≠0 by intro e; subst n; simp at hn)
         (endo (baseI (n:K) (i:K) (by exact_mod_cast hi)) a.re a.im)^[r] Q)=changeBase (E (n:K)) P →
          ¬IsAbelianGalois K L := by
  haveI : CharZero K := charZero_of_injective_algebraMap (algebraMap ℚ K).injective
  have hn₀:n≠0 := by intro e; subst n; simp at hn
  haveI : (E (n:K)).IsElliptic := E_elliptic (by norm_num) (by exact_mod_cast hn₀)
  obtain ⟨i,a,hi,ha,hp₀,hm,hu⟩ := TunnellOrientedSplit.factor hp
  have hcast : ((n:O):K)=(n:K) := by exact map_natCast (algebraMap O K) n
  obtain ⟨B,hB⟩ := bounded_cast (n:O) i (n:K) hcast hi a.re a.im hm P hP
  refine ⟨i,hi,a,ha,hp₀,hm,hu,B,fun r hr L _ _ _ Q hQ => ?_⟩
  apply gaussian_division_nonabelian (n:K) (i:K) (by exact_mod_cast hi) a.re a.im hp₀ P
    (local_no_primary_torsion (by have := (Fact.out:p.Prime).two_le; omega) hn r) _ Q hQ
  have he : baseI (L:=K) (n:K) (i:K) (by exact_mod_cast hi)=
      TunnellLocalCM.gaussianI (n:K) (i:K) (by exact_mod_cast hi) := by ext x; cases x <;> rfl
  rw [he]; exact hB r hr

#print axioms eventually_nonabelian
end TunnellOrientedKummer
