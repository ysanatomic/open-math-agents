import TunnellToricIntertwiners

/-! At the ramified prime 2, division by the quadratic uniformizer preserves the intertwiner lattice. -/

namespace TunnellToricLocal

open TunnellHurwitz TunnellHurwitzFour TunnellShell Quaternion

def modTwo (u : H ℤ) : H (ZMod 2) := (u.1,u.2.1,u.2.2.1,u.2.2.2)

lemma modTwo_prod (x y : H ℤ) : modTwo (prod x y)=prod (modTwo x) (modTwo y) := by
  rcases x with ⟨a,b,c,d⟩; rcases y with ⟨e,f,g,h⟩
  simp [modTwo,prod]

lemma modTwo_nr (x : H ℤ) : ((nr x:ℤ):ZMod 2)=nr (modTwo x) := by
  rcases x with ⟨a,b,c,d⟩
  simp [modTwo,nr]

lemma norm_raw (u : H ℤ) : Quaternion.normSq (hamZ u)=((nr u:ℤ):ℚ) := by simp [hamZ,ham_norm,nr]

lemma half_integral {a b : Q} (ha : a∈order) (hb : b∈order) {A B : ℕ} (hA : Quaternion.normSq a=A)
    (hB : Quaternion.normSq b=B) (heA : Even A) (heB : Even B) : ∃ r∈order, a*b=(2:ℚ) • r := by
  obtain ⟨u,rfl⟩ := ha; obtain ⟨v,rfl⟩ := hb
  have ht : ∀ x y : H (ZMod 2), nr x=0 → nr y=0 → prod x y=0 := by decide
  have hz (u : H ℤ) (N : ℕ) (hh : Quaternion.normSq (hamZ u)=N) (he : Even N) : nr (modTwo u)=0 := by
    rw [norm_raw] at hh
    have hn : nr u=(N:ℤ) := by exact_mod_cast hh
    rw [←modTwo_nr,hn]; exact_mod_cast (ZMod.natCast_eq_zero_iff N 2).mpr he.two_dvd
  have h := ht _ _ (hz u A hA heA) (hz v B hB heB)
  rw [←modTwo_prod] at h
  rw [←hamZ_mul]
  generalize prod u v=z at *
  obtain ⟨a,b,c,d⟩ := z
  have hh (x : ℤ) (hx : (x:ZMod 2)=0) : x=2*(x/2) :=
    (Int.mul_ediv_cancel' ((ZMod.intCast_zmod_eq_zero_iff_dvd _ _).mp hx)).symm
  have ha := hh a (congrArg Prod.fst h)
  have hb := hh b (congrArg (fun x : H (ZMod 2) => x.2.1) h)
  have hc := hh c (congrArg (fun x : H (ZMod 2) => x.2.2.1) h)
  have hd := hh d (congrArg (fun x : H (ZMod 2) => x.2.2.2) h)
  let w : H ℤ := (a/2,b/2,c/2,d/2)
  refine ⟨hamZ w,⟨w,rfl⟩,?_⟩
  change hamZ (a,b,c,d) = (2:ℚ) • hamZ w
  have hvec : (a,b,c,d)=w+w := by apply Prod.ext <;> simp [w,Prod.ext_iff] <;> omega
  rw [hvec,hamZ_add,←two_smul ℚ]

theorem odd_intertwiner {n : ℕ} (hn : n%4=2) (v w : Triple) (hv : v∈shell n) (hw : w∈shell n) :
    ∃ q∈intertwiner v w, ∃ N : ℕ, Quaternion.normSq q=N ∧ Odd N := by
  classical
  let P (k : ℕ) := ∃ q∈intertwiner v w, ∃ N : ℕ, 0<N ∧ Quaternion.normSq q=N ∧ padicValNat 2 N=k
  obtain ⟨q,hq,hne,hi⟩ := intertwine v w hv hw
  obtain ⟨N,hN⟩ := norm_int hq
  have hNz : N≠0 := by rintro rfl; exact hne (Quaternion.normSq_eq_zero.mp (by simpa using hN))
  have hEx : ∃ k, P k := ⟨_,q,⟨hq,hi⟩,N,Nat.pos_of_ne_zero hNz,hN,rfl⟩
  obtain ⟨r,hr,m,hm,hnr,hval⟩ := Nat.find_spec hEx
  refine ⟨r,hr,m,hnr,?_⟩
  by_contra hodd
  obtain ⟨t,ht,htr⟩ := half_integral hr.1 (pure_mem v) hnr
    (by rw [pure_norm,TunnellShell.mem_shell.mp hv]; simp) (Nat.not_odd_iff_even.mp hodd)
    (Nat.even_iff.mpr (by omega : n%2=0))
  have he : t∈intertwiner v w := by
    refine ⟨ht,?_⟩
    apply smul_right_injective Q (by norm_num : (2:ℚ)≠0)
    change (2:ℚ) • (TunnellHurwitz.pure w*t)=(2:ℚ) • (t*TunnellHurwitz.pure v)
    calc _ = TunnellHurwitz.pure w * ((2:ℚ) • t) := (Algebra.mul_smul_comm _ _ _).symm
         _ = ((2:ℚ) • t)*TunnellHurwitz.pure v := by rw [←htr,←mul_assoc,hr.2]
         _ = _ := smul_mul_assoc _ _ _
  obtain ⟨T,hT⟩ := norm_int ht
  have hprod := congrArg Quaternion.normSq htr
  rw [map_mul,hnr,pure_norm,TunnellShell.mem_shell.mp hv,←Quaternion.coe_mul_eq_smul,map_mul,Quaternion.normSq_coe,hT] at hprod
  have heN : m*n=4*T := by exact_mod_cast (show (m:ℚ)*n=4*T by push_cast at hprod; linarith)
  have hTp : 0<T := Nat.pos_of_ne_zero (by rintro rfl; simp at heN; omega)
  have hval' := congrArg (padicValNat 2) heN
  let K := n/2
  have hnK : n=2*K := by dsimp [K]; omega
  have hK : 0<K := by dsimp [K]; omega
  have hK₂ : ¬2∣K := by dsimp [K]; omega
  rw [hnK,padicValNat.mul (by omega) (by positivity),padicValNat.mul (by decide) hK.ne',
    padicValNat.mul (by decide) hTp.ne',padicValNat.eq_zero_of_not_dvd hK₂,
    padicValNat_self,show padicValNat 2 4=2 by rw [show 4=2*2 by decide,padicValNat.mul (by decide) (by decide),padicValNat_self]] at hval'
  have hle := Nat.find_min' hEx (show P (padicValNat 2 T) from ⟨t,he,T,hTp,hT,rfl⟩)
  omega

#print axioms odd_intertwiner

end TunnellToricLocal
