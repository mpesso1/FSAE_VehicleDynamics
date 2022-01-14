function anitmate_linkage(j0x,j0y,j1x,j1y,j2x,j2y,j3x,j3y,j4x,j4y,j5x,j5y,rc_x,rc,d,r1,th1)
%ANITMATE_LINKAGE Summary of this function goes here
%   Detailed explanation goes here
figure(1)
plot([j0x j1x],[j0y j1y],[j1x j2x], [j1y j2y], [j2x j3x], [j2y j3y],[j3x j4x], [j3y j4y], [j4x j5x], [j4y j5y],'LineWidth',3);
hold on
title('2D Lateral Visual of Aarm Suspension')
plot([j0x r1*cos(th1)],[j0y r1*sin(th1)-d],[r1*cos(th1) -rc_x+r1*cos(th1)],[r1*sin(th1)-d r1*sin(th1)-d],[-rc_x+r1*cos(th1) -rc_x+r1*cos(th1)],[r1*sin(th1)-d rc-r1*sin(-th1)-d],'LineWidth',1)
grid on
axis equal
axis([-20 20 -5 21])
drawnow;
hold off
end

