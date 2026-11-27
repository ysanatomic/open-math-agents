import TunnellKummerArtinCharacter
import TunnellCMTorsionDegree

/-! # Conjugation on the cyclic Kummer translation group -/
namespace TunnellCyclicKummerCharacter
open WeierstrassCurve TunnellKummer LocalClassFieldTheory

variable {F T L:Type} [Field F] [Field T] [Field L] [Algebra F T] [Algebra F L] [Algebra T L]
    [IsScalarTower F T L] [DecidableEq F] [DecidableEq L]

section Displacement
variable (W:WeierstrassCurve F) (φ:CurvePoints W L →+ CurvePoints W L) (Q S:CurvePoints W L)
    (hφ:∀ (σ:Gal(L/F)) x, φ (act W σ x)=act W σ (φ x))
    (hP:∀ (σ:Gal(L/F)),act W σ (φ Q)=φ Q)
    (hgen:∀ x:CurvePoints W L,φ x=0 → x∈AddSubgroup.zmultiples S)
    (hfix:∀ g:Gal(L/T), act W (g.restrictScalars F) S=S)

include hgen hfix in
private lemma fixed_kernel (g:Gal(L/T)) (x:CurvePoints W L) (hx:x∈φ.ker) :
    act W (g.restrictScalars F) x=x := by
  obtain ⟨k,rfl⟩ := AddSubgroup.mem_zmultiples_iff.mp (hgen x hx)
  rw [map_zsmul,hfix]

include hφ hP hgen hfix in
noncomputable def translation : Gal(L/T) →* Multiplicative (AddSubgroup.zmultiples S) where
  toFun g := Multiplicative.ofAdd ⟨act W (g.restrictScalars F) Q-Q,
    hgen _ (translation_mem W φ Q hφ hP (g.restrictScalars F))⟩
  map_one' := by apply Subtype.ext; change act W (1:Gal(L/F)) Q-Q=0; rw [act_one,sub_self]
  map_mul' g h := by
    apply Subtype.ext
    change act W (g.restrictScalars F*h.restrictScalars F) Q-Q=(act W (g.restrictScalars F) Q-Q)+(act W (h.restrictScalars F) Q-Q)
    have hx := fixed_kernel W φ S hgen hfix g _ (translation_mem W φ Q hφ hP (h.restrictScalars F))
    rw [map_sub] at hx
    rw [act_mul,(sub_eq_iff_eq_add).mp hx]
    abel

theorem translation_conjugation_power (δ:Gal(T/F)) (σ:Gal(L/F))
    (h:∀ x:T, σ (algebraMap T L x)=algebraMap T L (δ x)) (k:ℤ) (hk:act W σ S=k • S)
    (ht : Function.Injective (translation W φ Q S hφ hP hgen hfix)) (g:Gal(L/T)) :
    semilinearGaloisGroupCongr T T L L δ.toRingEquiv σ.toRingEquiv h g=g^k := by
  let κ := translation W φ Q S hφ hP hgen hfix
  let c := semilinearGaloisGroupCongr T T L L δ.toRingEquiv σ.toRingEquiv h g
  have he : c.restrictScalars F=σ*g.restrictScalars F*σ⁻¹ := by
    ext z
    obtain ⟨y,rfl⟩ := σ.surjective z
    exact (semilinearGaloisGroupCongr_apply_equiv T T L L δ.toRingEquiv σ.toRingEquiv h g y).trans (by simp)
  have hh := translation_conjugate W φ Q hφ hP (g.restrictScalars F) σ (fixed_kernel W φ S hgen hfix g)
  obtain ⟨m,hm⟩ := AddSubgroup.mem_zmultiples_iff.mp (κ g).toAdd.2
  change m • S=act W (g.restrictScalars F) Q-Q at hm
  apply ht
  change κ c=κ (g^k)
  rw [map_zpow]
  apply Subtype.ext
  change act W (c.restrictScalars F) Q-Q=k • (act W (g.restrictScalars F) Q-Q)
  rw [he,hh,←hm,map_zsmul,hk,smul_comm]

theorem translation_injective {x y:L} (hh:(W.baseChange L).toAffine.Nonsingular x y)
    (hq:Q=Affine.Point.some x y hh) (hxy:IntermediateField.adjoin T {x,y}=⊤) :
    Function.Injective (translation W φ Q S hφ hP hgen hfix) := by
  intro g h he
  have e := congrArg (fun c : Multiplicative (AddSubgroup.zmultiples S) => c.toAdd.val) he
  have eqt : act W (g.restrictScalars F) Q=act W (h.restrictScalars F) Q := by
    change act W (g.restrictScalars F) Q-Q=act W (h.restrictScalars F) Q-Q at e
    simpa using congrArg (· + Q) e
  rw [hq] at eqt
  have ex := Affine.Point.some.inj eqt
  exact autos_eq_of_generate hxy g h ex.1 ex.2

end Displacement

theorem cyclic_degree {G A:Type*} [Group G] [AddGroup A] (S:A)
    (κ:G→*Multiplicative (AddSubgroup.zmultiples S)) (hinj:Function.Injective κ)
    [Finite G] [Nontrivial G] {p r:ℕ} (hp:p.Prime) (hS:addOrderOf S=p^r) :
    IsCyclic G ∧ p∣Nat.card G := by
  have h₁ : Nat.card G∣p^r := by
    have h := Subgroup.card_dvd_of_injective κ hinj
    change Nat.card G ∣ Nat.card (AddSubgroup.zmultiples S) at h
    simpa only [Nat.card_zmultiples,hS] using h
  obtain ⟨m,hm,e⟩ := (Nat.dvd_prime_pow hp).mp h₁
  have hm₀ : m≠0 := by
    rintro rfl
    have h : 1<Nat.card G := Finite.one_lt_card
    rw [e,pow_zero] at h
    omega
  exact ⟨isCyclic_of_injective κ hinj,e ▸ dvd_pow_self p hm₀⟩

open scoped IsMulCommutative in
theorem nontrivial_kernel [IsGalois F L] [IsAbelianGalois F T] (hn : ¬IsAbelianGalois F L) :
    Nontrivial Gal(L/T) := by
  by_contra h
  haveI : Subsingleton Gal(L/T) := not_nontrivial_iff_subsingleton.mp h
  let res := AlgEquiv.restrictNormalHom (F:=F) (K₁:=L) T
  have hi : Function.Injective res := (injective_iff_map_eq_one res).mpr (by
    intro σ he
    let τ : Gal(L/T) := { σ.toRingEquiv with
      commutes' t := by
        change σ (algebraMap T L t)=algebraMap T L t
        rw [←AlgEquiv.restrictNormal_commutes σ T]
        change algebraMap T L (res σ t)=_
        rw [he]; rfl }
    exact AlgEquiv.ext (fun x => congrArg (fun g:Gal(L/T) => g x) (Subsingleton.elim τ 1)))
  exact hn { is_comm.comm σ τ := hi (by rw [map_mul,map_mul,mul_comm]) }

open LocalFieldTheory LocalFieldTheory.IsNonarchimedeanLocalField
open scoped ValuativeRel

/-- The translation character of a division lift is a nonzero residue-characteristic
local Artin character on the torsion field. Its Galois action is the scalar action on
the torsion generator, and it kills norms from the division field of the lift. -/
theorem kummer_character [ValuativeRel T] [TopologicalSpace T] [IsNonarchimedeanLocalField T]
    [FiniteDimensional T L] [IsGalois F L] [IsAbelianGalois F T] (hn : ¬IsAbelianGalois F L)
    (W:WeierstrassCurve F) (φ:CurvePoints W L →+ CurvePoints W L) (Q S:CurvePoints W L)
    (hφ:∀ (σ:Gal(L/F)) x, φ (act W σ x)=act W σ (φ x))
    (hP:∀ (σ:Gal(L/F)),act W σ (φ Q)=φ Q)
    (hgen:∀ x:CurvePoints W L,φ x=0 → x∈AddSubgroup.zmultiples S)
    (hfix:∀ g:Gal(L/T), act W (g.restrictScalars F) S=S)
    {x y:L} (hh:(W.baseChange L).toAffine.Nonsingular x y)
    (hq:Q=Affine.Point.some x y hh) (hxy:IntermediateField.adjoin T {x,y}=⊤)
    {p r:ℕ} [Fact p.Prime] (hS:addOrderOf S=p^r) :
    ∃ α:Additive Tˣ→+ZMod p, Function.Surjective α ∧
      (∀ y:Lˣ,α (Additive.ofMul (normUnits T L y))=0) ∧
      ∀ (δ:Gal(T/F)) (σ:Gal(L/F)) (h:∀ x:T,σ (algebraMap T L x)=algebraMap T L (δ x))
        (hc:SemilinearValuationCompatible T T δ.toRingEquiv) (k:ℤ) (_:act W σ S=k • S) (x:Tˣ),
        α (Additive.ofMul (Units.map δ.toRingEquiv.toMonoidHom x))=(k:ZMod p)*α (Additive.ofMul x) := by
  haveI := nontrivial_kernel (T:=T) hn
  haveI := IsGalois.tower_top_of_isGalois F T L
  have ht := translation_injective W φ Q S hφ hP hgen hfix hh hq hxy
  obtain ⟨hc,hp⟩ := cyclic_degree S _ ht Fact.out hS
  haveI := hc
  haveI := IsAbelianGalois.of_isCyclic T L
  obtain ⟨α,ha,hnorm,he⟩ := TunnellKummerArtinCharacter.character hp
  refine ⟨α,ha,hnorm,fun δ σ h hv k hk z => ?_⟩
  exact he δ.toRingEquiv σ.toRingEquiv h hv k
    (translation_conjugation_power W φ Q S hφ hP hgen hfix δ σ h k hk ht) z

#print axioms translation_conjugation_power
#print axioms translation_injective
#print axioms cyclic_degree
#print axioms nontrivial_kernel
#print axioms kummer_character
end TunnellCyclicKummerCharacter
