import TunnellRamifiedSwitch

/-! Normalized ramified-ideal twists preserve both quadratic component lattices. -/
namespace TunnellSwitchComponents
open TunnellShell TunnellHurwitz TunnellToricClass TunnellToricLocal TunnellEmbeddedIdeals TunnellRamifiedClasses
open TunnellIdealHNF TunnellPairComponents TunnellCMGluing TunnellRamifiedSwitch TunnellIdealGenerators
noncomputable section
local notation "ι" => TunnellHurwitz.pure

def ramData {n a : ℕ} (ha : 0<a) (h : a∣n) : Data n :=
  ⟨1,a,0,by decide,ha,ha,by simpa using (show (a:ℤ)∣n by exact_mod_cast h)⟩

lemma ram_as_hnf {n a : ℕ} (ha : 0<a) (h : a∣n) : ram n a=ideal (ramData ha h) := by
  simpa [ramData,principal] using (hnf_eq (ramData ha h) rfl).symm

lemma ram_conj {n a : ℕ} (ha : 0<a) (h : a∣n) : conjugate (ram n a)=ram n a := by
  rw [ram_as_hnf ha h]; ext z; change star z∈ideal (ramData ha h) ↔ _
  simp [mem_ideal,ramData]

lemma ram_norm {n a : ℕ} (ha : 0<a) (h : a∣n) : normI (ram n a)=a := by
  rw [ram_as_hnf ha h]; simpa [normI,ramData] using quotient_card (ramData ha h)

lemma ram_square {n a : ℕ} (hn : Squarefree n) (h2 : n%4=2) (ha : 0<a) (h : a∣n) :
    ram n a*ram n a=principal (a:TunnellIdealHNF.R n) := by
  simpa only [ram_conj ha h,ram_norm ha h] using norm_conjugate hn h2 (ram n a) (ram_ne_bot n a)

lemma line_central (u : Q) (hu : ∀ x:Q, u*x=x*u) (L : Lattice) : line u*L=L*line u := by
  ext q; rw [Submodule.mem_span_singleton_mul,Submodule.mem_mul_span_singleton]
  exact exists_congr fun x => and_congr_right fun _ => by rw [hu x]

lemma scalar_inf (u : Q) (hu : u≠0) (D W : Lattice) (h₁ : line u*W≤W) (h₂ : line u⁻¹*W≤W) :
    line u*D ⊓ W=line u*(D ⊓ W) := by
  ext q; simp only [Submodule.mem_inf,Submodule.mem_span_singleton_mul]
  constructor
  · rintro ⟨⟨x,hx,rfl⟩,hW⟩
    refine ⟨x,⟨hx,?_⟩,rfl⟩
    have h := h₂ (Submodule.mem_span_singleton_mul.mpr ⟨u*x,hW,rfl⟩)
    simpa only [←mul_assoc,inv_mul_cancel₀ hu,one_mul] using h
  · rintro ⟨x,⟨hx,hW⟩,rfl⟩
    exact ⟨⟨x,hx,rfl⟩,h₁ (Submodule.mem_span_singleton_mul.mpr ⟨x,hW,rfl⟩)⟩

lemma scalar_C {v : Triple} (a : ℕ) : line (a:Q)≤C v := Submodule.span_le.mpr (Set.singleton_subset_iff.mpr (mem_C.mpr (Nat.cast_comm a _).symm))
lemma invscalar_C {v : Triple} (a : ℕ) : line (a:Q)⁻¹≤C v := Submodule.span_le.mpr (Set.singleton_subset_iff.mpr
    (mem_C.mpr (show Commute (ι v) (a:Q) from (Nat.cast_comm a _).symm).inv_right₀))

lemma anti_ideal (J : Lattice) {n : ℕ} {v : Triple} (hv : v∈shell n) (hJ : J≤anti v) (I : Ideal (TunnellIdealHNF.R n)) :
    J*image hv I=image hv (conjugate I)*J := by
  have e (x : Q) (hx : x∈J) := anti_scalar hv (mem_anti.mp (hJ hx)) I
  apply le_antisymm
  · apply Submodule.mul_le.mpr
    intro x hx y hy
    have he : x*y∈line x*image hv I := Submodule.mem_span_singleton_mul.mpr ⟨y,hy,rfl⟩
    rw [e x hx] at he
    exact mul_le_mul_right (Submodule.span_le.mpr (Set.singleton_subset_iff.mpr hx)) _ he
  · apply Submodule.mul_le.mpr
    intro y hy x hx
    have he : y*x∈image hv (conjugate I)*line x := Submodule.mem_mul_span_singleton.mpr ⟨y,hy,rfl⟩
    rw [←e x hx] at he
    exact mul_le_mul_left (Submodule.span_le.mpr (Set.singleton_subset_iff.mpr hx)) _ he

theorem fixed_components {n a : ℕ} (hn : Squarefree n) (h2 : n%4=2) {v : Triple} (hv : v∈shell n)
    (ha : 0<a) (hd : a∣n) :
    glue hv a ⊓ C v=J v v ∧ glue hv a ⊓ anti v=J v (-v) := by
  let I := image hv (ram n a)
  let U := line (a:Q)⁻¹
  have hu := nat_nonzero ha.ne'
  have hU : U≤C v := invscalar_C _
  have hI : I≤C v := center_image hv _
  have hII : I*I=line (a:Q)*J v v := by
    change image hv _*image hv _=_
    rw [←image_mul,ram_square hn h2 ha hd,principal,image_principal hn h2 hv,map_natCast]
  have hU₁ : U*line (a:Q)=1 := two_sided_inverse hu
  have hRI : I*J v v=I := by rw [←image_order hn h2 hv,←image_mul,Ideal.mul_top]
  let K := U*I
  have hK : K≤C v := (mul_le_mul' hU hI).trans (mul_C v)
  have hKI : K*I=J v v := by change U*I*I=_; rw [mul_assoc,hII,←mul_assoc,hU₁,one_mul]
  have hIK := (ideals_comm hn hv hI hK).trans hKI
  obtain ⟨e₁,e₂⟩ := inter_components hI hK hI hK hIK hKI hIK hKI hRI
  have s₁ := scalar_inf (a:Q)⁻¹ (inv_ne_zero hu) (I*O*I) (C v)
    ((mul_le_mul_left hU _).trans (mul_C v)) (by rw [inv_inv]; exact (mul_le_mul_left (scalar_C a) _).trans (mul_C v))
  have s₂ := scalar_inf (a:Q)⁻¹ (inv_ne_zero hu) (I*O*I) (anti v)
    ((mul_le_mul_left hU _).trans (C_anti v)) (by rw [inv_inv]; exact (mul_le_mul_left (scalar_C a) _).trans (C_anti v))
  change U*(I*O*I) ⊓ C v=_ ∧ U*(I*O*I) ⊓ anti v=_
  rw [s₁,s₂,e₁,e₂]
  have hanti : J v (-v)≤anti v := by rw [←anti_order]; exact inf_le_right
  have hcomm : J v (-v)*I=I*J v (-v) := by simpa only [ram_conj ha hd] using anti_ideal (J v (-v)) hv hanti (ram n a)
  have hR : J v v*J v (-v)=J v (-v) := by rw [←J_opposite,J_comp hn h2 (shell_neg hv) hv,J_opposite]
  constructor
  · exact (mul_assoc ..).symm.trans hKI
  · change U*(I*J v (-v)*I)=_
    rw [mul_assoc I,hcomm,←mul_assoc I,←mul_assoc U,←mul_assoc U,hKI,hR]

end
end TunnellSwitchComponents
#print axioms TunnellSwitchComponents.fixed_components

