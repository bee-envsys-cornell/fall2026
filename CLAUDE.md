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

Course logistics — assessment rules, the lab rubric, measured slide density — belong in
`data/schedule.md`, not here.
