function [t, X] = Euler_Method(f, initial_point, final_point, h, inital_conditions)

    t = initial_point(1):h:final_point;

    X = inital_conditions(:,2);
    
    for n = 1:(length(t)-1)
        X(:,n+1) = X(:,n) + h * f(X(1,n), X(2,n), X(3,n));
    end 

end