
clc
gr = out.graph1; % Battery SOC data
t = out.time1;   % Time data

% --- 1. Basic plot settings ---
figure('Color', 'w');
plot(t, gr, 'red', 'LineWidth', 2);
xlabel('Time (hour)');
ylabel('SOC (%)');
title('Battery SOC ');
set(get(gca,'XLabel'),'FontSize',20)
set(gca,'FontSize',20)
xlim([0 24])
ylim([0 100])
grid on;

% --- 2. Automatically detect four operating phase transitions ---

% M1 to M2: Charging begins (approximately 5.8 h).
idx_m2 = find(gr > 20.1 & t > 4, 1, 'first');

% M2 to M3: Battery reaches the upper SOC limit
% (approximately 8.5 h).
idx_m3 = find(gr >= 79.9, 1, 'first');

% M3 to M4: Battery begins discharging
% (approximately 17.5 h).
idx_m4 = find(gr < 79.9 & t > 15, 1, 'first');

% Combine the operating phase boundaries.
segments = [0, t(idx_m2), t(idx_m3), t(idx_m4), 24];
labels = {'M1', 'M2', 'M3', 'M4'};

% --- 3. Independent annotation height settings ---

% Adjust these four values (0.0 to 1.0) to change
% the vertical positions of the arrows.
% Suggested positions: M1 and M4 below the curve;
% M2 and M3 positioned to avoid overlapping the SOC profile.
arrow_y_soc = [0.14, 0.14, 0.76, 0.14];

% Adjust these four values (in %) to change
% the vertical positions of the phase labels.
text_y_soc = [13, 13, 72, 13];

ax = gca;
axpos = ax.Position;
hold on;

for i = 1:4
    % Calculate the normalised horizontal coordinates.
    x_s = axpos(1) + (segments(i) / 24) * axpos(3);
    x_e = axpos(1) + (segments(i+1) / 24) * axpos(3);

    % Draw the arrow at its independently assigned height.
    cur_y = axpos(2) + arrow_y_soc(i) * axpos(4);
    annotation('doublearrow', [x_s x_e], ...
               [cur_y cur_y], ...
               'LineWidth', 2, 'Color', 'k');

    % Add the operating phase label.
    t_mid = (segments(i) + segments(i+1)) / 2;
    text(t_mid, text_y_soc(i), labels{i}, ...
         'HorizontalAlignment', 'center', ...
         'FontSize', 22, 'FontWeight', 'bold');
end

% Display the lower and upper SOC operating limits.
yline(20, '--k', 'Lower Limit (20%)', ...
      'FontSize', 14, ...
      'LabelHorizontalAlignment', 'right');

yline(80, '--k', 'Upper Limit (80%)', ...
      'FontSize', 14, ...
      'LabelHorizontalAlignment', 'right');
