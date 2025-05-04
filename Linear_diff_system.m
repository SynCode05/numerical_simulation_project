close all; 
clear all;
clc;

a1 = 0;
a2 = 0;
a3 = 0;

initial_conditions = [
    1;
    0;
    -1
];

% Create the system
differential_system = @(x, y, z) [
    3*x - 2*y + 2*z + (a1*(x.^2)*z);
    2*y + z + (a2*x*y);
    4*y + 2*z + (a3*(y.^2))
];

wrapped_differential_system = @(t, Y) differential_system(Y(1), Y(2), Y(3));

[t, euler_numerical_solution] = Euler_Method(differential_system, 0, 5, 0.1, initial_conditions);
[t, RK45_numerical_solution] = Classical_Runge_Kutta(wrapped_differential_system, 0, 5, 0.1, initial_conditions);

x = @(t) (0.5) + exp(3 * t) - (0.5) * exp(4 * t);
y = @(t) (0.25) - (0.25) * exp(4 * t);
z = @(t) (-0.5) - (0.5) * exp(4 * t);
analytical_solution = [x(t); y(t); z(t)];

figure(1);

hold on;
% Plot euler method numerical solutions
plot(t, euler_numerical_solution(1, :), 'r-o');
plot(t, euler_numerical_solution(2, :), 'g-o');
plot(t, euler_numerical_solution(3, :), 'b-o');

% Plot RK45 method numerical solutions
plot(t, RK45_numerical_solution(1, :), 'r-x');
plot(t, RK45_numerical_solution(2, :), 'g-x');
plot(t, RK45_numerical_solution(3, :), 'b-x');


% Plot analyitical solutions
plot(t, analytical_solution(1, :), 'r--');
plot(t, analytical_solution(2, :), 'g--');
plot(t, analytical_solution(3, :), 'b--');

hold off;

legend('x(t) Euler Numerical', 'y(t) Euler Numerical', 'z(t) Euler Numerical', 'x(t) RK45 Numerical', 'y(t) RK45 Numerical', 'z(t) RK45 Numerical', 'x(t) Analytical', 'y(t) Analytical', 'z(t) Analytical', 'Location', 'northwest')
xlabel('Time t')
ylabel('Solution value')
title('Solution of Linear System')
grid on;

figure(2);

hold on;

% Plot absolute error margins
plot(t, abs(analytical_solution(1,:) - RK45_numerical_solution(1,:)), 'r-x', 'LineWidth', 2);
plot(t, abs(analytical_solution(2,:) - RK45_numerical_solution(2,:)), 'g-x', 'LineWidth', 2);
plot(t, abs(analytical_solution(3,:) - RK45_numerical_solution(3,:)), 'b-x', 'LineWidth', 2);

% Plot error margins
plot(t, abs(analytical_solution(1,:) - euler_numerical_solution(1,:)), 'r--', 'LineWidth', 2);
plot(t, abs(analytical_solution(2,:) - euler_numerical_solution(2,:)), 'g--', 'LineWidth', 2);
plot(t, abs(analytical_solution(3,:) - euler_numerical_solution(3,:)), 'b--', 'LineWidth', 2);

hold off;

legend('x(t) RK45 Abs. Error', 'y(t) RK45 Abs. Error', 'z(t) RK45 Abs. Error', 'x(t) Euler Abs. Error', 'y(t) Euler Abs. Error', 'z(t) Euler Abs. Error', 'Location', 'northwest')
xlabel('Time t')
ylabel('Absolute Error')
title('Absolution Errors of the Solutions of the Sinear System ')
grid on;