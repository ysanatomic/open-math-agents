import TunnellGeometricPacket
import TunnellQuaternionUnits
import TunnellQuaternionResidue
import TunnellToricLocalSign
import TunnellJacobiFourSquares
import TunnellToricSquare
import TunnellTwoProjectionTransport

/-! Brandt coefficients compiled with the same Jacobi identities used in the class-theta series. -/


/-! The finite Gauss triangular product and its nilpotent stabilization. -/

namespace TunnellTriangular

open Polynomial Finset TunnellQBin
open LaurentPolynomial hiding C
open TunnellCubicFinite

variable {R : Type*} [CommRing R]

def plusFac (u : R) (n : ℕ) := ∏ j ∈ range n, (1+u^(j+1))

lemma odd_product (n : ℕ) :
    T ((n+1).choose 2:ℤ) * ∏ j ∈ range (2*n+1), (1+q^j*T (-(n:ℤ))) =
    2*(plusFac q n)^2 := by
  have he (j : ℕ) : 1+q^j*T (-(n:ℤ)) = 1+T ((j:ℤ)-n) := by
    simp only [q,T_pow,mul_one,←T_add,sub_eq_add_neg]
  have hs : (∏ j ∈ range (2*n+1), (1+(T ((j:ℤ)-n):L))) =
       (∏ j ∈ range n, (1+T (-(j+1:ℕ):ℤ))) * 2 * plusFac q n := by
    let f (j : ℕ) : L := 1+T ((j:ℤ)-n)
    change (∏ j ∈ range (2*n+1), f j) = _
    rw [show 2*n+1 = n+1+n by omega,prod_range_add,prod_range_succ,←prod_range_reflect f n]
    have hleft : (∏ x ∈ range n, f (n-1-x)) = ∏ j ∈ range n, (1+T (-(j+1:ℕ):ℤ)) := by
      apply prod_congr rfl
      intro i hi
      have := mem_range.mp hi
      dsimp [f]
      congr 2
      omega
    have hright : (∏ j ∈ range n, f (n+1+j)) = plusFac q n := by
      apply prod_congr rfl
      intro i hi
      simp only [f,q,T_pow,mul_one]
      congr 2
      omega
    rw [hleft,hright,show f n = 2 by simp [f]; ring]
  have hmul (N : ℕ) : T ((N+1).choose 2 : ℤ) *
        (∏ j ∈ range N, (1+(T (-(j+1:ℕ):ℤ):L))) = plusFac q N := by
    induction N with
    | zero => simp [plusFac]
    | succ N ih =>
      have hc : ((N+1+1).choose 2:ℤ) = ((N+1).choose 2:ℤ)+(N+1:ℕ) := by
        rw [Nat.choose_succ_succ,Nat.choose_one_right]
        push_cast; ring
      rw [hc,T_add,prod_range_succ,mul_mul_mul_comm,ih,show plusFac q (N+1) = plusFac q N * (1+q^(N+1)) by exact prod_range_succ ..]
      congr 1
      simp only [mul_add,mul_one,←T_add,add_neg_cancel,T_zero,q,T_pow]
      ring
  simp_rw [he]
  rw [hs]
  linear_combination 2*plusFac q n*hmul n

lemma triangular_laurent (n : ℕ) : plusFac q n ^ 2 =
    ∑ k ∈ range (n+1), q^((k+1).choose 2)*TunnellQBin.choose q (2*n+1) (n+1+k) := by
  let f (r : ℕ) : L := T ((n+1).choose 2:ℤ) *
      ((q^(r.choose 2)*TunnellQBin.choose q (2*n+1) r)*(T (-(n:ℤ)))^r)
  have hclean (r : ℕ) : f r = T (((n+1).choose 2:ℤ)+(r.choose 2:ℤ)-(n:ℤ)*r) *
      TunnellQBin.choose q (2*n+1) r := by
    simp only [f,q,T_pow,mul_one,sub_eq_add_neg,T_add]
    ring_nf
  have hpair (k : ℕ) (hk : k≤n) : f (n-k)+f (n+1+k) =
      2*(q^((k+1).choose 2)*TunnellQBin.choose q (2*n+1) (n+1+k)) := by
    have hc := choose_symm (2*n+1) (n-k) (by omega)
    rw [show 2*n+1-(n-k)=n+1+k by omega] at hc
    have hsub : ((n-k:ℕ):ℤ) = (n:ℤ)-k := Nat.cast_sub hk
    have hL : ((n+1).choose 2:ℤ) + ((n-k).choose 2:ℤ) - n*(n-k:ℕ) = ((k+1).choose 2:ℤ) := by
      have a := double_choose (n+1)
      have b := double_choose (n-k)
      have c := double_choose (k+1)
      rw [hsub] at b ⊢
      push_cast at a c
      nlinarith
    have hR : ((n+1).choose 2:ℤ) + ((n+1+k).choose 2:ℤ) - n*(n+1+k:ℕ) = ((k+1).choose 2:ℤ) := by
      have a := double_choose (n+1)
      have b := double_choose (n+1+k)
      have c := double_choose (k+1)
      push_cast at a b c ⊢
      nlinarith
    rw [hclean,hclean,hL,hR,hc]
    simp only [q,T_pow,mul_one]
    ring
  have ht : (2:L) ≠ 0 := fun e => (show (2:ℤ[X]) ≠ 0 by norm_num) (Polynomial.toLaurent_injective (by simpa only [map_ofNat,map_zero] using e))
  apply mul_left_cancel₀ ht
  rw [←odd_product n,expansion_eval,mul_sum,mul_sum]
  change (∑ r ∈ range (2*n+1+1), f r) = _
  rw [show 2*n+1+1=(n+1)+(n+1) by omega,sum_range_add,←sum_range_reflect f (n+1),←sum_add_distrib]
  apply sum_congr rfl
  intro k hk
  simpa only [Nat.add_sub_cancel] using hpair k (by have := mem_range.mp hk; omega)

theorem triangular (u : R) (n : ℕ) : plusFac u n ^ 2 =
    ∑ k ∈ range (n+1), u^((k+1).choose 2)*TunnellQBin.choose u (2*n+1) (n+1+k) := by
  have hp : plusFac (X:ℤ[X]) n ^ 2 =
      ∑ k ∈ range (n+1), X^((k+1).choose 2)*TunnellQBin.choose (X:ℤ[X]) (2*n+1) (n+1+k) := by
    apply Polynomial.toLaurent_injective
    simpa only [plusFac,map_pow,map_prod,map_add,map_one,map_sum,map_mul,map_choose,toLaurent_X]
      using triangular_laurent n
  let g := Polynomial.eval₂RingHom (Int.castRingHom R) u
  have hx : g X = u := by simp [g]
  simpa only [plusFac,map_pow,map_prod,map_add,map_one,map_sum,map_mul,map_choose,hx] using congrArg g hp


end TunnellTriangular


/-! The signed four-square theta series in a nilpotent quotient. -/

namespace TunnellQuaternionTheta

open Finset TunnellQBin TunnellTruncated TunnellTriangular

variable {R : Type*} [CommRing R]

lemma nil_pow {u : R} {d : ℕ} (hu : u^(d+1) = 0) {k : ℕ} (hk : k ≠ 0) :
    (u^k)^(d+1)=0 := by rw [←pow_mul,mul_comm,pow_mul,hu,zero_pow hk]

lemma plus_times_fac (u : R) (d : ℕ) : plusFac u d * fac u d = fac (u^2) d := by
  rw [plusFac,fac,fac,←prod_mul_distrib]
  apply prod_congr rfl
  intro i _
  rw [←pow_mul, mul_comm, pow_mul]
  ring

lemma triangular_sum {u : R} {d : ℕ} (hu : u^(d+1)=0) :
    (∑ k ∈ range (d+1), u^((k+1).choose 2)) * fac u d = fac (u^2) d ^ 2 := by
  let N := 2*d
  have hN : d ≤ N := by dsimp [N]; omega
  have hp : plusFac u N = plusFac u d := by
    apply (fac_unit u ⟨_,hu⟩ d).mul_left_injective
    change plusFac u N * fac u d = plusFac u d * fac u d
    calc plusFac u N * fac u d = plusFac u N * fac u N := by rw [fac_stable u hu hN]
         _ = _ := by rw [plus_times_fac,plus_times_fac,fac_stable (u^2) (nil_pow hu (by decide)) hN]
  have h := triangular u N
  rw [hp] at h
  have hs := congrArg (· * fac u d) h
  rw [sum_mul] at hs
  have hr (k : ℕ) (hk : k ≤ d) :
      u^((k+1).choose 2)*choose u (2*N+1) (N+1+k)*fac u d = u^((k+1).choose 2) := by
    rw [mul_assoc,choose_stable u hu _ _ (by dsimp [N]; omega) (by dsimp [N]; omega)
      (by dsimp [N]; omega),mul_one]
  have htail (k : ℕ) (hk : k ∉ range (d+1)) : u^((k+1).choose 2) = 0 := by
    have := triangle_ge k
    rw [mem_range] at hk
    exact pow_eq_zero_of_le (by omega) hu
  have ht : (∑ k ∈ range (N+1), u^((k+1).choose 2)*choose u (2*N+1) (N+1+k)*fac u d)
      = ∑ k ∈ range (d+1), u^((k+1).choose 2) := by
    rw [sum_subset (s₁:=range (d+1)) (s₂:=range (N+1)) (range_mono (by omega))
      (fun k _ hk => htail k hk)]
    apply sum_congr rfl
    intro k hk
    by_cases hk' : k ≤ d
    · exact hr k hk'
    · rw [htail k (by simpa using hk')]; ring
  rw [←ht,←hs,←plus_times_fac]
  ring

lemma fac_neg_product {t : R} {d : ℕ} (ht : t^(d+1)=0) :
    fac t d * fac (-t) d * fac (t^4) d = fac (t^2) d ^ 3 := by
  have he (s : R) (hs : s^(d+1)=0) : fac s d =
       fac (s^2) d * ∏ i ∈ range d, (1-s^(2*i+1)) := by
    simpa only [fac_stable s hs (show d ≤ 2*d by omega)] using fac_even_odd s d
  let u := t^2
  let A := ∏ i ∈ range d, (1-t^(2*i+1))
  let B := ∏ i ∈ range d, (1-(-t)^(2*i+1))
  have hAB : A*B = ∏ i ∈ range d, (1-u^(2*i+1)) := by
    rw [show A*B = ∏ i ∈ range d, (1-t^(2*i+1))*(1-(-t)^(2*i+1)) by exact prod_mul_distrib.symm]
    apply prod_congr rfl
    intro i _
    rw [Odd.neg_pow (show Odd (2*i+1) from ⟨i,rfl⟩)]
    rw [show u^(2*i+1) = (t^(2*i+1))^2 by dsimp [u]; rw [←pow_mul,mul_comm,pow_mul]]
    ring
  have hplus : fac t d = fac u d * A := he _ ht
  have hminus : fac (-t) d = fac u d * B := by
    simpa only [neg_sq] using he (-t) (by rw [neg_eq_neg_one_mul t,mul_pow,ht,mul_zero])
  have hdouble : fac u d = fac (t^4) d * (A*B) := by
    rw [hAB,←show u^2 = t^4 by dsimp [u]; rw [←pow_mul]]
    exact he _ (nil_pow ht (by decide))
  rw [hplus,hminus,hdouble]
  ring

lemma unsign (t : R) (j : ℤ) : ((j.negOnePow:ℤ):R)*(-t)^j.natAbs^2 = t^j.natAbs^2 := by
  rw [Int.coe_negOnePow,neg_eq_neg_one_mul t,mul_pow,←mul_assoc,←pow_add]
  have he (k : ℕ) : Even (k+k^2) := by
    obtain ⟨l,rfl|rfl⟩ := Nat.even_or_odd' k
    · exact ⟨l+2*l^2,by ring⟩
    · exact ⟨2*l^2+3*l+1,by ring⟩
  rw [(he _).neg_one_pow,one_mul]

theorem eta_four_factors (t : R) (d : ℕ) (ht : t^(d+1)=0) :
    (∑ k ∈ range (d+1), (t^2)^((k+1).choose 2)) *
      (∑ j ∈ Icc (-(d:ℤ)) (d:ℤ), ((j.negOnePow:ℤ):R)*t^(j.natAbs^2))^2 *
      (∑ j ∈ Icc (-(d:ℤ)) (d:ℤ), t^(j.natAbs^2)) = fac t d ^ 2 * fac (t^2) d ^ 2 := by
  let A := ∑ k ∈ range (d+1), (t^2)^((k+1).choose 2)
  let B := ∑ j ∈ Icc (-(d:ℤ)) (d:ℤ), ((j.negOnePow:ℤ):R)*t^(j.natAbs^2)
  let C := ∑ j ∈ Icc (-(d:ℤ)) (d:ℤ), t^(j.natAbs^2)
  let E := fac (t^2) d
  have ha : A*E = fac (t^4) d ^ 2 := by
    simpa only [A,E,← pow_mul] using triangular_sum (nil_pow ht (k:=2) (by decide))
  have he (u : R) (hu : u^(d+1)=0) := theta_stabilized u d (2*d) (by omega) hu (TunnellBalanced.balanced u (2*d))
  have hb : B*E = fac t d ^ 2 := (he t ht).symm
  have hc : C*E = fac (-t) d ^ 2 := by
    simpa only [unsign,neg_sq] using (he (-t) (by rw [neg_eq_neg_one_mul t,mul_pow,ht,mul_zero])).symm
  have hu : IsUnit E := fac_unit _ ⟨d+1,nil_pow ht (by decide)⟩ d
  have htr : A*B*C = E^3 := by
    apply (hu.pow 3).mul_left_injective
    calc A*B*C*E^3 = (A*E)*(B*E)*(C*E) := by ring
         _ = (fac t d * fac (-t) d * fac (t^4) d)^2 := by rw [ha,hb,hc]; ring
         _ = E^3*E^3 := by rw [fac_neg_product ht]; ring
  calc A*B^2*C = (A*B*C)*B := by ring
       _ = (B*E)*E^2 := by rw [htr]; ring
       _ = _ := by rw [hb]


end TunnellQuaternionTheta


/-! Coefficient of the norm shell for the four-square quaternion weight. -/

namespace TunnellQuaternionTheta

open Polynomial Finset TunnellQBin TunnellTruncated

theorem shell_coefficient (d : ℕ) :
    (X * ∏ i ∈ Icc 1 d, ((1-(X:ℤ[X])^(4*i))^2*(1-X^(8*i))^2)).coeff d =
      ∑ k ∈ range (d+1), ∑ r ∈ Icc (-(d:ℤ)) (d:ℤ), ∑ s ∈ Icc (-(d:ℤ)) (d:ℤ),
        ∑ t ∈ Icc (-(d:ℤ)) (d:ℤ),
          if (2*k+1)^2 + 4*(r.natAbs^2+s.natAbs^2+t.natAbs^2) = d
          then ((r+s).negOnePow:ℤ) else 0 := by
  let I := Icc (-(d:ℤ)) (d:ℤ)
  let u : ℤ[X] := X^4
  let a (k : ℕ) : ℤ[X] := (u^2)^((k+1).choose 2)
  let b (j : ℤ) : ℤ[X] := ((j.negOnePow:ℤ):ℤ[X]) * u^(j.natAbs^2)
  let c (j : ℤ) : ℤ[X] := u^(j.natAbs^2)
  let A := ∑ k ∈ range (d+1), a k
  let B := ∑ j ∈ I, b j
  let C₀ := ∑ j ∈ I, c j
  have hdiv : X^(d+1) ∣
      (X * ∏ i ∈ Icc 1 d, ((1-(X:ℤ[X])^(4*i))^2*(1-X^(8*i))^2)) - X*A*B^2*C₀ := by
    have hbase : (∏ i ∈ Icc 1 d, ((1-(X:ℤ[X])^(4*i))^2*(1-X^(8*i))^2)) =
        fac u d ^ 2 * fac (u^2) d ^ 2 := by
      simp only [prod_mul_distrib,prod_pow,u,←pow_mul,poly_fac]
    rw [hbase]
    apply (AdjoinRoot.mk_eq_mk).mp
    change trunc d _ = trunc d _
    have he := eta_four_factors (trunc d u) d (trunc_pow d 4 (by decide))
    simp only [A,B,C₀,a,b,c,I,map_mul,map_pow,map_fac,map_sum,map_intCast]
    rw [←he]
    ring
  have he := (X_pow_dvd_iff.mp hdiv) d (by omega)
  rw [coeff_sub,sub_eq_zero] at he
  rw [he]
  have hmono (k : ℕ) (r s t : ℤ) :
      (X*a k*b r*b s*c t).coeff d =
        if (2*k+1)^2+4*(r.natAbs^2+s.natAbs^2+t.natAbs^2)=d
        then ((r+s).negOnePow:ℤ) else 0 := by
    have hh : X*a k*b r*b s*c t =
        C ((r+s).negOnePow:ℤ) * X^((2*k+1)^2+4*(r.natAbs^2+s.natAbs^2+t.natAbs^2)) := by
      have hcast (z : ℤ) : Polynomial.C z = (z:ℤ[X]) := by
        simpa only [Int.cast_id] using (map_intCast (Polynomial.C : ℤ →+* ℤ[X]) z)
      rw [←TunnellJacobiFiniteBridge.exponent_eq k]
      simp only [a,b,c,u,Int.negOnePow_add,Units.val_mul, Int.cast_mul,pow_add,pow_mul,pow_one,hcast]
      ring
    rw [hh,coeff_C_mul_X_pow]
    split_ifs <;> first | rfl | contradiction | (exfalso; solve_by_elim [Eq.symm])
  have hsum : X*A*B^2*C₀ =
      ∑ k ∈ range (d+1), ∑ r ∈ I, ∑ s ∈ I, ∑ t ∈ I, X*a k*b r*b s*c t := by
    simp only [←Finset.sum_mul,←Finset.mul_sum, A,B,C₀,sq]
    ring
  rw [hsum]
  simp only [I,finsetSum_coeff,hmono]


end TunnellQuaternionTheta


/-! The signed conjugation average over the full integral quaternion norm shell. -/

namespace TunnellQuaternion

open Finset Quaternion TunnellShell Polynomial


abbrev Parameter := ℕ × ℤ × ℤ × ℤ

def paramNorm (u : Parameter) : ℕ := (2*u.1+1)^2+
  4*(u.2.1.natAbs^2+u.2.2.1.natAbs^2+u.2.2.2.natAbs^2)

def encode (u : Parameter) : QInt := ⟨2*(u.1:ℤ)+1,2*u.2.1,2*u.2.2.1,2*u.2.2.2⟩
def decode (q : QInt) : Parameter := (q.re.toNat/2,q.imI/2,q.imJ/2,q.imK/2)

def oddParams (p : ℕ) : Finset Parameter :=
  let I := Icc (-(p:ℤ)) (p:ℤ)
  ((range (p+1)) ×ˢ I ×ˢ I ×ˢ I).filter (fun u => paramNorm u=p)

lemma mem_oddParams {p : ℕ} {u : Parameter} : u ∈ oddParams p ↔ paramNorm u=p := by
  simp only [oddParams,mem_filter,mem_product,mem_range,mem_Icc]
  refine ⟨And.right,fun h => ⟨?_,h⟩⟩
  obtain ⟨k,r,s,t⟩ := u
  change (2*k+1)^2+4*(r.natAbs^2+s.natAbs^2+t.natAbs^2)=p at h
  have hh (z : ℤ) (hz : z.natAbs^2 ≤ p) : -(p:ℤ) ≤ z ∧ z ≤ p := by
    have := Nat.le_mul_self z.natAbs
    have := Int.natAbs_eq z
    rw [sq] at hz
    omega
  exact ⟨by nlinarith,hh r (by omega),hh s (by omega),hh t (by omega)⟩

lemma encode_norm (u : Parameter) : Quaternion.normSq (encode u) = (paramNorm u:ℤ) := by
  rw [Quaternion.normSq_def' (encode u)]
  rcases u with ⟨k,r,s,t⟩
  simp only [encode,paramNorm,Nat.cast_add,Nat.cast_mul,Nat.cast_one,
    Nat.cast_pow,Nat.cast_ofNat,Int.natAbs_sq]
  ring

lemma encode_decode {p : ℕ} {q : QInt} (hp : p%4=1) (hq : q ∈ quatShell p)
    (h₁ : q.re%2=1) (h₂ : 0 < q.re) : encode (decode q) = q := by
  have h := parity_count p (Nat.odd_iff.mpr (by omega)) hq
  rw [hp] at h
  ext <;> simp only [encode,decode] <;> omega

lemma decode_encode (u : Parameter) : decode (encode u) = u := by
  rcases u with ⟨k,r,s,t⟩
  ext <;> simp [decode,encode] <;> omega

def sign (u : Parameter) : ℤ := ((u.2.1+u.2.2.1).negOnePow:ℤ)

lemma eta_as_params (p : ℕ) :
    (X * ∏ i ∈ Icc 1 p, ((1-(X:ℤ[X])^(4*i))^2*(1-X^(8*i))^2)).coeff p =
      ∑ u ∈ oddParams p, sign u := by
  rw [TunnellQuaternionTheta.shell_coefficient,oddParams,sum_filter]
  simp only [sum_product,paramNorm,sign]
  rfl

lemma positive_section (p : ℕ) (hp : p%4=1) (v : Triple) :
    ∑ q ∈ quatShell p, (if q.re%2=1 ∧ 0<q.re then coordWeight (rotate q v) else 0) =
      (∑ u ∈ oddParams p, sign u)*coordWeight v := by
  rw [←sum_filter,sum_mul]
  symm
  apply sum_nbij' encode decode
  · intro u hu
    simp only [mem_filter,mem_quatShell,encode_norm,mem_oddParams.mp hu,true_and]
    change (2*(u.1:ℤ)+1)%2 = 1 ∧ 0<2*(u.1:ℤ)+1
    omega
  · intro q hq
    obtain ⟨h₁,h₂,h₃⟩ := mem_filter.mp hq
    rw [mem_oddParams, ←Nat.cast_inj (R:=ℤ),←encode_norm,encode_decode hp h₁ h₂ h₃,mem_quatShell.mp h₁]
  · exact fun u _ => decode_encode u
  · intro q hq
    obtain ⟨h₁,h₂,h₃⟩ := mem_filter.mp hq
    exact encode_decode hp h₁ h₂ h₃
  · intro u _
    exact (split_coord (u.1:ℤ) u.2.1 u.2.2.1 u.2.2.2 v).symm

lemma sum_neg (p : ℕ) (f : QInt → ℤ) : ∑ q ∈ quatShell p, f (-q) = ∑ q ∈ quatShell p, f q := by
  apply sum_nbij' Neg.neg Neg.neg
  · intro q h; simpa only [mem_quatShell,Quaternion.normSq_neg] using h
  · intro q h; simpa only [mem_quatShell,Quaternion.normSq_neg] using h
  · exact fun _ _ => neg_neg _
  · exact fun _ _ => neg_neg _
  · exact fun _ _ => rfl

lemma odd_section (p : ℕ) (v : Triple) :
    ∑ q ∈ quatShell p, (if q.re%2=1 then coordWeight (rotate q v) else 0) =
      2 * ∑ q ∈ quatShell p, (if q.re%2=1 ∧ 0<q.re then coordWeight (rotate q v) else 0) := by
  let f (q : QInt) := if q.re%2=1 ∧ 0<q.re then coordWeight (rotate q v) else 0
  have h (q : QInt) : (if q.re%2=1 then coordWeight (rotate q v) else 0) = f q + f (-q) := by
    have hr : rotate (-q) v = rotate q v := by simp [rotate]
    simp only [f,Quaternion.re_neg,hr,Int.neg_emod_two]
    split_ifs <;> omega
  simp_rw [h,sum_add_distrib,sum_neg]
  ring

def flipI (q : QInt) : QInt := ⟨q.re,-q.imI,q.imJ,q.imK⟩

lemma even_section (p : ℕ) (hp : p%4=3) (v : Triple) :
    ∑ q ∈ quatShell p, (if q.re%2=0 then coordWeight (rotate q v) else 0) = 0 := by
  let f (q : QInt) := if q.re%2=0 then coordWeight (rotate q v) else 0
  have hf (q : QInt) : Quaternion.normSq (flipI q) = Quaternion.normSq q := by
    rw [Quaternion.normSq_def' (flipI q),Quaternion.normSq_def' q]
    simp [flipI]
  have he : ∑ q ∈ quatShell p, f (flipI q) = ∑ q ∈ quatShell p, f q := by
    apply sum_nbij' flipI flipI
    · intro q h; simpa only [mem_quatShell,hf] using h
    · intro q h; simpa only [mem_quatShell,hf] using h
    · intro q _; ext <;> simp [flipI]
    · intro q _; ext <;> simp [flipI]
    · exact fun _ _ => rfl
  have hs (q : QInt) (hq : q ∈ quatShell p) : f (flipI q) = - f q := by
    have h := parity_count p (Nat.odd_iff.mpr (by omega)) hq
    rw [hp] at h
    by_cases ha : q.re%2=0
    · obtain ⟨a,b,c,d⟩ := q
      change a%2=0 at ha
      change a%2+b%2+c%2+d%2=(3:ℤ) at h
      simp only [f,flipI,if_pos ha]
      obtain ⟨k,rfl⟩ : ∃ k, a=2*k := ⟨a/2,by omega⟩
      obtain ⟨r,rfl⟩ : ∃ r, b=2*r+1 := ⟨b/2,by omega⟩
      obtain ⟨s,rfl⟩ : ∃ s, c=2*s+1 := ⟨c/2,by omega⟩
      obtain ⟨t,rfl⟩ : ∃ t, d=2*t+1 := ⟨d/2,by omega⟩
      exact inert_coord k r s t v
    · simp only [f,flipI,if_neg ha,neg_zero]
  rw [sum_congr rfl hs,sum_neg_distrib] at he
  change ∑ q ∈ quatShell p, f q = 0
  omega

noncomputable abbrev etaCoeff (p : ℕ) : ℤ :=
  (X * ∏ i ∈ Icc 1 p, ((1-(X:ℤ[X])^(4*i))^2*(1-X^(8*i))^2)).coeff p

lemma coord_average (p : ℕ) (hp : Odd p) (v : Triple) :
    ∑ q ∈ quatShell p, coordWeight (rotate q v) = 8*etaCoeff p*coordWeight v := by
  rw [four_sections p hp]
  by_cases h : p%4=1
  · simp only [h,if_true]
    rw [odd_section,positive_section p h,←eta_as_params]
    ring
  · have h3 : p%4=3 := by have ho := Nat.odd_iff.mp hp; omega
    simp only [h,if_false,even_section p h3,mul_zero]
    have hn : oddParams p = ∅ := by
      apply eq_empty_iff_forall_notMem.mpr
      intro u hu
      have hq : encode u ∈ quatShell p := by rw [mem_quatShell,encode_norm,mem_oddParams.mp hu]
      have hh := parity_count p hp hq
      rw [h3] at hh
      simp only [encode] at hh
      omega
    rw [etaCoeff,eta_as_params,hn,sum_empty]
    ring

def cycleQ (q : QInt) : QInt := ⟨q.re,q.imJ,q.imK,q.imI⟩

lemma cycle_rotate (q : QInt) (v : Triple) : rot (rotate q v) = rotate (cycleQ q) (rot v) := by
  obtain ⟨a,b,c,d⟩ := q
  obtain ⟨x,y,z⟩ := v
  simp only [cycleQ,rot,rotate_apply]
  ext <;> ring

lemma sum_cycle (p : ℕ) (f : QInt → ℤ) : ∑ q ∈ quatShell p, f (cycleQ q) = ∑ q ∈ quatShell p, f q := by
  have h (q : QInt) : Quaternion.normSq (cycleQ q) = Quaternion.normSq q := by
    rw [Quaternion.normSq_def' (cycleQ q),Quaternion.normSq_def' q]
    simp only [cycleQ]
    ring
  apply sum_nbij' cycleQ (fun q => cycleQ (cycleQ q))
  · intro q hq; simpa only [mem_quatShell,h] using hq
  · intro q hq; simpa only [mem_quatShell,h] using hq
  · exact fun q _ => rfl
  · exact fun q _ => rfl
  · exact fun q _ => rfl

theorem raw_eigenvalue (p : ℕ) (hp : Odd p) (v : Triple) :
    ∑ q ∈ quatShell p, weight (rotate q v) = 8 * etaCoeff p * weight v := by
  simp only [weight,Finset.sum_add_distrib,cycle_rotate]
  rw [sum_cycle p (fun q => coordWeight (rotate q (rot v))),
    sum_cycle p (fun q => coordWeight (rotate (cycleQ q) (rot (rot v)))),
    sum_cycle p (fun q => coordWeight (rotate q (rot (rot v))))]
  simp only [coord_average p hp,mul_add]


end TunnellQuaternion


/-! The two-dimensional Brandt theta kernel of the order at 2. -/
namespace TunnellBrandt
open TunnellHurwitzFour TunnellToricSign TunnellShell TunnellQuaternion Finset


def integral (q : QInt) : H ℤ := (q.re-q.imK,q.imI-q.imK,q.imJ-q.imK,2*q.imK)

lemma integral_norm (q : QInt) : nr (integral q)=Quaternion.normSq q := by
  obtain ⟨a,b,c,d⟩ := q; dsimp [integral,nr]; rw [normSq_mk]; ring

lemma integral_injective : Function.Injective integral := by
  rintro ⟨a,b,c,d⟩ ⟨e,f,g,h⟩ he
  simp only [integral,Prod.mk.injEq] at he
  apply QuaternionAlgebra.ext <;> dsimp only <;> omega

lemma even_integral (x : H ℤ) : Even x.2.2.2 ↔ ∃ q, integral q=x := by
  obtain ⟨a,b,c,d⟩ := x
  constructor
  · rintro ⟨k,hk⟩
    change d=k+k at hk
    exact ⟨⟨a+k,b+k,c+k,k⟩,by simp [integral,Prod.ext_iff]; omega⟩
  · rintro ⟨q,hq⟩; have he := congrArg (fun z:H ℤ => z.2.2.2) hq
    exact ⟨q.imK,by dsimp [integral] at he; dsimp; omega⟩

def U {R : Type*} [CommRing R] (i : Fin 3) : H R := ![(1,0,0,0),(0,0,0,1),(-1,0,0,1)] i
def V {R : Type*} [CommRing R] (i : Fin 3) : H R := ![(1,0,0,0),(1,0,0,-1),(0,0,0,-1)] i

lemma cancel_U {R : Type*} [CommRing R] (i : Fin 3) (x : H R) : prod (V i) (prod (U i) x)=x := by
  obtain ⟨a,b,c,d⟩ := x; fin_cases i <;> simp [prod,U,V,Prod.ext_iff] <;> ring_nf <;> simp
lemma cancel_V {R : Type*} [CommRing R] (i : Fin 3) (x : H R) : prod (U i) (prod (V i) x)=x := by
  obtain ⟨a,b,c,d⟩ := x; fin_cases i <;> simp [prod,U,V,Prod.ext_iff] <;> ring_nf <;> simp
lemma norm_U {R : Type*} [CommRing R] (i : Fin 3) (x : H R) : nr (prod (U i) x)=nr x := by
  obtain ⟨a,b,c,d⟩ := x; fin_cases i <;> dsimp [U,prod,nr] <;> ring

def red2 (x : H ℤ) : H (ZMod 2) := (x.1,x.2.1,x.2.2.1,x.2.2.2)

lemma uniqueness_table : ∀ x : H (ZMod 2), nr x=1 → ∃ i:Fin 3, (prod (V i) x).2.2.2=0 ∧ ∀ j:Fin 3, (prod (V j) x).2.2.2=0 → j=i := by decide

lemma unique_copy {x : H ℤ} (h : Odd (nr x)) : ∃! i:Fin 3, Even (prod (V i) x).2.2.2 := by
  have hn : nr (red2 x)=((nr x:ℤ):ZMod 2) := by obtain ⟨a,b,c,d⟩ := x; simp [red2,nr]
  have heq : ((nr x:ℤ):ZMod 2)=1 := by
    apply ZMod.val_injective; have H := ZMod.val_intCast (n:=2) (nr x); have e := Int.odd_iff.mp h; change _=1; omega
  rw [heq] at hn
  obtain ⟨i,hi,hu⟩ := uniqueness_table (red2 x) hn
  have he (j : Fin 3) : (prod (V j) (red2 x)).2.2.2=0 ↔ Even (prod (V j) x).2.2.2 := by
    have e : (prod (V j) (red2 x)).2.2.2=(((prod (V j) x).2.2.2:ℤ):ZMod 2) := by
      have rem : ∀ a b : ZMod 2, a-b=a+b := by decide
      obtain ⟨a,b,c,d⟩ := x; fin_cases j <;> simp [prod,red2,V,rem]
    rw [e,ZMod.intCast_zmod_eq_zero_iff_dvd,even_iff_two_dvd]; rfl
  exact ⟨i,(he i).mp hi,fun j hj => hu j ((he j).mpr hj)⟩

def encode (p : Fin 3 × QInt) : H ℤ := prod (U p.1) (integral p.2)

def normShell (m : ℕ) : Finset (H ℤ) := (univ ×ˢ quatShell m).image encode

lemma mem_normShell {m : ℕ} (hm : Odd m) (q : H ℤ) : q∈normShell m ↔ nr q=(m:ℤ) := by
  constructor
  · rintro h; obtain ⟨⟨i,r⟩,hp,rfl⟩ := mem_image.mp h
    exact (norm_U i _).trans ((integral_norm r).trans (mem_quatShell.mp (mem_product.mp hp).2))
  · intro h
    obtain ⟨i,hi,_⟩ := unique_copy (h ▸ (by exact_mod_cast hm : Odd (m:ℤ)))
    obtain ⟨r,hr⟩ := (even_integral _).mp hi
    have he : encode (i,r)=q := by rw [encode,hr,cancel_V]
    have heq : Quaternion.normSq r=(m:ℤ) := by rw [←integral_norm,←h,←he]; exact (norm_U i _).symm
    exact mem_image.mpr ⟨(i,r),mem_product.mpr ⟨mem_univ _,mem_quatShell.mpr heq⟩,he⟩

lemma encode_inj {m : ℕ} (hm : Odd m) : Set.InjOn encode ((univ ×ˢ quatShell m : Finset (Fin 3 × QInt)):Set _) := by
  rintro ⟨i,q⟩ hq ⟨j,r⟩ hr he
  have hnorm : nr (encode (i,q))=m := (norm_U i _).trans ((integral_norm q).trans (mem_quatShell.mp (mem_product.mp hq).2))
  have hodd : Odd (nr (encode (i,q))) := by rw [hnorm]; exact_mod_cast hm
  obtain ⟨k,hk,hu⟩ := unique_copy hodd
  have hside (i : Fin 3) (q : QInt) : Even (prod (V i) (encode (i,q))).2.2.2 := by
    rw [encode,cancel_U]; exact (even_integral _).mpr ⟨q,rfl⟩
  have hi := hu i (hside i q)
  have hj := hu j (he ▸ hside j r)
  obtain rfl : i=j := hi.trans hj.symm
  have e := congrArg (prod (V i)) he
  change prod (V i) (prod (U i) (integral q))=prod (V i) (prod (U i) (integral r)) at e
  rw [cancel_U,cancel_U] at e
  rw [integral_injective e]

set_option maxRecDepth 10000 in
set_option maxHeartbeats 2000000 in
lemma char_U_table : ∀ q ∈ units, ∀ i : Fin 3, character (prod (U i) q)=character q := by decide

lemma char_U {q : H ℤ} (hq : Odd (nr q)) (i : Fin 3) : character (modFour (prod (U i) q))=character (modFour q) := by
  rw [modFour_mul]
  have he : modFour (U i)=U i := by fin_cases i <;> rfl
  rw [he]; exact char_U_table _ (odd_units q hq) i

lemma integral_rot (q : QInt) (v : Triple) : TunnellToricSign.rotate (integral q) v=TunnellQuaternion.rotate q v := by
  obtain ⟨a,b,c,d⟩ := q; obtain ⟨x,y,z⟩ := v
  rw [rotate_apply]
  simp only [integral,TunnellToricSign.rotate,Prod.mk.injEq]
  exact ⟨by ring,by ring,by ring⟩

lemma weight_color {v : Triple} (hx : Odd v.1) (hy : Odd v.2.1) (hz : Even v.2.2) : weight v=color (redVec v) := by
  obtain ⟨x,y,z⟩ := v
  change Odd x at hx; change Odd y at hy; change Even z at hz
  have hA := ZMod.val_intCast (n:=8) x
  have hB := ZMod.val_intCast (n:=8) y
  have hC := ZMod.val_intCast (n:=8) z
  have eA := Int.odd_iff.mp hx
  have eB := Int.odd_iff.mp hy
  have hx' : (x:Z8).val%2≠0 := by omega
  have hy' : (y:Z8).val%2≠0 := by omega
  have h0 : (z:Z8)=0 ↔ z%8=0 := by rw [←(ZMod.val_injective 8).eq_iff]; change _=0 ↔ _; omega
  have h4 : (z:Z8)=4 ↔ z%8=4 := by rw [←(ZMod.val_injective 8).eq_iff]; change _=4 ↔ _; omega
  simp [weight,rot,coordWeight_eq,Int.not_odd_iff_even.mpr hz,hx,hy,color,redVec,hx',hy',h0,h4,lastWeight]

lemma integral_char {q : QInt} (hq : Odd (Quaternion.normSq q)) :
    character (modFour (integral q))=weight (TunnellQuaternion.rotate q (1,1,0)) := by
  have hc := color_rotate (v:=(1,1,0)) (by decide) (by decide) (by decide) (q:=integral q) (by rwa [integral_norm])
  rw [integral_rot,show color (redVec (1,1,0))=1 by decide,mul_one] at hc
  rw [←hc]
  apply Eq.symm
  apply weight_color
  all_goals obtain ⟨a,b,c,d⟩ := q; rw [normSq_mk] at hq; rw [rotate_apply]; dsimp only
  · obtain ⟨k,h⟩ := hq; exact ⟨k-c^2-d^2+b*c-a*d,by linear_combination h⟩
  · obtain ⟨k,h⟩ := hq; exact ⟨k-b^2-d^2+b*c+a*d,by linear_combination h⟩
  · exact ⟨b*d-a*c+c*d+a*b,by ring⟩

theorem signed_lipschitz {m : ℕ} (hm : Odd m) :
    ∑ q∈quatShell m, character (modFour (integral q))=8*etaCoeff m := by
  calc (∑ q∈quatShell m, character (modFour (integral q))) = ∑ q∈quatShell m,weight (TunnellQuaternion.rotate q (1,1,0)) := by
         apply sum_congr rfl; intro q hq
         exact integral_char (by rw [mem_quatShell.mp hq]; exact_mod_cast hm)
       _ = _ := by rw [raw_eigenvalue m hm,show weight (1,1,0)=1 by decide,mul_one]

theorem signed_hurwitz {m : ℕ} (hm : Odd m) : ∑ q∈normShell m,character (modFour q)=24*etaCoeff m := by
  rw [normShell,sum_image (encode_inj hm),sum_product]
  have h (i : Fin 3) : (∑ q ∈ quatShell m,character (modFour (encode (i,q))))=8*etaCoeff m := by
    rw [←signed_lipschitz hm]
    apply sum_congr rfl; intro q hq
    apply char_U
    rw [integral_norm,mem_quatShell.mp hq]; exact_mod_cast hm
  simp only [h,sum_const,card_univ,Fintype.card_fin,nsmul_eq_mul]; ring

theorem hurwitz_card {m : ℕ} (hm : Odd m) : (normShell m).card=24*∑ d∈m.divisors,d := by
  rw [normShell,card_image_of_injOn (encode_inj hm),card_product,card_univ,Fintype.card_fin,
    quatShell_card_divisors (show m≠0 by rintro rfl; simp at hm)]
  have he : (m.divisors.filter fun d => ¬4∣d)=m.divisors := by
    apply filter_true_of_mem
    intro d hd h4
    have he : (2:ℕ)∣m := (show (2:ℕ)∣4 by decide).trans (h4.trans (Nat.dvd_of_mem_divisors hd))
    exact (Nat.not_even_iff_odd.mpr hm) (even_iff_two_dvd.mpr he)
  rw [he]; ring

set_option maxRecDepth 10000 in
set_option maxHeartbeats 2000000 in
lemma swap_character : ∀ q ∈ units, character (prod q tau)= -character q := by decide

end TunnellBrandt


/-! The cuspidal projection of the norm kernel of the two-element quaternionic Shimura set. -/
namespace TunnellBrandt
open TunnellHurwitzFour TunnellToricSign TunnellShell TunnellQuaternion Finset
open scoped Classical

def sign : Bool → ℤ | true => -1 | false => 1
def label (q : H4) : Bool → ℤ | true => character (prod q tau) | false => character q

def count (m : ℕ) (i j : Bool) : ℕ := ((normShell m).filter (fun q => label (modFour q) i=sign j)).card

/-- Dividing norm generators by the twenty-four units gives the Brandt coefficient. -/
def entry (m : ℕ) (i j : Bool) : ℚ := (count m i j)/24

lemma count_eq {m : ℕ} (hm : Odd m) (i j : Bool) :
    2*(count m i j:ℤ)=24*(∑ d∈m.divisors,(d:ℤ))+24*sign i*sign j*etaCoeff m := by
  let S := normShell m
  let P := fun q : H ℤ => label (modFour q) i=sign j
  have hc : (count m i j:ℤ)=∑ q∈S, if P q then 1 else 0 := by
    rw [←sum_filter]; simp [count,S,P]
  have ht (q : H ℤ) (hq : q∈S) : 2*(if P q then (1:ℤ) else 0)=1+sign i*sign j*character (modFour q) := by
    have hodd : Odd (nr q) := by rw [(mem_normShell hm q).mp hq]; exact_mod_cast hm
    have hτ := swap_character _ (odd_units q hodd)
    have hv : label (modFour q) i=sign i*character (modFour q) := by
      cases i
      · exact (one_mul (character (modFour q))).symm
      · exact hτ.trans (neg_one_mul (character (modFour q))).symm
    have hsign (i : Bool) : sign i=1 ∨ sign i= -1 := by cases i <;> decide
    have hchar : character (modFour q)=1 ∨ character (modFour q)= -1 := by unfold character; split <;> simp
    have ident (u v t : ℤ) (hu : u=1 ∨ u= -1) (hv : v=1 ∨ v= -1) (ht : t=1 ∨ t= -1) :
        2*(if u*t=v then (1:ℤ) else 0)=1+u*v*t := by
      rcases hu with rfl|rfl <;> rcases hv with rfl|rfl <;> rcases ht with rfl|rfl <;> decide
    change 2*(if label (modFour q) i=sign j then (1:ℤ) else 0)=_
    rw [hv]
    exact ident _ _ _ (hsign i) (hsign j) hchar
  have he : ((S.card:ℕ):ℤ)=24*∑ d∈m.divisors,(d:ℤ) := by
    change ((normShell m).card:ℤ)=_
    rw [hurwitz_card hm]; push_cast; rfl
  rw [hc,mul_sum,sum_congr rfl ht,sum_add_distrib,←mul_sum,signed_hurwitz hm]
  simp only [sum_const,nsmul_eq_mul,mul_one]; rw [he]; ring

theorem entry_eq {m : ℕ} (hm : Odd m) (i j : Bool) :
    2*entry m i j=(∑ d∈m.divisors,(d:ℚ))+(sign i:ℚ)*(sign j:ℚ)*(etaCoeff m:ℚ) := by
  have h := congrArg (fun t:ℤ => (t:ℚ)) (count_eq hm i j)
  push_cast at h
  unfold entry
  linear_combination h / 24

theorem cm_height {m : ℕ} (hm : Odd m) {T : Type*} [Fintype T] (c : T → Bool) :
    2*(∑ a:T,∑ b:T,entry m (c a) (c b)) =
      (Fintype.card T:ℚ)^2*(∑ d∈m.divisors,(d:ℚ))+
      (∑ a:T,(sign (c a):ℚ))^2*(etaCoeff m:ℚ) := by
  let σ : ℚ := ∑ d∈m.divisors,(d:ℚ)
  let f : T → ℚ := fun a => sign (c a)
  change 2*(∑ a:T,∑ b:T,entry m (c a) (c b)) = (Fintype.card T:ℚ)^2*σ+(∑ a:T,f a)^2*(etaCoeff m:ℚ)
  have he (a b : T) : 2*entry m (c a) (c b)=σ+f a*(f b*(etaCoeff m:ℚ)) := by rw [entry_eq hm]; dsimp [σ,f]; ring
  simp only [mul_sum,he,sum_add_distrib,sum_const,card_univ,nsmul_eq_mul]
  simp_rw [←mul_sum]
  simp only [←sum_mul]
  ring

def which (q : H4) : Bool := if q∈orbit e then false else true
lemma sign_which (q : H4) : sign (which q)=character q := by
  unfold which character
  split <;> rfl

/-- The arithmetic cuspidal part of the CM-pair norm theta series. -/
theorem projected_height (d : ℕ) (hsq : Squarefree d) (hd : d%4=1) :
    ∃ (v : Triple) (hv : v∈shell (2*d)) (hs : Squarefree (2*d)) (h₂ : (2*d)%4=2),
      let e := TunnellToricClass.idealEquiv hs h₂ hv
      letI := Fintype.ofEquiv ↥(TunnellToric.representatives (2*d)) e.symm
      ∃ localGen : TunnellToricClass.ProperIdealClass v → H ℤ, (∀ c, LocalGenerator v (e c).val (localGen c)) ∧
        ∀ m, Odd m → 2*(∑ a,∑ b,entry m (which (modFour (localGen a))) (which (modFour (localGen b)))) =
          (Fintype.card (TunnellToricClass.ProperIdealClass v):ℚ)^2*(∑ k∈m.divisors,(k:ℚ))+
          (TunnellShell.b d:ℚ)^2*(etaCoeff m:ℚ) := by
  classical
  obtain ⟨v,hv,hs,h₂,hh⟩ := toric_square d hsq hd
  refine ⟨v,hv,hs,h₂,?_⟩
  dsimp only at hh ⊢
  let e := TunnellToricClass.idealEquiv hs h₂ hv
  letI := Fintype.ofEquiv ↥(TunnellToric.representatives (2*d)) e.symm
  obtain ⟨g,hg,h⟩ := hh
  refine ⟨g,hg,?_⟩
  intro m hm
  rw [cm_height hm (fun a => which (modFour (g a)))]
  simp_rw [sign_which]
  have e' := congrArg (fun z:ℤ => (z:ℚ)) h
  push_cast at e'
  rw [e']

end TunnellBrandt


/-! Exact comparison between an individual dyadic congruence and the Brandt double-coset entry. -/
namespace TunnellBrandtDoubleCoset
open TunnellBrandt TunnellHurwitzFour TunnellTwoProjectionTransport TunnellRamifiedTwoOrder TunnellHurwitz TunnellToricSign TunnellToric
open Finset
noncomputable section

def rep : Bool → H4 | true => tau | false => e
def indicator (s x t : H4) : ℕ := if prod (prod (bar s) x) t∈orderUnits then 1 else 0
def raw (m : ℕ) (s t : H4) := ∑ q∈normShell m,indicator s (modFour q) t

lemma hmul_assoc {R : Type*} [CommRing R] (s t u : H R) : prod (prod s t) u=prod s (prod t u) := by
  rcases s with ⟨a,b,c,d⟩; rcases t with ⟨e,f,g,h⟩; rcases u with ⟨i,j,k,l⟩
  refine Prod.ext ?_ (Prod.ext ?_ (Prod.ext ?_ ?_)); all_goals dsimp [prod]; ring
lemma bar_mul {R : Type*} [CommRing R] (s t : H R) : bar (prod s t)=prod (bar t) (bar s) := by
  rcases s with ⟨a,b,c,d⟩; rcases t with ⟨e,f,g,h⟩
  refine Prod.ext ?_ (Prod.ext ?_ (Prod.ext ?_ ?_)); all_goals dsimp [bar,prod]; ring

lemma red_bar (q : H ℤ) : modFour (bar q)=bar (modFour q) := by simp [modFour,bar]

lemma one_mul4 (q : H4) : prod e q=q := by rcases q with ⟨a,b,c,d⟩; simp [e,prod]
lemma mul_one4 (q : H4) : prod q e=q := by rcases q with ⟨a,b,c,d⟩; simp [e,prod]

set_option maxRecDepth 10000 in
lemma order_closed : ∀ a ∈ orderUnits, ∀ b ∈ orderUnits, prod a b ∈ orderUnits := by decide
set_option maxRecDepth 10000 in
lemma order_inverse : ∀ a ∈ orderUnits, ∃ b∈orderUnits, prod a b=e ∧ prod b a=e := by decide
set_option maxRecDepth 10000 in
lemma order_bar : ∀ a∈orderUnits, bar a∈orderUnits := by decide

lemma coset_action (u : H4) (hu : u∈orderUnits) (x : H4) :
    (prod (bar u) x∈orderUnits ↔ x∈orderUnits) ∧ (prod x u∈orderUnits ↔ x∈orderUnits) := by
  obtain ⟨v,hv,e,_⟩ := order_inverse u hu
  obtain ⟨w,hw,_,e'⟩ := order_inverse (bar u) (order_bar u hu)
  constructor
  · refine ⟨fun h => ?_,order_closed _ (order_bar u hu) _⟩
    have H := order_closed _ hw _ h
    rwa [←hmul_assoc,e',one_mul4] at H
  · refine ⟨fun h => ?_,fun h => order_closed _ h _ hu⟩
    have H := order_closed _ h _ hv
    rwa [hmul_assoc,e,mul_one4] at H

lemma iso (s x t a b u v : H4) (hu : u∈orderUnits) (hv : v∈orderUnits) :
    indicator (prod (prod a s) u) x (prod (prod b t) v) = indicator s (prod (prod (bar a) x) b) t := by
  unfold indicator
  have e : prod (prod (bar (prod (prod a s) u)) x) (prod (prod b t) v)=
      prod (bar u) (prod (prod (prod (bar s) (prod (prod (bar a) x) b)) t) v) := by
    simp only [bar_mul,hmul_assoc]
  simp only [e,(coset_action _ hu _).1,(coset_action _ hv _).2]

lemma orbit_rep {s : H4} (hs : s∈units) : ∃ a ∈ globalUnits, ∃ u∈orderUnits, prod (prod a (rep (which s))) u=s := by
  have he : s∈orbit (rep (which s)) := by
    by_cases h : s∈orbit e
    · simpa [which,h,rep] using h
    · have h' : s∈orbit tau := (mem_union.mp (two_orbits.1.symm ▸ hs)).resolve_left h
      simpa [which,h,rep] using h'
  obtain ⟨⟨a,u⟩,hu,e⟩ := mem_image.mp he
  exact ⟨a,(mem_product.mp hu).1,u,(mem_product.mp hu).2,e⟩

lemma nr_prod (x y : H ℤ) : nr (prod x y)=nr x*nr y := by
  have H := congrArg Quaternion.normSq (hamZ_mul x y)
  rw [map_mul,norm_ham,norm_ham,norm_ham] at H
  exact_mod_cast H
lemma nr_bar (x : H ℤ) : nr (bar x)=nr x := by rcases x with ⟨a,b,c,d⟩; dsimp [nr,bar]; ring

lemma bcancel {u : H ℤ} (hu : nr u=1) (x : H ℤ) : prod (bar u) (prod u x)=x ∧ prod (prod x u) (bar u)=x := by
  have e : Quaternion.normSq (hamZ u)=1 := by rw [norm_ham,hu]; norm_num
  constructor <;> apply ham_injective
  · rw [hamZ_mul,hamZ_mul,ham_bar,←mul_assoc,Quaternion.star_mul_self,e,Quaternion.coe_one,one_mul]
  · rw [hamZ_mul,hamZ_mul,ham_bar,mul_assoc,Quaternion.self_mul_star,e,Quaternion.coe_one,mul_one]

lemma bar_bar {R : Type*} [CommRing R] (q : H R) : bar (bar q)=q := by rcases q with ⟨a,b,c,d⟩; simp [bar]

lemma sum_unit {m : ℕ} (hm : Odd m) {u : H ℤ} (hu : nr u=1) (f : H4→ℕ) :
    (∑ q∈normShell m,f (prod (modFour u) (modFour q)))=(∑ q∈normShell m,f (modFour q)) ∧
    (∑ q∈normShell m,f (prod (modFour q) (modFour u)))=(∑ q∈normShell m,f (modFour q)) := by
  have h₁ := (nr_bar u).trans hu
  constructor
  · apply sum_nbij' (prod u) (prod (bar u))
    · intro q hq; rw [mem_normShell hm,nr_prod,hu,one_mul]; exact (mem_normShell hm q).mp hq
    · intro q hq; rw [mem_normShell hm,nr_prod,h₁,one_mul]; exact (mem_normShell hm q).mp hq
    · exact fun q _ => (bcancel hu q).1
    · intro q _; simpa only [bar_bar] using (bcancel h₁ q).1
    · intro q _; rw [modFour_mul]
  · apply sum_nbij' (fun q=>prod q u) (fun q=>prod q (bar u))
    · intro q hq; rw [mem_normShell hm,nr_prod,hu,mul_one]; exact (mem_normShell hm q).mp hq
    · intro q hq; rw [mem_normShell hm,nr_prod,h₁,mul_one]; exact (mem_normShell hm q).mp hq
    · exact fun q _ => (bcancel hu q).2
    · intro q _; simpa only [bar_bar] using (bcancel h₁ q).2
    · intro q _; rw [modFour_mul]

lemma raw_reps {m : ℕ} (hm : Odd m) {s t : H4} (hs : s∈units) (ht : t∈units) :
    raw m s t=raw m (rep (which s)) (rep (which t)) := by
  obtain ⟨a,ha,u,hu,ea⟩ := orbit_rep hs
  obtain ⟨b,hb,v,hv,eb⟩ := orbit_rep ht
  obtain ⟨A,hA,rfl⟩ := (global_iff a).mp ha
  obtain ⟨B,hB,rfl⟩ := (global_iff b).mp hb
  unfold raw
  conv_lhs => rw [←ea,←eb]
  simp_rw [iso _ _ _ _ _ _ _ hu hv,hmul_assoc (bar (modFour A))]
  have h₁ := (sum_unit hm hB (fun x => indicator (rep (which s)) (prod (bar (modFour A)) x) (rep (which t)))).2
  have h₂ := (sum_unit hm ((nr_bar A).trans hA) (fun x => indicator (rep (which s)) x (rep (which t)))).1
  rw [red_bar] at h₂
  exact h₁.trans h₂

lemma global_prod {a b : H4} (ha : a∈globalUnits) (hb : b∈globalUnits) : prod a b∈globalUnits := by
  obtain ⟨A,hA,rfl⟩ := (global_iff a).mp ha; obtain ⟨B,hB,rfl⟩ := (global_iff b).mp hb
  exact (global_iff _).mpr ⟨prod A B,by rw [nr_prod,hA,hB,one_mul],modFour_mul _ _⟩

lemma global_right {a : H4} (ha : a∈globalUnits) (f : H4→ℕ) :
    (∑ h∈globalUnits, f (prod h a))=∑ h∈globalUnits,f h := by
  obtain ⟨A,hA,rfl⟩ := (global_iff a).mp ha
  have hb : modFour (bar A)∈globalUnits := (global_iff _).mpr ⟨_,(nr_bar A).trans hA,rfl⟩
  apply sum_nbij' (fun h=>prod h (modFour A)) (fun h=>prod h (modFour (bar A)))
  · exact fun _ ht => global_prod ht ha
  · exact fun _ ht => global_prod ht hb
  · intro h hh; obtain ⟨C,_,rfl⟩ := (global_iff _).mp hh
    rw [←modFour_mul,←modFour_mul,(bcancel hA C).2]
  · intro h hh; obtain ⟨C,_,rfl⟩ := (global_iff _).mp hh
    have he := (bcancel ((nr_bar A).trans hA) C).2; rw [bar_bar] at he
    rw [←modFour_mul,←modFour_mul,he]
  · simp

lemma rep_e {R : Type*} [CommRing R] (x : H R) : prod x (1,0,0,0)=x := by rcases x with ⟨a,b,c,d⟩; simp [prod]

set_option maxRecDepth 10000 in
set_option maxHeartbeats 1000000 in
lemma average_table (s t : Bool) (x : H4) (hx : x∈units) :
    (∑ h∈globalUnits, indicator (rep s) (prod h x) (rep t))=if label x t=sign s then 2 else 0 := by
  let z := prod x (rep t)
  have hZ : z∈units := by
    have he (u : H4) (hu : u∈units) : prod u tau∈units := by
      have H : nr (prod u tau)=nr u := by
        rcases u with ⟨a,b,c,d⟩
        rw [←sub_eq_zero]; dsimp [nr,prod,tau]; ring_nf; simp [show (4:Z4)=0 by decide,show (8:Z4)=0 by decide]
      exact mem_filter.mpr ⟨mem_univ _,H ▸ (mem_filter.mp hu).2⟩
    cases t
    · simpa [z,rep,e,rep_e] using hx
    · exact he _ hx
  have hlabel : label x t=character z := by cases t <;> simp [label,z,rep,e,rep_e]
  rw [hlabel,←sign_which]
  obtain ⟨a,ha,u,hu,ez⟩ := orbit_rep hZ
  let k := which z
  let F (h : H4) := if prod (bar (rep s)) (prod h (rep k))∈orderUnits then 1 else 0
  have he (h : H4) : indicator (rep s) (prod h x) (rep t)=F (prod h a) := by
    unfold indicator F
    have hh : prod (prod (bar (rep s)) (prod h x)) (rep t) = prod (prod (bar (rep s)) (prod (prod h a) (rep k))) u := by
      calc _ = prod (bar (rep s)) (prod h z) := by simp only [z,hmul_assoc]
           _ = _ := by rw [←ez]; simp only [hmul_assoc,k]
    simp only [hh,(coset_action u hu _).2]
  simp_rw [he]
  rw [global_right ha]
  change (∑ h∈globalUnits,if prod (bar (rep s)) (prod h (rep k))∈orderUnits then 1 else 0)=if sign k=sign s then 2 else 0
  cases s <;> cases k <;> decide +kernel


theorem raw_eq {m : ℕ} (hm : Odd m) {s t : H4} (hs : s∈units) (ht : t∈units) :
    (raw m s t:ℚ)=2*entry m (which t) (which s) := by
  rw [raw_reps hm hs ht]
  let i := which s
  let j := which t
  have h := calc
    24*raw m (rep i) (rep j)=∑ a∈globalUnits, ∑ q∈normShell m, indicator (rep i) (prod a (modFour q)) (rep j) := by
      have e (a : H4) (ha : a∈globalUnits) : (∑ q∈normShell m, indicator (rep i) (prod a (modFour q)) (rep j))=raw m (rep i) (rep j) := by
        obtain ⟨b,hb,rfl⟩ := (global_iff a).mp ha
        exact (sum_unit hm hb (fun x => indicator (rep i) x (rep j))).1
      rw [sum_congr rfl e,sum_const,global_units_card,nsmul_eq_mul]; norm_num
    _=2*count m j i := by
      rw [sum_comm,count,card_filter,mul_sum]
      apply sum_congr rfl
      intro q hq
      have ho : Odd (nr q) := by rw [(mem_normShell hm q).mp hq]; exact_mod_cast hm
      rw [average_table _ _ _ (odd_units q ho)]; split <;> simp
  change (raw m (rep i) (rep j):ℚ)=2*((count m j i:ℚ)/24)
  have H := congrArg (fun x:ℕ => (x:ℚ)) h
  push_cast at H
  linarith

end
end TunnellBrandtDoubleCoset


/-! The odd norm count of the quaternionic lattice obtained by dyadic gluing is the projected CM height. -/
namespace TunnellDyadicGluing
open TunnellQuaternion TunnellHurwitzFour TunnellToricSign TunnellToric TunnellShell TunnellToricClass TunnellBrandt TunnellBrandtDoubleCoset
open TunnellTwoProjection TunnellTwoProjectionTransport TunnellHurwitz
noncomputable section
open scoped Classical

def geom (d m : ℕ) (s t : Triple) := ((normShell m).filter fun q => admits d t s (hamZ q)).card

theorem geom_entry {d m : ℕ} (hd : d%4=1) (hm : Odd m) {v s t : Triple} (hv : v∈shell (2*d))
    (hs : s∈shell (2*d)) (ht : t∈shell (2*d)) (hx : Odd v.1) (hy : v.2.1%4=v.1%4) (hz : 4∣v.2.2)
    {a b : H ℤ} (ha : LocalGenerator v s a) (hb : LocalGenerator v t b) :
    (geom d m s t:ℚ)=2*entry m (which (modFour b)) (which (modFour a)) := by
  have h : geom d m s t=raw m (modFour a) (modFour b) := by
    rw [geom,Finset.card_filter,raw]
    apply Finset.sum_congr rfl
    intro q hq
    have ho : Odd (nr q) := by rw [(mem_normShell hm q).mp hq]; exact_mod_cast hm
    have e := pair_criterion hd hv hs ht hx hy hz ha hb ho
    simp only [modFour_mul,red_bar] at e
    simp only [indicator,e]
  rw [h,raw_eq hm (odd_units a ha.1) (odd_units b hb.1)]

theorem geom_height (d : ℕ) (hsq : Squarefree d) (hd : d%4=1) {m : ℕ} (hm : Odd m) :
    (∑ a : ↥(representatives (2*d)), ∑ b : ↥(representatives (2*d)), (geom d m a.val b.val:ℚ)) =
    (Fintype.card ↥(representatives (2*d)):ℚ)^2*(∑ k∈m.divisors,(k:ℚ))+
      (TunnellShell.b d:ℚ)^2*(etaCoeff m:ℚ) := by
  obtain ⟨t,ht⟩ := TunnellThreeSquares.shell_nonempty d hd
  obtain ⟨v,hv,hx,hy,hz⟩ := aligned_base (show (2*d)%8=2 by omega) ht
  have hco : Nat.Coprime 2 d := Nat.prime_two.coprime_iff_not_dvd.mpr (by omega)
  have hs : Squarefree (2*d) := (Nat.squarefree_mul hco).mpr ⟨Nat.prime_two.squarefree,hsq⟩
  have h₂ : (2*d)%4=2 := by omega
  have H (a : ↥(representatives (2*d))) := local_generator_exists h₂ hv (Finset.mem_filter.mp a.property).1
  choose g hg using H
  let c (a : ↥(representatives (2*d))) := which (modFour (g a))
  have he (a b : ↥(representatives (2*d))) : (geom d m a.val b.val:ℚ)=2*entry m (c b) (c a) :=
    geom_entry hd hm hv (Finset.mem_filter.mp a.property).1 (Finset.mem_filter.mp b.property).1 hx hy hz (hg a) (hg b)
  have hc (a : ↥(representatives (2*d))) : sign (c a)=color (redVec v)*test a.val := by
    have ho := character_of_intertwiner hx hy hz (hg a).1 (hg a).2
    rw [sign_rep a.property] at ho
    change sign (which _)=_
    rw [sign_which,ho]
    linear_combination -character (modFour (g a))*(aligned_sign hx hy hz)
  have HP : (∑ a,sign (c a))^2=(TunnellShell.b d)^2 := by
    simp_rw [hc]
    rw [←Finset.mul_sum,show (∑ a : ↥(representatives (2*d)),test a.val)=TunnellShell.b d from
      sum_class_representatives (d:=d) (Equiv.refl _),mul_pow,aligned_sign hx hy hz,one_mul]
  have H := congrArg (fun x:ℤ => (x:ℚ)) HP
  push_cast at H
  simp_rw [he]
  rw [Finset.sum_comm]; simp only [←Finset.mul_sum]
  rw [cm_height hm c,H]

end
end TunnellDyadicGluing

#print axioms TunnellDyadicGluing.geom_height
