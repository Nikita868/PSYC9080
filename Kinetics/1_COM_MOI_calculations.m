%% COM coordinate estimate for a segement

% Total body mass
M = 72.4

% Thigh 
hipXY = [1.32,0.97];
kneeXY = [1.47,0.53];
m_thigh = M*0.1;
Rprox = .433;

COm_thighigh = hipXY+Rprox.*(kneeXY-hipXY);

figure
hold on
plot(hipXY(1),hipXY(2),'ko')
plot(kneeXY(1),kneeXY(2),'ko')
line([hipXY(1) kneeXY(1)],[hipXY(2) kneeXY(2)])
plot(COm_thighigh(1),COm_thighigh(2),'r*')
ylabel('Y (m)')
xlabel('X (m)')

% Shank 
kneeXY = [1.47,0.53];
ankleXY = [1.37,0.12];
m_shank = M*0.0465;
Rprox = .433;

% Find COM shank
COm_shankank= kneeXY+Rprox.*(ankleXY-kneeXY)

% Plot results
figure
hold
plot(ankleXY(1),ankleXY(2),'ko')
plot(kneeXY(1),kneeXY(2),'ko')
line([ankleXY(1) kneeXY(1)],[ankleXY(2) kneeXY(2)])
plot(COm_shankank(1),COm_shankank(2),'r*')
ylabel('Y (m)')
xlabel('X (m)')

% Find overall COM of the two link-segment (thigh-shank)
m_tot = m_shank+m_thigh; % find total mass of the two-link segment
COM_overall = (m_shank/m_tot)*COm_shankank + (m_thigh/m_tot)*COm_thighigh;

% plot the results
figure
hold on 
plot(hipXY(1),hipXY(2),'ko')
plot(kneeXY(1),kneeXY(2),'ko')
line([hipXY(1) kneeXY(1)],[hipXY(2) kneeXY(2)])
plot(COm_thighigh(1),COm_thighigh(2),'r*')
plot(ankleXY(1),ankleXY(2),'ko')
plot(kneeXY(1),kneeXY(2),'ko')
line([ankleXY(1) kneeXY(1)],[ankleXY(2) kneeXY(2)])
plot(COm_shankank(1),COm_shankank(2),'r*')
plot(COM_overall(1),COM_overall(2),'ro')
ylabel('Y (m)')
xlabel('X (m)')


%% Moment of inertia of the thigh calculation
K_thigh = .54
L_thigh = segmentLength(hipXY,kneeXY)

I_prox_thigh = m_thigh*(L_thigh*L_thigh)^2

% moment of inertia of the shank
K_shank = .528
L_shank = segmentLength(kneeXY,ankleXY)

I_prox_thigh = m_shank*(L_shank*L_shank)^2







