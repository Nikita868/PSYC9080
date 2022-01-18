% Code for simulation of sine waves and Fourier analysis (spectrum and
% power). Adapted from:
% https://www.mathworks.com/help/matlab/ref/fft.html
% https://www.mathworks.com/help/signal/ug/power-spectral-density-estimates-using-fft.html

Fs = 1000;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = 1500;             % Length of signal
t = (0:L-1)*T;        % Time vector

% Sine wave parameters
a = 1;
A = 2;
f = 50; % in Hz
theta = -pi/4; % in rad

% Generate sine wave
S = a + A*sin(2*pi*f*t+theta)

% Plot
plot(t,S)
title('Signal')
xlabel('t (milliseconds)')
ylabel('X(t)')

% Composition of two sine waves
S = 1*sin(50*pi*2*t) + .5*sin(2*pi*120*t);

figure
plot(t,S)
title('Signal')
xlabel('t (milliseconds)')
ylabel('X(t)')

% Another way to visualize addiiton of sines
S1 = 1*sin(2*pi*2*t);
S2 = 1*sin(2*pi*120*t);
S3 = S1+S2;

figure
subplot(311)
plot(t,S1)
ylabel('S1 X(t)')

subplot(312)
plot(t,S2)
ylabel('S2 X(t)')

subplot(313)
plot(t,S3)
xlabel('t (milliseconds)')
ylabel('S1+S2 X(t)')



