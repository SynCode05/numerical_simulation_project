function [t, X] = Shooting_Method(params)

    % Shooting
    z_correct = fzero(@(z) bar_res(z, params), [params.x0, params.xf]);

    % Optional: plot the final solution
    [t, X] = ode45(@(x,u) up(x,u,params), linspace(0, params.L, 1000), [params.u0; z_correct]);
end

% --- Residual function ---
function r = bar_res(z, p)
    [~, X] = ode45(@(x,u) up(x,u,p), [p.x0, p.xf], [p.u0; z]);
    r = X(end,1) - p.uf;  % residual = u(xf) - target
end

% --- ODE system ---
function dudx = up(x, u, p)
    q = @(x) p.q0 * sin(pi * x / p.L);
    dudx = [u(2); p.upp(x)];
end
