import TunnellHurwitzOrder
import TunnellShell
import Mathlib.NumberTheory.Zsqrtd.Basic

/-! Trace-zero Hurwitz elements and embeddings of the imaginary quadratic order. -/

namespace TunnellHurwitz
open Quaternion TunnellShell

def pure (v : Triple) : Q := ⟨0,v.1,v.2.1,v.2.2⟩

lemma pure_mem (v : Triple) : pure v∈order := integer_coords 0 _ _ _

lemma pure_injective : Function.Injective pure := by
  intro v w h
  have hi := congrArg QuaternionAlgebra.imI h
  have hj := congrArg QuaternionAlgebra.imJ h
  have hk := congrArg QuaternionAlgebra.imK h
  dsimp [pure] at hi hj hk
  exact Prod.ext (by exact_mod_cast hi) (Prod.ext (by exact_mod_cast hj) (by exact_mod_cast hk))

lemma trace_zero_integral {q : Q} (hq : q∈order) (hr : q.re=0) : ∃ v, q=pure v := by
  obtain ⟨⟨a,b,c,d⟩,rfl⟩ := hq
  change (a:ℚ)+d/2=0 at hr
  refine ⟨(b-a,c-a,-a),?_⟩
  apply QuaternionAlgebra.ext <;> dsimp [hamZ,TunnellHurwitzFour.ham,pure] <;> push_cast <;> linarith

lemma pure_norm (v : Triple) : Quaternion.normSq (pure v)=(TunnellShell.normSq v:ℚ) := by
  rw [Quaternion.normSq_def']
  simp [pure,TunnellShell.normSq]

def quadraticValue (d : ℕ) (v : Triple) (z : Zsqrtd (-(d:ℤ))) : Q :=
  ⟨z.re,z.im*v.1,z.im*v.2.1,z.im*v.2.2⟩

def embed (d : ℕ) (v : Triple) (hv : v∈shell d) : Zsqrtd (-(d:ℤ)) →+* Q where
  toFun := quadraticValue d v
  map_one' := by
    apply QuaternionAlgebra.ext <;> dsimp [quadraticValue] <;> simp
  map_zero' := by
    apply QuaternionAlgebra.ext <;> dsimp [quadraticValue] <;> simp
  map_add' x y := by
    apply QuaternionAlgebra.ext <;> simp only [Quaternion.re_add,Quaternion.imI_add,Quaternion.imJ_add,Quaternion.imK_add]
    all_goals dsimp [quadraticValue]; push_cast; ring
  map_mul' x y := by
    have hn := mem_shell.mp hv
    change _^2+_^2+_^2=(d:ℤ) at hn
    have hq : (v.1:ℚ)^2+(v.2.1:ℚ)^2+(v.2.2:ℚ)^2=d := by exact_mod_cast hn
    apply QuaternionAlgebra.ext
    · rw [Quaternion.re_mul]
      dsimp [quadraticValue]; push_cast
      linear_combination (x.im:ℚ)*y.im*hq
    · rw [Quaternion.imI_mul]; dsimp [quadraticValue]; push_cast; ring
    · rw [Quaternion.imJ_mul]; dsimp [quadraticValue]; push_cast; ring
    · rw [Quaternion.imK_mul]; dsimp [quadraticValue]; push_cast; ring

lemma embed_root (d : ℕ) (v : Triple) (hv : v∈shell d) : embed d v hv Zsqrtd.sqrtd=pure v := by
  change quadraticValue d v _=_
  apply QuaternionAlgebra.ext <;> simp [quadraticValue,pure]

lemma embed_integral (d : ℕ) (v : Triple) (hv : v∈shell d) (z) : embed d v hv z ∈ order := by
  have he : embed d v hv z = (⟨z.re,(z.im*v.1:ℤ),(z.im*v.2.1:ℤ),(z.im*v.2.2:ℤ)⟩ : Q) := by
    change quadraticValue d v z=_
    apply QuaternionAlgebra.ext <;> simp [quadraticValue]
  rw [he]
  exact integer_coords _ _ _ _

lemma negative_root {d : ℕ} (hd : 0<d) (q : Q) (h : q*q= -(d:Q)) :
    q.re=0 ∧ Quaternion.normSq q=d := by
  have h₀ := congrArg QuaternionAlgebra.re h
  have h₁ := congrArg QuaternionAlgebra.imI h
  have h₂ := congrArg QuaternionAlgebra.imJ h
  have h₃ := congrArg QuaternionAlgebra.imK h
  simp only [Quaternion.re_mul,Quaternion.imI_mul,Quaternion.imJ_mul,Quaternion.imK_mul,
    Quaternion.re_neg,Quaternion.imI_neg,Quaternion.imJ_neg,Quaternion.imK_neg,
    Quaternion.re_natCast,Quaternion.imI_natCast,Quaternion.imJ_natCast,Quaternion.imK_natCast,neg_zero] at h₀ h₁ h₂ h₃
  have hr : q.re=0 := by
    by_contra hr
    have hI : q.imI=0 := (mul_eq_zero.mp (show q.re*q.imI=0 by nlinarith [h₁])).resolve_left hr
    have hJ : q.imJ=0 := (mul_eq_zero.mp (show q.re*q.imJ=0 by nlinarith [h₂])).resolve_left hr
    have hK : q.imK=0 := (mul_eq_zero.mp (show q.re*q.imK=0 by nlinarith [h₃])).resolve_left hr
    rw [hI,hJ,hK] at h₀
    have hp : (0:ℚ)<d := by exact_mod_cast hd
    nlinarith [sq_nonneg q.re]
  exact ⟨hr,by rw [normSq_def',hr]; rw [hr] at h₀; nlinarith⟩

abbrev Embedding (d : ℕ) := {f : Zsqrtd (-(d:ℤ)) →+* Q // ∀ z, f z∈order}

lemma exists_embedding_vector {d : ℕ} (hd : 0<d) (f : Embedding d) : ∃ v∈shell d, f.val Zsqrtd.sqrtd = pure v := by
  let q := f.val Zsqrtd.sqrtd
  have hh : q*q= -(d:Q) := by simp [q, ← map_mul,Zsqrtd.dmuld]
  obtain ⟨hr,hn⟩ := negative_root hd q hh
  obtain ⟨v,hv⟩ := trace_zero_integral (f.property _) hr
  refine ⟨v,mem_shell.mpr ?_,hv⟩
  change (f.val Zsqrtd.sqrtd).normSq=_ at hn
  rw [hv,pure_norm] at hn
  exact_mod_cast hn

noncomputable def shellEquiv (d : ℕ) (hd : 0<d) : ↥(shell d) ≃ Embedding d :=
  Equiv.ofBijective (fun v => ⟨embed d v v.property,embed_integral d v v.property⟩) <| by
    constructor
    · intro a b h
      apply Subtype.ext
      apply pure_injective
      simpa only [←embed_root d a.val a.property,←embed_root d b.val b.property] using
        congrArg (fun f:Embedding d => f.val Zsqrtd.sqrtd) h
    · intro f
      obtain ⟨v,hv,he⟩ := exists_embedding_vector hd f
      refine ⟨⟨v,hv⟩,Subtype.ext ?_⟩
      apply Zsqrtd.hom_ext
      exact (embed_root d v hv).trans he.symm

#print axioms shellEquiv

end TunnellHurwitz
