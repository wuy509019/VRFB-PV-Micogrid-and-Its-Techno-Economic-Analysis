
function [P_bat_ref, P_grid] = fcn(P_pv, P_load, SOC)
    SOC_MAX = 80;
    SOC_MIN = 20;

    P_net = P_pv - P_load;

    if P_net > 0
        if SOC < SOC_MAX
            P_bat_ref = P_net;
            P_grid = 0;
        else
            P_bat_ref = 0;
            P_grid = P_net;
        end
    else
        P_deficit = abs(P_net);
        if SOC > SOC_MIN
            P_bat_ref = -P_deficit;
            P_grid = 0;
        else
            P_bat_ref = 0;
            P_grid = -P_deficit;
        end
    end
end
