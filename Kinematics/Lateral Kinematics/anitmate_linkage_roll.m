function anitmate_linkage_roll(j0x,j0y,j1x,j1y,j2x,j2y,j3x,j3y,j4x,j4y,j5x,j5y,j6x,j6y)
%ANITMATE_LINKAGE Summary of this function goes here
%   Detailed explanation goes here
figure(1)
plot([j0x j1x],[j0y j1y],[j1x j2x], [j1y j2y], [j2x j3x], [j2y j3y],[j3x j4x], [j3y j4y], [j4x j5x], [j4y j5y], [j5x j6x], [j5y j6y],'LineWidth',3);
hold on
title('2D Lateral Visual of Aarm Suspension')
grid on
axis equal
% axis([-20 12 -5 15])
drawnow;
hold off
end

