function J_roll = J_roll(r2,r3,r4,r8,th2,th3,th4,th8)
%J_ROLL 
Jx = [-r4*sin(th4) (-r3*sin(th3) + r2*sin(th2) + r8*sin(th8))];
Jy = [r4*cos(th4) (r3*cos(th3) - r2*cos(th2) - r8*cos(th8))];
J_roll = [Jx;Jy]; 
end

