clc; clear; close all;

% Define the initial guess range for u'(0)
s1 = 0; 
s2 = 1; 

% Ensure the residuals have opposite signs before using fzero
res1 = shoot_residual(s1);
res2 = shoot_residual(s2);

while res1 * res2 > 0 % Expand range until signs differ
    s1 = s1 - 1;
    s2 = s2 + 1;
    res1 = shoot_residual(s1);
    res2 = shoot_residual(s2);
end

% Find the correct initial slope u'(0) using fzero
s_correct = fzero(@shoot_residual, [s1, s2]);

% Solve the IVP using the correct s
[x, u] = solve_ivp(s_correct);

% Plot the solution
plot(x, u(:,1), 'b-', 'LineWidth', 2);
xlabel('x'); ylabel('u(x)');
title('Solution using Shooting Method');
grid on;

% Function defining the residual at x=1
function res = shoot_residual(s)
    [x, u] = solve_ivp(s);
    res = u(end, 1); % Residual should be u(1) = 0
end

% Function to solve the IVP using ode45
function [x, u] = solve_ivp(s)
    xspan = [0, 1]; % Interval
    u0 = [0; s]; % Initial conditions [u(0), u'(0)]
    [x, u] = ode45(@(x, u) ode_system(x, u), xspan, u0);
end

% Define the system of ODEs
function du = ode_system(x, u)
    du = zeros(2,1);
    du(1) = u(2);
    du(2) = x - u(1); % Fixed: x is correctly passed to the function
end
