import TunnellRankinLocal

/-! The analytic Euler factor of the Rankin convolution, including all ramification signs. -/

namespace TunnellRankin
open Finset

theorem rankin_local_hasSum {b : ℕ→ℂ} {a p : ℂ} (h0 : b 0=1) (h1 : b 1=a)
    (hr : ∀ k, b (k+2)=a*b (k+1)-p*b k) (u T : ℂ) {F G : ℂ}
    (hf : HasSum (fun k : ℕ => b k*T^k) F) (hg : HasSum (fun k : ℕ => b k*(u*T)^k) G) :
    HasSum (fun k : ℕ => b k*(∑ j∈range (k+1),u^j)*T^k) ((1-p*u*T^2)*F*G) := by
  let H (k : ℕ) := eulerConvolution b u k*T^k
  let U (k : ℕ) := if 2≤k then H (k-2) else 0
  have hH : HasSum H (G*F) := by
    have h := hasSum_sum_range_mul_of_summable_norm hg.summable.norm hf.summable.norm
    rw [hg.tsum_eq,hf.tsum_eq] at h
    apply h.congr_fun
    intro k
    simp only [H,eulerConvolution,sum_mul]
    apply sum_congr rfl
    intro j hj
    have hj' : j+(k-j)=k := by have := mem_range.mp hj; omega
    rw [mul_pow,show T^k=T^j*T^(k-j) by rw [←pow_add,hj']]
    ring
  have hU : HasSum U (G*F) := by
    apply (hasSum_nat_add_iff' 2).mp
    simpa [U,sum_range_succ] using hH
  have hsub := hH.sub (hU.mul_left (p*u*T^2))
  rw [show G*F-(p*u*T^2)*(G*F)=(1-p*u*T^2)*F*G by ring] at hsub
  apply hsub.congr_fun
  intro k
  rcases k with _|(_|k)
  · simp [H,U,eulerConvolution,h0]
  · norm_num [H,U,eulerConvolution,h0,sum_range_succ] <;> ring_nf <;> tauto
  · change b (k+2)*(∑ j∈range (k+3),u^j)*T^(k+2) = H (k+2)-p*u*T^2*U (k+2)
    simp only [H,U,show 2≤k+2 by omega,if_true,show k+2-2=k by omega]
    rw [pow_add]
    linear_combination -(T^k*T^2)*local_convolution h0 h1 hr u k

end TunnellRankin
#print axioms TunnellRankin.rankin_local_hasSum
