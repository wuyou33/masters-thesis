clear all

a = load('LOG-9775.TXT');

dt = 0.033;

from = 1800+2250;
to = from + 45/dt;

time = integrate(ones(1, length(from:to)).*dt);

%% plot

hFig = figure(3);
hold off
plot(time, ones(1, length(from:to)).*0, 'k', 'LineWidth', 1.5);
hold on
shift = 10; 
plot(time, -a(from:to, 1), 'b', 'LineWidth', 1.5);
plot(time, a(from+shift:to+shift, 19)-2.9, 'r', 'LineWidth', 1.5);
legend('Setpoint', 'Position estimated by KF', 'Position measured by Whycon');
xlabel('Time [s]');
ylabel('Position [m]')
title('Position')

axis([0 time(end) -0.28 0.40]);

set(hFig, 'Units', 'centimeters');
set(hFig, 'Position', [0 0 21 21*0.5625/2])

drawnow;

pause(2);

tightfig(hFig);