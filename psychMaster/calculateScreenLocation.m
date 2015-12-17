function [screenL, screenR] = calculateScreenLocation(fixation, object, eyeL, eyeR)
%% for when the eye and fixation point give a right-angle triangle.

% thetaPrime = atan ( objectX / (viewingDistance - objectZ));
% screenX = viewingDistance*tan(thetaPrime);
% screenY = objectY;

%% for when the eye and fixation point do not form a right-angle triangle

objectL = object - eyeL;
objectR = object - eyeR;

%left eye
screenLZ = fixation(3); %viewing distance; 57

%theta = atan(objectL(:,1)/objectL(:,3));
theta = atan2(objectL(1),objectL(3));
screenLX = screenLZ * tan(theta); 
screenLY = object(2);
screenL = [screenLX, screenLY, screenLZ] + eyeL;

%right eye
screenRZ = fixation(3); %viewing distance; 57

%theta = atan(object(:,1)/object(:,3));
theta = atan2(objectR(1),objectR(3));
screenRX = screenRZ * tan(theta); 
screenRY = objectR(2);
screenR = [screenRX, screenRY, screenRZ] + eyeR;

end

