import TunnellEtaCongruence
import TunnellEisensteinAction
import TunnellEisensteinCosets

/-! The actual ℍ-integrands for unfolding, including their measures' weight-two factors. -/
namespace TunnellRankinIntegral
open Complex Matrix MatrixGroups ModularGroup CongruenceSubgroup TunnellCMRegularized
open TunnellRankin TunnellRankinEisenstein TunnellEtaValue TunnellShell
open TunnellRankinCotangent TunnellClassThetaMellin TunnellFullClassTheta
open UpperHalfPlane hiding I
open scoped ComplexConjugate
noncomputable section

lemma gamma_dvd {N L : ℕ} (h : N∣L) {g : SL(2,ℤ)} (hg : g∈Gamma0 L) : g∈Gamma0 N :=
  Gamma0_mem.mpr ((ZMod.intCast_zmod_eq_zero_iff_dvd _ _).mpr
    (dvd_trans (by exact_mod_cast h) ((ZMod.intCast_zmod_eq_zero_iff_dvd _ _).mp (Gamma0_mem.mp hg))))

lemma char_square {N : ℕ} (χ : DirichletCharacter ℂ N) (hχ : χ.IsQuadratic)
    (g : SL(2,ℤ)) (hg : g∈Gamma0 N) : χ (g 1 1:ZMod N)^2 = 1 := by
  have e := g.property
  rw [Matrix.det_fin_two] at e
  have he := congrArg (fun a : ℤ => (a:ZMod N)) e
  simp [Gamma0_mem.mp hg] at he
  have nn : χ (g 1 1:ZMod N) ≠ 0 := by
    intro hz
    have hm := congrArg χ he
    simp [map_mul,hz] at hm
  rcases hχ (g 1 1:ZMod N) with hh|hh|hh <;> simp_all

variable {d : ℕ} {b : Triple} (hsq : Squarefree (2*d)) (hd : d%4=1) (hb : b∈shell (2*d))

lemma full_action {k : ℕ} [NeZero k] (z : ℍ) (g : SL(2,ℤ)) (hg : g∈Gamma0 (4*(2*d)*k)) :
    (negCharacter d (by omega)) (g 1 1:ZMod (4*(2*d)))*
      full hsq (by omega) hb (multiple ⟨k,NeZero.pos k⟩ (g • z)) =
      denom g z*full hsq (by omega) hb (multiple ⟨k,NeZero.pos k⟩ z) := by
  letI : NeZero (4*(2*d)) := ⟨by omega⟩
  have hh := action (k:=k) (negCharacter d (by omega)) z g hg
    (show (1:ℂ)∈domain by norm_num [domain])
  dsimp only at hh
  rw [eisenstein_one hsq hd hb,eisenstein_one hsq hd hb] at hh
  have pos : 0<v d := v_pos (by omega)
  have hn : (2*Real.pi/(v d:ℂ))≠0 := div_ne_zero (mul_ne_zero two_ne_zero (by exact_mod_cast Real.pi_ne_zero)) (by exact_mod_cast pos.ne')
  apply mul_left_cancel₀ hn
  linear_combination hh

lemma full_action_one (z : ℍ) (g : SL(2,ℤ)) (hg : g∈Gamma0 (4*(2*d))) :
    full hsq (by omega) hb (g • z)=(negCharacter d (by omega)) (g 1 1:ZMod (4*(2*d)))*
      denom g z*full hsq (by omega) hb z := by
  have e := full_action hsq hd hb (k:=1) z g (by simpa using hg)
  have e1 (w : ℍ) : multiple ⟨1,by decide⟩ w=w := by ext; simp [multiple]
  rw [e1,e1] at e
  have h := char_square (negCharacter d (by omega)) (negative_quadratic _) g hg
  linear_combination (negCharacter d (by omega)) (g 1 1:ZMod (4*(2*d)))*e -
    full hsq (by omega) hb (g • z)*h

lemma height_cancel (y : ℝ) {J : ℂ} (hn : J≠0) :
    (((y/‖J‖^2:ℝ):ℂ)^2*J^2)*(conj J)^2=(y:ℂ)^2 := by
  have hh : (‖J‖:ℂ)^2=J*conj J := by
    rw [mul_conj,normSq_eq_norm_sq,ofReal_pow]
  rw [ofReal_div,ofReal_pow,hh]
  field_simp [hn]

def stripIntegrand (θ : ℍ → ℂ) (s : ℂ) (z : ℍ) : ℂ :=
  (z.im:ℂ)^2*etaValue z*conj (θ z)*conj ((z.im:ℂ)^(conj s-1))

def integrand {N k : ℕ} [NeZero N] [NeZero k] (χ : DirichletCharacter ℂ N)
    (θ : ℍ → ℂ) (s : ℂ) (z : ℍ) : ℂ :=
  (z.im:ℂ)^2*etaValue z*conj (θ z)*conj (eisenstein (k:=k) χ z (conj s))

theorem strip_row (z : ℍ) (g : Gamma0 (4*(2*d)*4)) (s : ℂ) :
    stripIntegrand (full hsq (by omega) hb) s (g.val • z) =
      stripIntegrand (full hsq (by omega) hb) s z*
        conj (rowTerm (negCharacter d (by omega)) z (conj s) (matrixRow g)) := by
  let G := g.val
  have hg32 := gamma_dvd (by exact ⟨d,by ring⟩ : 32∣4*(2*d)*4) g.property
  have hgN := gamma_dvd (dvd_mul_right _ _) g.property
  let J := denom G z
  have hn : J≠0 := denom_ne_zero _ _
  have hJ : conj J=(G 1 0:ℂ)*conj (z:ℂ)+(G 1 1:ℂ) := by
    simp [J,ModularGroup.denom_apply]
  have HH := height_kernel z.im_pos hn (conj s)
  have HC := height_cancel z.im hn
  simp only [stripIntegrand,TunnellEtaLevel.eta_level _ hg32,
    full_action_one hsq hd hb z g.val hgN,ModularGroup.im_smul_eq_div_normSq,Complex.normSq_eq_norm_sq]
  change (((z.im/‖J‖^2:ℝ):ℂ)^2*(J^2*etaValue z)*conj ((negCharacter d (by omega)) (G 1 1:ZMod (4*(2*d)))*J*full hsq (by omega) hb z))*
      conj ((((z.im/‖J‖^2:ℝ):ℂ))^(conj s-1))=_
  rw [HH]
  simp only [map_mul,rowTerm,matrixRow]
  rw [← hJ]
  linear_combination etaValue z*conj (full hsq (by omega) hb z)*
    conj ((z.im:ℂ)^(conj s-1))*conj ((negCharacter d (by omega)) (G 1 1:ZMod (4*(2*d))))*
    conj (kernel (conj s) (conj J))*HC

end
end TunnellRankinIntegral
#print axioms TunnellRankinIntegral.strip_row
