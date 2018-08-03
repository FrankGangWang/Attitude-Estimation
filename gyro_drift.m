% Gyroscopic Drift Demonstration
%
% Author: Philip Salmony
% Date: 2 August 2018
% Email: philip.salmony@gmail.com

% Simulation parameters
N = 1000;
T = 0.01;
noise_std = 0.5;

% Time vector
tg = (0:(N-1)) * T;

% True states
theta = exp(-tg) .* sin(2 * pi * tg);
theta_dot = exp(-tg) .* (2 * pi * cos(2 * pi * tg) - sin(2 * pi * tg));

% Noisy gyro measurements
theta_dot_noise = theta_dot + noise_std * randn(1, N);

% Integrate gyro measurements to get state estimate
theta_hat = zeros(1, N);

for i=2:N
   theta_hat(i) = theta_hat(i - 1) + theta_dot_noise(i) * T;
end

plot(tg, theta, tg, theta_hat)
xlabel('Time (s)')
ylabel('Theta (deg)')
title('Gyro Drift')
legend('True', 'Estimate')