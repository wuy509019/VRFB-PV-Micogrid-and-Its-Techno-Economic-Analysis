
clc
gr = out.graph3;
t = out.time3;

% --- 1. Plot settings ---
figure('Color', 'w');
plot(t, gr, 'red', 'LineWidth', 2.5);
xlabel('Time (hour)');
ylabel('Purchase(£)');
set(gca,'FontSize',20);
title('Purchase')
xlim([0 24]);
grid on;

% --- 2. Define the operating phase boundaries ---

% These values are predefined based on the original
% simulation results. Automatic detection would require
% identifying the relevant transition points in the data.
t_p1 = 5.6;
t_p2 = 20.6;

% Four boundary values define three operating phases.
seg = [0, t_p1, t_p2, 24];
labels = {'M1', 'M2', 'M3'};

% --- 3. Independent annotation height settings ---
arrow_y = [0.18, 0.15, 0.15];
text_y = [12, 10, 10];

% --- 4. Draw operating phase annotations ---
ax = gca;
axpos = ax.Position;
hold on;

for i = 1:3
    % Convert the time boundaries into normalised coordinates.
    x_s = axpos(1) + (seg(i) / 24) * axpos(3);
    x_e = axpos(1) + (seg(i+1) / 24) * axpos(3);

    % Draw a double-headed arrow.
    cur_y = axpos(2) + arrow_y(i) * axpos(4);
    annotation('doublearrow', [x_s x_e], ...
               [cur_y cur_y], ...
               'LineWidth', 2);

    % Add the operating phase label.
    t_mid = (seg(i) + seg(i+1)) / 2;
    text(t_mid, text_y(i), labels{i}, ...
         'HorizontalAlignment', 'center', ...
         'FontSize', 22, 'FontWeight', 'bold');
end
