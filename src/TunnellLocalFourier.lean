import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H3_R1

/-! Coefficients of the three local theta test functions in the even twist family. -/

namespace TunnellLocalFourier

open OMA.R_CongruentNumber_Tunnell_even_R1_H3_R1.TunnellCentralSeries

open Finset Filter Polynomial
open scoped Topology PowerSeries.WithPiTopology

lemma theta_locally_uniform (t : ℕ) (ht : 0<t) :
    TendstoLocallyUniformlyOn
      (fun (D : ℕ) (q : ℂ) => ∑ k ∈ range D, q^(t*(k+1)^2))
      (fun q => ∑' k : ℕ, q^(t*(k+1)^2)) atTop (Metric.ball 0 1) := by
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
    (pow_le_pow_of_le_one (norm_nonneg _) hlt.le (by nlinarith [Nat.zero_le (k*k), Nat.mul_le_mul_right ((k+1)^2) (show 1 ≤ t by omega)]))

lemma eval_partial (t : ℕ) (D : ℕ) (q : ℂ) :
    ((X * ∏ k ∈ Icc 1 D, ((1-(X : ℂ[X])^(8*k))*(1-X^(16*k)))) *
      (1+2*∑ k ∈ Icc 1 D, X^(t*k^2))).eval q =
        q * (∏ k ∈ range D, (1-(q^8)^(k+1))) *
          (∏ k ∈ range D, (1-(q^16)^(k+1))) * (1+2*∑ k ∈ range D, q^(t*(k+1)^2)) := by
  have hI : Icc 1 D = Ico 1 (D+1) := by ext k; simp
  rw [hI, prod_mul_distrib, prod_Ico_eq_prod_range, prod_Ico_eq_prod_range, sum_Ico_eq_sum_range]
  simp [eval_finsetSum, eval_prod, ← pow_mul, add_comm 1, mul_assoc]

lemma product_locally_uniform (t : ℕ) (ht : 0<t) :
    TendstoLocallyUniformlyOn
      (fun (D : ℕ) (q : ℂ) => ((X * ∏ k ∈ Icc 1 D, ((1-(X : ℂ[X])^(8*k))*(1-X^(16*k)))) *
        (1+2*∑ k ∈ Icc 1 D, X^(t*k^2))).eval q)
      (fun q => q * (∏' k : ℕ, (1-(q^8)^(k+1))) *
        (∏' k : ℕ, (1-(q^16)^(k+1))) * (1+2*∑' k : ℕ, q^(t*(k+1)^2)))
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
  have htc := (theta_locally_uniform t ht).continuousOn (.of_forall (fun _ => by fun_prop))
  have hts := (cst (fun _ => (2:ℂ))).mul₀ (theta_locally_uniform t ht) continuousOn_const htc
  have hth := (cst (fun _ => (1:ℂ))).add hts
  simp_rw [eval_partial]
  exact he.mul₀ hth hec (continuousOn_const.add (continuousOn_const.mul htc))


open OMA.R_CongruentNumber_Tunnell_even_R1.FourierSeries
open PowerSeries

theorem finite_coeff_of_le (t : ℕ) (ht : 0<t) (d m : ℕ) (hm : m ≤ d) :
    let X : Polynomial ℤ := Polynomial.X
    let eta := X * ∏ k ∈ Icc 1 d, ((1 - X ^ (8 * k)) * (1 - X ^ (16 * k)))
    let theta := 1 + 2 * ∑ k ∈ Icc 1 d, X ^ (t * k ^ 2)
    (eta * theta).coeff m =
      PowerSeries.coeff m ((PowerSeries.X : ℤ⟦X⟧) *
        (∏' k : ℕ, (1 - PowerSeries.X ^ (8 * (k + 1)))) *
        (∏' k : ℕ, (1 - PowerSeries.X ^ (16 * (k + 1)))) *
        (1 + 2 * ∑' k : ℕ, PowerSeries.X ^ (t * (k + 1) ^ 2))) := by
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
    exact fun k hk => coeff_tsum_high (fun j => t * (j+1)^2)
      (by intro j; nlinarith [Nat.zero_le (j*j), Nat.mul_le_mul_right ((j+1)^2) (show 1 ≤ t by omega)]) hk

theorem analytic_theta_coefficient (t : ℕ) (ht : 0<t) (m : ℕ) :
    (m.factorial : ℂ)⁻¹ * iteratedDeriv m
      (fun q : ℂ => q * (∏' k : ℕ, (1-(q^8)^(k+1))) *
        (∏' k : ℕ, (1-(q^16)^(k+1))) * (1+2*∑' k : ℕ, q^(t*(k+1)^2))) 0 =
      (PowerSeries.coeff m ((PowerSeries.X : ℤ⟦X⟧) *
        (∏' k : ℕ, (1 - PowerSeries.X ^ (8 * (k + 1)))) *
        (∏' k : ℕ, (1 - PowerSeries.X ^ (16 * (k + 1)))) *
        (1 + 2 * ∑' k : ℕ, PowerSeries.X ^ (t * (k + 1) ^ 2))) : ℤ) := by
  let P (D : ℕ) : ℤ[X] := (Polynomial.X * ∏ k ∈ Icc 1 D,
      ((1-Polynomial.X^(8*k))*(1-Polynomial.X^(16*k)))) *
        (1+2*∑ k ∈ Icc 1 D, Polynomial.X^(t*k^2))
  apply taylor_of_convergent_polynomials (fun D => (P D).map (Int.castRingHom ℂ))
  · simpa only [P, Polynomial.map_mul, Polynomial.map_prod, Polynomial.map_sub,
      Polynomial.map_one, Polynomial.map_pow, Polynomial.map_X, Polynomial.map_add,
      Polynomial.map_sum, Polynomial.map_ofNat] using product_locally_uniform t ht
  · intro D hD
    rw [Polynomial.coeff_map]
    exact congrArg (fun z : ℤ => (z : ℂ)) (finite_coeff_of_le t ht D m hD)

open UpperHalfPlane Function ModularForm

lemma upper_value (t : ℕ) (ht : 0<t) (z : ℍ) :
    let q := Periodic.qParam 1 (z:ℂ)
    ModularForm.eta (8*(z:ℂ)) * ModularForm.eta (16*(z:ℂ)) * jacobiTheta ((2*t:ℂ)*(z:ℂ)) =
      q * (∏' k : ℕ, (1-(q^8)^(k+1))) *
        (∏' k : ℕ, (1-(q^16)^(k+1))) * (1+2*∑' k : ℕ, q^(t*(k+1)^2)) := by
  dsimp only
  have hlead : Periodic.qParam 24 (8*(z:ℂ)) * Periodic.qParam 24 (16*(z:ℂ)) =
      Periodic.qParam 1 z := by
    simp only [Periodic.qParam, ← Complex.exp_add]
    push_cast
    congr 1
    ring
  have htheta : jacobiTheta ((2*t:ℂ)*(z:ℂ)) = 1 + 2 * ∑' k : ℕ, (Periodic.qParam 1 (z:ℂ))^(t*(k+1)^2) := by
    have him : 0 < ((2*t:ℂ)*(z:ℂ)).im := by simp [Complex.mul_im]; positivity [z.im_pos]
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

theorem qExpansion_local (t : ℕ) (ht : 0<t) (m : ℕ) :
    (qExpansion 1 (fun z : ℍ => ModularForm.eta (8*(z:ℂ)) * ModularForm.eta (16*(z:ℂ)) * jacobiTheta ((2*t:ℂ)*(z:ℂ)))).coeff m =
      (((Polynomial.X * ∏ k ∈ Icc 1 m, ((1-(Polynomial.X : ℤ[X])^(8*k))*(1-Polynomial.X^(16*k)))) *
        (1+2*∑ k ∈ Icc 1 m, Polynomial.X^(t*k^2))).coeff m : ℤ) := by
  have hc := (product_locally_uniform t ht).continuousOn (.of_forall fun D => by fun_prop)
  have hd := cuspFunction_of_disk (hc.continuousAt (Metric.ball_mem_nhds (0:ℂ) one_pos)) (upper_value t ht)
  rw [qExpansion_coeff,hd.iteratedDeriv_eq,analytic_theta_coefficient t ht m]
  exact_mod_cast (finite_coeff_of_le t ht m m le_rfl).symm

end TunnellLocalFourier
