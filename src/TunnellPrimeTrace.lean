import TunnellOrderedTrace
import TunnellTraceLifts

/-! Multiplying the independent level-lowering traces along the prime factors of d. -/
namespace TunnellPrimeTrace
open Finset TunnellTraceCosets TunnellTraceLifts TunnellRamifiedLines TunnellOrderedTrace
open MatrixGroups ModularGroup ModularForm
open scoped ModularForm UpperHalfPlane
noncomputable section
variable {d : ℕ}

def order (d : ℕ) : Fin (primes d).length ≃ P d :=
  Equiv.ofBijective (primes d).get ⟨(Finset.sort_nodup _ _).injective_get,fun i =>
    List.mem_iff_get.mp (by simp [primes] : i∈primes d)⟩

def addCoord (i : P d) (v : ZMod i.val × ZMod i.val) : ℤ×ℤ :=
  ((((d/i.val)*v.1.val:ℕ):ℤ),(((d/i.val)*v.2.val:ℕ):ℤ))
def admissible (i : P d) (s : ℤ×ℤ) : Prop := (i.val:ℤ)∣s.1 ∧ (i.val:ℤ)∣s.2

lemma stable (i j : P d) (ne : i≠j) (s : ℤ×ℤ) (v : ZMod j.val × ZMod j.val) (hs : admissible i s) :
    admissible i (s+addCoord j v) := by
  have hi := Nat.prime_of_mem_primeFactors i.property
  have hj := Nat.prime_of_mem_primeFactors j.property
  have hc : i.val.Coprime j.val := (Nat.coprime_primes hi hj).mpr (fun h => ne (Subtype.ext h))
  have H : i.val ∣ d/j.val := Nat.dvd_div_of_mul_dvd (hc.symm.mul_dvd_of_dvd_of_dvd
    (Nat.dvd_of_mem_primeFactors j.property) (Nat.dvd_of_mem_primeFactors i.property))
  exact ⟨dvd_add hs.1 (by dsimp [addCoord]; exact_mod_cast dvd_mul_of_dvd_left H v.1.val),
    dvd_add hs.2 (by dsimp [addCoord]; exact_mod_cast dvd_mul_of_dvd_left H v.2.val)⟩

theorem assemble_average (m : P d→ℤ) (F : (ℤ×ℤ)→ℍ→ℂ)
    (w : (i : P d)→ZMod i.val × ZMod i.val→ℂ)
    (H : ∀ i s,admissible i s → (∑ u : Option (ZMod i.val), F s ∣[(2:ℤ)] localRep (m i) u)=
      ∑ v : ZMod i.val × ZMod i.val,w i v • F (s+addCoord i v)) :
    (∑ u : Choices d,F 0 ∣[(2:ℤ)] lift m u)=
      ∑ v : Packet d,(∏ i,w i (v i)) • F (∑ i,addCoord i (v i)) := by
  classical
  let E := order d
  let C := Equiv.piCongrLeft' (fun i : P d => Option (ZMod i.val)) E.symm
  let V := Equiv.piCongrLeft' (fun i : P d => ZMod i.val × ZMod i.val) E.symm
  let g (i : Fin (primes d).length) := fun u : Option (ZMod (E i).val) => localRep (m (E i)) u
  have word_eq (u : Choices d) : word g (C u)=lift m u := by
    unfold word lift
    change (List.ofFn (fun i : Fin (primes d).length => localRep (m ((primes d).get i)) (u ((primes d).get i)))).prod=_
    exact congrArg List.prod (List.ofFn_getElem_eq_map (primes d) (fun i => localRep (m i) (u i)))
  have HH := average g (fun i => addCoord (E i)) (fun i => w (E i))
    (fun i => admissible (E i)) F (fun i => H (E i))
    (fun i j hij => stable (E i) (E j) (E.injective.ne hij)) 0 (fun i => ⟨dvd_zero _,dvd_zero _⟩)
  calc
    _ = ∑ u : Choices d,F 0 ∣[(2:ℤ)] word g (C u) := by simp only [word_eq]
    _ = _ := C.sum_comp (fun u => F 0 ∣[(2:ℤ)] word g u)
    _ = _ := HH
    _ = ∑ v : Packet d,(∏ i,w (E i) ((V v) i)) • F (0+∑ i,addCoord (E i) ((V v) i)) :=
      (V.sum_comp (fun x => (∏ i,w (E i) (x i)) • F (0+∑ i,addCoord (E i) (x i)))).symm
    _ = _ := by
      apply sum_congr rfl; intro v _
      change (∏ i,w (E i) (v (E i))) • F (0+∑ i,addCoord (E i) (v (E i)))=_
      rw [zero_add,E.prod_comp (fun i => w i (v i)),E.sum_comp (fun i => addCoord i (v i))]

end
end TunnellPrimeTrace
#print axioms TunnellPrimeTrace.assemble_average
