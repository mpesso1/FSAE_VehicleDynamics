function E = E1(r1,r2,r3,r4,r5,th1,th2,th3,th4,th5)
%E

Ex = (r1*cos(th1) + r2*cos(th2) - r3*cos(th3) - r4*cos(th4) - r5*cos(th5));

Ey = (r1*sin(th1) + r2*sin(th2) - r3*sin(th3) - r4*sin(th4) - r5*sin(th5));

E =  [Ex;Ey];
end

