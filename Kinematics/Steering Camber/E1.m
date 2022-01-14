function E1 = E1(r1,r2,r3,r4,th1,th2,th3,th4)
%E1 
Ex = r1*cos(th1) + r2*cos(th2) + r3*cos(th3) - r4*cos(th4);
Ey = r1*sin(th1) + r2*sin(th2) + r3*sin(th3) - r4*sin(th4);

E1 = [Ex;Ey];
end

