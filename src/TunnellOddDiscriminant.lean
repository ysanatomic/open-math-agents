import TunnellReferenceGenus
import TunnellRamifiedPlane

/-! The discriminant form of a pair of quadratic ideal lattices at an odd ramified prime. -/
namespace TunnellOddDiscriminant
open TunnellIdealHNF TunnellIdealGenerators TunnellGenusCharacter TunnellIdealThetaExpansion
noncomputable section
variable {n p : ℕ} [Fact p.Prime]
local notation "F" => ZMod p
local notation "χ" => quadraticChar F

def quad {K : Type*} [CommRing K] (A B C : K) (x : K×K) := A*x.1^2+2*B*x.1*x.2+C*x.2^2
def pairing {K : Type*} [CommRing K] (A B C : K) (x : K×K) := (A*x.1+B*x.2,B*x.1+C*x.2)
lemma radical {A B C : F} (ha : A≠0) (h : A*C-B^2=0) (x : F×F) :
    pairing A B C x=0 ↔ ∃ r:F, x=(-B*r,A*r) := by
  constructor
  · intro e; have e₁ := congrArg Prod.fst e
    change A*x.1+B*x.2=0 at e₁
    refine ⟨x.2/A,Prod.ext ?_ ?_⟩
    · dsimp only; field_simp; linear_combination e₁
    · dsimp only; field_simp
  · rintro ⟨r,rfl⟩; apply Prod.ext <;> dsimp [pairing]
    · ring
    · linear_combination r*h

lemma radical_value {K : Type*} [CommRing K] (A B C r : K) :
    quad A B C (-B*r,A*r)=A*(A*C-B^2)*r^2 := by dsimp [quad]; ring

lemma val_bas (s : Data n) (C : ℤ) (e : (s.b:ℤ)^2+n=s.a*C) :
    (∃ x:ideal s,valence x=s.a) ∧ ∃ x:ideal s,(valence x:ℤ)=C := by
  have hN : normI (ideal s)=s.c^2*s.a := quotient_card _
  have hN0 := mul_pos (pow_pos s.pos_c 2) s.pos_a
  let u : ideal s := ⟨_,real_basis s⟩
  let w : ideal s := ⟨_,lift_basis s⟩
  have e₁ : u.val.norm=(s.a*(s.c^2*s.a):ℕ) := by
    change (s.c:ℤ)*s.a*(s.c*s.a)- -(n:ℤ)*0*0=_; push_cast; ring
  have e₂ : w.val.norm=C*((s.c^2*s.a:ℕ):ℤ) := by
    change (s.c:ℤ)*s.b*(s.c*s.b)- -(n:ℤ)*s.c*s.c=_; push_cast; linear_combination (s.c:ℤ)^2*e
  have hc : 0≤C := by
    have H : (0:ℤ) ≤ (s.a:ℤ)*C := e ▸ add_nonneg (sq_nonneg _) (Nat.cast_nonneg _)
    exact nonneg_of_mul_nonneg_right H (by exact_mod_cast s.pos_a)
  refine ⟨⟨u,?_⟩,⟨w,?_⟩⟩
  · change u.val.norm.toNat/normI (ideal s)=_; rw [e₁,Int.toNat_natCast,hN,Nat.mul_div_cancel _ hN0]
  · change ((w.val.norm.toNat/normI (ideal s):ℕ):ℤ)=_
    rw [e₂,Int.toNat_mul hc,Int.toNat_natCast,hN,Nat.mul_div_cancel _ hN0,Int.toNat_of_nonneg hc] <;> positivity

lemma coefficient {I : Ideal (R n)} (hn : Squarefree n) (h2 : n%4=2) (hp : p∣n) (hp2 : p≠2) (hI : I≠⊥) :
    ∃ A B C : ℤ, A*C-B^2=n ∧ (A:F)≠0 ∧ charI (p:=p) hn h2 hI=χ (A:F) ∧
      (∃ (s : Data n), I=ideal s ∧ B=s.b ∧ (A=s.a ∨ C=s.a)) := by
  obtain ⟨s,rfl⟩ := normal_form (by omega) hI
  obtain ⟨c,hc⟩ := s.divides
  obtain ⟨⟨x,hx⟩,⟨y,hy⟩⟩ := val_bas s c hc
  by_cases ha : (s.a:F)=0
  · have hb : (s.b:F)=0 := by
      have he := congrArg (fun u:ℤ => (u:F)) hc
      push_cast at he; rw [ha,(ZMod.natCast_eq_zero_iff _ _).mpr hp] at he; simpa using he
    have hu : (c:F)≠0 := by
      obtain ⟨r,t,u,e⟩ := primitive_coeffs hn h2 s hc
      intro ec; have ez := congrArg (fun z:ℤ => (z:F)) e; push_cast at ez
      simp [ha,hb,ec] at ez
    have ef : (valence y:F)=c := by exact_mod_cast congrArg (fun k:ℤ => (k:F)) hy
    refine ⟨c,s.b,s.a,by linear_combination -hc,hu,?_,s,rfl,rfl,Or.inr rfl⟩
    exact (charI_eq hn h2 hp hI y (ef ▸ hu)).trans (congrArg _ ef)
  · refine ⟨s.a,s.b,c,by linear_combination -hc,by exact_mod_cast ha,?_,s,rfl,rfl,Or.inl rfl⟩
    simpa only [hx,Int.cast_natCast] using charI_eq hn h2 hp hI x (hx ▸ ha)

lemma quotient_nonzero (hn : Squarefree n) (hp : p∣n) : ((n/p:ℕ):F)≠0 := by
  intro e; have he := (ZMod.natCast_eq_zero_iff _ _).mp e
  have hh : p*p∣n := by
    have hmul := Nat.mul_dvd_mul_left p he
    rwa [Nat.mul_div_cancel' hp] at hmul
  exact (Fact.out:p.Prime).ne_one (Nat.isUnit_iff.mp (hn p hh))

theorem plane_parameter (hn : Squarefree n) (hp : p∣n) (hp2 : p≠2) {A D : F} (ha : A≠0) (hd : D≠0) :
    let a := ((n/p:ℕ):F)*A
    let t := -(4:F)*D/A
    a≠0 ∧ t≠0 ∧ χ t=χ (-1)*χ D*χ A ∧
    ∀ v:F×F, TunnellRamifiedPlane.form a t v=((n/p:ℕ):F)*(A*v.1^2+4*D*v.2^2) := by
  have h₂ : (2:F)≠0 := by
    intro e; exact hp2 ((Nat.prime_dvd_prime_iff_eq (Fact.out:p.Prime) Nat.prime_two).mp ((ZMod.natCast_eq_zero_iff 2 p).mp e))
  have h₄ : (4:F)≠0 := by simpa only [show (4:F)=2^2 by norm_num] using pow_ne_zero 2 h₂
  refine ⟨mul_ne_zero (quotient_nonzero hn hp) ha,div_ne_zero (mul_ne_zero (neg_ne_zero.mpr h₄) hd) ha,?_,?_⟩
  · change χ (-4*D/A)=_
    rw [div_eq_mul_inv,show -(4:F)=(-1)*2^2 by ring,map_mul,map_mul,map_mul,quadraticChar_sq_one' h₂,mul_one]
    have hinv : χ A⁻¹=χ A := by
      have h := quadraticChar_sq_one ha
      have e : χ A*χ A⁻¹=1 := by rw [←map_mul,mul_inv_cancel₀ ha,map_one]
      have hc : χ A ≠ 0 := fun h₀ => ha (quadraticChar_eq_zero_iff.mp h₀)
      apply mul_left_cancel₀ hc
      rw [e,←pow_two,h]
    rw [hinv]
  · intro v; dsimp only [TunnellRamifiedPlane.form]; field_simp; ring

end
end TunnellOddDiscriminant
#print axioms TunnellOddDiscriminant.coefficient
#print axioms TunnellOddDiscriminant.plane_parameter
