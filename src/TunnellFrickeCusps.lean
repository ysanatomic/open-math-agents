import TunnellFrickePrimitive
import TunnellFrickeOrbit

/-! Boundary values of the conductor-32 primitive at all rational cusps. -/

namespace TunnellFricke

open Complex Function Filter Set
open UpperHalfPlane hiding I
open scoped Topology

noncomputable def height (r : ℝ) (z : ℂ) : ℝ := z.im / normSq (z-r)

noncomputable def cusp (r : ℝ) : Filter ℂ := comap (height r) atTop

lemma eventually_upper (r : ℝ) : ∀ᶠ z in cusp r, 0<z.im := by
  filter_upwards [(tendsto_comap (f:=height r) (x:=atTop)).eventually (eventually_gt_atTop 0)] with z hz
  exact (div_pos_iff.mp hz).elim (fun h => h.1) (fun h => False.elim ((normSq_nonneg _).not_gt h.2))

lemma W_involution {z : ℂ} (hz : z ≠ 0) : W (W z) = z := by
  unfold W
  field_simp

lemma W_im (z : ℂ) : (W z).im = height 0 z / 2 := by
  simp [W,height,Complex.div_im,Complex.mul_im,Complex.normSq_mul,pow_two]
  ring

lemma height_add (r t : ℝ) (z : ℂ) : height (r+t) (z+t) = height r z := by
  simp [height,add_sub_add_right_eq_sub]

lemma height_W (r : ℝ) (hr : r≠0) (z : ℂ) (hz : 0<z.im) :
    height (-1/(2*r)) (W z) = 2*r^2*height r z := by
  have hz0 := ne_zero (⟨z,hz⟩:ℍ)
  have hrC : (r:ℂ) ≠ 0 := ofReal_ne_zero.mpr hr
  have hz' : z-(r:ℂ)≠0 := by
    intro he
    have e := congrArg Complex.im (sub_eq_zero.mp he)
    simp at e
    linarith
  have dif : W z - ((-1/(2*r):ℝ):ℂ) = (z-r)/(2*z*r) := by
    unfold W
    push_cast
    field_simp
    ring
  rw [height,W_im,dif,normSq_div,height,height]
  simp only [ofReal_zero,sub_zero,map_mul,normSq_ofReal]
  field_simp [Complex.normSq_eq_zero.not.mpr hz0,Complex.normSq_eq_zero.not.mpr hz',hr]
  norm_num [normSq_apply]
  <;> ring

lemma move_W (r : ℝ) (hr : r≠0) : Tendsto W (cusp r) (cusp (-1/(2*r))) := by
  apply tendsto_comap_iff.mpr
  apply Tendsto.congr' _ (tendsto_comap (f:=height r) (x:=atTop) |>.const_mul_atTop (show 0<2*r^2 by positivity))
  filter_upwards [eventually_upper r] with z hz
  exact (height_W r hr z hz).symm

lemma move_add (r t : ℝ) : Tendsto (fun z : ℂ => z+t) (cusp r) (cusp (r+t)) := by
  apply tendsto_comap_iff.mpr
  exact tendsto_comap.congr (fun z => (height_add r t z).symm)

lemma move_zero : Tendsto W (cusp 0) (comap Complex.im atTop) := by
  apply tendsto_comap_iff.mpr
  exact ((tendsto_comap (f:=height 0) (x:=atTop)).atTop_mul_const (by norm_num : (0:ℝ)<2⁻¹)).congr (fun z => by simp [Function.comp_def,W_im,div_eq_mul_inv])

lemma integer_steps (P : ℚ → Prop)
    (hp : ∀ x, P x → P (x+1)) (hm : ∀ x, P x → P (x-1))
    (x : ℚ) (k : ℤ) (hx : P x) : P (x+k) := by
  induction k using Int.induction_on with
  | zero => simpa using hx
  | succ i ih => simpa [Int.cast_add,add_assoc] using hp (x+i) ih
  | pred i ih => simpa [Int.cast_sub,sub_eq_add_neg,add_assoc] using hm (x+(-(i:ℤ):ℚ)) ih

noncomputable def gi : GaussianInt := ⟨0,1⟩
lemma coe_gi : (gi:ℂ) = I := by simp [gi,GaussianInt.toComplex_def]

def Bound (J : ℂ → ℂ) (C : ℂ) (x : ℚ) (a : GaussianInt) : Prop :=
  Tendsto J (cusp x) (𝓝 ((a:ℂ)*C))

theorem cusp_rules {J : ℂ → ℂ} {C : ℂ}
    (h0 : Tendsto J (comap Complex.im atTop) (𝓝 0))
    (hT : ∀ z, 0<z.im → J (z+1) = I*J z)
    (hW : ∀ z, 0<z.im → J (W z) = C-J z) :
    Bound J C 0 1 ∧
    (∀ x a, Bound J C x a → Bound J C (x+1) (gi*a)) ∧
    (∀ x a, Bound J C x a → Bound J C (x-1) (-gi*a)) ∧
    (∀ x, x≠0 → ∀ a, Bound J C x a → Bound J C (-1/(2*x)) (1-a)) := by
  unfold Bound
  refine ⟨?_,?_,?_,?_⟩
  · simp only [map_one,one_mul,Rat.cast_zero]
    have ht := tendsto_const_nhds (x:=C) |>.sub (h0.comp move_zero)
    rw [sub_zero] at ht
    apply ht.congr'
    filter_upwards [eventually_upper 0] with z hz
    simp [Function.comp_def,hW z hz]
  · intro x a ha
    simp only [Rat.cast_add,Rat.cast_one,map_mul,coe_gi,mul_assoc]
    have ht := move_add ((x:ℝ)+1) (-1)
    simp only [add_neg_cancel_right] at ht
    apply (ha.comp ht |>.const_mul I).congr'
    filter_upwards [eventually_upper ((x:ℝ)+1)] with z hz
    have he := hT (z-1) (by simpa using hz)
    simpa [Function.comp_def,sub_eq_add_neg] using he.symm
  · intro x a ha
    simp only [Rat.cast_sub,Rat.cast_one,map_mul,map_neg,coe_gi,mul_assoc]
    have ht := move_add ((x:ℝ)-1) 1
    simp only [sub_add_cancel] at ht
    apply (ha.comp ht |>.const_mul (-I)).congr'
    filter_upwards [eventually_upper ((x:ℝ)-1)] with z hz
    change (-I)*J (z+(1:ℝ)) = J z
    simp [hT z hz,← mul_assoc]
  · intro x hx a ha
    have hr : (x:ℝ) ≠ 0 := by exact_mod_cast hx
    have ht := move_W (-1/(2*(x:ℝ))) (by positivity)
    rw [show -1 / (2 * (-1/(2*(x:ℝ)))) = x by field_simp] at ht
    simp only [Rat.cast_div,Rat.cast_neg,Rat.cast_one,Rat.cast_mul,Rat.cast_ofNat,map_sub,map_one,sub_mul,one_mul]
    apply (tendsto_const_nhds (x:=C) |>.sub (ha.comp ht)).congr'
    filter_upwards [eventually_upper (-1/(2*(x:ℝ)))] with z hz
    simp [Function.comp_def,hW z hz]


theorem paired_cusp_values {J : ℂ → ℂ} {C : ℂ}
    (h0 : Tendsto J (comap Complex.im atTop) (𝓝 0))
    (hT : ∀ z, 0<z.im → J (z+1) = I*J z)
    (hW : ∀ z, 0<z.im → J (W z) = C-J z) (r : ℚ) :
    ∃ a : GaussianInt, Bound J C r a ∧ Bound J C (-r) (star a) := by
  obtain ⟨hz,hp,hm,hw⟩ := cusp_rules h0 hT hW
  have hi : star gi = -gi := by rfl
  apply TunnellFrickeOrbit.rational_cusps (fun x => ∃ a : GaussianInt, Bound J C x a ∧ Bound J C (-x) (star a)) _ _ _ r
  · exact ⟨1,hz,by simpa using hz⟩
  · apply integer_steps
    · rintro x ⟨a,h,k⟩
      refine ⟨gi*a,hp x a h,?_⟩
      simpa [star_mul,hi,mul_comm,add_comm,sub_eq_add_neg] using hm (-x) (star a) k
    · rintro x ⟨a,h,k⟩
      refine ⟨-gi*a,hm x a h,?_⟩
      simpa [star_mul,hi,mul_comm,add_comm,sub_eq_add_neg] using hp (-x) (star a) k
  · rintro x hx ⟨a,h,k⟩
    refine ⟨1-a,hw x hx a h,?_⟩
    simpa [div_eq_mul_inv] using hw (-x) (neg_ne_zero.mpr hx) (star a) k

end TunnellFricke
#print axioms TunnellFricke.paired_cusp_values
