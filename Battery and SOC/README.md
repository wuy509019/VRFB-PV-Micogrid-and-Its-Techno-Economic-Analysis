# Battery Model and SOC Calculation

The battery subsystem represents the energy storage behaviour of a **400 kWh Vanadium Redox Flow Battery (VRFB)** using a simplified energy integration model in MATLAB/Simulink.

The battery power reference (`P_bat_ref`) is converted into a normalised energy variation using a gain factor of `1/(400000 × 3600)` and integrated over time.

The initial State of Charge (SOC) is set to **50%**, while the integrator output is saturated between 0 and 1, corresponding to the physical SOC range of 0%–100%.

A second gain factor of `100` converts the normalised SOC into a percentage value.

The calculated SOC is fed back to the Processing Unit, which applies operational thresholds of **20% and 80%** to determine battery charging and discharging decisions.

### Model Assumptions

- Rated battery energy capacity: 400 kWh
- Initial SOC: 50%
- Physical SOC limits: 0%–100%
- Controller operating thresholds: 20%–80%
- Idealised energy balance without explicit charging or discharging efficiency losses
- Battery degradation and detailed electrochemical dynamics are not modelled
