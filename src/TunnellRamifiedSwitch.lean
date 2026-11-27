import TunnellOddDiscriminant
import TunnellComponentFibers

/-! Distinct ramified divisors give distinct integral gluings of the same two binary components. -/
namespace TunnellRamifiedSwitch
open TunnellShell TunnellHurwitz TunnellToricClass TunnellToricLocal TunnellEmbeddedIdeals TunnellRamifiedClasses
open TunnellIdealHNF TunnellQuaternion
noncomputable section

lemma middle_matrix {F : Type*} [Field F] {V : M2 F} (hV : V≠0) :
    ∃ X : M2 F, V*X*V≠0 := by
  classical
  obtain ⟨i,j,hh⟩ : ∃ i j, V i j≠0 := by by_contra! h; exact hV (Matrix.ext h)
  refine ⟨Matrix.single j i 1,?_⟩
  intro he
  have e := congrArg (fun M : M2 F => M i j) he
  fin_cases i <;> fin_cases j <;> simp [Matrix.mul_apply,Fin.sum_univ_two,Matrix.single] at e <;> aesop

lemma middle_nonzero {n p : ℕ} [Fact p.Prime] (hp : p≠2) (hn : Squarefree n) {v : Triple} (hv : v∈shell n) :
    ∃ x : Quaternion ℤ, red p (TunnellQuaternion.pure v*x*TunnellQuaternion.pure v)≠0 := by
  let M := localModel hp
  obtain ⟨X,h⟩ := middle_matrix (residue_nonzero M hn hv)
  refine ⟨lift p (M.f.symm X),?_⟩
  intro e; apply h
  rw [←residue_surj M X,←map_mul,←map_mul,residue_zero]; exact e

def glue {n : ℕ} {v : Triple} (hv : v∈shell n) (a : ℕ) : Lattice :=
  line (a:Q)⁻¹*(image hv (ram n a)*O*image hv (ram n a))

lemma nat_nonzero {a : ℕ} (h : a≠0) : (a:Q)≠0 := by
  intro e; have hh := congrArg QuaternionAlgebra.re e; exact h (by exact_mod_cast (hh : (a:ℚ)=0))

lemma clear_denom {n : ℕ} {v : Triple} (hv : v∈shell n) {a : ℕ} (ha : a≠0) {x : Q} (hx : x∈glue hv a) :
    (a:Q)*x∈O := by
  obtain ⟨y,hy,rfl⟩ := Submodule.mem_span_singleton_mul.mp hx
  rw [←mul_assoc,mul_inv_cancel₀ (nat_nonzero ha),one_mul]
  have hi : image hv (ram n a) ≤ O := by rintro _ ⟨z,_,rfl⟩; exact embed_integral n v hv z
  have hle : image hv (ram n a)*O*image hv (ram n a) ≤ O*O*O := mul_le_mul' (mul_le_mul_left hi O) hi
  rw [mul_O,mul_O] at hle
  exact hle hy

lemma contains_middle {n : ℕ} {v : Triple} (hv : v∈shell n) (a : ℕ) (x : Quaternion ℤ) :
    (a:Q)⁻¹*rat (TunnellQuaternion.pure v*x*TunnellQuaternion.pure v)∈glue hv a := by
  have h : TunnellHurwitz.pure v∈image hv (ram n a) :=
    ⟨Zsqrtd.sqrtd, (show principal (Zsqrtd.sqrtd:R n) ≤ ram n a from le_sup_right)
      (Ideal.mem_span_singleton_self _),embed_root n v hv⟩
  have hx : rat x∈O := integer_coords _ _ _ _
  apply Submodule.mem_span_singleton_mul.mpr
  refine ⟨_,Submodule.mul_mem_mul (Submodule.mul_mem_mul h hx) h,?_⟩
  simp only [rat_mul]; rfl

lemma double_rat {x : Q} (hx : x∈O) : ∃ y : Quaternion ℤ, (2:Q)*x=rat y := by
  obtain ⟨a,b,c,d,ha,hb,hc,hd⟩ := doubled_coords hx
  refine ⟨⟨a,b,c,d⟩,?_⟩
  rw [two_mul]; apply QuaternionAlgebra.ext
  all_goals dsimp only [Quaternion.re_add,Quaternion.imI_add,Quaternion.imJ_add,Quaternion.imK_add,rat]; linarith

lemma rat_injective : Function.Injective rat := by
  intro x y h; apply QuaternionAlgebra.ext
  · have e := congrArg QuaternionAlgebra.re h; change (x.re:ℚ)=y.re at e; exact_mod_cast e
  · have e := congrArg QuaternionAlgebra.imI h; change (x.imI:ℚ)=y.imI at e; exact_mod_cast e
  · have e := congrArg QuaternionAlgebra.imJ h; change (x.imJ:ℚ)=y.imJ at e; exact_mod_cast e
  · have e := congrArg QuaternionAlgebra.imK h; change (x.imK:ℚ)=y.imK at e; exact_mod_cast e

lemma rat_smul (a : ℤ) (x : Quaternion ℤ) : rat (a • x)=(a:Q)*rat x := by
  rw [zsmul_eq_mul,rat_mul]; rfl

lemma only_if_prime {n p a b : ℕ} [Fact p.Prime] (hp : p≠2) (hn : Squarefree n) {v : Triple} (hv : v∈shell n)
    (ha : a≠0) (hb : b≠0) (hd : p∣a) (e : glue hv a ≤ glue hv b) : p∣b := by
  obtain ⟨x,hx⟩ := middle_nonzero hp hn hv
  let z := TunnellQuaternion.pure v*x*TunnellQuaternion.pure v
  obtain ⟨y,ey⟩ := double_rat (clear_denom hv hb (e (contains_middle hv a x)))
  change 2*((b:Q)*((a:Q)⁻¹*rat z))=rat y at ey
  have H : rat (((2*b:ℕ):ℤ) • z)=rat ((a:ℤ) • y) := by
    rw [rat_smul,rat_smul,←ey]; push_cast
    have hc := Nat.cast_comm a (b:Q)
    have hcancel : (a:Q)*((a:Q)⁻¹*rat z)=rat z := by rw [←mul_assoc,mul_inv_cancel₀ (nat_nonzero ha),one_mul]
    have hs (q : Q) : (a:Q)*(2*((b:Q)*q))=2*((b:Q)*((a:Q)*q)) := by
      rw [←mul_assoc,Nat.cast_comm a (2:Q),mul_assoc,←mul_assoc (a:Q),hc,mul_assoc (b:Q)]
    rw [hs,hcancel,mul_assoc]
  have he := congrArg (red p) (rat_injective H)
  rw [red_smul,red_smul] at he; push_cast at he
  rw [(ZMod.natCast_eq_zero_iff _ _).mpr hd,zero_smul] at he
  have h2 : (2:ZMod p)≠0 := by
    intro h; exact hp ((Nat.prime_dvd_prime_iff_eq (Fact.out:p.Prime) Nat.prime_two).mp ((ZMod.natCast_eq_zero_iff 2 p).mp h))
  exact (ZMod.natCast_eq_zero_iff _ _).mp ((mul_eq_zero.mp ((smul_eq_zero.mp he).resolve_right hx)).resolve_left h2)

theorem injective {d : ℕ} (hs : Squarefree d) (hn : Squarefree (2*d)) (hd : Odd d) {v : Triple} (hv : v∈shell (2*d)) :
    Function.Injective (fun a : ↥d.divisors => glue hv a.val) := by
  intro a b he
  obtain ⟨ha,hd0⟩ := Nat.mem_divisors.mp a.property
  obtain ⟨hb,_⟩ := Nat.mem_divisors.mp b.property
  have sa := hs.squarefree_of_dvd ha
  have sb := hs.squarefree_of_dvd hb
  have hp (p : ℕ) (h : p.Prime) (hh : p∣d) : p≠2 := by rintro rfl; exact (Nat.not_even_iff_odd.mpr hd) (even_iff_two_dvd.mpr hh)
  have eq : a.val.primeFactors=b.val.primeFactors := by
    ext p; rw [Nat.mem_primeFactors,Nat.mem_primeFactors]
    constructor
    · rintro ⟨hh,had,_⟩; letI : Fact p.Prime := ⟨hh⟩
      exact ⟨hh,only_if_prime (hp p hh (had.trans ha)) hn hv sa.ne_zero sb.ne_zero had he.le,sb.ne_zero⟩
    · rintro ⟨hh,hbd,_⟩; letI : Fact p.Prime := ⟨hh⟩
      exact ⟨hh,only_if_prime (hp p hh (hbd.trans hb)) hn hv sb.ne_zero sa.ne_zero hbd he.ge,sa.ne_zero⟩
  apply Subtype.ext
  rw [←Nat.prod_primeFactors_of_squarefree sa,←Nat.prod_primeFactors_of_squarefree sb,eq]

end
end TunnellRamifiedSwitch
#print axioms TunnellRamifiedSwitch.injective

