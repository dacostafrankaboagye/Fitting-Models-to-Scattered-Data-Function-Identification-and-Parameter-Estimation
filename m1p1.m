% MATLAB
 
%{
Force 𝑓 (lb) 0 100 200 300 400 500 600 700 800
Deflection 𝑥 (in. ) 0 0.15 0.23 0.35 0.37 0.5 0.57 0.68 0.77

%}





f = 0:100:800;
x = [0 0.15 0.23 0.35 0.37 0.5 0.57 0.68 0.77];

% f is the x (the input), the force, 
% x is the y (the output), the displacement

scatter(f,x)

p = polyfit(f,x,1);

m = p(1)
b = p(2)

y_new = polyval(p, f);

hold on;
plot(f, y_new)

% making it pass through the origin

theM = sum(x .* f) ./ sum(f .^2)

new_y = theM .* f;

plot(f, new_y)

% the quality of fit
J = sum((new_y - x) .^2)
S = sum((new_y - mean(x)) .^2)

% let r squared be r_2

r_2  = 1 - (J/S)


% if f = 550 
theX1 = theM * 550
% if x= 1.2
theY1 = 1.2 / theM
% the stiffness
theStif = 1 / theM


