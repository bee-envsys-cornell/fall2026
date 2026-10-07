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
| 6 | Wed Sep 30 | Gaussian Plumes: Deriving the Model | `lecture06-2-plume-derivation` | Ready | HW4 |
| 7 | Mon Oct 5 | Gaussian Plumes: Footprints and Flexibility | `lecture07-1-plume-analytics` | Revised Oct 2 — rebuilt around a permit's three questions (where and why, how much, over what area): stack height, the standard, area above it, grid sensitivity of peak vs area, superposition | **Quiz 2** |
| 7 | Wed Oct 7 | **Model Validation** | `lecture07-2-model-validation` | **Written** — ported from the FA25 validation section of `lecture05-1-dissolved-oxygen-2`, extended | HW5 |
| 8 | Mon Oct 12 | *No class — Fall Break* | | | |
| 8 | Wed Oct 14 | Decision Models and Linear Programming | `lecture08-2-optimization` (rewritten) | Drafted Oct 5 | HW6 |
| 9 | Mon Oct 19 | The Simplex Method and Shadow Prices | `lecture09-1-simplex-shadow-prices` (new) | Drafted Oct 5 — carries first JuMP | |
| 9 | Wed Oct 21 | Project Proposal Peer Review | `activity-proposal-peer-review` + `project/proposal-review.qmd` | Drafted | HW7 · **Quiz 3** |
| 10 | Mon Oct 26 | **Lab: Linear Programming with JuMP** — *TA* | `labs/lab03` | Revise — re-theme to power systems | Lab 2 |
| 10 | Wed Oct 28 | Economic Dispatch — *sub (power systems expert)* | `lecture10-2-economic-dispatch` | **Drafted Oct 6** — sub-ready (full notes); keeps multi-period dispatch and the duck curve; adds JuMP shadow-price output, hourly prices, a twice-solar case | MP2 assigned |
| 11 | Mon Nov 2 | Capacity Expansion | `lecture11-1-capacity-expansion` (new, from the capacity half of `lecture09-1` + `lecture10-1-capacity-expansion-2`) | **Drafted Oct 6** — screening curves; CO₂ cap and its shadow price | |
| 11 | Wed Nov 4 | Mixed Integer Programming | `lecture11-2-mixed-integer` (renamed from `lecture11-1`) | **Drafted Oct 6** — coded three-plant anchor; branch and bound trimmed | HW8 · **Quiz 4** |
| 12 | Mon Nov 9 | Solid Waste and Network Models — *sub* | `lecture12-1-waste-management` | **Drafted Oct 6** — sub-ready (full notes, no board work); moves to Wed if that is the only day the sub can come | HW9 |
| 12 | Wed Nov 11 | **Lab: Fixed Costs and Facility Siting in JuMP** — *TA* | *nothing exists* | **New** — siting MIP with the formulation given; works before or after the waste lecture, so it can swap to Mon | Lab 3 |
| 13 | Mon Nov 16 | Stochastic Optimization and Scenario Trees | `lecture13-1-stochastic-optimization` | **Drafted Oct 6** — farmer corrected; tables from one JuMP cell | **Quiz 5** |
| 13 | Wed Nov 18 | Sequential Decisions and Dynamic Programming | `lecture13-2-dynamic-programming` (new) | **Drafted Oct 6** — reservoir anchor; Lab 4 builds on it | |
| 14 | Mon Nov 23 | **Lab: Scenario Trees and Sequential Decisions** | *nothing exists* | **New** — reservoir operations under hydroclimatic uncertainty | Lab 4 |
| 14 | Wed Nov 25 | *No class — Thanksgiving* | | | |
| 15 | Mon Nov 30 | Sensitivity, Robustness, and Multiple Objectives | `lecture15-1-multiple-objectives-robustness` (new, from the MOO half of `lecture13-2` + `lecture14-1-sensitivity-analysis`) | **Drafted Oct 6** | |
| 15 | Wed Dec 2 | Limits of Optimization and Course Synthesis | `lecture15-2-limits-of-optimization` (new, from the limits half of `lecture13-2` + `lecture15-2-simulation-optimization` + the wrap-up's synthesis) | **Drafted Oct 6** — absorbs the wrap-up (decided Oct 6) | |
| 16 | Mon Dec 7 | **Quiz 6 and Project Session** — *TA* | `activity-project-session` (new) | **Drafted Oct 6** — logistics, "your project through the course's checks", supervised work time; TA notes | **Quiz 6** |

**Totals from Sep 16**: 24 rows — 2 no-class days and **22 sessions**, of which 6 are ready, 3 reuse
as-is, 7 need revision, 1 new build is drafted (the peer-review activity), and 4 are new builds still to do (DP, Labs 3 and 4, and the Dec 7 project-session activity —
model validation turned out to be a port, not a new build). The simulation half ends Oct 7; optimization runs Oct 14 – Dec 7. Instructor away
weeks 10 and 12 (Oct 26/28, Nov 9/11) — each has one substitute lecture and one TA-supervised lab, and
no quiz falls in either — and on Mon Dec 7, which becomes a TA-run Quiz 6 and project session (decided Oct 6).
**As of Oct 6, every lecture deck and both activity decks through Dec 7 are drafted** (outlines in
`data/outlines-oct28-dec7.md`); Labs 3 and 4 are the remaining session builds. Four labs in all, matching the syllabus's "approximately 4 class periods".

---

## Quizzes

Six total, one dropped for 4750. Rules observed: a quiz never covers material from its own week,
labs are never assessed, and no quiz falls in a travel week or on Thanksgiving week (one exception, decided
Oct 6: Quiz 6 on Dec 7, proctored by the TA, because the instructor is away that day and the alternatives
would drop Quiz 6's coverage). Host sessions
were chosen so the 25-minute loss lands on an activity session or a reuse deck — never on
from-scratch or already-compressed material.

| Quiz | Date | Gap | Covers | Host absorbs it? |
|:--|:--|:--:|:--|:--|
| 1 | Wed Sep 9 | — | — | — |
| 2 | Mon Oct 5 | 26 d | Discretization, convergence, Streeter-Phelps, and all of Monte Carlo (foundations, confidence intervals, sample size, risk) | Plume analytics — rebuilt Oct 2 around the regulator's questions; about 15 content slides after the quiz |
| 3 | Wed Oct 21 | 16 d | Both plume sessions and model validation. **Stops short of week 8**, leaving LP to anchor Quiz 4 | Peer review — activity session |
| 4 | Wed Nov 4 | 14 d | LP, shadow prices, economic dispatch (including multi-period and ramping) | MIP — reuse deck |
| 5 | Mon Nov 16 | 12 d | Capacity expansion, MIP, waste/networks (not the Nov 11 lab) | Stochastic optimization — reuse deck |
| 6 | Mon Dec 7 | 21 d | Scenario trees, DP, sensitivity/robustness/MOO, limits of optimization | Project session (TA-run activity) |

**Quiz 2 moved to Mon Oct 5** (decided Sep 25) so students have worked on HW4 (released Sep 30) over a weekend before it, and so it can cover all of Monte Carlo; Sep 30 keeps its full session and finishes Monte Carlo with the risk section. This breaks the 12–21-day spacing (26 days after Quiz 1, 16 before Quiz 3).

**Oct 19 and Oct 21 swapped** (decided Sep 26): duality moves to Monday, straight after the Oct 14 LP lecture, and the proposal peer review with Quiz 3 moves to Wednesday, giving two working days to distribute the Oct 16 proposals. The written peer review moves to Mon Oct 26, clear of the Oct 22 MP1 and HW6 deadlines.

Spacing otherwise runs 12–21 days. The two 21-day gaps sit at the ends: Quiz 2 waits for enough material to
accumulate, and Quiz 6 spans Thanksgiving. Coverage balances at 3/4/3/4/4 sessions; since Oct 6, Quiz 5 spans
three (Nov 2, 4, 9), because unit commitment is dropped and the Nov 11 lab is not assessed.

### Question bank

Reusable questions live in `exams/midterm1` and `exams/midterm2`, across branches:
`git show Fall25:midterm1.qmd`, `git show b956d06:midterm2.qmd` (FA24), `git show Fall23:midterm1.qmd`.

- **Quiz 2** — the airshed Monte Carlo questions recur across FA23/24/25: exceedance probability,
  "should you stop sampling?", what 10,000 samples buys, CI interpretation (3–4 min each). Euler
  discretization of a given ODE also appears repeatedly. Well supplied.
  *As given (Oct 5):* ran a little long. About 15 separate asks beyond the labelling table, roughly 7
  of them open-ended, with 1-point parts stacking several (4a: read the estimate, read the band,
  decide, explain). The wording likely invited over-long answers. Its confidence band also did not
  survive printing, so 4a is graded on the estimate only. Calibration for later quizzes: about
  10–12 short, bounded asks.
- **Quiz 3** — plumes and validation have **no exam precedent**; both need writing.
  Trimmed Oct 6 to about 11 bounded asks after Quiz 2 ran long.
- **Quiz 4** — the best-supported quiz. Graphical LP appears on 4/4 optimization-era exams (~8–10 min);
  the "without calculating the objective, which points could be optimal? justify each" variant is the
  strongest single item found. LP true/false (~5 min). The farmer shadow-price set is reused every
  year: units, which constraints bind, relaxation comparison, buy-the-land arithmetic (2–5 min each).
  Dispatch formulation from a plant table (~12–15 min) plus "where does the price come from" (3 min).
  The duck-curve conceptual question (FA25, 2 pts) moves here now that ramping is taught Oct 28.
  More precedented material than will fit — pick two.
- **Quiz 5** — **no precedent at all** now that the duck-curve item has moved to Quiz 4. Capacity
  expansion, MIP, branch and bound, and network/waste allocation have never been assessed on a timed
  exam here. Draft early and time-test. The waste network's siting indicators are the most promising
  new source: "which constraints need a binary, and why" is a clean 4–5 minute item (unit commitment,
  the earlier candidate, was dropped Oct 6).
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
| 9 | Mon Nov 9 (Wed Nov 11 if the lecture moves) | Thu Nov 19 | Network models & waste allocation | Set up a small facility-allocation network; flow-conservation and capacity constraints; siting indicators | Solve the instance; interpret which facilities open |

**Design notes.** HW4 deliberately echoes HW3, putting deterministic truncation error in Δt beside
statistical error in *n*. HW6's graphical-LP question should match Quiz 4's format so the homework is
real practice. HW7 asks for the hand answer *before* the JuMP check. Weeks 13–16 carry no new
homework — the term project fills them: update (Nov 13), presentations (Dec 8), report (Dec 20).

**Two mini-projects, not three** (decided Sep 23), each worth 10% and scoped to a short report so it reads as a project rather than a heavier homework. MP1 runs four weeks because Fall Break and the proposal fall inside it; MP2 runs three, opening with the dispatch lecture it depends on. MP3 is dropped; the scenario-tree lab (Lab 4) stands on its own.

| MP | Assign | Due | Topic |
|:--|:--|:--|:--|
| 1 | Wed Sep 23 | Thu Oct 22 | **Simulating DO with multiple effluents** — three effluents and a tapered sludge bed; justify the spatial step, check four candidate treatment plans against the standard, propagate an uncertain load by Monte Carlo, and recommend a plan. Adds the sludge bed's share of the problem and one-step treatment upgrades. Four weeks at a 4-page report scope, so it runs lighter per week than a homework |
| 2 | Wed Oct 28 | Thu Nov 19 | **Electricity dispatch with a carbon tax** — multi-period economic dispatch of an existing fleet (NYISO-style demand and wind/solar capacity factors, ramping limits), hourly prices from the demand-constraint duals, and a carbon-tax sweep to find where coal and gas switch. Final part (after the Nov 2 lecture): add build decisions, impose a CO₂ cap, and show a tax at the cap's shadow price gives the same result. Pure LP. Reuses the FA25 `hw/hw04` data |

---

## Build inventory

**New from scratch**
- ~~**Model validation** lecture (Oct 7)~~ — **written**. It was never a from-scratch build: the FA25 deck `lecture05-1-dissolved-oxygen-2.qmd` carries a full calibration-and-validation section (Oreskes framing, RMSE, nonuniqueness, positive and negative controls, empirical vs. face validity) that had not been ported forward.
- ~~**Sequential decisions & dynamic programming** lecture (Nov 18)~~ — drafted Oct 6 (`lecture13-2-dynamic-programming`)
- ~~**Dec 7 project-session activity deck**~~ — drafted Oct 6 (`activity-project-session`; TA-run, after the TA-proctored Quiz 6): logistics, the four-question
  "your project through the course's checks" activity that drafts the report's Discussion paragraph, and
  supervised work time; about 6 slides with full notes for the TA
- **Lab 3**, fixed costs and facility siting in JuMP (Nov 11): a TA-supervised siting MIP with the formulation
  given (all sites open, then binaries and fixed costs, the LP relaxation, one logical constraint, a
  fixed-cost sweep); its own data, not HW8's or the waste lecture's; needs a TA guide
- **Lab 4**, scenario trees + sequential decisions / reservoir operations (Nov 23)
- Quiz questions for plumes, validation, MIP, networks, scenario trees, DP — none have exam precedent
- **Every homework from HW4 on**, and both mini-projects (MP1 is drafted in `mini-project/mp01`; MP2 does not exist yet)

**Major revision**
- Split `lecture09-1-capacity-expansion.qmd`: shadow-price half + JuMP intro → Oct 19 (done Oct 5, as
  the new `lecture09-1-simplex-shadow-prices.qmd`); capacity half merges with
  `lecture10-1-capacity-expansion-2.qmd` → Nov 2. This is what puts prices before the applications.
- Split `lecture13-2-limits-optimization.qmd` (filename says limits, title says Multiple Objectives,
  it holds both): MOO half → Nov 30; limits half → Dec 2, absorbing gradient-descent material from
  `lecture15-2-simulation-optimization.qmd`. Since Oct 6 Dec 2 also absorbs the
  course synthesis from the dropped wrap-up lecture (the emissions LP under three stability classes, the
  whole-arc tables, the closing slides).
- ~~Recompose Nov 11 from the renewables/duck-curve parts of `lecture10-2`~~ — dropped. That split
  existed only to lighten Oct 28 for a substitute. The substitute is a power systems expert, so
  Oct 28 keeps its multi-period and renewables material and Nov 11 becomes unit commitment instead.
  (Superseded Oct 6: unit commitment is dropped and Nov 11 is the TA siting lab; see open item 6.)
- Nov 30 three-way merge (sensitivity + robustness + MOO) is the most over-subscribed session: keep
  the conceptual thread, push formal Morris/Sobol' to a reading.
- ~~Compress `lecture07-1-prescriptive-modeling` + `lecture08-2-optimization` into Oct 14~~ — done Oct 5.
  Decisions (Oct 5): the anchor is a two-stack, three-receptor **plume emissions LP** (transmission
  factors from the 07-1 plume; removals R₁, R₂; costs 20/30 \$1000/yr per g/s), replacing FA25's
  wastewater example, which had a quadratic objective and an infeasible stated optimum (E₂ = 0.85; the
  correct value is 0.8675). Oct 14 covers formulation, standard form (new), and light corner geometry
  with a rising-cost contrast; no corner tables. Simplex is walked through geometrically at the start
  of Oct 19 (tableau in its appendix), then shadow prices (B $2,150/yr per µg/m³, C $370, A $0) and
  the first JuMP solve of the same LP. HW6 is LP-centred (formulation ~50%, standard form, a light
  graphical question in Quiz 4's format, a nonlinear-cost contrast); HW7 re-solves the same LP.
  The B–C corner holds for cost ratios c₂/c₁ between about 1.27 and 9.2; the contrast needs
  1.24–1.73, which is why the costs are 20 and 30.
  `lecture07-1-prescriptive-modeling.qmd` and the `crud-*` figures are now unused.
- **HW6, HW7, and Quiz 4 drafted (Oct 5)**, with keys; new local folders `hw/hw06`, `hw/hw07`,
  `hw/solutions/hw06`, `hw/solutions/hw07`, `quizzes/quiz04` (no GitHub repos yet). Both homeworks
  use one **stormwater LP**, deliberately not the lecture's plume LP: bioretention $B$ and permeable
  pavement $P$ (acres), min $50B + 30P$ (\$1000/yr) s.t. runoff $5B + 2P \geq 40$, phosphorus
  $5B + P \geq 30$, $B \leq 6$, $P \leq 15$. Optimum $(6, 5)$ at \$450k/yr; runoff and the site limit
  bind (shadow prices \$15k per million gal/yr and \$25k per acre); phosphorus is slack by 5 kg/yr.
  HW6: formulate it, standard form, a graphical LP in Quiz 4's format, and a rising-cost contrast
  ($25B + 5B^2$ puts the optimum mid-edge at $(5, 7.5)$). HW7 states the LP outright so HW6 errors
  don't carry over: binding constraints, shadow prices by hand, buy-an-acre decision, then `JuMP`,
  where a 4-acre lease the shadow price says to take (4 × 25 > 60) is not worth it (actual saving
  50), because the site limit stops binding at 8 acres. Quiz 4 (10 pts): graphical LP (4), a
  one-hour dispatch with `JuMP` shadow prices (4), ramping constraints and the duck curve (2). The
  farmer shadow-price item was **not** reused: its pesticide-relaxation key looks wrong (changing a
  pesticide limit changes coefficients, not a right-hand side, and the corn relaxation is worth more
  to first order), its stem's demand limit disagrees with the model, and the FA25 key is out of sync
  with the FA25 exam's sub-parts. `lecture09-1` now says `shadow_price` is the objective change when a
  constraint is *relaxed* (the earlier "right-hand side increases" was wrong for ≥ constraints).
- **`lecture07-2` streamlined (Oct 6).** The residual-pattern idea had dropped out in the Oct 4
  consolidation, while Quiz 3 Problem 2 and HW5 2.2 assess it. It is back as an in-sample slide,
  "The Residuals Say Otherwise": the calibrated plume's percent residuals run from −17% at 0.5 km
  to +40% at 7 km. It sits before the out-of-sample "Monitors We Did Not Fit", which stays intact as
  the empirical-validity test. "So What Would Have Caught It?" now lists face, residual and empirical
  checks. To pay for it: the review merged to one slide; "A Model Gave You a Number" folded into
  "Sources of Model Error"; "Two Kinds of Evidence" merged into "Calibration Is Not Validation"; the
  noise-refit slide moved to the appendix (linked from the valley slide). Kept on request:
  "Calibrating the DO Model" and the controls section title. The Quiz 3 2b key now also accepts a
  missing removal process.

**Reuse** — Monte Carlo (both), both plume decks, economic dispatch, MIP, waste/networks, stochastic
optimization, `lab03` as Lab 2.

**Dropped** — simulation-optimization as its own session, and unit commitment (again, Oct 6). With the
instructor away Nov 9–13 and only one substitute assured, Nov 11 becomes a TA lab, and unit commitment
needs too much formulation discussion to run as one.

---

## Open items and risks

1. **`schedule.qmd` is out of sync** — it carries seven quizzes with the old numbering.
2. **Lab repo numbering is crossed.** Splitting Monte Carlo across two lectures removed the MC lab,
   so the JuMP lab becomes Lab 2 and scenario trees becomes Lab 3 — but `labs/lab02` *is* the Monte
   Carlo lab and `labs/lab03` is the JuMP one. Renumber the repos or accept display numbering that
   differs from repo names. Since Oct 6 there are four display labs: convergence (Lab 1), JuMP
   (Lab 2), facility siting (Lab 3, Nov 11, no repo yet), and scenario trees (Lab 4, Nov 23).
3. ~~Stale plume deck dates and filename prefixes~~ — fixed: dates now Sep 30 and Oct 5, files renamed to `lecture06-2-plume-derivation` and `lecture07-1-plume-analytics`. Note `lecture07-1-prescriptive-modeling` now shares the `lecture07-1` prefix; that resolves when it merges into the Oct 14 session.
4. **`lecturexx-xx-lake-uncertainty.qmd`** ("Parameter Uncertainty in the Shallow Lake Model") has no
   lecture number, no date, and no slot. Shelve deliberately or place it.
5. **Assignment authoring is the largest build item of the term** — larger than the slide revisions.
   Sequence it against the assign dates above, not against lecture prep.
6. **Travel: weeks 10 and 12, and Dec 7** (decided Oct 6). Week 10: the TA lab Oct 26 and
   the power systems expert's dispatch lecture Oct 28. Week 12: the waste and network lecture with a
   substitute (Mon Nov 9, or Wed Nov 11 if that is the only day they can come) and the TA-supervised
   siting lab on the other day; the lecture has to be waste, because network formulation needs to be
   talked through in class. Unit commitment is dropped, so the expert's Nov 11 booking can be released
   unless they are the substitute who is free for the waste lecture. Decks from Nov 16 on move down one
   "Lecture NN" when built, since labs skip the numbering. Dec 7: the instructor is also away, so the
   wrap-up lecture's synthesis moves into Dec 2 (the last lecture) and Dec 7 is Quiz 6 plus a project
   session, both run by the TA. No re-sync time on return — budget a few minutes at the top of Nov 2
   and Nov 16.
7. **Almost no slack.** Contingency: fold the reservoir application into Lab 4 and compress the DP
   lecture. The applied MIP practice now sits in the Nov 11 lab (Lab 3).
8. **Stale fork**: `slides/lecture10-1-gaussian-plumes.qmd` duplicates the first half of
   `lecture10-1-capacity-expansion-2.qmd`. Resolve before editing either — the Nov 2 recomposition
   touches that material.
9. **Deck filenames encode FA25 lecture numbers** that no longer match; the `lecture09-1` split turns
   one file into two sessions two weeks apart.
10. **`project/index.qmd` links `update.qmd`, which does not exist.**
11. Syllabus promises 27 lectures; this calendar yields 28.
