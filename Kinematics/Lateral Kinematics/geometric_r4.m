function [r4] = geometric_r4(r1,th1,r2,th2,r5,th5,r3,th3)
%MAKE_TIRE_INTITIALLY_VERTICLE purpose is to make parameters work with
%initially set variables through geometric constraints.  This will take the
%initial estimate of th4 and use it to make the initial length of r4 allow
%the formulation to converge.

r4x = (r1*cos(th1)-r5*cos(th5)-r3*cos(th3)-r2*cos(th2));
r4y = r2*sin(th2) + r1*sin(th1) - r5*sin(th5) - r3*sin(th3);
r4 = sqrt(r4x^2 + r4y^2);
end

