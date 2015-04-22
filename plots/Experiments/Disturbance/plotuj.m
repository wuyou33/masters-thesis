clear all

a = load('LOG-9915.TXT');

% bezva super venku vítr 
% a = load('LOG00116.TXT');

from = 2000;
to = size(a, 1)-500;

mpcEnabled = a(:, 17);

a(:, 1) = a(:, 1).*mpcEnabled;
a(:, 2) = a(:, 2).*mpcEnabled;

speedLimit = 0.35;

dt = 0.033;
time = integrate(ones(1, length(from:to)).*dt);

hFig = figure(1)
subplot(2, 1, 1);
hold off
plot(time, a(from:to, 7), 'r', 'LineWidth', 1.5);
hold on
plot(time, a(from:to, 1), 'b', 'LineWidth', 1.5);

axis([0 time(end) -0.7 0.7]);
title('Position');
xlabel('Time [s]');
ylabel('Position [m]');
legend('Desired position', 'Estimated by KF');

subplot(2, 1, 2);
hold off
plot(time, a(from:to, 5), 'r', 'LineWidth', 1.5);
% hold on
% plot(time, a(from:to, 3), 'b', 'LineWidth', 1.5);
% plot(time, ones(1, length(from:to)).*-speedLimit, 'color', 'black');
% plot(time, ones(1, length(from:to)).*speedLimit, 'color', 'black');
axis([0 time(end) -0.1 0.1]);
title('Speed');
xlabel('Time [s]');
ylabel('Speed [m/s]');
legend('Measured by px4flow', 'Estimated by KF');

set(hFig, 'Units', 'centimeters');
set(hFig, 'Position', [0 0 21 21*0.5625])

drawnow;

pause(2);

tightfig(hFig);