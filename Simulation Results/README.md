# Simulation Results and Analysis

## 1. Overview

This section presents the results of a 24-hour MATLAB/Simulink simulation of a **100 kW photovoltaic (PV) system integrated with a 400 kWh Vanadium Redox Flow Battery (VRFB)**.

The simulation was conducted using the selected input scenario for **21 June 2023 in Medway, UK**, to evaluate grid power interaction, battery State of Charge (SOC), and economic performance.

## 2. PV and Grid Power Interaction

![Grid Power](../images/Grid_Power.png)

*Figure 1. Grid power interaction over the 24-hour simulation.*

The grid power profile illustrates the dynamic exchange of electricity between the PV–VRFB microgrid and the utility grid. Positive grid power indicates electricity exported to the grid, while negative values represent electricity imported from the grid.

The simulation can be divided into four operating phases:

| Period | Operating Behaviour |
|---|---|
| 0–5.8 h | Grid imports electricity to satisfy load demand when solar generation is unavailable. |
| 5.8–8.5 h | Increasing PV generation gradually reduces grid dependence. |
| 8.5–17.5 h | Surplus photovoltaic power is exported to the grid, reaching approximately 35 kW. |
| 17.5–24 h | Battery discharge supports evening demand, followed by grid imports when the battery reaches its lower SOC limit. |

The results illustrate how the energy management system coordinates photovoltaic generation, battery storage, and electricity exchange with the utility grid.

## 3. Battery SOC Performance

![Battery SOC](../images/Battery_SOC.png)

*Figure 2. Battery State of Charge (SOC) during the 24-hour simulation.*

The SOC profile demonstrates the charging and discharging behaviour of the 400 kWh VRFB throughout the simulation.

The battery begins with an initial SOC of **50%**, while the energy management controller applies operating thresholds of **20% and 80%**.

Four main operating phases can be identified:

| Period | Battery Behaviour |
|---|---|
| 0–5.8 h | The battery discharges to support load demand until SOC reaches 20%. |
| 5.8–8.5 h | Surplus PV generation charges the battery, increasing SOC towards 80%. |
| 8.5–17.5 h | SOC remains at approximately 80%, and excess photovoltaic power is exported to the grid. |
| 17.5–24 h | The battery discharges during evening demand until the lower operating threshold is reached. |

The results demonstrate the controller's operation under the defined SOC limits and its contribution to energy management.

## 4. Overall Financial Simulation Results

![Overall Financial Results](../images/Overall_Financial_Results.png)

*Figure 3. Combined 24-hour economic simulation results showing cumulative electricity export revenue, import costs, and net electricity trading cash flow.*

The financial simulation evaluates the electricity trading performance of the proposed PV–VRFB system over the selected 24-hour period.

The combined financial results illustrate three operating phases:

### M1 – Early Morning (0–5 h)

During the early morning, photovoltaic generation is insufficient to meet electricity demand.

The system imports electricity from the utility grid, causing cumulative purchasing costs to increase and resulting in a negative net electricity cash flow.

### M2 – Daytime Operation (5–20.5 h)

As photovoltaic generation increases, the system becomes less dependent on grid electricity.

Surplus solar energy is used for battery charging, and additional electricity is exported to the grid when sufficient generation is available.

Cumulative export revenue increases while grid purchasing costs remain relatively stable. The net electricity cash flow becomes positive during this period.

### M3 – Evening Operation (20.5–24 h)

As photovoltaic generation decreases and the battery reaches its lower SOC operating threshold, the system resumes electricity imports from the grid.

The increasing electricity purchasing costs reduce the accumulated net cash flow towards the end of the simulation.

### Financial Results Summary

| Financial Parameter | Simulated Result |
|---|---:|
| Electricity Export Revenue | £112 |
| Electricity Import Cost | £65 |
| Daily Net Electricity Cash Flow | £47 |

The results illustrate the financial contribution of daytime solar generation and battery energy management under the assumed electricity tariff conditions.

## 5. Economic Feasibility and Payback Period

The initial capital expenditure (CAPEX) of the proposed PV–VRFB system was estimated as follows:

| Component | Estimated Cost |
|---|---:|
| 100 kW Photovoltaic System | £60,000 |
| 400 kWh VRFB Storage | £80,000 |
| Installation and Balance of System | £10,000 |
| **Total CAPEX** | **£150,000** |

Based on the simulated daily net electricity cash flow of £47, the annualised return was estimated by assuming similar daily performance throughout the year.

**Annualised Cash Flow = £47 × 365 = £17,155**

The simple payback period was calculated as:

**Simple Payback Period = £150,000 / £17,155 ≈ 8.7 years**

### Assumptions and Limitations

The analysis is based on a selected summer-day simulation rather than a full annual operating profile.

The annualised financial estimate assumes that the simulated daily performance remains constant throughout the year.

Seasonal solar variability, changes in electricity tariffs, operation and maintenance expenses, financing costs, and the time value of money were not explicitly included in the simple payback calculation.

Therefore, the estimated 8.7-year payback period represents a preliminary simulation-based feasibility estimate rather than a guaranteed investment return.

## 6. Conclusion

The simulation results demonstrate the coordinated operation of the photovoltaic system, battery storage, and utility grid under the selected operating conditions.

The energy management controller regulates battery charging and discharging while applying the defined SOC operating thresholds.

The combined financial simulation reports approximately **£47 of daily net electricity trading cash flow**, indicating the potential economic benefits of integrating PV generation with VRFB storage.

Further investigation using year-round solar and load data, detailed battery efficiency modelling, and lifecycle cost analysis would provide a more comprehensive assessment of the proposed system's long-term economic feasibility.
