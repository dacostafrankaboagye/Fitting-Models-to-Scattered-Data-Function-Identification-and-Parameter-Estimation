


%{
Height ℎ (cm) 11 10 9 8 7 6 5 4 3 2 1
Time 𝑡 (s) 7 7.5 8 8.5 9 9.5 11 12 14 19 26
%}
clear all; close all; clc;

h = linspace(11,1,11);
t = [7 7.5 8 8.5 9 9.5 11 12 14 19 26];

f = 250 ./ t;

% the x is h
% the y is f

% linear 
%plot(h,f)

% exponential
log_h = log10(h)
log_f = log10(f)
%plot(h, log_f)

% power
%plot(log_h, log_f)

% selcting the power fnx
% f = bh^m <- the function

scatter(log_h, log_f)

p = polyfit(log_h, log_f,1)
new_f_log = polyval(p, log_h);

hold on;
plot(log_h, new_f_log)

% the quality of fit
m = p(1)
b = 10^(p(2))

new_f = b .* (h.^m);

% plotting the fit on it; 
hold off;

scatter(h,f); hold on;
plot(h, new_f);



J = sum((new_f - f).^2)
S = sum((new_f - mean(f)).^2)


r_2 = 1 - (J/S)


% if h is 5.4
theF = b * (5.4)^m ;
theT = 250/theF

