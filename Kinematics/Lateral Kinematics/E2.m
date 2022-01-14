function E2 = E2(r1,r2,r3,r7,r8,r4,r6,th1,th4,th2)
%E2

Ex = (r1*cos(-th1) + r7*cos(-th1) - r8*cos(-th4) - r4*cos(-th4) - r6*cos(pi-(th2+r3/r2)));

Ey = (r1*sin(-th1) + r7*sin(-th1) - r8*sin(-th4) - r4*sin(-th4) - r6*sin(pi-(th2+r3/r2)));

E2 = [Ex;Ey];
end

