import TunnellFilteredGlue

/-! Transport of ramified overlattices by a pair of invertible quadratic ideals. -/
namespace TunnellIdealGluings
open TunnellShell TunnellHurwitz TunnellToricClass TunnellToricLocal TunnellEmbeddedIdeals TunnellRamifiedClasses
open TunnellIdealHNF TunnellPairComponents TunnellCMGluing TunnellRamifiedSwitch TunnellSwitchComponents TunnellFilteredGlue
noncomputable section

def bimod (v : Triple) (D : Lattice) := J v v*D*J v v=D
lemma bimod_iff {v : Triple} {D : Lattice} : bimod v D ↔ J v v*D*J v v≤D := by
  refine ⟨fun h => h.le,fun h => le_antisymm h ?_⟩
  have hR : 1≤J v v := Submodule.one_le.mpr (one_J v)
  calc D=1*D*1 := by rw [one_mul,mul_one]
       _≤_ := mul_le_mul' (mul_le_mul_left hR D) hR

lemma bimod_inf {v : Triple} {D E : Lattice} (hd : bimod v D) (he : bimod v E) : bimod v (D ⊓ E) := by
  apply bimod_iff.mpr; apply le_inf
  · exact (mul_le_mul_left (mul_le_mul_right inf_le_left _) _).trans hd.le
  · exact (mul_le_mul_left (mul_le_mul_right inf_le_right _) _).trans he.le

lemma bimod_sup {v : Triple} {D E : Lattice} (hd : bimod v D) (he : bimod v E) : bimod v (D ⊔ E) := by
  change _=_; rw [Submodule.mul_sup,Submodule.sup_mul,hd,he]

lemma bimod_scalar {v : Triple} {D : Lattice} (hd : bimod v D) (u : Q) (hu : ∀ q:Q,u*q=q*u) : bimod v (line u*D) := by
  unfold bimod
  rw [←mul_assoc,←line_central u hu (J v v)]
  simpa only [mul_assoc] using congrArg (line u*·) hd

lemma cutoff {d : ℕ} (hd : d≠0) (v : Triple) (D : Lattice) :
    filt d v D=D ⊓ line (d:Q)⁻¹*binary v := by
  ext x; rw [mem_filt,Submodule.mem_inf,Submodule.mem_span_singleton_mul]
  apply and_congr_right; intro _
  constructor
  · intro h; exact ⟨(d:Q)*x,h,by rw [←mul_assoc,inv_mul_cancel₀ (nat_nonzero hd),one_mul]⟩
  · rintro ⟨y,hy,rfl⟩; rw [←mul_assoc,mul_inv_cancel₀ (nat_nonzero hd),one_mul]; exact hy

lemma binary_stable {n : ℕ} (hn : Squarefree n) (h2 : n%4=2) {v : Triple} (hv : v∈shell n) :
    bimod v (binary v) := by
  have hr : bimod v (J v v) := by unfold bimod; rw [J_comp hn h2 hv hv,J_comp hn h2 hv hv]
  have he : J v v*J v (-v)=J v (-v) := by rw [←J_opposite,J_comp hn h2 (shell_neg hv) hv,J_opposite]
  have hs : bimod v (J v (-v)) := by unfold bimod; rw [he,J_comp hn h2 hv hv]
  exact bimod_sup hr (bimod_scalar hs 2 (fun q => by noncomm_ring))

lemma filt_stable {d : ℕ} (hn : Squarefree (2*d)) (h2 : (2*d)%4=2) {v : Triple} (hv : v∈shell (2*d)) {D : Lattice} (hD : bimod v D) :
    bimod v (filt d v D) := by
  rw [cutoff (by omega)]
  exact bimod_inf hD (bimod_scalar (binary_stable hn h2 hv) _ (fun q => (show Commute (d:Q) q from Nat.cast_comm d q).inv_left₀))

def sandwich {n : ℕ} {v : Triple} (hv : v∈shell n) (A B : Ideal (TunnellIdealHNF.R n)) (D : Lattice) :=
  image hv A*D*image hv B

lemma cancel {n : ℕ} (hn : Squarefree n) (h2 : n%4=2) {v : Triple} (hv : v∈shell n) {A B : Ideal (TunnellIdealHNF.R n)}
    (hA : A≠⊥) (hB : B≠⊥) {D E : Lattice} (hD : bimod v D) (hE : bimod v E)
    (eq : sandwich hv A B D=sandwich hv A B E) : D=E := by
  obtain ⟨A',hA',eA⟩ := (image_isIdeal hn h2 hv A hA).2.2.2
  obtain ⟨B',_,eB⟩ := (image_isIdeal hn h2 hv B hB).2.2.2
  have eA' := (ideals_comm hn hv hA' (center_image hv A)).trans eA
  have tr (L : Lattice) : A'*sandwich hv A B L*B'=J v v*L*J v v := by
    calc _=(A'*image hv A)*L*(image hv B*B') := by simp only [sandwich,mul_assoc]
         _=_ := by rw [eA',eB]
  exact hD.symm.trans ((tr D).symm.trans ((congrArg (fun L => A'*L*B') eq).trans ((tr E).trans hE)))

theorem distinct {d : ℕ} (hs : Squarefree d) (hn : Squarefree (2*d)) (hd : Odd d) (h2 : (2*d)%4=2) {v : Triple} (hv : v∈shell (2*d))
    {A B : Ideal (TunnellIdealHNF.R (2*d))} (hA : A≠⊥) (hB : B≠⊥) :
    Function.Injective (fun a : ↥d.divisors => sandwich hv A B (filt d v (glue hv a.val))) := by
  intro a b he
  apply TunnellFilteredGlue.injective hs hn hd h2 hv
  exact cancel hn h2 hv hA hB (filt_stable hn h2 hv (stable hn h2 hv)) (filt_stable hn h2 hv (stable hn h2 hv)) he

theorem base_change {n : ℕ} {v : Triple} (hv : v∈shell n) (a : ℕ) (A B : Ideal (TunnellIdealHNF.R n)) :
    sandwich hv A B (glue hv a)=line (a:Q)⁻¹*sandwich hv (A*ram n a) (ram n a*B) O := by
  have hc (q : Q) : (a:Q)⁻¹*q=q*(a:Q)⁻¹ := (show Commute (a:Q) q from Nat.cast_comm a q).inv_left₀
  unfold sandwich glue; rw [image_mul,image_mul]
  rw [←mul_assoc (image hv A),←line_central _ hc (image hv A)]
  simp only [mul_assoc]

lemma O_extends {n : ℕ} (hn : Squarefree n) (h2 : n%4=2) {v s : Triple} (hv : v∈shell n) (hs : s∈shell n) :
    O*J v s=O := by
  have hle : (1:Lattice)≤J s v*J v s := by rw [J_comp hn h2 hv hs]; exact Submodule.one_le.mpr (one_J _)
  have hle' : (1:Lattice)≤O*J v s := hle.trans (mul_le_mul_left (show J s v≤O from fun _ h => h.1) _)
  apply le_antisymm ((mul_le_mul_right (show J v s≤O from fun _ h => h.1) _).trans mul_O.le)
  calc O=O*1 := (mul_one _).symm
       _≤O*(O*J v s) := mul_le_mul_right hle' _
       _=_ := by rw [←mul_assoc,mul_O]

theorem framed {n : ℕ} (hn : Squarefree n) (h2 : n%4=2) {v s t : Triple} (hv : v∈shell n) (hs : s∈shell n) (ht : t∈shell n)
    {A B : Ideal (TunnellIdealHNF.R n)} {a b : Q} (eB : image hv B=line b*J v t) (eA : image hv A=line a*J v s) :
    sandwich hv B (conjugate A) O=line b*O*line (star a) := by
  unfold sandwich; rw [eB,conj_frame hv eA,mul_assoc (line b) (J v t),J_extends hn h2 hv ht]
  calc _=line b*(O*J s v)*line (star a) := by simp only [mul_assoc]
       _=_ := by rw [O_extends hn h2 hs hv]

end
end TunnellIdealGluings
#print axioms TunnellIdealGluings.distinct
#print axioms TunnellIdealGluings.framed

