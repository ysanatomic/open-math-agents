import TunnellTraceCosets
import TunnellPacketOperators

/-! Explicit words in S,T whose reductions are the desired Bruhat representatives
at just one prime and the identity at all other relevant primes. -/
namespace TunnellTraceLifts
open Matrix MatrixGroups ModularGroup CongruenceSubgroup TunnellTraceCosets TunnellPacketOperators TunnellRamifiedLines
noncomputable section
variable {d : ℕ}
private instance pPrime (i : P d) : Fact i.val.Prime := ⟨Nat.prime_of_mem_primeFactors i.property⟩

def step (m j : ℤ) : SL(2,ℤ) := -(weylLift m)*T^(m*j)

lemma step_entries (m j : ℤ) : (step m j).val =
    !![1-m^2, (1-m^2)*(m*j)+m^3-2*m; m, m*(m*j)+1-m^2] := by
  change (-((T^(-m)).val*S.val*(T^(-m)).val*S.val*(T^(-m)).val))*(T^(m*j)).val=_
  rw [coe_T_zpow,coe_T_zpow]
  ext i k
  fin_cases i <;> fin_cases k <;> simp [S,Matrix.mul_apply,Fin.sum_univ_two] <;> ring

def localRep (m : ℤ) {q : ℕ} : Option (ZMod q) → SL(2,ℤ)
  | none => 1
  | some j => step m j.val

def reduction (q : ℕ) : SL(2,ℤ)→*SL(2,ZMod q) := SpecialLinearGroup.map (Int.castRingHom _)

lemma off {p q : ℕ} (m : ℤ) (hm : (m:ZMod p)=0) (j : Option (ZMod q)) :
    reduction p (localRep m j)=1 := by
  cases j with
  | none => exact map_one _
  | some j =>
    apply Subtype.ext
    change (Int.castRingHom (ZMod p)).mapMatrix (step m j.val).val=1
    rw [step_entries]
    ext a b
    fin_cases a <;> fin_cases b <;> simp [hm]

lemma supported {m : ℤ} (hm : (32:ℤ)∣m) {q : ℕ} (j : Option (ZMod q)) : localRep m j∈Gamma0 32 := by
  cases j with
  | none => exact Subgroup.one_mem _
  | some j =>
    apply Gamma0_mem.mpr
    change ((step m j.val).val 1 0:ZMod 32)=0
    rw [step_entries]
    exact (ZMod.intCast_zmod_eq_zero_iff_dvd _ _).mpr hm

lemma on {m : ℤ} (i : P d) (hm : (m:ZMod i.val)=1) (j : Option (ZMod i.val)) :
    slope (localRep m j) i=j := by
  cases j with
  | none => simp [localRep,TunnellTraceCosets.slope]
  | some j =>
    unfold localRep TunnellTraceCosets.slope
    change (if ((step m j.val).val 1 0:ZMod i.val)=0 then none else some (((step m j.val).val 1 1:ZMod i.val)/((step m j.val).val 1 0:ZMod i.val)))=_
    rw [step_entries]
    simp [hm]

lemma slope_congr (i : P d) {g h : SL(2,ℤ)} (e : reduction i.val g=reduction i.val h) :
    slope g i=slope h i := by
  have hh (j : Fin 2) := congrArg (fun k : SL(2,ZMod i.val) => k 1 j) e
  change ∀ j : Fin 2, (g 1 j:ZMod i.val)=(h 1 j:ZMod i.val) at hh
  simp [TunnellTraceCosets.slope,hh]

lemma single_prod {G I : Type*} [Monoid G] [DecidableEq I] (f : I→G) (i : I) (l : List I)
    (hd : l.Nodup) (h : ∀ j∈l,j≠i → f j=1) :
    (l.map f).prod=if i∈l then f i else 1 := by
  induction l with
  | nil => simp
  | cons a l ih =>
    have h' := ih hd.of_cons (fun j hj => h j (by simp [hj]))
    by_cases e : a=i
    · subst a; simp [h',hd.notMem]
    · simp [h',h a (by simp) e,Ne.symm e]

def primes (d : ℕ) : List (P d) := Finset.univ.sort (·≤·)

def lift (m : P d→ℤ) (r : Choices d) : SL(2,ℤ) :=
  ((primes d).map (fun i => localRep (m i) (r i))).prod

lemma lift_mem (m : P d→ℤ) (hm : ∀ i,(32:ℤ)∣m i) (r : Choices d) : lift m r∈Gamma0 32 := by
  unfold lift
  apply Subgroup.list_prod_mem
  intro g hg
  obtain ⟨i,_,rfl⟩ := List.mem_map.mp hg
  exact supported (hm i) _

lemma lift_slope (m : P d→ℤ) (one : ∀ i, (m i:ZMod i.val)=1)
    (zero : ∀ i j : P d,i≠j → (m j:ZMod i.val)=0) (r : Choices d) :
    slope (lift m r)=r := by
  funext i
  apply Eq.trans (slope_congr i (h:=localRep (m i) (r i)) ?_) (on i (one i) _)
  unfold lift
  rw [map_list_prod,List.map_map]
  change ((primes d).map (fun j => reduction i.val (localRep (m j) (r j)))).prod=_
  rw [single_prod (fun j => reduction i.val (localRep (m j) (r j))) i (primes d)
    (Finset.sort_nodup _ _) (fun j _ h => off _ (zero i j (Ne.symm h)) _)]
  simp [primes]

end
end TunnellTraceLifts
#print axioms TunnellTraceLifts.lift_slope
