function J1 = J1(r4,th4,r2,th2,r3,th3)
%J1

Jx = [r4*sin(th4), (-r2*sin(th2) + r3*sin(th3))];

Jy = [-r4*cos(th4), (r2*cos(th2) - r3*cos(th3))];

J1 = [Jx; Jy];
end

