% EA2 Project 2 Problem 1
ii = 0;
jj = 0;
g = 9.81;
Lo = 1;
m = 1;
r = 0.1 * Lo;
angle = 0;
Tbc = zeros(71,51);

for B = 20:90
    ii = ii + 1;
    jj = 0;
    for a = 20:0.7142253521:70
        jj = jj + 1;
        % Distance from A
        x1 = r/tand(a/2);
        x2 = r/tand(a/2) + 2*r;
        x3 = r/tand(a/2) + 4*r;
    
        % Normal force
        N1 = (3*m*g*cosd(a)^2)/sind(a) + m*g*sind(a);
        N2 = m*g*sind(a);
        N3 = N2;
    
        % Tension
        %Tbc(ii,jj) = (x1*N1*sind(a) + x2*N2*sind(a) + x3*N3*sind(a))/(Lo*sind(180-B-a));
        Tbc(ii, jj) = (x1*N1 + x2*N2 + x3*N3)/(Lo*sind(180-B-a));
    end
end
B = 20:90;
a = 20:0.7142253521:70;
figure;
surf(B,a,Tbc);
title('Tension vs. Alpha vs. Beta');
xlabel('Beta (degrees)');
ylabel('Alpha (degrees)');
zlabel('Tension in BC (N)');