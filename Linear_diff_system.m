close all; 
clear all;
clc;

a1 = 0;
a2 = 0;
a3 = 0;

inital_conditions = [
    0, 1;
    0, 0;
    0, -1
];

% Create the system
differential_system = @(x, y, z) [
    x - y + 2*z + (a1*(x.^2)*z);
    3*x - z + (a2*x*y);
    2*x + y + (a3*(y.^2))
];

wrapped_differential_system = @(t, Y) differential_system(Y(1), Y(2), Y(3));


[t, euler_numerical_solution] = Euler_Method(differential_system, 0, 5, 0.1, inital_conditions);
[t, RK45_numerical_solution] = Classical_Runge_Kutta(wrapped_differential_system, 0, 5, 0.1, inital_conditions);

x = @(t) 0.1041 * 0.80 * exp(2.51*t) + 2 * 0.4584 * exp(-0.76*t) .* cos(1.79*t) - 2 * 0.1499 * exp(-0.76*t) .* sin(1.79*t);
y = @(t) 0.1041 * 0.50 * exp(2.51*t) + 2 * (-0.75*0.4584 + 2.12*0.1499) * exp(-0.76*t) .* cos(1.79*t) + 2 * (-2.12*0.4584 - 0.75*0.1499) * exp(-0.76*t) .* sin(1.79*t);
z = @(t) 0.1041 * 1.00 * exp(2.51*t) + 2 * (-1.26*0.4584 + 0.17*0.1499) * exp(-0.76*t) .* cos(1.79*t) + 2 * (-0.17*0.4584 - 1.26*0.1499) * exp(-0.76*t) .* sin(1.79*t);
analytical_solution = [x(t); y(t); z(t)];

figure(1);

hold on;
% Plot euler method numerical solutions
plot(t, euler_numerical_solution(1, :), 'r-o');
plot(t, euler_numerical_solution(2, :), 'g-o');
plot(t, euler_numerical_solution(3, :), 'b-o');

% Plot analyitical solutions
plot(t, analytical_solution(1, :), 'r-x');
plot(t, analytical_solution(2, :), 'g-x');
plot(t, analytical_solution(3, :), 'b-x');

% Plot error margins
plot(t, abs(analytical_solution(1,:) - euler_numerical_solution(1,:)), 'r--', 'LineWidth', 2);
plot(t, abs(analytical_solution(2,:) - euler_numerical_solution(2,:)), 'g--', 'LineWidth', 2);
plot(t, abs(analytical_solution(3,:) - euler_numerical_solution(3,:)), 'b--', 'LineWidth', 2);

hold off;

legend('x(t) Euler Numerical', 'y(t) Euler Numerical', 'z(t) Euler Numerical', 'x(t) Analytical', 'y(t) Analytical', 'z(t) Analytical', 'x(t) Error', 'y(t) Error', 'z(t) Error')
xlabel('Time t')
ylabel('Solution value')
title('Analytical Solution of Linear System (Euler Method)')
grid on;

figure(2);

hold on;
% Plot RK45 method numerical solutions
plot(t, RK45_numerical_solution(1, :), 'r-o');
plot(t, RK45_numerical_solution(2, :), 'g-o');
plot(t, RK45_numerical_solution(3, :), 'b-o');

% Plot analyitical solutions
plot(t, analytical_solution(1, :), 'r-x');
plot(t, analytical_solution(2, :), 'g-x');
plot(t, analytical_solution(3, :), 'b-x');

% Plot error margins
plot(t, abs(analytical_solution(1,:) - RK45_numerical_solution(1,:)), 'r--', 'LineWidth', 2);
plot(t, abs(analytical_solution(2,:) - RK45_numerical_solution(2,:)), 'g--', 'LineWidth', 2);
plot(t, abs(analytical_solution(3,:) - RK45_numerical_solution(3,:)), 'b--', 'LineWidth', 2);

hold off;

legend('x(t) Numerical RK45', 'y(t) Numerical RK45', 'z(t) Numerical RK45', 'x(t) Analytical', 'y(t) Analytical', 'z(t) Analytical', 'x(t) Error', 'y(t) Error', 'z(t) Error')
xlabel('Time t')
ylabel('Solution value')
title('Analytical Solution of Linear System (RK45 Method)')
grid on;

figure(3);

hold on;
% Plot RK45 method numerical solutions
plot(t, RK45_numerical_solution(1, :), 'r-o');
plot(t, RK45_numerical_solution(2, :), 'g-o');
plot(t, RK45_numerical_solution(3, :), 'b-o');

% Plot euler method numerical solutions
plot(t, euler_numerical_solution(1, :), 'r-x');
plot(t, euler_numerical_solution(2, :), 'g-x');
plot(t, euler_numerical_solution(3, :), 'b-x');

% Plot error margins
plot(t, abs(euler_numerical_solution(1,:) - RK45_numerical_solution(1,:)), 'r--', 'LineWidth', 2);
plot(t, abs(euler_numerical_solution(2,:) - RK45_numerical_solution(2,:)), 'g--', 'LineWidth', 2);
plot(t, abs(euler_numerical_solution(3,:) - RK45_numerical_solution(3,:)), 'b--', 'LineWidth', 2);

hold off;

legend('x(t) Numerical RK45', 'y(t) Numerical RK45', 'z(t) Numerical RK45', 'x(t) Numerical Euler', 'y(t) Numerical Euler', 'z(t) Numerical Euler', 'x(t) Error', 'y(t) Error', 'z(t) Error')
xlabel('Time t')
ylabel('Solution value')
title('Analytical Solution of Linear System (RK45 vs Euler Method)')
grid on;