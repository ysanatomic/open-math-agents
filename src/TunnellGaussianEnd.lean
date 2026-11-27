import Mathlib.Tactic

/-! Annihilation of the division kernel for conjugate Gaussian endomorphisms of norm p. -/
namespace TunnellGaussianEnd

variable {A : Type*} [AddCommGroup A]

def endo (I : A→+A) (a b : ℤ) : A→+A := a • AddMonoidHom.id _ + b • I

lemma endo_apply (I : A→+A) (a b : ℤ) (x:A) : endo I a b x=a•x+b•I x := rfl

theorem gaussian_kernel_annihilated (I : A→+A) (hi : ∀ x, I (I x)= -x) (a b : ℤ)
    {p : ℕ} (hab : a^2+b^2=(p:ℤ)) (r : ℕ) (x : A) (hx : (endo I a b)^[r] x=0) :
    p^r • x=0 := by
  let f := endo I a b
  let g := endo I a (-b)
  have hgf (y:A) : g (f y) = p • y := by
    simp only [g,f,endo_apply,map_add,map_zsmul,hi]
    rw [← natCast_zsmul y p,←hab]; module
  have hpow (m:ℕ) (y:A) : g^[m] (f^[m] y)=p^m • y := by
    induction m generalizing y with
    | zero => simp
    | succ m ih =>
      rw [Function.iterate_succ_apply',Function.iterate_succ_apply,ih,map_nsmul,hgf,smul_smul,pow_succ]
  have h := hpow r x
  change f^[r] x=0 at hx
  rw [hx,Function.iterate_fixed (map_zero g) r] at h
  exact h.symm

end TunnellGaussianEnd
