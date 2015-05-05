clear all

a = load('LOG-9916.TXT');

% bezva super venku vítr 
% a = load('LOG00116.TXT');

% from = 500;
% to = from+1300;

dt = 0.033;

% pro vypocet statistiky vezmu cely experiment
% from = 500+round(10/dt);
% to = from+2800;

from = 1;
to = size(a, 1);

mpcEnabled = a(:, 17);

a(:, 1) = a(:, 1).*mpcEnabled;
a(:, 2) = a(:, 2).*mpcEnabled;

speedLimit = 0.35;
time = integrate(ones(1, length(from:to)).*dt);

hFig = figure(1)
subplot(3, 1, 1);
hold off
plot(time, a(from:to, 1).*mpcEnabled, 'b', 'LineWidth', 1.5);
hold on
plot(time, a(from:to, 7).*mpcEnabled, 'r', 'LineWidth', 1.5);
axis([0 time(end) -1.2 2.2]);
title('Position');
xlabel('Time [s]');
ylabel('Position [m]');
legend('Estimated position', 'Setpoint');

subplot(3, 1, 2);
hold off
plot(time, a(from:to, 9).*mpcEnabled, 'r', 'LineWidth', 1.5);
hold on
plot(time, a(from:to, 3).*mpcEnabled, 'b', 'LineWidth', 1.5);
plot(time, ones(1, length(from:to)).*-speedLimit, 'k--', 'LineWidth', 1.5);
plot(time, ones(1, length(from:to)).*speedLimit, 'k--', 'LineWidth', 1.5);
axis([0 time(end) -0.6 0.6]);
title('Speed');
xlabel('Time [s]');
ylabel('Speed [m/s]');
legend('Measured speed', 'Estimated by KF', 'Speed limit');

subplot(3, 1, 3);
hold off
plot(time, a(from:to, 5).*mpcEnabled, 'b', 'LineWidth', 1.5);
axis([0 time(end) -0.2 1.2]);
title('Estimated acceleration error (wind disturbance)');
xlabel('Time [s]');
ylabel('Acceleration error [m/s^2]');
legend('Estimated acceleration error');

set(hFig, 'Units', 'centimeters');
set(hFig, 'Position', [0 0 23 17])

drawnow;

pause(2);

tightfig(hFig);
