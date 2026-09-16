# CLAUDE.md

**Read [AGENTS.md](AGENTS.md) before working in this repository.** It is the full guide: toolchain,
Julia environments, where course material actually lives, Typst rendering, known traps, and stale
artifacts. This file exists only so that guide gets loaded.

Four things worth knowing before the first edit, because each has already caused a wrong change:

1. **This repo is the website, not the course.** Labs, homework, solutions, exams, and quizzes are
   separate repositories checked out as siblings under `~/Teaching/BEE4750/`. A directory named
   `labs/` here does not contain the labs. Confirm the repository before editing an assignment.

2. **Each of those repos stores a year per branch** (`Fall25`, `Fall26`, …). Verify you are on the
   current year's branch; create it from the previous year rather than editing in place.

3. **Rendering is not verification.** Invalid markup routinely renders without erroring. Render, then
   convert to images and look at the output.

4. **A file's existence does not mean it is current.** Much of `slides/` is still an unrevised copy of
   last year's decks, and `data/schedule.csv` is contaminated with a different course. AGENTS.md lists
   what is known stale.

## Writing code for slides and assignments

**Students read this code.** Assume no prior Julia and modest programming background. Clever is worse
than clear, every time.

- **Plain, descriptive names.** `distance_into_box`, not `Δ`. `DO_in`, not `Cm`. No single letters
  beyond loop indices, no Unicode subscripts (`α₁`), no abbreviations a reader has to decode.
- **Explicit loops over clever constructs.** No `Ref(...)` broadcasting, `searchsortedlast`, returned
  closures, ternaries, or comprehension tricks. A plain `for` loop with an `if` inside is the target.
- **Structure the code like the physics.** If the prose says "treat each stretch as a box," loop over
  boxes — not over grid points with a state machine inside.
- **Never shadow Base names** (`last`, `min`, `step`).
- **Course vocabulary**: *effluent* not outfall; *simulate* not march.

## Writing slides

**Slide titles.** Three forms, drawn from the existing decks — a **question** the slide answers
("Why Is This Hard?", "What Assumptions Did We Make?", "How Small Should $\Delta t$ Be?", "Where Did
$r$ Come From?"), a **claim** it establishes ("Forward Euler Is First Order", "Inputs Must Not Depend
on $\Delta t$", "Numerical Solutions Are Samples on a Grid"), or a **plain name** for the thing shown
("The Recycling Curve", "P Sources and Sinks", "DO Mass Balance", "The Episode"). Two to six words,
concrete and specific to this material.

Avoid the generic-explainer register: no "A Closer Look at…", "Deep Dive", "Unpacking…",
"Understanding…", "Exploring…", "The Power of…", "Key Considerations", "Important Factors". A title
should name *this* slide's content, not a category it belongs to — "Fifty Years of Boring Data" beats
"Long-Term Simulation Results". Reserve colon-subtitle titles for the rare case where the second half
adds real information ("Another Risk: Grid Size"), not as a default shape.

**No status symbols in tables.** No ✓, ❌, emoji, or coloured marks. Put the verdict in words
("complies", "violation") or let bolding carry it. A reader should not have to decode a glyph.

**No course policy in the body of a lecture.** Grading, weighting, what will be assessed, late
policy, and similar belong on the lecture's opening slide or the closing schedule slide — never as an
aside inside content ("this will be on the quiz", "you will be graded on this"). It interrupts the
argument and dates the deck.

## Verifying that work

- **Every number in prose, a table, or a caption must come from running the deck's own code.** A value
  computed in a scratch script is not the same value — two table entries here were wrong because a
  scratch version mixed at the domain start while the deck's function carried the river downstream
  first.
- **Rendering is not verification** (see above). Invalid markup renders silently.
- **Do not read `$?` from a pipeline.** `quarto render … | tail -5` reports *tail's* status, not
  quarto's, and discards the error message. Redirect to a file, check the exit code, then read the log.
- **A forcing function must not depend on the step size.** Anything drawn or indexed per step changes
  the scenario when the grid is refined, which makes a convergence study meaningless. Make forcings
  functions of position or time. White noise has no grid-independent limit at all — use a smooth
  (correlated) signal if the result needs to converge.

Course logistics — assessment rules, the lab rubric, measured slide density — belong in
`data/schedule.md`, not here.
