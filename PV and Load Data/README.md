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

A scaled commercial load profile was adopted to represent the electrical demand (`P_load`) of the simulated site, with a peak load of approximately 80 kW.
- [Electrical Load Data](Medway_Load_Data_2023_6_21.xlsx)

## Data Integration

The solar irradiance and load profiles were imported into MATLAB/Simulink using Signal Editor blocks.

The resulting power signals were supplied to the Processing Unit for calculating the net power balance and determining battery charging, discharging, and grid interaction.

## Notes

The simulation represents a selected summer-day scenario rather than annual operating conditions. The load profile is a scaled modelling input and should not be interpreted as independently verified historical metered consumption for Medway on that date.
