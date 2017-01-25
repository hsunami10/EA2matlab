% Project 2 Problem 2
% Move A with B (opposite circles)

% Initialize variables
k = 10;
magBE = 17;
coordA = [5 -9 0];
coordB = [17 0 0];
magEA = norm(coordA);
magBA = 0;
Fs = k*magBA;
a = 0:90;
magMom = zeros(1, length(a));

for ii = 1:91
    % Adjust coordinates
    coordB = [magBE*cosd(a(ii)) magBE*sind(a(ii)) 0];
	coordA = [magBE*sind(a(ii))+5 8-magBE*cosd(a(ii)) 0];
    
    % Find vector BA and unit vector BA
    vecBA = coordA - coordB;
    magBA = norm(vecBA);
    eBA = vecBA/magBA;
    
%     magEA = norm(coordA);
    
    % topAngle = acosd((magEA^2 - magBE^2 - magBA^2)/(-2*magBE*magBA));
    
    % Find force vector -> mag * unit vector
    Fs = k*magBA;
    vecF = Fs * eBA;
    
    vecBE = coordB;
    magMom(ii) = norm(cross(vecBE, vecF));
end

figure;
plot(a, magMom);
title('Moment vs Alpha')
xlabel('Angle of Alpha (in degrees)')
ylabel('Moment about E (lb*in)')
