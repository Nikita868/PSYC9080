function a = segmentLength(prox,dist)
% Find segment length: 
% 
% prox: [x,y] proximal coordinate
% dist [x,y] distal coordinate

xprox= prox(1);
yprox= prox(2);

xdist = dist(1);
ydist= dist(2);

a = sqrt( (xprox-xdist)^2 + (yprox-ydist)^2 );  