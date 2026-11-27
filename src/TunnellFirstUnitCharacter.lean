import TunnellPrincipalPowers
import Mathlib.FieldTheory.Finite.Basic
import Mathlib.Tactic

/-! Detection of a nontrivial tame character by the first principal-unit coefficient. -/
namespace TunnellFirstUnitCharacter

variable {R : Type*} [CommRing R] {p : ℕ} [Fact p.Prime]

private lemma linear_approx (t x:R) (k m:ℕ) (hk:0<k) :
    ∃ d:R, (1+t^k*x)^m = 1+(m:R)*t^k*x+t^(k+1)*d := by
  induction m with
  | zero => exact ⟨0,by simp⟩
  | succ m ih =>
    obtain ⟨d,hd⟩ := ih
    refine ⟨d*(1+t^k*x)+(m:R)*t^(k-1)*x^2,?_⟩
    rw [pow_succ,hd,Nat.cast_succ]
    have ht : t^(k+1)*t^(k-1)=t^k*t^k := by rw [←pow_add,←pow_add,show k+1+(k-1)=k+k by omega]
    linear_combination -(m:R)*x^2*ht

abbrev principal (t:R) (k:ℕ) (v:Rˣ) : Prop := t^k ∣ (v:R)-1

private lemma same_character (t:R) {k:ℕ} (b : Rˣ→ZMod p) (hmul : ∀ v w, b (v*w)=b v+b w)
    (hk : ∀ w:Rˣ, principal t k w → b w=0) (v w:Rˣ) (h:t^k∣(v:R)-w) : b v=b w := by
  have h0 := hmul 1 1
  have h1 : b 1=0 := by simpa using h0
  have hinv := hmul w w⁻¹
  rw [mul_inv_cancel,h1] at hinv
  have hvw := hk (v*w⁻¹) (by
    obtain ⟨d,hd⟩ := h
    refine ⟨d*(↑(w⁻¹):R),?_⟩
    change (v:R)*↑(w⁻¹)-1=_
    have hu : (w:R)*↑(w⁻¹)=1 := Units.mul_inv w
    linear_combination (↑(w⁻¹):R)*hd + hu)
  rw [hmul] at hvw
  linear_combination hvw + hinv

private lemma power_character (b:Rˣ→ZMod p) (hmul:∀ v w,b (v*w)=b v+b w) (v:Rˣ) (m:ℕ) :
    b (v^m)=(m:ZMod p)*b v := by
  induction m with
  | zero => have hh := hmul 1 1; simpa using hh
  | succ m ih => rw [pow_succ,hmul,ih,Nat.cast_succ]; ring

/-- Let t be a tame uniformizer and let δ(t)/t reduce to a primitive tame eigenvalue ζ.
    If β has character ζ and vanishes on the p-th filtration step, one principal unit with
    nonzero first coefficient detects β on the whole unit group. -/
theorem first_unit_detects (ρ : R→+*ZMod p) (δ : R≃+*R) (t a:R)
    (ht:ρ t=0) (hdiv:∀ x:R, ρ x=0 → t∣x) (hδt:δ t=a*t) (hδ:∀ x:R,ρ (δ x)=ρ x)
    (hchar:∀ k:ℕ, 2≤k → k<p → ρ a^k≠ρ a)
    (b:Rˣ→ZMod p) (hmul:∀ v w,b (v*w)=b v+b w)
    (hβ:∀ v:Rˣ,b (Units.map δ.toMonoidHom v)=ρ a*b v)
    (hdeep:∀ v:Rˣ,principal t p v → b v=0)
    {c:Rˣ} {x:R} (hc:(c:R)=1+t*x) (hx:ρ x≠0) (hbc:b c=0) : ∀ v:Rˣ, b v=0 := by
  have lower (k:ℕ) (hk:2≤k) (hkp:k<p) (hnext:∀ v:Rˣ,principal t (k+1) v → b v=0) :
      ∀ v:Rˣ,principal t k v → b v=0 := by
    intro v hv
    obtain ⟨z,hz⟩ := hv
    have hv' : (v:R)=1+t^k*z := by linear_combination hz
    let m := (ρ a^k).val
    have hm : (m:ZMod p)=ρ a^k := ZMod.natCast_zmod_val _
    obtain ⟨D,hD⟩ := linear_approx t z k m (by omega)
    obtain ⟨e,he⟩ := hdiv (a^k*δ z-(m:R)*z) (by simp [hm,hδ])
    have hh := same_character t b hmul hnext (Units.map δ.toMonoidHom v) (v^m) (by
      refine ⟨e-D,?_⟩
      change δ (v:R) - (v:R)^m = _
      rw [hv',map_add,map_one,map_mul,map_pow,hδt,mul_pow,hD,pow_succ]
      linear_combination t^k*he)
    rw [hβ,power_character b hmul,hm] at hh
    exact (mul_eq_zero.mp (show (ρ a^k-ρ a)*b v=0 by linear_combination -hh)).resolve_left
      (sub_ne_zero.mpr (hchar k hk hkp))
  have h2 : ∀ v:Rˣ, principal t 2 v → b v=0 := by
    have hdown (j:ℕ) (hj:2≤p-j) : ∀ v:Rˣ, principal t (p-j) v → b v=0 := by
      induction j with
      | zero => simpa using hdeep
      | succ j ih =>
        apply lower _ hj (by omega)
        rw [show p-(j+1)+1=p-j by omega]
        exact ih (by omega)
    have hp := (Fact.out:p.Prime).two_le
    simpa [show p-(p-2)=2 by omega] using hdown (p-2) (by omega)
  have hfirst (v:Rˣ) (hv:principal t 1 v) : b v=0 := by
    obtain ⟨z,hz⟩ := hv
    rw [pow_one] at hz
    let m := (ρ z/ρ x).val
    have hm : (m:ZMod p)=ρ z/ρ x := ZMod.natCast_zmod_val _
    obtain ⟨e,he⟩ := hdiv (z-(m:R)*x) (by simp [hm,div_mul_cancel₀ _ hx])
    obtain ⟨D,hD⟩ := linear_approx t x 1 m (by decide)
    rw [pow_one] at hD
    have hh := same_character t b hmul h2 v (c^m) (by
      refine ⟨e-D,?_⟩
      change (v:R)-(c:R)^m=_
      rw [hc,hD]
      linear_combination hz+t*he)
    rw [hh,power_character b hmul,hbc,mul_zero]
  intro v
  have hn : ρ (v:R)≠0 := (v.isUnit.map ρ).ne_zero
  have hpow := ZMod.pow_card_sub_one_eq_one hn
  have hkill := hfirst (v^(p-1)) (by
    rw [principal,pow_one]
    apply hdiv
    change ρ ((v:R)^(p-1)-1)=0
    rw [map_sub,map_pow,map_one,hpow,sub_self])
  rw [power_character b hmul] at hkill
  exact (mul_eq_zero.mp hkill).resolve_left (by
    intro h
    have hp := (Fact.out:p.Prime).two_le
    have hd := (ZMod.natCast_eq_zero_iff (p-1) p).mp h
    have := Nat.le_of_dvd (show 0<p-1 by omega) hd
    omega)

/-- At ramification degree p−1 and without p-th roots of unity, one first-order global unit
    detects the entire tame eigencharacter on local integral units. -/
theorem henselian_first_unit_detects {O:Type} [CommRing O] [HenselianLocalRing O] [IsDomain O]
    (ρ:O→+*ZMod p) (hsur:Function.Surjective ρ) (δ:O≃+*O) (t u a:O)
    (ht0:t≠0) (ht:ρ t=0) (hu:u*t^(p-1)=(p:O)) (hunit:ρ u≠0)
    (hmu:∀ z:O,z^p=1 → z=1) (hdiv:∀ x:O,ρ x=0 → t∣x)
    (hδt:δ t=a*t) (hδ:∀ x:O,ρ (δ x)=ρ x) (hchar:∀ k:ℕ, 2≤k → k<p → ρ a^k≠ρ a)
    (b:Oˣ→ZMod p) (hmul:∀ v w,b (v*w)=b v+b w) (hβ:∀ v:Oˣ,b (Units.map δ.toMonoidHom v)=ρ a*b v)
    {c:Oˣ} {x:O} (hc:(c:O)=1+t*x) (hx:ρ x≠0) (hbc:b c=0) : ∀ v:Oˣ,b v=0 := by
  apply first_unit_detects ρ δ t a ht hdiv hδt hδ hchar b hmul hβ _ hc hx hbc
  intro v hv
  obtain ⟨d,hd⟩ := hv
  obtain ⟨y,hy⟩ := TunnellPrincipalPowers.pth_root_principal ρ hsur t u ht0 ht hu hunit hmu d
  have he : (1+t*y)^p=(v:O) := by rw [hy,←hd]; ring
  let w := v.ofPow (1+t*y) (Fact.out:p.Prime).ne_zero he
  have hw : w^p=v := Units.ext he
  rw [←hw,power_character b hmul,ZMod.natCast_self,zero_mul]

#print axioms henselian_first_unit_detects
end TunnellFirstUnitCharacter
