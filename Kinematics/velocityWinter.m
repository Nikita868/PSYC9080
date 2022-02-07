function V = velocityWinter(data,Hz)
% Function to calculate 3-point velocity estimate described in Winter (2009) p. 77
% Winter, D. A. (2009). Biomechanics and motor control of human movement. John Wiley & Sons.
% Used when calculating velocity from position for example.

for i = 2:length(data)-1
    V(i) = (data(i+1)-data(i-1))/(2*(1/Hz)); 
end

V(i+1) = NaN;
V(1) = NaN;

end