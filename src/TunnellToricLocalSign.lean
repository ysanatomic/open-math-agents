import TunnellToricPeriod
import TunnellToricTwoLocal
/-! The two-valued quaternionic test vector on the finite Shimura set at 2. -/
namespace TunnellToricSign
open TunnellHurwitzFour TunnellHurwitz TunnellToric TunnellShell
abbrev Z8 := ZMod 8
abbrev Vec (R : Type*) := R × R × R

def rotate {R : Type*} [CommRing R] (q : H R) (v : Vec R) : Vec R :=
  let (a,b,c,d) := q
  let (x,y,z) := v
  let l := (a+b+c)*d+d^2
  ((a^2+b^2-c^2+(a+b-c)*d)*x+(2*b*c+(b+c-a)*d)*y+(2*a*c+l)*z,
   (2*b*c+l)*x+(a^2-b^2+c^2+(a-b+c)*d)*y+(-2*a*b+(c-a-b)*d)*z,
   (-2*a*c+(b-a-c)*d)*x+(2*a*b+l)*y+(a^2-b^2-c^2+(a-b-c)*d)*z)

lemma rotate_eq (q : H ℤ) (v : Triple) : TunnellHurwitz.pure (rotate q v)=act (hamZ q) v := by
  obtain ⟨a,b,c,d⟩ := q
  obtain ⟨x,y,z⟩ := v
  apply QuaternionAlgebra.ext
  all_goals simp only [act,Quaternion.re_mul,Quaternion.imI_mul,Quaternion.imJ_mul,Quaternion.imK_mul,
    Quaternion.re_star,Quaternion.imI_star,Quaternion.imJ_star,Quaternion.imK_star]
  all_goals dsimp [rotate,TunnellHurwitz.pure,hamZ,ham]; push_cast; ring

def color (v : Vec Z8) : ℤ :=
  let a := if v.1.val%2=0 then v.1 else if v.2.1.val%2=0 then v.2.1 else v.2.2
  if a=0 then 1 else if a=4 then -1 else 0

def lift4 (q : H4) : H Z8 := (q.1.val,q.2.1.val,q.2.2.1.val,q.2.2.2.val)
def fast (q : H4) : ℤ := color (rotate (lift4 q) (1,1,0))
def character (q : H4) : ℤ := if q∈orbit e then 1 else -1

set_option maxRecDepth 10000 in
set_option maxHeartbeats 10000000 in
lemma character_table : ∀ q ∈ units, fast q=character q := by decide

set_option maxRecDepth 10000 in
set_option maxHeartbeats 30000000 in
lemma table : ∀ q ∈ units, ∀ x : Z8, x.val%2=1 → ∀ k l : ZMod 2,
    color (rotate (lift4 q) (x,x+4*(k.val:Z8),4*(l.val:Z8)))=fast q * (if l=0 then 1 else -1) := by decide

def shift4 (q u : H Z8) : H Z8 := (q.1+4*u.1,q.2.1+4*u.2.1,q.2.2.1+4*u.2.2.1,q.2.2.2+4*u.2.2.2)

lemma periodic (q u : H Z8) (x k l : Z8) :
    rotate (shift4 q u) (x,x+4*k,4*l)=rotate q (x,x+4*k,4*l) := by
  obtain ⟨a,b,c,d⟩ := q
  obtain ⟨A,B,C,D⟩ := u
  change rotate (a+4*A,b+4*B,c+4*C,d+4*D) (x,x+4*k,4*l)=_
  simp only [rotate,Prod.mk.injEq]
  have e8 : (8:Z8)=0 := by decide
  have e16 : (16:Z8)=0 := by decide
  have e32 : (32:Z8)=0 := by decide
  have e64 : (64:Z8)=0 := by decide
  have e128 : (128:Z8)=0 := by decide
  refine ⟨?_,?_,?_⟩ <;> rw [←sub_eq_zero] <;> ring_nf <;> simp [e8,e16,e32,e64,e128]

def redVec (v : Triple) : Vec Z8 := (v.1,v.2.1,v.2.2)
def redH (q : H ℤ) : H Z8 := (q.1,q.2.1,q.2.2.1,q.2.2.2)

lemma red_rot (q : H ℤ) (v : Triple) : redVec (rotate q v)=rotate (redH q) (redVec v) := by
  obtain ⟨a,b,c,d⟩ := q
  obtain ⟨x,y,z⟩ := v
  simp [redVec, redH, rotate]

lemma redH_shift (q : H ℤ) : ∃ u, redH q=shift4 (lift4 (modFour q)) u := by
  have e (a : ℤ) : (a:Z8)=((a:Z4).val:Z8)+4*((a/4:ℤ):Z8) := by
    have hh := ZMod.val_intCast (n:=4) a
    have he : a=(((a:Z4).val:ℕ):ℤ)+4*(a/4) := by omega
    exact_mod_cast congrArg (fun z:ℤ => (z:Z8)) he
  exact ⟨(↑(q.1/4:ℤ),↑(q.2.1/4:ℤ),↑(q.2.2.1/4:ℤ),↑(q.2.2.2/4:ℤ)),
    Prod.ext (e _) (Prod.ext (e _) (Prod.ext (e _) (e _)))⟩

lemma red4 (k : ℤ) : 4*(k:Z8)=4*((k:ZMod 2).val:Z8) := by
  have hh := ZMod.val_intCast (n:=2) k
  have he : 4*k=4*(((k:ZMod 2).val:ℕ):ℤ)+8*(k/2) := by omega
  have ht := congrArg (fun z:ℤ => (z:Z8)) he
  push_cast at ht
  simpa [show (8:Z8)=0 by decide] using ht

lemma odd_units (q : H ℤ) (hn : Odd (nr q)) : modFour q ∈ units := by
  apply Finset.mem_filter.mpr
  refine ⟨Finset.mem_univ _,?_⟩
  have h : (nr (modFour q))=((nr q:ℤ):Z4) := by obtain ⟨a,b,c,d⟩ := q; simp [nr,modFour]
  rw [h]
  have hh := ZMod.val_intCast (n:=4) (nr q)
  have he := Int.odd_iff.mp hn
  omega

lemma color_rotate {v : Triple} (hx : Odd v.1) (hy : v.2.1%4=v.1%4) (hz : 4∣v.2.2)
    {q : H ℤ} (hq : Odd (nr q)) :
    color (redVec (rotate q v))=character (modFour q)*color (redVec v) := by
  obtain ⟨x,y,z⟩ := v
  change y%4=x%4 at hy
  change (4:ℤ)∣z at hz
  obtain ⟨l,rfl⟩ := hz
  have hk : ∃ k : ℤ, y=x+4*k := ⟨(y-x)/4,by omega⟩
  obtain ⟨k,rfl⟩ := hk
  have hq4 := odd_units q hq
  have hv8 : (x:Z8).val%2=1 := by
    have h := ZMod.val_intCast (n:=8) x
    have e := Int.odd_iff.mp hx; dsimp only at e; omega
  have hh : redVec (x,x+4*k,4*l)=((x:Z8),x+4*(k:Z8),4*(l:Z8)) := by simp [redVec]
  have term := table (modFour q) hq4 (x:Z8) hv8 (k:ZMod 2) (l:ZMod 2)
  rw [red_rot,hh]
  obtain ⟨u,hu⟩ := redH_shift q
  rw [hu,periodic, red4 k,red4 l,←character_table _ hq4,term]
  congr 1
  have e : ∀ x : Z8, x.val%2=1 → ∀ k l : ZMod 2, (if l=0 then (1:ℤ) else -1)=color (x,x+4*(k.val:Z8),4*(l.val:Z8)) := by decide
  exact e _ hv8 _ _

lemma smul_rotate {v w : Triple} {q : H ℤ}
    (h : TunnellHurwitz.pure w * hamZ q = hamZ q * TunnellHurwitz.pure v) : rotate q v=(nr q) • w := by
  apply TunnellHurwitz.pure_injective
  rw [rotate_eq,act,←h,mul_assoc,Quaternion.self_mul_star,Quaternion.mul_coe_eq_smul,norm_ham]
  apply QuaternionAlgebra.ext <;>
    simp only [Quaternion.re_smul,Quaternion.imI_smul,Quaternion.imJ_smul,Quaternion.imK_smul] <;>
    simp [TunnellHurwitz.pure]

set_option maxRecDepth 10000 in
set_option maxHeartbeats 2000000 in
lemma scale_table : ∀ t : Z8, t.val%2=1 → ∀ v : Vec Z8, color (t*v.1,t*v.2.1,t*v.2.2)=color v := by decide

theorem character_of_intertwiner {v w : Triple} (hx : Odd v.1) (hy : v.2.1%4=v.1%4)
    (hz : 4∣v.2.2) {q : H ℤ} (hq : Odd (nr q))
    (h : TunnellHurwitz.pure w*hamZ q=hamZ q*TunnellHurwitz.pure v) :
    color (redVec w)=character (modFour q)*color (redVec v) := by
  have he := color_rotate hx hy hz hq
  rw [smul_rotate h] at he
  have hh : redVec (nr q • w)=(((nr q:ℤ):Z8)*(w.1:Z8),((nr q:ℤ):Z8)*(w.2.1:Z8),((nr q:ℤ):Z8)*(w.2.2:Z8)) := by simp [redVec]
  rw [hh] at he
  exact (scale_table ((nr q:ℤ):Z8) (by have t := ZMod.val_intCast (n:=8) (nr q); have e := Int.odd_iff.mp hq; omega) (redVec w)).symm.trans he

#print axioms character_of_intertwiner
end TunnellToricSign
