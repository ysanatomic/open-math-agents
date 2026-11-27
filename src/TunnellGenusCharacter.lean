import TunnellAmbiguousClass

/-! Ramified-prime genus characters of the imaginary quadratic ideal classes. -/
namespace TunnellGenusCharacter
open TunnellIdealHNF TunnellIdealGenerators TunnellClassThetaCount TunnellToricClass TunnellShell TunnellEmbeddedIdeals
open TunnellFrameNorm TunnellProperClassGroup TunnellIdealThetaExpansion TunnellAmbiguousClass
noncomputable section

variable {n p : ℕ} [hpFact : Fact p.Prime] (hn : Squarefree n) (h2 : n%4=2)
local notation "F" => ZMod p
local notation "χ" => quadraticChar F

include hn h2 in
lemma norm_valZ {I : Ideal (R n)} (hI : I≠⊥) (x : I) : x.val.norm=(valence x:ℤ)*normI I := by
  have h : (x.val.norm.toNat:ℤ)=(valence x:ℤ)*normI I := by exact_mod_cast norm_valence hn h2 hI x
  rwa [Int.toNat_of_nonneg (Zsqrtd.norm_nonneg (by omega) x.val)] at h

include hn h2 hpFact in
lemma good_exists {I : Ideal (R n)} (hI : I≠⊥) : ∃ x:I, (valence x:F)≠0 := by
  by_contra! e
  have hNI := normI_positive (by omega) I hI
  have H := ideal_norm_gcd hn h2 hI ((p:ℤ)*normI I) (by
    intro x hx; let t : I := ⟨x,hx⟩
    obtain ⟨k,hk⟩ := (ZMod.natCast_eq_zero_iff (valence t) p).mp (e t)
    refine ⟨k,?_⟩
    have H := norm_valZ hn h2 hI t
    change x.norm=_ at H
    rw [H,hk,Nat.cast_mul]; ring)
  have e' : p*normI I∣normI I := Int.natCast_dvd_natCast.mp (by simpa using H)
  have hp := (Fact.out : p.Prime).one_lt
  exact (Nat.not_lt_of_ge (Nat.le_of_dvd hNI e')) (by nlinarith)

def good {I : Ideal (R n)} (hI : I≠⊥) : I := (good_exists (p:=p) hn h2 hI).choose
lemma good_nonzero {I : Ideal (R n)} (hI : I≠⊥) : (valence (good (p:=p) hn h2 hI):F)≠0 := (good_exists hn h2 hI).choose_spec
def charI {I : Ideal (R n)} (hI : I≠⊥) := χ (valence (good (p:=p) hn h2 hI):F)

lemma norm_square (hp : p∣n) (x : R n) : (x.norm:F)=(x.re:F)^2 := by
  have h := (ZMod.natCast_eq_zero_iff n p).mpr hp
  change ((x.re*x.re- -(n:ℤ)*x.im*x.im:ℤ):F)=_
  push_cast; rw [h]; ring

include hn h2 in
lemma independent (hp : p∣n) {I : Ideal (R n)} (hI : I≠⊥) (x y : I) (hx : (valence x:F)≠0) (hy : (valence y:F)≠0) :
    χ (valence x:F)=χ (valence y:F) := by
  have hxy := Ideal.mul_mem_mul x.property (conj_mem I y.property)
  rw [norm_conjugate hn h2 I hI] at hxy
  obtain ⟨z,hz⟩ := Ideal.mem_span_singleton.mp hxy
  have H := congrArg Zsqrtd.norm hz
  simp only [Zsqrtd.norm_mul,Zsqrtd.norm_conj] at H
  have hN : ((normI I:R n)).norm=(normI I:ℤ)^2 := by
    change (normI I:ℤ)*normI I- -(n:ℤ)*0*0=_; ring
  rw [norm_valZ hn h2 hI x,norm_valZ hn h2 hI y,hN] at H
  have hn0 : (normI I:ℤ)≠0 := by exact_mod_cast (normI_positive (by omega) I hI).ne'
  have eq : (valence x:ℤ)*valence y=z.norm := mul_left_cancel₀ (pow_ne_zero 2 hn0) (by linear_combination H)
  have e : (valence x:F)*(valence y:F)=(z.re:F)^2 := by
    rw [←norm_square hp z]; exact_mod_cast congrArg (fun w:ℤ => (w:F)) eq
  have hc : χ (valence x:F)*χ (valence y:F)=1 := by
    rw [←map_mul,e,quadraticChar_sq_one' (fun he => (mul_ne_zero hx hy) (by simpa [he] using e))]
  rcases quadraticChar_dichotomy hx with h|h <;> rcases quadraticChar_dichotomy hy with h'|h' <;> rw [h,h'] at hc ⊢ <;> norm_num at *

lemma charI_eq (hp : p∣n) {I : Ideal (R n)} (hI : I≠⊥) (x : I) (hx : (valence x:F)≠0) :
    charI (p:=p) hn h2 hI=χ (valence x:F) := independent hn h2 hp hI _ _ (good_nonzero hn h2 hI) hx

include hn h2 in
lemma val_mul {A B : Ideal (R n)} (hA : A≠⊥) (hB : B≠⊥) (x : A) (y : B) :
    valence (⟨x.val*y.val,Ideal.mul_mem_mul x.property y.property⟩:A*B)=valence x*valence y := by
  let z : A*B := ⟨x.val*y.val,Ideal.mul_mem_mul x.property y.property⟩
  have hz := norm_valZ hn h2 (mul_ne_bot (by omega) hA hB) z
  change (x.val*y.val).norm=_ at hz
  rw [Zsqrtd.norm_mul,norm_valZ hn h2 hA x,norm_valZ hn h2 hB y,normI_mul hn h2 hA hB,Nat.cast_mul] at hz
  have hN : (normI A:ℤ)*normI B≠0 := by exact_mod_cast (mul_ne_zero (normI_positive (by omega) A hA).ne' (normI_positive (by omega) B hB).ne')
  exact_mod_cast (show (valence z:ℤ)=(valence x:ℤ)*valence y from mul_right_cancel₀ hN (by linear_combination -hz))

lemma charI_mul (hp : p∣n) {A B : Ideal (R n)} (hA : A≠⊥) (hB : B≠⊥) :
    charI (p:=p) hn h2 (mul_ne_bot (by omega) hA hB)=charI (p:=p) hn h2 hA*charI (p:=p) hn h2 hB := by
  let x := good (p:=p) hn h2 hA
  let y := good (p:=p) hn h2 hB
  let z : A*B := ⟨x.val*y.val,Ideal.mul_mem_mul x.property y.property⟩
  have H : (valence z:F)=(valence x:F)*(valence y:F) := by rw [←Nat.cast_mul]; exact congrArg (fun k:ℕ => (k:F)) (val_mul hn h2 hA hB x y)
  rw [charI_eq hn h2 hp _ z (H ▸ mul_ne_zero (good_nonzero hn h2 hA) (good_nonzero hn h2 hB)),H,map_mul]
  rfl

lemma charI_principal (hp : p∣n) {x : R n} (hx : x≠0) :
    charI (p:=p) hn h2 (nonzero_principal hx)=1 := by
  let z : principal x := ⟨x,Ideal.mem_span_singleton_self _⟩
  have hz : valence z=1 := by
    change x.norm.toNat/normI (principal x)=1
    rw [←normI_principal hn h2 hx,Nat.div_self (normI_positive (by omega) _ (nonzero_principal hx))]
  rw [charI_eq hn h2 hp _ z (by rw [hz,Nat.cast_one]; exact one_ne_zero),hz,Nat.cast_one,map_one]

lemma charI_congr {v : Triple} (hv : v∈shell n) (hp : p∣n) {A B : Ideal (R n)} (hA : A≠⊥) (hB : B≠⊥)
    (h : cls hn h2 hv hA=cls hn h2 hv hB) : charI (p:=p) hn h2 hA=charI (p:=p) hn h2 hB := by
  obtain ⟨m,hm,x,hx,e⟩ := cross_mult hn h2 hv hA ((cls_eq ..).mp h)
  have hM : (m:R n)≠0 := Nat.cast_ne_zero.mpr hm.ne'
  have he : charI (p:=p) hn h2 (mul_ne_bot (by omega) (nonzero_principal hx) hA)=
      charI (p:=p) hn h2 (mul_ne_bot (by omega) (nonzero_principal hM) hB) := by
    have eq {P Q : Ideal (R n)} {hP:P≠⊥} {hQ:Q≠⊥} (H : P=Q) : charI (p:=p) hn h2 hP=charI (p:=p) hn h2 hQ := by cases H; rfl
    exact eq e
  have H := (charI_mul (p:=p) hn h2 hp (nonzero_principal hx) hA).symm.trans (he.trans (charI_mul hn h2 hp (nonzero_principal hM) hB))
  simpa only [charI_principal hn h2 hp hx,charI_principal hn h2 hp hM,one_mul] using H

end
end TunnellGenusCharacter
#print axioms TunnellGenusCharacter.charI_congr
