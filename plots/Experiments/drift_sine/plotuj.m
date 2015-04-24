clear all

a = load('LOG-9774.TXT');

% bezva super venku vítr 
% a = load('LOG00116.TXT');

% from = 1500;
% to = size(a, 1)-1000;

from = 1800;
to = size(a, 1)-1500;

mpcEnabled = 1;

speedLimit = 0.35;

dt = 0.033;
time = integrate(ones(1, length(from:to)).*dt);

%% RPI 

hFig = figure(3);
hold off
plot(time, -a(from:to, 1).*mpcEnabled, 'r', 'LineWidth', 2);
hold on
shift = 10;
plot(time, a(from+shift:to+shift, 19).*mpcEnabled-2.04, 'b', 'LineWidth', 2);
legend('Position estimated by KF', 'Position measured by Whycon');
xlabel('Time [s]');
ylabel('Position [m]')
title('Position');

axis([0 time(end) -0.7 1.12]);

% set(hFig, 'Units', 'centimeters');
% set(hFig, 'Position', [0 0 21 21*0.5625/2])

% drawnow;
% 
% pause(2);
% 
% tightfig(hFig);