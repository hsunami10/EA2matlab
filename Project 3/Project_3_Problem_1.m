% EA2 Project 3 Problem 1

% Initialize variables
g = 9.81;
m = 1;
Lo = 1;
r = 0.1 * Lo;
Tbc = zeros(1,51);
a = 20:70;

for ii = 1:51
    Tbc(ii) = -(m*g*sind(a(ii))*((3*r)/tand(a(ii)/2) + 0.6))/(Lo*sind(90-a(ii)));
end

