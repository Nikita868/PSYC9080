function angle_deg = absAngle(prox,dist)
% Four-quadrant absolute angle 
% inputs: 
% 
% prox: [x,y] proximal coordinate
% dist [x,y] distal coordinate

xprox= prox(1);
yprox= prox(2);

xdist = dist(1);
ydist= dist(2);

angle_deg = atan2d(yprox-ydist,xprox-xdist);

% correction to output absolute angle as positive if it is in quadrant III
% and IV
if angle_deg <0
    angle_deg = 360+angle_deg;
end




