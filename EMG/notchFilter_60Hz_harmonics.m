function data_filt4 = notchFilter_60Hz_harmonics(data,Fs)

% notch filter 60 Hz
d1 = designfilt('bandstopiir','FilterOrder',4, ...
               'HalfPowerFrequency1',59,'HalfPowerFrequency2',61, ...
               'DesignMethod','butter','SampleRate',Fs);
data_filt1 = filtfilt(d1,data);

% notch filter 120 Hz
d2 = designfilt('bandstopiir','FilterOrder',4, ...
               'HalfPowerFrequency1',119,'HalfPowerFrequency2',121, ...
               'DesignMethod','butter','SampleRate',Fs);
           
data_filt2 = filtfilt(d2,data_filt1);

% notch filter 180 Hz
d3 = designfilt('bandstopiir','FilterOrder',4, ...
               'HalfPowerFrequency1',179,'HalfPowerFrequency2',181, ...
               'DesignMethod','butter','SampleRate',Fs);

data_filt3 = filtfilt(d3,data_filt2);

% notch filter 240 Hz
d4 = designfilt('bandstopiir','FilterOrder',4, ...
               'HalfPowerFrequency1',239,'HalfPowerFrequency2',241, ...
               'DesignMethod','butter','SampleRate',Fs);

data_filt4 = filtfilt(d4,data_filt3); 

end