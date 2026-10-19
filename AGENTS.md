# BEE 4750/5750 Course Website — Agent Guide

## Most course material lives outside this repository

This repo is the **website**. Lectures and the site scaffolding are here; almost everything else is a
separate repository checked out as a sibling under `~/Teaching/BEE4750/`:

| Path | Contents |
|------|----------|
| `fall2026/` | This repo — site, slides, tutorials |
| `labs/lab01`–`lab03` | Lab repos, one each |
| `hw/hw01`–`hw05` | Homework repos, one each |
| `hw/solutions/hw01`–`hw04` | Solution repos for the keys already released, named `hwXX-solution` |
| `hw-solutions/` | **Private keys repo** for HW5–9 and Labs 2–4 (`bee-envsys-cornell/hw-solutions`, `Fall26`), published at each key's release time |
| `exams/midterm1`, `midterm2` | Prelim repos |
| `quizzes/` | **One private repo** for all six quizzes and their keys (`bee-envsys-cornell/quizzes`, `Fall26`), a folder per quiz |
| `website/` | **Fall 2025 offering** (prior year, full site) |
| `fa24/`, `fall2023/`, `fall2022/`, `old-web/` | Earlier offerings |

Before editing an assignment, lab, or exam, confirm you are in the right repository — the name of a
directory inside this repo is not where that content lives.

## Branch per year

Every assignment, lab, solution, exam, and quiz repo stores each offering as a **branch**:
`Fall23`, `Fall24`, `Fall25`, `Fall26`. Create the new year's branch from the previous one rather
than editing in place.

This is how you read last year's version of anything:

```bash
git -C ~/Teaching/BEE4750/exams/midterm1 show Fall25:midterm1.qmd
```

Two repos are not on a year branch: `exams/midterm1` sits on `main` (which holds the FA24 exam), and
`exams/midterm2` on `Fall25`. Check `git branch -a` rather than assuming.

Current branches, as of Fall 2026 setup: `labs/lab01`, `hw/hw01`–`hw03`, `hw/solutions/hw01`–`hw03`,
and `quizzes/quiz01` are on `Fall26`; `labs/lab02`–`lab03`, `hw/hw04`–`hw05`, and
`hw/solutions/hw04`–`hw05` are still on `Fall25`.
*Updated Oct 8:* `hw/hw05` and `hw/solutions/hw05` are on `Fall26`. `labs/lab02`, `labs/lab03`,
`labs/lab04` (cloned from `bee-envsys-cornell/lab04`), `labs/solutions/lab02-solution` and
`labs/solutions/lab03-solution` (cloned) have new, uncommitted `Fall26` branches holding the FA26 Labs
2–4; FA26 Lab N lives in repo `labN`, so Lab 2 (JuMP) replaced the old Monte Carlo lab in `lab02`.
`quizzes/quiz01`–`quiz04` are repos on `Fall26` (remotes `bee-envsys-cornell/quizNN`). The new
assignment folders `hw/hw06`–`hw09`, their solutions, `labs/solutions/lab04` and
`quizzes/quiz05`–`quiz06` are local repos initialised on `Fall26` with no commits and no remote yet,
like `mini-project/mp02`.
*Updated Oct 15:* the HW5–9 and Lab 2–4 keys moved into one private repository,
`bee-envsys-cornell/hw-solutions` (`Fall26`; local clone `~/Teaching/BEE4750/hw-solutions`, folders
`hw05`–`hw09`, `lab02`–`lab04`), which the site publishes at each key's release time (see
"Releasing keys"). The old folders are in `~/Teaching/BEE4750/archive/2026-10-15-key-folders/`, and
`hw05-solution`, `lab02-solution` and `lab03-solution` are archived on GitHub. HW1–4 and Lab 1 keys
stay in `hw/solutions` and `labs/solutions` and in this site's `solutions/`.
*Updated Oct 15:* the six quizzes and their keys are one private repository too,
`bee-envsys-cornell/quizzes` (`Fall26`), cloned at `~/Teaching/BEE4750/quizzes` with folders
`quiz01`–`quiz06` (paths unchanged). The per-quiz folders as they were are in
`~/Teaching/BEE4750/archive/2026-10-15-per-quiz-repos/`; the old `quizNN` repositories still exist on
GitHub, unarchived. Access: the Fall 2026 TA, `jenna637`, has write on `quizzes` and `hw-solutions`;
the organization's owners (including former TAs, kept by the instructor's choice) see everything.

## Homework format

Problem headings give the points as a bare number, to save space: `### Problem 1 (15)`,
`#### Problem 1.1 (5)`, never "(15 points)" or "(1 point)" (decided Oct 8). The overall line stays
`## Problems (Total: 50 Points)`. Rubric text inside a key's callouts can still say "points".

The Overview's Instructions list has one bullet per problem, each saying what the problem asks you
to do: "Problem 3 asks you to find … by hand, then check them in `JuMP`." Add the "Write your answers
in Markdown cells" bullet when the homework has sketches. Leave out study advice ("do the hand parts
first"), lecture dates, and commentary on the assignment (from the instructor's HW6 edit, Oct 9).

**Each subproblem carries a limited number of asks** (decided Oct 14, after HW5 went out; applies from
HW6 on). An ask is a separate thing the student has to produce: a value, the results of a solve, a
sketch, an explanation, a judgment. Give each `#### Problem N.M` one ask, or two tightly linked ones (a
result and why, from the same work). Do not group two or three asks under one subproblem, whether as a
numbered list or as stacked questions in the prose ("Which constraints bind? Give the slack of the
others. What does that mean for the city?"): split them into more subproblems, each with its own
points. HW5's 3.3 and 3.4, with three numbered asks each, are the pattern to avoid. Numbered lists inside
a subproblem are still fine for cases or data (five points to test, two rules, two re-solves that each
get their own subproblem). Qualifiers such as "with units" or "as a table" are not asks, and one table of
per-case values counts as one. Splitting keeps each problem's total and the 50-point total; renumber the
key's `###` headings to match and update every "Problem N.M" cross-reference in the prompt, key and
README. HW6–HW9, drafted on Oct 8–10 before this rule, were restructured to it on Oct 15. The earlier versions are in
`hw/.drafts/2026-10-15-hw06-09/`.

**Homework keys carry no rubric notes** (decided Oct 9; mini-project and quiz keys keep their grading notes). Grading follows the public standard rubrics in
`policies/rubric.qmd` (Formulation, Solution, Analysis and Interpretation, Figures), so a key gives the
model answer and its reasoning, with no per-part point splits, partial-credit fractions, or lists of
common errors. A note stays only where a correct answer can legitimately vary and the prompt cannot pin it
(a solver artefact, Monte Carlo noise), in one sentence. If a key would need to list several acceptable
answers, the problem is not pinned well enough: tighten the prompt instead (state the sign convention, the
rounding, the form of the constraint). Deliberately open questions are fine in moderation: tradeoffs,
recommendations, what information would change the answer. When a new kind of problem appears, extend the
"What this looks like" lists on the rubric page rather than writing a per-assignment rubric.

## Releasing keys

From HW5 and Lab 2 on, keys are never committed here. They live in the private
`bee-envsys-cornell/hw-solutions` (`Fall26`, local `~/Teaching/BEE4750/hw-solutions`), one folder per
key with its frozen results (`_freeze/`). The deploy workflow runs `scripts/release-keys.sh`, which
copies every key whose time in `data/key-releases.csv` (US Eastern) has passed into
`solutions/<folder>/`, renders the page with `quarto render … --use-freezer` (no Julia), and deploys.
The vault note **Key Release Workflow** is the instructor's checklist; the points for agents:

- **A key's time is in two places**: its row in `data/key-releases.csv` and the `data-release` on its
  link in `hw/index.qmd` or `labs/index.qmd` (`_assets/release-gate.html` keeps the icon plain until
  then). Change both together.
- **A key must be rendered from the top of `hw-solutions`** (`quarto render hw06/hw06.qmd`), and its
  `_freeze/<folder>/` committed. The script refuses a key whose `.qmd` changed after its last render
  (the frozen results record the source's hash). `hw-solutions` must not sit under a hidden folder:
  Quarto then ignores its `_quarto.yml` and writes no `_freeze/`.
- **Never commit a key here.** `.gitignore` covers `solutions/*` except HW1–4 and Lab 1, which were
  released the old way and stay.
- **Rehearse without publishing:** `scripts/release-keys.sh --keys ~/Teaching/BEE4750/hw-solutions
  --now "2026-10-30 21:00" --serve` builds a temporary copy and serves it at localhost:4400; Run
  workflow with a `now` input renders in CI without deploying. `--deploy` with `--now` is refused.
- **Secrets** on this repo: `HW_SOLUTIONS_DEPLOY_KEY` (read-only deploy key on `hw-solutions`),
  `CLOUDFLARE_API_TOKEN` (Pages: Edit, expires 2027-06-01), `CLOUDFLARE_ACCOUNT_ID`.
- **Schedule:** cron 01:20 and 02:20 UTC, so 9:20 pm Eastern in either daylight or standard time;
  a scheduled run deploys only if a key came due in the last 25 hours.

## Two GitHub organizations

Remotes point at either `BEE4750/…` or `bee-envsys-cornell/…`, apparently from an organization
rename, so both resolve. The consequence to watch: the submodule `hw/hw01` is configured against
`bee-envsys-cornell/hw01` while the standalone checkout at `~/Teaching/BEE4750/hw/hw01` points at
`BEE4750/hw01`. Do not infer the canonical org from a remote URL.

## Toolchain

- **Quarto** (v1.10+) builds the site. Julia is the execution engine:
  - `quarto preview` — dev server on port 4200
  - `quarto render` — build to `_site/`
- **Julia version is inconsistent.** `_quarto.yml` sets `exeflags: ["+1.12"]`, but individual decks
  and assignments set `["+1.11.5"]` in their own front matter, which wins. Match the file you are
  editing rather than the project default.
- **No** Makefile, linters, type checkers, or test framework. The one CI workflow is the deploy
  (below).
- **Deploy:** `.github/workflows/deploy.yml` uploads the committed `_site/` to Cloudflare Pages
  (project `envsys-fa26-du`, direct upload) on every push to `main` and nightly, adding the keys
  whose time has passed; see "Releasing keys". The public path `envsys.viveks.me/fall2026` is the
  Worker `envsys-fa26-proxy`, which fetches `envsys-fa26-du.pages.dev`. The old Git-built project
  `envsys-fa26` (subdomain `envsys-fa26.viveks.me`) no longer deploys, since 2026-10-15. The
  `gh-pages` branch and its stale GitHub Pages site were deleted that day (a bundle of the branch is
  in `~/Teaching/BEE4750/archive/`).
- Solver: **HiGHS** is the only one used anywhere in the course.

## Julia environments (multi-environment)

Quarto activates the **closest** `Project.toml` when rendering a file:

| Directory | Contents |
|-----------|----------|
| Root (`Project.toml`) | Minimal – Animations, CSV, DataFrames, Distributions, JuMP, Latexify, PrettyTables, StatsBase |
| `slides/` | Heavy – adds DifferentialEquations, Plots, HiGHS, Metaheuristics, Optim, GlobalSensitivity, etc. |
| `tutorials/` | Adds Turing, CairoMakie, PythonPlot, CondaPkg, etc. |
| `solutions/hw*/`, `hw/hw*/` | Each has its own environment |

Run Julia from the relevant directory to activate the right env. The VS Code setting
`julia.environmentPath` points to the repo root.

**Every lab and homework environment includes `IJulia`.** Assignments ship to students as `.ipynb`
notebooks, and IJulia provides the Julia kernel Jupyter needs to run them. Leaving it out has stopped
students from doing the exercises — but only some students, on some setups, which is how the repos
drifted: **it will usually work when you test it**, so a passing check is not evidence it can go. No
cell ever loads it either, so it looks unused. Do not remove it when trimming an environment down to
what an assignment uses, and check for it whenever you create a new year's branch. The
same rule holds for BEE 4850.

**Check every assignment environment for IJulia when branching** (HW2 and HW3 were missing it; added
Oct 9). From `~/Teaching/BEE4750`:

```bash
for p in hw/hw0?/Project.toml labs/lab0?/Project.toml mini-project/mp0?/Project.toml; do
  grep -q '^IJulia' "$p" || echo "missing IJulia: $p"
done
```

## Structure

- **`_quarto.yml`** — site config, nav, sidebar, format settings (HTML, Typst, RevealJS, Beamer)
- **`_variables.yml`** — course number, instructor, meeting pattern, room; referenced via `{{< var ... >}}`
- **`_assets/`** — logos, Lua filters, Typst build helpers, CSL
- **`_extensions/quarto-ext/fontawesome/`** — icons
- **`sass/`** — SCSS overrides for the Simplex theme and RevealJS
- **`slides/`** — lecture decks (`.qmd`, RevealJS)
- **`tutorials/`** — tutorials with their own Julia env
- **`solutions/`** — contains `hw01` only; the full set lives in `~/Teaching/BEE4750/hw/solutions/`
- **`labs/`** — `index.qmd` only. **Lab content is not in this repo** (see the table above)
- **`data/schedule.md`** — the semester plan (canonical for planning; `schedule.qmd` is what students see)

## Submodules

Only two are registered, both on `Fall26`:

| Path | Remote |
|------|--------|
| `hw/hw01` | `bee-envsys-cornell/hw01` |
| `hw/hw02` | `bee-envsys-cornell/hw02` |

Not checked out by default — `git submodule update --init`. Everything else under `hw/` and `labs/`
referenced by the site is **not** a submodule.

## Typst rendering for assignments and quizzes

Homework and quizzes render through Typst, not LaTeX. The project-level filter
`_assets/typst-pdf/processing.lua` is what substitutes `pdf-title` and `pdf-subtitle` into the
rendered title block.

Two consequences:

- **`pdf-header-left`, `pdf-header-right`, `pdf-footer-left`, and `pdf-logo-path` are inert.**
  Nothing reads them. They appear in several assignment files and do nothing; do not build on them.
- **Rendering an assignment standalone, outside this project, silently loses the filter** — the
  title block falls back to the plain `title`. If a file must render both ways, vendor the filter
  alongside it.


**The PDF students download may be built from the notebook, not from the `.qmd`.** An assignment's
`.qmd` can specify Typst while its CI builds the PDF from the generated `.ipynb` through LaTeX. Then
rendering the `.qmd` locally looks perfect and proves nothing about what students receive. Read the
repo's workflow for which file and which target it invokes, and reproduce that command.

**The notebook intermediate silently drops Quarto markup.** Callouts are flattened to blockquotes on
the way into `.ipynb`, and `content-visible when-format=` is resolved for the notebook rather than the
eventual PDF. Anything built downstream of the notebook therefore shows callouts as plain indented text
and leaks notebook-only content, such as the name and ID fields, into the PDF. Neither failure raises an
error, and both survive a source review. If the PDF has to carry callouts, build it from the `.qmd`.
*(Moved here from the `assignment-authoring` skill on 2026-09-28, since it is specific to this course's
Quarto → notebook → PDF pipeline.)*

**Thousands separators in math: write `32\text{,}000`** (decided Oct 9). Typst renders both `32{,}000` and
`32,000` inside math as "32, 000", with a space; `\text{,}` renders correctly in Typst, LaTeX and MathJax.
Prose and table numbers are unaffected.

## Known traps

- **Keep the syllabus's meeting count in step with the schedule.** `syllabus.qmd` states the number of
  class meetings ("28 in total, 75 minutes each" for FA26). Count it from `data/schedule.md`: every
  Monday/Wednesday from the first class to the last, minus the no-class days. Labs and activities count;
  breaks don't. Update it in the same pass as any schedule change that adds or removes a meeting. FA26's
  syllabus had drifted to "27 lectures" against 28 meetings (fixed Oct 6, 2026).
- **A code block must be the first thing on its slide — never put text above it.** Revealjs slides
  are a fixed 1280×720 and do not scroll. Text above a code block pushes it down, and the code's own
  scroll box is cut off by the slide's bottom edge, so readers cannot scroll to the end of the code.
  Put the code first (right under the slide title); its output and any discussion can go below it,
  or on the next slide. **Folded code counts** (`code-fold: true`): it expands in place, so text
  above a folded cell breaks the rule too.
- **Pre-allocate arrays in every code sample.** Students are taught to create an array at its final
  size (`zeros(n)`, `Vector{Float64}(undef, n)`) and fill it by index, so slides, assignments, keys,
  and tutorials must do the same: never start empty (`x = Float64[]`) and `push!` in a loop. The one
  exception is code whose point is to show why appending is slow.
- **Every result's setup is on a slide** [instructor, Oct 10, 2026; a recurring miss]. Before a worked
  example's results, a slide states its scenario and every value and condition the results depend on
  (for a plume: emission rates, effective stack height, wind speed, stability class, receptor
  locations, and the standard), and a figure shows the setup itself (a site map, a network, the input
  series). Folded code and comments ("last week's stack, Class F") don't count, because the room sees
  slides. Restate an example carried over from an earlier lecture, give a new quantity (a transmission
  factor) its own slide with its units, what it depends on and one worked instance before any table of
  it, and label what a figure needs to be read (level-line values, units). When compressing lectures,
  cut a result before its setup. Lecture 8-2 had lost all of this for the two-stack LP (restored Oct 10).
- **Callout syntax.** Use `::: {.callout-note}` — hyphenated. The space-separated `::: {.callout .note}`
  is invalid, renders a callout titled literally "None" rather than failing, and currently appears in
  `~/Teaching/BEE4750/hw/solutions/hw02/hw02.qmd`.
- **`date-format: long` strips leading zeros.** A front matter date of `"October 05, 2026"` renders as
  "October 5, 2026", so grepping rendered output for the literal source string fails.
- **Two independent deck numbering systems.** The filename encodes week and session
  (`lecture06-2-plume-derivation` = week 6, Wednesday); the `subtitle: "Lecture NN"` field is a
  sequential count that **skips labs**. Resequencing a lecture changes one and not necessarily the
  other — update both deliberately.
- **`freeze: auto`** caches computed output in `_freeze/`, keyed by filename. Renaming a deck orphans
  its cache; `git mv` the matching `_freeze/slides/<name>/` directory alongside it to keep it.
- **Verify by looking.** Invalid markup frequently renders without any error. After rendering, convert
  pages to images (`pdftoppm -png`) and actually look at them — that is how the "None" callout above
  went unnoticed.
- **Looking at a *deck's* figures needs an extra step.** Plots.jl figures land as inline SVG in the
  rendered HTML, and Quarto's HTML pass lowercases SVG attribute names: `viewBox` → `viewbox`,
  `clipPath` → `clippath`, and it drops the `xmlns:` from `xmlns:xlink`. Browsers correct for this, so
  **the deck displays correctly** — but SVG is case-sensitive, so an extract handed to `rsvg-convert`,
  Inkscape, or any strict renderer ignores the viewBox and crops to the top-left corner. Restore the
  casing first, or you will "fix" a figure that was never broken:

  ```bash
  # pull one figure out of the rendered deck, then repair and convert it
  python3 - <<'PY'
  html = open("_site/slides/<deck>.html").read()
  i = html.find('id="<fig-label>"'); s = html.find("<svg", i); e = html.find("</svg>", s) + 6
  svg = (html[s:e].replace("viewbox=", "viewBox=")
                  .replace("<clippath", "<clipPath").replace("</clippath>", "</clipPath>"))
  open("/tmp/fig.svg", "w").write(svg)
  PY
  rsvg-convert -w 1600 /tmp/fig.svg -o /tmp/fig.png
  ```

  `qlmanage -t` crops the same way and cannot be fixed by flags; use `rsvg-convert`.

- **Unicode superscripts and subscripts in Plots.jl labels render as boxes** in Computer Modern
  (`m³`, `x₁`, `R²`). Write the label as LaTeX (`"\$\\mathrm{m}^3\$"`, `"\$x_1\$"`) and check the
  rendered figure. *(Found in BEE 4850's decks, 2026-10-03; same toolchain.)*
- **Auto-stretch can shrink a figure that shares its slide with long folded code** to thumbnail size.
  Put the figure in a column, mark the slide `{.nostretch}`, or set `auto-stretch: false` for the
  deck and size figures explicitly; then screenshot the slide.
- **Indented text after a figure renders as verbatim code.** In a quiz or assignment, a sub-part
  indented under a numbered question becomes a code block once a figure chunk sits between them.
  Write sub-parts after a figure unindented (`**(a)** …`) and look at the rendered PDF.
- **A manifest resolved under one Julia version fails under another.** Quarto's Julia runner refuses
  to run when a file's `exeflags` pins a different version from the one its `Manifest.toml` was
  resolved with ("Julia version mismatch in notebook file"). Re-resolve with that version's
  `Pkg.resolve()`; if a pinned build has since been removed from the registry, copy a freshly resolved
  environment with the same packages.

- **An edited deck must be re-rendered.** `freeze: auto` stores the whole executed document, prose
  included, so a source edit shows up only after that deck is rendered again (one deck at a time).
- **A deck with no `exeflags` of its own falls back to `_quarto.yml`'s `+1.12`,** a juliaup channel that is
  not installed here; the render fails in about two seconds. The FA25 source decks
  `lecture10-1-capacity-expansion-2`, `lecture14-1-sensitivity-analysis` and
  `lecture15-2-simulation-optimization` are in this state (not on the FA26 schedule).

## Known stale artifacts

- **`data/schedule.csv`** — referenced nowhere, disagrees with `schedule.qmd` on weeks 1–7, and from
  row 14 contains a different course entirely (Bootstrap, Missing Data, GLMs, March–May dates).
  Do not treat it as the schedule.
- **`slides/archive/lecture10-1-gaussian-plumes.qmd`** — a dead fork (capacity-expansion-2 plus the
  FA25 plume lecture), moved to `slides/archive/` on Oct 6, 2026; `_quarto.yml` excludes that folder
  from rendering. Nov 2's deck is `lecture11-1-capacity-expansion.qmd`.
- **`slides/lecturexx-xx-lake-uncertainty.qmd`** — no lecture number, no date, no schedule slot.
- **`project/index.qmd`** links `update.qmd`, which does not exist.
- Most of `slides/` for the optimization half is still a byte-identical copy of the Fall 2025 decks,
  pending revision. A file's existence does not mean it is this year's version.

## Branches in this repo

- `main` — current development (Fall 2026)
- `Fall25` — previous year (origin only, not merged)
- `gh-pages` — deleted 2026-10-15; it served a June 2025 build on GitHub Pages
