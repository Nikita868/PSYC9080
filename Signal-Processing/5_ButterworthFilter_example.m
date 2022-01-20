% Example code for specifying Butterworth filter

% Butter.m is the function for generating coefficients for this filter
help butter

% Settings for second-order 2nd-order low-pass Butterworth filter
Fs = 60; % sampling frequency
Fc = 2; % cut-off frequency
order = 2;

% Get coefficients of the filter
[b,a] = butter(order,Fc/(Fs/2),'low');

% visualize filter's frequency response
h = fvtool(b,a);

% apply filter to synthetic signal sine with noise
load NoisySine.mat

% zero-phase application of the filter (forward and backward; dual-pass).
% Note that applying the filter twice doubles the order of the filter,
% resulting the the 4th order filter.

help filtfilt % function for dual-pass filtering
y = filtfilt(b,a,x);

figure; 
plot(t,x)
hold
plot(t,y,'linewidth',1.5)


%% Let's try a high-pass filter with the same cut-off frequency

% Settings
Fs = 60; % sampling frequency
Fc = 2; % cut-off frequency
order = 2;

% Get coefficients
[b,a] = butter(order,Fc/(Fs/2),'high');

% visualize filter's frequency response
h = fvtool(b,a);

y = filtfilt(b,a,x);

% Notice - the filtered part represents the high-frequency noise
figure; 
plot(t,x)
hold
plot(t,y,'linewidth',1.5)