% Parameters
params.E = 2e11;
params.I = 1e-6;
params.q0 = 1000;
params.L = 1;
params.x0 = 0;
params.xf = 1;
params.u0 = 0;
params.uf = 0;

[t, X] = Shooting_Method(params);
plot(t, X(:,1), 'b-', 'LineWidth', 2);
xlabel('x'); ylabel('u(x)');
title('Beam Deflection using Shooting Method');
grid on;

