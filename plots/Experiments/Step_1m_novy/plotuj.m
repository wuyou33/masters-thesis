clear all

a = load('LOG-9788.TXT');

% LOG-9788 je s governorem
% LOG-9787 je bez governoru

from = 1150;
to = size(a, 1)-350;

mpcEnabled = 1;

speedLimit = 0.35;

dt = 0.033;
time = integrate(ones(1, length(from:to)).*dt);

hFig = figure(1)
subplot(1, 2, 1);
hold off
plot(time, a(from:to, 7).*mpcEnabled, 'r', 'LineWidth', 1.5);
hold on
plot(time, a(from:to, 1).*mpcEnabled, 'b', 'LineWidth', 1.5);
axis([0 time(end) -0.2 1.8]);
title('Elevator position');
xlabel('Time [s]');
ylabel('Position [m]');
legend('Desired position', 'Estimated by KF');

subplot(1, 2, 2);
hold off
plot(time, a(from:to, 9).*mpcEnabled, 'r', 'LineWidth', 1.5);
hold on
plot(time, a(from:to, 3).*mpcEnabled, 'b', 'LineWidth', 1.5);
plot(time, ones(1, length(from:to)).*-speedLimit, 'k--');
plot(time, ones(1, length(from:to)).*speedLimit, 'k--');
title('Elevator speed');
xlabel('Time [s]');
ylabel('Speed [m/s]');
legend('Measured by px4flow', 'Estimated by KF', 'Speed limit');
axis([0 time(end) -0.5 1.2]);

set(hFig, 'Units', 'centimeters');
set(hFig, 'Position', [0 0 21 21*0.5625/2])

drawnow;

pause(1);

tightfig(hFig);
