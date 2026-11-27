import OMAReductions.R_CongruentNumber_Tunnell_even_R1

/-!
# The even twist in Tunnell's central-value formula

The first hypothesis gives Tunnell's Shimura correspondence for the explicit
weight-3/2 form. Its middle Hecke term has symbol (−2m/p), the product of the
character of conductor 8 with (−m/p). The second hypothesis is Waldspurger's
square-value and spanning theorem for the weight-3/2 eigenspace in this level.
On odd squarefree indices the local factors give four residue-class functions.

See J. B. Tunnell, *A Classical Diophantine Problem and Modular Forms of Weight
3/2*, Inventiones Mathematicae 72 (1983), pp. 327–329, Theorems 2 and 3.
-/

namespace OMA.R_CongruentNumber_Tunnell_even_R1_H3_R1

open UpperHalfPlane ModularForm Finset

def H1 : Prop :=
  let b (m : ℕ) := (qExpansion 1 (fun z : ℍ =>
    ModularForm.eta (8*(z:ℂ)) * ModularForm.eta (16*(z:ℂ)) * jacobiTheta (8*(z:ℂ)))).coeff m
  ∀ p : Nat.Primes, p.val ≠ 2 → ∀ m : ℕ,
    letI : NeZero p.val := ⟨p.property.ne_zero⟩
    let a : ℤ := (p.val:ℤ) - (univ.filter (fun xy : ZMod p.val × ZMod p.val =>
      xy.2^2 = xy.1^3 - xy.1)).card
    b (p.val^2*m) + (jacobiSym (-2*(m:ℤ)) p.val:ℂ)*b m +
      (if p.val^2 ∣ m then (p.val:ℂ)*b (m/p.val^2) else 0) = (a:ℂ)*b m

def H2 : Prop :=
  let b (t m : ℕ) := (qExpansion 1 (fun z : ℍ => ModularForm.eta (8*(z:ℂ)) *
    ModularForm.eta (16*(z:ℂ)) * jacobiTheta ((2*t:ℂ)*(z:ℂ)))).coeff m
  let a (n : ℕ) (p : Nat.Primes) : ℤ :=
    haveI : NeZero p.val := ⟨p.property.ne_zero⟩
    (p.val:ℤ) - (univ.filter (fun xy : ZMod p.val × ZMod p.val =>
      xy.2^2 = xy.1^3 - (n:ZMod p.val)^2*xy.1)).card
  ∃ A : ℕ → ℂ,
    (∀ d : ℕ, Squarefree d → Odd d → ∀ L : ℂ → ℂ, AnalyticOnNhd ℂ L Set.univ →
      (∀ s : ℝ, 2 < s → HasProd (fun p : Nat.Primes =>
        if p.val ∣ 2*(2*d) then (1:ℂ) else
          let T : ℂ := (p.val:ℂ)^(-(s:ℂ))
          (1-(a (2*d) p:ℂ)*T+(p.val:ℂ)*T^2)⁻¹) (L s)) → A d^2 = L 1) ∧
  ∀ v ∈ Submodule.span ℂ (b '' {1,4,16}),
    (∀ p : Nat.Primes, p.val ≠ 2 → ∀ m : ℕ,
      v (p.val^2*m) + (jacobiSym (-2*(m:ℤ)) p.val:ℂ)*v m +
        (if p.val^2 ∣ m then (p.val:ℂ)*v (m/p.val^2) else 0) = (a 1 p:ℂ)*v m) →
      (fun d : {d : ℕ // Squarefree d ∧ Odd d} => v d.val) ∈ Submodule.span ℂ
        (Set.range fun r : Fin 4 => fun d : {d : ℕ // Squarefree d ∧ Odd d} =>
          if d.val%8 = 2*r.val+1 then A d.val * (d.val:ℂ)^(1/4:ℂ) else 0)

namespace TunnellCentralSeries


open Finset Filter Polynomial
open scoped Topology PowerSeries.WithPiTopology

lemma theta_locally_uniform :
    TendstoLocallyUniformlyOn
      (fun (D : ℕ) (q : ℂ) => ∑ k ∈ range D, q^(4*(k+1)^2))
      (fun q => ∑' k : ℕ, q^(4*(k+1)^2)) atTop (Metric.ball 0 1) := by
  rw [tendstoLocallyUniformlyOn_iff_forall_isCompact Metric.isOpen_ball]
  intro K hK hcK
  rcases K.eq_empty_or_nonempty with rfl | hN
  · exact tendstoUniformlyOn_empty
  obtain ⟨q₀, hq₀, _, hb⟩ := hcK.exists_sSup_image_eq_and_ge hN
    (show ContinuousOn (fun q : ℂ ↦ ‖q‖) K by fun_prop)
  have hlt : ‖q₀‖ < 1 := by simpa using hK hq₀
  apply tendstoUniformlyOn_tsum_nat (summable_geometric_of_lt_one (norm_nonneg q₀) hlt)
  intro k q hq
  rw [norm_pow]
  exact (pow_le_pow_left₀ (norm_nonneg _) (hb q hq) _).trans
    (pow_le_pow_of_le_one (norm_nonneg _) hlt.le (by nlinarith [Nat.zero_le (k*k)]))

lemma eval_partial (D : ℕ) (q : ℂ) :
    ((X * ∏ k ∈ Icc 1 D, ((1-(X : ℂ[X])^(8*k))*(1-X^(16*k)))) *
      (1+2*∑ k ∈ Icc 1 D, X^(4*k^2))).eval q =
        q * (∏ k ∈ range D, (1-(q^8)^(k+1))) *
          (∏ k ∈ range D, (1-(q^16)^(k+1))) * (1+2*∑ k ∈ range D, q^(4*(k+1)^2)) := by
  have hI : Icc 1 D = Ico 1 (D+1) := by ext k; simp
  rw [hI, prod_mul_distrib, prod_Ico_eq_prod_range, prod_Ico_eq_prod_range, sum_Ico_eq_sum_range]
  simp [eval_finsetSum, eval_prod, ← pow_mul, add_comm 1, mul_assoc]

lemma product_locally_uniform :
    TendstoLocallyUniformlyOn
      (fun (D : ℕ) (q : ℂ) => ((X * ∏ k ∈ Icc 1 D, ((1-(X : ℂ[X])^(8*k))*(1-X^(16*k)))) *
        (1+2*∑ k ∈ Icc 1 D, X^(4*k^2))).eval q)
      (fun q => q * (∏' k : ℕ, (1-(q^8)^(k+1))) *
        (∏' k : ℕ, (1-(q^16)^(k+1))) * (1+2*∑' k : ℕ, q^(4*(k+1)^2)))
      atTop (Metric.ball 0 1) := by
  let U := Metric.ball (0 : ℂ) 1
  let E (a : ℕ) (q : ℂ) : ℂ := ∏' k : ℕ, (1 - (q^a)^(k+1))
  let P (a D : ℕ) (q : ℂ) : ℂ := ∏ k ∈ range D, (1 - (q^a)^(k+1))
  have maps (a : ℕ) (ha : 0 < a) : Set.MapsTo (fun q : ℂ => q^a) U U := by
    intro q hq
    simp only [U, Metric.mem_ball, dist_zero_right, norm_pow] at hq ⊢
    exact pow_lt_one₀ (norm_nonneg _) hq ha.ne'
  have h (a : ℕ) (ha : 0 < a) : TendstoLocallyUniformlyOn (P a) (E a) atTop U := by
    exact (ModularForm.multipliableLocallyUniformlyOn_one_sub_pow.comp _ (maps a ha)
      (by fun_prop)).hasProdLocallyUniformlyOn.tendstoLocallyUniformlyOn_finsetRange
  have hc (a : ℕ) (ha : 0 < a) : ContinuousOn (E a) U :=
    ModularForm.differentiableOn_tprod_one_sub_pow.continuousOn.comp (by fun_prop) (maps a ha)
  have cst (g : ℂ → ℂ) : TendstoLocallyUniformlyOn (fun _ : ℕ => g) g atTop U := by
    intro u hu x _
    exact ⟨Set.univ, univ_mem, .of_forall fun _ y _ => refl_mem_uniformity hu⟩
  have he := ((cst id).mul₀ (h 8 (by decide)) continuousOn_id (hc 8 (by decide))).mul₀
    (h 16 (by decide)) (continuousOn_id.mul (hc 8 (by decide))) (hc 16 (by decide))
  have hec := (continuousOn_id.mul (hc 8 (by decide))).mul (hc 16 (by decide))
  have htc := theta_locally_uniform.continuousOn (.of_forall (fun _ => by fun_prop))
  have hts := (cst (fun _ => (2:ℂ))).mul₀ theta_locally_uniform continuousOn_const htc
  have hth := (cst (fun _ => (1:ℂ))).add hts
  simp_rw [eval_partial]
  exact he.mul₀ hth hec (continuousOn_const.add (continuousOn_const.mul htc))


lemma deriv_eval (p : ℂ[X]) :
    deriv (fun z => p.eval z) = fun z => p.derivative.eval z :=
  funext fun z => (p.hasDerivAt z).deriv

lemma taylor_of_convergent_polynomials (P : ℕ → ℂ[X]) (f : ℂ → ℂ)
    (h : TendstoLocallyUniformlyOn (fun D z => (P D).eval z) f atTop (Metric.ball 0 1))
    (m : ℕ) (b : ℂ) (hst : ∀ D ≥ m, (P D).coeff m = b) :
    (m.factorial : ℂ)⁻¹ * iteratedDeriv m f 0 = b := by
  have iter (j : ℕ) : TendstoLocallyUniformlyOn
      (fun D z => (derivative^[j] (P D)).eval z) (iteratedDeriv j f)
      atTop (Metric.ball 0 1) := by
    induction j with
    | zero => simpa using h
    | succ j ih =>
      have h' := ih.deriv (Eventually.of_forall fun D => (derivative^[j] (P D)).differentiableOn)
        Metric.isOpen_ball
      simpa only [iteratedDeriv_succ, Function.comp_def, deriv_eval, Function.iterate_succ_apply'] using h'
  have ht := (iter m).tendsto_at (show (0 : ℂ) ∈ Metric.ball 0 1 by simp)
  have hconst : ∀ᶠ D in atTop, (derivative^[m] (P D)).eval 0 = (m.factorial : ℂ) * b := by
    filter_upwards [eventually_ge_atTop m] with D hD
    rw [← coeff_zero_eq_eval_zero, coeff_iterate_derivative]
    simp [hst D hD, mul_comm, Nat.descFactorial_self]
  have hev : iteratedDeriv m f 0 = (m.factorial : ℂ) * b :=
    tendsto_nhds_unique ht (tendsto_nhds_of_eventually_eq hconst)
  rw [hev]
  rw [← mul_assoc, inv_mul_cancel₀ (by exact_mod_cast Nat.factorial_ne_zero m), one_mul]

open OMA.R_CongruentNumber_Tunnell_even_R1.FourierSeries
open PowerSeries

theorem finite_coeff_of_le (d m : ℕ) (hm : m ≤ d) :
    let X : Polynomial ℤ := Polynomial.X
    let eta := X * ∏ k ∈ Icc 1 d, ((1 - X ^ (8 * k)) * (1 - X ^ (16 * k)))
    let theta := 1 + 2 * ∑ k ∈ Icc 1 d, X ^ (4 * k ^ 2)
    (eta * theta).coeff m =
      PowerSeries.coeff m ((PowerSeries.X : ℤ⟦X⟧) *
        (∏' k : ℕ, (1 - PowerSeries.X ^ (8 * (k + 1)))) *
        (∏' k : ℕ, (1 - PowerSeries.X ^ (16 * (k + 1)))) *
        (1 + 2 * ∑' k : ℕ, PowerSeries.X ^ (4 * (k + 1) ^ 2))) := by
  dsimp only
  have hI : Icc 1 d = Ico 1 (d + 1) := by ext k; simp
  rw [hI, Finset.prod_mul_distrib, Finset.prod_Ico_eq_prod_range, Finset.prod_Ico_eq_prod_range,
    Finset.sum_Ico_eq_sum_range, ← mul_assoc, ← Polynomial.coeff_coe]
  rw [← Polynomial.coeToPowerSeries.ringHom_apply]
  simp only [map_mul, map_prod, map_sub, map_one, map_pow, map_add, map_sum, map_ofNat,
    Polynomial.coeToPowerSeries.ringHom_apply, Polynomial.coe_X, Nat.add_one_sub_one, add_comm 1]
  apply mul_coeff_congr _ _ m hm
  · apply mul_coeff_congr
    · apply mul_coeff_congr
      · exact fun _ _ => rfl
      · exact fun m hm => coeff_tprod_high (fun k => 8 * (k+1)) (by intro k; omega) hm
    · exact fun m hm => coeff_tprod_high (fun k => 16 * (k+1)) (by intro k; omega) hm
  · intro m hm
    rw [map_add, map_add]
    congr 1
    apply mul_coeff_congr (fun _ _ => rfl) _ m hm
    exact fun k hk => coeff_tsum_high (fun j => 4 * (j+1)^2)
      (by intro j; nlinarith [Nat.zero_le (j*j)]) hk

theorem analytic_theta_coefficient (m : ℕ) :
    (m.factorial : ℂ)⁻¹ * iteratedDeriv m
      (fun q : ℂ => q * (∏' k : ℕ, (1-(q^8)^(k+1))) *
        (∏' k : ℕ, (1-(q^16)^(k+1))) * (1+2*∑' k : ℕ, q^(4*(k+1)^2))) 0 =
      (PowerSeries.coeff m ((PowerSeries.X : ℤ⟦X⟧) *
        (∏' k : ℕ, (1 - PowerSeries.X ^ (8 * (k + 1)))) *
        (∏' k : ℕ, (1 - PowerSeries.X ^ (16 * (k + 1)))) *
        (1 + 2 * ∑' k : ℕ, PowerSeries.X ^ (4 * (k + 1) ^ 2))) : ℤ) := by
  let P (D : ℕ) : ℤ[X] := (Polynomial.X * ∏ k ∈ Icc 1 D,
      ((1-Polynomial.X^(8*k))*(1-Polynomial.X^(16*k)))) *
        (1+2*∑ k ∈ Icc 1 D, Polynomial.X^(4*k^2))
  apply taylor_of_convergent_polynomials (fun D => (P D).map (Int.castRingHom ℂ))
  · simpa only [P, Polynomial.map_mul, Polynomial.map_prod, Polynomial.map_sub,
      Polynomial.map_one, Polynomial.map_pow, Polynomial.map_X, Polynomial.map_add,
      Polynomial.map_sum, Polynomial.map_ofNat] using product_locally_uniform
  · intro D hD
    rw [Polynomial.coeff_map]
    exact congrArg (fun z : ℤ => (z : ℂ)) (finite_coeff_of_le D m hD)

open UpperHalfPlane Function ModularForm

lemma qparam_dilate (a : ℕ) (z : ℂ) :
    Periodic.qParam 1 ((a:ℂ)*z) = (Periodic.qParam 1 z)^a := by
  simp only [Periodic.qParam, Complex.ofReal_one, div_one, ← Complex.exp_nat_mul]
  congr 1
  ring

lemma upper_value (z : ℍ) :
    let q := Periodic.qParam 1 (z:ℂ)
    ModularForm.eta (8*(z:ℂ)) * ModularForm.eta (16*(z:ℂ)) * jacobiTheta (8*(z:ℂ)) =
      q * (∏' k : ℕ, (1-(q^8)^(k+1))) *
        (∏' k : ℕ, (1-(q^16)^(k+1))) * (1+2*∑' k : ℕ, q^(4*(k+1)^2)) := by
  dsimp only
  have hlead : Periodic.qParam 24 (8*(z:ℂ)) * Periodic.qParam 24 (16*(z:ℂ)) =
      Periodic.qParam 1 z := by
    simp only [Periodic.qParam, ← Complex.exp_add]
    push_cast
    congr 1
    ring
  have htheta : jacobiTheta (8*(z:ℂ)) = 1 + 2 * ∑' k : ℕ, (Periodic.qParam 1 (z:ℂ))^(4*(k+1)^2) := by
    have him : 0 < (8*(z:ℂ)).im := by simp [Complex.mul_im]; linarith [z.im_pos]
    rw [jacobiTheta_eq_tsum_nat him]
    congr 2
    apply tsum_congr
    intro k
    simp only [Periodic.qParam, Complex.ofReal_one, div_one, ← Complex.exp_nat_mul]
    push_cast
    congr 1
    ring
  rw [htheta]
  congr 1
  unfold ModularForm.eta eta_q
  rw [show (8:ℂ) = (8:ℕ) by norm_num, qparam_dilate,
    show (16:ℂ) = (16:ℕ) by norm_num, qparam_dilate]
  linear_combination (∏' k : ℕ, (1-(Periodic.qParam 1 z ^ 8)^(k+1))) *
    (∏' k : ℕ, (1-(Periodic.qParam 1 z ^ 16)^(k+1))) * hlead



open UpperHalfPlane Function ModularForm Filter
open scoped Topology PowerSeries.WithPiTopology

lemma cuspFunction_of_disk {f : ℍ → ℂ} {g : ℂ → ℂ}
    (hg : ContinuousAt g 0) (hfg : ∀ z : ℍ, f z = g (Periodic.qParam 1 (z:ℂ))) :
    cuspFunction 1 f =ᶠ[𝓝 0] g := by
  have hn (q : ℂ) (hq : ‖q‖ < 1) (h0 : q ≠ 0) : cuspFunction 1 f q = g q := by
    have hi := Periodic.im_invQParam_pos_of_norm_lt_one one_pos hq h0
    rw [cuspFunction, Periodic.cuspFunction_eq_of_nonzero _ _ h0, comp_apply,
      ofComplex_apply_of_im_pos hi, hfg]
    exact congrArg g (Periodic.qParam_right_inv one_ne_zero h0)
  have hp : cuspFunction 1 f =ᶠ[𝓝[≠] 0] g := by
    filter_upwards [self_mem_nhdsWithin, mem_nhdsWithin_of_mem_nhds
      (Metric.ball_mem_nhds (0:ℂ) (by norm_num : 0 < (1:ℝ)))] with q h0 hq
    exact hn q (by simpa using hq) h0
  have ht : Tendsto (cuspFunction 1 f) (𝓝[≠] 0) (𝓝 (g 0)) :=
    (hg.tendsto.mono_left nhdsWithin_le_nhds).congr' hp.symm
  have hz : cuspFunction 1 f 0 = g 0 :=
    (Periodic.cuspFunction_zero_eq_limUnder_nhds_ne 1 (f ∘ ofComplex)).trans ht.limUnder_eq
  filter_upwards [Metric.ball_mem_nhds (0:ℂ) (by norm_num : 0 < (1:ℝ))] with q hq
  rcases eq_or_ne q 0 with rfl | h0
  · exact hz
  · exact hn _ (by simpa using hq) h0

theorem qExpansion_theta_coefficient (m : ℕ) :
    (qExpansion 1 (fun z : ℍ => ModularForm.eta (8*(z:ℂ)) * ModularForm.eta (16*(z:ℂ)) * jacobiTheta (8*(z:ℂ)))).coeff m =
      (PowerSeries.coeff m ((PowerSeries.X : PowerSeries ℤ) *
        (∏' k : ℕ, (1 - PowerSeries.X ^ (8 * (k + 1)))) *
        (∏' k : ℕ, (1 - PowerSeries.X ^ (16 * (k + 1)))) *
        (1 + 2 * ∑' k : ℕ, PowerSeries.X ^ (4 * (k + 1) ^ 2))) : ℤ) := by
  have hc := product_locally_uniform.continuousOn (.of_forall fun D => by fun_prop)
  have hd := cuspFunction_of_disk (hc.continuousAt (Metric.ball_mem_nhds (0:ℂ) one_pos)) upper_value
  rw [qExpansion_coeff, hd.iteratedDeriv_eq]
  exact analytic_theta_coefficient m

end TunnellCentralSeries

theorem main : H1 → H2 → OMA.R_CongruentNumber_Tunnell_even_R1.H3 := by
  intro shimura waldspurger n hs hn L hL hz
  let b (t m : ℕ) := (qExpansion 1 (fun z : ℍ => ModularForm.eta (8*(z:ℂ)) *
    ModularForm.eta (16*(z:ℂ)) * jacobiTheta ((2*t:ℂ)*(z:ℂ)))).coeff m
  obtain ⟨A, hA, hW⟩ := waldspurger
  have hspan := hW (b 4) (Submodule.subset_span ⟨4, by simp, rfl⟩) (by
    intro p hp m
    simpa [b, show (2:ℂ)*4=8 by norm_num] using shimura p hp m)
  let d := n/2
  have hn2 : n = 2*d := by dsimp [d]; omega
  have hd : Squarefree d := hs.squarefree_of_dvd (hn2 ▸ dvd_mul_left d 2)
  have hod : Odd d := by
    rw [Nat.odd_iff]
    dsimp [d]
    omega
  have ha : A d = 0 := by
    have hsq := hA d hd hod L hL.1 (by rw [←hn2]; exact hL.2)
    simpa [hz] using hsq
  let i : {d : ℕ // Squarefree d ∧ Odd d} := ⟨d,hd,hod⟩
  let evaluation : ({d : ℕ // Squarefree d ∧ Odd d} → ℂ) →ₗ[ℂ] ℂ := LinearMap.proj i
  have hker : (fun j : {d : ℕ // Squarefree d ∧ Odd d} => b 4 j.val) ∈ LinearMap.ker evaluation := by
    apply (Submodule.span_le.mpr ?_) hspan
    rintro _ ⟨r,rfl⟩
    simp [LinearMap.mem_ker,evaluation,i,ha]
  have hv : b 4 d = 0 := hker
  have htheta := TunnellCentralSeries.qExpansion_theta_coefficient d
  simp only [b, Nat.cast_ofNat, show (2:ℂ)*4=8 by norm_num] at hv
  rw [htheta] at hv
  exact_mod_cast hv

end OMA.R_CongruentNumber_Tunnell_even_R1_H3_R1
