# Lecture outlines, Oct 28 – Dec 7 (drafted Oct 6, for review)

Nine lecture sessions remain after the Oct 21 peer review; the two TA labs (Lab 3, Nov 11; Lab 4, Nov 23) are separate builds. Each outline follows the lecture-outline procedure: source decks measured, takeaways first, minutes summed to the session, anchor examples **computed** (scripts in `slides/.handoff/outlines-2026-10-06/scripts/`, Julia 1.11.5, slides environment), and a cut list. Decks get built only after these are approved.

## At a glance

| Date | Session (Lecture) | Minutes | Who | Source → deck file | Slides | Anchor |
|:--|:--|--:|:--|:--|--:|:--|
| Wed Oct 28 | Economic Dispatch (15) | 75 | Sub (power systems) | `lecture10-2-economic-dispatch` (revise) | ~32 | 13-unit dispatch at 1600 MW: price $38/MWh = −shadow price; NYISO day with hourly prices; 2× solar: midday $0, dusk $45 |
| Mon Nov 2 | Capacity Expansion (16) | 75 | Instructor | 09-1 capacity half + `10-1-capacity-expansion-2` → `lecture11-1-capacity-expansion` | ~30 | Screening crossovers (1700 h, 7.25 h) reproduce the LP build; CO₂ cap shadow price $39.3/t by hand |
| Wed Nov 4 | Mixed Integer Programming (17) | 50 (Quiz 4) | Instructor | `lecture11-1-mixed-integer` → `lecture11-2-mixed-integer` | ~21 | Three plants with fixed costs: at 150 MW the CCGT beats cheaper coal; switch at 200 MW; LP relaxation 12.7% below |
| Mon Nov 9 | Waste and Network Models (18) | 75 | Sub (general) | `lecture12-1-waste-management` (sub-ready) | ~29 | Deck's own 2-city, 3-facility network (\$26,881/day, all open); landfill 220 Mg/day → WTE closes |
| Mon Nov 16 | Stochastic Optimization (19) | 50 (Quiz 5) | Instructor | `lecture13-1-stochastic-optimization` | ~21 | Farmer, corrected: VSS \$1,150, EVPI \$7,016 |
| Wed Nov 18 | Sequential Decisions and DP (20) | 75 | Instructor | **new** → `lecture13-2-dynamic-programming` | ~24 | 3-month, 5-level reservoir: DP 30 vs greedy 25; uncertain inflows 28.25 = scenario tree |
| Mon Nov 30 | Multiple Objectives, Robustness, Sensitivity (21) | 75 | Instructor | 13-2 MOO half + `14-1-sensitivity-analysis` → `lecture15-1-multiple-objectives-robustness` | ~30 | Lake, 441 two-period plans: 20 non-dominated; robustness 0.47 / 0.59 / 0.92 |
| Wed Dec 2 | Limits of Optimization and Course Synthesis (22) | 75 | Instructor | 13-2 limits half + `15-2-simulation-optimization` + the wrap-up's synthesis → `lecture15-2-limits-of-optimization` | ~31 | Lake sim-opt: one constant release (0.0345) beats the 100-variable search; then the Oct 14 emissions LP under classes F/D/B and the whole-arc tables |
| Mon Dec 7 | Quiz 6 and project session (activity) | 75 | **TA** (instructor travelling) | **new** activity deck → `activity-project-session` | ~6 | Quiz 6 (25 min), then "your project through the course's checks" and work time |

Lecture numbers count from Lecture 14 (Oct 19); the Oct 21 peer review and the Dec 7 project session are unnumbered activities, and labs skip numbering. **Revised Oct 6:** the instructor is also travelling Dec 7, so the wrap-up lecture's synthesis moves into Dec 2 and Dec 7 becomes a TA-run project session. **Revised Oct 7:** a pass over all nine decks for writing artifacts (count formulas, coined aphorisms, colon reveals, default colon titles) and for figures smaller than their slides allow; every slide re-checked for overflow; all code brought to the course's code rules (no ternaries, closures, short-circuit control flow or comprehension tricks, in hidden and folded cells too; computed results unchanged); the branch-and-bound tree is now drawn from the node solutions.

## Decisions for you (recommendation in each)

Reply with the numbers you'd change; the rest go ahead as recommended.

**Oct 28 — Economic Dispatch (sub)**
1. Show JuMP's shadow prices: single-period model with `= demand` and named capacity constraints, plus one output slide (demand −38; hydro −38 … CCGT4 −2; off plants 0). Quiz 4 Q2 reads exactly this; the deck never prints a shadow price now, and its sign slide reasons backwards.
2. Replace the "ramping costs \$323 (0.04%)" slide with hourly prices from the load duals and a twice-solar case (midday \$0, dusk \$45; holds from 2× to 4× solar). Claim that solar and ramping reshape *prices*, not total cost (under 1% even at 3× solar).
3. A carbon price appears only as one bullet that reorders the merit order; MP2's carbon-tax sweep is the students' job.
4. Use the local EIA duck-curve image (the quiz's copy); convert to FA26 style.

**Nov 2 — Capacity Expansion**
5. Add screening curves and read the LP's build off the load-duration curve: CT beats CCGT under 1700 h, not serving beats CT under 7.25 h → CCGT 2017 MW, CT 733 MW, 31 MW unserved for 7 hours. Answers the deck's own unanswered "why any unserved energy?".
6. Add a CO₂ cap and its shadow price (−\$39.29/t, derivable by hand from geothermal replacing CCGT), **but don't demo the tax equivalence**: on this thermal-only data a tax at the shadow price gives 2229 kt, not the capped 5009 kt (flat, degenerate abatement). It does work on MP2's data (1.5 Mt cap → \$182.77/t → 1.503 Mt), so MP2's key should say "matches within a few kt", not "identical".
7. Keep renewables conceptual (the capacity-factor constraint and its JuMP pattern); a renewable LP run would pre-solve MP2.
8. Move the power-system overview slides to Oct 28, the first power-systems session.
9. Archive `slides/lecture10-1-gaussian-plumes.qmd`: its first 271 lines are `capacity-expansion-2` with a different title; the rest is the superseded FA25 plume lecture.

**Nov 4 — MIP (after Quiz 4)**
10. Add an applied, coded anchor: three plants with min/max output and fixed costs, `Bin` variables, linking constraints y ≤ Pmax·u and y ≥ Pmin·u. At 150 MW the CCGT alone (\$5,500) beats cheaper-per-MWh coal (\$6,000); the switch is 200 MW by hand; `relax_integrality` gives coal "60% on" at \$4,800 (12.7% gap). The Nov 11 lab and HW8 both assume students have seen this once.
11. Trim branch and bound from 17 slides to nodes 1–3 plus the final annotated tree; nodes 4–9 to the appendix. HW8 traces only 2–3 nodes; every node value checked.
12. State the relaxation bound for both senses (the example maximizes; the lab and HW8 minimize).

**Nov 9 — Waste and Network Models (sub)**
13. Solve the model in the deck (folded JuMP) and add one what-if: a 220 Mg/day landfill closes the WTE (\$24,539/day). As given, **no binary ever changes** in the example (the WTE is open because the landfill is full), so it can't show "which facilities open" without it.
14. Make the capacity-linking constraint (flow into j ≤ K_j·Y_j) the main on/off formulation; move the piecewise Y definition, JuMP `=>` syntax and big-M to the appendix. This also removes the deck's three index errors (LF fixed cost on Y₂; MRF commitment on W₂₁ + W₂₂; big-M pairing).
15. Drop the forced Y₃ = 1 (it changes nothing), and give the sub no board work: every board item is a slide with its answer as a fragment; full speaker notes and a one-page sub sheet.

**Nov 16 — Stochastic Optimization (after Quiz 5)**
16. Keep the farmer example, corrected (the mean-value plan's bad year is \$55,120, not \$56,800; EVPI \$7,016; "500 ha" → acres; "\$40 more" → 40% more), with every table generated from one folded JuMP cell.
17. Fill the empty "Motivating Example" slide with a reservoir release decided before the inflow is known, which leads straight into Nov 18 and Lab 4.

**Nov 18 — Dynamic Programming (new)**
18. Anchor on a 3-month, 5-level reservoir (release before inflow; benefits 0/6/10/12/13): greedy earns 25, DP's 2-2-2 earns 30 (unique by brute force; unchanged on finer grids); with inflow 0 or 2 the DP value 28.25 equals the scenario-tree enumeration while the tree grows to 4,096 leaves at 12 months. The lake stays as a "where else" slide.
19. Lab 4 (Nov 23) builds on this exact model and code (longer horizon, inflow scenarios), so there is one vocabulary.
20. Terminal value 0 by default, with a trap slide: valuing carry-over water at 6 per unit flips the plan to 1-1-0, ending full.

**Nov 30 — Multiple Objectives, Robustness, Sensitivity**
21. Lake inflow variability σ = 0.5 (median 0.03), also on Dec 2. At FA25's σ = 0.25 the "front" is a cliff with 6 plans; at 0.5 there are 20 non-dominated plans and timing alone moves reliability from 0.00 to 0.92 at the same total release.
22. Robustness = share of 500 plausible lakes with reliability ≥ 0.9 (satisficing): aggressive 0.47, cautious 0.59, zero release 0.92. Regret goes in the notes as the other position.
23. Morris and Sobol' become a reading (Reed et al. 2022 ch. 3; Saltelli et al. 2019), with no formulas on slides (14-1's formulas are wrong anyway).
24. Replace 13-2's lake tradeoff scatter: its y-axis says probability of eutrophication but it plots mean concentration, and the actual probability is 0 for all 100 plans. The dominance definition is also corrected ("at least as good on all, strictly better on one").

**Dec 2 — Limits of Optimization and Course Synthesis**
25. Show FA25's sign bug as a "known-answer check" slide: asked to *minimize* release (true answer 0), the search still returns 0.036–0.038 after 10,000 runs. It repeats Oct 7's controls lesson in the optimization half.
26. One "drawbacks" meme slide instead of three, and cut the emergence slide and the separate bifurcation/feedback recalls, to make room for the synthesis.
27. The last 24 minutes become the course synthesis: Ackoff's "optimal for the model, not the problem" made concrete by the Oct 14 emissions LP re-solved under stability classes F, D and B (removals, cost and *which receptors bind* all change; class D's plan on a class F night leaves all three receptors above 196 µg/m³), then the two "whole arc" tables and your closing "Content"/"Themes" slides. The lake traced through the term is dropped (one line in the notes).

**Dec 7 — Quiz 6 and project session (TA)**
28. **Decided (Oct 6): Quiz 6 stays on Dec 7, proctored by the TA**, then a project session: a 15-minute activity, "your project through the course's checks" (drafts the report's required Discussion paragraph), and 30 minutes of supervised work time on the videos (due Dec 8) and reports (due Dec 20). This breaks the schedule's "no quiz in a travel week" rule, but it hosts the quiz on an activity session (the rule used for every other quiz) and keeps Quiz 6's coverage. *Alternatives:* move Quiz 6 to Dec 2 (it would lose Nov 30 and Dec 2, its own week, and cut 25 minutes from the fullest session), or drop it (5 quizzes; scenario trees, DP, multiple objectives and limits go unassessed).
29. Course evaluations, if open, take 5 minutes of the Dec 7 work time (the TA can run them).

**Across sessions**
30. File names follow week and session: `lecture11-1-capacity-expansion` (new), `lecture11-2-mixed-integer` (renamed, with its `_freeze` directory), `lecture13-2-dynamic-programming`, `lecture15-1-multiple-objectives-robustness`, `lecture15-2-limits-of-optimization`, and `activity-project-session` for Dec 7 (next to `activity-proposal-peer-review`). The superseded FA25 sources stay unlinked as last year's record, except the plume fork (decision 9).
31. Bibliography: add Reed et al. (2022) and Saltelli et al. (2019) if cited; remove the duplicate `Quinn2017-vn`.
32. **Done (Oct 6):** `data/schedule.md` updated: Dec 7 becomes a TA session (Quiz 6 + project session), Dec 2 is renamed, the travel note gains Dec 7, and the build inventory swaps the wrap-up lecture for the small activity deck.

## Errors found in the source decks (all re-derived)

- **10-2 dispatch:** sign slide reasons backwards; stray "∀g" on the demand constraint; "5 CCGT" (there are 4); "\$\$/MW" axis; ≥ vs = demand mixed; ramping over all t instead of t = 1…T−1; unused `NSECost`; never shows a shadow price; review recaps capacity expansion, which now comes later.
- **09-1 / 10-1 capacity expansion:** stray "×" in the objective; cost units (\$/MW-yr, \$/MWh); arbitrary peak/shoulder/base lines; stale takeaways and schedule.
- **11-1 MIP:** every branch-and-bound value is right; "upper bound" stated only for maximization; no coded MIP; stale numbering and schedule.
- **12-1 waste:** three index errors; residual inflows missing from two constraints; optimum \$26,881/day, not \$26,879; no speaker notes; FA24 "Exam Review" and schedule.
- **13-1 stochastic:** \$56,800 should be \$55,120; EVPI rounding; ha vs acre; "\$40 more" vs 40% more; empty motivating slide.
- **13-2 MOO/limits:** mislabelled tradeoff figure (probability vs mean concentration); dominance definition wrong in two ways; `push!` in the Pareto code.
- **14-1 sensitivity:** Sobol' formulas wrong; mislabelled total-order panel (log axis with a lower limit of 0, +0.01 on every bar); a root finder that lands on the wrong root at 1 of 121 points; the shadow-price slide uses FA25's product-mix LP.
- **15-2 simulation-optimization:** the code minimizes mean release while the slide says maximize; the setup slide swaps q and b and misstates the lognormal; the "finite horizon" claim isn't visible in its own solution; the known answer of the quick example (2.117) is never used.

---

# Outline — Wed Oct 28: Economic Dispatch (Lecture 15)

## 1. Header

- **Date:** Wed Oct 28, 2026. 75 minutes, no quiz.
- **Who:** a substitute (power-systems expert). The instructor is away in week 10; the TA runs Lab 2 (JuMP) on Mon Oct 26.
- **Source:** `slides/lecture10-2-economic-dispatch.qmd`. FA25 content with the date, Next Classes and Assessments already updated for FA26 on Sep 23.
- **Status:** Revise. Keep multi-period dispatch and the renewables/duck-curve material.
- **Assessments:** MP2 is assigned today, and Quiz 4 (Nov 4) assesses this session.

## 2. Measurement of the source

- **Size:** 36 headers with code fences stripped: 6 section titles and 30 content slides. With the title and Overview slides that is about 38 slides, above the house rate of about 31 per 75 minutes.
- **Code:** 12 cells, all figure or model code, folded.
- **Reusable:**
  - power-system schematic, and decision problems by timescale (the instructor's motivation);
  - the ED problem statement and the variable-cost and heat-rate notes;
  - data and results bar chart, dispatch stack, ramping formulation, generator ramp data, demand and capacity-factor figures, the multi-period model and areaplots;
  - the duck-curve slide, and Next Classes / Assessments.
- **Stale or wrong** (checked by running the deck's own model, `scripts/dispatch_check.jl` and `scripts/multi_check.jl`):
  1. The single-period demand constraint carries "∀ g ∈ 𝒢" (it is one constraint, not one per generator).
  2. "Shadow Prices Signs" says relaxing the demand constraint means *increasing* demand. That is backwards: increasing demand tightens a ≥ (or =) demand constraint. The sign it concludes (negative) is right. Reword it to lecture 09-1's corrected convention: `shadow_price` is the change in the objective when the constraint is relaxed by one unit.
  3. The data slide says "5 natural gas CCGT"; `generators.csv` has 4 CCGTs and 7 CTs.
  4. The supply-curve y-axis reads "Marginal Cost ($$/MW)": a doubled `$`, and the unit should be $/MWh.
  5. The review slide recaps "Generating capacity expansion" as a past class. In FA26, capacity expansion comes *after* this session (Nov 2).
  6. The formulations disagree: the single-period model and the first multi-period formulation use ≥ demand, while the renewables formulation and its code use = demand. Ramping is written ∀ t ∈ 𝒯, but holds only for t = 1…T−1.
  7. `NSECost = 9000` is defined and never used.
  8. **The deck never shows a JuMP shadow price.** The price comes from the merit-order function, and capacity limits are variable bounds, so their shadow prices are never reported. Quiz 4 Q2 reads exactly that output.
  9. The "Impact of Ramping Constraints" slide reports ramping costing **$323 on the day, 0.04%** (verified). That is a weak demonstration of its own claim.
  10. The duck curve is a remote EIA URL. Quiz 4 uses a local copy (`quizzes/quiz04/figures/duck_curve.png`), the same EIA figure.
  11. The style is not FA26's: Computer Modern, `mk_15` palette, linewidth 2. FA26 decks use Palatino, the `cb_*` Okabe-Ito palette and linewidth 3.
  12. The takeaways never mention prices or shadow prices.
  13. Assessments don't mention Quiz 4 (Wed Nov 4).
- **Numbers verified** (`scripts/dispatch_check.jl`):
  - At 1600 MW the dispatch costs $35,034/h and CT1 is marginal at **$38/MWh**. `shadow_price(demand) = −38` with either ≥ or =.
  - Capacity shadow prices with named constraints: hydro −38, biomass −33, CCGT3 −16, CCGT1 −15, CCGT2 −8, CCGT4 −2, CT1 0 (marginal), CT5–7 0 (off).
  - CT2–CT4 sit at their minimum output with cost above the price. Their **minimum-generation shadow prices are −1, −1, −2**: must-run minimums cost money.
  - The price rises with demand: $22 at 1000 MW, $23 at 1200–1400, $38 at 1600, $45 at 1800.

## 3. Takeaways (claims)

1. Economic dispatch runs the plants that already exist at least cost. Without other constraints that is the merit order: cheapest marginal cost first.
2. **The electricity price is the demand constraint's shadow price.** It is the marginal cost of the plant that would serve one more MWh: $38/MWh at 1600 MW. JuMP reports −38, the change from *relaxing* the demand constraint.
3. A full plant's capacity is worth its price minus its own marginal cost per MW (hydro $38, CCGT4 $2). A plant that isn't running, or isn't at its limit, has a zero capacity shadow price.
4. Engineering limits break the simple merit order. Minimum outputs force uneconomic generation, and ramping limits, y_{t+1} − y_t ≤ R and y_t − y_{t+1} ≤ R, couple the hours together.
5. Solar reshapes *when* other plants are needed. Net load falls at midday and climbs steeply at dusk (the duck curve), so midday prices collapse while dusk needs fast-ramping, expensive plants.

## 4. What it feeds and what assesses it

- **Quiz 4 (Nov 4):**
  - Q2 reads a JuMP dispatch output: the price from the demand shadow price, why capacity shadow prices are price minus own cost, and a zero shadow price for a plant that isn't running.
  - Q3a asks for both ramping constraints; Q3b asks about the EIA duck curve.
  - The deck must teach each of these explicitly, in words matching 09-1's sign convention. No quiz asides on slides or in notes; the notes are visible in the published deck.
- **MP2** (assigned today, due Nov 19): multi-period dispatch of an existing fleet with ramping limits, hourly prices from demand duals, and a carbon-tax sweep. It uses FA25 HW4 data, different from this deck's (2020 Zone C, 13 thermal units plus wind and solar), so the deck doesn't pre-solve it. The carbon-tax sweep is MP2's core, so the deck mentions a carbon price only as one thing that reorders the merit order, with no computation.
- **Nov 2 (capacity expansion)** builds on "price = demand dual" and moves the power-system overview here; it doesn't repeat it.

## 5. Section table (75 minutes; computed sum 75)

| Min | Section and content | Takeaway | Moves | Board or slide |
|--:|:--|:--|:--|:--|
| 4 | **Review and Questions**: one slide, "A shadow price is the change in the objective when a constraint is relaxed by one unit" (09-1's wording); then the poll | sets up 2 | review carries only what this session uses | slide |
| 6 | **Power systems decision problems**: schematic; decisions by timescale | context | motivation first (instructor's slides, kept) | slide |
| 12 | **Single-period ED**: the problem; variables; variable costs and heat rate (two notes merged to one); formulation (fixed: no ∀g, = demand, named capacity constraints); data (fixed: 4 CCGTs) | 1 | small named steps | slide; formulation as a board item (prompt slide, result fragment, working in notes) |
| 16 | **Results and prices**: dispatch bar chart; dispatch stack; **new** JuMP output slide (`shadow_price(demand)` = −38 and a capacity shadow-price table); "Why −38?" (relaxing = serving 1 MWh less); "Why is hydro's −38 and CCGT4's −2?"; must-run minimums (−1, −2 fragment); "What complicates the merit order?" (minimums, ramping, fuel and carbon prices, network) | 2, 3, 4 | concrete number ($38); interpretation after the result; a named trap (the sign) | price and hydro's shadow price from the stack: board item (prompt, result fragment, notes); stack annotation on a tablet |
| 22 | **Multi-period dispatch**: ramping constraints, both directions, with the "t = 1…T−1" fix; generator ramp data; demand (Oct 16, 2020, NYISO Zone C, 1326–1822 MW); capacity factors; formulation with renewables; results areaplot by resource; **new** hourly prices from the load duals ($23 most hours, $36–39 in the morning, $45 at the evening peak) | 4 | do it once in code; interpretation slide | slide |
| 10 | **The duck curve**: (a) ramping raises the price in the dusk hour ($45 with ramp limits against $40 without, hour 19); (b) **new** with twice the solar (1000 MW), midday prices fall to $0 (solar curtailed against must-run minimums) while dusk stays at $45; (c) the EIA figure (local copy) | 5 | a number that anchors memory; self-questioning ("who supplies the 7 pm ramp?") | figure annotation on a tablet |
| 5 | **Takeaways, Next Classes, Assessments** (add Quiz 4) | — | — | slide |

**Slide target: about 32** (38 now). Remove the duplicate variable-cost note, merge "Combining Generator Types" into the results slide, and drop the $323 slide. Add three: the JuMP output, hourly prices, and twice the solar. About 32 is slightly above the house rate, which suits a substitute-taught deck that needs cue slides more than a lean one.

## 6. Anchor example (computed)

- **Single period:** the deck's 13 thermal units at 1600 MW (`scripts/dispatch_check.jl`).
  - Price $38/MWh from CT1; cost $35,034/h.
  - Capacity shadow prices as listed in §2, equal to $38 minus each unit's own cost.
  - Robustness: the price is a step function of demand. It is $38 from about 1586 to 1613 MW (CT1's range above its minimum), then $39 (CT2/CT3). Every quoted number is computed in a slide cell, so it follows if the demand changes.
- **Multi-period:** Oct 16, 2020 (`scripts/multi_check.jl`). Ramping adds $323 (0.04%) to the day and moves the hour-19 price from $40 to $45; all other hours are unchanged.
- **Solar sweep:**

  | Solar | Midday price | Dusk price | Ramping cost |
  |:--|:--|:--|:--|
  | ×1 (500 MW) | $23 | $45 | 0.04% |
  | ×2 (1000 MW) | $0 | $45 | 0.06% |
  | ×3 (1500 MW) | $0 | $45 | 0.76% |
  | ×4 (2000 MW) | $0 | $45 | 0.56% |

  The price swing holds for every scaling of two or more. The cost of ramping limits stays below 1% throughout, because CTs ramp 100% in an hour and there is plenty of CT capacity. **So the deck should claim ramping and solar reshape hourly prices, not that they add much to total cost.**

## 7. Code level

- Everything is handed over; students don't write code here (Lab 2 on Oct 26 and HW7 did that).
- The new shadow-price cell is code-first on its slide, with output below. It names the constraints:
  ```julia
  @constraint(single_ed, load, sum(y) == d)
  @constraint(single_ed, capacity[g in G], y[g] <= gens[g, :Pmax])
  ```
  and prints `shadow_price.(capacity)` as a table.
- Figure code stays folded; setup cells are hidden.
- Pre-allocate the hourly-price vector (`prices = zeros(length(T))`, filled by index).
- No decimals on whole numbers in literals.
- Convert to the FA26 style (Palatino, `cb_*` palette, linewidth 3) and use the local duck-curve image.

## 8. Checks for understanding

- "Which plant sets the price at 1600 MW, and how do you know from the output?"
- "Hydro's capacity shadow price is −38 and CCGT4's is −2. Why?"
- "Write the constraint that stops a plant ramping *down* too fast."

## 9. Appendix candidates

- The quadratic heat-rate cost curve and its piecewise-linear approximation (the "Note on Variable Costs" figure).
- Prices at other demand levels (the step-function table).

## 10. Cut list (in order)

1. The twice-solar scenario (keep the EIA figure alone).
2. The must-run minimum shadow prices (fragment).
3. "Combining Generator Types" (a resource-level areaplot).
4. The heat-rate note.

## 11. What the substitute needs

- Full speaker notes on every slide, with the answer to every question posed (merit-order complications, why −38, why hydro −38 and CCGT4 −2).
- A timing cue in each section's first slide's notes ("you should be here by minute 22").
- An "if short" list: the cut list above, in order.
- One sentence on the sign convention to say aloud: "JuMP reports what relaxing the constraint by one unit does to the cost. For demand, that means serving one less MWh, so the sign is negative."
- Don't assign anything beyond MP2. Remind students about Quiz 4 on Wednesday (Assessments slide).

## 12. Decisions for the instructor (recommendation first)

1. **Show JuMP's shadow prices, not just the merit-order calculation.** Switch the single-period model to "= demand" with named capacity constraints, and add one output slide. *Evidence:* Quiz 4 Q2 reads that exact output, and the current deck never prints a shadow price and reasons backwards about its sign.
2. **Replace the "$323" slide with hourly prices and a twice-solar case.** *Evidence:* ramping is 0.04% of the day's cost, and under 1% even at three times the solar. The midday $0 against dusk $45 price swing is large and robust from twice the solar up.
3. **Mention a carbon price only as a merit-order shifter (one bullet), with no calculation.** *Evidence:* MP2's carbon-tax sweep is the student's job.
4. **Use the local EIA duck-curve image** (the copy in `quizzes/quiz04/figures`). *Evidence:* the same figure as the quiz, and it doesn't depend on a remote URL during a substitute's session.
5. Convert the style to FA26 (mechanical, no content change).

---

# Outline — Mon Nov 2: Capacity Expansion (Lecture 16)

## 1. Header

- **Date:** Mon Nov 2, 2026. 75 minutes, no quiz.
- **Who:** the instructor, back from week 10. Budget 2 minutes of re-sync.
- **Sources:**
  - `slides/lecture09-1-capacity-expansion.qmd`, capacity half only (from "Electric Power System Decision Problems" to the end). Its shadow-price half became `lecture09-1-simplex-shadow-prices`.
  - `slides/lecture10-1-capacity-expansion-2.qmd`.
- **Stale fork:** `slides/lecture10-1-gaussian-plumes.qmd` is **`capacity-expansion-2` plus the FA25 plume lecture**. Its first 271 lines differ from `capacity-expansion-2` only in the title; the plume half is superseded by FA26's `lecture06-2` and `lecture07-1`. Treat `capacity-expansion-2` as the source, and archive or delete the fork (open item 8).
- **Status:** Revise — compress two decks into one. The new file would be `lecture11-1-capacity-expansion` (week 11, Monday).

## 2. Measurement of the sources

- **09-1, capacity half:** about 20 slides, 4 code cells. It covers the power-system overview (3 slides; FA26 now gives these on Oct 28), plant types, generators, demand, load-duration curve (2), goal and unserved energy, variables, objective, constraints, formulation, "it's an LP", and the JuMP model.
- **`capacity-expansion-2`:** 17 content slides, 7 code cells. About half duplicates 09-1: the formulation, the generator and demand data, and the JuMP model. New material: the results table, "When Might Generators Operate?", unserved-energy hours, "What Does This Problem Neglect?", renewables and capacity factors (3), and a JuMP vector-constraint snippet.
- **Combined and deduplicated:** about 26 content slides before the additions below.
- **Stale or wrong:**
  1. The objective has a stray "×" ("∑ × FixedCost_g x_g").
  2. The units are wrong. The generator table says "Fixed Cost ($)" and "Variable Cost ($/MW)". It should be $/MW-yr (annualised) and $/MWh.
  3. The load-duration-curve "Peak / Shoulder / Base" lines sit at arbitrary heights (2400 and 1500 MW) instead of at the crossovers the costs imply (below).
  4. "Why do we think there is any NSE given the high NSE Cost?" is posed but never answered.
  5. The takeaways cite "renewables (HW4)" from FA25; Next Classes ("Economic Dispatch", "Managing Air Pollution") and Assessments (HW3, proposal) are from FA24/FA25.
  6. The results table appends the unserved-energy row with `push!`. That is fine for a DataFrame row, but building the table in one call matches the pre-allocation habit.
  7. The style is not FA26's (Computer Modern, `seaborn_colorblind`/`mk_15`).
  8. There is no CO₂ constraint, which MP2's final part needs.
- **Verified** (`scripts/capexp_check.jl`, `scripts/screening.jl`): 2020 NYISO Zone C, 8784 hours, peak 2781 MW, unserved energy at $9000/MWh, thermal plants only. The base build is:
  - CCGT 2017 MW, 98.1% of the energy;
  - CT 733 MW, 1.9% of the energy;
  - no coal and no geothermal;
  - unserved energy in 7 hours, 94 MWh in total;
  - cost $603M per year.

## 3. Takeaways (claims)

1. Capacity expansion decides what to build (x_g) and how to run it every hour (y_{g,t}) together, minimising investment cost plus operating cost while meeting demand.
2. **The LP's build can be read off the load-duration curve.** Each technology costs FixedCost + VarCost·h per MW for h hours of running, and the cost crossovers set the hour thresholds:
   - CT beats CCGT for loads lasting under **1700 hours**;
   - not serving beats a CT for loads lasting under **7.25 hours**;
   - coal never beats CCGT (its crossover is at 34,500 hours, more than a year).
   
   So CCGT = 2017 MW (the curve at 1700 h), CT = 733 MW, and the top 31 MW goes unserved for 7 hours.
3. At any finite penalty, some unserved energy is optimal: capacity for the last few hours costs more than not serving them.
4. Renewables enter through hour-by-hour capacity factors (y ≤ x·c_{g,t}), so their value depends on *when* they produce, and screening curves alone no longer give the answer.
5. A CO₂ cap's shadow price is a carbon price: the cost of abating the last tonne. Here it is **$39/t**, from swapping CCGT for geothermal, derivable by hand.

## 4. What it feeds and what assesses it

- **MP2's final part:** add build decisions, impose a CO₂ cap, and show that a tax at the cap's shadow price gives the same result.
  - The lecture teaches the cap and its shadow price. **It must not demonstrate the tax equivalence**, which is MP2's job.
  - It also *fails* on this lecture's thermal-only data, where the abatement cost is flat: a $39.29/t tax gives 2229 kt, not the capped 5009 kt (`scripts/capexp_check.jl`).
  - On MP2's own FA25 HW4 data (with renewables) it works: a 1.5 Mt cap gives a shadow price of −$182.77/t, and a $182.77 tax gives 1.503 Mt (`scripts/tax_equivalence.jl`).
- **Quiz 5 (Nov 16)** covers capacity expansion. There is no precedent; candidates are screening or unserved-energy reasoning ("why 7 hours?") and the units and meaning of a CO₂ shadow price.
- **Nov 4 (MIP)** opens from "this LP assumed divisible capacity".

## 5. Section table (75 minutes; computed sum 75)

| Min | Section and content | Takeaway | Moves | Board or slide |
|:--:|:--|:--|:--|:--|
| 5 | **Review and Questions**: one slide on dispatch (price = the demand shadow price; marginal plant); poll | — | review carries what this session uses | slide |
| 5 | **The decision**: capacity expansion (what to build); greenfield; plant types; generation by source (EIA, the instructor's slide) | 1 | motivation | slide |
| 15 | **Formulation**: goal and unserved energy; variables (x, y, NSE); objective; constraints; full formulation (fixed ×); "it's an LP" (linear, divisible, certain); data (units fixed) and demand | 1, 3 | derivation in small named steps | formulation as a board item (prompt, result fragment, notes) |
| 8 | **Solving it**: JuMP with line highlighting (code first); results table (built in one call); "When might generators operate?" (a week, not 8784 hours) | 1 | do it once in code | slide |
| 17 | **Reading the answer**: the load-duration curve; **new** screening curves (cost per MW-year against hours run, with crossovers); load-duration curve with the crossover hours marked; read the build off it (2017, 733 and 31 MW); "Why any unserved energy?" answered | 2, 3 | interpretation after the result; a concrete anchoring number (7.25 h ≈ 7 hours of shortage) | crossovers as a board item (prompt slide; result fragment 1700 h and 7.25 h; working in notes); reading the build off the curve on a tablet |
| 8 | **Renewables**: what changes (capacity factor); the changed constraint; where capacity factors come from (TMY/AMY); JuMP vector snippet (code first) | 4 | explicit scope: screening no longer suffices | slide |
| 12 | **Carbon limits** (new): the cap constraint Σ e_g y_{g,t} ≤ E with emission factors (coal 1, CCGT 0.43, CT 0.55 t/MWh, as in FA25 HW4); its shadow price is −$39.29/t at both 75% and 50% caps (computed); *why* it is flat: geothermal at $51.2/MWh against CCGT at $34.3/MWh, a $16.9 difference for 0.43 t, gives $39.3/t; reading it as a carbon price; what would make it rise (more expensive abatement steps) | 5 | self-questioning ("why the same price at two caps?") opens MP2's question | $39.3/t as a board item (prompt, result, notes) |
| 5 | **Takeaways, Next Classes** (Wed MIP; Quiz 4 Wed), **Assessments** (MP2 final part now possible; HW7 graded) | — | — | slide |

**Slide target: about 30** — the 26 deduplicated slides, minus the 3 overview slides now given on Oct 28, plus about 7 new (screening ×2, read-off, why unserved energy, CO₂ ×3). That fits the house rate.

## 6. Anchor example (computed)

- **Data:** the slides' own `capacity_expansion/generators.csv` and the 2020 Zone C load. The base solution is CCGT 2017 MW and CT 733 MW, unserved energy 7 hours and 94 MWh, $603.0M per year. Hourly prices (demand duals) are $25 for 7084 hours, $35 for 1692, $9000 for 7, and one degenerate hour at $2280.
- **Screening check (exact, independent of the solver):**
  - CT/CCGT crossover: (82000 − 65000) / (35 − 25) = 1700 h;
  - unserved/CT crossover: 65000 / (9000 − 35) = 7.25 h;
  - the curve at 1700 h is 2017 MW, the curve at 8 h is 2750 MW, and the peak is 2781 MW.
  
  These reproduce the LP build to the MW.
- **CO₂ cap:**
  - Uncapped emissions are 6679 kt.
  - A 75% cap (5009 kt) builds geothermal 439 MW, CCGT 1650, CT 661, at $668.4M; the shadow price is −$39.29/t.
  - A 50% cap builds geothermal 881 MW, CCGT 1208, CT 661, at $734.0M, and **the same −$39.29/t**: a flat abatement cost, since the only abatement option is geothermal replacing CCGT.
  - The hand derivation gives $39.3/t.
  - Robustness: the flat price holds for any cap reachable by that one swap. Don't show a tax run; it is degenerate on this data (above).
- **Arbitrary choices:**
  - The $9000 penalty moves the 7.25-hour threshold (at $10,000 it is 6.5 h), so state it as a formula.
  - The emission factors are borrowed from FA25 HW4; say so in a slide caption.

## 7. Code level

- Handed over complete: the JuMP model shown once with line highlighting; results and figure code folded.
- Build the results table with one `DataFrame(...)` call, not `push!`.
- Screening curves: one folded cell, pre-allocated (`cost_per_mw = zeros(length(hours), n_types)`).
- CO₂: one cell that adds the constraint to the solved model and re-solves (`@constraint` then `optimize!`), first on its slide.
- No decimals on whole numbers in literals (`NSECost = 9000`). FA26 style throughout.

## 8. Checks for understanding

- "Read off how much CT to build from this curve."
- "Why is serving the last 31 MW not worth it?"
- "The cap's shadow price is −39. What are its units, and what does it mean for a utility?"

## 9. Appendix candidates

- The degenerate $2280 hour (why one hour's price sits between $35 and $9000).
- The full 8784-hour dispatch areaplot.
- Typical versus actual meteorological years.

## 10. Cut list (in order)

1. The JuMP vector-constraint snippet for renewables.
2. "What Does This Problem Neglect?" (fold it into the takeaways).
3. The 50% cap (keep only the 75% cap and the hand derivation).

## 11. Not a substitute session

## 12. Decisions for the instructor (recommendation first)

1. **Add screening curves and read the LP's build off the load-duration curve.** *Evidence:* the crossovers (1700 h, 7.25 h) reproduce the LP to the MW and answer the deck's own unanswered "why any unserved energy?". Without them, the load-duration curve's peak/shoulder/base lines are arbitrary.
2. **Add the CO₂ cap and its shadow price, with the $39.3/t hand derivation, but not the tax-equivalence demo.** *Evidence:*
   - MP2's final part needs the shadow-price idea.
   - On this thermal-only data a tax at the shadow price does **not** reproduce the cap (2229 kt against 5009 kt; a flat, degenerate abatement cost).
   - On MP2's data with renewables it does (1.503 Mt at $182.77/t).
   - **Consequence for MP2:** the "same result" claim holds only because renewables make the abatement curve fine-grained. MP2's key should check it at its final parameters and say "matches to within a few kt", not "identical".
3. **Keep renewables conceptual in lecture** (the capacity-factor constraint and its JuMP pattern), with no renewable LP run. *Evidence:* the slides have no full-year renewable capacity-factor series except MP2's FA25 HW4 file, and using that here would pre-solve MP2.
4. **Move the power-system overview slides to Oct 28,** which is now the first power-systems session. Delete them here.
5. **Archive `lecture10-1-gaussian-plumes.qmd`.** Its first 271 lines match `capacity-expansion-2` except for the title line, and the rest is the superseded FA25 plume lecture.
6. **File naming:** the merged deck becomes `lecture11-1-capacity-expansion.qmd` (week 11, Monday). The current `lecture11-1-mixed-integer.qmd` then moves to `lecture11-2-…` for Wednesday. `git mv` its `_freeze/` directory with it.

---

# Outline — Wed Nov 4: Mixed Integer Programming (Lecture 17)

## 1. Header

- **Date:** Wed Nov 4, 2026. 75 minutes: **Quiz 4 first (25 minutes), then about 50 minutes of content.**
- **Who:** the instructor.
- **Source:** `slides/lecture11-1-mixed-integer.qmd` (FA25). Rename it to `lecture11-2-mixed-integer.qmd` if Nov 2 takes `lecture11-1`.
- **Status:** Reuse, with branch and bound trimmed. This outline also adds a coded MIP example, which the TA lab and HW8 depend on.

## 2. Measurement of the source

- **Size:** 35 headers with code fences stripped: 4 section titles and 31 slides, about 33 with the title and Overview slides. 12 code cells.
- **Branch and bound alone is 17 slides:** the idea, node 1, the tree figure before and after each node pair, and the plots for nodes 2–9. That is roughly 34 minutes at the house rate, for a session with 50.
- **Reusable:**
  - Limitations of LP, discrete decisions, fixed costs, the fixed-cost discontinuity figure, operational status as a decision variable, binary/integer variables;
  - divisibility violated (2 slides);
  - the simple MILP and its plots, the idea of branch and bound, node 1, nodes 2/3;
  - the tree figures `figures/bb-*.png`.
- **Verified** (`scripts/bb_check.jl`): every node value in the deck is right.
  - Node 1 (the LP relaxation) is (5.44, 2.69), Z = 27.06.
  - Node 2 gives 25 and node 3 gives 25.5.
  - Node 4 gives 24.67; node 5 is infeasible.
  - Node 6 gives (4, 3), Z = 24, the incumbent.
  - Node 7 gives 20.5 and is pruned by its bound.
  - Node 8 gives (5, 2), Z = 23; node 9 is infeasible.
  - The optimum is (4, 3), Z = 24.
- **Stale or wrong:**
  1. The subtitle says "Lecture 15"; FA26 needs 17. The date says Nov 3, 2025.
  2. Upcoming Schedule and Assessments are FA25: "Wednesday: No class", "Prelim 2 (11/12)".
  3. The review slide is a generic list of LP assumptions.
  4. **There is no coded or applied MIP.** The deck has no JuMP, no `Bin`, no linking constraint, and no LP relaxation of a real model. The Nov 11 TA lab and HW8's computational part both assume students have seen these once.
  5. "Solution to linear relaxation … is an *upper bound*" is right for this maximisation. The lab and HW8 minimise, so the deck must state both directions.
  6. The style is not FA26's (Computer Modern, ad hoc colours).

## 3. Takeaways (claims)

1. Binary variables turn on/off decisions into linear constraints:
   - fixed costs: FixedCost·u in the objective;
   - capacity only when on: y ≤ Pmax·u;
   - a minimum output when on: y ≥ Pmin·u;
   - logical conditions: u_B + u_C ≤ 1.
2. **Fixed costs can overturn the merit order.** At 150 MW the plant with the cheapest energy (coal, $20/MWh) costs more to switch on than the CCGT, so the MIP runs the CCGT alone ($5,500 against $6,000). Coal wins only above 200 MW.
3. Dropping integrality gives an LP whose optimum *bounds* the MIP (below for minimisation, above for maximisation), and whose "solution" can be physically meaningless, like a coal plant 60% on.
4. Branch and bound solves LP relaxations and splits on a fractional variable. It prunes a branch when it is infeasible, already integer, or bounded worse than the best integer solution found so far.

## 4. What it feeds and what assesses it

- **HW8** (assigned today, due Thu Nov 12), which asks for:
  - a fixed cost, an either/or, and an indicator, each modelled with binaries;
  - why the LP relaxation bounds;
  - tracing 2–3 branch-and-bound nodes;
  - solving a small MIP and comparing it with its relaxation.
  
  The lecture must show each modelling pattern once and the relaxation in JuMP once. HW8's own example must differ from the lecture anchor and from the lab.
- **Nov 9 (waste, substitute):** facility indicator variables reuse the linking pattern.
- **Nov 11 (Lab 3, TA, facility siting in JuMP, formulation given):** needs `Bin`, the linking constraint (x ≤ C·y), `relax_integrality`, and the bound reading.
- **Quiz 5 (Nov 16):** covers MIP.
- Unit commitment was dropped Oct 6. The anchor below is a three-plant commitment problem, so some of that idea survives without a session.

## 5. Section table (about 50 minutes after the 25-minute quiz; computed sum 50 + 25 = 75)

| Min | Section and content | Takeaway | Moves | Board or slide |
|:--:|:--|:--|:--|:--|
| 25 | **Quiz 4** | — | — | — |
| 2 | **Review**: one slide on what the LP assumed (divisibility) and what the Oct 28 dispatch assumed (every plant already on) | — | review carries only what this session builds on | slide |
| 10 | **Discrete decisions** (the instructor's slides): limitations of LP; "which generators do we run?"; fixed costs; the discontinuity figure; binary variables | 1 | motivation before mechanism | slide |
| 14 | **Modelling with binaries** (new anchor): three plants, each with a minimum, maximum, marginal cost and fixed cost; the linking constraints y ≤ Pmax·u and y ≥ Pmin·u; the objective; the either/or pattern (u_B + u_C ≤ 1) and the general big-M disjunction; JuMP with `Bin` (code first); the result at 150 MW (CCGT alone, $5,500); the 200 MW switch by hand | 1, 2 | derivation in small named steps; do it once by hand, then in code; a concrete anchoring number (200 MW) | constraints as a board item (prompt slide, result fragment, working in notes); 200 MW by hand on the board |
| 8 | **The LP relaxation**: `relax_integrality` gives coal 60% on, $4,800, 12.7% below the MIP; why it is a bound (larger feasible set), with the direction for min and max; divisibility violated (the 2 slides merged into 1) | 3 | verification as a named step; a named trap (fractional "on") | slide |
| 12 | **Branch and bound**: the simple MILP; node 1 (bound 27.06, incumbent 23); branch on x₂ gives nodes 2/3 (25, 25.5; both plots on one slide); the final tree (drawn from the node solutions since Oct 7, replacing `bb-89.png`) with the pruning rules (5 and 7 infeasible; 6 integer at 23, the first incumbent; 8 integer at 24, the optimum; 9 pruned since 20.5 < 24); "why it's still expensive" (the tree can grow exponentially) | 4 | interpretation after the result | node 1 → 2/3 as a board item; tree annotation on a tablet |
| 4 | **Takeaways, Next Classes** (Mon waste with a substitute; Wed Lab 3 with the TA; Quiz 5 Mon Nov 16), **Assessments** (HW8 assigned) | — | — | slide |

**Slide target: about 21** (now about 33). Branch and bound goes from 17 slides to 5, with nodes 4–9 in the appendix. Add about 6 for the anchor and the relaxation. That matches about 50 minutes at the house rate.

## 6. Anchor example (computed, `scripts/commitment_check.jl`)

- **Plants:**

  | Plant | Min (MW) | Max (MW) | Marginal cost ($/MWh) | Fixed cost when on ($/h) |
  |:--|--:|--:|--:|--:|
  | Coal | 100 | 250 | 20 | 3000 |
  | CCGT | 50 | 200 | 30 | 1000 |
  | CT | 0 | 100 | 50 | 100 |

- **Results:**

  | Demand | MIP | LP relaxation | Gap |
  |:--|:--|:--|:--|
  | 150 MW | CCGT alone, $5,500 | coal "u = 0.6", $4,800 | 12.7% |
  | 220 MW | coal alone, $7,400 | coal 0.88, $7,040 | 4.9% |
  | 280 MW | coal 250 + CT 30, $9,600 | coal + CCGT u = 0.15, $9,050 | 5.7% |
  | 350 MW | $12,000 | $11,500 | 4.2% |
  | 420 MW | $14,100 | $13,950 | 1.1% |

- **The coal/CCGT switch is exact by hand:** 3000 + 20d = 1000 + 30d gives d = 200 MW. It doesn't depend on the solver.
- **The relaxation's "effective cost"** is marginal cost plus fixed cost over maximum output: coal 32, CCGT 35, CT 51 $/MWh. That explains why the relaxation always fills coal first. It's a good line for the notes.
- **Robustness:** the gap shrinks as demand grows (12.7% → 1.1%). Say "the bound can be loose or tight", not one number.
- **The either/or (u_B + u_C ≤ 1) doesn't bind** at any demand tested (280 and 350 MW are unchanged). Present it as a modelling pattern, not as a result.
- **Distinct from:** the lab's siting data (its own data), HW8 (undrafted; choose a non-power context there), and the waste lecture.

## 7. Code level

- Handed over complete:
  - one JuMP cell with `@variable(m, u[1:3], Bin)`, the linking constraints, and the objective, code first on its slide;
  - one cell for `relax_integrality(m)` and the re-solve.
- Students write nothing in class. The lab (Nov 11) is where they write it.
- Branch-and-bound plots stay as folded figure code.
- No decimals on whole numbers (`pmax = [250, 200, 100]`). Pre-allocate any sweep over demand (`mip_cost = zeros(length(demands))`). FA26 style.

## 8. Checks for understanding

- "Write the constraint that forces CCGT output to zero when it's off."
- "Why can the relaxation never cost *more* than the MIP?"
- "At node 7 the relaxation gives 20.5. Why don't we branch further?"

## 9. Appendix candidates

- Branch-and-bound nodes 4–9 with their plots (the existing slides).
- The big-M disjunction in general form, and choosing M.
- Branch and cut, in one slide.

## 10. Cut list (in order)

1. The second divisibility slide.
2. The either/or slide (keep the pattern in the notes; HW8 can carry it).
3. The nodes 2/3 plots (keep the tree figure only).

## 11. Not a substitute session

The deck must still stand alone for the Nov 11 TA lab: the TA guide will point back to the anchor's slides.

## 12. Decisions for the instructor (recommendation first)

1. **Use a three-plant commitment problem as the applied anchor**, and show it once in JuMP. *Evidence:*
   - the deck has no coded MIP, and the lab and HW8 both need one;
   - the 150 MW result (CCGT beats cheaper coal) and the 200 MW hand threshold are clean;
   - it recovers part of the dropped unit commitment, and it differs from the lab's siting problem.
2. **Trim branch and bound to nodes 1–3 plus the final annotated tree, with nodes 4–9 in the appendix.** *Evidence:* the current 17 slides take about 34 of the 50 minutes. HW8 asks students to trace only 2–3 nodes, and every node value is verified.
3. **State the bound for both senses** ("upper for max, lower for min"). *Evidence:* the deck's example maximises, while the lab and HW8 minimise.
4. Rename the file to `lecture11-2-mixed-integer.qmd` (with `git mv` of `_freeze/`) if Nov 2 becomes `lecture11-1-capacity-expansion`.

---

# Outline — Mon Nov 9: Solid Waste and Network Models (Lecture 18)

## 1. Header

- **Date / length:** Mon Nov 9, 75 minutes. It moves to Wed Nov 11 if that is the only day the substitute can come; then Lab 3 (TA facility siting) runs first.
- **Taught by:** a general substitute, not the power-systems expert. The instructor is away Nov 9–13.
- **Source:** `slides/lecture12-1-waste-management.qmd` (FA24-dated). Status: Reuse, make sub-ready.
- **Assessment it feeds:** HW9, assigned on the lecture day, due Thu Nov 19. Quiz 5 (Mon Nov 16) covers waste and networks.

## 2. The source deck, measured and checked

- **Size:** 5 sections, 38 `##` slides, 2 code cells (both setup; no model is solved on a slide), **0 speaker notes**. The FA26 decks run 24–27 slides with 12 code cells and notes. A sub cannot deliver this deck as it stands: there is nothing to say on any slide.
- **Reusable:**
  - the hierarchy motivation and the network figures (all four SVGs exist; the EPA image loads, HTTP 200);
  - the decision-variable, objective and constraint build-up;
  - the example data and its figures;
  - the key-takeaway slides.
- **Stale:**
  - "Lecture 16", dated Nov 10 2024;
  - a review section on MIP plus "Exam Review" (no exam this term);
  - "Next Lectures: Wednesday Prelim 2; next week Gaussian plumes";
  - `plot_font = "Computer Modern"` (the FA26 decks use Palatino), `Pkg.activate(".")` (FA26 uses `@__DIR__`), unused packages.
- **Errors**, re-derived by solving the model as written (`scripts/waste_example.jl`):
  1. "LF Costs": the landfill fixed cost is written $1918 Y_2$; it should be $Y_3$.
  2. "Commitment" slide: the MRF condition reads $W_{21}+W_{22}$; it should be $W_{12}+W_{22}$ (flows *into* facility 2).
  3. "Big-M" slide: $MY_1 \ge W_{21}+W_{22}$ pairs the WTE's binary with the wrong flows. It should be $MY_2 \ge W_{12}+W_{22}$, or for the WTE $MY_1 \ge W_{11}+W_{21}+R_{21}$.
  4. "Indicator Variable Constraints": the $Y_j=0$ case leaves out the residual inflows $R_{kj}$, which the $Y_j=1$ case includes.
  5. "Waste Mass-Balance Constraints": its capacity constraint leaves out residual inflows, which the formulation slide includes.
  6. "Example Solution": the deck prints **\$26,879/day**. The model gives **\$26,881/day** (26,881.25 with the slide's rounded fixed costs; 26,880.70 with \$/yr ÷ 365). The flows and binaries match the deck: $W_{12}=100$, $W_{23}=170$, $R_{13}=7.5$, $R_{21}=37.5$, $R_{23}=22.5$, all three facilities open.
  7. Typo: "Tranportation".
- **Every objective coefficient checks out** (for example $W_{11}$: $1.5 \times 15 + 60 = 82.5$; $W_{12}$: $1.5 \times 5 + 5 + 0.4 \times 35 = 26.5$), and so do the fixed costs per day (2466, 1096, 1918).
- **A weakness, not an error: in the example as given, no binary ever bites.**
  - The WTE stays open even at a \$50,000/day fixed cost: without it the problem is infeasible, because the 200 Mg/day landfill is full.
  - Forcing $Y_3 = 1$ changes nothing; the solution is identical without it.
  - So the example never shows a facility *closing*, which is what HW9 ("interpret which facilities open") and Quiz 5 ("which constraints need a binary, and why") are about.
  - Computed fix, a "what if" on one slide: raise the landfill to **220 Mg/day** and the **WTE closes**, cutting cost from \$26,881 to **\$24,539/day**. At 270 Mg/day the MRF closes too (\$23,593/day). The MRF and WTE open *because the landfill is full*, not because they are cheap. Separately, raising the MRF's fixed cost to \$3,000/day closes the MRF (\$27,013/day).

## 3. Takeaways (claims)

1. A network model's decision variables are the **flows** along the arcs, and its constraints are **conservation at each node**: what arrives equals what leaves, transformed (a recycler passes on 60% as residual, a combustor 20% as ash).
2. A facility that may or may not operate needs a **binary**. It enters twice: in the objective as fixed cost × $Y_j$, and in the capacity constraint, flow into $j \le K_j Y_j$, so a closed facility can take nothing.
3. Facilities can open for **non-obvious reasons**. Here the WTE runs only to burn the recycler's residual, because the landfill is full. Make the landfill 20 Mg/day larger and the WTE closes, saving about \$2,300/day.
4. A network model is only the graph. You still need what flows do at each node (fate and transport), costs, and the management or regulatory limits (keeps the instructor's "What Is Missing?" slide).

## 4. What it feeds and what assesses it

- **HW9** (by hand: a small facility-allocation network with flow-conservation and capacity constraints and siting indicators; computationally: solve it and interpret which facilities open). The lecture must teach all four. HW9 should use a *different* network so that the lecture's worked example and folded JuMP code are a model to adapt, not a verbatim answer.
- **Quiz 5** (Nov 16): waste and networks, including "which constraints need a binary, and why", which takeaway 2 answers. No timed-exam precedent exists.
- **Lab 3** (TA, facility siting in JuMP) is never assessed. If it runs first (the swap case), it previews $Y_j$ and the linking constraint; if after, it practises them. The review slide is written to work either way.
- **Builds on:** Nov 4 (MIP: fixed costs need binaries) and Nov 2 (capacity expansion: LP with capacity limits).

## 5. Section plan (75 minutes)

| Min | Section | Takeaway | Content moves | Board / slide |
|--:|:--|:--|:--|:--|
| 4 | Review and questions | — | One slide: "on/off decisions with fixed costs need binaries", from Nov 4; poll | slide |
| 6 | Solid waste management | 4 | **Motivation first** (instructor's slides): where to send waste, what to build; the EPA hierarchy | slide |
| 12 | Waste allocation as a network | 1, 4 | Nodes and arcs, flows as decisions; conservation at a source, a transfer node and a sink, on a 2-city, 2-facility sketch; capacities; "What Is Missing?" (instructor's slide, kept) | **board item**: write the conservation constraints for the sketch (prompt slide, result as a fragment, working in the notes). For a sub, the fragment *is* the answer, so no board is required |
| 6 | Example system and decision variables | 1 | Network figure; $W_{ij}$, $R_{kj}$, $Y_j$ with units | slide; prompt "what are the decision variables?" then reveal |
| 10 | Objective | 2 | Transport plus disposal; "is this disposal cost right?" leads to fixed cost × $Y_j$; one coefficient worked out ($82.5 = 1.5 \times 15 + 60$) | slide fragments; the coefficient as a worked line |
| 14 | Constraints | 1, 2 | City mass balance; residual mass balance (**fate and transport**: 60% residual, 20% ash); capacity **linked** to $Y_j$; check: "which constraints need a binary, and why?" | slide; poll check |
| 12 | Solve and interpret | 3 | JuMP model (folded code, first on its slide) → \$26,881/day, all open; **interpretation slide**: why the WTE runs; "what if the landfill were 220?" → WTE closes, \$24,539/day | slide (figure from the deck's solution SVG) |
| 5 | Takeaways and next | all | Takeaways; next classes; HW9 assigned | slide |
| 6 | Buffer for the sub | — | Questions; or the cut list in reverse | — |
| **75** | | | | |

- **Slide target:** about 29 `##` slides, down from 38. This is at the house rate (about 31 per 75 minutes), and slightly under it so a sub has slack.
- **Merges:**
  - "Facility Costs" with the three per-facility cost slides;
  - "Final Objective" into "Objective With Indicator Variables";
  - the two indicator slides plus the JuMP-indicator and big-M slides into one "Linking capacity to on/off" slide, with the JuMP `=>` syntax and big-M moved to the appendix.

## 6. Anchor example (computed: `scripts/waste_example.jl`)

- Two cities (100 and 170 Mg/day) and three facilities: WTE (150 Mg/day, \$900k/yr, 20% ash), MRF (130 Mg/day, \$400k/yr, 40% recycled, 60% residual), and landfill (200 Mg/day, \$700k/yr).
- **Optimum:** \$26,881/day. $W_{12}=100$, $W_{23}=170$; residuals $R_{21}=37.5$ (MRF to WTE), $R_{23}=22.5$ (MRF to LF), $R_{13}=7.5$ (ash to LF); all facilities open; the landfill exactly full (200).
- **Robustness:**
  - The same flows result with exact or rounded fixed costs.
  - The WTE stays open for any fixed cost up to \$50k/day (feasibility, not price).
  - Not forcing the landfill on changes nothing.
- **What-ifs** (one slide):
  - landfill 220 → WTE closes, \$24,539/day;
  - landfill 270 → only the landfill operates, \$23,593/day;
  - MRF fixed cost \$3,000/day → MRF closes, \$27,013/day.
- LP relaxation (for the instructor's information; it belongs to Lab 3, not this deck): $Y = (0.25, 0.77, 1)$ at \$24,778/day.

## 7. Code level

- **One new code cell:** the JuMP model, folded, first on its slide, following the 09-1 idiom. That means named constraints, `@variable(m, Y[1:3], Bin)`, linking constraints `flow_in[j] <= capacity[j] * Y[j]`, `set_silent`, `optimize!`, and `value.`.
- **One more** for the what-if, re-solving with a larger landfill: the same function with a keyword, so the numbers come from the deck's own code.
- **House rules:** palette and plot defaults copied from 07-2 (Palatino); whole numbers without decimals (`capacity = [150, 130, 200]`); arrays pre-allocated (comprehensions are fine).
- **Risk:** without a code cell, a sub has no way to answer "how did you get that?". The current deck says "you know how!".

## 8. Checks for understanding

- **Poll after the network section:** "A transfer station receives 40 Mg/day from each of two cities and sends to a landfill and a recycler. Write its conservation constraint."
- **Poll in the constraints section:** "Which of these constraints needs a binary, and why?" The answer: the capacity constraints of facilities that may close, plus the fixed cost in the objective. City mass balance does not.
- **Interpretation prompt before the reveal:** "The WTE costs \$2,466/day just to open. Why would we pay that to burn 37.5 Mg/day?"

## 9. Appendix candidates

- JuMP indicator-constraint syntax (`!Y[2] => {...}`) and the general big-M reformulation (corrected indices).
- Other networks (transport, power transmission, pipelines): the instructor's "Network Models" takeaway slide, moved here if time is short.

## 10. Cut list (in order)

1. The MRF fixed-cost what-if (keep only the landfill one).
2. The generic 2-city conservation board item (go straight to the example's city balance).
3. The "Other networks" slide.
4. The per-coefficient worked line (show the final objective only).

## 11. What the substitute needs

- **Speaker notes on every slide:** what to say; the expected answer to each prompt; the timing cue ("you should be here by minute 30"); what to skip if short (§10).
- **A one-page sub sheet** (also in the first slide's notes):
  - the four takeaways and the key numbers (\$26,881/day; the 220 Mg/day what-if);
  - three likely questions with answers: why the WTE is open; why the binary appears in the capacity constraint; what "residual" means;
  - that HW9 is assigned today and the TA holds office hours.
- **No board dependence:** every board item is a slide with its answer as a fragment.
- **Swap-proof wording:** the review slide does not mention Monday's or Wednesday's lab, and "Next classes" lists Lab 3 by name, not by weekday.
- The poll link (`_poll-prompt.qmd`) works for the sub's account, or the sub skips the poll. Instructor to confirm.

## 12. Decisions for the instructor (recommendation first)

1. **Show the solved model in the deck (folded JuMP code plus the 220 Mg/day what-if)** — *recommended*. Evidence: the deck's printed optimum was wrong by \$2, and in the example as given no binary ever changes, so the "which facilities open" lesson needs the what-if, which needs code. HW9 uses a different network, so this is a worked example, not the answer.
2. **Make the capacity-linking constraint ($\sum \text{flow into } j \le K_j Y_j$) the main way to switch a facility on and off; move the piecewise $Y_j$ definition, JuMP `=>` syntax and big-M to the appendix** — *recommended*. Evidence: it is one constraint instead of three. It fixes the deck's three index errors at once. It matches Lab 3's $x_{ij} \le C_j y_j$ and Quiz 5's planned item.
3. **Drop $Y_3 = 1$** (the landfill forced on) — *recommended*. Evidence: the optimum is identical without it, and it invites a "why?" a sub can't answer.
4. **Whether a sub should do any board work** — *recommend none*; fragments carry the answers.

---

# Outline — Mon Nov 16: Stochastic Optimization and Scenario Trees (Lecture 19)

## 1. Header

- **Date / length:** Mon Nov 16, 75 minutes, of which Quiz 5 takes the first 25, so **50 minutes of content**.
- **Taught by:** the instructor (back from travel; budget a few minutes to re-sync).
- **Source:** `slides/lecture13-1-stochastic-optimization.qmd` (FA25-dated). Status: Reuse.
- **Sets up:** Wed Nov 18 (sequential decisions and dynamic programming) and Mon Nov 23 Lab 4 (scenario trees and sequential decisions; reservoir operations under hydroclimatic uncertainty).
- **Assessed by:** Quiz 6 (Dec 7), which covers scenario trees and DP. No exam precedent exists.

## 2. The source deck, measured and checked

- **Size:** 6 sections, 36 `##` slides, 2 code cells (setup only), **0 speaker notes**. For 50 minutes the house rate is about 21 slides, so 36 is far over and needs real cuts, not trims.
- **Reusable:**
  - the certainty / act-learn-act framing;
  - the two-stage dispatch description (a good bridge to Oct 28 and MP2);
  - the Birge & Louveaux farmer example, its scenario tree figure (`figures/farm-scen-tree.svg` exists), and the VSS/EVPI section.
- **Numbers re-derived** by solving the deterministic, perfect-information and two-stage models (`scripts/farmer.jl`):
  - Correct as printed: mean-value plan 120/80/300 acres at \$118,600; good year 183.33/66.67/250 at \$167,667; bad year 100/25/375 at \$59,950; stochastic plan 170/80/250 at an expected \$108,390; the stochastic plan's profits by scenario (167,000 / 109,350 / 48,820); EEV \$107,240; VSS \$1,150.
  - **Wrong:** the mean-value plan's bad-year profit is printed as **\$56,800**. It is **\$55,120**. Only \$55,120 averages, with \$148,000 and \$118,600, to the stated \$107,240.
  - **Rounding:** wait-and-see \$115,405.6, so **\$115,406**, and **EVPI \$7,016** (the deck says \$115,405 and \$7,015).
- **Other errors and stale items:**
  - "500 **ha** of land" in the stem, while every cost and yield is per **acre**.
  - "Purchasing crops costs **\$40 more** than the selling prices": the objective uses 238 and 210, which are **40% more** (1.4 × 170, 1.4 × 150).
  - Typos: "240T kg of corn", "3 T/acre per corn", "Stochastic Contraints".
  - "**Motivating Example**" is an empty slide (a bare `-`).
  - Stale: dated Nov 17 2025, with no lecture number set. "Next classes: Handling Multiple Objectives; Sensitivity Analysis". "HW5 due 12/4". Computer Modern font; `Pkg.activate(".")`.
- **A teaching nuance the deck doesn't state:** here VSS (\$1,150, about 1% of profit) is much smaller than EVPI (\$7,016). The stochastic plan buys modest robustness, while better forecasts would be worth six times as much.

## 3. Takeaways (claims)

1. **The plan that is best for the average year is not the best plan across years.** The farmer's mean-value plan (120/80/300 acres) earns less in expectation than the stochastic plan (170/80/250).
2. In a **two-stage** problem, the here-and-now decision (planting) gets **one** copy and the recourse decisions (buy and sell) get **one copy per scenario**, weighted by probability. The scenario tree is the bookkeeping.
3. **Compare plans under uncertainty, not on paper.** The mean-value plan's \$118,600 is not what it earns on average (\$107,240). VSS = \$1,150 is what modelling uncertainty is worth; **EVPI = \$7,016** is the most a perfect forecast is worth.
4. **Scenario trees grow multiplicatively** with stages and uncertainties (3 outcomes a year for 10 years is 59,049 leaves). That is the problem Wednesday's dynamic programming addresses.

## 4. What it feeds and what assesses it

- **Wednesday (DP):** takeaway 4 is the bridge. DP's stochastic reservoir example is checked against the same kind of scenario tree.
- **Lab 4** (Nov 23, unassessed): it uses scenario trees for reservoir releases. Takeaway 2's vocabulary (here-and-now, recourse, scenario copies) is what the lab assumes.
- **Quiz 6** (Dec 7): candidate items are "draw the tree and give each leaf's probability for two uncertainties"; "which variables are first-stage and which are recourse"; "compute VSS or EVPI from a three-row table". All need writing and time-testing (no precedent).
- **Quiz 5** is given this day and does **not** cover it (a quiz never covers its own week).

## 5. Section plan (50 minutes after the quiz)

| Min | Section | Takeaway | Content moves | Board / slide |
|--:|:--|:--|:--|:--|
| 3 | Review and questions | — | One slide: waste networks, where a facility opens because a capacity binds | slide |
| 5 | **Motivation** (fills the empty slide) | 1 | "Decide before you know." A reservoir manager setting summer releases before the spring inflow is in; a grid operator committing plants before the wind is known (Oct 28) | slide; image or sketch |
| 5 | Certainty and LP; approaches | 1 | Certainty was the third LP assumption (Oct 14). Common practice: solve with best estimates, then stress-test. The alternative: put uncertainty in the model | slide |
| 4 | Two-stage framing | 2 | Act–learn–act; the dispatch version (bridge to MP2) | slide |
| 6 | The farmer, deterministically | 1 | Problem and data on one slide; mean-value plan and \$118,600; good- and bad-year optimal plans in **one** table | slide |
| 10 | Two-stage formulation | 2 | What changes about the variables (recourse copies per scenario); scenario tree; **board item**: write one scenario's constraints, the rest by pattern; stochastic plan and its interpretation (good year: no wasted beets; bad year: wheat covers corn purchases) | **board**: one scenario's constraint block (prompt slide, result fragment, working in notes) |
| 12 | Comparing plans: VSS and EVPI | 3 | **Question that names the issue:** "Can we compare \$118,600 with \$108,390?" Each plan by scenario (table) → EEV \$107,240 → VSS \$1,150. Perfect information \$115,406 → EVPI \$7,016. **Interpretation slide:** VSS is small here and EVPI is six times larger, so what's worth buying is better forecasts | **board item**: compute VSS from the table; slide for EVPI |
| 3 | Takeaways and next | 4 | Takeaways; tree-size teaser (59,049 leaves); Wednesday is DP; Monday is Lab 4 | slide |
| 2 | Buffer | — | — | — |
| **50** | | | | |

- **Slide target:** about 21 `##` slides, down from 36.
- **Cuts:**
  - the "General Objective for Stochastic LP" notation slide (keep the two-stage objective in words);
  - "Representation of Uncertainties";
  - the separate high- and low-yield slides, merged into one table;
  - the two "Stochastic Objective" slides, merged;
  - the full nine-line stochastic constraint slide, which becomes one scenario block plus "the same with yields × 1.2 and × 0.8".

## 6. Anchor example (computed: `scripts/farmer.jl`)

- **Mean-value plan:** 120/80/300 acres, \$118,600 on paper. By scenario (good, average, bad) it earns \$148,000 / \$118,600 / **\$55,120**; EEV is **\$107,240**.
- **Stochastic plan:** 170/80/250 acres, earning \$167,000 / \$109,350 / \$48,820; expected \$108,390. **VSS \$1,150.**
- **Perfect information:** good year 183.33/66.67/250 at \$167,667; bad year 100/25/375 at \$59,950; average year \$118,600. WS \$115,406, so **EVPI \$7,016**.
- **Robustness:** these are exact LP optima; no randomness and no tuning. The scenario probabilities (1/3 each) are the example's assumption, stated on the slide.

## 7. Code level

- **Recommended: one folded code cell** with the two-stage JuMP model. It is the deterministic LP with `y[i, s]` and `z[i, s]` indexed by scenario and the objective weighted by probability, and the slide's table values come from it (which would have caught the \$56,800 error).
- Students have written LPs in JuMP since Oct 19, so the folded code is a reference, not new material.
- **House rules:** code first on its slide; whole numbers without decimals (`plant_cost = [150, 230, 260]`); Palatino defaults from 07-2.

## 8. Checks for understanding

- **After the two-stage framing:** "In the reservoir example, what is here-and-now and what is recourse?" (The release target is here-and-now; spill or emergency purchases are recourse.)
- **Before the VSS reveal:** "Which number would you report to the farmer's banker as the mean-value plan's expected profit: \$118,600 or something else?"

## 9. Appendix candidates

- The full stochastic constraint block (all three scenarios).
- The general notation $\min_x f(x) + \mathbb{E}_\xi[Q(x;\xi)]$.
- Multi-stage trees: the branch count grows as (outcomes)^(stages).

## 10. Cut list (in order)

1. The dispatch two-stage slide (keep the farmer only).
2. The motivation's second image (keep the reservoir).
3. The EVPI board item (show it as a slide).
4. The interpretation fragment on the stochastic plan.

## 11. Decisions for the instructor (recommendation first)

1. **Keep the farmer example, fixed**, rather than swap in an environmental two-stage example — *recommended*. Evidence: it is a Reuse session on a quiz day (50 minutes); every number is now verified; a new example needs new data, a figure and verification. The environmental connection goes in the motivation slide and Wednesday's reservoir.
2. **Fill the empty "Motivating Example" with a reservoir-release-before-inflow scenario** — *recommended*. It previews Wednesday and Lab 4 with the same system. The alternative is wind and unit commitment, which links to MP2 but not to Lab 4.
3. **Add one folded JuMP cell for the two-stage model and compute the tables from it** — *recommended*. Evidence: the hand-typed tables carried a \$1,680 error (\$56,800 vs \$55,120).
4. **Say out loud that VSS is small here.** Some years modelling uncertainty is worth little and better information is worth more. This sets up "what is a forecast worth?" without new material.

---

# Outline — Wed Nov 18: Sequential Decisions and Dynamic Programming (Lecture 20)

## 1. Header

- **Date / length:** Wed Nov 18, 75 minutes.
- **Taught by:** the instructor.
- **Source:** none. **New build.** The course has no DP material in any deck (searched every `lecture*.qmd`; the only hit for "sequential" is one line in the stochastic deck).
- **Feeds:** Lab 4 (Mon Nov 23, scenario trees and sequential decisions; reservoir operations under hydroclimatic uncertainty) and Quiz 6 (Dec 7: scenario trees and DP; no precedent).

## 2. Measurement (house style to hold to)

- The FA26 decks built this term run **24–27 `##` slides in 7 sections**, with about 12 code cells (figure code folded), speaker notes on the main slides, and derivations either as board items or in the appendix (`08-2`, `09-1`, `07-2`).
- This session carries **a board-heavy backward induction**, so the target is **24 `##` slides**: fewer and lighter than the median, as the minutes require.

## 3. Takeaways (claims)

1. A **sequential decision** has stages, a **state** that carries the past forward, decisions, and a **transition** (storage next month = storage − release + inflow, capped at capacity). Today's decision changes tomorrow's options, so deciding each month on its own (**greedy**) can be badly wrong. For a full reservoir across a three-month dry season, greedy earns 25 and the best plan earns 30.
2. **Backward induction** solves it. Start at the last month, where the answer is obvious, and step backwards, keeping one table per month of the best total value from each storage level (the **value function**). Each step needs only the next month's table.
3. Under uncertain inflows, DP returns a **policy** (release as a function of storage), not a schedule. It gives exactly the scenario tree's optimum (28.25 here), but its work grows **linearly** with the number of months (5 storage levels per month) while the tree grows **exponentially** (2 inflow outcomes a month: 8 leaves at 3 months, 4,096 at 12).
4. **Trap: end effects.** What water is worth after the horizon is a modelling choice that can flip the whole policy. Valuing carry-over storage at 6 per unit turns "release 2, 2, 2" into "release 1, 1, 0 and end full".

## 4. What it feeds and what assesses it

- **Lab 4** (Nov 23, unassessed) should start from this deck's model and code: a longer horizon, inflow scenarios, and perhaps a scenario-tree comparison. The vocabulary (state, transition, value function, policy, terminal value) has to be on slides here, because the lab assumes it.
- **Quiz 6** (Dec 7) candidate items, all needing writing and time-testing:
  - fill in one row of a value-function table, about 5 minutes (the board item rehearses it);
  - name the state, decision and transition in a described problem (for example the lake);
  - "why does a scenario tree grow faster than a DP table?".
- **Builds on:** Nov 16 (scenario trees, here-and-now versus recourse, and tree growth: takeaway 4 there sets up takeaway 3 here). It also builds on the week-3 lake model, which is already a state equation: $P_{t+1} = P_t + L - sP_t + R(P_t)$ (`lecture03-2-lake-hysteresis`).

## 5. Section plan (75 minutes)

| Min | Section | Takeaway | Content moves | Board / slide |
|--:|:--|:--|:--|:--|
| 3 | Review and questions | — | One slide: Monday's scenario-tree growth (3 outcomes for 10 years is 59,049 leaves) | slide |
| 6 | **Motivation**: decisions that change tomorrow | 1 | Summer reservoir releases; the week-3 lake (this year's loading is next year's lake: the state equation students have already seen); fish harvest. **Question that names the issue:** "Why not optimise each month on its own?" | slide |
| 8 | The reservoir problem | 1 | Full (4 units) at the start of a three-month dry season; inflows 1, 1, 0; benefit per month 0, 6, 10, 12, 13 for releases 0–4 (diminishing returns). Greedy: release everything available, 4, 1, 1, for **25**. Check: "Can you beat 25?" (2, 2, 2 gives **30**) | slide; poll |
| 6 | The ingredients | 1, 2 | Stage, state, decision, transition $s_{t+1} = \min(s_t - r_t + I_t,\,4)$, benefit; value function $V_t(s)$ in words ("the best total benefit from month $t$ on, starting with $s$ in storage"); policy. One equation, no Bellman notation overload | slide |
| 14 | **Backward induction by hand** | 2 | Month 3: release everything, $V_3 = (0, 6, 10, 12, 13)$. Month 2 (inflow 1): fill in the table, $V_2 = (6, 12, 16, 20, 22)$, policy (0, 1, 1, 2, 2). Students fill in $V_2(3)$; the instructor fills in the rest. Month 1 by code: $V_1(4) = 30$ with release 2 | **board item**: the month-2 table (prompt slide with an empty table, results as fragments, working in notes) |
| 8 | Backward induction in code; **verification** | 2 | The loop: stages backwards, pre-allocated value and policy tables. **Verification as a named step:** brute force over every release sequence finds the same 30, achieved by exactly one sequence | slide (code first) |
| 5 | **Interpretation** | 1, 2 | Reading the policy table. Why spread the water: the second unit in a month is worth less than the first unit in another month, so DP equalises releases at 2, 2, 2 | slide; figure: releases by month, greedy against DP |
| 12 | Uncertain inflows | 3 | Release before the month's inflow is known; inflow 0 or 2, equally likely. Expected value replaces the known next state. Policy from full storage: **release 2, hold 2** (hedging). DP value 28.25 equals the scenario tree's optimum (**verification against Monday's method**). Releasing everything gets 23. Tree against DP-table growth (8 / 64 / 4,096 leaves at 3 / 6 / 12 months, against 5 states a month) | slide; tree-and-lattice figure |
| 4 | **Trap: end effects** | 4 | Carry-over value 0 or 3 per unit gives 2, 2, 2; 6 per unit gives 1, 1, 0 and ends full. Ask: "What is water worth in October?" Someone must choose, and the choice drives the policy | slide |
| 4 | Takeaways and next | all | Takeaways; Monday is Lab 4 (bring laptops); the course's error-and-effort arc (the "Whole Arc" style slide gets one DP line) | slide |
| 5 | Buffer | — | — | — |
| **75** | | | | |

## 6. Anchor example (computed)

Scripts: `scripts/reservoir_anchor_final.jl` (deterministic), `scripts/reservoir_dp.jl` (stochastic and tree check), `scripts/reservoir_timing.jl` (choice of timing convention).

- **Set-up:**
  - Capacity 4 units; start full; three months with inflows 1, 1, 0.
  - Release at the start of each month, then the inflow arrives; anything above 4 spills.
  - Benefit by release: 0, 6, 10, 12, 13 (nothing beyond 4). Integers, so the board arithmetic stays clean.
- **Deterministic:**
  - $V_3 = (0, 6, 10, 12, 13)$; $V_2 = (6, 12, 16, 20, 22)$, policy (0, 1, 1, 2, 2); $V_1 = (12, 18, 22, 26, 30)$, policy (0, 1, 1, 1, 2).
  - Optimal path 2, 2, 2 for **30**, unique by brute force. Greedy 4, 1, 1 for **25**.
- **Robustness:**
  - The same optimum and path on storage grids of 1, 0.5 and 0.25 units, with benefit interpolated linearly.
  - Terminal value of 0 or 3 per unit leaves the policy unchanged; 6 per unit flips it to 1, 1, 0.
  - The policy table has ties at some storage levels (for example month 2, storage 2: release 1 or 2 both give 16). State the tie rule (smaller release first) in the notes. The optimal *path* has no ties.
- **Stochastic** (inflow 0 or 2 each month, $p = 1/2$, release before inflow):
  - $V_1 = (10, 16, 21, 25, 28.25)$, with first release 2 from full storage.
  - The scenario-tree enumeration gives the same 28.25 (and 21.00 from a start of 2).
  - Release-everything gets 23.00; "never release more than 1" gets 18.00.
  - The result doesn't change on grids of 1, 0.5 and 0.25.
- **Why this timing convention:** releasing *after* the inflow (the first draft) made the deterministic case trivial from a full start, and inconsistent with the stochastic case. One convention throughout avoids a confusing switch (`reservoir_timing.jl`).

## 7. Code level

- About 8 code cells:
  - the problem set-up, visible;
  - the backward-induction function, visible and about 15 lines (`V = zeros(n_levels, n_months + 1)`, `policy = zeros(Int, n_levels, n_months)`, filled by index);
  - the brute-force check (folded);
  - the release comparison figure (folded);
  - the stochastic version (folded; the same loop with an expectation);
  - the tree enumeration check (folded);
  - the tree-size table (computed);
  - the terminal-value sweep (folded).
- **House rules:** code first on every slide; arrays pre-allocated; whole numbers without decimals (`benefit_table = [0, 6, 10, 12, 13]`, `capacity = 4`); figure code folded; Palatino defaults and palette from 07-2.

## 8. Checks for understanding

- **Poll:** "Can you beat greedy's 25?" (before any method).
- **Board:** students compute $V_2(3)$ before the reveal (expected 20, release 2).
- **Hedging question:** "The reservoir is full and rain might come. Why release only 2?"

## 9. Appendix candidates

- The general Bellman recursion $V_t(s) = \max_r \{ b(r) + \mathbb{E}[V_{t+1}(s')] \}$, for students who want the notation.
- **Curse of dimensionality:** two reservoirs at 5 levels is 25 states; ten reservoirs is about 9.8 million. Why DP is not free either.
- The lake as a DP: state $P_t$, decision $L_t$, transition from week 3. A sketch, not solved.

## 10. Cut list (in order)

1. The brute-force check (say it; skip the slide).
2. The terminal-value trap (move it to the notes and say it in one line).
3. The month-1 code walkthrough (show the result only).
4. Shorten the stochastic section to the policy plus the tree comparison.

## 11. Decisions for the instructor (recommendation first)

1. **The anchor is a three-month, 5-level reservoir with integer benefits, solved by hand for one month** — *recommended* over the lake loading problem. Evidence: it can be computed by hand (integer tables), it has a unique optimum (30 against greedy's 25), it doesn't change with grid size, and it is the same system as Lab 4. The lake is a nonlinear, continuous state with hysteresis, too heavy for a first DP; keep it as a "where else" slide.
2. **One timing convention (release, then inflow)** — *recommended*. Evidence: with release-after-inflow, the deterministic case from a full start is trivial (greedy is optimal), and the stochastic case needs release-before anyway.
3. **Confirm Lab 4 builds on this exact model and code** (a longer horizon and inflow scenarios). The lab is still to be designed; designing both together avoids two vocabularies.
4. **Terminal value 0 as the default**, with the trap slide showing that 6 per unit flips the policy — *recommended*. "End of the dry season; the reservoir refills in winter" justifies 0.

---

# Outline: Mon Nov 30, "Multiple Objectives, Robustness, and Sensitivity"

## 1. Header

| | |
|:--|:--|
| **Date** | Mon Nov 30, 2026; first session after Thanksgiving (Lab 4 was Mon Nov 23; no class Nov 25) |
| **Minutes** | 75 |
| **Teaches** | Instructor |
| **Sources** | The MOO half of `slides/lecture13-2-limits-optimization.qmd` (FA25 "Multiple Objectives", Lecture 18). Its limits half goes to Dec 2. Plus `slides/lecture14-1-sensitivity-analysis.qmd` (FA25, Lecture 19). |
| **Status** | Revise: merge 2 → 1. The schedule flags this as the most over-subscribed session, so it keeps the conceptual thread and pushes formal Morris/Sobol' to a reading. |
| **Proposed deck** | New file `lecture15-1-multiple-objectives-robustness.qmd`; filenames follow week and session. Lecture number: one less than FA25's, per schedule open item 6. |

## 2. Measurement of the sources

Header counts below come from code-stripped source, and include section titles.

| Source | Headers | Section titles | Code cells | What it held |
|:--|--:|--:|--:|:--|
| `lecture13-2` | 45 | 7 | 8 | ~19 content slides of "limits of MP" (Dec 2), ~17 of MOO |
| `lecture14-1` | 48 | 6 | 7 | Deep uncertainty, SA modes, OAT/local/global, Morris, Sobol', CO₂ example |

That is roughly 60 content slides of material for one 75-minute session. FA26 delivered decks run 24–31 slides per 75 minutes (Oct 7: 30; Oct 14: 27; Oct 19: 24). The target is **~29 slides including section titles**.

**Reusable, the instructor's motivating material (keep):**
- The MOO examples: power systems, reservoir operations.
- "What does it mean to optimize two objectives?"
- The CO₂-in-2100 poll and "Why can't we agree?".
- The Twain line and the Rumsfeld "known knowns" quote, with their translation.
- The Saltelli definition of SA.
- Factor prioritization, fixing and mapping, with the Reed et al. (2022) figure.
- "Shadow prices are sensitivities".
- The local and global SA figures.

**Wrong or stale (checked):**

1. **13-2's lake tradeoff figure plots the wrong quantity.** The y-axis says "Probability of Eutrophication", but `lake_eval` returns the *mean end-of-horizon P concentration*. `Xcrit` is computed and never used. Re-run with FA25's settings (σ = 0.15, 100 random plans, seed 1):
   - the plotted quantity spans 0.120–0.217;
   - the actual P(end > Xcrit) is **0.000 for every one of the 100 plans**.
   
   There is no probability tradeoff in that example at all. Script: `scripts/source_checks.jl`.
2. **The dominance definition is wrong** (13-2 slide 35, repeated in 14-1's review). It says "x is dominated if ∃y with Zᵢ(x) > Zᵢ(y) for **every** i". That is wrong in two ways:
   - It assumes every objective is minimized, but the lake example maximizes release.
   - Requiring strict improvement on every objective misses weak dominance.
   
   The standard definition: y dominates x if y is at least as good on every objective and strictly better on at least one. The by-hand table below is built so the FA25 definition gives the wrong answer for plan E.
3. **13-2's Pareto code breaks the pre-allocation rule.** It starts `pareto = obj[1:1, :]` and then calls `push!`.
4. **14-1's Sobol' formulas are wrong.**
   - The first-order index is written Var₍xᵢ₎[E₍x~ᵢ₎(xᵢ)]/Var(y); it should be Var₍xᵢ₎[E₍x~ᵢ₎(y | xᵢ)]/Var(y).
   - The "second-order" formula as written is the *closed* index, which still contains both first-order effects.
   - This matters only if the formulas stay; the recommendation is a reading.
5. **14-1's Sobol' figure is mislabelled.**
   - The lower panel is titled "Sensitivity Index Variances" but plots total-order indices.
   - It uses a log y-axis with `ylimits=(0, 1)`.
   - Every bar has +0.01 added.
6. **14-1's `lake_sens` can find the wrong root.** `find_zero(crit, 0.5)` lands on the wrong root at 1 of 121 (q, b) grid points across its own SA ranges. Minor.
7. **14-1's shadow-price slide uses FA25's product-mix LP.** FA26's LP anchors are the plume-emissions LP (Oct 14/19) and HW7's stormwater LP. Swap, so the callback is to work students did. HW7 Problem 2.4 already showed that a shadow price holds only for the first 2 acres.
8. **Old house style.** FA25 font (Computer Modern) and `Pkg.activate(".")`. Copy the FA26 front matter and setup from `lecture07-2-model-validation.qmd`: Palatino, `cb_*` palette, `@__DIR__`.
9. **FA25 lake setting is a cliff, not a tradeoff.** At σ = 0.25 (15-2) or 0.15 (13-2), the baseline lake's tradeoff is a cliff (see §6). That doesn't show a front well.

## 3. Takeaways (claims)

1. **With competing objectives there is no single optimum.** One plan dominates another only if it is at least as good on every objective and strictly better on one. The plans nothing dominates are the **Pareto front**, and each is a different tradeoff.
2. **Choosing among Pareto plans is a value judgment, not a calculation.** Weighting objectives in advance (*a priori*) and choosing from the front afterwards (*a posteriori*) are positions about *when* that judgment is made, and each has costs.
3. **A plan that is optimal under one set of assumptions can fail under others.** Robustness asks how a plan performs across many plausible futures, and robustness trades off against performance. The lake's baseline-optimal plan keeps the lake clear in fewer than half (0.47) of plausible futures.
4. **Sensitivity analysis asks three questions:**
   - which uncertain inputs drive the outcome (prioritization);
   - which can be fixed (fixing);
   - which values cause failure (mapping).
   
   Its answer depends on the ranges you assume.
5. **Deep uncertainty (no agreed probabilities) is why we test across futures instead of averaging over them.** Contrast Nov 16, where scenario probabilities were given.

## 4. What it feeds and what assesses it

- **Quiz 6 (Mon Dec 7)** covers Nov 16, 18 and 30 and Dec 2 (Lab 4 is not assessed). Precedent: FA23 Final Problem 1 (8 pts), "which reservoir policies are non-dominated?", with 4 policies and 3 objectives; the answer is {B, D}. The quiz could reuse that format with new numbers.
  - The lecture's by-hand table uses different numbers, so it rehearses the question without answering it.
  - The pairing with "objective vs metric" can call back to Oct 14's "Objectives and Metrics" slide.
- **Project final report (Dec 20).** Its Discussion section asks "how assumptions made in your project may have influenced the results". The sensitivity and robustness ideas here are the tools for that.
- **No homework** in weeks 13–16, by design.
- **ABET:** 4b (tradeoffs) is evaluated on MP2, not here. This session supports that thinking but is not an artifact; no ABET framing on slides.

## 5. Section plan (75 min)

| Min | Section | Takeaway | Content moves | Board / slide |
|--:|:--|:--:|:--|:--|
| 5 | **Review + Questions**: one slide. Nov 16–18 made decisions when the probabilities were given (scenario trees, DP). Today: objectives compete, and the probabilities aren't agreed. Poll. | — | Review carries only what this builds on | slide |
| 22 | **Multiple objectives** (details below) | 1, 2 | Question naming the issue, do it once by hand, anchoring number, positions | **Board**: the dominance table (prompt slide, answer fragment, working in notes). **Tablet**: circle the front on the scatter |
| 10 | **Deep uncertainty**: the instructor's CO₂-2100 poll; "why can't we agree?"; known knowns / unknown unknowns, compressed to one slide; definition; contrast with Nov 16 (there, the scenario probabilities were inputs) | 5 | Motivation before mechanism | slide + poll |
| 15 | **Robustness** (details below) | 3 | Interpretation slide, explicit scope, anchoring number | slide; tablet on the results |
| 18 | **Sensitivity analysis** (details below) | 4 | Trap named, callback, verification | slide; board for the shadow-price sketch, optional |
| 5 | **Takeaways; next** (Dec 2: limits of optimization; Dec 7: wrap-up and Quiz 6); **assessments** (presentation video Dec 8, report Dec 20) | — | — | slide |
| **75** | | | | |

**Multiple objectives (22 min):**
- The instructor's examples (power systems; reservoir operations), then "what does it mean to optimize two objectives?".
- The corrected dominance definition.
- **By hand**: five stormwater plans, three metrics (§6).
- The lake: 441 two-period release plans plotted as release against reliability, with the front highlighted.
- "Same total release, different timing": reliability ranges 0.00–0.92.
- *A priori* weights vs *a posteriori* choice, laid out as positions.

**Robustness (15 min):**
- Take three plans from the baseline front and test each across 500 plausible lakes, drawing q, b, the inflow median and the inflow variability.
- Robustness = the share of futures in which reliability stays ≥ 0.9.
- Results: 0.47 / 0.59 / 0.92 (the zero-release plan scores 0.92).
- So robustness is another objective with its own tradeoff.
- What robustness doesn't tell you: which future we are in.

**Sensitivity analysis (18 min):**
- Saltelli's definition, and the three modes (Reed et al. figure).
- **Factor map**: the aggressive plan's successes and failures by q and b.
- **Prioritization**: the spread in success across each factor's range (q 0.81, b 0.32, median inflow 0.31, σ 0.22).
- **Trap**: halve q's range and b becomes the most important factor (0.54 vs 0.48). SA results depend on the ranges chosen.
- **Callback**: a shadow price is a *local, one-at-a-time* sensitivity. HW7's 4-acre lease showed where that breaks.
- One slide on one-at-a-time vs all-at-a-time and local vs global. Morris/Sobol' go to a reading.

**Slide budget** (section titles count as slides):
- Review 2; MOO 9; deep uncertainty 3; robustness 5; SA 6; wrap 3.
- 4 section titles, 1 references slide.
- **≈ 33 including the title slide.** That is about 2 over the 31 house figure. The cut list below gets it to 30.

## 6. Anchor examples (all numbers computed)

### a) By-hand table (new numbers; not FA23's)

| Plan | Cost (\$M/yr), min | P removed (kg/yr), max | Overflows (/yr), min |
|:--|--:|--:|--:|
| A | 2.0 | 30 | 6 |
| B | 2.5 | 40 | 4 |
| C | 2.6 | 35 | 5 |
| D | 1.8 | 25 | 6 |
| E | 3.0 | 40 | 4 |

- **Non-dominated: {A, B, D}.**
- **C** is dominated by B: cheaper, more phosphorus removed, fewer overflows.
- **E** is dominated by B: it ties on phosphorus and overflows and costs more. FA25's strict-on-every-objective definition would wrongly keep E.
- Stormwater ties back to HW6 and HW7.

### b) The shallow lake (students know it from Weeks 2–3 and HW3; Dec 2 reuses it)

**Setup:**
- Model: Xₜ₊₁ = Xₜ + aₜ + yₜ + Xₜ^q/(1+Xₜ^q) − bXₜ, with q = 2.5 and b = 0.4. The threshold Xcrit = 0.668.
- Inflows: yₜ ~ LogNormal(log 0.03, **0.5**), so the median is 0.03 and the mean 0.034.
- 100 years and 1,000 inflow sequences.
- Reliability = the share of inflow sequences that never cross Xcrit.
- Plans: release a₁ in years 1–50 and a₂ in years 51–100, each from 0 to 0.05 in steps of 0.0025, giving 441 plans.

**Front** (`scripts/nov30_front_sigma.jl`):
- **20 non-dominated plans** with seed 1, and 22 with seed 2.
- The front runs from reliability 1.00 at a mean release of 0.025, through 0.92 at 0.0338, to 0.26 at 0.040, and to 0 by 0.045.
- The highest-release plan meeting 90% reliability is (0.035, 0.0325): mean release 0.0338, reliability 0.92 (0.93 with seed 2).
- **Anchoring number:** plans with that same mean release but different timing range from **0.00 to 0.92** in reliability.

**Robustness to settings** (`nov30_lake_moo.jl`, `nov30_sigma_sweep.jl`):
- At **σ = 0.25** (the FA25 setting), the "front" is a cliff:
  - reliability is about 1.0 up to a mean release of 0.040, then 0.38 at 0.0425 and 0.02 at 0.045;
  - only 6 plans are non-dominated;
  - this is identical across seeds 1–3, at 5,000 samples, and with the end-of-horizon definition.
- At σ = 0.75 the tradeoff is smooth, but the mean inflow rises to 0.040.
- A mean-preserving σ = 0.75 also works (49 non-dominated plans). See decision 1.

**Robustness across plausible lakes** (`nov30_robustness.jl`, `nov30_q_check.jl`):
- Futures drawn from q ∈ (2, 3), b ∈ (0.35, 0.45), median inflow ∈ (0.02, 0.04) and σ ∈ (0.25, 0.75), with common random inflows.
- Share of futures with reliability ≥ 0.9:

| Plan (a₁, a₂) | Baseline reliability | Robustness, three SOW sets (500/500/1,000) |
|:--|--:|:--|
| Aggressive (0.035, 0.0325) | 0.92 | 0.47 / 0.52 / 0.47 |
| Middle (0.03, 0.03) | 0.99 | 0.53 / 0.57 / 0.54 |
| Cautious (0.025, 0.0275) | 1.00 | 0.59 / 0.62 / 0.59 |
| Zero release | — | 0.92 |

- The cautious plan gives up 22% of the release (0.0263 against 0.0338) for +12 points of robustness. Robustness is another objective, with its own tradeoff.

**Factor mapping** (aggressive plan; success rate in the low vs high third of each factor's range):

| Factor | Low third | High third | Spread |
|:--|--:|--:|--:|
| q | 0.07 | 0.88 | **0.81** |
| b | 0.32 | 0.64 | 0.32 |
| Median inflow | 0.63 | 0.32 | 0.31 |
| σ | 0.58 | 0.37 | 0.22 |

- The mechanism students can see: a lower q lowers the threshold. Xcrit = 0.500 at q = 2, 0.668 at q = 2.5, and 0.758 at q = 3.
- In low-q futures even zero release succeeds in only 0.79 of them. Some futures can't be managed by release alone. That points to *measuring q* as the most valuable next step.

**The ranges trap:**
- With q's range narrowed to (2.25, 2.75), the spreads become q 0.48, **b 0.54**, median 0.47, σ 0.36.
- The ranking changes. This is the concrete version of 14-1's "design of experiments matters".

## 7. Code level

- Every figure cell is folded (`echo: true`, `code-fold: true`) and is the first thing on its slide. Only setup cells are hidden.
- The lake model and `reliability` are defined in the first lake slide's folded cell (scalar loops, results arrays pre-allocated with `zeros`).
- The non-dominated mask is pre-allocated (`falses(n)`); no `push!`.
- No decimals on whole numbers (`T = 100`, `n = 1000`); `Float64[...]` where floats are stored in place.
- Render cost: front plus SOWs take a few seconds; `freeze: auto`.
- Use common random numbers (one `randn` matrix, scaled per SOW), so policy comparisons aren't noise. Say so in the notes.

## 8. Checks for understanding

1. Board: "Which plans are non-dominated?" (the A–E table).
2. "Is the 0.92 plan *the* optimum?" Think-pair. The intended answer is the takeaway 2 position.
3. From the factor map: "If you could measure one thing about this lake, what would it be?" (q).

## 9. Appendix and reading candidates

- **Reading (recommended):**
  - Reed et al. (2022), *Addressing Uncertainty in Multisector Dynamics Research*, ch. 3 (SA modes, Morris, Sobol'). It is already cited in 14-1.
  - Saltelli et al. (2019), "Why so many published sensitivity analyses are false".
- **Appendix:** the corrected Morris and Sobol' formulas, only if the instructor wants them kept.
- **Appendix:** a regret-based robustness metric, as the alternative position to satisficing.
- **References:** `references.bib` has **no** Reed (2022) or Saltelli (2004, 2019) entries; the FA25 deck cites them as plain links. Add bib entries if they are cited on slides.

## 10. Cut list (in order)

1. The one-at-a-time vs all-at-a-time / local vs global slide → appendix.
2. The ranges-trap slide → speaker notes on the factor-mapping slide.
3. The "same total, different timing" slide → one sentence on the front slide.
4. The zero-release robustness line → notes.

## 11. Decisions for the instructor

1. **Lake inflow variability.**
   - *Recommendation:* σ = 0.5 (median inflow 0.03), and use the same setting on Dec 2.
   - *Why:* at FA25's σ = 0.25 the tradeoff is a cliff, with only 6 non-dominated plans and reliability falling from 1.0 to 0.02 within 0.005 of release. That makes a poor front, though it does make the *tipping point* vivid.
   - *Alternative:* keep σ = 0.25 and teach the cliff explicitly as a threshold. But then the robustness and front slides lose their gradient.
2. **Robustness metric.**
   - *Recommendation:* satisficing, the share of futures meeting reliability ≥ 0.9. It is one number and easy to explain.
   - Mention regret as a second position in the notes.
3. **Morris/Sobol'.**
   - *Recommendation:* a reading, per the schedule note, with no formulas on slides.
   - *Alternative:* an appendix with corrected formulas and the plots fixed.
4. **13-2's FA25 random-plan scatter is wrong as an example** (§2, item 1).
   - *Recommendation:* replace it with the 441-plan two-period scatter (§6b).

---

# Outline: Wed Dec 2, "Limits of Optimization and Course Synthesis" (revised Oct 6)

## 1. Header

| | |
|:--|:--|
| **Date** | Wed Dec 2, 2026 (week 15); the **last lecture** the instructor gives (Dec 7 is a TA-run project session) |
| **Minutes** | 75 |
| **Teaches** | Instructor |
| **Sources** | The limits half of `slides/lecture13-2-limits-optimization.qmd` (FA25 Lecture 18), `slides/lecture15-2-simulation-optimization.qmd` (FA25 Lecture 20, including its "Class Wrap-Up" slides), and the synthesis material from the former Dec 7 wrap-up outline |
| **Status** | Revise: split, recompose, and absorb the wrap-up |
| **Proposed deck** | `lecture15-2-limits-of-optimization.qmd` (title "Limits of Optimization and Course Synthesis"); the FA25 `lecture15-2-simulation-optimization.qmd` stays in place, unlinked |

## 2. What changed from the first draft

- The first draft was ~38 slides of limits material before cuts (target 31). Absorbing the synthesis means cutting harder, not adding: the emergence slide, the separate bifurcation and feedback recalls, two of three meme slides, the step-size table (to notes), the 40k-evaluation row and the sample-size slide (to notes), and the lake traced through the term (one line in the notes) all go.
- The synthesis replaces the first draft's "What is an optimum for?" section, which was already the Ackoff callback; the emissions LP re-solve makes that callback concrete.
- The project activity moves to Dec 7.
- Source-deck errors (sign bug, q/b swap, lognormal parameters, hand-placed gradient iterates, stale logistics) are as listed in the first draft; all are fixed in the build.

## 3. Takeaways (claims)

1. **Mathematical programming needs structure that many environmental systems lack**: closed-form objectives and constraints with linear or convex geometry. Thresholds, feedbacks and uncertain inputs break it.
2. **Search algorithms work on any simulation model but guarantee nothing.** Where they stop depends on the start and the tuning, and only a known-answer check tells you whether they found the optimum.
3. **Fewer, better-chosen decision variables often beat brute-force search.** On the lake, one constant release (0.0345) meets the reliability limit; the 100-variable search, after 10,000 model runs, returns a plan that tips the lake in two-thirds of fresh futures.
4. **Every prescription inherits its description.** The Oct 14 emissions plan changes completely (removals, cost, *which receptors bind*) when the plume model's stability class changes, and the typical-night plan fails on a stable night.
5. **Every method in the course has a characteristic error and a check for it**, and only some errors shrink with more computing; the checks are part of the work.

## 4. What it feeds and what assesses it

- **Quiz 6 (Dec 7)** covers this session's limits material (Dec 2 is outside the quiz's own week). The synthesis is review and is not a separate quiz topic.
- **Project report (Dec 20)**: the Discussion section asks how assumptions influenced the results; takeaways 4 and 5 are the tools, and Dec 7's activity applies them.

## 5. Section plan (75 min)

| Min | Section | Takeaway | Content moves | Board / slide |
|--:|:--|:--:|:--|:--|
| 3 | **Review + Questions**: Nov 30 in one slide; poll | — | — | slide |
| 8 | **When can't we write the problem down?** Pros and cons of MP (instructor's slide); Challenge 1; "the lake as an MP?" (board); uncertain inputs; upshot | 1 | Motivation before mechanism; question naming the issue | **Board**: the lake question (prompt, answer fragment, notes) |
| 10 | **Searching instead of solving**: generalized search; gradient descent with computed iterates (from x = 0 → local minimum −2.362; from x = 1 → global 3.693; step size in the notes); evolutionary search in one line; one drawbacks meme | 2 | Do it once (computed); trap named | slide; tablet on the descent figure |
| 20 | **Simulation-optimization of the lake** (σ = 0.5, as Nov 30): definition; corrected setup; **known-answer check** (minimize release: true answer 0, search returns 0.036–0.038); the real run (plan tips the lake in 0.67 / 0.91 of fresh futures); **one constant release, 0.0345**, meets the limit (0.086 fresh); the horizon (0.034 for 95 years, then 0.075) | 2, 3 | Verification as a named step; interpretation; anchoring numbers | slide; tablet on trajectories |
| 10 | **An optimum is only as good as its model**: Ackoff callback (Oct 14); the emissions LP re-solved under classes F, D and B (one folded cell, table below); "who chose the description?"; class D's plan on a class F night: 303 / 306 / 211 µg/m³, all above 196 | 4 | Callback; concrete anchoring number; interpretation | slide; tablet on the table |
| 14 | **The whole arc**: descriptive-methods table, then prescriptive-methods table (answers / characteristic error / check), revealed row by row; check: "which of these errors shrinks with more computing time?"; your closing "Content" and "Themes" slides with the six learning outcomes in student terms | 5 | Cross-course comparison table; check for understanding | slide (incremental rows) |
| 5 | **Takeaways; next** (Dec 7: Quiz 6 and a project session with the TA; Dec 8 video; Dec 20 report and self/peer evaluations) | — | — | slide |
| 5 | Buffer | — | — | — |
| **75** | | | | |

**Slide budget:** review 2; limits 4; search 4; sim-opt 7; optimum 3; arc 3; wrap 2; 5 section titles; title and references → **~31**.

## 6. Anchor examples (all computed; scripts in `slides/.handoff/outlines-2026-10-06/scripts/`)

**Gradient descent** (`dec2_gradient.jl`), f(x) = 4x⁴ − 10(x+2)³ − 6(x−15)² + 2(x+4)²: local minimum x = −2.362 (f = −1678.3), global minimum 3.693 (f = −1749.8), basin boundary 0.544; from −4 a step of 0.005 overshoots into the other basin; from 0 a step of 0.02 diverges.

**Lake simulation-optimization** (σ = 0.5; `dec2_lake_simopt_sigma.jl`, `dec2_lake_simopt_40k.jl`):

| Run | Mean release | P(tipped), fresh 10,000 |
|:--|--:|--:|
| As written (minimizes), seeds 1 / 2 | 0.0376 / 0.0360 | 0.400 / 0.176 |
| Corrected (maximizes), 10k, seeds 1 / 2 | 0.0369 / 0.0397 | 0.667 / 0.913 |
| Corrected, 40k, seed 1 (notes) | 0.0351 | 0.274 |
| **Best constant release** | **0.0345** | **0.086** |

Horizon: best "constant, then last 5 years" rule releases 0.034, then 0.075 (σ = 0.25: 0.041 then 0.090). Sample size (notes): fit to 100 samples, the chosen plan's true risk ranges 0.089–0.171.

**Emissions LP under three stability classes** (`dec7_plume_lp_classes.jl`; same stacks, receptors, emissions, costs and standard as Oct 14):

| Plume model | Removals (R₁, R₂) | Cost | Binding receptors |
|:--|:--|--:|:--|
| Class F (Oct 14) | (45.2, 26.7) g/s | \$1.705M/yr | B, C (shadow prices −2.15, −0.37) |
| Class D | (32.7, 27.0) g/s | \$1.463M/yr | A, C (−0.93, −2.83) |
| Class B | (0, 0) | \$0 | none |

Robustness: F's plan on a D night 57 / 129 / 156 µg/m³ and on a B night 46 / 13 / 18 (both comply); **D's plan on an F night 303 / 306 / 211** (all exceed 196).

**Whole-arc tables:**

| Method (when) | Answers | Characteristic error | Check |
|:--|:--|:--|:--|
| Forward Euler (Sep 14–16) | DO along a river | O(Δt) | Halve the step, the error halves |
| Monte Carlo (Sep 23–28) | P(exceedance), risk | O(n^{−1/2}) | CI half-width; 4× samples halves it |
| Closed form on a grid (Oct 5) | Where and how large the exceedance is | Grid: the peak is sensitive, the area isn't (5.0 km²) | Refine for the question asked |
| Calibration (Oct 7) | Parameter values | Doesn't shrink with effort (non-identifiable) | Controls; held-out data; face validity |

| Method (when) | Answers | Characteristic error | Check |
|:--|:--|:--|:--|
| LP (Oct 14–19) | Least-cost plan | Exact *given* the model | Shadow prices, valid only locally (HW7: 4 × 25 ≠ actual 50) |
| MIP (Nov 4) | Discrete choices | Optimality gap | LP relaxation bound |
| Stochastic programming (Nov 16) | A plan when probabilities are known | Which scenarios and probabilities represent the uncertainty | VSS and EVPI |
| Dynamic programming (Nov 18) | A policy for sequential decisions | End-of-horizon value; state grid; curse of dimensionality | Brute force or the tree on a small case; vary the terminal value |
| Multiple objectives, robustness, SA (Nov 30) | Tradeoffs; what matters | No single optimum; results depend on assumed ranges | Pareto front; vary the ranges |
| Simulation-optimization (Dec 2) | Anything we can simulate | No guarantee: local optima, horizon, sampling noise | Known-answer check; fresh samples |

## 7. Code level

- Folded figure cells first on each slide; only setup hidden. The lake function is shared with Nov 30 (copy, or `include` a shared file under `slides/`).
- DE cells are slow (35–50 s each): `freeze: auto`, fixed seeds, code folded.
- One emissions-LP cell (JuMP + HiGHS, ~1 s) reusing the Oct 14 plume functions; results pre-allocated (`zeros(3, 2)`), table via `output: asis`.
- No decimals on whole numbers.

## 8. Checks for understanding

1. "Two students run gradient descent on the same function and get different answers. Who is wrong?"
2. Before the known-answer check: "How would you know whether the optimizer found the optimum?"
3. "Who chose the description, and did they know they were choosing the plan?" (after the stability-class table)
4. On the arc tables: "Which of these errors shrinks if you spend more computing time?"

## 9. Appendix and reading

- Appendix: the noisy "quick example" with its known answer (2.117; DE returns 1.76–2.00); the Quinn et al. (2017) decision-rule formula; the step-size table.
- Reading: Ackoff (1979), already in `references.bib`. Remove the duplicate `Quinn2017-vn` before citing it.

## 10. Cut list (in order)

1. The horizon slide → one sentence in the sim-opt notes.
2. Gradient descent → one figure with both starts, no step-size discussion.
3. The descriptive-methods table → shown briefly, prescriptive table in full.
4. The class B row (keep F and D, which carry the point).

## 11. Decisions for the instructor

1. Show the sign bug as a known-answer check (decision 25 above).
2. Synthesis as the session's last 24 minutes, anchored on the emissions LP (decision 27).
3. One meme slide (decision 26).

---

# Outline: Mon Dec 7, "Quiz 6 and Project Session" (TA-run activity; revised Oct 6)

## 1. Header

| | |
|:--|:--|
| **Date** | Mon Dec 7, 2026 (week 16; last class meeting) |
| **Minutes** | 75: Quiz 6 (25) + project session (50) |
| **Runs it** | **TA** — the instructor is travelling |
| **Deck** | New, small activity deck `activity-project-session.qmd` (about 6 slides), styled like `activity-proposal-peer-review`, with full notes and timings for the TA |
| **What follows** | Presentation videos due Tue Dec 8 at 9pm (final-exam slot); presentation peer reviews in Canvas from Dec 10; final report, self-assessment and peer evaluations due Dec 20 |

## 2. Why this shape

- The wrap-up lecture's content moved into Dec 2, the last lecture the instructor gives.
- A project session needs no lecturing, so the TA can run it, and it lands the week the videos are due.
- Quiz 6 on an activity session follows the rule used for every other quiz host (the 25-minute loss lands on an activity, not on new material). It does break the schedule's "no quiz in a travel week" rule; see decision 28.

## 3. Session plan

| Min | Part | What happens | Materials |
|--:|:--|:--|:--|
| 25 | **Quiz 6** (TA proctors) | Covers Nov 16, 18, 30 and Dec 2 | Printed quiz |
| 5 | **Logistics** | Video due Dec 8 at 9pm; peer reviews from Dec 10; report, self-assessment and peer evaluation due Dec 20; where the rubrics are | 1 slide |
| 15 | **Your project through the course's checks** | 2 min alone, 8 in groups, 5 for two or three groups to share. Four questions: (1) What is your descriptive model, and what is your method? (2) Which single assumption would most change your recommendation? (3) Which check would reveal it: refining, validating, sensitivity, or robustness? (4) Who is affected if it's wrong? Each group leaves with a draft of the report's Discussion paragraph | 2 slides (prompt; the four questions) |
| 30 | **Supervised work time** | Groups finish videos and reports; the TA circulates. Course evaluations here if open (5 min) | 1 slide |
| **75** | | | |

## 4. What the TA needs

- Speaker notes with timings, the four questions with an example answer for one past project type, and the logistics with links.
- The report's Discussion-section requirement quoted on the slide, so the activity's output is clearly useful.
- No grading: the activity is ungraded (optionally, groups post their draft paragraph to Ed so the instructor can comment).

## 5. Decisions for the instructor

- Quiz 6 on Dec 7 with the TA (decision 28), or one of its alternatives.
- Whether groups post the draft Discussion paragraph (recommended, ungraded: it gives you something to comment on before Dec 20).

