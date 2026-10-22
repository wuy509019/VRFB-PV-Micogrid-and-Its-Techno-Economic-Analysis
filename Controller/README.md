# Processing Unit – Energy Management Controller

## 1. Overview

The Processing Unit is implemented as a **MATLAB Function block** in Simulink to manage power flow between the 100 kW photovoltaic (PV) system, 400 kWh Vanadium Redox Flow Battery (VRFB), electrical load, and utility grid.

The controller uses a rule-based energy management strategy to determine battery charging, discharging, and grid interaction based on the available PV power, load demand, and battery State of Charge (SOC).

## 2. Controller Inputs and Outputs

| Variable | Description |
|---|---|
| `P_pv` | Photovoltaic power generation |
| `P_load` | Electrical load demand |
| `SOC` | Battery State of Charge (%) |
| `P_bat_ref` | Battery charging/discharging power reference |
| `P_grid` | Power exchanged with the utility grid |

The net power balance is calculated as:

**P_net = P_pv − P_load**

A positive `P_net` indicates surplus photovoltaic generation, while a negative value indicates insufficient generation to meet the electrical load.

## 3. Control Logic

The controller operates according to four conditions:

| Condition | Controller Action |
|---|---|
| PV surplus and SOC below 80% | Charge the battery using surplus PV power |
| PV surplus and SOC at or above 80% | Export surplus electricity to the grid |
| PV deficit and SOC above 20% | Discharge the battery to support electrical demand |
| PV deficit and SOC at or below 20% | Import electricity from the grid |

The SOC thresholds of **20% and 80%** are used to define the battery's operational charging and discharging limits.

## 4. MATLAB Function Implementation

The controller is implemented using a MATLAB Function block named `processing unit` within the Simulink model `pvbattery1.slx`.

The internal MATLAB function is named `fcn` and uses the following interface:

`function [P_bat_ref, P_grid] = fcn(P_pv, P_load, SOC)`

The source code is provided in [processing_unit.m](processing_unit.m).

In the original Simulink implementation, positive `P_bat_ref` represents charging, while negative values represent discharging.

Similarly, positive `P_grid` indicates electricity exported to the grid, while negative values indicate electricity imported from the grid.

## 5. Role in the System

The Processing Unit receives time-varying photovoltaic generation and electrical load signals from the input scenarios.

Battery SOC is fed back from the Battery Subsystem, allowing the controller to update its charging and discharging decisions.

The resulting grid power signal is also supplied to the economic calculation module to evaluate electricity export revenue and purchasing costs.

This rule-based controller provides a simplified framework for coordinating photovoltaic generation, battery storage, and grid interaction throughout the 24-hour simulation.
