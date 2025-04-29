function [t, X] = Euler_Method(f, initial_point, final_point, h, initial_conditions)
    
    % Euler_Method: Solves a system of first-order ODEs using the Euler method.
    % Inputs:
    %   f - Function handle representing the system of ODEs. It should accept
    %       the state variables as separate arguments (e.g., f(x1, x2, x3)).
    %   initial_point - Starting time point (scalar).
    %   final_point - Ending time point (scalar).
    %   h - Step size for the Euler method (scalar).
    %   initial_conditions - Column vector representing the initial values of
    %       the state variables.
    % Outputs:
    %   t - Time vector.
    %   X - Matrix where each column represents the state variables at each time step.

    t = initial_point:h:final_point;

    X = zeros(size(initial_conditions, 1), length(t));
    X(:, 1) = initial_conditions;  % Corrected to assign initial_conditions to the first column

    for n = 1:(length(t)-1)
        X(:,n+1) = X(:,n) + h * f(X(1,n), X(2,n), X(3,n));
    end 

end