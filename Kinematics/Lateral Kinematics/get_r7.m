function [r7,th7] = get_r7(track,rch,r2,r8,r3,r4,th3,th4)
%GET_R7 
r7x = track/2 -r3*cos(th3) - r4*cos(th4);
r7y = (r2+r8) - rch - r3*sin(th3) - r4*sin(th4);
r7 = sqrt(r7x^2 + r7y^2);
th7 = atan2(r7y,r7x);
end

