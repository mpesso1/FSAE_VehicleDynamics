function joint = get_joints(r1,r2,r3,r4,th1,th2,th3,th4)
%GET_JOINTS 
j0x = 0;
j0y = 0;

j1x = r1*cos(th1);
j1y = r1*sin(th1);

j2x = j1x+r2*cos(th2);
j2y = j1y+r2*sin(th2);

j3x = j2x+r3*cos(th3);
j3y = j2y+r3*sin(th3);

j4x = j3x-r4*cos(th4);
j4y = j3y-r4*sin(th4);

joint = [j0x j0y; j1x j1y; j2x j2y; j3x j3y; j4x j4y];

end

