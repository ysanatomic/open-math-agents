import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1
import Mathlib

/-!
# The first principal-unit coefficient
The tame automorphism acts with weight k on the first uniformizer quotient and weight kʲ on the j-th. These weights differ for 2 ≤ j < p. The p-th step consists of p-th powers, so descending through the filtration leaves only the first coefficient.
-/
namespace OMA.FirstUnitFiltration
open IsLocalRing
open scoped Classical

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

private theorem fixed {O:Type*} [CommRing O] [IsLocalRing O] (e:ResidueField O≃+*ZMod p) (δ:O≃+*O) (x:O) :
    e (residue O (δ x))=e (residue O x) := by
  let a:=e.symm.trans ((ResidueField.mapEquiv δ).trans e)
  have ha (z:ZMod p) : a z=z := by
    rw [←ZMod.natCast_zmod_val z,map_natCast]
  have h:=ha (e (residue O x))
  simpa [a,ResidueField.mapEquiv,ResidueField.map_residue] using h

private theorem tame_inequality {p:ℕ} [Fact p.Prime] (c:(ZMod p)ˣ) (hc:orderOf c=p-1)
    (k:ℕ) (h₁:2≤k) (h₂:k<p) : (c:ZMod p)^k≠(c:ZMod p) := by
  intro h
  have he : c^k=c := Units.ext h
  have hn : c^(k-1)=1 := by
    have eq : c^(k-1)*c=1*c := by rw [←pow_succ,show k-1+1=k by omega,he,one_mul]
    exact mul_right_cancel eq
  have hd := orderOf_dvd_of_pow_eq_one hn
  rw [hc] at hd
  have := Nat.le_of_dvd (show 0<k-1 by omega) hd
  omega

private theorem detects {R:Type*} [CommRing R] [IsLocalRing R] {p:ℕ} [Fact p.Prime]
    (ρ:ResidueField R≃+*ZMod p) (z:R) (hspan:maximalIdeal R=Ideal.span {z})
    (hpow:∀ c:R,∃ y:R,(1+z*y)^p=1+z^p*c)
    (δ:R≃+*R) (a:R) (hza:δ z=a*z) (q:(ZMod p)ˣ) (hq:orderOf q=p-1) (ha:ρ (residue R a)=q)
    (b:Additive Rˣ→+ZMod p) (hb:∃ u:Rˣ,b (Additive.ofMul u)≠0)
    (he:∀ u:Rˣ,b (Additive.ofMul (Units.map δ.toMonoidHom u))=(q:ZMod p)*b (Additive.ofMul u))
    {c:Rˣ} {l:R} (hc:(c:R)=1+z*l) (hn:b (Additive.ofMul c)=0) : ρ (residue R l)=0 := by
  let r:R→+*ZMod p:=ρ.toRingHom.comp (residue R)
  obtain ⟨u,hu⟩:=hb
  by_contra h
  apply hu
  apply first_unit_detects r δ z a _ _ hza _ _
    (fun v=>b (Additive.ofMul v)) (fun v w=>b.map_add (Additive.ofMul v) (Additive.ofMul w)) _ _ hc h hn u
  · have hh : z∈maximalIdeal R:=hspan ▸ Ideal.mem_span_singleton_self _
    change ρ (residue R z)=0
    simp [(residue_eq_zero_iff _).mpr hh]
  · intro x hx
    have hres:residue R x=0:=ρ.injective (hx.trans (map_zero ρ).symm)
    have hx':= (residue_eq_zero_iff _).mp hres
    rwa [hspan,Ideal.mem_span_singleton] at hx'
  · exact fixed ρ δ
  · intro k hk hl
    change ρ (residue R a)^k≠ρ (residue R a)
    rw [ha]
    exact tame_inequality q hq k hk hl
  · intro v
    exact (he v).trans (by rw [show r a=(q:ZMod p) from ha])
  · rintro v ⟨d,hd⟩
    obtain ⟨y,hy⟩:=hpow d
    have ey:(1+z*y)^p=(v:R):=by rw [hy,←hd]; ring
    let w:=v.ofPow (1+z*y) (Fact.out:p.Prime).ne_zero ey
    have hw:w^p=v:=Units.ext ey
    rw [←hw,show Additive.ofMul (w^p)=p • Additive.ofMul w from rfl,map_nsmul,nsmul_eq_mul,ZMod.natCast_self,zero_mul]

theorem detection (O:Type) [CommRing O] [IsDomain O] [IsLocalRing O] (p:ℕ) (hp:p.Prime) (h₂:p≠2)
    (τ:O) (δ:O≃+*O) (k:ℕ) (χ:Additive Oˣ→+ZMod p) (hρ:Nonempty (ResidueField O≃+*ZMod p))
    (hpow:∀c:O,∃y:O,(1+τ*y)^p=1+τ^p*c) (ht:maximalIdeal O=Ideal.span {τ}) (hδ:δ τ-k*τ∈maximalIdeal O^2)
    (hk:orderOf (k:ZMod p)=p-1) (hb:∃v:Oˣ,χ v≠0) (he:∀v:Oˣ,χ (Units.map δ.toMonoidHom v)=(k:ZMod p)*χ v)
    (u u₀:Oˣ) (hd:maximalIdeal O=Ideal.span {(u:O)-(u₀:O)}) : χ (u/u₀)≠0 := by
  letI : Fact p.Prime:=⟨hp⟩
  obtain ⟨ρ⟩:=hρ
  have hk₀:(k:ZMod p)≠0:=by
    intro e
    rw [e,orderOf_zero] at hk
    have := hp.two_le
    omega
  let q: (ZMod p)ˣ:=Units.mk0 _ hk₀
  have hq : orderOf q=p-1:=(orderOf_units (y:=q)).symm.trans hk
  rw [ht,Ideal.span_singleton_pow,Ideal.mem_span_singleton] at hδ
  obtain ⟨c,hc⟩:=hδ
  let a:O:=(k:O)+τ*c
  have ha:δ τ=a*τ:=by dsimp [a]; linear_combination hc
  have hτ:residue O τ=0:=(residue_eq_zero_iff _).mpr (ht ▸ Ideal.mem_span_singleton_self _)
  have hres:ρ (residue O a)=q:=by simp [a,hτ,q]
  obtain ⟨e,ee⟩:=Ideal.span_singleton_eq_span_singleton.mp (ht.symm.trans hd)
  let t:Oˣ:=e/u₀
  have eq:(↑(u/u₀):O)=1+τ*(t:O):=by
    change (u:O)*↑u₀⁻¹=1+τ*((e:O)*↑u₀⁻¹)
    have hunit : (u₀:O)*↑u₀⁻¹=1:=Units.mul_inv _
    linear_combination - (↑u₀⁻¹:O)*ee + hunit
  intro h
  have hz:=detects ρ τ ht hpow δ a ha q hq hres χ hb he eq h
  exact ((t.isUnit.map (ρ.toRingHom.comp (residue O))).ne_zero) hz

end OMA.FirstUnitFiltration

theorem OMA.solution : OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1.H2 :=
  OMA.FirstUnitFiltration.detection
