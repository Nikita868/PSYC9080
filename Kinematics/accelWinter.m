function a = accelWinter(data,Hz)
% Function to calculate 3-point acceleration estimate described in Winter
% (2009) p. 78
% Winter, D. A. (2009). Biomechanics and motor control of human movement. John Wiley & Sons.
% 
% Inputs:
%       data: data in column (N,1)
%       Hz: frequency of sampling
% Outputs:
%       V: 3-point velocity estimate

for i = 2:length(data)-1
    a(i) = (data(i+1)-2*data(i)+data(i-1))/(1/Hz)^2; 
end

a(i+1) = NaN;
a(1) = NaN;

end