function [t, X] = Classical_Runge_Kutta(f, initial_point, final_point, h, inital_conditions)

    t = initial_point(1):h:final_point;
    X = inital_conditions(:,2);
    
    for n = 1:(length(t)-1)
        k1 = h*f(t(n), X(:, n));
        k2 = h*f(t(n) + 0.5*h, X(:, n) + 0.5*k1);
        k3 = h*f(t(n) + 0.5*h, X(:, n) + 0.5*k2);
        k4 = h*f(t(n) + h, X(:, n) + k3);
        X(:, n+1) = X(:, n) + (1/6)*(k1 + 2*k2 + 2*k3 + k4);
    end
    
end