# BEE 4750/5750 Course Website — Agent Guide

## Most course material lives outside this repository

This repo is the **website**. Lectures and the site scaffolding are here; almost everything else is a
separate repository checked out as a sibling under `~/Teaching/BEE4750/`:

| Path | Contents |
|------|----------|
| `fall2026/` | This repo — site, slides, tutorials |
| `labs/lab01`–`lab03` | Lab repos, one each |
| `hw/hw01`–`hw05` | Homework repos, one each |
| `hw/solutions/hw01`–`hw05` | Solution repos, named `hwXX-solution` |
| `exams/midterm1`, `midterm2` | Prelim repos |
| `quizzes/quiz01` | Quiz repos |
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
- **No** Makefile, CI workflows, linters, type checkers, or test framework.
- **gh-pages** branch exists for deployment; no deploy automation in this repo.
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

## Known traps

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

## Known stale artifacts

- **`data/schedule.csv`** — referenced nowhere, disagrees with `schedule.qmd` on weeks 1–7, and from
  row 14 contains a different course entirely (Bootstrap, Missing Data, GLMs, March–May dates).
  Do not treat it as the schedule.
- **`slides/lecture10-1-gaussian-plumes.qmd`** — a dead fork duplicating the first half of
  `lecture10-1-capacity-expansion-2.qmd`. Resolve before editing either.
- **`slides/lecturexx-xx-lake-uncertainty.qmd`** — no lecture number, no date, no schedule slot.
- **`project/index.qmd`** links `update.qmd`, which does not exist.
- Most of `slides/` for the optimization half is still a byte-identical copy of the Fall 2025 decks,
  pending revision. A file's existence does not mean it is this year's version.

## Branches in this repo

- `main` — current development (Fall 2026)
- `Fall25` — previous year (origin only, not merged)
- `gh-pages` — built site deployment
