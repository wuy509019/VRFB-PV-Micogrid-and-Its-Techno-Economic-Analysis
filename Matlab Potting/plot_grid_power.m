
clc
gr = out.graph;
t = out.time;

% --- 1. Basic plot settings ---
figure('Color', 'w');
plot(t, gr, 'red', 'LineWidth', 1.5);
xlabel('Time (hour)');
ylabel('Grid Power (W)');
title('Graph over ime');
set(get(gca,'XLabel'),'FontSize',20)
set(gca,'FontSize',20)
xlim([0 24])
grid on;

% --- 2. Automatically detect operating phase transitions ---
[~, idx_jump] = max(diff(gr));
t_m3_start = t(idx_jump);
idx_m3_end = find(t > t_m3_start & gr <= 100, 1, 'first');
t_m3_end = t(idx_m3_end);
idx_m2_start = find(t > 4 & gr >= -100, 1, 'first');
t_m2_start = t(idx_m2_start);

segments = [0, t_m2_start, t_m3_start, t_m3_end, 24];
labels = {'M1', 'M2', 'M3', 'M4'};

% --- 3. Independent annotation height settings ---

% Adjust these four values (0.0 to 1.0) to change
% the vertical positions of the four arrows.
arrow_heights = [0.2, 0.34, 0.28, 0.34];

% Adjust these four values (in W) to change
% the vertical positions of the M1-M4 labels.
text_y_pos = [-0.91e5, 0.36e5, -0.44e5, 0.36e5];

ax = gca;
axpos = ax.Position;
hold on;

for i = 1:4
    % Convert the time boundaries into normalised
    % horizontal coordinates.
    x_s = axpos(1) + (segments(i) / 24) * axpos(3);
    x_e = axpos(1) + (segments(i+1) / 24) * axpos(3);

    % Set the individual vertical position of each arrow.
    current_arrow_y = axpos(2) + arrow_heights(i) * axpos(4);

    % Draw a double-headed arrow for the operating phase.
    annotation('doublearrow', [x_s x_e], ...
               [current_arrow_y current_arrow_y], ...
               'LineWidth', 2, 'Color', 'k');

    % Add the corresponding operating phase label.
    t_mid = (segments(i) + segments(i+1)) / 2;
    text(t_mid, text_y_pos(i), labels{i}, ...
         'HorizontalAlignment', 'center', ...
         'FontSize', 22, 'FontWeight', 'bold');
end
 