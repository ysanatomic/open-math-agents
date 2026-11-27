import TunnellIdealGluings
import TunnellTwoProjection
import TunnellOddGlueCoordinates

/-! At every odd ramified prime the quaternionic overlattice has a nonzero discriminant coordinate. -/
namespace TunnellGlueMaximal
open TunnellHurwitz TunnellToricClass TunnellShell TunnellToricLocal TunnellQuaternion TunnellPairComponents
open TunnellTwoProjection TunnellRamifiedSwitch TunnellIdealGluings
noncomputable section

lemma middle_two {F : Type*} [Field F] {V W : M2 F} (hv : V≠0) (hw : W≠0) :
    ∃ X : M2 F, W*X*V≠0 := by
  classical
  obtain ⟨i,j,hij⟩ : ∃ i j, W i j≠0 := by by_contra! h; exact hw (Matrix.ext h)
  obtain ⟨k,l,hkl⟩ : ∃ k l, V k l≠0 := by by_contra! h; exact hv (Matrix.ext h)
  refine ⟨Matrix.single j k 1,fun he => ?_⟩
  have e := congrArg (fun M:M2 F => M i l) he
  have h : (W*(Matrix.single j k 1:M2 F)*V) i l=W i j*V k l := by
    rw [Matrix.mul_apply,Finset.sum_eq_single k]
    · rw [Matrix.mul_single_apply_same]; simp
    · intro a _ ha; rw [Matrix.mul_single_apply_of_ne 1 j k i a ha W]; simp
    · simp
  exact (mul_ne_zero hij hkl) (h.symm.trans e)

local notation "ι" => TunnellHurwitz.pure

def pairL (s t : Triple) : Lattice := J s t ⊔ line 2*J (-s) t

lemma middle_of_mem {n : ℕ} {s t : Triple} (hs : s∈shell n) {x : Q} (hx : x∈pairL s t) :
    ∃ y∈O, ι t*x*ι s=(n:Q)*y := by
  obtain ⟨u,hu,z,hz,rfl⟩ := Submodule.mem_sup.mp hx
  obtain ⟨v,hv,rfl⟩ := Submodule.mem_span_singleton_mul.mp hz
  have he : ι t*v= -(v*ι s) := by simpa [pure_neg] using hv.2
  have e₁ : ι t*u*ι s= -(n:Q)*u := by rw [hu.2,mul_assoc,pure_square hs,mul_neg,←Nat.cast_comm n u,neg_mul]
  have e₂ : ι t*v*ι s=(n:Q)*v := by rw [he,neg_mul,mul_assoc,pure_square hs,mul_neg,neg_neg,←Nat.cast_comm n v]
  have hz : 2*v∈O := by simpa only [zsmul_eq_mul,Int.cast_ofNat] using O.smul_mem (2:ℤ) hv.1
  refine ⟨-u+2*v,O.add_mem (O.neg_mem hu.1) hz,?_⟩
  calc _=ι t*u*ι s+2*(ι t*v*ι s) := by noncomm_ring
       _=_ := by rw [e₁,e₂]; noncomm_ring

lemma reduction_forces {p b n : ℕ} [Fact p.Prime] (hp2 : p≠2) (hb : ¬p∣b) (hp : p∣n) {x : Quaternion ℤ}
    (y : Q) (hy : y∈O) (e : (b:Q)*rat x=(n:Q)*y) : red p x=0 := by
  obtain ⟨z,ez⟩ := double_rat hy
  have he : rat (((2*b:ℕ):ℤ) • x)=rat ((n:ℤ) • z) := by
    rw [rat_smul,rat_smul,←ez]; push_cast
    calc _=2*((b:Q)*rat x) := by noncomm_ring
         _=_ := by rw [e]; noncomm_ring
  have hh := congrArg (red p) (rat_injective he); rw [red_smul,red_smul] at hh; push_cast at hh
  rw [(ZMod.natCast_eq_zero_iff _ _).mpr hp,zero_smul] at hh
  have h2 : (2:ZMod p)≠0 := by intro h; exact hp2 ((Nat.prime_dvd_prime_iff_eq (Fact.out:p.Prime) Nat.prime_two).mp ((ZMod.natCast_eq_zero_iff 2 p).mp h))
  exact (smul_eq_zero.mp hh).resolve_left (mul_ne_zero h2 ((ZMod.natCast_eq_zero_iff _ _).not.mpr hb))

theorem nonzero {d p : ℕ} [Fact p.Prime] (hp : p∣d) (hp2 : p≠2) (hn : Squarefree (2*d)) (hd : 0<d)
    {s t : Triple} (hs : s∈shell (2*d)) (ht : t∈shell (2*d)) :
    ∃ q∈O, admits d s t q ∧ ((d/p:ℕ):Q)*q∉pairL s t := by
  let M := localModel hp2
  obtain ⟨X,hX⟩ := middle_two (residue_nonzero M hn hs) (residue_nonzero M hn ht)
  let z := lift p (M.f.symm X)
  let m := TunnellQuaternion.pure t*z*TunnellQuaternion.pure s
  have hm : red p m≠0 := by
    intro he; apply hX; rw [←residue_surj M X,←map_mul,←map_mul,residue_zero]; exact he
  have hz : rat z∈O := integer_coords _ _ _ _
  have h8 : 8*rat z∈O := by simpa only [zsmul_eq_mul,Int.cast_ofNat] using O.smul_mem (8:ℤ) hz
  refine ⟨8*rat z,h8,(admits_iff hs ht hd h8).mpr ?_,?_⟩
  · refine ⟨filt d s t (rat z),O.add_mem ?_ (order.mul_mem (order.mul_mem (pure_mem t) hz) (pure_mem s)),?_⟩
    · change 2*(d:Q)*rat z∈O
      simpa only [zsmul_eq_mul,Int.cast_mul,Int.cast_ofNat,Int.cast_natCast] using O.smul_mem (2*(d:ℤ)) hz
    · unfold filt; noncomm_ring
  · intro he
    obtain ⟨y,hy,ey⟩ := middle_of_mem hs he
    have H : (((d/p)*8:ℕ):Q)*rat m=((2*d:ℕ):Q)*y := by
      rw [←ey]; simp only [Nat.cast_mul,Nat.cast_ofNat,m,rat_mul]
      change ((d/p:ℕ):Q)*8*(ι t*rat z*ι s)=ι t*(((d/p:ℕ):Q)*(8*rat z))*ι s
      rw [←mul_assoc (ι t) ((d/p:ℕ):Q),←Nat.cast_comm (d/p) (ι t)]
      noncomm_ring
    apply hm (reduction_forces hp2 (fun h => ?_) (hp.trans (dvd_mul_left ..)) y hy H)
    rcases (Fact.out:p.Prime).dvd_mul.mp h with e|e
    · exact TunnellOddDiscriminant.quotient_nonzero (Squarefree.squarefree_of_dvd (dvd_mul_left d 2) hn) hp ((ZMod.natCast_eq_zero_iff _ _).mpr e)
    · have he := (Fact.out:p.Prime).dvd_of_dvd_pow (n:=3) (show p∣2^3 from e)
      exact hp2 ((Nat.prime_dvd_prime_iff_eq (Fact.out:p.Prime) Nat.prime_two).mp he)

end
end TunnellGlueMaximal
#print axioms TunnellGlueMaximal.nonzero

