import TunnellToricOddLocal
import TunnellToricTwoLocal

/-! Local-to-global invertibility and composition of the quadratic intertwiner ideals. -/

namespace TunnellToricLocal
open TunnellHurwitz TunnellHurwitzFour TunnellShell Quaternion

def rat (a : Quaternion ℤ) : Q := ⟨a.re,a.imI,a.imJ,a.imK⟩

lemma rat_mul (a b : Quaternion ℤ) : rat (a*b)=rat a*rat b := by
  apply QuaternionAlgebra.ext
  all_goals
    first | rw [Quaternion.re_mul] | rw [Quaternion.imI_mul] | rw [Quaternion.imJ_mul] | rw [Quaternion.imK_mul]
    dsimp only [rat]
    simp only [Quaternion.re_mul,Quaternion.imI_mul,Quaternion.imJ_mul,Quaternion.imK_mul,Int.cast_sub,Int.cast_mul,Int.cast_add]

lemma rat_norm (a : Quaternion ℤ) : Quaternion.normSq (rat a)=((Quaternion.normSq a:ℤ):ℚ) := by
  rw [Quaternion.normSq_def',Quaternion.normSq_def']; simp [rat]

lemma local_prime (p n : ℕ) (hp : p.Prime) (hn : Squarefree n) (h2 : n%4=2)
    (v w : Triple) (hv : v∈shell n) (hw : w∈shell n) :
    ∃ q∈intertwiner v w, ∃ N : ℤ, Quaternion.normSq q=(N:ℚ) ∧ ¬(p:ℤ)∣N := by
  by_cases hp2 : p=2
  · subst p
    obtain ⟨q,hq,N,hN,ho⟩ := odd_intertwiner h2 v w hv hw
    exact ⟨q,hq,N,by simpa using hN,by exact_mod_cast (Nat.not_even_iff_odd.mpr ho : ¬Even N) ∘ (fun h : (2:ℕ)∣N => even_iff_two_dvd.mpr h)⟩
  · letI : Fact p.Prime := ⟨hp⟩
    obtain ⟨q,he,hd⟩ := coprime_intertwiner hp2 hn v w hv hw
    refine ⟨rat q,⟨integer_coords _ _ _ _,?_⟩,_,rat_norm _,hd⟩
    have h := congrArg rat he
    simp only [rat_mul] at h
    exact h

def norms (v w : Triple) : Set ℤ := {N | ∃ q∈intertwiner v w, Quaternion.normSq q=(N:ℚ)}

lemma norm_ideal_top {n : ℕ} (hn : Squarefree n) (h2 : n%4=2)
    (v w : Triple) (hv : v∈shell n) (hw : w∈shell n) : Ideal.span (norms v w)=⊤ := by
  let I := Ideal.span (norms v w)
  let g := Submodule.IsPrincipal.generator I
  suffices h : IsUnit g from I.eq_top_of_isUnit_mem (Submodule.IsPrincipal.generator_mem I) h
  by_contra h
  have hg : g.natAbs ≠ 1 := by intro hh; exact h (by simpa [Int.isUnit_iff_natAbs_eq] using hh)
  obtain ⟨p,hp,hd⟩ := Nat.exists_prime_and_dvd hg
  obtain ⟨q,hq,N,hN,he⟩ := local_prime p n hp hn h2 v w hv hw
  have him : N∈I := Ideal.subset_span (show N∈norms v w from ⟨q,hq,hN⟩)
  exact he ((Int.natCast_dvd.mpr hd).trans ((Submodule.IsPrincipal.mem_iff_generator_dvd I).mp him))

lemma star_order {q : Q} (hq : q∈order) : star q∈order := by
  obtain ⟨⟨a,b,c,d⟩,rfl⟩ := hq
  refine ⟨(a+d,-b,-c,-d),?_⟩
  apply QuaternionAlgebra.ext
  all_goals simp only [Quaternion.re_star,Quaternion.imI_star,Quaternion.imJ_star,Quaternion.imK_star] <;> simp [hamZ,ham] <;> ring

lemma pure_star (v : Triple) : star (TunnellHurwitz.pure v)= -TunnellHurwitz.pure v := by
  apply QuaternionAlgebra.ext <;> simp only [Quaternion.re_neg,Quaternion.imI_neg,Quaternion.imJ_neg,Quaternion.imK_neg,
    Quaternion.re_star,Quaternion.imI_star,Quaternion.imJ_star,Quaternion.imK_star] <;> simp [TunnellHurwitz.pure]

lemma star_intertwines {v w : Triple} {q : Q} (hq : q∈intertwiner v w) : star q∈intertwiner w v := by
  have he := congrArg star hq.2
  simp only [star_mul,pure_star,mul_neg,neg_mul,neg_inj] at he
  exact ⟨star_order hq.1,he.symm⟩

def idealProd (A B : AddSubgroup Q) : Submodule ℤ Q := Submodule.span ℤ {x | ∃ a∈A, ∃ b∈B, x=a*b}

lemma idealProd_mem {A B : AddSubgroup Q} {a b : Q} (ha : a∈A) (hb : b∈B) :
    a*b∈idealProd A B := Submodule.subset_span ⟨a,ha,b,hb,rfl⟩

lemma idealProd_one {n : ℕ} (hn : Squarefree n) (h2 : n%4=2)
    (v w : Triple) (hv : v∈shell n) (hw : w∈shell n) : (1:Q)∈idealProd (intertwiner w v) (intertwiner v w) := by
  let f : ℤ →ₗ[ℤ] Q := (Int.castRingHom Q).toAddMonoidHom.toIntLinearMap
  let I := idealProd (intertwiner w v) (intertwiner v w)
  have hle : Ideal.span (norms v w) ≤ I.comap f := by
    apply Submodule.span_le.mpr
    rintro N ⟨q,hq,hn⟩
    change (N:Q)∈I
    have he : star q*q=(N:Q) := by rw [star_mul_self,hn]; rfl
    rw [←he]
    exact idealProd_mem (star_intertwines hq) hq
  have h := hle (show (1:ℤ) ∈ Ideal.span (norms v w) by rw [norm_ideal_top hn h2 v w hv hw]; exact Submodule.mem_top)
  change ((1:ℤ):Q)∈I at h
  simpa using h

lemma compose_ideals {n : ℕ} (hn : Squarefree n) (h2 : n%4=2) (u v w : Triple)
    (hu : u∈shell n) (hv : v∈shell n) :
    idealProd (intertwiner v w) (intertwiner u v)=(intertwiner u w).toIntSubmodule := by
  apply le_antisymm
  · apply Submodule.span_le.mpr
    rintro _ ⟨a,ha,b,hb,rfl⟩
    exact intertwiner_comp ha hb
  · intro x hx
    let f : Q →ₗ[ℤ] Q := (AddMonoidHom.mulLeft x).toIntLinearMap
    let I := idealProd (intertwiner v w) (intertwiner u v)
    have hle : idealProd (intertwiner v u) (intertwiner u v) ≤ I.comap f := by
      apply Submodule.span_le.mpr
      rintro _ ⟨a,ha,b,hb,rfl⟩
      change x*(a*b)∈I
      rw [←mul_assoc]
      exact idealProd_mem (intertwiner_comp hx ha) hb
    have he := hle (idealProd_one hn h2 u v hu hv)
    change x*1∈I at he
    simpa using he

#print axioms compose_ideals

end TunnellToricLocal
