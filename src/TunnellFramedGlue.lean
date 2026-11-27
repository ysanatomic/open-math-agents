import TunnellGlueMaximal
import TunnellBinaryPairModel

/-! Coordinates of the two quaternary lattices attached to a framed pair of quadratic ideals. -/
namespace TunnellFramedGlue
open TunnellHurwitz TunnellToricClass TunnellShell TunnellToricLocal TunnellPairComponents TunnellRamifiedSwitch
open TunnellIdealGluings TunnellSwitchComponents TunnellFilteredGlue TunnellGlueMaximal TunnellEmbeddedIdeals
open TunnellIdealHNF TunnellRamifiedClasses TunnellCMGluing
noncomputable section
variable {n : ℕ} {v : Triple} (hv : v∈shell n)
local notation "Ord" => TunnellIdealHNF.R n

lemma inf_twist (hn : Squarefree n) (h2 : n%4=2) {A B : Ideal Ord} (hA : A≠⊥) (hB : B≠⊥)
    {D E : Lattice} (hD : bimod v D) (hE : bimod v E) :
    sandwich hv A B (D ⊓ E)=sandwich hv A B D ⊓ sandwich hv A B E := by
  obtain ⟨A',hA',eA⟩ := (image_isIdeal hn h2 hv A hA).2.2.2
  obtain ⟨B',hB',eB⟩ := (image_isIdeal hn h2 hv B hB).2.2.2
  have eA' := (ideals_comm hn hv hA' (center_image hv A)).trans eA
  have eB' := (ideals_comm hn hv hB' (center_image hv B)).trans eB
  have tr (X : Lattice) (hX : bimod v X) : A'*sandwich hv A B X*B'=X := by
    calc _=(A'*image hv A)*X*(image hv B*B') := by simp only [sandwich,mul_assoc]
         _=_ := by rw [eA',eB,hX]
  let Y := sandwich hv A B D ⊓ sandwich hv A B E
  have hb : A'*Y*B'≤D ⊓ E := le_inf ((mul_le_mul_left (mul_le_mul_right inf_le_left _) _).trans_eq (tr D hD))
      ((mul_le_mul_left (mul_le_mul_right inf_le_right _) _).trans_eq (tr E hE))
  refine le_antisymm (le_inf (mul_le_mul_left (mul_le_mul_right inf_le_left _) _) (mul_le_mul_left (mul_le_mul_right inf_le_right _) _)) ?_
  have hR : 1≤J v v := Submodule.one_le.mpr (one_J v)
  calc Y=1*Y*1 := by rw [one_mul,mul_one]
       _≤J v v*Y*J v v := mul_le_mul' (mul_le_mul_left hR _) hR
       _=sandwich hv A B (A'*Y*B') := by
         calc _=(image hv A*A')*Y*(B'*image hv B) := by rw [eA,eB']
              _=_ := by simp only [sandwich,mul_assoc]
       _≤_ := mul_le_mul_left (mul_le_mul_right hb _) _

lemma scalar_twist (A B : Ideal Ord) (u : Q) (hu : ∀ q:Q,u*q=q*u) (D : Lattice) :
    sandwich hv A B (line u*D)=line u*sandwich hv A B D := by
  unfold sandwich; rw [←mul_assoc (image hv A),←line_central u hu]; simp only [mul_assoc]

lemma frame {a b : Q} {A B : Ideal Ord} {s t : Triple} (hn : Squarefree n) (h2 : n%4=2) (hs : s∈shell n)
    (eA : image hv A=line a*J v s) (eB : image hv B=line b*J v t) :
    sandwich hv B (conjugate A) (binary v)=line b*pairL s t*line (star a) := by
  have one (L : Lattice) : sandwich hv B (conjugate A) L=line b*(J v t*L*J s v)*line (star a) := by
    simp only [sandwich,eB,conj_frame hv eA,mul_assoc]
  have e₁ : J v t*J v v*J s v=J s t := by rw [J_comp hn h2 hv hv,J_comp hn h2 hs hv]
  have h₁ : J v t*J v (-v)=J (-v) t := by rw [←J_opposite,J_comp hn h2 (shell_neg hv) hv]
  have h₂ : J (-v) t*J s v=J (-s) t := by rw [←J_neg s v,J_comp hn h2 (shell_neg hs) (shell_neg hv)]
  have H (L : Lattice) : line b*(line 2*L)*line (star a)=line 2*(line b*L*line (star a)) := by
    rw [←mul_assoc (line b),←line_central (2:Q) (fun q => by noncomm_ring)]; simp only [mul_assoc]
  have hdist (D E : Lattice) : sandwich hv B (conjugate A) (D ⊔ E)=sandwich hv B (conjugate A) D ⊔ sandwich hv B (conjugate A) E := by
    unfold sandwich; rw [Submodule.mul_sup,Submodule.sup_mul]
  unfold binary pairL
  rw [hdist,scalar_twist hv _ _ (2:Q) (fun q => by noncomm_ring),one,one,e₁,h₁,h₂,Submodule.mul_sup,Submodule.sup_mul,H]

lemma ram_pass {a : ℕ} (hn : Squarefree n) (h2 : n%4=2) (ha : 0<a) (hd : a∣n) :
    image hv (ram n a)*binary v*image hv (ram n a)=line (a:Q)*binary v := by
  let I := image hv (ram n a)
  have hI := center_image hv (ram n a)
  have Rleft : J v v*I=I := by rw [←image_order hn h2 hv,←image_mul,Ideal.top_mul]
  have Rright : I*J v v=I := by rw [←image_order hn h2 hv,←image_mul,Ideal.mul_top]
  have hanti : J v (-v)≤anti v := by rw [←anti_order]; exact inf_le_right
  have hcomm : J v (-v)*I=I*J v (-v) := by simpa only [ram_conj ha hd] using anti_ideal (J v (-v)) hv hanti (ram n a)
  have ec : binary v*I=I*binary v := by
    unfold binary; rw [Submodule.sup_mul,Submodule.mul_sup,Rleft,Rright,mul_assoc,hcomm,←mul_assoc,←mul_assoc I (line 2),line_central (2:Q) (fun q => by noncomm_ring) I]
  have hII : I*I=line (a:Q)*J v v := by rw [←image_mul,ram_square hn h2 ha hd,principal,image_principal hn h2 hv,map_natCast]
  have hact : J v v*binary v=binary v := by
    have hR : 1≤J v v := Submodule.one_le.mpr (one_J v)
    have e := binary_stable hn h2 hv
    apply le_antisymm
    · calc J v v*binary v=J v v*binary v*1 := (mul_one _).symm
           _≤_ := (mul_le_mul_right hR _).trans e.le
    · simpa only [one_mul] using mul_le_mul_left hR (binary v)
  change I*binary v*I=_
  rw [mul_assoc,ec,←mul_assoc,hII,mul_assoc,hact]

lemma ram_binary {a : ℕ} (hn : Squarefree n) (h2 : n%4=2) (ha : 0<a) (hd : a∣n) (B A : Ideal Ord) :
    sandwich hv (B*ram n a) (conjugate (A*ram n a)) (binary v)=line (a:Q)*sandwich hv B (conjugate A) (binary v) := by
  have h : sandwich hv (B*ram n a) (conjugate (A*ram n a)) (binary v)=sandwich hv B (conjugate A) (image hv (ram n a)*binary v*image hv (ram n a)) := by
    rw [conjugate_mul,ram_conj ha hd,mul_comm (conjugate A)]; simp only [sandwich,image_mul,mul_assoc]
  rw [h,ram_pass hv hn h2 ha hd,scalar_twist hv _ _ _ (Nat.cast_comm a)]

lemma ram_full {a : ℕ} (ha : 0<a) (hd : a∣n) (B A : Ideal Ord) :
    sandwich hv B (conjugate A) (glue hv a)=line (a:Q)⁻¹*sandwich hv (B*ram n a) (conjugate (A*ram n a)) O := by
  rw [base_change,conjugate_mul,ram_conj ha hd,mul_comm (conjugate A)]

end
end TunnellFramedGlue
#print axioms TunnellFramedGlue.ram_binary
#print axioms TunnellFramedGlue.frame

