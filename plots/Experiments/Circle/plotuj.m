clear all

a = load('LOG-9916.TXT');

% bezva super venku vítr 
% a = load('LOG00116.TXT');

% from = 500;
% to = from+1300;

dt = 0.033;

% pro vypocet statistiky vezmu cely experiment
from = 500+round(10/dt);
to = from+2800;

% from = 1;
% to = size(a, 1);

mpcEnabled = a(:, 17);

a(:, 1) = a(:, 1).*mpcEnabled;
a(:, 2) = a(:, 2).*mpcEnabled;

speedLimit = 0.35;
time = integrate(ones(1, length(from:to)).*dt);

hFig = figure(1)
subplot(2, 2, 1);
hold off
plot(time, a(from:to, 7), 'r', 'LineWidth', 1.5);
hold on
plot(time, a(from:to, 1), 'b', 'LineWidth', 1.5);
axis([0 time(end) -1.15 2.3]);
title('Forward position');
xlabel('Time [s]');
ylabel('Position [m]');
legend('Desired position', 'Estimated by KF');

subplot(2, 2, 2);
hold off
plot(time, a(from:to, 9), 'r', 'LineWidth', 1.5);
hold on
plot(time, a(from:to, 3), 'b', 'LineWidth', 1.5);
plot(time, ones(1, length(from:to)).*-speedLimit, 'k--');
plot(time, ones(1, length(from:to)).*speedLimit, 'k--');
axis([0 time(end) -0.5 1.2]);
title('Forward speed');
xlabel('Time [s]');
ylabel('Speed [m/s]');
legend('Measured by px4flow', 'Estimated by KF', 'Speed limit');

subplot(2, 2, 3);
hold off
plot(time, a(from:to, 8), 'r', 'LineWidth', 1.5);
hold on
plot(time, a(from:to, 2), 'b', 'LineWidth', 1.5);
axis([0 time(end) -1.15 2.3]);
title('Leftward position');
xlabel('Time [s]');
ylabel('Position [m]');
legend('Desired position', 'Estimated by KF');

subplot(2, 2, 4);
hold off
plot(time, a(from:to, 10), 'r', 'LineWidth', 1.5);
hold on
plot(time, a(from:to, 4), 'b', 'LineWidth', 1.5);
plot(time, ones(1, length(from:to)).*-speedLimit, 'k--');
plot(time, ones(1, length(from:to)).*speedLimit, 'k--');
axis([0 time(end) -0.5 1.2]);
title('Leftward speed');
xlabel('Time [s]');
ylabel('Speed [m/s]');
legend('Measured by px4flow', 'Estimated by KF', 'Speed limit');

set(hFig, 'Units', 'centimeters');
set(hFig, 'Position', [0 0 21 21*0.5625])

drawnow;

pause(2);

tightfig(hFig);

stdx = std(a(from:to, 1) - a(from:to, 7))
stdy = std(a(from:to, 2) - a(from:to, 8))
maxx = max(abs(a(from:to, 1) - a(from:to, 7)))
maxy = max(abs(a(from:to, 2) - a(from:to, 8)))
