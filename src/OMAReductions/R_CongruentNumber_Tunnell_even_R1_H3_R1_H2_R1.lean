import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H3_R1
import Mathlib

/-!
# Ternary periods and the Gaussian modular symbol of the conductor-32 newform

H1 compares two integers. The left side sums the real parts of the modular symbols computed by
nearest-integer Fricke descent, weighted by a Jacobi symbol. The cyclotomic remainder fixes the
Gauss-sum sign using the distinguished polynomial representative of the positive square root of 8d.
The right side is the square of the difference of the counts in the two trace-zero lattices of
Burungale and Tian, The congruent number problem and the Birch–Swinnerton-Dyer conjecture,
section 3.3.1. H2 identifies the arithmetic quantities separately with the central L-value and
the three theta coefficients. It places all analytic normalizations in one common nonzero constant.
-/

namespace OMA.R_CongruentNumber_Tunnell_even_R1_H3_R1_H2_R1

open Finset Polynomial UpperHalfPlane

def H1 : Prop :=
  let i : GaussianInt := ⟨0,1⟩
  let rot (k : ℤ) := if k%4=0 then 1 else if k%4=1 then i else if k%4=2 then -1 else -i
  let S := Nat.rec (motive:=fun _ => ℤ → ℕ → GaussianInt) (fun _ _ => 1)
    (fun _ f a n => let r := a.bmod n
                    rot (a.bdiv n)*(if r=0 then 1 else if 2*r=-(n:ℤ) then 1-i else
                      1-f (if 0≤r then -(n:ℤ) else (n:ℤ)) (2*r.natAbs)))
  let w (d j : ℕ) : ℤ := if Odd j then jacobiSym (2*d:ℕ) j else 0
  let W (d : ℕ) (hd : 0<d) : ℤ :=
    haveI : NeZero (4*(2*d)) := ⟨by omega⟩
    let c (j : ℕ) : ℤ[X] := (X^(16*d-j)-X^j)*X^(4*d)
    let R := c (2*d)*∏ k∈range (4*d-1),c (k+1)
    let G := ∑ j : ZMod (4*(2*d)), C (w d j.val)*X^(2*j.val)
    (if (G-R) %ₘ cyclotomic (16*d) ℤ = 0 then 1 else -1)*
      ∑ j : ZMod (4*(2*d)), w d j.val*(S (2*d) j.val (2*d)).re
  let P (d : ℕ) : ℤ :=
    let b := Icc (-((2*d:ℕ):ℤ)-1) (((2*d:ℕ):ℤ)+1)
    let s := (b ×ˢ (b ×ˢ b)).filter (fun v => v.1^2+v.2.1^2+v.2.2^2=((2*d:ℕ):ℤ))
    ((s.filter (fun v => v.1%4=v.2.1%4 ∧ v.2.2%8=0)).card:ℤ)-
      (s.filter (fun v => v.1%4=v.2.1%4 ∧ v.2.2%4=0 ∧
        (v.1+v.2.1+2*(v.2.2/4))%4=0)).card
  ∀ d : ℕ, Squarefree d → (hd : d%4=1) → W d (by omega)=P d^2

def H2 : Prop :=
  let i : GaussianInt := ⟨0,1⟩
  let rot (k : ℤ) := if k%4=0 then 1 else if k%4=1 then i else if k%4=2 then -1 else -i
  let S := Nat.rec (motive:=fun _ => ℤ → ℕ → GaussianInt) (fun _ _ => 1)
    (fun _ f a n => let r := a.bmod n
                    rot (a.bdiv n)*(if r=0 then 1 else if 2*r=-(n:ℤ) then 1-i else
                      1-f (if 0≤r then -(n:ℤ) else (n:ℤ)) (2*r.natAbs)))
  let w (d j : ℕ) : ℤ := if Odd j then jacobiSym (2*d:ℕ) j else 0
  let W (d : ℕ) (hd : 0<d) : ℤ :=
    haveI : NeZero (4*(2*d)) := ⟨by omega⟩
    let c (j : ℕ) : ℤ[X] := (X^(16*d-j)-X^j)*X^(4*d)
    let R := c (2*d)*∏ k∈range (4*d-1),c (k+1)
    let G := ∑ j : ZMod (4*(2*d)), C (w d j.val)*X^(2*j.val)
    (if (G-R) %ₘ cyclotomic (16*d) ℤ = 0 then 1 else -1)*
      ∑ j : ZMod (4*(2*d)), w d j.val*(S (2*d) j.val (2*d)).re
  let P (d : ℕ) : ℤ :=
    let b := Icc (-((2*d:ℕ):ℤ)-1) (((2*d:ℕ):ℤ)+1)
    let s := (b ×ˢ (b ×ˢ b)).filter (fun v => v.1^2+v.2.1^2+v.2.2^2=((2*d:ℕ):ℤ))
    ((s.filter (fun v => v.1%4=v.2.1%4 ∧ v.2.2%8=0)).card:ℤ)-
      (s.filter (fun v => v.1%4=v.2.1%4 ∧ v.2.2%4=0 ∧
        (v.1+v.2.1+2*(v.2.2/4))%4=0)).card
  let a (d : ℕ) (p : Nat.Primes) : ℤ :=
    haveI : NeZero p.val := ⟨p.property.ne_zero⟩
    (p.val:ℤ)-(univ.filter (fun xy : ZMod p.val × ZMod p.val =>
      xy.2^2=xy.1^3-((2*d:ℕ):ZMod p.val)^2*xy.1)).card
  ∃ C : ℂ, C≠0 ∧ (∀ d : ℕ, Squarefree d → (hd : d%4=1) → ∀ L : ℂ→ℂ,
    AnalyticOnNhd ℂ L Set.univ → (∀ s : ℝ, 2<s → HasProd (fun p : Nat.Primes =>
      if p.val ∣ 2*(2*d) then (1:ℂ) else let T := (p.val:ℂ)^(-(s:ℂ))
      (1-(a d p:ℂ)*T+(p.val:ℂ)*T^2)⁻¹) (L s)) →
    (Real.sqrt (8*d):ℂ)*L 1=(W d (by omega):ℂ)*C) ∧
  ∀ d : ℕ, Odd d →
    let b (t : ℕ) := (qExpansion 1 (fun z : ℍ => ModularForm.eta (8*(z:ℂ))*
      ModularForm.eta (16*(z:ℂ))*jacobiTheta ((2*t:ℂ)*(z:ℂ)))).coeff d
    b 1=b 4 ∧ (P d:ℂ)=2*b 4 ∧ b 16=(if d%8=1 then b 4 else 0) ∧ (d%4≠1 → b 4=0)

section

open Filter Set Complex UpperHalfPlane MatrixGroups MeasureTheory
open scoped Topology ModularForm

theorem entire_unique {f g : ℂ → ℂ} (hf : AnalyticOnNhd ℂ f univ) (hg : AnalyticOnNhd ℂ g univ)
    (B : ℝ) (h : ∀ x : ℝ, B<x → f x = g x) : f = g := by
  let a : ℝ := B+1
  have hm : Tendsto ((↑) : ℝ → ℂ) (𝓝[≠] a) (𝓝[≠] (a:ℂ)) := by
    exact continuous_ofReal.continuousWithinAt.tendsto_nhdsWithin (fun _ _ => by simp_all)
  apply hf.eq_of_frequently_eq hg (hm.frequently ?_)
  apply Filter.Eventually.frequently
  filter_upwards [(eventually_gt_nhds (show B<a by dsimp [a]; linarith)).filter_mono nhdsWithin_le_nhds] with x hx
  exact h x hx

theorem unique_euler_product {f g : ℂ → ℂ} (hf : AnalyticOnNhd ℂ f univ)
    (hg : AnalyticOnNhd ℂ g univ) {I : Type*} (u : ℝ → I → ℂ) (B : ℝ)
    (h₁ : ∀ x : ℝ, B<x → HasProd (u x) (f x))
    (h₂ : ∀ x : ℝ, B<x → HasProd (u x) (g x)) : f = g :=
  entire_unique hf hg B (fun x hx => (h₁ x hx).unique (h₂ x hx))

end

lemma root_sq (d : ℕ) : ((d:ℂ)^(1/4:ℂ))^2 = (Real.sqrt d:ℂ) := by
  rw [←Complex.cpow_nat_mul,Real.sqrt_eq_rpow,Complex.ofReal_cpow (Nat.cast_nonneg d)]
  norm_num

theorem main : H1 → H2 → OMA.R_CongruentNumber_Tunnell_even_R1_H3_R1.H2 := by
  classical
  intro finiteSquare evaluation
  let i : GaussianInt := ⟨0,1⟩
  let rot (k : ℤ) := if k%4=0 then 1 else if k%4=1 then i else if k%4=2 then -1 else -i
  let S := Nat.rec (motive:=fun _ => ℤ → ℕ → GaussianInt) (fun _ _ => 1)
    (fun _ f a n => let r := a.bmod n
                    rot (a.bdiv n)*(if r=0 then 1 else if 2*r=-(n:ℤ) then 1-i else
                      1-f (if 0≤r then -(n:ℤ) else (n:ℤ)) (2*r.natAbs)))
  let w (d j : ℕ) : ℤ := if Odd j then jacobiSym (2*d:ℕ) j else 0
  let W (d : ℕ) (hd : 0<d) : ℤ :=
    haveI : NeZero (4*(2*d)) := ⟨by omega⟩
    let c (j : ℕ) : ℤ[X] := (X^(16*d-j)-X^j)*X^(4*d)
    let R := c (2*d)*∏ k∈range (4*d-1),c (k+1)
    let G := ∑ j : ZMod (4*(2*d)), C (w d j.val)*X^(2*j.val)
    (if (G-R) %ₘ cyclotomic (16*d) ℤ = 0 then 1 else -1)*
      ∑ j : ZMod (4*(2*d)), w d j.val*(S (2*d) j.val (2*d)).re
  let P (d : ℕ) : ℤ :=
    let b := Icc (-((2*d:ℕ):ℤ)-1) (((2*d:ℕ):ℤ)+1)
    let s := (b ×ˢ (b ×ˢ b)).filter (fun v => v.1^2+v.2.1^2+v.2.2^2=((2*d:ℕ):ℤ))
    ((s.filter (fun v => v.1%4=v.2.1%4 ∧ v.2.2%8=0)).card:ℤ)-
      (s.filter (fun v => v.1%4=v.2.1%4 ∧ v.2.2%4=0 ∧
        (v.1+v.2.1+2*(v.2.2/4))%4=0)).card
  let a (n : ℕ) (p : Nat.Primes) : ℤ :=
    haveI : NeZero p.val := ⟨p.property.ne_zero⟩
    (p.val:ℤ)-(univ.filter (fun xy : ZMod p.val × ZMod p.val =>
      xy.2^2=xy.1^3-(n:ZMod p.val)^2*xy.1)).card
  let curveL (n : ℕ) (L : ℂ → ℂ) : Prop := AnalyticOnNhd ℂ L Set.univ ∧ ∀ s : ℝ, 2<s →
    HasProd (fun p : Nat.Primes => if p.val ∣ 2*n then (1:ℂ) else let T := (p.val:ℂ)^(-(s:ℂ))
      (1-(a n p:ℂ)*T+(p.val:ℂ)*T^2)⁻¹) (L s)
  let b (t m : ℕ) := (qExpansion 1 (fun z : ℍ => ModularForm.eta (8*(z:ℂ))*
    ModularForm.eta (16*(z:ℂ))*jacobiTheta ((2*t:ℂ)*(z:ℂ)))).coeff m
  change ∀ d : ℕ, Squarefree d → (hd : d%4=1) → W d (by omega)=P d^2 at finiteSquare
  change ∃ c : ℂ, c≠0 ∧ (∀ d : ℕ, Squarefree d → (hd : d%4=1) → ∀ L : ℂ→ℂ, _ → _ →
    (Real.sqrt (8*d):ℂ)*L 1=(W d (by omega):ℂ)*c) ∧ (∀ d : ℕ, Odd d →
    b 1 d=b 4 d ∧ (P d:ℂ)=2*b 4 d ∧ b 16 d=(if d%8=1 then b 4 d else 0) ∧
      (d%4≠1 → b 4 d=0)) at evaluation
  obtain ⟨c,hc,hvalue,htheta⟩ := evaluation
  have h2 : (Real.sqrt 2:ℂ)≠0 := Complex.ofReal_ne_zero.mpr (Real.sqrt_pos.mpr (by norm_num)).ne'
  obtain ⟨K,hK⟩ := IsAlgClosed.exists_pow_nat_eq (c/(2*(Real.sqrt 2:ℂ))) (by decide : 0<2)
  have hKn : K≠0 := by
    intro hz
    rw [hz,zero_pow two_ne_zero] at hK
    exact (div_ne_zero hc (mul_ne_zero (by norm_num) h2)) hK.symm
  have square (d : ℕ) (hs : Squarefree d) (hd : d%4=1) (L : ℂ→ℂ) (hL : curveL (2*d) L) :
      L 1=(K*(P d:ℂ)/(d:ℂ)^(1/4:ℂ))^2 := by
    have h := hvalue d hs hd L hL.1 hL.2
    rw [finiteSquare d hs hd,Int.cast_pow] at h
    have hs8 : (Real.sqrt (8*d):ℂ)=2*(Real.sqrt 2:ℂ)*(Real.sqrt d:ℂ) := by
      rw [show (8:ℝ)*d=4*(2*d) by ring,Real.sqrt_mul (by norm_num : (0:ℝ)≤4),
        Real.sqrt_mul (by norm_num : (0:ℝ)≤2)]
      push_cast
      norm_num
      <;> ring
    rw [hs8] at h
    have hD : (Real.sqrt d:ℂ)≠0 := Complex.ofReal_ne_zero.mpr (Real.sqrt_pos.mpr (Nat.cast_pos.mpr (by omega : 0<d))).ne'
    rw [div_pow,mul_pow,hK,root_sq]
    field_simp [h2,hD]
    linear_combination h
  let Index := {d : ℕ // Squarefree d ∧ Odd d}
  let column (A : ℕ → ℂ) (r : Fin 4) (i : Index) : ℂ :=
    if i.val%8=2*r.val+1 then A i.val * (i.val:ℂ)^(1/4:ℂ) else 0
  have in_span (A : ℕ → ℂ) (k : ℂ) (hA : ∀ d, Squarefree d → Odd d → d%4=1 →
      b 4 d=k*(A d*(d:ℂ)^(1/4:ℂ))) (v : ℕ → ℂ)
      (hv : v∈Submodule.span ℂ (b '' {1,4,16})) :
      (fun i:Index => v i.val) ∈ Submodule.span ℂ (Set.range (column A)) := by
    let V := Submodule.span ℂ (Set.range (column A))
    have he (r : Fin 4) : column A r ∈ V := Submodule.subset_span ⟨r,rfl⟩
    have h4 : (fun i:Index => b 4 i.val) = k • (column A 0 + column A 2) := by
      funext ⟨d,hs,hd⟩
      change b 4 d=k*(column A 0 _+column A 2 _)
      change b 4 d=k*((if d%8=1 then _ else 0)+(if d%8=5 then _ else 0))
      have hm := Nat.odd_iff.mp hd
      by_cases h1 : d%8=1 <;> by_cases h5 : d%8=5
      all_goals simp only [h1,h5,show (1:ℕ)≠5 by decide,show (5:ℕ)≠1 by decide,ite_true,ite_false,zero_add,add_zero,mul_zero]
      · omega
      · exact hA d hs hd (by omega)
      · exact hA d hs hd (by omega)
      · exact (htheta d hd).2.2.2 (by omega)
    have h16 : (fun i:Index => b 16 i.val)=k • column A 0 := by
      funext ⟨d,hs,hd⟩
      change b 16 d=k*(if d%8=1 then _ else 0)
      split_ifs with h
      · rw [(htheta d hd).2.2.1,if_pos h]; exact hA d hs hd (by omega)
      · rw [(htheta d hd).2.2.1,if_neg h,mul_zero]
    let restriction : (ℕ → ℂ) →ₗ[ℂ] (Index → ℂ) :=
      { toFun := fun f i => f i.val, map_add' := fun _ _ => rfl, map_smul' := fun _ _ => rfl }
    apply (show v∈V.comap restriction by
      apply (Submodule.span_le.mpr ?_) hv
      rintro _ ⟨t,ht,rfl⟩
      simp only [Set.mem_insert_iff,Set.mem_singleton_iff] at ht
      change (fun i:Index => b t i.val)∈V
      rcases ht with rfl|rfl|rfl
      · have hb : (fun i:Index => b 1 i.val)=(fun i:Index => b 4 i.val) := funext (fun i => (htheta i.val i.property.2).1)
        rw [hb,h4]; exact V.smul_mem k (V.add_mem (he 0) (he 2))
      · rw [h4]; exact V.smul_mem k (V.add_mem (he 0) (he 2))
      · rw [h16]; exact V.smul_mem k (he 0))
  let pick (d : ℕ) : ℂ := if H : ∃ L, curveL (2*d) L then H.choose 1 else 0
  have uniq (d L) (hL : curveL (2*d) L) : pick d=L 1 := by
    have hx : ∃ L, curveL (2*d) L := ⟨L,hL⟩
    dsimp only [pick]; rw [dif_pos hx]
    have hh := hx.choose_spec
    exact congrFun (unique_euler_product hh.1 hL.1 _ 2 hh.2 hL.2) 1
  let A (d : ℕ) := if d%4=1 then K*(P d:ℂ)/(d:ℂ)^(1/4:ℂ) else (pick d)^(1/2:ℂ)
  refine ⟨A,?_,?_⟩
  · intro d hs hd L he hp
    have hL : curveL (2*d) L := ⟨he,hp⟩
    by_cases hh : d%4=1
    · simp only [A,if_pos hh]; exact (square d hs hh L hL).symm
    · rw [show A d=(pick d)^(1/2:ℂ) by simp [A,hh],←Complex.cpow_nat_mul]
      norm_num [uniq d L hL]
  · intro v hv _
    apply in_span A (2*K)⁻¹ _ v hv
    intro d hs hd hh
    have hz : (d:ℂ)≠0 := by exact_mod_cast (show d≠0 by omega)
    have hq : (d:ℂ)^(1/4:ℂ)≠0 := Complex.cpow_ne_zero_iff.mpr (Or.inl hz)
    simp only [A,if_pos hh,(htheta d hd).2.1]
    field_simp

end OMA.R_CongruentNumber_Tunnell_even_R1_H3_R1_H2_R1
