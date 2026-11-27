import Mathlib

/-! Selling reduction of positive integral ternary lattices of determinant one.
The six entries are conorms for a superbase indexed by the four vertices of a tetrahedron. -/
namespace TunnellSelling
structure W where
  a : ℤ
  b : ℤ
  c : ℤ
  d : ℤ
  e : ℤ
  f : ℤ
abbrev V := ℤ × ℤ × ℤ × ℤ

def energy (p : W) (u : V) : ℤ :=
  let (x,y,z,t) := u
  p.a*(x-y)^2+p.b*(x-z)^2+p.c*(x-t)^2+p.d*(y-z)^2+p.e*(y-t)^2+p.f*(z-t)^2

def mass (p : W) := p.a+p.b+p.c+p.d+p.e+p.f

def det (p : W) : ℤ :=
  p.a*p.b*p.c+p.a*p.b*p.e+p.a*p.b*p.f+p.a*p.c*p.d
  +p.a*p.c*p.f+p.a*p.d*p.e+p.a*p.d*p.f+p.a*p.e*p.f
  +p.b*p.c*p.d+p.b*p.c*p.e+p.b*p.d*p.e+p.b*p.d*p.f
  +p.b*p.e*p.f+p.c*p.d*p.e+p.c*p.d*p.f+p.c*p.e*p.f
def psd (p : W) : Prop := ∀ u, 0≤energy p u

lemma mass_nonneg {p : W} (h : psd p) : 0≤ mass p := by
  obtain ⟨a,b,c,d,e,f⟩ := p
  have A := h (1,0,0,0); have B := h (0,1,0,0); have C := h (0,0,1,0); have D := h (0,0,0,1)
  norm_num [energy,mass] at *
  omega

def swapW (i : Fin 6) (p : W) : W :=
  ![⟨p.a,p.b,p.c,p.d,p.e,p.f⟩,
    ⟨p.b,p.a,p.c,p.d,p.f,p.e⟩,
    ⟨p.c,p.b,p.a,p.f,p.e,p.d⟩,
    ⟨p.d,p.b,p.f,p.a,p.e,p.c⟩,
    ⟨p.e,p.f,p.c,p.d,p.a,p.b⟩,
    ⟨p.f,p.b,p.d,p.c,p.e,p.a⟩] i

def swapV (i : Fin 6) (u : V) : V :=
  let (x,y,z,t) := u
  ![(x,y,z,t), (x,z,y,t), (x,t,z,y), (z,y,x,t), (t,y,z,x), (z,t,x,y)] i

lemma swap_energy (i : Fin 6) (p : W) (u : V) : energy (swapW i p) (swapV i u)=energy p u := by
  obtain ⟨a,b,c,d,e,f⟩ := p
  obtain ⟨x,y,z,t⟩ := u
  fin_cases i <;> dsimp [swapW,swapV,energy] <;> ring

lemma swap_vv (i : Fin 6) (u : V) : swapV i (swapV i u)=u := by
  obtain ⟨x,y,z,t⟩ := u; fin_cases i <;> rfl

lemma swap_det (i : Fin 6) (p : W) : det (swapW i p)=det p := by
  obtain ⟨a,b,c,d,e,f⟩ := p; fin_cases i <;> dsimp [det,swapW] <;> ring

lemma swap_mass (i : Fin 6) (p : W) : mass (swapW i p)=mass p := by
  obtain ⟨a,b,c,d,e,f⟩ := p; fin_cases i <;> dsimp [mass,swapW] <;> ring

def reduceW (p : W) : W := ⟨-p.a,p.a+p.c,p.a+p.b,p.d+p.a,p.e+p.a,p.f-p.a⟩
def reduceV (u : V) : V := (u.2.2.1+u.2.2.2-u.1,u.2.1,u.2.2.1,u.2.2.2)

lemma reduce_energy (p : W) (u : V) : energy (reduceW p) (reduceV u) = energy p u := by
  obtain ⟨a,b,c,d,e,f⟩ := p; obtain ⟨x,y,z,t⟩ := u; dsimp [energy,reduceW,reduceV]; ring

lemma reduce_vv (u : V) : reduceV (reduceV u)=u := by
  obtain ⟨x,y,z,t⟩ := u; simp [reduceV]

lemma reduce_det (p : W) : det (reduceW p)=det p := by
  obtain ⟨a,b,c,d,e,f⟩ := p; dsimp [det,reduceW]; ring

lemma reduce_mass (p : W) : mass (reduceW p)=mass p+p.a := by dsimp [mass,reduceW]; ring

def nonnegative (p : W) := 0≤p.a ∧ 0≤p.b ∧ 0≤p.c ∧ 0≤p.d ∧ 0≤p.e ∧ 0≤p.f

lemma reduce_to_nonnegative {p : W} (hp : psd p) (hd : det p=1) {N : ℤ} (u : V) (hu : energy p u=N) :
    ∃ q, nonnegative q ∧ det q=1 ∧ ∃ t, energy q t=N := by
  classical
  let P (m : ℕ) := ∃ q, psd q ∧ det q=1 ∧ (∃ t, energy q t=N) ∧ mass q=(m:ℤ)
  have he : ∃ m, P m := ⟨(mass p).toNat,p,hp,hd,⟨u,hu⟩,(Int.toNat_of_nonneg (mass_nonneg hp)).symm⟩
  obtain ⟨q,hq,hdet,⟨t,ht⟩,hm⟩ := Nat.find_spec he
  refine ⟨q,?_,hdet,t,ht⟩
  have good (i : Fin 6) : 0≤(swapW i q).a := by
    by_contra! hn
    let r := swapW i q
    have h₁ : psd r := fun x => by
      have e := swap_energy i q (swapV i x); rw [swap_vv] at e
      rw [show energy r x=_ from e]; exact hq _
    have h₂ : psd (reduceW r) := fun x => by
      have e := reduce_energy r (reduceV x); rw [reduce_vv] at e
      rw [e]; exact h₁ _
    have hr : P (mass (reduceW r)).toNat := ⟨reduceW r,h₂,(reduce_det r).trans ((swap_det i q).trans hdet),
      ⟨reduceV (swapV i t),(reduce_energy r _).trans ((swap_energy i q t).trans ht)⟩,
      (Int.toNat_of_nonneg (mass_nonneg h₂)).symm⟩
    have hmin := Nat.find_min' he hr
    have hmass := reduce_mass r
    have heq : mass r=mass q := swap_mass i q
    change r.a<0 at hn
    have hcast : (Nat.find he:ℤ) ≤ ((mass (reduceW r)).toNat:ℤ) := by exact_mod_cast hmin
    have hnon := mass_nonneg h₂
    omega
  exact ⟨good 0,good 1,good 2,good 3,good 4,good 5⟩

lemma triple_one {a b c : ℤ} (ha : 0≤a) (hb : 0≤b) (hc : 0≤c) (h : a*b*c=1) :
    a=1 ∧ b=1 ∧ c=1 := by
  have e₁ := Int.eq_one_or_neg_one_of_mul_eq_one (show a*(b*c)=1 by simpa [mul_assoc] using h)
  have e₂ := Int.eq_one_or_neg_one_of_mul_eq_one (show b*(a*c)=1 by simpa [mul_assoc,mul_left_comm,mul_comm] using h)
  have e₃ := Int.eq_one_or_neg_one_of_mul_eq_one (show c*(a*b)=1 by simpa [mul_assoc,mul_left_comm,mul_comm] using h)
  omega

lemma three_sq {p : W} (h : nonnegative p) (hd : det p=1) (u : V) :
    ∃ x y z : ℤ, energy p u=x^2+y^2+z^2 := by
  obtain ⟨a,b,c,d,e,f⟩ := p
  obtain ⟨ha,hb,hc,hd',he,hf⟩ := h
  dsimp only at ha hb hc hd' he hf
  dsimp only [det] at hd
  obtain ⟨w,x,y,z⟩ := u
  have t0 := mul_nonneg (mul_nonneg ha hb) hc
  have t1 := mul_nonneg (mul_nonneg ha hb) he
  have t2 := mul_nonneg (mul_nonneg ha hb) hf
  have t3 := mul_nonneg (mul_nonneg ha hc) hd'
  have t4 := mul_nonneg (mul_nonneg ha hc) hf
  have t5 := mul_nonneg (mul_nonneg ha hd') he
  have t6 := mul_nonneg (mul_nonneg ha hd') hf
  have t7 := mul_nonneg (mul_nonneg ha he) hf
  have t8 := mul_nonneg (mul_nonneg hb hc) hd'
  have t9 := mul_nonneg (mul_nonneg hb hc) he
  have t10 := mul_nonneg (mul_nonneg hb hd') he
  have t11 := mul_nonneg (mul_nonneg hb hd') hf
  have t12 := mul_nonneg (mul_nonneg hb he) hf
  have t13 := mul_nonneg (mul_nonneg hc hd') he
  have t14 := mul_nonneg (mul_nonneg hc hd') hf
  have t15 := mul_nonneg (mul_nonneg hc he) hf
  have hone : a*b*c=1 ∨ a*b*e=1 ∨ a*b*f=1 ∨ a*c*d=1 ∨ a*c*f=1 ∨ a*d*e=1 ∨ a*d*f=1 ∨ a*e*f=1 ∨ b*c*d=1 ∨ b*c*e=1 ∨ b*d*e=1 ∨ b*d*f=1 ∨ b*e*f=1 ∨ c*d*e=1 ∨ c*d*f=1 ∨ c*e*f=1 := by omega
  rcases hone with h|h|h|h|h|h|h|h|h|h|h|h|h|h|h|h
  · have z0 : a*c*d=0 := by omega
    have z1 : a*b*e=0 := by omega
    have z2 : a*b*f=0 := by omega
    obtain ⟨rfl,rfl,rfl⟩ := triple_one ha hb hc h
    simp only [mul_one,one_mul] at z0 z1 z2
    subst_vars
    exact ⟨w-x,w-y,w-z,by dsimp [energy]; ring⟩
  · have z0 : a*b*c=0 := by omega
    have z1 : a*d*e=0 := by omega
    have z2 : a*b*f=0 := by omega
    obtain ⟨rfl,rfl,rfl⟩ := triple_one ha hb he h
    simp only [mul_one,one_mul] at z0 z1 z2
    subst_vars
    exact ⟨w-x,w-y,x-z,by dsimp [energy]; ring⟩
  · have z0 : a*b*c=0 := by omega
    have z1 : a*d*f=0 := by omega
    have z2 : a*b*e=0 := by omega
    obtain ⟨rfl,rfl,rfl⟩ := triple_one ha hb hf h
    simp only [mul_one,one_mul] at z0 z1 z2
    subst_vars
    exact ⟨w-x,w-y,y-z,by dsimp [energy]; ring⟩
  · have z0 : a*b*c=0 := by omega
    have z1 : a*d*e=0 := by omega
    have z2 : a*c*f=0 := by omega
    obtain ⟨rfl,rfl,rfl⟩ := triple_one ha hc hd' h
    simp only [mul_one,one_mul] at z0 z1 z2
    subst_vars
    exact ⟨w-x,w-z,x-y,by dsimp [energy]; ring⟩
  · have z0 : a*b*c=0 := by omega
    have z1 : a*c*d=0 := by omega
    have z2 : a*e*f=0 := by omega
    obtain ⟨rfl,rfl,rfl⟩ := triple_one ha hc hf h
    simp only [mul_one,one_mul] at z0 z1 z2
    subst_vars
    exact ⟨w-x,w-z,y-z,by dsimp [energy]; ring⟩
  · have z0 : a*b*e=0 := by omega
    have z1 : a*c*d=0 := by omega
    have z2 : a*d*f=0 := by omega
    obtain ⟨rfl,rfl,rfl⟩ := triple_one ha hd' he h
    simp only [mul_one,one_mul] at z0 z1 z2
    subst_vars
    exact ⟨w-x,x-y,x-z,by dsimp [energy]; ring⟩
  · have z0 : a*b*f=0 := by omega
    have z1 : a*c*d=0 := by omega
    have z2 : a*d*e=0 := by omega
    obtain ⟨rfl,rfl,rfl⟩ := triple_one ha hd' hf h
    simp only [mul_one,one_mul] at z0 z1 z2
    subst_vars
    exact ⟨w-x,x-y,y-z,by dsimp [energy]; ring⟩
  · have z0 : a*b*e=0 := by omega
    have z1 : a*c*f=0 := by omega
    have z2 : a*d*e=0 := by omega
    obtain ⟨rfl,rfl,rfl⟩ := triple_one ha he hf h
    simp only [mul_one,one_mul] at z0 z1 z2
    subst_vars
    exact ⟨w-x,x-z,y-z,by dsimp [energy]; ring⟩
  · have z0 : a*b*c=0 := by omega
    have z1 : b*c*e=0 := by omega
    have z2 : b*d*f=0 := by omega
    obtain ⟨rfl,rfl,rfl⟩ := triple_one hb hc hd' h
    simp only [mul_one,one_mul] at z0 z1 z2
    subst_vars
    exact ⟨w-y,w-z,x-y,by dsimp [energy]; ring⟩
  · have z0 : a*b*c=0 := by omega
    have z1 : b*c*d=0 := by omega
    have z2 : b*e*f=0 := by omega
    obtain ⟨rfl,rfl,rfl⟩ := triple_one hb hc he h
    simp only [mul_one,one_mul] at z0 z1 z2
    subst_vars
    exact ⟨w-y,w-z,x-z,by dsimp [energy]; ring⟩
  · have z0 : a*b*e=0 := by omega
    have z1 : b*c*d=0 := by omega
    have z2 : b*d*f=0 := by omega
    obtain ⟨rfl,rfl,rfl⟩ := triple_one hb hd' he h
    simp only [mul_one,one_mul] at z0 z1 z2
    subst_vars
    exact ⟨w-y,x-y,x-z,by dsimp [energy]; ring⟩
  · have z0 : a*b*f=0 := by omega
    have z1 : b*c*d=0 := by omega
    have z2 : b*d*e=0 := by omega
    obtain ⟨rfl,rfl,rfl⟩ := triple_one hb hd' hf h
    simp only [mul_one,one_mul] at z0 z1 z2
    subst_vars
    exact ⟨w-y,x-y,y-z,by dsimp [energy]; ring⟩
  · have z0 : a*b*e=0 := by omega
    have z1 : b*c*e=0 := by omega
    have z2 : b*d*e=0 := by omega
    obtain ⟨rfl,rfl,rfl⟩ := triple_one hb he hf h
    simp only [mul_one,one_mul] at z0 z1 z2
    subst_vars
    exact ⟨w-y,x-z,y-z,by dsimp [energy]; ring⟩
  · have z0 : a*c*d=0 := by omega
    have z1 : b*c*d=0 := by omega
    have z2 : c*d*f=0 := by omega
    obtain ⟨rfl,rfl,rfl⟩ := triple_one hc hd' he h
    simp only [mul_one,one_mul] at z0 z1 z2
    subst_vars
    exact ⟨w-z,x-y,x-z,by dsimp [energy]; ring⟩
  · have z0 : a*c*d=0 := by omega
    have z1 : b*c*d=0 := by omega
    have z2 : c*d*e=0 := by omega
    obtain ⟨rfl,rfl,rfl⟩ := triple_one hc hd' hf h
    simp only [mul_one,one_mul] at z0 z1 z2
    subst_vars
    exact ⟨w-z,x-y,y-z,by dsimp [energy]; ring⟩
  · have z0 : a*c*f=0 := by omega
    have z1 : b*c*e=0 := by omega
    have z2 : c*d*e=0 := by omega
    obtain ⟨rfl,rfl,rfl⟩ := triple_one hc he hf h
    simp only [mul_one,one_mul] at z0 z1 z2
    subst_vars
    exact ⟨w-z,x-z,y-z,by dsimp [energy]; ring⟩

theorem three_squares {p : W} (hp : psd p) (hd : det p=1) (u : V) :
    ∃ x y z : ℤ, energy p u=x^2+y^2+z^2 := by
  obtain ⟨q,hq,hd',w,he⟩ := reduce_to_nonnegative hp hd u rfl
  exact he ▸ three_sq hq hd' w

#print axioms three_squares
end TunnellSelling
