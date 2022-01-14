function E_roll = E_roll(r2,r3,r4,r6,r7,r8,th2,th3,th4,th6,th7,th8)
%E_ROLL 
Ex = r7*cos(th7) + r4*cos(th4) + r3*cos(th3) - r2*cos(th2) - r8*cos(th8) - r6*cos(th6);
Ey = r7*sin(th7) + r4*sin(th4) + r3*sin(th3) - r2*sin(th2) - r8*sin(th8) - r6*sin(th6);
E_roll = [Ex;Ey];
end

