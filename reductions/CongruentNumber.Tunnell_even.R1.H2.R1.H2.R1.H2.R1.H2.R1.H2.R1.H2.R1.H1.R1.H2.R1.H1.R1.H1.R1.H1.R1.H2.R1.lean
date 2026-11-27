import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1_H1_R1_H1_R1_H1_R1
import Mathlib

/-! The orders of local tensor determinants give the upper bound for the finite ray values of norms. A tensor unit supported over one prime realizes each generator. -/
namespace OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1_H1_R1_H1_R1_H1_R1_H2_R1
open NumberField IsDedekindDomain
open scoped NumberField TensorProduct Classical

def H1 : Prop :=
  let Z := (Int.castRingHom (∀ n:ℕ+,ZMod (n:ℕ))).range.topologicalClosure
  let ev (m:ℕ+) := Units.map (((Pi.evalRingHom (fun i:ℕ+ => ZMod (i:ℕ)) m).comp Z.subtype).toMonoidHom)
  let A:=AdeleRing (𝓞 ℚ) ℚ
  ∃ v:Aˣ →* Zˣ, Function.Surjective v ∧ (∀ x:ℚˣ, v (Units.map (algebraMap ℚ A).toMonoidHom x)=1) ∧
  (∀ (m:ℕ+) (p:HeightOneSpectrum (𝓞 ℚ)) (n:ℕ) (z:Aˣ), z.val.1=1 →
    (∀ w:HeightOneSpectrum (𝓞 ℚ), w≠p → z.val.2 w=1) → p.asIdeal.absNorm.Coprime m.val →
    -WithZero.log (Valued.v (z.val.2 p))=(n:ℤ) → ((ev m (v z)).val:ZMod m.val)=(p.asIdeal.absNorm:ZMod m.val)^n) ∧
  ∀ (m:ℕ+) (z:Aˣ), (let P:=HeightOneSpectrum (𝓞 ℚ)
    (∀ (w:InfinitePlace ℚ) (h:w.IsReal), 0 < InfinitePlace.Completion.extensionEmbeddingOfIsReal h (z.val.1 w)) ∧
  ∀ p:P, let n:=m.val.factorization (Rat.HeightOneSpectrum.natGenerator p)
    n≠0 → ∃ u:(p.adicCompletionIntegers ℚ)ˣ, (u.val : p.adicCompletion ℚ)=z.val.2 p ∧
      (u.val-1)∈(IsLocalRing.maximalIdeal (p.adicCompletionIntegers ℚ))^n) →
    ∀ C:Subgroup (ZMod m.val)ˣ, (∀ (p:HeightOneSpectrum (𝓞 ℚ)) (u:(ZMod m.val)ˣ), (u:ZMod m.val)=p.asIdeal.absNorm →
      u ^ (-WithZero.log (Valued.v (z.val.2 p))) ∈ C) → ev m (v z) ∈ C

def H2 : Prop :=
  let A := AdeleRing (𝓞 ℚ) ℚ
  let P := HeightOneSpectrum (𝓞 ℚ)
  ∀ (F:Type) [Field F] [NumberField F] (m:ℕ+) (y:(A⊗[ℚ]F)ˣ),
    let N:=Units.map (Algebra.norm A (S:=A⊗[ℚ]F))
    ∃ t:(A⊗[ℚ]F)ˣ, N y / N t ∈ (Units.map (algebraMap ℚ A).toMonoidHom).range ∧
    ((∀ (w:InfinitePlace ℚ) (h:w.IsReal), 0 < InfinitePlace.Completion.extensionEmbeddingOfIsReal h ((N t).val.1 w)) ∧
  ∀ p:P, let n:=m.val.factorization (Rat.HeightOneSpectrum.natGenerator p)
    n≠0 → ∃ u:(p.adicCompletionIntegers ℚ)ˣ, (u.val : p.adicCompletion ℚ)=(N t).val.2 p ∧
      (u.val-1)∈(IsLocalRing.maximalIdeal (p.adicCompletionIntegers ℚ))^n)

def H3 : Prop :=
  ∀ (F : Type) [Field F] [NumberField F] (v : HeightOneSpectrum (𝓞 ℚ)),
    let K := v.adicCompletion ℚ
    Set.range (fun x : (K ⊗[ℚ] F)ˣ => -WithZero.log (Valued.v (Algebra.norm K x.val))) =
      (↑(AddSubgroup.closure {n : ℤ | ∃ w : HeightOneSpectrum (𝓞 F),
        w.asIdeal.LiesOver v.asIdeal ∧ n = (w.asIdeal.inertiaDeg (𝓞 ℚ) : ℤ)}) : Set ℤ)

def H4 : Prop :=
  ∀ (F : Type) [Field F] [NumberField F] (p : HeightOneSpectrum (𝓞 ℚ)),
  let K := p.adicCompletion ℚ
  let A := AdeleRing (𝓞 ℚ) ℚ
  let N := Units.map (Algebra.norm A (S := A ⊗[ℚ] F))
  (∀ y : (A ⊗[ℚ] F)ˣ, ∃ x : (K ⊗[ℚ] F)ˣ, (N y).val.2 p = Algebra.norm K x.val) ∧
  (∀ x : (K ⊗[ℚ] F)ˣ, ∃ y : (A ⊗[ℚ] F)ˣ, (N y).val.1 = 1 ∧
    (∀ w : HeightOneSpectrum (𝓞 ℚ), w ≠ p → (N y).val.2 w = 1) ∧ (N y).val.2 p = Algebra.norm K x.val)

theorem upper (F : Type) [Field F] [NumberField F] (m : ℕ+) (p : HeightOneSpectrum (𝓞 ℚ))
    (h : p.asIdeal.absNorm.Coprime m.val)
    (k : ℤ) (hk : k ∈ AddSubgroup.closure {n : ℤ | ∃ w : HeightOneSpectrum (𝓞 F),
      w.asIdeal.LiesOver p.asIdeal ∧ n = (w.asIdeal.inertiaDeg (𝓞 ℚ) : ℤ)}) :
    (ZMod.unitOfCoprime p.asIdeal.absNorm h)^k ∈ Subgroup.closure
      {a : (ZMod m.val)ˣ | ∃ w : HeightOneSpectrum (𝓞 F), (a : ZMod m.val) = w.asIdeal.absNorm} := by
  let u := ZMod.unitOfCoprime p.asIdeal.absNorm h
  let S := Subgroup.closure {a : (ZMod m.val)ˣ | ∃ w : HeightOneSpectrum (𝓞 F), (a : ZMod m.val)=w.asIdeal.absNorm}
  let C : AddSubgroup ℤ := (S.comap (zpowersHom ((ZMod m.val)ˣ) u)).toAddSubgroup'
  change k ∈ C
  apply (AddSubgroup.closure_le C).2 _ hk
  rintro _ ⟨w,hw,rfl⟩
  letI := hw
  change u ^ (w.asIdeal.inertiaDeg (𝓞 ℚ) : ℤ) ∈ S
  rw [zpow_natCast]
  apply Subgroup.subset_closure
  refine ⟨w,?_⟩
  rw [Units.val_pow_eq_pow_val,ZMod.coe_unitOfCoprime,←Nat.cast_pow,Ideal.absNorm_pow_inertiaDeg p.asIdeal w.asIdeal]

theorem lower (F : Type) [Field F] [NumberField F] (m : ℕ+) (w : HeightOneSpectrum (𝓞 F))
    (a : (ZMod m.val)ˣ) (ha : (a : ZMod m.val) = w.asIdeal.absNorm) :
    ∃ p : HeightOneSpectrum (𝓞 ℚ), ∃ h : p.asIdeal.absNorm.Coprime m.val,
      w.asIdeal.LiesOver p.asIdeal ∧ (a : ZMod m.val) =
        (p.asIdeal.absNorm : ZMod m.val)^(w.asIdeal.inertiaDeg (𝓞 ℚ)) := by
  let p := HeightOneSpectrum.under (𝓞 ℚ) w
  letI : w.asIdeal.LiesOver p.asIdeal := ⟨rfl⟩
  have h : w.asIdeal.absNorm.Coprime m.val := (ZMod.isUnit_iff_coprime _ _).mp (ha ▸ a.isUnit)
  have norm := Ideal.absNorm_pow_inertiaDeg p.asIdeal w.asIdeal
  have dvd : p.asIdeal.absNorm ∣ w.asIdeal.absNorm :=
    norm ▸ dvd_pow_self _ (Ideal.inertiaDeg_pos w.asIdeal (𝓞 ℚ)).ne'
  exact ⟨p,h.of_dvd_left dvd,inferInstance,ha.trans (by rw [←Nat.cast_pow,norm])⟩

theorem main : H1 → H2 → H3 → H4 → OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1_H1_R1_H1_R1_H1_R1.H2 := by
  rintro ⟨v,surj,kill,point,evaluate⟩ adjust orders proj
  refine ⟨v,surj,kill,point,?_⟩
  intro F _ _ m
  let Z := (Int.castRingHom (∀ n:ℕ+,ZMod (n:ℕ))).range.topologicalClosure
  let ev := Units.map (((Pi.evalRingHom (fun i:ℕ+ => ZMod (i:ℕ)) m).comp Z.subtype).toMonoidHom)
  let A := AdeleRing (𝓞 ℚ) ℚ
  let N := Units.map (Algebra.norm A (S:=A⊗[ℚ]F))
  let S := Subgroup.closure {a : (ZMod m.val)ˣ | ∃ w : HeightOneSpectrum (𝓞 F), (a : ZMod m.val)=w.asIdeal.absNorm}
  change (v.comp N).range.map ev = S
  apply le_antisymm
  · rintro _ ⟨_,⟨b,rfl⟩,rfl⟩
    obtain ⟨t,⟨r,hr⟩,hg⟩ := adjust F m b
    have eq : v (N b) = v (N t) := by
      apply div_eq_one.mp
      rw [←map_div,show N b / N t = _ from hr.symm,kill]
    change ev (v (N b)) ∈ S
    rw [eq]
    apply evaluate m (N t) hg S
    intro p u hu
    have hc : p.asIdeal.absNorm.Coprime m.val := (ZMod.isUnit_iff_coprime _ _).mp (hu ▸ u.isUnit)
    have hu' : u=ZMod.unitOfCoprime p.asIdeal.absNorm hc := Units.ext (hu.trans (ZMod.coe_unitOfCoprime _ hc).symm)
    rw [hu']
    apply upper F m p hc
    apply (Set.ext_iff.mp (orders F p) _).mp
    obtain ⟨x,hx⟩ := (proj F p).1 t
    exact ⟨x,congrArg (fun b => -WithZero.log (Valued.v b)) hx.symm⟩
  · change Subgroup.closure _ ≤ _
    rw [Subgroup.closure_le]
    rintro a ⟨w,ha⟩
    obtain ⟨p,hp,hw,heq⟩ := lower F m w a ha
    let n := w.asIdeal.inertiaDeg (𝓞 ℚ)
    have hn : (n:ℤ) ∈ AddSubgroup.closure {k:ℤ | ∃ s:HeightOneSpectrum (𝓞 F),
        s.asIdeal.LiesOver p.asIdeal ∧ k = (s.asIdeal.inertiaDeg (𝓞 ℚ):ℤ)} :=
      AddSubgroup.subset_closure ⟨w,hw,rfl⟩
    obtain ⟨x,hx⟩ := (Set.ext_iff.mp (orders F p) (n:ℤ)).mpr hn
    obtain ⟨y,real,away,here⟩ := (proj F p).2 x
    refine ⟨v (N y),⟨y,rfl⟩,Units.ext ?_⟩
    exact (point m p n (N y) real away hp (by rw [here]; exact hx)).trans heq.symm

end OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H2_R1_H1_R1_H1_R1_H1_R1_H2_R1
