% force generated on spring
%force_front = ks*(PotFrontRightmm-90)*10^-3; % Actual forces experianced by springs
%force_back = ks*(PotBackRightmm-90)*10^-3;
t = linspace(0,60,460)'; %for car test data -- Simulink
%forcef = [t,force_front]; %for car test data -- Simulink
%forceb = [t,force_back];


x = @(t) exp(t)
plot(t,2*t.^2,'o')