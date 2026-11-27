import TunnellToricLocalSign
import TunnellIdealTorsor

/-! A toric period on the two-element quaternionic double-coset space. -/
namespace TunnellToricSign
open TunnellHurwitzFour TunnellHurwitz TunnellToric TunnellShell TunnellToricClass TunnellToricLocal
open scoped Classical

/-- A local generator of the ideal at the unique ramified finite place. -/
def LocalGenerator (v w : Triple) (q : H ℤ) : Prop :=
  Odd (nr q) ∧ TunnellHurwitz.pure w*hamZ q=hamZ q*TunnellHurwitz.pure v

lemma local_generator_exists {n : ℕ} (hn : n%4=2) {v w : Triple} (hv : v∈shell n) (hw : w∈shell n) :
    ∃ q, LocalGenerator v w q := by
  obtain ⟨t,ht,N,hN,hodd⟩ := odd_intertwiner hn v w hv hw
  obtain ⟨q,hq⟩ := ht.1
  have h := ht.2
  rw [←hq,norm_ham] at hN
  rw [←hq] at h
  have hN' : nr q=(N:ℤ) := by exact_mod_cast hN
  exact ⟨q,by rw [LocalGenerator,hN']; exact ⟨by exact_mod_cast hodd,h⟩⟩

lemma sign_rep {n : ℕ} {w : Triple} (hw : w∈representatives n) :
    color (redVec w)=test w := by
  obtain ⟨ha,hb,_,_,_⟩ := (Finset.mem_filter.mp hw).2
  have hA := ZMod.val_intCast (n:=8) w.1
  have hB := ZMod.val_intCast (n:=8) w.2.1
  have hC := ZMod.val_intCast (n:=8) w.2.2
  have hx := Int.odd_iff.mp ha
  have hy := Int.odd_iff.mp hb
  have hx' : (w.1:Z8).val%2≠0 := by omega
  have hy' : (w.2.1:Z8).val%2≠0 := by omega
  have h0 : (w.2.2:Z8)=0 ↔ w.2.2%8=0 := by rw [←(ZMod.val_injective 8).eq_iff]; change _=0 ↔ _; omega
  have h4 : (w.2.2:Z8)=4 ↔ w.2.2%8=4 := by rw [←(ZMod.val_injective 8).eq_iff]; change _=4 ↔ _; omega
  simp only [color,redVec,hx',hy',if_false,h0,h4,test]

lemma aligned_base {n : ℕ} (hn : n%8=2) {t : Triple} (ht : t∈shell n) :
    ∃ v∈shell n, Odd v.1 ∧ v.2.1%4=v.1%4 ∧ 4∣v.2.2 := by
  obtain ⟨w,hw,_⟩ := rep_exists (show n%4=2 by omega) ht
  obtain ⟨hh,hR⟩ := Finset.mem_filter.mp hw
  obtain ⟨ha,hb,hc,_,_⟩ := hR
  have chk : ∀ x y z : Z8, x.val%2=1 → y.val%2=1 → x^2+y^2+z^2=2 → z.val%4=0 := by decide
  have he := congrArg (fun z:ℤ => (z:Z8)) (mem_shell.mp hh)
  simp only [TunnellShell.normSq,Int.cast_add,Int.cast_pow,Int.cast_natCast] at he
  have hnt : (n:Z8)=2 := by apply ZMod.val_injective; rw [ZMod.val_natCast,hn]; decide
  rw [hnt] at he
  have hx := Int.odd_iff.mp ha
  have hy := Int.odd_iff.mp hb
  have hA := ZMod.val_intCast (n:=8) w.1
  have hB := ZMod.val_intCast (n:=8) w.2.1
  have hC := ZMod.val_intCast (n:=8) w.2.2
  have hz := chk _ _ _ (by omega) (by omega) he
  have hfour : 4∣w.2.2 := by omega
  by_cases h : w.2.1%4=w.1%4
  · exact ⟨w,hh,ha,h,hfour⟩
  · refine ⟨move 0 1 w,move_shell 0 1 hh,?_⟩
    change Odd w.1 ∧ (-w.2.1)%4=w.1%4 ∧ 4∣-w.2.2
    exact ⟨ha,by omega,dvd_neg.mpr hfour⟩

lemma aligned_sign {v : Triple} (hx : Odd v.1) (hy : v.2.1%4=v.1%4) (hz : 4∣v.2.2) :
    color (redVec v)^2=1 := by
  have chk : ∀ x y z:Z8, x.val%2=1 → x.val%4=y.val%4 → z.val%4=0 → color (x,y,z)^2=1 := by decide
  have ha := ZMod.val_intCast (n:=8) v.1
  have hb := ZMod.val_intCast (n:=8) v.2.1
  have hc := ZMod.val_intCast (n:=8) v.2.2
  have e := Int.odd_iff.mp hx
  exact chk _ _ _ (by omega) (by omega) (by omega)

theorem quaternionic_period {d : ℕ} (hs : Squarefree (2*d)) (h₄ : (2*d)%4=2) {v : Triple}
    (hv : v∈shell (2*d)) (hx : Odd v.1) (hy : v.2.1%4=v.1%4) (hz : 4∣v.2.2) :
    let e := idealEquiv hs h₄ hv
    letI := Fintype.ofEquiv ↥(representatives (2*d)) e.symm
    ∀ localGen : ProperIdealClass v → H ℤ, (∀ c, LocalGenerator v (e c).val (localGen c)) →
      (∑ c, character (modFour (localGen c)))=color (redVec v)*TunnellShell.b d := by
  classical
  dsimp only
  let e := idealEquiv hs h₄ hv
  letI := Fintype.ofEquiv ↥(representatives (2*d)) e.symm
  intro localGen h
  have hsource := aligned_sign hx hy hz
  have hw (c) : character (modFour (localGen c))=color (redVec v)*test (e c).val := by
    have ht := character_of_intertwiner hx hy hz (h c).1 (h c).2
    rw [sign_rep (e c).property] at ht
    rw [ht]; linear_combination - character (modFour (localGen c))*hsource
  calc (∑ c, character (modFour (localGen c))) = ∑ c, color (redVec v)*test (e c).val := Finset.sum_congr rfl fun c _ => hw c
       _ = _ := by rw [←Finset.mul_sum,sum_class_representatives (d:=d) e]

#print axioms quaternionic_period
end TunnellToricSign
