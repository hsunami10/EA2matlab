% EA2 Project 3 Problem 1

% Initialize variables
g = 9.81;
m = 1;
Lo = 1;
r = 0.1 * Lo;
Tbc = zeros(1,51);
a = 20:70;

for ii = 1:51
    % Distance from A
    x1 = r/tand(a(ii)/2);
    x2 = r/tand(a(ii)/2) + 2*r;
    x3 = r/tand(a(ii)/2) + 4*r;
    
    % Normal force
    N1 = (3*m*g*cosd(a(ii))^2)/sind(a(ii)) + m*g*sind(a(ii));
    N2 = m*g*sind(a(ii));
    N3 = N2;
    
    % Tension
    Tbc(ii) = ((x1*N1) + (x2*N2) + (x3*N3))/(Lo*sind(90-a(ii)));
end
% Change signs of tension in the future
figure;
plot(a,Tbc);
title('Angle Alpha vs. Tension in cable BC');
xlabel('Alpha (Degrees)');
ylabel('Tension in BC (N)');

minimum = min(Tbc);
ind = find(Tbc == minimum,1);
fprintf('The smallest tension is %.1fN at %.1f degrees.\n', minimum, a(ind));
