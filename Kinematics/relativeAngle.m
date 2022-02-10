function angle_deg = relativeAngle(prox,center,dist)
% Relative joint angle using cosine law
% inputs: 
% 
% prox: [x,y] proximal coordinate
% center: [x,y] joint center coordinate
% dist [x,y] distal coordinate

xprox= prox(1);
yprox= prox(2);

xcenter = center(1);
ycenter = center(2);

xdist = dist(1);
ydist= dist(2);

% Find segment lengths
a = sqrt( (xprox-xdist)^2 + (yprox-ydist)^2 );  
b = sqrt( (xprox-xcenter)^2 + (yprox-ycenter)^2 );  
c = sqrt( (xcenter-xdist)^2 + (ycenter-ydist)^2 ); 

angle_deg = acosd( (a^2-b^2-c^2) / (-2*b*c) );


