import TunnellLocalSpan
import TunnellTestVector
import TunnellMellin

/-! Reduction of the entire test-function span to one even-twist genus period. -/

namespace TunnellWaldspurgerLocal
open Finset TunnellLocalFourier

def trace (n : ℕ) (p : Nat.Primes) : ℤ :=
  haveI : NeZero p.val := ⟨p.property.ne_zero⟩
  (p.val:ℤ) - (univ.filter (fun xy : ZMod p.val × ZMod p.val =>
    xy.2^2=xy.1^3-(n:ZMod p.val)^2*xy.1)).card

noncomputable def curveL (n : ℕ) (L : ℂ → ℂ) : Prop :=
  AnalyticOnNhd ℂ L Set.univ ∧ ∀ s : ℝ, 2<s → HasProd (fun p : Nat.Primes =>
    if p.val ∣ 2*n then (1:ℂ) else let T : ℂ := (p.val:ℂ)^(-(s:ℂ))
    (1-(trace n p:ℂ)*T+(p.val:ℂ)*T^2)⁻¹) (L s)

noncomputable def localPeriod (d : ℕ) : ℤ :=
  open scoped Classical in
  (((TunnellShell.shell (2*d)).filter (fun v=>v∈Set.range TunnellTestVector.first)).card:ℤ)-
    ((TunnellShell.shell (2*d)).filter (fun v=>v∈Set.range TunnellTestVector.second)).card

lemma period_fourier (d : ℕ) (hd : Odd d) : (localPeriod d:ℂ)=2*b 4 d := by
  have h := TunnellTestVector.signed_shell d hd
  change localPeriod d=_ at h
  rw [h]
  have hc := TunnellShell.sum_weight_eq_fourier d
  rw [←Int.cast_sum,TunnellShell.sum_weight_eq_twelve] at hc
  push_cast at hc ⊢
  unfold b
  norm_num only [Nat.cast_ofNat,show (2:ℂ)*4=8 by norm_num]
  linear_combination hc/6

def Index := {d : ℕ // Squarefree d ∧ Odd d}

noncomputable def column (A : ℕ → ℂ) (r : Fin 4) (i : Index) : ℂ :=
  if i.val%8=2*r.val+1 then A i.val * (i.val:ℂ)^(1/4:ℂ) else 0

lemma in_span (A : ℕ → ℂ) (k : ℂ) (hA : ∀ d, Squarefree d → Odd d → d%4=1 →
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
    · exact four_zero (by omega)
  have h16 : (fun i:Index => b 16 i.val)=k • column A 0 := by
    funext ⟨d,hs,hd⟩
    change b 16 d=k*(if d%8=1 then _ else 0)
    split_ifs with h
    · rw [←four_eq_sixteen h]; exact hA d hs hd (by omega)
    · rw [sixteen_zero h,mul_zero]
  let restriction : (ℕ → ℂ) →ₗ[ℂ] (Index → ℂ) :=
    { toFun := fun f i => f i.val, map_add' := fun _ _ => rfl, map_smul' := fun _ _ => rfl }
  apply (show v∈V.comap restriction by
    apply (Submodule.span_le.mpr ?_) hv
    rintro _ ⟨t,ht,rfl⟩
    simp only [Set.mem_insert_iff,Set.mem_singleton_iff] at ht
    change (fun i:Index => b t i.val)∈V
    rcases ht with rfl|rfl|rfl
    · have hb : (fun i:Index => b 1 i.val)=(fun i:Index => b 4 i.val) := funext (fun i => one_eq_four i.property.2)
      rw [hb,h4]; exact V.smul_mem k (V.add_mem (he 0) (he 2))
    · rw [h4]; exact V.smul_mem k (V.add_mem (he 0) (he 2))
    · rw [h16]; exact V.smul_mem k (he 0))

theorem of_period_square (K : ℂ) (hK : K≠0)
    (h : ∀ d, Squarefree d → d%4=1 → ∀ L, curveL (2*d) L →
      L 1=(K*(localPeriod d:ℂ)/(d:ℂ)^(1/4:ℂ))^2) :
    OMA.R_CongruentNumber_Tunnell_even_R1_H3_R1.H2 := by
  classical
  let pick (d : ℕ) : ℂ := if H : ∃ L, curveL (2*d) L then H.choose 1 else 0
  have uniq (d L) (hL : curveL (2*d) L) : pick d=L 1 := by
    have hx : ∃ L, curveL (2*d) L := ⟨L,hL⟩
    dsimp only [pick]; rw [dif_pos hx]
    have hh := hx.choose_spec
    exact congrFun (TunnellMellin.unique_euler_product hh.1 hL.1 _ 2 hh.2 hL.2) 1
  let A (d : ℕ) := if d%4=1 then K*(localPeriod d:ℂ)/(d:ℂ)^(1/4:ℂ) else (pick d)^(1/2:ℂ)
  refine ⟨A,?_,?_⟩
  · intro d hs hd L he hp
    have hL : curveL (2*d) L := ⟨he,hp⟩
    by_cases hh : d%4=1
    · simp only [A,if_pos hh]; exact (h d hs hh L hL).symm
    · rw [show A d=(pick d)^(1/2:ℂ) by simp [A,hh],←Complex.cpow_nat_mul]
      norm_num [uniq d L hL]
  · intro v hv _
    apply in_span A (2*K)⁻¹ _ v hv
    intro d hs hd hh
    have hz : (d:ℂ)≠0 := by exact_mod_cast (show d≠0 by omega)
    have hq : (d:ℂ)^(1/4:ℂ)≠0 := Complex.cpow_ne_zero_iff.mpr (Or.inl hz)
    simp only [A,if_pos hh,period_fourier d hd]
    field_simp

#print axioms of_period_square

end TunnellWaldspurgerLocal
