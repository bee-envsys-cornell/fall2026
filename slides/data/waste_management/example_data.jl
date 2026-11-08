# The example system: two cities, three facilities (1 = WTE, 2 = MRF, 3 = LF)
waste = [100, 170]                              # [Mg/day] produced by each city
capacity = [150, 130, 200]                      # [Mg/day] facility capacity
fixed_cost_year = [900_000, 400_000, 700_000]   # [$/yr] if the facility operates
fixed_cost = round.(Int, fixed_cost_year ./ 365)   # [$/day]
tipping = [60, 5, 40]                           # [$/Mg] handled at each facility
recycle_rate = 0.4                              # fraction of MRF input recycled
recycle_cost = 35                               # [$/Mg recycled]
ash_rate = 0.2                                  # WTE input left as ash
transport_rate = 1.5                            # [$/Mg-km]
city_distance = [15 5 30; 10 15 25]             # [km] from city i to facility j
mrf_to_wte, mrf_to_lf, wte_to_lf = 15, 32, 18   # [km] residual routes

# Cost of sending 1 Mg from city i to facility j: haul it, tip it, and
# (at the MRF) pay to recycle the fraction that is recovered
city_cost = zeros(2, 3)
for i in 1:2
    for j in 1:3
        city_cost[i, j] = transport_rate * city_distance[i, j] + tipping[j]
        if j == 2
            city_cost[i, j] = city_cost[i, j] + recycle_rate * recycle_cost
        end
    end
end
cost_R21 = transport_rate * mrf_to_wte + tipping[1]   # MRF residual to WTE
cost_R23 = transport_rate * mrf_to_lf + tipping[3]    # MRF residual to LF
cost_R13 = transport_rate * wte_to_lf + tipping[3]    # WTE ash to LF
