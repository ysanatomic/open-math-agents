import TunnellRamifiedTwoTable
import TunnellTwoProjection

/-! The binary norm lattice at 2 cuts out the congruence order used by the Brandt test vector. -/
namespace TunnellRamifiedTwoOrder
open TunnellToricSign TunnellHurwitzFour TunnellHurwitz TunnellShell TunnellToricClass TunnellTwoProjection
open TunnellRamifiedTwoTable
noncomputable section

lemma ham_injective : Function.Injective hamZ := by
  rintro ⟨a,b,c,d⟩ ⟨e,f,g,h⟩ eq
  have h₁ := congrArg QuaternionAlgebra.re eq
  have h₂ := congrArg QuaternionAlgebra.imI eq
  have h₃ := congrArg QuaternionAlgebra.imJ eq
  have h₄ := congrArg QuaternionAlgebra.imK eq
  dsimp [hamZ,ham] at h₁ h₂ h₃ h₄
  refine Prod.ext ?_ (Prod.ext ?_ (Prod.ext ?_ ?_)) <;> dsimp only
  · exact_mod_cast (show (a:ℚ)=e by linarith)
  · exact_mod_cast (show (b:ℚ)=f by linarith)
  · exact_mod_cast (show (c:ℚ)=g by linarith)
  · exact_mod_cast (show (d:ℚ)=h by linarith)

lemma ham_smul (m : ℕ) (q : H ℤ) : hamZ (m • q)=(m:Q)*hamZ q := by
  induction m with
  | zero => rw [zero_smul,Nat.cast_zero,zero_mul]; ext <;> simp [hamZ,ham] <;> rfl
  | succ m ih => rw [succ_nsmul,hamZ_add,ih,Nat.cast_succ,add_mul,one_mul]

lemma eight_divisible (q : H ℤ) : (∃ b∈O, hamZ q=8*b) ↔ redH q=0 := by
  constructor
  · rintro ⟨_,⟨b,rfl⟩,e⟩
    have he : q=8 • b := ham_injective (e.trans (ham_smul 8 b).symm)
    rw [he]; rcases b with ⟨a,b,c,d⟩; simp [redH,nsmul_eq_mul,show (8:TunnellToricSign.Z8)=0 by decide]
  · rcases q with ⟨a,b,c,d⟩
    intro h
    change ((a:TunnellToricSign.Z8),(b:TunnellToricSign.Z8),(c:TunnellToricSign.Z8),(d:TunnellToricSign.Z8))=(0,0,0,0) at h
    simp only [Prod.mk.injEq,ZMod.intCast_zmod_eq_zero_iff_dvd] at h
    obtain ⟨a',ha⟩ := h.1
    obtain ⟨b',hb⟩ := h.2.1
    obtain ⟨c',hc⟩ := h.2.2.1
    obtain ⟨d',hd⟩ := h.2.2.2
    let s : H ℤ := (a',b',c',d')
    refine ⟨hamZ s,⟨s,rfl⟩,?_⟩
    rw [←show ((8:ℕ):Q)*hamZ s=8*hamZ s by rfl,←ham_smul]
    congr 1
    exact Prod.ext (by simpa [s,nsmul_eq_mul] using ha) (Prod.ext (by simpa [s,nsmul_eq_mul] using hb)
      (Prod.ext (by simpa [s,nsmul_eq_mul] using hc) (by simpa [s,nsmul_eq_mul] using hd)))

lemma ham_V (v : Triple) : hamZ (V v.1 v.2.1 v.2.2)=TunnellHurwitz.pure v := by
  ext <;> dsimp [hamZ,ham,V,TunnellHurwitz.pure] <;> push_cast <;> ring

lemma red_proj (d : ℕ) (hd : d%4=1) (v : Triple) (q : H ℤ) :
    (∃ b∈O, filt d v v (hamZ q)=8*b) ↔
      proj (V (v.1:TunnellToricSign.Z8) (v.2.1:TunnellToricSign.Z8) (v.2.2:TunnellToricSign.Z8)) (redH q)=0 := by
  let s := V v.1 v.2.1 v.2.2
  have hq : filt d v v (hamZ q)=hamZ ((2*d) • q+prod (prod s q) s) := by
    rw [hamZ_add,hamZ_mul,hamZ_mul,ham_smul,show hamZ s=_ from ham_V v]; push_cast; rfl
  rw [hq,eight_divisible]
  have h₂ : ((2*d:ℕ):TunnellToricSign.Z8)=2 := by apply ZMod.val_injective 8; rw [ZMod.val_natCast]; change (2*d)%8=2; omega
  rcases v with ⟨a,b,c⟩; rcases q with ⟨x,y,z,t⟩
  have eq : redH ((2*d) • (x,y,z,t)+prod (prod s (x,y,z,t)) s)=proj (V (a:TunnellToricSign.Z8) b c) (redH (x,y,z,t)) := by
    have red_prod (u t : H ℤ) : redH (prod u t)=prod (redH u) (redH t) := by
      rcases u with ⟨i,j,k,l⟩; rcases t with ⟨i',j',k',l'⟩; simp [redH,prod]
    have red_add (u t : H ℤ) : redH (u+t)=redH u+redH t := by rcases u with ⟨i,j,k,l⟩; rcases t with ⟨i',j',k',l'⟩; simp [redH]
    have red_scale (m : ℕ) (t : H ℤ) : redH (m • t)=((m:TunnellToricSign.Z8) • redH t) := by
      rcases t with ⟨w,x,y,z⟩; simp [redH,nsmul_eq_mul,smul_eq_mul]
    rw [red_add,red_scale,h₂,red_prod,red_prod]
    have hs : redH s=V (a:TunnellToricSign.Z8) b c := by simp [redH,s,V]
    rw [hs,proj]
    congr 1
    simp [two_nsmul,two_smul]
  rw [eq]

lemma four_int (a : ℤ) : four (a:TunnellToricSign.Z8)=(a:Z4) := by
  apply ZMod.val_injective 4
  simp [four,ZMod.val_natCast,ZMod.val_intCast]

theorem order_criterion {d : ℕ} (hd : d%4=1) {v : Triple} (hv : v∈shell (2*d))
    (hx : Odd v.1) (hy : v.2.1%4=v.1%4) (hz : 4∣v.2.2) (q : H ℤ) :
    admits d v v (hamZ q) ↔ (modFour q).2.1=(modFour q).2.2.1 ∧ (modFour q).2.2.2=0 := by
  rw [admits_iff hv hv (by omega) (show hamZ q∈O from ⟨q,rfl⟩),red_proj d hd]
  obtain ⟨x,y,z⟩ := v
  change y%4=x%4 at hy
  change (4:ℤ)∣z at hz
  obtain ⟨l,rfl⟩ := hz
  obtain ⟨k,rfl⟩ : ∃k:ℤ,y=x+4*k := ⟨(y-x)/4,by omega⟩
  have hx' : (x:TunnellToricSign.Z8).val%2=1 := by
    have h := ZMod.val_intCast (n:=8) x
    have h' := Int.odd_iff.mp hx; dsimp only at h'; omega
  dsimp only
  push_cast
  rw [red4 k,red4 l,kernel _ _ hx']
  exact and_congr ((congrArg₂ Eq (four_int _) (four_int _)).to_iff) ((congrArg (·=0) (four_int _)).to_iff)

set_option maxRecDepth 10000 in
set_option maxHeartbeats 1000000 in
theorem unit_criterion {d : ℕ} (hd : d%4=1) {v : Triple} (hv : v∈shell (2*d))
    (hx : Odd v.1) (hy : v.2.1%4=v.1%4) (hz : 4∣v.2.2) {q : H ℤ} (hq : Odd (nr q)) :
    admits d v v (hamZ q) ↔ modFour q∈orderUnits := by
  rw [order_criterion hd hv hx hy hz]
  exact (show ∀ t∈units,t.2.1=t.2.2.1 ∧ t.2.2.2=0 ↔ t∈orderUnits by decide) (modFour q) (odd_units q hq)

end
end TunnellRamifiedTwoOrder
#print axioms TunnellRamifiedTwoOrder.unit_criterion
