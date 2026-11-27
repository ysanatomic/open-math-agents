import TunnellHurwitzEmbeddings

/-! Optimal embeddings of ℤ[√−n] into the Hurwitz order for n squarefree and 2 modulo 4. -/

namespace TunnellHurwitz
open Quaternion TunnellShell TunnellHurwitzFour

lemma primitive {n : ℕ} (hs : Squarefree n) {v : Triple} (hv : v∈shell n) :
    ∃ a b c : ℤ, v.1*a+v.2.1*b+v.2.2*c=1 := by
  obtain ⟨x,y,z⟩ := v
  let g := Int.gcd x y
  let h := Int.gcd (g:ℤ) z
  have hg (u : ℤ) (hu : (g:ℤ) ∣ u) : (h:ℤ) ∣ u := (Int.gcd_dvd_left (g:ℤ) z).trans hu
  obtain ⟨a,ha⟩ := hg x (Int.gcd_dvd_left x y)
  obtain ⟨b,hb⟩ := hg y (Int.gcd_dvd_right x y)
  obtain ⟨c,hc⟩ := Int.gcd_dvd_right (g:ℤ) z
  have hn := mem_shell.mp hv
  change x^2+y^2+z^2=(n:ℤ) at hn
  have hdiv : (h:ℤ)*(h:ℤ) ∣ n := by
    refine ⟨a^2+b^2+c^2,?_⟩
    rw [←hn,ha,hb,hc]; ring
  have hd : h*h ∣ n := by exact_mod_cast hdiv
  have h1 := Nat.isUnit_iff.mp (hs h hd)
  let u := Int.gcdA (g:ℤ) z
  let w := Int.gcdB (g:ℤ) z
  refine ⟨Int.gcdA x y*u,Int.gcdB x y*u,w,?_⟩
  have hg' := Int.gcd_eq_gcd_ab x y
  have hh := Int.gcd_eq_gcd_ab (g:ℤ) z
  change (g:ℤ)=_ at hg'
  change (h:ℤ)=g*u+z*w at hh
  dsimp only
  rw [h1] at hh
  norm_cast at hh
  linear_combination -hh - u*hg'

def evalRat (v : Triple) (a b : ℚ) : Q := ⟨a,b*v.1,b*v.2.1,b*v.2.2⟩

lemma eval_norm {n : ℕ} {v : Triple} (hv : v∈shell n) (a b : ℚ) :
    normSq (evalRat v a b)=a^2+n*b^2 := by
  have h := mem_shell.mp hv
  change v.1^2+v.2.1^2+v.2.2^2=(n:ℤ) at h
  have hh : (v.1:ℚ)^2+(v.2.1:ℚ)^2+(v.2.2:ℚ)^2=n := by exact_mod_cast h
  rw [normSq_def']; dsimp [evalRat]; linear_combination b^2*hh

lemma doubled_coords {q : Q} (hq : q∈order) :
    ∃ A B C D : ℤ, (A:ℚ)=2*q.re ∧ (B:ℚ)=2*q.imI ∧ (C:ℚ)=2*q.imJ ∧ (D:ℚ)=2*q.imK := by
  obtain ⟨⟨a,b,c,d⟩,rfl⟩ := hq
  refine ⟨2*a+d,2*b+d,2*c+d,d,?_⟩
  refine ⟨?_,?_,?_,?_⟩ <;> dsimp [hamZ,ham] <;> push_cast <;> ring

lemma optimal {n : ℕ} (hs : Squarefree n) (h2 : n%4=2) {v : Triple} (hv : v∈shell n) (a b : ℚ) :
    evalRat v a b∈order ↔ (∃ x : ℤ, a=x) ∧ (∃ y : ℤ, b=y) := by
  constructor
  · intro h
    obtain ⟨i,j,k,hi⟩ := primitive hs hv
    obtain ⟨A,B,C,D,hA,hB,hC,hD⟩ := doubled_coords h
    dsimp only [evalRat] at hA hB hC hD
    let E := i*B+j*C+k*D
    have hE : (E:ℚ)=2*b := by
      have hi' : (v.1:ℚ)*i+(v.2.1:ℚ)*j+(v.2.2:ℚ)*k=1 := by exact_mod_cast hi
      dsimp [E]; push_cast
      linear_combination (i:ℚ)*hB+(j:ℚ)*hC+(k:ℚ)*hD+2*b*hi'
    obtain ⟨N,hN⟩ := norm_int h
    rw [eval_norm hv] at hN
    have eqn : A^2+(n:ℤ)*E^2=4*(N:ℤ) := by
      have ee : (A:ℚ)^2+(n:ℚ)*(E:ℚ)^2=4*N := by
        rw [hA,hE]; linear_combination 4*hN
      exact_mod_cast ee
    have chk : ∀ x y : ZMod 4, x^2+2*y^2=0 → x.val%2=0 ∧ y.val%2=0 := by decide
    have hn : (n:ZMod 4)=2 := by apply ZMod.val_injective 4; rw [ZMod.val_natCast,h2]; decide
    have heq := congrArg (fun u:ℤ => (u:ZMod 4)) eqn
    push_cast at heq
    rw [hn] at heq
    have hh := chk (A:ZMod 4) (E:ZMod 4) (by simpa only [show (4:ZMod 4)=0 by decide,zero_mul] using heq)
    have hAv := ZMod.val_intCast (n:=4) A
    have hEv := ZMod.val_intCast (n:=4) E
    have ha : (A/2:ℤ)*2=A := by omega
    have hb : (E/2:ℤ)*2=E := by omega
    refine ⟨⟨A/2,?_⟩,⟨E/2,?_⟩⟩
    · have h' : ((A/2:ℤ):ℚ)*2=A := by exact_mod_cast ha
      linarith
    · have h' : ((E/2:ℤ):ℚ)*2=E := by exact_mod_cast hb
      linarith
  · rintro ⟨⟨a,rfl⟩,⟨b,rfl⟩⟩
    exact embed_integral n v hv ⟨a,b⟩

lemma centralizer {n : ℕ} (hs : Squarefree n) {v : Triple} (hv : v∈shell n) (q : Q)
    (h : q*pure v=pure v*q) : ∃ b : ℚ, q=evalRat v q.re b := by
  obtain ⟨i,j,k,hi⟩ := primitive hs hv
  have hi' : (v.1:ℚ)*i+(v.2.1:ℚ)*j+(v.2.2:ℚ)*k=1 := by exact_mod_cast hi
  have e₁ := congrArg QuaternionAlgebra.imI h
  have e₂ := congrArg QuaternionAlgebra.imJ h
  have e₃ := congrArg QuaternionAlgebra.imK h
  rw [Quaternion.imI_mul,Quaternion.imI_mul] at e₁
  rw [Quaternion.imJ_mul,Quaternion.imJ_mul] at e₂
  rw [Quaternion.imK_mul,Quaternion.imK_mul] at e₃
  dsimp [pure] at e₁ e₂ e₃
  refine ⟨i*q.imI+j*q.imJ+k*q.imK,?_⟩
  apply QuaternionAlgebra.ext
  · rfl
  · dsimp [evalRat]; linear_combination -q.imI*hi'+(j:ℚ)/2*e₃-(k:ℚ)/2*e₂
  · dsimp [evalRat]; linear_combination -q.imJ*hi'-(i:ℚ)/2*e₃+(k:ℚ)/2*e₁
  · dsimp [evalRat]; linear_combination -q.imK*hi'+(i:ℚ)/2*e₂-(j:ℚ)/2*e₁

lemma integral_centralizer {n : ℕ} (hs : Squarefree n) (h2 : n%4=2) {v : Triple}
    (hv : v∈shell n) {q : Q} (hq : q∈order) (h : q*pure v=pure v*q) :
    ∃ z, q=embed n v hv z := by
  obtain ⟨b,hb⟩ := centralizer hs hv q h
  have hl : evalRat v q.re b ∈ order := hb ▸ hq
  obtain ⟨⟨x,hx⟩,⟨y,hy⟩⟩ := (optimal hs h2 hv q.re b).mp hl
  refine ⟨⟨x,y⟩,?_⟩
  calc q = evalRat v q.re b := hb
       _ = _ := by rw [hx,hy]; rfl

#print axioms integral_centralizer

end TunnellHurwitz
