function [t, X] = Classical_Runge_Kutta(f, initial_point, final_point, h, inital_conditions)

    % Classical_Runge_Kutta: Solves a system of first-order ODEs using the classical
    % Runge-Kutta method (RK4).
    % Inputs:
    %   f - Function handle representing the system of ODEs. It should accept
    %       the state variables as separate arguments (e.g., f(x1, x2, x3)).
    %   initial_point - Starting time point (scalar).
    %   final_point - Ending time point (scalar).
    %   h - Step size for the Runge-Kutta method (scalar).
    %   initial_conditions - Column vector representing the initial values of
    %       the state variables.
    % Outputs:
    %   t - Time vector.
    %   X - Matrix where each column represents the state variables at each time step.

    t = initial_point(1):h:final_point;
    X = inital_conditions(:, 1);
    
    for n = 1:(length(t)-1)
        k1 = h*f(t(n), X(:, n));
        k2 = h*f(t(n) + 0.5*h, X(:, n) + 0.5*k1);
        k3 = h*f(t(n) + 0.5*h, X(:, n) + 0.5*k2);
        k4 = h*f(t(n) + h, X(:, n) + k3);
        X(:, n+1) = X(:, n) + (1/6)*(k1 + 2*k2 + 2*k3 + k4);
    end
    
end