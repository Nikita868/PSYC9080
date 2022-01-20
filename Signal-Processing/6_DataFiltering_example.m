%% Example 1: Zero-phase filter a noisy ECG waveform using the Butterworth filter.

load noisysignals x; % load noisy waveform

% Specify conventional 12-th order Butterworth low-pass filter with cutoff frequency of 10 Hz. 
Fs = 100; % sampling frequency
Fc = 10;
order = 12;
[b,a] = butter(order,Fc/(Fs/2),'low'); % IIR filter design

% zero-phase filtering
y = filtfilt(b,a,x);
% conventional filtering
y2 = filter(b,a,x);   

% Plot results
plot(x,'k-.'); grid on ; hold on
plot([y y2],'LineWidth',1.5);
legend('Noisy ECG','Zero-phase Filtering','Conventional Filtering');

% When the conventional filter is applied forward and backward, dual-pass
% filter, then it's order doubles, e.g., now, we have 24-th order
% Butterworth filter at 10 Hz.


%% Example 2: Zero-phase filter 
load IsometricForce.mat; % load force data

% plot raw data
figure
plot(t,force)
hold; grid on
plot(t,start)
ylabel('Force (N)')
xlabel('Time (s)')

% let's focus on the part of the trial where force is constant.
force_iso = force(300:end);
t_iso = t(300:end);

% Design second-order 10 Hz low-pass filter
Fs = 500;
Fc = 10;
order = 2;
[b,a] = butter(order,Fc/(Fs/2),'low'); 

% zero-phase filtering
force_iso_filt = filtfilt(b,a,force_iso);

figure
plot(t_iso,force_iso)
hold; grid on
plot(t_iso,force_iso_filt,'linewidth',1.5)
ylabel('Force (N)')
xlabel('Time (s)')
legend('Raw','Filtered')

%% How to choose filter cut-off? 

% Method 1: look at the power spectrum of the raw signal: Noise is typically high-frequency

% Normalize to mean 0 and SD = 1
force_iso_norm = normalize(force_iso); 
L = length(force_iso_norm); % get lenght of the signal

% Apply Hanning window before FFT
force_iso_norm_window = hann(L).*force_iso_norm;

% Perform power spectral density estimation:
PSD(normalize(force_iso_norm_window),500)

% Which cut-off frequency would you choose? :)

%% Method 2: Residual analsysis

% The main idea here is to check how the differences betwen the raw and
% filtered signal are distributed. If the filter removes noise, then you
% would expect that the residuals are random over and have a normal
% distribution.

figure
subplot(311)
plot(t_iso,force_iso)
hold; grid on
plot(t_iso,force_iso_filt,'linewidth',1.5)
ylabel('Force (N)')
xlabel('Time (s)')

subplot(312)
plot(t_iso,force_iso-force_iso_filt)
ylabel('Raw-Filtered residual (N)')
xlabel('Time (s)')

subplot(313)
hist(force_iso-force_iso_filt,50)

% This is the code for the residual analysis:

Fs = 500;
order = 2;

Fc_range = 1:0.5:50; % specify range of cut-off frequencies to analyze

for i = 1:length(Fc_range) 
    
    % Design filter
    [b,a] = butter(order,Fc_range(i)/(Fs/2),'low'); 

    % zero-phase filtering
    force_iso_filt = filtfilt(b,a,force_iso);    

    % sum of squared residuals
    residual(i) = sum((force_iso-force_iso_filt).^2);
    
end

figure
plot(Fc_range,residual,'-o')
xlabel('Fc')
ylabel('Residual')
hold on; grid on

% Pick cut-off when at the value of the residual where it drops to 95% of
% its initial value. This is a very simple strategy to pick the cut-off and
% there are more sophisticated methods, but they are also subjective (why
% 95% for example?)

threshold = residual(1) - (residual(1)-residual(end))*.95;

% plot the frequency cut-off value that exceeds the threshold in red
[j] = find(residual<threshold);
plot(Fc_range(j(1)),residual(j(1)),'-or')



% Example 3: Detecting onsets... need a critically damped filter
% See here for how to code one: https://motorbehaviour.wordpress.com/2015/06/12/solving-the-underdamped-response-of-butterworth-filters-with-critically-damped-filters/

% Design second-order 10 Hz low-pass filter
Fs = 500;
Fc = 10;
order = 2;
[b,a] = butter(order,Fc/(Fs/2),'low'); 

% zero-phase filtering
force_filt = filtfilt(b,a,force);

% plot restuls of the filtered vs. raw data
figure
plot(t,force)
hold; grid on
plot(t,force_filt,'linewidth',1.5)
ylabel('Force (N)')
xlabel('Time (s)')
