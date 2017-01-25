% EA 2 Design Project 1 Problem 1
% Michael Hsu
% NetID: mkh3212

% Initialize
x = 0:0.1:5;
z = 0:-0.1:-5;
y = 0;
AC = [-3 4 -2];
AD = [-2 4 3];
eAC = 1/norm(AC) * AC;
eAD = 1/norm(AD) * AD;
tAB = zeros(length(x), length(z));
tAC = zeros(length(x), length(z));
tAD = zeros(length(x), length(z));

% Error checks
if(~isvector(x) || ~isvector(z))
error('Make sure x and z are vectors');
end
if(length(x) ~= length(z))
error('Lengths of x and z vectors have to be the same'); 
end

% Run through x and z vectors, store corresponding tensions in outputs
for ii = 1:length(x)
    for jj = 1:length(z)
        
        AB = [x(ii) y+4 z(jj)];
        eAB = 1/norm(AB) * AB;

        aug = [eAC(1) eAD(1) eAB(1) 0;
               eAC(2) eAD(2) eAB(2) 981;
               eAC(3) eAD(3) eAB(3) 0];
        aug = rref(aug);

        tAC(ii, jj) = aug(1, 4);
        tAD(ii, jj) = aug(2, 4);
        tAB(ii, jj) = aug(3, 4);
    end
end

% Graph x, z, tension here
figure(1);
surf(x,z,tAB);
title('Position of B on Tension AB');
xlabel('X Coordinates');
ylabel('Z Coordinates');
zlabel('Tension (N)');

figure(2);
surf(x,z,tAC);
title('Position of B on Tension AC');
xlabel('X Coordinates');
ylabel('Z Coordinates');
zlabel('Tension (N)');

figure(3);
surf(x,z,tAD);
title('Position of B on Tension AD');
xlabel('X Coordinates');
ylabel('Z Coordinates');
zlabel('Tension (N)');