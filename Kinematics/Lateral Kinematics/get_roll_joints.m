function joint = get_roll_joints(r2,r3,r4,r6,r7,r8,th2,th3,th4,th6,th7,th8)
%GET_JOINTS 
j0x = 0;
j0y = 0;

j1x = r7*cos(th7);
j1y = r7*sin(th7);

j2x = j1x+r4*cos(th4);
j2y = j1y+r4*sin(th4);

j3x = j2x+r3*cos(th3);
j3y = j2y+r3*sin(th3);

j4x = j3x-r2*cos(th2);
j4y = j3y-r2*sin(th2);

j5x = j4x-r8*cos(th8);
j5y = j4y-r8*sin(th8);

j6x = j5x-r6*cos(th6);
j6y = j5y-r6*sin(th6);

joint = [j0x j0y; j1x j1y; j2x j2y; j3x j3y; j4x j4y; j5x j5y; j6x j6y];

end

