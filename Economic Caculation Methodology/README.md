# Economic Calculation Methodology

The economic calculation module was developed in MATLAB/Simulink to evaluate the electricity trading performance of the proposed PV–VRFB microgrid.

The model consists of three calculation branches:

### 1. Electricity Export Revenue

Positive grid power (`P_grid > 0`) represents electricity exported to the utility grid.

The exported power is integrated over time and multiplied by the assumed electricity selling tariff to calculate cumulative export revenue.

### 2. Electricity Import Cost

Negative grid power (`P_grid < 0`) represents electricity imported from the grid.

The purchasing module uses a Time-of-Use (ToU) tariff mechanism implemented with Clock, Interval Test, and Switch blocks.

The assumed electricity import tariffs are:

- Off-peak: £0.12/kWh
- Peak: £0.32/kWh
- Peak period: 17:00–21:00

Imported power is converted into energy and evaluated using the applicable tariff to obtain the cumulative purchasing cost.

### 3. Net Electricity Cash Flow

The final calculation combines cumulative export revenue and import cost to determine the net financial outcome:

**Net Electricity Cash Flow = Export Revenue − Import Cost**

This calculation represents the net electricity trading cash flow and does not include additional operating and maintenance expenses.

## Simulation Results

The simulation outputs, financial results, and their interpretations are presented separately in the [Simulation Results and Analysis](../Simulation%20Results%20and%20Analysis/README.md) section.
