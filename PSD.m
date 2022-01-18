function [f,P1] = PSD(x,Fs)
L = length(x); 

%%% Enter power spectral density code here
% FFT command
Y = fft(x);

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

end


