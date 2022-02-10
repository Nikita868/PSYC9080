%% Import motion data from the GAIT IOR sample dataset
data = readtable('dynamic0011_m.csv', 'NumHeaderLines',6);

% Plot data
plot(data.Time, data.R_FCC_Z,'.-')
hold
plot(data.Time,data.L_FCC_Z,'.-')
ylabel('Vertical Z (mm)')
xlabel('Time (s)')
legend('R','L')

%% Fill missing data using cubic spline interpolation
L_FCC_Z_int = cubicSpline(data.L_FCC_Z);

figure
plot(data.Time, L_FCC_Z_int,'.-')
hold
plot(data.Time, data.L_FCC_Z,'.-')
plot(data.Time, data.R_FCC_Z,'.-')
legend('L-heel-Z-interp','L-heel-Z','R_heel-Z')
ylabel('Vertical Z (mm)')
xlabel('Time (s)')

%% Estimate velocity and acceleration on raw data
Fs = 1/(data.Time(2)-data.Time(1));
R_FCC_vel = velocityWinter(data.R_FCC_Z,Fs)';
R_FCC_acc = accelWinter(data.R_FCC_Z,Fs)';

% Plot position and velocity together
figure
Time = seconds(data.Time);
TT = timetable(Time,data.R_FCC_Z,R_FCC_vel,R_FCC_acc);
stackedplot(TT)

%% Estimate velocity and acceleration on filtered data

% Specify conventional 4-th order Butterworth low-pass filter with cutoff frequency of 7 Hz. 
Fs = 100; % sampling frequency
Fc = 15;
order = 4;
[b,a] = butter(order,Fc/(Fs/2),'low'); % IIR filter design

% zero-phase filtering
R_FCC_Z_filt = filtfilt(b,a,data.R_FCC_Z);

figure
plot(data.Time,data.R_FCC_Z,'.-')
hold
plot(data.Time,R_FCC_Z_filt,'.-')
legend('Raw','Filtered')
ylabel('Vertical Z (mm)')
xlabel('Time (s)')

R_FCC_vel = velocityWinter(R_FCC_Z_filt,Fs)';
R_FCC_acc = accelWinter(R_FCC_Z_filt,Fs)';

% Plot position and velocity together
figure
Time = seconds(data.Time);
TT = timetable(Time,data.R_FCC_Z,R_FCC_vel,R_FCC_acc);
stackedplot(TT)

%% Integration
R_FCC_vel([1])=0;
R_FCC_vel([end])=0;

R_FCC_int = cumtrapz(R_FCC_vel)*(1/Fs)
figure
plot(R_FCC_int,'.-')
hold
plot(R_FCC_Z_filt,'.-')
legend('L-heel-Z-Integrated','R-heel-Z')
ylabel('Vertical Z (mm)')
xlabel('Time (s)')

%% Graphical presentations

% Angle-velocity graph (phase plane)
figure
plot(data.R_FCC_Z,R_FCC_vel,'.-')
grid on
xlabel('Heel-z (mm)')
ylabel('Heel-z vel (mm/s)')


%% Ensemble average  example

% Samples when the right heel strikes the ground (identified based on GRFv)
Rhs = [15 103 190 279 366 454 541 630]

figure
hold
for i = 1:length(Rhs)-1
    plot(data.R_FCC_Z(Rhs(i):Rhs(i+1)),'.-')
end
ylabel('Z (mm)')
xlabel('Sample')

% Time-normalize the data to range from 0% to 100%
clear R_FCC_norm
for i = 1:length(Rhs)-1
    R_FCC_norm(:,i) = timeNormalize(data.R_FCC_Z(Rhs(i):Rhs(i+1)),100);
end

figure
subplot(211)
plot(R_FCC_norm,'.-')
ylabel('Z (mm)')
xlabel('Normalized time (%)')

subplot(212)
errorbar(mean(R_FCC_norm'),std(R_FCC_norm'))
ylabel('Z (mm)')
xlabel('Normalized time (%)')





