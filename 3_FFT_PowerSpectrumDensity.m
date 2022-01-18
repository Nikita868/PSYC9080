%% PSD in Matlab
% https://www.mathworks.com/help/signal/ug/power-spectral-density-estimates-using-fft.html

%% Generate sine wave 
Fs = 1000;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = 1500;             % Length of signal
t = (0:L-1)*T;        % Time vector

% Sine wave parameters
a = 1;
A = 2;
f = 50; % in Hz
theta = -pi/4; % in rad

% Generate sine wave consisting of 50 Hz and 120 Hz components
S = 1*sin(50*pi*2*t) + .5*sin(2*pi*120*t);

%% PSD Part

% FFT command
Y = fft(S)

% power spectrum
P2 = (abs(Y).^2)/(L*Fs);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

f = Fs*(0:(L/2))/L;

figure
plot(f,P1)
grid on
title('Periodogram Using FFT')
xlabel('Frequency (Hz)')
ylabel('Power Spectrum Density (original units^2/Hz)')