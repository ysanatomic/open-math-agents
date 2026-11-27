import TunnellFrickeCusps

/-! The normalized conductor-32 cusp symbol by the nearest-integer Euclidean algorithm. -/

namespace TunnellCuspEuclid

open TunnellFricke

def iunit : GaussianInt := ⟨0,1⟩

def rot (k : ℤ) : GaussianInt :=
  if k%4=0 then 1 else if k%4=1 then iunit else if k%4=2 then -1 else -iunit

lemma rot_succ (k : ℤ) : rot (k+1)=iunit*rot k := by
  unfold rot
  split_ifs <;> first | decide | omega

lemma rot_pred (k : ℤ) : rot (k-1)=(-iunit)*rot k := by
  unfold rot
  split_ifs <;> first | decide | omega

def symbolAux : ℕ → ℤ → ℕ → GaussianInt
  | 0, _, _ => 1
  | fuel+1, a, d =>
    let r := a.bmod d
    rot (a.bdiv d) * (if r=0 then 1 else if 2*r=-(d:ℤ) then 1-iunit else
      1-symbolAux fuel (if 0≤r then -(d:ℤ) else (d:ℤ)) (2*r.natAbs))

def symbol (a : ℤ) (d : ℕ) := symbolAux d a d

lemma symbol_rules (B : ℚ → GaussianInt → Prop) (h0 : B 0 1)
    (hp : ∀ x a, B x a → B (x+1) (iunit*a)) (hm : ∀ x a, B x a → B (x-1) (-iunit*a))
    (hw : ∀ x, x≠0 → ∀ a, B x a → B (-1/(2*x)) (1-a)) (a : ℤ) (d : ℕ) (hd : 0<d) :
    B ((a:ℚ)/d) (symbol a d) := by
  have ht (x : ℚ) (b : GaussianInt) (hb : B x b) (k : ℤ) : B (x+k) (rot k*b) := by
    induction k using Int.induction_on with
    | zero => simpa [rot] using hb
    | succ i ih => simpa [rot_succ,Int.cast_add,add_assoc,mul_assoc] using hp _ _ ih
    | pred i ih =>
      rw [rot_pred]
      simpa [Int.cast_sub,sub_eq_add_neg,add_assoc,mul_assoc] using hm _ _ ih
  suffices all : ∀ (fuel d : ℕ) (a : ℤ), 0<d → d≤fuel → B ((a:ℚ)/d) (symbolAux fuel a d) from all d d a hd le_rfl
  intro fuel
  induction fuel with
  | zero => intro d a hd h; omega
  | succ n ih =>
    intro d a hd hdn
    let r := a.bmod d
    have hr := (Int.bmod_eq_iff (a:=a) hd).mp (rfl : a.bmod d=r)
    have hdq : (d:ℚ) ≠ 0 := by positivity
    have eqr : (a:ℚ)/d = (r:ℚ)/d + (a.bdiv d:ℚ) := by
      field_simp
      exact_mod_cast (Int.bmod_add_bdiv a d).symm
    rw [eqr]
    unfold symbolAux
    apply ht
    change B ((r:ℚ)/d) (if r=0 then 1 else if 2*r=-(d:ℤ) then 1-iunit else _)
    by_cases h0r : r=0
    · simpa [h0r] using h0
    rw [if_neg h0r]
    by_cases he : 2*r=-(d:ℤ)
    · rw [if_pos he]
      have e : (r:ℚ)/d = -1/2 := by
        have hh : 2*(r:ℚ) = -(d:ℚ) := by exact_mod_cast he
        field_simp
        linarith
      rw [e]
      simpa using hw 1 one_ne_zero _ (by simpa using hp _ _ h0)
    · rw [if_neg he]
      have hsmall : 2*r.natAbs<d := by omega
      have hpos : 0<2*r.natAbs := by omega
      have hrq : (r:ℚ)≠0 := by exact_mod_cast h0r
      split_ifs with hsign
      · have ee : (r.natAbs:ℚ)=r := by
          have e : (r.natAbs:ℤ)=r := by omega
          simpa only [Int.cast_natCast] using congrArg (fun a:ℤ => (a:ℚ)) e
        have hh := ih _ (-(d:ℤ)) hpos (by omega)
        rw [Nat.cast_mul,Nat.cast_two,ee,Int.cast_neg,Int.cast_natCast] at hh
        convert hw _ (div_ne_zero (neg_ne_zero.mpr hdq) (mul_ne_zero (by norm_num) hrq)) _ hh using 1 <;> field_simp <;> ring
      · have ee : (r.natAbs:ℚ) = -r := by
          have e : (r.natAbs:ℤ) = -r := by omega
          simpa only [Int.cast_natCast,Int.cast_neg] using congrArg (fun a:ℤ => (a:ℚ)) e
        have hh := ih _ (d:ℤ) hpos (by omega)
        rw [Nat.cast_mul,Nat.cast_two,ee,Int.cast_natCast] at hh
        convert hw _ (div_ne_zero hdq (mul_ne_zero (by norm_num) (neg_ne_zero.mpr hrq))) _ hh using 1 <;> field_simp <;> ring

open Complex Filter
open scoped Topology

theorem cusp_value {J : ℂ → ℂ} {C : ℂ}
    (h0 : Tendsto J (comap Complex.im atTop) (𝓝 0))
    (hT : ∀ z, 0<z.im → J (z+1) = I*J z)
    (hW : ∀ z, 0<z.im → J (W z) = C-J z) (a : ℤ) (d : ℕ) (hd : 0<d) :
    Bound J C ((a:ℚ)/d) (symbol a d) ∧ Bound J C (-((a:ℚ)/d)) (star (symbol a d)) := by
  obtain ⟨hz,hp,hm,hw⟩ := cusp_rules h0 hT hW
  have hi : star iunit = -iunit := rfl
  apply symbol_rules (fun x g => Bound J C x g ∧ Bound J C (-x) (star g)) _ _ _ _ a d hd
  · exact ⟨hz,by simpa using hz⟩
  · rintro x g ⟨hb,he⟩
    exact ⟨hp _ _ hb,by simpa only [neg_add_rev,neg_add,neg_one_mul,star_mul,hi,show gi=iunit from rfl,neg_neg,star_neg,mul_comm,add_comm,sub_eq_add_neg] using hm (-x) (star g) he⟩
  · rintro x g ⟨hb,he⟩
    exact ⟨hm _ _ hb,by simpa only [neg_add_rev,neg_add,neg_one_mul,star_mul,hi,show gi=iunit from rfl,neg_neg,star_neg,mul_comm,add_comm,sub_eq_add_neg] using hp (-x) (star g) he⟩
  · rintro x hx g ⟨hb,he⟩
    exact ⟨hw _ hx _ hb,by simpa [div_eq_mul_inv] using hw (-x) (neg_ne_zero.mpr hx) _ he⟩

end TunnellCuspEuclid
#print axioms TunnellCuspEuclid.cusp_value
