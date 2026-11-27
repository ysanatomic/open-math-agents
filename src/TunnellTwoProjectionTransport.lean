import TunnellRamifiedTwoOrder
import TunnellQuaternionToricSum

/-! Galois-conjugate local intertwiners carry the dyadic congruence to a pair of CM classes. -/
namespace TunnellTwoProjectionTransport
open TunnellHurwitz TunnellToricClass TunnellShell TunnellToricLocal TunnellTwoProjection
open TunnellToric TunnellHurwitzFour TunnellToricSign TunnellRamifiedTwoOrder
local notation "ι" => TunnellHurwitz.pure
noncomputable section

def eight (q : Q) := ∃ b∈O, q=8*b

lemma eight_transport {q a b : Q} (h : eight q) (ha : a∈O) (hb : b∈O) : eight (a*q*b) := by
  obtain ⟨y,hy,rfl⟩ := h
  exact ⟨a*y*b,order.mul_mem (order.mul_mem ha hy) hb,by noncomm_ring⟩

lemma eight_cancel {q : Q} (hq : q∈O) (M : ℕ) (hM : Odd M) (h : eight ((M:Q)*q)) : eight q := by
  obtain ⟨u,v,he⟩ := (show Nat.Coprime M 8 from (Nat.coprime_two_right.mpr hM).pow_right 3).isCoprime
  obtain ⟨b,hb,eb⟩ := h
  have eZ : u*(M:ℤ)+v*8=1 := he
  have eQ := congrArg (fun x:ℤ => (x:Q)) eZ
  push_cast at eQ
  have hU : (u:Q)*b∈O := by simpa only [zsmul_eq_mul] using O.smul_mem u hb
  have hV : (v:Q)*q∈O := by simpa only [zsmul_eq_mul] using O.smul_mem v hq
  refine ⟨(u:Q)*b+(v:Q)*q,O.add_mem hU hV,?_⟩
  calc q=(((u:Q)*M+v*8)*q) := by rw [eQ,one_mul]
       _=8*((u:Q)*b+(v:Q)*q) := by rw [add_mul,mul_assoc,eb]; noncomm_ring

lemma filt_transport {d : ℕ} {v s t : Triple} {a b : Q} (ha : a∈J v s) (hb : b∈J v t) (q : Q) :
    filt d v v (star a*q*b)=star a*filt d t s q*b := by
  have ha' := (star_intertwines ha).2
  let N : Q := (2*d:ℕ)
  have hN (z : Q) : N*z=z*N := Nat.cast_comm (2*d) z
  have h₁ : N*(star a*q*b)=star a*(N*q)*b := by rw [←mul_assoc N,←mul_assoc N,hN (star a)]; simp only [mul_assoc]
  have h₂ : (ι v*(star a*q*b))*ι v = star a*(ι s*q*ι t)*b := by
    rw [←mul_assoc (ι v),←mul_assoc (ι v),ha',mul_assoc (star a) (ι s),mul_assoc (star a),mul_assoc (star a),mul_assoc (ι s*q),←hb.2]
    simp only [mul_assoc]
  change (2*(d:Q))*(star a*q*b)+_=star a*((2*(d:Q))*q+_)*b
  rw [show (2*(d:Q))=N by dsimp only [N]; push_cast; rfl, mul_add, add_mul,h₁,h₂]

def bar {R : Type*} [CommRing R] (q : H R) : H R := (q.1+q.2.2.2,-q.2.1,-q.2.2.1,-q.2.2.2)
lemma ham_bar (a : H ℤ) : hamZ (bar a)=star (hamZ a) := by
  apply QuaternionAlgebra.ext
  all_goals simp only [Quaternion.re_star,Quaternion.imI_star,Quaternion.imJ_star,Quaternion.imK_star] <;> dsimp [hamZ,bar,ham] <;> push_cast <;> ring

lemma eight_pair_iff {s t : Q} (hs : s∈O) (ht : t∈O) (a b : ℕ) (ha : Odd a) (hb : Odd b)
    (hsa : Quaternion.normSq s=a) (htb : Quaternion.normSq t=b) {x : Q} (hx : x∈O) :
    eight (star s*x*t) ↔ eight x := by
  constructor
  · intro h
    have he := eight_transport h hs (star_order ht)
    have eq : s*(star s*x*t)*star t=((a*b:ℕ):Q)*x := by
      rw [←mul_assoc s,←mul_assoc s,Quaternion.self_mul_star,hsa,mul_assoc,Quaternion.self_mul_star,htb]
      simp only [Quaternion.coe_natCast,Nat.cast_mul,mul_assoc]
      rw [Nat.cast_comm b x]
    exact eight_cancel hx _ (ha.mul hb) (eq ▸ he)
  · intro h; exact eight_transport h (star_order hs) ht

theorem pair_criterion {d : ℕ} (hd : d%4=1) {v s t : Triple} (hv : v∈shell (2*d)) (hs : s∈shell (2*d)) (ht : t∈shell (2*d))
    (hx : Odd v.1) (hy : v.2.1%4=v.1%4) (hz : 4∣v.2.2) {a b : H ℤ} (ha : LocalGenerator v s a) (hb : LocalGenerator v t b)
    {q : H ℤ} (hq : Odd (nr q)) :
    admits d t s (hamZ q) ↔ modFour (prod (prod (bar a) q) b)∈orderUnits := by
  let Q' := prod (prod (bar a) q) b
  have he : hamZ Q'=star (hamZ a)*hamZ q*hamZ b := by dsimp [Q']; rw [hamZ_mul,hamZ_mul,ham_bar]
  have hJA : hamZ a∈J v s := ⟨⟨a,rfl⟩,ha.2⟩
  have hJB : hamZ b∈J v t := ⟨⟨b,rfl⟩,hb.2⟩
  have hq' : Odd (nr Q') := by
    have norm_bar : nr (bar a)=nr a := by rcases a with ⟨x,y,z,t⟩; dsimp [nr,bar]; ring
    have nr_prod (x y : H ℤ) : nr (prod x y)=nr x*nr y := by
      have H := congrArg Quaternion.normSq (hamZ_mul x y); rw [map_mul,norm_ham,norm_ham,norm_ham] at H; exact_mod_cast H
    dsimp [Q']; rw [nr_prod,nr_prod,norm_bar]; exact (ha.1.mul hq).mul hb.1
  rw [←unit_criterion hd hv hx hy hz hq',admits_iff ht hs (by omega) (show hamZ q∈O from ⟨q,rfl⟩),
    admits_iff hv hv (by omega) (show hamZ Q'∈O from ⟨Q',rfl⟩),he,filt_transport hJA hJB]
  obtain ⟨M,hM⟩ := norm_int hJA.1; obtain ⟨N,hN⟩ := norm_int hJB.1
  have hMa : nr a=(M:ℤ) := by rw [norm_ham] at hM; exact_mod_cast hM
  have hNb : nr b=(N:ℤ) := by rw [norm_ham] at hN; exact_mod_cast hN
  have hMo := ha.1; rw [hMa] at hMo
  have hNo := hb.1; rw [hNb] at hNo
  apply (eight_pair_iff hJA.1 hJB.1 M N (by exact_mod_cast hMo) (by exact_mod_cast hNo) hM hN _).symm
  apply order.add_mem
  · have hqO : hamZ q∈O := ⟨q,rfl⟩
    change (2*(d:Q))*hamZ q∈O
    simpa only [zsmul_eq_mul,Int.natCast_mul,Int.cast_mul,Int.cast_natCast,Nat.cast_mul,Nat.cast_ofNat,Int.cast_ofNat] using O.smul_mem ((2*d:ℕ):ℤ) hqO
  · exact order.mul_mem (order.mul_mem (pure_mem s) ⟨q,rfl⟩) (pure_mem t)

end
end TunnellTwoProjectionTransport
#print axioms TunnellTwoProjectionTransport.pair_criterion
