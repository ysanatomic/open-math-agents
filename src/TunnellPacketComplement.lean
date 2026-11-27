import TunnellPacketCRT

/-! Fourier inversion on the prime-to-p complement of a rectangular packet. -/
namespace TunnellPacketComplement
open Finset Complex
noncomputable section

def char {D : ℕ} [NeZero D] (k : ZMod D) (x y : ZMod D) : ℂ := ZMod.stdAddChar (k*x*y)

lemma char_inverse {D : ℕ} [NeZero D] (k : ZMod D) (hk : IsUnit k) (x y : ZMod D) :
    ∑ u, char k x u*char (-k) u y=if x=y then (D:ℂ) else 0 := by
  simp only [char,←AddChar.map_add_eq_mul]
  have h (u:ZMod D) : k*x*u + -k*u*y = u*((x-y)*k) := by ring
  simp only [h]
  rw [AddChar.sum_mulShift _ (ZMod.isPrimitive_stdAddChar D),ZMod.card]
  simp only [hk.mul_left_eq_zero,sub_eq_zero]
  split_ifs <;> simp

def tensor {X Y : Type*} (K : X→X→ℂ) (L : Y→Y→ℂ) (x y : X×Y) : ℂ :=
  K x.1 y.1*L x.2 y.2

lemma tensor_inverse {X Y : Type*} [Fintype X] [Fintype Y] [DecidableEq X] [DecidableEq Y]
    {K J : X→X→ℂ} {L M : Y→Y→ℂ} {b c : ℂ}
    (h : ∀ x y, ∑ u,K x u*J u y=if x=y then b else 0)
    (g : ∀ x y, ∑ v,L x v*M v y=if x=y then c else 0) (x y : X×Y) :
    ∑ u,tensor K L x u*tensor J M u y=if x=y then b*c else 0 := by
  rw [Fintype.sum_prod_type]
  unfold tensor
  have e (i : X) (j : Y) : K x.1 i * L x.2 j * (J i y.1 * M j y.2)=
      (K x.1 i*J i y.1)*(L x.2 j*M j y.2) := by ring
  simp only [e,←mul_sum,←sum_mul,h,g]
  rcases x with ⟨x,u⟩
  rcases y with ⟨y,v⟩
  by_cases h : x=y <;> by_cases h' : u=v <;> simp [h,h']

abbrev Box (A M B N : ℕ) := ZMod A × ZMod M × ZMod B × ZMod N

def boxChar (A M B N p : ℕ) [NeZero A] [NeZero M] [NeZero B] [NeZero N] (j : ℤ) :
    Box A M B N → Box A M B N → ℂ :=
  tensor (char (j:ZMod A)) (tensor (char ((j:ZMod M)*p))
    (tensor (char (j:ZMod B)) (char ((j:ZMod N)*p))))

theorem box_inverse {A M B N p : ℕ} [NeZero A] [NeZero M] [NeZero B] [NeZero N]
    (hc : p.Coprime M) (hd : p.Coprime N) (x y : Box A M B N) :
    ∑ u, boxChar A M B N p 1 x u*boxChar A M B N p (-1) u y =
      if x=y then (A:ℂ)*(M*(B*N)) else 0 := by
  have hM := (ZMod.isUnit_iff_coprime p M).mpr hc
  have hN := (ZMod.isUnit_iff_coprime p N).mpr hd
  simpa only [boxChar,Int.cast_one,Int.cast_neg,neg_mul,one_mul] using
    tensor_inverse (char_inverse (1:ZMod A) isUnit_one)
      (tensor_inverse (char_inverse (p:ZMod M) hM)
        (tensor_inverse (char_inverse (1:ZMod B) isUnit_one) (char_inverse (p:ZMod N) hN))) x y

end
end TunnellPacketComplement
#print axioms TunnellPacketComplement.box_inverse
