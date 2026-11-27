import TunnellPreparedRootPlace
import Mathlib.NumberTheory.NumberField.Ideal.Basic
import Mathlib.NumberTheory.RamificationInertia.Basic

/-! Normalized valuations obtained by restricting local embeddings to a number field. -/
namespace TunnellRestrictedPlaces
open NumberField IsLocalRing IsDedekindDomain IsDedekindDomain.HeightOneSpectrum WithZero
open scoped NumberField
noncomputable section
variable {D B M:Type*} [Field D] [NumberField D] [CommRing B] [IsDomain B] [IsDiscreteValuationRing B]
    [Field M] [Algebra B M] [IsFractionRing B M]

theorem integral_lift (φ:D→+*M) :
    ∃ ψ:𝓞 D→+*B,∀ x:𝓞 D,algebraMap B M (ψ x)=φ (x:D) := by
  let g:=φ.comp (algebraMap (𝓞 D) D)
  have hl (x:𝓞 D) : ∃ y:B,algebraMap B M y=g x := by
    have h : IsIntegral ℤ (φ (x:D)) := x.property.map φ.toIntAlgHom
    exact IsIntegrallyClosed.isIntegral_iff.mp h.tower_top
  let l (x:𝓞 D) := (hl x).choose
  have e (x:𝓞 D) : algebraMap B M (l x)=g x := (hl x).choose_spec
  have inj := IsFractionRing.injective B M
  let ψ : 𝓞 D→+*B := {
    toFun := l
    map_one' := inj (by rw [map_one,e,map_one])
    map_zero' := inj (by rw [map_zero,e,map_zero])
    map_mul' x y := inj (by rw [map_mul,e,e,e,map_mul])
    map_add' x y := inj (by rw [map_add,e,e,e,map_add]) }
  exact ⟨ψ,e⟩

structure Restriction (φ:D→+*M) where
  v : HeightOneSpectrum (𝓞 D)
  ψ : 𝓞 D→+*B
  compat (x:𝓞 D) : algebraMap B M (ψ x)=φ (x:D)
  prime : v.asIdeal=(maximalIdeal B).comap ψ
  e : ℕ
  pos : 0<e
  valuation (x:D) : v.valuation D x^e=(IsDiscreteValuationRing.maximalIdeal B).valuation M (φ x)

theorem restrict (φ:D→+*M) {p:ℕ} (hp:p≠0) (hpm:(p:B)∈maximalIdeal B) : Nonempty (Restriction (B:=B) φ) := by
  obtain ⟨ψ,hψ⟩ := integral_lift (B:=B) φ
  let w:=IsDiscreteValuationRing.maximalIdeal B
  have hne : w.asIdeal.comap ψ≠⊥ := by
    intro e
    have hh : (p:𝓞 D)∈w.asIdeal.comap ψ := by change ψ (p:𝓞 D)∈maximalIdeal B; rw [map_natCast]; exact hpm
    rw [e,Ideal.mem_bot] at hh
    exact hp (Nat.cast_eq_zero.mp hh)
  let v:=comapOfNeBot ψ w hne
  letI : Algebra (𝓞 D) B := ψ.toAlgebra
  letI : Algebra D M := φ.toAlgebra
  letI : Algebra (𝓞 D) M := (φ.comp (algebraMap (𝓞 D) D)).toAlgebra
  haveI : IsScalarTower (𝓞 D) D M := .of_algebraMap_eq' rfl
  haveI : IsScalarTower (𝓞 D) B M := .of_algebraMap_eq (fun x => (hψ x).symm)
  have hψi : Function.Injective ψ := fun x y e => (IsFractionRing.injective (𝓞 D) D)
    (φ.injective ((hψ x).symm.trans ((congrArg (algebraMap B M) e).trans (hψ y))))
  haveI : Module.IsTorsionFree (𝓞 D) B := Module.isTorsionFree_iff_algebraMap_injective.mpr hψi
  haveI : w.asIdeal.LiesOver v.asIdeal := ⟨rfl⟩
  let e:=v.asIdeal.ramificationIdx' w.asIdeal
  have he (x:D):v.valuation D x^e=w.valuation M (φ x) := valuation_liesOver M v w x
  have hp₀ : 0<e := by
    apply Nat.pos_of_ne_zero
    intro hz
    have hh := he (p:D)
    rw [hz,pow_zero,map_natCast] at hh
    have hlt : w.valuation M (p:M)<1 := by
      rw [←map_natCast (algebraMap B M) p,valuation_of_algebraMap,intValuation_lt_one_iff_mem]
      exact hpm
    exact hlt.ne hh.symm
  exact ⟨⟨v,ψ,hψ,rfl,e,hp₀,he⟩⟩

theorem uniformizer_restriction (φ:D→+*M) (s:Restriction (B:=B) φ) {p:ℕ} (hp:p≠0)
    (hspan:maximalIdeal B=Ideal.span {(p:B)}) : s.v.valuation D (p:D)=exp (-1:ℤ) := by
  haveI : CharZero M := charZero_of_injective_ringHom φ.injective
  haveI : CharZero B := (algebraMap B M).charZero
  have h := s.valuation (p:D)
  rw [map_natCast φ p,←map_natCast (algebraMap B M) p,valuation_of_algebraMap,
    (IsDiscreteValuationRing.maximalIdeal B).intValuation_singleton (Nat.cast_ne_zero.mpr hp) hspan] at h
  have he := congrArg (WithZero.log : ℤᵐ⁰→ℤ) h
  rw [log_pow,log_exp,Int.nsmul_eq_mul] at he
  have hdiv : (s.e:ℤ)∣-1 := ⟨_,he.symm⟩
  have he₁ : s.e=1 := by
    have hnat := Int.natAbs_dvd_natAbs.mpr hdiv
    simpa using hnat
  rwa [he₁,pow_one] at h

theorem equal_values (φ:D→+*M) (s:Restriction (B:=B) φ) (t:D) (z:B)
    (hz:φ t=algebraMap B M z) {p d:ℕ} (u:Bˣ) (hr:z^d=(p:B)*u) :
    (s.v.valuation D t)^d=s.v.valuation D (p:D) := by
  let w:=IsDiscreteValuationRing.maximalIdeal B
  have hu : w.intValuation (u:B)=1 := by simp [w,IsDiscreteValuationRing.maximalIdeal]
  apply (pow_left_inj₀ zero_le zero_le s.pos.ne').mp
  rw [←pow_mul,Nat.mul_comm,pow_mul,s.valuation,s.valuation,hz,map_natCast φ p,←map_natCast (algebraMap B M) p]
  rw [valuation_of_algebraMap,valuation_of_algebraMap,←map_pow,hr,map_mul,hu,mul_one]

variable {F A K:Type*} [Field F] [NumberField F] [Algebra F D]
    [CommRing A] [IsDomain A] [IsDiscreteValuationRing A] [Field K] [Algebra A K] [IsFractionRing A K]

theorem restrict_liesOver (f:F→+*K) (g:D→+*M) (s:Restriction (B:=A) f) (t:Restriction (B:=B) g)
    (μ:K→+*M) (f₀:A→+*B) [IsLocalHom f₀]
    (hc:∀ x:A,algebraMap B M (f₀ x)=μ (algebraMap A K x))
    (he:∀ x:F,g (algebraMap F D x)=μ (f x)) :
    t.v.asIdeal.LiesOver s.v.asIdeal := by
  constructor
  ext x
  rw [s.prime,t.prime]
  change s.ψ x∈maximalIdeal A ↔ t.ψ (algebraMap (𝓞 F) (𝓞 D) x)∈maximalIdeal B
  have eq : t.ψ (algebraMap (𝓞 F) (𝓞 D) x)=f₀ (s.ψ x) := by
    apply IsFractionRing.injective B M
    rw [t.compat,hc,s.compat,←he]
    rfl
  rw [eq]
  change ¬IsUnit _ ↔ ¬IsUnit _
  rw [isUnit_map_iff f₀]

#print axioms restrict
#print axioms uniformizer_restriction
#print axioms equal_values
#print axioms restrict_liesOver
end
end TunnellRestrictedPlaces
