# Capacity expansion data (lecture 11-1)

- `2020_hourly_load_NY.csv`: NYISO hourly load by zone for 2020, unmodified. The lecture uses
  column `C` (Zone C, Central).
- `generators.csv`: annualized fixed cost (\$/MW-yr), variable cost (\$/MWh) and emissions
  (t CO2/MWh) by plant type.
  - Coal, CCGT, CT, wind and solar: the course's values from earlier offerings. Wind and solar match
    Mini-Project 2's "today" costs.
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
