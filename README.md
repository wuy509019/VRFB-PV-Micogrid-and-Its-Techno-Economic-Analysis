# Application, Design Considerations, and Feasibility Study of the Large-Scale Vanadium Batteries with a 100kW Photovoltaic System at Medway-UK

### Final Year Project | University of Greenwich (2025–2026)

## Project Overview

This project investigates the technical and economic feasibility of integrating a **100 kW photovoltaic (PV) system** with a **400 kWh Vanadium Redox Flow Battery (VRFB)** in Medway, United Kingdom.

A MATLAB/Simulink model was developed to analyse solar power generation, battery energy management, electricity grid interaction, and the financial performance of the integrated system.

## Project Objectives

- Develop a 24-hour PV-battery microgrid simulation.
- Analyse battery State of Charge (SOC) and energy management strategies.
- Investigate peak shaving using Time-of-Use electricity tariffs.
- Evaluate capital investment and the economic payback period.

## Technologies and Tools

- MATLAB
- Simulink
- Renewable Energy Systems
- Battery Energy Storage Systems
- Energy Management and Control
- Techno-Economic Analysis

## System Architecture and Simulation Model
![Simulink System Architecture](images/System_Architecture1.png)
![Simulink System Architecture](images/System_Architecture2.png)

The proposed PV–VRFB microgrid was modelled using MATLAB/Simulink to investigate power management, battery operation, grid interaction, and economic performance over a 24-hour simulation period.

The model consists of five main functional components:

### 1. Photovoltaic Power Generation

Solar irradiance data are provided through a Signal Editor block and processed by the PV subsystem to obtain the photovoltaic power output (`P_pv`).

### 2. Electrical Load Demand

A separate Signal Editor block supplies the electrical load profile (`P_load`), representing the system's varying electricity demand.

### 3. Processing Unit — Energy Management

The Processing Unit is implemented using a MATLAB Function block (`fcn`).

It receives PV power, electrical load demand, and battery State of Charge (SOC) as inputs. Based on these values, the controller calculates the battery power reference (`P_bat_ref`) and grid power (`P_grid`).

The implemented control logic prioritises solar energy utilisation and battery charging or discharging, subject to SOC operating limits of 20% and 80%.

### 4. Battery Storage and SOC Feedback

The battery subsystem receives the charging or discharging power reference from the Processing Unit.

Its SOC output is fed back to the controller through a Unit Delay block, allowing the controller to determine the appropriate operating mode based on the battery's previous SOC value.

### 5. Grid Interaction and Financial Analysis

Grid power is used to calculate electricity export revenue and import expenditure.

The financial calculation section includes separate paths for selling electricity to the grid and purchasing electricity from the grid. A time-dependent tariff selection block is used to represent the electricity import pricing structure.

The resulting financial outputs are combined to determine the simulated daily net financial outcome.

## Key Simulation Results

| Parameter | Result |
|---|---|
| Solar PV Capacity | 100 kW |
| VRFB Energy Capacity | 400 kWh |
| Estimated Capital Investment | £150,000 |
| Simulated Daily Net Profit | £47 |
| Estimated Annual Profit | £17,155 |
| Simple Payback Period | 8.7 years |

These results are based on the simulation assumptions and electricity tariffs adopted in the project. They do not represent verified real-world operational returns.

## Project Structure

The repository is intended to include the Simulink model, relevant MATLAB control logic, simulation results, supporting data, and technical documentation.

## Author

**Yutong Wu**

BEng (Hons) Electrical and Electronic Engineering Technology

University of Greenwich, United Kingdom

Academic Year: 2025–2026
