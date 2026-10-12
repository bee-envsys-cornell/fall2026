# Checks behind data/hw09-outline.md (Oct 8). Run: julia +1.11.5 data/hw09-checks.jl

# ---------- Problem 1: activated carbon for an algal-bloom season ----------
# Spring order at `price`, emergency delivery at `emergency`, leftover worth `leftover` ($/ton).
function carbon(price, emergency, leftover; need=[30, 60, 120], prob=[0.3, 0.4, 0.3])
    cost_in(q, d) = price * q + emergency * max(d - q, 0) - leftover * max(q - d, 0)
    expected(q) = sum(prob[k] * cost_in(q, need[k]) for k in 1:3)
    orders = 0:1:150
    costs = [expected(q) for q in orders]
    average_plan = sum(prob .* need)
    perfect = sum(prob[k] * cost_in(need[k], need[k]) for k in 1:3)
    best = minimum(costs)
    return (average_plan=average_plan, average_plan_cost=expected(average_plan),
            best_order=orders[argmin(costs)], best_cost=best,
            vss=expected(average_plan) - best, evpi=best - perfect, perfect=perfect,
            cost_at_needs=[expected(d) for d in need],
            ratio=(emergency - price) / (emergency - leftover))
end
base = carbon(2000, 5500, 1000)
println("carbon: ", base)
for (p, e, s) in [(2000, 5000, 1000), (2000, 6000, 1000), (2000, 5500, 800), (2000, 5500, 1200),
                  (1800, 5500, 1000), (2200, 5500, 1000), (2000, 4500, 1000)]
    x = carbon(p, e, s)
    println("   prices ($p, $e, $s): best order $(x.best_order) t, VSS $(x.vss)")
end

# ---------- Problem 2: three-year site cleanup ----------
# Mass in units of 100 kg, 0..6. Next year's mass from the mass left after treatment:
# no change at 5-6 (degradation inhibited) or at 1 (too dilute); otherwise attenuation removes 1.
attenuate = [0, 1, 1, 2, 3, 5, 6]
treat_cost = [0, 10, 25, 45]          # $1,000 to remove 0..3 units in a year
monitor = 2                           # $1,000 per unit remaining at the end of each year
function all_plans(treat_cost, attenuate, monitor; start=6, target=1)
    results = Dict{Vector{Int},Float64}()
    for r1 in 0:min(3, start)
        m2 = attenuate[start - r1 + 1]
        for r2 in 0:min(3, m2)
            m3 = attenuate[m2 - r2 + 1]
            for r3 in 0:min(3, m3)
                m4 = attenuate[m3 - r3 + 1]
                if m4 <= target
                    results[[r1, r2, r3]] = treat_cost[r1 + 1] + treat_cost[r2 + 1] +
                        treat_cost[r3 + 1] + monitor * (m2 + m3 + m4)
                end
            end
        end
    end
    return sort(collect(results), by=x -> x[2])
end
ranked = all_plans(treat_cost, attenuate, monitor)
println("cleanup: best ", ranked[1], ", next ", ranked[2], ", spread 1-1-1 ",
    [v for (k, v) in ranked if k == [1, 1, 1]])
println("   waiting (no treatment in years 1-2) feasible? ", any(k[1] == 0 && k[2] == 0 for (k, v) in ranked))
for (tc, mon) in [([0, 10, 30, 60], 2), ([0, 8, 20, 40], 2), ([0, 12, 28, 50], 2), (treat_cost, 1), (treat_cost, 4)]
    r = all_plans(tc, attenuate, mon)
    println("   costs $tc, monitor $mon: best ", r[1], ", next ", r[2])
end
no_inhibition = all_plans(treat_cost, [0, 1, 1, 2, 3, 4, 5], monitor)
println("cleanup without inhibition: best ", no_inhibition[1], ", next ", no_inhibition[2])

# Backward induction tables (the hand calculation)
function backstep(next_value)
    value = fill(Inf, 7)
    best_removal = fill(-1, 7)
    for m in 0:6
        for r in 0:min(3, m)
            nxt = attenuate[m - r + 1]
            total = treat_cost[r + 1] + monitor * nxt + next_value[nxt + 1]
            if total < value[m + 1]
                value[m + 1] = total
                best_removal[m + 1] = r
            end
        end
    end
    return value, best_removal
end
end_value = [0.0, 0.0, Inf, Inf, Inf, Inf, Inf]      # the cleanup level: at most 1 unit after year 3
V3, R3 = backstep(end_value)
V2, R2 = backstep(V3)
V1, R1 = backstep(V2)
println("year 3 values $V3, removals $R3")
println("year 2 values $V2, removals $R2")
println("year 1 from 6 units: value $(V1[7]), removal $(R1[7])")
