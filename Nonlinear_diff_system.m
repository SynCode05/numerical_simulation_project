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
    3*x - 2*y + 2*z + (a1*(x.^2)*z);
    2*y + z + (a2*x*y);
    4*y + 2*z + (a3*(y.^2))
];

wrapped_differential_system = @(t, Y) differential_system(Y(1), Y(2), Y(3));


[t, euler_numerical_solution] = Euler_Method(differential_system, 0, 5, 0.1, initial_conditions);
[t, RK45_numerical_solution] = Classical_Runge_Kutta(wrapped_differential_system, 0, 5, 0.1, initial_conditions);

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
hold off;

legend('x(t) Euler Numerical', 'y(t) Euler Numerical', 'z(t) Euler Numerical', 'x(t) RK45 Numerical', 'y(t) RK45 Numerical', 'z(t) RK45 Numerical', 'Location', 'northwest')
xlabel('Time t')
ylabel('Solution value')
title('Numerical solution of Linear System')
grid on;

figure(2);

hold on;

% Plot absolute error margins
plot(t, abs(RK45_numerical_solution(1,:) - euler_numerical_solution(1,:)), 'r--', 'LineWidth', 2);
plot(t, abs(RK45_numerical_solution(2,:) - euler_numerical_solution(2,:)), 'g--', 'LineWidth', 2);
plot(t, abs(RK45_numerical_solution(3,:) - euler_numerical_solution(3,:)), 'b--', 'LineWidth', 2);

hold off;

legend('x(t) Abs. Error', 'y(t) Abs. Error', 'z(t) Abs. Error', 'Location', 'northwest')
xlabel('Time t')
ylabel('Solution value')
title('Absolute error of numerical solutions')
grid on;
