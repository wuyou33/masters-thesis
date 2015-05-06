clear all

a = load('LOG-9928.TXT');

dt = 0.033;

from = round(40/dt);
to = from + round(50/dt);

mpcEnabled = 1;

a(:, 1) = a(:, 1).*mpcEnabled;
a(:, 2) = a(:, 2).*mpcEnabled;

speedLimit = 0.35;
time = integrate(ones(1, length(from:to)).*dt);

to_plot = 68;

hFig = figure(1)
subplot(3, 1, 1);
hold off
plot(time, a(from:to, 7).*mpcEnabled, 'r', 'LineWidth', 1.5);
hold on
plot(time, a(from:to, 1).*mpcEnabled, 'b', 'LineWidth', 1.5);
axis([0 to_plot -1.2 15]);
title('Position');
xlabel('Time [s]');
ylabel('Position [m]');
legend('Setpoint', 'Estimated position');

subplot(3, 1, 2);
hold off
plot(time, a(from:to, 9).*mpcEnabled, 'r', 'LineWidth', 1.5);
hold on
plot(time, a(from:to, 3).*mpcEnabled, 'b', 'LineWidth', 1.5);
plot(time, ones(1, length(from:to)).*-speedLimit, 'k--', 'LineWidth', 1.5);
plot(time, ones(1, length(from:to)).*speedLimit, 'k--', 'LineWidth', 1.5);
axis([0 to_plot -0.6 0.6]);
title('Speed');
xlabel('Time [s]');
ylabel('Speed [m/s]');
legend('Measured speed', 'Estimated by KF', 'Speed limit');

subplot(3, 1, 3);
hold off
plot(time, a(from:to, 11).*mpcEnabled, 'b', 'LineWidth', 1.5);
axis([0 to_plot -400 400]);
title('Control action');
xlabel('Time [s]');
ylabel('Control action [-]');
legend('Control action');

set(hFig, 'Units', 'centimeters');
set(hFig, 'Position', [0 0 23 17])

drawnow;

pause(2);

tightfig(hFig);
