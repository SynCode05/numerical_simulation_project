function [t, X] = Shooting_Method(params)

    % Shooting: find the correct slope
    z_correct = fzero(@(z) bar_res(z, params), [params.x0, params.xf]);

    % Solve with RK4 using correct slope
    [t, X] = Classical_Runge_Kutta(@(x, u) up(x, u, params), params.x0, params.xf, 0.001, [params.u0; z_correct]);
end

function r = bar_res(z, p)
    [~, X] = Classical_Runge_Kutta(@(x, u) up(x, u, p), p.x0, p.xf, 0.001, [p.u0; z]);
    r = X(1, end) - p.uf;
end

function dudx = up(x, u, p)
    dudx = [u(2); p.upp(x)];
end
