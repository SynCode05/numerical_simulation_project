close all; 
clear all;
clc;

a1 = 0.5;
a2 = -1;
a3 = 0.25;

initial_conditions = [
    1;
    0;
    -1
];

% Create the system
differential_system = @(x, y, z) [
    x - y + 2*z + (a1*(x.^2)*z);
    3*x - z + (a2*x*y);
    2*x + y + (a3*(y.^2))
];

wrapped_differential_system = @(t, Y) differential_system(Y(1), Y(2), Y(3));


[t, euler_numerical_solution] = Euler_Method(differential_system, 0, 5, 0.1, initial_conditions);
[t, RK45_numerical_solution] = Classical_Runge_Kutta(wrapped_differential_system, 0, 5, 0.1, initial_conditions);

hold on;
% Plot RK45 method numerical solutions
plot(t, RK45_numerical_solution(1, :), 'r-o');
plot(t, RK45_numerical_solution(2, :), 'g-o');
plot(t, RK45_numerical_solution(3, :), 'b-o');

% Plot euler method numerical solutions
plot(t, euler_numerical_solution(1, :), 'r--');
plot(t, euler_numerical_solution(2, :), 'g--');
plot(t, euler_numerical_solution(3, :), 'b--');

% Plot error margins
plot(t, abs(euler_numerical_solution(1,:) - RK45_numerical_solution(1,:)), 'r--', 'LineWidth', 2);
plot(t, abs(euler_numerical_solution(2,:) - RK45_numerical_solution(2,:)), 'g--', 'LineWidth', 2);
plot(t, abs(euler_numerical_solution(3,:) - RK45_numerical_solution(3,:)), 'b--', 'LineWidth', 2);

hold off;

legend('x(t) Numerical RK45', 'y(t) Numerical RK45', 'z(t) Numerical RK45', 'x(t) Numerical Euler', 'y(t) Numerical Euler', 'z(t) Numerical Euler', 'x(t) Error', 'y(t) Error', 'z(t) Error')
xlabel('Time t');
ylabel('Solution value');
title('Numerical Solution of Nonlinear System (RK45 vs Euler Method)');
grid on;
