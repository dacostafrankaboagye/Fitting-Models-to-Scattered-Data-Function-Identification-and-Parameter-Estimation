
clear all; close all; clc;
%Time (sec) 0 120 240 360 480 600 720 840 960 1080 1200
%Temperature (oF) 204 191 178 169 160 153 147 141 137 132 127


t = [0 120 240 360 480 600 720 840 960 1080 1200];
T = [204 191 178 169 160 153 147 141 137 132 127];


cT = T - 70;

% linear 
%plot(t, cT, '-')


log_t = log10(t);
log_T = log10(T);

log_cT = log10(cT);


% power
%plot(log_t, log_cT, '-')



% exponent
plot(t, log_cT, '*')


% selecting exponenet
% cT = be^(mt)

p = polyfit(t, log_cT, 1);

new_cT_log = polyval(p,t);

hold on; plot(t, new_cT_log);

% quality of fit
m = p(1) / log10(exp(1))
b = 10^(p(2))
new_cT = b .* exp(m.*t);

J = sum((new_cT - cT).^2);
S = sum((new_cT - mean(cT)).^2);

r_2 = 1 - (J/S)

syms t
fprintf("∆T = %fe^(%ft)", b,m)
