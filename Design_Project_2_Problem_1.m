% Project 2 Problem 1

% Initialize variables
k = 10;
magBE = 17;
magEA = sqrt(106);
magBA = 0;
Fs = k*magBA;
a = 0:90;
magMom = zeros(1, length(a));

% Relative to unstretched
lowHalfAngle = 90-asind(5/sqrt(106));
initBA = sqrt(magBE^2 + magEA^2 - 2*magBE*magEA*cosd(lowHalfAngle));
Finit = k * sqrt(magBE^2 + magEA^2 - 2*magBE*magEA*cosd(lowHalfAngle));

for ii = 1:91
    % Find length of BA
    magBA = sqrt(magBE^2 + magEA^2 - 2*magBE*magEA*cosd(a(ii) + lowHalfAngle));
    Fs = k*magBA - Finit;
    % Calculate top angle in deg
    topAngle = acosd((magEA^2 - magBE^2 - magBA^2)/(-2*magBE*magBA));
    % Moment
    magMom(ii) = magBE*Fs*sind(topAngle);
end

figure;
plot(a, magMom);
title('Moment vs Alpha')
xlabel('Angle of Alpha (in degrees)')
ylabel('Moment about E (lb*in)')