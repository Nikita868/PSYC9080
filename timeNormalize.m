function [normData] = timeNormalize(data,N)
% Cubic-fit spline interpolation. This normalizes the
% timing across trials to 100 points. See dissertation by Yang (2007) p.
% 126 for reference.
% Inputs: data - single column of data (no Nans allowed
%         N - length of the normalization (typically 100 or 200)

normData = spline(1:length(data),data,linspace(1,length(data),N));
end
