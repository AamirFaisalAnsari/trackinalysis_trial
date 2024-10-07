function a=linear_nan_fill(a)
%a=[nan,nan,nan,nan,1,2,nan,3,nan,4,5,6,nan,nan,6,nan,nan,nan,nan,nan];
%%interpolate
x = 1:length(a) ;
a(isnan(a)) = interp1(x(~isnan(a)),a(~isnan(a)),x(isnan(a))) ;
