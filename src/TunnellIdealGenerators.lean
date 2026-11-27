import TunnellEmbeddedIdeals
import TunnellQuadraticIdealNorm
import TunnellRankinIdealCount

/-! Norm representations in an ideal and integral ideals in its inverse class. -/
namespace TunnellIdealGenerators
open TunnellIdealHNF TunnellShell TunnellHurwitz TunnellToricClass TunnellEmbeddedIdeals
noncomputable section

lemma domain {n : ℕ} (hn : 0<n) : IsDomain (R n) := by
  letI : NoZeroDivisors (R n) := ⟨by
    intro x y h
    by_contra! hxy
    have hN := congrArg Zsqrtd.norm h
    rw [Zsqrtd.norm_mul,Zsqrtd.norm_zero] at hN
    exact (mul_pos (positive_norm hn hxy.1) (positive_norm hn hxy.2)).ne' hN⟩
  exact NoZeroDivisors.to_isDomain _

lemma unit_sign {n : ℕ} (hn : 2≤n) (u : (R n)ˣ) : (u:R n)=1 ∨ (u:R n)= -1 := by
  have h := (Zsqrtd.norm_eq_one_iff' (d:= -(n:ℤ)) (by omega) u.val).mpr u.isUnit
  change u.val.re*u.val.re- -(n:ℤ)*u.val.im*u.val.im=1 at h
  have h0 : u.val.im=0 := by
    by_contra hn0
    have hi : 1≤u.val.im*u.val.im := mul_self_pos.mpr hn0
    nlinarith [mul_le_mul_of_nonneg_left hi (show 0≤(n:ℤ) by omega),mul_self_nonneg u.val.re]
  rw [h0] at h
  have he : (u.val.re-1)*(u.val.re+1)=0 := by nlinarith
  rcases mul_eq_zero.mp he with h|h
  · exact Or.inl (Zsqrtd.ext (by change u.val.re=1; omega) h0)
  · exact Or.inr (Zsqrtd.ext (by change u.val.re= -1; omega) (by simpa using h0))

lemma generator_sign {n : ℕ} (hn : 2≤n) {x y : R n} (h : principal x=principal y) :
    y=x ∨ y= -x := by
  letI := domain (show 0<n by omega)
  obtain ⟨u,hu⟩ := Ideal.span_singleton_eq_span_singleton.mp h
  rcases unit_sign hn u with h|h <;> simp [h] at hu <;> exact (by tauto)

def divide {n : ℕ} (I : Ideal (R n)) (x : R n) : Ideal (R n) :=
  (principal x*conjugate I).colon {(normI I:R n)}

lemma mul_right_cancel_ideal {n : ℕ} (hn : Squarefree n) (h2 : n%4=2)
    {I A B : Ideal (R n)} (hI : I≠⊥) (h : A*I=B*I) : A=B := by
  letI := domain (show 0<n by omega)
  apply (Ideal.span_singleton_mul_left_inj (Nat.cast_ne_zero.mpr (normI_positive (by omega) I hI).ne')).mp
  change A*principal (normI I:R n)=B*principal (normI I:R n)
  rw [←norm_conjugate hn h2 I hI,←mul_assoc,←mul_assoc,h]

lemma divide_mul {n : ℕ} (hn : Squarefree n) (h2 : n%4=2) {I : Ideal (R n)} (hI : I≠⊥) {x : R n} (hx : x∈I) :
    divide I x*I=principal x := by
  letI := domain (show 0<n by omega)
  let P := principal x*conjugate I
  let N : R n := normI I
  have hp0 : principal x≤I := by rw [principal,Ideal.span_singleton_le_iff_mem]; exact hx
  have hp : P≤principal N := (mul_le_mul_left hp0 _).trans_eq (norm_conjugate hn h2 I hI)
  have hP : divide I x*principal N = P := by
    ext t
    rw [principal,Ideal.mem_mul_span_singleton]
    constructor
    · rintro ⟨y,hy,rfl⟩
      exact Submodule.mem_colon_singleton.mp hy
    · intro ht
      obtain ⟨y,hy⟩ := Ideal.mem_span_singleton.mp (hp ht)
      exact ⟨y,Submodule.mem_colon_singleton.mpr (show y*N∈P by rwa [mul_comm,←hy]),(mul_comm _ _).trans hy.symm⟩
  have hN : N≠0 := Nat.cast_ne_zero.mpr (normI_positive (by omega) I hI).ne'
  apply (Ideal.span_singleton_mul_left_inj hN).mp
  change divide I x*I*principal N=principal x*principal N
  calc
    _ = (divide I x*principal N)*I := by ac_rfl
    _ = principal x*(I*conjugate I) := by rw [hP]; dsimp [P]; ac_rfl
    _ = _ := by rw [norm_conjugate hn h2 I hI]

lemma image_principal_mul {n : ℕ} {v : Triple} (hn : Squarefree n) (h2 : n%4=2) (hv : v∈shell n)
    (x : R n) (I : Ideal (R n)) : image hv (principal x * I) = line (embed n v hv x)*image hv I := by
  rw [image_mul,principal,image_principal hn h2 hv, mul_assoc,←image_order hn h2 hv,←image_mul,Ideal.top_mul]

theorem inverse_class_iff {n : ℕ} {v : Triple} (hn : Squarefree n) (h2 : n%4=2) (hv : v∈shell n)
    {I B : Ideal (R n)} (hI : I≠⊥) :
    homothetic v (image hv (conjugate I)) (image hv B) ↔ ∃ x : R n, x≠0 ∧ B*I=principal x := by
  let N : Q := normI I
  have hN : N≠0 := by
    intro h
    have H := congrArg QuaternionAlgebra.re h
    change ((normI I:ℕ):ℚ)=0 at H
    exact (normI_positive (by omega) I hI).ne' (by exact_mod_cast H)
  have hNc : N∈C v := mem_C.mpr (Nat.cast_comm (normI I) _).symm
  constructor
  · rintro ⟨c,_,hc,e⟩
    have h : image hv (B*I)=line (c*N)*J v v := by
      rw [image_mul,←e,mul_assoc,←image_mul,mul_comm (conjugate I),norm_conjugate hn h2 I hI,principal,image_principal hn h2 hv,map_natCast,←mul_assoc,line_mul]
    have hm : c*N ∈ image hv (B*I) := by
      rw [h]; exact Submodule.mem_span_singleton_mul.mpr ⟨1,one_J v,mul_one _⟩
    obtain ⟨x,_,ex⟩ := (mem_image _).mp hm
    refine ⟨x,fun H => (mul_ne_zero hc hN) (by simpa [H] using ex.symm),image_injective hn hv ?_⟩
    rw [h,principal,image_principal hn h2 hv,ex]
  · rintro ⟨x,hx,e⟩
    let X := embed n v hv x
    have hX : X≠0 := fun h => hx (embed_inj hn hv (h.trans (map_zero _).symm))
    have hXc : X∈C v := center_image hv (principal x) ⟨x,Ideal.mem_span_singleton_self _,rfl⟩
    have he : line N*image hv B = line X*image hv (conjugate I) := by
      have H : principal (normI I:R n)*B = principal x*conjugate I := by
        rw [←norm_conjugate hn h2 I hI,←e]; ac_rfl
      have H' := congrArg (image hv) H
      rw [image_principal_mul hn h2 hv,image_principal_mul hn h2 hv,map_natCast] at H'
      exact H'
    refine ⟨N⁻¹*X,(mul_C v) (Submodule.mul_mem_mul (mem_C.mpr ((show Commute _ N from mem_C.mp hNc).inv_right₀)) hXc),
      mul_ne_zero (inv_ne_zero hN) hX,?_⟩
    rw [←line_mul,mul_assoc,←he,←mul_assoc,two_sided_inverse hN,one_mul]

end
end TunnellIdealGenerators
#print axioms TunnellIdealGenerators.divide_mul
#print axioms TunnellIdealGenerators.inverse_class_iff
