# BEE 4750 Fall 2026 — Semester Plan

Planning document. **Canonical** for the plan; `schedule.qmd` is the student-facing rendering.

> ⚠️ `schedule.qmd` currently carries a **superseded seven-quiz numbering** and needs reconciling
> against the six-quiz plan below.
>
> ⚠️ `data/schedule.csv` is stale — referenced nowhere, disagrees with `schedule.qmd` on weeks 1–7,
> and from row 14 is contaminated with a different course entirely (Bootstrap, Missing Data, GLMs,
> Spring Break, March–May dates). Delete or archive it.

**Class**: MW 2:55–4:10pm (75 min), 105 Riley-Robb.
**No class**: Sep 7 (Labor Day), Oct 12 (Fall Break), Nov 25 (Thanksgiving).
**Last class** Dec 7 assumed; project presentations Tue Dec 8 sit in the final-exam slot and do not
consume a class day. Confirm all three break dates and the last day against the registrar.

---

## Delivered (weeks 1–4, through Sep 14)

| Wk | Date | Session | Deck | Assessment |
|:--:|:--|:--|:--|:--|
| 1 | Mon Aug 24 | Course Overview | `lecture01-1-intro` | HW1 assigned |
| 1 | Wed Aug 26 | Intro to Systems | `lecture01-2-systems-intro` | |
| 2 | Mon Aug 31 | Feedbacks & Equilibria | `lecture02-1-dynamics-feedbacks` | |
| 2 | Wed Sep 2 | Stability & Examples | `lecture02-2-stability-examples` | HW2 assigned |
| 3 | Mon Sep 7 | *No class — Labor Day* | | |
| 3 | Wed Sep 9 | Bifurcations and Hysteresis | `lecture03-2-lake-hysteresis` | **Quiz 1** |
| 4 | Mon Sep 14 | Simulation and Discretization | `lecture04-1-simulation-discretization` | |

---

## Session plan — Sep 16 onward

Status key: **Ready** — deck exists and is revised for FA26 · **Revise** — source exists, needs the
change named · **New** — nothing exists, build from scratch.

| Wk | Date | Session | Source material | Status | Lab / HW / Quiz |
|:--:|:--|:--|:--|:--|:--|
| 4 | Wed Sep 16 | Dissolved Oxygen and Streeter-Phelps | `lecture04-2-streeter-phelps` | Ready | HW3 |
| 5 | Mon Sep 21 | **Lab: Convergence and Discretization** | `labs/lab01` (Fall26 branch) | Ready | Lab 1 |
| 5 | Wed Sep 23 | Uncertainty, Probability, and Monte Carlo | `lecture05-2-monte-carlo-foundations` | Ready | MP1 assigned |
| 6 | Mon Sep 28 | Monte Carlo: Applying It, Justifying It | `lecture06-1-monte-carlo-inference` | Ready | |
| 6 | Wed Sep 30 | Gaussian Plumes: Deriving the Model | `lecture06-2-plume-derivation` | Ready | HW4 · **Quiz 2** |
| 7 | Mon Oct 5 | Gaussian Plumes: Footprints and Flexibility | `lecture07-1-plume-analytics` | Revise — add the three views and a light grid introduction; move the puff material to Oct 7 | |
| 7 | Wed Oct 7 | **Model Validation** | `lecture07-2-model-validation` | **Written** — ported from the FA25 validation section of `lecture05-1-dissolved-oxygen-2`, extended | HW5 |
| 8 | Mon Oct 12 | *No class — Fall Break* | | | |
| 8 | Wed Oct 14 | Decision Models and Linear Programming | `lecture07-1-prescriptive-modeling` + `lecture08-2-optimization` | Revise — compress 2→1 | HW6 |
| 9 | Mon Oct 19 | Project Proposal Peer Review | *activity, no deck* | **New** | **Quiz 3** |
| 9 | Wed Oct 21 | Shadow Prices and Duality | `lecture09-1-capacity-expansion` (shadow-price half) | Revise — split; carries first JuMP | HW7 |
| 10 | Mon Oct 26 | **Lab: Linear Programming with JuMP** — *TA* | `labs/lab03` | Revise — re-theme to power systems | Lab 2 |
| 10 | Wed Oct 28 | Economic Dispatch — *sub (power systems expert)* | `lecture10-2-economic-dispatch` | Revise — FA25 to FA26; **keep** multi-period dispatch and the renewables/duck-curve material | MP2 assigned |
| 11 | Mon Nov 2 | Capacity Expansion | `lecture09-1` (capacity half) + `lecture10-1-capacity-expansion-2` | Revise — compress 2→1 | |
| 11 | Wed Nov 4 | Mixed Integer Programming | `lecture11-1-mixed-integer` | Reuse — trim branch-and-bound | HW8 · **Quiz 4** |
| 12 | Mon Nov 9 | Solid Waste and Network Models — *sub* | `lecture12-1-waste-management` | Reuse — make sub-ready | HW9 |
| 12 | Wed Nov 11 | Unit Commitment — *sub (power systems expert)* | `lecture11-2-unit-commitment` | Revise — FA24 to FA26; the canonical MIP application, reinforcing Nov 4 | |
| 13 | Mon Nov 16 | Stochastic Optimization and Scenario Trees | `lecture13-1-stochastic-optimization` | Reuse | **Quiz 5** |
| 13 | Wed Nov 18 | Sequential Decisions and Dynamic Programming | *nothing exists* | **New** | MP3 assigned |
| 14 | Mon Nov 23 | **Lab: Scenario Trees and Sequential Decisions** | *nothing exists* | **New** — reservoir operations under hydroclimatic uncertainty | Lab 3 |
| 14 | Wed Nov 25 | *No class — Thanksgiving* | | | |
| 15 | Mon Nov 30 | Sensitivity, Robustness, and Multiple Objectives | `lecture13-2` (MOO half) + `lecture14-1-sensitivity-analysis` | Revise — merge 2→1 | |
| 15 | Wed Dec 2 | Limits of Optimization | `lecture13-2` (limits half) + `lecture15-2-simulation-optimization` | Revise — split + recompose | |
| 16 | Mon Dec 7 | Course Wrap-Up and Synthesis | *flex* | **New** | **Quiz 6** |

**Totals from Sep 16**: 24 rows — 2 no-class days and **22 sessions**, of which 6 are ready, 3 reuse
as-is, 8 need revision, and 4 are new builds (the peer-review activity, DP, Lab 3, and the wrap-up —
model validation turned out to be a port, not a new build). The simulation half ends Oct 7; optimization runs Oct 14 – Dec 7. Instructor away
weeks 10 and 12 (Oct 26/28, Nov 9/11) — each gets one TA-supervised lab or a procedural lecture, and
no quiz falls in either.

---

## Quizzes

Six total, one dropped for 4750. Rules observed: a quiz never covers material from its own week,
labs are never assessed, and no quiz falls in a travel week or on Thanksgiving week. Host sessions
were chosen so the 25-minute loss lands on an activity session or a reuse deck — never on
from-scratch or already-compressed material.

| Quiz | Date | Gap | Covers | Host absorbs it? |
|:--|:--|:--:|:--|:--|
| 1 | Wed Sep 9 | — | — | — |
| 2 | Wed Sep 30 | 21 d | Discretization, convergence, Streeter-Phelps, Monte Carlo foundations | Plume derivation — existing deck |
| 3 | Mon Oct 19 | 19 d | Monte Carlo inference, both plume sessions, model validation. **Stops short of week 8**, leaving LP to anchor Quiz 4 | Peer review — activity session |
| 4 | Wed Nov 4 | 16 d | LP, shadow prices, economic dispatch (including multi-period and ramping) | MIP — reuse deck |
| 5 | Mon Nov 16 | 12 d | Capacity expansion, MIP, waste/networks, unit commitment | Stochastic optimization — reuse deck |
| 6 | Mon Dec 7 | 21 d | Scenario trees, DP, sensitivity/robustness/MOO, limits of optimization | Wrap-up session |

Spacing runs 12–21 days. The two 21-day gaps sit at the ends: Quiz 2 waits for enough material to
accumulate, and Quiz 6 spans Thanksgiving. Coverage balances at 3/4/3/4/4 sessions.

### Question bank

Reusable questions live in `exams/midterm1` and `exams/midterm2`, across branches:
`git show Fall25:midterm1.qmd`, `git show b956d06:midterm2.qmd` (FA24), `git show Fall23:midterm1.qmd`.

- **Quiz 2** — the airshed Monte Carlo questions recur across FA23/24/25: exceedance probability,
  "should you stop sampling?", what 10,000 samples buys, CI interpretation (3–4 min each). Euler
  discretization of a given ODE also appears repeatedly. Well supplied.
- **Quiz 3** — plumes and validation have **no exam precedent**; both need writing.
- **Quiz 4** — the best-supported quiz. Graphical LP appears on 4/4 optimization-era exams (~8–10 min);
  the "without calculating the objective, which points could be optimal? justify each" variant is the
  strongest single item found. LP true/false (~5 min). The farmer shadow-price set is reused every
  year: units, which constraints bind, relaxation comparison, buy-the-land arithmetic (2–5 min each).
  Dispatch formulation from a plant table (~12–15 min) plus "where does the price come from" (3 min).
  The duck-curve conceptual question (FA25, 2 pts) moves here now that ramping is taught Oct 28.
  More precedented material than will fit — pick two.
- **Quiz 5** — **no precedent at all** now that the duck-curve item has moved to Quiz 4. Capacity
  expansion, MIP, branch and bound, network/waste allocation, and unit commitment have never been
  assessed on a timed exam here. Draft early and time-test. Unit commitment is the most promising
  new source: "which constraints need a binary, and why" is a clean 4–5 minute item.
- **Quiz 6** — Pareto non-dominance has precedent (FA23: identify non-dominated policies from a
  4×3 reservoir table, ~5–8 min), pairing with an objective-vs-metric conceptual part. Scenario-tree
  and DP questions need writing.
- ⚠️ **Do not reuse the full YUK formulate-a-model question** — at 16–25 points it consumed ~35 minutes
  of a 75-minute exam. "Decision variables with units and bounds" alone is a clean ~10-minute item.

---

## Homework and mini-projects

Weekly cadence; every homework pairs a by-hand component with a *light* computational one. Anything
needing scale — many effluents, real data, full capacity expansion — goes to a mini-project. Due
Thursdays 9pm. Nine homeworks total, inside the syllabus's 8–10, one dropped.

| HW | Assign | Due | Topic | By-hand | Computational (light) |
|:--|:--|:--|:--|:--|:--|
| 4 | Wed Sep 30 | Thu Oct 8 | Monte Carlo, uncertainty & risk | Expectation/variance of a function of a random variable; why MC error scales as σ/√n and the samples a target precision needs; exceedance probability and return periods; aleatory vs. epistemic | Propagate parameter uncertainty through the HW3 model; CI on one decision-relevant quantity plus an *n*-convergence plot |
| 5 | Wed Oct 7 | Thu Oct 15 | Gaussian plumes & model validation | Evaluate the plume equation at a receptor; stability class and wind speed effects; where the max ground-level concentration occurs; what a goodness-of-fit metric is blind to | Evaluate the plume on a coarse grid, locate the max, and score it against observations |
| 6 | Wed Oct 14 | Thu Oct 22 | Decision models & linear programming | Formulate from a word problem: decision variables with units and bounds, objective, constraints; standard form; solve a 2-variable LP graphically | None required |
| 7 | Wed Oct 21 | Thu Oct 29 | Duality, shadow prices & first JuMP | Identify binding constraints; interpret shadow prices with units; decide whether to buy capacity given a shadow price; what a zero shadow price implies | Solve the *same* LP in JuMP, extract duals, confirm they match the hand answer |
| 8 | Wed Nov 4 | Thu Nov 12 | Mixed integer programming | Model a fixed cost, an either/or, and an indicator with binaries; why the LP relaxation bounds; trace 2–3 branch-and-bound nodes | Solve a small MIP; compare to its LP relaxation |
| 9 | Mon Nov 9 | Thu Nov 19 | Network models & waste allocation | Set up a small facility-allocation network; flow-conservation and capacity constraints; siting indicators | Solve the instance; interpret which facilities open |

**Design notes.** HW4 deliberately echoes HW3, putting deterministic truncation error in Δt beside
statistical error in *n*. HW6's graphical-LP question should match Quiz 4's format so the homework is
real practice. HW7 asks for the hand answer *before* the JuMP check. Weeks 13–16 carry no new
homework — MP3, the project update (Nov 13), presentations (Dec 8), and the report (Dec 20) fill it.

| MP | Assign | Due | Topic |
|:--|:--|:--|:--|
| 1 | Wed Sep 23 | Thu Oct 8 | **Simulating DO with multiple effluents** — extend Streeter-Phelps to several discharges, resolve the discretization, identify the critical point and compliance |
| 2 | Wed Oct 28 | Thu Nov 12 | **Capacity expansion under a CO₂ constraint** — NYISO demand and capacity-factor data. Repurposes `hw/hw04` essentially as-is |
| 3 | Wed Nov 18 | Thu Dec 3 | **Reservoir operations under hydroclimatic uncertainty** — scenario trees and sequential decisions; scaffolded by Lab 3 |

---

## Build inventory

**New from scratch**
- ~~**Model validation** lecture (Oct 7)~~ — **written**. It was never a from-scratch build: the FA25 deck `lecture05-1-dissolved-oxygen-2.qmd` carries a full calibration-and-validation section (Oreskes framing, RMSE, nonuniqueness, positive and negative controls, empirical vs. face validity) that had not been ported forward.
- **Sequential decisions & dynamic programming** lecture (Nov 18) — no deck exists
- **Lab 3**, scenario trees + sequential decisions / reservoir operations (Nov 23)
- Quiz questions for plumes, validation, MIP, networks, scenario trees, DP — none have exam precedent
- **Every homework from HW4 on**, and all three mini-projects (no `mini-project/` directory exists)

**Major revision**
- Split `lecture09-1-capacity-expansion.qmd`: shadow-price half + JuMP intro → Oct 21; capacity half
  merges with `lecture10-1-capacity-expansion-2.qmd` → Nov 2. This is what puts prices before the
  applications.
- Split `lecture13-2-limits-optimization.qmd` (filename says limits, title says Multiple Objectives,
  it holds both): MOO half → Nov 30; limits half → Dec 2, absorbing gradient-descent material from
  `lecture15-2-simulation-optimization.qmd`.
- ~~Recompose Nov 11 from the renewables/duck-curve parts of `lecture10-2`~~ — dropped. That split
  existed only to lighten Oct 28 for a substitute. The substitute is a power systems expert, so
  Oct 28 keeps its multi-period and renewables material and Nov 11 becomes unit commitment instead.
- Nov 30 three-way merge (sensitivity + robustness + MOO) is the most over-subscribed session: keep
  the conceptual thread, push formal Morris/Sobol' to a reading.
- Compress `lecture07-1-prescriptive-modeling` + `lecture08-2-optimization` into Oct 14.

**Reuse** — Monte Carlo (both), both plume decks, economic dispatch, MIP, waste/networks, stochastic
optimization, `lab03` as Lab 2.

**Dropped** — simulation-optimization as its own session. (Unit commitment is **no longer dropped**:
it returns as the Nov 11 session.)

---

## Open items and risks

1. **`schedule.qmd` is out of sync** — it carries seven quizzes with the old numbering.
2. **Lab repo numbering is crossed.** Splitting Monte Carlo across two lectures removed the MC lab,
   so the JuMP lab becomes Lab 2 and scenario trees becomes Lab 3 — but `labs/lab02` *is* the Monte
   Carlo lab and `labs/lab03` is the JuMP one. Renumber the repos or accept display numbering that
   differs from repo names.
3. ~~Stale plume deck dates and filename prefixes~~ — fixed: dates now Sep 30 and Oct 5, files renamed to `lecture06-2-plume-derivation` and `lecture07-1-plume-analytics`. Note `lecture07-1-prescriptive-modeling` now shares the `lecture07-1` prefix; that resolves when it merges into the Oct 14 session.
4. **`lecturexx-xx-lake-uncertainty.qmd`** ("Parameter Uncertainty in the Shallow Lake Model") has no
   lecture number, no date, and no slot. Shelve deliberately or place it.
5. **Assignment authoring is the largest build item of the term** — larger than the slide revisions.
   Sequence it against the assign dates above, not against lecture prep.
6. **Two travel weeks, four covered sessions.** Oct 28 and Nov 11 go to a power systems expert and
   need no simplification — both can be full lectures. **Nov 9 (waste and network models) is not a
   power systems topic**; it still needs a plan. No re-sync time on return — budget a few minutes at
   the top of Nov 2 and Nov 16.
7. **Almost no slack.** Contingency: fold the reservoir application into Lab 3 and compress the DP
   lecture. Nov 11 is no longer the first thing to cut — it now carries the MIP application.
8. **Stale fork**: `slides/lecture10-1-gaussian-plumes.qmd` duplicates the first half of
   `lecture10-1-capacity-expansion-2.qmd`. Resolve before editing either — the Nov 2 recomposition
   touches that material.
9. **Deck filenames encode FA25 lecture numbers** that no longer match; the `lecture09-1` split turns
   one file into two sessions two weeks apart.
10. **`project/index.qmd` links `update.qmd`, which does not exist.**
11. Syllabus promises 27 lectures; this calendar yields 28.
