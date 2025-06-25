% grid of values for zeta and nu
[zeta, eta] = meshgrid(linspace(-1, 1, 100), linspace(-1, 1, 100));  % or [0,1] depending on context

% surface functions
N1 = 0.295 - 0.516*zeta - 0.516*eta + 1.180*zeta.*eta;
N2 = 0.5   - 0.279*zeta + 0.131*eta - 2.819*zeta.*eta;
N3 = -1.017 + 2.780*zeta + 2.780*eta - 4.068*zeta.*eta;
N4 = 0.220 - 0.760*zeta + 0.240*eta - 1.121*zeta.*eta;

% Plot each surface
figure;
subplot(2,2,1);
surf(zeta, eta, N1);
title('N1');
xlabel('\zeta'); ylabel('\eta'); zlabel('N1');
shading interp;

subplot(2,2,2);
surf(zeta, eta, N2);
title('N2');
xlabel('\zeta'); ylabel('\eta'); zlabel('N2');
shading interp;

subplot(2,2,3);
surf(zeta, eta, N3);
title('N3');
xlabel('\zeta'); ylabel('\eta'); zlabel('N3');
shading interp;

subplot(2,2,4);
surf(zeta, eta, N4);
title('N4');
xlabel('\zeta'); ylabel('\eta'); zlabel('N4');
shading interp;
