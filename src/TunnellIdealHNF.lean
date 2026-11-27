import Mathlib
/-! Hermite normal forms for the ideals of the imaginary quadratic order ℤ[√−n]. -/
namespace TunnellIdealHNF
abbrev R (n : ℕ) := Zsqrtd (-(n:ℤ))

structure Data (n : ℕ) where
  c : ℕ
  a : ℕ
  b : ℕ
  pos_c : 0<c
  pos_a : 0<a
  lt_b : b<a
  divides : (a:ℤ)∣(b:ℤ)^2+n

def ideal {n : ℕ} (s : Data n) : Ideal (R n) where
  carrier := {x | (s.c:ℤ)∣x.im ∧ (s.c:ℤ)*s.a∣x.re-s.b*x.im}
  zero_mem' := by simp
  add_mem' := by
    rintro x y ⟨hx,hx'⟩ ⟨hy,hy'⟩
    refine ⟨dvd_add hx hy,?_⟩
    change _ ∣ x.re+y.re-_* (x.im+y.im)
    rw [show x.re+y.re-(s.b:ℤ)*(x.im+y.im)=(x.re-s.b*x.im)+(y.re-s.b*y.im) by ring]
    exact dvd_add hx' hy'
  smul_mem' := by
    rintro x y ⟨⟨u,hu⟩,⟨t,ht⟩⟩
    obtain ⟨C,hC⟩ := s.divides
    change _ ∣ (x*y).im ∧ _ ∣ (x*y).re - _ * (x*y).im
    rw [Zsqrtd.re_mul,Zsqrtd.im_mul]
    constructor
    · exact ⟨x.re*u+(s.a*t+s.b*u)*x.im,by linear_combination (x.re+s.b*x.im)*hu+x.im*ht⟩
    · exact ⟨(x.re-s.b*x.im)*t-x.im*C*u,by linear_combination (x.re-s.b*x.im)*ht-
        x.im*((s.b:ℤ)^2+n)*hu-x.im*(s.c:ℤ)*u*hC⟩

lemma mem_ideal {n : ℕ} (s : Data n) (x : R n) : x∈ideal s ↔
    (s.c:ℤ)∣x.im ∧ (s.c:ℤ)*s.a∣x.re-s.b*x.im := Iff.rfl

lemma real_slice {n : ℕ} (s : Data n) (x : ℤ) : (⟨x,0⟩:R n)∈ideal s ↔ (s.c:ℤ)*s.a∣x := by simp [mem_ideal]
lemma lift_basis {n : ℕ} (s : Data n) : (⟨s.c*s.b,s.c⟩:R n)∈ideal s := by simp [mem_ideal,mul_comm]
lemma real_basis {n : ℕ} (s : Data n) : (⟨s.c*s.a,0⟩:R n)∈ideal s := (real_slice _ _).mpr dvd_rfl

lemma positive_generator (S : Ideal ℤ) {x : ℤ} (hx : x∈S) (hx0 : x≠0) :
    ∃ c : ℕ, 0<c ∧ ∀ y : ℤ, y∈S ↔ (c:ℤ)∣y := by
  let a := Submodule.IsPrincipal.generator S
  have h (y : ℤ) : y∈S ↔ a∣y := Submodule.IsPrincipal.mem_iff_generator_dvd S
  have h0 : a≠0 := by intro he; have := (h x).mp hx; simp [he,hx0] at this
  exact ⟨a.natAbs,Int.natAbs_pos.mpr h0,fun y => (h y).trans Int.natAbs_dvd.symm⟩

def imHom (n : ℕ) : R n →+ ℤ where
  toFun := Zsqrtd.im
  map_zero' := rfl
  map_add' _ _ := rfl

lemma cast_int {n : ℕ} (a : ℤ) : (a:R n)=⟨a,0⟩ := rfl

lemma normal_form {n : ℕ} (hn : 0<n) {I : Ideal (R n)} (hI : I≠⊥) :
    ∃ s : Data n, I=ideal s := by
  obtain ⟨z,hz,hz0⟩ := Submodule.exists_mem_ne_zero_of_ne_bot hI
  have hnorm : (z.norm:R n)∈I := by rw [Zsqrtd.norm_eq_mul_conj]; exact I.mul_mem_right _ hz
  have hnorm0 : z.norm≠0 := by
    intro h; apply hz0
    change z.re*z.re- -(n:ℤ)*z.im*z.im=0 at h
    have ha : z.im=0 := by
      by_contra ha
      have hsq : 0<z.im*z.im := mul_self_pos.mpr ha
      have e := mul_pos (show 0<(n:ℤ) by exact_mod_cast hn) hsq
      nlinarith [mul_self_nonneg z.re]
    have hb : z.re=0 := by rw [ha] at h; simpa using h
    exact Zsqrtd.ext hb ha
  let S := I.comap (Int.castRingHom (R n))
  obtain ⟨A,hA,real_iff⟩ := positive_generator S hnorm hnorm0
  change ∀ y : ℤ, (y:R n)∈I ↔ (A:ℤ)∣y at real_iff
  have hR := (real_iff A).mpr dvd_rfl
  let T := (I.toAddSubgroup.map (imHom n)).toIntSubmodule
  have hT : ∀ y : ℤ, y∈T ↔ ∃ x∈I, x.im=y := fun _ => Iff.rfl
  have hroot (x : R n) (h : x∈I) : x.re∈T := (hT _).mpr ⟨Zsqrtd.sqrtd*x,I.mul_mem_left _ h,by simp [Zsqrtd.im_mul]⟩
  obtain ⟨c,hc,imag_iff⟩ := positive_generator T (hroot _ hR) (show ((A:R n).re:ℤ)≠0 by simpa using hA.ne')
  have ca : (c:ℤ)∣A := (imag_iff _).mp (hroot _ hR)
  obtain ⟨a,haa⟩ := (Int.natCast_dvd_natCast.mp ca)
  have hap : 0<a := by by_contra! h; have := Nat.eq_zero_of_le_zero h; simp [this] at haa; omega
  have eA : (A:ℤ)=c*a := by exact_mod_cast haa
  obtain ⟨v,hv,he⟩ := (hT _).mp ((imag_iff c).mpr dvd_rfl)
  obtain ⟨b₀,hb₀⟩ := (imag_iff v.re).mp (hroot v hv)
  let b := b₀%(a:ℤ)
  have hbpos : 0≤b := Int.emod_nonneg _ (by exact_mod_cast hap.ne')
  have hblt : b<(a:ℤ) := Int.emod_lt_of_pos _ (by exact_mod_cast hap)
  have hlin : (⟨c*b,c⟩:R n)∈I := by
    have hh := I.sub_mem hv (I.mul_mem_left ((b₀/(a:ℤ):ℤ):R n) hR)
    convert hh using 1
    apply Zsqrtd.ext
    · simp only [Zsqrtd.re_sub,Zsqrtd.re_mul,cast_int,mul_zero,add_zero]
      change (c:ℤ)*b = v.re - b₀/a*A
      rw [eA,hb₀]
      dsimp [b]
      linear_combination (c:ℤ)*(Int.emod_add_mul_ediv b₀ a)
    · simp only [Zsqrtd.im_sub,Zsqrtd.im_mul,cast_int,mul_zero,zero_mul,zero_add,sub_zero]; exact he.symm
  have mem (x : R n) : x∈I ↔ (c:ℤ)∣x.im ∧ (A:ℤ)∣x.re-b*x.im := by
    constructor
    · intro hx
      obtain ⟨t,ht⟩ := (imag_iff x.im).mp ((hT _).mpr ⟨x,hx,rfl⟩)
      refine ⟨⟨t,ht⟩,(real_iff _).mp ?_⟩
      have hh := I.sub_mem hx (I.mul_mem_left (t:R n) hlin)
      convert hh using 1; apply Zsqrtd.ext
      · change x.re-b*x.im=x.re-(t*(c*b)+ -(n:ℤ)*0*c); rw [ht]; ring
      · change (0:ℤ)=x.im-(t*c+0*(c*b)); rw [ht]; ring
    · rintro ⟨⟨t,ht⟩,hA'⟩
      have hh := I.add_mem ((real_iff _).mpr hA') (I.mul_mem_left (t:R n) hlin)
      convert hh using 1; apply Zsqrtd.ext
      · change x.re=x.re-b*x.im+(t*(c*b)+ -(n:ℤ)*0*c); rw [ht]; ring
      · change x.im=0+(t*c+0*(c*b)); rw [ht]; ring
  have hmultiple := ((mem _).mp (I.mul_mem_left Zsqrtd.sqrtd hlin)).2
  rw [Zsqrtd.re_mul,Zsqrtd.im_mul] at hmultiple
  simp only [Zsqrtd.re_sqrtd,Zsqrtd.im_sqrtd,zero_mul,mul_one,one_mul,zero_add] at hmultiple
  obtain ⟨t,ht⟩ := hmultiple
  have e : (b^2+(n:ℤ))=(a:ℤ)*(-t) := by
    apply mul_left_cancel₀ (show (c:ℤ)≠0 by exact_mod_cast hc.ne')
    rw [eA] at ht
    linear_combination -ht
  let s : Data n := ⟨c,a,b.toNat,hc,hap,by omega,by exact ⟨-t,by simpa [Int.toNat_of_nonneg hbpos] using e⟩⟩
  refine ⟨s,?_⟩
  ext x
  rw [mem,mem_ideal]
  change _ ↔ (c:ℤ)∣x.im ∧ (c:ℤ)*a∣x.re-b.toNat*x.im
  rw [←eA,Int.toNat_of_nonneg hbpos]


lemma ideal_ne_bot {n : ℕ} (s : Data n) : ideal s≠⊥ := by
  intro h
  have he := real_basis s
  rw [h] at he
  have hh := congrArg Zsqrtd.re (show (⟨(s.c:ℤ)*s.a,0⟩:R n)=0 from he)
  change (s.c:ℤ)*s.a=0 at hh
  exact (mul_ne_zero (by exact_mod_cast s.pos_c.ne') (by exact_mod_cast s.pos_a.ne')) hh

lemma ideal_injective {n : ℕ} : Function.Injective (@ideal n) := by
  intro s t h
  have mono {s t : Data n} (h : ideal s ≤ ideal t) : t.c∣s.c ∧ t.c*t.a∣s.c*s.a ∧ (t.c:ℤ)*t.a∣s.c*s.b-t.b*s.c := by
    have e := (mem_ideal _ _).mp (h (lift_basis s))
    have e' := (real_slice _ _).mp (h (real_basis s))
    exact ⟨Int.natCast_dvd_natCast.mp (show (t.c:ℤ)∣(s.c:ℤ) from e.1),by exact_mod_cast e',e.2⟩
  obtain ⟨c₁,a₁,b₁⟩ := mono h.le
  obtain ⟨c₂,a₂,_⟩ := mono h.ge
  have c := Nat.dvd_antisymm c₂ c₁
  have ca := Nat.dvd_antisymm a₂ a₁
  have a : s.a=t.a := by rw [←c] at ca; exact Nat.eq_of_mul_eq_mul_left s.pos_c ca
  rw [←c,←a] at b₁
  obtain ⟨k,hk⟩ := b₁
  have he : (s.b:ℤ)-(t.b:ℤ)=s.a*k := by
    apply mul_left_cancel₀ (show (s.c:ℤ)≠0 by exact_mod_cast s.pos_c.ne')
    linear_combination hk
  have hm : (t.b:ℤ) ≡ (s.b:ℤ) [ZMOD s.a] := Int.modEq_iff_dvd.mpr ⟨k,he⟩
  have eb : t.b=s.b := by
    change (t.b:ℤ)%s.a=(s.b:ℤ)%s.a at hm
    rw [Int.emod_eq_of_lt (by positivity) (by exact_mod_cast a ▸ t.lt_b),Int.emod_eq_of_lt (by positivity) (by exact_mod_cast s.lt_b)] at hm
    exact_mod_cast hm
  cases s; cases t; dsimp only at c a eb; congr; exact eb.symm

noncomputable def idealEquiv (n : ℕ) (hn : 0<n) : Data n ≃ {I : Ideal (R n) // I≠⊥} :=
  Equiv.ofBijective (fun s => ⟨ideal s,ideal_ne_bot s⟩) ⟨fun _ _ h => ideal_injective (congrArg Subtype.val h),by
    rintro ⟨I,hI⟩; obtain ⟨s,e⟩ := normal_form hn hI; exact ⟨s,Subtype.ext e.symm⟩⟩

def residues {n : ℕ} (s : Data n) : R n →+ (ZMod s.c × ZMod (s.c*s.a)) where
  toFun x := (x.im,(x.re:ZMod (s.c*s.a))-s.b*x.im)
  map_zero' := by simp
  map_add' x y := by simp [mul_add]; abel

lemma residues_surj {n : ℕ} (s : Data n) : Function.Surjective (residues s) := by
  rintro ⟨u,t⟩
  letI : NeZero s.c := ⟨s.pos_c.ne'⟩
  letI : NeZero (s.c*s.a) := ⟨mul_ne_zero s.pos_c.ne' s.pos_a.ne'⟩
  exact ⟨⟨(t.val:ℤ)+s.b*u.val,u.val⟩,by simp [residues]⟩

lemma residues_ker {n : ℕ} (s : Data n) : (residues s).ker=(ideal s).toAddSubgroup := by
  ext x
  change ((x.im:ZMod s.c),(x.re:ZMod (s.c*s.a))-s.b*x.im)=(0,0) ↔ _
  simp only [Prod.mk.injEq,mem_ideal,ZMod.intCast_zmod_eq_zero_iff_dvd]
  have he : ((x.re:ZMod (s.c*s.a))-s.b*x.im) = ((x.re-s.b*x.im:ℤ):ZMod (s.c*s.a)) := by push_cast; rfl
  rw [he,ZMod.intCast_zmod_eq_zero_iff_dvd,Nat.cast_mul]
  rfl

theorem quotient_card {n : ℕ} (s : Data n) : Nat.card (R n ⧸ ideal s)=s.c^2*s.a := by
  letI : NeZero s.c := ⟨s.pos_c.ne'⟩
  letI : NeZero (s.c*s.a) := ⟨mul_ne_zero s.pos_c.ne' s.pos_a.ne'⟩
  let e := (AddSubgroup.quotientEquivOfEq (residues_ker s).symm).trans (QuotientAddGroup.quotientKerEquivOfSurjective (residues s) (residues_surj s)).toEquiv
  have h := Nat.card_congr e
  change Nat.card (R n ⧸ ideal s)=_ at h
  simpa [Nat.card_prod,Nat.card_zmod,pow_two,mul_assoc] using h

#print axioms normal_form
#print axioms idealEquiv
#print axioms quotient_card
end TunnellIdealHNF
