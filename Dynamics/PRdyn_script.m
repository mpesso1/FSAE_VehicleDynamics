ft = linspace(1,2,25);
f = 2*ft;

tspan = [0 30];
[tpA,yA] = ode45(@(t,y) PRdyn(t,y,ft,f),tspan,[0 0 0],.01);
% y(1) --> displacement of spring
% y(2) --> momentum of tire
% y(3) --> displacement of tire

figure(1)
plot(tpA,yA(:,3))
title("Displacement of Tire");

figure(2)
plot(tpA,yA(:,2))
title("Momentum of Tire");

figure(3)
plot(tpA,yA(:,1))
title("Displacement of Spring");
