clear all

a = load('LOG-9773.TXT');

% bezva super venku vítr 
% a = load('LOG00116.TXT');

dt = 0.033;

from = 110/dt;
to = from+120/dt;

% A
% from = 4000;
% to = size(a, 1)-4500;

mpcEnabled = 1;

speedLimit = 0.35;

time = integrate(ones(1, length(from:to)).*dt);

%% plot

hFig = figure(3);
hold off
plot(time, -a(from:to, 1), 'b', 'LineWidth', 1.5);
hold on
shift = 10; 
plot(time, a(from+shift:to+shift, 19)-2.2, 'r', 'LineWidth', 1.5);
legend('Position estimated by KF', 'Position measured by Whycon');
xlabel('Time [s]');
ylabel('Position [m]')
title('Position')

axis([0 time(end) -0.25 0.5]);

set(hFig, 'Units', 'centimeters');
set(hFig, 'Position', [0 0 21 21*0.5625/2])

drawnow;

pause(2);

tightfig(hFig);

max_deviation = max(abs(-a(from:to, 1) - a(from+shift:to+shift, 19)+2.2))
   