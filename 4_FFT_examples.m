%% Example FFTs of different signals

% Example 1: Center of pressure during quiet stance:

% Import postural sway (https://peerj.com/articles/3626/)

% Selecct the net COP signal in AP direction
S = PDS01CF1grf.COPNET_X;

% normalize to mean 0 and SD = 1
S_norm = normalize(S); 
L = length(S_norm) % get lenght of the signal

% Apply Hanning window 
S_norm_window = hann(L).*S_norm;

% PSD of normalized and windowed signal; Note that you should have the PSD
% function located on your Matlab path.
[f,Y] = PSD(S_norm_window,100);


% Examle 2: EMG 

