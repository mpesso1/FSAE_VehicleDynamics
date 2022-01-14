function anitmate_linkage(j0x,j0y,j1x,j1y,j2x,j2y,j3x,j3y,j4x,j4y)
%ANITMATE_LINKAGE Summary of this function goes here
%   Detailed explanation goes here
figure(1)
plot([j0x j1x],[j0y j1y],'o');
hold on
plot([j1x j2x], [j1y j2y],'LineWidth',1);
plot([j2x j3x], [j2y j3y],'o')
plot([j3x j4x], [j3y j4y],'LineWidth',1);
title('2D Longitudinal Visual of Aarm Suspension')
grid on
axis equal
axis([-10 10 -5 15])
drawnow;
hold off
end

