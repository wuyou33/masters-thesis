clear all

a = load('LOG-9788.TXT');

% LOG-9788 je s governorem
% LOG-9787 je bez governoru

dt = 0.033;

from = round(15/dt);
to = round(55/dt);

mpcEnabled = 1;

speedLimit = 0.35;

time = integrate(ones(1, length(from:to)).*dt);

to_plot = 54;

hFig = figure(1)
subplot(3, 1, 1);
hold off
plot(time, a(from:to, 1).*mpcEnabled, 'r', 'LineWidth', 1.5);
hold on
plot(time, a(from:to, 7).*mpcEnabled, 'b', 'LineWidth', 1.5);
axis([0 to_plot -0.2 1.2]);
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
axis([0 to_plot -200 200]);
title('Control action');
xlabel('Time [s]');
ylabel('Control action [-]');
legend('Control action');

set(hFig, 'Units', 'centimeters');
set(hFig, 'Position', [0 0 23 17])

drawnow;

pause(2);

tightfig(hFig);
