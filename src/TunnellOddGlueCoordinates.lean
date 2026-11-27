import TunnellOddDiscriminant
import TunnellRamifiedLines

/-! Integral overlattices reduce to isotropic subgroups in the explicit binary-pair discriminant form. -/
namespace TunnellOddGlueCoordinates
open TunnellOddDiscriminant
noncomputable section
variable {p : ℕ} [Fact p.Prime]
local notation "F" => ZMod p

def redPair (x : ℤ×ℤ) : F×F := (x.1,x.2)
def coord (A : ℤ) (x : ℤ×ℤ) : F := (x.2:F)/(A:F)

lemma coordinates {A B C n : ℤ} (hdet : A*C-B^2=n) (hn : (p:ℤ)∣n) (ha : (A:F)≠0) (x : ℤ×ℤ)
    (hx : pairing (A:F) B C (redPair x)=0) :
    let r := coord (p:=p) A x
    ∃ u v : ℤ, x.1= -B*(r.val:ℤ)+(p:ℤ)*u ∧ x.2=A*(r.val:ℤ)+(p:ℤ)*v := by
  have h : (A:F)*(C:F)-(B:F)^2=0 := by
    have e := congrArg (fun z:ℤ => (z:F)) hdet; push_cast at e; rw [e]; exact (ZMod.intCast_zmod_eq_zero_iff_dvd _ _).mpr hn
  obtain ⟨r,hr⟩ := (radical ha h (redPair x)).mp hx
  have he₂ := congrArg Prod.snd hr
  change (x.2:F)=A*r at he₂
  have he : coord (p:=p) A x=r := by unfold coord; rw [he₂]; field_simp
  dsimp only; rw [he]
  have e₁ : ((-B*(r.val:ℤ):ℤ):F)=x.1 := by
    push_cast; rw [ZMod.natCast_zmod_val]; exact (congrArg Prod.fst hr).symm
  have e₂ : ((A*(r.val:ℤ):ℤ):F)=x.2 := by push_cast; rw [ZMod.natCast_zmod_val]; exact he₂.symm
  obtain ⟨u,hu⟩ := (ZMod.intCast_eq_intCast_iff_dvd_sub _ _ _).mp e₁
  obtain ⟨v,hv⟩ := (ZMod.intCast_eq_intCast_iff_dvd_sub _ _ _).mp e₂
  exact ⟨u,v,by linarith,by linarith⟩

lemma residue {A B C n : ℤ} (hdet : A*C-B^2=n) (hn : (p:ℤ)∣n) (ha : (A:F)≠0) (x : ℤ×ℤ)
    (hx : pairing (A:F) B C (redPair x)=0) :
    ∃ k : ℤ, quad A B C x=A*n*((coord (p:=p) A x).val:ℤ)^2+(p:ℤ)^2*k := by
  let r := (coord (p:=p) A x).val
  obtain ⟨u,v,eu,ev⟩ := coordinates hdet hn ha x hx
  change x.1= -B*(r:ℤ)+p*u at eu
  change x.2=A*(r:ℤ)+p*v at ev
  obtain ⟨m,hm⟩ := hn
  refine ⟨quad A B C (u,v)+2*m*r*v,?_⟩
  unfold quad; rw [eu,ev]; change _=A*n*(r:ℤ)^2+_
  linear_combination (A*(r:ℤ)^2+2*(p:ℤ)*r*v)*hdet+2*(p:ℤ)*r*v*hm

lemma square_condition {A B C D E G : ℤ} {n : ℕ} (hAC : A*C-B^2=n) (hDG : D*G-E^2=n)
    (hn : Squarefree n) (hp : p∣n) (hA : (A:F)≠0) (hD : (D:F)≠0) (x y : ℤ×ℤ)
    (hx : pairing (A:F) B C (redPair x)=0) (hy : pairing (D:F) E G (redPair y)=0)
    (hQ : (p:ℤ)^2 ∣ quad A B C x+4*quad D E G y) :
    (coord (p:=p) A x)^2=(-(4:F)*D/A)*(coord (p:=p) D y)^2 := by
  obtain ⟨k,hk⟩ := residue hAC (by exact_mod_cast hp) hA x hx
  obtain ⟨l,hl⟩ := residue hDG (by exact_mod_cast hp) hD y hy
  obtain ⟨m,hm⟩ := hQ
  let r := (coord (p:=p) A x).val
  let s := (coord (p:=p) D y).val
  have en : (n:ℤ)=(p:ℤ)*(n/p:ℕ) := by exact_mod_cast (Nat.mul_div_cancel' hp).symm
  have e : ((n/p:ℕ):ℤ)*(A*(r:ℤ)^2+4*D*(s:ℤ)^2)=(p:ℤ)*(m-k-4*l) := by
    apply mul_left_cancel₀ (a:=(p:ℤ)) (by exact_mod_cast (Fact.out:p.Prime).ne_zero)
    dsimp only [r,s]; rw [hk,hl,en] at hm; linear_combination hm
  have e' := congrArg (fun z:ℤ => (z:F)) e
  simp only [Int.cast_mul,Int.cast_add,Int.cast_ofNat,Int.cast_sub,Int.cast_pow,Int.cast_natCast] at e'; rw [ZMod.natCast_self,zero_mul] at e'
  dsimp only [r,s] at e'; rw [ZMod.natCast_zmod_val,ZMod.natCast_zmod_val] at e'
  have h := (mul_eq_zero.mp e').resolve_left (quotient_nonzero hn hp)
  field_simp
  linear_combination h

lemma radical_of_values {A B C : ℤ} (a d : ℕ) (hd : d≠0) (h : p∣d) (hu : ((2*a:ℕ):F)≠0)
    (x : ℤ×ℤ) (hr : ∀ y:ℤ×ℤ, (d:ℤ)^2∣(a:ℤ)*(quad A B C (x+(d:ℤ) • y)-quad A B C x)) :
    pairing (A:F) B C (redPair x)=0 := by
  have e₁ := hr (1,0)
  have e₂ := hr (0,1)
  obtain ⟨u,eu⟩ := e₁; obtain ⟨v,ev⟩ := e₂
  change (a:ℤ)*(A*(x.1+d*1)^2+2*B*(x.1+d*1)*(x.2+d*0)+C*(x.2+d*0)^2-quad A B C x)=_ at eu
  change (a:ℤ)*(A*(x.1+d*0)^2+2*B*(x.1+d*0)*(x.2+d*1)+C*(x.2+d*1)^2-quad A B C x)=_ at ev
  have ex : (2*a:ℤ)*(A*x.1+B*x.2)=(d:ℤ)*(u-a*A) := by
    apply mul_left_cancel₀ (a:=(d:ℤ)) (by exact_mod_cast hd); unfold quad at eu; linear_combination eu
  have ey : (2*a:ℤ)*(B*x.1+C*x.2)=(d:ℤ)*(v-a*C) := by
    apply mul_left_cancel₀ (a:=(d:ℤ)) (by exact_mod_cast hd); unfold quad at ev; linear_combination ev
  have ez := (ZMod.natCast_eq_zero_iff _ _).mpr h
  have ef := congrArg (fun z:ℤ => (z:F)) ex; have eg := congrArg (fun z:ℤ => (z:F)) ey
  push_cast at hu ef eg; rw [ez,zero_mul] at ef eg
  exact Prod.ext ((mul_eq_zero.mp ef).resolve_left hu) ((mul_eq_zero.mp eg).resolve_left hu)

end
end TunnellOddGlueCoordinates
#print axioms TunnellOddGlueCoordinates.square_condition
#print axioms TunnellOddGlueCoordinates.radical_of_values

