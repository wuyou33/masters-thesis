clear all

a = load('LOG-9787.TXT');

% LOG-9788 je s governorem
% LOG-9787 je bez governoru

from = 1;
to = size(a, 1);

mpcEnabled = 1;

speedLimit = 0.35;

dt = 0.033;
time = integrate(ones(1, length(from:to)).*dt);

figure(1)
subplot(3, 1, 1);
hold off
plot(time, a(from:to, 1).*mpcEnabled, 'b');
hold on
plot(time, a(from:to, 7).*mpcEnabled, 'r');

% axis([0 time(end) -2.5 2.5]);
title('Elevator position');
xlabel('Time [s]');
ylabel('Position [m]');
legend('Estimated position', 'Setpoint');

subplot(3, 1, 2);
hold off
plot(time, a(from:to, 9).*mpcEnabled, 'r');
hold on
plot(time, a(from:to, 3).*mpcEnabled, 'b');
plot(time, ones(1, length(from:to)).*-speedLimit, 'color', 'black');
plot(time, ones(1, length(from:to)).*speedLimit, 'color', 'black');
axis([0 time(end) -2 2]);
title('Elevator speed');
xlabel('Time [s]');
ylabel('Speed [m/s]');
legend('Measured speed', 'Estimated Speed', 'Speed limit');

subplot(3, 1, 3);
hold off
plot(time, a(from:to, 5).*mpcEnabled, 'b');
axis([0 time(end) -0.2 0.8]);
title('Estimated acceleration error (wind disturbance)');
xlabel('Time [s]');
ylabel('Acceleration error [m/s^2]');
legend('Estimated acceleration error');


figure(2)

subplot(3, 1, 1);
hold off
plot(time, a(from:to, 2).*mpcEnabled, 'b');
hold on
plot(time, a(from:to, 8).*mpcEnabled, 'r');
title('Aileron position');
xlabel('Time [s]');
ylabel('Position [m]');
legend('Estimated position', 'Setpoint');

subplot(3, 1, 2);
hold off
plot(time, a(from:to, 10).*mpcEnabled, 'r');
hold on
plot(time, a(from:to, 4).*mpcEnabled, 'b');
plot(time, ones(1, length(from:to)).*-speedLimit, 'color', 'black');
plot(time, ones(1, length(from:to)).*speedLimit, 'color', 'black');
axis([0 time(end) -0.6 0.6]);
title('Aileron speed');
ylabel('Speed [m/s]');
xlabel('Time [s]');
legend('Measured speed', 'Estimated Speed', 'Speed limit');

subplot(3, 1, 3);
hold off
plot(time, a(from:to, 6).*mpcEnabled, 'b');
axis([0 time(end) -0.2 0.8]);
title('Estimated acceleration error (wind disturbance)');
xlabel('Time [s]');
ylabel('Acceleration error [m/s^2]');
legend('Estimated acceleration error');

figure(3);
plot(time, a(from:to, 13).*mpcEnabled, 'b');