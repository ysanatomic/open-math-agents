import TunnellRectangleTrace
import TunnellPrimeTrace
import TunnellTraceHeight
import TunnellDensityShift

/-! The geometric rectangular theta trace is precisely the modular-group trace
of each class-pair theta product. -/
namespace TunnellTraceIdentification
open Complex Finset TunnellTraceHeight TunnellOddTraceHeight TunnellRectangleTrace TunnellPrimeTrace
open TunnellDensityTrace TunnellRamifiedLines TunnellIntegralPacket TunnellTraceCosets TunnellTraceLifts TunnellLineDensity
open ModularGroup MatrixGroups ModularForm
open UpperHalfPlane hiding I
open scoped ModularForm
noncomputable section
variable {d : ℕ} [NeZero d]
private instance prime (i : P d) : Fact i.val.Prime := ⟨Nat.prime_of_mem_primeFactors i.property⟩

lemma unit_a (D : Data d) (i : P d) : (D.U.a:ZMod i.val)≠0 := by
  simpa [TunnellUniformBasis.Basis.atPrime] using (D.U.atPrime i).unit
lemma unit_b (D : Data d) (i : P d) : (D.V.a:ZMod i.val)≠0 := by
  simpa [TunnellUniformBasis.Basis.atPrime] using (D.V.atPrime i).unit

lemma piece_modulus {n d a c : ℕ} [NeZero n] [NeZero d] [NeZero a] [NeZero c]
    (e : n=d) (b f : ℤ) : piece n a c b f=piece d a c b f := by subst d; rfl

lemma shift_matches (i : P d) (v : ZMod i.val×ZMod i.val) : shift (d/i.val) v=addCoord i v := by
  ext <;> simp only [shift,addCoord,Nat.cast_mul]

set_option maxHeartbeats 280000 in
lemma factor_trace (hs : Squarefree d) (hd : d%4=1) (D : Data d) (i : P d) (m : ℤ)
    (hm : (m:ZMod i.val)=1) (hA : 32*(d/i.val)*D.U.a ∣ m.natAbs) (hB : 32*(d/i.val)*D.V.a ∣ m.natAbs)
    (s : ℤ×ℤ) (hS : TunnellPrimeTrace.admissible i s) :
    letI : NeZero D.U.a := ⟨D.U.pos.ne'⟩
    letI : NeZero D.V.a := ⟨D.V.pos.ne'⟩
    (∑ j : Option (ZMod i.val), piece d D.U.a D.V.a D.U.b D.V.b s ∣[(2:ℤ)] localRep m j)=
      ∑ v : ZMod i.val × ZMod i.val,(density (parameter D.U.atPrime D.V.atPrime i) v:ℂ) •
        piece d D.U.a D.V.a D.U.b D.V.b (s+addCoord i v) := by
  letI : NeZero D.U.a := ⟨D.U.pos.ne'⟩
  letI : NeZero D.V.a := ⟨D.V.pos.ne'⟩
  let e := d/i.val
  have de : i.val*e=d := Nat.mul_div_cancel' (Nat.dvd_of_mem_primeFactors i.property)
  letI : NeZero e := ⟨by intro h; rw [h,mul_zero] at de; exact NeZero.ne d de.symm⟩
  have hp := (prime i).out
  have hp2 : i.val≠2 := by intro eq; have h := Nat.dvd_of_mem_primeFactors i.property; rw [eq] at h; omega
  have h2 : (2:ZMod i.val)≠0 := by
    change ¬ ((2:ℕ):ZMod i.val)=0
    rw [ZMod.natCast_eq_zero_iff]
    exact fun h => hp2 ((Nat.prime_dvd_prime_iff_eq hp Nat.prime_two).mp h)
  have h8 : (8:ZMod i.val)≠0 := by rw [show (8:ZMod i.val)=2^3 by norm_num]; exact pow_ne_zero _ h2
  have he : (e:ZMod i.val)≠0 := by simpa [complementaryUnit,e] using Units.ne_zero (complementaryUnit hs i)
  let α : ZMod i.val := 2*D.U.a*e
  let t := parameter D.U.atPrime D.V.atPrime i
  have hu := unit_a D i
  have hv := unit_b D i
  have hα : α≠0 := mul_ne_zero (mul_ne_zero h2 hu) he
  have hl : (8:ZMod i.val)*D.V.a*e≠0 := mul_ne_zero (mul_ne_zero h8 hv) he
  have hCM : i.val.Coprime (2*(2*D.U.a*e)) := ((ZMod.isUnit_iff_coprime _ _).mp
      (isUnit_iff_ne_zero.mpr (by push_cast; exact mul_ne_zero h2 hα))).symm
  have hCN : i.val.Coprime (2*(8*D.V.a*e)) := ((ZMod.isUnit_iff_coprime _ _).mp
      (isUnit_iff_ne_zero.mpr (by push_cast; exact mul_ne_zero h2 hl))).symm
  have hlt : (8:ZMod i.val)*D.V.a*e= -α*t := by
    dsimp [α,t,parameter,TunnellUniformBasis.Basis.atPrime]
    push_cast
    field_simp [hu]
    <;> ring
  have ht : t≠0 := by intro h; rw [h,mul_zero] at hlt; exact hl hlt
  have H₁ : (32:ℤ)*e*D.U.a ∣ m := by exact_mod_cast Int.natCast_dvd.mpr hA
  have H₂ : (32:ℤ)*e*D.V.a ∣ m := by exact_mod_cast Int.natCast_dvd.mpr hB
  have H := piece_trace (a:=D.U.a) (c:=D.V.a) (e:=e) (p:=i.val) (α:=α) (t:=t) hCM hCN m hm (by push_cast; exact dvd_trans (show 2*(2*1*(D.U.a:ℤ))∣32*e*D.U.a from ⟨8*e,by ring⟩) H₁)
    (by push_cast; exact dvd_trans (show 2*(2*4*(D.V.a:ℤ))∣32*e*D.V.a from ⟨2*e,by ring⟩) H₂)
    (by push_cast; exact dvd_trans (show 4*(2*(D.U.a:ℤ)*e)∣32*e*D.U.a from ⟨4,by ring⟩) H₁)
    (by push_cast; exact dvd_trans (show 4*(8*(D.V.a:ℤ)*e)∣32*e*D.V.a from ⟨1,by ring⟩) H₂)
    (by push_cast; rfl : ((2*D.U.a*e:ℕ):ZMod i.val)=α) (by push_cast; exact hlt) hp2 hα ht D.U.b D.V.b s hS.1 hS.2
  rw [piece_modulus (a:=D.U.a) (c:=D.V.a) de D.U.b D.V.b] at H
  simpa only [e,t,shift_matches i] using H

theorem identify (hs : Squarefree d) (hd : d%4=1) (D : Data d) (m : P d→ℤ)
    (hm : ∀ i,(m i:ZMod i.val)=1)
    (hA : ∀ i,32*(d/i.val)*D.U.a∣(m i).natAbs) (hB : ∀ i,32*(d/i.val)*D.V.a∣(m i).natAbs)
    (z : ℍ) :
    (∑ j : Choices d,((fun w : ℍ => base D w) ∣[(2:ℤ)] lift m j) z)=traced D z := by
  letI : NeZero D.U.a := ⟨D.U.pos.ne'⟩
  letI : NeZero D.V.a := ⟨D.V.pos.ne'⟩
  let F := piece d D.U.a D.V.a D.U.b D.V.b
  let w (i : P d) (v : ZMod i.val × ZMod i.val) := (density (parameter D.U.atPrime D.V.atPrime i) v:ℂ)
  have H := assemble_average m F w (fun i s h => factor_trace hs hd D i _ (hm i) (hA i) (hB i) s h)
  have Hv := congrFun H z
  simp only [Finset.sum_apply,Pi.smul_apply,smul_eq_mul] at Hv
  change (∑ j : Choices d,(F 0 ∣[(2:ℤ)] lift m j) z)=_
  rw [Hv,traced,TunnellDensityTrace.product hs (complementaryUnit hs)]
  simp only [shifts_eq]
  apply sum_congr rfl; intro u _
  congr 1
  change _*_= _*_
  congr 1 <;> apply rect_period
  all_goals
    simp [addCoord,assemble,Prod.fst_sum,Prod.snd_sum] <;> simp only [←Int.natCast_ediv,Int.cast_natCast]

end
end TunnellTraceIdentification
#print axioms TunnellTraceIdentification.identify
