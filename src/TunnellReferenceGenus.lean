import TunnellPairComponents
import TunnellAntiGenus

/-! A fixed anti-commuting lattice accounts for the minus sign in each local quadratic plane. -/
namespace TunnellReferenceGenus
open TunnellShell TunnellHurwitz TunnellIdealHNF TunnellEmbeddedIdeals TunnellToricClass TunnellToricLocal
open TunnellClassThetaCount TunnellFrameNorm TunnellIntertwinerTheta TunnellIdealGenerators TunnellPairComponents
open TunnellProperClassGroup TunnellGenusMap TunnellGenusCharacter TunnellIdealThetaExpansion TunnellToric
noncomputable section

theorem reference {d : ℕ} (hn : Squarefree (2*d)) (hd : d%4=1) (h2 : (2*d)%4=2) {v : Triple} (hv : v∈shell (2*d)) :
    ∃ (C : Ideal (R (2*d))) (hC : C≠⊥) (a : Q), a≠0 ∧ a∈J (-v) v ∧
      image hv C=line a*J v (-v) ∧
      ∀ p : ↥d.primeFactors, letI : Fact p.val.Prime := ⟨Nat.prime_of_mem_primeFactors p.property⟩
      ((genus hn h2 hv (cls hn h2 hv hC) p:ℤˣ):ℤ)=quadraticChar (ZMod p.val) (-1) := by
  have hw := shell_neg hv
  obtain ⟨a,ha,h0,e⟩ := intertwine (-v) v hw hv
  have hA : a∈J (-v) v := ⟨ha,e⟩
  let A : IntegralIdeal v := ⟨line a*J v (-v),from_embedding hn h2 hv hw hA h0⟩
  let C := preimage hv A
  have hC : C≠⊥ := preimage_ne_bot hn h2 hv _
  have H : image hv C=line a*J v (-v) := image_preimage hn h2 hv A
  refine ⟨C,hC,a,h0,hA,H,?_⟩
  intro p
  letI : Fact p.val.Prime := ⟨Nat.prime_of_mem_primeFactors p.property⟩
  have hpd := Nat.dvd_of_mem_primeFactors p.property
  have hp2 : p.val≠2 := by intro e; rw [e] at hpd; omega
  let x := good (p:=p.val) hn h2 hC
  have hx : (valence x:ZMod p.val)≠0 := good_nonzero hn h2 hC
  have xmem : embed (2*d) v hv x.val∈line a*J v (-v) := H ▸ ⟨x.val,x.property,rfl⟩
  obtain ⟨q,hq,he⟩ := Submodule.mem_span_singleton_mul.mp xmem
  obtain ⟨q,rfl⟩ := (show q∈J v (-v) from hq).1
  have hanti := (show hamZ q∈J v (-v) from hq).2
  rw [pure_neg,neg_mul] at hanti
  have ee := congrArg Quaternion.normSq he
  rw [map_mul,norm_ham,frame_norm hn h2 hv hw hC hA H,norm_embed hv,norm_valZ hn h2 hC x] at ee
  have eZ : (normI C:ℤ)*TunnellHurwitzFour.nr q=valence x*(normI C:ℤ) := by exact_mod_cast ee
  have eq : (TunnellHurwitzFour.nr q:ℤ)=valence x := by
    rw [mul_comm (valence x:ℤ)] at eZ
    exact mul_left_cancel₀ (show (normI C:ℤ)≠0 by exact_mod_cast (normI_positive (by omega) C hC).ne') eZ
  have hq0 : ((TunnellHurwitzFour.nr q:ℤ):ZMod p.val)≠0 := by simpa only [eq,Int.cast_natCast] using hx
  rw [genus_eval,charI_eq hn h2 (hpd.trans (dvd_mul_left d 2)) hC x hx]
  simpa only [eq,Int.cast_natCast] using TunnellAntiGenus.anti_char hp2 hn (hpd.trans (dvd_mul_left d 2)) hv (neg_eq_iff_eq_neg.mp hanti) hq0

end
end TunnellReferenceGenus
#print axioms TunnellReferenceGenus.reference
