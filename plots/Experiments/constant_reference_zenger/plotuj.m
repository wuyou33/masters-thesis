clear all

a = load('LOG-9771.TXT');

dt = 0.033;

from = round(25/dt);
% to = from + 30/dt;
to = size(a, 1)-round(3/dt);

mpcEnabled = 1;

speedLimit = 0.35;
time = integrate(ones(1, length(from:to)).*dt);

hFig = figure(1)
hold off
plot(time, a(from:to, 7).*mpcEnabled, 'r', 'LineWidth', 1.5);
hold on
plot(time, a(from:to, 1).*mpcEnabled, 'b', 'LineWidth', 1.5);
axis([0 time(end) -1 1]);
title('Position');
xlabel('Time [s]');
ylabel('Position [m]');
legend('Desired position', 'Estimated by KF');

set(hFig, 'Units', 'centimeters');
set(hFig, 'Position', [0 0 21 21*0.5625/2])

drawnow;

pause(2);

tightfig(hFig);

%%

figure(2);
plot(time, a(from:to, 9).*mpcEnabled, 'r', 'LineWidth', 1.5);

%% 

stdx = std(a(from:to, 2))
maxx = max(abs(a(from:to, 2)))
stdy = std(a(from:to, 1))
maxy = max(abs(a(from:to, 1)))