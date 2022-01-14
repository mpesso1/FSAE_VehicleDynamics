function [r3,th3] = get_r3(r1,r2,r4,th1,th2,th4)
%GET_R3 Summary of this function goes here
%   Detailed explanation goes here
r3x = r4*cos(th4) - (r1*cos(th1) + r2*cos(th2));
r3y = r4*sin(th4) - (r1*sin(th1) + r2*sin(th2));
r3 = sqrt(r3x^2+r3y^2);
th3 = atan2(r3y,r3x);
end

