x = [0 1 2 3 4 5 6 7 8 9 10];
y = [ 48 49 52 63 76 98 136 150 195 236 260];

%plot(x,y,'*')

% first degree
p = polyfit(x,y,1)
m1 = p(1); c1= p(2);
fprintf("y = %fx + %f", m1, c1)
new_y = polyval(p,x);

% using the new_y
J1 = sum((new_y - y).^2);
S1 = sum((new_y - mean(y)).^2);
r_2 = 1- (J1/S1)


% second degree
p1 = polyfit(x,y,2)
m2 = p1(1); c2_1 = p1(2); c2_2 = p1(3);
fprintf("y = %fx^2 + %fx + %f", m2, c2_1, c2_2)
new_y2 = polyval(p1,x);

J2 = sum((new_y2 - y).^2);
S2 = sum((new_y2 - mean(y)).^2);
r_2 = 1- (J2/S2)
