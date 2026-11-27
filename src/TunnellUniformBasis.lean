import TunnellGeometricPacket

/-! One integral ideal basis whose leading coefficient is a unit at every odd ramified prime. -/
namespace TunnellUniformBasis
open TunnellIdealHNF TunnellIdealFormBasis TunnellOddDiscriminant TunnellRamifiedLines TunnellIdealThetaExpansion TunnellGenusCharacter
noncomputable section
variable {d : ℕ}
private instance prime (i : P d) : Fact i.val.Prime := ⟨Nat.prime_of_mem_primeFactors i.property⟩

structure Basis (d : ℕ) (I : Ideal (R (2*d))) where
  a : ℕ
  b : ℤ
  c : ℤ
  pos : 0<a
  cop : a.Coprime d
  det : (a:ℤ)*c-b^2=2*d
  basis : (ℤ×ℤ) ≃+ I
  norm : ∀ x, (basis x).val.norm=(normI I:ℤ)*quad (a:ℤ) b c x

def shear (t : ℤ) : (ℤ×ℤ) ≃+ (ℤ×ℤ) where
  toFun x := (x.1,t*x.1+x.2)
  invFun x := (x.1,x.2-t*x.1)
  left_inv x := Prod.ext rfl (by dsimp; ring)
  right_inv x := Prod.ext rfl (by dsimp; ring)
  map_add' x y := Prod.ext rfl (by dsimp; ring)

theorem exists_basis (hn : Squarefree (2*d)) (h2 : (2*d)%4=2) {I : Ideal (R (2*d))} (hI : I≠⊥) : Nonempty (Basis d I) := by
  classical
  obtain ⟨s,rfl⟩ := normal_form (by omega) hI
  obtain ⟨C,hC⟩ := s.divides
  let A : ℤ := s.a; let B : ℤ := s.b
  have det : A*C-B^2=2*d := by dsimp [A,B]; push_cast at hC; linear_combination -hC
  have hpr := primitive_coeffs hn h2 s hC
  let ε (i : P d) : ZMod i.val := if (A:ZMod i.val)=0 then 1 else 0
  obtain ⟨t,ht⟩ := selector ε
  let K : ℤ := A+2*B*t+C*(t:ℤ)^2
  let L : ℤ := B+C*t
  have hunit (i : P d) : (K:ZMod i.val)≠0 := by
    have hi := Nat.dvd_of_mem_primeFactors i.property
    have hmod : (2:ZMod i.val)*d=0 := by rw [(ZMod.natCast_eq_zero_iff _ _).mpr hi,mul_zero]
    have he := congrArg (fun z:ℤ => (z:ZMod i.val)) det; push_cast at he
    rw [hmod] at he
    dsimp only [K]; push_cast; rw [ht]
    by_cases hA : (A:ZMod i.val)=0
    · have hB : (B:ZMod i.val)=0 := by rw [hA,zero_mul,zero_sub,neg_eq_zero] at he; exact sq_eq_zero_iff.mp he
      have hCu : (C:ZMod i.val)≠0 := by
        rintro hz; obtain ⟨u,v,w,e⟩ := hpr
        have hh := congrArg (fun z:ℤ => (z:ZMod i.val)) e
        push_cast at hh; have hA' : (s.a:ZMod i.val)=0 := by simpa only [A,Int.cast_natCast] using hA
        have hB' : (s.b:ZMod i.val)=0 := by simpa only [B,Int.cast_natCast] using hB
        simp [hA',hB',hz] at hh
      simpa [ε,hA,hB] using hCu
    · simpa [ε,hA] using hA
  have hA : 0<A := by dsimp [A]; exact_mod_cast s.pos_a
  have hn0 : (0:ℤ)<2*d := by omega
  have hK : 0<K := by
    by_cases ht : t=0
    · simpa [K,ht] using hA
    have hpos := mul_pos hn0 (sq_pos_of_ne_zero (by exact_mod_cast ht : (t:ℤ)≠0))
    have e : A*K=(A+B*t)^2+(2*d:ℤ)*(t:ℤ)^2 := by dsimp only [K]; linear_combination (t:ℤ)^2*det
    exact pos_of_mul_pos_right (e ▸ add_pos_of_nonneg_of_pos (sq_nonneg _) hpos) hA.le
  have hnat : (K.toNat:ℤ)=K := Int.toNat_of_nonneg hK.le
  have cop : K.toNat.Coprime d := by
    apply Nat.coprime_of_dvd; intro p hp ha hd
    let i : P d := ⟨p,Nat.mem_primeFactors.mpr ⟨hp,hd,by omega⟩⟩
    apply hunit i
    have e : ((K.toNat:ℤ):ZMod i.val)=0 := by
      rw [Int.cast_natCast]; exact (ZMod.natCast_eq_zero_iff _ _).mpr ha
    rwa [hnat] at e
  refine ⟨⟨K.toNat,L,C,by omega,cop,?_,(shear t).trans (TunnellIdealFormBasis.basis s),?_⟩⟩
  · rw [hnat]; dsimp only [K,L]; linear_combination det
  · intro x; change ((TunnellIdealFormBasis.basis s) ((shear t) x)).val.norm=_
    rw [basis_norm s C hC,hnat]; congr 1
    dsimp [quad,shear,K,L,A,B]; ring

def Basis.atPrime {I : Ideal (R (2*d))} (L : Basis d I) (i : P d) : LocalBasis i.val I where
  A := L.a
  B := L.b
  C := L.c
  det := by simpa only [Nat.cast_mul,Nat.cast_ofNat] using L.det
  unit := by
    rw [Int.cast_natCast]; intro e
    have hp := (ZMod.natCast_eq_zero_iff _ _).mp e
    exact (prime i).out.not_dvd_one (L.cop ▸ Nat.dvd_gcd hp (Nat.dvd_of_mem_primeFactors i.property))
  basis := L.basis
  norm := L.norm

theorem character {I : Ideal (R (2*d))} (hn : Squarefree (2*d)) (h2 : (2*d)%4=2) (hI : I≠⊥) (L : Basis d I) (i : P d) :
    charI (p:=i.val) hn h2 hI=quadraticChar (ZMod i.val) (L.a:ZMod i.val) := by
  let x := L.basis (1,0)
  have he : (valence x:ℤ)=L.a := by
    simpa [x,Basis.atPrime,quad] using TunnellIntegralPacket.chart_value hn h2 hI (L.atPrime i) x
  have hx : (valence x:ZMod i.val)=L.a := by exact_mod_cast congrArg (fun z:ℤ => (z:ZMod i.val)) he
  have hu : (L.a:ZMod i.val)≠0 := by simpa [Basis.atPrime] using (L.atPrime i).unit
  exact (charI_eq hn h2 ((Nat.dvd_of_mem_primeFactors i.property).trans (dvd_mul_left ..)) hI x (hx ▸ hu)).trans (congrArg _ hx)

end
end TunnellUniformBasis
#print axioms TunnellUniformBasis.exists_basis
#print axioms TunnellUniformBasis.character

