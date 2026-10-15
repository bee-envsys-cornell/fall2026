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

- **Plain, descriptive names.** `distance_into_box`, not `Δ`. `DO_in`, not `Cm`. This is a
  guideline, not a hard rule: single letters are fine for loop indices and where they are the
  conventional notation (`x` and `y` for a generic input and output, `n` or `k` in a short helper).
  Avoid Unicode subscripts (`α₁`) and abbreviations a reader has to decode.
- **Explicit loops over clever constructs.** No `Ref(...)` broadcasting, `searchsortedlast`, returned
  closures, ternaries, or comprehension tricks. A plain `for` loop with an `if` inside is the target.
- **Structure the code like the physics.** If the prose says "treat each stretch as a box," loop over
  boxes — not over grid points with a state machine inside.
- **Never shadow Base names** (`last`, `min`, `step`).
- **Course vocabulary**: *effluent* not outfall; *simulate* not march.

## Math notation

Decks and every assessment (homework, quizzes, labs, mini-projects, and their keys) use one notation
for vectors and matrices (decided Oct 9):

- **Vectors are bold**: `\mathbf{x}`, `\mathbf{y}`, `\mathbf{c}` for Latin letters and `\boldsymbol{\theta}`,
  `\boldsymbol{\beta}` for Greek; `\mathbf{0}` for the zero vector. **Matrices are bold uppercase**:
  `\mathbf{A}`, `\mathbf{X}`, `\boldsymbol{\Sigma}`. Use `\mathbf`/`\boldsymbol`, not `\bm` or `\vec`.
- **Scalars and components stay plain**: `x_i`, `y_t`, `\theta_j`, `a_{ij}`, and named scalar variables.
  Bold a symbol only where it is a vector in that context (a single scalar parameter stays plain; the
  whole dataset is `\mathbf{y}`, one observation `y_i`), and keep the same symbol the same within a file.
- **Transpose is `^\top`.** Accents go outside the bold: `\hat{\boldsymbol{\beta}}`.
- Math that code prints (an `output: asis` cell, a LaTeX plot label) follows the same rule.
- **Gain** (decided Oct 9): the feedback gain $g$ is the derivative of the rate, $\partial(dx/dt)/\partial x$:
  $g < 0$ dampening (stable), $g > 0$ amplifying (unstable). The amplification formula
  $\text{Direct}/(1-g)$ uses the *loop* gain of the fixed-point form $x = F(p(x))$; say so wherever it
  appears, and never apply it to a rate gain.
- **LP constraints are numbered C1, C2, …** (decided Oct 11): tag them `\text{(C1)}` in the formulation
  and use the same names for the lines in a figure and in prose ("C2 and C3 bind"), in every LP deck.
  Do not name a constraint by the letter of the thing it limits (receptor A, B, C): the letters collide
  with $\mathbf{A}$, $\mathbf{b}$, $\mathbf{c}$ in standard form. Say once which constraint is which
  ("C1, C2 and C3 are the limits at receptors A, B and C"), and number slack variables and multipliers
  to match ($s_2$, $\lambda_2$). In lectures 8-2 and 9-1 the plume LP's variable bounds are left untagged.

## Writing slides

**Slide titles.** Three forms, drawn from the existing decks — a **question** the slide answers
("Why Is This Hard?", "What Assumptions Did We Make?", "How Small Should $\Delta t$ Be?", "Where Did
$r$ Come From?"), a **claim** it establishes ("Forward Euler Is First Order", "Inputs Must Not Depend
on $\Delta t$", "Numerical Solutions Are Samples on a Grid"), or a **plain name** for the thing shown
("The Recycling Curve", "P Sources and Sinks", "DO Mass Balance", "The Episode"). Two to six words,
concrete and specific to this material.

The instructor retitled about 65 drafted titles in Sep–Oct 2026, almost always to **the field's own
term, in Title Case**, or to a question: "The Price From JuMP" → "Shadow Price from JuMP", "The Dispatch
Stack" → "The Dispatch Stack/Merit Order", "Step 2: Go Downhill" → "Step 2: Go Towards Steepest
Decrease", "The Peak Isn't at the Stack" → "Where Is The Worst Pollution?", "Concentrations Add" →
"Impact of Multiple Sources". Sibling sections get parallel names ("Single-Period Dispatch",
"Multi-Period Dispatch"), and a step in a derivation is titled by what it does ("Objective Function",
"Developing Constraints").

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
argument and dates the deck. The same holds for **pointers to other sessions and assessments**, which
the instructor removed about 30 times: no "(Wednesday)", "(October 19)", "Last week, this was…",
"Monday: what would relaxing … be worth?", "We will come back to that" or "(Mini-Project 2)", in slides
or notes. Restate a carried-over example instead; the closing Next Classes slide says what is next in
one line ("**Monday**: How to solve an LP and shadow prices.").

**Fragments reveal answers, not points.** "You also don't need to add fragments intended at driving
the point home: I'll make those vocally" (instructor, Sep 22). A fragment holds back the answer to a
question the slide asks, in the bold-question form of the instructor's own decks: "**What are the
decision variables?**", then the variables; "**Are there limits to what values they can take?**", then
the bounds. Asides, "why" sidebars ("Why Is $t_{2A}$ Almost Zero?") and recaps of what a slide just
showed were cut the same way.

**Speaker notes** carry board items and background. The instructor deleted pacing marks ("You should
be here by about minute 52"), a substitute's sheet, scripted lines, cut lists, closing morals and
restatements of the setting (10-2 and 8-2, Oct 2026).

**Words.** Use the technical term rather than a metaphor ("the objective decreases", not "downhill";
"control volume", not "air parcel"; "discretization error", not "grid error"), and bold it where it is
defined ("C2 and C3 are **binding constraints**"). State the general idea, then the case ("the output of
interest. **Here**: …"). Takeaways state concepts without this example's numbers.

## Power-system examples

Two rules for dispatch and capacity-expansion material, in decks and assessments alike (decided Oct 11):

- **Ramp limits apply to dispatchable plants.** Do not describe wind or solar as ramping, and do not
  put ramp constraints on them in a model: their output follows the weather through a capacity factor.
- **Interpret only the shadow prices that are read in practice**: the demand balance (the price of
  electricity) and a system-wide cap such as emissions (a carbon price). Do not ask students to
  interpret a generator's own capacity or minimum-output shadow price.

**The lecture examples share one set of fuel prices: 2022's** (decided Oct 12). Natural gas is \$7.21
and coal \$2.36 per MMBtu, the averages delivered to U.S. power plants that year, in the Oct 28
dispatch example and the Nov 2 capacity expansion example. The Nov 2 deck then varies the gas price
(\$3.50 and \$15). A number quoted in both decks has to match after any change to either. Mini-Project 2 keeps its own costs, for New York in 2013.

## The plume emissions LP

Lectures 8-2 and 9-1 share one two-stack, three-receptor LP, and 15-2 reuses it (decided Oct 14):

- $R_1$, $R_2$ are the **fractions** of each stack's SO$_2$ removed, bounded by 0 and 1 (the
  instructor's FA24 framing). The objective is $1000 R_1 + 1200 R_2$ (\$1000/yr): \$20,000 and \$30,000
  per g/s removed, times 50 and 40 g/s.
- Transmission factors are rounded to the 0.1 shown on the slide where `t` is computed, and every later
  number comes from the rounded values, so a board derivation from the table (9.0 × 50 = 450) matches
  the slides: C1 $875R_1 \geq 679$, C2 $450R_1 + 460R_2 \geq 714$, C3 $75R_1 + 568R_2 \geq 447$.
- The optimum is quoted to two decimals ($R_1$ = 0.90, $R_2$ = 0.67, \$1.7M/yr), with removals in g/s
  computed from those values. The shadow prices are 2.16 (C2) and 0.36 (C3), in \$1000/yr per µg/m³.
- In JuMP, 9-1 writes the model first line by line (`R1`, `R2`, C1–C3 typed in), then with indices.
- A number quoted in more than one of these decks has to match after any change. 15-2 (Dec 2) still
  uses the g/s form.

## Writing homework problems

**Limited asks per subproblem** (decided Oct 14, from HW6 on): each `#### Problem N.M` asks for one
thing, or two tightly linked ones. Do not group two or three asks under one subproblem, as a numbered
list or as stacked questions; make more subproblems, each with its own points. Details, including what
counts as an ask, are under "Homework format" in AGENTS.md.

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
