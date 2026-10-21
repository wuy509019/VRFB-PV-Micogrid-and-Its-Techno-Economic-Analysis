# Battery Model and SOC Feedback

The battery subsystem represents the energy storage component of the proposed 400 kWh Vanadium Redox Flow Battery (VRFB) system.

The Processing Unit generates a battery charging or discharging power reference (`P_bat_ref`) based on photovoltaic generation, electrical load demand, and battery State of Charge (SOC).

The battery subsystem calculates the SOC and feeds the resulting signal back to the Processing Unit through a Unit Delay block.

The energy management controller applies SOC operating thresholds of 20% and 80% to determine battery charging and discharging decisions.
