import TunnellQuaternionOrbit

/-! The mod-eight character on the two quaternion parity patterns. -/

namespace TunnellQuaternion

open TunnellShell Quaternion


lemma split_coord (k r s t : ℤ) (v : Triple) :
    coordWeight (rotate ⟨2*k+1,2*r,2*s,2*t⟩ v) = ((r+s).negOnePow:ℤ)*coordWeight v := by
  obtain ⟨x,y,z⟩ := v
  rw [rotate_apply,coordWeight_eq,coordWeight_eq]
  have hxy :
      (Odd (((2*k+1)^2+(2*r)^2-(2*s)^2-(2*t)^2)*x+2*((2*r)*(2*s)-(2*k+1)*(2*t))*y+
        2*((2*r)*(2*t)+(2*k+1)*(2*s))*z) ∧
       Odd (2*((2*r)*(2*s)+(2*k+1)*(2*t))*x+((2*k+1)^2-(2*r)^2+(2*s)^2-(2*t)^2)*y+
        2*((2*s)*(2*t)-(2*k+1)*(2*r))*z)) ↔ Odd x ∧ Odd y := by
    simp only [Int.odd_iff]
    ring_nf
    omega
  simp only [hxy]
  split_ifs with h
  · obtain ⟨⟨i,rfl⟩,⟨j,rfl⟩⟩ := h
    obtain ⟨l,hl|hl⟩ := Int.even_or_odd' z <;> subst z
    · rw [←lastWeight_add_four]
      apply lastWeight_congr
      change _ % 8 = _ % 8
      ring_nf
      omega
    · simp only [lastWeight]
      split_ifs <;> ring_nf at * <;> omega
  · ring

lemma inert_coord (k r s t : ℤ) (v : Triple) :
    coordWeight (rotate ⟨2*k,-(2*r+1),2*s+1,2*t+1⟩ v) =
      -coordWeight (rotate ⟨2*k,2*r+1,2*s+1,2*t+1⟩ v) := by
  obtain ⟨x,y,z⟩ := v
  simp only [rotate_apply,coordWeight_eq,Int.odd_iff]
  split_ifs with h h' h'
  · obtain ⟨i,hi|hi⟩ := Int.even_or_odd' x
    · subst x
      ring_nf at h
      omega
    · subst x
      have hc (w : ℤ) : lastWeight (w+4) = -lastWeight w := by
        simpa using lastWeight_add_four w 1
      rw [←hc]
      apply lastWeight_congr
      change _ % 8 = _ % 8
      ring_nf
      omega
  · ring_nf at h h'
    omega
  · ring_nf at h h'
    omega
  · simp

end TunnellQuaternion
