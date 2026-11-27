import TunnellLocalReduction

/-! The actual E_n over Q_p has no p-power torsion at any odd prime of good reduction. -/
namespace TunnellLocalDivisibility

open WeierstrassCurve TunnellCoates IsLocalRing IsDedekindDomain

variable {p : ℕ} [Fact p.Prime]

private lemma integral_good {O : Type*} [CommRing O] (e : O≃+*ℤ_[p]) {n:ℕ}
    (hn : ¬p∣2*n) : (E (n:O)).IsElliptic := by
  have hu (m:ℕ) (hm : ¬p∣m) : IsUnit (m:O) := by
    apply (isUnit_map_iff e (m:O)).mp
    rw [map_natCast,PadicInt.isUnit_iff,PadicInt.norm_natCast_eq_one_iff]
    exact (Fact.out:p.Prime).coprime_iff_not_dvd.mpr hm
  constructor
  rw [E_discriminant,show (64:O)=(2:O)^6 by norm_num]
  exact ((hu 2 (fun h => hn (dvd_mul_of_dvd_left h n))).pow 6).mul
    ((hu n (fun h => hn (dvd_mul_of_dvd_right h 2))).pow 6)

private lemma card_map_E {F J : Type*} [Field F] [Field J] [DecidableEq F] [DecidableEq J]
    (e : F≃+*J) (n:ℕ) [(E (n:F)).IsElliptic] [(E (n:J)).IsElliptic] :
    Nat.card (E (n:F)).toAffine.Point=Nat.card (E (n:J)).toAffine.Point := by
  let eqv := e.toEquiv.prodCongr e.toEquiv
  have h (xy : F×F) : (E (n:F)).toAffine.Equation xy.1 xy.2 ↔
      (E (n:J)).toAffine.Equation (eqv xy).1 (eqv xy).2 := by
    simp only [E_equation]
    change _ ↔ e xy.2^2=e xy.1^3-(n:J)^2*e xy.1
    rw [←map_pow,←map_pow,←map_natCast e n,←map_pow,←map_mul,←map_sub,e.injective.eq_iff]
  exact Nat.card_congr ((E (n:F)).toAffine.pointEquiv.trans ((eqv.subtypeEquiv h).optionCongr.trans
    (E (n:J)).toAffine.pointEquiv.symm))

open scoped Classical in
private lemma residue_nonanomalous {O : Type*} [CommRing O] [IsLocalRing O] (e : O≃+*ℤ_[p])
    {n:ℕ} (hn : ¬p∣2*n) (hp : 2<p) :
    ¬p ∣ Nat.card (((E (n:O)).map (residue O)).toAffine.Point) := by
  let F := ResidueField O
  let v : F ≃+* ZMod p := (ResidueField.mapEquiv e).trans PadicInt.residueField
  have hnz : (n:ZMod p)≠0 := fun h => hn (dvd_mul_of_dvd_right ((ZMod.natCast_eq_zero_iff _ _).mp h) 2)
  have h2z : (2:ZMod p)≠0 := by
    change ((2:ℕ):ZMod p)≠0
    rw [ne_eq,ZMod.natCast_eq_zero_iff]
    exact fun h => (not_le.mpr hp) (Nat.le_of_dvd (by decide) h)
  have h2f : (2:F)≠0 := fun h => h2z (by simpa only [map_ofNat,map_zero] using congrArg v h)
  have hnf : (n:F)≠0 := fun h => hnz (by simpa using congrArg v h)
  have : (E (n:F)).IsElliptic := E_elliptic h2f hnf
  have : (E (n:ZMod p)).IsElliptic := E_elliptic h2z hnz
  have heq : (E (n:O)).map (residue O)=E (n:F) := by ext <;> simp [E,F]
  rw [heq,card_map_E v,card_points]
  exact non_anomalous_good_prime (by omega) _ hnz

noncomputable def localIntegralEquiv (p:ℕ) [Fact p.Prime] :
    (place p).adicCompletionIntegers ℚ ≃+* ℤ_[p] := by
  letI : Algebra ℤ ((place p).adicCompletionIntegers ℚ) := Ring.toIntAlgebra _
  exact (PadicInt.adicCompletionIntegersEquiv ℤ ⟨p,Fact.out⟩).toAlgEquiv.toRingEquiv.symm

open scoped Classical in
theorem local_no_primary_torsion (hp : 2<p) {n : ℕ} (hn : ¬p∣2*n) (r : ℕ)
    (P : (E (n:Local p)).toAffine.Point) (hP : p^r • P=0) : P=0 := by
  have : CharZero (Local p) := charZero_of_injective_algebraMap (algebraMap ℚ (Local p)).injective
  let O := (place p).adicCompletionIntegers ℚ
  let W₀ := E (n:O)
  have : W₀.IsElliptic := integral_good (localIntegralEquiv p) hn
  have hn0 : n≠0 := by intro h; subst n; simp at hn
  have : (E (n:Local p)).IsElliptic := E_elliptic (by norm_num) (by exact_mod_cast hn0)
  have hW : W₀.map (algebraMap O (Local p))=E (n:Local p) := by ext <;> simp [W₀,E]
  exact not_p_power_torsion hW (localIntegralEquiv p) hp (residue_nonanomalous (localIntegralEquiv p) hn hp) r P hP

#print axioms local_no_primary_torsion
end TunnellLocalDivisibility
