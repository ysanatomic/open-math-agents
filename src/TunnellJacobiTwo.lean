import TunnellJacobiOdd

/-! The dyadic recurrence for four squares, by counting the three norm-two left factors. -/

namespace TunnellQuaternion

open Finset Quaternion

def dyadic (i : Fin 3) : QInt := ![⟨1,1,0,0⟩,⟨1,0,1,0⟩,⟨1,0,0,1⟩] i

lemma norm_dyadic (i : Fin 3) : normSq (dyadic i)=2 := by fin_cases i <;> decide

lemma dyadic_dvd_iff (i : Fin 3) (w : QInt) :
    (∃ u : QInt, w=dyadic i*u) ↔ red 2 (star (dyadic i)*w)=0 := by
  rw [div_iff]
  constructor
  · rintro ⟨u,rfl⟩
    exact ⟨u,by rw [←mul_assoc,star_mul_self,norm_dyadic,coe_mul_eq_smul]; rfl⟩
  · rintro ⟨u,hu⟩
    refine ⟨u,scalar_cancel 2 (by decide) ?_⟩
    have hh := congrArg (dyadic i * ·) hu
    simpa only [←mul_assoc,self_mul_star,norm_dyadic,coe_mul_eq_smul,Algebra.mul_smul_comm, Nat.cast_ofNat] using hh

def reduceFour (w : Quaternion (ZMod 4)) : Quaternion (ZMod 2) :=
  let f := ZMod.castHom (by decide : 2∣4) (ZMod 2)
  ⟨f w.re,f w.imI,f w.imJ,f w.imK⟩

lemma reduceFour_red (w : QInt) : reduceFour (red 4 w)=red 2 w := by
  change reduceFour (redFun 4 w)=redFun 2 w
  apply QuaternionAlgebra.ext <;> simp [reduceFour,redFun]

instance finiteQuatDecEq {n : ℕ} : DecidableEq (Quaternion (ZMod n)) :=
  (Quaternion.equivProd _).decidableEq

def dyadicCount (w : Quaternion (ZMod 4)) : ℕ :=
  (univ.filter (fun i : Fin 3 => red 2 (star (dyadic i))*reduceFour w=0)).card

lemma dyadic_table (w : Quaternion (ZMod 4)) :
    (normSq w=0 → dyadicCount w=3) ∧ (normSq w=2 → dyadicCount w=1) := by
  obtain ⟨a,b,c,d⟩ := w
  revert a b c d
  decide

open scoped Classical in
theorem quatShell_two_recurrence (n : ℕ) :
    (quatShell (2*n)).card = if Even n then (quatShell n).card else 3*(quatShell n).card := by
  classical
  have h := count_left_factors (univ : Finset (Fin 3)) dyadic (d:=2) (by decide)
    (fun i _ => norm_dyadic i) n
  simp only [card_univ,Fintype.card_fin] at h
  have hf (w : QInt) (hw : w∈quatShell (2*n)) :
      (univ.filter (fun i : Fin 3 => ∃ u : QInt, w=dyadic i*u)).card = if Even n then 3 else 1 := by
    have hq := dyadic_table (red 4 w)
    rw [←red_norm,mem_quatShell.mp hw] at hq
    have heq : (univ.filter (fun i : Fin 3 => ∃ u : QInt, w=dyadic i*u)).card = dyadicCount (red 4 w) := by
      unfold dyadicCount
      congr 1
      apply filter_congr
      intro i _
      rw [dyadic_dvd_iff,map_mul,reduceFour_red]
    rw [heq]
    split_ifs with he
    · apply hq.1
      rcases he with ⟨t,ht⟩
      rw [ht]
      push_cast
      have hz : (4:ZMod 4)=0 := by decide
      linear_combination (t:ZMod 4)*hz
    · apply hq.2
      obtain ⟨t,ht⟩ := Nat.not_even_iff_odd.mp he
      rw [ht]
      push_cast
      have hz : (4:ZMod 4)=0 := by decide
      linear_combination (t:ZMod 4)*hz
  rw [sum_congr rfl hf,sum_const] at h
  split_ifs at h ⊢ <;> simp_all <;> omega

end TunnellQuaternion
