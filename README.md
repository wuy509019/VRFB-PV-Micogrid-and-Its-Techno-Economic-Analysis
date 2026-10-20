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
- 
### Control Logic Design

A MATLAB Function block named **Processing Unit** was developed in Simulink to manage power flow between the photovoltaic system, vanadium redox flow battery (VRFB), electrical load, and utility grid.

The control algorithm, implemented in the `fcn` function, determines battery charging, discharging, and grid interaction based on the net power balance and battery State of Charge (SOC).

The battery operating limits were set between 20% and 80% SOC.

The original control logic is documented in Appendix A of the project report.

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
