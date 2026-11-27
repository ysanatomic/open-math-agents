import TunnellClassGauss

/-! The physically normalized analytic Eisenstein family and its full-class theta value. -/
namespace TunnellRankinEisenstein
open Complex TunnellCMRegularized TunnellRankin TunnellShell TunnellRankinCotangent TunnellClassThetaMellin TunnellFullClassTheta
open UpperHalfPlane hiding I

noncomputable section

def eisenstein {N k : ℕ} [NeZero N] [NeZero k] (χ : DirichletCharacter ℂ N) (z : ℍ) (s : ℂ) :=
    (z.im:ℂ)^(s-1) * kernel s (N:ℂ) * regular N k χ z s

lemma eisenstein_analytic {N k : ℕ} [NeZero N] [NeZero k] (χ : DirichletCharacter ℂ N) (z : ℍ) :
    AnalyticOnNhd ℂ (eisenstein (k:=k) χ z) domain := by
  intro s hs
  apply AnalyticAt.mul _ (regular_analytic N k χ z s hs)
  apply AnalyticAt.mul _ ((kernel_differentiable _).analyticAt _)
  have hp : (z.im:ℂ)≠0 := by exact_mod_cast z.im_pos.ne'
  apply Differentiable.analyticAt (f:=fun s : ℂ => (z.im:ℂ)^(s-1))
  exact (differentiable_id.sub_const 1).const_cpow (.inl hp)

/-- The eigen-Eisenstein series specializes to the *full* class theta, with the
same constant of proportionality for its zero and nonzero Fourier coefficients. -/
theorem eisenstein_one {d k : ℕ} [NeZero k] {b : Triple} (hs : Squarefree (2*d)) (hd : d%4=1)
    (hb : b∈shell (2*d)) (z : ℍ) :
    haveI : NeZero (4*(2*d)) := ⟨by omega⟩
    eisenstein (k:=k) (negCharacter d (by omega)) z 1=
      (2*Real.pi/(v d:ℂ))*full hs (by omega) hb (multiple ⟨k,NeZero.pos k⟩ z) := by
  letI : NeZero (4*(2*d)) := ⟨by omega⟩
  have hc := class_number hs (by omega) hb hd
  have hg := gauss_value hs (by omega) hb hd
  have hv := v_pos (show 0<d by omega)
  have hV : (v d:ℂ)≠0 := by exact_mod_cast hv.ne'
  have hv2 : (v d:ℂ)^2 = ((4*(2*d):ℕ):ℂ) := by exact_mod_cast v_sq d
  letI := classFintype hs (by omega) hb
  rw [eisenstein,sub_self,Complex.cpow_zero,one_mul,kernel_one,regular_central hd hs.of_mul_right,
    full_expansion hs (by omega) hb]
  change _=2*Real.pi/(v d:ℂ)*((Fintype.card _:ℂ)+_)
  simp only [map_inv₀,map_natCast,hg,← Nat.card_eq_fintype_card,←hv2]
  change _=2*Real.pi/(v d:ℂ)*(hclass (b:=b)+_)
  change (v d:ℂ)*((negCharacter d (by omega)).LFunction 1)=Real.pi*hclass (b:=b) at hc
  have hp : (Real.pi:ℂ)≠0 := by exact_mod_cast Real.pi_ne_zero
  rw [show hclass (b:=b)=(v d:ℂ)*(negCharacter d (by omega)).LFunction 1/Real.pi from (eq_div_iff hp).mpr (by simpa [mul_comm] using hc.symm)]
  simp only [map_pow,Complex.conj_ofReal]
  field_simp [hV,hp]
  ring_nf
  rw [Complex.I_sq]
  ring
end
end TunnellRankinEisenstein
#print axioms TunnellRankinEisenstein.eisenstein_one
