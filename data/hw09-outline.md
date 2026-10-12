# HW9 outline: stochastic optimization and dynamic programming (drafted Oct 7, contexts revised and approved Oct 8; assignment and key drafted Oct 8 in `hw/hw09`, `hw/solutions/hw09`)

**Assigned** Wed Nov 18 · **due** Thu Dec 3, 9pm · 50 points · key posted Fri Dec 4, before Quiz 6 (Mon Dec 7).

**Covers** the Nov 16 lecture (two-stage stochastic programs on the farmer problem: recourse, the
stochastic plan, VSS, EVPI) and the Nov 18 lecture (backward induction on a three-month reservoir,
uncertain inflows, end-of-horizon value). Not Nov 30 or Dec 2: too close to the due date.

**Scope.** Light: one problem per lecture, mostly by hand, each with one short code check. It spans
Thanksgiving and lands in the project crunch before the Dec 8 presentations, so it should take about
a normal week's effort. Examples are new: not the farmer, not the reservoir, and not Lab 4's reservoir
operations under hydroclimatic uncertainty.

**Contexts (decided Oct 8):** activated carbon for an algal-bloom season, and a three-year site
cleanup. They replace the Oct 7 draft's road salt and fishery, which were less environmental
engineering.

**Precedent.** None on past exams for scenario trees or DP (see the Quiz 6 note in `schedule.md`). The
only past homework item is an earlier offering's HW5 (`website/hw/hw05`): draw a scenario tree for a
two-period dispatch and formulate the stochastic LP (6 points), with no solve.

Every number below comes from `data/hw09-checks.jl`.

## Problem 1: Activated carbon for an algal-bloom season (26 points)

A drinking-water plant on a lake prone to harmful algal blooms doses powdered activated carbon (PAC) to
remove cyanotoxins and taste-and-odour compounds. It orders PAC in spring at **\$2,000/ton**, before it
knows how bad the summer's bloom will be. A mild, moderate or severe bloom needs **30, 60 or 120 tons**,
with probabilities 0.3, 0.4 and 0.3. PAC delivered as an emergency during the bloom costs
**\$5,500/ton**; PAC left over in the fall is worth **\$1,000/ton** (it is kept for next year). Hook: the
2014 Toledo, Ohio "do not drink" advisory during a Lake Erie bloom.

The needs are plausible for a 20-million-gallon-a-day plant dosing about 13–26 mg/L for 30–60 bloom days.

Verified:

| Plan | Expected cost |
|:--|--:|
| Order 30 t | \$274,500 |
| Order 60 t | \$210,000 |
| Order 69 t (the average bloom's need) | \$206,850 |
| **Order 120 t (the stochastic plan)** | **\$189,000** |
| Perfect information (order each bloom's need) | \$138,000 |

**VSS = \$17,850 per season; EVPI = \$51,000 per season.** The best plan orders for the severe bloom even
though it has probability 0.3: a ton short costs \$3,500 more than ordering it in spring, while a ton
left over loses only \$1,000. The expected cost is piecewise linear in the order, with kinks at the three
needs, and its unique minimum is at 120 t.

Robustness: 120 t stays the best order for emergency prices of \$4,500–6,000, leftover values of
\$800–1,200 and spring prices of \$1,800–2,200. VSS ranges from \$7,650 to \$28,050 over that range;
it falls to \$2,550 at an emergency price of \$4,500.

Parts:

1. **(3)** Draw the scenario tree. Name the first-stage decision and the recourse decisions in each
   bloom.
2. **(4)** The order for each known bloom, its cost, and the expected cost with perfect information.
3. **(5)** The average-bloom plan (69 t): its cost in each bloom and its expected cost.
4. **(6)** Expected cost of ordering 30, 60 and 120 t. Which is cheapest, and why is ordering for the
   severe bloom cheapest even though a severe bloom is not the most likely?
5. **(4)** VSS and EVPI, each in a sentence: what modelling the uncertainty is worth, and the most the
   utility should pay for a perfect bloom forecast.
6. **(4)** Code check: write the two-stage problem as one LP in `JuMP` (the spring order, plus an
   emergency delivery and a leftover amount in each bloom), solve it, and confirm part 4.

## Problem 2: Cleaning up a contaminated site in three years (24 points)

A site's groundwater holds 6 units of a chlorinated solvent (1 unit = 100 kg). The regulator requires
at most **1 unit** to remain after three years. Each year the site can pump and treat up to 3 units, at
**\$0, 10k, 25k or 45k** to remove 0, 1, 2 or 3 units (costs rise steeply with the number of wells and
the pumping). Monitoring costs **\$2k per unit** still in the ground at the end of each year.

Between years, natural attenuation (biodegradation) acts on the mass left after treatment:

| Mass left after treatment | 0 | 1 | 2 | 3 | 4 | 5 | 6 |
|:--|--:|--:|--:|--:|--:|--:|--:|
| **Mass next year** | 0 | 1 | 1 | 2 | 3 | 5 | 6 |

Biodegradation is inhibited at high concentrations (nothing changes at 5–6 units) and too slow at very
low ones (1 unit stays 1); in between it removes 1 unit a year. This is the shape of Haldane kinetics,
and the reason real sites often remove part of the source and then rely on monitored natural attenuation.

Verified: the unique optimum removes **2 units in year 1 and nothing after**, for **\$37k** (mass 6 → 4,
then 3, 2, 1). The next best plan (2, 1, 0) costs \$45k, and spreading 1 unit a year costs \$48k.
Waiting cannot meet the deadline at all, and removing only 1 unit in year 1 leaves the mass stuck at 5,
where nothing degrades. The backward-induction tables:

| Mass at the start of the year | 0 | 1 | 2 | 3 | 4 | 5 | 6 |
|:--|--:|--:|--:|--:|--:|--:|--:|
| Year 3: cost to go (\$1,000) | 0 | 2 | 2 | 12 | 27 | 47 | infeasible |
| Year 3: best removal | 0 | 0 | 0 | 1 | 2 | 3 | — |
| Year 2: cost to go | 0 | 4 | 4 | 6 | 16 | 28 | 43 |
| Year 2: best removal | 0 | 0 | 0 | 0 | 1 | 1 | 2 |

Year 1 from 6 units: remove 2, cost to go \$37k. Robustness: (2, 0, 0) stays the unique optimum for
treatment costs of (10, 30, 60), (8, 20, 40) and (12, 28, 50) and for monitoring costs of \$1k–4k.
Without inhibition (next-year masses 0, 1, 1, 2, 3, 4, 5), the optimum becomes 1, 1, 0 at \$34k.

Parts:

1. **(3)** Two simple plans: remove 1 unit every year, and do nothing until year 3. What does each
   cost, and can each meet the deadline?
2. **(10)** Backward induction by hand: the year-3 table (including the starting masses from which the
   deadline cannot be met), the year-2 table with the best removal at each mass, then the year-1 decision
   from 6 units. Report the optimal plan and its cost.
3. **(3)** Why is removing 2 units at once in year 1 cheaper than spreading the same work out, when
   removal costs rise so steeply?
4. **(4)** Code check: try every removal sequence, or adapt the lecture's backward-induction code, and
   confirm part 2.
5. **(4)** Lab tests show the solvent does not inhibit biodegradation after all: attenuation removes 1
   unit a year at 5–6 units too. How does the best plan change, and why?

## Decisions for you

1. **Uncertainty in the DP.** Problem 2 is deterministic, to keep the work light. An uncertain version
   (attenuation that is fast or slow in a given year) would rehearse the lecture's "Releasing Before the
   Inflow Is Known", but adds a second table. *Recommended: leave it out*, since Lab 4 practises
   sequential decisions under uncertainty.
2. **Cut list,** if it needs to be lighter: Problem 2.5 first, then Problem 1.3 (keep the average-bloom
   plan's expected cost only), then Problem 1.6 (keep 2.4 as the only code).
