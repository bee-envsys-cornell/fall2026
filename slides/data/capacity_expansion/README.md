# Capacity expansion data (lecture 11-1)

- `2020_hourly_load_NY.csv`: NYISO hourly load by zone for 2020, unmodified. The lecture uses
  column `C` (Zone C, Central).
- `generators.csv`: annualized fixed cost (\$/MW-yr), variable cost (\$/MWh) and emissions
  (t CO2/MWh) by plant type, with the fuel each burns, its heat rate (MMBtu/MWh) and its other
  variable cost (\$/MWh).
  - `VarCost` is at 2022 fuel prices (since October 12, 2026): natural gas \$7.21 and coal \$2.36 per
    MMBtu, the averages delivered to U.S. power plants that year (EIA Electric Power Annual, Table
    7.4). It equals `OtherVarCost + HeatRate × fuel price`, rounded to the dollar, and the lecture
    recomputes it from those columns for other gas prices.
  - CCGT and CT heat rates and other costs (6.27 and 9.12 MMBtu/MWh, \$3/MWh) are chosen so that the
    course's earlier costs, \$25 and \$35/MWh, come back at a \$3.50 gas price. Fixed costs for CCGT,
    CT, wind and solar are the course's values from earlier offerings; wind and solar match
    Mini-Project 2's "today" costs.
  - Coal (changed October 12, 2026): EIA's ultra-supercritical coal plant from the capital cost
    report for AEO2025, \$4,103/kW and \$61.60/kW-yr, which annualizes to \$392,000/MW-yr; heat rate
    8.638 MMBtu/MWh and \$6.40/MWh of other variable cost.
  - Geothermal (added October 12, 2026): \$3,963/kW and \$150.60/kW-yr from the same report,
    \$470,000/MW-yr, with no variable cost. EIA's reference plant is 50 MW; the lecture lets the model
    build any amount.
  - Nuclear (added October 2026): \$7,861/kW overnight cost and \$156.20/kW-yr fixed O&M from EIA's
    capital cost report for AEO2025, with an 8.06% capital charge (7% over 30 years), which also
    reproduces the CCGT value from the same report. Variable cost \$8/MWh, as in lecture 10-2.
  - Emission factors: coal 1, CCGT 0.43, CT 0.55 t/MWh, the course's values.
- `wind_solar_capacity_factors.csv`: one 365-day year of hourly wind and solar capacity factors,
  copied from the Fall 2025 homework 4 data. Its original source is not recorded. The averages are
  34% (wind) and 35% (solar): a good site, not New York's weather. The lecture uses it as it is and
  repeats February 28 for 2020's leap day.
- `gas_prices_monthly.csv`: monthly natural gas prices in dollars per million Btu, January 2019 to
  July 2026, downloaded from FRED on October 12, 2026. `UnitedStates` is the Henry Hub spot price
  (FRED series `MHHNGSP`, from the U.S. Energy Information Administration). `Europe` is the
  European natural gas price (FRED series `PNGASEUUSDM`, from the International Monetary Fund).
