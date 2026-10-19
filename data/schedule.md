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
| 6 | Mon Sep 28 | Monte Carlo: Applying It, Justifying It | `lecture06-1-monte-carlo-error` | Ready | |
| 6 | Wed Sep 30 | Gaussian Plumes: Deriving the Model | `lecture06-2-plume-derivation` | Ready | HW4 |
| 7 | Mon Oct 5 | Gaussian Plumes: Footprints and Flexibility | `lecture07-1-plume-analytics` | Revised Oct 2 — rebuilt around a permit's three questions (where and why, how much, over what area): stack height, the standard, area above it, grid sensitivity of peak vs area, superposition | **Quiz 2** |
| 7 | Wed Oct 7 | **Model Validation** | `lecture07-2-model-validation` | **Written** — ported from the FA25 validation section of `lecture05-1-dissolved-oxygen-2`, extended | — (HW5 held for Fall Break) |
| 8 | Mon Oct 12 | *No class — Fall Break* | | | |
| 8 | Wed Oct 14 | Decision Models and Linear Programming | `lecture08-2-optimization` (rewritten) | Drafted Oct 5; setup restored Oct 10 (a setup slide with the stacks, receptors, class F night and standard; a transmission-factor slide and worked example; a by-stack figure); c, A and b defined after the standard-form slide and written out for the plume LP after the conversion (Oct 10, two slides, which HW6 1.5 relies on); constraints renamed C1–C3 in place of receptor letters, and "Why a Corner?" replaced by a bare LP sketch to annotate, moved ahead of the feasible region (Oct 11) | HW5 |
| 9 | Mon Oct 19 | The Simplex Method and Shadow Prices | `lecture09-1-simplex-shadow-prices` (new) | Drafted Oct 5 — carries first JuMP; constraints renamed C1–C3 with $s_2$, $\lambda_2$, $\lambda_3$ to match (Oct 11); simplex steps now show the edge test $\nabla f \cdot \mathbf{d}$ at each corner (new slide "The Objective Along an Edge"), and the shadow-price section runs squared slack variables (new slide "Lagrange Multipliers Need Equalities") → Lagrangian → stationarity (new slide "Finding the Multipliers") → the two equations; the appendix Lagrange derivation is folded into that sequence; "What the Algorithm Tracks" cut, with its tableau link moved to Step 4; two slides added after "Reading the Shadow Prices" (units and marginal value; Wednesday's sketch LP with one constraint relaxed until it stops binding); the `JuMP` slides print `value.(removal)` and `objective_value`, the Lagrange sequence is done in Wednesday's standard form (maximize, ≤, slack added, $f$ and $g_j$ notation), so the multiplier reads directly as the shadow price, and "Reading the Duals" says the by-hand and `JuMP` signs differ because one maximizes −cost and the other minimizes cost (Oct 11; 35 slides) | |
| 9 | Wed Oct 21 | Project Proposal Peer Review | `activity-proposal-peer-review` + `project/proposal-review.qmd` | Drafted | HW6 · **Quiz 3** |
| 10 | Mon Oct 26 | **Lab: Linear Programming with JuMP** — *TA* | `labs/lab02` (`Fall26`, from FA25 `lab03`) | **Drafted Oct 8** — riverside power station in a heat wave; key and TA guide in `hw-solutions/lab02` | Lab 2 |
| 10 | Wed Oct 28 | Economic Dispatch — *sub (power systems expert)* | `lecture10-2-economic-dispatch` | **Drafted Oct 6** — sub-ready (full notes); keeps multi-period dispatch and the duck curve; adds JuMP shadow-price output, hourly prices, a twice-solar case; Oct 10: students write the ramping constraints before they are shown; Oct 11: the capacity shadow-price slide is cut (Quiz 4 Q2 (b)–(d) rewritten to match), ramp limits are for dispatchable plants only, a 600 MW nuclear unit is added and CT6–CT7 dropped, demand is raised 600 MW and shown as an illustrative fall day, and the high-solar case is three times the solar; Oct 12: gas plants priced at the 2022 U.S. gas price (\$7.21/MMBtu), so the single-hour price is \$87 and the day runs \$58–107, megawatts unchanged | MP2 assigned |
| 11 | Mon Nov 2 | Capacity Expansion | `lecture11-1-capacity-expansion` (new, from the capacity half of `lecture09-1` + `lecture10-1-capacity-expansion-2`) | **Drafted Oct 6** — screening curves; CO₂ cap and its shadow price; Oct 11: stepped through thermal types only (nuclear in place of geothermal), then wind and solar added with a worked example on a good site, then caps at 50%, 25% and 10% (\$148/t thermal only by hand, \$15/t with wind and solar); names brownfield in words for MP2; Oct 12: moved to 2022 fuel prices as the base (CCGT \$48, CT \$69, coal \$27; EIA coal cost; geothermal added), with a utilization column, the load duration curve filled by plant and net of wind and solar, the cap at \$94/t thermal only, and a new gas-price part (U.S. and European prices 2019–2026; the plan at \$3.50 and \$15, where coal or geothermal takes the base load); 32 slides | |
| 11 | Wed Nov 4 | Mixed Integer Programming | `lecture11-2-mixed-integer` (renamed from `lecture11-1`) | **Drafted Oct 6** — coded three-plant anchor; branch and bound trimmed | HW7 · **Quiz 4** |
| 12 | Mon Nov 9 | Solid Waste and Network Models — *sub* | `lecture12-1-waste-management` | **Drafted Oct 6** — sub-ready (full notes, no board work); moves to Wed if that is the only day the sub can come | |
| 12 | Wed Nov 11 | **Lab: Fixed Costs and Facility Siting in JuMP** — *TA* | `labs/lab03` (`Fall26`) | **Drafted Oct 8** — compost siting, four towns and three sites; key and TA guide in `hw-solutions/lab03`; siting MIP with the formulation given; works before or after the waste lecture, so it can swap to Mon | Lab 3 · HW8 |
| 13 | Mon Nov 16 | Stochastic Optimization and Scenario Trees | `lecture13-1-stochastic-optimization` | **Drafted Oct 6** — farmer corrected; tables from one JuMP cell | **Quiz 5** |
| 13 | Wed Nov 18 | Sequential Decisions and Dynamic Programming | `lecture13-2-dynamic-programming` (new) | **Drafted Oct 6** — reservoir anchor; Lab 4 builds on it | HW9 |
| 14 | Mon Nov 23 | **Lab: Scenario Trees and Sequential Decisions** | `labs/lab04` (`Fall26`, cloned) | **Drafted Oct 8** — four-month reservoir with wet/dry months, backward induction and a JuMP scenario tree; key and notes in `hw-solutions/lab04` | Lab 4 |
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
- **Quiz 3** — plumes and validation have **no exam precedent**; both need writing. *(Oct 12: Problem 1(b) reworded. It spoke of measurements and "the model that actually generated them" without saying the measurements were simulated; it now sets up the lecture's test, measurements simulated from known parameter values plus noise. A first rewording still asked whether the lower RMSE was evidence the calibrated values were correct, which the setup already answers, as the instructor pointed out. It is now two parts of one point each, at the instructor's request: 1(b) asks how the calibrated values can fit better than the correct ones, and 1(c) what that means for a low RMSE on real measurements. The key has a solution and a rubric line for each. Problem 2(a) asked whether an RMSE of 8% of the mean "fits acceptably", a standard the lecture never gave (its slides only called 15% "a decent fit"). Problem 2 is now three parts of one point each: what the residual pattern shows that the RMSE hides; whether the pattern is more consistent with noise or with an error in the model (the rubric takes "structural" or a wrong rate, as Homework 5's key does); and, replacing the judgment, what data would test the calibrated model's predictions (data it was not calibrated to). Three more changes the same day, all from the instructor's review: "in one sentence" came out of every part, in favour of one line at the top ("Each part can be answered in a sentence or two"); Problem 3 no longer says "image source", a name not used in lecture, and identifies the term by its form, exp(−(z+H)²/2σ_z²); and Problem 4 (the grid that is too coarse near the stack, and hazard against risk) was removed, with its two points moved to 1(a), now 2 points for the two halves of the difference, and to Problem 3, whose "name an assumption and say why it fails" became parts (b) and (c). The instructor then asked for a stability-class question on Problem 3 in place of 2(b) (noise or model error), so 2(b) is gone and 3(d) asks why the ground-level peak is much farther from the stack on a clear night (class F) than on a sunny afternoon (class B); for the lecture's stack the peaks are at 2.46 km and 0.30 km. Last, so that the TA grades one answer and not three, 3(b) and 3(c) changed scenario: a short release on a calm night broke three assumptions at once, and a ten-minute release under a steady wind breaks only steady state, which (b) asks for and (c) asks the reason for (the emission is not constant over the averaging period). 1(c) was then reworded at the instructor's suggestion, as a lab partner who insists on always selecting the model with the lowest RMSE; it is tied to (b) ("Use the result in (b)…") so that it has one answer and "the model" means the two models in (b). The quiz is 4 + 2 + 4 = 10 points: six on the Oct 7 validation lecture and four on the two plume lectures. The version with Problem 4 and the old 2(b) is kept in `quizzes/.drafts/2026-10-12-quiz03-with-problem4/`.)* *(Oct 18: Problem 2 replaced at the instructor's request. Its residual part repeated HW5 Problem 2.2 (due the day after the quiz) and its held-out-data part repeated 1(a)'s point, so validation had 6 of the 10 points and the plume analytics of Oct 5 none. Now (a) two facilities whose plumes add at a school, 120 + 106 = 226 µg/m³ against the 196 µg/m³ standard, with why they add; (b) a colleague matches the school's monitor (150 µg/m³) by switching the model from class F to class D: what would confirm the class (data it was not chosen to fit: other monitors, or observations of the night's stability). No part needs the plume formula, which the quiz does not give. For the lecture's 41 m stack, class D gives 0.52–0.86 of class F's ground-level concentration at 2–3 km, so the switch is realistic. The residual figure is gone; the quiz is still 4 + 2 + 4.)*
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
  the earlier candidate, was dropped Oct 6). *Drafted Oct 8:* screening curves for a greenfield gas
  fleet with a CO₂-cap permit decision, then soil-treatment siting (which constraints need a binary;
  built so the slide's "only capacities" rule gets two rows wrong) and branch-and-bound pruning on
  the same model. *Trimmed Oct 9:* the permit question (1(c)) was cut to fit 25 minutes and because it
  overlapped MP2; 1(a) is now 2 points. About 10 asks, an estimated 20–24 minutes including reading.
- **Quiz 6** — Pareto non-dominance has precedent (FA23: identify non-dominated policies from a
  4×3 reservoir table, ~5–8 min), pairing with an objective-vs-metric conceptual part. Scenario-tree
  and DP questions need writing. *Drafted Oct 8:* flood-barrier rental (VSS, a forecast worth less
  than its price), a fishery DP step, dominance among five wastewater nitrogen plans, and a
  known-answer check for a search. *Trimmed Oct 9:* the tree sketch (old 1(a)) and the
  sensitivity-range question (old 3(c)) were cut, with the VSS part and the dominance part now 2
  points each. 8 asks, an estimated 21–24 minutes including reading (about 26–29 before the cuts).
- ⚠️ **Do not reuse the full YUK formulate-a-model question** — at 16–25 points it consumed ~35 minutes
  of a 75-minute exam. "Decision variables with units and bounds" alone is a clean ~10-minute item.

---

## Homework and mini-projects

Weekly cadence; every homework pairs a by-hand component with a *light* computational one. Anything
needing scale — many effluents, real data, full capacity expansion — goes to a mini-project. Due
Thursdays 9pm. Nine homeworks total, inside the syllabus's 8–10, one dropped (on Oct 7 HW6 and HW7 were merged and HW9 was added).

**No simplex by hand** (decided Oct 11): no assessment asks students to carry out simplex steps (edge
tests, pivots, a tableau). The one exception allowed is a homework problem on a very small LP; never a
quiz, lab or mini-project. As of Oct 11 nothing asks for it: the by-hand LP work in HW6, HW7 and Quiz 4
is graphical (corners or level lines) on two-variable problems.

| HW | Assign | Due | Topic | By-hand | Computational (light) |
|:--|:--|:--|:--|:--|:--|
| 4 | Wed Sep 30 | Thu Oct 8 | Monte Carlo, uncertainty & risk | Expectation/variance of a function of a random variable; why MC error scales as σ/√n and the samples a target precision needs; exceedance probability and return periods; aleatory vs. epistemic | Propagate parameter uncertainty through the HW3 model; CI on one decision-relevant quantity plus an *n*-convergence plot |
| 5 | Wed Oct 14 | Thu Oct 22 | Gaussian plumes & model validation | Evaluate the plume equation at a receptor; stability class and wind speed effects; where the max ground-level concentration occurs; what a goodness-of-fit metric is blind to | Calibrate a plume's wind speed and stability class against monitors on a calm valley night, find that neither helps, and say which of the model's assumptions fail |
| 6 | Wed Oct 21 | Thu Oct 29 | Linear programs & shadow prices | Formulate a word problem with a blending constraint; standard form; read a 2-variable LP graphically; binding constraints, shadow prices with units, a buy-capacity decision, a zero shadow price | Solve the stormwater LP in JuMP, check its shadow prices against the hand answer, and re-solve a change too large for them; a six-source nitrogen LP with three load limits, too large to graph (which limits bind, and each source's shadow-price value against its cost explains the plan and predicts a re-solve) |
| 7 | Wed Nov 4 | Thu Nov 12 | Mixed integer programming | Model a fixed cost, an either/or, and an indicator with binaries; why the LP relaxation bounds; trace 2–3 branch-and-bound nodes | Solve a small MIP; compare to its LP relaxation |
| 8 | Wed Nov 11 | Thu Nov 19 | Network models & waste allocation | Set up a small facility-allocation network; flow-conservation and capacity constraints; siting indicators | Solve the instance; interpret which facilities open; a 12-hour combined-sewer storage LP (a storage balance across hours; moved from HW6 Oct 10) |
| 9 | Wed Nov 18 | Thu Dec 3 | Stochastic optimization & dynamic programming | A small two-stage problem: expected-value plan, recourse, VSS; backward induction by hand on a small sequential decision | A light check in code of one by-hand answer; outline in `data/hw09-outline.md` |

**Design notes.** HW4 deliberately echoes HW3, putting deterministic truncation error in Δt beside
statistical error in *n*. HW6's graphical-LP question matches Quiz 4's format so the homework is
real practice, and HW6 asks for the hand answer *before* the JuMP check. HW9 is the only homework
in weeks 13–16, which the term project otherwise fills: update (Nov 13), presentations (Dec 8),
report (Dec 20).

**HW9 added** (decided Oct 7). With eight homeworks, Quiz 6 (Dec 7) would have had no homework
behind it: scenario trees, DP, and multiple objectives and robustness rested on Lab 4 alone, which is
graded on effort. HW9 goes out Wed Nov 18 and is due Thu Dec 3, spanning Thanksgiving, so it is two
calendar weeks for about one week of work, and its key can be posted Fri Dec 4. It covers the Nov 16
and Nov 18 lectures only: Nov 30 is too close to the deadline. Keep it light, about one problem per
lecture, since it lands in the project crunch before the Dec 8 presentations; 4750 students can make
it their dropped homework (5750 students cannot drop one). Its examples must differ from both
lectures' and from Lab 4's.
Outline approved Oct 8 (`data/hw09-outline.md`, checks in `data/hw09-checks.jl`): activated carbon for an
algal-bloom season, and a three-year site cleanup with inhibited biodegradation. Drafted Oct 8 with
its key in `hw/hw09` and `hw/solutions/hw09` (local folders, no GitHub repos yet).

**HW6–HW9 split into single-ask subproblems** (decided Oct 14, done Oct 15). Every problem keeps its points; stacked asks became separate subproblems: HW6 now has 27, HW7 26, HW8 20 and HW9 20. Keys, READMEs and cross-references were renumbered to match (HW6 1.4 is now 1.5, 3.7 is now 3.10 to 3.12, and so on), including the Lab 2 TA guide. The pre-split versions are in `hw/.drafts/2026-10-15-hw06-09/`.

**HW5 held a week; HW6 and HW7 merged** (decided Oct 7). With Fall Break, HW5 was not handed out
Oct 7: it goes out Wed Oct 14 and is due Thu Oct 22. Students have it for a week, including a
weekend, before Quiz 3 (Oct 21), the same pattern as HW4 before Quiz 2. To keep one homework a week,
the two LP homeworks became one HW6 (Oct 21–29, 50 points): a new water-supply formulation with a
nitrate blending constraint and standard form (14), the graphical LP in Quiz 4's format (8), the
stormwater LP stated outright for binding constraints and shadow prices by hand (15), and the `JuMP`
check ending with the 4-acre lease (13). The formulation uses a different problem from the
shadow-price part so that stating the stormwater LP does not give Problem 1 away. Cut: the
LP-assumptions question, the rising-cost contrast, the regulator comparison, the 41-million-gallon
re-solve and the site-limit sweep. Later homeworks move down one: MIP is HW7, networks HW8. HW8 goes out Wed Nov 11 rather than on the Nov 9 lecture day, so that it opens a week after HW7, as every other homework does. The
Oct 5 drafts of HW6 and HW7 and their keys are kept in `hw/.drafts/2026-10-05/`.

**HW5 Problem 3 rebuilt around a setting where the plume model does not apply** (decided Oct 12).
The instructor found that HW5 leaned on reading residual patterns more than the Oct 7 lecture did (one
slide and one bullet there; Problem 2 and all of 3.2 here). Problem 3 (35) is now a smelter on a calm,
clear night in a narrow valley, with twelve monitors east and west of the stack and a consultant's
class F plume at 1 m/s. Students compute the RMSE (86% of the mean reading), calibrate the wind speed
(1.3 m/s, 85%), then calibrate the stability class with the wind refitted for each (best is class D,
72%), and see that the five monitors west of the stack get zero from every wind and class. They say
whether class F was the wrong choice (it was not: F is a clear calm night, D contradicts the weather),
and name two of the plume assumptions that fail (steady state, constant wind direction, wind over
along-wind dispersion, from the Sep 30 list). Points 6 / 9 / 10 / 10. The first draft also had students
compute a mass balance on the trapped air (2,500 µg/m³, RMSE 10% of the mean) to compare; the
instructor cut that part the same day and asked for the problem statement to define a temperature
inversion and say why it makes pollution build up, which it now does. The residual plot and its interpretation are gone from Problem 3;
Problem 2 (5) stays as the one residual question because Quiz 3 Problem 2 asks the same thing. The
readings come from the mass balance with 12% noise (`hw-solutions/hw05/data/make_receptors.jl`, seed
4750). The Oct 8 version (prompt, key and data) is kept in `hw/.drafts/2026-10-12-hw05/`. Its data were a
class E plume read as class F, so "calibrate the class and find E" would work on it if the simpler
variant is wanted.

**HW6 Problem 4 replaced** (decided Oct 9). Re-solving Problem 3's LP in `JuMP` repeated a problem
students had just done by hand, so the `JuMP` solve and the 4-acre lease moved into Problem 3 (3.6
and 3.7) and Problem 4 became a new, larger problem with a time index: a combined-sewer storage
tunnel over a 12-hour, two-burst storm (36 variables, a storage balance linking the hours). It asks
for the overflow plan and a storage plot, why the first flush is stored and the tunnel drained
between bursts, the tunnel's value as the sum of the hourly shadow prices (260 kg per thousand m³,
matching a re-solve; +10 thousand m³ saves 2,350 against an estimate of 2,600), and the plant's
hourly shadow prices. Points: 13 / 7 / 18 / 12. The time index is new to students (Lab 2 is a single
hour; multi-period dispatch comes Oct 28), so the skeleton says how to write hour 1's balance.

**The storage LP moves to HW8; HW6 Problem 4 becomes a nitrogen LP** (decided Oct 10). Against what
students have seen by Oct 21, the storage problem's syntax was a small step but its modelling a large
one: nothing before the Oct 28 dispatch lecture links one hour to the next. It moves to HW8 as Problem
3 (8), cut to the storage balance: formulate it, solve and plot, and explain why the plan stores the
first flush and drains the tunnel between bursts. Its tunnel-value and hourly-price parts are dropped,
because Mini-Project 2, due the same day, asks the same of the hydro budget and the hourly prices, and
its 10-unit re-solve repeated HW6 3.7 (now 3.10 to 3.12). HW8's network problems become 22 + 20: Problem 2.4 (predicting
the requirement at which the transfer station closes) is cut, Problem 1.5 (now 1.7 to 1.9) asks about Town A only, and
1.3 loses a point.
HW6's new Problem 4 (12) has too many decision variables to graph: six nitrogen sources (three farm
areas, three treatment plants) and load limits at an intake, a reservoir and an estuary, linked by
delivery ratios, the Oct 19 stacks-and-receptors structure in a new setting. The plan costs $10,040/day;
the reservoir and estuary limits bind ($5 and $10 per kg) and the intake is slack, met by cuts made
for the other two. Students weigh each source's value per kg removed (the shadow prices times its
delivery ratios) against its cost to explain the plan, in which the cheapest source per kg removed cuts
nothing and the most expensive cuts the most, and predict a re-solve exactly (10 kg/day more at the
coastal plant saves $20/day). Points 3 / 3 / 2 / 4. No homework practises a time index before Quiz 4
(Nov 4), so its ramping question gets two other supports: on Oct 28 students write the ramping
constraints themselves before the slide that shows them, and the Assessments slide points to MP2
Problem 1.1 (multi-period dispatch with ramping limits) as practice, to finish by Nov 3.

**MP2 Part 5 gains hydro and carbon capture** (decided Oct 12). The instructor asked for both as
things the state can build. Added plainly they break two of Part 5's three problems: hydro up to its
full technical potential meets the 2013 cap alone at \$17/t, so the "today" price comes out higher,
and capture at 2013 costs ties exactly with new combined cycle, so a tax at the cap's price lands
anywhere from 39 to 42 Mt. The setup that works: new hydro limited to 295 MW (Oak Ridge's 2012
estimate for New York's dams without turbines) with water in proportion to capacity, and combined
cycle with capture at \$39/MWh and 0.05 t/MWh, with EIA's 2013 and 2025 capital costs for both
(\$250,732 and \$604,000 per MW-yr for hydro; \$200,619 and \$215,000 for capture). Capture is a ninth
row of the fleet file with no capacity, so Parts 1–4 are unchanged (checked value by value against
the previous key). Answers: 5.1 still builds nothing; 5.2 (cap, 2013 costs) builds hydro 295, combined
cycle 369 and capture 241 MW at \$57.80/t, which is capture's extra cost over new combined cycle per
tonne avoided; 5.3 (today's costs) builds wind 2,741 and solar 1,645 MW at \$26.69/t, and carries
the tax comparison, which holds exactly there. Points 8 / 8 / 9. The 5.2 build does not move when
the capture, combined cycle or hydro cost is nudged by 2–10%. The prompt's data note says the 2013
capture cost was an estimate for a plant nobody had built, and that part of hydro's cost increase
is a change in EIA's reference plant. The Part 5 data-loading code is now a runnable cell in the
notebook (it had been inside a text cell).

**Two mini-projects, not three** (decided Sep 23), each worth 10% and scoped to a short report so it reads as a project rather than a heavier homework. MP1 runs four weeks because Fall Break and the proposal fall inside it; MP2 runs three, opening with the dispatch lecture it depends on. MP3 is dropped; the scenario-tree lab (Lab 4) stands on its own.

| MP | Assign | Due | Topic |
|:--|:--|:--|:--|
| 1 | Wed Sep 23 | Fri Oct 23 | **Simulating DO with multiple effluents** — three effluents and a tapered sludge bed; justify the spatial step, check four candidate treatment plans against the standard, propagate an uncertain load by Monte Carlo, and recommend a plan. Adds the sludge bed's share of the problem and one-step treatment upgrades. Four weeks at a 4-page report scope, so it runs lighter per week than a homework. Due date moved from Thu Oct 22 to Fri Oct 23 (decided Oct 14): changed in the Oct 14 and Oct 19 decks, the schedule page and the mini-project index; the released assignment and the earlier decks still say Oct 22 |
| 2 | Wed Oct 28 | Thu Nov 19 | **Electricity dispatch with a carbon tax** — multi-period economic dispatch of an existing fleet (NYISO-style demand and wind/solar capacity factors, ramping limits), hourly prices from the demand-constraint duals, and a carbon-tax sweep to find where coal and gas switch. Final part (after the Nov 2 lecture): add build decisions, impose a CO₂ cap, and show a tax at the cap's shadow price gives the same result. Pure LP. Reuses the FA25 `hw/hw04` data. Ramp limits revised Oct 12: thermal types only (none for hydro, wind or solar), at realistic hourly rates (nuclear 0.25; coal, steam and combined cycle 0.70; peakers 1). No ramp limit binds in the base year, so the tax sweep now steps exactly at the switching taxes; the key was rewritten to match |

---

## Build inventory

**New from scratch**
- ~~**Model validation** lecture (Oct 7)~~ — **written**. It was never a from-scratch build: the FA25 deck `lecture05-1-dissolved-oxygen-2.qmd` carries a full calibration-and-validation section (Oreskes framing, RMSE, nonuniqueness, positive and negative controls, empirical vs. face validity) that had not been ported forward.
- ~~**Sequential decisions & dynamic programming** lecture (Nov 18)~~ — drafted Oct 6 (`lecture13-2-dynamic-programming`)
- ~~**Dec 7 project-session activity deck**~~ — drafted Oct 6 (`activity-project-session`; TA-run, after the TA-proctored Quiz 6): logistics, the four-question
  "your project through the course's checks" activity that drafts the report's Discussion paragraph, and
  supervised work time; about 6 slides with full notes for the TA
- ~~**Lab 3**, fixed costs and facility siting in JuMP (Nov 11)~~ — drafted Oct 8 with key and TA
  guide. The linking constraint is per site, $\sum_i x_{ij} \leq C_j y_j$: the per-shipment form
  $x_{ij} \leq C_j y_j$ in the Oct 6 plan does not cap a site's total and gives the wrong plan here.
- ~~**Lab 4**, scenario trees + sequential decisions / reservoir operations (Nov 23)~~ — drafted Oct 8
- ~~**Lab 2**, JuMP lab re-themed to power systems (Oct 26)~~ — drafted Oct 8 with key and TA guide
- ~~Quiz questions for plumes, validation, MIP, networks, scenario trees, DP~~ — Quiz 3 drafted Oct 5;
  Quizzes 5 and 6 drafted Oct 8 (`quizzes/quiz05`, `quizzes/quiz06`, local `Fall26` repos, no remote)
- ~~HW7 (MIP) and HW8 (networks)~~ — drafted Oct 8 (`hw/hw07`, `hw/hw08` and keys; local `Fall26`
  repos, no remote). HW7: nitrogen upgrades at a wastewater plant (fixed costs, a site either/or,
  methanol only with anoxic zones), plus a three-node branch and bound on a UV-reactor purchase. HW8:
  three towns, a candidate transfer station and MRF, and a 20% recycling requirement; a 30% requirement
  closes the transfer station (switch at 25%). Each key folder holds its robustness script.
- **Every homework from HW4 on**, and both mini-projects (MP1 is drafted in `mini-project/mp01`; MP2 is drafted in `mini-project/mp02` with its key in `mini-project/solutions/mp02`, both on uncommitted `Fall26` branches)

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
  (The two were merged into one HW6 on Oct 7; see the homework section.)
  The B–C corner holds for cost ratios c₂/c₁ between about 1.27 and 9.2; the contrast needs
  1.24–1.73, which is why the costs are 20 and 30.
  `lecture07-1-prescriptive-modeling.qmd` and the `crud-*` figures are now unused.
- **HW6, HW7, and Quiz 4 drafted (Oct 5)**, with keys (HW6 and HW7 merged Oct 7); new local folders `hw/hw06`, `hw/hw07`,
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
  consolidation, while Quiz 3 Problem 2 and HW5 3.2 assess it (since Oct 12, HW5 Problem 2 in place of 3.2). It is back as an in-sample slide,
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
   *Resolved Oct 8:* FA26 Lab N lives in repo `labN` on a `Fall26` branch, so the JuMP lab replaced the
   Monte Carlo lab in `lab02`, siting replaced the JuMP lab in `lab03`, and `lab04` was cloned.
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
