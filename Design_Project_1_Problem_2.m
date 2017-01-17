% EA 2 Design Project 1 Problem 2
% Michael Hsu
% NetID: mkh3212

% Initialize
x = 0:0.1:5;
z = 0:-0.1:-5;
y = 0;
AC = [-3 4 -2];
AD = [-2 4 3];
AB = zeros(1, 3);
eAC = 1/norm(AC) * AC;
eAD = 1/norm(AD) * AD;
tAB = zeros(1,961);
lengthAB = zeros(1,length(x) * length(z));
cost = zeros(length(x), length(z));
costs = zeros(length(x), length(z));
realCost = [];
X = [];
Z = [];
aug = zeros(3, 4);
index = 0;
count = 0;

% Error checks
if(~isvector(x) || ~isvector(z))
    error('Make sure x and z are vectors');
end
if(length(x) ~= length(z))
   error('Lengths of x and z vectors have to be the same'); 
end

% x has to be equal to or larger than zero
for ii = 1:length(x)
    for jj = 1:length(z)
        index = index + 1;
        
        AB = [x(ii) y+4 z(jj)];
        eAB = 1/norm(AB) * AB;
        
        aug = [eAC(1) eAD(1) eAB(1) 0;
               eAC(2) eAD(2) eAB(2) 981;
               eAC(3) eAD(3) eAB(3) 0];
        aug = rref(aug);
        
        % Vector of tension forces, corresponding lengths, and cost (for
        % min cost)
        tAB(index) = aug(3, 4);
        lengthAB(index) = norm(AB);
        cost(index, index) = tAB(index) * lengthAB(index);
        
        % To find x and z value at min cost
        if(cost(index, index) >= 0 && tAB(index) <= 981)
            count = count + 1;
            realCost(count) = cost(index, index);
            X(count) = x(ii);
            Z(count) = z(jj);
        end
        
        % Cost (for graph) is tension * length
        costs(ii, jj) = aug(3,4) * norm(AB);
    end
end

% Find the minimum cost, then find the x and z values for that min cost
minimum = min(min(costs));
ind = find(realCost == minimum,1);
fprintf('Minimum cost: $%.2f\nX location: %.2f\nZ location: %.2f\n', minimum, X(ind), Z(ind));

figure;
surf(x, z, costs);
title('Relationship between x-coordinates, z-coordinates, and cost');
xlabel('X Coordinates');
ylabel('Z Coordinates');
zlabel('Cost');