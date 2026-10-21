# PV and Load Data Input

## Overview

This folder contains the solar irradiance and electrical load input data used in the MATLAB/Simulink simulation of the PV–VRFB microgrid.

The simulation considers a 24-hour period on **21 June 2023**, for the Medway area, United Kingdom.

## Input Data

### Solar Irradiance Data

Solar irradiance data for Medway were used as inputs to the PV subsystem to calculate the photovoltaic output power (`P_pv`).

- [Original Solar Irradiance Data](Medway_original_sunlight_data.xlsx)
- [Solar Irradiance Data This project Uesd](Medway_sunlight_data_2023_6_21.xlsx)

### Electrical Load Data

A scaled commercial load profile was adopted to represent the electrical demand (`P_load`) of the simulated site.
- [Electrical Load Data](Medway_Load_Data_2023_6_21.xlsx)

## Matlab Input data

The original input datasets were imported into MATLAB/Simulink and organised into Signal Editor scenarios.

The following MATLAB files contain the prepared simulation input datasets:

- [PV Signal Editor Data](data_waves.mat) — contains the solar irradiance and ambient temperature input scenarios.
- [Load Signal Editor Data](load_data_waves.mat) — contains the electrical load input scenarios.

Both files contain multiple scenarios stored as `Simulink.SimulationData.Dataset` objects.

The `x6_21` scenario was selected for the final 24-hour simulation, representing 21 June 2023 in Medway, UK.

## Notes

The simulation represents a selected summer-day scenario rather than annual operating conditions. The load profile is a scaled modelling input and should not be interpreted as independently verified historical metered consumption for Medway on that date.
