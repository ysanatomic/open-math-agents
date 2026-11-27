import TunnellConjugateInertia
import TunnellRestrictedPlaces
import TunnellGaussianPrimeIdeal
import TunnellCMGoodDivisionField
import Mathlib.RingTheory.Ideal.GoingUp

/-! Ramification index one at every conjugate prime of a primary Kummer division field. -/
namespace TunnellConjugatePrimeIndex
open WeierstrassCurve WeierstrassCurve.Affine IsDedekindDomain IsDedekindDomain.HeightOneSpectrum NumberField IsLocalRing
open TunnellCoates TunnellKummer TunnellGaussianEnd TunnellGaussianPrimeIdeal
open scoped Classical
noncomputable section
variable {D N:Type} [Field D] [Field N] [NumberField D] [NumberField N] [Algebra D N]
variable (v:HeightOneSpectrum (𝓞 D)) (w:HeightOneSpectrum (𝓞 N)) [w.asIdeal.LiesOver v.asIdeal]
local notation "O" => adicCompletionIntegers N w
local notation "L" => adicCompletion N w

theorem selected_mem {F:Type} [Field F] [NumberField F] {B M:Type} [CommRing B] [IsDomain B] [IsDiscreteValuationRing B] [Field M]
    [Algebra B M] [IsFractionRing B M] (e:F→+*M) (s:TunnellRestrictedPlaces.Restriction (B:=B) e)
    (j:F) (hj:j^2= -1) (i:B) (hi:e j=algebraMap B M i) (a b:ℤ) (hm:(a:B)+(b:B)*i∈maximalIdeal B) :
    (a:𝓞 F)+(b:𝓞 F)*integralI j hj∈s.v.asIdeal := by
  have h : s.ψ (integralI j hj)=i := IsFractionRing.injective B M ((s.compat _).trans hi)
  rw [s.prime]
  change s.ψ _∈maximalIdeal B
  rw [map_add,map_mul,map_intCast,map_intCast,h]
  exact hm

private lemma unit_of_avoids (x:𝓞 N) (hx:x∉w.asIdeal) : IsUnit (algebraMap (𝓞 N) O x) := by
  by_contra h
  have hv:=Valuation.Integer.not_isUnit_iff_valuation_lt_one.mp h
  have he:w.valuation N (x:N)=1:=w.valuation_eq_one_iff_notMem.mpr hx
  have he':Valued.v (algebraMap N L (x:N))=1:=(w.valuedAdicCompletion_eq_valuation' _).trans he
  exact he'.not_lt hv

theorem good_at_p {p n:ℕ} (hp:p.Prime) (hn:¬p∣2*n) (hm:(p:𝓞 N)∈w.asIdeal) : (E (n:O)).IsElliptic := by
  have hv:= (w.valuation_lt_one_iff_mem (K:=N) (p:𝓞 N)).mpr hm
  have he:=w.valuedAdicCompletion_eq_valuation' (p:N)
  change Valued.v (algebraMap N L (p:N))=_ at he
  rw [map_natCast] at he
  have hmem:(p:O)∈maximalIdeal O:=Valuation.Integer.not_isUnit_iff_valuation_lt_one.mpr (he ▸ hv)
  let k:=ResidueField O
  haveI:CharP k p:=(CharP.charP_iff_prime_eq_zero hp).mpr (by simpa using (residue_eq_zero_iff _).mpr hmem)
  have hu (m:ℕ) (hm:¬p∣m) : IsUnit (m:O) := by
    by_contra h
    have e:= (residue_eq_zero_iff _).mpr (show (m:O)∈maximalIdeal O from h)
    rw [map_natCast] at e
    exact hm ((CharP.cast_eq_zero_iff k p m).mp e)
  constructor
  rw [TunnellCoates.E_discriminant,show (64:O)=(2:O)^6 by norm_num]
  exact ((hu 2 (fun h=>hn (dvd_mul_of_dvd_left h n))).pow 6).mul ((hu n (fun h=>hn (dvd_mul_of_dvd_right h 2))).pow 6)

theorem unramified [FiniteDimensional D N] [IsGalois D N] (n:ℕ) [(E (n:D)).IsElliptic]
    (j:𝓞 D) (hj:j^2= -1) (a b:ℤ) {p:ℕ} (hp:p.Prime) (hn:¬p∣2*n) (hm:(p:𝓞 D)∈v.asIdeal)
    (hunit:(a:𝓞 D)+(b:𝓞 D)*j∉v.asIdeal) (r:ℕ) {x y:N} (h:((E (n:D)).baseChange N).toAffine.Nonsingular x y)
    (hg:IntermediateField.adjoin D {x,y}=⊤)
    (hfixed:∀ σ:Gal(N/D),act (E (n:D)) σ ((endo (baseI (n:D) (j:D) (by exact_mod_cast hj)) a b)^[r] (.some x y h))=
      (endo (baseI (n:D) (j:D) (by exact_mod_cast hj)) a b)^[r] (.some x y h)) : w.asIdeal.ramificationIdx (𝓞 D)=1 := by
  let m:=algebraMap (𝓞 D) (𝓞 N)
  let f:=algebraMap (𝓞 N) O
  let J:=f (m j)
  have hJ:J^2= -1:=by simp [J,←map_pow,hj]
  have hU:=unit_of_avoids w (m ((a:𝓞 D)+(b:𝓞 D)*j)) ((w.asIdeal.mem_of_liesOver v.asIdeal _).not.mp hunit)
  have hU':IsUnit ((a:O)+(b:O)*J):=by simpa [m,f,J] using hU
  have hp':(p:𝓞 N)∈w.asIdeal:=by simpa using (w.asIdeal.mem_of_liesOver v.asIdeal _).mp hm
  haveI: (E (n:O)).IsElliptic:=good_at_p w hp hn hp'
  apply TunnellCMGoodDivisionField.unramified_of_trivial w v
  apply le_antisymm _ bot_le
  intro σ hσ
  change σ=1
  have hS:=TunnellConjugateInertia.inertia_fixes w n (j:D) (by exact_mod_cast hj) J hJ rfl a b hU' r σ hσ (.some x y h) (hfixed σ)
  exact autos_eq_of_generate hg σ 1 (Point.some.inj hS).1 (Point.some.inj hS).2

theorem complement {K:Type} [Field K] [NumberField K] [Algebra K D] (hd:Module.finrank ℚ K=2)
    (j:K) (hj:j^2= -1) (a b:ℤ) {p:ℕ} (hp:p.Prime) (hn:a^2+b^2=(p:ℤ)) (v₀:HeightOneSpectrum (𝓞 K))
    (hv:(a:𝓞 K)+(b:𝓞 K)*integralI j hj∈v₀.asIdeal) (w₀:HeightOneSpectrum (𝓞 D))
    (hu:∀u:HeightOneSpectrum (𝓞 D),u.asIdeal.LiesOver v₀.asIdeal → u=w₀) (hne:v≠w₀) :
    (a:𝓞 D)+(b:𝓞 D)*algebraMap (𝓞 K) (𝓞 D) (integralI j hj)∉v.asIdeal := by
  let t:HeightOneSpectrum (𝓞 K):=⟨v.asIdeal.under (𝓞 K),inferInstance,Ideal.under_ne_bot (𝓞 K) v.ne_bot⟩
  haveI:v.asIdeal.LiesOver t.asIdeal:=inferInstanceAs (v.asIdeal.LiesOver (v.asIdeal.under (𝓞 K)))
  have htv:t≠v₀:=by rintro rfl; exact hne (hu _ inferInstance)
  have hh:=TunnellGaussianPrimeIdeal.unique hd j hj a b hp hn v₀ hv t htv
  simpa using (v.asIdeal.mem_of_liesOver t.asIdeal _).not.mp hh

#print axioms unramified
#print axioms complement
end
end TunnellConjugatePrimeIndex
