clear all

a = load('LOG-9913.TXT');

% LOG-9794 = prvni let, vetrak cca 1.5m daleko
% LOG-9793 = druhy let, vetrak blize (1m), nakonci vypnuty regulator
% LOG-9702 = treti let, vetrak blize

from = 700;
to = size(a, 1)-500;

mpcEnabled = 1;

speedLimit = 0.35;

dt = 0.033;
time = integrate(ones(1, length(from:to)).*dt);

hFig = figure(1)
subplot(3, 1, 1);
hold off
plot(time, a(from:to, 7).*mpcEnabled, 'r', 'LineWidth', 1.5);
hold on
plot(time, a(from:to, 1).*mpcEnabled, 'b', 'LineWidth', 1.5);
axis([0 time(end) -0.8 0.7]);
title('Position');
xlabel('Time [s]');
ylabel('Position [m]');
legend('Desired position', 'Estimated by KF');

subplot(3, 1, 2);
hold off
plot(time, a(from:to, 11).*mpcEnabled, 'r', 'LineWidth', 1.5);
axis([0 time(end) -700 700]);
title('Control action');
xlabel('Time [s]');
ylabel('Output [-]');
legend('Control action');

subplot(3, 1, 3);
hold off
plot(time, a(from:to, 5).*mpcEnabled, 'b', 'LineWidth', 1.5);
axis([0 time(end) -0.15 0.2]);
title('Estimated acceleration error (disturbance by hand)');
xlabel('Time [s]');
ylabel('Acceleration error [m/s^2]');
legend('Disturbance');

set(hFig, 'Units', 'centimeters');
set(hFig, 'Position', [0 0 21 21*0.5625*1.5])

drawnow;

pause(2);

tightfig(hFig);