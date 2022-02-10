%% Angular kinematics examples

% Find absolute angle of the thigh
% Provide coordinates for the proximal,and distal markers on the segment. Here, the hip
% marker is proximal, knee is distal.
hipXY = [1.14,0.8];
kneeXY = [1.22,0.51];

thigh_angle_abs = absAngle(hipXY,kneeXY);


% Find relative knee angle

% Provide coordinates for the proximal, center, and distal markers. Here, the hip
% marker is proximal, knee is center, and ankle is distal.
hipXY = [1.14,0.8];
kneeXY = [1.22,0.51];
ankleXY = [1.09, 0.09];

knee_angle = relativeAngle(hipXY,kneeXY,ankleXY);

%% Lower extremity joint angles according to Winter convention

% Winter Knee angle

% Thigh segment absolute angle
hipXY = [1.14,0.8];
kneeXY = [1.22,0.51];
thigh_angle_abs = absAngle(hipXY,kneeXY);

% Leg segment absolute angle
kneeXY = [1.22,0.51];
ankleXY = [1.09, 0.09];
leg_angle_abs = absAngle(kneeXY,ankleXY);

knee_winter_angle = thigh_angle_abs - leg_angle_abs;

% Winter hip angle
% Thigh segment absolute angle
trunkXY = [1.16,0.98];
hipXY = [1.14,0.8];
trunk_angle_abs = absAngle(trunkXY,hipXY);

hip_winter_angle = thigh_angle_abs - trunk_angle_abs;


% Winter ankle angle
% foot segment absolute angle
heelXY = [1.05,0.095];
toeXY = [1.11,0.01];
foot_angle_abs = absAngle(heelXY,toeXY);

ankle_winter_angle = leg_angle_abs - foot_angle_abs + 90;


% plot the XY coordinates for all makers
figure
plot(trunkXY(1),trunkXY(2),'o')
hold
plot(hipXY(1),hipXY(2),'o')
plot(kneeXY(1),kneeXY(2),'o')
plot(ankleXY(1),ankleXY(2),'o')
plot(heelXY(1),heelXY(2),'o')
plot(toeXY(1),toeXY(2),'o')

line([trunkXY(1) hipXY(1)],[trunkXY(2) hipXY(2)])
line([hipXY(1) kneeXY(1)],[hipXY(2) kneeXY(2)])
line([kneeXY(1) ankleXY(1)],[kneeXY(2) ankleXY(2)])
line([heelXY(1) toeXY(1)],[heelXY(2) toeXY(2)])

set(gcf,'Position',[0	103.4	269.6	677.6])
grid on
ylabel('y (m)')
xlabel('x (m)')










