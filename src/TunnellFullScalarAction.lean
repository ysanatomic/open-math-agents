import TunnellCMTorsionDegree
import Mathlib.RingTheory.ZMod.UnitsCyclic

/-! The equality in the degree bound identifies the torsion Galois group with all scalars. -/
namespace TunnellFullScalarAction
open TunnellKummer WeierstrassCurve
noncomputable section

lemma scalar_iff {A:Type*} [AddCommGroup A] (S:A) {m:ℕ} (ho:addOrderOf S=m) (k l:ℤ) :
    k • S=l • S ↔ (k:ZMod m)=l := by
  calc k • S=l • S ↔ (k-l) • S=0 := by rw [sub_zsmul,←sub_eq_add_neg,sub_eq_zero]
    _ ↔ (m:ℤ)∣k-l := by rw [←addOrderOf_dvd_iff_zsmul_eq_zero,ho]
    _ ↔ (k:ZMod m)=l := by rw [←ZMod.intCast_zmod_eq_zero_iff_dvd,Int.cast_sub,sub_eq_zero]

theorem full_scalar {G A:Type*} [Group G] [AddCommGroup A] (act:G→A→+A)
    (S:A) (one:act 1 S=S) (mul:∀ g h,act (g*h) S=act g (act h S))
    (hstable:∀ g,∃ k:ℤ,act g S=k • S) (hfaith:Function.Injective (fun g => act g S))
    {m:ℕ} [NeZero m] (horder:addOrderOf S=m) (hcard:Nat.card G=m.totient) :
    ∃ e:G≃*(ZMod m)ˣ,∀ (g:G) (k:ℤ),act g S=k • S ↔ (e g:ZMod m)=k := by
  let c (g:G) := (hstable g).choose
  have hc (g:G) : act g S=c g • S := (hstable g).choose_spec
  let χ : G→*ZMod m := {
    toFun g := (c g:ZMod m)
    map_one' := by
      have he := (scalar_iff S horder (c 1) 1).mp (by rw [←hc,one,one_zsmul])
      simpa only [Int.cast_one] using he
    map_mul' g h := by
      have he := (scalar_iff S horder (c (g*h)) (c h*c g)).mp (by
        rw [←hc,mul,hc h,map_zsmul,hc g,mul_zsmul])
      simpa only [Int.cast_mul,mul_comm] using he }
  let u:=χ.toHomUnits
  have hu (g:G) : (u g:ZMod m)=(c g:ZMod m) := rfl
  have hinj : Function.Injective u := by
    intro g h e
    apply hfaith
    change act g S=act h S
    rw [hc,hc]
    exact (scalar_iff S horder _ _).mpr (congrArg Units.val e)
  have hsize : Nat.card G=Nat.card (ZMod m)ˣ :=
    hcard.trans (by rw [Nat.card_eq_fintype_card,ZMod.card_units_eq_totient])
  let e := MulEquiv.ofBijective u ((Nat.bijective_iff_injective_and_card u).mpr ⟨hinj,hsize⟩)
  refine ⟨e,fun g k => ?_⟩
  rw [hc]
  exact scalar_iff S horder _ _

theorem torsion_field {F T:Type*} [Field F] [Field T] [Algebra F T] [FiniteDimensional F T] [IsGalois F T]
    [DecidableEq T] (W:WeierstrassCurve F) (S:CurvePoints W T)
    {x y:T} (hh:(W.baseChange T).toAffine.Nonsingular x y) (hs:S=Affine.Point.some x y hh)
    (hgen:IntermediateField.adjoin F {x,y}=⊤) (hstable:∀ g:Gal(T/F),∃ k:ℤ,act W g S=k • S)
    {m:ℕ} [NeZero m] (ho:addOrderOf S=m) (hd:Module.finrank F T=m.totient) :
    ∃ e:Gal(T/F)≃*(ZMod m)ˣ,∀ (g:Gal(T/F)) (k:ℤ),act W g S=k • S ↔ (e g:ZMod m)=k := by
  apply full_scalar (act W) S (act_one W S) (fun _ _ => act_mul W _ _ S) hstable _ ho
    ((IsGalois.card_aut_eq_finrank F T).trans hd)
  intro g h e
  rw [hs] at e
  have eq := Affine.Point.some.inj e
  exact autos_eq_of_generate hgen g h eq.1 eq.2

theorem tame_inequality {p:ℕ} [Fact p.Prime] (c:(ZMod p)ˣ) (hc:orderOf c=p-1)
    (k:ℕ) (h₁:2≤k) (h₂:k<p) : (c:ZMod p)^k≠(c:ZMod p) := by
  intro h
  have he : c^k=c := Units.ext h
  have hn : c^(k-1)=1 := by
    have eq : c^(k-1)*c=1*c := by rw [←pow_succ,show k-1+1=k by omega,he,one_mul]
    exact mul_right_cancel eq
  have hd := orderOf_dvd_of_pow_eq_one hn
  rw [hc] at hd
  have := Nat.le_of_dvd (show 0<k-1 by omega) hd
  omega

#print axioms full_scalar
#print axioms torsion_field
#print axioms tame_inequality
end
end TunnellFullScalarAction
