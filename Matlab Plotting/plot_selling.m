
clc
gr = out.graph2; % Cumulative electricity export revenue
t = out.time2;   % Time data

% --- 1. Basic plot settings ---
figure('Color', 'w');
plot(t, gr, 'red', 'LineWidth', 2);
xlabel('Time (hour)');
ylabel('Selling(£)');
title('Selling');
set(get(gca,'XLabel'),'FontSize',20)
set(gca,'FontSize',20)
xlim([0 24])
grid on;

% --- 2. Automatically identify three operating phases ---

% Phase 1 to Phase 2: Export revenue begins to increase
% (approximately 8.5 h, when the battery reaches its upper SOC limit).
idx_p2 = find(gr > 0.5, 1, 'first');
t_p2_start = t(idx_p2);

% Phase 2 to Phase 3: Revenue reaches its maximum
% and enters a plateau (approximately 17.5 h).
[~, idx_p3] = max(gr);
t_p3_start = t(idx_p3);

% Combine the three operating phase boundaries.
segments = [0, t_p2_start, t_p3_start, 24];
labels = {'M1', 'M2', 'M3'};

% --- 3. Independent annotation height settings ---

% Adjust these three values (0.0 to 1.0) to change
% the vertical positions of the arrows.
arrow_y_sell = [0.02, 0.02, 0.87];

% Adjust these three values (in GBP) to change
% the vertical positions of the phase labels.
text_y_sell = [12, 12, 95];

ax = gca;
axpos = ax.Position;
hold on;

for i = 1:3
    % Calculate the normalised horizontal coordinates.
    x_s = axpos(1) + (segments(i) / 24) * axpos(3);
    x_e = axpos(1) + (segments(i+1) / 24) * axpos(3);

    % Draw a double-headed arrow at the selected height.
    cur_y = axpos(2) + arrow_y_sell(i) * axpos(4);
    annotation('doublearrow', [x_s x_e], ...
               [cur_y cur_y], ...
               'LineWidth', 2, 'Color', 'k');

    % Add the corresponding operating phase label.
    t_mid = (segments(i) + segments(i+1)) / 2;
    text(t_mid, text_y_sell(i), labels{i}, ...
         'HorizontalAlignment', 'center', ...
         'FontSize', 22, 'FontWeight', 'bold');
end
