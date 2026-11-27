import TunnellQuaternionModel
import TunnellQuaternionOrbit

/-! Eight integral quaternions represent each projective line at an odd prime. -/

namespace TunnellQuaternion

open Finset Quaternion

variable {p : ℕ} [Fact p.Prime] (M : Model p)

lemma unique_class {q : QInt} (hq : normSq q=p) : ∃! l, inLine l (residue M q) := by
  apply line_unique _ (norm_prime_nonzero M hq)
  rw [residue_det,hq]
  simp

noncomputable def classOf (q : QInt) : Option (ZMod p) :=
  if h : normSq q = p then (unique_class M h).exists.choose else none

lemma class_eq_iff {q : QInt} (hq : normSq q=p) (l : Option (ZMod p)) :
    classOf M q=l ↔ inLine l (residue M q) := by
  rw [classOf,dif_pos hq]
  have h := (unique_class M hq).exists.choose_spec
  constructor
  · rintro rfl
    exact h
  · exact fun h' => (unique_class M hq).unique h h'

lemma quatShell_one_card : (quatShell 1).card = 8 := by decide

lemma fiber_class_card (hp : p≠2) (l : Option (ZMod p)) :
    ((quatShell p).filter (fun q => classOf M q = l)).card = 8 := by
  classical
  obtain ⟨q,hq,hl⟩ := exists_at_line M hp l
  rw [←quatShell_one_card]
  symm
  apply card_nbij (fun u => q*u)
  · intro u hu
    have hu' := mem_quatShell.mp hu
    have hqu : normSq (q*u)=p := by rw [map_mul,hq,hu']; simp
    refine mem_filter.mpr ⟨mem_quatShell.mpr hqu,(class_eq_iff M hqu l).mpr ?_⟩
    rw [map_mul]
    exact line_mul hl _
  · intro u hu v hv h
    apply scalar_cancel (p:ℤ) (by exact_mod_cast (Fact.out:p.Prime).ne_zero)
    have he := congrArg (star q * ·) h
    simpa only [←mul_assoc,star_mul_self,hq,coe_mul_eq_smul] using he
  · intro w hw
    obtain ⟨hn,he⟩ := mem_filter.mp hw
    have hn' := mem_quatShell.mp hn
    obtain ⟨u,hu,hw⟩ := (same_line_iff M hq hn' hl).mp ((class_eq_iff M hn' l).mp he)
    exact ⟨u,mem_quatShell.mpr hu,hw.symm⟩

lemma card_class_mem (hp : p≠2) (L : Finset (Option (ZMod p))) :
    ((quatShell p).filter (fun q => classOf M q ∈ L)).card = 8*L.card := by
  classical
  have h := Finset.sum_fiberwise_eq_sum_filter (quatShell p) L (classOf M) (fun _ => (1:ℕ))
  simp only [sum_const,nsmul_eq_mul,mul_one] at h
  simpa [fiber_class_card M hp,mul_comm] using h.symm

end TunnellQuaternion
