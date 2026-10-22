
% ======================================================
% Project: GEEN1172 - Financial Analysis Plot
% Final revised version
% Main fix: Prevent invisible curves caused by
% applying time scaling more than once.
% ======================================================

clc;

% --- 1. Extract numerical arrays from simulation outputs ---

% Check the data format and extract the corresponding values.
try
    t_val = out.time.Data;  % Timeseries object
    s_val = out.graph2.Data;
    p_val = out.graph3.Data;
    pr_val = out.graph4.Data;
catch
    t_val = out.time;       % Numeric array
    s_val = out.graph2;
    p_val = out.graph3;
    pr_val = out.graph4;
end

% --- 2. Check whether time conversion is required ---

% The time signal may already have been converted
% from seconds to hours in the Simulink model.
if max(t_val) > 100
    t_hrs = t_val / 3600; % Convert seconds to hours.
else
    t_hrs = t_val;        % Time is already in hours.
end

% --- 3. Plot the financial results ---
figure('Color', 'w', ...
       'Units', 'pixels', ...
       'Position', [100, 100, 1100, 750]);
hold on;

% Plot the three financial performance curves.
plot(t_hrs, s_val, 'r', 'LineWidth', 3, ...
     'DisplayName', 'Cumulative Selling (£112)');

plot(t_hrs, p_val, 'g', 'LineWidth', 3, ...
     'DisplayName', 'Cumulative Purchase (£65)');

plot(t_hrs, pr_val, 'b', 'LineWidth', 3, ...
     'DisplayName', 'Daily Net Profit (£47)');

% Configure the axes, title, grid, and legend.
xlabel('Time (hour)', 'FontSize', 22);
ylabel('Value (£)', 'FontSize', 22);
title('Daily Operational Economics Summary (24 Hours)', ...
      'FontSize', 24);
set(gca, 'FontSize', 20, 'LineWidth', 1.5);
xlim([0 24]);
grid on;
legend('Location', 'northwest', 'FontSize', 16);

% --- 4. Automatically annotate operating phases (M1-M3) ---

% Identify the transition points in the purchase cost curve.
idx_p2 = find(t_hrs > 5 & ...
    diff([p_val; p_val(end)]) <= 0.01, 1, 'first');

t_p2 = t_hrs(idx_p2);
if isempty(t_p2)
    t_p2 = 5.6;
end

idx_p3 = find(t_hrs > 20 & ...
    diff([p_val; p_val(end)]) >= 0.1, 1, 'first');

t_p3 = t_hrs(idx_p3);
if isempty(t_p3)
    t_p3 = 20.6;
end

% Define the boundaries of the three operating phases.
segments = [0, t_p2, t_p3, 24];
labels = {'M1', 'M2', 'M3'};

% Configure the vertical positions of arrows and labels.
arrow_h = [0.1, 0.1, 0.1];
text_y = [-12, -12, -12];

ax = gca;
axpos = ax.Position;

for i = 1:3
    % Calculate the normalised horizontal coordinates.
    x_s = axpos(1) + (segments(i) / 24) * axpos(3);
    x_e = axpos(1) + (segments(i+1) / 24) * axpos(3);

    % Draw a double-headed arrow for each operating phase.
    curr_y = axpos(2) + arrow_h(i) * axpos(4);
    annotation('doublearrow', [x_s x_e], ...
               [curr_y curr_y], ...
               'LineWidth', 2, 'Color', 'k');

    % Add the operating phase label.
    text((segments(i) + segments(i+1))/2, ...
         text_y(i), labels{i}, ...
         'HorizontalAlignment', 'center', ...
         'FontSize', 22, 'FontWeight', 'bold');
end
