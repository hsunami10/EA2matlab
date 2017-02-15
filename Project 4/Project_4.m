% EA2 Design Project 4

% Part C
Fae = zeros(71, 71);
ii = 0;
jj = 0;

for theta = 10:0.1:80
    ii = ii + 1;
    jj = 0;
    for L = 0:0.01:7
       jj = jj + 1;
       Fae(ii, jj) = norm(((L*cosd(theta)/2) - (0.2*L*cosd(theta)*(L-L*sind(theta))))/(L/4 * sind(theta + atand(3 * tand(theta)))));
    end
end

theta = 10:0.1:80;
increments = 10/78;
L = 0:0.01:7;

figure;
contour(theta, L, Fae);
xlabel('Theta (degrees)');
ylabel('L (meters)');
zlabel('Force of AE (Newtons)');
title('Fae vs L vs Theta');

% Part D
figure;
contourf(theta,L,Fae',1);
xlabel('Theta (degrees)');
ylabel('L (meters)');
zlabel('Force of AE (Newtons)');
title('Fae vs L vs Theta');

% Part E
ii = 0;
jj = 0;
L = 3;
Fae = [];
for theta = 10:80
    ii = ii + 1;
    Fae(ii) = 1/norm(((L*cosd(theta)/2) - (0.2*L*cosd(theta)*(L-L*sind(theta))))/(L/4 * sind(theta + atand(3 * tand(theta)))));
end

figure;
theta = 10:80;
plot(theta, Fae);
ylabel('Force of AE (Newtons)');
xlabel('Theta (degrees)');
title('Theta vs. Force');
