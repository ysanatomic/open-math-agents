import TunnellSwitchComponents

/-! The odd ramified choices survive in the quaternary lattices with dyadic level four. -/
namespace TunnellFilteredGlue
open TunnellShell TunnellHurwitz TunnellToricClass TunnellToricLocal TunnellEmbeddedIdeals TunnellRamifiedClasses
open TunnellIdealHNF TunnellPairComponents TunnellCMGluing TunnellRamifiedSwitch TunnellSwitchComponents
noncomputable section

def binary (v : Triple) : Lattice := J v v ⊔ line 2*J v (-v)
def filt (d : ℕ) (v : Triple) (D : Lattice) : Lattice :=
  D ⊓ (binary v).comap ((AddMonoidHom.mulLeft (d:Q)).toIntLinearMap)
lemma mem_filt (d : ℕ) (v : Triple) (D : Lattice) (x : Q) :
    x∈filt d v D ↔ x∈D ∧ (d:Q)*x∈binary v := Iff.rfl

lemma stable {n a : ℕ} (hn : Squarefree n) (h2 : n%4=2) {v : Triple} (hv : v∈shell n) :
    J v v*glue hv a*J v v=glue hv a := by
  let I := image hv (ram n a)
  let U := line (a:Q)⁻¹
  have he : I*J v v=I := by rw [←image_order hn h2 hv,←image_mul,Ideal.mul_top]
  have he' : J v v*I=I := by rw [←image_order hn h2 hv,←image_mul,Ideal.top_mul]
  have hc : J v v*U=U*J v v := ideals_comm hn hv (fun _ h => mem_C.mpr h.2) (invscalar_C a)
  change J v v*(U*(I*O*I))*J v v=_
  calc _=U*((J v v*I)*O*(I*J v v)) := by rw [←mul_assoc (J v v),hc]; simp only [mul_assoc]
       _=_ := by rw [he,he']; rfl

lemma eight_mem {d a : ℕ} (hn : Squarefree (2*d)) (h2 : (2*d)%4=2) {v : Triple} (hv : v∈shell (2*d))
    (ha : 0<a) (had : a∣2*d) {x : Q} (hx : x∈glue hv a) : (8:Q)*x∈filt d v (glue hv a) := by
  obtain ⟨l,hl,r,hr,e⟩ := integral_projectors hv (stable hn h2 hv).le hx
  have hc := fixed_components hn h2 hv ha had
  rw [hc.1] at hl; rw [hc.2] at hr
  have el : 2*l∈J v v := by simpa only [zsmul_eq_mul,Int.cast_ofNat] using (J v v).smul_mem (2:ℤ) hl
  have er : 2*r∈line 2*J v (-v) := Submodule.mem_span_singleton_mul.mpr ⟨r,hr,rfl⟩
  have e' : (d:Q)*(8*x)=2*l+2*r := by
    calc _=2*(((2*(2*d):ℕ):Q)*x) := by push_cast; noncomm_ring
         _=_ := by rw [e,mul_add]
  rw [mem_filt]; constructor
  · simpa only [zsmul_eq_mul,Int.cast_ofNat] using (glue hv a).smul_mem (8:ℤ) hx
  · rw [e']; exact Submodule.add_mem_sup el er

lemma contains_scalar {n a : ℕ} {v : Triple} (hv : v∈shell n) (ha : a≠0) {x : Q} (hx : x∈O) : (a:Q)*x∈glue hv a := by
  have h : (a:Q)∈image hv (ram n a) := ⟨a,(show principal (a:TunnellIdealHNF.R n) ≤ ram n a from le_sup_left)
    (Ideal.mem_span_singleton_self _),map_natCast (embed n v hv) a⟩
  apply Submodule.mem_span_singleton_mul.mpr
  refine ⟨_,Submodule.mul_mem_mul (Submodule.mul_mem_mul h hx) h,?_⟩
  rw [←mul_assoc,←mul_assoc,inv_mul_cancel₀ (nat_nonzero ha),one_mul,Nat.cast_comm a]

lemma recover {d a b : ℕ} (hn : Squarefree (2*d)) (h2 : (2*d)%4=2) {v : Triple} (hv : v∈shell (2*d))
    (ha : 0<a) (hb : 0<b) (had : a∣2*d) (hab : Odd (a*b))
    (h : filt d v (glue hv a) ≤ filt d v (glue hv b)) : glue hv a ≤ glue hv b := by
  obtain ⟨u,w,eh⟩ := ((Nat.coprime_two_right.mpr hab).pow_right 3 : Nat.Coprime (a*b) 8).isCoprime
  intro x hx
  have h8 := (h (eight_mem hn h2 hv ha had hx)).1
  have h₁ := contains_scalar hv hb.ne' (clear_denom hv ha.ne' hx)
  have e : (u:ℤ)*(a*b)+w*8=1 := by exact_mod_cast eh
  have e' := congrArg (fun k:ℤ => (k:Q)) e
  push_cast at e'
  have eQ : x=(u:Q)*((b:Q)*((a:Q)*x))+(w:Q)*(8*x) := by
    calc x=(((u:Q)*(a*b)+w*8)*x) := by rw [e',one_mul]
         _=_ := by rw [Nat.cast_comm a (b:Q)]; noncomm_ring
  rw [eQ]
  exact (glue hv b).add_mem (by simpa only [zsmul_eq_mul] using (glue hv b).smul_mem u h₁)
    (by simpa only [zsmul_eq_mul] using (glue hv b).smul_mem w h8)

theorem injective {d : ℕ} (hs : Squarefree d) (hn : Squarefree (2*d)) (hd : Odd d) (h2 : (2*d)%4=2)
    {v : Triple} (hv : v∈shell (2*d)) : Function.Injective (fun a : ↥d.divisors => filt d v (glue hv a.val)) := by
  intro a b e
  obtain ⟨ha,h0⟩ := Nat.mem_divisors.mp a.property
  obtain ⟨hb,_⟩ := Nat.mem_divisors.mp b.property
  have ha0 := Nat.pos_of_dvd_of_pos ha (Nat.pos_of_ne_zero h0)
  have hb0 := Nat.pos_of_dvd_of_pos hb (Nat.pos_of_ne_zero h0)
  have hO {k : ℕ} (hk : k∣d) : Odd k := Nat.not_even_iff_odd.mp fun hh => (Nat.not_even_iff_odd.mpr hd) (even_iff_two_dvd.mpr ((even_iff_two_dvd.mp hh).trans hk))
  apply TunnellRamifiedSwitch.injective hs hn hd hv
  exact le_antisymm (recover hn h2 hv ha0 hb0 (ha.trans (dvd_mul_left ..)) ((hO ha).mul (hO hb)) e.le)
    (recover hn h2 hv hb0 ha0 (hb.trans (dvd_mul_left ..)) ((hO hb).mul (hO ha)) e.ge)

end
end TunnellFilteredGlue
#print axioms TunnellFilteredGlue.injective

