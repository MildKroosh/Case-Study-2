% Parameters
m = 500;        
c = 2000;       
ke = 80000;     

% Initial conditions
x_init = 0.01;  
v_init = 0;     
X0 = [x_init; v_init];
tspan = [0 5];

[t, X] = ode45(@(t,X) maglev_ode(t, X, m, c, ke), tspan, X0);

% Extract results
x = X(:,1); 
v = X(:,2);   

figure;
plot(t, x, 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Displacement x (m)');
title('Maglev Train Suspension Response - Displacement');
grid on;

figure;
plot(t, v, 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Velocity v (m/s)');
title('Maglev Train Suspension Response - Velocity');
grid on;

figure;
plot(x, v, 'LineWidth', 2);
xlabel('Displacement x (m)');
ylabel('Velocity v (m/s)');
title('Phase Plane Plot');
grid on;

function dXdt = maglev_ode(~, X, m, c, ke)
    dXdt = zeros(2,1);
    dXdt(1) = X(2);
    dXdt(2) = -(c/m)*X(2) - (ke/m)*X(1);
end
