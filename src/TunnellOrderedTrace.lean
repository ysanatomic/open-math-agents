import Mathlib.NumberTheory.ModularForms.SlashActions
import Mathlib.Data.Fin.Tuple.Finset

/-! Composition of independent local slash traces in a fixed order. -/
namespace TunnellOrderedTrace
open MatrixGroups ModularGroup ModularForm Finset
open scoped ModularForm UpperHalfPlane
noncomputable section

def word {n : ℕ} {C : Fin n→Type*} (g : (i : Fin n)→C i→SL(2,ℤ)) (j : ∀ i,C i) :=
  (List.ofFn (fun i => g i (j i))).prod

lemma word_cons {n : ℕ} {C : Fin (n+1)→Type*} (g : (i : Fin (n+1))→C i→SL(2,ℤ))
    (j : C 0) (t : ∀ i : Fin n,C i.succ) :
    word g (Fin.cons j t)=g 0 j*word (fun i => g i.succ) t := by
  simp [word,List.ofFn_succ]

lemma sum_cons {n : ℕ} (C : Fin (n+1)→Type*) [∀ i,Fintype (C i)] {E : Type*} [AddCommMonoid E]
    (f : (∀ i,C i)→E) : ∑ i, f i=∑ x : C 0, ∑ t : ∀ i : Fin n,C i.succ,f (Fin.cons x t) := by
  rw [←(Fin.consEquiv C).sum_comp f,Fintype.sum_prod_type]
  rfl

variable {G : Type*} [AddCommMonoid G]
theorem average {n : ℕ} {C V : Fin n→Type*} [∀ i,Fintype (C i)] [∀ i,Fintype (V i)]
    (g : (i : Fin n)→C i→SL(2,ℤ)) (offset : (i : Fin n)→V i→G) (weight : (i : Fin n)→V i→ℂ)
    (ok : Fin n→G→Prop) (F : G→ℍ→ℂ)
    (step : ∀ i s,ok i s → (∑ j : C i,(F s) ∣[(2:ℤ)] (g i j)) =
      ∑ v : V i, weight i v • F (s+offset i v))
    (stable : ∀ i j, i≠j → ∀ s v,ok i s → ok i (s+offset j v))
    (s : G) (hs : ∀ i, ok i s) :
    (∑ j : ∀ i,C i,(F s) ∣[(2:ℤ)] (word g j)) =
      ∑ v : ∀ i,V i,(∏ i,weight i (v i)) • F (s+∑ i,offset i (v i)) := by
  classical
  induction n generalizing s with
  | zero =>
    simp [word]
  | succ n ih =>
    let gt (i : Fin n) := g i.succ
    have H (v : V 0) :
        (∑ j : ∀ i : Fin n,C i.succ,(F (s+offset 0 v)) ∣[(2:ℤ)] (word gt j))=
          ∑ w : ∀ i : Fin n,V i.succ,(∏ i : Fin n,weight i.succ (w i)) •
            F ((s+offset 0 v)+∑ i : Fin n,offset i.succ (w i)) :=
      ih gt (fun i => offset i.succ) (fun i => weight i.succ) (fun i => ok i.succ)
        (fun i => step i.succ) (fun i j ne => stable i.succ j.succ (by simpa))
        _ (fun i => stable i.succ 0 (Fin.succ_ne_zero i) s v (hs i.succ))
    rw [sum_cons C,sum_cons V]
    simp only [word_cons,SlashAction.slash_mul,Fin.prod_univ_succ,Fin.sum_univ_succ,Fin.cons_zero,Fin.cons_succ]
    rw [sum_comm]
    have at0 (j : ∀ i : Fin n,C i.succ) :
        (∑ h : C 0, ((F s) ∣[(2:ℤ)] g 0 h) ∣[(2:ℤ)] word gt j) =
        ∑ v : V 0, weight 0 v • ((F (s+offset 0 v)) ∣[(2:ℤ)] word gt j) := by
      rw [←SlashAction.sum_slash,step 0 s (hs 0),SlashAction.sum_slash]
      simp only [SL_smul_slash]
    calc
      _ = ∑ j : ∀ i : Fin n,C i.succ, ∑ v : V 0,
            weight 0 v • ((F (s+offset 0 v)) ∣[(2:ℤ)] word gt j) :=
        sum_congr rfl (fun j _ => at0 j)
      _ = _ := ?_
    rw [sum_comm]
    apply sum_congr rfl
    intro v _
    rw [←Finset.smul_sum,H]
    simp only [Finset.smul_sum,smul_smul,add_assoc]

end
end TunnellOrderedTrace
#print axioms TunnellOrderedTrace.average
