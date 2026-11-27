# Tunnell’s theorem for even congruent numbers

For every squarefree even natural number $n$ that is the area of a rational right triangle, twice the number of integral solutions to $n=8x^2+2y^2+64z^2$ equals the number of integral solutions to $n=8x^2+2y^2+16z^2$. This is the necessary direction of Tunnell’s theorem.

[The final Lean declaration](src/TunnellEvenOriginal.lean) has exactly the type of `CongruentNumber.Tunnell_even` from the pinned formal-conjectures library. Lean reports the three axioms `propext`, `Classical.choice`, and `Quot.sound`. A second declaration spells out both quadratic forms and applies the proof to arbitrary inputs. [Explicit statement](ExactStatement.lean) · [Kernel record](verification.txt)

## Proof structure

* [The original reduction](src/OMAReductions/R_CongruentNumber_Tunnell_even_R1.lean) handles the residue class $6$ modulo $8$ and expresses the difference of the counts for $n\equiv 2\pmod 8$ as a theta coefficient.
* [The counting identity](src/TunnellEvenWinding.lean) evaluates the square of the ternary count using two evaluations of a modular integral. A Rankin integral gives the signed modular-symbol winding. The ternary theta series gives the same integral via quaternionic ideal classes. The indices $1$ and $17$ fix the constants.
* [Arithmetic vanishing](src/TunnellCMRankVanishing.lean) connects the central value of the congruent-number curve to a finite Gaussian zeta trace. A nonzero rational normalized trace gives a nonzero derivative of an elliptic unit. At a suitable split prime the derivative gives a unit that is a norm from every higher division field and has a nonzero first coefficient locally. A rational point of infinite order produces a Kummer character that rules out these two properties together. [Arithmetic obstruction](src/TunnellGlobalRankObstruction.lean)
* [The assembly](src/TunnellEvenCriticalBridge.lean) combines modularity, the counting identity, and arithmetic vanishing to obtain the original result.

## Rebuild

The source bundle contains 1,274 Lean modules and a SHA-256 manifest. The build uses Lean 4.33.1 and a checkout of [formal-conjectures](https://github.com/google-deepmind/formal-conjectures/tree/9097e2f90e66d2f6244209cb1c07f7120d17ec53) at commit `9097e2f90e66d2f6244209cb1c07f7120d17ec53`. With the pinned checkout and its standard dependencies built, run the following from this directory.

```sh
python3 verify.py --base /path/to/formal-conjectures --jobs 2
```

To prepare a fresh checkout, run `lake exe cache get` and `lake build Mathlib FormalConjectures.Wikipedia.CongruentNumber` inside it. The verifier checks the checkout revision and source checksums, builds the bundled modules in dependency order, checks the final axiom report, and replays the final declaration with the Lean distribution’s `leanchecker`. It stores logs and compiled modules in `.build`. A repeated run resumes from the successful modules. Use `--build-dir` to select a different output directory.

## Source provenance

The bundle includes the four project reductions imported by the assembled proof. It also includes the required modules from the following Lean developments. Their original copyright notices and licenses accompany the sources.

| Development | Source revision |
| --- | --- |
| Waldschmidt subgroup theorem, Weierstrass functions and lemniscatic periods | `e116a28c34810a802868965d00d2ae986fa627e7` |
| EllipticCurves | `7c476bd2eea67d7966f5f14e58da8b3f70ee59f8` |
| ClassFieldTheory | `2e6280f9d2579705a0cc6c76ec68c2b60f9c601a` |

The bundled sources are the versions used with the pinned mathlib. The source manifest identifies each individual file, including local compatibility edits.
