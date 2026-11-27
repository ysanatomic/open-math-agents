import TunnellLocalizedPacket
import TunnellTraceLifts

/-! The complete one-prime level trace of a four-dimensional rectangular theta
packet, written with its integral modular-group representatives. -/
namespace TunnellRectangularLocalTrace
open Complex Finset TunnellPacketComplement TunnellLocalizedPacket TunnellTraceLifts
open TunnellPacketOperators TunnellRamifiedPlane TunnellRamifiedWeyl ModularGroup MatrixGroups ModularForm
open UpperHalfPlane hiding I
open scoped ModularForm
noncomputable section
variable {A B k l p : ℕ} [NeZero A] [NeZero B] [NeZero k] [NeZero l] [Fact p.Prime]
local notation "X" => Box A (2*k) B (2*l)
local notation "V" => ZMod p × ZMod p

lemma neg_slash (g : SL(2,ℤ)) (F : ℍ→ℂ) : F ∣[(2:ℤ)] (-g)= F ∣[(2:ℤ)] g := by
  funext z
  rw [SL_slash_apply,SL_slash_apply,SL_neg_smul]
  rw [ModularGroup.denom_apply (-g) z,ModularGroup.denom_apply g z]
  have h (i j : Fin 2) : ((-g) i j:ℤ) = -(g i j) := rfl
  simp only [h,Int.cast_neg,show (-(g 1 0:ℂ))*(z:ℂ)+ -(g 1 1:ℂ) = -((g 1 0:ℂ)*z+g 1 1) by ring,
    zpow_neg,zpow_ofNat,neg_sq]


variable (hc : p.Coprime (2*k)) (hd : p.Coprime (2*l)) (eA : Even A) (eB : Even B)
    (m : ℤ) (hm : (m:ZMod p)=1)
    (hA : 2*(A:ℤ)∣m) (hB : 2*(B:ℤ)∣m) (hk : 4*(k:ℤ)∣m) (hl : 4*(l:ℤ)∣m)
    {a t : ZMod p} (ha : (k:ZMod p)=a) (hb : (l:ZMod p)= -a*t)
    (hp : p≠2) (ha0 : a≠0) (ht : t≠0)

include hc hd eA eB m hm hA hB hk hl ha hb hp ha0 ht in
lemma actual_step (j : ZMod p) (x : X) (v : V) (z : ℍ) :
    ((family hc hd x v) ∣[(2:ℤ)] step m j.val) z=
      weyl a t (TunnellRamifiedWeyl.translate a t j (fun u => family hc hd x u z)) v := by
  let F := family (A:=A) (B:=B) hc hd
  have hW : Law F (weylLift m) (plane ((gauss a t/(p:ℂ)^2) • W a t (-1))) := by
    intro x u z
    rw [localized_weyl hc hd eA eB m hm hA hB hk hl ha hb x u z,weyl_kernel hp ha0 ht]
    rfl
  have hT := law_T hc hd eA eB (m*j.val) (dvd_mul_of_dvd_left hA _) (dvd_mul_of_dvd_left hB _)
    (dvd_mul_of_dvd_left hk _) (dvd_mul_of_dvd_left hl _) ha hb
  have hW' : Law F (-(weylLift m)) (plane ((gauss a t/(p:ℂ)^2) • W a t (-1))) := by
    intro x y z; rw [neg_slash]; exact hW x y z
  have H := law_mul hW' hT x v z
  rw [step,H,weyl_kernel hp ha0 ht]
  simp only [Int.cast_mul,Int.cast_natCast,hm,one_mul,ZMod.natCast_zmod_val]
  rfl

include hc hd eA eB m hm hA hB hk hl ha hb hp ha0 ht in
theorem local_trace (x : X) (z : ℍ) :
    (∑ j : Option (ZMod p), ((family hc hd x 0) ∣[(2:ℤ)] localRep m j) z) =
      trace a t (fun u => family hc hd x u z) := by
  rw [Fintype.sum_option]
  change ((family hc hd x 0) ∣[(2:ℤ)] (1:SL(2,ℤ))) z+
    (∑ i : ZMod p, ((family hc hd x 0) ∣[(2:ℤ)] step m i.val) z)=_
  simp only [SlashAction.slash_one,actual_step hc hd eA eB m hm hA hB hk hl ha hb hp ha0 ht]
  exact weyl_trace hp ha0 ht (fun u => family hc hd x u z)

end
end TunnellRectangularLocalTrace
#print axioms TunnellRectangularLocalTrace.local_trace
