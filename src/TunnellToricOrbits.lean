import TunnellHurwitzEmbeddings
import TunnellTestVector
import TunnellQuaternionOrbit

/-! The twelve effective conjugations of the Hurwitz units and a fundamental domain. -/

namespace TunnellToric
open TunnellShell TunnellHurwitz TunnellHurwitzFour Finset Quaternion

def cyc (k : Fin 3) (v : Triple) : Triple := ![v,rot v,rot (rot v)] k
def signs (s : Fin 4) (v : Triple) : Triple :=
  ![v, (v.1,-v.2.1,-v.2.2),(-v.1,v.2.1,-v.2.2),(-v.1,-v.2.1,v.2.2)] s
def move (k : Fin 3) (s : Fin 4) (v : Triple) : Triple := signs s (cyc k v)
def basis (i : Fin 3) : Triple := ![(1,0,0),(0,1,0),(0,0,1)] i

def act (q : Q) (v : Triple) : Q := q*pure v*star q

def lin (v : Triple) (a b c : Q) : Q := (v.1:ℚ) • a+(v.2.1:ℚ) • b+(v.2.2:ℚ) • c

lemma pure_lin (v : Triple) : pure v=lin v (pure (basis 0)) (pure (basis 1)) (pure (basis 2)) := by
  apply QuaternionAlgebra.ext
  · change 0=(v.1:ℚ)*0+v.2.1*0+v.2.2*0; ring
  · change (v.1:ℚ)=(v.1:ℚ)*1+v.2.1*0+v.2.2*0; ring
  · change (v.2.1:ℚ)=(v.1:ℚ)*0+v.2.1*1+v.2.2*0; ring
  · change (v.2.2:ℚ)=(v.1:ℚ)*0+v.2.1*0+v.2.2*1; ring

lemma move_lin (k : Fin 3) (s : Fin 4) (v : Triple) :
    pure (move k s v)=lin v (pure (move k s (basis 0))) (pure (move k s (basis 1))) (pure (move k s (basis 2))) := by
  unfold lin
  apply QuaternionAlgebra.ext
  all_goals
    simp only [Quaternion.re_add,Quaternion.imI_add,Quaternion.imJ_add,Quaternion.imK_add,
      Quaternion.re_smul,Quaternion.imI_smul,Quaternion.imJ_smul,Quaternion.imK_smul]
    fin_cases k <;> fin_cases s <;> simp [TunnellHurwitz.pure,move,cyc,rot,signs,basis]

lemma act_lin (q : Q) (v : Triple) :
    act q v=lin v (act q (basis 0)) (act q (basis 1)) (act q (basis 2)) := by
  unfold act
  rw [pure_lin v]
  simp only [lin,mul_add,add_mul,Algebra.mul_smul_comm,smul_mul_assoc]

local instance : DecidableEq Q := (Quaternion.equivProd ℚ).decidableEq

noncomputable def integralUnits : Finset (H ℤ) := (Icc (-2:ℤ) 2 ×ˢ (Icc (-2:ℤ) 2 ×ˢ (Icc (-2:ℤ) 2 ×ˢ Icc (-2:ℤ) 2))).filter fun u => nr u = 1

def twice (u : H ℤ) : Quaternion ℤ := ⟨2*u.1+u.2.2.2,2*u.2.1+u.2.2.2,2*u.2.2.1+u.2.2.2,u.2.2.2⟩

def rot4 (u : H ℤ) (v : Triple) : Triple := TunnellQuaternion.rotate (twice u) v

lemma rot4_eq (u : H ℤ) (v : Triple) : pure (rot4 u v)=(4:ℚ) • act (hamZ u) v := by
  obtain ⟨a,b,c,d⟩ := u
  obtain ⟨x,y,z⟩ := v
  unfold rot4 twice
  rw [TunnellQuaternion.rotate_apply]
  apply QuaternionAlgebra.ext
  all_goals
    simp only [Quaternion.re_smul,Quaternion.imI_smul,Quaternion.imJ_smul,Quaternion.imK_smul,
      act,Quaternion.re_mul,Quaternion.imI_mul,Quaternion.imJ_mul,Quaternion.imK_mul,
      Quaternion.re_star,Quaternion.imI_star,Quaternion.imJ_star,Quaternion.imK_star]
    dsimp [TunnellHurwitz.pure,hamZ,ham]
    push_cast
    ring

lemma pure_four (v : Triple) : pure ((4:ℤ) • v)=(4:ℚ) • pure v := by
  apply QuaternionAlgebra.ext <;> simp only [Quaternion.re_smul,Quaternion.imI_smul,Quaternion.imJ_smul,Quaternion.imK_smul] <;> simp [TunnellHurwitz.pure]

def agrees (u : H ℤ) (k : Fin 3) (s : Fin 4) : Prop := ∀ i : Fin 3, rot4 u (basis i) = (4:ℤ) • move k s (basis i)
instance (u k s) : Decidable (agrees u k s) := by unfold agrees; infer_instance

set_option maxRecDepth 10000 in
set_option maxHeartbeats 2000000 in
lemma rotations_table : (∀ u ∈ integralUnits, ∃ (k:Fin 3) (s:Fin 4), agrees u k s) ∧
    (∀ (k:Fin 3) (s:Fin 4), ∃ u ∈ integralUnits, agrees u k s) := by
  decide

lemma agrees_all {u k s} (h : agrees u k s) (v : Triple) : act (hamZ u) v = pure (move k s v) := by
  have hi (i : Fin 3) : act (hamZ u) (basis i)=pure (move k s (basis i)) := by
    have he := congrArg TunnellHurwitz.pure (h i)
    rw [rot4_eq,pure_four] at he
    exact (smul_right_injective Q (by norm_num : (4:ℚ)≠0)) he
  rw [act_lin,move_lin,hi 0,hi 1,hi 2]

lemma mem_units (u : H ℤ) : u∈integralUnits ↔ nr u=1 := by
  exact ⟨fun h => (mem_filter.mp h).2,fun h => mem_filter.mpr ⟨norm_one_mem u h,h⟩⟩

lemma norm_ham (u : H ℤ) : Quaternion.normSq (hamZ u)=((nr u:ℤ):ℚ) := by simp [hamZ,ham_norm,nr]

lemma conjugate_iff (v w : Triple) :
    (∃ q∈order, Quaternion.normSq q=1 ∧ act q v=pure w) ↔ ∃ k s, move k s v=w := by
  constructor
  · rintro ⟨_,⟨u,rfl⟩,hn,hq⟩
    rw [norm_ham] at hn
    obtain ⟨k,s,h⟩ := rotations_table.1 u ((mem_units u).mpr (by exact_mod_cast hn))
    exact ⟨k,s,pure_injective ((agrees_all h v).symm.trans hq)⟩
  · rintro ⟨k,s,rfl⟩
    obtain ⟨u,hu,h⟩ := rotations_table.2 k s
    exact ⟨hamZ u,⟨u,rfl⟩,by rw [norm_ham,(mem_units u).mp hu]; simp,agrees_all h v⟩

end TunnellToric
