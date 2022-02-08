function X = cubicSpline(X)
% Use cubic spline to interpolate over missing values in data (defined as
% NaNs)

% See INTERP1 for more info

X(X == 0) = NaN;
X(isnan(X)) = interp1(find(~isnan(X)), X(~isnan(X)), find(isnan(X)),'spline');
  
return