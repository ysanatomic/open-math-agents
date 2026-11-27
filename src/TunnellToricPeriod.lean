import TunnellToricOrbits

/-! Signed sums over representatives for optimal embeddings modulo the norm-one Hurwitz units. -/

namespace TunnellToric

open TunnellShell TunnellHurwitz Finset
open scoped Classical

def isRep (v : Triple) : Prop := Odd v.1 ∧ Odd v.2.1 ∧ Even v.2.2 ∧ 0<v.1 ∧ 0<v.2.1

noncomputable def representatives (n : ℕ) : Finset Triple := (shell n).filter isRep

def test (v : Triple) : ℤ := if v.2.2%8=0 then 1 else if v.2.2%8=4 then -1 else 0

lemma parity_type {n : ℕ} (hn : n%4=2) {v : Triple} (hv : v∈shell n) :
    (Odd v.1 ∧ Odd v.2.1 ∧ Even v.2.2) ∨ (Odd v.2.1 ∧ Odd v.2.2 ∧ Even v.1) ∨
    (Odd v.2.2 ∧ Odd v.1 ∧ Even v.2.1) := by
  have small : ∀ a b c : ZMod 4, a^2+b^2+c^2=2 →
      (a.val%2=1 ∧ b.val%2=1 ∧ c.val%2=0) ∨ (b.val%2=1 ∧ c.val%2=1 ∧ a.val%2=0) ∨
        (c.val%2=1 ∧ a.val%2=1 ∧ b.val%2=0) := by decide
  have hn' : (n:ZMod 4)=2 := by apply ZMod.val_injective 4; rw [ZMod.val_natCast,hn]; decide
  have he := congrArg (fun t:ℤ => (t:ZMod 4)) (mem_shell.mp hv)
  simp only [normSq,Int.cast_add,Int.cast_pow,Int.cast_natCast,hn'] at he
  have hh := small _ _ _ he
  have ha := ZMod.val_intCast (n:=4) v.1
  have hb := ZMod.val_intCast (n:=4) v.2.1
  have hc := ZMod.val_intCast (n:=4) v.2.2
  simp only [Int.odd_iff,Int.even_iff]
  omega

lemma sign_section {v : Triple} (h : Odd v.1 ∧ Odd v.2.1 ∧ Even v.2.2) : ∃ s, isRep (signs s v) := by
  obtain ⟨a,b,c⟩ := v
  change Odd a ∧ Odd b ∧ Even c at h
  have ha := Int.odd_iff.mp h.1
  have hb := Int.odd_iff.mp h.2.1
  by_cases hA : 0<a <;> by_cases hB : 0<b
  · exact ⟨0,by simpa [isRep,signs] using And.intro h.1 ⟨h.2.1,h.2.2,hA,hB⟩⟩
  · exact ⟨1,by simp [isRep,signs,h.1,h.2.1,h.2.2,hA]; omega⟩
  · exact ⟨2,by simp [isRep,signs,h.1,h.2.1,h.2.2,hB]; omega⟩
  · exact ⟨3,by simp [isRep,signs,h.1,h.2.1,h.2.2]; omega⟩

lemma exists_rep {n : ℕ} (hn : n%4=2) {v : Triple} (hv : v∈shell n) :
    ∃ k s, isRep (move k s v) := by
  rcases parity_type hn hv with h|h|h
  · exact ⟨0,sign_section h⟩
  · exact ⟨1,sign_section h⟩
  · exact ⟨2,sign_section h⟩

lemma represents_once {v : Triple} (hv : isRep v) (k : Fin 3) (s : Fin 4) :
    isRep (move k s v) ↔ k=0 ∧ s=0 := by
  rcases v with ⟨a,b,c⟩
  obtain ⟨ha,hb,hc,hp,hq⟩ := hv
  dsimp only at ha hb hc hp hq
  have hca : ¬Odd c := Int.not_odd_iff_even.mpr hc
  fin_cases k <;> fin_cases s <;> simp [isRep,move,cyc,signs,rot,ha,hb,hc,hp,hq,hca] <;> omega

lemma move_shell (k : Fin 3) (s : Fin 4) {n : ℕ} {v : Triple} (hv : v∈shell n) : move k s v∈shell n := by
  rw [mem_shell] at hv ⊢
  obtain ⟨a,b,c⟩ := v
  fin_cases k <;> fin_cases s <;> simp [normSq,move,cyc,signs,rot] at * <;> linarith

lemma rep_unique {n : ℕ} {v w : Triple} (hv : v∈representatives n) (hw : w∈representatives n)
    (he : ∃ q∈order, Quaternion.normSq q=1 ∧ act q v=pure w) : v=w := by
  obtain ⟨k,s,h⟩ := (conjugate_iff v w).mp he
  have hm : isRep (move k s v) := h ▸ (mem_filter.mp hw).2
  obtain ⟨rfl,rfl⟩ := (represents_once (mem_filter.mp hv).2 k s).mp hm
  exact h

lemma rep_exists {n : ℕ} (hn : n%4=2) {v : Triple} (hv : v∈shell n) :
    ∃ w∈representatives n, ∃ q∈order, Quaternion.normSq q=1 ∧ act q v=pure w := by
  obtain ⟨k,s,he⟩ := exists_rep hn hv
  exact ⟨move k s v,mem_filter.mpr ⟨move_shell k s hv,he⟩,
    (conjugate_iff v _).mpr ⟨k,s,rfl⟩⟩

noncomputable def oddSlice (n : ℕ) : Finset Triple := (shell n).filter (fun v => Odd v.1 ∧ Odd v.2.1 ∧ Even v.2.2)

lemma coord_at {v : Triple} (h : Odd v.1 ∧ Odd v.2.1) : coordWeight v=test v := by
  rw [TunnellTestVector.coordinate]
  simp only [TunnellTestVector.positive,TunnellTestVector.negative,h.1,h.2,true_and,test]
  split_ifs <;> omega

lemma weighted_section (n : ℕ) :
    (∑ v ∈ shell n,coordWeight v)=4*∑ w∈representatives n, test w := by
  have h : (∑ v∈shell n, coordWeight v) = ∑ v∈oddSlice n,coordWeight v := by
    rw [oddSlice,sum_filter]
    apply sum_congr rfl
    intro v _
    split_ifs with h
    · rfl
    · apply if_neg
      intro hv
      obtain ⟨hx,hy,hz⟩ := hv
      exact h ⟨hx,hy,Int.even_iff.mpr (by omega)⟩
  rw [h]
  let K := (univ : Finset (Fin 4)) ×ˢ representatives n
  have he : (∑ t∈K,coordWeight (signs t.1 t.2)) = ∑ v∈oddSlice n,coordWeight v := by
    apply sum_nbij (fun t : Fin 4 × Triple => signs t.1 t.2)
    · rintro ⟨s,w⟩ ht
      obtain ⟨hn,hw⟩ := mem_filter.mp (mem_product.mp ht).2
      obtain ⟨hx,hy,hz,_,_⟩ := hw
      exact mem_filter.mpr ⟨move_shell 0 s hn,by fin_cases s <;> simp [signs,hx,hy,hz]⟩
    · rintro ⟨s,⟨x,y,z⟩⟩ ht ⟨s',⟨x',y',z'⟩⟩ ht' hh
      obtain ⟨_,_,_,hx,hy⟩ := (mem_filter.mp (mem_product.mp ht).2).2
      obtain ⟨_,_,_,hx',hy'⟩ := (mem_filter.mp (mem_product.mp ht').2).2
      dsimp only at hx hy hx' hy'
      fin_cases s <;> fin_cases s' <;> simp [signs,Prod.ext_iff] at hh ⊢ <;> omega
    · intro v hv
      obtain ⟨hn,h⟩ := mem_filter.mp hv
      obtain ⟨s,hs⟩ := sign_section h
      refine ⟨(s,signs s v),mem_product.mpr ⟨mem_univ _,mem_filter.mpr ⟨move_shell 0 s hn,hs⟩⟩,?_⟩
      fin_cases s <;> simp [signs]
    · exact fun _ _ => rfl
  rw [←he]
  have summand (s : Fin 4) {w : Triple} (hw : w∈representatives n) :
      coordWeight (signs s w)=test w := by
    obtain ⟨hx,hy,_,_,_⟩ := (mem_filter.mp hw).2
    rw [coord_at (by fin_cases s <;> simp [signs,hx,hy])]
    fin_cases s <;> simp [test,signs] <;> split_ifs <;> omega
  change (∑ t∈(univ : Finset (Fin 4)) ×ˢ representatives n,_) = _
  rw [sum_product]
  have ha (s : Fin 4) : (∑ w ∈ representatives n,coordWeight (signs s w))=∑ w∈representatives n,test w :=
    sum_congr rfl (fun _ hw => summand s hw)
  simp [ha]

theorem signed_embedding_sum (d : ℕ) : ∑ w ∈ representatives (2*d),test w=TunnellShell.b d := by
  have he := sum_weight_eq_twelve d
  rw [sum_weight,weighted_section] at he
  linarith

#print axioms signed_embedding_sum
end TunnellToric
