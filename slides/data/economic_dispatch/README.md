# Economic dispatch data (lecture 10-2)

- `generators.csv`: the lecture's fleet. Minimum and maximum output (MW), variable cost (\$/MWh)
  and hourly ramp limit (MW) for 12 dispatchable plants, plus wind and solar.
  - The plants are rounded from real San Diego-area units in the Power Systems Optimization course
    data (Jenkins and Sepulveda). A 600 MW nuclear unit was added on October 11, 2026 and two
    combustion turbines that never ran were dropped.
  - Gas plant costs are at the 2022 U.S. gas price (since October 12, 2026): \$7.21 per MMBtu, the
    average delivered to power plants that year (EIA Electric Power Annual, Table 7.4). Each is the
    plant's variable O&M (\$3.40 for CCGT1 and CCGT3, \$4.30 for CCGT2, \$10.80 for CCGT4 and the
    CTs) plus its heat rate times \$7.21. The heat rates are the ones implied by the earlier costs,
    which were at \$2.57 per MMBtu: 23, 30, 22 and 36 \$/MWh for the CCGTs and 38, 39, 39, 40 and 45
    for the CTs.
  - Ramp limits are hourly planning-model values (nuclear 25% of capacity, CCGT 40%, the rest 100%).
- `gen_variability.csv`: hourly wind and solar capacity factors for the lecture's day.
- `2020_hourly_load_NY.csv`: NYISO hourly load by zone for 2020. The lecture shifts one day's load
  up by 600 MW and presents it as an illustrative fall day.
