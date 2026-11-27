import TunnellEvenOriginal

/-! A check against the explicit quantified statement and the two quadratic forms. -/
theorem TunnellEvenExactStatement (n : ℕ) (hsq : Squarefree n) (he : Even n)
    (hn : CongruentNumber.congruentNumber n) :
    2 * ({t : ℤ × ℤ × ℤ | (n:ℤ)=8*t.1^2+2*t.2.1^2+64*t.2.2^2} : Set (ℤ × ℤ × ℤ)).ncard =
      ({t : ℤ × ℤ × ℤ | (n:ℤ)=8*t.1^2+2*t.2.1^2+16*t.2.2^2} : Set (ℤ × ℤ × ℤ)).ncard :=
  TunnellEvenOriginal.tunnell_even n hsq he hn

#print axioms TunnellEvenExactStatement
