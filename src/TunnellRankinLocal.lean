import Mathlib

/-! Local Rankin–Selberg convolution for an unramified degree-two sequence and a binary ideal-count theta series. -/

namespace TunnellRankin
open Finset

lemma hecke_pair {R : Type*} [CommRing R] {b : ℕ → R} {a p : R} (h0 : b 0=1)
    (h1 : b 1=a) (hr : ∀ k, b (k+2)=a*b (k+1)-p*b k) (i j : ℕ) :
    b (i+1)*b (j+1) - p*b i*b j = b (i+j+2) := by
  induction i using Nat.twoStepInduction with
  | zero => simpa [h0,h1] using (hr j).symm
  | one =>
    rw [hr 0,h0,h1,show 1+j+2=(j+1)+2 by omega,hr (j+1),hr j]
    ring
  | more k h₁ h₂ =>
    rw [show k+2+1=(k+1)+2 by omega,hr (k+1),hr k,
      show k+2+j+2=(k+j+2)+2 by omega,hr (k+j+2)]
    rw [show k+j+2+1=k+1+j+2 by omega,←h₂,←h₁,show k+1+1=k+2 by omega,hr k]
    ring

def eulerConvolution {R : Type*} [CommRing R] (b : ℕ→R) (u : R) (k : ℕ) : R :=
  ∑ j∈range (k+1), u^j*b j*b (k-j)

lemma local_convolution {R : Type*} [CommRing R] {b : ℕ → R} {a p : R} (h0 : b 0=1)
    (h1 : b 1=a) (hr : ∀ k, b (k+2)=a*b (k+1)-p*b k) (u : R) (k : ℕ) :
    eulerConvolution b u (k+2) - p*u*eulerConvolution b u k =
      b (k+2)*∑ j∈range (k+3),u^j := by
  have shift (j : ℕ) (hj : j < k+1) :
      u^(j+1)*b (j+1)*b (k+2-(j+1)) - p*u*(u^j*b j*b (k-j)) = b (k+2)*u^(j+1) := by
    have hx := hecke_pair h0 h1 hr j (k-j)
    rw [show j+(k-j)+2=k+2 by omega] at hx
    rw [show k+2-(j+1)=k-j+1 by omega,pow_succ]
    linear_combination (u^j*u)*hx
  unfold eulerConvolution
  rw [sum_range_succ, sum_range_succ' (f:=fun j => u^j*b j*b (k+2-j)) (n:=k+1)]
  rw [sum_range_succ (f:=fun j => u^j) (n:=k+2), sum_range_succ' (f:=fun j => u^j) (n:=k+1)]
  simp only [pow_zero,h0,mul_one,one_mul,Nat.sub_zero,Nat.sub_self]
  rw [mul_sum]
  have hs := sum_congr (s₁:=range (k+1)) (s₂:=range (k+1)) rfl (fun j hj => shift j (mem_range.mp hj))
  rw [sum_sub_distrib] at hs
  rw [mul_add,mul_add,mul_sum]
  linear_combination hs

end TunnellRankin
#print axioms TunnellRankin.local_convolution
