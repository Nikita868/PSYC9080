function [normData] = timeNormalize(data)

% Cubic-fit spline interpolation. This normalizes the
% timing across trials to 100 points. See dissertation by Yang (2007) p.
% 126 for reference.

normData = spline(1:length(data),data,linspace(1,length(data),100));
end
