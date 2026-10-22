
clc
gr = out.graph4; % Daily net electricity trading cash flow
t = out.time4;   % Time data

% --- 1. Basic plot settings ---
figure('Color', 'w');
plot(t, gr, 'red', 'LineWidth', 2.5);

% Use a thicker line to emphasise the net profit profile.
hold on;
yline(0, 'k--', 'LineWidth', 1); % Zero-profit reference line
xlabel('Time (hour)');
ylabel('Net Profit (£)');
title('Daily Net Profit');

set(get(gca,'XLabel'),'FontSize',20)
set(gca,'FontSize',20)
xlim([0 24])
grid on;

% --- 2. Define three operating phases ---

% End of Phase 1: Profit begins to increase more rapidly
% (approximately 8.5 h).
t_p1 = 8.5;

% End of Phase 2: Revenue growth slows or enters a plateau
% (approximately 17.5 h).
t_p2 = 17.5;

% Four boundary values define three operating phases.
seg = [0, t_p1, t_p2, 24];
labels = {'M1', 'M2', 'M3'};

% --- 3. Independent annotation height settings ---

% Vertical positions of the arrows (0.0 to 1.0).
arrow_y_profit = [0.17, 0.17, 0.17];

% Vertical positions of the phase labels (in GBP).
% Phase 1 may contain negative profit values.
text_y_profit = [8, 8, 8];

ax = gca;
axpos = ax.Position;

for i = 1:3
    % Calculate the normalised horizontal coordinates.
    x_s = axpos(1) + (seg(i) / 24) * axpos(3);
    x_e = axpos(1) + (seg(i+1) / 24) * axpos(3);

    % Retrieve the selected vertical position.
    cur_y = axpos(2) + arrow_y_profit(i) * axpos(4);

    % Draw the operating phase arrow.
    annotation('doublearrow', [x_s x_e], ...
               [cur_y cur_y], ...
               'LineWidth', 2, 'Color', 'k');

    % Add the phase label.
    t_mid = (seg(i) + seg(i+1)) / 2;
    text(t_mid, text_y_profit(i), labels{i}, ...
         'HorizontalAlignment', 'center', ...
         'FontSize', 22, 'FontWeight', 'bold');
end
