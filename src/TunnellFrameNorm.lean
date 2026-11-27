import TunnellClassThetaExpansion

/-! A quaternion taking an intertwiner lattice to a quadratic ideal has reduced norm equal to the ideal norm. -/
namespace TunnellFrameNorm
open TunnellIdealHNF TunnellHurwitz TunnellToricClass TunnellShell TunnellEmbeddedIdeals TunnellToricLocal
open TunnellIdealThetaExpansion
noncomputable section

lemma norm_embed {n : ℕ} {v : Triple} (hv : v∈shell n) (x : R n) :
    Quaternion.normSq (embed n v hv x)=(x.norm:ℚ) := by
  have H := TunnellShell.mem_shell.mp hv
  have h : (v.1:ℚ)^2+v.2.1^2+v.2.2^2=(n:ℚ) := by exact_mod_cast H
  rw [Quaternion.normSq_def']
  change (x.re:ℚ)^2+((x.im:ℚ)*v.1)^2+((x.im:ℚ)*v.2.1)^2+((x.im:ℚ)*v.2.2)^2=((x.re*x.re- -(n:ℤ)*x.im*x.im:ℤ):ℚ)
  push_cast
  linear_combination (x.im:ℚ)^2*h

lemma ideal_norm_gcd {n : ℕ} (hn : Squarefree n) (h2 : n%4=2) {I : Ideal (R n)} (hI : I≠⊥)
    (g : ℤ) (h : ∀ x∈I, g∣Zsqrtd.norm x) : g∣(normI I:ℤ) := by
  obtain ⟨s,rfl⟩ := normal_form (by omega) hI
  obtain ⟨C,hC⟩ := s.divides
  obtain ⟨A,B,D,e⟩ := primitive_coeffs hn h2 s hC
  let N : ℤ := (s.c:ℤ)^2*s.a
  let u : R n := ⟨s.c*s.a,0⟩
  let t : R n := ⟨s.c*s.b,s.c⟩
  have hu : u∈ideal s := real_basis s
  have ht : t∈ideal s := lift_basis s
  have h₁ : u.norm=N*s.a := by dsimp [u,N,Zsqrtd.norm]; ring
  have h₂ : t.norm=N*C := by dsimp [t,N,Zsqrtd.norm]; linear_combination (s.c:ℤ)^2*hC
  have h₃ : (u+t).norm-u.norm-t.norm=N*(2*s.b) := by dsimp [t,u,N,Zsqrtd.norm]; ring
  have ha := h u hu
  have hc := h t ht
  have hb := dvd_sub (dvd_sub (h _ ((ideal s).add_mem hu ht)) ha) hc
  rw [h₁] at ha; rw [h₂] at hc; rw [h₃] at hb
  obtain ⟨a,ha⟩ := ha; obtain ⟨b,hb⟩ := hb; obtain ⟨c,hc⟩ := hc
  refine ⟨a*A+b*B+c*D,?_⟩
  rw [normI,quotient_card]; push_cast
  change N=_
  linear_combination -N*e+A*ha+B*hb+D*hc

theorem frame_norm {n : ℕ} (hn : Squarefree n) (h2 : n%4=2) {v w : Triple} (hv : v∈shell n) (hw : w∈shell n)
    {I : Ideal (R n)} (hI : I≠⊥) {a : Q} (ha : a∈J w v) (e : image hv I=line a*J v w) :
    Quaternion.normSq a=(normI I:ℚ) := by
  obtain ⟨g,hg⟩ := norm_int ha.1
  have hgN : (g:ℤ)∣(normI I:ℤ) := by
    apply ideal_norm_gcd hn h2 hI
    intro x hx
    have hm : embed n v hv x∈line a*J v w := e ▸ ⟨x,hx,rfl⟩
    obtain ⟨q,hq,eq⟩ := Submodule.mem_span_singleton_mul.mp hm
    obtain ⟨k,hk⟩ := norm_int (show q∈J v w from hq).1
    have E := congrArg Quaternion.normSq eq
    rw [map_mul,hg,hk,norm_embed hv] at E
    exact ⟨k,by exact_mod_cast E.symm⟩
  have hNg : (normI I:ℤ)∣(g:ℤ) := by
    let S : Ideal ℤ := (Ideal.span {(normI I:ℤ)}).colon {(g:ℤ)}
    have hle : Ideal.span (norms v w)≤S := by
      apply Ideal.span_le.mpr
      rintro k ⟨q,hq,hk⟩
      obtain ⟨x,hx,eq⟩ := (mem_image hv).mp (e.symm ▸ Submodule.mem_span_singleton_mul.mpr ⟨q,hq,rfl⟩ : a*q∈image hv I)
      have E := congrArg Quaternion.normSq eq
      rw [norm_embed,map_mul,hg,hk] at E
      have hZ : x.norm=(g:ℤ)*k := by exact_mod_cast E
      have H := norm_valence hn h2 hI (⟨x,hx⟩:I)
      change x.norm.toNat=_ at H
      have hcast : x.norm=((valence (⟨x,hx⟩:I):ℕ):ℤ)*normI I := by
        rw [←Int.toNat_of_nonneg (Zsqrtd.norm_nonneg (by omega) x)]
        exact_mod_cast H
      apply Submodule.mem_colon_singleton.mpr
      apply Ideal.mem_span_singleton.mpr
      exact ⟨_,(mul_comm _ _).trans (hZ.symm.trans (hcast.trans (mul_comm _ _)))⟩
    rw [norm_ideal_top hn h2 v w hv hw] at hle
    have H : (1:ℤ)∈S := hle (Submodule.mem_top)
    have H' := Ideal.mem_span_singleton.mp (Submodule.mem_colon_singleton.mp H)
    simpa using H'
  rw [hg]
  exact_mod_cast Nat.dvd_antisymm (Int.natCast_dvd_natCast.mp hgN) (Int.natCast_dvd_natCast.mp hNg)

end
end TunnellFrameNorm
#print axioms TunnellFrameNorm.frame_norm
